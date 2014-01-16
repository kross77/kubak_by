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
	import org.as3commons.collections.Map;
	import org.as3commons.collections.framework.ICollectionFx;
	import org.as3commons.collections.fx.events.CollectionEvent;

	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;

	/**
	 * Bindable version of the <code>Map</code> implementation.
	 * 
	 * <p><strong><code>MapFx</code> event kinds</strong></p>
	 * 
	 * <ul>
	 * <li><code>CollectionEvent.ITEM_ADDED</code></li>
	 * <li><code>CollectionEvent.ITEM_REPLACED</code></li>
	 * <li><code>CollectionEvent.ITEM_REMOVED</code></li>
	 * <li><code>CollectionEvent.RESET</code></li>
	 * </ul>
	 * 
	 * <p><strong>Note</strong></p>
	 * 
	 * <p>As of the absence of any order of the <code>Map</code> collection, the <code>iterator()</code>
	 * method of the event dispatched by the <code>MapFx</code> returns always <code>null</code>.</p>
	 * 
	 * <p id="link_MapFxExample"><strong>MapFx example</strong></p>
	 * 
	 * <a class="exampleCollapsed" href="#link_MapFxExample" onClick="toggleExample(this, 'MapFxExample');">Show example</a><br /><div id="MapFxExample" style='display:none'><listing version="3.0">package {
    import org.as3commons.collections.fx.MapFx;
    import org.as3commons.collections.fx.events.CollectionEvent;
    import org.as3commons.collections.fx.events.MapEvent;
    import flash.display.Sprite;

    public class MapFxExample extends Sprite {

        public function MapFxExample() {
            var map : MapFx = new MapFx();
            map.addEventListener(CollectionEvent.COLLECTION_CHANGED, changedHandler);
            
            map.add("five", 5);
            map.add("two", 2);
            map.add("threeA", "three");
            map.add("two", 2); // no event (two already contained)
            map.add("four", 4);
            map.add("threeB", "three");
            map.add("one", 1);
            map.add("threeC", "three");

            map.replaceFor("four", -4);
            map.replaceFor("one", 1); // no event (1 === 1)

            map.removeKey("one");
            map.remove(6); // no event (6 not contained)
            map.removeAll("three");

            map.clear();

            // [five=5] added                    [5]
            // [two=2] added                     [2 5]
            // [threeA=three] added              [2 5 three]
            // [four=4] added                    [2 4 5 three]
            // [threeB=three] added              [2 4 5 three three]
            // [one=1] added                     [2 4 1 5 three three]
            // [threeC=three] added              [2 three 5 three 4 1 three]
            // [four=-4] replaced                [2 three 5 three -4 1 three]
            // [one=1] removed                   [2 three 5 three -4 three]
            // [threeC=three] removed            [2 5 three -4 three]
            // [threeA=three] removed            [2 5 -4 three]
            // [threeB=three] removed            [2 5 -4]
            // Reset                             []
        }
        
        private function changedHandler(e : MapEvent) : void {
            var info : String = "";
            
            switch (e.kind) {
                case CollectionEvent.ITEM_ADDED:
                    info += "[" + e.key + "=" + e.item + "] added";
                    break;

                case CollectionEvent.ITEM_REMOVED:
                    info += "[" + e.key + "=" + e.item + "] removed";
                    break;

                case CollectionEvent.ITEM_REPLACED:
                    info += "[" + e.key + "=" + e.item + "] replaced";
                    break;

                case CollectionEvent.RESET:
                    info += ("Reset");
                    break;
            }
            
            for (var i : uint = info.length; i &lt; 34; i++) info += " ";
            info += "[" + e.map.toArray().join(" ") + "]";
            trace (info);
        }
    }
}
</listing></div>
	 * 
	 * @author Jens Struwe 24.03.2010
	 * @see org.as3commons.collections.fx.events.MapEvent MapEvent - Description of the map event properties.
	 * @see org.as3commons.collections.Map Map - Map description and usage examples.
	 */
	public class MapFx extends Map implements ICollectionFx {

		/**
		 * Event dispatcher.
		 */
		private var _eventDispatcher : IEventDispatcher;

		/**
		 * MapFx constructor.
		 */
		public function MapFx() {
			_eventDispatcher = new EventDispatcher(this);
		}
		
		/*
		 * IMap
		 */

		/**
		 * @inheritDoc
		 */
		override public function add(key : *, item : *) : Boolean {
			var added : Boolean = super.add(key, item);
			if (added) {
				dispatchEvent(new MapFxEvent(
					CollectionEvent.ITEM_ADDED,
					this,
					key,
					item
				));
			}
			return added;
		}
		
		/**
		 * @inheritDoc
		 */
		override public function replaceFor(key : *, item : *) : Boolean {
			var replaced : Boolean = super.replaceFor(key, item);
			if (replaced) {
				dispatchEvent(new MapFxEvent(
					CollectionEvent.ITEM_REPLACED,
					this,
					key,
					item
				));
			}
			return replaced;
		}
		
		/**
		 * @inheritDoc
		 */
		override public function removeKey(key : *) : * {
			var item : * = super.removeKey(key);
			if (item !== undefined) {
				dispatchEvent(new MapFxEvent(
					CollectionEvent.ITEM_REMOVED,
					this,
					key,
					item
				));
			}
			return item;
		}
		
		/**
		 * @inheritDoc
		 */
		override public function clear() : Boolean {
			var removed : Boolean = super.clear();
			if (removed) {
				dispatchEvent(new MapFxEvent(
					CollectionEvent.RESET,
					this
				));
			}
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
		override protected function itemRemoved(key : *, item : *) : void {
			dispatchEvent(new MapFxEvent(
				CollectionEvent.ITEM_REMOVED,
				this,
				key,
				item
			));
		}
	}
}

import org.as3commons.collections.framework.ICollectionIterator;
import org.as3commons.collections.framework.IMap;
import org.as3commons.collections.fx.events.MapEvent;

internal class MapFxEvent extends MapEvent {
	public function MapFxEvent(theKind : String, theMap : IMap, theKey : * = undefined, theItem : * = undefined) {
		super(theKind, theMap, theKey, theItem);
	}
	override public function iterator() : ICollectionIterator {
		return null;
	}
}
