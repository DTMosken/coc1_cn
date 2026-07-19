package classes.statusEffects.combat
{
   import classes.Creature;
   import classes.DynStat;
   import classes.StatusEffectType;
   import classes.internals.Utils;
   import flash.Boot;
   
   public class Tripped extends TimedStatusEffect
   {
      
      public static var init__:Boolean;
      
      public static var TYPE:StatusEffectType;
      
      public function Tripped(param1:int = 2)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super(Tripped.TYPE,"spe");
         setDuration(param1);
         set_tooltip("[b:Tripped:] Target is unbalanced, reducing speed by half.");
      }
      
      override public function onRemove() : void
      {
         get_host().isImmobilized = false;
      }
      
      override public function onCombatRound() : void
      {
         super.onCombatRound();
      }
      
      override public function apply(param1:Boolean) : void
      {
         buffHost(DynStat.Spe(-get_host().get_spe() * 0.5));
         setUpdateString(get_host().get_capitalA() + Utils.cnName(get_host().get_short()) + "仍然失去平衡！");
         setRemoveString(get_host().get_capitalA() + Utils.cnName(get_host().get_short()) + "不再失去平衡了！");
         get_host().immobilize();
      }
   }
}

