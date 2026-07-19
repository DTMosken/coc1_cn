package lime.app
{
   import flash.Boot;
   
   public class _Event_Float_Float_Void
   {
      
      public var canceled:Boolean;
      
      public var __repeat:Array;
      
      public var __priorities:Array;
      
      public var __listeners:Array;
      
      public function _Event_Float_Float_Void()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         canceled = false;
         __listeners = [];
         __priorities = [];
         __repeat = [];
      }
      
      public function removeAll() : void
      {
         var _loc1_:int = int(__listeners.length);
         __listeners.splice(0,_loc1_);
         __priorities.splice(0,_loc1_);
         __repeat.splice(0,_loc1_);
      }
      
      public function remove(param1:Object) : void
      {
         var _loc2_:int = int(__listeners.length);
         while(--_loc2_ >= 0)
         {
            if(Reflect.compareMethods(__listeners[_loc2_],param1))
            {
               __listeners.splice(_loc2_,1);
               __priorities.splice(_loc2_,1);
               __repeat.splice(_loc2_,1);
            }
         }
      }
      
      public function has(param1:Object) : Boolean
      {
         var _loc4_:* = null as Function;
         var _loc2_:int = 0;
         var _loc3_:Array = __listeners;
         while(_loc2_ < int(_loc3_.length))
         {
            _loc4_ = _loc3_[_loc2_];
            _loc2_++;
            if(Reflect.compareMethods(_loc4_,param1))
            {
               return true;
            }
         }
         return false;
      }
      
      public function dispatch(param1:Number, param2:Number) : void
      {
         canceled = false;
         var _loc3_:Array = __listeners;
         var _loc4_:Array = __repeat;
         var _loc5_:int = 0;
         while(_loc5_ < int(_loc3_.length))
         {
            _loc3_[_loc5_](param1,param2);
            if(!Boolean(_loc4_[_loc5_]))
            {
               remove(_loc3_[_loc5_]);
            }
            else
            {
               _loc5_++;
            }
            if(canceled)
            {
               break;
            }
         }
      }
      
      public function cancel() : void
      {
         canceled = true;
      }
      
      public function add(param1:Object, param2:Boolean = false, param3:int = 0) : void
      {
         var _loc6_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = int(__priorities.length);
         while(_loc4_ < _loc5_)
         {
            _loc6_ = _loc4_++;
            if(param3 > int(__priorities[_loc6_]))
            {
               __listeners.insert(_loc6_,param1);
               __priorities.insert(_loc6_,param3);
               __repeat.insert(_loc6_,!param2);
               return;
            }
         }
         __listeners.push(param1);
         __priorities.push(param3);
         __repeat.push(!param2);
      }
   }
}

