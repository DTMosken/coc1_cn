package classes.statusEffects.combat
{
   import classes.DynStat;
   import classes.StatusEffectType;
   import classes.internals.Utils;
   import flash.Boot;
   
   public class AmilyVenomDebuff extends CombatBuff
   {
      
      public static var init__:Boolean;
      
      public static var TYPE:StatusEffectType;
      
      public function AmilyVenomDebuff()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super(AmilyVenomDebuff.TYPE,"str","spe");
      }
      
      override public function apply(param1:Boolean) : void
      {
         buffHost(DynStat.Str(-2 - Utils.rand(5)),DynStat.Spe(-2 - Utils.rand(5)));
      }
   }
}

