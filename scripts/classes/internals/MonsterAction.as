package classes.internals
{
   import classes.scenes.combat.CombatRange;
   import flash.Boot;
   
   public class MonsterAction
   {
      
      public var when:Boolean;
      
      public var weight:Number;
      
      public var fatigueType:int;
      
      public var cost:Number;
      
      public var actionType:CombatRange;
      
      public var action:Function;
      
      public function MonsterAction(param1:Function = undefined, param2:Number = 0, param3:Boolean = false, param4:Number = 0, param5:int = 0, param6:CombatRange = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         action = param1;
         weight = param2;
         when = param3;
         cost = param4;
         fatigueType = param5;
         actionType = param6;
      }
   }
}

