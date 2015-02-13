package world_objects
{
	import flash.display.Bitmap;
	import flash.text.TextField;
	
	import game_objects.Industry;
	import game_objects.TradeGood;

	public class Town extends WorldObject
	{
		private var size: int
		private var wealth: int
		private var taxation: int //0..60
		private var growthProgress: Number
		private var cityName:String
		private var sign:TextField;
		private var bigPicture:Bitmap;
		private var industries:Vector.<Industry>; //Industry[]
		private var tradeGoods:Vector.<TradeGood>; //TradeGood[]
		//private var stats: Statistics
		
		public function Town()
		{
			image = Assets.getTexture("TownImage");
			
			super();
			
			buttonMode = false;
			mouseEnabled = false;
			
			initialize();
			draw();
		}
		
		private function initialize():void
		{
			// TODO Auto Generated method stub
			
		}
		
		private function draw():void
		{
			this.addChild(image);
		}
		
		private function collectTaxes(): int
		{
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