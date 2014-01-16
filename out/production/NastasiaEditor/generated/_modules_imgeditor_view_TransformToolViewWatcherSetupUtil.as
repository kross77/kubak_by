






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
public class _modules_imgeditor_view_TransformToolViewWatcherSetupUtil
    implements mx.binding.IWatcherSetupUtil2
{
    public function _modules_imgeditor_view_TransformToolViewWatcherSetupUtil()
    {
        super();
    }

    public static function init(fbs:IFlexModuleFactory):void
    {
        import modules.imgeditor.view.TransformToolView;
        (modules.imgeditor.view.TransformToolView).watcherSetupUtil = new _modules_imgeditor_view_TransformToolViewWatcherSetupUtil();
    }

    public function setup(target:Object,
                          propertyGetter:Function,
                          staticPropertyGetter:Function,
                          bindings:Array,
                          watchers:Array):void
    {
        import spark.primitives.Rect;
        import mx.core.DeferredInstanceFromClass;
        import mx.collections.ArrayCollection;
        import modules.imgeditor.model.LayersModel;
        import modules.imgeditor.view.components.BitmapLayerDisplObj;
        import __AS3__.vec.Vector;
        import flash.events.MouseEvent;
        import mx.binding.IBindingClient;
        import mx.core.ClassFactory;
        import mx.core.IFactory;
        import mx.core.DeferredInstanceFromFunction;
        import com.vstyran.transform.model.Guideline;
        import modules.imgeditor.view.components.LayersList;
        import spark.components.Image;
        import flash.events.EventDispatcher;
        import spark.components.Button;
        import mx.controls.Alert;
        import mx.core.IFlexModuleFactory;
        import mx.binding.BindingManager;
        import examples.components.UIGuideTransformTool;
        import mx.graphics.SolidColor;
        import modules.imgeditor.event.ImageEditorEvent;
        import spark.components.Group;
        import examples.components.GuideContainer;
        import mx.core.IDeferredInstance;
        import modules.imgeditor.event.renderer.LayerItemRendererEvent;
        import modules.imgeditor.event.ToolsEvent;
        import mx.core.IPropertyChangeNotifier;
        import com.vstyran.transform.events.GuidelineEvent;
        import flash.events.IEventDispatcher;
        import mx.core.UIComponentGlobals;
        import mx.graphics.SolidColorStroke;
        import examples.delegate.GuideLinesDelegate;
        import mx.core.mx_internal;
        import mx.events.FlexEvent;
        import mx.events.DynamicEvent;
        import modules.imgeditor.view.components.ILayerDisplObj;
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
