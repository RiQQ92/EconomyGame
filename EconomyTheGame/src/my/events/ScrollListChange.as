package my.events
{
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	public class ScrollListChange extends EventDispatcher
	{
		public function dispatchChange():void
		{
			dispatchEvent(new MyEvents(MyEvents.SCROLL_LIST_CHANGE));
		}
	}
}