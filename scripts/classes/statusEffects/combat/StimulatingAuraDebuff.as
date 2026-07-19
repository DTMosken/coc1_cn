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
   import classes.internals._ValueFunc.NumberFunc_Impl_;
   import flash.Boot;
   
   public class StimulatingAuraDebuff extends CombatBuff
   {
      
      public static var init__:Boolean;
      
      public static var TYPE:StatusEffectType;
      
      public function StimulatingAuraDebuff()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super(StimulatingAuraDebuff.TYPE,"sens");
         boost("受到伤害",NumberFunc_Impl_.fromFloatFun(resistPenalty),true);
      }
      
      public function resistPenalty() : Number
      {
         return (100 + value2) / 100;
      }
      
      override public function onCombatRound() : void
      {
         if(get_host().hasPerk(PerkLib.Medicine) && Utils.rand(100) < 15)
         {
            if(get_playerHost() != null)
            {
               StatusEffect.get_game().outputText("[pg-]凭借你的医学知识，你成功地清除了自己身上的爱娜温刺激效果。[pg]");
            }
            remove();
         }
      }
      
      override public function apply(param1:Boolean) : void
      {
         buffHost(DynStat.Sens(2));
         value2 += 2;
         if(!param1)
         {
            get_host().removeBonusStats(bonusStats);
         }
      }
   }
}

