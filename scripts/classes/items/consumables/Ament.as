package classes.items.consumables
{
   import classes.CoC;
   import classes.DynStat;
   import classes.Player;
   import classes.StatusEffects;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.items.Consumable;
   import classes.items.Mutations;
   import classes.lists.ColorLists;
   import classes.parser._Parser.TagFun_Impl_;
   import flash.Boot;
   import haxe.IMap;
   
   public class Ament extends Consumable
   {
      
      public function Ament()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("Ament","Ament","a helical strip of jerky",6,"The oddly spiral-shaped strip resembles jerky, but smells like an Autumn day in a forest.");
      }
      
      override public function useItem() : Boolean
      {
         var _loc3_:* = null as Array;
         var _loc4_:* = null as String;
         dynStats(DynStat.Cor(3));
         outputText("这条形状奇特的螺旋状肉条看起来像肉干，但闻起来却像是森林里秋天的味道。你咬了一口，发现它比你想象中的肉干要嫩得多，而且有很浓的猪肉味。随着食物落入你的胃里，一种恐惧感席卷了你。");
         var _loc1_:Boolean = false;
         if(Utils.trueOnceInN(3))
         {
            dynStats(DynStat.Str(-3));
            _loc1_ = true;
         }
         if(Utils.trueOnceInN(3))
         {
            dynStats(DynStat.Sens(-2));
            dynStats(DynStat.Tou(-3));
            _loc1_ = true;
         }
         if(Utils.trueOnceInN(3))
         {
            dynStats(DynStat.Lib(-2));
            dynStats(DynStat.Lust(-10));
            if(get_player().get_inHeat())
            {
               get_player().removeStatusEffect(StatusEffects.Heat);
               outputText("[pg]你的身体冷却了下来，看来你的发情期已经结束了。");
            }
            if(get_player().get_inRut())
            {
               get_player().removeStatusEffect(StatusEffects.Rut);
               outputText("[pg]你的身体冷却了下来，看来你的发情期结束了。");
            }
            _loc1_ = true;
         }
         if(Utils.trueOnceInN(3))
         {
            dynStats(DynStat.Spe(-3));
            _loc1_ = true;
         }
         if(Utils.trueOnceInN(3))
         {
            var _temp_1:* = get_player();
            _temp_1.thickness = _temp_1.thickness - 20;
            if(get_player().thickness < 1)
            {
               get_player().thickness = 1;
            }
            _loc1_ = true;
         }
         if(Utils.trueOnceInN(3))
         {
            var _temp_2:* = get_player();
            _temp_2.tone = _temp_2.tone - 5;
            if(get_player().tone < 1)
            {
               get_player().tone = 1;
            }
            _loc1_ = true;
         }
         if(_loc1_)
         {
            outputText("[pg]你的身体感到虚弱且迟钝。");
         }
         if(get_game().get_inCombat())
         {
            dynStats(DynStat.Lust(-25));
            outputText("[pg-]你感到寒冷");
            if(get_player().isBleeding())
            {
               outputText("并且你的流血也慢慢停止了");
            }
            get_player().purgeBleed();
            outputText("。");
         }
         get_mutations().initTransformation([1,2,3]);
         var _loc2_:Boolean = false;
         if(get_changes() < get_changeLimit() && get_player().hasFur() && Utils.trueOnceInN(5))
         {
            get_mutations().removeFur();
            _loc2_ = true;
         }
         if(get_changes() < get_changeLimit() && get_player().hasScales() && Utils.trueOnceInN(5))
         {
            get_mutations().removeScales();
            _loc2_ = true;
         }
         if(get_changes() < get_changeLimit() && Utils.trueOnceInN(5))
         {
            if(Boolean([3,2].contains(get_player().arms.type)))
            {
               get_mutations().restoreArms("Ament");
               _loc2_ = true;
            }
            if(Boolean([15,7].contains(get_player().lowerBody.type)))
            {
               get_mutations().restoreLegs("Ament");
               _loc2_ = true;
            }
         }
         if(get_changes() < get_changeLimit() && Utils.trueOnceInN(5) && get_player().lowerBody.legCount == 1)
         {
            get_player().lowerBody.type = 0;
            get_player().lowerBody.legCount = 2;
            outputText("你的[feet]完全失去了知觉，难以站立。你正想坐下，却发现自己摔倒了。每一根神经似乎都在卷曲燃烧，当你低头看你的腿时，你发现它们变成了完全普通的[b:人类双腿]。");
            _loc2_ = true;
            set_changes(get_changes() + 1);
         }
         if(get_changes() < get_changeLimit() && Utils.trueOnceInN(5) && get_player().hasGooSkin() && get_player().lowerBody.legCount != 1)
         {
            get_player().skin.setType(0);
            if(!Boolean(ColorLists.HUMAN_SKIN.contains(get_player().skin.tone)))
            {
               _loc3_ = ["pale","light","white"];
               _loc4_ = _loc3_[Utils.rand(int(_loc3_.length))];
               get_player().skin.tone = _loc4_;
            }
            get_player().underBody.restore();
            outputText("[pg]包裹着你体内液体的光滑[skintone]薄膜开始变干变厚，变得僵硬得令人痛苦，随后再次软化，变成了[b:正常的人类皮肤]。");
            _loc2_ = true;
            set_changes(get_changes() + 1);
         }
         if(get_changes() < get_changeLimit() && Utils.trueOnceInN(10) && get_player().lowerBody.type == 16)
         {
            get_player().lowerBody.type = 0;
            get_player().lowerBody.legCount = 2;
            outputText("你的[feet]完全失去了知觉，难以站立。你正想坐下，却发现自己摔倒了。每一根神经似乎都在卷曲燃烧，当你低头看你的腿时，你发现它们变成了完全普通的[b:人类双腿]。");
            _loc2_ = true;
            set_changes(get_changes() + 1);
         }
         if(_loc2_)
         {
            outputText("[pg]你变得更像人类了。");
         }
         var _loc5_:int = get_player().hasBarkSkin() ? 17 : 18;
         var _loc6_:int = get_player().hasBarkSkin() && get_player().dryadScore() >= 3 ? 2 : 5;
         registerTag("weeping",TagFun_Impl_.fromBool(_loc5_ == 18));
         if(get_changes() < get_changeLimit() && Utils.trueOnceInN(_loc6_) && get_player().wings.type != _loc5_)
         {
            outputText("[pg][if (hasWings) {你的[wings]剧烈地颤抖弯曲，然后[if (weeping) {裂开|爆开}]|一阵阵战栗顺着你的脊背上下游走，直到你因背部突然爆开的感觉而惊叫出声}]，变成了[if (weeping) {像线帘一样挂在两根下垂骨肢上的扭曲肉带|挂在两根下垂树枝上的螺旋状叶子}]。");
            get_player().wings.type = _loc5_;
            set_changes(get_changes() + 1);
         }
         if(get_changes() < get_changeLimit() && Utils.trueOnceInN(5) && get_player().skin.type == 0 && get_player().skin.adj != "ashen")
         {
            outputText("[pg]麻木感瞬间覆盖了你每一[if (metric) {厘米|英寸}]的肌肤。你打量了一下自己，发现皮肤苍白干燥，紧绷在身上。");
            get_player().skin.adj = "ashen";
            set_changes(get_changes() + 1);
         }
         if(get_changes() < get_changeLimit() && Utils.trueOnceInN(5) && get_player().horns.type != 13)
         {
            outputText("[pg]你的[if (hasHorns) {[horns]在头部的根处痛苦地扭曲，然后变形|头痛欲裂，就像被钝器重击了一样，直到两根扭曲的角开始生长，压力才得以缓解}]，变成了羚羊的角。");
            get_player().horns.type = 13;
            set_changes(get_changes() + 1);
         }
         if(get_changes() < get_changeLimit() && Utils.trueOnceInN(5) && !get_player().isHoofed())
         {
            get_player().lowerBody.type = 21;
            outputText("[pg]剧烈的震颤从你的[feet]传来，将你击倒在地，它们融化并重新分裂成偶蹄类的羚羊蹄[if (isTaur) {，你的下半身也随之颤抖扭动。变异顺着你的腿向上蔓延，感觉就像被一股无形的力量挤压着，直到最后变异结束，你看到你的动物半身被重塑成了与你的腿相匹配的种族}]。");
            set_changes(get_changes() + 1);
         }
         get_player().refillHunger(-10);
         var _loc7_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc7_,2077,FlagDict_Impl_.arrayReadInt(_loc7_,2077) + get_changes());
         return false;
      }
   }
}

