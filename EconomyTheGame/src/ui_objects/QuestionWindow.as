package ui_objects
{
	import flash.events.Event;
	import flash.events.FullScreenEvent;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;

	public class QuestionWindow extends Item
	{
		private var qboxName:TextField = new TextField();
		private var font:TextFormat = new TextFormat();
		
		private var yes:Button;
		private var no:Button;
		
		private var funcYes:Function;
		private var funcNo:Function;
		
		public function QuestionWindow(name:String, _funcYes:Function, _funcNo:Function = null)
		{
			super();
			
			Assets.gamePaused = true;
			
			font.size = 30;
			font.font = "Algerian";
			//font.bold = true;
			font.align = TextFormatAlign.CENTER;
			
			qboxName.defaultTextFormat = font;
			qboxName.text = name;
			
			funcYes = _funcYes;
			if(_funcNo == null)
				funcNo = exit;
			
			initialize();
			draw();
		}
		
		private function answNo(event:MouseEvent):void
		{
			funcNo();
		}
		
		private function answYes(event:MouseEvent):void
		{
			if(funcYes != null)
				funcYes();
	
			exit();
		}
		
		private function exit():void
		{
			Assets.gamePaused = false;
			destruct();
		}
		
		private function initialize():void
		{
			image = Assets.getTexture("QuestionMenuWindow");
			yes = new Button("YesMenuBtn");
			no = new Button("NoMenuBtn");
			
			yes.x = image.width/2 -yes.width -25;
			yes.y = image.height/2;
			
			no.x = yes.x +50 +yes.width;
			no.y = yes.y;
			
			qboxName.selectable = false;
			qboxName.x = image.width/2 -200;
			qboxName.y = image.height/2 - 114;
			qboxName.width = 400;
			qboxName.autoSize = TextFieldAutoSize.CENTER;
			qboxName.border = true;
			qboxName.background = true;
			qboxName.backgroundColor = 0xEC9035;
			
			no.addEventListener(MouseEvent.CLICK, answNo);
			yes.addEventListener(MouseEvent.CLICK, answYes);
		}
		
		private function draw():void
		{
			this.addChild(image);
			this.addChild(qboxName);
			this.addChild(yes);
			this.addChild(no);
		}
		
		override public function destruct(evt:Event = null):void
		{
			no.removeEventListener(MouseEvent.CLICK, answNo);
			yes.removeEventListener(MouseEvent.CLICK, answYes);
			
			no.destruct();
			yes.destruct();
			
			funcYes = null;
			funcNo = null;
			
			qboxName = new TextField();
			font = new TextFormat();
			qboxName = null;
			font = null;
			
			super.destruct();
			this.parent.removeChild(this);
		}
	}
}