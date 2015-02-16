package ui_objects
{
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	import flash.text.TextFieldAutoSize;

	public class Slider extends Item
	{
		private var slide:Button;
		private var slidePos:int;
		private var slideLastPos:int;
		
		private var slideText:TextField;
		private var font:TextFormat = new TextFormat();
		
		private const slidePosMAX:int = 252;
		private const slidePosMIN:int = 0;
		private const pullBounds:Rectangle = new Rectangle(slidePosMIN, 0, slidePosMAX, 0);
		
		public function Slider()
		{
			super();
			// create event patcher to slider changes
			initialize();
			draw();
		}
		
		private function initialize():void
		{
			font.size = 15;
			font.align = TextFormatAlign.CENTER;
			
			image = Assets.getTexture("SlideBar");
			slide = new Button("SlidePull");
			slide.x = image.width -slide.width;
			
			slidePos = 100;
			slideLastPos = 1;
			
			slideText = new TextField();
			slideText.defaultTextFormat = font;
			slideText.text = slidePos.toString();
			
			slideText.autoSize = TextFieldAutoSize.CENTER;
			slideText.selectable = false;
			slideText.mouseEnabled = false;
			slideText.background = true;
			
			//slideText.x = slide.x + slide.width;
			slideText.y = -15;
			
			slide.addEventListener(MouseEvent.MOUSE_DOWN, drag);
			slide.addEventListener(Event.ENTER_FRAME, update);
			Assets.gameStage.addEventListener(MouseEvent.MOUSE_UP, drop);
		}
		
		private function update(event:Event):void
		{
			if(slide.x != slideLastPos)
			{
				slideLastPos = slide.x;
				slideText.x = slide.x + slide.width -5;
				
				slidePos = slide.x /slidePosMAX *100;
				
				slideText.text = slidePos.toString();
			}
		}
		
		private function drag(event:MouseEvent):void
		{
			slide.startDrag(false, pullBounds);
		}
		
		private function drop(event:MouseEvent):void
		{
			slide.stopDrag();
		}
		
		private function draw():void
		{
			this.addChild(image);
			this.addChild(slide);
			this.addChild(slideText);
		}
		
		override public function destruct():void
		{
			this.removeChild(slide);
			super.destruct();
			this.parent.removeChild(this);
		}
	}
}