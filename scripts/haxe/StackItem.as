package haxe
{
   import flash.Boot;
   
   public final class StackItem
   {
      
      public static const __isenum:Boolean = true;
      
      public static var CFunction:StackItem = new StackItem("CFunction",0,null);
      
      public static var __constructs__:Array = ["CFunction","Module","FilePos","Method","LocalFunction"];
      
      public var tag:String;
      
      public var index:int;
      
      public var params:Array;
      
      public const __enum__:Boolean = true;
      
      public function StackItem(param1:String, param2:int, param3:Array)
      {
         tag = param1;
         index = param2;
         params = param3;
      }
      
      public static function FilePos(param1:StackItem, param2:String, param3:int, param4:Object = undefined) : StackItem
      {
         return new StackItem("FilePos",2,[param1,param2,param3,param4]);
      }
      
      public static function LocalFunction(param1:Object = undefined) : StackItem
      {
         return new StackItem("LocalFunction",4,[param1]);
      }
      
      public static function Method(param1:String, param2:String) : StackItem
      {
         return new StackItem("Method",3,[param1,param2]);
      }
      
      public static function Module(param1:String) : StackItem
      {
         return new StackItem("Module",1,[param1]);
      }
      
      final public function toString() : String
      {
         return Boot.enum_to_string(this);
      }
   }
}

