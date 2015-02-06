package my.events
{
	import flash.events.Event;
	
	public class SliderChange extends Event
	{
		public function SliderChange(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}