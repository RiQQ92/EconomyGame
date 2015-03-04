package screens
{
	import flash.events.MouseEvent;
	
	import screens.tabs.IndustriesTab;
	import screens.tabs.MarketTab;
	import screens.tabs.StatisticsTab;
	
	import ui_objects.Button;
	
	import world_objects.Town;

	public class TownScreen extends Screen
	{
		public var town:Town;
		
		private var marketTabBtn:Button;
		private var industriesTabBtn:Button;
		private var statisticsTabBtn:Button;
		
		private var exitBtn:Button;
		
		private var currentTab:*;
		
		public function TownScreen(_town:Town)
		{
			super();
			
			town = _town;
			
			initialize();
			draw();
		}
		
		private function initialize():void
		{
			image = Assets.getTexture("MainTownScreen");
			
			marketTabBtn = new Button("MarketTownBtn");
			marketTabBtn.x = 20;
			marketTabBtn.y = 15;
			
			industriesTabBtn = new Button("IndustriesTownBtn");
			industriesTabBtn.x = marketTabBtn.x + marketTabBtn.width + 35;
			industriesTabBtn.y = marketTabBtn.y;
			
			statisticsTabBtn = new Button("StatisticsTownBtn");
			statisticsTabBtn.x = industriesTabBtn.x + industriesTabBtn.width +35;
			statisticsTabBtn.y = marketTabBtn.y;
			
			exitBtn = new Button("ExitTownBtn");
			exitBtn.x = Assets.gameStage.stageWidth - exitBtn.width -10;
			exitBtn.y = statisticsTabBtn.y + statisticsTabBtn.height + 30;
			
			marketTabBtn.addEventListener(MouseEvent.CLICK, openMarketTab);
			industriesTabBtn.addEventListener(MouseEvent.CLICK, openIndustriesTab);
			statisticsTabBtn.addEventListener(MouseEvent.CLICK, openStatisticsTab);
			exitBtn.addEventListener(MouseEvent.CLICK, close);
		}
		
		protected function openMarketTab(event:MouseEvent):void
		{
			if(!(currentTab is MarketTab))
			{
				if(currentTab != null)
				{
					if(this.contains(currentTab))
					{
						this.removeChild(currentTab);
						currentTab = null;
						currentTab = new MarketTab();
					}
				}
				
				currentTab = new MarketTab();
				this.addChild(currentTab);
			}
		}
		
		protected function openIndustriesTab(event:MouseEvent):void
		{
			if(!(currentTab is IndustriesTab))
			{
				var found:Boolean = false;
				if(currentTab != null)
				{
					if(this.contains(currentTab))
					{
						this.removeChild(currentTab);
						currentTab = null;
						currentTab = new IndustriesTab(this);
					}
				}
				if(!found)
				{
					currentTab = new IndustriesTab(this);
					this.addChild(currentTab);
				}
			}
		}
		
		protected function openStatisticsTab(event:MouseEvent):void
		{
			if(!(currentTab is StatisticsTab))
			{
				if(currentTab != null)
				{
					if(this.contains(currentTab))
					{
						this.removeChild(currentTab);
						currentTab = null;
						currentTab = new StatisticsTab();
					}
				}
				
				currentTab = new StatisticsTab();
				this.addChild(currentTab);
			}
		}
		
		private function draw():void
		{
			this.addChild(image);
			this.addChild(marketTabBtn);
			this.addChild(industriesTabBtn);
			this.addChild(statisticsTabBtn);
			this.addChild(exitBtn);
		}
		
		public function clearTab():void
		{
			currentTab = null;
		}
		
		private function close(event:MouseEvent):void
		{
			destruct();
		}
		
		private function removeListeners():void
		{
			exitBtn.removeEventListener(MouseEvent.CLICK, close);
		}
		
		override public function destruct():void
		{
			removeListeners();
			
			this.removeChild(marketTabBtn);
			this.removeChild(industriesTabBtn);
			this.removeChild(statisticsTabBtn);
			this.removeChild(exitBtn);
			
			super.destruct();
			
			this.parent.removeChild(this);
		}
	}
}