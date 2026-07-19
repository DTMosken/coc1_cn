package haxe.io
{
   import flash.Boot;
   
   public final class Error
   {
      
      public static const __isenum:Boolean = true;
      
      public static var Blocked:haxe.io.Error = new haxe.io.Error("Blocked",0,null);
      
      public static var OutsideBounds:haxe.io.Error = new haxe.io.Error("OutsideBounds",2,null);
      
      public static var Overflow:haxe.io.Error = new haxe.io.Error("Overflow",1,null);
      
      public static var __constructs__:Array = ["Blocked","Overflow","OutsideBounds","Custom"];
      
      public var tag:String;
      
      public var index:int;
      
      public var params:Array;
      
      public const __enum__:Boolean = true;
      
      public function Error(param1:String, param2:int, param3:Array)
      {
         tag = param1;
         index = param2;
         params = param3;
      }
      
      public static function Custom(param1:*) : haxe.io.Error
      {
         return new haxe.io.Error("Custom",3,[param1]);
      }
      
      final public function toString() : String
      {
         return Boot.enum_to_string(this);
      }
   }
}

