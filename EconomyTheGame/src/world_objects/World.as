package world_objects
{
	import flash.events.Event;
	import flash.geom.Point;
	
	import ui_objects.Item;
	
	public class World extends Item
	{
		private var offset:Point;
		private var player:Player;
		
		private var xMultiplier:int = 0;
		private var yMultiplier:int = 0;
		
		private var map:Map = new Map();
		
		public function World()
		{
			super();
			
			initialize();
			draw();
			
			this.addEventListener(Event.ENTER_FRAME, update);
		}
		
		private function update(event:Event):void
		{
			// swap map pieces to left and right
			if(player.x +Assets.gameStage.stageWidth/2 >= (map.xSize/2) +(map.xSize*xMultiplier/2))
			{
				xMultiplier++;
				map.swapToRight();
			}
			else if(player.x -Assets.gameStage.stageWidth/2 < -(map.xSize/2) +(map.xSize*xMultiplier/2))
			{
				xMultiplier--;
				map.swapToLeft();
			}
			
			// swap map pieces up and down
			if(player.y +Assets.gameStage.stageHeight/2 >= (map.ySize/2) +(map.ySize*yMultiplier/2))
			{
				yMultiplier++;
				map.swapToDown();
			}
			else if(player.y -Assets.gameStage.stageHeight/2 < -(map.ySize/2) +(map.ySize*yMultiplier/2))
			{
				yMultiplier--;
				map.swapToUp();
			}
		}
		
		private function initialize():void
		{
			map.x = -map.xSize/2;
			map.y = -map.ySize/2;
			this.addChild(map);
			player = new Player(this);
		}
		
		private function draw():void
		{
			this.addChild(player);
		}
	}
}