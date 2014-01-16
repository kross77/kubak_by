

import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.IEventDispatcher;
import mx.core.IPropertyChangeNotifier;
import mx.events.PropertyChangeEvent;
import mx.utils.ObjectProxy;
import mx.utils.UIDUtil;

import modules.imgeditor.controller.LayerManagerController;
import modules.imgeditor.service.LayerManagerFactory;
import modules.imgeditor.model.LayersModel;
import modules.imgeditor.controller.ImageEditorController;

class BindableProperty
{
	/*
	 * generated bindable wrapper for property factory (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'factory' moved to '_1091882742factory'
	 */

    [Bindable(event="propertyChange")]
    public function get factory():modules.imgeditor.service.LayerManagerFactory
    {
        return this._1091882742factory;
    }

    public function set factory(value:modules.imgeditor.service.LayerManagerFactory):void
    {
    	var oldValue:Object = this._1091882742factory;
        if (oldValue !== value)
        {
            this._1091882742factory = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "factory", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property imageEditorController (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'imageEditorController' moved to '_2146833508imageEditorController'
	 */

    [Bindable(event="propertyChange")]
    public function get imageEditorController():modules.imgeditor.controller.ImageEditorController
    {
        return this._2146833508imageEditorController;
    }

    public function set imageEditorController(value:modules.imgeditor.controller.ImageEditorController):void
    {
    	var oldValue:Object = this._2146833508imageEditorController;
        if (oldValue !== value)
        {
            this._2146833508imageEditorController = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "imageEditorController", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property layerManagerController (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'layerManagerController' moved to '_2043612712layerManagerController'
	 */

    [Bindable(event="propertyChange")]
    public function get layerManagerController():modules.imgeditor.controller.LayerManagerController
    {
        return this._2043612712layerManagerController;
    }

    public function set layerManagerController(value:modules.imgeditor.controller.LayerManagerController):void
    {
    	var oldValue:Object = this._2043612712layerManagerController;
        if (oldValue !== value)
        {
            this._2043612712layerManagerController = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "layerManagerController", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property layersModel (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'layersModel' moved to '_944558329layersModel'
	 */

    [Bindable(event="propertyChange")]
    public function get layersModel():modules.imgeditor.model.LayersModel
    {
        return this._944558329layersModel;
    }

    public function set layersModel(value:modules.imgeditor.model.LayersModel):void
    {
    	var oldValue:Object = this._944558329layersModel;
        if (oldValue !== value)
        {
            this._944558329layersModel = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "layersModel", oldValue, value));
        }
    }



}
