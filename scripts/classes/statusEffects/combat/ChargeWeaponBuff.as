package classes.statusEffects.combat
{
   import classes.StatusEffectType;
   import classes.internals._ValueFunc.NumberFunc_Impl_;
   import classes.statusEffects.CombatStatusEffect;
   import flash.Boot;
   
   public class ChargeWeaponBuff extends CombatStatusEffect
   {
      
      public static var init__:Boolean;
      
      public static var TYPE:StatusEffectType;
      
      public function ChargeWeaponBuff()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super(ChargeWeaponBuff.TYPE);
         boost("武器伤害",NumberFunc_Impl_.fromFloatFun(weaponBonus),false);
      }
      
      public function weaponBonus() : Number
      {
         return value1;
      }
   }
}

