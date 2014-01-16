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
	import org.as3commons.collections.framework.ILinkedList;
	import org.as3commons.collections.framework.core.AbstractLinkedDuplicatesCollection;
	import org.as3commons.collections.framework.core.LinkedListIterator;
	import org.as3commons.collections.framework.core.LinkedNode;
	import org.as3commons.collections.framework.core.as3commons_collections;

	/**
	 * Linked list data structure implementation.
	 * 
	 * <p><strong>Description</strong></p>
	 * 
	 * <p>The <code>LinkedList</code> is a collection made up of mutually linking nodes
	 * where each node holds a reference to the actual item added.</p>
	 * 
	 * <p><strong>Runtime of operations</strong></p>
	 * 
	 * <ul>
	 * <li>Adding, getting or removing of items - constant runtime O(1).<br />
	 * <code>add(), addFirst(), addLast(), first, last, removeFirst(), removeLast()</code></li>
	 * <li>Item lookup operations - linear runtime O(n).<br />
	 * has(), count(), remove(), removeAll()</code></li>
	 * </ul>
	 * 
	 * <p><strong>Notes</strong></p>
	 * 
	 * <p>The <code>iterator()</code> method does not support (ignores) the cursor parameter.</p>
	 * 
	 * <p>The <code>iterator()</code> method retuns an <code>ILinkedListIterator</code>.</p>
	 * 
	 * <p><code>null</code> is allowed.</p>
	 * 
	 * <p id="link_LinkedListExample"><strong>LinkedList example</strong></p>
	 * 
	 * <p>This example shows the specific behaviour of a <code>LinkedList</code>.
	 * The general work with collections and iterators is more detailed illustrated
	 * in the <code>ArrayList</code> examples below.</p>
	 * 
	 * <a class="exampleCollapsed" href="#link_LinkedListExample" onClick="toggleExample(this, 'LinkedListExample');">Show example</a><br /><div id="LinkedListExample" style='display:none'><listing version="3.0">package {
    import org.as3commons.collections.LinkedList;
    import org.as3commons.collections.framework.ICollectionIterator;
    import org.as3commons.collections.framework.IIterator;
    import org.as3commons.collections.framework.ILinkedList;
    import org.as3commons.collections.framework.ILinkedListIterator;
    import flash.display.Sprite;

    public class LinkedListExample extends Sprite {

        public function LinkedListExample() {
            var list : ILinkedList = new LinkedList();
            
            // Add
            
            list.add(4);
            list.add(1);
            list.add(3);
            list.add(5);
            list.add(2);
            trace (list.toArray()); // 4,1,3,5,2
            
            list.addFirst(6);
            list.addLast(7);
            trace (list.toArray()); // 6,4,1,3,5,2,7

            // Inspection
            
            trace (list.first); // 6
            trace (list.last); // 7
            
            // Iterator

            var iterator : IIterator = list.iterator();
            trace (iterator is IIterator); // true
            trace (iterator is ICollectionIterator); // true
            trace (iterator is ILinkedListIterator); // true
            
            while (iterator.hasNext()) {
                trace (iterator.next()); // 6,4,1,3,5,2,7
            }

            // Linked list iterator

            var lli : ILinkedListIterator = list.iterator() as ILinkedListIterator;
            trace (lli.previousItem + " [" + lli.current + "] " + lli.nextItem);
            while (lli.hasNext()) {
                lli.next();
                trace (lli.previousItem + " [" + lli.current + "] " + lli.nextItem);
            }

            // undefined [undefined] 6
            // 6 [6] 4
            // 4 [4] 1
            // 1 [1] 3
            // 3 [3] 5
            // 5 [5] 2
            // 2 [2] 7
            // 7 [7] undefined

            // Remove

            list.removeFirst();
            list.removeFirst();
            list.removeLast();
            list.removeLast();
            trace (list.toArray()); // 1,3,5
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
	 * @author Jens Struwe 04.03.2010
	 * @see org.as3commons.collections.framework.ILinkedList ILinkedList interface - Detailed description of the linked list features.
	 * @see org.as3commons.collections.framework.ILinkedListIterator ILinkedListIterator interface - Detailed description of the linked list iterator features.
	 */
	public class LinkedList extends AbstractLinkedDuplicatesCollection implements ILinkedList {

		/**
		 * LinkedList constructor.
		 */
		public function LinkedList() {
		}

		/*
		 * ILinkedList
		 */

		/**
		 * @inheritDoc
		 */
		public function add(item : *) : void {
			addNodeLast(new LinkedNode(item));
		}
		
		/**
		 * @inheritDoc
		 */
		public function addFirst(item : *) : void {
			addNodeFirst(new LinkedNode(item));
		}
		
		/**
		 * @inheritDoc
		 */
		public function addLast(item : *) : void {
			addNodeLast(new LinkedNode(item));
		}
		
		/*
		 * IIterable
		 */

		/**
		 * @inheritDoc
		 */
		override public function iterator(cursor : * = undefined) : IIterator {
			return new LinkedListIterator(this);
		}

		/*
		 * as3commons_collections
		 */

		/**
		 * Framework internal method to remove a node from the list.
		 * 
		 * @param node The node to remove.
		 */
		as3commons_collections function removeNode_internal(node : LinkedNode) : void {
			removeNode(node);
		}

		/**
		 * Framework internal method to add a node before an existing one.
		 * 
		 * @param next The node to add before.
		 * @param node The node to add.
		 */
		as3commons_collections function addNodeBefore_internal(next : LinkedNode, node : LinkedNode) : void {
			addNodeBefore(next, node);
		}
		
	}
}
