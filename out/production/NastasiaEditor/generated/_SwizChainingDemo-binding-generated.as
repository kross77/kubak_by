

import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.IEventDispatcher;
import mx.core.IPropertyChangeNotifier;
import mx.events.PropertyChangeEvent;
import mx.utils.ObjectProxy;
import mx.utils.UIDUtil;

import modules.imgeditor.view.TransformToolView;
import org.swizframework.core.SwizConfig;
import org.swizframework.core.mxml.Swiz;
import org.swizframework.utils.logging.SwizTraceTarget;

class BindableProperty
{
	/*
	 * generated bindable wrapper for property mySwiz (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'mySwiz' moved to '_1060053407mySwiz'
	 */

    [Bindable(event="propertyChange")]
    public function get mySwiz():org.swizframework.core.mxml.Swiz
    {
        return this._1060053407mySwiz;
    }

    public function set mySwiz(value:org.swizframework.core.mxml.Swiz):void
    {
    	var oldValue:Object = this._1060053407mySwiz;
        if (oldValue !== value)
        {
            this._1060053407mySwiz = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "mySwiz", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property mySwizConfig (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'mySwizConfig' moved to '_269697283mySwizConfig'
	 */

    [Bindable(event="propertyChange")]
    public function get mySwizConfig():org.swizframework.core.SwizConfig
    {
        return this._269697283mySwizConfig;
    }

    public function set mySwizConfig(value:org.swizframework.core.SwizConfig):void
    {
    	var oldValue:Object = this._269697283mySwizConfig;
        if (oldValue !== value)
        {
            this._269697283mySwizConfig = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "mySwizConfig", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property myTraceTarget (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'myTraceTarget' moved to '_1573184022myTraceTarget'
	 */

    [Bindable(event="propertyChange")]
    public function get myTraceTarget():org.swizframework.utils.logging.SwizTraceTarget
    {
        return this._1573184022myTraceTarget;
    }

    public function set myTraceTarget(value:org.swizframework.utils.logging.SwizTraceTarget):void
    {
    	var oldValue:Object = this._1573184022myTraceTarget;
        if (oldValue !== value)
        {
            this._1573184022myTraceTarget = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "myTraceTarget", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property transformToolView (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'transformToolView' moved to '_1858261015transformToolView'
	 */

    [Bindable(event="propertyChange")]
    public function get transformToolView():modules.imgeditor.view.TransformToolView
    {
        return this._1858261015transformToolView;
    }

    public function set transformToolView(value:modules.imgeditor.view.TransformToolView):void
    {
    	var oldValue:Object = this._1858261015transformToolView;
        if (oldValue !== value)
        {
            this._1858261015transformToolView = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "transformToolView", oldValue, value));
        }
    }



}
