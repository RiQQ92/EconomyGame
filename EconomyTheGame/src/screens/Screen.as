package screens
{
	import flash.display.Bitmap;
	
	import ui_objects.Item;
	
	import utility.ScreenHandle;
	
	public class Screen extends Item
	{
		private var screenHandle:ScreenHandle;
		protected var overlay:Bitmap;
		
		public function Screen()
		{
			super();
			
			screenHandle = Assets.screenHandle;
		}
		
		protected function changeScreen(str:String):void
		{
			screenHandle.inScreen = str;
		}
		
		override public function destruct():void
		{
			if(overlay != null)
				if(this.contains(overlay))
					this.removeChild(overlay);
			
			if(overlay != null)
				overlay = null;
			
			screenHandle = null;
			
			super.destruct();
		}
	}
}