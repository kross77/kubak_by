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
package org.as3commons.collections {
	import org.as3commons.collections.framework.IIterator;
	import org.as3commons.collections.framework.IOrderedSet;
	import org.as3commons.collections.framework.core.AbstractLinkedCollection;
	import org.as3commons.collections.framework.core.LinkedNode;
	import org.as3commons.collections.framework.core.LinkedSetIterator;

	import flash.utils.Dictionary;

	/**
	 * Insertion order implementation of a set.
	 * 
	 * <p><strong>Description</strong></p>
	 * 
	 * <p>The <code>LinkedSet</code> is a combination of a dictionary and a linked list.</p>
	 * 
	 * <p><strong>Runtime of operations</strong></p>
	 * 
	 * <ul>
	 * <li>Adding, getting or removing of items - constant runtime O(1).<br />
	 * <code>add(), addFirst(), addLast(), first, last, removeFirst(), removeLast()</code></li>
	 * <li>Item lookup operations - constant runtime O(1).<br />
	 * addBefore(), addAfter(), has(), count(), replace(), remove()</code></li>
	 * </ul>
	 * 
	 * <p><strong>Notes</strong></p>
	 * 
	 * <p>The <code>iterator()</code> method accepts an item as the cursor parameter. If the given
	 * item is not contained by the set, it will be ignored.</p>
	 * 
	 * <p>The <code>iterator()</code> method retuns an <code>IOrderedSetIterator</code>.</p>
	 * 
	 * <p><code>null</code> is allowed.</p>
	 * 
	 * <p id="link_LinkedSetExample"><strong>LinkedSet example</strong></p>
	 * 
	 * <p>This example shows the specific behaviour of a <code>LinkedSet</code>.
	 * The general work with collections and iterators is more detailed illustrated
	 * in the <code>Set</code> and <code>ArrayList</code> examples below.</p>
	 * 
	 * <a class="exampleCollapsed" href="#link_LinkedSetExample" onClick="toggleExample(this, 'LinkedSetExample');">Show example</a><br /><div id="LinkedSetExample" style='display:none'><listing version="3.0">package {
    import org.as3commons.collections.LinkedSet;
    import org.as3commons.collections.framework.ICollectionIterator;
    import org.as3commons.collections.framework.IIterator;
    import org.as3commons.collections.framework.IMapIterator;
    import org.as3commons.collections.framework.IOrderedMapIterator;
    import flash.display.Sprite;

    public class LinkedSetExample extends Sprite {

        public function LinkedSetExample() {
            var theSet : LinkedSet = new LinkedSet();
            
            // Add
            
            theSet.add(4);
            theSet.add(1);
            theSet.add(3);
            theSet.add(5);
            theSet.add(2);
            trace (theSet.toArray()); // 4,1,3,5,2
            
            theSet.addBefore(3, 6);
            theSet.addAfter(5, 7);
            trace (theSet.toArray()); // 4,1,6,3,5,7,2

            theSet.addFirst(8);
            theSet.addLast(9);
            trace (theSet.toArray()); // 8,4,1,6,3,5,7,2,9

            // Inspection
            
            trace (theSet.first); // 8
            trace (theSet.last); // 9
            
            // Iterator

            var iterator : IIterator = theSet.iterator();
            trace (iterator is IIterator); // true
            trace (iterator is ICollectionIterator); // true
            trace (iterator is IMapIterator); // true
            trace (iterator is IOrderedMapIterator); // true
            
            while (iterator.hasNext()) {
                trace (iterator.next()); // 8,4,1,6,3,5,7,2,9
            }

            // Remove

            theSet.removeFirst();
            theSet.removeFirst();
            theSet.removeLast();
            theSet.removeLast();
            trace (theSet.toArray()); // 1,6,3,5,7
        }
    }
}
</listing></div>
	 * 
	 * <p id="link_SetExample"><strong>Set example</strong></p>
	 * 
	 * <a class="exampleCollapsed" href="#link_SetExample" onClick="toggleExample(this, 'SetExample');">Show example</a><br /><div id="SetExample" style='display:none'><listing version="3.0">package {
    import org.as3commons.collections.Set;
    import org.as3commons.collections.framework.ICollectionIterator;
    import org.as3commons.collections.framework.IIterator;
    import org.as3commons.collections.framework.ISetIterator;
    import flash.display.Sprite;

    public class SetExample extends Sprite {

        public function SetExample() {
            var theSet : Set = new Set();
            
            // Add
            
            theSet.add(1);
            theSet.add(2);
            theSet.add(3);
            theSet.add("4a");
            theSet.add("4b");
            theSet.add("4b"); // no effect (item already contained)
            
            trace (theSet.toArray()); // 4a,4b,1,2,3
            
            // Inspection
            
            trace (theSet.has(1)); // true;
            trace (theSet.has(4)); // false;
            
            // Iterator

            var iterator : IIterator = theSet.iterator();
            trace (iterator is IIterator); // true
            trace (iterator is ICollectionIterator); // true
            trace (iterator is ISetIterator); // true

            while (iterator.hasNext()) {
                trace (iterator.next()); // 4a,4b,1,2,3
            }

            // Set iterator

            var si : ISetIterator = theSet.iterator() as ISetIterator;
            trace (si.previousItem + " [" + si.current + "] " + si.nextItem);
            while (si.hasNext()) {
                si.next();
                trace (si.previousItem + " [" + si.current + "] " + si.nextItem);
            }

            // undefined [undefined] 4b
            // 4b [4b] 4a
            // 4a [4a] 1
            // 1 [1] 2
            // 2 [2] 3
            // 3 [3] undefined

            // Remove
            
            theSet.remove(2);
            theSet.remove("4b");
            theSet.remove("4"); // no effect (item not contained)

            trace (theSet.toArray()); // 4a,1,3
        }
    }
}
</listing></div>
	 * 
	 * <p id="link_ArrayListExample"><strong>ArrayList example</strong></p>
	 * 
	 * <a class="exampleCollapsed" href="#link_ArrayListExample" onClick="toggleExample(this, 'ArrayListExample');">Show example</a><br /><div id="ArrayListExample" style='display:none'><listing version="3.0">package {
    import org.as3commons.collections.ArrayList;
    import org.as3commons.collections.framework.ICollectionIterator;
    import org.as3commons.collections.framework.IIterator;
    import org.as3commons.collections.framework.IListIterator;
    import org.as3commons.collections.framework.IOrderedListIterator;
    import org.as3commons.collections.utils.StringComparator;
    import flash.display.Sprite;

    public class ArrayListExample extends Sprite {

        public function ArrayListExample() {
            var list : ArrayList = new ArrayList();
            
            // Add

            list.add("a");
            list.add("b");
            list.addAllAt(1, ["c", "d"]);
            trace (list.toArray()); // a,c,d,b

            list.addFirst("e");
            list.addLast("a");
            list.addAt(3, "a");
            trace (list.toArray()); // e,a,c,a,d,b,a
            
            // Replace

            list.replaceAt(2, "a");
            list.replaceAt(3, "f");
            trace (list.toArray()); // e,a,a,f,d,b,a

            // Inspection

            trace (list.size); // 7
            trace (list.has("b")); // true
            trace (list.itemAt(3)); // f
            trace (list.firstIndexOf("a")); // 1
            trace (list.lastIndexOf("a")); // 6
            trace (list.count("a")); // 3
            
            // Reorder

            list.reverse();
            trace (list.toArray()); // a,b,d,f,a,a,e

            list.sort(new StringComparator());
            trace (list.toArray()); // a,a,a,b,d,e,f
            
            // Iterator

            var iterator : IIterator = list.iterator();
            trace (iterator is IIterator); // true
            trace (iterator is ICollectionIterator); // true
            trace (iterator is IListIterator); // true
            trace (iterator is IOrderedListIterator); // true

            while (iterator.hasNext()) {
                trace (iterator.next()); // a,a,a,b,d,e,f
            }

            // List iterator

            var listIterator : IListIterator = list.iterator() as IListIterator;
            while (listIterator.hasNext()) {
                listIterator.next();
                trace (listIterator.index + "=" + listIterator.current);
            }

            // 0=a
            // 1=a
            // 2=a
            // 3=b
            // 4=d
            // 5=e
            // 6=f

            // Remove

            list.remove("a");
            trace (list.toArray()); // a,a,b,d,e,f

            list.removeAll("a");
            trace (list.toArray()); // b,d,e,f

            list.removeAt(1);
            list.removeFirst();
            list.removeLast();
            trace (list.toArray()); // e

            list.clear();
            trace (list.toArray()); // []
        }
    }
}
</listing></div>
	 * 
	 * <p id="link_ArrayListIteratorExample"><strong>ArrayListIterator example</strong></p>
	 * 
	 * <a class="exampleCollapsed" href="#link_ArrayListIteratorExample" onClick="toggleExample(this, 'ArrayListIteratorExample');">Show example</a><br /><div id="ArrayListIteratorExample" style='display:none'><listing version="3.0">package {
    import org.as3commons.collections.ArrayList;
    import org.as3commons.collections.framework.IOrderedListIterator;
    import flash.display.Sprite;

    public class ArrayListIteratorExample extends Sprite {

        public function ArrayListIteratorExample() {
            var list : ArrayList = new ArrayList();
            var iterator : IOrderedListIterator;
            var item : *;
            
            // ^ = cursor, [n] = current
            
            // Navigation
            
            list.array = [1, 2, 3];
            iterator = list.iterator() as IOrderedListIterator;
            
                                      //  ^  1  2  3
            iterator.next();          // [1] ^  2  3
            iterator.next();          //  1 [2] ^  3
            iterator.next();          //  1  2 [3] ^
            iterator.next();          //  1  2  3  ^
            iterator.previous();      //  1  2  ^ [3]
            iterator.previous();      //  1  ^ [2] 3
            iterator.previous();      //  ^ [1] 2  3
            iterator.previous();      //  ^  1  2  3

            iterator.next();          // [1] ^  2  3
            iterator.next();          //  1 [2] ^  3
            iterator.start();         //  ^  1  2  3

            iterator.next();          // [1] ^  2  3
            iterator.next();          //  1 [2] ^  3
            iterator.end();           //  1  2  3  ^
            
            // Current and index

            iterator = list.iterator() as IOrderedListIterator;
            
            with (iterator) {
                trace (index, current, previousIndex, nextIndex);
                // -1 undefined -1 0

                next();
                trace (index, current, previousIndex, nextIndex);
                // 0 1 0 1

                next();
                trace (index, current, previousIndex, nextIndex);
                // 1 2 1 2

                next();
                trace (index, current, previousIndex, nextIndex);
                // 2 3 2 -1

                next();
                trace (index, current, previousIndex, nextIndex);
                // -1 undefined 2 -1
            }
            
            // Start position
            
            iterator = list.iterator() as IOrderedListIterator;   //  ^  1  2  3
            iterator = list.iterator(1) as IOrderedListIterator;  //  1  ^  2  3
            iterator = list.iterator(2) as IOrderedListIterator;  //  1  2  ^  3
            iterator = list.iterator(10) as IOrderedListIterator; //  1  2  3  ^

            // Replace

            iterator = list.iterator() as IOrderedListIterator;

                                      //  ^  1  2  3
            iterator.next();          // [1] ^  2  3
            iterator.next();          //  1 [2] ^  3
            iterator.replace(4);      //  1 [4] ^  3
            iterator.next();          //  1  4 [3] ^
            iterator.replace(5);      //  1  4 [5] ^
            iterator.next();          //  1  4  5  ^
            iterator.replace(6);      //  1  4  5  ^

            // Remove

            list.array = [1, 2, 3];
            iterator = list.iterator() as IOrderedListIterator;
            
                                      //  ^  1  2  3
            iterator.next();          // [1] ^  2  3
            iterator.next();          //  1 [2] ^  3
            iterator.remove();        //  1  ^  3
            iterator.next();          //  1 [3] ^
            iterator.remove();        //  1  ^
            iterator.remove();        //  1  ^

            // Add

            list.array = [1, 2, 3];
            iterator = list.iterator() as IOrderedListIterator;
            
                                      //  ^  1  2  3
            iterator.addAfter(4);     //  ^  4  1  2  3
            iterator.addBefore(5);    //  5  ^  4  1  2  3

            iterator.next();          //  5 [4] ^  1  2  3
            iterator.next();          //  5  4 [1] ^  2  3
            iterator.addBefore(6);    //  5  4  1  6  ^  2  3
            iterator.addAfter(7);     //  5  4  1  6  ^  7  2  3

            iterator.next();          //  5  4  1  6 [7] ^  2  3
            iterator.next();          //  5  4  1  6  7 [2] ^  3
            iterator.next();          //  5  4  1  6  7  2 [3] ^
            iterator.addBefore(8);    //  5  4  1  6  7  2  3  8  ^
            iterator.addAfter(9);     //  5  4  1  6  7  2  3  8  ^  9
            
            // Add during iteration

            list.array = [1, 2, 3];
            iterator = list.iterator() as IOrderedListIterator;
            while (iterator.hasNext()) {
                item = iterator.next();
                trace (item); // 1,2,5,3,7

                if (item == 1) iterator.addBefore(4);   //  1  4  ^  2  3
                if (item == 2) iterator.addAfter(5);    //  1  4  2  ^  5  3
                if (item == 5) iterator.addBefore(6);   //  1  4  2  5  6  ^  3
                if (item == 3) iterator.addAfter(7);    //  1  4  2  5  6  3  ^  7
            }
            trace (list.toArray()); // 1,4,2,5,6,3,7

            // Replace during iteration

            list.array = [1, 2, 3];
            iterator = list.iterator() as IOrderedListIterator;
            while (iterator.hasNext()) {
                item = iterator.next();
                trace (item); // 1,2,3

                if (item == 1) iterator.replace(4);   // [4] ^  2  3
                if (item == 2) iterator.replace(5);   //  4 [5] ^  3
                if (item == 3) iterator.replace(6);   //  4  5 [6] ^
            }
            trace (list.toArray()); // 4,5,6

            // Remove during iteration

            list.array = [1, 2, 3, 4, 5];
            iterator = list.iterator() as IOrderedListIterator;
            while (iterator.hasNext()) {
                item = iterator.next();
                trace (item); // 1,2,3,4,5

                if (item == 1) iterator.remove();   //  ^  2  3  4  5
                if (item == 3) iterator.remove();   //  2  ^  4  5
                if (item == 5) iterator.remove();   //  2  4  ^
            }
            trace (list.toArray()); // 2,4

            // Reverse iteration

            list.array = [1, 2, 3, 4, 5];
            iterator = list.iterator() as IOrderedListIterator;
            iterator.end();
            while (iterator.hasPrevious()) {
                trace (iterator.previous()); // 5,4,3,2,1
            }
        }
    }
}
</listing></div>
	 * 
	 * @author Jens Struwe 25.03.2010
	 * @see org.as3commons.collections.framework.IOrderedSet IOrderedSet interface - Detailed description of the ordered set features.
	 * @see org.as3commons.collections.framework.IOrderedSetIterator IOrderedSetIterator interface - Detailed description of the ordered set iterator features.
	 * @see org.as3commons.collections.framework.ISet ISet interface - Detailed description of the base set features.
	 */
	public class LinkedSet extends AbstractLinkedCollection implements IOrderedSet {
		
		/**
		 * The non string items.
		 */
		private var _items : Dictionary;

		/**
		 * The string items.
		 */
		private var _stringItems : Object;
		
		/**
		 * LinkedSet constructor.
		 */
		public function LinkedSet() {
			_items = new Dictionary();
			_stringItems = new Object();
		}
		
		/*
		 * IOrderedSet
		 */

		/**
		 * @inheritDoc
		 */
		public function addFirst(item : *) : Boolean {
			var node : LinkedNode = add_private(item);
			if (node) {
				addNodeFirst(node);
				return true;
			} else {
				return false;
			}
		}
		
		/**
		 * @inheritDoc
		 */
		public function addLast(item : *) : Boolean {
			var node : LinkedNode = add_private(item);
			if (node) {
				addNodeLast(node);
				return true;
			} else {
				return false;
			}
		}
		
		/**
		 * @inheritDoc
		 */
		public function addBefore(nextItem : *, item : *) : Boolean {
			var nextNode : LinkedNode;

			if (nextItem is String) nextNode = _stringItems[nextItem];
			else nextNode = _items[nextItem];
			if (!nextNode) return false;
			
			var node : LinkedNode = add_private(item);
			if (!node) return false;

			addNodeBefore(nextNode, node);
			return true;
		}
		
		/**
		 * @inheritDoc
		 */
		public function addAfter(previousItem : *, item : *) : Boolean {
			var previousNode : LinkedNode;

			if (previousItem is String) previousNode = _stringItems[previousItem];
			else previousNode = _items[previousItem];
			if (!previousNode) return false;

			var node : LinkedNode = add_private(item);
			if (!node) return false;

			addNodeAfter(previousNode, node);
			return true;
		}

		/**
		 * @inheritDoc
		 */
		public function replace(oldItem: *, item : *) : Boolean {
			// test new item if it is already contained
			if (item is String && _stringItems[item] !== undefined) return false;
			else if (_items[item] !== undefined) return false;

			// test old item if it is contained
			var node : LinkedNode;
			if (oldItem is String) {
				if (_stringItems[oldItem] !== undefined) {
					node = _stringItems[oldItem];
					node.item = item;
					_stringItems[item] = node;
					delete _stringItems[oldItem];
					return true;
				}
			} else {
				if (_items[oldItem] !== undefined) {
					node = _items[oldItem];
					node.item = item;
					_items[item] = node;
					delete _items[oldItem];
					return true;
				}
			}

			return false;
		}

		/**
		 * @inheritDoc
		 */
		public function next(item : *) : * {
			var node : LinkedNode = getNode(item);
			if (node && node.right) return node.right.item;
			return undefined;
		}

		/**
		 * @inheritDoc
		 */
		public function previous(item : *) : * {
			var node : LinkedNode = getNode(item);
			if (node && node.left) return node.left.item;
			return undefined;
		}

		/*
		 * ILinkedCollection
		 */

		/**
		 * @inheritDoc
		 */
		override public function removeFirst() : * {
			if (!_size) return undefined;
			remove_private(_first.item);
			return super.removeFirst();
		}
		
		/**
		 * @inheritDoc
		 */
		override public function removeLast() : * {
			if (!_size) return undefined;
			remove_private(_last.item);
			return super.removeLast();
		}

		/*
		 * ISet
		 */

		/**
		 * @inheritDoc
		 */
		public function add(item : *) : Boolean {
			var node : LinkedNode = add_private(item);
			if (node) {
				addNodeLast(node);
				return true;
			} else {
				return false;
			}
		}
		
		/*
		 * ICollection
		 */

		/**
		 * @inheritDoc
		 */
		override public function has(item : *) : Boolean {
			return item is String ? _stringItems[item] !== undefined : _items[item] !== undefined;
		}
		
		/**
		 * @inheritDoc
		 */
		override public function remove(item : *) : Boolean {
			var node : LinkedNode;
			
			if (item is String) {
				if (_stringItems[item] === undefined) return false;
				node = _stringItems[item];

			} else {
				if (_items[item] === undefined) return false;
				node = _items[item];
			}
			
			removeNode(node);
			return true;
		}
		
		/**
		 * @inheritDoc
		 */
		override public function clear() : Boolean {
			if (!_size) return false;
			
			_items = new Dictionary();
			_stringItems = new Object();

			super.clear();
			return true;
		}

		/*
		 * IIterable
		 */

		/**
		 * @inheritDoc
		 */
		override public function iterator(cursor : * = undefined) : IIterator {
			var node : LinkedNode;
			if (cursor is String) node = _stringItems[cursor];
			else node = _items[cursor];
			return new LinkedSetIterator(this, node);
		}

		/*
		 * Protected
		 */

		/**
		 * @inheritDoc
		 */
		override protected function removeNode(node : LinkedNode) : void {
			remove_private(node.item);
			super.removeNode(node);
		}
		
		/**
		 * Returns the node of the given item.
		 * 
		 * @param item The item to get the node for.
		 * @return The node or <code>null</code> if the item is not contained.
		 */
		protected function getNode(item : *) : LinkedNode {
			if (item is String) return _stringItems[item];
			return _items[item];
		}

		/*
		 * Private
		 */

		/**
		 * Adds the given item to the internal map.
		 */
		private function add_private(item : *) : LinkedNode {
			var node : LinkedNode;
			
			if (item is String) {
				if (_stringItems[item] !== undefined) return null;
				node = new LinkedNode(item);
				_stringItems[item] = node;

			} else {
				if (_items[item] !== undefined) return null;
				node = new LinkedNode(item);
				_items[item] = node;
			}
			
			return node;
		}
		
		/**
		 * Removes the given item from the internal map.
		 */
		private function remove_private(item : *) : void {
			if (item is String) delete _stringItems[item];
			else delete _items[item];
		}
	}
}
