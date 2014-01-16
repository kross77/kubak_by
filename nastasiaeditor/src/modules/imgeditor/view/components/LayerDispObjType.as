/**
 * Created by user on 16.01.14.
 */
package modules.imgeditor.view.components {
import flash.utils.Dictionary;

public class LayerDispObjType {


    private var _value:String;

    
    public static const FILL_TEST:LayerDispObjType = getType("fillTest");
    public static const IMAGE:LayerDispObjType = getType("image");
    public static const FILL_IMAGE:LayerDispObjType = getType("fillImage");


    public function LayerDispObjType(value:String) {
        _value = value;
    }

    private static var _types:Dictionary;
    private static function getType(s:String):LayerDispObjType {
        if(types[s] == null) types[s] = new LayerDispObjType(s);
        return types[s];
    }

    public static function get types():Dictionary {
        if(_types == null) _types = new Dictionary();
        return _types;
    }
}
}


