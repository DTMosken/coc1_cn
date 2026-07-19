package classes.statusEffects.combat
{
   import classes.CoC;
   import classes.Creature;
   import classes.StatusEffect;
   import classes.StatusEffectType;
   import classes.internals._ValueFunc.NumberFunc_Impl_;
   import flash.Boot;
   
   public class RetributionBuff extends TimedStatusEffect
   {
      
      public static var init__:Boolean;
      
      public static var TYPE:StatusEffectType;
      
      public function RetributionBuff(param1:int = 1)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super(RetributionBuff.TYPE,"");
         setDuration(param1);
         setUpdateString("");
         setRemoveString("");
         boost("闪避几率",NumberFunc_Impl_.fromInt(0),true);
      }
      
      override public function onTurnEnd() : void
      {
         StatusEffect.get_game().combat.combatAbilities.retributionExec();
      }
      
      override public function onRemove() : void
      {
         get_host().isImmobilized = false;
      }
      
      override public function onAttach() : void
      {
         get_host().isImmobilized = true;
      }
   }
}

