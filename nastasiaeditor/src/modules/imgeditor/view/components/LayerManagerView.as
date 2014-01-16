/**
 * Created by Admin on 09.01.14.
 */
package modules.imgeditor.view.components {
import mx.core.UIComponent;
import mx.events.FlexEvent;

public class LayerManagerView extends UIComponent{
    public function LayerManagerView() {
        addEventListener(FlexEvent.CREATION_COMPLETE, creationCompleteHandler);
    }

    private function creationCompleteHandler(event:FlexEvent):void {
        drawBorder();

    }

    private function drawBorder():void {
        graphics.lineStyle(1, 0x00000);
        graphics.drawRect(0,0, width, height)
    }
}
}
