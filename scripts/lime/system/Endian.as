package lime.system
{
   import flash.Boot;
   
   public final class Endian
   {
      
      public static const __isenum:Boolean = true;
      
      public static var BIG_ENDIAN:Endian = new Endian("BIG_ENDIAN",1,null);
      
      public static var LITTLE_ENDIAN:Endian = new Endian("LITTLE_ENDIAN",0,null);
      
      public static var __constructs__:Array = ["LITTLE_ENDIAN","BIG_ENDIAN"];
      
      public var tag:String;
      
      public var index:int;
      
      public var params:Array;
      
      public const __enum__:Boolean = true;
      
      public function Endian(param1:String, param2:int, param3:Array)
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

