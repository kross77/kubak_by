






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
public class _examples_skins_CustomUITransformToolSkinWatcherSetupUtil
    implements mx.binding.IWatcherSetupUtil2
{
    public function _examples_skins_CustomUITransformToolSkinWatcherSetupUtil()
    {
        super();
    }

    public static function init(fbs:IFlexModuleFactory):void
    {
        import examples.skins.CustomUITransformToolSkin;
        (examples.skins.CustomUITransformToolSkin).watcherSetupUtil = new _examples_skins_CustomUITransformToolSkinWatcherSetupUtil();
    }

    public function setup(target:Object,
                          propertyGetter:Function,
                          staticPropertyGetter:Function,
                          bindings:Array,
                          watchers:Array):void
    {
        import spark.primitives.Rect;
        import spark.primitives.Line;
        import mx.core.DeferredInstanceFromClass;
        import com.vstyran.transform.managers.vector.CursorItem;
        import __AS3__.vec.Vector;
        import com.vstyran.transform.controls.Anchor;
        import com.vstyran.transform.operations.MoveOperation;
        import mx.binding.IBindingClient;
        import com.vstyran.transform.managers.vector.CursorManager;
        import com.vstyran.transform.operations.RotateOperation;
        import mx.core.ClassFactory;
        import mx.core.IFactory;
        import spark.components.supportClasses.Skin;
        import mx.core.DeferredInstanceFromFunction;
        import com.vstyran.transform.managers.vector.cursors.ResizeCursor;
        import flash.events.EventDispatcher;
        import com.vstyran.transform.skins.MoveControlSkin;
        import mx.states.State;
        import examples.skins.DeleteButtonSkin;
        import flash.geom.Point;
        import com.vstyran.transform.operations.ResizeOperation;
        import spark.components.Button;
        import mx.core.IFlexModuleFactory;
        import spark.primitives.BitmapImage;
        import mx.binding.BindingManager;
        import mx.graphics.SolidColor;
        import spark.components.Group;
        import mx.core.IDeferredInstance;
        import com.vstyran.transform.controls.Hint;
        import com.vstyran.transform.managers.vector.cursors.RotateCursor;
        import mx.core.IPropertyChangeNotifier;
        import com.vstyran.transform.managers.vector.cursors.MoveCursor;
        import flash.events.IEventDispatcher;
        import mx.core.IStateClient2;
        import mx.graphics.SolidColorStroke;
        import flash.display.DisplayObject;
        import mx.core.IVisualElement;
        import com.vstyran.transform.model.SegmentData;
        import com.vstyran.transform.controls.Control;
        import mx.core.mx_internal;
        import flash.events.Event;

        // writeWatcher id=6 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher shouldWriteChildren=true
        watchers[6] = new mx.binding.PropertyWatcher("topLeftControl",
                                                                             {
                propertyChange: true
            }
,
                                                                         // writeWatcherListeners id=6 size=2
        [
        bindings[9],
        bindings[27]
        ]
,
                                                                 propertyGetter
);

        // writeWatcher id=1 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher shouldWriteChildren=true
        watchers[1] = new mx.binding.PropertyWatcher("topMiddleControl",
                                                                             {
                propertyChange: true
            }
,
                                                                         // writeWatcherListeners id=1 size=2
        [
        bindings[1],
        bindings[29]
        ]
,
                                                                 propertyGetter
);

        // writeWatcher id=5 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher shouldWriteChildren=true
        watchers[5] = new mx.binding.PropertyWatcher("middleRightControl",
                                                                             {
                propertyChange: true
            }
,
                                                                         // writeWatcherListeners id=5 size=2
        [
        bindings[7],
        bindings[33]
        ]
,
                                                                 propertyGetter
);

        // writeWatcher id=8 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher shouldWriteChildren=true
        watchers[8] = new mx.binding.PropertyWatcher("topRightControl",
                                                                             {
                propertyChange: true
            }
,
                                                                         // writeWatcherListeners id=8 size=2
        [
        bindings[13],
        bindings[31]
        ]
,
                                                                 propertyGetter
);

        // writeWatcher id=4 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher shouldWriteChildren=true
        watchers[4] = new mx.binding.PropertyWatcher("middleLeftControl",
                                                                             {
                propertyChange: true
            }
,
                                                                         // writeWatcherListeners id=4 size=2
        [
        bindings[5],
        bindings[25]
        ]
,
                                                                 propertyGetter
);

        // writeWatcher id=2 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher shouldWriteChildren=true
        watchers[2] = new mx.binding.PropertyWatcher("resizeCursor",
                                                                             {
                propertyChange: true
            }
,
                                                                         // writeWatcherListeners id=2 size=8
        [
        bindings[2],
        bindings[4],
        bindings[6],
        bindings[8],
        bindings[10],
        bindings[12],
        bindings[14],
        bindings[16]
        ]
,
                                                                 propertyGetter
);

        // writeWatcher id=9 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher shouldWriteChildren=true
        watchers[9] = new mx.binding.PropertyWatcher("bottomLeftControl",
                                                                             {
                propertyChange: true
            }
,
                                                                         // writeWatcherListeners id=9 size=2
        [
        bindings[15],
        bindings[23]
        ]
,
                                                                 propertyGetter
);

        // writeWatcher id=3 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher shouldWriteChildren=true
        watchers[3] = new mx.binding.PropertyWatcher("bottomMiddleControl",
                                                                             {
                propertyChange: true
            }
,
                                                                         // writeWatcherListeners id=3 size=2
        [
        bindings[3],
        bindings[21]
        ]
,
                                                                 propertyGetter
);

        // writeWatcher id=0 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher shouldWriteChildren=true
        watchers[0] = new mx.binding.PropertyWatcher("moveControl",
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

        // writeWatcher id=10 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher shouldWriteChildren=true
        watchers[10] = new mx.binding.PropertyWatcher("rotateControl",
                                                                             {
                propertyChange: true
            }
,
                                                                         // writeWatcherListeners id=10 size=2
        [
        bindings[17],
        bindings[35]
        ]
,
                                                                 propertyGetter
);

        // writeWatcher id=12 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher shouldWriteChildren=true
        watchers[12] = new mx.binding.PropertyWatcher("controlActivated",
                                                                             {
                controlActivatedChanged: true
            }
,
                                                                         // writeWatcherListeners id=12 size=1
        [
        bindings[35]
        ]
,
                                                                 null
);

        // writeWatcher id=7 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher shouldWriteChildren=true
        watchers[7] = new mx.binding.PropertyWatcher("bottomRightControl",
                                                                             {
                propertyChange: true
            }
,
                                                                         // writeWatcherListeners id=7 size=2
        [
        bindings[11],
        bindings[19]
        ]
,
                                                                 propertyGetter
);

        // writeWatcher id=11 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher shouldWriteChildren=true
        watchers[11] = new mx.binding.PropertyWatcher("centerAnchorControl",
                                                                             {
                propertyChange: true
            }
,
                                                                         // writeWatcherListeners id=11 size=1
        [
        bindings[18]
        ]
,
                                                                 propertyGetter
);


        // writeWatcherBottom id=6 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher
        watchers[6].updateParent(target);

 





        // writeWatcherBottom id=1 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher
        watchers[1].updateParent(target);

 





        // writeWatcherBottom id=5 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher
        watchers[5].updateParent(target);

 





        // writeWatcherBottom id=8 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher
        watchers[8].updateParent(target);

 





        // writeWatcherBottom id=4 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher
        watchers[4].updateParent(target);

 





        // writeWatcherBottom id=2 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher
        watchers[2].updateParent(target);

 





        // writeWatcherBottom id=9 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher
        watchers[9].updateParent(target);

 





        // writeWatcherBottom id=3 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher
        watchers[3].updateParent(target);

 





        // writeWatcherBottom id=0 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher
        watchers[0].updateParent(target);

 





        // writeWatcherBottom id=10 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher
        watchers[10].updateParent(target);

 





        // writeWatcherBottom id=12 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher
        watchers[10].addChild(watchers[12]);

 





        // writeWatcherBottom id=7 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher
        watchers[7].updateParent(target);

 





        // writeWatcherBottom id=11 shouldWriteSelf=true class=flex2.compiler.as3.binding.PropertyWatcher
        watchers[11].updateParent(target);

 





    }
}

}
