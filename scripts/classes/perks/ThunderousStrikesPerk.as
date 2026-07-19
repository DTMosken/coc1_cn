package classes.perks
{
   import classes.PerkType;
   import classes.internals._ValueFunc.NumberFunc_Impl_;
   import flash.Boot;
   
   public class ThunderousStrikesPerk extends PerkType
   {
      
      public function ThunderousStrikesPerk()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("Thunderous Strikes","Thunderous Strikes","+20% \'Attack\' damage while strength is at or above 80.","You choose the \'Thunderous Strikes\' perk, increasing normal damage by 20% while your strength is over 80.");
         boost("攻击伤害",NumberFunc_Impl_.fromFloatFun(dmgBonus),true);
      }
      
      override public function keepOnAscension(param1:Boolean = false) : Boolean
      {
         return false;
      }
      
      public function dmgBonus() : Number
      {
         if(host.get_str() >= 80)
         {
            return 1.2;
         }
         return 1;
      }
   }
}

