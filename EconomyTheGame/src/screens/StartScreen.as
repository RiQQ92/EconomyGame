package screens
{
	
	import flash.display.Bitmap;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import ui_objects.Button;
	import ui_objects.ScrollList;
	
	import utility.Calculator;
	import utility.ScreenHandle;

	public class StartScreen extends Screen
	{
		private var newBtn:Button = new Button("NewMenuBtn");
		private var loadBtn:Button = new Button("LoadMenuBtn");
		private var optionsBtn:Button = new Button("OptionsMenuBtn");
		private var creditsBtn:Button = new Button("CreditsMenuBtn");
		private var calc:Calculator = new Calculator(function(amnt:int):void{trace("Function called properly, amount is: "+amnt);}, 1000000000);
		
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
			
			calc.x = this.width/2 -calc.width/2;
			calc.y = this.height/2 - calc.height/2;
			
			newBtn.addEventListener(MouseEvent.CLICK, startNew);
			optionsBtn.addEventListener(MouseEvent.CLICK, openOptions);
		}
		
		protected function startNew(event:MouseEvent):void
		{
			changeScreen("world");
			Assets.startDayProgress();
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
			this.addChild(calc);
		}
		
		private function removeListeners():void
		{
			newBtn.removeEventListener(MouseEvent.CLICK, startNew);
		}
		
		override public function destruct(evt:Event = null):void
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