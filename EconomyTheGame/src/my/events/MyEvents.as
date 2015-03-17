package my.events
{
	import flash.events.Event;
	
	public class MyEvents extends Event
	{
		public static const DAY_CHANGE:String = "dayChange";
		
		public function MyEvents(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}