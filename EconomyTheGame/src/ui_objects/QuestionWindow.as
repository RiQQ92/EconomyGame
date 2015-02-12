package ui_objects
{
	import flash.events.FullScreenEvent;
	import flash.events.MouseEvent;
	import flash.text.TextField;

	public class QuestionWindow extends Item
	{
		private var qboxName:TextField = new TextField();
		
		private var yes:Button;
		private var no:Button;
		
		private var funcYes:Function;
		private var funcNo:Function;
		
		public function QuestionWindow(name:String, _funcYes:Function, _funcNo:Function = null)
		{
			super();
			
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
			this.parent.removeChild(this);
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
			
			qboxName.x = image.width/2 -200;
			qboxName.y = image.height/2 - 170;
			
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
	}
}