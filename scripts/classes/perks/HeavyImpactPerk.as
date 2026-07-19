package classes.perks
{
   import classes.PerkType;
   import classes.Player;
   import classes.internals._ValueFunc.NumberFunc_Impl_;
   import classes.items.Weapon;
   import flash.Boot;
   
   public class HeavyImpactPerk extends PerkType
   {
      
      public function HeavyImpactPerk()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("Weapon Mastery","Heavy Impact","[if (str>60) {Doubles damage bonus of weapons classified as \'Large\'.|<b>You aren\'t strong enough to benefit from this anymore.</b>}]","You choose the \'Heavy Impact\' perk, doubling the effectiveness of large weapons.");
         boost("武器伤害",NumberFunc_Impl_.fromFloatFun(getBonusWeaponDamage),true);
      }
      
      public function getBonusWeaponDamage() : Number
      {
         if(host is Player && get_player().get_weapon().isLarge())
         {
            return 2;
         }
         return 1;
      }
   }
}

