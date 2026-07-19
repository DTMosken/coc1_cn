package classes.statusEffects.combat
{
   import classes.StatusEffectType;
   import classes.internals._ValueFunc.NumberFunc_Impl_;
   import flash.Boot;
   
   public class AttractedDebuff extends CombatBuff
   {
      
      public static var init__:Boolean;
      
      public static var TYPE:StatusEffectType;
      
      public function AttractedDebuff()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super(AttractedDebuff.TYPE,"");
         boost("欲望抗性",NumberFunc_Impl_.fromFloatFun(getResistance),true);
      }
      
      public function getResistance() : Number
      {
         return value1;
      }
   }
}

