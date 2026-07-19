package classes.statusEffects.combat
{
   import classes.CoC;
   import classes.Creature;
   import classes.DynStat;
   import classes.Player;
   import classes.StatusEffect;
   import classes.StatusEffectType;
   import classes.internals.Utils;
   import flash.Boot;
   
   public class MothPheromones extends TimedStatusEffect
   {
      
      public static var init__:Boolean;
      
      public static var TYPE:StatusEffectType;
      
      public function MothPheromones(param1:int = 5, param2:int = 20, param3:int = -20)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super(MothPheromones.TYPE,"sens","spe");
         setDuration(param1);
         value3 = param2;
         value4 = param3;
      }
      
      override public function onCombatRound() : void
      {
         countdownTimer();
         if(get_playerHost() == null)
         {
            return;
         }
         get_host().takeLustDamage(Utils.rand(10) + 5);
         StatusEffect.get_game().outputText("[pg]");
      }
      
      override public function onAttach() : void
      {
         buffHost(DynStat.Sens(value3),DynStat.Spe(value4));
         setUpdateString("一阵眩晕袭来，你的脸涨得通红，信息素仍在你的系统中流淌。");
         setRemoveString("你摇了摇头，开始感觉清醒了一点。[pg-][b:信息素已经消退了！][pg]");
      }
      
      override public function countdownTimer() : void
      {
         setDuration(getDuration() - 1);
         if(getDuration() <= 0)
         {
            StatusEffect.get_game().outputText("[pg-]你摇了摇头，开始感觉清醒了一点。[pg-][b:信息素已经消退了！][pg]");
            remove();
         }
         else
         {
            StatusEffect.get_game().outputText("[pg-]一阵眩晕袭来，你的脸涨得通红，信息素仍在你的体内流窜。");
         }
      }
   }
}

