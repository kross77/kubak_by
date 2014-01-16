






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
public class _SwizChainingDemoWatcherSetupUtil
    implements mx.binding.IWatcherSetupUtil2
{
    public function _SwizChainingDemoWatcherSetupUtil()
    {
        super();
    }

    public static function init(fbs:IFlexModuleFactory):void
    {
        import SwizChainingDemo;
        (SwizChainingDemo).watcherSetupUtil = new _SwizChainingDemoWatcherSetupUtil();
    }

    public function setup(target:Object,
                          propertyGetter:Function,
                          staticPropertyGetter:Function,
                          bindings:Array,
                          watchers:Array):void
    {
        import org.swizframework.core.SwizConfig;
        import mx.core.IFlexModuleFactory;
        import mx.binding.BindingManager;
        import mx.core.DeferredInstanceFromClass;
        import flash.events.ErrorEvent;
        import __AS3__.vec.Vector;
        import mx.core.IDeferredInstance;
        import mx.binding.IBindingClient;
        import mx.managers.ISystemManager;
        import org.swizframework.utils.logging.SwizTraceTarget;
        import mx.core.IPropertyChangeNotifier;
        import flash.events.IEventDispatcher;
        import modules.imgeditor.view.TransformToolView;
        import org.swizframework.chainingdemo.config.Beans;
        import mx.core.ClassFactory;
        import org.swizframework.core.mxml.Swiz;
        import mx.core.IFactory;
        import mx.core.mx_internal;
        import mx.core.DeferredInstanceFromFunction;
        import mx.events.FlexEvent;
        import spark.components.Application;
        import flash.events.EventDispatcher;
        import spark.layouts.HorizontalLayout;
        import flash.events.Event;


    }
}

}
