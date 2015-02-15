package screens
{
	import flash.events.MouseEvent;
	
	import ui_objects.Button;

	public class OptionScreen extends Screen
	{
		private var closeBtn:Button;
		
		public function OptionScreen()
		{
			super();
			
			initialize();
			draw();
		}
		
		private function initialize():void
		{
			Assets.gamePaused = true;
			image = Assets.getTexture("OptionsMenuScreen");
			
			closeBtn = new Button("ExitWorldBtn");
			closeBtn.x = Assets.gameStage.stageWidth/2 + 150;
			closeBtn.y = Assets.gameStage.stageHeight/2 - 180;
			closeBtn.addEventListener(MouseEvent.CLICK, close);
		}
		
		private function draw():void
		{
			this.addChild(image);
			this.addChild(closeBtn);
		}
		
		private function close(evt:MouseEvent):void
		{
			destruct();
		}
		
		private function removeListeners():void
		{
			closeBtn.removeEventListener(MouseEvent.CLICK, close);
		}
		
		override public function destruct():void
		{
			removeListeners();
			Assets.gamePaused = false;
			this.removeChild(closeBtn);
			super.destruct();
			this.parent.removeChild(this);
		}
	}
}