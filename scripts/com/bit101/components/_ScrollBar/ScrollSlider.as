package com.bit101.components._ScrollBar
{
   import com.bit101.components.Slider;
   import com.bit101.components.Style;
   import flash.Boot;
   import flash.display.BitmapData;
   import flash.display.DisplayObjectContainer;
   import flash.display.Graphics;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   import openfl.display._internal.FlashGraphics;
   
   public class ScrollSlider extends Slider
   {
      
      public var _thumbPercent:Number;
      
      public var _pageSize:int;
      
      public function ScrollSlider(param1:String = undefined, param2:DisplayObjectContainer = undefined, param3:Number = 0, param4:Number = 0, param5:Object = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         _pageSize = 1;
         _thumbPercent = 1;
         super(param1,param2,param3,param4);
         if(param5 != null)
         {
            addEventListener(Event.CHANGE,param5);
         }
      }
      
      public function set_pageSize(param1:int) : int
      {
         _pageSize = param1;
         setInvalidated();
         return param1;
      }
      
      public function setThumbPercent(param1:Number) : void
      {
         _thumbPercent = Math.min(param1,1);
         setInvalidated();
         draw();
      }
      
      override public function positionHandle() : void
      {
         var _loc1_:Number = NaN;
         if(_value == _min || _max == _min)
         {
            _handle.x = 0;
            _handle.y = 0;
            return;
         }
         if(_orientation == "horizontal")
         {
            _loc1_ = get_width() - _handle.width;
            _handle.x = (_value - _min) / (_max - _min) * _loc1_;
         }
         else
         {
            _loc1_ = get_height() - _handle.height;
            _handle.y = (_value - _min) / (_max - _min) * _loc1_;
         }
      }
      
      override public function onSlide(param1:MouseEvent) : void
      {
         var _loc2_:Number = _value;
         if(_orientation == "horizontal")
         {
            if(_width == _handle.width)
            {
               _value = _min;
            }
            else
            {
               _value = _handle.x / (_width - _handle.width) * (_max - _min) + _min;
            }
         }
         else if(_height == _handle.height)
         {
            _value = _min;
         }
         else
         {
            _value = _handle.y / (_height - _handle.height) * (_max - _min) + _min;
         }
         if(_value != _loc2_)
         {
            dispatchEvent(new Event(Event.CHANGE));
         }
      }
      
      override public function onDrag(param1:MouseEvent) : void
      {
         stage.addEventListener(MouseEvent.MOUSE_UP,onDrop);
         stage.addEventListener(MouseEvent.MOUSE_MOVE,onSlide);
         if(_orientation == "horizontal")
         {
            _handle.startDrag(false,new Rectangle(0,0,_width - _handle.width,0));
         }
         else
         {
            _handle.startDrag(false,new Rectangle(0,0,0,_height - _handle.height));
         }
      }
      
      override public function onBackClick(param1:MouseEvent) : void
      {
         if(_orientation == "horizontal")
         {
            if(mouseX < _handle.x)
            {
               if(_max > _min)
               {
                  _value -= _pageSize;
               }
               else
               {
                  _value += _pageSize;
               }
               correctValue();
            }
            else
            {
               if(_max > _min)
               {
                  _value += _pageSize;
               }
               else
               {
                  _value -= _pageSize;
               }
               correctValue();
            }
            positionHandle();
         }
         else
         {
            if(mouseY < _handle.y)
            {
               if(_max > _min)
               {
                  _value -= _pageSize;
               }
               else
               {
                  _value += _pageSize;
               }
               correctValue();
            }
            else
            {
               if(_max > _min)
               {
                  _value += _pageSize;
               }
               else
               {
                  _value -= _pageSize;
               }
               correctValue();
            }
            positionHandle();
         }
         dispatchEvent(new Event(Event.CHANGE));
      }
      
      override public function init() : void
      {
         super.init();
         setSliderParams(1,1,0);
         set_backClick(true);
      }
      
      public function get_thumbPercent() : Number
      {
         return _thumbPercent;
      }
      
      public function get_pageSize() : int
      {
         return _pageSize;
      }
      
      override public function drawHandle() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:* = null as Graphics;
         var _loc3_:* = null as BitmapData;
         var _loc4_:uint = 0;
         _handle.graphics.clear();
         if(_orientation == "horizontal")
         {
            _loc1_ = Math.round(_width * _thumbPercent);
            _loc1_ = Math.max(_height,_loc1_);
            _loc2_ = _handle.graphics;
            _loc3_ = null;
            FlashGraphics.bitmapFill[_loc2_] = _loc3_;
            _loc2_.beginFill(0,0);
            _handle.graphics.drawRect(0,0,_loc1_,_height);
            _loc2_ = _handle.graphics;
            _loc3_ = null;
            FlashGraphics.bitmapFill[_loc2_] = _loc3_;
            _loc2_.endFill();
            _loc2_ = _handle.graphics;
            _loc4_ = Style.get_BUTTON_FACE();
            _loc3_ = null;
            FlashGraphics.bitmapFill[_loc2_] = _loc3_;
            _loc2_.beginFill(_loc4_,1);
            _handle.graphics.drawRect(1,1,_loc1_ - 2,_height - 2);
         }
         else
         {
            _loc1_ = Math.round(_height * _thumbPercent);
            _loc1_ = Math.max(_width,_loc1_);
            _loc2_ = _handle.graphics;
            _loc3_ = null;
            FlashGraphics.bitmapFill[_loc2_] = _loc3_;
            _loc2_.beginFill(0,0);
            _handle.graphics.drawRect(0,0,_width - 2,_loc1_);
            _loc2_ = _handle.graphics;
            _loc3_ = null;
            FlashGraphics.bitmapFill[_loc2_] = _loc3_;
            _loc2_.endFill();
            _loc2_ = _handle.graphics;
            _loc4_ = Style.get_BUTTON_FACE();
            _loc3_ = null;
            FlashGraphics.bitmapFill[_loc2_] = _loc3_;
            _loc2_.beginFill(_loc4_,1);
            _handle.graphics.drawRect(1,1,_width - 2,_loc1_ - 2);
         }
         _loc2_ = _handle.graphics;
         _loc3_ = null;
         FlashGraphics.bitmapFill[_loc2_] = _loc3_;
         _loc2_.endFill();
         positionHandle();
      }
   }
}

