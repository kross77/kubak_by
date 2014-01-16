

import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.IEventDispatcher;
import mx.core.IPropertyChangeNotifier;
import mx.events.PropertyChangeEvent;
import mx.utils.ObjectProxy;
import mx.utils.UIDUtil;

import spark.primitives.Line;
import spark.components.Group;

class BindableProperty
{
	/*
	 * generated bindable wrapper for property hGuide (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'hGuide' moved to '_1248375948hGuide'
	 */

    [Bindable(event="propertyChange")]
    public function get hGuide():spark.primitives.Line
    {
        return this._1248375948hGuide;
    }

    public function set hGuide(value:spark.primitives.Line):void
    {
    	var oldValue:Object = this._1248375948hGuide;
        if (oldValue !== value)
        {
            this._1248375948hGuide = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "hGuide", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property passiveGuideGroup (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'passiveGuideGroup' moved to '_772411242passiveGuideGroup'
	 */

    [Bindable(event="propertyChange")]
    public function get passiveGuideGroup():spark.components.Group
    {
        return this._772411242passiveGuideGroup;
    }

    public function set passiveGuideGroup(value:spark.components.Group):void
    {
    	var oldValue:Object = this._772411242passiveGuideGroup;
        if (oldValue !== value)
        {
            this._772411242passiveGuideGroup = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "passiveGuideGroup", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property vGuide (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'vGuide' moved to '_847567834vGuide'
	 */

    [Bindable(event="propertyChange")]
    public function get vGuide():spark.primitives.Line
    {
        return this._847567834vGuide;
    }

    public function set vGuide(value:spark.primitives.Line):void
    {
    	var oldValue:Object = this._847567834vGuide;
        if (oldValue !== value)
        {
            this._847567834vGuide = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "vGuide", oldValue, value));
        }
    }



}
