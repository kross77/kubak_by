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
	 * Recursive iterator.
	 * 
	 * <p><strong>Description</strong></p>
	 * 
	 * <p>The <code>RecursiveIterator</code> accepts an <code>IIterable</code> instance
	 * and iterates recursively over the items of the given iterable collection. To do so,
	 * all children that should be further iterated should be also instance of <code>IIterable</code>.</p>
	 * 
	 * <p id="link_RecursiveIteratorExample"><strong>Recursive iterator example</strong></p>
	 * 
	 * <a class="exampleCollapsed" href="#link_RecursiveIteratorExample" onClick="toggleExample(this, 'RecursiveIteratorExample');">Show example</a><br /><div id="RecursiveIteratorExample" style='display:none'><listing version="3.0">package {
    import org.as3commons.collections.framework.IRecursiveIterator;
    import org.as3commons.collections.iterators.RecursiveIterator;
    import flash.display.Sprite;

    public class RecursiveIteratorExample extends Sprite {

        public function RecursiveIteratorExample() {
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
            
            var iterator : IRecursiveIterator = new RecursiveIterator(root);
            var item : Node;
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
	 * @author Jens Struwe 11.02.2009
	 * @see org.as3commons.collections.framework.IRecursiveIterator IRecursiveIterator interface - Description of the recursive iterator features.
	 */
	public final class RecursiveIterator implements IRecursiveIterator {

		/**
		 * Base depth of the iterator.
		 */
		private var _rootDepth : uint;

		/**
		 * Depth of the current child iterator.
		 */
		private var _depth : uint;

		/**
		 * Iterator to start with.
		 */
		private var _iterator : IIterator;

		/**
		 * Cursor child iterator.
		 */
		private var _childIterator : IRecursiveIterator;

		/**
		 * Cache for recursion detection.
		 */
		private var _parentItems : Array;
	
		/**
		 * RecursiveIterator constructor.
		 * 
		 * @param iterable An <code>IIterable</code> implementing collection.
		 * @param depth Internally passed recursion depth. 
		 * @param parentItems Internally passed parent chain, considered in recursion detection.
		 */
		public function RecursiveIterator(iterable : IIterable, depth : uint = 0, parentItems : Array = null) {
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
			if (_childIterator) {
				if (_childIterator.hasNext()) {
					return true;
				} else {
					_childIterator = null;
					return hasNext();
				}
			}
			return _iterator.hasNext();
		}
		
		/**
		 * @inheritDoc
		 */
		public function next() : * {
			var item : *;

			if (_childIterator && _childIterator.hasNext()) {
				item = _childIterator.next();
				_depth = _childIterator.depth;
				return item;
			} else {
				_childIterator = null;
			}

			item = _iterator.next();
			_depth = _rootDepth; // cannot use _iterator.getDepth() as we have here an IIterator instance

			if (item is IIterable) {
				if (_parentItems.indexOf(item) < 0) {
					_childIterator = new RecursiveIterator(
						item,
						_depth + 1,
						_parentItems.concat(item)
					);
				}
			}
			
			return item;
		}
		
	}
}
