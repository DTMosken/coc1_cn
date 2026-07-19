package haxe
{
   import flash.Boot;
   import haxe._CallStack.CallStack_Impl_;
   
   public class Exception extends Error
   {
      
      public var __skipStack:int;
      
      public var __previousException:Exception;
      
      public var __nativeStack:String;
      
      public var __nativeException:Error;
      
      public var __exceptionStack:Array;
      
      public function Exception(param1:String = undefined, param2:Exception = undefined, param3:* = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super(param1);
         __previousException = param2;
         if(param3 != null && param3 is Error)
         {
            __nativeException = param3;
            __nativeStack = NativeStackTrace.normalize(param3.getStackTrace());
         }
         else
         {
            __nativeException = this;
            __nativeStack = NativeStackTrace.normalize(new Error().getStackTrace(),1);
         }
      }
      
      public static function caught(param1:*) : Exception
      {
         if(param1 is Exception)
         {
            return param1;
         }
         if(param1 is Error)
         {
            return new Exception(param1.message,null,param1);
         }
         return new ValueException(param1,null,param1);
      }
      
      public static function thrown(param1:*) : *
      {
         var _loc2_:* = null as ValueException;
         if(param1 is Exception)
         {
            return param1.get_native();
         }
         if(param1 is Error)
         {
            return param1;
         }
         _loc2_ = new ValueException(param1);
         ++_loc2_.__skipStack;
         return _loc2_;
      }
      
      public function unwrap() : *
      {
         return __nativeException;
      }
      
      public function toString() : String
      {
         return get_message();
      }
      
      public function get_stack() : Array
      {
         var _loc2_:* = null as Array;
         var _loc1_:Array = __exceptionStack;
         if(_loc1_ == null)
         {
            return __exceptionStack = NativeStackTrace.toHaxe(__nativeStack,__skipStack);
         }
         return _loc1_;
      }
      
      public function get_previous() : Exception
      {
         return __previousException;
      }
      
      final public function get_native() : *
      {
         return __nativeException;
      }
      
      public function get_message() : String
      {
         return this.message;
      }
      
      public function details() : String
      {
         var _loc1_:* = null as String;
         var _loc2_:* = null as Array;
         var _loc3_:* = null as Exception;
         var _loc4_:* = null as Exception;
         var _loc5_:* = null as String;
         if(get_previous() == null)
         {
            _loc1_ = "Exception: " + toString();
            _loc2_ = get_stack();
            return _loc1_ + (_loc2_ == null ? "null" : CallStack_Impl_.toString(_loc2_));
         }
         _loc1_ = "";
         _loc3_ = this;
         _loc4_ = null;
         while(_loc3_ != null)
         {
            if(_loc4_ == null)
            {
               _loc5_ = "Exception: " + _loc3_.get_message();
               _loc2_ = _loc3_.get_stack();
               _loc1_ = _loc5_ + (_loc2_ == null ? "null" : CallStack_Impl_.toString(_loc2_)) + _loc1_;
            }
            else
            {
               _loc2_ = CallStack_Impl_.subtract(_loc3_.get_stack(),_loc4_.get_stack());
               _loc1_ = "Exception: " + _loc3_.get_message() + (_loc2_ == null ? "null" : CallStack_Impl_.toString(_loc2_)) + "\n\nNext " + _loc1_;
            }
            _loc4_ = _loc3_;
            _loc3_ = _loc3_.get_previous();
         }
         return _loc1_;
      }
      
      public function __shiftStack() : void
      {
         ++__skipStack;
      }
   }
}

