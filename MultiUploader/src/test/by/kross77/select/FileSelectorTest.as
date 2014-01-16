/**
 * Created by Admin on 07.01.14.
 */
package test.by.kross77.select {
import by.kross77.select.FileSelector;
import by.kross77.select.event.SelectEvent;
import by.kross77.select.model.vo.SelectOptionsVO;

import flash.display.Sprite;

public class FileSelectorTest extends Sprite{
    private var fileSelector:FileSelector;
    public function FileSelectorTest() {

        fileSelector = new FileSelector();
        fileSelector.addEventListener(SelectEvent.FILES_SELECTED, fileSelectedHandler);

        var selectFileVO:SelectOptionsVO = SelectOptionsVO.getImageFilter();
        fileSelector.selectFile(selectFileVO);


    }

    private function fileSelectedHandler(event:SelectEvent):void {
        trace(event.data);

        var selectFileVO:SelectOptionsVO = SelectOptionsVO.getRarFilter();
        fileSelector.selectFiles(selectFileVO);
    }
}
}
