package classes.statusEffects.combat
{
   import classes.Creature;
   import classes.DynStat;
   import classes.StatusEffectType;
   import flash.Boot;
   
   public class AnemoneVenomDebuff extends CombatBuff
   {
      
      public static var init__:Boolean;
      
      public static var TYPE:StatusEffectType;
      
      public function AnemoneVenomDebuff()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super(AnemoneVenomDebuff.TYPE,"str","spe");
      }
      
      public function applyEffect(param1:Number) : void
      {
         get_host().takeLustDamage(2 * param1,true);
         buffHost(DynStat.Str(-param1),DynStat.Spe(-param1));
      }
   }
}

