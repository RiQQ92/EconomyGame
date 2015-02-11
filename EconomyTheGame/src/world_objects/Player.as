package world_objects
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	
	import utility.VCam;
	
	public class Player extends Moving
	{
		private var keyUp:Boolean = false;
		private var keyDown:Boolean = false;
		private var keyLeft:Boolean = false;
		private var keyRight:Boolean = false;
		
		private var lastMoveX:int = 0;
		private var lastMoveY:int = 0;
		private var _speed:int = 5;
		
		private var myStage:Stage;
		private var cam:VCam;
		private var creator:*;
		
		public function Player(_creator:*)
		{
			image = Assets.getTexture("PlayerImage");
			super();
			
			myStage = Assets.gameStage;
			creator = _creator;
			cam = new VCam(this, creator);
			this.addChild(image);
			
			myStage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyPress);
			myStage.addEventListener(KeyboardEvent.KEY_UP, onKeyRelease);
			myStage.addEventListener(Event.ENTER_FRAME, update);
		}
		
		public function get speed():int
		{
			return _speed;
		}
		
		public function set speed(value:int):void
		{
			_speed = value;
		}
		
		public function Destruct():void
		{
			creator = null;
			cam.Destruct();
			cam = null;
			this.removeChild(image);
		}
		
		private function onKeyPress(event:KeyboardEvent):void
		{
			switch(event.keyCode)
			{
				case Keyboard.UP:
					this.keyUp = true;
					break;
				case Keyboard.DOWN:
					
					this.keyDown = true;
					break;
				case Keyboard.LEFT:
					
					this.keyLeft = true;
					break;
				case Keyboard.RIGHT:
					
					this.keyRight = true;
					break;
			}
		}
		
		private function onKeyRelease(event:KeyboardEvent):void
		{
			switch(event.keyCode)
			{
				case Keyboard.UP:
					
					this.keyUp = false;
					break;
				case Keyboard.DOWN:
					
					this.keyDown = false;
					break;
				case Keyboard.LEFT:
					
					this.keyLeft = false;
					break;
				case Keyboard.RIGHT:
					
					this.keyRight = false;
					break;
			}
		}
		
		private function update(event:Event):void
		{
			if(keyUp)
			{
				//if((this.y) > 0)
				//{
					this.y -= this.speed;
					lastMoveY -= this.speed;
				//}
			}
			if(keyDown)
			{
				//if((this.y + this.height) < creator.height)
				//{
					this.y += this.speed;
					lastMoveY += this.speed;
				//}
			}
			if(keyLeft)
			{
				//if((this.x) > 0)
				//{
					this.x -= this.speed;
					lastMoveX -= this.speed;
				//}
			}
			if(keyRight)
			{
				//if((this.x + this.width) < creator.width)
				//{
					this.x += this.speed;
					lastMoveX += this.speed;
				//}
			}
			
			lastMoveX = 0;
			lastMoveY = 0;
		}
	}
}