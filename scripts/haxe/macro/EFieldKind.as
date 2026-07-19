package haxe.macro
{
   import flash.Boot;
   
   public final class EFieldKind
   {
      
      public static const __isenum:Boolean = true;
      
      public static var Normal:EFieldKind = new EFieldKind("Normal",0,null);
      
      public static var Safe:EFieldKind = new EFieldKind("Safe",1,null);
      
      public static var __constructs__:Array = ["Normal","Safe"];
      
      public var tag:String;
      
      public var index:int;
      
      public var params:Array;
      
      public const __enum__:Boolean = true;
      
      public function EFieldKind(param1:String, param2:int, param3:Array)
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

