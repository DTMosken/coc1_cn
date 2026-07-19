package classes.scenes.combat
{
   import flash.Boot;
   
   public final class CombatRange
   {
      
      public static const __isenum:Boolean = true;
      
      public static var ChargingMelee:CombatRange = new CombatRange("ChargingMelee",6,null);
      
      public static var FlyingMelee:CombatRange = new CombatRange("FlyingMelee",5,null);
      
      public static var Melee:CombatRange = new CombatRange("Melee",0,null);
      
      public static var Omni:CombatRange = new CombatRange("Omni",4,null);
      
      public static var Ranged:CombatRange = new CombatRange("Ranged",1,null);
      
      public static var Self:CombatRange = new CombatRange("Self",2,null);
      
      public static var Tease:CombatRange = new CombatRange("Tease",3,null);
      
      public static var __constructs__:Array = ["Melee","Ranged","Self","Tease","Omni","FlyingMelee","ChargingMelee"];
      
      public var tag:String;
      
      public var index:int;
      
      public var params:Array;
      
      public const __enum__:Boolean = true;
      
      public function CombatRange(param1:String, param2:int, param3:Array)
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

