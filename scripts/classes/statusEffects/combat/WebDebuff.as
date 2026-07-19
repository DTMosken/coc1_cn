package classes.statusEffects.combat
{
   import classes.DynStat;
   import classes.StatusEffectType;
   import flash.Boot;
   
   public class WebDebuff extends CombatBuff
   {
      
      public static var init__:Boolean;
      
      public static var TYPE:StatusEffectType;
      
      public function WebDebuff()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super(WebDebuff.TYPE,"spe");
      }
      
      override public function apply(param1:Boolean) : void
      {
         buffHost(DynStat.Spe(-25));
      }
   }
}

