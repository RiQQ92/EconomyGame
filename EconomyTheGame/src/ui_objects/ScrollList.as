package ui_objects
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class ScrollList extends Sprite
	{
		private var isVertical:Boolean;
		
		private var scrollListWidth:int;
		private var scrollListHeight:int;
		
		private var listMaxLength:Number;
		
		private var mask:Bitmap;
		private var bg:Bitmap;
		
		private var slide:Button;
		
		private var itemList:Array;
		
		public function ScrollList()
		{
			super();
			
			//bg = Assets.getTexture("");
			//mask.bitmapData = bg.bitmapData.clone();
			
			slide = new Button("SlidePull");
			slide.addEventListener(MouseEvent.MOUSE_DOWN, drag);
			slide.addEventListener(MouseEvent.MOUSE_UP, drop);
			slide.addEventListener(Event.ENTER_FRAME, update);
			this.addEventListener(MouseEvent.MOUSE_WHEEL, scroll);
			
			// set mask for items inside
		}
		
		private function drag(event:MouseEvent):void
		{
			// this on mouse down, start drage
				// set drag bounds to be locked on another axis, and limited by length of bg bitmap
		}
		
		private function drop(event:MouseEvent):void
		{
			// gameStage on mouse up, stop drag
		}
		
		private function scroll(event:MouseEvent):void
		{
			// gameStage on mouse scroll, check if mouse over this
				// then scroll list by 1 item -> calculate % amount of whole list
					// and move slide also that much
		}
		
		private function update(event:Event):void
		{
			// if moved, calculate position 0-100%
			// then set offset number to xxx%* maximum length of list
		}	
		
		private function setAllItemsPos():void
		{
			// private function to set items in corresponding spots
			// array pos * (item average length + gap length)
		}
		
		private function calcItemAverageLength():int
		{
			var avrLength:int = 0;
			// private function to calculate item average length
			for(var i:int = 0; i < itemList.length; i++)
			{
				if(isVertical)
					avrLength += itemList[i].height;
				else
					avrLength += itemList[i].width;
			}
			
			return avrLength;
		}
		
		public function addItem(_item:*):void
		{
			
		}
		
		public function removeItem(_index:int):*
		{
			var _item:*;
			
			return _item;
		}
	}
}