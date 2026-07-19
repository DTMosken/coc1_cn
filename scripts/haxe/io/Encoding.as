package haxe.io
{
   import flash.Boot;
   
   public final class Encoding
   {
      
      public static const __isenum:Boolean = true;
      
      public static var RawNative:Encoding = new Encoding("RawNative",1,null);
      
      public static var UTF8:Encoding = new Encoding("UTF8",0,null);
      
      public static var __constructs__:Array = ["UTF8","RawNative"];
      
      public var tag:String;
      
      public var index:int;
      
      public var params:Array;
      
      public const __enum__:Boolean = true;
      
      public function Encoding(param1:String, param2:int, param3:Array)
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

