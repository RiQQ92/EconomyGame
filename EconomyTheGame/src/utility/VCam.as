package utility
{
	import flash.display.Bitmap;
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.display.StageAlign;
	import flash.events.Event;
	
	public class VCam extends MovieClip
	{
		private var myStage:Stage;
		private var image:Bitmap;
		
		private var cX:Number;
		private var cY:Number;
		private var sX:Number;
		private var sY:Number;
		private var oldMode:String;
		private var objParent:*;
		private var scenery:*;
		
		public function VCam(_parent:*, _scenery:*)
		{
			super();
			
			image = Assets.getTexture("VCAM_zone");
			this.addChild(image);
			
			objParent = _parent;
			scenery = _scenery;
			myStage = Assets.gameStage;
			
			this.visible = false;
			
			oldMode = myStage.scaleMode;
			
			cX = myStage.stageWidth/2;
			cY = myStage.stageHeight/2;
			sX = myStage.stageWidth;
			sY = myStage.stageHeight;
			
			myStage.scaleMode = oldMode;
			myStage.align = StageAlign.TOP_LEFT;
			addEventListener(Event.ENTER_FRAME, camControl);
		}
		
		private function camControl(event:Event):void
		{
			this.x = objParent.x;
			this.y = objParent.y;
			
			var xScale:Number = sX/this.width;
			var yScale:Number = sY/this.height;
			
			scenery.scaleX = xScale;
			scenery.scaleY = yScale;
			
			//if((cX - (objParent.x * xScale)) <= 0 && (cX - (objParent.x * xScale)) >= (-scenery.width +myStage.stageWidth))
			//{
				scenery.x = cX - (objParent.x * xScale);
			//}
			
			//if((cY - (objParent.y * yScale)) <= 0 && (cY - (objParent.y * yScale)) >= (-scenery.height +myStage.stageHeight))
			//{
				scenery.y = cY - (objParent.y * yScale);
			//}
		}
		
		public function resetCamera():void
		{
			scenery.scaleX = 1;
			scenery.scaleY = 1;
			scenery.x = 0;
			scenery.y = 0;
		}
		
		public function Destruct():void
		{
			scenery.scaleX = 1;
			scenery.scaleY = 1;
			scenery.x = 0;
			scenery.y = 0;
			
			myStage = null;
			objParent = null;
			scenery = null;
			this.removeChild(image);
			
			if(this.hasEventListener(Event.ENTER_FRAME))
				this.removeEventListener(Event.ENTER_FRAME, camControl);
		}
	}
}