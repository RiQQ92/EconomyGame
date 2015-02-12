package screens
{
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
			
			exit.addEventListener(MouseEvent.CLICK, exitToMenu);
		}
		
		private function exitToMenu(event:MouseEvent):void
		{
			var qBox:QuestionWindow = new QuestionWindow("Want to exit?", goToMenu);
			this.addChild(qBox);
		}
		
		private function goToMenu():void
		{
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
	}
}