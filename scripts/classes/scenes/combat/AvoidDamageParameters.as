package classes.scenes.combat
{
   import classes.Creature;
   import flash.Boot;
   
   public class AvoidDamageParameters
   {
      
      public var toHitChance:Number;
      
      public var doParry:Boolean;
      
      public var doFatigue:Boolean;
      
      public var doDodge:Boolean;
      
      public var doCounter:Boolean;
      
      public var doBlock:Boolean;
      
      public var defender:Creature;
      
      public var attacker:Creature;
      
      public function AvoidDamageParameters(param1:Object = undefined, param2:Object = undefined, param3:Object = undefined, param4:Object = undefined, param5:Object = undefined, param6:Object = undefined, param7:Creature = undefined, param8:Creature = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         defender = null;
         attacker = null;
         toHitChance = Number(Math.NaN);
         doFatigue = false;
         doCounter = false;
         doBlock = true;
         doParry = true;
         doDodge = true;
         if(param1 != null)
         {
            doDodge = param1;
         }
         if(param2 != null)
         {
            doParry = param2;
         }
         if(param3 != null)
         {
            doBlock = param3;
         }
         if(param4 != null)
         {
            doCounter = param4;
         }
         if(param5 != null)
         {
            doFatigue = param5;
         }
         if(param6 != null)
         {
            toHitChance = param6;
         }
         if(param7 != null)
         {
            attacker = param7;
         }
         if(param8 != null)
         {
            defender = param8;
         }
      }
   }
}

