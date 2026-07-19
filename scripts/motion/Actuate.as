package motion
{
   import flash.display.DisplayObject;
   import haxe.ds.ObjectMap;
   import motion._Actuate.EffectsOptions;
   import motion._Actuate.TransformOptions;
   import motion._Actuate.TweenTimer;
   import motion.actuators.GenericActuator;
   import motion.actuators.IGenericActuator;
   import motion.actuators.MethodActuator;
   import motion.actuators.MotionPathActuator;
   import motion.easing.IEasing;
   
   public class Actuate
   {
      
      public static var init__:Boolean;
      
      public static var defaultActuator:Class;
      
      public static var defaultEase:IEasing;
      
      public static var targetLibraries:ObjectMap;
      
      public function Actuate()
      {
      }
      
      public static function apply(param1:Object, param2:*, param3:Class = undefined) : GenericActuator
      {
         Actuate.stop(param1,param2);
         if(param3 == null)
         {
            param3 = Actuate.defaultActuator;
         }
         var _loc4_:GenericActuator = Type.createInstance(param3,[param1,0,param2]);
         _loc4_.apply();
         return _loc4_;
      }
      
      public static function effects(param1:DisplayObject, param2:Number, param3:Boolean = true) : EffectsOptions
      {
         return new EffectsOptions(param1,param2,param3);
      }
      
      public static function getLibrary(param1:Object, param2:Boolean = true) : Array
      {
         if(Actuate.targetLibraries[param1] == null && param2)
         {
            Actuate.targetLibraries[param1] = [];
         }
         return Actuate.targetLibraries[param1];
      }
      
      public static function isActive() : Boolean
      {
         var _loc3_:* = null as Array;
         var _loc1_:Boolean = false;
         var _loc2_:* = Actuate.targetLibraries.iterator();
         if(Boolean(_loc2_.hasNext()))
         {
            _loc3_ = _loc2_.next();
            _loc1_ = true;
         }
         return _loc1_;
      }
      
      public static function motionPath(param1:Object, param2:Number, param3:*, param4:Boolean = true) : GenericActuator
      {
         return Actuate.tween(param1,param2,param3,param4,MotionPathActuator);
      }
      
      public static function pause(param1:Object) : void
      {
         var _loc2_:* = null as IGenericActuator;
         var _loc3_:* = null as Array;
         var _loc4_:int = 0;
         if(param1 is IGenericActuator)
         {
            _loc2_ = param1;
            _loc2_.pause();
         }
         else
         {
            _loc3_ = Actuate.getLibrary(param1,false);
            if(_loc3_ != null)
            {
               _loc4_ = 0;
               while(_loc4_ < int(_loc3_.length))
               {
                  _loc2_ = _loc3_[_loc4_];
                  _loc4_++;
                  _loc2_.pause();
               }
            }
         }
      }
      
      public static function pauseAll() : void
      {
         var _loc2_:* = null as Array;
         var _loc3_:int = 0;
         var _loc4_:* = null as IGenericActuator;
         var _loc1_:* = Actuate.targetLibraries.iterator();
         while(Boolean(_loc1_.hasNext()))
         {
            _loc2_ = _loc1_.next();
            _loc3_ = 0;
            while(_loc3_ < int(_loc2_.length))
            {
               _loc4_ = _loc2_[_loc3_];
               _loc3_++;
               _loc4_.pause();
            }
         }
      }
      
      public static function reset() : void
      {
         var _loc2_:* = null as Array;
         var _loc3_:int = 0;
         var _loc1_:* = Actuate.targetLibraries.iterator();
         while(Boolean(_loc1_.hasNext()))
         {
            _loc2_ = _loc1_.next();
            _loc3_ = int(_loc2_.length) - 1;
            while(_loc3_ >= 0)
            {
               _loc2_[_loc3_].stop(null,false,false);
               _loc3_--;
            }
         }
         Actuate.targetLibraries = new ObjectMap();
      }
      
      public static function resume(param1:Object) : void
      {
         var _loc2_:* = null as IGenericActuator;
         var _loc3_:* = null as Array;
         var _loc4_:int = 0;
         if(param1 is IGenericActuator)
         {
            _loc2_ = param1;
            _loc2_.resume();
         }
         else
         {
            _loc3_ = Actuate.getLibrary(param1,false);
            if(_loc3_ != null)
            {
               _loc4_ = 0;
               while(_loc4_ < int(_loc3_.length))
               {
                  _loc2_ = _loc3_[_loc4_];
                  _loc4_++;
                  _loc2_.resume();
               }
            }
         }
      }
      
      public static function resumeAll() : void
      {
         var _loc2_:* = null as Array;
         var _loc3_:int = 0;
         var _loc4_:* = null as IGenericActuator;
         var _loc1_:* = Actuate.targetLibraries.iterator();
         while(Boolean(_loc1_.hasNext()))
         {
            _loc2_ = _loc1_.next();
            _loc3_ = 0;
            while(_loc3_ < int(_loc2_.length))
            {
               _loc4_ = _loc2_[_loc3_];
               _loc3_++;
               _loc4_.resume();
            }
         }
      }
      
      public static function stop(param1:Object, param2:* = undefined, param3:Boolean = false, param4:Boolean = true) : void
      {
         var _loc5_:* = null as IGenericActuator;
         var _loc6_:* = null as Array;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:int = 0;
         var _loc10_:* = null as Array;
         var _loc11_:* = null;
         if(param1 != null)
         {
            if(param1 is IGenericActuator)
            {
               _loc5_ = param1;
               _loc5_.stop(null,param3,param4);
            }
            else
            {
               _loc6_ = Actuate.getLibrary(param1,false);
               if(_loc6_ != null)
               {
                  if(param2 is String)
                  {
                     _loc7_ = {};
                     _loc8_ = null;
                     _loc7_[param2] = _loc8_;
                     param2 = _loc7_;
                  }
                  else if(param2 is Array)
                  {
                     _loc7_ = {};
                     _loc9_ = 0;
                     _loc10_ = param2;
                     while(_loc9_ < int(_loc10_.length))
                     {
                        _loc8_ = _loc10_[_loc9_];
                        _loc9_++;
                        _loc11_ = null;
                        _loc7_[_loc8_] = _loc11_;
                     }
                     param2 = _loc7_;
                  }
                  _loc9_ = int(_loc6_.length) - 1;
                  while(_loc9_ >= 0)
                  {
                     _loc6_[_loc9_].stop(param2,param3,param4);
                     _loc9_--;
                  }
               }
            }
         }
      }
      
      public static function timer(param1:Number, param2:Class = undefined) : GenericActuator
      {
         return Actuate.tween(new TweenTimer(0),param1,new TweenTimer(1),false,param2);
      }
      
      public static function transform(param1:Object, param2:Number = 0, param3:Boolean = true) : TransformOptions
      {
         return new TransformOptions(param1,param2,param3);
      }
      
      public static function tween(param1:Object, param2:Number, param3:*, param4:Boolean = true, param5:Class = undefined) : GenericActuator
      {
         var _loc6_:* = null as GenericActuator;
         var _loc7_:* = null as Array;
         var _loc8_:int = 0;
         if(param1 != null)
         {
            if(param2 > 0)
            {
               if(param5 == null)
               {
                  param5 = Actuate.defaultActuator;
               }
               _loc6_ = Type.createInstance(param5,[param1,param2,param3]);
               _loc7_ = Actuate.getLibrary(_loc6_.target);
               if(param4)
               {
                  _loc8_ = int(_loc7_.length) - 1;
                  while(_loc8_ >= 0)
                  {
                     _loc7_[_loc8_].stop(_loc6_.properties,false,false);
                     _loc8_--;
                  }
                  _loc7_ = Actuate.getLibrary(_loc6_.target);
               }
               _loc7_.push(_loc6_);
               _loc6_.move();
               return _loc6_;
            }
            return Actuate.apply(param1,param3,param5);
         }
         return null;
      }
      
      public static function unload(param1:GenericActuator) : void
      {
         var _loc2_:Object = param1.target;
         if(Actuate.targetLibraries[_loc2_] != null)
         {
            Actuate.targetLibraries[_loc2_].remove(param1);
            if(int(Actuate.targetLibraries[_loc2_].length) == 0)
            {
               Actuate.targetLibraries.remove(_loc2_);
            }
         }
      }
      
      public static function update(param1:Object, param2:Number, param3:Array = undefined, param4:Array = undefined, param5:Boolean = true) : GenericActuator
      {
         var _loc6_:* = {
            "start":param3,
            "end":param4
         };
         return Actuate.tween(param1,param2,_loc6_,param5,MethodActuator);
      }
   }
}

