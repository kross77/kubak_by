

import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.IEventDispatcher;
import mx.core.IPropertyChangeNotifier;
import mx.events.PropertyChangeEvent;
import mx.utils.ObjectProxy;
import mx.utils.UIDUtil;

import modules.imgeditor.model.LayersModel;
import modules.imgeditor.view.components.LayersList;
import spark.components.Group;
import modules.imgeditor.view.components.LayerManagerView;
import spark.components.Button;

class BindableProperty
{
	/*
	 * generated bindable wrapper for property addImageButton (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'addImageButton' moved to '_1984152308addImageButton'
	 */

    [Bindable(event="propertyChange")]
    public function get addImageButton():spark.components.Button
    {
        return this._1984152308addImageButton;
    }

    public function set addImageButton(value:spark.components.Button):void
    {
    	var oldValue:Object = this._1984152308addImageButton;
        if (oldValue !== value)
        {
            this._1984152308addImageButton = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "addImageButton", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property layerList (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'layerList' moved to '_1664685681layerList'
	 */

    [Bindable(event="propertyChange")]
    public function get layerList():modules.imgeditor.view.components.LayersList
    {
        return this._1664685681layerList;
    }

    public function set layerList(value:modules.imgeditor.view.components.LayersList):void
    {
    	var oldValue:Object = this._1664685681layerList;
        if (oldValue !== value)
        {
            this._1664685681layerList = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "layerList", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property layerManagerView (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'layerManagerView' moved to '_468703775layerManagerView'
	 */

    [Bindable(event="propertyChange")]
    public function get layerManagerView():modules.imgeditor.view.components.LayerManagerView
    {
        return this._468703775layerManagerView;
    }

    public function set layerManagerView(value:modules.imgeditor.view.components.LayerManagerView):void
    {
    	var oldValue:Object = this._468703775layerManagerView;
        if (oldValue !== value)
        {
            this._468703775layerManagerView = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "layerManagerView", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property toolsContainerGroup (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'toolsContainerGroup' moved to '_483713735toolsContainerGroup'
	 */

    [Bindable(event="propertyChange")]
    public function get toolsContainerGroup():spark.components.Group
    {
        return this._483713735toolsContainerGroup;
    }

    public function set toolsContainerGroup(value:spark.components.Group):void
    {
    	var oldValue:Object = this._483713735toolsContainerGroup;
        if (oldValue !== value)
        {
            this._483713735toolsContainerGroup = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "toolsContainerGroup", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property layersModel (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'layersModel' moved to '_944558329layersModel'
	 */

    [Bindable(event="propertyChange")]
    public function get layersModel():LayersModel
    {
        return this._944558329layersModel;
    }

    public function set layersModel(value:LayersModel):void
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
