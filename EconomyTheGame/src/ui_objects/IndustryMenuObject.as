package ui_objects
{	
	import flash.display.Bitmap;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	
	import game_objects.Industry;

	public class IndustryMenuObject extends Button
	{
		public var industry:Industry;
		private var logo:Bitmap;
		private var title:TextField;
		private var font:TextFormat;
		
		public function IndustryMenuObject(_industry:Industry)
		{
			image = Assets.getTexture("IndustryMenuBG");
			super();
			industry = _industry;
			logo = industry.logo;
			
			logo.x = 20;
			logo.y = image.height/2 - logo.height/2;
			this.addChild(logo);
			
			font = new TextFormat();
			font.size = 30;
			font.font = "Algerian";
			font.align = TextFormatAlign.CENTER;
			font.color = 0xEC9035;
			
			title = new TextField();
			title.defaultTextFormat = font;
			title.text = industry.industryName;
			
			title.selectable = false;
			title.mouseEnabled = false;
			title.x = logo.width + logo.x + 15;
			title.y = +30;
			title.autoSize = TextFieldAutoSize.LEFT;
			
			this.addChild(title);
		}
	}
}