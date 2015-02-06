package my.events
{
	import flash.events.Event;
	
	public class DayChange extends Event
	{
		public function DayChange(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}