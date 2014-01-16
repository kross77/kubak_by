/**
 * Created by Admin on 09.01.14.
 */
package modules.imgeditor.event {
public class ToolsEvent extends BaseEvent {
    public static const SELECTION_TOOL:String =  "selectionTool";
    public function ToolsEvent(type:String, data:Object = null, bubbles:Boolean = false, cancelable:Boolean = false) {
        super(type, data, bubbles, cancelable);
    }
}
}
