/**
 * Created by Admin on 09.01.14.
 */
package modules.imgeditor.controller {
import flash.events.IEventDispatcher;

public class BaseController {
    [Dispatcher]
    public var dispatcher:IEventDispatcher;
    public function BaseController() {
    }
}
}
