package classes
{
   import flash.Boot;
   
   public final class ReactionContext
   {
      
      public static const __isenum:Boolean = true;
      
      public static var AfterAttacked:ReactionContext = new ReactionContext("AfterAttacked",2,null);
      
      public static var AfterDamaged:ReactionContext = new ReactionContext("AfterDamaged",4,null);
      
      public static var Approached:ReactionContext = new ReactionContext("Approached",8,null);
      
      public static var BeforeAttacked:ReactionContext = new ReactionContext("BeforeAttacked",0,null);
      
      public static var Blinded:ReactionContext = new ReactionContext("Blinded",5,null);
      
      public static var BowHit:ReactionContext = new ReactionContext("BowHit",10,null);
      
      public static var Burned:ReactionContext = new ReactionContext("Burned",6,null);
      
      public static var Distanced:ReactionContext = new ReactionContext("Distanced",7,null);
      
      public static var PlayerWaited:ReactionContext = new ReactionContext("PlayerWaited",3,null);
      
      public static var TurnStart:ReactionContext = new ReactionContext("TurnStart",9,null);
      
      public static var WhenAttacked:ReactionContext = new ReactionContext("WhenAttacked",1,null);
      
      public static var __constructs__:Array = ["BeforeAttacked","WhenAttacked","AfterAttacked","PlayerWaited","AfterDamaged","Blinded","Burned","Distanced","Approached","TurnStart","BowHit","StatusApplied"];
      
      public var tag:String;
      
      public var index:int;
      
      public var params:Array;
      
      public const __enum__:Boolean = true;
      
      public function ReactionContext(param1:String, param2:int, param3:Array)
      {
         tag = param1;
         index = param2;
         params = param3;
      }
      
      public static function StatusApplied(param1:StatusEffectType) : ReactionContext
      {
         return new ReactionContext("StatusApplied",11,[param1]);
      }
      
      final public function toString() : String
      {
         return Boot.enum_to_string(this);
      }
   }
}

