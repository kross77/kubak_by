
package examples
{
import examples.components.GuideContainer;
import examples.view.CustomUITransformTool;
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
import mx.collections.ArrayCollection;
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
import spark.components.Application;
import spark.components.Group;
import spark.components.Image;
import spark.primitives.Rect;
import spark.primitives.Rect;
import mx.graphics.SolidColorStroke;
import examples.view.bounds;
import com.vstyran.transform.model.Bounds;
import spark.components.Application;
import mx.graphics.SolidColor;

public class TransformToolSample11 extends spark.components.Application
{
	public function TransformToolSample11() {}

	[Bindable]
	public var itemsCollection : mx.collections.ArrayCollection;
	[Bindable]
	public var imageTarget1 : spark.components.Image;
	[Bindable]
	public var imageTarget2 : spark.components.Image;
	[Bindable]
	public var imageTarget3 : spark.components.Image;
	[Bindable]
	public var designArea : spark.components.Group;
	[Bindable]
	public var border : spark.primitives.Rect;
	[Bindable]
	public var imageGroup : spark.components.Group;
	[Bindable]
	public var tool : examples.view.CustomUITransformTool;
	[Bindable]
	public var guideContainer : examples.components.GuideContainer;

	mx_internal var _bindings : Array;
	mx_internal var _watchers : Array;
	mx_internal var _bindingsByDestination : Object;
	mx_internal var _bindingsBeginWithWord : Object;

include "D:/a.krasovsky/Dropbox/projects/my/site/NastasiaEditor/src/examples/TransformToolSample11.mxml:11,118";

}}
