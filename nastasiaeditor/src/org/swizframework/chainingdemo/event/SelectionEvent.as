/**
 * Created by Admin on 07.01.14.
 */
package org.swizframework.chainingdemo.event {
public class SelectionEvent extends BaseEvent {
    public static const SELECT_IMAGE:String = "selectImage";
    public function SelectionEvent(type:String, data:Object = null, bubbles:Boolean = false, cancelable:Boolean = false) {
        super(type, data, bubbles, cancelable);
    }
}
}
