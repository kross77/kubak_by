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

	import org.as3commons.collections.LinkedSet;
	import org.as3commons.collections.Set;
	import org.as3commons.collections.SortedSet;
	import org.as3commons.collections.framework.ICollection;
	import org.as3commons.collections.framework.IComparator;
	import org.as3commons.collections.framework.IIterator;
	import org.as3commons.collections.framework.ISet;
	import org.as3commons.collections.framework.ISortOrder;
	import org.as3commons.collections.iterators.FilterIterator;

	/**
	 * <code>ISet</code> utilities.
	 * 
	 * <p id="link_SetsAddFromExample"><strong><code>Sets.addFrom...()</code> example</strong></p>
	 * 
	 * <a class="exampleCollapsed" href="#link_SetsAddFromExample" onClick="toggleExample(this, 'SetsAddFromExample');">Show example</a><br /><div id="SetsAddFromExample" style='display:none'><listing version="3.0">package {
    import org.as3commons.collections.LinkedList;
    import org.as3commons.collections.LinkedSet;
    import org.as3commons.collections.Map;
    import org.as3commons.collections.utils.Sets;
    import flash.display.Sprite;

    public class SetsAddFromExample extends Sprite {

        public function SetsAddFromExample() {
            // set to populate
            var theSet : LinkedSet = new LinkedSet();

            // from array (ordered)
            var a : Array = [1, "2", "2"]; // second "2" ignored by set
            Sets.addFromArray(theSet, a);

            // from linked list (ordered)
            var l : LinkedList = new LinkedList();
            l.add("2"); // ignored by set
            l.add(3);
            l.add("4");
            l.add(3); // ignored by set
            Sets.addFromCollection(theSet, l);

            // from map (no order)
            var m : Map = new Map();
            m.add("five", 5);
            m.add("six", "6");
            m.add("four", "4"); // ignored by set
            Sets.addFromCollection(theSet, m);

            // from args (ordered)
            Sets.addFromArgs(theSet,
                7, "8", "6" // "6" ignored by set
            );

            // test
            trace (theSet.toArray().join("n"));
            
            //    1            // from array
            //    2
            //    3            // from linked list
            //    4
            //    6            // from map
            //    5
            //    7            // from args
            //    8
        }

    }
}
</listing></div>
	 * 
	 * <p id="link_SetsCloneExample"><strong><code>Sets.clone()</code> example</strong></p>
	 * 
	 * <a class="exampleCollapsed" href="#link_SetsCloneExample" onClick="toggleExample(this, 'SetsCloneExample');">Show example</a><br /><div id="SetsCloneExample" style='display:none'><listing version="3.0">package {
    import org.as3commons.collections.utils.NumericComparator;
    import flash.utils.getQualifiedClassName;
    import org.as3commons.collections.framework.ISet;
    import org.as3commons.collections.utils.Sets;
    import flash.display.Sprite;

    public class SetsCloneExample extends Sprite {

        public function SetsCloneExample() {
            // clone simple set
            var theSet : ISet = Sets.newSet(2, 4, 1, 3);
            var clone : ISet = Sets.clone(theSet);
            trace (theSet.toArray().join("n"));
            trace (getQualifiedClassName(clone));
            //    1
            //    2
            //    3
            //    4
            //    org.as3commons.collections::Set
            
            // clone linked theSet
            theSet = Sets.newLinkedSet(2, 4, 1, 3);
            clone = Sets.clone(theSet);
            trace (theSet.toArray().join("n"));
            trace (getQualifiedClassName(clone));
            //    2
            //    4
            //    1
            //    3
            //    org.as3commons.collections::LinkedSet

            // clone sorted set
            theSet = Sets.newSortedSet(
                new NumericComparator(),
                2, 4, 1, 3
            );
            clone = Sets.clone(theSet);
            trace (theSet.toArray().join("n"));
            trace (getQualifiedClassName(clone));
            //    1
            //    2
            //    3
            //    4
            //    org.as3commons.collections::SortedSet
        }
        
    }
}
</listing></div>
	 * 
	 * <p id="link_SetsCopyExample"><strong><code>Sets.copy()</code> example</strong></p>
	 * 
	 * <a class="exampleCollapsed" href="#link_SetsCopyExample" onClick="toggleExample(this, 'SetsCopyExample');">Show example</a><br /><div id="SetsCopyExample" style='display:none'><listing version="3.0">package {
    import org.as3commons.collections.framework.ISet;
    import org.as3commons.collections.utils.Sets;
    import org.as3commons.collections.utils.NumericComparator;
    import flash.display.Sprite;

    public class SetsCopyExample extends Sprite {
        public function SetsCopyExample() {
            // source
            var source : ISet = Sets.newLinkedSet(1, 2, 3, 4);
            trace (source.toArray() + "n");
            //    1, 2, 3, 4
            
            // copy all
            var theSet : ISet = Sets.newSortedSet(
                new NumericComparator(),
                5, 6, 7, 8
            );
            trace (theSet.toArray() + "n");
            //    5, 6, 7, 8
            Sets.copy(source, theSet);
            trace (theSet.toArray() + "n");
            //    1, 2, 3, 4, 5, 6, 7, 8

            // copy only even items
            theSet = Sets.newSortedSet(
                new NumericComparator(),
                6, 8
            );
            trace (theSet.toArray() + "n");
            //    6, 8
            Sets.copy(source, theSet, evenFilter);
            trace (theSet.toArray() + "n");
            //    2, 4, 6, 8
        }
        
        private function evenFilter(item : *) : Boolean {
            return item % 2 == 0;
        }

    }
}
</listing></div>
	 * 
	 * <p id="link_AddFromArgsExample"><strong><code>Sets.new...()</code> example</strong></p>
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
	public class Sets {

		/*
		 * Factories
		 */

		/**
		 * Creates, populates and returns a new <code>Set</code> instance.
		 * 
		 * <p>The arguments may be left out. In that case no item is added to the set.</p>
		 * 
		 * <listing>
				var theSet : LinkedSet = Sets.newSet(item1, item2, ...);
		 * </listing>
		 * 
		 * @param ...args List of key-item-pairs to add to the set.
		 * @return A new <code>Set</code> instance populated from the given arguments.
		 */
		public static function newSet(...args) : Set {
			var theSet : Set = new Set();
			addFromArray(theSet, args);
			return theSet;
		}

		/**
		 * Creates, populates and returns a new <code>LinkedSet</code> instance.
		 * 
		 * <p>The arguments may be left out. In that case no item is added to the set.</p>
		 * 
		 * <listing>
				var theSet : LinkedSet = Sets.newLinkedSet(item1, item2, ...);
		 * </listing>
		 * 
		 * @param ...args List of items to add to the set.
		 * @return A new <code>LinkedSet</code> instance populated from the given arguments.
		 */
		public static function newLinkedSet(...args) : LinkedSet {
			var theSet : LinkedSet = new LinkedSet();
			addFromArray(theSet, args);
			return theSet;
		}

		/**
		 * Creates, populates and returns a new <code>LinkedSet</code> instance.
		 * 
		 * <p>The arguments may be left out. In that case no item is added to the set.</p>
		 * 
		 * <listing>
				var theSet : LinkedSet = Sets.newSortedSet(comparator, item1, item2, ...);
		 * </listing>
		 * 
		 * @param ...args List of items to add to the set.
		 * @param comparator The sort criterion.
		 * @return A new <code>LinkedSet</code> instance populated from the given arguments.
		 */
		public static function newSortedSet(comparator : IComparator, ...args) : SortedSet {
			var theSet : SortedSet = new SortedSet(comparator);
			addFromArray(theSet, args);
			return theSet;
		}

		/*
		 * Population
		 */

		/**
		 * Adds the contents of the given <code>Array</code> to the specified set.
		 * 
		 * <listing>
				var array : Array = [item1, item2, ...];
				var count : uint = Sets.addFromArray(theSet, array);
		 * </listing>
		 * 
		 * @param theSet The set to populate.
		 * @param source The <code>Array</code> to add from.
		 * @return The number of items added to the set.
		 */
		public static function addFromArray(theSet : ISet, source : Array) : uint {
			if (!source) return 0;

			var numAdded : uint;
			var wrapper : Args;
			for (var i : uint; i < source.length; i++) {
				if (source[i] is Args) {
					wrapper = source[i];
					if (wrapper.source is Array) numAdded += addFromArray(theSet, wrapper.source as Array);
					else if (wrapper.source is ICollection) numAdded += addFromCollection(theSet, wrapper.source as ICollection);
					else {
						if (theSet.add(wrapper.source)) numAdded++;
					}

				} else {
					if (theSet.add(source[i])) numAdded++;
				}
			}
			return numAdded;
		}

		/**
		 * Adds the contents of the given <code>ICollection</code> to the specified set.
		 * 
		 * <listing>
				var count : uint = Sets.addFromCollection(theSet, sourceCollection);
		 * </listing>
		 * 
		 * @param theSet The set to populate.
		 * @param source The <code>ICollection</code> to add from.
		 * @return The number of items added to the set.
		 */
		public static function addFromCollection(theSet : ISet, source : ICollection) : uint {
			if (!source) return 0;

			var added : uint;
			var iterator : IIterator = source.iterator();
			while (iterator.hasNext()) {
				theSet.add(iterator.next());
				added++;
			} 
			return added;
		}

		/**
		 * Adds the given list of items to the specified set.
		 * 
		 * <listing>
				Sets.addFromArgs(mySet, item1, item2, ...);
		 * </listing>
		 * 
		 * @param theSet The set to populate.
		 * @param ...args List of items to add to the set.
		 * @return The number of items added to the set.
		 */
		public static function addFromArgs(theSet : ISet, ...args) : uint {
			return addFromArray(theSet, args);
		}

		/**
		 * Clones the supplied <code>ISet</code> instance returning a new <code>ISet</code>
		 * of the same type.
		 * 
		 * <p>If a filter is specified the resulting set only contains items that
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
					
			var theSet : ISet = Sets.clone(theSet, filter);
		 * </listing>
		 * 
		 * @param theSet The <code>ISet</code> instance to clone.
		 * @param filter Function which will be applied to each item in the source theSet.
		 * @return A new <code>ISet</code> instance.
		 */
		public static function clone(theSet : ISet, filter : Function = null) : ISet {
			var clone : ISet = new ((theSet as Object).constructor)() as ISet;
			if (theSet is ISortOrder) ISortOrder(clone).comparator = ISortOrder(theSet).comparator;
			
			var iterator : IIterator = new FilterIterator(theSet, filter);
			while (iterator.hasNext()) {
				clone.add(iterator.next());
			}
			return clone;
		}

		/**
		 * Copies items from one set to another.
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
					
			Sets.copy(sourceSet, destinationSet, filter);
		 * </listing>
		 * 
		 * @param source The <code>ISet</code> instance to copy from.
		 * @param destination The <code>ISet</code> to copy to.
		 * @param filter Function which will be applied to each item in the source set.
		 * @return The number of items copied to the set.
		 */
		public static function copy(source : ISet, destination : ISet, filter : Function = null) : uint {
			var iterator : IIterator = new FilterIterator(source, filter);
			var numAdded : uint;
			while (iterator.hasNext()) {
				if (destination.add(iterator.next())) numAdded++;
			}
			return numAdded;
		}

	}
}
