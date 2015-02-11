package 
{
	import flash.display.Bitmap;
	import flash.display.Stage;
	import flash.media.Sound;
	import flash.utils.Dictionary;
	
	import utility.ScreenHandle;

	public class Assets
	{
		/*** MENU ***/
		/**********************************/
		[Embed(source = "../Graphics/Menu/New_btn.png")]
		public static const NewMenuBtn:Class;
		[Embed(source = "../Graphics/Menu/Load_btn.png")]
		public static const LoadMenuBtn:Class;
		[Embed(source = "../Graphics/Menu/Options_btn.png")]
		public static const OptionsMenuBtn:Class;
		[Embed(source = "../Graphics/Menu/Credits_btn.png")]
		public static const CreditsMenuBtn:Class;
		
		[Embed(source = "../Graphics/Menu/StartScreen_BG.png")]
		public static const StartMenuBG:Class;
		
		/**********************************/
		
		/*** WorldScreen ***/
		/**********************************/
		
		[Embed(source = "../Graphics/World/Map.jpg")]
		public static const WorldBG:Class;
		
		[Embed(source = "../Graphics/World/WorldScreen_Hud.png")]
		public static const WorldHUD:Class;
		
		[Embed(source = "../Graphics/World/optionsBtn.png")]
		public static const OptionsWorldBtn:Class;
		[Embed(source = "../Graphics/World/exitBtn.png")]
		public static const ExitWorldBtn:Class;
		[Embed(source = "../Graphics/World/muteBtn.png")]
		public static const MuteWorldBtn:Class;
		/**********************************/
		
		/*** Global Variables ***/
		/**********************************/
		public static var gameStage:Stage;
		public static var screenHandle:ScreenHandle;
		/**********************************/
		
		private static var gameTextures:Dictionary = new Dictionary();
		
		public static function getTexture(textureName:String):Bitmap
		{
			if(gameTextures[textureName] == undefined)
			{
				var bitmap:Bitmap = new Assets[textureName]();
				gameTextures[textureName] = bitmap;
			}
			
			var newCopy:Bitmap = new Bitmap;
			newCopy.bitmapData = gameTextures[textureName].bitmapData.clone();
			
			return newCopy;
		}
		
		public static function getSound(soundName:String):Sound
		{
			var sound:Sound = new Assets[soundName]();
			
			return sound;
		}
	}
}