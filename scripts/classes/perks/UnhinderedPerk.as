package classes.perks
{
   import classes.PerkType;
   import classes.Player;
   import classes.internals._ValueFunc.NumberFunc_Impl_;
   import flash.Boot;
   
   public class UnhinderedPerk extends PerkType
   {
      
      public function UnhinderedPerk()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("Unhindered","Unhindered","Increases chances of evading enemy attacks when wearing armor with less than 15 defense.","You choose the \'Unhindered\' perk, granting chance to evade when you are wearing light clothing.");
         boost("闪避几率",NumberFunc_Impl_.fromIntFun(dodgeFunc),false);
      }
      
      override public function keepOnAscension(param1:Boolean = false) : Boolean
      {
         return false;
      }
      
      public function dodgeFunc() : int
      {
         if(host is Player)
         {
            if(host.get_armorDef() - host.getAgiSpeedBonus() < 15)
            {
               return 10;
            }
            return 0;
         }
         if(host.get_armorDef() < 15)
         {
            return 10;
         }
         return 0;
      }
   }
}

