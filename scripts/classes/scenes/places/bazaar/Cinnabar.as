package classes.scenes.places.bazaar
{
   import classes.CoC;
   import classes.Cock;
   import classes.DynStat;
   import classes.Player;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.display.SpriteDb;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.scenes.Camp;
   import classes.scenes.places.Bazaar;
   import flash.Boot;
   import haxe.IMap;
   
   public class Cinnabar extends BazaarAbstractContent
   {
      
      public function Cinnabar()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
      }
      
      public function fuckCinnabarHugerAndCorruptedEr() : void
      {
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,216,1);
         var _loc1_:int = get_player().biggestCockIndex();
         clearOutput();
         spriteSelect(SpriteDb.get_s_cinnabar());
         outputText("你快到了，离高潮只有一步之遥，但这个饥渴的荡妇的阴户才刚刚尝到你巨大肉棒的滋味。她的紧致正在消耗你的耐力，如果你想把她劈开，你需要加快速度。你抓住她的大腿，无视她乱甩的尾巴，用力一拉，将她那被肉棒撑开的阴户顺着你的长度拽过来，力道大得让她的膝盖离开了床垫。朱砂因为这粗暴的插入而尖叫起来，她的双腿无力地痉挛着，而她的臀部被劈得大开，你那肉质的长矛完全且彻底地扭曲了她脆弱的身躯。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,216) > 0)
         {
            outputText("你又在这么做了——把她变成一个精液套子，完全不顾及她的快感，但你他妈的根本不在乎。你太饥渴了，而她太性感了，不蹂躏她简直暴殄天物。");
         }
         outputText("[pg]");
         outputText("这一挺将近两英尺的肉棒送进了这只被侵犯的害兽体内，你不打算停下来，直到把你所有" + Utils.num2Text(int(get_player().cocks[_loc1_].cockLength / 12)) + "英尺肿胀的肉棒都埋进她体内。与你的" + get_player().cockDescript(_loc1_) + "相比，朱砂感觉如此轻盈，几乎没有把它拖下来。你产生了一个邪恶的想法，向后倾斜，让你坚硬如铁的肉棒随你移动，将这只" + (get_noFur() ? "长着锈色头发的" : "锈红色的") + "老鼠完全从床上拉起，悬在半空中。没有东西可以抓住，也无法接触到地面，她的全部重量完全由她那不堪重负的肉壁的摩擦力支撑着，而且这婊子水这么多，她已经开始向下滑落，用她那无意中润滑得很好的操穴加速了她受重力驱动的侵犯。[pg]");
         outputText("[say:太、太快了……" + get_player().mf("主人","女主人") + "，太快了！请慢一点……求你了……嗯啊啊啊啊……该——啊——啊——啊——死的！]她抗议道。[pg]");
         outputText("她把你们拖上床之前，或许应该考虑一下后果。朱砂的臀部被撑得不可思议地宽，她的双腿退化成了无用的、退化的肢体，像她这样的精液套子根本不需要，而且她被你刺穿得越深，双腿分得越开。甚至她的臀瓣也适应了她的新姿势；它们分得如此之开，以至于她紧缩的菊穴将永远暴露在外。也许等你摧毁了她那大张的阴户之后，你可以给它同样的待遇。[pg]");
         outputText("这只老鼠——不，精液套子——变得更紧了，就在你注视的时候，她的乳房因为穿过她身体的坚硬柱体而隆起并颤动。与圆柱形、青筋暴起的凸起相比，它们看起来几乎微不足道，就像挂在呻吟着的" + (get_noFur() ? "" : "毛茸茸的") + "避孕套上的充满精液的泡泡。你不耐烦地抓住她的脚踝，用力一拉，将你的力量加入到重力无情的拉扯中。温暖、跳动的阴户肉紧紧包裹着你的");
         if(!get_player().hasSheath())
         {
            outputText("胯部");
         }
         else
         {
            outputText("包皮");
         }
         outputText("，从那粗暴、刺穿阴户的抽插中喷出汁液。你的" + get_player().cockDescript(_loc1_) + "的" + get_player().cockHead(_loc1_) + "可以在她的脖子正下方看到");
         if(get_player().cocks[_loc1_].cockLength >= 60)
         {
            outputText("，直到现在你才意识到你太长了，你应该已经完全穿透了她。她到底会什么样的魔法！？");
         }
         else
         {
            outputText("，直到现在你才意识到你早就冲破了她的子宫颈，那紧致的肉环紧紧地包裹着你的" + get_player().cockDescript(_loc1_) + "。");
         }
         outputText("[pg]");
         outputText("朱砂的头看起来小得荒谬，就这么栖息在她肿胀的肚子上方。她呻吟着，[say:他——他妈的混蛋！你弄得太——太快——啊——啊——了……]她的声音渐渐变小，眼睛眯了起来。不知怎么的，即使身体已经支离破碎，她还是设法恢复了理智，冲你大喊大叫。[pg]");
         outputText("[say:操你！你迫不及待地想进来，然后你就坐在那里傻笑？去你妈的。如果你不能好好填满我，我就让你填满！]这只红" + (get_noFur() ? "发" : "色") + "老鼠尖叫道。她原本就猩红的眼睛闪烁着诡异的光芒，她的手举了起来，散发着同样邪恶的力量。朱砂的手穿透了墙上的一面镜子，在极短的一瞬间消失了，然后狠狠地穿透了你的[asshole]的圆环。你尖叫起来，完全且彻底地被侵犯了，就像朱砂一样。");
         get_player().buttChange(30,true,true,false);
         outputText("[pg]");
         outputText("她把拳头扭进你体内，向上伸去，用手掌托住你前列腺那柔软的肿块，说道：[say:出来混总是要还的。]她的眼睛闪烁着光芒，魔法在你体内爆炸，穿过你的前列腺，钻进你的脑海。");
         if(get_player().get_inte() >= 50)
         {
            outputText("你隐约意识到这是一个催情法术，但你本来就已经处于崩溃边缘，你可怜的先列腺为了射精，简直快把自己榨干了。");
         }
         else
         {
            outputText("这对你完全被包裹的阴茎和被侵犯的后庭来说实在太过分了，你可怜的先列腺在试图释放时几乎把自己榨干了。");
         }
         outputText("半秒钟后，你的" + get_player().cockDescript(_loc1_) + "也加入了进来，你体内的肌肉紧绷痉挛着，将精液从你的身体里以巨大、粘稠的喷发喷射出来。[pg]");
         outputText("朱砂抽出她脏兮兮的" + (get_noFur() ? "手" : "爪子") + "，像一只叼着奶酪的老鼠一样咧嘴笑着，揉捏着她扭曲的脖子，而你则将[balls]里的每一滴精液都射进了她那被过度撑开、装满子宫的身体里。她吱吱叫着，[say: 平——平——平时我挺喜欢给像你这样的" + get_player().mf("种马","母狗") + "当一只喵喵叫的荡妇的，但如果你不尊重我这个肉便器，那我就得好好教训你一下了。]你呆呆地点了点头，仍然沉浸在让你");
         if(get_player().cumQ() < 250)
         {
            outputText("即使在你被榨干后，你的身体仍在翻腾。");
         }
         else if(get_player().cumQ() < 500)
         {
            outputText("导致她被极度撑开的阴唇泛起白沫。");
         }
         else if(get_player().cumQ() < 1000)
         {
            outputText("导致她的阴唇泛起白沫，肚子也胀了起来。");
         }
         else if(get_player().cumQ() < 1500)
         {
            outputText("让她看起来像怀孕了一样，并在你身上喷出一滩糖浆般的精液。");
         }
         else
         {
            outputText("让她看起来像一只怀了孕的性爱野兽，到处喷洒着精液。");
         }
         outputText("[pg]");
         outputText("这个现在占据主导地位的活体飞机杯高兴地尖叫着，在达到高潮时喋喋不休地说着半懂不懂的欢愉之词。[say:操——操……精液……好多精液……哦，天哪，是的……填满我坏掉的小穴！还要！给我更多！我想感觉到它——不，我想和它一起冒泡，成为它。我想被精液填满……是的！哦哦哦哦哦哦哦哦哦哦——吱吱吱吱吱吱吱吱！][pg]");
         outputText("你瘫倒在她身下，在她的魔法流经你的血管时仍在虚弱地抽搐。不知怎么的，你的[balls]还在抽搐，但那是一种痛苦、空虚的感觉，你只想让这一切结束。你呻吟着，几乎要哭出来了，而你那被虐待的肉棒正被高潮驱动的老鼠小穴收缩挤奶。这让你神志不清、头晕目眩，在经历了似乎永无止境的折磨后，你的大脑停止了运转，再也无法承受了。[pg]");
         outputText("<b>一段时间后……</b>[pg]");
         outputText("朱砂狠狠地扇了你一巴掌，把你从不自然的沉睡中唤醒。你抬头看着她，呆呆地眨了眨眼。她的嘴唇压在你的嘴唇上，用她激情的全部力量碾压着它们。这只啮齿动物柔软、有肉垫的手继续打你，扇你的脸，打你的耳朵，无力地拍打你的胸膛。然而，在整个殴打过程中，她都在用舌头舔你的嘴，在你的嘴唇上呻吟，并在你仍然巨大的肉棒上涂抹自己。最后，这只老鼠似乎满意了，她气喘吁吁地把你拉开，脸上带着困惑的假笑。[pg]");
         outputText("你坐了起来，多亏了你那虐待狂情人，你现在完全清醒了，她只是在对你假笑。[say:该死的，你这个大屌" + get_player().mf("种马","混蛋") + "。我**还是**很痛，但玛莱的奶子啊，你到底有没有让我高潮！别误会，这痛得像个婊子。我同情你遇到的那些不能像我一样伸展自己的女孩。我真的同情。如果你再对我做那种事，我会给你上另一堂同理心课——我希望你不要忘记这次。][pg]");
         outputText("朱砂扔给你你的[armor]，你意识到这只赤裸的老鼠没有表现出任何你们幽会的迹象");
         if(get_player().cumQ() >= 500)
         {
            outputText("，除了她怀孕般的肚子和");
         }
         else
         {
            outputText("，除了她");
         }
         outputText("巨大、微微分开的阴唇。无论如何，她很可能很快就会恢复正常。你穿好衣服转身离开，但在你离开之前，一条尾巴拍了拍你的肩膀，卷曲着挤压你的脖子。它让你停了下来，而那个妓女的声音低语道：[say:别等太久才回来。][pg]");
         outputText("一旦她放开你，你就离开了，你发现自己有一段时间在思考她关于同理心的话。");
         get_player().orgasm("Dick");
         dynStats(DynStat.Sens(3),DynStat.Cor(-2));
         get_player().takeDamage(25);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function cinnabarNonHugeDickings() : void
      {
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,213,FlagDict_Impl_.arrayReadInt(_loc1_,213) + 1);
         _loc1_ = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,215,FlagDict_Impl_.arrayReadInt(_loc1_,215) + 1);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,216,0);
         clearOutput();
         spriteSelect(SpriteDb.get_s_cinnabar());
         if(get_player().get_gems() < 50)
         {
            outputText("[say: 哦……很抱歉，但你没有足够的宝石来雇个伴儿，宝贝。你应该练习一下张开大腿，赚点真正的生活费，] 朱砂戏谑道。");
            doNext(get_bazaar().enterTheBazaar);
            return;
         }
         var _loc2_:Player = get_player();
         _loc2_.set_gems(_loc2_.get_gems() - 50);
         statScreenRefresh();
         outputText("一旦你同意，朱砂的" + (get_noFur() ? "手" : "爪子") + "就会探进你的[armor]，滑过你的[skindesc]，然后从你的宝石袋上方重新探出。她熟练地拿走她的报酬，然后像蛇一样缩回去，挠着你的肚子" + (get_noFur() ? "" : "，用她柔软、修剪整齐的皮毛") + "。你看看她，再看看自己，然后再看看她。她到底是怎么做到这么灵活的？朱砂咯咯地笑着，把她的尾巴卷在你的[legs]上，像一根长长的、灵活的绳子一样绕着。她抱住你，喃喃地说：[say: 我的[master]要把[his]这个发情的荡妇伴侣带到哪里去？] 她的舌头舔着你的耳朵，就像蛇在品尝猎物一样，虽然她的态度听起来顺从而软弱，但你这个饥渴的“伴侣”显然隐藏着火爆、好斗的一面。[pg]");
         outputText("还没等你回答，朱砂的手又伸进了你的[armor]，拉着你的[nipple]走向一辆没有标记的马车，那显然是她的家。你坏笑着，揉弄着她的双腿之间，隔着她现在已经湿透的裙子，感受着她那湿漉漉的小穴。在她继续挑逗你之前，你勾起一根手指，把她的裙子推进她饥渴的阴道里。像这样引导这个咯咯笑的鼠妓很容易，当你们走到门口时，她把尾巴滑进锁里，轻松地咔哒一声打开了门。[pg]");
         outputText("她以惊人的力量把你拖进去，一脚把门踢上。她匆忙地脱衣服，在紧身的裙子上挣扎了一下，你也顺势脱下衣服。你先脱完，正好注意到她停了下来，鼻子上有一块湿斑。她正在抽动鼻子，捏着乳头，自慰着，好像完全忘记了你。一只深红色的眼睛从撩起的裙缝里偷看，你意识到她在恳求你占便宜。[pg]");
         outputText("你满足了这个妓女的愿望，把湿透的裙子从她身上扯下来，用力捏她的乳头。她呻吟着把你拉上她的床，床因为突然增加的重量而发出嘎吱声。当你趴在她赤裸的身体上时，你意识到她床周围的墙上贴满了几十面球形镜子，全都反射着你们交缠在一起的裸体。你这个一小时的荡妇抓住你的头发，用力吻你，她那柔软如天鹅绒般的嘴唇强暴着你的嘴，燃烧着她情欲的火焰。她把你拉回来，呻吟道：[say: " + get_player().mf("主人","女主人") + "选得好。现在请捏住这个荡妇的乳头，她要为你表演。][pg]");
         outputText("你顺从地抓住她那两颗黑色、肿胀的乳头，用力扭转。她的心脏在胸腔里狂跳，跳动得如此剧烈，以至于你能透过她那被蹂躏得肿胀的乳房感觉到它的跳动。她扭动着身体，从你身下挣脱出来，但不知怎么的，她的乳头一直留在你的手指间。你有些恼火地捏了捏，更加用力地扭转那娇嫩的乳头，当你看到它们在压力下屈服并开始像开瓶器一样扭曲时，你露出了微笑。朱砂饥渴地呻吟着，现在四肢着地，将她那滴着淫液的阴户在身后的墙上摩擦，她的乳房在你的抓握下淫荡地摇晃着。[pg]");
         outputText("尽管很痛，朱砂还是快乐地娇喘着，她乞求道，[say: 求求你，[master]，看看那些镜子。你的荡妇正在努力表现得乖一点，但她真的太需要被填满了。] 你转过头去看，但为了以防万一，你还是紧紧抓住她那饱受折磨的乳房。令人惊讶的是，有两面镜子发生了变化。它们不再反射你自己的影像——它们显示出她那大张着、滴着淫液的阴户和抽搐着、黑皮肤的肛门。你甚至能闻到她身上野性的麝香，感觉到她那饥渴的生殖器散发出的热量如波浪般向你袭来。[pg]");
         outputText("你震惊得松开了手，呆呆地听着朱砂呻吟，[say: " + get_player().mf("主人","女主人") + " 满意吗？这个贱货知道怎么把传送门用在正途上。看着荡妇制造更多性感的传送门吧。] 果然如她所说，许多其他的镜子也发生了变化，显示出她的两对乳头");
         if(!get_player().hasVagina())
         {
            outputText("和你的[asshole]");
         }
         else
         {
            outputText("，你的[vagina]，和你的[asshole]");
         }
         outputText("就在几英寸之外。没有任何提示，你伸手穿过镜子去触摸她那因兴奋而肿胀的阴唇，将指尖滑入那饥渴的阴户，惊叹于它感觉起来有多大。你向前推进，将一根、两根、三根，最后四根手指埋入她饥渴的下体。[pg]");
         outputText("朱砂喘息着，[say: 呃……还要。塞满这个婊子的小穴，] 同时她将臀部在镜子上扭动，显然很享受这种关注。你向后拉以逗弄她，但这个饥渴的婊子呻吟着，伸手穿过另一个传送门去");
         if(get_player().hasVagina())
         {
            outputText("抓住你的[clit]，用她的拇指指腹在上面滚动，力道稍微有点大");
         }
         else
         {
            outputText("将两根手指滑入你的[asshole]，把它拉开到足以让你感到不适的程度");
         }
         outputText("。她想被插入？好吧。你握紧手指，向前推进。令人惊讶的是，你穿过了一层由女性淫液组成的薄纱，轻松地将整只手埋入了她的阴户。她那如丝般光滑的肉壁颤抖着、挤压着，像久别重逢的恋人一样抚摸着你的手。[pg]");
         outputText("对你展示的力量感到满意，她的手指");
         if(get_player().hasVagina())
         {
            outputText("松开了紧握的手指");
         }
         else
         {
            outputText("减轻了撑开肠道的压力");
         }
         outputText("并开始前后抽插，从内到外地爱抚着你。");
         if(get_player().hasVagina())
         {
            get_player().cuntChange(8,true,true,false);
         }
         else
         {
            get_player().buttChange(8,true,true,false);
         }
         if(get_player().hasCock() && !get_player().hasVagina())
         {
            outputText("不由自主地，[eachcock]开始变硬，每一次擦过前列腺都让它更加坚挺。");
         }
         else if(get_player().hasVagina())
         {
            outputText("淫液开始浸湿老鼠熟练的手指，用欲望的液体浸透了她的指腹。");
         }
         outputText("你向后摇晃，将你的[ass]撞在墙上，发出渴望的呻吟。她非常熟练，而且");
         if(get_player().hasVagina())
         {
            outputText("抚慰着你的甬道，以至于");
         }
         else
         {
            outputText("折腾着你的身体，以至于");
         }
         outputText("让你像发情的母狗一样喘息。她催促着你，几乎是在乞求，[say:是的！填满我的洞！用拳头干我，" + get_player().mf("主人","女主人") + "；用你的手撑开我，直到我松得连牛头人都满足不了！求求你……求求你……也用拳头干我的屁股。毁掉我的洞，[master]！弄坏性玩具的身体！][pg]");
         outputText("你耸了耸肩，借着插在她小穴里的拳头把自己撑起来，这让你的婊子发出一声痛苦的呻吟，同时你把另一只手插进她紧缩的屁眼里。她的膝盖深深地陷入垫子里，现在不仅支撑着她自己的重量，还支撑着你的重量，但朱砂加快的");
         if(get_player().vaginalCapacity() < 30)
         {
            outputText("手指");
         }
         else
         {
            outputText("手指——不，是拳头");
         }
         outputText("告诉你她有多喜欢这样。");
         if(get_player().hasVagina())
         {
            outputText("她甚至把");
            if(get_player().analCapacity() < 30)
            {
               outputText("她的手指");
            }
            else
            {
               outputText("她的拳头");
            }
            outputText("插进你的屁眼里，以同样的方式靠在你身上，通过这些通道将你们的身体锁在一起。");
         }
         if(get_player().hasCock() && !get_player().hasVagina())
         {
            outputText("当你感觉到她的另一只手包裹住你的[cock]，拉扯着它，直到它开始在床垫上漏出一串被挤出的男人粘液时，你喘息着呻吟起来。");
         }
         outputText("你变得越来越兴奋，越来越热，你加快了速度，前臂在朱砂淫荡地发出吧唧声的洞里像活塞一样进进出出。[pg]");
         outputText("她吱吱叫了一声，这是她整个晚上发出的第一个像啮齿动物一样的声音，你把这当作你的提示，更加残暴地操她，用猛烈、快速的抽插猛击她现在张开的洞。每次她似乎吞下了你更多的手臂，在几次特别暴力的猛击之后，你已经沉入这只老鼠体内直到手肘。从你跪着的地方，你可以看到她的肚子，它一点也没有膨胀。她到底能承受多少？[pg]");
         outputText("你继续前进，同时残暴地对待她的小穴和屁眼。每次你把拳头拉回来，肉都软绵绵地挂在上面，被拉伸得那么宽，她几乎注意不到它，但随后你又回到了她体内，用你的二头肌填满她，摩擦她的子宫颈。在附近，你发现了一面镜子，让你能完美地看到她的阴蒂，伴随着一个灵光一闪的动作，你俯下身去舔它。当你用舌头舔它时，她肉核光滑、坚硬的肉滑入你的嘴唇，随着朱砂迅速飙升的激情而生长。她又长又大声地吱吱叫着，把它拖成一声呻吟，而她被侵犯的小穴和张开的屁眼紧紧地包裹着你的手臂，挤压和榨取它们，就好像它们是巨大的阴茎一样。[pg]");
         outputText("这只老鼠的");
         if(get_player().hasVagina())
         {
            if(get_player().vaginalCapacity() < 30 && get_player().analCapacity() < 30)
            {
               outputText("手指");
            }
            else if(get_player().vaginalCapacity() >= 30 && get_player().analCapacity() >= 30)
            {
               outputText("拳头");
            }
            else
            {
               outputText("手指和拳头");
            }
         }
         else if(get_player().analCapacity() < 30)
         {
            outputText("手指");
         }
         else
         {
            outputText("紧握的手指");
         }
         outputText("更深地插入你体内，侵犯你的方式要温和得多，但仍然足以让你高潮。");
         if(get_player().hasCock() && !get_player().hasVagina())
         {
            outputText("她柔软的肉垫紧紧抓住你的[cock]，同时按压你的前列腺，以专业的技巧榨取你的精液。它没有像往常一样喷射出来，而是滴成一长串白色的液体链，在床上滴成一滩顺从的水洼。");
            if(get_player().cumQ() >= 250)
            {
               outputText("你的身体并不满足于此，继续喷射着，水流汇聚成洪流，浸透了床单");
               if(get_player().cumQ() >= 1000)
               {
                  outputText("并在地板上积成水洼");
               }
               outputText("。");
            }
         }
         if(get_player().hasVagina())
         {
            outputText("她舔舐着你的[clit]，你的" + get_player().vaginaDescript(0) + "在入侵的手指周围痉挛，让你颤抖呻吟。不甘落后的[asshole]也随之收缩紧闭，将鼠娘的");
            if(get_player().vaginalCapacity() < 30)
            {
               outputText("手指");
            }
            else
            {
               outputText("手");
            }
            outputText("紧紧绞在她饥渴的怀抱中。");
         }
         if(get_player().get_gender() == 0)
         {
            outputText("她柔软的肉垫恰到好处地摩擦着你的[asshole]，以专业的技巧引发了你的高潮。你闷哼着收缩，将她的手指绞在你饥渴的穴里，仿佛能从里面榨出精液一样。");
         }
         outputText("高潮十分强烈，当你们双双屈服于疲惫时，两双手脚从被蹂躏的孔口中滑落。你和朱砂倒在彼此身上，瘫倒在一滩淫液和汗湿的肢体中。");
         if(get_player().wetness() >= 3)
         {
            if(get_player().wetness() < 5)
            {
               outputText("她的手臂似乎被你的分泌物完全浸透了。");
            }
            else
            {
               outputText("她的手臂和胸前溅满了你爆炸般喷射出的淫水。");
            }
         }
         outputText("[pg]");
         outputText("朱砂恢复过来后，翻过身在你的脸颊上亲了一下。她的声音因为刚才大声的欢愉尖叫而有些沙哑，但她还是勉强低语道：[saystart]对于一个没有值得操的鸡巴的人来说，这感觉还不错。你可以慢慢喘口气，但我还得工作，所以别待太久。我得把床单洗干净");
         if(get_player().cumQ() >= 1000)
         {
            outputText("还要把地板拖干净");
         }
         outputText("才能接待下一个客人。[sayend][pg]");
         get_player().orgasm("Generic");
         dynStats(DynStat.Sens(-2));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function cinnabarMultiCockPortalFuckFest() : void
      {
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,213,FlagDict_Impl_.arrayReadInt(_loc1_,213) + 1);
         _loc1_ = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,215,FlagDict_Impl_.arrayReadInt(_loc1_,215) + 1);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,216,0);
         clearOutput();
         spriteSelect(SpriteDb.get_s_cinnabar());
         var _loc2_:int = get_player().biggestCockIndex();
         var _loc3_:int = get_player().biggestCockIndex2();
         var _loc4_:int = get_player().biggestCockIndex3();
         outputText("朱砂的手穿过你的[armor]，潜入你的内衣去挤压[eachcock]。");
         if(get_player().get_lust() >= 70)
         {
            outputText("当她感觉到手指间饱满、肿胀的肉团时，她呻吟了一声，当她那带肉垫的指尖被你滴落的先列腺液弄得湿滑时，她颤抖起来。");
         }
         else
         {
            outputText("当她感觉到你半硬的肉棒的大小和数量时，她幸福地叹了口气，用轻柔的压力挤压它们，直到它们开始膨胀，吞没她的手。");
         }
         outputText("你的[legs]因为在你的[cocks]上跳舞的娇柔抚摸而发软，让你难以站立。朱砂滑");
         if(get_player().get_tallness() >= 72)
         {
            outputText("在你的腋下");
         }
         else
         {
            outputText("紧贴着你");
         }
         outputText("，支撑着你，同时问道：[say:我们需要进去把这些解决掉吗，大[boy]？哦，那真是太糟糕了。我想我会在街上陪你玩，直到你准备好爆发，然后就这样把你留在这里，直到你软下来。然后我们可以重新开始。][pg]");
         outputText("红色的、充满笑意的眼睛注视着你的反应，当她戏弄你时，那残忍的、露出牙齿的笑容变得更宽了。你咕哝着推开她，站直身子，无意中展示了你那巨大的、多管齐下的凸起");
         if(get_player().get_lust() >= 70)
         {
            outputText("你有的");
         }
         else
         {
            outputText("她给你的");
         }
         outputText("。她是在戏弄你，但很明显她不是个施虐狂。不，她希望你来掌控局面，如果你想发泄，你就必须这么做。你把手伸进她的乳沟里，感受着那紧致、丝滑的拥抱" + (get_noFur() ? "" : "和她的皮毛") + "以及她温柔、砰砰的心跳。当你开始拉扯她，把她拖向马车时，她的心跳得更快了。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,213) == 0)
         {
            outputText("她倾斜着身子，引导你走向她的家，即使她任由你带领。");
         }
         else
         {
            outputText("她脸红得很厉害，当你把她拉向她的房子时，顺着大腿流下的液体让她的皮肤变暗了。");
         }
         outputText("[pg]");
         outputText("你把她拉到门前，发现坚固的橡木门被锁得很紧。朱砂开始在你周围滑动，但在她迈出第一步之前，你把她推到门上，把手伸进她的裙子下面，用手指抚摸她湿润的裂缝，同时你在她耳边低吼：[say:打开它，婊子。][pg]");
         outputText("这只啮齿动物的长尾巴在锁前盘旋，当你抚摸她可怜的小穴时，它不受控制地颤抖着。她把丰满的屁股在你的腹股沟上摩擦，每次你的凸起把她湿润的裙子压进她后门的褶皱时，她都会发抖。你在她耳边大笑，拉开她性器官肿胀、湿润的阴唇，用中指插入她，同时嘲笑她连门都打不开。一声轻柔的咔哒声打破了紧张的气氛，在这只老鼠扭动着挣脱之前，你把她推进入口，走进去，并在你身后砰地关上门。[pg]");
         outputText("朱砂已经开始挣扎着脱下她的深红色迷你裙，但当那块湿斑碰到她的鼻子时，你看到她的整个举止都变了。布料紧紧贴在她的鼻子上，被突然的吸气吸住了。这只老鼠向后靠在墙上，一只手伸进她的阴毛，同时她抓住她的裙子，把它抹在脸上。她的淫荡引发了你腹股沟的进一步变硬，提醒你你还塞在你的[armor]里。你尽快脱下它，把它扔到一边。[pg]");
         outputText("朱砂发出响亮、饥渴的鼻息声和吧唧声，你伸出手把她湿透的裙子从她头上扯下来。它很容易就滑落了，留下几缕淫液在中间的距离悬挂了几秒钟，然后它们落在她暴露的" + (get_noFur() ? "皮肤" : "皮毛") + "上。她抬头看着你，张着嘴，气喘吁吁地渴望着，她问道：[say:荡妇能闻到更多的小穴味吗？荡妇太饥渴了，她的洞需要用鸡巴塞住，她那疯狂的小脑袋才能运转。][pg]");
         outputText("你用你的" + get_player().cockDescript(_loc2_) + "拍打她的脸，把她的淫水抹在她的脸颊上，并混合了一点你的先列腺液。她呻吟着跳到她的床上，但在你拉近距离之前，她问道：[say:荡妇能向" + get_player().mf("master","mistress") + "展示她的把戏吗？她有这么多性感的把戏来帮助[master]操她那饥渴、疼痛的肉洞。][pg]");
         outputText("她用手颠着她丰满的乳房，粉红色的舌头在柔软的嘴唇上飞舞。你的眼睛锁定在她的胸部，敬畏地看着这只啮齿动物那巨大的球体随着每一次跳动而越来越多地抖动。它们起伏膨胀，把她适度的乳沟变成了一个巨大的峡谷，凸起的乳房从她太小的手臂上渗出，把她的躯干拖到它们上面。看起来她几乎是躺在一对柔软的豆袋椅上。她的屁股实际上悬在空中，来回扭动，把新鲜的淫水抹在床周围墙上的镜子上。[pg]");
         outputText("[say:" + get_player().mf("master","mistress") + "喜欢荡妇的第一个把戏吗？哦，是的，[he]喜欢！看看那些庞然大物在抽搐！嗯，我知道你会喜欢这个荡妇的下一个把戏，[master]，]她指着远墙上的几十面镜子说。你把你那被乳房迷住的眼睛从她起伏的乳房上移开，顺着她的手指看向那些反光的圆圈。它们闪烁了一下，突然图像和形状取代了倒影，从无数个方向展示了这只淫荡、性痴迷的老鼠。在腰部高度有大量集中的传送门，你意识到它们都是为了让你把你的[cocks]穿过去而放置的。[pg]");
         outputText("朱砂那肿胀、滴水的嘴唇紧紧压在中央的孔径上，凸出得刚好足以让淫液顺着框架流到地板上。就在上方是她起皱的屁眼和被汁液缠结的屁股蛋，几乎在向你眨眼。通过另一个，你可以看到她气喘吁吁、流口水的舌头和嘴唇。最后，所有其他齐裆高的镜子都排列成指向这个荡妇起伏的、异常巨大的肉袋。就在你看着的时候，她的唾液滴在它们弯曲、抖动的表面上，唾液的细流滚向垫子，而这只老鼠则让自己陷入了疯狂的渴望中。[pg]");
         outputText("[say:" + get_player().mf("master","mistress") + "喜欢吗？哦，操这个荡妇[master]……妈的，来操我！那个该死的丰胸法术让我的小穴疼痛，渴望一根又大又硬的鸡巴。塞住我，" + get_player().mf("stud","baby") + "，你能把我填得这么好！做吧！现在就操我！]她尖叫着，摇晃着，在传送门里摩擦，她的舌头狂野地抽打着，而她的嘴唇拱成一个饥渴的“o”形。[pg]");
         outputText("你的[hips]不由自主地向前摇晃。你的[cocks]不可能抗拒这样一个淫荡、饥渴的标本，或者同时以这么多不同的方式操她的机会。首先，你的" + get_player().cockDescript(_loc2_) + "撞上了她肿胀的小穴，当你强行进入那湿滑的入口时，她的身体用一股淫液奖励你，浸透了你的男子气概，滴在你的" + get_player().cockDescript(_loc3_) + "上。几分之一秒后，第二个阴茎压在她的肛门上，以一种暴力的、动物般的推力穿过紧闭的星形。[pg]");
         outputText("朱砂呻吟着，完全彻底地高兴，但你用你的" + get_player().cockDescript(_loc4_) + "刺穿她的喉咙，完全填满了她的口腔，从而压制了那些呻吟。你穿过一对与手臂齐高的传送门，挤压她张开的屁股蛋，紧紧抓住，同时向前推，把你那三个幸运的阴茎完全埋在" + (get_noFur() ? "温暖的" : "毛茸茸的") + "肉套里。");
         if(get_player().cockTotal() == 4)
         {
            outputText("额外的那根肉棒扎进柔软的双峰中，在滑入那温暖、诱人的乳沟之前，在乳房表面抹上了一层先列腺液。");
         }
         else if(get_player().cockTotal() > 4)
         {
            outputText("额外的肉棒扎进柔软的双峰中，在滑入那温暖、诱人的乳沟之前，在乳房表面抹上了一层先列腺液。");
         }
         outputText("[pg]");
         outputText("这种感觉简直妙不可言，但原始的欲望占据了上风。你开始前后摆动你的[hips]，对这个荡妇进行三重插入");
         if(get_player().cockTotal() >= 4)
         {
            outputText("同时你还用肉棒操着她肿胀的乳房");
         }
         outputText("。滑腻柔软的温暖包裹着你的" + get_player().cockDescript(_loc2_) + "，那毛茸茸的黑色爱之隧道每隔几秒钟就会微微收缩，愉悦地挤压着你。朱砂那颜色更深、紧致得令人发指的星状肛门被你的先列腺液润滑，随着你每一次有节奏的抽插，她的臀瓣在你手中完美地晃动着。");
         if(get_player().cockTotal() >= 4)
         {
            outputText("与此同时，老鼠胸前柔软的" + (get_noFur() ? "皮肤变得" : "绒毛开始贴在她的皮肤上，") + "沾满了你");
            if(get_player().cockTotal() == 4)
            {
               outputText("额外肉棒");
            }
            else
            {
               outputText("剩下的肉棒");
            }
            outputText("。");
         }
         outputText("她嘴里的" + get_player().cockDescript(_loc4_) + "感觉太爽了，几乎让你跳起来，长长的粉色舌头在它周围舔舐，而" + (get_noFur() ? "湿润的嘴唇埋进" : "湿润的口鼻埋进") + "你的胯部。天哪，这太刺激了！[pg]");
         outputText("你感觉到自己要高潮了，肠道里那种明显的温暖感混合着几次不由自主的肌肉收缩，让你的" + get_player().multiCockDescriptLight() + "在朱砂体内跳动。你转过头看着她，" + Utils.num2Text(get_player().cockTotal()) + "根阴茎从墙上的洞里抽插，彻底蹂躏着她的身体，她翻着白眼，完全沉浸在极乐之中。热量在你的[cocks]中绽放，同时将大量的精液泵入这个荡妇所有的洞里。她对着你的" + get_player().cockDescript(_loc4_) + "尖叫，震动让你的高潮更加强烈。这感觉持续不断，被像烤肉一样串起来的老鼠在被全方位占有时颤抖着");
         if(get_player().cockTotal() >= 4)
         {
            outputText("，她的乳房因为你倾泻在上面的精液而闪闪发光");
         }
         outputText("。[pg]");
         if(get_player().cumQ() >= 500 && get_player().cumQ() < 1000)
         {
            outputText("朱砂的肚子咕噜作响，她的肠道和子宫里塞满了精液，当你把精液排空在她体内时，她的肚子微微晃动。精液在她的嘴唇上起泡，她努力把它们都吞下去。这只是让她原本就令人印象深刻的肚子更大了。");
            if(get_player().cockTotal() >= 4)
            {
               outputText("这只老鼠的乳房完全变白了，精液像某种浓稠粘腻的牛奶一样从她的乳头滴落。");
            }
            outputText("你完成了用精液填满她的工作，并在原地停留了足够长的时间，以便从房间的另一边欣赏你的杰作。[pg]");
         }
         else if(get_player().cumQ() >= 1000)
         {
            outputText("朱砂的肚子咕噜作响，皮肤因为你泵入她子宫、肠道和肚子里的所有精液而紧绷。她看起来绝对像是怀孕了，甚至随着你留在她体内的每一次新鲜注入而开始晃动。老鼠的眼睛通过传送门抬头看着你。她的眼睑半垂，混合着欲望和快感，但你的目光向下移动，看着精液从她的鼻子里冒出泡泡，而她过度劳累的喉咙无法跟上你沉重的精液流。");
            if(get_player().cumQ() >= 1500)
            {
               outputText("最棒的是，她的床完全被这东西浸透了，她在里面打滚，就像猪在泥里一样，她的乳沟完全被精液浸透了。");
            }
            outputText("[pg]");
         }
         outputText("这个荡妇老鼠在你敏感的、射过精的肉棒周围烦躁地漱口，显然对你还在她体内感到不满。你从墙边退后，你的[legs]因为同时拔出你的[cocks]而产生的感官超载而瘫软，让你一屁股跌坐在你的" + get_player().assDescript() + "上。与此同时，朱砂开始咳嗽和呻吟，显然是因为这场单人[manboy]轮奸而筋疲力尽。你明白那种感觉；仅仅触摸[eachcock]就让你头晕目眩。[pg]");
         outputText("一阵不断的舔舐声传到你的耳朵里，引起了你的注意。你站起来，小心翼翼地护着你的[cocks]，同时看向床铺。传送门关闭了，朱砂弯着腰，像个柔术演员一样对折着");
         if(get_player().cumQ() >= 1000)
         {
            outputText("而她巨大、充满精液的肚子向两侧凸起");
         }
         outputText("。她长长的粉色舌头舔过她肿胀的黑色阴唇，饥渴地清理着肮脏的小穴，甚至舔舐着她的肛门。这几乎足以让你再次勃起，但她最终还是从自我口交中停下来，瞥了你一眼。[pg]");
         outputText("[say:你还在？走吧，在下一个客人来之前我还有很多清理工作要做！]朱砂咕哝着，然后继续她的工作。你用手穿过你的[hair]，感到有些恼火，但非常满足。你以后肯定还得再来找她。[pg]");
         outputText("当你穿衣服时，反复的吸吮和呻吟声停顿了一下，朱砂说道，[say:我不是故意要粗鲁的……那些鸡巴……那些美妙、丰满的肉棒……它们是恩赐。快点回来，" + get_player().mf("种马","宝贝") + "，你的奶油馅味道真好。]她继续舔自己，你走出去时忍不住露出了灿烂的笑容。");
         get_player().orgasm("Dick");
         dynStats(DynStat.Sens(-6));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function cinnabarHuger() : void
      {
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,216,0);
         var _loc1_:int = get_player().biggestCockIndex();
         clearOutput();
         spriteSelect(SpriteDb.get_s_cinnabar());
         outputText("你快到了，离高潮如此之近，但你还有那么多肉棒要埋在这个灵活、被撑开的小穴里，你决心在射精之前把你那大得不可思议的肉棒的每一寸都埋进她体内。照这个速度，你一整天都会在往里推，所以你决定加快速度。你抓住她的后腿，感觉你的手指陷入她丝滑的" + (get_noFur() ? "皮肤" : "皮毛") + "中，你把她往后拉，弯曲你的二头肌，用尽全力把她往下拉。她滑得很快，几秒钟内就吞下了一英尺的肉棒，快到让她的肚子以一种明显的肉棒形状凸出来。[pg]");
         outputText("你剩下的部分也沉了进去，穿过她那出奇柔软的子宫颈，侵犯了她子宫的最深处。它被推得太远了，以至于她看起来就像一个红润的肉棒套，两个弹跳的乳房挂在你的" + get_player().cockHead(_loc1_) + "上。令人难以置信的是，朱砂似乎并不介意她的身体被以不可能的方式拉伸，完全超出了理智的极限。相反，她开始喃喃自语，[say: 哦，是的，感觉我的子宫有多紧。你感觉不到我的子宫颈在夹紧吗，紧得就像一个你无法完全套到底的阴茎环？……哈哈哈哈，我坏掉了，不是吗？看着我，我是你的" + (get_noFur() ? "活体" : "毛茸茸的") + "避孕套。我的小穴完全坏掉了……我被撑得这么大，再也无法正常走路了，而且我——我可以通过我的肚子和子宫给你打飞机！][pg]");
         outputText("正如她所说，她开始隔着她的" + (get_noFur() ? "皮肤" : "皮毛") + "挤压你，用指尖拖着她那有弹性的小穴沿着你的长度按摩你的" + get_player().cockDescript(_loc1_) + "。这太刺激了，她的身体简直就是为你" + get_player().cockDescript(_loc1_) + "量身定做的，你感觉到体内热量在积聚。她的尾巴缠绕着你的");
         if(get_player().balls > 0)
         {
            outputText(get_player().ballsDescriptLight());
         }
         else
         {
            outputText("根部");
         }
         outputText("来戳你的[asshole]，滑进去推你的前列腺。她撞击的力度足以让你喷出精液，其力量足以扭曲她已经像气球一样膨胀的身体，你陷入了高潮的狂乱中，把你的" + get_player().cockDescript(_loc1_) + "拖回她的入口，然后把所有的");
         if(get_player().cocks[_loc1_].cockLength < 24)
         {
            outputText(Utils.num2Text(Math.round(get_player().cocks[_loc1_].cockLength)) + "英寸");
         }
         else
         {
            outputText(Utils.num2Text(Math.round(get_player().cocks[_loc1_].cockLength / 12)) + "英尺");
         }
         outputText("再次塞进去。");
         if(get_player().cocks[_loc1_].cockLength >= 60)
         {
            outputText("这根本不可能，但它正在发生，你高兴极了。");
         }
         outputText("[pg]");
         outputText("她的身体在蠕动，在完全彻底的肉棒支配下扭动。你把她的手从你的" + get_player().cockDescript(_loc1_) + "上推开，一边在她体内射精一边给自己打飞机，着迷地看着每一次喷射都让她的肚子鼓起来，然后伴随着湿润的晃动声消失在她体内。她那巨大、被拉伸的阴唇像筛子一样漏水，到处飞溅着淫液，而你的[balls]则");
         if(get_player().balls == 0)
         {
            outputText("");
         }
         outputText("用黏液填满她，占据了她那被毁坏的身体。朱砂在快乐的尖叫声中喘息和尖叫，[say: 操……操你的性玩具！塞满她的阴户……是的！荡妇被操得好惨……射吧，[master]，然后像丢弃坏掉的玩具一样把荡妇扔到一边。你毁了我，" + get_player().mf("主人","女主人") + "！][pg]");
         outputText("那些美妙、变态的话语像她那被撑得巨大的阴户和坏掉的身体一样有效地榨干了你的[balls]，但你继续抽插，直到你酸痛并完全被掏空。");
         if(get_player().cumQ() >= 500)
         {
            outputText("鼠娘因为所有的精液而获得了一个漂亮的");
            if(get_player().cumQ() < 1000)
            {
               outputText("精液肚。");
            }
            else if(get_player().cumQ() < 1500)
            {
               outputText("装满精液的肚子。");
            }
            else
            {
               outputText("精液孕肚。它在她身下晃荡，让她看起来像是要生了一样。");
            }
            outputText("");
         }
         outputText("朱砂瘫软下来，但由于被刺穿，她那近乎无意识的身体就像你的肉棒袜子一样挂在你身上。你改变姿势，轻轻地把她滑下来，当她被剥离时，她内部紧紧抓住你的感觉让你不寒而栗。[pg]");
         outputText("最后，你的" + get_player().cockHead(_loc1_) + "从她的小穴里弹了出来，展示了你对她的身体进行了多么彻底的改造。她的臀部被拉伸了将近一英尺宽，你可以看到她体内足够深的地方");
         if(get_player().cocks[_loc1_].cockLength >= 60)
         {
            outputText("它应该伸出她的头顶，但不知何故却没有。");
         }
         else
         {
            outputText("知道她一定有某种魔力才能在没有受到伤害的情况下承受这样的操弄。");
         }
         outputText("从她被蹂躏的子宫颈开始，朱砂的小穴慢慢开始变化，逐渐收缩，直到遮住了你视线中的子宫。整个通道在一个长长的动作中闭合，将淫液挤得满床都是，然后你听到她的臀部“砰”的一声恢复了原位。[pg]");
         outputText("[say: 怎么，你以为如果我不能时不时地承受一点扩张，我还会去猎捕像你这样的" + get_player().mf("种马","生育机器") + "来操吗？哦，别那样看着我——我会酸痛好几个小时，但我他妈的爱死它了。你的肉棒……它真他妈的特别，如果你还想体验一次全身被操透的感觉，就回来找我，]朱砂在床上微笑着对你说。[pg]");
         outputText("你微笑着回应，然后穿好衣服；早该去检查你的营地了。当你打开门时，你能听到朱砂开心地哼着歌，试图清理她床单上的所有污渍");
         if(get_player().cumQ() >= 1000)
         {
            outputText("，她肚子里晃荡的声音依然清晰可闻");
         }
         outputText("。");
         get_player().orgasm("Dick");
         dynStats(DynStat.Sens(-4));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function cinnabarHuge() : void
      {
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,216,0);
         var _loc1_:int = get_player().biggestCockIndex();
         clearOutput();
         spriteSelect(SpriteDb.get_s_cinnabar());
         outputText("你快到了，虽然你能感觉到你的" + get_player().cockDescript(_loc1_) + "下不断膨胀的热量，但你决心在射精前完全插进她体内。朱砂把她的" + (get_noFur() ? "脸" : "口鼻") + "挤过一面特别大的镜子，锁住你的嘴唇，把舌头更深地探进你的喉咙，随着你塞进她体内的每一寸紧绷的肉棒，她推得更用力。最后你插到底了，你的" + get_player().cockHead(_loc1_) + "撞到了她紧致的子宫颈环，而她的尾巴紧紧缠绕着你的");
         if(get_player().balls > 0)
         {
            outputText(get_player().ballsDescriptLight());
         }
         else if(get_player().hasSheath())
         {
            outputText("包皮");
         }
         else
         {
            outputText("根部");
         }
         outputText("。[pg]");
         outputText("亲吻突然中断，突然精神焕发的鼠娘的嘴唇紧贴着你的耳朵，她喃喃地说：[say: 哦，是的……感受一下我可怜的、被蹂躏的小穴有多紧……非常紧，像小了两号的泳衣一样紧紧抓住你……嗯，我能感觉到你在抽搐；你要射在这个荡妇的子宫里吗？你操得我这么狠，把我撑开，把我毁了……你会让我高潮吗？干吧，" + get_player().mf("种马","婊子") + "，把这个发情荡妇的子宫操满，把她标记为你的婊子——不，你他妈的财产！][pg]");
         outputText("天哪，她真他妈的变态，而且她把你夹得那么紧；操，连她的尾巴都在挑逗你。它扭动着缠绕你的");
         if(get_player().balls > 0)
         {
            outputText(get_player().ballsDescriptLight());
         }
         else if(get_player().hasSheath())
         {
            outputText("包皮");
         }
         else
         {
            outputText("肉棒");
         }
         outputText("去戳你的[asshole]，滑进去推你的前列腺，用力按压，让你射出一股精液，穿过老鼠放松的子宫颈，进入她的子宫。你陷入了高潮的狂热，用你巨大的、充满精液的肉棒完全、彻底地征服了这个尺寸控。当你粗暴地向后拉，把你的肉棒从那个过紧的天鹅绒般的小穴套里拖出来时，她的屁股摇晃着，但在你滑出之前，你又推了回去，用力操她，让你们的臀部撞击在一起，发出响亮的啪啪声。[pg]");
         outputText("她的淫液像雨点一样落下，浸透了床单，");
         if(get_player().balls > 0)
         {
            outputText("你的蛋蛋，");
         }
         outputText("你的[legs]，以及");
         if(!get_player().hasSheath())
         {
            outputText("你抽搐的肉棒根部");
         }
         else
         {
            outputText("你抽搐的包皮");
         }
         outputText("。你把手放在她的肚子上摩擦，隔着她那被肉棒撑得鼓鼓的" + (get_noFur() ? "皮肤" : "皮毛") + "感受着你的" + get_player().cockHead(_loc1_) + "。每一股火热、喷涌的精液都在鼠娘的" + (get_noFur() ? "皮肤" : "皮毛") + "下沸腾，在你的指间冒泡，并在她的子宫里晃荡。朱砂在挣扎、尖叫和哭泣，不过很明显，她的眼泪是喜悦的泪水。她喘着气，[saystart]好大");
         if(get_player().cumQ() >= 1000)
         {
            outputText("而且好多");
         }
         outputText("……是的！占有我！我是你的……你那对鸡巴上瘾的、被撑开的性玩具！还要……还要！[sayend][pg]");
         outputText("你毫无保留，粗暴地操着她，隔着她被撑开的皮肤给自己手淫，直到你的");
         if(get_player().balls == 0)
         {
            outputText("前列腺被榨干。");
         }
         else
         {
            outputText("[balls]感到酸痛空虚，被彻底榨干了。");
         }
         if(get_player().cumQ() > 500)
         {
            outputText("这只鼠娘获得了一个不错的，");
            if(get_player().cumQ() < 1000)
            {
               outputText("晃动的精液肚。");
            }
            else if(get_player().cumQ() < 1500)
            {
               outputText("装满精液的肚子。");
            }
            else
            {
               outputText("精液孕肚。它在她身下晃荡，让她看起来像是要生了一样。");
            }
         }
         outputText("朱砂瘫倒在沾满爱液的床单上，当她开始滑向枕头时，她的" + (get_noFur() ? "光滑皮肤变成了一团被精液浸透的" : "丝滑皮毛变成了一团被精液打结的") + "乱麻。你抓住她的后腿，减缓她下滑的速度，当你感觉到那条被蹂躏的肉洞因为不由自主的快感收缩而颤抖和蠕动时，你幸福地叹了口气。[pg]");
         outputText("鼠娘那黑色、被蹂躏的阴唇终于从你的" + get_player().cockHead(_loc1_) + "上弹开，你第一次有机会观察你的杰作。你可以看到她的深处，一直到她仍在颤抖、漏着精液的子宫颈。朱砂做梦般地咕哝和叹息着，你敬畏地看着所有的损伤，那粗暴、猛烈的操弄痕迹，开始消失。从她的深处开始，肉壁开始闭合，像波浪一样向她的入口移动。这起伏、收紧的动作到达了她的阴唇，它们折叠闭合，恢复了原来的样子，除了鼠娘仍在漏出的厚厚一层精液和爱液。[pg]");
         outputText("朱砂回头看着你，说道，[say: 怎么，你以为如果我真的受不了，还会接像你这样的" + get_player().mf("种马","生育者") + "吗？别担心，宝贝……我爱死它了。只要你还这么大，随时都可以来撑开我！] 你笑了笑——真是一场痛快的性爱——然后去穿衣服；你早该去检查你的营地了。当你离开时，你能听到朱砂开心地哼着歌，试图清理床单");
         if(get_player().cumQ() > 500)
         {
            outputText("，她肚子里晃荡的声音依然清晰可闻");
         }
         outputText("。");
         get_player().orgasm("Dick");
         dynStats(DynStat.Sens(-3));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function cinnabarGreeting() : void
      {
         var _loc1_:* = null as IMap;
         clearOutput();
         spriteSelect(SpriteDb.get_s_cinnabar());
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,214) == 0)
         {
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,214,FlagDict_Impl_.arrayReadInt(_loc1_,214) + 1);
            if(!get_player().hasCock())
            {
               outputText("你走向那个鼠人，当你靠近时，她双手叉腰，用她那双血红色的眼睛打量着你。她舔了舔嘴唇，走到你身边，抚摸着你的身体，提议道：[say: 50颗宝石一小时。只要这么多，朱砂就是你的伴侣了……]她的声音逐渐变成沙哑的颤音，等待着你的回应。[pg]");
               menu();
               addButton(0,"买一小时",cinnabarNonHugeDickings);
               addButton(14,"离开",get_bazaar().enterTheBazaar);
            }
            else if(get_player().biggestCockArea() < 100)
            {
               outputText("你走向那个鼠人，当你靠近时，她双手叉腰，用她那双血红色的眼睛打量着你。她走到你身边，抚摸着你的身体，直到她摸到你的凸起。她的手停在原处，舔了舔她那黑色、有光泽的嘴唇，咯咯地笑着：[say: 我看你还有个小男孩的鸡巴，嗯？好吧，50颗宝石就能买我一小时的时间。只要这么多，朱砂就是你的伴侣了……]这个荡妇鼠娘的声音逐渐变成沙哑的颤音，等待着你的回应。");
               menu();
               addButton(0,"买1小时",cinnabarNonHugeDickings);
               addButton(14,"离开",get_bazaar().enterTheBazaar);
            }
            else
            {
               outputText("你走向这个鼠人，当你靠近时，她双手叉腰，用她那双血红色的眼睛打量着你。她凑到你身边，抚摸着你的身体，当她的手指划过你胯下那巨大、圆润的凸起时，发出了愉悦的哼声。这只荡妇老鼠娇嗔道：[saystart]你那里有这么大……这么热的一根肉棒。你让我流水了，" + get_player().mf("猛男","宝贝") + "。通常我会收些宝石，但去他的——我想要");
               if(get_player().cockTotal() > 1 && get_player().biggestCockArea2() >= 75)
               {
                  outputText("那些东西");
               }
               else
               {
                  outputText("那个东西");
               }
               outputText("插进我里面……我叫朱砂，但我更希望你插进我，然后随便你怎么叫我。[sayend] 她的声音渐渐低沉，变成一种沙哑、几乎听不见的震颤，等待着你的回应。");
               menu();
               addButton(0,"操她",cinnabarGetsFUKKKKED);
               if(get_player().cockTotal() > 2 && get_player().biggestCockArea2() >= 75)
               {
                  addButton(1,"多重操",cinnabarMultiCockPortalFuckFest);
               }
               else
               {
                  addButtonDisabled(1,"多重操");
               }
               addButton(14,"离开",get_bazaar().enterTheBazaar);
            }
         }
         else if(!get_player().hasCock())
         {
            outputText("你走向朱砂，当你靠近时，她双手叉腰，用她那双血红色的眼睛打量着你。她舔了舔嘴唇，凑到你身边，抚摸着你的身体，提议道：[say: 50颗宝石一小时。这就是找个伴儿的全部代价……] 在等待你的回应时，她的声音渐渐变成沙哑的颤音。[pg]");
            menu();
            addButton(0,"买1小时",cinnabarNonHugeDickings);
            addButton(14,"离开",get_bazaar().enterTheBazaar);
         }
         else if(get_player().biggestCockArea() < 100)
         {
            outputText("你走向朱砂，当你靠近时，她双手叉腰，用她那双血红色的眼睛打量着你。她凑到你身边，抚摸着你的身体，直到摸到你胯下的凸起。她的手停在原处，舔了舔她那黑色、有光泽的嘴唇，咯咯地笑着：[say: 看来你还带着个小男孩，嗯？好吧，50颗宝石就能买我一小时的时间。这就是找个非常熟练的伴儿的全部代价……] 这个荡妇鼠娘的声音渐渐变成沙哑的颤音，等待着你的回应。");
            menu();
            addButton(0,"买1小时",cinnabarNonHugeDickings);
            addButton(14,"离开",get_bazaar().enterTheBazaar);
         }
         else
         {
            outputText("你走向这个鼠人，当你靠近时，她双手叉腰，用她那双血红色的眼睛打量着你。她凑到你身边，抚摸着你的身体，当她的手指划过你胯下那巨大、圆润的凸起时，发出了愉悦的哼声。这只荡妇老鼠娇嗔道：[saystart]你那里有这么大……这么热的一根肉棒。你让我流水了，" + get_player().mf("猛男","宝贝") + "。通常我会收些宝石，但去他的——我想要");
            if(get_player().cockTotal() > 2 && get_player().biggestCockArea2() >= 75)
            {
               outputText("那些东西");
            }
            else
            {
               outputText("那个东西");
            }
            outputText("插进我里面……我们可以坐在这里聊天，但我更希望你塞满我，叫我你的荡妇。[sayend] 在等待你的回应时，她的声音渐渐变成沙哑、几乎听不见的颤音。");
            menu();
            addButton(0,"操她",cinnabarGetsFUKKKKED);
            if(get_player().cockTotal() > 2 && get_player().biggestCockArea2() >= 75)
            {
               addButton(1,"多重操",cinnabarMultiCockPortalFuckFest);
            }
            else
            {
               addButtonDisabled(1,"多重操");
            }
            addButton(14,"离开",get_bazaar().enterTheBazaar);
         }
      }
      
      public function cinnabarGetsFUKKKKED() : void
      {
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,213,FlagDict_Impl_.arrayReadInt(_loc1_,213) + 1);
         _loc1_ = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,215,FlagDict_Impl_.arrayReadInt(_loc1_,215) + 1);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,216,0);
         clearOutput();
         var _loc2_:int = get_player().biggestCockIndex();
         spriteSelect(SpriteDb.get_s_cinnabar());
         outputText("你一同意，朱砂的手就飞快地穿过你的" + Utils.cnName(get_player().get_armorName()) + "，抓住你的" + get_player().cockDescript(_loc2_) + "，用她柔软的肉垫揉捏着这根粗壮的肉棒。她开心地咕哝着，咧嘴笑得露出了牙齿，你的鸡巴在她的手掌中充血膨胀，渐渐撑开了她的手指。肿胀勃发的肉块几乎痛苦地摩擦着你的[armor]，直到她停下来。朱砂赞赏地舔了舔嘴唇，知道你甚至还没有完全硬起来。[pg]");
         outputText("虽然你的[legs]已经发软，装备也变得紧绷，但你还是站了起来，笔直得像根栅栏柱，把这个荡妇的手臂从你的装备上拉开。朱砂不满地咕哝了一声，但你抓住她的裙子，把她转进你的怀里，让你的凸起顶住她的后背，双手托住她沉甸甸的乳房。她的乳头已经硬挺准备就绪，足有你的指尖那么大，你毫不犹豫地握住了那肿胀的蓓蕾。这骚货不满的咕哝声变成了大声的尖叫，然后渐渐变成了低沉、急切的呻吟。[pg]");
         outputText("[saystart]求你了，把我按弯腰操我；把那根粗鸡巴塞进我多汁的小穴里。塞满我，干我，就在大家面前操我！");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,216) > 0)
         {
            outputText("只是要比上次温柔点，好吗，" + get_player().mf("猛男","宝贝") + "？");
         }
         outputText("[sayend] 朱砂大叫着，但你们的小小遭遇引来的目光警告你，在公开场合继续下去是个非常糟糕的主意。你捏住朱砂的一颗硬挺的乳头，咬了她一口，想让她停止喋喋不休，但这只会让她叫得更大声。你对着她的耳朵低吼，告诉这个发情的婊子，如果她想让你的鸡巴插进她体内，最好做个乖宠物，给你找个私密的地方。[pg]");
         outputText("这只急切的啮齿动物转过身，把乳头从你的手指中抽出来，在你的嘴唇上印下了一个沉重、湿润的吻，力道大得让你向后退了");
         if(get_player().get_str() >= 60 || get_player().get_tallness() >= 72)
         {
            outputText("稍微");
         }
         else
         {
            outputText("向后退去");
         }
         outputText("。你摇晃着，被这热情的唇舌交缠弄得晕头转向，然后你被拖过人群，来到一辆色彩鲜艳的马车前。厚重的门显然锁着，但那条灵巧的鼠尾在你鼻子前抬起，像弄蛇人的毒蛇一样扭动着。它拂过你的脸颊，然后以发情种马般的热情插入了空荡荡的钥匙孔。一声清晰的*咔哒*声显示了朱砂对尾巴的控制力有多么精妙，但就在你思考这个问题时，你被柔软而坚定的拉扯力拖进了门内。[pg]");
         outputText("在你身后的门关上之前，灵活而坚定的指尖已经深深埋入你的胯部。朱砂的眼睛死死盯着你[legs]之间那巨大、像帐篷一样隆起的鼓包，她柔软的指腹在试图释放你时微微颤抖。你很感激她的努力，但她刚才差点让你在外面惹上麻烦。她需要冷静下来，或者至少更顾及一下你的意愿。你把她的手臂从你那弹跳着、刚刚获得自由的" + get_player().cockDescript(_loc2_) + "上猛拉开，在与朱砂的欲望搏斗时，你因快感而呻吟。[pg]");
         outputText("这只老鼠扭动着、踢打着，但你躲开了每一次恶毒的攻击。她咆哮着，[say:你长着那么大的一根鸡巴，却不让我抱抱它？说真的，你到底是个什么东西，一个害怕逼的怪胎？我以为你会是个很棒的操手，但如果你这么害怕女人的小穴，也许我应该去找个" + get_player().mf("真正的男人","马扶他") + "同居！]她嘴巴很厉害，但她需要被挫挫锐气。你扫倒她的双腿，用力一推，把她重重地摔在床上，冲击力大得让她的奶子都跟着颤抖。[pg]");
         outputText("朱砂微笑着张开双腿，掀起裙摆，一根手指挑逗着她的阴蒂。她娇嗔道，[say:嗯嗯嗯，这么强势，但我不太确定你懂不懂怎么用那头野兽。你的鸡巴在跳动，硬得像石头一样，而我这湿润、火热的洞正求着你插进来。可你却站在那里，看着我试图从这件紧身性感的裙子里扭出来。]为了强调她的观点，她拉开拉链，开始扭动身体，像蛇蜕皮一样脱下裙子。你跟着她爬上床，当你看到周围墙上挂着的数百面镜子时，你笑了。[pg]");
         outputText("这只啮齿动物顺着你的目光看去，双臂环住你的脖子。她低语道，[say:我那又大又硬的" + get_player().mf("种马","母狗") + "现在想操了吗？]你点点头，向前摇晃，将你那肿胀的" + get_player().cockDescript(_loc2_) + "的" + get_player().cockHead(_loc2_) + "压在她滴水的阴户上，但虽然她的阴唇有所退让，你却无法完全突破她那湿滑的入口。朱砂因这半途而废的插入而闷哼一声，以猫的优雅和柔术演员的柔韧性向后退去，在一个流畅的动作中从你身下舒展开来。她亲吻你的鼻子，将她曲线优美的臀部向后压在墙上，同时她的尾巴绕过肩膀揉乱你的头发。[pg]");
         outputText("[saystart]这个发情的荡妇已经很久没有遇到过大到塞不进她小穴的鸡巴了，但我们要让那个混蛋塞进我体内。你要把我劈开，用力到让");
         if(get_player().cockArea(_loc2_) < 200)
         {
            outputText("半人马母马退缩");
         }
         else
         {
            outputText("母龙哭泣");
         }
         outputText("！看看镜子；去吧，看看，[sayend]她指示道。[pg]");
         outputText("果然，当你看着镜子时，你得到了一个惊喜。在那里，朱砂那滴着水、湿润的小穴展露无遗。她靠近大腿的阴唇呈红褐色，但越靠近裂口，颜色就越黑。你注意到她的外阴和阴唇微微分开，也许是因为你之前尝试插入，而她那闪亮的黑色爱之隧道似乎在召唤你的注意。[say:嗯嗯，看看我为你湿成了什么样，" + get_player().mf("种马","荡妇") + "……我真是个坏女孩——看看我这可怜的小穴。为什么[master]不惩罚它？]她问道，向后压得足够用力，让她的生殖器在镜子边缘凸起。[pg]");
         outputText("你微笑着握紧拳头，");
         if(get_player().cor > 66)
         {
            outputText("享受着这种行为的淫荡");
         }
         else if(get_player().cor > 33)
         {
            outputText("有点担心自己有多享受这个");
         }
         else
         {
            outputText("有点惊讶自己竟然会做这种事");
         }
         outputText("，然后向前推，穿过丝滑的裂口进入她的阴道。她的汁液让你顺畅地滑入，喷射并滴落在她的外阴上，就像你刚咬了一口的新鲜水果。你俯身舔舐清澈、黏滑的水滴，感觉你的手臂随着每一次品尝都更深地陷入那柔软的虎钳中。它已经没入到手肘，而朱砂正开心地吱吱叫着，没有一丝不适。[pg]");
         outputText("她的隧道紧紧挤压，按摩着你的前臂，仿佛那是某只巨大野兽的阴茎，但你向后拉，拔出你的手臂，伴随着一股喷涌而出的淫液。朱砂呻吟着，[say:哦，宝贝，你把我填得太满了。看看我为你弄得多乱！哦，你现在要操我了吗？你把我撑开了，但我不知道我够不够大……去他妈的！像劈柴一样劈开我，宝贝！][pg]");
         outputText("好像你还需要任何鼓励似的！她转过身来把屁股对着你，她的尾巴绕着你的");
         if(get_player().balls > 0)
         {
            outputText("[sack]和");
         }
         outputText(get_player().cockDescript(_loc2_) + "，然后猛地收紧。你无视了这股压迫感，将你粗壮的肉棒对准了她那诱人的、被拳交撑开的穴口。看起来还是塞不进去，但你还是向前挺进——她想要它插进去，而且你的鸡巴充血太多，根本无法进行任何逻辑思考。[pg]");
         outputText("你的" + get_player().cockHead(_loc2_) + "抵住了那柔软、喷涌着汁液的阴唇，强行将它们撑开。她很紧，紧得要命，但你只插进去了一点点龟头。朱砂在痛苦与快乐中尖叫着，上下摇晃着屁股，试图放松她那可怜的、被蹂躏的入口。[pg]");
         outputText("[say:把那根鸡巴狠狠塞进来。你感觉不到我有多热吗？天哪，它太大了……操我……快，操我！]她哭喊着。[pg]");
         outputText("在她的催促下，你继续猛攻，坚定地向前挺动你的[hips]，将你的" + get_player().cockDescript(_loc2_) + "顶向那泥泞、滴着精液的穴口。那黑色的、肿胀的阴唇痛苦地痉挛了一下，然后放松下来，像避孕套一样包裹住你粗壮的肉棒。她的肉壁包裹着你的肉棒，感觉比包裹你的手臂要好得多；那湿滑的肉壁不由自主地收缩着，这具被蹂躏的身体本能地试图将入侵者排出体外。[pg]");
         outputText("你拍打着她的屁股，看着它颤动，当那股波纹从她发红的臀瓣传导到她紧绷、被蹂躏的阴户时，你舒服地闷哼了一声。朱砂正通过她的一个传送门看着你，嘴唇微张，眼睛半翻着，努力保持清醒。不知怎么的，她还能继续说话。[say:嗯……我能感觉到它在撑开我……撑得好舒服。操……我的——嗯——屁股……哦，天哪，看看我的屁股被撑得多开！你要把我撑得好爽！我要变成你被撑坏的肉棒套子，你开心吗？我要——哦哦哦……看起来就像你那坏掉的、被操烂的生育母鼠。][pg]");
         outputText("你几乎没注意到——你正忙着将肉棒一寸寸地塞进面前这个慢慢变宽的夹具里，被她的身体能吞下多少肉棒而深深吸引。她口吐白沫，尖叫着，吱吱叫着，捶打着床铺。你更用力地向前挺进，拽住她的尾巴根部借力，大团的鼠精从被撑开的阴户里如雨般落到床单上。又有三英寸没入了你新的肉棒套子里，她开始呜咽和吱吱叫，让你想起了你父亲的狗以前玩过的一个破旧的咀嚼玩具。");
         if(get_player().cockArea(_loc2_) >= 200)
         {
            if(get_player().cor >= 75)
            {
               doNext(fuckCinnabarHugerAndCorruptedEr);
            }
            else
            {
               doNext(cinnabarHuger);
            }
         }
         else
         {
            doNext(cinnabarHuge);
         }
      }
      
      public function cinnabarAppearance(param1:Boolean = true) : Object
      {
         if(get_game().time.hours < 15 || get_game().time.hours > 20)
         {
            return null;
         }
         if(param1)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,214) == 0)
            {
               outputText("[pg]酒馆附近潜伏着一个身材丰满的女人。走近一看，你可以看到她穿着一件红宝石色的连衣裙" + (get_noFur() ? "" : " 罩在她红褐色的皮毛上") + "，当她转过身时，你可以辨认出" + (get_noFur() ? "她头上有一对老鼠般的耳朵" : "一个明显的老鼠般的口鼻") + "。");
            }
            else
            {
               outputText("[pg]朱砂正在四处游荡，寻找天赋异禀的嫖客共度良宵。");
            }
         }
         return cinnabarGreeting;
      }
   }
}

