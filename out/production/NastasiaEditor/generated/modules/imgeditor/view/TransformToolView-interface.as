
package modules.imgeditor.view
{
import examples.components.GuideContainer;
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
import modules.imgeditor.view.components.LayersList;
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
import spark.primitives.Rect;
import spark.primitives.Rect;
import mx.graphics.SolidColorStroke;
import mx.graphics.SolidColor;
import spark.components.Group;

public class TransformToolView extends spark.components.Group
{
	public function TransformToolView() {}

	[Bindable]
	public var designArea : spark.components.Group;
	[Bindable]
	public var border : spark.primitives.Rect;
	[Bindable]
	public var imageGroup : spark.components.Group;
	[Bindable]
	public var guideContainer : examples.components.GuideContainer;
	[Bindable]
	public var addImageButton : spark.components.Button;
	[Bindable]
	public var layerList : modules.imgeditor.view.components.LayersList;

	mx_internal var _bindings : Array;
	mx_internal var _watchers : Array;
	mx_internal var _bindingsByDestination : Object;
	mx_internal var _bindingsBeginWithWord : Object;

include "D:/a.krasovsky/Dropbox/projects/my/site/NastasiaEditor/src/modules/imgeditor/view/TransformToolView.mxml:11,156";

}}
