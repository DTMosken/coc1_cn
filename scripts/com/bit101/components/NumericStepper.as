package com.bit101.components
{
   import flash.Boot;
   import flash.display.DisplayObjectContainer;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   [Event(name="change",type="flash.events.Event")]
   public class NumericStepper extends Component
   {
      
      public static var DELAY_TIME:int = 500;
      
      public static var UP:String = "up";
      
      public static var DOWN:String = "down";
      
      public var _valueText:InputText;
      
      public var _value:Number;
      
      public var _step:Number;
      
      public var _repeatTimer:Timer;
      
      public var _repeatTime:int;
      
      public var _plusBtn:PushButton;
      
      public var _minusBtn:PushButton;
      
      public var _minimum:Number;
      
      public var _maximum:Number;
      
      public var _labelPrecision:int;
      
      public var _direction:String;
      
      public var _delayTimer:Timer;
      
      public function NumericStepper(param1:DisplayObjectContainer = undefined, param2:Number = 0, param3:Number = 0, param4:Object = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         _minimum = -1.79e+308;
         _maximum = 1.79e+308;
         _labelPrecision = 1;
         _step = 1;
         _value = 0;
         _repeatTime = 100;
         super(param1,param2,param3);
         if(param4 != null)
         {
            addEventListener(Event.CHANGE,param4);
         }
      }
      
      public function set_value(param1:Number) : Number
      {
         if(param1 <= _maximum && param1 >= _minimum)
         {
            _value = param1;
            setInvalidated();
         }
         return param1;
      }
      
      public function set_step(param1:Number) : Number
      {
         if(param1 < 0)
         {
            throw new Error("NumericStepper step must be positive.");
         }
         return _step = param1;
      }
      
      public function set_repeatTime(param1:int) : int
      {
         _repeatTime = int(Math.max(param1,10));
         _repeatTimer.delay = _repeatTime;
         return param1;
      }
      
      public function set_minimum(param1:Number) : Number
      {
         _minimum = param1;
         if(_value < _minimum)
         {
            _value = _minimum;
            setInvalidated();
         }
         return param1;
      }
      
      public function set_maximum(param1:Number) : Number
      {
         _maximum = param1;
         if(_value > _maximum)
         {
            _value = _maximum;
            setInvalidated();
         }
         return param1;
      }
      
      public function set_labelPrecision(param1:int) : int
      {
         _labelPrecision = param1;
         setInvalidated();
         return param1;
      }
      
      public function onValueTextChange(param1:Event) : void
      {
         param1.stopImmediatePropagation();
         var _loc2_:Number = Std.parseFloat(_valueText.get_text());
         if(_loc2_ <= _maximum && _loc2_ >= _minimum)
         {
            _value = _loc2_;
            setInvalidated();
            dispatchEvent(new Event(Event.CHANGE));
         }
      }
      
      public function onRepeat(param1:TimerEvent) : void
      {
         if(_direction == "up")
         {
            increment();
         }
         else
         {
            decrement();
         }
      }
      
      public function onPlus(param1:MouseEvent) : void
      {
         increment();
         _direction = "up";
         _delayTimer.start();
         stage.addEventListener(MouseEvent.MOUSE_UP,onMouseGoUp);
      }
      
      public function onMouseGoUp(param1:MouseEvent) : void
      {
         _delayTimer.stop();
         _repeatTimer.stop();
      }
      
      public function onMinus(param1:MouseEvent) : void
      {
         decrement();
         _direction = "down";
         _delayTimer.start();
         stage.addEventListener(MouseEvent.MOUSE_UP,onMouseGoUp);
      }
      
      public function onDelayComplete(param1:TimerEvent) : void
      {
         _repeatTimer.start();
      }
      
      override public function init() : void
      {
         super.init();
         setSize(80,16);
         _delayTimer = new Timer(500,1);
         _delayTimer.addEventListener(TimerEvent.TIMER_COMPLETE,onDelayComplete);
         _repeatTimer = new Timer(_repeatTime);
         _repeatTimer.addEventListener(TimerEvent.TIMER,onRepeat);
      }
      
      public function increment() : void
      {
         if(_value + _step <= _maximum)
         {
            _value += _step;
            setInvalidated();
            dispatchEvent(new Event(Event.CHANGE));
         }
      }
      
      public function get_value() : Number
      {
         return _value;
      }
      
      public function get_step() : Number
      {
         return _step;
      }
      
      public function get_repeatTime() : int
      {
         return _repeatTime;
      }
      
      public function get_minimum() : Number
      {
         return _minimum;
      }
      
      public function get_maximum() : Number
      {
         return _maximum;
      }
      
      public function get_labelPrecision() : int
      {
         return _labelPrecision;
      }
      
      override public function draw() : void
      {
         _plusBtn.set_x(_width - 16);
         _minusBtn.set_x(_width - 32);
         _valueText.set_text(Std.string(Math.round(_value * Math.pow(10,_labelPrecision)) / Math.pow(10,_labelPrecision)));
         _valueText.set_width(_width - 32);
         _valueText.draw();
      }
      
      public function decrement() : void
      {
         if(_value - _step >= _minimum)
         {
            _value -= _step;
            setInvalidated();
            dispatchEvent(new Event(Event.CHANGE));
         }
      }
      
      override public function addChildren() : void
      {
         _valueText = new InputText(this,0,0,"0",onValueTextChange);
         _valueText.set_restrict("-0123456789.");
         _minusBtn = new PushButton(this,0,0,"-");
         _minusBtn.addEventListener(MouseEvent.MOUSE_DOWN,onMinus);
         _minusBtn.setSize(16,16);
         _plusBtn = new PushButton(this,0,0,"+");
         _plusBtn.addEventListener(MouseEvent.MOUSE_DOWN,onPlus);
         _plusBtn.setSize(16,16);
      }
   }
}

