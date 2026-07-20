package classes.items.consumables
{
   import classes.Appearance;
   import classes.BreastRow;
   import classes.Cock;
   import classes.CockTypesEnum;
   import classes.DynStat;
   import classes.PerkLib;
   import classes.Player;
   import classes.StatusEffects;
   import classes.Vagina;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.bodyParts.Butt;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.items.Consumable;
   import classes.items.Mutations;
   import flash.Boot;
   import haxe.IMap;
   
   public class TonOTrice extends Consumable
   {
      
      public function TonOTrice()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("ToTrice","Ton o\' Trice","a ton o\' trice",6,"It\'s a small bottle of thick turquoise liquid labeled \'Ton o\' Trice\'. The label shows an avian creature with a thick reptilian tail and bright colored plumage playfully flying around the text.");
         _headerName = "鸡蛇药剂";
      }
      
      override public function useItem() : Boolean
      {
         var _loc3_:int = 0;
         var _loc4_:* = null as Butt;
         var _loc5_:* = null as BreastRow;
         var _loc6_:Number = NaN;
         var _loc7_:int = 0;
         var _loc8_:* = null as Player;
         var _loc9_:* = null as String;
         var _loc10_:* = null as String;
         var _loc11_:* = null as String;
         var _loc12_:* = null as String;
         var _loc1_:Array = null;
         var _loc2_:String = "TonOTrice";
         get_player().slimeFeed();
         get_mutations().initTransformation([2,2,3,4]);
         outputText("你喝下了这黏糊糊的混合物，当它接触到你的舌头时，你忍不住做了个鬼脸。起初你很惊讶自己竟然没有作呕，但当你尝到这混合物的味道时，你发现它其实没那么糟，在那浓稠的质感背后，似乎还带着一丝杏仁的香气。");
         if(get_player().get_spe() < get_player().ngPlus(100) && get_changes() < get_changeLimit() && Utils.rand(3) == 0)
         {
            outputText("[pg]你改变姿势时踉跄了一下，对自己移动的速度感到惊讶。在短暂的迷失方向后，你适应了过来。你确信自己现在能跑得更快了。");
            if(get_player().get_spe() < get_player().ngPlus(50))
            {
               dynStats(DynStat.Spe(1));
            }
            if(get_player().get_spe() < get_player().ngPlus(75))
            {
               dynStats(DynStat.Spe(1));
            }
            dynStats(DynStat.Spe(1));
         }
         if(get_player().get_tou() > get_player().ngPlus(80) && get_changes() < get_changeLimit() && Utils.rand(4) == 0)
         {
            outputText("[pg]你感觉自己变得更加娇弱了，似乎无法再承受那么强烈的打击。不过话又说回来，当你能以风一般的速度移动并躲避攻击时，谁还需要硬抗呢？");
            dynStats(DynStat.Tou(-1));
         }
         if(get_player().sens > 20 && get_changes() < get_changeLimit() && Utils.rand(3) == 0)
         {
            outputText("[pg]一阵如针扎般的刺痛感传遍全身，随后你的感官变得有些迟钝。");
            dynStats(DynStat.Sens(-1));
         }
         if(get_player().lib < 100 && get_changes() < get_changeLimit() && Utils.rand(3) == 0)
         {
            outputText("[pg]肠胃里一阵火烧般的绞痛让你弯下了腰，但几秒钟后就过去了。当你直起身子时，你能感觉到那股热流渗入了你的体内，");
            if(int(get_player().cocks.length) > 0 && (get_player().get_gender() != 3 || Utils.rand(2) == 0))
            {
               outputText("让你[if (cocks > 1) {的每一根}][cocks]都充满了繁殖的欲望。当你意识到自己的性欲得到了提升时，你变得更加饥渴了。");
            }
            else if(get_player().hasVagina())
            {
               outputText("在你的[vagina]里汇聚。一种交配和产卵的本能欲望在你体内蔓延，增加了你的欲望，并提升了你的性欲。");
            }
            else
            {
               outputText("在滑入你的[ass]之前，它在你那毫无特征的胯部汇聚了一瞬间。你渴望被操，被填满，甚至渴望再次获得一个真正的性别。在强烈的欲望中，你意识到你的性欲已经永久性地增加了。");
            }
            if(get_player().lib < 50)
            {
               dynStats(DynStat.Lib(1));
            }
            if(get_player().lib < 75)
            {
               dynStats(DynStat.Lib(1));
            }
            dynStats(DynStat.Lib(1));
         }
         if(get_player().biggestLactation() >= 1 && get_changes() < get_changeLimit() && Utils.rand(4) == 0)
         {
            outputText("[pg][if (totalNipples == 2) {你两边的|你所有的}]乳头放松了下来。这是一种奇怪的感觉，你拉开上衣摸了摸其中一个。感觉还不错，虽然似乎没有奶水漏出来。你捏了捏它，惊讶地发现除了[if (hasNippleCunts) {淫液}]什么也没有流出来。<b>你不再泌乳了。</b>这也说得通，只有哺乳动物才会泌乳！你微笑着，心想这在清理装备时能省下多少时间。");
            if(get_player().hasPerk(PerkLib.Feeder) || get_player().hasStatusEffect(StatusEffects.Feeder))
            {
               outputText("[pg](<b>失去喂食者特质！</b>)");
               get_player().removePerk(PerkLib.Feeder);
               get_player().removeStatusEffect(StatusEffects.Feeder);
            }
            set_changes(get_changes() + 1);
            _loc3_ = 0;
            while(_loc3_ < int(get_player().breastRows.length))
            {
               get_player().breastRows[_loc3_].lactationMultiplier = 0;
               _loc3_++;
            }
         }
         if(get_player().averageNipplesPerBreast() > 1 && get_changes() < get_changeLimit() && Utils.rand(4) == 0)
         {
            outputText("[pg]一阵寒意掠过你的[allBreasts]，然后消失了。你把手伸进[armor]下，发现多余的乳头不见了！你现在每[if (biggestTitSize < 1) {\'个乳房\'|个乳房}]只剩下一个乳头了。");
            set_changes(get_changes() + 1);
            _loc3_ = 0;
            while(_loc3_ < int(get_player().breastRows.length))
            {
               get_player().breastRows[_loc3_].nipplesPerBreast = 1;
               _loc3_++;
            }
         }
         if(get_changes() < get_changeLimit() && int(get_player().breastRows.length) > 1 && Utils.rand(3) == 0 && !get_hyper())
         {
            get_mutations().removeExtraBreastRow(_loc2_);
         }
         if(get_player().butt.rating > 5 && get_changes() < get_changeLimit() && Utils.rand(4) == 0)
         {
            set_changes(get_changes() + 1);
            _loc4_ = get_player().butt;
            --_loc4_.rating;
            outputText("[pg]你的[butt]开始感到紧绷，并逐渐加剧。这种感觉越来越强烈，随着它的变化，你的重心也发生了偏移。你向后伸手摸了摸自己，果然，你的[butt]正在缩小到一个更容易控制的尺寸。");
         }
         if(get_player().isFemaleOrHerm())
         {
            if(get_player().isFemaleOrHerm() && get_player().biggestTitSize() > 4 && get_changes() < get_changeLimit() && Utils.rand(3) == 0)
            {
               _loc3_ = 0;
               while(_loc3_ < int(get_player().breastRows.length))
               {
                  if(get_player().breastRows[_loc3_].breastRating > 4)
                  {
                     var _temp_1:* = get_player().breastRows[_loc3_];
                     _temp_1.breastRating = _temp_1.breastRating - (1 + Utils.rand(3));
                  }
                  _loc3_++;
               }
               outputText("[pg]你的乳房感到紧绷[if (hasArmor) {，你的[armor]在胸部周围感觉变松了}]。你震惊地看着你的乳房肉迅速减少，缩回胸腔。它们最终在达到[breastcup]罩杯大小时停止了。你感觉轻盈了一些。");
               dynStats(DynStat.Spe(1));
               set_changes(get_changes() + 1);
            }
            if(get_player().isFemaleOrHerm() && get_player().smallestTitSize() < 2 && get_changes() < get_changeLimit() && Utils.rand(3) == 0)
            {
               _loc3_ = 0;
               while(_loc3_ < int(get_player().breastRows.length))
               {
                  if(get_player().breastRows[_loc3_].breastRating < 2)
                  {
                     var _temp_2:* = get_player().breastRows[_loc3_];
                     _temp_2.breastRating = _temp_2.breastRating + 1;
                  }
                  _loc3_++;
               }
               outputText("[pg]你的乳房在衣服里感到紧绷和疼痛，因为它们每时每刻都在变大，最终在达到[breastcup]罩杯大小时停止了。你揉了揉柔软的球体，逐渐适应了你更大的乳房。");
               dynStats(DynStat.Lib(1));
               set_changes(get_changes() + 1);
            }
            if(get_player().hips.rating > 12 && get_changes() < get_changeLimit() && Utils.rand(3) == 0)
            {
               outputText("[pg]你踉跄了一下，骨盆的骨头痛苦地重新排列。你的臀部变窄了。");
               var _temp_3:* = get_player().hips;
               _temp_3.rating = _temp_3.rating - (1 + Utils.rand(3));
               set_changes(get_changes() + 1);
            }
            if(get_player().hips.rating < 6 && get_changes() < get_changeLimit() && Utils.rand(3) == 0)
            {
               outputText("[pg]你踉跄了一下，感觉到臀部的骨头在摩擦，你的臀部明显变宽了。");
               var _temp_4:* = get_player().hips;
               _temp_4.rating = _temp_4.rating + (1 + Utils.rand(3));
               set_changes(get_changes() + 1);
            }
            if(get_player().nippleLength > 1 && get_changes() < get_changeLimit() && Utils.rand(3) == 0)
            {
               outputText("[pg]伴随着一阵突如其来的刺痛，你的[nipples]变得越来越小，直到缩小到原来的一半左右才停下来");
               var _temp_5:* = get_player();
               _temp_5.nippleLength = _temp_5.nippleLength / 2;
            }
            if(get_player().hasVagina() && get_player().vaginas[0].vaginalWetness < 3 && get_changes() < get_changeLimit() && Utils.rand(4) == 0)
            {
               outputText("[pg]你的[cunt]内壁感到一阵奇怪的紧绷感，然后转变为一种漫长的拉伸感，就像你是用油灰做的一样。你试探性地将几根手指滑入其中，发现自己变得更加宽松和柔软，准备好迎接那些怪物肉棒了。或者更好的是，用来产卵。");
               var _temp_6:* = get_player().vaginas[0];
               _temp_6.vaginalWetness = _temp_6.vaginalWetness + 1;
               set_changes(get_changes() + 1);
            }
            if(get_player().tone < 65 && Utils.rand(3) == 0)
            {
               outputText(get_player().modTone(65,2));
            }
            if(get_player().thickness > 35 && Utils.rand(3) == 0)
            {
               outputText(get_player().modThickness(35,5));
            }
            if(Utils.rand(5) == 0 && get_player().cockatriceScore() > 3)
            {
               get_mutations().updateOvipositionPerk(_loc2_);
            }
         }
         if(get_player().isMale())
         {
            if(get_player().biggestTitSize() > 2 && get_changes() < get_changeLimit() && Utils.rand(3) == 0)
            {
               _loc3_ = 0;
               while(_loc3_ < int(get_player().breastRows.length))
               {
                  if(get_player().breastRows[_loc3_].breastRating > 2)
                  {
                     _loc5_ = get_player().breastRows[_loc3_];
                     --_loc5_.breastRating;
                  }
                  _loc3_++;
               }
               outputText("[pg]你的乳房感到紧绷[if (hasArmor) {，你的[armor]在胸部周围感觉变松了}]。你震惊地看着你的乳房肉迅速减少，缩回胸腔。它们最终在达到[breastcup]罩杯大小时停止了。你感觉轻盈了一些。");
               dynStats(DynStat.Spe(1));
               set_changes(get_changes() + 1);
            }
            if(get_player().nippleLength > 1 && get_changes() < get_changeLimit() && Utils.rand(3) == 0)
            {
               outputText("[pg]伴随着一阵突如其来的刺痛，你的[nipples]变得越来越小，直到缩小到原来的一半左右才停下来");
               var _temp_7:* = get_player();
               _temp_7.nippleLength = _temp_7.nippleLength / 2;
            }
            if(get_player().hips.rating > 10 && get_changes() < get_changeLimit() && Utils.rand(3) == 0)
            {
               outputText("[pg]你踉跄了一下，骨盆的骨头痛苦地重新排列。你的臀部变窄了。");
               var _temp_8:* = get_player().hips;
               _temp_8.rating = _temp_8.rating - (1 + Utils.rand(3));
               set_changes(get_changes() + 1);
            }
            if(get_player().hips.rating < 2 && get_changes() < get_changeLimit() && Utils.rand(3) == 0)
            {
               outputText("[pg]你踉跄了一下，感觉到臀部的骨头在摩擦，你的臀部明显变宽了。");
               var _temp_9:* = get_player().hips;
               _temp_9.rating = _temp_9.rating + (1 + Utils.rand(3));
               set_changes(get_changes() + 1);
            }
            if(get_player().tone < 70 && Utils.rand(3) == 0)
            {
               outputText(get_player().modTone(65,2));
            }
            if(get_player().thickness > 35 && Utils.rand(3) == 0)
            {
               outputText(get_player().modThickness(35,5));
            }
         }
         if(get_player().isMaleOrHerm())
         {
            if(get_player().shortestCockLength() < 6 && Utils.rand(3) == 0 && get_changes() < get_changeLimit())
            {
               _loc6_ = get_player().increaseCock(get_player().shortestCockIndex(),1 + Utils.rand(2));
               outputText("你的[if (cocks > 1) {最短的}]肉棒充血到了正常大小，但并没有就此停止。你的肉棒感觉异常紧绷，似乎又有几英寸的长度从你的胯下涌出。你的肉棒增长了" + _loc6_ + "英寸。");
               set_changes(get_changes() + 1);
            }
            if(get_player().biggestCockLength() > 16 && Utils.rand(3) == 0 && get_changes() < get_changeLimit())
            {
               _loc7_ = get_player().biggestCockIndex();
               outputText("[pg]你感到腹股沟一阵紧绷，就像有人从后面拉扯你的肉棒一样。一旦这种感觉消退，你检查了[if (hasLowerGarment) {你的[lowergarment]里面|你的[multicock]}]，发现你[if (cocks > 1) {最大的}][cock]缩短了一点。");
               var _temp_10:* = get_player().cocks[_loc7_];
               _temp_10.cockLength = _temp_10.cockLength - (Utils.rand(10) + 5) / 10;
               if(get_player().cocks[_loc7_].cockThickness > 3)
               {
                  outputText("你的" + get_player().cockDescript(_loc7_) + "肯定也变细了一点。");
                  var _temp_11:* = get_player().cocks[_loc7_];
                  _temp_11.cockThickness = _temp_11.cockThickness - (Utils.rand(4) + 1) / 10;
               }
               set_changes(get_changes() + 1);
            }
            if(get_player().smallestCockArea() < 10 && Utils.rand(3) == 0 && get_changes() < get_changeLimit())
            {
               outputText("[if (cocks > 1) { 你的一根肉棒|你的肉棒}]感觉肿胀而沉重。你用力但轻柔地捏了捏，证实了你的怀疑。它肯定变粗了。");
               get_player().cocks[get_player().thinnestCockIndex()].thickenCock(1.5);
               set_changes(get_changes() + 1);
            }
         }
         if(get_player().countCocksOfType(CockTypesEnum.LIZARD) == 0 && get_player().cockTotal() > 0 && get_changes() < get_changeLimit() && Utils.rand(4) == 0)
         {
            _loc3_ = 0;
            while(_loc3_ < int(get_player().cocks.length))
            {
               if(get_player().cocks[_loc3_].get_cockType() != CockTypesEnum.LIZARD)
               {
                  break;
               }
               _loc3_++;
            }
            outputText("[pg]一阵缓慢的刺痛温暖了你的腹股沟。在它进一步发展之前，你猛地拉开[armor]进行调查。你的" + get_player().cockDescript(_loc3_) + "正在发生变化！它从[if (hasSheath) {包皮|根部}]到尖端松散地起伏，波动和抽搐着，它的颜色变浅、变深，最终定格在紫色的色调上。你的" + Appearance.cockNoun(CockTypesEnum.HUMAN) + "变成了一个球状的形态，尖端略微尖锐。它形状各处的“球茎”看起来会为你的性伴侣提供一次有趣的体验，但这个变态的、外星人一样的鸡巴");
            if(get_player().cor < 33)
            {
               outputText("让你感到恐惧。");
            }
            else if(get_player().cor < 66)
            {
               outputText("对你的口味来说有点奇怪。");
            }
            else
            {
               outputText("看起来被它插可能比用它插别人更有趣。");
               if(get_player().hasVagina())
               {
                  outputText("也许你可以找个长着这种东西的人骑一骑？");
               }
               else
               {
                  outputText("也许你应该找个人测试一下，问问他们到底是什么感觉？");
               }
            }
            outputText("<b>你现在拥有了一根球状的蜥蜴肉棒。</b>");
            if(get_player().hasSheath())
            {
               get_player().cocks[_loc3_].set_cockType(CockTypesEnum.LIZARD);
               if(!get_player().hasSheath())
               {
                  outputText("[pg]你的包皮收紧并开始变得平滑，露出了你" + get_player().cockDescript(_loc3_) + "越来越多的下半部分。片刻之后，<b>你的下体不再那么充满兽性——包皮消失了。</b>");
               }
            }
            else
            {
               get_player().cocks[_loc3_].set_cockType(CockTypesEnum.LIZARD);
            }
            set_changes(get_changes() + 1);
            dynStats(DynStat.Lib(3),DynStat.Lust(10));
         }
         if(get_player().cockTotal() > 1 && get_player().countCocksOfType(CockTypesEnum.LIZARD) > 0 && get_player().cockTotal() > get_player().countCocksOfType(CockTypesEnum.LIZARD) && Utils.rand(4) == 0 && get_changes() < get_changeLimit())
         {
            outputText("[pg]你的胯下开始传来一阵熟悉的刺痛感，为了不错过这场好戏，你拉开了你的[armor]。仿佛得到了提示一般，");
            _loc3_ = 0;
            while(_loc3_ < int(get_player().cocks.length))
            {
               if(get_player().cocks[_loc3_].get_cockType() != CockTypesEnum.LIZARD)
               {
                  break;
               }
               _loc3_++;
            }
            if(get_player().cockTotal() == 2)
            {
               outputText("你的另一根肉棒");
            }
            else
            {
               outputText("你的又一根肉棒");
            }
            outputText("开始变成你已经熟悉的奇怪爬行动物形状。它肉眼可见地扭曲着，在变形的过程中颤抖着，向你传来阵阵快感。");
            if(get_player().cumQ() < 50)
            {
               outputText("先列腺液从顶端渗出");
            }
            else if(get_player().cumQ() < 700)
            {
               outputText("浓稠的先列腺液从顶端如雨般滴落");
            }
            else
            {
               outputText("一股先列腺液溅落在地上");
            }
            outputText("，这是变形带来的快感所致。片刻之后，<b>你拥有了一根球状的蜥蜴肉棒。</b>");
            if(get_player().hasSheath())
            {
               get_player().cocks[_loc3_].set_cockType(CockTypesEnum.LIZARD);
               if(!get_player().hasSheath())
               {
                  outputText("[pg]你的包皮收紧并开始变得平滑，露出了你" + get_player().cockDescript(_loc3_) + "越来越多的下半部分。片刻之后，<b>你的下体不再那么充满兽性——包皮消失了。</b>");
               }
            }
            else
            {
               get_player().cocks[_loc3_].set_cockType(CockTypesEnum.LIZARD);
            }
            set_changes(get_changes() + 1);
            dynStats(DynStat.Lib(3),DynStat.Lust(10));
         }
         if(get_player().countCocksOfType(CockTypesEnum.LIZARD) == get_player().cockTotal() && get_changes() < get_changeLimit() && get_player().hasStatusEffect(StatusEffects.Infested))
         {
            outputText("[pg]就像沉船上的老鼠一样，蠕虫源源不断地从你体内逃出。令人惊讶的是，这种感觉非常舒服，在某种程度上类似于性释放的快感。虽然它们看起来无穷无尽，但这些沾满精液的微小无脊椎动物最终还是慢了下来，变成了涓涓细流。你体内较大的蠕虫同类搅动起来，仿佛从午睡中被打扰，从它在你体内附着的任何地方松脱开来。它慢慢地顺着你的尿道向上蠕动，每一次蹒跚的动作都将尿道撑大到几乎令人痛苦的程度。你的肉棒在根部膨胀起来，被撑得就像蜂女的产卵管一样，以容纳这个寄生生物，但谢天谢地，这种折磨很短暂。");
            if(get_player().balls > 1)
            {
               outputText("剩下的" + Utils.num2Text(get_player().balls - 1) + "条蠕虫轻松地从预先撑开的孔洞中滑出，不过最后一条在你的顶端挂了一会儿才掉到地上。");
            }
            outputText("这个白色的生物加入了地上同类的行列，慢慢地滑走了。也许它们更喜欢哺乳动物？无论如何，<b>你不再感染蠕虫了</b>。");
            get_player().removeStatusEffect(StatusEffects.Infested);
            set_changes(get_changes() + 1);
         }
         if(get_player().get_tallness() < 67 && get_changes() < get_changeLimit() && Utils.rand(5) == 0)
         {
            outputText("[pg]你不安地挪动着身体，因为你意识到自己失去了平衡。低头一看，你发现自己长高了[i:一点]。");
            _loc8_ = get_player();
            _loc8_.set_tallness(_loc8_.get_tallness() + (Utils.rand(3) + 1));
            set_changes(get_changes() + 1);
         }
         if(get_player().get_tallness() > 80 && get_changes() < get_changeLimit() && Utils.rand(5) == 0)
         {
            outputText("[pg]你感到一阵毛骨悚然，让你闭上眼睛打了个寒颤。当你再次睁开眼睛时，世界似乎……变了。经过一番检查，你意识到自己变矮了！");
            _loc8_ = get_player();
            _loc8_.set_tallness(_loc8_.get_tallness() - (Utils.rand(3) + 1));
            set_changes(get_changes() + 1);
         }
         if(get_player().hasNonCockatriceAntennae() && Utils.rand(3) == 0 && get_changes() < get_changeLimit())
         {
            get_mutations().removeAntennae();
         }
         if(get_player().antennae.type == 0 && get_player().face.type == 25 && get_player().ears.type == 21 && Utils.rand(3) == 0 && get_changes() < get_changeLimit())
         {
            outputText("[pg]你的额头突然发痒，让你忍不住用手指在发际线里抓挠。在游移的指尖下，你感觉到毛孔在扩张，其中一根羽毛的羽轴变得更粗更结实。一股突如其来的压力积聚起来，然后又消退了，你紧紧抱住头，痛苦地呻吟着。你试探性地用手指抚摸那两个感觉发源的地方，却摸到两边各有一根长长、柔软且华丽的翎羽。虽然这些" + get_player().hair.color + "的羽毛足够结实，能支撑起自己，但随着你的动作，它们还是会娇俏地摆动。它们似乎会随着你的眉毛移动，帮助你传达表情。");
            outputText("\n<b>你长出了像触角一样的眉羽！</b>");
            get_player().antennae.type = 3;
            set_changes(get_changes() + 1);
         }
         if(get_changes() < get_changeLimit() && (get_player().horns.type != 0 || get_player().horns.value != 0) && Utils.rand(5) == 0)
         {
            outputText("[pg]你的");
            if(get_player().horns.type == 7 || get_player().horns.type == 8)
            {
               outputText("角");
            }
            else
            {
               outputText("角");
            }
            outputText("碎裂了，大块大块地掉落，直到剥落成虚无。");
            get_player().horns.value = 0;
            get_player().horns.type = 0;
            set_changes(get_changes() + 1);
         }
         if(get_mutations().tfNoFur() && get_player().face.type != 25 && get_player().arms.type == 7 && get_player().lowerBody.type == 28 && get_changes() < get_changeLimit() && Utils.rand(3) == 0)
         {
            outputText("[pg]你的头部突然剧痛难忍。你仰起头痛苦地尖叫，感觉到头骨的结构正在发生变移，重塑成……不同的东西。你的下半张脸拉长了，鼻子和嘴唇融合成了新的上半部嘴巴，而下巴很快也跟上了，它们都变硬了。你较大的上唇弯曲覆盖在下唇上，末端呈尖状，颜色也变成了黄色。细小的羽毛迅速从你的皮肤上长出，覆盖着" + (get_player().hasCockatriceSkin() ? get_player().skin.furColor : get_player().hair.color) + "的羽毛。一旦你的脸停止了快速的变形，你用手摸了摸你的脸。你有一个像鸟喙一样的口鼻，不过嘴唇不是锋利的边缘，而是坚固且富有弹性的，让你能像以前一样做出同样多的面部表情，同时又足够坚硬，能像鸟一样啄开种子和坚果。");
            outputText("\n<b>你长出了一张鸡蛇的脸！</b>");
            get_player().face.type = 25;
            set_changes(get_changes() + 1);
         }
         if(get_player().hair.type != 1 && get_changes() < get_changeLimit() && Utils.rand(4) == 0)
         {
            outputText("[pg]你的头皮开始发麻，越来越严重，直到你痒得发狂，当你像狗挠跳蚤一样抓挠时，羽毛状的头发丝逗弄着你的指尖。当你把手收回来时，你看到绒毛从你的[claws]上飘落。你恍然大悟——<b>你的头发变成了羽毛，就像鹰身女妖一样！</b>");
            get_player().hair.type = 1;
            set_changes(get_changes() + 1);
         }
         if(get_player().eyes.type != 8 && get_player().face.type == 25 && get_player().underBody.type == 6 && get_player().ears.type == 21 && get_changes() < get_changeLimit() && Utils.rand(3) == 0)
         {
            outputText("[pg]你的眼睛突然灼痛，眼泪顺着脸颊流下。你的虹膜变大了，占据了你的整个眼睛，像蜘蛛网一样的浅蓝色爬过你现在充满活力的蓝色眼睛，看起来像闪电。你的瞳孔也迅速变大以相匹配，拉长成类似猫科动物的细长形状。当你的眼睛停止流泪时，你终于看清了自己。你的眼睛现在和你在山里遇到的鸡蛇一样了！你对此的兴奋导致你的瞳孔扩大成大圆圈，让你看起来既可爱又兴奋。看来你以后再也无法保持扑克脸了。");
            outputText("\n<b>你现在有了鸡蛇的眼睛！</b>");
            get_player().eyes.type = 8;
            get_player().eyes.count = 2;
         }
         if(get_player().tongue.type != 5 && get_player().face.type == 25 && get_changes() < get_changeLimit() && Utils.rand(3) == 0)
         {
            get_mutations().gainLizardTongue();
         }
         if(get_player().ears.type != 21 && get_player().face.type == 25 && get_changes() < get_changeLimit() && Utils.rand(3) == 0)
         {
            outputText("[pg]你的耳朵突然充满了一种刺痛感；虽然不舒服，但还不算痛苦。这种感觉越来越强烈，直到你再也受不了，伸手去抓它们。令你惊讶的是，你发现它们像过热的蜡烛一样融化了。当它们消失在虚无中时，你惊慌失措，让你暂时失聪和发晕，困惑地跌跌撞撞。然后，突然之间，你的听力恢复了。你感激地调查了一下，发现你现在有一对鸟类的耳孔，头部两侧各一个。你的太阳穴突然一阵剧痛，你感觉到长长的羽毛从你头部的侧面长出来，最长的是垂直的，而3根较短的则分别以1点钟、2点钟和3点钟的角度长出。稍微耐心一点，你开始像调整耳朵一样调整这些羽毛，以帮助你听音。");
            outputText("\n<b>你现在有了鸡蛇的耳朵！</b>");
            get_player().ears.type = 21;
            set_changes(get_changes() + 1);
         }
         if(get_player().arms.type != 7 && get_changes() < get_changeLimit() && Utils.rand(4) == 0)
         {
            outputText("[pg]刺痛的不适感突然在你全身爆发，就像你每一寸皮肤都突然长满了针刺。你抓挠自己，希望能得到缓解；但很快注意到皮下形成了肿块，你的下臂开始蜕皮。一层" + (get_player().hasCockatriceSkin() ? get_player().skin.furColor : get_player().hair.color) + "的羽毛从你的皮肤上长出，完全覆盖了你的上臂和肩膀，在手肘处形成一个毛茸茸的袖口。几根长长的羽毛像退化的翅膀一样装饰着你的手肘。然而，你的下臂长出了一层厚厚的坚韧鳞片，手指尖长出了看起来很危险的利爪。就像发痒来得一样突然，它消退了，留下你惊叹于你的新双臂。");
            outputText("\n<b>你现在有了鸡蛇的手臂！</b>");
            get_player().arms.setType(7,9);
            set_changes(get_changes() + 1);
         }
         if(get_player().neck.type != 2 && get_changes() < get_changeLimit() && Utils.rand(4) == 0)
         {
            get_mutations().restoreNeck(_loc2_);
         }
         if(get_player().rearBody.type != 0 && get_changes() < get_changeLimit() && Utils.rand(5) == 0)
         {
            get_mutations().restoreRearBody(_loc2_);
         }
         if(!get_player().hasCockatriceSkin() && get_player().face.type == 25 && get_changes() < get_changeLimit() && Utils.rand(3) == 0)
         {
            get_mutations().restoreNeck(_loc2_ + "-forceRestoreNeck");
            _loc1_ = get_mutations().newCockatriceColors();
            outputText("[pg]你的身体感觉很热，皮肤感觉紧绷，让你在一阵头晕目眩中跪倒在地。你跪在那里喘着粗气，随着压力的增加，汗水从你的额头滴落。你不知道自己还能承受多久，很快你就陷入了昏迷。");
            outputText("\n当你醒来时，你检查了一下自己，看看现在那种压倒性的压力离开你的身体后发生了什么变化。你注意到的第一件事是羽毛，很多很多的羽毛，现在像一层绒毛一样覆盖着你的身体。在你的脖子周围形成了一圈柔软蓬松的羽毛，就像异国鸟类一样。当你低头看你的[chest]时，你看到从你的胸部到腹股沟都覆盖着一层" + _loc1_[2] + "的鳞片。");
            outputText("\n<b>你的身体现在覆盖着鳞片和羽毛！</b>");
            _loc9_ = _loc1_[0];
            _loc10_ = _loc1_[2];
            get_player().skin.setAllProps({
               "type":2,
               "furColor":_loc9_,
               "tone":_loc10_,
               "desc":"鳞片"
            });
            _loc11_ = _loc1_[1];
            _loc12_ = _loc1_[2];
            get_player().underBody.setAllProps({
               "type":6,
               "skin":{
                  "type":8,
                  "furColor":_loc11_,
                  "tone":_loc12_,
                  "desc":"羽毛"
               }
            });
            get_player().neck.restore();
            get_player().neck.type = 2;
            get_player().neck.color = _loc1_[1];
            set_changes(get_changes() + 1);
         }
         if(get_player().neck.type != 2 && get_player().hasCockatriceSkin() && get_player().face.type == 25 && get_changes() < get_changeLimit() && Utils.rand(3) == 0)
         {
            get_mutations().restoreNeck(_loc2_);
            outputText("[pg]你的脖子开始发麻，[secondary furcolor]的羽毛开始一根接一根地长出来，直到形成一圈柔软蓬松的羽毛，就像异国鸟类一样。");
            outputText("\n<b>你现在有了鸡蛇的脖子！</b>");
            _loc9_ = _loc1_[1];
            get_player().neck.setAllProps({
               "type":2,
               "color":_loc9_
            });
            set_changes(get_changes() + 1);
         }
         if(get_player().lowerBody.type != 28 && get_changes() < get_changeLimit() && Utils.rand(4) == 0)
         {
            outputText("[pg]你痛苦地尖叫起来，因为你感觉到脚上的骨头突然断裂并重组，变成了趾行结构。这些奇怪的新腿长着三趾的爪脚，后面还有一个退化的小爪趾以增加抓地力，然而从臀部到膝盖都覆盖着一层" + (get_player().hasCockatriceSkin() ? get_player().skin.furColor : get_player().hair.color) + "羽毛，末端形成一个袖口状的边缘。");
            outputText("\n<b>你长出了鸡蛇的腿！</b>");
            get_player().lowerBody.type = 28;
            get_player().lowerBody.legCount = 2;
            set_changes(get_changes() + 1);
         }
         if(get_player().tail.type != 29 && get_changes() < get_changeLimit() && Utils.rand(4) == 0)
         {
            outputText("[pg]你的[butt]突然传来一阵隐隐的胀痛，迫使你用手去摸；你能感觉到尾骨上方有一个不祥的肿块，随着每一次心跳变得越来越大。突然间，它似乎爆炸了，向外突出并环绕着，直到它悬停在你的脚踝附近。你手指下的皮肤覆盖着羽毛，但在大约一英寸后以“v”形结束，取而代之的是" + get_player().skin.tone + "的鳞片。");
            outputText("\n<b>你现在有了一条鸡蛇的尾巴！</b>");
            get_player().tail.type = 29;
            get_player().tail.recharge = 5;
            get_player().tail.venom = 0;
            set_changes(get_changes() + 1);
         }
         if(get_player().wings.type != 9 && get_player().arms.type == 7 && get_changes() < get_changeLimit() && Utils.rand(4) == 0)
         {
            outputText("\n");
            if(get_player().wings.type != 0)
            {
               outputText("\n你的[wings]上的感觉缓慢但确实地消退了，留下它们干瘪的外壳断裂掉在地上。你的背部闭合起来掩盖了失去的翅膀，就像你进入传送门那天一样光滑无损。");
            }
            get_player().wings.setProps({
               "type":9,
               "color":(get_player().isFluffy() || get_player().hasCockatriceSkin() ? get_player().skin.furColor : get_player().hair.color)
            });
            outputText("\n疼痛刺穿了你的背部，肌肉奇怪地打结并向上挤压，使你的皮肤鼓起。很痛，天哪，真的很痛，但你找不到一个好角度去感受痛苦的根源。一声巨响划破空气，然后你的身体正迫使一对狭窄的肢体穿过你舒适衣服的缝隙。血液泵入新的附肢，随着它们的充实和生长，疼痛得到了缓解。你试探性地发现自己正在弯曲你不知道自己拥有的肌肉，并且<b>你能够将新的生长物弯曲得足够远，以看到你全新的、" + get_player().wings.color + "的翅膀</b>。");
            set_changes(get_changes() + 1);
         }
         if(get_changes() == 0)
         {
            outputText("[pg]非人的活力蔓延你的全身，让你精神焕发！\n");
            get_player().HPChange(50,true);
            dynStats(DynStat.Lust(3));
         }
         get_player().refillHunger(20);
         var _loc13_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc13_,2077,FlagDict_Impl_.arrayReadInt(_loc13_,2077) + get_changes());
         return false;
      }
   }
}

