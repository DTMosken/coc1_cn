package classes.statusEffects.combat
{
   import classes.DynStat;
   import classes.StatusEffectType;
   import flash.Boot;
   
   public class SeverTendonsDebuff extends CombatBuff
   {
      
      public static var init__:Boolean;
      
      public static var TYPE:StatusEffectType;
      
      public function SeverTendonsDebuff()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super(SeverTendonsDebuff.TYPE,"str","spe");
      }
      
      override public function get_tooltip() : String
      {
         return "[b:切断肌腱：]目标的体力降低了[b:" + -value1 + "]。目标的速度降低了[b:" + -value2 + "]。";
      }
      
      public function applyEffect(param1:Number) : void
      {
         buffHost(DynStat.Str(-param1),DynStat.Spe(-param1));
      }
   }
}

