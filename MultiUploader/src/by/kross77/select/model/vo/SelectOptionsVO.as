/**
 * Created by Admin on 07.01.14.
 */
package by.kross77.select.model.vo {
public class SelectOptionsVO {
    public var filterDescription:String;
    public var filterExtension:String;
    public function SelectOptionsVO() {
    }

    public static function getFromXML(xml:XML):SelectOptionsVO {
       var instance:SelectOptionsVO = new SelectOptionsVO();
        instance.filterDescription = xml.file_filter.attribute("description");
        instance.filterExtension = xml.file_filter.attribute("extension");
        return instance;
    }

    public static function getImageFilter():SelectOptionsVO {
        var instance:SelectOptionsVO = new SelectOptionsVO();
        instance.filterDescription = "Image formats";
        instance.filterExtension = "*.jpg;*.jpeg;*.gif;*.png;"
        return instance;
    }

    public static function getRarFilter():SelectOptionsVO {
        var instance:SelectOptionsVO = new SelectOptionsVO();
        instance.filterDescription = "Rar архив(*.rar)";
        instance.filterExtension = "*.rar"
        return instance;
    }
}
}
