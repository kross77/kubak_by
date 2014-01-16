package {
	
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.utils.Dictionary;
	
	/**
	 * Extended EventDispatcher class containing a numListeners
	 * property and a removeAllListeners method for removing
	 * all listeners from an instance that extends this class.
	 * For display objects, you can save a version of this class
	 * That extends Sprite instead of EventDispatcher (or any other
	 * variation of superclass that you do not have control of).
	 */
	public class EventDispatcherExt extends EventDispatcher {
		
		/**
		 * Specifies the number of listeners that have been added
		 * to the object instance.
		 */
		public function get numListeners():int {
			return _numListeners;
		}
		private var _numListeners:int = 0; // number of listeners
		private var _listeners:Array = []; // mapping for listeners
		
		/**
		 * Constructor for EventDispatcherExt instances.  This follows
		 * the convention used by EventDispatcher.
		 * @inheritDoc
		 */
		public function EventDispatcherExt(target:IEventDispatcher = null){
			super(target);
		}
		
		
		/**
		 * Removes all listeners added by addEventListener for any or 
		 * all types of events.
		 */
		public function removeAllListeners(type:String = null):void {
			var capture:*, etype:String, listener:*;
			var types:Object, listeners:Dictionary;
			
			for (capture in _listeners){
				
				types = _listeners[int(capture)];
				for (etype in types){
					
					// if type is null, remove, or if type
					// matches the type provided
					if (!type || type == etype) {
						
						listeners = types[etype];
						for (listener in listeners){
							
							try {
								super.removeEventListener(etype, listener, Boolean(capture));
							}catch(err:Error){
								// likely an argument error, but that really
								// shouldn't happen; this is just in cases
							}
							
							delete listeners[listener];
							_numListeners--;
						}
						
						delete types[etype];
					}
				}
				
				// remove useCapture objects if empty
				if (type == null || _numListeners == 0)
					delete _listeners[int(capture)];
			}
		}
		
		/**
		 * @inheritDoc
		 */
		public override function addEventListener(type:String, listener:Function, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = false):void {
			super.addEventListener(type, listener, useCapture, priority, useWeakReference);
			
			var capture:int = int(useCapture);
			
			// create capture list if does not exist
			if (capture in _listeners == false){
				_listeners[capture] = {};
			}
			
			// create type list if does not exist
			if (type in _listeners[capture] == false){
				_listeners[capture][type] = new Dictionary(true);
			}
			
			// create listener key if does not exist
			if (listener in _listeners[capture][type] == false){
				_listeners[capture][type][listener] = true;
				_numListeners++;
			}
		}
		
		/**
		 * @inheritDoc
		 */
		public override function removeEventListener(type:String, listener:Function, useCapture:Boolean = false):void {
			super.removeEventListener(type, listener, useCapture);
			
			try {
				var capture:int = int(useCapture);
				
				// remove listener from internal list
				if (delete _listeners[capture][type][listener]){
					_numListeners--;
				
					var cleanObject:Boolean, key:*;
					
					// remove type list if empty
					cleanObject = true;
					for (key in _listeners[capture][type]){
						cleanObject = false; break;
					}
					if (cleanObject) delete _listeners[capture][type];
					
					// remove capture list if empty
					cleanObject = true;
					for (key in _listeners[capture]){
						cleanObject = false; break;
					}
					if (cleanObject) delete _listeners[capture];
				}
				
			}catch(err:Error){
				// does not exist, fail silently
			}
		}
	}
}