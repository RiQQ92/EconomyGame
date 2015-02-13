package world_objects
{
	import flash.display.Bitmap;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.geom.Point;
	
	import utility.VCam;
	
	
	
	public class Player extends Moving
	{
		private var keyUp:Boolean = false;
		private var keyDown:Boolean = false;
		private var keyLeft:Boolean = false;
		private var keyRight:Boolean = false;
		private var isTravelling:Boolean = false;
		
		private var _speed:Number = 5;
		
		private var xySpeed:Point = new Point(0,0);
		private var target:Point = new Point(0,0);
		
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
			image.x = -image.width/2;
			image.y = -image.height/2;
			
			//myStage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyPress);
			//myStage.addEventListener(KeyboardEvent.KEY_UP, onKeyRelease);
			myStage.addEventListener(Event.ENTER_FRAME, update);
		}
		
		public function get speed():Number
		{
			return _speed;
		}
		
		public function set speed(value:Number):void
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

		private function getDir(pointA:Point, pointB:Point):Number
		{
			var calcObj:Object = {x:0,y:0};
			var Dir:Number;
			
			calcObj.x = pointA.x - pointB.x;
			calcObj.y = pointA.y - pointB.y;
			
			Dir = Math.atan2(calcObj.y, calcObj.x)/ Math.PI * 180;
			
			//Dir -= 180;
			
			return(Dir);
		}
		
		// laskee nopeudet x ja y akseleille kulman ja nopeuskertoimen perusteella
		private function setVector(dir:Number, speed:Number):Point
		{
			var xspeed:Number = Math.cos(dir*Math.PI/180)*speed;
			var yspeed:Number = Math.sin(dir*Math.PI/180)*speed;
			var retPoint:Point = new Point(xspeed, yspeed);
			return retPoint;
		}
		
		// palauttaa a pisteen kulman b pisteeseen
		public function giveTargetPos(_x:Number, _y:Number):void
		{
			isTravelling = true;
			target.x = _x;
			target.y = _y;
			
			var dir:Number = getDir(target, new Point(this.x, this.y));
			xySpeed = setVector(dir, _speed);
			
			var pointerAnim:Pointer = new Pointer();
			pointerAnim.x = target.x;
			pointerAnim.y = target.y;
			creator.addChild(pointerAnim);
		}
		
		private function update(event:Event):void
		{
			if(isTravelling)
			{
				if(this.x > target.x - _speed && this.x < target.x + _speed && this.y > target.y - _speed && this.y < target.y + _speed)
				{
					isTravelling = false;
					target.x = 0;
					target.y = 0;
				}
				else
				{
					this.x += xySpeed.x;
					this.y += xySpeed.y;
				}
				
				//if moving then check worldobjects collision
				//if moving // if count > 6 then create dust cloud
			}
		}
	}
}