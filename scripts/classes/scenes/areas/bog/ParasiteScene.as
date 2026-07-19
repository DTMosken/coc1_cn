package classes.scenes.areas.bog
{
   import classes.BaseContent;
   import classes.CoC;
   import classes.DynStat;
   import classes.PerkLib;
   import classes.Player;
   import classes.StatusEffects;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.scenes.Camp;
   import flash.Boot;
   
   public class ParasiteScene extends BaseContent
   {
      
      public function ParasiteScene()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
      }
      
      public function parasiteUpdate() : Boolean
      {
         var _loc1_:* = null as CoC;
         var _loc2_:* = null as Array;
         if(get_player().hasStatusEffect(StatusEffects.ParasiteSlugMatureDay))
         {
            get_player().addStatusValue(StatusEffects.ParasiteSlugMatureDay,1,-1);
         }
         if(get_player().statusEffectv1(StatusEffects.ParasiteSlug) > 0)
         {
            if(!get_player().hasCock())
            {
               outputText("没有了可以寄生的前列腺，你体内的寄生虫枯萎死亡了。希望你的身体能以某种方式吸收或排出它。[pg]");
               get_player().removeStatusEffect(StatusEffects.ParasiteSlug);
               return true;
            }
            get_player().addStatusValue(StatusEffects.ParasiteSlug,1,-1);
            if(get_player().statusEffectv1(StatusEffects.ParasiteSlug) <= 0)
            {
               get_player().removeStatusEffect(StatusEffects.ParasiteSlug);
               outputText("<b>这不应该发生，但我们还是遇到了。</b> 你可能使用的是旧存档。寄生虫已经消失了，再去弄一只吧！[pg]");
               return true;
            }
            if(get_player().statusEffectv1(StatusEffects.ParasiteSlug) == 60)
            {
               outputText("<b>你感到下体有一阵奇怪的刺痛。</b> 几分钟后它就消失了。[pg]");
               return true;
            }
            if(get_player().statusEffectv1(StatusEffects.ParasiteSlug) == 48)
            {
               outputText("<b>你的前列腺里持续不断地传来令人愉悦的蠕动感，让你感到困扰。</b> 你的");
               if(get_player().cockTotal() > 1)
               {
                  outputText("[cocks]不停地渗出先列腺液。[pg]");
               }
               else
               {
                  outputText(get_player().cockDescriptShort() + "不停地渗出先列腺液。[pg]");
               }
               outputText("先列腺液散发着淡淡的、有些甜美的气味，充满了你的鼻腔，只会加剧你的性唤起。你发现自己喘着粗气，轻声呻吟，因为你在走路时忍不住会有小高潮。无论你高潮多少次，这种感觉都不会消退，也不会变成痛苦。[pg]");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2645) == 0)
               {
                  if(get_player().cor <= 33)
                  {
                     outputText("你担心自己可能出了什么问题。[pg]");
                  }
                  if(get_player().cor > 33 && get_player().cor <= 66)
                  {
                     outputText("你担心自己的身体，但也对这种持续的快感感到有些兴奋。[pg]");
                  }
                  if(get_player().cor > 66)
                  {
                     outputText("你觉得自慰并享受这种增强的感觉可能是一个好主意。[pg]");
                  }
               }
               else
               {
                  outputText("你很确定你又被寄生虫感染了。[pg]");
               }
               _loc1_ = get_game();
               _loc2_ = [DynStat.Lust(2 + Utils.rand(5))];
               if(int(_loc2_.length) == 0)
               {
                  _loc1_.player.dynStats();
               }
               else if(int(_loc2_.length) == 1)
               {
                  _loc1_.player.dynStats(_loc2_[0]);
               }
               else if(int(_loc2_.length) == 2)
               {
                  _loc1_.player.dynStats(_loc2_[0],_loc2_[1]);
               }
               else if(int(_loc2_.length) == 3)
               {
                  _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2]);
               }
               else if(int(_loc2_.length) == 4)
               {
                  _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3]);
               }
               else if(int(_loc2_.length) == 5)
               {
                  _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4]);
               }
               else if(int(_loc2_.length) == 6)
               {
                  _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5]);
               }
               else if(int(_loc2_.length) == 7)
               {
                  _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6]);
               }
               else if(int(_loc2_.length) == 8)
               {
                  _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7]);
               }
               else if(int(_loc2_.length) == 9)
               {
                  _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8]);
               }
               else if(int(_loc2_.length) == 10)
               {
                  _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9]);
               }
               else if(int(_loc2_.length) == 11)
               {
                  _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9],_loc2_[10]);
               }
               else if(int(_loc2_.length) == 12)
               {
                  _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9],_loc2_[10],_loc2_[11]);
               }
               else if(int(_loc2_.length) == 13)
               {
                  _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9],_loc2_[10],_loc2_[11],_loc2_[12]);
               }
               else if(int(_loc2_.length) == 14)
               {
                  _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9],_loc2_[10],_loc2_[11],_loc2_[12],_loc2_[13]);
               }
               else if(int(_loc2_.length) == 15)
               {
                  _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9],_loc2_[10],_loc2_[11],_loc2_[12],_loc2_[13],_loc2_[14]);
               }
               else if(int(_loc2_.length) == 16)
               {
                  _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9],_loc2_[10],_loc2_[11],_loc2_[12],_loc2_[13],_loc2_[14],_loc2_[15]);
               }
               else if(int(_loc2_.length) == 17)
               {
                  _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9],_loc2_[10],_loc2_[11],_loc2_[12],_loc2_[13],_loc2_[14],_loc2_[15],_loc2_[16]);
               }
               else if(int(_loc2_.length) == 18)
               {
                  _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9],_loc2_[10],_loc2_[11],_loc2_[12],_loc2_[13],_loc2_[14],_loc2_[15],_loc2_[16],_loc2_[17]);
               }
               else if(int(_loc2_.length) == 19)
               {
                  _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9],_loc2_[10],_loc2_[11],_loc2_[12],_loc2_[13],_loc2_[14],_loc2_[15],_loc2_[16],_loc2_[17],_loc2_[18]);
               }
               else
               {
                  if(int(_loc2_.length) != 20)
                  {
                     throw "Too many rest arguments";
                  }
                  _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9],_loc2_[10],_loc2_[11],_loc2_[12],_loc2_[13],_loc2_[14],_loc2_[15],_loc2_[16],_loc2_[17],_loc2_[18],_loc2_[19]);
               }
               return true;
            }
            if(get_player().statusEffectv1(StatusEffects.ParasiteSlug) == 36)
            {
               outputText("<b>你不断受到从前列腺辐射出的快感和蠕动感的冲击。</b> 你腿部和臀部的每一次移动都会带来另一波感觉，让你暂时瘫痪，大脑一片空白。你坐在地上，臀部额外的压力只会让情况变得更糟。\n");
               if(get_player().cockTotal() > 1)
               {
                  outputText("你的[cocks]不断滴下先列腺液，数量超乎你的想象。[pg]");
               }
               else
               {
                  outputText("你的" + get_player().cockDescriptShort() + "不断滴下难以置信的先列腺液。[pg]");
               }
               outputText("[pg]气味变得更加浓烈，加上前列腺受到的刺激，你的意志崩溃了。你" + get_player().clothedOrNakedLower("脱下你的[armor]","伸手向下") + "，开始疯狂地自慰，先列腺液随着你的动作四处飞溅。");
               outputText("[pg]无论你撸动得多用力、多快，似乎都无法达到高潮。不断增强的快感几乎让你发疯，前列腺内燃烧的欲火让你产生了一个想法，绝望之下你立刻付诸行动。");
               outputText("[pg]你在手指上涂了点唾液，立刻将其插入你的[asshole]。你将手指向上勾起，开始挑逗你的前列腺。当你感觉到那个器官在震动和蠕动时，快感增强了十倍，但你仍然没有高潮。你又插入了一根手指，接着又是一根，很快你就开始疯狂地用拳头操自己，祈祷这场快感的噩梦能早点结束。");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2645) == 0)
               {
                  outputText("[pg]过了一会儿，高潮终于降临，但这与你以前经历过的任何一次都不同。你在地上扭动了感觉有几个小时，一波又一波连续的高潮向你袭来，精液不断地从你的" + get_player().cockDescript() + "中滴落，除了继续刺激前列腺，你完全无法进行任何理智的思考或身体动作。");
               }
               else
               {
                  outputText("[pg]过了一会儿，高潮终于降临，而你以前经历过这种感觉的事实只会让你更加享受它。不顾理智，你尽一切可能增强从前列腺散发出的压倒性快感。你用尽全力挤压前列腺，每一次动作都会让你的" + get_player().cockDescript() + "喷射出一股先列腺液。在快感的疯狂迷雾中，你尽可能多地舔舐它，在脸上涂抹一些以闻到更多那美妙的气味，并用一些来帮助润滑。你的[ass]在完全无意识的动作中收紧并吸入你的拳头，一波又一波的高潮向你袭来，让你呻吟得更大声，疯狂地挺动臀部，散布更多的先列腺液。你唯一能做出的协调动作就是挺动你的拳头，而你继续勤奋地这样做。");
               }
               outputText("[pg]几分钟后，你终于停止了高潮，重新控制了自己的身体。");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2645) == 0)
               {
                  outputText("当你注意到蠕动停止时，你感到一阵狂喜，但当你从地上爬起来后，它又开始了，你的心沉了下去。");
               }
               else
               {
                  outputText("蠕动如预期般再次开始。你忍不住有节奏地收紧腹股沟，以增强持续的快感，引发较小的高潮。");
                  if(get_player().cor < 60)
                  {
                     outputText("你的身体似乎背叛了你的意志，因为你对自己享受这种挑逗感到尴尬。");
                  }
                  else
                  {
                     outputText("你开始重新考虑最初移除寄生虫的决定。");
                  }
               }
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2645) == 0)
               {
                  if(get_player().cor <= 33)
                  {
                     outputText("[pg]你很害怕。到底发生了什么事？[pg]");
                  }
                  else if(get_player().cor <= 66)
                  {
                     outputText("[pg]你很害怕，但不可否认你以前从未感受过如此强烈的快感。[pg]");
                  }
                  else
                  {
                     outputText("[pg]你高兴地扭动着，期待着下一次达到这个临界点。[pg]");
                  }
               }
               else
               {
                  outputText("[pg]寄生虫似乎在生长。[pg]");
               }
               _loc1_ = get_game();
               _loc2_ = [DynStat.Lust(2 + Utils.rand(15))];
               if(int(_loc2_.length) == 0)
               {
                  _loc1_.player.dynStats();
               }
               else if(int(_loc2_.length) == 1)
               {
                  _loc1_.player.dynStats(_loc2_[0]);
               }
               else if(int(_loc2_.length) == 2)
               {
                  _loc1_.player.dynStats(_loc2_[0],_loc2_[1]);
               }
               else if(int(_loc2_.length) == 3)
               {
                  _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2]);
               }
               else if(int(_loc2_.length) == 4)
               {
                  _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3]);
               }
               else if(int(_loc2_.length) == 5)
               {
                  _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4]);
               }
               else if(int(_loc2_.length) == 6)
               {
                  _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5]);
               }
               else if(int(_loc2_.length) == 7)
               {
                  _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6]);
               }
               else if(int(_loc2_.length) == 8)
               {
                  _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7]);
               }
               else if(int(_loc2_.length) == 9)
               {
                  _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8]);
               }
               else if(int(_loc2_.length) == 10)
               {
                  _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9]);
               }
               else if(int(_loc2_.length) == 11)
               {
                  _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9],_loc2_[10]);
               }
               else if(int(_loc2_.length) == 12)
               {
                  _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9],_loc2_[10],_loc2_[11]);
               }
               else if(int(_loc2_.length) == 13)
               {
                  _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9],_loc2_[10],_loc2_[11],_loc2_[12]);
               }
               else if(int(_loc2_.length) == 14)
               {
                  _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9],_loc2_[10],_loc2_[11],_loc2_[12],_loc2_[13]);
               }
               else if(int(_loc2_.length) == 15)
               {
                  _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9],_loc2_[10],_loc2_[11],_loc2_[12],_loc2_[13],_loc2_[14]);
               }
               else if(int(_loc2_.length) == 16)
               {
                  _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9],_loc2_[10],_loc2_[11],_loc2_[12],_loc2_[13],_loc2_[14],_loc2_[15]);
               }
               else if(int(_loc2_.length) == 17)
               {
                  _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9],_loc2_[10],_loc2_[11],_loc2_[12],_loc2_[13],_loc2_[14],_loc2_[15],_loc2_[16]);
               }
               else if(int(_loc2_.length) == 18)
               {
                  _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9],_loc2_[10],_loc2_[11],_loc2_[12],_loc2_[13],_loc2_[14],_loc2_[15],_loc2_[16],_loc2_[17]);
               }
               else if(int(_loc2_.length) == 19)
               {
                  _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9],_loc2_[10],_loc2_[11],_loc2_[12],_loc2_[13],_loc2_[14],_loc2_[15],_loc2_[16],_loc2_[17],_loc2_[18]);
               }
               else
               {
                  if(int(_loc2_.length) != 20)
                  {
                     throw "Too many rest arguments";
                  }
                  _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9],_loc2_[10],_loc2_[11],_loc2_[12],_loc2_[13],_loc2_[14],_loc2_[15],_loc2_[16],_loc2_[17],_loc2_[18],_loc2_[19]);
               }
               return true;
            }
            if(get_player().statusEffectv1(StatusEffects.ParasiteSlug) == 24)
            {
               outputText("<b>你再也无法忍受前列腺内巨大的压力了。</b>每一次动作都会让快感传遍全身，蠕动每小时都在加剧，让你不停地呻吟和扭动。");
               outputText("[pg]你");
               if(get_player().cor <= 33)
               {
                  outputText("犹豫地" + get_player().clothedOrNakedLower("脱下你的[armor]","放下双手") + "，无奈地接受了一个事实：在解决这件事之前，你将无法集中注意力。");
               }
               if(get_player().cor > 33)
               {
                  outputText("急切地" + get_player().clothedOrNakedLower("脱下你的[armor]","放下双手") + "，几乎无法抑制此刻在你体内燃烧的欲望。");
               }
               outputText("[pg]你甚至没有尝试正常自慰，因为你知道这永远无法让你释放。你用一些丰富的先列腺液润滑你的手，开始操自己的屁股。");
               outputText("[pg]起初，你做得很温柔，但没过多久，你就又变成了一个没有思想的荡妇，不停地捣弄着自己的前列腺，流着口水，呻吟着，你的" + get_player().cockDescript() + "随着你拳头的每一次抽插喷射出先列腺液。很快，你的快感达到了顶峰，你开始多次高潮，大脑一片空白，身体因快感而抽搐。在几次高潮之后，你晕了过去。");
               outputText("[pg]当你恢复意识时，你闻到一股强烈的气味，让你头晕目眩，性爱的念头再次侵入你的脑海。那蠕动感，如果说有什么变化的话，那就是变得更强了，但你似乎正在习惯它。");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2645) == 0)
               {
                  if(get_player().cor <= 33)
                  {
                     outputText("[pg]你体内的压力和运动就是最好的证明；有什么东西活在你的前列腺里！你绝望地想知道接下来会发生什么。你该如何清除这个入侵者？[pg]");
                  }
                  else if(get_player().cor <= 66)
                  {
                     outputText("[pg]你体内的压力和运动就是最好的证明；有什么东西活在你的前列腺里！你很绝望，但你的一部分又在想，你是否应该尝试清除这个入侵者。[pg]");
                  }
                  else
                  {
                     outputText("[pg]你不确定自己是什么时候感染上寄生虫的，但你唯一的遗憾是，你没有更多的前列腺来容纳这些神奇的入侵者！[pg]");
                  }
               }
               else
               {
                  outputText("[pg]用不了多久，寄生虫就会完全成熟。");
                  if(get_player().cor <= 33)
                  {
                     outputText("在你不断遭受的多次高潮之间，你想知道你是如何让自己<b>再次</b>陷入这种境地的。[pg]");
                  }
                  else if(get_player().cor > 33 && get_player().cor < 66)
                  {
                     outputText("你觉得你本该比现在更担心，但从你下体散发出的热量极具说服力。[pg]");
                  }
                  else
                  {
                     outputText("你可能又被腐化的寄生虫感染了，但既然你处于这种境地，你还不如享受它。你微笑着，隔着你的[armor]漫不经心地摸索着你的[cock biggest]，并挤压你的[legs]，尽可能多地从入侵者那里榨取快感。[pg]");
                  }
               }
               _loc1_ = get_game();
               _loc2_ = [DynStat.Lust(2 + Utils.rand(30))];
               if(int(_loc2_.length) == 0)
               {
                  _loc1_.player.dynStats();
               }
               else if(int(_loc2_.length) == 1)
               {
                  _loc1_.player.dynStats(_loc2_[0]);
               }
               else if(int(_loc2_.length) == 2)
               {
                  _loc1_.player.dynStats(_loc2_[0],_loc2_[1]);
               }
               else if(int(_loc2_.length) == 3)
               {
                  _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2]);
               }
               else if(int(_loc2_.length) == 4)
               {
                  _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3]);
               }
               else if(int(_loc2_.length) == 5)
               {
                  _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4]);
               }
               else if(int(_loc2_.length) == 6)
               {
                  _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5]);
               }
               else if(int(_loc2_.length) == 7)
               {
                  _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6]);
               }
               else if(int(_loc2_.length) == 8)
               {
                  _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7]);
               }
               else if(int(_loc2_.length) == 9)
               {
                  _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8]);
               }
               else if(int(_loc2_.length) == 10)
               {
                  _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9]);
               }
               else if(int(_loc2_.length) == 11)
               {
                  _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9],_loc2_[10]);
               }
               else if(int(_loc2_.length) == 12)
               {
                  _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9],_loc2_[10],_loc2_[11]);
               }
               else if(int(_loc2_.length) == 13)
               {
                  _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9],_loc2_[10],_loc2_[11],_loc2_[12]);
               }
               else if(int(_loc2_.length) == 14)
               {
                  _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9],_loc2_[10],_loc2_[11],_loc2_[12],_loc2_[13]);
               }
               else if(int(_loc2_.length) == 15)
               {
                  _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9],_loc2_[10],_loc2_[11],_loc2_[12],_loc2_[13],_loc2_[14]);
               }
               else if(int(_loc2_.length) == 16)
               {
                  _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9],_loc2_[10],_loc2_[11],_loc2_[12],_loc2_[13],_loc2_[14],_loc2_[15]);
               }
               else if(int(_loc2_.length) == 17)
               {
                  _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9],_loc2_[10],_loc2_[11],_loc2_[12],_loc2_[13],_loc2_[14],_loc2_[15],_loc2_[16]);
               }
               else if(int(_loc2_.length) == 18)
               {
                  _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9],_loc2_[10],_loc2_[11],_loc2_[12],_loc2_[13],_loc2_[14],_loc2_[15],_loc2_[16],_loc2_[17]);
               }
               else if(int(_loc2_.length) == 19)
               {
                  _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9],_loc2_[10],_loc2_[11],_loc2_[12],_loc2_[13],_loc2_[14],_loc2_[15],_loc2_[16],_loc2_[17],_loc2_[18]);
               }
               else
               {
                  if(int(_loc2_.length) != 20)
                  {
                     throw "Too many rest arguments";
                  }
                  _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9],_loc2_[10],_loc2_[11],_loc2_[12],_loc2_[13],_loc2_[14],_loc2_[15],_loc2_[16],_loc2_[17],_loc2_[18],_loc2_[19]);
               }
               return true;
            }
            if(get_player().statusEffectv1(StatusEffects.ParasiteSlug) == 12)
            {
               outputText("<b>压力和快感达到了难以形容的程度，你被迫跪倒在地，脑子里除了欲望和释放的渴望什么都没有。</b>你" + get_player().clothedOrNakedLower("扯下你的[armor]","向前倾") + "，然后甚至还没碰到你的");
               if(get_player().cockTotal() > 1)
               {
                  outputText("[cocks]，");
               }
               else
               {
                  outputText(get_player().cockDescriptShort() + "，");
               }
               get_player().orgasm("Anal");
               outputText("就自发地射精了，当你射出一股又一股精液时，你颤抖着，仅仅是你前列腺里的震颤和蠕动就足以引发多次前列腺高潮。");
               outputText("[pg]你仰面躺下，在巨大的高潮中晕眩。分析着");
               if(get_player().cumQ() < 250)
               {
                  outputText("那滩精液");
               }
               if(get_player().cumQ() >= 250 && get_player().cumQ() < 1000)
               {
                  outputText("绝对是一团糟的精液");
               }
               if(get_player().cumQ() >= 1000)
               {
                  outputText("简直是精液湖");
               }
               outputText("你制造的，你注意到有什么东西在动。有一条小小的、箭头状的光滑蠕虫，正在拼命地蠕动。你觉得有必要把它带走，扔进附近的河里，它最终会流向沼泽。");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2645) == 0)
               {
                  outputText("也许你一开始就是在那儿感染的？");
               }
               else
               {
                  outputText("那绝对是你以前和现在感染的地方。");
               }
               outputText("[pg]事件发生几分钟后，刺痛感再次开始，但这一次，它变得更容易忍受了。看来你体内的寄生虫已经繁殖了，它仍然在你的前列腺里，以你的分泌物为食，同时迫使你的身体永远不停地产生精液。你必须学会应对这种持续的快感，或者找到一种方法将这种寄生虫从你的体内清除出去。");
               outputText("[pg]美味的气味在你身上萦绕了一会儿，你发现自己收集了一些先列腺液，只是为了拥有更多那种令人上瘾的气味。它太强烈了，甚至连敌人都会被它唤起性欲！\n");
               get_player().createPerk(PerkLib.ParasiteMusk,1,0,0,0);
               get_player().removeStatusEffect(StatusEffects.ParasiteSlug);
               outputText("<b>获得新特质：寄生麝香！</b>[pg]");
               get_player().createStatusEffect(StatusEffects.ParasiteSlugMatureDay,96,0,0,0);
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2645,1);
               _loc1_ = get_game();
               _loc2_ = [DynStat.Lust(2 + Utils.rand(30))];
               if(int(_loc2_.length) == 0)
               {
                  _loc1_.player.dynStats();
               }
               else if(int(_loc2_.length) == 1)
               {
                  _loc1_.player.dynStats(_loc2_[0]);
               }
               else if(int(_loc2_.length) == 2)
               {
                  _loc1_.player.dynStats(_loc2_[0],_loc2_[1]);
               }
               else if(int(_loc2_.length) == 3)
               {
                  _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2]);
               }
               else if(int(_loc2_.length) == 4)
               {
                  _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3]);
               }
               else if(int(_loc2_.length) == 5)
               {
                  _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4]);
               }
               else if(int(_loc2_.length) == 6)
               {
                  _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5]);
               }
               else if(int(_loc2_.length) == 7)
               {
                  _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6]);
               }
               else if(int(_loc2_.length) == 8)
               {
                  _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7]);
               }
               else if(int(_loc2_.length) == 9)
               {
                  _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8]);
               }
               else if(int(_loc2_.length) == 10)
               {
                  _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9]);
               }
               else if(int(_loc2_.length) == 11)
               {
                  _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9],_loc2_[10]);
               }
               else if(int(_loc2_.length) == 12)
               {
                  _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9],_loc2_[10],_loc2_[11]);
               }
               else if(int(_loc2_.length) == 13)
               {
                  _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9],_loc2_[10],_loc2_[11],_loc2_[12]);
               }
               else if(int(_loc2_.length) == 14)
               {
                  _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9],_loc2_[10],_loc2_[11],_loc2_[12],_loc2_[13]);
               }
               else if(int(_loc2_.length) == 15)
               {
                  _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9],_loc2_[10],_loc2_[11],_loc2_[12],_loc2_[13],_loc2_[14]);
               }
               else if(int(_loc2_.length) == 16)
               {
                  _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9],_loc2_[10],_loc2_[11],_loc2_[12],_loc2_[13],_loc2_[14],_loc2_[15]);
               }
               else if(int(_loc2_.length) == 17)
               {
                  _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9],_loc2_[10],_loc2_[11],_loc2_[12],_loc2_[13],_loc2_[14],_loc2_[15],_loc2_[16]);
               }
               else if(int(_loc2_.length) == 18)
               {
                  _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9],_loc2_[10],_loc2_[11],_loc2_[12],_loc2_[13],_loc2_[14],_loc2_[15],_loc2_[16],_loc2_[17]);
               }
               else if(int(_loc2_.length) == 19)
               {
                  _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9],_loc2_[10],_loc2_[11],_loc2_[12],_loc2_[13],_loc2_[14],_loc2_[15],_loc2_[16],_loc2_[17],_loc2_[18]);
               }
               else
               {
                  if(int(_loc2_.length) != 20)
                  {
                     throw "Too many rest arguments";
                  }
                  _loc1_.player.dynStats(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3],_loc2_[4],_loc2_[5],_loc2_[6],_loc2_[7],_loc2_[8],_loc2_[9],_loc2_[10],_loc2_[11],_loc2_[12],_loc2_[13],_loc2_[14],_loc2_[15],_loc2_[16],_loc2_[17],_loc2_[18],_loc2_[19]);
               }
               return true;
            }
         }
         if(get_player().findPerk(PerkLib.ParasiteMusk) > 0 && int(get_game().time.days % 5) == 0 && get_player().statusEffectv1(StatusEffects.ParasiteSlugMatureDay) <= 0 && !get_player().hasStatusEffect(StatusEffects.ParasiteSlugReproduction))
         {
            get_player().removeStatusEffect(StatusEffects.ParasiteSlugMatureDay);
            outputText("<b>你感觉到前列腺内寄生虫的活动加剧了。</b>");
            outputText("[pg]虽然你已经有些习惯了它产生的规律震动和蠕动，但这次完全不在一个级别，你发现自己再次被快感和情欲弄得浑身无力。看来它准备繁殖了，并且需要帮助来排出它的幼体。");
            outputText("[pg]你最初遭遇这个入侵者时留下的条件反射爆发了。你需要让你的前列腺被狠狠捣弄，让你的肛门被填满并蹂躏，直到达到多次令人神魂颠倒的高潮。除非你这么做，否则你不会满足，寄生虫也不会。");
            outputText("[pg]你的脑海中充满了性交的画面，你的" + get_player().cockDescript() + "开始跳动，渗出比以前更多的先列腺液。当然，这毫无意义。在这种状态下，普通的性交或自慰无法满足你。你<b>需要</b>被操屁股。");
            if(get_player().cor < 50)
            {
               outputText("这是你先列腺液中扭曲心智的信息素在作祟吗？你不敢相信你的身心竟然在渴望如此下贱的事情。[pg]");
            }
            else if(get_player().cor < 80)
            {
               outputText("这片土地显然对你造成了影响，因为你竟然对取悦寄生虫感到相当兴奋。它通过你的先列腺液排出的信息素确实起到了推波助澜的作用，但也许根本不需要它们。[pg]");
            }
            else
            {
               outputText("你迫不及待地想要开始了。无论你是屈服于某个拥有大鸡巴的种马，还是为了得到你想要的而支配他，性就是性，你在这里待得够久了，已经不在乎是什么形式了。[pg]");
            }
            get_player().createStatusEffect(StatusEffects.ParasiteSlugReproduction,2,0,0,0);
         }
         if(get_player().statusEffectv1(StatusEffects.ParasiteSlugReproduction) == 1 && int(get_game().time.hours % 5) == 0 && int(get_game().time.days % 5) == 1)
         {
            outputText("<b>你最近的壮举似乎产生了效果</b>。你的前列腺简直在颤抖，除了瘫倒在地呻吟着享受它带来的令人麻木的快感之外，你什么也做不了。");
            outputText("[pg]这一次，你甚至不需要在屁股里塞东西就能完成分娩过程。你以狗爬式趴在地上，头贴着地面，随着感觉的增强，你拼尽全力收紧腹股沟的肌肉。很快，你就不需要任何动作了，因为你的[asshole]每秒钟都在不由自主地收缩好几次。你被带回了那种熟悉的绝对极乐状态，一波又一波的高潮毫无停歇地冲击着你，你的" + get_player().cockDescript() + "一直漏着精液。");
            outputText("[pg]你能感觉到新出生的寄生虫慢慢爬出你的前列腺，穿过你的尿道，一种令人愉悦的酥痒感离开了你那如火焰般快感燃烧的前列腺。随着最后一次爆炸性的高潮袭来，你分辨这种感觉的能力迅速消退，你昏倒在地上，在射精时扭动着身体，这种感觉异常艰难，促使你用更大的力气去推挤。");
            outputText("[pg]当你醒来时，你感到一种强烈的、迫切的冲动，想要在");
            if(get_player().cumQ() < 250)
            {
               outputText("那滩精液");
            }
            else if(get_player().cumQ() < 1000)
            {
               outputText("那片狼藉的精液");
            }
            else
            {
               outputText("那片精液湖");
            }
            outputText("中寻找刚出生的寄生虫。找到它后，你把它扔进河里，希望它能活下来，找到一个像你一样的宿主。你并没有意识到这种情况有多么堕落，事后你得到的只有一种履行了职责的愉悦感。[pg]");
            if(get_player().cor < 60)
            {
               outputText("你重新思考了刚才的想法，摇了摇头。信息素真的在扭曲你的心智！[pg]");
            }
            get_player().removeStatusEffect(StatusEffects.ParasiteSlugReproduction);
         }
         if(!get_player().hasCock() && get_player().findPerk(PerkLib.ParasiteMusk) > 0)
         {
            outputText("没有了可以寄生的前列腺，你体内的寄生虫枯萎死亡了。希望你的身体能以某种方式吸收或排出它。[pg]");
            get_player().removePerk(PerkLib.ParasiteMusk);
            get_player().removeStatusEffect(StatusEffects.ParasiteSlugReproduction);
            get_player().removeStatusEffect(StatusEffects.ParasiteSlug);
            return true;
         }
         return false;
      }
      
      public function findParasite() : void
      {
         clearOutput();
         outputText("在茂密的沼泽中漫步，你发现自己必须穿过齐腰深的水才能继续探索。你环顾四周寻找任何潜在的威胁，因为在半身浸在水中的情况下战斗将极其危险。");
         outputText("[pg]在确认附近没有严重威胁后，你涉入浑浊、令人作呕的水中。小虫子飞来飞去，甚至飞进你的嘴里，迫使你不断地吐口水。这与英格纳姆清澈的田野相去甚远，当乡愁袭来时，这种不舒服的处境变得更加糟糕。尽管如此，你还是继续前进，决心未减。");
         outputText("[pg]尽管有昆虫和难闻的气味，这趟旅程还是简单快捷的。你试着把湿透的装备上的水挤干，同时检查在穿越沼泽时是否丢失了任何装备。");
         outputText("[pg]当你准备离开时，你感觉有什么东西在挠你的腹股沟。");
         if(get_player().hasCock())
         {
            if(get_player().hasPerk(PerkLib.ParasiteMusk))
            {
               outputText("你迅速脱下你的[armor]来分析情况，但你已经知道你会遇到什么了。");
               outputText("[pg]不出所料，你发现一条蠕虫试图钻进你的尿道，就像你之前射出的那条一样。如果你对寄生虫的来源有任何怀疑，现在也烟消云散了。");
               outputText("[pg]你试图把寄生虫弹开，但在你这么做之前，它就主动从你身上滑落了，显然是因为它的目标已经被感染而感到烦躁。");
            }
            else if(!get_player().hasStatusEffect(StatusEffects.Infested))
            {
               outputText("你迅速脱下你的[armor]来分析情况，当你看着你的" + get_player().cockDescript() + "时，你惊恐地发现有什么东西试图钻进你的尿道！");
               outputText("[pg]你反应迅速，抓住那只正在钻洞的昆虫剩下的一小截尾巴，用力一拉，只伴随着轻微的疼痛就将入侵者拔了出来。你看着那只扭动着的、蓝色的、箭头状的寄生虫，");
               if(get_player().cor < 60)
               {
                  outputText("既惊恐又庆幸自己能在它完全钻进去之前抓住它。");
               }
               else
               {
                  outputText("对体内有寄生虫的想法感到有点兴奋。");
               }
               outputText("[pg]你把它扔得远远的，并想知道如果这只寄生虫在你因为与这个地区一些更强大的生物战斗而昏迷时发现你，会发生什么。");
            }
            else
            {
               outputText("你想知道你体内的蠕虫是否因为某种原因在作怪。你脱下你的[armor]并分析你的" + get_player().cockDescript() + "。你注意到有什么东西试图钻进你的尿道。由于你的状况，这是很正常的景象，但这只蠕虫不同，它是蓝色的，光滑的，没有环。你伸出手去拉它，但这没有必要。你阴茎里已经存在的蠕虫强行将这个潜在的入侵者排出，可怜的小东西从你身上滑落，掉进了水里。看来他得找另一具身体来寄生了。[pg]");
               outputText("我想蠕虫在某种程度上保护了你，但你不确定如果它们不在那里这样做会发生什么。");
            }
         }
         else
         {
            outputText("你迅速脱下你的[armor]来分析情况，却发现一只困惑的蠕虫在你的腹股沟上寻找着什么。你伸出手想把它弹开，但这没有必要；它主动从你身上滑落，消失在灌木丛中。");
            outputText("[pg]我想情况可能会更糟。");
         }
         get_player().createStatusEffect(StatusEffects.ParasiteSlugMet,1,0,0,0);
         doNext(get_camp().returnToCampUseOneHour);
      }
   }
}

