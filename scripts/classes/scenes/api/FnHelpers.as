package classes.scenes.api
{
   import classes.BaseContent;
   import classes.Player;
   import classes.Time;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import flash.Boot;
   
   public class FnHelpers extends BaseContent
   {
      
      public static var init__:Boolean;
      
      public static var FN:FnHelpers;
      
      public function FnHelpers()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
      }
      
      public static function resultBind(param1:Function) : Function
      {
         var fn:Function = param1;
         return function(param1:Result):Result
         {
            var _loc2_:* = null as Object;
            switch(param1.index)
            {
               case 0:
                  _loc2_ = param1.params[0];
                  return fn(_loc2_);
               case 1:
                  _loc2_ = param1.params[0];
                  return Result.Failure(_loc2_);
               default:
                  return;
            }
         };
      }
      
      public static function chainBind(param1:Function) : Function
      {
         var fn:Function = param1;
         return function(param1:Object):Object
         {
            fn(param1);
            return param1;
         };
      }
      
      public static function resultMap(param1:Function) : Function
      {
         var fn:Function = param1;
         return FnHelpers.resultBind(function(param1:Object):Result
         {
            return Result.Success(fn(param1));
         });
      }
      
      public function product(param1:Array) : Function
      {
         var _g:FnHelpers = this;
         var chances1:Array = param1.copy();
         return function():Number
         {
            return _g.innerProduct(chances1);
         };
      }
      
      public function not(param1:Function) : Function
      {
         var chance:Function = param1;
         return function():Number
         {
            if(Boolean(chance()))
            {
               return 0;
            }
            return 1;
         };
      }
      
      public function none(param1:Array) : Function
      {
         var _g:FnHelpers = this;
         var chances1:Array = param1;
         return function():Number
         {
            return _g.innerNone(chances1);
         };
      }
      
      public function logScale(param1:Number, param2:Object, param3:Number = -1.79e+308, param4:Number = 1.79e+308) : Number
      {
         var _loc5_:Number = Number(param2.a) * Math.log(param1 - Number(param2.c)) + Number(param2.b);
         return Math.min(param4,Math.max(param3,_loc5_));
      }
      
      public function lineByLevel(param1:int, param2:int, param3:Number, param4:Number, param5:Boolean = true, param6:Number = -1.79e+308, param7:Number = 1.79e+308) : Function
      {
         var levelA:int = param1;
         var levelB:int = param2;
         var valueA:Number = param3;
         var valueB:Number = param4;
         var bound:Boolean = param5;
         var min:Number = param6;
         var max:Number = param7;
         var _gthis:FnHelpers = this;
         return function():Number
         {
            return _gthis.lerp(_gthis.get_player().level,levelA,levelB,valueA,valueB,bound,min,max);
         };
      }
      
      public function lerp(param1:Number, param2:int, param3:int, param4:Number, param5:Number, param6:Boolean = true, param7:Number = -1.79e+308, param8:Number = 1.79e+308) : Number
      {
         if(param6)
         {
            if(param1 <= param2)
            {
               return param4;
            }
            if(param1 >= param3)
            {
               return param5;
            }
         }
         if(param2 == param3)
         {
            return (param4 + param5) / 2;
         }
         var _loc9_:Number = param4 + (param1 - param2) * (param5 - param4) / (param3 - param2);
         return Math.min(param8,Math.max(param7,_loc9_));
      }
      
      public function innerProduct(param1:Array) : Number
      {
         var _loc4_:* = null as Function;
         var _loc5_:Number = NaN;
         var _loc2_:Number = 1;
         var _loc3_:int = 0;
         while(_loc3_ < int(param1.length))
         {
            _loc4_ = param1[_loc3_];
            _loc3_++;
            _loc5_ = Number(_loc4_());
            if(_loc5_ <= 0)
            {
               return 0;
            }
            _loc2_ *= _loc5_;
         }
         return _loc2_;
      }
      
      public function innerNone(param1:Array) : Number
      {
         var _loc3_:* = null as Function;
         var _loc2_:int = 0;
         while(_loc2_ < int(param1.length))
         {
            _loc3_ = param1[_loc2_];
            _loc2_++;
            if(Number(_loc3_()) > 0)
            {
               return 0;
            }
         }
         return 1;
      }
      
      public function innerAny(param1:Array) : Number
      {
         var _loc3_:* = null as Function;
         var _loc2_:int = 0;
         while(_loc2_ < int(param1.length))
         {
            _loc3_ = param1[_loc2_];
            _loc2_++;
            if(Number(_loc3_()) > 0)
            {
               return 1;
            }
         }
         return 0;
      }
      
      public function innerAll(param1:Array) : Number
      {
         var _loc3_:* = null as Function;
         var _loc2_:int = 0;
         while(_loc2_ < int(param1.length))
         {
            _loc3_ = param1[_loc2_];
            _loc2_++;
            if(Number(_loc3_()) <= 0)
            {
               return 0;
            }
         }
         return 1;
      }
      
      public function ifTimeOfDay(param1:int, param2:int, param3:Number = 1, param4:Number = 0) : Function
      {
         var minimum:int = param1;
         var maximum:int = param2;
         var iftrue:Number = param3;
         var iffalse:Number = param4;
         var _gthis:FnHelpers = this;
         return function():Number
         {
            var _loc1_:int = _gthis.get_time().hours;
            if(_loc1_ >= minimum && _loc1_ < maximum)
            {
               return iftrue;
            }
            return iffalse;
         };
      }
      
      public function ifPregnantWith(param1:int, param2:Number = 1, param3:Number = 0) : Function
      {
         var pregnancyType:int = param1;
         var iftrue:Number = param2;
         var iffalse:Number = param3;
         var _gthis:FnHelpers = this;
         return function():Number
         {
            if(_gthis.get_player().get_pregnancyIncubation() > 1 && _gthis.get_player().get_pregnancyType() == pregnancyType)
            {
               return iftrue;
            }
            return iffalse;
         };
      }
      
      public function ifNGplusMin(param1:int, param2:Number = 1, param3:Number = 0) : Function
      {
         var minimum:int = param1;
         var iftrue:Number = param2;
         var iffalse:Number = param3;
         var _loc4_:FnHelpers = this;
         return function():Number
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2979) >= minimum)
            {
               return iftrue;
            }
            return iffalse;
         };
      }
      
      public function ifLevelMin(param1:int, param2:int = 6, param3:Number = 1, param4:Number = 0) : Function
      {
         var level:int = param1;
         var daysPerLevel:int = param2;
         var iftrue:Number = param3;
         var iffalse:Number = param4;
         var _gthis:FnHelpers = this;
         return function():Number
         {
            if(_gthis.get_player().level >= level || _gthis.get_time().days >= level * daysPerLevel)
            {
               return iftrue;
            }
            return iffalse;
         };
      }
      
      public function buildLogScaleABC(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number) : Object
      {
         var _loc6_:Number = (param5 - param4) / 2;
         var _loc7_:Number = (param2 * param2 - param1 * param3) / (2 * param2 - param1 - param3);
         var _loc8_:Number = _loc6_ / Math.log((param2 - _loc7_) / (param1 - _loc7_));
         var _loc9_:Number = param4 - _loc8_ * Math.log(param1 - _loc7_);
         return {
            "a":_loc8_,
            "b":_loc9_,
            "c":_loc7_
         };
      }
      
      public function any(param1:Array) : Function
      {
         var _g:FnHelpers = this;
         var chances1:Array = param1;
         return function():Number
         {
            return _g.innerAny(chances1);
         };
      }
      
      public function all(param1:Array) : Function
      {
         var _g:FnHelpers = this;
         var chances1:Array = param1.copy();
         return function():Number
         {
            return _g.innerAll(chances1);
         };
      }
   }
}

