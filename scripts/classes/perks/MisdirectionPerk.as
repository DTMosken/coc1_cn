package classes.perks
{
   import classes.PerkType;
   import classes.internals._ValueFunc.NumberFunc_Impl_;
   import classes.items.ArmorLib;
   import flash.Boot;
   
   public class MisdirectionPerk extends PerkType
   {
      
      public function MisdirectionPerk()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("Misdirection","Misdirection","Grants additional evasion chances while wearing Raphael\'s red bodysuit.");
         boost("闪避几率",NumberFunc_Impl_.fromFloatFun(getDodgeBonus),false);
      }
      
      public function getDodgeBonus() : Number
      {
         if(host.get_armorName() == get_armors().R_BDYST.get_name())
         {
            return 10;
         }
         return 0;
      }
   }
}

