package world_objects
{
	import flash.display.Bitmap;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.geom.Point;
	
	import utility.VCam;
	
	
	
	public class Player extends Moving
	{
		private var isTravelling:Boolean = false;
		
		private var _speed:Number = 5;
		
		private var xySpeed:Point = new Point(0,0);
		private var target:Point = new Point(0,0);
		
		private var currentTown:Town;
		private var myStage:Stage;
		private var cam:VCam;
		private var creator:World;
		
		public function Player(_creator:World)
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
		
		// palauttaa a pisteen kulman b pisteeseen
		public function giveTargetPos(_x:Number, _y:Number):void
		{
			isTravelling = true;
			target.x = _x;
			target.y = _y;
			
			var dir:Number = getDir(target, new Point(this.x, this.y));
			xySpeed = setVector(dir, _speed);
			
			var pointerAnim:Pointer = new Pointer();
			pointerAnim.mouseEnabled = false;
			pointerAnim.x = target.x;
			pointerAnim.y = target.y;
			creator.addChild(pointerAnim);
		}
		
		private function update(event:Event):void
		{
			if(!Assets.gamePaused)
			{
				if(currentTown != null)
				{
					if(!this.hitTestObject(currentTown.hitBox))
					{
						currentTown = null;
					}
				}
				for(var i:int = 0; i < world.worldObjects.length; i++)
				{
					if(this.hitTestObject(world.worldObjects[i].hitBox))
					{
						//trace("collision with: "+world.worldObjects[i].worldObjName);
						if(world.worldObjects[i] is Town)
						{
							if(world.worldObjects[i] != currentTown)
							{
								currentTown = world.worldObjects[i];
								giveTargetPos(currentTown.x + currentTown.hitBox.width/2*currentTown.scaleX, currentTown.y + currentTown.hitBox.height/2*currentTown.scaleY);
								world.openTownScreen(currentTown); // open town screen
								creator.map.stopAutoPress();
							}
							//trace("I'm a town!");
						}
					}
				}
				
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
		
		private function removeListeners():void
		{
			myStage.removeEventListener(Event.ENTER_FRAME, update);
		}
		
		override public function destruct(evt:Event = null):void
		{
			removeListeners();
			
			xySpeed = null;
			target = null;
			
			myStage = null;
			creator = null;
			cam.Destruct();
			this.removeChild(cam);
			
			super.destruct();
		}
	}
}