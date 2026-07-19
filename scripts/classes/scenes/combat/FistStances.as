package classes.scenes.combat
{
   import flash.Boot;
   
   public final class FistStances
   {
      
      public static const __isenum:Boolean = true;
      
      public static var Brawler:FistStances = new FistStances("Brawler",1,null);
      
      public static var Claw:FistStances = new FistStances("Claw",2,null);
      
      public static var Monk:FistStances = new FistStances("Monk",0,null);
      
      public static var __constructs__:Array = ["Monk","Brawler","Claw"];
      
      public var tag:String;
      
      public var index:int;
      
      public var params:Array;
      
      public const __enum__:Boolean = true;
      
      public function FistStances(param1:String, param2:int, param3:Array)
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

