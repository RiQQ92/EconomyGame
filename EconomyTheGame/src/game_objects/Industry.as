package game_objects
{
	import flash.display.Bitmap;
	
	import ui_objects.Item;
	
	import world_objects.Town;
	
	public class Industry extends Item
	{
		private var defWage:int;
		private var size:int;
		private var upgradeAmount:Number;
		private var industryName:String;
		
		private var logo:Bitmap;
		private var town:Town;
		
		private var productYield:TradeGood;
		private var productConsumed:TradeGood;
		private var storage:Vector.<TradeGood>;
		
		public function Industry(defWage:int, name:String, productYield:Vector.<TradeGood>, productConsumed:Vector.<TradeGood> = null, size:int = 1)
		{
			super();
		}
		
		private function checkGoods():Boolean
		{
			return true;
		}
		
		private function payWages():void
		{
			
		}
		
		private function produce():void
		{
			
		}
	}
}