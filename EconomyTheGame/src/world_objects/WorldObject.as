package world_objects
{
	import flash.geom.Point;
	
	import ui_objects.Button;
	
	public class WorldObject extends Button
	{
		public var worldObjectID:int;
		
		protected var location:Point;
		protected var scale: Number;
		protected var money:int;
		protected var world:World;
		
		public function WorldObject()
		{
			super();
		}
		
		protected function setScale(_scale:Number):void
		{
			scale = _scale;
			this.scaleX = scale;
			this.scaleY = scale;
		}
	}
}