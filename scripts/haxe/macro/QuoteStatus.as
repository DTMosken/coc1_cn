package haxe.macro
{
   import flash.Boot;
   
   public final class QuoteStatus
   {
      
      public static const __isenum:Boolean = true;
      
      public static var Quoted:QuoteStatus = new QuoteStatus("Quoted",1,null);
      
      public static var Unquoted:QuoteStatus = new QuoteStatus("Unquoted",0,null);
      
      public static var __constructs__:Array = ["Unquoted","Quoted"];
      
      public var tag:String;
      
      public var index:int;
      
      public var params:Array;
      
      public const __enum__:Boolean = true;
      
      public function QuoteStatus(param1:String, param2:int, param3:Array)
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

