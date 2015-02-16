package screens.tabs
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	
	import ui_objects.Button;
	
	public class Tab extends Sprite
	{
		protected var bg:Bitmap;
		protected var closeBtn:Button;
		
		public function Tab()
		{
			super();
			
			closeBtn = new Button("CloseTownBtn");
		}
	}
}