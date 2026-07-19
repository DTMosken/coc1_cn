package classes.items.consumables
{
   import classes.BreastRow;
   import classes.Cock;
   import classes.CockTypesEnum;
   import classes.DynStat;
   import classes.DynStatOp;
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
   
   public class BeeHoney extends Consumable
   {
      
      public static var PURE_HONEY_VALUE:int = 40;
      
      public static var SPECIAL_HONEY_VALUE:int = 20;
      
      public function BeeHoney(param1:Boolean = false, param2:Boolean = false)
      {
         var _loc3_:* = null as String;
         var _loc4_:* = null as String;
         var _loc5_:* = null as String;
         var _loc6_:* = null as String;
         var _loc7_:int = 0;
         if(Boot.skip_constructor)
         {
            return;
         }
         if(param2)
         {
            _loc3_ = "SpHoney";
            _loc4_ = "Spec. Honey";
            _loc5_ = "a bottle of special bee honey";
            _loc6_ = "一个透明的水晶瓶，里面装着你从蜜蜂侍女那里得到的深棕色液体。即使瓶子还塞着软木塞，它也散发出强烈的甜味。";
            _loc7_ = 20;
         }
         else
         {
            _loc3_ = param1 ? "PurHony" : "BeeHony";
            _loc4_ = (param1 ? "Pure" : "Bee") + " Honey";
            _loc5_ = param1 ? "a crystal vial filled with glittering honey" : "a small vial filled with giant-bee honey";
            _loc6_ = "这个精致的水晶小瓶里装满了浓稠的琥珀色液体，在光线下" + (param1 ? "闪闪发光" : "闪烁着微光") + "。即使瓶塞塞得很紧，你也能闻到一股甜美的香气。";
            _loc7_ = param1 ? 40 : 6;
         }
         super(_loc3_,_loc4_,_loc5_,_loc7_,_loc6_);
      }
      
      override public function useItem() : Boolean
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc1_:String = "BeeHoney";
         var _loc2_:Player = get_player();
         var _loc3_:Boolean = get_value() == 40;
         var _loc4_:Boolean = get_value() == 20;
         get_mutations().initTransformation([2,2,2]);
         _loc2_.slimeFeed();
         if(_loc4_)
         {
            outputText("你拔开瓶塞，将气味极其浓烈的浓缩蜂蜜倒进喉咙。它的味道也异常强烈。你立刻感觉到这种物质的效力开始在你的体内蔓延。");
         }
         else
         {
            outputText("打开水晶小瓶，一股超级浓郁的甜美蜂蜜香味扑面而来。这让你感到有些头晕目眩。你咯咯笑着，舔了舔嘴唇上的蜂蜜，想都没想就把这糖浆般的灵药喝了下去。");
         }
         _loc2_.refillHunger(15);
         if((_loc3_ || _loc4_) && _loc2_.get_pregnancyType() == 24)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1174) > 1)
            {
               outputText("[pg]你感到恶心，想要呕吐。你的肚子一阵疼痛，你意识到你怀着的孩子一点也不喜欢这个。不过话又说回来，也许纯蜂蜜对它有好处。");
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1174) < 1)
            {
               outputText("[pg]一种温暖的感觉从你的腹部开始，流遍全身。就好像你在感受音乐一样，你猜你肚子里的“小乘客”很享受这顿大餐。");
            }
            else
            {
               outputText("[pg]起初你感觉到你的宝宝在蜂蜜中挣扎，但随后它似乎变得满足并开始享受它。");
            }
            _loc5_ = 1174;
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,_loc5_,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,_loc5_) - 1);
            if(_loc3_)
            {
               return false;
            }
         }
         if(get_changes() < get_changeLimit() && _loc3_)
         {
            outputText("[pg]");
            set_changes(get_changes() + 1);
            if(_loc2_.cor > 80)
            {
               outputText("你的头很痛，就好像雷声在你的头骨里回荡。");
            }
            else if(_loc2_.cor > 60)
            {
               outputText("你感觉到眼睛后面正在形成一阵头痛。没过多久，它就达到了顶峰。");
            }
            else if(_loc2_.cor > 40)
            {
               outputText("一阵刺痛划过你的头骨。");
            }
            else if(_loc2_.cor > 20)
            {
               outputText("一阵刺痛感在你的头骨中蔓延开来。");
            }
            else
            {
               outputText("你感到头骨内有一阵轻微的、令人不适的刺痛感。");
            }
            if(_loc2_.cor > 0)
            {
               outputText("这种感觉很快就消失了，让你的头脑变得更加清醒");
            }
            dynStats(DynStat.Cor(-(1 + _loc2_.cor / 20)));
            if(_loc2_.cor > 0 && get_changes() < get_changeLimit() && Utils.rand(1.5) == 0 && _loc2_.get_lib100() > 40)
            {
               outputText("，并稍微平息了你过度旺盛的性欲");
               dynStats(DynStat.Lib(-3),DynStat.Lust(-20));
               set_changes(get_changes() + 1);
            }
            else if(_loc2_.cor > 0)
            {
               outputText("。");
            }
         }
         if(get_changes() < get_changeLimit() && _loc2_.hair.type == 4 && Utils.rand(2) == 0)
         {
            outputText("[pg]当你咽下这黏糊糊又甜腻腻的蜂蜜时，你的头开始觉得越来越沉。你抬起手，发现你的触手变得柔软，甚至有些纤维化。你拉下一根触手，发现它的手感和气味都像你刚吃下的蜂蜜；你看着它溶解成许多涂满糖浆的细丝。<b>你的头发恢复正常了（好吧，等你把蜂蜜洗掉之后）！</b>");
            _loc2_.hair.type = 0;
            set_changes(get_changes() + 1);
         }
         if(get_changes() < get_changeLimit() && Utils.rand(2) == 0 && _loc2_.get_inte100() < 80)
         {
            dynStats(DynStat.Inte(0.1 * (80 - _loc2_.get_inte100())));
            outputText("[pg]你花了一会儿时间分析蜂蜜残留物的味道和质地，觉得自己聪明极了。");
         }
         if(get_changes() < get_changeLimit() && (_loc2_.hair.color != "shiny black" && _loc2_.hair.color != "black and yellow") && _loc2_.hair.length > 10 && Utils.rand(5) == 0)
         {
            outputText("[pg]你感到头皮发麻，惊慌失措地抓住头发，把一缕头发拉到面前。");
            if(Utils.rand(9) == 0)
            {
               _loc2_.hair.color = "black and yellow";
            }
            else
            {
               _loc2_.hair.color = "shiny black";
            }
            outputText("你的头发现在变成了[haircolor]，就像蜂女一样！");
            set_changes(get_changes() + 1);
         }
         if(get_changes() < get_changeLimit() && _loc2_.hair.length < 25 && Utils.rand(3) == 0)
         {
            outputText("[pg]你感到有些失去平衡，随后发现你的头发变长了，");
            _temp_1.length += Utils.rand(4) + 1;
            outputText("变成了[hair]。");
            set_changes(get_changes() + 1);
         }
         if(get_changes() < get_changeLimit() && _loc2_.bRows() > 2 && Utils.rand(3) == 0 && !get_hyper())
         {
            get_mutations().removeExtraBreastRow(_loc1_);
         }
         if(get_changes() < get_changeLimit() && _loc2_.antennae.type == 0 && _loc2_.horns.value == 0 && Utils.rand(3) == 0)
         {
            outputText("[pg]你的头皮一阵发痒，两根柔软的触角从你的[hair]中长了出来。");
            _loc2_.antennae.type = 2;
            set_changes(get_changes() + 1);
         }
         if(get_changes() < get_changeLimit() && _loc2_.horns.value > 0 && Utils.rand(3) == 0)
         {
            _loc2_.horns.value = 0;
            _loc2_.horns.type = 0;
            outputText("[pg]你的角碎裂了，大块大块地掉落，直到完全剥落消失。");
            set_changes(get_changes() + 1);
         }
         if(get_changes() < get_changeLimit() && _loc2_.lowerBody.type != 7 && Utils.rand(4) == 0)
         {
            outputText("[pg]你的双腿因突如其来难以忍受的剧痛而颤抖，仿佛从内到外被撕裂，又同时被缝合在一起。当你听到骨头断裂和碎裂的声音时，你痛苦地尖叫起来。片刻之后，疼痛消退，你能够低头看着你美丽的新腿，从大腿往下覆盖着闪亮的黑色甲壳，大腿上部则长着柔软的黄色绒毛。");
            _loc2_.lowerBody.type = 7;
            _loc2_.lowerBody.legCount = 2;
            set_changes(get_changes() + 1);
         }
         if(_loc2_.arms.type != 3 && get_changes() < get_changeLimit() && Utils.rand(4) == 0)
         {
            outputText("[pg]");
            if(_loc2_.arms.type == 2)
            {
               outputText("你的上臂开始慢慢长出黄色的绒毛，让它们看起来更像蜜蜂的手臂。");
            }
            else
            {
               if(_loc2_.arms.type == 1)
               {
                  outputText("覆盖在你手臂上的羽毛脱落了，让它们恢复成更接近人类的外观。");
               }
               outputText("你着迷地看着你的前臂逐渐变得闪闪发光。你手臂的整个外部结构在分裂成节时感到刺痛，<b>将[skinFurScales]变成了闪亮的黑色甲壳</b>。片刻之后，疼痛消退，你低下头看着你美丽的新手臂，从上臂往下覆盖着闪亮的黑色甲壳素，而上臂则长着柔软的黄色绒毛。");
            }
            _loc2_.arms.setType(3);
            set_changes(get_changes() + 1);
         }
         if(_loc2_.averageNipplesPerBreast() > 1 && get_changes() < get_changeLimit() && Utils.rand(4) == 0)
         {
            outputText("[pg]一阵寒意掠过你的" + _loc2_.allBreastsDescript() + "，然后消失了。你把手伸进[armor]下，发现你多余的乳头不见了！你现在每个");
            if(_loc2_.biggestTitSize() < 1)
            {
               outputText("“乳房”上只有一个了。");
            }
            else
            {
               outputText("乳房上只有一个了。");
            }
            set_changes(get_changes() + 1);
            _loc5_ = 0;
            while(_loc5_ < int(_loc2_.breastRows.length))
            {
               _loc2_.breastRows[_loc5_].nipplesPerBreast = 1;
               _loc5_++;
            }
         }
         if(_loc2_.neck.type != 0 && get_changes() < get_changeLimit() && Utils.rand(4) == 0)
         {
            get_mutations().restoreNeck(_loc1_);
         }
         if(_loc2_.hasNonSharkRearBody() && get_changes() < get_changeLimit() && Utils.rand(5) == 0)
         {
            get_mutations().restoreRearBody(_loc1_);
         }
         if(Utils.rand(4) == 0)
         {
            get_mutations().updateOvipositionPerk(_loc1_);
         }
         if(get_changes() < get_changeLimit() && !_loc2_.hasPerk(PerkLib.BeeOvipositor) && _loc2_.tail.type == 6 && Utils.rand(2) == 0)
         {
            outputText("[pg]你昆虫般的腹部开始出现一种奇怪的肿胀，就在底部的某个地方。你蜷缩起身子，向后伸向你那突出的、球状的蜜蜂部位，用手指沿着底部抚摸。当你在毒刺附近摸到一条柔软、有弹性的裂缝时，你倒吸了一口凉气。当你探查这个新孔洞时，一阵快感传遍全身，一个管状的、黑色的、半硬的附属物掉了出来，像任何性器官一样剧烈地跳动着。<b>这个新器官显然是一个产卵管！</b>轻轻戳几下就证实了它同样敏感；你已经能感觉到你的内部正在发生变化，调整着开始生产未受精的卵。你漫不经心地想，用你新的蜜蜂产卵管产下它们会是什么感觉……");
            outputText("[pg](<b>获得特质：蜜蜂产卵管 - 允许你在敌人体内产卵！</b>)");
            _loc2_.createPerk(PerkLib.BeeOvipositor,0,0,0,0);
            set_changes(get_changes() + 1);
         }
         if(get_changes() < get_changeLimit() && _loc2_.tail.type != 6 && (_loc2_.tail.type == 0 || Utils.rand(1.5) == 0) && Utils.rand(4) == 0)
         {
            if(_loc2_.tail.type > 0)
            {
               outputText("[pg]你[ass]上方一阵剧痛的肿胀让你弯下了腰，你听到你的尾巴掉落到地上的声音！还没等你考虑这意味着什么，疼痛就加剧了，你感觉到你的背部令人作呕地向外凸起，伴随着噼啪作响的声音，一个圆润的蜜蜂般的腹部取代了你原来的[tail]。它长得大到无法隐藏，最后，伴随着一声清晰的“咔哒”声，你的毒刺滑了出来。");
            }
            else
            {
               outputText("[pg]你[ass]上方一阵剧痛的肿胀让你弯下了腰。随着肿块开始从你的背部突出，情况变得越来越糟，伴随着一系列的爆裂声，肿块不断膨胀变圆，直到你的屁股上方悬挂着一个球状的腹部。整个腹部覆盖着坚硬的甲壳素物质，大到无法隐藏。当你的毒刺伴随着“咔哒”声滑入到位，完成转变时，你叹了口气。<b>你长出了蜜蜂的腹部。</b>");
            }
            _loc2_.tail.type = 6;
            _loc2_.tail.venom = 10;
            _loc2_.tail.recharge = 2;
            set_changes(get_changes() + 1);
         }
         if(get_changes() < get_changeLimit() && _loc2_.tail.type == 6 && _loc2_.tail.recharge < 15 && Utils.rand(2) != 0)
         {
            if(_loc2_.tail.recharge < 5)
            {
               _temp_2.recharge += 1;
            }
            if(_loc2_.tail.recharge < 10)
            {
               _temp_3.recharge += 1;
            }
            if(_loc2_.tail.recharge < 15)
            {
               _temp_4.recharge += 1;
            }
            _temp_5.venom += 50;
            if(_loc2_.tail.venom > 100)
            {
               _loc2_.tail.venom = 100;
            }
            outputText("[pg]你的腹部充满了活力，一滴毒液从你的毒刺中溢出，因为它开始产生稍微多一点的毒液。");
            set_changes(get_changes() + 1);
         }
         if(get_changes() < get_changeLimit() && _loc2_.wings.type == 1 && Utils.rand(4) != 0)
         {
            set_changes(get_changes() + 1);
            _loc2_.wings.type = 2;
            outputText("[pg]你的翅膀在生长时感到刺痛，不断丰满，直到它们大到足以将你从地面升起并让你飞翔！<b>你现在拥有了巨大的蜜蜂翅膀！</b>你试着拍打了几下，开始在原地盘旋，飞行的快感让你脸上挂着令人眼花缭乱的笑容。");
         }
         if(get_changes() < get_changeLimit() && (_loc2_.wings.type == 0 || _loc2_.rearBody.type == 3) && Utils.rand(4) != 0)
         {
            if(_loc2_.rearBody.type == 3)
            {
               outputText("[pg]你感到巨大的背鳍上一阵发痒，似乎有什么东西正在那里生长。你扭曲着身体，试图抓挠以缓解不适，却徒劳无功。当你感觉到有什么新东西从鳍上长出来时，一种如释重负的感觉油然而生。你急忙脱下" + Utils.cnName(_loc2_.get_armorName()) + "的上半部分，惊奇地发现一对蜜蜂般的小翅膀从你的背上长了出来，取代了原本长在那里的鳍。你温柔地活动着新的肌肉，发现自己可以非常快地拍打它们。不幸的是，你似乎无法将你的小翅膀拍打得足够快以至于能够飞行，但它们肯定能减缓坠落的速度。对你的" + Utils.cnName(_loc2_.get_armorName()) + "进行了一些快速的修改后，你准备好带着<b>你新的蜜蜂翅膀</b>继续你的旅程了。");
               _loc2_.rearBody.restore();
            }
            else
            {
               outputText("[pg]你感到肩胛骨之间一阵发痒，似乎有什么东西正在那里生长。你扭曲着身体，试图抓挠以缓解不适，却徒劳无功。当你感觉到有什么新东西从身体里长出来时，一种如释重负的感觉油然而生。你急忙脱下" + Utils.cnName(_loc2_.get_armorName()) + "的上半部分，惊奇地发现一对蜜蜂般的小翅膀从你的背上长了出来。你温柔地活动着新的肌肉，发现自己可以非常快地拍打它们。不幸的是，你似乎无法将你的小翅膀拍打得足够快以至于能够飞行，但它们肯定能减缓坠落的速度。对你的" + Utils.cnName(_loc2_.get_armorName()) + "进行了一些快速的修改后，你准备好带着<b>你新的蜜蜂翅膀</b>继续你的旅程了。");
            }
            set_changes(get_changes() + 1);
            _loc2_.wings.type = 1;
         }
         if(get_changes() < get_changeLimit() && (_loc2_.wings.type == 6 || _loc2_.wings.type == 7))
         {
            set_changes(get_changes() + 1);
            outputText("[pg]你的恶魔翅膀像果冻一样泛起涟漪。你担忧地回过头去看，令你恐惧的是，它们正在融化！琥珀色的蜂蜜顺着翅膀的边缘流下，汇聚成稳定的水流。<b>片刻之后，你翅膀唯一的残余就是泥土里的一滩蜂蜜</b>。甚至连那滩蜂蜜也在几秒钟内消失了，被干燥的土壤吸收。");
            _loc2_.wings.type = 0;
         }
         if(Utils.rand(4) == 0 && _loc2_.hasGills() && get_changes() < get_changeLimit())
         {
            get_mutations().updateGills();
         }
         if(_loc4_)
         {
            _loc5_ = 1;
            if(_loc2_.hasCock())
            {
               if(_loc2_.cocks[0].cArea() >= 140)
               {
                  _loc5_ -= 0;
               }
               if(_loc2_.cocks[0].cArea() >= 180)
               {
                  _loc5_ -= 0;
               }
               if(_loc2_.cocks[0].cArea() >= 220)
               {
                  _loc5_ -= 0;
               }
               if(_loc2_.cocks[0].cArea() >= 260)
               {
                  _loc5_ -= 0;
               }
               if(_loc2_.cocks[0].cArea() >= 300)
               {
                  _loc5_ -= 0;
               }
               if(_loc2_.cocks[0].cArea() >= 400)
               {
                  _loc5_ -= 0;
               }
            }
            if(!_loc2_.hasCock())
            {
               outputText("[pg]当药效开始集中在你的腹股沟时，你痛得弯下了腰。你需要释放，但你现有的器官根本无济于事。你倒在地上，抓住自己的胯部，拼命想要得到你需要的释放。终于，它发生了。伴随着突然爆发的强烈解脱感和性满足感，一根新的人类阴茎从你的皮肤中破茧而出，将你的精液喷洒在你面前的地上。当你能够恢复过来并看一眼你的新器官时。<b>你现在有了一根八英寸长的人类肉棒，对刺激非常敏感。</b>");
               _loc2_.createCock();
               _loc6_ = Utils.rand(3);
               _loc2_.cocks[0].cockLength = _loc6_ + 8;
               _loc2_.cocks[0].cockThickness = 2;
               _loc2_.orgasm("Dick");
               dynStats(DynStat.Sens(10));
            }
            else if(int(_loc2_.cocks.length) > 1)
            {
               _loc6_ = _loc2_.biggestCockIndex();
               outputText("[pg]蜂蜜的药效向你的腹股沟移动，进入你的[cocks]，使它们挺立起来。它们颤抖了片刻，感觉相当痒。突然，你被快感淹没了，因为<b>你的" + _loc2_.cockDescript(_loc6_) + "被吸收进了你的" + _loc2_.cockDescript(0) + "中！</b>你抓住正在融合的肉棒，用手套弄着它，随着它尺寸的增加，你在快感中射精了。你的[cock]现在似乎敏感多了……");
               _temp_6.cockLength += 5 * Math.sqrt(0.2 * _loc2_.cocks[_loc6_].cArea());
               _temp_7.cockThickness += Math.sqrt(0.2 * _loc2_.cocks[_loc6_].cArea());
               _loc2_.removeCock(_loc6_,1);
               _loc2_.orgasm("Dick");
               dynStats(DynStat.Sens(5));
            }
            else if(_loc2_.cocks[0].cArea() < 100)
            {
               outputText("[pg]你的" + _loc2_.cockDescript(0) + "突然变得坚硬如石，并且对触摸异常敏感。你拉开你的[armor]，开始疯狂地自慰，因为它正在迅速膨胀。当变化最终结束时，你意识到你的[cock]变得更长更粗了！<b>");
               if(_loc2_.cocks[0].cArea() <= 20)
               {
                  outputText("它现在垂到了你的膝盖！");
               }
               else if(_loc2_.cocks[0].cArea() <= 50)
               {
                  outputText("勃起时，你巨大的阴茎占据了你下半部分的视野。");
               }
               else
               {
                  outputText("你的阴茎现在简直大得惊人，你想知道到底有什么东西能容纳你现在的巨大尺寸？");
               }
               outputText("</b>");
               _loc2_.increaseCock(0,(Utils.rand(3) + 4) * _loc5_);
               _loc2_.cocks[0].thickenCock((0.1 * Utils.rand(5) + 0.5) * _loc5_);
               dynStats(DynStat.Sens(5));
            }
            else if(_loc2_.cocks[0].get_cockType() != CockTypesEnum.BEE && _loc2_.get_race() == "bee-morph")
            {
               outputText("[pg]你的巨大肉棒突然开始疼痛，尤其是顶端。与此同时，你感觉到你的整根肉棒变得异常敏感，根部开始发痒。你扯下你的[armor]，着迷地看着你的[cock]开始发生变化。肉棒的主干变成了黑色，摸起来坚硬而光滑，而根部则长出了一圈四英寸长的黄色蜂毛。随着变形的继续，你的肉棒变得比以前更大了。然而，最吸引你注意力的还是顶端，因为周围长出了一层更细的黄色短毛。现在你关心的不是它的外观，而是充满其中的疼痛。[pg]");
               outputText("这与你平时喝下变形物质后肉棒变大时的感觉完全不同。当变化停止时，顶端的形状就像典型的人类蘑菇头，上面覆盖着细细的蜂毛，但感觉完全不像你想象中的人类阴茎。你的整根肉棒都异常敏感，触摸它会给你带来难以置信的刺激，但你确信无论你怎么摩擦，你都无法自己射精。你想要冰凉的蜂蜜覆盖它，你想要紧致的肉壁包裹它，你想要用它使数百个卵受精。这些欲望几乎压倒了一切，你需要极大的意志力才能克制住自己，不立刻跑去找那个给你这种特殊蜂蜜的蜂女。这可不太妙。[pg]");
               outputText("<b>你现在拥有了一根蜜蜂肉棒！</b>");
               _loc2_.cocks[0].set_cockType(CockTypesEnum.BEE);
               _loc2_.increaseCock(0,5 * _loc5_);
               _loc2_.cocks[0].thickenCock(_loc5_);
               dynStats(DynStat.Sens(15));
            }
            else
            {
               if(_loc5_ > 0)
               {
                  outputText("[pg]这次蜂蜜的效果似乎并没有集中在你的腹股沟上，但你仍然感觉到你的[cock]在你的[armor]下稍微变大了一点。");
                  _loc2_.increaseCock(0,(0.1 * Utils.rand(10) + 1) * _loc5_);
                  _loc2_.cocks[0].thickenCock((0.1 * Utils.rand(2) + 0.1) * _loc5_);
               }
               else
               {
                  outputText("[pg]这次蜂蜜的效果似乎并没有集中在你的下半身，你感觉你的[cock]一点也没长！也许你已经达到了特殊蜂蜜能让你鸡巴生长的上限？");
               }
               dynStats(DynStat.Sens(3));
            }
            if(_loc2_.cor >= 5)
            {
               outputText("[pg]你的头脑感觉出奇的清醒，最近一直困扰你的扭曲想法一扫而空，但你发现自己比平时更容易发情了。");
               _loc6_ = int(Math.min(0.1 * _loc2_.cor + 5,_loc2_.cor));
               dynStats(DynStat.Cor(-_loc6_),DynStat.Lib(_loc6_));
            }
            else
            {
               outputText("[pg]你发现你的思绪飘到了每天用你的肉棒给成百上千个卵受精的想法上。你摇了摇头，这个离奇的幻想让你完全措手不及。");
               dynStats(DynStat.Cor(0,DynStatOp.Eq),DynStat.Lib(5));
            }
            if(_loc2_.get_femininity() >= 60 || _loc2_.get_femininity() <= 40)
            {
               outputText("[pg]你的脸型发生了变化，变得更加中性化。");
               if(_loc2_.get_femininity() >= 60)
               {
                  _loc2_.set_femininity(_loc2_.get_femininity() - 3);
               }
               else
               {
                  _loc2_.set_femininity(_loc2_.get_femininity() + 3);
               }
            }
            dynStats(DynStat.Lust(0.2 * _loc2_.lib + 5));
         }
         var _loc7_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc7_,2077,FlagDict_Impl_.arrayReadInt(_loc7_,2077) + get_changes());
         return false;
      }
      
      override public function canUse() : Boolean
      {
         if(get_value() == 20 && get_player().statusEffectv1(StatusEffects.Exgartuan) == 1)
         {
            outputText("你刚拔开瓶塞，就听到艾克斯加图安突然开口了。[say: 嘿，孩子，这根漂亮的鸡巴不需要那些特别的蜜蜂屎。现在就把瓶塞塞回去，不然我就让你除了我什么都喝不了。]你无奈地叹了口气，把瓶塞塞回了瓶子里。");
            return false;
         }
         return true;
      }
   }
}

