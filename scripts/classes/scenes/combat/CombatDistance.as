package classes.scenes.combat
{
   import flash.Boot;
   
   public final class CombatDistance
   {
      
      public static const __isenum:Boolean = true;
      
      public static var Distant:CombatDistance = new CombatDistance("Distant",1,null);
      
      public static var Melee:CombatDistance = new CombatDistance("Melee",0,null);
      
      public static var __constructs__:Array = ["Melee","Distant"];
      
      public var tag:String;
      
      public var index:int;
      
      public var params:Array;
      
      public const __enum__:Boolean = true;
      
      public function CombatDistance(param1:String, param2:int, param3:Array)
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

