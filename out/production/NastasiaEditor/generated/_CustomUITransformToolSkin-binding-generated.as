

import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.IEventDispatcher;
import mx.core.IPropertyChangeNotifier;
import mx.events.PropertyChangeEvent;
import mx.utils.ObjectProxy;
import mx.utils.UIDUtil;

import spark.primitives.BitmapImage;
import com.vstyran.transform.controls.Control;
import com.vstyran.transform.managers.vector.cursors.ResizeCursor;
import examples.view.CustomUITransformTool;
import com.vstyran.transform.controls.Anchor;
import spark.components.Group;
import com.vstyran.transform.managers.vector.CursorManager;
import spark.components.Button;

class BindableProperty
{
	/*
	 * generated bindable wrapper for property bottomLeftControl (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'bottomLeftControl' moved to '_960484309bottomLeftControl'
	 */

    [Bindable(event="propertyChange")]
    public function get bottomLeftControl():com.vstyran.transform.controls.Control
    {
        return this._960484309bottomLeftControl;
    }

    public function set bottomLeftControl(value:com.vstyran.transform.controls.Control):void
    {
    	var oldValue:Object = this._960484309bottomLeftControl;
        if (oldValue !== value)
        {
            this._960484309bottomLeftControl = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "bottomLeftControl", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property bottomMiddleControl (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'bottomMiddleControl' moved to '_2064569757bottomMiddleControl'
	 */

    [Bindable(event="propertyChange")]
    public function get bottomMiddleControl():com.vstyran.transform.controls.Control
    {
        return this._2064569757bottomMiddleControl;
    }

    public function set bottomMiddleControl(value:com.vstyran.transform.controls.Control):void
    {
    	var oldValue:Object = this._2064569757bottomMiddleControl;
        if (oldValue !== value)
        {
            this._2064569757bottomMiddleControl = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "bottomMiddleControl", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property bottomRightControl (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'bottomRightControl' moved to '_1610541420bottomRightControl'
	 */

    [Bindable(event="propertyChange")]
    public function get bottomRightControl():com.vstyran.transform.controls.Control
    {
        return this._1610541420bottomRightControl;
    }

    public function set bottomRightControl(value:com.vstyran.transform.controls.Control):void
    {
    	var oldValue:Object = this._1610541420bottomRightControl;
        if (oldValue !== value)
        {
            this._1610541420bottomRightControl = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "bottomRightControl", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property boundingGroup (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'boundingGroup' moved to '_1658263749boundingGroup'
	 */

    [Bindable(event="propertyChange")]
    public function get boundingGroup():spark.components.Group
    {
        return this._1658263749boundingGroup;
    }

    public function set boundingGroup(value:spark.components.Group):void
    {
    	var oldValue:Object = this._1658263749boundingGroup;
        if (oldValue !== value)
        {
            this._1658263749boundingGroup = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "boundingGroup", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property centerAnchorControl (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'centerAnchorControl' moved to '_710964589centerAnchorControl'
	 */

    [Bindable(event="propertyChange")]
    public function get centerAnchorControl():com.vstyran.transform.controls.Anchor
    {
        return this._710964589centerAnchorControl;
    }

    public function set centerAnchorControl(value:com.vstyran.transform.controls.Anchor):void
    {
    	var oldValue:Object = this._710964589centerAnchorControl;
        if (oldValue !== value)
        {
            this._710964589centerAnchorControl = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "centerAnchorControl", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property deleteButton (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'deleteButton' moved to '_1245745987deleteButton'
	 */

    [Bindable(event="propertyChange")]
    public function get deleteButton():spark.components.Button
    {
        return this._1245745987deleteButton;
    }

    public function set deleteButton(value:spark.components.Button):void
    {
    	var oldValue:Object = this._1245745987deleteButton;
        if (oldValue !== value)
        {
            this._1245745987deleteButton = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "deleteButton", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property middleLeftControl (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'middleLeftControl' moved to '_804783745middleLeftControl'
	 */

    [Bindable(event="propertyChange")]
    public function get middleLeftControl():com.vstyran.transform.controls.Control
    {
        return this._804783745middleLeftControl;
    }

    public function set middleLeftControl(value:com.vstyran.transform.controls.Control):void
    {
    	var oldValue:Object = this._804783745middleLeftControl;
        if (oldValue !== value)
        {
            this._804783745middleLeftControl = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "middleLeftControl", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property middleRightControl (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'middleRightControl' moved to '_499276246middleRightControl'
	 */

    [Bindable(event="propertyChange")]
    public function get middleRightControl():com.vstyran.transform.controls.Control
    {
        return this._499276246middleRightControl;
    }

    public function set middleRightControl(value:com.vstyran.transform.controls.Control):void
    {
    	var oldValue:Object = this._499276246middleRightControl;
        if (oldValue !== value)
        {
            this._499276246middleRightControl = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "middleRightControl", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property moveControl (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'moveControl' moved to '_1082786892moveControl'
	 */

    [Bindable(event="propertyChange")]
    public function get moveControl():com.vstyran.transform.controls.Control
    {
        return this._1082786892moveControl;
    }

    public function set moveControl(value:com.vstyran.transform.controls.Control):void
    {
    	var oldValue:Object = this._1082786892moveControl;
        if (oldValue !== value)
        {
            this._1082786892moveControl = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "moveControl", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property preview (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'preview' moved to '_318184504preview'
	 */

    [Bindable(event="propertyChange")]
    public function get preview():spark.primitives.BitmapImage
    {
        return this._318184504preview;
    }

    public function set preview(value:spark.primitives.BitmapImage):void
    {
    	var oldValue:Object = this._318184504preview;
        if (oldValue !== value)
        {
            this._318184504preview = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "preview", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property previewCover (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'previewCover' moved to '_1388667697previewCover'
	 */

    [Bindable(event="propertyChange")]
    public function get previewCover():spark.components.Group
    {
        return this._1388667697previewCover;
    }

    public function set previewCover(value:spark.components.Group):void
    {
    	var oldValue:Object = this._1388667697previewCover;
        if (oldValue !== value)
        {
            this._1388667697previewCover = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "previewCover", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property resizeCursor (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'resizeCursor' moved to '_1853536982resizeCursor'
	 */

    [Bindable(event="propertyChange")]
    public function get resizeCursor():com.vstyran.transform.managers.vector.cursors.ResizeCursor
    {
        return this._1853536982resizeCursor;
    }

    public function set resizeCursor(value:com.vstyran.transform.managers.vector.cursors.ResizeCursor):void
    {
    	var oldValue:Object = this._1853536982resizeCursor;
        if (oldValue !== value)
        {
            this._1853536982resizeCursor = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "resizeCursor", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property rotateControl (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'rotateControl' moved to '_1520268162rotateControl'
	 */

    [Bindable(event="propertyChange")]
    public function get rotateControl():com.vstyran.transform.controls.Control
    {
        return this._1520268162rotateControl;
    }

    public function set rotateControl(value:com.vstyran.transform.controls.Control):void
    {
    	var oldValue:Object = this._1520268162rotateControl;
        if (oldValue !== value)
        {
            this._1520268162rotateControl = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "rotateControl", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property toolCursorManager (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'toolCursorManager' moved to '_1221565249toolCursorManager'
	 */

    [Bindable(event="propertyChange")]
    public function get toolCursorManager():com.vstyran.transform.managers.vector.CursorManager
    {
        return this._1221565249toolCursorManager;
    }

    public function set toolCursorManager(value:com.vstyran.transform.managers.vector.CursorManager):void
    {
    	var oldValue:Object = this._1221565249toolCursorManager;
        if (oldValue !== value)
        {
            this._1221565249toolCursorManager = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "toolCursorManager", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property topLeftControl (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'topLeftControl' moved to '_1998767809topLeftControl'
	 */

    [Bindable(event="propertyChange")]
    public function get topLeftControl():com.vstyran.transform.controls.Control
    {
        return this._1998767809topLeftControl;
    }

    public function set topLeftControl(value:com.vstyran.transform.controls.Control):void
    {
    	var oldValue:Object = this._1998767809topLeftControl;
        if (oldValue !== value)
        {
            this._1998767809topLeftControl = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "topLeftControl", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property topMiddleControl (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'topMiddleControl' moved to '_1657462093topMiddleControl'
	 */

    [Bindable(event="propertyChange")]
    public function get topMiddleControl():com.vstyran.transform.controls.Control
    {
        return this._1657462093topMiddleControl;
    }

    public function set topMiddleControl(value:com.vstyran.transform.controls.Control):void
    {
    	var oldValue:Object = this._1657462093topMiddleControl;
        if (oldValue !== value)
        {
            this._1657462093topMiddleControl = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "topMiddleControl", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property topRightControl (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'topRightControl' moved to '_1141923434topRightControl'
	 */

    [Bindable(event="propertyChange")]
    public function get topRightControl():com.vstyran.transform.controls.Control
    {
        return this._1141923434topRightControl;
    }

    public function set topRightControl(value:com.vstyran.transform.controls.Control):void
    {
    	var oldValue:Object = this._1141923434topRightControl;
        if (oldValue !== value)
        {
            this._1141923434topRightControl = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "topRightControl", oldValue, value));
        }
    }

	/*
	 * generated bindable wrapper for property hostComponent (public)
	 * - generated setter
	 * - generated getter
	 * - original public var 'hostComponent' moved to '_213507019hostComponent'
	 */

    [Bindable(event="propertyChange")]
    public function get hostComponent():examples.view.CustomUITransformTool
    {
        return this._213507019hostComponent;
    }

    public function set hostComponent(value:examples.view.CustomUITransformTool):void
    {
    	var oldValue:Object = this._213507019hostComponent;
        if (oldValue !== value)
        {
            this._213507019hostComponent = value;
           if (this.hasEventListener("propertyChange"))
               this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "hostComponent", oldValue, value));
        }
    }



}
