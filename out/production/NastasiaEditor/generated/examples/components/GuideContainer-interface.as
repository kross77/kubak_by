
package examples.components
{
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
import spark.components.Group;
import spark.primitives.Line;
import mx.graphics.SolidColorStroke;
import spark.components.Group;

public class GuideContainer extends spark.components.Group
{
	public function GuideContainer() {}

	[Bindable]
	public var passiveGuideGroup : spark.components.Group;
	[Bindable]
	public var vGuide : spark.primitives.Line;
	[Bindable]
	public var hGuide : spark.primitives.Line;

	mx_internal var _bindings : Array;
	mx_internal var _watchers : Array;
	mx_internal var _bindingsByDestination : Object;
	mx_internal var _bindingsBeginWithWord : Object;

include "D:/a.krasovsky/Dropbox/projects/my/site/NastasiaEditor/src/examples/components/GuideContainer.mxml:8,58";

}}
