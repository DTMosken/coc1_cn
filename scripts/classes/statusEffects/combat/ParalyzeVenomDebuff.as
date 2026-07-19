package classes.statusEffects.combat
{
   import classes.CoC;
   import classes.DynStat;
   import classes.Player;
   import classes.StatusEffect;
   import classes.StatusEffectType;
   import flash.Boot;
   
   public class ParalyzeVenomDebuff extends CombatBuff
   {
      
      public static var init__:Boolean;
      
      public static var TYPE:StatusEffectType;
      
      public function ParalyzeVenomDebuff()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super(ParalyzeVenomDebuff.TYPE,"str","spe");
      }
      
      override public function onRemove() : void
      {
         if(get_playerHost() != null)
         {
            StatusEffect.get_game().outputText("[pg-][b:随着血管中的麻痹毒液逐渐消退，你感觉自己变得更敏捷、更强壮了。][pg]");
         }
      }
      
      override public function apply(param1:Boolean) : void
      {
         buffHost(DynStat.Str(param1 ? -2 : -3),DynStat.Spe(param1 ? -2 : -3));
      }
   }
}

