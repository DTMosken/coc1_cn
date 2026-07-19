package classes.statusEffects.combat
{
   import classes.Creature;
   import classes.StatusEffectType;
   import flash.Boot;
   
   public class DeafeningBuzz extends TimedStatusEffect
   {
      
      public static var init__:Boolean;
      
      public static var TYPE:StatusEffectType;
      
      public function DeafeningBuzz(param1:int = 1)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super(DeafeningBuzz.TYPE,"");
         setDuration(param1);
         setUpdateString("蚊子女震耳欲聋的嗡嗡声仍然刺痛着你的大脑，破坏了你试图强迫自己集中注意力的任何尝试。");
         setRemoveString("蚊子女的嗡嗡声终于减弱了；你可以再次施法了！");
      }
      
      override public function onCombatRound() : void
      {
         get_host().silence();
         super.onCombatRound();
      }
   }
}

