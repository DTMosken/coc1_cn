package classes.statusEffects.combat
{
   import classes.StatusEffectType;
   import flash.Boot;
   
   public class TFShellBuff extends TimedStatusEffect
   {
      
      public static var init__:Boolean;
      
      public static var TYPE:StatusEffectType;
      
      public function TFShellBuff(param1:int = 1)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super(TFShellBuff.TYPE,"");
         setDuration(param1);
      }
   }
}

