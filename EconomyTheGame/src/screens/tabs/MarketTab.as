package screens.tabs
{
	import ui_objects.Button;
	import screens.TownScreen;
	import ui_objects.ScrollList

	public class MarketTab extends Tab
	{
		private var trade:Button;
		
		private var parentObj:TownScreen;
		
		private var tradegoodList:ScrollList;
		
		public function MarketTab(_parent:TownScreen)
		{
			super();
			
			parentObj = _parent;
			
			initialize();
			draw();
		}
		
		private function initialize():void
		{
			tradegoodList = new ScrollList(590, 400);
			
			
			destructFunc = this.destruct;
			
			addTradegoodsToList();
		}
		
		private function draw():void
		{
			
		}
		
		private function addTradegoodsToList():void
		{
			tradegoodList.clearList();
			
			
			for(var i:int = 0; i < parentObj.town.industries.length; i++)
			{
				// var obj:IndustryMenuObject = new IndustryMenuObject(parentObj.town.industries[i]);
				// industryList.addItem(obj);
				;
			}
		}
	}
}