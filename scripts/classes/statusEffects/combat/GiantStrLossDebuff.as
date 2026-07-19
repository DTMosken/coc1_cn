package classes.statusEffects.combat
{
   import classes.DynStat;
   import classes.StatusEffectType;
   import flash.Boot;
   
   public class GiantStrLossDebuff extends CombatBuff
   {
      
      public static var init__:Boolean;
      
      public static var TYPE:StatusEffectType;
      
      public function GiantStrLossDebuff()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super(GiantStrLossDebuff.TYPE,"str");
      }
      
      public function applyEffect(param1:Number) : void
      {
         buffHost(DynStat.Str(-param1));
      }
   }
}

