package screens.tabs
{
	import flash.events.MouseEvent;
	
	import game_objects.TradeGood;
	
	import screens.TownScreen;
	
	import ui_objects.Button;
	import ui_objects.ScrollList;
	
	import utility.Calculator;

	public class MarketTab extends Tab
	{
		private var trade:Button;
		private var reset:Button;
		
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
			
			trade = new Button("TradeTownBtn");
			trade.addEventListener(MouseEvent.CLICK, apply);
			trade.x = closeBtn.x;
			trade.y = closeBtn.y - 20 - closeBtn.height;
			
			reset = new Button("ResetTownBtn");
			reset.addEventListener(MouseEvent.CLICK, cancel);
			reset.x = trade.x;
			reset.y = trade.y - 20 - trade.height;
			
			parentObj.exitBtn.addEventListener(MouseEvent.CLICK, cancel);
			closeBtn.addEventListener(MouseEvent.CLICK, closeTab);
			
			addTradegoodsToList();
		}
		
		protected function closeTab(event:MouseEvent):void
		{
			cancel();
			
			this.removeChild(townsTradegoodList);
			this.removeChild(playersTradegoodList);
			this.removeChild(tradingTradegoodList);
			this.removeChild(trade);
			this.removeChild(reset);
		}
		
		private function apply(event:MouseEvent):void
		{
			playersTradegoodList.saveChanges();
			townsTradegoodList.saveChanges();
			tradingTradegoodList.clearList();
			
			// save objects into players storage
			Assets.gameWorld.player.goods = new Vector.<TradeGood>;
			for each(var good:TradeGood in playersTradegoodList.itemList)
				Assets.gameWorld.player.goods.push(good);
			
			// save objects into towns storage
			parentObj.town.clearGoods();
			for each(var _good:TradeGood in townsTradegoodList.itemList)
				parentObj.town.addGoods(_good);
		}
		
		private function cancel(evt:MouseEvent = null):void
		{
			playersTradegoodList.cancelChanges();
			townsTradegoodList.cancelChanges();
			tradingTradegoodList.clearList();
		}
		
		private function draw():void
		{
			this.addChild(townsTradegoodList);
			this.addChild(playersTradegoodList);
			this.addChild(tradingTradegoodList);
			this.addChild(trade);
			this.addChild(reset);
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