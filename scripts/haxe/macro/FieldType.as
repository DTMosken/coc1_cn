package haxe.macro
{
   import flash.Boot;
   
   public final class FieldType
   {
      
      public static const __isenum:Boolean = true;
      
      public static var __constructs__:Array = ["FVar","FFun","FProp"];
      
      public var tag:String;
      
      public var index:int;
      
      public var params:Array;
      
      public const __enum__:Boolean = true;
      
      public function FieldType(param1:String, param2:int, param3:Array)
      {
         tag = param1;
         index = param2;
         params = param3;
      }
      
      public static function FFun(param1:Object) : FieldType
      {
         return new FieldType("FFun",1,[param1]);
      }
      
      public static function FProp(param1:String, param2:String, param3:ComplexType = undefined, param4:Object = undefined) : FieldType
      {
         return new FieldType("FProp",2,[param1,param2,param3,param4]);
      }
      
      public static function FVar(param1:ComplexType, param2:Object = undefined) : FieldType
      {
         return new FieldType("FVar",0,[param1,param2]);
      }
      
      final public function toString() : String
      {
         return Boot.enum_to_string(this);
      }
   }
}

