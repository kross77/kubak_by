package by.kross77.select {

import by.kross77.select.event.SelectEvent;
import by.kross77.select.model.vo.SelectOptionsVO;
import by.kross77.select.model.vo.SelectedFileVO;

import flash.events.Event;
import flash.events.EventDispatcher;
import flash.net.FileFilter;
import flash.net.FileReference;
import flash.net.FileReferenceList;

/**
 * ...
 * @author kross77
 */
public class FileSelector extends EventDispatcher {

    //объект работающий со списком файлов
    public var fileReferenceList:FileReferenceList = new FileReferenceList();
    //объект работающий с файлом
    private var fileReference:FileReference = new FileReference();
    private var _selectedFiles:Array = [];


    public function FileSelector() {
        fileReferenceList = new FileReferenceList();
        fileReferenceList.addEventListener(Event.SELECT, onSelectFile);
        fileReference.addEventListener(Event.SELECT, onSelectFile);

    }

    /* PUBLIC FUNCTIONS */

    public function selectFiles(selecteFileVO:SelectOptionsVO = null):void {
        fileReferenceList.browse(getTypeFilter(selecteFileVO));
    }

    public function selectFile(selecteFileVO:SelectOptionsVO = null):void
    {
        fileReference.browse(getTypeFilter(selecteFileVO));
    }

    /* END */

    public function get selectedFiles():Array {
        return _selectedFiles;
    }


    /**
     * add multiple files to scene
     * @param e
     */


    private function getTypeFilter(selecteFileVO:SelectOptionsVO):Array {
         if(selecteFileVO == null) return null;
        return [new FileFilter(selecteFileVO.filterDescription, selecteFileVO.filterExtension)];
    }



    private function onSelectFile(event:Event):void {
        var isList:Boolean = event.target is FileReferenceList;
        var selectedFileVO:SelectedFileVO;
        if(isList)
        {
            if (fileReferenceList.fileList.length >= 1) {
                _selectedFiles = new Array();
                for (var k:Number = 0; k < fileReferenceList.fileList.length; k++) {

                    selectedFileVO = SelectedFileVO.convertFromFileReference(fileReferenceList.fileList[k]);
                    _selectedFiles.push(selectedFileVO);
                }
            }
        } else{

                selectedFileVO = SelectedFileVO.convertFromFileReference(fileReference);
                _selectedFiles.push(selectedFileVO);
        }
        dispatchEvent(new SelectEvent(SelectEvent.FILES_SELECTED, selectedFiles));


    }



}

}