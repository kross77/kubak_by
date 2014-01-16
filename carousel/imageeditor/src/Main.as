/**
 * Created by Admin on 07.01.14.
 */
package {
import com.senocular.display.transform.ControlSetStandard;
import com.senocular.display.transform.TransformTool;

import flash.display.Sprite;
import flash.events.MouseEvent;

public class Main extends Sprite {
    public function Main() {
        super();
        transformTest();
    }

    private function transformTest():void {
        var box:Sprite = new Sprite();
        addChild(box);
        box.graphics.beginFill(0xAACCDD);
        box.graphics.drawRect(-50, -50, 100, 100);
        box.x = 100;
        box.y = 100;

        // create the Transform Tool
        var tool:TransformTool = new TransformTool(new ControlSetStandard());
        addChild(tool);

        // select the box with the transform tool when clicked.
        // deselect when clicking on the stage
        box.addEventListener(MouseEvent.MOUSE_DOWN, tool.select);
        stage.addEventListener(MouseEvent.MOUSE_DOWN, tool.deselect)
    }
}
}
