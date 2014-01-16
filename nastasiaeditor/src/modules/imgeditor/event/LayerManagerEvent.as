/**
 * Created by Admin on 09.01.14.
 */
package modules.imgeditor.event {
public class LayerManagerEvent extends BaseEvent {
    public static const ADD_IMAGE:String = "addImage";
    public static const CREATE_LAYER:String = "createLayer";
    public static const REMOVE_LAYER:String = "removeLayer";
    public static const SELECT_LAYER:String = "selectLayer";
    public function LayerManagerEvent(type:String, data:Object = null, bubbles:Boolean = false, cancelable:Boolean = false) {
        super(type, data, bubbles, cancelable);
    }
}
}
