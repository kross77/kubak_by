/**
 * Created by Admin on 09.01.14.
 */
package modules.imgeditor.service {
import modules.imgeditor.model.vo.LayerVO;
import modules.imgeditor.view.components.types.*;
import modules.imgeditor.view.components.ILayerDisplObj;
import modules.imgeditor.view.components.LayerDispObjType;

public class LayerManagerFactory {
    public function LayerManagerFactory() {
    }

    public function getLayer(layerVO:LayerVO):ILayerDisplObj
    {
        switch (layerVO.type){
            case LayerDispObjType.IMAGE:
                    return new ImageLayerDisplObj(layerVO);
            break;
            case LayerDispObjType.FILL_IMAGE:
                return new FillImageLayerDisplObj(layerVO);
            break;
            case LayerDispObjType.FILL_TEST:
                return new FillTestLayerDisplObj(layerVO);
                break;
        }

        return null;
    }
}
}
