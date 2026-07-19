package lime.utils._LogLevel
{
   public final class LogLevel_Impl_
   {
      
      public static var init__:Boolean;
      
      public static var NONE:int;
      
      public static var ERROR:int;
      
      public static var WARN:int;
      
      public static var INFO:int;
      
      public static var DEBUG:int;
      
      public static var VERBOSE:int;
      
      public function LogLevel_Impl_()
      {
      }
      
      public static function gt(param1:int, param2:int) : Boolean
      {
         return param1 > param2;
      }
      
      public static function gte(param1:int, param2:int) : Boolean
      {
         return param1 >= param2;
      }
      
      public static function lt(param1:int, param2:int) : Boolean
      {
         return param1 < param2;
      }
      
      public static function lte(param1:int, param2:int) : Boolean
      {
         return param1 <= param2;
      }
   }
}

