package classes.perks
{
   import classes.PerkType;
   import classes.Player;
   import classes.internals._ValueFunc.NumberFunc_Impl_;
   import classes.items.Shield;
   import classes.items.ShieldLib;
   import classes.items.Weapon;
   import flash.Boot;
   
   public class BlademasterPerk extends PerkType
   {
      
      public function BlademasterPerk()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("Blademaster","Blademaster","Gain +5% to critical strike chance when wielding a bladed weapon and not using a shield.","You choose the \'Blademaster\' perk. Your chance of critical hit is increased by 5% as long as you\'re wielding a bladed weapon and not using a shield.");
         boost("武器暴击率",NumberFunc_Impl_.fromFloatFun(critBonus),false);
      }
      
      override public function keepOnAscension(param1:Boolean = false) : Boolean
      {
         return false;
      }
      
      public function critBonus() : Number
      {
         if(host is Player)
         {
            if(host.get_weapon().isSharp() && host.get_shield() == ShieldLib.NOTHING)
            {
               return 5;
            }
            return 0;
         }
         return 5;
      }
   }
}

