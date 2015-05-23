package ui_objects
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	
	import my.events.MyEvents;
	import my.events.ScrollListChange;
	
	import utility.Calculator;
	
	public class ScrollList extends Sprite
	{
		private var tempFound:Boolean;
		private var isVertical:Boolean;
		private var hasItemSwapMenu:Boolean;
		
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
		private var itemHighlight:Shape;
		
		private var slide:Button;
		
		private var transferCalc:Calculator;
		
		private var menuToSwapWith:ScrollList;
		
		private var tempSwappedItem:* = null;
		private var itemToSwap:* = null;
		
		public var evtDispatcher:ScrollListChange;
		
		public var multipleSwapMenus:Boolean;
		
		public var selectedTarget:* = null;
		public var swappedItemsList:Array; // has Objects(swappedItem:*, originalOwner:ScrollList)
		public var itemList:Array;
		
		public function ScrollList(_width:int = 50, _height:int = 150, _isVertical:Boolean = true, _hasSwapMenus:Boolean = false, _hasMultiSwapMenus:Boolean = false, _swapMenu:ScrollList = null)
		{
			super();
			
			scrollListWidth = _width;
			scrollListHeight = _height;
			isVertical = _isVertical;
			
			hasItemSwapMenu = _hasSwapMenus;
			multipleSwapMenus = _hasMultiSwapMenus;
			menuToSwapWith = _swapMenu;
			
			initialize();
			draw();
		}
		
		private function initialize():void
		{
			evtDispatcher = new ScrollListChange();
			
			if(menuToSwapWith)
			{
				if(menuToSwapWith.multipleSwapMenus)
				{
					menuToSwapWith.evtDispatcher.addEventListener(MyEvents.SCROLL_LIST_CHANGE, checkChanges);
				}
			}
			
			swappedItemsList = new Array();
			
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
			
			itemHighlight = new Shape();
			itemHighlight.mask = itemMask;
			
			itemList = new Array();
			slide = new Button("SlidePull");
			
			if(isVertical)
				slide.x = scrollListWidth-slide.width;
			else
				slide.y = scrollListHeight-slide.height;
				
			slide.addEventListener(MouseEvent.MOUSE_DOWN, drag);
			slide.addEventListener(Event.ENTER_FRAME, update);
			this.addEventListener(MouseEvent.MOUSE_WHEEL, scroll);
			this.addEventListener(MouseEvent.MOUSE_DOWN, removeSelection);
			Assets.gameStage.addEventListener(MouseEvent.MOUSE_UP, drop);
		}
		
		private function checkChanges(event:Event):void
		{
			for each(var _swapItem:* in menuToSwapWith.swappedItemsList)
			{
				if(_swapItem.itemOwner != this)
				{
					var found:Boolean = false;
					var foundItem:* = null;
					for each(var _item:* in this.itemList)
					{
						if(_item.compareGoods(_swapItem.swapItem))
						{
							found = true;
							foundItem = _item;
							break;
						}
					}
					
					if(found)
					{
						if(foundItem.offsetAmount == foundItem.amount)
						{
							foundItem.addTempGoods(_swapItem.swapItem.amount);
						}
						else
						{
							if((foundItem.amount -foundItem.offsetAmount) != _swapItem.swapItem.amount)
							{
								foundItem.setAmount(foundItem.offsetAmount);
								foundItem.addTempGoods(_swapItem.swapItem.amount);
							}
						}
					}
					else
					{
						var addition:* = _swapItem.swapItem.clone(0);
						addition.addTempGoods(_swapItem.swapItem.amount);
						this.addItem(addition);
					}
				}
			}
			
			// double check to remove/reset alredy removed trade parts
			if(!multipleSwapMenus)
			{
				for each(var tradeItem:* in this.itemList)
				{
					if(tradeItem.amount != tradeItem.offsetAmount)
					{
						var found2:Boolean = false;
						for each(var swappedItem:* in menuToSwapWith.swappedItemsList)
						{
							if(swappedItem.swapItem.compareGoods(tradeItem))
							{
								found2 = true;
								break;
							}
						}
						
						if(!found2)
						{
							if(tradeItem.offsetAmount <= 0)
								this.removeItemByReference(tradeItem);
							else
								tradeItem.setAmount(tradeItem.offsetAmount);
						}
					}
				}
			}
		}
		
		private function draw():void
		{
			this.addChild(outerBorder);
			this.addChild(innerBorder);
			this.addChild(bg);
			this.addChild(itemMask);
			this.addChild(itemHighlight);
			this.addChild(scrollBar);
			this.addChild(scrollBarEdge);
			this.addChild(slide);
		}
		
		private function removeSelection(event:MouseEvent):void
		{
			if(isVertical)
			{
				if(this.mouseX < scrollListWidth -slide.width)
				{
					selectedTarget = null;
					itemHighlight.graphics.clear();
				}
			}
			else
			{
				if(this.mouseY < scrollListHeight -slide.height)
				{
					selectedTarget = null;
					itemHighlight.graphics.clear();
				}
			}
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
		
		private function setHighlighted(event:MouseEvent):void
		{
			itemHighlight.graphics.clear();
			itemHighlight.graphics.beginFill(0xEAA500, 1.0);
			itemHighlight.graphics.drawRect(event.target.x -5, event.target.y -5, event.target.width+10, event.target.height+10);
			selectedTarget = event.target;
		}
		
		private function updateHighlightPos():void
		{
			if(selectedTarget != null)
			{
				itemHighlight.graphics.clear();
				itemHighlight.graphics.beginFill(0xEAA500, 1.0);
				itemHighlight.graphics.drawRect(selectedTarget.x -5, selectedTarget.y -5, selectedTarget.width+10, selectedTarget.height+10);
			}
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
		
		private function swapItem(event:MouseEvent):void
		{
			var _item:* = event.target;
			itemToSwap = _item;
			if(multipleSwapMenus)
			{
				for each(var swappedItem:* in swappedItemsList)
				{
					if(swappedItem.swapItem == _item)
					{
						if(_item.amount)
						{
							if(_item.amount > 1)
							{
								tempSwappedItem = swappedItem;
								transferCalc = new Calculator(swapAmount, _item.amount);
								transferCalc.x = Assets.gameStage.stageWidth/2 -transferCalc.width/2;
								transferCalc.y = Assets.gameStage.stageHeight/2 -transferCalc.height/2;
								this.parent.addChild(transferCalc);
							}
							else
							{
								tempSwappedItem = swappedItem;
								swapAmount(1);
								
								evtDispatcher.dispatchChange();
							}
						}
						else
						{
							removeItemByReference(_item);
							swappedItem.itemOwner.addItem(_item);
							
							evtDispatcher.dispatchChange();
						}
						break;
					}
				}
			}
			else
			{
				// else check whether it is own item or not then send it to other ScrollList
				var found:Boolean = false;
				for each(var swappedItem2:* in swappedItemsList)
				{
					if(swappedItem2.swapItem == _item)
					{
						if(_item.amount)
						{
							if(_item.amount > 1)
							{
								tempSwappedItem = swappedItem2;
								transferCalc = new Calculator(swapAmount, _item.amount);
								transferCalc.x = Assets.gameStage.stageWidth/2 -transferCalc.width/2;
								transferCalc.y = Assets.gameStage.stageHeight/2 -transferCalc.height/2;
								tempFound = true;
								this.parent.addChild(transferCalc);
							}
							else
							{
								tempSwappedItem = swappedItem2;
								tempFound = true;
								swapAmount(1);
								
								evtDispatcher.dispatchChange();
							}
						}
						else
						{
							removeItemByReference(_item);
							swappedItem2.itemOwner.addItem(_item);
							found = true;
							
							evtDispatcher.dispatchChange();
						}
						break;
					}
				}
				if(!found)
				{
					for each(var item:* in itemList)
					{
						if(item == _item)
						{
							if(_item.amount)
							{
								if(_item.amount > 1)
								{
									transferCalc = new Calculator(swapAmount, _item.amount);
									transferCalc.x = Assets.gameStage.stageWidth/2 -transferCalc.width/2;
									transferCalc.y = Assets.gameStage.stageHeight/2 -transferCalc.height/2;
									this.parent.addChild(transferCalc);
								}
								else
								{
									swapAmount(1);
									
									evtDispatcher.dispatchChange();
								}
							}
							else
							{
								removeItemByReference(_item);
								menuToSwapWith.receiveSwapItem(_item, this);
								
								evtDispatcher.dispatchChange();
							}
							break;
						}
					}
				}
			}
		}
		
		private function swapAmount(amount:int):void
		{
			var found:Boolean = false;
			var itemToAdd:* = null;
			if(multipleSwapMenus)
			{
				for(var i:int = 0; i < tempSwappedItem.itemOwner.itemList.length; i++)
				{
					// find if other list already has same item
					if(itemToSwap.compareGoods(tempSwappedItem.itemOwner.itemList[i]))
					{
						found = true;
						itemToAdd = tempSwappedItem.itemOwner.itemList[i];
						break;
					}
				}
				if(found)
				{
					itemToAdd.addTempGoods(amount);
					
					if(amount >= itemToSwap.amount)
						removeItemByReference(itemToSwap);
					else
						itemToSwap.removeGoods(amount);
				}
				else
				{
					var _item:* = itemToSwap.clone();
					
					if(amount >= itemToSwap.amount)
						removeItemByReference(itemToSwap);
					else
						itemToSwap.removeGoods(amount);
					
					_item.setAmount(amount);
					tempSwappedItem.itemOwner.addItem(_item);
				}
				
				evtDispatcher.dispatchChange();
			}
			else
			{
				for(var d:int = 0; d < menuToSwapWith.swappedItemsList.length; d++)
				{
					if(itemToSwap.compareGoods(menuToSwapWith.swappedItemsList[d].swapItem))
					{
						itemToAdd = menuToSwapWith.swappedItemsList[d];
						found = true;
					}
				}
				
				if(found)
				{
					if(itemToAdd.itemOwner != this)
					{
						var hasItem:Boolean = false;
						var foundItem:* = null;
						for(var g:int = 0; g < itemToAdd.itemOwner.itemList.length; g++)
						{
							if(itemToAdd.swapItem.compareGoods(itemToAdd.itemOwner.itemList[g]))
							{
								hasItem = true;
								foundItem = itemToAdd.itemOwner.itemList[g];
								break;
							}
						}
						
						if(itemToAdd.swapItem.amount == amount)
						{
							if(!hasItem)
							{
								itemToAdd.itemOwner.addItem(itemToAdd.swapItem.clone(amount));
							}
							else
							{
								foundItem.addTempGoods(amount);
							}
							itemToSwap.removeTempGoods(amount);
							menuToSwapWith.removeItemByReference(itemToAdd.swapItem);
						}
						else if(itemToAdd.swapItem.amount > amount)
						{
							itemToAdd.swapItem.removeGoods(amount);
							
							if(!hasItem)
							{
								itemToAdd.itemOwner.addItem(itemToAdd.swapItem.clone(amount));
							}
							else
							{
								foundItem.addTempGoods(amount);
							}
							itemToSwap.removeTempGoods(amount);
						}
						else
						{
							var tempAmount:int = amount -itemToAdd.swapItem.amount;
							var transferItem:* = itemToSwap.clone();
							
							transferItem.setAmount(tempAmount);
							//itemToSwap.removeTempGoods(amount);
							menuToSwapWith.receiveSwapItem(transferItem, this);
							
							if(tempAmount >= itemToSwap.amount)
								removeItemByReference(itemToSwap);
							else
								itemToSwap.removeTempGoods(amount);
							
							if(!hasItem)
							{
								itemToAdd.itemOwner.addItem(itemToAdd.swapItem.clone(itemToAdd.swapItem.amount));
							}
							else
							{
								foundItem.addTempGoods(itemToAdd.swapItem.amount);
							}
							
							menuToSwapWith.removeItemByReference(itemToAdd.swapItem);
						}
					}
					else
					{
						itemToAdd.swapItem.addGoods(amount);
						itemToSwap.removeTempGoods(amount);
					}
				}
				else if(!tempFound)
				{
					for(var b:int = 0; b < menuToSwapWith.itemList.length; b++)
					{
						
						// find if other list already has same item
						if(itemToSwap.compareGoods(menuToSwapWith.itemList[b]))
						{
							found = true;
							itemToAdd = menuToSwapWith.itemList[b];
							break;
						}
					}
					if(found)
					{
						itemToAdd.addGoods(amount);
						
						itemToSwap.removeTempGoods(amount);
					}
					else
					{
						var _item2:* = itemToSwap.clone();
						
						itemToSwap.removeTempGoods(amount);
						
						_item2.setAmount(amount);
						menuToSwapWith.receiveSwapItem(_item2, this);
					}
				}
				else
				{
					for(var c:int = 0; c < tempSwappedItem.itemOwner.itemList.length; c++)
					{
						// find if other list already has same item
						if(itemToSwap.compareGoods(tempSwappedItem.itemOwner.itemList[c]))
						{
							found = true;
							itemToAdd = tempSwappedItem.itemOwner.itemList[c];
							break;
						}
					}
					if(found)
					{
						itemToAdd.addGoods(amount);
						
						itemToSwap.removeTempGoods(amount);
					}
					else
					{
						var _item3:* = itemToSwap.clone();
						
						itemToSwap.removeTempGoods(amount);
						
						_item3.setAmount(amount);
						tempSwappedItem.itemOwner.addItem(_item3);
					}
				}
				
				menuToSwapWith.evtDispatcher.dispatchChange();
			}
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
			updateHighlightPos();
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
		
		public function saveChanges():void
		{
			for each(var _item:* in this.itemList)
			{
				_item.saveChanges();
				if(_item.amount <= 0)
				{
					this.removeItemByReference(_item);
				}
			}
		}
		
		public function cancelChanges():void
		{
			for each(var _item:* in this.itemList)
			{
				_item.cancelChanges();
				if(_item.amount <= 0)
				{
					this.removeItemByReference(_item);
				}
			}
		}
		
		public function receiveSwapItem(item:*, owner:ScrollList):void
		{
			var obj:Object = {swapItem:item, itemOwner:owner};
			swappedItemsList.push(obj);
			addItem(item);
			
			evtDispatcher.dispatchChange();
		}
		
		public function addItem(_item:*):void
		{
			this.addChild(_item);
			_item.doubleClickEnabled = true;
			
			_item.addEventListener(MouseEvent.CLICK, setHighlighted);
			if(hasItemSwapMenu)
				_item.addEventListener(MouseEvent.DOUBLE_CLICK, swapItem);
			
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
		
		private function removeItemByReference(_item:*):void
		{
			var count:int = 0;
			if(hasItemSwapMenu)
			{
				for each(var swappedItem:* in swappedItemsList)
				{
					if(swappedItem.swapItem == _item)
					{
						swappedItemsList.splice(count, 1);
						break;
					}
					count++;
				}
				count = 0;
				
				for(; count < itemList.length; count++)
				{
					if(itemList[count] == _item)
					{
						itemList.splice(count, 1);
						_item.removeEventListener(MouseEvent.CLICK, setHighlighted);
						_item.removeEventListener(MouseEvent.DOUBLE_CLICK, swapItem);
						_item.mask.parent.removeChild(_item.mask);
						_item.mask = null;
						_item.parent.removeChild(_item);
					}
				}
			}
			else
			{
				for(; count < itemList.length; count++)
				{
					if(itemList[count] == _item)
					{
						itemList.splice(count, 1);
						_item.removeEventListener(MouseEvent.CLICK, setHighlighted);
						_item.removeEventListener(MouseEvent.DOUBLE_CLICK, swapItem);
						_item.mask.parent.removeChild(_item.mask);
						_item.mask = null;
						_item.parent.removeChild(_item);
					}
				}
			}
			
			itemAverageLength = calcItemAverageLength();
			setAllItemsPos();
			
			evtDispatcher.dispatchChange();
		}
		
		public function removeItem(_index:int):*
		{
			var _item:*;
			
			
			evtDispatcher.dispatchChange();
			return _item;
		}
		
		public function clearList():void
		{
			if(isVertical)
				slide.y = 0;
			else
				slide.x = 0;
			
			selectedTarget = null;
			itemHighlight.graphics.clear();
			
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
			
			if(hasItemSwapMenu)
			{
				for(var b:int = swappedItemsList.length-1; b >= 0; b--)
				{
					if(swappedItemsList[b] != null)
					{
						if(this.contains(swappedItemsList[b].swapItem))
						{
							this.removeChild(swappedItemsList[b].swapItem);
						}
						swappedItemsList[b] = null;
					}
				}
			}
			
			swappedItemsList = new Array();
			itemList = new Array();
			itemAverageLength = calcItemAverageLength();
			setAllItemsPos();
			
			evtDispatcher.dispatchChange();
		}
	}
}