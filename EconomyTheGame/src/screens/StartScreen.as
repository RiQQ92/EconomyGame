package screens
{
	
	import flash.display.Bitmap;
	import flash.events.MouseEvent;
	
	import ui_objects.Button;
	import ui_objects.ScrollList;
	
	import utility.ScreenHandle;

	public class StartScreen extends Screen
	{
		private var newBtn:Button = new Button("NewMenuBtn");
		private var loadBtn:Button = new Button("LoadMenuBtn");
		private var optionsBtn:Button = new Button("OptionsMenuBtn");
		private var creditsBtn:Button = new Button("CreditsMenuBtn");
		
		private var t1:Button = new Button("NewMenuBtn");
		private var t2:Button = new Button("NewMenuBtn");
		private var t3:Button = new Button("NewMenuBtn");
		private var t4:Button = new Button("NewMenuBtn");
		private var t5:Button = new Button("NewMenuBtn");
		private var t6:Button = new Button("NewMenuBtn");
		private var t7:Button = new Button("NewMenuBtn");
		private var t8:Button = new Button("NewMenuBtn");
		
		private var test:ScrollList;
		
		public function StartScreen()
		{
			super();
			
			image = Assets.getTexture("StartMenuBG");
			
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
			
			newBtn.addEventListener(MouseEvent.CLICK, startNew);
			optionsBtn.addEventListener(MouseEvent.CLICK, openOptions);
		}
		
		protected function startNew(event:MouseEvent):void
		{
			changeScreen("world");
		}
		
		private function openOptions(event:MouseEvent):void
		{
			var optionsScreen:OptionScreen = new OptionScreen();
			this.addChild(optionsScreen);
		}
		
		private function draw():void
		{
			this.addChild(image);
			this.addChild(newBtn);
			this.addChild(loadBtn);
			this.addChild(optionsBtn);
			this.addChild(creditsBtn);
			
			test = new ScrollList(370, 200, false);
			test.x = 100;
			test.y = 100;
			test.addItem(t1);
			test.addItem(t2);
			test.addItem(t3);
			test.addItem(t4);
			test.addItem(t5);
			test.addItem(t6);
			test.addItem(t7);
			test.addItem(t8);
			this.addChild(test);
		}
		
		private function removeListeners():void
		{
			newBtn.removeEventListener(MouseEvent.CLICK, startNew);
		}
		
		override public function destruct():void
		{
			removeListeners();
			
			this.removeChild(newBtn);
			this.removeChild(loadBtn);
			this.removeChild(optionsBtn);
			this.removeChild(creditsBtn);
			
			super.destruct();
		}
	}
}