
package org.swizframework.chainingdemo.config
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
import modules.imgeditor.controller.LayerManagerController;
import modules.imgeditor.controller.SelectFileController;
import modules.imgeditor.model.LayersModel;
import modules.imgeditor.service.LayerManagerFactory;
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
import org.swizframework.core.BeanProvider;
import org.swizframework.core.BeanProvider;

public class Beans extends org.swizframework.core.BeanProvider
{
	public function Beans() {}

	[Bindable]
	public var imageEditorController : modules.imgeditor.controller.SelectFileController;
	[Bindable]
	public var layerManagerController : modules.imgeditor.controller.LayerManagerController;
	[Bindable]
	public var factory : modules.imgeditor.service.LayerManagerFactory;
	[Bindable]
	public var layersModel : modules.imgeditor.model.LayersModel;

	mx_internal var _bindings : Array;
	mx_internal var _watchers : Array;
	mx_internal var _bindingsByDestination : Object;
	mx_internal var _bindingsBeginWithWord : Object;


}}
