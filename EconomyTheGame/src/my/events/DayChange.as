package my.events
{
	import flash.events.*;
	
	public class DayChange extends EventDispatcher
	{
		private var countFrames:int;
		private var isPaused:Boolean;
		
		public function DayChange()
		{
			countFrames = 0;
			isPaused = true;
			stopProgress();
			Assets.gameStage.addEventListener(Event.ENTER_FRAME, update);
		}
		
		public function continueProgress():void
		{
			isPaused = false;
		}
		
		public function stopProgress():void
		{
			isPaused = true;
		}
		
		private function update(event:Event):void
		{
			if(!isPaused)
			{
				countFrames++;
				if(countFrames >= 30*24/Assets.gameSpeed) // frames per second * seconds(game hours)
				{
					countFrames = 0;
					dispatchEvent(new MyEvents(MyEvents.DAY_CHANGE));
				}
			}
		}
	}
}