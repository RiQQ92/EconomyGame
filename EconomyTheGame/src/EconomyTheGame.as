package
{
	import flash.display.Sprite;
	import flash.display.Stage;
	
	import utility.ScreenHandle;
	
	[SWF(frameRate="30", width="800", height="600", backgroundColor= "0x333333")]
	public class EconomyTheGame extends Sprite
	{
		private var screenHandle:ScreenHandle;
		
		public function EconomyTheGame()
		{
			Assets.gamePaused = false;
			screenHandle = new ScreenHandle(stage);
			this.addChild(screenHandle);
			Assets.screenHandle = screenHandle;
			Assets.initializeAssets();
			screenHandle.inScreen = "menu";
		}
	}
}