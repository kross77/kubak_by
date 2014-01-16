/**
 * Created by Admin on 07.01.14.
 */
package by.kross77.select.event {
import flash.events.Event;

public class SelectEvent extends Event {
    private var _data:Object;
    public static const FILES_SELECTED:String = "filesSelected";
    public static const FILE_LOADED:String = "fileLoaded";
    public static const BROWSE:String = "browse";
    public function SelectEvent(type:String, data:Object = null, bubbles:Boolean = false, cancelable:Boolean = false) {
        super(type, bubbles, cancelable);
        _data = data;
    }

    public function get data():Object {
        return _data;
    }
}
}
