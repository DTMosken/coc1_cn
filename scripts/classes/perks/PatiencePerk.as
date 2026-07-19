package classes.perks
{
   import classes.PerkType;
   import classes.internals._ValueFunc.NumberFunc_Impl_;
   import flash.Boot;
   
   public class PatiencePerk extends PerkType
   {
      
      public function PatiencePerk()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("Patience","Patience","Gain +20% damage, +10% crit chance and +10% dodge after waiting through a turn.","");
         boost("全局伤害",NumberFunc_Impl_.fromFloatFun(dmgBonus),true);
         boost("暴击率",NumberFunc_Impl_.fromFloatFun(critBonus),false);
         boost("闪避几率",NumberFunc_Impl_.fromFloatFun(dodgeBonus),false);
      }
      
      override public function keepOnAscension(param1:Boolean = false) : Boolean
      {
         return false;
      }
      
      public function dodgeBonus() : Number
      {
         return getOwnValue(2);
      }
      
      public function dmgBonus() : Number
      {
         return 1 + getOwnValue(0) * 0.01;
      }
      
      public function critBonus() : Number
      {
         return getOwnValue(1);
      }
   }
}

