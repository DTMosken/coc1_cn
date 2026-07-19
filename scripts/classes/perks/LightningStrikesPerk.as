package classes.perks
{
   import classes.PerkType;
   import classes.Player;
   import classes.internals._ValueFunc.NumberFunc_Impl_;
   import classes.items.Weapon;
   import flash.Boot;
   
   public class LightningStrikesPerk extends PerkType
   {
      
      public function LightningStrikesPerk()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("Lightning Strikes","Lightning Strikes","[if (spe>=60) {Increases the attack damage for non-heavy weapons.</b>|<b>You are too slow to benefit from this perk.</b>}]","You choose the \'Lightning Strikes\' perk, increasing the attack damage for non-heavy weapons.</b>");
         boost("武器伤害",NumberFunc_Impl_.fromFloatFun(getBonusWeaponDamage),false);
      }
      
      public function getBonusWeaponDamage() : Number
      {
         if(host is Player && get_player().get_spe() >= 60 && !get_player().get_weapon().isLarge())
         {
            return Math.round((get_player().get_spe() - 50) / 3);
         }
         return 0;
      }
   }
}

