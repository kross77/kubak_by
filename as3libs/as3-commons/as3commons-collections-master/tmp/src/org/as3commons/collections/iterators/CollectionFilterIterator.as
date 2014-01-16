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
	import org.as3commons.collections.framework.ICollection;
	import org.as3commons.collections.framework.ICollectionIterator;

	/**
	 * Collection filter iterator.
	 * 
	 * <p><strong>Description</strong></p>
	 * 
	 * <p>The <code>CollectionFilterIterator</code> accepts an <code>ICollection</code> instance
	 * and a filter function and works the same way as the <code>ICollectionIterator</code> returned
	 * by the particular <code>iterator()</code> method of the given collection. In difference to,
	 * the <code>CollectionFilterIterator</code> considers only those items that pass the given filter.</p>
	 * 
	 * <p><strong>Filter function</strong></p>
	 * 
	 * <p>The filter function accepts the current item and returns a boolean
	 * value (<code>true</code> if the item is accepted).</p>
	 * 
	 * <listing>
			function filter(item : *) : Boolean {
				var accept : Boolean = false;
				// test the item
				return accept;
			}
			
			var iterator : ICollectionIterator = new CollectionFilterIterator(collection, filter);
	 * </listing>
	 * 
	 * <p id="link_CollectionFilterIteratorExample"><strong>Collection filter iterator example</strong></p>
	 * 
	 * <a class="exampleCollapsed" href="#link_CollectionFilterIteratorExample" onClick="toggleExample(this, 'CollectionFilterIteratorExample');">Show example</a><br /><div id="CollectionFilterIteratorExample" style='display:none'><listing version="3.0">package {
    import org.as3commons.collections.ArrayList;
    import org.as3commons.collections.framework.ICollectionIterator;
    import org.as3commons.collections.iterators.CollectionFilterIterator;
    import flash.display.Sprite;

    public class CollectionFilterIteratorExample extends Sprite {

        public function CollectionFilterIteratorExample() {
            var list : ArrayList = new ArrayList();
            var iterator : ICollectionIterator;

            // ^ = cursor, [n] = current
            
            // Navigation

            list.array = [1, 2, 3, 4, 5, 6];
            iterator = new CollectionFilterIterator(list, evenFilter);
            
                                   //  ^  1  2  3  4  5  6
            iterator.next();       //  1 [2] ^  3  4  5  6
            iterator.next();       //  1  2  3 [4] ^  5  6
            iterator.next();       //  1  2  3  4  5 [6] ^
            iterator.next();       //  1  2  3  4  5  6  ^
            iterator.previous();   //  1  2  3  4  5  ^ [6]
            iterator.previous();   //  1  2  3  ^ [4] 5  6
            iterator.start();      //  ^  1  2  3  4  5  6
            iterator.end();        //  1  2  3  4  5  6  ^
            
            // Remove

            iterator = new CollectionFilterIterator(list, evenFilter);
            
                                   //  ^  1  2  3  4  5  6
            iterator.next();       //  1 [2] ^  3  4  5  6
            iterator.next();       //  1  2  3 [4] ^  5  6
            iterator.remove();     //  1  2  3  ^  5  6
            iterator.next();       //  1  2  3  5 [6] ^
            iterator.remove();     //  1  2  3  5  ^
            iterator.previous();   //  1  ^ [2] 3  5
            iterator.remove();     //  1  ^  3  5
            iterator.previous();   //  ^  1  3  5
            iterator.next();       //  1  3  5  ^
            
            // Remove during iteration

            list.array = [1, 2, 3, 4, 5, 6];
            iterator = new CollectionFilterIterator(list, evenFilter);
            var item : *;
            while (iterator.hasNext()) {
                item = iterator.next();
                trace (item); // 2, 4, 6
                if (item == 2) iterator.remove();
                if (item == 6) iterator.remove();
            }
            trace (list.toArray()); // 1,3,4,5

            // Reverse iteration

            list.array = [1, 2, 3, 4, 5, 6];
            iterator = new CollectionFilterIterator(list, evenFilter);
            iterator.end();
            while (iterator.hasPrevious()) {
                trace (iterator.previous()); // 6, 4, 2
            }
        }
        
        private function evenFilter(item : *) : Boolean {
            // lets pass only even numbers
            return item % 2 == 0;
        }
    }
}
</listing></div>
	 * 
	 * @author Jens Struwe 25.02.2010
	 * @see org.as3commons.collections.framework.ICollectionIterator ICollectionIterator interface - Detailed description of the ICollectionIterator features.
	 * @see FilterIterator FilterIterator - Filter iterator usage example.
	 */
	public final class CollectionFilterIterator implements ICollectionIterator {

		/**
		 * The inner iterator.
		 */
		private var _iterator : ICollectionIterator;

		/**
		 * The last returned item.
		 */
		private var _current : *;
		
		/**
		 * The previous item to return.
		 */
		private var _previous : *;
		
		/**
		 * The next item to return.
		 */
		private var _next : *;
		
		/**
		 * The filter.
		 */
		private var _filter : Function;

		/**
		 * The last lookup direction.
		 */
		private var _lastLookUp : String;

		/**
		 * CollectionFilterIterator constructor.
		 * 
		 * @param collection The collection to be enumerated.
		 * @param filter The filter function. 
		 */
		public function CollectionFilterIterator(collection : ICollection, filter : Function) {
			_iterator = collection.iterator() as ICollectionIterator;
			
			if (!_iterator) {
				throw new ArgumentError("The iterator of the given collection is not an ICollectionIterator instance.");
			}

			_filter = filter != null ? filter : nullFilter;
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
			_lastLookUp = "next";
			while (_iterator.hasNext()) {
				next = _iterator.next();
				if (_filter(next)) {
					_next = next;
					_iterator.previous();
					return true;
				}
			}
			return false;
		}
		
		/**
		 * @inheritDoc
		 */
		public function next() : * {
			if (_next === undefined && !hasNext()) {
				_current = undefined;
				return undefined;
			}
			
			rewindForward(_next);
			
			_current = _next;
			_previous = _current;
			_next = undefined;
			return _current;
		}

		/*
		 * ICollectionIterator
		 */

		/**
		 * @inheritDoc
		 */
		public function start() : void {
			_iterator.start();
			_next = _previous = _current = undefined;
		}
		
		/**
		 * @inheritDoc
		 */
		public function end() : void {
			_iterator.end();
			_next = _previous = _current = undefined;
		}
		
		/**
		 * @inheritDoc
		 */
		public function hasPrevious() : Boolean {
			if (_previous !== undefined) return true;

			var previous : *;
			_lastLookUp = "previous";
			while (_iterator.hasPrevious()) {
				previous = _iterator.previous();
				if (_filter(previous)) {
					_previous = previous;
					_iterator.next();
					return true;
				}
			}
			return false;
		}
		
		/**
		 * @inheritDoc
		 */
		public function previous() : * {
			if (_previous === undefined && !hasPrevious()) {
				_current = undefined;
				return undefined;
			}
			
			rewindBackward(_previous);

			_current = _previous;
			_next = _current;
			_previous = undefined;
			return _current;
		}
		
		/**
		 * @inheritDoc
		 */
		public function get current() : * {
			return _current;
		}
		
		/**
		 * @inheritDoc
		 */
		public function remove() : Boolean {
			if (_current === undefined) return false;
			
			if (_lastLookUp == "next") {
				rewindBackward(_current);
				_iterator.next();
			} else if (_lastLookUp == "previous") {
				rewindForward(_current);
				_iterator.previous();
			}
			
			_iterator.remove();
			_next = _previous = _current = undefined;
			return true;
		}
		
		/*
		 * Private
		 */
		
		/**
		 * Places the inner iterator after the given item.
		 */
		private function rewindForward(item : *) : void {
			_lastLookUp = "";
			while (_iterator.hasNext()) {
				_iterator.next();
				if (item === _iterator.current) return;
			}
		}

		/**
		 * Places the inner iterator before the given item.
		 */
		private function rewindBackward(item : *) : void {
			_lastLookUp = "";
			while (_iterator.hasPrevious()) {
				_iterator.previous();
				if (item === _iterator.current) return;
			}
		}

		/**
		 * Filter to be used if no filter has been specified else.
		 */
		private function nullFilter(item : *) : Boolean {
			return true;
		}

	}
}
