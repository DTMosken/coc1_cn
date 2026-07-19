package classes.perks
{
   import classes.PerkType;
   import classes.internals._ValueFunc.NumberFunc_Impl_;
   import flash.Boot;
   
   public class FrustrationPerk extends PerkType
   {
      
      public function FrustrationPerk()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("Enraged Frustration","Enraged Frustration","Gain +10% cumulative damage for each missed attack. Resets when an attack lands.","You choose the \'Enraged Frustration\' perk. Every missed attack grants the next one +10% cumulative damage. Resets when an attack lands.");
         boost("物理伤害",NumberFunc_Impl_.fromFloatFun(dmgBonus),true);
      }
      
      override public function keepOnAscension(param1:Boolean = false) : Boolean
      {
         return false;
      }
      
      public function dmgBonus() : Number
      {
         return 1 + getOwnValue(0) * 0.01;
      }
   }
}

