package utility
{
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.sampler.StackFrame;
	
	import screens.StartScreen;
	import screens.WorldScreen;
	
	public class ScreenHandle extends Sprite
	{
		public var myStage:Stage;
		private var menu:StartScreen;
		private var world:WorldScreen;
		
		private var _inScreen:String = "Empty";
		
		public function ScreenHandle(_stage:Stage)
		{
			super();
			myStage = _stage;
			Assets.gameStage = myStage;
		}
		
		public function get inScreen():String
		{
			return _inScreen;
		}
		
		public function set inScreen(value:String):void
		{
			var foundMatch:Boolean = true;
			if(value != _inScreen) // avaa uuden näytön, jos ei yritetä avata samaa uudestaan
			{
				switch(value)
				{
					case "credits":
						
						break;
					case "menu":
						
						menu = new StartScreen();
						menu.x = 0;
						menu.y = 0;
						this.addChild(menu);
						
						break;
					case "world":
						world = new WorldScreen();
						world.x = 0;
						world.y = 0;
						this.addChild(world);
						
						break;
					case "metsa":
						
						
						break;
					case "pilkki":
						
						
						break;
					case "yhdistely":
						
						
						break;
					default: // suoritetaan kun mikään muu ei täsmää
						foundMatch = false;
						break;
				}
			}
			else
				foundMatch = false;
			
			if(foundMatch)
			{
				// poistaa vanhan näytön, jos kutsuttu näyttö löytyi
				switch(_inScreen)
				{
					case "credits":
						
						
						break;
					case "menu":
						menu.destruct();
						this.removeChild(menu);
						
						break;
					case "world":
						if(value == "menu")
						{
							world.destruct();
							this.removeChild(world);
						}
						
						break;
					
					case "metsa":
						
						
						break;
					
					case "pilkki":
						
						
						break;
					
					case "yhdistely":
						
						
						break;
					default: // suoritetaan kun mikään muu ei täsmää
						
						break;
				}
				
				_inScreen = value;			// asettaa muistiin uuden näytön nimen
			}
		}
	}
}