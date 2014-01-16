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

	import org.as3commons.collections.LinkedMap;
	import org.as3commons.collections.Map;
	import org.as3commons.collections.SortedMap;
	import org.as3commons.collections.framework.IBasicMapIterator;
	import org.as3commons.collections.framework.IComparator;
	import org.as3commons.collections.framework.IMap;
	import org.as3commons.collections.framework.IMapIterator;
	import org.as3commons.collections.framework.ISortOrder;
	import org.as3commons.collections.iterators.MapFilterIterator;

	/**
	 * <code>IMap</code> utilities.
	 * 
	 * <p id="link_MapsAddFromExample"><strong><code>Maps.addFrom...()</code> example</strong></p>
	 * 
	 * <a class="exampleCollapsed" href="#link_MapsAddFromExample" onClick="toggleExample(this, 'MapsAddFromExample');">Show example</a><br /><div id="MapsAddFromExample" style='display:none'><listing version="3.0">package {
    import org.as3commons.collections.LinkedMap;
    import org.as3commons.collections.framework.IMapIterator;
    import org.as3commons.collections.utils.Maps;
    import flash.display.Sprite;
    import flash.utils.Dictionary;

    public class MapsAddFromExample extends Sprite {

        public function MapsAddFromExample() {
            // map to populate
            var map : LinkedMap = new LinkedMap();

            // from object (no order)
            var o : Object = {
                1: "1",
                "2": "two"
            };
            Maps.addFromObject(map, o);

            // from dictionary (no order)
            var d : Dictionary = new Dictionary();
            d["2"] = "two (2)"; // ignored by map
            d[3] = "3";
            d["4"] = "four";
            Maps.addFromObject(map, d);

            // from array (ordered)
            var a : Array = [
                3, "3 (2)", // ignored by map
                5, "5",
                "6", "six"
            ];
            Maps.addFromArray(map, a);

            // from map (ordered)
            var m : LinkedMap = new LinkedMap();
            m.add("6", "six (2)"); // ignored by map
            m.add(7, "7");
            m.add("8", "eight");
            Maps.addFromMap(map, m);

            // from args (ordered)
            Maps.addFromArgs(map,
                "8", "eight (2)", // ignored by map
                9, "9",
                "10", "ten"
            );

            // test
            var i : IMapIterator = map.iterator() as IMapIterator;
            while (i.next()) trace (i.key, "=&gt;", i.current);
            
            //    1 =&gt; 1            // from object
            //    2 =&gt; two
            //    4 =&gt; four        // from dictionary
            //    3 =&gt; 3
            //    5 =&gt; 5            // from array
            //    6 =&gt; six
            //    7 =&gt; 7            // from linked map
            //    8 =&gt; eight
            //    9 =&gt; 9            // from args
            //    10 =&gt; ten
        }

    }
}
</listing></div>
	 * 
	 * <p id="link_MapsCloneExample"><strong><code>Maps.clone()</code> example</strong></p>
	 * 
	 * <a class="exampleCollapsed" href="#link_MapsCloneExample" onClick="toggleExample(this, 'MapsCloneExample');">Show example</a><br /><div id="MapsCloneExample" style='display:none'><listing version="3.0">package {
    import org.as3commons.collections.utils.NumericComparator;
    import flash.utils.getQualifiedClassName;
    import org.as3commons.collections.framework.IMap;
    import org.as3commons.collections.framework.IMapIterator;
    import org.as3commons.collections.utils.Maps;
    import flash.display.Sprite;

    public class MapsCloneExample extends Sprite {

        public function MapsCloneExample() {
            // clone simple map
            var map : IMap = Maps.newMap(
                "two", 2, "four", 4, "one", 1, "three", 3
            );
            var clone : IMap = Maps.clone(map);
            dumpMap(clone);
            trace (getQualifiedClassName(clone));
            //    three =&gt; 3
            //    four =&gt; 4
            //    one =&gt; 1
            //    two =&gt; 2
            //    org.as3commons.collections::Map
            
            // clone linked map
            map = Maps.newLinkedMap(
                "two", 2, "four", 4, "one", 1, "three", 3
            );
            clone = Maps.clone(map);
            dumpMap(clone);
            trace (getQualifiedClassName(clone));
            //    two =&gt; 2
            //    four =&gt; 4
            //    one =&gt; 1
            //    three =&gt; 3
            //    org.as3commons.collections::LinkedMap

            // clone sorted map
            map = Maps.newSortedMap(
                new NumericComparator(),
                "two", 2, "four", 4, "one", 1, "three", 3
            );
            clone = Maps.clone(map);
            dumpMap(clone);
            trace (getQualifiedClassName(clone));
            //    one =&gt; 1
            //    two =&gt; 2
            //    three =&gt; 3
            //    four =&gt; 4
            //    org.as3commons.collections::SortedMap
        }
        
        private function dumpMap(map : IMap) : void {
            var i : IMapIterator = map.iterator() as IMapIterator;
            while (i.next()) trace (i.key, "=&gt;", i.current);
        }
    }
}
</listing></div>
	 * 
	 * <p id="link_MapsCopyExample"><strong><code>Maps.copy()</code> example</strong></p>
	 * 
	 * <a class="exampleCollapsed" href="#link_MapsCopyExample" onClick="toggleExample(this, 'MapsCopyExample');">Show example</a><br /><div id="MapsCopyExample" style='display:none'><listing version="3.0">package {
    import org.as3commons.collections.framework.IMap;
    import org.as3commons.collections.framework.IMapIterator;
    import org.as3commons.collections.utils.Maps;
    import org.as3commons.collections.utils.NumericComparator;
    import flash.display.Sprite;

    public class MapsCopyExample extends Sprite {
        public function MapsCopyExample() {
            // source
            var source : IMap = Maps.newLinkedMap(
                1, 1, 2, 1,
                3, 2, 4, 2 
            );
            dumpMap(source);
            //    1 =&gt; 1
            //    2 =&gt; 1
            //    3 =&gt; 2
            //    4 =&gt; 2
            
            // copy all
            var map : IMap = Maps.newSortedMap(
                new NumericComparator(),
                5, 3, 6, 3,
                7, 4, 8, 4
            );
            dumpMap(map);
            //    5 =&gt; 3
            //    6 =&gt; 3
            //    7 =&gt; 4
            //    8 =&gt; 4
            Maps.copy(source, map);
            dumpMap(map);
            //    1 =&gt; 1
            //    2 =&gt; 1
            //    3 =&gt; 2
            //    4 =&gt; 2
            //    5 =&gt; 3
            //    6 =&gt; 3
            //    7 =&gt; 4
            //    8 =&gt; 4

            // copy only even keys
            map = Maps.newSortedMap(
                new NumericComparator(),
                6, 3,
                8, 4
            );
            dumpMap(map);
            //    6 =&gt; 3
            //    8 =&gt; 4
            Maps.copy(source, map, evenFilter);
            dumpMap(map);
            //    2 =&gt; 1
            //    4 =&gt; 2
            //    6 =&gt; 3
            //    8 =&gt; 4

            // copy only even items
            map = Maps.newSortedMap(
                new NumericComparator(),
                7, 4, 8, 4
            );
            dumpMap(map);
            //    7 =&gt; 4
            //    8 =&gt; 4
            Maps.copy(source, map, null, evenFilter);
            dumpMap(map);
            //    3 =&gt; 2
            //    4 =&gt; 2
            //    7 =&gt; 4
            //    8 =&gt; 4

            // copy only even keys with even items
            map = Maps.newSortedMap(
                new NumericComparator(),
                8, 4
            );
            dumpMap(map);
            //    8 =&gt; 4
            Maps.copy(source, map, evenFilter, evenFilter);
            dumpMap(map);
            //    4 =&gt; 2
            //    8 =&gt; 4
        }
        
        private function evenFilter(item : *) : Boolean {
            return item % 2 == 0;
        }

        private function dumpMap(map : IMap) : void {
            var i : IMapIterator = map.iterator() as IMapIterator;
            while (i.next()) trace (i.key, "=&gt;", i.current);
            trace();
        }

    }
}
</listing></div>
	 * 
	 * <p id="link_AddFromArgsExample"><strong><code>Maps.new...()</code> example</strong></p>
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
	 * @author John Reeves 14.04.2011
	 */
	public class Maps {
		
		/*
		 * Factories
		 */

		/**
		 * Creates, populates and returns a new <code>Map</code> instance.
		 * 
		 * <p>The arguments may be left out. In that case no item is added to the map.</p>
		 * 
		 * <p>The last argument is skipped if the size of arguments is not even.</p>
		 * 
		 * <listing>
				var map : Map = Maps.newMap(key1, item1, key2, item2, ...);
		 * </listing>
		 * 
		 * @param ...args List of key-item-pairs to add to the map.
		 * @return A new <code>Map</code> instance populated from the given arguments.
		 */
		public static function newMap(...args) : Map {
			var map : Map = new Map();
			addFromArray(map, args);
			return map;
		}

		/**
		 * Creates, populates and returns a new <code>LinkedMap</code> instance.
		 * 
		 * <p>The arguments may be left out. In that case no item is added to the map.</p>
		 * 
		 * <p>The last argument is skipped if the size of arguments is not even.</p>
		 * 
		 * <listing>
				var map : Map = Maps.newLinkedMap(key1, item1, key2, item2, ...);
		 * </listing>
		 * 
		 * @param ...args List of key-item-pairs to add to the map.
		 * @return A new <code>LinkedMap</code> instance populated from the given arguments.
		 */
		public static function newLinkedMap(...args) : LinkedMap {
			var map : LinkedMap = new LinkedMap();
			addFromArray(map, args);
			return map;
		}

		/**
		 * Creates, populates and returns a new <code>SortedMap</code> instance.
		 * 
		 * <p>The arguments may be left out. In that case no item is added to the map.</p>
		 * 
		 * <p>The last argument is skipped if the size of arguments is not even.</p>
		 * 
		 * <listing>
				var map : Map = Maps.newSortedMap(key1, item1, key2, item2, ...);
		 * </listing>
		 * 
		 * @param comparator The sort criterion.
		 * @param ...args List of key-item-pairs to add to the map.
		 * @return A new <code>SortedMap</code> instance populated from the given arguments.
		 */
		public static function newSortedMap(comparator : IComparator, ...args) : SortedMap {
			var map : SortedMap = new SortedMap(comparator);
			addFromArray(map, args);
			return map;
		}

		/*
		 * Population
		 */

		/**
		 * Adds the contents of the given <code>Array</code> to the specified map.
		 * 
		 * <p>The <code>Array</code> needs to be in a key-item-pair shape.</p>
		 * 
		 * <p>The last <code>Array</code> element is skipped if the size of the Array is not even.</p>
		 * 
		 * <listing>
				var array : Array = [key1, item1, key2, item2, ...];
				var count : uint = Maps.addFromArray(map, array);
		 * </listing>
		 * 
		 * @param map The map to populate.
		 * @param source The <code>Array</code> to add from.
		 * @return The number of items added to the map.
		 */
		public static function addFromArray(map : IMap, source : Array) : uint {
			if (!source) return 0;

			var numAdded : uint;
			var wrapper : Args;
			var item : *;
			for (var i : uint; i < source.length; i++) {
				if (source[i] is Args) {
					wrapper = source[i];
					if (wrapper.source is Array) numAdded += addFromArray(map, wrapper.source as Array);
					else if (wrapper.source is IMap) numAdded += addFromMap(map, wrapper.source as IMap);
					else if (wrapper.source is Object) numAdded += addFromObject(map, wrapper.source);

				} else {
					// skip key without item
					if (i == source.length - 1) break;
					// ignore args wrapper for items
					item = source[i + 1] is Args ? Args(source[i + 1]).source : source[i + 1];
					if (map.add(source[i], item)) numAdded++;
					i++;
				}
			}
			return numAdded;
		}

		/**
		 * Adds the contents of the given <code>IMap</code> to the specified map.
		 * 
		 * <listing>
				var count : uint = Maps.addFromMap(map, sourceMap);
		 * </listing>
		 * 
		 * @param map The map to populate.
		 * @param source The <code>IMap</code> to add from.
		 * @return The number of items added to the map.
		 */
		public static function addFromMap(map : IMap, source : IMap) : uint {
			if (!source) return 0;

			var numAdded : uint;
			var iterator : IMapIterator = source.iterator() as IMapIterator;
			while (iterator.next() !== undefined) {
				if (map.add(iterator.key, iterator.current)) numAdded++;
			} 
			return numAdded;
		}

		/**
		 * Adds the contents of the given <code>Object</code> to the specified map.
		 * 
		 * <listing>
				var count : uint = Maps.addFromObject(map, object);
		 * </listing>
		 * 
		 * @param map The map to populate.
		 * @param source The <code>Object</code> to add from.
		 * @return The number of items added to the map.
		 */
		public static function addFromObject(map : IMap, source : Object) : uint {
			if (!source) return 0;

			var numAdded : uint;
			for (var key : * in source) {
				if (map.add(key, source[key])) numAdded++;
			}
			return numAdded;
		}

		/**
		 * Adds the given list of key-item-pairs to the specified map.
		 * 
		 * <listing>
				Maps.addFromArgs(myMap, key1, item1, key2, item2, ...);
		 * </listing>
		 * 
		 * @param map The map to populate.
		 * @param ...args List of key-item-pairs to add to the map.
		 * @return The number of items added to the map.
		 */
		public static function addFromArgs(map : IMap, ...args) : uint {
			return addFromArray(map, args);
		}
		
		/**
		 * Clones the supplied <code>IMap</code> instance returning a new <code>IMap</code>
		 * of the same type.
		 * 
		 * <p>If filters are specified the resulting map only contains mappings that
		 * meet the supplied predicates.<p>
		 * 
		 * <p>The key filter function accepts the current key and returns a boolean
		 * value (<code>true</code> if the key is accepted).</p>
		 * 
		 * <listing>
			function keyFilter(key : *) : Boolean {
				var accept : Boolean = false;
				// test the key
				return accept;
			}
					
			var clone : IMap = Maps.clone(map, keyFilter);
		 * </listing>
		 * 
		 * <p>The item filter function accepts the current item and returns a boolean
		 * value (<code>true</code> if the item is accepted).</p>
		 * 
		 * <listing>
			function itemFilter(item : *) : Boolean {
				var accept : Boolean = false;
				// test the item
				return accept;
			}
					
			var clone : IMap = Maps.clone(map, keyFilter, itemFilter);
		 * </listing>
		 * 
		 * @param map The <code>IMap</code> instance to clone.
		 * @param keyFilter Function which will be applied to each key in the source map.
		 * @param itemFilter Function which will be applied to each item in the source map.
		 * @return A new <code>IMap</code> instance.
		 */
		public static function clone(map : IMap, keyFilter : Function = null, itemFilter : Function = null) : IMap {
			var clone : IMap = new ((map as Object).constructor)() as IMap;
			if (map is ISortOrder) ISortOrder(clone).comparator = ISortOrder(map).comparator;
			
			var iterator : IBasicMapIterator = new MapFilterIterator(map, keyFilter, itemFilter);
			var item : *;
			while (iterator.hasNext()) {
				item = iterator.next();
				clone.add(iterator.key, item);
			}
			return clone;
		}
		
		/**
		 * Copies mappings from one to another map.
		 * 
		 * <p>If filters are specified only mappings are copied that meet
		 * the supplied predicates.<p>
		 * 
		 * <p>The key filter function accepts the current key and returns a boolean
		 * value (<code>true</code> if the key is accepted).</p>
		 * 
		 * <listing>
			function keyFilter(key : *) : Boolean {
				var accept : Boolean = false;
				// test the key
				return accept;
			}
					
			Maps.copy(sourceMap, destinationMap, keyFilter);
		 * </listing>
		 * 
		 * <p>The item filter function accepts the current item and returns a boolean
		 * value (<code>true</code> if the item is accepted).</p>
		 * 
		 * <listing>
			function itemFilter(item : *) : Boolean {
				var accept : Boolean = false;
				// test the item
				return accept;
			}
					
			Maps.copy(sourceMap, destinationMap, keyFilter, itemFilter);
		 * </listing>
		 * 
		 * @param source The <code>IMap</code> instance to copy from.
		 * @param destination The <code>IMap</code> to copy to.
		 * @param keyFilter Function which will be applied to each key in the source map.
		 * @param itemFilter Function which will be applied to each item in the source map.
		 * @return The number of items copied to the map.
		 */
		public static function copy(source : IMap, destination : IMap, keyFilter : Function = null, itemFilter : Function = null) : uint {
			var iterator : IBasicMapIterator = new MapFilterIterator(source, keyFilter, itemFilter);
			var item : *;
			var numAdded : uint;
			while (iterator.hasNext()) {
				item = iterator.next();
				if (destination.add(iterator.key, item)) numAdded++;
			}
			return numAdded;
		}
		
		/*
		 * Getting items
		 */

		/**
		 * Attempts to retrieve the item mapped to the supplied key.
		 * 
		 * <p>If the supplied key is not mapped an ArgumentError will be thrown.</p>
		 *
		 * @param map the IMap instance to operate on. 
		 * @param key the key to perform the lookup using.
		 * @param errorMessage optional error message which will be used if an Error needs to be thrown.
		 * @return the item mapped to the supplied key.
		 * @throws ArgumentError if no mapping exists for the supplied key.
		 */
		public static function itemForOrError(map : IMap, key : *, errorMessage : String = null) : * {
			if (!map.hasKey(key)) throw new ArgumentError(errorMessage || key + " does not exist in supplied map");
			return map.itemFor(key);
		}

		/**
		 * Attempts to retrieve the item mapped to the supplied key.
		 * 
		 * <p>If the supplied key is not mapped then the supplied default value
		 * will be returned instead.</p>
		 * 
		 * @param map the IMap instance to operate on.
		 * @param key the key to perform the lookup using.
		 * @param defaultValue the value to return if the supplied key does not exist in the supplied Map.
		 * @return if the supplied key exists in the map then the value mapped to that key will be  returned, otherwise 
		 * the supplied defaultValue will be returned instead. 
		 */
		public static function itemForOrValue(map : IMap, key : *, defaultValue : *) : * {
			if (!map.hasKey(key)) return defaultValue;
			return map.itemFor(key);
		}

		/**
		 * Attempts to retrieve the item mapped to the supplied key.
		 * 
		 * <p>If the supplied key is not mapped then the supplied value will mapped to the key and returned.</p>
		 * 
		 * @param map the IMap instance to operate on.
		 * @param key the key to perform the lookup using.
		 * @param item	if no mapping exists for the supplied key a new mapping will be added between the key and 
		 * this value.
		 * @return if a prior mapping exists for the supplied key then the assosiated value in the map will be 
		 * returned; if no prior mapping exists the supplied value will be returned instead. 
		 */
		public static function itemForOrAdd(map : IMap, key : *, item : *) : * {
			if (!map.hasKey(key)) map.add(key, item);
			return map.itemFor(key);
		}

	}
}
