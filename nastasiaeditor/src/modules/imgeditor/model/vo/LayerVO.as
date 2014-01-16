/**
 * Created by Admin on 09.01.14.
 */
package modules.imgeditor.model.vo {
import flash.display.Bitmap;
import flash.display.DisplayObject;

import modules.imgeditor.view.components.ILayerDisplObj;
import modules.imgeditor.view.components.LayerDispObjType;

public class LayerVO {
    public var type:LayerDispObjType;
    public static const BITMAP_TYPE:String = "bitmap";
    [Bindable]
    public var bitmap:Bitmap;
    public var inited:Boolean = false;
    public var bitmapIndex:int = 0;
    public var imageName:String;
    public var layerObject:ILayerDisplObj;

    public function LayerVO() {
    }

    public static function create(type:LayerDispObjType, bitmap:Bitmap = null):LayerVO {
         var instance:LayerVO = new LayerVO();
        instance.bitmap = bitmap;
        instance.type = type;
        return instance;
    }


    public function toString():String {
        return "LayerVO{type=" + String(type) + ",bitmapIndex=" + String(bitmapIndex) + ",imageName=" + String(imageName) + "}";
    }
}
}
