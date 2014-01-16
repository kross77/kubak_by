/**
 * Created by Admin on 07.01.14.
 */
package by.kross77.loaders {
import by.kross77.select.model.vo.SelectedFileVO;

import flash.display.DisplayObject;
import flash.display.Loader;
import flash.events.Event;
import flash.events.IOErrorEvent;
import flash.events.ProgressEvent;
import flash.net.FileReference;
import flash.utils.ByteArray;

public class FileReferenceLoader {
    private var _file:FileReference;
    private static var _instance:FileReferenceLoader;
    public var onFileLoaded:Function;
    public var onProgress:Function;
    public var onError:Function;

    public function FileReferenceLoader(privClass:PrivateClass) {

    }


    private static var _selectedFileVO:SelectedFileVO;

    public static function load(selectedFileVO:SelectedFileVO, onFileLoaded:Function, onProgress:Function = null, onError:Function = null):void {
        instance.file = selectedFileVO.file;
        instance.onFileLoaded = onFileLoaded;
        instance.onProgress = onProgress;
        instance.onError = onError;
        _selectedFileVO = selectedFileVO;
        _selectedFileVO.file.load();
    }

    public static function get instance():FileReferenceLoader {
        if (_instance == null) {
            _instance = new FileReferenceLoader(new PrivateClass());
        }
        return _instance;
    }

    public function set file(value:FileReference):void {
        removeListeners();
        _file = value;
        addListeners();

    }

    private function removeListeners():void {
        if(_file)
        {
            _file.removeEventListener(Event.COMPLETE, fileLoadedHandler);
            _file.removeEventListener(IOErrorEvent.IO_ERROR, fileLoadErrorHandler);
            _file.removeEventListener(ProgressEvent.PROGRESS, progressHandler);
        }

    }

    private function addListeners():void {
        _file.addEventListener(Event.COMPLETE, fileLoadedHandler);
        _file.addEventListener(IOErrorEvent.IO_ERROR, fileLoadErrorHandler);
        _file.addEventListener(ProgressEvent.PROGRESS, progressHandler);
    }

    // This function is called to notify us of the uploading progress
    private function progressHandler(event:ProgressEvent):void {
        if (onProgressUpdated != null) {
            var percentLoaded:Number = event.bytesLoaded / event.bytesTotal * 100;
            onProgressUpdated(percentLoaded);
        }
    }

// This function is called after the file has been uploaded.
    private function fileLoadedHandler(event:Event):void {
        var fileReference:FileReference = event.target as FileReference;

        // These steps below are to pass the data as DisplayObject
        // These steps below are specific to this example.
        var data:ByteArray = fileReference["data"];
        removeListeners();
        var movieClipLoader:Loader = new Loader();
        movieClipLoader.loadBytes(data);
        movieClipLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, onMovieClipLoaderComplete);

    }

    private function fileLoadErrorHandler(event:Event):void {
        removeListeners();
        if(onError != null){
            onError(event);
        }
    }

// This function below is specific to this example.
// It does the processing required to display the swf/png/jpeg file that we have just loaded.
    private function onMovieClipLoaderComplete(event:Event):void {

        _selectedFileVO.loadedContent = event.target.content;

        if(onFileLoaded != null)
        {
            onFileLoaded(_selectedFileVO);
        }
    }

    public static var onProgressUpdated:Function;
}
}

class PrivateClass {
}

