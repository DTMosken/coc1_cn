package classes.items.consumables
{
   import classes.Appearance;
   import classes.BreastRow;
   import classes.Cock;
   import classes.CockTypesEnum;
   import classes.DynStat;
   import classes.PerkLib;
   import classes.Player;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.items.Consumable;
   import classes.items.Mutations;
   import classes.lists.ColorLists;
   import flash.Boot;
   import haxe.IMap;
   
   public class SalamanderFirewater extends Consumable
   {
      
      public function SalamanderFirewater()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("SalamFW","S. Firewater","a hip flask of Salamander Firewater",6,"This hip flask contains a high-proof beverage called \'Salamander Firewater\', one sip of which can make your throat feel like it\'s been set on fire.");
      }
      
      override public function useItem() : Boolean
      {
         var _loc3_:* = null as Array;
         var _loc4_:* = null as String;
         var _loc1_:String = "salamanderfirewater";
         get_player().slimeFeed();
         var _loc2_:int = 0;
         get_mutations().initTransformation([2,3,4]);
         outputText("你拔开随身酒壶的塞子，一饮而尽。味道其实相当不错，像酒，但里面带着一丝火辣。正如你所料，它让你感到浑身发热，准备好迎接整个世界的挑战。");
         if(get_player().get_spe100() > 70 && get_changes() < get_changeLimit() && Utils.rand(4) == 0)
         {
            outputText("[pg]你开始感到迟钝。躺下来享受美酒可能会让你感觉好些。");
            dynStats(DynStat.Spe(-1));
         }
         if(get_player().get_inte100() > 60 && get_changes() < get_changeLimit() && Utils.rand(4) == 0)
         {
            outputText("[pg]你开始感到有些头晕，但这种感觉很快就过去了。仔细想想，你在脑海中拂去了似乎弥漫在脑海中的模糊感，并断定这种烈酒可能实际上让你变笨了。最好不要喝太多。");
            dynStats(DynStat.Inte(-1));
         }
         if(get_player().get_lib100() < 90 && get_changes() < get_changeLimit() && Utils.rand(3) == 0)
         {
            outputText("[pg]你肠胃里的一团火让你弯下了腰，但几秒钟后就过去了。当你直起身子时，你能感觉到热量渗入你的体内，");
            if(int(get_player().cocks.length) > 0 && (get_player().get_gender() != 3 || Utils.rand(2) == 0))
            {
               outputText("填满");
               if(int(get_player().cocks.length) > 1)
               {
                  outputText("你的每一根");
               }
               outputText("[cocks]，让你充满了繁殖的欲望。当你意识到你的性欲得到了提升时，你变得更加饥渴了。");
            }
            else if(get_player().hasVagina())
            {
               outputText("在你的" + get_player().vaginaDescript(0) + "里积聚。一种交配的本能欲望传遍全身，增加了你的性欲并提升了你的性冲动。");
            }
            else
            {
               outputText("在滑入你的" + get_player().assDescript() + "之前，在毫无特征的胯部积聚了片刻。你想要被操，被填满，甚至可能再次获得一个合适的性别。在欲望中，你意识到你的性欲已经被永久提升了。");
            }
            dynStats(DynStat.Lib(2));
         }
         if(get_player().get_tou100() < 90 && get_changes() < get_changeLimit() && Utils.rand(3) == 0)
         {
            if(get_player().get_tou100() < 50)
            {
               outputText("[pg]你的身体和皮肤都明显变厚了。你试探性地捏了捏你的[skindesc]，惊叹于它现在变得多么坚韧。");
               dynStats(DynStat.Tou(3));
            }
            else if(get_player().get_tou100() < 70)
            {
               outputText("[pg]当你感觉到自己的身体变得更加结实时，你咧嘴笑了。似乎你的整个身体都在很好地变得坚韧，当这种感觉消失时，你觉得自己准备好挨一击了。");
               dynStats(DynStat.Tou(2));
            }
            else
            {
               outputText("[pg]当你感觉到自己变得更加坚韧时，你高兴地咆哮起来。这几乎是难以察觉的差异，但你能感觉到你的[skindesc]变得足够坚韧，让你觉得自己是无敌的。");
               dynStats(DynStat.Tou(1));
            }
         }
         if(get_player().get_str100() < 80 && Utils.rand(3) == 0 && get_changes() < get_changeLimit())
         {
            outputText("[pg]热量在你的肌肉中积聚，它们原本就强壮的肌肉群微微变移，获得了比以前更强的力量。");
            dynStats(DynStat.Str(1));
         }
         if(get_player().countCocksOfType(CockTypesEnum.LIZARD) == 0 && get_player().cockTotal() > 0 && get_changes() < get_changeLimit() && Utils.rand(4) == 0)
         {
            _loc2_ = 0;
            while(_loc2_ < int(get_player().cocks.length))
            {
               if(get_player().cocks[_loc2_].get_cockType() != CockTypesEnum.LIZARD)
               {
                  break;
               }
               _loc2_++;
            }
            outputText("[pg]一阵缓慢的酥麻感温暖了你的腹股沟。在它进一步发展之前，你猛地拉开你的[armor]来查看。你的" + get_player().cockDescript(_loc2_) + "正在发生变化！它松散地起伏着，从");
            if(get_player().hasSheath())
            {
               outputText("包皮");
            }
            else
            {
               outputText("根部");
            }
            outputText("到龟头，起伏并抽搐着，它的颜色变浅，变深，最后定格在一种紫色的色调上。你的" + Appearance.cockNoun(CockTypesEnum.HUMAN) + "变成了一个球状的形态，顶端略微尖锐。它形状上遍布的“球茎”看起来会为你的性伴侣提供一次有趣的骑乘体验，但这个变态的、外星人一样的肉棒");
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
                  outputText("也许你可以找个有这种肉棒的人来骑一下？");
               }
               else
               {
                  outputText("也许你应该在别人身上测试一下，问问他们到底是什么感觉？");
               }
            }
            outputText("<b>你现在有了一根球状的、蜥蜴般的肉棒。</b>");
            if(get_player().hasSheath())
            {
               get_player().cocks[_loc2_].set_cockType(CockTypesEnum.LIZARD);
               if(!get_player().hasSheath())
               {
                  outputText("[pg]你的包皮收紧并开始变得平滑，露出了你" + get_player().cockDescript(_loc2_) + "下部越来越多的部分。过了一会儿，<b>你的腹股沟不再那么有兽性了——包皮消失了。</b>");
               }
            }
            else
            {
               get_player().cocks[_loc2_].set_cockType(CockTypesEnum.LIZARD);
            }
            set_changes(get_changes() + 1);
            dynStats(DynStat.Lib(3),DynStat.Lust(10));
         }
         if(get_player().cockTotal() > 1 && get_player().countCocksOfType(CockTypesEnum.LIZARD) > 0 && get_player().cockTotal() > get_player().countCocksOfType(CockTypesEnum.LIZARD) && Utils.rand(4) == 0 && get_changes() < get_changeLimit())
         {
            outputText("[pg]你的胯下开始出现一阵熟悉的酥麻感，为了不错过这场好戏，你拉开了你的[armor]。仿佛是得到了提示一般，");
            _loc2_ = 0;
            while(_loc2_ < int(get_player().cocks.length))
            {
               if(get_player().cocks[_loc2_].get_cockType() != CockTypesEnum.LIZARD)
               {
                  break;
               }
               _loc2_++;
            }
            if(get_player().cockTotal() == 2)
            {
               outputText("你的另一根肉棒");
            }
            else
            {
               outputText("你的又一根肉棒");
            }
            outputText("开始变成你已经熟悉的奇怪爬行动物形状。它肉眼可见地扭曲着，颤抖着，随着变形的进行，向你辐射出愉悦的感觉。");
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
               outputText("一股先列腺液飞溅在地上");
            }
            outputText("，这是因为变形带来的快感。片刻之后，<b>你就有了一根球状的、蜥蜴般的肉棒。</b>");
            if(get_player().hasSheath())
            {
               get_player().cocks[_loc2_].set_cockType(CockTypesEnum.LIZARD);
               if(!get_player().hasSheath())
               {
                  outputText("[pg]你的包皮收紧并开始变得平滑，露出了你" + get_player().cockDescript(_loc2_) + "下部越来越多的部分。过了一会儿，<b>你的腹股沟不再那么有兽性了——包皮消失了。</b>");
               }
            }
            else
            {
               get_player().cocks[_loc2_].set_cockType(CockTypesEnum.LIZARD);
            }
            set_changes(get_changes() + 1);
            dynStats(DynStat.Lib(3),DynStat.Lust(10));
         }
         if(get_player().biggestTitSize() >= 1 && get_player().get_gender() == 1 && get_changes() < get_changeLimit() && Utils.rand(3) == 0)
         {
            if(get_player().biggestTitSize() > 8)
            {
               outputText("[pg]你胸部的肌肉紧缩，在几秒钟内就失去了近一半的质量。由于重心突然改变，你踉跄了一下，努力不让自己摔倒。你稳住身子，惊叹于胸部尺寸的巨大变化。");
            }
            else
            {
               outputText("[pg]刹那间，你的胸部向内收缩，吞噬了每一寸乳肉。你现在拥有了一个平滑、充满阳刚之气的躯干，尽管你的乳头还在。");
            }
            outputText("随着重量和重心的改变，你发现行动起来轻松多了。");
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
         if(get_player().averageNipplesPerBreast() > 1 && get_changes() < get_changeLimit() && Utils.rand(4) == 0)
         {
            outputText("[pg]一阵寒意掠过你的" + get_player().allBreastsDescript() + "，然后消失了。你把手伸进[armor]下，发现多余的乳头不见了！你现在每个");
            if(get_player().biggestTitSize() < 1)
            {
               outputText("“乳房”。");
            }
            else
            {
               outputText("乳房上只有一个乳头了。");
            }
            set_changes(get_changes() + 1);
            _loc2_ = 0;
            while(_loc2_ < int(get_player().breastRows.length))
            {
               get_player().breastRows[_loc2_].nipplesPerBreast = 1;
               _loc2_++;
            }
         }
         if(get_player().smallestTitSize() < 6 && get_player().get_gender() == 2 && get_changes() < get_changeLimit() && Utils.rand(4) == 0)
         {
            outputText("[pg]你刚咽下最后一滴，胸口就感到一阵刺痛和酥麻，双手不由自主地伸上去抓挠。你在心里默默祈祷自己对这东西不过敏。就在你开始抓挠你的" + get_player().breastDescript(get_player().smallestTitRow()) + "时，你的胸部突然微微隆起，开始生长。");
            var _temp_2:* = get_player().breastRows[get_player().smallestTitRow()];
            _temp_2.breastRating = _temp_2.breastRating + 1;
            set_changes(get_changes() + 1);
         }
         if(get_changes() < get_changeLimit() && int(get_player().breastRows.length) > 1 && Utils.rand(3) == 0 && !get_hyper())
         {
            get_mutations().removeExtraBreastRow(_loc1_);
         }
         if(get_player().neck.type != 0 && get_changes() < get_changeLimit() && Utils.rand(4) == 0)
         {
            get_mutations().restoreNeck(_loc1_);
         }
         if(get_player().hasNonSharkRearBody() && get_changes() < get_changeLimit() && Utils.rand(5) == 0)
         {
            get_mutations().restoreRearBody(_loc1_);
         }
         if(Utils.rand(5) == 0)
         {
            get_mutations().updateOvipositionPerk(_loc1_);
         }
         if(get_player().tail.type != 9 && get_player().tail.type != 25 && get_changes() < get_changeLimit() && Utils.rand(3) == 0)
         {
            if(get_player().tail.type == 0)
            {
               outputText("[pg]你倒在地上，脊椎扭曲生长，迫使你" + get_player().assDescript() + "上方的血肉凸起。新的骨头一块接一块地形成，在你的身体后部构建出一条锥形、可抓握的尾巴。<b>你现在有了一条爬行动物的尾巴！</b>");
            }
            else
            {
               outputText("[pg]你倒在地上，尾巴扭曲生长，改变形状，逐渐变细成一个尖端。它来回甩动，灵活自如，完全受你控制。<b>你现在有了一条爬行动物的尾巴。</b>");
            }
            get_player().tail.type = 9;
            set_changes(get_changes() + 1);
         }
         if(get_player().tail.type == 9 && get_changes() < get_changeLimit() && Utils.rand(3) == 0)
         {
            outputText("[pg]你感到尾巴传来一阵奇怪的灼烧感，" + (get_player().skin.tone == "red" ? "尽管" : "并且") + "当你把它绕到身前查看时，" + (get_player().skin.tone == "red" ? "它看起来并没有什么不同。就在你以为那疼痛只是错觉时，它" : "你的[skintone][skindesc][skinis]已经变成了火红色。更糟的是，它很快") + "变得滚烫，烫得你不得不松开手，尾尖刚一脱手就燃起了明亮的火焰。即使你[if (singleleg) {保持|站立}]不动，[if (!isnaked) { 尽管穿着[armor]，}]它的热量也让人不舒服地贴在你的背上，你很难摆脱这种随时可能[if (isgoo) {融化|烧伤自己}]的威胁。");
            outputText("[pg]就在这时，那股热量消失了，仿佛被一只无形的手掐灭。当你用手指触摸鳞片，发现它们异常凉爽时，你[if (isgoo) {松了|长舒了}]一口气。经过片刻紧张的怀疑、担忧，以及最终的尝试，你发现只需心念一动，就能让尾巴的火焰熄灭或燃起。你甚至觉得，只要集中精神，就能让它完全燃烧，像一条烧红的鞭子一样挥舞。<b>你现在有了一条火蜥蜴的尾巴！</b>");
            get_player().tail.type = 25;
            set_changes(get_changes() + 1);
         }
         if(get_player().lowerBody.type != 25 && get_player().tail.type == 25 && get_changes() < get_changeLimit() && Utils.rand(3) == 0)
         {
            if(get_player().lowerBody.type == 1)
            {
               outputText("[pg]你痛苦地尖叫起来，感觉蹄子开裂破碎，开始重新排列。你的腿变成了趾行形态，脚上长出了爪子，变成了前面三个脚趾，脚跟一个小脚趾的结构。");
            }
            else if(get_player().isTaur())
            {
               outputText("[pg]你的下半身剧痛无比！疼痛过后，你发现自己站立在长着火蜥蜴般爪子的趾行腿上。");
            }
            else if(get_player().lowerBody.type == 0 || get_player().lowerBody.type == 2 || get_player().lowerBody.type == 5 || get_player().lowerBody.type == 6 || get_player().lowerBody.type == 7 || get_player().lowerBody.type == 9 || get_player().lowerBody.type == 10)
            {
               outputText("[pg]你痛苦地尖叫起来，感觉腿骨断裂并开始重新排列。它们变成了趾行形态，脚上长出了爪子，变成了前面三个脚趾，脚跟一个小脚趾的结构。");
            }
            else
            {
               outputText("[pg]剧痛撕裂了你的[legs]，使它们变形扭曲，直到骨骼重新排列成趾行结构。这双奇怪的腿长着三趾利爪，脚后跟还有一个退化的小爪趾，用来增加抓地力。");
            }
            outputText("<b>你现在拥有了火蜥蜴的腿和爪子！</b>");
            get_player().lowerBody.type = 25;
            get_player().lowerBody.legCount = 2;
            set_changes(get_changes() + 1);
         }
         if(get_player().arms.type != 5 && get_player().lowerBody.type == 25 && get_changes() < get_changeLimit() && Utils.rand(3) == 0)
         {
            outputText("[pg]你心不在焉地抓挠着二头肌，但无论怎么抓，都无法消除那股痒意。在尽可能久地试图忽略它之后，你终于烦躁地低头看了一眼自己的手臂，却发现[if (hasscales) {你的" + (get_player().skin.tone == "red" ? "鳞片" : "[skintone]鳞片现在变成了红色，并且") + "有着坚韧皮革般的质感|你的[skindesc][if (hasfeathers) {已经|已经}]硬化成了红色的皮革状鳞片}]，手指尖端现在长出了短而弯曲的爪子，在[sun]光下看起来几乎像火焰一样。<b>你现在拥有了火蜥蜴的手臂。</b>");
            get_player().arms.setType(5,3);
            set_changes(get_changes() + 1);
         }
         if(get_changes() < get_changeLimit() && Utils.rand(4) == 0 && get_player().eyes.type > 0)
         {
            if(get_player().eyes.type == 2)
            {
               outputText("[pg]你感到眼睛一阵刺痛，眨了眨眼。感觉就像黑色的白内障刚刚从你眼前脱落，你不需要照镜子就知道你的眼睛已经恢复了人类的模样。");
            }
            else
            {
               outputText("[pg]你眨了眨眼，踉跄了一下，一阵眩晕感袭来，几乎要让你[feet]发软跌倒。当你站稳并睁开眼睛时，你意识到似乎有些不同。你的视觉不知怎么的发生了变化。");
               if(get_player().eyes.type == 1 || get_player().eyes.type == 7)
               {
                  outputText("<b>你的蛛形怪物眼睛消失了！</b>");
               }
               outputText("<b>你又拥有了正常的人类眼睛。</b>");
            }
            get_player().eyes.type = 0;
            get_player().eyes.count = 2;
            set_changes(get_changes() + 1);
         }
         if(get_player().face.type != 0 && get_changes() < get_changeLimit() && Utils.rand(4) == 0)
         {
            outputText("[pg]一阵突如其来的剧痛席卷了你的[face]，随着骨骼扭曲和下颌线的移动，你的面容变得狰狞。疼痛慢慢消失，留下你捂着脸哭泣。当你把手拿开时，你意识到自己又恢复了一张完全正常的人类面孔。");
            get_player().face.type = 0;
            set_changes(get_changes() + 1);
         }
         if(get_player().face.type == 0 && get_player().ears.type != 0 && get_changes() < get_changeLimit() && Utils.rand(4) == 0)
         {
            outputText("[pg]哎哟，你的头好痛！感觉就像你的耳朵被从头上扯下来一样，当你伸手去摸你那疼痛的脑袋时，你发现它们消失了！你头晕目眩，摇摇晃晃，几乎失去了平衡感，差点摔倒了半打次，直到<b>一对正常的人类耳朵从你头的两侧长出来。</b>你几乎忘记了人类耳朵的感觉！");
            get_player().ears.type = 0;
            set_changes(get_changes() + 1);
         }
         if(ColorLists.SALAMANDER_SKIN.indexOf(get_player().skin.tone) < 0 && get_changes() < get_changeLimit() && Utils.rand(4) == 0)
         {
            set_changes(get_changes() + 1);
            outputText("[pg]过了一会儿你才注意到，但是<b>");
            if(get_player().hasFur())
            {
               outputText("你[furcolor]的[skindesc]下的皮肤已经");
            }
            else
            {
               outputText("你的" + get_player().skin.desc + (get_player().skin.desc.indexOf("scales") != -1 ? "已经" : "已经"));
            }
            _loc3_ = ColorLists.SALAMANDER_SKIN;
            _loc4_ = _loc3_[Utils.rand(int(_loc3_.length))];
            get_player().skin.tone = _loc4_;
            get_player().arms.updateClaws(get_player().arms.claws.type);
            outputText("变成了[skintone]色。</b>");
         }
         if(!get_player().hasPlainSkin() && get_player().ears.type == 0 && Utils.rand(3) == 0 && get_changes() < get_changeLimit())
         {
            outputText("[pg]一种缓慢积聚的瘙痒感蔓延至你全身，当你漫不经心地抓挠时，你发现你的[skinfurscales]");
            outputText("" + (get_player().hasScales() ? "正在" : "正在") + "掉落到地上，露出下面完美无瑕的皮肤。<b>你现在拥有正常的皮肤了。</b>");
            get_player().skin.type = 0;
            get_player().skin.desc = "skin";
            get_player().skin.adj = "";
            get_player().underBody.restore();
            set_changes(get_changes() + 1);
         }
         if(Utils.rand(4) == 0 && get_player().hasGills() && get_changes() < get_changeLimit())
         {
            get_mutations().updateGills();
         }
         if(get_changes() == 0)
         {
            outputText("[pg]非人的活力蔓延到你的全身，让你精神焕发！\n");
            get_player().HPChange(100,true);
            dynStats(DynStat.Lust(5));
         }
         if(get_player().tail.type == 25 && get_player().lowerBody.type == 25 && get_player().arms.type == 5 && !get_player().hasPerk(PerkLib.Lustserker))
         {
            outputText("[pg]喝完另一壶火酒后，你开始感觉到体内有一种奇怪的、略微不舒服的感觉——就像许多小火焰在你的血管中流淌。你正在思考自己到底发生了什么，这时你想起火蜥蜴天生就有进入类似狂暴状态的天赋。你猜这种感觉就是它。");
            outputText("[pg](<b>获得特质：情欲狂暴</b>)[pg]");
            get_player().createPerk(PerkLib.Lustserker,0,0,0,0);
         }
         get_player().refillHunger(20);
         var _loc5_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc5_,2077,FlagDict_Impl_.arrayReadInt(_loc5_,2077) + get_changes());
         return false;
      }
   }
}

