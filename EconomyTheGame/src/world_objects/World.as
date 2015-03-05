package world_objects
{
	import flash.events.Event;
	import flash.geom.Point;
	import flash.sensors.Accelerometer;
	
	import screens.TownScreen;
	
	import ui_objects.Item;
	
	public class World extends Item
	{
		private var offset:Point;
		private var _player:Player;
		
		private var xMultiplier:int = 0;
		private var yMultiplier:int = 0;
		
		private var townNames:Array;
		private var usedNames:Array = new Array();
		
		private var _map:Map;
		
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
		
		public function get map():Map
		{
			return _map;
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
		
		public function openTownScreen(town:Town):void
		{
			var townScreen:TownScreen = new TownScreen(town);
			parent.addChild(townScreen);
		}

		private function update(event:Event):void
		{
			// swap map pieces to left and right
			if(player.x +Assets.gameStage.stageWidth/2 >= (_map.xSize/2) +(_map.xSize*xMultiplier/2))
			{
				xMultiplier++;
				_map.swapToRight();
			}
			else if(player.x -Assets.gameStage.stageWidth/2 < -(_map.xSize/2) +(_map.xSize*xMultiplier/2))
			{
				xMultiplier--;
				_map.swapToLeft();
			}
			
			// swap map pieces up and down
			if(player.y +Assets.gameStage.stageHeight/2 >= (_map.ySize/2) +(_map.ySize*yMultiplier/2))
			{
				yMultiplier++;
				_map.swapToDown();
			}
			else if(player.y -Assets.gameStage.stageHeight/2 < -(_map.ySize/2) +(_map.ySize*yMultiplier/2))
			{
				yMultiplier--;
				_map.swapToUp();
			}
		}
		
		private function initialize():void
		{
			_player = new Player(this);
			_map = new Map();
			_map.x = -_map.xSize/2;
			_map.y = -_map.ySize/2;
			this.addChild(_map);
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
			
			_map.destruct();
			this.removeChild(map);
			
			player.Destruct();
			this.removeChild(player);
			
			super.destruct();
		}
	}
}