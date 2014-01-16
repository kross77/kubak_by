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
	import org.as3commons.collections.framework.IIterable;
	import org.as3commons.collections.framework.IRecursiveIterator;
	import org.as3commons.collections.iterators.RecursiveIterator;

	/**
	 * Collections utils.
	 *    
	 * @author Jens Struwe 09.03.2009
	 */
	public class CollectionUtils {

		/**
		 * Dumps an iterable structure recursively into a formatted string literal.
		 * 
		 * <p id="link_DumpAsStringExample"><strong><code>dumpAsString()</code> example</strong></p>
		 * 
		 * <a class="exampleCollapsed" href="#link_DumpAsStringExample" onClick="toggleExample(this, 'DumpAsStringExample');">Show example</a><br /><div id="DumpAsStringExample" style='display:none'><listing version="3.0">package {
    import org.as3commons.collections.utils.CollectionUtils;
    import flash.display.Sprite;

    public class DumpAsStringExample extends Sprite {

        public function DumpAsStringExample() {
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
            
            trace (CollectionUtils.dumpAsString(root));

            // Node 0
            // .......Node 1
            // ..............Node 2
            // ..............Node 3
            // .......Node 4
            // ..............Node 5
            // ..............Node 6
            // .......Node 7
            // ..............Node 8
            // .....................Node 9
            // .....................Node 10
            // ..............Node 11
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
</listing></div><br />
		 * 
		 * @param data The iterable data structure.
		 * @return The dump.
		 */
		public static function dumpAsString(data : IIterable) : String {
			var info : String = data + "\n";
			var iterator : IRecursiveIterator = new RecursiveIterator(data);
			var i : uint = 0;
			var j : uint = 0;
			var next : *;
			var prefix : String;
			while (iterator.hasNext()) {
				next = iterator.next();

				prefix = "";
				for (j = 0; j < iterator.depth + 1; j++) {
					prefix += ".......";
				}
				
				info += prefix + next;
				if (iterator.hasNext()) info += "\n";
				i++;
			}
			return info;
		}

	}
}
