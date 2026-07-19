package classes.statusEffects.combat
{
   import classes.CoC;
   import classes.StatusEffect;
   import classes.StatusEffectType;
   import classes.statusEffects.TimedStatusEffectReal;
   import flash.Boot;
   
   public class TerraStarCooldown extends TimedStatusEffectReal
   {
      
      public static var init__:Boolean;
      
      public static var TYPE:StatusEffectType;
      
      public function TerraStarCooldown(param1:int = 24)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super(TerraStarCooldown.TYPE,"");
         if(param1 == 24)
         {
            param1 -= int(StatusEffect.get_game().time.hours);
         }
         setDuration(param1);
      }
   }
}

