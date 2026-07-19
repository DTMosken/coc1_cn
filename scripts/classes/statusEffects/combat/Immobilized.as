package classes.statusEffects.combat
{
   import classes.Creature;
   import classes.StatusEffectType;
   import flash.Boot;
   
   public class Immobilized extends CombatBuff
   {
      
      public static var init__:Boolean;
      
      public static var TYPE:StatusEffectType;
      
      public function Immobilized()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super(Immobilized.TYPE,"");
      }
      
      override public function onRemove() : void
      {
         get_host().isImmobilized = false;
      }
      
      override public function onCombatRound() : void
      {
         get_host().immobilize();
      }
      
      override public function onCombatEnd() : void
      {
         get_host().isImmobilized = false;
         remove();
      }
      
      override public function apply(param1:Boolean) : void
      {
         get_host().immobilize();
      }
   }
}

