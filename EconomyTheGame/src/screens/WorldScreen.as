package screens
{
	import ui_objects.Button;

	public class WorldScreen extends Screen
	{
		private var exit:Button;
		private var options:Button;
		private var mute:Button;
		
		public function WorldScreen()
		{
			super();
			
			initialize();
			draw();
		}
		
		private function initialize():void
		{
			image = Assets.getTexture("WorldBG");
			
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
			
		}
		
		private function draw():void
		{
			this.addChild(image);
			this.addChild(overlay);
			this.addChild(exit);
			this.addChild(options);
			this.addChild(mute);
		}
	}
}