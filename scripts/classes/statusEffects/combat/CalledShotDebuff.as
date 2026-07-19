package classes.statusEffects.combat
{
   import classes.DynStat;
   import classes.StatusEffectType;
   import classes.internals.Utils;
   import flash.Boot;
   
   public class CalledShotDebuff extends CombatBuff
   {
      
      public static var init__:Boolean;
      
      public static var TYPE:StatusEffectType;
      
      public function CalledShotDebuff()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super(CalledShotDebuff.TYPE,"spe");
      }
      
      override public function apply(param1:Boolean) : void
      {
         buffHost(DynStat.Spe(-20 - Utils.rand(5)));
      }
   }
}

