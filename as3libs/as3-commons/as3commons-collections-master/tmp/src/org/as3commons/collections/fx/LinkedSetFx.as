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
	import org.as3commons.collections.LinkedSet;
	import org.as3commons.collections.framework.IComparator;
	import org.as3commons.collections.framework.ICollectionFx;
	import org.as3commons.collections.framework.core.LinkedNode;
	import org.as3commons.collections.framework.core.as3commons_collections;
	import org.as3commons.collections.fx.events.CollectionEvent;
	import org.as3commons.collections.fx.events.SetEvent;

	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;

	/**
	 * Bindable version of the <code>LinkedSet</code> implementation.
	 * 
	 * <p><strong><code>LinkedSetFx</code> event kinds</strong></p>
	 * 
	 * <ul>
	 * <li><code>CollectionEvent.ITEM_ADDED</code></li>
	 * <li><code>CollectionEvent.ITEM_REPLACED</code></li>
	 * <li><code>CollectionEvent.ITEM_REMOVED</code></li>
	 * <li><code>CollectionEvent.RESET</code></li>
	 * </ul>
	 * 
	 * <p id="link_LinkedSetFxExample"><strong>LinkedSetFx example</strong></p>
	 * 
	 * <a class="exampleCollapsed" href="#link_LinkedSetFxExample" onClick="toggleExample(this, 'LinkedSetFxExample');">Show example</a><br /><div id="LinkedSetFxExample" style='display:none'><listing version="3.0">package {
    import org.as3commons.collections.framework.ISetIterator;
    import org.as3commons.collections.fx.LinkedSetFx;
    import org.as3commons.collections.fx.events.CollectionEvent;
    import org.as3commons.collections.fx.events.SetEvent;
    import org.as3commons.collections.utils.NumericComparator;
    import flash.display.Sprite;

    public class LinkedSetFxExample extends Sprite {

        public function LinkedSetFxExample() {
            var theSet : LinkedSetFx = new LinkedSetFx();
            theSet.addEventListener(CollectionEvent.COLLECTION_CHANGED, changedHandler);
            
            theSet.add(1);
            theSet.add(3);
            theSet.add(2);
            theSet.add(2); // no event (2 already contained)
            
            theSet.addFirst(4);
            theSet.addLast(5);

            theSet.addBefore(2, 6);
            theSet.addAfter(2, 7);

            theSet.replace(3, 8);
            theSet.replace(1, 9);

            theSet.removeFirst();
            theSet.removeLast();
            theSet.remove(8);
            theSet.remove(6);
            theSet.remove(10); // no event (10 not contained)

            theSet.reverse();
            theSet.sort(new NumericComparator());

            theSet.clear();

            // [1] added                         [1]
            // [3] added after 1                 [1 3]
            // [2] added after 3                 [1 3 2]
            // [4] added before 1                [4 1 3 2]
            // [5] added after 2                 [4 1 3 2 5]
            // [6] added after 3 before 2        [4 1 3 6 2 5]
            // [7] added after 2 before 5        [4 1 3 6 2 7 5]
            // [8] replaced after 1 before 6     [4 1 8 6 2 7 5]
            // [9] replaced after 4 before 8     [4 9 8 6 2 7 5]
            // [4] removed before 9              [9 8 6 2 7 5]
            // [5] removed after 7               [9 8 6 2 7]
            // [8] removed after 9 before 6      [9 6 2 7]
            // [6] removed after 9 before 2      [9 2 7]
            // Reset                             [7 2 9]
            // Reset                             [2 7 9]
            // Reset                             []
        }

        private function changedHandler(e : SetEvent) : void {
            var info : String = "";
            var iterator : ISetIterator;
            
            switch (e.kind) {
                case CollectionEvent.ITEM_ADDED:
                    info += "[" + e.item + "] added";

                    iterator = e.iterator() as ISetIterator;
                    if (iterator.previousItem !== undefined) info += " after " + iterator.previousItem;
                    iterator.next();
                    if (iterator.nextItem !== undefined) info += " before " + iterator.nextItem;
                    break;

                case CollectionEvent.ITEM_REMOVED:
                    info += "[" + e.item + "] removed";

                    iterator = e.iterator() as ISetIterator;
                    if (iterator.previousItem !== undefined) info += " after " + iterator.previousItem;
                    if (iterator.nextItem !== undefined) info += " before " + iterator.nextItem;
                    break;

                case CollectionEvent.ITEM_REPLACED:
                    info += "[" + e.item + "] replaced";

                    iterator = e.iterator() as ISetIterator;
                    if (iterator.previousItem !== undefined) info += " after " + iterator.previousItem;
                    iterator.next();
                    if (iterator.nextItem !== undefined) info += " before " + iterator.nextItem;
                    break;

                case CollectionEvent.RESET:
                    info += ("Reset");
                    break;
            }
            
            for (var i : uint = info.length; i &lt; 34; i++) info += " ";
            info += "[" + e.set.toArray().join(" ") + "]";
            trace (info);
        }
    }
}
</listing></div>
	 * 
	 * @author Jens Struwe 25.03.2010
	 * @see org.as3commons.collections.fx.events.SetEvent SetEvent - Description of the set event properties.
	 * @see org.as3commons.collections.LinkedSet LinkedSet - LinkedSet description and usage examples.
	 */
	public class LinkedSetFx extends LinkedSet implements ICollectionFx {
		
		use namespace as3commons_collections;

		/**
		 * Event dispatcher.
		 */
		private var _eventDispatcher : IEventDispatcher;

		/**
		 * LinkedSetFx constructor.
		 */
		public function LinkedSetFx() {
			_eventDispatcher = new EventDispatcher(this);
		}

		/*
		 * IOrderedSet
		 */

		/**
		 * @inheritDoc
		 */
		override public function addFirst(item : *) : Boolean {
			var added : Boolean = super.addFirst(item);
			if (added) {
				dispatchEvent(new LinkedSetFxEvent(
					CollectionEvent.ITEM_ADDED,
					this,
					item,
					firstNode_internal
				));
			}
			return added;
		}
		
		/**
		 * @inheritDoc
		 */
		override public function addLast(item : *) : Boolean {
			var added : Boolean = super.addLast(item);
			if (added) {
				dispatchEvent(new LinkedSetFxEvent(
					CollectionEvent.ITEM_ADDED,
					this,
					item,
					lastNode_internal
				));
			}
			return added;
		}
		
		override public function replace(oldItem : *, item : *) : Boolean {
			var replaced : Boolean = super.replace(oldItem, item);
			if (replaced) {
				dispatchEvent(new LinkedSetFxEvent(
					CollectionEvent.ITEM_REPLACED, this,
					item,
					getNode(item)
				));
				
			}
			return replaced;
		}
		
		/**
		 * @inheritDoc
		 */
		override public function reverse() : Boolean {
			var reversed : Boolean = super.reverse();
			if (reversed) dispatchEvent(new SetEvent(CollectionEvent.RESET, this));
			return reversed;
		}

		/**
		 * @inheritDoc
		 */
		override public function sort(comparator : IComparator) : Boolean {
			var sorted : Boolean = super.sort(comparator);
			if (sorted) dispatchEvent(new SetEvent(CollectionEvent.RESET, this));
			return sorted;
		}

		/**
		 * @inheritDoc
		 */
		override public function removeFirst() : * {
			var first : LinkedNode = firstNode_internal;
			var item : * = super.removeFirst();
			if (item !== undefined) {
				dispatchEvent(new LinkedSetFxEvent(
					CollectionEvent.ITEM_REMOVED,
					this,
					first.item,
					firstNode_internal
				));
				return first.item;
			}
			return undefined;
		}
		
		/**
		 * @inheritDoc
		 */
		override public function removeLast() : * {
			var last : LinkedNode = lastNode_internal;
			var item : * = super.removeLast();
			if (item !== undefined) {
				dispatchEvent(new LinkedSetFxEvent(
					CollectionEvent.ITEM_REMOVED,
					this,
					last.item
				));
				return last.item;
			}
			return undefined;
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
				dispatchEvent(new LinkedSetFxEvent(
					CollectionEvent.ITEM_ADDED,
					this,
					item,
					getNode(item)
				));
			}
			return added;
		}
		
		/*
		 * ICollection
		 */
		
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

		/*
		 * Protected
		 */

		/**
		 * @inheritDoc
		 */
		override protected function addNodeAfter(previous : LinkedNode, node : LinkedNode) : void {
			super.addNodeAfter(previous, node);
			dispatchEvent(new LinkedSetFxEvent(
				CollectionEvent.ITEM_ADDED,
				this,
				node.item,
				node
			));
		}

		/**
		 * @inheritDoc
		 */
		override protected function addNodeBefore(next : LinkedNode, node : LinkedNode) : void {
			super.addNodeBefore(next, node);
			dispatchEvent(new LinkedSetFxEvent(
				CollectionEvent.ITEM_ADDED,
				this,
				node.item,
				node
			));
		}

		/**
		 * @inheritDoc
		 */
		override protected function removeNode(node : LinkedNode) : void {
			var nextNode : LinkedNode = node.right;
			super.removeNode(node);
			dispatchEvent(new LinkedSetFxEvent(
				CollectionEvent.ITEM_REMOVED,
				this,
				node.item,
				nextNode
			));
		}
	}
}

import org.as3commons.collections.framework.ICollectionIterator;
import org.as3commons.collections.framework.ISet;
import org.as3commons.collections.framework.core.LinkedNode;
import org.as3commons.collections.fx.events.SetEvent;

internal class LinkedSetFxEvent extends SetEvent {
	
	public var nextNode : LinkedNode;

	public function LinkedSetFxEvent(
		theKind : String,
		theSet : ISet,
		theItem : * = undefined,
		theNextNode : LinkedNode = null
	) {
		nextNode = theNextNode;
		
		super(theKind, theSet, theItem);
	}

	override public function iterator() : ICollectionIterator {
		if (kind == RESET) return null;
		
		if (nextNode) return set.iterator(nextNode.item) as ICollectionIterator;
		var iterator : ICollectionIterator = set.iterator() as ICollectionIterator;
		iterator.end();
		return iterator;
	}
}
