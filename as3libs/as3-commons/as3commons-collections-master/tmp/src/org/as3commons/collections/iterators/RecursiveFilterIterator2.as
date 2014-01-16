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
package org.as3commons.collections.iterators {
	import org.as3commons.collections.framework.IIterable;
	import org.as3commons.collections.framework.IIterator;
	import org.as3commons.collections.framework.IRecursiveIterator;

	/**
	 * Recursive filter iterator.
	 * 
	 * <p><strong>Description</strong></p>
	 * 
	 * <p>Filter a complex data structure using this iterator. Two filters let specify what
	 * items should be returned and if children of a parent item should be considered.</p>
	 * 
	 * <p>In difference to the legacy <code>RecursiveFilterIterator</code> this iterator
	 * iterates through parent items even if the parent items should not be returned.
	 * The <code>RecursiveFilterIterator</code> never checks children of items that are
	 * excluded by the <code>filter</code> function.</p>
	 * 
	 * <p>The <code>RecursiveFilterIterator2</code> accepts an <code>IIterable</code> instance
	 * and iterates recursively over the items of the given iterable collection while applying
	 * the specified filters. To do so, all children that should be further iterated should be
	 * also instance of <code>IIterable</code>.</p>
	 * 
	 * <p><strong>Filter functions</strong></p>
	 * 
	 * <p>Its possible to set up two different filters. The first filter tests if an
	 * item should be returned. The second filter tests if children of a specific item
	 * should be considered or not. Children of items that did not pass the first
	 * <code>filter</code> function are still being considered by the iterator. It is
	 * possible to set up both filters together.</p>
	 * 
	 * <p>Both filter functions accept the current item and return a boolean
	 * value (<code>true</code> if the item is accepted).</p>
	 * 
	 * <listing>
			function filter(item : *) : Boolean {
				var accept : Boolean = false;
				// test the item
				return accept;
			}

			function childrenFilter(item : *) : Boolean {
				var accept : Boolean = false;
				// test the item
				return accept;
			}
			
			var iterator : IRecursiveIterator = new RecursiveFilterIterator(collection, filter, childrenFilter);
	 * </listing>
	 * 
	 * <p id="link_RecursiveFilterIteratorExample"><strong>Recursive filter iterator example</strong></p>
	 * 
	 * <a class="exampleCollapsed" href="#link_RecursiveFilterIteratorExample" onClick="toggleExample(this, 'RecursiveFilterIteratorExample');">Show example</a><br /><div id="RecursiveFilterIteratorExample" style='display:none'><listing version="3.0">package {
    import org.as3commons.collections.framework.IRecursiveIterator;
    import org.as3commons.collections.iterators.RecursiveFilterIterator;
    import flash.display.Sprite;

    public class RecursiveFilterIteratorExample extends Sprite {

        public function RecursiveFilterIteratorExample() {
            var root : Node = new Node(0);
            var child1 : Node = new Node(1);
            child1.children = [new Node(2), new Node(3)];
            var child2 : Node = new Node(4);
            child2.children = [new Node(5), new Node(6)];
            var child3 : Node = new Node(7);
            var child4 : Node = new Node(8);
            child4.children = [new Node(9), new Node(10)];
            child3.children = [child4, new Node(11)];
            root.children = [child1, child2, child3];
            
            var iterator : IRecursiveIterator;
            var item : Node;
            
            // All items
            
            iterator = new RecursiveFilterIterator(root, null, null);
            while (iterator.hasNext()) {
                item = iterator.next();
                trace (prefix(iterator.depth) + item);
            }

            // Node 1
            // .......Node 2
            // .......Node 3
            // Node 4
            // .......Node 5
            // .......Node 6
            // Node 7
            // .......Node 8
            // ..............Node 9
            // ..............Node 10
            // .......Node 11
            
            // Only odd items

            iterator = new RecursiveFilterIterator(
                root, oddFilter, null
            );
            while (iterator.hasNext()) {
                item = iterator.next();
                trace (prefix(iterator.depth) + item);
            }

            // Node 1
            // .......Node 3
            // Node 7
            // .......Node 11

            // Only even items

            iterator = new RecursiveFilterIterator(
                root, evenFilter, null
            );
            while (iterator.hasNext()) {
                item = iterator.next();
                trace (prefix(iterator.depth) + item);
            }

            // Node 4
            // .......Node 6

            // All items + only children of odd items

            iterator = new RecursiveFilterIterator(
                root, null, oddFilter
            );
            while (iterator.hasNext()) {
                item = iterator.next();
                trace (prefix(iterator.depth) + item);
            }

            // Node 1
            // .......Node 2
            // .......Node 3
            // Node 4
            // Node 7
            // .......Node 8
            // .......Node 11

            // All items + only children of even items

            iterator = new RecursiveFilterIterator(
                root, null, evenFilter
            );
            while (iterator.hasNext()) {
                item = iterator.next();
                trace (prefix(iterator.depth) + item);
            }

            // Node 1
            // Node 4
            // .......Node 5
            // .......Node 6
            // Node 7

            // Only items &gt; 5

            iterator = new RecursiveFilterIterator(
                root, greater5Filter, null
            );
            while (iterator.hasNext()) {
                item = iterator.next();
                trace (prefix(iterator.depth) + item);
            }

            // Node 7
            // .......Node 8
            // ..............Node 9
            // ..............Node 10
            // .......Node 11

            // All items + only children of items &gt; 5

            iterator = new RecursiveFilterIterator(
                root, null, greater5Filter
            );
            while (iterator.hasNext()) {
                item = iterator.next();
                trace (prefix(iterator.depth) + item);
            }

            // Node 1
            // Node 4
            // Node 7
            // .......Node 8
            // ..............Node 9
            // ..............Node 10
            // .......Node 11
        }
        
        private function oddFilter(item : *) : Boolean {
            // lets pass only odd numbers
            return Node(item).number % 2 == 1;
        }

        private function evenFilter(item : *) : Boolean {
            // lets pass only even numbers
            return Node(item).number % 2 == 0;
        }

        private function greater5Filter(item : *) : Boolean {
            // lets pass only items &gt; 5
            return Node(item).number &gt; 5;
        }

        private function prefix(depth : uint) : String {
            var prefix : String = "";
            for (var i : uint = 0; i &lt; depth; i++) prefix += ".......";
            return prefix;
        }
    }
}

import org.as3commons.collections.framework.IIterable;
import org.as3commons.collections.framework.IIterator;
import org.as3commons.collections.iterators.ArrayIterator;

internal class Node implements IIterable {
    public var number : uint;
    public var children : Array;
    public function Node(theNumber : uint) {
        number = theNumber;
        children = new Array();
    }
    public function iterator(cursor : * = undefined) : IIterator {
        return new ArrayIterator(children);
    }
    public function toString() : String {
        return "Node " + number.toString();
    }
}
</listing></div>
	 * 
	 * @author Jens Struwe 14.05.2009
	 * @see org.as3commons.collections.framework.IRecursiveIterator IRecursiveIterator interface - Description of the recursive iterator features.
	 * @see FilterIterator FilterIterator - Filter iterator usage example.
	 * 
	 * @TODO Peplace RecursiveFilterIterator with this implementation in V2.
	 */
	public final class RecursiveFilterIterator2 implements IRecursiveIterator {

		/**
		 * Iterator to start with.
		 */
		private var _iterator : IIterator;

		/**
		 * The filter.
		 */
		private var _filter : Function;

		/**
		 * The children filter.
		 */
		private var _childrenFilter : Function;

		/**
		 * Base depth of the iterator.
		 */
		private var _rootDepth : uint;

		/**
		 * Depth of the current child iterator.
		 */
		private var _depth : uint;

		/**
		 * Cursor child iterator.
		 */
		private var _childIterator : IRecursiveIterator;

		/**
		 * Cache for recursion detection.
		 */
		private var _parentItems : Array;
	
		/**
		 * Next item to return.
		 */
		private var _next : *;

		/**
		 * RecursiveFilterIterator constructor.
		 * 
		 * @param iterable An <code>IIterable</code> implementing collection.
		 * @param filter The filter function. 
		 * @param childrenFilter The children filter function. 
		 * @param depth Internally passed recursion depth. 
		 * @param parentItems Internally passed parent chain, considered in recursion detection.
		 */
		public function RecursiveFilterIterator2(
			iterable : IIterable,
			filter : Function,
			childrenFilter : Function,
			depth : uint = 0,
			parentItems : Array = null
		) {
			_filter = filter != null ? filter : nullFilter;
			_childrenFilter = childrenFilter != null ? childrenFilter : nullFilter;
			
			_rootDepth = depth;
			_depth = depth;
			
			_iterator = iterable.iterator();
			_parentItems = parentItems ? parentItems : new Array(iterable);
		}
	
		/*
		 * IRecursiveIterator
		 */

		/**
		 * The recursion depth of the current item.
		 */
		public function get depth() : uint {
			return _depth;
		}

		/*
		 * IIterator
		 */

		/**
		 * @inheritDoc
		 */
		public function hasNext() : Boolean {
			if (_next !== undefined) return true;
			
			var next : *;
			if (_childIterator) {
				if (_childIterator.hasNext()) {
					_next = _childIterator.next();
					return true;
				}
				_childIterator = null;
				return hasNext();
			}

			while (_iterator.hasNext()) {
				next = _iterator.next();
				if (_filter(next)) _next = next;
				if (next is IIterable && _childrenFilter(next)) {
					if (_parentItems.indexOf(next) < 0) {
						_childIterator = new RecursiveFilterIterator2(
							next,
							_filter,
							_childrenFilter,
							_depth + 1,
							_parentItems.concat(next)
						);
						if (_next === undefined) return hasNext();
					}
				}

				if (_next !== undefined) return true;
			}

			return false;
		}
		
		/**
		 * @inheritDoc
		 */
		public function next() : * {
			if (_next === undefined && !hasNext()) return undefined;

			var next : *;
			
			if (_childIterator) {
				_depth = _childIterator.depth;
				next = _next;
				_next = undefined;
				return next;
			}

			_depth = _rootDepth; // cannot use _iterator.getDepth() as we have here an IIterator instance

			next = _next;
			_next = undefined;
			return next;
		}
		
		/*
		 * Private
		 */
		
		/**
		 * Filter to be used if no filter has been specified else.
		 */
		private function nullFilter(item : *) : Boolean {
			return true;
		}
	}
}
