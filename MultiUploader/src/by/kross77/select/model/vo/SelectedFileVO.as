/**
 * Created by Admin on 07.01.14.
 */
package by.kross77.select.model.vo {
import flash.display.Bitmap;
import flash.display.DisplayObject;
import flash.net.FileReference;

public class SelectedFileVO {
    public var name:String;
    public var size:String;
    public var file:FileReference;
    public var loadedContent:Bitmap;
    public var params:Object;

    public function SelectedFileVO() {
    }

    public static function convertFromFileReference(file:FileReference):SelectedFileVO {
        var instance:SelectedFileVO = new SelectedFileVO();
        instance.name = file.name;
        instance.size = formatFileSize(file.size);
        instance.file = file;
        return instance;
    }

// Called to format number to file size
    static private function formatFileSize(numSize:Number):String {
        var strReturn:String;
        numSize = Number(numSize / 1000);
        strReturn = String(numSize.toFixed(1) + " KB");
        if (numSize > 1000) {
            numSize = numSize / 1000;
            strReturn = String(numSize.toFixed(1) + " MB");
            if (numSize > 1000) {
                numSize = numSize / 1000;
                strReturn = String(numSize.toFixed(1) + " GB");
            }
        }
        return strReturn;
    }


    public function toString():String {
        return "SelectedFileVO{name=" + String(name) + ",size=" + String(size) + ",file=" + String(file) + "}";
    }
}
}
