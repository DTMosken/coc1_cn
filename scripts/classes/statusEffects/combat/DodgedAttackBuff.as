package classes.statusEffects.combat
{
   import classes.StatusEffectType;
   import flash.Boot;
   
   public class DodgedAttackBuff extends TimedStatusEffect
   {
      
      public static var init__:Boolean;
      
      public static var TYPE:StatusEffectType;
      
      public function DodgedAttackBuff(param1:int = 1)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super(DodgedAttackBuff.TYPE,"");
         setDuration(param1);
      }
      
      override public function onCombatRound() : void
      {
         remove();
      }
   }
}

