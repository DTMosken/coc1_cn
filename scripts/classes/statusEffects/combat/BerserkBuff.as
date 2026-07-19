package classes.statusEffects.combat
{
   import classes.Creature;
   import classes.PerkLib;
   import classes.Player;
   import classes.StatusEffectType;
   import classes.internals._ValueFunc.NumberFunc_Impl_;
   import classes.items.Weapon;
   import classes.statusEffects.CombatStatusEffect;
   import flash.Boot;
   
   public class BerserkBuff extends CombatStatusEffect
   {
      
      public static var init__:Boolean;
      
      public static var TYPE:StatusEffectType;
      
      public function BerserkBuff()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super(BerserkBuff.TYPE);
         boost("武器伤害",NumberFunc_Impl_.fromIntFun(weaponDamage),false);
         boost("肉体伤害",NumberFunc_Impl_.fromInt(30),false);
         boost("欲望抗性",NumberFunc_Impl_.fromFloat(1.6),true);
         boost("护甲",NumberFunc_Impl_.fromFloatFun(armorMulti),true);
      }
      
      public function weaponDamage() : int
      {
         var _loc1_:Player = get_playerHost();
         if(_loc1_ != null ? _loc1_.get_weapon().isUnarmed() : null)
         {
            return 0;
         }
         return 30;
      }
      
      public function armorMulti() : Number
      {
         if(get_host().hasPerk(PerkLib.ColdFury))
         {
            return 0.5;
         }
         return 0;
      }
   }
}

