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
	import org.as3commons.collections.framework.IOrderedMap;
	import org.as3commons.collections.framework.core.AbstractLinkedDuplicatesCollection;
	import org.as3commons.collections.framework.core.LinkedMapIterator;
	import org.as3commons.collections.framework.core.LinkedMapNode;
	import org.as3commons.collections.framework.core.LinkedNode;

	import flash.utils.Dictionary;

	/**
	 * Insertion order implementation of a map.
	 * 
	 * <p><strong>Description</strong></p>
	 * 
	 * <p>The <code>LinkedMap</code> is a combination of a dictionary and a linked list.</p>
	 * 
	 * <p><strong>Runtime of operations</strong></p>
	 * 
	 * <ul>
	 * <li>Adding, getting or removing of items - constant runtime O(1).<br />
	 * <code>add(), addFirst(), addLast(), first, last, removeFirst(), removeLast()</code></li>
	 * <li>Key lookup operations - constant runtime O(1).<br />
	 * hasKey(), addBefore(), addAfter(), itemFor(), replaceFor(), removeKey()</code></li>
	 * <li>Item lookup operations - linear runtime O(n).<br />
	 * has(), count(), remove(), removeAll()</code></li>
	 * </ul>
	 * 
	 * <p><strong>Notes</strong></p>
	 * 
	 * <p>The <code>iterator()</code> method accepts a key as the cursor parameter. If the given
	 * key is not contained by the map, it will be ignored.</p>
	 * 
	 * <p>The <code>iterator()</code> method retuns an <code>IOrderedMapIterator</code>.</p>
	 * 
	 * <p><code>null</code> is allowed for keys as well as for values.</p>
	 * 
	 * <p id="link_LinkedMapExample"><strong>LinkedMap example</strong></p>
	 * 
	 * <p>This example shows the specific behaviour of a <code>LinkedMap</code>.
	 * The general work with collections and iterators is more detailed illustrated
	 * in the <code>Map</code> and <code>ArrayList</code> examples below.</p>
	 * 
	 * <a class="exampleCollapsed" href="#link_LinkedMapExample" onClick="toggleExample(this, 'LinkedMapExample');">Show example</a><br /><div id="LinkedMapExample" style='display:none'><listing version="3.0">package {
    import org.as3commons.collections.LinkedMap;
    import org.as3commons.collections.framework.ICollectionIterator;
    import org.as3commons.collections.framework.IIterator;
    import org.as3commons.collections.framework.IMapIterator;
    import org.as3commons.collections.framework.IOrderedMapIterator;
    import flash.display.Sprite;

    public class LinkedMapExample extends Sprite {

        public function LinkedMapExample() {
            var map : LinkedMap = new LinkedMap();
            
            // Add
            
            map.add(4, "four");
            map.add(1, "one");
            map.add(3, "three");
            map.add(5, "five");
            map.add(2, "two");
            trace (map.keysToArray()); // 4,1,3,5,2
            trace (map.toArray()); // four,one,three,five,two
            
            map.addBefore(3, 6, "six");
            map.addAfter(5, 7, "seven");
            trace (map.keysToArray()); // 4,1,6,3,5,7,2
            trace (map.toArray()); // four,one,six,three,five,seven,two

            map.addFirst(8, "eight");
            map.addLast(9, "nine");
            trace (map.keysToArray()); // 8,4,1,6,3,5,7,2,9
            trace (map.toArray()); // eight,four,one,six,three,five,seven,two,nine

            // Inspection
            
            trace (map.first); // eight
            trace (map.last); // nine
            
            // Iterator

            var iterator : IIterator = map.iterator();
            trace (iterator is IIterator); // true
            trace (iterator is ICollectionIterator); // true
            trace (iterator is IMapIterator); // true
            trace (iterator is IOrderedMapIterator); // true
            
            while (iterator.hasNext()) {
                trace (iterator.next()); // eight,four,one,six,three,five,seven,two,nine
            }

            // Remove

            map.removeFirst();
            map.removeFirst();
            map.removeLast();
            map.removeLast();
            trace (map.keysToArray()); // 1,6,3,5,7
            trace (map.toArray()); // one,six,three,five,seven
        }
    }
}
</listing></div>
	 * 
	 * <p id="link_MapExample"><strong>Map example</strong></p>
	 * 
	 * <a class="exampleCollapsed" href="#link_MapExample" onClick="toggleExample(this, 'MapExample');">Show example</a><br /><div id="MapExample" style='display:none'><listing version="3.0">package {
    import org.as3commons.collections.Map;
    import org.as3commons.collections.framework.ICollectionIterator;
    import org.as3commons.collections.framework.IIterator;
    import org.as3commons.collections.framework.IMapIterator;
    import flash.display.Sprite;

    public class MapExample extends Sprite {

        public function MapExample() {
            var map : Map = new Map();
            
            // Add
            
            map.add(1, "one");
            map.add(2, "two");
            map.add(3, "three");
            map.add("4a", "four");
            map.add("4b", "four");
            map.add("4c", "four");
            
            map.add("4c", "fourC"); // no effect (key already contained)
            
            trace (map.toArray()); // four,four,four,one,two,three
            
            // Replace

            map.replaceFor(3, "three3");
            map.replaceFor("4a", "fourA");
            
            map.replaceFor(1, "one"); // no effect ("one" === "one")
            map.replaceFor(4, "four"); // no effect (key not contained)
            
            trace (map.toArray()); // fourA,four,four,one,two,three3

            // Inspection
            
            trace (map.size); // 6
            trace (map.hasKey(3)); // true
            trace (map.hasKey(4)); // false
            trace (map.itemFor(3)); // three3
            trace (map.itemFor(4)); // undefined
            trace (map.keysToArray()); // 4a,4b,4c,1,2,3

            // Iterator

            var iterator : IIterator = map.iterator();
            trace (iterator is IIterator); // true
            trace (iterator is ICollectionIterator); // true
            trace (iterator is IMapIterator); // true

            while (iterator.hasNext()) {
                trace (iterator.next()); // fourA,four,four,one,two,three3
            }

            // Map iterator

            var mi : IMapIterator = map.iterator() as IMapIterator;
            trace (mi.previousKey + " [" + mi.key + "=" + mi.current + "] " + mi.nextKey);
            while (mi.hasNext()) {
                mi.next();
                trace (mi.previousKey + " [" + mi.key + "=" + mi.current + "] " + mi.nextKey);
            }

            // undefined [undefined=undefined] 4a
            // 4a [4a=fourA] 4b
            // 4b [4b=four] 4c
            // 4c [4c=four] 1
            // 1 [1=one] 2
            // 2 [2=two] 3
            // 3 [3=three3] undefined
            
            // Remove

            map.removeKey(2);
            map.removeKey("4a");            
            map.removeKey(4); // no effect (key not contained)
            
            trace (map.toArray()); // four,four,one,three3

            map.remove("one");            
            map.remove("fourC"); // no effect (item not contained)
            
            trace (map.toArray()); // four,four,three3

            map.removeAll("four");            
            trace (map.toArray()); // three3
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
	 * @see org.as3commons.collections.framework.IOrderedMap IOrderedMap interface - Detailed description of the ordered map features.
	 * @see org.as3commons.collections.framework.IOrderedMapIterator IOrderedMapIterator interface - Detailed description of the ordered map iterator features.
	 * @see org.as3commons.collections.framework.IMap IMap interface - Detailed description of the base map features.
	 */
	public class LinkedMap extends AbstractLinkedDuplicatesCollection implements IOrderedMap {
		
		/**
		 * The non string keys.
		 */
		protected var _keys : Dictionary;

		/**
		 * The items of the non string keys.
		 */
		protected var _items : Dictionary;

		/**
		 * The stringed key item map.
		 */
		protected var _stringMap : Object;
		
		/**
		 * LinkedMap constructor.
		 */
		public function LinkedMap() {
			_items = new Dictionary();
			_keys = new Dictionary();
			_stringMap = new Object();
		}
		
		/*
		 * IOrderedMap
		 */

		/**
		 * @inheritDoc
		 */
		public function addFirst(key : *, item : *) : Boolean {
			var node : LinkedMapNode = add_private(key, item);
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
		public function addLast(key : *, item : *) : Boolean {
			var node : LinkedMapNode = add_private(key, item);
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
		public function addBefore(nextKey : *, key : *, item : *) : Boolean {
			var nextNode : LinkedMapNode;

			if (nextKey is String) nextNode = _stringMap[nextKey];
			else nextNode = _items[nextKey];
			if (!nextNode) return false;
			
			var node : LinkedMapNode = add_private(key, item);
			if (!node) return false;

			addNodeBefore(nextNode, node);
			return true;
		}
		
		/**
		 * @inheritDoc
		 */
		public function addAfter(previousKey : *, key : *, item : *) : Boolean {
			var previousNode : LinkedMapNode;

			if (previousKey is String) previousNode = _stringMap[previousKey];
			else previousNode = _items[previousKey];
			if (!previousNode) return false;
			
			var node : LinkedMapNode = add_private(key, item);

			if (!node) return false;

			addNodeAfter(previousNode, node);
			return true;
		}

		/**
		 * @inheritDoc
		 */
		public function get firstKey() : * {
			if (_first) return LinkedMapNode(_first).key;
			return undefined;
		}

		/**
		 * @inheritDoc
		 */
		public function get lastKey() : * {
			if (_last) return LinkedMapNode(_last).key;
			return undefined;
		}

		/**
		 * @inheritDoc
		 */
		public function nextKey(key : *) : * {
			var node : LinkedNode = getNode(key);
			if (node && node.right) return LinkedMapNode(node.right).key;
			return undefined;
		}

		/**
		 * @inheritDoc
		 */
		public function previousKey(key : *) : * {
			var node : LinkedNode = getNode(key);
			if (node && node.left) return LinkedMapNode(node.left).key;
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
			removeKey_private(LinkedMapNode(_first).key);
			return super.removeFirst();
		}
		
		/**
		 * @inheritDoc
		 */
		override public function removeLast() : * {
			if (!_size) return undefined;
			removeKey_private(LinkedMapNode(_last).key);
			return super.removeLast();
		}

		/*
		 * IMap
		 */

		/**
		 * @inheritDoc
		 */
		public function add(key : *, item : *) : Boolean {
			var node : LinkedMapNode = add_private(key, item);
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
		public function replaceFor(key : *, item : *) : Boolean {
			var node : LinkedMapNode;
			if (key is String) node = _stringMap[key];
			else node = _items[key];
			if (node && node.item !== item) {
				node.item = item;
				return true;
			}
			return false;
		}
		
		/**
		 * @inheritDoc
		 */
		public function hasKey(key : *) : Boolean {
			return key is String ? _stringMap[key] !== undefined : _keys[key] !== undefined;
		}
		
		/**
		 * @inheritDoc
		 */
		public function itemFor(key : *) : * {
			var node : LinkedMapNode;
			if (key is String) node = _stringMap[key];
			else node = _items[key];
			return node ? node.item : undefined;
		}
		
		/**
		 * @inheritDoc
		 */
		public function keysToArray() : Array {
			var node : LinkedNode = _first;
			var keys : Array = new Array();
			while (node) {
				keys.push(LinkedMapNode(node).key);
				node = node.right;
			}
			return keys;
		}
		
		/**
		 * @inheritDoc
		 */
		public function keyIterator() : IIterator {
			return new KeyIterator(this);
		}

		/**
		 * @inheritDoc
		 */
		public function removeKey(key : *) : * {
			var node : LinkedNode;
			
			if (key is String) {
				if (_stringMap[key] === undefined) return undefined;
				node = _stringMap[key];

			} else {
				if (_keys[key] === undefined) return undefined;
				node = _items[key];
			}
			
			removeNode(node);
			return node.item;
		}
		
		/*
		 * ICollection
		 */

		/**
		 * @inheritDoc
		 */
		override public function clear() : Boolean {
			if (!_size) return false;
			
			_keys = new Dictionary();
			_items = new Dictionary();
			_stringMap = new Object();

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
			var node : LinkedMapNode;
			if (cursor is String) node = _stringMap[cursor];
			else node = _items[cursor];
			return new LinkedMapIterator(this, node);
		}

		/*
		 * Protected
		 */

		/**
		 * Returns the node of the given key.
		 * 
		 * @param key The key to get the node for.
		 * @return The node or <code>null</code> if the key is not contained.
		 */
		protected function getNode(key : *) : LinkedMapNode {
			if (key is String) return _stringMap[key];
			return _items[key];
		}

		/**
		 * @inheritDoc
		 */
		override protected function removeNode(node : LinkedNode) : void {
			super.removeNode(node);
			removeKey_private(LinkedMapNode(node).key);
		}

		/*
		 * Private
		 */

		/**
		 * Adds the given item to the internal map.
		 */
		private function add_private(key : *, item : *) : LinkedMapNode {
			var node : LinkedMapNode;
			
			if (key is String) {
				if (_stringMap[key] !== undefined) return null;
				node = new LinkedMapNode(key, item);
				_stringMap[key] = node;

			} else {
				if (_keys[key] !== undefined) return null;
				node = new LinkedMapNode(key, item);
				_keys[key] = key;
				_items[key] = node;
			}
			
			return node;
		}
		
		/**
		 * Removes the given key from the internal map.
		 */
		private function removeKey_private(key : *) : void {
			if (key is String) {
				delete _stringMap[key];

			} else {
				delete _keys[key];
				delete _items[key];
			}
		}

	}
}

import org.as3commons.collections.LinkedMap;
import org.as3commons.collections.framework.IIterator;
import org.as3commons.collections.framework.core.LinkedMapNode;
import org.as3commons.collections.framework.core.LinkedNode;
import org.as3commons.collections.framework.core.as3commons_collections;

internal class KeyIterator implements IIterator {

	use namespace as3commons_collections;

	private var _next : LinkedNode;

	public function KeyIterator(map : LinkedMap) {
		_next = map.firstNode_internal;
	}

	public function hasNext() : Boolean{
		return _next != null;
	}

	public function next() : * {
		if (!_next) return undefined;
		var next : LinkedNode = _next;
		_next = _next.right;
		return LinkedMapNode(next).key;
	}	
}
