/**
 * Created by Admin on 10.01.14.
 */
package modules.imgeditor.event.renderer {
import modules.imgeditor.event.BaseEvent;

    public class LayerItemRendererEvent extends BaseEvent {

        public static const SELECT_IMAGE:String = "selectImage"
    public function LayerItemRendererEvent(type:String, data:Object = null, bubbles:Boolean = false, cancelable:Boolean = false) {
        super(type, data, bubbles, cancelable);
    }
}
}
