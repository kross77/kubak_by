






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
public class _examples_TransformToolSample11WatcherSetupUtil
    implements mx.binding.IWatcherSetupUtil2
{
    public function _examples_TransformToolSample11WatcherSetupUtil()
    {
        super();
    }

    public static function init(fbs:IFlexModuleFactory):void
    {
        import examples.TransformToolSample11;
        (examples.TransformToolSample11).watcherSetupUtil = new _examples_TransformToolSample11WatcherSetupUtil();
    }

    public function setup(target:Object,
                          propertyGetter:Function,
                          staticPropertyGetter:Function,
                          bindings:Array,
                          watchers:Array):void
    {
        import spark.primitives.Rect;
        import com.vstyran.transform.consts.TransformationType;
        import mx.core.DeferredInstanceFromClass;
        import examples.skins.CustomUITransformToolSkin;
        import mx.collections.ArrayCollection;
        import __AS3__.vec.Vector;
        import flash.events.MouseEvent;
        import mx.binding.IBindingClient;
        import com.vstyran.transform.utils.DataUtil;
        import mx.core.ClassFactory;
        import mx.core.IFactory;
        import mx.core.DeferredInstanceFromFunction;
        import spark.components.Application;
        import examples.view.CustomUITransformTool;
        import com.vstyran.transform.model.Guideline;
        import spark.components.Image;
        import flash.events.EventDispatcher;
        import mx.core.IFlexModuleFactory;
        import mx.binding.BindingManager;
        import com.vstyran.transform.consts.GuidelineType;
        import mx.graphics.SolidColor;
        import spark.components.Group;
        import examples.components.GuideContainer;
        import mx.core.IDeferredInstance;
        import mx.core.IPropertyChangeNotifier;
        import com.vstyran.transform.events.GuidelineEvent;
        import flash.events.IEventDispatcher;
        import mx.graphics.SolidColorStroke;
        import mx.core.IVisualElement;
        import mx.core.mx_internal;
        import com.vstyran.transform.model.Bounds;
        import mx.events.FlexEvent;
        import flash.events.Event;

        // writeWatcher id=0 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher shouldWriteChildren=true
        watchers[0] = new mx.binding.PropertyWatcher("itemsCollection",
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

        // writeWatcher id=1 shouldWriteSelf=true class=flex2.compiler.as3.binding.ArrayElementWatcher shouldWriteChildren=true
        watchers[1] = new mx.binding.ArrayElementWatcher(target,
                                                                     function():* { return 0; },
                                                                     [bindings[0]]);


        // writeWatcherBottom id=0 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher
        watchers[0].updateParent(target);

 





        // writeWatcherBottom id=1 shouldWriteSelf=true class=flex2.compiler.as3.binding.ArrayElementWatcher
        // writeEvaluationWatcherPart 1 0 arrayWatcher
        watchers[1].arrayWatcher = watchers[0];
         watchers[0].addChild(watchers[1]);

 





    }
}

}
