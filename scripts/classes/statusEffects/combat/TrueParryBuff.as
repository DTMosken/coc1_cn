package classes.statusEffects.combat
{
   import classes.StatusEffectType;
   import classes.internals._ValueFunc.NumberFunc_Impl_;
   import flash.Boot;
   
   public class TrueParryBuff extends TimedStatusEffect
   {
      
      public static var init__:Boolean;
      
      public static var TYPE:StatusEffectType;
      
      public function TrueParryBuff(param1:int = 1)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super(TrueParryBuff.TYPE,"");
         boost("招架几率",NumberFunc_Impl_.fromInt(100),false);
         setDuration(param1);
      }
   }
}

