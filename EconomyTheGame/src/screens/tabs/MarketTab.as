package screens.tabs
{
	import game_objects.TradeGood;
	
	import screens.TownScreen;
	
	import ui_objects.Button;
	import ui_objects.ScrollList;
	
	import utility.Calculator;

	public class MarketTab extends Tab
	{
		private var trade:Button;
		
		private var parentObj:TownScreen;
		
		private var townsTradegoodList:ScrollList;
		private var playersTradegoodList:ScrollList;
		private var tradingTradegoodList:ScrollList;
		
		public function MarketTab(_parent:TownScreen)
		{
			super();
			
			parentObj = _parent;
			
			initialize();
			draw();
		}
		
		private function initialize():void
		{
			tradingTradegoodList = new ScrollList(200, 400, true, true, true, playersTradegoodList);
			tradingTradegoodList.x = (Assets.gameStage.stageWidth -190)/2 -tradingTradegoodList.width/2;
			tradingTradegoodList.y = (Assets.gameStage.stageHeight -200)/2 +200 -tradingTradegoodList.height/2;
			
			playersTradegoodList = new ScrollList(200, 400, true, true, false, tradingTradegoodList);
			playersTradegoodList.x = (Assets.gameStage.stageWidth -190)/2 -200 -playersTradegoodList.width/2;
			playersTradegoodList.y = (Assets.gameStage.stageHeight -200)/2 +200 -playersTradegoodList.height/2;
			
			townsTradegoodList = new ScrollList(200, 400, true, true, false, tradingTradegoodList);
			townsTradegoodList.x = (Assets.gameStage.stageWidth -190)/2 +200 -townsTradegoodList.width/2;
			townsTradegoodList.y = (Assets.gameStage.stageHeight -200)/2 +200 -townsTradegoodList.height/2;
			
			destructFunc = this.destruct;
			
			addTradegoodsToList();
		}
		
		private function draw():void
		{
			this.addChild(townsTradegoodList);
			this.addChild(playersTradegoodList);
			this.addChild(tradingTradegoodList);
		}
		
		private function addTradegoodsToList():void
		{
			// add towns tradegoods to buy option list
			townsTradegoodList.clearList();
			for(var i:int = 0; i < parentObj.town.tradeGoods.length; i++)
			{
				var obj:TradeGood = parentObj.town.tradeGoods[i];
				townsTradegoodList.addItem(obj);
			}
			
			// add players tradegoods to sell option list
			playersTradegoodList.clearList();
			for(i = 0; i < Assets.gameWorld.player.goods.length; i++)
			{
				var obj1:TradeGood = Assets.gameWorld.player.goods[i];
				playersTradegoodList.addItem(obj1);
			}
		}
	}
}