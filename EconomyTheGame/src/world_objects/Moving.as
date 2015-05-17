package world_objects
{
	import flash.events.Event;
	import flash.geom.Point;

	public class Moving extends WorldObject
	{
		public function Moving()
		{
			super();
		}
		
		protected function getDir(pointA:Point, pointB:Point):Number
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
		protected function setVector(dir:Number, speed:Number):Point
		{
			var xspeed:Number = Math.cos(dir*Math.PI/180)*speed;
			var yspeed:Number = Math.sin(dir*Math.PI/180)*speed;
			var retPoint:Point = new Point(xspeed, yspeed);
			return retPoint;
		}
		
		override public function destruct(evt:Event = null):void
		{
			super.destruct();
		}
	}
}