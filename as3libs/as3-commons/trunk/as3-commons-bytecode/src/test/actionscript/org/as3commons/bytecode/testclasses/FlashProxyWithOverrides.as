/*
* Copyright 2007-2012 the original author or authors.
*
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*      http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
package org.as3commons.bytecode.testclasses {

	import flash.utils.Proxy;
	import flash.utils.flash_proxy;

	/**
	 *
	 * @author Roland Zwaga
	 */
	public class FlashProxyWithOverrides extends Proxy {

		/**
		 * Creates a new <code>FlashProxyWithOverrides</code> instance.
		 */
		public function FlashProxyWithOverrides() {
			super();
		}

		override flash_proxy function getProperty(name:*):* {
			return null;
		}
		
		public function getProperty(name:*):* {
			return null;
		}
	}
}
