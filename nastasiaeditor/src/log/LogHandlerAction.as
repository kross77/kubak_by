/**
 * Created by user on 15.01.14.
 */
package log {
import mx.logging.ILogger;

import org.osmf.logging.Log;

public class LogHandlerAction implements GlobalExceptionHandlerAction {


    public function handle(error:Object):void {
        if (error is Error) {
            var errorObj:Error = error as Error;
            trace("{0}. {1}\n {2}", errorObj.errorID, errorObj.message, errorObj.getStackTrace());
        }
    }
}
}
