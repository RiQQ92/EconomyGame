package ui_objects
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	
	public class ScrollList extends Sprite
	{
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
			
			// set mask for items inside
			
			// add listeners to slide
			// add stage listener for mouse scroll
		}
		
		// this on mouse down, start drage
			// set drag bounds to be locked on another axis, and limited by length of bg bitmap
		
		// gameStage on mouse up, stop drag
		
		// gameStage on mouse scroll, check if mouse over this
			// then scroll list by 1 item -> calculate % amount of whole list
				// and move slide also that much
		
		// update function to check if scrollbar is moved
			// if moved, calculate position 0-100%
				// then set offset number to xxx%* maximum length of list
		
		// public function to addItems to list
		
		// public function to removeItems from list: returns item removed
		
		// private function to set items in corresponding spots
			// array pos * (item average length + gap length)
		
		// private function to calculate item average length
	}
}