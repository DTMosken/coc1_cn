package classes.scenes.places
{
   import classes.BaseContent;
   import classes.CoC;
   import classes.DynStat;
   import classes.ImageManager;
   import classes.Player;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.items.ConsumableLib;
   import classes.scenes.Camp;
   import classes.scenes.Inventory;
   import classes.scenes.areas.plains.BazaarGatekeeper;
   import classes.scenes.combat.Combat;
   import classes.scenes.places.bazaar.Benoit;
   import classes.scenes.places.bazaar.ChillySmith;
   import classes.scenes.places.bazaar.Cinnabar;
   import classes.scenes.places.bazaar.DemonFistFighterScene;
   import classes.scenes.places.bazaar.FapArena;
   import classes.scenes.places.bazaar.GretasGarments;
   import classes.scenes.places.bazaar.Lilium;
   import classes.scenes.places.bazaar.Roxanne;
   import classes.scenes.places.bazaar.SlipperySqueeze;
   import classes.scenes.places.bazaar.Telly;
   import coc.view.CoCButton;
   import flash.Boot;
   import haxe.IMap;
   
   public class Bazaar extends BaseContent
   {
      
      public var telly:Telly;
      
      public var slipperySqueeze:SlipperySqueeze;
      
      public var roxanne:Roxanne;
      
      public var lilium:Lilium;
      
      public var gretasGarments:GretasGarments;
      
      public var fapArena:FapArena;
      
      public var demonFistFighterScene:DemonFistFighterScene;
      
      public var cinnabar:Cinnabar;
      
      public var chillySmith:ChillySmith;
      
      public var benoit:Benoit;
      
      public function Bazaar()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         telly = new Telly();
         slipperySqueeze = new SlipperySqueeze();
         gretasGarments = new GretasGarments();
         chillySmith = new ChillySmith();
         benoit = new Benoit();
         roxanne = new Roxanne();
         lilium = new Lilium();
         demonFistFighterScene = new DemonFistFighterScene();
         fapArena = new FapArena();
         cinnabar = new Cinnabar();
         super();
      }
      
      public function winAgainstGuard() : void
      {
         var _g:Bazaar;
         clearOutput();
         outputText("你设法把守卫打倒在地。趁着守卫昏迷，你在进去之前搜刮了一番战利品。");
         _g = this;
         var _loc1_:Function = function():void
         {
            _g.enterTheBazaarAndMenu();
         };
         get_combat().cleanupAfterCombat(_loc1_);
      }
      
      public function waitOnStuff() : void
      {
         clearOutput();
         outputText("当你等待着看会发生什么时，不确定性困扰着你。那只大型猫娘到达了大帐篷的入口。他空着的手抓住帐篷，当你发出一声大叫时，你被用力地推了进去。");
         menu();
         addButton(0,"继续",collectSomeButtSmex);
      }
      
      public function suckOffNone() : void
      {
         clearOutput();
         outputText("你不愿意用嘴唇包裹住他们任何一人的肉棒，于是你伸出双手，开始为这两个争吵的男人手淫。他们都停止了争吵，困惑地低头看着你。他们茫然的表情并没有持续多久，很快就融化成了愉悦的、半闭着眼睛的凝视和呻吟。他们流着口水的龟头用先列腺液将你的脸颊涂成了白色，让你散发出他们强烈、咸味的麝香。他们似乎渴望更多，将坚硬的肉棒压在你的脸上，用滚烫、沾满先列腺液的龟头戳着你紧闭的嘴唇。你闭上眼睛，他们每人一只手将你的后脑勺更用力地压向他们饥渴的肉棒。你的嘴唇微微张开，刚好能尝到他们大量的先列腺液，当你微张的嘴唇中安静地溢出呻吟时，萨特开始用力地用臀部撞击你，他憋了很久的睾丸在你的屁股里卸货，用精液涂满了你的下半身。");
         finalGayFinallee(2);
      }
      
      public function suckOffATiger() : void
      {
         clearOutput();
         outputText("你选择了那根带倒刺的肉棒。你迅速将它含入口中，吸吮着带刺的龟头。虎人的表情从争吵时的愤怒融化成了愉悦。[say: 看来他更喜欢我的，而不是你那根短香肠。] 虎人幸灾乐祸地说，熊人则低声愤怒地咆哮着。为了不让他们在你的脸上打起来，你用一只手握住熊人的阴茎，开始在粗壮的柱身上套弄，尽管你的手指无法完全环握住它。当你取悦他们时，两人都发出了满意的、无可奈何的呻吟。当你给虎人口交时，萨特依然在你的[ass]里猛烈地抽插，虎人的双手紧紧抓住你的头，用他的肉棒深喉你渴望的小嘴。你将舌头滑入他的柱身下方，当倒刺在你的喉咙、嘴唇和舌头上摩擦时，你发出了一声沉闷的呻吟。伴随着一次粗暴的挺进，他将你的脸埋入他" + (get_noFur() ? "" : "长满毛发的") + "腹股沟，让他沉甸甸的囊袋拍打着你的脸颊。虎人疯狂地操着你的脸，同时你感觉到萨特在你的屁股里射精了。粗壮的虎鞭继续在你的喉咙里抽插，温暖的感觉在你的肠道内蔓延，萨特的精液淹没了你的内壁。");
         finalGayFinallee(0);
      }
      
      public function suckOffABear() : void
      {
         clearOutput();
         outputText("你转过头，张大嘴巴，慢慢地将粗壮的熊鞭挤过你的嘴唇。你的下巴为了容纳它而张到了极限，你吸吮着，发出湿润的啧啧声。你将所有的注意力都集中在嘴里这根粗大的肉棒上，用舌头舔舐和吸吮着不断流出的先列腺液。你灵活的舌头在肿胀的龟头上弹动，听到熊人发出一声低沉、愉悦的咕哝声。在你的头顶上方，虎人嫉妒地盯着你。");
         outputText("[pg][say: 婊子们看到更好的鸡巴时自然知道该怎么选。] 熊人居高临下地对虎人说，让愤怒的猫科动物发出咆哮。你反应迅速，伸出一只手开始抚摸那根带倒刺的肉棒，同时将粗大的熊鞭更深地推过你的嘴唇，强忍着作呕的感觉，让肥大的龟头顶在你的喉咙深处。一只手抓住了你的后脑勺，熊人的臀部开始在你的湿嘴里前后摇摆。很快，你的嘴唇就被唾液和大量的熊精液弄湿了。你头上的手将你推向熊人的腹股沟，让你的脸埋在他" + (get_noFur() ? "多毛的" : "长满毛发的") + "、散发着麝香的胯部，同时将他肥大的肉棒的每一寸都埋入你的嘴里，堵住你的喉咙。随着肥大的熊鞭跳动，填满你的嘴巴，将先列腺液直接倒入你的食道，你的眼睛因为下巴和喉咙的拉扯而开始流泪。熊人开始操你的脸，让你偶尔有机会喘口气。这种情况持续了一段时间，直到你感觉到萨特的肉棒在你的屁股里跳动，精液迅速填满了你。粗壮的熊鞭在你的喉咙里抽插，分散了你对萨特的注意力，尽管你忍不住感觉到精液的温暖在你的肠道深处蔓延，淹没了你的内壁。");
         finalGayFinallee(1);
      }
      
      public function shopMenu() : void
      {
         var _g:Bazaar;
         clearOutput();
         outputText("[pg]其中一辆马车骄傲地宣称自己是“格蕾塔的服装店”，不过两个“G”都被加上了可爱的风格化恶魔角，而“s”的形状则像是一条带铲形的恶魔尾巴。显然这肯定是一家服装店。");
         chillySmith.smithButton();
         roxanne.RoxanneAppearance();
         benoit.setBenoitShop();
         telly.tellyPresence();
         menu();
         benoit.setBenoitShop(true);
         addButton(1,"格蕾塔服装店",gretasGarments.gretasGarments).hint("买一些绝对不正经的衣服。","格蕾塔的服装店");
         addButton(2,"滑溜溜挤压店",slipperySqueeze.theSlipperySqueeze).hint("一家格格不入的富裕按摩院，因为马车的巨大尺寸而显得格外显眼。","滑溜溜挤压店");
         chillySmith.smithButton(true);
         telly.tellyPresence(true);
         _g = this;
         addButton(14,"返回",function():void
         {
            _g.enterTheBazaarAndMenu();
         });
      }
      
      public function overHearDemonsAboutSyrena() : void
      {
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,292) == 0)
         {
            outputText("当你在集市上闲逛时，一阵低语声引起了你的注意，在好奇心的驱使下，你向声音传来的方向走去。[pg]");
            outputText("当你靠近声音时，对话变得清晰可辨。[pg]");
            outputText("[say: ——告诉他，如果他这周完不成实验，她就把他扔进服从水箱里，而不是那个勇者！] 第一个声音惊呼道，听起来相当女性化。[pg]");
            outputText("一个男中音回应道，[say: 你在逗我吧！如果塞雷娜认为莉希丝会让她把我们另一个研究员变成一个语无伦次的荡妇，那她一定是疯了。我们已经有够多那样的家伙了。][pg]");
            outputText("[say: 哎，你还指望什么？她与其说是恶魔，不如说是鲨鱼……我真惊讶她居然还能干成点事，毕竟她花那么多时间操我。别误会，那根双倍粗的肉棒让我的小穴直流口水，你懂吧？但是，同时，如果我能得到更多关于她研究的信息，我就能取代她的位置。到时候她就得满足我的欲望了……美味，] 那个性感迷人的声音渐渐变弱。[pg]");
            outputText("那个男声笑着说，[say: 你就该被一根粗大的肉棒压在身下，婊子。看看你，你身后都拖着一串淫液了。你太忙于发骚了，什么也干不成。不过，我想我最好还是回实验室去。我可不想最后变得像那些逃跑的工厂残次品一样——得保持这完美的身材，你懂吧？][pg]");
            outputText("当人群散开时，你好好打量了这两个人，哇，那个男魅魔说得对。他是一个卷发、轮廓分明的阿多尼斯般的美男子，他那时尚的裤子被撑起了一个夸张的凸起。这个恶魔摆弄着他的衣领，把它竖起来，然后转身准备离开。另一个同病相怜的恶魔是一个穿着白大褂的爆乳魅魔……里面什么都没穿。她比她同伴说得还要湿润，在她移动时，身后留下了一道厚厚的滑溜溜的淫液痕迹。魅魔的乳头就像两颗坚硬的子弹，在她反驳时，在她的外套上浸出了两块光荣的湿斑。[pg]");
            outputText("[say: 闭、闭嘴。那个婊子在我身上测试了她的一些原型化合物，记得吗？那东西把我的小穴变成了一个贪得无厌的火炉。如果我能有点空闲时间……我会……我会……哦，去他的，我们去租个房间，在回去之前先操几次。当我面对她时，我想保持头脑清醒。塞雷娜这次别想幸灾乐祸地看着我扑到她那根又粗……又多汁……嗯……肉棒上！] 魅魔拉着男魅魔的手，匆匆把他拖走了。[pg]");
            outputText("好吧，这就解释得通了。恶魔们似乎有一个活跃的研究部门，尽管那个叫塞雷娜的似乎不太讨手下喜欢。不过话又说回来，你怀疑是否有任何恶魔仆从对他们的老板感到满意。你迫不及待地想阻止他们的工作，但现在，除了逛集市或回家，无事可做。[pg]");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,292) == 1)
         {
            outputText("和之前一样，你发现了那个竖着衣领的男魅魔和他穿着白大褂的情人正在抱怨他们的老板。[pg]");
            outputText("[say: ——还疼呢！我真不敢相信她对我做了那种事！] 那个男声呻吟道。[pg]");
            outputText("那个小穴湿滑的魅魔残忍地笑着说，[say: 你活该。说实话，你把沾满精液的报告交给了你的老板，你还惊讶她拿你的屁股开刀作为惩罚？要我说，你就是故意的。你以为是谁清理了你留在地板上的那一大摊烂摊子？][pg]");
            outputText("男魅魔破天荒地似乎无言以对。他嘟囔着，[say: 好吧，我不是故意的。我、我只是在完成文书工作的时候，和一个新来的奴隶玩了玩——为了寻找灵感。] 他转过头，捶了那个色眯眯的女性的手臂一拳。[say: 再说了，我以为你喜欢清理我的精液呢？我以前可没见你抱怨过。][pg]");
            outputText("魅魔大笑着拍了拍他的屁股，回答道：[say: 别担心，你尝起来很棒……只是不如老板。我不知道她调配了什么药剂才做到的，但她的精液简直是人间极品。我简直可以……嗯……一整天都在吞咽那美味的奶油。你觉得她有部分牛头人血统吗？][pg]");
            outputText("[say: 宝贝，你又弄得到处都是黏液了。我们去发泄一下怎么样？] 这两只发情的恶魔跑开了，消失在视线中。[pg]");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,292) >= 2)
         {
            outputText("这一次，这两只喋喋不休的恶魔坐在火堆旁，他们改变位置的原因似乎很明显。魅魔的肚子异常地隆起，里面塞满了某种堕落的后代。她用双手抚摸着被撑开的肚皮，痛苦地呻吟着，那塞满的子宫在她的抚摸下蠕动着。[pg]");
            outputText("与此同时，男魅魔正喝着啤酒，抱怨道：[say: 你能不能消停点？这又不是你第一次怀上一肚子小恶魔了——别这么大惊小怪的。][pg]");
            outputText("他怀孕的同伴咆哮着，扯了扯她那件不合身的白大褂，却无法掩盖她那蓝莓色的隆起肚子，她反驳道：[say: 你又不用被操进这么多东西，对吧？见鬼，她甚至先给我注射了强效受孕药！感觉里面塞了两打小混蛋！我估计再过一两天我就走不动路了。][pg]");
            outputText("[say: 那是不是意味着，如果你卧床不起的时候我顺便来拜访，你也不会介意？我的意思是，你不可能怀上更多的小恶魔了，而且这还能打发时间，] 肌肉发达的男性建议道。[pg]");
            outputText("女恶魔冷笑着反驳道：[say: 当然，但下次你搞砸的时候，我就把我的女性用品借给塞雷娜，让你也尝尝这种痛苦。] 为了强调，她的双手都指向了她那因塞满小恶魔而肿胀的腹部皮肤。[pg]");
            outputText("男魅魔站起身来嘲笑道：[say: 如果我像你一样经常搞砸，我早就去某个工厂的火炉里添柴，或者喂地狱犬了。走吧，趁我还没不得不把你滚回去之前，我们先送你回家。][pg]");
            outputText("魅魔不愿接受帮助，摇摇晃晃地站起来，开始蹒跚地走开。男魅魔与她保持着距离，脸上带着掠食者般的笑容。[pg]");
         }
         doNext(enterTheBazaar);
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,292,FlagDict_Impl_.arrayReadInt(_loc1_,292) + 1);
      }
      
      public function nightBazaarButtfuck() : void
      {
         clearOutput();
         spriteSelect(null);
         outputText("晚上在集市漫步时，你感到胃里升起一股不安。当你走在昏暗的小路上时，你停下脚步，注意到一条以前从未见过的相当黑暗的小路。好奇心在你游荡的脑海中闪烁，你忍不住想知道它在这里多久了，通向哪里。尽管你脑海中不断冒出这是个坏主意的念头，你是否应该沿着这条黑暗的小路走下去？");
         outputText("[pg]抛开脑海深处那种挥之不去的感觉，你沿着没有灯光的小路走向未知的冒险。你用冒险的前景和探索的兴奋来安慰自己。你那永远乐观的心思正沉浸在惊奇之中，这时你身旁一个大帐篷的门帘突然被猛地掀开。[say: 行了！我走，我走！把那该死的鸡巴塞进去！]");
         outputText("[pg]你转过头去寻找那粗犷叫喊声的来源，发现一个高大的身影正气冲冲地从帐篷里走出来。当你在黑暗中眯起眼睛想看清那个身影时，你觉得你看到他们在裤兜里摸索着什么。当两只发光的绿色眼睛锁定你时，你意识到那个身影已经注意到了你。[say: 哎呀，你好啊……] 那个沙哑的声音缓慢地说道。他们走近了，很快，小巷里你唯一能集中注意力的声音就是你的心跳声和那个身影在肮脏小路上拖沓的脚步声。你的心怦怦直跳，脑子里飞快地盘算着该怎么办。在这个偏僻、黑暗的小路上，你忍不住觉得那个身影会试图占你的便宜。当那个身影醉醺醺地向你走来时，你的背紧紧贴在旁边一棵树冰冷的树干上。");
         outputText("[pg]那个身影终于来到了你面前。现在你离得更近了，你可以更清楚地看清他。[say: 你在这里干什么？] 那只大型猫娘问道，声音中带着咆哮，让你怀疑他是否感到烦躁或不安。你尽力让自己平静下来，解释你只是在集市里探索。为了与那发光的眼睛相配，那个身影黑色的嘴唇间露出了锯齿状牙齿闪烁的笑容。[say: 我正要往那边走呢。我们应该一起去。晚上到处乱逛可不安全，即使是对我这样的大个子来说也是如此。] 伴随着沙哑的窃笑，一只强有力的手抓住了你的肩膀。[say: 让我再去拿点现金，我请客。] 猫娘发出慷慨的提议，同时你感觉到他正把你拉向他刚刚出来的帐篷。当猫娘开始拖拽你时，你的眼睛四处张望。周围没有人能帮助你。小路上空无一人。一种不安的感觉迅速在你胃里蔓延。有些不对劲。");
         menu();
         addButton(0,"逃跑",escapeFromCertainRape);
         addButton(1,"等待",waitOnStuff);
         addButton(2,"袭击",assaultYoRapistYo);
      }
      
      public function leaveShop() : void
      {
         enterTheBazaarAndMenu();
         shopMenu();
      }
      
      public function initiateFightGuard() : void
      {
         clearOutput();
         outputText("你准备好你的[weapon]，摆出战斗姿态！他抓起他的双弯刀！战斗开始了！");
         startCombat(new BazaarGatekeeper());
      }
      
      public function guardBlowjob() : void
      {
         clearOutput();
         outputText("红皮肤的守卫[if (height < 115) {居高临下地看着你，你比他那庞大的身躯小得多|打量着你，一个与他身材相当的[man]}]。他的姿势依然如石头般僵硬，表情难以捉摸。");
         outputText("[pg][say:马上离开，]他重复道，声音低沉而缓慢。[say:这里不是你放纵的地方。]");
         outputText("[pg]你不为所动，[if (singleleg) {滑|靠}]得更近了，闻到了他束腰外衣上某种异国香料的气味，近到足以让你的手指拂过他长裤的薄布料。他挑起眉毛。轻柔的触碰本身就是一种暗示，紧接着你的[hand]向上游走，探向他的腹股沟。你的目光向上瞥去，为他放你过去提供了另一个理由。");
         outputText("[pg]好长一段时间，他都没有反应。他那几乎像缟玛瑙一样黑的眼睛停留在你的脸上，似乎在寻找欺骗或嘲弄的痕迹。[say:你还没准备好，]他再次重申，但随后压低了声音。他的手动了动，解开了腰间的系带。[say:但也许你可以学学。]");
         outputText("[pg]那条轻薄透气的长裤顺着他的双腿滑落，露出了一根沉甸甸的深红色肉棒，在你的抚摸下已经半硬了。他任由它在你的面前晃动，仿佛在挑衅你退缩。你下定决心，没有躲闪，只是迎上前去，让你的[tongue]滑过那根肉棒。他的阴茎在完全勃起时抵住了你的脸颊。");
         outputText("[pg]商队守卫[if (hasHair) {将手指卷入你[haircolor]的头发中|用大手按住你的头}]，动作坚定却不粗暴。他引导你的嘴含住他的肉棒，撑开了你的双唇；不过，与他的体型相比，这根粗壮的阴茎并没有那么惊人。它陷得更深了，味道覆盖了你的每一个味蕾，带着某种奇怪食物的余味，那一定是从远处的摊位飘来的。随着他的肉棒深入到你无法再用鼻子呼吸的程度，这种味道便消失了。尽管如此，他还是继续向里推进。守卫发出一声闷哼，随着他的镇定开始动摇，他的站姿也发生了改变。当他插得更深时，他抓着你的手微微收紧，试探着你能吞下多少。");
         outputText("[pg][say:你很有前途。]他喘息着，声音因克制而颤抖。他的臀部开始做着小幅度、刻意的转动。面对这种尺寸，也许有些人会感到吃力，但他却表现得异常温柔。");
         outputText("[pg]然而，没过多久他就完全失去了控制。这个红色的巨人挺动着腰部，他的腰撞到了你的鼻子，让你发出了一声难听的咕噜声。你紧紧抓住他肌肉发达的双腿，试图控制住局面，但他却把自己拔出了一半，然后再次操进你的喉咙，完全不顾你本能地想要减慢速度的尝试。当他再次操进你的喉咙时，他的弯刀发出叮当的碰撞声。肯定雇他站岗的人会注意到他这样做——他可是有[if (metric) {三米|十英尺}]高！尽管如此，他还是像能让你的食道怀孕一样，在里面横冲直撞！口水和唾液涂满了他的肉棒，顺着你的下巴滴落，在微风中变凉。");
         outputText("[pg]伴随着无情的猛插和喉咙深处的低吼，他把精液射进了你的食道。你毫不退缩地咽了下去——他的肉棒插得太深了，你几乎尝不出味道——而且整个过程你都注视着他的眼睛。结束之后，他深吸了一口气，小心翼翼地整理好自己的衣服。他的表情并没有缓和，但他的眼中闪烁着某种新的东西。");
         outputText("[pg][say:欢迎来到奇特集市，]他终于开口了。[say:进去吧，但要注意你在里面的言行。]");
         outputText("[pg]你清了清嗓子，整理了一下自己，深吸了一口气。");
         dynStats(DynStat.Cor(5),DynStat.Lust(20),DynStat.Lib(3));
         get_player().slimeFeed();
         get_player().refillHunger(10);
         doNext(enterTheBazaar);
      }
      
      public function findBazaar() : void
      {
         var _loc1_:* = null as IMap;
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,212) == 0)
         {
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,212,FlagDict_Impl_.arrayReadInt(_loc1_,212) + 1);
            outputText("当你探索平原上被风吹拂的草地时，温暖、带着泥土气息的微风吹过。虽然你似乎能看到几英里外的地方，但由于草的高度在几英尺到十几英尺之间微妙地变化，你根本无法判断接下来会遇到什么。此时，你不仅相信自己那经常受阻的视力，也同样相信自己的耳朵和鼻子。没过多久，你就闻到了一股烤肉和香料的香味。不远处有个营地！[pg]");
            outputText("你举起你的[weapon]，小心翼翼地穿过高耸的植被，在弄清楚这个营地里住着什么样的人之前，尽量不暴露自己的位置。明亮的光线在你面前的草丛中闪烁，你拨开草丛，从随风摇曳的草茎间偷看。这里有一圈色彩鲜艳的马车，周围竖起了一道高高的栅栏。烟雾从营地中心袅袅升起，像草丛中的毒蛇一样在空中扭动。每辆马车似乎都被展开了，变成了一个个独立的小型建筑。很明显，这是一个旅行商队或集市。[pg]");
            outputText("栅栏上只有一个缺口——一扇狭窄的门，由一个十英尺高、红皮肤、戴着几乎是天蓝色头巾的男人看守着。他腰间系着一条简单的皮带，上面挂着两把弯刀。这个红皮肤男人的衣服是一件简单的束腰外衣和宽松的裤子，但都掩盖不住他那明显肌肉发达的身躯。他看起来警觉而专注——这是一个好兆头，因为恶魔几乎不需要派守卫。");
         }
         else
         {
            outputText("你再次透过高高的草丛闻到了营火的味道，随着距离的拉近，你听到了旅行集市熟悉的喧闹声。你透过杂草偷看，看到了商队的守门人——一个红皮肤、肌肉发达的巨人。");
         }
         outputText("[pg]你要靠近吗？");
         doYesNo(approachBazaarGuard,get_camp().returnToCampUseOneHour);
      }
      
      public function finalGayFinallee(param1:int = 0) : void
      {
         var _loc2_:* = null as Player;
         outputText("[pg]伴随着一声湿润的“啵”声，萨特将他疲软的命根子从你的[asshole]中拔出。他将变软的肉棒在你的" + get_player().buttDescript() + "上涂抹，在你的脸颊上留下了一道白色的精液痕迹。他满足地呼出一口气，走到了一边。[say: 我爽了，你们俩决定谁接下来操这个荡妇。] 你抬头看着虎人和熊人。他们的眼睛亮了一下，然后带着饥渴的欲望转头看向你的[ass]。在他们的注视下，你的脊背发凉，但在他们行动之前，一道绿色的模糊身影从他们身边跑过。");
         outputText("[pg][say: 扎格想要洞！] 高大的绿色兽人跑到你的身后，用他那足有一英尺长的巨大肉棒拍打着你的[ass]，仿佛在宣告“归我了！”。看着那根在你的臀瓣间摩擦的十二英寸跳动肉棒，你咬紧了嘴唇。深橄榄色的肉棒上闪烁着一层厚厚的先列腺液和滑溜溜的润滑剂。兽人那粗壮的肌肉充满威胁地抽动着，他死死盯着虎人和熊人。那两人站在原地没动，过了一会儿，兽人咕哝了一声。他低下头，对准了你的洞。他那粗壮的兽人肉棒压在你的[asshole]上，用力地挤了进去。多亏了萨堤尔的精液和粗暴的抽插，你已经被撑得足够开，兽人几乎没费什么力气就滑了进去，只带来了一点点痛楚。");
         outputText("[pg]当巨大的兽人肉棒刺穿你时，你发出一声沉闷的呻吟，坚硬的勃起物在你被撑开的丝滑肉壁上摩擦。他肥大的兽人囊袋拍打着你翘起的" + get_player().buttDescript() + "。随着绿色肉棒拔出又猛地插回，你的嘴唇中溢出呜咽声。这个粗暴的兽人专注于更深地进入你，他那巨大的阳具随着每一次抽插越来越深。巨大的尺寸顺着萨堤尔留下的精液痕迹推进，用他的兽人肉棒将你填得满满当当。他的双手抓住你的臀部，粗暴地将你拉到一个合适的角度，开始用长而有力的猛烈冲刺蹂躏你的[ass]。他发出喉音般的低吼，粗大的肉棒流出兽人的白浊，与萨堤尔的精液混合在一起，你的洞开始变得像个用过的避孕套。");
         get_player().buttChange(30,true,true,false);
         outputText("[pg]当你的下半身受到荡妇般的待遇时，你几乎无法集中精力去取悦手中的两根肉棒。[say: 吼！洞把兽人肉棒夹得好紧！做个好兽人婊子！] 高大的绿皮男人低吼着，你感觉到他沉重的囊袋紧紧贴在你的臀瓣上。你的眼睛猛地睁大，因为你突然被兽人的精液淹没了，精液从你的洞里溢出，溅在兽人的睾丸和大腿上的感觉和声音淹没了你的感官。兽人发出一声[say: 哇啊！]，他按住你的臀部，将兽人肉棒直没至柄，继续将他浓稠、肥沃的种子卸入你的体内。由于射入你屁股里的精液量太大，你的肚子很快就鼓了起来。兽人男人在你身上喘息着，你感觉到你的[asshole]像个漏水的堤坝一样滴落着兽人的精液。");
         if(param1 == 0)
         {
            outputText("[pg]你几乎无法集中注意力在嘴里那根带倒刺的肉棒上，你一边含着坚硬的肉棒呻吟，一边看着肚子上那个小小的凸起。你的双手伺候着熊人，而虎人则填满了你的嘴，这两个男人一直守在你脑袋的两侧。伴随着一声湿润的啵声，虎人将他沾满唾液的肉棒从你嘴里拔出，走向兽人，咕哝着将他推到一边。[say: 现在轮到我了。] 他调皮地咧嘴笑着，对准了你的洞，你的[asshole]看起来就像个被用烂的精液垃圾桶。他轻松地撞了进去，开始在你体内猛烈抽插，让你张大嘴巴呻吟起来。");
            outputText("[pg]熊人趁机将他那粗得不可思议的肉棒塞进你张开的双唇之间。当你呻吟时，你的嘴唇在他的肉棒周围颤动。熊人爬上桌子，开始操你的脸，而你的[asshole]则连续第三次被使用。你的下巴被熊人那粗大的骄傲撑得生疼，你的双手紧紧抓住他的腿，用恳求的眼神抬头看着他。他只是低头对你咧嘴笑着，看着他肥大的肉棒滑过你的嘴唇，在你的喉咙里鼓胀。你的喉咙因作呕而收缩，因呻吟而颤动，你不由自主地榨取着熊人的肉棒。猫科动物的肉棒每一次钻入你体内，倒刺都会让你在深喉熊人肉棒时呜咽和作呕。你屁股里的倒刺似乎给这种虐待带来了一种全新的感觉，湿润的拍打声在帐篷里回荡。你的" + get_player().buttDescript() + "被连续三个雄性的精液弄得湿漉漉的，他们的精液和先列腺液从你翘起的[ass]滴落，在桌子和地板上形成了一滩越来越大的淫欲水洼。");
            outputText("[pg]熊和老虎都没坚持太久。熊最先射精，他把你的头按在他的胯部和桌子之间。你的手指紧紧抓着他" + (get_noFur() ? "多毛的" : "长满毛皮的") + "腿，他的肚子里发出一声低沉的呻吟。你能感觉到他的精液直接射进你的喉咙，填满你的胃。熊拔了出来，他的肉棒最后一次抽动，将一股精液喷在你的脸上，你闭上眼睛，感受着滚烫的液体顺着脸颊流下，不由得皱起眉头。熊发出一声愉悦的咕哝，从桌子上下来，把你留给虎人。伴随着沙哑的嘶嘶声，老虎是最后一个，他那膨大的倒刺在你被精液浸透的肠壁上颤抖，他越来越接近高潮，准备将自己的精液加入你的收藏中。他俯身看着躺着的你，对你眨了眨眼。");
            if(get_player().hasCock())
            {
               outputText("他的手伸下去玩弄你的[cocks]，一边套弄着你，一边用胯部又狠狠地撞击了几下。");
            }
            else if(get_player().hasVagina())
            {
               outputText("他的手指猛地插进你的" + get_player().vaginaDescript(0) + "，在操你另一个洞的同时，手指也在你体内抽插。");
            }
            outputText("他的脸贴近你，舔了舔你的脸颊，在你的嘴唇上轻轻吻了一下。你对这种亲昵的举动感到困惑，而他则回以一个大大的笑容。[say:作为一个口交婊，你还挺可爱的。找到你的时候我就知道我赚到了，]他窃笑着，让你涨红了脸。");
            if(get_player().get_gender() > 0)
            {
               outputText("你微张着嘴呻吟着，感觉到高潮不断积聚，随后你的体液喷洒在老虎的手上和你的下半身。虎人只是把手举到唇边品尝你的汁液，然后最后一次将肉棒齐根没入你的体内。");
            }
            outputText("第三股热流涌入你的体内，压力变得更高了，你现在就像一只被塞得满满当当的母狗。疲惫感袭来，你开始觉得眼皮发沉。在你睡着之前，你看到的最后一幕是那只猫科动物因高潮而扭曲的脸。");
            outputText("[pg]你猛地惊醒，清晨鸟儿在废弃帐篷里回荡的叫声是你唯一的问候。你试图迅速起身，但立刻就后悔了。昨晚遭受的种种蹂躏让你的身体酸痛不已。你从桌子上滑下来，四处寻找你的装备。令人惊讶的是，你发现它们被整齐地叠成一捆");
            if(get_player().get_gems() > 1)
            {
               outputText("只是少了几颗宝石");
               _loc2_ = get_player();
               _loc2_.set_gems(_loc2_.get_gems() - (3 + Utils.rand(4)));
               if(get_player().get_gems() < 0)
               {
                  get_player().set_gems(0);
               }
            }
            outputText("。你重新穿好衣服，然后意识到了一件事。你额外得到了一样东西：一瓶绑着橙色丝带的催情剂。末尾的一张纸条上写着：[say: 谢谢你帮我省了买酒的钱。你的屁股太棒了，即使在那个兽人干过之后也是。]纸条上没有名字，但从角落里画的虎爪印来看，你很清楚是谁留给你的。你把催情剂放进口袋，离开帐篷，在晨光中返回集市。[pg]");
            get_player().orgasm("Anal");
            dynStats(DynStat.Sens(5));
            var _temp_1:* = get_game().time;
            _temp_1.days = _temp_1.days + 1;
            get_game().time.hours = 6;
            get_inventory().takeItem(get_consumables().L_DRAFT,get_camp().returnToCampUseOneHour);
            statScreenRefresh();
         }
         else if(param1 == 1)
         {
            outputText("[pg]你几乎无法集中注意力在你嘴里那根粗壮的熊鸡巴上，你一边呻吟着含着那根肥大的肉棒，一边看着你肚子上的小凸起。你的双手伺候着老虎，而熊则填满了你的嘴，这两个男人一直没有离开你的头部两侧。伴随着一声湿润的“啵”声，熊将沾满唾液的肉棒从你嘴里拔了出来，他走向兽人，咕哝着把他推到一边。[say: 现在轮到我了。]他调皮地咧嘴笑着，将自己对准你的洞，你的[asshole]看起来就像一个被过度使用的精液垃圾桶。他轻松地插了进去，开始在你体内猛烈地抽插，让你张大嘴巴呻吟起来。");
            outputText("[pg]老虎趁机将他带刺的肉棒塞进你张开的双唇之间。你呻吟着，嘴唇在他的肉棒周围颤动。老虎爬上桌子，开始操你的嘴，而你的[asshole]则连续第三次被使用。倒刺在你的嘴和喉咙里刮擦、发痒，你的双手紧紧抓住老虎的腿。你用恳求的眼神看着他，但他只是低头对你咧嘴一笑，看着他带刺的长度滑过你的嘴唇，在你的喉咙里鼓起。你的喉咙因作呕而收缩，因呻吟而颤动，你不由自主地榨取着老虎的肉棒。每次熊的肉棒钻进你的身体，那粗壮的尺寸都会让你在操你喉咙的虎鞭周围呜咽和作呕。你的喉咙在虎鞭周围颤动，发出沉闷的呻吟，而粗大的熊鞭则让你的后庭因拉扯而隐隐作痛。");
            get_player().buttChange(45,true,true,false);
            outputText("[pg]他粗大的尺寸把你撑得比兽人还要开，痛苦地将你撑开，同时又让你在操弄中发狂。你的" + get_player().buttDescript() + "被连续三个男性的精液弄湿了，他们的精液和先列腺液从你翘起的[ass]滴落，在地上和桌子上形成一滩越来越大的淫液。熊和老虎都没坚持多久。老虎先射了，他把你的头按在他的臀部和桌子之间。你的手指紧紧抓住他" + (get_noFur() ? "" : "长满毛") + "的腿，他的胸腔里发出一阵低沉的呼噜声。你能感觉到他的精液直接射进你的喉咙，填满你的胃。老虎拔了出来，他的肉棒最后一次抽动，将一股精液喷在你的脸上，你闭上眼睛，随着滚烫的液体顺着脸颊流下而皱起眉头。老虎发出一声愉悦的咕哝，下了桌子，留下你屁股里插着熊的肉棒。");
            outputText("[pg]伴随着沙哑的低吼，熊是最后一个，他粗大的阴茎痉挛着，将他肥大的肉棒在你浸满精液的肉壁上摩擦，他越来越接近将自己的精液加入你的收藏中。他俯身看着你躺着的身躯，对你眨了眨眼。");
            if(get_player().hasCock())
            {
               outputText("他的手向下探去，把玩着你的[cocks]，一边抚弄着你，一边用他的臀部猛烈地撞击着你。");
            }
            else if(get_player().hasVagina())
            {
               outputText("手指粗暴地插入你的" + get_player().vaginaDescript(0) + "，在他操你另一个洞的同时，手指也在你体内抽插。");
            }
            outputText("他的脸凑近你，舔了舔你的脸颊，并在你的嘴唇上印下短暂的一吻。你对这种亲昵举动感到困惑，而他则以灿烂的笑容回应。[say: 作为一个吸精机器，你还挺可爱的。我喜欢你直奔我老二而去的样子，]他窃笑着，让你不禁脸红。");
            if(get_player().get_gender() > 0)
            {
               outputText("你的嘴唇微张，发出呻吟，感觉到高潮正在酝酿，随后你的爱液覆盖了熊人的手和你的下半身。熊人只是把手举到唇边，品尝你的蜜汁，然后最后一次深深地插入你体内。");
            }
            outputText("第三波热流淹没了你，压力变得更高，你就像一只被填满的生育母狗。疲惫感袭来，你开始觉得眼皮越来越沉。在你睡着之前，你看到的最后一幕是熊人因高潮的快感而扭曲的脸。");
            outputText("[pg]你猛地惊醒，清晨鸟儿在废弃帐篷里回荡的叫声是你唯一的问候。你试图迅速起身，但立刻就后悔了。昨晚遭受的种种蹂躏让你的身体酸痛不已。你从桌子上滑下来，四处寻找你的装备。令人惊讶的是，你发现它们被整齐地叠成一捆");
            if(get_player().get_gems() > 1)
            {
               outputText("只是少了几颗宝石");
               _loc2_ = get_player();
               _loc2_.set_gems(_loc2_.get_gems() - (3 + Utils.rand(4)));
               if(get_player().get_gems() < 0)
               {
                  get_player().set_gems(0);
               }
            }
            outputText("。你重新穿好衣服，然后意识到一件事。你多了一样东西：一瓶系着棕色丝带的催情药水。末尾的一张纸条上写着：[say: 我会永远记得你努力用你可爱的小嘴包裹我巨大肉棒时的表情。]纸条上没有名字，但从角落里画的熊爪印来看，你很清楚是谁留给你的。你把催情药水揣进口袋，在晨光中离开帐篷，返回集市。[pg]");
            get_player().orgasm("Anal");
            dynStats(DynStat.Sens(5));
            var _temp_2:* = get_game().time;
            _temp_2.days = _temp_2.days + 1;
            get_game().time.hours = 6;
            get_inventory().takeItem(get_consumables().L_DRAFT,get_camp().returnToCampUseOneHour);
            statScreenRefresh();
         }
         else
         {
            outputText("[pg]你大口喘着粗气，兽人喷涌而出的浓稠精液让你的皮肤感到阵阵刺痛。你颤抖着双手，继续抚弄着熊人和虎人的肉棒，他们则继续将肉棒压在你的脸颊上，用先列腺液涂抹你的皮肤。你感觉到熊人向兽人靠近，但那个绿色的肌肉男咆哮着，占有欲极强地向前倾身。[say: 这是扎格的洞！扎格还没完！]兽人咆哮着保护他的领地。熊人小心翼翼地退后，把他的肉棒放回你的脸上，坚定地将肉棒压在你的嘴唇上，决心至少要尝点甜头。兽人粗大的肉棒变硬了，准备开始第二回合（或者对你来说，是第三回合）。他猛烈地撞击你充满精液的幽谷，你舒服地叫出声来。你面前的两根肉棒立刻穿过你张开的嘴唇，它们的龟头摩擦在一起，让你的嘴里充满了喷涌而出的先列腺液。你的舌头在它们上面舔舐，试图把它们推出嘴外，但这只会更加刺激它们。");
            outputText("[pg]你的双手疯狂地在他们的肉棒上动作，揉捏拉扯着他们坚硬的勃起，而你灵巧的手指则在僵硬的肉棒上跳舞。你的努力有了结果，两个男人呻吟出声，一个射了，另一个紧随其后，两股精液射入你的嘴里。他们射进你的嘴里，把你的嘴唇和下巴弄得一团糟，然后拔出来，让几股精液喷在你的脸上。你闭上眼睛，任由两人继续给你做精液面膜。每一股新的、滚烫的精液都粘在你的脸颊上，温暖着你的皮肤。虎人和熊人走开了，你伸手去清理眼睛上的污渍，当你睁开眼睛时，你看到那个高大的兽人正俯视着你。他古怪地对你咧嘴一笑，低下头舔去你脸上的精液，却用他的口水覆盖了你。[say: 扎格喜欢你。扎格知道你喜欢兽人的大肉棒。]他的话语简单而粗鲁，但这些话却让你感到脸颊发烫。");
            outputText("[pg]他大喊一声战吼，开始粗暴地操你，直到你失去理智。");
            if(get_player().hasCock())
            {
               outputText("他的手向下探去，笨拙地把玩着你的[cocks]，一边抚弄着你，一边用他的臀部猛烈地撞击着你。");
            }
            else if(get_player().hasVagina())
            {
               outputText("手指探入你的" + get_player().vaginaDescript(0) + "，在他操你另一个洞的同时，手指也在你体内抽插。");
            }
            if(get_player().get_gender() > 0)
            {
               outputText("你的嘴唇微张，感觉到高潮正在酝酿，很快你的淫液就覆盖了兽人的手和你的下半身。兽人只是把手举起来品尝你的汁液，然后最后一次深深地插入你体内。");
            }
            outputText("第三波热流淹没了你，压力变得更高，你就像一只被填满的生育母狗。疲惫感袭来，你的眼皮开始变得沉重。在你晕过去之前，你看到的最后一幕是兽人因高潮的快感而扭曲的脸。");
            outputText("[pg]你猛地惊醒。清晨鸟儿在废弃帐篷里回荡的叫声是你唯一的问候。你试图迅速起身，但立刻就后悔了。昨晚遭受的种种蹂躏让你全身酸痛。你小心翼翼地从桌子上滑下来，四处寻找你的装备。");
            if(get_player().get_gems() > 1)
            {
               outputText("唯一缺少的是几颗宝石。");
               _loc2_ = get_player();
               _loc2_.set_gems(_loc2_.get_gems() - (3 + Utils.rand(4)));
               if(get_player().get_gems() < 0)
               {
                  get_player().set_gems(0);
               }
            }
            outputText("你迅速重新穿好衣服，然后意识到你多了一样东西：一瓶系着绿色丝带的无脑花瓶药水。丝带末端的一张纸条上写着：[say: 扎格觉得你会是个好兽人母狗。喝了这个，扎格操遍你所有的洞！]字迹是孩子般的涂鸦，你几乎认不出剩下的字。从纸上的污渍来看，很明显兽人太兴奋了，没能好好写完他的纸条，不管是蹩脚的通用语还是其他什么。你把无脑花瓶药水揣进口袋，在晨光中离开帐篷，返回集市。[pg]");
            get_player().orgasm("Generic");
            dynStats(DynStat.Sens(5));
            var _temp_3:* = get_game().time;
            _temp_3.days = _temp_3.days + 1;
            get_game().time.hours = 6;
            get_inventory().takeItem(get_consumables().BIMBOLQ,get_camp().returnToCampUseOneHour);
            statScreenRefresh();
         }
      }
      
      public function escapeFromCertainRape() : void
      {
         var _g:Bazaar;
         clearOutput();
         outputText("你挣脱了猫娘。当你逃跑时，他睁大惊讶的眼睛盯着你。你拼尽全力奔跑，身后猫娘脚步的回声催促你跑得更快。你盲目地穿过树林，看到哪条路就往哪条路跑。然而，在恐慌中，你很快就精疲力竭了。你跑了多远？你现在在哪里？你靠在树干上喘着粗气。谢天谢地，周围似乎没有人，包括你的追捕者。当你注意到附近集市明亮的灯光时，你拍了拍自己，然后退回到了灯火通明的帐篷群中。");
         menu();
         _g = this;
         addButton(0,"继续",function():void
         {
            _g.enterTheBazaarAndMenu();
         });
      }
      
      public function enterTheBazaarAndMenu(param1:Boolean = true) : void
      {
         clearOutput();
         spriteSelect(null);
         get_images().showImage("location-bazaar");
         outputText("你轻快地走过那个红色的守卫，进入了奇特集市的内部。地面被压得很实，仿佛被成百上千的蹄子" + (get_noFur() ? "" : "、爪子") + "和脚踩踏过。空地中央燃起了一堆巨大的篝火，贪婪地吞噬着燃料，发出劈啪作响的声音。围绕着这个燃烧的庞然大物的是一些带轮子的小食品车，小贩们在叫卖着从香肠到一种叫做“棉花糖”的东西。巨大的马车环绕着空地，许多马车都摆放着异国情调的商品或提供服务。你可以看到从跳舞的半人马到浏览商品的恶魔，但这里似乎存在着某种不安的休战状态。不过话又说回来，也许恶魔们只是还没有机会公开攻击这个地方。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,211) == 0)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,211,1);
            outputText("[pg]<b>（“集市”已添加到地点菜单中。）</b>");
         }
         fapArena.fapAppearance();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,292) == 0 && Utils.rand(4) == 0 && param1)
         {
            overHearDemonsAboutSyrena();
            return;
         }
         menu();
         addButton(0,"商店",shopMenu).hint("参观这里的一家商店。");
         addButton(1,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,339) > 0 ? "打飞机竞技场" : "帐篷",fapArena.fapArenaGOOOO).hint("一个大帐篷，前面排着长队。");
         if(get_game().time.hours >= 15 && get_game().time.hours <= 20)
         {
            addButton(5,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,214) > 0 ? "朱砂" : "老鼠",cinnabar.cinnabarAppearance(false));
         }
         addRowButton(1,lilium.getButtonName(),lilium.getButtonFunc());
         addRowButton(1,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,221) > 0 ? "罗克珊" : "蜥蜴人",FlagDict_Impl_.arrayReadInt(KFLAGS.flags,221) > 0 ? roxanne.RoxanneChooseApproachOrRepeat : roxanne.Roxanne1stApproach);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,450) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,449) == -1)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,450) == 2)
            {
               outputText("[pg]高亢的歌声和少女的娇笑声不绝于耳，很明显妮芙正在那里举办一场永不落幕的派对。");
            }
            addRowButton(1,"妮芙",get_game().telAdre.niamh.bazaarNiamh);
         }
         if((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,292) == 1 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,292) == 2) && param1 && Utils.rand(10) == 0)
         {
            outputText("[pg]<b>附近传来了那两个爱抱怨的恶魔熟悉的牢骚声。你要再偷听一次吗？</b>");
            addRowButton(1,"抱怨的恶魔",overHearDemonsAboutSyrena).hint("偷听那两个爱抱怨的恶魔的谈话。","抱怨的恶魔");
         }
         setExitButton().hint("返回营地。");
      }
      
      public function enterTheBazaar() : void
      {
         var _loc1_:* = null as IMap;
         if(get_game().time.hours == 19 || get_game().time.hours == 20)
         {
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,872,FlagDict_Impl_.arrayReadInt(_loc1_,872) + 1);
            if(int(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,872) % 4) == 0 && (get_player().get_gender() == 1 || get_player().get_gender() == 3 && get_player().mf("m","f") == "m"))
            {
               nightBazaarButtfuck();
               return;
            }
         }
         enterTheBazaarAndMenu();
      }
      
      public function collectSomeButtSmex() : void
      {
         clearOutput();
         outputText("你的身体撞在了一张木桌上，你感到一阵窒息，感觉风都被撞出来了。你挣扎着抬起头，喘了口气，却发现自己躺在……扑克筹码里？");
         outputText("[pg][say: 你他妈在干嘛？这不是酒！] 一个声音喊道。");
         outputText("[pg][say: 不过可能更好。]");
         outputText("[pg][say: 闭上你们的臭嘴！]");
         outputText("[pg]当你环顾四周时，周围充满了声音。一盏灯悬挂在你上方，灯光的热量从头顶倾泻而下。你动了动，继续弄乱扑克桌，移动筹码，把扑克牌散落在桌子上和地板上。当你努力看清周围的人影时，烟味和酒味扑鼻而来。一个大熊" + (get_noFur() ? "耳男人，胸前长满了浓密的毛发，" : "，从头到脚长满了棕色的毛发，") + " 吼道。[say: 你在搞什么鬼？]");
         outputText("[pg]你顺着他的目光看去，只见那个" + (get_noFur() ? "虎人" : "猫科动物般的身影") + " 走进了灯光下，露出了他那人虎混血的特征。他的" + (get_noFur() ? "外貌除了毛茸茸的前臂和长长的尾巴（覆盖着带黑色条纹的橙色毛发），以及头上的两只黑白相间的耳朵外，和人类没什么两样" : "脸看起来像人，但身体上覆盖着带黑色条纹的橙色毛发") + "。[say: 在外面闲逛时发现的。] 老虎咆哮着回应。");
         outputText("[pg][say: 不错，反正我也厌倦了打牌。] 在你身后，响起了一个低沉的声音。你转过头，看到了一个魁梧的绿色男性。一颗长着獠牙的头颅长在肌肉发达、魁梧的肩膀和躯干上。你皱着眉头看着这些奇怪的男人。仔细一看，你意识到他们肯定都是健身房的常客，因为每个人光着的上半身都堆满了隆起而可怕的肌肉。视线里连一件衬衫都没有。");
         outputText("[pg][say: 我说闭上你们的臭嘴！] 一个威严的声音轰鸣而出，让所有人（包括你）都安静下来，看向说话者的方向。一个身材瘦削的生物从座位上站了起来——另一个类人生物，长着像山羊一样毛茸茸的长腿。巨大的卷角从他那一头卷曲的棕发中伸出。在它们下方，银色的眼睛仔细地打量着你，评估着你。");
         outputText("[pg][say: 你在干什么？] 光着膀子的萨特用命令的口吻问道，他的眼睛盯着虎人。");
         outputText("[pg][say: 他是我的报酬。比几杯酒值钱多了，] 老虎咆哮道。你的脑海里充满了困惑，你想知道到底发生了什么事。");
         outputText("[pg][say: 这也不够付清全部。你得拿出点更好的东西来。]萨特叹了口气说道。[say: 不过……算是个开始。]你瞥向那个萨特，只见他打了个响指，将手举在空中。还没等你发问或反抗，兽人的双手就死死抓住了你的手腕，而那个熊人则抓住了你的脚踝。你拼命挣扎，试图挥舞四肢，但熊人和兽人的力气实在太大了。");
         outputText("[pg][say: 我建议你试着放松点，小筹码。]萨特一边说着，一边拔开了一瓶催情药剂的软木塞。[say: 还有，以后记得避开黑漆漆的小巷，不过现在说这个有点晚了。]萨特邪恶地咧嘴笑着，手指捏住了你的鼻子。你知道接下来会发生什么，徒劳地屏住呼吸。很快，粉色的液体被强行灌入你的喉咙，你喘息着呛咳起来。没过多久，你的身体就开始屈服于药效。衣服下的身体越来越热，很快，这四个男人都用饥渴的眼神打量着你。");
         outputText("[pg]你的[armor]很快就被剥去，将你的身体展现在这四个男人面前。随着催情药剂的药效接管你的身体，你的每一次呼吸都变成了呜咽般的喘息。你努力让眼睛保持聚焦。温暖和酥麻感淹没了你的感官，顺着皮肤蔓延到你的下体，引起阵阵酸胀。");
         if(get_player().hasCock())
         {
            outputText("在众人的注视下，[EachCock]变得坚挺。你皱起眉头试图抵抗药效，但很快你就开始滴下珍珠般的先列腺液。");
         }
         if(get_player().hasVagina())
         {
            outputText("你的" + get_player().vaginaDescript(0) + "在兴奋中变得湿滑。");
         }
         if(get_player().get_gender() == 0)
         {
            outputText("你的皮肤发热发麻，汗水浸湿了体表。");
         }
         outputText("半羊人的手顺着你的身体游走，用淫荡的目光和轻柔的抚摸打量着你，在药水的作用下，你随着他的指尖颤抖。[say: 我想还不错。不过你本可以做得更好。] 半羊人转头看向虎人，他的话语刺痛了你的自尊，尽管你嘴边的反驳很快就被他的手指给堵了回去");
         if(get_player().hasCock())
         {
            outputText("包裹住了你的[cocks]。");
         }
         else
         {
            outputText("摩擦着你的[asshole]。");
         }
         outputText("他的手在你的身体上挑逗着，而那两个肌肉男则把你按在原地。你只能喘息着，在他的触碰下扭动着臀部。你转过头，恳求地看着你的俘虏者。那个抓住你手腕的绿色大块头看起来就像一个长着黄眼睛的超大地精。他橄榄色的皮肤紧紧地绷在鼓胀的肌肉上。他魁梧的身躯看起来和他的身高一样充满力量，大概有七英尺高。那个按住你下半身的同样健壮的男人看起来很像一个有着锐利绿眼睛的熊人，比那个绿色的兽人要矮壮得多。这对“健身房常客”的裤裆里都有着同样肿胀的凸起，他们的眼睛死死地盯着你赤裸的身体");
         if(get_player().hasCock())
         {
            outputText("和坚挺的肉棒");
         }
         if(get_player().cockTotal() > 1)
         {
            outputText("");
         }
         outputText("。");
         if(get_player().cockTotal() >= 3)
         {
            outputText("[pg]不甘示弱地，这两个男人各自松开抓住你四肢的一只手，握住了你的一根[cocks]。你的头向后仰倒在你躺着的桌子上，嘴巴大张着呻吟，背部高高拱起。两只手以各自的节奏套弄着，快感淹没了你的理智。将你按住的手已经松开，但你根本无法集中精力去逃跑。");
         }
         if(get_player().hasCock())
         {
            outputText("[pg]半羊人用手套弄着你的肉棒。你的臀部疯狂地挺动着，那只手将你自己的先列腺液涂抹在你的肉棒上，发出淫荡的黏腻水声。");
         }
         else
         {
            outputText("[pg]他的手指滑过你紧致的穴肉，探入你的[asshole]并向两侧扩张，感觉像是花了几个世纪的时间来放松你的后穴。");
         }
         outputText("毫无预兆地，那只手离开了");
         if(get_player().cockTotal() > 1)
         {
            outputText("，你的[cocks]因难耐的渴望而湿漉漉地拍打在你的肚子上");
         }
         outputText("。一声呜咽从你的唇间漏出。[say: 这样应该没问题……] 萨特冷静、沉着的声音低语道。");
         outputText("[pg][say: 我要用那个洞。] 你身后传来粗犷的咕哝声。你转过头，看到那个魁梧的兽人正在笨拙地解裤子。他胯下鼓包的尺寸让你的脊背感到一阵");
         if(get_player().lib < 50)
         {
            outputText("恐惧");
         }
         else
         {
            outputText("兴奋");
         }
         outputText("。");
         outputText("[pg][say:不行。]萨特一巴掌拍在兽人的胸肌上，打得那块肌肉微微颤动。[say:要是你先上，就把我们剩下的兴致都给毁了。我先来。]那群俘虏者犹豫了片刻，然后纷纷点头同意。");
         if(get_player().isBiped())
         {
            outputText("熊人挪了挪步子，抓住你的脚踝，把你的双腿分得极开，几乎到了令人痛苦的地步。腿部肌肉拉扯的刺痛让你忍不住倒吸一口凉气。");
         }
         outputText("伴随着蹄子踩在地板上的哒哒声，萨特走到了你的" + get_player().buttDescript() + "边。他的双手紧紧抓住你的[hips]，把你拖向桌子边缘，让你的[ass]悬在桌外。你抬起头，带着");
         if(get_player().lib < 50)
         {
            outputText("惊恐的");
         }
         else
         {
            outputText("兴奋的");
         }
         outputText("的表情，萨特的手抚摸着他坚硬的长度。它看起来至少有八英寸长，像人类的阴茎一样光滑，从一片卷曲的棕色毛发中伸出来。萨特调整好位置，用他坚硬的龟头摩擦你的[asshole]。");
         outputText("[pg]药水的效果在你的体内依然新鲜，当你的敏感的[asshole]被戳弄时，你呻吟出声。滑溜溜、热腾腾的萨特精液粘在你的菊花上，随着他球状的龟头，让你的入口变得容易打开。萨特平静地慢慢来，直到你的洞口滴着水，为他做好了准备。这似乎无休止的折磨让你发疯，似乎萨特等了几个小时才最终决定插入你。一旦满意，萨特将臀部向前推，粗暴地将他的阴茎塞进你体内。你因刺痛而退缩，咬住下唇，试图不让他们听到你的呜咽声而感到满足。你闭上眼睛，无论如何都发出一声呻吟，那根肉棒在你丝滑的肉壁上跳动的感觉让你发出一声低沉的呻吟");
         if(get_player().hasCock())
         {
            outputText("同时[eachCock]抽搐着，在你的[skinfurscales]上慷慨地流出液体");
         }
         outputText("。");
         outputText("[pg]当有什么又热又湿的东西压在你的脸上时，你喘着粗气。你睁开眼睛，迎接你的是一根坚硬的阴茎压在你的脸颊上，之前的那个虎人正笼罩着你，用他带刺的、流着口水的肉棒在你的脸上摩擦。[say: 应该很明显。] 虎人隆隆地说。[say: 但不准咬，除非你想被打一顿，然后被扔在帐篷外面舔伤口。] 虎人咆哮着，坚持不懈地把他的阴茎在你的脸上摩擦。");
         outputText("[pg][say: 把你的鸡巴从他身上拿开。这是你给我们的报酬。]熊人低声咆哮着。你转过头，看到一根粗壮的熊鸡巴正在争夺你脸部的使用权。兽人仍然在你身后的视线之外，尽管你能听到那个野蛮人四处走动的声音。熊人和虎人继续争吵，他们的肉棒用力压在你脸的两侧，两根肉棒相互摩擦，并在你的嘴唇上滑动，将浓稠的先列腺液滴落在你的皮肤上。他们弄湿了你的嘴唇，让你尝到了即将到来的滋味。");
         outputText("[pg]这一切发生的同时，你的[ass]被萨特低垂的睾丸一遍又一遍地拍打着。萨特不时发出一声满足的呻吟，而你的身体则因为他的长条一次又一次地没入体内而颤抖哆嗦。不过，他看起来不像是很快就会停下来的样子。你转过头，看到了虎人那根带倒刺的九英寸长肉棒。短粗的倒刺每次擦过你的脸颊，都会让你的皮肤感到一阵刺痛。另一方面，熊人的肉棒看起来短一些，大约七英寸，但绝对是这群人中最粗的。如果你试图用嘴包住它，那巨大的粗度很可能会弄疼你的下巴。你要怎么做？");
         get_player().orgasm("Anal");
         menu();
         addButton(0,"吸虎人",suckOffATiger);
         addButton(1,"吸熊人",suckOffABear);
         addButton(2,"都不吸",suckOffNone);
      }
      
      public function assaultYoRapistYo() : void
      {
         clearOutput();
         if(get_player().get_str() + Utils.rand(30) < 50)
         {
            outputText("为了扭转局面，你抓住猫娘的手腕，拼尽全力拉扯，试图从这个奇怪的身影中挣脱出来。然而，你的肌肉让你失望了，猫娘迅速将你的手臂反剪在背后。尽管你奋力反抗，但那双更有力的手将你牢牢固定在原地。你暗自咒骂自己没有在健身房花更多时间。[say: 尝试得不错。这几乎……很可爱。] 在你被迅速推入大帐篷的入口之前，你再次听到身后那个身影的窃笑。");
            menu();
            addButton(0,"继续",collectSomeButtSmex);
         }
         else
         {
            outputText("你喘着粗气，看着这个比你弱小的家伙试图强迫你合作。你摇了摇头，然后迅速制服了他。你有力的双手紧紧抓住他的手腕" + (get_noFur() ? "" : "，手指间能感受到他柔软的皮毛") + "。伴随着一声低沉的闷哼，你将他按倒在地，把他的脸按进泥土里。这个" + (get_noFur() ? "男人" : "猫科兽人") + "咆哮着，试图把手臂从你的掌控中挣脱出来，而你只用一只手就抓住了他的两个手腕。你俯下身打量着他，光线透过附近的帐篷缝隙照进来，照亮了他" + (get_noFur() ? "圆圆的、像老虎一样长满黑白相间皮毛的耳朵" : "长着黑色条纹的橙色皮毛") + "。你把一个高大魁梧的虎人按在身下。你打算拿他怎么办？");
            menu();
            addButton(14,"离开",assaultWinAndLeave);
            if(get_player().isCorruptEnough(66))
            {
               addButton(0,"凌辱后庭",abuseHisAss);
            }
         }
      }
      
      public function assaultWinAndLeave() : void
      {
         var _g:Bazaar;
         clearOutput();
         outputText("你把这个高大的虎人推倒在泥地上。他的脸在泥土上摩擦，愤怒的咆哮声变得沉闷。你警告他不要招惹比他强的人，然后把他留在泥地里，他的自尊心受到了严重的打击。当你转身悠闲地沿着小路继续走，直到回到集市时，你脚跟下的泥土在黑暗中发出摩擦声。");
         menu();
         _g = this;
         addButton(0,"继续",function():void
         {
            _g.enterTheBazaarAndMenu();
         });
      }
      
      public function approachBazaarGuard() : void
      {
         clearOutput();
         outputText("你从隐蔽处走出来，走向那个奇怪的男人，大声打招呼。他双臂交叉在胸前，上下打量着你，用深邃的黑眼睛盯着你。它们不是纯黑色的玛瑙，但他的虹膜和他那似乎深不见底的瞳孔一样黑。他用评估的目光注视着你，一秒又一秒地过去，他连眼睛都不眨一下。正当你开始怀疑他是否会说你的语言时，他打断了你，说道，");
         if(!get_player().isCorruptEnough(33))
         {
            outputText("[say:马上离开。你还没有准备好迎接集市的奇妙之处。]");
            menu();
            addButton(0,"战斗！",initiateFightGuard);
            addNextButton("口交",guardBlowjob).hint("在玛瑞斯，有哪个男人不能被一点口交说服呢？");
         }
         else
         {
            outputText("[say:欢迎来到奇特集市。进去吧，但要注意你在里面的行为。]");
            menu();
            addButton(0,"进入",enterTheBazaar);
         }
         setExitButton();
      }
      
      public function abuseHisAss() : void
      {
         var _g1:Bazaar;
         var _g:Bazaar;
         clearOutput();
         outputText("你的舌头舔过嘴唇，脑海中闪过各种可能性。[say:放开我！] 猫科兽人在你身下咆哮着，但你有更好的主意。你腾出一只手，粗暴地扯下他的裤子，将他肌肉发达的臀部暴露在凉爽的夜风中。手掌感受到紧实的臀肉，你几乎是爱抚般地揉捏着，然后用力拍打了一下，引得虎人发出一声压抑的闷哼。");
         if(!get_player().hasCock())
         {
            outputText("[pg]决定羞辱这个可怜的蠢货，你开始用手拍打虎人的屁股。你的拍打越来越用力，声音也越来越响，清脆的巴掌声在夜空中回荡。虎人反抗的咆哮声逐渐变成了轻柔的呜咽，他慢慢停止了挣扎，屈服了。你的手紧紧抓住一侧臀肉，手指陷入被蹂躏的肌肉中，感受着你造成的刺痛带来的温度。你歪着头，看着虎人双腿间勃起的阴茎，忍不住露出了坏笑。");
            outputText("[pg][say:什么声音？] 你转过头，听到附近帐篷里传来一声低沉的呼喊。你窃笑着把受辱的虎人推倒在地，让他暴露着勃起的下体，而帐篷里的人正涌出来。当他们包围他时，你早就溜之大吉，回到了集市里灯火通明的帐篷群中。");
            menu();
            _g = this;
            addButton(0,"继续",function():void
            {
               _g.enterTheBazaarAndMenu();
            });
            return;
         }
         outputText("[pg]你决定和眼前这个肌肉发达的屁股好好玩玩。你一只手抓住挣扎的虎人的手腕，另一只手把你的[cocks]从[armor]里掏出来。你的眼睛贪婪地看着这个魁梧的虎人在你身下扭动。他完全任你摆布。");
         if(get_player().cockTotal() > 1)
         {
            outputText("你的手抚摸着你的[cocks]，把它们压在眼前暴露的温暖臀部上。");
         }
         else
         {
            outputText("你套弄着你的[cocks]，挤出一滴先列腺液，滴在眼前诱人的屁股上。");
         }
         outputText("[say:喂——喂！] 虎人大喊着，转过头试图看清身后的情况。你嘴角挂着坏笑，握住[oneCock]的根部，用它的长度拍打虎人的屁股。当他听到并感觉到你的肉棒拍打他暴露的屁股时，你可以看到他脸颊上的红晕。先列腺液顺着[oneCock]滴落，你调整好位置，把它塞进虎人迷人的双丘之间。当你的龟头压在他紧致的、布满皱褶的小穴上时，他发出了一声惊讶的叫喊。");
         if(get_player().smallestCockLength() >= 16)
         {
            outputText("[pg]你张开嘴，发出一声沮丧的闷哼。你的龟头无法突破虎人紧致的阻碍。当[eachCock]继续在他肌肉发达的臀部上流口水时，他的挣扎开始减弱。");
            if(get_player().totalCocks() == 1)
            {
               outputText("你把你的[cocks]挤在他温暖的臀瓣之间，用他暴露的屁股摩擦自己。虎人在你身下温顺地呜咽着。");
            }
            else
            {
               outputText("你最粗的肉棒在虎人的屁股间摩擦，把精液滴在他的背上和衣服上，而你其他的肉棒则把他的屁股弄得一团糟。");
            }
            outputText("虎人肌肉发达的屁股很快就被你的先列腺液弄得亮晶晶的。当你把臀部压向他的屁股时，湿润的拍打声在小巷里回荡。你脑海中不禁闪过一个念头：这声音会不会惊动他出来的那个帐篷里的人。");
         }
         else
         {
            outputText("[pg]你把龟头塞进虎人紧致的后庭。他在你身下不满地呻吟着，因为你持续的力量突破了他的抵抗。");
            if(get_player().cockTotal() > 1)
            {
               outputText("你的一根肉棒滑入了他火热、紧致的通道，剩下的长度紧紧贴在虎人的屁股上，留下闪闪发光的渴望体液的痕迹，就像母狗屁股上的标记一样。");
            }
            else
            {
               outputText("你的[cocks]顶了进去，沾满先列腺液的肉棒伴随着湿润的水声滑入。");
            }
            outputText("身下魁梧的男人发出抗议的呜咽，而你开始在他那紧致的屁股上抽插。他结实的臀部在你的胯下凹陷、抽搐，每一次撞击");
            if(get_player().balls > 0)
            {
               outputText("都让你的[balls]拍打在他身上，");
            }
            outputText("让他不舒服地大叫起来。你的[cocks]将他撑开");
            if(get_player().cockTotal() > 1)
            {
               outputText("同时拍打着他的屁股");
            }
            outputText("。他的叫喊声惊动了他出来的那个帐篷里的人。");
         }
         outputText("[pg]当你继续享用被你压在身下的魁梧虎人时，三个身影从帐篷里走了出来。其中两个身材高大魁梧，第三个则是个瘦削的男人。他们看着你蹂躏身下的老虎。你瞥了他们一眼，不禁注意到他们脸上的笑容。");
         outputText("[pg][say: 干得好，伙计，一边给我们弄酒一边交朋友。] 其中一个人喊道。三个人因为这个笑话大笑起来，随着他们的笑声，一股酒气扑面而来，刺激着你的感官。从这三人摇摇晃晃的样子可以看出，他们喝了不少。不过他们并没有阻止你的意思，所以你没理他们。你身下的老虎盯着他们的方向，在你玩弄和蹂躏他的时候，羞愧让他的脸颊涨得通红。不过，这场景对你来说太刺激了，很快你的[cocks]就在老虎身上释放了积蓄的精液，当着他“朋友”的面，给他涂上了一层浓稠、充满麝香味的精液。");
         outputText("[pg][say: 他甚至很享受呢！] 其中一个身影大吼道。你歪着头，从老虎张开的双腿间看去，果然，那根带刺的肉棒随着他心脏的跳动在双腿间抽动着。你毫不客气地把被蹂躏的虎人翻到他沾满精液的背上，把你的[cocks]塞回[armor]里。那三个人醉得太厉害了，根本拦不住你离开。你回头瞥了一眼老虎，看到那三个身影围着受害者，你的嘴角勾起一抹满意的微笑。不一会儿，你就回到了集市的灯光下。");
         menu();
         _g1 = this;
         addButton(0,"继续",function():void
         {
            _g1.enterTheBazaarAndMenu();
         });
      }
   }
}

