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
	import org.as3commons.collections.Set;
	import org.as3commons.collections.framework.ICollectionFx;
	import org.as3commons.collections.fx.events.CollectionEvent;
	import org.as3commons.collections.fx.events.SetEvent;

	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;

	/**
	 * Bindable version of the <code>Set</code> implementation.
	 * 
	 * <p><strong><code>SetFx</code> event kinds</strong></p>
	 * 
	 * <ul>
	 * <li><code>CollectionEvent.ITEM_ADDED</code></li>
	 * <li><code>CollectionEvent.ITEM_REMOVED</code></li>
	 * <li><code>CollectionEvent.RESET</code></li>
	 * </ul>
	 * 
	 * <p><strong>Note</strong></p>
	 * 
	 * <p>As of the absence of any order of the <code>Set</code> collection, the <code>iterator()</code>
	 * method of the event dispatched by the <code>SetFx</code> returns always <code>null</code>.</p>
	 * 
	 * <p id="link_SetFxExample"><strong>SetFx example</strong></p>
	 * 
	 * <a class="exampleCollapsed" href="#link_SetFxExample" onClick="toggleExample(this, 'SetFxExample');">Show example</a><br /><div id="SetFxExample" style='display:none'><listing version="3.0">package {
    import org.as3commons.collections.fx.SetFx;
    import org.as3commons.collections.fx.events.CollectionEvent;
    import org.as3commons.collections.fx.events.SetEvent;
    import flash.display.Sprite;

    public class SetFxExample extends Sprite {

        public function SetFxExample() {
            var theSet : SetFx = new SetFx();
            theSet.addEventListener(CollectionEvent.COLLECTION_CHANGED, changedHandler);
            
            theSet.add(5);
            theSet.add(2);
            theSet.add(2); // no event (2 already contained)
            theSet.add("one");
            theSet.add("four");
            theSet.add(5); // no event (5 already contained)
            theSet.add(true); // no event (5 already contained)

            theSet.remove(5);
            theSet.remove(6); // no event (6 not contained)
            theSet.remove(true);

            theSet.clear();

            // [5] added                     [5]
            // [2] added                     [2 5]
            // [one] added                   [one 2 5]
            // [four] added                  [four one 2 5]
            // [true] added                  [four one 2 true 5]
            // [5] removed                   [four one 2 true]
            // [true] removed                [four one 2]
            // Reset                         []
        }
        
        private function changedHandler(e : SetEvent) : void {
            var info : String = "";
            
            switch (e.kind) {
                case CollectionEvent.ITEM_ADDED:
                    info += "[" + e.item + "] added";
                    break;

                case CollectionEvent.ITEM_REMOVED:
                    info += "[" + e.item + "] removed";
                    break;

                case CollectionEvent.RESET:
                    info += ("Reset");
                    break;
            }
            
            for (var i : uint = info.length; i &lt; 30; i++) info += " ";
            info += "[" + e.set.toArray().join(" ") + "]";
            trace (info);
        }
    }
}
</listing></div>
	 * 
	 * @author Jens Struwe 24.03.2010
	 * @see org.as3commons.collections.fx.events.SetEvent SetEvent - Description of the set event properties.
	 * @see org.as3commons.collections.Set Set - Set description and usage examples.
	 */
	public class SetFx extends Set implements ICollectionFx {

		/**
		 * Event dispatcher.
		 */
		private var _eventDispatcher : IEventDispatcher;

		/**
		 * SetFx constructor.
		 */
		public function SetFx() {
			_eventDispatcher = new EventDispatcher(this);
		}
		
		/*
		 * ISet
		 */

		/**
		 * @inheritDoc
		 */
		override public function add(item : *) : Boolean {
			var added : Boolean = super.add(item);
			if (added) {
				dispatchEvent(new SetFxEvent(
					CollectionEvent.ITEM_ADDED,
					this,
					item
				));
			}
			return added;
		}
		
		/**
		 * @inheritDoc
		 */
		override public function remove(item : *) : Boolean {
			var removed : Boolean = super.remove(item);
			if (removed) {
				dispatchEvent(new SetFxEvent(
					CollectionEvent.ITEM_REMOVED,
					this,
					item
				));
			}
			return removed;
		}
		
		/**
		 * @inheritDoc
		 */
		override public function clear() : Boolean {
			var removed : Boolean = super.clear();
			if (removed) dispatchEvent(new SetEvent(CollectionEvent.RESET, this));
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
	}
}

import org.as3commons.collections.framework.ICollectionIterator;
import org.as3commons.collections.framework.ISet;
import org.as3commons.collections.fx.events.SetEvent;

internal class SetFxEvent extends SetEvent {
	public function SetFxEvent(theKind : String, theSet : ISet, theItem : * = undefined) {
		super(theKind, theSet, theItem);
	}
	override public function iterator() : ICollectionIterator {
		return null;
	}
}
