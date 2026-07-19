package classes
{
   import flash.Boot;
   
   public final class Build
   {
      
      public static const __isenum:Boolean = true;
      
      public static var Andro:Build = new Build("Andro",3,null);
      
      public static var Large:Build = new Build("Large",2,null);
      
      public static var Medium:Build = new Build("Medium",1,null);
      
      public static var Small:Build = new Build("Small",0,null);
      
      public static var __constructs__:Array = ["Small","Medium","Large","Andro"];
      
      public var tag:String;
      
      public var index:int;
      
      public var params:Array;
      
      public const __enum__:Boolean = true;
      
      public function Build(param1:String, param2:int, param3:Array)
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

