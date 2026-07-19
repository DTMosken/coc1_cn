package classes.items.consumables
{
   import classes.Ass;
   import classes.BreastRow;
   import classes.Cock;
   import classes.CockTypesEnum;
   import classes.DynStat;
   import classes.PerkLib;
   import classes.Player;
   import classes.StatusEffects;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.bodyParts.Butt;
   import classes.bodyParts.Hips;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.items.Consumable;
   import classes.items.Mutations;
   import flash.Boot;
   import haxe.IMap;
   
   public class GoldenSeed extends Consumable
   {
      
      public static var STANDARD:int = 0;
      
      public static var ENHANCED:int = 1;
      
      public var type:int;
      
      public function GoldenSeed(param1:int = 0)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         type = 0;
         var _loc2_:String = null;
         var _loc3_:String = null;
         var _loc4_:String = null;
         var _loc5_:String = null;
         var _loc6_:int = 0;
         type = param1;
         switch(type)
         {
            case 0:
               _loc2_ = "GldSeed";
               _loc3_ = "Golden Seed";
               _loc4_ = "a golden seed";
               _loc5_ = "这颗种子看起来和闻起来都非常美味。虽然它的颜色很不寻常，但哈比们将这些坚果视为美味的零食。吃下一颗可能会引起一些身体上的变化。";
               _loc6_ = 6;
               break;
            case 1:
               _loc2_ = "MagSeed";
               _loc3_ = "Magic Seed";
               _loc4_ = "a magically-enhanced golden seed";
               _loc5_ = "这颗种子闪烁着力量的光芒。它被露米强化过，释放了全部潜能，能让你更容易发生转化。";
               _loc6_ = 6;
         }
         super(_loc2_,_loc3_,_loc4_,_loc6_,_loc5_);
      }
      
      override public function useItem() : Boolean
      {
         var _loc2_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:* = null as Hips;
         var _loc6_:* = null as Butt;
         var _loc7_:* = null as Ass;
         var _loc8_:* = null as Ass;
         var _loc1_:String = "goldenSeed";
         if(get_player().hasPerk(PerkLib.HarpyWomb))
         {
            _loc1_ += "-HarpyWomb";
         }
         var _loc3_:int = type == 1 ? 3 : 1;
         get_mutations().initTransformation([2,2],_loc3_);
         outputText("你把坚果塞进嘴里，咀嚼着这美味的零食，然后迅速吞下。难怪哈比们这么喜欢这些东西！");
         if(get_player().get_spe100() < 100 && Utils.rand(3) == 0)
         {
            if(get_player().get_spe100() >= 75)
            {
               outputText("[pg]一阵熟悉的寒意顺着你的脊背流下。你的肌肉感觉就像上了油的机器，准备好以闪电般的速度投入行动。");
            }
            else
            {
               outputText("[pg]一阵寒意穿过你的脊背，让你觉得自己的反应更敏捷，身体也更轻快了。");
            }
            if(get_player().get_spe100() < 40)
            {
               dynStats(DynStat.Spe(0.5));
            }
            if(get_player().get_spe100() < 75)
            {
               dynStats(DynStat.Spe(0.5));
            }
            dynStats(DynStat.Spe(0.5));
         }
         if(get_player().get_tou100() > 50 && Utils.rand(3) == 0 && get_changes() < get_changeLimit())
         {
            if(Utils.rand(2) == 0)
            {
               outputText("[pg]一股舒适、缓慢的暖流从你的肠胃蔓延到四肢，流经它们后完全消散。随着它的离去，你注意到你的身体感觉更柔软了，但也变得没那么有体质了。");
            }
            else
            {
               outputText("[pg]你感觉身体轻盈了一些，但也因此变得更加脆弱。也许你的骨骼结构已经变得更像哈比了？");
            }
            dynStats(DynStat.Tou(-1));
         }
         if(get_changes() < get_changeLimit() && get_player().hair.type == 4 && Utils.rand(2) == 0)
         {
            outputText("[pg]当你吞下种子时，你的头开始感觉变重了。你伸手摸了摸，发现你的触手变得柔软，有些纤维化。你拉下一根，感觉它柔软蓬松，几乎像羽毛一样；你看着它溶解成许多细细的羽毛状线。<b>你的头发现在像哈比一样了！</b>");
            get_player().hair.type = 1;
            set_changes(get_changes() + 1);
         }
         if(get_player().get_str100() < 70 && Utils.rand(3) == 0 && get_changes() < get_changeLimit())
         {
            if(get_player().get_str100() < 40)
            {
               outputText("[pg]你打了个寒颤，感觉到一种发烧般的感觉，让你想起了上次生病的时候。谢天谢地，它很快就过去了，并在其后留下了稍微增强的力量。");
            }
            else
            {
               outputText("[pg]热量在你的肌肉中积聚，它们本已强大的质量发生了轻微的变化，因为它们获得了更多的力量。");
            }
            if(get_player().get_str100() < 40)
            {
               dynStats(DynStat.Str(0.5));
            }
            dynStats(DynStat.Str(0.5));
         }
         if((get_player().get_lib100() < 90 || Utils.rand(3) == 0) && Utils.rand(3) == 0 && get_changes() < get_changeLimit())
         {
            if(get_player().get_lib100() < 90)
            {
               dynStats(DynStat.Lib(1));
            }
            if(get_player().get_lib100() < 40)
            {
               outputText("[pg]当你幻想着性爱时，一阵红晕在你的[face]上闪过。你眨了眨眼，意识到这件物品似乎影响了你的性欲。");
               if(get_player().hasVagina())
               {
                  outputText("你[vagina]的湿润似乎也同意这一点。");
               }
               else if(get_player().hasCock())
               {
                  outputText("[eachcock]的坚挺似乎也证明了这一点。");
               }
               dynStats(DynStat.Lust(5));
            }
            else if(get_player().get_lib100() < 75)
            {
               outputText("[pg]热流，美妙的热流，从头穿过你的身体直达腹股沟，让你浑身颤抖，幻想着现在就能享受的性爱。[pg]");
            }
            else if(get_player().get_lib100() < 90)
            {
               outputText("[pg]性欲在你体内涌动，让你的皮肤泛起红晕，你喘息着，白日梦般地幻想着现在本该享受的绝妙性爱。[pg]");
            }
            else
            {
               outputText("[pg]你呻吟着，这颗种子的某些特质恰到好处地刺激了你的性欲，让你欲火焚身。你大口喘息着，叹息着幻想着你本可以享受的性爱。[pg]");
            }
            if(get_player().get_lib100() >= 40)
            {
               dynStats(DynStat.Lust(get_player().lib / 5 + 10));
               if(get_player().hasCock() && (get_player().get_gender() != 3 || Utils.rand(2) == 0))
               {
                  if(Utils.rand(2) == 0)
                  {
                     outputText("在你的幻想中，你正在天空中飞翔，[eachcock]已经坚挺并滴落着男性的体液，同时你盘旋在一个迷人的哈比巢穴上方。她的羽毛像天空一样蓝，她的眼睛是闪耀的海洋蓝绿色，双腿张开的姿势向你展示了她已经准备好被配种了。你收起翅膀俯冲而下，风在你的[hair]间呼啸，而她的身影越来越大。伴随着肉体碰撞的沉重冲击，你降落在她身上，将你坚硬、准备就绪的阳具插入她饥渴的小穴中。");
                     if(get_player().cockTotal() > 1)
                     {
                        outputText("多出来的阴茎");
                        if(get_player().cockTotal() > 2)
                        {
                           outputText("摩擦着");
                        }
                        else
                        {
                           outputText("摩擦着");
                        }
                        outputText("她紧绷、空瘪的腹部皮肤，将你的渴望滴落在她身上。");
                        outputText("你突然从幻象中惊醒，发现[eachcock]和梦中一样坚挺。你的[armor]里面因为流出的预精而变得一团糟。也许你能在附近找个哈比共度良宵。");
                     }
                  }
                  else
                  {
                     outputText("在你的幻想中，你躺在后宫为你搭建的巢穴里，抚摸着你的肉棒，看着性感的鸟身女孩张开双腿，将另一枚蛋产在蛋堆上。淫荡的呻吟声无法满足你的需求，你招手示意另一只顺从的哈比靠近。她走上前来，丰满的大腿摇曳着，表明她明白你的需求。鸟身女妖爬进你的怀里，沉下身子坐在你的肉棒上，用她那滚烫的温度紧贴着它。她开始亲吻你，用她的迷药唇膏涂抹你的嘴，直到你释放出多次射精中的第一次。你叹了口气，沉浸在极乐之中，确信这个“妻子”在怀上另一枚蛋之前不会停下来。然后就轮到她的姐妹妻子了。你的[armor]里[eachcock]的紧绷感将你从梦中唤醒，提醒你，你只是站在那里，把你的渴望漏进你的装备里。");
                  }
               }
               else if(get_player().hasVagina())
               {
                  if(Utils.rand(2) == 0)
                  {
                     outputText("在你的幻想中，你是一个快乐的哈比母亲，你的子宫被里面巨大的蛋撑大了。体内汹涌的荷尔蒙再次唤醒了你的情欲，你转向你孩子们的父亲，在他那沾满口水、涂满唇膏的肉棒上印下一个湿吻。可怜的冒险者扭动着身体，臀部在空中徒劳地抽动。自从你开始用亲吻涂满他的肉棒后，他变得顺从多了。你骑上这个饥渴的男孩，幻想着你第一次在传送门附近、你旧营地的废墟中找到他的情景。你坚挺的乳头");
                     if(get_player().hasFuckableNipples())
                     {
                        outputText("和小穴流出的液体沾满");
                     }
                     else if(get_player().biggestLactation() >= 1.5)
                     {
                        outputText("滴着奶水在");
                     }
                     else
                     {
                        outputText("摩擦着");
                     }
                     outputText("你的[armor]将你从梦中惊醒，留给你的只有胯下的湿润。也许明年你能找到梦寐以求的伴侣？");
                  }
                  else
                  {
                     outputText("在你的幻想中，你仰面躺着，粗壮的大腿张得大大的，任由一个强壮的雄性占有。这个可怜的种马独自在沙漠中徘徊，跟着某张地图，但很快你就让那根鲜红的肉棒滑入你的臀沟，尖端释放出顺从的汁液润滑你的下体。你让他骑上你的小穴，然后用你强有力的大腿夹住他，腾空而起。他起初很惊慌，但额外的血液流动只会让他变得更大。他很快就忘记了恐惧，专注于所有雄性的原始需求——与一只美丽的哈比交配。你回头看着他，眨了眨眼，感觉到他的阴茎结在你体内膨胀。你那酸痛娇嫩的[nipples]在[armor]里摩擦，将你从幻想中拉了出来。也许等你的任务结束后，你就能找到一个害羞、多产的雄性，把他塑造成完美的精液泵。");
                  }
               }
            }
         }
         if(get_player().get_gender() == 0 || !get_player().hasVagina() && get_changes() < get_changeLimit() && Utils.rand(3) == 0)
         {
            set_changes(get_changes() + 1);
            if(get_player().balls > 0)
            {
               outputText("[pg]你的[balls]后面开始发痒，但还没等你伸手去抓，不适感就消失了。片刻之后，一种温暖湿润的感觉拂过你的[sack]，你对这种感觉感到好奇，<b>你抬起你的蛋蛋，露出了你新的阴道。</b>");
            }
            else if(get_player().hasCock())
            {
               outputText("[pg]你的腹股沟开始发痒，就在你的[cocks]正下方。你把你的命根子拨到一边，以便看得更清楚，你可以看着<b>你的皮肤裂开，长出一个新的阴道，甚至还有一个小阴蒂。</b>");
            }
            else
            {
               outputText("[pg]你的腹股沟开始发痒，还没等你采取行动就消失了。你对这种断断续续的感觉感到好奇，<b>你偷看了一下你的[armor]下面，发现了你崭新的阴道，包括阴唇和一个小阴蒂。</b>");
            }
            get_player().createVagina();
            get_player().setClitLength(0.25);
            dynStats(DynStat.Sens(10));
         }
         if(get_changes() < get_changeLimit() && int(get_player().breastRows.length) > 1 && Utils.rand(3) == 0 && !get_hyper())
         {
            get_mutations().removeExtraBreastRow(_loc1_);
         }
         else if(get_changes() < get_changeLimit() && int(get_player().breastRows.length) == 1 && Utils.rand(3) == 0 && get_player().breastRows[0].breastRating >= 7 && !get_hyper())
         {
            set_changes(get_changes() + 1);
            if(get_player().breastRows[0].breastRating < 19)
            {
               get_player().shrinkTits();
            }
            else
            {
               var _temp_1:* = get_player().breastRows[0];
               _temp_1.breastRating = _temp_1.breastRating - (4 + Utils.rand(4));
               outputText("[pg]你的胸部紧绷起来，危险地摇晃了一秒钟，然后你那巨大的双峰开始向内收缩。沉重的肉团微微颤动，像脱下旧外套一样减小罩杯，直到变成[breastcup]大小才停下来。");
            }
         }
         if(get_changes() < get_changeLimit() && get_player().breastRows[0].breastRating < 2 && Utils.rand(3) == 0)
         {
            set_changes(get_changes() + 1);
            outputText("[pg]你的胸部开始发麻，[armor]下的[skindesc]变得温暖起来。你伸手进去抚摸那柔软的肉体，惊讶地发现它在你的手指间膨胀起来，变得越来越大，直到变成一对B罩杯的乳房。");
            if(get_player().breastRows[0].breastRating < 1)
            {
               outputText("<b>你现在有乳房了！</b>");
            }
            get_player().breastRows[0].breastRating = 2;
         }
         if(get_changes() < get_changeLimit() && get_player().hasCock() && get_player().countCocksOfType(CockTypesEnum.AVIAN) < get_player().cockTotal() && Utils.rand(type == 1 ? 4 : 10) == 0)
         {
            set_changes(get_changes() + 1);
            outputText("[pg]当勃起形成时，你的阴茎感到一阵奇怪的刺痛。你" + get_player().clothedOrNakedLower("解开你的[armor]并","") + "低头看去，发现" + (get_player().cockTotal() == 1 ? "你的阴茎" : "你的一根阴茎") + "正在发生变化！当变形完成时，你注意到它变成了锥形，呈红色，末端呈尖状。当你未勃起时，你的阴茎会妥帖地收在一个新形成的阴茎鞘中。<b>你现在拥有了鸟人阴茎！</b>");
            _loc4_ = 0;
            while(_loc4_ < int(get_player().cocks.length))
            {
               if(get_player().cocks[_loc4_].get_cockType() != CockTypesEnum.AVIAN)
               {
                  get_player().cocks[_loc4_].set_cockType(CockTypesEnum.AVIAN);
                  break;
               }
               _loc4_++;
            }
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
         if(get_player().get_femininity() < 85 && get_changes() < get_changeLimit() && Utils.rand(3) == 0)
         {
            set_changes(get_changes() + 1);
            outputText(get_player().modFem(85,3 + Utils.rand(5)));
         }
         if(get_player().skin.tone != "tan" && get_player().skin.tone != "olive" && get_player().skin.tone != "dark" && get_player().skin.tone != "light" && get_changes() < get_changeLimit() && Utils.rand(5) == 0)
         {
            set_changes(get_changes() + 1);
            outputText("[pg]过了一会儿你才注意到，但是<b>");
            if(get_player().hasFur())
            {
               outputText("你[haircolor][skindesc]下的皮肤");
            }
            else
            {
               outputText("你的[skindesc]");
            }
            outputText("已经变成了");
            _loc2_ = Utils.rand(4);
            if(_loc2_ == 0)
            {
               get_player().skin.tone = "tan";
            }
            else if(_loc2_ == 1)
            {
               get_player().skin.tone = "olive";
            }
            else if(_loc2_ == 2)
            {
               get_player().skin.tone = "dark";
            }
            else if(_loc2_ == 3)
            {
               get_player().skin.tone = "light";
            }
            outputText("[skintone]。</b>");
            get_player().arms.updateClaws(get_player().arms.claws.type);
         }
         if(get_player().hips.rating < 10 && get_changes() < get_changeLimit() && Utils.rand(3) == 0)
         {
            outputText("[pg]你的步态微微改变，以适应你正在变宽的[hips]。这种变化很微妙，但它们确实变宽了。");
            var _temp_2:* = get_player().hips;
            _temp_2.rating = _temp_2.rating + 1;
            set_changes(get_changes() + 1);
         }
         if(get_player().hips.rating >= 15 && get_changes() < get_changeLimit() && Utils.rand(3) == 0)
         {
            outputText("[pg]你的步态向内收缩，你的[hips]明显变窄了。它们仍然很丰满，但不再像以前那样宽得离谱了。");
            _loc5_ = get_player().hips;
            --_loc5_.rating;
            set_changes(get_changes() + 1);
         }
         if(get_player().butt.rating < 8 && get_changes() < get_changeLimit() && Utils.rand(3) == 0)
         {
            var _temp_3:* = get_player().butt;
            _temp_3.rating = _temp_3.rating + 1;
            set_changes(get_changes() + 1);
            outputText("[pg]你的臀部微微颤动，但并没有停止，而是再次开始颤动。你甚至能感觉到你的[armor]被不断变大的臀瓣撑满。当颤动停止时，你发现自己骄傲地拥有了一个[ass]。");
         }
         if(get_player().butt.rating >= 14 && get_changes() < get_changeLimit() && Utils.rand(4) == 0)
         {
            set_changes(get_changes() + 1);
            _loc6_ = get_player().butt;
            --_loc6_.rating;
            outputText("[pg]你的[ass]开始感到紧绷，并且逐渐加剧。这种感觉越来越强烈，但随之而来的是你的重心发生了偏移。你伸手向后摸了摸，果然，你巨大的臀部正在缩小到一个更容易控制的尺寸。");
         }
         if(get_player().thickness > 25 && get_changes() < get_changeLimit() && Utils.rand(3) == 0)
         {
            outputText(get_player().modThickness(25,3 + Utils.rand(4)));
            set_changes(get_changes() + 1);
         }
         if(get_changes() < get_changeLimit() && Utils.rand(5) == 0 && get_player().eyes.type > 0)
         {
            if(get_player().eyes.type == 2)
            {
               outputText("[pg]你感到眼睛一阵刺痛，眨了眨眼。感觉就像黑色的白内障刚刚从你眼中脱落，你不需要看自己的倒影就知道你的眼睛已经恢复了人类的模样。");
            }
            else
            {
               outputText("[pg]你眨了眨眼，踉跄了一下，一阵眩晕感似乎要把你的[feet]从你身下抽走。当你站稳并睁开眼睛时，你意识到有些东西似乎不同了。你的视力不知怎么地改变了。");
               if(get_player().eyes.type == 1 || get_player().eyes.type == 7)
               {
                  outputText("你的蜘蛛眼消失了！</b>");
               }
               outputText("<b>你又拥有了正常的人类眼睛。</b>");
            }
            get_player().eyes.type = 0;
            get_player().eyes.count = 2;
            set_changes(get_changes() + 1);
         }
         if(get_player().lowerBody.type != 13 && get_changes() < get_changeLimit() && (type == 1 || get_player().tail.type == 11) && Utils.rand(4) == 0)
         {
            if(!get_player().isGoo())
            {
               outputText("[pg]你的[legs]发出不祥的嘎吱声，紧接着便失去了力量，让你摔倒在地。它们变得完全瘫软，在你眼前扭曲重塑，那模样让你忍不住皱眉。你的下半身终于停止了变化，但固定下来的形态在大腿处相当粗壮。甚至你的[feet]也变了。");
            }
            else
            {
               outputText("[pg]你那黏糊糊的下半身失去了一些粘性，让你跌入了一滩曾经是你双腿的液体中。在你的注视下，这些液体聚拢成了一对明显的腿状，凝固成了明显不再是史莱姆的形态。你甚至重新获得了一双脚！");
            }
            get_player().lowerBody.type = 13;
            get_player().lowerBody.legCount = 2;
            set_changes(get_changes() + 1);
            outputText("虽然形状像人类，但它们前面有两个长着利爪的大脚趾，脚跟处也突出一根爪子。整个下半身从脚踝到臀部都覆盖着[haircolor]羽毛，让你想起了山里的鸟身女妖。<b>你现在拥有了哈比的腿！</b>");
         }
         if(get_player().tail.type != 11 && get_changes() < get_changeLimit() && (type == 1 || get_player().wings.type == 9) && Utils.rand(4) == 0)
         {
            if(get_player().tail.type > 0)
            {
               outputText("[pg]你的尾巴变短了，折叠进了你的[ass]缝里，然后消失了。片刻之后，一簇羽毛在它原来的位置长了出来，每当微风拂过，它就会本能地上下抖动。<b>你拥有了一条长满羽毛的哈比尾巴！</b>");
            }
            else
            {
               outputText("[pg]你的脊柱底部传来一阵刺痛，让你在原地扭动。片刻之后，刺痛感消失了，但一簇羽毛从你的[skindesc]中长了出来。每当微风拂过，这条新尾巴就会本能地上下抖动。<b>你拥有了一条长满羽毛的哈比尾巴！</b>");
            }
            get_player().tail.type = 11;
            set_changes(get_changes() + 1);
         }
         if(get_player().wings.type == 0 && get_changes() < get_changeLimit() && (type == 1 || get_player().arms.type == 1) && Utils.rand(4) == 0)
         {
            outputText("[pg]剧痛刺穿了你的背部，肌肉奇怪地纠结在一起，向上挤压，使你的[skindesc]鼓了起来。好痛，天哪，真的好痛，但你找不到一个好角度去摸索痛苦的根源。一声巨响划破空气，然后你的身体强行将一对狭窄的肢体从你的[armor]缝隙中挤了出来。血液泵入新的附肢，随着它们变得丰满和生长，疼痛减轻了。你试探性地发现自己正在弯曲你不知道自己拥有的肌肉，并且");
            get_player().wings.setProps({
               "type":9,
               "color":(get_player().hasFur() ? get_player().skin.furColor : get_player().hair.color)
            });
            outputText("<b>你能够将新长出的部位弯曲到足够的角度，从而看到你崭新的[wingcolor]翅膀。</b>");
            set_changes(get_changes() + 1);
         }
         if(([0,9].indexOf(get_player().wings.type) == -1 || get_player().rearBody.type == 3) && get_changes() < get_changeLimit() && Utils.rand(4) == 0)
         {
            if(get_player().rearBody.type == 3)
            {
               outputText("[pg]你巨大鳍上的感觉缓慢但真切地消退，留下一个干瘪的外壳，断裂掉落在地上。你的背部愈合，掩盖了失去鳍的痕迹，就像你进入传送门的那天一样光滑无痕。");
               get_player().rearBody.restore();
            }
            else
            {
               outputText("[pg]你的[wings]上的感觉缓慢但真切地消退，留下干瘪的外壳，断裂掉落在地上。你的背部愈合，掩盖了失去翅膀的痕迹，就像你进入传送门的那天一样光滑无痕。");
            }
            get_player().wings.restore();
            set_changes(get_changes() + 1);
         }
         if(get_player().arms.type != 1 && get_changes() < get_changeLimit() && (type == 1 || get_player().hair.type == 1) && Utils.rand(4) == 0)
         {
            outputText("[pg]当你舔去牙齿上最后一点坚果残渣时，你像小恶魔一样调皮地笑了笑，但当你去擦嘴时，嘴唇上感觉到的不是你平时" + get_player().skin.desc + "的质感，而是羽毛！你惊恐地看着更多的鸟人羽毛从你的[skindesc]中长出，覆盖了你的前臂，直到<b>你的手臂看起来隐约像翅膀</b>。谢天谢地，你的手保持原样。如果没有手，就不可能成为勇者！如果你要飞行，这些长满羽毛的肢体可能会帮助你机动，但它们绝对无法单独支撑你。");
            set_changes(get_changes() + 1);
            get_player().arms.setType(1);
         }
         if(get_player().hair.type != 1 && get_changes() < get_changeLimit() && (type == 1 || get_player().face.type == 0) && Utils.rand(4) == 0)
         {
            outputText("[pg]你的头皮开始发麻，情况越来越糟，直到你痒得发狂，当你像狗挠跳蚤一样抓挠时，你头发中羽毛般的发丝挠着你的指尖。当你把手缩回来时，你看到绒毛从你的指甲上垂下来。你恍然大悟——你的头发变成了羽毛，就像哈比一样！");
            get_player().hair.type = 1;
            set_changes(get_changes() + 1);
         }
         if(get_player().face.type != 0 && get_changes() < get_changeLimit() && (type == 1 || (get_player().ears.type == 0 || get_player().ears.type == 4)) && Utils.rand(4) == 0)
         {
            outputText("[pg]一阵突如其来的剧痛席卷了你的[face]，随着骨骼扭曲和下颌线的移动，你的面容变得狰狞。疼痛慢慢消失，留下你捂着脸哭泣。当你把手拿开时，你意识到自己留下了一张完全正常的、人类的脸。");
            get_player().face.type = 0;
            set_changes(get_changes() + 1);
         }
         if(get_player().ears.type != 0 && get_player().ears.type != 4 && get_changes() < get_changeLimit() && Utils.rand(4) == 0)
         {
            outputText("[pg]哎哟，你的头好痛！感觉就像你的耳朵被从头上扯下来一样，当你伸手去捂住疼痛的脑袋时，你发现它们消失了！你晕头转向，摇摇晃晃，几乎失去了平衡感，差点摔倒了半打次，直到<b>一对正常的、人类的耳朵从你头部的两侧长出来。</b>你几乎已经忘记了人类耳朵的感觉！");
            get_player().ears.type = 0;
            set_changes(get_changes() + 1);
         }
         if(Utils.rand(4) == 0 && get_player().hasGills() && get_changes() < get_changeLimit())
         {
            get_mutations().updateGills();
         }
         if(!get_player().hasPerk(PerkLib.HarpyWomb) && get_player().lowerBody.type == 13 && get_player().tail.type == 11 && Utils.rand(4) == 0 && get_changes() < get_changeLimit())
         {
            get_player().createPerk(PerkLib.HarpyWomb,0,0,0,0);
            outputText("[pg]你的子宫里传来一阵隆隆声，这表明你最女性化的部位发生了一些奇怪的变化。毫无疑问，它里面的一些东西已经变得更像哈比了。（<b>你获得了哈比子宫特质！只要你有哈比的腿和哈比的尾巴，你下的所有蛋都会是大的。</b>）");
            set_changes(get_changes() + 1);
         }
         if(get_changes() < get_changeLimit() && Utils.rand(4) == 0 && (get_player().ass.analWetness > 0 && !get_player().hasPerk(PerkLib.MaraesGiftButtslut) || get_player().ass.analWetness > 1))
         {
            outputText("[pg]你感觉到结肠收紧，你的[asshole]向内收缩。起初你感到一阵刺痛，但谢天谢地，疼痛渐渐消退了。你的屁股似乎变干并收紧了。");
            _loc7_ = get_player().ass;
            --_loc7_.analWetness;
            if(get_player().ass.analLooseness > 1)
            {
               _loc8_ = get_player().ass;
               --_loc8_.analLooseness;
            }
            set_changes(get_changes() + 1);
         }
         if(get_player().hasStatusEffect(StatusEffects.BlackNipples) && get_changes() < get_changeLimit() && Utils.rand(3) == 0)
         {
            get_mutations().removeBlackNipples(_loc1_);
         }
         if(get_changes() < get_changeLimit() && Utils.rand(3) == 0 && get_player().vaginaType() == 5 && get_player().hasVagina())
         {
            outputText("[pg]有什么看不见的东西拂过你的下体，让你感到一阵刺痛。解开衣服，你看了看你的阴道，发现它已经恢复了自然的肉色。");
            get_player().vaginaType(0);
            set_changes(get_changes() + 1);
         }
         if(get_changes() == 0)
         {
            outputText("[pg]除了是一顿美味的零食外，这次它似乎并没有对你产生任何影响。");
         }
         get_player().refillHunger(10);
         var _loc9_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc9_,2077,FlagDict_Impl_.arrayReadInt(_loc9_,2077) + get_changes());
         return false;
      }
   }
}

