/**
 * Created by Admin on 09.01.14.
 */
package modules.imgeditor.view.components.types {
import modules.imgeditor.view.components.*;

import flash.display.Bitmap;

import modules.imgeditor.model.vo.LayerVO;

import org.casalib.display.CasaBitmap;
import org.casalib.display.CasaSprite;

import spark.components.Image;

public class ImageLayerDisplObj extends Image implements ILayerDisplObj {
    private var _layerVO:LayerVO;


    public function ImageLayerDisplObj(layerVO:LayerVO) {
        _layerVO = layerVO;
        _layerVO.type = LayerDispObjType.IMAGE;
        _layerVO.layerObject = this;
        source = _layerVO.bitmap;
    }

    public function get layerVO():LayerVO {
        return _layerVO;
    }
}
}
