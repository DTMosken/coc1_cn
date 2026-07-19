package haxe.macro
{
   import flash.Boot;
   
   public final class FunctionKind
   {
      
      public static const __isenum:Boolean = true;
      
      public static var FAnonymous:FunctionKind = new FunctionKind("FAnonymous",0,null);
      
      public static var FArrow:FunctionKind = new FunctionKind("FArrow",2,null);
      
      public static var __constructs__:Array = ["FAnonymous","FNamed","FArrow"];
      
      public var tag:String;
      
      public var index:int;
      
      public var params:Array;
      
      public const __enum__:Boolean = true;
      
      public function FunctionKind(param1:String, param2:int, param3:Array)
      {
         tag = param1;
         index = param2;
         params = param3;
      }
      
      public static function FNamed(param1:String, param2:Object = undefined) : FunctionKind
      {
         return new FunctionKind("FNamed",1,[param1,param2]);
      }
      
      final public function toString() : String
      {
         return Boot.enum_to_string(this);
      }
   }
}

