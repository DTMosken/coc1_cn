package classes.statusEffects.combat
{
   import classes.CoC;
   import classes.Creature;
   import classes.DynStat;
   import classes.PerkLib;
   import classes.Player;
   import classes.StatusEffect;
   import classes.StatusEffectType;
   import classes.internals.Utils;
   import flash.Boot;
   
   public class DriderIncubusVenomDebuff extends CombatBuff
   {
      
      public static var init__:Boolean;
      
      public static var TYPE:StatusEffectType;
      
      public function DriderIncubusVenomDebuff()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super(DriderIncubusVenomDebuff.TYPE,"str");
      }
      
      override public function onCombatRound() : void
      {
         if(get_host().hasPerk(PerkLib.Medicine) && Utils.rand(100) <= 14)
         {
            if(get_playerHost() != null)
            {
               StatusEffect.get_game().outputText("[pg-]你凭借医学知识，成功清除了体内的蛛化精灵男魅魔毒液！[pg]");
            }
            remove();
         }
      }
      
      override public function apply(param1:Boolean) : void
      {
         get_host().dynStats(DynStat.Str(-5));
         buffHost(DynStat.Str(-30));
      }
   }
}

