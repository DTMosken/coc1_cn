package classes
{
   import flash.Boot;
   
   public final class Contribution
   {
      
      public static const __isenum:Boolean = true;
      
      public static var __constructs__:Array = ["Standalone","Grouped"];
      
      public var tag:String;
      
      public var index:int;
      
      public var params:Array;
      
      public const __enum__:Boolean = true;
      
      public function Contribution(param1:String, param2:int, param3:Array)
      {
         tag = param1;
         index = param2;
         params = param3;
      }
      
      public static function Grouped(param1:String, param2:Array) : Contribution
      {
         return new Contribution("Grouped",1,[param1,param2]);
      }
      
      public static function Standalone(param1:String) : Contribution
      {
         return new Contribution("Standalone",0,[param1]);
      }
      
      final public function toString() : String
      {
         return Boot.enum_to_string(this);
      }
   }
}

