package com.bit101.components
{
   import flash.Boot;
   import flash.display.BitmapData;
   import flash.display.DisplayObjectContainer;
   import flash.display.Graphics;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.filters.DropShadowFilter;
   import flash.geom.Rectangle;
   import openfl.display._internal.FlashGraphics;
   
   [Event(name="change",type="flash.events.Event")]
   public class Slider extends Component
   {
      
      public static var HORIZONTAL:String = "horizontal";
      
      public static var VERTICAL:String = "vertical";
      
      public var _value:Number;
      
      public var _tick:Number;
      
      public var _orientation:String;
      
      public var _min:Number;
      
      public var _max:Number;
      
      public var _handle:Sprite;
      
      public var _backClick:Boolean;
      
      public var _back:Sprite;
      
      public function Slider(param1:String = undefined, param2:DisplayObjectContainer = undefined, param3:Number = 0, param4:Number = 0, param5:Object = undefined)
      {
         if(param1 == null)
         {
            param1 = "horizontal";
         }
         if(Boot.skip_constructor)
         {
            return;
         }
         _tick = 0.01;
         _min = 0;
         _max = 100;
         _value = 0;
         _backClick = true;
         _orientation = param1;
         super(param2,param3,param4);
         if(param5 != null)
         {
            addEventListener(Event.CHANGE,param5);
         }
      }
      
      public function set_value(param1:Number) : Number
      {
         _value = param1;
         correctValue();
         positionHandle();
         return param1;
      }
      
      public function set_tick(param1:Number) : Number
      {
         return _tick = param1;
      }
      
      public function set_minimum(param1:Number) : Number
      {
         _min = param1;
         correctValue();
         positionHandle();
         return param1;
      }
      
      public function set_maximum(param1:Number) : Number
      {
         _max = param1;
         correctValue();
         positionHandle();
         return param1;
      }
      
      public function set_backClick(param1:Boolean) : Boolean
      {
         _backClick = param1;
         setInvalidated();
         return param1;
      }
      
      public function setSliderParams(param1:Number, param2:Number, param3:Number) : void
      {
         set_minimum(param1);
         set_maximum(param2);
         set_value(param3);
      }
      
      public function positionHandle() : void
      {
         var _loc1_:Number = NaN;
         if(_orientation == "horizontal")
         {
            _loc1_ = _width - _height;
            _handle.x = (_value - _min) / (_max - _min) * _loc1_;
         }
         else
         {
            _loc1_ = _height - _width;
            _handle.y = _height - _width - (_value - _min) / (_max - _min) * _loc1_;
         }
      }
      
      public function onSlide(param1:MouseEvent) : void
      {
         var _loc2_:Number = _value;
         if(_orientation == "horizontal")
         {
            _value = _handle.x / (get_width() - _height) * (_max - _min) + _min;
         }
         else
         {
            _value = (_height - _width - _handle.y) / (get_height() - _width) * (_max - _min) + _min;
         }
         if(_value != _loc2_)
         {
            dispatchEvent(new Event(Event.CHANGE));
         }
      }
      
      public function onDrop(param1:MouseEvent) : void
      {
         stage.removeEventListener(MouseEvent.MOUSE_UP,onDrop);
         stage.removeEventListener(MouseEvent.MOUSE_MOVE,onSlide);
         stopDrag();
      }
      
      public function onDrag(param1:MouseEvent) : void
      {
         stage.addEventListener(MouseEvent.MOUSE_UP,onDrop);
         stage.addEventListener(MouseEvent.MOUSE_MOVE,onSlide);
         if(_orientation == "horizontal")
         {
            _handle.startDrag(false,new Rectangle(0,0,_width - _height,0));
         }
         else
         {
            _handle.startDrag(false,new Rectangle(0,0,0,_height - _width));
         }
      }
      
      public function onBackClick(param1:MouseEvent) : void
      {
         if(_orientation == "horizontal")
         {
            _handle.x = mouseX - _height / 2;
            _handle.x = Math.max(_handle.x,0);
            _handle.x = Math.min(_handle.x,_width - _height);
            _value = _handle.x / (get_width() - _height) * (_max - _min) + _min;
         }
         else
         {
            _handle.y = mouseY - _width / 2;
            _handle.y = Math.max(_handle.y,0);
            _handle.y = Math.min(_handle.y,_height - _width);
            _value = (_height - _width - _handle.y) / (get_height() - _width) * (_max - _min) + _min;
         }
         dispatchEvent(new Event(Event.CHANGE));
      }
      
      override public function init() : void
      {
         super.init();
         if(_orientation == "horizontal")
         {
            setSize(100,10);
         }
         else
         {
            setSize(10,100);
         }
      }
      
      public function get_value() : Number
      {
         return Math.round(_value / _tick) * _tick;
      }
      
      public function get_tick() : Number
      {
         return _tick;
      }
      
      public function get_rawValue() : Number
      {
         return _value;
      }
      
      public function get_minimum() : Number
      {
         return _min;
      }
      
      public function get_maximum() : Number
      {
         return _max;
      }
      
      public function get_backClick() : Boolean
      {
         return _backClick;
      }
      
      public function drawHandle() : void
      {
         _handle.graphics.clear();
         var _loc1_:Graphics = _handle.graphics;
         var _loc2_:uint = Style.get_BUTTON_FACE();
         var _loc3_:BitmapData = null;
         FlashGraphics.bitmapFill[_loc1_] = _loc3_;
         _loc1_.beginFill(_loc2_,1);
         if(_orientation == "horizontal")
         {
            _handle.graphics.drawRect(1,1,_height - 2,_height - 2);
         }
         else
         {
            _handle.graphics.drawRect(1,1,_width - 2,_width - 2);
         }
         _loc1_ = _handle.graphics;
         _loc3_ = null;
         FlashGraphics.bitmapFill[_loc1_] = _loc3_;
         _loc1_.endFill();
         positionHandle();
      }
      
      public function drawBack() : void
      {
         _back.graphics.clear();
         var _loc1_:Graphics = _back.graphics;
         var _loc2_:uint = Style.get_BACKGROUND();
         var _loc3_:BitmapData = null;
         FlashGraphics.bitmapFill[_loc1_] = _loc3_;
         _loc1_.beginFill(_loc2_,1);
         _back.graphics.drawRect(0,0,_width,_height);
         _loc1_ = _back.graphics;
         _loc3_ = null;
         FlashGraphics.bitmapFill[_loc1_] = _loc3_;
         _loc1_.endFill();
         if(_backClick)
         {
            _back.addEventListener(MouseEvent.MOUSE_DOWN,onBackClick);
         }
         else
         {
            _back.removeEventListener(MouseEvent.MOUSE_DOWN,onBackClick);
         }
      }
      
      override public function draw() : void
      {
         super.draw();
         drawBack();
         drawHandle();
      }
      
      public function correctValue() : void
      {
         if(_max > _min)
         {
            _value = Math.min(_value,_max);
            _value = Math.max(_value,_min);
         }
         else
         {
            _value = Math.max(_value,_max);
            _value = Math.min(_value,_min);
         }
      }
      
      override public function addChildren() : void
      {
         _back = new Sprite();
         _back.filters = [getShadow(2,true)];
         addChild(_back);
         _handle = new Sprite();
         _handle.filters = [getShadow(1)];
         _handle.addEventListener(MouseEvent.MOUSE_DOWN,onDrag);
         _handle.buttonMode = true;
         _handle.useHandCursor = true;
         addChild(_handle);
      }
   }
}

