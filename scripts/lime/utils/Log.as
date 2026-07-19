package lime.utils
{
   import haxe.Exception;
   
   public class Log
   {
      
      public static var level:int = 3;
      
      public static var throwErrors:Boolean = true;
      
      public function Log()
      {
      }
      
      public static function debug(param1:*, param2:Object = undefined) : void
      {
         var _loc3_:* = null;
         if(Log.level >= 4)
         {
            _loc3_ = "[" + param2.className + "] " + Std.string(param1);
            trace(Std.string(_loc3_));
         }
      }
      
      public static function error(param1:*, param2:Object = undefined) : void
      {
         var _loc3_:* = null as String;
         if(Log.level >= 1)
         {
            _loc3_ = "[" + param2.className + "] ERROR: " + Std.string(param1);
            if(Log.throwErrors)
            {
               throw Exception.thrown(_loc3_);
            }
            trace(Std.string(_loc3_));
         }
      }
      
      public static function info(param1:*, param2:Object = undefined) : void
      {
         var _loc3_:* = null;
         if(Log.level >= 3)
         {
            _loc3_ = "[" + param2.className + "] " + Std.string(param1);
            trace(Std.string(_loc3_));
         }
      }
      
      public static function print(param1:*) : void
      {
         trace(Std.string(param1));
      }
      
      public static function println(param1:*) : void
      {
         trace(Std.string(param1));
      }
      
      public static function verbose(param1:*, param2:Object = undefined) : void
      {
         var _loc3_:* = null;
         if(Log.level >= 5)
         {
            _loc3_ = "[" + param2.className + "] " + Std.string(param1);
            trace(Std.string(_loc3_));
         }
      }
      
      public static function warn(param1:*, param2:Object = undefined) : void
      {
         var _loc3_:* = null;
         if(Log.level >= 2)
         {
            _loc3_ = "[" + param2.className + "] WARNING: " + Std.string(param1);
            trace(Std.string(_loc3_));
         }
      }
   }
}

