package haxe.macro
{
   import flash.Boot;
   
   public final class StringLiteralKind
   {
      
      public static const __isenum:Boolean = true;
      
      public static var DoubleQuotes:StringLiteralKind = new StringLiteralKind("DoubleQuotes",0,null);
      
      public static var SingleQuotes:StringLiteralKind = new StringLiteralKind("SingleQuotes",1,null);
      
      public static var __constructs__:Array = ["DoubleQuotes","SingleQuotes"];
      
      public var tag:String;
      
      public var index:int;
      
      public var params:Array;
      
      public const __enum__:Boolean = true;
      
      public function StringLiteralKind(param1:String, param2:int, param3:Array)
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

