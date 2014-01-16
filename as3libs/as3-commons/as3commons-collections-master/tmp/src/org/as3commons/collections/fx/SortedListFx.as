/**
 * Copyright 2010 The original author or authors.
 * 
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 *   http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.as3commons.collections.fx {
	import org.as3commons.collections.SortedList;
	import org.as3commons.collections.framework.IComparator;
	import org.as3commons.collections.framework.ICollectionFx;
	import org.as3commons.collections.fx.events.CollectionEvent;
	import org.as3commons.collections.fx.events.ListEvent;

	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;

	/**
	 * Bindable version of the <code>SortedList</code> implementation.
	 * 
	 * <p><strong><code>SortedListFx</code> event kinds</strong></p>
	 * 
	 * <ul>
	 * <li><code>CollectionEvent.ITEM_ADDED</code></li>
	 * <li><code>CollectionEvent.ITEM_REMOVED</code></li>
	 * <li><code>CollectionEvent.RESET</code></li>
	 * </ul>
	 * 
	 * <p id="link_SortedListFxExample"><strong>SortedListFx example</strong></p>
	 * 
	 * <a class="exampleCollapsed" href="#link_SortedListFxExample" onClick="toggleExample(this, 'SortedListFxExample');">Show example</a><br /><div id="SortedListFxExample" style='display:none'><listing version="3.0">package {
    import org.as3commons.collections.fx.SortedListFx;
    import org.as3commons.collections.fx.events.CollectionEvent;
    import org.as3commons.collections.fx.events.ListEvent;
    import org.as3commons.collections.utils.NumericComparator;
    import flash.display.Sprite;

    public class SortedListFxExample extends Sprite {

        public function SortedListFxExample() {
            var list : SortedListFx = new SortedListFx(new NumericComparator());
            list.addEventListener(CollectionEvent.COLLECTION_CHANGED, changedHandler);
            
            list.array = [4, 2, 3, 1, 2, 6, 8, 4];
            list.add(5);
            list.add(2);
            list.add(2);
            list.add(1);

            list.removeFirst();
            list.removeLast();
            list.removeAt(5);
            list.removeAt(12); // no event (index &gt; list.size)
            list.removeAllAt(4, 2);

            list.remove(6);
            list.removeAll(2);
            list.removeAll(10); // no event (10 not contained)

            list.clear();

            // Reset                   [1 2 2 3 4 4 6 8]
            // [5] added at 6          [1 2 2 3 4 4 5 6 8]
            // [2] added at 3          [1 2 2 2 3 4 4 5 6 8]
            // [2] added at 4          [1 2 2 2 2 3 4 4 5 6 8]
            // [1] added at 1          [1 1 2 2 2 2 3 4 4 5 6 8]
            // [1] removed at 0        [1 2 2 2 2 3 4 4 5 6 8]
            // [8] removed at 10       [1 2 2 2 2 3 4 4 5 6]
            // [3] removed at 5        [1 2 2 2 2 4 4 5 6]
            // [2,4] removed at 4      [1 2 2 2 4 5 6]
            // [6] removed at 6        [1 2 2 2 4 5]
            // [2] removed at 1        [1 2 2 4 5]
            // [2] removed at 1        [1 2 4 5]
            // [2] removed at 1        [1 4 5]
            // Reset                   []
        }
        
        private function changedHandler(e : ListEvent) : void {
            var info : String = "";
            var items : *;
            
            switch (e.kind) {
                case CollectionEvent.ITEM_ADDED:
                    items = e.numItems == 1 ? e.item : e.items;
                    info += "[" + items + "] added at " + e.index;
                    break;

                case CollectionEvent.ITEM_REMOVED:
                    items = e.numItems == 1 ? e.item : e.items;
                    info += "[" + items + "] removed at " + e.index;
                    break;

                case CollectionEvent.ITEM_REPLACED:
                    info += "[" + e.item + "] replaced at " + e.index;
                    break;

                case CollectionEvent.RESET:
                    info += ("Reset");
                    break;
            }
            
            for (var i : uint = info.length; i &lt; 24; i++) info += " ";
            info += "[" + e.list.toArray().join(" ") + "]";
            trace (info);
        }
    }
}
</listing></div>
	 * 
	 * @author Jens Struwe 22.03.2010
	 * @see org.as3commons.collections.fx.events.ListEvent ListEvent - Description of the list event properties.
	 * @see org.as3commons.collections.SortedList SortedList - SortedList description and usage examples.
	 */
	public class SortedListFx extends SortedList implements ICollectionFx {

		/**
		 * Event dispatcher.
		 */
		private var _eventDispatcher : IEventDispatcher;
		
		/**
		 * SortedListFx constructor.
		 * 
		 * @param comparator The sort criterion.
		 */
		public function SortedListFx(comparator : IComparator = null) {
			_eventDispatcher = new EventDispatcher(this);

			super(comparator);
		}
		
		/*
		 * IList
		 */

		/**
		 * @inheritDoc
		 */
		override public function set array(array : Array) : void {
			super.array = array;
			dispatchEvent(new ListEvent(CollectionEvent.RESET, this));
		}

		/**
		 * @inheritDoc
		 */
		override public function add(item : *) : uint {
			var index : uint = super.add(item);
			dispatchEvent(new ListEvent(
				CollectionEvent.ITEM_ADDED,
				this,
				index,
				1,
				item,
				null
			));
			return index;
		}

		/**
		 * @inheritDoc
		 */
		override public function removeFirst() : * {
			var item : * = super.removeFirst();
			if (item !== undefined) dispatchEvent(new ListEvent(
				CollectionEvent.ITEM_REMOVED,
				this,
				0,
				1,
				item,
				null
			));
			return item;
		}

		/**
		 * @inheritDoc
		 */
		override public function removeLast() : * {
			var item : * = super.removeLast();
			if (item !== undefined) dispatchEvent(new ListEvent(
				CollectionEvent.ITEM_REMOVED,
				this,
				_array.length,
				1,
				item,
				null
			));
			return item;
		}

		/**
		 * @inheritDoc
		 */
		override public function removeAt(index : uint) : * {
			var item : * = super.removeAt(index);
			if (item !== undefined) dispatchEvent(new ListEvent(
				CollectionEvent.ITEM_REMOVED,
				this,
				index,
				1,
				item,
				null
			));
			return item;
		}

		/**
		 * @inheritDoc
		 */
		override public function removeAllAt(index : uint, numItems : uint) : Array {
			var items : Array = super.removeAllAt(index, numItems);
			if (items.length) dispatchEvent(new ListEvent(
				CollectionEvent.ITEM_REMOVED,
				this,
				index,
				items.length,
				null,
				items
			));
			return items;
		}

		/*
		 * ICollection
		 */

		/**
		 * @inheritDoc
		 */
		override public function clear() : Boolean {
			var removed : Boolean = super.clear();
			if (removed) dispatchEvent(new ListEvent(CollectionEvent.RESET, this));
			return removed;
		}

		/*
		 * IEventDispatcher
		 */
		
		/**
		 * @inheritDoc
		 */
		public function dispatchEvent(event : Event) : Boolean {
			return _eventDispatcher.dispatchEvent(event);
		}
		
		/**
		 * @inheritDoc
		 */
		public function hasEventListener(type : String) : Boolean {
			return _eventDispatcher.hasEventListener(type);
		}
		
		/**
		 * @inheritDoc
		 */
		public function willTrigger(type : String) : Boolean {
			return _eventDispatcher.willTrigger(type);
		}
		
		/**
		 * @inheritDoc
		 */
		public function removeEventListener(type : String, listener : Function, useCapture : Boolean = false) : void {
			_eventDispatcher.removeEventListener(type, listener, useCapture);
		}
		
		/**
		 * @inheritDoc
		 */
		public function addEventListener(type : String, listener : Function, useCapture : Boolean = false, priority : int = 0, useWeakReference : Boolean = false) : void {
			_eventDispatcher.addEventListener(type, listener, useCapture, priority, useWeakReference);
		}

		/*
		 * Protected
		 */

		/**
		 * @inheritDoc
		 */
		override protected function itemRemoved(index : uint, item : *) : void {
			dispatchEvent(new ListEvent(
				CollectionEvent.ITEM_REMOVED,
				this,
				index,
				1,
				item,
				null
			));
		}

	}
}
