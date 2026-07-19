package classes.statusEffects.combat
{
   import classes.Creature;
   import classes.DynStat;
   import classes.StatusEffectType;
   import flash.Boot;
   
   public class AkbalSpeedDebuff extends CombatBuff
   {
      
      public static var init__:Boolean;
      
      public static var TYPE:StatusEffectType;
      
      public function AkbalSpeedDebuff()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super(AkbalSpeedDebuff.TYPE,"spe");
      }
      
      override public function apply(param1:Boolean) : void
      {
         buffHost(DynStat.Spe(-get_host().get_spe() / 5));
      }
   }
}

