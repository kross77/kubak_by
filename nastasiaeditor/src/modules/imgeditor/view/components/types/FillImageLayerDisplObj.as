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

public class FillImageLayerDisplObj extends Image implements ILayerDisplObj {
    private var _layerVO:LayerVO;


    private var _bitmap:Bitmap;
    private var updateContainer:Sprite;

    public function FillImageLayerDisplObj(layerVO:LayerVO) {
        _layerVO = layerVO;
        _layerVO.type = LayerDispObjType.FILL_IMAGE;
        _layerVO.layerObject = this;
        _bitmap = layerVO.bitmap;
        //updateContainer = new Sprite();
        source = _bitmap;
        fillMode = BitmapFillMode.REPEAT;

    }



    public function get layerVO():LayerVO {
        return _layerVO;
    }


   /* override public function set width(value:Number):void {
        super.width = value;
        updateBitmap(value, height);
    }

    override public function set height(value:Number):void {
        super.width = value;
        updateBitmap(width, value);
    }*/
}
}
