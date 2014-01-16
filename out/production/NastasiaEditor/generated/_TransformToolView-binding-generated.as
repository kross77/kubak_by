

import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.IEventDispatcher;
import mx.core.IPropertyChangeNotifier;
import mx.events.PropertyChangeEvent;
import mx.utils.ObjectProxy;
import mx.utils.UIDUtil;

import spark.primitives.Rect;
import mx.collections.ArrayCollection;
import modules.imgeditor.model.LayersModel;
import modules.imgeditor.view.components.LayersList;
import examples.components.GuideContainer;
import spark.components.Group;
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
	 * generated bindable wrapper for property border (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'border' moved to '_1383304148border'
	 */

    [Bindable(event="propertyChange")]
    public function get border():spark.primitives.Rect
    {
        return this._1383304148border;
    }

    public function set border(value:spark.primitives.Rect):void
    {
    	var oldValue:Object = this._1383304148border;
        if (oldValue !== value)
        {
            this._1383304148border = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "border", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property designArea (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'designArea' moved to '_30017685designArea'
	 */

    [Bindable(event="propertyChange")]
    public function get designArea():spark.components.Group
    {
        return this._30017685designArea;
    }

    public function set designArea(value:spark.components.Group):void
    {
    	var oldValue:Object = this._30017685designArea;
        if (oldValue !== value)
        {
            this._30017685designArea = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "designArea", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property guideContainer (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'guideContainer' moved to '_214053659guideContainer'
	 */

    [Bindable(event="propertyChange")]
    public function get guideContainer():examples.components.GuideContainer
    {
        return this._214053659guideContainer;
    }

    public function set guideContainer(value:examples.components.GuideContainer):void
    {
    	var oldValue:Object = this._214053659guideContainer;
        if (oldValue !== value)
        {
            this._214053659guideContainer = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "guideContainer", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property imageGroup (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'imageGroup' moved to '_1464992284imageGroup'
	 */

    [Bindable(event="propertyChange")]
    public function get imageGroup():spark.components.Group
    {
        return this._1464992284imageGroup;
    }

    public function set imageGroup(value:spark.components.Group):void
    {
    	var oldValue:Object = this._1464992284imageGroup;
        if (oldValue !== value)
        {
            this._1464992284imageGroup = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "imageGroup", oldValue, value));
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

	/*
	 * generated bindable wrapper for property deletedObjects (private)
	 * - generated setter
	 * - generated getter
	 * - original private var 'deletedObjects' moved to '_369725115deletedObjects'
	 */

    [Bindable(event="propertyChange")]
    private function get deletedObjects():ArrayCollection
    {
        return this._369725115deletedObjects;
    }

    private function set deletedObjects(value:ArrayCollection):void
    {
    	var oldValue:Object = this._369725115deletedObjects;
        if (oldValue !== value)
        {
            this._369725115deletedObjects = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "deletedObjects", oldValue, value));
        }
    }



}
