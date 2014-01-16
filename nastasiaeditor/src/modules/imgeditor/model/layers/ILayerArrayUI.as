/**
 * Created with IntelliJ IDEA.
 * User: Александр
 * Date: 12.1.14
 * Time: 15.53
 * To change this template use File | Settings | File Templates.
 */
package modules.imgeditor.model.layers {
import modules.imgeditor.model.vo.LayerVO;

public interface ILayerArrayUI {
    function get layers():Vector.<LayerVO>
    function addLayer(layer:LayerVO):void
    function removeLayer(layer:LayerVO):void
    function moveLayer(layer:LayerVO, index:int):void
}
}
