package classes.statusEffects.combat
{
   import classes.CoC;
   import classes.StatusEffect;
   import classes.StatusEffectType;
   import flash.Boot;
   
   public class TFTerraCoreBuff extends TimedStatusEffect
   {
      
      public static var init__:Boolean;
      
      public static var TYPE:StatusEffectType;
      
      public function TFTerraCoreBuff(param1:int = 2)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super(TFTerraCoreBuff.TYPE,"");
         setDuration(param1);
      }
      
      override public function onPlayerTurnEnd() : void
      {
         if(getDuration() < 2)
         {
            StatusEffect.get_game().combat.combatAbilities.tfTerraCoreRetry();
         }
      }
   }
}

