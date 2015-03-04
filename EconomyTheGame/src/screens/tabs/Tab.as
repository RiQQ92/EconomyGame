package screens.tabs
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	import ui_objects.Button;
	
	public class Tab extends Sprite
	{
		protected var bg:Bitmap;
		protected var closeBtn:Button;
		protected var destructFunc:Function;
		
		public function Tab()
		{
			super();
			
			closeBtn = new Button("CloseTownBtn");
			closeBtn.x = Assets.gameStage.stageWidth -10 -closeBtn.width;
			closeBtn.y = Assets.gameStage.stageHeight -13 -closeBtn.height;
			this.addChild(closeBtn);
			
			closeBtn.addEventListener(MouseEvent.CLICK, close);
		}
		
		protected function close(event:MouseEvent):void
		{
			if(destructFunc != null)
				destructFunc();
		}
		
		public function destruct():void
		{
			closeBtn.removeEventListener(MouseEvent.CLICK, close);
			destructFunc = null;
			
			if(bg != null)
				if(this.contains(bg))
					this.removeChild(bg);
			bg = null;
			
			if(closeBtn != null)
				if(this.contains(closeBtn))
					this.removeChild(closeBtn);
			closeBtn = null;
		}
	}
}