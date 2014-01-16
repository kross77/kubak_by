






package
{
import mx.core.IFlexModuleFactory;
import mx.binding.ArrayElementWatcher;
import mx.binding.FunctionReturnWatcher;
import mx.binding.IWatcherSetupUtil2;
import mx.binding.PropertyWatcher;
import mx.binding.RepeaterComponentWatcher;
import mx.binding.RepeaterItemWatcher;
import mx.binding.StaticPropertyWatcher;
import mx.binding.XMLWatcher;
import mx.binding.Watcher;

[ExcludeClass]
public class _modules_imgeditor_view_ImageEditorViewWatcherSetupUtil
    implements mx.binding.IWatcherSetupUtil2
{
    public function _modules_imgeditor_view_ImageEditorViewWatcherSetupUtil()
    {
        super();
    }

    public static function init(fbs:IFlexModuleFactory):void
    {
        import modules.imgeditor.view.ImageEditorView;
        (modules.imgeditor.view.ImageEditorView).watcherSetupUtil = new _modules_imgeditor_view_ImageEditorViewWatcherSetupUtil();
    }

    public function setup(target:Object,
                          propertyGetter:Function,
                          staticPropertyGetter:Function,
                          bindings:Array,
                          watchers:Array):void
    {
        import mx.core.DeferredInstanceFromClass;
        import modules.imgeditor.model.LayersModel;
        import modules.imgeditor.view.components.BitmapLayerDisplObj;
        import __AS3__.vec.Vector;
        import mx.binding.IBindingClient;
        import flash.events.MouseEvent;
        import mx.core.ClassFactory;
        import mx.core.IFactory;
        import mx.core.DeferredInstanceFromFunction;
        import spark.components.Application;
        import modules.imgeditor.view.components.LayersList;
        import flash.events.EventDispatcher;
        import modules.imgeditor.view.components.LayerManagerView;
        import spark.components.Button;
        import mx.core.IFlexModuleFactory;
        import mx.binding.BindingManager;
        import modules.imgeditor.event.ImageEditorEvent;
        import mx.core.IDeferredInstance;
        import spark.components.Group;
        import modules.imgeditor.event.renderer.LayerItemRendererEvent;
        import modules.imgeditor.event.ToolsEvent;
        import mx.core.IPropertyChangeNotifier;
        import flash.events.IEventDispatcher;
        import mx.core.mx_internal;
        import modules.imgeditor.view.components.ILayerDisplObj;
        import spark.components.VGroup;
        import mx.events.ListEvent;
        import flash.events.Event;

        // writeWatcher id=0 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher shouldWriteChildren=true
        watchers[0] = new mx.binding.PropertyWatcher("layersModel",
                                                                             {
                propertyChange: true
            }
,
                                                                         // writeWatcherListeners id=0 size=1
        [
        bindings[0]
        ]
,
                                                                 propertyGetter
);

        // writeWatcher id=1 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher shouldWriteChildren=true
        watchers[1] = new mx.binding.PropertyWatcher("layersList",
                                                                             {
                propertyChange: true
            }
,
                                                                         // writeWatcherListeners id=1 size=1
        [
        bindings[0]
        ]
,
                                                                 null
);


        // writeWatcherBottom id=0 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher
        watchers[0].updateParent(target);

 





        // writeWatcherBottom id=1 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher
        watchers[0].addChild(watchers[1]);

 





    }
}

}
