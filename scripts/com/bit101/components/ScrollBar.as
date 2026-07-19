package com.bit101.components
{
   import com.bit101.components._ScrollBar.ScrollSlider;
   import flash.Boot;
   import flash.display.BitmapData;
   import flash.display.DisplayObjectContainer;
   import flash.display.Graphics;
   import flash.display.Shape;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import openfl.display._internal.FlashGraphics;
   
   [Event(name="change",type="flash.events.Event")]
   public class ScrollBar extends Component
   {
      
      public static var DELAY_TIME:int = 500;
      
      public static var REPEAT_TIME:int = 100;
      
      public static var UP:String = "up";
      
      public static var DOWN:String = "down";
      
      public var _upButton:PushButton;
      
      public var _shouldRepeat:Boolean;
      
      public var _scrollSlider:ScrollSlider;
      
      public var _repeatTimer:Timer;
      
      public var _orientation:String;
      
      public var _lineSize:int;
      
      public var _downButton:PushButton;
      
      public var _direction:String;
      
      public var _delayTimer:Timer;
      
      public var _autoHide:Boolean;
      
      public var _activated:Boolean;
      
      public function ScrollBar(param1:String = undefined, param2:DisplayObjectContainer = undefined, param3:Number = 0, param4:Number = 0, param5:Object = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         _shouldRepeat = false;
         _lineSize = 1;
         _activated = true;
         _autoHide = false;
         _orientation = param1;
         super(param2,param3,param4);
         if(param5 != null)
         {
            addEventListener(Event.CHANGE,param5);
         }
      }
      
      public function set_value(param1:Number) : Number
      {
         return _scrollSlider.set_value(param1);
      }
      
      public function set_pageSize(param1:int) : int
      {
         _scrollSlider.set_pageSize(param1);
         setInvalidated();
         return param1;
      }
      
      public function set_minimum(param1:Number) : Number
      {
         return _scrollSlider.set_minimum(param1);
      }
      
      public function set_maximum(param1:Number) : Number
      {
         return _scrollSlider.set_maximum(param1);
      }
      
      public function set_lineSize(param1:int) : int
      {
         return _lineSize = param1;
      }
      
      public function set_autoHide(param1:Boolean) : Boolean
      {
         _autoHide = param1;
         setInvalidated();
         return param1;
      }
      
      public function set_activated(param1:Boolean) : Boolean
      {
         _activated = param1;
         setInvalidated();
         return param1;
      }
      
      public function setThumbPercent(param1:Number) : void
      {
         _scrollSlider.setThumbPercent(param1);
         draw();
      }
      
      public function setSliderParams(param1:Number, param2:Number, param3:Number) : void
      {
         _scrollSlider.setSliderParams(param1,param2,param3);
      }
      
      public function onUpClick(param1:MouseEvent) : void
      {
         goUp();
         _shouldRepeat = true;
         _direction = "up";
         _delayTimer.start();
         stage.addEventListener(MouseEvent.MOUSE_UP,onMouseGoUp);
      }
      
      public function onRepeat(param1:TimerEvent) : void
      {
         if(_direction == "up")
         {
            goUp();
         }
         else
         {
            goDown();
         }
      }
      
      public function onMouseGoUp(param1:MouseEvent) : void
      {
         _delayTimer.stop();
         _repeatTimer.stop();
         _shouldRepeat = false;
      }
      
      public function onDownClick(param1:MouseEvent) : void
      {
         goDown();
         _shouldRepeat = true;
         _direction = "down";
         _delayTimer.start();
         stage.addEventListener(MouseEvent.MOUSE_UP,onMouseGoUp);
      }
      
      public function onDelayComplete(param1:TimerEvent) : void
      {
         if(_shouldRepeat)
         {
            _repeatTimer.start();
         }
      }
      
      public function onChange(param1:Event) : void
      {
         dispatchEvent(param1);
      }
      
      override public function init() : void
      {
         super.init();
         if(_orientation == "horizontal")
         {
            setSize(100,10);
            scaleY += 0.5;
         }
         else
         {
            setSize(10,100);
            scaleX += 0.5;
         }
         _delayTimer = new Timer(500,1);
         _delayTimer.addEventListener(TimerEvent.TIMER_COMPLETE,onDelayComplete);
         _repeatTimer = new Timer(100);
         _repeatTimer.addEventListener(TimerEvent.TIMER,onRepeat);
      }
      
      public function goUp() : void
      {
         var _loc1_:ScrollSlider = _scrollSlider;
         _loc1_.set_value(_loc1_.get_value() - _lineSize);
         dispatchEvent(new Event(Event.CHANGE));
      }
      
      public function goDown() : void
      {
         var _loc1_:ScrollSlider = _scrollSlider;
         _loc1_.set_value(_loc1_.get_value() + _lineSize);
         dispatchEvent(new Event(Event.CHANGE));
      }
      
      public function get_value() : Number
      {
         return _scrollSlider.get_value();
      }
      
      public function get_pageSize() : int
      {
         return _scrollSlider.get_pageSize();
      }
      
      public function get_minimum() : Number
      {
         return _scrollSlider.get_minimum();
      }
      
      public function get_maximum() : Number
      {
         return _scrollSlider.get_maximum();
      }
      
      public function get_lineSize() : int
      {
         return _lineSize;
      }
      
      public function get_autoHide() : Boolean
      {
         return _autoHide;
      }
      
      public function get_activated() : Boolean
      {
         return _activated;
      }
      
      override public function draw() : void
      {
         super.draw();
         if(_orientation == "vertical")
         {
            _scrollSlider.set_x(0);
            _scrollSlider.set_y(10);
            _scrollSlider.set_width(10);
            _scrollSlider.set_height(_height - 20);
            _downButton.set_x(0);
            _downButton.set_y(_height - 10);
         }
         else
         {
            _scrollSlider.set_x(10);
            _scrollSlider.set_y(0);
            _scrollSlider.set_width(_width - 20);
            _scrollSlider.set_height(10);
            _downButton.set_x(_width - 10);
            _downButton.set_y(0);
         }
         _scrollSlider.draw();
         if(!_activated)
         {
            visible = false;
         }
         else if(_autoHide)
         {
            visible = _scrollSlider.get_thumbPercent() < 1;
         }
         else
         {
            visible = true;
         }
      }
      
      override public function addChildren() : void
      {
         var _loc3_:* = null as Graphics;
         var _loc4_:uint = 0;
         var _loc5_:* = null as BitmapData;
         _scrollSlider = new ScrollSlider(_orientation,this,0,10,onChange);
         _upButton = new PushButton(this,0,0,"");
         _upButton.addEventListener(MouseEvent.MOUSE_DOWN,onUpClick);
         _upButton.setSize(10,10);
         var _loc1_:Shape = new Shape();
         _upButton.addChild(_loc1_);
         _upButton.draw();
         _downButton = new PushButton(this,0,0,"");
         _downButton.addEventListener(MouseEvent.MOUSE_DOWN,onDownClick);
         _downButton.setSize(10,10);
         var _loc2_:Shape = new Shape();
         _downButton.addChild(_loc2_);
         _downButton.draw();
         if(_orientation == "vertical")
         {
            _loc3_ = _loc1_.graphics;
            _loc4_ = Style.get_DROPSHADOW();
            _loc5_ = null;
            FlashGraphics.bitmapFill[_loc3_] = _loc5_;
            _loc3_.beginFill(_loc4_,0.5);
            _loc1_.graphics.moveTo(5,3);
            _loc1_.graphics.lineTo(7,6);
            _loc1_.graphics.lineTo(3,6);
            _loc3_ = _loc1_.graphics;
            _loc5_ = null;
            FlashGraphics.bitmapFill[_loc3_] = _loc5_;
            _loc3_.endFill();
            _loc3_ = _loc2_.graphics;
            _loc4_ = Style.get_DROPSHADOW();
            _loc5_ = null;
            FlashGraphics.bitmapFill[_loc3_] = _loc5_;
            _loc3_.beginFill(_loc4_,0.5);
            _loc2_.graphics.moveTo(5,7);
            _loc2_.graphics.lineTo(7,4);
            _loc2_.graphics.lineTo(3,4);
            _loc3_ = _loc2_.graphics;
            _loc5_ = null;
            FlashGraphics.bitmapFill[_loc3_] = _loc5_;
            _loc3_.endFill();
         }
         else
         {
            _loc3_ = _loc1_.graphics;
            _loc4_ = Style.get_DROPSHADOW();
            _loc5_ = null;
            FlashGraphics.bitmapFill[_loc3_] = _loc5_;
            _loc3_.beginFill(_loc4_,0.5);
            _loc1_.graphics.moveTo(3,5);
            _loc1_.graphics.lineTo(6,7);
            _loc1_.graphics.lineTo(6,3);
            _loc3_ = _loc1_.graphics;
            _loc5_ = null;
            FlashGraphics.bitmapFill[_loc3_] = _loc5_;
            _loc3_.endFill();
            _loc3_ = _loc2_.graphics;
            _loc4_ = Style.get_DROPSHADOW();
            _loc5_ = null;
            FlashGraphics.bitmapFill[_loc3_] = _loc5_;
            _loc3_.beginFill(_loc4_,0.5);
            _loc2_.graphics.moveTo(7,5);
            _loc2_.graphics.lineTo(4,7);
            _loc2_.graphics.lineTo(4,3);
            _loc3_ = _loc2_.graphics;
            _loc5_ = null;
            FlashGraphics.bitmapFill[_loc3_] = _loc5_;
            _loc3_.endFill();
         }
      }
   }
}

