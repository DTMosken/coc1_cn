package classes.statusEffects.combat
{
   import classes.Creature;
   import classes.DynStat;
   import classes.StatusEffectType;
   import flash.Boot;
   
   public class ChantedDebuff extends CombatBuff
   {
      
      public static var init__:Boolean;
      
      public static var TYPE:StatusEffectType;
      
      public function ChantedDebuff()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super(ChantedDebuff.TYPE,"spe");
      }
      
      override public function get_tooltip() : String
      {
         var _loc1_:String = "[b:吟唱:] 目标的速度降低了 ";
         if(get_host().get_spe() <= 1)
         {
            _loc1_ += "至零。";
         }
         else
         {
            _loc1_ += "降低了 [b:" + -int(Math.round(buffValue("spe"))) + "]。";
         }
         return _loc1_;
      }
      
      public function applyEffect(param1:int) : void
      {
         buffHost(DynStat.Spe(-param1));
      }
   }
}

