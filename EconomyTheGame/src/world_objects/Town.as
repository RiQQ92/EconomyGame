package world_objects
{
	import flash.display.Bitmap;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	
	import game_objects.Industry;
	import game_objects.TradeGood;
	
	import my.events.MyEvents;

	public class Town extends WorldObject
	{
		private var size:int;
		private var wealth:int;
		private var taxation:int; //0..60
		
		private var growthProgress:Number;
		
		private var title:String = "";
		private var titles:Array = new Array("City","Town","Village");
		
		private var font:TextFormat = new TextFormat();
		private var sign:TextField = new TextField();
		private var bigPicture:Bitmap;
		
		private var _industries:Vector.<Industry>; //Industry[]
		private var _tradeGoods:Vector.<TradeGood>; //TradeGood[]
		
		//private var stats: Statistics
		
		public function Town(_townName:String, _townSize:int)
		{
			image = Assets.getTexture("TownImage");
			
			super();
			
			_worldObjName = _townName;
			size = _townSize;
			
			if(size < 200)
			{
				title = titles[2];
				setScale(0.8);
			}
			else if(size < 500)
			{
				title = titles[1];
				setScale(1);
			}
			else
			{
				title = titles[0];
				setScale(1.2);
			}
			
			font.size = 20;
			font.font = "Algerian";
			font.align = TextFormatAlign.CENTER;
			
			sign.defaultTextFormat = font;
			sign.text = title +" of:\n"+ _worldObjName;
			
			buttonMode = false;
			mouseEnabled = false;
			
			initialize();
			draw();
			
			Assets.changeDay.addEventListener(MyEvents.DAY_CHANGE, collectTaxes);
		}
		
		public function get tradeGoods():Vector.<TradeGood>
		{
			return _tradeGoods;
		}

		public function get industries():Vector.<Industry>
		{
			return _industries;
		}

		private function initialize():void
		{
			sign.selectable = false;
			sign.mouseEnabled = false;
			sign.x = (-200+image.width)/2;
			sign.y = -50;
			sign.width = 200;
			sign.autoSize = TextFieldAutoSize.CENTER;
			sign.border = true;
			sign.background = true;
			sign.backgroundColor = 0xEC9035;
			
			assignIndustries();
		}
		
		private function assignIndustries():void
		{
			_industries = new Vector.<Industry>();
			_industries.push(Assets.Bakery.clone());
			_industries.push(Assets.ClothesProduction.clone());
			_industries.push(Assets.ForagePlantation.clone());
			_industries.push(Assets.WoodCutter.clone());
			
			if(title == titles[0])
			{
				// focus on postProduction
			}
			else if(title == titles[1])
			{
				// have some rawmaterial production and postproduction for these
			}
			else
			{
				// focus on Rawmaterial Production
			}
		}
		
		private function draw():void
		{
			this.addChild(image);
			this.addChild(sign);
		}
		
		private function collectTaxes(evt:Event): int
		{
			trace(_worldObjName+" noticed day change and collecting taxes now!");
			return 1;
		}
		
		private function consumeGoods(): void
		{
			
		}
		
		private function grow(): void
		{
			
		}
		
		private function decrease(): void
		{
			
		}
	}
}