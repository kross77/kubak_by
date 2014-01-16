/**
 * Created by user on 14.01.14.
 */
package examples.delegate {
import com.vstyran.transform.consts.GuidelineType;
import com.vstyran.transform.model.Guideline;
import com.vstyran.transform.utils.DataUtil;
import com.vstyran.transform.view.UITransformTool;

import flash.geom.Rectangle;

import mx.core.IVisualElement;

import spark.components.Group;
import spark.components.Image;

public class GuideLinesDelegate {
    public function GuideLinesDelegate() {


    }

    static public function createGuidelines(imageGroup:Group, tool:UITransformTool):Vector.<Guideline> {
        var guidelines:Vector.<Guideline> = new Vector.<Guideline>();
        for (var i:int = 0; i < imageGroup.numElements; i++) {
            var element:IVisualElement = imageGroup.getElementAt(i);

            if (element is Image && tool.target != element) {

                var box:Rectangle = DataUtil.createData(element as Image).getBoundingBox();

                guidelines.push(new Guideline(GuidelineType.VERTICAL_EDGE, box.x, 3));
                guidelines.push(new Guideline(GuidelineType.VERTICAL_CENTER, box.x + box.width / 2, 3));
                guidelines.push(new Guideline(GuidelineType.VERTICAL_EDGE, box.x + box.width, 3));

                guidelines.push(new Guideline(GuidelineType.HORIZONTAL_EDGE, box.y, 3));
                guidelines.push(new Guideline(GuidelineType.HORIZONTAL_CENTER, box.y + box.height / 2, 3));
                guidelines.push(new Guideline(GuidelineType.HORIZONTAL_EDGE, box.y + box.height, 3));

                if ((element as Image).rotation % 90 != 0) {
                    var guideLine:Guideline = new Guideline(GuidelineType.ROTATION, (element as Image).rotation, 3);
                    guideLine.userData = element;
                    guidelines.push(guideLine);
                }
            }
        }
        return guidelines;
    }
}
}
