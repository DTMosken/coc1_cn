package classes.perks
{
   import classes.PerkType;
   import classes.Player;
   import classes.internals._ValueFunc.NumberFunc_Impl_;
   import classes.items.Shield;
   import classes.items.ShieldLib;
   import classes.items.Weapon;
   import classes.scenes.combat.Combat;
   import flash.Boot;
   
   public class HoldWithBothHandsPerk extends PerkType
   {
      
      public function HoldWithBothHandsPerk()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("Hold With Both Hands","Hold With Both Hands","Gain +20% strength modifier with melee weapons when not using a shield.","You choose the \'Hold With Both Hands\' perk. As long as you\'re wielding a melee weapon and you\'re not using a shield, you gain 20% strength modifier to damage.");
         boost("武器伤害",NumberFunc_Impl_.fromFloatFun(dmgBonus),false);
      }
      
      override public function keepOnAscension(param1:Boolean = false) : Boolean
      {
         return false;
      }
      
      public function dmgBonus() : Number
      {
         if(host is Player)
         {
            if(!get_player().get_weapon().isUnarmed() && get_player().get_shield() == ShieldLib.NOTHING && !get_combat().isWieldingRangedWeapon())
            {
               return Math.round(get_player().get_str() * 0.2);
            }
            return 0;
         }
         return Math.round(host.get_str() * 0.2);
      }
   }
}

