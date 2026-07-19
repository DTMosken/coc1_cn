package classes.statusEffects.combat
{
   import classes.Creature;
   import classes.DynStat;
   import classes.StatusEffectType;
   import flash.Boot;
   
   public class GroundPoundDebuff extends TimedStatusEffect
   {
      
      public static var init__:Boolean;
      
      public static var TYPE:StatusEffectType;
      
      public function GroundPoundDebuff(param1:int = 3)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super(GroundPoundDebuff.TYPE,"spe");
         setDuration(param1);
      }
      
      override public function apply(param1:Boolean) : void
      {
         buffHost(DynStat.Spe(-get_host().get_spe() * 0.25));
      }
   }
}

