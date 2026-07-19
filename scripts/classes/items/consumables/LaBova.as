package classes.items.consumables
{
   import classes.BreastRow;
   import classes.Cock;
   import classes.DynStat;
   import classes.PerkLib;
   import classes.Player;
   import classes.StatusEffects;
   import classes.Vagina;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.items.Consumable;
   import classes.items.Mutations;
   import flash.Boot;
   import haxe.IMap;
   
   public class LaBova extends Consumable
   {
      
      public static var STANDARD:int = 0;
      
      public static var ENHANCED:int = 1;
      
      public static var PURIFIED:int = 2;
      
      public var tainted:Boolean;
      
      public var enhanced:Boolean;
      
      public function LaBova(param1:int = 0)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         enhanced = false;
         tainted = false;
         var _loc2_:String = null;
         var _loc3_:String = null;
         var _loc4_:String = null;
         var _loc5_:String = null;
         var _loc6_:int = 0;
         switch(param1)
         {
            case 0:
               _loc2_ = "LaBova";
               _loc3_ = "LaBova";
               _loc4_ = "a bottle containing a misty fluid labeled \"LaBova\"";
               _loc5_ = "一个装着雾状液体的瓶子，液体带有颗粒感，瓶颈细长，底部呈球形。标签上画着一个身材丰满的牛娘，正在给两个自慰的男人喂奶。";
               _loc6_ = 6;
               tainted = true;
               enhanced = false;
               break;
            case 1:
               _loc2_ = "ProBova";
               _loc3_ = "ProBova";
               _loc4_ = "a bottle containing a misty fluid labeled \"ProBova\"";
               _loc5_ = "一个装着雾状液体的瓶子，液体带有颗粒感，瓶颈细长，底部呈球形。标签上画着一个身材丰满的牛娘，正在给两个自慰的男人喂奶。它经过露米的强化，增强了变身药剂的效力。";
               _loc6_ = 6;
               tainted = true;
               enhanced = true;
               break;
            case 2:
               _loc2_ = "P.LBova";
               _loc3_ = "P. LaBova";
               _loc4_ = "a bottle containing a white fluid labeled \"Pure LaBova\"";
               _loc5_ = "一个装着雾状液体的瓶子，液体带有颗粒感；瓶颈细长，底部呈球形。标签上画着一个身材丰满的牛娘，正在给两个自慰的男人喂奶。拉萨祖尔已经将其净化，去除了它的腐化特性，并抑制了一些变身效果。";
               _loc6_ = 6;
               tainted = false;
               enhanced = false;
         }
         super(_loc2_,_loc3_,_loc4_,_loc6_,_loc5_);
         addTags("Transformative","Fluid");
      }
      
      override public function useItem() : Boolean
      {
         return applyEffect(get_player());
      }
      
      public function applyEffect(param1:Player) : Boolean
      {
         var _loc2_:String = "laBova";
         param1.slimeFeed();
         var _loc3_:int = enhanced ? 3 : 1;
         get_mutations().initTransformation([2,3,3],_loc3_);
         var _loc4_:Number = 0;
         var _loc5_:Number = 0;
         var _loc6_:Number = 0;
         outputText("你喝下了");
         if(enhanced)
         {
            outputText("超级牛奶");
         }
         else
         {
            outputText("拉·博娃");
         }
         outputText("。这饮料的口感很奇怪，但非常甜。它有一丝牛奶的余味。");
         if(get_changes() < get_changeLimit() && Utils.rand(3) == 0)
         {
            _loc4_ = 60 - param1.get_str();
            if(_loc4_ <= 0)
            {
               _loc4_ = 0;
            }
            else
            {
               if(Utils.rand(2) == 0)
               {
                  outputText("[pg]当你感觉到肌肉有些移位时，会有轻微的疼痛。它们的外观没有太大变化，但你感觉强壮多了。");
               }
               else
               {
                  outputText("[pg]你感觉到你的肌肉收紧并变得稍微明显了一些。");
               }
               dynStats(DynStat.Str(_loc4_ / 10));
            }
         }
         if(get_changes() < get_changeLimit() && Utils.rand(3) == 0)
         {
            _loc4_ = 60 - param1.get_tou();
            if(_loc4_ <= 0)
            {
               _loc4_ = 0;
            }
            else
            {
               if(Utils.rand(2) == 0)
               {
                  outputText("[pg]你感觉你的内脏变得更坚韧了；感觉你几乎可以承受任何打击。");
               }
               else
               {
                  outputText("[pg]你的骨骼和关节感到一阵酸痛，不久你意识到它们变得更耐用了。");
               }
               dynStats(DynStat.Tou(_loc4_ / 10));
            }
         }
         if(get_changes() < get_changeLimit() && Utils.rand(3) == 0)
         {
            if(param1.get_spe100() > 30)
            {
               outputText("[pg]你增加的体重让你的动作变得更加迟缓。");
               _loc4_ = (param1.get_spe() - 30) / 10;
               dynStats(DynStat.Spe(-_loc4_));
            }
         }
         if(tainted)
         {
            _loc4_ = 50 - param1.cor;
            if(_loc4_ < 0)
            {
               _loc4_ = 0;
            }
            dynStats(DynStat.Cor(_loc4_ / 10));
         }
         if(int(param1.cocks.length) > 0 && Utils.rand(2) == 0 && !get_hyper())
         {
            outputText("[pg]");
            _loc4_ = 0;
            _loc5_ = int(param1.cocks.length);
            _loc6_ = 0;
            while(_loc5_ > 0)
            {
               _loc5_--;
               if(param1.cocks[int(_loc4_)].cockLength <= param1.cocks[int(_loc5_)].cockLength)
               {
                  _loc4_ = _loc5_;
               }
            }
            if(param1.cocks[int(_loc4_)].cockLength < 6 && param1.cocks[int(_loc4_)].cockLength >= 2.9)
            {
               _temp_1.cockLength -= 0.5;
               _loc6_ -= 0.5;
            }
            _loc6_ += param1.increaseCock(int(_loc4_),(Utils.rand(3) + 1) * -1);
            param1.lengthChange(_loc6_,1);
            if(param1.cocks[int(_loc4_)].cockLength < 2)
            {
               outputText("");
               if(param1.cockTotal() == 1 && !param1.hasVagina())
               {
                  outputText("你的[cock]突然开始发麻。这是一种熟悉的感觉，类似于高潮。然而，这种感觉似乎是从上往下开始的，而不是从你的下半身涌上来。你僵在原地几秒钟，感受着这种奇怪的感觉，突然感觉好像你自己的身体开始吸吮你的阴茎根部。几乎在瞬间，你的肉棒伴随着湿润的吸溜声陷入了你的胯部。在下降的过程中，龟头卡在了你身体的前面，但你的龟头很快就失去了所有的体积，变成了一个闪亮的新阴蒂。");
                  if(param1.balls > 0)
                  {
                     outputText("同时，你的[balls]也遭遇了同样的感觉；被你的胯部急切地整个吞下。");
                  }
                  outputText("出于好奇，你在下面摸索，发现你没有任何外部器官了。所有这些都被吞噬进了你现在在两个肉褶之间的一条裂缝中，就像敏感的嘴唇一样。你突然意识到；<b>你现在有了一个阴道！</b>");
                  param1.balls = 0;
                  param1.ballSize = 1;
                  param1.createVagina();
                  param1.setClitLength(0.25);
                  param1.removeCock(0,1);
               }
               else
               {
                  param1.killCocks(1);
               }
            }
            if(int(param1.cocks.length) == 0 && !param1.hasVagina())
            {
               param1.createVagina();
               param1.vaginas[0].vaginalLooseness = 0;
               param1.vaginas[0].vaginalWetness = 1;
               param1.vaginas[0].virgin = true;
               param1.setClitLength(0.25);
               outputText("[pg]你的胯部开始发痒，并垂直蔓延。你伸手向下摸，发现了一个开口。你长出了一个<b>新的" + param1.vaginaDescript(0) + "</b>！");
               set_changes(get_changes() + 1);
               dynStats(DynStat.Lust(10));
            }
         }
         var _loc7_:Boolean = false;
         if((tainted && param1.biggestTitSize() <= 11 || !tainted && param1.biggestTitSize() <= 5) && get_changes() < get_changeLimit() && (Utils.rand(3) == 0 || enhanced))
         {
            if(Utils.rand(2) == 0)
            {
               outputText("[pg]你的[breasts]刺痛了一会儿，然后变大了。");
            }
            else
            {
               outputText("[pg]你感觉胸部增加了一点重量，因为你的[breasts]似乎膨胀并固定在更大的尺寸上。");
            }
            param1.growTits(1 + Utils.rand(3),1,false,3);
            set_changes(get_changes() + 1);
            dynStats(DynStat.Sens(0.5));
            _loc7_ = true;
         }
         get_mutations().removeFeatheryHair();
         if(param1.biggestTitSize() >= 4 && param1.breastRows[0].lactationMultiplier < 1 && get_changes() < get_changeLimit() && (Utils.rand(3) == 0 || _loc7_ || enhanced))
         {
            outputText("[pg]你喘着粗气，因为你的" + param1.breastDescript(0) + "感觉像是被什么东西填满了。片刻之后，一滴乳汁从你的[breasts]中漏出；<b>你现在开始泌乳了</b>。");
            param1.breastRows[0].lactationMultiplier = 1.25;
            set_changes(get_changes() + 1);
            dynStats(DynStat.Sens(0.5));
         }
         if(enhanced)
         {
            if(param1.breastRows[0].nipplesPerBreast == 1)
            {
               set_changes(get_changes() + 1);
               param1.breastRows[0].nipplesPerBreast = 4;
               outputText("[pg]你的[nipples]发麻发痒。你拉开你的[armor]，震惊地看着它们分裂成四个不同的乳头！<b>你现在胸部两侧各有四个乳头了！</b>");
               if(int(param1.breastRows.length) >= 2 && param1.breastRows[1].nipplesPerBreast == 1)
               {
                  outputText("片刻之后，你第二排的" + param1.breastDescript(1) + "也发生了同样的变化。<b>你现在有十六个乳头了！</b>");
                  param1.breastRows[1].nipplesPerBreast = 4;
               }
               if(int(param1.breastRows.length) >= 3 && param1.breastRows[2].nipplesPerBreast == 1)
               {
                  outputText("最后，你的");
                  if(param1.bRows() == 3)
                  {
                     outputText("第三排" + param1.breastDescript(2) + "也和它的姐妹们一起突变，长出了一大片乳头。");
                  }
                  else if(param1.bRows() >= 4)
                  {
                     outputText("从第三排往下的一切都发生了突变，长出了一大片乳头。");
                     param1.breastRows[3].nipplesPerBreast = 4;
                     if(param1.bRows() >= 5)
                     {
                        param1.breastRows[4].nipplesPerBreast = 4;
                     }
                     if(param1.bRows() >= 6)
                     {
                        param1.breastRows[5].nipplesPerBreast = 4;
                     }
                     if(param1.bRows() >= 7)
                     {
                        param1.breastRows[6].nipplesPerBreast = 4;
                     }
                     if(param1.bRows() >= 8)
                     {
                        param1.breastRows[7].nipplesPerBreast = 4;
                     }
                     if(param1.bRows() >= 9)
                     {
                        param1.breastRows[8].nipplesPerBreast = 4;
                     }
                  }
                  param1.breastRows[2].nipplesPerBreast = 4;
                  outputText("<b>你总共有" + Utils.num2Text(param1.totalNipples()) + "个乳头。</b>");
               }
            }
            else if(int(param1.breastRows.length) > 1 && param1.breastRows[1].nipplesPerBreast == 1)
            {
               if(param1.breastRows[1].nipplesPerBreast == 1)
               {
                  outputText("[pg]你第二排的" + param1.breastDescript(1) + "感到一阵刺痛和瘙痒。你拉开你的[armor]，震惊地看着你的" + param1.nippleDescript(1) + "分裂成四个独立的乳头！<b>你现在第二排的每个乳房上都有四个乳头了</b>。");
                  param1.breastRows[1].nipplesPerBreast = 4;
               }
            }
            else if(int(param1.breastRows.length) > 2 && param1.breastRows[2].nipplesPerBreast == 1)
            {
               if(param1.breastRows[2].nipplesPerBreast == 1)
               {
                  outputText("[pg]你第三排的" + param1.breastDescript(2) + "感到一阵刺痛和瘙痒。你拉开你的[armor]，震惊地看着你的" + param1.nippleDescript(2) + "分裂成四个独立的乳头！<b>你现在第三排的每个乳房上都有四个乳头了</b>。");
                  param1.breastRows[2].nipplesPerBreast = 4;
               }
            }
            else if(int(param1.breastRows.length) > 3 && param1.breastRows[3].nipplesPerBreast == 1)
            {
               if(param1.breastRows[3].nipplesPerBreast == 1)
               {
                  outputText("[pg]你第四排的" + param1.breastDescript(3) + "感到一阵刺痛和瘙痒。你拉开你的[armor]，震惊地看着你的" + param1.nippleDescript(3) + "分裂成四个独立的乳头！<b>你现在第四排的每个乳房上都有四个乳头了</b>。");
                  param1.breastRows[3].nipplesPerBreast = 4;
               }
            }
            else if(param1.biggestLactation() > 1)
            {
               if(Utils.rand(2) == 0)
               {
                  outputText("[pg]一阵快感穿过你的胸膛，你的[breasts]因为产奶量的大幅增加而开始漏奶。");
               }
               else
               {
                  outputText("[pg]你的[breasts]里有什么东西在发生变化，它们感觉更加饱满和成熟了。你知道你已经开始分泌更多的乳汁了。");
               }
               param1.boostLactation(2.5);
               if(param1.nippleLength < 1.5 && tainted || !tainted && param1.nippleLength < 1)
               {
                  outputText("你的[nipples]肿胀起来，变得更大，以适应增加的乳汁流量。");
                  param1.nippleLength += 0.25;
                  dynStats(DynStat.Sens(0.5));
               }
               set_changes(get_changes() + 1);
            }
         }
         else
         {
            if(tainted && param1.breastRows[0].lactationMultiplier > 1 && param1.breastRows[0].lactationMultiplier < 5 && get_changes() < get_changeLimit() && (Utils.rand(3) == 0 || enhanced))
            {
               if(Utils.rand(2) == 0)
               {
                  outputText("[pg]一阵快感穿过你的胸膛，你的[breasts]开始分泌更多的乳汁。");
               }
               else
               {
                  outputText("[pg]你的[breasts]里有什么东西在发生变化，它们感觉更加饱满和成熟了。你知道你已经开始分泌更多的乳汁了。");
               }
               param1.boostLactation(0.75);
               if(param1.nippleLength < 1.5 && tainted || !tainted && param1.nippleLength < 1)
               {
                  outputText("你的[nipples]肿胀起来，变得更大，以适应增加的乳汁流量。");
                  param1.nippleLength += 0.25;
                  dynStats(DynStat.Sens(0.5));
               }
               set_changes(get_changes() + 1);
            }
            if(!tainted)
            {
               if(param1.breastRows[0].lactationMultiplier > 1 && param1.breastRows[0].lactationMultiplier < 3.2 && get_changes() < get_changeLimit() && Utils.rand(3) == 0)
               {
                  if(Utils.rand(2) == 0)
                  {
                     outputText("[pg]一阵快感穿过你的胸膛，你的[breasts]开始分泌更多的乳汁。");
                  }
                  else
                  {
                     outputText("[pg]你的[breasts]里有什么东西在发生变化，它们感觉更加饱满和成熟了。你知道你已经开始分泌更多的乳汁了。");
                  }
                  param1.boostLactation(0.75);
                  if(param1.nippleLength < 1.5 && tainted || !tainted && param1.nippleLength < 1)
                  {
                     outputText("你的[nipples]肿胀起来，变得更大，以适应增加的乳汁流量。");
                     param1.nippleLength += 0.25;
                     dynStats(DynStat.Sens(0.5));
                  }
                  set_changes(get_changes() + 1);
               }
               if(param1.breastRows[0].lactationMultiplier > 2 && param1.hasStatusEffect(StatusEffects.Feeder) || param1.breastRows[0].lactationMultiplier > 5)
               {
                  if(Utils.rand(2) == 0)
                  {
                     outputText("[pg]你的乳房突然感觉不那么饱满了，看来你的泌乳量不如以前了。");
                  }
                  else
                  {
                     outputText("[pg]你的乳房内部突然感到肿胀。一股乳汁从里面喷射而出，随后它们恢复到了更自然的泌乳水平。");
                  }
                  set_changes(get_changes() + 1);
                  dynStats(DynStat.Sens(0.5));
                  param1.boostLactation(-1);
               }
            }
         }
         if(!param1.hasStatusEffect(StatusEffects.Feeder) && param1.biggestLactation() >= 3 && Utils.rand(2) == 0 && param1.biggestTitSize() >= 5 && param1.isCorruptEnough(35))
         {
            outputText("[pg]你开始感到一种奇怪的渴望，想要把你的乳汁喂给其他生物。不知为何，你知道这会非常令人满足。");
            outputText("[pg]<b>(你获得了“喂食者”特质！)</b>");
            param1.createStatusEffect(StatusEffects.Feeder,0,0,0,0);
            param1.createPerk(PerkLib.Feeder,0,0,0,0);
            set_changes(get_changes() + 1);
         }
         if(param1.hasVagina())
         {
            if(param1.vaginas[0].vaginalLooseness < 2 && get_changes() < get_changeLimit() && Utils.rand(2) == 0 && !param1.hasPerk(PerkLib.FerasBoonMilkingTwat))
            {
               outputText("[pg]你感到腹股沟处传来一阵放松的感觉。进一步检查后，你发现你的" + param1.vaginaDescript(0) + "不知怎么的放松了，永久性地变松了。");
               _temp_2.vaginalLooseness += 1;
               param1.vaginas[0].resetRecoveryProgress();
               _temp_3.vaginalLooseness += 1;
               set_changes(get_changes() + 1);
               dynStats(DynStat.Lust(10));
            }
         }
         if(param1.neck.type != 0 && get_changes() < get_changeLimit() && Utils.rand(4) == 0)
         {
            get_mutations().restoreNeck(_loc2_);
         }
         if(param1.hasNonSharkRearBody() && get_changes() < get_changeLimit() && Utils.rand(5) == 0)
         {
            get_mutations().restoreRearBody(_loc2_);
         }
         if(tainted && Utils.rand(5) == 0)
         {
            get_mutations().updateOvipositionPerk(_loc2_);
         }
         if(tainted && param1.tail.type != 4 && get_changes() < get_changeLimit() && Utils.rand(3) == 0)
         {
            if(param1.tail.type == 0)
            {
               outputText("[pg]你感觉到[ass]上方的血肉在打结生长。它扭曲蠕动着，然后笔直地垂下来，现在变成了明显的牛尾形状。你长出了一条<b>牛尾巴</b>。");
            }
            else
            {
               if(param1.tail.type < 5 || param1.tail.type > 6)
               {
                  outputText("[pg]你的尾巴不舒服地聚拢在一起，扭曲蠕动着，然后笔直地垂下来，现在变成了明显的牛尾形状。[b:你现在有一条牛尾巴了]。");
               }
               if(param1.tail.type == 5 || param1.tail.type == 6)
               {
                  outputText("[pg]你那昆虫般的腹部传来一阵令人愉悦的刺痛感，它开始缩小变软，几丁质发生变移和重塑，直到它看起来完全像一条<b>牛尾巴</b>。");
               }
            }
            param1.tail.type = 4;
            set_changes(get_changes() + 1);
         }
         if(tainted && param1.ears.type != 3 && get_changes() < get_changeLimit() && Utils.rand(4) == 0 && param1.tail.type == 4)
         {
            outputText("[pg]你感觉到耳朵在头皮上拉扯，形状发生了改变，变成了长圆形的牛耳。<b>你现在有牛耳朵了。</b>");
            param1.ears.type = 3;
            set_changes(get_changes() + 1);
         }
         if((enhanced && param1.get_tallness() < 96 || param1.get_tallness() < 84) && get_changes() < get_changeLimit() && Utils.rand(2) == 0)
         {
            _loc4_ = Utils.rand(5) + 3;
            if(param1.get_tallness() > 74)
            {
               _loc4_ = Math.floor(_loc4_ / 2);
            }
            if(_loc4_ == 0)
            {
               _loc4_ = 1;
            }
            if(_loc4_ < 5)
            {
               outputText("[pg]你不安地挪动着身体，意识到自己失去了平衡。低头一看，你发现自己长高了[i:一点]。");
            }
            if(_loc4_ >= 5 && _loc4_ < 7)
            {
               outputText("[pg]你感到头晕目眩，有些不适，但很快意识到这是因为身高突然增加所致。");
            }
            if(_loc4_ == 7)
            {
               outputText("[pg]你踉跄着向前走去，头晕目眩地捂住脑袋。你花了一会儿时间才恢复平衡，站起身来，感觉明显长高了。");
            }
            param1.set_tallness(param1.get_tallness() + _loc4_);
            set_changes(get_changes() + 1);
         }
         if(tainted && param1.lowerBody.type != 1 && param1.ears.type == 3)
         {
            if(get_changes() < get_changeLimit() && Utils.rand(3) == 0)
            {
               set_changes(get_changes() + 1);
               if(param1.lowerBody.type == 0)
               {
                  outputText("[pg]你的脚发生了变化，蜷缩成痛苦、愤怒的肉块，你踉跄了一下。它们变得越来越紧，越来越硬，直到最后凝固成蹄子！");
               }
               else if(param1.lowerBody.type == 2)
               {
                  outputText("[pg]你的爪子发生了变化，蜷缩成痛苦、愤怒的肉块，你踉跄了一下。它们变得越来越紧，越来越硬，直到最后凝固成蹄子！");
               }
               else if(param1.hasTailInsteadOfLegs())
               {
                  outputText("[pg]你那蜿蜒的[if (isNaga) {蛇}]尾撕裂成两半，变成了双腿，你瘫倒在地。剧痛无比，尤其是你的新脚向内卷曲并变成蹄子的时候！");
               }
               else if(param1.lowerBody.type > 3)
               {
                  outputText("[pg]你的[feet]发生了变化，蜷缩成痛苦、愤怒的肉块，你踉跄了一下。它们变得越来越紧，越来越硬，直到最后凝固成蹄子！");
               }
               outputText("一层野兽般的皮毛在你的腰部以下长出，在长满的过程中令人发痒。<b> 你现在的脚变成了蹄子！</b>");
               param1.lowerBody.type = 1;
               param1.lowerBody.legCount = 2;
               dynStats(DynStat.Cor(0));
               set_changes(get_changes() + 1);
            }
         }
         if(!enhanced && param1.lowerBody.type == 1 && param1.face.type != 0 && get_changes() < get_changeLimit() && Utils.rand(4) == 0)
         {
            outputText("[pg]你的面容痛苦地扭曲着，恢复了正常的人类形状。<b>你的脸又变回人类了！</b>");
            param1.face.type = 0;
            set_changes(get_changes() + 1);
         }
         if(get_mutations().tfNoFur() && enhanced && (param1.skin.desc != "fur" || param1.skin.furColor != "black and white spotted"))
         {
            if(param1.skin.desc != "fur")
            {
               outputText("[pg]你的[skindesc]奇痒无比。你抓了又抓，但无济于事。手指间长出了皮毛，你张大嘴巴看着它长满全身。皮毛是黑白相间的图案，就像牛一样。它的颜色甚至蔓延到了你的头发上！<b>你长出了牛毛！</b>");
            }
            else
            {
               outputText("[pg]一阵涟漪穿过你的皮毛，有些斑块变暗，有些变亮。过了一会儿，你身上留下了黑白相间的斑点图案，一直延伸到你头上的头发！<b>你长出了牛毛！</b>");
            }
            param1.skin.desc = "fur";
            param1.skin.adj = "";
            param1.skin.type = 1;
            param1.hair.color = "black and white spotted";
            param1.skin.furColor = param1.hair.color;
            param1.underBody.restore();
         }
         else if(get_mutations().tfNoFur() && enhanced && param1.face.type != 3)
         {
            outputText("[pg]你的面容痛苦地扭曲着，骨骼被塑造成新的形状，发出噼啪的响声。完成后，你伸手去摸，发现<b>你的脸变得像牛一样！</b>");
            param1.face.type = 3;
            set_changes(get_changes() + 1);
         }
         if(tainted && get_changes() < get_changeLimit() && Utils.rand(3) == 0 && param1.face.type == 0)
         {
            if(param1.horns.type == 2 || param1.horns.type == 0)
            {
               if(param1.horns.type == 2)
               {
                  if(param1.horns.value < 5)
                  {
                     outputText("[pg]你的小角变大了一点，停留在中等大小的凸起。");
                     _temp_4.value += 1 + Utils.rand(2);
                     set_changes(get_changes() + 1);
                  }
               }
               if(param1.horns.type == 0 || param1.horns.value == 0)
               {
                  outputText("[pg]伴随着痛苦的压力，你额头上的皮肤裂开，长出两个小小的凸起状的角，就像你在家乡看到的牛一样。");
                  param1.horns.type = 2;
                  param1.horns.value = 1;
                  set_changes(get_changes() + 1);
               }
               if(param1.horns.type != 0 && param1.horns.type != 2 && param1.horns.value > 0)
               {
                  outputText("[pg]你的角扭曲起来，让你的头骨瞬间充满了难以忍受的剧痛，它们变成了牛角。");
                  param1.horns.type = 2;
               }
            }
            if(param1.horns.type == 1 || param1.horns.type > 2)
            {
               outputText("[pg]你的角震动并变形，仿佛是由黏土制成的，重新塑造成两个小小的牛角突起。");
               param1.horns.type = 2;
               param1.horns.value = 2;
               set_changes(get_changes() + 1);
            }
         }
         if(Utils.rand(2) == 0 && param1.hips.rating < 15 && get_changes() < get_changeLimit())
         {
            if(!tainted && param1.hips.rating < 8 || tainted)
            {
               outputText("[pg]你感到骨盆的骨头在摩擦，臀部明显变宽，让你不禁踉跄了一下。");
               _temp_5.rating += 1 + Utils.rand(4);
               set_changes(get_changes() + 1);
            }
         }
         if(Utils.rand(4) == 0 && param1.hasGills() && get_changes() < get_changeLimit())
         {
            get_mutations().updateGills();
         }
         if(Utils.rand(2) == 0 && param1.butt.rating < 13 && get_changes() < get_changeLimit())
         {
            if(!tainted && param1.butt.rating < 8 || tainted)
            {
               outputText("[pg]一种失去平衡的感觉让你难以行走。你停下来，仔细感受着新的重心，然后才恍然大悟——你的屁股变大了！");
               _temp_6.rating += 1 + Utils.rand(2);
               set_changes(get_changes() + 1);
            }
         }
         if(param1.hasStatusEffect(StatusEffects.BlackNipples) && get_changes() < get_changeLimit() && Utils.rand(3) == 0)
         {
            get_mutations().removeBlackNipples(_loc2_);
         }
         if(get_changes() < get_changeLimit() && Utils.rand(3) == 0 && param1.vaginaType() == 5 && param1.hasVagina())
         {
            outputText("[pg]有什么看不见的东西拂过你的下体，让你感到一阵刺痛。解开衣服，你看了看你的阴道，发现它已经变回了自然的肉色。");
            param1.vaginaType(0);
            set_changes(get_changes() + 1);
         }
         if(Utils.rand(3) == 0)
         {
            outputText(param1.modFem(79,3));
         }
         if(Utils.rand(3) == 0)
         {
            outputText(param1.modThickness(70,4));
         }
         if(Utils.rand(5) == 0)
         {
            outputText(param1.modTone(10,5));
         }
         param1.refillHunger(20);
         var _loc8_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc8_,2077,FlagDict_Impl_.arrayReadInt(_loc8_,2077) + get_changes());
         return false;
      }
   }
}

