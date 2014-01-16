






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
public class _modules_imgeditor_view_itemrenderers_LayerItemRendererWatcherSetupUtil
    implements mx.binding.IWatcherSetupUtil2
{
    public function _modules_imgeditor_view_itemrenderers_LayerItemRendererWatcherSetupUtil()
    {
        super();
    }

    public static function init(fbs:IFlexModuleFactory):void
    {
        import modules.imgeditor.view.itemrenderers.LayerItemRenderer;
        (modules.imgeditor.view.itemrenderers.LayerItemRenderer).watcherSetupUtil = new _modules_imgeditor_view_itemrenderers_LayerItemRendererWatcherSetupUtil();
    }

    public function setup(target:Object,
                          propertyGetter:Function,
                          staticPropertyGetter:Function,
                          bindings:Array,
                          watchers:Array):void
    {
        import mx.core.IFlexModuleFactory;
        import mx.binding.BindingManager;
        import mx.core.DeferredInstanceFromClass;
        import mx.controls.listClasses.IListItemRenderer;
        import __AS3__.vec.Vector;
        import mx.core.IDeferredInstance;
        import flash.events.MouseEvent;
        import mx.binding.IBindingClient;
        import modules.imgeditor.event.renderer.LayerItemRendererEvent;
        import mx.core.IPropertyChangeNotifier;
        import flash.events.IEventDispatcher;
        import mx.core.ClassFactory;
        import mx.core.IFactory;
        import modules.imgeditor.model.vo.LayerVO;
        import mx.core.mx_internal;
        import mx.core.DeferredInstanceFromFunction;
        import spark.components.supportClasses.ItemRenderer;
        import flash.events.EventDispatcher;
        import flash.events.Event;
        import spark.components.Button;

        // writeWatcher id=0 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher shouldWriteChildren=true
        watchers[0] = new mx.binding.PropertyWatcher("data",
                                                                             {
                dataChange: true
            }
,
                                                                         // writeWatcherListeners id=0 size=1
        [
        bindings[0]
        ]
,
                                                                 propertyGetter
);

        // writeWatcher id=1 shouldWriteSelf=false class=flex2.compiler.as3.binding.PropertyWatcher shouldWriteChildren=true


        // writeWatcherBottom id=0 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher
        watchers[0].updateParent(target);

 





        // writeWatcherBottom id=1 shouldWriteSelf=false class=flex2.compiler.as3.binding.PropertyWatcher

 





    }
}

}
