package com.bit101.components
{
   import flash.Boot;
   import flash.display.BitmapData;
   import flash.display.DisplayObjectContainer;
   import flash.display.Graphics;
   import flash.events.MouseEvent;
   import openfl.display._internal.FlashGraphics;
   
   public class ListItem extends Component
   {
      
      public var _selectedColor:uint;
      
      public var _selected:Boolean;
      
      public var _rolloverColor:uint;
      
      public var _mouseOver:Boolean;
      
      public var _label:Label;
      
      public var _defaultColor:uint;
      
      public var _data:Object;
      
      public function ListItem(param1:DisplayObjectContainer = undefined, param2:Number = 0, param3:Number = 0, param4:Object = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         _mouseOver = false;
         _selected = false;
         _rolloverColor = 15658734;
         _selectedColor = 14540253;
         _defaultColor = 16777215;
         _data = param4;
         super(param1,param2,param3);
      }
      
      public function set_selectedColor(param1:uint) : uint
      {
         _selectedColor = param1;
         setInvalidated();
         return param1;
      }
      
      public function set_selected(param1:Boolean) : Boolean
      {
         _selected = param1;
         setInvalidated();
         return param1;
      }
      
      public function set_rolloverColor(param1:uint) : uint
      {
         _rolloverColor = param1;
         setInvalidated();
         return param1;
      }
      
      public function set_defaultColor(param1:uint) : uint
      {
         _defaultColor = param1;
         setInvalidated();
         return param1;
      }
      
      public function set_data(param1:Object) : Object
      {
         _data = param1;
         setInvalidated();
         return param1;
      }
      
      public function onMouseOver(param1:MouseEvent) : void
      {
         addEventListener(MouseEvent.MOUSE_OUT,onMouseOut);
         _mouseOver = true;
         setInvalidated();
      }
      
      public function onMouseOut(param1:MouseEvent) : void
      {
         removeEventListener(MouseEvent.MOUSE_OUT,onMouseOut);
         _mouseOver = false;
         setInvalidated();
      }
      
      override public function init() : void
      {
         super.init();
         addEventListener(MouseEvent.MOUSE_OVER,onMouseOver);
         setSize(100,20);
      }
      
      public function get_selectedColor() : uint
      {
         return _selectedColor;
      }
      
      public function get_selected() : Boolean
      {
         return _selected;
      }
      
      public function get_rolloverColor() : uint
      {
         return _rolloverColor;
      }
      
      public function get_defaultColor() : uint
      {
         return _defaultColor;
      }
      
      public function get_data() : Object
      {
         return _data;
      }
      
      override public function draw() : void
      {
         var _loc1_:* = null as Graphics;
         var _loc2_:* = null as BitmapData;
         super.draw();
         graphics.clear();
         if(_selected)
         {
            _loc1_ = graphics;
            _loc2_ = null;
            FlashGraphics.bitmapFill[_loc1_] = _loc2_;
            _loc1_.beginFill(_selectedColor,1);
         }
         else if(_mouseOver)
         {
            _loc1_ = graphics;
            _loc2_ = null;
            FlashGraphics.bitmapFill[_loc1_] = _loc2_;
            _loc1_.beginFill(_rolloverColor,1);
         }
         else
         {
            _loc1_ = graphics;
            _loc2_ = null;
            FlashGraphics.bitmapFill[_loc1_] = _loc2_;
            _loc1_.beginFill(_defaultColor,1);
         }
         graphics.drawRect(0,0,get_width(),get_height());
         _loc1_ = graphics;
         _loc2_ = null;
         FlashGraphics.bitmapFill[_loc1_] = _loc2_;
         _loc1_.endFill();
         if(_data == null)
         {
            return;
         }
         if(_data is String)
         {
            _label.set_text(Std.string(_data));
            return;
         }
         var _loc3_:String = Reflect.getProperty(_data,"label");
         if(_loc3_ != null && _loc3_ is String)
         {
            _label.set_text(_loc3_);
         }
         else
         {
            _label.set_text(Std.string(_data));
         }
      }
      
      override public function addChildren() : void
      {
         super.addChildren();
         _label = new Label(this,5,0);
         _label.draw();
      }
   }
}

