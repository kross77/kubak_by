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
	import org.as3commons.collections.ArrayList;
	import org.as3commons.collections.framework.IComparator;
	import org.as3commons.collections.framework.ICollectionFx;
	import org.as3commons.collections.fx.events.CollectionEvent;
	import org.as3commons.collections.fx.events.ListEvent;

	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;

	/**
	 * @eventType org.as3commons.collections.fx.events.CollectionEvent.COLLECTION_CHANGED
	 */
	[Event(name="collectionChanged", type="org.as3commons.collections.fx.events.ListEvent")]

	/**
	 * Bindable version of the <code>ArrayList</code> implementation.
	 * 
	 * <p><strong><code>ArrayListFx</code> event kinds</strong></p>
	 * 
	 * <ul>
	 * <li><code>CollectionEvent.ITEM_ADDED</code></li>
	 * <li><code>CollectionEvent.ITEM_REPLACED</code></li>
	 * <li><code>CollectionEvent.ITEM_REMOVED</code></li>
	 * <li><code>CollectionEvent.RESET</code></li>
	 * </ul>
	 * 
	 * <p>The <code>ArrayList</code> offers two bulk methods to add or remove
	 * a list of items (<code>addAllAt(), removeAllAt()</code>) in one step.
	 * In response to either of those operations the event property <code>CollectionEvent.items</code>
	 * is set. In all other cases of adding, removing or replacing of items the
	 * event property <code>CollectionEvent.item</code> is set.</p>
	 * 
	 * <p id="link_ArrayListFxExample"><strong>ArrayListFx example</strong></p>
	 * 
	 * <a class="exampleCollapsed" href="#link_ArrayListFxExample" onClick="toggleExample(this, 'ArrayListFxExample');">Show example</a><br /><div id="ArrayListFxExample" style='display:none'><listing version="3.0">package {
    import org.as3commons.collections.fx.ArrayListFx;
    import org.as3commons.collections.fx.events.CollectionEvent;
    import org.as3commons.collections.fx.events.ListEvent;
    import org.as3commons.collections.utils.NumericComparator;
    import flash.display.Sprite;

    public class ArrayListFxExample extends Sprite {

        public function ArrayListFxExample() {
            var list : ArrayListFx = new ArrayListFx();
            list.addEventListener(CollectionEvent.COLLECTION_CHANGED, changedHandler);
            
            list.add(1);
            list.addAllAt(1, [2, 2, 4, 4, 5, 5, 6, 6, 8, 8]);
            list.addFirst(10);
            list.addLast(12);

            list.replaceAt(3, 2); // no event (item at 3 is already 2)
            list.replaceAt(6, 2);
            list.replaceAt(7, 2);

            list.removeFirst();
            list.removeLast();
            list.removeAt(2);
            list.removeAt(12); // no event (index &gt; list.size)
            list.removeAllAt(2, 2);

            list.remove(6);
            list.removeAll(2);
            list.removeAll(10); // no event (10 not contained)

            list.reverse();
            list.sort(new NumericComparator());
            list.array = [1, 2, 3, 4, 5];

            list.clear();

            // [1] added at 0                        [1]
            // [2,2,4,4,5,5,6,6,8,8] added at 1      [1 2 2 4 4 5 5 6 6 8 8]
            // [10] added at 0                       [10 1 2 2 4 4 5 5 6 6 8 8]
            // [12] added at 12                      [10 1 2 2 4 4 5 5 6 6 8 8 12]
            // [2] replaced at 6                     [10 1 2 2 4 4 2 5 6 6 8 8 12]
            // [2] replaced at 7                     [10 1 2 2 4 4 2 2 6 6 8 8 12]
            // [10] removed at 0                     [1 2 2 4 4 2 2 6 6 8 8 12]
            // [12] removed at 11                    [1 2 2 4 4 2 2 6 6 8 8]
            // [2] removed at 2                      [1 2 4 4 2 2 6 6 8 8]
            // [4,4] removed at 2                    [1 2 2 2 6 6 8 8]
            // [6] removed at 4                      [1 2 2 2 6 8 8]
            // [2] removed at 1                      [1 2 2 6 8 8]
            // [2] removed at 1                      [1 2 6 8 8]
            // [2] removed at 1                      [1 6 8 8]
            // Reset                                 [8 8 6 1]
            // Reset                                 [1 6 8 8]
            // Reset                                 [1 2 3 4 5]
            // Reset                                 []
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
            
            for (var i : uint = info.length; i &lt; 38; i++) info += " ";
            info += "[" + e.list.toArray().join(" ") + "]";
            trace (info);
        }
    }
}
</listing></div>
	 * 
	 * @author Jens Struwe 01.03.2010
	 * @see org.as3commons.collections.fx.events.ListEvent ListEvent - Description of the list event properties.
	 * @see org.as3commons.collections.ArrayList ArrayList - ArrayList description and usage examples.
	 */
	public class ArrayListFx extends ArrayList implements ICollectionFx {

		/**
		 * Event dispatcher.
		 */
		private var _eventDispatcher : IEventDispatcher;
		
		/**
		 * ArrayListFx constructor.
		 */
		public function ArrayListFx() {
			_eventDispatcher = new EventDispatcher(this);
		}

		/*
		 * IOrderedList
		 */

		/**
		 * @inheritDoc
		 */
		override public function addFirst(item : *) : void {
			super.addFirst(item);
			dispatchEvent(new ListEvent(
				CollectionEvent.ITEM_ADDED,
				this,
				0,
				1,
				item,
				null
			));
		}
		
		/**
		 * @inheritDoc
		 */
		override public function addLast(item : *) : void {
			super.addLast(item);
			dispatchEvent(new ListEvent(
				CollectionEvent.ITEM_ADDED,
				this,
				_array.length - 1,
				1,
				item,
				null
			));
		}

		/**
		 * @inheritDoc
		 */
		override public function addAt(index : uint, item : *) : Boolean {
			var added : Boolean = super.addAt(index, item);
			if (added) dispatchEvent(new ListEvent(
				CollectionEvent.ITEM_ADDED,
				this,
				index,
				1,
				item,
				null
			));
			return added;
		}
		
		/**
		 * @inheritDoc
		 */
		override public function addAllAt(index : uint, items : Array) : Boolean {
			var added : Boolean = super.addAllAt(index, items);
			if (added) dispatchEvent(new ListEvent(
				CollectionEvent.ITEM_ADDED,
				this,
				index,
				items.length,
				null,
				items
			));
			return added;
		}
		
		/**
		 * @inheritDoc
		 */
		override public function replaceAt(index : uint, item : *) : Boolean {
			var replaced : Boolean = super.replaceAt(index, item);
			if (replaced) dispatchEvent(new ListEvent(
				CollectionEvent.ITEM_REPLACED,
				this,
				index,
				1,
				item,
				null
			));
			return replaced;
		}

		/**
		 * @inheritDoc
		 */
		override public function reverse() : Boolean {
			var reversed : Boolean = super.reverse();
			if (reversed) dispatchEvent(new ListEvent(CollectionEvent.RESET, this));
			return reversed;
		}

		/**
		 * @inheritDoc
		 */
		override public function sort(comparator : IComparator) : Boolean {
			var sorted : Boolean = super.sort(comparator);
			if (sorted) dispatchEvent(new ListEvent(CollectionEvent.RESET, this));
			return sorted;
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
