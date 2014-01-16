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
	import org.as3commons.collections.framework.ISortedSet;
	import org.as3commons.collections.framework.core.AbstractSortedCollection;
	import org.as3commons.collections.framework.core.SortedNode;
	import org.as3commons.collections.framework.core.SortedSetIterator;
	import org.as3commons.collections.framework.core.as3commons_collections;

	import flash.utils.Dictionary;

	/**
	 * Sort order implementation of a set.
	 * 
	 * <p><strong>Description</strong></p>
	 * 
	 * <p>The <code>SortedSet</code> is a combination of a dictionary and a linked list.</p>
	 * 
	 * <p><strong>Runtime of operations</strong></p>
	 * 
	 * <ul>
	 * <li>Getting or removing of items - constant runtime O(1).<br />
	 * <code>add(), first, last, remove(), removeFirst(), removeLast()</code></li>
	 * <li>Item lookup inspection operations - constant runtime O(1).<br />
	 * has(), lesser(), higher(), equalItems()</code></li>
	 * <li>Adding of items - logarithmic runtime O(log n).<br />
	 * add()</code></li>
	 * </ul>
	 * 
	 * <p><strong>Notes</strong></p>
	 * 
	 * <p>The <code>iterator()</code> method accepts an item as the cursor parameter. If the given
	 * item is not contained by the set, it will be ignored.</p>
	 * 
	 * <p>The <code>iterator()</code> method retuns an <code>ISetIterator</code>.</p>
	 * 
	 * <p><code>null</code> is allowed if the comparator allows <code>null</code>.</p>
	 * 
	 * <p id="link_SortedSetExample"><strong>SortedSet example</strong></p>
	 * 
	 * <p>This example shows the specific behaviour of a <code>SortedSet</code>.
	 * The general work with collections and iterators is more detailed illustrated
	 * in the <code>Set</code> and <code>ArrayList</code> examples below.</p>
	 * 
	 * <a class="exampleCollapsed" href="#link_SortedSetExample" onClick="toggleExample(this, 'SortedSetExample');">Show example</a><br /><div id="SortedSetExample" style='display:none'><listing version="3.0">package {
    import org.as3commons.collections.SortedSet;
    import org.as3commons.collections.framework.ICollectionIterator;
    import org.as3commons.collections.framework.IIterator;
    import org.as3commons.collections.framework.ISetIterator;
    import flash.display.Sprite;

    public class SortedSetExample extends Sprite {

        public function SortedSetExample() {
            var theSet : SortedSet = new SortedSet(new PersonComparator());
            var erikaMeier : Person = new Person("Erika", "Meier");
            
            // Add
            
            theSet.add(new Person("Hans", "Meier"));
            theSet.add(new Person("Erika", "Meier"));
            theSet.add(new Person("Ernst", "Schmitt"));
            theSet.add(new Person("Anton", "Fischer"));
            theSet.add(new Person("Erika", "Becker"));
            theSet.add(erikaMeier);
            theSet.add(erikaMeier); // no effect (item already contained)
            
            trace (theSet.toArray());
            
            // Erika Becker
            // Anton Fischer
            // Erika Meier
            // Erika Meier
            // Hans Meier
            // Ernst Schmitt

            // Inspect
            
            trace (theSet.has(new Person("Erika", "Meier"))); // false (item not contained)
            trace (theSet.has(erikaMeier)); // true

            trace (theSet.first); // Erika Becker
            trace (theSet.last); // Ernst Schmitt

            trace (theSet.hasEqual(new Person("Ernst", "Schmitt"))); // true
            trace (theSet.hasEqual(new Person("Erika", "Schmitt"))); // false
            trace (theSet.equalItems(new Person("Erika", "Meier"))); // Erika Meier, Erika Meier

            trace (theSet.lesser(new Person("Erika", "Becker"))); // undefined
            trace (theSet.lesser(new Person("Karla", "Dieling"))); // Erika Becker
            trace (theSet.lesser(new Person("Erika", "Meier"))); // Anton Fischer
            
            trace (theSet.higher(new Person("Erika", "Meier"))); // Hans Meier
            trace (theSet.higher(new Person("Anna", "Pauli"))); // Ernst Schmitt
            trace (theSet.higher(new Person("Ernst", "Schmitt"))); // undefined
            trace (theSet.higher(new Person("Wolfgang", "Teske"))); // undefined

            // Iterator

            var iterator : IIterator = theSet.iterator();
            trace (iterator is IIterator); // true
            trace (iterator is ICollectionIterator); // true
            trace (iterator is ISetIterator); // true
            
            while (iterator.hasNext()) {
                trace (iterator.next());
            }

            // Erika Becker
            // Anton Fischer
            // Erika Meier
            // Erika Meier
            // Hans Meier
            // Ernst Schmitt

            // Remove
            
            theSet.remove(erikaMeier);
            theSet.remove(erikaMeier); // no effect (item not contained)
            
            var ernstFischer : Person = theSet.lesser(new Person("Erika", "Meier"));
            theSet.remove(ernstFischer);

            trace (theSet.toArray());
            
            // Erika Becker
            // Erika Meier
            // Hans Meier
            // Ernst Schmitt

            theSet.removeFirst();
            theSet.removeLast();

            trace (theSet.toArray());
            
            // Erika Meier
            // Hans Meier
        }
    }
}

import org.as3commons.collections.utils.StringComparator;

internal class Person {
    public var firstName : String;
    public var lastName : String;
    public function Person(first : String, last : String) {
        firstName = first;
        lastName = last;
    }
    public function toString() : String {
        return firstName + " " + lastName;
    }
}

internal class PersonComparator extends StringComparator {
    override public function compare(item1 : *, item2 : *) : int {
        var compare : int = super.compare(
            Person(item1).lastName, Person(item2).lastName
        );
        if (compare) return compare;
        return super.compare(
            Person(item1).firstName, Person(item2).firstName
        );
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
	 * @author Jens Struwe 24.03.2010
	 * @see org.as3commons.collections.framework.ISortedSet ISortedSet interface - Detailed description of the sorted set features.
	 * @see org.as3commons.collections.framework.ISetIterator ISetIterator interface - Detailed description of the set iterator features.
	 * @see org.as3commons.collections.framework.ISet ISet interface - Detailed description of the base set features.
	 */
	public class SortedSet extends AbstractSortedCollection implements ISortedSet {
		
		use namespace as3commons_collections;

		/**
		 * The non string items.
		 */
		private var _items : Dictionary;

		/**
		 * The string items.
		 */
		private var _stringItems : Object;
		
		/**
		 * SortedSet constructor.
		 * 
		 * @param comparator The sort criterion.
		 */
		public function SortedSet(comparator : IComparator = null) {
			super(comparator);

			_items = new Dictionary();
			_stringItems = new Object();
		}
		
		/*
		 * ISortedSet
		 */

		/**
		 * @inheritDoc
		 */
		public function next(item : *) : * {
			var node : SortedNode = getNode(item);
			if (node) {
				node = nextNode_internal(node);
				if (node) return node.item;
			}
			return undefined;
		}

		/**
		 * @inheritDoc
		 */
		public function previous(item : *) : * {
			var node : SortedNode = getNode(item);
			if (node) {
				node = previousNode_internal(node);
				if (node) return node.item;
			}
			return undefined;
		}

		/**
		 * @inheritDoc
		 */
		public function lesser(item : *) : * {
			var node : SortedNode = lesserNode(item);
			if (!node) return undefined;
			return node.item;
		}
		
		/**
		 * @inheritDoc
		 */
		public function higher(item : *) : * {
			var node : SortedNode = higherNode(item);
			if (!node) return undefined;
			return node.item;
		}

		/**
		 * @inheritDoc
		 */
		public function equalItems(item : *) : Array {
			var equalItems : Array = new Array();
			var node : SortedNode = firstEqualNode(item);
			if (!node) return equalItems;
			
			while (node) {
				if (_comparator.compare(item, node.item)) break;
				equalItems.push(node.item);
				node = nextNode_internal(node);
			}
			
			return equalItems;
		}

		/*
		 * ISet
		 */

		/**
		 * @inheritDoc
		 */
		public function add(item : *) : Boolean {
			var node : SortedNode;
			
			if (item is String) {
				if (_stringItems[item] !== undefined) return false;
				node = new SortedNode(item);
				addNode(node);
				_stringItems[item] = node;

			} else {
				if (_items[item] !== undefined) return false;
				node = new SortedNode(item);
				addNode(node);
				_items[item] = node;
			}
			return true;
		}
		
		/*
		 * ICollection
		 */
		
		/**
		 * @inheritDoc
		 */
		override public function has(item : *) : Boolean {
			if (item is String) return _stringItems[item] !== undefined;
			return _items[item] !== undefined;
		}
		
		/**
		 * @inheritDoc
		 */
		override public function remove(item : *) : Boolean {
			var node : SortedNode;
			
			if (item is String) {
				node = _stringItems[item];
				if (!node) return false;

			} else {
				node = _items[item];
				if (!node) return false;
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
			var node : SortedNode;
			if (cursor is String) node = _stringItems[cursor];
			else node = _items[cursor];
			return new SortedSetIterator(this, node);
		}

		/*
		 * Protected
		 */
		
		/**
		 * Returns the node of the given item.
		 * 
		 * @param item The item to get the node for.
		 * @return The node or <code>null</code> if the item is not contained.
		 */
		protected function getNode(item : *) : SortedNode {
			if (item is String) return _stringItems[item];
			return _items[item];
		}

		/**
		 * @inheritDoc
		 */
		override protected function removeNode(node : SortedNode) : void {
			super.removeNode(node);

			if (node.item is String) {
				delete _stringItems[node.item];

			} else {
				delete _items[node.item];
			}
		}

	}
}
