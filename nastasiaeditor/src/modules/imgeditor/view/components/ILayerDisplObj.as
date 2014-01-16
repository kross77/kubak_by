/**
 * Created by Admin on 09.01.14.
 */
package modules.imgeditor.view.components {
import flash.events.IEventDispatcher;

import modules.imgeditor.model.vo.LayerVO;

import mx.core.IUIComponent;
import mx.core.IVisualElement;

import org.casalib.events.IRemovableEventDispatcher;

public interface ILayerDisplObj extends IUIComponent, IVisualElement{
    function get layerVO():LayerVO
}
}
