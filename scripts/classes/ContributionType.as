package classes
{
   import flash.Boot;
   
   public final class ContributionType
   {
      
      public static const __isenum:Boolean = true;
      
      public static var Bugs:ContributionType = new ContributionType("Bugs",2,null);
      
      public static var Coding:ContributionType = new ContributionType("Coding",1,null);
      
      public static var Contributions:ContributionType = new ContributionType("Contributions",3,null);
      
      public static var Creator:ContributionType = new ContributionType("Creator",0,null);
      
      public static var __constructs__:Array = ["Creator","Coding","Bugs","Contributions"];
      
      public var tag:String;
      
      public var index:int;
      
      public var params:Array;
      
      public const __enum__:Boolean = true;
      
      public function ContributionType(param1:String, param2:int, param3:Array)
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

