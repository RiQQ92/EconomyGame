package screens
{
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import ui_objects.Button;
	import ui_objects.QuestionWindow;
	
	import world_objects.World;

	public class WorldScreen extends Screen
	{
		private var exit:Button;
		private var options:Button;
		private var mute:Button;
		private var world:World;
		
		public function WorldScreen()
		{
			super();
			
			initialize();
			draw();
		}
		
		private function initialize():void
		{
			world = new World();
			Assets.worldObjCounter = 0;
			
			overlay = Assets.getTexture("WorldHUD");
			overlay.x = Assets.gameStage.stageWidth -overlay.width;
			
			mute = new Button("MuteWorldBtn");
			mute.x = overlay.x + 60;
			mute.y = 5;
			
			options = new Button("OptionsWorldBtn");
			options.x = mute.x + 50;
			options.y = 5;
			
			exit = new Button("ExitWorldBtn");
			exit.x = options.x + 50;
			exit.y = 5;
			
			options.addEventListener(MouseEvent.CLICK, openOptions);
			exit.addEventListener(MouseEvent.CLICK, exitToMenu);
		}
		
		private function openOptions(event:MouseEvent):void
		{
			var optionsScreen:OptionScreen = new OptionScreen();
			this.addChild(optionsScreen);
		}
		
		private function exitToMenu(event:MouseEvent):void
		{
			var qBox:QuestionWindow = new QuestionWindow("Want to exit?", goToMenu);
			this.addChild(qBox);
		}
		
		private function goToMenu():void
		{
			Assets.changeDay.stopProgress();
			Assets.gamePaused = true;
			changeScreen("menu");
		}
		
		private function draw():void
		{
			this.addChild(world);
			this.addChild(overlay);
			this.addChild(exit);
			this.addChild(options);
			this.addChild(mute);
		}
		
		private function removeListeners():void
		{
			exit.removeEventListener(MouseEvent.CLICK, exitToMenu);
		}
		
		override public function destruct(evt:Event = null):void
		{
			removeListeners();
			
			world.destruct();
			this.removeChild(world);
			
			exit.destruct();
			this.removeChild(exit);
			
			options.destruct();
			this.removeChild(options);
			
			mute.destruct();
			this.removeChild(mute);
			
			super.destruct();
		}
	}
}