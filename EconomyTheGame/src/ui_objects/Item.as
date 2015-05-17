package ui_objects
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class Item extends Sprite
	{
		protected var image: Bitmap;
		
		public function Item()
		{
			//this.addEventListener(Event.REMOVED, destruct);
		}
		
		public function destruct(evt:Event = null):void
		{
			//this.removeEventListener(Event.REMOVED, destruct);
			
			if(image != null)
				if(this.contains(image))
					this.removeChild(image);
			
			if(image != null)
				image = null;
		}
	}
}