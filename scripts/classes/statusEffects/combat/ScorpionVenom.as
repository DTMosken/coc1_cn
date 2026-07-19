package classes.statusEffects.combat
{
   import classes.CoC;
   import classes.Creature;
   import classes.PerkLib;
   import classes.Player;
   import classes.StatusEffect;
   import classes.StatusEffectType;
   import classes.internals.Utils;
   import classes.internals._ValueFunc.NumberFunc_Impl_;
   import classes.scenes.combat.CombatAbility;
   import flash.Boot;
   
   public class ScorpionVenom extends TimedStatusEffect
   {
      
      public static var init__:Boolean;
      
      public static var TYPE:StatusEffectType;
      
      public function ScorpionVenom()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super(ScorpionVenom.TYPE,"");
         boost("命中率",NumberFunc_Impl_.fromInt(-15),false);
      }
      
      override public function onCombatRound() : void
      {
         if(get_host().hasPerk(PerkLib.Medicine) && Utils.randomChance(15))
         {
            if(get_playerHost() != null)
            {
               StatusEffect.get_game().outputText("[pg-]你利用自己的医学知识，成功地清除了体内的蝎毒！[pg]");
            }
            remove();
            return;
         }
         countdownTimer();
      }
      
      override public function onAbilityUse(param1:CombatAbility) : Boolean
      {
         if(param1.isMagic() && Utils.randomChance(90))
         {
            StatusEffect.get_game().outputText("你试图施放法术，但周围的一切都在天旋地转，就像被反复按进冰水里一样，让你直欲作呕。肠胃里一阵剧痛，粉碎了你仅存的一点注意力。你痛苦地弯下腰，刚凝聚的魔力也随之消散。");
            StatusEffect.get_game().combat.startMonsterTurn();
            return false;
         }
         return true;
      }
      
      override public function apply(param1:Boolean) : void
      {
         setDuration(6);
         setUpdateString("你感觉到蝎毒在你的血管中流淌，你的呼吸变得急促，周围的世界在水波般的模糊和令人恐惧的清晰之间不规律地交替着。[pg]");
      }
   }
}

