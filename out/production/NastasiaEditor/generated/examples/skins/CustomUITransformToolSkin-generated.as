
/**
 *  Generated by mxmlc 4.0
 *
 *  Package:    examples.skins
 *  Class:      CustomUITransformToolSkin
 *  Source:     D:\a.krasovsky\Dropbox\projects\my\site\NastasiaEditor\src\examples\skins\CustomUITransformToolSkin.mxml
 *  Template:   flex2/compiler/mxml/gen/ClassDef.vm
 *  Time:       2014.01.15 05:00:19 AST
 */

package examples.skins
{

import com.vstyran.transform.controls.Anchor;
import com.vstyran.transform.controls.Control;
import com.vstyran.transform.controls.Hint;
import com.vstyran.transform.managers.vector.CursorItem;
import com.vstyran.transform.managers.vector.CursorManager;
import com.vstyran.transform.managers.vector.cursors.MoveCursor;
import com.vstyran.transform.managers.vector.cursors.ResizeCursor;
import com.vstyran.transform.managers.vector.cursors.RotateCursor;
import com.vstyran.transform.model.SegmentData;
import com.vstyran.transform.operations.MoveOperation;
import com.vstyran.transform.operations.ResizeOperation;
import com.vstyran.transform.operations.RotateOperation;
import com.vstyran.transform.skins.MoveControlSkin;
import examples.skins.DeleteButtonSkin;
import flash.accessibility.*;
import flash.debugger.*;
import flash.display.*;
import flash.display.DisplayObject;
import flash.errors.*;
import flash.events.*;
import flash.external.*;
import flash.geom.*;
import flash.geom.Point;
import flash.media.*;
import flash.net.*;
import flash.printing.*;
import flash.profiler.*;
import flash.system.*;
import flash.text.*;
import flash.ui.*;
import flash.utils.*;
import flash.xml.*;
import mx.binding.*;
import mx.binding.IBindingClient;
import mx.core.ClassFactory;
import mx.core.DeferredInstanceFromClass;
import mx.core.DeferredInstanceFromFunction;
import mx.core.IDeferredInstance;
import mx.core.IFactory;
import mx.core.IFlexModuleFactory;
import mx.core.IPropertyChangeNotifier;
import mx.core.IStateClient2;
import mx.core.IVisualElement;
import mx.core.mx_internal;
import mx.filters.*;
import mx.graphics.SolidColor;
import mx.graphics.SolidColorStroke;
import mx.states.State;
import mx.styles.*;
import spark.components.Button;
import spark.components.Group;
import spark.components.supportClasses.Skin;
import spark.primitives.BitmapImage;
import spark.primitives.Line;
import spark.primitives.Rect;


[HostComponent("examples.view.CustomUITransformTool")]
[States("normal", "shiftPressed", "ctrlPressed", "altPressed")]

//  begin class def
public class CustomUITransformToolSkin
    extends spark.components.supportClasses.Skin
    implements mx.binding.IBindingClient, mx.core.IStateClient2
{

    //  instance variables
/**
 * @private
 **/
    public var _CustomUITransformToolSkin_CursorItem1 : com.vstyran.transform.managers.vector.CursorItem;

/**
 * @private
 **/
    public var _CustomUITransformToolSkin_CursorItem10 : com.vstyran.transform.managers.vector.CursorItem;

/**
 * @private
 **/
    public var _CustomUITransformToolSkin_CursorItem2 : com.vstyran.transform.managers.vector.CursorItem;

/**
 * @private
 **/
    public var _CustomUITransformToolSkin_CursorItem3 : com.vstyran.transform.managers.vector.CursorItem;

/**
 * @private
 **/
    public var _CustomUITransformToolSkin_CursorItem4 : com.vstyran.transform.managers.vector.CursorItem;

/**
 * @private
 **/
    public var _CustomUITransformToolSkin_CursorItem5 : com.vstyran.transform.managers.vector.CursorItem;

/**
 * @private
 **/
    public var _CustomUITransformToolSkin_CursorItem6 : com.vstyran.transform.managers.vector.CursorItem;

/**
 * @private
 **/
    public var _CustomUITransformToolSkin_CursorItem7 : com.vstyran.transform.managers.vector.CursorItem;

/**
 * @private
 **/
    public var _CustomUITransformToolSkin_CursorItem8 : com.vstyran.transform.managers.vector.CursorItem;

/**
 * @private
 **/
    public var _CustomUITransformToolSkin_CursorItem9 : com.vstyran.transform.managers.vector.CursorItem;

/**
 * @private
 **/
    public var _CustomUITransformToolSkin_ResizeOperation1 : com.vstyran.transform.operations.ResizeOperation;

/**
 * @private
 **/
    public var _CustomUITransformToolSkin_ResizeOperation2 : com.vstyran.transform.operations.ResizeOperation;

/**
 * @private
 **/
    public var _CustomUITransformToolSkin_ResizeOperation3 : com.vstyran.transform.operations.ResizeOperation;

/**
 * @private
 **/
    public var _CustomUITransformToolSkin_ResizeOperation4 : com.vstyran.transform.operations.ResizeOperation;

/**
 * @private
 **/
    public var _CustomUITransformToolSkin_ResizeOperation5 : com.vstyran.transform.operations.ResizeOperation;

/**
 * @private
 **/
    public var _CustomUITransformToolSkin_ResizeOperation6 : com.vstyran.transform.operations.ResizeOperation;

/**
 * @private
 **/
    public var _CustomUITransformToolSkin_ResizeOperation7 : com.vstyran.transform.operations.ResizeOperation;

/**
 * @private
 **/
    public var _CustomUITransformToolSkin_ResizeOperation8 : com.vstyran.transform.operations.ResizeOperation;

    [Bindable]
	/**
 * @private
 **/
    public var bottomLeftControl : com.vstyran.transform.controls.Control;

    [Bindable]
	/**
 * @private
 **/
    public var bottomMiddleControl : com.vstyran.transform.controls.Control;

    [Bindable]
	/**
 * @private
 **/
    public var bottomRightControl : com.vstyran.transform.controls.Control;

    [Bindable]
	/**
 * @private
 **/
    public var boundingGroup : spark.components.Group;

    [Bindable]
	/**
 * @private
 **/
    public var centerAnchorControl : com.vstyran.transform.controls.Anchor;

    [Bindable]
	/**
 * @private
 **/
    public var deleteButton : spark.components.Button;

    [Bindable]
	/**
 * @private
 **/
    public var middleLeftControl : com.vstyran.transform.controls.Control;

    [Bindable]
	/**
 * @private
 **/
    public var middleRightControl : com.vstyran.transform.controls.Control;

    [Bindable]
	/**
 * @private
 **/
    public var moveControl : com.vstyran.transform.controls.Control;

    [Bindable]
	/**
 * @private
 **/
    public var preview : spark.primitives.BitmapImage;

    [Bindable]
	/**
 * @private
 **/
    public var previewCover : spark.components.Group;

    [Bindable]
	/**
 * @private
 **/
    public var resizeCursor : com.vstyran.transform.managers.vector.cursors.ResizeCursor;

    [Bindable]
	/**
 * @private
 **/
    public var rotateControl : com.vstyran.transform.controls.Control;

    [Bindable]
	/**
 * @private
 **/
    public var toolCursorManager : com.vstyran.transform.managers.vector.CursorManager;

    [Bindable]
	/**
 * @private
 **/
    public var topLeftControl : com.vstyran.transform.controls.Control;

    [Bindable]
	/**
 * @private
 **/
    public var topMiddleControl : com.vstyran.transform.controls.Control;

    [Bindable]
	/**
 * @private
 **/
    public var topRightControl : com.vstyran.transform.controls.Control;


    //  type-import dummies



    //  constructor (Flex display object)
    /**
     * @private
     **/
    public function CustomUITransformToolSkin()
    {
        super();

        mx_internal::_document = this;


        var bindings:Array = _CustomUITransformToolSkin_bindingsSetup();
        var watchers:Array = [];

        var target:Object = this;

        if (_watcherSetupUtil == null)
        {
            var watcherSetupUtilClass:Object = getDefinitionByName("_examples_skins_CustomUITransformToolSkinWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
        }

        _watcherSetupUtil.setup(this,
                    function(propertyName:String):* { return target[propertyName]; },
                    function(propertyName:String):* { return CustomUITransformToolSkin[propertyName]; },
                    bindings,
                    watchers);

        mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
        mx_internal::_watchers = mx_internal::_watchers.concat(watchers);


        // layer initializers

       
        // properties
        this.width = 200;
        this.height = 180;
        this.mxmlContent = [_CustomUITransformToolSkin_Control1_i(), _CustomUITransformToolSkin_BitmapImage1_i(), _CustomUITransformToolSkin_Group1_i(), _CustomUITransformToolSkin_Line1_c(), _CustomUITransformToolSkin_Control2_i(), _CustomUITransformToolSkin_Control3_i(), _CustomUITransformToolSkin_Control4_i(), _CustomUITransformToolSkin_Control5_i(), _CustomUITransformToolSkin_Control6_i(), _CustomUITransformToolSkin_Control7_i(), _CustomUITransformToolSkin_Control8_i(), _CustomUITransformToolSkin_Control9_i(), _CustomUITransformToolSkin_Control10_i(), _CustomUITransformToolSkin_Anchor1_i(), _CustomUITransformToolSkin_Group2_i()];
        this.currentState = "normal";
        _CustomUITransformToolSkin_ResizeCursor1_i();
        _CustomUITransformToolSkin_CursorManager1_i();


        // events



		states = [
		  new State ({
		    name: "normal",
		    overrides: [
		    ]
		  })
		  ,
		  new State ({
		    name: "shiftPressed",
		    overrides: [
		    ]
		  })
		  ,
		  new State ({
		    name: "ctrlPressed",
		    overrides: [
		    ]
		  })
		  ,
		  new State ({
		    name: "altPressed",
		    overrides: [
		    ]
		  })
		];







        for (var i:uint = 0; i < bindings.length; i++)
        {
            Binding(bindings[i]).execute();
        }


    }

    /**
     * @private
     **/ 
    private var __moduleFactoryInitialized:Boolean = false;

    /**
     * @private
     * Override the module factory so we can defer setting style declarations
     * until a module factory is set. Without the correct module factory set
     * the style declaration will end up in the wrong style manager.
     **/ 
    override public function set moduleFactory(factory:IFlexModuleFactory):void
    {
        super.moduleFactory = factory;
        
        if (__moduleFactoryInitialized)
            return;

        __moduleFactoryInitialized = true;


        // our style settings



                         
    }
 
    //  initialize()
    /**
     * @private
     **/
    override public function initialize():void
    {


        super.initialize();
    }


    //  scripts
    //  end scripts


    //  supporting function definitions for properties, events, styles, effects
private function _CustomUITransformToolSkin_ResizeCursor1_i() : com.vstyran.transform.managers.vector.cursors.ResizeCursor
{
	var temp : com.vstyran.transform.managers.vector.cursors.ResizeCursor = new com.vstyran.transform.managers.vector.cursors.ResizeCursor();
	temp.rotation = 45;
	temp.mouseChildren = false;
	temp.mouseEnabled = false;
	temp.initialized(this, "resizeCursor")
	resizeCursor = temp;
	mx.binding.BindingManager.executeBindings(this, "resizeCursor", resizeCursor);
	return temp;
}

private function _CustomUITransformToolSkin_CursorManager1_i() : com.vstyran.transform.managers.vector.CursorManager
{
	var temp : com.vstyran.transform.managers.vector.CursorManager = new com.vstyran.transform.managers.vector.CursorManager();
	temp.hintXOffset = 25;
	temp.hintYOffset = 10;
	temp.hint = _CustomUITransformToolSkin_Hint1_c();
	temp.items = new <com.vstyran.transform.managers.vector.CursorItem>[_CustomUITransformToolSkin_CursorItem1_i(), _CustomUITransformToolSkin_CursorItem2_i(), _CustomUITransformToolSkin_CursorItem3_i(), _CustomUITransformToolSkin_CursorItem4_i(), _CustomUITransformToolSkin_CursorItem5_i(), _CustomUITransformToolSkin_CursorItem6_i(), _CustomUITransformToolSkin_CursorItem7_i(), _CustomUITransformToolSkin_CursorItem8_i(), _CustomUITransformToolSkin_CursorItem9_i(), _CustomUITransformToolSkin_CursorItem10_i()];
	toolCursorManager = temp;
	mx.binding.BindingManager.executeBindings(this, "toolCursorManager", toolCursorManager);
	return temp;
}

private function _CustomUITransformToolSkin_Hint1_c() : com.vstyran.transform.controls.Hint
{
	var temp : com.vstyran.transform.controls.Hint = new com.vstyran.transform.controls.Hint();
	temp.alpha = 0.6;
	if (!temp.document) temp.document = this;
	return temp;
}

private function _CustomUITransformToolSkin_CursorItem1_i() : com.vstyran.transform.managers.vector.CursorItem
{
	var temp : com.vstyran.transform.managers.vector.CursorItem = new com.vstyran.transform.managers.vector.CursorItem();
	temp.cursor = _CustomUITransformToolSkin_MoveCursor1_c();
	_CustomUITransformToolSkin_CursorItem1 = temp;
	mx.binding.BindingManager.executeBindings(this, "_CustomUITransformToolSkin_CursorItem1", _CustomUITransformToolSkin_CursorItem1);
	return temp;
}

private function _CustomUITransformToolSkin_MoveCursor1_c() : com.vstyran.transform.managers.vector.cursors.MoveCursor
{
	var temp : com.vstyran.transform.managers.vector.cursors.MoveCursor = new com.vstyran.transform.managers.vector.cursors.MoveCursor();
	temp.mouseChildren = false;
	temp.mouseEnabled = false;
	temp.initialized(this, null)
	return temp;
}

private function _CustomUITransformToolSkin_CursorItem2_i() : com.vstyran.transform.managers.vector.CursorItem
{
	var temp : com.vstyran.transform.managers.vector.CursorItem = new com.vstyran.transform.managers.vector.CursorItem();
	temp.maintainRotation = true;
	temp.originalRotation = 90;
	_CustomUITransformToolSkin_CursorItem2 = temp;
	mx.binding.BindingManager.executeBindings(this, "_CustomUITransformToolSkin_CursorItem2", _CustomUITransformToolSkin_CursorItem2);
	return temp;
}

private function _CustomUITransformToolSkin_CursorItem3_i() : com.vstyran.transform.managers.vector.CursorItem
{
	var temp : com.vstyran.transform.managers.vector.CursorItem = new com.vstyran.transform.managers.vector.CursorItem();
	temp.maintainRotation = true;
	temp.originalRotation = 90;
	_CustomUITransformToolSkin_CursorItem3 = temp;
	mx.binding.BindingManager.executeBindings(this, "_CustomUITransformToolSkin_CursorItem3", _CustomUITransformToolSkin_CursorItem3);
	return temp;
}

private function _CustomUITransformToolSkin_CursorItem4_i() : com.vstyran.transform.managers.vector.CursorItem
{
	var temp : com.vstyran.transform.managers.vector.CursorItem = new com.vstyran.transform.managers.vector.CursorItem();
	temp.maintainRotation = true;
	temp.originalRotation = 0;
	_CustomUITransformToolSkin_CursorItem4 = temp;
	mx.binding.BindingManager.executeBindings(this, "_CustomUITransformToolSkin_CursorItem4", _CustomUITransformToolSkin_CursorItem4);
	return temp;
}

private function _CustomUITransformToolSkin_CursorItem5_i() : com.vstyran.transform.managers.vector.CursorItem
{
	var temp : com.vstyran.transform.managers.vector.CursorItem = new com.vstyran.transform.managers.vector.CursorItem();
	temp.maintainRotation = true;
	temp.originalRotation = 0;
	_CustomUITransformToolSkin_CursorItem5 = temp;
	mx.binding.BindingManager.executeBindings(this, "_CustomUITransformToolSkin_CursorItem5", _CustomUITransformToolSkin_CursorItem5);
	return temp;
}

private function _CustomUITransformToolSkin_CursorItem6_i() : com.vstyran.transform.managers.vector.CursorItem
{
	var temp : com.vstyran.transform.managers.vector.CursorItem = new com.vstyran.transform.managers.vector.CursorItem();
	temp.maintainRotation = true;
	temp.originalRotation = 45;
	_CustomUITransformToolSkin_CursorItem6 = temp;
	mx.binding.BindingManager.executeBindings(this, "_CustomUITransformToolSkin_CursorItem6", _CustomUITransformToolSkin_CursorItem6);
	return temp;
}

private function _CustomUITransformToolSkin_CursorItem7_i() : com.vstyran.transform.managers.vector.CursorItem
{
	var temp : com.vstyran.transform.managers.vector.CursorItem = new com.vstyran.transform.managers.vector.CursorItem();
	temp.maintainRotation = true;
	temp.originalRotation = 45;
	_CustomUITransformToolSkin_CursorItem7 = temp;
	mx.binding.BindingManager.executeBindings(this, "_CustomUITransformToolSkin_CursorItem7", _CustomUITransformToolSkin_CursorItem7);
	return temp;
}

private function _CustomUITransformToolSkin_CursorItem8_i() : com.vstyran.transform.managers.vector.CursorItem
{
	var temp : com.vstyran.transform.managers.vector.CursorItem = new com.vstyran.transform.managers.vector.CursorItem();
	temp.maintainRotation = true;
	temp.originalRotation = -45;
	_CustomUITransformToolSkin_CursorItem8 = temp;
	mx.binding.BindingManager.executeBindings(this, "_CustomUITransformToolSkin_CursorItem8", _CustomUITransformToolSkin_CursorItem8);
	return temp;
}

private function _CustomUITransformToolSkin_CursorItem9_i() : com.vstyran.transform.managers.vector.CursorItem
{
	var temp : com.vstyran.transform.managers.vector.CursorItem = new com.vstyran.transform.managers.vector.CursorItem();
	temp.maintainRotation = true;
	temp.originalRotation = -45;
	_CustomUITransformToolSkin_CursorItem9 = temp;
	mx.binding.BindingManager.executeBindings(this, "_CustomUITransformToolSkin_CursorItem9", _CustomUITransformToolSkin_CursorItem9);
	return temp;
}

private function _CustomUITransformToolSkin_CursorItem10_i() : com.vstyran.transform.managers.vector.CursorItem
{
	var temp : com.vstyran.transform.managers.vector.CursorItem = new com.vstyran.transform.managers.vector.CursorItem();
	temp.cursor = _CustomUITransformToolSkin_RotateCursor1_c();
	_CustomUITransformToolSkin_CursorItem10 = temp;
	mx.binding.BindingManager.executeBindings(this, "_CustomUITransformToolSkin_CursorItem10", _CustomUITransformToolSkin_CursorItem10);
	return temp;
}

private function _CustomUITransformToolSkin_RotateCursor1_c() : com.vstyran.transform.managers.vector.cursors.RotateCursor
{
	var temp : com.vstyran.transform.managers.vector.cursors.RotateCursor = new com.vstyran.transform.managers.vector.cursors.RotateCursor();
	temp.mouseChildren = false;
	temp.mouseEnabled = false;
	temp.initialized(this, null)
	return temp;
}

private function _CustomUITransformToolSkin_Control1_i() : com.vstyran.transform.controls.Control
{
	var temp : com.vstyran.transform.controls.Control = new com.vstyran.transform.controls.Control();
	temp.top = 0;
	temp.left = 0;
	temp.right = 0;
	temp.bottom = 0;
	temp.operation = _CustomUITransformToolSkin_MoveOperation1_c();
	temp.setStyle("skinClass", com.vstyran.transform.skins.MoveControlSkin);
	temp.id = "moveControl";
	if (!temp.document) temp.document = this;
	moveControl = temp;
	mx.binding.BindingManager.executeBindings(this, "moveControl", moveControl);
	return temp;
}

private function _CustomUITransformToolSkin_MoveOperation1_c() : com.vstyran.transform.operations.MoveOperation
{
	var temp : com.vstyran.transform.operations.MoveOperation = new com.vstyran.transform.operations.MoveOperation();
	return temp;
}

private function _CustomUITransformToolSkin_BitmapImage1_i() : spark.primitives.BitmapImage
{
	var temp : spark.primitives.BitmapImage = new spark.primitives.BitmapImage();
	temp.alpha = 0.4;
	temp.top = 0;
	temp.left = 0;
	temp.right = 0;
	temp.bottom = 0;
	temp.initialized(this, "preview")
	preview = temp;
	mx.binding.BindingManager.executeBindings(this, "preview", preview);
	return temp;
}

private function _CustomUITransformToolSkin_Group1_i() : spark.components.Group
{
	var temp : spark.components.Group = new spark.components.Group();
	temp.top = 0;
	temp.left = 0;
	temp.right = 0;
	temp.bottom = 0;
	temp.mouseChildren = false;
	temp.mouseEnabled = false;
	temp.mxmlContent = [_CustomUITransformToolSkin_Rect1_c()];
	temp.id = "previewCover";
	if (!temp.document) temp.document = this;
	previewCover = temp;
	mx.binding.BindingManager.executeBindings(this, "previewCover", previewCover);
	return temp;
}

private function _CustomUITransformToolSkin_Rect1_c() : spark.primitives.Rect
{
	var temp : spark.primitives.Rect = new spark.primitives.Rect();
	temp.top = 0;
	temp.left = 0;
	temp.right = 0;
	temp.bottom = 0;
	temp.fill = _CustomUITransformToolSkin_SolidColor1_c();
	temp.initialized(this, null)
	return temp;
}

private function _CustomUITransformToolSkin_SolidColor1_c() : mx.graphics.SolidColor
{
	var temp : mx.graphics.SolidColor = new mx.graphics.SolidColor();
	temp.color = 16777215;
	temp.alpha = 0.4;
	return temp;
}

private function _CustomUITransformToolSkin_Line1_c() : spark.primitives.Line
{
	var temp : spark.primitives.Line = new spark.primitives.Line();
	temp.yFrom = -26;
	temp.yTo = 0;
	temp.horizontalCenter = 0;
	temp.stroke = _CustomUITransformToolSkin_SolidColorStroke1_c();
	temp.initialized(this, null)
	return temp;
}

private function _CustomUITransformToolSkin_SolidColorStroke1_c() : mx.graphics.SolidColorStroke
{
	var temp : mx.graphics.SolidColorStroke = new mx.graphics.SolidColorStroke();
	return temp;
}

private function _CustomUITransformToolSkin_Control2_i() : com.vstyran.transform.controls.Control
{
	var temp : com.vstyran.transform.controls.Control = new com.vstyran.transform.controls.Control();
	temp.top = -26;
	temp.horizontalCenter = 0;
	temp.operation = _CustomUITransformToolSkin_RotateOperation1_c();
	temp.id = "rotateControl";
	if (!temp.document) temp.document = this;
	rotateControl = temp;
	mx.binding.BindingManager.executeBindings(this, "rotateControl", rotateControl);
	return temp;
}

private function _CustomUITransformToolSkin_RotateOperation1_c() : com.vstyran.transform.operations.RotateOperation
{
	var temp : com.vstyran.transform.operations.RotateOperation = new com.vstyran.transform.operations.RotateOperation();
	temp.segments = new <com.vstyran.transform.model.SegmentData>[_CustomUITransformToolSkin_SegmentData1_c(), _CustomUITransformToolSkin_SegmentData2_c()];
	return temp;
}

private function _CustomUITransformToolSkin_SegmentData1_c() : com.vstyran.transform.model.SegmentData
{
	var temp : com.vstyran.transform.model.SegmentData = new com.vstyran.transform.model.SegmentData();
	temp.deltaAngle = 1;
	return temp;
}

private function _CustomUITransformToolSkin_SegmentData2_c() : com.vstyran.transform.model.SegmentData
{
	var temp : com.vstyran.transform.model.SegmentData = new com.vstyran.transform.model.SegmentData();
	temp.deltaAngle = 45;
	temp.fraction = 4;
	return temp;
}

private function _CustomUITransformToolSkin_Control3_i() : com.vstyran.transform.controls.Control
{
	var temp : com.vstyran.transform.controls.Control = new com.vstyran.transform.controls.Control();
	temp.top = -6;
	temp.left = -6;
	temp.operation = _CustomUITransformToolSkin_ResizeOperation1_i();
	temp.id = "topLeftControl";
	if (!temp.document) temp.document = this;
	topLeftControl = temp;
	mx.binding.BindingManager.executeBindings(this, "topLeftControl", topLeftControl);
	return temp;
}

private function _CustomUITransformToolSkin_ResizeOperation1_i() : com.vstyran.transform.operations.ResizeOperation
{
	var temp : com.vstyran.transform.operations.ResizeOperation = new com.vstyran.transform.operations.ResizeOperation();
	_CustomUITransformToolSkin_ResizeOperation1 = temp;
	mx.binding.BindingManager.executeBindings(this, "_CustomUITransformToolSkin_ResizeOperation1", _CustomUITransformToolSkin_ResizeOperation1);
	return temp;
}

private function _CustomUITransformToolSkin_Control4_i() : com.vstyran.transform.controls.Control
{
	var temp : com.vstyran.transform.controls.Control = new com.vstyran.transform.controls.Control();
	temp.top = -6;
	temp.horizontalCenter = 0;
	temp.operation = _CustomUITransformToolSkin_ResizeOperation2_i();
	temp.id = "topMiddleControl";
	if (!temp.document) temp.document = this;
	topMiddleControl = temp;
	mx.binding.BindingManager.executeBindings(this, "topMiddleControl", topMiddleControl);
	return temp;
}

private function _CustomUITransformToolSkin_ResizeOperation2_i() : com.vstyran.transform.operations.ResizeOperation
{
	var temp : com.vstyran.transform.operations.ResizeOperation = new com.vstyran.transform.operations.ResizeOperation();
	temp.horizontalEnabled = false;
	_CustomUITransformToolSkin_ResizeOperation2 = temp;
	mx.binding.BindingManager.executeBindings(this, "_CustomUITransformToolSkin_ResizeOperation2", _CustomUITransformToolSkin_ResizeOperation2);
	return temp;
}

private function _CustomUITransformToolSkin_Control5_i() : com.vstyran.transform.controls.Control
{
	var temp : com.vstyran.transform.controls.Control = new com.vstyran.transform.controls.Control();
	temp.top = -6;
	temp.right = -6;
	temp.operation = _CustomUITransformToolSkin_ResizeOperation3_i();
	temp.id = "topRightControl";
	if (!temp.document) temp.document = this;
	topRightControl = temp;
	mx.binding.BindingManager.executeBindings(this, "topRightControl", topRightControl);
	return temp;
}

private function _CustomUITransformToolSkin_ResizeOperation3_i() : com.vstyran.transform.operations.ResizeOperation
{
	var temp : com.vstyran.transform.operations.ResizeOperation = new com.vstyran.transform.operations.ResizeOperation();
	_CustomUITransformToolSkin_ResizeOperation3 = temp;
	mx.binding.BindingManager.executeBindings(this, "_CustomUITransformToolSkin_ResizeOperation3", _CustomUITransformToolSkin_ResizeOperation3);
	return temp;
}

private function _CustomUITransformToolSkin_Control6_i() : com.vstyran.transform.controls.Control
{
	var temp : com.vstyran.transform.controls.Control = new com.vstyran.transform.controls.Control();
	temp.verticalCenter = 0;
	temp.right = -6;
	temp.operation = _CustomUITransformToolSkin_ResizeOperation4_i();
	temp.id = "middleRightControl";
	if (!temp.document) temp.document = this;
	middleRightControl = temp;
	mx.binding.BindingManager.executeBindings(this, "middleRightControl", middleRightControl);
	return temp;
}

private function _CustomUITransformToolSkin_ResizeOperation4_i() : com.vstyran.transform.operations.ResizeOperation
{
	var temp : com.vstyran.transform.operations.ResizeOperation = new com.vstyran.transform.operations.ResizeOperation();
	temp.verticalEnabled = false;
	_CustomUITransformToolSkin_ResizeOperation4 = temp;
	mx.binding.BindingManager.executeBindings(this, "_CustomUITransformToolSkin_ResizeOperation4", _CustomUITransformToolSkin_ResizeOperation4);
	return temp;
}

private function _CustomUITransformToolSkin_Control7_i() : com.vstyran.transform.controls.Control
{
	var temp : com.vstyran.transform.controls.Control = new com.vstyran.transform.controls.Control();
	temp.bottom = -6;
	temp.right = -6;
	temp.operation = _CustomUITransformToolSkin_ResizeOperation5_i();
	temp.id = "bottomRightControl";
	if (!temp.document) temp.document = this;
	bottomRightControl = temp;
	mx.binding.BindingManager.executeBindings(this, "bottomRightControl", bottomRightControl);
	return temp;
}

private function _CustomUITransformToolSkin_ResizeOperation5_i() : com.vstyran.transform.operations.ResizeOperation
{
	var temp : com.vstyran.transform.operations.ResizeOperation = new com.vstyran.transform.operations.ResizeOperation();
	_CustomUITransformToolSkin_ResizeOperation5 = temp;
	mx.binding.BindingManager.executeBindings(this, "_CustomUITransformToolSkin_ResizeOperation5", _CustomUITransformToolSkin_ResizeOperation5);
	return temp;
}

private function _CustomUITransformToolSkin_Control8_i() : com.vstyran.transform.controls.Control
{
	var temp : com.vstyran.transform.controls.Control = new com.vstyran.transform.controls.Control();
	temp.bottom = -6;
	temp.horizontalCenter = 0;
	temp.operation = _CustomUITransformToolSkin_ResizeOperation6_i();
	temp.id = "bottomMiddleControl";
	if (!temp.document) temp.document = this;
	bottomMiddleControl = temp;
	mx.binding.BindingManager.executeBindings(this, "bottomMiddleControl", bottomMiddleControl);
	return temp;
}

private function _CustomUITransformToolSkin_ResizeOperation6_i() : com.vstyran.transform.operations.ResizeOperation
{
	var temp : com.vstyran.transform.operations.ResizeOperation = new com.vstyran.transform.operations.ResizeOperation();
	temp.horizontalEnabled = false;
	_CustomUITransformToolSkin_ResizeOperation6 = temp;
	mx.binding.BindingManager.executeBindings(this, "_CustomUITransformToolSkin_ResizeOperation6", _CustomUITransformToolSkin_ResizeOperation6);
	return temp;
}

private function _CustomUITransformToolSkin_Control9_i() : com.vstyran.transform.controls.Control
{
	var temp : com.vstyran.transform.controls.Control = new com.vstyran.transform.controls.Control();
	temp.bottom = -6;
	temp.left = -6;
	temp.operation = _CustomUITransformToolSkin_ResizeOperation7_i();
	temp.id = "bottomLeftControl";
	if (!temp.document) temp.document = this;
	bottomLeftControl = temp;
	mx.binding.BindingManager.executeBindings(this, "bottomLeftControl", bottomLeftControl);
	return temp;
}

private function _CustomUITransformToolSkin_ResizeOperation7_i() : com.vstyran.transform.operations.ResizeOperation
{
	var temp : com.vstyran.transform.operations.ResizeOperation = new com.vstyran.transform.operations.ResizeOperation();
	_CustomUITransformToolSkin_ResizeOperation7 = temp;
	mx.binding.BindingManager.executeBindings(this, "_CustomUITransformToolSkin_ResizeOperation7", _CustomUITransformToolSkin_ResizeOperation7);
	return temp;
}

private function _CustomUITransformToolSkin_Control10_i() : com.vstyran.transform.controls.Control
{
	var temp : com.vstyran.transform.controls.Control = new com.vstyran.transform.controls.Control();
	temp.verticalCenter = 0;
	temp.left = -6;
	temp.operation = _CustomUITransformToolSkin_ResizeOperation8_i();
	temp.id = "middleLeftControl";
	if (!temp.document) temp.document = this;
	middleLeftControl = temp;
	mx.binding.BindingManager.executeBindings(this, "middleLeftControl", middleLeftControl);
	return temp;
}

private function _CustomUITransformToolSkin_ResizeOperation8_i() : com.vstyran.transform.operations.ResizeOperation
{
	var temp : com.vstyran.transform.operations.ResizeOperation = new com.vstyran.transform.operations.ResizeOperation();
	temp.verticalEnabled = false;
	_CustomUITransformToolSkin_ResizeOperation8 = temp;
	mx.binding.BindingManager.executeBindings(this, "_CustomUITransformToolSkin_ResizeOperation8", _CustomUITransformToolSkin_ResizeOperation8);
	return temp;
}

private function _CustomUITransformToolSkin_Anchor1_i() : com.vstyran.transform.controls.Anchor
{
	var temp : com.vstyran.transform.controls.Anchor = new com.vstyran.transform.controls.Anchor();
	temp.verticalCenter = 0;
	temp.horizontalCenter = 0;
	temp.id = "centerAnchorControl";
	if (!temp.document) temp.document = this;
	centerAnchorControl = temp;
	mx.binding.BindingManager.executeBindings(this, "centerAnchorControl", centerAnchorControl);
	return temp;
}

private function _CustomUITransformToolSkin_Group2_i() : spark.components.Group
{
	var temp : spark.components.Group = new spark.components.Group();
	temp.mxmlContent = [_CustomUITransformToolSkin_Button1_i()];
	temp.id = "boundingGroup";
	if (!temp.document) temp.document = this;
	boundingGroup = temp;
	mx.binding.BindingManager.executeBindings(this, "boundingGroup", boundingGroup);
	return temp;
}

private function _CustomUITransformToolSkin_Button1_i() : spark.components.Button
{
	var temp : spark.components.Button = new spark.components.Button();
	temp.label = "delete";
	temp.right = -30;
	temp.top = -10;
	temp.setStyle("skinClass", examples.skins.DeleteButtonSkin);
	temp.id = "deleteButton";
	if (!temp.document) temp.document = this;
	deleteButton = temp;
	mx.binding.BindingManager.executeBindings(this, "deleteButton", deleteButton);
	return temp;
}


    //  binding mgmt
    private function _CustomUITransformToolSkin_bindingsSetup():Array
    {
        var result:Array = [];

        result[0] = new mx.binding.Binding(this,
            null,
            null,
            "_CustomUITransformToolSkin_CursorItem1.control"
            , "moveControl");

        result[1] = new mx.binding.Binding(this,
            null,
            null,
            "_CustomUITransformToolSkin_CursorItem2.control"
            , "topMiddleControl");

        result[2] = new mx.binding.Binding(this,
            null,
            null,
            "_CustomUITransformToolSkin_CursorItem2.cursor"
            , "resizeCursor");

        result[3] = new mx.binding.Binding(this,
            null,
            null,
            "_CustomUITransformToolSkin_CursorItem3.control"
            , "bottomMiddleControl");

        result[4] = new mx.binding.Binding(this,
            null,
            null,
            "_CustomUITransformToolSkin_CursorItem3.cursor"
            , "resizeCursor");

        result[5] = new mx.binding.Binding(this,
            null,
            null,
            "_CustomUITransformToolSkin_CursorItem4.control"
            , "middleLeftControl");

        result[6] = new mx.binding.Binding(this,
            null,
            null,
            "_CustomUITransformToolSkin_CursorItem4.cursor"
            , "resizeCursor");

        result[7] = new mx.binding.Binding(this,
            null,
            null,
            "_CustomUITransformToolSkin_CursorItem5.control"
            , "middleRightControl");

        result[8] = new mx.binding.Binding(this,
            null,
            null,
            "_CustomUITransformToolSkin_CursorItem5.cursor"
            , "resizeCursor");

        result[9] = new mx.binding.Binding(this,
            null,
            null,
            "_CustomUITransformToolSkin_CursorItem6.control"
            , "topLeftControl");

        result[10] = new mx.binding.Binding(this,
            null,
            null,
            "_CustomUITransformToolSkin_CursorItem6.cursor"
            , "resizeCursor");

        result[11] = new mx.binding.Binding(this,
            null,
            null,
            "_CustomUITransformToolSkin_CursorItem7.control"
            , "bottomRightControl");

        result[12] = new mx.binding.Binding(this,
            null,
            null,
            "_CustomUITransformToolSkin_CursorItem7.cursor"
            , "resizeCursor");

        result[13] = new mx.binding.Binding(this,
            null,
            null,
            "_CustomUITransformToolSkin_CursorItem8.control"
            , "topRightControl");

        result[14] = new mx.binding.Binding(this,
            null,
            null,
            "_CustomUITransformToolSkin_CursorItem8.cursor"
            , "resizeCursor");

        result[15] = new mx.binding.Binding(this,
            null,
            null,
            "_CustomUITransformToolSkin_CursorItem9.control"
            , "bottomLeftControl");

        result[16] = new mx.binding.Binding(this,
            null,
            null,
            "_CustomUITransformToolSkin_CursorItem9.cursor"
            , "resizeCursor");

        result[17] = new mx.binding.Binding(this,
            null,
            null,
            "_CustomUITransformToolSkin_CursorItem10.control"
            , "rotateControl");

        result[18] = new mx.binding.Binding(this,
            null,
            null,
            "rotateControl.anchor"
            , "centerAnchorControl");

        result[19] = new mx.binding.Binding(this,
            null,
            null,
            "topLeftControl.anchor"
            , "bottomRightControl");

        result[20] = new mx.binding.Binding(this,
            function():flash.geom.Point
            {

                return (new Point(1, 1));
            },
            null,
            "_CustomUITransformToolSkin_ResizeOperation1.anchor"
            );

        result[21] = new mx.binding.Binding(this,
            null,
            null,
            "topMiddleControl.anchor"
            , "bottomMiddleControl");

        result[22] = new mx.binding.Binding(this,
            function():flash.geom.Point
            {

                return (new Point(0.5, 1));
            },
            null,
            "_CustomUITransformToolSkin_ResizeOperation2.anchor"
            );

        result[23] = new mx.binding.Binding(this,
            null,
            null,
            "topRightControl.anchor"
            , "bottomLeftControl");

        result[24] = new mx.binding.Binding(this,
            function():flash.geom.Point
            {

                return (new Point(0, 1));
            },
            null,
            "_CustomUITransformToolSkin_ResizeOperation3.anchor"
            );

        result[25] = new mx.binding.Binding(this,
            null,
            null,
            "middleRightControl.anchor"
            , "middleLeftControl");

        result[26] = new mx.binding.Binding(this,
            function():flash.geom.Point
            {

                return (new Point(0, 0.5));
            },
            null,
            "_CustomUITransformToolSkin_ResizeOperation4.anchor"
            );

        result[27] = new mx.binding.Binding(this,
            null,
            null,
            "bottomRightControl.anchor"
            , "topLeftControl");

        result[28] = new mx.binding.Binding(this,
            function():flash.geom.Point
            {

                return (new Point(0, 0));
            },
            null,
            "_CustomUITransformToolSkin_ResizeOperation5.anchor"
            );

        result[29] = new mx.binding.Binding(this,
            null,
            null,
            "bottomMiddleControl.anchor"
            , "topMiddleControl");

        result[30] = new mx.binding.Binding(this,
            function():flash.geom.Point
            {

                return (new Point(0.5, 0));
            },
            null,
            "_CustomUITransformToolSkin_ResizeOperation6.anchor"
            );

        result[31] = new mx.binding.Binding(this,
            null,
            null,
            "bottomLeftControl.anchor"
            , "topRightControl");

        result[32] = new mx.binding.Binding(this,
            function():flash.geom.Point
            {

                return (new Point(1, 0));
            },
            null,
            "_CustomUITransformToolSkin_ResizeOperation7.anchor"
            );

        result[33] = new mx.binding.Binding(this,
            null,
            null,
            "middleLeftControl.anchor"
            , "middleRightControl");

        result[34] = new mx.binding.Binding(this,
            function():flash.geom.Point
            {

                return (new Point(1, 0.5));
            },
            null,
            "_CustomUITransformToolSkin_ResizeOperation8.anchor"
            );

        result[35] = new mx.binding.Binding(this,
            function():Boolean
            {

                return (!rotateControl.controlActivated);
            },
            null,
            "boundingGroup.visible"
            );


        return result;
    }


    /**
     * @private
     **/
    public static function set watcherSetupUtil(watcherSetupUtil:IWatcherSetupUtil2):void
    {
        (CustomUITransformToolSkin)._watcherSetupUtil = watcherSetupUtil;
    }

    private static var _watcherSetupUtil:IWatcherSetupUtil2;



    //  embed carrier vars
    //  end embed carrier vars

    //  binding management vars
    /**
     * @private
     **/
    mx_internal var _bindings : Array = [];
    /**
     * @private
     **/
    mx_internal var _watchers : Array = [];
    /**
     * @private
     **/
    mx_internal var _bindingsByDestination : Object = {};
    /**
     * @private
     **/
    mx_internal var _bindingsBeginWithWord : Object = {};

//  end class def
}

//  end package def
}
