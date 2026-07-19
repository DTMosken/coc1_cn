package classes.statusEffects.combat
{
   import classes.DynStat;
   import classes.StatusEffectType;
   import flash.Boot;
   
   public class BasiliskSlowDebuff extends CombatBuff
   {
      
      public static var init__:Boolean;
      
      public static var TYPE:StatusEffectType;
      
      public function BasiliskSlowDebuff()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super(BasiliskSlowDebuff.TYPE,"spe");
      }
      
      public function applyEffect(param1:Number) : void
      {
         buffHost(DynStat.Spe(-param1),DynStat.NoScale,DynStat.IgnoreMax);
      }
   }
}

