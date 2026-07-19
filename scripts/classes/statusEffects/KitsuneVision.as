package classes.statusEffects
{
   import classes.CoC;
   import classes.Player;
   import classes.StatusEffect;
   import classes.StatusEffectType;
   import flash.Boot;
   
   public class KitsuneVision extends TimedStatusEffectReal
   {
      
      public static var init__:Boolean;
      
      public static var TYPE:StatusEffectType;
      
      public function KitsuneVision(param1:int = 24)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super(KitsuneVision.TYPE,"spe");
         setDuration(param1);
      }
      
      override public function onRemove() : void
      {
         if(get_playerHost() != null)
         {
            StatusEffect.get_game().outputText("[pg-][b:你的视线变得清晰，世界不再像覆盖着一层绒毛。看来狐妖幻象已经消失了。][pg]");
            restore();
         }
      }
   }
}

