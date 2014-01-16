/**
 * Created by Admin on 09.01.14.
 */
package modules.imgeditor.event {
public class ImageEditorEvent extends BaseEvent {
    public static const ADD_IMAGE:String = "addImage";
    public function ImageEditorEvent(type:String, data:Object = null, bubbles:Boolean = false, cancelable:Boolean = false) {
        super(type, data, bubbles, cancelable);
    }
}
}
