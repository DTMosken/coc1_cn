package motion.actuators
{
   import flash.Boot;
   import motion.Actuate;
   import motion.easing.IEasing;
   
   public class GenericActuator implements IGenericActuator
   {
      
      public var target:Object;
      
      public var special:Boolean;
      
      public var properties:*;
      
      public var id:String;
      
      public var duration:Number;
      
      public var _snapping:Boolean;
      
      public var _smartRotation:Boolean;
      
      public var _reverse:Boolean;
      
      public var _repeat:int;
      
      public var _reflect:Boolean;
      
      public var _onUpdateParams:Array;
      
      public var _onUpdate:*;
      
      public var _onResumeParams:Array;
      
      public var _onResume:*;
      
      public var _onRepeatParams:Array;
      
      public var _onRepeat:*;
      
      public var _onPauseParams:Array;
      
      public var _onPause:*;
      
      public var _onCompleteParams:Array;
      
      public var _onComplete:*;
      
      public var _ease:IEasing;
      
      public var _delay:Number;
      
      public var _autoVisible:Boolean;
      
      public function GenericActuator(param1:Object = undefined, param2:Number = 0, param3:* = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         _autoVisible = true;
         _delay = 0;
         _reflect = false;
         _repeat = 0;
         _reverse = false;
         _smartRotation = false;
         _snapping = false;
         special = false;
         target = param1;
         properties = param3;
         duration = param2;
         _ease = Actuate.defaultEase;
      }
      
      public function stop(param1:*, param2:Boolean, param3:Boolean) : void
      {
      }
      
      public function snapping(param1:Object = undefined) : IGenericActuator
      {
         if(param1 == null)
         {
            param1 = true;
         }
         _snapping = param1;
         special = true;
         return this;
      }
      
      public function smartRotation(param1:Object = undefined) : IGenericActuator
      {
         if(param1 == null)
         {
            param1 = true;
         }
         _smartRotation = param1;
         special = true;
         return this;
      }
      
      public function reverse(param1:Object = undefined) : IGenericActuator
      {
         if(param1 == null)
         {
            param1 = true;
         }
         _reverse = param1;
         special = true;
         return this;
      }
      
      public function resume() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null as Array;
         if(_onResume != null)
         {
            _loc1_ = _onResume;
            _loc2_ = _onResumeParams;
            if(_loc2_ == null)
            {
               _loc2_ = [];
            }
            _loc1_.apply(_loc1_,_loc2_);
         }
      }
      
      public function repeat(param1:Object = undefined) : IGenericActuator
      {
         if(param1 == null)
         {
            param1 = -1;
         }
         _repeat = param1;
         return this;
      }
      
      public function reflect(param1:Object = undefined) : IGenericActuator
      {
         if(param1 == null)
         {
            param1 = true;
         }
         _reflect = param1;
         special = true;
         return this;
      }
      
      public function pause() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null as Array;
         if(_onPause != null)
         {
            _loc1_ = _onPause;
            _loc2_ = _onPauseParams;
            if(_loc2_ == null)
            {
               _loc2_ = [];
            }
            _loc1_.apply(_loc1_,_loc2_);
         }
      }
      
      public function onUpdate(param1:*, param2:Array = undefined) : IGenericActuator
      {
         _onUpdate = param1;
         if(param2 == null)
         {
            _onUpdateParams = [];
         }
         else
         {
            _onUpdateParams = param2;
         }
         return this;
      }
      
      public function onResume(param1:*, param2:Array = undefined) : IGenericActuator
      {
         _onResume = param1;
         if(param2 == null)
         {
            _onResumeParams = [];
         }
         else
         {
            _onResumeParams = param2;
         }
         return this;
      }
      
      public function onRepeat(param1:*, param2:Array = undefined) : IGenericActuator
      {
         _onRepeat = param1;
         if(param2 == null)
         {
            _onRepeatParams = [];
         }
         else
         {
            _onRepeatParams = param2;
         }
         return this;
      }
      
      public function onPause(param1:*, param2:Array = undefined) : IGenericActuator
      {
         _onPause = param1;
         if(param2 == null)
         {
            _onPauseParams = [];
         }
         else
         {
            _onPauseParams = param2;
         }
         return this;
      }
      
      public function onComplete(param1:*, param2:Array = undefined) : IGenericActuator
      {
         _onComplete = param1;
         if(param2 == null)
         {
            _onCompleteParams = [];
         }
         else
         {
            _onCompleteParams = param2;
         }
         if(duration == 0)
         {
            complete();
         }
         return this;
      }
      
      public function move() : void
      {
      }
      
      public function ease(param1:IEasing) : IGenericActuator
      {
         _ease = param1;
         return this;
      }
      
      public function delay(param1:Number) : IGenericActuator
      {
         _delay = param1;
         return this;
      }
      
      public function complete(param1:Boolean = true) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null as Array;
         if(param1)
         {
            change();
            if(_onComplete != null)
            {
               _loc2_ = _onComplete;
               _loc3_ = _onCompleteParams;
               if(_loc3_ == null)
               {
                  _loc3_ = [];
               }
               _loc2_.apply(_loc2_,_loc3_);
            }
         }
         Actuate.unload(this);
      }
      
      public function change() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null as Array;
         if(_onUpdate != null)
         {
            _loc1_ = _onUpdate;
            _loc2_ = _onUpdateParams;
            if(_loc2_ == null)
            {
               _loc2_ = [];
            }
            _loc1_.apply(_loc1_,_loc2_);
         }
      }
      
      public function callMethod(param1:*, param2:Array = undefined) : *
      {
         if(param2 == null)
         {
            param2 = [];
         }
         return param1.apply(param1,param2);
      }
      
      public function autoVisible(param1:Object = undefined) : IGenericActuator
      {
         if(param1 == null)
         {
            param1 = true;
         }
         _autoVisible = param1;
         return this;
      }
      
      public function apply() : void
      {
         var _loc3_:* = null as String;
         var _loc1_:int = 0;
         var _loc2_:Array = Reflect.fields(properties);
         while(_loc1_ < int(_loc2_.length))
         {
            _loc3_ = _loc2_[_loc1_];
            _loc1_++;
            Reflect.setProperty(target,_loc3_,Reflect.field(properties,_loc3_));
         }
      }
   }
}

