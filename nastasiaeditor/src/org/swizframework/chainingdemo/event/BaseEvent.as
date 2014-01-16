/**
 * Created by Admin on 07.01.14.
 */
package org.swizframework.chainingdemo.event {
import flash.events.Event;

public class BaseEvent extends Event {
    private var _data:Object;
    public function BaseEvent(type:String, data:Object = null, bubbles:Boolean = false, cancelable:Boolean = false) {
        super(type, bubbles, cancelable);
        this._data = data;
    }

    public function get data():Object {
        return _data;
    }
}
}
