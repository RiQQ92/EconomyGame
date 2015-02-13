package world_objects
{
	import flash.events.Event;
	import flash.geom.Point;
	import flash.sensors.Accelerometer;
	
	import ui_objects.Item;
	
	public class World extends Item
	{
		private var offset:Point;
		private var _player:Player;
		
		private var xMultiplier:int = 0;
		private var yMultiplier:int = 0;
		
		private var townNames:Array;
		private var usedNames:Array = new Array();
		
		private var map:Map;
		
		public var worldObjects:Array = new Array();
		
		public function World()
		{
			super();
			
			Assets.gameWorld = this;
			
			allocTownNames();
			initialize();
			draw();
			
			this.addEventListener(Event.ENTER_FRAME, update);
		}
		
		private function allocTownNames():void
		{
			townNames = new Array();
			townNames.push("Sandstorm");
			townNames.push("Last Resort");
			townNames.push("Hope's End");
			townNames.push("no Return");
			townNames.push("End of Line");
			townNames.push("Final Destination");
			townNames.push("Quebek");
			townNames.push("Trumph");
			townNames.push("Griif");
			townNames.push("Frovel");
			townNames.push("Harmes");
		}
		
		private function addTowns():void
		{
			for(var i:int = 0;i < 2; i++)
			{
				for(var b:int = 0; b < 2; b++)
				{
					var town:Town = createRandomTown();
					town.x = -150 +i*300;
					town.y = -150 +b*300;
					this.addChild(town);
					worldObjects.push(town);
				}
			}
		}
		
		private function createRandomTown():Town
		{
			var rand:int;
			var found:Boolean;
			do{
				found = false;
				rand = Math.floor(Math.random()*townNames.length);
				for(var i:int = 0; i < usedNames.length; i++)
				{
					if(usedNames[i] == rand)
						found = true;
				}
			}while(found);
			
			usedNames.push(rand);
			var tempName:String = townNames[rand];
			
			rand = Math.floor(Math.random()*680+20);
			var town:Town = new Town(tempName, rand);
			
			return (town);
		}
		
		public function get player():Player
		{
			return _player;
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
			_player = new Player(this);
			map = new Map();
			map.x = -map.xSize/2;
			map.y = -map.ySize/2;
			this.addChild(map);
		}
		
		private function draw():void
		{
			addTowns();
			this.addChild(player);
		}
		
		private function removeListeners():void
		{
			this.removeEventListener(Event.ENTER_FRAME, update);
		}
		
		private function removeTowns():void
		{
			
		}
		
		override public function destruct():void
		{
			removeListeners();
			removeTowns();
			
			townNames = new Array();
			townNames = null;
			
			map.destruct();
			this.removeChild(map);
			
			player.Destruct();
			this.removeChild(player);
			
			super.destruct();
		}
	}
}