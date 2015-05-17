package world_objects
{
	import flash.display.Bitmap;
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.filters.DisplacementMapFilter;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	import ui_objects.Button;
	
	public class WorldObject extends Button
	{
		public var worldObjectID:int;
		
		protected var money:int;
		protected var scale: Number;
		protected var _worldObjName:String;
		protected var location:Point;
		protected var world:World;
		
		public var hitBox:DisplayObject; // public so hitTest can find this property
		
		public function WorldObject()
		{
			super();
			
			worldObjectID = Assets.worldObjCounter +1;
			Assets.worldObjCounter++;
			
			world = Assets.gameWorld;
			hitBox = image as DisplayObject;
		}
		
		public function get worldObjName():String
		{
			return _worldObjName;
		}

		protected function setScale(_scale:Number):void
		{
			scale = _scale;
			this.scaleX = scale;
			this.scaleY = scale;
		}
		
		override public function destruct(evt:Event = null):void
		{
			location = null;
			world = null;
			
			super.destruct();
		}
	}
}