
package modules.imgeditor.view.itemrenderers
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
import mx.controls.listClasses.IListItemRenderer;
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
import spark.components.supportClasses.ItemRenderer;
import spark.components.supportClasses.ItemRenderer;

public class LayerItemRenderer extends spark.components.supportClasses.ItemRenderer
 implements mx.controls.listClasses.IListItemRenderer {
	public function LayerItemRenderer() {}

	[Bindable]
	public var selectButton : spark.components.Button;

	mx_internal var _bindings : Array;
	mx_internal var _watchers : Array;
	mx_internal var _bindingsByDestination : Object;
	mx_internal var _bindingsBeginWithWord : Object;

include "D:/a.krasovsky/Dropbox/projects/my/site/NastasiaEditor/src/modules/imgeditor/view/itemrenderers/LayerItemRenderer.mxml:9,19";

}}
