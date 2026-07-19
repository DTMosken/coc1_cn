package classes.statusEffects.combat
{
   import classes.Creature;
   import classes.DynStat;
   import classes.StatusEffectType;
   import flash.Boot;
   
   public class TerraStarDebuff extends CombatBuff
   {
      
      public static var init__:Boolean;
      
      public static var TYPE:StatusEffectType;
      
      public function TerraStarDebuff()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super(TerraStarDebuff.TYPE,"str");
      }
      
      override public function apply(param1:Boolean) : void
      {
         buffHost(DynStat.Str(-get_host().get_str() / 10));
      }
   }
}

