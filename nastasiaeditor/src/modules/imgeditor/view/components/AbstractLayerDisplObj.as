/**
 * Created by Admin on 09.01.14.
 */
package modules.imgeditor.view.components {
import flash.display.Bitmap;
import flash.display.DisplayObject;

import modules.imgeditor.model.vo.LayerVO;

public class AbstractLayerDisplObj extends DisplayObject implements ILayerDisplObj{
    public function AbstractLayerDisplObj(layerVO:LayerVO) {
        super()
    }

    public function get layerVO():LayerVO {
        return null;
    }
}
}
