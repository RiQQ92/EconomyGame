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
			
			if(size < 250)
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
			wealth = Math.ceil(Math.random()*(size-size/2))+(size/2) *2;
			
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
			assignTradegoods();
		}
		
		private function assignIndustries():void
		{
			_industries = new Vector.<Industry>();
			_industries.push(Assets.Bakery.clone());
			_industries.push(Assets.WheatPlantation.clone());
			_industries.push(Assets.ClothesProduction.clone());
			_industries.push(Assets.ForagePlantation.clone());
			_industries.push(Assets.WoodCutter.clone());
			
			// Create random generator for industries
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
		
		private function assignTradegoods():void
		{
			_tradeGoods = new Vector.<TradeGood>();
			
			// loop all towns industries
			for(var i:int = 0; i < _industries.length; i++)
			{
				// loop all industries and give wealth * townSize amount of industries output TradeGoods plus half of the consuming TradeGoods
				var factor:int = 0;
				// loop i:th industrys yielding
				for each(var product:TradeGood in _industries[i].productYield)
				{
					var found1:Boolean = false;
					// loop through tradegoods already on list
					for each(var tradegood1:TradeGood in _tradeGoods)
						// to check if it has already same tradegood
						if(product.compareGoods(tradegood1))
						{
							// if does, add just amount in it
							tradegood1.addGoods(wealth*size*_industries[i].productionFactor[factor] /4 /100);
							found1 = true;
							break;
						}
					
					if(!found1)
					{
						_tradeGoods.push(product.clone(wealth*size*_industries[i].productionFactor[factor] /4 /100));
					}
					factor++;
				}
				factor = 0;
				for each(var consumedProduct:TradeGood in _industries[i].productConsumed)
				{
					var found2:Boolean = false;
					for each(var tradegood2:TradeGood in _tradeGoods)
						if(consumedProduct.compareGoods(tradegood2))
						{
							tradegood2.addGoods((wealth*size*_industries[i].consumingFactor[factor] /4 /100)/2);
							found2 = true;
							break;
						}
						
					if(!found2)
					{
						_tradeGoods.push(consumedProduct.clone((wealth*size*_industries[i].consumingFactor[factor] /4 /100)/2));
					}
					factor++;
				}
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