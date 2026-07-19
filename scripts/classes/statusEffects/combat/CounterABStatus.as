package classes.statusEffects.combat
{
   import classes.StatusEffectType;
   import classes.internals._ValueFunc.NumberFunc_Impl_;
   import classes.statusEffects.CombatStatusEffect;
   import flash.Boot;
   
   public class CounterABStatus extends CombatStatusEffect
   {
      
      public static var init__:Boolean;
      
      public static var TYPE:StatusEffectType;
      
      public function CounterABStatus()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super(CounterABStatus.TYPE);
         boost("攻击伤害",NumberFunc_Impl_.fromFloatFun(attackMulti),true);
      }
      
      public function attackMulti() : Number
      {
         if(value1 == 1)
         {
            return 0.5;
         }
         return 1;
      }
   }
}

