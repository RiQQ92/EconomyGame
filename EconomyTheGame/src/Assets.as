package 
{
	import flash.display.Bitmap;
	import flash.display.Stage;
	import flash.media.Sound;
	import flash.utils.Dictionary;
	
	import utility.ScreenHandle;
	
	import world_objects.World;

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
		
		// other menu instances
		[Embed(source = "../Graphics/Menu/Yes_btn.png")]
		public static const YesMenuBtn:Class;
		[Embed(source = "../Graphics/Menu/No_btn.png")]
		public static const NoMenuBtn:Class;
		
		[Embed(source = "../Graphics/Menu/QuestionWindow.png")]
		public static const QuestionMenuWindow:Class;
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
		
		[Embed(source = "../Graphics/World/PlayerPlaceHolder.png")]
		public static const PlayerImage:Class;
		/**********************************/
		
		/*** Utility ***/
		/**********************************/
		[Embed(source = "../Graphics/Utility/NoImage.png")]
		public static const NoImage:Class;
		[Embed(source = "../Graphics/Utility/VCAM_Zone.png")]
		public static const VCAM_zone:Class;
		/**********************************/
		
		/*** Global Variables ***/
		/**********************************/
		public static var gameStage:Stage;
		public static var gameWorld:World;
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