package screens.tabs
{
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	
	import screens.TownScreen;
	
	import ui_objects.Button;
	import ui_objects.IndustryMenuObject;
	import ui_objects.ScrollList;
	
	import world_objects.Town;

	public class IndustriesTab extends Tab
	{
		private var whichIndustry:String; // "town", "your", "new";
		
		private var yourIndustries:Button;
		private var townIndustries:Button;
		private var newIndustries:Button;
		
		private var create:Button;
		private var inspect:Button;
		private var buy:Button;
		
		private var industries:TextField;
		private var font:TextFormat;
		
		private var parentObj:TownScreen;
		
		private var industryList:ScrollList;
		
		public function IndustriesTab(_parent:TownScreen)
		{
			super();
			
			parentObj = _parent;
			
			font = new TextFormat();
			font.size = 30;
			font.font = "Algerian";
			font.align = TextFormatAlign.CENTER;
			
			industries = new TextField();
			industries.defaultTextFormat = font;
			industries.text = "test";
			
			initialize();
			draw();
		}
		
		private function addIndustriesToList():void
		{
			industryList.clearList();
			
			if(whichIndustry == "town")
			{
				for(var i:int = 0; i < parentObj.town.industries.length; i++)
				{
					var obj:IndustryMenuObject = new IndustryMenuObject(parentObj.town.industries[i]);
					industryList.addItem(obj);
				}
			}
			else if(whichIndustry == "your")
			{
				trace("Your");
			}
			else
			{
				trace(whichIndustry);
			}
		}
		
		private function initialize():void
		{
			whichIndustry = "town";
			
			yourIndustries = new Button("YourIndustriesTab");
			townIndustries = new Button("TownIndustriesTab");
			newIndustries = new Button("NewIndustriesTab");
			
			create = new Button("CreateIndustryBtn");
			create.active = false;
			inspect = new Button("InspectIndustryBtn");
			inspect.active = false;
			buy = new Button("BuyIndustryBtn");
			buy.active = false;
			
			industryList = new ScrollList(590, 400);
			
			yourIndustries.addEventListener(MouseEvent.CLICK, changeList);
			townIndustries.addEventListener(MouseEvent.CLICK, changeList);
			newIndustries.addEventListener(MouseEvent.CLICK, changeList);
			
			industries.selectable = false;
			industries.x = (Assets.gameStage.stageWidth -190)/2 -industries.width/2;
			industries.y = (Assets.gameStage.stageHeight -200)/2 -90;
			industries.autoSize = TextFieldAutoSize.CENTER;
			industries.border = true;
			industries.background = true;
			industries.backgroundColor = 0xEC9035;
			industries.text = "Towns Industries";
			
			industryList.x = (Assets.gameStage.stageWidth -190)/2 -industryList.width/2;
			industryList.y = (Assets.gameStage.stageHeight -200)/2 +200 -industryList.height/2;
			industryList.addEventListener(MouseEvent.CLICK, checkSelection);
			
			townIndustries.x = industryList.x;
			townIndustries.y = industryList.y - townIndustries.height;
			
			yourIndustries.x = townIndustries.x +townIndustries.width -13;
			yourIndustries.y = townIndustries.y;
			
			newIndustries.x = yourIndustries.x +yourIndustries.width -13;
			newIndustries.y = yourIndustries.y;
			
			create.x = closeBtn.x;
			create.y = closeBtn.y -23 -create.height;
			
			inspect.x = create.x;
			inspect.y = create.y -23 -inspect.height;
			
			buy.x = inspect.x;
			buy.y = inspect.y -23 -buy.height;
			
			destructFunc = this.destruct;
			
			addIndustriesToList();
		}
		
		protected function checkSelection(event:MouseEvent):void
		{
			if(whichIndustry == "town" && industryList.selectedTarget != null)
			{
				create.active = false;
				inspect.active = false;
				buy.active = true;
			}
			else if(whichIndustry == "your" && industryList.selectedTarget != null)
			{
				create.active = false;
				inspect.active = true;
				buy.active = false;
			}
			else if(whichIndustry == "new" && industryList.selectedTarget != null)
			{
				create.active = true;
				inspect.active = false;
				buy.active = false;
			}
			else
			{
				create.active = false;
				inspect.active = false;
				buy.active = false;
			}
		}
		
		protected function changeList(event:MouseEvent):void
		{
			create.active = false;
			inspect.active = false;
			buy.active = false;
			
			if(event.target == yourIndustries && whichIndustry != "your")
			{
				whichIndustry = "your";
				industries.text = "Your Industries";
				
				addIndustriesToList();
			}
			else if(event.target == townIndustries && whichIndustry != "town")
			{
				whichIndustry = "town";
				industries.text = "Towns Industries";
				
				addIndustriesToList();
			}
			else if(event.target == newIndustries && whichIndustry != "new")
			{
				whichIndustry = "new";
				industries.text = "Available Industries";
				
				addIndustriesToList();
			}
		}
		
		private function draw():void
		{
			this.addChild(yourIndustries);
			this.addChild(townIndustries);
			this.addChild(newIndustries);
			
			this.addChild(create);
			this.addChild(inspect);
			this.addChild(buy);
			
			this.addChild(industryList);
			this.addChild(industries);
		}
		
		private function removeListeners():void
		{
			yourIndustries.removeEventListener(MouseEvent.CLICK, changeList);
			townIndustries.removeEventListener(MouseEvent.CLICK, changeList);
			newIndustries.removeEventListener(MouseEvent.CLICK, changeList);
		}
		
		override public function destruct():void
		{
			removeListeners();
			
			this.removeChild(yourIndustries);
			yourIndustries.destruct();
			this.removeChild(townIndustries);
			townIndustries.destruct();
			this.removeChild(newIndustries);
			newIndustries.destruct();
			
			this.removeChild(create);
			create.destruct();
			this.removeChild(inspect);
			inspect.destruct();
			this.removeChild(buy);
			buy.destruct();
			
			industryList.clearList();
			this.removeChild(industryList);
			this.removeChild(industries);
			
			industryList = null;
			industries = null;
			
			super.destruct();
			
			parentObj.clearTab();
			
			font = null;
			parentObj = null;
			
			if(this.parent != null)
				this.parent.removeChild(this);
		}
	}
}