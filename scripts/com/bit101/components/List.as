package com.bit101.components
{
   import flash.Boot;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import openfl.utils._Object.Object_Impl_;
   
   [Event(name="select",type="flash.events.Event")]
   public class List extends Component
   {
      
      public var _selectedIndex:int;
      
      public var _selectedColor:uint;
      
      public var _scrollbar:VScrollBar;
      
      public var _rolloverColor:uint;
      
      public var _panel:Panel;
      
      public var _listItemHeight:Number;
      
      public var _listItemClass:Class;
      
      public var _items:Array;
      
      public var _itemHolder:Sprite;
      
      public var _defaultColor:uint;
      
      public var _alternateRows:Boolean;
      
      public var _alternateColor:uint;
      
      public function List(param1:DisplayObjectContainer = undefined, param2:Number = 0, param3:Number = 0, param4:Array = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         _alternateRows = false;
         _rolloverColor = Style.get_LIST_ROLLOVER();
         _selectedColor = Style.get_LIST_SELECTED();
         _alternateColor = Style.get_LIST_ALTERNATE();
         _defaultColor = Style.get_LIST_DEFAULT();
         _selectedIndex = -1;
         _listItemClass = ListItem;
         _listItemHeight = 20;
         if(param4 != null)
         {
            _items = param4;
         }
         else
         {
            _items = [];
         }
         super(param1,param2,param3);
      }
      
      public function set_selectedItem(param1:Object) : Object
      {
         var _loc2_:int = _items.indexOf(param1);
         set_selectedIndex(_loc2_);
         setInvalidated();
         dispatchEvent(new Event(Event.SELECT));
         return param1;
      }
      
      public function set_selectedIndex(param1:int) : int
      {
         if(param1 >= 0 && param1 < int(_items.length))
         {
            _selectedIndex = param1;
         }
         else
         {
            _selectedIndex = -1;
         }
         setInvalidated();
         dispatchEvent(new Event(Event.SELECT));
         return param1;
      }
      
      public function set_selectedColor(param1:uint) : uint
      {
         _selectedColor = param1;
         setInvalidated();
         return param1;
      }
      
      public function set_rolloverColor(param1:uint) : uint
      {
         _rolloverColor = param1;
         setInvalidated();
         return param1;
      }
      
      public function set_listItemHeight(param1:Number) : Number
      {
         _listItemHeight = param1;
         makeListItems();
         setInvalidated();
         return param1;
      }
      
      public function set_listItemClass(param1:Class) : Class
      {
         _listItemClass = param1;
         makeListItems();
         setInvalidated();
         return param1;
      }
      
      public function set_items(param1:Array) : Array
      {
         _items = param1;
         setInvalidated();
         return param1;
      }
      
      public function set_defaultColor(param1:uint) : uint
      {
         _defaultColor = param1;
         setInvalidated();
         return param1;
      }
      
      public function set_autoHideScrollBar(param1:Boolean) : Boolean
      {
         return _scrollbar.set_autoHide(param1);
      }
      
      public function set_alternateRows(param1:Boolean) : Boolean
      {
         _alternateRows = param1;
         setInvalidated();
         return param1;
      }
      
      public function set_alternateColor(param1:uint) : uint
      {
         _alternateColor = param1;
         setInvalidated();
         return param1;
      }
      
      public function scrollToSelection() : void
      {
         var _loc1_:int = int(Math.ceil(_height / _listItemHeight));
         if(_selectedIndex != -1)
         {
            if(_scrollbar.get_value() + _loc1_ < _selectedIndex)
            {
               _scrollbar.set_value(_selectedIndex - _loc1_ + 1);
            }
         }
         else
         {
            _scrollbar.set_value(0);
         }
         fillItems();
      }
      
      public function removeItemAt(param1:int) : void
      {
         if(param1 < 0 || param1 >= int(_items.length))
         {
            return;
         }
         _items.splice(param1,1);
         setInvalidated();
         makeListItems();
         fillItems();
      }
      
      public function removeItem(param1:Object) : void
      {
         var _loc2_:int = _items.indexOf(param1);
         removeItemAt(_loc2_);
      }
      
      public function removeAll() : void
      {
         _items.resize(0);
         setInvalidated();
         makeListItems();
         fillItems();
      }
      
      public function onSelect(param1:Event) : void
      {
         if(!(param1.target is ListItem))
         {
            return;
         }
         var _loc2_:int = int(_scrollbar.get_value());
         var _loc3_:int = 0;
         while(_loc3_ < _itemHolder.numChildren)
         {
            if(Object_Impl_.__eq(_itemHolder.getChildAt(_loc3_),param1.target))
            {
               _selectedIndex = _loc3_ + _loc2_;
            }
            _itemHolder.getChildAt(_loc3_).set_selected(false);
            _loc3_++;
         }
         param1.target.set_selected(true);
         dispatchEvent(new Event(Event.SELECT));
      }
      
      public function onScroll(param1:Event) : void
      {
         fillItems();
      }
      
      public function onResize(param1:Event) : void
      {
         makeListItems();
         fillItems();
      }
      
      public function onMouseWheel(param1:MouseEvent) : void
      {
         var _loc2_:VScrollBar = _scrollbar;
         _loc2_.set_value(_loc2_.get_value() - param1.delta);
         fillItems();
      }
      
      public function makeListItems() : void
      {
         var _loc1_:* = null as ListItem;
         var _loc5_:int = 0;
         while(_itemHolder.numChildren > 0)
         {
            _loc1_ = _itemHolder.getChildAt(0);
            _loc1_.removeEventListener(MouseEvent.CLICK,onSelect);
            _itemHolder.removeChildAt(0);
         }
         var _loc2_:int = int(Math.ceil(_height / _listItemHeight));
         _loc2_ = int(Math.min(_loc2_,int(_items.length)));
         _loc2_ = int(Math.max(_loc2_,1));
         var _loc3_:int = 0;
         var _loc4_:int = _loc2_;
         while(_loc3_ < _loc4_)
         {
            _loc5_ = _loc3_++;
            _loc1_ = Type.createInstance(_listItemClass,[_itemHolder,0,_loc5_ * _listItemHeight]);
            _loc1_.setSize(get_width(),_listItemHeight);
            _loc1_.set_defaultColor(_defaultColor);
            _loc1_.set_selectedColor(_selectedColor);
            _loc1_.set_rolloverColor(_rolloverColor);
            _loc1_.addEventListener(MouseEvent.CLICK,onSelect);
         }
      }
      
      override public function init() : void
      {
         super.init();
         setSize(100,100);
         addEventListener(MouseEvent.MOUSE_WHEEL,onMouseWheel);
         addEventListener(Event.RESIZE,onResize);
         makeListItems();
         fillItems();
      }
      
      public function get_selectedItem() : Object
      {
         if(_selectedIndex >= 0 && _selectedIndex < int(_items.length))
         {
            return _items[_selectedIndex];
         }
         return null;
      }
      
      public function get_selectedIndex() : int
      {
         return _selectedIndex;
      }
      
      public function get_selectedColor() : uint
      {
         return _selectedColor;
      }
      
      public function get_rolloverColor() : uint
      {
         return _rolloverColor;
      }
      
      public function get_listItemHeight() : Number
      {
         return _listItemHeight;
      }
      
      public function get_listItemClass() : Class
      {
         return _listItemClass;
      }
      
      public function get_items() : Array
      {
         return _items;
      }
      
      public function get_defaultColor() : uint
      {
         return _defaultColor;
      }
      
      public function get_autoHideScrollBar() : Boolean
      {
         return _scrollbar.get_autoHide();
      }
      
      public function get_alternateRows() : Boolean
      {
         return _alternateRows;
      }
      
      public function get_alternateColor() : uint
      {
         return _alternateColor;
      }
      
      public function fillItems() : void
      {
         var _loc6_:int = 0;
         var _loc7_:* = null as ListItem;
         var _loc8_:* = null;
         var _loc2_:int = int(_scrollbar.get_value());
         var _loc3_:int = int(Math.ceil(_height / _listItemHeight));
         _loc3_ = int(Math.min(_loc3_,int(_items.length)));
         var _loc4_:int = 0;
         var _loc5_:int = _loc3_;
         while(_loc4_ < _loc5_)
         {
            _loc6_ = _loc4_++;
            try
            {
               _loc7_ = _itemHolder.getChildAt(_loc6_);
            }
            catch(_loc_e_:*)
            {
               if(_loc7_ == null)
               {
                  _loc7_ = new ListItem();
               }
               if(_loc2_ + _loc6_ < int(_items.length))
               {
                  _loc7_.set_data(_items[_loc2_ + _loc6_]);
               }
               else
               {
                  _loc7_.set_data(null);
               }
               if(_alternateRows)
               {
                  _loc7_.set_defaultColor(int((_loc2_ + _loc6_) % 2) == 0 ? _defaultColor : _alternateColor);
               }
               else
               {
                  _loc7_.set_defaultColor(_defaultColor);
               }
               if(_loc2_ + _loc6_ == _selectedIndex)
               {
                  _loc7_.set_selected(true);
               }
               else
               {
                  _loc7_.set_selected(false);
               }
            }
         }
      }
      
      override public function draw() : void
      {
         super.draw();
         _selectedIndex = int(Math.min(_selectedIndex,int(_items.length) - 1));
         _panel.setSize(_width,_height);
         _panel.set_color(_defaultColor);
         _panel.draw();
         _scrollbar.set_x(_width - 15);
         var _loc1_:Number = int(_items.length) * _listItemHeight;
         _scrollbar.setThumbPercent(_height / _loc1_);
         var _loc2_:Number = Math.floor(_height / _listItemHeight);
         _scrollbar.set_maximum(Math.max(0,int(_items.length) - _loc2_));
         _scrollbar.set_pageSize(int(_loc2_));
         _scrollbar.set_height(_height);
         _scrollbar.draw();
         scrollToSelection();
      }
      
      public function addItemAt(param1:Object, param2:int) : void
      {
         param2 = int(Math.max(0,param2));
         param2 = int(Math.min(int(_items.length),param2));
         _items.insert(param2,param1);
         setInvalidated();
         makeListItems();
         fillItems();
      }
      
      public function addItem(param1:Object) : void
      {
         _items.push(param1);
         setInvalidated();
         makeListItems();
         fillItems();
      }
      
      override public function addChildren() : void
      {
         super.addChildren();
         _panel = new Panel(this,0,0);
         _panel.set_color(_defaultColor);
         _itemHolder = new Sprite();
         _panel.content.addChild(_itemHolder);
         _scrollbar = new VScrollBar(this,0,0,onScroll);
         _scrollbar.setSliderParams(0,0,0);
      }
   }
}

