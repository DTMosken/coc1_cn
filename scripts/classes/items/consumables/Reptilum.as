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
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.items.Consumable;
   import classes.items.Mutations;
   import flash.Boot;
   import haxe.IMap;
   
   public class Reptilum extends Consumable
   {
      
      public function Reptilum()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("Reptlum","Reptilum","a vial of Reptilum",6,"This is a rounded bottle with a small label that reads, \"Reptilum\". It is likely this potion is tied to reptiles in some way.");
      }
      
      override public function useItem() : Boolean
      {
         var _loc3_:* = null as Array;
         var _loc4_:* = null as String;
         var _loc1_:String = "reptilum";
         if(get_player().hasDragonWingsAndFire())
         {
            _loc1_ += get_player().isBasilisk() ? "-dracolisk" : "-dragonewt";
         }
         else
         {
            _loc1_ += get_player().isBasilisk() ? "-basilisk" : "-lizan";
         }
         get_player().slimeFeed();
         var _loc2_:int = 0;
         get_mutations().initTransformation([2,2,3,4]);
         outputText("你拔开小瓶的塞子，把液体喝了下去。味道很酸，就像干葡萄酒，余味和酒精不完全不同。它没有带来你期望的温暖，反而让你的喉咙感到寒冷和一点麻木。");
         if(get_player().get_spe() > get_player().ngPlus(50) && get_changes() < get_changeLimit() && Utils.rand(4) == 0)
         {
            outputText("[pg]你开始感到迟钝和寒冷。躺下来晒晒太阳可能会让你感觉好点。");
            dynStats(DynStat.Spe(-1));
         }
         if(get_player().get_sens100() > 20 && get_changes() < get_changeLimit() && Utils.rand(3) == 0)
         {
            outputText("[pg]如针扎般的刺痛感传遍你的全身，让你的感官在之后变得有些迟钝。");
            dynStats(DynStat.Sens(-1));
         }
         if(get_player().get_lib100() < 100 && get_changes() < get_changeLimit() && Utils.rand(3) == 0)
         {
            outputText("[pg]你肠胃里的一团火让你弯下了腰，但几分钟后就过去了。当你直起身子时，你能感觉到热量渗入你的体内，");
            if(int(get_player().cocks.length) > 0 && (get_player().get_gender() != 3 || Utils.rand(2) == 0))
            {
               outputText("充满");
               if(int(get_player().cocks.length) > 1)
               {
                  outputText("每一个");
               }
               outputText("你的[cocks]都充满了繁殖的欲望。当你意识到你的性欲得到了提升时，你变得更加饥渴了。");
            }
            else if(get_player().hasVagina())
            {
               outputText("在你的" + get_player().vaginaDescript(0) + "中积聚。一种交配和产卵的本能欲望在你体内蔓延，增加了你的性欲并提升了你的性冲动。");
            }
            else
            {
               outputText("在你毫无特征的胯部积聚了瞬间，然后滑入你的" + get_player().assDescript() + "。你想要被操，被填满，甚至可能再次获得一个合适的性别。在欲望中，你意识到你的性欲已经被永久提升了。");
            }
            if(get_player().get_lib100() < 50)
            {
               dynStats(DynStat.Lib(1));
            }
            if(get_player().get_lib100() < 75)
            {
               dynStats(DynStat.Lib(1));
            }
            dynStats(DynStat.Lib(1));
         }
         if(get_player().get_tou() < get_player().ngPlus(70) && get_changes() < get_changeLimit() && Utils.rand(3) == 0)
         {
            if(get_player().get_tou() < get_player().ngPlus(40))
            {
               outputText("[pg]你的身体和皮肤都明显变厚了。你试探性地捏了捏你的[skindesc]，惊叹于你的皮肤变得多么坚韧。");
               dynStats(DynStat.Tou(3));
            }
            else if(get_player().get_tou() < get_player().ngPlus(55))
            {
               outputText("[pg]当你感觉到你的身形变得更加结实时，你咧嘴笑了。似乎你的整个身体都在很好地变得强壮，当这种感觉消失时，你觉得自己准备好挨一击了。");
               dynStats(DynStat.Tou(2));
            }
            else
            {
               outputText("[pg]当你感觉到自己变得更加强壮时，你高兴地咆哮起来。这是一个几乎无法察觉的差异，但你能感觉到你的[skindesc]变得足够坚韧，让你觉得自己无坚不摧。");
               dynStats(DynStat.Tou(1));
            }
         }
         if(get_player().countCocksOfType(CockTypesEnum.LIZARD) == 0 && get_player().cockTotal() > 0 && get_changes() < get_changeLimit() && tfChance(2,4))
         {
            _loc2_ = get_player().findFirstCockNotOfType(CockTypesEnum.LIZARD);
            outputText("[pg]一阵缓慢的酥麻感温暖了你的腹股沟。在它进一步发展之前，你猛地拉开你的[armor]来查看。你的" + get_player().cockDescript(_loc2_) + "正在发生变化！它松弛地从");
            if(get_player().hasSheath())
            {
               outputText("包皮");
            }
            else
            {
               outputText("根部");
            }
            outputText("到龟头起伏抽搐着，它的颜色变浅，变深，最后定格在紫色的色调上。你的" + Appearance.cockNoun(CockTypesEnum.HUMAN) + "变成了一个球状的形态，尖端略微突出。它形状上遍布的“球茎”看起来会给你的性伴侣带来有趣的骑乘体验，但这个变态的、异形的肉棒");
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
               outputText("看起来用来承受可能比用在别人身上更有趣。");
               if(get_player().hasVagina())
               {
                  outputText("也许你可以找个有这种肉棒的人来骑？");
               }
               else
               {
                  outputText("也许你应该在别人身上测试一下，问问他们到底是什么感觉？");
               }
            }
            outputText("<b>你现在有了一根球状的、蜥蜴人般的肉棒。</b>");
            if(get_player().hasSheath())
            {
               get_player().cocks[_loc2_].set_cockType(CockTypesEnum.LIZARD);
               if(!get_player().hasSheath())
               {
                  outputText("[pg]你的包皮收紧并开始变得平滑，露出了你的" + get_player().cockDescript(_loc2_) + "下部越来越多的部分。过了一会儿，<b>你的腹股沟不再那么具有兽性了——包皮消失了。</b>");
               }
            }
            else
            {
               get_player().cocks[_loc2_].set_cockType(CockTypesEnum.LIZARD);
            }
            set_changes(get_changes() + 1);
            dynStats(DynStat.Lib(3),DynStat.Lust(10));
         }
         if(get_player().cockTotal() > 1 && get_player().countCocksOfType(CockTypesEnum.LIZARD) > 0 && get_player().hasCockNotOfType(CockTypesEnum.LIZARD) && tfChance(2,4) && get_changes() < get_changeLimit())
         {
            outputText("[pg]一阵熟悉的酥麻感在你的胯下开始，为了不错过这场好戏，你拉开了你的[armor]。仿佛得到了提示一般，");
            _loc2_ = get_player().findFirstCockNotOfType(CockTypesEnum.LIZARD);
            if(get_player().cockTotal() == 2)
            {
               outputText("你的另一根肉棒");
            }
            else
            {
               outputText("你的又一根肉棒");
            }
            outputText("开始变成你已经熟悉的奇怪爬行动物形状。它肉眼可见地扭曲着，颤抖着，随着转变的进行，向你散发出愉悦的感觉。");
            if(get_player().cumQ() < 50)
            {
               outputText("先列腺液从龟头渗出");
            }
            else if(get_player().cumQ() < 700)
            {
               outputText("浓稠的先列腺液从龟头如雨般滴落");
            }
            else
            {
               outputText("一股先列腺液溅在地上");
            }
            outputText("，这是因为变形带来的快感。片刻之后，<b>你就有了一根球状的、蜥蜴人般的肉棒。</b>");
            if(get_player().hasSheath())
            {
               get_player().cocks[_loc2_].set_cockType(CockTypesEnum.LIZARD);
               if(!get_player().hasSheath())
               {
                  outputText("[pg]你的包皮收紧并开始变得平滑，露出了你的" + get_player().cockDescript(_loc2_) + "下部越来越多的部分。过了一会儿，<b>你的腹股沟不再那么具有兽性了——包皮消失了。</b>");
               }
            }
            else
            {
               get_player().cocks[_loc2_].set_cockType(CockTypesEnum.LIZARD);
            }
            set_changes(get_changes() + 1);
            dynStats(DynStat.Lib(3),DynStat.Lust(10));
         }
         if(get_player().countCocksOfType(CockTypesEnum.LIZARD) == 1 && int(get_player().cocks.length) == 1 && tfChance(2,4) && get_changes() < get_changeLimit())
         {
            outputText("[pg]你的腹股沟处传来一阵压迫感，迫使你试图忍受时跌倒在[feet]上。你检查了受影响的部位，看到在你的[cock]旁边，[skindesc]下开始鼓起一个肿块。那里的肉颜色变深，变成了紫色");
            if(get_player().isFurryOrScaley())
            {
               outputText("并脱落了[skindesc]");
            }
            outputText("随着肿块变长，从你的身体里凸出来。你惊讶得来不及反应，只能痛苦地喘息着，看着那个肉块开始呈现出阴茎的形状。<b>你长出了第二根蜥蜴肉棒！</b>它一直长到和它的兄弟一样长，颜色也是同样闪亮的紫色才停止生长。一滴精液从它的顶端渗出，你终于感到了一丝解脱。");
            get_player().createCock();
            get_player().cocks[1].set_cockType(CockTypesEnum.LIZARD);
            get_player().cocks[1].cockLength = get_player().cocks[0].cockLength;
            get_player().cocks[1].cockThickness = get_player().cocks[0].cockThickness;
            set_changes(get_changes() + 1);
            dynStats(DynStat.Lib(3),DynStat.Lust(10));
         }
         if(get_player().countCocksOfType(CockTypesEnum.LIZARD) == get_player().cockTotal() && get_changes() < get_changeLimit() && get_player().hasStatusEffect(StatusEffects.Infested))
         {
            outputText("[pg]就像沉船上的老鼠一样，蠕虫源源不断地从你体内逃出。令人惊讶的是，这种感觉非常舒服，在某种程度上类似于性释放的快感。虽然它们似乎无穷无尽，但这些沾满精液的微小无脊椎动物的速度逐渐慢了下来。你体内较大的蠕虫亲属蠕动着，仿佛从午睡中被打扰，从它在你体内附着的任何系泊处松开。它慢慢地顺着你的尿道向上移动，每一次蹒跚的动作都拉伸到几乎令人痛苦的程度。你的阴茎根部肿胀起来，像蜂女的产卵管一样被拉伸，以容纳这个寄生生物，但值得庆幸的是，这种折磨很短暂。");
            if(get_player().balls > 1)
            {
               outputText("剩下的 " + Utils.num2Text(get_player().balls - 1) + " 个轻松地滑出预先拉伸的孔洞，尽管最后一个在掉到地上之前在你的顶端悬挂了片刻。");
            }
            outputText("这个白色的生物加入了地上同类的行列，慢慢地滑走了。也许它们更喜欢哺乳动物？无论如何，<b>你不再感染蠕虫了</b>。");
            get_player().removeStatusEffect(StatusEffects.Infested);
            set_changes(get_changes() + 1);
         }
         if(get_player().biggestTitSize() >= 1 && get_player().get_gender() == 1 && get_changes() < get_changeLimit() && tfChance(2,3))
         {
            if(get_player().biggestTitSize() > 8)
            {
               outputText("[pg]你胸部的肉紧绷起来，在几秒钟内失去了近一半的质量。由于你的平衡中心突然转移，你踉跄着试图不让自己摔倒。你稳住自己，对乳房大小的巨大变化感到惊叹。");
            }
            else
            {
               outputText("[pg]瞬间，你的胸部向内收缩，消耗了每一盎司的乳房组织。你留下了一个光滑、男性化的躯干，尽管你的乳头还在。");
            }
            outputText("随着重量和重力的变化，你发现四处走动变得容易多了。");
            _loc2_ = 0;
            while(_loc2_ < int(get_player().breastRows.length))
            {
               if(get_player().breastRows[_loc2_].breastRating > 8)
               {
                  var _temp_1:* = get_player().breastRows[_loc2_];
                  _temp_1.breastRating = _temp_1.breastRating / 2;
               }
               else
               {
                  get_player().breastRows[_loc2_].breastRating = 0;
               }
               _loc2_++;
            }
            dynStats(DynStat.Lib(2));
            set_changes(get_changes() + 1);
         }
         if(get_player().biggestLactation() >= 1 && get_changes() < get_changeLimit() && tfChance(2,4))
         {
            if(get_player().totalNipples() == 2)
            {
               outputText("[pg]你的两个");
            }
            else
            {
               outputText("[pg]你所有的");
            }
            outputText("乳头放松下来。这是一种奇怪的感觉，你拉开上衣去触摸其中一个。感觉很好，虽然似乎没有任何乳汁漏出。你捏了捏它，惊讶地发现什么也没有");
            if(get_player().hasFuckableNipples())
            {
               outputText("除了淫液");
            }
            outputText("流出。<b>你不再泌乳了。</b>这说得通，只有哺乳动物才会泌乳！你微笑着，心想这在清理装备时能为你节省多少时间。");
            if(get_player().hasPerk(PerkLib.Feeder) || get_player().hasStatusEffect(StatusEffects.Feeder))
            {
               outputText("[pg](<b>失去了喂食者特质！</b>)");
               get_player().removePerk(PerkLib.Feeder);
               get_player().removeStatusEffect(StatusEffects.Feeder);
            }
            set_changes(get_changes() + 1);
            _loc2_ = 0;
            while(_loc2_ < int(get_player().breastRows.length))
            {
               get_player().breastRows[_loc2_].lactationMultiplier = 0;
               _loc2_++;
            }
         }
         if(get_player().averageNipplesPerBreast() > 1 && get_changes() < get_changeLimit() && tfChance(2,4))
         {
            outputText("[pg]一阵寒意掠过你的 " + get_player().allBreastsDescript() + " 然后消失了。你把手伸进你的[armor]下，发现你多余的乳头不见了！你现在每个");
            if(get_player().biggestTitSize() < 1)
            {
               outputText("\'乳房\'。");
            }
            else
            {
               outputText("乳房上只有一个了。");
            }
            set_changes(get_changes() + 1);
            _loc2_ = 0;
            while(_loc2_ < int(get_player().breastRows.length))
            {
               get_player().breastRows[_loc2_].nipplesPerBreast = 1;
               _loc2_++;
            }
         }
         if(get_changes() < get_changeLimit() && int(get_player().breastRows.length) > 1 && tfChance(2,3) && !get_hyper())
         {
            get_mutations().removeExtraBreastRow(_loc1_);
         }
         if(get_player().hasVagina() && tfChance(3,5) && get_player().lizardScore() > 3)
         {
            get_mutations().updateOvipositionPerk(_loc1_);
         }
         if(!get_player().hasDragonHorns(true) && get_changes() < get_changeLimit() && tfChance(3,5))
         {
            get_mutations().gainDraconicHorns(_loc1_);
         }
         if(get_player().neck.type != 0 && get_changes() < get_changeLimit() && tfChance(2,4))
         {
            get_mutations().restoreNeck(_loc1_);
         }
         if(get_player().hasNonSharkRearBody() && get_changes() < get_changeLimit() && tfChance(3,5))
         {
            get_mutations().restoreRearBody(_loc1_);
         }
         if(get_changes() < get_changeLimit() && tfChance(2,4))
         {
            get_mutations().lizardHairChange(_loc1_);
         }
         if(get_player().hasBeard() && get_changes() < get_changeLimit() && tfChance(2,3))
         {
            outputText("[pg]你的 " + get_player().beardDescript() + " 感觉越来越松，直到最后，你的胡子掉了下来。");
            outputText("(<b>你不再有胡子了！</b>)");
            get_player().beard.length = 0;
            get_player().beard.style = 0;
         }
         if(get_player().lowerBody.type != 10 && get_changes() < get_changeLimit() && tfChance(3,5))
         {
            if(get_player().lowerBody.type == 1)
            {
               outputText("[pg]你痛苦地尖叫起来，感觉自己的蹄子开裂破碎，开始重新排列。你的双腿变成了趾行形态，脚上长出了爪子，变成了前面三个脚趾，脚跟一个较小脚趾的结构。");
            }
            else if(get_player().isTaur())
            {
               outputText("[pg]你的下半身被剧痛折磨！当疼痛过去后，你发现自己正用长着蜥蜴般爪子的趾行双腿站立着。");
            }
            else if(get_player().lowerBody.type == 0 || get_player().lowerBody.type == 2 || get_player().lowerBody.type == 5 || get_player().lowerBody.type == 6 || get_player().lowerBody.type == 7 || get_player().lowerBody.type == 9 || get_player().lowerBody.type == 10)
            {
               outputText("[pg]你痛苦地尖叫起来，感觉腿部的骨头断裂并开始重新排列。它们变成了趾行形态，脚上长出了爪子，变成了前面三个脚趾，脚跟一个较小脚趾的结构。");
            }
            else
            {
               outputText("[pg]剧痛撕裂了你的[legs]，使它们变形扭曲，直到骨骼重新排列成趾行结构。这双奇怪的腿有着长着爪子的三趾脚，后面还有一个退化的小爪趾用来增加抓地力。");
            }
            outputText("<b>你长出了爬行动物的双腿和爪子！</b>");
            get_player().lowerBody.type = 10;
            get_player().lowerBody.legCount = 2;
            set_changes(get_changes() + 1);
         }
         if(get_player().arms.type != 14 && get_player().hasReptileScales() && get_player().lowerBody.type == 10 && get_changes() < get_changeLimit() && tfChance(2,3))
         {
            get_player().arms.setType(14,1);
            outputText("[pg]你心不在焉地抓了抓二头肌，但无论怎么抓都无法止痒。在忍受了很长一段时间后，你终于烦躁地低头看去，却发现你的双臂已经变成了某种爬行类杀手的模样，上面覆盖着[skinfurscales]，短小的" + get_player().arms.claws.tone + "爪子取代了你的指甲。");
            outputText("\n<b>你现在拥有了爬行动物的手臂。</b>");
            set_changes(get_changes() + 1);
         }
         if(get_player().arms.type == 14 && get_player().hasLizardScales() && get_player().arms.claws.type != 1 && get_changes() < get_changeLimit() && tfChance(2,3))
         {
            outputText("[pg]你的[claws]发生了一些变化，变得像爬行动物一样。");
            get_player().arms.updateClaws(1);
            outputText("<b>你现在长出了[claws]。</b>");
            set_changes(get_changes() + 1);
         }
         if(get_player().tail.type != 9 && get_player().lowerBody.type == 10 && get_changes() < get_changeLimit() && tfChance(3,5))
         {
            if(get_player().tail.type == 0)
            {
               outputText("[pg]你倒在地上，脊椎扭曲生长，迫使你" + get_player().assDescript() + "上方的血肉凸起。新的骨头一块接一块地形成，在你的背后长出了一条锥形、灵活的尾巴。<b>你现在拥有了一条爬行动物的尾巴！</b>");
            }
            else
            {
               outputText("[pg]你倒在地上，尾巴扭曲生长，改变形状逐渐变细成一个尖端。它来回甩动，灵活自如，完全受你控制。<b>你现在拥有了一条爬行动物的尾巴。</b>");
            }
            get_player().tail.type = 9;
            set_changes(get_changes() + 1);
         }
         if(get_changes() < get_changeLimit() && tfChance(3,5) && get_player().eyes.type != 0 && !get_player().hasReptileEyes())
         {
            if(get_player().eyes.type == 2)
            {
               outputText("[pg]你感到眼睛一阵刺痛，眨了眨眼。感觉就像黑色的白内障刚刚从你眼中脱落，你不需要照镜子就知道你的眼睛已经恢复了人类的模样。");
            }
            else
            {
               outputText("[pg]你眨了眨眼，踉跄了一下，一阵眩晕感几乎让你站不稳[feet]。当你站稳并睁开眼睛时，你意识到似乎有些不同。你的视力不知怎么改变了。");
               if(get_player().eyes.type == 1 || get_player().eyes.type == 7)
               {
                  outputText("<b>你的蛛形怪物眼睛消失了！</b>");
               }
               outputText("<b>你再次拥有了正常的人类眼睛。</b>");
            }
            get_player().eyes.type = 0;
            get_player().eyes.count = 2;
            set_changes(get_changes() + 1);
         }
         if(get_player().ears.type != 6 && get_player().tail.type == 9 && get_player().lowerBody.type == 10 && get_changes() < get_changeLimit() && tfChance(3,5))
         {
            outputText("[pg]头皮传来一阵紧绷感，将你的耳朵从正常的肉质形状拉扯成中心有孔的鳞状小凸起。<b>你长出了爬行动物的耳朵！</b>");
            get_player().ears.type = 6;
            set_changes(get_changes() + 1);
         }
         if(get_mutations().tfNoFur() && !get_player().hasLizardScales() && get_player().ears.type == 6 && get_player().tail.type == 9 && get_player().lowerBody.type == 10 && get_changes() < get_changeLimit() && tfChance(3,5))
         {
            _loc3_ = get_mutations().newLizardSkinTone();
            if(get_player().hasFur())
            {
               get_player().skin.tone = _loc3_[0];
               get_player().arms.updateClaws(get_player().arms.claws.type);
               outputText("[pg]你抓了抓自己，扯下了一大团[furcolor]的毛发。你惊慌失措地低头看去，发现你的毛发正大把大把地脱落。身上痒得发狂，你不停地抓挠着身体，以惊人的速度蜕掉剩下的毛发。在毛发下面，你的皮肤感觉异常光滑，随着越来越多的毛发脱落，你发现一层无缝的" + get_player().skin.tone + "鳞片覆盖了你身体的大部分。剩下的毛发也很容易就被拔掉了。");
            }
            else if(get_player().hasNonLizardScales())
            {
               outputText("[pg]刺痛的不适感突然在全身爆发，就像你每一寸皮肤都突然长出了针刺。你抓挠着自己，希望能缓解一下；当你看着自己的手时，你注意到手指上挂着你" + get_player().skinFurScales() + "的小碎片。尽管如此，你还是继续抓挠着自己，当你终于停下来时，你打量了一下自己。新的鳞片已经长出来，取代了你剥落的[skinFurScales]。");
               get_player().skin.tone = _loc3_[0];
               get_player().arms.updateClaws(get_player().arms.claws.type);
            }
            else
            {
               outputText("[pg]你漫不经心地伸手到背后抓痒，当碰到硬物时，你差点从[armor]里跳出来。快速低头一看，发现鳞片正以惊人的速度从你" + get_player().skin.tone + "的皮肤上长出来。就在你注视的时候，你的皮肤表面已经覆盖满了光滑的鳞片。它们紧密相连，简直天衣无缝。你剥开你的" + Utils.cnName(get_player().get_armorName()) + "，发现你身体其他部位的转化也已经完成了。");
               get_player().skin.tone = _loc3_[0];
               get_player().arms.updateClaws(get_player().arms.claws.type);
            }
            get_player().skin.setProps({
               "type":2,
               "adj":"",
               "desc":"鳞片"
            });
            get_player().underBody.type = 1;
            _loc4_ = _loc3_[1];
            get_player().copySkinToUnderBody({
               "desc":"腹鳞",
               "tone":_loc4_
            });
            outputText("[pg]<b>你从头到脚都覆盖着闪亮的[skintone]鳞片，腹部则是[underBody.skinFurScales]。</b>");
            set_changes(get_changes() + 1);
         }
         if(get_mutations().tfNoFur() && get_player().face.type != 7 && get_player().hasReptileScales() && get_player().ears.type == 6 && get_player().tail.type == 9 && get_player().lowerBody.type == 10 && get_changes() < get_changeLimit() && tfChance(3,5))
         {
            outputText("[pg]可怕的剧痛席卷了你的[face]，骨头在断裂和移动。你的下颌骨重新排列，头骨变短。这些变化似乎持续了永远；一旦它们完成，时间似乎并没有流逝。当你习惯你的新脸时，你的手指拂过你长满牙齿的口鼻。看来<b>你现在有一张长满牙齿的爬行动物面孔了。</b>");
            get_player().face.type = 7;
         }
         if(get_player().tongue.type == 1 && get_changes() < get_changeLimit() && Utils.rand(10) < 6)
         {
            get_mutations().gainLizardTongue();
         }
         if([5,1].indexOf(get_player().tongue.type) == -1 && get_player().hasReptileFace() && get_changes() < get_changeLimit() && tfChance(2,3))
         {
            get_mutations().gainLizardTongue();
         }
         if(tfChance(2,4) && get_player().hasGills() && get_changes() < get_changeLimit())
         {
            get_mutations().updateGills();
         }
         if(!get_player().hasLizardEyes() && get_player().face.type == 7 && get_player().hasReptileScales() && get_player().ears.type == 6 && get_changes() < get_changeLimit() && tfChance(2,4))
         {
            if(get_player().hasReptileEyes())
            {
               outputText("[pg]你的眼睛外观发生了轻微的变化。");
            }
            else
            {
               outputText("[pg]你感到眼睛突然一阵剧痛，它们开始重塑。你的瞳孔开始拉长，变成垂直的缝隙，你的虹膜也改变了颜色。");
               outputText("\n当疼痛过去后，你在附近的水坑里检查你的眼睛。你看着你的新眼睛，垂直的瞳孔被黄绿色的虹膜包围着。由于还残留着几滴眼泪，看起来有点模糊。为了看得更清楚，你眨了眨眼，把剩下的眼泪挤掉，突然你意识到，你刚才用的是你的第二层眼睑。\n");
            }
            outputText("<b>你现在有蜥蜴的眼睛了。</b>");
            get_player().eyes.type = 3;
            set_changes(get_changes() + 1);
         }
         if(get_changes() == 0)
         {
            outputText("[pg]非人的活力蔓延你的全身，让你精神焕发！\n");
            get_player().HPChange(50,true);
            dynStats(DynStat.Lust(3));
         }
         get_player().refillHunger(20);
         var _loc5_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc5_,2077,FlagDict_Impl_.arrayReadInt(_loc5_,2077) + get_changes());
         return false;
      }
   }
}

