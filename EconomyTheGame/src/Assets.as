package 
{
	import flash.display.Bitmap;
	import flash.display.Stage;
	import flash.media.Sound;
	import flash.utils.Dictionary;
	
	import game_objects.Industry;
	import game_objects.TradeGood;
	
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
		[Embed(source = "../Graphics/Menu/Slide_Bar.png")]
		public static const SlideBar:Class;
		[Embed(source = "../Graphics/Menu/Slide_Pull.png")]
		public static const SlidePull:Class;
		
		[Embed(source = "../Graphics/Menu/Yes_btn.png")]
		public static const YesMenuBtn:Class;
		[Embed(source = "../Graphics/Menu/No_btn.png")]
		public static const NoMenuBtn:Class;
		
		[Embed(source = "../Graphics/Menu/QuestionWindow.png")]
		public static const QuestionMenuWindow:Class;
		/**********************************/
		
		/*** OPTIONS ***/
		/**********************************/
		[Embed(source = "../Graphics/Menu/OptionsScreen.png")]
		public static const OptionsMenuScreen:Class;

		// ok and cancel button needed maybe //
		/**********************************/
		
		/*** MARKET ***/
		/**********************************/
		[Embed(source = "../Graphics/Town/TownScreen.png")]
		public static const MainTownScreen:Class;
		
		[Embed(source = "../Graphics/Town/MarketTownBtn.png")]
		public static const MarketTownBtn:Class;
		[Embed(source = "../Graphics/Town/IndustriesTownBtn.png")]
		public static const IndustriesTownBtn:Class;
		[Embed(source = "../Graphics/Town/StatisticsTownBtn.png")]
		public static const StatisticsTownBtn:Class;
		[Embed(source = "../Graphics/Town/ExitTownBtn.png")]
		public static const ExitTownBtn:Class;
		[Embed(source = "../Graphics/Town/CloseTownBtn.png")]
		public static const CloseTownBtn:Class;
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
		[Embed(source = "../Graphics/World/Town.png")]
		public static const TownImage:Class;
		/**********************************/
		
		/*** Utility ***/
		/**********************************/
		[Embed(source = "../Graphics/Utility/NoImage.png")]
		public static const NoImage:Class;
		[Embed(source = "../Graphics/Utility/VCAM_Zone.png")]
		public static const VCAM_zone:Class;
		/**********************************/
		
		
		
		/*** TradeGood Templates ***/
		/**********************************/
		// necessary
		public static var Meat:TradeGood = 		new TradeGood(5, 1, "Meat", 10, 1, 1);
		public static var Milk:TradeGood = 		new TradeGood(5, 1, "Milk", 10, 1, 1);
		public static var Wheat:TradeGood = 	new TradeGood(5, 1, "Wheat", 10, 1, 1);
		public static var Bread:TradeGood = 	new TradeGood(5, 1, "Bread", 10, 1, 1);
		public static var Water:TradeGood = 	new TradeGood(5, 1, "Water", 10, 1, 1);
		public static var Forage:TradeGood = 	new TradeGood(5, 1, "Forage", 10, 1, 1);
		
		// luxury
		public static var Wood:TradeGood = 		new TradeGood(5, 1, "Wood", 10, 1, 1);
		public static var Wool:TradeGood = 		new TradeGood(5, 1, "Wool", 10, 1, 1);
		public static var Clothes:TradeGood = 	new TradeGood(5, 1, "Clothes", 10, 1, 1);
		public static var Stone:TradeGood = 	new TradeGood(5, 1, "Stone", 10, 1, 1);
		public static var Jewelry:TradeGood = 	new TradeGood(5, 1, "Jewelry", 10, 1, 1);
		public static var Pottery:TradeGood = 	new TradeGood(5, 1, "Pottery", 10, 1, 1);
		/**********************************/
		
		/*** Industry Templates ***/
		/**********************************/
		// food production
		public static var Bakery:Industry = 			new Industry(10, "Bakery", 			new Vector.<TradeGood>(Bread), new Vector.<TradeGood>(Water, Wheat), 1);
		public static var WheatPlantation:Industry = 	new Industry(10, "WheatPlantation", 	new Vector.<TradeGood>(Wheat), new Vector.<TradeGood>(Water), 1);
		public static var CattleBreeding:Industry = 	new Industry(10, "CattleBreeding", 	new Vector.<TradeGood>(Meat, Milk, Wool), new Vector.<TradeGood>(Water, Forage), 1);
		public static var WaterWell:Industry = 			new Industry(10, "WaterWell", 		new Vector.<TradeGood>(Water), null, 1);
		public static var ForagePlantation:Industry = 	new Industry(10, "ForagePlantation", new Vector.<TradeGood>(Forage), null, 1);
		
		// luxury production
		public static var StoneMason:Industry = 		new Industry(10, "StoneMason", 		new Vector.<TradeGood>(Stone), null, 1);
		public static var Jeweller:Industry = 			new Industry(10, "Jeweller", 		new Vector.<TradeGood>(Jewelry), null, 1);
		public static var Potterer:Industry = 			new Industry(10, "Potterer", 		new Vector.<TradeGood>(Pottery), null, 1);
		public static var WoodCutter:Industry = 		new Industry(10, "WoodCutter", 		new Vector.<TradeGood>(Wood), null, 1);
		public static var ClothesProduction:Industry = 	new Industry(10, "WoodCutter", 		new Vector.<TradeGood>(Clothes), new Vector.<TradeGood>(Wool), 1);
		/**********************************/
		
		
		
		/*** Global Variables ***/
		/**********************************/
		public static var worldObjCounter:int;
		
		public static var gamePaused:Boolean;
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