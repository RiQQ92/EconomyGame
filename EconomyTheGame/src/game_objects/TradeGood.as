package game_objects
{
	import flash.events.MouseEvent;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	
	import ui_objects.Button;
	
	public class TradeGood extends Button
	{
		public var amount:int;
		
		private var price:int;
		
		private var _quality:Number
		private var _goodsName:String;
		private var tooltip:String;
		
		private var amountIndicator:TextField;
		private var qualityCondition:TextField;
		private var tooltipText:TextField;
		
		public function TradeGood(_price:int, _amount:int, _name:String, _Quality:Number = 0.5, _tooltip:String = "")
		{
			_goodsName = _name;
			image = Assets.getTexture("TradeGood"+goodsName);
			
			super();
			
			price = _price;
			amount = _amount;
			_quality = _Quality;
			tooltip = _tooltip;
			
			amountIndicator = new TextField;
			amountIndicator.defaultTextFormat = Assets.fontWhite;
			amountIndicator.selectable = false;
			amountIndicator.mouseEnabled = false;
			
			var temp:String = "";
			if(amount > 1000000)
				temp = (Math.round(amount/1000000)).toString()+"M";
			else if(amount > 10000)
				temp = (Math.round(amount/1000)).toString()+"K";
			else
				temp = amount.toString();
			
			amountIndicator.text = temp;
			amountIndicator.autoSize = TextFieldAutoSize.LEFT;
			amountIndicator.x = this.width/4*3 -5;
			amountIndicator.y = this.height/4*3;
			this.addChild(amountIndicator);
			
			tooltipText = new TextField;
			tooltipText.background = true;
			tooltipText.selectable = false;
			tooltipText.mouseEnabled = false;
			tooltipText.border = true;
			tooltipText.wordWrap = true;
			tooltipText.multiline = true;
			tooltipText.width = 300;
			tooltipText.text = goodsName;
			tooltipText.setTextFormat(Assets.font, 0, goodsName.length);
			tooltipText.autoSize = TextFieldAutoSize.LEFT;
			tooltipText.borderColor = 0xFFFFFF;
			tooltipText.backgroundColor = 0xEC9035;
			
			if(tooltip != "")
			{
				tooltipText.appendText(":\n"+tooltip);
				tooltipText.setTextFormat(Assets.fontUnderlined, 0, goodsName.length);
				tooltipText.setTextFormat(Assets.fontTooltip, goodsName.length, tooltipText.text.length);
			}
			
			if(tooltipText.textWidth < 300)
				tooltipText.width = tooltipText.textWidth+9;
			
			this.addEventListener(MouseEvent.ROLL_OVER, activateTooltip);
			this.addEventListener(MouseEvent.ROLL_OUT, removeTooltip);
		}
		
		public function get quality():Number
		{
			return _quality;
		}

		public function get goodsName():String
		{
			return _goodsName;
		}

		private function activateTooltip(event:MouseEvent):void
		{
			if(tooltipText)
			{
				Assets.gameStage.addChild(tooltipText);
				this.addEventListener(Event.ENTER_FRAME, updateTooltip);
			}
		}
		
		private function removeTooltip(event:MouseEvent):void
		{
			if(tooltipText)
			{
				if(Assets.gameStage.contains(tooltipText))
				{
					Assets.gameStage.removeChild(tooltipText);
					this.removeEventListener(Event.ENTER_FRAME, updateTooltip);
				}
			}
		}
		
		private function updateTooltip(event:Event):void
		{
			if(Assets.gameStage.mouseX + 15 + tooltipText.width < Assets.gameStage.stageWidth)
				tooltipText.x = Assets.gameStage.mouseX+15;
			else
				tooltipText.x = Assets.gameStage.mouseX -tooltipText.width;
			
			if(Assets.gameStage.mouseY + tooltipText.height < Assets.gameStage.stageHeight)
				tooltipText.y = Assets.gameStage.mouseY;
			else
				tooltipText.y = Assets.gameStage.mouseY -tooltipText.height;
		}
		
		public function addGoods(_amount:int): void
		{
			if(_amount > 0)
				this.amount += _amount;
			
			var temp:String = "";
			if(amount > 1000000)
				temp = (Math.round(amount/1000000)).toString()+"M";
			else if(amount > 10000)
				temp = (Math.round(amount/1000)).toString()+"K";
			else
				temp = amount.toString();
			
			amountIndicator.text = temp;
		}
		public function removeGoods(_amount:int): void
		{
			if(_amount <= this.amount && amount > 0)
				this.amount -= _amount;
			
			var temp:String = "";
			if(amount > 1000000)
				temp = (Math.round(amount/1000000)).toString()+"M";
			else if(amount > 10000)
				temp = (Math.round(amount/1000)).toString()+"K";
			else
				temp = amount.toString();
			
			amountIndicator.text = temp;
		}
		public function setAmount(_amount:int):void
		{
			if(_amount > -1)
				this.amount = _amount;
			
			var temp:String = "";
			if(amount > 1000000)
				temp = (Math.round(amount/1000000)).toString()+"M";
			else if(amount > 10000)
				temp = (Math.round(amount/1000)).toString()+"K";
			else
				temp = amount.toString();
			
			amountIndicator.text = temp;
		}
		public function clone(_amount:int = 1):TradeGood
		{
			var t:TradeGood = new TradeGood(price, _amount, goodsName, quality, tooltip);
			
			return t;
		}
		
		public function compareGoods(tradeGood:TradeGood): Boolean
		{
			if(this._goodsName == tradeGood.goodsName)
				if(this._quality == tradeGood.quality)
					return true;
					
			return false;
		}
	}
}