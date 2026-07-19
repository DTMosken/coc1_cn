package lime.utils
{
   import flash.Boot;
   
   public final class TAError
   {
      
      public static const __isenum:Boolean = true;
      
      public static var RangeError:TAError = new TAError("RangeError",0,null);
      
      public static var __constructs__:Array = ["RangeError"];
      
      public var tag:String;
      
      public var index:int;
      
      public var params:Array;
      
      public const __enum__:Boolean = true;
      
      public function TAError(param1:String, param2:int, param3:Array)
      {
         tag = param1;
         index = param2;
         params = param3;
      }
      
      final public function toString() : String
      {
         return Boot.enum_to_string(this);
      }
   }
}

