

import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.IEventDispatcher;
import mx.core.IPropertyChangeNotifier;
import mx.events.PropertyChangeEvent;
import mx.utils.ObjectProxy;
import mx.utils.UIDUtil;

import spark.components.Button;

class BindableProperty
{
	/*
	 * generated bindable wrapper for property selectButton (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'selectButton' moved to '_1555143502selectButton'
	 */

    [Bindable(event="propertyChange")]
    public function get selectButton():spark.components.Button
    {
        return this._1555143502selectButton;
    }

    public function set selectButton(value:spark.components.Button):void
    {
    	var oldValue:Object = this._1555143502selectButton;
        if (oldValue !== value)
        {
            this._1555143502selectButton = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "selectButton", oldValue, value));
        }
    }



}
