package classes.statusEffects
{
   import classes.CoC;
   import classes.Player;
   import classes.StatusEffect;
   import classes.StatusEffectType;
   import flash.Boot;
   
   public class TellyVisedStatus extends TimedStatusEffectReal
   {
      
      public static var init__:Boolean;
      
      public static var TYPE:StatusEffectType;
      
      public function TellyVisedStatus(param1:int = 12)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super(TellyVisedStatus.TYPE,"");
         setDuration(param1);
      }
      
      override public function onRemove() : void
      {
         if(get_playerHost() != null)
         {
            StatusEffect.get_game().outputText("[pg][b: 你的面部彩绘似乎消失了。][pg]");
            restore();
         }
      }
   }
}

