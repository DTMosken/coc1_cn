package classes.statusEffects.combat
{
   import classes.CoC;
   import classes.StatusEffect;
   import classes.StatusEffectType;
   import flash.Boot;
   
   public class BackstabBuff extends TimedStatusEffect
   {
      
      public static var init__:Boolean;
      
      public static var TYPE:StatusEffectType;
      
      public function BackstabBuff(param1:int = 1)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super(BackstabBuff.TYPE,"");
         setDuration(param1);
         setUpdateString("");
         setRemoveString("");
      }
      
      override public function onTurnEnd() : void
      {
         if(value1 == 0)
         {
            StatusEffect.get_game().combat.combatAbilities.backstabExec();
         }
      }
      
      override public function onCombatRound() : void
      {
         super.onCombatRound();
      }
   }
}

