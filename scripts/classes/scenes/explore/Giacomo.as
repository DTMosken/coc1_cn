package classes.scenes.explore
{
   import classes.BaseContent;
   import classes.CoC;
   import classes.DynStat;
   import classes.PerkLib;
   import classes.Player;
   import classes.StatusEffects;
   import classes.TimeAwareInterface;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.display.SpriteDb;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.items.ConsumableLib;
   import classes.items.UseableLib;
   import classes.scenes.Camp;
   import classes.scenes.Inventory;
   import coc.view.CoCButton;
   import flash.Boot;
   import haxe.IMap;
   
   public class Giacomo extends BaseContent implements TimeAwareInterface
   {
      
      public var checkedSuccubi:int;
      
      public function Giacomo()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         checkedSuccubi = 0;
         super();
         CoC.timeAwareClassAdd(this);
      }
      
      public function wormRemovalOffer() : void
      {
         spriteSelect(SpriteDb.get_s_giacomo());
         outputText("[pg][say: 看来你招惹了不该招惹的生物，]他轻笑着说，[say: 任何形式的寄生都很烦人，但考虑到这附近堕落生物的数量，你的处境相当棘手。这可不是我第一次看到有人被那些蠕虫寄生了。][pg]");
         outputText("你问他是怎么知道你的变化的，商人开怀大笑起来。[pg]");
         outputText("[say: 别用那种看神秘主义者的眼神看着我。]贾科莫轻轻地打趣道。[say: 你的裤裆在蠕动。][pg]");
         outputText("低头一看，你意识到他说得有多对，尴尬地试图遮掩自己。[pg]");
         outputText("[say: 别怕！]商人叮当响着身上的饰品说道。[say: 我有东西能治好你身上的那些小畜生。当然，它也有可能顺便清理一下你的整个身体系统。这药水可不便宜。我要[b:175颗宝石]才卖。][pg]");
         menu();
         if(get_player().get_gems() >= 175)
         {
            outputText("你要购买他的解药吗？");
            addButton(0,"是",wormRemoval);
         }
         else
         {
            outputText("你意识到自己没有足够的宝石来买这么昂贵的药水，但也许他库存里还有其他你能买得起的东西。");
            addButtonDisabled(0,"是","你买不起这个！");
         }
         addButton(1,"否",giacomoEncounter);
      }
      
      public function wormRemoval() : void
      {
         spriteSelect(SpriteDb.get_s_giacomo());
         clearOutput();
         outputText("你把宝石扔给贾科莫，他平静地把瓶子递给你。大口吞下液体，你的肠子像吞了火一样亮了起来。疼痛淹没了你的身体，你跪倒在地，浑身抽搐。你咒骂这个[if (silly) {(((商人)))|商人}]毒害你，但你只能在呻吟中含糊不清地吐出胡言乱语。");
         if(get_player().hasStatusEffect(StatusEffects.Infested))
         {
            outputText("随着你体内的蠕虫显然对你的所作所为感到不满，疼痛迅速从你的胃部集中到你的胯部。当剧烈的挣扎淹没你时，你仰面倒下。伴随着意想不到的高潮，你体内的每一条蠕虫都在努力逃离你的性腺。那条居住在你性器官深处的肥大蠕虫最后懒洋洋地把自己推了出来。[pg]");
         }
         outputText("一看到这个生物，贾科莫就表现出一种反常的敏捷，他从车上跳下来，抓起一个空容器，把它收集起来。恢复理智后，你用一种好奇而震惊的眼神看着他刚才的举动。[pg]");
         outputText("[say: 你必须意识到，我毕竟是个商人，] 他平静地回答。[say: 对你来说是地狱，对别人来说就是天堂。这个小家伙很容易就能卖给某个寻找快速刺激的贵族10,000颗宝石。我们难道不知道得更清楚吗！][pg]");
         outputText("那人收起他的战利品，回来扶你起来。[say: 给，] 他说着，把一个瓶子塞进你手里。[say: 这是免费的。在经历了把那些东西弄出来的震惊之后，你可能需要它。][pg]");
         if(get_player().get_HP() > int(get_player().maxHP() * 0.15))
         {
            get_player().set_HP(int(get_player().maxHP() * 0.15));
         }
         get_player().removeStatusEffect(StatusEffects.ParasiteSlug);
         get_player().removeStatusEffect(StatusEffects.Infested);
         get_player().removePerk(PerkLib.ParasiteMusk);
         get_player().removeStatusEffect(StatusEffects.ParasiteSlugReproduction);
         dynStats(DynStat.Lib(-1),DynStat.Lust(-99),DynStat.Cor(-4));
         var _loc1_:Player = get_player();
         _loc1_.set_gems(_loc1_.get_gems() - 175);
         statScreenRefresh();
         get_inventory().takeItem(get_consumables().VITAL_T,get_camp().returnToCampUseOneHour);
      }
      
      public function timeChangeLarge() : Boolean
      {
         §§push(false);
         §§push(false);
         §§push(false);
         var _loc1_:int;
         checkedSuccubi = (_loc1_ = checkedSuccubi) + 1;
         if(_loc1_ == 0)
         {
            §§pop();
            §§push(get_game().time.hours == 4);
         }
         if(§§pop())
         {
            §§pop();
            §§push(get_player().hasStatusEffect(StatusEffects.SuccubiNight));
         }
         if(§§pop())
         {
            §§pop();
            §§push(get_player().hasCock() || get_player().get_gender() == 0);
         }
         if(§§pop())
         {
            if(get_player().hasStatusEffect(StatusEffects.RepeatSuccubi))
            {
               if(get_game().vapula.vapulaSlave() && get_player().hasCock() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,547) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1084) == 0)
               {
                  get_game().vapula.vapulaAssistsCeruleanSuccubus();
               }
               else
               {
                  nightSuccubiRepeat();
               }
            }
            else
            {
               nightSuccubiFirstTime();
               get_player().createStatusEffect(StatusEffects.RepeatSuccubi,0,0,0,0);
            }
            if(get_player().statusEffectv1(StatusEffects.SuccubiNight) > 1)
            {
               get_player().addStatusValue(StatusEffects.SuccubiNight,1,-1);
            }
            else
            {
               get_player().removeStatusEffect(StatusEffects.SuccubiNight);
            }
            return true;
         }
         return false;
      }
      
      public function timeChange() : Boolean
      {
         var _loc1_:* = null as IMap;
         checkedSuccubi = 0;
         if(get_game().time.hours > 23)
         {
            if(FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,61) > 0)
            {
               _loc1_ = KFLAGS.flags;
               FlagDict_Impl_.arrayWriteFloat(_loc1_,61,FlagDict_Impl_.arrayReadFloat(_loc1_,61) - 0.5);
            }
         }
         return false;
      }
      
      public function potionMenu() : void
      {
         spriteSelect(SpriteDb.get_s_giacomo());
         clearOutput();
         outputText("你要查看哪种药水或酊剂？");
         menu();
         addButton(0,"活力酊剂",pitchVitailtyTincture).hint("据说这种强效茶有助于强健身体。","活力酊剂");
         addButton(1,"学者茶",pitchScholarsTea).hint("据说这种强效的饮品具有强化心智的效果。","学者茶");
         if(!get_player().isFemale())
         {
            addButton(2,"蔚蓝药水",pitchCeruleanPotion).hint("这是一个神秘的瓶子，里面装满了天蓝色的液体，在里面轻轻晃动。据说它会让你变得无法抗拒，虽然你不知道是对什么或对谁。","蔚蓝药水");
         }
         else
         {
            addButtonDisabled(2,"蔚蓝药水","这种药水对女性没用。","蔚蓝药水");
         }
         addButton(14,"返回",giacomoEncounter);
         statScreenRefresh();
      }
      
      public function pitchYogaGuide() : void
      {
         spriteSelect(SpriteDb.get_s_giacomo());
         clearOutput();
         outputText("贾科莫带着些许敬意举起这本书。封面是皮革的，字母是手工缝制的。[pg]");
         outputText("[say: 这个，我的朋友，]他开始说，[say: 确实是一本奇怪的书。这是我在东方换来的，那里的人练习一种叫做“瑜伽”的运动。这本书特别涉及那些，我们应该说，体型不寻常的人。因为它的稀有性和实用性，我不能以低于[b:100颗宝石]的价格卖掉它，相信我，这个价格我简直是在割自己的喉咙。想开阔一下眼界吗？]");
         menu();
         if(get_player().get_gems() >= 100)
         {
            addButton(0,"是",buyYogaGuide);
         }
         else
         {
            addButtonDisabled(0,"是","你买不起这个！");
         }
         addButton(1,"否",bookMenu);
      }
      
      public function pitchVitailtyTincture() : void
      {
         spriteSelect(SpriteDb.get_s_giacomo());
         clearOutput();
         outputText("贾科莫举起物品说道，[say:啊，是的！这是所有旅行者必备的灵丹妙药，这小瓶蒸馏过的生命精华将帮助你在旅途中恢复精力，如果你受伤了，它还能帮助身体自我修复。是的，[madam]，这对朝圣者和冒险家来说都是液体黄金。有兴趣吗？只要[b:15颗宝石]。]");
         menu();
         if(get_player().get_gems() >= 15)
         {
            addButton(0,"是",buyVitailtyTincture);
         }
         else
         {
            addButtonDisabled(0,"是","你买不起这个！");
         }
         addButton(1,"否",potionMenu);
      }
      
      public function pitchTravelersGuide() : void
      {
         spriteSelect(SpriteDb.get_s_giacomo());
         clearOutput();
         outputText("贾科莫举起一本不起眼的小册子。[say: 作为一个经验丰富的旅行者，你可能觉得这东西没什么价值，]他开口道，[say: 但你永远不知道能从这本实用的小册子里学到什么！这本册子是为新手准备的，强调了外出闯荡所需的物品和一些实用的经验法则。你可能不需要它，但你可能认识需要它的人。既然答案都在这本方便的小册子里，何必浪费时间呢！我给你个超低价，只要[b:1颗宝石]！]");
         menu();
         if(get_player().get_gems() >= 1)
         {
            addButton(0,"是",buyTravelersGuide);
         }
         else
         {
            addButtonDisabled(0,"是","你买不起这个！");
         }
         addButton(1,"否",bookMenu);
      }
      
      public function pitchSelfStimulationBelt() : void
      {
         spriteSelect(SpriteDb.get_s_giacomo());
         clearOutput();
         outputText("贾科莫举起一个看起来像贞操带的东西。然而，这个装置的内侧连着一根假阳具。外面有一个小齿轮箱，上面拴着一把发条钥匙。[pg]");
         outputText("这个疯狂的商人举起这个装置，开始了他的长篇大论。[say: 啊！一位既懂得欣赏快感，又懂得欣赏精巧工艺奇迹的人。这件调皮的小首饰旨在取悦任何女性，只需按下按钮！你要做的就是拿起这把钥匙，给齿轮箱上发条……]贾科莫拿起钥匙插进盒子里，像给手表上发条一样转动它。然后他指着一个开关。[say: ……然后你按下这个按钮，好好享受吧！]贾科莫拨动开关，假阳具开始快速震动。玩具发出的独特嗡嗡声和齿轮的呼呼声激发了你的想象力。贾科莫突然开口，打断了你的思绪。[say: 这条腰带可不便宜，但它绝对值得你投资[b:30颗宝石]！]");
         menu();
         if(get_player().get_gems() >= 30)
         {
            addButton(0,"是",buySelfStimulationBelt);
         }
         else
         {
            addButtonDisabled(0,"是","你买不起这个！");
         }
         addButton(1,"否",eroticaMenu);
      }
      
      public function pitchScholarsTea() : void
      {
         spriteSelect(SpriteDb.get_s_giacomo());
         clearOutput();
         outputText("贾科莫举起一袋干燥、芳香的叶子，开始了他的推销，[say:你有没有想过学者和其他聪明人是如何长时间保持如此高强度的脑力劳动的？他们用这种优质植物和草药的精细混合物泡茶。这神秘的草药混合物以橙黄白毫为基底，绝对是最好的，除了笨蛋，任何人喝了它都能变得像这片土地上最聪明的人一样聪明。你所要做的就是把叶子泡在水里，然后喝下去！无论是热的还是冷的，直接喝还是加蜂蜜，只要有了它作为燃料，你的大脑就会飞速运转。现在购买，我还免费赠送滤茶器！有兴趣吗？只要[b:15颗宝石]！]");
         menu();
         if(get_player().get_gems() >= 15)
         {
            addButton(0,"是",buyScholarsTea);
         }
         else
         {
            addButtonDisabled(0,"是","你买不起这个！");
         }
         addButton(1,"否",potionMenu);
      }
      
      public function pitchOnahole() : void
      {
         spriteSelect(SpriteDb.get_s_giacomo());
         clearOutput();
         outputText("贾科莫从包里拿出一个粉红色的圆筒。它的一端似乎是密封的，盖子顶部有一块带有垂直裂缝的橡胶。[pg]");
         outputText("[say: 朋友，]贾科莫开口道，[say: 当你不想经历那些破事去泡妞时，这东西就是为你准备的。它从不说不，从不抱怨，也绝不会在离婚时拿走你所有的财产。你所要做的就是勃起，把你的鸡巴塞进裂缝里，按照你的节奏抽插，然后释放。就是这么简单。把盖子拿下来方便清洗，然后就搞定了！如你所见，它便于携带，而且比冒着从某个放荡的酒吧女招待那里染上社交疾病的风险要安全得多。我这里有很多存货，[b:20颗宝石]就可以卖给你。你觉得怎么样？]");
         menu();
         if(get_player().get_gems() >= 20)
         {
            addButton(0,"是",buyOnahole);
         }
         else
         {
            addButtonDisabled(0,"是","你买不起这个！");
         }
         addButton(1,"否",eroticaMenu);
      }
      
      public function pitchHentaiComic() : void
      {
         spriteSelect(SpriteDb.get_s_giacomo());
         clearOutput();
         outputText("贾科莫从包里拿出一本色彩鲜艳的杂志。封面上画着身材火辣、摆着性感姿势的女人。[pg]");
         outputText("[say: 也许您的阅读口味更原始一些，我亲爱的]" + get_player().mfn("先生","女士","……呃，不管你是什么") + "，[say: 他说。这本杂志来自遥远的东方，讲述了一群追求无尽快乐的女士们的俗气故事。每一页都有半打图片来描绘她们的轻微过失，您的激情将被点燃，并希望加入这些幻想中的狐狸精的冒险！极具收藏价值，需求量很大，即使不合您的口味，您也可以轻松转手获利！想去幻想的领域冒险吗？只要[b:10颗宝石]，这个价格我可是帮了您大忙了。]");
         menu();
         if(get_player().get_gems() >= 10)
         {
            addButton(0,"是",buyHentaiComic);
         }
         else
         {
            addButtonDisabled(0,"是","你买不起这个！");
         }
         addButton(1,"否",bookMenu);
      }
      
      public function pitchDualStimulationBelt() : void
      {
         spriteSelect(SpriteDb.get_s_giacomo());
         clearOutput();
         outputText("当你在他的商品中翻找并看到一个奇怪的装置时，贾科莫咧嘴笑了。[pg]");
         outputText("[say: 啊，我看到你已经发现了我们最新的设备。第三性别的成员很难找到足够的快感来满足他们的特殊需求。有了这个小装置，你再也不用担心无法满足你的需求了。] 他对你咧嘴大笑。[say: 豪华双重刺激带会让你在简单刺激带让你干涸数小时后，仍在性高潮的阵痛中颤抖。你会在这个东西里高潮，它会让你在任何需要性满足的时候跑回它身边。其他一切对你的皮肤来说都可能像砂纸一样。只需拨动侧面的这个开关启动它，就能让你升入天堂。只需[b:50宝石]的低价，你就能拥有它。] 他再次对你微笑。[say: 那么，我把它交给你好吗？]");
         menu();
         if(get_player().get_gems() >= 50)
         {
            addButton(0,"是",buyDualStimulationBelt);
         }
         else
         {
            addButtonDisabled(0,"是","你买不起这个！");
         }
         addButton(1,"否",eroticaMenu);
      }
      
      public function pitchDildo() : void
      {
         spriteSelect(SpriteDb.get_s_giacomo());
         clearOutput();
         outputText("贾科莫拿出一根大约半英尺多长的细长管子。[say: 既然你追求快感，这东西既简单又有效。这根假阳具足足有七英寸长，适合大多数女性，甚至适合喜欢冒险的男性。挑个洞，插进去，随心所欲地弄，或者让你的伴侣爽翻天。一体成型的设计让它坚固、耐用且直接。只需[b:20颗宝石]，你就能自己动手丰衣足食。怎么样？]");
         menu();
         if(get_player().get_gems() >= 20)
         {
            addButton(0,"是",buyDildo);
         }
         else
         {
            addButtonDisabled(0,"是","你买不起这个！");
         }
         addButton(1,"否",eroticaMenu);
      }
      
      public function pitchDeluxeOnahole() : void
      {
         spriteSelect(SpriteDb.get_s_giacomo());
         clearOutput();
         if(get_player().hasKeyItem("Deluxe Onahole"))
         {
            outputText("<b>你已经拥有一个豪华飞机杯了！</b>");
            doNext(eroticaMenu);
            return;
         }
         outputText("贾科莫举起一块形状怪异的橡胶块。它的一端被塑造成女性生殖器的形状，而其余部分则延伸到近一英尺长。[pg]");
         outputText("[say: 这东西简直太棒了！虽然标准的飞机杯也能让你爽，但这东西的外观和感觉都和真的一样！如你所见，外面的孔看起来就像女人的私处，而且]——贾科莫停下来，打开里面让你看。你看到了典型的女性子宫内部的褶皱和曲线——[say: 如你所见，为了让里面的感觉尽可能像真正的阴户，我们花了很多心思。你用这东西抽插几次，你可能就再也不想要真的了！至少，它不会抱怨你一大早就跑出门。[b:50颗宝石]换取它能带来的所有满足感，这价格再合理不过了。]");
         menu();
         if(get_player().get_gems() >= 50)
         {
            addButton(0,"是",buyDeluxeOnahole);
         }
         else
         {
            addButtonDisabled(0,"是","你买不起这个！");
         }
         addButton(1,"否",eroticaMenu);
      }
      
      public function pitchDangerousPlantsBook() : void
      {
         spriteSelect(SpriteDb.get_s_giacomo());
         clearOutput();
         outputText("贾科莫自豪地举起一本小册子。封面很朴素，没有任何插图。[pg]");
         outputText("[say: 学者们常说，]他开口道，[say: 知识就是力量。这是学者们说过的话里，我少数赞同的一句。在当今世界，如果你对它一无所知，是活不下去的。野兽和人类并不是你唯一的麻烦。这本书专门介绍这个王国里的危险植物。有些植物把你嚼碎吐出来的速度，比任何狼群或盗贼团伙都要快。只需区区[b:10颗宝石]，你就能从这本关于世上最恶毒花草的好书中受益。想拓宽一下你的学识吗？]");
         menu();
         if(get_player().get_gems() >= 10)
         {
            addButton(0,"是的",buyDangerousPlantsBook);
         }
         else
         {
            addButtonDisabled(0,"是","你买不起这个！");
         }
         addButton(1,"否",bookMenu);
      }
      
      public function pitchCondom() : void
      {
         spriteSelect(SpriteDb.get_s_giacomo());
         clearOutput();
         outputText("贾科莫举起那个小包说道：[say: 啊，对！这是避孕套。只要把它套在鸡巴上，你就可以随便插任何你想插的洞。保证能防止性病传播，还能避孕。不过我得警告你，它不能完全避孕——极少数情况下会失效，尽管它[i:确实]在大多数时候都很管用。所以，[b:10颗宝石]。你觉得怎么样？]");
         menu();
         if(get_player().get_gems() >= 10)
         {
            addButton(0,"是的",buyCondom);
         }
         else
         {
            addButtonDisabled(0,"是","你买不起这个！");
         }
         addButton(1,"否",eroticaMenu);
      }
      
      public function pitchCeruleanPotion() : void
      {
         spriteSelect(SpriteDb.get_s_giacomo());
         clearOutput();
         outputText("贾科莫滑稽地回头张望了一下，然后举起一个天蓝色的瓶子。他咧嘴大笑，开始了他的推销：[say: 我的朋友，你真有眼光。即使是最成功的男人也会为了享乐和地位去吸引更多的女人。而这个，我的朋友，能吸引到最挑剔、最饥渴的女人。被这种极品药膏吸引的女人绝不会说不。我保证，每次你想要的时候，她都会渴望与你共赴巫山！不过得提醒你一句，兄弟。有人说这东西效果太好了。如果你不够男人，应付不了这瓶子招来的女人，你最好现在就说，我会给你推荐点别的。但如果你有这个胆量，这件小宝贝只要[b:75颗宝石]！]");
         menu();
         if(get_player().get_gems() >= 75)
         {
            addButton(0,"是",buyCeruleanPotion);
         }
         else
         {
            addButtonDisabled(0,"是","你买不起这个！");
         }
         addButton(1,"否",potionMenu);
      }
      
      public function pitchAllNaturalSelfStimulationBelt() : void
      {
         spriteSelect(SpriteDb.get_s_giacomo());
         clearOutput();
         outputText("商人把他的包放在地上。他把手伸进其中一个钱包，掏出一副手套。戴上后，他把手伸进包里，掏出一个看起来像贞操带的东西。这个装置的外观明显带有生物质感。前盖的中央有一个结节。你听说过类似的装置。它们通常连着一根假阳具，用来取悦女性。[pg]");
         outputText("[say: 这台装置相当有意思，]贾科莫开口道。[say: 这台欢愉引擎绝非胆小者能驾驭之物。它采用生物机械工匠工坊的特殊材料打造，方方面面都碾压它那些纯机械的表亲。保证比你的耐力更持久，这台机器能带给你无数次令大脑融毁的绝顶高潮，直到你彻底承受不住为止。和机械腰带不同，你完全不需要给它上发条。这是一项惊人的工程奇迹，它能直接汲取太阳的能量。每天只需晒四小时太阳！记住，如果连续几天没太阳，它就不工作了，得再晒满一整天才行。你大概在好奇我为什么戴着手套。这个嘛，是因为腰带上的那些感应垫。]贾科莫指了指腰带上几枚琥珀色的小感应垫。[say: 它们对人体触碰极其敏感，一碰就会启动腰带。这一切只需[b:40颗宝石]，手套免费送！重申一遍，这台装置能带给你极致的快感。如果你承受不住，直接拒绝我也不会介意的。]");
         if(get_player().hasKeyItem("Dangerous Plants") && get_player().get_inte() > 39)
         {
            outputText("[pg]刺激器的结节和底座看起来隐约有点像你在《危险植物》那本书里见过的一些东西。你想知道这件物品是不是有什么猫腻。贾科莫也在流汗。每年的这个时候，天气太凉爽了，不至于出汗。");
         }
         else if(get_player().get_inte() > 29)
         {
            outputText("[pg]你注意到贾科莫的态度发生了变化。他非常想把这个性玩具卖给你。这么奇特的东西，价格应该比他开的价高得多才对。");
         }
         outputText("[pg]你要购买全天然自刺激腰带吗？");
         menu();
         if(get_player().get_gems() >= 40)
         {
            addButton(0,"是",buyAllNaturalSelfStimulationBelt);
         }
         else
         {
            addButtonDisabled(0,"是","你买不起这个！");
         }
         addButton(1,"否",eroticaMenu);
      }
      
      public function pitchAllNaturalOnahole() : void
      {
         spriteSelect(SpriteDb.get_s_giacomo());
         clearOutput();
         outputText("贾科莫把手伸进包里，拿出一个看起来像长方形椰子的东西。它的直径大约有七英寸。一端有一个独特的开口，刚好够一根勃起的阴茎插入。在开口里面，你看到了两个看起来像粉红色垫子的东西。在这个东西的外部孔洞周围有多个对称的凹陷。贾科莫的笑容消失了，他换上了一种更严肃的态度，这与他那鹰钩鼻的脸很相称。[pg]");
         outputText("[say: [Mister]，]他说道，[say: 恕我直言，第三性别的成员能够完成让其他两个性别嫉妒发狂的性壮举，这已经不是什么秘密了。拥有比男人更大的鸡巴，射出的精液比大象还多，还有一个拥有人类手部力量和协调性的阴户；普通的玩具对你们这些人来说根本用不了多久。因此，就有了这个小野兽。我直截了当地告诉你，只有第三性别才能驾驭这个玩具。其他两个性别根本没有足够的体力。这东西是全天然的，这意味着它自己提供动力，并且是用工匠的有机方法制成的。如果不使用它，或者你没有每三天在开口处滴几滴这种液体，它就会停止运作。]贾科莫停下来，举起一个小瓶子。他把瓶子放下，继续他的推销，[say: 如果你不打算经常使用这东西，就不要买。这些物品非常罕见，这一个可能也是你唯一能见到的一个。通常，我会疯狂地推销我的产品。然而，对于这个，我不需要。这东西确实太好用了，你绝对会射精，毫无疑问。它会一直工作，直到你不想让它工作为止。除非它自己决定停止，否则它不会停下来。然而，对于一个可爱的双性人极端的性需求来说，它可能正是你所需要的。再说一次，这是为终极硬核玩家中的终极硬核玩家准备的。它只要区区[b:150颗宝石]，但对于超人的刺激来说，谁能给它标个价呢？]");
         if(get_player().hasKeyItem("Dangerous Plants") && get_player().get_inte() > 35)
         {
            outputText("[pg]在巧妙地避开贾科莫的怀疑的同时，你正确地推测出这个玩具根本不是玩具。它是一种动植物混合体的外壳。这个生物是活生生的。虽然这种野兽的学名是那种通常难以发音的学术胡言乱语，但它的俗称是“全天候吸盘”。它之所以得名，是因为它的饮食由高营养液体组成，尤其是精液。它既被用作折磨器具，也被势利的精英们用作取乐宠物，因为它会紧紧夹住人的阴茎，直到刺激那人射出足够的精液来喂饱它才会松开。然而，全天候吸盘会像跳蚤和蜱虫一样膨胀，因此需要数小时的刺激才能吃饱。关于这些东西还有一些别的细节，但你记不清到底是什么了。");
            if(get_player().get_inte() > 65)
            {
               outputText("[pg]过了一会儿，你确实想起了你读过的内容：与许多简单的野兽不同，这种生物有雌雄之分。这种生物本身类似于管虫。虽然雄性被认为是相当“安全”的，但雌性有一个令人作呕的习惯，那就是将幼体注入使用者的性器官内，让倒霉的人在无尽的、痛苦的高潮中抽搐，因为这些小野兽会在他们体内蠕动，直到它们准备好出生。这个过程大约需要一周的时间，有记录的受害者通常在经历了一段令人目眩的痛苦高潮并将幼体射出后，会完全康复。人们的心脏在幼体无尽的刺激下衰竭并不奇怪。由于这种压倒性的刺激会对身体产生压力，恢复时间相当长。一些极端的寻欢作乐者甚至会为了这种体验而主动寻找这些东西[if (silly) {，据说这比这段喋喋不休的说明还要令人兴奋和痛苦}]。");
               outputText("[pg]然而，问题是光看外表根本无法分辨它是雄性还是雌性。");
            }
         }
         menu();
         if(get_player().get_gems() >= 150)
         {
            addButton(0,"是",buyAllNaturalOnahole);
         }
         else
         {
            addButtonDisabled(0,"是","你买不起这个！");
         }
         addButton(1,"否",eroticaMenu);
      }
      
      public function nightSuccubiRepeat() : void
      {
         var _loc1_:* = null as IMap;
         spriteSelect(SpriteDb.get_s_cerulean_succubus());
         if(get_player().get_gender() == 0)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,62) == 0)
            {
               outputText("[pg]在你睡觉的时候，你的休息变得越来越不安稳。你感觉到身上压着巨大的重量，呼吸困难。你被唤醒了，映入眼帘的是一对巨大的、泛着蓝色的乳房。乳头相当长且粗，周围是巨大圆润的乳晕。[pg]");
               outputText("一个低沉的女性声音打破了沉默。[say:我还在想你什么时候会醒过来。]你转过头看向声音的来源，看到了一张五官分明、极具吸引力的女性面孔。她调皮地咧嘴一笑，再次开口说道，[say:我希望贾科莫那个白痴没有再次稀释“药水”。]你的营火照亮了女人的脸，她的美丽中包含了一些对比鲜明的特征。她的瞳孔像猫一样呈一条缝。当她咧嘴笑时，她露出了牙齿，里面有两对长短不一的獠牙。这个女人显然不是人类！震惊之余，你试图站起来，但这只促使女人抓住你的肩膀把你按在地上，从而证明了她非人的本质。你看到她手上的每根手指也有四个关节，进一步证明了她的身份。还没等你开口，女人就开始嘲笑你的恐惧，并把她的脸凑到你面前。她的脸几乎可以肯定是恶魔的模样。[pg]");
               outputText("她迅速把手伸向你的胯部……却发现那里没有任何器官。[pg]");
               outputText("*唱片刮擦声*[pg]");
               outputText("[say:等一下，]魅魔说道，[say:你的老二呢？！][pg]");
               outputText("当你声明自己是无性别的本质时，魅魔跳了下来，不知从哪里掏出一个标有[say:勇者的堕落-剧本]的大文件夹，开始翻阅书页。找到她要找的那一页后，她读了一下，然后厌恶地看向远方。[pg]");
               outputText("[say:嘿，Fenoxo和Dxasmodeus！！！！！！]魅魔大叫道，[say:这该死的剧本上说我应该榨干某个人的老二！！！男人、扶他、双性人，我才不在乎。你们自己写的该死的剧本上说我应该骑上去榨干一根肉棒！！！！这是一个性爱游戏！！！！！！这意味着做爱！我到底该操什么？？？！！！][pg]");
               outputText("魅魔极其轻蔑地看着你，[say:这个混蛋什么都没有！我该怎么办？！我总不能点一份该死的开心乐园餐吧！！！！！][pg]");
               outputText("她狂怒地把剧本摔在地上，继续发脾气，[say:妈的！我真不敢相信这破事！喂！！！！！实习生！！！！把我的长袍、阿司匹林和香烟拿来！！！！][pg]");
               outputText("魅魔走到几步外，一个穿着朴素、拿着剪贴板的女人递给她一包烟和一小瓶阿司匹林。她抓了一把止痛药，立刻点燃了一根烟。魅魔抽了几口，揉了揉太阳穴。[pg]");
               outputText("[say: 你们俩真是要了我的命！] 她明显很沮丧地抱怨道，[say: 我来给你们这些变态打工，是因为你们承诺有更多的变态可以让我吸食，结果你们就这么对我！我没法干了！][pg]");
               outputText("那个朴素的女人递给魅魔一件长袍，她粗鲁地穿上，然后气冲冲地走进了夜色中。[pg]");
               outputText("[say: 我会和我的经纪人谈谈这件破事的。] 魅魔继续抱怨，[say: 这可不在我的合同里。][pg]");
               outputText("魅魔停下脚步，转过身，嘲笑地指着你。[say: 还有你！你这个没鸡巴没逼的废物！在他们发现你逃跑之前，赶紧滚回实验室去！！！！！][pg]");
               outputText("魅魔继续气冲冲地离开。你看着那瓶蔚蓝药水，怀疑里面是不是真的有什么精神药物。刚才到底发生了什么鬼？！");
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,62,1);
            }
            else
            {
               outputText("[pg]当你开始放松下来时，你听到身后传来了脚步声，你期待着那个邪恶的闯入者，并祈祷能有一个更好……更善解人意……的遭遇。[pg]");
               outputText("你转过身，希望能有一场刺激的邂逅，结果却发现一个相当矮小、相貌平平的女人，戴着角质框眼镜，穿着紫色连衣裙。她手里似乎拿着一叠文件。[pg]");
               outputText("[say: 咳咳，] 女人怯生生地说，[say: 我不想打扰你，但我是被 CoC 的编剧和工作人员派来把这个交给你的。][pg]");
               outputText("你挠了挠头，询问这份文件是什么。女人害羞地笑了笑，把它递给了你。[pg]");
               outputText("[say: 这是《勇者的堕落》的剧本和制作笔记，] 她带着一丝自豪说道，[say: 显然，你需要阅读高亮部分。它们很重要。][pg]");
               outputText("你接过剧本，对这一刻的超现实感感到困惑，挠了挠头。你翻阅着书页，发现你生活和遭遇的几乎每一个方面都被写了下来，就好像被伟大的神秘主义者预见了一样。这种准确性简直令人毛骨悚然。你找到了一个高亮部分，似乎就是女人所指的内容。笔记简短而直白。[pg]");
               outputText("[say: 无性别的角色就是个笑话。如果遭遇涉及性，期待会发生一些操蛋的事情。扮演无性别角色的演员应该期待只为了搞笑而玩。][pg]");
               outputText("这种震惊是压倒性的。剧本基本上是在说你永远不会有喘息的机会。当这个现实笼罩着你时，剧本消失了，你听到四面八方传来一阵嘲笑的刺耳声音。那个女人也不见踪影。[pg]");
               outputText("随着刺耳的声音逐渐消失，你只听到一个带有滑稽语调的词，[pg]");
               outputText("[say: <b>有问题吗？</b>]");
            }
            doNext(playerMenu);
            return;
         }
         get_player().orgasm("Generic");
         dynStats(DynStat.Cor(2));
         if(get_player().get_gender() == 1)
         {
            if(get_player().cor < 66)
            {
               outputText("[pg]违背了你更好的判断，你再次饮用了蔚蓝药水并睡着了。你很快被一个粗大的乳头塞进嘴里而惊醒，大量的母乳涌入你的喉咙，魅魔回来对你为所欲为了。抬起头，你的目光与她相遇，她蓝色的脸上挂着饥渴而充满控制欲的笑容。无法控制你的欲望，你的肉棒立刻立正，这促使恶魔");
               if(get_player().isTaur())
               {
                  outputText("蹲在你的双腿之间，将她自己刺穿在你的[cock]上，她那润滑良好的外阴发出湿润的声音。你");
               }
               else
               {
                  outputText("打开她的子宫，迅速吞噬你的[cock]。她拥抱着你，将你的头困在她的乳沟里，当你");
               }
               outputText("你很快感觉到她超人的阴道肌肉在运动，抚摸着你的[cock]，比任何人类女性或双手所能达到的都要好。你无能为力，因为你们邪恶的拥抱在一种地狱般的放荡交响乐中榨取着你们俩。即将射精的熟悉痉挛抓住了你，你的抽搐向魅魔发出了你即将达到高潮的信号。[pg]");
               if(get_player().isTaur())
               {
                  outputText("她推着你的前腿，将你的[cock]吞没得更深");
               }
               else
               {
                  outputText("她用双腿缠住你的身体，几乎要夹碎你的骨盆");
               }
               outputText("，她的肌肉无情地翻滚着，要求你像她释放到你体内一样，自由地释放你的“乳汁”。受到超越任何人类控制能力的刺激，你用力向下压，在魅魔体内释放出你自己的乳白色洪水。她在狂喜中呻吟着，她");
               if(get_player().isTaur())
               {
                  outputText("在你的腹部下方弓起身体，你感觉到你的[cock]在她体内愉悦地弯曲，并且");
               }
               else
               {
                  outputText("松开了对你的钳制，让你终于能深吸一口气，她向后仰去，高高弓起身体，在月光下露出你们结合在一起的生殖器。你清楚地看到");
               }
               outputText("她的收缩像女仆挤牛奶一样猛烈地榨取着你的[cock]！又一股精液从你体内喷涌而出，你发出一声夹杂着愉悦与疲惫的呻吟。[pg]");
               outputText("在你即将昏过去的时候，你感觉到魅魔在你的嘴唇上留下了一个深吻。[say:我们每次结合，你的味道都变得更好。快点召唤我，免得我强行从你这里拿走我想要的，]这个充满欲望的生物说道。[pg]");
               outputText("疲惫感袭来，你陷入了沉睡。");
            }
            else
            {
               outputText("[pg]知道魅魔会来，你甚至懒得尝试睡觉。相反，你为她准备了一个小惊喜。你短暂地自慰并开始边缘化自己，准备一大批精液卸在她体内。希望她能得到比她预想的更多的东西。[pg]");
               outputText("魅魔如你所料地来了。尽管她明显比你强壮且体型更大，你还是抓住她，把她推倒在地，并立刻将你愤怒的肉棒推入她毛茸茸的洞穴。魅魔既惊讶又着迷，对你的攻击性笑了起来。[pg]");
               outputText("[say:我还以为我才是那个饥渴的人呢，]她轻笑着。[say:我全是你的了，小男人。喂饱我！][pg]");
               outputText("你开始挺动你的");
               if(get_player().isTaur())
               {
                  outputText("侧腹");
               }
               else
               {
                  outputText("臀部");
               }
               outputText("，以极其熟悉的节奏，猛烈地撞击着魅魔的小穴。对你的主动感到印象深刻，她选择保持顺从，任由你积攒出惊人分量的精液。你用尽全力，痛苦地继续忍住高潮，同时继续刺激你那非人类的情人。[pg]");
               outputText("然而，她察觉到了你的控制，立刻将她自己的肌肉也加入到这场小小的爱情游戏中。只需一次用力的挤压，她就击溃了你所有的控制和抵抗。感觉到你即将爆发，她");
               if(get_player().isTaur())
               {
                  outputText("推着你的前腿，将自己更深地刺穿在你的[cock]上");
               }
               else
               {
                  outputText("用双腿缠住你的臀部并用力压下");
               }
               outputText("。你感觉到你的肉棒头部穿过了她子宫颈扩张的开口，子宫颈立刻收缩并紧紧裹住你的龟头。你的阴茎真的被困在了她的子宫里！[pg]");
               outputText("伴随着大声的呻吟，长时间的肌肉痉挛将痛苦储存的精液释放到魅魔的最深处。你滚烫的精液在她体内如此深处的感觉触发了她的高潮。");
               if(get_player().isTaur())
               {
                  outputText("她发出非人的呻吟，本能地将爪子刺入你的前腿。在欲望的灼烧下，这点疼痛对你来说算不了什么，你只能感觉到自己的身体正将体液强行挤出，注入她的体内。你将你的[cock]紧紧贴向她");
               }
               else
               {
                  outputText("她抱住你，发出非人的呻吟，本能地将爪子刺入你的后背。在欲望的灼烧下，这点疼痛对你来说算不了什么，你只能感觉到自己的身体正将体液强行挤出，注入她的体内。你将骨盆狠狠撞向她");
               }
               outputText("，仿佛要逼迫自己射得比平时更猛烈，这也引起了她同样愉悦的反应。[pg]");
               outputText("自从你开始接受她的“拜访”以来，这只魅魔第一次显得有些气喘吁吁。她一言不发，肌肉松开了你的阴茎，然后迅速将上面混合的汁液舔得干干净净。她用舌头舔了舔你的脸，以示充满欲望的赞许，随后便飞走了。你很快就睡着了，精疲力尽。");
               dynStats(DynStat.Lib(-1));
            }
         }
         else if(get_player().get_gender() == 3)
         {
            if(FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,61) > 10 && get_player().cor > 50)
            {
               outputText("[pg]当魅魔骑到你身上时，一种无法控制的冲动占据了你的身心。你毫不犹豫地将她的一侧乳头含入嘴里，像个新生儿一样疯狂地吮吸起来。当你开始从她那里进食时，魅魔发出了震惊又愉悦的叫声，并迅速开始了她那仪式般的榨精。温暖的乳汁流入你的嘴里，顺着喉咙咽下，平静地落入你的胃中。从她乳房中获得的满足感，唯有前列腺里那股胀痛的巨量精液才能盖过。");
               if(get_player().balls > 0)
               {
                  outputText("甚至你的睾丸也酸痛得难以忍受。");
               }
               outputText("当魅魔乳房中的乳汁开始干涸时，你摆脱了控制，将不可思议的巨量精液射入了魅魔体内。恶魔松开了你的肉棒，从你的胯部跳下，将嘴凑到你喷射的阴茎上。你本能地抓住她的头，将肉棒尽可能深地推入她的嘴里，在接下来的几分钟里，将一股又一股滚烫的欲望泵入她的喉咙。当最后一股精液离开你的肉棒后，你晕了过去。[pg]");
               outputText("过了一小会儿，你醒了过来，浑身上下酸痛不已。魅魔坐在你旁边，脸上带着极其满足的神情。[pg]");
               outputText("[say: 哎呀，这可真是出乎意料，] 她说道。[say: 我没想到你会发生变化。通常来说，男人很容易受到我乳汁的影响，但显然它对扶他也起作用。][pg]");
               outputText("当你站起来时，你感到一阵尴尬，因为你的身体感觉不太对劲。你看着魅魔，她看起来不再像以前那么高大了。你很快意识到了问题，在营地的一个小水桶里看了看自己的倒影。除了你自己独特的面部特征外，你看到的是另一只蔚蓝魅魔在回望着你！你变成了一只蔚蓝魅魔！");
               if(get_player().horseScore() + get_player().dogScore() + get_player().nagaScore() + get_player().goblinScore() + get_player().sharkScore() + get_player().minoScore() + get_player().cowScore() + get_player().mermaidScore() > 5)
               {
                  outputText("随着你新形态的成型，你身体上所有其他的腐化和改变都消退了。");
               }
               outputText("当现实沉淀下来，你感到胃部和肉棒传来一阵剧痛。你需要进食。精液、乳汁，什么都行。同样，你的肉棒硬得发疼，你需要射精。尽管你渴望释放，但你却无法让自己自慰。你需要其他人的关注。[pg]");
               outputText("不再多言，你展开恶魔翅膀去寻找第一顿\"猎物\"。被留在身后的魅魔只是咯咯笑着，看着又一个同类在夜色中腾飞，寻觅更多的猎物与欢愉。");
               get_game().gameOver();
               return;
            }
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,111,FlagDict_Impl_.arrayReadInt(_loc1_,111) + 1);
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteFloat(_loc1_,61,FlagDict_Impl_.arrayReadFloat(_loc1_,61) + 1);
            outputText("[pg]当你结束了一天漫长的冒险，正准备放松一下时，魅魔回来了，不偏不倚地降落在你的大腿上，刚好避开了你那根跳动着的勃起肉棒。她兴奋地低吼着，将一侧肥大的乳头塞进你的嘴里。你本能地开始吮吸那乳头，既不感到羞耻，也没有任何克制。当乳汁涌入你的嘴里时，你感觉到女人的重量压在了你的肉棒上。她小穴那熟悉的温暖和紧致包裹住你饥渴的肉棒，她的肌肉开始美味地蠕动，诱导你的身体产生她所需的“乳汁”来满足她的饥饿。你的眼睛向上翻白，因为倾泻入喉的乳汁增加了你所有器官的敏感度，迫使你的臀部本能地向上挺动，将肉棒插得更深。[pg]");
            outputText("她控制住你，没有漏掉任何一次抽插，也没有打断你的吮吸，而高潮的快感则在你的肉棒根部膨胀。你用力地用双臂环抱住魅魔，同时向下压迫胯部，将积蓄已久、胀痛难忍的欲望释放到恶魔的小穴中，作为她的养料。她发出一声非人的愉悦嚎叫，她自己的高潮也开始挤压你的肉棒，榨干你体内的最后一滴精液。[pg]");
            outputText("随着高潮的消退，你的意识开始模糊。魅魔将乳头从你嘴里拔出，将更多的精华挤入空瓶中。她舔了舔你的嘴唇，然后飞走了，刚好赶在你晕倒之前。");
            if(FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,61) > 10)
            {
               get_player().removeStatusEffect(StatusEffects.SuccubiNight);
            }
            get_player().changeFatigue(20);
            var _temp_1:* = get_player();
            _temp_1.cumMultiplier = _temp_1.cumMultiplier + 1;
         }
         outputText("[pg]");
         get_player().orgasm("Generic");
         dynStats(DynStat.Str(Utils.rand(2)),DynStat.Tou(Utils.rand(2)),DynStat.Spe(Utils.rand(2)),DynStat.Inte(Utils.rand(2)),DynStat.Cor(1));
         get_inventory().takeItem(get_consumables().CERUL_P,playerMenu);
      }
      
      public function nightSuccubiFirstTime() : void
      {
         var _loc1_:* = null as IMap;
         spriteSelect(SpriteDb.get_s_cerulean_succubus());
         outputText("[pg]在你睡觉的时候，你的休息变得越来越不安稳。你感觉到身上压着巨大的重量，呼吸困难。你被唤醒了，映入眼帘的是一对巨大的、泛着蓝色的乳房。乳头相当长且粗，周围是巨大圆润的乳晕。[pg]");
         outputText("一个低沉的女性声音打破了沉默。[say: 我还在想你会不会醒过来呢。]你转头看向声音的来源，看到了一位五官分明、极具魅力的女人的面容。女人调皮地咧嘴一笑，再次开口。[say: 我还指望贾科莫那个白痴没有再把“药水”稀释呢。]你的营火映照在女人的脸上，她的美丽中包含着一些鲜明对比的特征。她的瞳孔像猫一样是竖直的。当她咧嘴笑时，露出了牙齿，里面有两对长短不一的獠牙。这个女人显然不是人类！震惊之下，你试图起身，却只引得女人抓住了你的肩膀，把你按在地上，证明了她非人的本性。你看到她手上的每根手指都有第四个关节，进一步证明了她的身份。还没等你开口，女人就开始嘲笑你的恐惧，把她的脸凑到你面前。她的脸几乎可以肯定是恶魔。[pg]");
         if(get_player().get_gender() == 0)
         {
            outputText("她迅速把手伸向你的胯部……却发现那里没有任何器官。[pg]");
            outputText("*唱片刮擦声*[pg]");
            outputText("[say:等一下，]魅魔说道，[say:你的老二呢？！][pg]");
            outputText("当你声明自己是无性别的本质时，魅魔跳了下来，不知从哪里掏出一个标有[say:勇者的堕落-剧本]的大文件夹，开始翻阅书页。找到她要找的那一页后，她读了一下，然后厌恶地看向远方。[pg]");
            outputText("[say:嘿，Fenoxo和Dxasmodeus！！！！！！]魅魔大叫道，[say:这该死的剧本上说我应该榨干某个人的老二！！！男人、扶他、双性人，我才不在乎。你们自己写的该死的剧本上说我应该骑上去榨干一根肉棒！！！！这是一个性爱游戏！！！！！！这意味着做爱！我到底该操什么？？？！！！][pg]");
            outputText("魅魔极其轻蔑地看着你，[say:这个混蛋什么都没有！我该怎么办？！我总不能点一份该死的开心乐园餐吧！！！！！][pg]");
            outputText("她狂怒地把剧本摔在地上，继续发脾气，[say:妈的！我真不敢相信这破事！喂！！！！！实习生！！！！把我的长袍、阿司匹林和香烟拿来！！！！][pg]");
            outputText("魅魔走到几步外，一个穿着朴素、拿着剪贴板的女人递给她一包烟和一小瓶阿司匹林。她抓了一把止痛药，立刻点燃了一根烟。魅魔抽了几口，揉了揉太阳穴。[pg]");
            outputText("[say: 你们俩真是要了我的命！] 她明显很沮丧地抱怨道，[say: 我来给你们这些变态打工，是因为你们承诺有更多的变态可以让我吸食，结果你们就这么对我！我没法干了！][pg]");
            outputText("那个朴素的女人递给魅魔一件长袍，她粗鲁地穿上，然后气冲冲地走进了夜色中。[pg]");
            outputText("[say: 我会和我的经纪人谈谈这件狗屁倒灶的事，]魅魔继续抱怨着，[say: 这可不在我的合同里。][pg]");
            outputText("魅魔停下脚步，转过身，嘲笑地指着你。[say: 还有你！你这个没鸡巴没逼的废物！在他们发现你逃跑之前，赶紧滚回实验室去！！！！！][pg]");
            outputText("魅魔继续气冲冲地离开。你看着那瓶蔚蓝药水，怀疑里面是不是真的有什么精神药物。刚才到底发生了什么鬼？！");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,62,1);
            doNext(playerMenu);
            return;
         }
         if(get_player().get_gender() == 1)
         {
            outputText("[say: 哎呀！我蓝色的皮肤和尖尖的牙齿吓到你了吗？]她用孩子般的声音说道。[say: 相信我，帅哥，如果我想伤害你，我根本不会让你醒过来。我在这里是因为你“召唤”了我。]她用你从商人那里买来的空蓝色瓶子逗弄你。[say: 我的精华就在这个瓶子里。任何喝了它的男人，我都会被迫通过吸食他来回报这份快感。]恶魔女人将她骨瘦如柴的手伸向你的胯部，你发现自己已经坚挺无比。恶魔温柔地抚摸着你的肉棒，直到你开始渗出大量天然的润滑液。恶魔托起她巨大的乳房，用肥大的乳头挑逗你。[say: 张开嘴，]她命令道。[say: 把我含进嘴里，因为我很快也会把你含进嘴里。][pg]");
         }
         else if(get_player().get_gender() == 3)
         {
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,111,FlagDict_Impl_.arrayReadInt(_loc1_,111) + 1);
            outputText("[pg]很明显，你遇到了一个魅魔。当火光照亮你的俘虏者时，她的笑容变得更加灿烂。[pg]");
            outputText("[say: 哎呀，哎呀，哎呀！]魅魔娇笑着。[say: 我们这里有什么？！一个长着大鸡巴的小女孩！][pg]");
            outputText("当魅魔低头看着你的[cock]时，你迅速勃起，这是你经历过最健康的勃起之一。魅魔迅速将她毛茸茸的小穴对准你的肉棒，利用她的体重将你的阴茎压入她的子宫。恶魔女将体重压在她的腿上，让你完全插入她。她的子宫又热又湿，她的肌肉以难以想象的强大力量紧紧夹住你的肉棒。即使你完全软下来，也不可能拔出来。当你因她阴道肌肉突然的挤压而皱眉时，魅魔发出了非人的咯咯笑声。[pg]");
            outputText("[say: 别哼哼了，]她命令道。[say: 我希望关于你们扶他的传闻是真的。我需要一股猛烈的精液来让我兴奋起来。我已经有一阵子没尝过了，虽然我很爱男人，但他们能喂给我的也就那么多。][pg]");
            outputText("你迅速试图挣扎，却发现魅魔完全占据了主导地位。她用双臂环抱你的背，修长的双腿缠绕在你的臀部。她调皮地舔了舔你的嘴唇，咧嘴笑了。[pg]");
            outputText("[say: 你的鸡巴正在被榨汁，]女人平淡地说，[say: 接受吧。相信我，等我完事后，你反正会想要我更多的。][pg]");
            outputText("当她说完最后通牒时，你感觉到阴道翻滚的收缩正在抚慰你巨大的肉棒。沉重、有力、协调的起伏像最好的手淫一样刺激着你的阴茎。在这样粗暴的对待下，你很快就在震惊和快感中呻吟起来。");
         }
         dynStats(DynStat.Lust(35));
         doNext(ceruleanSuccubusEncounterPart2);
      }
      
      public function giacomoEncounter() : void
      {
         spriteSelect(SpriteDb.get_s_giacomo());
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2065) == 0)
         {
            firstEncounter();
         }
         else if(!get_player().hasStatusEffect(StatusEffects.WormOffer) && get_player().hasStatusEffect(StatusEffects.Infested) || get_player().hasPerk(PerkLib.ParasiteMusk) || get_player().hasStatusEffect(StatusEffects.ParasiteSlug) && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2645) == 1)
         {
            outputText("走到贾科莫的马车前，他转头看着你，带着好奇和些许好笑挑了挑眉毛。[pg]");
            outputText("[say: 看来你一直在玩那些最好别碰的生物，]他轻笑着说。[say: 任何形式的寄生都很烦人，但考虑到这里周围腐化生物的规模，你的困境相当具有挑战性。这已经不是我第一次看到有人被[i:those]蠕虫寄生了。][pg]");
            outputText("你问他是怎么知道你的变化的，商人开怀大笑起来。[pg]");
            outputText("[say:别用看神秘主义者的眼神看我，]贾科莫轻声调侃道。[say:你的胯下在蠕动呢。][pg]");
            outputText("低头一看，你意识到他说得有多对，尴尬地试图遮掩自己。[pg]");
            outputText("[say: 别怕！]商人叮当响着身上的饰品说道。[say: 我有东西能治好你身上的那些小畜生。当然，它也有可能顺便清理一下你的整个身体系统。这药水可不便宜。我要[b:175颗宝石]才卖。][pg]");
            get_player().createStatusEffect(StatusEffects.WormOffer,0,0,0,0);
            if(get_player().get_gems() < 175)
            {
               outputText("你意识到自己没有足够的宝石来买这么昂贵的药水，但也许他库存里还有其他你能买得起的东西。");
            }
         }
         else
         {
            outputText("你在远处看到了商人贾科莫。他径直朝你走来，片刻间就搭好了他的铺子。");
            outputText("当他向你推销商品时，他的笑容简直令人毛骨悚然。你对什么感兴趣？");
         }
         menu();
         addButton(0,"药水",potionMenu);
         addButton(1,"情色",eroticaMenu);
         addButton(2,"书籍",bookMenu);
         if(get_player().hasStatusEffect(StatusEffects.Infested) || get_player().hasPerk(PerkLib.ParasiteMusk) || get_player().hasStatusEffect(StatusEffects.ParasiteSlug) && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2645) == 1)
         {
            addButton(3,"除虫药",wormRemovalOffer);
         }
         setExitButton();
         statScreenRefresh();
      }
      
      public function firstEncounter() : void
      {
         outputText("在旅行途中，你看到路上有另一个人，他拉着一辆小推车，车上超载着各种杂七杂八的物品。他穿着非常花哨，戴着一顶宽大的彩色帽子，穿着锦缎外套和宽大的条纹灯笼裤。他的外表几乎有些滑稽，与他严肃而鹰隼般的面部特征形成了鲜明对比。那人看到了你，微笑着停下了他的推车。[pg]");
         outputText("[say:你好，旅行者！我叫贾科莫。如你所见，我是一个谦卑的商人，贩卖各种物品、古玩和其他附属品。虽然我现在无法向你展示我的全部商品，因为我的店铺都打包在这辆手推车上，但我确实为我遇到的旅行者提供一些小玩意儿。][pg]");
         outputText("商人锐利地看着你，咧开嘴露出了一个宽阔的、露出牙齿的笑容，你觉得……有些令人不安。他扭过身去够背上的一个麻袋，过了一会儿，把它甩下来以便更好地拿取里面的东西。那人好奇地转过身来看着你。[pg]");
         outputText("[say:那么，陌生人，你是否对一些能在旅途中帮助你的药剂、一些警告你旅途危险的简短小册子感兴趣，或者……][pg]");
         outputText("贾科莫停顿了一下，把头转向两边，做出了一个嘲弄般的偏执观察手势。他这点戏剧性的举动确实让你好奇他接下来要提供什么。[pg]");
         outputText("[say:……也许你会对一些能增强肉体愉悦感的物品感兴趣？嗯？][pg]");
         outputText("当贾科莫向你推销他的商品时，他的笑容简直令人毛骨悚然。你对什么感兴趣？");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2065,1);
      }
      
      public function eroticaMenu() : void
      {
         spriteSelect(SpriteDb.get_s_giacomo());
         clearOutput();
         outputText("当贾科莫向你推销他的商品时，他的笑容简直令人毛骨悚然。你对什么感兴趣？");
         menu();
         if(!get_player().hasKeyItem("Dildo"))
         {
            addButton(0,"假阳具",pitchDildo).hint("选个洞，插进去。");
         }
         else
         {
            addButtonDisabled(0,"假阳具","你已经有一个假阳具了。");
         }
         if(get_player().hasVagina())
         {
            if(!get_player().hasKeyItem("Self-Stimulation Belt"))
            {
               addButton(1,"刺激腰带",pitchSelfStimulationBelt).hint("专为女性设计的机械性玩具。","自刺激腰带");
            }
            else
            {
               addButtonDisabled(1,"刺激腰带","你已经有一条自刺激腰带了。","自刺激腰带");
            }
            if(!get_player().hasKeyItem("All-Natural Self-Stimulation Belt"))
            {
               addButton(2,"天然刺激腰带",pitchAllNaturalSelfStimulationBelt).hint("专为女性设计的生物机械性玩具。","全天然自刺激腰带");
            }
            else
            {
               addButtonDisabled(2,"天然刺激腰带","你已经有一条全天然自刺激腰带了。","全天然自刺激腰带");
            }
         }
         else
         {
            addButtonDisabled(1,"刺激腰带","这是专为女性设计的。");
            addButtonDisabled(2,"天然刺激腰带","这是为女性设计的。");
         }
         if(get_player().hasCock())
         {
            if(!get_player().hasKeyItem("Plain Onahole"))
            {
               addButton(3,"飞机杯",pitchOnahole).hint("一个简单的男性性玩具。");
            }
            else
            {
               addButtonDisabled(3,"飞机杯","你已经拥有一个飞机杯了。");
            }
            if(!get_player().hasKeyItem("Deluxe Onahole"))
            {
               addButton(4,"豪华飞机杯",pitchDeluxeOnahole).hint("一个简单的男性性玩具。看起来和感觉起来都非常像真实的阴道。","豪华飞机杯");
            }
            else
            {
               addButtonDisabled(4,"豪华飞机杯","你已经拥有一个豪华飞机杯了。");
            }
         }
         else
         {
            addButtonDisabled(3,"飞机杯","这是为男性设计的。");
            addButtonDisabled(4,"豪华飞机杯","这是为男性设计的。");
         }
         if(get_player().hasCock() && get_player().hasVagina())
         {
            if(!get_player().hasKeyItem("Dual Belt"))
            {
               addButton(5,"双重刺激带",pitchDualStimulationBelt).hint("一个为扶他设计的机械性玩具。","双重刺激带");
            }
            else
            {
               addButtonDisabled(5,"双重刺激带","你已经拥有一个双重刺激带了。");
            }
            if(!get_player().hasKeyItem("All-Natural Onahole"))
            {
               addButton(6,"纯天然飞机杯",pitchAllNaturalOnahole).hint("一个为扶他设计的有机性玩具。","纯天然飞机杯");
            }
            else
            {
               addButtonDisabled(6,"纯天然飞机杯","你已经拥有一个纯天然飞机杯了。");
            }
         }
         else
         {
            addButtonDisabled(5,"双重刺激带","这是为扶他设计的。");
            addButtonDisabled(6,"纯天然飞机杯","这是为扶他设计的。");
         }
         addButton(7,"避孕套",pitchCondom);
         addButton(14,"返回",giacomoEncounter);
         statScreenRefresh();
      }
      
      public function ceruleanSuccubusEncounterPart4() : void
      {
         spriteSelect(SpriteDb.get_s_cerulean_succubus());
         if(get_player().get_gender() == 1)
         {
            clearOutput();
            outputText("她站起身，把你扶了起来。当你还晕乎乎的时候，");
            if(get_player().get_tallness() < 80)
            {
               outputText("你看到她比你高出许多。她的身高肯定超过了七英尺。");
            }
            if(get_player().get_tallness() >= 80 && get_player().get_tallness() < 90)
            {
               outputText("你看到她和你差不多高——大约七英尺。");
            }
            if(get_player().get_tallness() >= 90)
            {
               outputText("你看到她绝对比你矮，只有大约七英尺高。");
            }
            outputText("她把你靠在一棵树上，捡起那个空的药水瓶。她抓起你在那场邪恶幽会中忽略的那个乳房，将乳头塞进瓶子里，挤了大约一分钟。满意后，她塞上瓶塞，把它递给你。她开始舔舐你脸上的花蜜。[say:你让我很满意，小家伙，]她柔声说道。[say:我的猎物能让我如此愉悦，这确实很罕见。如果你还想要我，你只需要喝下我的奶。我会立刻出现让你吸吮我，我也会吸吮你！我们将互相喂食，并因此变得更强！][pg]");
            outputText("她咯咯笑了一声，在你眼前消失了。就在那一刻，那场激烈的性爱带来的疲惫感席卷而来，你瘫倒在地，昏了过去。");
            dynStats(DynStat.Str(0.5),DynStat.Lust(4));
         }
         get_inventory().takeItem(get_consumables().CERUL_P,playerMenu);
      }
      
      public function ceruleanSuccubusEncounterPart3() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_cerulean_succubus());
         if(get_player().get_gender() == 1)
         {
            outputText("她转过身来，摆出69式的姿势，抓住你那跳动着的肉棒，毫不费力地开始深喉。她的大腿夹住你的头，让你直面她那出奇多毛的小穴。她的阴蒂又长又硬，乞求着你的关注，她散发出的费洛蒙气味让你沦陷。你把脸埋进她毛茸茸的私处，无视了你平时对这种不刮毛状态的反感，开始像取悦你曾经取悦过的任何女人一样舔舐她。恶魔把你的肉棒从嘴里拿出来，高兴地叫喊着。[say: 是的，小男人！]她尖叫道。[say: 舔我！挑逗我！用你的舌头爱抚我的子宫！]作为回应，她用嘴夹住你的龟头，灵巧地吸吮着。你屁股里传来一阵刺痛，那是她骨瘦如柴的手指正在探入你内在的男子气概。她轻松地找到了你性器官的根部，用力按下，强迫你高潮。[pg]");
            outputText("发现自己无法抗拒这种快感，你立刻开始高潮。一团又一团，一股又一股的精液射入女人的嘴里。她适时的吸吮确保了她吞下你射入她体内的每一滴精液。虽然你一直为能在一个女人体内射精超过一分钟而感到自豪，但随着你的射精持续了将近十分钟，你被痛苦和快感折磨着。一旦你射出了最后一滴，恶魔就松开你的阴茎，用她的大腿压在你的脸上，并释放出大量的潮吹[if (silly) {屁|高潮}]。你的脸被淫液[if (silly) {和屎}]浸透了，你看到她的[if (silly) {屁眼|小穴}]因为快感的力量而痉挛。她那有节奏的肌肉收缩的景象令人着迷。然后她迅速把手指从你的屁股里抽了出来。");
         }
         else
         {
            outputText("魅魔直起身子，将你的肩膀牢牢按在地上。她阴道收缩的速度变得快得不可思议。当你低头看向她的胯部时，尽管你双腿间长满了浓密的毛发，你依然能清楚地看到她正在吞吐你的阴茎。你阴茎深处的压力简直要将你压碎。伴随着最后一次痉挛般的推挤，你将一股浓稠的、超乎常人分量的精液射入了魅魔的阴道深处。当她的子宫像老虎钳一样紧紧夹住你时，她发出了一声非人的欢愉嚎叫。她简直是把你体内的每一滴精液都榨干了。[pg]");
            outputText("几分钟后，你感觉到你的阴茎变软并开始疲软。心满意足的魅魔松开了对你肉棒的钳制，你很快从她的子宫里滑了出来。令你惊讶的是，尽管你射出了巨量的精液，但你的肉棒上却没有留下一滴精液。魅魔开始抚摸自己的全身，显然是因为吸收了你的体液而沉浸在高潮后的狂喜中。在经历了几次连续的高潮后，她坐在了那个空罐子旁边。[pg]");
            outputText("她把罐口贴近她那肥大的乳头之一，开始将乳汁挤进罐子里，用她的体液重新填满它。她把罐子放在你旁边，然后站了起来。[pg]");
            outputText("[say:我已经很久没有吸收到这么棒的精液了，]她说道，[say:如果你还想要更多，就再喝我的奶吧。这很公平。我吸你的精，你喝我的奶。][pg]");
            outputText("她微笑着飞走了，给你留下了一瓶崭新的“蔚蓝药水”。尽管这次经历令人愉悦，但它让你彻底筋疲力尽了。");
         }
         get_player().changeFatigue(20);
         get_player().orgasm("Generic");
         dynStats(DynStat.Lib(0.5));
         doNext(ceruleanSuccubusEncounterPart4);
      }
      
      public function ceruleanSuccubusEncounterPart2() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_cerulean_succubus());
         if(get_player().get_gender() == 1)
         {
            outputText("你的本能占据了上风，你张开嘴，让她的乳头进入。立刻，你的嘴唇仿佛有了自己的意识，你把头紧紧地压在她的乳房上，像一个饥饿的婴儿一样开始吸吮那异常长的乳头。恶魔女人满意地笑了。[say: 想想看，你居然以为我会伤害你！]她嘲弄道。[say: 喝吧，小男人。喂饱你的欲望，因为你很快就会喂饱我的。]你感觉到她的乳汁涌入你的嘴里。它的味道立刻让你想起了从贾科莫那里得到的药水。你意识到那根本不是什么药水，而是这个恶魔的母乳！你只顾着盲目的性欲，嘴巴的吸力将魔鬼的液体源源不断地吸入嘴里，吞下喉咙。她继续挑逗你的肉棒，只为了维持你的勃起。过了一会儿，你的胃发出吃饱的信号，你松开了她的乳头，发出一声响亮的“啵”。她短暂地用乳汁喷了你一身，把你弄得湿透了。[pg]");
            outputText("恶魔脸上露出了满意的神色。[say: 我尝起来好吗？我健康又令人满足吗？]她问道。[say: 既然你已经吸食了我的生命之乳，我这样做也是公平的。说实话，“是的”，我确实像我看起来那么凶猛，我会让你酸痛得失去知觉。然而，我这样做是为了让你快乐，也是为了喂饱我自己。接受它并感到高兴吧。]她又给了你一个非人的露齿笑容，深深地吻了你。当你感觉到她牙齿的锋利时，一阵小小的恐惧仍然掠过你的心头。她从你的嘴唇上移开，兴奋地叹了口气。[say: 现在，我要进食了！]她欢呼雀跃地说道。");
         }
         else
         {
            outputText("[say: 看，]魅魔得意洋洋地说，[say: 你已经开始享受了。你甚至都不用动。我的小穴会做所有的工作。去和人类女人试试这个。祝你好运。她们中有一半甚至不知道怎么在肉棒插进去后保持硬度，然后她们还会抱怨因为她们没有高潮。][pg]");
            outputText("猛烈的榨汁持续了几分钟，直到你条件反射地挺起臀部，因为你的内脏充满了恶魔女为了解渴而要求的白色乳状生命之水。魅魔很快注意到了你的肌肉反应，窃笑起来。[pg]");
            outputText("[say: 准备好要爆发了吗？]她戏谑地挑衅道。[say: 那么，你没有理由再忍耐了。]");
         }
         dynStats(DynStat.Tou(0.3),DynStat.Lib(0.5),DynStat.Sens(0.5),DynStat.Lust(5),DynStat.Cor(1));
         doNext(ceruleanSuccubusEncounterPart3);
      }
      
      public function buyYogaGuide() : void
      {
         clearOutput();
         outputText("你用100颗宝石换了这本书。现在你终于可以和科顿一起享受锻炼了！");
         get_player().createKeyItem("Yoga Guide",0,0,0,0);
         var _loc1_:Player = get_player();
         _loc1_.set_gems(_loc1_.get_gems() - 100);
         statScreenRefresh();
         doNext(bookMenu);
      }
      
      public function buyVitailtyTincture() : void
      {
         spriteSelect(SpriteDb.get_s_giacomo());
         clearOutput();
         var _loc1_:Player = get_player();
         _loc1_.set_gems(_loc1_.get_gems() - 15);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2140) == 1)
         {
            get_consumables().VITAL_T.useItem();
            doNext(potionMenu);
         }
         else
         {
            get_inventory().takeItem(get_consumables().VITAL_T,potionMenu);
         }
         statScreenRefresh();
      }
      
      public function buyTravelersGuide() : void
      {
         spriteSelect(SpriteDb.get_s_giacomo());
         clearOutput();
         outputText("贾科莫说你可能不需要这个，他是对的。这本书写得很浅显，显然是给那些从未离开过城墙的城里人看的。书里充斥着幼稚的插图和愚蠢的短语，虽然它确实告诉了人们需要什么和该做什么，但天真地淡化了森林和强盗的危险。如果不是这么便宜，你肯定会对这个商人发火。不过，他说得对，把这个给那些对路上的危险一无所知的白痴，确实能省下回答一堆愚蠢问题的时间。");
         doNext(bookMenu);
         var _loc1_:Player = get_player();
         _loc1_.set_gems(_loc1_.get_gems() - 1);
         get_player().createKeyItem("Traveler\'s Guide",0,0,0,0);
         statScreenRefresh();
      }
      
      public function buySelfStimulationBelt() : void
      {
         spriteSelect(SpriteDb.get_s_giacomo());
         clearOutput();
         outputText("付完钱后，贾科莫把自刺激腰带递给了你。");
         get_player().createKeyItem("Self-Stimulation Belt",0,0,0,0);
         doNext(eroticaMenu);
         var _loc1_:Player = get_player();
         _loc1_.set_gems(_loc1_.get_gems() - 30);
         statScreenRefresh();
      }
      
      public function buyScholarsTea() : void
      {
         spriteSelect(SpriteDb.get_s_giacomo());
         clearOutput();
         var _loc1_:Player = get_player();
         _loc1_.set_gems(_loc1_.get_gems() - 15);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2140) == 1)
         {
            get_consumables().SMART_T.useItem();
            doNext(potionMenu);
         }
         else
         {
            get_inventory().takeItem(get_consumables().SMART_T,potionMenu);
         }
         statScreenRefresh();
      }
      
      public function buyOnahole() : void
      {
         spriteSelect(SpriteDb.get_s_giacomo());
         clearOutput();
         outputText("付完钱后，贾科莫把普通飞机杯递给了你。");
         get_player().createKeyItem("Plain Onahole",0,0,0,0);
         doNext(eroticaMenu);
         var _loc1_:Player = get_player();
         _loc1_.set_gems(_loc1_.get_gems() - 20);
         statScreenRefresh();
      }
      
      public function buyHentaiComic() : void
      {
         spriteSelect(SpriteDb.get_s_giacomo());
         clearOutput();
         outputText("你仔细阅读了这本色情书。故事讲述了一群姐妹——她们都有着不可思议的丰满胸部，而且同样饥渴——在试图满足她们的欲望时，不断遭遇不幸。[pg]");
         outputText("虽然这本漫画非常有趣，而且色情程度极高，但你还是忍不住嘲笑故事和所有角色是多么夸张。如果世界真的像书里那样，什么事也做不成，因为人类余生都会像发情的长耳大野兔一样做爱。虽然这确实是一个诱人的提议，但每个人都有精疲力尽的时候。你把书放进包里，觉得很有趣，脑子里充满了比今天早上醒来时更疯狂的变态想法。");
         doNext(bookMenu);
         var _loc1_:Player = get_player();
         _loc1_.set_gems(_loc1_.get_gems() - 10);
         dynStats(DynStat.Lib(2),DynStat.Lust(20));
         get_player().createKeyItem("Hentai Comic",0,0,0,0);
         statScreenRefresh();
      }
      
      public function buyDualStimulationBelt() : void
      {
         spriteSelect(SpriteDb.get_s_giacomo());
         clearOutput();
         outputText("付款后，贾科莫将双重刺激带递给了你。");
         get_player().createKeyItem("Dual Belt",0,0,0,0);
         var _loc1_:Player = get_player();
         _loc1_.set_gems(_loc1_.get_gems() - 50);
         statScreenRefresh();
         doNext(eroticaMenu);
      }
      
      public function buyDildo() : void
      {
         spriteSelect(SpriteDb.get_s_giacomo());
         clearOutput();
         outputText("付完钱后，贾科莫把假阳具递给了你。");
         doNext(eroticaMenu);
         var _loc1_:Player = get_player();
         _loc1_.set_gems(_loc1_.get_gems() - 20);
         get_player().createKeyItem("Dildo",0,0,0,0);
         statScreenRefresh();
      }
      
      public function buyDeluxeOnahole() : void
      {
         spriteSelect(SpriteDb.get_s_giacomo());
         clearOutput();
         outputText("付完钱后，贾科莫把豪华飞机杯递给了你。");
         get_player().createKeyItem("Deluxe Onahole",0,0,0,0);
         doNext(eroticaMenu);
         var _loc1_:Player = get_player();
         _loc1_.set_gems(_loc1_.get_gems() - 50);
         statScreenRefresh();
      }
      
      public function buyDangerousPlantsBook() : void
      {
         spriteSelect(SpriteDb.get_s_giacomo());
         clearOutput();
         outputText("在这个时代，你能识字算得上是件幸事。在读这本书时，这确实派上了用场。这本书显然是由一位经验丰富的野外生存专家所写，书中枯燥地陈述了世界上各种有毒和食肉植物。[pg]");
         outputText("其中真正吸引你的是关于“侵犯植物”的章节。它喋喋不休地讲述了一整类经过特殊培育的植物，其目的是折磨人类或以人类为食，但又不会造成永久性伤害或致人死亡。这些植物大多试图与人类交配，而且对人类繁衍的复杂性过于迟钝，除了给人带来无尽的折磨外，没有任何价值。这些植物种类繁多，从巨大的蹒跚怪物，到附着在人身上的小型动植物混合体，应有尽有。[pg]");
         outputText("当你读完这本书时，你忍不住对外面那些不合常理的植物感到不寒而栗，并纳闷到底是谁创造了这些怪物。");
         doNext(bookMenu);
         var _loc1_:Player = get_player();
         _loc1_.set_gems(_loc1_.get_gems() - 10);
         get_player().createKeyItem("Dangerous Plants",0,0,0,0);
         statScreenRefresh();
      }
      
      public function buyCondom() : void
      {
         spriteSelect(SpriteDb.get_s_giacomo());
         var _loc1_:Player = get_player();
         _loc1_.set_gems(_loc1_.get_gems() - 10);
         get_inventory().takeItem(get_useables().CONDOM,eroticaMenu);
         statScreenRefresh();
      }
      
      public function buyCeruleanPotion() : void
      {
         spriteSelect(SpriteDb.get_s_giacomo());
         clearOutput();
         var _loc1_:Player = get_player();
         _loc1_.set_gems(_loc1_.get_gems() - 75);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2140) == 1)
         {
            get_consumables().CERUL_P.useItem();
            doNext(potionMenu);
         }
         else
         {
            get_inventory().takeItem(get_consumables().CERUL_P,potionMenu);
         }
         statScreenRefresh();
      }
      
      public function buyAllNaturalSelfStimulationBelt() : void
      {
         spriteSelect(SpriteDb.get_s_giacomo());
         clearOutput();
         outputText("付完钱后，贾科莫把全天然自刺激腰带递给了你。");
         get_player().createKeyItem("All-Natural Self-Stimulation Belt",0,0,0,0);
         doNext(eroticaMenu);
         var _loc1_:Player = get_player();
         _loc1_.set_gems(_loc1_.get_gems() - 40);
         statScreenRefresh();
      }
      
      public function buyAllNaturalOnahole() : void
      {
         spriteSelect(SpriteDb.get_s_giacomo());
         clearOutput();
         outputText("付款后，贾科莫将纯天然飞机杯递给了你。");
         get_player().createKeyItem("All-Natural Onahole",0,0,0,0);
         doNext(eroticaMenu);
         var _loc1_:Player = get_player();
         _loc1_.set_gems(_loc1_.get_gems() - 150);
         statScreenRefresh();
      }
      
      public function bookMenu() : void
      {
         spriteSelect(SpriteDb.get_s_giacomo());
         clearOutput();
         outputText("你对阅读哪本书感兴趣？");
         menu();
         if(!get_player().hasKeyItem("Dangerous Plants"))
         {
            addButton(0,"危险植物",pitchDangerousPlantsBook).hint("这是一本名为《危险植物》的书。正如书名所解释的那样，这本大部头里写满了关于这个领域各种危险植物的信息。","危险植物");
         }
         else
         {
            addButtonDisabled(0,"危险植物","你已经有一本了。","危险植物");
         }
         if(!get_player().hasKeyItem("Traveler\'s Guide"))
         {
            addButton(1,"旅行者指南",pitchTravelersGuide).hint("这本旅行者指南与其说是一本书，不如说是一本小册子，但它仍然包含了一些关于如何避免当地陷阱的有用信息。","旅行者指南");
         }
         else
         {
            addButtonDisabled(1,"旅行者指南","你已经有一本了。","旅行者指南");
         }
         if(!get_player().hasKeyItem("Hentai Comic"))
         {
            addButton(2,"变态漫画",pitchHentaiComic).hint("这本画风怪异的漫画书里充满了通奸、性爱和超大眼球的画面。","变态漫画");
         }
         else
         {
            addButtonDisabled(2,"变态漫画","你已经有一本了。","变态漫画");
         }
         if(get_player().hasKeyItem("Yoga Guide"))
         {
            addButtonDisabled(3,"瑜伽指南","你已经有一本了。");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,244) > 0)
         {
            addButton(3,"瑜伽指南",pitchYogaGuide).hint("这本皮面装订的书名为《非人型生物瑜伽》。里面包含大量半人马、娜迦以及各种其他奇形怪状的生物摆出各种姿势的插图。");
         }
         addButton(14,"返回",giacomoEncounter);
         statScreenRefresh();
      }
   }
}

