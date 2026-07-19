package classes.statusEffects.combat
{
   import classes.StatusEffectType;
   import flash.Boot;
   
   public class TFScorchBuff extends TimedStatusEffect
   {
      
      public static var init__:Boolean;
      
      public static var TYPE:StatusEffectType;
      
      public function TFScorchBuff(param1:int = 3)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super(TFScorchBuff.TYPE,"");
         setDuration(param1);
      }
   }
}

