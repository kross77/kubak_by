/**
 * Created by Admin on 09.01.14.
 */
package modules.imgeditor.view.components.types {
import modules.imgeditor.view.components.*;

import flash.display.Bitmap;
import flash.display.Sprite;

import modules.imgeditor.model.vo.LayerVO;

import mx.core.UIComponent;
import mx.graphics.BitmapFillMode;

import org.casalib.display.CasaBitmap;
import org.casalib.display.CasaSprite;

import spark.components.Image;

public class FillTestLayerDisplObj extends UIComponent implements ILayerDisplObj {
    private var _layerVO:LayerVO;


    private var updateContainer:Sprite;

    public function FillTestLayerDisplObj(layerVO:LayerVO) {
        _layerVO = layerVO;
        _layerVO.type = LayerDispObjType.FILL_IMAGE;
        _layerVO.layerObject = this;
        width = height = 60;
        updateFill(60,60);
    }


    override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void {
        updateFill(unscaledWidth, unscaledHeight)
        super.updateDisplayList(unscaledWidth, unscaledHeight);
    }

    private function updateFill(unscaledWidth:Number, unscaledHeight:Number):void {
        graphics.clear();
        graphics.beginFill(0xff0000,1);
        graphics.drawRect(0,0,unscaledWidth, unscaledHeight);
        graphics.endFill();
    }

    public function get layerVO():LayerVO {
        return _layerVO;
    }
}
}
