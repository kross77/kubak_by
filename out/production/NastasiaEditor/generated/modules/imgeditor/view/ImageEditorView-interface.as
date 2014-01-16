
package modules.imgeditor.view
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
import modules.imgeditor.view.components.LayerManagerView;
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
import spark.components.Application;
import spark.components.Button;
import spark.components.Group;
import spark.components.Application;
import spark.components.VGroup;

public class ImageEditorView extends spark.components.Application
{
	public function ImageEditorView() {}

	[Bindable]
	public var layerManagerView : modules.imgeditor.view.components.LayerManagerView;
	[Bindable]
	public var addImageButton : spark.components.Button;
	[Bindable]
	public var layerList : modules.imgeditor.view.components.LayersList;
	[Bindable]
	public var toolsContainerGroup : spark.components.Group;

	mx_internal var _bindings : Array;
	mx_internal var _watchers : Array;
	mx_internal var _bindingsByDestination : Object;
	mx_internal var _bindingsBeginWithWord : Object;

include "D:/a.krasovsky/Dropbox/projects/my/site/NastasiaEditor/src/modules/imgeditor/view/ImageEditorView.mxml:38,72";

}}
