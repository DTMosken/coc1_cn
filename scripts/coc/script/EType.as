package coc.script
{
   import flash.Boot;
   
   public final class EType
   {
      
      public static const __isenum:Boolean = true;
      
      public static var __constructs__:Array = ["EObject","ELiteral","EUnary","EBinary","EConditional"];
      
      public var tag:String;
      
      public var index:int;
      
      public var params:Array;
      
      public const __enum__:Boolean = true;
      
      public function EType(param1:String, param2:int, param3:Array)
      {
         tag = param1;
         index = param2;
         params = param3;
      }
      
      public static function EBinary(param1:String, param2:EType, param3:EType) : EType
      {
         return new EType("EBinary",3,[param1,param2,param3]);
      }
      
      public static function EConditional(param1:EType, param2:EType, param3:EType) : EType
      {
         return new EType("EConditional",4,[param1,param2,param3]);
      }
      
      public static function ELiteral(param1:VType) : EType
      {
         return new EType("ELiteral",1,[param1]);
      }
      
      public static function EObject(param1:*) : EType
      {
         return new EType("EObject",0,[param1]);
      }
      
      public static function EUnary(param1:String, param2:EType) : EType
      {
         return new EType("EUnary",2,[param1,param2]);
      }
      
      final public function toString() : String
      {
         return Boot.enum_to_string(this);
      }
   }
}

