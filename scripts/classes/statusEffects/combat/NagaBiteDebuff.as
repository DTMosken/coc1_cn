package classes.statusEffects.combat
{
   import classes.CoC;
   import classes.Creature;
   import classes.DynStat;
   import classes.Monster;
   import classes.StatusEffect;
   import classes.StatusEffectType;
   import classes.internals.Utils;
   import flash.Boot;
   
   public class NagaBiteDebuff extends CombatBuff
   {
      
      public static var init__:Boolean;
      
      public static var TYPE:StatusEffectType;
      
      public function NagaBiteDebuff()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super(NagaBiteDebuff.TYPE,"str","spe");
      }
      
      override public function onCombatRound() : void
      {
         var _loc1_:int = int(2 * value4);
         var _loc2_:int = int(buffValue("str"));
         var _loc3_:int = int(buffValue("spe"));
         var _loc4_:Array = [];
         buffHost(DynStat.Str(-_loc1_),DynStat.Spe(-_loc1_));
         _loc2_ -= int(buffValue("str"));
         _loc3_ -= int(buffValue("spe"));
         if(_loc2_ != 0)
         {
            _loc4_.push("力量");
         }
         if(_loc3_ != 0)
         {
            _loc4_.push("速度");
         }
         if(get_host() is Monster && int(_loc4_.length) > 0)
         {
            StatusEffect.get_game().outputText("[pg-]随着你的毒液在" + get_monsterHost().pronoun3 + "的血管中流淌，" + get_monsterHost().get_themonster() + get_monsterHost().get_possessive() + "的" + Utils.formatStringArray(_loc4_) + "进一步减少了[b:<font color=\"" + StatusEffect.get_game().mainViewManager.colorHpMinus() + "\">" + _loc1_ + "</font>]点。[pg-]");
            if(get_host().get_str() <= 1 && _loc2_ != 0)
            {
               StatusEffect.get_game().outputText("从" + get_monsterHost().pronoun3 + "虚弱的外表来看，" + get_monsterHost().pronoun1 + "已经没有力量可供吸取了。[pg-]");
            }
            if(get_host().get_spe() <= 1 && _loc3_ != 0)
            {
               StatusEffect.get_game().outputText("从" + get_monsterHost().pronoun3 + "迟缓的动作来看，" + get_monsterHost().pronoun1 + "已经没有速度可供吸取了。[pg-]");
            }
         }
      }
      
      override public function apply(param1:Boolean) : void
      {
         if(param1)
         {
            return;
         }
         var _loc2_:int = int(StatusEffect.get_game().combat.combatAbilities.nagaCalc());
         buffHost(DynStat.Str(-_loc2_),DynStat.Spe(-_loc2_));
         value4 += 1;
      }
   }
}

