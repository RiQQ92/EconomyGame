package screens
{
	
	import flash.display.Bitmap;
	
	import ui_objects.Button;
	
	import utility.ScreenHandle;

	public class StartScreen extends Screen
	{
		private var newBtn:Button = new Button("NewMenuBtn");
		private var loadBtn:Button = new Button("LoadMenuBtn");
		private var optionsBtn:Button = new Button("OptionsMenuBtn");
		private var creditsBtn:Button = new Button("CreditsMenuBtn");
		
		private var screenHandle:ScreenHandle;
		
		public function StartScreen(scrnHandle:ScreenHandle)
		{
			super();
			
			image = Assets.getTexture("StartMenuBG");
			screenHandle = scrnHandle;
			
			draw();
			initialize();
		}
		
		private function initialize():void
		{
			newBtn.x = this.width/2 - newBtn.width/2;
			newBtn.y = this.height/4 - newBtn.height/2;
			
			loadBtn.x = this.width/2 - newBtn.width/2;
			loadBtn.y = this.height/4 +100 - newBtn.height/2;
			
			optionsBtn.x = this.width/2 - newBtn.width/2;
			optionsBtn.y = this.height/4 +200 - newBtn.height/2;
			
			creditsBtn.x = this.width/2 - newBtn.width/2;
			creditsBtn.y = this.height/4 +300 - newBtn.height/2;
		}
		
		private function draw():void
		{
			this.addChild(image);
			this.addChild(newBtn);
			this.addChild(loadBtn);
			this.addChild(optionsBtn);
			this.addChild(creditsBtn);
		}
	}
}