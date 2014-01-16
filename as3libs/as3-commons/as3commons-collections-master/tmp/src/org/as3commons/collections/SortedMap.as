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

	import org.as3commons.collections.framework.IComparator;
	import org.as3commons.collections.framework.IIterator;
	import org.as3commons.collections.framework.ISortedMap;
	import org.as3commons.collections.framework.core.AbstractSortedDuplicatesCollection;
	import org.as3commons.collections.framework.core.SortedMapIterator;
	import org.as3commons.collections.framework.core.SortedMapNode;
	import org.as3commons.collections.framework.core.SortedNode;
	import org.as3commons.collections.framework.core.as3commons_collections;

	import flash.utils.Dictionary;

	/**
	 * Sort order implementation of a map.
	 * 
	 * <p><strong>Description</strong></p>
	 * 
	 * <p>The <code>SortedMap</code> is a combination of a dictionary and a binary search tree.</p>
	 * 
	 * <p><strong>Runtime of operations</strong></p>
	 * 
	 * <ul>
	 * <li>Getting or removing of items - constant runtime O(1).<br />
	 * <code>first, last, removeFirst(), removeLast()</code></li>
	 * <li>Key lookup operations - constant runtime O(1).<br />
	 * hasKey(), addBefore(), addAfter(), itemFor(), replaceFor(), removeKey()</code></li>
	 * <li>Adding and removing of items - logarithmic runtime O(log n).<br />
	 * add(), remove(), removeAll()</code></li>
	 * <li>Item lookup inspection operations - logarithmic runtime O(log n).<br />
	 * has(), count(), lesserKey(), higherKey(), equalKeys()</code></li>
	 * </ul>
	 * 
	 * <p><strong>Notes</strong></p>
	 * 
	 * <p>The <code>iterator()</code> method accepts a key as the cursor parameter. If the given
	 * key is not contained by the map, it will be ignored.</p>
	 * 
	 * <p>The <code>iterator()</code> method retuns an <code>IMapIterator</code>.</p>
	 * 
	 * <p><code>null</code> is allowed for keys and for values if the comparator allows <code>null</code>.</p>
	 * 
	 * <p id="link_SortedMapExample"><strong>SortedMap example</strong></p>
	 * 
	 * <p>This example shows the specific behaviour of a <code>SortedMap</code>.
	 * The general work with collections and iterators is more detailed illustrated
	 * in the <code>Map</code> and <code>ArrayList</code> examples below.</p>
	 * 
	 * <a class="exampleCollapsed" href="#link_SortedMapExample" onClick="toggleExample(this, 'SortedMapExample');">Show example</a><br /><div id="SortedMapExample" style='display:none'><listing version="3.0">package {
    import org.as3commons.collections.SortedMap;
    import org.as3commons.collections.framework.ICollectionIterator;
    import org.as3commons.collections.framework.IIterator;
    import org.as3commons.collections.framework.IMapIterator;
    import org.as3commons.collections.utils.NumericComparator;
    import flash.display.Sprite;

    public class SortedMapExample extends Sprite {

        public function SortedMapExample() {
            
            var map : SortedMap = new SortedMap(new NumericComparator());
            
            // Add
            
            map.add("threeA", 3);
            map.add("four", 4);
            map.add("one", 1);
            map.add("threeB", 3);
            map.add("five", 5);
            map.add("two", 2);
            map.add("threeC", 3);
            trace (map.keysToArray()); // one,two,threeA,threeB,threeC,four,five
            trace (map.toArray()); // 1,2,3,3,3,4,5
            
            // Replace

            map.replaceFor("one", 4);
            map.replaceFor("threeB", -3);
            trace (map.keysToArray()); // threeB,two,threeA,threeC,four,one,five
            trace (map.toArray()); // -3,2,3,3,4,4,5

            // Inspection
            
            trace (map.first); // -3
            trace (map.last); // 5

            trace (map.hasEqual(3)); // true
            trace (map.hasEqual(6)); // false
            trace (map.equalKeys(3)); // threeA,threeC
            
            trace (map.lesserKey(-4)); // undefined
            trace (map.lesserKey(-3)); // undefined
            trace (map.lesserKey(-2)); // threeB
            trace (map.lesserKey(4)); // threeC
            
            trace (map.higherKey(2)); // threeA
            trace (map.higherKey(3)); // four
            trace (map.higherKey(5)); // undefined
            trace (map.higherKey(6)); // undefined
            
            // Iterator

            var iterator : IIterator = map.iterator();
            trace (iterator is IIterator); // true
            trace (iterator is ICollectionIterator); // true
            trace (iterator is IMapIterator); // true
            
            while (iterator.hasNext()) {
                trace (iterator.next()); // -3,2,3,3,4,4,5
            }

            // Remove

            map.removeFirst();
            map.removeFirst();
            map.removeLast();
            map.removeLast();
            trace (map.keysToArray()); // threeA,threeC,four
            trace (map.toArray()); // 3,3,4
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
	 * @author Jens Struwe 30.03.2010
	 * @see org.as3commons.collections.framework.ISortedMap ISortedMap interface - Detailed description of the sorted map features.
	 * @see org.as3commons.collections.framework.IMapIterator IMapIterator interface - Detailed description of the map iterator features.
	 * @see org.as3commons.collections.framework.IMap IMap interface - Detailed description of the base map features.
	 */
	public class SortedMap extends AbstractSortedDuplicatesCollection implements ISortedMap {

		use namespace as3commons_collections;

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
		 * SortedMap constructor.
		 * 
		 * @param comparator The sort criterion.
		 */
		public function SortedMap(comparator : IComparator = null) {
			super(comparator);

			_items = new Dictionary();
			_keys = new Dictionary();
			_stringMap = new Object();
		}
		
		/*
		 * ISortedMap
		 */
		
		/**
		 * @inheritDoc
		 */
		public function get firstKey() : * {
			if (!_root) return undefined;
			return SortedMapNode(mostLeftNode_internal()).key;
		}

		/**
		 * @inheritDoc
		 */
		public function get lastKey() : * {
			if (!_root) return undefined;
			return SortedMapNode(mostRightNode_internal()).key;
		}

		/**
		 * @inheritDoc
		 */
		public function nextKey(key : *) : * {
			var node : SortedMapNode = getNode(key);
			if (node) {
				node = nextNode_internal(node) as SortedMapNode;
				if (node) return node.key;
			}
			return undefined;
		}

		/**
		 * @inheritDoc
		 */
		public function previousKey(key : *) : * {
			var node : SortedMapNode = getNode(key);
			if (node) {
				node = previousNode_internal(node) as SortedMapNode;
				if (node) return node.key;
			}
			return undefined;
		}

		/**
		 * @inheritDoc
		 */
		public function lesserKey(item : *) : * {
			var node : SortedMapNode = lesserNode(item) as SortedMapNode;
			if (!node) return undefined;
			return node.key;
		}
		
		/**
		 * @inheritDoc
		 */
		public function higherKey(item : *) : * {
			var node : SortedMapNode = higherNode(item) as SortedMapNode;
			if (!node) return undefined;
			return node.key;
		}

		/**
		 * @inheritDoc
		 */
		public function equalKeys(item : *) : Array {
			var equalKeys : Array = new Array();
			var node : SortedNode = firstEqualNode(item);
			if (!node) return equalKeys;
			
			while (node) {
				if (_comparator.compare(item, node.item)) break;
				equalKeys.push(SortedMapNode(node).key);
				node = nextNode_internal(node);
			}
			
			return equalKeys;
		}

		/*
		 * IMap
		 */
		
		/**
		 * @inheritDoc
		 */
		public function add(key : *, item : *) : Boolean {
			if (key is String) {
				if (_stringMap[key] !== undefined) return false;

			} else {
				if (_keys[key] !== undefined) return false;
			}
			addNode(new SortedMapNode(key, item));
			
			return true;
		}

		/**
		 * @inheritDoc
		 */
		public function replaceFor(key : *, item : *) : Boolean {
			var node : SortedMapNode;
			if (key is String) node = _stringMap[key];
			else node = _items[key];

			if (node && node.item !== item) {
				
				removeNode(node);
				node.item = item;
				addNode(node);
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
			var node : SortedMapNode;
			if (key is String) node = _stringMap[key];
			else node = _items[key];
			return node ? node.item : undefined;
		}
		
		/**
		 * @inheritDoc
		 */
		public function keysToArray() : Array {
			var node : SortedNode = mostLeftNode_internal();
			var keys : Array = new Array();
			while (node) {
				keys.push(SortedMapNode(node).key);
				node = nextNode_internal(node);
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
			var node : SortedMapNode;
			
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
			var node : SortedMapNode;
			if (cursor is String) node = _stringMap[cursor];
			else node = _items[cursor];
			return new SortedMapIterator(this, node);
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
		protected function getNode(key : *) : SortedMapNode {
			if (key is String) return _stringMap[key];
			return _items[key];
		}

		/**
		 * @inheritDoc
		 */
		override protected function addNode(node : SortedNode) : void {
			super.addNode(node);
			
			var key : * = SortedMapNode(node).key;
			
			if (key is String) {
				_stringMap[key] = node;

			} else {
				_keys[key] = key;
				_items[key] = node;
			}
			
		}

		/**
		 * @inheritDoc
		 */
		override protected function removeNode(node : SortedNode) : void {
			super.removeNode(node);

			var key : * = SortedMapNode(node).key;

			if (key is String) {
				delete _stringMap[key];

			} else {
				delete _keys[key];
				delete _items[key];
			}
		}
	}
}

import org.as3commons.collections.SortedMap;
import org.as3commons.collections.framework.IIterator;
import org.as3commons.collections.framework.core.SortedMapNode;
import org.as3commons.collections.framework.core.SortedNode;
import org.as3commons.collections.framework.core.as3commons_collections;

internal class KeyIterator implements IIterator {

	use namespace as3commons_collections;

	private var _map : SortedMap;
	private var _next : SortedNode;

	public function KeyIterator(map : SortedMap) {
		_map = map;
		_next = map.mostLeftNode_internal();
	}

	public function hasNext() : Boolean{
		return _next != null;
	}

	public function next() : * {
		if (!_next) return undefined;
		var next : SortedNode = _next;
		_next = _map.nextNode_internal(_next);
		return SortedMapNode(next).key;
	}	
}
