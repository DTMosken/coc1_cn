package classes.scenes.npcs
{
   import classes.Appearance;
   import classes.CoC;
   import classes.Cock;
   import classes.CockTypesEnum;
   import classes.DebugMenu;
   import classes.DynStat;
   import classes.DynStatOp;
   import classes.ImageManager;
   import classes.ItemSlot;
   import classes.ItemType;
   import classes.Monster;
   import classes.Output;
   import classes.PerkLib;
   import classes.Player;
   import classes.PregnancyStore;
   import classes.SelfDebug;
   import classes.StatusEffects;
   import classes.Time;
   import classes.TimeAwareInterface;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.display.SpriteDb;
   import classes.globalFlags.KFLAGS;
   import classes.internals.GuiOutput;
   import classes.internals.Utils;
   import classes.items.Armor;
   import classes.items.ArmorLib;
   import classes.items.Consumable;
   import classes.items.ConsumableLib;
   import classes.items.JewelryLib;
   import classes.items.UseableLib;
   import classes.saves.SelfSaver;
   import classes.saves.SelfSaving;
   import classes.scenes.Camp;
   import classes.scenes.FollowerInteractions;
   import classes.scenes.Inventory;
   import classes.scenes.combat.Combat;
   import classes.scenes.npcs._AmilyScene.SaveContent;
   import classes.scenes.npcs.pets.Akky;
   import classes.scenes.npcs.pregnancies.PlayerAmilyPregnancy;
   import coc.view.ButtonData;
   import coc.view.ButtonDataList;
   import coc.view.CoCButton;
   import flash.Boot;
   import haxe.IMap;
   import haxe.ds.IntMap;
   
   public class AmilyScene extends NPCAwareContent implements TimeAwareInterface, SelfDebug, SelfSaving
   {
      
      public var saveVersion:int;
      
      public var saveName:String;
      
      public var saveContent:SaveContent;
      
      public var pregnancy:PregnancyStore;
      
      public var globalSave:Boolean;
      
      public var buttPregnancy:PregnancyStore;
      
      public function AmilyScene(param1:GuiOutput = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         globalSave = false;
         saveVersion = 1;
         saveName = "amily";
         saveContent = new SaveContent(null,null,null,null,null,null);
         super();
         pregnancy = new PregnancyStore(1195,41);
         buttPregnancy = new PregnancyStore(1196,630);
         pregnancy.addPregnancyEventSet(25,[150,120,100,96,90,72,48]);
         buttPregnancy.addPregnancyEventSet(25,[150,120,100,96,90,72,48]);
         CoC.timeAwareClassAdd(this);
         SelfSaver.register(this);
         DebugMenu.register(this);
         new PlayerAmilyPregnancy(param1);
      }
      
      public function workToPleaseTheCunt() : void
      {
         clearOutput();
         amilySprite(true);
         outputText("你决定采取更主动的姿态，开始抚摸她，揉捏她的乳房，确保她和你一样享受。很快，艾米莉就忍不住了，她沉下身子，开始拼命地骑乘你。没过多久，你们俩就达到了高潮。[pg]");
         get_player().orgasm("Generic");
         dynStats(DynStat.Sens(-1));
         AmilyMiddleGradeSexOver();
      }
      
      public function whyNotHerms() : void
      {
         amilySprite();
         clearOutput();
         outputText("当你走进废弃的村庄寻找艾米莉时，你的思绪再次飘向那个一直困扰你的奇怪难题。你并没有忽略，艾米莉最初似乎想和你谈谈她复兴族人的计划，但在意识到你的双性特征后，只要一提到这个话题，她就坚持要转移话题。");
         outputText("[pg]你太想问她为什么不想谈论这件事了，以至于你差点撞到她。");
         outputText("[say:你看起来在深思；怎么了？]她问道。[pg]");
         outputText("你提醒她，当你们第一次见面时，她谈到她必须在解放她的人民中扮演[say:一个角色]，以及她正要向你寻求帮助，但当她意识到你是一个双性人时，她停了下来。[pg]");
         outputText("艾米莉看着地面，用一只粉红色的爪子漫不经心地蹭着。[say:是的，我确实说过……那个角色？嗯，我被迫意识到，我的族人已经没有自由的了——他们要么死了，要么成了恶魔的奴隶。如果外面还有，他们也离得太远了，对我来说没有任何区别。所以，我做出了决定；如果我是这片土地上最后一只自由的老鼠，那么我必须采取一切必要的措施来恢复我的族群。即使这意味着要成为他们全新一代的母亲。][pg]");
         outputText("你问这是否就是她对你是人类特别感兴趣的原因。[pg]");
         outputText("[say:是的。我听说人类天生纯洁，而且种子很弱；如果我能在恶魔抓住他之前找到一个人类男人，他将是帮助我实现这个目标的完美伴侣，因为他让我怀上的孩子在两种意义上都是纯洁的。][pg]");
         outputText("你交叉双臂，讽刺地问你是什么；切碎的肝脏？[pg]");
         outputText("艾米莉站起来，尽力看着你的眼睛，也交叉着双臂。[say:你不是男人——你是个双性人。我不能和你上床——如果婴儿遗传了那个特征怎么办？][pg]");
         outputText("你问这难道不是一个有利的特征吗，允许每个人既能怀孕又能让别人怀孕，让人口增长得更快。[pg]");
         outputText("[say:但那是不自然的！]她咆哮道……好吧，无论如何，她愤怒地吱吱叫着。[say:长着鸡巴的女人，长着屄的男人——在那些该死的恶魔出现之前，你从未见过这样的生物！他们不正常！我的意思是，你看起来不像个坏人，但我绝不可能和那样的人做爱！][pg]");
         outputText("话音刚落，她转身跑开，迅速消失在瓦砾中。你选择不追上去；看来她显然没有心情谈论这件事。[pg]");
         doNext(get_camp().returnToCampUseOneHour);
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,165,FlagDict_Impl_.arrayReadInt(_loc1_,165) + 1);
      }
      
      public function urtaXAmilyCuntPussyVagSQUICK() : void
      {
         clearOutput();
         outputText("你跳上床和女孩们在一起，紧紧地把艾米莉抱在怀里，给了她一个漫长而深情的吻。然而，在乌尔塔开始抱怨之前，你调皮地拍了一下她的屁股，告诉她好好利用她那根粗大肉感的马鸡巴。她急切地点点头，在你们俩身后跪下，一边抚摸着她的马鸡巴，一边为接下来的三人行做准备。[pg]");
         outputText("你做好了被插入的准备，但它并没有到来。令你惊讶的是，乌尔塔向前猛冲，插进了艾米莉的身体，抓住鼠娘的臀部，把她的肉棒深深地撞进可怜老鼠的肚子里，以至于你能感觉到它隔着她的肚子压在你身上。艾米莉张开嘴，似乎想尖叫，但没有发出任何声音。你趁机把嘴唇贴在她的嘴唇上，将她拉入一个长吻，而乌尔塔开始猛烈而快速地操她。[pg]");
         outputText("你在艾米莉身下扭动，将你的[vagina]正好放在乌尔塔抽插的马鸡巴正下方，让她的肉棒滑过你下唇的刺痛感伴随着你，而艾米莉开始喘息和呻吟。你能看到——也能感觉到——鼠娘的肚子随着乌尔塔巨大阴茎的体积而隆起和移动，这让你感觉到乌尔塔的阴茎滑过你小穴的奇怪感觉加倍了。艾米莉发出一声尖叫，你能感觉到她高潮了，紧紧地收缩着夹住乌尔塔的阴茎，让狐狸费力地咕哝着，以免当场射精。[pg]");
         outputText("在你真正习惯这种感觉之前，它完全停止了。你疑惑地抬头看着乌尔塔，却看到她巨大的阴茎突然从艾米莉体内抽出，塞进你张开的嘴里。你作呕并挣扎，但艾米莉在被猛烈操干后几乎失去了意识，阻止了你离开。乌尔塔咧嘴一笑，[say: 继续，把老鼠的汁液从我身上舔干净。我想为你保持干净，爱人。][pg]");
         outputText("你被迫吸吮乌尔塔的阴茎，否则就会窒息。当你的舌头在她的肉棒上滚动，把玩着龟头并挑逗她的尿道时，她浑身发抖。你仍然能尝到她身上全是艾米莉的味道，一种美妙的味道，混合着乌尔塔自己的汗水和麝香。你几乎把它喝光了，直到乌尔塔把她的肉棒从你嘴里拔出来。当她顺着你的大腿滑下，将她的马鸡巴对准你的[vagina]时，你几乎因为期待而感到头晕目眩。[pg]");
         outputText("当乌尔塔慢慢滑入你体内时，你呻吟着，填满你的小穴，直到它被撑到极限，以容纳你爱人巨大的马具。她终于插到底了，推入你体内，直到你感觉到她张开的龟头压在你的子宫上。");
         get_player().cuntChange(60,true,true,false);
         outputText("她抓住你的[hips]开始抽插，毫不留情地猛烈撞击你，直到你变成一个呻吟的烂泥，像个妓女一样喘息着，而她像手提钻一样操你。你的子宫颈感觉随时都会折断，但这是一种快乐多于痛苦的感觉；你的小穴紧紧地收缩着夹住乌尔塔的阴茎，榨取这只已经做得很好的狐狸的所有价值，直到她的舌头从嘴里伸出来。[pg]");
         outputText("你咬紧牙关，因为她对你渴望的子宫进行了最后一次残酷的抽插并高潮了，将她滚烫的马精喷射到你体内。她浓稠的精液涌入你体内的突然热量和力量让你直接达到了顶点——你高潮了，紧紧挤压着她正在缩小的阴茎，直到它将最后几滴精液滴入你体内。[pg]");
         outputText("现在被精液填满的你侧过身，带着现在正在睡觉的艾米莉。乌尔塔跟着你爬上床，轻轻抚摸你的脸颊，在你的肩膀和脖子上印下细碎的吻。你甚至不介意她的精液从你体内滴到地板上，与你的淫液和艾米莉的淫液淫荡地混合在一起。精疲力竭的你闭上眼睛，接受了乌尔塔的最后一个吻。[pg]");
         outputText("[say: 嗯，] 她发出满足的呼噜声，用拇指最后抚摸了一下你的脸颊。[say: 我们改天一定要再来一次。][pg]");
         get_player().orgasm("Generic");
         dynStats(DynStat.Sens(-2));
         outputText("你完全同意。");
         doNext(urtaXAmilyAfterMurrrath);
      }
      
      public function urtaXAmilyAfterMurrrath() : void
      {
         clearOutput();
         outputText("你后来醒来，仍然和你浑身是精液的爱人们纠缠在一起，闻起来全是性爱和汗水的味道。这在某种程度上很奇妙。你轻轻叫醒女孩们，并给了每个人一个吻。她们咯咯地笑着呻吟着，仍然对性很敏感，而且还有点宿醉。你们三个人花了剩下的一个小时穿好衣服，互相取笑和玩耍，直到你们最终必须分道扬镳。在你们和艾米莉回到营地之前，你给了卫兵队长最后一个长长的吻。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,782,0);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,13,3 + Utils.rand(4));
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,346) == 0)
         {
            outputText("[pg](<b>乌尔塔在艾米莉的性爱菜单中解锁了！</b>)");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,346,4);
         }
         doNext(get_camp().returnToCampUseFourHours);
      }
      
      public function tooDeepAmilyLeaves() : void
      {
         clearOutput();
         outputText("之后...");
         outputText("[pg]你醒了过来，立刻注意到周围空气中弥漫着死一般的寂静。你挣扎着站起来，环顾四周，很快意识到艾米莉不见了。你在附近区域搜索，甚至穿过你的营地及其周围环境，但什么也没找到。");
         outputText("[pg]那个婊子！她真的抛弃了你，只是因为她受不了粗暴的性爱？！这个想法让你很生气，你用力跺脚，脑子里充满了欲望和愤怒的混合。她可能已经走了，但你大概能猜到她跑到哪里躲起来了。一个狡猾的计划开始在你脑海中形成……也许你应该去那里拜访她。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,43,0);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,168,1);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,36,0);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,44,1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function timeChangeLarge() : Boolean
      {
         var _loc1_:int = 0;
         if(!get_game().urtaQuest.urtaBusy() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,346) == 2 && get_game().time.hours == 6)
         {
            get_game().followerInteractions.amilyUrtaMorningAfter();
            return true;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,43) == 1 && get_game().time.hours == 6 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2178) >= 100 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2180) < 100 && Utils.rand(3) == 0)
         {
            _temp_1.impSkullsCount += 1;
            if(saveContent.pcKnowsAboutSkulls)
            {
               _loc1_ = 2180;
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,_loc1_,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,_loc1_) + 1);
            }
         }
         if(!saveContent.pcKnowsAboutSkulls && saveContent.impSkullsCount > 0 && !get_player().sleeping && Utils.rand(3) != 0)
         {
            caughtAddingSkulls();
            return true;
         }
         return false;
      }
      
      public function timeChange() : Boolean
      {
         var _loc2_:int = 0;
         var _loc3_:* = null as IMap;
         var _loc1_:Boolean = false;
         pregnancy.pregnancyAdvance();
         buttPregnancy.pregnancyAdvance();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,78) > 0)
         {
            _loc2_ = 78;
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,_loc2_,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,_loc2_) - 1);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,436) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,436) < 720)
         {
            _loc3_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc3_,436,FlagDict_Impl_.arrayReadInt(_loc3_,436) + 1);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,43) == 1)
         {
            if(pregnancy.get_isPregnant() && pregnancy.get_incubation() == 0)
            {
               outputText("[pg]");
               amilyPopsOutKidsInCamp();
               pregnancy.knockUpForce();
               outputText("[pg]");
               _loc1_ = true;
            }
            if(buttPregnancy.get_isPregnant() && buttPregnancy.get_incubation() == 0)
            {
               amilyLaysEggsLikeABitch();
               buttPregnancy.knockUpForce();
               _loc1_ = true;
            }
         }
         if(get_game().time.hours == 6)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,43) == 1 && !get_player().isPureEnough(66) && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,173) > 0)
            {
               get_amilyScene().farewellNote();
               _loc1_ = true;
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,599) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,173) > 0 && get_player().isPureEnough(25) && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,43) == 0)
            {
               get_amilyScene().amilyReturns();
               _loc1_ = true;
            }
         }
         else if(get_game().time.hours > 23)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,435) > 0)
            {
               _loc2_ = 435;
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,_loc2_,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,_loc2_) - 1);
            }
         }
         return _loc1_;
      }
      
      public function threesomeAmilUrtaCAWKS() : void
      {
         clearOutput();
         var _loc1_:int = get_player().cockThatFits(60);
         if(_loc1_ < 0)
         {
            _loc1_ = get_player().smallestCockIndex();
         }
         outputText("你握住你的" + get_player().cockDescript(_loc1_) + "，把它展示给女孩们看。她们咯咯地笑着，爬到床边，夸张地摇晃着屁股和胸部，直到她们的头和你的肉棒齐平。乌尔塔和艾米莉急切地抓住你的" + get_player().cockDescript(_loc1_) + "，开始把玩起来，用她们奇妙的、充满兽性的舌头轻轻地刷着、舔着。你的手穿过她们的头发，催促着她们，直到你的肉棒完全被她们温暖的唾液浸透，这是开始做爱的完美润滑剂。[pg]");
         outputText("你轻轻地把艾米莉和乌尔塔从你准备好的肉棒推开，并告诉狐狸女孩躺平。乌尔塔舔了舔嘴唇，带着色欲的笑容，四脚朝天地躺下，双腿叉开环绕在你的腰间。她那巨大的马屌像旗杆一样向上指着，在空中摇晃，已经滴下了足以让任何正常男人嫉妒的先头汁液。你轻松地把她沉甸甸的阴囊拨开，露出了下面的奖品：她湿润、流着淫水的阴户。[pg]");
         outputText("你将你的" + get_player().cockDescript(_loc1_) + "对准狐狸女孩急切的小穴，但没有插进去，而是让你的龟头沿着她的外阴唇上下滑动，用短促的臀部移动挑逗着这个喝醉了的扶她。这只会让她变得更硬，她的先头汁液很快就从她的马屌里流出来，在她的肚子和大腿上汇聚成一滩。当你挑逗乌尔塔的女性特征时，你对艾米莉微微点了点头。娇小的鼠娘毫不犹豫地爬到乌尔塔的腿上，在你的帮助下，在狐狸女孩高耸的肉棒上就位。[pg]");
         outputText("你拍了拍艾米莉的屁股，然后，你们同时接纳了乌尔塔的肉棒和小穴；你将你的" + get_player().cockDescript(_loc1_) + "深深地插入她的体内，直到没柄，而艾米莉则顺着她的肉棒滑下，尽可能多地将她的马肉吞入体内，直到它开始撑大她的肚子。你咧嘴大笑，看着乌尔塔翻着白眼，在你们双重夹击下，她那狐狸般的脸上露出了完全的性狂喜。[pg]");
         outputText("你抓住乌尔塔宽阔的臀部，开始不断地抽插她湿滑的小穴，将自己埋入她松弛的肉洞中，然后拔出，直到你的" + get_player().cockDescript(_loc1_) + "的冠状沟接触到空气。然而，当你几乎完全拔出时，艾米莉却刚好插到底，给了你一个脱节的节奏，让乌尔塔在一分钟内就像发情的母狗一样呻吟起来。一旦她开始在乌尔塔的肉棒上弹跳，艾米莉就停不下来了，她那醉醺醺的欲望驱使她达到了惊人的速度，迫使你几乎一上来就用尽全力去干乌尔塔。乌尔塔的肉棒喷出先头汁液，她的小穴开始紧紧地夹住你的" + get_player().cockDescript(_loc1_) + "，她一定感受到了难以置信的快感，身体抽搐扭动着；她几乎被快感逼疯了，抓住自己沉甸甸的乳房，蹂躏着自己深色的乳头。[pg]");
         outputText("好吧，你不能让这只狐狸这么快就高潮。你从她大张的小穴中拔出，引得乌尔塔发出一声失望的呻吟，直到艾米莉的弹跳提醒她，她感受到了多大的快感。说到鼠娘，你抓住她的腰，放慢了她的动作，刚好让你能瞄准她另一个空着的洞。伴随着邪恶的笑声，你将肉棒用力插入艾米莉的屁股，");
         if(get_player().cockArea(_loc1_) > 60)
         {
            outputText("填满她，直到她再也无法承受你的尺寸");
         }
         else
         {
            outputText("将自己深深地埋入她甜美、奇妙紧致的屁股中");
         }
         outputText("。突如其来的双重插入让她发出一声惊恐的尖叫。你抓住艾米莉的" + amilyTits() + "，开始猛干她的屁股，在她骑在乌尔塔身上达到顶峰时将你的肉棒埋入她的体内，这样她的体内就永远有一根粗大的肉棒。[pg]");
         outputText("乌尔塔快要高潮了，现在在双重肉棒的攻击下，艾米莉也坚持不了多久了。乌尔塔发出一声粗哑的低吼，抓住艾米莉的臀部，用力挺动，直到她的睾丸拍打到你的" + get_player().cockDescript(_loc1_) + "的底部。你感受到了她高潮的力量，艾米莉肉洞里突然升起的温度直接蔓延到你的肉棒上，乌尔塔的狐狸精液开始从艾米莉的小穴里喷涌而出。你效仿她的做法，尽可能深地插入鼠娘的体内，然后射精，将你的精液直接射入她的屁股，直到她紧致、天鹅绒般的肠壁上流淌着你白色的精液。被同时射入体内的两股精液淹没，艾米莉仰起头尖叫起来，紧紧地夹住体内的肉棒");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) > 0)
         {
            outputText("同时她的肉棒也高潮了，喷出一道浓稠的鼠精，溅满了乌尔塔的脸和胸部");
         }
         outputText("。[pg]");
         outputText("现在被精液彻底填满的艾米莉从你和乌尔塔的阴茎上滑落，脸朝下倒在狐娘柔软的乳房之间。乌尔塔浑身沾满了浓稠的白色精液，她只是笑着伸出双臂抱住艾米莉，紧紧地拥抱着她新交的炮友。你微笑着爬上床，躺在她们身边，将两个女孩紧紧拥入怀中。[pg]");
         outputText("[say: 真是太棒了，] 艾米莉精疲力竭地叹了口气。[pg]");
         outputText("[say: 嗯，] 乌尔塔发出满足的呼噜声，调皮地拍了一下她的屁股。[say: 我们改天一定要再来一次。][pg]");
         outputText("你完全同意。");
         get_player().orgasm("Generic");
         dynStats(DynStat.Sens(-2));
         doNext(urtaXAmilyAfterMurrrath);
      }
      
      public function thisIsAReallyShittyBadEnd() : void
      {
         clearOutput();
         amilySprite();
         outputText("你在废弃村庄空荡荡的街道上漫步，想知道艾米莉在哪里。尽管她有很多缺点，但她是个还算不错的炮友。突然传来的脚步声引起了你的注意，你做好了战斗的准备；艾米莉从来不会这么笨拙地暴露自己的行踪。[pg]");
         outputText("除了今天。艾米莉随意地走出来面对你。[say: 啊，[name]，你在这里，] 她说道。[say: 很好。我希望能最后见你一面；我觉得你至少值得一个告别。][pg]");
         outputText("你困惑地重复着她的话。[pg]");
         outputText("艾米莉点点头，然后把手指放在嘴巴两边，吹了一声刺耳的口哨。在你的周围，从墙后和屋顶的洞里，开始探出一张张老鼠般的脸。有几十个！他们的" + (get_noFur() ? "头发" : "皮毛") + "主要是白色、黑色、棕色以及这三种颜色的斑驳，但你也看到了一些和你头发颜色一样的。你震惊地张口结舌了一会儿，然后开始问她，他们是不是真的是……[pg]");
         outputText("[say: 是的，这些都是你和我生下的孩子。]艾米莉点点头。[say: 他们是我的孩子——我的部族——我们现在数量众多，足够强大，可以离开这片土地了……去寻找一个新地方，为我们开辟一个家园。][pg]");
         outputText("在你的注视下，他们开始在母亲身后的一个街道口聚集。他们衣衫褴褛，挥舞着简陋的武器，但看起来却异常坚定，出奇地凶悍。[pg]");
         outputText("[say: 永别了，[name]。你或许不是最高尚的[men]……但你确实在我的任务中帮助了我，我很感激——无论你的理由有多么自私。][pg]");
         outputText("艾米莉向你微微低头，以示尊敬，然后加入了她庞大的子嗣队伍，他们开始有目的地行军离开。你目送他们离去，直到他们从视线中消失，然后冷笑着摇了摇头。搞得好像你需要她或者她的小崽子们一样！你脚跟一转，大步流星地走出了这个垃圾村庄；你不打算再回到这里了。[pg]");
         outputText("艾米莉已经带着她的孩子们离开了这个地区，去别处建立一个新的殖民地。[pg]");
         doNext(get_camp().returnToCampUseOneHour);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,36,1);
      }
      
      public function thisFunctionProbablySucksTooOhYeahAmilyFunction() : void
      {
         clearOutput();
         amilySprite();
         outputText("当你在废弃村庄空荡荡的街道上漫步时，你想知道艾米莉在哪里。抛开她现在对你的意义不谈，你只是很高兴知道在这个扭曲的地方还有其他人可以交谈。[pg]");
         outputText("[say: [name]！亲爱的！你在这里！][pg]");
         outputText("你听到她高兴的吱吱声，但她动作太快，你根本抓不住，她猛地扑向你，紧紧地拥抱着你。[pg]");
         outputText("[say: 我还在想我们是不是应该先去找你，我不想让你错过这个机会。]她对你说，用力地蹭着你的身侧。[pg]");
         outputText("你困惑得甚至忘了回抱她，问她在说什么。[pg]");
         outputText("艾米莉眨了眨眼，看起来有些困惑，然后笑了。[say: 哦，对了，我太心急了。孩子们！快来和你们的父亲打个招呼！]她高兴地喊道。[pg]");
         outputText("在你的眼前，一群身影如潮水般从废墟中涌出，那是各种颜色的老鼠——黑色、白色和棕色最为常见，但你看到有不少老鼠有着和你头发" + (get_noFur() ? "" : "（好吧，皮毛）") + "一样的颜色和眼睛——它们冲过来包围你，高兴地叽叽喳喳叫着。当它们如此热情地挤在你周围时，你努力保持着平衡。你花了好一会儿才反应过来艾米莉说了什么，这也是情有可原的。[pg]");
         outputText("你犹豫地开口，无法直白地问她，但又需要知道他们是不是真的是……[pg]");
         outputText("[saystart]我们的孩子，你和我的");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,162) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,40) > 0)
         {
            outputText("。[sayend]");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,162) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,40) == 0)
         {
            outputText("，是我种在你体内的。[sayend]");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,162) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,40) > 0)
         {
            outputText("，是你种在我体内的。[sayend]");
         }
         outputText("艾米莉高兴地欢呼着。[pg]");
         outputText("你只能震惊地盯着这群小家伙。在你的内心深处，一个孤独的念头冒了出来：如果你的母亲看到这么多孙子孙女会怎么说？但当你意识到艾米莉还说了什么时，这个念头就被抛到了脑后。你问她是不是要离开。[pg]");
         outputText("[say: 是的。他们现在的数量已经足够多了，可以离开这里去别处建立一个新的村庄并生存下来。]她确认道。[say: ……哦，别看起来这么沮丧！]她笑着，看着你消化这个消息时的表情。[say: 我不和他们一起走。][pg]");
         outputText("听到这话，你的震惊和难以置信只增不减。艾米莉走近你，握住你的手，尽力看着你的眼睛。[saystart]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,158) == 1)
         {
            outputText("当我们初次相遇时，对我来说你只是精子，一个能为我需要的孩子们提供父亲身份的纯粹男性。");
         }
         else
         {
            outputText("当我们初次相遇时，我害怕你，我需要你的男性精华，但我对你的另一个性别抱有偏见。");
         }
         outputText("但随着我对你的了解，你对我来说变得更加重要。我爱你，[name]，我不想离开你。你是为了完成某个任务才来到这个世界的，对吧？好吧，你帮我完成了我的任务，所以我帮你完成你的任务也是公平的。孩子们都教导得很好，从现在起他们可以自己闯荡了……但我想和你一起回去，留在你身边，尽我所能帮助你。你愿意让我这么做吗？");
         outputText("[sayend][pg]");
         outputText("随着她的话语深入人心，你摆脱了困惑。你灿烂地笑着，将她拥入怀中，告诉她你希望她和你一起回去。她笑了，以令人惊讶的强烈情感回抱你，甚至连你的许多孩子也高兴地做出了反应。[pg]");
         outputText("你花了一个多小时去了解你的许多儿子和女儿，帮助他们收拾微薄的物资，并祝愿他们出发时一切顺利。然后，你牵着艾米莉的手，回到了你的营地，留下这个空荡荡的村庄，让它被荒野重新占领。[pg]");
         outputText("[b:(艾米莉已被添加到恋人菜单中。)][pg]");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,43,1);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,47,1);
         FlagDict_Impl_.arrayWriteFloat(KFLAGS.flags,48,0.3);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,49,6);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,50,6);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,172,1);
         FlagDict_Impl_.arrayWriteString(KFLAGS.flags,52,"rags");
         if(get_marbleScene().marbleAtCamp())
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,85,1);
         }
         else
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,85,2);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,238) == 1)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,236,1);
         }
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,36,1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function tellAmilyToGetLost() : void
      {
         amilySprite();
         outputText("你嘲笑艾米莉，说你对一个自称纯洁，实则和这个堕落世界里其他东西毫无二致的伪君子没兴趣；除了下一次挨操，她根本没有什么更高的追求。[pg]");
         outputText("艾米莉气得满脸通红。[say: 你这个傲慢、自大、死脑筋的……！]她气疯了！[say: 恶魔会把你抓走的——走着瞧吧！我不需要你——反正你可能也不孕不育，你——]她的声音渐渐变成了一连串你听过的最下流的脏话，然后跑进了废墟中。[pg]");
         outputText("你脚跟一转，大步离开。你觉得她以后会尽量避开你；再回这里也没什么意义了。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,36,1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function talkWithCuntIMeanAmily(param1:Boolean = false) : void
      {
         clearOutput();
         amilySprite();
         var _loc2_:Number = Utils.rand(15);
         if(_loc2_ == 12 && amilyFollower())
         {
            _loc2_++;
         }
         if(get_player().get_gender() == 2 || get_player().get_gender() == 3 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,165) < 2)
         {
            _loc2_ = Utils.rand(12);
         }
         var _loc3_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc3_,38,FlagDict_Impl_.arrayReadInt(_loc3_,38) + (2 + Utils.rand(3)));
         dynStats(DynStat.Cor(-0.34));
         if(_loc2_ == 0)
         {
            outputText("你们俩互相讲述了各自的冒险故事，话题从那里转移到了在这个世界上发现的各种药水和灵药上。[pg]");
            outputText("[say:你知道……我没有练习炼金术所需的设备，但我确实了解一些相关知识。]艾米莉说。[say:如果你能给我带一瓶药水或一种试剂，我或许能想起我父亲教过我的一些东西。][pg]");
            if(get_player().itemSlot(0).quantity == 0)
            {
               outputText("你答应会记住这一点，然后向艾米莉告别。[pg]");
               if(param1)
               {
                  doNext(determineAmilySexEvent());
               }
               else
               {
                  doNext(get_camp().returnToCampUseOneHour);
               }
               return;
            }
            outputText("你记得口袋里有些可能引起兴趣的东西，于是拿给艾米莉看。[pg]");
            if(get_player().itemSlot(0).itype == get_consumables().EQUINUM)
            {
               outputText("[say:我想，那是马之精华的蒸馏物。]艾米莉说。[say:我猜它可能会让你变得更强壮、更坚韧……但马并不聪明，而且对于人类来说，如果不改变他们，这可能太强烈了，]她警告你。[pg]");
            }
            else if(get_player().itemSlot(0).itype == get_consumables().CANINEP)
            {
               outputText("[say:看起来有点像狗的阴茎，不是吗？特别是这个带有大结状突起的，或者这个带有球状鳞茎的。我想它会让你变得更像狗……但我很确定你应该避免这些乌黑的。我不记得为什么了……]她的声音渐渐变小，绞尽脑汁地回想。[pg]");
            }
            else if(get_player().itemSlot(0).itype == get_consumables().LARGEPP)
            {
               outputText("[say:看起来有点像狗的阴茎，不是吗？特别是这个带有大结状突起的，或者这个带有球状鳞茎的。我想它会让你变得更像狗……但我很确定你应该避免这些乌黑的。我不记得为什么了……]她的声音渐渐变小，绞尽脑汁地回想。[pg]");
            }
            else if(get_player().itemSlot(0).itype == get_consumables().DBLPEPP)
            {
               outputText("[say:看起来有点像狗的阴茎，不是吗？特别是这个带有大结状突起的，或者这个带有球状鳞茎的。我想它会让你变得更像狗……但我很确定你应该避免这些乌黑的。我不记得为什么了……]她的声音渐渐变小，绞尽脑汁地回想。[pg]");
            }
            else if(get_player().itemSlot(0).itype == get_consumables().BLACKPP)
            {
               outputText("[say:看起来有点像狗的阴茎，不是吗？特别是这个带有大结状突起的，或者这个带有球状鳞茎的。我想它会让你变得更像狗……但我很确定你应该避免这些乌黑的。我不记得为什么了……]她的声音渐渐变小，绞尽脑汁地回想。[pg]");
            }
            else if(get_player().itemSlot(0).itype == get_consumables().KNOTTYP)
            {
               outputText("[say:看起来有点像狗的阴茎，不是吗？特别是这个带有大结状突起的，或者这个带有球状鳞茎的。我想它会让你变得更像狗……但我很确定你应该避免这些乌黑的。我不记得为什么了……]她的声音渐渐变小，绞尽脑汁地回想。[pg]");
            }
            else if(get_player().itemSlot(0).itype == get_consumables().BULBYPP)
            {
               outputText("[say:看起来有点像狗的阴茎，不是吗？特别是这个带有大结状突起的，或者这个带有球状鳞茎的。我想它会让你变得更像狗……但我很确定你应该避免这些乌黑的。我不记得为什么了……]她的声音渐渐变小，绞尽脑汁地回想。[pg]");
            }
            else if(get_player().itemSlot(0).itype == get_consumables().INCUBID || get_player().itemSlot(0).itype == get_consumables().SUCMILK)
            {
               outputText("她嘶嘶地倒吸了一口凉气。[say:那是恶魔体液，它就是——就像喝下液态的腐化！如果可以的话，避开那东西；它会把你变成恶魔，并极大地增强你的性欲。我听说如果你喝了太多相反性别的体液，它甚至会扰乱你的性别。][pg]");
            }
            else if(get_player().itemSlot(0).itype == get_consumables().SDELITE)
            {
               outputText("[say: 毫无疑问，这东西充满了腐化。魅魔会把它给还没变成恶魔的雄性；能让他们更好地产生精液，并促使他们向恶魔转化。][pg]");
            }
            else if(get_player().itemSlot(0).itype == get_consumables().SLIMYCL)
            {
               outputText("[say: 我……完全不知道那是什么，]她一脸困惑地说。[say: 我猜它是……黏糊糊的？黏液浓缩物？我觉得这跟污染湖泊的东西有关，所以我建议你别把它涂在皮肤上。][pg]");
            }
            else if(get_player().itemSlot(0).itype == get_consumables().BEEHONY)
            {
               outputText("[say: 巨蜂的蜂蜜？]她精神一振，急切地问道。[say: 噢，那东西可好吃了！不过我听说里面充满了巨蜂分泌的特殊精华，所以可能会有改变形态的效果。][pg]");
            }
            else if(get_player().itemSlot(0).itype == get_consumables().PURHONY)
            {
               outputText("[say: 你居然弄到了超纯的巨蜂蜂蜜？]她问道，听起来印象深刻。[say: 我听说那东西纯度极高，甚至能帮食用者清除恶魔的腐化——不过除此之外，应该和普通的蜂蜜没什么区别。][pg]");
            }
            else if(get_player().itemSlot(0).itype == get_consumables().W_FRUIT)
            {
               outputText("[say: 那是胡须果，]艾米莉说，[say: 它可能会让你长出猫耳，甚至猫尾巴！会让你看起来很可爱！][pg]");
            }
            else if(get_player().itemSlot(0).itype == get_consumables().PIGTRUF || get_player().itemSlot(0).itype == get_consumables().BOARTRU)
            {
               outputText("[say: 那是猪尾松露，]艾米莉说，[say: 它可能会让你长出猪耳，甚至猪尾巴！会让你变得圆润可爱！][pg]");
            }
            else if(get_player().itemSlot(0).itype == get_useables().GREENGL)
            {
               outputText("[say: 绿色凝胶里的一团黏液？嗯……]她若有所思。[say: 我记得我爸爸曾经告诉过我，你可以用绿色软泥怪的特殊提取物制作出非常坚固的盔甲。我不敢肯定，而且就算我记得怎么做，我也没有设备。][pg]");
            }
            else if(get_player().itemSlot(0).itype == get_useables().B_CHITN)
            {
               outputText("[say: 如果你有足够多的这东西，你就能用它做一套盔甲。不过需要特殊的炼金试剂，否则它就会变得很脆，一碰就碎。][pg]");
            }
            else if(get_player().itemSlot(0).itype == get_useables().T_SSILK)
            {
               outputText("[say: 一些蜘蛛丝？我记得好像有人能把这些做成盔甲，甚至是舒适的长袍。][pg]");
            }
            else if(get_player().itemSlot(0).itype == get_useables().D_SCALE)
            {
               outputText("[saystart]龙鳞？我以前都不知道龙真的存在");
               if(get_camp().followerKiha() || get_camp().followerEmber())
               {
                  outputText("，直到");
               }
               if(get_camp().followerKiha())
               {
                  outputText("奇哈");
               }
               if(get_camp().followerKiha() && get_camp().followerEmber())
               {
                  outputText("和");
               }
               if(get_camp().followerEmber())
               {
                  outputText("烬");
               }
               if(get_camp().followerKiha() || get_camp().followerEmber())
               {
                  outputText("来到你的营地");
               }
               outputText("。也许你能用它做点什么……[sayend][pg]");
            }
            else if(get_player().itemSlot(0).itype == get_useables().IMPSKLL)
            {
               outputText("[say: 以前有小恶魔游荡进废墟时，我就会从背后处决它们，]她平淡地说。[say: 我很少在它们身上找到什么有用的东西，但自从我开始把它们的头留在外围后，它们就不怎么出现了。][pg]");
            }
            else
            {
               outputText("她看了看它，耸了耸肩，对它并不怎么熟悉。[pg]");
            }
            outputText("感谢了她的帮助后，你把物品放回了口袋");
            if(param1)
            {
               outputText("。[pg]");
            }
            else
            {
               outputText("，然后向鼠娘告辞。[pg]");
            }
         }
         else if(_loc2_ == 1)
         {
            outputText("你们俩交换了各自冒险的故事，话题随之转移到了你在山里看到的那些奇怪的牛头人身上。[pg]");
            outputText("[say:你能全身而退真是太幸运了。]艾米莉强调地对你说。[say:牛头怪是危险的野兽——它们是周围最大、最强壮、最坚韧的野兽之一。我不敢靠近那座山，因为那里有那些野兽在游荡。有时它们会带着巨大的斧头，但通常它们只用巨大的、骨节分明的拳头就足够了。][pg]");
            outputText("你问她为什么牛头怪这么危险；它们看起来并不像恶魔。[pg]");
            outputText("[say:它们现在和恶魔没什么两样了。哦，它们可能看起来没有被腐化，但它们在乎的只是找到可以交配的东西——男人、女人、双性人、无性人，它们都不在乎。只要有洞，它们就会操……我想我可能在什么地方听说过，它们现在只能通过强奸其他有阴道的生物来繁殖，但我不记得在哪里听说的了。]她看起来有些不安，但你无法确定原因。[pg]");
            outputText("你接着问她关于如何对付它们有什么建议。[pg]");
            outputText("艾米莉笑了。[say:没有；我只要看到它们就会跑。我本来就不擅长正面战斗，更何况是对付那些野兽？而且不仅仅是它们的力量……我想它们的精液里含有某种让人上瘾的化学物质。仅仅是它们存在的臭味就能让你感到兴奋。有一次，一只牛头怪把我逼到了角落；它掏出巨大的马屌开始自慰。]她厌恶地打了个寒颤。[say:我差点被喷到，但那气味……太让人陶醉了，]她承认道，显然很尴尬。[say:我的腿几乎因为兴奋而发软——直接屈服让它操我的诱惑太大了。][pg]");
            outputText("你问她做了什么。[pg]");
            outputText("[say:我击退了它然后跑了，]她坚持说，看起来有点被冒犯了，");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,42) == 0)
            {
               outputText("[say:毕竟我还是个处女。][pg]");
            }
            else
            {
               outputText("[say:以防你忘了，我们见面时我还是个处女。][pg]");
            }
            outputText("[say:那个大块头蠢到跟着我；一旦我到了树林里，它就没那么容易活动了，我在它的两只眼睛里各射了一支毒镖。当它停止挣扎时，我走上前割断了它的喉咙。][pg]");
            outputText("她看起来对自己的所作所为相当自豪。你对她的冷酷感到有些不安，感谢她的警告");
            if(param1)
            {
               outputText("。[pg]");
            }
            else
            {
               outputText("，然后找借口离开了。[pg]");
            }
         }
         else if(_loc2_ == 2)
         {
            outputText("你们俩交换了各自冒险的故事，话题随之转移到了你在沙漠中看到的神秘女性魔法使用者身上。[pg]");
            outputText("[say:沙漠女巫，是吗？有趣的是，这片区域剩下的唯一不是恶魔的亚人类似乎都是魔法使用者……尽管正是他们对魔法的使用把第一批恶魔变成了恶魔，]艾米莉指出。[say:至少我是这么听说的，]她补充道。[pg]");
            outputText("你问她是否知道沙漠女巫在沙漠里想做什么。[pg]");
            outputText("[say:毫无头绪。我想……我想她们可能是某种德鲁伊教派之类的。让沙漠恢复生机，试图把它变成草原之类的，]艾米莉猜测道。[pg]");
            outputText("你问她为什么得出这个结论。[pg]");
            outputText("[say: 你见过她们长袍底下的样子吗？她们全都是女人，都有两对乳房，而且那些乳房总是胀满了奶水。我猜她们就像那些恋物教徒一样疯了；她们不是真正的恶魔，但性观念依然扭曲。也许她们用奶水来滋养幼苗什么的，]鼠女耸了耸肩。[pg]");
            outputText("你问她到底是怎么知道所有沙漠女巫都有四个充满奶水的乳房的。她脸涨得通红，局促不安，显然很尴尬。最后，她开口了。[pg]");
            outputText("[say: 我……有次在沙漠里迷路了。一个沙漠女巫走近我，问我愿不愿意让她对我施个法术。我拒绝后，她就攻击我，试图把我打倒，好强行对我施法。][pg]");
            outputText("你打断她，问那个法术会起什么作用。[pg]");
            outputText("[say: 我怎么会知道？把我变成某种产奶的奴隶？]艾米莉激烈地反驳，尾巴焦躁地甩动着。[say: 我没给她机会用。三发安眠药剂飞镖直接射她脸上，比她眨眼还快。我很不爽，所以扒了她的长袍把她的四肢绑起来——我想这能拖延她醒来后的时间，足够我跑得远远的了。她的乳房里全是奶水——满得我都能看到每个乳头在漏奶。]她脸红得厉害，显然很尴尬。[say: 我……我已经好久没吃没喝了，又饿又渴，所以我……][pg]");
            outputText("你向她保证她不需要说得那么明白。她看起来很感激，然后继续说道。[pg]");
            outputText("[say: 所以，我刚喝饱，感觉比这几周来都要饱，然后，你绝对不信，又出现了一个沙漠女巫——从她的话来看，我肯定是意外打断了她们计划好的某种女同幽会。我抓起东西就跑——但还是不够快，没能阻止她施放某种法术，让一个石球飞进了我的……我的……]她又脸红了。[say: 就像有个震动的性玩具塞在里面一样。我不知道我是怎么带着它跑掉的，但当我跑得足够远时，它就化成沙子掉出来了。我觉得她们经不起什么毒打，但她们显然有一些下流的把戏。][pg]");
            outputText("感谢她的建议，你保证以后如果看到她们会更加小心");
            if(param1)
            {
               outputText("。[pg]");
            }
            else
            {
               outputText("并告辞离开。[pg]");
            }
         }
         else if(_loc2_ == 3)
         {
            outputText("你们俩交换了各自的冒险故事，话题也随之转移到了你在森林里见过的那些奇怪的蜂女身上。[pg]");
            outputText("[say: 巨蜂？她们是个奇怪的种族，]艾米莉说道。[say: 她们并没有真正堕落，但同时，她们的行为又有点像恶魔。][pg]");
            outputText("你让她解释一下这是怎么回事。[pg]");
            outputText("[say: 嗯……你可能见过的那些巨蜂？她们的官方名称是繁育阶级，但人们通常只叫她们侍女，]艾米莉解释道。[pg]");
            outputText("看到你困惑的表情，她继续说道。[pg]");
            outputText("[say: 巨蜂从每个卵里孵化出来时，是数百只看起来很普通的蜜蜂。而繁育阶级就参与其中——出于某种原因，这些卵首先需要在活物体内孵化才能破壳而出。][pg]");
            outputText("你的表情可能说明了一切，因为艾米莉微微咯咯笑了起来，然后补充道。[say: 这并不危险，也不是你想的那样！女王和侍女的腹部都有这种像鸡巴一样的附肢；女王用它把卵产在侍女体内，填满她们的腹部，然后侍女再通过人的肛门，把卵和蜂蜜的混合物产在人的肠道里。那些卵有点……嗯，它们就待在那里，然后，当它们准备好孵化时，它们就……出来了。][pg]");
            outputText("她耸了耸肩，显然也无法解释得更清楚了。你问如何才能避免这种命运。[pg]");
            outputText("[say: 嗯，她们主要利用翅膀发出的催眠嗡嗡声；但如果你头脑清醒、意志坚定，就能摆脱它。她们不是那种会使用暴力的类型；如果你抵抗了催眠，她们会请求你接受她们的卵，但不会试图把你打服来产卵。我不建议和她们战斗；她们速度很快，而且多亏了那层盔甲，她们相当难缠，而且她们还有一种讨厌的毒液，会削弱你的力量，同时让你发情。][pg]");
            outputText("你感谢她的建议，然后好奇地问她怎么会这么了解这些生物。[pg]");
            outputText("艾米莉看起来有些慌乱。[say:嗯，他们，他们过去确实愿意交易蜂蜜，只要你和平地面对他们，而且……好吧，我承认，在日子真的很艰难的时候，我曾愿意在体内孵化一些巨蜂卵来换取蜂蜜。][pg]");
            outputText("你微笑着感谢她的分享，并指出她其实没必要告诉你这么私人的事情");
            if(param1)
            {
               outputText("。[pg]");
            }
            else
            {
               outputText("，然后礼貌地告辞了。[pg]");
            }
         }
         else if(_loc2_ == 4)
         {
            outputText("你们俩交换了各自的冒险故事，话题渐渐转移到了你在湖边瞥见的那些穿着奇装异服的人身上。[pg]");
            outputText("艾米莉苦思冥想了一番，然后摇了摇头，面露歉意。[say:对不起，我对他们一无所知。我只能告诉你，他们是刚来这片区域的。看起来他们有一种奇怪的魔法，可以随意改变衣服。我离他们远远的；他们身上有些东西让我想起了恶魔，但他们……不知怎么的，更可怕。][pg]");
            outputText("你告诉她不知道也没关系，然后站起身");
            if(param1)
            {
               outputText("并叹了口气。[pg]");
            }
            else
            {
               outputText("然后离开了。[pg]");
            }
         }
         else if(_loc2_ == 5)
         {
            outputText("你们俩交换了各自的冒险故事，话题渐渐转移到了你在旅途中看到的小恶魔身上。[pg]");
            outputText("[say:小恶魔！]艾米莉啐了一口，看起来很凶狠。[say:恶心的恶魔害虫，他们就是这种东西！到处都是，想强暴他们能抓到的任何东西。他们是弱小的生物，很容易被砍倒，但他们会使用黑魔法试图让你发情，这样他们就能强暴你。我只要看到他们就会杀了他们，但他们总是越来越多。][pg]");
            outputText("她的尾巴愤怒地左右甩动，显然是被激怒了，她紧张地找了个借口");
            if(param1)
            {
               outputText("并恢复了镇定。[pg]");
            }
            else
            {
               outputText("然后离开了。");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,43) == 0)
               {
                  outputText("当你动身返回营地时，");
               }
               else
               {
                  outputText("当你在营地重新坐下时，");
               }
               outputText("你毫不怀疑她是去找小恶魔杀了。[pg]");
            }
         }
         else if(_loc2_ == 6)
         {
            outputText("你们俩交换了各自的冒险故事，话题渐渐转移到了你划船时看到的人形雌性鲨鱼身上。[pg]");
            outputText("[say:鲨鱼女孩？据我所知，她们曾经是一个就住在这湖边的人类村庄……后来湖水被污染了，把她们都变成了……嗯，她们现在的样子。][pg]");
            if(!izmaFollower())
            {
               outputText("她看起来若有所思。[say:奇怪的是……我不认为她们还有任何雄性，但在极少数情况下，我见过这些奇怪的带有老虎斑纹的鲨鱼女孩……她们总是长着巨大的阴茎和睾丸。但是，无论是雌性还是双性人，她们似乎只关心打架和操逼……从我看到她们干那事的方式来看，我不认为她们现在还觉得这两者之间有什么区别。][pg]");
            }
            outputText("你问她有没有什么和它们战斗的建议。[pg]");
            outputText("[say: 恐怕没有。它们不怎么来岸边，更别提离开湖泊太远了。不过，它们可能很耐痛，而且咬人非常狠，]她告诉你。[pg]");
            if(!param1)
            {
               outputText("感谢她抽出时间后，你向她告别。[pg]");
            }
            else
            {
               outputText("随着谈话接近尾声，你感谢她抽出时间。[pg]");
            }
         }
         else if(_loc2_ == 7)
         {
            outputText("你们俩交换了各自的冒险故事，随后话题转移到了你在森林和山里见过的那些奇怪的绿皮肤女人身上。[pg]");
            outputText("[say: 啊，地精。]艾米莉悲伤地摇了摇头说道。[say: 又一个被恶魔腐化的种族。过去她们只想做药剂实验和制造机器。现在她们脑子里只有做爱……奇怪的是，她们似乎非常渴望怀孕。我听说对她们来说，生孩子就像是一场最强烈、最持久的高潮。][pg]");
            outputText("你问她们是否有攻击性。[pg]");
            outputText("[say: 倒也不是特别有……但是，如果你是女性，她们可能会有领地意识，并在毫无警告的情况下发动攻击；如果你长着阴茎，她们就会想和你做爱，哪怕这意味着要把你打到屈服为止。老实说……她们其实挺弱小的。只要你能躲开她们扔出的催情药剂和毒药，她们基本上拿你没办法。][pg]");
            if(!param1)
            {
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,43) == 0)
               {
                  outputText("感谢她抽出时间并给出警告后，你回到了自己的营地。[pg]");
               }
               else
               {
                  outputText("感谢她抽出时间并给出警告后，你坐回了自己的营地。[pg]");
               }
            }
            else
            {
               outputText("随着谈话接近尾声，你感谢她抽出时间。[pg]");
            }
         }
         else if(_loc2_ == 8)
         {
            outputText("你想了一会儿，不知道该问她什么。然后你耸了耸肩，告诉她你想多了解她一点，想更好地认识她。[pg]");
            outputText("艾米莉看起来有些惊讶……但很高兴。[say: 我……你真的有兴趣听我的事吗？那……好吧。你想知道什么？][pg]");
            outputText("你绞尽脑汁想了一会儿，然后让她讲讲在这一切发生之前，她村子里的生活是什么样的。[pg]");
            outputText("[say: 那么，你村子里的生活又是什么样的呢？]她立刻反问道。[say: 如果我要分享这么私人的事情，那你至少也得礼尚往来吧。][pg]");
            outputText("她的语气轻松俏皮，你觉得她可能只是在开玩笑，但你认为这很公平。于是你开始讲述，告诉她关于你村子的事；你描述了那里的人、你的朋友，以及你喜欢去的地方。她坐在那里注视着你，显然没料到你会分享这些信息，但她看起来非常感激，并且听得很专注。最后，当你讲完时，她露出一个温柔却悲伤的微笑，摇了摇头，然后开始说话。[pg]");
            outputText("[say: 村子里的生活吗？那已经是很多年前的事了……然而，我却记得清清楚楚，仿佛就像在昨天。在我的记忆中，恶魔已经出现好几年了——我想我大概是在它们刚出现不久后出生的，我已经太久没有庆祝过我的初息之日了，连我自己都不知道我到底多大了。我们有保护村庄的城墙，也有守卫，但我们从未真正相信过我们必须要去战斗。我们是一个和平、宁静的小村庄；我们没有什么真正值钱的东西，我们以为自己会很安全，以为恶魔会直接无视我们。我们在湖里捕鱼，去游泳、划船来消遣，我们从森林里采集水果、坚果、浆果和蘑菇，我们猎杀鸟类和小动物来吃肉。][pg]");
            outputText("她轻轻叹了口气。[say: 我们真傻……但我们那时那么快乐，能怪我们傻吗？生活并不完美，猎人们经常要去猎杀小恶魔，但它们从未入侵过我们的街道，所以我们以为自己是安全的。我们争吵又和好，我们欢笑、相爱、生活……那真是一段美好的时光。][pg]");
            outputText("你看到一滴小小的泪珠在她的眼眶里打转，然后顺着脸颊滑落。说不清为什么，你伸出手，用手指替她擦去了眼泪。她惊讶地看着你");
            if(!param1)
            {
               outputText("，而你感到有些尴尬，无法解释自己为什么这么做，于是礼貌地告辞了。");
            }
            else
            {
               outputText("，然后给了你一个温暖的微笑。[pg]");
            }
         }
         else if(_loc2_ == 9)
         {
            outputText("你想了一会儿，不知道该问她什么。然后你耸了耸肩，告诉她你想多了解她一点，想更好地认识她。[pg]");
            outputText("艾米莉看起来有些惊讶……但很高兴。[say: 我……你真的有兴趣听我的事吗？那……好吧。你想知道什么？][pg]");
            outputText("你绞尽脑汁想了一会儿，然后请她讲讲她自己，讲讲在这一切发生之前她是谁。[pg]");
            outputText("[say:嗯，你来到这个世界之前是什么样的，嗯？]她立刻回答道。[say:如果我要分享这么私人的事情，那你至少也得礼尚往来。][pg]");
            outputText("她的语调轻快而俏皮，你觉得她可能只是在逗你，但你还是觉得这样很公平。于是你跟她聊了起来，说起你自己的家人，你自己的童年。她听得很认真，听到你记忆里那些有意思的事便跟着你一起笑，听到那些伤心的事便带着沉静的理解点点头。等你终于说完，她露出一抹温柔而感伤的微笑，摇了摇头，然后缓缓开口。[pg]");
            outputText("[say: 我是谁？嗯……说真的，我谁也不是。就是个普普通通的小女孩，丢进人堆里就找不着的那种。我爸爸是个炼金术士；他那些年主要靠净化各种被污染的物件赚钱，可他真正的目标是想弄出一种能净化已经被污染的人的合剂。他觉得纯净的巨蜂蜂蜜里也许有什么值得深挖的东西，但到最后也没搞出什么名堂来。][pg]");
            outputText("你问她是不是和她父亲相处得不好。[pg]");
            outputText("[say:什么？]她问道，显然吃了一惊。[say:不，他爱我，我也爱他，只是他没多少空闲时间。我试着对炼金术产生兴趣，那是接近他的一种方式，可那玩意儿从来就没真正吸引过我。]她笑了笑，带着几分自嘲。[say:我想，我其实更像个黏妈妈的女孩，而不是黏爸爸的那种。][pg]");
            outputText("你让她讲讲她母亲的事。[pg]");
            outputText("[say:她是个猎人——村里最厉害的那种。快得能追上鹿把它扑倒在地，静得能让猎物根本不知道她在那儿，直到刀子抵住喉咙，吹箭的技巧更是惊人，五十步外能把苍蝇钉在树上还不伤它性命。]艾米丽自豪地说道。[say:我崇拜她——我仰慕她，我想成为她那样的人。我老缠着她教我，她也下了苦功夫帮我练出来。大伙儿总说，我将来一定会跟她一模一样。]她微笑着……然后神情黯淡下来。[say:要不是有那些本事，恶魔来的时候，我可能根本活不下来。][pg]");
            outputText("你轻轻地伸出手，握住她的手，试图给她一些安慰，然后问她父母怎么了。[pg]");
            outputText("[say:我……我不知道。]她抽了抽鼻子。[say:我最后见到他们的时候，爸爸正朝一头触手怪扔爆炸药水，妈妈冲我喊着快跑，让我拼了命地跑，躲进荒野里去，她自己则对上了一群小恶魔。从那以后我就再没见过他们。]她的嗓音裂开了，双手掩面，把头埋了进去。[pg]");
            outputText("[say:我会没事的，]她抽泣着。[say:但是……求求你……现在让我一个人待会儿好吗？求求你？][pg]");
            outputText("出于对她隐私的尊重，你将手搭在她肩上，轻轻捏了捏，试图让她明白——只要她需要，你随时都愿意听她倾诉。");
            if(!param1)
            {
               outputText("然后你离开了她，给她机会哀悼她失去的家人。[pg]");
            }
         }
         else if(_loc2_ == 10)
         {
            outputText("你想了一会儿，不知道该问她什么。然后你耸了耸肩，告诉她你想多了解她一点，想更好地认识她。[pg]");
            outputText("艾米莉看起来有些惊讶……但很高兴。[say: 我……你真的有兴趣听我的事吗？那……好吧。你想知道什么？][pg]");
            outputText("你犹豫地问她，是什么导致她的村庄沦陷的。为什么她是唯一的幸存者？[pg]");
            outputText("艾米莉先是震惊，随后转为悲伤。[say: 我就知道你终究会问这个,] 她低声说道。她的目光失去了焦点，那些她显然不愿再回想的记忆如潮水般涌来。[say: 那是每年秋收节的夜晚。我们所有人都聚在镇广场上，庆祝又一年平安度过，也为囤够了过冬的粮食而欢庆。就在那时，它们来了……一大群，翻过城墙，撞破大门。我们没有设哨兵……毫无预警。直到第一声尖叫响起，我们才发现它们已经杀到了跟前。][pg]");
            outputText("你意识到她开始发抖了。[pg]");
            outputText("[say: 它们有那么多……太可怕了。成打成百的小恶魔，魅魔，梦魔，还有我甚至叫不出名字的怪物。扭曲的身影，全都模糊地交织在一起……][pg]");
            outputText("你把手放在她的肩膀上，试图把她拉回现实。她停止了颤抖，平静下来继续说道。[pg]");
            outputText("[say: 我们没有武器——我们以前就没有精良的武装，而且谁会带着长矛和匕首去参加节日庆典呢？那简直是一片混乱——我们像无头苍蝇一样四处逃窜。恶魔们只需要把我们一个个挑出来。有些人试图反抗，但很快就被压倒了——被绝对的力量击溃。我们中有些人一定是被它们身上散发出的腐化气息逼疯了，因为他们直接放弃了抵抗，任由恶魔摆布。我……我看到一个男孩，他顶多比我大一两岁。我只能眼睁睁地看着他张开双臂，满脸幸福地仰望着一个怪物，那怪物长着人类女人的脸，猫耳，六对滴着乳汁的大乳房，还有一根和她身高一样长的马屌。她抓住他，强行把那根巨大的肉棒塞进他嘴里——直捣他的喉咙，而他只是不停地吞咽，当她把他逼到极限时，他看起来还很高兴。][pg]");
            outputText("[say: 你无法想象那是什么样的场景。在黑暗中拍打翅膀的东西，从阴暗中跳出来的扭曲形状，血液、尿液、乳汁和精液的恶臭，尖叫声，笑声，咆哮声，嚎叫声……我不知道火是怎么烧起来的，可能有十几种原因。我只知道，当一切结束，我壮着胆子爬回我曾经的家园废墟时……只剩下我一个人了。][pg]");
            outputText("泪水顺着她的脸颊流下。你想不出还能做什么，只能伸出双臂环抱住她，让她靠在你身上默默地哭泣。终于，你感觉到她停止了流泪，她轻轻地推开了你。[pg]");
            outputText("[say: 谢谢你。已经过去这么久了……但回忆起来，还是会痛。][pg]");
            outputText("你告诉她，你很抱歉提起这么痛苦的回忆");
            if(param1)
            {
               outputText(".");
            }
            else
            {
               outputText("，然后在确定她没事后，你便告辞了。[pg]");
            }
         }
         else if(_loc2_ == 11)
         {
            outputText("你想了一会儿，不知道该问她什么。然后你耸了耸肩，告诉她你想多了解她一点，想更好地认识她。[pg]");
            outputText("艾米莉看起来有些惊讶……但很高兴。[say: 我……你真的有兴趣听我的事吗？那……好吧。你想知道什么？][pg]");
            outputText("你犹豫地问她，她是如何在村庄的毁灭中幸存下来的，以及从那以后她是如何活下来的。[pg]");
            outputText("她看起来并没有像你担心的那样难过，而是有些困惑。[say: 我还没解释过吗？] 她问道。[say: 我跑了。我拼命地往家里跑——我去拿我的猎刀和吹箭筒。然后，我父母命令我跑到荒野里躲起来。我不想走，但我还是服从了。我跑了整整一夜，直到精疲力竭才停下来——即使那样，我也只是爬进树根下的一个树洞里躲起来。我一直睡到饿醒，找了点东西吃，然后我悄悄地溜回了村子。我发现它已经被毁了，从那以后我就一直住在这里。][pg]");
            outputText("[say: 至于每天的生存嘛……]她耸了耸肩。[say: 我按我妈教我的那套来。打猎、采野果。确定村子没人占着之后，我搜刮囤了不少被留下的食物，但那些东西几年前不是吃完了就是变质了。我从我父母家和其他村里的炼金师那儿东拼西凑，捡了点炼金器材——不够做什么复杂的东西，但够我在一个隐蔽的小湾里搭个净水器，把湖水蒸馏成能喝的。我还设了集水陷阱来收集雨水和早上的露水。我虽然算不上真正的炼金师，但哪些植物、动物、菌子有毒我一清二楚，还能削新的吹箭来使这些毒。我还布置了套索陷阱，定期去检查。][pg]");
            outputText("她调皮地对你咧嘴一笑。[say: 还有什么问题吗？][pg]");
            outputText("你摇摇头表示没有了");
            if(!param1)
            {
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,43) == 0)
               {
                  outputText("，礼貌地告辞，然后回到你自己的营地。听起来她在保持稳定的食物和水供应方面做得比你好。但如果是这样的话……她为什么看起来这么瘦？[pg]");
               }
               else
               {
                  outputText("，礼貌地告辞，然后坐回营地。听起来她在保持稳定的食物和水供应方面做得比你好。但如果是这样的话……她为什么看起来这么瘦？[pg]");
               }
            }
            else
            {
               outputText("。\"");
            }
         }
         else if(_loc2_ == 12)
         {
            outputText("你想了一会儿，不知道该问她什么。然后你耸了耸肩，告诉她你想多了解她一点，想更好地认识她。[pg]");
            outputText("艾米莉看起来有些惊讶……但很高兴。[say: 我……你真的有兴趣听我的事吗？那……好吧。你想知道什么？][pg]");
            outputText("你指出她已经告诉过你为什么要你和她生孩子，但她还没说生下孩子后打算做什么。[pg]");
            outputText("[say:你真的在乎他们之后会怎样？]她问道，似乎很难相信这一点。[pg]");
            outputText("你坚持说，是的，你确实想知道。[pg]");
            outputText("[say:好吧……许多被腐化的种族繁殖速度非常快；她们的孕期并不长，后代在几分钟到几小时内就能长到完全体，]她开始解释，[say:我自己的种族生育能力很强；如果不服用某种草药，我们一次怀孕最多能生下两打孩子。我的计划是利用这两点……既然现在我有了像你这样纯洁的人类来做他们的父亲。][pg]");
            outputText("你问她这要怎么做到，毕竟她显然没有被腐化。[pg]");
            outputText("[say:你在探索时可能见过地精？嗯，它们是被腐化的生物，但它们的腐化源于血液中的化学物质。我设法……说服……一个地精给我弄了一些那种特定化学物质的蒸馏样本。一旦我确定自己怀孕了，我就可以服用一小瓶，让我的孕期迅速推进，并让孩子们在一两周内完全成熟，就像地精一样。][pg]");
            outputText("你感到有些恍然大悟，然后问她为什么需要这么快生这么多孩子。你记得她希望她的种族在恶魔的奴役之外重生，但当她觉得人数足够时，她打算做什么？[pg]");
            outputText("[say:嗯，我并没有一个具体想要生下的孩子数量，]她解释道。[say:那个地精只给了我五瓶那种化学物质；我只能怀孕五次。一旦我用完它们，并且孩子们都长得又大又壮，我们就可以离开这个区域，找个别的地方建立一个新的村庄。在一个恶魔找不到我们的地方，我们可以努力扩大我们的人数，让我的族人重获新生，而不再仅仅是性玩具。][pg]");
            outputText("你感谢她的解释。[pg]");
         }
         else if(_loc2_ == 13)
         {
            outputText("你们俩交换了各自冒险的故事，话题随之转移到了你在森林深处见过的那些奇怪的多尾狐妖身上。[pg]");
            outputText("[say:狐妖，]她实事求是地说，轻轻地点了点头。[say:如果曾经有过的话，那是一个很难分类的种族。][pg]");
            outputText("你问她这是什么意思。[pg]");
            outputText("[say:嗯，它们似乎不完全是恶魔，但它们确实与恶魔有一些共同点。尽管如此，它们不知为何似乎对腐化有着惊人的抵抗力。从我听过的故事来看，在恶魔到来之前，它们就已经以现在的形态存在了很长时间，]她解释道。看到你困惑的表情，她继续说道。[say:它们拥有极其强大的魔法，并且从活物身上汲取力量来维持它。它们可以通过很多方式获得力量，但似乎最喜欢的方式是通过性接触。我想，它们与伴侣形成了一种……联系，并吸收少量的生命能量。][pg]");
            outputText("你点点头，指出你能看出这与你遇到的一些恶魔很相似。[pg]");
            outputText("[say:在身体上，它们不是最强壮的，但它们不需要是——一旦它们把你困在它们的幻觉中，你基本上就受它们控制了。尽管如此，它们似乎并不特别邪恶……至少在大多数情况下是这样。][pg]");
            outputText("你给了她一个略带疑问的眼神，然后追问细节。[pg]");
            outputText("[say:嗯……我从未面对面见过一个，但我听其他旅行者讲过遇到被腐化的狐妖的故事。如果这些都是真的，那可真是些讨厌的家伙。大多数狐妖相当无害，虽然有点烦人。有时如果你配合得好，它们实际上可以非常友好。它们似乎喜欢恶作剧，但这或多或少是无害的——最糟糕的情况也就是你在森林里迷路，或者找到某种宝藏，带回家却发现是一盒石头。但被腐化的那些……它们越界了。它们的把戏完全是报复性的……一旦它们折磨完你，它们会毫不犹豫地吸干你的生命。][pg]");
            outputText("你问如果遇到狐妖这么危险，怎么会有人对它们了解这么多。艾米莉挠了挠头，脸红了，显然因为没有一个确切的答案而感到有些尴尬。[say:嗯……这主要只是猜测。就像我说的，我只是在重复我听到的。][pg]");
            outputText("她停顿了片刻，然后说出了另一个有趣的事实，试图挽回面子。[say:不知为何，它们似乎对触手怪有一种奇怪的迷恋。][pg]");
            outputText("从她脸上的红晕，你觉得她可能是经验之谈。不过你没有在这个问题上追问她，");
            outputText("只是礼貌地点头，一边消化着这些信息。");
         }
         else
         {
            outputText("你想了一会儿，不知道该问她什么。然后你耸了耸肩，告诉她你想多了解她一点，想更好地认识她。[pg]");
            outputText("艾米莉看起来有些惊讶……但很高兴。[say: 我……你真的有兴趣听我的事吗？那……好吧。你想知道什么？][pg]");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,43) == 0)
            {
               outputText("你停顿了一下，试图想个委婉的说法，然后问她打算如何照顾她的孩子们。[pg]");
               outputText("她看起来很困惑，不太确定自己是该觉得好笑还是该生气。[say:我确实储备了很多食物——事实上，这就是我看起来比平时瘦的原因；我一直在小心翼翼地攒下并保存尽可能多的食物。还是你觉得我的狩猎和采集技术就那么差？如果真是那样，我也不可能活这么多年，]她声明道。[say:此外，我还有一种从一些地精那里换来的特殊药水……一两周内，我生下的任何孩子都会长得足够大，可以自己狩猎和觅食了。别担心，我能照顾好他们。][pg]");
            }
            else
            {
               outputText("你停顿了一下，试图想个委婉的说法，然后问她觉得你们的孩子们过得怎么样。[pg]");
               outputText("一丝担忧爬上了她的脸庞，与你如出一辙；但她依然坚定。[say:我们的第一批孩子长得太快了，而且他们在外面似乎过得很好，不需要父母的溺爱。最年长的孩子把年幼的孩子照顾得很好，]她回答道。[pg]");
            }
            outputText("感觉稍微安心了一些，但并没有完全放下心来，你准备离开。[pg]");
            outputText("[say:嘿，等一下，]艾米莉对你说。[say:你很担心，对吧？担心我……？担心孩子们？][pg]");
            outputText("你点点头，承认你确实很担心。[pg]");
            outputText("[say:你……你真贴心，]艾米莉说道，显然很震惊。[say:我没想到你真的会在乎……]她的声音渐渐变小，若有所思地看着远方。");
            if(!param1)
            {
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,43) == 0)
               {
                  outputText("然后，仿佛意识到你还在这里，她挥手示意你离开，自己也起身走了。你一边纳闷那是怎么回事，一边回到了营地。[pg]");
               }
               else
               {
                  outputText("然后，仿佛意识到你还在这里，她挥手示意你离开，自己也起身走了。你一边纳闷那是怎么回事，一边在营地坐下。[pg]");
               }
            }
         }
         if(param1)
         {
            doNext(determineAmilySexEvent(true));
         }
         else
         {
            doNext(get_camp().returnToCampUseOneHour);
         }
      }
      
      public function talkWithCORRUPTCUNT(param1:Boolean = false) : void
      {
         clearOutput();
         amilySprite();
         var _loc2_:Number = Utils.rand(13);
         var _loc3_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc3_,38,FlagDict_Impl_.arrayReadInt(_loc3_,38) + (2 + Utils.rand(3)));
         dynStats(DynStat.Cor(0.34));
         if(_loc2_ == 0)
         {
            outputText("你决定和艾米莉谈谈她还在冒险时的经历。话题从那里转移到了在这个世界上发现的各种药水和灵药上。[pg]");
            outputText("[say: " + get_player().mf("主人","女主人") + "，我在炼金术方面有一些经验，所以如果您愿意，我可以和您分享一些我知道的东西，] 她说。[pg]");
            if(get_player().itemSlot(0).quantity == 0)
            {
               outputText("你告诉她，如果你需要她的知识，你会叫她的。[pg]");
               if(param1)
               {
                  doNext(amilySexHappens);
               }
               else
               {
                  doNext(get_camp().returnToCampUseOneHour);
               }
               return;
            }
            outputText("你记得口袋里有些可能引起兴趣的东西，于是拿给艾米莉看。[pg]");
            if(get_player().itemSlot(0).itype == get_consumables().EQUINUM)
            {
               outputText("[say: 我想那是马之精华的蒸馏物，] 艾米莉说。[say: 它可能会让你变得更强壮、更坚韧……也许它还能给你一根马鸡巴。或者给你一个像我一样湿润的小穴，] 她咯咯地笑着。[say: 无论发生什么，您能来我身上测试一下吗？] 她诱惑地问道。[pg]");
            }
            else if(get_player().itemSlot(0).itype == get_consumables().CANINEP)
            {
               outputText("[say: 看起来有点像狗的鸡巴，不是吗？特别是这个带有巨大结状隆起的，或者这个带有球状鳞茎的。我想它会让你变得更像狗……您试过那些乌黑的吗？那些看起来很好吃……] 她舔着嘴唇说。[pg]");
            }
            else if(get_player().itemSlot(0).itype == get_consumables().LARGEPP)
            {
               outputText("[say: 看起来有点像狗的鸡巴，不是吗？特别是这个带有巨大结状隆起的，或者这个带有球状鳞茎的。我想它会让你变得更像狗……您试过那些乌黑的吗？那些看起来很好吃……] 她舔着嘴唇说。[pg]");
            }
            else if(get_player().itemSlot(0).itype == get_consumables().DBLPEPP)
            {
               outputText("[say: 看起来有点像狗的鸡巴，不是吗？特别是这个带有巨大结状隆起的，或者这个带有球状鳞茎的。我想它会让你变得更像狗……您试过那些乌黑的吗？那些看起来很好吃……] 她舔着嘴唇说。[pg]");
            }
            else if(get_player().itemSlot(0).itype == get_consumables().BLACKPP)
            {
               outputText("[say: 看起来有点像狗的鸡巴，不是吗？特别是这个带有巨大结状隆起的，或者这个带有球状鳞茎的。我想它会让你变得更像狗……您试过这个黑色的吗？它看起来很好吃……] 她舔着嘴唇说。[pg]");
            }
            else if(get_player().itemSlot(0).itype == get_consumables().KNOTTYP)
            {
               outputText("[say: 看起来有点像狗的鸡巴，不是吗？特别是这个带有巨大结状隆起的，或者这个带有球状鳞茎的。我想它会让你变得更像狗……您试过那些乌黑的吗？那些看起来很好吃……] 她舔着嘴唇说。[pg]");
            }
            else if(get_player().itemSlot(0).itype == get_consumables().BULBYPP)
            {
               outputText("[say: 看起来有点像狗的鸡巴，不是吗？特别是这个带有巨大结状隆起的，或者这个带有球状鳞茎的。我想它会让你变得更像狗……您试过那些乌黑的吗？那些看起来很好吃……] 她舔着嘴唇说。[pg]");
            }
            else if(get_player().itemSlot(0).itype == get_consumables().INCUBID || get_player().itemSlot(0).itype == get_consumables().SUCMILK)
            {
               outputText("她闻着气味哼哼着。[say: 那是恶魔体液，" + get_player().mf("master","mistress") + "。喝下去就像喝下液态的腐化。它能把你变成恶魔，或者极大地增强你的女性或男性特征。我听说如果你喝了太多异性的体液，甚至会扰乱你的性别。但这些都不重要，无论你是什么性别，我都乐意喝你的体液，[master]，]她咧嘴笑着说。[pg]");
            }
            else if(get_player().itemSlot(0).itype == get_consumables().SDELITE)
            {
               outputText("[say: 毫无疑问，充满了腐化。魅魔会把它给还没变成恶魔的男性；这能让他们更好地产生精液，并推动他们向恶魔转化。你为什么不尝尝呢？]她微笑着问。[pg]");
            }
            else if(get_player().itemSlot(0).itype == get_consumables().SLIMYCL)
            {
               outputText("[say: 请原谅你没用的精盆的无知，[master]，]她低着头说。[say: 我不太清楚这是什么；但它看起来像是某种……黏液的浓缩物？我觉得这和污染湖水的东西有关，不过闻起来确实很香，不是吗？]她微笑着问你。[pg]");
            }
            else if(get_player().itemSlot(0).itype == get_consumables().BEEHONY)
            {
               outputText("[say: 那是巨蜂的蜂蜜，" + get_player().mf("master","mistress") + "！]她急切地告诉你，精神振奋起来。[say: 哦，那东西可好吃了！]然后她把目光转向你，半眯着眼睛看着你，漫不经心地吮吸着带爪子的手指。[say: 但我更喜欢吃你的蜂蜜，[master]，]她诱惑地说着，舔了舔手指，一小缕唾液连着她的嘴。[pg]");
            }
            else if(get_player().itemSlot(0).itype == get_consumables().PURHONY)
            {
               outputText("[say: 你居然弄到了超纯的巨蜂蜂蜜？]她问道，听起来印象深刻。[say: 我听说那东西纯度极高，甚至能帮助食用者清除恶魔的腐化——但你为什么要这么做呢？]她嘲弄地问。[pg]");
            }
            if(get_player().itemSlot(0).itype == get_consumables().W_FRUIT)
            {
               outputText("[say: 那是胡须果，]艾米莉说，[say: 它可能会让你长出猫耳甚至尾巴！这会让你看起来很可爱，[master]，]她咯咯地笑着。[pg]");
            }
            if(get_player().itemSlot(0).itype == get_consumables().PIGTRUF || get_player().itemSlot(0).itype == get_consumables().BOARTRU)
            {
               outputText("[say: 那是猪尾松露，]艾米莉说，[say: 它可能会让你长出猪耳甚至尾巴！这会让你变得丰满可爱，[master]，]她咯咯地笑着。[pg]");
            }
            else if(get_player().itemSlot(0).itype == get_useables().GREENGL)
            {
               outputText("[say: 绿色凝胶里的一团黏液？嗯……]她看起来若有所思。[say: 我记得我爸爸曾经告诉过我，你可以用绿色软泥怪的特殊蒸馏物做出一套非常坚固的盔甲。荡妇记不太清了，但她觉得你光着身子更好看，[master]，]她诱惑地说。[pg]");
            }
            else if(get_player().itemSlot(0).itype == get_useables().B_CHITN)
            {
               outputText("[say: 如果你有足够多的这东西，你可以用它做一套盔甲。不过它需要特殊的炼金试剂，否则它就会变得很脆，一碰就碎。但何必呢？那会遮住你完美的身体，[master]，]她诱惑地说。[pg]");
            }
            else if(get_player().itemSlot(0).itype == get_useables().T_SSILK)
            {
               outputText("[say: 一些蜘蛛丝？我记得有人能把这些做成盔甲。但何必呢？那会遮住你完美的身体，[master]。除非你想挑逗我，]她诱惑地说。[pg]");
            }
            else if(get_player().itemSlot(0).itype == get_useables().D_SCALE)
            {
               outputText("[say: 龙鳞？我从不知道龙真的存在。它们可以做成盔甲。但何必呢？那会遮住你完美的身体，[master]。除非你想挑逗我，]她诱惑地说。[pg]");
            }
            else if(get_player().itemSlot(0).itype == get_useables().IMPSKLL)
            {
               outputText("[say: 小恶魔的头骨？你为什么要杀小恶魔，[master]？]艾米莉皱着眉头问，[say: 除非你想让小恶魔远离你的营地。][pg]");
            }
            else
            {
               outputText("她看了看它，耸了耸肩，对它并不怎么熟悉。[pg]");
            }
            outputText("你满意地挥手让她离开。她撅起嘴，对你这次决定不操她感到失望；但还是服从了。[pg]");
         }
         else if(_loc2_ == 1)
         {
            outputText("你决定和艾米莉谈谈她还在冒险时的经历。话题从那里转移到了你在山里看到的那些奇怪的牛头人身上。[pg]");
            outputText("[say: 你能毫发无损地逃脱，我一点也不惊讶，[master]，]艾米莉奉承地说。[say: 牛头怪是危险的野兽——它们是周围最大、最强壮、最坚韧的野兽之一。我不敢靠近那座山，因为有那些东西在游荡。有时它们会带着巨大的斧头，但大多数只用拳头，]她解释道。[pg]");
            outputText("你问她为什么牛头怪这么危险；它们看起来并不像恶魔。[pg]");
            outputText("[say: 哦，它们可能看起来没有被腐化，但它们在乎的只是找个能发情的东西——男人、女人、两者都是、两者都不是，它们不在乎。只要有个洞，它们就会操……我想我可能在什么地方听说过，它们现在只能通过强奸其他有阴道的生物来繁殖，但我不记得在哪听说的了，]她敲着下巴思考着说。[pg]");
            outputText("你接着问她关于如何对付它们有什么建议。[pg]");
            outputText("艾米莉笑了起来。[say: 噢，[master]。我相信像你这样的人肯定能轻松解决它们；至于我，我一看到它们就跑。我本来就不擅长正面战斗，更何况是面对那些野兽？我肯定会完蛋的！]她说道；然后她又补充道，[say: 我觉得它们的精液里含有某种让人上瘾的化学物质。光是它们身上的气味就能让你发情。有一次，其中一只把我逼到了角落；然后它掏出那根巨大的马屌开始自慰。]她的一只手不自觉地摸向了自己的小穴，这段记忆显然让她兴奋了起来。[say: 我差一点就被射中了，但是那气味……太让人陶醉了，]她承认道，微微喘着气。[say: 我的腿几乎因为发情而发软——那种想要屈服、让它操我的诱惑太强烈了。][pg]");
            outputText("你问她做了什么。[pg]");
            outputText("[say: 我把它打退然后跑了，]她说道，喘息着，自慰得更用力了。[say: 噢，[master]！回想起这些让我好饥渴啊。]她恳求地看着你。[say: 你能操我吗？求你了？操你这个淫荡的鼠娘精盆好不好？求求你了？]她乞求着，手上的动作依然没有停下。[pg]");
            outputText("你笑着告诉她你会考虑的，然后留下她自己解决。她只是撅了撅嘴，继续自慰。[pg]");
            dynStats(DynStat.Lust(5 + get_player().lib / 20));
         }
         else if(_loc2_ == 2)
         {
            outputText("你决定和艾米莉聊聊她还在冒险时的经历。话题不知不觉转到了你在沙漠中见过的那些神秘的女性魔法使用者身上。[pg]");
            outputText("[say: 沙漠女巫？她们是类人的魔法使用者，但她们不是真正的人类，据我所知她们也不是恶魔……原谅我，[master]，你这个没用的性玩具也不太确定，]她低下头说道。[say: 我觉得她们可能是某种德鲁伊教派。试图恢复沙漠的生机，想把它变成草原之类的，]艾米莉补充道。[pg]");
            outputText("你问她为什么会这么想。[pg]");
            outputText("[say: 在那些长袍下面，她们都是女人，她们都有两对乳房，而且那些乳房总是胀满了奶水。我相信她们像那些恋物教徒一样疯了；她们不是真正的恶魔，但她们的性观念依然扭曲。也许她们用奶水来试图滋养幼苗？]她猜测道。[say: 把那么多奶水洒在沙漠里真是太浪费了……如果我有像她们那样巨大的奶子，我只会把它们献给你，[master]，]她对你露出诱惑的微笑。[pg]");
            outputText("你问她是怎么知道这么多关于沙漠女巫的事情的。她笑了笑说道，[say: 我有一次在沙漠里迷路了。一个沙漠女巫走近我，问我是否愿意让她对我施个法术。我拒绝后，她就攻击我，试图把我打倒，好强行对我施法。][pg]");
            outputText("你问她觉得那个法术会起什么作用。[pg]");
            outputText("[say: 我不知道……也许会把我变成某种产奶的奴隶？那可不行……如果我成了她们的奴隶，我就永远无法成为你的奴隶了，[master]，]她回答道，对你咧嘴一笑。[pg]");
            outputText("她微微向前倾身，靠近你的胯部。你微笑着点点头；她深情地蹭着你的胯部，直到你把她推开。你问她是否还知道些什么。[pg]");
            outputText("[say: 我记得那个沙漠女巫施了个法术，让一个石球飞进了我的小穴。]她闭上眼睛笑了笑，回味着那种感觉。[say: 就像里面有个震动棒一样。感觉很舒服……你想让我找点东西塞进小穴，好让你看看当时是什么样子的吗？]她问道。[pg]");
            outputText("你告诉她不用了，当你想在她小穴里塞东西的时候，你会自己塞进去的。[say: " + get_player().mf("主人","女主人") + "，你这么说会让我发情的，]她假装害羞地说道。你笑了笑，挥挥手让她退下。[pg]");
         }
         else if(_loc2_ == 3)
         {
            outputText("你决定和艾米莉聊聊她还在冒险时的经历。话题不知不觉转到了你在森林里见过的那些奇怪的蜂人女性身上。[pg]");
            outputText("[say: 巨蜂？她们是一个奇怪但很淫荡的种族，]艾米莉说道。[say: 她们并没有真正被腐化，但有时她们的行为有点像恶魔。][pg]");
            outputText("你让她解释一下为什么。[pg]");
            outputText("[say: 嗯……你可能见过的那些巨蜂，[master]……她们的官方名称是繁育阶级，但人们通常只叫她们侍女，]艾米莉解释道。[pg]");
            outputText("看到你困惑的表情，她继续说道。[pg]");
            outputText("[say: 巨蜂从每个卵里孵化出来时，是数百只看起来很普通的蜜蜂。繁育阶级参与了这个过程——出于某种原因，这些卵首先需要在活物体内孵化才能破壳而出。][pg]");
            outputText("你的表情大概已经说明了一切，因为艾米莉微微咯咯笑了起来，然后补充道：[say:这并不危险，也不是什么可怕的事情！女王和侍女的腹部都有这种像鸡巴一样的附肢；女王用它把卵产在侍女的体内，填满她们的腹部，然后侍女再通过人的屁股，把卵和蜂蜜的混合物产在人的肠道里。那些卵有点……嗯，它们就待在那里，然后，当它们准备好孵化时，它们就会……自己出来。][pg]");
            outputText("她耸了耸肩，显然也无法解释得更清楚了。你问如何才能避免这种命运。[pg]");
            outputText("[say:嗯，" + get_player().mf("master","mistress") + "，她们主要利用翅膀发出催眠般的嗡嗡声；但像你这样敏锐又聪明的人，应该很容易就能摆脱它。她们不是那种会使用暴力的人；如果你抵抗了她们的催眠，她们会请求你接受她们的卵，但她们不会试图把你打到屈服再产卵。我绝不会和她们战斗；她们动作很快，而且多亏了那身盔甲，她们相当难对付，而且她们还有一种奇怪的毒液，会削弱你的力量，同时让你发情。但我相信你对付她们肯定没问题，[master]。如果你真的和她们打起来，弄点她们的蜂蜜来；如果你在战斗中弄脏了，我很乐意用舌头给你洗个澡，直到你干干净净为止，]艾米莉说着，慢慢地舔了舔嘴唇。[pg]");
            outputText("你很好奇，问她怎么会对这些生物了解得这么多。[pg]");
            outputText("艾米莉咧嘴一笑。[say:嗯，如果你和平地面对她们，她们过去一直愿意交易蜂蜜……所以我让她们用卵填满了我的屁股，]她解释道。[say:如果你想的话，[master]。我很乐意让我的屁股被你想要的任何东西塞满，]艾米莉补充道，微笑着，一些淫液顺着她的大腿流了下来。[pg]");
            outputText("你微笑着告诉她，你晚点会填满她的屁股。[say:谢谢您，[master]，]她微笑着说道。你挥挥手让她退下。[pg]");
         }
         else if(_loc2_ == 4)
         {
            outputText("你决定和艾米莉聊聊她还在冒险时经历的那些事。接着话题转移到了你在湖边瞥见的那些穿着怪异的人身上。[pg]");
            outputText("艾米莉低头看着地板说道：[say:请原谅您无知的榨汁奴隶，[master]。我和他们接触不多，所以没法告诉您太多。看起来他们有一种奇怪的魔法，可以随意换衣服。][pg]");
            outputText("[say:如果您想的话，[master]，我可以为您打扮，我很乐意穿上您给我的任何变态服装。哪怕只是用来绑我的绳子也行。]艾米莉微笑着补充道。[pg]");
            outputText("你告诉她你会考虑的，然后挥挥手让她退下。[pg]");
         }
         else if(_loc2_ == 5)
         {
            outputText("你决定和艾米莉聊聊她还在冒险时的经历。话题随后转移到了你在旅途中见过的小恶魔身上。[pg]");
            outputText("[say:小恶魔，]艾米莉说道。[say:它们又弱又小，很容易就能砍死。它们也到处都是，寻找着任何能得手的猎物进行强暴；它们还会用一些黑魔法让你发情。我以前经常杀它们，但总是杀不完。]艾米莉微微一笑。[say:它们的鸡巴也很大，我不介意有那么大的鸡巴插进我身体里，]她说着，目光慢慢移向你的胯部。[pg]");
            if(get_player().cockArea(0) < 24 && get_player().hasCock())
            {
               outputText("[say:" + get_player().mf("Master","Mistress") + "，你能长出一根更大的鸡巴来操你忠诚的肉便器吗？]");
            }
            else if(get_player().hasCock())
            {
               outputText("[say:" + get_player().mf("Master","Mistress") + "，我好发情，你能用你巨大的鸡巴狠狠插进你淫荡的老鼠奴隶体内吗？]");
            }
            else
            {
               outputText("[say:" + get_player().mf("Master","Mistress") + "，你能长出一根巨大的鸡巴来操你饥渴的精盆吗？]");
            }
            outputText("艾米莉问道，双腿互相摩擦着，淫液从她的小穴中渗出。[pg]");
            outputText("你微笑着说你会考虑的，然后挥挥手让她退下。");
         }
         else if(_loc2_ == 6)
         {
            outputText("你决定和艾米莉谈谈她还在冒险时的经历。话题逐渐转移到了你划船时见过的那些人形雌性鲨鱼身上。[pg]");
            outputText("[say:那是鲨鱼女孩，[master]。我想她们曾经是生活在湖边的一个人类村落……后来湖水被污染了，她们就都变成了现在这样可爱的鲨鱼，]艾米莉微笑着说。[pg]");
            if(!izmaFollower())
            {
               outputText("艾米莉看起来若有所思，试图回忆起什么。[say:我想她们已经没有雄性了，但在极少数情况下，我见过那些奇怪的虎纹鲨鱼女孩。]她的尾巴开始左右摇摆，淫液开始从她身上滴落。[say:她们长着巨大的肉棒和巨大的睾丸，她们唯一关心的就是打架和操逼。我想这两件事对她们来说是一样的，]她微微喘息着说。[pg]");
            }
            outputText("她用充满欲望的眼神看着你。[say: " + get_player().mf("主人","女主人") + "，让我们像他们那样做爱吧；打我屁股，揍我，然后操我。射得我满身都是，让我觉得自己就是个彻头彻尾的精盆，]她乞求着，毫不掩饰地喘息着。[pg]");
            outputText("你微笑着告诉她，当你想操她的时候会叫她的。你挥挥手打发了她，她开始自慰起来。[pg]");
            dynStats(DynStat.Lust(5 + get_player().lib / 20));
         }
         else if(_loc2_ == 7)
         {
            outputText("你决定和艾米莉聊聊她还在冒险时的经历。话题从那里转移到了你在森林和山里见过的奇怪绿皮肤女人身上。[pg]");
            outputText("[say: 啊，地精，]艾米莉赞同地点点头说道。[say: 她们以前只会做药剂实验和制造机器。但现在她们满脑子都是做爱……依我看，这可是个急需的改进。她们积极地寻求怀孕，对她们来说，生孩子就像是一场最盛大、最持久的高潮。][pg]");
            outputText("艾米莉咬着下唇，羞怯地移开视线。你问她怎么了。[pg]");
            outputText("她恳求地看着你，说道：[saystart]我也喜欢被搞大肚子，" + get_player().mf("master","mistress") + "。我可以为你生下许多小老鼠，让它们像你应得的那样崇拜你；然后我们就可以一起做爱了。哦，[master]！]!");
            if(pregnancy.get_isPregnant())
            {
               outputText("我等不及要生下这批小老鼠了，这样我就可以再次怀孕了。");
            }
            else
            {
               outputText("你能把我搞大肚子吗？我不在乎怎么做，只要命令我做爱直到我怀孕就行。");
            }
            outputText("[sayend][pg]");
            outputText("你走近一步，赞许地拍了拍她的头，告诉她是个好女孩。艾米莉趁机亲昵地蹭了蹭你的胯部。然后你挥挥手让她退下。[pg]");
            dynStats(DynStat.Lust(5 + get_player().lib / 20));
         }
         else if(_loc2_ == 8)
         {
            outputText("你决定找点乐子，于是问起艾米莉的过去。她翻了个白眼，仿佛光是提起这个话题就让她觉得无聊，但你狠狠瞪了她一眼，立刻让她安分下来。[say: 呃……如您所愿，[master]，]她顺从地回答道。[pg]");
            outputText("[say: 我实在不知道您为什么对我的过去感兴趣，" + get_player().mf("master","mistress") + "。现在最重要的是，我是您淫荡的宠物老鼠，不是吗？]她问道。你说是的，但多了解一下她以前是什么样的人会很有趣。她笑了笑。[say: 很好，[master]。我会尽我所能取悦您。您有什么特别想知道的吗？][pg]");
            outputText("你绞尽脑汁想了一会儿，然后让她讲讲她村子里的生活是什么样的。[pg]");
            outputText("[say: 那真是……相当无聊的话题，" + get_player().mf("master","mistress") + "。但既然您问了，我就告诉您吧，]她说道；然后停下来想了一会儿。[say: 那是很久以前的事了，但我依然记忆犹新，仿佛就在昨天。在我的记忆中，恶魔们已经出现好几年了……我想我大概是在它们刚出现后不久出生的。事实上，我已经很久没有庆祝过我的初息之日了，连我自己都不知道我到底几岁了。不过这也不重要，我更愿意庆祝我成为您专属精液桶的那一天，[master]。最好还能配上满满一发精液，]她魅惑地笑着说道。接着她继续说，[say: 总之，我们过着那种典型的小村庄生活。我们在湖里捕鱼、游泳、划船，在森林里采集水果、坚果、浆果和蘑菇，我们打猎鸟类和小动物来吃肉。那真的很平静……但也真的很无聊……太无聊了……村里每个人都很保守，在光天化日之下做爱会被当成某种禁忌。这真的很蠢，]艾米莉翻着白眼说道。[pg]");
            outputText("[say: 傻瓜……我们以前就是傻瓜。我们过着傻瓜一样的生活。那时候唯一能进入村子的只有小恶魔，而我们，就像傻瓜一样，还以为自己很安全。哈哈，光是想起这些我就想笑。难怪我的村子会落得那样的下场……而且我一点也不想念它；一刻也不想。作为您忠诚的精盆，我在这里太开心了，" + get_player().mf("master","mistress") + "。您把我从无聊的村民生活中拯救出来，让我能作为您的肉便器过上光荣的生活……谢谢您，[master]，]艾米莉满眼爱意地看着你，微笑着说道。[pg]");
            outputText("你走近她，拍了拍她的头，任由她充满爱意地蹭着你的胯部。你告诉她不用担心；以后你会操她更多次的。[say:精液宠物等不及了，[master]，]她回答道。你挥了挥手让她退下。[pg]");
         }
         else if(_loc2_ == 9)
         {
            outputText("你决定找点乐子，问问艾米莉的过去。她翻了个白眼，仿佛光是提起这个话题就让她觉得无聊，但你迅速瞪了她一眼，让她重新认清了自己的位置。[say:嗯……如您所愿，[master]，]她温顺地回答。[pg]");
            outputText("[say:我真的不知道您为什么对我的过去感兴趣，" + get_player().mf("master","mistress") + "。现在重要的是，我是您淫荡的宠物老鼠，不是吗？]她问道。你说是的，但多了解一下她曾经是谁会很有趣。她笑了笑，问道：[say:很好，[master]。我会尽力让您开心的。您有什么特别想知道的吗？][pg]");
            outputText("你绞尽脑汁想了一会儿，然后让她讲讲她自己，讲讲在成为你的性奴之前，她是谁。[pg]");
            outputText("[say:我是谁？嗯，[master]……在您救我之前，我真的什么都不是。只是一个普通的小女孩，人群中一张不起眼的面孔。我父亲是个炼金术士；那些年他靠净化被某种方式污染的物品赚了不少钱，但他的主要目标是试图研制出一种能够真正帮助净化已经被污染的人的药剂。真是个傻瓜；难怪他从来没有成功过，]艾米莉嘲笑道。[pg]");
            outputText("你问她和父亲的关系怎么样。[pg]");
            outputText("[say:起初……我挺在意的。他总是忙于他的炼金实验，所以我试着对学习炼金术产生兴趣；这是为了能更亲近他，但我对那玩意儿从来没多大兴趣，]她漫不经心地说。[say:我想，我和妈妈比和爸爸更亲近。][pg]");
            outputText("你让她讲讲她母亲的事。[pg]");
            outputText("[say:她是个猎人，我想是最出色的猎人之一……她的速度快到能把鹿追到精疲力竭，安静到直到她的刀架在鹿的脖子上，它都不会察觉到她的存在，吹箭的技术更是精湛到能在五十步外把苍蝇钉在树上而不伤其性命，]艾米莉带着一丝骄傲说道。[say:当然，到头来这些都没帮上她什么忙。我是说……她把她知道的一切都教给了我，人们以前常说我长大后会和她一样；然而，我还是被抓住了。谢天谢地，抓住我的是你，" + get_player().mf("master","mistress") + "。我无法想象自己成为别人性感的宠物鼠肉便器。我爱你，[master]！]她突然大喊，扑向你，抱住你的腰，亲昵地蹭着你的胯部。[pg]");
            outputText("你摸了摸她的头，然后把她推开。她重新跪好。[say:抱歉，[master]，]她说道，对刚才的小小失态感到有些羞愧。你问她父母的命运如何。[pg]");
            outputText("[say:谁知道呢？大概是被什么低级恶魔抓去当奴隶了吧，]她耸耸肩说道。[say:我只庆幸自己被一个好[master]抓住了。]她笑了。你也报以微笑，挥手让她退下。[pg]");
         }
         else if(_loc2_ == 10)
         {
            outputText("你决定找点乐子，于是问起艾米莉的过去。她翻了个白眼，仿佛光是提起这个话题就让她觉得无聊，但你狠狠瞪了她一眼，立刻让她安分下来。[say: 呃……如您所愿，[master]，]她顺从地回答道。[pg]");
            outputText("[say: 我实在不知道您为什么对我的过去感兴趣，" + get_player().mf("master","mistress") + "。现在最重要的是，我是您淫荡的宠物老鼠，不是吗？]她问道。你说是的，但多了解一下她以前是什么样的人会很有趣。她笑了笑。[say: 很好，[master]。我会尽我所能取悦您。您有什么特别想知道的吗？][pg]");
            outputText("你绞尽脑汁想了一会儿，然后让她告诉你她的村庄是如何被摧毁的。[pg]");
            outputText("她闭上眼睛，揉了揉下巴，试图回忆起袭击的每一个小细节。[say:那是一个节日的傍晚……大家都在镇广场上庆祝什么愚蠢的丰收。典型的乡下老鼠做派，]艾米莉轻蔑地说。[say:总之；恶魔们设法冲破了大门，翻过了城墙。仔细想想还挺蠢的，[master]。恶魔有翅膀……是哪个天才认为城墙能挡住他们？]艾米莉嘲笑道。[say:您知道更好笑的是什么吗？我们有哨兵，但那些蠢货也在参加节日庆典！]艾米莉大笑起来。你轻笑一声，让她继续说下去。[pg]");
            outputText("[say:我记得看到了很多不同的恶魔……从小恶魔到魅魔和梦魔。我们无力自保。手无寸铁又被打了个措手不及；我们就像受惊的小田鼠一样四处逃窜，]艾米莉继续说道，然后满眼爱意地抬头看着你。[say:我相信你绝对不会犯这么天真的错误，[master]。]你微笑着回望，轻轻拍了拍她的头。[say:恶魔们只需要把我们一个个揪出来。聪明点的人当场就投降了，任由恶魔们摆布；一些比较蠢的还试图反抗。我呢？我逃跑了。但事后想想，这有点蠢……我本可以加入那场充满肉棒、小穴和精液的美妙群交的，]艾米莉如梦似幻地说着，望向远方；但随后她的目光迅速聚焦在你的眼睛上，咧嘴笑了起来。[pg]");
            outputText("[say:当然……那就意味着我不会被这群人里最棒的那个挑中了。]艾米莉抱住你的腰，满眼爱意地抬头看着你。[say:我真高兴得到我的人是你，" + get_player().mf("master","mistress") + "，]她说着，轻轻蹭了蹭你的胯部。你对她笑了笑，拍了拍她的头。你告诉她，晚点你会考虑重演一次她村庄被入侵的场景，只不过这次她会被抓住。艾米莉眼睛一亮，兴奋地说道，[say:我等不及了，[master]！]你轻笑一声，让她自己去玩了。[pg]");
         }
         else if(_loc2_ == 11)
         {
            outputText("你决定找点乐子，于是问起艾米莉的过去。她翻了个白眼，仿佛光是提起这个话题就让她觉得无聊，但你狠狠瞪了她一眼，立刻让她安分下来。[say: 呃……如您所愿，[master]，]她顺从地回答道。[pg]");
            outputText("[say:我真不知道你为什么对我的过去感兴趣，" + get_player().mf("master","mistress") + "。现在重要的是，我是你淫荡的宠物老鼠，不是吗？]她问道。你说是的，但多了解一下她以前是什么样的人会很有趣。她笑了笑，[say:很好，[master]。我会尽我所能取悦你。你有什么特别想知道的吗？][pg]");
            outputText("你绞尽脑汁想了一会儿，然后让她告诉你她是如何独自一人在村子里活下来的。[pg]");
            outputText("[say: 嗯，" + get_player().mf("master","mistress") + "……我拼命跑回了家。我想拿我的猎刀和吹箭。没用的工具……但那时候我也是个傻瓜，]她解释道。[say: 然后我父母出现了，叫我快跑。我不想跑，但我还是听话了……我当时好害怕……不过不知道为什么？那只是性爱而已……美妙、汗水淋漓、黏糊糊、充满精液的性爱，]她如梦似幻地说着，舔了舔嘴唇，冲你抛了个诱惑的笑容。你告诉她，你晚点会想办法奖励她。[say: 我一直拼命跑，直到跑不动为止；然后我躲了起来，躲了整整一夜。直到早上我才醒来，当时饿极了，所以找了点吃的，然后回到了村子。那时我才看到村子已经变成了一片废墟……我很迷茫，生活也支离破碎……谢天谢地，你最终出现救了我，帮我收拾了残局，[master]，]她充满爱意地说。[pg]");
            outputText("你问她平时的日常生活是怎样的？她的作息是什么？[pg]");
            outputText("[say: 很无聊，]她翻了个白眼说道。[say: 我更喜欢现在的生活；我能和我的" + get_player().mf("master","mistress") + "享受美妙的性爱，还能喝好多精液。这简直是女孩子梦寐以求的，]她微笑着对你说。[say: 总之……我懂足够的知识，知道什么能吃什么不能吃……我还收集了一些炼金材料来制作毒镖，在你给我这具诱人的身体之前，我可是很虚弱的，" + get_player().mf("master","mistress") + "，]她继续说着，为了配合效果还抚摸着自己的乳房。你责备了她，告诉她没有允许不准自己弄自己。艾米莉赶紧道歉；你摸了摸她的头，告诉她没关系，你晚点会惩罚她的。[say: 谢谢你，[master]，]她咧嘴笑着回答。[say: 除此之外，我也就是躲藏、打猎、觅食、吃饭和睡觉；就这些了。][pg]");
            outputText("你暂时感到满意，挥手让她退下，并告诉她等到了惩罚的时间会叫她。艾米莉微笑着告退离开，小穴里滴着淫液");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) > 0)
            {
               outputText("，肉棒也硬了起来");
            }
            outputText("兴奋地说道。[pg]");
         }
         else if(_loc2_ == 12)
         {
            outputText("你决定和艾米莉聊聊她还在冒险时的经历，话题渐渐转到了你在森林深处见过的那些奇怪的多尾狐娘身上。[pg]");
            outputText("[say: 她们很奇怪，]她一边漫不经心地摸着下巴思考，一边说道。[pg]");
            outputText("你问她这是什么意思。[pg]");
            outputText("[say: 嗯，我想她们不完全是恶魔，但确实有一些相似之处。不过，出于某种原因，她们对腐化有很强的抵抗力，]她微微皱眉说道。[say: 不过我相信你肯定能轻松搞定她们的，[master]。我听说，在恶魔出现之前，她们就已经是那个样子了，]她解释道。你花了一点时间思考这个问题，然后示意她继续。[say: 她们的魔法……非常强大。不过我相信像你这么伟大的人，对付起来肯定没问题，]她用极其谄媚的语气说道。[say: 我觉得她们的力量来源于活物。她们有很多种方式获取力量，但我猜她们最喜欢的方式就是做爱，]她流着一点口水说道。[say: 嗯……光是想想就让我好想做爱。][pg]");
            outputText("你轻笑了一声，让这个小鼠妇继续讲她的故事。如果你有心情的话，晚点会来找她操一顿的。她看起来有点失望，但还是乖乖地继续说了。[pg]");
            outputText("[say: 她们不是很强，但也不需要很强——她们会试图把你困在幻觉里，骗你按照她们的意愿行事。不过你太聪明了，不会上当的，[master]。她们其实并不邪恶……只是非常烦人。大多数时候……]她的声音渐渐小了下去。[pg]");
            outputText("你挑了挑眉，稍微责备了她一下，怪她隐瞒细节。她在你的训斥下缩了缩身子，但还是高兴地点点头，继续说道。[pg]");
            outputText("[say: 嗯……我从来没有亲眼见过，但我听其他旅行者讲过遇到腐化狐妖的故事。大多数狐妖整天都在对闯入她们领地的傻瓜搞恶作剧。她们似乎很享受自己那种愚蠢的幽默感，但最糟糕的情况也不过是让你在森林里迷路，或者你找到某种宝藏，结果带回家发现只是一箱石头。我猜这些蠢货根本没有脑子去干别的事。但是那些被腐化的狐妖……她们可知道怎么寻欢作乐！一旦她们折磨完受害者，就会毫不犹豫地吸干他们的生命。][pg]");
            outputText("你问既然遇到她们这么危险，为什么还会有人对她们了解这么多。艾米莉挠了挠头，脸红了，连连道歉。[say: 请原谅你无知的小鼠妇，[master]，我只是在复述我听到的话。][pg]");
            outputText("她停顿了一下，为了取悦你，又说出了另一个有趣的事实。[say: 不知为什么，她们似乎对触手怪有一种奇怪的痴迷。哦，光是想想就让我好饥渴！求你了，[master]，操我好吗？求求你了，哦，求求你了！][pg]");
            outputText("你轻笑了一声，告诉她你会考虑的。当你离开时，她开始自慰，毫无疑问是在幻想被触手怪玩弄。");
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function talkToAmilyWithSexAfter() : void
      {
         talkWithCuntIMeanAmily(true);
      }
      
      public function talkToAmilyCamp() : void
      {
         amilySprite();
         clearOutput();
         outputText("你告诉艾米莉你想和她谈谈。她咧嘴一笑，对这个提议感到高兴，然后坐了下来，并邀请你也坐下。[pg]");
         talkWithCuntIMeanAmily();
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function talkToAmily() : void
      {
         var _g:AmilyScene;
         clearOutput();
         amilySprite();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,158) == 2 && get_player().get_gender() == 2)
         {
            outputText("你告诉艾米莉，你来这里是因为你想和她谈谈。[pg]");
         }
         else
         {
            outputText("你告诉艾米莉，你来这里是因为你想和她谈谈，并且你不想在这次相遇中与她发生性关系。[pg]");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,38) < 15)
         {
            switch(pregnancy.get_event())
            {
               case 1:
               case 2:
               case 3:
               case 4:
               case 5:
                  outputText("[say: 我想，我确实需要找个人说说话，]她平淡地说，但你可以清楚地看到，她很高兴你愿意这么做。[pg]");
                  break;
               case 6:
               case 7:
               case 8:
                  outputText("[say: 哦，现在你想了解我了，]她抱怨道，但她的语气很温柔——甚至有些好笑，而且她显然并不像她的话所暗示的那么不高兴。她重重地、毫不客气地坐了下来。[say: 但是……有些事情一直压在我的心头。我真的很需要找个人倾诉。][pg]");
                  break;
               default:
                  if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,158) == 2 && get_player().get_gender() == 2)
                  {
                     outputText("[say: 聊聊天挺好的，]她说，显然很享受。[say: 我……我几乎没有机会找人聊天。有时候感觉玛瑞斯的每个人都只想不停地繁殖……]她喃喃自语道。[say: 好吧，我们要聊些什么？]她问道，似乎对你的出现感到非常高兴。[pg]");
                  }
                  else
                  {
                     outputText("[say: 你想聊天？不做爱？]她问道，显然很难相信。[say: 我……我已经好几年没有机会和任何人说话了。太久了……]她喃喃自语，你觉得你看到她眼角闪烁着泪光。[say: 好吧，你想聊些什么？]她问道，似乎很高兴你来这里是为了这个。[pg]");
                  }
            }
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,38) < 40)
         {
            outputText("[say: 当然，[name]，我总是很享受我们的谈话。这次我们要讨论什么？]她高兴地问。[pg]");
         }
         else
         {
            outputText("她调皮地对你笑了笑。[say: 我还以为我们已经互相了解了呢。但如果你想的话，我总是很乐意聊天的。][pg]");
         }
         _g = this;
         doNext(function():void
         {
            _g.talkWithCuntIMeanAmily();
         });
      }
      
      public function talkThenSexWithAmily() : void
      {
         var _g2:AmilyScene;
         var _g1:AmilyScene;
         var _g:AmilyScene;
         clearOutput();
         amilySprite();
         outputText("你告诉艾米莉，你来这里是因为你想和她谈谈。不过，如果你们聊完后她想做爱，你很乐意奉陪。[pg]");
         switch(pregnancy.get_event())
         {
            case 1:
            case 2:
            case 3:
            case 4:
            case 5:
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,38) < 15)
               {
                  outputText("她若有所思地摸了摸肚子。[say: 我想，过了这么久，聊聊天也不错。不过，做爱？也许如果你运气好的话。]她已经出发了，鼓励你跟上她。[pg]");
                  _g = this;
                  doNext(function():void
                  {
                     _g.talkWithCuntIMeanAmily();
                  });
               }
               else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,38) < 40)
               {
                  outputText("[say: 和你聊天总是很愉快……而且，为什么不呢？我还没那么大肚子吧，我不觉得？][pg]");
                  outputText("你向她保证，在你看来她依然苗条纤细。[pg]");
                  outputText("[say: 马屁精。来吧，我窝里还有点吃的。][pg]");
                  doNext(talkToAmilyWithSexAfter);
               }
               else
               {
                  outputText("[say: 嗯，也许我可以省去做爱那部分……] 艾米莉摸着下巴沉思道。然后她咧嘴一笑。[say: 我们走一步看一步吧，好吗？][pg]");
                  outputText("你向她保证没问题，然后你们俩找了一块相对舒适的地方坐下，开始聊天。[pg]");
                  doNext(talkToAmilyWithSexAfter);
               }
               break;
            case 6:
            case 7:
            case 8:
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,38) < 15)
               {
                  outputText("她盯着你，然后微微一笑。[say: 聊天？聊天挺好的……这里太安静了；我这么多年都没人说话。但是做爱？就我现在的状况？不，我觉得不行。][pg]");
                  outputText("尽管她拒绝了做爱的提议，但她还是高兴地在一根倒塌的柱子上坐下，并邀请你一起坐。[pg]");
                  _g1 = this;
                  doNext(function():void
                  {
                     _g1.talkWithCuntIMeanAmily();
                  });
                  break;
               }
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,38) < 40)
               {
                  outputText("她惊讶地眨了眨眼。[say: 聊天会很棒……但你真的想和我做爱吗，在我看起来像这样的时候？没有你，这里确实有点孤独，但这难道不是，] 她大声地拍了拍自己的肚子，继续说道，[say: 某种障碍吗？我的意思是，我不知道我们该怎么做。][pg]");
                  outputText("你不得不承认，你确实不知道在她目前的状态下，你们之间该如何做爱。[pg]");
                  outputText("艾米莉笑了笑，在一堆落叶上拉过一把椅子坐下。[say: 没关系；你是好意。即使我们不能做爱，我们仍然可以聊天。你有什么特别想聊的吗？][pg]");
                  _g2 = this;
                  doNext(function():void
                  {
                     _g2.talkWithCuntIMeanAmily();
                  });
                  break;
               }
               outputText("她调皮地对你咧嘴一笑。[say: 这么多年后终于有人可以说话了，真是太棒了。也许如果你是个好听众，我之后会让你和我做爱。][pg]");
               outputText("她摇摇晃晃地走到一个——在遥远的过去——可能是供公众休息的石座前，重重地坐了下来。[say: 那么，你想聊些什么？] 她问道。[pg]");
               doNext(talkToAmilyWithSexAfter);
               break;
            default:
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,38) < 15)
               {
                  outputText("[say: ……好吧，也许你毕竟和这个世界上的其他人不一样，] 她终于回答道。虽然她一言不发地走开了，但她似乎对你的回答相当满意。[pg]");
                  outputText("[say: 嘿，快点！] 她回头喊道。你从沉思中回过神来，跟上了她。[pg]");
                  doNext(talkToAmilyWithSexAfter);
               }
               else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,38) < 40)
               {
                  outputText("她对你笑了笑。[say: 嗯……我觉得有点累，有点孤独，而且……也许有点发情。为什么不呢？][pg]");
                  outputText("她向你勾了勾手指，示意你跟上。[pg]");
                  doNext(talkToAmilyWithSexAfter);
               }
               else
               {
                  outputText("[say: 和一位好朋友聊天，然后进行一场美妙的做爱……嗯，我想这就是在这个疯狂、混乱的世界里，如今能被称作真正浪漫的事情了，] 艾米莉说道。她试图让自己的语气听起来轻松，但你足够了解她，能感觉到她话语中那一丝痛苦和失落。她没有气馁，开始往前走，示意你跟上。[say: 来吧；我可以边走边说，你肯定也能做到吧？][pg]");
                  doNext(talkToAmilyWithSexAfter);
               }
         }
      }
      
      public function takeChargeAmilyScissorMeTimbers() : void
      {
         amilySprite(true);
         clearOutput();
         outputText("你对她咧嘴一笑，将艾米莉拥入怀中，饥渴地吻着她。在短暂的惊讶之后，她热情地回应了你的吻。你感觉到她的尾巴顺着你的腿爬上来，显然是在寻找你的下体。你的手顺着她的背部游走，突然紧紧抓住她紧致的臀部，将她拉向你的身体" + (!amilyFurry() ? "" : "，沐浴在她短毛拂过你皮肤的触感中") + "。艾米莉的手也开始在你的身体上探索，然后她喃喃地说：[say:我们找个舒服的好地方吧，亲爱的……]你们没有停止互相抚摸和亲吻，找到一个隐蔽的好地方，你坐下来，让艾米莉坐在你的腿上。[pg]");
         outputText("你开始轻轻揉捏她挺拔的小乳房，引得鼠娘发出一声呻吟。你亲吻她的脖子，同时你的手向下探向艾米莉的下体，触摸她已经湿润的阴道。你缓慢而挑逗地将两根手指滑入其中，让她舒服地呻吟起来，并在你的腿上扭动着，这样她就可以在不打断你动作的情况下再次亲吻你。很快，你就能感觉到她的颤抖。[pg]");
         outputText("你对她咧嘴一笑，抽出了手指。艾米莉因为你没有让她高潮而对你撅起嘴（实际上相当调皮），但当你挑起眉毛时，她也回以微笑。[say:哦？你也想让我关注一下你的小穴吗？]她站起来片刻，然后把你推倒，这样你现在就躺在她面前了。她跪在你的双腿之间，低下头，直到她的脸悬停在你的" + get_player().vaginaDescript() + "上方一两英寸处。她对你微笑着，开始用她的舌头和鼻子把玩你的下体。你闭上眼睛，在鼠娘取悦你时发出轻微的呻吟。突然，双腿之间艾米莉的感觉消失了。你猛地睁开眼睛，却发现她正看着你的眼睛。[say:这很公平，你不觉得吗？]她在亲吻你之前问道。当你感觉到她的尾巴进入你的[vagina]时，你彻底惊讶了。你感觉自己快要高潮了，但艾米莉似乎想报复你没有让她高潮。[pg]");
         outputText("你无奈地微笑着，再次亲吻她，并改变了姿势，这样你和鼠娘就变成了剪刀式——或者更确切地说，只要她意识到你想干什么，你们俩开始移动，就会变成这样。果然，艾米莉很快又对你咧嘴一笑，试探性地将她的阴道推向你的[vagina]。你“投桃报李”，片刻之后，你们俩的阴道就互相摩擦起来。呻吟声从你们俩的唇间溢出，没过多久，鼠娘和你几乎同时达到了高潮。[pg]");
         outputText("伴随着满足的叹息和灿烂满意的微笑，艾米莉喃喃地说：[say:感觉太棒了……]她再次改变姿势，让她的头再次靠近你的头，用双臂搂住你，并在你身上蹭了蹭。你也拥抱了她，和她一起享受了一段时间的余韵，然后你们俩才回去工作。[pg]");
         get_player().orgasm("Generic");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function takeChargeAmilyMouseMilk() : void
      {
         amilySprite(true);
         clearOutput();
         outputText("你思考了一秒钟你想做什么，双手在艾米莉的身体上轻轻游走。在某个时刻，你捏了捏她的一侧乳房——有点太用力了，因为空气中立刻充满了奶香味。你微笑着坐在窝里，哄着困惑的艾米莉也坐下。当你开始脱下她的衬衫时，困惑变成了理解，她高兴地帮助你，让她的" + amilyTits() + "自由地垂下。风很冷，但你确信性唤起也是她" + amilyNipples() + "坚挺勃起的原因，你调皮地依次捏了捏它们，这引起了你鼠娘情人的脸红和有些愤慨的吱吱声。她的双臂轻轻伸出，蛇一般缠绕在你的脖子上，把你拉得更近，你几乎不需要什么鼓励。[pg]");
         outputText("你饥渴的嘴伸向第一只鼠娘的乳房，用嘴唇诱人地包住它的" + amilyNipples() + "。当你用嘴唇和舌头玩弄它时，艾米莉发出吱吱声和咕咕声，显然很享受这种关注，很快就用第一滴奶水奖励了你。[pg]");
         outputText("味道很独特，与你以前喝过的任何东西都截然不同，但不知何故又非常像艾米莉。它浓郁而呈奶油状，让人联想到爱和母性，带着她体温的温暖，非常有营养。[pg]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,51) < 2)
         {
            outputText("你热切地喝着，用你能想到的所有色情技巧吸吮和哺乳，很快她的乳房就空了。事不宜迟，你转向下一个，并在那里重复了这种体验。当你把它也喝干时，艾米莉失望地轻声呻吟，你在退出之前依次给每个乳头一个挑逗性的最后充满爱意的舔舐。你的鼠娘情人对你微笑。[say:我希望你喜欢你的饮料。]你向她保证你喜欢，然后你帮她穿好衣服，现在已经玩够了。[pg]");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,51) < 4)
         {
            outputText("你热切地喝着，用你能想到的所有色情技巧吸吮和哺乳，奶水浓稠而自由地流淌。你喝啊喝，然后，当她的乳房空了时，你觉得有必要清空另一个。当你完成时，你感到非常欣慰；你感到不舒服的饱胀，你的胃在努力开始消化你的液体食物时发出轻柔的咕噜声。[say:嗯，他们确实说牛奶对你有好处，但尽量不要喝太多，好吗？]艾米莉取笑你。你对她吐舌头——这促使她把你拉进一个吻，当她尽力从你嘴里拧出她自己奶水的味道时，她的舌头与你的舌头纠缠在一起。最终，你推开她……没有太用力……她穿好衣服，尾巴轻快地挥舞着走开了。[pg]");
         }
         else
         {
            outputText("你热切地喝着，用你能想到的所有色情技巧吸吮和哺乳，并得到了艾米莉所能提供的所有奶水的奖励，这几乎超出了你的承受能力。你大口吞咽，拼命吸吮，因为她的液体像瀑布一样涌入你的嘴里，顺着你的喉咙流下，水滴从你紧绷的嘴唇之间渗出，流下你的下巴。事情变得模糊，你的世界退缩到只有艾米莉的乳房，它们包含的奶水，以及你需要喝或窒息。在某个时刻，你隐约意识到你过饱的胃部疼痛，但喝水是你唯一能想到的事情。最后，你清空了她的两个乳房，发现自己软绵绵地倒在背上，大口喘气，你的下巴、嘴唇和胸部沾满了奶水。你花了几分钟才意识到艾米莉在关切地询问你。[pg]");
            outputText("你试图回答说你很好，但出来的只是一个打嗝。你摇摇头，设法恢复了理智——你意识到你很难坐起来。你的胃里装满了奶水，以至于它鼓了出来，几乎像一个怀孕的肚子，它压得你喘不过气来。你意识到艾米莉也盯着你肿胀的腹部，看起来有点害怕……也许还有点自豪。[pg]");
            outputText("[say:所有这些都是从我身上出来的？]她好奇地问。她轻轻地揉着你的肚子，当奶水在你敏感的胃里不舒服地晃动时，你呻吟着。艾米莉坐下，你的头放在她的腿上，让你在那里休息，直到你恢复体力并消化了很大一部分奶水。仍然感到不舒服的饱胀，你起身去散步，以帮助消耗你巨大的液体食物。[pg]");
         }
         var _loc1_:int = (10 + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,47) * 2) * FlagDict_Impl_.arrayReadInt(KFLAGS.flags,51);
         _loc1_ = Utils.boundInt(5,_loc1_,100);
         get_player().refillHunger(_loc1_,false);
         get_player().changeFatigue(-_loc1_ / 2);
         doNext(get_camp().returnToCampUseOneHour);
         dynStats(DynStat.Spe(0.3),DynStat.Lust(10),DynStat.Cor(-0.5));
      }
      
      public function takeChargeAmilyMountHer() : void
      {
         amilySprite(true);
         clearOutput();
         outputText("你微笑着，轻轻地将指尖放在她的鼻子上，然后慢慢地顺着她的身体滑下，滑过她的嘴唇，在她的乳房之间，穿过她的肚子，最后停在她的双腿之间，在那里你开始隔着她的裤子挑逗地抚摸和爱抚她的" + amilyCock() + "，让它把她的衣服顶起一个小帐篷。[pg]");
         outputText("[say:那个？你想要那个？]她问道。[pg]");
         outputText("你坏笑着，觉得不需要口头回答，开始脱衣服，甚至当她领会了你的暗示并脱下自己的衣服时，你跨坐在她身上，对她的" + amilyCock() + "进行了一些小心的抚摸和挑逗，确保她完全勃起，然后你开始将你的[vagina]降到它上面。你只让龟头穿透你的下体，然后拔出，再将自己降下，只深了一英寸。[pg]");
         outputText("艾米莉在你身下呻吟着。[say:求你了……别再挑逗我了。让我插进去！]她恳求道。[pg]");
         outputText("你伸出手抚摸她的脸颊，有点担心你可能严重惹恼了她，但你很乐意顺从，完全将自己刺穿在她的长度上。");
         get_player().cuntChange(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) * FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,46),true,false,true);
         if(get_player().looseness() >= 5)
         {
            outputText("在你被撑开的深处，你几乎感觉不到它，但你决定尽你所能，为了你，也为了她。");
         }
         else
         {
            outputText("当你感觉到它填满你时，你色情地咧嘴笑了。渴望更多，你开始起伏，让它尽可能深地刺穿你。");
         }
         outputText("[pg]");
         outputText("艾米莉因为被你的[vagina]包围的感觉而高兴地喘息着。[say:哦，是的，[name]，求你了！]她叫喊着，显然很高兴。[pg]");
         if(get_player().longestCockLength() >= 18)
         {
            outputText("艾米莉抓住你的" + get_player().cockDescript(get_player().longestCock()) + "，急切地将它塞进她的" + amilyTits() + "之间，将它们挤在一起，并在你的" + get_player().cockDescript(get_player().longestCock()) + "上上下摩擦，用温暖、柔软、天鹅绒般的肉体包围着它。");
            if(get_player().longestCockLength() >= 22)
            {
               outputText("接着她开始舔舐和亲吻龟头，吸吮着它，用舌头把玩着顶端的缝隙，用口舌之欢将它淹没。");
            }
            outputText("[pg]");
         }
         else if(get_player().hasCock())
         {
            outputText("她伸出手抓住[onecock]，抚摸、拉扯、挑逗着它，进一步刺激你，让你加快抽插的速度和力度……她在这方面做得非常成功。[pg]");
         }
         outputText("你急切地在艾米莉体内冲刺，骨盆与骨盆在充满欲望的碰撞中相接，快感传遍全身。艾米莉在你的努力下大声地尖叫和呻吟，这只会促使你更加卖力。然而，很快艾米莉就无法再抵抗了，伴随着一声特别尖锐的叫声，她高潮了，一股老鼠精液涌入你的[vagina]；这是你的信号，很快你也高潮了");
         if(get_player().hasCock())
         {
            outputText("，将你自己的双性精液喷在艾米莉的脸上");
         }
         outputText("，将混合的体液溅在你的[legs]和艾米莉的");
         if(amilyFurry())
         {
            outputText("毛茸茸的");
         }
         outputText("大腿下方。[pg]");
         outputText("你向后倒在艾米莉身上，等待着恢复呼吸和体力，然后称赞艾米莉用她多出来的器官做得有多棒。[pg]");
         outputText("[say: 马屁精。] 她只说了这些，但她笑得很开心，即使在你们清理干净并再次分道扬镳时也是如此。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,166) == 1)
         {
            get_player().knockUp(11,350);
         }
         doNext(get_camp().returnToCampUseOneHour);
         get_player().orgasm("Generic");
         dynStats(DynStat.Sens(-1));
      }
      
      public function takeChargeAmilyGetSucked() : void
      {
         amilySprite();
         var _loc1_:String = amilyFurry() ? "爪子" : "手";
         clearOutput();
         outputText("你站起身[if (!isnaked) {并解开衣服}]，让");
         if(get_player().totalCocks() > 1)
         {
            outputText("每一根");
         }
         outputText("你的[cocks]暴露在空气中。艾米莉开始伸手去拿她的裤子，但你摇了摇头，她停了下来，一脸困惑。当你在她身上跨坐下来时，她的困惑很快就烟消云散了，你给了她坐起来的机会，但确保她能和你的胯部齐平。[pg]");
         outputText("你不能说她看起来很渴望这么做，但她还是勤勉地坐了起来，握住了你的");
         if(get_player().cockTotal() > 1)
         {
            outputText("最大的");
         }
         outputText("[cock]，用她的" + _loc1_ + "抚摸着它，并开始舔舐龟头。你发出鼓励的呻吟声，她把它含进嘴里，开始只吸吮龟头，她的舌头继续抚摸和舔舐着龟头和部分肉棒。看到你显然很享受她的服侍，她变得更加大胆，开始含入越来越多" + (amilyFurry() ? "——这种体验很难描述，因为被口交和被一个长着口鼻的人口交之间有很大的区别" : "") + "。很快，你能感觉到你的[cock]撞到了她的喉咙，你试图后退一点以避免让她窒息。然而，令你惊讶的是，她紧紧地把你拉了回来，你们俩把它变成了一种游戏，你拔出来，她又把你拉回去。一直以来，她都在吸吮、舔舐，并用牙齿小心翼翼地刮擦着你的肉棒——这种刺激令人难以置信。你呻吟着，温暖充满了你的身体，翻腾的快感在你的");
         if(get_player().balls > 0)
         {
            outputText(get_player().ballsDescriptLight());
         }
         else
         {
            outputText("体内");
         }
         outputText("深处生长，你准备好释放了。[pg]");
         outputText("你试图喘息着警告艾米莉你要射了，但从你喉咙里发出的只有空洞的呻吟。即使精液从你的肉棒倾泻到她等待的嘴里，");
         if(get_player().cumQ() < 50)
         {
            outputText("她也毫不犹豫地全部吞了下去");
         }
         else if(get_player().cumQ() < 500)
         {
            outputText("她的脸颊鼓了起来，但她还是设法把它们全吞了下去");
         }
         else
         {
            outputText("她的脸颊高高鼓起，尽管她勇敢地吞咽着（她的肚子因为吞下的量而鼓了起来），但还是有很多从她的唇间喷涌而出，滴落在你的胯部和她的" + amilyTits() + "上");
         }
         outputText("。最后，你射完了，她伴随着一声湿润的“啵”声松开了你的[cock]。[pg]");
         outputText("[say:现在满意了吧？]她问道。你感到双腿发软，只能点点头。[say:很好，]她微笑着说，然后朝小溪的方向走去。[pg]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) > 0)
         {
            outputText("她走到一半时转过身来。[say:我希望你能记住这件事，总有一天要报答我，]她对你喊道。然后她继续走开了。");
         }
         doNext(get_camp().returnToCampUseOneHour);
         get_player().orgasm("Generic");
         dynStats(DynStat.Sens(-1));
      }
      
      public function takeChargeAmilyFuckTooLarge(param1:Boolean) : void
      {
         var type1:Boolean;
         var _g:AmilyScene;
         clearOutput();
         menu();
         outputText("一个调皮的坏笑，加上上下打量她身体的目光，似乎就足以向艾米莉传达你的意图，没过多久，你们俩就转移到了一个更私密的地方。然而，没过多久，她就盯着你的" + get_player().cockDescriptShort(0) + "看，表情中既有情欲，也有沉思。[pg][say: 不管怎么看，都不可能把整个东西都塞进去……...]");
         outputText("[pg]听到这话你很失望，但当鼠娘纠正你的假设时，你立刻又精神了起来。[say: 嘿，我是说不可能把整个东西都塞进去。只用龟头应该没那么难。.]");
         outputText("[pg]考虑到她满怀期待地舔嘴唇的样子，只限制自己用一点点听起来相当困难，但这总比没有好……...");
         addButton(0,"好的",takeChargeAmilyFuckCockhead).hint("她知道自己能承受多少。最好尊重她。");
         _g = this;
         type1 = param1;
         addButton(1,"更深",function():void
         {
            _g.digDeeper(type1);
         }).hint("把你的阴茎插得更深。虽然很紧，但感觉应该很强烈。");
      }
      
      public function takeChargeAmilyFuckCockhead() : void
      {
         amilySprite(true);
         clearOutput();
         outputText("你微笑着，轻轻地将指尖放在她的鼻尖上，然后顺着她的身体慢慢向下滑动，划过她的嘴唇，穿过她的双乳，越过她的腹部，最后停在她的双腿之间，用指尖调皮地在她的私处打着圈。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) > 0)
         {
            outputText("随着她的男性器官产生反应，她的裤子开始鼓起帐篷，你也开始漫不经心地抚摸它以示强调。");
         }
         outputText("[pg]");
         outputText("艾米莉咯咯地笑着，然后开始扭动着脱下裤子，摇晃着她的" + amilyHips() + "，让你有机会抓住她的" + amilyButt() + "。很快，她下半身就一丝不挂了，粉嫩的小阴唇已经向你敞开");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) > 0)
         {
            outputText("并且她的" + amilyCock() + "直挺挺地立着");
         }
         outputText("；显然她对此感到非常兴奋。[pg]");
         outputText("[if (!isnaked) {现在轮到你脱衣服了，她一直注视着你，当你露出你的[cock]时，她急切地舔了舔嘴唇。}]你伸展身体压在她身上亲吻她，她也伸出手用尽全力拥抱你，将你拉入更深的吻中，压在她的" + amilyTits() + "上，她的" + amilyNipples() + "坚挺地抵着你的胸膛。最后，她结束了这个吻，声音嘶哑地对你低语，[say:别逗我了，快放进去！]她低吼道，对于一个鼠女来说，这声音出奇的低沉。[pg]");
         outputText("你对她坏笑，但你几乎不想再戏弄她了；你的肉棒因为渴望她那火热紧致的深处而隐隐作痛。所以你引导你的阴茎来到她的阴唇，用龟头轻轻摩擦她。你可能想慢慢开始，但显然，艾米莉有别的打算，她抓住你的[cockhead]并把它塞了进去。当她感觉到你进入她时，她微微喘息，咧嘴笑着低语：[say:难道什么都要我自己来吗？][pg]");
         outputText("感觉到你的龟头滑入她湿润火热的阴道，你不想浪费时间说话，所以你饥渴地亲吻着鼠娘，开始缓慢地抽插。艾米莉热切地回应你的吻，并配合着你的动作。很快，你们俩都加快了速度，同时让双手在彼此的身体上游走。当你结束亲吻喘息时，她发出一声轻微的呻吟，然后把手放在你的头上，把你拉下来，进行另一个饥渴而充满激情的吻。没过多久，你感觉到自己快要达到忍耐的极限了。幸运的是，艾米莉似乎也快要高潮了，所以你释放了自己，几乎在她体内爆发。这似乎也把她推向了顶峰，伴随着对于这么小的女孩来说相当响亮的呻吟声，艾米莉高潮了");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) > 0)
         {
            outputText("她的" + amilyCock() + "痉挛着，在你们的身体之间喷射出扶她精液");
         }
         outputText("。[pg]");
         outputText("你们相视一笑，眼中满是显而易见的满足感，你们慢慢放松下来，在余韵中依偎了一段时间，然后你们决定很快就会再来一次。");
         amilyPreggoChance();
         get_player().orgasm("Dick");
         dynStats(DynStat.Sens(-1));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function takeChargeAmilyFuck() : void
      {
         amilySprite(true);
         var _loc1_:int = get_player().cockThatFits(61);
         clearOutput();
         outputText("你微笑着，轻轻地将指尖放在她的鼻尖上，然后顺着她的身体慢慢向下滑动，划过她的嘴唇，穿过她的双乳，越过她的腹部，最后停在她的双腿之间，用指尖调皮地在她的私处打着圈。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) > 0)
         {
            outputText("随着她的男性器官产生反应，她的裤子开始鼓起帐篷，你也开始漫不经心地抚摸它以示强调。");
         }
         outputText("[pg]");
         outputText("艾米莉咯咯地笑着，然后开始扭动着脱下裤子，摇晃着她的" + amilyHips() + "，让你有机会抓住她的" + amilyButt() + "。很快，她下半身就一丝不挂了，粉嫩的小阴唇已经向你敞开");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) > 0)
         {
            outputText("并且她的" + amilyCock() + "直挺挺地立着");
         }
         outputText("；显然她对此感到非常兴奋。[pg]");
         outputText("现在轮到你脱衣服了，她一直注视着你，当你露出你的" + get_player().cockDescript(_loc1_) + "时，她急切地舔了舔嘴唇。你伸展身体压在她身上亲吻她，她也伸出手用尽全力拥抱你，将你拉入更深的吻中，压在她的" + amilyTits() + "上，她的" + amilyNipples() + "坚挺地抵着你的胸膛。最后，她结束了这个吻，声音嘶哑地对你低语，[say:别逗我了，快放进去！]她低吼道，对于一个鼠女来说，这声音出奇的低沉。[pg]");
         outputText("你对她坏笑，但你几乎不想再戏弄她了；你的" + get_player().cockDescript(_loc1_) + "因为渴望她那火热紧致的深处而隐隐作痛。所以你引导你的阴茎来到她的阴唇，用龟头轻轻摩擦她。你可能想慢慢开始，但显然，艾米莉有别的打算，她抓住你的" + get_player().cockDescript(_loc1_) + "并把它塞了进去。当她感觉到你进入她时，她微微喘息，咧嘴笑着低语：[say:难道什么都要我自己来吗？][pg]");
         outputText("感觉到你的肉棒滑入她湿热的阴道，你不想浪费时间说话，于是你饥渴地吻住鼠娘，开始缓慢地抽插。艾米莉热切地回应着你的吻，配合着你的动作。很快，你们俩都加快了速度，双手在彼此的身体上游走。当你结束亲吻大口喘气时，她发出一声轻微的呻吟，然后把手放在你的头上，把你拉下来，又是一个饥渴而热烈的吻。没过多久，你感觉到自己快要达到忍耐的极限了。幸运的是，艾米莉似乎也快要高潮了，于是你不再克制，几乎要在她体内爆发。这似乎也把她推向了顶峰，伴随着对于这么小的女孩来说相当响亮的呻吟声，艾米莉高潮了");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) > 0)
         {
            outputText("她的" + amilyCock() + "痉挛着，在你们的身体之间喷射出扶她精液");
         }
         outputText("。[pg]");
         outputText("你们相视一笑，眼中满是显而易见的满足感，你们慢慢放松下来，在余韵中依偎了一段时间，然后你们决定很快就会再来一次。");
         amilyPreggoChance();
         get_player().orgasm("Generic");
         dynStats(DynStat.Sens(-1));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function takeChargeAmilyEatOut() : void
      {
         amilySprite(true);
         clearOutput();
         outputText("你微笑着，轻轻地将指尖放在她的鼻尖上，然后顺着她的身体慢慢向下滑动，划过她的嘴唇，穿过她的双乳，越过她的腹部，最后停在她的双腿之间，用指尖调皮地在她的私处打着圈。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) > 0)
         {
            outputText("随着她的男性器官产生反应，她的裤子开始鼓起帐篷，你也开始漫不经心地抚摸它以示强调。");
         }
         outputText("[pg]");
         outputText("艾米莉咯咯地笑着，然后开始扭动着脱下裤子，摇晃着她的" + amilyHips() + "，让你有机会抓住她的" + amilyButt() + "。很快，她下半身就一丝不挂了，粉嫩的小阴唇已经向你敞开");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) > 0)
         {
            outputText("并且她的" + amilyCock() + "直挺挺地立着");
         }
         outputText("。她显然对此感到非常兴奋。[pg]");
         outputText("她显然期待着你脱光衣服，当你反而倒下并向后扭动时，她感到惊讶，当她意识到你的想法时，她看起来有点不安。你盯着她的阴道");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) > 0)
         {
            outputText("，而她的" + amilyCock() + "竖立在她阴蒂应该在的地方。你");
         }
         else
         {
            outputText("，");
         }
         outputText("你伸出舌头，试探性地舔了舔。艾米莉被这感觉刺激得大声尖叫，这让你胆子更大了，你开始更加热情地舔舐，舌头在她的阴唇周围游走，向上触碰着去逗弄");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) == 0)
         {
            outputText("她的阴蒂。");
         }
         else
         {
            outputText("她的肉棒根部。");
         }
         outputText("[pg]");
         outputText("你能感觉到她的淫液开始顺着内壁流下，又热又咸，你开始将舌头探入她的阴户深处，把玩着她的阴唇，充满爱意地舔舐着她的内部。艾米莉尖叫着，在享受中扭动挣扎，你的舌头爱抚着她最娇嫩的部位，尽可能深地滑入，直到最后，伴随着一声颤抖的尖叫，她高潮了。她的淫液淹没了你的舌头，溅到了你的脸上，弄得你满脸黏糊糊的");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) > 0)
         {
            outputText("，同时她的肉棒也喷发了，精液喷洒在半空中，洒在你们俩身上");
         }
         outputText("。[pg]");
         outputText("她躺在那里，大口喘着粗气，而你则爬起来开始清理自己。[say:这可不是我最喜欢的……]她吱吱叫着。[say:但绝对无法反驳这结果。]你笑了笑，把她留在巢里恢复体力。[pg]");
         doNext(get_camp().returnToCampUseOneHour);
         dynStats(DynStat.Inte(0.25),DynStat.Lust(10));
      }
      
      public function stopHarvestingMilk() : void
      {
         clearOutput();
         amilySprite();
         outputText("你告诉艾米莉停止生产魅魔奶；你简直要被这东西淹没了。");
         outputText("[pg][say: 哦……真是个绝妙的主意。] 艾米莉呻吟着，开始抚摸自己的阴道。你在她完全沉浸在幻想中之前故意咳嗽了一声。[say: 当-当然，[master]。我马上停止。.]");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1096,0);
         doNext(get_game().farm.farmCorruption.rootScene);
      }
      
      public function stopDiggingEvenDeeper() : void
      {
         clearOutput();
         menu();
         outputText("艾米莉绝望的哀求成功地传达到了你被性欲冲昏头脑的大脑中，你突然清楚地感觉到了身体各处的许多感觉，尤其是你的肉棒。压迫着难以置信的阻力……它刚好停在艾米莉脖子的根部。再深一点就会……...");
         outputText("[pg]一想到这里，再加上那种痛苦（却又神圣）的紧致感，你浑身发抖，当你压在鼠娘的身体上，而她试图从地上爬起来挣脱时，你用尽了所有的力气才没有再次猛插。");
         outputText("[pg]这过程慢得令人痛苦，但你终于成功地将她从你的肉棒上拔了下来。伴随着一声湿润的“啵”声，她重获自由，吹过你头顶的冷空气淹没了你的感官，你紧紧抓住你的肉棒，将精液射满了艾米莉的前胸。她无力地倒在地上，根本无法抱怨。");
         outputText("[pg]当你冲到她身边时，她呜咽着哭泣，大口喘着粗气，同时温柔地捂着胸口和肚子。她的喘息声断断续续，过了将近一分钟她才恢复正常的呼吸。然而，就在她恢复呼吸的那一刻……...");
         outputText("[pg]*啪*");
         outputText("[pg]你重重地摔在地上，脸颊传来一阵刺痛。你还没来得及反应，就——-");
         outputText("[pg]*啪*");
         outputText("[pg]艾米莉又是一巴掌把你打倒在地。你总共挨了半打耳光，才终于有机会摇摇晃晃地站起来。等你站稳后，鼠娘正对你怒目而视。");
         outputText("[pg][say:你到底在干什么？！啊？！]她冲着你的脸尖叫，声音一度沙哑，她小心翼翼地捂住喉咙。");
         outputText("[pg]然而，她只花了一会儿就恢复了过来，很快又开始因为被强暴的事对你破口大骂。[say:你！到！底！想干什么？！]她质问道，一边哭泣一边粗暴地用双手抓住你的脸，强迫你看着她的眼睛。");
         outputText("显然，她根本没想起来你刚才好心放了她一马。");
         addButton(1,"道歉",sorryForImpaling).hint("尽你所能地道歉。她要怎么报复你可能都是你应得的。");
         addButton(2,"让她闭嘴！",notSorryForImpaling).hint("你试过对她好点，结果就换来这个？够了！!");
      }
      
      public function stopDigging(param1:Boolean) : void
      {
         clearOutput();
         outputText("凝视着鼠娘惊恐的双眼，你突然恢复了理智，对自己刚才想要粗暴地操她的行为感到一阵强烈的羞愧。你的爱人发出一声呜咽，伴随着湿润的吧唧声，既然你不再强行塞入，她终于成功地将你巨大的肉棒从她的" + (param1 ? "屁股" : "小穴") + "里拔了出来。当你的凸起顺着她的肚子往下移动，直到离开她的身体消失不见时，你最后看了一眼她的肚子，感到有些震撼；刚才插得可真深啊。[pg]");
         outputText("终于从那根插得极深的肉棒上解脱出来，艾米莉花时间大口喘着气，擦去脸上的泪水，轻柔地揉着被严重撑开的胸部。她没花太长时间就恢复了过来，紧接着你眼冒金星，天旋地转，因为她狠狠地扇了你一巴掌。疼痛过了好一会儿才消退，但你不得不承认这是你自找的。[pg]");
         outputText("[say:你到底在想什么？！]这是她的第一个问题，但只要看一眼你那坚硬如铁的肉棒，就足以回答这个问题了。");
         outputText("你花了一些时间道歉才让她接受，但考虑到你及时停手了，你最终还是得到了原谅。[say:别那样吓我，[name]……]这是谈话结束时她唯一的要求。[say:我真以为你疯了……...]");
         outputText("[pg]一阵尴尬的沉默过去了，伴随着羞愧和内疚的交织，但当你准备告辞时，艾米莉顿了一下，叫住了你。[say:说真的，下次别这么粗暴了。你以为我不能让你爽吗……？...?]");
         outputText("[pg]经过一番调侃，你至少确信你和艾米莉的关系还不错，然后你们就言归正传了。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function stickItInMouseTwatForTheFirstTimeNOTWORTHALLBULLSHIT() : void
      {
         clearOutput();
         amilySprite();
         outputText("艾米莉带着你在村庄废墟中穿梭，路线错综复杂。上街、下街、拐弯，甚至直接穿过一些废墟。");
         if(get_player().get_tallness() < 60)
         {
            outputText("幸运的是，由于你的体型比一般人小，跟上她并不像想象中那么困难。");
         }
         else if(get_player().get_tallness() >= 84)
         {
            outputText("你庞大的体型让行动变得出奇地困难，但你还是设法跟上了她。");
         }
         outputText("最后，你被带进了一座特定的废弃房屋，然后进入了一间卧室。眼前的景象并不令人印象深刻；几件破碎的家具，一大堆勉强算干净的破布和破烂的垫子，这就是最接近床的东西了。地板上覆盖着厚厚一层泥土——不仅仅是灰尘，更像是有人故意从外面带进来的泥土。[pg]");
         outputText("艾米莉看到你在打量房间，显得有些局促不安。[say:我必须保持隐蔽，不能让人太容易看出这里有人住。那些泥土其实能帮我预警是否有人发现了这个藏身处。]她漫不经心地用一只手抓住自己的尾巴，开始抚摸尾尖。[say:所以……我们到了？]她犹豫地说。很明显，尽管她坚持这是她必须做的事，但她显然还是个处女，完全不知道接下来该怎么做。你该怎么办？[pg]");
         menu();
         addButton(0,"主动出击",FirstTimeAmilyTakeCharge).hint("你想要做爱，那就直接上吧。反正她也没有抱怨的余地。");
         addButton(1,"等她行动",beSomeKindofNervousDoucheAndWaitForAmily).hint("你对这件事感到非常不安。也许就让她自己来，然后继续前进？");
         addButton(2,"亲吻她",kissAmilyInDaMoufFirstTimeIsSomehowBetterThatWay).hint("好好对她；恶魔末日并不意味着你不能花点心思。");
      }
      
      public function stayAfterAmilyMiddleGradeSecks() : void
      {
         amilySprite();
         clearOutput();
         outputText("你决定再陪她一会儿，于是你起身走到她身边，用亲吻和抚摸再次将她拉入怀中。她并没有真正反抗，所以你们俩躺在那里，互相亲吻和抚摸了一段时间，最后你才道别，回到了你的营地。");
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,38,FlagDict_Impl_.arrayReadInt(_loc1_,38) + 3);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function stalkingZeAmiliez3() : void
      {
         clearOutput();
         if(get_player().get_gender() == 0)
         {
            outputText("你想去废弃的村庄，但如果你没有相应的零件，就不可能和艾米莉玩……你回到了你的营地。");
            doNext(get_camp().returnToCampUseOneHour);
            return;
         }
         amilySprite();
         outputText("你走进废弃的村庄，开始寻找艾米莉。[pg]");
         outputText("你几乎不需要寻找，因为艾米莉自己找到了你。自从你们第一次见面以来，她的身材发生了巨大的变化，她发育出了完美的沙漏型身材；拥有丰满的双乳、圆润的臀部和宽阔的胯部。她只是用饥渴、充满欲望的眼神看着你，喘着粗气，流着一点口水。[pg]");
         outputText("你刚想和她打招呼，但她迅速冲向你，跪在你面前。[pg]");
         outputText("[say: 我需要你！我需要更多！求你让我多喝点！]她乞求着，用鼻子蹭着你的胯部；");
         if(get_player().hasCock())
         {
            outputText("让你的[cock]勃起");
            if(get_player().hasVagina())
            {
               outputText("和");
            }
         }
         if(get_player().hasVagina())
         {
            outputText("弄湿了你的[vagina]");
         }
         outputText("。艾米莉的鼻子微微抽动，她[if (isnaked){抬头看着你|强行扯下你的[armor]，抬头看着你}]，眼神中充满恳求，仿佛在请求许可。[pg]");
         outputText("[say: 你不想要更多的药了吗？]你问道，向她展示装有混合物的瓶子。[pg]");
         outputText("她从你手中夺过瓶子扔掉。[say: 不。我需要的只有你的精液……求你让我多喝点。我、我什么都愿意做，只要让我尝一口。求你了？]她乞求道。[pg]");
         get_player().removeKeyItem("Potent Mixture");
         outputText("对她的主动感到惊讶之余，你意识到了一件事。她一定是对你上瘾了，或者更准确地说……对你的精液上瘾了。你几乎抑制不住大笑的冲动，这太有趣了！这只保守的老鼠已经沦为一个饥渴的瘾君子。这简直太完美了，你之前还在想象如果她变成一个精盆该有多好。[pg]");
         outputText("[say: 你说你什么都愿意做？我要你匍匐在我的脚下求我！]你命令道。[pg]");
         outputText("艾米莉把头贴在地上开始说道。[say: " + get_player().mf("主人","女主人") + "，求您让我多喝点您的精液。求您了！我太需要它了，以至于我忍不住流口水。我太需要它了，喝不到您的精液简直就像折磨一样。求您让我喝吧！][pg]");
         outputText("你对着这只小鼠娘大笑，然后说道：[say: 很好！我允许你喝我的，你这没用的母狗！!]");
         chooseYourAmilyRape();
      }
      
      public function stalkingZeAmiliez2() : void
      {
         clearOutput();
         if(get_player().get_gender() == 0)
         {
            outputText("你想去废弃的村庄，但如果你没有相应的零件，就不可能和艾米莉玩……你回到了你的营地。");
            doNext(get_camp().returnToCampUseOneHour);
         }
         else
         {
            amilySprite();
            outputText("你走进废弃的村庄，开始寻找艾米莉。[pg]");
            outputText("没过多久你就找到了她，你立刻就看出了她在服下第一剂特效药后发生的变化。[pg]");
            outputText("她的臀部变得更大了，乳房似乎也更丰满了；总的来说，她现在看起来更有女人味，也更迷人了。你已经能感觉到你的");
            if(get_player().hasCock())
            {
               outputText("[cock]变硬了");
               if(get_player().hasVagina())
               {
                  outputText("，你的");
               }
            }
            if(get_player().hasVagina())
            {
               outputText("[vagina]也湿润了起来");
            }
            outputText("。[pg]");
            outputText("[say: 嘿，艾米莉！我又给你带了些果汁！]你对她喊道，在半空中摇晃着装满混合液的瓶子。[pg]");
            outputText("她惊讶地尖叫了一声，显然她刚才没注意到你；她开始局促不安地发抖。[pg]");
            outputText("[say: 怎么了？你不想要更多了吗？]你问道。[pg]");
            if(get_player().cor + get_player().corruptionTolerance() < 45)
            {
               outputText("艾米莉摇了摇头，大喊道：[say: 不！我不能！]然后飞奔而去。[pg]");
               outputText("你笑了笑，收起瓶子，然后回到了营地。");
               outputText("[pg]（腐化不足……）...)");
               doNext(get_camp().returnToCampUseOneHour);
               return;
            }
            outputText("你开始脱下你的[armor]，向她展示你");
            if(get_player().hasCock())
            {
               outputText("勃起的[cock]");
               if(get_player().hasVagina())
               {
                  outputText("和");
               }
            }
            if(get_player().hasVagina())
            {
               outputText("滴着淫液的[vagina]");
            }
            outputText("。[say: 过来，我会让你喝更多我的汁液。][pg]");
            outputText("艾米莉摇了摇头说：[say: 不！我……我不能，]但她还是开始向你走来。[pg]");
            outputText("当她靠近时，她跪在你面前，你拔下瓶塞。[say: 张大嘴！]你微笑着说道。[pg]");
            outputText("你把瓶子塞进她嘴里，她贪婪地把里面的东西一饮而尽。瓶子空了之后，你把它扔到一边，看着她大声呻吟，淫液弄湿了她的裤子。[pg]");
            outputText("你笑了起来，但当她伸手去拿刀时，你后退了一步；接着她开始割掉自己破烂的衣服，并连同刀子一起扔掉。[say: 啊……好多了，]她如释重负地说。[pg]");
            outputText("很高兴看到她对你没有恶意，你决定是时候奖励她的坦诚了。[say: 现在再张大嘴巴，艾米莉。该给你奖励了。]你对她说。[pg]");
            outputText("[say: 是的！求你了，我需要它！]她急切地说着，闭上眼睛，张开了嘴。");
            get_player().removeKeyItem("Potent Mixture");
            chooseYourAmilyRape();
         }
      }
      
      public function stalkingZeAmiliez() : void
      {
         clearOutput();
         outputText("你走进废弃的村庄，开始寻找艾米莉。[pg]");
         if(get_player().get_inte() >= 50 && get_player().get_spe() >= 65)
         {
            amilySprite(true);
            outputText("你小心翼翼地观察四周，终于发现了艾米莉最近留下的一些足迹。很明显她试图隐藏它们，但凭借你过人的智慧，你不仅找到了通往她所有藏身处的路线，还推断出她接下来会使用哪个藏身处，并决定躲在里面；现在，剩下的就是等待了……[pg]");
            outputText("你等了很长一段时间，但最终你听到了艾米莉靠近的声音；她检查了藏身处是否有任何入侵的迹象，但你很好地隐藏了你的存在，她什么也没发现。她满意地放下装有一些她收集的水果的袋子，坐在凳子上，松了一口气。[pg]");
            outputText("这是你行动的信号；你迅速冲出藏身处，一把夺过她的吹箭筒。艾米莉惊讶地跳开，试图去拿她的刀，但你太快了；你把她打倒在地，抓住她的手腕，把她按在地板上，她的刀滑开了。[say: 你好，艾米莉。] 你带着邪恶的微笑说道。[pg]");
            outputText("[say: 不——不要！放开我！] 她大喊着回应，对自己的处境感到恐慌。你用一只手把她的两只手腕举过头顶，然后拿起她的一根飞镖刺入她的大腿。她大声尖叫，停止了挣扎，飞镖里的药物很快就把她迷晕了。[pg]");
            outputText("你微笑着脱光她的衣服，然后找了根绳子把她绑起来。你把她的双手绑在一起，然后把她的手和脚踝绑在一起，确保她无法反抗你。之后，你处理掉任何可以作为武器或帮助她逃跑的东西，然后坐在她刚才坐的凳子上，等待她恢复意识。毕竟，如果她醒着看到你对她做的一切，那就更有趣了……[pg]");
            chooseYourAmilyRape();
         }
         else if(get_player().get_inte() >= 50)
         {
            amilySprite();
            outputText("你小心翼翼地观察四周，终于发现了艾米莉最近留下的一些足迹。很明显她试图隐藏它们，但凭借你过人的智慧，你不仅找到了通往她所有藏身处的路线，还推断出她接下来会使用哪个藏身处，并决定躲在里面；现在，剩下的就是等待了……[pg]");
            outputText("你等了很长一段时间，但最终你听到了艾米莉靠近的声音；她检查了藏身处是否有任何入侵的迹象，但你很好地隐藏了你的存在，她什么也没发现。她满意地放下装有一些她收集的水果的袋子，坐在凳子上，松了一口气。[pg]");
            outputText("这是你行动的信号；你迅速冲出藏身处，一把夺过她的吹箭筒。艾米莉惊讶地跳开，伸手去拿她的刀，摆出战斗姿态。你准备好你的[weapon]，准备教训这只愚蠢的老鼠。[pg]");
            startCombat(new Amily(),true);
         }
         else if(get_player().get_spe() >= 65)
         {
            amilySprite();
            outputText("你在村子里走来走去，寻找艾米莉，但找了一会儿运气不佳，当你听到一些灌木丛在动时，你终于有了突破。[pg]");
            outputText("你及时发现了艾米莉，看到一根飞镖朝你飞来；但你迅速侧身躲开飞镖，冲向她。意识到自己没射中，她伸手去拿另一根飞镖；但你不会允许的，你捡起地上的一块石头，扔向她的吹箭筒，把它从她手里打掉。[pg]");
            outputText("惊慌失措的她拿起刀准备和你战斗。你准备好你的[weapon]，准备教训这只愚蠢的老鼠。[pg]");
            startCombat(new Amily(),true);
         }
         else
         {
            outputText("你到处寻找艾米莉，但找不到她的一丝踪迹。你沮丧地回到营地。也许如果你更聪明或更快，你就能找到她。");
            doNext(get_camp().returnToCampUseTwoHours);
         }
      }
      
      public function sorryForImpaling() : void
      {
         clearOutput();
         outputText("你垂下头，除了乖乖道歉，你想不出还能做什么……...");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2655) == 0)
         {
            outputText("[say: <b>对不起</b>？你差点杀了我！]她坚持道，泪水再次涌上眼眶。[say: 你真的差点杀了我！难道——难道我对你来说就只是这样吗，啊？！只是一个坏了也无所谓的玩具？！那——那我们的孩子呢？！天哪，那我们的一切呢？！?!]");
            outputText("[pg]起初你不知道该说什么。你小心翼翼地伸出手去碰她的肩膀，但她因为你的触碰而发抖，并推开了你。[say: 你难道一点都不在乎是否伤害了我吗……？]她质问道，声音里的怒火现在弱了许多。");
            outputText("[pg]尽管你向她保证你在乎，但刚刚发生的事情却让这番话显得毫无说服力。尽管这让你感到羞愧，但你甚至不确定你自己是否相信，更不用说艾米莉了。");
            outputText("你再次向她伸出手，这次她没有推开你。她只是开始哭泣。当你从背后抱住她时，你感到一种可耻的内疚，同时你自己的眼睛里也感到一阵灼热的湿润。");
            outputText("[pg][say:我——我做不到……]她哭喊着。[say:我没法活在恐惧中，害怕你根本不在乎我，只要你能爽就行……我……我没法和那些堕落的怪物一起生活！]她狠狠地吐出这句话，转过头看着你时，脸上浮现出痛苦而怨毒的表情。");
            outputText("然而，当她看到你流下的眼泪时，她的怒火消退了，她把手轻轻地放在你的手上。[say:我……再也不能这样了……]她闭上眼睛，靠在你的怀里，哀求着你。");
            outputText("[pg]你向她保证这种事绝对不会再发生了。她没有再说别的，你抱着她直到你们俩都睡着了。当你醒来时，也许一切都能恢复正常，但你知道你们俩谁都不会忘记这件事。");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2656,1);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2655) >= 1)
         {
            outputText("[say:你<b>很抱歉</b>？你很抱歉？别对我撒谎！]她怒气冲冲地说，说话时仍轻轻捂着酸痛的喉咙。[say:我已经告诉过你弄疼我了，你却根本不在乎！你现在也根本不在乎，对吧？！]她哭喊着，眼泪顺着脸颊滚落，死死地瞪着你。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2656) == 1)
            {
               outputText("[say:你答应过我的……]她呜咽着，颤抖了一会儿，然后尖叫着重申，[say:你答应过我的！但我猜那也根本算不上什么！!]");
            }
            outputText("[pg]你伸手想去碰她的肩膀，但她迅速拍开你的手并后退了一步。[say:别碰我！]她哭喊着，愤怒地转过身去。[say:我……我以为我们之间是有点什么的……]她倒吸了一口气，开始抽泣，一只手捂着脸。[say:我……我以为你在乎我！我……我……！]她崩溃大哭，大声抽泣着，一手捂着脸，试图控制呼吸却无济于事。");
            outputText("[pg]你不知道该说什么，再次向她伸出手，却只能倒吸一口凉气，因为她化作一道残影从你的视线中消失了。你的脖子传来一阵剧痛，紧接着你只能大口喘气，你瘫倒在地，喉咙上插着艾米莉的一根毒镖，麻木感蔓延全身。");
            outputText("[pg]你躺在地上，勉强能看清她冲进树林的背影，随着你的视线逐渐陷入黑暗，她迅速消失在你的视野中。");
         }
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,2655,FlagDict_Impl_.arrayReadInt(_loc1_,2655) + 2);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2655) >= 3)
         {
            doNext(tooDeepAmilyLeaves);
         }
         else
         {
            doNext(get_camp().returnToCampUseOneHour);
         }
      }
      
      public function sneakyUberAmilyRemeetingsAnnounce() : void
      {
         clearOutput();
         amilySprite();
         outputText("你觉得最好不要吓到像艾米莉这样的人，于是你大声地清了清嗓子。艾米莉猛地转过身面对你，立刻拔出刀摆出防御姿势。当她看到是你时，她眨了几下眼睛。[pg]");
         switch(pregnancy.get_event())
         {
            case 1:
            case 2:
            case 3:
            case 4:
            case 5:
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,38) < 15)
               {
                  outputText("[say: 我想也许是因为挂着这个，我的动作开始变慢了，] 她抱怨道。[say: 你有什么事吗？][pg]");
               }
               else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,38) < 40)
               {
                  outputText("[say: 说实话——这有没有让我更容易被找到？] 她问道，挺出肚子以示强调。然后，她似乎并不在意答案，转移了话题。[say: 你想见我有什么原因吗？][pg]");
               }
               else
               {
                  outputText("[say: 我可能怀孕了，但我并没有让你更容易找到我，对吧？] 她得意地笑了笑。[say: 找到我需要高超的技巧……但你的原因是什么？][pg]");
               }
               break;
            case 6:
            case 7:
            case 8:
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,38) < 15)
               {
                  outputText("[say: 你能找到我的唯一原因，就是因为这个大肚子让我行动迟缓，而且目标太大藏不住。你知道的，对吧？]她充满戒备地宣告着，随后语气一转，好奇地问道，[say: ……话说回来，你来这里干嘛？][pg]");
                  break;
               }
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,38) < 40)
               {
                  outputText("[say: 我想我现在躲起来不像以前那么容易了。所以，你来这里干嘛？][pg]");
                  break;
               }
               outputText("[say: 这些天，我很难再跑动和躲藏了。我很高兴你决定扮演守护天使的角色。那么，我该怎么感谢你来看我呢？][pg]");
               break;
            default:
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,38) < 15)
               {
                  outputText("[say: 你到底是怎么找到这里的？从来没有人能追踪到我！]她抗议道。然后她摇了摇头。[say: 算了，我想如果是你的话，也没关系。那么，你想要什么？][pg]");
               }
               else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,38) < 40)
               {
                  outputText("[say: 嗯……我得在这方面下点功夫了；我可不能让随便哪个笨蛋都能跟踪我，]她调皮地笑着说道。[say: 怎么了？][pg]");
               }
               else
               {
                  outputText("[say: 你进步很大嘛，我的爱人。]她微笑着，对你展示的技巧感到无比自豪。[say: 那么，是什么风把你吹到我这儿来了？]她打趣道。[pg]");
               }
         }
         menu();
         addButtonDisabled(0,"做爱");
         addButtonDisabled(2,"都要");
         if(get_player().get_lust() >= 33)
         {
            addButton(0,"做爱",sexWithAmily);
            addButton(2,"都要",talkThenSexWithAmily);
         }
      }
      
      public function sitAndWatchAmilySex() : void
      {
         clearOutput();
         amilySprite();
         var _loc1_:int = get_player().cockThatFits(61);
         outputText("你呆在原地，不想破坏这场表演。当她明显开始滴下淫液并向你走来，显然准备进入正题时，你的" + get_player().cockDescript(_loc1_) + "已经坚硬如铁。[pg]");
         dynStats(DynStat.Lust(50));
         continueAmilySmex();
      }
      
      public function sexWithAmily() : void
      {
         var _loc1_:* = null as IMap;
         clearOutput();
         amilySprite();
         outputText("你告诉艾米莉，你来这里是因为你想和她做爱。[pg]");
         switch(pregnancy.get_event())
         {
            case 1:
            case 2:
            case 3:
            case 4:
            case 5:
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,38) < 15)
               {
                  outputText("她困惑地盯着你。[say: 为什么？我已经怀孕了，]她对你说。[say: ……算了。等我需要再次怀孕的时候，你再来做爱吧。如果你想操那些塞满婴儿的无脑婊子，就去找地精吧！][pg]");
                  outputText("尽管怀着孕，艾米莉的动作依然很敏捷，你很快就被一个人留在了原地。也许在她这种状态下，最好不要这么直白地和她提这个话题。[pg]");
                  _loc1_ = KFLAGS.flags;
                  FlagDict_Impl_.arrayWriteInt(_loc1_,38,FlagDict_Impl_.arrayReadInt(_loc1_,38) - 3);
                  doNext(get_camp().returnToCampUseOneHour);
               }
               else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,38) < 40)
               {
                  outputText("她显然很惊讶，把手放在了隆起的腹部上。但随后她耸了耸肩说道，[say: 好吧，我想我确实欠你这么多，毕竟你帮了我。][pg]");
                  outputText("虽然她确实动身并示意你跟上，但你意识到她对你来这里的理由并不太高兴。[pg]");
                  doNext(amilySexHappens);
               }
               else
               {
                  outputText("[say: 即使我已经怀孕了，你还是想要我？]她问道——并没有生气或失望，听起来反而很高兴。[say: 哎，我怎么能拒绝你呢？]她灿烂地笑了笑，开始往前走，尽力扭动着性感的臀部，以此邀请你跟上她。[pg]");
                  doNext(amilySexHappens);
               }
               break;
            case 6:
            case 7:
            case 8:
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,38) < 15)
               {
                  outputText("她的难以置信显而易见。她盯着自己的肚子，然后看着你，接着看向你的裤裆，最后又看回自己的肚子。她摇了摇头，显然觉得很恶心。[say: 你是什么变态啊？看看我现在的样子——我根本不适合做爱！如果我对你来说就只有这点意义，那就等我生完孩子再来吧！][pg]");
                  outputText("她恼火地转过身，蹒跚着走开了。你没有追上去；看得出来你已经冒犯了她。[pg]");
                  _loc1_ = KFLAGS.flags;
                  FlagDict_Impl_.arrayWriteInt(_loc1_,38,FlagDict_Impl_.arrayReadInt(_loc1_,38) - 3);
                  doNext(get_camp().returnToCampUseOneHour);
                  break;
               }
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,38) < 40)
               {
                  outputText("她瞪大了眼睛，仿佛不敢相信你的话。[say: 你不可能饥渴到想要一个像我这样又胖又大肚子的人吧！]她抗议道。[pg]");
                  outputText("你向她坚持说你不是在开玩笑——你真的觉得她足够性感，值得你和她做爱。[pg]");
                  outputText("[say: ……好吧，我想我受宠若惊，但是……你到底知不知道怎么和一个孕妇做爱？尤其是一个像我这样月份这么大的？][pg]");
                  outputText("你不得不承认，实际上，你并不了解。[pg]");
                  outputText("[say: 不是我不喜欢你，[name]，只是……嗯，我觉得那样做不太舒服，]她歉意地解释道。[pg]");
                  outputText("你为向她提出让她不舒服的要求而道歉，然后离开回到了自己的营地，以免严重冒犯她。");
                  _loc1_ = KFLAGS.flags;
                  FlagDict_Impl_.arrayWriteInt(_loc1_,38,FlagDict_Impl_.arrayReadInt(_loc1_,38) - 3);
                  doNext(get_camp().returnToCampUseOneHour);
                  break;
               }
               outputText("她对这个请求显得有些困惑，但随后露出了真诚愉悦的笑容。[say: 如果你愿意，我奉陪，亲爱的。]她眨了眨眼，向你伸出手。你握住她的手，任由她带你前往她选好的筑巢地。[pg]");
               doNext(amilySexHappens);
               break;
            default:
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,38) < 15)
               {
                  outputText("[say: 你当然想了。好吧，来吧，我想我可以满足你。这是我怀孕的唯一方法。][pg]");
                  outputText("她出发了，显然在前面带路，而你则跟在她身后。[pg]");
                  doNext(amilySexHappens);
               }
               else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,38) < 40)
               {
                  outputText("[say: 好吧，我想你还行。我的意思是，我还需要怀孕，]她逗弄着你，尾巴欢快地摇摆着。[say: 跟我来。][pg]");
                  outputText("你不得不强迫自己跟上她，但她显然只是在和你闹着玩，所以才跑得这么快，而不是真的想逃跑。[pg]");
                  doNext(amilySexHappens);
               }
               else
               {
                  outputText("艾米莉懒得说什么；她只是笑得像偷腥的猫（好吧，或者是偷吃芝士蛋糕的老鼠）。她抓住你的手，尽力以最快的速度拉着你朝她最近的藏身处跑去。[pg]");
                  doNext(amilySexHappens);
               }
         }
      }
      
      public function sendCorruptCuntToFarm() : void
      {
         clearOutput();
         amilySprite();
         outputText("你告诉你的宠物老鼠，她要去湖边找一个农场，把自己献给在那里工作的女士，并按她说的做。");
         outputText("[pg][say:你……你要把我送走？]艾米莉的脸上露出了悲惨而恐惧的表情。[say:我……我做错了什么冒犯了您吗，[master]？请您随意惩罚我，这是我应得的，但请不要把我从您光辉的身边带走！]你宠溺地笑了。");
         outputText("[pg][say: 这不是惩罚，但我需要你做点别的事，而不是整天坐在这里幻想着伺候我来自慰。我会经常去看你，保证你吃得饱饱的，别担心——而且所有的农活都会让你变得更加柔软灵活，这样我折腾你的时候就更方便了。去吧。] 艾米莉稍微平静了一些，但看起来仍然有些不确定，她从地上站起来，步履蹒跚地朝湖边走去。");
         outputText("[pg]你觉得她会成为惠特尼手下的一个好工人，但你怀疑她在保护方面能有多大用处。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1079,1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function secondTimeAmilyRefuseAgain() : void
      {
         clearOutput();
         amilySprite();
         outputText("你轻轻摇头，解释说你的立场没有改变。艾米莉看起来有些恼火，但还是尊重了你的决定。[pg]");
         outputText("[say: 好吧；这是你的选择。但你知道的，我的提议依然有效，]她对你说。[pg]");
         outputText("你让她知道你会记住的，然后转身离开。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function secondTimeAmilyOfferedAccepted() : void
      {
         clearOutput();
         amilySprite();
         outputText("你告诉她，是的——你会给她想要的孩子。她愉快地笑了笑，让你跟她走。[pg]");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,39,1);
         doNext(amilySexHappens);
      }
      
      public function scareAmilyRemeetingsProBaws() : void
      {
         clearOutput();
         amilySprite();
         outputText("你带着恶作剧的笑容，小心翼翼地溜到她身后。突然抓住她的肩膀，你大喊，[say: 抓到你了！]她惊慌地尖叫了一声，猛地转过身来，同时用匕首挥出一记猛烈的劈砍！[pg]");
         if(get_player().get_spe() < 50)
         {
            get_player().takeDamage(-5);
            outputText("你连滚带爬地向后退去，但匕首还是在你的肉上划出了一道可怕的伤口。艾米莉看起来准备再次攻击，但当她看清是你时停了下来。[pg]");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,38) < 15)
            {
               outputText("[say: 哦……是你啊。好吧，这可真是件蠢事，]她说道，出奇地镇定。她粗暴地抓住你，用力按压你的伤口，疼得你大叫起来。[say: 娇气包，死不了的。就当是个教训吧，别在拿着刀的幸存者背后偷偷摸摸的——至少在这里不行。所以，到底是什么风把你吹来了？]她漫不经心地问道。[pg]");
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,38) < 40)
            {
               outputText("[say: 这就是你从背后吓唬一个拿着刀的人的下场，]她说道，尽管明显很担心。[say: 嘿，你没事吧？]她问道。[pg]");
               outputText("你向她保证，虽然很疼，但没什么大碍。[pg]");
               outputText("她看起来松了一口气。[say: 那就好……你确实有点活该，但我可不想因为你是个笨蛋就把你杀了，从而结束我们的关系……所以，你来这里干嘛？][pg]");
            }
            else
            {
               outputText("[say: 你个白痴！你个笨蛋！你-你-你！]她语无伦次地说着，甚至在拼命检查你的伤口时差点把你撞倒。她的动作很轻柔，看到只是皮肉伤后，她松了一口气。她把手伸进一个你以前没注意到的袋子里，迅速开始包扎。[say: 只是小伤；你会没事的……但你绝不能再那样吓我了！]她大声尖叫道。[say: 我可能会伤到你的——你有没有想过？如果我真的伤到你怎么办？]");
               if(pregnancy.get_isPregnant())
               {
                  outputText("[say: 你想让我们的孩子在没有父亲的环境中长大吗？]她轻声问道，一只手抚摸着她隆起的肚子。[pg]");
               }
               outputText("[pg]");
               outputText("你为自己的愚蠢道歉，并保证不会再发生这种事了。[pg]");
               outputText("[say: 最好是这样，]她一本正经地哼了一声。然后她如释重负地咧嘴笑了。[say: 那么，你为什么想来看我？][pg]");
            }
         }
         else
         {
            outputText("你及时向后跳开，避开了一次可能严重伤害你的攻击。艾米莉迅速恢复姿势，再次准备好她的刀，这才意识到是你。[pg]");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,38) < 15)
            {
               outputText("她的表情很凶狠。[say: 笨蛋！别偷偷摸摸地靠近我！如果你再慢一点，我可能就杀了你了！]艾米莉愤愤不平地啐了一口。她摇着头，嘴里嘟囔着关于你的智商和血统的脏话，你有一瞬间怀疑她是不是要气冲冲地走掉。但随后她平静了下来。[say: 怎么？快说！你为什么在这里？][pg]");
               outputText("好吧，也许她还没有完全平静下来。[pg]");
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,38) < 40)
            {
               outputText("她脸上闪过一丝恼怒的表情。[say: 你疯了吗！？你知道那有多蠢吗？我可能会杀了你！]她咆哮着，然后慢慢平静下来。[say: 啊，好吧……不知者无罪，我想……][pg]");
            }
            else
            {
               outputText("恐惧让位于宽慰，随后又染上了一丝愤怒。[say: 这是所有愚蠢的半吊子把戏中最蠢的！你知道那有多危险吗？]她抓住你，眼中开始闪烁着泪光。[say: 你知道如果我伤害了你——如果我杀了你，我会是什么感觉吗？答应我，你以后不会再这样偷偷摸摸地靠近我了！][pg]");
               outputText("你保证以后不会再这样吓唬她了，她的脸上露出了如释重负的表情。[say: 很好。那么，抛开那些不愉快的事情……你为什么在这里？][pg]");
            }
         }
         menu();
         addButtonDisabled(0,"做爱");
         addButtonDisabled(2,"都要");
         if(get_player().get_lust() >= 33)
         {
            addButton(0,"做爱",sexWithAmily);
            addButton(2,"都要",talkThenSexWithAmily);
         }
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,38,FlagDict_Impl_.arrayReadInt(_loc1_,38) - 1);
      }
      
      public function scareAmilyOnDesperatePleaMeeting() : void
      {
         clearOutput();
         amilySprite();
         outputText("你带着恶作剧的笑容，小心翼翼地溜到她身后。突然抓住她的肩膀，你大喊，[say: 抓到你了！]她惊慌地尖叫了一声，猛地转过身来，同时用匕首挥出一记猛烈的劈砍！[pg]");
         if(get_player().get_spe() < 50)
         {
            get_player().takeDamage(5);
            outputText("你连滚带爬地向后退去，但它还是在你的肉上划出了一道难看的伤口。艾米莉看起来准备再次攻击，但当她看到是你时停了下来。她看起来很抱歉——嗯，有点。[say: 你没事吧？我很抱歉，但这确实是我见过的最愚蠢的事情！]她走近你，确保你没有受重伤。[pg]");
            outputText("[say: 你死不了，]艾米莉迅速宣布，尽管她的声音中有一种真诚的宽慰感。[say: 啊……你有时间谈谈吗？我有些话想一吐为快，]她问道，显然很紧张，也许还有点尴尬。[pg]");
         }
         else
         {
            outputText("你设法及时向后跳，避开了一次可能严重伤害你的攻击。艾米莉很快恢复过来，再次准备好她的刀，却发现是你。她脸上闪过一丝恼怒的表情。[say: 你疯了吗！？你知道那有多蠢吗？我可能会杀了你！]她咆哮道，然后慢慢平静下来。[say: 啊，好吧……没造成伤害，就不算犯规，我想……][pg]");
            outputText("她尴尬地动了动。[say: 啊……你有时间谈谈吗？我有些话想一吐为快，]艾米莉紧张地问道。[pg]");
         }
         desperateFinallyAmily();
      }
      
      public function sayGoodByeToAmilyPostSecks() : void
      {
         amilySprite();
         clearOutput();
         outputText("你对她笑了笑，给了她一个吻，然后道别，回到了你的营地。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function saveToObject() : Object
      {
         return saveContent;
      }
      
      public function reset() : void
      {
         saveContent.ringType = "";
         saveContent.amilyMorning = false;
         saveContent.metKids = 0;
         saveContent.giftedCClothes = false;
         saveContent.impSkullsCount = 0;
         saveContent.pcKnowsAboutSkulls = false;
      }
      
      public function repeatAmilyTalk() : void
      {
         var _g:AmilyScene;
         clearOutput();
         amilySprite();
         outputText("你告诉她你只是想聊聊。[pg]");
         outputText("[say: 只是聊聊？]艾米莉问道，然后小声补充道，[say: 嗯……我已经很久没有真正和别人说过话了……]她有些走神，但随后又笑了起来。显然，艾米莉对这个提议感到高兴。[say: 那么，你有什么特别想聊的吗？][pg]");
         _g = this;
         doNext(function():void
         {
            _g.talkWithCuntIMeanAmily();
         });
      }
      
      public function remeetingAmilyScare() : void
      {
         clearOutput();
         amilySprite();
         outputText("你带着恶作剧的笑容，小心翼翼地溜到她身后。突然抓住她的肩膀，你大喊，[say: 抓到你了！]她惊慌地尖叫了一声，猛地转过身来，同时用匕首挥出一记猛烈的劈砍！[pg]");
         if(get_player().get_spe() < 50 || !get_player().hasPerk(PerkLib.Evade))
         {
            get_player().takeDamage(5);
            outputText("你拼命向后退，但它还是在你的肉上划出了一道可怕的伤口。艾米莉看起来准备再次发动攻击，但当她看到是你时停了下来。她看起来很抱歉——嗯，有点。[say: 你没事吧？我很抱歉，但这真的是我见过的最愚蠢的事情！]她走近你，确认你没有受重伤。[say: 你死不了，]她相当快地说。[pg]");
         }
         else
         {
            outputText("你设法及时向后跳，避开了一次可能严重伤害你的攻击。艾米莉很快恢复过来，再次准备好她的刀，却发现是你。她脸上闪过一丝恼怒的表情。[say: 你疯了吗！？你知道那有多蠢吗？我可能会杀了你！]她咆哮道，然后慢慢平静下来。[say: 啊，好吧……没造成伤害，就不算犯规，我想……][pg]");
         }
         doNext(amilyRemeetingContinued);
      }
      
      public function remeetingAmilyAnnounceSelf() : void
      {
         clearOutput();
         amilySprite();
         outputText("考虑到最好不要吓到像艾米莉这样的人，你故意大声清了清嗓子。艾米莉转过身来面对你，并立即拔出刀摆出防御姿势。当她看到是你时，她眨了几下眼睛，然后惊讶地咧嘴笑了。[say: 哎呀，你好，[name]；很高兴再次见到你！很高兴能被提醒，这里还有另一个人没有变成无脑的性爱木偶。]然后她的情绪变得严肃起来。[pg]");
         doNext(amilyRemeetingContinued);
      }
      
      public function refuzzAmily() : void
      {
         var _loc1_:* = null as String;
         if(!get_player().hasItem(get_consumables().MOUSECO,2))
         {
            outputText("不幸的是，在你拥有两把老鼠可可之前，你无法做到这一点。");
            doNext(amilyFollowerEncounter);
            return;
         }
         get_player().consumeItem(get_consumables().MOUSECO,2);
         if(amilyCorrupt())
         {
            _loc1_ = get_player().mf("主人","女主人");
            outputText("你向你那毛茸茸的小荡妇招了招手，告诉她她应该变回你们相遇之前的样子。你拿出两份老鼠可可递给艾米莉，告诉她只要含着就行了。");
            outputText("[pg]她急切地含着老鼠可可，眼睛睁得大大的。她的脸发生了变化，长出了啮齿动物的口鼻和胡须。毛发长满了她的全身，她的手也扭曲得更像爪子了。<b>艾米莉现在变回了她以前的老鼠模样，尽管已经被腐化了。</b>");
         }
         else
         {
            outputText("她双手叉在纤细的腰上，满怀期待地看着你。你一言不发，伸手探入[inv]，拿出了几份老鼠可可。你把它们递给鼠娘，她好奇地打量着。[say:你确定要我变回去吗？]她有些紧张地问。你点了点头，这就是她需要的全部鼓励。她吸吮着老鼠可可，品味着巧克力的味道。[pg]");
            outputText("她的脸发生了变化，长出了啮齿动物的口鼻和胡须。全身长出皮毛，双手也变得更像爪子。<b>艾米莉现在恢复了她以前的老鼠形态。</b>");
         }
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,337,0);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,336,1);
         amilySprite();
         doNext(amilyFollowerEncounter);
      }
      
      public function refuseAmilysOffer() : void
      {
         clearOutput();
         amilySprite();
         outputText("你摇摇头表示拒绝。[pg]");
         outputText("艾米莉难以置信地盯着你。[say: 不？你什么意思，不？我可是真心实意地提出要在这里和你做爱。][pg]");
         outputText("你告诉她，你不能随便和一个素未谋面的陌生人做爱，尤其是当那个陌生人承认这只是一种随意的、没有感情的、情感空洞的行为时。你害怕仅仅为了卖身而卖身，即使是为了这样一个显然高尚的目的——这也不对。你来到这个世界是为了努力对抗恶魔所代表的享乐主义和好色，而不是为了支持它，或者更糟的是，你自己也屈服于它。[pg]");
         outputText("你讲完后，艾米莉睁大了眼睛。[say: 我已经……我已经很久没有听到有人说这样的话，有这样的想法了。]她微微一笑，然后猛烈地摇了摇头。[say: 我真的需要你的帮助……但我只能尊重你的信念。不过，我确实希望我们以后能达成共识。][pg]");
         outputText("她向你鞠了一躬，然后离开了，让你有机会转身离开这个废弃的村庄。[pg]");
         outputText("你给艾米莉留下了深刻的印象，控制你的性冲动有助于平息你的性欲。[pg]");
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,38,FlagDict_Impl_.arrayReadInt(_loc1_,38) + 10);
         dynStats(DynStat.Lib(-2));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function rapeCorruptAmily4Meeting() : void
      {
         clearOutput();
         if(get_player().get_gender() == 0)
         {
            outputText("你很想和你的老鼠母狗玩玩，但你没有合适的器官；所以你回到了营地。");
            doNext(get_camp().returnToCampUseOneHour);
            return;
         }
         outputText("你走进废弃的村庄，希望能找到你那堕落的老鼠精液桶。没过多久你就发现了她；她正抚摸着自己的小穴，并含弄着一根木雕假阳具，就像你吩咐的那样练习着。[pg]");
         outputText("一意识到你的到来，她立刻丢下假阳具冲向你；她顺从地跪在你面前，用鼻子蹭着你的胯部问道，[say:" + get_player().mf("主人","女主人") + "，你是来喂我的吗？][pg]");
         outputText("你微笑着挠了挠她的一只耳朵后面，引得这只堕落的老鼠发出一声愉悦的叹息。你忍不住回想起她曾经是多么的保守，拒绝并攻击你；现在她真的变了太多，一看到你就乞求着一滴精液。[say:让我看看你准备好了没有，]你说道，粗暴地抓住她的耳朵把她拉开。[pg]");
         if(get_player().get_gender() == 3)
         {
            outputText("你应该用哪个部位来解决这只小鼠娘？");
            menu();
            addButton(0,"肉棒",rapeCorruptAmily4Male);
            addButton(1,"小穴",rapeCorruptAmily4Female);
         }
         else if(get_player().get_gender() == 2)
         {
            doNext(rapeCorruptAmily4Female);
         }
         else
         {
            doNext(rapeCorruptAmily4Male);
         }
      }
      
      public function rapeCorruptAmily4Male() : void
      {
         clearOutput();
         outputText("你慢慢脱下你的[armor]，而艾米莉则满怀期待地喘息着。当你脱完后，你向她展示了你勃起的[cock]；她迅速地蹭着并亲吻你的柱身，用她的乳房摩擦着你的肉棒");
         if(get_player().balls > 0)
         {
            outputText("和[balls]");
         }
         outputText("。[pg]");
         outputText("[say: 开始吧，]你命令她。[pg]");
         outputText("她退后一点，在你的龟头上轻轻一吻，这吻很快就变成了吸吮。你感觉到你的[cock]滑入了她的喉咙；几乎没有任何阻力，你的肉棒顺滑地深入她的喉咙，艾米莉完全没有干呕。");
         if(get_player().cockArea(0) > 50)
         {
            outputText("你满意地坏笑起来；以你的尺寸，任何试图吞下你[cock]的人大概都会被噎死。但艾米莉既没有被噎住也没有干呕，她饥渴的小嘴每吞入一寸，都会发出愉悦的呻吟。");
         }
         outputText("[pg]");
         outputText("没过多久，你就完全进入了她的小嘴；她微笑着抬头看你，舌头探出来，给了");
         if(get_player().balls > 0)
         {
            outputText("你的蛋蛋");
         }
         else if(get_player().hasVagina())
         {
            outputText("你的小穴");
         }
         else
         {
            outputText("你的肉棒根部");
         }
         outputText("一个挑逗的舔舐。你回以微笑，说道：[say: 继续，让我爽。]艾米莉呻吟着，开始用她的舌头和小嘴在你的肉棒上套弄。[pg]");
         outputText("你抓住她的耳朵借力，她什么时候变得这么厉害了？她肯定一直在练习……她急切、饥渴、甚至近乎拼命地在你的肉棒上起伏着脑袋。");
         if(get_player().balls > 0)
         {
            outputText("有时你甚至能感觉到她的乳头在挑逗地摩擦你的蛋蛋。");
         }
         outputText("每次她的鼻子撞到你的胯部时，她都会吞咽，按摩你的整根肉棒；而每次她退后时，她都会呼气，让一阵阵愉悦的战栗传遍你的全身。");
         outputText("[pg]");
         outputText("随着高潮的临近，你感觉到你的肉棒变得更硬了。艾米莉肯定也感觉到了，因为她加倍努力地取悦你。你把她的头紧紧按向自己，将精液深深射进她的喉咙。艾米莉发出愉悦的呻吟，淫液滴落在地板上，湿漉漉地宣告着她自己的高潮。她饥渴地吞咽着你给予的一切，吸吮并按摩着你的肉棒，尽可能多地榨出你的精液。");
         if(get_player().balls > 0)
         {
            outputText("她的一只手甚至开始揉捏你的蛋蛋，试图从你身上榨出更多。");
         }
         outputText("[pg]");
         if(get_player().cor < 80)
         {
            outputText("你推开她并拔了出来，精疲力尽。艾米莉满眼爱意地抬头看着你，");
            if(get_player().cumQ() >= 750)
            {
               outputText("她的肚子鼓得像怀孕了一样，仿佛马上就要生了。");
            }
            else
            {
               outputText("她的肚子里装满了你刚刚射进她体内的巨量精液。");
            }
            outputText("[pg]");
            outputText("你试图积攒更多力气继续操这只老鼠美妙的喉咙，但此刻你已经精疲力尽了。[say: 去继续练习吧，我晚点再来喂你。]艾米莉笑了笑，舔了舔嘴唇，在你的肉棒上留下一个临别的吻，然后跑回了她的一个藏身处。[pg]");
            outputText("你回到了营地。");
            get_player().orgasm("Generic");
            dynStats(DynStat.Cor(3));
            doNext(get_camp().returnToCampUseOneHour);
            return;
         }
         outputText("你把她推开并抽身而出，还没有满足。<b>一股熟悉的力量在你体内聚集，你决定利用它。</b>[pg]");
         outputText("[say: 我决定让你做我的母狗；把你变成一个心甘情愿的精液垃圾桶，让我随时都能把精液射进去。如果你想要的话，就求我吧，匍匐在我的脚下，求我完成你的堕落，让你成为一个真正的精盆。如果你做得够好，我甚至会考虑让你怀孕。]你邪恶地笑着说道。[pg]");
         outputText("她呻吟着，四肢着地爬向你，匍匐在你的[feet]下，把脸贴在你站立的地面上摩擦，不停地哀求着。[pg]");
         outputText("[say: 求求您，" + get_player().mf("master","mistress") + "，让我做您的精液桶吧。没有什么比成为您欲望的容器更让我喜欢的了。这就像梦想成真一样！求求您，哦，求求您，[master]！让我怀孕，让我生下更多的老鼠来像您应得的那样崇拜您。][pg]");
         outputText("她的话取悦了你，你");
         if(get_player().hasTailInsteadOfLegs())
         {
            outputText("将你的[if (isNaga) {蛇|鱼}]尾巴缠绕在她的头上。");
         }
         else if(get_player().lowerBody.type == 8)
         {
            outputText("用史莱姆黏液吞没了她的嘴。");
         }
         else
         {
            outputText("把一只[foot]踩在她的头上。");
         }
         outputText("她安静了下来，你说道。[say: 很好。从现在起，我是你唯一的[master]。你必须永远这样称呼我。我的话就是法律，无论何时，我让你做什么你就得做什么。起来吧，是时候让你适应作为我的精液垃圾桶的新角色了。][pg]");
         outputText("你放开她，她跪起身来。[say: 现在证明你的忠诚。给我吹！]你命令她。[pg]");
         outputText("艾米莉没有浪费时间，立刻开始工作。你让她吸吮了一会儿她在这个世界上最喜欢的东西；然后你让她舔你，让她的舌头在你的肉棒周围游走");
         if(get_player().balls > 0)
         {
            outputText("和蛋蛋");
         }
         outputText("。[pg]");
         outputText("她立刻服从了你；听从你的命令对她来说就像是第二天性。一个更加堕落的艾米莉的形象浮现在你的脑海中。恶魔的特征装饰着她，她变成了魅魔和老鼠的混合体。你集中注意力，将这些想法传导到你的肉棒上。[pg]");
         outputText("[say: 停下，站好。是时候给你洗礼了，]你喘着粗气对她说道。[pg]");
         outputText("艾米莉闭上眼睛，微微鞠躬，让你能清楚地瞄准她的头部。终于，你释放了。[pg]");
         outputText("黑色的精液从你的[cock]中喷出，充满了堕落的气息。当它击中艾米莉头部的瞬间，她呻吟出声。你邪恶的精液覆盖了她的整个头部，然后是她的整个上半身，并以一种不自然的方式沿着她的身体蔓延。没有留下一丝缝隙，你黑色的精液渗透了她的皮肤，像一件紧身衣一样覆盖着她。很快，她从头到脚都被覆盖了。她的小穴流出大量的淫液，在整个过程中她都在呻吟。[pg]");
         rapeCorruptAmily4Epilogue();
      }
      
      public function rapeCorruptAmily4Female() : void
      {
         clearOutput();
         outputText("你慢慢脱下你的[armor]，而艾米莉则满怀期待地喘息着。当你脱完后，你向她展示你滴着淫液的[vagina]；她迅速凑上前去，亲吻你的阴蒂。");
         if(get_player().balls > 0)
         {
            outputText("退后一点，挑逗地舔舐你的蛋蛋。");
         }
         outputText("[pg]");
         outputText("[say: 开始吧，]你命令她。[pg]");
         outputText("她继续在你的阴唇上蹭着、吻着；她深吸一口气，享受着你湿润小穴的气味，然后直接在你的阴蒂上呼气。这让你痒得");
         if(get_player().wetness() >= 5)
         {
            outputText("喷出一小股淫液，弄湿了她的脸。");
         }
         else
         {
            outputText("变得更湿了。");
         }
         outputText("艾米莉像拼了命一样钻进你的[vagina]；吸溜着、亲吻着、吮吸着、舔舐着她能弄到的每一滴淫液。湿润小穴和舌头舔舐的声音在空气中回荡。[pg]");
         outputText("终于，艾米莉的舌头深深地探入了你的[vagina]。她非常小心地用最合适的方式刺激你；就好像她有一张你爱洞里每一个敏感点的地图。你呻吟着，为这只堕落的小鼠娘感到骄傲。为了达到这种水平，她一定在训练上花了不少功夫。你挠了挠她的耳后，换来了一声愉悦的呻吟，这呻吟在你的体内激起阵阵快感的涟漪。[say: 干得好，荡妇。继续。]你对她说。她含糊不清地回答道：[say: 谢谢您，主人，]然后加倍努力地取悦你。[pg]");
         outputText("快感如潮水般涌来，艾米莉熟练的舔舐让你多次高潮，有一次你甚至不得不靠在她的头上支撑自己；她似乎并不介意。事实上，意识到她舔穴的效果反而让她更加兴奋。她把鼻子贴在你的小穴上摩擦；每一次舔舐都撞击着你的阴蒂；让快感的电流直冲你的脊椎。");
         if(get_player().getClitLength() >= 4)
         {
            outputText("她的一只手开始抚摸你勃起的阴蒂，就像抚摸肉棒一样。这种行为带来的快感几乎让你的感官超载。");
         }
         outputText("[pg]");
         outputText("你感觉到前所未有的巨大高潮正在酝酿，你决定奖励你听话的小精盆，确保她能得到所有的淫液。[say: 紧紧贴着我的小穴，荡妇。我要奖励你所有的努力。]艾米莉毫不迟疑地服从了你的命令。她最后舔了一下你的小穴，你感觉到了。");
         if(get_player().wetness() >= 5)
         {
            outputText("艾米莉几乎不需要费力去喝你的淫液，你的小穴以极大的力量将它们喷射出来，所有的液体都直接穿过艾米莉的嘴进入她的喉咙。");
         }
         else
         {
            outputText("艾米莉像一个极度口渴的人在井边喝水一样，大口吞咽着你的淫液。");
         }
         outputText("每一滴流出的淫液都被她吞下，这正是你对你选中的精液桶所期望的。最后一次强有力的喷涌标志着你高潮的结束。[pg]");
         if(get_player().cor < 80)
         {
            outputText("你把她推开并退后，精疲力尽，");
            if(get_player().wetness() >= 5)
            {
               outputText("她的肚子因为刚刚喝下的大量淫液而胀得鼓鼓的。");
            }
            else
            {
               outputText("她的肚子因为你刚刚灌入的淫液而微微隆起。");
            }
            outputText("[pg]");
            outputText("你觉得你应该继续，但你太虚弱了……[say: 去继续练习吧，我晚点再来喂你，]你对她说。艾米莉笑了笑，舔了舔嘴唇，在你的小穴上留下一个离别的吻，然后跑回了她的一个藏身处。[pg]");
            outputText("你回到了营地。");
            doNext(get_camp().returnToCampUseOneHour);
            get_player().orgasm("Generic");
            dynStats(DynStat.Cor(3));
            return;
         }
         outputText("你把她推开并抽身而出，还没有满足。<b>一股熟悉的力量在你体内聚集，你决定利用它。</b>[pg]");
         outputText("[say: 我决定让你成为我的母狗；让你成为一个心甘情愿的精液垃圾桶，只要我愿意，随时都能把我的精液射进去。如果你想要这样，那就求我吧，在我的脚下匍匐，求我完成你的堕落，让你成为一个真正的精液荡妇，]你邪恶地笑着说道。[pg]");
         outputText("她呻吟着，四肢着地向你爬来，匍匐在你的[feet]下，把脸贴在你站立的地面上摩擦，同时不停地哀求着。[pg]");
         outputText("[say: 求求您，" + get_player().mf("master","mistress") + "，让我成为您的精液桶吧。没有什么比成为您欲望的容器更让我渴望的了。这简直就像梦想成真！求求您，哦，求求您，[master]！请允许我让您怀孕，这样您就能生下更多的老鼠来像您应得的那样崇拜您。][pg]");
         outputText("她的话取悦了你，你");
         if(get_player().hasTailInsteadOfLegs())
         {
            outputText("将你的[if (isNaga) {蛇|鱼}]尾巴缠绕在她的头上。");
         }
         else if(get_player().lowerBody.type == 8)
         {
            outputText("用史莱姆黏液吞没了她的嘴。");
         }
         else
         {
            outputText("把一只[foot]踩在她的头上。");
         }
         outputText("她安静了下来，你说道：[say: 很好。从现在起，我就是你唯一的女主人。你必须永远这样称呼我。我的话就是法律，无论何时，只要我下令，你就必须照做。起来吧，是时候让你适应你作为我的精液垃圾桶的新角色了。][pg]");
         outputText("你放开她，她跪起身来。[say: 现在证明你的忠诚。舔我！]你命令她。[pg]");
         outputText("艾米莉毫不耽搁地开始行动。她充满爱意地舔舐着你的[vagina]，仿佛那是她崇拜的圣物。");
         if(get_player().balls > 0)
         {
            outputText("她暂时忽略了你的蛋蛋，如此专注于她的任务，以至于几乎没有注意到它们正搁在她的头上。");
         }
         outputText("你让她更卖力些，她急切地照做，舔舐和亲吻得更快更用力；让你再次陷入令人头脑空白的高潮。一个更加堕落的艾米莉的形象浮现在你的脑海中。恶魔的特征装饰着她，使她变成了魅魔和老鼠的混合体。你集中注意力在这些想法上，并将它们送入你的小穴。[pg]");
         outputText("[say: 停下，站好。是时候给你洗礼了，]你喘着粗气对她说道。[pg]");
         outputText("艾米莉闭上眼睛，微微鞠躬，让你能清楚地瞄准她的头部。终于，你释放了。[pg]");
         outputText("黑色的汁液从你的[vagina]中喷射而出，充满了堕落的气息。当它击中艾米莉的头时，她呻吟出声。你邪恶的淫液覆盖了她的整个头部，然后是她的整个上半身，并以一种不自然的方式沿着她的身体蔓延。没有留下一丝缝隙，你黑色的汁液渗透了她的皮肤，像一件全身紧身衣一样覆盖着她。很快，她从头到脚都被覆盖了。她的小穴大量地流出淫液，在整个过程中她都在不停地呻吟。[pg]");
         rapeCorruptAmily4Epilogue();
      }
      
      public function rapeCorruptAmily4Epilogue() : void
      {
         outputText("你的精液被她完全吸收，她尖叫着，在快感中弯下了腰。她有史以来最强烈的高潮震撼了她的内心；她翻着白眼，你看到她开始发生变化。[pg]");
         outputText("她的" + (amilyFurry() ? "毛发变成了淫荡的紫色" : "头发变成了淫荡的紫色，皮肤褪成了淡淡的薰衣草色") + "；她的小角变大，轮廓更加分明；小巧的蝙蝠翅膀从她的肩膀上长出；她尾巴上铲子状的尖端变得更大，轮廓也更加分明；");
         if(amilyFurry())
         {
            outputText("她的脚扭曲成了老鼠脚爪和恶魔爪子的混合体，长着乌黑的爪子和第四个关节");
         }
         else
         {
            outputText("由于标志性的恶魔骨头从她的脚后跟突出，她的脚被迫处于永久的踮脚状态");
         }
         outputText("；她的手上长出了黑色的小爪子。最后，她的目光重新聚焦在你身上，现在带着诱人的光芒。[pg]");
         outputText("她打量着自己，审视并享受着这具敏感的新身体；每一个动作都伴随着愉悦的叹息或呻吟。她看着你，跪在你面前，一股淫液随着她的动作从她的小穴中涌出。[say: " + get_player().mf("主人","女主人") + "……您有什么吩咐？] 艾米莉用诱惑的语气问道。[pg]");
         outputText("你邪恶地咧嘴一笑。这只小鼠娘真的变成了魅魔的一部分。[say: 我要你过来，在我的营地旁边安顿下来。我需要我的精盆随叫随到，] 你说。[pg]");
         outputText("艾米莉咧嘴一笑，诱惑地回答道：[say: 是的，[master]……听从您的吩咐是我的荣幸。][pg]");
         outputText("<b>(堕落的艾米莉已加入奴隶)</b>");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,43,2);
         if(get_player().get_pregnancyType() == 11)
         {
            get_player().knockUpForce(4,get_player().get_pregnancyIncubation());
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,173) == 0)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,47,5);
            FlagDict_Impl_.arrayWriteFloat(KFLAGS.flags,48,0.5);
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,49,12);
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,50,12);
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,172,1);
            FlagDict_Impl_.arrayWriteString(KFLAGS.flags,52,"sexy rags");
         }
         if(get_marbleScene().marbleAtCamp())
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,85,1);
         }
         else
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,85,2);
         }
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,36,1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function rapeCorruptAmily3Male() : void
      {
         clearOutput();
         outputText("你脱下衣服，艾米莉饥渴地注视着你。当你终于赤身裸体时，你命令这只老鼠靠近，用她的乳房来取悦你。艾米莉迅速跪着挪近，将她的双乳挤压在你的[cock]周围。].");
         if(get_player().cockArea(0) >= 61)
         {
            outputText("尽管她的乳房无法完全包裹住，但她并没有停下，决心要执行你的命令。");
         }
         outputText("[pg]");
         outputText("艾米莉开始移动她");
         if(amilyFurry())
         {
            outputText("毛茸茸的");
         }
         outputText("乳房沿着你的肉棒摩擦，让你全身泛起一阵阵愉悦的战栗；顺着你的肉棒流下的先列腺液正好润滑了艾米莉的乳房，让整个过程更加令人享受。你感觉到自己快要爆发了，于是命令艾米莉躺下，保持不动。[pg]");
         outputText("艾米莉一言不发地照做了；然后你将你的[cock]插入她的双乳之间，开始猛烈地抽插。你就在那里爆发了，直接射在艾米莉的乳房上，给她覆盖了一层滚烫的白色精液，而艾米莉则满足地微笑着。[pg]");
         if(get_player().cor < 60)
         {
            outputText("暂时满足后，你留下微笑着躺在精液池中的老鼠，回到了营地。");
            get_player().orgasm("Generic");
            dynStats(DynStat.Cor(2));
            doNext(get_camp().returnToCampUseOneHour);
            return;
         }
         outputText("刚才很爽，但现在是时候奖励艾米莉的努力了；而且你现在真的很需要一个像样的口交。[pg]");
         outputText("[say:起来吧，精液桶，该领你的奖励了，]你说道。[pg]");
         outputText("艾米莉跳了起来，冲过来用鼻子蹭你依然勃起的[cock]。[say:谢谢！谢谢！谢谢！]她兴奋地说。然后她舔了舔嘴唇，张大嘴巴接纳你的肉棒。");
         if(get_player().cockArea(0) > 50)
         {
            outputText("你本以为这不可能，但不知怎么的，");
         }
         outputText("艾米莉竟然一口气把你整个吞了进去。她狂喜地发出咕噜声，让震动传遍你的肉棒，引得你发出一声愉悦的呻吟。她的舌头从嘴里伸出来，舔舐着");
         if(get_player().balls > 0)
         {
            outputText("你的[balls]");
         }
         else if(get_player().hasVagina())
         {
            outputText("你的[vagina]");
         }
         else
         {
            outputText("你的肉棒根部");
         }
         outputText("。这让你感到一阵酥痒，一股先列腺液喷溅在她的口腔内，引得她又发出一声呻吟。[pg]");
         outputText("[say:挑逗够了。现在开始干活，]你命令道。她顺从地开始移动并吸吮你的[cock]。[pg]");
         outputText("她扭动着全身，尽可能地让你感到愉悦，而她那绳子般的老鼠尾巴则随着每一次响亮的吸吮声在她身后快乐地摇摆。看到艾米莉变得如此熟练真是太棒了，你甚至可以说她天生就是为了这个而生的，吸鸡巴。唯一能让这变得更好的方法就是如果艾米莉自己也是个魅魔。毕竟，你毫不怀疑，尽管艾米莉很棒，但她仍然无法与性爱恶魔相提并论。这其实是个不错的主意……也许你应该推动她变成恶魔？艾米莉可以成为你个人的精盆，一个吸鸡巴的恶魔，只要你愿意，随时可以把你的精液射进去。你的鸡巴因为这个想法而跳动，仿佛在赞同。");
         if(get_player().balls > 0)
         {
            outputText("你的[balls]里翻腾着精液，随着你脑海中闪过的每一个下流细节而变得越来越沉重。");
         }
         outputText("一个恶魔化的艾米莉为你服务的画面提炼成了一大股精液。你非常乐意把它射进艾米莉渴望的喉咙里。你抓住她的耳朵，强行拉过她的头，尽可能深地插入她的喉咙。然后你在她体内爆发了。[pg]");
         outputText("她的肚子被填满了，比过去膨胀得大得多，而你——你猜想——这是你最长的一次高潮，没有一滴精液从她的喉咙里漏出来。");
         if(get_player().cumQ() >= 750)
         {
            outputText("你不停地抽插，她不停地吞咽；她膨胀的肚子一直没有停止变大，直到她看起来像怀胎十月，而你也精疲力尽。");
         }
         outputText("[pg]");
         rapeCorruptAmily3Epilogue();
      }
      
      public function rapeCorruptAmily3Female() : void
      {
         clearOutput();
         outputText("你脱下衣服，而艾米莉饥渴地看着。终于赤身裸体后，你命令这只老鼠靠近，用她的乳房来取悦你。艾米莉跪着挪近，将她的乳房压在你的[vagina]上，一次一个球体。当她勃起的乳头刺激你的阴唇时，你微笑着轻声呻吟；");
         if(get_player().wetness() >= 5)
         {
            outputText("你向她展示你的享受，在她的乳房上喷射出一股淫液，用性润滑剂清洗它们。艾米莉看着她现在闪闪发光的乳房，忍不住笑了。");
         }
         else
         {
            outputText("水分聚集并滴落在艾米莉敏感的乳头上，导致这只小鼠娘在愉悦中叹息，看着她湿润的乳头微笑。");
         }
         outputText("[pg]");
         if(get_player().getClitLength() >= 4)
         {
            outputText("然后，艾米莉用她的乳房挤压你敏感的阴蒂，用她的双峰在上面摩擦，就像它是一根鸡巴一样。当艾米莉抬头对你微笑，高兴地看到你对她刺激的反应时，你喘息着呻吟。");
         }
         else
         {
            outputText("艾米莉决定用她湿润的乳头挑逗你敏感的阴蒂，在这个小肉核周围画圈，让电流顺着你的脊椎传导；你忍不住呻吟；艾米莉只是微笑着，将她丰满的乳房更用力地在你的小穴上摩擦。");
         }
         outputText("[pg]");
         outputText("随着你的手指最后一次推压你的[vagina]，你高潮了；将汁液洒满了这只渴望的小鼠娘。她急忙试图在半空中舔舐它；大部分都落在了她的脸上，但进入她张开的嘴里的那些很快就消失了。你完事了，看着艾米莉舔着嘴唇，试图品尝更多你的味道。[pg]");
         if(get_player().cor < 60)
         {
            outputText("暂时满足了，你留下这只微笑的老鼠躺在一滩汁液中，回到了营地。");
            get_player().orgasm("Generic");
            dynStats(DynStat.Cor(2));
            doNext(get_camp().returnToCampUseOneHour);
            return;
         }
         outputText("那很不错，但现在是时候奖励艾米莉的努力了，而且你确实需要一次好好的舔舐。[pg]");
         outputText("你坐在附近的一个树桩上说，[say: 起来吧，精液桶，是时候好好奖励你了。][pg]");
         outputText("艾米莉跳了起来，冲过去用鼻子蹭你仍在漏液的阴道。[say: 谢谢！谢谢！谢谢！]她兴奋地说。然后，她舔了舔嘴唇，张大嘴巴，吞没了你整个[vagina]。].");
         if(get_player().wetness() >= 5)
         {
            outputText("她的鼻子撞到了你的阴蒂，导致你向这只小鼠娘的喉咙里喷射出一股汁液。令你惊讶的是，她甚至没有漏掉一滴，高兴地把它们全吞了下去。");
         }
         outputText("她舔舐并亲吻你的下唇，与它们亲热，仿佛它们是失散多年的恋人的嘴唇。她那绳子般的老鼠尾巴随着每一次响亮的吸吮声在她身后快乐地摇摆。看到艾米莉变得如此熟练真是太棒了；你甚至可以说她天生就是为了这个而生的，舔小穴。唯一能让这变得更好的方法就是如果艾米莉自己也是个魅魔。毕竟，你毫不怀疑，尽管艾米莉很棒，但她仍然无法与性爱恶魔相提并论。这其实是个不错的主意；也许你应该推动她变成恶魔？你个人的精盆，一个舔小穴的恶魔，只要你愿意，随时可以把你的汁液射进去。你的小穴因为这个想法而收缩，仿佛在赞同。一个恶魔化的艾米莉为你服务的画面让你的小穴泛起一阵狂野的愉悦涟漪，你感觉到这个想法提炼成了一场巨大的汁液洪水。你非常乐意把它射进艾米莉渴望的嘴里。你抓住她的耳朵，强行把她的头拉进你的胯下，把她的鼻子压在你的阴蒂上，把她的嘴压在你的小穴上，她因为这个举动而高兴地呻吟，然后你爆发了。[pg]");
         outputText("你以惊人的速度将淫液灌满她的口腔。如果是不习惯吞咽汁液的人，肯定会被你灌进艾米莉嘴里的惊人淫水呛到甚至淹死；然而她不仅把它们全吞了下去，甚至还继续舔舐着以吸出更多。更令人惊讶的是，她的嘴似乎在你的[vagina]周围形成了一个完美的密封圈，确保没有一滴漏出来。");
         if(get_player().wetness() >= 5)
         {
            outputText("你不断喷出越来越多的汁液；有那么一瞬间你甚至担心自己会不会脱水，但那压倒性的高潮快感足以让你把这个念头抛到九霄云外。艾米莉没有停止吞咽，即使她的肚子已经开始鼓胀。你不断地高潮，直到精疲力尽。");
         }
         outputText("[pg]");
         rapeCorruptAmily3Epilogue();
      }
      
      public function rapeCorruptAmily3Epilogue() : void
      {
         amilySprite();
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,170,FlagDict_Impl_.arrayReadInt(_loc1_,170) + 1);
         outputText("艾米莉仰面倒下，舔着嘴唇，抚摸着她鼓胀的肚子。接着她开始呻吟，似乎有什么东西正在发生改变。她的尾巴在双腿间疯狂地甩动，你着迷地看着她的尾巴尖端形成了一个黑桃状的尖头。她的头顶出现了一对小凸起，然后长成了可爱的小恶魔角……就像你想象的那样。难道艾米莉转变的真正根源是你，而不是那混合物？[pg]");
         outputText("你邪恶地笑了。一直以来都是你；是你把这只小鼠娘堕落成了一个荡妇。你转过身，开始朝你的营地走去。[pg]");
         outputText("[say:求求你！等等，[master]，求求你！]艾米莉大喊道，你转过身回头看着她。[say:我还要。求求你，]她乞求道。[pg]");
         outputText("[say:是吗？好吧……如果你能通过一个测试，我会给你更多的，]你告诉她。[pg]");
         outputText("她站起身来跪下，全神贯注地抬头看着你。[say:我愿意把你收作我的精液桶，前提是你必须服从我所有的命令，并不断练习如何更好地取悦我，]你说道。[pg]");
         outputText("艾米莉高兴地回答：[say:只要是你想要的！][pg]");
         outputText("[say:等我觉得你准备好了，我就会回来。]你说道，然后留下她自己一个人。");
         get_player().orgasm("Generic");
         dynStats(DynStat.Lib(-2),DynStat.Cor(5));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function rapeCorruptAmily2Male() : void
      {
         clearOutput();
         var _loc1_:int = get_player().cockThatFits(61);
         if(_loc1_ < 0)
         {
            _loc1_ = 0;
         }
         outputText("你毫不客气地将你的" + get_player().cockDescript(_loc1_) + "塞进她的嘴里。");
         if(get_player().cockThatFits(61) < 0)
         {
            outputText("尽管你的尺寸很大，她还是向前倾，尽可能多地吞下你。");
         }
         outputText("当你感觉到自己顶到了她的喉咙深处时，她稍微扭动了一下头，把你吞得更深，给你深喉。[pg]");
         outputText("你惊讶地喘了口气；在你们上次见面之前，她绝对做不到这样！她一直在练习吗？[pg]");
         outputText("很快你感觉到她已经吞下了所有");
         if(get_player().cockThatFits(61) < 0)
         {
            outputText("可能吞下的部分。");
         }
         else
         {
            outputText("你能提供的部分。");
         }
         outputText("[pg]");
         outputText("你摸了摸她的头说。[say:好女孩。][pg]");
         outputText("她笑了笑，大口吸吮着你的肉棒，惹得你发出一声呻吟。[pg]");
         outputText("你开始在她的嘴里抽插；长长的抽插让你的龟头几乎离开了她的嘴，然后又尽可能深地插回去。");
         if(get_player().cockThatFits(61) < 0)
         {
            outputText("艾米莉的一只手放在你的" + get_player().cockDescript(_loc1_) + "上，抚摸着她没能吞下去的部分。");
         }
         outputText("[pg]");
         outputText("当你稳定在一个稳定的节奏时，你忍不住注意到她已经变成了一个出色的口交者。难道是你的药水在帮助她释放内心的荡妇？你希望是这样！[pg]");
         if(get_player().balls > 0)
         {
            outputText("艾米莉抓住你的蛋蛋开始揉捏。");
         }
         else if(get_player().hasVagina())
         {
            outputText("艾米莉把手指插进你的[vagina]里。");
         }
         outputText("你呻吟着，开始漏出前列腺液，加快速度以跟上艾米莉嘈杂的吸吮声。她毫不掩饰地让全世界知道她正在给你口交。[pg]");
         outputText("有了新身材，她看起来更有女人味了，但如果她的本钱更大一点就好了……那样她也能给你乳交了！!");
         if(get_player().balls > 0)
         {
            outputText("光是想想就足以让你的蛋蛋翻腾起来。");
         }
         outputText("你想象着艾米莉变得越来越渴望给你口交；像个荡妇一样乞求你的精液。这只曾经一本正经的老鼠，如今沦为了一个只配让你发泄的精液桶。[pg]");
         outputText("突然，你抓住她的头发，粗暴地将自己尽可能深地塞进去；艾米莉没有痛苦地尖叫，反而舒服地呻吟起来，睁大眼睛，渴望着她即将得到的东西。[pg]");
         outputText("你把精液射进她体内，一股接一股美味的精液喷射进她的喉咙，直达她的胃部，甚至让她的肚子微微鼓起。");
         if(get_player().cumQ() >= 750)
         {
            outputText("当你拔出来让她喘口气时，你感觉到你那巨大的射精量从她的喉咙涌回，从她的口鼻溢出，弄脏了你的胯部。");
         }
         outputText("[pg]");
         rapeCorruptAmily2Epilogue();
      }
      
      public function rapeCorruptAmily2Female() : void
      {
         clearOutput();
         outputText("你粗暴地抓住艾米莉的耳朵，把她的脸按在你的[vagina]上。].");
         if(get_player().wetness() >= 5)
         {
            outputText("你的淫液喷射到她的脸上，把她的" + (amilyFurry() ? "口鼻" : "脸") + "涂满了你的爱液，她幸福而愉悦地咯咯笑着。");
         }
         outputText("艾米莉开始舔舐和吸吮，她的鼻子时不时地撞到你的阴蒂；她像拼了命一样吃着你的[vagina]。当这只曾经一本正经的小鼠娘狼吞虎咽地吞食你美味的汁液时，你只能舒服地呻吟。[pg]");
         outputText("你轻轻拍了拍她的头，说道：[say:好女孩。][pg]");
         outputText("艾米莉的回应是狠狠吸吮了一下你的阴蒂，并加倍努力地舔舐你多汁通道里的每一个角落；你用大量的淫液奖励她，她开心地舔舐着；让你淫荡地呻吟起来……[pg]");
         outputText("艾米莉自己也时不时地呻吟着，让愉悦的涟漪传遍你的[vagina]和全身。她似乎非常享受；并且毫不羞耻地让所有人知道她喜欢小穴里的汁液。[pg]");
         outputText("从这个姿势你看不清她，但从你之前看到的来看，她有了新身材后看起来更有女人味了，但如果她的本钱能更大一点就好了……可以按压和揉捏的摇晃大奶子。那该多棒啊！光是想想就足以让你再次高潮");
         if(get_player().wetness() >= 5)
         {
            outputText("，给艾米莉洗了个淫液浴；即使这个母鼠骚货的吞咽能力确实变强了，她也不可能喝光你所有的体液");
         }
         outputText(".");
         if(get_player().wetness() < 5)
         {
            outputText("大量的淫液从你的小穴涌出，直接流进这只母鼠骚货饥渴的嘴里，然而，还是有一些溢了出来；即使艾米莉的吞咽能力确实变强了，她离成为你想要的完美性玩具还有很长的路要走。");
         }
         outputText("[pg]");
         outputText("突然，你抓住她的耳朵，用尽全力把她拉向你滴着淫液的小穴。艾米莉似乎根本没有注意到疼痛；她只是舒服地呻吟着，舌头继续兴奋地舔舐，渴望得到她的奖励。[pg]");
         outputText("你高潮了……你猛烈地高潮了，比你记忆中的任何一次都要猛烈。大量的淫液倾泻在艾米莉张开的嘴、脸和上半身上；将她浸泡在你的淫液中，并将她标记为你的财产。她被你的淫液呛到了，但你没有松手；尽管处境窘迫，艾米莉自己似乎也不愿意停下来；她能做的只有吞咽和呻吟。");
         if(get_player().wetness() >= 5)
         {
            outputText("你的高潮持续的时间比平时长得多。最后你松开了艾米莉，在她的头顶上释放完毕。[pg]");
         }
         rapeCorruptAmily2Epilogue();
      }
      
      public function rapeCorruptAmily2Epilogue() : void
      {
         amilySprite();
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,170,FlagDict_Impl_.arrayReadInt(_loc1_,170) + 1);
         outputText("艾米莉仰面倒下，开心地喘着气，舔着嘴唇，尽可能多地品尝你的味道。就在这时，你注意到她开始发生变化，缓慢但却非常明显。[pg]");
         outputText("她的乳房开始变得丰满，臀部和胯部也变得更加宽大；看着这只小鼠娘在你的改造下发生的变化，你忍不住露出了微笑。[pg]");
         outputText("你俯下身，扒开她的一只耳朵，轻声低语道：[say:准备好等我回来，我这儿还有很多好东西呢，]然后你站起身，走开去为艾米莉的“药”寻找更多材料。\'.");
         get_player().orgasm("Generic");
         dynStats(DynStat.Lib(-2),DynStat.Cor(5));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function rapeCorruptAmily1Male() : void
      {
         amilySprite();
         var _loc1_:int = get_player().cockThatFits(61);
         if(_loc1_ < 0)
         {
            _loc1_ = 0;
         }
         get_player().removeKeyItem("Potent Mixture");
         clearOutput();
         outputText("你微笑着说：[say: 好吧，但你得自己努力争取。] 艾米莉的回答是张大嘴巴。邀请已经很明显了，你凑近她的嘴，她的嘴唇碰到了你的" + get_player().cockDescript(_loc1_) + "的顶端；艾米莉突然抬起头，开始吞咽你的肉棒");
         if(get_player().cockThatFits(61) == -1)
         {
            outputText("——你很惊讶她居然能把它全塞进去。");
         }
         else
         {
            outputText(".");
         }
         outputText("你呻吟着抓住她的耳朵，然后开始猛烈地操弄她的脸，尽可能深地把你的阴茎塞进去。艾米莉似乎并不介意；事实上，她试图尽可能多地吞下你的肉棒……但她的喉咙实在无法张得那么大。[pg]");
         outputText("当她舔舐你肉棒的底部时，你微笑着；虽然她被绑着，能做的不多，但你很高兴她似乎如此渴望为你口交。尤其是在她拒绝甚至攻击你，声称你对她来说太堕落之后；如果她能更开放一点，事情会好得多……你的沉思被艾米莉特别响亮的吸吮声打断了。你的肉棒埋在她的嘴里，她看起来真不错……感觉也出奇的好；她注意到了所有正确的位置，并确保用舌头按摩你的柱身。艾米莉猛烈地吸吮着你的阴茎，你感觉到自己越来越接近高潮。艾米莉注意到你呼吸变得急促，节奏加快，于是加倍努力。如果她总是像个荡妇一样渴望为你口交，那也不错……想到她心甘情愿地跪在你的双腿间，张大嘴巴接受你的" + get_player().cockDescript(_loc1_) + "……你感觉到你的");
         if(get_player().balls > 0)
         {
            outputText("[balls]翻腾");
         }
         else
         {
            outputText(get_player().cockDescript(_loc1_) + "跳动");
         }
         outputText("；一想到一个渴望精液的鼠人荡妇，你就化作了一大股精液，全部射进了她的嘴里。");
         outputText("[pg]你叹了口气，暂时满足了，留下她自己清理。");
         get_player().orgasm("Generic");
         dynStats(DynStat.Lib(-2),DynStat.Cor(5));
         if(get_game().get_inCombat())
         {
            get_combat().cleanupAfterCombat();
         }
         else
         {
            doNext(get_camp().returnToCampUseOneHour);
         }
      }
      
      public function rapeCorruptAmily1Female() : void
      {
         amilySprite();
         clearOutput();
         get_player().removeKeyItem("Potent Mixture");
         outputText("你微笑着说，[say: 好吧，但你得自己努力争取。]艾米莉的回答是张大嘴巴。邀请很明确，你走上前，将你的[vagina]降向她张开的嘴。[pg]");
         outputText("艾米莉突然抬起头，开始像拼了命一样舔舐和吸吮你的小穴");
         if(get_player().wetness() >= 5)
         {
            outputText("，一股液体从你的下唇喷出，直接打在她的脸上；但她毫不在意");
         }
         outputText("。她对着你的阴蒂吹气，让你舒服得跳了起来，你说，[say: 冷静点，有足够的汁液给你。]但艾米莉似乎没有在听；她一直舔你，直到你的第一次高潮震撼了你，流入她饥渴的嘴里。她尽可能多地喝下去，但最终还是呛到了，洒出了你大部分的汁液。[pg]");
         outputText("当她语无伦次时，你笑了。[say: 看看你做了什么，]你说，指着她周围洒出的汁液；她停止了咳嗽，深吸了一口气。[pg]");
         outputText("[say: 还要，]她说。[pg]");
         outputText("[say: 还要？在你弄得一团糟之后？我不认为你值得更多。]你回答道。[pg]");
         outputText("她开始流泪，绝望地想要更多你美味的汁液。[pg]");
         outputText("[say: 求你了！我需要它！求你了！]她哀号道。[pg]");
         outputText("[say: 好吧，但你最好这次做对。]你说；当你再次向她的嘴降下时，她喜笑颜开，舔了舔嘴唇。[pg]");
         outputText("她把她的" + (amilyFurry() ? "口鼻" : "鼻子") + "推向你的[vagina]，紧紧地封住你滴水的私处，然后将舌头伸进去。你呻吟着，紧紧抓住她的耳朵；她只是不停地舔，甚至当你开始挺动撞击她的" + (amilyFurry() ? "口鼻" : "嘴唇") + "时也感觉不到疼痛。[pg]");
         outputText("这感觉太好了……艾米莉像个专业人士一样舔你。你想象她渴望更多你的汁液；渴望舔舐你溢出的每一滴淫液；随着每一次舔舐变得更加饥渴。这个想法对你来说太刺激了，你终于达到了猛烈的高潮；一股汁液涌入她的嘴里，直接进入她的肚子。[pg]");
         if(get_player().wetness() >= 5)
         {
            outputText("她试图吞下她能吞下的一切，但最终很多汁液从她的嘴里流出，弄得她脸上和周围到处都是。");
         }
         outputText("你不断地喂给她越来越多的精液，你的高潮持续的时间比平时长得多。艾米莉的肚子甚至因为精液的数量而微微隆起，她的小穴像打开的水龙头一样漏出汁液；看来服侍你足以让她几次达到高潮。[pg]");
         outputText("终于结束了，你放开她站起身来；她顺势瘫倒在地，满足地打了个小嗝，然后沉沉睡去。你解开她，开始穿衣服；你轻轻拍了拍她的大腿，然后回到了你的营地。你以后还得再来一次……...");
         get_player().orgasm("Generic");
         dynStats(DynStat.Lib(-2),DynStat.Cor(5));
         if(get_game().get_inCombat())
         {
            get_combat().cleanupAfterCombat();
         }
         else
         {
            doNext(get_camp().returnToCampUseOneHour);
         }
      }
      
      public function rapeCorruptAmily1() : void
      {
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,170,FlagDict_Impl_.arrayReadInt(_loc1_,170) + 1);
         clearOutput();
         outputText("你等了一会儿，漫不经心地看着你为艾米莉调制的混合物，直到一声呻吟将你的注意力吸引到被绑住的老鼠身上。[pg]");
         outputText("[say: 咦！？发生什么事了！？我为什么被绑起来了！？]她惊慌失措地脱口而出。[pg]");
         outputText("[say: 你好，艾米莉，] 你说道。[pg]");
         outputText("小鼠娘看了看你，又看了看你手中冒着泡的混合物。[say: 这-这是什么！？] 她问你。[pg]");
         outputText("[say: 我专门为你做的东西，] 你回答道，露出邪恶的笑容。[pg]");
         outputText("[say: 不！哦，女神啊，求求你不要！别这样，我求你了！求你放我走吧！] 艾米莉恳求道，眼眶泛着泪光。[pg]");
         outputText("你嘲笑她，[say: 你搞出那种把戏之后，可别指望我会轻易放过你。] 然后你开始脱衣服。[pg]");
         outputText("艾米莉一直没有停止恳求，坚持说她很抱歉，并乞求你放她走；但你完全无视了她。当你脱完衣服时，你的");
         if(get_player().cockTotal() > 0)
         {
            if(get_player().cockTotal() > 1)
            {
               outputText("[cocks]已经");
            }
            else
            {
               outputText("[cock]已经");
            }
            outputText("硬了");
            if(get_player().hasVagina())
            {
               outputText("，而且你的");
            }
         }
         if(get_player().hasVagina())
         {
            outputText("[vagina]也已经湿透了");
         }
         outputText("。艾米莉放声大哭，放弃了恳求。你跨坐在她的胸口，拔掉瓶塞，然后说：[say: 张嘴，我给你准备了特别的饮料。] 她紧闭着嘴，但你可不吃这一套；你捏住她的鼻子，迫使她张开嘴呼吸；就在这时，你出手了。[pg]");
         outputText("你把瓶子塞进她的嘴里，强行把里面的东西灌进她的喉咙。她发出咕噜咕噜的呛水声，当混合物灌进她的肚子里时，她差点窒息，但你直到瓶子空了才停下来。你站起身把瓶子收好，而艾米莉则在地板上咳嗽喘息。等她平静下来，你看着她的脸。她气喘吁吁，满脸通红，双眼迷离空洞地望着天花板；接着你听到她大声呻吟，看着一股淫液从她的小穴涌出，流到地板上。[pg]");
         outputText("你对她自发的高潮轻笑出声；毫无疑问，她一定很喜欢你给她的这杯小饮料。她的眼睛重新聚焦，看向你；不是你预想中的愤怒或恐慌，而是充满了情欲。[say: 好-好热……好舒uuuu服……] 艾米莉说着，再次高潮时发出了呻吟。你笑着开始猥亵她；揉捏她的乳房，按摩她的小穴，捏弄她的阴蒂。每一次触摸都会带来一阵淫液，让艾米莉高潮迭起。[say: 我需要……] 你听到艾米莉喃喃自语。[say: 我需要更多！给我更多……不管那瓶子里装的是什么！] 这只老鼠急切地说道。你笑着告诉她。[say: 没啦，你全喝光了。] 艾米莉的脸变得绝望起来。[say: 不！但我——] 你用一根手指让她安静下来，然后说：[say: 不过，我可以让你喝点我的体液。你刚才喝的药水里就有一些。] 艾米莉的脸亮了起来，她兴奋地说：[say: 好！求你了，好！给我！][pg]");
         if(get_player().get_gender() == 3)
         {
            outputText("艾米莉应该舔你的哪个部位？");
            menu();
            addButton(0,"肉棒",rapeCorruptAmily1Male);
            addButton(1,"小穴",rapeCorruptAmily1Female);
         }
         else if(get_player().get_gender() == 1)
         {
            doNext(rapeCorruptAmily1Male);
         }
         else
         {
            doNext(rapeCorruptAmily1Female);
         }
      }
      
      public function pureAmilyPutsItInYourRectumDamnNearKilledEm() : void
      {
         clearOutput();
         amilySprite(true);
         var _loc1_:int = get_player().biggestCockIndex();
         outputText("你停顿了一下，对她露出一个羞涩的假笑，然后你轻轻地把一根手指的指尖放在她的鼻子上，顺着她的身体慢慢滑下，越过她的嘴唇，在她的乳房之间，穿过她的肚子，最后停在她的双腿之间，在那里你开始隔着她的裤子戏弄地抚摸她的阴茎，让它把她的衣服顶起帐篷。[pg]");
         outputText("在她误解你的意图之前，你倾身");
         if(get_player().get_tallness() >= 40)
         {
            outputText("向下");
         }
         else
         {
            outputText("过去");
         }
         outputText("并在她耳边低语，告诉她你到底想让她把肉棒插进哪里，这让她的脸颊因为尴尬而变得滚烫。[pg]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,419) == 0)
         {
            outputText("[say: 认真的吗……？]她怀疑地看着你说道。[say: 你想那样？][pg]");
            outputText("你对她点点头，隔着裤子漫不经心地抚摸着她，向她保证这正是你想要的。[pg]");
            outputText("[say: 好吧……可以。不过你先在这里等一下，]她说着，转身去翻找她的炼金材料。她拿出一个小罐子并打开盖子。里面是一种浓稠的绿色药膏，当她摇晃容器时，药膏会微微晃动。她带着羞涩的笑容，用手指挖出一小团，开始涂抹在她的肉棒上。[pg]");
            outputText("你用略带怀疑的眼神看着她，问她那里面到底是什么东西，但她轻笑了一声说：[say: 放松，只是一点烧伤药膏……不过应该能起作用。][pg]");
         }
         else
         {
            outputText("[say: 你想那样？好吧……可以，]她说道，尽管脸上布满红晕，但还是微微笑了起来。[pg]");
            outputText("她转过身，在她的东西里翻找着，拿出了那种奇怪的绿色药膏，打开盖子，用手指在里面搅动了一下。当你开始脱衣服时，她开始将药膏涂抹在她的肉棒上，冰凉的触感让她明显地打了个寒颤。[pg]");
         }
         outputText("她动作轻柔，小心翼翼地在肉棒上涂了厚厚一层绿色药膏，直到她的肉棒闪烁着一种奇怪的绿色光泽。你在地上摆好姿势，双膝和手肘着地，下巴垫在手上，将你的[ass]高高翘起");
         if(get_player().tail.type > 0)
         {
            outputText("，把尾巴挪开");
         }
         outputText("。[pg]");
         outputText("艾米莉");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,419) == 0)
         {
            outputText("看起来有些困惑，她思考了一会儿这个姿势的原理，然后耸了耸肩，");
         }
         outputText("来到你身后，用她的肉棒在你的臀沟间摩擦了几下，将滑腻的润滑剂涂抹开来。[pg]");
         if(get_player().analCapacity() < 30)
         {
            outputText("你稍微绷紧身体，当你感觉到艾米莉开始顶弄你的[asshole]时，你微微皱起眉头，只有龟头带着一点阻力滑了进去。");
         }
         else if(get_player().analCapacity() <= 60)
         {
            outputText("你放松下来，感觉到艾米莉的龟头滑入体内，发出一声沙哑的呻吟。");
         }
         else
         {
            outputText("当你的[asshole]几乎没有给她带来任何阻力时，艾米莉发出了一声略带惊讶的轻呼。");
         }
         outputText("药膏的效果极佳，让艾米莉完全插进你的体内，而你没有感到任何疼痛");
         if(get_player().analCapacity() > 60)
         {
            outputText("，尽管你确信即使没有它，你也能轻松应付她");
         }
         outputText("。慢慢地，她开始前后摆动臀部，将双手放在你的[hips]上作为支撑。");
         get_player().buttChange(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) * FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,46),true,true,false);
         outputText("[pg]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,419) == 0)
         {
            outputText("[say:这样可以吗？啊……感觉……真好……]她低声呻吟着，而你则用充满快感的呻吟作为回应。[pg]");
         }
         outputText("你开始迎合她缓慢的抽插，向后顶弄。受到你的鼓励，她开始更加用力地抽插。她顺着你的后背滑下，开始在你的脖颈处蹭弄，性感地抚摸着你的腰侧，她的" + amilyHips() + "在你身上起伏。");
         if(get_player().hasCock())
         {
            outputText("你能感觉到她的手滑到你的身下，轻轻握住你的" + get_player().cockDescript(_loc1_) + "，开始用指尖抚摸和挑逗。");
            if(get_player().cockTotal() > 1)
            {
               outputText("她依次拂过[eachcock]，抚摸片刻后再换下一个。");
            }
         }
         outputText("[pg]");
         outputText("没过多久，艾米莉性感的抽插和抚摸就让你濒临高潮，你大声表达着你的快感，指尖抠进泥土里，大声呻吟着。");
         if(get_player().hasVagina())
         {
            outputText("淫液");
            if(get_player().wetness() <= 1)
            {
               outputText("滴落");
            }
            else if(get_player().wetness() <= 3)
            {
               outputText("流淌");
            }
            else
            {
               outputText("喷涌");
            }
            outputText("顺着你的大腿");
            if(get_player().hasCock())
            {
               outputText("并且");
            }
         }
         if(get_player().hasCock())
         {
            if(!get_player().hasVagina())
            {
               outputText("P");
            }
            outputText("预精从你的[cocks]滴落]");
         }
         if(get_player().get_gender() > 0)
         {
            outputText("，在你身下形成一个小水坑，你感觉到高潮即将来临。");
         }
         outputText("伴随着剧烈的颤抖，你高潮了，你的[asshole]紧紧夹住她的肉棒。与此同时，艾米莉在你耳边呻吟，温暖的扶她精液如丝带般填满了你的体内。");
         if(get_player().hasCock())
         {
            outputText("" + get_player().SMultiCockDesc() + " 愉悦地抽动着，用");
            if(get_player().cumQ() < 250)
            {
               outputText("几股水流");
            }
            else if(get_player().cumQ() < 500)
            {
               outputText("一场小雨");
            }
            else
            {
               outputText("一个小湖");
            }
            outputText("精液。");
         }
         outputText("[pg]");
         outputText("艾米莉颤抖着叹了口气，从你身上下来。你翻身侧躺在她身边，伸手抚摸她的脸颊，告诉她刚才的表现有多棒。她双臂环抱着你，一条腿轻柔地勾住你的腰，你们俩就这样躺在那里，依偎了好一会儿。[pg]");
         outputText("[say: 嗯……你知道吗……也许我们什么时候应该再来一次，]她带着狡黠的笑容说道，并在你的脸颊上亲了一口。");
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,419,FlagDict_Impl_.arrayReadInt(_loc2_,419) + 1);
         get_player().orgasm("Generic");
         dynStats(DynStat.Sens(1));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function pregnancyIsScaryGoddamnMousePregnancyImNotWatchingThisShit() : void
      {
         clearOutput();
         amilySprite();
         outputText("你匆忙撤退。你不确定为什么；也许是因为恐惧，也许是想起了在村子里，当有女人分娩时，接生婆总是把男人赶走的情景。你安慰自己她会没事的，然后回到了营地。[pg]");
         outputText("第二天早上，你在睡袋旁的一块树皮上发现了一张刻着字的便条，上面写着：[say:我和宝宝们都很好。这可不关你的事！][pg]");
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,38,FlagDict_Impl_.arrayReadInt(_loc1_,38) - 10);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function postBirthingEndChoices() : void
      {
         amilySprite();
         clearOutput();
         outputText("当你醒来时，孩子们都不见了，艾米莉为你准备了一些吃的。你狼吞虎咽地吃了起来，而艾米莉则神情严肃地开始说话。[pg]");
         outputText("[say: 你知道这……嗯，这不是我预想的未来。我想要一个人类伴侣来帮我生下纯种的孩子，复兴我的种族，这是真的，但是……我一直以为自己会是那些孩子的母亲。不过，做父亲……嗯，也不算太糟。] 她握住你的手，深情地看着你的眼睛。[saystart]我……我做梦也没想到我会对");
         if(get_player().get_gender() == 2)
         {
            outputText("另一个女人");
         }
         else
         {
            outputText("一个双性人");
         }
         outputText("说这种话，但是……我爱你。孩子们，他们现在要离开这里，去别的地方建立一个新的村庄。但我……我想留在这里陪你。永远。求你了，答应我吧。[sayend][pg]");
         outputText("你接受她的提议吗？");
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,162,FlagDict_Impl_.arrayReadInt(_loc1_,162) + 1);
         menu();
         addButton(0,"接受",acceptAmilyAsYourFemaleWaifu);
         addButton(1,"做朋友",declineButBeFriends);
         addButton(2,"拒绝",notInterestedInDumbshitMouseBitches);
      }
      
      public function playerHasRing() : Boolean
      {
         var _loc2_:int = 0;
         var _loc1_:int = 0;
         while(_loc1_ < 10)
         {
            _loc2_ = _loc1_++;
            if(get_player().itemSlots[_loc2_].quantity > 0 && (get_player().itemSlots[_loc2_].itype.get_id() == get_jewelries().SILVRNG.get_id() || get_player().itemSlots[_loc2_].itype.get_id() == get_jewelries().GOLDRNG.get_id() || get_player().itemSlots[_loc2_].itype.get_id() == get_jewelries().PLATRNG.get_id() || get_player().itemSlots[_loc2_].itype.get_id() == get_jewelries().DIAMRNG.get_id()))
            {
               return true;
            }
         }
         return false;
      }
      
      public function playerBirthsWifAmilyMiceInCamp() : void
      {
         amilySprite();
         outputText("你突然被肠胃里强烈的疼痛和压力痛醒。你猛地睁开眼睛，低头看到你的肚子异常饱满和肿胀。你能感觉到皮肤下的动静，看着它在许多地方被顶起，以令人不安的方式翻滚和蠕动。你从体内感受到的感觉同样令人不安。你数不清里面有一个还是许多个小东西在游动。太多了，你根本数不过来。[pg]");
         outputText("当它们强行拉开你的子宫颈时，一阵剧痛传遍全身，让你不由自主地叫出声来。艾米莉突然出现，从营地另一边跑了过来。[say:是时候了吗？你要生了吗？]她问道，声音中透着明显的担忧。[pg]");
         outputText("你带着一丝烦躁，咕哝着表示肯定；");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,162) > 0)
         {
            outputText("毕竟，这可不是你第一次生下她的后代了");
         }
         else
         {
            outputText("她可能只是很高兴你才是那个要把它们都生出来的人");
         }
         outputText("。然而，你本想做出的任何更详细的回答，都被另一阵宫缩带来的剧痛和随之而来的惨叫声吞没了。艾米莉握住你的手，你紧紧抓住这根救命稻草，庆幸自己在这个时候不是一个人。你能感觉到第一个孩子正在离开你的子宫，穿过你的子宫颈，向下进入你的[vagina]。你张开嘴唇，伴随着一声闷哼，将第一个孩子排入艾米莉等待的手中。她把它举到你面前，让你能看到你的长子；那是一只小老鼠" + (amilyFurry() ? "，光秃秃的，粉红色的，完全没有毛" : "") + "。艾米莉帮你把它抱到你的[chest]上，它急切地含住你的[nipple]开始吸吮。随着它的吸吮，它开始变大" + (amilyFurry() ? "，和你头发颜色一样的毛发开始覆盖它的身体" : "") + "。它很快就喝饱了，然后松开嘴，它的“父亲”把它放在一边，这很好，因为这个时候已经有另一个婴儿在排队等候了……然后是另一个……又一个……[pg]");
         outputText("很快，你又恢复了原来的样子，疲惫地躺在地上，艾米莉坐在旁边，你那群吵闹的后代已经开始在你周围走动和玩耍了。然而，你注意到它们比你以前看到的以这种方式出生和成长的孩子要小一些，精力也差一些。[pg]");
         outputText("[say:因为我们体内只剩下微量的那些化学物质，所以从现在起，它们应该会正常衰老。]艾米莉说道。[pg]");
         outputText("你心中充满担忧；在这样一个地方，你到底要怎么照顾这些弱小、毫无防备的生物？然而，还没等你向艾米莉表达这种担忧，灌木丛中的沙沙声就引起了你的注意。你看着一对年轻的" + (amilyFurry() ? "鼠人" : "鼠族伙伴") + "出现，自信地走进你的营地。它们是你的两个孩子，就是艾米莉告诉过你已经离开这个地区的那两个。[pg]");
         outputText("[say:我希望你不要介意，[name]，但在你告诉我你怀孕后不久，我就联系了它们，让它们来把新出生的弟弟妹妹带回去。]艾米莉有些不好意思地说。[say:我们在这里真的没法照顾它们，和所有的兄弟姐妹在一起，它们会更安全，也更快乐。][pg]");
         outputText("你点点头，承认你同意。一旦你恢复了体力，你花了一些时间和完全成年的孩子们交谈，并和你那些发育过度的初生儿玩耍。然后，随着最后一次挥手告别，" + (amilyFurry() ? "鼠人们" : "老鼠一家") + "再次消失在荒野中。");
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,162,FlagDict_Impl_.arrayReadInt(_loc1_,162) + 1);
      }
      
      public function playAlongWithAmilyWhataDumbBitch() : void
      {
         clearOutput();
         amilySprite(true);
         get_images().showImage("amily-forest-reverse-cowgirl");
         outputText("你决定让她占据主导地位，放松下来（在一个美丽、性感、湿漉漉的鼠娘坐在你身上抚摸你的时候，尽可能地放松），单纯地享受她的服侍。艾米莉显然很清楚自己在做什么——虽然你不知道她是怎么知道的——她设法让你几乎达到高潮，然后稍微退缩，让你平静下来。她重复了几次，直到你几乎要发疯了。就在你以为自己再也受不了的时候，她把尾巴从你的肉棒上移开，转而用它轻轻地绑住你的手。你本来可以轻易地挣脱，但你决定不这么做。她对你咧嘴一笑，在你的肉棒上方盘旋了片刻，然后慢慢地坐了下去。你不知怎么地忍住了在进入她的一瞬间射精的冲动，但这真的、真的很难。艾米莉的尾巴牵引着你“被绑住”的手放在她的乳房上，而她的手则开始抚摸你的胸膛，同时她开始慢慢地骑乘你。很快，速度加快了，没过多久，你们俩就都高潮了。[pg]");
         get_player().orgasm("Generic");
         dynStats(DynStat.Sens(-1));
         AmilyMiddleGradeSexOver();
      }
      
      public function pcBirthsAmilysKidsQuestVersion() : void
      {
         amilySprite();
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,162,FlagDict_Impl_.arrayReadInt(_loc1_,162) + 1);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,43) == 1)
         {
            playerBirthsWifAmilyMiceInCamp();
            return;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,162) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,40) >= 5)
         {
            outputText("你突然被肠胃里强烈的疼痛和压力痛醒。你猛地睁开眼睛，低头看到你的肚子异常饱满和肿胀。你能感觉到皮肤下的动静，看着它在许多地方被顶起，以令人不安的方式翻滚和蠕动。你从体内感受到的感觉同样令人不安。你数不清里面有一个还是许多个小东西在游动。太多了，你根本数不过来。[pg]");
            outputText("当它们强行拉开你的子宫颈时，一阵剧痛传遍全身，让你不由自主地大叫起来。就在这时，艾米莉突然出现，从灌木丛中跑了出来。[say: 时候到了吗？你要生了吗？] 她问道，声音里满是担忧。你的疼痛被惊讶暂时抛在脑后，你问她是从哪里来的。她对这个问题不屑地哼了一声。[say: 我已经跟踪你几天了。你真的以为我会让我孩子的母亲独自经历这些吗？][pg]");
            outputText("你刚想回答，又一阵宫缩带来的剧痛让你忍不住痛呼出声。艾米莉握住你的手，你紧紧抓住这根救命稻草，庆幸自己不用独自面对这一切。你能感觉到第一个孩子离开了子宫，穿过子宫颈，进入了你的[vagina]。你张开嘴，闷哼一声，将第一个孩子排到了艾米莉等候的手中。她把它举起来，让你看看你的第一个孩子；那是一只小老鼠");
            outputText((amilyFurry() ? "，光秃秃的，粉红色的，一根毛都没有" : "") + "。艾米莉帮你把它抱到你的[breasts]前，它急切地含住你的[nipple]开始吸吮。随着它的吸吮，它的身体开始变大" + (amilyFurry() ? "，和你头发颜色一样的毛发开始覆盖它的身体" : "") + "。它很快就吃饱了，然后松开了嘴，它的“父亲”把它放到一边。这很好，因为这时候已经有另一个婴儿在排队等候了……然后又是一个……又是一个……[pg]");
            outputText("很快，你又恢复了原来的样子，疲惫地躺在地上，艾米莉坐在你旁边，你那群吵闹的孩子们已经开始在你周围走动玩耍了。[pg]");
            outputText("[say: 休息一下吧，亲爱的。我们有些事情需要谈谈，] 艾米莉对你说道。[pg]");
            outputText("你很乐意照做，但在你陷入昏睡前，你脑海中闪过的最后一个念头是：艾米莉想谈什么呢？.");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,163,1);
            doNext(postBirthingEndChoices);
            return;
         }
         outputText("你突然被肠胃里强烈的疼痛和压力痛醒。你猛地睁开眼睛，低头看到你的肚子异常饱满和肿胀。你能感觉到皮肤下的动静，看着它在许多地方被顶起，以令人不安的方式翻滚和蠕动。你从体内感受到的感觉同样令人不安。你数不清里面有一个还是许多个小东西在游动。太多了，你根本数不过来。[pg]");
         outputText("当它们强行拉开你的子宫颈时，一阵剧痛传遍全身，让你不由自主地大叫起来。就在这时，艾米莉突然出现，从灌木丛中跑了出来。[say: 时候到了吗？你要生了吗？] 她问道，声音里满是担忧。你的疼痛被惊讶暂时抛在脑后，你问她是从哪里来的。她对这个问题不屑地哼了一声。[say: 我已经跟踪你几天了。你真的以为我会让我孩子的母亲独自经历这些吗？][pg]");
         outputText("你刚想回答，又一阵宫缩带来的剧痛让你忍不住痛呼出声。艾米莉握住你的手，你紧紧抓住这根救命稻草，庆幸自己不用独自面对这一切。你能感觉到第一个孩子离开了子宫，穿过子宫颈，进入了你的[vagina]。你张开嘴，闷哼一声，将第一个孩子排到了艾米莉等候的手中。她把它举起来，让你看看你的第一个孩子；那是一只小老鼠");
         outputText((amilyFurry() ? "，光秃秃的，粉红色的，一根毛都没有" : "") + "。艾米莉帮你把它抱到你的[chest]前，它急切地含住你的[nipple]开始吸吮。随着它的吸吮，它的身体开始变大，" + (amilyFurry() ? "和你头发颜色一样的毛发开始覆盖它的身体" : "") + "。它很快就吃饱了，然后松开了嘴，它的“父亲”把它放到一边。这很好，因为这时候已经有另一个婴儿在排队等候了……然后又是一个……又是一个……[pg]");
         outputText("很快，你又恢复了原来的样子，疲惫地躺在地上，艾米莉坐在你旁边，你那群吵闹的孩子们已经开始在你周围走动玩耍了。[pg]");
         outputText("[say: 看看它们。你……我从没想过事情会变成这样，但你正在帮我实现梦想。谢谢你，] 艾米莉真诚地对你说。你太累了，眼睛都睁不开了，但她答应会和你保持联系。就在你睡着的时候，她正在把你的孩子们聚拢起来带走。");
      }
      
      public function onAscend(param1:Boolean) : void
      {
         reset();
      }
      
      public function notSorryForImpaling() : void
      {
         clearOutput();
         dynStats(DynStat.Cor(10));
         outputText("艾米莉那婊子般的喋喋不休没完没了，没过多久你就受够了。在你大发慈悲放她一马，让自己的肉棒欲求不满之后，她居然就这么报答你？！你考虑了片刻，很快就知道该怎么让她闭嘴了。以连她都来不及反应的速度，你猛扑上前，双手抓住她的头。她只来得及发出一声惊愕的[say:啊？！]，你就猛地一挺，把她的脸狠狠地按向你坚硬如铁的肉棒。");
         outputText("[pg]起初只有龟头能勉强挤进她的嘴里，但她被这突如其来的袭击惊呆了，所以你轻而易举地就插了进去，把她的下巴撑得痛苦地大张着，将肉棒直接塞进她的喉咙，在她的脖子上顶出你龟头的形状。");
         outputText("[pg][say: 唔……！呜呜呜！]艾米莉试图弄清楚发生了什么，她那被堵住的尖叫声让她的喉咙在你的肉棒上美妙地摩擦震动。当你把肉棒插得更深时，她的舌头和嘴唇滑过你阴茎的皮肤，撑开了她整个脖子和胸腔，你的龟头在她的乳房上方凸显出来。");
         outputText("[pg]你双手捧着她的脸，肉棒深深插在她的喉咙里，几乎不费吹灰之力就把这个女孩按倒跪在地上。她刚才对你破口大骂时就已经喘不过气来了，现在你的肉棒又撑开了她的喉咙，她显然更是无法呼吸。尽管如此，她还是拼命地推着你的臀部，在无法拔出肉棒的情况下，只能对着它发出呜咽的呻吟。");
         outputText("[pg]她的喉咙紧致得不可思议，当她本能地挣扎着吞咽时，紧紧地挤压着你的肉棒。在你意识到自己在做什么之前，你的手指已经掐住了她的脖子前方，就像要掐死这个女孩一样，并插得更深了，一直插到了她的胃里。");
         outputText("[pg]与此同时，艾米莉很快意识到她无法从你的肉棒上挣脱。甚至连呼吸都做不到。从她绝望而沉闷的尖叫声来看，这个念头似乎让她陷入了恐慌，随着惊恐的泪水从她半睁半闭的眼睛里流下，她的意识开始模糊。但你才刚刚开始。");
         outputText("[pg]你紧紧掐住她的喉咙，双手在其表面来回抚摸，立刻感觉到同样的动作在从内部温柔地套弄着你的肉棒。这种快感让你插得更用力了，甚至顶过了女孩的胃，让她对着你的肉棒干呕反胃。你肉棒的粗度足以在穿过她的双乳之间时将它们强行撑开。");
         outputText("[pg]到现在，她正在迅速失去力气，你的每一次抽插都只能让这个哭泣、崩溃的鼠娘发出一声比一声微弱的闷哼。她已经放弃了从你的肉棒上挣脱，只能徒劳地挣扎着，试图掰开你掐住她喉咙的双手，但同样无济于事。随着你不断地进出，越来越深地操进艾米莉的身体，眼前的景象让你兴奋得几乎屏住了呼吸……你那根硬挺地从身下翘起的肉棒，竟然仅凭一己之力就把这个女孩完全悬空挑了起来。");
         outputText("你那根粗大肉棒的惊人尺寸已经远远超出了将她撑开的程度。在她的整个身体上，从喉咙一直到下腹部，你那" + get_player().cockDescript() + "的形状清晰可见，仿佛印在凸起的肉上一样。你塞进她喉咙里的肉棒比这个女孩的身体还要宽，还要粗，把她的身体撑得如此怪异，以至于她挂在肉棒形状身体上的脸和四肢是唯一能让人认出她是一个人的东西。");
         outputText("[pg]她的挣扎和踢打突然停止了，艾米莉的反抗开始完全平息。伴随着最后一声窒息的声响和惊恐的表情，她翻起了白眼，双臂和双腿无力地垂在身侧。看到她这副模样，足以让你彻底失控，伴随着最后一次冲刺，你达到了高潮，你的肉棒终于刺穿了她的另一端，将她的屁眼撑得大大的，然后拔了出来。");
         outputText("[pg]你在艾米莉的屁眼和嘴里进进出出，疯狂地在她的喉咙里抽插，享受着最后的快感。这婊子是罪有应得。");
         outputText("伴随着一阵湿润的水声，你开始把这个被玩坏的荡妇从你的肉棒上拔下来，但这相当费力。借着你精液的润滑，你又操了一轮她的喉咙，才终于把她从你的肉棒上拔了出来。她毫无形象地瘫软在地，缩成一团沾满精液的肉块，开始无声地抽搐。看着你的杰作，你心中充满了难以言喻的满足感，很快就沉入了心满意足的梦乡。");
         doNext(tooDeepAmilyLeaves);
      }
      
      public function notInterestedInDumbshitMouseBitches() : void
      {
         amilySprite();
         clearOutput();
         outputText("你冷冷地盯着她，告诉她你对和她发生那种程度的任何关系都不感兴趣。你决定出于怜悯让她把她的孩子种在你体内，但现在她不再需要你的子宫了，你不再打算把它租给她了。[pg]");
         outputText("艾米莉心碎地摇晃着，她的表情清楚地表明她的心碎了，眼泪顺着她的脸流下来。[say: 我……我不知道你对我是这种感觉。好-好吧，如果这就是这样……]她突然哭了起来，跑开了；你知道她永远不会回来了。[pg]");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,36,1);
         doNext(playerMenu);
      }
      
      public function meetAmilyAsACorruptAsshat() : void
      {
         amilySprite();
         clearOutput();
         outputText("出于对艾米莉近况的好奇，你回到了废弃的村庄。这一次，你没有费心隐藏自己的行踪，希望能更快地引起艾米莉的注意。毕竟，她确实说过这个地方除了她之外基本上空无一人，而你对付一只区区小恶魔或地精还是绰绰有余的。[pg]");
         switch(pregnancy.get_event())
         {
            case 1:
            case 2:
            case 3:
            case 4:
            case 5:
               outputText("艾米莉从废墟中现身，比平时慢了一些。你可以看到你们共同努力的结果已经显现；她的小腹明显隆起，微微撑起了她破烂的衬衫，并严重拉扯着她的腰带。她漫不经心地用一只手抚摸着它，似乎在向自己确认它的存在。[pg]");
               break;
            case 6:
            case 7:
            case 8:
               outputText("过了好几分钟艾米莉才出现——但当你看到她时，你惊叹于她能这么快赶到你身边。她的肚子肿胀得厉害，她的一只手甚至托在圆润的肚子下面，似乎想把它托起来。她没有穿裤子，显然她已经穿不下这条裤子了，因为她那圆滚滚的肚子，她的衬衫松松垮垮地垂着，勉强遮住上半身。她挂着吹箭筒和匕首的腰带被系在她的上胸部，在她的乳房和隆起的肚子之间，这样她仍然可以有效地携带它们。[pg]");
               break;
            default:
               outputText("没过多久，艾米莉就从废墟中现身了。她的吹箭筒和匕首分别插在腰带上，她仍然穿着和以前一样破旧的衣服。[pg]");
         }
         outputText("[say:嘿，[name]，你……还好吗？]她带着困惑的表情渐渐停住了话头。[say:你看起来不一样了……]她喃喃自语，专注地打量着你，然后她显然突然意识到了什么。[say:你接触过恶魔吗！？你……这种感觉……你被腐化了！]你朝她迈出一步，吓得她向后跳去。[say:不-不要！离我远点！]她大喊着，手飞快地伸向她的吹箭筒。她直接朝你吐了一支飞镖！[pg]");
         if(!get_player().hasPerk(PerkLib.Evade) && !get_player().hasPerk(PerkLib.Flexibility))
         {
            outputText("艾米莉突然的反应让你猝不及防，飞镖击中了你；几乎立刻你就感觉到身体变得僵硬。艾米莉甚至没有等看是否击中了你，就转身跑开了，并在你身后大喊。[pg]");
            outputText("[say:别再靠近我！你被污染了，毁了！]她的声音充满了恐慌，消失在废墟中。[pg]");
            outputText("过了将近两个小时你才恢复行动能力，当你一瘸一拐地走回营地时，你的关节仍然僵硬疼痛，你咒骂着那只老鼠。也许你应该教训她一下，让她知道惹你的下场。[pg]");
            if(get_player().get_inte() >= 40)
            {
               outputText("你开始制定一个计划，但要实施这个计划，你需要一瓶催情剂和一些地精麦酒。那只该死的老鼠会为她拒绝你的那一天感到后悔的。[pg]");
            }
            else
            {
               outputText("你想起了探索时找到的一些有趣的药水；也许你可以用上它们……...");
            }
         }
         else
         {
            outputText("尽管艾米莉反应很快，但还是比不上你训练有素的反射神经；你只是稍微弯了弯腰，飞镖就勉强擦过你。艾米莉甚至没等看清有没有打中你，就转身跑了，边跑边冲你大喊。[pg]");
            outputText("[say:别再靠近我！你被污染了，毁了！]她的声音充满了恐慌，消失在废墟中。[pg]");
            outputText("这个蠢货；她怎么敢在向你求助后又攻击你！就算你不再纯洁又怎样；你依然完全有能力帮她！也许你该教训教训她，让她知道你不是好惹的……？[pg]");
            if(get_player().get_inte() >= 40)
            {
               outputText("你开始制定一个计划，但要实施这个计划，你需要一瓶催情剂和一些地精麦酒。那只该死的老鼠会为她拒绝你的那一天感到后悔的。[pg]");
            }
            else
            {
               outputText("你想起了探索时找到的一些有趣的药水；也许你可以用上它们……...");
            }
         }
         dynStats(DynStat.Lust(25));
         doNext(get_camp().returnToCampUseOneHour);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,168,1);
      }
      
      public function maybeHermsAintAllBadBITCH() : void
      {
         amilySprite();
         clearOutput();
         outputText("你又一次发现自己在这个艾米莉出没的废弃村庄里游荡。你不太确定是否想和她说话，正准备转身离开时，你听到石头砸在墙上的声音。环顾四周，你发现艾米莉来到了你身边，看起来充满歉意。[pg]");
         outputText("[say: 我……我想说对不起。在那次谈话中，我真是个混蛋，但是……我见过太多其他人变异成扶她，变成了没有思想的性玩具，或者在变成扶她后满脑子只有性。我从来没有遇到过一个拥有两种性别，并且能思考除了阴道和阴茎以外的事情的人……直到我遇见你。][pg]");
         outputText("她刻意避开你的视线，微微脸红。[say: 我一直在思考，关于一些事情。关于我们。而且……好吧，即使你是个扶她，你也是我这些年来唯一的朋友。如果你能从心底原谅我……我希望你能成为我孩子的父亲。] 她盯着你，眼睛睁得大大的，充满希望。[say: 你觉得呢？][pg]");
         menu();
         addButton(0,"同意",beAmilysDadAsAHerm);
         addButton(1,"拒绝",fuckNoYouWontBeAmilysHermDaddy);
         if(amilyFurry())
         {
            addButton(2,"拒绝兽化",amilyNoFur);
         }
      }
      
      public function makeTheMouseAMilkCowMoo() : void
      {
         clearOutput();
         get_player().consumeItem(get_consumables().LACTAID);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,43) == 1)
         {
            outputText("[say: 催乳剂？你真的想尝尝老鼠奶吗？]艾米莉问道，有些不确定，又有些调皮。你点点头，保证你想尝尝。[say: 好吧，既然你坚持，]她宣布，从你手中接过粉红色的瓶子，喝下了里面的乳状液体。");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,43) == 2)
         {
            outputText("[say: 催乳剂？你真的想尝尝老鼠奶吗？]艾米莉诱惑地、有些调皮地打趣道。你点点头，保证你想尝尝。[say: 好的，我的[master]！]她宣布，从你手中接过粉红色的瓶子，喝下了里面的乳状液体。");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,51) == 0)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,47) < 3)
            {
               outputText("[pg]催乳剂起作用时非常明显；她" + Appearance.breastCup(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,47)) + "的乳房突然膨胀起来，肿胀成骄傲的C罩杯，乳汁从她的乳头自由流淌，让她的衬衫严重紧绷，并被乳汁浸透。她沮丧地尖叫了一声，然后跑开了，显然是想去清理一下自己。");
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,47,3);
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,47) >= 3)
            {
               outputText("[pg][say: 那么……这应该什么时候开始——呀！]她突然震惊地尖叫起来，因为她意识到自己的衬衫变湿了。她急忙拉开上衣，抓住滴水的乳房。[say: 我，我得去处理一下这个。]她解释道，脸红着跑开了。");
            }
            doNext(amilyFollowerEncounter);
         }
         else
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,43) == 1)
            {
               outputText("[pg]她迅速把乳房从上衣里拉出来；她不想弄脏自己。乳汁的珠子开始在她的" + amilyNipples() + "尖端形成，很快就变成了稳定的液流。[say: 给口渴的勇者更多奶水，嗯？]她打趣你。[say: 我要去处理一下这个……除非你想现在就帮我？]她颤声说道。");
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,43) == 2)
            {
               outputText("[pg]她迅速把乳房从上衣里拉出来；她不想弄脏自己。乳汁的珠子开始在她的" + amilyNipples() + "尖端形成，很快就变成了稳定的液流。[say: 给我的" + get_player().mf("主人","女主人") + "更多奶水，嗯？]她打趣你。[say: 我要去处理一下这个……除非你想现在就帮我？]她诱惑地颤声说道。");
            }
            doYesNo(takeChargeAmilyMouseMilk,amilyFollowerEncounter);
         }
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,51,FlagDict_Impl_.arrayReadInt(_loc1_,51) + 1);
      }
      
      public function makeChildren() : void
      {
         amilySprite();
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,166) == 1)
         {
            outputText("你问艾米莉是否介意现在重新开始吃草药。鼠娘窃笑着问，[say:生够孩子了，嗯？]然后她给了你一个会意的眨眼。艾米莉向你保证，[say:别担心，[name]，我们已经给这个世界带来了足够多的生命。我不介意休息一下。.]");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,166,0);
         }
         else
         {
            outputText("你对艾米莉露出迷人的微笑，告诉她你心里有一些不同的想法。你想和她再生一窝。[pg]");
            outputText("艾米莉看起来很惊讶。[say:你想要……孩子？我是说，更多的孩子？]她犹豫地问。你确认了，她看起来很高兴。[say:谢谢你……如果你真的想要，那我就停止使用那些草药避孕药。让我们看看接下来会发生什么……]她欢快地说着，用她的小" + (amilyFurry() ? "爪子" : "手指") + "在你的胸前漫不经心地画着圈。她转过身，摇着尾巴，急切地领着你走向巢穴。[pg]");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,166,1);
         }
         doNext(amilyFollowerEncounter);
      }
      
      public function makeAmilyAHerm() : void
      {
         amilySprite();
         clearOutput();
         outputText("你和艾米莉谈论你们是如何逐渐了解彼此的，以至于尽管她对扶她有反感，她还是愿意和你做爱。[pg]");
         outputText("[say: 这是真的……我……我不能说我能理解你那样的生活是什么样的，] 她承认道。[pg]");
         outputText("你问她是否愿意尝试从你的角度看问题——你碰巧有一瓶去除了腐化元素的梦魔药水。[pg]");
         outputText("她看起来非常紧张。[say: 我……我的意思是……我真的不想那样做。][pg]");
         outputText("你指出这对她的计划是最好的；这样，你们两个就能同时怀孕，所以她能比以前更快、更多地生孩子。你给了她一个迷人的微笑，轻轻握住她的手，问她是否愿意考虑一下；为了你？[pg]");
         outputText("艾米莉看起来很沮丧，然后终于慢慢地点了点头。[say: 我……我真的不确定，但是……如果是为了你，[name]，那么……我会做的。] 她接过药水瓶，不安地盯着它，然后拔掉软木塞，一口气迅速吞了下去。她浑身发抖——首先是对她实际喝下的东西感到厌恶，然后是快感。她狂喜地呻吟着，" + (pregnancy.get_event() >= 6 ? "掀起她的衬衫" : "脱下她的裤子") + "，让你清楚地看到她的阴蒂肿胀，变得更长更粗；最后，顶端的皮肤剥落，露出了毫无疑问是阴茎龟头的东西，当她体验到她第一次男性的高潮时，甚至还有一个喷出精液的裂口。[pg]");
         outputText("艾米莉现在变成了双性人。她那类似人类的阴茎有四英寸长，一英寸粗。[pg]");
         outputText("她喘着气，" + (pregnancy.get_event() >= 6 ? "试图越过她隆起的肚子看看她的新器官。当这失败时，她用手抚摸它，小心翼翼地触摸它，同时保持着一种难以捉摸的表情。然后她盯着你说，" : "带着一种难以捉摸的表情盯着她的新器官，然后她盯着你。") + " [say: 好吧，现在我有阴茎了……所以这意味着你要跟我来，让我试一试！][pg]");
         outputText("你同意了，并允许她开始带你去[say: 卧室。.]");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,45,4);
         FlagDict_Impl_.arrayWriteFloat(KFLAGS.flags,46,1);
         get_player().consumeItem(get_consumables().P_DRAFT);
         doNext(hermilyOnFemalePC);
      }
      
      public function load(param1:int, param2:*) : void
      {
         Utils.extend(saveContent,param2);
      }
      
      public function liqueurUpTheWaifus() : void
      {
         clearOutput();
         outputText("你鼓励乌尔塔多喝点，带着一种变态的愉悦感看着她开始猛灌烈酒。你小口抿着自己的酒，慢慢来，看着狐娘用酒精淹没她的烦恼。乌尔塔好几次试图和你们俩搭话，但每次她一开口，你就愉快地给她倒满酒，艾米莉也赶紧催促她喝。你看了鼠娘一眼，试图判断她对目前情况的反应：透过她眼中醉意的迷雾，你能看到她正用充满欲望的眼神直勾勾地盯着乌尔塔丰满的胸部。[pg]");
         outputText("没过多久，乌尔塔就在椅子上摇晃起来，她偶尔蹦出的几句话也随着时间的推移变得越来越下流。最终，让你大为高兴的是，艾米莉无意中露出的乳沟点燃了这头野兽。[pg]");
         outputText("砰！[pg]");
         outputText("桌子差点被顶翻。乌尔塔尴尬地喘了口气，艾米莉惊讶得差点从座位上跳起来。[say: 什——什么鬼东西！？]她尖叫道。还没等你回答，艾米莉就把头探到桌子底下——再抬起头时，脸已经红得像甜菜一样。[pg]");
         outputText("乌尔塔带着醉意的笑容笑了起来，[say: 噢，该死。抱歉，亲爱的，我以为[name]早就跟你说过我第三条腿的事了……]她探过身子，鼻子几乎要碰到艾米莉的鼻子，补充道：[say: 嘿……想试试吗？][pg]");
         outputText("有那么一瞬间，你不确定接下来会发生什么……然后乌尔塔淫荡地呻吟了一声，眼睛突然翻白。你往桌子底下一看，惊喜地发现艾米莉的手正紧紧握着乌尔塔那根跳动的马鸡巴。当艾米莉偷偷给乌尔塔打手枪，很快让狐娘颤抖扭动时，你说了几句鼓励的话。你向后靠去，点了点头");
         if(get_player().hasCock())
         {
            outputText("，已经感觉到你的[cocks]强烈地勃起]");
         }
         else if(get_player().hasVagina())
         {
            outputText("，已经感觉到你的下体有些湿润");
         }
         outputText("。[pg]");
         outputText("看到你的鼠娘爱人让狐娘高潮，你毫不掩饰自己的兴奋，温柔地建议你们三个去开个房间。[pg]");
         outputText("[say: 嗯，我还以为你永远不会问呢，]乌尔塔发出一声特别剧烈的颤抖，发出满足的呼噜声。[pg]");
         outputText("[say: 噢，听起来太棒了，]艾米莉附和道。[pg]");
         outputText("你咧嘴笑着，漫步走到吧台，租了一个房间，然后带着女孩们上楼。你自己也半醉了，跌跌撞撞地走上最后几级台阶，急忙打开房门。房间装饰简陋，只有一张大床。[pg]");
         outputText("乌尔塔和艾米莉倒在床上，已经开始脱衣服并互相挑逗——乌尔塔的手抚摸着");
         if(amilyFurry())
         {
            outputText("鼠娘的皮毛");
         }
         else
         {
            outputText("鼠娘的肌肤");
         }
         outputText("而艾米莉则用她柔软的小尾巴缠绕着乌尔塔巨大的阳具。你脱下你的[armor]，居高临下地看着女孩们，决定你要怎么做。");
         if(get_player().hasCock())
         {
            addButton(0,"用肉棒",threesomeAmilUrtaCAWKS);
         }
         if(get_player().hasVagina())
         {
            addButton(1,"用小穴",urtaXAmilyCuntPussyVagSQUICK);
         }
         addButton(4,"算了",get_camp().returnToCampUseOneHour);
      }
      
      public function letAmilyLead() : void
      {
         amilySprite(true);
         clearOutput();
         outputText("你什么也没说，只是对她咧嘴一笑。过了一会儿，艾米莉意识到你想让她做什么（或者你向她提供了什么）。她微微脸红，但随后也回以一个微笑，然后抓住你的手，带你走向她的巢穴。你不太确定，但你觉得你注意到她脚步轻快——她的尾巴似乎也有了自己的想法，来回摆动，偶尔抚摸你的[leg]。[pg]");
         var _loc1_:int = get_player().cockThatFits(61);
         var _loc2_:Array = [];
         if(get_player().hasCock())
         {
            if(_loc1_ == -1)
            {
               outputText("艾米莉低头看了看你双腿间的巨兽，说道：[say: 我本来想骑你的，但既然你这么大，我想我得发挥点创意了……][pg]");
            }
            else
            {
               _loc2_[int(_loc2_.length)] = 3;
               if(pregnancy.get_isPregnant())
               {
                  _loc2_.push(6);
               }
            }
            _loc2_[int(_loc2_.length)] = 0;
            _loc2_[int(_loc2_.length)] = 1;
         }
         _loc2_[int(_loc2_.length)] = 2;
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) > 0)
         {
            _loc2_[int(_loc2_.length)] = 4;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) > 0 && get_player().hasVagina())
         {
            _loc2_[int(_loc2_.length)] = 5;
         }
         var _loc3_:Number = int(_loc2_[Utils.rand(int(_loc2_.length))]);
         if(_loc3_ == 0)
         {
            outputText("在她的巢穴里，艾米莉转过身来，伸出双臂抱住你，饥渴地吻着你。她似乎不打算很快停止这个吻，但你觉得没关系。尽管如此，你迟早需要呼吸，所以你退后一步，大口喘气，注意到艾米莉眼中的光芒和灿烂（而且相当调皮……）的笑容。被拉入另一个吻中，你开始想知道这个鼠娘到底在计划什么。[pg]");
            outputText("突然，你几乎跳了起来，因为你感觉到有什么东西[if (isnaked){滑过你的[skinshort]|进入你的[armor]}]——感觉就像一条蛇或什么东西，但随后你意识到那是艾米莉的尾巴，现在正缠绕在你的[cock]上。你睁大眼睛，惊讶地看着她，她开始有条不紊地收紧和放松尾巴对你阴茎的抓握。[pg]");
            outputText("你绝对想不到这个小鼠娘会做这种事——你也绝对想不到这感觉会这么好。果然，你很快就感觉到自己达到了[say: 无法回头的地步，] 但任何试图告诉她你无法再坚持多久的尝试都因为她持久的亲吻而变得徒劳。你很确定她在嘲笑你的窘境——她可能早就计划好让这种事发生了。你在心里耸了耸肩，决定顺其自然，以后再担心。所以你试着放松（在艾米莉给你做不可思议的尾交时，尽可能地放松……）并享受这种感觉。果然，没过多久她终于让你高潮了。打破了吻，她退后一步，带着灿烂的笑容问道：[say: 你喜欢吗，你这个调皮的" + get_player().mf("男人","女孩") + "？][pg]");
            outputText("自然，你告诉她你非常喜欢，艾米莉微笑着帮你清理干净。[say: 如果你那么喜欢的话……] 她回头说道，并在去处理其他事情时对你眨了眨眼。[pg]");
            doNext(get_camp().returnToCampUseOneHour);
            get_player().orgasm("Generic");
            dynStats(DynStat.Sens(-1));
            return;
         }
         if(_loc3_ == 1)
         {
            outputText("一旦你到了她的巢穴，艾米莉让你坐下，并跪在你面前。她俯身热情地吻你，但你能感觉到她的手在你的[if (isnaked){[skindesc]|[armor]}]上忙碌。退后一步，鼠娘对你微笑，她的手拉出你的[cock]并开始抚摸它。你微微颤抖，向后靠去，享受艾米莉的服侍。你知道她很灵巧，但你绝对想不到……你因为感到的快感而微微颤抖，半闭着眼睛。[pg]");
            outputText("突然，你的眼睛再次猛地睁开，你带着几分失望看着艾米莉，因为她收回了手。[say: 怎么？你以为我只会用手对付你吗？] 她坐下时问道。[say: 再次闭上眼睛！] 她要求道。虽然不太确定她心里在想什么，你还是照做了。过了一会儿，你感觉到你的[cock]上还有其他东西。你微微睁开一只眼睛，意识到艾米莉现在正在用她的脚。你微笑着再次闭上眼睛，只是享受这种感觉。鼠娘继续用脚抚摸你的阴茎一段时间，然后又换回手。在它们之间交替（有时同时使用手和脚），艾米莉很快让你在愉悦的呻吟中高潮。再次睁开眼睛，你微笑着向她道谢。[pg]");
            outputText("看着她沾满你精液的手和脚，艾米莉开玩笑地指责你强迫她再次清理自己，仅仅是因为你没有控制力。当鼠娘轻轻舔了舔她的一只手并评论道[say: 嗯……其实还不错……]时，你的眼睛惊讶地睁大了一点。带着笑容，她清理了手足交的结果，然后再次把你拉起来。[say: 回去工作吧，勇者！][pg]");
            outputText("带着满意的微笑，你转向其他事情。");
            doNext(get_camp().returnToCampUseOneHour);
            get_player().orgasm("Generic");
            dynStats(DynStat.Sens(-1));
            return;
         }
         if(_loc3_ == 2)
         {
            outputText("一到巢穴，艾米莉就把你推倒仰面躺下。你躺在柔软、散发着甜香的植物堆里，看着她脱去衣物。接着，出乎你意料的是，她猛地扑到你的胸口，跨坐在你的脖子上，让你直接面对着她的小穴。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) > 0)
            {
               outputText("她的肉棒在你的视野中欢快地晃动着。");
            }
            outputText("[pg]");
            outputText("[say:你的舌头可真甜，你知道吗？]艾米莉咯咯地笑着。[say:让我看看它到底有多甜……][pg]");
            outputText("你不需要任何进一步的催促；你张开嘴，向前探出身子，伸出舌头试探性地舔了舔她的小穴。艾米莉情不自禁地因为这种感觉而娇喘了一声，受到鼓舞的你开始更加热情地舔舐，用舌头扫过她每一寸阴唇。[pg]");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) > 0)
            {
               outputText("[say:你能……你能舔舔它吗，求你了？]她低声说道，指着她多出来的男性器官。为了让她开心，你亲吻了她阴茎的顶端，引得她发出一声震惊的尖叫，然后你开始从她的" + amilyCock() + "根部一直舔到顶端。接着，你把注意力重新放回她的阴道上。[pg]");
            }
            outputText("[say:对，对，对，就是这样！哦哦！]艾米莉在你的服侍下尖叫着，在快感中扭动挣扎。你能感觉到她的淫液开始顺着内壁流下，又热又咸；你开始将舌头探入她的阴户深处，抚摸她最娇嫩的部位。伴随着一阵颤抖和尖叫，当你把舌头尽可能深地滑入时，她高潮了，她的淫液淹没了你的嘴，溅到了你的脸上。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) > 0)
            {
               outputText("她的阴茎也随之爆发，将精液喷洒到半空中，落在你们俩身上。");
            }
            outputText("[pg]");
            outputText("她仰面瘫倒在你的肚子上，大口喘着粗气，把她的胯部留在了你的脖子上。终于，她缓过神来，坐起身，拖着她湿润的小穴");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) > 0)
            {
               outputText("以及软趴趴的肉棒");
            }
            outputText("划过你的胸膛。她调整了一下姿势，趴在你身上，与你四目相对。[say:你总是知道怎么让女孩子觉得自己很特别，对吧？]她轻柔地说道。接着她吻了你，将舌头深深探入你的口中，好好品尝了一番她自己的爱液，然后从你身上扭动着爬起来，抓起裤子开心地跑开了。你目送她离去，然后把自己清理干净。[pg]");
            doNext(get_camp().returnToCampUseOneHour);
            dynStats(DynStat.Inte(0.25),DynStat.Lust(10));
            return;
         }
         if(_loc3_ == 3)
         {
            outputText("一到巢穴，艾米莉就把你推倒仰面躺下。你躺在柔软、散发着甜香的草木中，看着她脱去衣物。接着她开始执着地拉扯你的[armor]，你也扭动着身体配合她。很快，");
            if(get_player().totalCocks() > 1)
            {
               outputText("每一根");
            }
            outputText("[cocks]都暴露了出来，并迅速勃起。她用一只手抚摸着它。[say:哦，你很渴望这个，不是吗？]她调侃道。[pg]");
            outputText("你没有否认，带着渴望呻吟着点了点头。[pg]");
            outputText("[say:好吧，看看我能不能不辜负你的期望……]她发出呼噜声（考虑到她是一只老鼠，这画面有些奇怪）。她用一只手抚摸你的[cock]，然后亲吻了顶端。她开始舔弄它，绵长、挑逗、沾满唾液的舔舐让你舒服得呻吟起来，很快就把它彻底润滑了。接着，她毫不迟疑地跨坐在你身上，动作熟练地将自己插了进去。这种感觉让她大声尖叫起来，但考虑到她那张老鼠脸上灿烂的笑容，她显然一点也不觉得疼。[pg]");
            outputText("[say:嗯……你下面感觉真好，你知道吗？]她挑逗着你，开始在你身上抽插研磨。你也开始挺动腰身回应她，却被她猛地按倒在地板上。[say:不行！坏孩子！]她厉声说道，尽管她的笑容和调皮的眼神清楚地表明她只是在闹着玩。每当你试图参与时，她就会停下来训斥你，所以你只能被迫躺在窝里，在诱惑和快感中呻吟，任由艾米莉诱人地在你身上研磨、抽插、挺动——但只能按照她喜欢的节奏，把你带到高潮的边缘，然后停下来，直到你的快感开始消退时才再次开始。她高潮了不止一次，却一直让你在边缘徘徊，直到最后，她大发慈悲，让你射进她那湿滑的小穴里。[pg]");
            outputText("在这最后的高潮中，她与你一同放声大叫");
            if(get_player().cumQ() > 500)
            {
               outputText("，你喷涌而出的精液让她的肚子肉眼可见地鼓了起来");
            }
            outputText("，然后瘫倒在你的胸前。你们躺在一起，手臂不自觉地缠绕着彼此。艾米莉是你们中第一个有动静的。[say: 你……你高兴吗，我在这里？]你向她保证你很高兴。[say: 那就好……]她打了个哈欠。[say: 因为我很高兴能和你在一起。][pg]");
            outputText("筋疲力尽的你觉得有必要小睡一会儿。当你醒来时，你独自一人在巢穴里，但艾米莉就在附近；她递给你一些食物，然后指引你去溪流的方向洗漱。[pg]");
            amilyPreggoChance();
            doNext(get_camp().returnToCampUseOneHour);
            get_player().orgasm("Generic");
            dynStats(DynStat.Sens(-1));
            get_player().refillHunger(5);
            return;
         }
         if(_loc3_ == 4)
         {
            outputText("一到巢穴，艾米莉就把你推倒仰面躺下。你躺在柔软、散发着甜香的植被中，看着她脱去衣服。然后，令你惊讶的是，她扑到你的胸口，跨坐在你的脖子上，让你与她半勃起的肉棒面对面。她扭动着她的" + amilyHips() + "，看着你的目光追随着她阴茎的顶端，咧嘴笑了。[say: 现在，我记得，我长出这东西都是你的错……]她调皮地说。[say: 而现在它开始觉得真的需要一些……关注。所以，如果那个让我长出它的人给它关注，那不是最好的吗，嗯？][pg]");
            outputText("你对着她坏笑，因为她骗不了任何人，然后向前倾身，吞下了" + amilyCock() + "的头部。当你开始舔舐和吸吮她的扶她器官时，艾米莉震惊地喘着粗气。[say: 你……你真的不怕这个吗？]她低语着，随着你变得更加大胆，开始舔舐柱身，尽力吞下它全部的" + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) + "英寸，她发出轻柔的呻吟。[pg]");
            outputText("缓慢地，不确定地，艾米莉开始前后抽插，将她的老鼠扶她肉棒推入你的嘴里再拔出，尽可能深地进入。在感受到她那异样的性器官和你火热湿润的口腔带来的感觉时，她发出轻柔的吱吱声和呜咽声，开始加快抽插的速度。她那咸甜的预先分泌液的味道开始刺激你的舌头，你开始更用力地吸吮和舔舐，尽力让她获得尽可能多的快感。[pg]");
            outputText("也许你比你想象的更擅长这个，或者也许艾米莉只是不擅长控制她第二性征器官带来的感觉，因为似乎没过多久，她就发出一声高亢的吱吱声，一股老鼠扶她的精液充满了你的嘴。又热又咸，但有一种你无法解释的余味，一种让你想起艾米莉本人的味道。你不假思索地吞下了它，它似乎在你的食道里烧出了一条痕迹。[pg]");
            outputText("艾米莉的肉棒从你的嘴里弹了出来，她瘫倒在你的胸口，" + amilyTits() + "起伏着，大口喘着气。[say: 那……那是……]她咽了口唾沫，再次尝试。[saystart]那就是那种感觉吗？");
            if(get_player().hasCock())
            {
               outputText("当我为你做那个的时候？[sayend][pg]");
            }
            else
            {
               outputText("对一个男人来说？[sayend][pg]");
            }
            outputText("你不确定地耸了耸肩。慢慢地，艾米莉坐起来，从你身上下来。[say: 我……嗯……谢谢你，]她说，然后迅速偷吻了你一下，跑开了。她走得太匆忙了，以至于在你告诉她她把裤子落下了之前，她就已经跑到了营地的另一边。");
            doNext(get_camp().returnToCampUseOneHour);
            dynStats(DynStat.Inte(0.25),DynStat.Lust(10));
            return;
         }
         if(_loc3_ == 5)
         {
            outputText("一到巢穴，艾米莉就把你推倒仰面躺下。你躺在柔软、散发着甜香的植被中，看着她脱去衣服。然后她开始坚持不懈地拉扯你的[if (isnaked) {手臂|[armor]}]，你扭动着身体帮助她。很快，你们俩都赤身裸体，艾米莉后退了一步，抚摸着她的" + amilyCock() + "。[pg]");
            outputText("[say: 我是因为你才有了这个，所以你欠我一个使用它的机会，]她说。[pg]");
            outputText("你对她笑了笑，张开你的[legs]，让她充分看清你的[vagina]，对着她坏笑，作为一种来拿它的鼓励。从她自己的坏笑，以及她炫耀的完全勃起的阴茎来看，你知道她即将尽可能多地得到它。[pg]");
            outputText("艾米莉将自己置于你的双腿之间，开始抚摸你的[vagina]；不用说，她从自己自慰的努力中获得的技巧和经验很快就让你在快感中挺动，用你自己的女性体液润滑了你的通道。");
            if(get_player().hasCock())
            {
               outputText("她抚摸了你的[cock]几次，但只是敷衍了事；很明显，这次她把注意力集中在自己的阴茎上。");
            }
            outputText("[pg]");
            outputText("一旦你湿润到符合她的口味，艾米莉就把她的老鼠扶她肉棒插入了你。");
            get_player().cuntChange(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) * FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,46),true,false,true);
            if(get_player().looseness() >= 4)
            {
               outputText("你太大了，几乎感觉不到它，但艾米莉决心无论如何都要尽可能地享受快感。");
            }
            else
            {
               outputText("你在快感中喘息，尽力用你的阴唇夹紧艾米莉的肉棒。");
            }
            outputText("[pg]");
            outputText("[say:我简直不敢相信我居然把肉棒插进了另一个女人的小穴里……但是，我得承认，这感觉真的很棒，即使这也确实很奇怪。]艾米莉喃喃自语道，但随后她开始做你认为真正重要的事情，她开始在你的体内抽插。你用[legs]环绕住艾米莉的背，把她紧紧拉向你，急切地迎合着她的每一次抽插。她因为你的努力而呻吟喘息，用尽全力猛干你的小穴，");
            if(get_player().wetness() >= 5)
            {
               outputText("多亏了你小穴的湿润，发出了清晰的黏腻水声，");
            }
            outputText("尽她所能让你在她的身下挺动扭曲，你觉得她做得非常出色。[pg]");
            outputText("你们一起翻滚抽插，臀部狂野地撞击在一起，直到艾米莉突然发出一声响亮而低沉的闷哼，她滚烫的扶她精液从她身体深处涌出，开始喷射进你的体内。就在那一刻，你也失控了，你自己的体液倾泻而出，与她的混合在一起，从你的[vagina]流出]");
            if(get_player().hasCock())
            {
               outputText("，[eachcock]喷射出精液，像充满性爱气息的雨一样落在你们俩身上");
            }
            outputText("。伴随着你们共同的高潮释放，艾米莉喘息着，湿漉漉地从你的下体滑落，倒在你的肚子上休息了片刻。[pg]");
            outputText("她慢慢地抬起头，深情地在你的嘴唇上啄了一下。[say:谢谢你，]她只说了这一句，然后继续和你躺了一会儿。接着她站起身走开了，你也跟着起身离开。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,166) == 1)
            {
               get_player().knockUp(11,350);
            }
            get_player().orgasm("Generic");
            dynStats(DynStat.Sens(-1));
         }
         else if(_loc3_ == 6)
         {
            outputText("想了一会儿，你告诉艾米莉，今天你们俩做什么由她来决定。");
            outputText("[pg]鼠娘回应了你一个俏皮的微笑，同时将一只手放在她因怀孕而沉甸甸的腹部上。她不慌不忙地开始脱去上衣，将她那" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,47) > 3 ? "丰满的" : "娇小的") + "双乳暴露在你充满欲望的注视下。接着，女孩慢慢扭动着褪下她的" + (FlagDict_Impl_.arrayReadString(KFLAGS.flags,52) == "a naughty nurse\'s outfit" ? "短裙" : (FlagDict_Impl_.arrayReadString(KFLAGS.flags,52) == get_armors().S_SWMWR.get_shortName() ? "泳裤" : "裤子")) + "，她那长鞭一样的尾巴可爱地甩动着，转过身并弯下腰，向你展示她那形状优美的臀部。你甚至能看到鼠娘那闪烁着水光的入口，它已经急不可耐地等待着你再次进入。艾米莉心领神会地回头瞥了一眼，显然能看出来，仅仅是看到她，你的血液就已经急切地涌向了你那饥渴的下半身。");
            outputText("[pg]当鼠娘完全赤裸后，她[if (!isnaked) {慢慢地脱下你的[armor]，同时}]深情地吻了你一次又一次。你将可爱的恋人拉近，她高高隆起的孕肚紧紧贴着你。当你同样热情地回吻艾米莉时，你将一只手放在鼠娘的肚子上，充满关爱地抚摸着。每次你轻轻抚摸她隆起的腹部时，都能感觉到你们未出生的孩子在里面欢快地动弹。从你感觉到的动静来看，她怀的肯定不止一个孩子。艾米莉凝视着你的眼睛，甜蜜地将她的手覆在你的手上。她脸上的笑容让你觉得，她很高兴能为你孕育更多美好的孩子。");
            outputText("[pg]你的爱人甜蜜地牵起你的手，将你引到她的巢穴，温柔地请求道：[say:你能为我躺下吗，[name]？]你顺从了她的意愿，在她铺作床铺的各种干草和散发着清香的草药上舒服地躺下。等你躺好后，鼠娘便跨坐在你身上，你的肉棒每次在她渴望的穴口滑过时，都会沾满她的爱液。[say:我不会太重吧？]她有些担忧地问道。你向艾米莉保证她一点也不重，这让她美丽的脸庞上绽放出了可爱的笑容。");
            outputText("[pg]当你感觉到艾米莉细长的尾巴缠绕在你的[cock]上时，一阵突如其来的战栗迅速窜上你的脊背。她用尾巴小心翼翼地将你的肉棒对准她泥泞的入口，调整角度好让你的[cockhead]能轻松滑入。你能听到自己的心脏在耳边怦怦直跳，满心期待着沉入爱人准备就绪的身体的那一刻。当鼠娘缓缓压下臀部，让你完全贯穿她湿润的私处时，你和艾米莉都发出了一声淫荡的呻吟。她小穴的内壁欢迎着你入侵的肉棒，贪婪地紧紧包裹着你，仿佛已经在乞求你温暖的精液。你的肉棒[if (cocklength > 8) {轻松地顶到了艾米莉的子宫颈，让鼠娘浑身一颤|完全没入了鼠娘的深处，在她美妙的肉褶间摩擦刮蹭着}]。}].");
            outputText("[pg]艾米莉与你十指紧扣，拼命地摇晃着腰肢，试图满足你。看着她" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,47) > 3 ? "丰满的" : "适中的") + "双乳和因怀孕而隆起的腹部随着她臀部不规则的运动而淫靡地晃动，你的肉棒兴奋地跳动着，渴望着更多。当她小穴里细密的肉褶紧致地摩擦着你的柱身时，你发出了沉重的欢愉呻吟。[if (cocklength > 8) {艾米莉甚至用尾巴缠住你的肉棒，帮着套弄那些没能塞进她美妙私处的部分。}]情欲的本能驱使你兴奋地挺起[hips]来配合艾米莉的动作，每次你用力挺进时，鼠娘的爱液都会发出淫靡的咕叽声。当你的肉棒几乎完全滑出她的穴口时，你能看到你的性器上闪烁着她的蜜汁，然后你又轻松地将其狠狠插回原处。艾米莉脸上泛着红晕，狂喜地呼喊着你的名字，在极乐中大口喘息着。");
            outputText("[pg]你能感觉到艾米莉的小穴紧紧地绞着你的[cock]，当你急切地冲向那甜蜜的释放时，你的[if (hasballs), {[balls]|腹部}]也随之一紧。你的猛烈撞击让艾米莉在肉欲的欢愉中发出吱吱的叫声和喘息。鼠娘继续为你拼命地摇晃着臀部，渴望激起你的闷哼和愉悦的呻吟。将你的[cockhead]抵在[if (cocklength > 8) {她的子宫颈|她湿润肉褶的每一处}]摩擦，当你的精液涌过敏感的肉棒时，你发出了一声满足的呻吟。当艾米莉感觉到你的精液涌入体内时，她狂喜地呻吟出声，她颤抖的私处内壁贪婪地榨取着你，仿佛要榨出无数股你[if (virility >= 15) {充满活力的}]精液。如果她不是已经怀孕了，你敢肯定你现在又会制造出一窝可爱的小老鼠。当你终于发泄完毕后，你温柔地将疲软的肉棒从你完美的鼠娘妻子体内抽出。");
            outputText("[pg]小心翼翼地将艾米莉从你身上移开，你用一只手臂环住鼠娘，将她拉近，享受着幸福的拥抱。她在你的脸颊上啄了一下，在你耳边低语道：[say:我爱你，[name]。]作为对这温柔举动的回应，你也向艾米莉表达了你对她的爱意。你们俩继续亲吻、拥抱、抚摸着彼此，直到你依依不舍地决定必须离开她的身边。");
            get_player().orgasm("Dick");
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function layEggsInAmilysCorruptedHole() : void
      {
         clearOutput();
         amilySprite(true);
         outputText("在艾米莉抚摸你的身体时，你仍在呻吟，你确保紧紧抓住她的腰，然后突然将她拉倒在地上。当你倒下时，她发出一声尖叫，尽管她的手并没有离开你的护腿。你仰面躺着，艾米莉用她空闲的手臂撑在你的胸前，试图皱眉，但却无法掩饰嘴角的俏皮微笑。");
         outputText("[pg]你开始解开她的裤子，而她也解开了你的护腿，将它们拉下来，露出你[if (hasCock) {坚硬如铁的肉棒}][if (isHerm) {和你}][if (hasVagina) {肿胀的小穴}]");
         if(get_player().get_gender() == 0)
         {
            outputText("平坦的下体");
         }
         outputText("，你鼓胀的产卵管也同时完全露了出来。");
         outputText("[pg][say:看来有人很兴奋；你一定很喜欢用卵填满我的想法。] 艾米莉的声音很俏皮，她的手指划过你的小腹，让你沉浸在幸福之中，同时她避开了抚摸你饥渴的下体。然而，当你终于脱下她的护腿时，很明显她和你一样准备好了，看到她泛红的阴唇闪烁着湿润的光泽");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) > 0)
         {
            outputText("和她勃起的肉棒在空气中颤抖着跳动");
         }
         outputText("告诉你一切。你问她是否确定她不是在投射自己的想法，鼠娘羞得满脸通红，腼腆地点了点头，脸上绽放出端庄的微笑。");
         outputText("[pg]随着她红润的阴唇");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) > 0)
         {
            outputText("和坚挺的肉棒");
         }
         outputText("暴露在外，艾米莉将自己置于你的臀部下方，轻轻地坐在你的大腿上，她紧实的脸颊靠在你充满卵的腹部。当她的尾巴掠过敏感的表面时，你喘着粗气，然后它轻轻地缠绕在你湿滑、隐隐作痛的产卵管上。当她对你肉棒的压力增加时，她对你假笑，将你的喘息变成了一声长长地、拖长的呻吟，让你在空气中徒劳地挺动，你的身体因狂喜而颤抖。");
         outputText("[pg]你抓住她的腰，将她固定在原位，同时试图调整你昆虫般下半身的位置。当你的产卵管在她的臀瓣之间摩擦寻找入口时，艾米莉呻吟着，她的下半身因这意想不到的接触而向前猛冲。她火热的性器湿漉漉地压在");
         if(get_player().get_gender() > 0)
         {
            outputText("你的性器上");
         }
         else
         {
            outputText("你的腹股沟上");
         }
         outputText("伴随着她臀部的扭动，结合的瞬间让你们俩都叫出了声。她低头看着你，双眼因快感而半闭，手臂颤抖着撑在你的胸膛上。她咬着嘴唇，开始认真地研磨起来，尽可能用力地将自己压向你，每一次挺动时，她的臀部都挑逗地摩擦着你的产卵管。");
         outputText("[pg]你的产卵管现在简直在喷涌液体，每次她紧致的屁股滑过时，都会在艾米莉的臀部上覆盖一层浓稠的粘液。");
         if(get_player().hasCock())
         {
            outputText("你无法克制自己，抓住她的臀部将它们抬起，渴望尽可能深地埋入她的体内。当你的[cockHead]擦过她湿润的入口时，她发出一声呻吟，手顺着身体滑下为你调整位置。当她的手握住你的阴茎时，你的呼吸卡在喉咙里，随着她扭动臀部迎合你，将你的顶端压向她慢慢撑开她的阴唇，这呼吸化作了沙哑的呻吟。当快感席卷全身时，你只能大口喘息，咬紧牙关试图阻止自己叫出声来，而艾米莉的爱液浸透了你的整根肉棒");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) > 0)
            {
               outputText("，她的肉棒渗出浓稠的预精液，顺着她的阴茎流下，随着她贴着你移动，涂抹在你的肉棒上");
            }
            outputText(".");
         }
         else if(get_player().hasVagina() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) == 0)
         {
            outputText("她湿透的小穴不断压向你的，淫液涂抹在你们俩身上，让你们都因快感而颤抖。你的产卵管疯狂地抽搐着，你在泥土中胡乱抓挠，艾米莉每一次撞击你那被欲望逼疯的身体，你都会发出语无伦次的呻吟。她坚硬的小阴蒂突然滑入你的阴唇之间，顺着你的缝隙向上滑动，直到弹在你同样坚硬的阴蒂上，这排山倒海般的快感让你们俩都浑身发抖。");
         }
         else if(get_player().hasVagina())
         {
            outputText("当她挑逗你时，你舒服地叫出声来。她肉棒的顶端在你的入口处滑动，撑开你的阴唇包裹住她的龟头。当她的阴茎将清液滴入你的体内时，你扭动着身体，感受着下体蔓延的温暖。随着你臀部的每一次动作，浓稠的白浊涂抹在你的小穴上。它用热度沐浴着你的阴蒂，流遍全身的颤栗迫使你抓紧艾米莉的大腿，随着她的抽插变得更加用力且杂乱，一声呻吟从她的唇间滑落。");
         }
         else
         {
            outputText("当你的肉棒摩擦着她时，她呻吟起来。每次你过度敏感的伪根擦过她的臀部时，她对着你平坦腹股沟的抽插速度就会加快。随着她臀部的每一次扭动，她的淫液溅满了你的下半身");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) > 0)
            {
               outputText("，她的肉棒用浓稠的清液覆盖了你的小腹");
            }
            outputText("，抽插变得越来越快，越来越重。你和你的爱人同步地沙哑喘息着，双手滑过她的臀部抓住她的臀瓣，试图将你跳动的肉棒沉入她的体内。");
         }
         outputText("感觉到你");
         if(get_player().hasCock())
         {
            outputText("艾米莉因为这突如其来的动作向前一倾，你抓住机会，用你的[cock]刺穿了她紧致湿润的入口。当她顺着你的肉棒沉下身体时，你们俩都在极乐中叫出声来。她的肉道几乎要烫伤你过度敏感的肉棒，同时她的双臂环住你的脖子，将自己拉近你。");
         }
         else if(get_player().hasVagina() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) > 0)
         {
            outputText("艾米莉对你无法控制的痉挛做出反应，突然向前一扑，她的肉棒猛地刺入你，让你忍不住发出一声绝望的娇呼。她也给出了回应，发出一声压抑的呻吟，瘫倒在你身上，她的臀部开始疯狂地向你颤抖的[vagina]挺进。].");
         }
         else
         {
            outputText("当艾米莉瘫倒在你身上时，你呻吟出声，她的双臂环住你的脖子，胯部更加用力地压向你。当她低吼时，你们的目光交汇，她的下半身带着绝望的渴求在你的身上起伏，你的腹部紧绷，身体因欲望而泛红。");
         }
         outputText("[pg]你的腹部几乎像是自己动起来一样，猛地顶向艾米莉，你胀痛的产卵管深深地陷入了她的屁股。上面覆盖的浓稠黏液让这根粗壮的管子几乎埋入她体内一半，随后她才条件反射般地夹紧了你。当你滑入她体内更深处时，你发出了低吼，");
         if(get_player().hasCock())
         {
            outputText("你感觉到她的通道紧紧夹住了你的管子，她的身体颤抖着，在你上方轻声呜咽。");
         }
         else if(get_player().hasVagina())
         {
            outputText("她的抽插微微停顿，她的肉棒在你体内抽搐，随着你的产卵管填满她的身体，当她滚烫的肉棒摩擦着你的肉壁时，因快感而微微颤抖。");
         }
         else
         {
            outputText("她的身体更加急切地撞击着你，每一次撞击都让你溅上更多她的淫液，她呻吟着，感叹你把她填得有多满。");
         }
         outputText("[pg]你又爆发出一声呻吟，因为她的肉道");
         if(get_player().hasCock())
         {
            outputText("颤抖着");
         }
         else
         {
            outputText("颤抖着");
         }
         outputText("缠绕着你，感觉到第一颗（肯定会有很多颗）卵正慢慢进入她的体内。当你的产卵管微微隆起，挤过她紧致的后庭时，一声特别响亮的呜咽将你从情欲的迷雾中唤醒，但你感觉到还有更多的卵在路上。每一颗卵都引得女孩发出一声低吟，她继续在你身上摩擦，你们俩的胯部渐渐被黏液和体液的混合物弄得湿滑。");
         outputText("[pg]你的双手最终摸到了她的脸颊，你一边把卵塞进女孩体内，一边把玩着她的脸颊，揉捏着，同时把她更紧地拉向你，你们俩都因为缓慢的产卵节奏而发出愉悦的呻吟。");
         outputText("[pg]没过多久，饱胀感就完全淹没了艾米莉，她的身体在性高潮的冲击下颤抖着。你呻吟着，因为");
         if(get_player().hasCock())
         {
            outputText("她的小穴痉挛着夹紧了你的肉棒，这种感觉把你和她一起推向了高潮的边缘，你的臀部挺进她紧致的通道，用精液填满她。她因为你给她的双重填塞而高兴地颤抖着，在你的怀里放松下来，你们俩都沉浸在快感的余韵中。");
         }
         else if(get_player().hasCock() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) > 0)
         {
            outputText("她用滚烫的精液淹没了你的[vagina]，双臂紧紧搂住你的脖子，尽可能紧地贴着你，她的肉棒在喷发时跳动着。她每一次喷射都发出尖锐的咕哝声，尽可能多地把精液塞进你紧致的穴里，即使你正把一颗又一颗的卵塞进她的后庭。这阵感觉把你推向了高潮的边缘，你的胃部紧绷，双腿缠住艾米莉，把她压在你身上，徒劳地在她身上耸动，你的小穴随着每一次动作而颤抖。");
         }
         else
         {
            outputText("她的臀部最后一次撞向你的臀部，你们俩同时达到顶峰，身体颤抖着。你感觉到液体溅在你的胯部，覆盖在你的大腿上，艾米莉在你身上摩擦，她的呼吸变得急促，试图在她身体颤抖的高潮中保持动作。你呻吟着，只能把她抱在怀里，因为你自己的高潮让你的肌肉触电般颤抖，你的身体因快感而紧绷。");
         }
         outputText("[pg]当你高潮时，你的产卵管抽搐着，你感觉到腹部涌起一股热流。仿佛像一根");
         if(get_player().hasCock())
         {
            outputText("另一根");
         }
         outputText("阴茎一样，一阵卵子涌入你的产卵管，让你的腹部感觉轻如空气。艾米莉呻吟着，一颗又一颗的卵挤过她的后庭，她还在把玩着她的后庭，而你则用你的卵填满她，她的肚子轻轻压在你的肚子上，因为新的负荷而隆起。没过多久，最后一颗卵从你的产卵管尖端滑出，它开始反射性地缩回，由于艾米莉通道里不可思议的黏液量，它从紧致的通道里滑出比进入时容易得多。当你完全抽出时，黏液从她身上倾泻而下，在你们俩躺在那里慢慢入睡时，给你覆盖了一层厚厚的黏液。");
         get_player().orgasm("Ovi");
         if(get_player().fertilizedEggs() > 0)
         {
            if(get_player().canOvipositSpider())
            {
               buttPregnancy.knockUp(15,96);
            }
            else if(get_player().canOvipositBee())
            {
               buttPregnancy.knockUp(26,96);
            }
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,629,get_player().eggs());
         }
         get_player().dumpEggs();
         doNext(layEggsInAmilysButtPt2);
      }
      
      public function layEggsInAmilysButtPt2() : void
      {
         clearOutput();
         outputText("将近一个小时后你醒来，艾米莉还在你身上打瞌睡。你轻轻地抱起她，把她带到她的窝里，让女孩躺在柔软的床上，看着她隆起的肚子微笑着。你花了一点时间清理自己并重新穿好衣服，虽然你忍不住觉得在你的[armor]上弄到一点黏液是值得付出的代价。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function layEggsInAmily() : void
      {
         clearOutput();
         outputText("感觉到你的");
         if(get_player().eggs() < 20)
         {
            outputText("肿胀的");
         }
         else if(get_player().eggs() < 40)
         {
            outputText("起伏的");
         }
         else
         {
            outputText("肿胀得难以置信的");
         }
         outputText("腹部蠕动着，你的思绪飘回了艾米莉的提议。你埋首于她的颈间，开始轻柔地亲吻她，同时你的产卵管开始变粗，慢慢地探出到空气中。她在你的怀里颤抖着，你的双手滑过她的腰侧，将她拉近。你几乎无法将嘴唇移开，你轻咬着她的下巴，问她是否准备好接受一些卵了。");
         outputText("[pg][say:我想我能被说服，你<b>确实</b>看起来需要一点关注……] 当她伸长脖子时，你感觉到一只手滑进了你的[armor]，当她摸索的手指找到你[if (hasCock) {坚挺的肉棒}][if (isHerm) {和}][if (hasVagina) {湿滑的小穴}]时，她发出了轻声的呻吟}]");
         if(get_player().get_gender() == 0)
         {
            outputText("平坦的下体");
         }
         outputText("，挑逗得你下意识地迎合着她纤细的手指挺动。");
         if(pregnancy.get_isPregnant())
         {
            outputText("[say:但尽量记住我已经怀上了。我不想里面变得太挤；所以确保你别射偏了，好吗？]");
         }
         outputText("[pg]当快感开始淹没你时，你试图理清思绪，产卵管完全伸出，同时你试图集中注意力并决定如何继续。");
         doNext(layEggsInAmilysCorruptedHole);
      }
      
      public function kissAmilyInDaMoufFirstTimeIsSomehowBetterThatWay() : void
      {
         clearOutput();
         amilySprite(true);
         get_images().showImage("amily-forest-kissingfuck");
         outputText("虽然这里的风景绝对算不上[say: 浪漫]或[say: 迷人，]但你面前这个急切的小鼠娘却相当吸引人，所以你走到她面前，把她抱在怀里，轻轻地吻了她。看到她惊讶地睁大眼睛片刻，她很快闭上眼睛，回吻了你。继续亲吻，你们两个开始探索彼此。在这个过程中，你们互相帮助脱下衣服，慢慢地，几乎是不情愿地退后一步，这样你们就可以第一次毫无阻碍地看到彼此。[pg]");
         if(get_player().cocks[0].cockLength >= 14)
         {
            outputText("看到你阴茎的尺寸，艾米莉的眼睛睁得大大的，但她似乎还是被迷住了。慢慢地，她红着脸，避开你的目光，触摸它并开始抚摸你的阴茎。这很快就变成了一个名副其实的手淫。鼠娘没有把手拿开，引导你走到“床”边，让你躺下。她继续用手抚摸你的阴茎，但也用她的尾巴和舌头让你越来越接近高潮。就在你快要忍不住的时候，她坐在你的腿上，慢慢地引导你的阴茎顶端到她的阴唇。很快，这种“几乎插入”的感觉淹没了你，让你达到了高潮。[pg]");
         }
         else
         {
            outputText("她低头看着你的双腿之间，红着脸笑了。[say: 很高兴看到一个没有对那个部位发疯的[manboy]。] 她对你喃喃自语，尽可能紧紧地抱着你。尽管你能感觉到她的手压在你的背上，你突然意识到有什么东西也在抚摸你的阴茎；需要稍微扭动一下，这以最有趣的方式将她小巧挺拔的乳房压在你的胸前，但你可以看到她正在使用她的尾巴。你们两个尽可能同步地像螃蟹一样走到那堆床上用品前，然后倒下；你仰面躺下，她落在你身上。[pg]");
            outputText("此时，你的阴茎已经坚硬如石，艾米莉有些不情愿地推开你的抓握，调整自己的位置，使你们两个胯部相对。你抬头看着她，开始向她提出问题[say: 你确定要这样吗？]，但她笑了，坚持地点了点头，然后她的嘴唇再次印在你的嘴唇上。她的阴道几乎是挑逗性地在你的阴茎顶端盘旋，因为她鼓起勇气进行最后的冲刺……她确实冲刺了，突然将自己完全刺穿在你身上，让你震惊。你能感觉到她痛苦的退缩，全身的肌肉因疼痛而紧绷，你把她抱得更紧，吻得更深，试图安慰她。你躺在那里，抱着她，直到她放松下来，慢慢开始前后移动。[pg]");
         }
         outputText("享受着这种感觉，你也开始抚摸她，以增加她的快感。没过多久你们俩就高潮了，然后艾米莉倒在你身上，面带微笑地看着你的眼睛。[pg]");
         outputText("[say: ……那真是……哇。呃，我是说。] 她急忙纠正自己，红着脸。[say: 我想你还不算太坏……我就知道我对你感觉不错。] 她笑了。[say: 你知道我不一定会怀孕，对吧？我们还得再来一次。][pg]");
         outputText("你笑了，告诉她你很乐意和她做，只要需要多少次都行。她脸红得");
         if(amilyFurry())
         {
            outputText("简直就像她脸颊上的毛变成了红色。");
         }
         else
         {
            outputText("她简直像个小恶魔！!");
         }
         outputText("找了个借口，你穿好衣服，收到一个慵懒的挥手告别和一个幸福的微笑，然后你走出大门，走向主街，从那里找到回营地的路。[pg]");
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,38,FlagDict_Impl_.arrayReadInt(_loc1_,38) + 3);
         get_player().orgasm("Generic");
         doNext(get_camp().returnToCampUseOneHour);
         amilyPreggoChance();
      }
      
      public function keepDeepFuck(param1:Boolean) : void
      {
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,2655,FlagDict_Impl_.arrayReadInt(_loc2_,2655) + 1);
         clearOutput();
         outputText("当原始的欲望再次战胜你的理智时，艾米莉的恳求便成了耳旁风。当然，这并不能阻止她继续尝试，即使你巨大的肉棒将她的身体从肚脐一直撑到了胸口，她每次的哀求都被急促的呼吸打断，这让你从她被撑开的" + (param1 ? "guts" : "womb") + "中感受到的那本就难以想象的紧致感进一步增加" + "。");
         outputText("[pg][say: 啊——！不——不——求——求求你——]她一次只能勉强挤出一个音节，绝望地推着她的胸口，徒劳地挣扎着想把你的肉棒从她体内挤出去。然而，她的力量只会和她肉体的阻力一起，通过她的皮肤让你更加愉悦。");
         outputText("[pg]随着每一次抽插，你和艾米莉似乎都失去了一点理智。她是因为身体被推向极限的痛苦感觉，而你是因为以前从未想象过的火热、湿润的紧致感紧紧地夹着你。");
         outputText("[pg][say: 坏……坏掉了……你要……" + (param1 ? "把我的屁股弄坏了" : "把我的子宫撑破了") + "！]每次你强行进入她体内，鼠娘的身体都会抽搐得更厉害一点，汁液从她被撑开的洞口滴落，顺着你的肉棒底部流下。现在，她已经放弃了试图把自己从你的阴茎上移开。是因为接受了命运还是失去了挣扎的意志，目前还不清楚，但死死抓住似乎是她唯一能想到的事情。伴随着一声尖叫，她用双臂紧紧抱住她身体前部隆起的地方，舌头无力地挂在嘴边，每次你在她的乳房之间推进时，她的乳房都会被撞开并偏向一侧。");
         outputText("[pg]你继续在她体内深处抽插和推进，随着女孩身体的每一次痉挛，你很快就接近了极限。几乎就像是按了提示一样，她发出一声长长的哭喊，弓起了背。她淫荡的尖叫，加上对你阴茎的进一步压力，正是你伴随着一声大声的呻吟，高潮射入她隆起的胸部所需要的。");
         if(get_player().cumQ() >= 1000)
         {
            if(param1)
            {
               outputText("[pg]一开始你几乎感觉不到你的精液涌入她的体内，任何进一步的拉伸都很难从你阴茎的印记中辨认出来。然而，过了一会儿，原因就很清楚了。由于她的大部分肚子都被她屁股里阴茎的绝对粗细撑开了，你的精液已经没有空间了。相反，它直接射入她的喉咙，随着它接近她的下巴，以流动的动作使她的脖子鼓起来。发出像病态打嗝一样的声音，艾米莉似乎也意识到了这一点，双手捂住嘴巴，做最后的努力来阻止它。这起了一会儿作用，但你的精液量太大了，无法抑制。你的精液突然像洪水一样从她的指尖喷涌而出，覆盖了她的脸，弄得她无力地垂在身侧的双手到处都是。没有了进一步的阻碍，你的精液像河流一样从她的嘴里流出，覆盖了她的双乳以及她被撑开的胸部和肚子。与此同时，鼠娘的眼睛翻白，当你的最后一滴精液流过她的舌头时，她的舌头又恢复了无力流口水的状态。这一幕足以让你再次越过边缘，导致更多的精液从你爱人湿润的嘴唇中喷涌而出。");
            }
            else
            {
               outputText("[pg]在你阴茎隆起的顶端，艾米莉皮肤肿胀的地方开始形成一个几乎像气泡一样的形状。它生长得越来越大，然后瘪下去，把女孩拉伸得不那么紧绷，但面积更广。你可以感觉到精液冲回你的阴茎，因为它填满了鼠娘被撑开的子宫的全部，并在进一步使她的皮肤鼓起后寻找出口。粘稠的润滑液再次诱惑着你，你又在鼠娘体内抽插了几次，喷出最后一点精液，每次你这样做都会遇到可怜的呻吟。过了一段时间，她的肚子才瘪回你阴茎的形状，精液终于从她的小穴滴落，在地上汇成一滩。");
            }
         }
         outputText("终于满足了，你终于拔了出来，伴随着湿润的声音，你从鼠娘被虐待的" + (param1 ? "屁股" : "小穴") + "中喷出精液。");
         outputText("艾米莉所有的力气都被操光了，一言不发地倒在地上。她温柔而毫无思想地揉着她肚子和胸部沾满精液的肉，几乎无视了你，盯着自己的身体，偶尔发出非常可怜的呜咽声。她的呼吸急促，顺着脸颊流下的眼泪清楚地表明，这次经历对她来说是非常痛苦的。");
         outputText("[pg]当你的理智恢复时，你的脸开始因羞愧而发烫，你意识到最好还是离开。几个小时后，艾米莉清理干净了自己，似乎恢复得很好，但她犹豫着不敢看你的眼睛，这清楚地表明她对你的信任被你的行为动摇了，即使她不再谈论这件事。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2655) >= 3)
         {
            doNext(tooDeepAmilyLeaves);
         }
         else
         {
            doNext(get_camp().returnToCampUseOneHour);
         }
      }
      
      public function izmaAmilyDrugThreeWaySex3() : void
      {
         clearOutput();
         get_player().orgasm("Generic");
         dynStats(DynStat.Sens(-3));
         outputText("<b>一段时间后……</b>[pg]");
         outputText("你迷迷糊糊地醒来。你腰部以下浸透了各种性爱体液，不过这一次，[eachCock]已经软了下来。伊兹玛依偎在你的左臂下，艾米莉在你的右臂下。她们还在睡觉，但她们比你湿得更厉害，而且隔着你的身体互相拥抱在一起。这药水的效果可能和艾米莉设计的有点不一样，但你对这个结果也没什么好抱怨的。");
         if(!get_izmaScene().pregnancy.get_isPregnant() || !pregnancy.get_isPregnant())
         {
            outputText("[pg](<b>");
            if(!pregnancy.get_isPregnant())
            {
               outputText("艾米莉");
               pregnancy.knockUpForce(25,168);
               if(!get_izmaScene().pregnancy.get_isPregnant())
               {
                  outputText("和");
               }
            }
            if(!get_izmaScene().pregnancy.get_isPregnant())
            {
               outputText("伊兹玛");
               get_izmaScene().pregnancy.knockUpForce(25,300);
            }
            outputText("绝对怀孕了。</b>)");
         }
         doNext(get_camp().returnToCampUseFourHours);
      }
      
      public function izmaAmilyDrugThreeWaySex2() : void
      {
         clearOutput();
         outputText("时间变得模糊了一会儿，但凉爽的空气吹在你湿透的勃起上，足以让你恢复完全的意识。这一幕很不真实。艾米莉在某个时候从伊兹玛身上滚了下来，平躺在她的背上，抱着她那");
         if(!get_izmaScene().pregnancy.get_isPregnant())
         {
            outputText("充满精液的-");
         }
         outputText("怀孕的肚子，喃喃自语道，[say: 宝宝，]同时她的手指无意识地摆弄着她那涂满雪白精液的小穴。当快感的余震折磨着她那被欲望摧残的大脑时，她浑身发抖，让她保持在一种发情、温顺的状态。");
         outputText("[pg]伊兹玛似乎利用了你失去意识的空隙——你仰面躺着，而她跨坐在你的胸前");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,439) == 0)
         {
            outputText("，肉棒和蛋蛋无力地拍打在你身上");
         }
         outputText("。她喘着气，[say: 不知道为什么我不在你失去意识的时候直接操你……感觉不太对。]鲨鱼女孩单手揉着乳房，乞求道，[say: 我现在可以要吗？你能像射进她里面那样射进我里面吗，[name]？求你了，我……我为你湿透了，我会让你感觉很舒服的。]她一直在你的[hips]上方来回移动，她阴蒂的硬块压在你身上，等待着被允许");
         if(!get_izmaScene().pregnancy.get_isPregnant())
         {
            outputText("被授精");
         }
         else
         {
            outputText("让她那怀孕的小穴再次被填满");
         }
         outputText(".");
         outputText("[pg]在她身后，[eachCock]依然得意洋洋地坚挺着，并且");
         if(get_player().balls == 0)
         {
            outputText("压力依然无处不在");
         }
         else
         {
            outputText("你的[balls]把你的[sack]撑得和以前一样紧");
         }
         outputText("。射精的冲动几乎无法抗拒，你根本没有多想，就把双臂折叠在脑后，点了点头，渴望满足你似乎无法克服的需求。");
         outputText("[pg]伊兹玛用颤抖的双腿站了起来，向你抛了一个性感的眼神，然后又扑了下来，她的小穴贪婪地吞噬着你的[cock biggest]。她的小穴感觉不如艾米莉的温暖或紧致，但里面有许多微小的触手抚摸着你的[cockHead biggest]，在敏感的皮肤上盘旋。当她");
         if(get_player().biggestCockArea() <= 65)
         {
            outputText("插到底");
         }
         else
         {
            outputText("尽可能多地吞下");
         }
         outputText("，一股淫水喷涌而出，流到了你的腹部");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,439) == 0)
         {
            outputText("，伴随着从她龟头喷出的一股先兆精液");
         }
         outputText(".");
         if(get_player().cockTotal() > 1)
         {
            outputText("有力的双手握住");
            if(get_player().cockTotal() > 2)
            {
               outputText("你的两根");
            }
            outputText("额外的肉棒");
            if(get_player().cockTotal() > 2)
            {
               outputText("es");
            }
            outputText("，套弄着");
            if(get_player().cockTotal() == 1)
            {
               outputText("它");
            }
            else
            {
               outputText("它们");
            }
            outputText("，动作顺滑而自信。[say: 我敢打赌，那只老鼠肯定不能像这样满足你的需求，对吧？]");
         }
         outputText("[pg]你带着毫不掩饰的爱意，抬头看着这个渴望精液的鲨鱼女孩。她迎上你的目光，送上一个飞吻，然后开始缓慢地向上抬起身体，紧致的阴唇紧贴着你的粗壮，在你的[cock biggest]上留下她芬芳的淫水。你带着慵懒的微笑，任由你的女人骑乘着你");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,439) == 0)
         {
            outputText("，无视那根滴着液体的肉棒在你的胸膛上流淌");
         }
         outputText("。本能的、半意识的声音提醒你，事情就该如此——你是如此阳刚，以至于你需要一群女人轮流来满足你贪得无厌的欲望。幸运的是，你在这里已经有了一个好的开始。");
         outputText("[pg]伊兹玛俯下身");
         if(get_player().cockTotal() == 2)
         {
            outputText("，将一只手从你额外的肉棒上移开来支撑自己，");
         }
         if(get_player().cockTotal() > 2)
         {
            outputText("，将一只手从你其中一根额外的肉棒上移开来支撑自己，");
         }
         outputText("并热情地吻了你。这个热烈的吻既短暂又疯狂，但当你刚从中缓过神来时，伊兹玛开始说道：[say: 你喜欢这样吗，阿尔法？你喜欢我的小穴吸吮你的肉棒吗？]伴随着她的话语，她扭动着臀部，内部的触手像波浪一样协同地拉扯着你，实际上将你的肉棒抬起，更深地压入她的体内，直抵她的");
         if(get_izmaScene().pregnancy.get_isPregnant())
         {
            outputText("紧闭的");
         }
         else
         {
            outputText("扩张的");
         }
         outputText("子宫颈。");
         if(get_izmaScene().pregnancy.get_isPregnant())
         {
            outputText("[say: 我知道我已经怀孕了，但我还是想让你尽可能深地射在里面，好吗？我只是……我必须得到你的精液。我需要感觉到那股热流在我的体内泛滥。这会……哦，是的……这会让我感觉好舒服，感觉被爱着。.]");
         }
         else
         {
            outputText("[say: 我不知道为什么，但我就是知道，当你在我体内射精时，你会让我怀孕的。这会让我哦——哦哦哦……怀上你的孩子，变得好沉重，那将是完美而幸福的。你他妈的会用精液把我灌满的，对吧，阿尔法？]");
         }
         outputText("伊兹玛的眼中闪烁着淫秽的饥渴和霸道的爱意。她低声说道，[saystart]求求你，能不能");
         if(!get_izmaScene().pregnancy.get_isPregnant())
         {
            outputText("让我成为你大肚子的、吞食精液的贝塔妻子？");
         }
         else
         {
            outputText("射进你怀孕的、渴望精液的妻子体内？");
         }
         outputText("[sayend]");
         outputText("[pg]操，这简直就像是她在叫你做你最想做的事！没有什么比");
         if(!get_izmaScene().pregnancy.get_isPregnant())
         {
            outputText("看着一个婊子的肚子因为被塞满而膨胀成一个丰满、肥沃的圆顶");
         }
         else
         {
            outputText("把一个小穴塞得满满的，让她永远不停地滴下你的精液");
         }
         outputText("更性感的了。能躺下来看着她在你做的时候爽到高潮迭起？那简直是锦上添花。伊兹玛的触须在你周围色情地舞动着，痉挛般地抚摸着，那不协调的、各自滑动的触感让你想起了一百条小舌头。她变得无比湿润，这简直超出了你的想象，她的整个身体开始变红，随着高潮的到来而染上绯色。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,439) == 0)
         {
            outputText("她的四颗蛋在你身上颤抖，你看着她的尿道隆起，准备用她自己那稍逊一筹的高潮喷溅你的[chest]。");
         }
         outputText("当她的肉壁开始绞紧你的肉棒时，女人的精液冲刷着你的腰部，挤压的力度恰到好处，让你的欲火燃烧得更加猛烈，引发了你体内无法抑制的如雪崩般的快感。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,439) == 0)
         {
            outputText("她那滚烫的、劣等精液的气味扑鼻而来，当它变成浓稠的液滴从你身上滚落时，让你更加兴奋。");
         }
         outputText("[pg]你感觉自己就像一个刚刚被打开的超压水箱。前一刻，还有一股难以名状的力量憋在你的体内，下一刻，你就让它如长浪般喷涌而出，每一次都由剧烈的收缩引导穿过你的尿道，每次都让你的全身随之颤抖。你将长矛般的精液注入鲨鱼女孩准备好的小穴中。当你填满她时，她尖叫着：[say: 是的！给我！哦，天哪，是的！.");
         if(get_izmaScene().pregnancy.get_isPregnant())
         {
            outputText("她的子宫依然紧闭，已经装满了精液，所以你咸涩的存货很快就淹没了较小的通道。触须浸泡在你的精液中变得松弛，在令人陶醉的洪流中软绵绵的。");
            if(get_player().hasKnot(get_player().biggestCockIndex()))
            {
               outputText("你的龟结在她体内爆炸性地膨胀，但她子宫的封闭更紧。");
            }
            outputText("精液像河流一样从你的阴茎周围涌出。巢穴在刚才你们的幽会中已经被情欲的汁液浸透了，但现在它被完全染成了白色。过了一会儿，伊兹玛竟然被你喷发的惊人威力从你身上顶开了，仰面躺倒。");
         }
         else
         {
            outputText("她的子宫召唤着你的精液，触须缓慢地起伏，像小桨一样把每一滴精液推入她的子宫深处。你射得两眼发直，但你还是设法看着伊兹玛紧绷的腹部隆起，她带有条纹的皮肤被你注入的沉重液体撑得光滑。她呻吟着，双手抚摸着越来越圆的隆起，把自己压在你身上，尽可能多地封存精液。");
            if(get_player().hasKnot(get_player().biggestCockIndex()))
            {
               outputText("当然，有了你这样的肉结，根本不需要那样。你把她封得死死的，让她别无选择，只能咽下每一滴精液。");
            }
            outputText("虎鲨女孩含糊不清地嘟囔着，[say: 太……满了] 然后在她翻倍的体重下向后倒去");
            if(get_player().hasKnot(get_player().biggestCockIndex()))
            {
               outputText("，伴随着一声响亮的“啵”声，你的肉棒被挤了出来\'");
            }
            outputText(".");
         }
         outputText("[pg]伊兹玛喘息着，[say: 嗯……唔……太多了，] 并捧着她");
         if(!pregnancy.get_isPregnant())
         {
            outputText("被精液胀满的");
         }
         else
         {
            outputText("孕育着孩子的");
         }
         outputText("肚子。你还在继续，还在喷射，但没有紧致的穴口可以填满，就感受不到什么快感。你开始撑起身子——你需要让什么东西受孕，但艾米莉瞬间出现在那里，一边揉弄着自己的小穴，一边将你喷射着的肉棒塞进她的屁股里。多亏了它大量的喷射和包裹着它的双倍爱液，它轻松地滑了进去。");
         outputText("[pg]怀孕的鼠娘发出咕噜声，[say: 你可以用我的屁股……我的嘴。我不在乎，[name]。我爱你，只要你能把我填满，我愿意让你搞大我所有的洞……] 她沉重的肚子压在你身上，把你钉在那里，她以此为支点，在你的肉棒上弹跳着屁股，而你则给她灌入白浊的灌肠液。艾米莉呻吟着，[say: 占有我，[name]！] 并向后仰起头，用手指揉捏着自己的乳头。她的尾巴滑进你的[asshole]，向上压迫着你的前列腺，榨出你最后几股长长的喷射。她已经被塞得太满了，承受不了更多，但谢天谢地，你也没有更多可以给的了，因为虎鲨女孩已经吸走了大部分。");
         outputText("[pg]随着高潮过去，你发现自己精神焕发，而不是筋疲力尽。与此同时，艾米莉摇摇晃晃地站不稳，你把她抱起来，慢慢地从她的屁股里退出来，你的肉棒已经被从她被堵住的后庭中流出的精液潮水洗刷干净了。");
         outputText("[pg]伊兹玛仍然有些神志不清，但当你在她鼻子底下挥舞你的[cock biggest]时，她立刻精神了起来。一条湿润的粉色舌头从她张开的大嘴里滑出，她的牙齿缩了回去，留给你一个微笑着的吸精机器，正等着吃点心。当你的[cock biggest]一沉入她的嘴里，你的[legs]就软了，你倒在她旁边，不知所措。在连续两次高潮之后，你变得极其敏感，感觉到那滑溜溜的肌肉在你的长度上起伏，对你来说简直太刺激了。你满足地呻吟着，把伊兹玛拉下来贴在你的腹股沟上，无力地对着你怀孕后宫的一员抽插着。");
         outputText("[pg]当一个" + amilyButt() + "突然落在你脸上时，你的眼前一黑，她那沾满精液的阴唇抹在你的嘴上。那个美臀主人的浓郁味道与你的体液混合在一起，你开始用嘴取悦她，哪怕只是为了让她准备好迎接下一次的填满。");
         outputText("[pg]艾米莉呻吟着，[say: 你对我们真好，[name]，] 而伊兹玛含着你的肉棒表示同意，[say: 唔唔嗯嗯！] 你的");
         if(get_player().balls > 0)
         {
            outputText("[balls]正在");
         }
         else
         {
            outputText("身体正在");
         }
         outputText("重新充满，你知道用不了多久，你就能给伊兹玛足够的量，让她饱餐一顿。当快感的闪电在你的肉棒中爆炸，嘴里塞满了沾满精液的小穴时，你很难思考，所以你干脆不想了。你让混合的性爱体液的气味和伊兹玛嘴巴的触感接管一切，享受着简单的互相取悦，直到你的下一次射精，除了那令人失去意识的狂喜之外，你几乎不记得那次射精了。");
         menu();
         addButton(0,"继续",izmaAmilyDrugThreeWaySex3);
      }
      
      public function izmaAmilyDrugThreeWaySex() : void
      {
         clearOutput();
         outputText("这充满爱意的拥抱对你的影响不言而喻。[EachCock]已经肿胀起来，又长又挺，因为兴奋而变得粗壮，就像");
         if(get_player().cockTotal() == 1)
         {
            outputText("它");
         }
         else
         {
            outputText("它们");
         }
         outputText("一直以来的那样。发情的雌性们持续的抚摸让你那[cock biggest]因为难以掩饰的渴望而隐隐作痛。你的[balls]有一种不断增长的紧绷感]");
         if(get_player().balls > 0)
         {
            outputText("，这种感觉让你的[sack]微微肿胀，随着里面充满沉甸甸、令人舒适的晃荡精液，皮肤变得光滑而有光泽");
         }
         else
         {
            outputText("，这种感觉让你因为积蓄着等待喷发的精液而感到舒适的肿胀");
         }
         outputText("。一滴滴的预精液从[eachCock]慢慢滴落到忙碌的女士们的手和前臂上，让她们的抚摸变得如此湿润和润滑，你几乎会把它们错认成魅魔的小穴。被这些温顺的女人服侍，有一种奇妙的正确感");
         if(!pregnancy.get_isPregnant() && !get_izmaScene().pregnancy.get_isPregnant())
         {
            outputText("，她们饥渴的子宫正等着你随时让她们受孕");
         }
         else if(pregnancy.get_isPregnant() && get_izmaScene().pregnancy.get_isPregnant())
         {
            outputText("，她们成熟的子宫里已经塞满了你的后代");
         }
         else
         {
            outputText("，至少她们其中一人的子宫已经孕育了你的后代");
         }
         outputText(".");
         outputText("[pg]如果艾米莉脸上的表情能说明什么的话，她也同样迷恋着你。她眼睑低垂，放大的瞳孔几乎被长长的睫毛遮住。她死死盯着你的[cock biggest]，手在上面胡乱地套弄着，和虎鲨女孩那只更大的手分享着这根肿胀的肉棒。每当有一团新鲜的透明精液从你的[cockHead biggest]溢出时，这位老鼠妻子就会舔舔嘴唇，但她的小手会尽可能迅速地收集它——有时伊兹玛会松开手，抢先品尝你肆意散发的芬芳" + get_player().mf("雄性","雌性") + "花蜜。艾米莉的尾巴因为无意的兴奋而在你的[leg]上慢慢地上下滑动，翘得很高，让你能看到她暴露的阴阜。晶莹的水珠在" + (!amilyFurry() ? "光滑的皮肤" : "修剪整齐的胯部毛发") + "上凝结得如此密集，以至于有几滴已经开始顺着她的大腿流下。她那渴望的气味在空气中如此浓郁，你几乎能尝到它的味道。这让你的[cocks]抽动起来。");
         outputText("[pg]在这天堂般的手淫的另一边，伊兹玛正温暖地微笑着，在服侍你那沾满预精液的肉棒时，不经意间露出了她那巨大的掠食者牙齿。她现在还穿着裙子和上衣——暂时是这样。随着她的每一次套弄，她的乳房都会微微弹跳，红黑相间的肉球轻轻晃动。这个动作将你的目光吸引到她挺拔的乳头上，它们正努力地顶着那紧绷的布料囚笼。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,439) == 0)
         {
            outputText("伊兹玛的裙子发出轻柔的沙沙声，组成裙子的一些叶片开始慢慢升起。起初只是微微凸起，但随着这位虎鲨女孩对你的[cock biggest]为所欲为，她的凸起撑起了一个一英尺多高、几英寸厚的帐篷。它的主人的脸颊比平时更红了，伊兹玛开始喘息，伴随着某种东西在她那被严重撑开的裙子内不断滴落的声音。");
         }
         else
         {
            outputText("伊兹玛的裙子明显开始变湿，一些叶片开始以一种相当诱人的方式贴在她那有条纹的大腿上。有一段时间，仅此而已，但随着这位虎鲨女孩对你的[cock biggest]为所欲为，裙子变得足够湿，像第二层皮肤一样贴在她身上。伊兹玛的脸红得比平时更深，她开始喘息，伴随着不断滴落的液体溅在下面的地上。");
         }
         outputText("[pg]在你那未被满足的欲望的重压下，你步履蹒跚地和被肉棒迷住的后宫们跌跌撞撞地走进巢穴，在你们三个跌进艾米莉舒适的住所时，你的[cock biggest]暂时失去了双重手淫。伊兹玛倒在你身边时，她的眼镜从头顶飞过，轻轻地落在巢穴的远端。这位摘下眼镜的");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,439) > 0)
         {
            outputText("前-");
         }
         outputText("双性人咯咯地笑着，低声说道，[say:反正我也不需要它们。.]");
         outputText("[pg]艾米莉毛茸茸的大耳朵蹭着你的头，她在你的后颈处依偎着。她的手臂穿过你的躯干，落在你[chest]的另一侧，轻轻地托住");
         if(get_player().averageNipplesPerBreast() <= 1)
         {
            outputText("你的一侧乳头");
         }
         else
         {
            outputText("看着你那众多的乳头");
         }
         outputText("。她急促地喘息着，舔舐着你的下巴，最终越过你的下颌线。她的双唇贴上你的，那柔软湿滑的触感简直是天堂般的享受，一条纤细的舌头滑过你们紧贴的双唇，探入你的口中。你以同样的方式回应，灵活的舌头缠绕着她，品尝着她的嘴……她的唇……她的一切。你与她的嘴唇缠绵，就像你想象中一会儿要在她下半身做的那样。");
         outputText("[pg]艾米莉突然不满地咕哝了一声，她那灵巧的舌头也失去了控制，开始胡乱抽动。你正享受着的她的双唇，被稍微推向了一边。你正想抽身抱怨，但一只令人安心的手搭在了你[chest]的另一侧，越过了鼠女的手臂，同时第二张嘴贴上了你露出的另一半嘴唇。你刚把舌头缩回来，这位新来者就把自己的舌头强行塞进了你塞得满满的嘴里。所有这些柔软的、充满少女气息的嘴唇都在你嘴上胡乱地亲吻着，两对舌头在你的嘴里纠缠，你甚至无法正常地回应这个法式热吻了。你只能尽力专注于这些像吐着口水、扭动着的蛇一样的舌头，在目前的情况下尽可能巧妙地舔舐和吮吸它们。有时它们甚至会互相缠绕然后退开，在两个女孩的唇间滑行，跳着属于它们自己的扭曲舞蹈，然后再回到你这个它们真正倾慕的对象身边。");
         outputText("[pg]艾米莉给了伊兹玛一个异常猛烈的吻，这让伊兹玛大吃一惊，两个女孩在柔软的窝里翻滚，一直滚到了边缘。你感觉自己似乎已经很久没有失去知觉了，只能在震惊中默默地看着。体型较小、较轻的女人占据了上风，尾巴高高翘起以保持平衡，而伊兹玛则躺在她身下，双手忙碌地揉捏着这位啮齿类小甜心的" + amilyButt() + "。她们那汁水四溢的小穴紧紧贴在一起，坚硬的阴蒂在对方的阴唇间滑动，温柔而又摩擦的刺激让充血的、如花瓣般的双唇平滑地变形。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,439) == 0)
         {
            outputText("鲨鱼女孩的睾丸被推到了一边，勉强避免了被鼠娘的重量压扁，而她那坚硬的肉棒则在艾米莉的乳房之间流着口水，似乎很乐意待在那里。");
         }
         outputText("伊兹玛的尾巴突然以闪电般的速度向鼠娘的臀部甩去。它击中那柔软的啮齿类臀部，发出一声响亮的脆响，让你都忍不住皱眉。艾米莉对着另一个女人的嘴低吼着，弯曲自己的尾巴，一圈又一圈地将伊兹玛紧紧缠绕起来。她们互相摔跤，小穴紧贴着小穴，并且一直亲吻着。");
         outputText("[pg]从你所在的位置看去，那两个闪闪发光的肉丘看起来就像是一个诱人的粉色三角洲，中间有一道星形的折痕，正等待着被侵犯。在你的大脑中跳跃的药物让你无法移开视线。事实上，你越是看着这两个挣扎的女人，那个双重的、嵌合的洞对你来说就越重要。你发情的身体已经无法等待，你屈服于从你的下体涌出的诱人而响亮的呼唤，让性欲污染了你身体的其余部分。");
         outputText("[pg]你步履蹒跚地走向那堆扭动的肉体，将手放在一个曲线优美的臀部上。是谁的并不重要。伊兹玛湿透的裙子偶尔会挡住你的视线，所以你把它撕开，让自己能更好地看清目标。向前挺进，你感觉到那对小穴紧紧贴着你的[cockHead biggest]，而它则在那些流着口水、紧紧压缩的入口之间穿梭。巨大的水分远远超出了她们两人平时分泌的量——很明显，药水对她们的影响和你一样大。你涂抹在你[cock biggest]接触到的所有东西上的大量前列腺液就足以证明这一点。");
         if(get_player().cockTotal() == 2)
         {
            outputText("你甚至把你的第二根肉棒也塞了进去，和它的大哥并排在一起。两根沾满淫液的肉棒互相摩擦，也摩擦着两侧湿滑的洞口，让你对自己额外的男性特征感到庆幸。");
         }
         else if(get_player().cockTotal() > 2)
         {
            outputText("你甚至把一根额外的肉棒也塞了进去，和它的大哥并排在一起。两根沾满淫液的肉棒互相摩擦，也摩擦着周围湿滑的洞口，让你对自己额外的男性特征感到庆幸。当然，这并不是你的全部装备，但那个塞得满满的肉棒桑拿房里已经没有空间再塞进更多的肉棒了。");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,439) == 0)
         {
            outputText("你甚至撞到了伊兹玛被遗忘的装备，上面涂满了混合的汁液。虽然它因为兴奋而坚硬，但伊兹玛似乎几乎忘记了它，而是选择完全专注于她更具女性特征的部位。");
         }
         outputText("[pg]女士们满意的呻吟声都被对方撅起的嘴唇捂住了，但那愉悦的呼噜声却是确凿无疑的。当你屈服于压倒性的发情，让你的[cock biggest]带领你更深入地进入你那些准备好繁殖的雌性那令人窒息、闷热的深处时，一声兴奋的低吼从你的喉咙里爬了出来。你抓住下面的女孩——那个有条纹的，因为她更大——然后你把自己往后拉，几乎要被那对双子肉丘的热量热晕过去，因为它们紧紧贴着你的每一寸");
         if(get_player().cockTotal() > 1)
         {
            outputText("肉棒");
         }
         else
         {
            outputText("[cock biggest]");
         }
         outputText("。这百合之吻被你那湿润的坚硬打破了，艾米莉回头看着你，把她的尾巴从伊兹玛的尾巴中解开，抚摸着你，问道，[say:你不会把它浪费在外面吧？求你了，射在里面！!]");
         outputText("[pg][saystart]不，给我！");
         if(get_izmaScene().pregnancy.get_isPregnant())
         {
            outputText("我的小穴显然是更强壮的选择。");
         }
         else
         {
            outputText("我是更强壮、更明显的繁殖选择。让我怀孕，你会有更健康、更好的后代。");
         }
         outputText("而且，难道你感觉不到我的小穴有多湿吗？当你把精液给我时，里面那些小触手在你周围会有什么感觉？毕竟这是你作为阿尔法的工作，征服我的小穴，把它装满你的——哦哦哦……[sayend]伊兹玛呻吟着，一边开始用手指抠艾米莉的屁眼，一边为自己辩护。[say:而且，这个小——哦天哪——东西根本承受不了你的孩子，[name]。].]");
         outputText("[pg]艾米莉对这突如其来的入侵发出惊讶的尖叫，随后她也将自己的尾巴尖刺入了鲨鱼的直肠，把伊兹玛的要求变成了一声淫荡的呻吟。[saystart]来吧，[name]。是我弄清楚了——哦哦哦哦……呃，怎么制作药水。");
         if(!pregnancy.get_isPregnant())
         {
            outputText("给我你的孩子……嗯，我们会生出非常聪明的宝宝的。");
         }
         outputText("只要，啊……把它插进我里面射出来，在我里面射了一次又一次，操我直到我怀上你的精液！[sayend]她");
         if(amilyFurry())
         {
            outputText("脸红得厉害，甚至能透过她的毛发看到，那绯红的色泽配上她吐着舌头的样子，看起来更迷人了");
         }
         else
         {
            outputText("脸红得厉害，整张脸几乎像甜菜一样红，她气喘吁吁地张着嘴，舌头色情地耷拉着，这副模样十分诱人");
         }
         outputText(".");
         outputText("[pg]你在两个女孩身上进进出出，操弄着她们的阴阜，毫不在意最终精液会射进谁的体内。你绝对会灌满一个");
         if(!pregnancy.get_isPregnant() || !get_izmaScene().pregnancy.get_isPregnant())
         {
            outputText("子宫");
         }
         else
         {
            outputText("小穴");
         }
         outputText("，从你下体的饱胀感来看，但不管怎样都没什么大不了的。你脑海深处有一种平静自信的笃定，不断提醒着你，这里由你做主，这两个女人都将为你");
         if(!pregnancy.get_isPregnant() || !get_izmaScene().pregnancy.get_isPregnant())
         {
            outputText("怀孕");
         }
         else
         {
            outputText("潮吹");
         }
         outputText("。每次你猛力将你的");
         if(get_player().cockTotal() > 1)
         {
            outputText("双龙");
         }
         else
         {
            outputText("[cock biggest]");
         }
         outputText("插到底时，你都会把插在伊兹玛屁股里的尾巴推得更深，也会把她的手指推得更深地进入老鼠娘体内，这反过来又让她们的小穴在你周围涌出更多的淫液。艾米莉已经放弃了争论，开始吸吮伊兹玛的一侧乳头，而你则在她们湿滑的肉缝中研磨，将她们推向高潮，你的");
         if(get_player().balls > 0)
         {
            outputText("紧绷的蛋蛋晃动着");
         }
         else
         {
            outputText("紧绷的饱胀感刺痛着");
         }
         outputText("意味深长地提醒着你，你那不断逼近的高潮所带来的稳定悸动，只需再快速抽插几下就能释放。");
         outputText("[pg]毫无预兆地，你向后退去，将自己暴露在冷空气中，然后向上猛插进去，将你的[cock biggest");
         if(get_player().biggestCockArea() > 61)
         {
            outputText("尽可能深地刺入艾米莉多汁的肉缝中");
         }
         else
         {
            outputText("径直刺入艾米莉多汁的肉缝中");
         }
         outputText("。伊兹玛的手指隔着鼠娘的内壁摩擦着你，在她那紧如手套的小穴所带来的快感之上，又提供了一层额外的刺激。雌性的爱液从你的[cockHead biggest]一直喷涌到你的[sheath]，当你操着这个有怀孕癖的鼠娘时，爱液滴落到了伊兹玛那渴望肉棒的阴户上。这个充满掠夺性的荡妇叹了口气，但她的手指在老鼠屁股的范围内开始越来越快地扭动，通过高潮中的啮齿动物小穴震动着，将你笼罩在狂喜之中。你在这个天堂般的小穴里插到底并释放出来，射精的快感比平时更强烈，这是由一种生物本能驱使的，以确保每一滴精液都尽可能深地注入一个愿意接受的雌性体内。");
         outputText("[pg]艾米莉停止了吸吮鲨鱼的乳房，她尖叫着表达她的兴奋，让整个营地都能听到。她的" + amilyHips() + "疯狂地顶撞着你和鲨鱼，在本能的驱使下，你们俩都被她快乐的证明溅了一身。由于她的努力如此集中在她的下唇上，她的脸瘫倒在伊兹玛枕头般的乳房上，她开始在喘息和呻吟之间愚蠢地流口水，醉心于高潮而无暇顾及其他。这种解脱感既明显又强烈，随着每一个从你尿道中射出的浓稠、粘稠的凸起而增长。艾米莉的小穴被肉棒的奶油溅满了，很快就填满了，她那被充分使用的通道的内壁完全被白色浸透了。");
         if(!pregnancy.get_isPregnant())
         {
            outputText("她的肚子开始因为彻底的授精而膨胀起来，起初只是有点胖乎乎的，但随后变得又大又圆。她空虚的子宫不知怎么地吸收了越来越多你那充满活力的种子。这几乎就像她的子宫颈像一个单向阀一样吸下了酸奶般浓稠的精液，很快艾米莉的中间部分就因为精液而明显地晃动起来，从她的体重向两侧凸出。");
         }
         else
         {
            outputText("由于她的子宫已经被你的后代占据，艾米莉的子宫颈坚定地闭合着。从你体内泵出的精液太多了，以至于紧窄的通道根本无法容纳所有的精液");
            if(get_player().hasKnot(get_player().biggestCockIndex()))
            {
               outputText("，但你的结还是把它困在了里面。你射了又射，直到压力几乎让人感到痛苦，但即使是你那宏伟的结也无法将它全部阻挡");
            }
            outputText("。你的精液以高压水流喷射而出，化作一条白色的河流，浸透了你的双腿，给伊兹玛的腹股沟和尾巴上了一层釉，最重要的是，让艾米莉的阴阜被彻底内射，以至于你觉得她的阴户也可能怀孕了。即使知道它在你周围流出，你仍然固执地插在里面，被迫将它全部释放到她体内，随着每一次喷射而泵出的汹涌精液流按摩着你，让你释放出更多。");
         }
         menu();
         addButton(0,"继续",izmaAmilyDrugThreeWaySex2);
      }
      
      public function idLiddellium() : void
      {
         var _g:AmilyScene;
         clearOutput();
         outputText("艾米莉之前提到过她有一些炼金术的经验，对吧？她会不会知道你找到的那种奇怪药水是什么？");
         outputText("[pg][say: 我很乐意试试看。] 艾米莉说道，声音轻快但缺乏自信。你把药水递给她，看着她轻轻摇晃。[pg][say: 看起来不太眼熟。它有点像牛奶，闻起来……] 她打开瓶子，闻了闻，眼睛亮了起来。[say: ……像蘑菇、糖、罂粟和奶油。闻起来像香料，还有——我也不确定还有什么。不过闻起来很美味。.]");
         outputText("[pg]你感谢她的努力，但看起来她并不知道那是什么。她把瓶子还给你，并道了歉。");
         _g = this;
         doNext(function():void
         {
            _g.amilyMenu();
         });
      }
      
      public function heyIGotTicketsToMicePoppingOut() : void
      {
         clearOutput();
         amilySprite();
         outputText("你不想就这么跑掉丢下她不管，但同时你觉得最好还是尊重她的隐私。你站在一个礼貌的距离外，看着她用力。她粉嫩的下体微微张开，一个娇小的");
         if(amilyFurry())
         {
            outputText("、像老鼠一样的身影——粉红、无毛且");
         }
         else
         {
            outputText("身影——--");
         }
         outputText("大概六英寸高——滑了出来，伴随着一声吱吱叫掉在地上。幸运的是，艾米莉准备了一堆破布和柔软的树叶来缓冲它的降落。它在地上滚了几圈，然后以惊人的速度爬了起来；这很好，因为很快就有同伴加入了它。第二个婴儿掉在了它旁边的垫子上，接着是第三个……第四个……[pg]");
         outputText("你看着一个接一个的婴儿从母亲的子宫里滑出，来到这个广阔的世界。");
         if(amilyFurry())
         {
            outputText("尽管像普通幼鼠一样没有毛发，");
         }
         else
         {
            outputText("尽管和普通婴儿非常相似——当然，除了耳朵和尾巴——-");
         }
         outputText("它们已经能以极快的速度到处爬行了；甚至能摇摇晃晃地用两条腿站立。最先出生的那个开始本能地爬上母亲的身体，含住她的一个乳头吸吮起来。在十几个之后你就数不清了，但随着胎盘从体内滑出，艾米莉终于如释重负地叹了口气。此时每个婴儿都已经吃过奶了。它们现在似乎对用两条腿站立更有信心了，");
         if(amilyFurry())
         {
            outputText("并且毛发已经开始覆盖它们原本光秃秃的身体。");
         }
         else
         {
            outputText("在你的注视下迅速成熟。");
         }
         outputText("它们的毛色各不相同；白色、黑色和棕色最为常见，你甚至看到一两只拥有和你一样发色的宝宝。艾米莉一屁股跌坐下来，然后仰面倒下，显然累得站不起来了。她的孩子们围了过来，依偎在她身边，她给了它们一个疲惫但幸福的微笑。[pg]");
         outputText("在确认似乎没有任何危险后，你悄悄地离开了。看来她太关心孩子们了，根本没注意到你的离去。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function hermilyOnFemalePC() : void
      {
         amilySprite(true);
         clearOutput();
         outputText("艾米莉试图带你去一个做爱的地方，但她裤子里撑起的勃起让她有些不便，她显然还在努力适应。不过，最终你们还是到达了她现在的巢穴，你毫不犹豫地脱下了你的[armor]。[pg]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,161) == 0)
         {
            outputText("[say: 我真不敢相信这真的发生了……我长了一根鸡巴，而且我马上就要把它用在另一个女人身上了。] 艾米莉喃喃自语，尽管很明显她很喜欢她所看到的，无法抗拒地盯着你的[chest]或你的[vagina]。[pg]");
         }
         else
         {
            outputText("[say: 我还是不敢相信，我竟然把这根滚烫跳动的东西埋进了另一个女人的小穴里……更重要的是，我觉得我好像开始喜欢上这种感觉了。] 艾米莉自言自语道，毫不掩饰地盯着你的曲线。[pg]");
         }
         if(get_player().get_gender() == 3)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,161) == 0)
            {
               outputText("[say: 我到底是怎么被说服的？既然你既有阴茎又有小穴，那你为什么不直接用那根肉棒填满我呢？] 艾米莉喃喃自语。尽管她嘴上这么说，但她的目光却直勾勾地盯着你的[vagina]。[pg]");
            }
            else
            {
               outputText("[say: 你知道，我们俩都变成这样也不全是坏事……但记住，我也想试试那个，] 她说道，饥渴地盯着你的[cocks]。[pg]");
            }
         }
         outputText("你对她笑了笑，示意她可以脱掉自己的衣服。艾米莉看起来有些尴尬，她脱下衣服，露出挺拔的双乳和那根紧绷、渴望的肉棒供你仔细端详。你走上前，伸出手轻轻抚摸那根滚烫、跳动的阴茎，惹得这位扶她老鼠发出一声愉悦的呻吟，这诱使你握住它，将她引向临时搭建的床铺。你在那里仰面躺下，张开你的");
         if(get_player().isBiped())
         {
            outputText("[legs]，准备迎接她。");
         }
         else
         {
            outputText("[cunt]，准备迎接她。");
         }
         outputText("艾米莉跪在它们之间，很容易就能看出你想要什么。[pg]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,161) == 0)
         {
            outputText("[say: 呃……你真的确定要这样吗？我是说……] 艾米莉不确定地低语着，直到你不耐烦地突然用[legs]环住她的腰，将她拉近最后几英寸，把她的肉棒狠狠地撞进你饥渴的小穴里。她震惊地" + (amilyFurry() ? "吱吱叫" : "喘息") + "了一声，试图拔出来，但你仍然紧紧抓着她，把她拉回来，这个过程重复了几次，直到她适应了节奏，艾米莉开始自己前后抽插起来。[pg]");
         }
         else
         {
            outputText("艾米莉抓住你的[hips]，鼓起勇气，然后将她的阴茎插入你的深处。起初她很谨慎，开始前后抽插，随着决心的增强，她的动作越来越快，越来越用力。");
         }
         get_player().cuntChange(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) * FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,46),true,true,false);
         outputText("[pg]");
         outputText("艾米莉的动作绝对算不上你在玛瑞斯见过的最专业的性技巧，但她想让你尽可能舒服的意图很明显，而且她用热情弥补了技巧的不足，" + (amilyFurry() ? "吱吱叫着" : "喘息着") + "，呻吟着，因为你的" + get_player().vaginaDescript() + "紧紧包裹着她新长出的阴茎，这种陌生的感觉充满了她的全身。你也尽最大努力让这一切变得美好，但艾米莉显然没有拥有男性性器官的经验，她很快就失去了控制，伴随着一声响亮的" + (amilyFurry() ? "吱吱叫" : "呻吟") + "，你感觉到她把精液射进了你饥渴的[vagina]里。滚烫的液体从她的扶她肉棒中喷涌而出，当最后几滴滴落后，她瘫倒在你身上，喘着粗气。[pg]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,161) == 0)
         {
            outputText("[say: ……我不知道感觉会是这样，] 她轻声喘息着。[pg]");
         }
         else
         {
            outputText("[say: 每次发生这种事都会让我受不了。男人就是这种感觉吗？] 她好奇地问。[pg]");
         }
         outputText("你微笑着伸出手抚摸她的脸颊。她也回以微笑，伸手拍了拍你的肚子。");
         if(get_player().isPregnant())
         {
            if(get_player().get_pregnancyType() == 11)
            {
               outputText("[say: 天哪，这太奇怪了。我明明是个女人，却要当爸爸了。.]");
            }
            else
            {
               outputText("[say: 等你生下这个孩子，准备好要我的孩子时再来找我。这真的太奇怪了，我明明是个女人，却迫不及待地想当爸爸。.]");
            }
         }
         else
         {
            outputText("[say: 看看你这胎能不能当上妈妈……如果不行，好吧，我想我们只能再试一次了。.]");
            get_player().knockUp(11,350);
         }
         outputText("你轻声笑着，躺在那里拥抱了你的爱人一会儿，然后依依不舍地穿好衣服离开了。");
         get_player().orgasm("Generic");
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,161,FlagDict_Impl_.arrayReadInt(_loc1_,161) + 1);
         _loc1_ = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,42,FlagDict_Impl_.arrayReadInt(_loc1_,42) + 1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function helpThatFukkinUngratefulBitchGiveBirth() : void
      {
         clearOutput();
         amilySprite();
         outputText("你本能地走上前去。艾米莉正在分娩——她需要帮助。作为父亲，你想要帮助她也是理所当然的。[pg]");
         outputText("[say:呃嗯……[name]？你在干什么？]艾米莉问道，随后又因一阵宫缩而呻吟起来。你跪在她身边，安慰她说你是来帮忙的，并伸出手抚摸她肿胀的腹部，将双手放在那圆滚滚的肚子两侧。你不知道还能做什么，于是开始轻轻按摩，试图在每次肌肉紧绷后放松和舒缓它们，减轻她经历下一次宫缩时的痛苦。她刚想向你道谢，却又咬紧了牙关，");
         if(amilyFurry())
         {
            outputText("将小嘴朝向天空，痛苦地嘶嘶作响");
         }
         else
         {
            outputText("痛苦地嘶嘶作响");
         }
         outputText("，因为迄今为止最强烈的一阵宫缩袭来——孩子露头了！你的双手立刻向下探去，悬停在她的阴道下方，只见一个粉嫩、光秃秃、扭动着的小东西从张开的阴唇间滑落。这个小身体在你手中轻得惊人，但当它吸入第一口气时，却发出了响亮的吱吱声——更正一下，是“她”的第一口气。这是一个");
         var _loc1_:String = "女孩";
         if((get_player().get_gender() == 3 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) > 0) && Utils.rand(2) == 0)
         {
            _loc1_ = "扶她";
         }
         if(get_player().get_gender() == 3 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) > 0)
         {
            _loc1_ = "扶她";
         }
         outputText(_loc1_ + "。[pg]");
         outputText("你充满敬畏地告诉艾米莉，她很美，而且你是真心的。即使她是不同的物种，她也是你的女儿，在你眼里她美极了。[pg]");
         outputText("[say: 真好……但她后面还有很多，所以……] 随着又一阵宫缩袭来，艾米莉的声音渐渐微弱，你看到第二个婴儿开始从她的下体探出头来。看到你惊慌失措的表情，她勉强挤出一丝苦笑。[say: 只要……把她放到我的乳房上。她自己会处理好的，] 她指示你。[pg]");
         outputText("你有些不确定，但还是照做了；你的女儿紧紧贴着她母亲的");
         if(amilyFurry())
         {
            outputText("皮毛");
         }
         else
         {
            outputText("胸部");
         }
         outputText("，急切地寻找着乳头，而你的双手则迅速向下伸去，接住她的第一个弟弟或妹妹。这几乎成了一种节奏；接住一个婴儿，把他或她放在艾米莉的胸前吃奶，接住下一个婴儿……足足生了十几个婴儿——你觉得可能多达二十几个——艾米莉才终于停下来，胞衣涌出，标志着她分娩的结束。你轻轻地接住她，把她放在一块柔软的地上休息。在你们周围，你们的许多孩子在玩耍；虽然刚出生不久，但他们现在已经能用两条腿强壮而骄傲地站立了。");
         if(amilyFurry())
         {
            outputText("他们的皮毛也长出来了，这是喝下第一口母乳后触发的。");
         }
         else
         {
            outputText("他们的头发也开始加速生长。");
         }
         outputText("你的长女已经开始确立自己作为这群孩子的领导者的地位，你情不自禁地注意到她的");
         if(amilyFurry())
         {
            outputText("皮毛");
         }
         else
         {
            outputText("头发");
         }
         outputText("和你头发的颜色一样。[pg]");
         outputText("艾米莉很累，但她幸福地对着你微笑。[say: 我……谢谢你。谢谢你在这里。为了我——也为了他们，] 她说。你向她保证这没什么大不了的。你和她坐在那里，让你那些好奇的孩子们打量你、和你扭打在一起，而他们的母亲则在恢复体力。[pg]");
         outputText("当这些喧闹的小老鼠耗尽了精力，蜷缩在艾米莉身边睡着时，你轻轻地告辞，回到了营地。");
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,38,FlagDict_Impl_.arrayReadInt(_loc2_,38) + 5);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function harvestMilk() : void
      {
         clearOutput();
         amilySprite();
         outputText("你告诉艾米莉，你希望她尽可能多地连接在挤奶机上；你需要她的体液。");
         outputText("[pg][say: 你想把我当动物一样使用吗，[master]？每天像榨干一头肉牛一样榨干我的乳房？] 艾米莉浑身颤抖，一想到这里，她的淫水就弄脏了身下的地面。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1094) == 0)
         {
            outputText("[pg][say: 不-不过很抱歉，主人。我产的奶对您来说可能用处不大。您可以和惠特尼大人谈谈，也许她能造出一台可以浓缩它的机器。.]");
         }
         else
         {
            outputText("[pg][say: 这是我的荣幸，[master]！]!]");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1094) == 1)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1096,1);
         }
         doNext(get_game().farm.farmCorruption.rootScene);
      }
      
      public function giveCorruptAmilySuccubusDelight() : void
      {
         clearOutput();
         amilySprite();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,171) == 0)
         {
            outputText("你拿起一瓶魅魔之悦，把它展示给艾米莉。[say: 喝了这个，]你命令她，把瓶子递给她。[say: 你要给我长睾丸，[master]？你确定吗？][pg]");
            doYesNo(amilyDrinksSuccubusDelight,amilyFollowerEncounter);
         }
         else
         {
            amilyDrinksSuccubusDelight();
         }
      }
      
      public function giveAmilySomeReducto() : void
      {
         var part4:int;
         var _g4:AmilyScene;
         var part3:int;
         var _g3:AmilyScene;
         var part2:int;
         var _g2:AmilyScene;
         var part1:int;
         var _g1:AmilyScene;
         var part:int;
         var _g:AmilyScene;
         clearOutput();
         outputText("当你向她展示这种药膏时，她因为那难闻的气味皱起了鼻子，尽管你解释说它能缩小过大的身体部位，而且你可以用它来缩小任何她觉得太大的部位。");
         menu();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,47) > 1)
         {
            _g = this;
            part = 0;
            addButton(0,"乳房",function():void
            {
               _g.amilyReducto(part);
            });
         }
         if(FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,48) > 0.5)
         {
            _g1 = this;
            part1 = 1;
            addButton(1,"乳头",function():void
            {
               _g1.amilyReducto(part1);
            });
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,49) > 6)
         {
            _g2 = this;
            part2 = 2;
            addButton(2,"臀部",function():void
            {
               _g2.amilyReducto(part2);
            });
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) > 4)
         {
            _g3 = this;
            part3 = 3;
            addButton(3,"阴茎",function():void
            {
               _g3.amilyReducto(part3);
            });
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,50) > 6)
         {
            _g4 = this;
            part4 = 4;
            addButton(4,"屁股",function():void
            {
               _g4.amilyReducto(part4);
            });
         }
         setExitButton("返回",giveAmilyAPresent);
      }
      
      public function giveAmilySomePants() : void
      {
         clearOutput();
         amilySprite();
         outputText("你递给她一套舒适的衣服，问她是否愿意穿上这些，而不是她现在穿的[amilyclothing]。[pg]");
         if(FlagDict_Impl_.arrayReadString(KFLAGS.flags,52) == "")
         {
            FlagDict_Impl_.arrayWriteString(KFLAGS.flags,52,"rags");
         }
         if(FlagDict_Impl_.arrayReadString(KFLAGS.flags,52) == "rags" || FlagDict_Impl_.arrayReadString(KFLAGS.flags,52) == "sexy rags")
         {
            outputText("她的眼睛亮了起来。[say: 哦，我一直想要些新衣服！求你了，给我吧！]她高兴地尖叫着，当你把衣服递给她时，她毫不在意地脱下旧衣服扔到一边，然后穿上新装备。她漫不经心地在原地转圈，努力检查自己的样子，然后跑到小溪边，想更好地看看自己的倒影。");
            FlagDict_Impl_.arrayWriteString(KFLAGS.flags,52,"comfortable clothes");
         }
         else if(FlagDict_Impl_.arrayReadString(KFLAGS.flags,52) != "comfortable clothes")
         {
            outputText("[say: 更多新衣服？哦，你太宠我了，[name]！]她打趣道。在你面前赤身裸体，她丝毫没有感到羞愧，脱下衣服，尽力给你表演了一番。然后她穿上了你给的新衣服。[say: 我看起来怎么样？]她咯咯地笑着。[pg]");
            outputText("你向她保证她看起来很美。[say: 马屁精。]她假笑了一下，然后漫步走向小溪。");
         }
         get_player().consumeItem(get_armors().C_CLOTH);
         saveContent.giftedCClothes = true;
         doNext(amilyFollowerEncounter);
      }
      
      public function giveAmilyPurifiedSuccubusMilk() : void
      {
         var _loc2_:* = null as IMap;
         clearOutput();
         amilySprite();
         var _loc1_:int = getMaxSize(5,5,22);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,43) == 1)
         {
            outputText("你递给她一瓶恶魔乳液，并向她保证里面的腐化成分已经被去除了。[pg]");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,47) < _loc1_)
            {
               outputText("她对你笑了笑。[say: 我一直都有点想要更大的乳房，]她有些不好意思地承认道。她从你手中接过瓶子，急切地一饮而尽。然后她扔掉空瓶子，任由它在地上摔碎，她抓着自己的乳房，因为它们肉眼可见地膨胀而狂喜地呻吟着，她的衣服也随之变得越来越紧。当变化结束时，她高兴地挤压着它们。[say: 嗯……感觉真好。你还有什么事吗？][pg]");
               _loc2_ = KFLAGS.flags;
               FlagDict_Impl_.arrayWriteInt(_loc2_,47,FlagDict_Impl_.arrayReadInt(_loc2_,47) + 1);
               get_player().consumeItem(get_consumables().P_S_MLK);
            }
            else
            {
               outputText("她若有所思地看了一会儿，然后不情愿地摇了摇头。[say: 亲爱的，我很抱歉，真的，但我觉得我的胸部已经够大了。]然后她得意地笑了笑，调皮地抖动着她那丰满的乳沟。[say: 你不觉得吗？]她调侃道。[pg]");
               outputText("你艰难地咽了口唾沫，不得不表示同意，这让艾米莉笑了起来。");
               dynStats(DynStat.Lust(5));
            }
         }
         else
         {
            if(get_player().hasItem(get_consumables().SUCMILK))
            {
               get_player().consumeItem(get_consumables().SUCMILK);
            }
            else
            {
               get_player().consumeItem(get_consumables().P_S_MLK);
            }
            outputText("你拿起一瓶魅魔乳液给艾米莉看，问她知不知道该怎么用。[say: 你想让我喝掉它吗，[master]？]她舔着嘴唇问你。你微笑着回答：[say: 没错。]然后你把她推倒仰卧，将她的双腿抬过肩膀，向你露出她湿润的小穴。[say: 只不过，你要用这两片嘴唇来喝，]你补充道。艾米莉赞同地笑了，显得很兴奋。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) > 0)
            {
               outputText("她的肉棒因为你的主意而兴奋地硬了起来。");
            }
            outputText("[pg]");
            outputText("你拔掉瓶塞，用一只手拨开艾米莉的小穴，将瓶里的液体倒进艾米莉饥渴的穴肉中。[say: 啊，[master]！感觉太棒了！就像精液一样，]艾米莉舒服地呻吟着。液体很快消失在艾米莉的子宫里，引发了这个淫荡老鼠奴隶的高潮。");
            _loc2_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc2_,172,FlagDict_Impl_.arrayReadInt(_loc2_,172) + 1);
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,172) >= 5)
            {
               outputText("一股淫液从她的小穴里直射而出，在空中划出一道弧线，正好喷在她的脸上。");
            }
            else
            {
               outputText("汁液像泉水一样从她的小穴里涌出，顺着她的身体流下，在她身下汇聚成一滩。");
            }
            outputText("[pg]");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,172) < 5)
            {
               outputText("你松开艾米莉的腿，她扑通一声坐进了自己汇聚的汁液中。你观察着她从高潮的余韵中平息下来，发现她的小穴现在更湿了；你很想让她用用这个刚润滑过的小穴，但还是忍住了。[pg]");
               outputText("让她欲火焚身会更有趣；毫无疑问，在吸收了这剂健康的乳液后，她的小穴肯定会变得格外敏感。你扔掉瓶子，漫不经心地大步走回营地，留下艾米莉在她的汁液中喘息。");
            }
            else
            {
               outputText("你松开艾米莉的腿，她扑通一声坐进了自己汇聚的汁液中。你观察着她从高潮的余韵中平息下来，发现她的小穴还在喷射出一股股细小的液体；看来给她更多的魅魔乳液除了……你轻轻戳了一下艾米莉的阴蒂，她舒服地尖叫起来，再次达到了高潮。[pg]");
               outputText("看来给她更多的乳液只会让她的小穴变得更敏感。你很想利用她这个新变得敏感的小穴，但还是忍住了。让她欲火焚身会更有趣。你扔掉瓶子，漫不经心地大步走回营地，留下艾米莉在她的汁液中喘息。");
            }
         }
         doNext(amilyFollowerEncounter);
      }
      
      public function giveAmilyPureSuccubusDelight() : void
      {
         clearOutput();
         amilySprite();
         outputText("你递上那瓶纯净的魅魔之悦——艾米莉立刻向后跳去，发出一声尖锐的吱吱声，音量几乎接近尖叫。[pg]");
         outputText("[say: 那是液态的腐化！]她抗议道。[say: 你疯了吗？我才不喝那个，你也不应该喝！][pg]");
         outputText("你急忙向她保证药水已经净化过了，所以你们俩都不用担心会加入恶魔的行列。她看起来仍然很怀疑，但随后慢慢地点了点头，向你走来。[pg]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,171) == 0)
         {
            outputText("[say:好吧……但是，你确定要把它给我吗？你知道这会让我长出蛋蛋的，对吧？][pg]");
            doYesNo(amilyDrinksSuccubusDelight,amilyFollowerEncounter);
            return;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,171) > 0)
         {
            outputText("[say:好吧……但是，我不想让我的蛋蛋变得更大了。抱歉。][pg]");
            doNext(amilyFollowerEncounter);
            return;
         }
         outputText("[say:好吧……但是，我没有阴茎。不然的话，我就没法高潮了。抱歉。][pg]");
         doNext(amilyFollowerEncounter);
      }
      
      public function giveAmilyPureIncubusDraft4Realz() : void
      {
         clearOutput();
         amilySprite(true);
         get_player().consumeItem(get_consumables().P_DRAFT);
         outputText("向她保证这就是你想要的，你把药水递了过去。艾米莉不情愿地接过它，然后喝了下去，浑身发抖——首先是对她实际喝下的东西感到厌恶，然后是愉悦。她狂喜地呻吟着，脱下裤子让你看个清楚，她的阴蒂肿胀起来，变得更长更粗；最后，顶端的皮肤剥落，露出了毫无疑问是阴茎龟头的东西，当她体验到她的第一次男性高潮时，还伴随着一个喷射精液的裂口。[pg]");
         outputText("艾米莉现在变成了双性人。她那类似人类的阴茎有四英寸长，一英寸粗。[pg]");
         outputText("她喘着粗气，用一种难以捉摸的表情盯着自己新长出的器官，然后皱着眉头穿上衣服。你决定给她一点独处的时间，让她适应这种变化。");
         amilyDickGrow();
         doNext(playerMenu);
      }
      
      public function giveAmilyPureIncubusDraft() : void
      {
         amilySprite(true);
         clearOutput();
         var _loc1_:int = getMaxSize(13,15,23);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,43) == 1)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) > 0)
            {
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) >= _loc1_)
               {
                  outputText("艾米莉看到你走近时手里拿着的小瓶，摇了摇头。[say: 我不确定我是否应该再吃那种东西了。][pg]");
                  outputText("看到你失望的表情，她解释道：[say: 你想让我更多地进入你的身体，我感到很荣幸，但这东西已经快有我五分之一大了。如果它再变大，我勃起时就很难保持清醒了。][pg]");
                  if(get_player().cor >= 50 || get_player().vaginalCapacity() >= 50)
                  {
                     outputText("你努力掩饰着自己的失望，你曾幻想过被她不断变大的阴茎撑到失去理智的淫秽画面，但你无法否认她的逻辑：一个失去意识的鼠娘可没那么好玩，即使她天赋异禀。");
                     if(get_player().cor >= 75)
                     {
                        outputText("尽管用你扶她老鼠情人的无助身体强奸自己的想法很诱人，但你意识到这场争论你根本赢不了。");
                     }
                     outputText("[pg]");
                  }
                  else
                  {
                     outputText("她的逻辑无可辩驳，尽管你曾期待着能比以前更多地享受她的身体。你点点头，解释说你完全理解；你最希望的是对她最好的。[pg]");
                  }
                  outputText("你把小瓶放回袋子里，艾米莉借故离开了。");
                  doNext(playerMenu);
                  return;
               }
               outputText("她轻蔑地看着你手里的小瓶。[say: 怎么，我还不够大吗？好吧，我想如果这能让你高兴的话。]她从你手里一把夺过小瓶，一饮而尽。她极力装出一副无所谓的样子，但当她的阴茎勃起并变长，至少长了整整一英寸时，她还是忍不住发出愉悦的呻吟，渗出的前列腺液弄脏了她的衣服。她大口喘着粗气，气喘吁吁地说：[say: 为什么这感觉真的这么好？]然后她转过身，像喝醉了一样踉踉跄跄地走开了。你决定不跟着她，而是朝另一个方向走去。[pg]");
               get_player().consumeItem(get_consumables().P_DRAFT);
               amilyDickGrow();
               doNext(playerMenu);
            }
            else
            {
               outputText("你递上那瓶纯净的梦魔药水——艾米莉立刻发出一声尖锐的吱吱声，音量大得几乎像是在尖叫，并迅速向后跳开。[pg]");
               outputText("[say: 那是液态的腐化！]她抗议道。[say: 你疯了吗？我才不喝那个，你也不应该喝！][pg]");
               outputText("你急忙向她保证药水已经净化过了，所以你们俩都不用担心会加入恶魔的行列。她看起来仍然很怀疑，但随后慢慢地点了点头，向你走来。[pg]");
               outputText("[say: 好吧……但是，你确定要把它给我吗？你知道这会让我长出阴茎，对吧？][pg]");
               doYesNo(giveAmilyPureIncubusDraft4Realz,amilyFollowerEncounter);
            }
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) == 0)
         {
            if(get_player().hasItem(get_consumables().INCUBID))
            {
               get_player().consumeItem(get_consumables().INCUBID);
            }
            else
            {
               get_player().consumeItem(get_consumables().P_DRAFT);
            }
            outputText("你拿起一瓶梦魔药水，展示给艾米莉看。然后你命令她喝下去，把瓶子递给她。[say: " + get_player().mf("主人","女主人") + "，这会让我长出鸡巴的。你确定要这么做吗？][pg]");
            outputText("你告诉她是的，这正是你想要的。艾米莉微笑着，诱惑地回答道：[say: 如您所愿，[master]。][pg]");
            outputText("她一口气喝光了瓶子里的药水，然后随着阴蒂上聚集的热量开始呻吟。你把她推倒，告诉她张开双腿，你想看着；她默默地顺从了，继续喘息和呻吟着。她的阴蒂开始膨胀，生长着，慢慢地向上移动，离开它在小穴里的藏身之处，从她的胯部向上伸展。它是紫粉色的，在生长的过程中溢出精液，刚好停在她的肚脐下方，在那里又喷射出几股精液。[pg]");
            outputText("艾米莉停止了呻吟；显然变形已经结束了……但这根鸡巴太小了……只有四英寸长，勉强一英寸粗……[pg]");
            outputText("你要让她长出一根巨大的鸡巴吗？");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,45,4);
            FlagDict_Impl_.arrayWriteFloat(KFLAGS.flags,46,1);
            doYesNo(corruptAmilyGetsDickMaxxedOut,corruptAmilyYouDeclineMaxxingHerDick);
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) < _loc1_ && FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,46) < 3)
         {
            if(get_player().hasItem(get_consumables().INCUBID))
            {
               get_player().consumeItem(get_consumables().INCUBID);
            }
            else
            {
               get_player().consumeItem(get_consumables().P_DRAFT);
            }
            outputText("你拿起一瓶梦魔药水，展示给艾米莉看。把瓶子递给她，你告诉她你希望她有一根更大的鸡巴。艾米莉微笑着说：[say: 如您所愿，[master]，您的命令是我的荣幸。][pg]");
            outputText("她张开双腿让你看个清楚，然后一口气喝光了整瓶药水。当她的鸡巴变成紫色并变得异常坚硬时，她呻吟着，射精时青筋在肉棒上暴起。随着每一次跳动，她的鸡巴都会变得更长更粗一点，最后在变大了几英寸时停了下来。她愉悦地喘息着说：[say: 谢谢您，[master]，让这个发情的精液桶有幸拥有如此美妙的工具。][pg]");
            outputText("你满意地挥挥手让她退下，然后去忙自己的事了。");
            amilyDickGrow();
            doNext(playerMenu);
         }
         else
         {
            outputText("你重新考虑了一下——她娇小的身躯可能承受不了更大的尺寸。");
            doNext(amilyFollowerEncounter);
         }
      }
      
      public function giveAmilyClothes() : void
      {
         var _loc3_:* = null as String;
         var _loc4_:* = null as String;
         clearOutput();
         var _loc1_:Array = [];
         if(saveContent.giftedCClothes)
         {
            _loc1_.push("舒适的衣服");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,636) != 0)
         {
            _loc1_.push("比基尼");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,775) != 0)
         {
            _loc1_.push("护士服");
         }
         if(int(_loc1_.length) != 0)
         {
            outputText("[b:艾米莉的衣物:]");
         }
         var _loc2_:int = 0;
         while(_loc2_ < int(_loc1_.length))
         {
            _loc3_ = _loc1_[_loc2_];
            _loc2_++;
            _loc4_ = _loc3_;
            outputText("[pg-]" + _loc4_);
         }
         outputText("[pg]你要给她什么？");
         menu();
         var _loc5_:ButtonDataList = new ButtonDataList();
         if(get_player().hasItem(get_armors().S_SWMWR) && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,636) == 0 && get_player().hasCockThatFits(61) && !amilyCorrupt())
         {
            outputText("[pg]你可以给她一件比基尼，然后邀请她去溪里游泳，好展示一下。[pg]");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,775) == 0 && !amilyCorrupt() && get_player().hasItem(get_armors().NURSECL) && get_player().hasCockThatFits(61))
         {
            outputText("[pg]你可以把得到的护士服给艾米莉，虽然它几乎遮不住什么，而且很可能会引诱这个变态的鼠娘来一场角色扮演。[pg]");
         }
         if(!saveContent.giftedCClothes)
         {
            _loc5_.add(get_armors().C_CLOTH.get_shortName(),giveAmilySomePants,get_armors().C_CLOTH.get_description(),get_armors().C_CLOTH.get_shortName(),get_player().hasItem(get_armors().C_CLOTH));
         }
         if(!amilyCorrupt())
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,636) == 0)
            {
               _loc5_.add(get_armors().S_SWMWR.get_shortName(),amilySwimFuckIntro,get_armors().S_SWMWR.get_description(),get_armors().S_SWMWR.get_shortName(),get_player().hasItem(get_armors().S_SWMWR) && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,636) == 0 && get_player().hasCockThatFits(61));
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,775) == 0)
            {
               _loc5_.add(get_armors().NURSECL.get_shortName(),amilyNurseCheckup,get_armors().NURSECL.get_description(),get_armors().NURSECL.get_shortName(),FlagDict_Impl_.arrayReadInt(KFLAGS.flags,775) == 0 && get_player().hasItem(get_armors().NURSECL) && get_player().hasCockThatFits(61));
            }
         }
         _loc5_.submenu(amilyGiftMenu);
      }
      
      public function giveAmilyAWhiteEgg() : void
      {
         clearOutput();
         amilySprite();
         var _loc1_:int = getMaxSize(4,4,8);
         outputText("你递出一个白色的蛋，告诉她这会让她的乳头变大。[pg]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,43) == 1)
         {
            if(FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,48) < _loc1_)
            {
               outputText("她怀疑地看着它。[say:我想更大的乳头会更敏感吧……]她嘟囔着，但还是从你手中接过了它。她不假思索地咬掉顶部，熟练地一口吞下里面的东西。她在手中捏碎蛋壳，拉开上衣，让你看到她的乳头肿胀变大，直到停止生长。她试探性地捏了捏其中一个，被这种感觉震惊得吱吱叫了起来。[say:嗯……我想感觉确实挺不错的……还有什么别的吗？][pg]");
               amilyNippleGrow();
            }
            else
            {
               outputText("她摇了摇头。[say:抱歉，但我觉得这些已经够大够敏感了。我是老鼠，不是奶牛。]说完，她坚持走开了，显然是不打算吃这个蛋了。你把它放回口袋，决定随她去吧。");
            }
         }
         else
         {
            if(FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,48) < _loc1_)
            {
               outputText("她看着它，会意地笑了。[say:" + get_player().mf("master","mistress") + "是想把人家的乳头变成淫秽的玩具吗？]她一边接过蛋一边问道。她咬掉顶部，熟练地一口吞下里面的东西。她在手中捏碎蛋壳，拉开上衣，让你看到她的乳头肿胀变大，直到停止生长。她试探性地捏了捏其中一个，被这种感觉震惊得吱吱叫了起来。[say:谢谢[master]给你的荡妇这么棒的乳头玩具。你现在想虐待你荡妇饥渴的小穴吗？][pg]");
            }
            else
            {
               outputText("她看着它，淫荡地呻吟着，[say:我的乳头一定会为你变得超级大的，" + get_player().mf("master","mistress") + "。不，乳头不对。它们现在是乳房了。你这只鼠辈性奴身上巨大、肿胀的母牛乳房。让我们把它们变得更大吧！]她咬掉顶部，熟练地一口吞下里面的东西。她在手中捏碎蛋壳，拉开上衣，让你看到她的乳头肿胀并垂得更低。她试探性地捏了捏其中一个，被这种感觉震惊得吱吱叫了起来。[say:谢谢[master]让你的荡妇的身体除了做爱什么都干不了。你现在想虐待你荡妇饥渴的小穴吗？][pg]");
            }
            amilyNippleGrow();
         }
         doNext(amilyFollowerEncounter);
      }
      
      public function giveAmilyAPurpleEgg() : void
      {
         var _loc2_:* = null as IMap;
         clearOutput();
         amilySprite();
         var _loc1_:int = getMaxSize(16,20,20);
         outputText("你递出一个紫色的蛋，告诉她这会让她的臀部变宽。[pg]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,43) == 1)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,49) < _loc1_)
            {
               outputText("她若有所思地看着它。[say: 更宽的臀部……？好吧，如果你真的想要，我想我可以试试。]她从你手中接过蛋，突出的门牙毫不费力地咬掉顶部，然后熟练地一口吞下里面的东西。她在手中捏碎蛋壳，随着臀部突然变宽，她差点失去平衡，生长的速度比她预想的要快得多。[say: 我现在得习惯这样走路了，]她嘟囔着，然后笨拙地走开了。[pg]");
               if(get_player().hasItem(get_consumables().PURPLEG))
               {
                  get_player().consumeItem(get_consumables().PURPLEG);
                  _loc2_ = KFLAGS.flags;
                  FlagDict_Impl_.arrayWriteInt(_loc2_,49,FlagDict_Impl_.arrayReadInt(_loc2_,49) + (1 + Utils.rand(2)));
               }
               else
               {
                  get_player().consumeItem(get_consumables().L_PRPEG);
                  _loc2_ = KFLAGS.flags;
                  FlagDict_Impl_.arrayWriteInt(_loc2_,49,FlagDict_Impl_.arrayReadInt(_loc2_,49) + (2 + Utils.rand(3)));
               }
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,49) > _loc1_)
               {
                  FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,49,_loc1_);
               }
            }
            else
            {
               outputText("她挑起一根眉毛看着你。[say: 再大一点，我就跑不动了。不用了，谢谢；我觉得我已经够有女人味了，而且它们不会影响我的速度。]她转过身，尽可能快地溜达着走开，但故意扭动着臀部，似乎是为了证明她的两个观点。");
               dynStats(DynStat.Lust(4));
            }
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,49) < _loc1_)
         {
            outputText("她若有所思地看着它。[say: " + get_player().mf("主人","女主人") + "想让我的臀部更宽？你是打算把我当成你的私人繁育母畜吗？嗯，这让我很兴奋！]她从你手中接过蛋，突出的门牙毫不费力地咬掉顶部，然后熟练地一口吞下里面的东西。她在手中捏碎蛋壳，随着臀部突然变宽，她差点失去平衡，生长的速度比她预想的要快得多。[say: 天哪，这让我湿透了！要我……我们现在就做爱吧，求你了！]她乞求道。[pg]");
            if(get_player().hasItem(get_consumables().PURPLEG))
            {
               get_player().consumeItem(get_consumables().PURPLEG);
               _loc2_ = KFLAGS.flags;
               FlagDict_Impl_.arrayWriteInt(_loc2_,49,FlagDict_Impl_.arrayReadInt(_loc2_,49) + (1 + Utils.rand(2)));
            }
            else
            {
               get_player().consumeItem(get_consumables().L_PRPEG);
               _loc2_ = KFLAGS.flags;
               FlagDict_Impl_.arrayWriteInt(_loc2_,49,FlagDict_Impl_.arrayReadInt(_loc2_,49) + (2 + Utils.rand(3)));
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,49) > _loc1_)
            {
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,49,_loc1_);
            }
         }
         else
         {
            outputText("她大口吃下你递给她的蛋，但什么也没发生。[say: 荡妇的身体已经到了极限，[master]。她巨大的繁育臀部无法再变宽了。你想操我吗？]她问道，催眠般地前后摇晃着她那可观的肉体。");
            dynStats(DynStat.Lust(4));
         }
         doNext(amilyFollowerEncounter);
      }
      
      public function giveAmilyAPresent() : void
      {
         var _g:AmilyScene;
         var _loc12_:* = null as ButtonData;
         var _loc13_:* = null as ButtonData;
         var _loc14_:* = null as Object;
         amilySprite();
         clearOutput();
         menu();
         var _loc1_:ButtonDataList = new ButtonDataList();
         var _loc2_:Boolean = false;
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,43) == 1)
         {
            outputText("你告诉艾米莉，你有些东西想送给她。[pg]");
            outputText("[say: 噢，你真贴心。]她微笑着，满心欢喜，充满爱意。[pg]");
         }
         else
         {
            outputText("你看着这个发情的精液桶，寻思着这次该让她吃点什么。[pg]");
         }
         var _loc3_:ItemType = !amilyCorrupt() || get_player().hasItem(get_consumables().P_DRAFT) && !get_player().hasItem(get_consumables().INCUBID) ? get_consumables().P_DRAFT : get_consumables().INCUBID;
         var _loc4_:ItemType = !amilyCorrupt() || get_player().hasItem(get_consumables().P_S_MLK) && !get_player().hasItem(get_consumables().SUCMILK) ? get_consumables().P_S_MLK : get_consumables().SUCMILK;
         var _loc5_:ItemType = !amilyCorrupt() || get_player().hasItem(get_consumables().PSDELIT) && !get_player().hasItem(get_consumables().SDELITE) ? get_consumables().PSDELIT : get_consumables().SDELITE;
         var _loc6_:ItemType = get_player().hasItem(get_consumables().L_PNKEG) && !get_player().hasItem(get_consumables().PINKEGG) ? get_consumables().L_PNKEG : get_consumables().PINKEGG;
         var _loc7_:ItemType = get_player().hasItem(get_consumables().L_PRPEG) && !get_player().hasItem(get_consumables().PURPLEG) ? get_consumables().L_PRPEG : get_consumables().PURPLEG;
         var _loc8_:ItemType = get_player().hasItem(get_consumables().L_BRNEG) && !get_player().hasItem(get_consumables().BROWNEG) ? get_consumables().L_BRNEG : get_consumables().BROWNEG;
         var _loc9_:ItemType = get_player().hasItem(get_consumables().L_WHTEG) && !get_player().hasItem(get_consumables().WHITEEG) ? get_consumables().L_WHTEG : get_consumables().WHITEEG;
         _loc1_.add(_loc3_.get_shortName(),giveAmilyPureIncubusDraft,_loc3_.get_tooltipText(),_loc3_.get_tooltipHeader(),get_player().hasItem(_loc3_));
         _loc1_.add(_loc4_.get_shortName(),giveAmilyPurifiedSuccubusMilk,_loc4_.get_tooltipText(),_loc4_.get_tooltipHeader(),get_player().hasItem(_loc4_));
         _loc1_.add(_loc5_.get_shortName(),!amilyCorrupt() ? giveAmilyPureSuccubusDelight : giveCorruptAmilySuccubusDelight,_loc5_.get_tooltipText(),_loc5_.get_tooltipHeader(),get_player().hasItem(_loc5_));
         _loc1_.add(get_consumables().LACTAID.get_shortName(),makeTheMouseAMilkCowMoo,get_consumables().LACTAID.get_tooltipText(),get_consumables().LACTAID.get_tooltipHeader(),get_player().hasItem(get_consumables().LACTAID) && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,51) < 5);
         _loc1_.add(get_consumables().REDUCTO.get_shortName(),giveAmilySomeReducto,get_consumables().REDUCTO.get_tooltipText(),get_consumables().REDUCTO.get_tooltipHeader(),get_player().hasItem(get_consumables().REDUCTO));
         _loc1_.add(_loc6_.get_shortName(),giveAmilyAPinkEgg,_loc6_.get_tooltipText(),_loc6_.get_tooltipHeader(),get_player().hasItem(_loc6_) && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) > 0);
         _loc1_.add(_loc7_.get_shortName(),giveAmilyAPurpleEgg,_loc7_.get_tooltipText(),_loc7_.get_tooltipHeader(),get_player().hasItem(_loc7_));
         _loc1_.add(_loc8_.get_shortName(),giveAmilyABrownEgg,_loc8_.get_tooltipText(),_loc8_.get_tooltipHeader(),get_player().hasItem(_loc8_));
         _loc1_.add(_loc9_.get_shortName(),giveAmilyAWhiteEgg,_loc9_.get_tooltipText(),_loc9_.get_tooltipHeader(),get_player().hasItem(_loc9_));
         var _loc10_:int = 0;
         var _loc11_:Array = _loc1_.list;
         while(_loc10_ < int(_loc11_.length))
         {
            _loc12_ = _loc11_[_loc10_];
            _loc10_++;
            _loc13_ = _loc12_;
            _loc2_ ||= _loc13_.enabled;
         }
         if(!_loc2_)
         {
            if(!amilyCorrupt())
            {
               outputText("你意识到自己身上并没有什么她会感兴趣的东西，于是向她道歉。");
            }
            else
            {
               outputText("你意识到自己身上并没有什么值得用在她身上的东西。");
            }
         }
         if(amilyCorrupt())
         {
            _g = this;
            _loc14_ = function():void
            {
               _g.amilyMenu();
            };
         }
         else
         {
            _loc14_ = amilyGiftMenu;
         }
         _loc1_.submenu(_loc14_);
      }
      
      public function giveAmilyAPinkEgg() : void
      {
         clearOutput();
         amilySprite(true);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,43) == 1)
         {
            outputText("你递给她一个粉色的蛋，解释说这能消除她的阴茎。你话还没说完，她就一把从你手中抢过蛋，狼吞虎咽地咬了下去；她用力咀嚼时，蛋壳发出清脆的响声，她迫不及待地把它整个吞了下去，弄得一团糟。吃完后，她脱下裤子，看着<b>她的阴茎缩小、模糊，最终再次变回了她那娇小的阴蒂</b>。她轻轻地叹了口气。[pg]");
            outputText("[say:谢谢你，这真是让我松了一口气。那么，你还有什么别的想要的吗？]她欢快地吱吱叫着，很明显现在心情非常好。");
         }
         else
         {
            outputText("你递给她一个粉色的蛋，解释说这能消除她的阴茎。艾米莉看起来完全崩溃了，她说道：[say:是骚货没有把她的肉棒用好吗？精液垃圾桶非常抱歉，[master]，再也不会发生这种事了！]还没等你回答，她就从你手中抢过蛋开始吃了起来，狼吞虎咽地吃着，直到舔干净手指。吃完后，她脱下裤子，看着<b>她的阴茎缩小、模糊，最终再次变回了她那娇小的阴蒂</b>。[pg]");
            outputText("[say:那么，这个没用的精液收集器还能做些什么来取悦她的[master]呢？荡妇很抱歉让你失望了，]她伤心地吱吱叫着，仍然试图引诱你做爱。");
         }
         if(get_player().hasItem(get_consumables().PINKEGG))
         {
            get_player().consumeItem(get_consumables().PINKEGG);
         }
         else
         {
            get_player().consumeItem(get_consumables().L_PNKEG);
         }
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,45,0);
         FlagDict_Impl_.arrayWriteFloat(KFLAGS.flags,46,0);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,171,0);
         doNext(amilyFollowerEncounter);
      }
      
      public function giveAmilyABrownEgg() : void
      {
         var _loc2_:* = null as IMap;
         clearOutput();
         amilySprite();
         var _loc1_:int = getMaxSize(16,20,35);
         outputText("你递出一个棕色的蛋，告诉她这会让她的屁股变大。[pg]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,43) == 1)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,50) < _loc1_)
            {
               outputText("[say:所以，你想让我的屁股再丰满一点，是吗？]她咯咯地笑着。[say:好吧，我想下面多点肉也没什么坏处……]她从你手中接过蛋，突出的门牙毫不费力地咬掉顶部，然后熟练地一口吞下里面的东西。她在手中捏碎蛋壳，双手按在屁股上，转过身背对着你，试图越过肩膀看着它明显地肿胀起来，把裤子撑得紧紧的。她拍了几下，然后摇了摇头。[say:我现在得去把这条裤子放宽一点了。]她道了歉，然后走开了。[pg]");
               dynStats(DynStat.Lust(5));
               if(get_player().hasItem(get_consumables().BROWNEG))
               {
                  get_player().consumeItem(get_consumables().BROWNEG);
                  _loc2_ = KFLAGS.flags;
                  FlagDict_Impl_.arrayWriteInt(_loc2_,50,FlagDict_Impl_.arrayReadInt(_loc2_,50) + (1 + Utils.rand(2)));
               }
               else
               {
                  get_player().consumeItem(get_consumables().L_BRNEG);
                  _loc2_ = KFLAGS.flags;
                  FlagDict_Impl_.arrayWriteInt(_loc2_,50,FlagDict_Impl_.arrayReadInt(_loc2_,50) + (2 + Utils.rand(3)));
               }
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,50) > _loc1_)
               {
                  FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,50,_loc1_);
               }
            }
            else
            {
               outputText("她看着蛋，然后摇了摇头。[say:抱歉，但我的屁股对我来说已经够大了。]感觉她不会在这个问题上让步，你把蛋放了回去。[say:那么，你还有什么别的想要的吗？]她问道。");
            }
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,50) < _loc1_)
         {
            outputText("[say:所以，[master]想让[his]玩具发情的小穴和屁眼周围多点肉？]她咯咯地笑着。[say:我服从。]她从你手中接过蛋，突出的门牙毫不费力地咬掉顶部，然后熟练地一口吞下里面的东西。她在手中捏碎蛋壳，双手按在屁股上，转过身背对着你，试图越过肩膀看着它明显地肿胀起来，微微颤动。她拍了几下，然后摇了摇头。[say:你现在要使用你全新升级的精液垃圾桶吗？]她问道。[pg]");
            dynStats(DynStat.Lust(5));
            if(get_player().hasItem(get_consumables().BROWNEG))
            {
               get_player().consumeItem(get_consumables().BROWNEG);
               _loc2_ = KFLAGS.flags;
               FlagDict_Impl_.arrayWriteInt(_loc2_,50,FlagDict_Impl_.arrayReadInt(_loc2_,50) + (1 + Utils.rand(2)));
            }
            else
            {
               get_player().consumeItem(get_consumables().L_BRNEG);
               _loc2_ = KFLAGS.flags;
               FlagDict_Impl_.arrayWriteInt(_loc2_,50,FlagDict_Impl_.arrayReadInt(_loc2_,50) + (2 + Utils.rand(3)));
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,50) > _loc1_)
            {
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,50,_loc1_);
            }
         }
         else
         {
            outputText("艾米莉狼吞虎咽地吃下蛋，满怀期待地回头看，但这似乎并没有让她原本就巨大的臀部变得更大。她撅起嘴，呜咽着说，[say:荡妇很抱歉，但她的屁股已经大得不能再大了，[master]！]!]");
         }
         doNext(amilyFollowerEncounter);
      }
      
      public function girlyGirlMouseSex() : void
      {
         amilySprite(true);
         clearOutput();
         outputText("你牵起艾米莉的手，让她带你去她打算和你做爱的地方。很快，经过许多弯弯绕绕，你们来到了一个被掏空的建筑里的临时卧室。[pg]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,160) == 0)
         {
            outputText("艾米莉停下脚步，松开你的手，微微脸红，看起来有些尴尬。[say: 那么，啊……我们该怎么做？我……我以前从未被其他女人吸引过，我们之间做爱到底是怎么回事？][pg]");
         }
         else
         {
            outputText("[say: 还记得你第一次是怎么主动的吗？] 她咧嘴一笑。[say: 想看看你是否宝刀未老吗？][pg]");
         }
         outputText("你对她微笑，轻轻地将一只手放在她的下巴下，然后将她拉近。你深深地、温暖地吻了她，没有试图强迫任何事情，而是让她自愿地被吸引。当她开始回吻你时，你轻轻地将手伸进她的衬衫，开始抚摸她娇小柔软的乳房。当你抚摸和挑逗那敏感的肌肤，用拇指诱人地在每个乳头周围摩擦时，艾米莉呻吟起来，她的尾巴突然痉挛般地缠绕在你的[leg]上，这很清楚地表明她很享受这一切，并且已经准备好了。[pg]");
         outputText("你慢慢地将她引到她的铺盖上，直到她仰面躺下，你才结束了这个吻。艾米莉看起来有些茫然，然后对你咧嘴一笑。[say: 哇。] 你微笑着回应，开始脱下你的[armor]——艾米莉看到后，也急忙开始脱下她自己破烂的衣服。当你们俩都赤身裸体时，你给了她最后一个吻，然后轻轻地坐在她身上，背对着她。你慢慢地躺在她身上，让你能完美地看到她粉红色的、赤裸的小穴，也让她能与你自己的" + get_player().vaginaDescript(0) + "面对面。[pg]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,160) == 0)
         {
            outputText("[say: ……我是不是应该舔你那里？] 艾米莉犹豫地问。你得意地笑了笑，立刻在她的私处给了她一个长长、湿漉漉的舔舐。她震惊地尖叫了一声，然后笨拙地回舔了你。[pg]");
         }
         else
         {
            outputText("艾米莉不需要任何指导，就把她的舌头尽可能深地探入你的私处。你震惊地叫了一声，这让艾米莉的尾巴开心地摇摆起来，你调皮地咧嘴一笑，也回敬了她。[pg]");
         }
         outputText("你用舌头尽可能缓慢而强烈地抚摸她小穴的内壁，即使艾米莉也在回舔你。她的味道开始充满你的口腔，那是做爱和女孩淫液的独特味道。艾米莉尽力模仿你的动作；当你调皮地吸吮她的小阴蒂时，艾米莉也吸吮你的[clit]。当你加快速度时，她也加快速度，当你放慢速度时，她也放慢速度。[pg]");
         outputText("她的汁液现在流淌得又浓又猛，让你伴随着清晰的吸溜声舔舐着那份湿润。你的舌头探入每一个缝隙，每一个你能找到的褶皱，艾米莉在品味你的服侍时，语无伦次地呻吟和尖叫着。受到鼓舞，她突然将她的" + (amilyFurry() ? "吻部" : "嘴唇") + "探入你的" + get_player().vaginaDescript(0) + "，用她尖尖的鼻子作为阴茎的替代品，探得更深，触及那些她的舌头无法有力触及的地方。你咬住自己欢愉的尖叫，开始尽可能用力地舔舐。[pg]");
         outputText("在这样的服侍下，毫无疑问，你们俩不可避免地都高潮了，彼此的脸上都溅满了你们的汁液。你如释重负地叹了口气，从艾米莉的身体上滚下来，躺在她的床上，因为刚才的剧烈运动而大口喘息着。[pg]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,160) == 0)
         {
            outputText("[say: ……我不知道和另一个女人在一起感觉会这么好……但我以前从未被女人吸引过。] 艾米莉喃喃自语道。[pg]");
         }
         else
         {
            outputText("[say: ……我这么喜欢这个，这会让我变成女同性恋吗？还是我只是太渴望陪伴，以至于即使是另一个女人也很好？] 艾米莉问道。然后她鼓起力气摇了摇头。[say: 没关系。我爱你。][pg]");
         }
         outputText("你的力量恢复了，你坐起身，对你那像老鼠一样的情人微笑，然后给了她一个深吻，品尝着你的汁液，也让她尝尝她自己的味道。然后你重新穿好衣服，回到了你的营地。");
         get_player().orgasm("Generic");
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,160,FlagDict_Impl_.arrayReadInt(_loc1_,160) + 1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function get_debugName() : String
      {
         return "艾米莉";
      }
      
      public function get_debugHint() : String
      {
         return "";
      }
      
      public function getMaxSize(param1:int, param2:int, param3:int) : int
      {
         if(param3 != 0)
         {
            return param3;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,43) == 1)
         {
            return param1;
         }
         return param2;
      }
      
      public function getDownWithSexTiem() : void
      {
         clearOutput();
         amilySprite();
         var _loc1_:int = get_player().cockThatFits(61);
         outputText("你满脑子都是接下来要发生的事，欲火焚身，急不可耐地脱下了你的[armor]。艾米莉看着眼前的景象，微笑着欣赏着你的身体和你的" + get_player().cockDescript(_loc1_) + "。[pg]");
         continueWithMoreMidLevelAmilySex();
      }
      
      public function fuckingMouseBitchPopsShitOut() : void
      {
         amilySprite();
         outputText("你走进废弃的村庄，想知道艾米莉最近怎么样了。你不太确定，但你觉得她很快就要分娩了。就在你这么想的时候，你听到远处传来痛苦的吱吱哀号声。你急忙跑去寻找声音的来源，很快就找到了她；艾米莉赤身裸体地蹲在一座建筑的遮蔽处。她用力时发出轻柔的尖叫，肿胀的腹部明显地起伏着，液体从她肿胀的粉色小穴中滴落。她绝对是要生了。[pg]");
         outputText("你要怎么做？");
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,40,FlagDict_Impl_.arrayReadInt(_loc1_,40) + 1);
         menu();
         addButton(0,"离开",pregnancyIsScaryGoddamnMousePregnancyImNotWatchingThisShit);
         addButton(1,"观看",heyIGotTicketsToMicePoppingOut);
         addButton(2,"帮忙",helpThatFukkinUngratefulBitchGiveBirth);
      }
      
      public function fuckTheMouseBitch() : void
      {
         amilySprite();
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,43) == 2)
         {
            amilyCorruptSexMenu();
            return;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,77) > 0)
         {
            outputText("艾米莉推开你，说道：[say:在治好乔乔之前不行。]你叹了口气，嘟囔着。今天没得做了！!");
            doNext(amilyFollowerEncounter);
            return;
         }
         outputText("你给了艾米莉一个诱惑的微笑，告诉她你想和她做爱。[pg]");
         if(Utils.rand(2) == 0)
         {
            outputText("她邪恶地笑着回应：[say:哦，是吗？好吧，我想我或许能挤出点时间给你……][pg]");
         }
         else
         {
            outputText("她咯咯地笑着：[say:是什么让你耽搁了这么久？我等得太久了。][pg]");
         }
         outputText("看到你的表情，她大笑起来：[say:在我搬进来之前，我们大概生了七十个孩子；我想我现在经验太丰富了，对性已经不会害羞了。][pg]");
         outputText("她大步走过来，将你拥入怀中：[say:那么，你想做什么，[name]？][pg]");
         menu();
         addButton(0,"掌握主动",amilyTakesChargeSex).hint("掌握主动权，决定你要如何与艾米莉翻云覆雨。");
         addButton(1,"艾米莉主导",letAmilyLead).hint("让艾米莉决定她要怎么和你做爱。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,346) == 4 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,12) >= 0 && !get_game().urtaQuest.urtaBusy())
         {
            addButton(2,"乌尔塔",get_game().followerInteractions.amilyUrtaSex).hint("带艾米莉去特尔阿德雷拜访乌尔塔，享受一段性感的三人行时光。");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,636) > 0 && get_player().hasCock() && !amilyCorrupt())
         {
            addButton(3,"游泳",amilySwimFuckIntro).hint("有什么比带艾米莉去游泳顺便干上一炮更爽的呢？");
         }
         if(izmaFollower() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,771) > 0 && get_player().hasCock())
         {
            outputText("你可以看看艾米莉和伊兹玛是否愿意再来一轮艾米莉的催情药剂，不过一旦她喝下那个，避孕药就完全没用了。[pg]");
            addButton(4,"伊兹玛三人行",drinkThePotion).hint("与艾米莉和伊兹玛来一场三人行。这基本上会让她们怀孕。");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,775) > 0 && get_player().hasCockThatFits(61))
         {
            outputText("艾米莉可能愿意再玩一次护士游戏。[pg]");
            addButton(5,"护士角色扮演",amilyNurseCheckup).hint("让艾米莉进行一场下流的护士角色扮演。");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,631) > 0 && get_player().canOviposit())
         {
            addNextButton("产卵",layEggsInAmily).hint("把卵全都排进艾米莉的屁股里。");
         }
         addButton(14,"返回",amilyFollowerEncounter);
      }
      
      public function fuckPureAmilysHeiny() : void
      {
         clearOutput();
         amilySprite(true);
         var _loc1_:int = get_player().cockThatFits(50);
         if(_loc1_ < 0)
         {
            _loc1_ = 0;
         }
         outputText("你停顿了一下，对她露出一个有些羞涩的笑容，然后轻轻地将指尖放在她的鼻子上，顺着她的身体慢慢滑下，滑过她的嘴唇，穿过她的双乳，越过她的肚子，最后停下来紧紧抓住她的" + amilyButt() + "。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) > 0)
         {
            outputText("当她的男性器官对你感官上的触摸做出反应时，她的裤子因为兴奋而鼓了起来，你也开始戏弄地抚摸它。");
         }
         outputText("[pg]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,420) == 0)
         {
            outputText("她");
            if(get_player().get_tallness() >= 60)
            {
               outputText("抬起头");
            }
            else if(get_player().get_tallness() <= 40)
            {
               outputText("向下");
            }
            outputText("看着你，眼神中带着一丝困惑，你尽可能随意地提起肛交的话题。你问她是否考虑过，并告诉她这可能会很有趣。[pg]");
            outputText("[say: 我……我的意思是，你想把你的……放进那里？]她说道，眉头微微皱起。你有一瞬间担心自己可能越界了，但她慢慢地歪着头，对你耸了耸肩，露出一个沉思的表情。[pg]");
            outputText("[say: 嗯……直到现在我才真正考虑过这个问题，但是……如果你确定那是你想要的，]她说道，嘴唇微微撅起，仔细思考着。[pg]");
            outputText("你灿烂地笑着，点了点头，并向她保证你会很温柔，同时开始脱下你的[armor]。[pg]");
            outputText("[say: 哇，哇，等一下，]她说道，轻轻举起一只手阻止你急切的举动。[say: 我说过我会做的，但如果不先给铰链上点润滑油，你是进不了后门的。][pg]");
            outputText("你克制住自己，理解地点了点头。[pg]");
            outputText("[say: 等等，我想我正好有你需要的东西……]她说着，在她的一些炼金用品中翻找着。她拿出一个小桶，取下盖子。里面是一种浓稠的绿色药膏，当她摇晃容器时，药膏会微微晃动。她微笑着，用手指挑起一小团，然后伸出另一只手去拿你的" + get_player().cockDescript(_loc1_) + "。[pg]");
            outputText("你退缩了一下，因为你非常清楚不熟悉的化学混合物会对你的身体造成什么样的影响，但随后你在心里责骂自己竟然怀疑了艾米莉。[pg]");
            outputText("她翻了个白眼，有点占有欲地抓起你的" + get_player().cockDescript(_loc1_) + "，暗自发笑。[say: 哦，放松点，你这个大婴儿。这只是烧伤药膏。不过，它应该足够好用了。][pg]");
         }
         else
         {
            outputText("她同样羞涩地对你笑了笑，手指顺着你的胸膛向上滑，在你的脸颊上轻轻吻了一下。[say: 哦，你又有心情做那种事了，是吗？][pg]");
            outputText("你点点头，确认这确实是你现在想做的事，对你和这只可爱的鼠娘之间不言而喻的默契轻笑了一声。[pg]");
            outputText("她轻轻地从你怀里挣脱，弯下腰在她的东西里翻找，顺便让你欣赏了一下她诱人的臀部。当她回到你身边时，手里拿着一罐绿色的药膏，用手指挑出一点，另一只手则漫不经心地抚摸着你的" + get_player().cockDescript(_loc1_) + "，让它完全勃起。[pg]");
         }
         outputText("当她把冰凉的药膏涂在你的肉棒上时，你微微打了个寒颤。她的双手灵巧地动作着，在你的整根肉棒上涂抹了薄薄的一层，直到你的" + get_player().cockDescript(_loc1_) + "闪烁着一层光滑的绿色光泽。[pg]");
         outputText("她在[amilyclothing]不起眼的角落擦了擦手，然后开始扭动着脱下它们。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,420) == 0)
         {
            outputText("[say: 我……不太确定该怎么做……我想……是这样吗？]");
         }
         outputText("转过身，她小心翼翼地趴在地上，像鞭子一样的尾巴高高翘起，以免碍事，同时用膝盖和手肘支撑着身体。[pg]");
         outputText("你的手滑过她的" + amilyHips() + "，向上滑去，抓了一把她的" + amilyButt() + "，性感地按摩着她的下背部。你的手指顺着肉棒滑动，沾取了少量的润滑药膏，涂抹在她臀瓣间那颤抖的肉环上。艾米莉发出一声轻微的呻吟，因为冰凉的触感而颤抖着。当你把第一节手指推入她的肛门，将润滑剂涂抹在她紧致后庭的第一英寸时，她发出了一声尖锐的吱吱声。[pg]");
         outputText("当你抽出手指时，她浑身一颤，下巴贴在地上，微微抬起臀部。你开始用你的" + get_player().cockDescript(_loc1_) + "的头部摩擦她的雏菊，缓缓向前推进。你非常缓慢地施加压力，直到你感觉到紧致的入口开始退让，然后慢慢地向前沉入她的直肠。[pg]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,420) == 0)
         {
            outputText("[say: 啊……啊……感觉真奇怪，]她喘息着，明显在努力克制着夹紧入侵者的本能。[say: 啊……不……不坏……只是很奇怪……][pg]");
         }
         else
         {
            outputText("[say: 嗯……还是有点奇怪……但我可能开始喜欢上这种感觉了……][pg]");
         }
         outputText("一旦你完全埋入她的后庭，你便俯下身，贴合着她背部的曲线。你把她的头发稍微拨开，沿着她的下颌线印下几个轻柔的吻，非常小心地控制着你的动作，以免弄疼她。当你放缓到一个非常缓慢、温柔的节奏时，你们俩都开始发出愉悦的声音，呼吸也变得沉重起来。[pg]");
         outputText("你的手沿着艾米莉的身体两侧滑动，轻轻按压着她的肌肤，引得她发出轻柔的呻吟和吱吱声，同时你的臀部以均匀、有节奏的步伐在她的臀部上起伏。你能感觉到她肠道的内壁有节奏地夹紧你的肉棒，肛门的肌肉随着每一次温柔的抽插挤压着你。药膏出色地发挥了作用，让每一个动作都变得轻松；如果没有它，你怀疑艾米莉的后庭是否会如此轻易地接纳你的" + get_player().cockDescript(_loc1_) + "。[pg]");
         outputText("[say: 我觉得你现在可以快一点了……]艾米莉气喘吁吁地说，当你充满爱意地用手指穿过她的头发时，她回头对你笑了笑。你微微点头，将手肘勾在她的腋下，紧紧抱住她的背，开始慢慢加快节奏。随着你的动作变得更加用力，艾米莉的呻吟变得更加充满激情，但谢天谢地，她似乎并没有感到任何不适。[pg]");
         outputText("她的双手在下巴下方紧紧握住你的手，闭上眼睛，轻轻咬着下唇，现在甚至微微摇晃着臀部来配合你的动作。尽管节奏缓慢而温柔，或者部分原因正是因为如此，你开始感觉到下腹部一阵颤抖，这标志着你即将高潮。[pg]");
         outputText("你闭上眼睛，在艾米莉耳边发出一声颤抖的呻吟，你的高潮如潮水般涌来，");
         if(get_player().cumQ() <= 250)
         {
            outputText("你的" + get_player().cockDescript(_loc1_) + "抽搐着、跳动着，用几缕精液涂抹着她的体内");
         }
         else if(get_player().cumQ() <= 500)
         {
            outputText("高潮的膨胀感冲破了她的括约肌，你将浓稠的精液倾泻进她的后门");
         }
         else
         {
            outputText("大量的阳刚精液用温暖填满了她的内脏，她的腹部开始微微隆起");
         }
         outputText("。以这种方式受到刺激还不足以让艾米莉完全释放，但你温暖的精液填满她后庭的感觉，足以让");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) > 0)
         {
            outputText("她自己的肉棒抽搐着，在身下的地面上滴下一小滩清澈的先兆精液，与");
         }
         outputText("一道明显的汁液顺着她的大腿缓缓滑落。[pg]");
         outputText("你非常小心地向后退去，当你完全从她紧致的后穴中抽离时，艾米莉倒吸了一口凉气。你轻轻地滑落到她身边，将她拥入一个温暖的怀抱中，与她依偎了很久");
         if(get_player().cumQ() > 500)
         {
            outputText("并微笑着轻轻抚摸她腹部的曲线");
         }
         outputText(".");
         get_player().orgasm("Generic");
         dynStats(DynStat.Sens(-2));
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,420,FlagDict_Impl_.arrayReadInt(_loc2_,420) + 1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function fuckNoYouWontBeAmilysHermDaddy() : void
      {
         amilySprite();
         clearOutput();
         outputText("你嘲笑她，并告诉她，她曾称你为大自然的怪胎，一个不自然、由恶魔制造的东西。你对和一个把你当成某种生育玩具的人做爱没有兴趣。[pg]");
         outputText("艾米莉畏缩了一下，看起来深受伤害。[say: 我……你是对的，我所说的话不可原谅。我……觉得我们最好还是分道扬镳。][pg]");
         outputText("她看起来非常悲伤，转身走开，以只有她能做到的方式消失在城市荒野中。本能告诉你，你再也见不到她了。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,36,1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function fuckIncestCunts(param1:Boolean) : void
      {
         var _loc2_:int = get_player().cockThatFits(61);
         if(_loc2_ < 0)
         {
            _loc2_ = 0;
         }
         var _loc3_:int = _loc2_ + 1;
         clearOutput();
         outputText("你走上前，");
         if(!param1)
         {
            outputText("告诉艾米莉把雄性打发走——你还有小穴要操呢。她兴奋地吱吱叫着，几乎没注意到她的儿子正迈着沉重的步伐离开。");
         }
         else
         {
            outputText("告诉艾米莉准备好——你要把她们每一个都操满她们[master]的精液。她兴奋地吱吱叫着，乳头明显地皱缩起来。");
         }
         outputText("艾米莉牵着女孩的手，把她交给你。当年轻的小鼠娘靠近时，她隆起的孕肚显得越来越突出。当她抬头看着");
         if(get_player().get_tallness() >= 48)
         {
            outputText("抬起头");
         }
         outputText("乳汁开始从她巨大、漏奶的乳头上滴落，她说道，[say: 嘿，" + get_player().mf("爸爸","另一个妈妈") + "，来吧，插进来。从我第一眼看到你，我就一直想要这个。.]");
         outputText("[pg]你脱下你的[armor]，让[eachCock]弹出来。你聚集的后代们齐声倒吸一口凉气。你看到");
         if(amilyFurry())
         {
            outputText("口鼻");
         }
         else
         {
            outputText("嘴巴");
         }
         outputText("流着口水，舌头淫荡地挂在外面，打量着你的[cock all]。你的女儿在你身上蹭来蹭去，她的尾巴缠绕着[oneCock]，一边跳舞一边在你身上研磨。当你伸出手去抓她巨大的双峰时，雌性润滑液溅落在她身下的地上。乳头大到可以抓住，就像小牛的乳头一样，当你抓住它们时，它们都喷出大股的乳汁，这让它们的主人很高兴。你的女儿大声呻吟，开始用她尾巴缓慢、熟练的动作套弄[oneCock]。紧贴着你，小鼠娘厚实柔软的屁股在你的[skinfurscales]上发热。].");
         outputText("[pg][say: 真是个好女孩，]艾米莉在女儿的大耳朵旁鼓励地低语。年轻怀孕的荡妇点点头，退开身子，向前倾斜，向你展示她湿透的小穴。她的尾巴在你的[cock " + _loc3_ + "]上又绕了几圈，轻轻地拉扯着，她回头看着你，眼睛半闭，舌头流着口水。她问道，[say: 求你，占有我……[daddy]。].]");
         outputText("[pg]仿佛你能拒绝如此礼貌（且诱人！）的请求。你抓住怀孕女孩宽阔的臀部，给了她想要的东西。前一刻，你还在俯视她肿胀的乳房，下一刻，你的[cock " + _loc3_ + "]就被紧致湿润的肉体包裹住了。你的女儿因为被填满而高兴地吱吱叫，并鼓励地轻轻挤压你的[cock " + _loc3_ + "]。");
         outputText("[pg]你抓住她滴水的乳头挤压，挤出浓稠的雪白乳汁，开始好好地操你的女儿。她感激地吱吱叫着，用她有弹性的屁股撞击你的[hips]，上下滚动她多汁的大腿，给你一点表演。你拍打她的屁股，看着肉体在打击下泛起涟漪，这是接下来发生的事情的令人愉快的序曲。然后，回到熟练地挤奶她令人难以置信的双峰，你开始随着你女儿的节奏移动你的臀部。她的小穴随着每次活塞运动发出湿润的吧唧声，并有节奏地夹紧你，试图榨干你的[cock " + _loc3_ + "]。你舒服地咕哝着，加快了速度，无视了她更慢、更弱的节奏。");
         outputText("[pg]怀孕的小荡妇在每一次摇晃屁股的抽插中吱吱叫着、呻吟着，当她的小穴被她的父母彻底耕耘时，她快乐地哀号着。她乞求道，[say: 用力操我，[daddy]，把我操满精液。把我操得爽翻天，让我爬回来给你生更多的孩子！!]");
         outputText("[pg]你更快地操她，每次抽插都有光滑的液体溅到你的[legs]上。家里的其他人都在旁观，静静地看着并抚摸自己。艾米莉就在她女儿旁边，漫不经心地在她耳边低语鼓励，一边说一边抚摸自己。当同一个女儿咬住她坚挺的乳头时，她浑身发抖，但在兴奋的呻吟之间又回到了指导状态。你的双性人“女儿”把手指缠在她的包皮上，就在她未膨胀的结的微小隆起下方。她用手指在尖端画圈，在等待轮到她时挑逗自己。");
         outputText("[pg]当你在看她时，双性人给你抛了个媚眼，恳求道，[say: 求你，射在我妹妹里面，现在就射进去。我需要你在我里面……我需要你操我，直到我被我浓稠的狗精液浸透。你不想看吗，[dad]？]当你被迫因为紧绷、拱起的身体而移开视线时，她会意地笑了。精液从你的[cock " + _loc3_ + "]中冒出气泡，用种子填满你扭动、狂喜的女儿。她湿透的小穴挤压着，喷出混合精液的细流，落在你的[legs]上，因为它在你周围收缩，试图把你榨干，但由于她的子宫被堵住了，它所做的只是把精液从她的入口喷出来，从你的下体滴落[if (hasBalls) { 和[balls]}]。无意中，你的手找到了她的乳头并用力挤压，送出浓稠的鼠奶流，弄脏了地面。");
         outputText("[pg]你身下怀孕的荡妇从你的[cock " + _loc3_ + "]上滑落，她的腿软了，身体淫秽地张开。她呜咽着，[say: 太舒服了……我希望你能让我怀孕……" + get_player().mf("爸爸","妈妈") + "。]");
         outputText("[pg]叹了口气，你向艾米莉和双性人勾了勾手指。她们恭敬地走近你，当你示意她们应该照顾你疲软的勃起时，这两个堕落的荡妇交换了欢乐的眼神。两张张开的大嘴落在[eachCock]上，舔舐、吸吮、挤压、啜饮。她们匆忙吞噬你剩余的、浪费的精子，贪婪地吞下仍然从你身上滴落的刺鼻的淫水。低头看去，你看到四个巨大的乳房——两对美味的胸部——挤在一起，乳汁润滑着它们，使它们相互滑动。[EachCock]在你注视下向前挺进，准备再次出发。");
         outputText("[pg][say: 看来[Master]现在准备好了。去吧，]艾米莉说着，退后一步，让你和你的“女儿”单独相处。在你采取行动之前，她跳进你的怀里，她娇小但丰满的身材完美地适合躺在你的怀里。她平稳地转动臀部来接受你的[cock " + _loc3_ + "]，虽然她的小穴不像她妹妹那样是湿透的爱之隧道，但双性人用热情弥补了这一点。她用手臂搂住你的肩膀，[if (cocks > 1) {她红色的、打结的工具在你剩余的[cock all]上上下摆动。|她红色的、打结的工具在你们的身体之间弹跳。}]当她紧紧抱住你时呻吟着，你最不寻常的后代开始在你身上滴下温暖。");
         outputText("[pg][say: 太舒服了……我能明白为什么你会让妈妈如此渴望把你的精液射在里面，]她说着，开始在你身上上下摆动和研磨。每次她允许自己在你的[cock " + _loc3_ + "]上触底时，一股前列腺液就会乱七八糟地喷在她的下乳上。当她操你时，它滴落下来，但你厌倦了在你们身体之间不断增长的混乱，把她转过来面对她的母亲。艾米莉色眯眯地看着你耕耘她女儿的小穴，红色的狗肉棒只有几英寸远，滴着前列腺液。");
         outputText("[pg]你那堕落的鼠奴舔了舔嘴唇，猛地扑向你们俩，让你们双双失去平衡，倒在地上，但你们那激动、渴望的生殖器依然紧紧相连。你低吼着艾米莉的名字，既困惑又恼火，但你女儿发出一声闷闷的愉悦尖叫，让你意识到刚刚发生了什么——艾米莉骑到了她身上！你那双性人女儿被夹在父母中间，同时操着他们俩。她神志不清地呻吟着，和她母亲热吻，她们的舌头在彼此口中进进出出，偶尔舔过肿胀的嘴唇。在附近，你另一个淫荡的后代仍然有些神志不清，双腿紧闭，抱着自己的肚子。");
         outputText("[pg]艾米莉停止了与你女儿的亲吻，说道：[say: 让我来教你尾巴的正确用法。] 双性人因为某种看不见的动作喘息起来。她的小穴难以置信地收紧了，你听到她大声呻吟。一秒钟后，一条细细的鼠尾缠绕在你阴茎的根部。");
         outputText("[pg][say: 你、你在干什么……哦哦哦哦哦哦！] 小鼠娘尖叫起来。你女儿不仅把她的尾巴当成了阴茎环——她还把尾巴一直伸到后面，用来操她母亲！尾巴在艾米莉体内蠕动，抚摸着她的内脏，同时像蛇一样缠绕在你的[cock " + _loc3_ + "]上。在人堆的最下面，你有幸能够控制节奏，尽管你已经射过一次了，但你还是渴望再来一次。你用力挺动臀部，力度大到让上面的女孩们都弹了起来，乳肉挤压，汁液横流。");
         outputText("[pg]汗湿的手臂在三具身体上紧紧攀附、摩擦，直到你分不清谁的四肢是谁的。相反，你专注于你通过[legs]敲打出的猛烈节奏，以及你的肉棒在你亲生骨肉那淫荡的褶皱中耕耘时发出的湿润挤压声。你马上就要让你自己的后代怀孕了，这个挥之不去的念头浮现出来，但只会让你更加兴奋，这种禁忌的行为让你的下半身充满了即将到来的高潮的温暖。中间的那个老鼠乞求道：[say: 操，是的！给我！] 她高潮时，用尾巴深情地挤压着你的肉棒，尾巴尖在艾米莉的屁眼儿里疯狂地挥舞着。");
         outputText("[pg]你抓住离你最近的那对臀部，在射精时将你的肉棒齐根捅进她体内。她在高潮中哀嚎，她的小穴紧紧地收缩着，挤出了你的第一股精液。精液喷涌而出，溅在她的子宫颈上，随着下一股精液的喷发，你确信她自己的一些体液也一定正从她的尿道中涌出。[if (cumQuantity > 500) { 你只是不停地射啊射，你几乎希望你能看到精液填满她的肚子，从她的下体泛滥而出。}][if (cumQuantity >= 1500) { 即使如此，她的肚子还是微微凸起，你意识到从任何其他角度看，她一定都显得非常像怀孕了。.}]");
         outputText("[pg]艾米莉喘着粗气，[say:天哪，]然后滚到一边，她小穴里仍然膨胀的肉结把你的女儿也带了过去。既然你已经摆脱了额外的重量，你喘了口气，叹息着，浸透你身体的鼠液开始变干。你瞥向一边，看到艾米莉和你的女儿四肢着地，屁股对着屁股。[if (cumQuantity > 500) {年轻女孩的肚子被精液美妙地填满，低低地垂着。}]艾米莉的肚子似乎在慢慢变大，像气球一样膨胀。她紧张地试图拉开距离，但你女儿的肉结把她固定在那里，困住了她，当粘稠的野兽精液淹没她曾经纯洁的子宫时，她什么也做不了。");
         if(param1)
         {
            outputText("[pg]你意识到自己还没有被完全榨干，于是你向那只雄性老鼠招手。他的小穴应该足够紧，能把你[balls]里最后的精液挤出来。他满怀希望地看着你，但你坐起来指了指他，然后指了指你微微疲软的阴茎。这只刚成年的雄性叹了口气，跪在你的双腿之间开始工作。虽然他显然只想自慰或者开始操你，但他证明了自己和他的母亲一样顺从，把你阴茎上他姐姐的污浊吸食干净。当他上下套弄时，一丝男孩的淫液滴落在你的腿上，他的紫发遮住了他大部分的");
            if(amilyFurry())
            {
               outputText("口鼻");
            }
            else
            {
               outputText("脸庞");
            }
            outputText("，让你在被他吸吮时无法看清。");
            outputText("[pg]很快，你的勃起变得又硬又挺，在男孩的舌头上轻轻跳动。他用柔软粉嫩的手指包裹住你的肉棒，开始套弄——很明显，他以为他要给你口交直到射精。好吧，才不是那样；你至少还有一发精液炸弹要投，而且你想要更紧的地方！你抓住你这鼠辈后代的紫发，把他往后猛拉，用力一推，让他四肢着地，痛苦地喘息着。正如你所料，他的屁股可爱又挺翘，粉嫩紧致的小穴正乞求着你的侵犯。他那包皮包裹的巨大肉棒在泥土上拖拽，在他试图爬离你时，在身后抹下一道淫液的痕迹。");
            outputText("[pg]在他逃跑之前，你扑向他，将他压在身下，[oneCock]在他的臀瓣间弹跳，你对准了位置。他抗议道，[say: 不！不——不要我的屁股！不要那里，" + get_player().mf("爸爸","妈妈") + "！]你让他安静下来好好享受，令人惊讶的是，他照做了，仿佛在暗中等待着命令。当你顶上去时，这只老鼠的直肠紧紧收缩，但经过几次轻柔的试探，你慢慢让那紧张的小穴放松下来，足以让你的[cockHead " + _loc3_ + "]滑入其中。你的儿子因为突如其来的不适而喘息，但当你把他拉回你的腿上时，你能从他的抗议声中听到一丝快意。");
            outputText("[pg]他慢慢地在你的腿上安顿下来，不再逃跑，当你越过他的肩膀看去时，你第一次看清了他的肉棒。就它的尺寸而言，它非常粗壮，你可以看到他的包皮闪烁着暗淡的光泽，遮住了除了马眼周围一小圈之外的所有部分，而马眼目前正以惊人的速度渗出淫液。你温柔地将他的肉棒握在手中向后拉，每次他上下移动时都缓慢地套弄他。这个小婊子很快就明白了你的意图，开始像发情的娼妓一样在你的肉棒上起伏。你从后面伸手套弄的速度越来越快，以至于他的包皮被褪下，露出了小老鼠那闪亮、沾满淫液的龟头。");
            outputText("[pg][say: 噢，操——操，" + get_player().mf("爸爸","妈妈") + "，你要让——让我射了！]他呻吟着。你松开他的肉棒，拍打他的屁股，不想让他在你把精液塞满他那挺翘的伪娘小穴之前就射出来。他不满地嘶嘶叫着，但开始起伏得更快，一次又一次地将他的前列腺撞击在你的[cockHead " + _loc3_ + "]上，试图不用手就达到高潮。他疯狂的扭动唤醒了一种颤抖的、初露端倪的快感，此时你已经很熟悉这是高潮的开始，当你收紧时，你不得不怀疑他是否能成功射出来。");
            outputText("[pg]鼠男孩被撑开的肛门紧紧地包裹着你的[cock " + _loc3_ + "]颤抖着，被你突如其来的内射充满了热量。你能感觉到浓稠的液体在他体内晃动，当你将一发又一发滚烫的精液射进他的小穴时，他开始不断地收缩，仿佛在榨取你的肉棒。一秒钟后，你儿子现在暴露在外的龟头猛地胀大并爆发，将一股浓稠、堕落的老鼠精液直接射到了这个紫发荡妇自己的脸上。他高兴地承受着，舌头伸出，精液填满了他的嘴，浸湿了他的头发。精液像间歇泉一样喷涌而出，一波又一波白色的液体粘在他身上，而你的肉棒则将精液从他体内挤出。很快，你儿子的精液喷泉平息下来，他发出了几声可怜的、充满喜悦的吱吱声。");
            outputText("[pg]直到他试图用颤抖的双腿站起来时，你才意识到自己有多么疲惫不堪。当你瘫倒在一旁时，你看到你的精液正");
            if(get_player().cumQ() < 200)
            {
               outputText("滴落");
            }
            else if(get_player().cumQ() < 500)
            {
               outputText("如雨般落下");
            }
            else if(get_player().cumQ() < 2000)
            {
               outputText("倾泻而出");
            }
            else
            {
               outputText("喷射而出");
            }
            outputText("落到地上。很明显，你的男孩需要一些训练，学习如何憋住他的精液。你闭上眼睛打起瞌睡，感到既满足又疲惫。");
         }
         else
         {
            outputText("[pg]直到你试图站起来，你才意识到自己有多么疲惫。当你翻身侧躺时，你闭上眼睛打起瞌睡，看着精液从艾米莉的小穴里，绕过你女儿的结喷涌而出。");
         }
         amilyPreggoChance();
         get_player().orgasm("Generic");
         dynStats(DynStat.Lib(-1),DynStat.Sens(-1));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function fuckAmilyPreg() : void
      {
         amilySprite(true);
         clearOutput();
         get_images().showImage("amily-forest-fuckpreg");
         outputText("艾米莉尽可能快地牵着你的手走向她的藏身处……这其实也就是相对轻快的步行速度。你没有催促她，理解她肚子上沉重的隆起是如何拖慢她的脚步的，你们并肩以同样的速度移动。你试图帮助艾米莉越过她面前崎岖的地形。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) > 0)
         {
            outputText("撑起她裤子的勃起可帮不上什么忙。");
         }
         outputText("[pg]");
         outputText("一进入这个小小的安全屋，你就帮艾米莉脱下她那身紧绷的衣服，你的双手在她性感的曲线上游走，好好地抚摸了一番。直到艾米莉完全脱光，你才脱下自己的装备。[pg]");
         outputText("和往常一样，艾米莉对你赤裸的身体非常满意，但她自己却低着头，羞得满脸通红。[say:你还觉得我漂亮吗？]她问你，你毫不犹豫地告诉她，她现在比以前更漂亮了，她新的曲线更加突出，看起来非常诱人。听到这话，艾米莉的表情亮了起来，她紧紧地抱住你，宣称她有多么爱你。你对她的感情似乎也是一样的。[pg]");
         outputText("她拉下你的头，你们的嘴唇热情地交织在一起，她的手顺着你的胸膛滑下，直到轻轻抚摸你的肉棒。");
         if(get_player().tail.type > 0)
         {
            outputText("你甚至感觉到艾米莉用她那老鼠般的尾巴缠住你的尾巴，让你在爱人的嘴里轻声笑了起来。");
         }
         else
         {
            outputText("一阵痒痒的感觉袭遍全身，让你忍不住哼笑出声，你意识到是艾米莉的尾巴在抚摸你的大腿。");
         }
         outputText("你的目光落在艾米莉肿胀的乳房上，看到她坚挺的乳头上挂着几滴乳汁。你坏笑着抚摸她的乳房，时不时地停下亲吻，品尝她的乳汁。艾米莉呻吟着回应，每次你的嘴唇回到她的嘴唇上，她都会把你抱得更紧。[pg]");
         outputText("当她把头向后仰时，几缕唾液仍然连接着你们俩。她满怀期待地看着你，希望你先采取行动。你挠了挠后脑勺，有些尴尬地看着她，说你真的不知道该对一个大肚子的孕妇用什么姿势。艾米莉咯咯地笑了起来，吱吱叫了几声，双手搭在你的肩膀上。[say:好吧，让我来教你……]她说着，让你平躺在床上。[pg]");
         outputText("[say:我做了一些研究，以防你还想在我这样的时候做爱……我很高兴你愿意——你不知道我因为这个有多饥渴。]艾米莉跨坐在你的臀部上说道，你感觉到了这个可爱的鼠娘增加的重量。这没什么大不了的，你当然也不会去提它。[pg]");
         outputText("艾米莉挑逗了你一会儿，用她的阴唇和尾巴在你的勃起顶端摩擦了几次，惹得你发出一阵呻吟。艾米莉微微一笑，然后顺着你完全勃起的" + Appearance.cockNoun(CockTypesEnum.HUMAN) + "滑了下去，尽可能地吞吐。你有点担心这可能会对你的后代有害，或者更糟——他们会知道发生了什么……但艾米莉似乎比你更懂这些，所以你打算听从她的建议。[pg]");
         outputText("艾米莉保持着相当惊人的节奏和速度，像骑机械牛一样骑着你的肉棒。过了一会儿，你开始回应她的动作，向上挺起臀部迎合她，并逆时针扭动身体。艾米莉因快感而发出的尖叫或吱吱声是个好兆头，因此，你加快了旋转的速度。强烈的快感让你希望这场性爱永远不要结束，但当你感觉到高潮迅速逼近时，你叹了口气，决定让它成为一次难忘的经历。你迅速用双手抓住艾米莉的臀部，加快速度，让艾米莉惊讶地喘息起来。你继续保持动作几分钟，然后你们俩同时达到了强烈的高潮，混合的体液从艾米莉被彻底撑开的阴道里流了出来");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) > 0)
         {
            outputText("，她自己的老鼠肉棒也将扶她精液喷得满肚子都是");
         }
         outputText("。[pg]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) > 0)
         {
            outputText("[say:还记得你说过这根肉棒是个坏东西吗？]你调侃道，惹得艾米莉羞红了脸，开玩笑地捶了你的肩膀一下。[say:闭、闭嘴！它……它确实很不可思议，行了吧，我承认了。][pg]");
         }
         outputText("做完爱后，你坐起身，让艾米莉靠在你的胸前，让你的双手抚摸她美丽的孕肚。艾米莉幸福地微笑着，她的手覆在你的手上，引导它们抚摸她的隆起。当你感觉到孩子们在踢肚子时，你幸福地笑了，这让艾米莉也咯咯地笑了起来。在剩下的时间里，你们俩静静地坐在一起，心中只有对彼此和你们创造的后代的爱。你看到艾米莉温柔地对你微笑，脸上带着一丝悲伤，嘴唇上似乎有一个问题。但她什么也没说，决定不破坏你们之间这宁静的时刻。[pg]");
         outputText("最后，带着极大的悲伤和遗憾，你离开了爱人的身边，回到了营地，发誓一定会回来。");
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,38,FlagDict_Impl_.arrayReadInt(_loc1_,38) + (2 + Utils.rand(4)));
         _loc1_ = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,42,FlagDict_Impl_.arrayReadInt(_loc1_,42) + 1);
         get_player().orgasm("Generic");
         dynStats(DynStat.Sens(-1));
         doNext(get_camp().returnToCampUseOneHour);
         amilyPreggoChance();
      }
      
      public function forestDateLeave() : void
      {
         clearOutput();
         outputText("你告诉艾米莉，这已经足够了，你对她分享的内容非常满意。她脸上露出一丝微笑，默默地点了点头。你们俩多花了一点时间享受这偷来的片刻宁静，然后伸个懒腰，开始跋涉回你们的家。");
         outputText("[pg][say:当我知道我有一个可以回去的家时，在这个地方的压力就小多了，]这位老鼠[if (nofur) {女孩|形态者}]补充道，微微一笑。[say:谢谢你，[name]。].]");
         outputText("[pg]你也以同样的方式回应，你们俩都以轻松的步伐，在似乎比以前更加神奇的森林中寻找回去的路。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function forestDateKiss() : void
      {
         clearOutput();
         outputText("你一言不发地滑向那个鼠[if (nofur) {娘|人}]，她睁大双眼，被你脸上的神情深深吸引。她的嘴唇微微张开，在森林的空气中颤抖着，你立刻感觉到一种强烈的冲动，想要不顾一切地占有它。");
         outputText("[pg]此时你几乎意识不到自己的动作，但周围的环境对你来说已经不重要了，因为在下一刻，你的[face]已经紧贴着她的脸，近得能感受到她[if (nofur) {皮肤|皮毛}]散发出的温暖。她发出一声轻声的呢喃，但似乎和你一样此时也说不出话来，于是你凑上前去，吻住了她。");
         outputText("[pg]与其说是震惊，不如说是一种强烈的痛楚正在消退的感觉。明显的释然感与纯粹的亲密感交织在一起，你感觉自己微微融化，迷失在她的唇间。你对艾米莉所有的感情，你们共同经历的一切，以及你想对她说的所有话，似乎都融汇成了这一个爱的表达，一个可以轻易绵延至永远的吻。");
         outputText("[pg]当艾米莉终于把脖子缩回去时，她几乎喘不过气来，而你又偷走了一个吻，虽然短得多，但同样必不可少。这第二个轻吻让她有些咯咯地笑，但她还是设法恢复了镇定，被你不知不觉中环绕着她的手臂抱住。[if (hasfangs) { 最重要的是，你用你的[fangs]在她的嘴唇上留下了最轻微的咬痕，让她又一次颤抖，几乎让她双腿发软。.}]");
         outputText("[pg][say:我……你……[Name]……哇。.]");
         outputText("[pg]好吧，这大概能很好地总结一切了。你们俩能在这种地方享受这么长时间不受打扰的幸福，简直是个奇迹，所以你向你的老鼠恋人建议，在情况发生变化之前，你们可能想走了，她欣然同意了。");
         outputText("[pg][say:……但我们以后还会再出来的，对吧？]她补充道，脸上带着苦笑。");
         outputText("[pg]你告诉她你很乐意，她幸福地叹了口气。在回营地的路上，只要险恶的地形允许，你们俩都会紧紧握住彼此的手。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function forestDateGather() : void
      {
         clearOutput();
         outputText("艾米莉已经向你展示了很多关于森林的知识，但也许她还有更多要教你的。你问她，在她不得不自己谋生的这段时间里，她是否学到了任何与觅食相关的技能；她确实表现出了非凡的适应能力。");
         outputText("[pg][say:哦，当然，]她回答道。[say:我一直对炼金术有点兴趣，而且自从……好吧，如果你真的想学，我很乐意向你展示一些东西。.]");
         outputText("[pg]你点头同意，这位老鼠[if (nofur) {女孩|形态者}]热切地开始解释周围各种森林动物。她提供了一些关于哪些蘑菇可以安全食用，哪些小树枝具有令人惊讶的治疗作用，以及哪些藤蔓可能会让你起皮疹的提示，到最后，你发现自己[if (cor < 40) {感到谦卑|感到惊讶}]，因为你不知道的东西太多了。");
         outputText("[pg]她正要偏离主题，谈论她母亲过去如何过度使用某种草药，这时她看到了你脸上的表情，只是微笑着回应。[say:好吧，我想现在大概够了。能经历这一切真是太好了，如果没有人分享，你真的会忘记世界上有多少东西。.]");
         outputText("[pg]你们俩紧握了一会儿手，然后是时候开始回营地了。希望你能从今天在这里收集到的东西中找到一些用处。");
         var _loc1_:Inventory = get_inventory();
         var _loc2_:Array = [get_consumables().PIGTRUF,get_consumables().FOXBERY,get_consumables().C__MINT,get_consumables().P_SEED];
         _loc1_.takeItem(_loc2_[Utils.rand(int(_loc2_.length))],get_camp().returnToCampUseOneHour);
      }
      
      public function forestDateFuck() : void
      {
         clearOutput();
         outputText("你问她到底在想什么，红晕在[if (nofur) {她的脸上|她的皮毛间}]蔓延开来。}].");
         outputText("[pg][say:呃，嗯，我只是……我只是不确定会不会有一些——--]");
         outputText("[pg]你打断了她的话，问她想不想[if (cor > 40) {干你|亲热一下}]。艾米莉震惊的表情掩盖不住那一抹明显的羞涩，于是你继续说道，你很乐意在任何她想要的地方取悦她，哪怕是在这森林中央。事实上，你已经等不及了。");
         outputText("[pg][say:就、就在这里？]");
         outputText("[pg]就在这里。");
         outputText("[pg][say:但是这里没——--]");
         outputText("[pg]你没有再给她一秒钟的时间去浪费口舌抗议，因为很快她就会需要用到所有的氧气了。你的双唇带着火热的激情覆上了她的唇，彻底打消了她可能残存的任何疑虑。等你结束这个吻时，她紧绷的四肢已经放松下来，那双粉色的大眼睛正迷离地仰望着你。");
         outputText("[pg][say:哈啊……...]");
         outputText("[pg]虽然这不是一句完整的话，但这已经足够确认她的心意了。你[if (!isnaked) {脱下衣服，}]动作流畅地展示出你的[genitalsdetail]，艾米莉的目光紧紧盯着你身体的轮廓。很明显，尽管她脸上泛着热烈的红晕，但她已经准备好了，所以你向前压去，将她的身体拉入你的怀中。");
         outputText("[pg]你的[if (isgenderless) {[hands]引导她的一只手来到你的[asshole]，然后你的手探向她的入口|性器官悬停在小老鼠的旁边，你只给了她几下准备性的抚摸，然后你就[if (hascock) {深深插入|用力顶撞她}]}]，换来了一声闷闷的“咿”。起初你的动作缓慢而试探，但很快就清楚地表明，艾米莉[if (lib < 50) {就|几乎}]和你一样饥渴，她热情地模仿你的动作，臀部随着你的节奏摇摆，眼中燃烧着欲望的火焰。");
         outputText("[pg]不过，你还想对她做更多的事情。你尽可能轻柔地倒在地上，但在身下如此热切的情人面前，任何不适都很容易被忽略。艾米莉用指甲抓着你的肩膀，[if (tallness > 60) {双腿缠绕在你的腰上|双腿与你的[if (singleleg) { [legs]|双腿}]交织在一起}]，当你将动作加快到疯狂的节奏时，她几乎在你的[ear]边尖叫起来。你的小老鼠已经湿透了，足以让一切顺利进行，尽管你的激情仍然有超过她的趋势。");
         outputText("[pg][say:哦，玛莱，是的，啊！!]");
         outputText("[pg]这样甜美的声音让你更加接近高潮的边缘，但在你释放之前，你打算——--");
         outputText("[pg][say:请、请射出来。求你了，[name]，为、为我射出来。.]");
         outputText("[pg]她的话语如此轻柔，几乎像是在耳语，但在她再次重复完之前，你已经收紧双臂抱住了她，在她的肩膀上呻吟着你的爱意，整个身体在释放时颤抖着。你和艾米莉汗流浃背地纠缠在一起，融为一体，你完全沉浸在高潮之中。");
         outputText("[pg][if (hascock) {你的[cock]在她的体内不断跳动，[if (cumnormal) {虽然你没法完全填满她|将她填得满满当当[if (cumhighleast) {甚至溢了出来}]}]|[if (hasvagina) {你的[vagina]有节奏地收缩着，尽可能紧紧地贴着她的入口[if (vaginalwetness > 2) {，尽管你丰富的体液让这变得有些湿滑|，宛如一个淫荡的吻}]|尽管你没有性器官，但随着你的整个核心散发出肉欲的释放，你的屁股开始紧紧夹住她的手指}]}]，而从她在你身下扭动的样子来看，她的快感也同样明显。在整个高潮期间你都没有停歇，完全放纵地在艾米莉身上扭动喘息着，直到你的四肢再也不听使唤时，你才终于停止了动作，空地上只剩下你和爱人喘息的声音。");
         outputText("[pg]这只老鼠比你先恢复了平静，尽可能优雅地从你身下钻了出来。她出奇地安静，抚平了在你们的嬉闹中弄皱的[amilyclothing]，但她脸上的神情绝对是在大喊着“满足”。\".");
         outputText("[pg][say:我们应该……回营地了，[name]。嗯。但是……我们改天还得再来一次。.]");
         outputText("[pg]最后这句话她说得异常自信，于是你也以同样的态度回应了她。随后你们俩再次踏入森林，虽然比预想中来时的旅途要稍微疲惫一些。");
         get_player().orgasm();
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function forestDate() : void
      {
         clearOutput();
         outputText("你向艾米莉提议，去森林里走走或许能换换心情。毕竟，她在玛瑞斯生活的时间比你长得多，让她带你到处转转应该挺不错的。听到你的建议，她微微一笑，身后的尾巴急切地摇摆着。");
         outputText("[pg][say:好吧，既然你这么想，[name]，] 她说。[say:不过我觉得这片森林对我来说总是老样子。我不知道这会不会很浪漫……...]");
         outputText("[pg]好吧，也许她能让你更好地了解她的经历。你是个外来者，她的视角能为你在这地方生存提供一些宝贵的见解。而且，无论如何，和她在一起的时光总是特别的。");
         outputText("[pg]不知为何，她似乎有些紧张，但还是答应了。[say:嗯……好吧，[name]。那就这么定了，这是一场约会！!]");
         outputText("[pg]你们俩向着荒野出发，小心翼翼地不发出太大声响，毕竟一路上要是被恶魔发现可就麻烦了。在跋涉的过程中，艾米莉给了你许多关于如何在玛瑞斯的地形中隐蔽行动的指点，数量之多令人惊讶。很明显，她在如何不被发现这方面花了很多心思和练习，当你们毫不费力地到达林木线时，她的专业知识就显而易见了。");
         outputText("[pg]鼠[if (nofur) {娘|人}]在树前停顿了片刻，嗅了嗅周围的空气，然后说道：[say:好了，跟着我就行。] 她全神贯注，像一阵微风般穿过树枝和嫩枝，[if (spe < 50) {你艰难地|你勉强能}]跟上她在森林中穿梭的步伐。");
         outputText("[pg]没过多久，你们来到了一片空地，艾米莉靠在一根圆木上休息了片刻。[say:通常在深入之前，我会做点伪装。你……你想让我展示给你看吗，[name]？]?]");
         outputText("[pg]你迅速的肯定大大增强了她的信心，很快，她就开始收集树叶、草和泥土，把自己的脸和身体当成画布，让自己完美地融入周围的自然环境中。你[if (cor < 40) {称赞了她|夸奖了她一番}]，她的脸上绽放出笑容，尽管她还在继续完善自己的伪装。[say:这、这没什么特别的。真的，只是基本的生存技巧……...]");
         outputText("[pg]你告诉她，尽管如此，这依然很了不起，你在英格纳姆从来不需要做这种事。她一直都是这样生活的吗？");
         outputText("[pg][say:我尽我所能地凑合着过，] 她若有所思地回答。仿佛是为了驱散对自己现状的思考，她开始加快步伐，在森林中穿梭，向你展示她四处学到的小技巧，比如哪些蘑菇可以吃，哪些声音是附近有触手怪的迹象。");
         outputText("[pg]过了一会儿，你们俩都觉得需要喘口气，于是选择在一棵大树的树洞里休息。[say:嗯，我不知道这算不算是一场约会，] 她红着脸说，把尾巴卷在腿上。[say:你喜欢吗？]");
         outputText("[pg]你向她保证你依然很享受，她的眼中闪烁起一丝光芒。[say:我很高兴，[name]。] 她看起来有些不好意思，但还是继续说道。[say:我也玩得很开心。既然我们出来了，你……还有什么想做的吗？]");
         menu();
         addNextButton("做爱",forestDateFuck).hint("让事情更进一步。");
         addNextButton("亲吻",forestDateKiss).hint("你需要表达你的爱意。");
         addNextButton("采集",forestDateGather).hint("在回去之前收集一些有用的东西。");
         addNextButton("返回",forestDateLeave).hint("你应该回营地了。");
      }
      
      public function farewellNote() : void
      {
         amilySprite();
         outputText("[pg]今天早上醒来时，你发现艾米莉不见了，只给你留了一张小纸条。[pg]");
         outputText("[say: 亲爱的[name]，我试过警告你，但腐化的力量似乎连你也无法抗拒。我不想这么做，但我已经离开了营地——我太在乎曾经的那个[manboy]了，不忍心看着你像其他恶魔一样堕落于罪恶之中。如果你能从深渊中回头，我会回到你身边的。][pg]");
         outputText("<b>艾米莉搬走了！</b>[pg]");
         outputText("就算你不再那么纯洁了又怎样；你仍然非常有能力帮助她！也许你应该给她点教训？[pg]");
         if(get_player().get_inte() >= 40)
         {
            outputText("你开始制定计划，但要付诸行动，你需要一瓶催情剂和一些地精麦酒。那只该死的老鼠会为拒绝你的那一天感到后悔的……...");
         }
         else
         {
            outputText("你想起了探索时找到的一些有趣的药水；也许你可以用上它们……...");
         }
         outputText("也许她说得有道理？你确实变得相当腐化了……这些想法就是最好的证明。[pg]");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,43,0);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,168,1);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,36,0);
         if(get_player().get_pregnancyType() == 11)
         {
            get_player().knockUpForce(4,get_player().get_pregnancyIncubation());
         }
      }
      
      public function encounterAmily() : void
      {
         _encounterAmily();
         unlockCodexEntry(2740);
         get_output().flush();
      }
      
      public function dyeAmilyHairOrFur() : void
      {
         clearOutput();
         outputText("你问她是否想过改变头发的颜色（[horsecock]-皮毛，你纠正自己/什么都没有）——如果她想的话，你有一种可能的新颜色让她试试。");
         outputText("[pg]她看起来在沉思。[say: 我一直有点想尝试新造型。当然，让我们试一试！]她微笑着。");
         outputText("[pg]你们俩走向小溪，艾米莉脱下衣服潜入水中，以确保自己洗得尽可能干净。当她游回来时，你和她一起站在水边，打开染料瓶，开始漫长的过程，将其按摩到她的（[horsecock]皮毛中。你有一瞬间担心没有足够的染料覆盖她，但最后，你设法做到了/头发）。帮她用凉水洗掉多余的染料，你们俩离开水面，艾米莉慢慢转圈，让你欣赏她的新(dyecolor)（[horsecock]皮毛/发型）。她自己也很满意，抓起她的(clothesdescript)走回营地，你跟在她后面。");
         doNext(amilyFollowerEncounter);
      }
      
      public function dugEnough(param1:Boolean) : void
      {
         clearOutput();
         outputText("然而，这个想法很快就过去了；你的爱人已经被很好地撑开了，随着腹股沟热量的积聚，你没有时间去想那些无聊的想法。你需要花点时间才能适应鼠娘抵抗的褶皱带来的难以置信的紧致感，但你紧紧抓住她的腰，开始移动。如果她不喜欢，你很快就能让她感觉舒服。[pg]");
         outputText("当你开始拔出时，艾米莉的双手紧紧抓住你的手腕，虚弱地试图把它们推开，而她的肚子随着入侵者的退出而瘪了下去。[say: 我说什么了……？！你不能……]她抗议着，试图把你推出去。然而，当你再次插进去时，手指失去了抓握力，伴随着主人的一声高亢的咕哝声，她的肚子再次被撑开。[pg]");
         outputText("[say: 啊……啊啊！太……深了！]艾米莉的呻吟声盖过了摩擦肉体的湿润声音，你们俩在抽插结束时停顿了一下，享受着你们互相操得有多粗暴的可爱性感。随着每一次抽插，你用你巨大的阴茎的形状让她的肚子鼓起又瘪下。她的舌头在说话间挂在嘴边，口水流到胸前，每次肚子向外拉伸时，她的双手都会隔着肚皮紧紧抱住你。没过多久，她就从推开你变成了拉你进来，甚至把腿缠在你的背上。[pg]");
         outputText("[say: 你插得太深了！你会——把我逼疯的——啊……！疯了……！]她尖叫着，在每一次抽插之间喘着粗气，表情淫荡。在鼠娘紧致的身体和她流口水的表情之间，你很快就接近了自己的极限，当你挣扎着喘息时，一声咕哝从你的嘴唇中逃出。");
         outputText("你紧紧抱住艾米莉，突然把她拉进怀里，给了她一个热情的吻。她的舌头急切地回应着，她松开了抓住你阴茎的手，用双臂和双腿紧紧抱住你。你紧紧抱住她，在最后一次抽插时高潮，深深地射入她体内。");
         if(get_player().cumQ() > 1000)
         {
            outputText("你可以感觉到下半身的一阵冲动和深深的满足感，精液像洪流一样从你的阴茎喷涌而出，开始填满艾米莉的体内。在快乐的阵痛中，感觉它不会结束，当它结束时，你爱人的肚子膨胀得更厉害了，圆圆的形状像怀孕了一样。");
         }
         outputText("[pg]当你们松开彼此时，她抱着肚子，有一会儿你们俩都无法用语言来表达，看着液体从她的" + (param1 ? "屁股" : "小穴") + "中渗出" + "。");
         outputText("[pg]最终，你们再次倒在彼此的怀里，以一种平静得多的方式拥抱。仍然处于相当性奋的状态，当她突然弹你的鼻子时，你感到很惊讶。剧烈的疼痛让你惊呼出声，你用手捂住脸，艾米莉带着得意的笑容迎上你困惑的目光。");
         outputText("[say: 我告诉过你不要插得那么深！]她轻轻地责备你，片刻后补充道，[say: 不过，我没想到会那么舒服……]并在同一个地方给了你一个吻。你们在余韵中拥抱了很长一段时间，渴望有时间再来一次。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function drinkThePotion() : void
      {
         clearOutput();
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,771,FlagDict_Impl_.arrayReadInt(_loc1_,771) + 1);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,771) == 1)
         {
            outputText("艾米莉对你微笑着，尾巴缠绕在你的[leg]上，她警告说，[say:现在，我已经摆弄这个有一段时间了，但我还没有机会测试它，所以它可能会有一些意想不到的副作用。.]");
            outputText("[pg]你笑得和以前一样灿烂，告诉她当你同意这个想法时，你就已经料到了这一点。");
            outputText("[pg]鼠娘从包里拿出两瓶药水，解释道：[say: 爸爸一瓶，妈妈一瓶。这瓶是你的。]她递给你的瓶子塞着紧紧的软木塞，里面装满了旋转的粘稠蓝色液体，而艾米莉手里拿着一个类似的容器，里面装的是粉红色的混合物。");
            outputText("[pg]你用你的瓶子碰了碰矮个子女孩的瓶子，举杯道：[say: 敬我们的孩子，敬我们！!]");
            outputText("[pg]艾米莉也用她的瓶子碰了碰你的，附和道：[say: 敬我们的孩子，敬我们！!]");
            outputText("[pg]你微笑着拔开软木塞，仰起头将药水一饮而尽，毫无顾忌地大口吞咽着，你深信任何能增加受孕几率的东西也一定会增加乐趣。艾米莉的手指从紧紧塞住的塞子上滑落，她正努力打开自己的那瓶。");
            outputText("[pg][say: 呃……这该死的……东西……拔不动！]她绝望地抱怨着，一屁股坐在她的" + amilyButt() + "上，沮丧地扭动着、拉扯着。");
            outputText("[pg]你只喝了大约一半甜甜的饮料，但你固执地坚持着，认为药水应该一口气喝完。你的腹部已经明显感觉到一种正在萌发的温暖。每一口吞咽都让那团热量在你体内扩散，尽管它似乎在你的腹股沟聚集得比其他地方更快……...");
            outputText("[pg]突然，一双有力的手臂环住了你的腰，一个尖锐的声音问道：[say: 玩什么好玩的呢，也不带上我，阿尔法？]是伊兹玛！这个脾气暴躁的鲨鱼女孩趁你嘴里塞满东西，毫无阻碍地继续说道。[say: 和你的同伴喝点小酒，嗯？让我来帮你吧，小老鼠。.]");
            outputText("[pg]伊兹玛从艾米莉手中夺过瓶子，轻而易举地拔开软木塞，[say: 干杯！]艾米莉结结巴巴地抗议着，但为时已晚。伊兹玛一口气喝下了一半的药水，然后带着满意的坏笑把它拿开，她的嘴唇和瓶子之间还挂着一丝粉红色的唾液。[say: 提醒你一下，这不是我常喝的年份。有点太甜了。]她把眼镜推上鼻梁，把喝了一半的药水递回给老鼠。[say: 有福同享，对吧？]");
            outputText("[pg]艾米莉脱口而出：[say: 那不是饮料！那是我的生育药水，我甚至还没测试过呢！]愤怒的小鼠娘骄傲地撅起自己的嘴唇，一口气喝完了剩下的药水，而你则擦去嘴边最后一点药水，不知道该如何应对眼前的局面。");
            outputText("[pg][say: 生育药水！？]鲨鱼女孩大叫起来，然后从嘴里打了一个不淑女的嗝。[say: 你让我喝了某种……配种药水！？]伊兹玛转向鼠娘，直接挡在你和这个娇小的女人之间。她的尾巴愤怒地抽打着你的[legs]，但每次她都会更用力地推挤你，直到她的屁股隔着你的[armor]摩擦着你的腹股沟。她烦躁地低吼着，双手向后伸去，保护性地抱住你的[hips]。");
            outputText("[pg]艾米莉反驳道：[say: 你根本没给我解释的机会，你这个笨蛋！!]");
            outputText("[pg]两人开始互相争吵，但老实说，你已经不再注意那尖锐的女性声音了。有一具温暖的身体紧紧贴着你，感觉是那么……对味。你让双手在伊兹玛的曲线上游走，几乎不在乎它们停留在她被遮盖的乳房上，轻轻揉捏着每一个，然后滑入布料下，捏住下面坚硬的乳头。你的脸上挂着淫荡的笑容，尽管老实说，你几乎没有意识到。你的内衣和[armor]实在是太……碍事了，让你很难用[eachCock]去摩擦她紧实、匀称的臀部。");
            outputText("[pg][say: [name]！]艾米莉尖叫着，绕过伊兹玛，把手放在你的背上。[say: 你不会是想把我的药水浪费在这个水性杨花的女人身上吧？]她正温柔地在你的肌肉上画着圈摩擦，已经开始动手脱你的衣服了。[say: 记住，你要再次让我怀上一大窝孩子，对吧？]鼠人发出咕噜声，大胆地将手滑过[oneCock]，捏了捏，轻轻地把它拉向自己。");
            outputText("[pg][say: 见鬼去吧！]伊兹玛转过身来，咆哮道。她轻松地撕掉你剩下的[armor]，把手放在");
            if(get_player().biggestCockArea() < 10)
            {
               outputText("那只握着鸡巴的娇小手指上");
            }
            else
            {
               outputText("你的[sheath]上]");
            }
            outputText("充满占有欲。[say: 你们俩让我喝了那个，所以你们最好承担后果。]她充满欲望的眼睛瞥了你一眼，然后顺从地垂下眼帘，[say: 当然，如果那是你的意愿，阿尔法。]她的手指轻轻捏住你的阴茎。");
            outputText("[pg]你呻吟着，感觉比很长一段时间以来都更想做爱，你回答道：[say: 你们两个……我会照顾好你们两个的……毕竟，我喝的药水是你们任何一个的两倍，所以应该没问题，对吧？]");
            outputText("[pg]艾米莉似乎想争辩，但她改变了主意。[say: 好吧，亲爱的，我想我们终究可以做你怀孕的姐妹妻子。.]");
         }
         else
         {
            outputText("你问艾米莉，她是否又配制了那种之前你、她和伊兹玛玩得很开心的药水。");
            outputText("[pg]艾米莉笑了起来，[say: 你还想再来一次？]她娇小的嘴角勾起一抹略显羞涩的微笑。");
            outputText("[pg]当你点头时，她的笑容变得兴奋起来，开始从她的装备中挑出几个瓶子。你注意到有一个蓝色的和两个粉色的，不过那些给女孩喝的药剂分量只有男性药剂的一半。[saystart]上次的效果真的、真的很好，所以我觉得完全没必要调整剂量。我甚至不确定在那么酸痛之后，我还能不能承受一整个疗程……...");
            if(pregnancy.get_isPregnant())
            {
               outputText("至少我不能再怀孕了！!");
            }
            outputText("[sayend]");
            outputText("[pg]你得意地笑了笑，挑起一根眉毛，问道：[say: 伊兹玛？]");
            outputText("[pg]艾米莉点点头。[say: 伊兹玛啊啊啊啊啊啊！!]");
            outputText("[pg]漂亮的虎鲨女孩扭着腰从岩石后面走出来，一边回应着高亢的呼唤，一边在她的读物里夹上书签。她在你们俩之间扫视了一下，轻哼了一声，带着苦笑说道：[say: 噢，没有我就不能找点乐子吗？]她走近时，裙子微微沙沙作响");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,439) == 0)
            {
               outputText("，几乎掩盖不住下面半肿胀的凸起");
            }
            outputText("。伊兹玛说，[saystart]管他呢，我");
            if(get_izmaScene().pregnancy.get_isPregnant())
            {
               outputText("想我可以为了好玩做一次，反正我已经怀孕了。");
            }
            else
            {
               outputText("想我们可以再要个孩子。");
            }
            outputText("[sayend]");
            outputText("[pg]药水被分发下去，你们三个很快就开始喝了起来。女孩们先喝完了她们那半瓶，然后就无事可做，只能慢慢地脱掉你的衣服，而你则试图吞下最后一点甜美、催情的液体。当四只手在你的身体上游走时，你很难集中精力吞咽你那份药水，当两个女孩开始从两边抱住你，错落有致的手伸进你的胯部，急切地抚摸着[oneCock]时，你差点被呛到。聚集在你腹部的人造温暖慢慢蔓延到你的全身，尽管似乎大部分都集中在[eachCock]上，在那里它可以被饥渴的雌性们愉悦的手指适当地刺激。");
            outputText("[pg]艾米莉在你的腋下蹭了蹭，她的鼻子贴在你的[chest]侧面，深吸了一口气，喃喃地说：[saystart]真是个" + get_player().mf("强壮、有力的雄性……","美丽、有力的种马……") + " 你会");
            if(!pregnancy.get_isPregnant())
            {
               outputText("给我很多宝宝");
            }
            else
            {
               outputText("在我肚子里放更多宝宝");
            }
            outputText("，对吧？没必要理她……[sayend]");
            outputText("[pg]伊兹玛学着鼠娘端庄的姿势，从另一边恶狠狠地瞪着她，手紧紧抓住艾米莉后面的[oneCock]。[say: 阿尔法，那只啮齿动物在床上绝对满足不了你。来吧，用我。.]");
            outputText("[pg]情欲带来的愉悦迷雾让你难以思考。为什么这些女孩不明白，你完全有能力满足她们所有人？你呻吟着回答：[say: 我会照顾好你们俩的……你们太性感了，我不能让你们不带着每个洞里的精液离开。.]");
            outputText("[pg]女孩们在你的腰间最后交换了一个恶狠狠的眼神，然后两双眼睛都落在了你的[cock biggest]上，两个声音异口同声地说：[say: 我们可以分享。.]");
         }
         dynStats(DynStat.Lib(1),DynStat.Sens(1),DynStat.Lust(100,DynStatOp.Eq),DynStat.NoScale);
         menu();
         addButton(0,"继续",izmaAmilyDrugThreeWaySex);
      }
      
      public function digTooDeep(param1:Boolean) : void
      {
         var type3:Boolean;
         var _g2:AmilyScene;
         var type2:Boolean;
         var _g1:AmilyScene;
         var type1:Boolean;
         var _g:AmilyScene;
         clearOutput();
         dynStats(DynStat.Cor(5));
         menu();
         outputText("你忍不住注意到自己的心跳加快了。艾米莉的身体紧紧地贴着你的" + get_player().cockDescriptShort(0) + "，但你就是不满足，这还不够！她这样叫你忍耐是不公平的！!");
         outputText("[pg]当鼠娘在你的怀里扭动时，你低头看着她的身体。你的目光特别停留在她肚子上被你肉棒顶出的凸起上……你不确定自己脸上是什么表情，但当艾米莉看到时，她突然变得害怕起来。[say: [name]……？！喂，[name]，你在干什么？！?!]");
         outputText("[pg]你用一次猛插回答了她的问题，用力将她的腰拉向自己，同时将你的阴茎更深地插入她的" + (param1 ? "屁股" : "小穴") + "，进一步撑开她的身体，惹得鼠娘发出一声尖叫，她紧紧抓住自己鼓起的肚子，随着你的抽出，肚子又恢复了原状。");
         outputText("[say: 停下……！停下……！]她哀求着，随着你再次猛插，声音变成了尖锐的呜咽，你的肉棒滑得更深了……光是看着就让你心跳漏了一拍。从进入她的" + (param1 ? "屁股" : "小穴") + "开始，你的肉棒就顺着她的身体撑开了她。一个几乎和她身体一样宽、手臂一样粗的凸起横跨她的肚子，一直延伸到她的胸部，强行将她的双乳分开。");
         outputText("[pg]她的哀求声渐渐消失，但当你的目光落在她绝望的眼神上时，你被拉回了现实。眼泪顺着她的脸颊流下，她哀求时看起来非常害怕。[say: 求求你，求求你……！[name]，你的肉棒会把我弄坏的……！...!]");
         _g = this;
         type1 = param1;
         addButton(0,"停下",function():void
         {
            _g.stopDigging(type1);
         }).hint("你可能做得太过火了。");
         _g1 = this;
         type2 = param1;
         addButton(1,"继续",function():void
         {
            _g1.keepDeepFuck(type2);
         }).hint("你已经做得太过火了，停不下来了。");
         _g2 = this;
         type3 = param1;
         addButton(2,"更深！",function():void
         {
            _g2.digEvenDeeperOhGod(type3);
         }).hint("这还不够！更深！更深！!");
      }
      
      public function digEvenEvenDeeperOhGod(param1:Boolean) : void
      {
         dynStats(DynStat.Cor(15));
         clearOutput();
         outputText("无视了她的哭喊，你兴奋地喘息着，舔了舔嘴唇，再次挺身抽插。鼠娘在你的肉棒上痉挛着，发出一声呜咽。突然，她积攒起力气，开始惊慌失措地踢打挣扎，随着你阴茎的每一次抽动而呜咽哭泣。但她的抵抗只会让你的鸡巴变得更硬。她胡乱摸索着寻找任何可以借力的地方，虚弱地尖叫着，背部抵着地面试图将自己推开，而你则向后退去准备下一次冲刺。她几乎就要成功了，哭喊着挣扎，直到你的鸡巴退回到她的胃部，但你死死地抓住了她的脚踝，把她按在原地。她有足够的时间回头看你，在看到你脸上的表情后，她脸色苍白，随后因极度的恐惧而僵住了。");
         outputText("[pg]你舔去嘴角流下的口水，压低声音问她到底想去哪儿，同时用你的鸡巴从里面顶着她的胃。这种压迫感让她大声呻吟，结结巴巴地说着。[say: 不、不、不是，我没有……呃啊！]她痛苦地闷哼一声，捂着肚子，而你用一次猛烈的抽插打断了她的话。");
         outputText("[pg]你解释说你还没完事呢，当她咬紧牙关忍受痛苦并抓紧胸口时，她睁大的双眼失去了焦点，而你则更深地挺进。[say:我-我-我-我没有……不会——不不不……求求你……求-求求你……求求你……！]她乞求着，呜咽着，泪水顺着脸颊流下。你咧嘴一笑作为回答，狠狠地插进她体内。你估计三次就能搞定……一！你的鸡巴强行撑开她的双乳，让她发出一声尖锐的惊叫。二！你插得更深了，几乎到了她的脖颈处，她用半连贯的话语乞求着怜悯。");
         outputText("你的鸡巴几乎撑满了这个女孩的整个身体，把她的皮肤撑得怪异地鼓起。你的鸡巴几乎和她的躯干一样宽，甚至更粗，把她身体正面的形状撑得完全变形。但这还不够。");
         outputText("[pg]三！!");
         if(!param1)
         {
            outputText("[pg]伴随着最后一次挺进，你舒服地呻吟出声，艾米莉的身体瘫软下来，绝望地喘息着。你的整根鸡巴都感受到了一种难以言喻的温暖和紧致，艾米莉翻着白眼，你鸡巴的轮廓甚至顶过了她的头部和脸部。她的抵抗终于完全停止，舌头无力地垂在外面，随着你抽插的动作，她的舌头和乳房一起前后晃动。");
            outputText("[pg]虽然她一开始是瘫软的，但随着你每一次更深的挺进，她的身体开始抽搐。越来越深，你把她撑得越来越开，直到你整根" + get_player().cockDescriptShort() + "都埋进了她颤抖的身体里。");
            outputText("[pg]艾米莉的抵抗意志和理智已经完全崩溃，她无力地挂在你粗大的肉棒上，抽搐着发出干呕的声音。除了无意识的痉挛，随着你继续操弄她的身体，她唯一的反应就是发出一连串痛苦的闷哼和喘息，那声音简直是你听过最可怜的。");
            outputText("[pg]终于，你感觉到自己快要满足了，当她的身体再次颤抖痉挛时，你发出一声颤抖的低吼，释放出了你的精液。");
            if(get_player().cumQ() >= 1000)
            {
               outputText("[pg]你挺动胯部撞击着这个饱受蹂躏的女孩，将肿胀肉棒里的每一滴精液都倾注进去。从你撑开她身体的顶端开始，她的身形再次膨胀起来，没过多久，你就能感觉到滚烫的液体顺着你的肉棒流下，为你进一步润滑了鼠娘的身体。她虚弱地尖叫着，泪水顺着脸颊流下，随后彻底安静了下来。没过多久，她就被你的高潮彻底撑满，以至于你几乎看不出那下面还有个人形。");
            }
         }
         else
         {
            outputText("[pg]伴随着最后一次挺送，你发出一声大声的呻吟，尽可能深地顶进鼠娘的体内！她发出一声沉闷的尖叫，双手死死抓着自己的喉咙——你的肉棒终于插进了那里，并遇到了迄今为止最大的阻力。艾米莉干呕着，大口喘着粗气，试图把你的肉棒推回去，但这都是徒劳。她的大部分抵抗意志早就消失了，但即使她还在反抗也无法阻止你。女孩的眼眶湿润了，脸因为干呕而涨得通红，泪水顺着脸颊不断滑落。");
            outputText("[pg]你稍微停顿了一下。这不是出于任何同情或悔恨，而是为了享受鼠娘喉咙那极乐般的紧致感，她的双手抓着喉咙，无意中从外面为你套弄着。你死死咬紧牙关承受着这股快感，更加用力地向前顶去。");
            outputText("[pg]一开始你被挡住了。艾米莉干呕着，双颊鼓起，死死地抵挡着你的肉棒。但随着最后一次挺进，她的力气消散了，你的阴茎强行从她的下巴顶了出来，把她的嘴巴撑得不可思议地大，导致她的双手无力地垂在身体两侧。当你的龟头挤过她的舌头和嘴唇时，传来一种湿滑而美妙的感觉，突然涌入的刺骨冷风拂过你的龟头，让你浑身一颤。");
            outputText("[pg]当这个念头在你被性欲蒙蔽的脑海中浮现时，你的阴茎突然变得更加坚挺。你已经把艾米莉的身体彻底贯穿了，从她的屁股，穿过她的肠道和胃，直接从她的喉咙里穿了出来。你那巨大的阴茎凸起几乎构成了她身体的全部轮廓。如果不是因为她大张的屁股两侧还悬挂着四肢，而且在你的肉棒另一端，她的脸和半昏迷的眼睛还呆滞地望着天空，她简直已经认不出是一个人了。");
            outputText("[pg]她可怜巴巴地挂在你巨大的阴茎上，用她的嘴、她的屁股以及她体内的每一寸紧紧地吸附着它。为了你自己的快感，你把这个曾经骄傲的鼠娘变成了一个活生生的飞机杯。这个令人难以置信的想法，加上冷空气和女孩全身的紧致感，将你推向了高潮，你的精液喷射到半空中，然后如雨点般落在艾米莉半睁的眼睛上。");
         }
         outputText("[pg]你被快感所淹没，跪倒在地。你疯狂地抽插挺动，将艾米莉的" + (param1 ? "ass" : "pussy") + "拉向你的阴茎根部又撞击了几次，同时享受着她身体带来的令人陶醉的快感。");
         outputText("当你终于放开这个女孩时，她的紧致让你几乎无法将她从你巨大的肉棒上拔下来。不过你最终还是做到了，在她被释放的那一刻你再次高潮，当她摔在地上时，你的精液喷洒在了她的全身。");
         if(param1)
         {
            outputText("[pg]她的嘴巴无力地张着，舌头伸在外面，而她的后穴大张着");
         }
         else
         {
            outputText("[pg]她的舌头无力地从紧闭的嘴巴里垂出，而她的小穴大张着");
         }
         outputText("，你的精液源源不断地滴落，在地上汇成一滩。终于从折磨中解脱出来，她语无伦次地呜咽着，半睁的眼睛无力地来回转动，却无法聚焦在任何特定的事物上。她可怜巴巴地嘟囔着胡话，半梦半醒，完全失去了理智，身体还在抽搐痉挛。她断断续续地哭泣和哀鸣，在痛苦和恐惧的交织中呻吟，完全无法恢复神智。这迷人的景象是你被快感耗尽体力、陷入昏迷前看到的最后一幕。");
         doNext(tooDeepAmilyLeaves);
      }
      
      public function digEvenDeeperOhGod(param1:Boolean) : void
      {
         var type1:Boolean;
         var _g:AmilyScene;
         clearOutput();
         dynStats(DynStat.Cor(5));
         menu();
         outputText("听着鼠娘的哀求，你内心的某种东西断裂了……一种饥渴的、几乎是掠夺性的本能占据了上风，你的视野变窄了，你专注于紧紧包裹着你肉棒的火热、紧致的身体。");
         outputText("[pg]有一瞬间，艾米莉的哀求声安静了下来。她的表情很快表明这是出于恐惧，而不是接受，她睁大眼睛直勾勾地盯着你。[pg]");
         outputText("[say: [name]，求求你……]她哀求着，你紧紧抓住她的肩膀，将她和你的肉棒一起抬起，越插越深……现在，你阴茎的顶端已经明显地凸起，刚好越过她的双乳，将它们推开，女孩的身体因痛苦和恐惧而颤抖……你只能想到用“天堂般”这个词来形容这种感觉。");
         outputText("[pg]当你再次插入她体内时，鼠娘的嘴唇里发出一声尖锐、恶心的声音，她喘不过气来。她眼中的光芒黯淡下来，嘴巴张开，双手无力地垂在身体两侧。你再次猛插。又一次。每一次，她的身体都会抽搐，头向前猛地一仰，然后又向后倒去。当你更深地插入她体内时，鼠娘已经失去了反抗的力气，而你也失去了所有的理智，只想从你可爱的老鼠玩具身上榨取最后一丝快感。");
         outputText("[say: 你……不……能……]她勉强结巴着，随着你的肉棒在她的身体里越顶越深，她发出吱吱的低语。[say: 我会……死的……]她哀求着，凸起刚好停在她的脖子下方……...");
         addButton(1,"停下",stopDiggingEvenDeeper).hint("你绝对做得太过火了。");
         _g = this;
         type1 = param1;
         addButton(2,"更深！",function():void
         {
            _g.digEvenEvenDeeperOhGod(type1);
         }).hint("挖得太贪婪，也太深了。");
      }
      
      public function digDeeper(param1:Boolean) : void
      {
         var type2:Boolean;
         var _g1:AmilyScene;
         var type1:Boolean;
         var _g:AmilyScene;
         get_player().orgasm("Dick");
         clearOutput();
         amilySprite(true);
         menu();
         outputText("没过多久，艾米莉就躺了下来，你们俩互相脱去了对方的衣服，尽管你的手在她的身体上漫不经心地游走，因为你正在考虑给女孩的惊喜。[say: 别再挑逗了……你还在等什么？]当你把你的" + get_player().cockDescriptShort(0) + "放在她的肚子上时，她在你耳边低语。你忍不住盯着看了一会儿，考虑到它已经到了");
         if(get_player().biggestCockLength() <= 30)
         {
            outputText("她的肚脐");
         }
         if(get_player().biggestCockLength() <= 40)
         {
            outputText("她的双乳之间");
         }
         if(get_player().biggestCockLength() > 40)
         {
            outputText("一直越过她的脸");
         }
         outputText("然后退回来，将龟头引导进她的" + (param1 ? "屁股" : "小穴") + "。她的身体紧绷起来，当你设法挤进去时，一声轻柔的呻吟从她唇间溢出，紧接着是一声愉悦的喘息，因为你开始小心翼翼地移动。[pg]在很短的一段时间里，你进入了短促抽插的节奏，用你的" + get_player().cockDescriptShort(0) + "的龟头在她的" + (param1 ? "屁股" : "小穴") + "里搅动……但在轻柔的动作和你抚摸她乳房的方式之间，没过多久，艾米莉的防备就放下了，尾巴在它躺着的地方轻轻摇摆……[pg]");
         outputText("就在这时，你采取了行动。[pg]");
         outputText("伴随着一次有力的抽插，你强行将自己插得更深，猛烈地推挤着鼠娘的内壁。作为回应，女孩的尾巴和身体僵硬了，她的背部微微拱起，嘴巴张成圆形，发出无声的喘息。当你意识到她的肚脐因为你的粗壮而明显凸出时，感觉就像有一股电流穿过你的下半身。[pg]");
         outputText("[say: 太——太深了……！]她抱怨道，双手试探性地触摸着她身体被撑开的地方……...");
         outputText("[pg]有一瞬间，你忍不住觉得还不够深。");
         _g = this;
         type1 = param1;
         addButton(0,"够深了",function():void
         {
            _g.dugEnough(type1);
         }).hint("她知道自己能承受多少。最好尊重她。");
         if(get_player().cor + get_player().corruptionTolerance() >= 60 && get_player().biggestCockLength() >= 40)
         {
            _g1 = this;
            type2 = param1;
            addButton(1,"还不够深",function():void
            {
               _g1.digTooDeep(type2);
            }).hint("把你的肉棒插得更深。她绝对不会喜欢的，但她指望你拿这么大的肉棒怎么办？");
         }
      }
      
      public function determineAmilySexEvent(param1:Boolean = false) : Function
      {
         var _loc2_:Function = null;
         if(!param1 && get_player().get_lust() < 33)
         {
            return null;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,159) > 0 && get_player().get_gender() == 2)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) > 0)
            {
               if(!pregnancy.get_isPregnant())
               {
                  _loc2_ = hermilyOnFemalePC;
               }
               else if(Utils.rand(2) == 0)
               {
                  _loc2_ = girlyGirlMouseSex;
               }
               else
               {
                  _loc2_ = hermilyOnFemalePC;
               }
            }
            else
            {
               _loc2_ = girlyGirlMouseSex;
            }
         }
         if(get_player().get_gender() == 3 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,165) == 2)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) > 0)
            {
               if(!pregnancy.get_isPregnant())
               {
                  if(!get_player().isPregnant())
                  {
                     if(Utils.rand(2) == 0)
                     {
                        _loc2_ = hermilyOnFemalePC;
                     }
                     else if(param1)
                     {
                        _loc2_ = amilySexHappens;
                     }
                     else
                     {
                        _loc2_ = sexWithAmily;
                     }
                  }
                  else if(param1)
                  {
                     _loc2_ = amilySexHappens;
                  }
                  else
                  {
                     _loc2_ = sexWithAmily;
                  }
               }
               else if(!get_player().isPregnant())
               {
                  _loc2_ = hermilyOnFemalePC;
               }
               else if(Utils.rand(2) == 0)
               {
                  _loc2_ = hermilyOnFemalePC;
               }
               else if(param1)
               {
                  _loc2_ = amilySexHappens;
               }
               else
               {
                  _loc2_ = sexWithAmily;
               }
            }
            else if(!pregnancy.get_isPregnant())
            {
               _loc2_ = sexWithAmily;
            }
            else if(Utils.rand(2) == 0)
            {
               _loc2_ = girlyGirlMouseSex;
            }
            else if(param1)
            {
               _loc2_ = amilySexHappens;
            }
            else
            {
               _loc2_ = sexWithAmily;
            }
         }
         if(get_player().get_gender() == 1)
         {
            if(param1)
            {
               _loc2_ = amilySexHappens;
            }
            else
            {
               _loc2_ = sexWithAmily;
            }
         }
         return _loc2_;
      }
      
      public function desperateFinallyAmily() : void
      {
         amilySprite();
         outputText("你很好奇她要说什么，于是同意了。[pg]");
         outputText("艾米莉用她那像手指一样的脚趾爪子在地上蹭了蹭，低头看着它，仿佛那是世界上最有趣的东西——或者仿佛她不敢直视你的眼睛。[say: 我……你知道我一直向你要求什么；从你那里，而你一直拒绝我……但你一直在和我说话，问我关于我自己的事情。你想了解我，但是……你为什么不想了解我的全部？我……我想把自己交给你。你是我见过的最好、最善良的男人——甚至在恶魔摧毁我的村庄之前。我想和你在一起……但你似乎不想和我在一起。]她终于抬起头看着你，眼中满是泪水。[say: 我有什么问题吗？你不能那样喜欢我吗？]她恳求道。[pg]");
         menu();
         addButton(0,"接受她",desperateAmilyPleaAcceptHer);
         addButton(1,"温柔拒绝",desperateAmilyPleaTurnDown);
         addButton(2,"直言拒绝",desperateAmilyPleaTurnDownBlunt);
      }
      
      public function desperateAmilyPleaTurnDownBlunt() : void
      {
         amilySprite();
         clearOutput();
         outputText("你毫不留情、毫不犹豫地告诉她，她确实有问题：你永远不会被一个看起来像害虫、应该躲在谷仓里的女人所吸引。[pg]");
         outputText("[say: 你怎么——！我对你敞开心扉，你就是这样回报我的？！]艾米莉尖叫道；愤怒、受伤和被背叛的感觉在她的话语中表露无遗。[pg]");
         outputText("你嘲笑她，说她这么可悲不是你的错，竟然爱上了第一个可怜她并和她说话的人。[pg]");
         outputText("作为回应，艾米莉对你吐出了一连串极其刺耳的脏话。在愤怒中，她用手向你掷出一枚吹箭，被你轻松拍开。她一边咒骂着，一边愤怒地跑开了。[pg]");
         outputText("你知道她再也不会回来了。");
         dynStats(DynStat.Cor(1));
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,36,1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function desperateAmilyPleaTurnDown() : void
      {
         clearOutput();
         amilySprite();
         outputText("你轻声告诉她你很抱歉，但这也是没办法的事。你还有任务要完成，甚至不知道结束后是会留在这里还是回家。这还是假设你能成功，而不是死在哪个阴沟里。在这样的重担下，你无法接受找个情人。此外，你告诉艾米莉，无论如何，她都应该比她这个计划更尊重自己的身体。[pg]");
         outputText("艾米莉大声抽泣着，泪水肆无忌惮地流下脸颊。[say: 如果……如果只能这样的话，那，]她抽着鼻子说，[say: 我……我想这里已经没有什么值得我留恋的了。我只能离开了……也许我能找到一个至少能给我提供庇护的地方。][pg]");
         if(get_game().telAdre.isAllowedInto())
         {
            outputText("你告诉她，你在沙漠中发现了一座隐藏的城市，那里没有腐化。艾米莉看起来很震惊，但当你向她保证它的存在并告诉她如何到达那里时，她显然很感激。[pg]");
         }
         else
         {
            outputText("艾米莉神情沮丧，慢慢地开始走开。然而，就在她最后一次转身消失之前，她回过头来看向你。[say: 我会永远记住你的，]她真诚地承诺道——然后她就消失了。[pg]");
         }
         outputText("感受到空荡荡的村庄带来的压抑感，你迅速撤离了。再回到这里已经没有意义了。[pg]");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,36,1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function desperateAmilyPleaAcceptHer() : void
      {
         clearOutput();
         amilySprite();
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,39,1);
         outputText("你带着温柔的微笑，伸出手握住她的手。你告诉她你也喜欢她；你只是想在夺走她最珍贵的童贞之前，先了解她这个人。如果她依然想要你，那你现在就愿意和她一起走。[pg]");
         outputText("艾米莉呆呆地看着你。过了一会儿，她猛地抱住你，开始拉着你走。[pg]");
         doNext(amilySexHappens);
      }
      
      public function declineToMakeAmilyFuta() : void
      {
         clearOutput();
         amilySprite();
         outputText("转念一想，你决定不给她了。当你道歉并把它放回口袋时，艾米莉看起来松了一口气。[say: 那么，你到底想问我什么？]她说道，急于转移话题。");
         outputText("[pg]你实在没什么好说的，尴尬地走开了。");
         doNext(playerMenu);
      }
      
      public function declineButBeFriends() : void
      {
         amilySprite();
         clearOutput();
         outputText("你想了想，然后摇了摇头。你告诉她，你确实很感激她的感情，但你不确定你们两个是否准备好做出同居所带来的承诺。此外，你的营地是为了守卫通往你世界的传送门而建立的；这使它成为恶魔的磁铁。你无法想象让她暴露在搬到营地会给她带来的危险中。[pg]");
         outputText("艾米莉看起来并不完全高兴，但你向她保证你会继续回来看她。当你取笑在你们各自的未来可能会有更多几窝的可能性时，隔着她破烂的裤子抚摸她的阴茎，她脸红了，但同意去。[pg]");
         doNext(playerMenu);
      }
      
      public function debugMenu(param1:Boolean = true) : void
      {
         get_game().debugMenu.debugCompEdit(saveContent,new SaveContent(null,null,null,null,null,null));
      }
      
      public function datesMenu() : void
      {
         var _g:AmilyScene;
         menu();
         addNextButton("森林",forestDate).hint("带她去野外走走。");
         if(get_player().get_gender() > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,43) == 1 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,346) == 0 && (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,12) >= 5 || urtaLove()) && !get_game().urtaQuest.urtaBusy())
         {
            addRowButton(2,"特尔阿德雷",dateNightFirstTime).hint("带艾米莉去约会见乌尔塔？");
         }
         _g = this;
         setExitButton("返回",function():void
         {
            _g.amilyMenu();
         });
      }
      
      public function dateNightFirstTime() : void
      {
         clearOutput();
         outputText("你让艾米莉坐下，问她愿不愿意和你一起去镇上[say:短途旅行]一下。[pg]");
         if(pregnancy.get_isPregnant())
         {
            outputText("[say:也许等我不怀孕了再说吧。我不想伤害到小宝宝们，]艾米莉回答道。");
            doNext(amilyFollowerEncounter);
            return;
         }
         outputText("[say:旅、旅行？]小鼠人结结巴巴地说，对你突如其来的邀请感到惊讶。[say:嗯，自从我们，你知道的……之后，我就没怎么出去过。]她突然眼睛一亮。[say:好啊，为什么不呢？应该会很有趣！不过我从来没去过特尔阿德雷。那里是什么样的？]你牵起艾米莉的手，一边准备你们的[say:约会]，一边开始向她讲述那个遥远而陌生的城市。等她准备好后，你们俩便向沙漠出发了。[pg]");
         outputText("这次去沙漠城市花的时间比平时长了一些。你今天得保护两个人，所以特意绕了远路，避开废土上的各种居民。不过，最终，特尔阿德雷那宏伟的城墙还是映入了眼帘，它那高耸的白墙与周围荒芜的沙漠形成了鲜明的对比。你走近城门，很高兴地看到你的狐狸情人乌尔塔正站在门旁，她的长戟和守卫制服很合身，尽管你还是能看到她的尾巴紧紧地缠绕在她那多出来的……包裹上。[pg]");
         outputText("[say:嘿，亲爱的，]当你走近城门时，乌尔塔高兴地说。然而，她的目光很快转移到了你身边的小鼠娘身上。乌尔塔困惑地皱了皱眉，随后恍然大悟的表情在她的脸上蔓延开来。[say:那么，[name]，呃……你的朋友是谁？][pg]");
         outputText("艾米莉微笑着，在这种尴尬的局面下尽可能地表现得友好，[say:嗨！我叫艾米莉——[name]的伴侣。]你轻轻捏了捏艾米莉的手，为她没有对乌尔塔随口说出的[say:亲爱的]一词反应过度而感到骄傲。[pg]");
         outputText("[say:哦，[his]……伴侣……]乌尔塔嘟囔着，听到这个承认显得有些沮丧。她那翠绿的眼眸因一个主意而亮了起来，同时一个调皮的笑容在她的" + (!amilyFurry() ? "脸" : "狐狸口鼻") + "上蔓延开来。没等她付诸行动，你就要求她让你们俩通过城门，打断了这只聪明狐狸计划的任何把戏。她拿出了曾经对你用过的腐化探测宝石，在艾米莉身上快速扫了一下。当宝石发出白光时，乌尔塔威严地点了点头，下令打开城门。[pg]");
         outputText("你和艾米莉踏上了特尔阿德雷的街道。城市狭窄的道路上挤满了人");
         if(get_game().time.hours >= 18)
         {
            outputText("尽管夜已深，但街上依然熙熙攘攘，半人马和犬人忙碌着，在漫长的一天工作后准备回家，或者前往湿身婊酒馆喝一杯放松一下。[pg]");
         }
         else if(get_game().time.hours < 6)
         {
            outputText("尽管时间还早，但街上依然熙熙攘攘，半人马和犬人正赶去进行黎明前的活动。");
         }
         else if(get_game().time.hours < 12)
         {
            outputText("尽管还是早晨，但街上依然忙碌，半人马和犬人正匆忙赶去处理自己的私事。");
         }
         else
         {
            outputText("半人马和犬人正忙着处理自己的事情。");
         }
         outputText("甚至在你们还没进城门之前，艾米莉似乎就被这座城市的景象迷住了。她睁大眼睛，顺着你的引导走在主街上，敬畏地看着形形色色的人从她身边走过。好几次，你不得不把她拉回来，因为她试图扑向一个毫无防备的鼠人，把那个可怜的家伙错认成了她多年前认识的人。[pg]");
         outputText("最终，你们的城市之旅来到了那个臭名昭著的酒馆——湿身婊酒馆。尽管夜已深，酒馆里却相对空旷，你们俩很容易就找到了一张桌子。你们的饮料很快就端上来了，为了表示感谢，艾米莉替你付了账。在接下来的一小时左右，你礼貌地听着鼠娘兴奋地讲述她所看到的一切，她对多年来第一次接触文明社会感到如此不知所措，以至于你担心她会晕过去。[pg]");
         outputText("然而，在艾米莉向你分享了两次她的兴奋之后，你们俩在喝酒时陷入了友好的沉默。艾米莉酒量很小，在你还没喝完第一大杯酒时，她就已经微醺了。当你看着这个鼠人开始走上短暂而陡峭的醉酒之路时，你惊讶地看到特尔阿德雷的守卫队长走进了酒馆。[pg]");
         outputText("乌尔塔迅速扫视了一下酒馆的大厅，看到了你，便大步走了过来。乌尔塔带着迷人的微笑，问她是否可以坐下。你试图委婉地解释你现在正在约会，但是");
         outputText("艾米莉打断了你的话，含糊不清地说她很想见见你的一些朋友。哦，这下可有好戏看了……[pg]");
         outputText("狐娘从相邻的桌子旁拉过一把椅子，反着坐下，重重地靠在椅背上。然而，还没等她除了简单的问候之外再说些什么，艾米莉就从");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,121) == 0)
         {
            outputText("一位路过的女服务员");
         }
         else
         {
            outputText("瓦拉扑腾着翅膀飞过，显得有些惊慌");
         }
         outputText("。[say: 给你，好东西，]艾米莉含糊不清地说着，把酒瓶塞给了有些惊讶的乌尔塔。[pg]");
         outputText("嗯，这下有意思了。如果你把两个女孩都灌醉，发生点什么性事可能很容易（或者说不可避免）。或者，你也可以现在就带艾米莉回家，确保你的两个爱人都不出什么意外。");
         menu();
         addButton(0,"喝酒",liqueurUpTheWaifus);
         addButton(1,"离开",amilyXUrtaRunAWAY);
      }
      
      public function corruptAmilysPussyGetsMotherfuckingFucked() : void
      {
         amilySprite(true);
         clearOutput();
         outputText("你告诉艾米莉你觉得很有趣，想玩点角色扮演；你让艾米莉扮演一个试图勾引你的恶魔。[say:但我绝对做不到，[master]，我唯一适合的角色就是做你忠实的奴隶！][pg]");
         outputText("你咧嘴一笑，告诉她至少应该试一试。艾米莉微笑着回答：[say:如果这是你想要的，[master]，我很乐意尝试，]在开始之前，你告诉艾米莉试着表现得像个真正的恶魔。[pg]");
         outputText("你让艾米莉张开双腿，开始脱衣服，一件一件地剥下你的[armor]。艾米莉甚至懒得和你说话；她只是高兴地咧嘴笑着，淫水已经开始从她大张的粉色小穴中流出。[pg]");
         if(pregnancy.get_event() >= 3)
         {
            outputText("她怀孕的状态并没有让她感到不安；事实上，她骄傲地挺起肚子，这是你对她统治的明显标志。");
         }
         outputText("她扑通一声倒在她的" + amilyButt() + "上，向后滚去，急切地张开双腿让你进入，并像饥饿的、摸索的四肢一样挥舞着它们，迫不及待地想要开始。你高兴地咧嘴笑着，但决定戏弄这个淫荡的" + (amilyFurry() ? "小鼠娘" : "魅魔") + "，停留在她" + (amilyFurry() ? "脚爪" : "匀称的脚") + "够不到的地方。[say:如果你想要，那就告诉我你有多想要，荡妇，]你嘲弄地戏弄她，抚摸着你的[cock]让它勃起。" + (amilyFurry() ? "小心脚跟，别敢伤了你的主人。" : ""));
         if(get_player().hasVagina())
         {
            outputText("你的另一只手探入你湿润的肉洞中寻找润滑液，以帮助你抚摸。");
         }
         outputText("[pg]");
         outputText("艾米莉甚至没有翻白眼，她就是这样一个对你无可救药的忠诚荡妇。[saystart]我想要，" + get_player().mf("master","mistress") + "！我比任何东西都想要！我是一个精液垃圾桶，一个生育机器——我饥渴的小穴需要精液，否则我就会枯萎！求求你，[master]，用你滚烫、咸腥、粘稠的精液填满我！!");
         if(!pregnancy.get_isPregnant())
         {
            outputText("我想让你用精液操满我，用种子让我膨胀，直到我变成一个只有头和四肢伸出来的精液皮球！我需要被生命的精华填满，变得圆润；把精液操进我体内，[master]！]!");
         }
         else
         {
            outputText("宝宝们需要精液，" + get_player().mf("Master","Mistress") + "。如果你不用你滚烫的造人汁液淹没她们的子宫，她们就不会长得强壮、健康、淫荡！求求你，为了她们，射精填满我好吗？");
         }
         outputText("[sayend][pg]");
         outputText("看到她真的是个如此急切的母狗，你很高兴。你走近一步，抓住她的臀部，然后用你的肉棒摩擦她的裂口，用她的淫水润滑它，进一步戏弄她。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,171) > 0)
         {
            outputText("她的蛋蛋确实碍事，但它们形成了一个很好的垫子，让你的[cock]在上面摩擦，进一步刺激你。");
         }
         outputText("艾米莉高兴地尖叫起来，用双腿缠住你的[hips]。她训练有素，不会用它们把你猛拉进她的胯下，但你能感觉到她腿上的肌肉在颤抖，渴望把你拉进合适的插入位置。你邪恶地笑了；虽然你很想深入她的深处，狠狠地操她，但你也想看看在她崩溃之前你能走多远……[say:" + get_player().mf("Master","Mistress") + "……求求你……你为什么要折磨自己？把自己交给你充满爱意的小老鼠荡妇吧；在我的双腿间迷失自己，让我饥渴的小穴吞下你的[cock]，像只有我能做到的那样榨干你。任何一个廉价的魅魔婊子都无法带给你我能带给你的快乐……]艾米莉恳求地呻吟着，她的尾巴翘起来抚摸你的" + get_player().assDescript() + "，她的双手玩弄着她的" + amilyTits() + "。[pg]");
         outputText("[saystart]你说折磨我自己？我想你是对的。也许我应该看看");
         if(get_game().jojoScene.isJojoCorrupted() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,80) == 0)
         {
            outputText("乔乔想不想玩，");
         }
         else
         {
            outputText("我找不到别人陪我玩了，");
         }
         outputText("[sayend]你假装漫不经心地说着，试图从她身边抽离。[say:不！]艾米莉尖叫着；她的双腿紧紧缠住你的腰，力度之大甚至让她自己双脚离地。她急切地想把自己牢牢贴在你的胯部，用她那流着淫液的小穴摩擦着你。[say:我的！我的肉棒！我的！]她愤愤不平地尖叫着。你看着自己把这只小老鼠奴隶逼到了什么地步，不禁笑出声来。你用[cock]摩擦着她的小穴，弯下腰粗暴地揉捏她的乳房，惹得她发出一声绝望的呻吟；你慢慢靠近她的耳朵，然后低语道：[say:来吧，]同时挺动下身进一步刺激她。[pg]");
         if(get_player().cockArea(0) >= 61)
         {
            outputText("她紧张得浑身发抖；有那么一瞬间，你以为她会感激地吻你。但紧接着，她想起了自己的身份，向后退去，她的尾巴笨拙地缠绕在你的" + get_player().cockDescript(0) + "上，拉扯着它，试图笨手笨脚地把它弄到位。当龟头擦过阴唇时，你能感觉到她多汁的小穴散发出的热量，但无论她怎么推，似乎就是进不去。她拼尽全力在你的" + get_player().cockDescript(0) + "上推挤摩擦，完全不顾自己是否会因此受伤。你决定在她做出不可挽回的事情之前阻止她。[say:请、请原谅我，" + get_player().mf("master","mistress") + "。这个荡妇没用的小穴配不上您光荣的" + get_player().cockDescript(0) + "，" + get_player().mf("master","mistress") + "。]你拍了拍她的头，告诉她也许有一天，她能把你全部吞下，但现在她应该慢慢来。你摩擦着她，尽可能地润滑你的[cock]，一点一点地撑开她。然后，费了一番功夫，你终于把一部分塞了进去。[say:看？这就是你把大肉棒塞进体内的办法，艾米莉，]你告诉她。[say:您真是太聪明了，[master]，]艾米莉评论道。你微笑着说：[say:现在回到你的角色里去，荡妇，]并在她的屁股上狠狠拍了一巴掌。[pg]");
         }
         else
         {
            outputText("她紧张得浑身发抖；有那么一瞬间，你以为她会感激地吻你。但紧接着，她想起了自己的身份，向后退去，她的尾巴笨拙地缠绕在你的[cock]上，拉扯着它，试图笨手笨脚地把它弄到位。当龟头擦过阴唇时，你能感觉到她多汁的小穴散发出的热量。几秒钟后，伴随着一声胜利的尖叫，她粗暴地将自己刺穿在你身上。你忍不住舒服地呻吟出声；尽管之前一直在挑逗，但你真的很需要这个。她的体内温暖湿润，正是你喜欢的样子。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,172) >= 5)
            {
               outputText("喷射而出的液体冲刷着你坚挺的肉棒前端溢出的任何先兆液体。");
            }
            outputText("你有一半的心思想要当场粗暴地对待这只小鼠娘；但现在你决定让艾米莉如愿以偿。这是她取悦你所应得的小小奖励。");
            outputText("[pg]");
         }
         outputText("艾米莉在你身上挺动、挣扎；拼尽全力想把自己刺穿在你身上。但在她目前的姿势下，她的尝试充其量只能算是笨拙。你对她未能好好服侍你感到失望，于是把她按在泥土上，痛苦地扭动她的一侧乳头，粗暴地抓住她的头发。[say:这还不够好，精盆。你有什么要为自己辩解的吗？]你平静但充满威胁地问她。[say:原谅我，" + get_player().mf("master","mistress") + "！但是这个毫无价值的荡妇不知道如何更好地取悦您……求您了！教教我怎么取悦您，[master]！]她乞求着你，听起来一点也不害怕你，也没有因为你的粗暴对待而感到痛苦；你在她眼中看到的只有欲望，以及想要取悦你、被你操的压倒性渴望……[pg]");
         outputText("你对她的回答咧嘴一笑。你会向她展示如何正确地取悦你……你松开她，抓住她丰满的大腿，把她的膝盖翻到头顶。艾米莉喘着粗气对你微笑；然后你开始用力地捣弄她，尽你最大的努力狠狠地操她；");
         if(get_player().balls > 0)
         {
            outputText("你的蛋蛋拍打着她的屁股，");
         }
         outputText("她的尾巴在你身后甩动。你咕哝着，喘着粗气；很快就接近了高潮。你的[cock]跳动着，漏出大量的先兆液体。[say:哦，是的，是的，是的！给我，[master]！这就是你的小荡妇应得的——狠狠地操她！好好地弄疼我，教训我这个坏女孩！]艾米莉在充满欲望的喜悦中尖叫着，像你操她一样用力地迎合着你。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) > 0)
         {
            outputText("她的" + amilyCock() + "像一把肉做的刀一样划破空气，因充血和快感而坚挺。");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,172) >= 5)
         {
            outputText("尽管她还没有达到高潮，但她的小穴已经在你的[cock]周围疯狂地冒泡起沫，导致你每次进出她湿润的深处时都会发出响亮的吧唧声和吸溜声。她就像一锅沸腾的性液，只等着喷涌而出。她需要的只是一点点鼓励。");
         }
         outputText("[pg]");
         outputText("你觉得是时候结束这一切了。伴随着最后一次凶狠的挺进，你让艾米莉稍微陷进了地板里，然后射了。你把她的肉壁一直涂抹到子宫，倾泻而出。即使是她的子宫颈也无法阻挡你释放的洪流。");
         if(pregnancy.get_isPregnant())
         {
            outputText("你想知道你未出生的孩子们是否会喜欢他们的洗澡水。他们的母亲显然很喜欢。");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,172) < 5)
         {
            outputText("她的体液湿漉漉地溢出你的胯部，用她的润滑液涂满了你的双腿之间。");
         }
         else
         {
            outputText("瀑布般的液体从她体内倾泻而出；如果你允许她骑在你身上，你会被她的淫水浸透的。");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) > 0)
         {
            outputText("没过多久——最多几秒钟——她那跳动、抽搐的肉棒终于爆发了，喷出一股又一股的扶她精液，溅满了她的乳房和脸庞，艾米莉急切地舔舐着。");
         }
         outputText("[pg]");
         outputText("你的高潮终于结束了。");
         if(get_player().cumQ() >= 1000)
         {
            if(!pregnancy.get_isPregnant())
            {
               outputText("艾米莉的子宫里灌满了精液，胀得就像怀了一窝随时准备出生的淫荡小老鼠一样。");
            }
            else
            {
               outputText("艾米莉的肚子看起来快要爆炸了；除了她怀着的那窝小老鼠，你还往她体内注入了足够喂养这些小鼠娘好几周的精液。");
            }
         }
         outputText("精疲力尽的你瘫倒在艾米莉身上。");
         if(get_player().hasVagina())
         {
            outputText("尽管在做爱时被冷落了，你的[vagina]还是流出了淫液，和艾米莉的体液一起滴落在地板上。");
         }
         outputText("艾米莉大口喘着气，满足地叹息着。她犹豫了一下，一只手大着胆子伸出来抚摸你的[face]。[saystart]嗯……你是我世界里的光，[master]。].");
         if(!pregnancy.get_isPregnant())
         {
            outputText("我只希望你已经让我怀上了，这样我就可以完成我被创造出来的使命了，");
         }
         else
         {
            outputText("我几乎希望自己没有怀孕，只是为了能享受知道你让我怀上时的那种快感，");
         }
         outputText("[sayend] 她轻声对你说。[pg]");
         outputText("你觉得你应该斥责她对你表现出的温柔。她是你的老鼠精盆玩具，不是你的爱人。但她确实把你伺候得很舒服；所以你决定这次就放过她。[pg]");
         outputText("等你喘过气来，你站起身，从艾米莉的怀抱中挣脱出来。她自己也站了起来，对刚才的举动感到有些尴尬。[say: 我让您满意了吗，" + get_player().mf("master","mistress") + "？] 她期待地等待着你的评判。你微笑着摸了摸她的头，告诉她是的；她确实让你很满意。你评价说她的演技还算不错。她微笑着回答，[say: 谢谢您，" + get_player().mf("master","mistress") + "。我喜欢我们这场小小的戏剧……我最喜欢的部分是当我像一只发情的母狗一样被当作肉便器使用的时候，] 她满怀爱意地说。你揉了揉她的头发，告诉她她还有工作要做。艾米莉喘了口气说，[say: 当然，请原谅我，[master]，]，然后她开始把你的[cock]舔干净。");
         if(get_player().hasVagina())
         {
            outputText("等她清理完你的肉棒，她开始舔你的大腿；确保你珍贵的体液一滴都不浪费。");
         }
         outputText("艾米莉完成任务后舔了舔嘴唇，充满爱意地抬头看着你。你摸了摸她的头，穿好衣服，然后留下这只小鼠娘自己待着。");
         amilyPreggoChance();
         get_player().orgasm("Generic");
         dynStats(DynStat.Sens(-2),DynStat.Cor(2));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function corruptAmilyYouDeclineMaxxingHerDick() : void
      {
         clearOutput();
         amilySprite();
         outputText("你决定让她保持原样。如果你想让她有一根更大的鸡巴，你随时可以给她更多的药水。你指示艾米莉练习使用她的新工具，以便在你需要她时随时准备好。[say: 是的，[master]，]她回答道。你把她留在地板上，去忙自己的事了。");
         doNext(playerMenu);
      }
      
      public function corruptAmilyScissorsLikeAPro() : void
      {
         amilySprite(true);
         clearOutput();
         outputText("你咧嘴一笑，一个有趣的想法浮现在脑海中；你命令艾米莉躺下并张开双腿；她照做了，你脱下衣服，轻轻地坐在她的双腿之间，将你的小穴与她的对齐，");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) > 0)
         {
            outputText("艾米莉的" + amilyCock() + "跳动着，");
         }
         outputText("当她明白你想做什么时，她笑了。[pg]");
         outputText("你仔细检查艾米莉的胯部，");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) > 0)
         {
            outputText("漫不经心地抚摸着她的" + amilyCock());
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,171) > 0)
            {
               outputText("和" + amilyBalls() + "，你把它们拨开，露出她的");
            }
            else
            {
               outputText("然后俯身靠近她的");
            }
         }
         else
         {
            outputText("注视着她的");
         }
         outputText("[vagina]。你抬起一只手，用手指抚摸着这个淫荡的小穴。没过多久，她就湿润了，准备好了，她的小阴蒂像肉棒一样坚挺地探出来");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) > 0)
         {
            outputText("简直就像是在试图与它上面的大兄弟比拼一样");
         }
         outputText("。你对艾米莉坏笑了一下，用沾满润滑液的手开始将她的汁液按摩进你自己的[vagina]里。[say: 荡妇，你喜欢我玩弄你的小穴吗？]你问她。[pg]");
         outputText("[say: 哦，主人……我喜欢做您的玩物，]艾米莉回答道，她那带有黑桃尖端的尾巴轻轻缠绕在你的[leg]上，挑逗着你的[vagina]。[say: 让我取悦您，让我崇拜您，让我服侍您，主人。]带着恶魔般的笑容，你沉下身子压在你的啮齿类性奴身上，用力捏了一把她的" + amilyTits() + "以示强调。[say: 那么，让我们看看你能做得多好。躺下，让我好好享受，荡妇。][pg]");
         outputText("艾米莉按照你的命令做了，在你的");
         if(get_player().balls > 0)
         {
            outputText(get_player().ballsDescriptLight());
         }
         else if(get_player().hasCock())
         {
            outputText(get_player().cockDescript(0));
         }
         else
         {
            outputText(get_player().clitDescript());
         }
         outputText("上轻轻弹了一下，她的尾巴松开并伸向她的嘴，这样她就可以吸吮尾巴尖了。[pg]");
         outputText("确保她的双腿大张，准备好迎接你");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) > 0)
         {
            outputText("并且她的肉棒");
         }
         outputText("被拨到一边");
         outputText("，你慢慢地将你的[vagina]压向艾米莉的。你不太确定当她是顺从的一方而你是主导的一方时，磨豆腐能有多爽……但你肯定能在这尝试中找到乐子！[pg]");
         outputText("艾米莉呻吟着");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,172) >= 5)
         {
            outputText("，一股温热的淫液喷溅在你的[vagina]上]");
         }
         outputText("；她的" + (amilyFurry() ? "爪子" : "脚") + "因快感而蜷缩，她开始喘息，渴望取悦你，并享受被这样使用。艾米莉看着你，用充满情欲的眼神等待着你的下一步动作或命令；你咧嘴一笑，想知道在她开始乞求释放之前，她能承受多少挑逗。你用自己的小穴轻轻摩擦艾米莉湿润的小穴，几乎没有接触，并小心翼翼地确保你的阴蒂戳到她的；艾米莉舒服地呻吟着，但你能看出这还不足以让她高潮。你继续轻轻地挑逗她，直到艾米莉说：[say:求求你，主人！我——我需要……我受不了了……啊！][pg]");
         outputText("看着这个淫荡的小魅魔鼠在你身下扭动挣扎真是太有趣了，但你有一个饥渴的小穴");
         if(get_player().hasCock())
         {
            outputText("和一根胀痛的[cock]");
         }
         outputText("需要满足，所以是时候来点重头戏了。[say:你需要，荡妇？那我需要的呢，嗯？如果我帮你高潮，你会让我对你为所欲为吗，嗯？]你挑逗她。艾米莉恍然大悟地喘着气说：[say:请原谅你毫无价值的性玩具，主人。当然，您的快乐是第一位的。我——我会随您的心意取悦您，如果您能原谅我，主人，我不会高潮的。][pg]");
         outputText("你给了她一个居高临下的微笑，然后轻轻拍了拍她的头。[say:乖，乖，我的小荡妇；没关系。毕竟，怎么能指望你想除了性以外的任何事情呢？那不是你被创造出来的目的——你是我的小性玩具。我把你变成这样就是为了操和被操；这就是你要做的。]你甜甜地笑了，然后终于把你的小穴压回她现在湿透的肉洞上。当你们的阴唇交织在一起时，发出吧唧吧唧的吸吮声，她的小阴蒂摩擦着你的[clit]，那种感觉让最令人愉悦的快感传遍你的阴唇。你狂野地笑着，开始挤压和抚摸她那对大老鼠奶子，感受着它们的重量，以及它们在柔软和坚挺之间那令人愉悦的抓握感，同时你开始前后摇摆。[pg]");
         outputText("[say:太感谢您了，主人！我喜欢做爱！我喜欢被操！我喜欢被使用！我喜欢做您的性玩具！我喜欢您的阴户贴着我的感觉！我爱您，主人！]艾米莉在一次高潮的冲击下尖叫起来。她用尽全力紧贴着你，双腿缠绕着你，" + (amilyFurry() ? "爪子" : "脚") + "因快感而蜷缩，双眼翻白。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,172) >= 5)
         {
            outputText("一股名副其实的淫液喷涌而出，溅在你的阴唇上，有些甚至流进了里面。");
         }
         else
         {
            outputText("湿润的吧唧声和啪嗒声在你周围回荡，这是艾米莉高潮的结果，淹没了你们之间仅存的一点空间。");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) > 0)
         {
            outputText("她的" + amilyCock() + "抽动着，精液溅在她的乳房和脸上。");
         }
         outputText("[pg]");
         outputText("你邪恶地笑着；这个曾经的清教徒" + (amilyFurry() ? "老鼠" : "") + "，现在变成了另一只发情的小野兽，你的发情小野兽。这种讽刺是如此美味……但不如她在你体内引发的感觉美味。你研磨、挺动、冲刺，粗暴地将你们的骨盆撞击在一起，渴望着摩擦，甚至对大量帮助你前后滑动的淫液感到有些不满。艾米莉在你猛烈攻击她时也在你身上研磨，既在享受她的高潮，也在努力取悦你。她的尾巴戳着你的[hips]，试图进入你们紧紧贴合的阴户之间；最终它成功了，它慢慢地滑进滑出，尾巴尖弹拨着你的阴蒂，提供额外的摩擦，让你越来越接近边缘。");
         if(get_player().hasCock())
         {
            outputText("艾米莉的双手伸出来抓住[eachcock]并开始为你手淫；这只堕落的魅魔鼠竭尽全力给你渴望的释放。");
         }
         outputText("[pg]");
         outputText("[say:对！好玩具——你很擅长这个！]你告诉她，脑子已经无法清晰思考。你能感觉到你的高潮即将来临，但从你嘴里出来的只有一声无言的快感嚎叫，狂喜在你的下体轰鸣并爆发，伴随着从你[vagina]喷涌而出的淫液风暴，达到了顶点]");
         if(get_player().wetness() >= 5)
         {
            outputText("，用你的体液浸透了艾米莉的身体，并在她身上留下了属于你的印记");
         }
         outputText("。[pg]");
         outputText("艾米莉瘫软下来，你的汁液继续滴落在她身上。她喘着粗气，用夹杂着欲望和爱慕的眼神看着你，然后跪下来说道：[say:谢谢你让这个毫无价值的精盆取悦你。]你只是对她笑了笑，然后伸手舀起一些积聚的淫液。你把它粗略地涂抹在" + (amilyFurry() ? "老鼠" : "魅魔") + "的" + (amilyFurry() ? "口鼻" : "脸") + "上。[say:永远不要忘记；你属于我，我的小玩具，]你对她说。然后，你心情大好，决定赐予她你的吻，舌头猛烈地探入，以强调艾米莉是你的。然后，你站起来，看到自己现在的状态，皱了皱眉。[say:把我清理干净，荡妇；我不想一整天都散发着淫液的味道，]你傲慢地命令她。[pg]");
         outputText("艾米莉高兴地笑了，[say:遵命，主人！]然后开始清理你，舔掉你身上每一滴汁液。最后，她舔干净了你[feet]上残留的汁液。你满意地挥手让艾米莉退下，然后走回营地，而艾米莉则将你们交媾的成果涂抹在自己的身体上。");
         get_player().orgasm("Generic");
         dynStats(DynStat.Sens(-1),DynStat.Cor(1));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function corruptAmilyOralSuckOff() : void
      {
         amilySprite();
         clearOutput();
         outputText("[say:过来给我舔，]你命令道。艾米莉毫不迟疑，立刻爬过来，亲昵地蹭着你的胯部");
         if(get_player().hasVagina())
         {
            outputText("；让你的汁液沾到了她的" + (amilyFurry() ? "口鼻" : "嘴唇") + "上");
            if(get_player().balls > 0)
            {
               outputText("和");
            }
         }
         else if(get_player().balls > 0)
         {
            outputText("；");
         }
         if(get_player().balls > 0)
         {
            outputText("用她的" + (amilyFurry() ? "毛发" : "肌肤") + "摩擦着你的蛋蛋");
         }
         outputText("。她把头在你的胯部蹭来蹭去，确保尽可能多地沾上你的体味；同时也让你更加兴奋。最后，当她完成时，她开始说道，[say: 感谢您允许这个毫无价值的贱货品尝您美妙的精华，我的" + get_player().mf("主人","女主人") + "。] 艾米莉在你的肉棒上轻轻舔了一下，然后继续说道，[say: 赞美伟大的玛莱，感谢您对这个淫荡的肉便器大发慈悲，允许我拥有并如此全心全意地侍奉我的[master]。阿门。]");
         outputText("说完，她咧嘴一笑，投入到她的任务中，粗暴地将你的肉棒尽可能多地塞进她的嘴里。");
         if(get_player().cockArea(0) > 61)
         {
            outputText("然而，即使是她也有极限。在某个时刻，艾米莉的喉咙再也容纳不下你更多了，你剩下的肉棒露在她的嘴外。然而，她决心要吞下你的全部；并不断尝试将你的肉棒往里推，直到你等得不耐烦，告诉她像个好荡妇一样开始套弄。她立刻照做了。");
         }
         outputText("[pg]");
         outputText("艾米莉的技术已经磨练得近乎完美。她熟悉你的[cock]，能够按摩到你阴茎上每一个敏感点。每次她上下套弄时，都会在你的肉棒上发出响亮的吸吮声，并用牙齿挑逗地刮擦；总是小心翼翼，以免弄伤她[master]最宝贵的部位。[pg]");
         outputText("没过多久，你就被逼到了高潮的边缘，但最后的爆发却迟迟没有到来。当你低头看时，你看到艾米莉正调皮地看着你。看起来她想玩……她想让你抓住她的头，好好地操她的脸。你邪恶地对她笑了笑，说道，[say: 很好，你这个聪明的小婊子。] 当你粗暴地抓住她的耳朵，开始给她渴望的操弄时，你看到艾米莉的眼睛里闪烁着幸福的光芒。你毫不在意可能会给她带来的痛苦，而且看起来她也不觉得痛。从她嘴里发出的只有幸福的呻吟和闷闷的愉悦尖叫；向世界宣告她有多么享受被你粗暴地操弄。如果说有什么的话，她似乎在想，像她这样的精盆被你虐待和使用是多么棒的一件事。[pg]");
         outputText("现在掌握了主动权，你很快感觉到你的");
         if(get_player().balls > 0)
         {
            outputText("蛋蛋在翻腾，你的");
         }
         outputText("[cock]最后一次跳动，然后说道，[say: 这是你的奖励，婊子。] 然后你在她的喉咙深处爆发了，这让她非常高兴。");
         if(get_player().cumQ() >= 1000)
         {
            outputText("她的肚子鼓了起来，并且没有停止膨胀，你精液的流动也没有减弱。对于艾米莉来说，这就是她人生的目标，作为你欲望的容器，像一个好的精液桶一样侍奉你，接受你注入她体内的每一滴精液。这个想法只会让你射得更猛。");
         }
         outputText("最后，精液的流动减弱了；艾米莉揉了揉她鼓胀的肚子，深吸了一口气，稍微向后退了一点。伴随着粗暴的抽插，她对着你的阴茎吹气；一阵快感传遍你的全身，又榨出了几股精液。现在完全筋疲力尽了，你向后退去；艾米莉试图用尽全力吸吮你的阴茎，把它留在嘴里，但这毫无用处。伴随着<b>啵</b>的一声，你把你的[cock]从艾米莉饥渴的下巴中拔了出来；它很干净，没有一丝精液的痕迹，也几乎没有口水。你看着艾米莉，她也看着你，开心地笑着，舔着嘴唇。[say: 感谢款待，[master]，] 她说道，然后打了个小嗝。你拍了拍她的头，穿好衣服，离开了艾米莉，对她的出色工作感到满意。");
         get_player().orgasm("Generic");
         dynStats(DynStat.Sens(1),DynStat.Cor(1));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function corruptAmilyLickPussiesLikeAPro() : void
      {
         amilySprite();
         clearOutput();
         outputText("[say: 该吃饭了，] 你宣布道，艾米莉听到后立刻精神起来。你脱下[armor]的下半部分，将胯部推向艾米莉；展示你迅速");
         if(get_player().hasCock())
         {
            outputText("勃起的" + Appearance.cockNoun(get_player().cocks[0].get_cockType()) + "和");
         }
         outputText("湿润的[vagina]。艾米莉像着了魔一样看着，口水从嘴里流出来，她期待地舔着嘴唇。[pg]");
         outputText("你拨开阴唇，");
         if(get_player().wetness() >= 5)
         {
            outputText("一股液体从你敏感的小穴中喷射而出。");
         }
         else
         {
            outputText("湿润了你的手指。");
         }
         outputText("你对着艾米莉咧嘴一笑，说道，[say: 你在等什么？] 艾米莉也咧嘴一笑，冲上前去，把鼻子埋进你的[vagina]里，尽可能多地吸入你的气味。[pg]");
         outputText("艾米莉" + (!amilyFurry() ? "的" : "冰冷的") + "鼻子让你感到一阵愉悦的战栗，为了奖励艾米莉的主动，你喷出了一小股淫液，粘在了她的鼻子上");
         if(get_player().hasCock())
         {
            outputText("，你的肉棒也精神抖擞地挺立起来");
            if(get_player().balls > 0)
            {
               outputText("和");
            }
         }
         if(get_player().balls > 0)
         {
            if(!get_player().hasCock())
            {
               outputText("，");
            }
            outputText("你的[balls]轻轻地搁在她的头顶，被她的小角托着");
         }
         outputText("。她把头往后仰，一根细细的淫液丝将她的鼻子和你的[vagina]连在了一起。艾米莉" + (amilyFurry() ? "舔了舔" : "擦了擦") + "她的鼻子" + (amilyFurry() ? "，把淫液全部舔干净" : "") + "，细细品味着淫液的味道，[say:太棒了，主人，真是太棒了，]艾米莉咧嘴一笑；然后她鞠了一躬，说道，[say:感谢您允许这个毫无价值的贱货品尝您美妙的精华，我的主人。]她快速地舔了一下你的阴蒂，继续说道，[say:赞美您，伟大的玛莱。感谢您对这个淫荡的肉便器大发慈悲，允许我如此全心全意地侍奉我的[master]。阿门。]说完，她舔了舔嘴唇，");
         if(get_player().balls > 0)
         {
            outputText("托起你的[balls]，将它们轻轻地放在她的头顶，");
         }
         outputText("然后她便埋头开始动作。[pg]");
         outputText("艾米莉兴奋地用唾液涂满你的阴唇，舔舐你[vagina]的周围；每隔一会儿，她就会停下动作，给你的");
         if(get_player().balls > 0)
         {
            outputText("蛋蛋");
         }
         else
         {
            outputText(get_player().clitDescript());
         }
         outputText("落下一个轻吻。你拍拍她的头，让她知道你对她的服侍很满意，但也催促她赶紧进入正题，好好地舔你。这个无声的命令并没有被忽视，艾米莉将她的舌头尽可能深地探入你的爱洞" + (amilyFurry() ? "；她的毛发令人愉悦地摩擦着你的阴唇" : ""));
         if(get_player().balls > 0)
         {
            outputText("，她的小角轻轻按摩着你的[balls]");
         }
         if(get_player().hasCock())
         {
            outputText("；[eachcock]跳动着，开始渗出前列腺液；它们汇聚成小股细流，顺着流到艾米莉的头上");
         }
         outputText("。这只" + (amilyFurry() ? "小鼠娘" : "魅魔") + "微微颤了一下，你几乎能想象出她在大快朵颐时咧嘴笑的样子。[pg]");
         outputText("你有些好奇，艾米莉到底是怎么练习舔穴技巧的——她真的很擅长这个，她对你体内的构造了如指掌，再加上她灵活的舌头，这意味着她能频繁地舔弄你的敏感点。每次她的舌头刷过你的G点，你都会用越来越多的淫液来奖励她。艾米莉保持着稳定的节奏，虽然这很舒服，但如果你想达到高潮，还需要更多的刺激；当你低下头想命令她认真点时，你看到她正用调皮的眼神看着你；你咯咯笑着说，[say: 原来你想这样是吧？聪明的小婊子。][pg]");
         outputText("你向后退去，把艾米莉推倒在地，她伴随着<b>砰</b>的一声重重摔在地上，却冲着你咧嘴一笑。你动作迅速，跨坐在艾米莉的脸上，开始把她老鼠般的" + (amilyFurry() ? "口鼻" : "鼻子") + "当成假阳具一样，在你的小穴上到处摩擦；她的舌头时不时探出来轻轻舔舐，增加你的快感。[pg]");
         if(get_player().vaginalCapacity() >= 45 && amilyFurry())
         {
            outputText("你咯咯笑着，决定更进一步；你把艾米莉的口鼻塞进你的[vagina]里；当艾米莉感觉到她的口鼻开始滑入你体内时，她惊讶得瞪大了眼睛，而你则发出一声长长的呻吟来表达你的愉悦，[say: 在你让我高潮之前，我可不会让你呼吸，荡妇。]说完，你开始在艾米莉的口鼻上起伏；她的舌头偶尔会探出来品尝你的肉壁，但大多数时候，你紧缩的阴道让她的嘴巴无法张开，所以艾米莉只好乖乖地像个合格的小精盆奴隶一样，用她的口鼻操弄你。[pg]");
         }
         else
         {
            outputText("你咯咯笑着，决定更进一步；你");
            if(amilyFurry())
            {
               outputText("紧紧捏住艾米莉的嘴，将她的口鼻按在你的");
            }
            else
            {
               outputText("把她的鼻子深深埋进你的");
            }
            outputText("[vagina]处，捂住她的" + (amilyFurry() ? "鼻子" : "嘴巴") + "；艾米莉惊讶地瞪大了眼睛，你发出一声长长的呻吟来表达你的愉悦，[say: 在你让我高潮之前，我是不会让你呼吸的，荡妇。] 说完，你开始在艾米莉的");
            outputText((amilyFurry() ? "鼠吻" : "脸") + "上摩擦自慰，一心想要让自己达到高潮，同时你能感觉到她的脸颊因为憋气和渴望而鼓了起来。[pg]");
         }
         outputText("艾米莉那相当绝望而急切的服侍非常有效，你感觉自己已经到了高潮的边缘。");
         if(get_player().vaginalCapacity() >= 45)
         {
            outputText("你把自己从艾米莉的" + (amilyFurry() ? "口鼻" : "脸") + "上拉开，深深地呻吟着。");
         }
         else
         {
            outputText("你放开艾米莉的" + (amilyFurry() ? "口鼻" : "脸") + "，深深地呻吟着。");
         }
         outputText("艾米莉大口喘着气，刚好接住了你喷了她一脸的淫液；她迅速用嘴封住你的[vagina]，以免漏掉更多你美味的汁液；而你也非常乐意尽可能多地喂她。艾米莉一直喝个不停，尽管不可避免地会有几滴漏出来，溅在她湿润的脸上。完事后，你站起身，低头看着你的杰作。[pg]");
         outputText("艾米莉咳嗽了几声，但还是尽可能多地收集你洒出的汁液，并舔干净手上的液体。等她平静下来，你看着她，似乎在等待着什么。[say: 哦！当然，请原谅我，主人，]艾米莉说着，迅速爬起来跪下，开始舔舐你的小穴和大腿，直到干净为止。等你满意了，你穿好衣服走开。[say: 主人！]艾米莉呼唤你；你转过身，看到这个面带微笑的堕落小鼠娘正揉着肚子，舔着嘴唇。[say: 谢谢您这顿美餐。][pg]");
         outputText("你轻笑一声，挥挥手让她退下。");
         get_player().orgasm("Generic");
         dynStats(DynStat.Sens(-1),DynStat.Cor(1));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function corruptAmilyGetsDickMaxxedOut() : void
      {
         clearOutput();
         amilySprite(true);
         var _loc1_:int = getMaxSize(13,15,23);
         if(get_player().isBiped() && get_player().lowerBody.type != 1)
         {
            outputText("你不满意；它需要更大。你把你的" + get_player().foot() + "放在她的鸡巴上开始套弄，从这只淫荡腐化的扶她老鼠口中引出更多愉悦的呻吟。你把她弄高潮了，乳白色的液体从她的鸡巴里流出来，打在她的胸前和脸上，但你没有停下来。她的鸡巴跳动着，溢出前列腺液，让你的动作更加顺畅。你用你的[foot]用力地套弄着她的鸡巴，希望它长得越来越大；每次她的鸡巴跳动和高潮时，它都会长得更大一点。[pg]");
            outputText("艾米莉已经全身沾满了她自己的精液，她的汁液在她身下汇聚成一滩，但你从未停止。你继续套弄，直到她再次高潮，她的鸡巴长得越来越大。最后，当最后一次高潮让它长到大约15英寸长，3英寸粗时，你用你的" + get_player().foot() + "压在她的龟头上，她最后一次高潮，把你的" + get_player().foot() + "涂满了精液。你命令她把它清理干净，向她展示你弄脏的[foot]。她顺从地开始舔舐脏污，在这个过程中品尝着自己的味道。清理干净后，你告诉她当你再次需要她的服务时会叫她，并且在她被叫到之前要练习使用她的新工具。[say: 是的……" + get_player().mf("主人","女主人") + "，]她疲惫地回答，喘息着。[pg]");
         }
         else
         {
            outputText("你不满意，它需要更大。你抓住她的鸡巴开始套弄，从这只淫荡腐化的扶她老鼠口中引出更多愉悦的呻吟。你把她弄高潮了；乳白色的液体从她的鸡巴里流出来，打在她的胸前和脸上，但你没有停下来。她的鸡巴跳动着，溢出前列腺液，让你的动作更加顺畅。你用力地套弄着她的鸡巴，希望它长得越来越大；每次她的鸡巴跳动和高潮时，它都会长得更大一点。[pg]");
            outputText("艾米莉已经全身沾满了她自己的精液，她的汁液在她身下汇聚成一滩，但你从未停止。你继续套弄，直到她再次高潮，她的鸡巴长得越来越大。最后，当最后一次高潮让它长到大约15英寸长，3英寸粗时，你用手粗暴地抓住她的龟头，她最后一次高潮，把你的手涂满了精液。[say: 把这个清理干净，]你命令她，向她展示你弄脏的双手。她顺从地开始舔舐脏污，在这个过程中品尝着自己的味道。你清理干净后，你告诉她当你再次需要她的服务时会叫她，并且在她被叫到之前要练习使用她的新工具。[say: 是的……" + get_player().mf("主人","女主人") + "，]她疲惫地回答，喘息着。[pg]");
         }
         outputText("你把她丢在一堆体液中，去忙自己的事了。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,45,_loc1_);
         FlagDict_Impl_.arrayWriteFloat(KFLAGS.flags,46,3);
         doNext(playerMenu);
      }
      
      public function corruptAmilyCampBonesPCWithHerCock() : void
      {
         amilySprite(true);
         clearOutput();
         outputText("你的目光落在艾米莉的肉棒上，一个想法在你的脑海中形成。你想知道艾米莉能多大程度地抵抗她自己的欲望……也许你现在应该测试一下；看看她是否真的是理想的性玩具，一个只为你的快乐而活、无论如何都会服从你命令的顺从精盆。[pg]");
         outputText("[say: 待着别动，不许碰自己，也不许动。] 你命令艾米莉，她急切地回答，[say: 是的，[master]！] 你继续看着艾米莉的肉棒，仔细欣赏你的杰作。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,171) > 0)
         {
            outputText("一对睾丸悬挂在艾米莉的肉棒下方；当你看着的时候，你隐约觉得她的睾丸变得更圆、更饱满了……...");
         }
         outputText("艾米莉的肉棒是");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) < 6)
         {
            outputText("小的");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) < 9)
         {
            outputText("中等的");
         }
         else
         {
            outputText("大的");
         }
         outputText("；你想知道艾米莉使用它的技术有多好。你轻轻地触摸她的肉棒，测试它的粗细，引得艾米莉发出一声无声的呜咽；随着她的肉棒微微跳动，一小滴前列腺液开始在顶端形成。你微笑着抓住艾米莉的肉棒，用拇指小心地挑逗她的龟头，感受着她肉棒的脉动；随着更多的血液流向她跳动的器官，艾米莉开始轻轻喘息；很明显你让她越来越兴奋了……你轻笑着看着艾米莉的眼睛，挑战她是否敢违抗你的命令。她以坚决和爱慕的眼神回望。你恶作剧般地笑了起来，握紧拳头，有节奏地握紧和松开艾米莉的肉棒，挤出更多的前列腺液，而艾米莉则喘息着，她的坚决和爱慕融化成了情欲和渴望。[pg]");
         outputText("[say:如果你敢违抗我的命令，我就会惩罚你，]你警告她，看着她在你的抚摸下扭动，你露出了微笑。[say:我……我不会的，[master]。]艾米莉回答道，语气中担忧多过决心。你能看出来，不需要太多的刺激就能让这只小鼠娘崩溃；不过看着她努力忍耐的样子应该会很有趣，所以你决定慢慢来。你用指尖轻轻地在艾米莉肉棒的下方滑动；她的臀部微微抬起，试图让你摸到更多的地方。你立刻斥责了她。[say:我告诉过你不要动。]艾米莉瑟缩了一下，强迫自己保持静止；她的身体开始出汗，随着你手指的每一次抚摸而颤抖；先头汁源源不断地流出；她的呼吸变得沉重");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,171) > 0)
         {
            outputText("，她的蛋蛋似乎也膨胀了起来");
         }
         outputText("。艾米莉呻吟着；就在她快要达到高潮的边缘时，你突然停了下来。艾米莉沮丧地呜咽着。[say:主……" + get_player().mf("主人","女主人") + "……求求您……]她喘息着乞求道。[pg]");
         outputText("你看着她，觉得很有趣，嘴角勾起一抹坏笑。[say:怎么了，艾米莉？你不会要违抗我吧？我可不想看到你违抗我……]你柔声说道。说话间，你抚摸着她的肉棒，用拇指指腹轻轻描摹着龟头，手指在她的肉棒上上下下地挑逗着。[say:我不想惩罚你，]你告诉她。[say:让你受苦，我也会心痛，但这都是为了你好……]你坏笑着补充道，[say:顺便说一句，你也不准高潮。]艾米莉绝望地看着你；而你则在一旁饶有兴致地看着。艾米莉的呼吸变得稍微平稳了一些，你知道她已经不再处于爆发的边缘了。这可一点都不好玩……你轻轻地在她的鸡巴上吹了一口气，微风的轻抚和那令人舒缓的凉意让艾米莉浑身一颤。瞬间，她的鸡巴开始跳动，青筋暴起，仿佛要爆裂开来；她的肉棒变得如此坚硬，你几乎确信艾米莉会当场射出来；不知怎么的，她设法忍住了，但你可以看出她现在比刚才更接近高潮了。你忍不住发出一声轻笑。[pg]");
         outputText("[say:可怜的小母狗……你真的是为了性而活的，不是吗？]你嘲弄着她，用手指抹起一滴滑落的先头汁，慢慢地将它送入你的" + get_player().vaginaDescript() + "中。艾米莉注视着它进入的每一个细节。终于，伴随着一声呻吟和近乎野兽般的尖叫，艾米莉失去了理智，向你扑了过来。当你重重地摔在地上时，你正准备开口训斥她，但只要看一眼她的眼睛，你就明白她已经失去了理智——她现在脑子里唯一的念头就是操和配种。艾米莉在你身上咆哮着，语无伦次，眼中燃烧着无法满足的欲望，以及比生命更重要的、操和配种的渴望。她的鸡巴像铁棍一样坚硬，重重地拍打在你的肚子上，她被欲望冲昏了头脑，笨拙地调整着姿势，试图瞄准。她笨拙地在你的[vagina]唇上戳刺着，然后，终于找准了位置，毫不犹豫地伴随着一声嚎叫向前挺进，将自己深深地刺入你的体内，直没至根。");
         get_player().cuntChange(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) * FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,46),true,true,false);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) * FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,46) > get_player().vaginalCapacity())
         {
            outputText("你对她粗暴的插入发出一声低吼，艾米莉毫不顾忌你的感受，将你撑开；之后你绝对要为此惩罚她……...");
         }
         outputText("[pg]");
         outputText("艾米莉被你[vagina]的感觉所淹没，立刻被欲望冲昏了头脑。她一言不发，只是发出咕哝和咆哮声，尽其所能地快速而用力地在你体内抽插。你们之间除了肉体摩擦的感觉之外，什么都没有");
         if(get_player().wetness() >= 5)
         {
            outputText("，你的淫液发出咕叽咕叽的声响，她将它涂抹在自己身上，并让它溅落到你身下的地面上");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,171) > 0)
         {
            outputText("以及她的蛋蛋拍打在你的" + get_player().assDescript() + "上发出的肉体碰撞声");
         }
         outputText("。[pg]");
         outputText("你考虑过阻止艾米莉，并因为她是一个不听话的发情荡妇而扇她耳光，但她绝望而笨拙的抽插确实给你带来了一些快感；此外，她现在已经听不进你的话了。她完全被欲望控制了；你呻吟着笑了起来。你觉得她的绝望很可爱；把你的精液桶小老鼠变成一个只知道交配的无脑动物是多么容易……哦！她顶到了一个敏感点！[pg]");
         outputText("也许艾米莉并没有完全迷失在自己的需求中；当你对她顶到某个特定部位做出反应时，她停顿了一下，然后又开始抽插，依然像以前一样用力而狂野，但现在她专门瞄准那个部位，在她的状态允许的范围内，尽可能地让你感到舒服。你能感觉到一团团的先头汁开始喷涌而出，涌入你的深处——你觉得她坚持不了多久了。艾米莉疯狂的抽插速度明显慢了下来，她每一次抽插都伴随着用力的呻吟。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,171) > 0)
         {
            outputText("她的蛋蛋拍打在你屁股上的声音在你周围回荡。");
         }
         outputText("湿润的小穴摩擦鸡巴发出的咕叽声越来越大，预示着最终爆发性高潮的到来。伴随着近乎尖叫的呻吟，艾米莉在你体内爆发了；她尽其所能地深深插入，将她的老鼠精液射入你的子宫。[pg]");
         outputText("艾米莉瘫倒在你身上，喘着粗气，大汗淋漓；你漫不经心地说，[say:就这？先是未经允许就操了我，现在居然敢不让我满足？]艾米莉倒吸了一口凉气，迅速从你体内抽出；她跪在地上，尽可能地低下头，嘴里嘟囔着一连串的道歉。[say:求求您，女主人，原谅这个不配的荡妇吧。我发誓只侍奉您一个人，但我却胆敢只顾自己享乐，而没有让您满足。]你站起身，坐在她身上，用你的一只[feet]把她的头按在地板上，让她闭嘴。[say:闭嘴，婊子，我正在想该怎么处置你。]你一边想着合适的惩罚，一边抚摸着自己，淫水和精液慢慢地滴落在艾米莉身上。你突然有了一个主意，但首先你必须解决自己的需求……你站起身，坐在附近的一块石头上，张开双腿，命令艾米莉。[say:起来，荡妇。首先你要让我满足，然后我再惩罚你。现在用你的那根" + amilyCock() + "来服侍我。][pg]");
         outputText("[say:遵命，女主人，]艾米莉庄重地说着，站起身向你走来；她的鸡巴依然勃起着，上面沾满了你的淫水。她轻松地插入了你，引得你们俩都发出了一声呻吟，然后开始操你；艾米莉小心翼翼地刺激着你，注意着那些能给你带来最大快感的部位。没过多久，你就高潮了。你的肉壁紧紧地夹住艾米莉的肉棒，榨取着它，而这只老鼠荡妇则呻吟着，再次射在了你的体内。");
         if(get_player().wetness() >= 5)
         {
            outputText("你喷射出的淫水冲刷着艾米莉射在你体内的精液，将它们从她的鸡巴周围推了出去，把艾米莉的下半身涂满了淫水和精液。");
         }
         outputText("艾米莉慢慢地退了出来，她的鸡巴终于开始缩小，她顺从地跪在你面前；因为之前的冲动而羞愧内疚地低着头。[pg]");
         outputText("[say:给我拿根绳子来。]你命令她；艾米莉迅速起身跑开，手里拿着一根绳子回来了。[say:现在跪下，]你再次命令她。她照你说的做了，耐心地等待着她的惩罚。");
         if(get_player().isBiped())
         {
            outputText("你开始用[foot]抚摸她疲软的阴茎，");
         }
         else
         {
            outputText("你俯下身，开始用手抚摸她疲软的阴茎，");
         }
         outputText("慢慢地哄它再次勃起。艾米莉呻吟着，你迅速命令道，[say:安静！]这只发情的母老鼠紧紧闭上嘴，试图抑制住呻吟；但她还是忍不住发出了几声闷哼。等她的肉棒完全勃起并跳动时，你迅速用绳子绕住它并绑紧，确保它还能勃起一段时间。[say:荡妇，在你的肉棒自己软下去之前，不准碰它。如果你这次再敢违抗我，我保证会有更严厉的惩罚等着你，]你带着一丝怒意说道。[say:是的，[master]。我保证这个愚蠢的婊子不会再犯同样的错误了。][pg]");
         outputText("[say:很好，现在把我清理干净，]你命令她，展示出你那滴着交媾后液体的阴部。艾米莉熟练地舔舐着，尽可能地清理掉所有的精液和淫水；等她完事时，她的脸上沾满了精液和淫水，而你的下体却异常干净。[say:干得好，婊子，]你夸奖她；艾米莉的尾巴翘了起来，开心地笑着摇晃着。满足之后，你穿好衣服去忙你的事了，留下艾米莉挺着一根坚挺的肉棒。你怀疑艾米莉是否因为缺乏自制力而让你怀孕了。");
         if(get_player().hasCock())
         {
            outputText("如果她真的这么做了，你可能得回敬她一下……...");
         }
         else
         {
            outputText("如果她真的这么做了，你就只能把她绑起来，找个人来回敬她了……...");
         }
         get_player().knockUp(4,350);
         get_player().orgasm("Generic");
         dynStats(DynStat.Sens(-2),DynStat.Cor(2));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function corruptAmilyBuckFutter() : void
      {
         amilySprite(true);
         clearOutput();
         outputText("你命令艾米莉趴在地上；你想操她的屁股。艾米莉的眼睛里闪烁着快乐的光芒，她兴奋地回答：[say:是的，[master]！]她迅速转过身，摆好姿势；她丰满的屁股诱人地摇晃着，尾巴竖起，方便你进入。她对被你操屁股的兴奋之情，从她腿上流下的淫水就可见一斑");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) > 0)
         {
            outputText("；她的" + amilyCock() + "直立着，跳动时顶端形成了一小滴预精");
         }
         outputText("[pg]");
         outputText("你脱下衣服，将勃起的" + get_player().cockDescript(0) + "压在艾米莉的股沟上，在她的屁股上摩擦着你的肉棒，享受着她柔软而紧致的屁股带来的触感；预精开始形成并顺着你的" + get_player().cockDescript(0) + "滑落，你命令艾米莉：[say:为我做好准备。]艾米莉默默地顺从着，直到她那铲状的尾巴刺入她的阴部，这只兴奋的小鼠娘用尾巴操了自己一会儿，发出一声呻吟，然后拔出了沾满淫水的尾巴。你拉开距离让她方便动作，她用湿滑的尾巴尖在她的肛门上摩擦，为你润滑；然后她用仍然湿润的铲状尾巴摩擦你的" + get_player().cockDescript(0) + "，在润滑的同时按摩你的肉棒。[say:够了，]你说；她的尾巴立刻松开了你的[cock]，回到了直立的位置。[pg]");
         outputText("你将龟头抵在艾米莉跳动的肛门上，伴随着一声低吼，推了进去。艾米莉淫荡地呻吟着，被插入屁股的疼痛完全被快感所掩盖。[say:是……" + get_player().mf("主人","女主人") + "，操你这只发情老鼠的屁股！操我，直到我的屁股被撑开。哦！[master]，我喜欢做你的性玩具！]当你填满她的身体时，艾米莉尖叫着赞美道。[pg]");
         if(get_player().cockArea(0) >= 61)
         {
            outputText("你尽可能地把肉棒插进去；直到你推艾米莉时只能让她摇晃，而你的肉棒却无法再深入。艾米莉绝望地" + (amilyFurry() ? "吱吱叫着" : "尖叫着") + "。[say:不，不，不！我想要" + get_player().mf("主人","女主人") + "的全部。求你了，[master]！再用力点！]艾米莉说着，用她的" + (amilyFurry() ? "爪子" : "手") + "抓住地板，自己也向后推。但无论你怎么努力，你都无法再把你的[cock]插得更深了。");
         }
         else
         {
            outputText("你用力推，直到你的臀部贴上她柔软的屁股");
            if(get_player().balls > 0)
            {
               outputText("你的[balls]拍打着她的阴部，导致她的淫水喷得它们到处都是。");
            }
            else
            {
               outputText("然后抽出来，再猛烈地插进去。她的淫水喷了你一身。");
            }
         }
         outputText("[pg]");
         outputText("到达极限后，你毫不浪费时间，开始粗暴地操这只发情小鼠娘的屁股；你[cock]的每一次有力的抽插和跳动，都引来她快乐的呻吟和尖叫。艾米莉毫不掩饰地向世界宣告她很享受自己的处境；你每一次挺进她都向后迎合，你每一次抽出她都向后拉扯。在如此粗暴的操弄下，你毫不怀疑她的屁股会酸痛一段时间；但她似乎并不在乎……取悦她的[master]更重要……此外，这种行为带来的痛苦对这只堕落的小鼠娘来说就是快乐。[pg]");
         outputText("你粗暴地拍打她的屁股，让它颤动起来，并大喊：[say:紧一点！]艾米莉顺从地用她的臀部肌肉尽可能紧地收缩你的[cock]。作为回应，你加快了抽插的节奏。淫荡的拍打声完成了这幅色情的画面，你感觉到你的");
         if(get_player().balls > 0)
         {
            outputText("蛋蛋在翻腾，你的");
         }
         outputText("[cock]跳动并紧绷。你最后一次用力挺进，而艾米莉则向后退去，用尽全力将自己刺穿；在最后一声变态的<b>啪</b>声中，你将精液射入了小鼠娘的肠道深处。[pg]");
         if(get_player().cumQ() >= 750)
         {
            outputText("她的肚子开始充盈膨胀，甚至在她看起来像怀孕六个月时也没有停止。她的屁股紧紧夹着你，试图阻止你仍在注入的巨量精液流出，但不可避免地，还是有几股微弱的精液从你的[cock]周围溢了出来。");
         }
         outputText("你用力猛插了几下，射出最后几股精液，然后从艾米莉的屁股里拔了出来。");
         if(get_player().cumQ() >= 1000)
         {
            outputText("一股精液从她的屁股里倒流喷出，随后她用手堵住自己，试图把所有的东西都憋在里面。");
         }
         else
         {
            outputText("一些精液开始从她的屁股里漏出来，随后她用手堵住了自己。");
         }
         outputText("[pg]");
         outputText("[say: 完成你的工作，]你命令这只疲惫的小鼠娘。她转过身来");
         if(get_player().cumQ() >= 750)
         {
            outputText("沉重的肚子和乳房一起晃动着，");
         }
         else
         {
            outputText("乳房晃动着，");
         }
         outputText("看着你依然勃起的[cock]；一些精液还在从上面漏出。她舔了舔嘴唇，一点点向你挪来，依然紧紧捂着屁股；她开始舔掉你[cock]上残留的精液]");
         if(get_player().balls > 0)
         {
            outputText("以及你蛋蛋上沾染的她的淫液");
         }
         outputText("；直到把你舔得干干净净才停下。你摸了摸她的头并夸奖她，[say: 真是个乖巧的肉便器。]她疲惫地笑着回应，依然有些喘息，开心地摇晃着尾巴。你把鸡巴上残留的唾液抹在她的脸上，然后穿好衣服。[say: 一滴也别浪费，骚货，]你对她说道。你留下这只疲惫的老鼠独自平复心情。");
         get_player().orgasm("Generic");
         dynStats(DynStat.Sens(-2),DynStat.Cor(1));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function cookAmilyASnack() : void
      {
         var _loc1_:* = null as IMap;
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,169) > 0)
         {
            if(!(get_player().hasItem(get_consumables().L_DRAFT) || get_player().hasItem(get_consumables().F_DRAFT)) || !get_player().hasItem(get_consumables().GOB_ALE))
            {
               outputText("你想去废弃村庄，但你没有材料来制作更多艾米莉的药。你回到了营地。");
               doNext(get_camp().returnToCampUseOneHour);
               return;
            }
            if(get_player().get_gender() == 0)
            {
               outputText("你想去废弃村庄，但如果没有阴茎或阴道，你就无法完成混合物。你回到了营地。");
               doNext(get_camp().returnToCampUseOneHour);
               return;
            }
            outputText("你拿起一个碗，小心翼翼地将催情剂和地精麦酒倒进去，然后拿出一根树枝开始搅拌，直到它们混合在一起。接着你用手指蘸了一点尝了尝；");
            if(get_player().hasCock())
            {
               outputText("[eachcock] 猛地立正");
               if(get_player().hasVagina())
               {
                  outputText("并且");
               }
            }
            if(get_player().hasVagina())
            {
               outputText("你的 [vagina] 湿润了起来");
            }
            outputText("为下一步做准备。[pg]");
            if(get_player().hasCock())
            {
               outputText("艾米莉毫不费力地应付着从你小穴里不断喷出的淫液，事实上，她竭尽全力确保你能尽可能多地射进她饥渴的嘴里；你很高兴地发现，哪怕是一小滴也没有逃过她四处搜寻的舌头和贪婪吮吸的嘴巴。");
               if(get_player().hasVagina())
               {
                  outputText("还没完全满足，你决定在混合物里加点“女人味”的东西也无妨……...");
               }
               outputText("[pg]");
            }
            if(get_player().hasVagina())
            {
               outputText("你开始用力揉搓你的 " + get_player().vaginaDescript(0) + "，捏着阴蒂，淫水滴得满地都是。每次有新的体液从你的 [vagina] 涌出，你都会想象和艾米莉在一起会有多开心。你会让她一次又一次地舔你，直到你晕过去；也许你甚至能让她长出一根鸡巴，这样你们俩就能有更多乐趣；毕竟，她总是喋喋不休地说她想要宝宝，嗯，她不一定非得是怀孕的那个，对吧？你想象着被艾米莉搞大肚子的情景；你的肚子因为怀了小老鼠而变大，而艾米莉则沦为一滩只会交配和繁殖的烂泥；除了乞求你好好操她之外，什么也做不了。光是想象这些就足以把你推向高潮，你的汁液喷洒在你下方的地上。感觉太爽了，你几乎忘了你一开始为什么要自慰。你蹲在碗上方，开始捏揉和按摩你的阴蒂，试图专门为艾米莉挤出最后一股淫水；你憋着，打算让这最后的高潮格外愉悦、格外持久。终于，你感觉它来了；你低下头，正好看到你的体液溅入碗中；浓重的性爱麝香弥漫在你周围的空气中，延长了你的高潮，并导致碗里的液体溢出。当最后一点体液落入碗中并溢出时，你呻吟出声。[pg]");
            }
            outputText("休息了几分钟后，你看了看碗里；混合物变成了粉白色，并发出不祥的咕噜声。你拿出一个空瓶子，尽可能多地装满混合物，然后塞上软木塞，放回你的 [inv] 里。现在你所要做的就是找到艾米莉……你邪恶地笑着，走回营地。");
            if(get_player().hasItem(get_consumables().L_DRAFT))
            {
               get_player().consumeItem(get_consumables().L_DRAFT);
            }
            else
            {
               get_player().consumeItem(get_consumables().F_DRAFT);
            }
            get_player().consumeItem(get_consumables().GOB_ALE);
            get_player().createKeyItem("Potent Mixture",0,0,0,0);
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,169,FlagDict_Impl_.arrayReadInt(_loc1_,169) + 1);
         }
         else
         {
            if(!(get_player().hasItem(get_consumables().L_DRAFT) || get_player().hasItem(get_consumables().F_DRAFT)) || !get_player().hasItem(get_consumables().GOB_ALE))
            {
               outputText("你想去废弃村庄，但决定最好等到你有了计划再行动（也许需要一些催情剂和地精麦酒来启动计划）……你回到了营地。");
               doNext(get_camp().returnToCampUseOneHour);
               return;
            }
            if(get_player().get_gender() == 0)
            {
               outputText("你想去废弃村庄，但还是决定折返；现在，你还没有合适的“部件”来完成这项工作，所以你回到了营地。[pg]");
               doNext(get_camp().returnToCampUseOneHour);
               return;
            }
            amilySprite(true);
            outputText("你拿起一个碗，小心翼翼地将");
            if(get_player().hasItem(get_consumables().L_DRAFT))
            {
               outputText("催情剂");
            }
            else
            {
               outputText("强效催情剂");
            }
            outputText("和地精麦酒倒进去，然后你拿出一根树枝，开始搅拌，直到它们混合在一起。你慢慢地用手指蘸了一下，试探性地舔了一口；你几乎被那强烈的味道击倒，你的");
            if(get_player().hasCock())
            {
               outputText("[cock]立刻挺立起来");
            }
            if(get_player().hasCock() && get_player().hasVagina())
            {
               outputText("，而且你的");
            }
            if(get_player().hasVagina())
            {
               outputText("[vagina]几乎要喷出水来");
            }
            outputText("。你邪恶地笑了；毫无疑问，这种混合物会让那个愚蠢的婊子张开双腿，乞求你狠狠地操她；但你觉得似乎还缺少点什么……[pg]");
            outputText("当你思考还缺什么的时候，你的手不自觉地向下移动，抚摸着你的");
            if(get_player().hasCock())
            {
               outputText(get_player().cockDescript(0));
            }
            if(get_player().hasCock() && get_player().hasVagina())
            {
               outputText("和");
            }
            if(get_player().hasVagina())
            {
               outputText(get_player().vaginaDescript());
            }
            outputText("；然后你恍然大悟。当然！你怎么能忘记在混合物里加点“特制酱料”呢……？[pg]");
            if(get_player().hasCock())
            {
               outputText("艾米莉毫不费力地应付着从你小穴里不断喷出的淫液，事实上，她竭尽全力确保你能尽可能多地射进她饥渴的嘴里；你很高兴地发现，哪怕是一小滴也没有逃过她四处搜寻的舌头和贪婪吮吸的嘴巴。");
               if(get_player().hasVagina())
               {
                  outputText("还没完全满足，你决定在混合物里加点“女人味”的东西也无妨……...");
               }
               outputText("[pg]");
            }
            if(get_player().hasVagina())
            {
               outputText("你开始用力地抚摸你的" + get_player().vaginaDescript() + "，捏着你的阴蒂，淫水滴得满地都是。每次有新的液体从你的[vagina]涌出，你都会想到你会和艾米莉玩得多开心。你会让她一次又一次地舔你，直到你晕过去；也许你甚至能让她长出一根鸡巴，这样你们俩就能玩得更开心了；毕竟，她总是喋喋不休地说她想要孩子，嗯，她不一定非得是生孩子的那个人，不是吗？你想象着被艾米莉搞大肚子的情景；你的肚子因为怀着小老鼠而变大，而艾米莉则变成了一堆只知道交配和繁殖的肉块；除了乞求你狠狠地操她之外，什么也做不了。光是想象这个就足以让你达到高潮，你的淫液喷洒在你下方的地上。感觉太好了，你几乎忘记了你一开始为什么要自慰。你蹲在碗上方，开始捏揉和按摩你的阴蒂，试图专门为艾米莉挤出最后一次高潮的淫水；你憋着，打算让这最后一次高潮特别爽、特别长。最后你感觉到了；你低头一看，正好看到你的液体溅入碗中；浓重的性爱麝香弥漫在你周围的空气中，延长了你的高潮，导致碗里的液体溢出。当你的最后一滴液体落入碗中并溢出时，你呻吟着。[pg]");
            }
            outputText("休息了几分钟后，你看了看碗里；混合物变成了粉白色，并发出不祥的冒泡声。你拿出一个空瓶子，尽可能多地装满混合物，然后塞上软木塞，把它放回你的[inv]里。现在你要做的就是找到艾米莉……你邪恶地笑着，回到了营地。[pg]");
            if(get_player().hasItem(get_consumables().L_DRAFT))
            {
               get_player().consumeItem(get_consumables().L_DRAFT);
            }
            else
            {
               get_player().consumeItem(get_consumables().F_DRAFT);
            }
            get_player().consumeItem(get_consumables().GOB_ALE);
            get_player().createKeyItem("Potent Mixture",0,0,0,0);
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,169,FlagDict_Impl_.arrayReadInt(_loc1_,169) + 1);
         }
         get_player().orgasm("Generic");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function continueWithMoreMidLevelAmilySex() : void
      {
         dynStats(DynStat.Lust(5));
         amilySprite();
         outputText("当你们俩都赤身裸体时，你们拥抱在一起，开始深情地接吻。你们慢慢地倒下，开始探索彼此的身体。你感觉到艾米莉的手在抚摸你，而你则轻轻地亲吻她的乳房，你的一只手慢慢滑向她可爱的屁股，轻轻地揉捏着。看着她的眼睛，你看到里面闪烁着光芒，接着她出人意料地设法把你翻转过来，让你平躺着。现在她坐在你的肚子上，用她那相当灵活的尾巴抚弄着你已经坚挺的肉棒。她对你咧嘴一笑，似乎打算尽可能久地挑逗你，然后再让你进入她。[pg]");
         menu();
         addButton(0,"配合她",playAlongWithAmilyWhataDumbBitch);
         addButton(1,"取悦她",workToPleaseTheCunt);
      }
      
      public function continueAmilySmex() : void
      {
         var _loc1_:int = get_player().cockThatFits(61);
         amilySprite(true);
         get_images().showImage("amily-forest-plainfuck");
         outputText("对你们俩来说，时机再合适不过了，你们双双倒在艾米莉准备好的铺盖上。并排躺着，艾米莉以惊人的效率引导你进入她的体内，然后，一旦你舒服地待在里面，她就开始抽插，她的小穴像老虎钳一样紧紧夹住你的" + get_player().cockDescript(_loc1_) + "。[pg]");
         outputText("但天下没有不散的筵席，很快你们俩都达到了共同的高潮。一旦你恢复了体力，你们就不再拥抱，开始穿衣服，准备再次各奔东西。不过，在门口，艾米莉拦住了你。[pg]");
         outputText("[say:谢谢你，那感觉……很好……]小鼠娘红着脸说。[say:也许……我们可以……再来一次？][pg]");
         outputText("她似乎对自己居然很享受（至少有一点）感到惊讶，但她绝对愿意再次体验。你向她保证你会回来的，然后继续你的旅程。");
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,42,FlagDict_Impl_.arrayReadInt(_loc2_,42) + 1);
         amilyPreggoChance();
         _loc2_ = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,38,FlagDict_Impl_.arrayReadInt(_loc2_,38) + (1 + Utils.rand(2)));
         get_player().orgasm("Generic");
         dynStats(DynStat.Sens(-1));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function conquerThatMouseBitch() : void
      {
         amilySprite();
         clearOutput();
         if(get_monster().get_HP() < 1)
         {
            outputText("艾米莉倒在地上，失去了知觉。你把小鼠娘拖到她藏身处的一个空地上。你微笑着脱下她的衣服，然后找了根绳子把她绑起来。你把她的双手绑在一起，然后再把她的双手和脚踝绑在一起，确保她无法反抗。之后，你处理掉了任何可以作为武器或帮助她逃跑的东西，然后坐在附近的一张凳子上，等待她恢复意识。毕竟，如果她醒着看到你要对她做的一切，那会更有趣……[pg]");
         }
         else
         {
            outputText("艾米莉扔下刀，开始认真地自慰，饥渴得无法战斗。你走到她面前，捡起她的一根飞镖刺向她，把她打晕。你把小鼠娘拖到她藏身处的一个空地上。你微笑着脱下她的衣服，然后找了根绳子把她绑起来。你把她的双手绑在一起，然后再把她的双手和脚踝绑在一起，确保她无法反抗。之后，你处理掉了任何可以作为武器或帮助她逃跑的东西，然后坐在附近的一张凳子上，等待她恢复意识。毕竟，如果她醒着看到你要对她做的一切，那会更有趣……[pg]");
         }
         chooseYourAmilyRape();
      }
      
      public function chooseYourAmilyRape() : void
      {
         amilySprite(true);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,170) == 0)
         {
            doNext(rapeCorruptAmily1);
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,170) == 1)
         {
            if(get_player().get_gender() == 1)
            {
               doNext(rapeCorruptAmily2Male);
            }
            else if(get_player().get_gender() == 2)
            {
               doNext(rapeCorruptAmily2Female);
            }
            else if(get_player().get_gender() == 3)
            {
               menu();
               addButton(0,"侧重男性",rapeCorruptAmily2Male);
               addButton(1,"侧重女性",rapeCorruptAmily2Female);
            }
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,170) == 2)
         {
            if(get_player().get_gender() == 1)
            {
               doNext(rapeCorruptAmily3Male);
            }
            else if(get_player().get_gender() == 2)
            {
               doNext(rapeCorruptAmily3Female);
            }
            else if(get_player().get_gender() == 3)
            {
               menu();
               addButton(0,"侧重男性",rapeCorruptAmily3Male);
               addButton(1,"侧重女性",rapeCorruptAmily3Female);
            }
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,170) == 3)
         {
            doNext(rapeCorruptAmily4Meeting);
         }
      }
      
      public function caughtAddingSkulls() : void
      {
         var _loc2_:* = null as IMap;
         clearOutput();
         var _loc1_:Boolean = FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2180) == 0;
         outputText("当你在营地围墙的周边巡逻时，你注意到路堤上增加了一个新东西。在一个栅栏的顶部，坐着一个小的、白色的、被阳光漂白的东西，你不认为[i:你]把它放在那里。因为它甚至没有你的头那么大，你觉得它需要仔细检查，所以你[walk]过去检查它。");
         outputText("[pg]这是一个头骨。你花了一点时间环顾四周，寻找任何明显的解释，但是没有，你的墙上只是有一个头骨[if (" + ("" + _loc1_) + ") {现在|你对此不负责}]。你周围的环境似乎仍然很平静，所以你目前没有理由担心，但是，在没有明显原因的情况下，在这里等待这样一个不祥的预兆似乎很奇怪。你可能应该弄清楚这里发生了什么。");
         outputText("[pg]你快速调查了你的营地，试图找到[if (camppop > 1) {任何知道的人|任何解释}]为什么这里会有一个[if (" + ("" + _loc1_) + ") {新的|无法解释的}]头骨，但没有任何东西引起你的注意。好吧，直到艾米莉突然从你身后的某个地方跳出来。");
         outputText("[pg][say:哦，嘿，[name]，]她高兴地说。[say:你看起来像见鬼了。.]");
         outputText("[pg]你解释说[if (" + ("" + _loc1_) + ") {现在你的墙上有一个头骨|似乎有其他人把头骨留在你的墙上}].");
         outputText("[pg][say:哦。]这位老鼠[if (nofur) {女孩|形态者}]看起来有点内疚。[say:是的，那是我。它……它传达了一个信息。我们不能容忍这里有任何那种污点，我们不应该害怕表现出来。我会尽可能多地清除这个世界上的小恶魔，我会让他们知道这一点。]她似乎对此非常坚定，她的表情阴沉而坚定。[if (" + ("" + _loc1_) + ") {你想你现在必须适应在营地周围看到骨头了|你表达了你的同意，并向她保证你的意见大致相同}]。}].");
         if(!saveContent.pcKnowsAboutSkulls)
         {
            _loc2_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc2_,2180,FlagDict_Impl_.arrayReadInt(_loc2_,2180) + int(saveContent.impSkullsCount));
            saveContent.pcKnowsAboutSkulls = true;
         }
         doNext(playerMenu);
      }
      
      public function caressAmilyHaveSex() : void
      {
         clearOutput();
         amilySprite();
         outputText("看着艾米莉在你面前自慰和挑逗自己绝对是色情的……但你希望这次会话不仅仅是这样。你舔了舔嘴唇，混合着兴奋和紧张，你试探性地伸出一只手，像羽毛一样轻轻地触碰她的手指。她之前一直闭着的眼睛突然睁开，你准备好如果她抗议就撤回并道歉。但是，无论出于什么原因，她没有抗议，受到鼓舞的你继续触摸和爱抚她。你保持你的触摸温柔、轻盈，并且仅限于非私密区域，但她似乎很享受这个；她靠近了一点，伸出手拂过你的脸颊，心不在焉地用她之前抚摸阴唇的那只手，所以她私密区域的气味从她手指所在的地方飘到你的鼻孔里。她的眼睛几乎完全闭上了，她给你的目光非常慵懒，但她嘴唇的形状，才刚刚开始张开，诱惑着你去亲吻它们。[pg]");
         menu();
         addButton(0,"拒绝亲吻",AmilyGetKissed);
         addButton(1,"吻她",AmilyTakeTheKiss);
      }
      
      public function beSomeKindofNervousDoucheAndWaitForAmily() : void
      {
         clearOutput();
         get_images().showImage("amily-forest-plainfuck");
         amilySprite(true);
         outputText("艾米莉也许是个可爱的小女孩，但你不确定……继续下去……是不是个好主意。所以你只是等着她决定是否真的想此时此地做爱。过了一会儿，当她看清你什么都不打算做时，她微微皱起眉头，走到你面前。看着她的眼睛，你突然意识到她想要一个吻。你低下头，打算给她一个纯洁的吻，但艾米莉显然有别的想法。你感觉到自己的舌头进入了她的嘴里，原本打算的一个短暂、纯洁的吻变成了一个非常火辣、相当“不纯洁”的吻。突然，你感觉到她的小手" + (get_noFur() ? "" : "（或者爪子？）") + "抓住了你的屁股。[pg]");
         outputText("尽管她表现得如此热情，但她似乎并没有真正“感觉”到，更多的是在走过场来唤醒你。你太饥渴了，根本不在乎那么多。[pg]");
         if(get_player().cocks[0].cockLength >= 14)
         {
            outputText("她把你领到她的“床”前，让你坐下，然后在你面前脱下衣服，跪下来帮你脱衣服。看到你巨大的阴茎，她显然不知道该如何继续。想了一两分钟后，她开始用手抚摸它。一旦你硬起来，几乎要在她身上爆发时，她直接坐在你面前，引导你的阴茎顶端进入她的阴唇，并继续抚摸。她加上另一只手和她的尾巴，继续给你一个手和尾巴结合的活儿，直到你高潮。虽然感觉不坏，但你觉得本来可以更好——而且你也意识到艾米莉似乎有些……失望。[pg]");
         }
         else
         {
            outputText("一看到你的阴茎，她就咧嘴一笑，开始抚摸它。[say: 显然你的尺寸很适合我……] 没过多久，你就硬了，几乎绝望地等着她开始真正地做“那件事”。她一直保持着笑容，慢慢地把自己降到你身上，引导你的阴茎进入她的阴唇。感觉比你想象的要好，但还是觉得有些不对劲……然而，一旦鼠娘开始上下移动，你就忘记了除了快感之外的一切。没过多久你就忍不住了。之后，艾米莉看着你的眼睛片刻，然后站起来重新穿上衣服。你明显感觉到她不知怎么的有些失望。[pg]");
         }
         outputText("看到她显然不再需要你了，你悄悄地找了个借口，穿好衣服离开了。");
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,38,FlagDict_Impl_.arrayReadInt(_loc1_,38) - 2);
         amilyPreggoChance();
         get_player().orgasm("Generic");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function beAmilysDadAsAHerm() : void
      {
         amilySprite();
         clearOutput();
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,165,2);
         outputText("你告诉她你会原谅她，并会帮助她孕育她" + (amilyFurry() ? "如此渴望的自由鼠人。她对你使用“鼠人”这个词感到有些困惑，但除此之外似乎很高兴。" : "如此渴望的孩子。") + " [say: 太好了！跟我来！] 她说着，抓住你的手，拉着你走在街上。[pg]");
         doNext(amilySexHappens);
      }
      
      public function backToCamp() : void
      {
         clearOutput();
         amilySprite();
         outputText("你告诉她回营地去；你需要对她做一些她在这里时你做不到的事情。反复地做。艾米莉咬着嘴唇，兴奋得浑身发抖。");
         outputText("[pg][say: 马上，[master]！] 你看着那紫色的模糊身影消失在山丘后，暗自发笑。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1079,0);
         doNext(get_game().farm.farmCorruption.rootScene);
      }
      
      public function announceSelfOnDesperatePleaMeeting() : void
      {
         clearOutput();
         amilySprite();
         outputText("考虑到最好不要吓到像艾米莉这样的人，你大声清了清嗓子。艾米莉转过身来面对你，立刻拔出刀摆出防御姿势。当她看到是你时，她眨了几下眼睛，然后惊讶地咧嘴笑了。[say: 哎呀，你好，[name]；很高兴再次见到你！很高兴能被提醒，这里还有另一个人没有变成无脑的性爱傀儡。]她的情绪随后变得紧张起来。[say: 啊……你有时间谈谈吗？我有些话想一吐为快，]她对你说，几乎不敢直视你的眼睛。[pg]");
         desperateFinallyAmily();
      }
      
      public function amilyXUrtaRunAWAY() : void
      {
         clearOutput();
         outputText("你看着乌尔塔接过酒瓶，痛快地喝了一大口，但在她彻底喝醉之前，你礼貌地找了个借口，扶起醉醺醺的艾米莉，离开了湿身婊酒馆。你们俩回到营地，把喝醉的鼠娘安顿在床上，你在她脸颊上亲了一下，很快也睡着了。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,346,3);
         doNext(get_camp().returnToCampUseFourHours);
      }
      
      public function amilyXIzmaSuperPregOptions() : void
      {
         clearOutput();
         outputText("你对艾米莉露出迷人的微笑，告诉她你心里有一些不同的想法。你想和她再要一窝孩子。");
         outputText("[pg][say:哦？你想让我……再怀孕一次？]老鼠问道，紧张地把尾巴握在手里。[say:你知道我的地精怀孕药已经用完了，对吧？所以，我的生育能力将远不如以前。.]");
         outputText("[pg]你点点头，再次微笑。");
         outputText("[pg][say:谢谢你……如果你真的想要，那我就停止使用那些草药避孕药。也许我可以配制点什么……毕竟我也算是个炼金术士！]艾米莉欢快地说着，用她小小的" + (amilyFurry() ? "爪子" : "手指") + "在你的胸前漫不经心地画着圈。她转过身，摇着尾巴，急切地领着你走向巢穴。");
         outputText("[pg]<b>你是想让她正常停用草药，还是尝试熬制一种生育药水？这种药水可能会有不寻常的副作用……</b>");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,166,1);
         menu();
         addButton(0,"正常",fuckTheMouseBitch).hint("让艾米莉正常停用草药。");
         addButton(1,"尝试药水",drinkThePotion).hint("尝试一些新东西。你有一种预感，这可能会导致不可避免的怀孕。");
      }
      
      public function amilyWinterCuddles() : void
      {
         clearOutput();
         amilySprite();
         outputText("尽管她的[amilyclothing]能提供一些温暖，但这只小老鼠看起来还是需要一些额外的安慰。你牵起艾米莉的手，把她拉到营火旁，告诉她你只想和她一起放松一会儿。");
         outputText("[pg]艾米莉对你微笑着，很高兴地接受了这个提议。你拿了一条毯子和她一起盖着，她在火边坐下。你把毯子的一端披在她身上，然后在你的爱人身边坐下，立刻就迎来了她把脸舒适地依偎在你的[if (tallness < 67) {shoulder|torso}]上。像这样裹在火堆前，你几乎感觉不到冬天的到来。");
         outputText("[pg][say: 你知道吗，最让我感到温暖的不是这火，] 艾米莉抬头看着你说道。她抓住你的手，继续说道：[say: 而是和你在一起，知道你在想着我。] 她闭上眼睛，更加用力地依偎着你。[pg]");
         if(get_akky().isOwned())
         {
            outputText("[akky]为了寻求关注，慢悠悠地走过来，跳到了艾米莉的腿上。猫突然跳到她身上，让这只老鼠吓了一跳。[say: 噢！] 她轻声笑着，抚摸着[akky]。[say: 你好啊。不想被冷落，对吧？] 仿佛在回答她，它发出呼噜声，依偎在她的肚子上，最后蜷缩在她的腿上休息。[pg]这三个");
         }
         else
         {
            outputText("你们俩");
         }
         outputText("坐在燃烧的圆木旁，感受着温暖，手牵着手，静静地坐了好几分钟，满足于这宁静的沉默。");
         outputText("[pg][say: 我爱你，[name]。] 艾米莉脸上流露出由衷的平静与幸福，让这句话的含义更加深刻。你高兴地回应了她的感情，紧紧握住她的手以示强调，然后你们一起度过了大半个多小时。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function amilyWakeUp() : void
      {
         clearOutput();
         amilySprite(true);
         if(get_player().get_lust() < 40 || get_player().isGenderless())
         {
            outputText("你在艾米莉之前醒来，感觉到她躺在你的胸前。你轻轻地抚摸她的头，这让她的老鼠耳朵抽动了一下，她熟睡的脸上绽放出笑容。尽管你可能想一直这样待着，但你必须得走了。你小心翼翼地从艾米莉身下溜出来，让她的表情从可爱的微笑变成了相当不悦的表情。她显然不高兴你身体的温暖离开她身边，但当你需要为新的一天做准备时，你别无选择。");
         }
         else if(get_player().hasCock())
         {
            outputText("你醒来时感觉到你的[cock]上有一种温暖潮湿的感觉。你嘴里发出一声夹杂着呻吟的哈欠，揉了揉眼睛，让你迷迷糊糊地看到艾米莉正把你含在嘴里。你的肉棒顶着她的脸颊，微微鼓起。她闭着眼睛，嘴巴沿着你抽动的阴茎移动，她的舌头充满爱意地抚摸着你男子气概的下侧。");
            outputText("[pg]一声火热的呻吟从你唇间逸出，你感觉到艾米莉贪婪地吸吮着你的老二时露出了微笑。她的耳朵抽动着，热情地在你的[cock]上下套弄，显然渴望你滚烫的精液。" + (int(get_player().cocks.length) > 1 ? "艾米莉抓住你的第二根肉棒，一边套弄一边快速地用手撸动。" : ""));
            outputText("[pg]当你接近即将到来的释放时，你忍不住喘息。你大声呼喊艾米莉的名字，抓住她的头顶，喷射出你热气腾腾的精液。这只鼠" + (!amilyFurry() ? "娘" : "人") + "的眼睛惊讶地睁开，既是因为你抓住了她的头，也是因为她感觉到脸颊里充满了精液。你的整个身体随着每一次喷射而颤抖，艾米莉忠诚地尽她最大的努力将这一切都吸进她等待的嘴里。" + (int(get_player().cocks.length) > 1 ? "她继续抚摸你的第二根肉棒，因为它把精液射满了她的胸膛。她没有停止摩擦你射精的肉棒，直到你的两根老二都完全耗尽。" : ""));
            outputText("[pg]伴随着清晰的“啵”声，她将你疲软的肉棒拔了出来。当艾米莉与你目光交汇时，她张开嘴，向你展示着里面黏糊糊的精液。你甚至能看到她嘴里冒出些许热气。向你展示完你的浓精后，艾米莉明显地咽了一下，将它们吞了下去。她脸上挂着微笑，小声嘀咕道：[say: 我在想是不是该把早饭省了？]");
            outputText("[pg]艾米莉羞涩地说：[say: 还、还有，早、早上好。对不起，我不该没问你就直接这么做的。]你也向她问好，她便依偎在你身旁。你们俩在温暖的拥抱中躺了一会儿，然后才决定起身，准备迎接新的一天。");
            get_player().orgasm("Dick");
         }
         else
         {
            outputText("你在全身的颤抖中醒来，一条温暖的舌头在你的[pussy]上舔弄，带来一阵阵愉悦的酥麻感。你发出一声炽热的娇喘，低头看去，只见艾米莉闭着眼睛，正尽情享用着你滴水的蜜壶。她像个渴极了的女人一样，贪婪地舔舐着你的汁液。你咬住下唇，感觉到艾米莉将一根手指挑逗般地探入你的深处，把玩着你的内壁，然后轻轻抽出，又迅速地插了回去。");
            outputText("[pg]难耐的喘息和渴求从你唇间溢出，这让艾米莉加快了舔舐的速度。这个鼠" + (!amilyFurry() ? "女孩" : "兽人") + "开心地舔尽你颤抖的穴口漏出的每一滴爱液。随着你接近高潮，你抓住艾米莉的头，向上挺起臀部，在达到顶峰时将你的[pussy]在她的脸上摩擦。");
            outputText("[pg]你筋疲力尽地喘息着，在你松开手后，艾米莉将头从你的胯间移开。她舔了舔嘴唇，清理掉上面的体液，然后对你说：[say: 你的味道挺甜的……啊，还有，早上好……我该道个歉，我不该没问你就先这么做的。]在你向艾米莉道了早安后，她把头靠在你的胸膛上。你们俩沐浴在晨光中，又享受了一会儿彼此的温暖，才恋恋不舍地起身准备开始新的一天。");
            get_player().orgasm("Vaginal");
         }
         saveContent.amilyMorning = false;
         doNext(playerMenu);
      }
      
      public function amilyVillageMenu() : void
      {
         clearOutput();
         outputText("好奇艾米莉的情况，你回到了废弃的村庄。这次你没有费心去隐藏你的存在，希望能更快地吸引艾米莉的注意。毕竟，她确实说过这个地方除了她之外基本上空无一人，而且你也能对付区区小恶魔或地精。[pg]");
         switch(pregnancy.get_event())
         {
            case 1:
            case 2:
            case 3:
            case 4:
            case 5:
               outputText("艾米莉从废墟中出现的速度比平时慢了一些。你可以看到你们共同努力的结果；她的腹部明显隆起，微微撑起了她破烂的衬衫，并严重拉扯着她的腰带。她漫不经心地用一只手抚摸着它，仿佛在向自己确认它的存在。[pg]");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,38) < 15 || get_player().get_gender() == 0)
               {
                  outputText("[say: 好吧，我想尽管你可能有其他缺点，但你能完成任务，]她没有直视你，说道。[pg]");
               }
               else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,38) < 40)
               {
                  outputText("[say: 谢谢你。有了你的帮助，我的人民很快就会重生。]她抚摸着肚子，开心地笑着。[say: 你有什么想谈的吗？][pg]");
               }
               else
               {
                  outputText("[say: 谢谢你，谢谢你！没有你我做不到这些！]她惊呼道。[say: 你做了一件美妙、高尚的事情，我很高兴我找到了你作为他们的父亲。所以，虽然再次见到你很高兴，但你为什么来拜访？][pg]");
               }
               break;
            case 6:
            case 7:
            case 8:
               outputText("过了几分钟艾米莉才出现，但当你看到她时，你惊叹于她能这么快地来到你身边。她的肚子肿得很大；她的一只手实际上托在圆润的肚子下面，仿佛试图把它托起来。她没有穿裤子，显然已经穿不下了。她的衬衫松松垮垮地垂着，勉强能遮住她坚挺的球形肚子的上半部分。她挂着吹箭筒和匕首的腰带像腰带一样系在上胸——在乳房和隆起的肚子之间——这样她仍然可以有效地携带武器。[pg]");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,38) < 15 || get_player().get_gender() == 0)
               {
                  outputText("她似乎更关注她怀孕的肚子而不是你，过了好一会儿她才终于开口。[say: 这些孩子很快就会出生。我想我应该感谢你愿意做他们的父亲。][pg]");
                  break;
               }
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,38) < 40)
               {
                  outputText("她轻声呻吟。[say: 你知道，这不是一件容易的事。但我仍然想感谢你。也许，当这些孩子出生时，你愿意帮我再造一些？]她问道，尾巴在她身后轻轻摇摆。[pg]");
                  break;
               }
               outputText("[say: 我早该知道你要来；你在这里的时候他们总是开始踢得厉害——你知道吗？]她幸福地笑着。[say: 他们已经认识他们的爸爸了，他们认识。有了你的帮助，我的人民的新一代将有机会在没有恶魔污染的环境中长大。你在想什么吗？][pg]");
               break;
            default:
               outputText("没过多久，艾米莉就从废墟中现身了。她的吹箭筒和匕首分别插在腰带上，她仍然穿着和以前一样破旧的衣服。[pg]");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,38) < 15 || get_player().get_gender() == 0)
               {
                  if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,158) == 2 && get_player().get_gender() == 2)
                  {
                     outputText("她双臂交叉，对你微笑。[say: 所以你回来了，是吗？你想和我这个小老太婆聊天吗？]她问道。[pg]");
                  }
                  else
                  {
                     outputText("她双臂交叉，手指在肩膀上敲击。[say: 那么，你为什么在这里？你想要什么？]她问道。[pg]");
                  }
               }
               else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,38) < 40)
               {
                  outputText("看到你，她温柔地笑了。[say: 很高兴能看到另一个没有屈服于腐化的人。你有什么心事吗？][pg]");
               }
               else
               {
                  outputText("她满心欢喜地对你咧嘴一笑。[saystart]嘿，[name]！很高兴再次见到你……");
                  if(get_player().hasCock())
                  {
                     outputText("你是来让我怀孕的吗？");
                     if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) > 0 && get_player().get_pregnancyIncubation() == 0)
                     {
                        outputText("还是你是来怀孕的？");
                     }
                  }
                  else if(get_player().hasVagina())
                  {
                     if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) > 0 && get_player().get_pregnancyIncubation() == 0)
                     {
                        outputText("你回来是为了让我再往你的烤箱里塞个面包吗？");
                     }
                     else
                     {
                        outputText("你回来是为了和我度过一点“美好时光”吗？");
                     }
                  }
                  outputText("[sayend]她调侃道，但她的肢体语言");
                  if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) > 0)
                  {
                     outputText("以及她裤子上撑起的帐篷");
                     dynStats(DynStat.Lust(5));
                  }
                  outputText("表明这可不是开玩笑的。[pg]");
               }
         }
         var _loc1_:Function = determineAmilySexEvent();
         menu();
         addButton(0,"外貌",amilyAppearance);
         addButton(1,"交谈",talkToAmily);
         if(_loc1_ != null)
         {
            addButton(2,"做爱",_loc1_);
            addButton(3,"都要",talkThenSexWithAmily);
         }
         else
         {
            addButtonDisabled(2,"做爱");
            addButtonDisabled(3,"都要");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,165) == 5)
         {
            addButton(4,"孩子",amilyDiscussChildren);
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) == 0)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,165) == 2 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,38) >= 40 && get_player().get_gender() == 3)
            {
               if(get_player().hasItem(get_consumables().P_DRAFT))
               {
                  outputText("你或许可以提一下有两个扶她母亲的效率，特别是因为你手头正好有这瓶纯净的梦魇药剂。[pg]");
                  addButton(4,"效率",makeAmilyAHerm);
               }
               else
               {
                  addButtonDisabled(4,"效率","如果你能找到一瓶纯净的梦魇药剂，你或许可以提一下有两个扶她母亲的效率。");
               }
            }
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,337) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,336) > 0)
         {
            addNextButton("除毛",amilyDefurrify).hint("让她完成变形。").disableIf(!amilyCanHaveTFNow(),"你需要一颗金色种子、一个黑蛋和一些纯净魅魔奶。");
         }
         setExitButton();
      }
      
      public function amilyTits() : String
      {
         var _loc1_:int = int(Math.random() * 3);
         var _loc2_:String = "";
         if(Utils.rand(2) == 0)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,47) <= 2)
            {
               _loc1_ = Utils.rand(3);
               if(_loc1_ == 0)
               {
                  _loc2_ += "小巧的";
               }
               if(_loc1_ == 1)
               {
                  _loc2_ += "小小的";
               }
               if(_loc1_ == 2)
               {
                  _loc2_ += "挺拔的";
               }
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,47) > 2 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,47) <= 4)
            {
               _loc2_ += "丰满的";
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,47) > 4 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,47) <= 6)
            {
               _loc1_ = Utils.rand(4);
               if(_loc1_ == 0)
               {
                  _loc2_ += "大大的";
               }
               if(_loc1_ == 1)
               {
                  _loc2_ += "巨大的";
               }
               if(_loc1_ == 2)
               {
                  _loc2_ += "枕头般的";
               }
               if(_loc1_ == 3)
               {
                  _loc2_ += "晃荡的";
               }
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,47) > 6 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,47) < 13)
            {
               _loc1_ = Utils.rand(4);
               if(_loc1_ == 0)
               {
                  _loc2_ += "篮球般大小的";
               }
               if(_loc1_ == 1)
               {
                  _loc2_ += "淫荡的";
               }
               if(_loc1_ == 2)
               {
                  _loc2_ += "色情明星般的";
               }
               if(_loc1_ == 3)
               {
                  _loc2_ += "晃荡的";
               }
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,47) >= 13)
            {
               _loc2_ += "沙滩排球般大小的";
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,47) >= 18)
            {
               _loc1_ = Utils.rand(2);
               if(_loc1_ == 1)
               {
                  _loc2_ += "如山般的";
               }
               else
               {
                  _loc2_ += "巨大的";
               }
            }
         }
         _loc1_ = Utils.rand(10);
         if(_loc1_ == 0)
         {
            _loc2_ += "乳房";
         }
         if(_loc1_ == 1)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,51) > 2)
            {
               _loc2_ += "奶袋";
            }
            else
            {
               _loc2_ += "乳房";
            }
         }
         if(_loc1_ == 2)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,51) > 1.5)
            {
               _loc2_ += "奶水充盈的";
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,47) > 4)
            {
               _loc2_ += "奶子";
            }
            else
            {
               _loc2_ += "乳房";
            }
         }
         if(_loc1_ == 3)
         {
            _loc2_ += "乳房";
         }
         if(_loc1_ == 4)
         {
            _loc2_ += "奶子";
         }
         if(_loc1_ == 5)
         {
            _loc2_ += "奶子";
         }
         if(_loc1_ == 6)
         {
            _loc2_ += "奶子";
         }
         if(_loc1_ == 7)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,51) >= 1 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,51) < 2.5)
            {
               _loc2_ += "奶罐";
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,51) >= 2.5)
            {
               _loc2_ += "奶袋";
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,51) < 1)
            {
               _loc2_ += "双峰";
            }
         }
         if(_loc1_ == 8)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,47) > 6)
            {
               _loc2_ += "肉枕";
            }
            else
            {
               _loc2_ += "咪咪";
            }
         }
         if(_loc1_ == 9)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,47) > 6)
            {
               _loc2_ += "奶子";
            }
            else
            {
               _loc2_ += "乳房";
            }
         }
         return _loc2_;
      }
      
      public function amilyTakesChargeSex() : void
      {
         var type1:Boolean;
         var _g1:AmilyScene;
         var type:Boolean;
         var _g:AmilyScene;
         amilySprite();
         clearOutput();
         outputText("你大步走到她面前，将她拥入怀中，深深地吻了她。她热情地融化在你的拥抱中，同样用力地回吻你，她的尾巴缠绕在你的[leg]上。你带领她回到她为自己筑的巢，坚定而温柔地让她平躺在那里。她微笑着抬头看着你。[say: 哦，要掌握主动权了，是吗？]她高兴地颤音，尾巴因为真诚的兴奋而来回摆动。");
         outputText("[pg]你要做什么？");
         menu();
         if(get_player().hasCock())
         {
            if(get_player().hasCockThatFits(61))
            {
               addButton(0,"操她",takeChargeAmilyFuck).hint("插入艾米莉的阴道。");
            }
            else
            {
               _g = this;
               type = false;
               addButton(0,"操她",function():void
               {
                  _g.takeChargeAmilyFuckTooLarge(type);
               }).hint("她可能承受不了，但试试也无妨。反正受伤的又不是你。");
            }
            if(get_player().hasCockThatFits(50))
            {
               addButton(1,"肛交",fuckPureAmilysHeiny).hint("从后面干艾米莉。");
            }
            else
            {
               _g1 = this;
               type1 = true;
               addButton(1,"肛交",function():void
               {
                  _g1.takeChargeAmilyFuckTooLarge(type1);
               }).hint("她可能承受不了，但试试也无妨。反正受伤的又不是你。");
            }
            addButton(2,"被吸",takeChargeAmilyGetSucked).hint("让艾米莉给你口交。");
         }
         if(get_player().hasVagina())
         {
            addButton(3,"磨豆腐",takeChargeAmilyScissorMeTimbers).hint("把你的女性部位和艾米莉的摩擦，享受一些女孩间的乐趣。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) > 0)
            {
               addButton(4,"骑乘",takeChargeAmilyMountHer).hint("骑在艾米莉的肉棒上，直到她高潮！!");
            }
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,40) > 0 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,51) >= 1)
         {
            addButton(5,"喝奶",takeChargeAmilyMouseMilk).hint("喝点艾米莉美味的鼠奶。");
         }
         addButton(6,"舔阴",takeChargeAmilyEatOut).hint("品尝一下艾米莉的小穴。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) > 0)
         {
            addButton(7,"被肛",pureAmilyPutsItInYourRectumDamnNearKilledEm).hint("让艾米莉好好利用她的肉棒，从后面干你。");
         }
         if(get_watersportsEnabled() && get_player().hasCock())
         {
            addButton(8,"水上运动",amilyCockWatersports).hint("和艾米莉玩点更变态的。").disableIf(get_player().isTaur(),"此场景不适用于半人马。");
         }
         setExitButton("返回",fuckTheMouseBitch);
      }
      
      public function amilyTaintWarning() : void
      {
         clearOutput();
         amilySprite();
         outputText("艾米莉向你走来，神情担忧。[say: 亲爱的……我不知道发生了什么，但你必须开始好好照顾自己了。我能闻到腐化在你体内生根发芽的味道——如果你不停止，你很快就会变得和其他恶魔一样。][pg]");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,173,1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function amilySwimFuckPartII() : void
      {
         var _loc1_:int = get_player().cockThatFits(61);
         if(_loc1_ < 0)
         {
            _loc1_ = get_player().smallestCockIndex();
         }
         clearOutput();
         amilySprite(true);
         outputText("溪流并不远，你们俩几乎没花什么时间就到了。一路上，你们偶尔的挑逗性触摸和低声赞美让旅程变慢了。当你到达时，艾米莉咯咯地笑着，脸红了，用手扇着风，尽管外面并没有那么热。她转过身来面对你，性感地滑过你的[armor]，开始摩擦你的");
         if(get_player().hasCock())
         {
            outputText("包裹");
         }
         else if(get_player().hasVagina())
         {
            outputText("肿胀的嘴唇");
         }
         else
         {
            outputText("[butt]");
         }
         outputText("。你因这种感觉而叹息，喃喃地说，[say: 我以为我们要去游泳？]");
         outputText("[pg]艾米莉回答说，[say: 就在你之后！]然后扭动身体，将脚钩在你下面，将你绊倒在冰冷的水中。你推开水面，因为喝了冰水而结结巴巴");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,635) > 1)
         {
            outputText("，并想知道为什么你总是上当");
         }
         outputText("。艾米莉紧随其后，以一个喧闹的炮弹跳入深水区。由于她的身材，由此产生的水花并不令人印象深刻，当她浮出水面呼吸时，你一定要向她泼水，以报复你受到的意外浸泡。鼠人咯咯地笑着，防卫性地将手臂挡在脸前，向后蹒跚，" + amilyTits() + "在几乎没有支撑的上衣中摇晃。你为了以防万一又向她泼了几次水，但她开始反击。由此产生的水战让你们俩都完全湿透了。[pg]");
         get_player().hasGottenWashed();
         outputText("[pg]一旦你厌倦了将冰冷的液体来回抛洒，你就会花时间脱下你的[armor]并躺在岸边。艾米莉停下她正在做的事情来观看，开玩笑地问，[say: 已经厌倦了输吗？]而她的眼睛则在打量你。");
         outputText("[pg]你假笑并宣称她暴露的两件套已经将她的身体展示得如此淋漓尽致，以至于你认为唯一能竞争的方法就是自己也赤身裸体。你向上伸展双臂，让水滴顺着你的[chest]流下，毫不悔改地凝视着鼠女紧身包裹的身体。水已经浸透了她紧贴的衣服，随着水分的增加，你实际上可以完美地看到她的某些部位。当然，她的阴户以前就形成了一个清晰可见的骆驼趾，但现在……就像你在看一场黑框的偷窥秀。当她对你的话感到惊讶而向后摇晃时，她挺拔的乳房也会随之弹跳。");
         outputText("[pg][say: 你这个变态！]艾米莉假装惊讶地喊道，将目光锁定在你的乳头和暴露的腹股沟上。[say: 如果你要对此下流的话，]她开始说，她的声音下降到一种明显不符合她性格的咕噜声，[say: 那么你最好为你得到的东西做好准备。]她的手放在你的肩膀上，当她看着你的眼睛时，她说[say: 你也把我弄湿了。.]");
         outputText("[pg]娇小的鼠娘扑进你的怀里，紧紧贴着你的胸膛。她轻松地伸手去拿她的泳裤并把它们推到一边，正好赶上她湿透的阴毛遇到你的" + get_player().cockDescript(_loc1_) + "。你的" + get_player().cockHead(_loc1_) + "在艾米莉液态热情的帮助下，轻松滑过她丝绸般的门户。当你的矮个子情人骑着你时，水和汁液从你们俩的身体上滴落，你的手找到了她的" + amilyButt() + "，抓住她把她拉下来，更深。在冰冷的溪流中呆过之后，艾米莉紧致阴户的紧贴褶皱感觉就像是你勃起的滚烫药膏，当她停在你的");
         if(get_player().balls > 0)
         {
            outputText("[balls]");
         }
         else
         {
            outputText("底部");
         }
         outputText(".");
         outputText("[pg]你揉捏着她柔软的脸颊，用十根手指欣赏着");
         if(amilyFurry())
         {
            outputText("她丝滑的皮毛");
         }
         else
         {
            outputText("她光滑的肌肤");
         }
         outputText("。小鼠娘的尾巴卷住你的[hips]，把你拉得更近，用尽全力在你身上摩擦。你能感觉到");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) == 0)
         {
            outputText("她肿胀的阴蒂");
         }
         else
         {
            outputText("湿滑的肉棒");
         }
         outputText("它的上半部分被撑离了她的身体，形成了一个紧绷的小帐篷，她的" + amilyCock() + "似乎随时都会将其撕裂。不安地扭动了一会儿后，艾米莉把它从上面掏了出来，让它无力地耷拉着。");
         if(amilyFurry())
         {
            outputText("当她凑上来接吻时，她的胡须痒痒地扫过你的脸颊。");
         }
         else
         {
            outputText("S");
         }
         outputText("纤细的嘴唇贴上你的，她那灵巧的小舌头滑进了你的嘴里。");
         outputText("[pg]欲火焚身，你带着被你肉棒贯穿的爱人走出水面，一踏上坚实的地面，你就开始操她。你的双手把她拉起来，几乎要离开你的" + get_player().cockHead(_loc1_) + "，然后你让重力把她拉回来，稍微倾斜你的[hips]以加速这令人愉悦的摩擦。当艾米莉落到底部时，她发出一声尖叫，打断了亲吻，然后又以新的活力吻了上来。");
         outputText("[pg]你们俩就像在最喜欢的水坑旁发情的野兽一样做爱，只要有机会，你就会让一只手去抚摸她的" + amilyNipples() + "、" + amilyTits() + "或" + amilyButt() + "。湿透的女孩很快就在你身上抽搐扭动，一言不发地度过了一次史诗般的高潮。她甜美的穴肉自始至终都在爱抚着你的" + get_player().cockDescript(_loc1_) + "，用坚持不懈的女性快感绞榨着你肿胀的阴茎，仿佛这样就能把你的精液挤出来似的。");
         outputText("[pg][say:天哪，]艾米莉喘息着，[say:你太不可思议了！]她透过沉重的眼皮看着你，再次吻了你，尽管当你恢复快速、湿润的抽插时，她的肌肉疯狂地痉挛着。你又重又快地捣弄着她，用力地操着她火热的穴，让她整个身体都在你怀里弹跳。艾米莉现在几乎就是一堆颤抖的女性肉体，紧紧地包裹着你的" + get_player().cockDescript(_loc1_) + "，只等着被受孕。把她按下去，你仰起头，终于射了，把浓稠的精液泵入她的体内。");
         if(get_player().cockTotal() > 1)
         {
            outputText("你那无人照料的勃起");
            if(get_player().cockTotal() > 2)
            {
               outputText("们");
            }
            else
            {
               outputText("确实");
            }
            outputText("很好地将");
            if(get_player().cockTotal() == 2)
            {
               outputText("它的精液");
            }
            else
            {
               outputText("它们的精液");
            }
            outputText("喷洒在她的腰部。");
         }
         outputText("她体内流动的热流引发了第二次高潮");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) > 0)
         {
            outputText("，她再次达到了顶点，将乳白色的老鼠精液喷洒在她的" + amilyTits() + "下方和你的[chest]上");
         }
         outputText("。她的通道很快就滴下了你们混合的体液");
         if(get_player().cumQ() > 250)
         {
            outputText("，但这并没有阻止你继续抽插，");
            if(get_player().cumQ() < 500)
            {
               outputText("每一次动作都从收缩的小穴中挤出越来越多的精液");
            }
            else if(get_player().cumQ() < 750)
            {
               outputText("喷涌出倒流的精液，艾米莉的肚子上隆起了一个微小但可见的精液包");
            }
            else if(get_player().cumQ() < 1000)
            {
               outputText("大量的精液从她的小穴中冲刷而出，她的肚子圆润地鼓了起来");
            }
            else if(get_player().cumQ() < 2000)
            {
               outputText("一波波的精液在你的" + get_player().cockDescript(_loc1_) + "周围冲刷着，随着你的抽插，她看起来圆润得像怀孕了一样");
            }
            else
            {
               outputText("精液像间歇泉一样从颤抖的老鼠洞中喷发而出，艾米莉的肚子被精液撑得像气球一样。即使它再也无法伸展，你仍然在射精，喷射出的高压精液溅满了你的[legs]");
            }
         }
         outputText("。[pg]");
         outputText("完事后，你轻轻地放下呻吟的女孩，把她的比基尼下装拉回原位，以兜住里面满满的精液。艾米莉呻吟着，[say:变态，]但她并没有阻止你。她甚至帮你重新穿好衣服，然后你们俩手牵手走回营地，既干净又肮脏。");
         get_player().orgasm("Generic");
         dynStats(DynStat.Sens(-1));
         amilyPreggoChance();
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function amilySwimFuckIntro() : void
      {
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,635) == 0)
         {
            outputText("你拿出那件性感的黑色两件套，微笑着递给鼠娘");
            if(get_player().lib >= 60)
            {
               outputText("，热切地期待着能有机会欣赏她被紧身黑色布料包裹的曼妙身姿。");
            }
            else if(get_player().cor < 50)
            {
               outputText("，很高兴能与你的鼠娘恋人分享你冒险的成果。");
            }
            else
            {
               outputText("，暗自希望她能习惯为你表演。");
            }
            outputText("[pg]艾米莉的眼睛睁得大大的，几乎和她的耳朵一样圆，她高兴地跳到你面前，小心翼翼地触摸着布料。[say:它太漂亮了，[name]，]她说，[say:你真的觉得我穿这种衣服会好看吗？]她踮起脚尖跳了跳，仍然摸着布料，却不愿从你手中接过去。");
            outputText("[pg]你把那堆小巧的三角形布料和细绳塞进鼠娘手里，说道：[say:你为什么不试穿一下，然后和我一起去溪里游泳呢？那样我们就能看看你穿上它到底有多好看了。.]");
            outputText("[pg]她兴奋地吱吱叫了一声，跑开了，脸颊绯红。当她消失在一块岩石后面时，她那" + amilyHips() + "的俏皮摇摆吸引了你的目光，这清楚地表明她并不太害羞在你周围换衣服——她只是在为一个盛大的展示做准备。你压抑住跟上去偷看的冲动。看到她半裸的样子对你来说并不是什么新鲜事，你想在她穿上它时被惊艳到。你靠在一块岩石上坐下，布料摩擦的声音传入你的耳朵，不知不觉中，艾米莉喊道：[saystart]好了，我准备好了！!");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) > 0)
            {
               outputText("不、不许笑，好吗？");
            }
            outputText("[sayend]");
            outputText("[pg]艾米莉紧张地绕过岩石走出来，双手叉腰。她柔软的");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,337) > 0)
            {
               outputText("皮肤");
            }
            else
            {
               outputText("皮毛");
            }
            outputText("几乎完全暴露在外，没有被那勉强遮住她最敏感部位的暴露布料束缚。小鼠娘健美的双腿和丰满的大腿吸引了你的目光，一直向上延伸到她的" + amilyHips() + "和" + amilyButt() + "，被一条狭窄的黑色布料隔开。在那些经过生存磨练的四肢之间，是一个小巧的三角形，勉强遮住艾米莉的下体，轻轻贴合着她清晰可见的骆驼趾。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) > 0)
            {
               outputText("它的上半部分被拉离她的身体，形成一个紧绷的帐篷，她的" + amilyCock() + "似乎随时都会将其撕裂。在不安地扭动了一会儿后，艾米莉把它从顶部拉出来，让它无力地垂下。");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,171) > 0)
               {
                  outputText("它弹回她的" + amilyBalls() + "上，紧紧地包裹着它们。");
               }
            }
            outputText("再往上，丝滑的黑色布料环绕着她" + amilyTits() + "的球体，但当你欣赏她的新造型时，她" + amilyNipples() + "坚硬的尖端凸起，轮廓如此清晰，以至于你可以透过诱人的泳衣看到它们颗粒状的纹理。");
            outputText("[pg][say:我看起来怎么样，]你的恋人羞涩地问道，脚尖在地上画着圈。这只通常自信的小老鼠显然有些不知所措，但也同样兴奋。");
            outputText("[pg][say:美极了，]你回答道，并想起了你之前的提议，你问道：[say:那我们下水吧？]");
            outputText("[pg]艾米莉风情万种地扭着腰走到你身边，牵起你的手，重重地靠在你身上，你们俩一起向溪流走去。");
            get_player().consumeItem(get_armors().S_SWMWR);
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,636,1);
            FlagDict_Impl_.arrayWriteString(KFLAGS.flags,52,get_armors().S_SWMWR.get_shortName());
         }
         else
         {
            outputText("你问艾米莉是否想再去游一次泳。她真诚地笑了笑，点了点头。[say: 让我换件衣服，马上回来！!]");
            outputText("[pg]艾米莉匆匆跑向她的储物处，你耐心地等待她回来。当她回来时，她娇小的身体被一层薄薄的黑色紧紧包裹着，既掩盖了她的资本，又凸显了她的魅力。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) > 0)
            {
               outputText("唯一暴露在外的是她的" + amilyCock() + "，随着她的每一步轻轻晃动。");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,171) > 0)
               {
                  outputText("她的睾丸被紧紧地包裹在泳裤里，看起来像一个可爱的小球，充满了阳刚之气。");
               }
            }
            outputText("她" + amilyNipples() + "的硬点在比基尼上衣上显露无疑。显然，她并不打算花太多时间游泳，就像上次一样。");
            outputText("[pg]艾米莉漫步走过来，抓住你的手，带领你走向溪流，而她的" + amilyButt() + "则向你摇摆。有趣的是，她的尾巴从她性感的黑色比基尼泳裤后面的三角形洞里伸了出来。");
         }
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,635,FlagDict_Impl_.arrayReadInt(_loc1_,635) + 1);
         doNext(amilySwimFuckPartII);
      }
      
      public function amilySufferNotTheFurryToLive() : void
      {
         amilySprite();
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,337,1);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,338,1);
         outputText("看着眼前这个已经人类化的鼠娘，你恶意地笑了起来。你满脸坏笑地告诉她，你做这一切只是为了耍她；她下次真的应该相信自己的直觉。你继续着你的长篇大论，告诉她她是个彻头彻尾的傻瓜，也是个假装高尚的伪君子，骨子里不过是个荡妇。你停顿了一下，只为欣赏她脸上被背叛的神情，然后你评论道，她坚持那种繁衍族群的扭曲理想不过是个堕落的白日梦；一个永远不会实现的梦。你得意地笑着嘲讽她，暗示她应该在你离开时“享受”她的新身体，让你的话语在她心中回荡，而她则明显地流下了眼泪。当你走回营地时，身后只回荡着微弱的抽泣声。");
      }
      
      public function amilyStepTheFuckIn() : void
      {
         clearOutput();
         amilySprite();
         outputText("你感到渴望、困惑和不耐烦，于是从座位上站起来帮艾米莉脱衣服。她接受了你的帮助，似乎也很享受你的触摸和帮助，但同时她似乎很失望……甚至有点受伤？几乎就像她一直希望你看着她的努力一样？[pg]");
         AmilyMidSexLevel2();
      }
      
      public function amilySprite(param1:Boolean = false) : void
      {
         if(amilyFurry())
         {
            if(param1)
            {
               spriteSelect(SpriteDb.get_s_amily_nude());
            }
            else
            {
               spriteSelect(SpriteDb.get_s_amily());
            }
         }
         else
         {
            if(param1)
            {
               spriteSelect(SpriteDb.get_s_amily_defurr_nude());
            }
            spriteSelect(SpriteDb.get_s_amily_defurred());
         }
      }
      
      public function amilySleepWith() : void
      {
         if(get_game().time.hours >= 21)
         {
            get_game().timeQ = 24 - get_game().time.hours;
         }
         else
         {
            get_game().timeQ = 0;
         }
         var _temp_1:* = get_game();
         _temp_1.timeQ = _temp_1.timeQ + get_camp().wakeupTime();
         clearOutput();
         amilySprite(true);
         outputText("你问艾米莉今晚是否想依偎在一起。这只鼠" + (!amilyFurry() ? "娘" : "人") + "给了你一个愉快的微笑，并告诉你，[say:我很乐意。]在她让你躺下之前，她迅速整理了她的窝，她的屁股在空中诱人地摇晃着，一边整理。");
         outputText("[pg]完成后，女孩站起来脱掉衣服，然后躺下。很难不欣赏她的身体，但她的话让你从盯着她迷人的身姿中惊醒。[say:怎么了？你要加入我吗？]艾米莉脸上带着微笑，拍了拍她旁边的位置。作为对她邀请的回应，你" + (!get_player().isNaked() ? "脱掉装备，然后" : "") + "躺在你的爱人旁边。");
         if(get_player().get_HP() <= get_player().maxHP() / 2)
         {
            outputText("[pg]艾米莉注意到你身上目前的伤痕，皱起了眉头。她用关切的语气问道，[say:你不会就这么睡吧，对吗？]尽管你试图向她保证你没事，但她还是坐了起来，对你摇了摇手指。[say:你需要更好地照顾自己。等一下……]艾米莉站起来，开始翻找她的一些东西。至少在她寻找她想找的东西时，你可以欣赏到她光洁的臀部和阴部。");
            outputText("[pg]然后她惊呼道，[say:啊，在这里！]艾米莉转过身来，让你无法再看到她的屁股。你可以看到她手里拿着一个小容器，看着她拧开盖子。里面似乎装有一种难闻的浅绿色药膏。[say:好了，现在坐起来。还有……这可能会有点刺痛，但忍耐一下。.]");
            outputText("[pg]你感觉到她沾满药膏的手指划过你的一道伤口，因为灼热感而退缩。她对你所有的伤口都这样做了，当你抱怨时，艾米莉开玩笑地告诉你，[say:别像个婴儿一样，刺痛意味着它在起作用。相信我，明天早上你会感觉好些的。.]");
            outputText("[pg]当你重新躺下时，艾米莉收起药，然后坐在你旁边。她把一只手放在你的胸前，轻轻地抚摸着你，低声说道，[say:看到你受那些伤……对我来说并不容易。所以，尽量更好地照顾自己……...]");
            get_player().HPChange(get_player().maxHP() / 5,false);
         }
         outputText("[pg]艾米莉双臂环绕着你，依偎在你身上。感受到她紧贴着你的温暖，你忍不住感到安心。你们俩分享了一个吻，她打了个可爱的哈欠，低声说道，[say:晚安，[Player]。我爱你。.]");
         FlagDict_Impl_.arrayWriteString(KFLAGS.flags,701,"Amily");
         saveContent.amilyMorning = true;
         doNext(get_camp().sleepWrapper);
      }
      
      public function amilySexPtII() : void
      {
         var _loc1_:* = null as IMap;
         amilySprite();
         if(get_player().hasStatusEffect(StatusEffects.Infested))
         {
            outputText("[say: 呃！你被感染了！]她尖叫道，[say: 滚出去！在你除掉那些虫子之前别回来！!]");
            outputText("[pg]你赶紧逃离了那里。看来在你痊愈之前，艾米莉不想和你有太多瓜葛。");
            doNext(get_camp().returnToCampUseOneHour);
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,38,FlagDict_Impl_.arrayReadInt(_loc1_,38) - 3);
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,37,1);
            return;
         }
         outputText("现在你们俩都赤身裸体了，艾米莉后退了一步，开始抚摸自己——虽然她的动作有些犹豫，而且她显然以前从未这样做过，但她确实在努力变得诱人。一根手指抚摸着每一个娇小可爱的乳头，向相反的方向画圈，以使它们尽可能地挺立。她的右手滑开，留下左手在两个乳头之间交替，她灵活的手指开始挑逗她最私密的地方。她可能在这方面不是特别熟练，但她绝对很好地激起了你的性欲——特别是当她捏阴蒂有点太用力时发出的可爱的小喘息声。[pg]");
         menu();
         addButton(0,"坐下观看",sitAndWatchAmilySex);
         addButton(1,"爱抚她",caressAmilyHaveSex);
      }
      
      public function amilySexPlaytimeFirst() : void
      {
         clearOutput();
         amilySprite();
         outputText("当艾米莉开始伸手去拿她的衣服时，你没有开始自己脱衣服，而是拉近了你们之间的距离，握住了她的手。[pg]");
         outputText("[say: 你、你在干什么？]她问道，好奇又有些警惕。[pg]");
         outputText("你只是对她笑了笑，然后温柔地开始给她脱衣服，阻止她动一根手指去脱衣服，你调皮地替她脱下。至少，考虑到她的衣服有多简单，你尽可能地调皮。鼠娘很困惑，她有点脸红，但你觉得她很享受这种关注，你借此机会轻轻地挠她尾巴的根部，用手指挠她耳朵的边缘，后者让她忍不住咯咯笑了起来。当她赤身裸体地站在你面前时，你开始脱下自己的衣服。然而，令你惊讶的是，轮到她阻止你了。[pg]");
         outputText("[say: 这才公平，]她低吼道，但她微微脸红了。尽管因为不熟悉而显得笨拙，她还是尽力以尽可能色情的方式脱下你的[armor]，你不止一次地捕捉到她灵活的小手指犹豫地抚摸着你解剖结构中更有趣的部分。当你赤身裸体地站在她面前时，她仔细地打量着你，用鼻子深吸了几口气。[pg]");
         outputText("[say: 只是确保你没有……你知道的，染上什么不该染上的东西。]她轻声解释道。[pg]");
         dynStats(DynStat.Lust(5));
         amilySexPtII();
      }
      
      public function amilySexHappens() : void
      {
         var _loc2_:int = 0;
         var _loc3_:* = null as IMap;
         clearOutput();
         amilySprite(true);
         var _loc1_:int = get_player().cockThatFits(61);
         if(_loc1_ == -1 && get_player().hasCock())
         {
            outputText("艾米莉看着你的双腿之间，笑得弯下腰，[say: 那东西绝对塞不进我里面！在我们上床之前，你得想办法把那东西缩小！!]");
            _loc2_ = 38;
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,_loc2_,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,_loc2_) - 1);
            doNext(get_camp().returnToCampUseOneHour);
            return;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,42) == 0)
         {
            stickItInMouseTwatForTheFirstTimeNOTWORTHALLBULLSHIT();
            _loc3_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc3_,42,FlagDict_Impl_.arrayReadInt(_loc3_,42) + 1);
            return;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,38) < 15)
         {
            outputText("艾米莉带领你穿过废墟村庄的努力轻快而高效。你并不觉得她有多期待做这件事。不，那可能说得太夸张了。更像是她有一种印象，撇开细节不谈，你们俩之间的这次相遇将纯粹是公事。[pg]");
            outputText("你很难说这次你是否被带到了不同的路线，但很快你就到了艾米莉提供的私人卧室，她开始伸手去拿衣服，显然期待你也做同样的事情。[pg]");
            menu();
            addButton(0,"公事公办",amilySexBusiness);
            addButton(1,"游戏时间 1",amilySexPlaytimeFirst);
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,38) < 40)
         {
            _loc2_ = pregnancy.get_event();
            outputText("艾米莉像往常一样迅速地把你带到她的巢穴，但这次情况有些不同。你可以看出艾米莉的步伐中有一种只能被描述为“轻快”的东西。她走得稍微快了一点，她似乎对这个前景更加热情——她的尾巴甚至慢慢地左右摇摆，这是你以前从未见过的肢体语言。而且你确信她的臀部有一些诱人的扭动——这绝对是你以前从未见过的。");
            if(_loc2_ >= 1 && _loc2_ <= 5)
            {
               outputText("然而，她有时会摸摸自己隆起的肚子，那代表着她体内正在孕育的生命。每当这时，她的态度就会变得不确定和紧张。");
            }
            outputText("[pg]");
            outputText("一旦你进去了，艾米莉就会温柔地试图把你推到你们将要交配的床上。你坐下后，她带着戏谑的表情对你微笑，并开始慢慢地脱下自己的衣服，显然是想让这个过程看起来尽可能地色情。");
            if(_loc2_ >= 6)
            {
               outputText("然而，当她不得不完全露出那标志着她怀孕状态的隆起腹部时，她的自信明显下降了，但她还是鼓起勇气，开始向你展示它。");
            }
            menu();
            addButton(0,"介入",amilyStepTheFuckIn);
            addButton(1,"看表演",amilyEnjoyShow);
         }
         else if(pregnancy.get_event() >= 6)
         {
            fuckAmilyPreg();
         }
         else
         {
            amilyHighAffectionSecks();
         }
      }
      
      public function amilySexBusiness() : void
      {
         clearOutput();
         amilySprite();
         outputText("让艾米莉自己脱衣服，你急忙脱下自己的[armor]。当你们俩赤身裸体地站在对方面前时，艾米莉上下打量着你，然后闻了闻——不是出于蔑视，而是真的想好好闻闻你的气味。你推测这是一种检查，看看你自上次见面以来是否以某种方式被腐化了。[pg]");
         amilySexPtII();
      }
      
      public function amilyRingGiftingReaction(param1:int) : void
      {
         clearOutput();
         outputText("你告诉艾米莉你有一份礼物要送给她，但让她闭上眼睛，因为你想给她一个惊喜。她发出一声可爱的轻笑，说道：[say: 好吧。] 等艾米莉闭上眼睛后，你拿出买好的戒指，轻轻套在她的手指上。");
         outputText("[pg]她感觉到手指上冰凉的金属，微微歪了歪头，似乎不确定那可能是什么。当你让她睁开眼睛时，艾米莉看着你给她戴上的戒指。");
         switch(param1)
         {
            case 0:
               outputText("艾米莉满眼赞赏地盯着那个银色的指环。虽然它可能并不昂贵，但很容易看出，即使是这样一个简单的戒指对她来说也意义非凡。");
               saveContent.ringType = "silver";
               get_player().consumeItem(get_jewelries().SILVRNG);
               break;
            case 1:
               outputText("她手指上的金戒指闪闪发光，她惊讶地盯着它。");
               saveContent.ringType = "gold";
               get_player().consumeItem(get_jewelries().GOLDRNG);
               break;
            case 2:
               outputText("白金戒指似乎让她很惊讶。艾米莉可能从未想过你会送她这样的礼物。");
               saveContent.ringType = "platinum";
               get_player().consumeItem(get_jewelries().PLATRNG);
               break;
            case 3:
               outputText("她手指上的钻石戒指闪闪发光，眼睛瞪得像铜铃一样大。她无法掩饰脸上真实的惊讶。她可能从未想过会收到你送的如此昂贵的礼物。");
               saveContent.ringType = "diamond";
               get_player().consumeItem(get_jewelries().DIAMRNG);
         }
         outputText("女孩的声音颤抖着问道，[say:你给我买了一枚戒指？]");
         outputText("[pg]你解释说，虽然在做爱和生孩子<i>之后</i>才给她这个可能有点本末倒置，但你希望她能原谅你并喜欢它。艾米莉眼角含着泪水，突然拥抱了你。她靠在你身上，说道，[say:[Player]，我从未想过你会给我这样的东西。这对我来说意义重大。我爱你，我非常爱你。]艾米莉将嘴唇贴在你的嘴唇上，热情地亲吻你，你也高兴地回应。你双臂环绕着艾米莉的腰，将她紧紧抱在怀里。");
         outputText("[pg]你们俩拥抱在一起，享受着彼此的温暖片刻。最终，你松开了艾米莉，在你离开之前，她又给了你一个吻。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function amilyRingGifting() : void
      {
         var type3:int;
         var _g3:AmilyScene;
         var type2:int;
         var _g2:AmilyScene;
         var type1:int;
         var _g1:AmilyScene;
         var type:int;
         var _g:AmilyScene;
         clearOutput();
         outputText("你想给她什么？");
         menu();
         _g = this;
         type = 0;
         addNextButton("银戒指",function():void
         {
            _g.amilyRingGiftingReaction(type);
         }).disableIf(!get_player().hasItem(get_jewelries().SILVRNG));
         _g1 = this;
         type1 = 1;
         addNextButton("金戒指",function():void
         {
            _g1.amilyRingGiftingReaction(type1);
         }).disableIf(!get_player().hasItem(get_jewelries().GOLDRNG));
         _g2 = this;
         type2 = 2;
         addNextButton("铂金戒指",function():void
         {
            _g2.amilyRingGiftingReaction(type2);
         }).disableIf(!get_player().hasItem(get_jewelries().PLATRNG));
         _g3 = this;
         type3 = 3;
         addNextButton("钻石戒指",function():void
         {
            _g3.amilyRingGiftingReaction(type3);
         }).disableIf(!get_player().hasItem(get_jewelries().DIAMRNG));
         setExitButton("返回",amilyGiftMenu);
      }
      
      public function amilyReturns() : void
      {
         amilySprite();
         outputText("[pg]你醒来时，感觉到四肢幸福地缠绕在你的身体上，发现艾米莉蜷缩在你身边。她很快醒来，给了你一个快乐的微笑。[pg]");
         outputText("[say: 谢谢你，[name]。我不知道你是怎么做到的，也不知道这是否与我有关，但你成功地做到了我从未听说过任何人有意志去做的事情。你从恶魔的边缘回头，再次净化了自己。][pg]");
         outputText("她紧紧地抱住你，然后起身开始做早餐。[pg]");
         outputText("<b>艾米莉搬回来了。</b>[pg]");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,168,0);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,43,1);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,173,0);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,36,1);
      }
      
      public function amilyRemeetingContinued() : void
      {
         clearOutput();
         amilySprite();
         outputText("[say: 那么，你改变主意了吗？你是来帮我的吗？]艾米莉好奇地问。[pg]");
         menu();
         addButton(0,"接受",secondTimeAmilyOfferedAccepted);
         addButton(1,"礼貌拒绝",secondTimeAmilyRefuseAgain);
         addButton(2,"只是谈谈",repeatAmilyTalk);
         addButton(3,"滚开",tellAmilyToGetLost);
         setExitButton();
      }
      
      public function amilyReducto(param1:int) : void
      {
         var _loc3_:int = 0;
         var _loc4_:* = null as IMap;
         clearOutput();
         get_player().consumeItem(get_consumables().REDUCTO);
         var _loc2_:String = "";
         if(param1 == 0)
         {
            _loc2_ = "乳房";
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,47) > 6)
            {
               _loc3_ = 47;
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,_loc3_,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,_loc3_) - 1);
            }
            _loc3_ = 47;
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,_loc3_,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,_loc3_) - 1);
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,47) < 1)
            {
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,47,1);
            }
         }
         else if(param1 == 1)
         {
            _loc2_ = "乳头";
            if(FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,48) > 3)
            {
               _loc4_ = KFLAGS.flags;
               FlagDict_Impl_.arrayWriteFloat(_loc4_,48,FlagDict_Impl_.arrayReadFloat(_loc4_,48) - 0.5);
            }
            _loc4_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteFloat(_loc4_,48,FlagDict_Impl_.arrayReadFloat(_loc4_,48) - 0.5);
            if(FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,48) < 0.5)
            {
               FlagDict_Impl_.arrayWriteFloat(KFLAGS.flags,48,0.5);
            }
         }
         else if(param1 == 2)
         {
            _loc2_ = "臀部";
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,49) > 12)
            {
               _loc3_ = 49;
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,_loc3_,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,_loc3_) - 1);
            }
            _loc3_ = 49;
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,_loc3_,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,_loc3_) - 1);
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,49) < 6)
            {
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,49,6);
            }
         }
         else if(param1 == 3)
         {
            _loc2_ = "肉棒";
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) > 10)
            {
               _loc3_ = 45;
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,_loc3_,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,_loc3_) - 1);
            }
            _loc3_ = 45;
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,_loc3_,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,_loc3_) - 1);
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) < 4)
            {
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,49,4);
            }
            FlagDict_Impl_.arrayWriteFloat(KFLAGS.flags,46,1 + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) - 4) / 9);
         }
         else if(param1 == 4)
         {
            _loc2_ = "屁股";
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,50) > 10)
            {
               _loc3_ = 50;
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,_loc3_,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,_loc3_) - 1);
            }
            _loc3_ = 50;
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,_loc3_,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,_loc3_) - 1);
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,50) < 6)
            {
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,50,6);
            }
         }
         outputText("她对这种气味做了个鬼脸——对她敏感的鼻子来说，这气味一定很糟糕——她开始把它涂在她的" + _loc2_ + "上，你走上前去帮她。当最后一点药膏挥发掉时，那个部位开始在你眼前缩小。[say: 嗯。还不错吧，我想。那么，你还有什么想要的吗？]她问道。");
         doNext(amilyFollowerEncounter);
      }
      
      public function amilyPreggoChance() : void
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,43) == 1)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,166) == 0)
            {
               return;
            }
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1079) != 0)
         {
            return;
         }
         if(pregnancy.knockUpChance(25,100))
         {
            pregnancy.knockUpForce(25,168);
         }
      }
      
      public function amilyPostConfessionGirlRemeeting() : void
      {
         amilySprite();
         clearOutput();
         outputText("像往常一样，艾米莉看到你很高兴，但也很害羞。[say: 啊……[name]……很高兴再次见到你。][pg]");
         outputText("你表示赞同，然后问她是不是有什么事。[pg]");
         outputText("艾米莉紧张地蹭着地面。[say: 是这样的……你知道我爱你，对吧？但我也想——我<b>需要</b>——生孩子来复兴我的种族？][pg]");
         outputText("你点头同意，并问她到底想说什么。[pg]");
         outputText("她低头看着地面，不敢直视你的眼睛。[say: 我……我想，既然这是我的主意，我应该愿意改变我的身体来实现它……我应该长出阴茎。求你了，我爱你，我想和你生孩子。你觉得呢？][pg]");
         menu();
         addButton(0,"同意",amilyHermQuestAccept).hint("一个可爱的鼠娘，而且她还会长出鸡巴？梦想成真了。");
         addButton(1,"我来做",amilyHermQuestLetMe).hint("坦白说，你更希望自己长出鸡巴。");
         addButton(2,"慢点",amilyHermQuestWait).hint("你需要一些时间来考虑这件事。");
         addButton(3,"厌恶",amilyHermQuestDisgust);
      }
      
      public function amilyPopsOutKidsInCamp() : void
      {
         amilySprite(true);
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,40,FlagDict_Impl_.arrayReadInt(_loc1_,40) + 1);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,43) == 1)
         {
            outputText("[pg]营地的宁静突然被一声痛苦的尖叫打破。[say:[name]！是时候了！]艾米莉大喊，然后又尖叫了一声——你心里毫无疑问，她要生了。你跑过去，发现她赤身裸体地蹲在她的窝上，随着她肿胀的腹部明显地起伏，她因用力而发出轻柔的尖叫，液体从她肿胀、赤裸、粉红色的阴道中滴落。她绝对是要生了。[pg]");
            outputText("你熟练地跪在她身边，伸出手去触摸她肿胀的腹部，双手放在那球状肿块的两侧。你开始轻轻地按摩它，试图在每次肌肉收缩后放松和舒缓它们，并在它们经历另一次宫缩时减轻疼痛。她开始向你道谢，然后咬紧牙关，" + (amilyFurry() ? "把她的小" + (amilyFurry() ? "口鼻" : "嘴唇") + "朝向天空，并且" : "") + "在最强烈的宫缩袭来时痛苦地嘶嘶作响——她露头了！你的双手立刻向下探去，悬停在她的阴道下方，一个小小的、粉红色的、赤裸的、蠕动着的东西从她分开的嘴唇间滑落。这个小身体在你的手中出奇地轻，但当它吸入第一口气时，它大声地吱吱叫着。[pg]");
            outputText("你给了你的爱人一个令人安心的微笑，凭着经验熟练地把婴儿放在她的乳房上，然后继续接住下一个从她体内出来的婴儿。[pg]");
            outputText("这次的数量绝对和你上次看到她怀孕时一样多，很快它们就都和疲惫的母亲一起在草和树叶做成的窝里休息了。然而，你注意到它们比你以前看到的以这种方式出生和成长的孩子要小一些，精力也差一些。[pg]");
            outputText("[say:因为我的血液中只剩下微量的那些化学物质，所以它们发育和生长的速度比正常情况快一点，但从现在起，它们应该会正常衰老。]艾米莉说道。[pg]");
            outputText("你心中充满担忧；在这样一个地方，你到底要怎么照顾这些弱小、毫无防备的生物？然而，还没等你向艾米莉表达这种担忧，灌木丛中的沙沙声就引起了你的注意。你看着一对年轻的" + (amilyFurry() ? "鼠人" : "鼠族伙伴") + "出现，自信地走进你的营地。它们是你的两个孩子，就是艾米莉告诉过你已经离开这个地区的那两个。[pg]");
            outputText("[say:我希望你不要介意，[name]，但在我们确认我怀孕后不久，我就联系了它们，让它们来把新出生的弟弟妹妹带回去。]艾米莉有些不好意思地说。[say:我们在这里真的没法照顾它们，和所有的兄弟姐妹在一起，它们会更安全，也更快乐。][pg]");
            outputText("你点点头，承认你同意。一旦你恢复了体力，你花了一些时间和完全成年的孩子们交谈，并和你那些发育过度的初生儿玩耍。然后，随着最后一次挥手告别，" + (amilyFurry() ? "鼠人们" : "老鼠一家") + "再次消失在荒野中。");
         }
         else
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,436) == 0)
            {
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,436,1);
            }
            outputText("你决定去和你那大腹便便的鼠娘荡妇谈谈，但当你走近她经常潜伏的那片灌木丛时，你发现她心里在想别的事情……[pg]");
            outputText("[say: 对！哦，对，对，对！啊，太爽了——就是这样，宝贝们，给妈妈把这骚穴撑开！出来，快出来，小家伙们；[master]需要很多新的小老鼠荡妇来好好侍奉[him]，这是[he]应得的！]艾米莉在狂喜中尖叫，尾巴像鞭子一样抽打着周围，翅膀疯狂地拍打着。她背对着你蹲在空地上，淫液和羊水的混合物正从她扩张的阴户中涌出——很明显，她正在分娩，而且非常享受这一刻。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) > 0)
            {
               outputText("她双手握着自己的肉棒，疯狂地自慰着，精液像喷泉一样喷涌而出；然后溅到她起伏的双乳、脸庞和肚子上，尽管她的勃起丝毫没有消退的迹象。");
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,171) > 0)
            {
               outputText("她的睾丸颤抖着，在微风中摇晃，而它们后方的肉穴已经准备好将塞满她肿胀腹部的生命倾吐而出。");
            }
            outputText("她双眼翻白，脸上的表情扭曲成一种邪恶的高潮狂喜。[pg]");
            outputText("伴随着淫荡的呻吟，艾米莉喘息着，[say: 对，要出来了！要出来了！！]然后她失去了平衡，仰面躺倒，双腿大张；仿佛想让全世界都看到接下来要发生的事情。接着，分娩开始了……一股体液涌出");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) > 0)
            {
               outputText("紧接着喷出了一股精液");
            }
            outputText("标志着第一只小老鼠的降生。顶着宽大鼠耳的脑袋从艾米莉被撑开的阴唇间探了出来，它的小手也紧随其后；;");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,171) > 0)
            {
               outputText("它抓住艾米莉的蛋蛋，试图借力把自己拉出来；;");
            }
            outputText("随着一股体液润滑了它的下半身，它终于成功挣脱了母亲那不断渗液的产道，轻松地滑了出来。它刚一出来，另一个老鼠脑袋就开始显现；艾米莉呻吟着，尖叫着享受这不断重复的过程。[pg]");
            outputText("当最后一只" + (amilyFurry() ? "老鼠" : "鼠娘") + "终于挣脱了淫荡母亲小穴的束缚时，它们全都爬向母亲的乳房，轮流吸吮着母亲那堕落的乳汁。你只是微笑着观察；艾米莉的宝宝们各不相同，有些是女孩，有些是男孩，有些甚至兼具两性；它们都和母亲一样，有着淫靡的紫色" + (amilyFurry() ? "皮毛" : "肤色") + "；你忍不住想，它们会不会像它们的母亲一样，成为极品的精盆。随着它们的吸吮，你看到小宝宝们变得越来越大；不仅如此，你还看到小鸡巴变大，蛋蛋发育，乳房膨胀，小穴里渗出淫液。眼前的景象让你充满了喜悦。[pg]");
            outputText("几个孩子已经吃饱了，但还有一些在排队。[say: " + get_player().mf("主人","女主人") + "……]你听到艾米莉在欢愉的喘息和呻吟中呼唤着。你向她投去询问的目光。[say:我能喝你的吗？你性感的肉便器母狗需要更多的食物，才能为你刚出生的骚货们转化出美味的乳汁。][pg]");
            if(get_player().get_gender() == 0)
            {
               outputText("你告诉艾米莉现在没法喂她，所以她只能将就一下现有的。艾米莉撅了撅嘴，但还是继续了。你轻笑一声，给她下达了命令。[say:一定要把她们训练成合格的骚货，艾米莉，然后放她们走，让她们去积累一些实战经验，]你说，[say:遵命，[master]。]艾米莉说。你转过身，留她们自己折腾。");
               return;
            }
            if(get_player().hasCock() && (get_player().get_gender() == 1 || Utils.rand(2) == 0))
            {
               outputText("你微笑着脱下衣服，向艾米莉展示出");
               outputText("你勃起的[cock]");
               if(get_player().hasVagina())
               {
                  outputText("以及" + get_player().vaginaDescript(0));
               }
               outputText("；艾米莉满怀期待地舔了舔嘴唇。你跪在她的头上方，任由她伸出舌头舔舐你的[cock]顶端，然后将其吞入她的口中。即使姿势有些别扭，她依然能高效地为你口交，用她那美妙的舌头在她早已熟知的敏感处灵巧地挑逗。艾米莉熟练的吸吮和吞咽很快就让你濒临高潮，没过多久你便越过了那条界线，将一股又一股滚烫的精液射进艾米莉那急切又饥渴的喉咙里。");
               if(get_player().cumQ() >= 500)
               {
                  outputText("她的肚子鼓了起来，但她依然像往常一样高效地吞咽和吸吮着；确保不漏掉她[master]哪怕一滴珍贵的精液；看到艾米莉如此认真地对待她的工作，这景象足以让你自豪感爆棚；你决定用更多的精液来奖励她。");
               }
               outputText("[pg]");
            }
            else
            {
               outputText("你微笑着脱下衣服，向艾米莉展示出");
               if(get_player().hasCock())
               {
                  outputText("你勃起的[cock]以及");
               }
               outputText(get_player().vaginaDescript());
               outputText("；艾米莉满怀期待地舔了舔嘴唇。你蹲在艾米莉上方，悬停在她的" + (amilyFurry() ? "口鼻" : "脸") + "上" + "。");
               if(get_player().balls > 0)
               {
                  outputText("她挑逗地舔了舔你的蛋蛋，弄得你痒痒的；你不耐烦地告诉她快点开始，免得你改变主意去操别的东西。");
               }
               outputText("艾米莉毫不耽搁，立刻投入到她的任务中。她的舌头探索着你[vagina]的每一个角落和缝隙；就好像她有一张你欢愉洞穴每一个微小细节的地图；毫无疑问，这是你给她所有练习的结果。每隔一会儿，她的鼻子就会碰到你的[clit]，让快感的电流流遍你的全身，从你口中引出一声欢愉的呻吟，因为你越来越接近高潮。");
               if(get_player().wetness() >= 5)
               {
                  outputText("艾米莉毫不费力地处理着从你小穴中不断喷出的淫液，事实上，她尽其所能地确保你尽可能多地射进她饥渴的嘴里；你很高兴地注意到，甚至没有一小滴逃过她搜寻的舌头和吸吮的嘴。");
               }
               outputText("[pg]");
            }
            outputText("当你结束时，你意识到艾米莉的最后一个孩子已经吃饱了。你的孩子们敬畏地看着他们母亲微笑的脸和你沾满唾液的腹股沟。当你站起身，艾米莉也站起来跪在你身边时，孩子们用崇敬的目光看着你。[pg]");
            outputText("艾米莉深情地蹭了蹭你的胯部，然后说道，[say:看，" + get_player().mf("master","mistress") + "，我们的孩子已经迫不及待地想为您服务了。]你低头看着她，她也抬头看着你。最后，艾米莉转过身来对聚集的孩子们说，[say:抱歉，亲爱的们，但你们还没准备好为" + get_player().mf("master","mistress") + "服务。如果你们想要这个……]她说着，再次蹭了蹭你的胯部，[say:你们需要先积累一些经验。]孩子们都低下头，失望地呜咽着，因为他们无法靠近母亲的宝藏而感到难过。[say:好了，好了，别绝望，我美丽的小荡妇们。如果你们去外面的世界，我相信你们很快就能积累到为[master]服务所需的经验。现在给妈妈一个告别吻。][pg]");
            outputText("老鼠们立刻精神振奋，冲向艾米莉，她轮流给他们每个人一个吻；然后调皮地拍拍他们的小屁股，把他们一个个送进丛林。当最后一个离开时，你祝贺艾米莉是个好荡妇，生了这么多可爱有潜力的玩具，[say:谢谢" + get_player().mf("master","mistress") + "！]她高兴地说。然后她再次蹭了蹭你的胯部，补充道，[say:如果" + get_player().mf("master","mistress") + "想再次让我怀孕，尽管说。你的老鼠小荡妇随时准备接受并生出更多的荡妇来崇拜你，加入你的后宫，我的[master]。]你拍了拍她的头，离开去处理其他事务。");
            get_player().orgasm("Generic");
            dynStats(DynStat.Cor(3));
         }
      }
      
      public function amilyPCNewCock() : void
      {
         amilySprite();
         clearOutput();
         outputText("新鲜的空气让你在寻找你的鼠娘恋人时步伐轻快。你的寻找很短暂，因为艾米莉注意到了你并跑过来迎接你。[pg]");
         outputText("[say: [name]！我正希望能见到你！这次来只是聊聊天，还是……？] 她说着，目光下移到你的下体。你肆无忌惮地炫耀你新的[cock]，引得女孩瞪大了眼睛。[pg]");
         outputText("[saystart]我——我明白了！你……你真的做到了。它就在那儿。");
         if(get_player().longestCockLength() < 5)
         {
            outputText("我很感激你选了一个非常适中的尺寸。我还稍微有点担心你会弄得太夸张呢。[sayend]");
         }
         else if(get_player().longestCockLength() < 9)
         {
            outputText("它比老鼠通常的要大一点，但我想应该没问题。希望如此。[sayend]");
         }
         else
         {
            outputText("不——不过你非得把它弄得这么<b>大</b>吗！？尺寸并不会让它更有男子气概，你知道的！[sayend]");
         }
         outputText("你忍不住对她的震惊轻笑出声。她上次见你时，你还是个女人。说真的，任何人看到自己的拉拉情人掏出一根大鸡巴时都会震惊的，不管它有多大或者多奇特。你问艾米莉是想整天盯着它看，还是想实际体验一下。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,165,2);
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,38,FlagDict_Impl_.arrayReadInt(_loc1_,38) + 20);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,164,get_player().get_gender());
         doNext(amilySexHappens);
      }
      
      public function amilyNurseCheckupV2(param1:Boolean) : void
      {
         clearOutput();
         var _loc2_:int = get_player().cockThatFits(61);
         outputText("你走进了艾米莉的“办公室”。这其实只是一堆巨石，但看着这位鼠娘傲慢地环顾四周，并示意你坐在一块平坦的岩石上，你真的感觉自己回到了村里的医生那里，正在接受检查以确保身体健康。至于艾米莉，她看起来很不错……非常不错。她的" + amilyTits() + "完美地撑起了那件紧身、露出乳沟的上衣，而她的");
         switch(pregnancy.get_event())
         {
            case 2:
            case 3:
               outputText("微微隆起的孕肚则在下面暴露无遗");
               break;
            case 4:
            case 5:
               outputText("因怀孕而肿胀的肚子在下面圆鼓鼓地挺着");
               break;
            case 6:
            case 7:
            case 8:
               outputText("因怀孕而胀大的肚子在下面凸显出来");
               break;
            default:
               outputText("紧致的腰腹完全展露出来");
         }
         outputText("。紧身的下装简直就是一条超短裙，短到几乎把她的小穴暴露在你游移的目光中。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) > 0)
         {
            outputText("裙子被淫荡地撑起，隐约勾勒出她的" + amilyCock() + "的轮廓，它蜷缩着以留在有弹性的裙子里。");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) > 9)
         {
            outputText("但这显然是徒劳的，因为她巨大的肉棒对于这样紧身的遮盖物来说实在太大了，粗大的龟头向下弯曲，悬垂在下摆下方，危险地跳动着。");
         }
         outputText("为了让这身装扮更加完美，她头上戴着一顶带有红十字的白色小帽子，微微偏离中心。");
         outputText("[pg][say: 请[if (isnaked){坐|脱掉你的衣服}]，[name]，]她俏皮地背诵着，手里拿着一块平整的木板，这肯定是她匆忙中找来当写字板用的。[say: 那么，这里写着你在雌性周围会感到发热，尤其是年轻健康的鼠娘。我还看到上面提到了失控的性欲。是这样吗？]");
         outputText("[pg]你[if (isnaked){听着|边脱衣服边听着}]，按照指示坐在石头上，并对这些症状清单点头表示赞同。在你听来，这些描述相当准确。一只柔软的");
         if(!amilyFurry())
         {
            outputText("手");
         }
         else
         {
            outputText("爪子");
         }
         outputText("摸上了你的大腿，同时艾米莉将“写字板”放在了一边。");
         outputText("[pg]她说道：[say: 那我们开始检查吧，好吗？]");
         outputText("[pg]你点了点头，也许有些过于急切了，但艾米莉似乎并不介意。事实上，她的抚摸变得更加直接和充满暗示，顺着你的大腿向上滑到你的肚子，然后向下移动到你胯部上方敏感的[skinfurscales]上。她在那儿轻柔地打着圈摩擦，而她的另一只手则优雅地探索着你的背部。在这只发情的鼠娘面前赤身裸体、暴露无遗，你情不自禁地兴奋起来，那速度之快连你自己都吓了一跳。[EachCock]在瞬间勃起至最大尺寸，甚至因为勃起的力度而微微颤动。你大声呻吟起来，而艾米莉却把这当成了痛苦的表现。");
         outputText("[pg][say: 哦，我明白了，忍受这种病症一定很痛苦吧，]她喃喃自语着，手碰到了那根因欲望而粗胀的肉棒。她的手指顺着柱身轻抚而下");
         if(get_player().balls == 0)
         {
            outputText("，轻轻捏着测试它的充血程度，你已经兴奋到了极点，这种捏弄甚至让你感到有些疼痛。");
         }
         else
         {
            outputText("，最终停留在你的[sack]上。她尽职尽责地托起你的[balls]，");
            if(get_player().ballSize <= 4)
            {
               outputText("带着狡黠的微笑用手指揉捏着它们");
            }
            else
            {
               outputText("带着狡黠的微笑让手指陷入其中一颗肿胀的肉球中");
            }
            outputText(".");
         }
         outputText("艾米莉一直注视着你的脸，当你开始喘息时，她露出了诱惑的微笑。你没注意到这一点，因为你正忙着低头看她暴露在外的乳沟，那套紧身的下流护士服把她的胸部挤压得更加诱人。她在你敏感的生殖器上毫不掩饰地捏了一把，把你拉回了现实");
         if(get_player().hasVagina())
         {
            outputText("，同时一根调皮的手指滑入你的股沟，测试着那里的湿润度");
         }
         outputText(".");
         outputText("[pg]艾米莉解释道：[saystart]这是");
         if(get_player().balls > 0)
         {
            outputText("蓝蛋症");
         }
         else
         {
            outputText("勃起炎");
         }
         outputText("，我想。这是一种偶尔会影响像你这样异常强壮的雄性和双性人的病症。谢天谢地，它不是永久性的。[sayend]她放在你胯部的手捏弄并抚摸着你敏感的生殖器。[say: 当然，除非你希望它是永久的。]她慢慢地将你僵硬的肉棒从[sheath]撸到[cockHead biggest]，一边喋喋不休，一边挤出一滴前列腺液。[say: 我们有一种我一直在研发的新疗法，不过它还处于实验阶段。.]");
         outputText("[pg]你呻吟着：[say: 哦哦哦，那是什么？]");
         outputText("[pg]艾米莉突然松开你过度充血的肉棒，高高抬起一条腿搭在你的肩膀上，将那件淫荡的裙子拉到臀部，她的私处就这样赤裸裸地暴露在离你[face]仅几英寸的地方。[say: 鼠娘的小穴，]她喘息着。[saystart]一次又一次，直到那些调皮的精液全被榨干，你那");
         if(get_player().balls > 0)
         {
            outputText("饱满的囊袋");
         }
         else
         {
            outputText("坚挺的肉棒");
         }
         outputText("从折磨你的变态需求中解脱出来。[sayend]");
         outputText("[pg]当她的气味钻进你的鼻腔时，你的瞳孔因渴望而收缩成针尖大小。你倾身向前，将舌头径直塞进那个湿润的小穴，当你刺入这只老鼠滑腻的通道时，能感觉到那股湿热紧紧包裹着你的肌肉。");
         outputText("[pg][say: 对……这也是症状之一……无法抗拒性……性——哦哦，就是那里！性接触。你病得很重，不是吗？]当你侵犯她成熟的小穴时，艾米莉喘息着说道。");
         outputText("[pg]你在这女性的深渊中点点头，鼻子撞击并摩擦着她坚挺的阴蒂。你抬起双手，抓住你护士的" + amilyButt() + "，将她拉向你，好让你的舌头深入其中。她微微颤抖着，从你的抓握中挣脱出来，放下腿，有些虚弱地踉跄了一下，双腿似乎已经不听使唤了。这只湿润的鼠娘大口喘着粗气，从你的口舌攻势中恢复过来，但在几次呼吸后，她低语道：[say: 刚才很舒服，但现在是时候进行治疗了。.]");
         outputText("[pg]艾米莉解开上衣的扣子，任由她的乳房自由摇晃，同时爬");
         if(!get_player().isTaur())
         {
            outputText("到你的腿上");
         }
         else
         {
            outputText("到你马形的下半身旁");
         }
         outputText("。 [say: 放、放松点。一点都不会痛的，]她结结巴巴地说着，将她的入口对准你的" + get_player().cockDescript(_loc2_) + "，刺鼻的湿气如蒸汽般从她的私处阵阵散发出来。你的龟头慢慢拨开她闪闪发光的阴阜，伴随着一阵狂喜，你瘫倒在身后的巨石上，幸福地吐着舌头。娇小的老鼠缓慢地扭动着腰肢，将你越来越多的长度吞入她的小穴，那毛茸茸的鼠穴最终贴合在你的[hips]上，摩擦也随之带着些许歉意般地停顿下来。");
         outputText("[pg]鼠娘向后仰起头，兴奋地呻吟着，你感觉到她的通道紧紧挤压着你的" + get_player().cockDescript(_loc2_) + "，用宽容而柔软的压力包裹着它。她的分泌物慢慢滴落到你身上");
         if(get_player().cockTotal() > 1)
         {
            outputText("，同时她的手摸向了");
            if(get_player().cockTotal() > 2)
            {
               outputText("你的一根多余的肉棒");
            }
            else if(get_player().cockTotal() == 2)
            {
               outputText("你多余的肉棒");
            }
            outputText("。她缓慢地套弄着那根备用的肉棒，嘴里嘟囔着：[say: 治疗所有的症状。.]");
         }
         outputText(".");
         outputText("[pg]护士缓慢地将她紧紧吸附的小穴在你的肉棒上套弄，开始正式治疗你的病情。这显然很有效，因为你已经开始向她的小穴里缓慢地喷吐着预精。艾米莉仰起头，叫得更大声了，那顶滑稽的小帽子从她脑后掉落，她的头发随着每一次痉挛来回甩动。");
         outputText("[pg]这位娇小女性熟练的肉棒操纵技巧让你在她身下难耐地扭动，仿佛在极乐爆发的边缘徘徊了几个小时。她娇嗔道：[say: 给我，[name]！操你这个调皮、下贱的护士！把她操傻！对——！]当她高潮时，她的声音变得语无伦次，她的小穴开始用性感的、榨汁般的涟漪沿着你的整根肉棒向你发起攻势。[EachCock]喷射出精液作为回应，伴随着一阵紧缩的快感痉挛，冲击着你身体的每一根纤维。你的[hips]猛地向上挺动，力度之大，在你将精液注入她体内时，甚至把这只老鼠顶到了半空中。");
         if(get_player().cumQ() >= 500)
         {
            outputText("你稳定节奏的喷射持续了三十多秒，丝毫没有减弱，");
            if(!pregnancy.get_isPregnant())
            {
               outputText("慢慢地将艾米莉的子宫填满");
            }
            else
            {
               outputText("精液缓缓地从她的穴口溢出");
            }
            outputText(".");
            if(get_player().cumQ() >= 2000)
            {
               outputText("艾米莉拼命地抓紧你，因为");
               if(!pregnancy.get_isPregnant())
               {
                  outputText("她被完全填满了，她那柔软有弹性的腹部因为装满了浓稠的精液而淫靡地鼓起，随着每一次新的注入而晃动。");
               }
               else
               {
                  outputText("大量的精液从她的穴口喷涌而出，她的阴道已经满得装不下一滴了，而你的阴茎还在继续施加压力。");
               }
            }
            if(get_player().cumQ() >= 500)
            {
               outputText("这把你的胯部弄得一团糟，黏糊糊的。");
            }
         }
         outputText("[pg]你的身体瘫软下来，将最后的欲望释放在艾米莉痉挛的阴户里。她的身体最后一次抽搐，");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) > 0)
         {
            outputText("将黏稠的精液甩在你的[chest]上。她弓起背，继续向你喷射着她自己的淫液，");
         }
         outputText("然后她也瘫软在你身上，抱着你说：[say: 刚才真是……太激烈了。] 她试图站起来，但刚起到一半，双腿就软了下去。");
         if(get_player().hasKnot(_loc2_))
         {
            outputText("她再次尝试。这一次，是你的肉结将她牢牢地固定在原地，她就这样被堵了足足二十分钟，她的阴户浸泡在你的[cockanimalityadj " + (_loc2_ + 1) + "]精液中，享受着只有粗大的肉结才能带来的充实感。");
         }
         outputText("最后，她终于站了起来，离开了你。她的阴户湿漉漉的，沾满了白色的精液。");
         outputText("[pg]你站起身，亲吻了艾米莉的嘴唇，感谢她为你做的检查，然后捡起她的帽子重新戴在她的头上，并提到你不确定她的治疗是否奏效。");
         outputText("[pg]艾米莉歪着头，沉浸在事后的幸福中微笑着，双腿紧紧夹在一起，以留住你的精液。[say: 那我们最好为你下次的就诊预约一下，不是吗？]");
         if(!param1)
         {
            outputText("[pg](<b>解锁了艾米莉的护士角色扮演性爱选项！</b>)");
         }
         get_player().orgasm("Dick");
         dynStats(DynStat.Sens(-2));
         amilyPreggoChance();
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function amilyNurseCheckup() : void
      {
         var repeat1:Boolean;
         var _g1:AmilyScene;
         var repeat:Boolean;
         var _g:AmilyScene;
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,775) == 0)
         {
            get_player().consumeItem(get_armors().NURSECL);
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,775,1);
            outputText("你带着狡黠的笑容将这件诱人的衣服递给艾米莉。她起初有些困惑，但很快脸上就浮现出心领神会的俏皮笑容。她用衣服轻轻拍了你一下，打趣道：[say:这算什么，[name]？] 当她把衣服举在她的“资本”前时，布料被撑开了。[say:这可一点都不端庄！!]");
            outputText("[pg]她转向你，走近时尾巴在你的腿上摩擦，将那层薄薄的布料紧紧贴在她轻盈的身体上。[say:你想让我为了你穿得这么下流吗？看起来像个调皮的小护士？] 她一边琢磨着，耳朵一边抽动。");
            outputText("[pg]你试图回答，但还没说出半句话，艾米莉就蹦蹦跳跳地躲到了一些岩石后面，警告说：[say:不许偷看！] 换衣服时可以听到衣物摩擦的沙沙声，伴随着调皮的哼唱声。你尽力耐心地等待，但[eachCock]却感到一阵温热和焦急。");
            outputText("[pg]一个性感的嗓音柔声说道：[say:啊，[name]。进来吧，该体检了。.]");
            FlagDict_Impl_.arrayWriteString(KFLAGS.flags,52,"a naughty nurse\'s outfit");
            menu();
            _g = this;
            repeat = false;
            addButton(0,"继续",function():void
            {
               _g.amilyNurseCheckupV2(repeat);
            });
         }
         else
         {
            outputText("[say:你还想再做一次体检？] 艾米莉说。[say:好吧。我去拿衣服！] 她转过身，跑到一些岩石后面去拿那件暴露的白色“裙子”——如果那也能叫裙子的话，尾巴还顺势拍了一下你的[butt]。你带着毫不掩饰的兴奋等待着，百无聊赖地摆弄着大拇指打发时间。");
            outputText("[pg]终于，艾米莉悦耳的声音柔声传出：[say:该体检了，[name]。你总是跑回来，看来病情不轻啊。进来吧……...]");
            menu();
            _g1 = this;
            repeat1 = true;
            addButton(0,"继续",function():void
            {
               _g1.amilyNurseCheckupV2(repeat1);
            });
         }
      }
      
      public function amilyNoFur() : void
      {
         amilySprite();
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,336,1);
         outputText("你轻轻摇了摇头，解释说你的立场没有改变。艾米莉看起来有些恼火，但尊重你的决定。你打断了她接下来的想法，澄清道；你不想和她做爱是因为她的外表。[say: ……你什么意思？]她问道，一只手漫不经心地向上移动，拉扯着她的一只老鼠耳朵。你尽可能温和地解释说，老鼠（就此而言，还有耗子）在你的家乡被认为是害虫，你无法让自己有兴趣和一个会走路的害虫交配。[pg]");
         outputText("艾米莉消化着你的暗示，沉默了很长时间。[say: 你想让我……改变？]她轻声问道。[say: 那会……让你想和我交配吗？]你无法做出任何承诺，但你解释说，这肯定会改变你的考虑。[pg]");
         outputText("又是一阵漫长的沉默后，她叹了口气。[say: 我不知道。如果我只是……为了一个人类，把自己变成一个完全不同的人，我的家人会怎么说？]你慢慢走到她身边，把手放在她的肩膀上，强迫她再次看着你的眼睛。你坚持说，这不是因为她不再是老鼠。而是因为她为了她的种族而继续前进。听到这话，她勉强挤出了一丝微笑，表情稍微明朗了一些。[say: 我会考虑的，]她最终决定。[say: 如果你能找到一些非恶魔的试剂，也许我们可以试一试。不过，如果发生什么不好的事情，]她警告说，威胁地向你摇了摇手指。她退后一步，尴尬地站了一会儿。[pg]");
         outputText("[say: 那么，呃……再见，]艾米莉总结道，转过身走开了。你不能确定，但她似乎有点夸张地扭动着臀部。你没多想，回到营地，开始配制一种能让你的潜在繁衍伴侣脱离老鼠特征的混合物。也许……一颗<b>金色种子</b>用来获得人类的脸，一个<b>黑蛋</b>用来去除毛发，还有一些<b>纯净魅魔奶</b>来完善一切。你在心里暗暗记下这些成分，因为它们不会再出现了，如果你不知怎么地完全忘记了它们，你会觉得自己真的很蠢。[pg]");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function amilyNipples() : String
      {
         var _loc4_:int = 0;
         var _loc1_:Boolean = false;
         var _loc2_:String = "";
         if(Utils.rand(4) == 0)
         {
            if(FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,48) < 0.25)
            {
               _loc4_ = Utils.rand(3);
               if(_loc4_ == 0)
               {
                  _loc2_ += "微小的";
               }
               if(_loc4_ == 1)
               {
                  _loc2_ += "极小的";
               }
               if(_loc4_ == 2)
               {
                  _loc2_ += "小巧的";
               }
               if(_loc4_ == 3)
               {
                  _loc2_ += "娇小的";
               }
            }
            if(FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,48) >= 0.4 && FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,48) < 1)
            {
               _loc4_ = Utils.rand(5);
               if(_loc4_ == 0)
               {
                  _loc2_ += "突出的";
               }
               if(_loc4_ == 1)
               {
                  _loc2_ += "铅笔橡皮大小的";
               }
               if(_loc4_ == 2)
               {
                  _loc2_ += "惹眼的";
               }
               if(_loc4_ == 3)
               {
                  _loc2_ += "明显的";
               }
               if(_loc4_ == 4)
               {
                  _loc2_ += "引人注目的";
               }
            }
            if(FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,48) >= 1 && FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,48) < 2)
            {
               _loc4_ = Utils.rand(4);
               if(_loc4_ == 0)
               {
                  _loc2_ += "向前突出的";
               }
               if(_loc4_ == 1)
               {
                  _loc2_ += "硕大的";
               }
               if(_loc4_ == 2)
               {
                  _loc2_ += "肉感的";
               }
               if(_loc4_ == 3)
               {
                  _loc2_ += "巨大突出的";
               }
            }
            if(FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,48) >= 2 && FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,48) < 3.2)
            {
               _loc4_ = Utils.rand(5);
               if(_loc4_ == 0)
               {
                  _loc2_ += "细长的";
               }
               if(_loc4_ == 1)
               {
                  _loc2_ += "巨大的";
               }
               if(_loc4_ == 2)
               {
                  _loc2_ += "碍事的";
               }
               if(_loc4_ == 3)
               {
                  _loc2_ += "极其丰满的";
               }
               if(_loc4_ == 4)
               {
                  _loc2_ += "沉甸甸的";
               }
            }
            if(FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,48) >= 3.2)
            {
               _loc4_ = Utils.rand(4);
               if(_loc4_ == 0)
               {
                  _loc2_ += "庞大的";
               }
               if(_loc4_ == 1)
               {
                  _loc2_ += "沉重的";
               }
               if(_loc4_ == 2)
               {
                  _loc2_ += "难以掌控的";
               }
               if(_loc4_ == 3)
               {
                  _loc2_ += "拇指大小的";
               }
               if(_loc4_ == 4)
               {
                  _loc2_ += "肉棒大小的";
               }
               if(_loc4_ == 5)
               {
                  _loc2_ += "母牛般的";
               }
            }
            _loc1_ = true;
         }
         if(Utils.rand(3) == 0 && !_loc1_)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,51) > 0)
            {
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,51) <= 1)
               {
                  _loc4_ = Utils.rand(3);
                  if(_loc4_ == 0)
                  {
                     _loc2_ += "被乳汁润湿的";
                  }
                  if(_loc4_ == 1)
                  {
                     _loc2_ += "微微泌乳的";
                  }
                  if(_loc4_ == 2)
                  {
                     _loc2_ += "被乳汁沾湿的";
                  }
               }
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,51) > 1 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,51) <= 2)
               {
                  _loc4_ = Utils.rand(3);
                  if(_loc4_ == 0)
                  {
                     _loc2_ += "泌乳的";
                  }
                  if(_loc4_ == 1)
                  {
                     _loc2_ += "乳白色的";
                  }
                  if(_loc4_ == 2)
                  {
                     _loc2_ += "渗着乳汁的";
                  }
               }
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,51) > 2)
               {
                  _loc4_ = Utils.rand(4);
                  if(_loc4_ == 0)
                  {
                     _loc2_ += "滴着乳汁的";
                  }
                  if(_loc4_ == 1)
                  {
                     _loc2_ += "淌着乳汁的";
                  }
                  if(_loc4_ == 2)
                  {
                     _loc2_ += "漏着乳汁的";
                  }
                  if(_loc4_ == 3)
                  {
                     _loc2_ += "流着乳汁的";
                  }
               }
               _loc1_ = true;
            }
         }
         _loc4_ = Utils.rand(5);
         if(_loc4_ == 0)
         {
            _loc2_ += "乳头";
         }
         if(_loc4_ == 1)
         {
            if(FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,48) < 0.5)
            {
               _loc2_ += "挺立的乳头";
            }
            else
            {
               _loc2_ += "樱桃般的乳头";
            }
         }
         if(_loc4_ == 2)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,51) >= 1 && FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,48) >= 1)
            {
               _loc2_ += "乳头";
            }
            else
            {
               _loc2_ += "乳头";
            }
         }
         if(_loc4_ == 3)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,51) >= 1 && FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,48) >= 1)
            {
               _loc2_ += "乳头";
            }
            else
            {
               _loc2_ += "乳头";
            }
         }
         if(_loc4_ == 4)
         {
            _loc2_ += "乳头";
         }
         return _loc2_;
      }
      
      public function amilyNippleGrow() : void
      {
         var _loc2_:* = null as IMap;
         var _loc1_:int = getMaxSize(4,4,8);
         if(get_player().hasItem(get_consumables().WHITEEG))
         {
            get_player().consumeItem(get_consumables().WHITEEG);
            _loc2_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteFloat(_loc2_,48,FlagDict_Impl_.arrayReadFloat(_loc2_,48) + 0.25);
            FlagDict_Impl_.arrayWriteFloat(KFLAGS.flags,48,int(FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,48) * 100) / 100);
         }
         else
         {
            get_player().consumeItem(get_consumables().L_WHTEG);
            _loc2_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteFloat(_loc2_,48,FlagDict_Impl_.arrayReadFloat(_loc2_,48) + 0.7);
            FlagDict_Impl_.arrayWriteFloat(KFLAGS.flags,48,int(FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,48) * 100) / 100);
         }
         if(FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,48) > _loc1_)
         {
            FlagDict_Impl_.arrayWriteFloat(KFLAGS.flags,48,_loc1_);
         }
      }
      
      public function amilyNewGenderConfrontation() : void
      {
         var _loc2_:* = null as IMap;
         amilySprite();
         clearOutput();
         var _loc1_:Number = FlagDict_Impl_.arrayReadInt(KFLAGS.flags,164);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,164,get_player().get_gender());
         outputText("突然，艾米莉停了下来，看起来很困惑，她的鼻子抽动着。[say: 你变了吗……？是的，你变了！你一直在摆弄那些到处出现的奇怪药水和东西——你改变了你的性别，不是吗？][pg]");
         outputText("你点点头，承认你变了。[pg]");
         if(_loc1_ == 1)
         {
            if(get_player().get_gender() == 2)
            {
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,38) < 15)
               {
                  outputText("[say: 哦，太棒了。现在我该拿你怎么办？你到底为什么要搞砸这个？]艾米莉抱怨道。她摇了摇头。[say: 晚点再来——我现在太沮丧了，不想和你说话。]她气冲冲地走了，你决定最好听取她的建议。[pg]");
               }
               else
               {
                  if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,38) >= 40)
                  {
                     outputText("艾米莉看起来很沮丧，然后她的表情变成了决心。[say: 我不会假装知道这是怎么发生的，或者理解你为什么要自愿这样做，如果是这样的话，但你对我来说太重要了，我不能让你因为这种事情而离开。]她紧紧抓住你的手，开始坚定地拉着你走。[say: 跟我来！]她命令道。");
                     doNext(girlyGirlMouseSex);
                     return;
                  }
                  outputText("[say: 我……我……你为什么要那样做？]艾米莉问道，看起来很受伤。[say: 我……不，这不是你为了伤害我而做的努力，对不起，我太自私了。]她道歉。[say: 但是……我不知道我们还能做什么。我……我需要时间思考。]她转身走开，你决定给她她想要的东西。");
               }
            }
            else if(get_player().get_gender() == 3)
            {
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,38) < 15)
               {
                  outputText("[say: ……你现在是扶她了吗？]她问道，听起来很震惊。当你确认时，她厌恶地做鬼脸。[say: 离我远点！在你完全恢复男儿身之前，你别想再靠近我的床！]她命令道，然后气冲冲地走了。[pg]");
               }
               else
               {
                  if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,38) >= 40)
                  {
                     outputText("[say: 我……]她艰难地咽了口唾沫。[say: 我必须承认，这是一个巨大的冲击，但是……但是我太在乎你了，不能失去你。我不在乎你现在是不是有自己的小穴。我仍然想和你在一起。]她对你虚弱地笑了笑。[say: 所以，正如我所说，你想谈什么？][pg]");
                     FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,165,2);
                     amilyVillageMenu();
                     return;
                  }
                  outputText("她看起来被吓到了。[say: 我……对不起，但我想我不能和你同床共枕了，再也不能了。求求你，想办法变回男性，然后再回到我身边好吗？]她恳求道，然后溜走了。[pg]");
               }
            }
            else
            {
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,38) >= 15)
               {
                  if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,38) < 40)
                  {
                     outputText("她悲伤地摇了摇头。[say: 我猜这有点阻碍了我们的关系，不是吗？不过，我总是愿意和你谈谈。][pg]");
                     amilyVillageMenu();
                     return;
                  }
                  outputText("她看起来很沮丧和担心——但为了你，不是为了她。[say: 我无法想象是什么灾难这样剥夺了你。求求你，想办法变回来好吗？男人，女人，甚至扶她，我不忍心看到你这样……但我会给你我能给的所有支持。][pg]");
                  amilyVillageMenu();
                  return;
               }
               outputText("她轻蔑地看着你。[say: 你怎么能这么愚蠢，把自己所有的性别都去掉了？从我眼前消失，直到你再次成为一种性别或另一种性别再回来！]然后她气冲冲地走了。[pg]");
            }
         }
         else if(_loc1_ == 2)
         {
            if(get_player().get_gender() == 1)
            {
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,165) == 3)
               {
                  FlagDict_Impl_.arrayReadInt(KFLAGS.flags,165);
                  outputText("艾米莉喘着粗气，[say: 你变了？完全变了？我……谢谢你。我不敢对你要求这么多，但这对我很重要。][pg]");
                  _loc2_ = KFLAGS.flags;
                  FlagDict_Impl_.arrayWriteInt(_loc2_,38,FlagDict_Impl_.arrayReadInt(_loc2_,38) + 20);
                  FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,39,1);
                  doNext(amilySexHappens);
                  return;
               }
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,38) < 15)
               {
                  outputText("艾米莉看起来非常惊讶。[say: 你……你把自己从女人变成了男人？……为了我？]她尴尬地在地上蹭了蹭脚。[say: 我……我不知道该说什么。但是……既然你已经改变了，你愿意听我把话说完吗？][pg]");
                  _loc2_ = KFLAGS.flags;
                  FlagDict_Impl_.arrayWriteInt(_loc2_,38,FlagDict_Impl_.arrayReadInt(_loc2_,38) + 15);
                  if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,162) > 0)
                  {
                     FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,39,1);
                     amilyVillageMenu();
                     return;
                  }
               }
               else
               {
                  if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,38) >= 40)
                  {
                     outputText("她看起来很高兴，但随后又装出一副夸张的恼怒表情。[say: 你费了那么大劲以女人的身份勾引我，现在却变成了一个男人？你为什么要让我经历这些？] 她同样夸张地叹了口气，然后又笑了。[say: 哎，好吧，现在我们可以重新开始了，不是吗？让我看看新的你在床上是什么样子的。] 她做了一个“过来”的表情，然后调皮地跑进了废墟，并确保你跟在她后面。[pg]");
                     FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,39,1);
                     doNext(amilySexHappens);
                     return;
                  }
                  outputText("她看起来很惊讶，不知道该说什么。[say: 我……谢谢你。我确实觉得我们变得更亲密了，但这会让事情变得容易得多……...]");
                  _loc2_ = KFLAGS.flags;
                  FlagDict_Impl_.arrayWriteInt(_loc2_,38,FlagDict_Impl_.arrayReadInt(_loc2_,38) + 5);
                  if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,162) > 0)
                  {
                     FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,39,1);
                     amilyVillageMenu();
                     return;
                  }
               }
            }
            else if(get_player().get_gender() == 3)
            {
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) != 0)
               {
                  outputText("艾米莉上下打量着你，脸红着说，[say: 你是不是有点嫉妒我，决定自己找点乐子？我-我不想变成这样，但我想我们现在都可以为我的种族繁衍后代了。多好啊。.]");
                  FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,165,2);
                  amilyVillageMenu();
                  return;
               }
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,38) < 15)
               {
                  outputText("她看了你很久，然后难以置信地摇了摇头。[say: 哪个脑子正常的女人会长出鸡巴？哎，好吧，把小穴去掉，然后你和我可能还有点话可说。但是，现在，我们只谈话。.]");
               }
               else
               {
                  if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,38) >= 40)
                  {
                     outputText("她上下打量着你，用力咽了口唾沫，然后看起来很坚定。[say: 我……我做梦也没想到我会对一个双性人说这种话，但是……但是我了解你，我爱你。如果你还想和我在一起，我会留在你身边。] 她对你苦笑了一下。[say: 此外，我想这意味着现在你和我无论如何都可以有孩子了。.]");
                     FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,165,2);
                     amilyVillageMenu();
                     return;
                  }
                  outputText("[say: 我……别误会，[name]，但是……我不确定当你还有那个的时候，我们还能不能在一起。要么做这个，要么做那个，不能两者兼得。] 艾米莉说道。[say: 但我们这次还是可以谈谈的。.]");
               }
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,38) < 15)
            {
               outputText("她轻蔑地看着你。[say: 你怎么能这么愚蠢，把自己所有的性别都去掉了？从我眼前消失，直到你再次成为一种性别或另一种性别再回来！]然后她气冲冲地走了。[pg]");
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,38) < 40)
            {
               outputText("她悲伤地摇了摇头。[say: 我猜这有点阻碍了我们的关系，不是吗？不过，我总是愿意和你谈谈。][pg]");
            }
            else
            {
               outputText("她看起来很沮丧和担心——但为了你，不是为了她。[say: 我无法想象是什么灾难这样剥夺了你。求求你，想办法变回来好吗？男人，女人，甚至扶她，我不忍心看到你这样……但我会给你我能给的所有支持。][pg]");
            }
         }
         else if(_loc1_ == 3)
         {
            if(get_player().get_gender() == 1)
            {
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,38) >= 15)
               {
                  if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,38) < 40)
                  {
                     outputText("[say: 我本来已经开始习惯你那样了……但我很高兴你为我做出了这样的改变。] 她微笑着对你说。[pg]");
                     _loc2_ = KFLAGS.flags;
                     FlagDict_Impl_.arrayWriteInt(_loc2_,38,FlagDict_Impl_.arrayReadInt(_loc2_,38) + 2);
                     FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,39,1);
                     amilyVillageMenu();
                     return;
                  }
                  outputText("[say: 我对你以前的样子很满意，你没必要为了我改变……] 艾米莉说道，显然看起来很内疚。当你向她保证你是自愿这样做的时候，她高兴起来。[say: 好吧，我很高兴你是个纯爷们——那么，你想谈什么？]");
                  _loc2_ = KFLAGS.flags;
                  FlagDict_Impl_.arrayWriteInt(_loc2_,38,FlagDict_Impl_.arrayReadInt(_loc2_,38) + 2);
                  FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,39,1);
                  amilyVillageMenu();
                  return;
               }
               outputText("她打量了你一下，笑了。[say: 嗯，现在这样好多了。你和我，我们需要谈谈……...]");
               _loc2_ = KFLAGS.flags;
               FlagDict_Impl_.arrayWriteInt(_loc2_,38,FlagDict_Impl_.arrayReadInt(_loc2_,38) + 5);
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,165) == 2)
               {
                  FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,39,1);
               }
            }
            else
            {
               if(get_player().get_gender() == 2)
               {
                  if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,38) < 15)
                  {
                     outputText("[say: 嗯，我想看到另一个女人在身边也不错……虽然我本来可以把你当成纯爷们来用的。那么，你想谈谈吗？] 艾米莉问道。[pg]");
                     _loc2_ = KFLAGS.flags;
                     FlagDict_Impl_.arrayWriteInt(_loc2_,38,FlagDict_Impl_.arrayReadInt(_loc2_,38) + 2);
                     amilyVillageMenu();
                     return;
                  }
                  if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,38) < 40)
                  {
                     outputText("[say: 你没必要为了我改变自己……但是，我确实喜欢有一个能真正理解这个世界生活是什么样的人。] 艾米莉指出。");
                     amilyVillageMenu();
                     return;
                  }
                  outputText("艾米莉看起来有点失望。[say: 无论你是谁，我都会永远爱你，但是……我有点习惯你那根漂亮的鸡巴了，亲爱的。] 她摇了摇头。[say: 哎，好吧，如果是你，那么性对我来说就是性。] 她笑了。");
                  FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,159,2);
                  amilyVillageMenu();
                  return;
               }
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,38) >= 15)
               {
                  if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,38) < 40)
                  {
                     outputText("她悲伤地摇了摇头。[say: 我猜这有点阻碍了我们的关系，不是吗？不过，我总是愿意和你谈谈。][pg]");
                     amilyVillageMenu();
                     return;
                  }
                  outputText("她看起来很沮丧和担心——但为了你，不是为了她。[say: 我无法想象是什么灾难这样剥夺了你。求求你，想办法变回来好吗？男人，女人，甚至扶她，我不忍心看到你这样……但我会给你我能给的所有支持。][pg]");
                  amilyVillageMenu();
                  return;
               }
               outputText("她轻蔑地看着你。[say: 你怎么能这么愚蠢，把自己所有的性别都去掉了？从我眼前消失，直到你再次成为一种性别或另一种性别再回来！]然后她气冲冲地走了。[pg]");
            }
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,38) < 15)
         {
            outputText("艾米莉鄙夷地看着你，但你还是忍不住注意到，当看到你有一个");
            if(get_player().hasCock())
            {
               outputText(get_player().cockDescript(0));
               if(get_player().hasVagina())
               {
                  outputText("和");
               }
            }
            if(get_player().hasVagina())
            {
               outputText(get_player().vaginaDescript());
            }
            outputText("时，她流露出了一丝宽慰。[say: 也许你终究没那么蠢，] 这只老鼠嘟囔着，然后轻快地走开了。");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,38) < 40)
         {
            outputText("她注意到你有一个");
            if(get_player().hasCock())
            {
               outputText(get_player().cockDescript(0));
               if(get_player().hasVagina())
               {
                  outputText("和");
               }
            }
            if(get_player().hasVagina())
            {
               outputText(get_player().vaginaDescript());
            }
            outputText("，然后对你笑了笑。[say:我想这意味着我们可以继续我们的任务了？]你点头确认。鼠娘点了点头，但转身离开了。看来她需要一点时间来适应这个新的发展。[pg]");
         }
         else
         {
            outputText("当艾米莉凝视着你恢复的生殖器时，她立刻抱住你，给了你一个深吻；");
            if(get_player().hasCock())
            {
               outputText("让你的[cock]勃起");
            }
            if(get_player().hasVagina() && get_player().hasCock())
            {
               outputText("和");
            }
            if(get_player().hasVagina())
            {
               outputText("让你的" + get_player().vaginaDescript(0) + "紧缩");
            }
            outputText("。[say:我很高兴你恢复了性别！]");
            outputText("[pg]艾米莉转过身，迈着轻快的步伐走开了。显然她很高兴，但她仍然需要一些时间来适应。");
            dynStats(DynStat.Lust(25 + get_player().sens / 10));
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function amilyNewCock() : void
      {
         amilySprite();
         clearOutput();
         outputText("回到你那鼠娘恋人的住所，你环顾四周，希望她没有还在外面收集她需要的材料。当你听到她呼唤你时，你正准备回家。[pg]");
         outputText("[say: [name]！你回来了！我刚才只是在到处走走——我想是在踱步。抱歉我没早点注意到你。] 艾米莉看起来有点紧张，但看到你还是非常高兴。你满怀期待地瞥了一眼她仍然穿着衣服的下体。她注意到你的目光，紧张地夹紧了大腿。[pg]");
         outputText("[say: 呃，对，那个……嗯，我做了……不过，我还是很紧张，不敢给你看。这就是为什么我在等你的时候一直在踱步。][pg]");
         outputText("你告诉她没什么好紧张的，你已经接受了。你爱她，而且，如果有什么的话，你很兴奋能用上她的鸡巴。艾米莉一想到这个就脸红了，颤抖着拉下她破烂的裤子，露出了一根立刻变硬的人形阴茎。它看起来不超过4英寸长，对于像她这样娇小的女孩来说，这是一个相当合适的尺寸。[pg]");
         outputText("艾米莉结结巴巴地说话时把头转了过去。[say: 所——所以，呃，就是这样。一想到……我们要用它做什么，它就已经硬了。.]");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,45,4);
         FlagDict_Impl_.arrayWriteFloat(KFLAGS.flags,46,1);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,165,0);
         doNext(hermilyOnFemalePC);
      }
      
      public function amilyMenu(param1:Boolean = true) : void
      {
         var _g2:Camp;
         var _g1:AmilyScene;
         var _g:Camp;
         menu();
         var _loc2_:String = "";
         var _loc3_:Function = null;
         var _loc4_:String = "";
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,43) == 1)
         {
            if(get_player().hasCock() || get_player().hasVagina() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) > 0)
            {
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,166) == 0)
               {
                  outputText("艾米莉目前正在服用避孕草药，以保持不孕状态。[pg]");
                  _loc2_ = "生宝宝";
                  _loc3_ = makeChildren;
                  _loc4_ = "要求艾米莉停止服用草药，让她怀孕。";
                  if(izmaFollower() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,771) == 0 && get_player().hasCock() && !get_izmaScene().pregnancy.get_isPregnant() && !pregnancy.get_isPregnant())
                  {
                     _loc3_ = amilyXIzmaSuperPregOptions;
                  }
               }
               else
               {
                  outputText("艾米莉目前已经停用了避孕草药，可能会怀孕。[pg]");
                  _loc2_ = "不生宝宝";
                  _loc3_ = makeChildren;
                  _loc4_ = "要求艾米莉开始服用草药，防止怀孕。";
               }
            }
            addButton(0,"外貌",amilyAppearance);
            addButton(1,"交谈",talkToAmilyCamp);
            addButton(2,"做爱",fuckTheMouseBitch);
            addButton(5,"送礼物",amilyGiftMenu);
            addButton(6,_loc2_,_loc3_).hint(_loc4_);
            if(!get_noFur())
            {
               addRowButton(1,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,337) == 0 ? "脱毛" : "长毛",FlagDict_Impl_.arrayReadInt(KFLAGS.flags,337) == 0 ? amilyDefurryOfferAtCamp : refuzzAmily).hint(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,337) == 0 ? "给艾米莉一些东西来去除她的毛发。" : "给艾米莉一些东西来重新长出她的毛发。");
            }
            if(isWinter())
            {
               addRowButton(1,"拥抱",amilyWinterCuddles).hint("温暖这只小老鼠。");
            }
            if(get_time().hours > 20)
            {
               addButton(9,"同睡",amilySleepWith);
            }
            addButton(10,"约会",datesMenu).hint("和艾米莉去某个地方。");
            if(get_kihaFollowerScene().saveContent.badCookingTasted == 1)
            {
               addRowButton(2,"烹饪",amilyCookingLesson);
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2078) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2078) < 100)
            {
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2226) == 0)
               {
                  addRowButton(2,"摧毁林地",amilyDestroyGladesToggle).hint("要求艾米莉摧毁她能找到的任何腐化林地。");
               }
               else
               {
                  addRowButton(2,"停止摧毁",amilyDestroyGladesToggle).hint("要求艾米莉停止摧毁腐化林地。");
               }
            }
            if(get_player().hasItem(get_consumables().LIDDELL) && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2727) >= 0)
            {
               addRowButton(2,"奇怪药水",idLiddellium);
            }
            if(get_player().get_armor().get_id() == get_armors().VINARMR.get_id() && (get_game().swamp.alrauneScene.saveContent.questAsked & get_game().swamp.alrauneScene.ASKEDAM) == 0)
            {
               addRowButton(2,"藤蔓",get_game().swamp.alrauneScene.askAmily).hint("知道怎么解决这个吗？");
            }
            _g = get_camp();
            addButton(14,"离开",function():void
            {
               _g.campLoversMenu();
            });
         }
         else
         {
            addButton(0,"外貌",amilyAppearance);
            _g1 = this;
            addButton(1,"交谈",function():void
            {
               _g1.talkWithCORRUPTCUNT();
            });
            addButton(2,"做爱",fuckTheMouseBitch);
            addButton(5,"赠送物品",giveAmilyAPresent);
            if(!get_noFur())
            {
               addButton(6,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,337) == 0 ? "除毛" : "长毛",FlagDict_Impl_.arrayReadInt(KFLAGS.flags,337) == 0 ? amilyDefurryOfferAtCamp : refuzzAmily).hint(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,337) == 0 ? "给艾米莉一些东西来去除她的毛发。" : "给艾米莉一些东西来重新长出她的毛发。");
            }
            _g2 = get_camp();
            addButton(14,"离开",function():void
            {
               _g2.campSlavesMenu();
            });
            if(!pregnancy.get_isPregnant() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1079) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1077) == 1)
            {
               addButton(10,"农场工作",sendCorruptCuntToFarm).hint("派艾米莉去农场工作。");
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1079) == 1)
            {
               addButton(10,"回营地",backToCamp).hint("把艾米莉送回你的营地。");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1096) == 0)
               {
                  addButton(11,"挤奶",harvestMilk);
               }
               else
               {
                  addButton(11,"停止挤奶",stopHarvestingMilk);
               }
               addButton(14,"返回",get_game().farm.farmCorruption.rootScene);
            }
         }
         button(0).hint("检查艾米莉的外貌。");
         button(1).hint("和艾米莉讨论一些事情");
         button(2).hint("向艾米莉提议做些性感的事情。");
         unlockCodexEntry(2740);
      }
      
      public function amilyLesboStopHer() : void
      {
         amilySprite();
         clearOutput();
         outputText("不过，在她走远之前，你伸出手抓住了她的肩膀。她刚想问你要做什么，你就把她转过来，紧紧地抱在怀里，告诉她你也有同样的感觉。她害羞地献上双唇，你急切地吻了上去。当你们分开换气时，你问她想不想体验一下和另一个女人在一起的感觉。她眼神迷离，默默地对你点了点头，开始拉着你沿着街道走去。[pg]");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,159,2);
         doNext(girlyGirlMouseSex);
      }
      
      public function amilyLesboLetHerGo() : void
      {
         amilySprite();
         clearOutput();
         outputText("你看着她离去，心里有些内疚，但你就是对女人不感兴趣。你只能希望她会没事。[pg]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,38) > 10)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,38,10);
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function amilyLaysEggsLikeABitch() : void
      {
         amilySprite(true);
         outputText("[pg]当你在营地周围闲逛时，你听到艾米莉的窝的方向传来一阵轻柔的吱吱声。你很好奇，悄悄走过去看看是什么动静。当你到达那里时，你睁大了眼睛，看到你经常被束缚的爱人正躺在她柔软的床上放松，下半身完全赤裸。她的双腿张得很开，让你完美地看到她的两个洞，她正快速地");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) == 0)
         {
            outputText("挑逗着她的阴蒂");
         }
         else
         {
            outputText("挤压着她的肉棒");
         }
         outputText("一只手，另一只手吸引了你的目光，它在她的上衣下面移动，显然是在抚摸她的乳房。");
         outputText("[pg]眼前的景象让你大吃一惊，你呆呆地看了好一会儿才注意到艾米莉大腿间聚集的一小堆闪闪发光的球体。你很快就明白了，因为另一个覆盖着黏液的球体加入了它们，伴随着一阵轻柔的呻吟，从女孩紧致的屁股里挤了出来。看起来她已经这样做了有一段时间了，虽然你怀疑她离结束还差得远。");
         outputText("[pg]又一颗" + (buttPregnancy.get_type() == 15 ? "蜘蛛" : "蜜蜂") + "卵从她体内流出，上面仍然覆盖着你“存款”时留在她体内的浓稠黏液。艾米莉因为卵撑开她后庭的方式而紧绷，");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) == 0)
         {
            outputText("小穴明显地颤抖着");
         }
         else
         {
            outputText("肉棒渗出一大滴前列腺液");
         }
         outputText("她的身体因快感而颤抖。");
         outputText("[pg]你决定让女孩继续她的动作，");
         if(get_player().canOviposit())
         {
            outputText("尽管眼前的景象确实让你开始思考下一窝蛋该怎么处理。[pg]");
         }
         else
         {
            outputText("尽管下体明显的燥热让你恨不得现在就能再卸下一窝蛋。[pg]");
         }
         dynStats(DynStat.Lust(5 + get_player().lib / 10),DynStat.NoScale);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,629,0);
      }
      
      public function amilyKidMeetingLeave() : void
      {
         clearOutput();
         outputText("你告诉艾米莉，如果她想走，她可以走，但你会留在这里。");
         outputText("[pg]起初她不太明白，向你确认，但很快就完全泄了气，眼神空洞，声音有些沙哑地说：[say:我……我明白了。如果你以后……不，没关系。我走了。] 她转过身时浑身发抖，你甚至惊讶她还能好好走路，但她很快就稳住了步伐，以惊人的速度跑开了，直到消失在视线中。");
         outputText("[pg]好吧，没关系，你确信你的孩子们只要能见到他们的母亲就会很高兴的。");
         saveContent.metKids = -1;
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function amilyKidMeetingGo() : void
      {
         clearOutput();
         outputText("她的喜悦充满了感染力，你很快就发现自己牵着她的手跟在她身后，听她喋喋不休地说着想问孩子们的事情，以及她所担心的一切。你被她拉着一路前行，直到看见地平线上出现了一小团灰色的斑块。那斑块缓慢而稳定地变大，直到你能看清其中一只只老鼠的身影。");
         outputText("[pg]在等待你们的后代到来时，艾米莉在你身边几乎要蹦起来了。幸运的是，等待的过程并不算太难熬，你很快就听到了第一声预示着孩子们到来的各种吱吱声和呼唤声。");
         outputText("[pg]当他们真正来到你面前时，场面陷入了几分钟的彻底混乱。一支名副其实的孩子大军争相吸引你的注意力，你完全忙于握住伸过来的手和接受扑面而来的拥抱。很难不踩到任何尾巴，但你应对得还算不错，最终，你成功地与在场的所有老鼠都打了招呼。");
         outputText("[pg]你们一群人转移到了营地正中，在中央的火堆旁坐下，你的许多孩子利用方便的石头、圆木、木桶和其他杂物当家具。你和他们所有人聊得很开心，尽管他们都出自同一个源头，但你对他们展现出的丰富个性和经历感到惊讶。");
         outputText("[pg]你能看出来艾米莉和你一样享受，甚至比你更享受。她在家人中间欢笑、微笑、跳舞，闪耀着光芒，被她劳动的果实所包围。看着她沉浸在共同的爱中，你的胸膛深处涌起一股暖流，你决定就坐在那里看她一会儿。");
         outputText("[pg]这样的事情在这个世界上太罕见了，所以你珍惜每一秒。");
         outputText("[pg]经过几个小时的欢闹和狂欢，很明显人群的精力正在衰退。几只最年长的老鼠开始做准备，把年轻的老鼠聚集起来，确保每个人都在。");
         outputText("[pg]当一切都结束后，老鼠们排成一排，挨个向你道别。这里有哭泣、玩笑和拥抱，一个小鼠娘甚至在你的脸颊上印下了一个温暖的吻。但最终，他们不得不离开。当这群快乐的人出发返回他们的村庄时，你向他们挥手告别。艾米莉站在你身边，即使她的嘴唇微微颤抖，也努力保持坚强。现在看着他们离开可能会有些伤感，但想到他们在外面，不仅活着，而且繁荣昌盛，你的心里就充满了温暖，这种温暖将持续到深夜。");
         saveContent.metKids = 1;
         doNext(get_camp().returnToCampUseFourHours);
      }
      
      public function amilyKidMeeting() : void
      {
         clearOutput();
         outputText("正当你伸展四肢、稍作放松时，身后传来一个充满活力的声音，将你拉回现实。转过身，你看到艾米莉正兴奋地挥着手向你跑来。");
         outputText("[pg][say:[Name]！[Name]！哦，你现在必须跟我走。玛莱保佑，我简直坐不住了！!]");
         outputText("[pg]她这副激动的样子非常可爱，但如果她不冷静下来，你什么也问不出来。于是你让她深呼吸，从头说起。她听从了你的建议，放慢节奏，集中精神，然后才开始好好解释。");
         outputText("[pg][say:是我们的孩子们，[name]，他们来看我们了！他们提前派了信使——显然他们建立的村庄发展得很好，所以有时间来这里。哦，我简直等不及想看他们可爱的小脸了。] 她停顿了一下，突然想到了什么。[say:哦，不过他们可能已经不小了。嗯，那也没关系，能看到他们长大也很好。但是，哦，如果他们不记得我们了怎么办？] 她就这样继续患得患失，但你能看出来她只是太紧张了。");
         menu();
         addNextButton("见孩子们",amilyKidMeetingGo).hint("能看到你的孩子们长大成人，你会欣喜若狂的。");
         addNextButton("离开",amilyKidMeetingLeave).hint("你真的不想这样浪费时间。");
      }
      
      public function amilyIsTotallyALesbo() : void
      {
         amilySprite();
         clearOutput();
         outputText("奇怪的是，这次你不需要去找艾米莉；她正在等你。你问她是不是出了什么事，她摇了摇头……但她这么做的时候看起来有些尴尬。[pg]");
         outputText("[say: 有件事……啊……我想和你谈谈，[name]，]她终于开口了。[say: 我……嗯，我以前从来没觉得其他女人有吸引力，也许只是因为我孤独太久了，但你对我这么好，能有一个关心我的人感觉真好，所以我想说的是——][pg]");
         outputText("你打断了她，让她慢点说，深呼吸，你哪儿也不去。艾米莉喘着气，终于尖声喊道：[say: 我爱上你了！]随后她的脸变得通红。你愣住了，让她再说一遍。[say: 我说……我爱上你了。我……啊，算了，我在骗谁呢？]她的声音渐渐低落，带着悲伤，你看着她转过身，步履蹒跚地准备离开。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,159,1);
         menu();
         addButton(0,"拦住她",amilyLesboStopHer);
         addButton(1,"让她走",amilyLesboLetHerGo);
      }
      
      public function amilyIncest() : void
      {
         var all1:Boolean;
         var _g1:AmilyScene;
         var all:Boolean;
         var _g:AmilyScene;
         clearOutput();
         amilySprite(true);
         outputText("当你去找艾米莉时，你发现她在营地边缘，正和她的三个孩子交谈。这些紫-");
         if(amilyFurry())
         {
            outputText("色皮毛");
         }
         else
         {
            outputText("色头发");
         }
         outputText("、严重腐化的老鼠已经成熟为成年个体，它们更大的体型和巨大得多的性征就是证明。这里涵盖了所有的性别——一个阳具巨大的雄性，一个巨乳的雌性，以及一个不知什么时候长出了一根巨大的、带结的狗屌的扶她。那个雄性留着长发和山羊胡，这让他看起来有些智慧，尽管当他看到他淫荡的母亲时，他正努力克制着不去手淫他那根一英尺长、包皮过长的阴茎。那个妹妹完全赤裸着，而且她似乎一点也不介意。她巨大的乳房沉甸甸地摇晃着，你猛然意识到，在她发育良好的乳房下，隐约可见一个隆起的孕肚。她不停地瞥向那个扶她，并用手指摩擦着紧绷的");
         if(amilyFurry())
         {
            outputText("皮毛");
         }
         else
         {
            outputText("皮肤");
         }
         outputText("。你猜想，在它们体内流淌着如此多的腐化力量，乱伦对它们来说根本不算什么。");
         outputText("[pg]那个扶她正依偎在艾米莉身边，将一串串狗精液涂抹");
         if(amilyFurry())
         {
            outputText("在她母亲的皮毛里");
         }
         else
         {
            outputText("在她母亲的大腿上");
         }
         outputText("，而后者正在教导如何取悦她的[master]。至于艾米莉，她似乎只是变得越来越湿润，但她不知怎么地控制住了自己。当她的三个孩子没有对自己或母亲投去焦虑、淫荡的目光时，他们就会对她的话拼命点头。显然，这三个人和他们的妈妈一样，对服侍你的前景感到兴奋。");
         outputText("[pg]他们中还没有人注意到你。你可以在他们发现你之前溜走，避免任何潜在的乱伦，或者你可以和这些荡妇们玩玩。你要怎么做？");
         menu();
         if(get_player().hasCock())
         {
            if(get_player().hasCockThatFits(61))
            {
               _g = this;
               all = false;
               addButton(0,"操小穴",function():void
               {
                  _g.fuckIncestCunts(all);
               });
               _g1 = this;
               all1 = true;
               addButton(1,"全操了",function():void
               {
                  _g1.fuckIncestCunts(all1);
               });
            }
            else
            {
               outputText("[pg]可悲的是，你太大了，没法操他们中的任何一个。");
            }
         }
         else
         {
            outputText("[pg]如果你有一根鸡巴就好了，你就可以把他们全操了。");
         }
         addButton(14,"离开",playerMenu);
      }
      
      public function amilyHips() : String
      {
         var _loc1_:String = "";
         var _loc2_:Number = 0;
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,49) <= 1)
         {
            if(Utils.rand(2) == 0)
            {
               _loc1_ = "男孩子气的";
            }
            else
            {
               _loc1_ = "微小的";
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,50) >= 6)
            {
               _loc1_ = "暴躁的";
            }
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,49) > 1 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,49) < 4)
         {
            _loc2_ = Utils.rand(3);
            if(_loc2_ == 0)
            {
               _loc1_ = "苗条的";
            }
            if(_loc2_ == 1)
            {
               _loc1_ = "狭窄的";
            }
            if(_loc2_ == 2)
            {
               _loc1_ = "瘦削的";
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,50) >= 6)
            {
               _loc1_ = "暴躁的";
            }
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,49) >= 4 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,49) < 6)
         {
            _loc2_ = Utils.rand(3);
            if(_loc2_ == 0)
            {
               _loc1_ = "普通的";
            }
            if(_loc2_ == 1)
            {
               _loc1_ = "正常的";
            }
            if(_loc2_ == 2)
            {
               _loc1_ = "平凡的";
            }
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,49) >= 6 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,49) < 10)
         {
            _loc2_ = Utils.rand(3);
            if(_loc2_ == 0)
            {
               _loc1_ = "丰满的";
            }
            if(_loc2_ == 1)
            {
               _loc1_ = "显眼的";
            }
            if(_loc2_ == 2)
            {
               _loc1_ = "少女般的";
            }
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,49) >= 10 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,49) < 15)
         {
            _loc2_ = Utils.rand(3);
            if(_loc2_ == 0)
            {
               _loc1_ = "外扩的";
            }
            if(_loc2_ == 1)
            {
               _loc1_ = "曲线丰满的";
            }
            if(_loc2_ == 2)
            {
               _loc1_ = "宽阔的";
            }
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,49) >= 15 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,49) < 20)
         {
            _loc2_ = Utils.rand(3);
            if(_loc2_ == 0)
            {
               _loc1_ = "好生养的";
            }
            if(_loc2_ == 1)
            {
               _loc1_ = "适育的";
            }
            if(_loc2_ == 2)
            {
               _loc1_ = "惹火的";
            }
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,49) >= 20)
         {
            _loc2_ = Utils.rand(3);
            if(_loc2_ == 0)
            {
               _loc1_ = "育母级别的";
            }
            if(_loc2_ == 1)
            {
               _loc1_ = "母牛般的";
            }
            if(_loc2_ == 2)
            {
               _loc1_ = "宽得非人的";
            }
         }
         _loc2_ = Utils.rand(2);
         if(_loc2_ == 0)
         {
            if(Utils.rand(2) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,49) >= 15)
            {
               _loc1_ += "侧腹";
            }
            else
            {
               _loc1_ += "臀部";
            }
         }
         if(_loc2_ == 1)
         {
            if(Utils.rand(2) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,49) >= 15)
            {
               _loc1_ += "侧腹";
            }
            else
            {
               _loc1_ += "大腿";
            }
         }
         return _loc1_;
      }
      
      public function amilyHighAffectionSecks() : void
      {
         amilySprite(true);
         var _loc1_:int = get_player().cockThatFits(61);
         outputText("艾米莉真是一点时间都没耽搁，拉着你以最快的速度冲向她隐藏的卧室。");
         if(pregnancy.get_isPregnant())
         {
            outputText("即使在微微怀孕的状态下，她的速度也快得惊人，不过她对自己的小肚子还是相当小心的。");
         }
         outputText("[pg]");
         outputText("一进门，你们俩就开始动手解开对方的衣服，毫不在意地把衣物扔得满屋都是。艾米莉咬着下唇，再次打量着你赤裸的身体，然后几乎是扑到了你身上。她用小手紧紧握住你坚挺的" + Appearance.cockNoun(get_player().cocks[_loc1_].get_cockType()) + "，力道大得几乎让人感到疼痛，她揉搓着、挑逗着它，同时把嘴唇贴在你的嘴唇上，她的舌头探索着你嘴里每一个能触及的角落，而你也迅速回应，对艾米莉做着同样的事。");
         if(pregnancy.get_isPregnant())
         {
            outputText("真的，现在你们俩之间似乎只隔着艾米莉微微隆起的小肚子了。");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) > 0)
         {
            outputText("你能感觉到她的勃起，火热而坚硬，紧紧地贴在你们俩的身体之间。");
         }
         outputText("[pg]");
         outputText("她没有松开紧握着你那怒挺勃起的阴茎的手，也没有中断哪怕一秒钟那热烈的亲吻，她向后退向床边，并带着你一起。你很惊讶这个安静的鼠娘竟然走出了她的保护壳，变得如此主动。这就是你对她产生的影响吗？[pg]");
         outputText("终于在你们两人之间拉开了一些距离，艾米莉倒在床上，双手放在脑后，向你展示她美丽的身体。你觉得这景象无法抗拒，便把头移到她的双腿之间，开始舔舐她湿润的阴道，时不时地将舌头或手指探入其中，并且");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) == 0)
         {
            outputText("吸吮她敏感的阴蒂");
         }
         else
         {
            outputText("舔吻她那人类般的阴茎");
         }
         outputText("来进一步刺激她。作为回应，艾米莉大声呻吟着，将双腿分得更开，这是在邀请你继续。你很高兴地满足了你的爱人，将两根手指埋入她湿润的阴户，同时你移向她身体的其他部位。");
         if(pregnancy.get_isPregnant())
         {
            outputText("当你的头划过她美丽的身体时，你在她渐渐隆起的孕肚处停下，轻轻吻了一下。");
         }
         outputText("你的头在她的乳房处徘徊");
         if(pregnancy.get_isPregnant())
         {
            outputText("，它们似乎因为怀孕而变大了，");
         }
         outputText("然后开始舔舐和吸吮她的乳头，揉捏着那敏感的肉团。");
         if(pregnancy.get_isPregnant())
         {
            outputText("当你嘴里尝到一滴乳汁时，你感到很惊讶，但你当然没有停下来。[say:哈……你得教教孩子们怎么做，]艾米莉在急促的呼吸间说道。");
         }
         outputText("[pg]");
         outputText("当你开始挑逗她的脖子和锁骨时，艾米莉的双手紧紧抓住你的背，她不耐烦地在你那怒挺勃起的阴茎上摩擦着。[say:请不要再挑逗我了，]艾米莉在你的耳边低语，让你几乎为这样挑逗你的爱人感到一丝内疚。[pg]");
         outputText("作为道歉，你迅速将你的" + get_player().cockDescript(_loc1_) + "推过她湿润的阴唇，开始在你的鼠娘爱人体内抽插。");
         if(pregnancy.get_isPregnant())
         {
            outputText("你当然很注意她的孕肚，没有进行得太快，并确保你们处于一个对双方都舒适的姿势，不想伤害你和这位可爱的鼠族少女未来的后代。");
         }
         outputText("没过多久，你就以正常的节奏进行着，用你那熟悉的男子气概填满艾米莉的肉洞。[pg]");
         outputText("艾米莉因快感而呻吟，抬起臀部迎合你的抽插，渴望得到你更多的爱抚。她在浅浅的呼吸间对你低语了几句下流的话，");
         if(!pregnancy.get_isPregnant())
         {
            outputText("[say:用你的一切填满我……我想成为你孩子们的母亲，就像我想成为我族人的母亲一样，,]");
         }
         else
         {
            outputText("[say:不用克制，尽可能多地把精液射进我体内，,]");
         }
         outputText("她用性感的语调低语着，她的话足以让你达到高潮。你大声闷哼，感觉你的阴茎快要因为用力而爆炸了，你把精液射进艾米莉体内，多到开始渗出来。艾米莉发出一声可爱的小声娇呼，她的阴道壁紧紧夹住你敏感的阴茎，力度大得让你倒吸一口凉气，同时她的淫液喷洒在你的大腿上");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) > 0)
         {
            outputText("精液在你们之间喷射到空中，溅在你们俩身上");
         }
         outputText("。[pg]");
         if(!pregnancy.get_isPregnant())
         {
            outputText("[say:如果这都没让我怀上……我其实也没你想的那么在意。不管怎样，这都太棒了，,]");
         }
         else
         {
            outputText("[say:嗯……我的孩子们真幸运，他们的父亲是如此强壮的标本，,]");
         }
         outputText("艾米莉一边喘着气，一边伸手揉乱你的头发。你给了她一个羞涩的微笑，很高兴看到你让她如此开心。[pg]");
         outputText("你们俩躺在一起待了一会儿，你非常遗憾地告诉她，你需要回去看看你自己的营地。艾米莉似乎很失望，不想让你离开，但也理解你为什么必须走。");
         if(!pregnancy.get_isPregnant())
         {
            outputText("[say:好吧……嗯，我相信你会回来的。如果这次没怀上，我还需要你的帮助，,]");
         }
         else
         {
            outputText("[say:好吧，亲爱的……但你最好找个时间回来。你不想让你的孩子们有被抛弃的心理阴影吧？]");
         }
         outputText("艾米莉一边揉着肚子一边说。你对她笑了笑，点了点头，承诺你会回来，然后动身返回你自己的营地。");
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,38,FlagDict_Impl_.arrayReadInt(_loc2_,38) + (2 + Utils.rand(4)));
         _loc2_ = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,42,FlagDict_Impl_.arrayReadInt(_loc2_,42) + 1);
         get_player().orgasm("Generic");
         dynStats(DynStat.Sens(-1));
         doNext(get_camp().returnToCampUseOneHour);
         amilyPreggoChance();
      }
      
      public function amilyHermQuestWait() : void
      {
         amilySprite();
         clearOutput();
         outputText("这有点突然，而且是一个相当大的决定。虽然你可能很感激她愿意和你谈论这件事，而不是直接去做并祈祷最好的结果，但你仍然没有准备好。你解释说你需要一些时间来消化这件事，然后才能接受这个想法。你爱她，你知道这对她来说很重要。你需要的只是一些时间。[pg]");
         outputText("艾米莉向你点点头，深吸了一口气。[say: 谢谢你的理解，很抱歉把这件事强加给你。你对我来说很特别，我不想因为没有考虑到你的感受而毁了我们之间的一切。只是……请不要让我等太久，好吗？][pg]");
         outputText("你告诉她，一旦你准备好进一步发展，你会立刻告诉她。在那之前，你们俩可以像以前一样，继续开心地在一起度过时光。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,165,5);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function amilyHermQuestLetMe() : void
      {
         amilySprite();
         clearOutput();
         outputText("你尊重她为了你而愿意改变的意愿，但这不对。如果她变成扶她，那么她就会扭曲她族人的纯洁性。他们应该有一个更纯洁的鼠妈妈。但这并不意味着希望破灭，因为她想要一个人类伴侣是有充分理由的。人类在与其他种族繁殖时，基因足迹要弱得多——如果你长出鸡巴，雌雄同体至少会不那么常见。她可以保持作为老鼠的纯洁性，你非常乐意代替她做出改变。[pg]");
         outputText("艾米莉对你的回答喜笑颜开。[say: 我很高兴这对你来说也这么重要！你说的很有道理。嘿……如果你早点长出鸡巴，我可能会吓坏的，但现在我却很兴奋你要这么做。][pg]");
         outputText("你告诉她，如果她突然毫无预兆地长出鸡巴，你可能也会吓坏的。不过，你们都很在乎对方，所以当然会商量这种事情。[pg]");
         outputText("[say: 你说得对。我真的爱对人了，不是吗？]她微笑着说，显得无忧无虑。既然她知道她的种族将继续生存下去，而且她可以信任她选择的人来完成这件事，她肩上的重担似乎卸下了很多。[pg]");
         outputText("你告诉艾米莉你会回到营地，开始寻找长出鸡巴的方法。如果找到你需要的东西需要太长时间，你可能会在准备好之前回来一两次只是为了看看她，但你会坚持到底的。她带着另一个愉快的傻笑点点头，向你挥手告别。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,165,3);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function amilyHermQuestDisgust() : void
      {
         amilySprite();
         clearOutput();
         outputText("你忍不住对她做了个鬼脸。你关心她，因为她也是个女人，在这个充满发情怪胎的扭曲世界里孤独迷茫，那些怪胎似乎除了鸡巴和欲望什么都没有；现在她也要变异自己，变得和他们一样？她就不能接受你们之间已经拥有的纯洁爱情吗？[pg]");
         outputText("艾米莉震惊地后退了一步。[say: 我——我只是——我不能让我的种族灭绝。我必须这么做！][pg]");
         outputText("你怒视着她，告诉她她很恶心。如果她只是像其他人一样是个疯狂想要生孩子的生育机器，你将和她断绝一切关系。[pg]");
         outputText("她低下头，眼泪从眼眶里滴落，然后转身跑开了。你怒视着她消失在废墟中，抽泣着，希望她永远不要回来。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,36,1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function amilyHermQuestAccept() : void
      {
         amilySprite();
         clearOutput();
         outputText("你告诉她，你爱慕的是她这个人，而不是她<i>是什么</i>。为了拯救她的种族，你很乐意接受长着鸡巴的她——更不用说你对这个想法至少有一点兴奋了……[pg]");
         outputText("艾米莉松了一口气，对你微笑着。[say: 我很高兴你能理解这对我有多重要。除了你，我不想让任何人做我孩子的母亲。]你把小鼠娘拉进怀里，对她的决定给予肯定。你们继续拥抱了一会儿，然后艾米莉又叽叽喳喳地说起来。[say: 好吧，我要去……长阴茎了。]她轻声笑了笑，[saystart]这么说听起来好傻。不管怎样，我有一个很好的主意，知道怎么安全地做到这一点，所以我会去拿材料，而你回到你的传送门。当你回来的时候，");
         if(get_silly())
         {
            outputText("我就会变成艾米[b: 男]了！[sayend][pg]");
         }
         else
         {
            outputText("我们就可以“做”了！[sayend][pg]");
         }
         outputText("老鼠尴尬地找了个借口离开了，留下你一个人思考。你一边想着，一边期待着这件事，然后回到了营地。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,165,4);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function amilyGiftMenu() : void
      {
         menu();
         addNextButton("赠送物品",giveAmilyAPresent);
         addNextButton("赠送衣服",giveAmilyClothes);
         addNextButton("赠送戒指",amilyRingGifting).disableIf(!playerHasRing() || saveContent.ringType != "");
         setExitButton("返回",amilyFollowerEncounter);
      }
      
      public function amilyFurry() : Boolean
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,337) == 0)
         {
            return !get_noFur();
         }
         return false;
      }
      
      public function amilyFollowerPure() : Boolean
      {
         if(amilyFollower())
         {
            return !amilyCorrupt();
         }
         return false;
      }
      
      public function amilyFollowerEncounter() : void
      {
         if(!amilyCorrupt() && get_player().eggs() >= 20 && get_player().canOviposit() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,631) == 0)
         {
            amilyEggStuff();
            return;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,436) == 720 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,43) == 2 && (get_game().time.hours >= 11 && get_game().time.hours <= 13))
         {
            amilyIncest();
            return;
         }
         amilySprite();
         if(FlagDict_Impl_.arrayReadString(KFLAGS.flags,52) == "")
         {
            FlagDict_Impl_.arrayWriteString(KFLAGS.flags,52,"rags");
         }
         if(!get_player().isPureEnough(50) && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,173) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,43) == 1)
         {
            amilyTaintWarning();
            return;
         }
         if(get_player().isPureEnough(50) && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,173) > 0)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,173,0);
         }
         if(pregnancy.get_isPregnant() && pregnancy.get_incubation() == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,43) == 2)
         {
            clearOutput();
            amilyPopsOutKidsInCamp();
            pregnancy.knockUpForce();
            doNext(get_camp().returnToCampUseOneHour);
            return;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,43) == 1 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,74) == 1 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,75) == 0 && jojoFollower())
         {
            get_finter().pureJojoAndAmilySpar();
            return;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,43) == 1 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,77) == 1 && get_player().hasItem(get_consumables().PURHONY) && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,78) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,79) == 0)
         {
            get_finter().fixJojoOOOOHYEEEEAHSNAPINTOASLIMJIM();
            return;
         }
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,43) == 1)
         {
            outputText("当你走近这位鼠女时，她的大耳朵抽动了一下，转过身来微笑着面对你。[say:嗨，[name]！怎么了？]她对你咧嘴一笑。[pg]");
         }
         else
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1079) != 0)
            {
               outputText("你还没叫完她的名字，艾米莉就已经跪在你面前了。她看起来有点灰头土脸，但她的阴部却闪闪发光，干净而诱人。");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1100) == 1)
               {
                  FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1100,2);
                  outputText("[pg]你一言不发地伸出手。艾米莉咧嘴一笑，拿出一瓶魅魔乳液放在你的手掌里。");
                  outputText("[pg][say:我会把我的常规产出和惠特尼欠你的剩余报酬放在一起，[master]。][pg]");
                  get_inventory().takeItem(get_consumables().SUCMILK,amilyFollowerEncounter);
                  return;
               }
               amilyMenu(false);
               return;
            }
            outputText("[say:艾米莉！]你大喊。转眼间，一个紫色的模糊身影向你冲来；她滑行着停下，跪在你面前，双手背在身后，完全暴露在你面前。[say:怎么了，我的[master]？]艾米莉诱惑地说着，舔了舔嘴唇。[pg]");
         }
         switch(pregnancy.get_event())
         {
            case 2:
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,43) == 1)
               {
                  outputText("你注意到艾米莉似乎生病了。当然，你立刻走到她身边问她怎么了，但她只是对你微笑，说没关系。你的不解一定写在了脸上，因为艾米莉咯咯地笑了起来，用双臂搂住你，吻了你。[say:傻[boy]……你要当爸爸了……又一次……][pg]");
               }
               else
               {
                  outputText("你注意到艾米莉似乎生病了。尽管如此，她似乎对某件事感到很高兴。你想知道发生了什么事，决定问问她；艾米莉对你咧嘴一笑。[say:哦，" + get_player().mf("master","mistress") + "！你做到了！你要当爸爸了……我等不及要为你生更多的小老鼠荡妇了，[master]。][pg]");
               }
               break;
            case 3:
            case 4:
               outputText("艾米莉的肚子开始有点凸起了。毫无疑问，她怀孕了。[pg]");
               break;
            case 5:
            case 6:
               outputText("艾米莉的肚子变得很大了。她怀的肯定不止一个孩子。[pg]");
               break;
            case 7:
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,43) == 1)
               {
                  outputText("艾米莉肿胀的肚子偶尔会动一下，她会下意识地拍拍肚子，安抚里面不安分的孩子们。[pg]");
               }
               else
               {
                  outputText("艾米莉肿胀的肚子偶尔会动一下，她会抚摸肚子，催促里面不安分的孩子们快点出来。[pg]");
               }
               break;
            case 8:
               outputText("艾米莉隆起的肚子经常蠕动和扭动，但这似乎并没有困扰她。" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,43) == 1 ? "T" : "她高兴地笑着，t") + "孩子们应该很快就要出生了。[pg]");
         }
         amilyMenu(true);
      }
      
      public function amilyFollowerCorrupt() : Boolean
      {
         if(amilyFollower())
         {
            return amilyCorrupt();
         }
         return false;
      }
      
      override public function amilyFollower() : Boolean
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,43) > 0)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1079) != 0)
            {
               return false;
            }
            return !(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,346) == 1 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,346) == 2);
         }
         return false;
      }
      
      public function amilyEnjoyShow() : void
      {
         clearOutput();
         amilySprite();
         outputText("你既惊讶、好奇又兴奋，决定坐下来看表演。艾米莉似乎很高兴为你表演，并尽力让表演尽可能引人入胜。");
         if(pregnancy.get_event() >= 6)
         {
            outputText("尽管一开始她显然对自己的怀孕状态有些紧张，但随着表演的进行，她变得越来越自信，甚至似乎几乎忘记了这件事。");
         }
         outputText("[pg]");
         AmilyMidSexLevel2();
      }
      
      public function amilyEggStuff() : void
      {
         clearOutput();
         amilySprite();
         outputText("当你走近这位鼠女时，她的大耳朵抽动了一下，微笑着转身面对你。然而，还没等她开口向你打招呼，她的目光就落在了你微微隆起的腹部上。");
         outputText("[pg][say: [name]，你没事吧？你后面看起来有点……变大了。] 仿佛是配合她的话，你感到腹部微微跳动，一阵快感传遍你的背部，提醒你已经完全准备好产下下一窝卵了。当你稳住身体时，艾米莉皱起了眉头，显然对你的困境感到有些困惑。[say: 你知道，你没必要把你在外面找到的<b>所有东西</b>都吃掉；看起来它已经开始对你产生相当大的影响了。.]");
         outputText("[pg]当你再次颤抖时，她脸上闪过一丝坏笑，又一阵狂喜涌遍你的全身。[say: 看来你需要尽快处理一下，否则谁知道会发生什么？我相信这附近有足够的空间让你挖个坑，然后……解决一下。] 当你嘴里发出一声呻吟时，她暗自轻笑起来");
         if(get_player().get_gender() > 0)
         {
            outputText("，你的[if (hasCock) {[cock] 变硬了}][if (isHerm) { 并且 }][if (hasVagina) { [vagina] 开始因渴望而燃烧}]");
         }
         outputText("同时你的身体本能地对它所感受到的快感做出反应，产卵管慢慢变粗，随着渴望而跳动。");
         outputText("[pg]艾米莉说得对；你确实需要缓解这种令人痛苦的舒适压力，但当你想到把卵浪费在泥泞的沟渠里时，一阵莫名其妙的不安闪过你的心头。不，你需要一些东西……某<b>个人</b>来携带你的卵。等等，艾米莉不是说过她以前做过这种事吗？你发誓你记得她谈论过她与蜜蜂的遭遇，用“恩惠”换取蜂蜜。");
         outputText("[pg][say: 嗯……是的，] 她缓慢地回答，似乎对你把话题引向何处感到有些担忧。[say: 我只是在极度渴望食物的时候才这么做；我又不是每周都去那里被填满！] 艾米莉说话时声音越来越高，听起来有些愤慨。你试图评估她的反应，她脸上没有皱眉，这告诉你她至少有点反应过度了。");
         outputText("[pg]一提到她以前的遭遇，你的腹部就抽动起来；似乎在这一点上，仅仅是想到产卵就足以让你发情。当你可怜巴巴地呜咽时，你的产卵管开始滑出腹部，将液体滴落到地上，这痛苦地表明了你有多么兴奋。艾米莉咬着嘴唇，眼睛睁得大大的，开始明白这到底对你有多大影响。你摆出你最好的小狗般的眼神");
         if(get_player().dogScore() >= 4)
         {
            outputText("，你确信这<i>非常</i>有效，");
         }
         outputText("你轻轻地握住她的手，问她是否能帮你，解释说你不确定自己能否处理好，而在这种状态下出去探索可能会有不好的结果。看到她听你解释时皱起眉头，你补充说，在这方面她可能比你有更多经验。");
         outputText("[pg][say: 该死，[name]。你知道当我要求和你生孩子时，我不是这个意思，对吧？] 尽管她的语气很不情愿，但她的尾巴却兴奋地来回摆动");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) > 0)
         {
            outputText("而且你注意到她裤子里越来越鼓的凸起");
         }
         outputText("。看来你并没有完全强迫她同意这件事。[say: 好吧，我会帮你减轻你身上的负担，只是……如果我肚子里装满了卵，别指望我在营地里帮那么多忙。.]");
         outputText("[pg]在她走开之前，你迅速用双臂环抱住她，将这位鼠娘拉入一个深吻。她搂住你的脖子，当你们的舌头交缠时，将身体紧贴着你。当你抚摸她的背时，艾米莉发出轻柔的咕哝声，你结束了亲吻，低声感谢她是一个如此善解人意的情人。她给了你最后的一个吻，然后带着淡淡的微笑回到了她的铺盖。");
         outputText("[pg][say: 我想，只要你准备好了就行。.]");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,631,1);
         amilyMenu(false);
      }
      
      public function amilyDrinksSuccubusDelight() : void
      {
         var _loc2_:* = null as IMap;
         clearOutput();
         amilySprite();
         var _loc1_:String = "脚";
         if(amilyFurry())
         {
            _loc1_ += "爪子";
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,171) == 0)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,43) == 2)
            {
               if(get_player().hasItem(get_consumables().SDELITE))
               {
                  get_player().consumeItem(get_consumables().SDELITE);
               }
               else
               {
                  get_player().consumeItem(get_consumables().PSDELIT);
               }
               outputText("你告诉她，你需要她能射出更多的精液，所以长出睾丸会有帮助。艾米莉微笑着说，[say: 当然，[master]。原谅你愚蠢的母老鼠精盆质疑你。][pg]");
               outputText("她张开双腿让你看着，然后一口气喝下了整瓶药水。");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) > 0)
               {
                  outputText("她的肉棒变硬了，但似乎没有其他事情发生……...");
               }
               outputText("[pg]");
               outputText("你决定，如果她要长出睾丸，就需要一点推力。你命令她躺下，对她大肆辱骂，但被虐待只会让她在顺从时微笑。[pg]");
               if(get_player().hasCock() && (get_player().get_gender() == 1 || Utils.rand(2) == 0))
               {
                  outputText("你[if (!isnaked){脱下你的[armor]并}]站在她上方，你的肉棒因为你即将要做的事情而变硬。[say: 取悦我。]你命令艾米莉。她抬起一只" + _loc1_ + "，开始抚摸你暴露的[cock]；她非常小心，以免用爪子弄伤你，同时用脚趾熟练地抓住你的肉棒。她的第一只" + _loc1_ + "很快就和另一只一起，开始灵巧地为你手淫，给你一个熟练的足交。毫无疑问，她一直在练习；你以后得为此奖励她。[pg]");
                  outputText("你集中你的腐化力量，一团黑色的预精液在你的龟头上形成；它滑过你的肉棒并润滑了你的[cock]，让艾米莉能更好地抚摸你。你能感觉到你的高潮很快就要来了，你告诉艾米莉停下来并张大嘴巴。她尽可能地张开双腿，喘着粗气看着你解决自己。你将一股又一股的黑色精液射在她的胯部。艾米莉随着每一股射在她腐化身体上的精液而呻吟，享受着蔓延全身的温暖。[pg]");
               }
               else
               {
                  outputText("你[if (!isnaked){脱下你的[armor]并}]站在她上方，你的小穴因为你即将要做的事情而变得湿润。[say: 取悦我，]你命令艾米莉。她的尾巴抬向你的小穴，开始摩擦你的阴唇和阴蒂，让你发出愉悦的呻吟。很快，黑桃状的尖端压在你的" + get_player().vaginaDescript(0) + "上，并推入你的深处。艾米莉开始熟练地用尾巴操你，让她的尾巴像舌头一样旋转，舔舐你深处的每一寸。很快，第一股液体溢出到她的尾巴上，润滑了它，让艾米莉的工作变得更容易，她微笑着取悦你。[pg]");
                  outputText("你集中你的腐化力量，想象着艾米莉长着巨大的睾丸，产生美味的精液，并在你的命令下射出。这只老鼠精盆越来越像一个玩具；她生命中唯一的目的，就是服从和取悦你。你命令她抽出；她不情愿地顺从了，看着你解决自己。一股名副其实的黑色汁液从你的" + get_player().vaginaDescript(0) + "中溢出，击中她的腹股沟。艾米莉随着每一股射在她腐化身体上的汁液而呻吟，享受着蔓延全身的温暖。[pg]");
               }
               outputText("你微笑着看着，几个" + (amilyFurry() ? "肿块开始形成" : "毛茸茸的肿块开始形成"));
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) > 0)
               {
                  outputText("就在她的肉棒下面。她的皮肤生长并覆盖了她肉棒的根部，将其拉入；给了她一个看起来像包皮的东西。它继续膨胀，最后有两个球体落入她的" + (amilyFurry() ? "毛茸茸的" : "") + "阴囊中，给了它产生更多精液所需的重量。");
               }
               else
               {
                  outputText("在她的双腿之间。她的皮肤随着肿块膨胀，形成一个小囊。它继续膨胀，最后有两个球体落入她的" + (amilyFurry() ? "毛茸茸的" : "") + "阴囊中，给了它产生精液所需的重量，尽管它将如何排出对你来说是个谜。");
               }
               outputText("[say: 很好。现在，我要你练习带着这些走路。我不能让你在走动时伤到自己，]你告诉她。[say: 是的，[master]，]她回答，微微喘气；你把她留在地上。");
               get_player().orgasm("Generic");
               _loc2_ = KFLAGS.flags;
               FlagDict_Impl_.arrayWriteInt(_loc2_,171,FlagDict_Impl_.arrayReadInt(_loc2_,171) + 1);
            }
            else
            {
               get_player().consumeItem(get_consumables().PSDELIT);
               outputText("向她保证这就是你想要的，你把它递了过去。艾米莉不情愿地接过它，然后喝了下去，浑身发抖——首先是对她实际喝下的东西感到厌恶，然后是愉悦。她狂喜地呻吟着，脱下裤子让你看个清楚，因为在她的阴茎正下方，腹股沟处长出了肿块。它最终移动，直到完全形成一对睾丸。[pg]");
               outputText("她喘过气来，用一种难以捉摸的表情盯着她的新睾丸，然后做个鬼脸把衣服穿了回去。你决定给她一些独处的时间来适应这种变化。");
               _loc2_ = KFLAGS.flags;
               FlagDict_Impl_.arrayWriteInt(_loc2_,171,FlagDict_Impl_.arrayReadInt(_loc2_,171) + 1);
            }
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,171) >= 6)
         {
            outputText("你意识到，再给艾米莉任何魅魔之悦都会让她几乎无法移动。不，她不需要更多了。也许等你找到了一个更合适的地方来安置一个天赋异禀的后宫再说。");
         }
         else
         {
            get_player().consumeItem(get_consumables().SDELITE);
            outputText("你拿起一瓶魅魔之悦，把它展示给艾米莉。把瓶子递给她，你命令她喝下去，让她的睾丸变大。艾米莉回答，[say: 是的，[master]。]然后她张开双腿，喝下了药水。她呻吟着，因为她的睾丸变得更大更密，随着她的阴囊现在容纳的额外精液而翻滚。");
            _loc2_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc2_,171,FlagDict_Impl_.arrayReadInt(_loc2_,171) + 1);
         }
         doNext(amilyFollowerEncounter);
      }
      
      public function amilyDiscussChildren() : void
      {
         amilySprite();
         clearOutput();
         outputText("你对目前的情况进行了深思熟虑。[pg]");
         outputText("艾米莉愿意长出鸡巴，以便能和你生孩子。毫无疑问，你对她来说一定非常特别，她才愿意做这样的事。此外，在生下足够多的孩子后，你可以找些变形药水去掉她的鸡巴，让她恢复原样。如果你们中有人不喜欢，她不必永远做个扶她。[pg]");
         outputText("你自己也可以长出鸡巴。艾米莉可以保持她作为鼠娘的纯洁，如果你以后改变主意不想要鸡巴了，你可以把它去掉。这甚至可能比她变形更好，因为人类对混血孩子的影响较小。[pg]");
         outputText("尽管有这些理由，但事实仍然是，只有你们中的一个变异，你们才能有孩子。这足以让人感到不舒服。");
         menu();
         addButton(0,"扶她艾米莉",amilyHermQuestAccept).hint("一个可爱的鼠娘，而且她还会有鸡巴？梦想成真了。");
         addButton(1,"我来做",amilyHermQuestLetMe).hint("坦白说，你更希望自己长出鸡巴。");
         addButton(2,"算了",amilyVillageMenu);
      }
      
      public function amilyDickGrow() : void
      {
         var _loc2_:* = null as IMap;
         var _loc1_:int = getMaxSize(13,15,23);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) == 0)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,45,4);
            FlagDict_Impl_.arrayWriteFloat(KFLAGS.flags,46,1);
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) < _loc1_)
         {
            _loc2_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc2_,45,FlagDict_Impl_.arrayReadInt(_loc2_,45) + 1);
            FlagDict_Impl_.arrayWriteFloat(KFLAGS.flags,46,1 + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) - 4) / 9);
            if(FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,46) > 3)
            {
               FlagDict_Impl_.arrayWriteFloat(KFLAGS.flags,46,3);
            }
         }
         else
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,45,_loc1_);
            FlagDict_Impl_.arrayWriteFloat(KFLAGS.flags,46,3);
         }
      }
      
      public function amilyDestroyGladesToggle() : void
      {
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2226) == 0)
         {
            outputText("你问艾米莉是否愿意一看到森林中被腐化的林地就将其摧毁。毕竟，森林是可以被净化的。");
            outputText("[pg][say:我会摧毁我看到的任何腐化林地。我会确保它们无法死灰复燃，]艾米莉说道。她咧嘴一笑，举起刀以示强调。");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2226,1);
         }
         else
         {
            outputText("你告诉艾米莉，她不必摧毁森林中那些污秽的林地。");
            outputText("[pg][say:好吧，但如果你不把它们挡在外面，它们可能会卷土重来，]艾米莉说。");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2226,0);
         }
         doNext(amilyFollowerEncounter);
      }
      
      public function amilyDefurryOfferAtCamp() : void
      {
         var _loc1_:* = null as String;
         amilySprite();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,336) <= 0)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,336,1);
         }
         if(!amilyCanHaveTFNow())
         {
            outputText("不幸的是，在你获得必要的魔法先决条件之前，你无法做到这一点。简单来说，你需要一颗<b>金色种子</b>来获得人类的脸庞，一个<b>黑蛋</b>来去除毛发，以及一些<b>纯净魅魔奶</b>来完善整个过程。");
            doNext(amilyFollowerEncounter);
            return;
         }
         get_player().consumeItem(get_consumables().GLDSEED);
         if(get_player().hasItem(get_consumables().BLACKEG))
         {
            get_player().consumeItem(get_consumables().BLACKEG);
         }
         else
         {
            get_player().consumeItem(get_consumables().L_BLKEG);
         }
         if(amilyCorrupt())
         {
            if(get_player().hasItem(get_consumables().SUCMILK))
            {
               get_player().consumeItem(get_consumables().SUCMILK);
            }
            else
            {
               get_player().consumeItem(get_consumables().P_S_MLK);
            }
         }
         else
         {
            get_player().consumeItem(get_consumables().P_S_MLK);
         }
         if(amilyCorrupt())
         {
            _loc1_ = get_player().mf("主人","女主人");
            outputText("你向你那毛茸茸的小荡妇招了招手，告诉她她的" + _loc1_ + "有一些特别的东西要给她喝。[say:这有什么用，" + _loc1_ + "？]她好奇地问道。你咧嘴一笑，告诉她这瓶药水会去除她身上所有的毛发和老鼠般的面部特征，把她变成一个更像人类的鼠人；完美符合你的品味和欲望。一想到要失去自己的核心身份，艾米莉的脸上闪过一丝犹豫……但当你告诉她这是她的[master]的要求，她必须毫无疑问地服从时，你把这种犹豫扼杀在了摇篮里。为了帮助“鼓励”她，你脱下下半身的衣物扔到一边，示意她过来坐在你的腿上。她的目光死死盯着你");
            switch(get_player().get_gender())
            {
               case 1:
                  outputText("变硬的[cocks]");
                  break;
               case 2:
                  outputText("湿润的[clit]");
                  break;
               default:
                  outputText("变硬的[nipples]");
            }
            outputText("然后她像个乖女孩一样，迅速跑过来坐在你的腿上。");
            outputText("[pg]伴随着一声轻笑，你命令她张开嘴，同时用手引导她的头向后仰。你让她说“啊”，她毫不犹豫地张开嘴，你开始将药水倒进她的喉咙。她贪婪地吞咽着混合物，当你抚摸她毛茸茸的肚子时，她满足地发出呼噜声。瓶子一空，你就让她站起来，这样你就能清楚地看到变形的每一个细节。她跳了起来，向她的" + _loc1_ + "展示着自己的身体，然后随着变化席卷全身，她倒吸了一口凉气；毛发开始以惊人的速度从她身上脱落，她的爪子开始扭曲成更像人类的手，她的口鼻开始抽搐并缩回脸部，直到剩下的只是一个堕落的、人形的鼠人，有着人类的脸庞、光滑的皮肤，没有胡须。你显然很喜欢你所看到的；你向她招手，这样你就能品尝一下她全新改良的身体了。");
         }
         else
         {
            outputText("她一只手叉在纤细的腰上，直面着你，满怀期待地看着你。你一言不发，把手伸进[inv]里，拿出了三样物品。你把它们递给鼠娘，她好奇地打量着它们。[say:你确定这没有被污染吗？]她有些紧张地问道。你的点头是她唯一需要的催促。她咬掉黑蛋的尖端，留下一个足够大的洞，把其他材料漏进蛋壳里。她出乎意料地轻松地把哈比的种子放在手里，磨成粉末，撒进她临时制作的研钵里。带着明显的犹豫，艾米莉举起那瓶魅魔奶，象征性地倒了一点进去。她用手指堵住开口，把东西摇匀，然后直接把蛋壳举到唇边，一口气把里面的东西全灌了下去。[pg]");
            outputText("艾米莉倒吸一口凉气，从你身边退开，爪子飞快地捂住太阳穴。那对附肢颤抖着，指垫变长，掌垫变平，直到她突然拥有了一双纤细、完美无瑕的手。她震惊的目光从自己完全正常的指头移到你好奇的脸上；她刚想开口，但话语却卡在了喉咙里，因为她看到脚边堆积的毛发越来越多。就像用梳子梳理一只长满疥癣的流浪猫一样，覆盖她身体大部分的毛发就这样成块地脱落下来。[pg]");
            outputText("一声惊呼将你的注意力从那堆毛发拉回她的脸上。仿佛施了魔法一般，她那啮齿动物般的口鼻直接缩回了脸部，鼻子重塑成了更接近人类的模样。她轻轻抬起手，用指尖拂过崭新的嘴唇，眼中泛起泪光。[say:好……不一样，]她低声呢喃着，变形仍在继续。你走上前，给了她一个温暖而安慰的拥抱，片刻的停顿后，她也伸出双臂环抱住了你。[pg]");
            outputText("终于，整个过程结束了。你们松开彼此，保持着一臂的距离，两人都在打量着她那曾经充满兽性的身体所发生的变化。她那红褐色的耳朵和光秃秃的尾巴依然如故，但除此之外，艾米莉已经完全变成了人类的模样。虽然内心有些矛盾，但艾米莉似乎对自己的决定感到相当满意。[say:好吧，我想这就是全部了，]她说着，漫不经心地挠了挠刚褪去毛发的脸颊。[say:这就是你想要的，对吧？现在，你还有什么想讨论的吗？][pg]");
         }
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,337,1);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,336,2);
         amilySprite();
         doNext(amilyFollowerEncounter);
      }
      
      public function amilyDefurrify() : void
      {
         get_player().consumeItem(get_consumables().GLDSEED);
         if(get_player().hasItem(get_consumables().BLACKEG))
         {
            get_player().consumeItem(get_consumables().BLACKEG);
         }
         else
         {
            get_player().consumeItem(get_consumables().L_BLKEG);
         }
         if(amilyCorrupt())
         {
            if(get_player().hasItem(get_consumables().SUCMILK))
            {
               get_player().consumeItem(get_consumables().SUCMILK);
            }
            else
            {
               get_player().consumeItem(get_consumables().P_S_MLK);
            }
         }
         else
         {
            get_player().consumeItem(get_consumables().P_S_MLK);
         }
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,336,2);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,337,1);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,39,1);
         amilySprite();
         outputText("到达废墟后不久，你四处奔跑宣布你的到来，艾米莉从一条破旧的小巷里走了出来。她一只手叉在纤细的腰上，满怀期待地看着你。");
         outputText("你一言不发地把手伸进[inv]，拿出三样物品，递给鼠娘，她好奇地检查着它们。[say: 你确定这没有任何污染吗？]她有些紧张地问。你点点头，但她似乎并没有完全信服。[say: 如果我这么做……有什么能阻止你直接离开我？如果这只是你玩的一个恶心的游戏怎么办？]你用一个令人安心的微笑平息了她不断上升的焦虑，确保她意识到离开是你最不想做的事情。");
         outputText("这似乎让她平静了下来。她咬掉黑蛋的尖端，留下一个足够大的洞，把其他成分漏斗状地倒进蛋壳里。她出人意料地轻松地把哈比的种子放在手里，磨成粉末，把成品撒进她临时制作的研钵里。艾米莉明显犹豫了一下，举起那瓶魅魔奶，象征性地倒了一点进去。她把手指放在开口处，把东西摇匀，然后直接把蛋壳举到唇边，一口气把里面的东西全喝了下去。[pg]");
         outputText("艾米莉喘着粗气从你身边退开，爪子飞向太阳穴。那些附肢颤抖着，趾垫变长，掌垫变平，直到她突然拥有了一双纤细、完美的手。她震惊的目光从她完全正常的数字转移到你好奇的脸上；她开始说话，但当她看着脚下越来越大的一堆毛发时，话卡在了喉咙里。就像用梳子梳理流浪猫一样，覆盖她身体大部分的毛发就这样成团地脱落了。[pg]");
         outputText("一声惊呼将你的注意力从那堆毛发拉回她的脸上。仿佛施了魔法一般，她那啮齿动物般的口鼻直接缩回了脸部，鼻子重塑成了更接近人类的模样。她轻轻抬起手，用指尖拂过崭新的嘴唇，眼中泛起泪光。[say:好……不一样，]她低声呢喃着，变形仍在继续。你走上前，给了她一个温暖而安慰的拥抱，片刻的停顿后，她也伸出双臂环抱住了你。[pg]");
         outputText("终于，整个过程结束了。你们松开彼此，保持着一臂的距离，两人都在打量着她那曾经充满兽性的身体所发生的变化。她那红褐色的耳朵和光秃秃的尾巴依然如故，但除此之外，艾米莉已经完全变成了人类的模样。虽然内心有些矛盾，但艾米莉似乎对自己的决定感到相当满意。[say:好吧，我想这就是全部了，]她说着，漫不经心地挠了挠刚褪去毛发的脸颊。[say:我让你自己想一会儿……回头见。][pg]");
         outputText("她再次大步走入废墟，一边走一边哼着小曲。你注意到她的步伐变得更加轻快了，因为现在她又重燃了繁衍种族的希望。[pg]");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function amilyCorruptSexMenu() : void
      {
         amilySprite();
         if(get_player().get_gender() > 0)
         {
            outputText("艾米莉问道，[say: [master]今天想怎么使用[his]精液桶呢？]");
            menu();
            if(get_player().hasCock())
            {
               addButton(0,"肛交",corruptAmilyBuckFutter).hint("操艾米莉的屁股！");
               addButton(1,"接受口交",corruptAmilyOralSuckOff).hint("让艾米莉给你口交。","接受口交");
               addButton(5,"小穴",corruptAmilysPussyGetsMotherfuckingFucked).hint("用经典的方式操艾米莉的小穴。");
            }
            if(get_player().hasVagina())
            {
               addButton(2,"被舔",corruptAmilyLickPussiesLikeAPro).hint("让艾米莉舔你的小穴。");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) > 0)
               {
                  addButton(3,"被插入",corruptAmilyCampBonesPCWithHerCock).hint("让艾米莉好好利用她的肉棒，插入你的小穴。","被插入");
               }
               addButton(4,"磨豆腐",corruptAmilyScissorsLikeAPro).hint("和艾米莉享受一些女孩子之间的乐趣。");
            }
            setExitButton("返回",amilyFollowerEncounter);
         }
         else
         {
            outputText("你急切地脱下你的[armor]，向你那满眼崇拜的淫荡鼠娘展示自己……但当她的目光落在你光秃秃的胯部时，她发出了一声惊恐的尖叫。[say: 没有！那里什么都没有！" + get_player().mf("Master","Mistress") + "，你的生殖器怎么了？]她惊慌失措地尖叫着，手脚并用地冲上前来，把脸狠狠地埋进你的胯部。[pg]");
            outputText("她拼命地摸索、磨蹭着你，试图找到一些——任何——生殖器的迹象，但是，当然，她找不到。她立刻嚎啕大哭起来，哭得像个婴儿一样。[say: 为什么？你为什么要这样惩罚我，[master]？难道我不是你乖巧的小荡妇吗？难道我没有尽我所能去取悦你吗？为了性爱的荣耀，我毫不犹豫地贬低自己——你为什么要把它从我身边夺走？！][pg]");
            outputText("当她瘫倒在地上，哭得撕心裂肺时，你默默地穿好衣服溜走了。这所有的哭喊让你兴致全无，很明显，在你长出鸡巴、小穴或两者兼有之前，什么也做不了。");
            dynStats(DynStat.Lust(-20));
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1079) == 0)
            {
               doNext(playerMenu);
            }
            else
            {
               doNext(get_game().farm.farmCorruption.rootScene);
            }
         }
      }
      
      override public function amilyCorrupt() : Boolean
      {
         return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,43) == 2;
      }
      
      public function amilyCookingLesson() : void
      {
         clearOutput();
         amilySprite();
         outputText("你和艾米莉坐在一起，开始谈论奇哈强加给你的那次令人钦佩但几乎完全无法忍受的烹饪尝试。当然，她是好意，但如果你只是坐在那里假装享受，总有一天会要了你的命。");
         outputText("[pg][say: 我明白了……说实话，" + (izmaFollower() ? "就像伊兹玛一样，" : "") + "奇哈有点吓人。那个挥舞着火焰斧的龙唯一让你处于危险之中的事情就是做饭难吃，这真让人松了一口气！] 这只半紧张的老鼠轻声笑道。[say: 不过，我或许能帮她提高厨艺。我做饭还挺不错的。.]");
         outputText("[pg]真的吗，她愿意这么做？尽管她一直对你的多情感到不太适应？");
         outputText("[pg]艾米莉有些不好意思地揉了揉手臂。[say: 嗯，是的。我知道她经历了很多，其中很多事情都很糟糕。她其实不是个坏人，只是有些吓人，所以我不会怪她。我想，如果她能自信地知道自己能为你做出美味的食物，她会对自己感觉更好，这也是我更好地了解她的一个机会。双赢嘛！!]");
         outputText("[pg]这逻辑很好，很合理。你一开始挑起这个话题主要是为了发泄，但现在你变得兴奋起来。艾米莉真是一个非常体贴的恋人。");
         outputText("[pg]老鼠咧嘴一笑，跳了起来。[say: 好了！我去确认一下我们需要的食材是否齐全。你去跟奇哈谈谈，把她带过来就行！] 她匆匆离去，对这个主意感到非常兴奋。在为自己做了那么长时间的饭之后，能和别人分享她的厨艺可能是一件令人兴奋的事情。希望奇哈也同样热衷于此。");
         get_kihaFollowerScene().saveContent.badCookingTasted = 2;
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function amilyCockWatersports() : void
      {
         clearOutput();
         amilySprite(true);
         outputText("你与你的鼠娘恋人四目相对，将一只手臂搂在艾米莉的后腰上，将她拉近亲吻。你闭上眼睛，迷失在这个小女孩的拥抱中，你们的舌头交织在一起，手臂紧紧地缠绕着彼此。周围的空气静止了，唯一的声音是你们嘴唇轻柔的吧唧声和艾米莉在短暂喘息之间发出的微小吱吱声。");
         outputText("[pg]在艾米莉的怀抱中度过的几分钟感觉就像是幸福的几个小时。[if (!isnaked) { 你的衣服[if (hasundergarments){和内衣被一件件|被}]脱下，你的双手被解放出来，慵懒地抚摸着彼此的每一寸肌肤。}]虽然你们做爱的套路已经很熟悉了，但每一次亲吻、每一次触摸、每一次对生殖器俏皮的爱抚都感觉像是第一次。");
         outputText("[pg]你们的嘴唇仍然紧锁着，艾米莉将你放低到下面的铺盖卷上。她的手指顺着你的肚子滑下，抓住了你的[cock]。起初，她的指尖只是勉强地挠着你的皮肤，但她的动作很快就让你完全勃起，血液泵入你的肉棒，让你坚硬如石。轻轻地将你翻转到仰卧的姿势，这个[if (tallness > 60){小}]女孩将她的双腿跨过你的躯干，准备骑上你。艾米莉用一只手完全包裹住你肉棒的末端，分开她小穴的嘴唇，将你的男子气概滑入她的体内。在一个缓慢而平滑的动作中，她的臀部向下压以迎接你的臀部，同时她吞没了你肉棒的全部长度。艾米莉紧闭双眼，再次喘息，因为你的肉棒肉深深地插入她的下体，这种感觉传遍了她瘦弱的身躯。");
         outputText("[pg]艾米莉以稳定的节奏开始在你的身上旋转她的身体，弯下腰再次亲吻你，同时她的臀部让她的小穴摩擦你肉棒的每一寸。你们做爱时发出轻柔、有节奏的*啪啪*声，随着节奏开始加快，你和艾米莉也发出了愉悦的喘息和颤抖。艾米莉的小穴在你的肉棒周围感觉很温暖，当鼠娘越来越接近高潮时，它紧致的肉壁紧紧地夹住你。");
         outputText("[pg]艾米莉的小手指在你的肩膀顶部缠绕了一会儿，然后握紧并深深地掐入你的皮肤。她的臀部直到现在一直保持着良好的节奏，开始不规律地抽动。看到时机成熟，你抬起膝盖作为杠杆，开始从下面猛烈地撞击艾米莉的小穴，在恋人的下体深处进行长而深的抽插。她开始发声，但在高潮席卷她时，她无法说出任何有意义的话，而是在充满激情的吱吱声和尖叫声中夹杂着呼喊和呻吟。");
         outputText("[pg]感觉到紧紧包裹着你阴茎的肌肉痉挛开始减缓，你继续快速而深入地抽插，现在的力度足以让艾米莉的整个身体在你身上弹跳。你的臀部像打桩机一样运动，激烈交媾产生的淫液现在已经完全涂满了你的阴茎和双腿之间的皮肤。看到你没有减速，艾米莉大喊道，[say: [name]，我——我——我快……我高潮了！我高潮了！停——停下，我要尿——-]");
         outputText("[pg]你从她背后抬起一只手，手指滑过她的后脑勺，将她拉近，给了她一个快速的吻。退开后，你再次与艾米莉四目相对，仿佛在说，[say: 尿吧。.]");
         outputText("[pg]随着艾米莉瞳孔放大，担忧掠过她的双眼。你的肉棒在她体内捣弄的感觉变得难以忍受，第二次更强烈的高潮抓住了这只鼠娘。你[if (hasballs) {的睾丸紧绷，高潮也抓住了你；你}]的[cock]紧缩并跳动着，将一股股精液射入她的下体深处。她无法抑制，终于屈服了；你感觉到双腿间一阵温暖，金黄色的尿液从艾米莉体内喷涌而出，随着她臀部的动作四处飞溅。伴随着最后一次抽插，你将她的躯干紧紧贴向自己，她的乳房紧紧压着你，温暖的尿流直接冲刷着你的胯部。她的体液顺着你的大腿外侧流下，当艾米莉的尿液浸透了你身下的床单和被褥时，温暖的感觉流过你的[if (hasballs){睾丸和}]臀部。交媾产生的汗味和喘息声与你那鼠娘女友尿液的霉味混合在一起。在你的阴茎滑出并软倒在胸前之前，你又半心半意地抽插了几下。当艾米莉在你的肉棒上排空膀胱时，你最后的精液滴落在胸前。");
         outputText("[pg]片刻的恍惚之后，艾米莉的手紧紧握住你的手，她的目光急切地与你交汇。她尴尬地开始道歉。你将一根手指放在她的唇上打断了她，然后将她拉到你身边。你一言不发地微笑着，与你的老鼠情人依偎了一会儿，交换着轻吻和顽皮的戳弄。当她沉沉睡去时，你小心翼翼地从艾米莉的怀抱中抽身。你暗自思忖，记下在下次外出时要割些新鲜的草，为她做一个新窝。你在附近的溪流中快速洗了个澡，然后重新穿好衣服，继续你的冒险。");
         get_player().orgasm();
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function amilyCock() : String
      {
         var _loc1_:String = "";
         var _loc2_:Boolean = false;
         if(int(Math.random() * 3) == 0)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) < 3)
            {
               _loc1_ = "短粗的";
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) >= 3 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) < 5)
            {
               _loc1_ = "短的";
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) >= 5 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) < 7)
            {
               _loc1_ = "普通的";
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) >= 7 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) < 9)
            {
               _loc1_ = "长的";
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) >= 10 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) < 13)
            {
               _loc1_ = "巨大的";
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) >= 13 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) < 18)
            {
               _loc1_ = "粗大的";
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) >= 18 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) < 30)
            {
               _loc1_ = "庞大的";
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) >= 30)
            {
               _loc1_ = "高耸的";
            }
            _loc2_ = true;
         }
         if(int(Math.random() * 3) == 0)
         {
            if(FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,46) <= 0.75)
            {
               _loc1_ += "狭窄的";
            }
            if(FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,46) > 1 && FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,46) <= 1.4)
            {
               _loc1_ += "丰满的";
            }
            if(FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,46) > 1.4 && FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,46) <= 2)
            {
               _loc1_ += "宽阔的";
            }
            if(FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,46) > 2 && FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,46) <= 3.5)
            {
               _loc1_ += "肥胖的";
            }
            if(FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,46) > 3.5)
            {
               _loc1_ += "膨胀的";
            }
            _loc2_ = true;
         }
         var _loc3_:Number = int(Math.random() * 10);
         if(_loc3_ >= 0 && _loc3_ <= 4)
         {
            _loc1_ += "肉棒";
         }
         if(_loc3_ == 5 || _loc3_ == 6)
         {
            _loc1_ += "鸡巴";
         }
         if(_loc3_ == 7)
         {
            _loc1_ += "老二";
         }
         if(_loc3_ > 7)
         {
            _loc1_ += "阴茎";
         }
         return _loc1_;
      }
      
      public function amilyCanHaveTFNow() : Boolean
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,337) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,336) == 1 && get_player().hasItem(get_consumables().GLDSEED) && (get_player().hasItem(get_consumables().BLACKEG) || get_player().hasItem(get_consumables().L_BLKEG)))
         {
            if(!get_player().hasItem(get_consumables().P_S_MLK))
            {
               if(amilyCorrupt())
               {
                  return get_player().hasItem(get_consumables().SUCMILK);
               }
               return false;
            }
            return true;
         }
         return false;
      }
      
      public function amilyButt() : String
      {
         var _loc1_:String = "";
         var _loc2_:Number = 0;
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,50) <= 1)
         {
            if(Utils.rand(2) == 0)
            {
               _loc1_ = "小精灵般的";
            }
            else
            {
               _loc1_ = "非常小的";
            }
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,50) > 1 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,50) < 4)
         {
            _loc2_ = Utils.rand(3);
            if(_loc2_ == 0)
            {
               _loc1_ = "紧致的";
            }
            if(_loc2_ == 1)
            {
               _loc1_ = "结实的";
            }
            if(_loc2_ == 2)
            {
               _loc1_ = "紧凑的";
            }
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,50) >= 4 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,50) < 6)
         {
            _loc2_ = Utils.rand(2);
            if(_loc2_ == 0)
            {
               _loc1_ = "白皙的";
            }
            if(_loc2_ == 1)
            {
               _loc1_ = "漂亮的";
            }
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,50) >= 6 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,50) < 8)
         {
            _loc2_ = Utils.rand(3);
            if(_loc2_ == 0)
            {
               return "盈盈一握的屁股";
            }
            if(_loc2_ == 1)
            {
               _loc1_ = "丰满的";
            }
            if(_loc2_ == 2)
            {
               _loc1_ = "匀称的";
            }
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,50) >= 8 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,50) < 10)
         {
            _loc2_ = Utils.rand(3);
            if(_loc2_ == 0)
            {
               _loc1_ = "好捏的";
            }
            if(_loc2_ == 1)
            {
               _loc1_ = "大的";
            }
            if(_loc2_ == 2)
            {
               _loc1_ = "结实的";
            }
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,50) >= 10 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,50) < 13)
         {
            _loc2_ = Utils.rand(3);
            if(_loc2_ == 0)
            {
               _loc1_ = "摇晃的";
            }
            if(_loc2_ == 1)
            {
               _loc1_ = "宽大的";
            }
            if(_loc2_ == 2)
            {
               _loc1_ = "沉甸甸的";
            }
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,50) >= 13 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,50) < 16)
         {
            _loc2_ = Utils.rand(3);
            if(_loc2_ == 0)
            {
               _loc1_ = "吞没手掌的";
            }
            if(_loc2_ == 1)
            {
               return "丰满的屁股";
            }
            if(_loc2_ == 2)
            {
               _loc1_ = "庞大的";
            }
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,50) >= 16 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,50) < 20)
         {
            _loc2_ = Utils.rand(3);
            if(_loc2_ == 0)
            {
               _loc1_ = "巨大的";
            }
            if(_loc2_ == 1)
            {
               _loc1_ = "巨大的";
            }
            if(_loc2_ == 2)
            {
               return "颤巍巍的宽大屁股";
            }
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,50) >= 20)
         {
            _loc2_ = Utils.rand(3);
            if(_loc2_ == 0)
            {
               _loc1_ = "极大的";
            }
            if(_loc2_ == 1)
            {
               _loc1_ = "庞大的";
            }
            if(_loc2_ == 2)
            {
               _loc1_ = "硕大的";
            }
         }
         _loc2_ = Utils.rand(2);
         if(_loc2_ == 0)
         {
            _loc1_ += "屁股";
         }
         if(_loc2_ == 1)
         {
            _loc1_ += "屁股";
         }
         return _loc1_;
      }
      
      public function amilyBalls() : String
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,171) == 0)
         {
            return "前列腺";
         }
         var _loc2_:String = "";
         var _loc3_:Number = Utils.rand(3);
         if(_loc3_ == 0)
         {
            _loc2_ += "一对";
         }
         if(_loc3_ == 1)
         {
            _loc2_ += "两颗";
         }
         if(_loc3_ == 2)
         {
            _loc2_ += "一对";
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,171) > 1 && Utils.rand(3) <= 1)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,171) > 1 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,171) < 2)
            {
               _loc2_ += "大的";
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,171) >= 2 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,171) < 3)
            {
               _loc2_ += "棒球大小的";
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,171) >= 3 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,171) < 4)
            {
               _loc2_ += "苹果大小的";
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,171) >= 4 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,171) < 5)
            {
               _loc2_ += "葡萄柚大小的";
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,171) >= 5 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,171) < 7)
            {
               _loc2_ += "哈密瓜大小的";
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,171) >= 7 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,171) < 9)
            {
               _loc2_ += "足球大小的";
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,171) >= 9 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,171) < 12)
            {
               _loc2_ += "篮球大小的";
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,171) >= 12 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,171) < 15)
            {
               _loc2_ += "西瓜大小的";
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,171) >= 15 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,171) < 18)
            {
               _loc2_ += "沙滩球大小的";
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,171) >= 18)
            {
               _loc2_ += "肿胀得可怕的巨大";
            }
         }
         else if(amilyFurry())
         {
            _loc2_ += "毛茸茸的";
         }
         _loc3_ = Utils.rand(9);
         if(_loc3_ < 4)
         {
            _loc2_ += "蛋蛋";
         }
         if(_loc3_ >= 4 && _loc3_ < 6)
         {
            _loc2_ += "睾丸";
         }
         if(_loc3_ == 6)
         {
            _loc2_ += "睾丸";
         }
         if(_loc3_ == 7)
         {
            _loc2_ += "性腺";
         }
         if(_loc3_ == 8)
         {
            _loc2_ += "蛋蛋";
         }
         return _loc2_;
      }
      
      public function amilyAppearance() : void
      {
         var _loc6_:* = null as String;
         amilySprite();
         clearOutput();
         var _loc1_:String = "它无毛的阴唇在她的皮毛间似乎闪闪发光";
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,337) == 1)
         {
            _loc1_ = "它的阴唇与她的大腿形成对比，似乎闪闪发光";
         }
         var _loc2_:String = amilyFurry() ? "鼠人" : "鼠娘";
         var _loc3_:String = amilyFurry() ? "在她毛茸茸的小口鼻上 " : "";
         var _loc4_:String = "";
         var _loc5_:String = "";
         if(amilyFurry())
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,43) == 2)
            {
               _loc4_ = "除了手、脚、耳朵和尾巴，她全身都覆盖着皮毛。";
               _loc5_ = "令人惊讶的像手一样的粉色爪子，而不是脚";
            }
            else
            {
               _loc4_ = "除了手、脚、耳朵和尾巴，她全身都覆盖着皮毛。她有着娇小、令人惊讶的像手一样的粉色爪子，而不是脚，并且";
            }
         }
         else
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,43) == 2)
            {
               _loc5_ = "标志性的魅魔高跟鞋";
            }
            _loc4_ = "她的脸庞被一头时尚的赤褐色波波头包围，大大的老鼠耳朵从发型中伸出。她有一双娇小精致的脚，并且";
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,43) == 1)
         {
            outputText("艾米莉是一个身高5英尺2英寸的" + _loc2_ + "，体格精瘦结实。她粉红色的眼睛通常闪烁着欢快的光芒，但如果情况需要，它们也会变得冷酷无情，就像" + _loc3_ + "通常友好的笑容在她生气时会变得残忍严厉一样。" + _loc4_ + "一条长长的、无毛的老鼠尾巴在她的身后不断地摇摆和抽动。她目前穿着[amilyclothing]。" + (saveContent.ringType != "" ? "她的手指上戴着你送给她的" + saveContent.ringType + "戒指。你敢肯定自从你送给她之后，她就再也没有摘下过它。" : "") + "她有" + amilyHips() + "和" + amilyButt() + "。[pg]");
            outputText("她的胸前有一对" + amilyTits() + "。它们的顶端有" + (FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,48) > 0 ? FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,48) + "英寸的" : "可爱的小") + "乳头，" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,47) > 0 ? "而且至少有" + Appearance.breastCup(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,47)) + "罩杯" : "但还不足以撑起一件胸罩") + "。[pg]");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) > 0)
            {
               _loc6_ = amilyFurry() ? "光秃秃的、没有毛、粉红色且跳动着" : "粉红色且跳动着";
               outputText("她的胯部长着一根" + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) + "英寸的阴茎，取代了通常会从外阴突出的阴蒂。它看起来惊人地像人类的，" + _loc6_ + "");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,171) == 0)
               {
                  outputText("——它甚至有包皮，而不是包皮鞘。");
               }
               else
               {
                  outputText("，尽管它确实有一个" + (!amilyFurry() ? "小包皮鞘。" : "毛茸茸的小包皮鞘。") + "");
               }
               outputText("[pg]");
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,171) > 0)
            {
               outputText("她有" + amilyBalls() + "悬挂在");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) > 0)
               {
                  outputText("她的肉棒下方");
               }
               else
               {
                  outputText("她的腹股沟处");
               }
               outputText("。[pg]");
            }
            outputText("艾米莉的双腿之间有一个粉红色的小穴；" + _loc1_ + "。");
         }
         else
         {
            outputText("艾米莉是一个身高5英尺2英寸的" + _loc2_ + "，体格精瘦结实。她粉红色的眼睛通常闪烁着欢快的光芒，但如果情况需要，它们也会变得冷酷无情，就像" + _loc3_ + "通常友好的笑容在她生气时会变得残忍严厉一样。" + _loc4_ + "一条长长的、无毛的老鼠尾巴在她的身后不断地摇摆和抽动。她目前穿着[amilyclothing]。她有" + amilyHips() + "和" + amilyButt() + "。[pg]");
            outputText("她的胸前有一对" + amilyTits() + "。它们的顶端有" + (FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,48) > 0 ? FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,48) + "英寸的" : "可爱的小") + "乳头，" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,47) > 0 ? "而且至少有" + Appearance.breastCup(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,47)) + "罩杯" : "但还不足以撑起一件胸罩") + "。[pg]");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) > 0)
            {
               outputText("她的胯部长着一根半勃起的" + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) + "英寸阴茎。它看起来惊人地像人类的，" + (amilyFurry() ? "光秃秃的、没有毛，" : "") + "粉红色且跳动着");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,171) == 0)
               {
                  outputText("--它甚至有包皮，而不是阴茎鞘。[pg]");
               }
               else
               {
                  outputText("，不过它确实有一个" + (!amilyFurry() ? "小小的阴茎鞘。" : "毛茸茸的小阴茎鞘。") + "[pg]");
               }
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,171) > 0)
            {
               outputText("她有" + amilyBalls() + "悬挂在");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) > 0)
               {
                  outputText("她的肉棒下方");
               }
               else
               {
                  outputText("她的腹股沟处");
               }
               outputText("，当你注视着它们时，里面翻腾着精液。[pg]");
            }
            outputText("艾米莉有着");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,172) == 2)
            {
               outputText("湿润的，");
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,172) == 3)
            {
               outputText("潮湿的，");
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,172) == 4)
            {
               outputText("水淋淋的，");
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,172) >= 5)
            {
               outputText("湿透的，");
            }
            outputText("双腿间粉嫩的小穴；" + _loc1_ + "。[pg]");
            if(get_game().farm.farmCorruption.hasTattoo("amily"))
            {
               outputText("[pg]");
               if(get_game().farm.farmCorruption.amilyFullTribalTats())
               {
                  outputText("她从头到尾都覆盖着部落纹身，情色的线条在她赤裸的身躯上蜿蜒，让她看起来像一个几乎未被驯服的野蛮人。[pg]");
               }
               else
               {
                  if(get_game().farm.farmCorruption.numTattoos("amily") > 1)
                  {
                     outputText("她的身上纹着以下纹身：\n");
                  }
                  else
                  {
                     outputText("她有着");
                  }
                  if(1137 in KFLAGS.flags.h)
                  {
                     outputText(FlagDict_Impl_.arrayReadString(KFLAGS.flags,1137) + "\n");
                  }
                  if(1138 in KFLAGS.flags.h)
                  {
                     outputText(FlagDict_Impl_.arrayReadString(KFLAGS.flags,1138) + "\n");
                  }
                  if(1139 in KFLAGS.flags.h)
                  {
                     outputText(FlagDict_Impl_.arrayReadString(KFLAGS.flags,1139) + "\n");
                  }
                  if(1140 in KFLAGS.flags.h)
                  {
                     outputText(FlagDict_Impl_.arrayReadString(KFLAGS.flags,1140) + "\n");
                  }
               }
            }
         }
         outputText("[pg]在她的鼠臀之间，长着一个粉嫩的小巧菊穴，正处于它该在的位置。");
         button(null,"外貌").disable();
         get_output().flush();
      }
      
      public function acceptAmilysOfferEagerly() : void
      {
         clearOutput();
         amilySprite();
         outputText("你忍不住淫荡地咧嘴笑了。在这个世界上，很少有人想做爱时会真的开口问你，而不是直接把你打晕然后强奸你。你告诉艾米莉，如果她想让你操她，你会很乐意效劳。[pg]");
         outputText("鼠女看起来很震惊。[say:你非得这么粗俗吗？]她抱怨道。[pg]");
         outputText("你告诉她这正是她要求你做的事，如果这是她想要的，你会很乐意这么做。[pg]");
         outputText("她看起来依然很不满。[say:好吧，来吧。我想指望你在这种世界里游荡，在性方面还能保持一些礼节，实在是太奢望了……]她开始在前面带路，你跟在后面。她没有多少屁股可看，但你已经能想到用她那条尾巴做些有趣的事情了……[pg]");
         outputText("你鲁莽的热情让艾米莉感到不适，而你迅速屈服于低级冲动也让你变得更加好色。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,39,1);
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,38,FlagDict_Impl_.arrayReadInt(_loc1_,38) - 5);
         dynStats(DynStat.Lib(5));
         doNext(amilySexHappens);
      }
      
      public function acceptAmilyOfferHesitantly() : void
      {
         clearOutput();
         amilySprite();
         outputText("这个提议令人震惊……然而，却又出奇地诱人。你忍不住觉得，能遇到一个即使比你村里的人在性方面更露骨，却依然能带着些许礼节来处理这件事的人，感觉真好。你对这个邀请依然感到惊讶甚至尴尬，但你忍不住觉得接受它或许是值得的。这是为了一个好的目的，而且她自己显然也不完全适应。也许你在这个充满兽人和怪物的世界里待得太久了，但她其实还挺可爱的。[pg]");
         outputText("你轻声问她是否真的想让你和她交配，成为她后代的父亲。[pg]");
         outputText("[say: 是的。你是我最大的希望……也是我唯一的希望。]她悲伤地回答道。[pg]");
         outputText("你低下头告诉她，如果她真的需要你的帮助，你会帮她的——即使这意味着要和她做她不想做的事。[pg]");
         outputText("她眨了眨眼，显然很惊讶。[say: 我从来没见过哪个男性会真正在意女性是否想要做爱……]然后她温柔地笑了。[say: 很高兴能遇到一个不把别人当成性玩具的人。请跟我来。][pg]");
         outputText("她急切地领着你走下一条小路，尾巴充满活力地来回摆动。她似乎对你的接受感到非常高兴。[pg]");
         outputText("看来你问这是否是她想要的，让艾米莉很高兴。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,39,1);
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,38,FlagDict_Impl_.arrayReadInt(_loc1_,38) + 5);
         doNext(amilySexHappens);
      }
      
      public function acceptAmilyAsYourFemaleWaifu() : void
      {
         amilySprite();
         clearOutput();
         outputText("你惊讶地看着她。然后，你握住她的手，对她微笑。你告诉她，没有什么比让她在这里，和你住在一起，和她在一起更让你高兴的了。艾米莉高兴地大声尖叫，热情地拥抱你，尽可能深地吻你。当她终于因为缺氧而放开你时，她好好地环顾了一下营地，就好像她是第一次看到它一样。[pg]");
         outputText("[say: 好吧，我最好开始搬进来，是吧？]她开玩笑说。然后她扑通一声倒在你在你旁边的睡袋上，[say: 好了，我搬进来了。]她对你咧嘴一笑，你忍不住笑了。[pg]");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,36,1);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,43,1);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,47,1);
         FlagDict_Impl_.arrayWriteFloat(KFLAGS.flags,48,0.3);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,49,6);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,50,6);
         doNext(playerMenu);
      }
      
      public function _encounterAmily() : void
      {
         var _loc1_:* = null as IMap;
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,35) == 0)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,164,get_player().get_gender());
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,338) > 0 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,36) == 1 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,599) > 0)
         {
            outputText("你小心翼翼地走进这座废弃的村庄。这里到处都是被烧毁的房屋、被砸碎的门廊、被掀翻的屋顶……一切都被灰尘和污垢覆盖着。你探索了一个小时，但没有发现任何其他生物的踪迹，也没有找到任何有价值的东西。泥土中偶尔会出现小恶魔或地精的脚印，但你并没有看到这些生物本身。看起来，自从这里最初被废弃以来，时间和路过的恶魔已经把这个地方洗劫一空了。最后，你放弃了并离开了。当你走出村庄时，你感觉轻松多了。");
            doNext(get_camp().returnToCampUseOneHour);
            return;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,43) == 2)
         {
            amilySprite();
            outputText("你走进这座废弃的村庄，仍然在为你过去犯下的邪恶行径而发笑。也许这只是你的想象，但你觉得现在整个地方都散发着腐化的气息……你探索了一个小时，然后回到了你的营地，因为你知道你那被玷污的奴隶会非常乐意满足你的欲望。");
            doNext(get_camp().returnToCampUseOneHour);
            return;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,37) == 1)
         {
            if(!get_player().hasStatusEffect(StatusEffects.Infested))
            {
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,37,0);
            }
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,168) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,35) > 0 && !get_player().isPureEnough(25))
         {
            meetAmilyAsACorruptAsshat();
            return;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,168) > 0 && !get_player().isPureEnough(25))
         {
            if(!get_player().hasKeyItem("Potent Mixture") && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,170) < 3)
            {
               cookAmilyASnack();
               return;
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,170) == 0)
            {
               stalkingZeAmiliez();
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,170) == 1)
            {
               stalkingZeAmiliez2();
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,170) == 2)
            {
               stalkingZeAmiliez3();
            }
            else
            {
               rapeCorruptAmily4Meeting();
            }
            return;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,37) == 1 || !get_player().isPureEnough(25) || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,168) > 0)
         {
            outputText("你小心翼翼地走进这座废弃的村庄。这里到处都是被烧毁的房屋、被砸碎的门廊、被掀翻的屋顶……一切都被灰尘和污垢覆盖着。你探索了几个小时，但没有发现任何其他生物的踪迹，也没有找到任何有价值的东西。泥土中偶尔会出现小恶魔或地精的脚印，但你并没有看到这些生物本身。看起来，自从这里最初被废弃以来，时间和路过的恶魔已经把这个地方洗劫一空了。最后，你放弃了并离开了。当你走出村庄时，你感觉轻松多了——因为你在里面时，有一种被人监视的奇怪感觉。");
            doNext(get_camp().returnToCampUseOneHour);
            return;
         }
         amilySprite();
         if(pregnancy.get_isPregnant() && pregnancy.get_incubation() == 0)
         {
            fuckingMouseBitchPopsShitOut();
            pregnancy.knockUpForce();
            return;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,165) == 4)
         {
            amilyNewCock();
            return;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,165) == 3 && get_player().get_gender() == 3)
         {
            amilyPCNewCock();
            return;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,164) == get_player().get_gender())
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,40) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,162) >= 5 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,36) == 0)
            {
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,38) < 40)
               {
                  thisIsAReallyShittyBadEnd();
               }
               else
               {
                  thisFunctionProbablySucksTooOhYeahAmilyFunction();
               }
               return;
            }
            if(get_player().get_gender() == 1)
            {
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,38) >= 50 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,42) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,164) == 1)
               {
                  outputText("你漫步走进这座废弃的村庄，开始寻找艾米莉。[pg]");
                  outputText("在思考了一会儿到底该如何追踪艾米莉之后，你听到了一声口哨。环顾四周，你看到她从一个角落里调皮地向你挥手；很明显，想要在这种游戏中击败她，你还有很长的路要走。[pg]");
                  outputText("[say: 啊……你有时间聊聊吗？我有些话想对你说，] 艾米莉紧张地问道。[pg]");
                  outputText("你对她要说的话很好奇，于是同意了。[pg]");
                  outputText("艾米莉用她那像手指一样的脚趾爪在地上蹭着，低头看着它，仿佛那是世界上最有趣的东西——或者仿佛她不敢直视你的眼睛。[say: 我……你知道我一直对你有什么要求——从你那里——而你却一直拒绝我……但你还是继续和我说话，问我关于我的事情。你想了解我，但是……你为什么不想了解我的全部呢？我……我想把自己交给你。你是我见过的最善良、最温柔的男人——甚至在恶魔摧毁我的村庄之前也是。我想和你在一起……但你似乎不想和我在一起。] 她终于抬起头看着你，眼中满是泪水。[say: 我有什么问题吗？你就不能以那种方式喜欢我吗？] 她恳求道。[pg]");
                  menu();
                  addNextButton("接受她",desperateAmilyPleaAcceptHer);
                  if(amilyCanHaveTFNow())
                  {
                     addNextButton("除毛",amilyDefurrify);
                  }
                  else if(!get_noFur())
                  {
                     addNextButton("拒绝兽人",amilyNoFur);
                  }
                  addNextButton("温柔拒绝",desperateAmilyPleaTurnDown);
                  addNextButton("直白拒绝",desperateAmilyPleaTurnDownBlunt);
                  return;
               }
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,35) == 0)
               {
                  FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,158,get_player().get_gender());
                  _loc1_ = KFLAGS.flags;
                  FlagDict_Impl_.arrayWriteInt(_loc1_,35,FlagDict_Impl_.arrayReadInt(_loc1_,35) + 1);
                  outputText("你深入到由布满灰尘的摇摇欲坠的建筑和扭曲的树苗组成的迷宫中，寻找任何生命的迹象——或者，如果没有的话，寻找一些能对你的任务有所帮助的东西。你弯下腰在一堆旧垃圾中翻找，大声抱怨这根本不是你作为勇者应该做的事情。突然，你听到“嗖”的一声，有什么东西从你脸旁飞过，扎进了你头部附近的一堵石墙里，因为撞击而颤抖着。[pg]");
                  outputText("[say: 别轻举妄动！] 一个声音喊道，声音尖锐，有点像老鼠的吱吱声，但坚定而威严。你僵住了，以免给袭击者再次向你射击的理由。[say: 站起来，转过身，慢慢来，] 它再次命令道。你照做了。[pg]");
                  if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2311) != 0)
                  {
                     outputText("把你逼到角落的生物显然和乔乔是同一个种族，不过明显是该物种的雌性。她的" + (get_noFur() ? "皮肤上覆盖着" : "皮毛上沾满了") + "灰尘，但你仍然可以很容易地辨认出它的" + (get_noFur() ? "棕褐色" : "赤褐色") + "。她的四肢和腹部都很结实，这既是因为经常吃不饱，也是因为不断的锻炼和体力消耗。她没有臀部，胸部也不可能比A罩杯大。她穿着一条破烂的裤子和一件同样破烂的衬衫。一把非常大且看起来很邪恶的匕首——实际上更像是一把短剑——绑在她的臀部，她正用一根吹箭筒威胁你。[pg]");
                  }
                  else
                  {
                     outputText("你被一个" + (get_noFur() ? "" : "非常") + "奇怪的生物逼到了角落：一个" + (get_noFur() ? "" : "两足行走的") + "雌性人形生物，有着" + (get_noFur() ? "老鼠的特征" : "明显的巨型老鼠特征") + "；" + (get_noFur() ? "" : "像爪子一样的脚，一个长着口鼻的头，上面有") + "长长的胡须，大大的老鼠耳朵，以及一条" + (get_noFur() ? "细长的尾巴" : "覆盖着沾满灰尘的赤褐色皮毛的身体") + "。看起来她的生活并不轻松；她的衣服由一条肮脏、破烂的裤子和衬衫组成，而她的四肢和腹部都很结实，这既是因为经常吃不饱，也是因为不断的锻炼和体力消耗。她没有臀部，胸部也不可能比A罩杯大。尽管如此，她看起来很有能力保护自己；她不仅挥舞着一根吹箭筒，显然准备向你吐出另一根毫无疑问有毒的飞镖，而且她的臀部还绑着一把看起来很可怕的刀。[pg]");
                  }
                  outputText("她盯着你看了好一会儿，然后放下了吹箭管，[say: 抱歉，我还以为你是另一个恶魔。他们多年前摧毁了这个地方，但偶尔还是会有一些该死的拾荒者游荡过来。当然，最近没那么多了。我给他们留下了点“深刻印象”。]她恶意地咧嘴一笑，一只手以近乎挑逗的方式抚摸着刀刃。[saystart]我叫艾米莉，是这个村子最后的幸存者。我的族人都已经不在了；他们流离失所、死去、被奴役，或者遭遇了更糟的命运。你呢？");
                  if(get_player().humanScore() > 4)
                  {
                     outputText("你是");
                  }
                  else
                  {
                     outputText("你曾经是");
                  }
                  outputText("我听说偶尔会游荡到这个世界来的……人类之一吗？[sayend][pg]");
                  outputText("你承认了，是的，你是一个人类，然后问她为什么还要留在这个空荡荡的废墟聚落里。[pg]");
                  outputText("[say: 我在这里出生，在这里长大，如果不是因为那些恶魔，我本该在这里结婚定居的。]她轻蔑地吐出“恶魔”这个词。[say: 一切结束后，我无处可去。所以我留在了这里。老实说，我依然无处可去。我没有找到任何其他同族的聚落，而且我宁死也不愿向恶魔屈服。但看起来，如果我想看到更多我的族人自由地生活，我就必须得挑起大梁了……][pg]");
                  outputText("她目不转睛地盯着你，你问她怎么了。[pg]");
                  outputText("[say: 你看，我刚才说的挑大梁？我想了很久，除了我没有别人能做这件事了。如果想要有更多生来自由的同族，他们就必须被生下来。字面意思；我需要找一个纯洁的伴侣，一个能给我带来强壮纯洁的同族后代的伴侣，]她解释道，一只手心不在焉地抚摸着平坦的小腹。[say: 我好不容易找到的几个同族男性都是恶魔的奴隶——他们太堕落了，根本不适合做伴侣，就算我能把他们救出来也不行。不过我听说，人类的繁衍能力出奇地弱；你的种子不会带有污染，而且你能繁育出更多我的同族。不像小恶魔或者牛头人那样。][pg]");
                  outputText("她把吹箭管别在腰带上，有些迟疑地向你走了几步，尽管她灰头土脸，而且显然对此毫无经验，但还是试图表现得迷人——甚至有些轻浮。[say: 拜托了，你能帮帮我吗？你说过你是勇者什么的——如果你和我上床，帮我把更多的族人带到这个世界上，让他们免受恶魔的侵害和邪恶的污染，你就是在用另一种方式打击他们对玛瑞斯的腐败统治。][pg]");
                  outputText("你要怎么做？");
                  menu();
                  addButton(0,"急切接受",acceptAmilysOfferEagerly);
                  addButton(1,"犹豫接受",acceptAmilyOfferHesitantly);
                  if(!get_noFur())
                  {
                     addButton(2,"拒绝福瑞",amilyNoFur);
                  }
                  addButton(3,"拒绝",refuseAmilysOffer);
                  FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,164,get_player().get_gender());
                  return;
               }
               if(get_player().get_gender() == 1 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,39) == 0)
               {
                  outputText("你漫步走进这座废弃的村庄，开始寻找艾米莉。[pg]");
                  outputText("在思考了一会儿到底该如何追踪艾米莉之后，你听到了一声口哨。环顾四周，你看到她从一个角落里调皮地向你挥手；很明显，想要在这种游戏中击败她，你还有很长的路要走。[pg]");
                  amilyRemeetingContinued();
                  FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,164,get_player().get_gender());
                  return;
               }
            }
            else if(get_player().get_gender() == 2)
            {
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,35) == 0)
               {
                  FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,158,get_player().get_gender());
                  _loc1_ = KFLAGS.flags;
                  FlagDict_Impl_.arrayWriteInt(_loc1_,35,FlagDict_Impl_.arrayReadInt(_loc1_,35) + 1);
                  outputText("你深入到由布满灰尘的摇摇欲坠的建筑和扭曲的树苗组成的迷宫中，寻找任何生命的迹象——或者，如果没有的话，寻找一些能对你的任务有所帮助的东西。你弯下腰在一堆旧垃圾中翻找，大声抱怨这根本不是你作为勇者应该做的事情。突然，你听到“嗖”的一声，有什么东西从你脸旁飞过，扎进了你头部附近的一堵石墙里，因为撞击而颤抖着。[pg]");
                  outputText("[say: 别轻举妄动！] 一个声音喊道，声音尖锐，有点像老鼠的吱吱声，但坚定而威严。你僵住了，以免给袭击者再次向你射击的理由。[say: 站起来，转过身，慢慢来，] 它再次命令道。你照做了。[pg]");
                  if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2311) > 0)
                  {
                     outputText("把你逼到角落的生物显然和乔乔是同一个种族，不过明显是该物种的雌性。她的" + (get_noFur() ? "皮肤上覆盖着" : "皮毛上沾满了") + "灰尘，但你仍然可以很容易地辨认出它的" + (get_noFur() ? "棕褐色" : "赤褐色") + "。她的四肢和腹部都很结实，这既是因为经常吃不饱，也是因为不断的锻炼和体力消耗。她没有臀部，胸部也不可能比A罩杯大。她穿着一条破烂的裤子和一件同样破烂的衬衫。一把非常大且看起来很邪恶的匕首——实际上更像是一把短剑——绑在她的臀部，她正用一根吹箭筒威胁你。[pg]");
                  }
                  else
                  {
                     outputText("你被一个" + (get_noFur() ? "" : "非常") + "奇怪的生物逼到了角落：一个两足行走的雌性类人生物，具有" + (get_noFur() ? "老鼠的特征" : "巨型老鼠的明显特征") + "；" + (get_noFur() ? "" : "像爪子一样的脚，长着") + "长胡须的口鼻，大大的老鼠耳朵，以及" + (get_noFur() ? "又长又细的尾巴" : "覆盖着沾满灰尘的赤褐色皮毛的身体") + "。看起来她的生活并不轻松；她的衣服是一套肮脏破烂的裤子和衬衫，而她的四肢和腰腹结实有力，这既是因为经常食不果腹，也是因为不断的锻炼和体力消耗。她几乎没有臀部，乳房也不可能比A罩杯大。尽管如此，她看起来很有能力保护自己；她不仅挥舞着吹箭筒，显然准备向你吐出另一支无疑有毒的飞镖，而且她的臀部还绑着一把看起来很可怕的刀。[pg]");
                  }
                  outputText("她盯着你看了好一会儿，然后放下了吹箭管，[say: 抱歉，我还以为你是另一个恶魔。他们多年前摧毁了这个地方，但偶尔还是会有一些该死的拾荒者游荡过来。当然，最近没那么多了。我给他们留下了点“深刻印象”。]她恶意地咧嘴一笑，一只手以近乎挑逗的方式抚摸着刀刃。[saystart]我叫艾米莉，是这个村子最后的幸存者。我的族人都已经不在了；他们流离失所、死去、被奴役，或者遭遇了更糟的命运。你呢？");
                  if(get_player().humanScore() > 4)
                  {
                     outputText("你是");
                  }
                  else
                  {
                     outputText("你曾经是");
                  }
                  outputText("我听说偶尔会游荡到这个世界来的……人类之一吗？[sayend][pg]");
                  outputText("你承认了，是的，你是一个人类，然后问她为什么还要留在这个空荡荡的废墟聚落里。[pg]");
                  outputText("[say: 我在这里出生，在这里长大，如果不是因为那些恶魔，我本该在这里结婚定居的。]她轻蔑地吐出“恶魔”这个词。[say: 一切结束后，我无处可去。所以我留在了这里。老实说，我依然无处可去。我没有找到任何其他同族的聚落，而且我宁死也不愿向恶魔屈服。但看起来，如果我想看到更多我的族人自由地生活，我就必须得挑起大梁了……][pg]");
                  outputText("她摇摇头，依依不舍地对你微笑。[say: 听我在这里胡言乱语。再次为攻击你道歉。但是，在外面要小心；有很多奇怪的怪物，如果它们能抓住一个[if (ischild) {女孩|女人}]，就会对她做最难以启齿的事情。][pg]");
                  outputText("你向她道谢，她不以为意。[pg]");
                  outputText("[say: 嘿，我们女孩得团结一致，对吧？]她对你眨眨眼，然后走到一堵部分倒塌的墙后，消失在瓦砾中。");
                  FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,164,get_player().get_gender());
                  doNext(get_camp().returnToCampUseOneHour);
                  return;
               }
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,159) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,38) >= 25)
               {
                  amilyIsTotallyALesbo();
                  return;
               }
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,159) == 2 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,165) < 3)
               {
                  amilyPostConfessionGirlRemeeting();
                  return;
               }
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,38) > 35 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,159) == 1)
               {
                  FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,38,35);
                  amilyIsTotallyALesbo();
                  return;
               }
            }
            else if(get_player().get_gender() == 3)
            {
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,35) == 0)
               {
                  FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,158,get_player().get_gender());
                  _loc1_ = KFLAGS.flags;
                  FlagDict_Impl_.arrayWriteInt(_loc1_,35,FlagDict_Impl_.arrayReadInt(_loc1_,35) + 1);
                  outputText("你深入到由布满灰尘的摇摇欲坠的建筑和扭曲的树苗组成的迷宫中，寻找任何生命的迹象——或者，如果没有的话，寻找一些能对你的任务有所帮助的东西。你弯下腰在一堆旧垃圾中翻找，大声抱怨这根本不是你作为勇者应该做的事情。突然，你听到“嗖”的一声，有什么东西从你脸旁飞过，扎进了你头部附近的一堵石墙里，因为撞击而颤抖着。[pg]");
                  outputText("[say: 别轻举妄动！] 一个声音喊道，声音尖锐，有点像老鼠的吱吱声，但坚定而威严。你僵住了，以免给袭击者再次向你射击的理由。[say: 站起来，转过身，慢慢来，] 它再次命令道。你照做了。[pg]");
                  if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2311) > 0)
                  {
                     outputText("把你逼到角落的生物显然和乔乔是同一个种族，不过明显是该物种的雌性。她的" + (get_noFur() ? "皮肤上覆盖着" : "皮毛上沾满了") + "灰尘，但你仍然可以很容易地辨认出它的" + (get_noFur() ? "棕褐色" : "赤褐色") + "。她的四肢和腹部都很结实，这既是因为经常吃不饱，也是因为不断的锻炼和体力消耗。她没有臀部，胸部也不可能比A罩杯大。她穿着一条破烂的裤子和一件同样破烂的衬衫。一把非常大且看起来很邪恶的匕首——实际上更像是一把短剑——绑在她的臀部，她正用一根吹箭筒威胁你。[pg]");
                  }
                  else
                  {
                     outputText("你被一个" + (get_noFur() ? "" : "非常") + "奇怪的生物逼到了角落：一个两足行走的雌性类人生物，具有" + (get_noFur() ? "老鼠的特征" : "巨型老鼠的明显特征") + "；" + (get_noFur() ? "" : "像爪子一样的脚，长着") + "长胡须的口鼻，大大的老鼠耳朵，以及" + (get_noFur() ? "又长又细的尾巴" : "覆盖着沾满灰尘的赤褐色皮毛的身体") + "。看起来她的生活并不轻松；她的衣服是一套肮脏破烂的裤子和衬衫，而她的四肢和腰腹结实有力，这既是因为经常食不果腹，也是因为不断的锻炼和体力消耗。她几乎没有臀部，乳房也不可能比A罩杯大。尽管如此，她看起来很有能力保护自己；她不仅挥舞着吹箭筒，显然准备向你吐出另一支无疑有毒的飞镖，而且她的臀部还绑着一把看起来很可怕的刀。[pg]");
                  }
                  outputText("她盯着你看了好一会儿，然后放下了吹箭管，[say: 抱歉，我还以为你是另一个恶魔。他们多年前摧毁了这个地方，但偶尔还是会有一些该死的拾荒者游荡过来。当然，最近没那么多了。我给他们留下了点“深刻印象”。]她恶意地咧嘴一笑，一只手以近乎挑逗的方式抚摸着刀刃。[saystart]我叫艾米莉，是这个村子最后的幸存者。我的族人都已经不在了；他们流离失所、死去、被奴役，或者遭遇了更糟的命运。你呢？");
                  if(get_player().humanScore() > 4)
                  {
                     outputText("你是");
                  }
                  else
                  {
                     outputText("你曾经是");
                  }
                  outputText("我听说偶尔会游荡到这个世界来的……人类之一吗？[sayend][pg]");
                  outputText("你承认了，是的，你是一个人类，然后问她为什么还要留在这个空荡荡的废墟聚落里。[pg]");
                  outputText("[say: 我在这里出生，在这里长大，如果不是因为那些恶魔，我本该在这里结婚定居的。]她轻蔑地吐出“恶魔”这个词。[say: 一切结束后，我无处可去。所以我留在了这里。老实说，我依然无处可去。我没有找到任何其他同族的聚落，而且我宁死也不愿向恶魔屈服。但看起来，如果我想看到更多我的族人自由地生活，我就必须得挑起大梁了……][pg]");
                  outputText("她看起来若有所思。[say: 你知道吗……] 她刚开口，却又停了下来，");
                  if(get_player().biggestTitSize() < 1)
                  {
                     outputText("用力地嗅了嗅空气，胡须微微颤动。");
                  }
                  else
                  {
                     outputText("盯着你上面和下面的凸起。");
                  }
                  outputText("[say: 算了，] 过了一会儿她说道。[say: 你是个双性人，对吧？就当我没说过。][pg]");
                  outputText("她转过身走开了，像变魔术一样消失在尘土和瓦砾中。");
                  FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,164,get_player().get_gender());
                  doNext(get_camp().returnToCampUseOneHour);
                  return;
               }
               if((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,38) >= 15 && Utils.rand(3) == 0 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,38) >= 20) && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,165) == 0)
               {
                  whyNotHerms();
                  return;
               }
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,165) == 1)
               {
                  maybeHermsAintAllBadBITCH();
                  return;
               }
            }
            else if(get_player().get_gender() == 0)
            {
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,35) == 0)
               {
                  FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,158,get_player().get_gender());
                  _loc1_ = KFLAGS.flags;
                  FlagDict_Impl_.arrayWriteInt(_loc1_,35,FlagDict_Impl_.arrayReadInt(_loc1_,35) + 1);
                  outputText("你深入到由布满灰尘的摇摇欲坠的建筑和扭曲的树苗组成的迷宫中，寻找任何生命的迹象——或者，如果没有的话，寻找一些能对你的任务有所帮助的东西。你弯下腰在一堆旧垃圾中翻找，大声抱怨这根本不是你作为勇者应该做的事情。突然，你听到“嗖”的一声，有什么东西从你脸旁飞过，扎进了你头部附近的一堵石墙里，因为撞击而颤抖着。[pg]");
                  outputText("[say: 别轻举妄动！] 一个声音喊道，声音尖锐，有点像老鼠的吱吱声，但坚定而威严。你僵住了，以免给袭击者再次向你射击的理由。[say: 站起来，转过身，慢慢来，] 它再次命令道。你照做了。[pg]");
                  if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2311) > 0)
                  {
                     outputText("把你逼到角落的生物显然和乔乔是同一个种族，不过明显是该物种的雌性。她的" + (get_noFur() ? "皮肤上覆盖着" : "皮毛上沾满了") + "灰尘，但你仍然可以很容易地辨认出它的" + (get_noFur() ? "棕褐色" : "赤褐色") + "。她的四肢和腹部都很结实，这既是因为经常吃不饱，也是因为不断的锻炼和体力消耗。她没有臀部，胸部也不可能比A罩杯大。她穿着一条破烂的裤子和一件同样破烂的衬衫。一把非常大且看起来很邪恶的匕首——实际上更像是一把短剑——绑在她的臀部，她正用一根吹箭筒威胁你。[pg]");
                  }
                  else
                  {
                     outputText("你被一个" + (get_noFur() ? "" : "非常") + "奇怪的生物逼到了角落：一个两足行走的雌性类人生物，具有" + (get_noFur() ? "老鼠的特征" : "巨型老鼠的明显特征") + "；" + (get_noFur() ? "" : "像爪子一样的脚，长着") + "长胡须的口鼻，大大的老鼠耳朵，以及" + (get_noFur() ? "又长又细的尾巴" : "覆盖着沾满灰尘的赤褐色皮毛的身体") + "。看起来她的生活并不轻松；她的衣服是一套肮脏破烂的裤子和衬衫，而她的四肢和腰腹结实有力，这既是因为经常食不果腹，也是因为不断的锻炼和体力消耗。她几乎没有臀部，乳房也不可能比A罩杯大。尽管如此，她看起来很有能力保护自己；她不仅挥舞着吹箭筒，显然准备向你吐出另一支无疑有毒的飞镖，而且她的臀部还绑着一把看起来很可怕的刀。[pg]");
                  }
                  outputText("她盯着你看了好一会儿，然后放下了吹箭管，[say: 抱歉，我还以为你是另一个恶魔。他们多年前摧毁了这个地方，但偶尔还是会有一些该死的拾荒者游荡过来。当然，最近没那么多了。我给他们留下了点“深刻印象”。]她恶意地咧嘴一笑，一只手以近乎挑逗的方式抚摸着刀刃。[saystart]我叫艾米莉，是这个村子最后的幸存者。我的族人都已经不在了；他们流离失所、死去、被奴役，或者遭遇了更糟的命运。你呢？");
                  if(get_player().humanScore() > 4)
                  {
                     outputText("你是");
                  }
                  else
                  {
                     outputText("你曾经是");
                  }
                  outputText("我听说偶尔会游荡到这个世界来的……人类之一吗？[sayend][pg]");
                  outputText("你承认了，是的，你是一个人类，然后问她为什么还要留在这个空荡荡的废墟聚落里。[pg]");
                  outputText("[say: 我在这里出生，在这里长大，如果不是因为那些恶魔，我本该在这里结婚定居的。]她轻蔑地吐出“恶魔”这个词。[say: 一切结束后，我无处可去。所以我留在了这里。老实说，我依然无处可去。我没有找到任何其他同族的聚落，而且我宁死也不愿向恶魔屈服。但看起来，如果我想看到更多我的族人自由地生活，我就必须得挑起大梁了……][pg]");
                  if(get_player().biggestTitSize() < 1)
                  {
                     outputText("她目不转睛地盯着你，你问她怎么了。[pg]");
                     outputText("[say: 你看，我刚才说的挑大梁？我想了很久，除了我没有别人能做这件事了。如果想要有更多生来自由的同族，他们就必须被生下来。字面意思；我需要找一个纯洁的伴侣，一个能给我带来强壮纯洁的同族后代的伴侣，]她解释道，一只手心不在焉地抚摸着平坦的小腹。[say: 我好不容易找到的几个同族男性都是恶魔的奴隶——他们太堕落了，根本不适合做伴侣，就算我能把他们救出来也不行。不过我听说，人类的繁衍能力出奇地弱；你的种子不会带有污染，而且你能繁育出更多我的同族。不像小恶魔或者牛头人那样。][pg]");
                     outputText("她把吹箭筒塞进腰带，迈着不确定的步伐向你走来，试图显得迷人——甚至有些轻浮——尽管她外表肮脏，而且显然在这方面缺乏经验。[say: 拜托，你能帮帮我吗？你说过你是勇者——如果你和我上床，帮我把更多我的族人带到这个世界上，让他们免受恶魔的伤害，不受他们变态污染的影响，你将是对他们对玛瑞斯腐败统治的另一种打击。][pg]");
                     outputText("你羞怯地低下头，坦白说虽然你很想帮忙，但这实际上是不可能的。[pg]");
                     outputText("艾米莉看起来很受伤。[say: 为什么？]她绝望地质问。[pg]");
                     outputText("你感到非常尴尬，却又不知该如何表达，于是你[if (!isnaked){脱下你的[armor]，}]让她看到你平坦无奇的胯部。[pg]");
                     outputText("艾米莉的眼睛瞪得老大，下巴都快掉下来了，她盯着你，显然惊呆了。然后她吐出一连串语无伦次、目瞪口呆的脏话。最后，她摇了摇头。[say: 好吧……这可真是新鲜。我想……这也说得通。该死，就在你以为自己什么都见过的时候。我想我该走了，]她对你说完，转身准备离开。[pg]");
                     outputText("然而，就在她要绕过一堵墙时，她停了下来。[say: 有一种装在瓶子里的东西叫梦魔药水。如果你喝了它，它会把你变成男孩——但我建议你先找个炼金术士，让他清除里面的腐化。][pg]");
                     outputText("她继续走开。不过，在她消失之后，又有一句话飘了回来。[say: 还有一种叫魅魔乳液的东西，如果你想变成女孩，也可以用它做同样的事。][pg]");
                  }
                  else
                  {
                     outputText("她摇摇头，恋恋不舍地对你微笑。[say: 听我在这儿瞎扯。再次为攻击你道歉。不过，在外面要小心；有很多变态怪物，如果它们抓到女人，会做出最难以启齿的事情。][pg]");
                     outputText("你红着脸向她解释，你其实不是女人。她对此感到非常困惑。[pg]");
                     outputText("[say: 但你有胸部……而且我没看到胯部有凸起，]她说道，听起来几乎有些任性。[say: 我也没闻到阴道的味道……等等，你是说你两样生殖器都没有？]她问道，显然惊呆了。[pg]");
                     outputText("你尴尬地承认确实如此。[pg]");
                     outputText("艾米莉盯着你，显然不知该说什么好，然后难以置信地摇了摇头。她试图对你微笑。[say: 好吧……我们女孩必须团结一致，对吧？如果你能找到一瓶魅魔乳液——小恶魔似乎偶尔会带着它，虽然我不知道为什么——然后你可以喝下它来找回你的阴道。另外，我建议你先找个炼金术士，让他清除里面的腐化。][pg]");
                     outputText("显然恢复了自信，她眨了眨眼，然后消失在一堵倒塌的墙后，留下你一个人。");
                  }
                  FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,164,get_player().get_gender());
                  doNext(get_camp().returnToCampUseOneHour);
                  return;
               }
            }
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,164) != get_player().get_gender() && (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,165) != 3 || get_player().get_gender() != 3))
         {
            amilyNewGenderConfrontation();
            return;
         }
         amilyVillageMenu();
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,164,get_player().get_gender());
      }
      
      public function StripForAmilyYouSlut() : void
      {
         clearOutput();
         amilySprite();
         var _loc1_:int = get_player().cockThatFits(61);
         outputText("轮到你回敬她一个调皮的微笑了。你感到兴奋难耐，想起村里的长辈们说过“来而不往非礼也”，于是决定也给她来点“表演”。你站起身，头向后仰，挺起胸膛，努力让自己看起来充满诱惑。艾米莉看着你，起初有些困惑，随后便露出了满意的神情。你慢慢地脱下你的[armor]，极力让动作显得性感撩人。你向她展示着你的身体，悠闲地抚摸着自己的四肢，顺着腰腹一路向下，最终露出了裤子里的秘密：你的" + get_player().cockDescript(_loc1_) + "。艾米莉显然对这场表演十分欣赏。[pg]");
         continueWithMoreMidLevelAmilySex();
      }
      
      public function FirstTimeAmilyTakeCharge() : void
      {
         clearOutput();
         amilySprite(true);
         get_images().showImage("amily-forest-takecharge");
         amilySprite();
         outputText("你决定风景什么的都无所谓了；艾米莉答应过要和你做爱，而你现在就想要。你二话不说走上前去，用力推了她一把，她尖叫一声跌坐在地上，你顺势把她推向[say: 床]——她能落到床上纯属巧合。你扑倒在她身上，用自己的四肢压住她的手脚。[pg]");
         outputText("[say: 嘿，你搞什么鬼？]她愤愤不平地抗议道。[pg]");
         outputText("你毫不客气地回怼，告诉她这是她自找的，所以她最好乖乖躺平接受。[pg]");
         outputText("艾米莉安静了下来，眼神变得像锥子一样锐利。很明显她对此一点也不高兴，但当你粗暴地扯下她的衬衫和裤子，露出她粉嫩的私处，然后开始撕扯自己的衣服时，她并没有反抗。[pg]");
         if(get_player().cocks[0].cockLength >= 14)
         {
            if(get_player().cocks[0].get_cockType() == CockTypesEnum.HUMAN || get_player().cocks[0].get_cockType().get_Index() > 3)
            {
               outputText("当你露出尺寸惊人的肉棒，并且它已经开始勃起变硬时，她震惊恐惧地瞪大了眼睛。[say: 你不能把那东西塞进我身体里！绝对进不去的！]她尖叫道。[pg]");
               outputText("你向她保证你能让它进去。[pg]");
            }
            else if(get_player().cocks[0].get_cockType() == CockTypesEnum.DEMON)
            {
               outputText("当你那布满结节的恶魔阴茎展现在她面前时，她的脸上写满了恐惧和厌恶。[say: 你到底是什么怪物？！你会用那邪恶的东西弄死我的！][pg]");
               outputText("你向她保证，只要她闭嘴，她就会享受这一切。[pg]");
            }
            else if(get_player().cocks[0].get_cockType() == CockTypesEnum.HORSE)
            {
               outputText("当她发现你那如种马般的阴茎时，她震惊恐惧地瞪大了眼睛。[say: 就算在这个世界，长得像马一样也不是什么好事！我受不了那种东西！][pg]");
               outputText("你问她，既然没试过，她怎么知道受不了。[pg]");
            }
            else if(get_player().hasKnot(0))
            {
               outputText("[say: 你不是认真的吧！]当她看到你裤子里藏着的东西时，她抗议道。[pg]");
               outputText("你懒得回答她，只是舔了舔嘴唇，想象着她紧紧包裹住你肉棒时的感觉。[pg]");
            }
         }
         outputText("你二话不说就插了进去，惹得她发出一声痛苦与愤怒交织的尖叫。你无视了她的反应，全神贯注地试图将肉棒尽可能多地挤进她温暖、紧致、如天鹅绒般的深处。在你努力挺进时，她抽泣着呻吟，");
         if(get_player().cocks[0].cockLength >= 14)
         {
            outputText("虽然没能塞进超过一英尺长的肉棒，");
         }
         outputText("但她并没有太用力地反抗你。[pg]");
         outputText("你的臀部前后挺动，随着你越来越兴奋，动作也越来越猛烈、越来越快。她的小穴像老虎钳一样紧紧夹着你，你能感觉到体内正在积聚着温暖而美妙的压力。这股压力越来越强，直到你再也忍不住，伴随着一声低吼，你的精液喷涌而出，尽可能深地灌满了她。[pg]");
         outputText("直到你确定高潮的最后一滴精液也射完后，你才拔了出来，漫不经心地大步走过去捡起衣服开始穿上。艾米莉盯着你，眼神像燧石一样坚硬锐利。[say: 你爽了吗？]她啐了一口。[say: 希望我们都从这事里得到了自己想要的。][pg]");
         outputText("你嘲讽地回敬说，只要她需要，你随时乐意效劳。穿好衣服后，你头也不回地离开了。[pg]");
         get_player().orgasm("Generic");
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,38,FlagDict_Impl_.arrayReadInt(_loc1_,38) - 5);
         amilyPreggoChance();
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function AmilyTakeTheKiss() : void
      {
         clearOutput();
         amilySprite();
         outputText("你慢慢地，尽力传达出如果艾米莉感到不舒服，你就会停下来或退开的意思，然后温柔地将嘴唇印在艾米莉的唇上。");
         if(amilyFurry())
         {
            outputText("这是一次非常不寻常的体验；虽然她真正的嘴唇和你的一样光洁，但周围却长着柔软纤细的绒毛，刚好能蹭到你嘴唇的边缘，更不用说亲吻一个长着口鼻的人那种奇特的感觉了。艾米莉似乎一点也不介意。事实上，她也回吻了你，而且非常热烈。");
         }
         outputText("[pg]");
         continueAmilySmex();
         dynStats(DynStat.Lust(5));
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,38,FlagDict_Impl_.arrayReadInt(_loc1_,38) + (1 + Utils.rand(3)));
      }
      
      public function AmilyMiddleGradeSexOver() : void
      {
         amilySprite();
         outputText("做爱耗尽了体力，艾米莉趴在你的胸膛上，对你笑了笑，慢慢地睡着了。不久之后，你也进入了梦乡。过了一段时间，你醒来发现她已经在穿衣服了。[pg]");
         amilyPreggoChance();
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,38,FlagDict_Impl_.arrayReadInt(_loc1_,38) + (3 + Utils.rand(4)));
         _loc1_ = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,42,FlagDict_Impl_.arrayReadInt(_loc1_,42) + 1);
         menu();
         addButton(0,"道别",sayGoodByeToAmilyPostSecks);
         addButton(1,"留一会",stayAfterAmilyMiddleGradeSecks);
      }
      
      public function AmilyMidSexLevel2() : void
      {
         dynStats(DynStat.Lust(5));
         amilySprite();
         outputText("当艾米莉完全赤裸时，她显然对即将发生的事情感到兴奋；你甚至觉得她已经湿了。她带着调皮、兴奋的笑容盯着你，等着看轮到你脱衣服时你会怎么做。[pg]");
         outputText("你是自己跳一段脱衣舞，还是直接脱光衣服开始干正事？");
         menu();
         addButton(0,"脱衣舞",StripForAmilyYouSlut).disableIf(get_player().isNaked(),"你没衣服可脱了。");
         addButton(1,"办正事",getDownWithSexTiem);
      }
      
      public function AmilyGetKissed() : void
      {
         clearOutput();
         amilySprite();
         outputText("你把思绪从那个念头中拉了回来。这会让事情朝着你和艾米莉都不确定是否能接受的方向发展。[pg]");
         continueAmilySmex();
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,38,FlagDict_Impl_.arrayReadInt(_loc1_,38) - 3);
      }
   }
}

