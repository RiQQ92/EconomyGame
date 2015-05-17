package utility
{
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	
	import ui_objects.Button;
	import ui_objects.Item;
	
	public class Calculator extends Item
	{
		private var isMultiplying:Boolean;
		
		private var amount:int;
		private var maxAmount:int;
		private var multiplier:int;
		private var display:TextField;
		
		private var exit:Button;
		
		private var btn1:Button;
		private var btn2:Button;
		private var btn3:Button;
		private var btn4:Button;
		private var btn5:Button;
		private var btn6:Button;
		private var btn7:Button;
		private var btn8:Button;
		private var btn9:Button;
		private var btn0:Button;
		
		private var btnDel:Button;
		private var btnX:Button;
		private var btnClear:Button;
		private var btnMax:Button;
		private var btnEnter:Button;
		
		private var btnPlus1:Button;
		private var btnPlus10:Button;
		private var btnPlus100:Button;
		private var btnPlus1000:Button;
		
		private var btnMinus1:Button;
		private var btnMinus10:Button;
		private var btnMinus100:Button;
		private var btnMinus1000:Button;
		
		private var funcCall:Function;
		
		public function Calculator(function2Call:Function, _maxAmount:int = 0)
		{
			super();
			
			funcCall = function2Call;
			maxAmount = _maxAmount;
			
			initialize();
			draw();
		}
		
		private function initialize():void
		{
			isMultiplying = false;
			
			amount = 0;
			multiplier = 0;
			
			display = new TextField();
			display.defaultTextFormat = Assets.fontCalc;
			display.text = "0";
			display.width = 320;
			display.height = 55;
			display.mouseEnabled = false;
			
			//// DEFINE OBJECTS ////
			
			image = Assets.getTexture("CalculatorBG");
			exit = new Button("ExitWorldBtn");
			
			btn1 = new Button("Calculator1");
			btn2 = new Button("Calculator2");
			btn3 = new Button("Calculator3");
			btn4 = new Button("Calculator4");
			btn5 = new Button("Calculator5");
			btn6 = new Button("Calculator6");
			btn7 = new Button("Calculator7");
			btn8 = new Button("Calculator8");
			btn9 = new Button("Calculator9");
			btn0 = new Button("Calculator0");
			
			btnDel = new Button("CalculatorDel");
			btnX = new Button("CalculatorX");
			btnClear = new Button("CalculatorClear");
			btnMax = new Button("CalculatorMax");
			btnEnter = new Button("CalculatorEnter");
			
			btnPlus1 = new Button("CalculatorPlus1");
			btnPlus10 = new Button("CalculatorPlus10");
			btnPlus100 = new Button("CalculatorPlus100");
			btnPlus1000 = new Button("CalculatorPlus1000");
			
			btnMinus1 = new Button("CalculatorMinus1");
			btnMinus10 = new Button("CalculatorMinus10");
			btnMinus100 = new Button("CalculatorMinus100");
			btnMinus1000 = new Button("CalculatorMinus1000");
			
			//// POSITION OBJECTS ////
			
			exit.x = image.width - exit.width;
			
			btn1.x = image.width/2 - btn1.width -btn1.width/2 -5;
			btn1.y = 125;
			btn2.x = btn1.x + btn1.width +5;
			btn2.y = btn1.y;
			btn3.x = btn2.x + btn2.width +5;
			btn3.y = btn1.y;
			btn4.x = btn1.x;
			btn4.y = btn1.y + btn1.height + 10;
			btn5.x = btn2.x;
			btn5.y = btn4.y;
			btn6.x = btn3.x;
			btn6.y = btn4.y;
			btn7.x = btn1.x;
			btn7.y = btn4.y + btn4.height + 10;
			btn8.x = btn2.x;
			btn8.y = btn7.y;
			btn9.x = btn3.x;
			btn9.y = btn7.y;
			btn0.x = btn2.x;
			btn0.y = btn7.y + btn7.height + 10;
			
			btnDel.x = btn1.x;
			btnDel.y = btn0.y;
			btnX.x = btn3.x;
			btnX.y = btn0.y;
			btnClear.x = image.width/2 -5 -btnClear.width;
			btnClear.y = btn0.y + btn0.height +10;
			btnMax.x = image.width/2 +5;
			btnMax.y = btnClear.y;
			btnEnter.x = image.width/2 -btnEnter.width/2;
			btnEnter.y = btnClear.y + btnClear.height +10;
			
			btnPlus1.x = btn3.x + btn3.width +5;
			btnPlus1.y = btn1.y;
			btnPlus10.x = btnPlus1.x;
			btnPlus10.y = btn4.y;
			btnPlus100.x = btnPlus1.x;
			btnPlus100.y = btn7.y;
			btnPlus1000.x = btnPlus1.x;
			btnPlus1000.y = btn0.y;
			
			btnMinus1.x = btn1.x -5 -btnMinus1.width;
			btnMinus1.y = btn1.y;
			btnMinus10.x = btnMinus1.x;
			btnMinus10.y = btn4.y;
			btnMinus100.x = btnMinus1.x;
			btnMinus100.y = btn7.y;
			btnMinus1000.x = btnMinus1.x;
			btnMinus1000.y = btn0.y;
			
			display.x = btnMinus1.x +20;
			display.y = 35;
			
			//// ADD LISTENERS & XTRA DATA ////
			
			exit.addListener(destruct);
			
			btn1.setExtraData("numValue", 1);
			btn1.addListener(manipulateValue);
			btn2.setExtraData("numValue", 2);
			btn2.addListener(manipulateValue);
			btn3.setExtraData("numValue", 3);
			btn3.addListener(manipulateValue);
			btn4.setExtraData("numValue", 4);
			btn4.addListener(manipulateValue);
			btn5.setExtraData("numValue", 5);
			btn5.addListener(manipulateValue);
			btn6.setExtraData("numValue", 6);
			btn6.addListener(manipulateValue);
			btn7.setExtraData("numValue", 7);
			btn7.addListener(manipulateValue);
			btn8.setExtraData("numValue", 8);
			btn8.addListener(manipulateValue);
			btn9.setExtraData("numValue", 9);
			btn9.addListener(manipulateValue);
			btn0.setExtraData("numValue", 0);
			btn0.addListener(manipulateValue);
			
			btnDel.setExtraData("numValue", -1);
			btnDel.addListener(manipulateValue);
			btnX.addListener(toggleMultiply);
			btnClear.addListener(clearValue);
			btnMax.addListener(maxValue);
			btnEnter.addListener(enterPress);
			
			btnPlus1.setExtraData("numValue", 1);
			btnPlus1.addListener(increaseDecreaseValue);
			btnPlus10.setExtraData("numValue", 10);
			btnPlus10.addListener(increaseDecreaseValue);
			btnPlus100.setExtraData("numValue", 100);
			btnPlus100.addListener(increaseDecreaseValue);
			btnPlus1000.setExtraData("numValue", 1000);
			btnPlus1000.addListener(increaseDecreaseValue);
			
			btnMinus1.setExtraData("numValue", -1);
			btnMinus1.addListener(increaseDecreaseValue);
			btnMinus10.setExtraData("numValue", -10);
			btnMinus10.addListener(increaseDecreaseValue);
			btnMinus100.setExtraData("numValue", -100);
			btnMinus100.addListener(increaseDecreaseValue);
			btnMinus1000.setExtraData("numValue", -1000);
			btnMinus1000.addListener(increaseDecreaseValue);
		}
		
		private function enterPress(evt:MouseEvent):void
		{
			if(isMultiplying)
			{
				amount *= multiplier;
				multiplier = 0;
				isMultiplying = false;
				updateDisplay();
			}
			else
			{
				funcCall(amount);
				destruct();
			}
		}
		
		private function clearValue(evt:MouseEvent):void
		{
			if(isMultiplying)
			{
				multiplier = 0;
			}
			else
			{
				amount = 0;
			}
			updateDisplay();
		}
		
		private function maxValue(evt:MouseEvent):void
		{
			amount = maxAmount;
			multiplier = 0;
			isMultiplying = false;
			updateDisplay();
		}
		
		private function increaseDecreaseValue(evt:MouseEvent):void
		{
			var numValue:* = evt.target.getExtraData("numValue");
			if(isMultiplying)
			{
				multiplier += numValue;
			}
			else
			{
				amount += numValue;
			}
			updateDisplay();
		}
		
		private function toggleMultiply(evt:MouseEvent):void
		{
			isMultiplying = !isMultiplying;
			multiplier = 0;
			updateDisplay();
		}
		
		private function manipulateValue(evt:MouseEvent):void
		{
			var numValue:* = evt.target.getExtraData("numValue");
			var isDel:Boolean = numValue == -1;
			if(isMultiplying)
			{
				if(isDel)
				{
					multiplier = Math.floor(multiplier/10);
				}
				else
				{
					multiplier = multiplier*10 +numValue;
				}
			}
			else
			{
				if(isDel)
				{
					amount = Math.floor(amount/10);
				}
				else
				{
					amount = amount*10 +numValue;
				}
			}
			updateDisplay();
		}
		
		private function updateDisplay():void
		{
			if(amount > maxAmount)
				amount = maxAmount;
			else if(amount < 0)
				amount = 0;
			
			if(multiplier > maxAmount/amount)
				multiplier = Math.floor(maxAmount/amount);
			else if(multiplier < 0)
				multiplier = 0;
			
			var tempAmount:String = "";
			if(amount > 10000000)
				tempAmount = (Math.round(amount/1000000)).toString()+"M";
			else if(amount > 10000)
				tempAmount = (Math.round(amount/1000)).toString()+"K";
			else
				tempAmount = amount.toString();
			
			
			if(isMultiplying)
			{
				var tempMultiplier:String = "";
				if(multiplier > 10000000)
					tempMultiplier = (Math.round(multiplier/1000000)).toString()+"M";
				else if(multiplier > 10000)
					tempMultiplier = (Math.round(multiplier/1000)).toString()+"K";
				else
					tempMultiplier = multiplier.toString();
				
				display.text = tempAmount+ "x" +tempMultiplier;
			}
			else
			{
				display.text = tempAmount;
			}
		}
		
		private function draw():void
		{
			this.addChild(image);
			this.addChild(exit);
			this.addChild(display);
			
			this.addChild(btn1);
			this.addChild(btn2);
			this.addChild(btn3);
			this.addChild(btn4);
			this.addChild(btn5);
			this.addChild(btn6);
			this.addChild(btn7);
			this.addChild(btn8);
			this.addChild(btn9);
			this.addChild(btn0);

			this.addChild(btnDel);
			this.addChild(btnX);
			this.addChild(btnClear);
			this.addChild(btnMax);
			this.addChild(btnEnter);

			this.addChild(btnPlus1);
			this.addChild(btnPlus10);
			this.addChild(btnPlus100);
			this.addChild(btnPlus1000);

			this.addChild(btnMinus1);
			this.addChild(btnMinus10);
			this.addChild(btnMinus100);
			this.addChild(btnMinus1000);
		}
		
		override public function destruct(evt:Event = null):void
		{
			super.destruct(evt);
			
			this.removeChild(exit);
			this.removeChild(display);
			
			this.removeChild(btn1);
			this.removeChild(btn2);
			this.removeChild(btn3);
			this.removeChild(btn4);
			this.removeChild(btn5);
			this.removeChild(btn6);
			this.removeChild(btn7);
			this.removeChild(btn8);
			this.removeChild(btn9);
			this.removeChild(btn0);
			
			this.removeChild(btnDel);
			this.removeChild(btnX);
			this.removeChild(btnClear);
			this.removeChild(btnMax);
			this.removeChild(btnEnter);
			
			this.removeChild(btnPlus1);
			this.removeChild(btnPlus10);
			this.removeChild(btnPlus100);
			this.removeChild(btnPlus1000);
			
			this.removeChild(btnMinus1);
			this.removeChild(btnMinus10);
			this.removeChild(btnMinus100);
			this.removeChild(btnMinus1000);
			
			if(this)
				if(this.parent)
					if(this.parent.contains(this))
						this.parent.removeChild(this);
		}
	}
}