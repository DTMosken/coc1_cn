package haxe.macro
{
   import flash.Boot;
   
   public final class Unop
   {
      
      public static const __isenum:Boolean = true;
      
      public static var OpDecrement:Unop = new Unop("OpDecrement",1,null);
      
      public static var OpIncrement:Unop = new Unop("OpIncrement",0,null);
      
      public static var OpNeg:Unop = new Unop("OpNeg",3,null);
      
      public static var OpNegBits:Unop = new Unop("OpNegBits",4,null);
      
      public static var OpNot:Unop = new Unop("OpNot",2,null);
      
      public static var OpSpread:Unop = new Unop("OpSpread",5,null);
      
      public static var __constructs__:Array = ["OpIncrement","OpDecrement","OpNot","OpNeg","OpNegBits","OpSpread"];
      
      public var tag:String;
      
      public var index:int;
      
      public var params:Array;
      
      public const __enum__:Boolean = true;
      
      public function Unop(param1:String, param2:int, param3:Array)
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

