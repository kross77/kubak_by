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
package org.as3commons.collections.utils {

	import org.as3commons.collections.ArrayList;
	import org.as3commons.collections.SortedList;
	import org.as3commons.collections.framework.ICollection;
	import org.as3commons.collections.framework.IComparator;
	import org.as3commons.collections.framework.IIterator;
	import org.as3commons.collections.framework.IList;
	import org.as3commons.collections.framework.ISortOrder;
	import org.as3commons.collections.iterators.FilterIterator;

	/**
	 * <code>IList</code> utilities.
	 * 
	 * <p id="link_ListsAddFromExample"><strong><code>Lists.addFrom...()</code> example</strong></p>
	 * 
	 * <a class="exampleCollapsed" href="#link_ListsAddFromExample" onClick="toggleExample(this, 'ListsAddFromExample');">Show example</a><br /><div id="ListsAddFromExample" style='display:none'><listing version="3.0">package {
    import org.as3commons.collections.ArrayList;
    import org.as3commons.collections.LinkedList;
    import org.as3commons.collections.Map;
    import org.as3commons.collections.utils.Lists;
    import flash.display.Sprite;

    public class ListsAddFromExample extends Sprite {

        public function ListsAddFromExample() {
            // list to populate
            var list : ArrayList = new ArrayList();

            // from array (ordered)
            var a : Array = [1, "2", "2"];
            Lists.addFromArray(list, a);

            // from linked list (ordered)
            var l : LinkedList = new LinkedList();
            l.add("2");
            l.add(3);
            l.add("4");
            l.add(3);
            Lists.addFromCollection(list, l);

            // from map (no order)
            var m : Map = new Map();
            m.add("five", 5);
            m.add("six", "6");
            m.add("four", "4");
            Lists.addFromCollection(list, m);

            // from args (ordered)
            Lists.addFromArgs(list,
                7, "8", "8", 5
            );

            // test
            trace (list.toArray().join("n"));
            
            //    1            // from array
            //    2
            //    2
            //    2            // from linked list
            //    3
            //    4
            //    3
            //    4            // from map
            //    6
            //    5
            //    7            // from args
            //    8
            //    8
            //    5
        }

    }
}
</listing></div>
	 * 
	 * <p id="link_ListsCloneExample"><strong><code>Lists.clone()</code> example</strong></p>
	 * 
	 * <a class="exampleCollapsed" href="#link_ListsCloneExample" onClick="toggleExample(this, 'ListsCloneExample');">Show example</a><br /><div id="ListsCloneExample" style='display:none'><listing version="3.0">package {
    import org.as3commons.collections.utils.NumericComparator;
    import flash.utils.getQualifiedClassName;
    import org.as3commons.collections.framework.IList;
    import org.as3commons.collections.utils.Lists;
    import flash.display.Sprite;

    public class ListsCloneExample extends Sprite {

        public function ListsCloneExample() {
            // clone array list
            var list : IList = Lists.newArrayList(2, 4, 1, 3);
            var clone : IList = Lists.clone(list);
            trace (list.toArray().join("n"));
            trace (getQualifiedClassName(clone));
            //    2
            //    4
            //    1
            //    3
            //    org.as3commons.collections::ArrayList

            // clone sorted list
            list = Lists.newSortedList(
                new NumericComparator(),
                2, 4, 1, 3
            );
            clone = Lists.clone(list);
            trace (list.toArray().join("n"));
            trace (getQualifiedClassName(clone));
            //    1
            //    2
            //    3
            //    4
            //    org.as3commons.collections::SortedList
        }
        
    }
}
</listing></div>
	 * 
	 * <p id="link_ListsCopyExample"><strong><code>Lists.copy()</code> example</strong></p>
	 * 
	 * <a class="exampleCollapsed" href="#link_ListsCopyExample" onClick="toggleExample(this, 'ListsCopyExample');">Show example</a><br /><div id="ListsCopyExample" style='display:none'><listing version="3.0">package {
    import org.as3commons.collections.framework.IList;
    import org.as3commons.collections.utils.Lists;
    import org.as3commons.collections.utils.NumericComparator;
    import flash.display.Sprite;

    public class ListsCopyExample extends Sprite {
        public function ListsCopyExample() {
            // source
            var source : IList = Lists.newArrayList(1, 2, 3, 4);
            trace (source.toArray() + "n");
            //    1, 2, 3, 4
            
            // copy all
            var list : IList = Lists.newSortedList(
                new NumericComparator(),
                5, 6, 7, 8
            );
            trace (list.toArray() + "n");
            //    5, 6, 7, 8
            Lists.copy(source, list);
            trace (list.toArray() + "n");
            //    1, 2, 3, 4, 5, 6, 7, 8

            // copy only even items
            list = Lists.newSortedList(
                new NumericComparator(),
                6, 8
            );
            trace (list.toArray() + "n");
            //    6, 8
            Lists.copy(source, list, evenFilter);
            trace (list.toArray() + "n");
            //    2, 4, 6, 8
        }
        
        private function evenFilter(item : *) : Boolean {
            return item % 2 == 0;
        }

    }
}
</listing></div>
	 * 
	 * <p id="link_AddFromArgsExample"><strong><code>Lists.new...()</code> example</strong></p>
	 * 
	 * <a class="exampleCollapsed" href="#link_AddFromArgsExample" onClick="toggleExample(this, 'AddFromArgsExample');">Show example</a><br /><div id="AddFromArgsExample" style='display:none'><listing version="3.0">package {
    import org.as3commons.collections.framework.*;
    import org.as3commons.collections.utils.*;
    import flash.display.Sprite;

    public class AddFromArgsExample extends Sprite {

        public function AddFromArgsExample() {
            // ArrayList
            var list : IList = Lists.newArrayList(
                1, 2, 3, 4, 5, 6, 7, 8
            );
            trace (list.toArray() + "n");
            // 1, 2, 3, 4, 5, 6, 7, 8
            
            // ArrayList
            list = Lists.newSortedList(
                new NumericComparator(),
                6, 3, 1, 5, 8, 2, 7, 4
            );
            trace (list.toArray() + "n");
            // 1, 2, 3, 4, 5, 6, 7, 8
            
            // Set
            var theSet : ISet = Sets.newSet(
                1, 2, 3, 4, 5, 6, 7, 8
            );
            trace (theSet.toArray() + "n");
            // 1, 2, 3, 4, 5, 6, 7, 8
            
            // LinkedSet
            theSet = Sets.newLinkedSet(
                1, 2, 3, 4, 5, 6, 7, 8
            );
            trace (theSet.toArray() + "n");
            // 1, 2, 3, 4, 5, 6, 7, 8
            
            // SortedSet
            theSet = Sets.newSortedSet(
                new NumericComparator(),
                6, 3, 1, 5, 8, 2, 7, 4
            );
            trace (theSet.toArray() + "n");
            // 1, 2, 3, 4, 5, 6, 7, 8
            
            // Map
            var map : IMap = Maps.newMap(
                "one", 1, "two", 2, "three", 3, "four", 4
            );
            trace (map.toArray() + "n");
            // 1, 4, 2, 3
            
            // LinkedMap
            map = Maps.newLinkedMap(
                "one", 1, "two", 2, "three", 3, "four", 4
            );
            trace (map.toArray() + "n");
            // 1, 2, 3, 4
            
            // SortedMap
            map = Maps.newSortedMap(
                new NumericComparator(),
                "one", 1, "two", 2, "three", 3, "four", 4
            );
            trace (map.toArray() + "n");
            // 1, 2, 3, 4
            
            // LinkedList
            var linkedList : ILinkedList = LinkedLists.newLinkedList(
                1, 2, 3, 4, 5, 6, 7, 8
            );
            trace (linkedList.toArray() + "n");
            // 1, 2, 3, 4, 5, 6, 7, 8
        }

    }
}
</listing></div>
	 * 
	 * <p id="link_NestedCollectionsExample"><strong>Nested collections example</strong></p>
	 * 
	 * <a class="exampleCollapsed" href="#link_NestedCollectionsExample" onClick="toggleExample(this, 'NestedCollectionsExample');">Show example</a><br /><div id="NestedCollectionsExample" style='display:none'><listing version="3.0">package {
    import org.as3commons.collections.ArrayList;
    import org.as3commons.collections.LinkedSet;
    import org.as3commons.collections.framework.IComparator;
    import org.as3commons.collections.utils.*;
    import flash.display.Sprite;

    public class NestedCollectionsExample extends Sprite {

        public function NestedCollectionsExample() {
            // nested array list
            var list : ArrayList = Lists.newArrayList(
                Lists.newArrayList(1, 2),
                Lists.newArrayList(
                    Lists.newArrayList(3, 4),
                    Lists.newArrayList(5, 6)
                ),
                Lists.newArrayList(7, 8),
                Lists.newArrayList(
                    Lists.newArrayList(9, 10),
                    Lists.newArrayList(11, 12)
                )
            );
            trace (CollectionUtils.dumpAsString(list));
            //    [object ArrayList]
            //    .......[object ArrayList]
            //    ..............1
            //    ..............2
            //    .......[object ArrayList]
            //    ..............[object ArrayList]
            //    .....................3
            //    .....................4
            //    ..............[object ArrayList]
            //    .....................5
            //    .....................6
            //    .......[object ArrayList]
            //    ..............7
            //    ..............8
            //    .......[object ArrayList]
            //    ..............[object ArrayList]
            //    .....................9
            //    .....................10
            //    ..............[object ArrayList]
            //    .....................11
            //    .....................12            
            
            // nested mixed collection
            var c : IComparator = new NumericComparator();
            var theSet : LinkedSet = Sets.newLinkedSet(
                Maps.newLinkedMap("one", 1, "two", 2),
                Lists.newArrayList(
                    Sets.newSortedSet(c, 4, 3),
                    LinkedLists.newLinkedList(5, 6)
                ),
                Lists.newSortedList(c, 8, 7),
                Lists.newArrayList(
                    Maps.newLinkedMap("nine", 9, "ten", 10),
                    Maps.newSortedMap(c, "twelve", 12, "eleven", 11)
                )
            );
            trace (CollectionUtils.dumpAsString(theSet));
            //    [object LinkedSet]
            //    .......[object LinkedMap]
            //    ..............1
            //    ..............2
            //    .......[object ArrayList]
            //    ..............[object SortedSet]
            //    .....................3
            //    .....................4
            //    ..............[object LinkedList]
            //    .....................5
            //    .....................6
            //    .......[object SortedList]
            //    ..............7
            //    ..............8
            //    .......[object ArrayList]
            //    ..............[object LinkedMap]
            //    .....................9
            //    .....................10
            //    ..............[object SortedMap]
            //    .....................11
            //    .....................12            
        }
    }
}
</listing></div>
	 * 
	 * @author Jens Struwe 21.04.2011
	 */
	public class Lists {

		/*
		 * Factories
		 */

		/**
		 * Creates, populates and returns a new <code>ArrayList</code> instance.
		 * 
		 * <p>The arguments may be left out. In that case no item is added to the list.</p>
		 * 
		 * <listing>
				var list : ArrayList = Lists.newArrayList(item1, item2, ...);
		 * </listing>
		 * 
		 * @param ...args List of items to add to the list.
		 * @return A new <code>ArrayList</code> instance populated from the given arguments.
		 */
		public static function newArrayList(...args) : ArrayList {
			var list : ArrayList = new ArrayList();
			addFromArray(list, args);
			return list;
		}

		/**
		 * Creates, populates and returns a new <code>ArrayList</code> instance.
		 * 
		 * <p>The arguments may be left out. In that case no item is added to the list.</p>
		 * 
		 * <listing>
				var list : ArrayList = Lists.newSortedList(comparator, item1, item2, ...);
		 * </listing>
		 * 
		 * @param ...args List of items to add to the list.
		 * @param comparator The sort criterion.
		 * @return A new <code>SortedList</code> instance populated from the given arguments.
		 */
		public static function newSortedList(comparator : IComparator, ...args) : SortedList {
			var list : SortedList = new SortedList(comparator);
			addFromArray(list, args);
			return list;
		}

		/*
		 * Population
		 */

		/**
		 * Adds the contents of the given <code>Array</code> to the specified list.
		 * 
		 * <listing>
				var array : Array = [item1, item2, ...];
				var count : uint = Lists.addFromArray(list, array);
		 * </listing>
		 * 
		 * @param list The list to populate.
		 * @param source The <code>Array</code> to add from.
		 * @return The number of items added to the list.
		 */
		public static function addFromArray(list : IList, source : Array) : uint {
			if (!source) return 0;

			var numAdded : uint;
			var wrapper : Args;
			for (var i : uint; i < source.length; i++) {
				if (source[i] is Args) {
					wrapper = source[i];
					if (wrapper.source is Array) numAdded += addFromArray(list, wrapper.source as Array);
					else if (wrapper.source is ICollection) numAdded += addFromCollection(list, wrapper.source as ICollection);
					else {
						list.add(wrapper.source);
						numAdded++;
					}

				} else {
					list.add(source[i]);
					numAdded++;
				}
			}
			return numAdded;
		}

		/**
		 * Adds the contents of the given <code>ICollection</code> to the specified list.
		 * 
		 * <listing>
				var count : uint = Lists.addFromCollection(list, sourceCollection);
		 * </listing>
		 * 
		 * @param list The list to populate.
		 * @param source The <code>ICollection</code> to add from.
		 * @return The number of items added to the list.
		 */
		public static function addFromCollection(list : IList, source : ICollection) : uint {
			if (!source) return 0;

			var added : uint;
			var iterator : IIterator = source.iterator();
			while (iterator.hasNext()) {
				list.add(iterator.next());
				added++;
			} 
			return added;
		}

		/**
		 * Adds the given list of items to the specified list.
		 * 
		 * <listing>
				Lists.addFromArgs(myList, item1, item2, ...);
		 * </listing>
		 * 
		 * @param list The list to populate.
		 * @param ...args List of items to add to the list.
		 * @return The number of items added to the list.
		 */
		public static function addFromArgs(list : IList, ...args) : uint {
			return addFromArray(list, args);
		}

		/**
		 * Clones the supplied <code>IList</code> instance returning a new <code>IList</code>
		 * of the same type.
		 * 
		 * <p>If a filter is specified the resulting list only contains items that
		 * meet the supplied predicates.<p>
		 * 
		 * <p>The filter function accepts the current item and returns a boolean
		 * value (<code>true</code> if the item is accepted).</p>
		 * 
		 * <listing>
			function itemFilter(item : *) : Boolean {
				var accept : Boolean = false;
				// test the item
				return accept;
			}
					
			var list : IList = Lists.clone(list, filter);
		 * </listing>
		 * 
		 * @param list The <code>IList</code> instance to clone.
		 * @param filter Function which will be applied to each item in the source list.
		 * @return A new <code>IList</code> instance.
		 */
		public static function clone(list : IList, filter : Function = null) : IList {
			var clone : IList = new ((list as Object).constructor)() as IList;
			if (list is ISortOrder) ISortOrder(clone).comparator = ISortOrder(list).comparator;
			
			var iterator : IIterator = new FilterIterator(list, filter);
			while (iterator.hasNext()) {
				clone.add(iterator.next());
			}
			return clone;
		}

		/**
		 * Copies items from one list to another.
		 * 
		 * <p>If a filter is specified only items are copied that meet the
		 * supplied predicates.<p>
		 * 
		 * <p>The filter function accepts the current item and returns a boolean
		 * value (<code>true</code> if the item is accepted).</p>
		 * 
		 * <listing>
			function itemFilter(item : *) : Boolean {
				var accept : Boolean = false;
				// test the item
				return accept;
			}
					
			Lists.copy(sourceList, destinationList, filter);
		 * </listing>
		 * 
		 * @param source The <code>IList</code> instance to copy from.
		 * @param destination The <code>IList</code> to copy to.
		 * @param filter Function which will be applied to each item in the source list.
		 * @return The number of items copied to the list.
		 */
		public static function copy(source : IList, destination : IList, filter : Function = null) : uint {
			var iterator : IIterator = new FilterIterator(source, filter);
			var numAdded : uint;
			while (iterator.hasNext()) {
				destination.add(iterator.next());
				numAdded++;
			}
			return numAdded;
		}

	}
}
