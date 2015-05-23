package 
{
	import flash.display.Bitmap;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.media.Sound;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	import flash.utils.Dictionary;
	
	import game_objects.Industry;
	import game_objects.TradeGood;
	
	import my.events.DayChange;
	import my.events.MyEvents;
	
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
		[Embed(source = "../Graphics/Town/TradeTownBtn.png")]
		public static const TradeTownBtn:Class;
		[Embed(source = "../Graphics/Town/ResetTownBtn.png")]
		public static const ResetTownBtn:Class;
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
		
		// Calculator
		[Embed(source = "../Graphics/Utility/Calculator/BG.png")]
		public static const CalculatorBG:Class;
		
		[Embed(source = "../Graphics/Utility/Calculator/Btn0.png")]
		public static const Calculator0:Class;
		[Embed(source = "../Graphics/Utility/Calculator/Btn1.png")]
		public static const Calculator1:Class;
		[Embed(source = "../Graphics/Utility/Calculator/Btn2.png")]
		public static const Calculator2:Class;
		[Embed(source = "../Graphics/Utility/Calculator/Btn3.png")]
		public static const Calculator3:Class;
		[Embed(source = "../Graphics/Utility/Calculator/Btn4.png")]
		public static const Calculator4:Class;
		[Embed(source = "../Graphics/Utility/Calculator/Btn5.png")]
		public static const Calculator5:Class;
		[Embed(source = "../Graphics/Utility/Calculator/Btn6.png")]
		public static const Calculator6:Class;
		[Embed(source = "../Graphics/Utility/Calculator/Btn7.png")]
		public static const Calculator7:Class;
		[Embed(source = "../Graphics/Utility/Calculator/Btn8.png")]
		public static const Calculator8:Class;
		[Embed(source = "../Graphics/Utility/Calculator/Btn9.png")]
		public static const Calculator9:Class;
		
		[Embed(source = "../Graphics/Utility/Calculator/BtnDel.png")]
		public static const CalculatorDel:Class;
		[Embed(source = "../Graphics/Utility/Calculator/BtnX.png")]
		public static const CalculatorX:Class;
		[Embed(source = "../Graphics/Utility/Calculator/BtnClear.png")]
		public static const CalculatorClear:Class;
		[Embed(source = "../Graphics/Utility/Calculator/BtnMax.png")]
		public static const CalculatorMax:Class;
		[Embed(source = "../Graphics/Utility/Calculator/BtnEnter.png")]
		public static const CalculatorEnter:Class;
		
		[Embed(source = "../Graphics/Utility/Calculator/Btn+1.png")]
		public static const CalculatorPlus1:Class;
		[Embed(source = "../Graphics/Utility/Calculator/Btn+10.png")]
		public static const CalculatorPlus10:Class;
		[Embed(source = "../Graphics/Utility/Calculator/Btn+100.png")]
		public static const CalculatorPlus100:Class;
		[Embed(source = "../Graphics/Utility/Calculator/Btn+1000.png")]
		public static const CalculatorPlus1000:Class;
		
		[Embed(source = "../Graphics/Utility/Calculator/Btn-1.png")]
		public static const CalculatorMinus1:Class;
		[Embed(source = "../Graphics/Utility/Calculator/Btn-10.png")]
		public static const CalculatorMinus10:Class;
		[Embed(source = "../Graphics/Utility/Calculator/Btn-100.png")]
		public static const CalculatorMinus100:Class;
		[Embed(source = "../Graphics/Utility/Calculator/Btn-1000.png")]
		public static const CalculatorMinus1000:Class;
		/**********************************/
		
		/*** Industry ***/
		/**********************************/
		[Embed(source = "../Graphics/Industry/industryMenuBG.png")]
		public static const IndustryMenuBG:Class;
		
		[Embed(source = "../Graphics/Industry/TownIndustriesTab.png")]
		public static const TownIndustriesTab:Class;
		[Embed(source = "../Graphics/Industry/YourIndustriesTab.png")]
		public static const YourIndustriesTab:Class;
		[Embed(source = "../Graphics/Industry/NewIndustriesTab.png")]
		public static const NewIndustriesTab:Class;
		
		[Embed(source = "../Graphics/Industry/BuyTownBtn.png")]
		public static const BuyIndustryBtn:Class;
		[Embed(source = "../Graphics/Industry/InspectTownBtn.png")]
		public static const InspectIndustryBtn:Class;
		[Embed(source = "../Graphics/Industry/CreateTownBtn.png")]
		public static const CreateIndustryBtn:Class;
		
		[Embed(source = "../Graphics/Industry/industryBakery.png")]
		public static const IndustryBakery:Class;
		[Embed(source = "../Graphics/Industry/industryCattle.png")]
		public static const IndustryCattleBreeding:Class;
		[Embed(source = "../Graphics/Industry/industryClothes.png")]
		public static const IndustryClothesProduction:Class;
		[Embed(source = "../Graphics/Industry/industryForage.png")]
		public static const IndustryForagePlantation:Class;
		[Embed(source = "../Graphics/Industry/industryJeweller.png")]
		public static const IndustryJeweller:Class;
		[Embed(source = "../Graphics/Industry/industryPotterer.png")]
		public static const IndustryPotterer:Class;
		[Embed(source = "../Graphics/Industry/industryStoneMason.png")]
		public static const IndustryStoneMason:Class;
		[Embed(source = "../Graphics/Industry/industryWater.png")]
		public static const IndustryWaterWell:Class;
		[Embed(source = "../Graphics/Industry/industryWheat.png")]
		public static const IndustryWheatPlantation:Class;
		[Embed(source = "../Graphics/Industry/industryWoodCutter.png")]
		public static const IndustryWoodCutter:Class;
		/**********************************/
		
		/*** TradeGood ***/
		/**********************************/
		[Embed(source = "../Graphics/TradeGood/TradeGoodBread.png")]
		public static const TradeGoodBread:Class;
		[Embed(source = "../Graphics/TradeGood/TradeGoodMilk.png")]
		public static const TradeGoodMilk:Class;
		[Embed(source = "../Graphics/TradeGood/TradeGoodWool.png")]
		public static const TradeGoodWool:Class;
		[Embed(source = "../Graphics/TradeGood/TradeGoodMeat.png")]
		public static const TradeGoodMeat:Class;
		[Embed(source = "../Graphics/TradeGood/TradeGoodClothes.png")]
		public static const TradeGoodClothes:Class;
		[Embed(source = "../Graphics/TradeGood/TradeGoodForage.png")]
		public static const TradeGoodForage:Class;
		[Embed(source = "../Graphics/TradeGood/TradeGoodJewelry.png")]
		public static const TradeGoodJewelry:Class;
		[Embed(source = "../Graphics/TradeGood/TradeGoodPottery.png")]
		public static const TradeGoodPottery:Class;
		[Embed(source = "../Graphics/TradeGood/TradeGoodStone.png")]
		public static const TradeGoodStone:Class;
		[Embed(source = "../Graphics/TradeGood/TradeGoodWater.png")]
		public static const TradeGoodWater:Class;
		[Embed(source = "../Graphics/TradeGood/TradeGoodWheat.png")]
		public static const TradeGoodWheat:Class;
		[Embed(source = "../Graphics/TradeGood/TradeGoodWood.png")]
		public static const TradeGoodWood:Class;
		/**********************************/
		
		
		/*** TradeGood Templates ***/
		/**********************************/
		// necessary
		public static var Meat:TradeGood;
		public static var Milk:TradeGood;
		public static var Wheat:TradeGood;
		public static var Bread:TradeGood;
		public static var Water:TradeGood;
		public static var Forage:TradeGood;
		
		// luxury
		public static var Wood:TradeGood;
		public static var Wool:TradeGood;
		public static var Clothes:TradeGood;
		public static var Stone:TradeGood;
		public static var Jewelry:TradeGood;
		public static var Pottery:TradeGood;
		/**********************************/
		
		/*** Industry Templates ***/
		/**********************************/
		// food production
		public static var Bakery:Industry;
		public static var WheatPlantation:Industry;
		public static var CattleBreeding:Industry;
		public static var WaterWell:Industry;
		public static var ForagePlantation:Industry;
		
		// luxury production
		public static var StoneMason:Industry;
		public static var Jeweller:Industry;
		public static var Potterer:Industry;
		public static var WoodCutter:Industry;
		public static var ClothesProduction:Industry;
		/**********************************/
		
		
		
		
		/*** Global Variables ***/
		/**********************************/
		public static var worldObjCounter:int;
		
		public static var gamePaused:Boolean;
		public static var gameSpeed:int;
		public static var gameStage:Stage;
		public static var gameWorld:World;
		
		public static var changeDay:DayChange;
		public static var screenHandle:ScreenHandle;
		
		public static var fontRed:TextFormat;
		public static var fontGreen:TextFormat;
		public static var fontWhite:TextFormat;
		public static var fontCalc:TextFormat;
		public static var font:TextFormat;
		public static var fontTooltip:TextFormat;
		public static var fontUnderlined:TextFormat;
		/**********************************/
		
		
		
		
		private static var gameTextures:Dictionary = new Dictionary();
		
		public static function initializeAssets():void
		{
			//// DEFINE FONTS ////
			
			fontRed = new TextFormat();
			fontRed.size = 30;
			fontRed.font = "Algerian";
			fontRed.leftMargin = 2;
			fontRed.rightMargin = 2;
			fontRed.color = 0xFF0000;
			fontRed.align = TextFormatAlign.LEFT;
			
			fontGreen = new TextFormat();
			fontGreen.size = 30;
			fontGreen.font = "Algerian";
			fontGreen.leftMargin = 2;
			fontGreen.rightMargin = 2;
			fontGreen.color = 0x00FF00;
			fontGreen.align = TextFormatAlign.LEFT;
			
			fontWhite = new TextFormat();
			fontWhite.size = 30;
			fontWhite.font = "Algerian";
			fontWhite.leftMargin = 2;
			fontWhite.rightMargin = 2;
			fontWhite.color = 0xFFFFFF;
			fontWhite.align = TextFormatAlign.LEFT;
			
			fontCalc = new TextFormat();
			fontCalc.size = 45;
			fontCalc.font = "Consolas";
			fontCalc.leftMargin = 2;
			fontCalc.rightMargin = 2;
			fontCalc.color = 0x990000;
			fontCalc.align = TextFormatAlign.RIGHT;
			
			font = new TextFormat();
			font.size = 30;
			font.font = "Algerian";
			font.leftMargin = 2;
			font.rightMargin = 2;
			font.align = TextFormatAlign.LEFT;
			
			fontTooltip = new TextFormat();
			fontTooltip.size = 20;
			fontTooltip.font = "Algerian";
			fontTooltip.align = TextFormatAlign.LEFT;
			
			fontUnderlined = new TextFormat();
			fontUnderlined.size = 30;
			fontUnderlined.font = "Algerian";
			fontUnderlined.underline = true;
			fontUnderlined.align = TextFormatAlign.LEFT;
			
			//// FONTS END ////
			
			initializeGoodsAndIndustries();
			
			gameSpeed = 1; // 1, 2, 4;
			changeDay = new DayChange();
		}
		
		public static function startDayProgress():void
		{
			changeDay.continueProgress();
		}
		
		public static function stopDayProgress():void
		{
			changeDay.stopProgress();
		}
		
		private static function initializeGoodsAndIndustries():void
		{
			/*** TradeGood Templates ***/
			/**********************************/
			// necessary
			Meat = 		new TradeGood(5, 1, "Meat", 	10);
			Milk = 		new TradeGood(5, 1, "Milk", 	10);
			Wheat = 	new TradeGood(5, 1, "Wheat", 	10);
			Bread = 	new TradeGood(5, 1, "Bread", 	10, "People like to eat it. Chomp it, Munch it and even sometimes punch it.");
			Water = 	new TradeGood(5, 1, "Water", 	10);
			Forage = 	new TradeGood(5, 1, "Forage", 	10);
			
			// luxury
			Wood = 		new TradeGood(5, 1, "Wood", 	10);
			Wool = 		new TradeGood(5, 1, "Wool", 	10);
			Clothes = 	new TradeGood(5, 1, "Clothes", 	10);
			Stone = 	new TradeGood(5, 1, "Stone", 	10);
			Jewelry = 	new TradeGood(5, 1, "Jewelry", 	10);
			Pottery = 	new TradeGood(5, 1, "Pottery", 	10);
			/**********************************/
			
			/*** Industry Templates ***/
			/**********************************/
			// food production					Salary, Name,				ProductionFactors,		ConsumingFactors,	Production,								Consumation,					Industry size by default
			Bakery = 				new Industry(10, "Bakery", 				new <int>[10], 			new <int>[10, 20], 	new <TradeGood>[Bread], 				new <TradeGood>[Water, Wheat], 	1);
			WheatPlantation = 		new Industry(10, "WheatPlantation", 	new <int>[30], 			new <int>[100], 	new <TradeGood>[Wheat], 				new <TradeGood>[Water], 		1);
			CattleBreeding = 		new Industry(10, "CattleBreeding", 		new <int>[6, 12, 2], 	new <int>[40, 35], 	new <TradeGood>[Meat, Milk, Wool], 		new <TradeGood>[Water, Forage], 1);
			WaterWell = 			new Industry(10, "WaterWell", 			new <int>[200], 		null, 		 		new <TradeGood>[Water], 				null, 							1);
			ForagePlantation = 		new Industry(10, "ForagePlantation", 	new <int>[70], 			new <int>[100], 	new <TradeGood>[Forage], 				new <TradeGood>[Water], 		1);
			
			// luxury production
			StoneMason = 			new Industry(10, "StoneMason", 			new <int>[25], 			null, 		 		new <TradeGood>[Stone], 				null, 							1);
			Jeweller = 				new Industry(10, "Jeweller", 			new <int>[2], 			null, 		 		new <TradeGood>[Jewelry], 				null, 							1);
			Potterer = 				new Industry(10, "Potterer", 			new <int>[6], 			null, 		 		new <TradeGood>[Pottery], 				null, 							1);
			WoodCutter = 			new Industry(10, "WoodCutter", 			new <int>[15], 			null, 		 		new <TradeGood>[Wood], 					null, 							1);
			ClothesProduction = 	new Industry(10, "ClothesProduction", 	new <int>[4], 			new <int>[40], 		new <TradeGood>[Clothes], 				new <TradeGood>[Wool], 			1);
			/**********************************/
		}
		
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