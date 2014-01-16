

import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.IEventDispatcher;
import mx.core.IPropertyChangeNotifier;
import mx.events.PropertyChangeEvent;
import mx.utils.ObjectProxy;
import mx.utils.UIDUtil;

import spark.primitives.Rect;
import mx.collections.ArrayCollection;
import examples.view.CustomUITransformTool;
import spark.components.Image;
import examples.components.GuideContainer;
import spark.components.Group;

class BindableProperty
{
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
	 * generated bindable wrapper for property imageTarget1 (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'imageTarget1' moved to '_940014875imageTarget1'
	 */

    [Bindable(event="propertyChange")]
    public function get imageTarget1():spark.components.Image
    {
        return this._940014875imageTarget1;
    }

    public function set imageTarget1(value:spark.components.Image):void
    {
    	var oldValue:Object = this._940014875imageTarget1;
        if (oldValue !== value)
        {
            this._940014875imageTarget1 = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "imageTarget1", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property imageTarget2 (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'imageTarget2' moved to '_940014874imageTarget2'
	 */

    [Bindable(event="propertyChange")]
    public function get imageTarget2():spark.components.Image
    {
        return this._940014874imageTarget2;
    }

    public function set imageTarget2(value:spark.components.Image):void
    {
    	var oldValue:Object = this._940014874imageTarget2;
        if (oldValue !== value)
        {
            this._940014874imageTarget2 = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "imageTarget2", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property imageTarget3 (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'imageTarget3' moved to '_940014873imageTarget3'
	 */

    [Bindable(event="propertyChange")]
    public function get imageTarget3():spark.components.Image
    {
        return this._940014873imageTarget3;
    }

    public function set imageTarget3(value:spark.components.Image):void
    {
    	var oldValue:Object = this._940014873imageTarget3;
        if (oldValue !== value)
        {
            this._940014873imageTarget3 = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "imageTarget3", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property itemsCollection (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'itemsCollection' moved to '_2053717378itemsCollection'
	 */

    [Bindable(event="propertyChange")]
    public function get itemsCollection():mx.collections.ArrayCollection
    {
        return this._2053717378itemsCollection;
    }

    public function set itemsCollection(value:mx.collections.ArrayCollection):void
    {
    	var oldValue:Object = this._2053717378itemsCollection;
        if (oldValue !== value)
        {
            this._2053717378itemsCollection = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "itemsCollection", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property tool (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'tool' moved to '_3565976tool'
	 */

    [Bindable(event="propertyChange")]
    public function get tool():examples.view.CustomUITransformTool
    {
        return this._3565976tool;
    }

    public function set tool(value:examples.view.CustomUITransformTool):void
    {
    	var oldValue:Object = this._3565976tool;
        if (oldValue !== value)
        {
            this._3565976tool = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "tool", oldValue, value));
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
