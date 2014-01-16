/**
 * Created by Admin on 09.01.14.
 */
package modules.imgeditor.view.components.types {
import modules.imgeditor.view.components.*;

import flash.display.Bitmap;

import modules.imgeditor.model.vo.LayerVO;

import mx.core.UIComponent;

import org.casalib.display.CasaBitmap;
import org.casalib.display.CasaSprite;

public class BitmapLayerDisplObj extends UIComponent implements ILayerDisplObj {
    private var _layerVO:LayerVO;
    public function BitmapLayerDisplObj(layerVO:LayerVO) {
        _layerVO = layerVO;
        graphics.beginBitmapFill(layerVO.bitmap.bitmapData, null, false, true);
        graphics.drawRect(0,0,layerVO.bitmap.width, layerVO.bitmap.height);
        //super(layerVO.bitmap.bitmapData, layerVO.pixelSnapping, layerVO.smoothing);
    }


    override public function set height(value:Number):void {
        super.height = value;
    }

    override public function set width(value:Number):void {
        super.width = value;
    }

    public function get layerVO():LayerVO {
        return _layerVO;
    }
}
}
