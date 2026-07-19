package classes.statusEffects.combat
{
   import classes.StatusEffectType;
   import flash.Boot;
   
   public class TFGeodeKnuckleBuff extends TimedStatusEffect
   {
      
      public static var init__:Boolean;
      
      public static var TYPE:StatusEffectType;
      
      public function TFGeodeKnuckleBuff(param1:int = 1)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super(TFGeodeKnuckleBuff.TYPE,"");
         setDuration(param1);
      }
   }
}

