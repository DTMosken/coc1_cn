package classes.statusEffects.combat
{
   import classes.CoC;
   import classes.Creature;
   import classes.DynStat;
   import classes.StatusEffect;
   import classes.StatusEffectType;
   import classes.internals.Utils;
   import flash.Boot;
   
   public class PermaFly extends CombatBuff
   {
      
      public static var init__:Boolean;
      
      public static var TYPE:StatusEffectType;
      
      public function PermaFly()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super(PermaFly.TYPE,"");
      }
      
      override public function onRemove() : void
      {
         get_host().isFlying = false;
      }
      
      override public function onCombatRound() : void
      {
         StatusEffect.get_game().outputText("[pg-][b:" + get_host().get_capitalA() + Utils.cnName(get_host().get_short()) + "的翅膀继续拍打着。][pg-]");
         get_host().fly();
      }
      
      override public function apply(param1:Boolean) : void
      {
         var _loc2_:* = buffHost(DynStat.Spe(param1 ? -3 : -2));
         if(Number(_loc2_.spe) == 0)
         {
            get_host().takeDamage(5 + Utils.rand(5));
         }
         get_host().takeDamage(5 + Utils.rand(5));
      }
   }
}

