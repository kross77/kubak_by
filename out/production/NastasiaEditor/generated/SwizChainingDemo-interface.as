
package 
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
import modules.imgeditor.view.TransformToolView;
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
import org.swizframework.core.SwizConfig;
import org.swizframework.core.mxml.Swiz;
import org.swizframework.utils.logging.SwizTraceTarget;
import spark.components.Application;
import org.swizframework.chainingdemo.config.Beans;
import spark.components.Application;
import spark.layouts.HorizontalLayout;

public class SwizChainingDemo extends spark.components.Application
{
	public function SwizChainingDemo() {}

	[Bindable]
	public var mySwiz : org.swizframework.core.mxml.Swiz;
	[Bindable]
	public var mySwizConfig : org.swizframework.core.SwizConfig;
	[Bindable]
	public var myTraceTarget : org.swizframework.utils.logging.SwizTraceTarget;
	[Bindable]
	public var transformToolView : modules.imgeditor.view.TransformToolView;

	mx_internal var _bindings : Array;
	mx_internal var _watchers : Array;
	mx_internal var _bindingsByDestination : Object;
	mx_internal var _bindingsBeginWithWord : Object;

include "D:/a.krasovsky/Dropbox/projects/my/site/NastasiaEditor/src/SwizChainingDemo.mxml:36,63";

}}
