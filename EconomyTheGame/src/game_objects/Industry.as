package game_objects
{
	import flash.display.Bitmap;
	
	import ui_objects.Item;
	
	import world_objects.Town;
	
	public class Industry extends Item
	{
		public var industryName:String;
		public var logo:Bitmap;
		
		private var _defWage:int;
		private var _size:int;
		private var _upgradeAmount:Number; // 0 - 1.0
		
		private var town:Town;
		
		private var _productYield:Vector.<TradeGood>;
		private var _productConsumed:Vector.<TradeGood>;
		private var _storage:Vector.<TradeGood>;
		
		public function Industry(_DefWage:int, _Name:String, _ProductYield:Vector.<TradeGood>, _ProductConsumed:Vector.<TradeGood> = null, _Size:int = 1)
		{
			super();
			industryName = _Name;
			logo = Assets.getTexture("Industry"+industryName);
			_defWage = _DefWage;
			_productYield = _ProductYield;
			_productConsumed = _ProductConsumed;
			_size = _Size;
			_upgradeAmount = 0.0;
		}
		
		public function get storage():Vector.<TradeGood>
		{
			return _storage;
		}

		public function get productConsumed():Vector.<TradeGood>
		{
			return _productConsumed;
		}

		public function get productYield():Vector.<TradeGood>
		{
			return _productYield;
		}

		public function get upgradeAmount():Number
		{
			return _upgradeAmount;
		}

		public function get size():int
		{
			return _size;
		}

		public function get defWage():int
		{
			return _defWage;
		}

		public function launch():Boolean
		{
			if(town == null)
				return false;
			
			return true;
		}
		
		public function clone():Industry
		{
			var i:Industry = new Industry(defWage, industryName, productYield, productConsumed, size);
			
			return i;
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