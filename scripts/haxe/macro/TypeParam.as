package haxe.macro
{
   import flash.Boot;
   
   public final class TypeParam
   {
      
      public static const __isenum:Boolean = true;
      
      public static var __constructs__:Array = ["TPType","TPExpr"];
      
      public var tag:String;
      
      public var index:int;
      
      public var params:Array;
      
      public const __enum__:Boolean = true;
      
      public function TypeParam(param1:String, param2:int, param3:Array)
      {
         tag = param1;
         index = param2;
         params = param3;
      }
      
      public static function TPExpr(param1:Object) : TypeParam
      {
         return new TypeParam("TPExpr",1,[param1]);
      }
      
      public static function TPType(param1:ComplexType) : TypeParam
      {
         return new TypeParam("TPType",0,[param1]);
      }
      
      final public function toString() : String
      {
         return Boot.enum_to_string(this);
      }
   }
}

