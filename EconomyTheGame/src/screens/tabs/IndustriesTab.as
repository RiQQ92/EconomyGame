package screens.tabs
{
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	import flash.text.TextFieldAutoSize;
	
	import ui_objects.Button;
	import ui_objects.ScrollList;

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
		
		private var industryList:ScrollList;
		
		public function IndustriesTab()
		{
			super();
			
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
				
			}
			else if(whichIndustry == "your")
			{
				
			}
			else
			{
				
			}
		}
		
		private function initialize():void
		{
			whichIndustry = "";
			
			yourIndustries = new Button();
			townIndustries = new Button();
			newIndustries = new Button();
			
			create = new Button();
			inspect = new Button();
			buy = new Button();
			
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
			industries.text = "Available Industries";
			
			industryList.x = (Assets.gameStage.stageWidth -190)/2 -industryList.width/2;
			industryList.y = (Assets.gameStage.stageHeight -200)/2 +200 -industryList.height/2;
		}
		
		protected function changeList(event:MouseEvent):void
		{
			if(event.target == yourIndustries)
			{
				whichIndustry = "your";
				industries.text = "Your Industries";
				// activate inspect button, deactivate others
			}
			else if(event.target == townIndustries)
			{
				whichIndustry = "town";
				industries.text = "Towns Industries";
				// activate buy button, deactivate others
			}
			else
			{
				whichIndustry = "new";
				industries.text = "Available Industries";
				// activate create button, deactivate others
			}
			
			addIndustriesToList();
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
	}
}