package game_objects
{
	import flash.text.TextField;
	
	import ui_objects.Button;
	
	public class TradeGood extends Button
	{
		private var price:int;
		private var amount:int;
		private var _productionFactor:int;
		private var _consumingFactor:int;
		
		private var quality:Number
		private var goodsName:String;
		private var qualityCondition:TextField;
		
		public function TradeGood(_price:int, _amount:int, _name:String, productionFactor:int, comsumingFactor:int, _quality:Number = 0.5)
		{
			//super();
			/*
			_productionFactor = productionFactor;
			_consumingFactor = comsumingFactor;
			price = _price;
			amount = _amount;
			quality = _quality;
			name = _name;
			*/
		}
		
		public function get productionFactor():int
		{
			return _productionFactor;
		}

		public function get consumingFactor():int
		{
			return _consumingFactor;
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