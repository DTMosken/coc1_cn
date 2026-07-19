package classes.statusEffects
{
   import classes.CoC;
   import classes.Player;
   import classes.StatusEffect;
   import classes.StatusEffectType;
   import flash.Boot;
   
   public class Exhaustion extends TimedStatusEffectReal
   {
      
      public static var init__:Boolean;
      
      public static var TYPE:StatusEffectType;
      
      public function Exhaustion(param1:int = 720, param2:int = 40)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super(Exhaustion.TYPE,"Exh");
         setDuration(param1);
         value1 = param2;
         updateValueForMe(2);
      }
      
      override public function onRemove() : void
      {
         if(get_playerHost() != null)
         {
            StatusEffect.get_game().outputText("[pg-][b:你终于从磨难中恢复过来了。][pg]");
            restore();
         }
      }
   }
}

