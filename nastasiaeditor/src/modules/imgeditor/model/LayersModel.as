/**
 * Created by Admin on 09.01.14.
 */
package modules.imgeditor.model {
import flash.events.Event;

import modules.imgeditor.event.LayerManagerEvent;

import modules.imgeditor.event.LayerManagerEvent;
import modules.imgeditor.event.ToolsEvent;
import modules.imgeditor.model.vo.*;

import flash.events.IEventDispatcher;
import flash.utils.Dictionary;

import modules.imgeditor.view.components.ILayerDisplObj;

import mx.collections.ArrayCollection;
import mx.events.CollectionEvent;

public class LayersModel {
    private var _layers:Dictionary;
    [Bindable]
    public var layersList:ArrayCollection;

    [Dispatcher]
    public var dispatcher : IEventDispatcher;

    public function LayersModel() {
        _layers = new Dictionary();
    }

    [Init]
    private function init():void
    {

    }

    [Destroy]
    private function destroy():void
    {
        _layers = null;
    }

    public function addLayer(layer:ILayerDisplObj):void
    {
        _layers[layer.layerVO] = layer;
        addLayerToList(layer.layerVO);
        //dispatcher.dispatchEvent(new ToolsEvent(ToolsEvent.SELECTION_TOOL, layer));
    }

    private function addLayerToList(layerVO:LayerVO):void {
        if(layersList == null){
            layersList = new ArrayCollection();
            layersList.addEventListener(CollectionEvent.COLLECTION_CHANGE, layersList_collectionChangeHandler)
        }
        layersList.addItemAt(layerVO, 0);
    }

    public function removeLayer(layerVO:LayerVO):void
    {
        delete _layers[layerVO];
    }


    public function get layers():Dictionary {
        return _layers;
    }

    private function layersList_collectionChangeHandler(event:CollectionEvent):void {
        trace(event);
        var layerVO:LayerVO = event.items[0];
        switch (event.kind){
            case "add":
                trace("add layer "+layerVO+" to location: "+event.location);
                layerVO.bitmapIndex = event.location;
                dispatcher.dispatchEvent(new LayerManagerEvent(LayerManagerEvent.CREATE_LAYER, layerVO));
                break;
            case "remove":
                trace("remove layer "+layerVO+" from location: "+event.location);
                dispatcher.dispatchEvent(new LayerManagerEvent(LayerManagerEvent.REMOVE_LAYER, layerVO));
                break;
        }

    }
}
}
