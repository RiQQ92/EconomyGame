package ui_objects
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	
	public class Item extends Sprite
	{
		protected var image: Bitmap;
		
		// fill me up!
		public function destruct():void
		{
			if(image != null)
				if(this.contains(image))
					this.removeChild(image);
			
			if(image != null)
				image = null;
		}
	}
}