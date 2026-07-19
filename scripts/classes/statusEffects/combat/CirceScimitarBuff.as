package classes.statusEffects.combat
{
   import classes.CoC;
   import classes.StatusEffect;
   import classes.StatusEffectType;
   import flash.Boot;
   
   public class CirceScimitarBuff extends CombatBuff
   {
      
      public static var init__:Boolean;
      
      public static var TYPE:StatusEffectType;
      
      public function CirceScimitarBuff()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super(CirceScimitarBuff.TYPE,"");
      }
      
      override public function onPlayerTurnEnd() : void
      {
         StatusEffect.get_game().combat.combatAbilities.summonedSwordExec();
      }
   }
}

