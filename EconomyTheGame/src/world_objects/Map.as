package world_objects
{
	import flash.display.Bitmap;
	import flash.events.MouseEvent;
	import flash.geom.Point;

	public class Map extends WorldObject
	{
		private var NW:Bitmap = Assets.getTexture("WorldBG");
		private var NE:Bitmap = Assets.getTexture("WorldBG");
		private var SE:Bitmap = Assets.getTexture("WorldBG");
		private var SW:Bitmap = Assets.getTexture("WorldBG");
		
		private var player:Player;
		private var target:Point = new Point(0,0);
		
		public var xSize:int;
		public var ySize:int;
		
		public function Map()
		{
			super();
			
			buttonMode = false;
			initialize();
			draw();
			this.addEventListener(MouseEvent.CLICK, getClickPos);
		}
		
		protected function getClickPos(event:MouseEvent):void
		{
			target.x = this.mouseX +this.x;
			target.y = this.mouseY +this.y;
			player.giveTargetPos(target.x, target.y);
		}
		
		public function swapToLeft():void
		{
			NE.x = NW.x;
			SE.x = SW.x;
			NW.x -= xSize/2;
			SW.x -= xSize/2;
		}
		
		public function swapToRight():void
		{
			NW.x = NE.x;
			SW.x = SE.x;
			NE.x += xSize/2;
			SE.x += xSize/2;
		}
		
		public function swapToUp():void
		{
			SW.y = NW.y;
			SE.y = NE.y;
			NW.y -= ySize/2;
			NE.y -= ySize/2;
		}
		
		public function swapToDown():void
		{
			NW.y = SW.y;
			NE.y = SE.y;
			SW.y += ySize/2;
			SE.y += ySize/2;
		}
		
		
		
		private function initialize():void
		{
			NW.x = 0;
			NW.y = 0;
			
			NE.x = NW.width;
			NE.y = 0;
			
			SE.x = NW.width;
			SE.y = NW.height;
			
			SW.x = 0;
			SW.y = NW.height;
			
			xSize = NW.width*2;
			ySize = NW.height*2;
			
			player = world.player;
		}
		
		private function draw():void
		{
			this.addChild(NW);
			this.addChild(NE);
			this.addChild(SE);
			this.addChild(SW);
		}
	}
}