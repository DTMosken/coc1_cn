package classes.scenes.areas.mountain
{
   import classes.Appearance;
   import classes.BaseContent;
   import classes.CoC;
   import classes.Cock;
   import classes.CockTypesEnum;
   import classes.DynStat;
   import classes.DynStatOp;
   import classes.ImageManager;
   import classes.Monster;
   import classes.PerkLib;
   import classes.Player;
   import classes.StatusEffects;
   import classes.Vagina;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.display.SpriteDb;
   import classes.globalFlags.KFLAGS;
   import classes.internals.GuiOutput;
   import classes.internals.Utils;
   import classes.items.Armor;
   import classes.items.ConsumableLib;
   import classes.items.armors.LustyMaidensArmor;
   import classes.scenes.Camp;
   import classes.scenes.Inventory;
   import classes.scenes.combat.Combat;
   import classes.scenes.monsters.pregnancies.PlayerMinotaurPregnancy;
   import coc.view.CoCButton;
   import flash.Boot;
   import haxe.IMap;
   
   public class MinotaurScene extends BaseContent
   {
      
      public function MinotaurScene(param1:GuiOutput = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         new PlayerMinotaurPregnancy(param1);
      }
      
      public function watchMinoCumSlutII() : void
      {
         clearOutput();
         get_images().showImage("minotaur-cumslut");
         outputText("他们持续了将近一个小时，完全没有注意到你在看着他们，直到他们接近高潮时，强度才有所增加。结果几乎是爆炸性的，两人都大叫起来，开始不受控制地抽搐。牛头人死死地抓住牛娘的屁股，将大量的精液注入她的深处，以至于精液开始喷涌而出。这种意外的润滑让他松开了手，两人瘫倒在地。然而牛头人还没有结束，他的精液像水管一样喷射到空中，溅落到他们俩身上。");
         outputText("[pg]当你看着这两个浑身是精液的生物躺在那里，陷入性爱带来的疲惫昏迷中，牛头人粗大的马巴现在慢慢软了下来，你意识到你一直在抚摸自己。你厌恶地强迫自己停下来。");
         outputText("[pg]直到现在，你才注意到有其他面孔从岩架和山脊上探出头来。你数了数，至少有两个地精和一个小恶魔迅速缩了回去。从声音判断，他们正忙着自己解决。显然，这并不是一场罕见的表演，当地人非常喜欢。");
         dynStats(DynStat.Lust(25));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function watchAMinoCumSlut() : void
      {
         clearOutput();
         outputText("决定不冒这个险，你退回到岩石间的角落里，热切地注视着。牛娘转过身，双手撑在一个低矮的岩架上，弯下腰，将丰满的屁股对着牛头人。牛头人一步就拉近了他们之间的距离。");
         outputText("[pg]当牛头人用两只巨大的手抓住她那柔软的屁股时，她发出一声近乎呻吟的吼叫。她的尾巴翘起，露出闪闪发光、湿润的肉穴，阴唇已经因欲望而微微张开。当他迅速勃起的牛巴擦过她的胯部时，她又发出一声牛叫。你无法移开视线，看着他调整姿势，他那蘑菇状的龟头顶在她的阴唇上，引得她又是一声呻吟。");
         get_images().showImage("minotaur-cumslut");
         outputText("[pg]伴随着有力的挺进，牛头人插入了牛娘渴望的肉穴中，将他那巨大肉棒上的三个脊环埋入了一两个。她发出一半痛苦、一半狂喜的尖叫，并向后推挤，渴望吞下他的全部长度。在稍微拔出一点后，他插得更深了，将他那巨大肉棒的每一[if (metric) {centimeter|inch}]都送入了他那心甘情愿的伴侣体内，她因快感而扭动着，正如她所希望的那样被刺穿。");
         outputText("[pg]两人很快就进入了节奏，伴随着无数的咕哝声、呻吟声和过度纵欲的喘息声。对你来说，这几乎是一场暴力的袭击，肯定会让他们俩都青一块紫一块，酸痛不已，但牛娘伸出的舌头和极度渴望的表情告诉你事实并非如此。她享受着每一次的抽插，以及牛头人强有力的双手对她那晃动的屁股和沉甸甸的乳房进行的抚摸、抓捏和看似痛苦的挤压。他也好不到哪里去，眼神因欲望而变得迷离，继续操着他找到的肉穴，几乎是在蹂躏它的主人。");
         dynStats(DynStat.Lust(10));
         menu();
         addButton(0,"继续",watchMinoCumSlutII);
      }
      
      public function takeMinoCumDirectly() : void
      {
         spriteSelect(SpriteDb.get_s_minotaur());
         clearOutput();
         outputText("享受着胜利的喜悦，你深吸一口气，颤抖着伸了个懒腰。");
         if(get_monster().get_HP() < 1)
         {
            outputText("兽人仰面躺下，昏迷不醒，毫无知觉，尽管他的肉棒已经完全勃起，顶起了他的缠腰布。");
         }
         else
         {
            outputText("兽人仰面躺着，双腿张开，绝望地自慰着。他痛苦的呻吟告诉你你需要知道的一切——他永远无法独自发泄。");
         }
         outputText("你微笑着，期待地红了脸，准备迎接即将到来的幸福。[pg]");
         outputText("你脱下你的[armor]，跨过他的腰，因为期待下一次的快感而微微颤抖。你握住他那膨胀的肉棒，稳住它，然后慢慢坐下，感觉到他那滑溜溜的麻醉先列腺液涂抹在你的穴口上。");
         if(get_player().analCapacity() < get_monster().cockArea(0))
         {
            outputText("你必须越来越用力才能把它塞进体内，即使有大量润滑液的药物作用放松了你的括约肌。插入很慢，但你还是一寸一寸地把它塞了进去。");
         }
         else
         {
            outputText("你的肌肉在接触到先列腺液的瞬间就放松了，你感觉到那根巨大的肉棒轻松地滑入你宽敞的后庭。");
         }
         if(!get_player().buttChange(get_monster().cockArea(0),true))
         {
            outputText("");
         }
         outputText("牛头人睁大了眼睛，发出一声充满欲望的“<i>哞哞</i>”。他没有挣扎，甚至没有动——毕竟，你给了他想要的东西。[pg]");
         get_images().showImage("minotaur-loss-butt");
         outputText("你坐到底，幸福地叹了口气，感觉到他滚烫的液体在你的体内流淌，纯粹的快感从你的核心辐射出来。野兽般的手抓住你的[nipples]，开始轻轻扭动，尽管力量很大，却出奇地小心。在从你的");
         if(get_player().biggestTitSize() < 1)
         {
            outputText("胸部");
         }
         else
         {
            outputText(get_player().breastDescript(0));
         }
         outputText("辐射出的感觉的刺激下，你渴望更多的幸福，开始在被击败的野兽身上弹跳，不断地挤压和放松自己，试图榨出尽可能多的液体。[pg]");
         outputText("随着你全身的摩擦和挤压，牛头人屈服了，一股滚烫的液体瞬间涌入你的体内。它在你的体内膨胀，在下一次喷射前脉动了一下。随着不断增加的精液负荷的影响蔓延到你的大脑，你无法控制地咯咯笑起来。感觉你的思想在棉花糖中挣扎，一种令人愉快的粉红色绒毛让你除了幸福地流口水之外什么也做不了，因为你被充满了你渴望的药物。[pg]");
         outputText("你走神了，隐约感觉到你的手在你的身体上游走，带来一阵阵狂欢的感觉。被塞得满满的不适感完全被充满你身体每个毛孔的人造药物所掩盖，你继续弹跳，没有意识到牛头人已经射精完毕。你发现自己希望生活每天的每一刻都能像这样，充满幸福和快感。[pg]");
         outputText("大约一个小时后，你从散发着性爱气味的泥坑里爬起来。仍然感到昏昏沉沉和兴奋，你穿上衣服，懒得清理。你必须努力保持你的[asshole]紧闭，以免失去一些让你如此快乐的药物。");
         dynStats(DynStat.Sens(1),DynStat.Lust(-80),DynStat.Cor(1));
         dynStats(DynStat.Lust(25));
         if(get_player().get_sens100() < 80)
         {
            dynStats(DynStat.Sens(1));
         }
         if(get_player().get_sens100() < 60)
         {
            dynStats(DynStat.Sens(1));
         }
         if(get_player().get_sens100() < 40)
         {
            dynStats(DynStat.Sens(1));
         }
         if(get_player().get_sens100() < 20)
         {
            dynStats(DynStat.Sens(1));
         }
         if(get_player().hasStatusEffect(StatusEffects.ParasiteSlugReproduction))
         {
            get_player().changeStatusValue(StatusEffects.ParasiteSlugReproduction,1,1);
         }
         minoCumAddiction(15);
         get_combat().cleanupAfterCombat();
      }
      
      public function rapeMinotaurTentacles() : void
      {
         var _loc5_:int = 0;
         spriteSelect(SpriteDb.get_s_minotaur());
         if(int(get_player().cocks.length) > 1 && get_player().countCocksOfType(CockTypesEnum.TENTACLE) == 1)
         {
            rapeMinotaurTentacle();
            return;
         }
         minoRapeIntro();
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         while(_loc2_ < get_player().cockTotal())
         {
            if(get_player().cocks[_loc2_].get_cockType() == CockTypesEnum.TENTACLE)
            {
               _loc1_ = _loc2_;
               break;
            }
            _loc2_++;
         }
         var _loc3_:Boolean = false;
         var _loc4_:int = 0;
         clearOutput();
         if(get_monster().get_HP() <= 0)
         {
            outputText("在你最后一击之后，牛头人向后倒下。他疲惫不堪，被击败了，当你靠近时，他几乎站不起来。");
         }
         else
         {
            outputText("牛头人垂下了手臂");
            if(get_monster().get_weaponName() == "axe")
            {
               outputText("，任由他的斧头当啷一声掉在地上");
            }
            outputText("。他被你面前的" + get_player().multiCockDescript() + "迷住了，几乎没有注意到你走近了。");
         }
         outputText("你紧紧抓住他的手臂，确保在享受快感时不会遭到报复。不过，看他脸上的表情，以及他那破烂卷起的遮阴布的状态，你怀疑这根本不是问题。");
         if(get_player().cor < 25)
         {
            outputText("你喊道，抚摸着他的头发，顺着他的角抚平，一边将你的" + get_player().multiCockDescript() + "移向他的尾穴，一边向自己证明你强奸这只野兽是因为这个世界就是这样运作的。");
         }
         if(get_player().cor >= 25 && get_player().cor < 50)
         {
            outputText("你顺畅地引导你的" + get_player().multiCockDescript() + "靠近他的尾穴。");
         }
         if(get_player().cor >= 50 && get_player().cor < 80)
         {
            outputText("你粗暴地抓住他，将他猛地拉近你的" + get_player().multiCockDescript() + "——正是这野兽喜欢的调调。");
         }
         if(get_player().cor >= 80)
         {
            outputText("你咧嘴一笑，粗暴地拉着他的角靠近你的" + get_player().multiCockDescript() + "，准备狠狠地骑这头野兽。");
         }
         get_images().showImage("minotaur-win-tentacle");
         if(get_player().cockTotal() != get_player().countCocksOfType(CockTypesEnum.TENTACLE))
         {
            _loc3_ = true;
            _loc5_ = int(get_player().cocks.length);
            _loc4_ = -1;
            while(_loc5_ > 0 && _loc4_ == -1)
            {
               _loc5_--;
               if(get_player().cocks[_loc5_].get_cockType() != CockTypesEnum.TENTACLE)
               {
                  _loc4_ = _loc5_;
               }
            }
            if(_loc4_ == -1)
            {
               _loc4_ = 0;
            }
            _loc5_ = int(get_player().cocks.length);
            while(_loc5_ > 0)
            {
               _loc5_--;
               if(get_player().cocks[_loc5_].cockLength > get_player().cocks[_loc4_].cockLength && get_player().cocks[_loc5_].get_cockType() != CockTypesEnum.TENTACLE)
               {
                  _loc4_ = _loc5_;
               }
            }
            outputText("你的" + get_player().cockDescript(_loc4_) + "猛地插进他的尾穴，随着你的抽插将洞口撑得更开，你享受着牛头人体内粗糙却又润滑的触感。");
         }
         else
         {
            _loc4_ = 0;
            outputText("你的一根触手阴茎在靠近牛头人的尾穴时盘绕起来，做好了准备。然后它突然弹射进他肉感的穴口，扭动着越钻越深，直到它那" + Utils.num2Text(int(Math.floor(get_player().cocks[0].cockLength))) + "英寸的长度全部没入他的肠道。当你的阴茎开始在他体内左右摇摆，做出蛇行般的动作时，你和他都颤抖了起来。");
         }
         if(int(get_player().vaginas.length) >= 1)
         {
            outputText("随着你的" + get_player().cockDescript(_loc4_) + "成功埋入牛头人体内，你扭转身子，调整你的" + get_player().vaginaDescript(0) + "的位置，将牛头人巨大的阴茎纳入体内。你感觉到他的肉棒美妙地滑入，并感受到这野兽因情欲而开始喘息时散发出的灼热呼吸。");
            get_player().cuntChange(get_monster().cockArea(0),true,false,true);
         }
         if(int(get_player().vaginas.length) > 1 && !_loc3_ && int(get_player().cocks.length) > 2)
         {
            outputText("你的触手阴茎相互缠绕，每一根都转向你身上无人问津的" + get_player().vaginaDescript(1) + "，并迅速填满了那深邃的洞穴。当所有的阴道开始渗出美妙的体液时，你因这自我交媾的快感而呻吟。");
         }
         if(get_player().countCocksOfType(CockTypesEnum.TENTACLE) == 2 || get_player().countCocksOfType(CockTypesEnum.TENTACLE) == 3)
         {
            outputText("你的另一根触手阴茎因为没有东西可以缠绕而感到悲伤，于是转向了牛头人突出的肉棒。它从你的胯下射出，缠绕住他那巨大的肉棒并收紧，就像蛇缠绕猎物一样。当你感觉到那根阴茎扭动并抓住他的肉棒，随着你的血液和野兽抽搐的肉棒一起跳动时，你舒服地吐出了舌头。");
         }
         if(get_player().countCocksOfType(CockTypesEnum.TENTACLE) > 3)
         {
            outputText("你剩下的触手阴茎在牛头人周围挥舞，照顾着他的睾丸，在他的四肢间穿梭，在他身上到处摩擦跳动，将先列腺液涂抹在他身上和体内，让你们俩都在快感中呻吟。");
         }
         outputText("你的触手跳动着，随着你感觉到前列腺中精液的膨胀，速度也加快了。它们疯狂地挥舞着，然后，就在它们的动作让你感到头晕目眩时，你感觉到它们突然僵硬，开始将精液喷洒在牛头人体内和身上。你喘着粗气停了下来，瘫倒在牛头人强壮的背上，沐浴在余韵中。");
         get_player().orgasm("Dick",true,get_player().countCocksOfType(CockTypesEnum.TENTACLE));
         get_combat().cleanupAfterCombat();
      }
      
      public function rapeMinotaurTentacle() : void
      {
         spriteSelect(SpriteDb.get_s_minotaur());
         minoRapeIntro();
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         while(_loc2_ < get_player().cockTotal())
         {
            if(get_player().cocks[_loc2_].get_cockType() == CockTypesEnum.TENTACLE)
            {
               _loc1_ = _loc2_;
               break;
            }
            _loc2_++;
         }
         clearOutput();
         outputText("你站在被击败的牛头人面前，你的触手阴茎开始快速地来回甩动，显示出你的兴奋。你看到了他肉棒的硬度，决定做点什么……为了你们俩。");
         get_images().showImage("minotaur-win-tentacle");
         outputText("你走到他身后，用触手阴茎缠住他巨大的肉棒，紧紧挤压他的肉棒根部，让更多的血液泵入其中。然后你又在他巨大的勃起上缠绕了几圈，准备就绪。你上下套弄着他，变换着速度、位置和握力，榨取他肉棒的每一滴价值。");
         outputText("牛头人的睾丸开始痉挛，于是你用触手的根部紧紧缠住他，阻止他的" + get_monster().cockDescriptShort(0) + "射精，这让牛头人欲火焚身。你自己的" + get_player().cockDescript(_loc1_) + "则沉浸在他睾丸上毛发的触感和他" + get_monster().cockDescriptShort(0) + "的坚硬之中。");
         var _loc3_:int = 0;
         if(get_player().countCocksOfType(CockTypesEnum.HORSE) == 1)
         {
            outputText("但这还不够。你用手掰开他的肛门，拿你的小马肉棒对准。你龟头上的凸起费了点劲才进去，但一旦进去，你就直捣黄龙，伴随着一声沉闷的咕哝，把牛头人撞得喘不过气来。");
            _loc3_ = 1;
         }
         if(get_player().countKnottedCocks() == 1 && _loc3_ != 1)
         {
            _loc3_ = 1;
            outputText("但这还不够。你用手掰开他的肛门，拿你的犬科肉棒对准。你轻松地滑了进去，一直插到你的肉结，但他太紧了，你没法把肉结也塞进去。");
         }
         if(int(get_player().cocks.length) == 2 && _loc3_ != 1)
         {
            _loc3_ = 1;
            outputText("但你利用他空闲的后庭，来进一步满足你自己的欲望。快速一推，你就进去了，直没至柄。");
         }
         if(int(get_player().cocks.length) > 2 && _loc3_ != 1)
         {
            _loc3_ = 1;
            outputText("这还不够！你的其他阴茎也需要关注！幸运的是，他有一个大洞供你蹂躏……你尽可能多地塞进你的" + get_player().multiCockDescript() + "，剩下的挂在他身下，拍打着他的阴囊。");
         }
         if(get_player().getClitLength() > 6)
         {
            outputText("渴望更多刺激的你，心想你的阴蒂已经大到可以用来操了，为什么不呢！？你用手指沾了点口水，滑到正确的位置，将他撑得更开以容纳你的[clit]。滑入那个紧致的洞穴感觉如此敏感，当你用你那像阴茎一样的阴蒂在他身上抽插时，这种感觉让你发狂。");
         }
         if(int(get_player().vaginas.length) > 0)
         {
            _loc3_ = 2;
            outputText("你是个女人，是时候也享受一下阴道的快感了！你将你的" + get_player().vaginaDescript(0) + "滑到被" + get_player().cockDescript(_loc1_) + "缠绕的牛头人肉棒上，进一步把这野兽逼得发狂。他哀怨地呻吟着，挣扎着想把肉棒拔出来或者射精，你不太确定。");
            outputText("终于，时机成熟了。当你感觉到腹股沟处积聚起沸腾的热量，化作一阵白热化的快感浪潮涌过你的" + get_player().multiCockDescript() + "时，你微笑了。你呻吟着，颤抖着，迷失在快感中，直到你开始平静下来。");
            if(get_player().cumQ() < 50)
            {
               outputText("你的肉棒在里面搅得一团糟，当你拔出它时，你的" + get_player().vaginaDescript(0) + "发出了湿润的吸吮声。");
            }
            if(get_player().cumQ() >= 50 && get_player().cumQ() < 400)
            {
               outputText("你的肉棒在你的" + get_player().vaginaDescript(0) + "里搅得一团糟。当你拔出时，精液顺着你的大腿肆意流淌。牛头人精液那令人飘飘欲仙的气味充满了你的鼻腔，你开始舀起混合的精液品尝。");
            }
            if(get_player().cumQ() >= 400)
            {
               outputText("你的肉棒在你的" + get_player().vaginaDescript(0) + "里搅得一团糟。当你拔出时，精液如河流般从你的大腿间倾泻而出。牛头人精液那令人飘飘欲仙的气味充满了你的鼻腔，你开始舀起混合的精液品尝。");
            }
         }
         else
         {
            _loc3_ = 2;
            outputText("你觉得有点变态，于是你走到他面前，给他更多刺激，将自己压在他那肉感十足的阴茎上。你慢慢地向下压，享受着它进入你[asshole]的每一[if (metric) {centimeter|inch}]，从中漏出的先列腺液充当了润滑剂，让他那被触手包裹的肉棒在你的体内抽插。");
            if(get_player().hasStatusEffect(StatusEffects.ParasiteSlugReproduction))
            {
               get_player().changeStatusValue(StatusEffects.ParasiteSlugReproduction,1,1);
            }
            outputText("终于，时机成熟了。当你感觉到腹股沟处积聚起沸腾的热量，化作一阵白热化的快感浪潮涌过你的" + get_player().multiCockDescript() + "时，你微笑了。你呻吟着，颤抖着，迷失在快感中，直到你开始平静下来。");
            if(get_player().cumQ() < 50)
            {
               outputText("你插在他屁股里的肉棒把里面搅得一团糟，当你拔出时，它发出了湿润的吸吮声，似乎想把你留在里面。");
            }
            if(get_player().cumQ() >= 50 && get_player().cumQ() < 400)
            {
               outputText("你插在他屁股里的肉棒喷涌而出，形成了一滩水洼，稍后会弄脏他的皮毛。");
            }
            if(get_player().cumQ() >= 400)
            {
               outputText("你的肉棒被你射精的力量从他的屁股里猛地冲了出来，将精液如河流般溅射在地上。一条粘稠的河流从他被侵犯的屁股里倾泻而出，粘在他大腿的皮毛上。");
            }
         }
         if(_loc3_ < 2)
         {
            if(get_player().cumQ() < 25)
            {
               outputText("终于，时机成熟了……你调整好姿势，准备做你心中所想的事。你们的需求都达到了顶峰，马上就要释放了！一旦你在他身后准备就绪，你就把他的头往前推，让他把你的和他的肉棒都含进嘴里。他的舌头试图把你推出去，在你的和他的肉棒之间滑动，把你推向了高潮的边缘，你松开了他的蛋蛋，让你们俩的肉棒都把精液射满他的嘴。");
            }
            if(get_player().cumQ() >= 25 && get_player().cumQ() < 250)
            {
               outputText("终于，时机成熟了……你调整好姿势，准备做你心中所想的事。你们的需求都达到了顶峰，马上就要释放了！一旦你在他身后准备就绪，你就把他的头往前推，让他把你的和他的肉棒都含进嘴里。他的舌头试图把你推出去，在你的和他的肉棒之间滑动。这把你推向了高潮的边缘，你松开了他的蛋蛋，让你们俩的肉棒都把精液射满他的嘴，精液从他的嘴唇周围滴落，溅在他的胸膛上。");
            }
            if(get_player().cumQ() >= 250 && get_player().cumQ() < 500)
            {
               outputText("终于，时机成熟了……你调整好姿势，准备做你心中所想的事。你们的需求都达到了顶峰，马上就要释放了！一旦你在他身后准备就绪，你就把他的头往前推，让他把你的和他的肉棒都含进嘴里。他的舌头试图把你推出去，在你的和他的肉棒之间滑动。这把你推向了高潮的边缘，你松开了他的蛋蛋，让你们俩的肉棒都把精液射满他的嘴，从他的鼻子里喷出来，迫使他因为量太大而吞咽下去。");
            }
            if(get_player().cumQ() >= 500)
            {
               outputText("终于，时机成熟了……你调整好姿势，准备做你心中所想的事。你们的需求都达到了顶峰，马上就要释放了！一旦你在他身后准备就绪，你就把他的头往前推，让他把你的和他的肉棒都含进嘴里。他的舌头试图把你推出去，在你的和他的肉棒之间滑动。这把你推向了高潮的边缘，你松开了他的蛋蛋，让他射精。然而，你自己的精液让他的那点可怜的量相形见绌……迫使他吞下一波又一波你滚烫粘稠的精液。即便如此，这量也超过了他吞咽的能力，精液从他的嘴里喷出来，时不时地从他的鼻子里射出一道弧线，进一步证明了你巨大的射精量。");
            }
         }
         get_combat().cleanupAfterCombat();
      }
      
      public function minotaurNeed() : Boolean
      {
         return get_player().minotaurNeed();
      }
      
      public function minotaurGetsRapedByHerms() : void
      {
         spriteSelect(SpriteDb.get_s_minotaur());
         minoRapeIntro();
         minoCumAddiction(5);
         get_player().slimeFeed();
         get_images().showImage("minotaur-win-herm");
         outputText("[pg]你毫不在意这野兽的感受，双手握住他的肉棒，将它拉向自己，以一个尴尬的角度向上弯曲，让他发出一声颤抖的痛苦牛叫。你凑得更近了，你自己的[cock]撞到了他的后庭，他那淫秽的马状肉棒滴着那散发着奇妙香味的精液，你将它拉向你的" + get_player().vaginaDescript(0) + "，涂抹在你的阴唇上。[pg]");
         outputText("你带着扭曲的笑容和痛苦的咕哝声向前推去，将他的" + get_monster().cockDescriptShort(0) + "滑入你的" + get_player().vaginaDescript(0) + "，同时你的[cock]穿透了他紧致但包容的后门。当你向前推时，你立刻感觉到一股他的先列腺液喷射进你的体内，强行同时贯穿了你自己和他。滑腻的体液在你的腹股沟蔓延开温暖，让你感到头晕目眩，同时欲火焚身，刺激着你将两根肉棒的最后一部分强行塞进各自的洞里。[pg]");
         get_player().cuntChange(get_monster().cockArea(0),true);
         if(get_player().vaginas[0].vaginalLooseness < 3)
         {
            outputText("你脑海中一个被压抑的小部分隐约意识到这应该相当痛苦，但欲望和如毒品般的先列腺液用一波波的快感冲刷掉了这个念头。");
         }
         if(get_player().vaginas[0].vaginalLooseness >= 3)
         {
            outputText("当他留在你体内时，那种强烈的感觉似乎变得越来越强大，他那如毒品般的先列腺液让你的" + get_player().vaginaDescript(0) + "从里到外感到酥麻。");
         }
         outputText("你的[cock]因他的紧致而颤抖，他强有力的心脏的每一次跳动都在他的后庭紧紧地挤压着你。透过你模糊的大脑，你开始意识到你的臀部正以令人不安的速度在他身上活塞运动，用白热化的欲望和牛头人的精液烧毁了你仅存的理智。你操他的时候拍打他的屁股，羞辱这只野兽，当他绝望地发出牛叫和呻吟时，你色眯眯地低头看着他。最后，快感淹没了你，你像大炮一样将精液射入他体内，你的臀部仍然带着不假思索的决心操着他。每一次抽插，精液都从他的尾巴洞里喷溅出来，溅满他的屁股。当这只野兽开始高潮时，一股突然的非人温暖填满了你，随着怪物肉棒每一次抽插进你的" + get_player().vaginaDescript(0) + "，巨大的喷射直接涌入你的子宫。[pg]");
         outputText("你的高潮持续着，直到最后你的肚子被这东西撑大，他的屁股里也充满了你的精液。伴随着一阵踉跄和一声轻响，你摇摇晃晃地挣脱了他，体内装了这么多他那美妙的精液，几乎无法行走。即使是现在，你的身体也因不自然的快感和温暖而酥麻。你咯咯地笑着，意识到这只野兽已经在你脚下昏了过去，他的睾丸只有原来的一半大。");
         get_player().orgasm("Vaginal");
         get_player().orgasm("Dick");
         dynStats(DynStat.Spe(-0.5),DynStat.Inte(-0.5),DynStat.Sens(1.5),DynStat.Cor(1));
         get_player().knockUp(2,432);
         get_combat().cleanupAfterCombat();
      }
      
      public function minotaurFunWithUnbirthing() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_minotaur());
         get_player().slimeFeed();
         minoCumAddiction(5);
         outputText("当你俯视着被击败的牛头人时，一种熟悉的酸痛感从你那怪异子宫的深处升起。你那大张着、滴落着淫液的小穴因期待而颤抖，你的史莱姆孩子们蜂拥而出，覆盖住这头巨大的公牛，在你庞大而无法移动的身躯被它们轻轻放到石地上时，它们覆盖住怪物，开始缓慢地将它拖入你的小穴。你咯咯地笑着，看着它挣扎，它的" + get_monster().cockDescriptShort(0) + "在空气中渗出令人陶醉的先列腺液。反正你的[armor]也不足以遮盖你的小穴，你干脆靠在肚子上，抬起双腿把它脱掉，露出你的" + get_player().vaginaDescript(0) + "，空气中的气味已经让它比平时更加湿润了。[pg]");
         get_images().showImage("minotaur-win-female");
         outputText("[say:嗯。来妈妈这里，]你说。当这头现在已经失去知觉的野兽长着角的头接触到你的" + get_player().vaginaDescript(0) + "时，你的克制力烟消云散。你的大腿颤抖，脚趾蜷缩，你的小穴扩张，以容纳一个体型轻松达到常人两倍的怪物的插入。[say:小心点，宝贝们，]你对你的孩子们说。[say:别弄疼妈妈。这个很大。]当他的头和上半身消失在你体内后，你向后伸出手，越过你的" + get_player().assDescript() + "，紧紧抓住他那根摇晃的肉柱，它从他仍然露在外面的臀部伸出，卡在你的臀瓣之间。你的络新妇孩子们读懂了你的意图，暂停了它们无情的攻击，让你给这个现在正在窒息的牛头人打飞机。你娇嗔着，惊叹他有多大，让你的臀沟在他的肉棒周围弹跳，同时哄骗他体验他将要经历的许多次高潮中的第一次，然后他最终会被熬成一锅营养丰富的浆糊，供你和你的孩子们享用。在他把一股浓稠的、令人头晕目眩的精液射满你的手和臀瓣后，你把手指举到唇边，吸吮这令人陶醉的佳酿。[pg]");
         outputText("既然你已经玩够了，寄生虫们恢复了它们的任务，将牛头人完全拖入你酸痛的子宫，你陷入了欲望引发的迷雾中，你的肚子向外凸起，显著地变大（尽管大部分是暂时的），以容纳它的新负担。这头野兽肯定会成为一顿不错的盛宴。");
         get_player().cuntChange(get_monster().cockArea(0),true);
         get_player().orgasm("Vaginal");
         get_player().addStatusValue(StatusEffects.ParasiteNephilaNeedCum,3,-2);
         dynStats(DynStat.Spe(-0.5),DynStat.Sens(3),DynStat.Cor(2));
         get_player().knockUp(2,432);
         get_combat().cleanupAfterCombat();
      }
      
      public function minotaurDrinksMilkNewsAtEleven() : void
      {
         spriteSelect(SpriteDb.get_s_minotaur());
         clearOutput();
         get_images().showImage("minotaur-win-breastfeeding");
         outputText("你跪在筋疲力尽的牛头人旁边，把他的头抬到你的[breasts]上。他把口鼻从它们身上转开，仍然试图反抗你。你把他的头按回你的胸前，把你的[nipple]推向他的嘴，但他紧闭着嘴唇。你用拳头捶打他的肚子，迫使他喘口气，同时把你的乳头塞进去。牛头人试图摇头以腾出嘴巴，但你紧紧抓住他的皮毛，让他无法挣脱。他的挣扎只导致几口奶水流进他的嘴里。你挤压你的乳房，让奶水流进他的喉咙。他很快停止了反抗，开始吃奶。他用力吸吮，把奶水从你体内吸出来，每隔几分钟停下来深吸一口气。他很快就吸空了那个乳头，你把另一个放到他嘴边。他顺从地开始吸吮那个，但他因为另一个有点喘不过气来，所以他的吸吮温柔而舒缓。他花了更长的时间才吸空这个乳头，但看到如此强壮的牛头人沦落为虚弱、吃奶的小牛，不知为何让你非常高兴。[pg]");
         outputText("你把你的[nipple]从头晕目眩的牛头人嘴里拔出来，把他留在那里享受他这顿饭的余韵。");
         dynStats(DynStat.Lib(0.2),DynStat.Lust(-50));
         get_player().orgasm("Tits",false);
         get_player().addStatusValue(StatusEffects.Feeder,1,1);
         get_player().changeStatusValue(StatusEffects.Feeder,2,0);
         get_combat().cleanupAfterCombat();
      }
      
      public function minotaurBlowjob() : void
      {
         spriteSelect(SpriteDb.get_s_minotaur());
         clearOutput();
         var _loc1_:int = get_player().cockThatFits(80);
         outputText("你走向牛头人，");
         if(!get_player().isTaur())
         {
            outputText("脱下你的[armor]并");
         }
         outputText("向战败的公牛露出你的[cocks]。野兽既兴奋又震惊地看着你，想到另一个生物要来掌控局面，嘴巴微微张开。在它滴水的肉棒散发出的麝香恶臭中，你几乎迷失了自己，并且");
         if(!get_player().isTaur())
         {
            outputText("抓住公牛的角");
         }
         else
         {
            outputText("把他的角按在你的前腿弯处");
         }
         outputText("，你仿佛开启了自动驾驶一般，引导着它的嘴靠近你的肉棒。[say: 让我们看看你挤奶的技术到底有多好，]你脱口而出；牛头人挑衅地哞叫了一声，但当你的" + Appearance.cockNoun(get_player().cocks[_loc1_].get_cockType()) + "的龟头压进它那牛嘴里时，它很快就安静了下来。[pg]");
         get_images().showImage("minotaur-cocksucker");
         outputText("野兽的口鼻抵着你的感觉有些尴尬，你皱了皱眉，但当怪物开始把你的肉棒含进嘴里时，你很快又对自己的选择重拾了信心。当他的嘴唇包裹住你时，他的眼睛睁得大大的，伴随着");
         if(get_monster().get_lust() >= get_monster().maxLust())
         {
            outputText("他自身燃烧的欲望");
         }
         else if(get_player().hasPerk(PerkLib.ArousingAura))
         {
            outputText("你腐化的力量");
         }
         else
         {
            outputText("你先列腺液的咸味");
         }
         outputText("让他渴望得到更多。[pg]");
         outputText("意识到这一点后，他试图挣脱，想把自己从这场折磨中拯救出来，但在他虚弱的状态下，他的努力就像小猫一样无力。被紧紧抓住牛角的牛头人慢慢屈服了。在欲望的驱使下，他无法控制自己，疯狂地舔舐着嘴里的肉棒，当你往他吸吮的嘴里插得更深时，他那厚厚的牛舌粗暴地缠绕着你的柱身。在怪物麝香和口腔的双重刺激下，你也开始迷失自我，");
         if(!get_player().isTaur())
         {
            outputText("发现你的手离开了他的角，转而按住了他的后脑勺");
         }
         outputText("同时你的臀部开始向他的脸上挺送。在恍惚中你低头看去，只见牛头人正粗暴而徒劳地套弄着自己的肉棒，他的眼中充满了羞耻和绝望——不仅渴望释放他压抑的性欲，更渴望品尝你浓稠的精液。[pg]");
         outputText("你很快就满足了这头公牛；你操弄他脸庞的努力，以及他的头沿着你的肉棒快速起伏，很快就让你放弃了为这怪物保留的那点克制。你把他的口鼻猛地按在你的腹股沟上，俯身压在他的背上，开始用你爆发的精液涂满牛头人的舌头和扁桃体。你伸出");
         if(!get_player().isTaur())
         {
            outputText("你的手");
         }
         else
         {
            outputText("一只前蹄");
         }
         outputText("，打掉了他放在肉棒上的手，迅速制止了他那无关紧要的自我安慰。公牛含着你的肉棒发出一声哞叫作为回应，当他吞下你最后一滴精液时，你爽得浑身发抖。你无法分辨这头野兽是因为发情而脸红，还是因为想起了自己的屈服，但这都不重要了。[pg]");
         outputText("把你自己从那东西的嘴里拔出来，你让这只被蹂躏的生物平趴在地上，然后收拾好你的盔甲准备离开。你回头看了一眼，只看到牛头人已经迷失了自我，正拼命地试图操弄身下的地面，并在过度刺激的痛苦中哞哞直叫。");
         get_player().orgasm("Lips");
         get_combat().cleanupAfterCombat();
      }
      
      public function minotaurAddicted() : Boolean
      {
         return get_player().minotaurAddicted();
      }
      
      public function minoVictoryRapeChoices() : void
      {
         var _g:LustyMaidensArmor;
         var _loc2_:int = 0;
         spriteSelect(SpriteDb.get_s_minotaur());
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,20) >= 1)
         {
            outputText("你低头看着被你击败的敌人，脸上浮现出微笑，你感觉到体内一种熟悉的饥渴感正在滋长。你要怎么做？");
         }
         else if(get_player().get_lust() >= 33 && !get_player().isGenderless())
         {
            if(get_monster().get_lust() >= get_monster().maxLust())
            {
               outputText("你满意地微笑着，看着[monster.short]四肢着地，开始狂热地自慰。遗憾的是，你意识到你自己的需求还没有得到满足。当然，你总是可以操这头急不可耐的公牛……[pg]你要怎么做？");
            }
            else
            {
               outputText("你满意地微笑着，看着[monster.short]倒下，无法继续战斗。遗憾的是，你意识到你自己的需求还没有得到满足。当然，你总是可以强暴这个可怜的家伙……[pg]你要怎么做？");
            }
         }
         else if(get_player().hasStatusEffect(StatusEffects.Feeder))
         {
            if(get_monster().get_lust() >= get_monster().maxLust())
            {
               outputText("你满意地微笑着，看着[monster.short]倒下，无法继续战斗。遗憾的是，你意识到你自己哺乳的需求还没有得到满足。你总是可以让这个可怜的家伙喝一杯……[pg]你要这么做吗？");
            }
            else
            {
               outputText("你满意地微笑着，看着[monster.short]倒下，无法继续战斗。遗憾的是，你意识到你自己哺乳的需求还没有得到满足。你总是可以让这个可怜的家伙喝一杯……[pg]你要怎么做？");
            }
         }
         else if(get_monster().get_lust() >= get_monster().maxLust())
         {
            outputText("你满意地微笑着，看着[monster.short]四肢着地，开始狂热地自慰。");
         }
         else
         {
            outputText("你满意地微笑着，看着[monster.short]倒下，无法继续战斗。");
         }
         menu();
         addButtonDisabled(0,"用肉棒","这个场景需要你有一根合适的肉棒和足够的性奋度。");
         addButtonDisabled(1,"用小穴","这个场景需要你有一个小穴和足够的性奋度。");
         addButtonDisabled(2,"两者都用","这个场景需要你是双性人并且有足够的性奋度。这个场景不适用于半人马形态。");
         addButtonDisabled(3,"触手肉棒","这个场景需要你至少有两根肉棒，其中至少一根应该是触手，并且有足够的性奋度。");
         addButtonDisabled(4,"尿道交","这个场景需要你有一根足够长但不太粗的肉棒和足够的性奋度。");
         addButtonDisabled(5,"让他口交","这个场景需要你有一根合适的肉棒和足够的性奋度。");
         addButtonDisabled(6,"互相安慰","这个场景需要你有一根肉棒和足够的性奋度。");
         addButtonDisabled(7,"被填满","这个场景需要你是一个精液成瘾者。");
         addButtonDisabled(8,"乳交","这个场景需要你是一个拥有大胸或娜迦尾巴的精液成瘾者。");
         addButtonDisabled(9,"产卵","这个场景需要你有一个产卵管和足够的卵。蜜蜂产卵还需要生殖器。");
         addButtonDisabled(10,"哺乳","这个场景需要你有足够的乳汁。","哺乳");
         var _loc1_:int = get_player().cockThatFits(get_monster().analCapacity());
         if(get_player().get_lust() >= 33)
         {
            if(_loc1_ >= 0)
            {
               addButton(0,"用肉棒",bumRapeaMinotaur).hint("用你的肉棒操他的屁股。");
               addButton(6,"互相安慰",minoMutual).hint("用大量温柔的前戏操他的屁股。");
               if(get_player().cockTotal() > 1 && get_player().countCocksOfType(CockTypesEnum.TENTACLE) > 0)
               {
                  addButton(3,"触手操",rapeMinotaurTentacles).hint("触手风味的爆菊。");
               }
            }
            if(get_player().hasCock())
            {
               _loc2_ = 0;
               while(_loc2_ < get_player().cockTotal())
               {
                  if(get_player().cocks[_loc2_].cockThickness <= 4 && get_player().cocks[_loc2_].cockLength >= 14)
                  {
                     addButton(4,"尿道操",minoUrethralPen).hint("把你的鸡巴插进他的鸡巴里。","尿道操");
                     break;
                  }
                  _loc2_++;
               }
               if(get_player().hasCockThatFits(80))
               {
                  addButton(5,"让他口交",minotaurBlowjob).hint("享受口交。","让他口交");
               }
            }
            if(get_player().hasVagina())
            {
               addButton(1,"用小穴",girlRapeAMinotaur).hint("骑乘他的鸡巴。");
            }
            if(get_player().isHerm() && _loc1_ >= 0 && !get_player().isTaur())
            {
               addButton(2,"双管齐下",minotaurGetsRapedByHerms).hint("一边操他的屁股，一边用他的鸡巴。");
            }
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,20) >= 1 || get_player().hasPerk(PerkLib.MinotaurCumAddict))
         {
            addButton(7,"被灌满",takeMinoCumDirectly).hint("让你的屁股被注入精液。");
            if(get_player().biggestTitSize() >= 5 && !get_player().hasTailInsteadOfLegs())
            {
               addButton(8,"乳交他",minoGetsTitFucked).hint("用你的乳房榨取他的精液。");
            }
            else if(get_player().isNaga())
            {
               addButton(8,"前列腺榨汁",minoGetsTitFucked).hint("用你的尾巴榨取他的精液。");
            }
         }
         if(get_player().canOvipositSpider() || get_player().canOvipositBee() && !get_player().isGenderless())
         {
            addButton(9,"产卵",layEggsInAMinotaurSpiderLike).hint("一边操他的屁股，一边用他的鸡巴。");
         }
         if(get_player().hasPerk(PerkLib.Feeder) || get_player().lactationQ() >= 1000)
         {
            addButton(10,"母乳喂养",minotaurDrinksMilkNewsAtEleven).hint("喂养这只超大号的小牛犊。");
         }
         if(get_player().hasVagina() && get_player().biggestTitSize() >= 4 && get_player().get_armor() is LustyMaidensArmor)
         {
            _g = get_player().get_armor();
            addButton(11,"盔甲乳交",function():void
            {
               _g.lustyMaidenPaizuri();
            }).hint("淫荡少女的乳交。");
         }
         if(get_player().statusEffectv1(StatusEffects.ParasiteNephila) >= 10)
         {
            addButton(12,"子宫吞噬",minotaurFunWithUnbirthing).hint("喂养你子宫里的寄生虫。");
         }
         if(get_player().hasMultiTails())
         {
            addNextButton("强迫梳毛",get_game().forest.kitsuneScene.kitsuneGenericFluff).hint("让[themonster]梳理你的尾巴。").sexButton(-1);
         }
         setSexLeaveButton();
      }
      
      public function minoUrethralPen() : void
      {
         spriteSelect(SpriteDb.get_s_minotaur());
         minoRapeIntro();
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         while(_loc1_ < get_player().cockTotal())
         {
            if(get_player().cocks[_loc1_].cockThickness <= 4 && get_player().cocks[_loc1_].cockLength >= 14)
            {
               _loc2_ = _loc1_;
               break;
            }
            _loc1_++;
         }
         get_images().showImage("minotaur-win-male");
         if(get_player().statusEffectv1(StatusEffects.Infested) == 5)
         {
            outputText("你恶意地咧嘴一笑，把牛头人推倒仰面朝天，他那巨大的马鞭在他落地时伴随着一声闷哼拍打在他的胸膛上。当你凝视着他那根极好的肉棒时，你抚摸着你的" + get_player().cockDescript(_loc2_) + "，突然因快感而颤抖，因为你[sack]里的虫子在美味地蠕动，其中一些连同大量的先列腺液一起从你的顶端逃了出来。那群可怜的蠕动寄生虫一瘸一拐地爬向倒下的野兽，这给了你一个邪恶的主意，当你跨过牛头人并紧紧抓住他的肉棒时，你的全身都因为兴奋而发红。意识到你的计划，你的寄生宠物开始在你的蛋蛋里快乐地翻腾，同时你把你的先列腺液涂抹在牛头人的尿道上。[pg]");
            outputText("这头野兽从战败的恍惚中惊醒，脸上露出极度恐惧的表情，因为他感觉到自己的龟头上有一种不自然的蠕动，他猛地坐直身子，发出一声惊恐的[say: 哞！！]，同时拼命挣扎着想拉开与你那被寄生的精液的距离。你对他微弱的逃跑企图发出病态的狂笑，并紧紧抓住他的肉棒头部，当你抓住他那膨胀的肉棒将他拉回你身边，并将你的" + get_player().cockDescript(_loc2_) + "的头部对准他的尿道时，他痛得闷哼了一声。他的目光与你交汇，眼神中充满了恳求和绝望，而你的睾丸则因期待而膨胀。你无法抑制那被寄生的精液中邪恶的蠕动，你邪恶地咧嘴一笑，将你那跳动着、被寄生的肉棒深深地插入了他的肉棒中。[pg]");
            outputText("牛头人扭动着、呻吟着，公然表现出恐慌，但又虚弱得无法反抗，当你将你的" + get_player().cockDescript(_loc2_) + "在他的尿道里来回抽插时，你享受着这只曾经强大的野兽所表现出的无助神情，同时你感觉到你的虫子正稳步地顺着你的肉棒往下爬。他一定感觉到了虫子在往下爬时是如何让你的肉棒鼓起来的，当虫子接近你的肉棒末端时，他浑身发抖，摇着头表示拒绝。你发出一阵微小的狂喜痉挛，舌头从你的[face]伸出，第一批虫子从你的龟头涌出，直接进入了野兽的尿道。[pg]");
            outputText("一接触到他的精液，你的寄生虫就进入了超速状态，牛头人那带有麝香味的麻醉精液刺激了它们，它们突然开始从你的睾丸中涌出。你再也无法抑制高潮，你咆哮着挺起臀部，将自己完全插入他的肉棒中，同时蠕动的精液脉冲直接射入他的前列腺和睾丸。你用双手紧紧抓住他，感受着你的宠物在他的尿道和你的尿道里那种奇妙而变态的蠕动，真正享受着为你的宠物寻找一个新家来寄生的想法，你的大脑几乎因为释放而变得一片空白。你因为寄生在这样一头强大的野兽身上而流着口水，突然感觉到一条大虫子在你的尿道里鼓起来，因为它射入了牛头人体内，让你因为快感而发抖，也让可怜的牛头人因为突然的高潮而肌肉紧绷。你汹涌的精液和虫子将他的精液直接推回他体内，他痛苦地大叫，眼泪从眼睛里流出来，因为他一定感觉到了难以忍受的压力，当然，除了那淫秽的快感之外……[pg]");
            outputText("牛头人浑身发抖，眼睛睁得大大的，张着嘴发出令人窒息的尖叫，他的阴囊开始明显地蠕动，然后膨胀，随着翻滚的寄生虫而肿胀。你的虫子不需要浪费精力去压制这头野兽，它们直接开始做它们被创造出来要做的事情，把这个牛头人变成一个不断射精、爬满虫子、一滩烂泥的性奴——一个由你的宠物提供的无尽高潮的奴隶，就像你一样。这个想法让你最后一次高潮，一大股爬满虫子的精液让他的睾丸淫秽地肿胀起来，然后你终于拔了出来。满足但疲惫的你，一屁股坐在你的[ass]上，恍惚地抚摸着自己，感受着你[sack]里的大虫子快乐地蠕动着，同时你看着那只蠕动着、刚被寄生的牛头人在山洞的泥土里扭动，你的脸上露出了邪恶的笑容。[pg]");
            outputText("伴随着哞哞的叫声和呻吟声，这头野兽屈服于他的新[say: 朋友们]的淫秽服侍，开始自己手淫起来，他的脸上带着一种迟钝、呆滞的幸福表情，他那巨大的马屌在他的抓握下明显地蠕动着。");
            if(get_player().cumQ() < 1000)
            {
               outputText("随着他的抽插，他那淫秽蠕动的阴囊在屁股上弹跳着，先列腺液和虫子顺着他的肉棒两侧流下，他那被强化的睾丸并没有阻碍他为了虫子而渴望射精，他越来越用力地手淫着。你注入他体内的精液已经让它们肿胀到了大西瓜的大小，蠕动的寄生虫把他的睾丸变成了造虫工厂，你带着一种恍惚的自豪感看着他。他的先列腺液慢慢漏出，偶尔会有一两条虫子掉在他的胸膛上，野兽急切地加快了速度，随着牛头人咬紧牙关，他的阴囊紧贴着腹股沟，滴落的液体变成了一股稳定的水流。[pg]");
            }
            else if(get_player().cumQ() < 5000)
            {
               outputText("他那极度肿胀的睾丸垂在屁眼上，巨大的体积撑开了他的双腿，迫使他仰面躺着手淫。他那伸展开来的阴囊里，巨大的睾丸比他的头还要大，大约有沙滩排球那么大，它们将源源不断的虫子和精液泵入牛头人的马屌中，淫秽地滴落在他肌肉发达的胸膛上，让他再次达到了高潮的顶峰。[pg]");
            }
            else
            {
               outputText("这头野兽极度肿胀的睾丸竟然在手淫时把他的腿抬到了半空中，每一个蛋蛋都几乎和牛头人的整个躯干一样大！你暗自轻笑，对你那巨大的射精量和你的宠物提供的额外肿胀感到印象深刻，你看着他的睾丸带着被寄生的货物美味地翻滚着，努力把这头公牛变成一个生产虫子、喷射精液、超高产的性爱工厂。精液和虫子从野兽的射精管里倾泻而出，你猜测那是他的高潮，蠕动的白色粘液淫秽地溅满了他的胸膛和脸庞。但你意识到这一定只是[say: 先列腺液]的喷发，因为野兽很快就弓起背，更用力、更快地手淫起来，他真正的高潮即将到来。[pg]");
            }
            if(get_player().cumQ() < 5000)
            {
               outputText("野兽高潮了，喷射出一股浓稠的、爬满虫子的精液，直冲洞穴顶部，导致爬满虫子的精液像雨点一样落在你们俩身上。喷射持续了几分钟，把整个洞穴内部都变成了充满虫子和精液的白色，直到牛头人的眼睛翻白。他喘着粗气，流着口水，他的新朋友们覆盖了他身体的每一寸。你因为兴奋而发抖，他的一些虫子顺着你的" + get_player().cockDescript(_loc2_) + "爬回你的体内，进入你的[balls]，重新填满你消耗的储备，同时你站起身，走向那头被寄生的野兽，他几乎失去了意识，完全感觉不到从他的肉棒里传来的源源不断的快感。它终于平息下来，变成涓涓细流。你在他爬满虫子的额头上印下一个吻，轻笑着离开了他，让他去面对作为一个好色且贪得无厌的传播寄生虫的动物的命运。[pg]");
            }
            else
            {
               outputText("野兽咆哮着，他那可怕肿胀的蛋蛋翻滚着，绝对是倾盆大雨般的被寄生的精液从他蠕动的马屌中喷射而出，巨大的射精压力竟然把牛头人向前推去。这头牛头人身体的每一块肌肉都紧绷着，无尽的水流真的开始淹没洞穴，一寸又一寸蠕动的精液在地上汇聚，直到没过你的脚踝，像一条淫秽的河流一样从洞穴入口倾泻而出。随着他的水流减弱，牛头人突然把臀部挺向空中，开始了第二次喷射，他的阴囊开始缩小了一点，成加仑的精液从洞穴里倾泻而下，顺着山坡流下。看着你那被寄生的玩具一次又一次地向洞穴墙壁喷射，那种满足感是无法估量的，你感觉到虫子在你自己的[balls]里重新聚集，准备好让你变态的解剖结构再次传播寄生虫。公牛的最后一发子弹变成毛毛雨，他的睾丸缩小到至少可以带着他的新[say: 朋友们]走路而不会被他那被强化的造精工厂绊倒的程度。躺在[if (metric) {九厘米|三英寸}]深的精液洪水中，被寄生的牛头人在他那巨大的高潮之后立刻昏了过去。[pg]");
               outputText("你走过去把他拉起来靠在墙上，不想让你的性爱野兽在疲惫的沉睡中淹死在自己的精液里。你轻笑了一声，离开他走向洞口，这时山下突然传来一阵声音引起了你的注意。牛头人洞穴下方的整个山坡都被爬满虫子的精液染成了白色，当你低头看到几个小恶魔和一只地狱犬在徒劳地对抗着新释放的虫群时，你忍不住从肺里发出歇斯底里的笑声，大量的寄生虫强行进入它们的体内，导致它们的肉棒和睾丸膨胀肿大。当你走回营地时，你听到它们惊恐的尖叫声变成了狂喜的嚎叫声，你回头看了一眼，看到浓稠的精液像间歇泉一样在你身后很远的地方喷向空中。你微笑着拍了拍你那被寄生的蛋蛋，为你那邪恶的共生宠物的工作感到自豪，并决定找个时间再次把它们释放到一些毫无防备的猎物身上……");
            }
         }
         else
         {
            outputText("被欲望和疲劳所克服，牛头人倒在地上，而你不慌不忙地脱下你的[armor]。牛头人的目光在你的身体上游走，他那巨大的肉棒坚硬而跳动着。你慢慢开始抚摸自己坚硬的肉棒，先列腺液开始浓稠地从龟头流下，流过你的手。你的手在你长长的肉棒上下滑动，用你的汁液润滑它，同时你决定如何处置面前这头倒下的野兽。一个想法在你的脑海中形成，你的肉棒因为期待而跳动，你的想象力已经构思出了有趣的细节。[pg]");
            outputText("你用沾满先列腺液的手粗暴地抓住他肥大的肉棒，把它涂抹在他膨胀的龟头上，感觉它在你的手中因为快感而跳动。你把你的" + get_player().cockDescript(_loc2_) + "的头部压在他的龟头上，开始慢慢地画圈摩擦，把你甜美的先列腺液涂满它膨胀的顶端，同时你的另一只手慢慢地抚摸着他的肉棒。牛头人闭上眼睛，享受着你的手和" + get_player().cockDescript(_loc2_) + "摩擦他自己的感觉。就在这时，你采取了行动。你突然把你的" + get_player().cockDescript(_loc2_) + "用力推向他那马一样的肉棒宽大的头部。自然地找到了唯一可用的洞，你的" + get_player().cockDescript(_loc2_) + "在第一次粗暴的抽插中就完全滑入了他的尿道。牛头人惊讶地睁大了眼睛，因为他的尿道被突然撑开而大声地哞哞叫。随着你的抽插，他的哞哞声很快变成了闷哼声，但你并不关心他是在享受还是在痛苦，你只对紧紧包裹着你的" + get_player().cockDescript(_loc2_) + "的紧致洞穴感兴趣。[pg]");
            outputText("牛头人的闷哼声慢慢变成了愉悦的呻吟声，因为他的身体屈服于你给他的拉伸，甚至偶尔向你挺进，试图让你更多地进入他体内。你得意地笑了，因为你成功地把这头强大的野兽变成了你享受的另一个性玩具。当他再次向你挺进时，你决定满足他。你用双手紧紧抓住他肉棒膨胀的头部，把他的肉棒进一步拉向你的肉棒。它压在你的腹股沟上，你感觉到你的" + get_player().cockDescript(_loc2_) + "顶端有一种紧绷的压力。你再次推挤，却感觉到一种热液涂满了你的" + get_player().cockDescript(_loc2_) + "的头部。低头一看，你意识到你的整个长度都已经填满甚至超过了他自己的长度——随着每一次用力的抽插，浓稠的精液从他体内沸腾而出，温暖的液体溅在你的龟头上！你继续把你的" + get_player().cockDescript(_loc2_) + "捣入他的肉棒中，在他覆盖着龟头的热精液的帮助下，你的高潮很快就到来了。你急切地将速度提高了一倍，没过多久，你就把你的" + get_player().cockDescript(_loc2_) + "尽可能深地插入他体内，把你的种子直接释放到他的尿道里。你微笑着（伴随着牛头人的一声呻吟）意识到，他那西瓜大小的睾丸和前列腺可能会被拉伸得很厉害，但这个想法很快就被抛到一边，因为大量的精液以强大的喷射力从你体内倾泻而出。随着每一次连续的精液喷涌，你感觉到他的睾丸肿胀得越来越大，直到你卸下最后一滴。[pg]");
            outputText("你审视着你高潮的结果，非常满意，甚至有点自豪。他的睾丸肿胀得怪异，现在大得让他难以移动。牛头人痛苦地呻吟着，你突然想到，在他目前的状态下，他也无法射精。当你把你那沾满精液的肉棒从他现在大张着的尿道里拔出来时，另一个邪恶的想法浮现在你的脑海中。你推了牛头人一把，让他胸部着地。他的屁股撅在半空中，双腿张得大大的，臀部高高抬起，因为他身下有沙滩排球大小的睾丸。你伸手到他身下，把他的肉棒拉向你，让它紧贴着地面，他沉重的睾丸把它压住。尿道口仍然因为你给它的捣弄而淫秽地大张着，你的精液缓慢地流出来。你的手滑过你的肉棒，收集涂在上面的精液，然后伸手下去，把它涂在他紧致的屁眼上，感觉它在你的指尖下收缩和夹紧。你继续涂抹，直到你的精液慷慨地涂满了它。你用力拍打他的屁股，然后转过身，尽可能大声地叫喊，知道这会引起听力范围内每一个好色生物的兴趣。你回头看了一眼牛头人，看到他因为害怕而睁大了眼睛，开始哞哞叫，拼命想摆脱他所处的困境。你犹豫了一下，看到这么诱人的目标，但你对自己的表现感到疲倦，你把挣扎的生物留给了山里的居民。[pg]");
            outputText("你知道，在他成功射精之前，他将无法离开或进行太多挣扎，但由于他的睾丸压住了他的肉棒，这可能需要一段时间。与此同时，他撅起的屁股和被撑开的尿道邀请周围的每个人轮流来一次。");
         }
         get_player().orgasm("Dick");
         get_combat().cleanupAfterCombat();
      }
      
      public function minoRapeIntro() : void
      {
         spriteSelect(SpriteDb.get_s_minotaur());
         clearOutput();
         if(get_monster().get_HP() <= 0)
         {
            outputText("你把这头几乎失去意识的野兽翻转过来，把他的屁股抬高到膝盖以上。缠腰布翻开，让你完美地看到了他正在变硬的阴茎。在大多数方面，它看起来像马的阴茎，尽管它的长度上似乎有多个包皮环。从那根奇妙变粗的阴茎上散发出来的气味令人愉悦，却又带着麝香味，而且极其强烈。");
            if(int(get_player().vaginas.length) > 0)
            {
               outputText("牛头人满怀希望地回头看着你，当他的目光落在你的" + get_player().vaginaDescript(0) + "上时，他的" + get_monster().cockDescriptShort(0) + "抽搐了一下。");
            }
            else
            {
               outputText("牛头人眼中充满绝望地回头看着你，似乎意识到你不会帮助他的" + get_monster().ballsDescriptLight() + "摆脱困境。");
            }
         }
         else
         {
            outputText("你带着野蛮的笑容扯下牛头人的缠腰布，拍打着他的屁股，欣赏着他的" + get_monster().ballsDescriptLight() + "在你的击打下摇晃的抖动。牛头人带着欲望轻柔地哞哞叫着，他兴奋时流出的先列腺液溅落在地上。从他身上散发出来的麝香味和他那一滩光滑的先列腺液令人难以抗拒，当你感觉到血液涌向腹股沟时，你很难思考");
            if(get_player().totalNipples() > 1)
            {
               outputText("和乳头");
            }
            outputText("。");
            if(int(get_player().vaginas.length) > 0)
            {
               outputText("牛头人满怀希望地回头看着你，当它的目光落在你的" + get_player().vaginaDescript(0) + "上时，它的" + get_monster().cockDescriptShort(0) + "抽搐了一下。");
            }
            else
            {
               outputText("牛头人回头看着你，眼中充满绝望，他怀疑你是否会帮忙缓解他" + get_monster().ballsDescriptLight() + "的窘境。");
            }
         }
      }
      
      public function minoPheromones() : void
      {
         var _g:Combat;
         outputText("牛头人对你笑了笑，掀起他的缠腰布，朝你弹了一下。粗大的先列腺液在空中飞舞，");
         if(Utils.rand(3) == 0)
         {
            outputText("在你反应过来之前就拍打在你的脸上！你把那滑溜溜的、像鼻涕一样的东西从眼睛和鼻子上抹掉，");
            if(get_player().get_lust100() > 75)
            {
               outputText("不假思索地吞进嘴里。");
               dynStats(DynStat.Lust(10 + get_player().lib / 10));
            }
            else
            {
               outputText("当你用舌头舔去嘴唇上的残留物时，你感觉到你的心因欲望而跳动。");
               dynStats(DynStat.Lust(5 + get_player().lib / 20));
            }
         }
         else
         {
            outputText("正好擦过你的头。");
         }
         outputText("它那野兽般的气味似乎钻进了你的体内，麝香的香气在你的腹股沟燃烧出一条液态热量的路径。");
         get_player().takeLustDamage(10 + get_player().lib / 20);
         if(get_player().hasPerk(PerkLib.MinotaurCumAddict) || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,20) >= 2)
         {
            if(Utils.rand(2) == 0)
            {
               outputText("[pg]<b>你因渴望而颤抖，只想把脸埋在那块缠腰布下，吸干每一滴黏糊糊的美味。</b>");
            }
            else
            {
               outputText("[pg]<b>你呻吟着，一遍又一遍地舔着嘴唇，渴望在嘴里尝到他的味道。</b>");
            }
            dynStats(DynStat.Lust(5 + Utils.rand(5)));
         }
         if(get_player().get_lust() >= get_player().maxLust())
         {
            doNext(get_game().combat.endLustLoss);
         }
         else
         {
            _g = get_game().combat;
            doNext(function():void
            {
               _g.combatMenu();
            });
         }
      }
      
      public function minoMutualPt3(param1:int) : void
      {
         clearOutput();
         get_images().showImage("minotaur-win-male");
         outputText("首先，你必须掰开他紧抓着你手肘的手，把你自己的手从他那根疯狂漏液的肉棒那闷热的拥抱中拽出来。牛头人畏缩了一下，一只手握着他现在正在跳动的分节阴茎，另一只手还在按摩着他巨大的睾丸。");
         outputText("[pg]你咧嘴一笑，把自己的[cock]握在手里，对准牛头人刚刚被撑开的马眼。你低头看着他，寻求他的确认，他带着梦幻般且有些犹豫的点头回应了你。");
         outputText("[pg]你把自己的[cock]握在手里，开始用龟头顶住牛头人尿道那被撑宽的洞口。随着你慢慢增加压力，一声颤抖的牛叫从他紧咬的牙关中挤了出来。当你的[cockHead]滑入他体内时，牛头人的声音破音了，他全身的肌肉在接纳你时都紧绷着。");
         if(get_player().cocks[param1].cockLength <= 7)
         {
            outputText("[pg]当你突然插入他体内时，他闷哼了一声。紧紧包裹着你[cock]的那个洞被撑得比你的手能撑开的还要大得多。他的身体又开始不由自主地挺动起来，你抓住他马形阴茎那膨大的冠状沟，强行把更多的[cock]塞进他那令人极度愉悦的滚烫肉洞里，以此来帮助他。");
         }
         else if(get_player().cocks[param1].cockLength > 7 && get_player().cocks[param1].cockLength <= 11)
         {
            outputText("[pg]牛头人呻吟着，你分不清那声音是出于快感还是痛苦，因为你撑开了他的尿道来容纳你的[cock]，这个洞比你的手能撑开的要大得多。他花了一秒钟来适应这种感觉，一旦适应了，就开始向上挺动迎合你。你决定帮他发泄出来，抓住他那膨大的马形阴茎的冠状沟，然后开始强行把更多的[cock]塞进他那粘滑滚烫的精液通道里。");
         }
         else if(get_player().cocks[param1].cockLength > 11)
         {
            outputText("[pg]牛头人的脸扭曲着，他那桶状的胸腔里发出一声奇怪的低吼。他的尿道正如你所希望的那样被撑开了，接纳了你的[cock]，即使它的主人在你身下喘息和呻吟。他睁大眼睛颤抖着，揉搓着自己那分节的马形阴茎，你可以透过他大肉棒那滚烫粘滑的内壁感觉到他的手。一旦你觉得他足够放松了，你便开始移动。你展现出令人印象深刻的自控力，将你的[cock]滑进滑出，一开始动作很慢，让他习惯以这种方式容纳你的长度。然而，一旦他开始轻柔地迎合你挺动，一切就都失控了。你抓住他那分节的马形阴茎膨大的冠状沟，开始强行把更多的[cock]塞进他那粘滑精液通道的滚烫拥抱中。");
         }
         outputText("[pg]你狠狠地操着他那根巨大的马形阴茎，尽可能多地把你的[cock]塞进他体内。当你毫无理智地捣弄着他的肉棒时，你能感觉到他沸腾的精液在你的肉棒周围涌动。");
         outputText("[pg]当你把你的唾液和他精液的残留物擦到他的大腿上时，牛头人虚弱地对你笑了笑。你微笑着继续你的口交攻势，决心吸干他睾丸里每一滴滚烫的精液。");
         outputText("[pg]当你努力让牛头人的声音一次又一次地破音、起伏时，一抹亮光吸引了你的目光。看过去，你看到一个装有冒泡粉色液体的瓶子放在一些干涸的体液中间，这可能是地精和其他生物战斗的遗留物。哦，你可以用它做很多事情。");
         outputText("[pg]你恶作剧地笑着，从地上捡起那瓶催情剂。他一点也不反对，因为你对他那魁梧的身体倾注了极大的关注，他已经神志不清了。你握住他分节的阴茎，拔开催情剂的软木塞，开始将混合物倒入他马屌膨大的头部。牛头人随着你的动作烦躁不安，迫使你收紧握力，以防止液体在你完成之前溢出。");
         outputText("[pg]有那么一会儿，你只是坐着看液体冒泡，想知道这种催情混合物如果通过他的尿道口而不是他牛唇摄入，会对牛头人产生什么影响。");
         outputText("[pg]仿佛在回答你未问出口的问题，随着牛头人的先列腺液与混合物混合，液体的颜色开始变得越来越浅。液体翻滚和冒泡的程度有所减轻，但它散发出的气味让你流口水。这是一种令人陶醉的性爱和你最喜欢的食物的结合，你自己的味蕾变得变态。把你的[face]靠近牛头人的阴茎，你深深地吸了一口气。");
         outputText("[pg]接着，你对这荒谬的一切咧嘴一笑，将嘴唇贴在他那膨胀的龟头上，吸了一口。这混合物就像一种清淡的饮料，但最后却带着类似酒精的刺激感。");
         if(get_player().get_gender() == 1)
         {
            outputText("[pg]瞬间，[eachCock]就完全勃起了。这种催情混合物，可能因为混入了牛头人的精液而发生了改变，让你的胸口感到一阵温暖。你感到强烈的性交冲动，想要用[eachCock]操你遇到的任何东西。即使是现在，你也能感觉到你那饥渴的下体正在分泌爱液，迫切需要一个洞来填满。");
         }
         else if(get_player().get_gender() == 3)
         {
            outputText("[pg]瞬间，[eachCock]就完全勃起了，而你的[pussy]也乞求着被填满。这种催情混合物像酒精一样温暖了你的[chest]，这可能是因为牛头人的精液与催情药剂混合在了一起。你的脑海被操与被操的双重冲动所占据。[EachCock][if (cocks > 1) {strain|strains}]着想要填满一个紧致的洞，而你的[pussy]则想要一些巨大且流着汁液的东西塞进它那流着爱液的开口。即使是现在，你也能感觉到你那饥渴的下体正在分泌爱液，你忍不住想知道这附近是否还有另一个牛头人，好来做一个[name]三明治。");
         }
         outputText("[pg]你喝下了你创造的鸡尾酒，每一口都给你的大脑和[eachCock]带来令人陶醉的愉悦。你的[face]扭曲成一个傻笑，你的下体随着每一口而躁动。");
         outputText("[pg]牛头人喘着粗气，而你则伸手抓住你的[cock]。当你揉弄你的肉棒时，你看着牛头人那诱人的魁梧身躯。他的脸因狂喜而扭曲，翻着白眼，舌头伸在外面。他那巨大的桶状胸膛快速起伏，乳头和他的肉棒一样硬。他那巨大的马屌高高耸立，就像一座不断漏出白色奶油瀑布的塔。他那巨大的睾丸紧紧贴着身体，就像两块活着的巨石，上面覆盖着被他漏出的精液染成深色的绒毛。然后是他的洞，一个闪烁的小东西，被两瓣厚实、雕塑般的臀肉包围着，看起来非常适合打屁股。就好像这个充满阳刚之气的强壮牛头人是为了你的快乐而生的一样。");
         outputText("[pg]当你将你的[cockHead]压在他那闪烁的肛门入口时，你感觉到这个牛头人紧绷了起来，显然他不习惯被任何肉棒插入，包括像你这样的[cock]。");
         if(get_player().cocks[param1].cockLength < 10)
         {
            outputText("[pg]当你向前挺动臀部，沉入他那紧致得令人窒息、闷热的尾洞隧道时，牛头人退缩了。当你完全没入他体内时，他发出一声闷哼，你的[cock]伴随着一声低吼沉入他紧致的后门。他睁大眼睛抬头看着你，显然在试图决定他是否喜欢被操的感觉。");
            outputText("[pg]你没有给他做决定的机会。相反，你开始抽动臀部，将你的[cockHead]猛烈地撞击他的前列腺。他发出一声响亮的哞叫，他的身体瞬间向你敞开，让你开始真正地猛烈捣弄牛头人那渴望的洞穴。");
         }
         else if(get_player().cocks[param1].cockLength >= 10 && get_player().cocks[param1].cockLength <= 24)
         {
            outputText("[pg]当你向前挺动臀部，将你的[cock]强行塞进他那紧得不可思议的尾洞隧道时，牛头人发出痛苦的闷哼。然后你开始将肉棒完全没入这个显然以前从未被操过的牛头人体内。多亏了他的发情期，你不需要温柔。你用力推挤他的直肠防线，用蛮力将它们一一击破，牛头人在痛苦与快乐交织的混乱感觉中扭动和抽搐。这花了一些功夫，但很快你就成功地将你的[cock]的全部长度没入了他那勉强配合的尾洞中。");
            outputText("[pg]现在你已经成功地将他的内脏塑造成你的[cock]的形状，你开始像活塞一样抽插那个颤抖的洞，直到它的主人在你们两人之间冰冷的泥土上抓挠。你的臀部以稳定而严酷的节奏猛烈撞击他翘起的屁股。他颤抖的哞叫声撕裂了空气，因为他的身体被迫向你的直肠突击敞开，让你能够真正地猛烈捣弄牛头人现在渴望的洞穴。");
         }
         else if(get_player().cocks[param1].cockLength > 24)
         {
            outputText("[pg]当你将你的[cockHead]塞进他那紧得难以忍受的处女尾洞隧道时，牛头人的整个身体都紧绷了起来。你勉强将你的龟头塞进牛头人不欢迎的直肠入口，但这并不重要，因为一旦你进去了，你就会开始将你那巨大的肉棒的其余部分强行塞进他可怜的小洞里。不过，多亏了他的发情期，尽管你很难让他的洞容纳你所有的[cock]，但他似乎并没有受苦。在用你的[cock]猛烈撞击他的肛门壁，并强迫它们伸展以容纳你那巨大的[cock]一段时间后，你成功地将你的操穴棒完全埋入了他的操我洞中。");
            outputText("[pg]你在这里停留了一分钟，看着牛头人紧闭双眼，尽管他的肉棒因兴奋而颤抖。然后你毫不客气地开始猛烈地操弄牛头人那完美紧致的洞。你的臀部猛烈撞击他肌肉发达的臀部，在空气中发出有节奏的拍打声，那声音更像是雷鸣而不是掌声。当你扭曲他的身体，用每一次全长的抽插刺穿他的肠子时，牛头人尖叫、哞叫、狂吠，乞求更多。尽管他的嘴唇有时会发出痛苦的声音，但很明显他很享受你将他的洞操得红肿的方式。");
         }
         outputText("[pg]你的臀部在牛头人张开的屁股上敲击出肉欲的鼓点。他的声音提供了一个深沉的低音号角，与你胸腔中隆隆的低吼声相呼应。这色情的音乐在空气中升起，就像两位大师一样，你们两人同步演奏出一首在整个玛瑞斯都从未听过的曲调。");
         outputText("[pg]你无情抽插的不断增加的力量导致他的肉棒旋转起来。旋转的性器官向四面八方喷洒出珍珠般的先列腺液，偶尔会拍打在你的[chest]上。它甩动的样子几乎具有催眠作用，仿佛那粗壮的马肉在乞求一些关注。");
         outputText("[pg]你决定全力以赴，而且因为你也有些口渴，你抓住他那巨大的肉棒，将膨胀的龟头塞进你的嘴里，同时你继续以野生动物般的凶猛操他。");
         outputText("[pg]双重快感让牛头人几乎尖叫出声，他的肉棒开始疯狂分泌精液。精液涌入你的嘴里，他的气味充满了你的鼻腔。你渴望他的精液，他的屁股，他的乳头和他的嘴唇。你想操他，操他，一直操到他的蛋蛋精疲力尽为止。你想让这个强壮的雄性婊子怀上你的种，直到他那颤抖的肠道里塞满你射入的海量精液，看起来就像怀孕了一样。你想让他直接从源头给你提供一顿苦乐参半的生猛男人汁液大餐。你想拉扯他的蛋蛋，拍打他的屁股，用你所知道的他喜欢的所有方式扭捏他的乳头。你想射精无数次，让他能在舌尖上尝到你的精液味道。");
         outputText("[pg]你的欲望在体内翻涌，你发现自己正在拉扯牛头人的乳头，那是一团坚硬如钻的肉块，向你伸展，仿佛在召唤你。你用力拉扯扭捏，力度刚好能让他明白你的意图，但又不至于弄疼他。当你一边操他一边吸吮拉扯时，他的声音变得紧绷。然后你空出的那只手抬起，伴随着一声响亮的拍打声落在他的壮硕屁股上。这让他原本就紧致得令人沉醉的后穴更加用力地夹紧你。你接受了这肉体上的邀请，一边狠狠地操他，一边时不时地拍打他的屁股，扭捏他的乳头。");
         outputText("[pg]你把一切都给了牛头人，你能感觉到你们俩的交媾即将结束。所以你一边吸吮一边操弄，乳白色的浓精从你的嘴角漏出。你吸吮的吧唧声几乎被你那粗壮的肉棒撞击牛头人壮硕屁股的啪啪声所淹没。当你继续深喉他那分节的肉棒，同时把他的屁股撑得大开时，牛头人发出了很容易被误认为是痛苦的叫声。你感觉到他的直肠肉套紧紧裹住你的[cock]，你将你的[cock]强行塞进他痉挛的洞穴，清楚地知道接下来会发生什么。");
         outputText("[pg]你的牛头人伴侣发出了一声大得难以置信的类似牛叫的声音，震动了他的全身。片刻之后，他滚烫浓稠的精液沸腾溢出，当他猛烈地射进你嘴里时，你的味蕾被滚烫的肉棒汁液的味道唤醒了。");
         outputText("[pg]当你把他的快乐小穴操得稀巴烂时，它颤抖的样子实在是太诱人了。");
         if(get_player().balls > 0)
         {
            outputText("[pg]你感觉到你的[balls]收缩翻腾，突然间，你的眼睛向上翻白，世界陷入了一片黑暗。伴随着被你满嘴喷射的马屌闷住的喉音呻吟，你开始用白热的精液河流粗暴地灌满牛头人紧缩的直肠肉套。");
         }
         if(get_player().cumQ() <= 25)
         {
            outputText("[pg]当你的精液喷射进呻吟的牛头人体内时，你浑身颤抖。");
            outputText("[pg]抬头看去，你看到他龇牙咧嘴，汗水覆盖的身体上每一块肌肉都清晰可见，当你射进他的直肠肉套时，他浑身紧绷。伴随着他的精液顺着你的下巴流下，你在高潮中继续操他。即使你呻吟着，你的嘴唇依然紧紧锁住他的肉棒，没有吞下兽人的一滴精液，而是让它充满你的口腔并滴落出来，同时你填满了他的屁股。");
            outputText("[pg]当你猛干他的屁股时，牛头人的声音提高了，享受着你自己的精液在他体内的感觉。你一直操他，直到你的[cock]再也承受不住高潮后操弄的强烈快感。于是你把你的[cock]从他的快乐小穴里拔出来，留下它大张着，闪烁着你刚刚注入的精液的光泽。");
         }
         else if(get_player().cumQ() > 25 && get_player().cumQ() <= 250)
         {
            outputText("[pg]当你的[cock]将你珍珠般的精液泵满他全身时，你浑身颤抖。");
            outputText("[pg]抬头看去，你看到他龇牙咧嘴。汗水覆盖的身体上每一块肌肉都清晰可见，当你射进他的直肠肉套时，他浑身紧绷。伴随着牛头人自己那惊人的精液顺着你的下巴流下，你在高潮中继续操他。即使你自己的高潮达到顶峰，你的嘴唇依然紧紧锁住他马屌那膨大的龟头，没有吞下他的一滴精液，而是让它充满你的口腔并溢出，就像你的精液填满他的屁股并溢出一样。当你粗暴地捣弄他时，他那被精液润滑的肠壁发出了色情的吧唧声。");
            outputText("[pg]牛头人的声音变大了，试图与你用肉棒猛烈撞击他粗壮屁股时发出的肉体拍击声相匹配。你猛烈地抽插着他奇妙的屁股，直到你的[cock]再也承受不住你高潮后快速抽插带来的强烈感觉。你嘴里含满了牛头人的精液站了起来，把你的[cock]从他快乐的洞里拔了出来。他饱受蹂躏的尾巴洞大张着，一股细细的奶油状精液从闪闪发光的入口流出");
         }
         else if(get_player().cumQ() > 250 && get_player().cumQ() < 500)
         {
            outputText("[pg]你将你那喷涌的[cock]深深地操进牛头人紧缩的洞穴里，伴随着强有力的冲刺，拍打着他肌肉发达的屁股。当你粗暴地将你强效的精液越来越深地射进他那令人飘飘欲仙的直肠肉套时，他开始在无助的兴奋中呜咽。");
            outputText("[pg]抬头看着他，你看到他因狂喜而龇牙咧嘴。他身上的每一块肌肉都向外凸起，当他射进你嘴里时，他浑身紧绷。你那惊人的精液仍在流入他的体内，导致他轮廓分明的腹肌因为过多的液体而变得有些模糊，身体也随之变厚。即使你自己的高潮还在继续，你的嘴唇依然紧紧锁住他那粗大马屌膨大的龟头，没有吞下他的一滴精液，而是让他的精液充满你的口腔并顺着你的下巴流下，就像你的精液填满他的屁股并顺着他的股沟流下一样。你那仍在喷射的[cock]在他那结满精液的肠壁里进进出出，发出色情的吸吮声，你拼尽全力地让他怀上你的种。");
            outputText("[pg]牛头人的声音提高了，随着你每一次摧毁他后庭入口的冲刺而破音。你们的身体结合在一起，伴随着响亮的肉体掌声和湿润的吧唧声，你用肉棒猛烈撞击他坚硬肌肉的屁股，同时用水管冲洗他的内脏。你在整个高潮过程中一直操他，直到你的[cock]再也承受不住你高潮后粗暴冲刺所带来的强烈快感。于是你起身，牛头人的精液从你的嘴角滴落，你把你的[cock]从牛头人的快乐小穴里拔出来。你的浓精从他现在拔出塞子、大张着的洞穴里滴落。它顺着他壮硕背部肌肉发达的裂缝滑下，当他挤压直肠肌肉把你的精液往外推时，形成了一滩惊人的水洼。");
         }
         else if(get_player().cumQ() >= 500)
         {
            outputText("[pg]你将你那汹涌的[cock]猛烈地撞进牛头人那令人飘飘欲仙的操穴里，听着你强有力的冲刺像火箭一样撞击他肌肉发达的屁股所发出的啪、啪、啪的声音。当你发狂般地开始将你滚烫的浓精射进他的直肠深处时，他嚎叫起来。");
            outputText("[pg]抬头看着他，你可以看到他因狂喜而龇牙咧嘴。他身上的每一块肌肉都向外凸起，当他射进你嘴里时，他浑身紧绷。他的肚子开始肿胀，你泵入他体内的液体量之大，导致他的腹肌消失在一个看起来更像是怀了双胞胎的女人的肚子下面。即便如此，你的高潮仍在肆虐，你的嘴唇依然紧紧锁住他那粗大马屌膨大的龟头，没有吞下他浓稠的精液，而是让它充满你的口腔并顺着你的下巴流下。当你完全支配这个性感的牛头人时，你能感觉到你的精液从他的快乐小穴里溢出，顺着他的股沟流下，你拼尽全力地让他怀上你的种。");
            outputText("[pg]牛头人的声音提高了，随着你每一次摧毁他肌肉发达的屁股的冲刺而破音。你们的身体发出了响亮的肉体掌声，他的肚子还在肿胀。你继续保持着，享受着沸腾的精液河流，它在直肠壁上结块，并在你的[feet]周围飞溅。很快，你就站在了一滩大得有些滑稽的男人乳汁水洼里，看起来更像是一个小湖泊，而不是别的什么。");
            outputText("[pg]感到有些疲惫的你站起身来，牛头人的精液在你的[face]上闪闪发光，你紧闭着嘴，把色情的内容物困在里面。当你把你的[cock]从牛头人被蹂躏的洞穴里拔出来时，你的精液像瀑布一样流出。当它顺着他的股沟倾泻而下时，牛头人呻吟着，他的肚子收缩着，把你的精液往外推，直到他轮廓分明的肚子恢复了几分原样。");
            outputText("[pg]精疲力尽，肛腔里滴着精液，牛头人的四肢垂下，完全放松下来。他的呼吸是剧烈消耗后粗重的喘息，他的眼睛下垂，一只手揉着你刚刚操得稀巴烂的洞穴。");
         }
         outputText("[pg]但你还没完。你用一只[feet]踢开他的双腿，他顺从地抬起腿，尽管显得有些疲惫。你把臀部压在他柔软的马鸡巴上，嘴唇紧紧贴住他的嘴。");
         outputText("[pg]当你张开嘴时，你感觉到他胸腔里发出一声低沉的呻吟，因为他接受了自己甜美的精液回到体内。你们接吻时，你把身体贴在他身上，摸索着、摩擦着，你们的舌头也交织在一起。然后你感觉到他把甜美的鸡巴奶油推回你的嘴里。这个吻很激烈，你们交换着唾液和精液，一些液体顺着你们的脸颊流下，牛头人最后一次将他精液的最后残渣吸回嘴里。过了一会儿，你站起身，看到一串珍珠般的粘液连接着你们的嘴唇。他抬头看着你，聪明的棕色眼睛温顺而顺从。你咧嘴一笑，用手臂背面擦去嘴唇上的奶油，将牛头人的精液涂抹在上面。你跪在他上方，以一种不具威胁性但又不失主导地位的方式俯视着他。");
         outputText("[pg]你命令他让你看看，牛头人服从了，张开嘴，让你凝视着聚集在他宽阔舌头周围的奶油状鸡巴奶油，白色的牙齿沐浴在粘稠的美味中。你的一句话就足以让他闭上嘴，他突出的喉结上下舞动，吞下了自己美味的男人乳汁。");
         outputText("[pg]说完，你向前倾身，让他把你的脸弄干净。他湿润的舌头完全清理了你的[face]和脖子。等他完成后，你在这个顺从的牛头人嘴唇上快速啄了一下，然后站起身，寻找你丢弃的[armor]。");
         outputText("[pg]当你穿好衣服时，牛头人已经沉沉睡去，你离开了他，他的肚子里装满了精液，脸上带着微笑。");
         get_player().orgasm("Dick");
         get_combat().cleanupAfterCombat();
      }
      
      public function minoMutualPt2(param1:int) : void
      {
         var x1:int;
         var _g:MinotaurScene;
         clearOutput();
         outputText("你的[chest]在极度的疲惫中起伏着，你的身体因高潮后的快感而刺痛。当你沉浸在这种感觉中时，绝望的打飞机声把你拉回了现实。你的新炮友还在疯狂地撸着他那根大马屌，随着发情期的加剧，他的手变成了一道棕色的残影。");
         outputText("[pg]当你想到他不仅天生具有容易发情的牛类生物学特征，而且还出生在一个充满腐化的土地上时，这有点可悲。谁能说如果他没有出生在这些特定的环境中，他不会成为一个更好的人呢？糟糕的是，无论他多么努力地打飞机，这都是徒劳的。当你把他那只巨大的牛拳从他跳动的马屌上拉开时，他没有反抗，当他意识到你要信守诺言时，他的脸上露出了如释重负的表情。");
         outputText("[pg]你低头看着他那根发情的马屌。肿胀的性器官明显地跳动着，渗出液体来润滑一个它甚至没有插入的洞。除了它那喇叭状的龟头和分段的脊状突起外，它的表面还有粗大的静脉，在他那危险地肿胀的阴茎紧绷的皮肤下明显地跳动着。");
         get_images().showImage("minotaur-loss-oral");
         outputText("[pg]当你向前倾身，把嘴唇贴在第一个肿胀的脊状突起上时，那根马肉柱几乎要碰到你的[face]了。一阵剧烈的痉挛突然让他的身体抽搐了一下，这清楚地告诉你，感觉到你的嘴贴在他那颤抖的种马阴茎上，对他来说是多么大的解脱。当你的嘴唇移动时，他颤抖着，他的肌肉收缩导致他那高耸的马屌在你的[face]上跳动。伴随着每一次亲吻，他的阴茎再次抽动，你把它当成了一场游戏，亲吻一个脊状突起，让反应把它从你的嘴里夺走，然后再选择另一个脊状突起并再次亲吻它。起初你的小游戏几乎和脱衣扑克一样有趣，但很快你就准备好进入下一个阶段了。");
         outputText("[pg]毫无预兆地，你把那根不听话的马屌拉向你的[face]，并伴随着一声低吼，用嘴唇锁住了那变宽的马眼。你的牛头人脸上露出了惊讶的表情，他抽搐着咕哝了一声，然后平静下来，任由你摆布。你开始吸吮从他那喇叭状的龟头渗出的浓稠、滚烫的精液。当你直接从源头喝下他甜美的先列腺液时，你固定住他那仍在弯曲的马屌。当他的牛头人精液在你的牙齿间汇聚时，你没有吞下去，而是把混合物吐回他那肉乎乎的阴茎上，然后再吸更多，重复这个过程。");
         outputText("[pg]牛头人扭动着身体，他那低沉的声音变得几乎像女孩一样尖锐，发出了几声可能是痛苦也可能是快乐的尖叫声。他开始把臀部推向你，你把舌头卷过那喇叭状的龟头，舔起更多他那浓稠的精液吐出来，浸湿他的阴茎。");
         outputText("[pg]一旦你吃饱了他那美味的肉棒，你就把他那坚如磐石的马屌推向他那肌肉线条分明的肚子，开始舔牛头人肿胀的睾丸。你的[tongue]在皱巴巴的皮肤上漫无目的地游走，让他唱起了一首无助的兴奋之歌。你用嘴唇锁住那柔软的皮肤并吸吮，用温柔的亲吻按摩着他那隐隐作痛的蛋蛋。");
         outputText("[pg]你听着牛头人的声音在痛苦而又狂喜的呻吟中升高。以他的声音为向导，你找到了他阴茎和睾丸最敏感的部位。你让他保持在边缘状态，不给他你知道他射精所需的全部注意力，并戏弄他进入一种完全疯狂的状态。");
         outputText("[pg]作为对你让他保持在边缘状态的回应，这个强壮的发情公牛人开始呜咽。起初他试图压抑它，以显示一些尊严，但过了一会儿他就放弃了这一切。他甚至开始恳求你，他那低沉的男中音恳求你结束他发情的痛苦。这太可爱了，他认为你需要被告知他的困境，就好像从你的位置很容易看出他那充满精液的蛋蛋仍然非常需要甜蜜的释放一样。你告诉他你们俩达成了一项协议，他勉强挤出了一个微笑以示承认，就好像他想相信你，但他不确定他是否能相信。");
         outputText("[pg]当你站起来时，他用一种敬畏和恐惧的奇怪组合看着你。就在那时，你把你的[cock]拿在手里，跨坐在他身上，把它扔在他那根大马屌上，发出了清晰的啪嗒声。");
         if(get_player().cocks[param1].cockLength < 15)
         {
            outputText("[pg]低头一看，你发现他比你大，但这并不重要，仅仅是把你的[cock]贴在他的上面，就导致他的先列腺液泵得更厉害了。你开始抽插，慢慢地把你的[cock]在他的上面摩擦。");
            outputText("[pg]那些脊状突起带来了一种有趣的感觉，就像小小的色情减速带。然而，尽管这对你来说感觉很好，但你可以看出牛头人更喜欢它。他在你身下喘息、呻吟、扭动，就像一个乖巧的母牛婊子。");
         }
         else if(get_player().cocks[param1].cockLength >= 15)
         {
            outputText("[pg]低头一看，你发现你的[cock]比他的大，你低头看着他，[chest]因骄傲而膨胀。当你那更大的勃起躺在他的上面时，他的先列腺液开始泵得更厉害了。当你开始抽动臀部时，他发出了一声深沉的、让身体颤抖的呻吟。你咧嘴一笑，继续把你的[cock]在他那分段的马阴茎上摩擦。");
            outputText("[pg]那些脊状突起在你的肉棒上感觉很好，每一个都是你向下压的性感小凸起。当你专注于在他那肿胀的大马屌上摩擦时，你身下的牛头人颤抖着。他在你身下喘息、呻吟、扭动，就像一个乖巧的母牛婊子。");
         }
         outputText("[pg]你继续这样做，看着牛头人咬紧牙关，他的身体开始颤抖得更厉害。然后你开始加快速度，每一次抽插都比上一次稍微快一点。");
         outputText("[pg]你伸出手，用手把你的阴茎往下压，把它贴在他的上面以增加摩擦力，从而增加快感。你必须承认，哪怕只是对自己承认，把你的[cock]在他的上面摩擦开始让你有感觉了。他那分段的马屌的脊状突起在你的[cock]下腹部感觉简直太棒了。");
         outputText("[pg]很快你几乎是在把你的[cock]在他的上面猛击，而他也迎合着你，像个疯子一样为了自己的释放而努力。");
         outputText("[pg]当你突然停止用你的肉棒摩擦他时，他发出了一声沮丧的低吼，但几秒钟后他又羞怯地道了歉。你轻笑一声，告诉他要有耐心，然后伸手去抓他那根正在漏液的阴茎。");
         outputText("[pg]他的马形阴茎摸起来很烫，你紧紧握住那膨大的龟头，这样即使他的阴茎骨弯曲，也无法挣脱。他那乳白色的先列腺液气味刺鼻，当它在周围的冠状沟里积聚时，气味充满了你的鼻腔。");
         outputText("[pg]然后，你用空着的那只手的食指，轻轻挠着他的马眼。这让他发出一声响亮的呻吟。你用夸张的温柔抚摸着他那根漏液的肉棒。你用这种方式挑逗着他，一只手像老虎钳一样紧紧握住他的肉棒，另一只手则挑逗着他的马眼，持续了一会儿。然后他开始颤抖。他拼命地想要坚持住，想要否认你保持不动对他造成了多大的影响。");
         outputText("[pg]他失败了。很快他的臀部开始疯狂地扭动，他张开的双腿弯曲着，不断地挺动和抽搐。多亏了你紧紧握住他的肉棒，这并没有阻止你继续挑逗他。你抬起头，看到他眼中混合着渴望和疯狂，他的双手抓起两把泥土，但即便如此，他还是露出了困惑的笑容，似乎不确定自己是否喜欢被这样挑逗。");
         outputText("[pg]在他做出决定之前，你把手指伸进他那滚烫粘稠的马眼中，逼得他发出一声颤抖的牛叫。这只牛头人的下巴一直张着，双腿笔直地伸向你的两侧。当他伸手去揉自己的睾丸时，你知道完全是纯粹的快感在引导他的动作。");
         outputText("[pg]从他的反应中你可以看出他很享受，所以你决定加大赌注，把另一根手指也伸进他那滚烫漏液的洞里。两根手指撑开了那个洞，牛头人的阴茎肌肉像个快乐的肌肉小人一样收缩着。你低下头，看到牛头人正在揉搓他的睾丸，但仔细一看，你发现他还在按压自己肿胀的会阴。他被挑逗得快疯了。当你抽出手指，把精液涂抹在他坚硬如石的乳头上时，他发出了一声呜咽。");
         outputText("[pg]这个牛头人咬着嘴唇，臀部贪得无厌地在你的手上摩擦着。为了让他稍微冷静一点，你把三根手指塞进他的马眼里。这完全没用，甚至让他变得更加狂野，他试图在泥土里扭动他那巨大的屁股，并且用两只手揉搓着他的会阴和睾丸。");
         outputText("[pg]然后你强行把第四根手指塞了进去。当你堵住他的洞时，他的声音破音了。随着他那刺鼻的男人体液完全被堵住，他终于瘫软下来，但只有一秒钟。毫无预兆地，[say:操——]从他的胸腔中爆发出来，他伸手抓住自己的角，全身的肌肉都紧绷起来，因为你的手指在你强行塞入的那个粘滑滚烫的通道里扭动着。如果不是因为你的手指，牛头人现在就已经射了，你从刚刚涌向你手指的那股滚烫的液体就能知道。可惜他那滚烫粘稠的牛精液唯一能去的地方，就是回到它来的地方。");
         outputText("[pg]然后你把手指从那个充满精液的洞里拔出来，用你的[tongue]舔掉上面色情的残留物。");
         outputText("[pg]你把食指再次伸进他的马眼里，准备进行第二轮，你发现你可以很容易地撑开那个洞。");
         outputText("[pg]当你用第二根手指插入他的精液通道时，他喘着粗气，跳起了一段性感的小舞。你的两根手指感觉就像被包裹在一个闷热、肉感光滑的通道里。");
         outputText("[pg]当你把第三根手指推入他的精液通道时，他的声音带上了一丝恳求的意味，你感觉到那里的血肉被撑得更开了。他强壮的大腿紧绷着，你用空着的手抚摸着那坚硬如钻的肌肉。当你的手指在他体内四处移动，试图强行撑开那个肉洞时，他颤抖着。很快，你就能把第四根手指放进他滚烫的马眼里了。");
         outputText("[pg]在你还没来得及思考如何把拇指伸进他那根巨大的马形阴茎之前，他就开始疯狂地挣扎，像发情的母狗一样在你的手指上操着自己。当他这样做的时候，你收起拇指，让它沉入他那根疯狂分泌着先列腺液的肉棒那滚烫粘稠的深处。这个被欲望冲昏头脑的牛头人甚至抓住了你的手，他的肉棒突然把你一直吞没到上臂，他一定非常喜欢你撑开他洞穴的感觉，既然他这么喜欢，你能想到一些能给你们俩带来震撼快感的事情。");
         _g = this;
         x1 = param1;
         doNext(function():void
         {
            _g.minoMutualPt3(x1);
         });
      }
      
      public function minoMutual() : void
      {
         var x1:int;
         var _g:MinotaurScene;
         clearOutput();
         spriteSelect(SpriteDb.get_s_minotaur());
         var _loc1_:int = get_player().cockThatFits(get_monster().analCapacity());
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2337) <= 0)
         {
            outputText("牛头人身上的每一块肌肉都鼓胀起来，他不顾一切地套弄着肿胀的马屌。尽管他显然在用力地撸动着那根被称为阴茎的肉柱，但他的眼中却没有一丝释放的希望。他只是坐在那里，盲目地刺激着自己，无法让自己达到高潮，但也无法停止尝试。");
            outputText("[pg]尽管他刚才还想把你强暴得死去活来，但你还是忍不住对这头发情的半人兽的处境感到有些同情。");
         }
         else
         {
            outputText("你摇了摇头，低头看着那个牛头人，尽管他深陷发情期，却还在拼命地试图让自己达到高潮。你知道，他之所以试图强暴你，更多是因为他那牛类的生理结构和腐化的结合……所以你决定帮帮这个可怜的家伙，清空他那肿胀的大蛋蛋。");
            outputText("[pg]你抓住了这个发情牛头人的角。你用力握住他的角，强行引导他的视线，让牛头人看着你的[eyes]，以此帮助他在你说话时集中注意力。");
            outputText("[pg]当你告诉他你愿意让他射精时，他的眼中燃起了希望的火花。在他变得过于兴奋之前，你定下了规矩，让他知道他必须先让你高潮，然后你才会尝试让他那根肿胀的大鸡巴喷出浓稠的乳白色精液。当你问他这样是否可以时，他用力地点头，突然变得非常愿意做你要求的任何事，只为从他那牛类生理结构引起的折磨人的兴奋中得到解脱。");
            outputText("[pg]于是，在得到他的一声赞同的咕哝并握手成交后，你毫不客气地脱下了你的[armor]。一旦你完全赤裸，你站稳[feet]，将自己展现在他面前。");
         }
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,2337,FlagDict_Impl_.arrayReadInt(_loc2_,2337) + 1);
         outputText("[pg][EachCock]在你的[legs]间晃动，勃起并渗出液体。发情的牛头人看着你男子气概的证明。他被[eachCock]深深迷住了，以至于一滴口水从他厚厚的嘴唇中漏出，顺着下巴流了下来。在擦去他毛茸茸的下巴上明显被[eachCock]吸引的证据后，他毫不客气地把脸埋进了你的腹股沟。");
         outputText("[pg]当他把脸埋进你的腹股沟时，灼热的呼吸像一阵暖风拂过[eachCock]。他深深地吸着你的气味，双眼翻白，沉浸在纯粹的极乐之中。尽管他动作急切，但他还是设法没有用他的角刺穿你，除此之外，他似乎完全迷失在你那充满雄性麝香的气息中。");
         get_images().showImage("minotaur-cocksucker");
         outputText("[pg]当他的嘴唇滑过你那坚硬的" + get_player().cockDescript(_loc1_) + "表面时，他的舌头伸了出来，快速地舔了一口。为了他自己那根发情的肉棒，这只牛头人已经完全向你屈服了，而且，你不得不承认，让这个高大阳刚的牛头人像个饥渴的小荡妇一样亲吻和摩擦你的脸，让[eachCock]像个底部有洞的装满精液的杯子一样漏个不停。很快，牛头人厚厚的嘴唇离开了，他抬头看着你，珍珠般的先列腺液水滴在他那牛一般的面容上闪烁，就像一颗颗色情的小钻石。");
         outputText("[pg]他湿润的嘴唇贴在你的[cockHead]上，那吻如此温柔，比起一个刚才还想强奸你的人，这更像是一个情人的吻。随着他的下一个吻，他厚厚的嘴唇用闪亮的唾液涂满了你的龟头，唾液顺着他的下巴流下，他开始饥渴地吸吮你那漏着液体的勃起。然后他长长的舌头滑过你的尿道口，可能是在寻找更多证据，证明他的劳动会结出预期的果实。当他找到时，他用嘴唇锁住你的[cockHead]，然后伴随着一声响亮的“啵”声拔出，一阵快感传遍你的全身，让你不由自主地发出一声闷哼。");
         outputText("[pg]知道自己找对了路子，牛头人一次又一次地吸吮着你的[cock]头。他那机关枪般亲吻带来的突然的“啵、啵、啵”声，像子弹一样将尖锐的快感射入你的[cock]，让你随着每一次响亮的咂嘴声快速抽搐。然后，正当你开始习惯这种美妙的感觉时，他的舌头伸了出来。牛头人开始用他宽阔平坦的舌头粗暴地舔舐你[cock]的腹部，每一次用力的吸吮都在下面涂满了口水。你强迫[legs]支撑着你，但它们却感到一阵无力。");
         outputText("[pg]当他抬头看着你时，你可以看到他眼中燃烧的欲望。看着那熊熊烈火，你通过收缩阴茎肌肉来煽风点火，让你的[cockHead]跳起来，落在在他厚厚的嘴唇上。");
         if(get_player().cocks[_loc1_].cockLength <= 10)
         {
            outputText("[pg]他慢慢地将你渗着液体的[cock]含进他火热的嘴里。他那柔软的双唇简直是人间天堂，强健的肺部将你的[cock]吸入这牛头人饥渴的口腔中。他把你含在那里，发出一声低沉的呻吟，震颤着你的[cock]，带着极度满足的神情，愉快地吞吐着你的整根肉棒。接着，他把鼻子埋在你的腹股沟处，闭上眼睛，深深地吸了一口你的气味。");
            outputText("[pg]当他把你的[cock]夹在唇间开始哼哼时，你的声音化作一阵急促的喘息。就在他的声音震动着口腔的同时，他那宽大的牛舌滑上了你的肉棒，卷住你坚硬如石的[cock]，引得你发出一声响亮的呻吟。");
            outputText("[pg]接着，牛头人开始上下吞吐。你的[cock]在他的唇间进进出出，发出响亮的咕叽水声。你的身体因渴求而颤抖，他双唇的每一次吸吮和起伏的舌头完美配合，仿佛要让你的肉棒像火山爆发一样喷射出来。");
            outputText("[pg][say:嗯……]他一边说着，一边抚摸着自己粗大的马屌，同时加快了速度。看来他真的完全沉浸其中了。");
         }
         else if(get_player().cocks[_loc1_].cockLength > 10 && get_player().cocks[_loc1_].cockLength <= 20)
         {
            outputText("[pg]他以夸张的慢动作，将你渗着液体的[cock]含进他火热的嘴里。他那柔软的双唇简直是一小片天堂，强健的肺部将你的[cock]吸入这牛头人饥渴的口腔中。当你的[cockHead]顶到他喉咙深处柔软如天鹅绒般的软肉时，牛头人突然被呛到了，被你[cock]的长度给噎得干呕起来。你低头一看，发现他还没含到你的腹股沟，似乎很难把你完全吞进喉咙。他的第二次尝试又以一阵干呕和咳嗽告终，不过你不得不承认，这感觉对你[cock]的敏感软肉来说还挺爽的。不过第三次总算成功了，当你的[cock]顶到他喉咙深处时，他完美地吞咽了下去。强有力的喉部肌肉将你的[cock]拽进了它该待的地方——他那火热紧致的喉咙通道里。");
            outputText("[pg]当他慢慢向你的腹股沟移动时，你的声音化作一阵急促的喘息和低沉的呻吟。他喉咙的紧致、舌头的湿润以及呼吸的灼热交织在一起，带来一种令人心悸的快感，随着他的每一个动作达到顶峰。你发现自己正努力向前挺动肉棒，试图帮助这个牛头人，结果他扭曲着脸，紧紧抓住你的[legs]来稳住自己。");
            outputText("[pg]像一个真正的雄性兽人一样，他坚持不懈，每一次吞咽都将你更多的[cock]纳入他喉咙那闷热的怀抱中。当他宽大的鼻孔终于贴上你的腹股沟时，你几乎要在这一刻失控。你不得不抓住他的角，阻止他的动作，以免过早地将精液灌满他的喉咙。");
            outputText("[pg]低头看去，你看到牛头人眼中闪烁着心领神会的光芒。你深吸一口气，平复自己汹涌的性欲。既然你已经控制住了用精液灌满他喉咙的冲动，你轻轻敲了敲他的角，示意他继续。");
            outputText("[pg]仿佛是为了炫耀，他扭动着头，强健的喉咙挤压着你的[cockHead]，让你全身痉挛。");
            outputText("[pg]牛头人开始上下套弄，将你的整根肉棒吞入他火热的喉咙。一阵美妙的吧唧声响起，与你剧烈起伏的[fullChest]中不受控制地溢出的情色旋律交织在一起。");
            outputText("[pg][say:嗯……]他呻吟着，一边加快速度，一边抚摸着自己长长的马鞭。每次他完全吞下你的肉棒时，口水都会从他模糊的嘴唇上甩出。看来他真的渐入佳境了。");
         }
         else if(get_player().cocks[_loc1_].cockLength > 20)
         {
            outputText("[pg]他慢慢地将你渗出液体的[cock]拉进他火热的嘴里，每次呼吸都让他的脸颊鼓起。他那柔软的嘴唇是通往天堂的大门，它们努力包容你的[cock]，将你推向极乐的境界。当你的[cockHead]触碰到他喉咙深处柔软如天鹅绒般的肉时，牛头人大声干呕，被你的[cock]噎住了。低头看去，你发现还有一大截肉棒没被吞下，而他的鼻孔正扩张着，试图吸入更多的空气。");
            outputText("[pg]当他用力将自己压向你的[cock]时，口水从他紧绷的嘴唇上滴落。他的第二次尝试以失败告终，他的呕吐反射猛烈地将你的[cock]吐出，伴随着一阵干呕和口水，这在你的敏感肌肤上感觉棒极了。他再次尝试，这次你的[cockHead]探入他的喉咙，却又因为他的头不由自主地抽动而被吐出。然而他丝毫没有气馁。每一次失败似乎都重新激发了他更加努力的欲望，每一次尝试都是一场在滴着口水的[cock]上奏响的狂暴感官交响乐。");
            outputText("[pg]接着，牛头人突然露出了极其专注的神情。就好像他拒绝让你的[cock]打败他一样。他皱着眉头，嘴巴被你的肉棒撑得大大的，咽了下去。这一次他没有干呕或噎住。这一口顺畅地将你的[cockHead]拉入了他美妙喉咙那如天鹅绒般的深处。你听到一声干呕，接着又是一声，但他坚持了下来，尽管你[cock]的长度迫使大团的牛口水从他的嘴唇溢出。他休息了一秒钟，眼睛湿润了，在心理上准备好迎接你那根硬挺肉棒的剩余部分。");
            outputText("[pg]当每一次滴着口水的吞咽将你更多的[cock]拉入牛头人闷热的喉咙时，你的脸上浮现出笑容。他的进展缓慢但稳定。他喉咙美妙的颤动、他那令人心痒难耐的情色嗓音以及他口腔的湿润让你浑身发抖。有那么一秒钟，你以为他能做到，但遗憾的是，他停了下来。看来他在生理上无法触及你的腹股沟。");
            outputText("[pg]你看着沮丧的牛头人因失败而垂下肩膀，但感觉他的喉咙、舌头和嘴唇努力包裹你的[cock]的感觉棒极了。所以，感觉到他需要鼓励，你敲了敲他的角。当他睁开眼睛，抬起头迎上你的目光时，你给了他一个令人安心的微笑。你感觉到一次吞咽顺着你的[cock]传导，导致牛头人干呕。你觉得很有趣，在轻笑中呻吟了一声，他开始在你的肉棒上上下吸吮。他不遗余力，一只手抓住你[cock]没放进他嘴里的那部分，用它将你拉进拉出他厚厚的嘴唇。很快他就进入了状态，口水四溅，他把脸埋进你的[cock]里，直到他干呕、退缩，然后重复。");
            outputText("[pg][say:嗯……]他呻吟着，一边品尝你，一边抚摸着自己粗大的马鞭。他似乎很高兴能给你带来快感。看来他真的渐入佳境了。");
         }
         outputText("[pg]他仍然抚摸着自己粗大的马鞭，任由你的[cock]从他的嘴唇滑落。");
         if(get_player().cocks[_loc1_].get_cockType() == CockTypesEnum.HUMAN)
         {
            outputText("[pg]他握住你的[cock]，在自己的脸上摩擦，将你渗出的先列腺液涂抹在他牛一般的五官上。宽大的鼻孔深深吸入你[cock]的气味。他又这样做了几次，整个过程中他都闭着眼睛，沉浸在无声的狂喜中。就好像这个牛头人试图记住你的气味一样。他越来越多地将嘴唇在你的硬挺的[cock]上摩擦，每一次圆润湿滑的嘴唇滑过都会拉扯你敏感的肌肤，导致你的[cock]滴下液体，而牛头人则迷失在狂喜中。");
            outputText("[pg]随着他崇敬的动作继续，你开始将你的[cock]推向他那柔软湿润的厚嘴唇形成的缝隙中。从他那双黑眼睛向上看的方式，以及他开始更用力地套弄自己肉棒的方式，你知道这让他疯狂地兴奋起来。他空出的手紧紧抓住你的[legs]，当你用不断增加的力量将你那根坚硬且渗着液体的肉棒推向他的脸时，他紧紧地抓着。");
         }
         else if(get_player().hasKnot(_loc1_))
         {
            outputText("[pg]他用好奇的手指包裹住你肿胀的肉结，牛一般的五官上带着疑问。当他轻轻的挤压让你迎着他的手挺动时，他那充满阳刚之气的五官绽放出一个露出牙齿的灿烂笑容。他开始用鼻子蹭你的肉结，亲吻并吸吮那肿胀的神经束。那种刺痛感很快就爆发成一种让人大脑炸裂的挺动冲动。");
            outputText("[pg]于是你将你的[cock]推入他那柔软、布满口水的嘴唇形成的缝隙中。他调整着脸部的位置，让你的肉结撞击他的嘴唇，在每一次挺动的顶点，他都会吸吮你[cock]上那柔软肿胀的部分。");
            outputText("[pg]一只强有力的手抓住你的[cock]并将其拉起。牛头人开始认真地吸吮你的肉结，让你抓住他的角，将自己压向他的脸。他没有做任何事来阻止你，恰恰相反，他把口水吐在你敏感的肉结上，保持嘴唇湿润。这一切都是为了你的快感。");
         }
         else if(get_player().cocks[_loc1_].get_cockType() == CockTypesEnum.HORSE)
         {
            outputText("[pg]他握住你的[cock]，手环绕着你那根粗大如马鞭般的肉棒根部。他深深地吸了一口……又吸了一口。看来他真的很喜欢你[cock]散发出的雄性麝香。他闭上眼睛，享受了片刻。");
            outputText("[pg]然后他的脸上绽放出一个笑容，一个你不确定自己是否应该害怕的笑容。他以一种让你抽搐的方式握住你的[cockHead]。看来他完全知道该怎么对付像你这样的肉棒。");
            outputText("[pg]他开始用舌头舔过每一节，用唾液沐浴着你[cock]的腹部。你咬住下唇，嘴唇被吸进牙齿间，同时将你的[hips]向前挺。接着他开始轻咬每一个隆起，你突然被带入了一个情欲的天堂，你的[cock]渗出一团团的先列腺液。");
            outputText("[pg]但他还没完。他开始亲吻吸吮你的[cockHead]，像喝最甜美的花蜜一样喝下你滴落的先列腺液。");
         }
         else
         {
            outputText("[pg]他以极其缓慢的动作舔舐你[cock]的腹部。他重复了几次这种折磨人的做法。然后他捏住你的[cock]，用紧握的拳头将你珍珠般洁白的先列腺液挤到他的舌头上。他一直这样，直到你的精液漂亮地停留在宽大的舌头上。");
            outputText("[pg]当他对积聚在舌头上的[cock]汁液量感到满意时，他抬起头看着你，眼中带着疑问。你笑了，因为你意识到他想要什么：许可。他顺从地坐在那里，一只手放在他的老二上，另一只手放在你的老二上，等待着你告诉他是否可以吞下你的精液，这让你的[cock]跳动起来。");
            outputText("[pg]当你给他许可时，他吞下了他珍贵的奖品，舔了舔嘴唇，闭上眼睛默默地欢呼。从他开始更用力地抽插他巨大的马屌的方式来看，你知道这让他兴奋得发狂。他空出的手紧紧握住你的[cock]，继续套弄，让珍珠般的先列腺液滴落在他巨大的胸膛上。");
         }
         if(get_player().balls > 0)
         {
            if(get_player().ballSize == 1)
            {
               outputText("[pg]牛头人温暖的大手托住你的[balls]，一边舔着你颤抖的[cock]一边按摩它们。他极其温柔地拉扯着你敏感的精液工厂，用它们将你肿胀、被唾液闪闪发光的老二拉向他的嘴唇。湿润的嘴唇贴在你[cock]根部的感觉，加上温柔的手指拉扯你[balls]的感觉，结合在一起，形成了一种纯粹的极乐之火。");
               outputText("[pg]接下来你只知道他的脸埋在你的阴囊里，突然吸吮和亲吻你[balls]敏感的肉。他强有力的嘴唇紧紧地拉扯着皮肤，然后恰到好处的吸力将球体吸入他饥渴的嘴里。他的嘴唇移动着，将纯粹的极乐那种令人头脑发麻的感觉传遍你的全身。你迎合着那些嘴唇，你的[balls]愉快地享受着牛头人温柔的爱抚。[if (balls > 1) { 他吐出一个球体，又吸入另一个，像对待前一个一样，给予它令人呻吟的关注。}]");
            }
            else if(get_player().ballSize > 1 && get_player().ballSize <= 4)
            {
               outputText("[pg]牛头人温暖的大手滑过你的[balls]，一边舔着你漏液的[cock]一边按摩它们。他按摩着你敏感的精液工厂，开始亲吻它们与你身体连接的地方。口水顺着你沉甸甸的阴囊滑落，他用手和嘴的结合让你向前挺进，进入情欲的极乐那种令人刺痛的感觉……");
               outputText("[pg]接下来你只知道他的脸埋在你的阴囊里，突然吸吮和亲吻你[balls]敏感的肉。他无法将你的球体塞进嘴里，但这并不能阻止他对你巨大的阴囊进行甜蜜的口交。[if (balls > 1) { 他咧嘴一笑，一次一个地将你的[balls]含进嘴里，用舌头给每一个都来了一次美妙的色情舔舐。}]");
            }
            else if(get_player().ballSize > 4)
            {
               outputText("[pg]他伸出手，大手滑过你的[balls]。牛头人似乎对你[legs]之间产生精液的器官的惊人质量感到既印象深刻又敬畏。他温柔地按摩它们，就像你抚摸心爱的宠物一样。这种感觉本身就很令人愉悦，但与他倾身用舌头滑过你的[balls]时你感受到的那种令人头脑发麻的狂喜相比，这根本算不了什么。");
               outputText("[pg]慢慢地，他进入了一个很好的小节奏。他亲吻和舔舐你的[balls]，同时用这种令人刺痛的旋转动作摩擦你巨大的精液工厂。当他巨大的马屌腹部首先滑过你的[balls]时，你喘着粗气。当他开始在它们上面抽插，同时保持他已经很强烈的服侍时，你几乎要在那里射精了。");
            }
            outputText("[pg]他对着你刺痛的[balls]微笑，然后将宽大的鼻子埋进你的阴囊，深深地吸了一口气。");
            outputText("[pg][say: 嗯，]他说，半闭着眼睛，一边喝着一边还在拉扯他勃起的老二。他跪在你的双腿之间，呼吸着你充满精液的[balls]散发出的不可否认的男性气息。");
            outputText("[pg]着迷的牛头人开始一次又一次地吸入你甜美的男性甘露；舔你，品尝你的味道，就像品尝最后一餐一样。他似乎试图将你的气味永久地印在他的记忆中，仿佛他永远不想忘记你光荣的身体或你充满乳脂的[balls]。");
            outputText("[pg]他的舌头伸出来，腹部平贴在你[balls]的中间。在尝到了最后一口温柔的味道后，他带着完全坚定的表情回到了你的肉棒上。");
         }
         outputText("[pg]牛头人张大嘴巴，然后将自己推到你的[cock]上，猛烈地将你吸入他嘴里湿热的隧道。他开始用力地上下摆动，显然非常努力地想让你高潮。伴随着湿滑的吧唧声，还有你再熟悉不过的抽插感。你抓住牛角，开始粗暴地将你的[cock]推向那厚厚贪婪的嘴唇，以此来帮助他。");
         if(get_player().balls > 0)
         {
            outputText("[pg]每一次抽插，你的[balls]都会重重地拍打在他的下巴上。");
         }
         outputText("[pg]知道这是最后的冲刺，你无情地操着他那如此情愿的嘴巴，力量稳步增加，直到你感觉到你的子孙浆像一条白色的火河一样沸腾溢出。");
         outputText("[pg]伴随着震撼你整个存在的咆哮，你将他厚厚的嘴唇从你的老二上扯下来，告诉他张开嘴，这样他就可以接受他劳动的果实。");
         outputText("[pg]牛头人带着崇拜和顺从的表情服从了，他甚至伸出了舌头。你一只手放在他的角上，另一只手放在你的[cock]上，开始按摩你沸腾的精液，让它在喷涌而出时陷入疯狂。");
         if(get_player().cumQ() <= 25)
         {
            outputText("[pg]当你把[cockHead]顶在他宽大湿润的舌头上时，你的[cock]喷出了一股精液，就像神射手射出的情欲之箭一样离开你的身体。你闪亮的精液猛烈地撞击在他宽大的舌头上，就像从软管里喷出的牛奶打在光滑的表面上一样四处飞溅。当第二支精液之箭击中他的舌头时，牛头人柔软的嘴唇紧紧锁住了你喷射精液的[cockHead]。");
            if(get_player().balls > 0)
            {
               outputText("[pg]伴随着胜利的咕哝声，渴望精液的牛头人贪婪地吸吮着你喷射的肉棒，一边按摩你的[balls]，一边大声吞咽着你的精液。就好像他想让你射得更多一样。");
            }
            else
            {
               outputText("[pg]他发出一声胜利的咕哝，贪婪地吸吮着你喷射的肉棒，一边摩擦你的[legs]，一边大声吞咽着你的精液。就好像他想让你射得更多一样。");
            }
         }
         else if(get_player().cumQ() > 25 && get_player().cumQ() <= 250)
         {
            outputText("[pg]当你把[cockHead]顶在牛头人宽大湿润的舌头上时，你的[cock]爆发了，一股浓稠的精液直接喷进了他的喉咙深处。当你把一波又一波闪亮的白色精液射在他宽大的粉色舌头上时，牛头人的嘴唇伴随着男中音般的呻吟闭合在你的[cockHead]周围。");
            outputText("[pg]当乳白色的精华离开你的身体，流过你的肉棒，让你的[legs]发软时，你的头无力地垂下。");
            if(get_player().balls > 0)
            {
               outputText("[pg]令人欣快的大量精液从你的[cock]中涌出。牛头人让你的精液在他的嘴里汇聚，他一只手按摩你的[balls]，另一只手握住你的肉棒。一旦你把他的嘴唇填得快要溢出来，他强壮的手就会紧紧握住你的肉棒，阻止精液的流动，让你的身体产生一阵痉挛。当他品尝着你乳白色的精液时，他继续按摩你的[balls]，确保你被堵住的肉棒能给他剩下的食物。他把这个过程又重复了一次，享受着第二口，就像第一口一样，然后从你被口水弄得闪闪发光、滴着水的[cockHead]上吻去最后一点精液。");
            }
            else
            {
               outputText("[pg]当令人欣快的大量精液从你的[cock]中涌出时，牛头人让你的精液在他的嘴里汇聚，他一只手握住你的[cock]，另一只手仍在摩擦他那巨大的马形肉棒。一旦你把他的嘴唇填得快要溢出来，他强壮的手就会紧紧握住你的肉棒，阻止精液的流动，让你的身体产生一阵痉挛。他在嘴里漱着你的精液，品尝着你的味道，眼睛翻向脑后。他把这个过程又重复了一次，享受着第二口，就像第一口一样，然后从你被口水弄得闪闪发光、滴着水的[cockHead]上吻去最后一点精液。");
            }
         }
         else if(get_player().cumQ() > 250 && get_player().cumQ() < 500)
         {
            outputText("[pg]当你把[cockHead]顶在牛头人宽大湿润的舌头上时，你的[cock]爆发了，一股浓稠的乳白色精液直接喷进了牛头人张开的嘴里。当雪白的精液射入牛头人的上颚时，他厚厚的嘴唇伴随着饥渴的呻吟紧紧闭合在你的[cockHead]周围。");
            outputText("[pg]当乳白色的精华从你的身体里喷涌而出，让狂喜的颤栗传遍你的脊椎时，你的头无力地垂下。");
            if(get_player().balls > 0)
            {
               outputText("[pg]当巨大的精液洪流从你的[cock]中喷射而出时，牛头人让你的精液在他的嘴里汇聚。他一只手按摩你的[balls]，另一只手握住你的肉棒，眼睛里充满了色情的崇拜。一旦你把他的嘴唇填得快要溢出来，他强壮的手就会紧紧握住你的肉棒，阻止精液的流动，让你的身体产生一阵剧烈的痉挛。当他品尝着你乳白色的精液时，他继续按摩你的[balls]，确保你被堵住的肉棒能给他剩下的食物。");
               outputText("[pg]然后他松开手，让你的精液填满他的嘴。当他的牙齿、舌头和扁桃体都浸泡在你的精液中时，他再次握紧，阻止精液的流动，这样他就可以在嘴里漱着你的精液并吞下去。");
               outputText("[pg]他重复了这个过程好几次，像第一次一样细细品味着每一口，然后从你那被口水弄得闪闪发光、滴着精液的[cockHead]上吻去最后的残渣。");
            }
            else
            {
               outputText("[pg]当巨大的精液洪流从你的[cock]中喷射而出时，牛头人让你的精液在他的嘴里汇聚。他一只强壮的手握住并按摩你的肉棒，一边自慰，眼睛里充满了色情的崇拜。一旦你把他的嘴唇填得快要溢出来，他强壮的手就会紧紧握住你的肉棒，阻止精液的流动，让你的身体产生一阵剧烈的痉挛。");
               outputText("[pg]然后他松开手，让你的精液再次填满他的嘴。当他的牙齿、舌头和扁桃体都浸泡在你的男精中时，他再次握紧，阻止了精液的流动，这样他就可以让你的精液在他的嘴里打转并吞下去。");
               outputText("[pg]他重复了这个过程好几次，像第一次一样细细品味着每一口，然后从你那被口水弄得闪闪发光、滴着精液的[cockHead]上吻去最后的残渣。");
            }
         }
         else if(get_player().cumQ() >= 500)
         {
            outputText("[pg]当你将你的[cockHead]抵在牛头人宽大湿润的舌头上时，你的[cock]爆发了，像霰弹枪一样猛烈地将浓稠的精液直接射入他等待的口中。当雪白的精液射入牛头人的口中时，冲击力如此之大，以至于它喷涌而出，每次射精都会喷洒出奶油般的男精。为了防止多余的精液被浪费，他用嘴唇锁住你猛烈喷射的[cock]");
            outputText("[pg]当乳白色的精华从你的身体里射出时，你的身体因痉挛而扭曲，让你的[legs]感到无力。");
            if(get_player().balls > 0)
            {
               outputText("[pg]当精液的海啸从你的[cock]中喷射而出时，牛头人让你的精液在他的嘴里汇聚。他一只手按摩你的[balls]，另一只手握住你的肉棒，眼睛里充满了色情的崇拜。没过多久，他的嘴唇就溢出来了，一旦你这样做了，他强壮的手就会紧紧握住你的肉棒，可能是试图阻止精液的流动，以便他可以从容地喝下它。");
               outputText("[pg]相反，你的精液冲破了他强有力的抓握，一股特别猛烈的精液直接喷在了他的脸上。");
               outputText("[pg]他饥渴的嘴唇回到了你的[cockHead]上，拼命地试图跟上你产生的极端、几乎滑稽的精液量。精液像瀑布一样从他的嘴角流下。");
            }
            else
            {
               outputText("[pg]当海啸般的精液从你的[cock]中喷涌而出时，牛头人任由你的精液在他的嘴里汇聚。他的一只大手紧紧握住你的肉棒并揉搓着，同时自己也在手淫，他的眼神因强烈的爱慕而变得迷离。当你快要把他的嘴填满时，他的大手紧紧握住你的肉棒，阻止了精液的流动，让你的身体产生了一阵强烈的痉挛。");
               outputText("[pg]然后他松开手，让你的精液再次填满他的嘴。当他的牙齿、舌头和扁桃体都浸泡在你的男精中时，他再次握紧，阻止了精液的流动，这样他就可以让你的精液在他的嘴里打转并吞下去。");
               outputText("[pg]他重复了这个过程好几次，像第一次一样细细品味着每一口，然后从你那被口水弄得闪闪发光、滴着精液的[cockHead]上吻去最后的残渣。");
            }
         }
         get_player().orgasm("Dick");
         _g = this;
         x1 = _loc1_;
         doNext(function():void
         {
            _g.minoMutualPt2(x1);
         });
      }
      
      public function minoGetsTitFucked() : void
      {
         spriteSelect(SpriteDb.get_s_minotaur());
         get_player().slimeFeed();
         if(get_player().isNaga())
         {
            AddictNagaOnMinotaur();
            return;
         }
         clearOutput();
         outputText("无助的牛头人躺在泥土中，");
         if(get_monster().get_HP() < 1)
         {
            outputText("被击败了。");
         }
         else
         {
            outputText("无法控制地自慰着。");
         }
         outputText("此刻他是你的了，而现在，你想看看那根跳动的马屌会不会将它那天堂般的精液喷洒在你的" + get_player().allBreastsDescript() + "和[face]上。你确实需要吸一口，只要能让你忘记所有必须面对的担忧和压力就够了。[pg]");
         if(get_monster().get_lust() >= get_monster().maxLust())
         {
            outputText("你推开他的手，y");
         }
         else
         {
            outputText("你");
         }
         outputText("俯身在他上方，感受着你丰满的乳肉在晃动，你的[nipples]在摩擦着牛头人那马一样的巨根时，因渴望而刺痛。野兽的先列腺液开始在他那膨大的龟头上形成大滴的液体，你毫不犹豫地将其涂抹在你的乳沟里，润滑着你双乳之间的空间，深深地呼吸着它那完美的香气。");
         if(get_player().totalCocks() > 0)
         {
            outputText("你的[cock]变得比以往任何时候都更硬、更兴奋，而你的");
         }
         else
         {
            outputText("你的身体因兴奋而隐隐作痛，而你的");
         }
         if(get_player().hasVagina())
         {
            outputText(get_player().vaginaDescript(0) + "变得越来越热，乞求着被占有。");
         }
         else
         {
            outputText("[asshole]微微收缩，仿佛在乞求被另一只可怕的野兽占有。");
         }
         outputText("[pg]");
         get_images().showImage("minotaur-win-titfuck");
         outputText("他可怜巴巴地哞哞叫着，显然明白你想干什么，并因为无法在一个紧致的凡人");
         if(get_player().hasVagina())
         {
            outputText("小穴里满足自己的欲望而感到沮丧。");
         }
         else
         {
            outputText("屁股里满足自己的欲望而感到沮丧。");
         }
         outputText("为了向他证明他是错的，你让他把精液全都释放到你的脸上，你用你的" + get_player().allBreastsDescript() + "紧紧地包裹住他，开始顺着他的长度滑动你的身体。不断滴落的先列腺液很容易就润滑了你，很快你的双峰就沾满了那如毒品般的液体，变得闪闪发亮、滑溜溜的。[pg]");
         outputText("当你开始上下摇晃乳房，摩擦他的肉棒时，你感觉到他那三层包皮在你的双乳上滑动。当他的龟头碰到你的嘴唇时，你舔舐着边缘，确保吸入一大口他那浓稠的精液。这让你感到一阵眩晕，差点滑落下来，但这种感觉很快就过去了。你需要更多。你用你的" + get_player().allBreastsDescript() + "紧紧夹住他，随着牛头人高潮的临近，你感觉到他的肉棒开始膨胀，变得更硬更大，挤出了更多的液体。[pg]");
         outputText("牛头人的睾丸紧紧收缩，他仰起头，在快感和释放中尖叫起来，[say: 哞哞哞哞哞哞哞哞！][pg]");
         outputText("你紧紧夹住并向下压，看着他的龟头膨胀，在释放前几乎变大了一倍，他那浓稠的麻醉精液浸透了你的脸和头发。你设法在下一次喷射前将嘴唇贴上去，当精液充满你的嘴时，你差点被淹没。你退了回来，咳嗽着，开始感到兴奋，随着越来越多的精液溅到你的身上，你摇摇晃晃地站不稳，你那光滑起伏的乳房继续挤压着他。[pg]");
         outputText("牛头人终于放松下来，在昏过去之前，最后一次将你浸透。你摇摇晃晃地站起来，差点被自己的腿绊倒，你咯咯笑着，沉醉在牛精液中，大声吸吮着浸透你脸和头发的液体。你昏迷了一会儿……[pg]");
         outputText("一个小时后你醒了过来，不确定自己是怎么回到营地的，头晕目眩，沉浸在余韵的快感中。你还发现旁边地上有一个瓶子，里面装满了那种液体。你不记得自己装过它，但你已经迫不及待地想打开它一饮而尽了。你勉强克制住了这种冲动。而且，你现在感觉棒极了，这多亏了你上次的“试吃”。");
         minoCumAddiction(10);
         get_monster().setLoot(get_consumables().MINOCUM);
         get_player().orgasm("Tits");
         dynStats(DynStat.Sens(0.5),DynStat.Cor(0.7));
         get_combat().cleanupAfterCombat();
      }
      
      public function minoCumUpdate() : Boolean
      {
         var _loc2_:* = null as IMap;
         var _loc3_:int = 0;
         if(FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,18) == 0)
         {
            return false;
         }
         var _loc1_:Boolean = false;
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,20) == 0 && FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,18) >= 50 && get_addictionEnabled())
         {
            outputText("[pg]你发现自己仅仅是想到牛头人和他们美味的精液就会发情。你立刻回想起那让你感觉有多棒，你想要更多。<b>你现在对牛头人精液上瘾了！</b>[pg]");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,20,1);
            _loc1_ = true;
         }
         if(FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,18) < 50)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,20) > 0)
            {
               outputText("[pg]<b>很长一段时间以来，你的头脑第一次变得清醒，不再对牛头人精液有那种不自然的需求。你已经克服了对它的依赖，");
               if(get_player().cor > 60)
               {
                  outputText("但你怀念每次他们射在你里面时，你脑海中那种刺痛的麻木和模糊感。");
               }
               else
               {
                  outputText("并决心从现在开始对这些野兽敬而远之。");
               }
               outputText("</b>[pg]");
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,20,0);
               _loc1_ = true;
            }
            if(FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,2209) >= 150 && !get_player().hasPerk(PerkLib.MinotaurCumAddict) && !get_player().hasPerk(PerkLib.MinotaurCumResistance))
            {
               FlagDict_Impl_.arrayWriteFloat(KFLAGS.flags,18,0);
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,20,0);
               get_player().createPerk(PerkLib.MinotaurCumResistance,0,0,0,0);
               outputText("[pg]<b>你终于充分了解了如何避免再次对牛头人精液上瘾；你现在对牛头人精液的成瘾性免疫了。</b>[pg]");
               _loc1_ = true;
            }
         }
         else
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,20) > 1 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,19) < 24)
            {
               outputText("[pg][b:你开心地叹了口气，然后回到了营地。你得到了你所需要的。][pg]");
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,20,1);
               _loc1_ = true;
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,19) >= 24 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,20) == 1)
            {
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,20,2);
               _loc1_ = true;
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,330,12);
               outputText("[pg]<b>你打了个寒颤，感觉有点冷。也许你应该去弄点牛头人精液？如果没有脑海深处那种令人愉悦的嗡嗡声，你总觉得不对劲。</b>[pg]");
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,19) >= 48 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,20) == 2)
            {
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,20,3);
               _loc1_ = true;
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,330,12);
               outputText("[pg]<b>当你颤抖着抱住头时，一股持续的欲望之火在你体内慢慢燃烧。在这么长时间没有得到牛头人的爱之后，你出现了戒断反应。你只知道在得到它之前，你会一直发情和疼痛。</b>[pg]");
            }
            if(FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,18) >= 100 && !get_player().hasPerk(PerkLib.MinotaurCumResistance))
            {
               if(!get_player().hasPerk(PerkLib.MinotaurCumAddict))
               {
                  get_player().createPerk(PerkLib.MinotaurCumAddict,0,0,0,0);
                  outputText("<b>你现在是一个牛头人精液成瘾者</b>（瓶装牛头人精液现在可以恢复你25%的生命值，但会造成生命值伤害以在几个小时内提升欲望。）[pg]");
                  _loc1_ = true;
               }
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,20) == 3 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,19) >= 48)
            {
               dynStats(DynStat.Lust(2));
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,20) == 2 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,19) >= 24)
            {
               dynStats(DynStat.Lust(1));
            }
            if(FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,18) > 100)
            {
               FlagDict_Impl_.arrayWriteFloat(KFLAGS.flags,18,100);
            }
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,19) >= 48 && !get_player().hasPerk(PerkLib.MinotaurCumAddict))
         {
            if(FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,18) >= 0.15)
            {
               _loc2_ = KFLAGS.flags;
               FlagDict_Impl_.arrayWriteFloat(_loc2_,2209,FlagDict_Impl_.arrayReadFloat(_loc2_,2209) + 0.15);
               _loc2_ = KFLAGS.flags;
               FlagDict_Impl_.arrayWriteFloat(_loc2_,18,FlagDict_Impl_.arrayReadFloat(_loc2_,18) - 0.15);
            }
         }
         _loc2_ = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,19,FlagDict_Impl_.arrayReadInt(_loc2_,19) + 1);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,21) > 0)
         {
            _loc3_ = 21;
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,_loc3_,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,_loc3_) - 1);
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,21) == 0)
            {
               outputText("[pg]<b>对你来说，痛苦和快乐不再那么难以区分。");
               outputText("[pg]</b>");
               _loc1_ = true;
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,21) < 0)
            {
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,21,0);
            }
         }
         return _loc1_;
      }
      
      public function minoCumAddiction(param1:Number = 10) : void
      {
         get_player().minoCumAddiction(param1);
      }
      
      public function minoCumAddictBadEnd3() : void
      {
         spriteSelect(SpriteDb.get_s_minotaur());
         hideUpDown();
         clearOutput();
         outputText("几天几周在半梦半醒的迷雾中过去。你被侵犯了无数次，第一天之后他们甚至懒得用皮带拴住你。他们为什么要限制这样一个渴望的奴隶呢？每当你不需要作为精液垃圾桶时，你就会被扔到一边，但只要你开始从恍惚中清醒过来，你就会爬回来，张着嘴，滴着水，准备好迎接下一剂。就他们而言，你的新主人们似乎很乐意照顾你的需求。你唯一没有被下药的时候是牛头人们睡觉的时候，但小牛头人们似乎非常乐意让你在拥挤的奴隶堆里吸吮他们小马屌上的先列腺液。[pg]");
         outputText("你不再是你们村庄的勇者。你唯一能称得上勇者的，就是吞精。你非常自豪地向其他精液荡妇展示你每天能从发情的主人那里哄出多少浓稠的精液。生活再好不过了。");
         get_images().showImage("badend-minotaur");
         get_game().gameOver();
         dynStats(DynStat.Inte(-1),DynStat.Lib(5),DynStat.Sens(30),DynStat.Lust(100,DynStatOp.Eq),DynStat.Cor(20));
      }
      
      public function minoAddictionFuck() : void
      {
         var _g:MinotaurScene;
         spriteSelect(SpriteDb.get_s_minotaur());
         clearOutput();
         outputText("在探索山脉时，一股熟悉的麝香味钻进了你的鼻孔。你饥渴地嗅着，开始颤抖，几乎因为需求而抽搐。你没有思考，而是采取了行动，不顾一切地绕过散落在崎岖山腰上的岩石障碍物，追逐着你的需求。绕过一个急弯，你开心地叹了口气，因为气味明显变浓了。[if (metric) {一米|几英尺}]外是一个牛头人，浑身长满蓬松的毛发，正在吃水果。你欣喜若狂地向前爬去，把小石头踢得到处都是。牛头人抬起头，一开始皱着眉头，然后当他认出你眼中的神情时，嘴角逐渐咧开一个大大的笑容。[pg]");
         get_images().showImage("monster-minotaur");
         outputText("他把水果扔到一边，忘了它，因为他那青筋暴起的肉棒顶开了他的缠腰布，骄傲地滴着水。你需要他，你跪下来自慰，知道很快他就会用你需要的东西填满你。公然的性表演奏效了，当那根流着口水的马鸡巴离你越来越近时，你颤抖了。在最后一刻，牛头人把你抱起来，向后扔进了一个山洞。你的希望破灭了，但随后他又开始向你逼近，你知道等待的时间结束了……");
         dynStats(DynStat.Lust(3000));
         _g = this;
         doNext(function():void
         {
            _g.getRapedByMinotaur();
         });
      }
      
      public function minoAddictionBadEndEncounter() : void
      {
         spriteSelect(SpriteDb.get_s_minotaur());
         clearOutput();
         get_images().showImage("area-mountain");
         outputText("在探索山脉时，你闻到了一股强烈的你最喜欢的气味。你歪着头，深吸了几口气，叹了口气。从气味的强度来看，一定有许多牛头人聚集在一起。你的脑海中立刻浮现出被肌肉发达的怪物包围的景象。在你的幻想中，你的洞被塞住了，你被他们奇妙的东西浸透了。你拼命地希望这是真的，而你需要做的就是跟着你的鼻子走……[pg]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,20) == 3 && get_player().get_inte() < 60)
         {
            outputText("你的需求如此之大，以至于你甚至没有思考，你只是开始跟随。");
            doNext(minoAddictionBadEnd2);
         }
         else
         {
            if(get_player().get_inte() > 40)
            {
               outputText("一个微小的声音响起，警告你很难从这样的聚会中逃脱。");
            }
            outputText("你会像个瘾君子一样跟着牛头人的气味走吗？");
            doYesNo(minoAddictionBadEnd2,get_camp().returnToCampUseOneHour);
         }
      }
      
      public function minoAddictionBadEnd2() : void
      {
         spriteSelect(SpriteDb.get_s_minotaur());
         clearOutput();
         outputText("你咧嘴笑着，跌跌撞撞地上了山，不时深吸一口气，以确保你走在正确的轨道上。气味越来越浓，让你");
         if(get_player().hasVagina())
         {
            outputText("湿润");
            if(get_player().cockTotal() > 0)
            {
               outputText("并且坚硬的");
            }
         }
         else if(get_player().cockTotal() > 0)
         {
            outputText("坚硬的");
         }
         else
         {
            outputText("颤抖");
         }
         outputText("充满期待。虽然你没有注意到，但仅仅是闻到这股气味，你的瞳孔就已经放大，眼神也变得迷离。你手脚并用地爬上岩石，完全不顾疯狂攀爬在手和手臂上留下的割伤和擦伤。你把自己拉上一个壁架，翻身过去，躺在地上喘着粗气，累得直流口水。直到恢复过来，你才意识到你找到他们了！[pg]");
         outputText("这里有一整个牛头人村落！二三十个洞口在山上开凿出来，周围的壁架上也建有同样数量的简陋小屋。你并没有往那边看——你的目光被两组建筑之间的景象牢牢吸引住了。五个毛茸茸的兽人围在火坑旁，烤着某种动物，放松地休息着。其中两个正起劲地操着体型娇小、有着女性特征的类牛头人生物，用他们巨大的肉棒刺穿这些矮小得多的同类。那些“小牛头人”脸上的表情你再熟悉不过了，那是沉溺于强烈毒瘾中的纯粹狂喜。[pg]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2024) > 0)
         {
            outputText("第三只野兽把一个看起来像人类的受害者倒吊着，粗暴地操着她的喉咙。她翻着白眼，虽然你不确定是因为快感还是缺氧。一对沙滩排球大小的乳房在她的胸前弹跳，一根大得足以让牛头人相形见绌的肉棒无力地甩动着，不断滴下液体。她一定是逃离工厂的奴隶之一，尽管看起来她逃跑后的生活并没有改善多少。[pg]");
         }
         outputText("其中一个闲着的怪物瞥了你一眼，露出掠食者般的微笑。他放下正在磨的斧头，大步走过来，他的阴茎膨胀到最大尺寸，几乎要把他的缠腰布从腹股沟撕裂。令人惊讶的是，这个牛头人居然开口说话了，[say:新的性玩具。吸。][pg]");
         get_images().showImage("minotaur-loss-oral");
         outputText("他的话对你来说简直是天籁之音。你向前爬行，在泥土中打滚，直到匍匐在他面前。你睁大眼睛抬起头，用手握住他，轻轻捏了捏。你张大嘴巴，努力将他粗壮的肉棒塞进你渴望的嘴里，但你做到了。一滴先列腺液奖励了你的努力，你高兴地向前挺进，当他滑入你的喉咙深处时，你张得更大了。奇迹般地，你强烈的需求克服了你的呕吐反射，当你的舌头沿着他肉棒的下侧滑动、按摩他时，你发出嘈杂的咕噜声。[pg]");
         outputText("[say:需要……更多！]野兽咕哝着，抓住你的脖子把你往上拉，强行把自己越来越深地塞进你的喉咙。通常无法呼吸会引起恐慌，但滴入你食道的先列腺液驱散了你脑海中的担忧。你被又重又快地深喉，直到你感觉到主人的肉棒在你的喉咙里因快感而肿胀。它将一大股浓稠的奶油状牛头人精液直接射入你的胃里，奖励你，直到你的肚子鼓起来，看起来像是有轻微的身孕。[pg]");
         outputText("你的主人拔出来，在你的脖子上系上一个皮项圈，然后把你拖过泥地，回到他的营火旁。在项圈的拉扯和粗暴的深喉之间，你上气不接下气地喘息着，但你再高兴不过了。你的新主人抓住你的" + get_player().assDescript() + "把你举起来，强行进入你的[asshole]，用粗壮的牛头人肉棒把你填满。仍然被你肚子里的精液严重麻醉着，当你被上下颠簸时，你高兴地咯咯笑着，在主人的面前完全放松。[pg]");
         outputText("他咕哝着，第二次射在你体内，不知怎么的，他仍然能用感觉像是一加仑的精液淹没你的肠道。你无脑地流着口水，当你被拔出来扔到一边时，喉咙里流出快乐的咕噜声。你感觉不到身体落在泥地里的冲击，甚至没有注意到当你被在营火旁传递时，你已经被每一个新的怪物主人轮流调教过了。");
         doNext(minoCumAddictBadEnd3);
         dynStats(DynStat.Inte(-20),DynStat.Lib(5),DynStat.Sens(15),DynStat.Lust(50),DynStat.Cor(10));
      }
      
      public function layEggsInAMinotaurSpiderLike() : void
      {
         clearOutput();
         if(get_player().canOvipositBee())
         {
            layBeeEggsInCowbutt();
            return;
         }
         get_images().showImage("minotaur-win-male");
         outputText("被击败的牛头人转过身试图逃跑。你迅速甩出一根黏稠的蛛丝，缠住了他巨大的牛角，猛地将他拉停。伴随着一声惊慌的哞叫，他开始拼命甩头，试图挣脱。你快步上前，将这牛头人扑倒，强迫他仰面朝天。你喷出更多的蛛丝，缠住他的手腕并绑在他的角上，然后强行将他肌肉发达的双腿向上推，使他几乎对折起来，最后将他的双腿也绑在角上。");
         outputText("[pg]现在，牛头人被五花大绑、毫无还手之力，他睁大眼睛抬头看着你。他那跳动着、膨胀的肉棒表明，他并不像他想让你相信的那样反感目前的处境。你用指尖收集起他那散发着麝香的先列腺液，放在他的鼻子底下，然后强行将手指塞进他的嘴里。[say: 傲慢的小母牛，]你喉咙里发出低吼，[say: 我有一份特别的礼物要送给你。]");
         outputText("[pg]你一只手抓住绑住他四肢的蛛丝，将你的产卵管对准了");
         if(!get_silly())
         {
            outputText("他的牛菊花。");
         }
         else
         {
            outputText("他后庭牧场的入口。");
         }
         outputText("你咧嘴一笑，将腹部高高抬起，然后猛地向前一挺，将你那长长的产卵管大半截深深地插进了你的牛肉婊子里。");
         if(get_player().get_gender() > 0)
         {
            outputText("[pg]");
            if(get_player().hasCock())
            {
               outputText("你强行将[oneCock]挤进他被绑住的大腿之间，摩擦着他那肿胀的牛巴，随着你的抽插，你们混合的先列腺液浸透了他腹部的皮毛。");
            }
            if(get_player().hasVagina())
            {
               outputText("你抓住他的牛巴，将它拉向你的小穴，在它惊人的长度上上下摩擦着你的淫液，你的阴唇和阴蒂在他身上研磨，增加了你的快感。");
            }
         }
         outputText("[pg]");
         if(get_player().hasCock())
         {
            outputText("当高潮席卷全身时，你喷射出精液，");
            if(get_player().cumQ() < 100)
            {
               outputText("溅满了");
            }
            else if(get_player().cumQ() < 500)
            {
               outputText("浸透了");
            }
            else
            {
               outputText("几乎淹没了");
            }
            outputText("你那无助的猎物。");
         }
         if(get_player().hasVagina())
         {
            outputText("你的淫液喷洒在他的肉棒上。");
         }
         outputText("同时，你的产卵管跳动着，将一颗又一颗的卵强行塞进他结实的臀部深处。那");
         if(get_player().get_gender() > 0)
         {
            outputText("你体液的气味和");
         }
         outputText("卵子强行穿过他括约肌的感觉结合在一起，证明了你的牛婊子无法抵抗，他无助地喷射出麝香般的精液，一股又一股的精液喷射到他的胸前和脸上，他的眼睛翻白。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,20) >= 1)
         {
            outputText("这气味对你来说也太过强烈，当你第二次高潮时，你将他肿胀的肉棒对准你的嘴，尽可能多地吞咽他的精液。");
            minoCumAddiction(3);
         }
         if(get_player().cor < 50)
         {
            outputText("[pg]你小心翼翼地解开他的四肢，然后拉过他的鼻子，强迫他看着你。");
         }
         else
         {
            outputText("[pg]想到其他山地居民会和你这块被捆绑得很好的牛肉玩得很开心，你轻笑着，抓住他的鼻子，强迫他看着你的眼睛。");
         }
         outputText("[pg][say:我们必须再来一次。事实上，每次你遇到我，我们都会再来一次，我的小牛仔。]");
         get_player().dumpEggs();
         get_player().orgasm("Dick");
         get_combat().cleanupAfterCombat();
      }
      
      public function layBeeEggsInCowbutt() : void
      {
         clearOutput();
         get_images().showImage("minotaur-win-male");
         outputText("低头看着被击败的牛头人");
         if(get_monster().get_lust() >= get_monster().maxLust())
         {
            outputText("，绝望地抚摸着他肿胀的肉棒");
         }
         outputText("你感觉到你的蜂巢附肢有一种悸动的感觉。当你强迫牛头人趴在肚子上，将他充满麝香味的男子气概困在身下时，一个淫荡的笑容在你的脸上蔓延开来。");
         if(!get_player().isTaur())
         {
            outputText("你用一只手缠住他的尾巴，抬起他毛茸茸的侧腹");
         }
         else
         {
            outputText("你用四条腿跨坐在他身上，向前滑动");
         }
         outputText("同时瞄准你的产卵管。");
         outputText("[pg]当你的产卵管长驱直入时，战败的牛头人发出了一声困惑的呻吟。有那么一瞬间，你觉得他就像一头迷失了方向、呼唤母亲的小牛犊。");
         if(get_player().cor < 50)
         {
            outputText("你犹豫了一下，对这只曾经强大的生物涌起一阵怜悯，但你新的本能驱使着你的产卵管更深地刺入他俯卧的身体。");
         }
         else
         {
            outputText("你残忍地咧嘴一笑，抓住他的角，双手向后拉，直到牛头人被迫与你对视。你凑近他的鼻子，嗡嗡地嘲笑他，[say: 现在谁才是婊子？是你吗？没错，就是你！]");
         }
         outputText("你开始前后抽插，你强有力的向前挺动伴随着你那巨大却无助的孵化牛发出的咕哝哞哞声。");
         outputText("[pg]你那早已准备好产卵的身体迅速达到了高潮；");
         if(get_player().hasCock())
         {
            outputText("你挺动着你的阴茎");
            if(get_player().cockTotal() > 1)
            {
               outputText("");
            }
            outputText("在空气中更用力、更快地抽动，浸湿了他的");
            if(get_player().cumQ() < 250)
            {
               outputText("后背，射满了你的精液");
            }
            else if(get_player().cumQ() < 500)
            {
               outputText("后背，射满了你的精液，浓稠的白浊顺着他的角慢慢滴落，流下他的脸庞");
            }
            else
            {
               outputText("后背，射满了你的精液，直到精液覆盖了他，并在他洞穴的地上蔓延开来。");
            }
         }
         else if(get_player().hasVagina())
         {
            outputText("你用小穴用力摩擦牛头人肌肉发达的屁股，用你淫液的气味标记他。");
         }
         outputText("[pg]最后，当你的卵顺着产卵管进入它们的牛类孵化器时，你感觉到强有力的脉动穿过你那蜜蜂般的腹部，每一颗卵的排出都像是一次小高潮。你开始明白为什么当你穿过森林时，那些蜂女会如此热衷于在你体内产卵了。你绝对能习惯这种感觉。");
         if(get_silly())
         {
            outputText("[pg]低头看着这团塞满卵的牛肉，你俯下身在他耳边低语，[say: 这就是苏格兰煎蛋的做法，牛仔。]");
         }
         get_player().dumpEggs();
         get_player().orgasm("Dick");
         get_combat().cleanupAfterCombat();
      }
      
      public function joinBeingAMinoCumSlut() : void
      {
         clearOutput();
         outputText("获得大量新鲜牛头人精液的前景实在让人难以抗拒。在你意识到发生了什么之前，你已经离开了岩石藏身处，向那两只牛类生物走去，一边走一边脱下你的[armor]。当你走到那两个身影面前时，你已经和他们一样赤身裸体了。你轻轻地发抖，说不清是因为空气中的寒意，还是因为绝望的期待。");
         outputText("[pg]牛娘弯着腰，双手放在低矮的壁架上，牛头人的双手放在她丰满的屁股两侧。她呻吟着，听起来更像是牛叫而不是人类的呻吟，因为牛头人正插入她颤抖的深处。当你走上前，突然对自己感到不确定时，公牛和母牛都把锐利的目光转向了你。你感觉自己很渺小");
         if(get_player().get_tallness() <= 96)
         {
            outputText("尽管你身材高大");
         }
         outputText("当他们上下打量你时。整个区域变得寂静，甚至那些毫无疑问在观看的地精和小恶魔似乎都屏住了呼吸，想知道你会发生什么。");
         outputText("[pg]牛头人终于咕哝了一声，似乎觉得你还可以接受，然后转过身去面对他面前那个毛绒绒的屁股，再次耕耘起来。然而，牛娘示意你向前走，当你走近时，她咬住了一个[nipple]。她柔软的嘴唇环绕着你的乳晕，而她的舌头在迅速变硬的乳头肉上跳舞。你的乳房因为轻微的吸吮而感到刺痛，让你喘息，因为小滴的乳汁从你的乳头溢出，滚过牛娘的舌头。她吸得越来越多，急切地吞下你令人耳目一新的乳酸饮料。");
         outputText("[pg]与此同时，牛头人继续咕哝着，将他巨大的阴茎插入女人饥渴的阴道。两人前后摇晃，把她的脸直接推到你的乳房上，然后再拉回来。牛娘的腿在颤抖，你突然发现她的手臂抓住了你的肩膀以寻求支撑。她的另一只手滑到你赤裸的双腿之间，");
         if(get_player().hasCock())
         {
            outputText("完全无视你的鸡巴");
            if(get_player().cockTotal() > 1)
            {
               outputText("");
            }
            outputText("完全地，");
         }
         outputText("将一根手指滑入你湿润的");
         if(get_player().hasVagina())
         {
            outputText("小穴");
         }
         else
         {
            outputText("屁眼");
         }
         outputText("。当第二根手指滑入时，你嘴里漏出一声低沉的呻吟，而这位丰满的牛类女人的拇指");
         if(get_player().hasVagina())
         {
            outputText("在你的阴蒂周围打转");
         }
         else
         {
            outputText("压在你的会阴上");
         }
         outputText("。");
         outputText("[pg]宽肩的牛头人催促着他的伴侣跪下，同时自己也跪了下来，他的阴茎始终没有离开它临时的家。牛娘拉着你，让你跪下，然后躺下。当你折起双腿，试图挡住你的胯部时，你突然感到一阵羞涩。牛娘只是在呻吟中轻笑，轻轻地把你的膝盖按开。你的双腿大张，淫荡地向牛娘以及任何正在观看的人展示你的下体。");
         outputText("[pg]没有浪费任何时间，女孩俯下身");
         if(get_player().hasCock())
         {
            outputText("，再次完全无视你的男根");
         }
         outputText("，舌头先探入你湿润的");
         if(get_player().hasVagina())
         {
            outputText("小穴");
         }
         else
         {
            outputText("后庭");
         }
         outputText("。动作太快了，你甚至无法抑制从唇间溢出的突然、变态的呻吟……这呻吟听起来惊人地像牛的哞哞声。当你突然发出牛叫时的惊讶很快就消散了，因为牛娘巨大的舌头在你的");
         if(get_player().hasVagina())
         {
            outputText("湿透的肉穴");
         }
         else
         {
            outputText("湿润的后庭");
         }
         outputText("里进进出出。任何对加入这场非常公开的性爱表演的恐惧都消失了，你想知道为什么你没有早点加入。");
         outputText("[pg]舌头在你的穴里肆虐，以它唯一知道的方式向你的胯部致敬。你的呼吸变得急促，你的手臂和腿发麻，手指和脚趾不由自主地蜷缩起来。牛娘舔舐着，她宽阔的嘴部肌肉进进出出，弯曲着触及你体内的每一个柔软部位。你的手指穿过女人红色的长发，强迫她的头更深地埋进你的胯部。她这样低着头，你可以很容易地看到她高高翘起的屁股，被牛头人操得神志不清。每一次抽插都让牛娘在你的大腿上呻吟，增加的震动让你更加扭动。");
         outputText("[pg]公牛直插到底，发出一声最后的欢愉咆哮。牛娘抬起头，她的嘴和下巴湿漉漉的，滴着你的淫液。她和牛头人一起发出一声类似哞哞的咆哮，牛头人的睾丸翻滚着，毫无疑问，他把大量美味的精液直接注入了她等待的子宫。你舔了舔嘴唇，希望你现在就能把它们包裹在那根阴茎上，以获得你的满足感，并感受到解脱的幸福感流遍全身。");
         outputText("[pg]女孩语无伦次地嘟囔着，从牛头人仍然坚硬的阴茎上滑下来，一小股珍珠白色的精液顺着她的大腿流下。牛头人得意地笑了笑，拍了拍牛娘的屁股，漫不经心地把她推到一边。她脸上挂着傻乎乎的笑容，眼睛翻白，好像刚刚经历了想象中最神圣的性爱。然后他死死地盯着你的眼睛，用一种低沉、充满男子气概和极具支配力的声音说，[say: 接下来轮到你骑我的鸡巴了，母牛。]");
         outputText("[pg]他粗糙有力的手抓住你的腿，把你拉近。你半心半意地扭动着，并没有真正试图逃跑。虽然你的理智试图抗拒，但你知道你真正想要的只是那温暖、粘稠的精液以某种方式进入你的体内。你想变得和旁边半昏迷的女孩一样，被鸡巴塞满，变成这个粗犷男人的生育母狗。");
         outputText("[pg][say: 渴望被操，是吧，荡妇？]他嘲弄道，他肿胀的阴茎靠在你的肚子上。你慢慢地点了点头。你感到核心深处在燃烧。你想要那根鸡巴进入你的身体。你想要被这头公牛的种子填满到爆炸，感觉到它在");
         if(get_player().hasVagina())
         {
            outputText("你的子宫里翻滚，被这只充满男子气概的野兽搞大肚子");
         }
         else
         {
            outputText("你的肠道里翻滚");
         }
         outputText("。 [say: 真是个好荡妇，]他咕哝着，把他的鸡巴从你的肚子上拉开，用光滑平坦的龟头摩擦你等待的[vagOrAss]。他用轻微的接触挑逗你，直到你张开嘴抱怨，然后他突然插了进去。任何在舌尖上形成的词语都飞走了，取而代之的是一声解脱的呜咽，因为你的洞被入侵的阴茎撑得大大的。");
         if(get_player().hasVagina())
         {
            get_player().cuntChange(36,true,true,false);
         }
         else
         {
            get_player().buttChange(36,true,true,false);
         }
         get_images().showImage("minotaur-cumslut");
         outputText("[pg][saystart]啊，对。这真是不错的");
         if(get_player().hasVagina())
         {
            outputText("母牛小穴");
         }
         else
         {
            outputText("屁股");
         }
         outputText("就是那里，[sayend]他呻吟着，那根粗大的肉棒更深地滑入你的体内。牛头人一只手臂勾住你的膝盖，托起你的下半身，压得更深。强烈的快感从你的");
         if(get_player().hasVagina())
         {
            outputText("G点");
         }
         else
         {
            outputText("前列腺");
         }
         outputText("传来，牛头人宽大的龟头隔着你的");
         if(get_player().hasVagina())
         {
            outputText("阴道");
         }
         else
         {
            outputText("肠道");
         }
         outputText("壁摩擦着它。你咬着嘴唇，几乎无法抑制住快感，双手抚上乳房，在公牛每一次高潮般的抽插间隙，把玩着被奶水浸透的乳头。");
         outputText("[pg]你身边传来一声轻笑，只见牛娘已经从刚才的高潮中恢复过来，重新跪起身。她向前爬去，跪在你的头顶上方，俯身亲吻她的牛头人情人。两人互相低语着甜言蜜语，声音模糊不清，但这并不重要。你所有的注意力都集中在牢牢插在你体内的那根肉棒上……还有，距离你脸庞仅有[if (metric) {几厘米|几英寸}]的牛娘那湿透的阴部。雪白的液滴顺着她的双腿滴落，其中一滴甚至落在了你的嘴唇上。你情不自禁地舔干净了它，品尝着这二手精液的味道。");
         outputText("[pg]你脑海中的某个部分对接下来发生的事情提出了抗议，但这个声音很快就被你大脑中由成瘾引发的迷雾所压制。你抬起头，伸出舌头，从牛娘的阴部吸溜了一大口精液。上方传来一声惊讶的叫声，紧接着是一声愉悦的娇喘。令你惊讶的是，牛娘竟然把她的阴部降到了你的脸上，疯狂地咯咯笑着，让你的鼻腔里充满了她阴部的气味，充满了刚刚做爱后的气味。你没有浪费这个机会，回报了她之前的举动，将你");
         if(get_player().tongue.type == 1)
         {
            outputText("蛇一般的");
         }
         else if(get_player().tongue.type == 2)
         {
            outputText("恶魔般的");
         }
         else if(get_player().tongue.type == 3)
         {
            outputText("龙一般的");
         }
         else if(get_player().hasLongTongue())
         {
            outputText("非人般长的");
         }
         outputText("舌头滑入她的体内，急切地舔舐并大口吞咽着牛头人留下的礼物。");
         outputText("[pg]至于牛头人，他并不急于给你也来一发内射。他的抽插缓慢而从容，节奏让你在快感中扭动。你们三个像某种色情金字塔一样一起呻吟。公牛对你");
         if(get_player().hasVagina())
         {
            outputText("子宫");
         }
         else
         {
            outputText("后庭");
         }
         outputText("的攻势慢慢增强，你能感觉到自己的四肢在期待着牛头人精液带来的高潮而发麻。");
         outputText("[pg]这种感觉从你的手指开始，你的神经在那里沸腾，像抓床单一样抓起一把把草。热量顺着你的手臂继续向下，像闪电一样击中你的身体，你的肚子突然挺起，背部拱起，高潮的雷暴席卷了你。然而，火焰并没有就此停止。它们向下蔓延到你的胯部，突然点亮了你");
         if(get_player().hasVagina())
         {
            outputText("[vagina]");
         }
         else
         {
            outputText("[asshole]");
         }
         outputText("就像一棵圣诞树。你敏锐地察觉到每一次动作，每一次脉动，以及你和那个住在你体内的巨大肉棒之间的每一次微小接触。");
         outputText("[pg]当牛头人发出一声震耳欲聋的咆哮时，你的肌肉痉挛并紧绷起来。他自己的阴茎抽搐着，突然释放出一股滚烫的精液，涌入你那等待着的");
         if(get_player().hasVagina())
         {
            outputText("子宫");
         }
         else
         {
            outputText("肠道");
         }
         outputText("。当那期待已久的精液冲击你的内壁时，就像另一道闪电劈中。它顺着你的脊椎向上蔓延，让你的整个大脑都亮了起来。狂喜包裹着幸福，伴随着令人陶醉的狂欢吞噬了你的思绪。你的视野变得一片雪白，就像填满你身体的种子一样洁白如玉，你的嘴唇微微张开，发出一声原始的[say: moo]。");
         outputText("[pg]在很长一段时间里，你那被精液弄得晕乎乎的脑子里唯一能想到的就是肉棒和小穴，以及怀孕的肚子和被填满的胃。你的脑海中充满了自己跪在地上，每天服侍这个牛头人的画面，希望能让他足够满意，让他用他那神圣的肉棒恩赐你的");
         if(!get_player().hasVagina())
         {
            outputText("新");
         }
         outputText("子宫。");
         outputText("[pg]你花了几分钟才从这种高潮的快感中平静下来，当你回过神来时，你看到你的牛头人情人还没有从他的高潮中恢复过来。他仰面躺在这片空地的中央，他那依然坚硬如石的肉棒向上挺立着，上面涂满各种汁液的混合物。牛娘坐在他旁边，小心翼翼地舔舐着那根高耸的肉棒。你坐了起来，摇摇晃晃地捂着肚子。两端都被精液填满，你忍不住感到一种奇怪的不满足。也许大口吞下一些二手的精液还不足以满足你的饥渴。也许你需要直接从源头获取，就像现在这样。");
         outputText("[pg]你小心翼翼地坐起来，身体仍然因为快感而颤抖着。每一个动作都会让你的身体产生另一种奢华的余震。你爬到那个四仰八叉的牛头人身边，在你的牛娘伴侣对面，和她一起把男人的肉棒舔干净。这需要费点功夫，但很快它就在上方红色天空的光芒下闪闪发光。");
         outputText("[pg]仿佛你们俩都有某种牛类的心灵感应，你们俩都向前倾身，用你们");
         if(get_player().bRows() > 1)
         {
            outputText("最上面的");
         }
         outputText("乳房包裹住他那巨大的肉棒。你们的脸庞相遇，她柔软的嘴唇压在你的嘴唇上，你们每个人都热切地将舌头伸进对方的嘴里，交换着你们在过去一个小时左右收集的汁液。你身下的公牛呻吟着，感受到了四个乳房包围着他的爱欲之柱。");
         outputText("[pg]你们俩上下抽动着乳房，你们的嘴唇几乎没有离开过对方，只是偶尔给他的阴茎一个吻、舔舐或吸吮。你们上下起伏，这一次是牛头人的身体被狂喜所折磨，在地上扭动着。乳汁从你们的乳房中滴落，在你、牛娘和牛头人的身上涂上一层细细的白色光泽，并散发出一股弥漫在空气中的甜美香气。");
         outputText("[pg]公牛呻吟着，咬着嘴唇，第三次，也可能是最后一次高潮撕裂了他。他的臀部向上挺起，他的肉棒猛地从你们的乳房中弹了出来。一缕缕完美无瑕的银色种子从他的马眼中喷射而出，在空中划出一道弧线[if (metric) {整整一米|几英尺}]，然后溅落在你们的头上。你毫不犹豫地将嘴唇贴在龟头上，大口大口地吞咽着甜美的男人的乳汁。尽管这是他这一个小时里的第三发，但它和前几发一样大，很快你发现你再也吞不下去了；你那装满精液的肚子就是不允许。");
         outputText("[pg]遗憾的是，你松开了他的肉棒，向后坐去，看着对面的牛娘接替你刚才的位置，以一种专注的热情吸吮着你漏掉的东西。");
         outputText("[pg]<b>现在</b>你感到满足了。两端都充满了那珍贵的、新鲜的牛头人精液。你瘫倒在背上，进入了一个朦胧的、充满公牛的梦境世界。");
         outputText("...");
         outputText("[pg]几个小时后你醒了过来。牛头人和牛娘都不见踪影，但你的[armor]被整齐地叠放在你旁边，还有一个装满白色液体的小瓶子，很可能是你的“公牛”送给你的礼物。");
         outputText("[pg]你迅速穿好衣服，返回营地。一路上，你偶尔会瞥见地精或小恶魔从藏身处匆匆跑过，毫无疑问，它们正在从自己造成的性高潮中恢复过来。");
         get_player().orgasm("VaginalAnal");
         dynStats(DynStat.Lib(0.5),DynStat.Sens(-3),DynStat.Cor(1));
         if(get_game().ceraphScene.hasExhibition())
         {
            outputText("一阵战栗传遍全身。尽管你已经达到了如此令人满足的高潮，但一想到地精和小恶魔在看着你并因此高潮……这就让你比以前更加饥渴了。");
            dynStats(DynStat.Lust(get_player().maxLust(),DynStatOp.Eq));
         }
         get_player().minoCumAddiction(10);
         get_player().knockUp(2,432);
         if(get_player().hasStatusEffect(StatusEffects.Feeder))
         {
            get_player().addStatusValue(StatusEffects.Feeder,1,1);
            get_player().changeStatusValue(StatusEffects.Feeder,2,0);
         }
         var _temp_1:* = get_game().time;
         _temp_1.hours = _temp_1.hours + 1;
         get_inventory().takeItem(get_consumables().MINOCUM,get_camp().returnToCampUseOneHour);
      }
      
      public function girlRapeAMinotaur() : void
      {
         spriteSelect(SpriteDb.get_s_minotaur());
         minoRapeIntro();
         get_player().slimeFeed();
         minoCumAddiction(5);
         outputText("[pg]你猛地一推，将喘着粗气的牛头人翻转过来，让他仰面朝天，那根跳动着的" + get_monster().cockDescriptShort(0) + "暴露在空气中。你随手一挥，剥开你的[armor]，露出你的" + get_player().vaginaDescript(0) + "，空气中的气味已经让它比平时更加湿润。你走上前去，跨坐在那只毫无知觉的牛头人身上，他正疯狂地自慰，肌肉因用力而隆起，浑身是汗。你的目光锁定在他那根布满棱纹的马状阴茎上溢出的一滴先列腺液，找到了那股气味的源头。[pg]");
         get_images().showImage("minotaur-win-female");
         if(get_player().vaginalCapacity() < get_monster().cockArea(0))
         {
            outputText("当你俯下身子时，所有的克制都烟消云散了，你那渴望接触的" + get_player().vaginaDescript(0) + "隐隐作痛。当你触碰到他那根晃动的肉柱时，你的大腿微微颤抖，滑腻的先列腺液浸透了你肿胀的阴蒂，让它充满了令人酥麻的温暖。你完全没有意识到明显的尺寸差异，身体向下压去，双膝发软，粗暴地将他那膨大的龟头顶在你的" + get_player().vaginaDescript(0) + "上。被这野兽的肉棒贯穿的渴望压倒了一切，不断漏出的先列腺液正泵入你的爱道，更是推波助澜。带着一种源于不自然欲望的力量，你抓住他的侧腹，用力向下压，当你吞下他的长度时，你感到自己被痛苦地撑开了。");
         }
         if(get_player().vaginalCapacity() >= get_monster().cockArea(0) && get_player().vaginalCapacity() < get_monster().cockArea(0) * 1.5)
         {
            outputText("当你俯下身子时，所有的克制都烟消云散了，你那渴望接触的" + get_player().vaginaDescript(0) + "隐隐作痛。当你触碰到他那根晃动的肉柱时，你的大腿微微颤抖，滑腻的先列腺液浸透了你肿胀的阴蒂，让它充满了令人酥麻的温暖。你急切地向下压去，高兴地发现你应该能够容纳他的长度和粗细。那过于宽大的龟头滑了进去，他分泌的大量体液轻易地润滑了它，麝香般的先列腺液带着令人陶醉的感觉润滑着你的通道。你刻意放慢速度，顺着他的肉棒沉下去，当你经过他肉棒上每一个厚实的肉环时，你颤抖了一次，两次，然后是三次。最终，你坐到了底。");
         }
         if(get_player().vaginalCapacity() >= get_monster().cockArea(0) * 1.5)
         {
            outputText("当你俯下身子时，所有的克制都烟消云散了，你那渴望接触的" + get_player().vaginaDescript(0) + "隐隐作痛。当你触碰到他那根晃动的肉柱时，你的大腿微微颤抖，滑腻的先列腺液浸透了你肿胀的阴蒂，让它充满了令人酥麻的温暖。你带着充满欲望的咯咯笑声，将他的龟头滑入你的" + get_player().vaginaDescript(0) + "，让他把麝香般的先列腺液滴入你宽阔的爱道深处。你慢慢地沉下去，轻松地包容了他那根马一样的肉棒，享受着他那三个厚实的肉环滑过你阴唇的感觉。最终你吞下了他的全部，只希望他能再大一点……");
         }
         outputText("[pg]最后，你感觉到牛头人粗壮的手抓住了你的");
         if(get_player().isTaur())
         {
            outputText("后臀，强行将你的小穴顺着他的长度摩擦，就像对待一个玩具一样。");
         }
         else
         {
            outputText("[hips]，强行顺着他的长度上下摩擦，就像对待一个廉价的性玩具一样。");
         }
         if(get_player().vaginalCapacity() < get_monster().cockArea(0))
         {
            outputText("他的" + get_monster().cockDescriptShort(0) + "上的每一道棱纹都紧紧地压在你的肉壁上，每一次抽插都将更多奇妙的先列腺液涂抹进你的体内。");
         }
         if(get_player().vaginalCapacity() >= get_monster().cockArea(0) && get_player().vaginalCapacity() * 1.5 < get_monster().cockArea(0))
         {
            outputText("他的" + get_monster().cockDescriptShort(0) + "的每一次抽插都会将更多奇妙的先列腺液注入你的体内，让一种令人放松的温暖传遍你的腹股沟。");
         }
         if(get_player().vaginalCapacity() * 1.5 >= get_monster().cockArea(0))
         {
            outputText("他的" + get_monster().cockDescriptShort(0) + "的每一次抽插都轻松地滑入你的" + get_player().vaginaDescript(0) + "，让他在你隐隐作痛的子宫里慢慢积聚起一滩奇妙的、如毒品般的先列腺液。");
         }
         outputText("牛头人加快了速度，心跳声透过他坚硬的肉棒传来，当他一次又一次地将你砸在上面时，肉棒随之抽搐和震动。你感觉到他的睾丸在你的屁股上抽动，他的肉棒肉眼可见地变粗，根部鼓起，并在你体内慢慢变胖，直到感觉快要撑破了。伴随着一声沙哑的咆哮，他终于射了，将精液直接喷射进你的子宫。当精液填满你时，你翻了翻白眼，感受着那液体的快感渗入体内，令你神魂颠倒。你的" + get_player().vaginaDescript(0) + "紧紧夹住，将他的精液锁在里面，他的高潮持续着，睾丸开始缩小。大量的液体填满了你的子宫，痛苦地撑大了你的肚子。牛头人给出了最后一次强有力的喷射，这股力量将你从他的" + get_monster().cockDescriptShort(0) + "上推开，就在你们俩都达到完全的性满足时。[pg]");
         get_player().cuntChange(get_monster().cockArea(0),true);
         outputText("他发出一声满足的叹息，昏了过去，睾丸缩小到棒球大小，肉棒还在滴着精液。你摇摇晃晃地站起[feet]，沉醉在快感中，踉跄着走开，下意识地夹紧你的" + get_player().vaginaDescript(0) + "，以留住他那美妙的精液。");
         if(get_player().vaginalCapacity() < get_monster().cockArea(0))
         {
            outputText("[pg]混合着纯粹的性快感，你感觉到一种弥漫的疼痛和麻木从你那饱受蹂躏的" + get_player().vaginaDescript(0) + "传来，但你微笑着决定这一切都是值得的，因为他的精液麻痹了最后的疼痛。");
         }
         get_player().orgasm("Vaginal");
         dynStats(DynStat.Spe(-0.5),DynStat.Inte(-0.5),DynStat.Sens(1.5),DynStat.Cor(1));
         get_player().knockUp(2,432);
         get_combat().cleanupAfterCombat();
      }
      
      public function getRapedByMinotaur(param1:Boolean = false) : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_minotaur());
         get_player().slimeFeed();
         var _loc2_:int = 17 + 2 * get_difficulty();
         var _loc3_:int = 12 + 3 * get_difficulty();
         if(!param1)
         {
            if(Utils.rand(2) == 0 && get_player().butt.rating >= 15 && get_player().vaginalCapacity() < get_monster().biggestCockArea() && get_player().tone < 60)
            {
               getMinoHawtDawged();
               return;
            }
            if(Utils.rand(2) == 0 && !get_player().isTaur())
            {
               getOralRapedByMinotaur();
               return;
            }
         }
         else
         {
            get_images().showImage("encounter-minotaur");
            outputText("当你沿着蜿蜒的小路走上岩石小径时，你来到了一个洞穴的入口。向里面张望，一股强烈的麝香味扑面而来。这种原始的气味让你兴奋，几乎立刻就让你勃起了。你的大脑不像平时那么清醒，你慢慢地潜入洞穴。洞穴的地面上散落着生命的迹象。[pg]");
            dynStats(DynStat.Lust(10 + get_player().lib / 5));
            if(Utils.rand(30) + get_player().get_inte() / 5 > _loc2_)
            {
               outputText("你发现一个影子在移动，转过身去，看到一个牛头人从洞穴深处笨重地追着你！");
               unlockCodexEntry(2048);
               startCombat(new Minotaur());
               return;
            }
            outputText("突然，你从后面被抓住，你的双臂被一只巨大的、毛茸茸的手紧紧抱住。沉重、喷着响鼻的呼吸拂过你的头顶。你转过脖子，看到一个巨大的牛头人。他那令人印象深刻的肉棒压在");
            if(get_player().isTaur())
            {
               outputText("你的臀部上");
            }
            else
            {
               outputText("你的后腰上");
            }
            outputText("随着它变得更大更硬，把先列腺液涂抹在你的皮肤上，让你不寒而栗。");
            if(Utils.rand(20) + get_player().get_str() / 3 > _loc2_ || Utils.rand(20) + get_player().get_spe() / 5 > _loc2_ || get_player().level >= _loc3_)
            {
               outputText("[pg]你利用额外的润滑剂扭动身体，挣脱了束缚！滚开后，你蹲下身子，准备战斗！");
               startCombat(new Minotaur());
               return;
            }
         }
         if(int(get_player().vaginas.length) > 0)
         {
            if(get_player().lib + Utils.rand(15) > 50)
            {
               get_images().showImage("minotaur-loss-butt-female");
               outputText("牛头人粗暴地抓住你的头发，重新调整姿势，压在你的屁眼上，慢慢地增加压力，直到突然，那膨胀的龟头猛地插进了你体内。");
               get_player().buttChange(get_monster().cockArea(0),true);
               minoCumAddiction(15);
               if(get_player().isTaur())
               {
                  outputText("[pg]他站到你的后腿后面，粗暴地将你刺穿在他的肉棒上，尽可能深地挤进你体内。你大叫起来，感觉到你的胃部膨胀以容纳他惊人的尺寸。他抓住你的屁股，开始用他巨大的阴茎猛烈地捣弄你的后庭。");
               }
               else
               {
                  outputText("[pg]他把你举到半空中，毫不费力地举起你微不足道的重量，粗暴地将你刺穿在他的肉棒上，尽可能深地挤进你体内。你大叫起来，低头看到你的胃部膨胀以容纳他惊人的尺寸。他把你当成一个人形飞机杯，只是抓住你的躯干，开始把你上下举起。");
               }
               if(get_player().biggestTitSize() >= 1 && get_player().mostBreastsPerRow() > 1 && int(get_player().breastRows.length) > 0)
               {
                  outputText("他一边这样做，一边粗暴地揉捏你的乳房，几乎是暴力地挤压和拉扯它们，以满足他的乐趣。");
                  if(get_player().biggestLactation() > 1.5)
                  {
                     outputText("当你的乳汁开始喷射出来时，他发出一声呼噜声，你认为这是赞许的意思。他满意地舔了舔沾满乳汁的手指。");
                  }
               }
               if(get_player().cockTotal() == 1)
               {
                  outputText("牛头人微微前倾，用令人窒息的力道握住你的[cock]。他一边继续抽插，一边短促地套弄着。");
               }
               if(get_player().cockTotal() > 1)
               {
                  outputText("牛头人微微前倾，用令人窒息的力道握住你的一根[cock]。他一边继续抽插，一边短促地套弄着。");
               }
               outputText("[pg]终于，你感觉到他要射了。他的抽插变得更短更快，就在你以为自己再也受不了的时候，他开始把精液射进你体内。大量的牛精泵入你的肚子，让你的胃部开始隆起。");
               dynStats(DynStat.Lib(1),DynStat.Sens(-0.5),DynStat.Cor(1));
               if(get_player().cockTotal() > 0 && get_player().sens + Utils.rand(40) > 50)
               {
                  outputText("你高潮了，");
                  if(get_player().cumQ() < 25)
                  {
                     outputText("在这场残酷的强暴中无助地喷射出精液。");
                  }
                  if(get_player().cumQ() >= 25 && get_player().cumQ() < 250)
                  {
                     outputText("在洞穴里喷出浓稠的精液。");
                  }
                  if(get_player().cumQ() >= 250 && get_player().cumQ() < 500)
                  {
                     outputText("猛烈地喷射出浓稠的精液，溅满了洞穴的墙壁和地板。");
                  }
                  if(get_player().cumQ() >= 500)
                  {
                     outputText("在巨大的牛头人肉棒的持续压迫下，你喷射出仿佛无穷无尽的浓稠精液。你用精液涂满了洞穴的墙壁，野兽一边粗暴地套弄你的[cock]，一边怂恿着你。你隐约感觉到你的高潮在不断地延续，直到最后高潮停止，在地板上留下了一大滩精液。");
                  }
                  get_player().orgasm("Anal");
                  dynStats(DynStat.Lib(0.5),DynStat.Sens(1),DynStat.Cor(1));
               }
               outputText("牛头人放松了片刻，然后把你推开，推倒在冰冷的地上。当大量的怪物精液从你扩张的屁眼流出时，一种奇怪的快感席卷了你，你晕了过去。");
            }
            else
            {
               if(get_player().deerScore() >= 4)
               {
                  get_images().showImage("minotaur-loss-vag-deer");
               }
               else if(get_player().cowScore() >= 4)
               {
                  get_images().showImage("minotaur-loss-vag-cow");
               }
               else if(get_player().catScore() >= 4)
               {
                  get_images().showImage("minotaur-loss-vag-cat");
               }
               else
               {
                  get_images().showImage("minotaur-loss-vag");
               }
               outputText("牛头人粗暴地抓住你的头发，开始用他阴茎膨大的头部摩擦你的" + get_player().vaginaDescript(0) + "。");
               if(get_player().averageVaginalWetness() < 2)
               {
                  outputText("你下面不是很湿，害怕这头野兽会对你的" + get_player().vaginaDescript(0) + "造成伤害。");
               }
               else
               {
                  outputText("此时你已经羞耻地湿透了，你的膝盖准备弯曲。");
               }
               minoCumAddiction(5);
               if(get_player().isTaur())
               {
                  outputText("[pg]他站到你的后腿后面，粗暴地将你刺穿在他的肉棒上，尽可能深地挤进你体内。你大叫起来，感觉到你的胃部膨胀以容纳他惊人的尺寸。他抓住你的屁股，开始用他巨大的阴茎猛烈地捣弄你的后庭。");
               }
               else
               {
                  outputText("[pg]他把你举到半空中，毫不费力地举起你微不足道的重量，粗暴地将你刺穿在他的肉棒上，尽可能深地挤进你体内。你大叫起来，低头看到你的胃部膨胀以容纳他惊人的尺寸。他把你当成一个人形飞机杯，只是抓住你的躯干，开始把你上下举起。");
               }
               get_player().cuntChange(72,true,false,true);
               if(get_player().biggestTitSize() >= 1 && get_player().mostBreastsPerRow() > 1 && int(get_player().breastRows.length) > 0)
               {
                  outputText("他一边这样做，一边粗暴地揉捏你的乳房，几乎是暴力地挤压和拉扯它们，以满足他的乐趣。");
                  if(get_player().biggestLactation() > 1.5)
                  {
                     outputText("当你的乳汁开始喷射出来时，他发出一声呼噜声，你认为这是赞许的意思。他满意地舔了舔沾满乳汁的手指。");
                  }
               }
               if(get_player().cockTotal() == 1)
               {
                  outputText("牛头人微微前倾，用令人窒息的力道握住你的[cock]。他一边继续抽插，一边短促地套弄着。");
               }
               if(get_player().cockTotal() > 1)
               {
                  outputText("牛头人微微前倾，用令人窒息的力道握住你的一根[cock]。他一边继续抽插，一边短促地套弄着。");
               }
               if(get_player().vaginalCapacity() < get_monster().cockArea(0))
               {
                  outputText("[pg]当他粗壮的、带有螺纹的肉棒蹂躏你紧致的小穴时，你痛得咬紧牙关。过了一会儿，一种麻木感袭来，你开始感觉到微弱的快感穿透了痛苦的帷幕。你听到野兽嘴里发出愉悦和满足的呼噜声。");
               }
               if(get_player().vaginalCapacity() >= get_monster().cockArea(0) && get_player().vaginalCapacity() < get_monster().cockArea(0) * 1.5)
               {
                  outputText("[pg]你感觉到他那可怕的、带有螺纹的肉棒在你的爱道里美妙地摩擦着，随着野兽不断地挺进，一阵阵令人发狂的快感传到你的大脑。你忘记了一切，只顾着享受，像个荡妇一样大声呻吟，而野兽也因为自己的快乐而轻笑和呼噜着。");
               }
               if(get_player().vaginalCapacity() >= get_monster().cockArea(0) * 1.5)
               {
                  outputText("[pg]你感觉到他那可怕的肉棒在你宽阔的肉洞里轻松地滑进滑出，听到野兽发出不满的呼噜声。他突然拍打你的左臀，这让你肌肉紧绷，包括你的阴道，你开始感觉到他肉棒上的螺纹摩擦着你的内壁。这给你带来的快感让你肌肉绷得更紧，导致快感再次膨胀。牛头人发出赞许的呼噜声，并在你开始呻吟时继续他暴力的捣弄。");
               }
               outputText("[pg]终于，你感觉到他要射了。他的抽插变得更短更快，就在你以为自己再也受不了的时候，他开始把精液射进你体内。大量的牛精泵入你的肚子，让你的胃部开始隆起。");
               dynStats(DynStat.Lib(1),DynStat.Sens(-0.5),DynStat.Cor(1));
               if(get_player().averageVaginalWetness() >= 2)
               {
                  if(get_player().averageVaginalWetness() < 4)
                  {
                     outputText("你扭动着，颤抖着，在野兽粗暴的对待下达到了高潮。");
                  }
                  if(get_player().averageVaginalWetness() == 4)
                  {
                     outputText("你扭动着身躯，在这头野兽粗暴的对待下高潮了，用你的" + get_player().vaginaDescript(0) + "将他浸湿。");
                  }
                  if(get_player().averageVaginalWetness() == 5)
                  {
                     outputText("你在他巨大的肉棒上高潮了，把淫水溅了野兽一身。");
                  }
                  get_player().orgasm("Vaginal");
                  dynStats(DynStat.Lib(0.5),DynStat.Sens(1),DynStat.Cor(1));
               }
               if(get_player().averageVaginalWetness() < 2)
               {
                  outputText("你痛苦地喘息着，你的小穴被粗暴猛烈的插入摩擦得生疼。");
                  dynStats(DynStat.Tou(-0.5),DynStat.Sens(1),DynStat.Lust(-5),DynStat.Cor(1));
               }
               get_player().knockUp(2,432);
               if(get_player().cockTotal() > 0 && get_player().sens + Utils.rand(40) > 50)
               {
                  outputText("你高潮了，");
                  if(get_player().cumQ() < 25)
                  {
                     outputText("在这场残酷的强暴中无助地喷射出精液。");
                  }
                  if(get_player().cumQ() >= 25 && get_player().cumQ() < 250)
                  {
                     outputText("在洞穴里喷出浓稠的精液。");
                  }
                  if(get_player().cumQ() >= 250 && get_player().cumQ() < 500)
                  {
                     outputText("猛烈地喷射出浓稠的精液，溅满了洞穴的墙壁和地板。");
                  }
                  if(get_player().cumQ() >= 500)
                  {
                     outputText("在巨大的牛头人肉棒的持续压迫下，你喷射出仿佛无穷无尽的浓稠精液。你用精液涂满了洞穴的墙壁，野兽一边粗暴地套弄你的[cock]，一边怂恿着你。你隐约感觉到你的高潮在不断地延续，直到最后高潮停止，在地板上留下了一大滩精液。");
                  }
                  get_player().orgasm("Anal");
                  dynStats(DynStat.Lib(0.5),DynStat.Sens(1),DynStat.Cor(1));
               }
               outputText("牛头人放松了片刻，然后把你从他身上推开，推到冰冷的地上。当你晕过去的时候，一种奇怪的欣快感席卷了你，同时大量的怪物精液从你肿胀的小穴里流出。");
            }
         }
         else
         {
            if(get_player().isCentaur())
            {
               get_images().showImage("minotaur-loss-butt-centaur");
            }
            else if(get_player().cowScore() >= 4)
            {
               get_images().showImage("minotaur-loss-butt-cow");
            }
            else if(get_player().dogScore() >= 4)
            {
               get_images().showImage("minotaur-loss-butt-dog");
            }
            else if(get_player().wolfScore() >= 4)
            {
               get_images().showImage("minotaur-loss-butt-wolf");
            }
            else if(get_player().goblinScore() >= 4)
            {
               get_images().showImage("minotaur-loss-butt-goblin");
            }
            else
            {
               get_images().showImage("minotaur-loss-butt");
            }
            outputText("牛头人粗暴地抓住你的头发，重新调整姿势，压在你的屁眼上，慢慢地增加压力，直到突然，那膨胀的龟头猛地插进了你体内。");
            get_player().buttChange(get_monster().cockArea(0),true);
            minoCumAddiction(15);
            if(get_player().isTaur())
            {
               outputText("[pg]他站到你的后腿后面，粗暴地将你刺穿在他的肉棒上，尽可能深地挤进你体内。你大叫起来，感觉到你的胃部膨胀以容纳他惊人的尺寸。他抓住你的屁股，开始用他巨大的阴茎猛烈地捣弄你的后庭。");
            }
            else
            {
               outputText("[pg]他把你举到半空中，毫不费力地举起你微不足道的重量，粗暴地将你刺穿在他的肉棒上，尽可能深地挤进你体内。你大叫起来，低头看到你的胃部膨胀以容纳他惊人的尺寸。他把你当成一个人形飞机杯，只是抓住你的躯干，开始把你上下举起。");
            }
            if(get_player().biggestTitSize() >= 1 && get_player().mostBreastsPerRow() > 1 && int(get_player().breastRows.length) > 0)
            {
               outputText("他一边这样做，一边粗暴地揉捏你的乳房，几乎是暴力地挤压和拉扯它们，以满足他的乐趣。");
               if(get_player().biggestLactation() > 1.5)
               {
                  outputText("当你的乳汁开始喷射出来时，他发出一声呼噜声，你认为这是赞许的意思。他满意地舔了舔沾满乳汁的手指。");
               }
            }
            if(get_player().cockTotal() == 1)
            {
               outputText("牛头人微微前倾，用令人窒息的力道握住你的[cock]。他一边继续抽插，一边短促地套弄着。");
            }
            if(get_player().cockTotal() > 1)
            {
               outputText("牛头人微微前倾，用令人窒息的力道握住你的一根[cock]。他一边继续抽插，一边短促地套弄着。");
            }
            outputText("[pg]终于，你感觉到他要射了。他的抽插变得更短更快，就在你以为自己再也受不了的时候，他开始把精液射进你体内。大量的牛精泵入你的肚子，让你的胃部开始隆起。");
            dynStats(DynStat.Lib(1),DynStat.Sens(-0.5),DynStat.Cor(1));
            if(get_player().cockTotal() > 0 && get_player().sens + Utils.rand(40) > 50)
            {
               outputText("你高潮了，");
               if(get_player().cumQ() < 25)
               {
                  outputText("在这场残酷的强暴中无助地喷射出精液。");
               }
               if(get_player().cumQ() >= 25 && get_player().cumQ() < 250)
               {
                  outputText("在洞穴里喷出浓稠的精液。");
               }
               if(get_player().cumQ() >= 250 && get_player().cumQ() < 500)
               {
                  outputText("猛烈地喷射出浓稠的精液，溅满了洞穴的墙壁和地板。");
               }
               if(get_player().cumQ() >= 500)
               {
                  outputText("在巨大的牛头人肉棒的持续压迫下，你喷射出仿佛无穷无尽的浓稠精液。你用精液涂满了洞穴的墙壁，野兽一边粗暴地套弄你的[cock]，一边怂恿着你。你隐约感觉到你的高潮在不断地延续，直到最后高潮停止，在地板上留下了一大滩精液。");
               }
               get_player().orgasm("Anal");
               dynStats(DynStat.Lib(0.5),DynStat.Sens(1),DynStat.Cor(1));
            }
            outputText("牛头人放松了片刻，然后把你推开，推倒在冰冷的地上。当大量的怪物精液从你扩张的屁眼流出时，一种奇怪的快感席卷了你，你晕了过去。");
         }
         if(get_game().get_inCombat())
         {
            get_combat().cleanupAfterCombat();
         }
         else
         {
            doNext(get_camp().returnToCampUseFourHours);
         }
      }
      
      public function getOralRapedByMinotaur() : void
      {
         spriteSelect(SpriteDb.get_s_minotaur());
         clearOutput();
         get_monster().hasCock();
         outputText("巨大的牛头人单手搂住你的腰，把你翻了过来。你被他倒吊着，[legs]在空中张开。牛头人把你的脸按在他汗津津的蛋蛋上摩擦，把他的体味抹在你的皮肤上。牛头人的每个睾丸都比人头还大，阴囊的皮肤紧紧地包裹着他充满精液的蛋蛋。[pg]");
         outputText("牛头人一手抓住你的" + get_player().legs() + "，把你的背猛地撞在冰冷的洞穴墙壁上。你喘着粗气，嘴唇喷出带着麝香的汗滴。牛头人把你拖过粗糙的石头，把你举得更高，把你的" + get_player().legs() + "向后弯过岩架。你被钉在洞穴的墙壁上，[legs]被牛头人的一只手抓住，而他的另一只手则粗暴地抚摸着你伸展的身体。");
         if(get_player().hasBreasts())
         {
            outputText("牛头人抓住你的" + get_player().biggestBreastSizeDescript() + "，用他长满老茧的手挤压揉捏着。");
         }
         if(get_player().cockTotal() >= 1)
         {
            outputText("你的[cocks]拍打着");
            if(get_player().cockTotal() == 1)
            {
               outputText("");
            }
            outputText("当牛头人把你沿着墙壁拖拽时，痛苦地撞击着你的肚子。");
         }
         outputText("你所能看到的只有牛头人巨大的肉棒，龟头在你的嘴上摩擦。牛头人用他的龟头拍打你的脸，把他的体味和先列腺液抹在你的脸颊和头发上。[pg]");
         outputText("牛头人伸出手抓住你的下巴，用力掰开。你知道接下来会发生什么，但决定不反抗。顺从这只野兽是最安全的选择。你尽可能地张大嘴巴，把嘴凑向牛头人可怕的龟头……[pg]");
         get_images().showImage("minotaur-loss-oral");
         outputText("牛头人毫不迟疑，将龟头磨过你的嘴唇，试图将他的" + get_monster().cockDescriptShort(0) + "的顶端塞进你的嘴里。他一边喷着响鼻，一边咕哝着，把你的头按在洞穴的墙壁上，把顶端塞过你的牙齿。牛头人的先列腺液在你的嘴里汇聚，从嘴角滴落，在你的脸上留下粘液的痕迹。你用鼻子呼吸，吸入牛头人的体味，这头野兽又把[if (metric) {一厘米|几分之一英寸}]的牛鞭塞进你的嘴里。又吞下[if (metric) {半厘米|四分之一英寸}]粘稠的肉，你想知道在牛头人使用你的时候，让自己晕过去会不会更好。[pg]");
         outputText("你听到<i>啪</i>的一声，下巴感到一阵剧痛，牛头人把整个龟头塞进了你的嘴里。龟头滑过你的下巴，进入你的嘴里，压住你的舌头，戳着你的喉咙口。肉棒喇叭状的末端卡在你的牙齿后面。牛头人呻吟着，那声音介于公牛呼唤牛群和男人在狂喜中呻吟之间。你双手抓住牛头人的肉棒，支撑着自己，试图把头从洞穴的墙壁上拉开。牛头人开始扭动臀部，一只手抓住你的头，左右扭动，把巨大的龟头在你的嘴里摩擦。[pg]");
         outputText("你把背从墙上弓起，把重量压在牛头人的" + get_monster().cockDescriptShort(0) + "上。你的胸部和肚子摩擦着牛头人巨大的躯干");
         if(get_player().hasBreasts())
         {
            outputText("，痛苦地将你的[nipple]在他粗硬的毛发上摩擦");
         }
         if(get_player().balls > 0)
         {
            outputText("，你能感觉到牛头人灼热的呼吸喷吐在你的[balls]上");
         }
         outputText("。牛头人打着响鼻，猛地挺动臀部，而你则用双手环绕着他的肉棒扭动，希望能让他快点射精。你用舌头挑逗着他的龟头，开始拼命吮吸。当牛头人在你嘴里抽插时，你弯下脖子，希望能更容易地吞下那硕大的顶端。牛头人的臀部开始短促地痉挛，你能听到他的呼噜声越来越密集。你用鼻子深吸一口气，让肺部充满空气，准备迎接这野兽将精液灌满你的喉咙……[pg]");
         outputText("毫无预兆地，牛头人一把将你的[legs]从边缘拽下，抓住了你的腰。他猛地将你按向他的肉棒，同时用力向前挺动臀部。你震惊地瞪大了眼睛，只见牛头人将他那硕大的龟头强行塞过你的嘴巴，直捣喉咙。伴随着咕哝和呻吟，牛头人将他的肉棒一寸寸地强行塞进你的喉咙，同时在你嘴里抽插着。当牛头人肉棒上的第一圈褶皱逼近你的嘴唇时，你的喉咙高高鼓起。[pg]");
         outputText("牛头人咆哮着，猛地向前挺动臀部，将那圈褶皱强行塞过你的嘴唇。你几乎快要窒息了，视线边缘开始模糊。你唯一能看到的只有牛头人的肚子。他的" + get_monster().ballsDescriptLight() + "就在你头下方痉挛，将滚烫的精液泵入他的" + get_monster().cockDescriptShort(0) + "。第一波牛头人的精液让他的肉棒膨胀，冲破了你的牙齿。牛头人在你喉咙深处射精，用滚烫的种子撑起了你的胃。你只能感觉到牛头人那肿胀的肉棒深深地插在你的喉咙里，一波又一波浓稠的精液顺着他的肉棒强行灌入你的肚子。[pg]");
         get_player().refillHunger(50,false);
         outputText("牛头人最后咕哝了几声。完事后，他抬起你的[leg]，将你从他的" + get_monster().cockDescriptShort(0) + "上拔了出来。巨大的龟头滑过你的喉咙，卡在你的牙齿后面，最后伴随着一声响亮的吮吸声拔了出来。精液从你的喉咙里涌出，流了你一脸，牛头人又在你肿胀的肚子上喷射了最后几股。牛头人将你扔在精液池中，转身离去，留下你抱着鼓胀的肚子，在他那如毒品般的精液的麻醉下昏厥过去。你带着幸福的微笑失去了意识。");
         get_player().orgasm("Lips");
         dynStats(DynStat.Sens(1));
         minoCumAddiction(10);
         if(get_game().get_inCombat())
         {
            get_combat().cleanupAfterCombat();
         }
         else
         {
            doNext(get_camp().returnToCampUseFourHours);
         }
      }
      
      public function getMinoHawtDawged() : void
      {
         clearOutput();
         if(get_player().get_lust() >= get_player().maxLust())
         {
            outputText("你双膝跪倒在地，双手急忙捂住胯部和你的");
            if(get_player().hasCock())
            {
               outputText("[cock biggest]，你疯狂地隔着[armor]试图抚摸和摩擦它，它那跳动着的勃起清晰可见。");
            }
            if(get_player().get_gender() == 3)
            {
               outputText("你的另一只手急忙伸向你的");
            }
            if(get_player().hasVagina())
            {
               outputText("[vagina]，它正滴着淫液，顺着你的[armor]内侧流下。你设法隔着[armor]对你的[clit]施加了一些压力，这让你感受到一阵强烈的快感。");
            }
         }
         else if(get_monster().get_weaponName() == "axe")
         {
            outputText("谢天谢地，牛头人那把巨大的、杀人如麻的斧头挥出的最后重击稍微偏了一点——击中你头侧的是斧面，而不是斧刃，这一下把你打得翻滚在泥土中。");
         }
         else
         {
            outputText("牛头人那巨大而粗壮的拳头给了你最后一记重击，正中你的头部侧面，这一击的力量足以让你翻滚着摔进泥土里。");
         }
         outputText("[pg]当你瘫坐在那里时，牛头人蹄子踩在地上发出的“哒哒”声几乎没有在你的脑海中留下印象，你已经被打得支离破碎，无暇顾及其他。它一边打量着你，一边喷着响鼻，那根巨大的公牛阴茎变得越来越硬。这只长着棕色皮毛的兽人抓着你的脖子把你拽了起来，它的力道迫使你的双手不得不抓住它的手臂，以免被它掐死。它迅速剥去了你的[armor]，暴露出你越来越多的赤裸肌肤和脆弱的穴口。");
         outputText("[pg]当牛头人终于把你剥得一丝不挂时，它那巨大的龟头在你的胯部喷出了一大股浓稠的先列腺液。它那温暖、滑腻的体液沾在你的生殖器上，让你脊背发凉。牛头人像对待一个普通的荡妇一样把你翻转过来，迫不及待地想要享用它的战利品，并调整了它的抓握姿势，用一只粗壮的手搂住你的腰，而不是掐着你的脖子。");
         if(get_player().hasVagina())
         {
            outputText("[pg]");
            outputText("它将它的肉棒对准了你流着淫水的阴户，你的身体背叛了你，因为这种粗暴的对待而变得兴奋起来。它的臀部缓慢而坚定地向前挺动，龟头紧紧压在你湿漉漉的小穴上，让你忍不住咬紧了嘴唇。它那肥大的龟头摩擦着你的" + get_player().vaginaDescript(0) + "的感觉几乎让你无法忍受，纯粹的快感让你的脚趾都蜷缩了起来。");
            outputText("[pg]幸运或是倒霉的是，就在它似乎要破门而入，深入你的" + get_player().vaginaDescript(0) + "时——它被你的紧致给挡住了，无法再前进分毫。牛头人重新对准，再次尝试，它用力顶着你的穴口，让你咬紧了嘴唇……但无济于事。它沮丧地咕哝着，用蹄子在泥土上跺了一脚——然后它停了下来，第一次把目光投向了你的[ass]。");
         }
         outputText("[pg]当牛头人打量着你的[ass]时，你能听到它舌头舔舐嘴唇发出的“吧唧”声。它空出的那只手迅速伸出，揉捏着你那肥美、柔软的臀瓣。它的手指陷入了那娇嫩、颤动的臀肉中，在表面按出了一个手印。你能真切地感觉到它的手指在那敏感、淫荡的侧腹周围挖掘、把玩着。");
         outputText("[pg]你强忍住一声呻吟，因为让你感到[if (corruption < 50) {恐惧|肉体上的愉悦}]的是，它那变态的抚摸竟然开始让你兴奋起来，你发现自己正迎合着它的揉捏和坚定、探索的抓握，扭动着臀部。牛头人似乎对你的屁股非常着迷——或者至少对肥大的屁股很着迷——所以它松开了你的腰……只是为了抓住你的臀部把你拉得更高，让你的[ass]贴近它的脸。");
         outputText("[pg]牛头人的口鼻急切地钻进你那圆润的臀瓣之间的缝隙中，你惊讶地叫了一声。片刻之后，你感觉到它的舌头伸了出来，在你紧紧夹住的股沟里四处搜寻着你的[asshole]。在它进一步深入之前，它用唾液涂满了你屁股的一大片区域，沿着你的会阴舔舐——然后直接跳过了你的[asshole]。");
         outputText("[pg]你发出一声沮丧的呻吟，此时你已经相当享受这种舔舐了。你试着鼓励性地扭动臀部，而它的舌头则继续搜寻并用唾液涂抹着你紧致的后庭。它的舌头缩回了嘴里，这突如其来的动作让你吓了一跳，但一秒钟后它又伸了出来，戳刺、拨弄、舔舐着它能触及的每一寸肌肤——直到最后，它找到了你的屁股眼。");
         outputText("[pg]牛头人宽大的舌头舔舐、轻拍着你的[butthole]，你扭动着身体，发出呻吟，每一次舔舐都比上一次更加令人愉悦，你感觉到");
         if(get_player().hasCock())
         {
            outputText("[eachCock]在你身下抽动，将你的先列腺液滴落在地板上。");
         }
         if(get_player().get_gender() == 3)
         {
            outputText("你还感觉到");
         }
         if(get_player().hasVagina())
         {
            outputText("你的[vagina]在收缩和放松，你的整个臀部都在试图迎合牛头人那沾满唾液——以及你自己淫水的探索的舌头。");
         }
         outputText("[pg]当它继续关注你的后庭时，你的身体开始颤抖。你的屁股眼被它的唾液弄得非常湿滑，它发出一声满意的、隆隆的牛叫声——然后它停了下来，将口鼻从你的[butt]和那过大的臀瓣中抽离出来。臀瓣湿漉漉地拍打在一起，你的股沟里仍然沾满了它的唾液。片刻之后，你又被拉了下来，牛头人的手再次搂住你的腰。没过多久，它那膨胀的龟头就开始顶着你臀瓣之间的缝隙，那根粗壮的肉棒要求进入。");
         get_images().showImage("minotaur-loss-butt");
         outputText("[pg]它的唾液和舔舐已经润滑了你肥大的屁股，当它的肉棒潜入你的[ass]时，发出了一声湿润的“吧唧”声，你能感觉到它的肉棒越来越深地压进你的身体。随时它都会顶到你的[asshole]，而你将会用你的内壁包裹住它那根怪物般的肉棒，像个妓女一样为它呻吟。你感觉到它的一股先列腺液溅在了你股沟“底部”的肉上，滴落在你的屁股眼上，你咬紧嘴唇做好了准备。");
         outputText("[pg]……结果却感觉到它的肉棒撞在了你尾骨下方一点的地方。你发出一声沮丧的呻吟，不耐烦地扭动着身体，牛头人试图再次对准，结果它的肉棒却撞在了你屁股眼和胯部之间的会阴上。伴随着一声沮丧的牛叫，牛头人空出的那只手拍在了你颤动的臀瓣上——一声清脆的<b><i>啪</i></b>声回荡开来，这一击让一阵痛苦穿透了你的[butt]。你安静下来，顺从着这个强大的生物，它试图再次对准你的屁股眼。");
         outputText("[pg]这一次，当它试图推进时，你感觉到它的肉棒向上倾斜……直到龟头从你屁股的顶部冒了出来，被你的臀瓣整齐地夹在中间，就像热狗一样。你叹了口气，心想你要在这里待上一段时间了，然后它退了回去，只是为了以完全相同的方式再次操弄你的臀瓣。有一瞬间你感到很困惑，因为它用空出的那只手将你的臀瓣挤压在一起，包裹住它的阴茎，但你没有反抗，因为这种被它操弄股沟的奇妙快感传遍了你的全身。");
         outputText("[pg]它那强壮、充满男子气概的臀部一次又一次地向前挺动，操弄着你那充满少女感的臀部。每次它的臀部撞击你的[butt]时，你的屁股都会弹跳、颤动。它那流着先列腺液的膨胀龟头从你股沟的顶部探出，品尝着空气。随着每一次抽出，它的龟头再次没入你的股沟中，一路留下令人酥麻的先列腺液。牛头人的抽插慢慢加快，它开始发出牛叫声。");
         outputText("[pg]随着它把你的屁股当成另一个发泄的洞穴，你俘虏者的抽插变得越来越猛烈。你发现自己在它的掌控中扭动，但现在完全是因为另一个原因：渴望。虽然它的操弄让你兴奋无比，但它那根公牛阴茎在你的[ass]里带来的愉悦摩擦还不足以让你高潮。然而，它似乎并不在乎；它的牛叫声和咕哝声已经变成了气喘吁吁的发情声，它全速操弄着你的股沟，你臀瓣的弹跳现在变成了一种持续不断、永无止境的运动。");
         outputText("[pg]你发出一声低沉的呜咽，无助地试图抓住自己的胯部，但在持续的操弄和牛头人粗壮手臂的阻挡下，你无法抓住足够长的时间来手淫。值得庆幸的是，在那之后没过多久，牛头人就射精了；又经过了几次颤抖、坚持的抽插……");
         outputText("[pg]……然后他的头部再次从你的屁股顶端探出，喷射出他的精液。一股又一股的精液如雨般倾泻在你身上，涂满了你的屁股，");
         if(get_player().tail.type > 0)
         {
            outputText("你的尾巴，");
         }
         outputText("你的后背，甚至你的头发上都沾满了大股大股粘稠、散发着麝香的精液。随着他高潮的平息，你整个后背都因为他高潮的热度而泛红，最后几滴滚烫的液体从他的肉棒里流出。他从你的屁股里抽了出来，留给你的最后一份礼物是一股卡在你肥大臀瓣间的精液，正慢慢滴落。牛头人的精液似乎让你头晕目眩，一切都开始变得模糊不清……");
         dynStats(DynStat.Lust(15 + Utils.rand(get_player().lib / 2)));
         get_player().slimeFeed();
         minoCumAddiction(5);
         get_combat().cleanupAfterCombat();
      }
      
      public function continueMinoVoyeurism() : void
      {
         clearOutput();
         get_images().showImage("minotaur-cumslut");
         outputText("他们持续了将近一个小时，完全没有注意到你在看着他们，直到他们接近高潮时，强度才有所增加。结果几乎是爆炸性的，两人都大叫起来，开始不受控制地抽搐。牛头人死死地抓住牛娘的屁股，将大量的精液注入她的深处，以至于精液开始喷涌而出。这种意外的润滑让他松开了手，两人瘫倒在地。然而牛头人还没有结束，他的精液像水管一样喷射到空中，溅落到他们俩身上。[pg]");
         outputText("当你看着这两个浑身是精液的生物在性交引起的疲惫昏迷中躺在那里，牛头人粗壮的马屌现在慢慢瘪了下去，你意识到你一直在抚摸自己。你强迫自己停下来");
         if(get_player().cor < 33)
         {
            outputText("感到厌恶。");
         }
         else if(get_player().cor < 66)
         {
            outputText("感到困惑。");
         }
         else
         {
            outputText("不情愿地。");
         }
         outputText("[pg]直到现在，你才注意到有其他面孔从岩架和山脊上探出头来。你数了数，至少有两个地精和一个小恶魔迅速缩了回去。从声音判断，他们正忙着自己解决。");
         if(get_player().statusEffectv1(StatusEffects.MinoPlusCowgirl) == 0)
         {
            outputText("显然，这并不是一场罕见的表演，当地人非常喜欢。");
         }
         dynStats(DynStat.Lust(5 + get_player().lib / 20 + get_player().minoScore() + get_player().cowScore()));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function bumRapeaMinotaur() : void
      {
         spriteSelect(SpriteDb.get_s_minotaur());
         var _loc1_:int = get_player().cockThatFits(get_monster().analCapacity());
         minoRapeIntro();
         get_images().showImage("minotaur-win-male");
         outputText("[pg]你垂下你的");
         if(get_player().cockTotal() == 1)
         {
            outputText(get_player().cockDescript(_loc1_));
         }
         else
         {
            outputText(get_player().multiCockDescriptLight());
         }
         outputText("贴在他高高翘起的臀部上，");
         if(get_player().cumQ() < 25)
         {
            outputText("滴了一点滑腻的先列腺液在他的皮毛上。");
         }
         if(get_player().cumQ() >= 25 && get_player().cumQ() < 250)
         {
            outputText("在他肌肉发达的屁股上漏出细细的先列腺液。");
         }
         if(get_player().cumQ() >= 250 && get_player().cumQ() < 500)
         {
            outputText("把浓稠的先列腺液滴在他的屁股上。你确保把他的后穴涂得满满的，保证有充足的润滑。");
            var _temp_1:* = get_monster().ass;
            _temp_1.analWetness = _temp_1.analWetness + 1;
         }
         if(get_player().cumQ() > 500)
         {
            var _temp_2:* = get_monster().ass;
            _temp_2.analWetness = _temp_2.analWetness + 2;
            outputText("用你过度性奋的雄性器官产生的源源不断的先列腺液冲洗他。浓稠的液体涂满了他的屁眼，有些顺着他的大腿滴下来，剩下的则润滑着他双腿间肿胀的怪物。");
         }
         outputText("当你对准他的后穴时，你轻轻捏了捏他肿胀的蛋蛋，深呼吸着他越来越浓烈的麝香味，感到一阵头晕目眩。");
         outputText("[pg]");
         outputText("几乎没有预兆，你推了进去，惊讶地发现他的括约肌完全放松了。你轻松地向前推进，将" + Utils.num2Text(Math.round(get_player().cocks[0].cockLength)) + "英寸全部滑入他体内，完全到底，感觉到受害者心脏的每一次跳动都在他的直肠内按摩你的" + get_player().cockDescript(_loc1_) + "。每一次跳动都会通过牛头人的背部传来有节奏的收缩，向前推进，带着令人兴奋的强度。在挤压你" + get_player().cockDescript(_loc1_) + "的感觉和充满你脑海的令人陶醉的麝香味之间，你失去了控制，你的臀部不由自主地快速抽插，每一次推力都越来越用力，过度劳累使你的身体筋疲力尽。[pg]");
         outputText("最后，你感觉到高潮的压力正在逼近，促使你更加残暴地猛烈抽插牛头人可怜的受虐后穴。");
         if(get_player().cumQ() <= 25)
         {
            outputText("伴随着长长深深的抽插，你将你的" + get_player().cockDescript(_loc1_) + "埋入他体内，精液喷射进他的后庭。牛头人在无助的快感和痛苦中呻吟，继续自慰，却无法射精。最后，你带着满足的叹息拔了出来。牛头人一团糟，仍在疯狂地自慰，无助地渴望高潮。");
         }
         if(get_player().cumQ() > 25 && get_player().cumQ() <= 250)
         {
            outputText("伴随着长长深深的抽插，你将你的" + get_player().cockDescript(_loc1_) + "埋入他体内，将浓稠的精液泵入他深邃可怕的直肠。当你完成最后几次长长的喷射时，你感觉到" + get_player().cockDescript(_loc1_) + "周围滑腻的灼热。牛头人一团糟，疯狂地自慰，滴着先列腺液，处于高潮的边缘。看起来如果有足够的时间，他甚至可能自己解决。");
         }
         if(get_player().cumQ() > 250 && get_player().cumQ() <= 500)
         {
            outputText("伴随着长长深深的抽插，你将你的" + get_player().cockDescript(_loc1_) + "埋入他体内，随着你自身压力的释放而呻吟，剧烈的肌肉收缩迫使长长的精液喷射而出。在第二次或第三次挤压时，你能感觉到滑腻的灼热开始填满你仍在经历高潮的肉棒周围。几次愉快的挤压之后，你感觉到牛头人随着你男子气概的每一次跳动喷出精液。野兽在你身下抽搐，像老虎钳一样紧紧抓住你，释放出他自己的高潮。当他扭动时，他的屁股似乎榨干了你" + get_player().cockDescript(_loc1_) + "中任何剩余的精液，在地上爆炸性地高潮。当他的" + get_monster().ballsDescriptLight() + "排空时，你感觉到液体溅在你的腿上，强烈的气味让你头晕目眩，陶醉在牛头人毒品般的精液麝香和你自己的高潮中。");
            outputText("[pg]最终你拔了出来，在快感中咯咯地笑，因为你的受害者在他自己的一小滩精液中昏了过去。");
            dynStats(DynStat.Lust(10 + get_player().lib / 10));
         }
         if(get_player().cumQ() > 500)
         {
            outputText("伴随着长长深深的抽插，你将你的" + get_player().cockDescript(_loc1_) + "埋入他体内，随着高潮压力的积累达到顶峰，你的身体颤抖着，终于让你在受害者体内喷发出一股浓稠的精液。随着第一股喷射，你感觉到它在你的" + get_player().cockDescript(_loc1_) + "周围回流，润滑着通道，直到你的第一股喷射终于减弱。片刻之后，你开始了下一次，填满他的直肠，你的精液开始流出，顺着他的大腿和" + get_monster().ballsDescriptLight() + "流下。每一次连续的喷射都会让更多的精液从他的后庭喷出，由于数量和压力，他的肚子微微隆起。你因快感而闭上眼睛，舌头伸出嘴外，处于一种迷糊、充满快感的迷雾中，你感觉到他在你身下紧绷。他的屁股紧紧夹住你的" + get_player().cockDescript(_loc1_) + "，从你身上挤出更浓稠的液体，甚至你能感觉到他的蛋蛋随着他自己高潮的开始而颤抖。伴随着爆炸性的飞溅声，你听到他开始射精，他的" + get_monster().ballsDescriptLight() + "在排空到地上时缩小，溅得到处都是，精液覆盖了牛头人和你的下半身。空气中牛头人麝香的气味似乎增加了三倍，让人难以站立，但更容易继续射精，撑大牛头人的肚子，直到他看起来像怀孕了一样。");
            outputText("[pg]你发出一声狂喜的叹息，挣脱开来，踉跄着退开，而那只牛头人则在自己射出的一大滩精液中昏了过去。你试图清理自己，舔着手指，那美妙的味道让你的大脑充满了欲望的迷雾，令你神魂颠倒。");
            dynStats(DynStat.Lust(15 + get_player().lib / 7));
         }
         get_player().orgasm("Dick");
         get_combat().cleanupAfterCombat();
      }
      
      public function AddictNagaOnMinotaur() : void
      {
         spriteSelect(SpriteDb.get_s_minotaur());
         clearOutput();
         if(get_monster().get_lust() >= get_monster().maxLust())
         {
            outputText("你滑向倒下的怪物，想要品尝他那令人上瘾的精液。他目前正忙着用双手上下套弄他那巨大的肉棒，但当你把他推到坐姿时，他几乎没有反抗。你拉开他的手，换上你的手，用手指沿着他的粗壮上下滑动，满怀期待地让自己兴奋起来。他向后靠去，大声呼气，显然很享受。[pg]");
         }
         else
         {
            outputText("你滑向倒下的怪物，想要品尝他那令人上瘾的精液。你注意到，尽管你刚刚揍了他一顿，他那巨大的肉棒依然完全勃起。你高兴地用双手沿着他长长的肉棒上下轻轻滑动。他大声呼气，表示他的享受。[pg]");
         }
         outputText("一点粘稠的先列腺液开始聚集在他那粗壮的、像马一样的肉棒顶端。你的舌头本能地伸出来，你在空气中尝到了它的气味。这对你来说太刺激了，你被一种绝对的需要所征服，想要用他的花蜜填满自己。你扑向他的胯部，抓住他的大腿，让他的肉棒沿着你的躯干摩擦，同时你把嘴对准他的长度，小心翼翼地避开你长长的尖牙。你猛地把自己拉向他，强迫自己吞下比你想象的还要多的东西。你感觉到他的先列腺液润滑了你的内脏，让你对疼痛麻木，让你能把他吞得更深。你把一只手从他的腿上拿开，放在他仍然暴露在外的肉棒上，抚摸着你嘴里含不下的部分。随着你每次向下推，多吞下一点他，他那野兽般的呼噜声就变得更响亮。你被欲望逼疯了，把另一只手从他的大腿上移开，在你长长的尾巴和他的肉棒上保持平衡，并用它来");
         if(get_player().hasCock())
         {
            outputText("疯狂地抚摸你自己的[cocks]。你那沉闷的快感发声微弱地加入了他的声音。[pg]");
         }
         else
         {
            outputText("拨开你" + get_player().vaginaDescript(0) + "的褶皱，将它滑入其中，以疯狂的活力自慰。你那沉闷的快感发声微弱地加入了他的声音。[pg]");
         }
         outputText("当你的肺部因为缺氧而疼痛时，你意识到你需要比这更快地解决他。你的尾巴尖冲向他，滑入他的后部。你找到了他的肛门，把尾巴尖滑了进去。他那有节奏的呼噜声和喘息声突然改变，表明了他的惊讶，但他没有采取任何行动来消除你的入侵。你对此感到庆幸，慢慢地把它插得更深，即使你试图把他推得更深。你能感觉到牛头人巨大的肉棒中正在升起高潮，在它到来之前，你开始摩擦你判断为他前列腺的地方，试图榨取他的精液。这显然很成功，因为你感觉到他大量的精液穿过他的肉棒，在你的喉咙里膨胀。当第一股滚烫的美味射入你体内时，你的大脑被淹没了，你和他一起达到了高潮，你的眼睛翻白，你的哭声在它们开始之前就被你体内积聚的浓稠精液推了回去，发出咕噜咕噜的声音。由于缺氧和他精液的催情性质而感到头晕目眩，你继续摩擦他的前列腺，他继续向你体内射精，填满你的肚子和喉咙，多余的精液从你的嘴里溢出。你处于完美的幸福之中，但尽管快感让你对疼痛麻木，你意识到你的身体很快就会支撑不住了。就在你觉得你无法继续下去的时候，涌入你体内的精液喷泉开始减缓，牛头人的肉棒开始变软。你从他身上滑下来，把你的尾巴从他体内拔出，注意到他在他那马拉松式的高潮中的某个时刻晕倒了。[pg]");
         get_images().showImage("minotaur-win-naga");
         outputText("你开始擦掉脸上的一些精液，但你被淋得太湿了，这些努力都是徒劳的。你沉醉在快感中，轻声咯咯地笑着，在梦幻般的阴霾中漫步回到你的营地，牛头人的精液仍然带给你的愉悦感觉几乎让你无法思考。在营地里，你蜷缩起来，微笑着想着你体内那巨大的精液量，然后进入了满足的梦乡。");
         minoCumAddiction(10);
         get_monster().setLoot(get_consumables().MINOCUM);
         get_combat().cleanupAfterCombat();
      }
   }
}

