package com.bit101.components
{
   import classes.internals.Utils;
   import flash.Boot;
   import flash.display.DisplayObjectContainer;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import openfl.utils._Object.Object_Impl_;
   
   [Event(name="select",type="flash.events.Event")]
   public class ComboBox extends Component
   {
      
      public static var TOP:String = "top";
      
      public static var BOTTOM:String = "bottom";
      
      public var _stage:Stage;
      
      public var _openPosition:String;
      
      public var _open:Boolean;
      
      public var _numVisibleItems:int;
      
      public var _list:List;
      
      public var _labelButton:PushButton;
      
      public var _items:Array;
      
      public var _dropDownButton:PushButton;
      
      public var _defaultLabel:String;
      
      public function ComboBox(param1:DisplayObjectContainer = undefined, param2:Number = 0, param3:Number = 0, param4:String = undefined, param5:Array = undefined)
      {
         if(param4 == null)
         {
            param4 = "";
         }
         if(Boot.skip_constructor)
         {
            return;
         }
         _openPosition = "bottom";
         _open = false;
         _numVisibleItems = 6;
         _defaultLabel = "";
         _defaultLabel = param4;
         _items = param5;
         addEventListener(Event.ADDED_TO_STAGE,onAddedToStage);
         addEventListener(Event.REMOVED_FROM_STAGE,onRemovedFromStage);
         super(param1,param2,param3);
      }
      
      public function set_selectedItem(param1:Object) : Object
      {
         _list.set_selectedItem(param1);
         setLabelButtonLabel();
         return param1;
      }
      
      public function set_selectedIndex(param1:int) : int
      {
         _list.set_selectedIndex(param1);
         setLabelButtonLabel();
         return param1;
      }
      
      public function set_selectedColor(param1:uint) : uint
      {
         return _list.set_selectedColor(param1);
      }
      
      public function set_rolloverColor(param1:uint) : uint
      {
         return _list.set_rolloverColor(param1);
      }
      
      public function set_openPosition(param1:String) : String
      {
         return _openPosition = param1;
      }
      
      public function set_numVisibleItems(param1:int) : int
      {
         _numVisibleItems = int(Math.max(1,param1));
         setInvalidated();
         return param1;
      }
      
      public function set_listItemHeight(param1:Number) : Number
      {
         _list.set_listItemHeight(param1);
         setInvalidated();
         return param1;
      }
      
      public function set_listItemClass(param1:Class) : Class
      {
         return _list.set_listItemClass(param1);
      }
      
      public function set_items(param1:Array) : Array
      {
         return _list.set_items(param1);
      }
      
      public function set_defaultLabel(param1:String) : String
      {
         _defaultLabel = param1;
         setLabelButtonLabel();
         return param1;
      }
      
      public function set_defaultColor(param1:uint) : uint
      {
         return _list.set_defaultColor(param1);
      }
      
      public function set_autoHideScrollBar(param1:Boolean) : Boolean
      {
         _list.set_autoHideScrollBar(param1);
         setInvalidated();
         return param1;
      }
      
      public function set_alternateRows(param1:Boolean) : Boolean
      {
         return _list.set_alternateRows(param1);
      }
      
      public function set_alternateColor(param1:uint) : uint
      {
         return _list.set_alternateColor(param1);
      }
      
      public function setLabelButtonLabel() : void
      {
         if(get_selectedItem() == null)
         {
            _labelButton.set_label(_defaultLabel);
            return;
         }
         if(get_selectedItem() is String)
         {
            _labelButton.set_label(Std.string(get_selectedItem()));
            return;
         }
         var _loc1_:String = Reflect.getProperty(get_selectedItem(),"label");
         if(_loc1_ != null && _loc1_ is String)
         {
            _labelButton.set_label(_loc1_);
         }
         else
         {
            _labelButton.set_label(Std.string(get_selectedItem()));
         }
      }
      
      public function removeList() : void
      {
         if(_stage == null)
         {
            return;
         }
         if(_stage.contains(_list))
         {
            _stage.removeChild(_list);
         }
         _stage.removeEventListener(MouseEvent.CLICK,onStageClick);
         _stage.removeEventListener(MouseEvent.MOUSE_WHEEL,onMouseWheel,true);
         _dropDownButton.set_label("+");
      }
      
      public function removeItemAt(param1:int) : void
      {
         _list.removeItemAt(param1);
      }
      
      public function removeItem(param1:Object) : void
      {
         _list.removeItem(param1);
      }
      
      public function removeAll() : void
      {
         _list.removeAll();
      }
      
      public function onStageClick(param1:MouseEvent) : void
      {
         if(Object_Impl_.__eq(param1.target,_dropDownButton) || Object_Impl_.__eq(param1.target,_labelButton))
         {
            return;
         }
         if(new Rectangle(_list.x,_list.y,_list.get_width(),_list.get_height()).contains(param1.stageX,param1.stageY))
         {
            return;
         }
         _open = false;
         removeList();
      }
      
      public function onSelect(param1:Event) : void
      {
         _open = false;
         _dropDownButton.set_label("+");
         if(stage != null && stage.contains(_list))
         {
            stage.removeChild(_list);
         }
         setLabelButtonLabel();
         dispatchEvent(param1);
      }
      
      public function onRemovedFromStage(param1:Event) : void
      {
         removeList();
      }
      
      public function onMouseWheel(param1:MouseEvent) : void
      {
         _list.onMouseWheel(param1);
         param1.stopImmediatePropagation();
      }
      
      public function onDropDown(param1:MouseEvent) : void
      {
         var _loc2_:* = null as Point;
         _open = !_open;
         if(_open)
         {
            _loc2_ = new Point();
            if(_openPosition == "bottom")
            {
               _loc2_.y = _height;
            }
            else
            {
               _loc2_.y = -_numVisibleItems * _list.get_listItemHeight();
            }
            _loc2_ = localToGlobal(_loc2_);
            _list.move(_loc2_.x,_loc2_.y);
            _stage.addChild(_list);
            _stage.addEventListener(MouseEvent.CLICK,onStageClick);
            _stage.addEventListener(MouseEvent.MOUSE_WHEEL,onMouseWheel,true);
            _dropDownButton.set_label("-");
         }
         else
         {
            removeList();
         }
      }
      
      public function onAddedToStage(param1:Event) : void
      {
         _stage = stage;
      }
      
      override public function init() : void
      {
         super.init();
         setSize(100,20);
         setLabelButtonLabel();
      }
      
      public function get_selectedItem() : Object
      {
         return _list.get_selectedItem();
      }
      
      public function get_selectedIndex() : int
      {
         return _list.get_selectedIndex();
      }
      
      public function get_selectedColor() : uint
      {
         return _list.get_selectedColor();
      }
      
      public function get_rolloverColor() : uint
      {
         return _list.get_rolloverColor();
      }
      
      public function get_openPosition() : String
      {
         return _openPosition;
      }
      
      public function get_numVisibleItems() : int
      {
         return _numVisibleItems;
      }
      
      public function get_listItemHeight() : Number
      {
         return _list.get_listItemHeight();
      }
      
      public function get_listItemClass() : Class
      {
         return _list.get_listItemClass();
      }
      
      public function get_items() : Array
      {
         return _list.get_items();
      }
      
      public function get_isOpen() : Boolean
      {
         return _open;
      }
      
      public function get_defaultLabel() : String
      {
         return _defaultLabel;
      }
      
      public function get_defaultColor() : uint
      {
         return _list.get_defaultColor();
      }
      
      public function get_autoHideScrollBar() : Boolean
      {
         return _list.get_autoHideScrollBar();
      }
      
      public function get_alternateRows() : Boolean
      {
         return _list.get_alternateRows();
      }
      
      public function get_alternateColor() : uint
      {
         return _list.get_alternateColor();
      }
      
      override public function draw() : void
      {
         super.draw();
         _labelButton.setSize(_width - _height + 1,_height);
         _labelButton.draw();
         _dropDownButton.setSize(_height,_height);
         _dropDownButton.draw();
         _dropDownButton.set_x(_width - get_height());
         _list.setSize(_width,Utils.boundInt(1,int(_list.get_items().length),_numVisibleItems) * _list.get_listItemHeight());
      }
      
      public function addItemAt(param1:Object, param2:int) : void
      {
         _list.addItemAt(param1,param2);
      }
      
      public function addItem(param1:Object) : void
      {
         _list.addItem(param1);
      }
      
      override public function addChildren() : void
      {
         super.addChildren();
         _list = new List(null,0,0,_items);
         _list.set_autoHideScrollBar(true);
         _list.addEventListener(Event.SELECT,onSelect);
         _labelButton = new PushButton(this,0,0,"",onDropDown);
         _dropDownButton = new PushButton(this,0,0,"+",onDropDown);
      }
   }
}

