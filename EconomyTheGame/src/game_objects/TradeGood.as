package game_objects
{
	import flash.text.TextField;
	
	import ui_objects.Button;
	
	public class TradeGood extends Button
	{
		private var price:int;
		private var amount:int;
		private var quality:Number
		private var name:String;
		private var qualityCondition:TextField;
		
		public function TradeGood(_price:int, _amount:int, _name:String, _quality:Number = 0.5)
		{
			super();
			
			price = _price;
			amount = _amount;
			quality = _quality;
			name = _name;
		}
		
		public function addGoods(_amount:int): void
		{
			if(_amount > 0)
				this.amount += _amount;
		}
		public function removeGoods(_amount:int): void
		{
			if(_amount <= this.amount && amount > 0)
				this.amount -= _amount;
		}
		
		public function compareGoods(tradeGood:TradeGood): Boolean
		{
			if(this.name == tradeGood.name)
				if(this.quality == tradeGood.quality)
					return true;
					
			return false;
		}
	}
}