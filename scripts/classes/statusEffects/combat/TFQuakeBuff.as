package classes.statusEffects.combat
{
   import classes.CoC;
   import classes.StatusEffect;
   import classes.StatusEffectType;
   import flash.Boot;
   
   public class TFQuakeBuff extends TimedStatusEffect
   {
      
      public static var init__:Boolean;
      
      public static var TYPE:StatusEffectType;
      
      public function TFQuakeBuff(param1:int = 3)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super(TFQuakeBuff.TYPE,"");
         setDuration(param1);
      }
      
      override public function onPlayerTurnEnd() : void
      {
         if(getDuration() < 3)
         {
            StatusEffect.get_game().combat.combatAbilities.tfQuakeAftershocks();
         }
      }
   }
}

