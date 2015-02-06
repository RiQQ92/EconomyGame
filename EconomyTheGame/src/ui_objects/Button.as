package ui_objects
{
	import flash.events.MouseEvent;

	public class Button extends Item
	{
		protected var func:Function;
		protected var doesHighlight:Boolean;
		
		public function Button(graphic:String = "Null", _doesHighlight:Boolean = true)
		{
			super();
			doesHighlight = _doesHighlight;
			this.buttonMode = true;
			
			if(doesHighlight)
			{
				this.addEventListener(MouseEvent.MOUSE_DOWN, darken);
				this.addEventListener(MouseEvent.MOUSE_OVER, lighten);
				this.addEventListener(MouseEvent.MOUSE_OUT, normalize);
			}
		}
		
		protected function normalize(event:MouseEvent):void
		{
			
		}
		
		protected function darken(event:MouseEvent):void
		{
			
		}
		
		protected function lighten(event:MouseEvent):void
		{
			
		}
		
		protected function addListener(_func:Function):void
		{
			func = _func;
			this.addEventListener(MouseEvent.CLICK, func);
		}
	}
}