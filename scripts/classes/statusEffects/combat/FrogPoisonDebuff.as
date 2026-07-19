package classes.statusEffects.combat
{
   import classes.CoC;
   import classes.Creature;
   import classes.Player;
   import classes.StatusEffect;
   import classes.StatusEffectType;
   import classes.internals.Utils;
   import flash.Boot;
   
   public class FrogPoisonDebuff extends TimedStatusEffect
   {
      
      public static var init__:Boolean;
      
      public static var TYPE:StatusEffectType;
      
      public function FrogPoisonDebuff(param1:int = 4)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super(FrogPoisonDebuff.TYPE,"");
         setDuration(param1);
      }
      
      override public function onCombatRound() : void
      {
         countdownTimer();
         if(get_playerHost() == null)
         {
            return;
         }
         get_host().takeLustDamage(Utils.rand(6) + 5);
         StatusEffect.get_game().outputText("[pg]");
      }
      
      override public function onAttach() : void
      {
         setUpdateString("随着青蛙的毒液流遍全身，你感觉到血液在血管中泵动。");
         setRemoveString("头晕的感觉开始消退，皮肤上的灼热感也减轻了。[pg-][b:毒性已经消退了！]");
      }
      
      override public function countdownTimer() : void
      {
         setDuration(getDuration() - 1);
         if(getDuration() <= 0)
         {
            StatusEffect.get_game().outputText("[pg-]眩晕感开始消退，皮肤上的热度也减轻了。[pg-][b:毒性已经消退了！][pg]");
            remove();
         }
         else
         {
            StatusEffect.get_game().outputText("[pg-]随着青蛙的毒液流遍全身，你感觉到血液在血管里奔腾。");
         }
      }
   }
}

