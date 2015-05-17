package screens
{
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import ui_objects.Button;
	import ui_objects.Slider;

	public class OptionScreen extends Screen
	{
		private var closeBtn:Button;
		private var volumeSlide:Slider;
		
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
			
			volumeSlide = new Slider();
			volumeSlide.x = Assets.gameStage.stageWidth/2 -volumeSlide.width/2;
			volumeSlide.y = Assets.gameStage.stageHeight/2;
		}
		
		private function draw():void
		{
			this.addChild(image);
			this.addChild(closeBtn);
			this.addChild(volumeSlide);
		}
		
		private function close(evt:MouseEvent):void
		{
			destruct();
		}
		
		private function removeListeners():void
		{
			closeBtn.removeEventListener(MouseEvent.CLICK, close);
		}
		
		override public function destruct(evt:Event = null):void
		{
			removeListeners();
			Assets.gamePaused = false;
			this.removeChild(closeBtn);
			super.destruct();
			this.parent.removeChild(this);
		}
	}
}