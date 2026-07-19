package haxe.macro
{
   import flash.Boot;
   
   public final class Constant
   {
      
      public static const __isenum:Boolean = true;
      
      public static var __constructs__:Array = ["CInt","CFloat","CString","CIdent","CRegexp"];
      
      public var tag:String;
      
      public var index:int;
      
      public var params:Array;
      
      public const __enum__:Boolean = true;
      
      public function Constant(param1:String, param2:int, param3:Array)
      {
         tag = param1;
         index = param2;
         params = param3;
      }
      
      public static function CFloat(param1:String, param2:String = undefined) : Constant
      {
         return new Constant("CFloat",1,[param1,param2]);
      }
      
      public static function CIdent(param1:String) : Constant
      {
         return new Constant("CIdent",3,[param1]);
      }
      
      public static function CInt(param1:String, param2:String = undefined) : Constant
      {
         return new Constant("CInt",0,[param1,param2]);
      }
      
      public static function CRegexp(param1:String, param2:String) : Constant
      {
         return new Constant("CRegexp",4,[param1,param2]);
      }
      
      public static function CString(param1:String, param2:StringLiteralKind = undefined) : Constant
      {
         return new Constant("CString",2,[param1,param2]);
      }
      
      final public function toString() : String
      {
         return Boot.enum_to_string(this);
      }
   }
}

