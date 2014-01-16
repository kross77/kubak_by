
package examples.skins
{
import com.vstyran.transform.controls.Anchor;
import com.vstyran.transform.controls.Control;
import com.vstyran.transform.managers.vector.CursorManager;
import com.vstyran.transform.managers.vector.cursors.ResizeCursor;
import flash.accessibility.*;
import flash.debugger.*;
import flash.display.*;
import flash.errors.*;
import flash.events.*;
import flash.external.*;
import flash.geom.*;
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
import mx.core.ClassFactory;
import mx.core.DeferredInstanceFromClass;
import mx.core.DeferredInstanceFromFunction;
import mx.core.IDeferredInstance;
import mx.core.IFactory;
import mx.core.IFlexModuleFactory;
import mx.core.IPropertyChangeNotifier;
import mx.core.mx_internal;
import mx.filters.*;
import mx.styles.*;
import spark.components.Button;
import spark.components.Group;
import spark.components.supportClasses.Skin;
import spark.primitives.BitmapImage;
import spark.primitives.Rect;
import spark.primitives.Line;
import com.vstyran.transform.operations.segments;
import com.vstyran.transform.managers.vector.CursorItem;
import mx.graphics.SolidColor;
import com.vstyran.transform.controls.Hint;
import com.vstyran.transform.operations.MoveOperation;
import com.vstyran.transform.managers.vector.hint;
import com.vstyran.transform.operations.RotateOperation;
import com.vstyran.transform.managers.vector.cursors.RotateCursor;
import com.vstyran.transform.managers.vector.cursors.MoveCursor;
import mx.graphics.SolidColorStroke;
import com.vstyran.transform.model.SegmentData;
import spark.components.supportClasses.Skin;
import mx.states.State;
import com.vstyran.transform.operations.ResizeOperation;

[HostComponent("examples.view.CustomUITransformTool")]
public class CustomUITransformToolSkin extends spark.components.supportClasses.Skin
{
	public function CustomUITransformToolSkin() {}

	[Bindable]
	public var resizeCursor : com.vstyran.transform.managers.vector.cursors.ResizeCursor;
	[Bindable]
	public var toolCursorManager : com.vstyran.transform.managers.vector.CursorManager;
	[Bindable]
	public var moveControl : com.vstyran.transform.controls.Control;
	[Bindable]
	public var preview : spark.primitives.BitmapImage;
	[Bindable]
	public var previewCover : spark.components.Group;
	[Bindable]
	public var rotateControl : com.vstyran.transform.controls.Control;
	[Bindable]
	public var topLeftControl : com.vstyran.transform.controls.Control;
	[Bindable]
	public var topMiddleControl : com.vstyran.transform.controls.Control;
	[Bindable]
	public var topRightControl : com.vstyran.transform.controls.Control;
	[Bindable]
	public var middleRightControl : com.vstyran.transform.controls.Control;
	[Bindable]
	public var bottomRightControl : com.vstyran.transform.controls.Control;
	[Bindable]
	public var bottomMiddleControl : com.vstyran.transform.controls.Control;
	[Bindable]
	public var bottomLeftControl : com.vstyran.transform.controls.Control;
	[Bindable]
	public var middleLeftControl : com.vstyran.transform.controls.Control;
	[Bindable]
	public var centerAnchorControl : com.vstyran.transform.controls.Anchor;
	[Bindable]
	public var boundingGroup : spark.components.Group;
	[Bindable]
	public var deleteButton : spark.components.Button;

	mx_internal var _bindings : Array;
	mx_internal var _watchers : Array;
	mx_internal var _bindingsByDestination : Object;
	mx_internal var _bindingsBeginWithWord : Object;


}}
