/**
 * Created by Admin on 07.01.14.
 */
package org.swizframework.chainingdemo.controller {
import by.kross77.loaders.FileReferenceLoader;
import by.kross77.select.FileSelector;
import by.kross77.select.event.SelectEvent;
import by.kross77.select.model.vo.SelectOptionsVO;
import by.kross77.select.model.vo.SelectedFileVO;

import flash.net.FileReference;

import mx.core.UIComponent;

import org.swizframework.chainingdemo.event.SelectionEvent;
import org.swizframework.chainingdemo.view.AddImageView;

public class AddImageController {
    public function AddImageController() {
    }

    private var _fileSelector:FileSelector = new FileSelector();
    private var _view:UIComponent;

    [EventHandler( event="SelectionEvent.SELECT_IMAGE" )]
    public function onSelectImage( event : SelectionEvent ) : void
    {
        _fileSelector = new FileSelector();
        _fileSelector.addEventListener(SelectEvent.FILES_SELECTED, fileSelector_filesSelectedHandler);
        var selectOptionsVO:SelectOptionsVO = SelectOptionsVO.getImageFilter();
        _fileSelector.selectFile(selectOptionsVO);
    }
    
    [ViewAdded]
    public function addViewHandler(view:UIComponent):void
    {
        _view = view;
    }

    private function fileSelector_filesSelectedHandler(event:SelectEvent):void {
        var data:SelectedFileVO = event.data[0] as SelectedFileVO;
        FileReferenceLoader.load(data.file, addImageView.imageContainer);
    }

    private function get addImageView():AddImageView {
        return _view as AddImageView;
    }
}
}
