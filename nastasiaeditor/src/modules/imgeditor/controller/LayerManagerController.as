/**
 * Created by Admin on 09.01.14.
 */
package modules.imgeditor.controller {
import by.kross77.select.FileSelector;
import by.kross77.select.event.SelectEvent;
import by.kross77.select.model.vo.SelectedFileVO;


import flash.display.Bitmap;
import flash.display.DisplayObject;

import modules.imgeditor.event.LayerManagerEvent;
import modules.imgeditor.model.vo.LayerVO;
import modules.imgeditor.model.LayersModel;
import modules.imgeditor.service.LayerManagerFactory;

import modules.imgeditor.view.TransformToolView;
import modules.imgeditor.view.components.ILayerDisplObj;
import modules.imgeditor.view.components.LayerDispObjType;

import mx.core.IUIComponent;

import org.casalib.util.AlignUtil;

import spark.components.Group;
import spark.components.Image;

public class LayerManagerController {
    public function LayerManagerController() {
    }

    private var _fileSelector:FileSelector = new FileSelector();
    private var _view:Group;
    [Inject]
    public var factory:LayerManagerFactory;

    [Inject]
    public var layersModel:LayersModel;

    [EventHandler( event="SelectEvent.FILE_LOADED" )]
    public function addImageHandler(event:SelectEvent):void
    {
        var selectedFileVO:SelectedFileVO = event.data as SelectedFileVO;
        var bitmap:Bitmap = selectedFileVO.loadedContent;
        var type:LayerDispObjType = LayerDispObjType(selectedFileVO.params["type"]);
        var layerVO:LayerVO = LayerVO.create(type, bitmap);
        var layer:ILayerDisplObj = factory.getLayer(layerVO);
        layersModel.addLayer(layer);
    }

    [EventHandler( event="LayerManagerEvent.CREATE_LAYER" )]
    public function createLayerHandler(event:LayerManagerEvent):void
    {
        var layerVO:LayerVO = event.data as LayerVO;
        var image:ILayerDisplObj = layerVO.layerObject;
        if(layerVO.inited == false){
            resizeImageToArea(image);
            layerVO.inited = true;
        }

        AlignUtil.alignMiddleCenter(image as DisplayObject, _view.getBounds(_view));

        var transformToolView:TransformToolView = _view as TransformToolView;
        if(transformToolView)
        {
            transformToolView.addItem(image, transformToolView.imageGroup.numChildren-layerVO.bitmapIndex);
        }


    }

    [EventHandler( event="LayerManagerEvent.REMOVE_LAYER" )]
    public function removeLayerHandler(event:LayerManagerEvent):void
    {
        var layerVO:LayerVO = event.data as LayerVO;
        var transformToolView:TransformToolView = _view as TransformToolView;
        if(transformToolView)
        {
            transformToolView.imageGroup.removeElement(layerVO.layerObject)
        }
        //_view.removeChild(layerVO.bitmap);

    }

    [EventHandler( event="LayerManagerEvent.SELECT_LAYER" )]
    public function selectLayerHandler(event:LayerManagerEvent):void
    {
        var layer:DisplayObject = layersModel.layers[event.data] as DisplayObject;



    }

    private function resizeImageToArea(layer:IUIComponent):void {
        var widthScaleIndicator:Number = layer.width / _view.width;
        var heightScaleIndicator:Number = layer.height / _view.height;
        var alignToWidth:Boolean = widthScaleIndicator >= heightScaleIndicator;
        if(alignToWidth){
             if(widthScaleIndicator > 1){
                layer.scaleX = layer.scaleY = 1 / widthScaleIndicator;
             }
        }else{
            if(heightScaleIndicator > 1){
                layer.scaleX = layer.scaleY = 1 / heightScaleIndicator;
            }

        }
    }



    [ViewAdded]
    public function viewAddedHandler(view:TransformToolView):void{
        _view = view;
    }



}
}
