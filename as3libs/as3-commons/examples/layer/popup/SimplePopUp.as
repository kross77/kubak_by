package layer.popup {
	import layer.popup.common.AlertBox;
	import com.sibirjak.asdpc.button.Button;
	import com.sibirjak.asdpc.button.ButtonEvent;
	import org.as3commons.ui.layer.PopUpManager;
	import org.as3commons.ui.layout.shortcut.hgroup;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;

	public class SimplePopUp extends Sprite {
		private var _popUpManager : PopUpManager;
		private var _addButton : Button;
		private var _centerButton : Button;
		
		public function SimplePopUp() {
			addEventListener(Event.ADDED_TO_STAGE, init);
		}

		private function init(event : Event) : void {
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			var container : Sprite = stage.addChild(new Sprite()) as Sprite;
			_popUpManager = new PopUpManager(container);

			_addButton = new Button();
			_addButton.setSize(50, 20);
			_addButton.toggle = true;
			_addButton.label = "show";
			_addButton.selectedLabel = "hide";
			_addButton.addEventListener(ButtonEvent.SELECTION_CHANGED, showHideHandler);
			
			_centerButton = new Button();
			_centerButton.setSize(50, 20);
			_centerButton.label = "center";
			_centerButton.visible = false;
			_centerButton.addEventListener(ButtonEvent.CLICK, centerHandler);

			hgroup("gap", 6, _addButton, _centerButton).layout(this);
		}
		
		private function showHideHandler(event : ButtonEvent) : void {
			if (_addButton.selected) {
				var alert : AlertBox = new AlertBox(
					"Simple Popup",
					"This is a simple popup window. Close this window by clicking the close button.",
					[null, null, "Close"],
					removePopUp
				);
				alert.x = 40;
				alert.y = 60;
				_popUpManager.createPopUp(alert);
				_centerButton.visible = true;
			} else {
				removePopUp(_popUpManager.popUpOnTop);
			}
		}
		
		private function centerHandler(event : ButtonEvent) : void {
			_popUpManager.center(_popUpManager.popUpOnTop);
		}
		
		private function removePopUp(alert : DisplayObject, event : String = null) : void {
			_popUpManager.removePopUp(alert);
			_centerButton.visible = false;
			_addButton.selected = false;
		}
	}
}