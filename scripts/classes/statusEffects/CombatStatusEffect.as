package classes.statusEffects
{
   import classes.StatusEffect;
   import classes.StatusEffectType;
   import flash.Boot;
   
   public class CombatStatusEffect extends StatusEffect
   {
      
      public function CombatStatusEffect(param1:StatusEffectType = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super(param1);
      }
      
      override public function onCombatEnd() : void
      {
         remove();
      }
   }
}

