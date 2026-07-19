package classes.scenes.seasonal
{
   import classes.BaseContent;
   import classes.CoC;
   import classes.Cock;
   import classes.CockTypesEnum;
   import classes.DebugMenu;
   import classes.DynStat;
   import classes.DynStatOp;
   import classes.ItemType;
   import classes.PerkLib;
   import classes.Player;
   import classes.SelfDebug;
   import classes.Time;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.items.ConsumableLib;
   import classes.items.weapons.IceWeapon;
   import classes.parser._Parser.TagFun_Impl_;
   import classes.saves.SelfSaver;
   import classes.saves.SelfSaving;
   import classes.scenes.Camp;
   import classes.scenes.Inventory;
   import classes.scenes.seasonal._Nieve.SaveContent;
   import coc.view.CoCButton;
   import flash.Boot;
   
   public class Nieve extends BaseContent implements SelfDebug, SelfSaving
   {
      
      public var saveVersion:int;
      
      public var saveName:String;
      
      public var saveContent:SaveContent;
      
      public var globalSave:Boolean;
      
      public function Nieve()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         globalSave = false;
         saveVersion = 2;
         saveName = "nieve";
         saveContent = new SaveContent(null,null,null,null,null,null,null,null,null,null,null,null,null);
         super();
         SelfSaver.register(this);
         DebugMenu.register(this);
      }
      
      public function yesKeepNieve() : void
      {
         clearOutput();
         outputText("你被这个问题逗笑了。你当然想让[nhim]留下来！");
         if(get_silly())
         {
            outputText("一个免费的追随者，不用担心买那些没用的染料或者提升好感度？操，你当然要收下[nhim]！");
         }
         outputText("[Nhe]看起来没有任何威胁，而且[nhe]被派来做你的爱人这件事似乎也是真心的。");
         outputText("[pg]尼芙对你展颜一笑，[say: 你不会后悔的！只要给我一点时间在这里布置个舒适的地方……然后[i:我们]就可以好好舒服一下了。]");
         outputText("[pg]你带着傻乎乎的笑容回到了营地。");
         outputText("[pg][b:(尼芙已被添加到恋人菜单中。)]");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function upgradeNieve() : void
      {
         var _loc1_:* = null as String;
         if(get_stage() == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,647) > 0)
         {
            saveContent.stage = FlagDict_Impl_.arrayReadInt(KFLAGS.flags,647);
            _loc1_ = FlagDict_Impl_.arrayReadString(KFLAGS.flags,649);
            saveContent.face = _loc1_ != null ? _loc1_ : "";
            saveContent.gender = FlagDict_Impl_.arrayReadInt(KFLAGS.flags,648);
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,647,0);
         }
      }
      
      public function takeNieveVaginal() : void
      {
         clearOutput();
         outputText("你因为前戏已经湿透了，这很明显。更重要的是，尼芙注意到了，他露出了和之前一样的笑容。他脸上的表情表明他知道你想要什么，他只是在等待他的[master]发话。");
         if(get_player().cor < 50)
         {
            outputText("[pg]你白了他一眼，问他是不是非要你说出来。[say: 我不知道您是什么意思，[Master]，]他自满地回答，斜睨了你一眼。你那[if (snowchild) {小}]性奴刚才表现出的极度自鸣得意让你感到沮丧，以至于你脱口而出，你只是想让他操你的小穴。");
         }
         else
         {
            outputText("[pg]你问你的[if (snowchild) {小}]玩具是不是在故作矜持，他只是又斜睨了你一眼。然后你捏住他的下巴，强迫他看着你的眼睛，你们的脸相距不到一英寸。你低声说，他要把他那漂亮的蓝色睾丸里的东西直接清空到你的子宫里，他最好现在就开始。立刻。马上。");
         }
         outputText("[pg]尼芙顺从地回答：[say: 是的，女士！]然后迅速将你平放在背上");
         if(get_player().balls > 0)
         {
            outputText("，同时温柔地把你的[balls]拨到一边");
         }
         outputText("。他将他那[if (snowchild) {四|九}]英寸长的蓝色肉棒深深地插入你湿透的肉匣中。插入时空气中充满了响亮的吧唧声，这让尼芙可以开始全速前进，以急促的步伐像活塞一样进进出出。");
         get_player().cuntChange(isKid() ? 4 : 9,true,true,false);
         if(get_player().hasCock())
         {
            outputText("在抽插的过程中，尼芙抓住了你悬垂的[cock biggest]，开始配合他自己的抽插节奏套弄它，非常渴望取悦他的[master]。每次你女性的一半高潮时，你男性的一半也会高潮，将它快乐的种子溅入你们结合的身体所形成的山谷中。");
         }
         if(get_player().lactationQ() >= 10)
         {
            outputText("你的[if (snowchild) {冰孩子|冰人}]伸出一只空闲的手抚摸你的[chest]，他的手指在你娇嫩的[nipples]周围转动。在进行了一些粗暴的拉扯和弹击，同时不断抽插之后，他感觉到乳汁滴落到了他的手上。他快速瞥了一眼那液体，然后一头扎进去吸吮你的乳头，在他即将把他的精华给你时，大口地喝着你的乳汁。");
         }
         outputText("[pg]你享受着这趟旅程，甚至更多，因为他那[if (snowchild) {小巧的}]肉棒在你的小穴里不断地锤击，拼命地想用他的种子喂养你的子宫。他抚摸、揉捏、轻咬你身体的各个部位，迅速地刺激一个又一个区域，让这种感觉一次又一次……又一次地焕然一新。每次你高潮时，他都会抽插得稍微慢一点、重一点，当你试图榨干他所有的精液，拼命地想要感觉到被填满时，他发出的咕噜声也更重了。");
         outputText("[pg]你最后一次高潮，这次他也一样，他那[if (snowchild) {可爱的小}]肉棒深深地插入[if (!snowchild) {，龟头亲吻着你子宫的入口}]，因为它溢出了那股清脆的冰冷精液，纯粹的量让你的子宫膨胀起来。冰冷的感觉结合精液在你子宫里的化学反应，让你陷入了一种流口水的欣快感中，你向后仰起头，在狂喜的喧闹尖叫声中。你把头靠在后面，幸福地没有意识到世界上任何其他事情，除了这种感觉。");
         outputText("[pg]在似乎过了几个小时后，你恢复了理智，尼芙平静地靠在你身上，同时仍然连接着。他似乎已经昏过去了，正愉快地把头靠在你的[chest]上。你躺在那里，尽管你身上有一具冰冷的身体，但你仍然因为最近的活动而满脸通红，浑身发热。你觉得足够舒服，可以再次打瞌睡了。");
         outputText("[pg]又过了一个小时，你醒来时已经穿戴整齐，躺在尼芙身边。你注意到他可能已经盯着你看了好几分钟了。你站起身，拍了拍身上的雪，然后用一只手揉了揉他雪白的头发，同时说道：[say: 好孩子。]");
         get_player().orgasm("All");
         dynStats(DynStat.Sens(-2));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function takeNieveAnal() : void
      {
         clearOutput();
         outputText("你让你那冷冰冰的[if (snowchild) {小|}]情人知道你想要他把蓝色的肉棒插在哪里。你转过身，四肢着地，双手抓住[butt]的两侧，粗俗地掰开臀瓣，露出你的[asshole]。他不需要更多的邀请，便将脸凑近你那淫荡的小穴。你感觉到他纯净冰冷的呼吸拂过你的下体，让你不禁颤抖。刚才的前戏已经让你欲火焚身，你焦急地等待着，感觉像是过了好几分钟，他才用舌头试探你的小穴，用他那冰凉润滑的唾液涂抹你的[butthole]。这冰火两重天的刺激让你颤抖得更加厉害，你十分享受他舌头带来的冰爽体验。");
         outputText("[pg]几分钟令人兴奋的舔弄后，他退开了，你转过头从肩膀上方看着他。你花了一点时间欣赏你的杰作，以及他那完美雕塑般的身躯。就在这时，他那[if (snowchild) {四|九}]英寸长的肉棒猛地一下插进了你的肛门，让你发出一声狂喜的尖叫。体贴地" + (isKid() && !get_player().isChild() && get_player().looseness(false) > 1 ? "，尽管这可能没必要" : "") + "，尼芙等了一会儿，让你的小穴适应他那[if (snowchild) {小巧的|粗大的}]肉棒，然后才开始极其缓慢地抽插。你尽情享受着这番滋味，因为尽管你在这片土地上遇到的几乎每根阴茎都比他的大，但他那冰冷的肉棒却有一种独特的魅力，让你欲罢不能。你结束了思绪，从内心的独白中醒来，感受着他带给你的极地般冰冷的抽插节奏越来越快。");
         get_player().buttChange(isKid() ? 4 : 9,true,true,false);
         outputText("[pg]他不断加快节奏，直到你们俩都像发情的野兽一样。随着你开始感觉到屁股里传来一阵暖意，猛烈撞击发出的淫荡水声回荡在周围。那异常响亮的水声告诉你，他流出了一些先列腺液，那根冰冷的肉棒就像在玩变态的滑水道一样，在你的[asshole]里进进出出。");
         if(get_player().hasCock())
         {
            outputText("尼芙保持着节奏，同时向前弯下腰，从后面伸手摸你。他用一只[if (snowchild) {小}]手抓住你的[cock biggest]，开始配合着他抽插的速度套弄起来，这种额外的刺激以一种美妙的方式折磨着你。");
         }
         else if(get_player().hasVagina())
         {
            outputText("尼芙继续猛烈地抽插着，他把一只手放在你湿透的阴户上，开始配合着他的攻势用手指抠弄你，这种刺激让你沉醉在欲望之中。");
         }
         outputText("[pg][if (snowchild) {小男孩|尼芙}]继续闷哼着，在你的[if (silly) {菊花|[asshole]}]里戳刺、深入，直到你感觉到高潮即将来临。尼芙狂热地用他那[if (snowchild) {发育不全的|又长又冷的}]肉棒尽力刺穿你，他先高潮了。在最后一次抽插中，他将阴茎尽可能深地插了进去，随着他因高潮而颤抖的身体，一股清凉的精液涌入你的肠道。当他的精液打在你的内壁上时，你也随之陷入了狂喜的痛苦之中");
         if(get_player().hasCock())
         {
            outputText("，你的身体起伏痉挛着，精液开始从[eachCock]喷涌而出");
            if(get_player().cumQ() < 200)
            {
               outputText("，当你高潮时，在你身下的雪地上留下了一小滩水渍");
            }
            else if(get_player().cumQ() < 500)
            {
               outputText("，当你把精液射到雪地上时，你自己的白浊也开始沾满你的手臂和双手");
            }
         }
         if(get_player().hasVagina())
         {
            outputText("。你湿透的阴道让你的身体在高潮时颤抖和战栗，把你的淫液溅得尼芙和雪地上到处都是");
         }
         outputText("。");
         outputText("[pg]你们俩保持着那个姿势休息，尽管尼芙几分钟前就停止了动作，但他仍在向你体内滴着精液。你转过头看着他，发现他的脸离你[if (snowchild) {不远|只有几英寸}]。很明显，他现在几乎失去了意识。你稍微挪动了一下，吻了他，感谢他干得好。过了一会儿，你们俩都恢复了过来，重新穿好衣服，默默地回去继续赶路。离开时回头看着他，你知道你很快就想再来一次。");
         get_player().orgasm("All");
         dynStats(DynStat.Sens(-2));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function suckNieveOff() : void
      {
         clearOutput();
         outputText("你上下打量着你那冷冰冰的同伴，审视着[nhis]冰冷的面容。这冰雪精灵[if (snowchild) {孩子般的身体和可爱的五官|轮廓分明的身体和清晰的五官}]看起来就像是出自雕塑大师之手。这冬之精灵注意到了你挑剔的目光，挺直了身子，想要向你展示他最好的一面。你对他的举动报以微笑，不禁注意到他的身体对你亲密的注视做出了反应，他双腿间[if (snowchild) {浅|深}]蓝色的肉棒仿佛察觉到了你的性意图，开始勃起。你轻笑着走上前，伸出手，用温暖的手掌包裹住那根冰冷、肿胀的肉棒。你触碰在尼芙敏感、颤抖的[if (snowchild) {小鸡鸡|男根}]上，那纯粹的热量让他倒吸了一口凉气，这精灵现在才意识到你到底想干什么。");
         outputText("[pg]你凑上前，轻轻捏了他一下，并在他耳边低语，告诉这个冰川生物你要“融化他的冰柱”。你的话让他蓝色的脸颊泛起紫色的红晕，但你可以清楚地看出，他很高兴能得到你这样的关注。[say:你想让我舒服？我……我很荣幸你想这样让我舒服，[Master]，非常感谢你，]他一边说着，冰冷的双手环抱住你。你慢慢地抚摸着那根冰冷的肉棒，轻轻地按摩着尼芙，直到他的身体为你做好准备。在你舒缓、火热的抚摸下，他很快就完全勃起了，[if (snowchild) {小巧|粗壮}]的肉棒在你的手中硬得发疼，你继续抚摸着。由于是由冰雪构成的，你的朋友似乎对你身体的热量非常敏感。如果他这么喜欢你的手，你确信他会爱上你那火热、湿润的嘴。");
         outputText("[pg]你跪了下来，抬起头咧嘴一笑，然后吸了一口气，对着那冰冷的肉体吹气，柔软的热气让他喘息起来，双手滑到了你的头上。你对他的反应窃笑了一声，凑了上去。你用双手握住他[if (snowchild) {纤细|粗壮}]的肉棒，一边抚摸揉捏，一边深吸一口气，吸入这精灵身上那股冰冷的冬日薄荷味。这奇特清新的气味既让人放松又让人兴奋，驱使你更深地吸入这舒缓的气味。你靠得更近了，把脸贴在他的肉体上，深呼吸着，把鼻子和嘴巴压在尼芙[if (snowchild) {小巧|巨大}]、冰冷的蛋蛋上。你火热的舌头伸出来舔舐那些清爽饱满的坚果，他的肉体开始发出嘶嘶声，一团团蒸汽从他雪白的皮肤上升起，一团清脆的云雾从你这位北极同伴身上爆发出来。[say:好……好热……]他喘息着说，双手穿过你的[hair]，沉浸在你带给他的快感中。");
         outputText("[pg]即使你在舔舐和吸吮他冰冷的蛋蛋，你的双手也在迅速地抚摸和揉捏那根颤抖的肉棒，你双手的热量融化了雪花和冰冷的先列腺液，变成了一层光滑的润滑剂，为你充满激情的愉悦工作提供便利。你从那些美味的睾丸向上舔去，舌头顺着尼芙[if (snowchild) {娇小肉棒|冰川巨物}]的根部向上滑动，你的嘴唇和嘴巴只在亲吻那根贯穿你想要取悦的长度的冰冷精管时才会停下。你一路吸吮到顶端，在尼芙肉柱的冠部深深地吻了一下。当你的舌头滑过那[if (snowchild) {可爱|凸起}]的蘑菇状龟头，引得[if (snowchild) {小男孩|尼芙}]发出充满快感的呻吟和喘息时，你尝到了他的味道——冰冷清爽，就像带着一丝甜味的薄荷。这独特的味道刺激了你的口部动作，让这个过程对你来说更加美味。");
         outputText("[pg]看到尼芙如此享受你的服务，而且他的身体味道如此宜人，你忍不住直接埋头苦干。你舔遍了整个龟头，然后沉下身子，将他[if (snowchild) {小巧的}]冰冷长矛深深地含进你火热、湿润的嘴里。你的舌头伸出来，舔遍了你体内那根凸起的蓝色巨兽。你一边吸吮舔舐你那冬日情人，双手一边按摩着那些冰冷的蛋蛋。尼芙情不自禁地抓住你的头，在空气中呻吟着，把你拉近。你帮他更深地进入你体内，以获得更多你那甜蜜的热量和快感。你上下摆动着头，吸吮着他那冰冷薄荷味的肉棒，将他[if (snowchild && !ischild) {尽可能深地含入，那根薄荷香肠还不够长，够不到你的喉咙|越来越深地含入，直到他抵住你的喉咙，球状的龟头压在你温暖的肉体上，然后像它本来就是一根薄荷香肠一样滑下你的喉咙}]。");
         outputText("[pg][say: 哦哦哦……哦，太太太热了，对，就是这样，]他嘶嘶地喘息着，当你侵犯他那根冰冻的肉棒时，带着香味的蒸汽像雾一样从你的嘴里流出。你给他的那种令人脊背发凉的快感，就像你[if (snowchild) {小小的}]爱人脸上纯净的冰一样清晰，他的脸颊泛着紫罗兰色，当他用手捧着你的头时，他的眼中流露出一种迷茫的幸福神情。从他那甜蜜而绝望的快感表情中，你可以看出他越来越接近他那令人眼花缭乱的深渊边缘。看到你那被雪覆盖的精灵如此接近高潮，你微笑着闭上眼睛，更加努力地为你这位冬日的朋友带来更多的享受。你尽可能深地吞吐，你的脸很快就贴在了他的骨盆上，你像个专业人士一样吸吮着他。[if (snowchild && !ischild) {你用舌头用力顶着|你收紧喉咙，吞咽着}]那根冰冷跳动的肉棒，迫使那根[if (snowchild) {可爱的|巨大的}]蓝色阴茎进入一个紧密火热的拥抱，这让他发出了一声[if (snowchild) {孩子气的|低沉的}]纯粹愉悦的呻吟。");
         outputText("[pg]你熟练地吸吮着，舌头在肉棒上滑动，尽管你的嘴里已经塞满了，但你还是尽可能地舔舐着每一个地方。你用手捧着那些[if (snowchild) {未成熟的|肿胀的}]睾丸，温柔地抚摸着它们，即使它们在跳动和肿胀，你也在温柔地按摩着它们，它们那冰冷的有效载荷已经准备好爆发并喷涌进你的嘴里。他那充满快感的喘息声只给了你几秒钟的提示，警告你他即将高潮。尼芙发出了一声纯粹狂喜的长长呻吟，将他那薄荷味的精液射进了你的嘴里。一股又一股，一阵又一阵浓稠的、薄荷味的精液流过你的舌头，顺着你的喉咙流下。每一次喷射，你的舌头都被那强烈的薄荷味所淹没，浓稠的液体涌入你的食道，汇聚在你的胃里。由于他那[if (snowchild) {小小的}]身体大概是由冰雪构成的，你不确定他把这些薄荷味的奶油藏在哪里，越来越多的精液倾泻而出，直到你的肚子几乎感觉被这冰冷的量撑得肿胀起来。你因为肚子里冰冷的精液而颤抖着，慢慢地退后，在拔出之前吸干了你冬日爱人最后几股珍珠般的种子。");
         outputText("[pg]你深深地叹了口气，抬起头，想看看尼芙脸上的表情。这个冰生的[if (snowchild) {孩子|男人}]看起来再高兴不过了，他低头看着你时，脸上带着傻傻的笑容。[say: 哦，[Master]……那太棒了，我以前从未见过这么熟练的人。我希望你现在不会太冷，]他带着一丝担忧说道，因为他知道他的身体，以及他的精液，一定很冷。你安慰他，告诉你的冰霜朋友你很好，而且他的味道其实很好。尼芙看起来很满意，他扶你起来，然后[if (!snowchild) {一把}]将你紧紧抱住。[say: 非常感谢你这么做，但下次让我来伺候你吧，你也需要享受，]这个元素精灵温柔地说，然后帮你清理干净，准备好你的冒险。");
         dynStats(DynStat.Lust(10 + get_player().lib / 10));
         if(get_player().get_lust() < 33)
         {
            dynStats(DynStat.Lust(33,DynStatOp.Eq),DynStat.NoScale);
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function snowLadyActive() : void
      {
         clearOutput();
         hideMenus();
         outputText("你醒来时，空气中弥漫着一股寒意，让你不禁打了个寒颤。你睡眼惺忪地睁开眼睛，环顾营地，直到你的目光落在一块纯白色的土地上。那明亮闪烁的白色甚至让你的眼睛刺痛了一瞬。");
         outputText("[pg]你从铺盖卷上站起身，走向那片闪烁着白光的地方。这会是恶魔设下的某种陷阱吗？那到底会是什么？当你走近时，你意识到这白色不仅铺在地上……还在从天空中飘落。");
         outputText("[pg][b:下雪了！]");
         outputText("[pg]你冲进这片冰天雪地，享受着脚下熟悉的踩雪声。更多的雪花飘落下来，落在你的[skinfurscales]上，立刻融化了。有那么一瞬间，你觉得自己又像个[if (ischild) {正常的}]孩子一样，在雪花中旋转、跳跃，伸出舌头品尝着雪花，你发誓你几乎能闻到村子里刚出炉的冬季美食的香味。随着这种怀旧的感觉消退，你听到远处传来一阵轻微的叮当声，接着是一阵爽朗、欢快的笑声。");
         outputText("[pg]你躺在雪地里，挥舞着手臂和双腿，快速地做了一个雪天使，同时思考着你可以用这份节日礼物做些什么。你回想起[if (ischild) {英格纳姆的冬天|你的童年}]，以及孩子们在刚下过雪后堆雪人的情景。");
         outputText("[pg]坐在这片闪闪发光的白色雪地里，你觉得这里的雪足够堆一个大小合适的雪人了。至于材料……做手臂的树枝，当然，你周围到处都是，而且你确信你有一些旧破布可以做围巾。至于眼睛，英格纳姆所有的孩子都用煤炭，但你觉得宝石也可以。你心想，鼻子将是最棘手的；在这个地方去哪里找胡萝卜呢？");
         outputText("[pg]思考着堆雪人的后勤工作，你回到了营地。");
         outputText("[pg]（“雪”已添加到[b: 营地行动]菜单中！）");
         set_stage(1);
         doNext(playerMenu);
      }
      
      public function set_stage(param1:int) : int
      {
         saveContent.stage = param1;
         return param1;
      }
      
      public function set_coalFound(param1:Boolean) : Boolean
      {
         saveContent.coalFound = param1;
         return param1;
      }
      
      public function saveToObject() : Object
      {
         return saveContent;
      }
      
      public function returnOfNieve() : void
      {
         registerParserTags();
         clearOutput();
         outputText("早晨醒来时，你发现自己微微发抖。一阵凉风拂过你的营地，远处传来叮当的铃声。真奇怪。自从……之后，你就再也没听过这样的铃声了。");
         outputText("[pg]你的心漏跳了一拍。");
         outputText("[pg][b: 自从尼芙离开你之后，你就再也没听过这样的铃声了]。");
         outputText("[pg]你迅速环顾营地，直到目光落在一片闪闪发光的白色上：那是刚下的新雪。与周围的景色相比，那纯粹的白色几乎刺痛了你的眼睛。你发疯似地冲进雪地，积雪没过了你的脚踝。小雪花继续缓缓飘落，叮当声渐渐消失在虚无中。但你什么也看不见……没有熟悉的[snowman]来迎接你。也许尼芙真的永远离开了？");
         outputText("[pg]你瘫倒在雪地里，紧紧握着尼芙的眼泪，回想起[nhis]对你说的最后一句话。[say: 你是我能奢求的最好的主人。]那个声音在你脑海中回荡。[say: 而且……而且我会想——……]虽然[nhe]的话被打断了，但你知道[nhe]想说什么。");
         outputText("[pg][say: 我也很想你，]你对着那滴眼泪低语，然后攥紧了拳头。你的视线模糊了，自己的眼眶也开始湿润。");
         outputText("[pg][nhim]真的什么都没留下。除了这块遗失的碎片。一个朋友的回音。");
         doNext(fixNieve);
      }
      
      public function reset() : void
      {
         saveContent.stage = 0;
         saveContent.gender = 0;
         saveContent.face = "";
         saveContent.age = -1;
         saveContent.coalFound = false;
         saveContent.seenSpear = false;
         saveContent.weaponTalked = false;
         saveContent.guardCamp = false;
         saveContent.guardAsked = false;
         saveContent.kidsPlayed = false;
         saveContent.kidsPlayedSingular = false;
         saveContent.virgin = true;
         saveContent.analVirgin = true;
      }
      
      public function registerParserTags() : void
      {
         registerTag("nhe",TagFun_Impl_.fromString(nieveMF("他","她")));
         registerTag("nhim",TagFun_Impl_.fromString(nieveMF("他","她")));
         registerTag("nhis",TagFun_Impl_.fromString(nieveMF("他的","她的")));
         registerTag("nhis2",TagFun_Impl_.fromString(nieveMF("他的","她的")));
         registerTag("nhers",TagFun_Impl_.fromString(nieveMF("他的","她的")));
         registerTag("snowchild",TagFun_Impl_.fromBool(isKid()));
         registerTag("coaleyes",TagFun_Impl_.fromBool(saveContent.face == "coal"));
      }
      
      public function onAscend(param1:Boolean) : void
      {
         reset();
      }
      
      public function noNoKeepNieve() : void
      {
         clearOutput();
         outputText("你摇了摇头。当然不行！虽然[nhe]表面上看起来是个好人，但你忍不住觉得这只是冰山一角。据你所知，[nhe]骨子里可能是一个冷酷的婊子，是恶魔设下的陷阱，用来引诱你产生虚假的安全感。你断定，这帮狡猾的混蛋。他们肯定知道复仇的最佳方式，但你绝不会上当。");
         outputText("[pg]尼芙看起来很失望，但表示理解地点了点头。[say: 有人告诉我，不是每个人都能接受我们。也许明年我会找到一个更好客的人。]你耸了耸肩，对[nhim]不理不睬。");
         outputText("[pg]在一阵耀眼的闪光中，尼芙消失了，剩下的只有你堆的[snowman]。你能感觉到温度开始上升，你知道，再过几个小时，这片冰雪仙境将不复存在。");
         set_stage(-1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function nieveWeaponTalk() : void
      {
         var _g1:Nieve;
         var _g:Nieve;
         var _loc1_:* = null as String;
         clearOutput();
         if(!saveContent.weaponTalked)
         {
            saveContent.weaponTalked = true;
            if(get_game().time.hours == 15)
            {
               outputText("你向[nhim]询问[nhe]刚才练习用的那把长矛。");
            }
            else if(get_game().time.hours == 18)
            {
               outputText("你问[nhim]关于[nhe]刚才正在制作的长矛的事。");
            }
            else
            {
               outputText("想起你曾见[nhim]拿过的冰矛，你决定问问这事。");
            }
            outputText("[pg][say: 我的主要职责是陪伴，但我也可以帮忙做些其他事情，比如保护你的家。而且就算你不需要守卫，掌握一些自卫技能总归是好事，对吧？] 这个[if (snowchild) {年轻的}]冰精灵转过身，让你能清楚地看到[nhis][if (snowchild) {可爱的小屁股|性感的屁股}]，同时[nhe]拿起[nhis]冰柱长矛快速转了一圈，向你炫耀。");
            outputText("[pg]你忍不住想，用冰做的武器到底能有多大威力。[nhe]去找一把真正的武器来用不是更好吗？");
            outputText("[pg]一阵突如其来的雪花包围了你，你很快注意到" + nieveMbFg("冰之精灵","小男孩","冰之精灵","小女孩") + "手中的长矛正在改变形状，变得更长更锋利。[say:冰和我的魔法更配，对于冰之精灵来说，它比木头或金属有用得多。确实，在我的小雪地之外很难防止它融化，但是]——这个元素[if (snowchild) {孩子}]微笑着扑向你，小心翼翼地不刺伤你，同时[nhe]用[nhis]双臂紧紧地抱住你[if (snowchild && !ischild) {的腰}]——[say:除了和你在一起，我没有别的地方可去，所以没关系。]");
            outputText("[pg]拥抱了一会儿后，[nhe]退后一步，放下了长矛。");
            outputText("[pg][say: 如果你想试试，我也可以给你做一把长矛，或者别的武器。不过，即使有魔法加持，离开这里它可能也撑不了多久。]");
            outputText("[pg]你想让尼芙为你制作一把冰武器吗？");
            menu();
            addNextButton("是",nieveWeaponChoose);
         }
         else
         {
            _loc1_ = IceWeapon.playerHasIceWeapon();
            if(_loc1_ != "")
            {
               outputText("[say: 你想让我修好你的" + _loc1_ + "吗，[Master]？]");
               menu();
               _g = this;
               addNextButton("是",function():void
               {
                  _g.nieveWeaponGet();
               });
            }
            else
            {
               outputText("[say: 你想让我给你做一把冰武器吗，[Master]？]");
               menu();
               addNextButton("是",nieveWeaponChoose);
            }
         }
         _g1 = this;
         addNextButton("否",function():void
         {
            _g1.nieveTalk();
         });
      }
      
      public function nieveWeaponGet(param1:String = undefined) : void
      {
         var _g1:Nieve;
         var _g:Nieve;
         var _loc2_:* = null as Function;
         if(param1 == null)
         {
            param1 = "";
         }
         clearOutput();
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2797,10);
         if(param1 == "")
         {
            outputText("尼芙抓住你的" + IceWeapon.playerHasIceWeapon() + "，将[nhis]冰魔法注入其中。它闪烁着光芒，慢慢变得更加坚固。");
            outputText("[pg][say: 好了，焕然一新！]");
            _g = this;
            doNext(function():void
            {
               _g.approachNieve();
            });
         }
         else
         {
            outputText("尼芙坐在雪地里，把雪在[nhim]面前堆成一堆。[Nhe]开始整理并把雪堆塑造成大致正确的形状，然后[nhis]脸上露出专注的神情，一阵刺骨的寒风吹过，雪堆开始凝结变硬。这位极地工匠继续塑造和打磨你的武器，随着它变成水晶般湛蓝的冰，没过多久，[nhe]就留下了一把完美制作的" + param1.toLowerCase() + "。");
            outputText("[pg]你的[if (snowchild) {极地小童|冰雪精灵}]骄傲地对你微笑，[nhe]站起身来，向你展示你新的冰制" + param1.toLowerCase() + "。[say: 给你，[Master]！如果它开始融化，你可以把它带回来，我会修好它，或者如果它完全融化了，我可以直接给你做一把新的。]");
            _g1 = this;
            _loc2_ = function():void
            {
               _g1.approachNieve();
            };
            get_inventory().takeItem(ItemType.lookupItem("Ice" + param1),_loc2_);
         }
      }
      
      public function nieveWeaponChoose() : void
      {
         var _g:Nieve;
         var _loc2_:* = null as String;
         outputText("[pg]你想要什么类型的武器？");
         menu();
         var _loc1_:int = 0;
         while(_loc1_ < int(IceWeapon.typeStrings.length))
         {
            _loc2_ = Utils.capitalizeFirstLetter(IceWeapon.typeStrings[_loc1_]);
            addNextButton(_loc2_,(function(param1:Array, param2:Array):Function
            {
               var _g:Array = param1;
               var weapon:Array = param2;
               return function():void
               {
                  _g[0].nieveWeaponGet(weapon[0]);
               };
            })([this],[_loc2_]));
            _loc1_++;
         }
         _g = this;
         setExitButton("返回",function():void
         {
            _g.nieveTalk();
         });
      }
      
      public function nieveTalk(param1:String = undefined) : void
      {
         var _g:Nieve;
         if(param1 == null)
         {
            param1 = "";
         }
         menu();
         if(saveContent.seenSpear)
         {
            if(saveContent.weaponTalked)
            {
               addNextButton("冰制武器",nieveWeaponTalk).hint("让尼芙为你制作一把武器。");
            }
            else
            {
               addNextButton("长矛",nieveWeaponTalk).hint("询问关于[nhis]冰矛的事。");
            }
         }
         addNextButton("奴隶",nieveSlaveTalk).hint("谈谈你们之间的关系。").disableIf(param1 == "Slave");
         addNextButton("魔法",nieveMagicTalk).hint("那[i:是]什么魔法？").disableIf(param1 == "Magic");
         addNextButton("形态",nieveFormTalk).hint("问问尼芙[nhe]是否对你给[nhim]的身体感到满意。").disableIf(param1 == "Form");
         addNextButton("体温",nieveBodyHeatTalk).hint("身体变热对[nhim]来说是个问题吗？").disableIf(param1 == "Body Heat");
         _g = this;
         setExitButton("返回",function():void
         {
            _g.approachNieve();
         });
      }
      
      public function nieveStrapon() : void
      {
         clearOutput();
         outputText("好吧，虽然她是个女孩，但你自己也想找点乐子。虽然你最后没能给她装上什么合适的装备，但你现在很想被好好填满。你对她说，作为你的性奴，她肯定能弄出点让你满意的东西。她咧嘴笑了起来。");
         outputText("[pg][say:当然，[Master]，这不成问题。我很乐意效劳。]");
         outputText("[pg]这位冰之精灵华丽地挥舞着双手，她的胯下长出了一根冰冷的突起。这根冰柱很长[if (snowchild) {——对她娇小的身体来说几乎不成比例——| }]，形状隐约像阴茎，似乎直接连接在她的阴唇上。真是不可思议，但你还是得问问她这东西用起来行不行。");
         outputText("[pg][say:嗯？哦，这只是个简单的魔法。对我来说感觉应该和你一样好，而且对你来说会[b:非常]好。] 伴随着这番描述，她还调皮地眨了眨眼，尽管周围气氛寒冷，你却已经开始觉得浑身发热了。[say:那么，[Master]，你想要怎么做？]");
         outputText("[pg]有太多种可能性，让你一时之间有些不知所措，但你很快就确定了最重要的细节——在这里你说了算，所以你要在上面。想到这里，你指示尼芙仰面躺下，她高兴地照做了。外面有点冷，你伴侣的新玩具看起来也无济于事，所以你觉得在开始之前需要做些适当的准备。幸运的是，你身边就有一个随时准备好且非常乐意用嘴服侍你的奴隶。");
         outputText("[pg]你让尼芙坐起来，当她照做时，你立刻抓住她的头，将它拉向你的入口。她的舌头如恶魔般迅速地滑入你的体内，开始拼命地工作，仿佛她的生命就取决于用舌头把你操到神志不清。她的热情令人惊讶，她投入其中的纯粹激情几乎让你过早地达到高潮，但你设法控制住了自己的身体，用坚定的手按住她的头，向后拉开。");
         outputText("[pg]她什么也没说，但脸上的坏笑清楚地表明了她的得意。[if (snowchild) {这种表情在一个这么年轻的女孩脸上显得格外令人恼火|[if (cor < 50) {她的表情让你的脸微微发热，但你才是这里的主人|这种表情完全不符合她作为奴隶的身份}]}]，所以你准备抹掉她脸上的笑容，命令她重新躺下，然后[if (singleleg) {向后退去|退后几步}]。");
         outputText("[pg][say:当然，[Master]。随时听候您的吩咐。]");
         outputText("[pg]她在你身下微微扭动着她那[if (snowchild) {娇小、像男孩一样的|令人垂涎的}]臀部，你一刻也等不及了。你将你的[vagina]对准那根冰冷的穿戴式假阳具，然后猛地坐了下去。之前的服务已经让你湿得一塌糊涂，所以你可以随心所欲地快速骑乘，这不仅让你自己，也让尼芙感到无比愉悦。她显然没有说谎，她确实能从那东西上获得快感，因为她的眼睛已经因情欲而变得迷离。你自己的情况也好不到哪里去；这才刚刚开始，你的身体感觉就像着了火一样，即使你已经冷到了骨子里。你快速地摇晃着臀部，发现尼芙的小玩具大小和形状都堪称完美，让你彻底陷入疯狂。感觉太棒了，你几乎无法保持理智——你所有的精力都集中在抽插上，再也没有多余的力气支撑自己。");
         get_player().cuntChange(7,true,true,false);
         outputText("[pg]由于没有更好的抓手，你向前倒去，抓住了她[if (snowchild) {完全平坦的|适中的}]胸部，享受着那里柔软、富有弹性的肌肤。然而，她脸上依然残留着之前那种傲慢的神情，所以你把手指移到她[if (snowchild) {小巧的|坚挺的}]乳头上，用力地拉扯了一下。她一开始痛呼出声，但随着你把玩她的乳头，她很快就开始呻吟起来。");
         outputText("[pg]寒冷开始完全渗透你的身体，但奇怪的是，这丝毫没有让人感到不适。恰恰相反——刺骨的寒意与你不断累积的快感交织在一起，让你感觉仿佛置身于刀尖之上，你所有的神经都完美地契合着流经你全身的感觉。冰冷填满了你，刺穿了你，让你变得完整，你再也无法克制自己。你在你[if (snowchild) {小巧的}]性奴身上猛烈地高潮了，你呻吟着，那份炽热的激情足以融化让你沉醉的冰霜。");
         outputText("[pg]你的[vagina]尽其所能地榨取着你体内的冰柱，即使它什么也给不了。你能听到身下的女孩发出和你一样大的声音，所以你继续骑乘着她。这显然对[snowman]来说太刺激了，她翻着白眼，一声颤抖的哭喊在喉咙里消失。这是她应得的，这是你脑海中最后一个理智的念头，随后你便彻底迷失在极乐之中，在平静的冰海中畅游。");
         outputText("[pg]你不知道自己保持这种状态多久了，但最终世界还是回到了你的身边。你精疲力竭地向前倒去，但立刻就迎来了雪和你那冰冷的伴侣的双重寒意。这让你清醒了过来，你设法[if (singleleg) {直起身子|踉跄地站了起来}]。从这个角度，你可以看到你们胡闹的结果——尼芙的脸上满是极乐的神情，[if (snowchild) {她淫荡的表情与她天真的年龄极不相符|这种表情让你的心中升起了一丝自豪}]。");
         outputText("[pg]看起来她需要一些时间来恢复，所以你整理好自己，准备出发，下体残留的寒意还在提醒着你刚才的幽会。");
         get_player().orgasm("Vaginal");
         dynStats(DynStat.Sens(-2));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function nieveSnowWoman() : void
      {
         clearOutput();
         if(isKid())
         {
            outputText("它身上的某种特质让你觉得它隐约有些女性化，但你又说不上来具体是什么。你不知道为什么，但看着它，你确信它是个女孩。考虑到它看起来的年龄，你觉得加上乳房不太合适，所以在这方面它似乎已经准备好了，你满意地点了点头。");
         }
         else
         {
            outputText("你调皮地笑了笑，开始再做两个粉状的雪球。这比做其他的都要快，不知不觉中，你已经给雪人安上了两个冰冷的乳房。它们不是特别大，再重一点你肯定它们会掉下来，但它们已经能说明问题了。");
         }
         outputText("[pg]当然，你的[if (snowchild) {雪孩子|雪女人}]还需要一张脸，不过你可以留到以后再做。现在，你先回到营地的主区域。");
         doNext(get_camp().returnToCampUseOneHour);
         set_stage(2);
         saveContent.gender = 2;
      }
      
      public function nieveSnowMan() : void
      {
         clearOutput();
         outputText("你决定[if (snowchild) {它是个男孩。[if (silly) {虽然你总觉得外面有人在叫你懦夫|没必要在那里瞎掺和，即使是在这样一个陌生的地方。}]|保持原样。当然，不是所有的东西都必须有乳房，即使是在玛瑞斯。}]");
         outputText("[pg]当然，你的[if (snowchild) {雪孩子|雪人}]还需要一张脸，不过你可以留到以后再做。现在，你先回到营地的主区域。");
         doNext(get_camp().returnToCampUseOneHour);
         set_stage(2);
         saveContent.gender = 1;
      }
      
      public function nieveSnowLittle() : void
      {
         saveContent.age = 1;
         nieveBuilding();
      }
      
      public function nieveSnowDelay() : void
      {
         clearOutput();
         outputText("又考虑了一会儿，你转身离开了这片雪地。你心想，如果你决定要做点什么，它还会在这里等你的，所以在天气变暖之前没必要着急。");
         doNext(playerMenu);
      }
      
      public function nieveSnowBig() : void
      {
         saveContent.age = 0;
         nieveBuilding();
      }
      
      public function nieveSlaveTalk() : void
      {
         clearOutput();
         outputText("你问尼芙，[nhe]是否真的愿意做你的“爱奴”。[Nhe]从未抱怨过，但[nhe]如此迅速地接受了这个身份，还是让人觉得有些奇怪，你只是想确认一下[if (cor < 50) {一切都好|以后不会有什么麻烦}]。");
         outputText("[pg]冰雪精灵只是给了你一个[nhis]平时那种轻松的微笑。[say:我一点也不介意和你在一起，[Master]。你这里挺不错的，而且你[i:确实]对我很好，我还有什么好抱怨的呢？]");
         outputText("[pg]嗯，这可不仅仅是过得舒服那么简单。[Nhe]必须和你一起住在营地里，[nhe]必须听你的话，而且[nhe]还不能回[nhis]家。你问[nhe]是不是真的愿意把[nhis]时间都花在服侍你上。");
         outputText("[pg]尼芙把[nhis]手放在[nhis]臀部，微微翘起。[say:我可能是被派来服侍你的，但这并不意味着我不能自己去爱你。我绝对不想要其他的[master]，所以你别为我操心了。]尼芙的脸上带着一丝得意，但考虑到[nhe]刚才说的话，你觉得你可以允许[nhim]这样。");
         nieveTalk("Slave");
      }
      
      public function nieveSexMenu() : void
      {
         var _g:Nieve;
         var _loc1_:Boolean = false;
         clearOutput();
         outputText("你要对你这位“冷酷”的恋人做些什么呢？");
         menu();
         if(saveContent.gender == 2)
         {
            _loc1_ = get_player().hasCock() || get_player().getClitLength() >= 3.5;
            addButton(0,"舔她",lickNieve);
            addButton(1,"操她",saveContent.virgin ? defloralNieve : fuckNieve).sexButton().disableIf(!_loc1_,"需要阴茎或足够大的阴蒂。");
            addButton(2,"操她的屁股",analNieve).hint("插进[nhis]极夜之中。").sexButton(1);
            addButton(3,"被操",nieveStrapon).hint("让她用冰做一个穿戴式假阳具。").sexButton(2,false);
         }
         if(saveContent.gender == 1)
         {
            addButton(0,"给他口交",suckNieveOff);
            addButton(1,"操他的屁股",analNieve).hint("插进[nhis]极夜之中。").sexButton(1);
            addButton(2,"被操",nieveFucksYou).sexButton();
         }
         _g = this;
         addButton(14,"返回",function():void
         {
            _g.approachNieve();
         });
      }
      
      public function nieveReturnsPartII() : void
      {
         clearOutput();
         registerParserTags();
         outputText("你叹了口气，无奈地接受了同伴的命运。然而，当你从雪地里站起来准备返回营地时，你听到一个微弱、沉闷的声音。你感到困惑，在雪地里向前爬行，疯狂地寻找声音的来源。");
         outputText("[pg]就在这时，你看到了它，一个小雪堆，在周围白茫茫的一片中几乎看不见。你把手插进冰冷的雪中，摸到了一个坚硬的东西。一个很大的东西。大约有[if (snowchild) {小孩|人}]那么大。你试图把那个人拉起来，但没费多大劲。");
         outputText("[pg]那个人影自己动了起来，从雪毯中破雪而出。你只看到一抹蓝色的闪光，那生物就张开双臂紧紧地抱住了你。你能听到那个人在轻声抽泣……你只需低头看一眼，就能证实你的猜想。那冰冷的蓝色皮肤和[if (snowchild) {可爱娇小|挺翘好捏}]的屁股。绝对是尼芙。");
         outputText("[pg][say:哦，[Master]！][nhe]哭喊着，挣脱拥抱看着你的眼睛。[Nhis][if (coaleyes) {煤黑色的|闪烁着紫色的}]眼睛里闪烁着结晶的泪水，这与[nhe]上次离开你时留下的泪水并非完全不同。[say:我很高兴能回来！我本来担心会被送到别的地方，但我在这里玩得很开心，我把这些告诉了那个大块头，然后温特来了，我不确定你是否还在，然后结果我可能会去别人那里，但是我的天哪，我太高兴我回来了！]尼芙一口气喊了出来，然后再次用[nhis]双臂紧紧抱住你。");
         outputText("[pg]你紧紧抱住[nhim]，感谢无论这个“大人物”是谁，把尼芙送回了你身边。");
         outputText("[pg][say:我……我仍然只能待一个冬天，至少现在是这样，但这总比没有好，对吧？] 冰雪精灵说着，用[nhers]手紧紧握住你的手。");
         outputText("[pg]你点点头。即使是如此短暂的时刻，你也会珍惜。在接下来的一两个小时里，你们俩分享着故事，好吧，是你分享故事，而尼芙则全神贯注地听着。你们已经很久没见面了，有很多事情要聊……");
         set_stage(5);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function nieveMbFg(param1:String, param2:String, param3:String, param4:String) : String
      {
         return nieveAge(nieveMF(param2,param4),nieveMF(param1,param3));
      }
      
      public function nieveMagicTalk() : void
      {
         clearOutput();
         outputText("你见过尼芙用[nhis]魔法以各种不同的方式操控冰雪，但你很好奇[nhe]到底是怎么做到的。[nhis]力量的源泉是什么？那是你能学会的东西吗？它都能用来做什么？你有一肚子的问题，所以你决定先让[nhim]解释一下基础知识。冰雪精灵若有所思地举起一根手指放在[nhis]脸前。");
         outputText("[pg][say:嗯……我想这对我来说很自然。]尼芙笑容满面，[nhis]闭着眼睛，露出[if (snowchild) {充满青春活力的}]笑容。沉默了几秒钟，你意识到[nhe]没有再说下去了。你又问了一次，这次[if (cor < 50) {试图确保你的问题很清楚，因为似乎有些误解|提醒[nhim]你是[nhis][master]，[nhe]有义务给你一个合适的答案}]。");
         outputText("[pg][Nhe]只是翻了个白眼。[say:[Master]，我知道你想让我说什么，但我就是……]这个[snowman]耸了耸肩。[say:我就是不知道，抱歉。有些事情我知道怎么做，但我不知道我是怎么知道的。也许我生来如此，也许我在家乡学过，但无论答案是什么，我都记不清了，没法告诉你。]");
         outputText("[pg]这个回答多少有些令人[if (cor < 50) {失望|不满意}]。难道[nhe]真的什么都不能告诉你吗？尼芙调皮地咧嘴笑了。");
         outputText("[pg][say:哎呀，[Master]，当然可以！我可以告诉你关于魔法的事——对我来说，你就是世界上最神奇的存在！]冰雪精灵善意地" + nieveMbFg("轻笑","咯咯笑","咯咯笑","咯咯笑") + "着，一阵小雪花飘过。");
         nieveTalk("Magic");
      }
      
      public function nieveMF(param1:String = undefined, param2:String = undefined) : String
      {
         if(param1 == null)
         {
            param1 = "";
         }
         if(param2 == null)
         {
            param2 = "";
         }
         if(isMale())
         {
            return param1;
         }
         return param2;
      }
      
      public function nieveIsOver() : void
      {
         clearOutput();
         hideMenus();
         registerParserTags();
         if(get_stage() < 5)
         {
            outputText("你打了个哈欠，伸了个懒腰醒来。感觉就像平常的任何一天，只是稍微暖和了一点。事实上，是暖和了不少。感觉冬天对玛瑞斯的掌控已经松动，春天正在到来。出于好奇，你瞥了一眼最近堆积在营地里的雪，发现它正在你眼前融化。");
            outputText("[pg]好吧，你觉得这也不是什么巨大的损失。至少在它存在的时候，你玩得很开心。");
            set_stage(0);
         }
         else
         {
            outputText("你打了个哈欠，伸了个懒腰醒来。感觉就像平常的任何一天，只是稍微暖和了一点。事实上，是暖和了不少。感觉冬天对玛瑞斯的掌控已经松动，春天正在到来。起初你只是漫不经心地想着这件事，但随后你猛地停下了脚步。尼芙怎么办？！");
            outputText("[pg]你转向[nhis]的冬日仙境，看见它仍然存在时如释重负，但注意到它正在消退。你快步上前，看着那干涸的荒景一点点侵蚀着泥泞的地面。尼芙坐在中央，带着忧虑的神情仰望着天空。[Nhis]往日闪烁光芒的皮肤如今映着的是汗水，而非白霜。汗珠沿着[nhis]的身体滚落，在[nhis]脚下汇成一片令人担忧的大片水渍。");
            outputText("[pg][say: 啊，[Master]，你来了。我还在担心……在我回家之前，我们可能没机会说话了，][nhe]伤心地说。你问[nhim]，为什么[nhe]必须回家？你以前见过[nhim]造雪，为什么[nhe]不能像那样维持[nhim]自己？尼芙只是摇了摇[nhis]头，[say: 恐怕不是那样的。我们这一族只能在冬季离开家乡。再待下去，我们就会融化。][Nhe]悲伤地叹了口气，你握住[nhis]手。它出奇地温暖，就像人类的体温，完全不是[nhis]平时那种冰冷的触感。");
            outputText("[pg]一阵熟悉的叮当声在空气中回荡，你们俩低头一看，发现尼芙的腿被一个正在融化的巨大冰雪球所取代。显然不想去想这件事，[nhe]伸出[nhis]双臂搂住你，把你拉进一个拥抱。[say:我只想说，][nhe]在你的耳边低语。[say:你是我能期望的最好的主人。而且……][nhe]停顿了一下，眼泪在[nhis]眼眶里打转，[say:而且我会想——……][Nhis]声音渐渐消失。当你挣脱拥抱看着[nhim]，想催促[nhim]继续说下去时，只有你最初创造的那个雪人毫无生气的眼睛回望着你。");
            outputText("[pg]它的一切看起来都和原来一模一样……除了眼睛上挂着一颗闪闪发光的泪滴状冰柱。当你检查它时，它脱落了，掉在你的肩膀上。这是尼芙，那个[if (snowchild) {小小的}]冰精灵流下的最后一滴眼泪。");
            outputText("[pg]你捡起那颗似乎完全没有融化的冰冻眼泪，紧紧地攥在手里。");
            if(get_player().cor < 50)
            {
               outputText("你甚至自己也流下了眼泪，为这么好的朋友如此突然地离开而感到悲伤。");
            }
            else
            {
               outputText("你甚至自己也感到有些难过，看到一个听话的好玩具离开真是太可惜了。");
            }
            outputText("雪人倒塌了，在你眼前融化。几个小时后，这整个区域将再次变成干燥的泥土。但随着叮当声在远处渐渐消失，你发誓要好好保存这滴眼泪。");
            outputText("[pg]尼芙的眼泪。");
            if(get_player().cor < 50)
            {
               outputText("[pg]朋友的眼泪。");
            }
            if(!get_player().hasKeyItem("Nieve\'s Tear"))
            {
               outputText("[pg][b:(获得关键物品：尼芙的眼泪)]");
               get_player().createKeyItem("Nieve\'s Tear",1,0,0,0);
            }
            set_stage(0);
         }
         doNext(playerMenu);
      }
      
      public function nieveGuardToggle() : void
      {
         var _g:Nieve;
         clearOutput();
         if(saveContent.guardCamp)
         {
            outputText("你告诉尼芙[nhe]不需要再守卫营地了。[Nhe]微微点头作为回应。");
            outputText("[pg][say: 明白了，[Master]。]");
            saveContent.guardCamp = false;
         }
         else
         {
            if(!saveContent.guardAsked)
            {
               outputText("在见识了尼芙的枪法和魔法之后，让[nhim]来保护营地似乎是个好主意。你问[nhe]是否能在夜间守夜。");
            }
            else
            {
               outputText("你问尼芙[nhe]是否能在夜间守夜并保护营地。");
            }
            outputText("[pg][if (snowchild) {这个小小的元素生物|尼芙}]开心地对你笑了笑，并急切地拿起了[nhis]长枪。[say: 我很乐意，[Master]！]");
            saveContent.guardAsked = true;
            saveContent.guardCamp = true;
         }
         _g = this;
         doNext(function():void
         {
            _g.approachNieve();
         });
      }
      
      public function nieveGemEyes() : void
      {
         var _loc1_:* = null as Player;
         clearOutput();
         if(get_player().get_gems() >= 9)
         {
            outputText("你从[inv]里抓出一把宝石，均匀地摆放在[snowman]的脸上，给它拼出了一个漂亮却空洞的笑容。不过它还需要一个鼻子，为此你需要一根胡萝卜。也许附近有农场？");
            _loc1_ = get_player();
            _loc1_.set_gems(_loc1_.get_gems() - 9);
            statScreenRefresh();
            saveContent.face = "gems";
            set_stage(3);
         }
         else
         {
            outputText("你打开[inv]，皱起了眉头。不幸的是，你没有足够的宝石来做眼睛和嘴巴。你叹了口气，拖着破产的身子走回了营地。");
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function nieveFucksYou() : void
      {
         clearOutput();
         outputText("你来到尼芙在营地里的住处，冰[if (snowchild) {男孩|男人}]对你露出了友好的微笑。他笑着注意到了你眼中的渴望，用温柔[if (!snowchild) {却低沉}]的语气说道，[say: [Master]，你似乎需要我的帮助……]");
         outputText("[pg]你点点头，");
         if(get_player().cor < 50)
         {
            outputText("告诉他你觉得他[if (snowchild) {孩子气}]的样子……至少可以说很吸引人，并且想知道他的“零件”是否能正常工作。");
         }
         else
         {
            outputText("让你的造物知道你对他“如何”取悦你很感兴趣，不给他时间去想象你在暗示什么，然后你直截了当地告诉他，你想让他像个玩物一样操你。");
         }
         outputText("[pg]尼芙顺从地鞠了一躬，然后靠近你，熟练地为你宽衣解带。他抚摸着你的[chest]和[nipples]，同时轻咬你的脖子和耳朵，冰凉的亲吻和抚摸在温暖的空气中形成鲜明对比，让你感觉像触电一般，他出人意料的熟练动作让你高兴得浑身发抖。");
         if(get_silly())
         {
            outputText("他的确说过他的同类实际上就是性奴，天哪，这证明了这一点！");
         }
         if(get_player().hasVagina())
         {
            outputText("他刚开始没多久，你的[vag]就湿透了，你开始想要更多，更多！");
         }
         if(get_player().hasCock())
         {
            outputText("没过多久，你的[cock biggest]也变得坚硬如铁，你迫不及待地想要从你冰冷的性奴那里得到更多的刺激。");
         }
         if(get_player().hasVagina())
         {
            menu();
            addButton(0,"肛交",takeNieveAnal);
            addButton(1,"阴道交",takeNieveVaginal);
         }
         else
         {
            doNext(takeNieveAnal);
         }
      }
      
      public function nieveFormTalk() : void
      {
         clearOutput();
         outputText("你突然意识到，你堆那个[snowman]时从未想过它会变成一个人，更不用说在尼芙[nhim]自己能够表达任何[nhis]偏好之前了。[if (cor < 50) {你尽可能委婉地|虽然这对你来说没什么区别，但你感到足够好奇，于是}]问[nhim] [nhe]对[nhis]新身体感觉如何。[nhe]喜欢吗？");
         outputText("[pg][Nhe]微笑着回答：[say:当然啦，傻瓜。这是我的[master]想要的身体，所以我很高兴能拥有它！你为什么这么问？]");
         outputText("[pg]嗯，[nhe]以前可能也有某种身体，所以你想知道这对[nhim]来说是不是个问题。你问[nhe]以前是什么样子。冰雪精灵沉思了片刻，然后耸了耸肩。");
         outputText("[pg][say:不知道。我不记得家乡的人长什么样了。我知道那里还有其他人，我隐约觉得他们大多像你或我，所以这意味着我肯定有过[i:某种]身体，但我一点也想不起来是什么样了。][Nhe]停顿了一下，[nhis][if (coaleyes) {煤炭般乌黑的|闪闪发光的}]眼睛深深地凝视着你。[say:说真的，别担心。我喜欢你为我做的身体。]");
         outputText("[pg]尼芙突然走上前，[nhis]脸上的情欲[if (snowchild) {与[nhis]天真的外表格格不入|显而易见}]。[say:我很乐意向你展示我有多感激它……]");
         nieveTalk("Form");
      }
      
      public function nieveFollower() : Boolean
      {
         upgradeNieve();
         if(nieveAvailable())
         {
            return get_stage() == 5;
         }
         return false;
      }
      
      public function nieveEyes(param1:String = undefined, param2:String = undefined) : String
      {
         if(param1 == null)
         {
            param1 = "";
         }
         if(param2 == null)
         {
            param2 = "";
         }
         if(saveContent.face == "coal")
         {
            return param1;
         }
         return param2;
      }
      
      public function nieveComesToLife() : void
      {
         clearOutput();
         registerParserTags();
         set_stage(5);
         outputText("你打着寒颤醒来。空气中再次弥漫着寒意，在远处你能听到欢快的笑声和叮当响的铃铛声。你猛地坐起来，看向雪堆的方向，期待着一场新的阵雪。遗憾的是，似乎没有新雪，也没有下雪。你皱着眉头，站起来走向雪堆。");
         outputText("[pg]没有任何迹象表明昨晚有访客……等等……你的[snowman]不见了！有人在你睡觉的时候把它毁了吗？");
         outputText("[pg]你悄悄靠近雪堆，觉得你可能找到了罪魁祸首。一个淡蓝色的人形，完全没有穿衣服，躺在柔软洁白的雪地上，就在你雪人原来的位置。");
         if(saveContent.gender == 1)
         {
            outputText("从它胯下长出的[if (snowchild) {小|大}]鸡巴来看，它似乎是雄性");
         }
         else
         {
            outputText("它看起来是女性[if (snowchild) { ，从 |，从其胸部适中大小的乳房和 }]没有阴茎来看，这在玛瑞斯是相当罕见的");
         }
         if(isKid())
         {
            outputText("，而且[nhe]显然只是个孩子");
         }
         outputText("。纯白的头发从[nhis]头上披散下来，几乎与周围的雪景融为一体。");
         outputText("[pg]你握紧了你的[weapon]，用[foot]戳了戳这具赤裸的[if (snowchild) {小孩|身体}]。[Nhe]困惑地睁开了一只眼睛，然后又睁开了另一只。");
         outputText("[pg]一声轻柔的[say: 哇啊？]从[nhis]唇间溢出。[say: 我在哪？] [Nhe]举起一只淡蓝色的手扶着头，环顾四周的景色。[say: 这不是我家。]");
         outputText("[pg]为了防止这全是某个恶魔设下的精心骗局，你谨慎地回应，询问[nhe]是谁，以及[nhe]来自哪里。");
         outputText("[pg][Nhis]眼睛，[if (coaleyes) {煤黑色|闪烁着紫色的}]球体，落在你身上，仿佛第一次认出你。然后一丝认出的神情击中了[nhim]。[say: 哦！[Master]！你是我的[master]！] 瞬间[nhe]站了起来，看起来非常高兴，[nhis]双手在[nhim]身前兴奋地紧握着。");
         outputText("[pg]现在轮到你看起来困惑了。你再次问这个陌生人[nhe]是谁，以及[nhe]来自哪里。");
         outputText("[pg][say: 噢！我来自——] [Nhe]皱起眉头。[say: 我……我已经记不清它的名字了。看来传言是真的。一旦你离开那里，你就再也记不起来了。] [Nhe]哀伤地叹了口气。[say: 我只记得一眼望不到边的雪。巨大的冰崖，就像闪闪发光的蓝白相间的山脉。一个制造玩具的巨大工厂。但我记不清面孔，也记不清名字了……]");
         outputText("[pg]你对[nhim]感到同情，[nhis]身心都与家乡断绝了联系，但这一切和你有什么关系呢？");
         outputText("[pg][say: 对！没错！我是冰雪精灵，我的名字叫尼芙！] [nhe]说着，高兴地伸出一只手臂。你做了自我介绍，并警惕地握了握那只淡蓝色的手，注意到这肌肤摸起来很冷，但并不刺骨。[say: 每当冬天来临，雪花飘落时，我们就会被派往世界各地的随机人群中。我们的职责是在任何方面提供帮助……尤其是在性方面。这，啊，这是我第一次出来。你是我的第一个[master]。]");
         outputText("[pg]你挑了挑眉。这倒是件新鲜事。你就这样白白得到一个毫无附加条件的爱奴？");
         outputText("[pg]尼芙环顾四周的景色，[nhis]目光最终落在了你的营地上。[say: 这里好不一样。这就是你住的地方吗？]");
         outputText("[pg]你点点头，不过你说你其实来自一个叫英格纳姆的村庄，并解释了你在玛瑞斯的任务。尼芙全神贯注地听着，连连点头。");
         outputText("[pg][say: 哇。那太酷了。你就像个勇者什么的！那么，勇者，] [nhe]开口道，[say: 你想让我留下来吗？]");
         menu();
         addButton(0,"是的",yesKeepNieve).hint("让这个友好的冰雪精灵加入你和你的营地。");
         addButton(1,"不要",noNoKeepNieve).hint("不太喜欢意料之外的同伴，把[nhim]送回家。");
      }
      
      public function nieveCoalEyes() : void
      {
         clearOutput();
         get_player().consumeItem(get_consumables().COAL___);
         outputText("幸运的是，你碰巧有一些煤块。");
         outputText("[pg]你把煤块敲成小块，均匀地摆在[snowman]的脸上，弄出一个好看又空洞的微笑。不过它还需要一个鼻子，为此你需要一根胡萝卜。也许附近有农场，或者你可以在哪里买一根？");
         saveContent.face = "coal";
         set_stage(3);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function nieveCampKids() : void
      {
         var _loc6_:* = null as String;
         clearOutput();
         var _loc1_:Array = [];
         var _loc2_:String = "";
         var _loc3_:* = get_camp().getCampKidBreakdown();
         var _loc4_:int = int(_loc3_.total);
         if(int(_loc3_.dragon) > 0)
         {
            _loc1_.push("dragon");
         }
         if(int(_loc3_.shark) > 0)
         {
            _loc1_.push("shark");
         }
         if(int(_loc3_.harpy) > 0)
         {
            _loc1_.push("harpy");
         }
         if(int(_loc3_.cow) > 0)
         {
            _loc1_.push("cow");
         }
         if(int(_loc3_.ant) > 0)
         {
            _loc1_.push("ant");
         }
         if(int(_loc3_.drider) > 0)
         {
            _loc1_.push("drider");
         }
         if(int(_loc3_.anemone) > 0)
         {
            _loc1_.push("anemone");
         }
         if(int(_loc3_.salamander) > 0)
         {
            _loc1_.push("salamander");
         }
         var _loc5_:int = int(Math.min(int(_loc1_.length),3));
         §§push(Utils);
         if(int(_loc1_.length) == 0)
         {
            §§push(Utils.randChoices(_loc5_));
         }
         else if(int(_loc1_.length) == 1)
         {
            §§push(Utils.randChoices(_loc1_[0],_loc5_));
         }
         else if(int(_loc1_.length) == 2)
         {
            §§push(Utils.randChoices(_loc1_[0],_loc1_[1],_loc5_));
         }
         else if(int(_loc1_.length) == 3)
         {
            §§push(Utils.randChoices(_loc1_[0],_loc1_[1],_loc1_[2],_loc5_));
         }
         else if(int(_loc1_.length) == 4)
         {
            §§push(Utils.randChoices(_loc1_[0],_loc1_[1],_loc1_[2],_loc1_[3],_loc5_));
         }
         else if(int(_loc1_.length) == 5)
         {
            §§push(Utils.randChoices(_loc1_[0],_loc1_[1],_loc1_[2],_loc1_[3],_loc1_[4],_loc5_));
         }
         else if(int(_loc1_.length) == 6)
         {
            §§push(Utils.randChoices(_loc1_[0],_loc1_[1],_loc1_[2],_loc1_[3],_loc1_[4],_loc1_[5],_loc5_));
         }
         else if(int(_loc1_.length) == 7)
         {
            §§push(Utils.randChoices(_loc1_[0],_loc1_[1],_loc1_[2],_loc1_[3],_loc1_[4],_loc1_[5],_loc1_[6],_loc5_));
         }
         else if(int(_loc1_.length) == 8)
         {
            §§push(Utils.randChoices(_loc1_[0],_loc1_[1],_loc1_[2],_loc1_[3],_loc1_[4],_loc1_[5],_loc1_[6],_loc1_[7],_loc5_));
         }
         else if(int(_loc1_.length) == 9)
         {
            §§push(Utils.randChoices(_loc1_[0],_loc1_[1],_loc1_[2],_loc1_[3],_loc1_[4],_loc1_[5],_loc1_[6],_loc1_[7],_loc1_[8],_loc5_));
         }
         else if(int(_loc1_.length) == 10)
         {
            §§push(Utils.randChoices(_loc1_[0],_loc1_[1],_loc1_[2],_loc1_[3],_loc1_[4],_loc1_[5],_loc1_[6],_loc1_[7],_loc1_[8],_loc1_[9],_loc5_));
         }
         else if(int(_loc1_.length) == 11)
         {
            §§push(Utils.randChoices(_loc1_[0],_loc1_[1],_loc1_[2],_loc1_[3],_loc1_[4],_loc1_[5],_loc1_[6],_loc1_[7],_loc1_[8],_loc1_[9],_loc1_[10],_loc5_));
         }
         else if(int(_loc1_.length) == 12)
         {
            §§push(Utils.randChoices(_loc1_[0],_loc1_[1],_loc1_[2],_loc1_[3],_loc1_[4],_loc1_[5],_loc1_[6],_loc1_[7],_loc1_[8],_loc1_[9],_loc1_[10],_loc1_[11],_loc5_));
         }
         else if(int(_loc1_.length) == 13)
         {
            §§push(Utils.randChoices(_loc1_[0],_loc1_[1],_loc1_[2],_loc1_[3],_loc1_[4],_loc1_[5],_loc1_[6],_loc1_[7],_loc1_[8],_loc1_[9],_loc1_[10],_loc1_[11],_loc1_[12],_loc5_));
         }
         else if(int(_loc1_.length) == 14)
         {
            §§push(Utils.randChoices(_loc1_[0],_loc1_[1],_loc1_[2],_loc1_[3],_loc1_[4],_loc1_[5],_loc1_[6],_loc1_[7],_loc1_[8],_loc1_[9],_loc1_[10],_loc1_[11],_loc1_[12],_loc1_[13],_loc5_));
         }
         else if(int(_loc1_.length) == 15)
         {
            §§push(Utils.randChoices(_loc1_[0],_loc1_[1],_loc1_[2],_loc1_[3],_loc1_[4],_loc1_[5],_loc1_[6],_loc1_[7],_loc1_[8],_loc1_[9],_loc1_[10],_loc1_[11],_loc1_[12],_loc1_[13],_loc1_[14],_loc5_));
         }
         else if(int(_loc1_.length) == 16)
         {
            §§push(Utils.randChoices(_loc1_[0],_loc1_[1],_loc1_[2],_loc1_[3],_loc1_[4],_loc1_[5],_loc1_[6],_loc1_[7],_loc1_[8],_loc1_[9],_loc1_[10],_loc1_[11],_loc1_[12],_loc1_[13],_loc1_[14],_loc1_[15],_loc5_));
         }
         else if(int(_loc1_.length) == 17)
         {
            §§push(Utils.randChoices(_loc1_[0],_loc1_[1],_loc1_[2],_loc1_[3],_loc1_[4],_loc1_[5],_loc1_[6],_loc1_[7],_loc1_[8],_loc1_[9],_loc1_[10],_loc1_[11],_loc1_[12],_loc1_[13],_loc1_[14],_loc1_[15],_loc1_[16],_loc5_));
         }
         else if(int(_loc1_.length) == 18)
         {
            §§push(Utils.randChoices(_loc1_[0],_loc1_[1],_loc1_[2],_loc1_[3],_loc1_[4],_loc1_[5],_loc1_[6],_loc1_[7],_loc1_[8],_loc1_[9],_loc1_[10],_loc1_[11],_loc1_[12],_loc1_[13],_loc1_[14],_loc1_[15],_loc1_[16],_loc1_[17],_loc5_));
         }
         else if(int(_loc1_.length) == 19)
         {
            §§push(Utils.randChoices(_loc1_[0],_loc1_[1],_loc1_[2],_loc1_[3],_loc1_[4],_loc1_[5],_loc1_[6],_loc1_[7],_loc1_[8],_loc1_[9],_loc1_[10],_loc1_[11],_loc1_[12],_loc1_[13],_loc1_[14],_loc1_[15],_loc1_[16],_loc1_[17],_loc1_[18],_loc5_));
         }
         else
         {
            if(int(_loc1_.length) != 20)
            {
               throw "Too many rest arguments";
            }
            §§push(Utils.randChoices(_loc1_[0],_loc1_[1],_loc1_[2],_loc1_[3],_loc1_[4],_loc1_[5],_loc1_[6],_loc1_[7],_loc1_[8],_loc1_[9],_loc1_[10],_loc1_[11],_loc1_[12],_loc1_[13],_loc1_[14],_loc1_[15],_loc1_[16],_loc1_[17],_loc1_[18],_loc1_[19],_loc5_));
         }
         _loc2_ = §§pop().formatStringArray(§§pop());
         outputText("瞥了一眼营地，你看到那个淡蓝色的冰雪精灵正在四处撒雪。和尼芙一起奔跑的");
         if(_loc5_ == 1)
         {
            _loc6_ = _loc2_ == "salamander" ? get_game().helSpawnScene.get_helspawnName() : "你的" + _loc2_ + "孩子" + (_loc4_ > 1 ? "们" : "");
            outputText("" + (_loc4_ == 1 ? "是" : "是") + _loc6_);
         }
         else
         {
            outputText("是你的孩子们，" + _loc2_ + "一样，都在开心地玩耍");
         }
         outputText("。作为父母的本能告诉你，应该保护你的孩子免受严寒的侵袭，但你也不想打扰他们的好兴致。只要他们知道在" + (_loc4_ == 1 ? "需要的时候" : "需要的时候") + "回到温暖的地方，应该就没问题。冰精灵似乎也玩得很开心。");
         outputText("[pg]欣赏着这充满童趣的景象，你暂时放松下来，看着尼芙教你的" + (_loc4_ == 1 ? _loc2_ + "孩子" : "孩子们") + "滚雪球、堆雪人，直到它勉强有了个人形。你脑海中闪过一个念头，不知道是否可以召唤多个冰精灵，或者尼芙是否愿意这样做，但这次的雪似乎没有任何神秘的属性。尽管这场景令人感到温暖，你还是站起身，继续你的[day]。");
         saveContent.kidsPlayed = true;
         saveContent.kidsPlayedSingular = _loc4_ == 1;
         doNext(playerMenu);
      }
      
      public function nieveCampDescs() : void
      {
         registerParserTags();
         outputText("[pg]");
         switch(get_game().time.hours)
         {
            case 6:
               outputText("尼芙盘腿坐在雪堆里，嚼着看起来像冰柱的东西。就在你看着的时候，[nhe]伸手到[nhim]周围闪闪发光的粉末中，又拿出了一个。");
               break;
            case 7:
               outputText("尼芙咯咯地笑着，一阵新雪飘落在[nhim]身上。你漫不经心地想，是不是[nhe]让这一切发生的。");
               break;
            case 8:
               outputText("尼芙坐在白色的冬季仙境中，小心翼翼地堆着雪人。这让你觉得很奇怪，甚至有点像在自慰。[Nhe]发现了你，向你挥手微笑。有那么一瞬间，你觉得雪人也笑了，但你最终断定那是你的错觉。");
               break;
            case 9:
               outputText("尼芙四仰八叉地躺在冰原上，无忧无虑地做着一连串的雪天使。当[nhe]看到你时，[nhe]友好地挥了挥手，然后又一头扎进雪里。");
               break;
            case 10:
               outputText("冰精灵尼芙静静地坐在雪堆边缘，眺望着远处的风景。当[nhe]看到你在看时，[nhe]忧郁地挥了挥手。");
               break;
            case 11:
               outputText("尼芙在你的营地里，翻找着你的物资[if (builtbarrel) { 和水桶}]。你注意到[nhe]离开[nhis]雪堆似乎有点不舒服。");
               break;
            case 12:
               outputText("尼芙正在[nhis]小营地里小心翼翼地捏雪球。让你惊讶的是，[nhe]拿起一个雪球，像吃苹果一样吃了起来。当[nhe]咬到一半发现你在看时，[nhe]嘴里塞得满满的，鼓着腮帮子冲你咧嘴一笑。");
               break;
            case 13:
               outputText("尼芙盘腿坐着，似乎正在和[nhe]刚堆的雪人争吵。");
               break;
            case 14:
               outputText("尼芙在[nhis]老地方，似乎在全神贯注地思考。在[nhim]周围，雪开始慢慢落下，然后越来越快，狂野地吹打着[nhis]头发。奇怪的是，你所在的地方空气却很静止。");
               break;
            case 15:
               outputText("冰精灵尼芙正在[nhis]营地里旋转，用一把半透明的蓝色长矛练习着。[Nhe]刺、戳、转、扫。[Nhe]可能初来玛瑞斯，但你不得不承认，看起来[nhe]能照顾好自己。");
               saveContent.seenSpear = true;
               break;
            case 16:
               outputText("起初到处都看不到尼芙。然后你看到[nhis]头从雪堆里探出来。[Nhe]迅速环顾四周，然后跃入空中，一头扎进另一堆粉状的雪中。");
               break;
            case 17:
               outputText("尼芙似乎用半透明的蓝色原木和石头建了一个火坑。坑里燃烧着鲜艳的蓝色火焰，尼芙似乎在上面烤着……棉花糖？就在你看着的时候，[nhe]剥下棉花糖烧焦的黑色外皮，狼吞虎咽地吃下去，然后开始烤剩下的。");
               break;
            case 18:
               outputText("尼芙似乎在制作长矛，用一块锯齿状的冰块磨快它。当[nhe]看到你时，[nhe]挥了挥手，露出了友好的微笑。");
               saveContent.seenSpear = true;
               break;
            case 19:
               outputText("尼芙坐在[nhis]冰原边缘，凝视着远处的群山。你想知道[nhe]是不是在寻找家乡。");
               break;
            case 20:
               outputText("令人惊讶的是，尼芙在[nhis]寒冷的营地外面。[Nhe]在干裂的土地上跳舞，召唤着雪。无论雪花落在哪里，都会立刻被干渴的土地吞噬。尼芙是不是在试图……给土地浇水？");
               break;
            default:
               if(get_camp().isGuard("Nieve"))
               {
                  outputText("尼芙正坐在一个小冰堡顶上，警惕地注视着你营地的边界。");
               }
               else
               {
                  outputText("你能听到尼芙在一个小冰堡里睡得很香。");
               }
         }
         outputText("[pg]");
      }
      
      public function nieveBuilding() : void
      {
         var _loc1_:* = null as String;
         clearOutput();
         registerParserTags();
         if(saveContent.age == -1)
         {
            outputText("看着这片奇怪的雪地，你无法摆脱应该用它做点什么的想法。[if (ischild) {即使你身处这片荒凉的土地，你也不应该被剥夺冬日的乐趣，所以你想做一次正常孩子会做的事|虽然你可能有点老了，但这种气氛让你想放松一下，享受一些冬日的乐趣}]。也就是说，你想堆个雪人，幸运的是，你这里的雪看起来非常合适。");
            outputText("[pg]第一步是决定你想要多大的尺寸。你可以做一个完整的，或者你可以做一个小一点的……");
            menu();
            addButton(0,"成人",nieveSnowBig).hint("对你来说这是一个标准的雪人。");
            addButton(1,"儿童",nieveSnowLittle).hint("[if (ischild) {做一个更符合你尺寸的。|让它更紧凑一点。}]");
            addButton(14,"返回",nieveSnowDelay).hint("再考虑一下，这件事留待以后处理。");
         }
         else if(saveContent.gender <= 0)
         {
            outputText("你[if (singleleg) {滑|走}]到那片雪地上，脑海中已经想象出了完成的作品。踩在雪地上的嘎吱声再次让你感到一丝怀旧，你想起了喝上面漂浮着棉花糖的热可可。你面带微笑，开始将柔软的粉末状晶体滚成一个[if (snowchild) {小|巨大}]的球。这需要一些努力，但过了一会儿，你留下了一个[if (snowchild) {适中|大}]的雪堆，它[if (snowchild) {[if (ischild) {大约到你身体的一半高|看起来适合一个青春期前的孩子}]|将作为完美的底座}]。");
            outputText("[pg]你开始制作第二部分，躯干。这花的时间较少，但[if (snowchild) {它的小尺寸实际上使它有点难以保持在一起，一旦完成|然后}]你必须把它拖到底座上而不让它散架。不过，你慢慢来，一切都很顺利。");
            outputText("[pg]最后，头部。你又做了一个紧密堆积的小雪球，把它放在塔上，退后一步看着你的作品。[if (snowchild) {它可能不是很大，但[if (ischild && tallness < 60) {话又说回来，你也不是|在你看来，这只会让它更可爱}]|它的尺寸相当不错，看到它没有散架，你感到有点自豪}]。你在附近抓了几根树枝和营地里的一块破布，把它们都放在雪人身上做成手臂和围巾。总而言之，这是一件相当不错的作品。");
            if(isKid())
            {
               outputText("[pg]突然，你意识到你还没有为你的作品选择性别。体型上不会有太大的区别，但仍然……");
               menu();
               addButton(0,"雪男孩",nieveSnowMan);
               addButton(1,"雪女孩",nieveSnowWoman);
            }
            else
            {
               outputText("[pg]突然，一个顽皮的想法击中了你。如果你愿意，你可能可以把这个雪人变成一个雪女人。");
               menu();
               addButton(0,"雪人",nieveSnowMan);
               addButton(1,"雪女人",nieveSnowWoman);
            }
            addButton(14,"返回",playerMenu);
         }
         else if(saveContent.face == "")
         {
            outputText("你再次走近你的[snowman]，仔细打量着它。");
            outputText("[pg]它还需要眼睛和嘴巴。煤炭是最好的选择");
            if(get_player().hasItemAnywhere(get_consumables().COAL___))
            {
               outputText("，但宝石");
            }
            else if(get_coalFound())
            {
               outputText("，你以前在山里找到过一些，所以那里是个不错的寻找地点。宝石");
            }
            else
            {
               outputText("，但谁知道这附近常不常见呢？宝石");
            }
            outputText("，你决定，是可以接受的替代品。大概需要9颗宝石才能完成，两颗做眼睛，七颗做嘴巴。");
            _loc1_ = "你没有任何煤炭";
            if(get_inventory().hasItemInStorage(get_consumables().COAL___))
            {
               _loc1_ += "在身上。你觉得仓库里应该还有一些。";
            }
            else if(get_coalFound())
            {
               _loc1_ += "。你记得以前在山里找到过一些。";
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2300) > 0)
            {
               _loc1_ += "。按理说在岩石多的地方应该更容易找到。";
            }
            menu();
            addButton(0,"煤炭",nieveCoalEyes).hint("毕竟传统很重要。没有煤炭点缀的[snowman]还能叫雪人吗？").disableIf(!get_player().hasItem(get_consumables().COAL___),_loc1_);
            addButton(1,"宝石",nieveGemEyes).hint("你觉得宝石也是个可以接受的替代品。希望你的[snowman]在乎的不仅仅是你的钱。");
            addButton(14,"返回",playerMenu);
         }
         else if(get_stage() < 4)
         {
            outputText("你走近你快要完成的[snowman]。对别人来说，这可能已经是个完美的作品了，但对你来说还不够。它还需要一根胡萝卜来收尾。");
            if(get_player().hasKeyItem("Carrot"))
            {
               outputText("[pg]幸运的是，你正好有一根完美的胡萝卜。你迅速把它洗干净，切掉尾端，然后直接插在[snowman]脸的正中央。当你退后一步欣赏自己的杰作时，一股怀旧之情涌上心头。你感觉自己仿佛把一点英格纳姆带到了这片陌生的土地上，给这荒凉的风景带来了一丝欢乐。");
               outputText("[pg]你欣赏了一会儿你新做的[snowman]，然后带着一丝微笑回到了营地。");
               set_stage(4);
               get_player().removeKeyItem("Carrot");
               outputText("[pg][b:(失去关键物品：胡萝卜)]");
               doNext(playerMenu);
            }
            else
            {
               outputText("[pg]不幸的是，你在冒险中还没有找到过。你觉得你得更仔细地找找了。谁知道呢，也许就在你眼皮子底下就有一个农场。");
               doNext(playerMenu);
            }
         }
         else
         {
            outputText("你的[snowman]完成了！没有什么需要再添加的了。它看起来非常棒，仅仅是看着它，你的嘴角就泛起了一丝充满怀旧之情的微笑。");
            doNext(playerMenu);
         }
      }
      
      public function nieveBodyHeatTalk() : void
      {
         clearOutput();
         outputText("考虑到尼芙显然是由冰构成的，而你又相当温暖[if (coldblooded) {，即使你严格来说是冷血动物}]，你想知道你们俩靠得太近会不会有问题。你开始问[nhim]，当你们亲热时，是否有……“融化”的危险，但你的话被一阵笑声打断了。尼芙花了一点时间才平复下来，当[nhe]平复后，[nhis]声音中仍然带着一丝笑意。");
         outputText("[pg][say:我会没事的，[Master]。我可能更像个冬天的人，但我也喜欢事情变得有点“火热”，][nhe]欢快地说。");
         outputText("[pg]好吧，你觉得这下算是解决了一个心头大患。");
         nieveTalk("体温");
      }
      
      public function nieveAvailable() : Boolean
      {
         if(!isWinter())
         {
            return get_player().hasPerk(PerkLib.AChristmasCarol);
         }
         return true;
      }
      
      public function nieveAppearance() : void
      {
         var _g:Nieve;
         clearOutput();
         outputText("这个[if (snowchild) {年轻的冰雪精灵大约四英尺|冰雪精灵大约五英尺十英寸}]高。[Nhis]皮肤是淡蓝色的，让你想起结冰的湖面。在[nhis]大腿之间，[nhe]长着" + nieveMbFg("一根看起来大约九英寸长的深蓝色阴茎","一根看起来大约四英寸长的细长浅蓝色阴茎","一对深蓝色的阴唇","一个肿胀的浅蓝色肉丘，上面有一条纯洁的裂缝") + "。");
         if(get_silly())
         {
            outputText("你猜测在[nhis]臀瓣之间还藏着一个屁眼，就在它该在的地方。");
         }
         outputText("[Nhis]腹部平坦而结实，" + nieveMbFg("胸部也是如此","胸部也是如此","并且她拥有一对挺拔的B罩杯乳房","胸部也是如此") + "。[Nhis]脸庞和[nhis]身体的其他部分一样是苍白色的，不过[nhis]闪闪发光的[if (coaleyes) {暗黑色|充满活力的紫色}]眼睛和纯白色的头发与此形成了鲜明的对比，" + nieveMF("头发勉强盖过他的耳朵","头发披散在她的肩膀上") + "。[nhis]身体的大部分都闪烁着一层细细的粉雪或冰晶。");
         _g = this;
         doNext(function():void
         {
            _g.approachNieve();
         });
      }
      
      public function nieveAge(param1:String = undefined, param2:String = undefined) : String
      {
         if(param1 == null)
         {
            param1 = "";
         }
         if(param2 == null)
         {
            param2 = "";
         }
         if(isKid())
         {
            return param1;
         }
         return param2;
      }
      
      public function load(param1:int, param2:*) : void
      {
         Utils.extend(saveContent,param2);
         if(param1 < 2)
         {
            if(Reflect.field(param2,"guardCamp") == 0)
            {
               saveContent.guardCamp = false;
            }
            else
            {
               saveContent.guardAsked = true;
            }
         }
      }
      
      public function lickNieve() : void
      {
         clearOutput();
         outputText("你[if (snowchild) {向小女孩}]解释了你的意图，以及你希望成为给她带来快乐的那个人。她一开始看起来很惊讶，但随后便笑了。[say: 你想……给我口交？]你点点头，她咯咯地笑了起来，[say: 那真是太棒了！]");
         outputText("[pg]你揽住尼芙的腰，把她拉近亲吻。你的舌头长驱直入探进她的嘴里，她几乎没有反抗。感觉与其说是在亲吻一张嘴，不如说是在亲吻一块冰块，尽管是一块柔软多肉的冰块。当你结束这个吻时，你的嘴唇因为寒冷而微微发麻。");
         outputText("[pg]尼芙躺在冰原上，诱人地张开双腿，但你并没有立刻直奔主题。相反，你从她的脖子开始，让嘴唇贴上她淡蓝色的肌肤。你温暖的双唇触碰到她冰冷结霜的肉体，竟然在你眼前升腾起阵阵水汽。你开始顺着她的身体往下亲吻，每一个吻都会升起一小团水汽，这让你觉得很有趣。你一路亲吻到一个[if (snowchild) {小小的}]乳头，并把它含进嘴里。感觉有点像冰块：坚硬、湿润、冰冷。");
         outputText("[pg]很快，你的嘴唇离开了乳头，再次向下游走。来到她的肚脐，你只蹭了一会儿，然后继续向下。你再次避开了直接进攻阴道，而是让嘴唇爱抚她[if (snowchild) {纤细的}]大腿，一路向下直到小腿。换到另一条腿，你从小腿一路向上亲吻到大腿，最后，你终于在结霜的小穴上印下一个吻。当你的嘴唇在她的下体游走时，尼芙咯咯地笑着，身子微微扭动。你很快找到了阴蒂，那是一个像钻石一样闪闪发光的冰冷小凸起，你开始舔舐、亲吻、揉搓它。");
         if(get_silly() && Utils.rand(2) == 0)
         {
            outputText("[pg]过了一会儿，你尴尬地停了下来。尼芙发出一半的呻吟，然后抬起头，低头看着埋在她胯下的你。一阵令人尴尬的漫长沉默后，终于被这个冰[if (snowchild) {萝莉|雪女人}]的声音打破了。[say: 你的舌头粘在我身上了，对吧。]");
            outputText("[pg]又是一阵沉默。你发出一声沉闷的[say: 是的，]尼芙叹了口气。");
            outputText("[pg]你花了将近一个小时才爬回营地，你手脚并用，舌头紧紧地粘在冰冷的阴蒂上。这有点像被拴着绳子遛，你觉得整个过程非常尴尬和屈辱，但也相当令人兴奋。在你们俩设法走到");
            if(get_camp().get_builtBarrel())
            {
               outputText("一个水桶");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,454) == 1)
               {
                  outputText("旁后，你的小海葵后代对你的困境咯咯地笑，最后舀了一些水倒在你爱人的阴户上");
               }
               else
               {
                  outputText("旁后，尼芙舀了一勺水倒在她的阴户上");
               }
            }
            else
            {
               outputText("溪流旁后，尼芙往她的私处泼了一些水");
            }
            outputText("，这才让你把舌头拔出来。");
            outputText("[pg]你们俩都彻底慌了神，尼芙回到了冬季乐园，而你则回去继续你的工作。");
            dynStats(DynStat.Lust(-5 - get_player().sens / 5));
         }
         else
         {
            outputText("[pg]当你用舌头攻击她的阴蒂时，尼芙发出[if (snowchild) {可爱的}]小声喘息和叹息。你不满足于此，一头扎进她那冰冷、[if (snowchild) {未发育的裂缝|湿滑的阴户}]中，舔舐着。");
            if(!get_player().hasLongTongue())
            {
               outputText("虽然没能深入，但还是让你那已经抓着周围的雪来支撑身体的元素奴隶发出了惊讶和愉悦的尖叫。");
            }
            else
            {
               outputText("当你把你那令人印象深刻的舌头伸进她体内时，她睁大了眼睛。她发出愉悦的咕哝声和尖叫声，双手抓着雪堆。");
            }
            outputText("这样过了一分钟后，你意识到你的舌头失去知觉了！把它缩回嘴里，你发现它很快就暖和过来了，然后你又开始舔了。");
            outputText("[pg]你不太愿意让你宝贵的舌头再次变得麻木，于是你把注意力集中在她的阴蒂和大腿内侧所有敏感的小点上。当你的嘴把她的注意力转移到别处时，你小心翼翼地将两根手指深深地埋入她冰冷的肉洞中。");
            outputText("[pg][say: 哦！]她惊呼道，猛地抬起头看向你。[say: 哦。操，真舒服，]她低头对你坏笑。手指和舌头的双重攻击让她在雪地里扭动，她本能地试图后退。你盯着她看了一秒钟，用空闲的手抓住她的臀部，用你最威严的声音命令她坐好。尼芙发出一声[say: 咪]并停止了扭动……至少有一分钟是这样。在那之后，她的手脚因为几乎无法抑制的快感而颤抖，但她尽力保持在原地。");
            outputText("[pg]正当你准备继续埋头苦干时，尼芙说，[say: 我……我受不了了！]她坐起身，把双腿环绕在你的脖子上，一个敏捷的动作，你发现自己仰面躺着");
            if(get_player().isTaur())
            {
               outputText("，或者说你的身体尽可能地接近仰面躺着，");
            }
            outputText("[if (snowchild) {一个小女孩|尼芙}]跨坐在你的脸上。[say: 嗯，这样好多了。现在你想舔我了，[Master]？那就……舔吧，]她低语着，把她冰冷的阴户压在你的脸上。");
            outputText("[pg]你试图抗议，但发出的只有沉闷的[say: 唔唔唔唔唔！]值得赞扬的是，尼芙看起来有点尴尬，但还是摇了摇头。[say: 这是我唯一能控制自己的方法。现在，除非你想一整天都被困在这里，[Master]，否则我建议你让那张嘴动起来。]");
            outputText("[pg]你不想在这场阴户雪崩下被埋得太久，于是你硬起心肠开始工作。尼芙自己也让这变得更加困难，她随着你的每一次舔舐而起伏，将她的阴户在你的脸上摩擦，同时发出颤抖的呻吟。你用双臂抓住她的大腿，让她在你吃她的时候尽可能保持静止。");
            outputText("[pg]谢天谢地，这并没有花太长时间。你首先注意到尼芙的腿绷紧了，然后她的背挺直了，她那结霜的阴户开始在你的舌头周围颤抖。她的摩擦变得越来越不规律，直到最后她受够了。她粉蓝色的双腿夹住你的头，紧紧地抱住你，而她的整个身体似乎都在痉挛。她弓起背，手指紧紧抓住你的头，揪着你的头发。她的嘴里发出一声不似人声、极度色情的彻底解脱的呻吟。奇怪的是，你觉得你听到[i:铃铛声]从她的喉咙里回荡，但很难分辨，因为你正深陷在元素阴户中。");
            outputText("[pg]最重要的是，与此同时，一股冰冷的淫液喷洒在你的脸上。你忍不住尝了一点，惊喜地发现它有强烈的薄荷味。你舔舐着汁液，直到尼芙终于向前倒下，彻底精疲力竭。你感激地深吸了一口气，闻到了空气中混合着淫液和留兰香的味道。");
            outputText("[pg]你站起身来，环顾四周。尼芙已经倒下，脸朝下趴在冰冷的粉雪中，地上有两个形状相当奇怪的雪天使。你微笑着擦去脸上的汁液，走回营地，留下尼芙慢慢恢复。");
            dynStats(DynStat.Lust(10 + get_player().lib / 10));
            if(get_player().get_lust() < 33)
            {
               dynStats(DynStat.Lust(33,DynStatOp.Eq),DynStat.NoScale);
            }
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function isMale() : Boolean
      {
         return saveContent.gender == 1;
      }
      
      public function isKid() : Boolean
      {
         return saveContent.age == 1;
      }
      
      public function iceGuardian() : Boolean
      {
         if(nieveFollower())
         {
            return saveContent.guardCamp;
         }
         return false;
      }
      
      public function get_stage() : int
      {
         return saveContent.stage;
      }
      
      public function get_debugName() : String
      {
         return "尼芙";
      }
      
      public function get_debugHint() : String
      {
         return "";
      }
      
      public function get_coalFound() : Boolean
      {
         return saveContent.coalFound;
      }
      
      public function fuckNieve() : void
      {
         var number:int;
         var _g:Player;
         var _loc5_:* = null as CockTypesEnum;
         clearOutput();
         var _loc1_:Number = isKid() ? 7 : 10;
         var _loc2_:Number = isKid() ? 1.5 : 2.5;
         var _loc3_:int = get_player().cockThatFits(_loc1_,"length");
         if(_loc3_ < 0 && get_player().getClitLength() < 3.5)
         {
            _loc3_ = get_player().smallestCockIndex();
         }
         _g = get_player();
         number = _loc3_;
         registerTag("cockclit",TagFun_Impl_.fromStringFun(function():String
         {
            return _g.cockClit(number);
         }));
         var _loc4_:Number = _loc3_ < 0 ? get_player().getClitLength() : get_player().cocks[_loc3_].cockLength;
         outputText("你上下打量着你赤裸、冰冷的[if (snowchild) {小|}]情人，脑海中浮现出所有你可以对她做的事情。当你欣赏她那雕塑般的身材时，她好奇地向你挑起一根白色的眉毛。一层薄薄的冰霜覆盖在她的肌肤上，让她淡蓝色的皮肤闪烁着微光。你发现自己对所有的可能性感到兴奋。当你思考时，你的[cockclit]挺立起来，你终于决定了要做什么。");
         outputText("[pg]首先你[if (!isnaked) {脱下衣服，把它们扔到一边，然后}]命令尼芙跪下。她立刻照做，不需要你告诉她该怎么做，她就凑上前，用一只手抓住了你的[cockclit]。和她身体的其他部分一样，尼芙[if (snowchild) {小小的}]手冰冷刺骨，虽然一开始感觉很奇怪，但一点也不痛或不舒服。[say:让我来，[Master]，]她说着，舔了舔你[cockclit]的顶端，发出一声湿润、冰冷的“哧溜”声，让你浑身一颤。");
         outputText("[pg]她没有浪费任何时间，把整个龟头含进嘴里，用熟练的技巧用舌头在周围打转。");
         if(_loc3_ >= 0)
         {
            if(_loc4_ < (isKid() ? 4 : 6))
            {
               outputText("[say:它太可爱了，[Master]，]尼芙一边喘气一边说，[say:就像一个玩具小鸡巴。]");
            }
            else if(_loc4_ >= (isKid() ? 14 : 24))
            {
               outputText("她几乎立刻就得喘口气，说道：[say:以胖子的胡子发誓，这东西太大了。你一定会让这个世界的其他人都嫉妒的。]");
            }
            else
            {
               outputText("[say:嗯]——她咂了咂嘴，深吸了一口气——[say:这真是一根完美的拐杖糖。让我们再尝一口。]");
            }
         }
         else if(_loc4_ < (isKid() ? 4 : 6))
         {
            outputText("[say:它太可爱了，[Master]，]尼芙一边喘气一边说，[say:就像一个玩具小鸡巴。]");
         }
         else if(_loc4_ >= (isKid() ? 14 : 24))
         {
            outputText("她几乎立刻就得喘口气，说道：[say:以胖子的胡子发誓，这东西太大了。你一定会让这个世界的其他人都嫉妒的。]");
         }
         else
         {
            outputText("[say:嗯]——她咂了咂嘴，深吸了一口气——[say:这真是一根完美的拐杖糖。让我们再尝一口。]");
         }
         outputText("说完，她又埋头吸吮你的[cockclit]。她的头上下摆动，感觉就像一块冰块在你的" + (_loc3_ < 0 ? "阴蒂" : "肉棒") + "上快速地上下滑动。");
         if(_loc3_ >= 0)
         {
            _loc5_ = get_player().cocks[_loc3_].get_cockType();
            if(_loc5_ == CockTypesEnum.ANEMONE)
            {
               outputText("每当你的一根蠕动的触手刺痛尼芙时，她都会咯咯地笑，似乎对它的效果免疫，并回吻它。不久之后，她吞下了你的整根肉棒，很高兴能感觉到你的肉棒在她的喉咙深处刺痛。");
            }
            else if(_loc5_ == CockTypesEnum.CAT)
            {
               outputText("虽然你肉棒上的倒刺不像你的[skinshort]那样敏感，但当尼芙的舌头扫过它们时，你还是会条件反射地颤抖。她似乎在一定程度上小心翼翼地不让自己被刺伤，但很快就意识到这根本不是问题。");
            }
            else if(_loc5_ == CockTypesEnum.DEMON)
            {
               outputText("你那紫色的恶魔肉棒跳动着、抽搐着，似乎对尼芙嘴里那不自然的寒冷免疫。尼芙似乎没有注意到它的本质，她在每一个结节上流着口水，给每一个隆起和凸起一个吻，而不仅仅是舔一下。");
            }
            else if(_loc5_ == CockTypesEnum.HORSE)
            {
               outputText("尼芙像邪教徒向神明祈祷一样，对你的马鸡巴爱不释手。她吸吮着、亲吻着，用舌尖沿着两侧一直舔到包皮，然后再从另一侧舔上来。");
            }
            else if(_loc5_ == CockTypesEnum.HUMAN)
            {
               outputText("你的肉棒似乎染上了一层淡淡的蓝色，不过你可以确定它并没有麻木。恰恰相反，当[if (snowchild) {小女孩|尼芙}]的嘴唇在上面滚动时，它似乎变得更加敏感了。");
            }
            else if(_loc5_ == CockTypesEnum.KANGAROO)
            {
               outputText("尼芙花了一点时间才发现你的肉棒不完全是人类的，当她弄明白时，她嘟囔着：[say:嗯，真奇怪……我以为袋鼠的蛋蛋长在肉棒上面，] 然后耸耸肩，继续埋头苦干。");
            }
            else if(_loc5_ == CockTypesEnum.LIZARD)
            {
               outputText("尼芙对你那布满鳞片和凸起的爬行动物肉棒大献殷勤，在上面上下吸吮亲吻。它似乎对尼芙嘴里刺骨的寒冷有更强的抵抗力，这很幸运，因为当她退开时，你那湿润冰冷的整根肉棒都暴露在了周围凛冽的寒风中。");
            }
            else if(_loc5_ == CockTypesEnum.TENTACLE)
            {
               outputText("尼芙似乎一点也不反感你的触手肉棒，事实上她承认，[say: 这让我想起了我来这里之前看过的一本漫画。]当她对你的肉棒献殷勤时，你确信你听到了她喘息时嘴里发出的[say: 哦，你这性感的触手怪……]的低语。");
            }
            else if(get_player().hasKnot(_loc3_))
            {
               outputText("尼芙盯着你肉棒上的肉结，仿佛那是一个挑战。她顺着你的柱身一点点往下，越来越近。");
               if(get_player().cocks[_loc3_].get_knotThickness() > _loc2_ * 2 || _loc4_ > _loc1_)
               {
                  outputText("不过最终，她还是认输了，回去继续伺候你的柱身，尽管她时不时地带着不小的怨气盯着那个肉结。");
               }
               else
               {
                  outputText("她花了好几分钟，但最终她还是顺着柱身往下，把整个肉结都含进了她[if (snowchild) {小小的}]嘴里。她得意洋洋地举起双手，发出一声[say:唔唔唔唔唔唔！]，然后退开换气，无意中把你湿润坚硬的肉棒暴露在凛冽的寒风中。");
               }
            }
            else
            {
               outputText("尼芙伺候着你变异的肉棒，花时间舔弄它每一个独特的小细节。");
            }
         }
         else
         {
            outputText("尼芙用鼻子蹭着你那拉长的阴蒂，对它大献殷勤，倾注了所有的注意力。[say:我不知道阴蒂能变得这么大，] 她的声音里充满了惊奇。[saystart]");
            if(_loc4_ < 5)
            {
               outputText("简直就像一根小肉棒");
            }
            else if(_loc4_ < 9)
            {
               outputText("简直就像一根肉棒");
            }
            else
            {
               outputText("我敢打赌，连男人都会嫉妒这个坏女孩");
            }
            outputText("。[sayend]");
         }
         outputText("[pg]最终你再也受不了了，身体紧绷起来。你的双腿僵直，[cockclit]颤抖着，背部微微弓起。尼芙注意到了这一点，就在高潮席卷你的身体时，她及时地含住了顶端。");
         if(_loc3_ >= 0)
         {
            outputText("你的[cockclit]颤抖着，将精液直接喷进了尼芙急切的嘴里，她大口大口地吞咽着，仿佛在直接对着水龙头喝水一样。");
         }
         outputText("[pg]当你从高潮的余韵中缓过来时，你低头看了一眼这个冰雪女人，");
         if(_loc3_ < 0)
         {
            outputText("她的脸上沾着一点女性的淫液");
         }
         else if(get_player().cumQ() <= 250)
         {
            outputText("她的下巴上滴落着一点精液");
         }
         else if(get_player().cumQ() <= 400)
         {
            outputText("她的嘴里源源不断地流出精液");
         }
         else if(get_player().cumQ() < 600)
         {
            outputText("她正拍着肚子，好像刚吃了一顿大餐");
         }
         else if(get_player().cumQ() < 1000)
         {
            outputText("她的肚子因为你灌进去的精液而显得有些鼓胀");
         }
         else
         {
            outputText("她的肚子相当大，就像孕妇一样，因为你灌进她喉咙里的精液实在太多了");
         }
         outputText("。你咧嘴一笑，告诉她还没完呢。那只是开胃菜。");
         outputText("[pg]随着你的一声令下，尼芙向后倒在闪闪发光的白雪中，张开双腿，露出她[if (snowchild) {淡蓝色的阴户|深蓝色的下体}]，尽管她的身体极度寒冷，但那里依然湿润光滑。你脸上泛起微笑，在她双腿间跪下，用你的[cockclit]头部摩擦她冰冷的洞穴。一阵寒意顺着它爬上你的脊背，但你没有理会。你挑逗着尼芙的阴户，轻弹她的阴蒂");
         if(_loc3_ >= 0)
         {
            outputText("用你的[cockclit]");
         }
         else
         {
            outputText("用你的");
         }
         outputText("，只是把前端滑进去，然后又拔出来。你一直这样做，直到你被雪困住的爱人咬着嘴唇，因为几乎无法抑制的快感而扭动着。");
         outputText("[pg]就在她张开嘴，准备求你停下来直接操她的时候，你把你的[cockclit]滑了进去");
         if(_loc4_ > _loc1_)
         {
            outputText("至少尽你所能地深入，");
         }
         outputText("伴随着一声湿润的“噗嗤”声。她嘴里说出的话变成了一声响亮的[say: 哦哦哦哦]，她的眼睛向上翻，头也紧跟着向后仰。她湿润的阴户紧紧地夹着你，给你一种奇怪的刺痛感。你火热的肉棒结合她冰冷的下体，竟然升起了一些蒸汽，你有些着迷地看着你每一次缓慢、温柔的抽插都会升起更多的蒸汽。");
         outputText("[pg]决定更进一步，你抓住尼芙的腿，把它们抬起来，让她的脚踝靠在你的肩膀上。你发出一声轻哼，把手往下移，抓住她现在高高翘起的紧实臀部，再次开始耕耘。");
         if(_loc3_ >= 0)
         {
            if(_loc4_ < (isKid() ? 4 : 6))
            {
               outputText("你那可怜的阴茎算不了什么，但在这种角度下，你成功地击中了所有正确的地方。很快，尼芙就开始扭动起来，眼睛盯着你，催促你越来越快。");
            }
            else if(_loc4_ < (isKid() ? 6 : 9))
            {
               outputText("在这个角度下，你成功地击中了所有正确的地方。很快，尼芙就开始扭动起来，紧闭双眼，低声说着你甚至听不清的下流话。");
            }
            else if(_loc4_ < _loc1_)
            {
               outputText("尼芙的阴户感觉就像一个冰冷的台钳，夹着你巨大的阴茎，但即便如此，你还是成功地击中了所有正确的地方。很快，她就开始扭动起来，紧闭双眼，大口喘气。");
            }
            else
            {
               outputText("虽然你不能把整个[cockclit]都塞进去，但你很惊讶[if (snowchild) {她小小的身体能承受这么多|她能承受这么多}]。很快，尼芙就开始扭动起来，眼睛微睁，在狂喜中咬着嘴唇。");
            }
         }
         else if(_loc4_ < (isKid() ? 4 : 6))
         {
            outputText("你那巨大的阴蒂依然算不了什么，但在这种角度下，你成功地击中了所有正确的地方。很快，尼芙就开始扭动起来，眼睛盯着你，催促你越来越快。");
         }
         else if(_loc4_ < (isKid() ? 6 : 9))
         {
            outputText("在这个角度下，你成功地击中了所有正确的地方。很快，尼芙就开始扭动起来，紧闭双眼，低声说着你甚至听不清的下流话。");
         }
         else if(_loc4_ < _loc1_)
         {
            outputText("尼芙的阴户感觉就像一个冰冷的台钳，夹着你巨大的阴蒂，但即便如此，你还是成功地击中了所有正确的地方。很快，她就开始扭动起来，紧闭双眼，大口喘气。");
         }
         else
         {
            outputText("虽然你不能把整个[cockclit]都塞进去，但你很惊讶[if (snowchild) {她小小的身体能承受这么多|她能承受这么多}]。很快，尼芙就开始扭动起来，眼睛微睁，在狂喜中咬着嘴唇。");
         }
         outputText("[pg]尼芙的身体在你身下紧绷，一声低沉的[say: 哦……是的！]从她唇间慵懒地溢出。她咬住深蓝色的嘴唇，强忍住更多的呻吟。她那本就紧致、冰冷刺骨的小穴将你夹得更紧，让你全身都忍不住颤抖起来。她的双臂伸向雪地，疯狂地抽搐着。与此同时，她的双腿似乎无法决定是该夹住你的脖子，还是向外张开。随着高潮席卷她的全身，你知道自己也坚持不了多久了。");
         outputText("[pg]她小穴里冰冷的寒意帮你延长了这不可避免的结局。你设法让尼芙至少又高潮了一次，让她四肢纠缠在一起，一只手抓着自己的头发，另一只手疯狂地埋在双腿之间。但随着最后一次挺进，你也被推向了顶峰，一股温暖的酥麻感传遍了你的全身。");
         if(_loc3_ < 0)
         {
            outputText("你的[clit]突然感觉一阵温热，就像里面的每一根神经末梢都着了火一样。它和你的身体一起隐隐作痛、跳动着，仿佛它是一根渴望射精的小鸡巴。");
         }
         else
         {
            outputText("你的[cockclit]因为渴望而隐隐作痛、跳动着，然后");
            if(get_player().cumQ() < 100)
            {
               outputText("将它微薄的奉献洒进了[if (snowchild) {孩子|冰精灵}]的子宫里");
            }
            else if(get_player().cumQ() < 250)
            {
               outputText("将一股股滚烫的精液射进[if (snowchild) {孩子|冰精灵}]饥渴的小穴里");
            }
            else if(get_player().cumQ() < 400)
            {
               outputText("用你的白浊涂满[if (snowchild) {孩子|冰精灵}]的内壁，直到有些开始流出来");
            }
            else if(get_player().cumQ() < 700)
            {
               outputText("珍珠白色的精液呈弧线射出，填满了[if (snowchild) {孩子|冰精灵}]的子宫，以至于她的肚子肉眼可见地鼓了起来");
            }
            else
            {
               outputText("在里面爆发，用你滚烫的精液将[if (snowchild) {孩子|冰精灵}]填得满满的，以至于她看起来明显像是怀孕了");
            }
            outputText("。");
         }
         outputText("[pg]你筋疲力尽地向后瘫倒，四仰八叉地躺在雪地里。你暂时不去管你的下半身，只是尽情享受着余韵，尽可能地喘着粗气。然而，尼芙似乎有别的想法。她从你身上离开，转过身，手脚并用地爬到你双腿之间。");
         outputText("[pg][say: 弄得好脏啊，[Master]，]她微笑着说道。[say: 让我来帮你清理干净吧。]她[if (snowchild) {小巧、}]冰凉的嘴唇凑到你的阴茎上，舔舐吮吸着你和她的汁液，将你清理得一尘不染。她似乎很享受这个味道，等她清理完毕，她凑过来给了你一个湿漉漉的深吻，尝起来更像是薄荷味。然后她依偎在你身边，她冰冷的身体不知为何让人感到很舒服，直到你恢复了足够的体力，才动身返回营地。");
         get_player().orgasm(_loc3_ < 0 ? "Vaginal" : "Dick");
         dynStats(DynStat.Sens(-2));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function fixNieveMouth(param1:int = 1) : void
      {
         if(param1 == 0)
         {
            saveContent.face = "gems";
         }
         else
         {
            saveContent.face = "coal";
         }
         fixNieve();
      }
      
      public function fixNieveGender(param1:int = 1) : void
      {
         saveContent.gender = param1;
         fixNieve();
      }
      
      public function fixNieveAge(param1:int = 0) : void
      {
         saveContent.age = param1;
         fixNieve();
      }
      
      public function fixNieve() : void
      {
         var arg5:int;
         var _g5:Nieve;
         var arg4:int;
         var _g4:Nieve;
         var arg3:int;
         var _g3:Nieve;
         var arg2:int;
         var _g2:Nieve;
         var arg1:int;
         var _g1:Nieve;
         var arg:int;
         var _g:Nieve;
         if(saveContent.gender <= 0)
         {
            clearOutput();
            outputText("(出了点问题，尼芙的属性没有设置。[b: 你希望尼芙是什么性别？])");
            menu();
            _g = this;
            arg = 1;
            addButton(0,"男性",function():void
            {
               _g.fixNieveGender(arg);
            });
            _g1 = this;
            arg1 = 2;
            addButton(1,"女性",function():void
            {
               _g1.fixNieveGender(arg1);
            });
            return;
         }
         if(saveContent.face == "")
         {
            clearOutput();
            outputText("(出错了，尼芙的属性未设置。[b: 尼芙的眼睛和嘴巴是用什么做的？])");
            menu();
            _g2 = this;
            arg2 = 0;
            addButton(0,"宝石",function():void
            {
               _g2.fixNieveMouth(arg2);
            });
            _g3 = this;
            arg3 = 1;
            addButton(1,"煤炭",function():void
            {
               _g3.fixNieveMouth(arg3);
            });
            return;
         }
         if(saveContent.age < 0)
         {
            clearOutput();
            outputText("(尼芙已经更新了年龄选项。[b: 你希望你的尼芙是成年人还是小孩？])");
            menu();
            _g4 = this;
            arg4 = 0;
            addButton(0,"成年人",function():void
            {
               _g4.fixNieveAge(arg4);
            });
            _g5 = this;
            arg5 = 1;
            addButton(1,"小孩",function():void
            {
               _g5.fixNieveAge(arg5);
            });
            return;
         }
         nieveReturnsPartII();
      }
      
      public function findACarrot() : void
      {
         clearOutput();
         outputText("当你在农场探索时，你遇到了几排绿色植物。走近一看，你认出了它们……胡萝卜！你从地里拔出一根。不出所料，它很脏，但呈亮橙色，而且足够直，可以作为你雪人的完美鼻子。");
         outputText("[pg]惠特尼路过，你问她能不能拿走胡萝卜。她只是耸了耸肩。[say:当然，亲爱的。反正我需要清理那片庄稼，腾出空间种更多的辣椒。]");
         outputText("[pg]你微笑着把胡萝卜收了起来。你的雪人有鼻子了！");
         outputText("[pg][b:(获得关键物品：胡萝卜)]");
         get_player().createKeyItem("Carrot",0,0,0,0);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function defloralNieve() : void
      {
         clearOutput();
         registerTag("analVirgin",TagFun_Impl_.fromBool(saveContent.analVirgin));
         outputText("尼芙微笑着，微微歪着头。[say:[Master]，]她轻声说道，看着你泛红的[skinshort]，[say:你需要一些陪伴吗？]");
         outputText("[pg]你确认你需要，对这个赤裸、忠诚的爱奴毫不保留。话虽如此，她确实提到过你是她的第一个[master]，所以她是否准备好失去她的童贞[if (analVirgin) {——她传统的童贞——| }]还有待观察。");
         outputText("[pg][say:我当然准备好了！为了我的[Master]，我什么都愿意做。]她的声音真诚而坚定。[say:让你感到特别，这是我的工作，而且……]她短暂地停顿了一下，靠近你，用她闪亮的[if (coaleyes) {黑色|紫色}]眼睛盯着你。[say:无论如何，对我来说，你不仅仅是一份工作。我很高兴知道我能把我的第一次给你。]");
         outputText("[pg]一抹红晕爬上她的脸颊，虽然微弱，但在她冰蓝色的皮肤上却清晰可见。她的手移动了一下，目光向下扫视，然后又回到了你身上。[say:这并不会让我感到害怕。我想和你一起学习。我想让你感觉舒服。]");
         outputText("[pg]当你靠在营地里她那舒适、白雪皑皑的住所里时，你的[hand]引导她进入你的怀抱。即使你能感觉到她目光中充满了温暖，她的身体感觉就像一阵清爽的微风一样凉爽。你抚摸着她背部的曲线，顺着她的臀部向下，她发出赞许的哼声，然后将她的嘴唇贴在你的嘴唇上。她本能地移向你的腹股沟，[if (isnakedlower) {用她冰冷的手指抚摸你的[if (hasCock) {[cocks]|肿胀的阴蒂}]|钻进你的[armor]，直到她冰冷的手指刷过你的[if (hasCock) {[cocks]|肿胀的阴蒂}]}]。这个[if (!snowchild) {冰精灵|雪孩子}]亲吻着你的[if (isTaur) {另一半|身体}]。");
         outputText("[pg][say:我应该是个天生的好手，]她保证道。[say:但请不要犹豫，告诉我你想要什么，[Master]。]");
         outputText("[pg]你的[if (hasCock) {[cocktype]|阴茎阴蒂}]跳动的脉搏可能本身就足以说明一切，但你还是指导了这位忠诚的雪仆。她的身体因期待而变得湿滑，当你引导她跨坐在你的臀部时，她那[if (!snowchild) {深|浅}]蓝色的性器官闪闪发光。当那润滑的冰冷露水接触到你的[if (hasCock) {阴茎|拉长的阴蒂}]时，你退缩了一下，但这并不是一种痛苦、刺骨的寒冷。它并没有让你麻木，反而让你变得更加敏感，敏锐地意识到她那[if (snowchild) {年轻的}]小穴在你阴茎顶端旋转的每一个小细节。尼芙是一个相当活泼的人，但她咬着嘴唇，在连接点上注视了很长一段时间。这是她第一次这样做，而且是和你在一起，这一定让她感到很紧张。当你[if (isTaur) {腿|[hand]}]触碰到她的臀部时，她震了一下，然后自嘲地咯咯笑了起来。她终于释放了她不知道自己拥有的紧张感，她沉了下去，当你的[if (hascock) {阴茎|工具}]填满她[if (silly) {非常酷的小穴|冰冷、湿润的小穴}]时，她喘息着。");
         outputText("[pg]她的眼睛闪烁着。她缓慢而颤抖地呼出一口气。[say:你在我体内好热，]她说。尼芙的眼睑闭上了片刻。[say:这感觉比我想象的还要不可思议。]她肌肉紧紧包裹着你的感觉让你们俩都发出了呻吟。[say:就像我们以一种特殊的方式连接在一起。]");
         outputText("[pg]你让她按照自己的节奏移动，臀部带着缓慢的惊奇摇摆着，她的肉壁以不确定的节奏收缩着。她的每一个动作都会带来喘息和咯咯的笑声，快感与发现的快感交织在一起。她的节奏开始加快；柔软摩擦产生的热量和她周围的寒气导致细细的蒸汽在你们结合的身体之间卷曲，而空气中充满了湿润的运动声和她那令人窒息的呻吟的安静音乐。");
         outputText("[pg][say:我希望——]她喘息着[say:——我是你想要的一切。]一个灿烂的笑容覆盖了她的脸。[say:因为你是我梦想中的一切，[Master]。]");
         outputText("[pg][if (isTaur) {她的双手紧紧抓住你前腿的[feet]|你的双手紧紧握住她的手}]，你凭着冲动猛地挺动腰身，差点让她摔倒。她那淡蓝色的大腿随着你又一次挺进她那欢迎你的深处，柔软地拍打着你[if (hasKnot) {那慢慢肿胀的肉结}]。你发情的体温将她冰冷的体液搅动成一片雾气，尼芙喘息着，她的内壁随着每一次绝望的研磨而收缩扭动。[say:[Master]，]她呻吟着，声音因渴望而沙哑。你更加急切地操弄着她。[say:我想完全属于你。]");
         outputText("[pg]高潮来得让她猝不及防。她身体僵硬，张开嘴发出一声带着哭腔的欢愉尖叫，身体紧紧锁住你。你敏感的[if (hasCock) {肉棒渗出先列腺液，你[if (isTaur) {用四条腿}]紧紧抱住她，一阵狂风暴雨般地抽插。[if (hasKnot) {逐渐充血的肉结在达到最大尺寸前就在里面弹了出来，将你们俩锁在一起|你[cocktype]的龟头一阵酥麻}]，深深埋在她紧致湿润的小穴里，伴随着一声轻柔的呻吟，你射进了她的体内，释放的灼热让她扭动着身体，发出满足的叹息。她的手指蜷缩在你的[if (isTaur) {[lowerbody.skinfurscales]|[skinfurscales]}]上，当[if (cummediumleast) {一股又一股的精液|每一次喷射}]深深击中她时，她的身体剧烈颤抖|阴蒂肉棒在紧紧夹住它的冰冷通道下颤抖、酸痛。这几乎让人感到痛苦，但尽管如此，它还是嗡嗡作响，让你的深处扭动起来。她的手指蜷缩在你的[if (isTaur) {[lowerbody.skinfurscales]|[skinfurscales]}]上，你快速地抽动着身体，在性高潮的极乐中喷射出来。}]");
         outputText("[pg]尼芙瘫倒在你身上，用冰冷的嘴唇亲吻着你的[if (isTaur) {另一半胸膛|脸颊}]。[say:谢谢你，[Master]，]她喃喃地说着，用鼻子蹭了蹭。[say:我喜欢这样。]");
         outputText("[pg]你躺在那里，被雪和性的气味包裹着，你的冰雪精灵满足地蜷缩在你的怀抱里。");
         saveContent.virgin = false;
         get_player().orgasm("DickVaginal");
         dynStats(DynStat.Sens(-2));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function debugMenu(param1:Boolean = true) : void
      {
         get_game().debugMenu.debugCompEdit(saveContent,new SaveContent(null,null,null,null,null,null,null,null,null,null,null,null,null));
      }
      
      public function approachNieve(param1:Boolean = false) : void
      {
         var _g1:Camp;
         var _g:Nieve;
         clearOutput();
         registerParserTags();
         if(param1)
         {
            outputText("你向尼芙挥了挥手，引起了[nhis]注意并呼唤[nhim]。这个冰雪精灵" + nieveMbFg("男人","男孩","女人","女孩") + (get_time().hours == 15 || get_time().hours == 18 ? "把[nhis]长矛放在一边，" : "") + "高兴地走了过来，面带微笑。[Nhe]不紧不慢地走着，让你有时间欣赏[nhis]赤裸的[if (snowchild) {小}]身体。");
            outputText("[pg]尼芙停下脚步，给了你一个友好的拥抱，然后问道，");
         }
         outputText("[say:我能为您做点什么，[Master]？]");
         menu();
         addButton(0,"外貌",nieveAppearance).hint("仔细看看这个冰雪精灵。");
         _g = this;
         addButton(1,"交谈",function():void
         {
            _g.nieveTalk();
         }).hint("和你的[snowman]聊聊天。");
         addButton(2,"性爱",nieveSexMenu).hint("和你冰冷的情人找点乐子。");
         if(saveContent.weaponTalked)
         {
            addButton(4,saveContent.guardCamp ? "停止守卫" : "守卫营地",nieveGuardToggle);
         }
         _g1 = get_camp();
         addButton(14,"返回",function():void
         {
            _g1.campLoversMenu();
         });
      }
      
      public function analNieve() : void
      {
         var _loc1_:Number = isKid() ? 4.5 : 6;
         var _loc2_:Number = isKid() ? 1 : 1.5;
         var _loc3_:Number = isKid() ? 6 : 8;
         var _loc4_:Number = isKid() ? 1.5 : 2.5;
         clearOutput();
         outputText("[if (cor>66) {你把这个冰冷的[if (snowchild) {孩子|精灵}]推倒|你把这个冰冷的[if (snowchild) {孩子|精灵}]拉近}]，表达了你对[nhis]柔软臀部的意图，[if (cor>66) {你蹲下身子，}]双手顺着[nhis]背部滑下，清楚地表明了你的愿望。这个冰冷的爱奴对你这种俏皮的直率[if (" + Std.string(isMale() && !isKid()) + ") {轻笑|咯咯笑}]起来。[say:作为我的[master]，你有权拥有我的每一部分，][nhe]说着，然后把[nhis]嘴唇贴在你的嘴唇上，给了你一个吻。在你嘴上那种冰凉的感觉几乎让你开始麻木，然后尼芙从你的[face]上移开，在你的下巴和脖子上印下更多冰冷的吻[if (!isnaked) {，同时[nhe]帮你脱下你的[armor]}]。");
         outputText("[pg][if (hasBreasts) {[Nhe]在你的[chest]周围流连，在柔软的乳房周围印下许多充满爱意的吻，最后在吸吮[nipple]时热情地捏了一把。}][say:我不会浪费你太多时间的，[Master]，别担心，]尼芙解释道，同时[nhe]在前往你的[if (multicock) {阴茎群的路上继续快速地亲吻。[say:我根本猜不到你打算用哪一根……如果你甚至只打算用一根的话。][Nhe]发出一声轻快、幸福的笑声，然后说，[say:那我最好把它们[if (cocks>2) {全部|两根}]都舔一遍！]|阴茎的路上继续快速地亲吻。[say:我很快就会把你的糖果手杖弄得又滑又准备好！]}]毫不迟疑，这个雪[if (snowchild) {孩子|奴}]勤奋地吸吮着你的[cocks]。");
         outputText("[pg]蓝色的舌头一开始在你的肉棒上引起一阵战栗，让你紧张起来，但[nhis]的天赋很快让你重新放松下来。[if (multicock) {[nhis]的大部分努力首先集中在根部，在它们之间来回取悦[if (cocks>2) {每一根|两根}]肉棒的根部，然后选择一根，用[nhis]的舌头顺着它[if (" + Std.string(get_player().longestCockLength() < _loc1_) + ") {微不足道的}]长度向上舔舐。没有哪一处肌肤长时间暴露在空气中；你的[if (snowchild) {小}]情人用[nhis]取悦你的真诚渴望，将它全部涂满唾液，直到最后含住你[cock smallest]|一开始[nhis]的努力仅限于舔舐外侧，这一壮举[if (cockthickness < " + _loc2_ + ") {主要包括用[nhis]的舌头在周围打圈|[if (cocklength >= " + _loc3_ + " && cockthickness >= " + _loc4_ + ") {如果[nhe]的节奏太随意，可能会让你那根巨大的肉棒有些干涸|包括用[nhis]的舌头描摹每一个小细节}]}][if (!istaur) {——同时一直渴望地抬头看着你}]。[Cock]现在已经足够湿润，尼芙通过将你的肉棒}][if (cocklength < " + _loc1_ + ") {完全含在[nhis]嘴里温柔地吸吮|吞入[nhis]喉咙}]来完成任务。在[nhe]退开之前，你能感觉到这个[if (snowchild) {年轻|充满爱意}]的" + nieveMbFg("男人","男孩","女人","女孩") + "的嘴唇正弯成一个微笑。");
         outputText("[pg][say:我的[if (snowchild) {屁股|小穴}]随您享用，[Master]。] [Nhe]转过身，四肢着地向你展示着[nhim]自己。此时的你早已欲火焚身，不需要任何邀请，你已经[if (istaur) {将前腿搭在[nhis]肩膀上|抓住了[nhis][if (" + Std.string(!isMale() && !isKid()) + ") {充满女人味的|纤细的}]臀部}]，而你的[cock]在[nhis][if (" + Std.string(!isMale() && !isKid()) + ") {柔软的|小巧却极具弹性的}]脸颊上跳动着。[if (istaur) {在尼芙的引导下，你|你}]将龟头抵在紧闭的洞口上，感觉到[nhim]因为湿润而颤抖。随着你的进入，这位爱奴颤抖着发出呻吟，在你深入时不断哆嗦。[if (cocklength >= " + _loc3_ + ") {[if (metric) {一厘米一厘米地|一英寸一英寸地}]，你不断推进，你的雪荡妇的喘息变得浅促而紧张，仿佛你正在把空气挤出为自己腾出空间。}]当你停下来时——你的肉棒完全埋入了冰冷的通道中，[nhim]发出了一声高亢的愉悦叹息。尽管[nhe]之前的口交非常彻底，但[nhis][if (snowchild && !ischild) {小巧的|紧致的}]屁股的紧握感让你无法自由移动。当你抽出时，肉壁会微微拉扯，而当你再次插入时，[nhis]肛门又会放松。那令人畏惧的寒冷本该让你难以保持勃起，但尼芙的寒意却有一种超凡脱俗的感觉，而且每次你插到底时[nhis]发出的欢快尖叫，即使在最致命的寒冬中，也足以让你保持兴奋。当你扭动[hips]再次插入时，你的爱人向后迎合你，急切地接纳着[cock][if (hasKnot) {，连同肉结一起}]。");
         outputText("[pg][say:求你了，[Master]，占有我吧。我是你的，] [nhe]乞求道。");
         outputText("[pg]你再度将肉棒抽出，这次猛力插回，引出一声呼喊。尼芙的上半身随着双臂的力竭而俯塌下去，但[nhis]微微分开双膝，继续将[nhis]的胯部顶向你，依然充满欲望与渴求。你更加猛烈地冲入那个[if (" + Std.string(isMale()) + ") {男孩|女孩}]，[if (multicock) {用[if (cocks>2) {另一根|第二根}]肉棒拍打着[nhis]的[if (" + Std.string(isMale()) + ") {肉棒，感受着它因先列腺液而湿滑|湿润的、迫切兴奋的[if (snowchild && silly) {小穴|阴户}]}]|毫无保留地使用[nhim]以耗尽你的欲望}]。你的腰腹酥麻收紧，[if (hasKnot) {随即是你的肉结开始膨胀，|[if (hasBalls) {[sack]收缩，}]}]突如其来的释放将[nhis]的深处喷涂上[if (cumQuantity < 100) {[if (silly) {两小滴精液|短促而轻盈的精液喷涌}]|[if (cumQuantity < 500) {数股精液|汹涌的积蓄之精，将[nhis]的腹腔灌满}]}]。那个温柔的冰灵瘫倒下来，爱抚地捧着[nhis]的肚子[if (hasKnot) {，你那完全膨胀的阴茎结将你们两人锁在一起}]。性欲得到满足，你与[nhim]一同倒下，相拥着直到[if (hasKnot) {你的肉棒终于能够弹出|你感到准备好继续你的[day]}]。");
         saveContent.analVirgin = false;
         get_player().orgasm("Dick");
         dynStats(DynStat.Sens(-2));
         doNext(get_camp().returnToCampUseOneHour);
      }
   }
}

