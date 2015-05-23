package my.events
{
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	public class SliderChange extends EventDispatcher
	{
		public function SliderChange(target:IEventDispatcher=null)
		{
			super(target);
		}
	}
}