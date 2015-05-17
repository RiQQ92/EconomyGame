package ui_objects
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.ColorTransform;
	import flash.media.Sound;
	import flash.ui.MouseCursor;
	import flash.ui.MouseCursorData;
	
	public class Button extends Item
	{
		private var mouseDown:Boolean = false;
		private var _active:Boolean = true;
		//private var sound:Sound = Assets.getSound("Aani_btnclick");
		private var extraData:Array = new Array();
		
		private var lightier:ColorTransform = new ColorTransform(1.2,1.2,1.2,1);
		private var darker:ColorTransform = new ColorTransform(0.8, 0.8, 0.8, 1);
		private var normal:BitmapData;

		private var clickFunc:Function;
		
		public function get active():Boolean
		{
			return _active;
		}
		
		public function set active(value:Boolean):void
		{
			if(value && !_active)
				setActive();
			else if(!value && _active)
				setInactive();
			
			_active = value;
		}
		
		public function setExtraData(variableName:String, variableValue:*):Boolean
		{
			if(extraData[variableName] == null)
			{
				extraData[variableName] = variableValue;
				
				return true;
			}
			else
				return false;
		}
		
		public function getExtraData(variableName:String):*
		{
			return extraData[variableName];
		}
		
		public function Button(imageName:String = "NoImage", highlights:Boolean = true)
		{
			super();
			
			if(highlights)
			{
				this.addEventListener(MouseEvent.ROLL_OVER, lighten);
				this.addEventListener(MouseEvent.ROLL_OUT, resetColor);
				this.addEventListener(MouseEvent.MOUSE_DOWN, darken);
				Assets.gameStage.addEventListener(MouseEvent.MOUSE_UP, mouseRelease);
			}
			if(image == null)
				image = Assets.getTexture(imageName);
			
			image.x = 0;
			image.y = 0;
			this.addChild(image);
			this.buttonMode = true;
			
			normal = image.bitmapData.clone();
		}
		
		private function resetColor(evt:MouseEvent):void
		{
			image.bitmapData = normal.clone();
		}
		
		private function mouseRelease(evt:MouseEvent):void
		{
			mouseDown = false;
			image.bitmapData = normal.clone();
			if(image.hitTestPoint(Assets.gameStage.mouseX, Assets.gameStage.mouseY))
				image.bitmapData.colorTransform(image.bitmapData.rect, lightier);
		}
		
		private function lighten(evt:MouseEvent):void
		{
			if(mouseDown)
			{
				image.bitmapData = normal.clone();
				image.bitmapData.colorTransform(image.bitmapData.rect, darker);
			}
			else
			{
				image.bitmapData.colorTransform(image.bitmapData.rect, lightier);
			}
		}
		
		private function darken(evt:MouseEvent):void
		{
			mouseDown = true;
			image.bitmapData = normal.clone();
			image.bitmapData.colorTransform(image.bitmapData.rect, darker);
		}
		
		public function updateImage(str:String):void
		{
			image.bitmapData = Assets.getTexture(str).bitmapData;
		}
		
		public function addListener(eventFunc:Function):void
		{
			clickFunc = eventFunc;
			this.addEventListener(MouseEvent.CLICK, clickFunc);
			this.addEventListener(MouseEvent.CLICK, clickSound);
		}
		
		private function setActive():void
		{
			this.mouseEnabled = true;
			image.bitmapData = normal.clone();
			image.alpha = 1;
		}
		
		private function setInactive():void
		{
			this.mouseEnabled = false;
			image.bitmapData = normal.clone();
			image.alpha = 0.75;
		}
		
		private function clickSound(event:MouseEvent):void
		{
			//sound.play();
		}
		
		private function removeListeners():void
		{
			if(clickFunc != null)
				this.removeEventListener(MouseEvent.CLICK, clickFunc);
			
			this.removeEventListener(MouseEvent.CLICK, clickSound);
			this.removeEventListener(MouseEvent.ROLL_OVER, lighten);
			this.removeEventListener(MouseEvent.ROLL_OUT, resetColor);
			this.removeEventListener(MouseEvent.MOUSE_DOWN, darken);
			Assets.gameStage.removeEventListener(MouseEvent.MOUSE_UP, mouseRelease);
		}
		
		override public function destruct(evt:Event = null):void
		{
			removeListeners();
			
			lightier = null;
			darker = null;
			normal = null;
			clickFunc = null;
			
			for each(var xtra:* in extraData)
				xtra = null;
				
			extraData = null;
			super.destruct();
		}
	}
}