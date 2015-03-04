package ui_objects
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	
	public class ScrollList extends Sprite
	{
		private var isVertical:Boolean;
		
		private var scrollListWidth:int;
		private var scrollListHeight:int;
		private var listPos:int;
		private const distanceFromEdge:int = 20;
		private const itemGap:int = 20;
		private var itemAverageLength:int;
		
		private var slideLastPos:Number;
		private var listMaxLength:Number;
		
		private var itemMask:Shape;
		private var bg:Shape;
		private var scrollBar:Shape;
		private var scrollBarEdge:Shape;
		private var innerBorder:Shape;
		private var outerBorder:Shape;
		
		private var slide:Button;
		
		private var itemList:Array;
		
		public function ScrollList(_width:int = 50, _height:int = 150, _isVertical:Boolean = true)
		{
			super();
			
			scrollListWidth = _width;
			scrollListHeight = _height;
			isVertical = _isVertical;
			
			initialize();
			draw();
		}
		
		private function initialize():void
		{
			outerBorder = new Shape();
			outerBorder.graphics.beginFill(0x666666, 1.0);
			outerBorder.graphics.drawRect(-5, -5, scrollListWidth+10, scrollListHeight+10);
			
			innerBorder = new Shape();
			innerBorder.graphics.beginFill(0xAAAAAA, 1.0);
			innerBorder.graphics.drawRect(-2, -2, scrollListWidth+4, scrollListHeight+4);
			
			if(isVertical)
			{
				scrollBar = new Shape();
				scrollBar.graphics.beginFill(0x666666, 1.0);
				scrollBar.graphics.drawRect(0, 0, 25, scrollListHeight);
				scrollBar.x = scrollListWidth -25;
				
				scrollBarEdge = new Shape();
				scrollBarEdge.graphics.beginFill(0xAAAAAA, 1.0);
				scrollBarEdge.graphics.drawRect(0, 0, 2, scrollListHeight);
				scrollBarEdge.x = scrollListWidth -27;
			}
			else
			{
				scrollBar = new Shape();
				scrollBar.graphics.beginFill(0x666666, 1.0);
				scrollBar.graphics.drawRect(0, 0, scrollListWidth, 25);
				scrollBar.y = scrollListHeight -25;
				
				scrollBarEdge = new Shape();
				scrollBarEdge.graphics.beginFill(0xAAAAAA, 1.0);
				scrollBarEdge.graphics.drawRect(0, 0, scrollListWidth, 2);
				scrollBarEdge.y = scrollListHeight -27;
			}
			
			bg = new Shape();
			bg.graphics.beginFill(0x000000, 1.0);
			bg.graphics.drawRect(0, 0, scrollListWidth, scrollListHeight);
			
			itemMask = new Shape();
			itemMask.graphics.beginFill(0x000000, 1.0);
			itemMask.graphics.drawRect(0, 0, scrollListWidth, scrollListHeight);
			
			itemList = new Array();
			slide = new Button("SlidePull");
			
			if(isVertical)
				slide.x = scrollListWidth-slide.width;
			else
				slide.y = scrollListHeight-slide.height;
				
			slide.addEventListener(MouseEvent.MOUSE_DOWN, drag);
			slide.addEventListener(Event.ENTER_FRAME, update);
			this.addEventListener(MouseEvent.MOUSE_WHEEL, scroll);
			Assets.gameStage.addEventListener(MouseEvent.MOUSE_UP, drop);
		}
		
		private function draw():void
		{
			this.addChild(outerBorder);
			this.addChild(innerBorder);
			this.addChild(bg);
			this.addChild(itemMask);
			this.addChild(scrollBar);
			this.addChild(scrollBarEdge);
			this.addChild(slide);
		}
		
		private function drag(event:MouseEvent):void
		{
			if(isVertical)
				slide.startDrag(false, new Rectangle(scrollListWidth -slide.width, 0, 0, scrollListHeight -slide.height));
			else
				slide.startDrag(false, new Rectangle(0, scrollListHeight -slide.height, scrollListWidth -slide.width, 0));
		}
		
		private function drop(event:MouseEvent):void
		{
			slide.stopDrag();
		}
		
		private function scroll(event:MouseEvent):void
		{
			if(event.delta < 0)
			{
				//scroll towards end
				listPos += (itemAverageLength+itemGap)/2;
				if(isVertical)
				{
					if(listPos > (listMaxLength -scrollListHeight +distanceFromEdge))
					{
						listPos = (listMaxLength -scrollListHeight +distanceFromEdge);
					}
				}
				else
				{
					if(listPos > (listMaxLength -scrollListWidth +distanceFromEdge))
					{
						listPos = (listMaxLength -scrollListWidth +distanceFromEdge);
					}
				}
			}
			else
			{
				// scroll towards beginning
				listPos -= (itemAverageLength+itemGap)/2;
				if(listPos < -distanceFromEdge)
				{
					listPos = -distanceFromEdge;
				}
			}
			if(isVertical)
				slide.y = (scrollListHeight -slide.height) *((listPos +distanceFromEdge) /(listMaxLength -scrollListHeight +distanceFromEdge*2));
			else
				slide.x = (scrollListWidth -slide.width) *((listPos +distanceFromEdge) /(listMaxLength -scrollListWidth +distanceFromEdge*2));
			
			setAllItemsPos();
		}
		
		private function update(event:Event):void
		{
			var hasMoved:Boolean = false;

			if(isVertical)
			{
				if(slideLastPos != slide.y)
				{
					hasMoved = true;
					slideLastPos = slide.y;
				}
			}
			else
			{
				if(slideLastPos != slide.x)
				{
					hasMoved = true;
					slideLastPos = slide.x;
				}
			}
			
			if(hasMoved)
			{
				if(isVertical)
				{
					listPos = (listMaxLength -scrollListHeight +distanceFromEdge*2) *slide.y /(scrollListHeight -slide.height)-distanceFromEdge;
				}
				else
				{
					listPos = (listMaxLength -scrollListWidth +distanceFromEdge*2) *slide.x /(scrollListWidth -slide.width)-distanceFromEdge;
				}
				
				setAllItemsPos();
			}
		}	
		
		private function setAllItemsPos():void
		{
			for(var i:int = 0; i < itemList.length; i++)
			{
				if(isVertical)
					itemList[i].y = (itemAverageLength +itemGap)*i -listPos;
				else
					itemList[i].x = (itemAverageLength +itemGap)*i -listPos;
			}
		}
		
		private function calcItemAverageLength():int
		{
			var avrLength:int = 0;
			
			for(var i:int = 0; i < itemList.length; i++)
			{
				if(isVertical)
					avrLength += itemList[i].height;
				else
					avrLength += itemList[i].width;
			}
			listMaxLength = avrLength +(itemGap*(itemList.length-1));
			avrLength /= itemList.length;
			
			return avrLength;
		}
		
		public function addItem(_item:*):void
		{
			this.addChild(_item);
			
			var _temp:Shape = new Shape();
			_temp.graphics.copyFrom(itemMask.graphics);
			this.addChild(_temp);
			_item.mask = _temp;
			
			if(isVertical)
				_item.x = distanceFromEdge;
			else
				_item.y = distanceFromEdge;
			
			itemList.push(_item);
			itemAverageLength = calcItemAverageLength();
			setAllItemsPos();
		}
		
		public function removeItem(_index:int):*
		{
			var _item:*;
			
			return _item;
		}
		
		public function clearList():void
		{
			if(isVertical)
				slide.y = 0;
			else
				slide.x = 0;
			
			for(var i:int = itemList.length-1; i >= 0; i--)
			{
				if(itemList[i] != null)
				{
					if(this.contains(itemList[i]))
					{
						this.removeChild(itemList[i]);
						itemList[i] = null;
					}
				}
			}
			
			itemList = new Array();
			itemAverageLength = calcItemAverageLength();
			setAllItemsPos();
		}
	}
}