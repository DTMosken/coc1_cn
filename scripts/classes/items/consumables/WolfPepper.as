package classes.items.consumables
{
   import classes.BreastRow;
   import classes.Cock;
   import classes.CockTypesEnum;
   import classes.DynStat;
   import classes.PerkLib;
   import classes.Player;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.internals._OneOf.OneOf_Impl_;
   import classes.items.Consumable;
   import classes.items.Mutations;
   import flash.Boot;
   import haxe.IMap;
   import haxe.ds.Either;
   
   public class WolfPepper extends Consumable
   {
      
      public function WolfPepper()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("Wolf Pp","Wolf Pepper","a wolf pepper",6,"A shiny black pepper. Its shape is bulbous at the base, but long and narrow at the tip, with a fuzzy feel to it. It\'s similar, but not quite the same as the usual canine peppers you\'d find, and it smells quite spicy.");
      }
      
      override public function useItem() : Boolean
      {
         var _loc6_:int = 0;
         var _loc7_:* = null as Array;
         var _loc8_:Boolean = false;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc1_:String = "wolfPepper";
         var _loc2_:int = 0;
         var _loc3_:Number = 0;
         var _loc4_:Number = 0;
         var _loc5_:Number = 1;
         get_mutations().initTransformation([2,2]);
         outputText("这种胡椒的质地令人不舒服，表面覆盖着柔软的绒毛，就像桃子一样，但又像其他胡椒一样有些脆。它的辛辣让你几乎把它吐出来，之后你只能吸着鼻子。");
         if(Utils.randomChance(15))
         {
            _loc5_ = int(Math.random() * 20) / 10 + 2;
            outputText("也许它有点太辣了……这种胡椒似乎比你预期的要成熟得多。");
         }
         dynStats(DynStat.Lib(1 + Utils.rand(2)),DynStat.Lust(5 + Utils.rand(10)),DynStat.Cor(1 + Utils.rand(5)));
         outputText("[pg]吃完后你舔了舔嘴唇。那种辛辣在很多方面都击中了你。");
         if(get_player().get_tou100() < 70 && Utils.trueOnceInN(3) && get_changes() < get_changeLimit())
         {
            dynStats(DynStat.Tou(_loc5_));
            if(_loc5_ > 1)
            {
               outputText("[pg]你转动肩膀，试探性地绷紧手臂。你感觉更耐打了，你的血液似乎更清晰地流过你的身体。你知道你有更多的耐力。");
            }
            else
            {
               outputText("[pg]你的肌肉感觉更紧实、更耐打。不是感觉更强壮，而是你觉得你能承受更多的打击。");
            }
         }
         if(get_player().get_spe100() > 30 && Utils.trueOnceInN(7) && get_changes() < get_changeLimit())
         {
            dynStats(DynStat.Spe(-1 * _loc5_));
            if(_loc5_ > 1)
            {
               outputText("[pg]胡椒强烈的味道让你后退了几步，靠在最近的坚固物体上。你觉得你再也走不快了。");
            }
            else
            {
               outputText("[pg]你向前踉跄了一下，但还是稳住了身子。不过，你还是觉得自己的动作变慢了一些。");
            }
         }
         if(get_player().get_inte100() < 60 && Utils.trueOnceInN(7) && get_changes() < get_changeLimit())
         {
            dynStats(DynStat.Inte(_loc5_));
            outputText("[pg]辛辣的味道让你头晕目眩，但你还是勉强让自己清醒过来。在余味中，一种奇怪的清明感笼罩着你，你觉得");
            if(_loc5_ > 1)
            {
               outputText("自己");
            }
            outputText("不知怎么的变聪明了。");
         }
         if(![12,0].contains(get_player().arms.claws.type) && Utils.trueOnceInN(4))
         {
            get_player().arms.claws.restore();
         }
         if(get_player().antennae.type != 0 && Utils.trueOnceInN(3) && get_changes() < get_changeLimit())
         {
            get_mutations().removeAntennae();
         }
         if((get_player().horns.type != 0 || get_player().horns.value > 0) && Utils.trueOnceInN(3) && get_changes() < get_changeLimit())
         {
            outputText("[pg]你感觉到你的角碎裂了，大块大块地掉落，直到化为乌有。");
            get_player().horns.value = 0;
            get_player().horns.type = 0;
            set_changes(get_changes() + 1);
         }
         if((get_player().wings.type != 0 || get_player().rearBody.type == 3) && Utils.trueOnceInN(3) && get_changes() < get_changeLimit())
         {
            if(get_player().rearBody.type == 3)
            {
               outputText("[pg]一阵紧绷感蔓延过你的背部，感觉就像有人把匕首刺进了你的脊椎。片刻之后，疼痛消失了，但你的鳍也不见了！");
               get_player().rearBody.restore();
            }
            else
            {
               outputText("[pg]一阵紧绷感蔓延过你的背部，感觉就像有人把匕首刺进了你的每一块肩胛骨。片刻之后，疼痛消失了，但你的翅膀也不见了！");
            }
            get_player().wings.restore();
            set_changes(get_changes() + 1);
         }
         if(get_player().tongue.type != 0 && Utils.trueOnceInN(3) && get_changes() < get_changeLimit())
         {
            outputText("[pg]你舔了舔上颚，注意到你的舌头感觉不一样了。你突然意识到——<b>你拥有了人类的舌头！</b>");
            get_player().tongue.type = 0;
            set_changes(get_changes() + 1);
         }
         if(get_changes() < get_changeLimit() && Utils.trueOnceInN(3) && get_player().eyes.type != 0 && get_player().eyes.type != 6)
         {
            if(get_player().eyes.type == 2)
            {
               outputText("[pg]你感到眼睛一阵刺痛，你眨了眨眼。感觉就像黑色的白内障刚从你身上脱落，你不用看自己的倒影就知道你的眼睛已经恢复了人类的模样。");
            }
            else
            {
               outputText("[pg]你眨了眨眼，踉跄了一下，一阵眩晕感袭来，让你几乎站立不稳。当你稳住身形睁开眼睛时，你意识到似乎有些不一样了。你的视觉不知怎么的发生了变化。");
               if(get_player().eyes.type == 1 || get_player().eyes.type == 7)
               {
                  outputText("你的蛛形怪物眼睛不见了！");
               }
               outputText("<b>你拥有了正常的人类眼睛。</b>");
            }
            get_player().eyes.type = 0;
            get_player().eyes.count = 2;
            set_changes(get_changes() + 1);
         }
         if(![26,0].contains(get_player().lowerBody.type) && Utils.trueOnceInN(4))
         {
            get_mutations().restoreLegs(_loc1_);
         }
         if(get_player().arms.type != 6 && Utils.trueOnceInN(4))
         {
            get_mutations().restoreArms(_loc1_);
         }
         if(get_player().hair.type == 1 && Utils.trueOnceInN(4))
         {
            get_mutations().removeFeatheryHair();
         }
         if(Boolean([7,6].contains(get_player().hair.type)) && Utils.trueOnceInN(4))
         {
            get_mutations().removeBassyHair();
         }
         if(get_player().get_gender() == 0 && int(get_player().cocks.length) == 0 && get_changes() < get_changeLimit())
         {
            outputText("[pg]你弯下腰，腹股沟一阵剧痛，你及时脱下你的[armor]，看着一个凸起从你的身体里挤出来。皮肤向后折叠并聚集成一个包皮，露出下面一根红色的、带有肉结的狼阴茎，正流着先列腺液。随着疼痛的消退，你颤抖着深吸了一口气，只留下一种模糊的欲望和对你新天赋的暗自赞叹。<b>你现在拥有了一根狼阴茎。</b>");
            get_player().createCock();
            _loc6_ = Utils.rand(4);
            get_player().cocks[0].cockLength = _loc6_ + 4;
            get_player().cocks[0].cockThickness = Utils.rand(2);
            get_player().cocks[0].knotMultiplier = 1.5;
            get_player().cocks[0].set_cockType(CockTypesEnum.WOLF);
            dynStats(DynStat.Lib(3),DynStat.Sens(2),DynStat.Lust(25));
            set_changes(get_changes() + 1);
         }
         if(get_player().hasCock())
         {
            if(get_player().wolfCocks() < int(get_player().cocks.length) && get_changes() < get_changeLimit() && Utils.trueOnceInN(2))
            {
               _loc6_ = get_player().findFirstCockNotOfType(CockTypesEnum.WOLF);
               if(get_player().cocks[_loc6_].get_cockType().get_Index() > 4)
               {
                  outputText("[pg]你的" + get_player().cockDescript(_loc6_) + "颤抖着，改变大小和形状，变成了一根闪亮的红色狼阴茎，底部有一个肥大的肉结。<b>你现在拥有了一根狼阴茎。</b>");
                  dynStats(DynStat.Sens(3),DynStat.Lust(5 * _loc5_));
                  if(get_player().cocks[_loc6_].get_cockType() == CockTypesEnum.HORSE)
                  {
                     if(get_player().cocks[_loc6_].cockLength > 6)
                     {
                        var _temp_1:* = get_player().cocks[_loc6_];
                        _temp_1.cockLength = _temp_1.cockLength - 2;
                     }
                     else
                     {
                        var _temp_2:* = get_player().cocks[_loc6_];
                        _temp_2.cockLength = _temp_2.cockLength - 0.5;
                     }
                     get_player().cocks[_loc6_].thickenCock(0.5);
                  }
               }
               get_player().cocks[_loc6_].set_cockType(CockTypesEnum.WOLF);
               get_player().cocks[_loc6_].knotMultiplier = 1.5;
               get_player().cocks[_loc6_].thickenCock(2);
               set_changes(get_changes() + 1);
            }
         }
         if(int(get_player().breastRows.length) > 0 && int(get_player().breastRows.length) <= 4)
         {
            if(get_player().breastRows[0].breastRating >= 1)
            {
               if(int(get_player().breastRows.length) < 4 && Utils.trueOnceInN(2) && get_changes() < get_changeLimit())
               {
                  get_player().createBreastRow();
                  _loc2_ = int(get_player().breastRows.length) - 1;
                  if(get_player().breastRows[0].breastRating <= int(get_player().breastRows.length))
                  {
                     outputText("[pg]你的[breasts]在你的上衣里感到紧绷和疼痛，因为它们每时每刻都在变大，直到它们达到");
                     var _temp_3:* = get_player().breastRows[0];
                     _temp_3.breastRating = _temp_3.breastRating + 1;
                     outputText("[breastcup]大小才停下来。");
                     set_changes(get_changes() + 1);
                  }
                  if(int(get_player().breastRows.length) == 2 && get_changes() < get_changeLimit())
                  {
                     get_player().breastRows[_loc2_].breastRating = get_player().breastRows[0].breastRating - 1;
                     if(get_player().breastRows[0].breastRating - 1 == 0)
                     {
                        outputText("[pg]第二对乳房在当前这对乳房下方形成，在它们还相当平坦、看起来很有男性气概时就停止了生长。");
                     }
                     else
                     {
                        outputText("[pg]第二对乳房在当前这对乳房下方凸起，在它们达到" + get_player().breastCup(_loc2_) + "罩杯时停止了生长。");
                     }
                     outputText("在每个新乳房的顶端，长出了一个敏感的凸起，变成了一个新的乳头。");
                     dynStats(DynStat.Sens(2),DynStat.Lust(5));
                     set_changes(get_changes() + 1);
                  }
                  if(int(get_player().breastRows.length) > 2 && get_player().breastRows[0].breastRating > int(get_player().breastRows.length) && get_changes() < get_changeLimit())
                  {
                     dynStats(DynStat.Sens(2),DynStat.Lust(5));
                     _loc7_ = get_player().breastRows;
                     get_player().breastRows[_loc2_].breastRating = _loc7_[_loc2_ - 1].breastRating - 1;
                     if(get_player().breastRows[_loc2_].breastRating < 0)
                     {
                        get_player().breastRows[_loc2_].breastRating = 0;
                     }
                     if(get_player().breastRows[_loc2_ - 1].breastRating < 0)
                     {
                        get_player().breastRows[_loc2_ - 1].breastRating = 0;
                     }
                     if(get_player().breastRows[_loc2_].breastRating == 0)
                     {
                        outputText("[pg]你的腹部感到刺痛和抽搐，一排新的乳房在其他乳房下方长了出来。你的新乳房保持平坦和男性化，没有长得更大。");
                     }
                     else
                     {
                        outputText("[pg]你的腹部感到一阵刺痛和抽搐，一排新的" + get_player().breastCup(_loc2_) + "" + get_player().breastDescript(_loc2_) + "在其他乳房下方长了出来。");
                     }
                     outputText("在每个新乳房的顶端，长出了一个敏感的凸起，变成了一个新的乳头。");
                     set_changes(get_changes() + 1);
                  }
                  if(_loc5_ > 1)
                  {
                     if(_loc5_ > 2)
                     {
                        outputText("你试探性地掂量着你新的胸部，用温柔的触摸探索着新的血肉。强烈的快感让你的眼睛几乎翻白。");
                        dynStats(DynStat.Sens(8),DynStat.Lust(15));
                     }
                     else
                     {
                        outputText("你带着敬畏和渴望交织的心情触摸着你的新乳头，这种体验让你兴奋得无以复加。你高兴地尖叫起来，几乎要高潮了，但最终还是找到了克制自己的意志力。");
                        dynStats(DynStat.Sens(4),DynStat.Lust(10));
                     }
                  }
               }
               else if(Utils.trueOnceInN(2))
               {
                  _loc2_ = int(get_player().breastRows.length);
                  _loc3_ = 0;
                  _loc8_ = false;
                  while(_loc2_ > 1 && _loc3_ == 0)
                  {
                     _loc2_--;
                     if(get_player().breastRows[_loc2_].breastRating + 1 < get_player().breastRows[_loc2_ - 1].breastRating)
                     {
                        if(!_loc8_)
                        {
                           _loc8_ = true;
                           outputText("\n");
                        }
                        outputText("\n你的");
                        if(_loc2_ == 0)
                        {
                           outputText("第一");
                        }
                        if(_loc2_ == 1)
                        {
                           outputText("第二");
                        }
                        if(_loc2_ == 2)
                        {
                           outputText("第三");
                        }
                        if(_loc2_ == 3)
                        {
                           outputText("第四");
                        }
                        if(_loc2_ > 3)
                        {
                           outputText("");
                        }
                        outputText("排" + get_player().breastDescript(_loc2_) + "变大了，仿佛在嫉妒上方晃动的肉团。");
                        _loc3_ = get_player().breastRows[_loc2_ - 1].breastRating - get_player().breastRows[_loc2_].breastRating - 1;
                        if(_loc3_ > 4)
                        {
                           _loc3_ = 4;
                        }
                        if(_loc3_ < 1)
                        {
                           _loc3_ = 1;
                        }
                        var _temp_4:* = get_player().breastRows[_loc2_];
                        _temp_4.breastRating = _temp_4.breastRating + _loc3_;
                     }
                  }
               }
            }
         }
         if(get_changes() < get_changeLimit() && get_player().bRows() > 4 && Utils.trueOnceInN(3))
         {
            get_mutations().removeExtraBreastRow(_loc1_);
         }
         else if(get_player().hasVagina() && get_player().bRows() == 0 && get_player().breastRows[0].breastRating == 0 && get_player().nippleLength == 0 && Utils.trueOnceInN(2) && get_changes() < get_changeLimit())
         {
            outputText("[pg]随着重心的偏移，你的胸部感到一阵不舒服的刺痛。<b>你现在有了一对D罩杯的乳房。</b>");
            outputText("在每个乳房的顶端，长出了一个敏感的凸起，变成了一个新的乳头。");
            get_player().createBreastRow();
            get_player().breastRows[0].breastRating = 4;
            get_player().breastRows[0].breasts = 2;
            get_player().nippleLength = 0.25;
            dynStats(DynStat.Sens(4),DynStat.Lust(6));
            set_changes(get_changes() + 1);
         }
         if(get_changes() < get_changeLimit() && Utils.trueOnceInN(3) && !get_hyper())
         {
            _loc3_ = 0;
            _loc4_ = 0;
            if(get_player().biggestTitSize() > 4)
            {
               _loc3_ = 4;
            }
            if(_loc3_ > 0)
            {
               _loc4_ = 0;
               _loc6_ = 0;
               _loc9_ = int(get_player().breastRows.length);
               while(_loc6_ < _loc9_)
               {
                  _loc10_ = _loc6_++;
                  if(get_player().breastRows[_loc10_].breastRating > _loc3_)
                  {
                     if(get_player().breastRows[_loc10_].breastRating > 10)
                     {
                        var _temp_5:* = get_player().breastRows[_loc10_];
                        _temp_5.breastRating = _temp_5.breastRating - (2 + Utils.rand(3));
                        if(_loc4_ == 0)
                        {
                           outputText("[pg]你胸前的[breasts]晃动了一下，然后收紧，在这个过程中缩小了好几个罩杯！");
                        }
                        else
                        {
                           outputText("变化向下蔓延到你的第" + Utils.num2TextOrdinal(_loc10_ + 1) + "排[breasts]。它们大幅度缩小，失去了几个罩杯的尺寸。");
                        }
                     }
                     else
                     {
                        var _temp_6:* = get_player().breastRows[_loc10_];
                        _temp_6.breastRating = _temp_6.breastRating - 1;
                        if(_loc4_ == 0)
                        {
                           outputText("[pg]突然间，你的重心发生了偏移。你的背部感到一阵轻松，你花了一会儿才意识到你的" + get_player().breastDescript(_loc10_) + "缩小了！");
                        }
                        else
                        {
                           outputText("你的第" + Utils.num2TextOrdinal(_loc10_ + 1) + "排" + get_player().breastDescript(_loc10_) + "在缩小时微微晃动了一下，失去了一些质量。");
                        }
                     }
                     _loc4_++;
                  }
               }
            }
            if(_loc4_ > 0)
            {
               set_changes(get_changes() + 1);
            }
         }
         if(get_mutations().tfNoFur() && Utils.trueOnceInN(5) && get_changes() < get_changeLimit() && !get_player().hasFur())
         {
            _loc7_ = [{"upper":"白色的"},{"upper":"灰色的"},{"upper":"深灰色的"},{"upper":"浅灰色的"},{"upper":"黑色的"},{"upper":"浅棕色的"},{"upper":"沙棕色的"},{"upper":"金色的"},{"upper":"银色的"},{"upper":"棕色的"},{"upper":"赤褐色的"},{
               "upper":"黑色的",
               "under":"灰色的"
            },{
               "upper":"黑色的",
               "under":"棕色的"
            },{
               "upper":"黑色的",
               "under":"银色的"
            },{
               "upper":"黑色的",
               "under":"赤褐色的"
            },{
               "upper":"白色的",
               "under":"灰色的"
            },{
               "upper":"白色的",
               "under":"银色的"
            },{
               "upper":"白色的",
               "under":"金色的"
            }];
            outputText("[pg]你的[skindesc]开始刺痛，然后发痒。");
            get_player().skin.type = 1;
            get_player().skin.desc = "fur";
            get_player().setFurColor(OneOf_Impl_.fromB(_loc7_),3);
            outputText("你心不在焉地伸手去抓手臂，把手指拿开时，却发现了[furcolor]的毛发。你盯着它看。毛发。等等，你刚长出了毛发？！发生了什么？！你的大脑一片混乱，但你确信一件事：<b>你现在长毛了！</b>");
            set_changes(get_changes() + 1);
         }
         if(Utils.trueOnceInN(3) && get_player().ears.type != 18 && get_changes() < get_changeLimit())
         {
            if(get_player().ears.type == -1)
            {
               outputText("[pg]你的头上开始长出两个痛苦的凸起，它们生长并张开，变成了犬耳。");
            }
            if(get_player().ears.type == 0)
            {
               outputText("[pg]你脸颊两侧的皮肤被痛苦地拉扯着，你的耳朵向上移动，朝着头顶的方向。它们变形并拉长，变得像犬科动物一样。");
            }
            if(get_player().ears.type == 1)
            {
               outputText("[pg]你的马耳扭曲着，变成了犬科动物的耳朵。");
            }
            if(get_player().ears.type == 2)
            {
               outputText("[pg]你的狗耳变宽了，弯曲着，对周围的环境变得更加敏锐。");
            }
            if(get_player().ears.type > 18)
            {
               outputText("[pg]你的耳朵变形了，外观变得更像犬科动物。");
            }
            get_player().ears.type = 18;
            outputText("<b>你现在有了狼耳。</b>");
            set_changes(get_changes() + 1);
         }
         if(Utils.trueOnceInN(3) && get_changes() < get_changeLimit() && get_player().tail.type != 26)
         {
            if(get_player().tail.type == 0)
            {
               outputText("[pg]你的臀部感到一阵压力。你摸了摸衣服下面，发现了一个奇怪的、厚厚的肿块，似乎正在变大。几秒钟内，它穿过你的手指，撑破了你衣服的后摆，几乎长到了地上。一层浓密的毛发长出来，覆盖了你的新尾巴。");
            }
            if(get_player().tail.type == 1)
            {
               outputText("[pg]你感到臀部一阵紧绷，同时你尾巴上的毛发也紧紧地聚拢在一起。几秒钟内，它们融合成一条粗壮的尾巴，迅速长出浓密的毛发。");
            }
            if(get_player().tail.type == 3)
            {
               outputText("[pg]你尾巴的尖端感觉很奇怪。当你把它拉过来检查时，铲状的尖端消失了，很快被覆盖在整个尾巴表面的一层浓密的毛发所取代。你的尾巴也随之变粗了。");
            }
            if(get_player().tail.type >= 4)
            {
               outputText("[pg]你感觉到你的臀部在移动和改变，血肉塑造并移位成一条粗壮、毛茸茸的尾巴。");
            }
            set_changes(get_changes() + 1);
            get_player().tail.type = 26;
            outputText("<b>你现在有了一条狼尾巴！</b>");
         }
         if(get_player().hair.type != 0 && get_changes() < get_changeLimit() && Utils.trueOnceInN(3))
         {
            outputText("[pg]你伸出手摸了摸头顶，感觉它开始发麻。你把手放在头顶上，慢慢地向下拉。大块的[hair]跟着掉落，被一头正常的人类头发所取代。");
            get_player().hair.type = 0;
            set_changes(get_changes() + 1);
         }
         if(get_mutations().tfNoFur() && get_player().face.type != 24 && get_player().ears.type == 18 && get_player().tail.type == 26 && get_player().hasFur() && Utils.trueOnceInN(5) && get_changes() < get_changeLimit())
         {
            outputText("[pg]你痛苦地尖叫起来，你脸上的骨头开始重新排列。你的[skinFurScales]几乎从你身上融化，伴随着大量的鲜血滴落在地上。你双手捂住脸，痛苦地扭动着，当疼痛淹没你时，眼前一片漆黑。但疼痛来得快去得也快，你把颤抖的双手从脸上移开。你爬向最近的反光表面。<b>你有一张狼的脸！</b>");
            get_player().face.type = 24;
            set_changes(get_changes() + 1);
         }
         if(get_mutations().tfNoFur() && get_player().lowerBody.legCount == 2 && get_player().lowerBody.type != 26 && get_player().tail.type == 26 && get_player().skin.type == 1 && Utils.trueOnceInN(4) && get_changes() < get_changeLimit())
         {
            if(get_player().lowerBody.type == 0)
            {
               outputText("[pg]你跌跌撞撞地摔倒了，痛苦地嚎叫着，你的腿和脚断裂并重组成像狼一样的腿和爪子。最剧烈的疼痛最终过去了，但你仍然呜咽了一会儿。<b>你现在有了爪子！</b>");
            }
            else if(get_player().lowerBody.type == 1)
            {
               outputText("[pg]你感觉到你的蹄子突然裂开，长出五个独特的脚趾。当你的蹄子重塑成毛茸茸的爪子时，它们的肉变软了。<b>你现在有了爪子！</b>");
            }
            else
            {
               outputText("[pg]你的下半身突然被疼痛折磨，导致你痛苦地倒在地上。一旦疼痛过去，你发现你正站在长满毛的爪子上。<b>你现在有了爪子！</b>");
            }
            get_player().lowerBody.type = 26;
            set_changes(get_changes() + 1);
         }
         if(get_mutations().tfNoFur() && get_player().arms.type != 6 && get_player().skin.type == 1 && get_player().tail.type == 26 && Utils.trueOnceInN(4) && get_changes() < get_changeLimit())
         {
            outputText("[pg]你的手臂感到无力，无论你怎么做，你都无法鼓起力量举起或移动它们。这辣椒有类似药物的作用吗？坐在地上，你等待着无力感结束。当你这样做时，你意识到你手上的骨头正在改变，你手臂上的肌肉也是如此。它们很快就被一层粗糙的[if (hasFurryUnderBody) {[underBody.furColor]|[furColor]}]毛发覆盖，从肩膀一直到指尖。你的手掌曾经所在的地方长出了深色的肉垫，你的指甲变成了短爪，足够灵活，使攀爬和探索变得更容易。<b>你的手臂变得像狼一样，并配有相匹配的爪子！</b>");
            get_player().arms.setType(6,12);
            set_changes(get_changes() + 1);
         }
         if(get_player().eyes.type != 6 && get_player().face.type == 24 && Utils.trueOnceInN(4) && get_changes() < get_changeLimit())
         {
            outputText("[pg]当你的眼睛开始改变时，你感到脸上突然一阵剧痛。你闭上眼睛，感觉有什么湿润的东西滑过你的眼睑。你惊讶地跳了起来。那种感觉消失了，但现在远处的景色变得模糊，绿色似乎与黄色混合在一起。");
            outputText("[pg]你转向附近的反光表面进行调查。你的眼睛有巨大的琥珀色虹膜，并凹陷在你的脸上，隐藏了任何巩膜的迹象。黑色包围着它们，强调了你脸部的狼形。当你盯着你的倒影时，你眨了几下眼睛。<b>你现在有了狼眼！</b>你的周边视觉和夜视能力可能也提高了。");
            get_player().eyes.type = 6;
            set_changes(get_changes() + 1);
         }
         if(get_player().face.type == 24 && Utils.trueOnceInN(4) && get_changes() < get_changeLimit() && !get_player().hasPerk(PerkLib.Bloodhound))
         {
            outputText("[pg]一股强烈的气味突然袭来，让你暂时感到困惑。汗水、泥土、露水、皮革和钢铁的气味以你从未感受过的强度攻击着你的鼻孔。");
            outputText("[pg]你环顾四周寻找来源，但你没有发现任何异常。");
            outputText("[pg]你突然恍然大悟；这种气味一直都在，只是你的嗅觉不够敏锐罢了！");
            outputText("[pg]在习惯了这些新的感官体验后，一种气味在所有气味中脱颖而出：血腥味。尽管很微弱，但血腥味激发了你内心原始的狩猎本能。如果你能在战斗中触发这种本能，你绝对会成为一个可怕的对手！");
            get_player().createPerk(PerkLib.Bloodhound);
            outputText("[pg]<b>获得特质：寻血猎犬 - 对流血目标增加命中率、暴击率和移动几率。</b>");
            set_changes(get_changes() + 1);
         }
         if(get_player().neck.type != 0 && get_changes() < get_changeLimit() && Utils.trueOnceInN(4))
         {
            get_mutations().restoreNeck(_loc1_);
         }
         if(get_player().hasNonSharkRearBody() && get_changes() < get_changeLimit() && Utils.trueOnceInN(5))
         {
            get_mutations().restoreRearBody(_loc1_);
         }
         if(Utils.trueOnceInN(5))
         {
            get_mutations().updateOvipositionPerk(_loc1_);
         }
         if(Utils.trueOnceInN(3))
         {
            outputText(get_player().modTone(100,4));
         }
         if(Utils.trueOnceInN(3))
         {
            outputText(get_player().modThickness(75,3));
         }
         get_player().refillHunger(10);
         var _loc11_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc11_,2077,FlagDict_Impl_.arrayReadInt(_loc11_,2077) + get_changes());
         return false;
      }
   }
}

