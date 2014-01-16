/**
 * Created by Admin on 09.01.14.
 */
package modules.imgeditor.controller {
import by.kross77.loaders.FileReferenceLoader;
import by.kross77.select.FileSelector;
import by.kross77.select.event.SelectEvent;
import by.kross77.select.model.vo.SelectOptionsVO;
import by.kross77.select.model.vo.SelectedFileVO;
import modules.imgeditor.event.LayerManagerEvent;
import modules.imgeditor.view.components.LayerDispObjType;



public class SelectFileController extends BaseController{


    public function SelectFileController() {
    }

    private var _fileSelector:FileSelector = new FileSelector();
    private var _imageName:String;
    private var _selectionType:LayerDispObjType;

    [EventHandler( event="SelectEvent.BROWSE" )]
    public function selectImageHandler(event:SelectEvent):void
    {
        _fileSelector = new FileSelector();
        _fileSelector.addEventListener(SelectEvent.FILES_SELECTED, fileSelector_filesSelectedHandler);
        var selectOptionsVO:SelectOptionsVO = SelectOptionsVO.getImageFilter();
        _fileSelector.selectFile(selectOptionsVO);
        _selectionType = event.data as LayerDispObjType;
    }



    private function fileSelector_filesSelectedHandler(event:SelectEvent):void {
        var data:SelectedFileVO = event.data[0] as SelectedFileVO;
        data.params = {type: _selectionType};
        FileReferenceLoader.load(data, fileLoadedHandler);
    }

    private function fileLoadedHandler(data:SelectedFileVO):void {
         dispatcher.dispatchEvent(new SelectEvent(SelectEvent.FILE_LOADED, data));
    }


}
}
