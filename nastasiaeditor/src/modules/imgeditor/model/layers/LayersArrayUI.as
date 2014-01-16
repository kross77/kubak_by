/**
 * Created by Admin on 11.01.14.
 */
package modules.imgeditor.model.layers {
import flash.display.Sprite;

import modules.imgeditor.model.vo.LayerVO;

public class LayersArrayUI implements ILayerArrayUI
{
    private var layersArr:Array = [];
    private var _layers:Vector.<LayerVO> = new <LayerVO>[];
    private var _container:Sprite;

    public function LayersArrayUI(container:Sprite) {
        _container = container;

    }

    [Bindable]
    public function get layers():Vector.<LayerVO> {
        return _layers;
    }

    public function addLayer(layer:LayerVO):void {
    }

    public function removeLayer(layer:LayerVO):void {
    }

    public function moveLayer(layer:LayerVO, index:int):void {
    }
}
}
