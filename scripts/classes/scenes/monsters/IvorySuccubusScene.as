package classes.scenes.monsters
{
   import classes.BaseContent;
   import classes.BreastRow;
   import classes.CoC;
   import classes.Cock;
   import classes.CockTypesEnum;
   import classes.DebugMenu;
   import classes.DynStat;
   import classes.Monster;
   import classes.PerkLib;
   import classes.Player;
   import classes.SelfDebug;
   import classes.Vagina;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.items.Weapon;
   import classes.items.WeaponLib;
   import classes.parser._Parser.TagFun_Impl_;
   import classes.saves.SelfSaver;
   import classes.saves.SelfSaving;
   import classes.scenes.combat.Combat;
   import classes.scenes.monsters._IvorySuccubusScene.SaveContent;
   import coc.view.CoCButton;
   import flash.Boot;
   
   public class IvorySuccubusScene extends BaseContent implements SelfDebug, SelfSaving
   {
      
      public var saveVersion:int;
      
      public var saveName:String;
      
      public var saveContent:SaveContent;
      
      public var ivoryHeight:int;
      
      public var ivoryBreasts:int;
      
      public var globalSave:Boolean;
      
      public function IvorySuccubusScene()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         ivoryHeight = 73;
         ivoryBreasts = 2;
         globalSave = false;
         saveVersion = 1;
         saveName = "象牙魅魔";
         saveContent = new SaveContent(null,null,null);
         super();
         SelfSaver.register(this);
         DebugMenu.register(this);
      }
      
      public function worship() : void
      {
         clearOutput();
         outputText("在失败中还敢自称完美，真是傲慢。是时候让她学会崇拜除了她自己以外的东西了，而你那[if (hasCock) {[if (cocklength > 10) {沉甸甸的|坚挺的}]勃起[if (multicock) {的肉棒}][if (hasVagina) {悬挂在你的[pussy]上方}]|[pussy]}]就是理想的替代品。正如你对一个色欲恶魔所期望的那样，她给了你一个风骚的眼神[if (!isnaked) {，同时你脱下了衣服}]。[say: 我很高兴能成为你合适的奖励，]她说道。");
         outputText("[pg]你[if (istaur) {把腹股沟顶到她脸上|把她的脸按向你的腹股沟}]，明确表示一个[i:魅魔]无法骗过你，让你觉得这对她来说不仅仅是一份奖品。她的自恋只是一个面具，掩盖了她内心渴望被强者征服的欲望。如果你错了，也许你会让她离开，但你知道你没有错。面对这个两难的境地，她妥协了。[say: 我承认，这[b:确实]是对我的奖励。]她的舌头开始滑过你的[genitals]，但你[if (singleleg) {用你的[leg]扇了她一巴掌|把她踢倒}]，坚持要她表现出更好的感激之情。在这里，她退缩了，犹豫着不敢过分奉承你。空气中弥漫着沉默[if (silly && hasCock) {，就像你的[cocks]一样}]。在你的冒险中还会有更多像她一样的同类，你不需要等她，但你准备离开的动作迫使她屈服了。[say: 你的这里很美，勇者。如果能亲自体验一下，我将不胜感激。]");
         outputText("[pg]她那骄傲的裂痕让人很难不感到得意。在你的允许下，她紧紧抓住你的大腿，对你大加赞美。她迅速凑上前来，抚摸着你，一边惊叹于你的下体，一边寻找着合适的词语来形容它们。[say: [if (isHerm) {同时拥有[cocktype]和[pussy]——我怎么能把这等好事让给别人呢|[if (hasCock) {我太渴望像这样的[cocktype]了，根本无法抗拒品尝它的诱惑|没有什么比[pussy]更令人满足的了[if (isvirgin) {，它还保留着完整处女膜那令人兴奋的细节|[if (vaginalLooseness >= 3) {，经过奇妙的练习，变得柔软而有弹性|——紧致、舒适，充满诱惑}]}]}]}].] 一声喘息传达了她内心不断增长的欲望，这引起了你敏感部位的抽动，但你的意志比她更坚定。你忍住了占有她的诱惑，要求她[i:膜拜]你。");
         outputText("[pg]满脸通红的象牙魅魔紧紧地抱住双臂，挤压着她那" + (ivoryBreasts < 2 ? "微小的" : (ivoryBreasts > 3 ? "柔软的" : "")) + "乳沟。[say: 我在这里向您匍匐，勇者。我将为您提供最棒的服务，只为能有机会亲近这光荣的生殖器。] 她相当有说服力——也许在被支配时她会更加兴奋。她的脸离你如此之近，你能清晰地感受到她的温暖，这让你倾向于接受她的提议。她可以取悦你。");
         outputText("[pg][say: 哦，仁慈的勇者，]她如释重负地说，热情地亲吻着你的[if (hasBalls) {[balls]|[if (hasVagina) {[clit]|[if (hasKnot) {肉结|根部}]}]}]。[say: 我是您虔诚的荡妇。]你满意地叹了口气。魅魔的触摸有一种魔力，那条湿热的触手滑过你的[if (hasCock) {[cocks]|阴唇}]，给你带来一种舒缓的快感。[say: 不可否认，我生来就是为了膜拜那些令人惊叹和美丽的事物，我的所有姐妹也是如此。]女恶魔的舌头[if (hasVagina) {在你的[clit]下挠痒痒，然后滑下山谷，来到你[if (isvirgin) {纯洁的}]通道[if (hasCock) {，你的肉棒[if (multicock) {们}]在她的脸上退缩，因为下面的刺激让[cockem]无人看管，焦躁不安}]|[if (hasBalls) {环绕着你的阴囊，顽皮地轻轻拉扯，让你无人看管的肉棒[if (multicock) {们}]在她的脸上退缩|滑过你的会阴[if (tailLeg) {并进入你的生殖裂 }]，然后向上拉起，环绕着你越来越焦躁、无人看管的肉棒[if (multicock) {们}]的根部}]}].[if (hasCock) {察觉到你的需求，她伴随着清晰的吸溜声抽出了她那滑溜溜的附肢。你因这种感觉而颤抖。转移注意力后，恶魔将她的舌头蛇行般[if (multicock) {在你的[cocks]之间和 }]周围滑动，在熟悉了形状[if (multicock) {们}]后开始抽插动作|舌尖在洞口周围蠕动，挑逗着想要插入[if (isvirgin) {，你犹豫着想要接受|。你急切地命令她用嘴操你，她立刻照做，插入你的体内}]}]。只有恶魔或怪物生物才拥有如此长度和灵活度的舌头，在体验这种水平的表现时，这些特质显而易见——它巧妙地旋转和摇晃。[if (hasCock) {她饥渴地[if (multicock) {选择[if (cocks == 2) {两根之间的|这群中的}][cock]作为她的首选工具，将其吞没|吞没你的[cock]}]。在开始吸吮之前，舌头和内颊的结合紧紧地挤压着[if (multicock) {这根|你的}]肉棒。[if (cockLength > 7) {你被拉得更深，当你的龟头沉下时，她的喉咙接受了进入，她的脖子弯曲着，仿佛它也试图去爱和惊叹你所能提供的一切。}]}]热情高涨，在她强烈的肉体挤压和贪婪的吸吮中，你大声呻吟[if (!hasCock) {，每当她撅起嘴亲吻你的[clit]时}]。肌肉的痉挛折磨着你，你靠在魅魔梦幻般的拥抱中，被她迷住了。她对你的反应咯咯地笑，声音在她的嘴里回荡，成为另一种刺激源。这种超凡脱俗的感觉考验着你的心智，高潮以如此强大的力量袭来，你几乎要崩溃了。你如释重负地喘着粗气。");
         outputText("[pg]象牙魅魔退开，深吸了一口气，微笑着。[say: 你的[genitals]流出的液体真是太美妙了。]她低估了你——或者可能高估了她自己的色情技巧——因为你显然还没有结束。你[if (istaur) {[if (!hascock) {向后仰，再次把你的小穴压在她的脸上|用前腿把她的头按回你的腹股沟}]|抓住她的头，强迫她回到原位}]，有些笨拙地试图让她继续工作，她顺从地恢复了动作。口交的服侍让你的下体火花四溅，传遍你[if (thickness<25) {[if (height<60) {[if (height<48) {娇小的|小巧的}]|苗条的}] |[if (tone>70) {强壮的 }]}]身体。另一次轻得多的高潮降临，你感觉到所有的肌肉都在抽搐[if (hasCock) {，[if (cumhighleast) {大量的|少量的}]精液从你体内喷涌而出}]。在欲望的迷雾中，你短暂地沉浸在操她脸的快感中，把她锁在你的臀部之间，一边旋转一边对着她抽插。最后，这一切在一次高潮中达到顶点，让你倒在地上[if (hasCock) {，最后[if (cumhighleast) {几股|[if (cumnormal) {几滴|几注}]}]精液飞溅到象牙魅魔的脸上}]，而摆脱了你疯狂状态的恶魔也瘫倒在泥土上。");
         outputText("[pg]尽管深呼吸让你从狂喜中清醒过来，但你感觉到女恶魔又回到了你的下体。[say: 只有最崇高的服务才配得上[if (isHerm || multicock) {像这些一样的偶像|像这样的偶像}]。]她印下了一个吻。[say: 只要你受到诱惑，随时加入我们吧，勇者。我保证这种快乐随时随地都是你的。你可能会成为我们中最完美的那个……]");
         outputText("[pg]说完，她翻身躺下休息。你整理了一下自己，拿走了一些战利品，然后出发了。");
         get_player().orgasm("All");
         dynStats(DynStat.Cor(2));
         get_combat().cleanupAfterCombat();
      }
      
      public function wonVag2() : void
      {
         outputText("[pg][say:现在，小“勇者”，你崇拜我的完美吗？]");
         outputText("[pg]你温顺地点了点头。");
         outputText("[pg]恶魔咯咯地笑着，向你招了招手。[say:那么，你终于想成为我们中的一员了吗？沐浴在这样的荣耀中？如果你愿意，我们甚至可以再像这样玩一次。]");
         dynStats(DynStat.Cor(2));
         menu();
         addNextButton("接受",badEnd).hint("放弃你的任务，成为一个恶魔听起来不错。");
         addNextButton("拒绝",deny).hint("你会反抗的。");
      }
      
      public function wonSubmit() : void
      {
         clearOutput();
         outputText("你张开[if (singleleg) {[pussy]，用手指掰开|[legs] 双腿}]，邀请魅魔随心所欲地对待你。她似乎对你的决定很满意，俯身落地[if (singleleg) {，跨坐在你的[leg]上}]。[say: 现在，好好求我，]她用撩人的语气命令道。你深吸一口气，请求她用尾巴进入你。[say: 好[boy]，]她说着，用铲形尾巴光滑平坦的一面滑过你的阴唇。铲形尾巴较硬的中心压在你的唇间，其\"翼\"部则摩擦着整个谷内。这种感觉还算不错，只是对你来说有些紧张。你本以为会立刻被进入，所以每当尖端靠近你的[if (isvirgin) {处女 }]入口时，你都紧张得屏住呼吸。更添悬念的是，魅魔温柔柔软的手在你身上游走，所到之处留下阵阵刺激的暖意。你忍不住颤抖起来。");
         outputText("[pg]尾巴抽了出来，现在因为你明显的顺从而变得湿滑。女恶魔轻轻地用铲形尾巴拍打你的小穴，让你退缩，你体内的热量已经积聚得很高，让你浑身发抖。[say: 你看到我对你的影响了吗？恶魔远比凡人更诱人、更令人渴望，你无法否认。] 她凑近，把脸贴近你的脸。[say: 告诉我你想要这个。]");
         outputText("[pg]无论你有什么理智、骄傲或责任感，你都想要这个。你的身体燃烧着被插入和强暴的欲望，你在支配你的敌人身下绷紧身体，热切地期待着她如愿以偿地满足她的欲望。魅魔对你的邀请感到满意，迅速地将她粗壮的尾巴猛地插入你的体内。你倒吸一口凉气，[if (isvirgin) {[b:当恶魔撕裂你的处女膜并夺走你的童贞时，你的大脑短暂地麻木了]|紧接着是一声满足的叹息}]。她扭动着尾巴，看着你扭动身体，咯咯地笑了起来。[say: 真可爱，尽管你努力反抗我们的同类，但还是完全屈服于我了。] 当她抓住你的[if (thickness > 66) {丰满|[hips]}]时，她辐射出的温暖抚慰着你。[say: 珍惜这种快乐吧，小玩具。] 她猛地一挺，将铲形尾巴撞入你的子宫颈。本能地，你试图挣脱，但她的爪子深深地陷入你的[skinfurscales]，将你固定住。她后退并再次猛插[if (isvirgin) {, 她的工具上沾着细细的血丝}]。尽管受到这样的对待，你还是想要更多。" + (get_player().get_tallness() < ivoryHeight + 6 ? "她性感的眼睛深情地盯着你，然后她的嘴唇突然贴在你的嘴唇上，她长长的恶魔舌头探索着你的口腔。这是一个异常深情和热烈的吻，感觉仿佛能将你融化。" : "") + "被她的技巧和魔法所吸引，你拥抱了魅魔。无意识地发出想要[i:更多]的喘息呻吟，作为回报，你受到了更猛烈的捣弄。她那灵巧的雪白双手抚摸你的[breasts]，可能比你自己做得更好[if (islactating) {, 用乳汁弄湿了你的胸膛}]。");
         get_player().cuntChange(4,false);
         outputText("[pg]象牙色的女恶魔站直了身子，从这场嬉闹中短暂地停顿了一下。[say: 承认你是个低等生物,] 她再次猛地撞向你时要求道。[say: 承认你爱慕我的美丽和完美！] 她用另一次猛插来强调自己的话。你承认了，她是完美的，但她将臀部撞向你，命令你大声说出来。这个性爱恶魔是美丽的化身，你陶醉于被用来满足她的快乐。一声[i:闷响]将你肺部的空气挤出，女恶魔现在再次拥抱你，她的尾巴快速地操着你，同时在你身上留下亲吻和充满爱意的轻咬。扭动的附肢蹂躏着你[if (vaginallooseness > 2) {泥泞、宽敞的内部，当它四处摆动时，从各个方向压迫着有弹性的肉壁|紧绷、疼痛的内部}]。无论你对她带给你的狂喜有多么感激，很明显，当这阵迷雾最终散去时，你会感到酸痛。尽管如此，你还是咽下呻吟，告诉她你想要更多。");
         outputText("[pg]液体从你的[pussy]中喷涌而出，高潮席卷了你，就在你的声音离开嘴唇的几秒钟前——但你仍然重复着你的话。另一个高潮迅速到来，再次冲击你的感官。一切开始变得模糊，世界旋转着，你坠入了极乐之中。");
         outputText("[pg]你转过头，看到那个女恶魔正在把她的尾巴舔干净。她回过头来，对你微微一笑。");
         get_player().orgasm("Vaginal");
         wonVag2();
      }
      
      public function wonBeg() : void
      {
         clearOutput();
         outputText("你请求她不要操你。你宁愿挨打也不愿被插入。一鞭子抽在你的腹部，让你突然发出一声惨叫。[say: 你确定吗？不管怎样，最后你都会在我的脚下匍匐。难道你不想在一次极乐的高潮之后再这样吗？]她问道。你确认了你的决定。她咯咯地笑了起来。[say: 哦，你们这些奇怪的凡人，有些人如此奇怪地执着于性自主权，就好像它有什么意义一样！]她叹了口气。[say: 如果这真的对你那么重要，那就求得更好听点。]");
         outputText("[pg]你咽下自尊，向恶魔恳求，如果能保住你的[if (isvirgin) {纯洁|小穴}]，你愿意挨一鞭又一鞭。她又抽了你一鞭，在肚脐下方留下了一块淤青。[say: 继续求我，]她命令道。你疼得闷哼了一声，深吸一口气，[i:恳求]她不要强暴你。你恳求这个性爱恶魔发发慈悲，用这种虐待你的方式来取悦她自己，而不是撕裂你[pussy]的神圣。尽管这对她来说可能微不足道，但这是你在乎的东西，而且她肯定能从用金属头的鞭子抽打你所带来的痛苦中获得很多快感。象牙魅魔对你的行为咯咯大笑，又抽了你一鞭，不知为何比之前更猛烈了。[say: 那就求我多抽你几鞭！]");
         outputText("[pg]你咬着嘴唇，请求魅魔继续抽打你，你的肚子上立刻又多了一道刺痛的鞭痕。她满怀期待地看着你，你顺从了她无声的命令。你要求更多。你的[skin]上又多了一道火辣辣的痕迹，让你疼得倒吸一口凉气，但按照她的意愿，你告诉她继续。[say: 你说得对，我这样对你确实能获得很多快感。你真是个好[boy]。]她又抽了你一鞭，让你全身发抖。很疼，疼得你几乎感到恶心，但你不知怎么地开始享受这种感觉了。你虚弱地要求更多，然后你又挨了一鞭。你要求更多。");
         outputText("[pg]她等待着。你再次请求，她继续等待。这种寂静令人痛苦，你大声说你想让她再抽你一鞭。她微笑着，用另一鞭奖励了你。她打到的每一个地方都火辣辣地疼，但你还是不断要求更多。不，你是在[i:乞求]更多。当你沉浸在这个受虐狂的角色中时，她已经完全把你控制在股掌之中。你恳求并大声说她应该尽情地抽打你，最后她放开了手脚，连续快速地抽了你一连串的鞭子。突然的灼热感接踵而至，淹没了你的感官，直到你无法进行连贯的思考。当折磨过去，你的理智恢复时，可怕的酸痛感在瞬间加剧。魅魔高高地站在你瘫软安静的身体上方，对她自己感到很满意。");
         wonVag2();
      }
      
      public function won(param1:Boolean = true) : void
      {
         var _loc3_:* = null as CockTypesEnum;
         _temp_1.timesLost += 1;
         clearOutput();
         var _loc2_:String = get_player().hasPerk(PerkLib.SlimeCore) ? " 这种压力威胁要将她恶魔般的尖刺刺入你珍贵的核心，这在得意的假笑之外又增加了一层威胁。" : "";
         outputText("当你的战斗" + (param1 ? "力量" : "意志") + "耗尽时，象牙魅魔靠近并将你踢倒在地。[say: 哼，]她轻笑着。[say: 相信我们的完美了吗？]当她的脚跟压在[if (isfeminine || hasbreasts) {你的[breasts]之间|你的胸膛上}]时，你退缩了。她俯下身，把更多的重量压在你身上，同时把脸靠近你的脸。" + _loc2_ + " [say: 恶魔是美丽和力量的缩影；我会让你像你这个[if (isdemonmorph) {肤浅的模仿者|低等生物}]一样崇拜我。]");
         if(get_player().hasCock())
         {
            outputText("[pg]恶魔收回脚跟，饶有兴致地打量着你，然后开始了下一步动作。[if (isnakedlower) {[say: 这么不知廉耻地炫耀[if (multicock) {这些|这东西}]？]她用一种毫无兴趣的语气问道。|[say: 把你的鸡巴掏出来，]她命令道。你稍有迟疑，她就一脚踩在你的腹股沟上，痛苦地挤压着隐藏在[lowergarment]里的阴茎。[say: 我说[b:把它掏出来。]]这次你的反应要快得多，乖乖照做了。}]当她脚上锋利的指甲划过你的阴茎时，你的[if (multicock) {[cocks]|[cock]}]痛苦地抽搐着。");
            if(get_player().cockThatFits(6,"length") != -1)
            {
               outputText("[say: 哈！这小玩具真可悲，]她嘲笑道，用脚趾夹住你[if (multicock) {最小的鸡巴|的鸡巴}]。[say: 你怎么会留着这么小得丢人的东西？]她叹了口气。[say: 不过，这总比小恶魔们那些恶心、比例严重失调的鸡巴要好。]");
               if(get_player().longestCockLength() >= 10)
               {
                  outputText("白肤魅魔皱起眉头，对着你[cock biggest]狠狠踢了一脚。[say: 就像这个。这东西现在还有什么用？这种规模的过度膨胀毫无艺术价值可言。它只是一种空洞、愚蠢的放纵。]");
               }
            }
            else if(get_player().cockTotal() > 1)
            {
               outputText("[say: 一整套，]她若有所思地说。[say: 希望以量取胜？不是所有人都能把自己的工具磨练到完美，所以干脆多弄几个，希望能扯平！]她突然踢了那一团。[say: 真是可悲又粗暴的做法。]");
            }
            else if(get_player().longestCockLength() >= 10)
            {
               outputText("[say: 你以为这能让人印象深刻吗？这么[if (isnakedlower) {粗鲁|不知廉耻}]又粗俗，]她气呼呼地说。[say: 过度放纵毫无优雅可言。只是一团恶心的肉块，宣示着过度胜过技巧或美感。]她皱着眉头看着你，脚趾蜷缩起来，痛苦地抓挠着你的阴茎。");
            }
            else
            {
               outputText("[saystart] 这就是你认为配得上你干活的工具？");
               _loc3_ = get_player().cocks[0].get_cockType();
               if(_loc3_ == CockTypesEnum.ANEMONE)
               {
                  outputText("一条[b:寄生虫]？很可悲，不是吗？我想有一种说法是[man]的鸡巴有自己的思想，但我怀疑你把它具象化是为了装可爱");
               }
               else if(_loc3_ == CockTypesEnum.CAT)
               {
                  outputText("当它屈服于我的" + (param1 ? "力量" : "诡计") + "时，我就知道你的鸡巴属于一个[b:娘炮]，你没必要这么较真");
               }
               else if(_loc3_ == CockTypesEnum.DEMON)
               {
                  outputText("如果你试图模仿我们同类的举动不是这么可悲的话，我可能会感到受宠若惊。真正完美的唯一方法就是全身心投入");
               }
               else if(_loc3_ == CockTypesEnum.HORSE)
               {
                  outputText("一根不比人类大多少的马鸡巴，有一种说不出的可悲。我敢肯定[if (istaur) {其他}]半人马会无情地嘲笑你");
               }
               else if(_loc3_ == CockTypesEnum.HUMAN)
               {
                  outputText("在一个充满异国情调和奇幻色彩的世界里，你却如此平庸无奇");
               }
               else
               {
                  while(true)
                  {
                     if(_loc3_ != CockTypesEnum.DOG)
                     {
                        if(_loc3_ != CockTypesEnum.WOLF)
                        {
                           outputText("也许有异国情调。一种可悲的尝试，试图用新奇来弥补优雅的缺乏");
                           break;
                        }
                     }
                     outputText("你和任何凡人一样，都是一条狗，装备也一样");
                     break;
                  }
               }
               outputText("。[sayend]");
            }
            outputText("白肤魅魔用身体的重量更用力地压下来，进一步虐待你。这种对你生殖器的虐待，远不如你所期望的落入魅魔手中那般令人满足。然而，尽管很不舒服，你还是勃起了。甚至不仅如此，当她的脚底粗暴地摩擦你的阴茎时，你感到体内有一种悸动的需求。");
            outputText("[pg]当苍白的魅魔感觉到你不断涌现的欲望时，她的表情露出了一种傲慢的喜悦。[say:[if (timeslost > 0) {你很清楚，色欲恶魔的效力并不仅仅局限于柔软湿润的洞穴|你现在应该意识到了，色欲恶魔不需要用她柔软天鹅绒般的内里，就能把一个[if (ischild) {[boy]|[man]}]逼到极限}]。]她慢慢地上下滑动着脚，以此强调她的观点，这让你浑身紧绷，发出一声轻微的呻吟。黑魔法、恶魔的影响，或者仅仅是熟练的技巧——不管是什么，它起作用了。她暂时离开你的胯部，将脚趾[if (hasBalls) {伸到你的[balls]下面，}]抵在你的[if (hasVagina) {[vagina]|会阴}]上，用力地摩擦着[if (silly) {用她的籽骨}]。她的脚趾[if (hasBalls) {在你的阴囊下面|在你的阴茎根部}]蠕动，带来一种奇特的抚慰感，然后她[if (hasVagina) {增加压力，把你的[if (silly) {裂口|小穴}]磨得生疼，接着}]向后退去，狠狠地踢了你一脚。听到你立刻发出的痛苦叫声，她咯咯地笑了起来，看着你把手伸向腹股沟，她觉得非常有趣。");
            outputText("[pg]她满意地叹了口气，蹲在地上与你平视。[say: 很疼，不是吗？]当她抚摸你时，她的手上闪烁着黑暗能量的光芒，你的鸡巴比以前更加兴奋地跳动着。[say: 像你这样不完美的生物有这么多的性能量，不满足我的饥饿感就太浪费了，]她叹了口气说。[say: 但这并不意味着我需要让你觉得这么有回报。]她的尾巴抽打在你的脸上，强调了这一点。恶魔把你翻过来，让你靠在她身上，伸手去抓你的[if (hasBalls) {[sack]|[cock]}]。她低下头，紧紧地咬住你的耳朵，然后对着刺痛的伤口吹气。她戏谑地低语道：[say: 现在我要让你高潮，不管有多疼。]");
            outputText("[pg]她恶魔般的爪子像老虎钳一样紧紧捏住你，让你发出一声惨叫。她魔法中同样的黑暗光芒再次从她的手中流淌出来，她让你经历的所有痛苦都推动着你走向高潮。这种你即将达到高潮的边缘，而剧烈的痛苦却没有提供任何实际快感的感觉，与某种受虐狂的刺激截然不同。这是不受欢迎的。你的身体乞求这种折磨停止，以免你的男子气概被剥夺，但你无法否认你脸庞和下体的燥热。[say: 即使在折磨中，我也能让你高潮，]她低语道。[say: 承认我们恶魔是优越的。接受它。然后你就可以得到释放。]她拉扯你的[if (hasBalls) {睾丸|阴茎}]，更强烈地驱使着本能的恐惧，但违背常理的是，你的肌肉有节奏地收缩，模仿着射精的动作。这必须结束，否则你觉得你的生殖器之后就无法工作了。[say: 崇拜我们同类的力量和美丽吧。]疼痛在你体内蔓延，仿佛你的生命力正被尖叫着拖入她的掌控之中。在你的胸腔深处，一种渴望悄然滋生，敦促你接受她所声称的“真相”。更多，她低语道，[say: 崇拜你的主子，凡人。]你的一部分在尖叫，恶魔比你伟大。恶魔处于曾经只有神明才能达到的水平。你不能大声说出来让她赢……然而，她微笑着，仿佛知道一切。突然的、不想要的高潮喷射出一股又一股，溅在你的肚子和胸膛上。白肤魅魔咯咯地笑着，放开了你。");
            outputText("[pg][say: 你渴望这种形态，不是吗？]魅魔问道。[say: 变成更伟大的存在。你可以像活生生的艺术品一样。]");
            get_player().orgasm("Dick");
         }
         else
         {
            if(get_player().hasVagina())
            {
               registerTag("lostVirginity",TagFun_Impl_.fromBool(get_player().lostVirginity));
               outputText("[pg]女恶魔将脚向下滑动，脚趾上的爪子轻轻刮过你的身体。[if (isvirgin) {[say: 啊，]她轻笑着说。[say: 你这里还是个处，不是吗？]她挑起一根眉毛，更用力地压在你的小腹上。[if (lostVirginity) {[say: 不，不完全是。难道你无法忍受已经被使用过的污点吗？是被强暴的吗？哦，可怜的小家伙，]|[say: 也许如果你好好求我，我会让你保持原样，]}]她嘲弄地说。|[say: 我想知道这个子宫到底被用过多少次了？]她嘲讽道。}] [if (!isnaked) {[say: 好了，做个乖[boy]，现在脱衣服。]看到你犹豫，她用鞭子抽了你一下，在你腹部留下了一道痛苦的红肿印记。[say:[b:现在。]]这次你没有犹豫，以最快的速度脱下了你的[armor]。}]她脚跟的尖刺慢慢刺入你阴蒂包皮的顶部，引起一阵剧痛。更糟糕的是，她开始旋转尖刺，迫使你的[clit]尖端进一步暴露在保护层之外。[if (clitlength > 1.5) {那块肉像真正的阴茎一样抽搐着，尽管更多是因为痛苦而不是兴奋|那[if (clitlength < .5) {微小的}]肉突在异常的暴露下微微抽搐}]，象牙魅魔看着你的不适，狡黠地笑了。");
               outputText("[pg]让你松了一口气的是，女恶魔从你身上走开了。[say:告诉我，]她一边准备鞭子一边说道。[say:你是希望我粗暴地[if (isvirgin) {侵犯你纯洁的处女小穴，}]还是仅仅把你打到屈服？]她挑了挑眉。[say:也许两者都要？]恶魔大笑起来。[say:哦，我在开什么玩笑，对于任何魅魔来说，[if (isvirgin) {夺走“勇者”的初夜|强暴“勇者”}]都是难以拒绝的战利品。]她那粗如绳索的尾巴滑入双腿之间，像一根假阳具一样从她的腹股沟处伸出，然后她开始充满爱意地抚摸它。很明显，她打算怎么操你。");
               menu();
               addNextButton("乞求",wonBeg).hint("你的[if (isvirgin) {贞操|性尊严}]比乞求所付出的自尊更有价值。");
               addNextButton("屈服",wonSubmit).hint("被当做泄欲工具远比挨鞭子要愉快得多。");
               return;
            }
            outputText("[pg]女恶魔退后一步，好奇地打量着她的战利品。她挥动着被神秘光环笼罩的手，你感觉到[if (isgoo) {你的粘液变得紧实紧绷|你的许多肌肉紧绷起来}]，尤其是你的[legs]和下背部。片刻之间，你就不由自主地弓起身体，将腹股沟向她的方向挺起。[if (!isnakedlower) {她费了点力气才解开你的下装，并对她的发现嗤之以鼻。}][say:这么害怕被利用，以至于宁愿过着没有任何性生活的生活？]魅魔开始大笑。[say:告诉我，这对你有什么好处？]她摸索着你的[butt]，为了保持这个尴尬的姿势，你的臀部现在紧绷到了极点。[say:你不会让我相信，你能走到这一步，而[b:这个]洞却没有被蹂躏过吧？]你[if (isgoo) {僵硬的粘液|肌肉}]中的灼烧感会让你重新瘫倒，但无论她使用了什么黑魔法，都不让你倒下，你眼中的疲惫似乎让她感到好笑。");
            outputText("[pg]她拉紧鞭子，狡黠地看着你。[say:幸运的是，或者也许是不幸的是，除了让你那个洞大开之外，我还有其他的计划。]为了展示她的想法，她突然用鞭子抽打你的腹部，让你痛苦地抽搐了一下。留下的印记疼得厉害。她咯咯笑着，再次抽打你，在你的[skin]上留下另一道刺痛的鞭痕。即使在这种痛苦中，你的身体也无法解除挺起腹股沟的扭曲姿势。当鞭子抽打在你毫无特征的胯部时，你痛苦地尖叫起来，促使你的[if (singleleg) {身体|双腿}]收缩以保护自己，但你根本无法抵抗这个法术。[say:如果你愿意，我可以施舍一点仁慈，]她带着得意的笑容说道。[say:崇拜我。]");
            outputText("[pg]痛苦和失控感正在逼近你的承受极限，脑海中一直有个声音劝你顺从，但你只是默默地盯着她。她再次嘲笑你，然后戏剧性地将雪白的皮鞭在身边挥舞，接着猛地抽在你的腹部。你的肌肉终于放松了紧绷的状态，让你瘫倒在地。[say: 膜拜我，]她命令道。尽管你已经筋疲力尽，却发现自己正匍匐在她的脚下。[say: 吻我。]你茫然地看着她脚趾上锋利的指甲，还在努力恢复，但背上突然挨了一鞭，让你再次痛呼出声。[say: 我可以随心所欲地扭曲你这虚弱的身体，但我希望你自己迈出最后一步，]她说道。你忍着鞭伤的刺痛，凑上前去亲吻她的脚。");
            outputText("[pg]她嘲弄地轻笑着。[say: 乖[boy]……不，你没有那套装备。乖[b:宠物]。]你的全身似乎轻松了一些，尽管遭受了虐待，但还是放松了下来。[say: 这是给你的奖励，]魅魔解释道。[say: 现在再亲一次。]");
            outputText("[pg]你顺从地准备重复这屈辱的动作；然而，她抬起脚，露出了脚趾和脚底。伴随着又一声[i:脆响]，你的背部再次挨了火辣辣的一击。她一言不发，但意思已经很明确了。你抬起头，将嘴唇贴在她的前脚掌上。[say: 这就对了，学得挺快。我喜欢。]她说话时，一股热流传遍你的全身。她的脚踩在你的脸上，重新吸引了你的注意力。[say: 你喜欢被踩在脚下，不是吗？只要你拒绝这份恩赐，我的脚下就是你的归宿。]她收回脚，将腿移到你的手上，然后用她那恶魔般的足跟尖刺猛踩下去，让你忍不住惨叫出声。[say: 只要你还执着于你那软弱的凡人之躯，你就永远低所有恶魔一等。]");
            outputText("[pg]她跪下来，凑近盯着你。[say: 你现在还要拒绝这份恩赐吗，还是为你自己接受这份美丽？]");
            get_player().changeFatigue(10);
         }
         dynStats(DynStat.Cor(2));
         menu();
         addNextButton("接受",badEnd).hint("放弃你的任务，成为恶魔听起来也不错。").disableIf(!get_player().isCorruptEnough(66),"你的腐化程度还不足以考虑这样的提议。");
         addNextButton("拒绝",deny).hint("你会反抗的。");
      }
      
      public function sexLeave() : void
      {
         clearOutput();
         outputText("她的诱惑不会动摇你——你掠夺了这场战斗的战利品，然后留下恶魔让她灰溜溜地逃回家。");
         get_combat().cleanupAfterCombat();
      }
      
      public function saveToObject() : Object
      {
         return saveContent;
      }
      
      public function ridingCock2(param1:Boolean = false) : void
      {
         outputText("[pg]出于本能，你挺动臀部，想要更深地埋入她那紧致、如天鹅绒般的穴" + (param1 ? "里" : "里") + "。她明白了你的意思，开始在你的肉棒[if (multicock) {们}]上起伏。她的肌肉完美地收缩紧绷以适应你的尺寸，这惊人的效果让你想起人们是如何在魅魔带来的极乐中失去灵魂的。随着第一次高潮比你预想的更早到来，你结结巴巴地呻吟着。你的腹肌和大腿紧绷又放松了好几次，将精液喷射进这个显然很开心的色欲恶魔体内。[say: 享受你赢得的奖励吗？]她问道。你再次挺动臀部，深呼吸以驱散那令人陶醉的迷雾。她的能力令人难以置信，但你仍然掌控着局面，而且你[b:需要]更多。");
         outputText("[pg]象牙魅魔继续前后摇晃，双手抚摸着你[if (thickness>75) {巨大的、}][if (tone>50) {强壮的|柔软的}]身体。她沿着你[if (thickness<25) {轮廓分明的}]肋骨的抚摸令人舒缓，当她的手移到你的[chest]上，用力按摩以取悦你时，你满足地呻吟着。你的眼神变得迷离，直到她的嘴唇贴上你的嘴唇，深深地吻你时，你才注意到她靠得更近了。她长长的舌头探入，与你的舌头共舞。一股热流在体内爆发，你再次高潮，用精液填满了恶魔[if (cumhighleast) {，甚至溢了出来}]。她发出一声狂喜的呻吟，声音大得足以产生回音，并通过用尾巴拍打[if (tailLeg) {你[if (isNaga) {蛇形的|[if (isMer) {海洋生物般的|修长的}]}]身体|地面}]发出一声闷响，来强调她的满足感。然而，你内心深处似乎还在渴求着更多。");
         outputText("[pg]你在恶魔身下扭动，用[hands]抓住她的大腿，快速地抽插。[say: 啊——啊——啊，好大的力气！]她结结巴巴地惊呼。你翻了个身，把她压在身下，进行最后一次疯狂的冲刺[if (silly) {操弄}]。由于过度劳累而感到痛苦，你拔了出来，向前冲去，将最后一次射精喷在她的脸上。");
         outputText("[pg]你喘了口气。象牙魅魔从她沾满精液的脸上抹下一些，舔了舔。[say: 我展示的所有才能，你都可以享受，或者如果你能看清加入我们的真相，你也可以拥有。]你没有理会她，整理好自己，拿走你想拿的战利品，然后离开了。");
         get_player().orgasm("Dick");
         dynStats(DynStat.Cor(2));
         get_combat().cleanupAfterCombat();
      }
      
      public function ridingCock(param1:Boolean) : void
      {
         clearOutput();
         outputText("魅魔向前倾身靠向你，你抓住机会，将你的[cock 2]塞进她的" + (param1 ? "柔软的臀部" : "小穴，撑开那柔软的孔洞以接纳第二次入侵") + "。她因为这粗暴而突然的加入而惊叫起来。[say: 我赞赏你的主动！]");
         ridingCock2(param1);
      }
      
      public function riding() : void
      {
         var DP1:Boolean;
         var _g1:IvorySuccubusScene;
         var DP:Boolean;
         var _g:IvorySuccubusScene;
         clearOutput();
         if(get_player().isTaur() && get_silly())
         {
            outputText("你直奔主题，表示想让她骑你，你挑起眉毛，期待着她施展魅魔的本领。魅魔满面笑容地挣扎着站起来，然后开心地蹦跳到你身边。[say: 噢，好久没这样了！我欣然接受，]她说着跳上了你的背。她踢了踢脚跟。[say: 驾！]");
            outputText("[pg]好吧，这可是[i:你]的主意；拒绝她就太没礼貌了，于是你开始小跑，象牙魅魔高兴地尖叫起来。[say: 感觉就像回到了小女孩的时候！驾！驾！]现在你也被她的热情感染了，你加快了步伐，她的笑声激励着你跑得更欢。没过多久，你就忘记了之前的打斗，沉浸在这美好的增进感情的体验中。[say: 你真是个贴心的勇者，]她说着亲了亲你的脸颊。女恶魔跳下来拍了拍你，然后你们互道再见，分道扬镳。等她走远后，你才意识到自己有多傻。");
            outputText("[pg]她忘了带钱包，现在叫她已经来不及了！");
            get_combat().cleanupAfterCombat();
         }
         if(get_player().hasCock())
         {
            outputText("费了这么大劲才把她打倒，只有让她来服侍，你才能品尝到完美的滋味。你[i:确实]赢了，像她这样的色欲恶魔有什么好抱怨的呢？看到你[if (isnaked) {展示|露出}]你的[cocks]，她果然露出了你预料中的感兴趣的神情，你躺在一个舒服的姿势，等待着她的服侍。");
            outputText("[pg][say:你知道你想要什么，]魅魔说着，舔着嘴唇笑着爬了过来。[say:我很乐意效劳。]当她的手触碰到你[if (multicock) {[cock biggest]|阴茎}]的根部时，一股暖流传遍了你的全身。她的大拇指优雅地滑下[if (hasBalls) {[if (hasVagina) {穿过你的阴唇|你的会阴}]，然后轻轻地捏住你的[sack]|[if (hasVagina) {穿过你的阴唇，然后向上拉，在你的[clit]周围按压|你的会阴，性感地摩擦你大腿之间的空间，同时抚摸你的根部}]}]。这刺激的按摩让你的阴茎[if (multicock) {们}]跳动起来，当她的舌头滑出并绕着阴茎[if (multicock) {们}]打转时，你突然感觉自己快要融化了。你渴望得嗡嗡作响，坚持要她骑上来——这个命令她不需要听第二遍。");
            outputText("[pg][say:好好享受这深处吧，勇者，]她说着，滑过来，把她湿滑的阴户贴在你的" + (get_player().cocks[get_player().biggestCockIndex()].get_cockType() != CockTypesEnum.HUMAN ? get_player().cockMultiNoun(get_player().biggestCockIndex()) : "") + "龟头上。她的臀部转动着，挑逗着你。[say:品尝这——]她的声音被一声闷哼打断，你猛地把她压下，迫使她吞没你的长度。那火热湿润的紧致感带来一种超现实的快感。[say:品尝我小穴的神圣感觉吧。这是对你这样有实力的[man]唯一公正的奖励，]她低语着，恢复了镇定。女恶魔站起身，拖着她[if (cockthickness > 2) {被撑开的小穴离开你的粗壮|[if (cocklength < 5) {柔软的小穴尽可能紧紧地贴着你的小鸡鸡离开|紧致的小穴离开你的阴茎}]}]。当她再次沉下去时，你确信高潮即将来临。她那轻薄的短裙几乎无法遮掩你们的结合，裙边的褶皱让它在她的扭动中显得轻盈飘逸，她开始旋转，用她的内壁摩擦你的[cock biggest]。[if (multicock) {这个动作不断地把你的[cock 2]压在她的臀瓣之间——这绝不是令人反感的刺激——但你不能让它只是在那里晃荡……}]");
            if(get_player().cockTotal() > 1)
            {
               menu();
               _g = this;
               DP = true;
               addNextButton("双插",function():void
               {
                  _g.ridingCock(DP);
               }).hint("同时填满两个洞。","双重插入");
               _g1 = this;
               DP1 = false;
               addNextButton("双穴",function():void
               {
                  _g1.ridingCock(DP1);
               }).hint("用更多的阴茎填满她的小穴。","双重小穴插入");
            }
            else
            {
               ridingCock2();
            }
         }
         else
         {
            registerTag("looseness",get_player().isGenderless() ? TagFun_Impl_.fromInt(get_player().ass.analLooseness) : TagFun_Impl_.fromInt(get_player().vaginas[0].vaginalLooseness));
            registerTag("wetness",get_player().isGenderless() ? TagFun_Impl_.fromInt(get_player().ass.analWetness) : TagFun_Impl_.fromFloat(get_player().vaginas[0].vaginalWetness));
            registerTag("virgin",get_player().isGenderless() ? TagFun_Impl_.fromBool(get_player().buttVirgin()) : TagFun_Impl_.fromBool(get_player().hasVirginVagina()));
            registerTag("virgin",get_player().isGenderless() ? TagFun_Impl_.fromBool(get_player().buttVirgin()) : TagFun_Impl_.fromBool(get_player().hasVirginVagina()));
            outputText("你打算骑在她的身上，作为战斗后令人满足的奖励，好好地放松一下。魅魔迅速地将尾巴摆在双腿之间，充满诱惑地在赤裸的阴户上扭动着，咯咯地笑着。[say: 你的品味真不错，勇者。]");
            outputText("[pg]你[if (!isnaked) {一边脱衣服一边}]靠近，看着她双腿之间的附肢充满期待地翘起，就像一只过度兴奋的小恶魔的肉棒。然而，在正戏开始之前，你大步走过她的臀部，坐在她的头上，把你的[vagORass]推到她的脸上。口交服务是理所当然的，你希望在插入之前她能确保你足够湿润。[if (wetness >= 2) { 事实上你已经准备好了，但你不想错过看看她嘴上功夫的机会。}]");
            outputText("[pg]她长长的恶魔舌头突然压在你的小穴上，勤奋地舔舐着[if (hasVagina) {，似乎还在品尝你的味道}]。她一边呻吟叹息，一边用舌头在里面翻搅，弄湿了你的[if (hasvagina) {阴唇|括约肌}]。她的技巧毋庸置疑，只会让你想要被操的欲望更加强烈，于是你撑起身子，将你[if (isvirgin) {即将被玷污的纯洁|颤抖的入口}]悬停在她粗壮的尾巴附近。[say: 我希望能向你展示完美是多么美妙，]女恶魔低语道。那条苍白、灵活的尾巴戏弄地拍打着你的[butt]，让你不禁退缩。你不想让她掌控局面，于是抓住她的尾巴，强行把它压下[if (tailLeg && hasvagina) {绕过你的[hips]，指向你的生殖裂|放在你身下，指向它真正的目标}]。前戏到此为止。");
            outputText("[pg]最后，你[if (tailLeg && hasvagina) {将那根东西沉入你的[pussy]|沉下你的[hips]，将那根东西纳入你的[vagORass]}]，因这侵入而颤抖，然后任由你的双眼变得迷离，让那根不断晃动的尾巴探索你[if (isvirgin) {被堕落破处的|[if (looseness > 1) {泥泞地接纳着的|紧绷的}]}]内部。");
            if(get_player().hasVagina())
            {
               get_player().cuntChange(4,true);
            }
            else
            {
               get_player().buttChange(4,true,false);
            }
            outputText("你的[legs]调整着姿势，以保持你在恶魔骨盆上方的舒适度，尽管她并没有停止她工具的躁动，继续刺激着你。[if (tailLeg && hasvagina) {改变姿势，你转动下半身，用它的长度缠绕住她的双腿，将你兴奋的通道与她的对齐，准备好被好好地操弄。}]她更多的尾巴埋入其中。尾巴尖端挠着你的[if (hasvagina) {子宫颈|深处}]，随着侵入的动作，你的[if (tone>thickness) {腹部|肚子}][if (thickness>75) {晃动|移动}]，你感到一阵无力。");
            outputText("[pg][if (tailLeg && isgenderless) {向后倒去，你躺在她柔软的、穿着长袜的腿上，而她则尽其所能地操弄着你的下半身。世界似乎都在旋转。你心不在焉地抚摸着她柔软的四肢，盯着她迷人的、赤裸的脚部肌肤。仿佛看穿了你的心思，她弯下腰，用腿蹭你，将她雪白的脚趾凑到你的[face]前，邀请你毫不犹豫地印下一个吻|向前倒去，你摸索着她[ivorybreasts]，它们在她无上装的紧身胸衣下如此肆无忌惮地展现出来。柔软、雪白的肌肤温暖而令人愉悦，你觉得亲吻和吸吮它们是一种享受，直到这时你才意识到，你已经毫不犹豫地将嘴唇贴在了她挺拔的灰色乳头上。即使你可能操之过急，你依然保持着吸吮，当突然遇到喷涌而出的乳汁时，你感到一阵狂喜。那滚烫、滋养的液体，即使只有少量，也带来了一种神奇的快感}]。在你[if (isgenderless) {[if (anallooseness >= 2) {被过度使用、柔软的|颤抖的}]肠道|[if (vaginalLooseness >= 2) {有弹性的、[if (vaginalLooseness > 2) {大张的|松弛的}]|有节奏地收紧的}]小穴}]中进一步的扭动迫使你吸吮、舔舐和轻咬那些可爱的凸起。[if (!tailLeg || !isgenderless) { 女恶魔毫不吝啬地回报你，当她温柔的双手突然抚摸和揉捏你的[chest]时，你喘息起来。按摩的动作与所有其他因素结合在一起，将你推向了边缘。}]");
            outputText("[pg]象牙魅魔挺动臀部，将那根肉质的绳索狠狠地撞入你体内，你因强烈的快感而呻吟。它盘旋、旋转着压迫你的内壁，你的身体因高潮而颤抖。为了抑制高潮的强度，你紧紧咬住恶魔的[if (tailLeg && isgenderless) {脚|乳房}]，设法[if (hasfangs) {用你怪物般的牙齿刮擦它，流出了血|留下了一个印记}]。疼痛惹得她笑了起来，不久之后，她的尾巴疯狂地抽插，将你操得失去理智，迎来了另一次高潮。你喘息着、颤抖着，令人震惊的是，你比预想的还要满足，然后你滚到了一边。");
            outputText("[pg][say: 只要你愿意看清真相，成为我们的一员，我所有的能力都将为你所用，]魅魔用性感的眼神盯着你说道。你把诱惑从脑海中甩开，开始收集你的战利品。");
            get_player().orgasm("VaginalAnal");
            dynStats(DynStat.Cor(2));
            get_combat().cleanupAfterCombat();
         }
      }
      
      public function reset() : void
      {
         saveContent.met = false;
         saveContent.deadHookers = 0;
         saveContent.timesLost = 0;
      }
      
      public function registerTags() : void
      {
         var _gthis:IvorySuccubusScene = this;
         registerTag("ivorybreasts",TagFun_Impl_.fromStringFun(function():String
         {
            return _gthis.get_monster().breastDescript(0);
         }));
         registerTag("ivoryheight",TagFun_Impl_.fromString(["[if (metric) {大约180厘米|不到6英尺}]","[if (metric) {大约180厘米|6英尺}]","[if (metric) {大约190厘米|刚过6英尺}]","[if (metric) {将近2米|几乎6.5英尺}]"][int(Math.floor((get_monster().get_tallness() - 70) / 2))]));
         registerTag("timeslost",TagFun_Impl_.fromInt(saveContent.timesLost));
      }
      
      public function onAscend(param1:Boolean) : void
      {
         reset();
      }
      
      public function load(param1:int, param2:*) : void
      {
         Utils.extend(saveContent,param2);
      }
      
      public function lashStop() : void
      {
         clearOutput();
         outputText("这样感觉就足够了。你留下这只遍体鳞伤的魅魔，让她赶紧跑回家去治疗她那可怜娇嫩的脸蛋。");
         get_combat().cleanupAfterCombat();
      }
      
      public function lashContinue() : void
      {
         var _loc2_:Boolean = false;
         var _loc3_:Boolean = false;
         clearOutput();
         outputText("你骗不了自己[if (isChild && silly) {，你已经乐在其中了！|。}] 在内心深处，你有着需要满足的施虐倾向，而当你再次抽打她赤裸的胸部时，你发现这是一个很好的发泄口。你的[weapon]");
         var _loc1_:String = get_player().get_weapon().get_id();
         if(_loc1_ == get_weapons().L_WHIP.get_id() == true)
         {
            outputText("留下灼热的印记，随着每一次挥动而闪烁");
         }
         else
         {
            _loc3_ = _loc1_ == get_weapons().SILWHIP.get_id();
            if(_loc3_ == true)
            {
               outputText("用尖端留下难看的鞭痕，这正是她想让你尝尝的美味");
            }
            else
            {
               _loc2_ = _loc1_ == get_weapons().SUCWHIP.get_id();
               if(_loc2_ == true)
               {
                  outputText("尽管很痛，但毫无疑问这让她很兴奋");
               }
               else
               {
                  outputText("留下的红色鞭痕让她发出痛苦的哀鸣");
               }
            }
         }
         outputText("。又是一鞭，这次抽在她的翅膀上，拉扯着那层薄薄的皮肉。她痛得叫出声来，把四肢蜷缩起来保护自己。[if (singleleg) {你用[leg]抽打她|你踢了她一脚}]，你把注意力转移到她的背上，那里比她前面那件暴露的紧身胸衣遮挡得更少。你鞭子的清脆响声和她的哭喊声在四周回荡，你在她曾经完美无瑕的肌肤上留下了虐待的痕迹。施虐的间隙让她得以平静下来。[say:你真的很喜欢伤害——]你一巴掌拍在她的屁股上打断了她，沉醉于随之而来的痛苦叫喊中。她的呜咽让你感到满足，你让这一刻在空气中凝结。");
         outputText("[pg]象牙魅魔转过身来面对你，手抚摸着自己的屁股。抓住这个机会，你最后一次抽打她的脸，你精准的打击换来了一声尖叫。恶魔倒了下去，捂着脸上那块破坏了她形象的、令人羞耻的淤青。这就足够了。");
         get_combat().cleanupAfterCombat();
      }
      
      public function lash() : void
      {
         clearOutput();
         outputText("她的武器很厉害，当你挥动你自己的[weapon]时，你已经感受到了将更多这种惩罚施加在她身上的宣泄感。[say: 哎呀呀，是个施虐狂呢，]女恶魔回应道。你手腕一抖，鞭子抽在她的脸颊上，惹得她倒吸一口凉气，痛苦地皱起眉头。她捂着伤痕，努力平复情绪。[say: 你难道不希望我这美丽的容颜完好无损吗？]对她来说不幸的是，你并不希望。你再次抽打恶魔，这次弄伤了她的鼻子。她开始担心自己的容貌，拒绝把目光转向你。你抽打她的[ivorybreasts]，然后是她的手臂，接着是她的臀部。每一次抽打都引出痛苦的哀号。到了这个时候，她可能已经受够了自己种下的苦果，除非你真的如她所说是个施虐狂。");
         menu();
         addNextButton("继续",lashContinue).hint("你确实是。");
         addNextButton("停止",lashStop).hint("再做下去也没什么好处了。");
      }
      
      public function kill() : void
      {
         var _loc1_:Boolean = false;
         var _loc2_:Boolean = false;
         var _loc3_:Boolean = false;
         var _loc4_:Boolean = false;
         var _loc5_:Boolean = false;
         var _loc6_:Boolean = false;
         var _loc7_:Boolean = false;
         var _loc8_:Boolean = false;
         var _loc9_:Boolean = false;
         var _loc10_:Boolean = false;
         clearOutput();
         outputText("你放过了她的身体，选择直接就地解决她。");
         if(true == get_player().get_weapon().isHolySword() == true)
         {
            outputText("一个利落的动作，你将闪烁着光芒的刀刃刺入她的心脏，燃烧殆尽了她的生命。");
         }
         else
         {
            _loc10_ = true == get_player().get_weapon().isScythe();
            if(_loc10_ == true)
            {
               outputText("你挥舞着黑暗镰刀划过她的脖子，切断了这个恶魔的生命。");
            }
            else
            {
               _loc9_ = true == (get_player().get_weapon() == get_weapons().SILWHIP);
               if(_loc9_ == true)
               {
                  outputText("你旋转并甩动雪白的鞭子，让她瑟缩了一下，片刻之后，你已经将鞭子缠在她的脖子上，把她拉近。恶魔顺从地挣扎着，窒息着，但当她睁开眼睛盯着你时，却显得欲火焚身。你把[foot]踩在她的脸上把她按住，同时拉紧皮绳。尽管她喉咙处抽搐的手指和眼中不断增加的血丝暗示着恐慌，但她的目光从未打破那种充满情欲的渴望，直到她的生命最终走向终结。");
               }
               else
               {
                  _loc8_ = true == get_player().get_weapon().isWhip();
                  if(_loc8_ == true)
                  {
                     outputText("你用一个简单的动作将[weapon]的绳索缠在她的脖子上，然后把她拉向你。她窒息作呕，顺从地挣扎着，很快就失去了意识，生命也随之消逝。");
                  }
                  else
                  {
                     _loc7_ = true == get_player().get_weapon().isKatana() && get_silly();
                     if(_loc7_ == true)
                     {
                        outputText("你决定，对于这个自称完美的生物来说，这是完美的一击，你准备好你那把精工打造的刀刃。你把它高高举起，指向天空，魅魔坐直身子，敬畏地看着那闪闪发光的金属。刀刃挥下，在她意识到它在移动之前就已经到了她身下。她惊呆了，盯着看。你把刀刃收回刀鞘，准备离开，并向这位体面的战士道别。随着你的武器回到原位的咔哒声，恶魔裂成两半，倒向两侧。");
                     }
                     else
                     {
                        _loc6_ = true == get_player().get_weapon().isAxe();
                        if(_loc6_ == true)
                        {
                           outputText("你双手紧握[weapon]，重重地挥向魅魔的脖子，迅速结束了她的生命。");
                        }
                        else
                        {
                           _loc5_ = true == get_player().get_weapon().isStaff();
                           if(_loc5_ == true)
                           {
                              outputText(get_player().usingMagicTF() ? "你集中精神，[weapon]重重地落在她的胸膛上。片刻之间，一股能量顺着武器流入恶魔体内，在她躺着的地方引起了轻微的震动，并用翠绿色的火焰灼烧着她。她痛苦地大声呻吟，但她的肋骨在土系魔法的压力下弯曲了。象牙魅魔安静了下来。" : "一股能量在你的[weapon]中噼啪作响，末端重重地撞击在她雪白的胸膛上，在内部引发了爆炸，杀死了她。");
                           }
                           else
                           {
                              _loc4_ = true == get_player().get_weapon().isBlunt();
                              if(_loc4_ == true)
                              {
                                 outputText("你的方法粗暴而有效，你将[weapon]挥向恶魔的太阳穴，敲碎了她的头骨。");
                              }
                              else
                              {
                                 _loc3_ = true == get_player().get_weapon().isFirearm();
                                 if(_loc3_ == true)
                                 {
                                    outputText("你靠得很近，在极近的距离向恶魔的头部开火，把里面的东西溅得满地都是。");
                                 }
                                 else
                                 {
                                    _loc2_ = true == get_player().get_weapon().isSpear() || get_player().get_weapon().isPolearm();
                                    if(_loc2_ == true)
                                    {
                                       outputText("一次强有力的刺击穿透了恶魔的头骨。");
                                    }
                                    else
                                    {
                                       _loc1_ = true == get_player().get_weapon().isBladed();
                                       if(_loc1_ == true)
                                       {
                                          outputText("一次沉重的突刺将你的[weapon]刺入恶魔的胸膛。她窒息咳嗽，鲜血从喉咙涌出，但这并没有持续多久。");
                                       }
                                       else
                                       {
                                          outputText("当你抓住她时，恶魔没有反抗。你集中力量，迅速扭转魅魔的头，成功扭断了她的脖子。");
                                       }
                                    }
                                 }
                              }
                           }
                        }
                     }
                  }
               }
            }
         }
         _temp_1.deadHookers += 1;
         get_player().upgradeDeusVult();
         get_combat().cleanupAfterCombat();
      }
      
      public function ivorySetup() : void
      {
         ivoryBreasts = Utils.rand(5);
         ivoryHeight = Utils.rand(8) + 70;
         set_monster(new IvorySuccubus());
         get_monster().breastRows[0].breastRating = Utils.rand(5);
         get_monster().set_tallness(ivoryHeight);
      }
      
      public function get_debugName() : String
      {
         return "象牙魅魔";
      }
      
      public function get_debugHint() : String
      {
         return "";
      }
      
      public function encounter() : void
      {
         var monster1:Monster;
         var _g:IvorySuccubusScene;
         var _loc1_:* = null as Array;
         clearOutput();
         ivorySetup();
         registerTags();
         if(!saveContent.met)
         {
            outputText("在旅行中，你对周围的环境保持警惕，你注意到一个阴影投射在你身上，并立刻转身寻找来源。");
            outputText("[pg]在[sun]光下，一个苗条的剪影高高地站在岩石上。她娇小、光滑的身材与她长长的角和巨大的翅膀并不相称。在她的身后蜿蜒着一条粗如绳索的尾巴，尾端有脊状突起和一个可爱的黑桃形状。她从高处降落，落在安全距离之外，现在的角度清楚地照亮了她雪白的肌肤。");
            outputText("[pg][say: 纯洁如瓷，] 那个女性声音带着回音宣告道。[say: 一具由最上等的大理石雕琢而成的身体，] 她继续说道，肆无忌惮地自我崇拜着。[say: 这就是你所抗拒的恩赐，所谓的“勇者”。] 说完这句话，她朝你挥动一条白色的皮鞭，发出充满威胁的啪啪声。你的眼睛捕捉到金属鞭梢反射出的一丝寒光。[say: 你的努力都是徒劳的，" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2024) > 1 ? "玛莱已经" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2002) > 0 ? "死了" : "幸福地迷失在自我之中了") + "。她的根须不再反抗" : "这么多年来的努力已经将玛莱的影响力削弱到只剩一声呜咽") + "。放弃吧，] 她嘶嘶地说着，然后抬起一只手向你招手。[say: 变成某种美丽的事物吧。]");
            unlockCodexEntry(2055);
            saveContent.met = true;
            menu();
            _g = this;
            monster1 = get_monster();
            addNextButton("战斗",function():void
            {
               _g.startCombatImmediate(monster1);
            }).hint("她的鞭子表明她不接受拒绝。");
            addNextButton("接受",badEnd).hint("放弃你的任务，成为一个恶魔听起来不错。");
         }
         else
         {
            _loc1_ = ["一阵傲慢的咯咯笑声引起了你的注意，你看到一只象牙魅魔正以极快的速度向你滑翔而来，只给你留下了刚好够闪避的反应时间，随后她那恶魔般的脚跟便猛地踩了下来。[pg]她重重地落地，脚跟的尖刺刮擦着地面，但除此之外动作依然优雅。[say: 这可不仅仅是美丽，哦，勇者。] 她转过身，半眯着眼睛，露出一丝戏谑的笑容。[say: 当你放弃你的灵魂时，你会变得更强、更快，而且是如此的完美。]","一声鞭响吸引了你的注意。当你注视着她的身姿时，一只象牙魅魔对你得意地笑了笑。[say:我是一件雕琢完美的艺术品。臣服吧——你会喜欢这种体验的。]","一只象牙女恶魔在头顶闪耀着光芒向你滑翔而来，施放着发光法术，似乎是想让你眼花缭乱。她在下降时翻转身体，优雅地落地，然后摆出一个姿势。[if (silly) {[say:现在给我得淋病！]她停顿了一下，回想起自己的话，皱了皱眉。[say:呃——我是说，给我鼓掌！]|[say:现在鼓掌！]她命令道。}]看到你摆出战斗姿态，她气呼呼地说。[say:真是不懂得欣赏艺术！]","[say:垃圾，]你听到声音，注意到前方有一个恶魔的身影。[say:没有美感，没有优雅，没有机智，也没有价值，]象牙魅魔一边说着，一边用鞋跟碾压着一只小恶魔的腹股沟。[say:真是个怪诞的废物。]小恶魔在承受虐待时痛苦地呜咽着。女恶魔抬起头发现了你，然后咧嘴一笑，拉紧了她的鞭子。[say:啊，好多了。至少你还有变美的潜力。][pg]当魅魔选择她的新目标时，小恶魔软绵绵地爬走了。"];
            outputText(_loc1_[Utils.rand(int(_loc1_.length))]);
            startCombat(get_monster());
         }
      }
      
      public function deny() : void
      {
         clearOutput();
         outputText("你绝不会屈服于她，绝不在此时此地。尽管你的身体和自尊都已伤痕累累，你依然在反抗。对此，象牙魅魔失望地哼了一声。[say:你终究会看清真相的。如果你继续拒绝这份恩赐，你丑陋的缺陷将会诅咒你。]她转身离去，夺走了你所有能集中注意力的东西，你渐渐昏睡过去，开始休息");
         get_combat().cleanupAfterCombat();
      }
      
      public function defeated(param1:Boolean = true) : void
      {
         clearOutput();
         outputText((param1 ? "被你的攻击击退" : "被你的情色攻势弄得面红耳赤，难以招架") + "，象牙魅魔以一种戏剧性的姿势倒下，尽可能优雅地展示着她战败的身姿。[say:你可以随心所欲地占有这具身体，品尝完美的滋味。]");
         menu();
         addNextButton(get_player().sexSwitch("肉棒","小穴","生殖器","生殖器") + " 崇拜",worship).hint("她太爱自己了，她应该向更伟大的事物表达爱意，而你可以享受一下口交。").sexButton(-1);
         addNextButton("骑乘",riding).hint(get_player().hasCock() || get_player().isTaur() && get_silly() ? "让她跨坐在你身上骑乘。" : "把她的尾巴当肉棒骑。").sexButton();
         addNextButton("肛交",anal).hint("她可以把她那自恋的态度塞进自己的屁股里。").sexButton().disableIf(get_player().isTaur(),"这个场景要求你不能是半人马形态。");
         addNextButton("鞭打",lash).hint("既然你自己也有一条鞭子，让她好好尝尝她自己选择的武器的滋味应该不错。").disableIf(!get_player().get_weapon().isWhip(),"这个场景要求你装备鞭子。");
         addNextButton("杀死",kill).hint("立刻处决她。");
         setSexLeaveButton(sexLeave);
      }
      
      public function debugMenu(param1:Boolean = true) : void
      {
         get_game().debugMenu.debugCompEdit(saveContent,new SaveContent(null,null,null));
      }
      
      public function badEnd2() : void
      {
         clearOutput();
         registerTag("perfect",TagFun_Impl_.fromBool(["pale","alabaster","ashen"].indexOf(get_player().skin.tone) != -1 && get_player().hasPlainSkin() && get_player().thickness < get_player().tone && get_player().get_femininity() >= 50 && ["human","elf","dryad","demon","demon-morph"].indexOf(get_player().get_race()) != -1));
         outputText("你发现自己正沿着一条山路向上走，俯瞰着一部分森林区域。朝着山体方向，粗糙自然的斜坡开始被精雕细琢的石制建筑所取代，支撑起一个宽阔开敞的庭院。当你接近小路的最高点时，你注视着一座华丽的拱门，它的柱子被雕刻成裸体魅魔的形状。你那肤白如象牙的向导用手轻轻拂过你的脸庞。[say: 欢迎来到我们美丽的花园。]");
         outputText("[pg]在里面，你看到了更多的雕像、陶器、植物、雕刻的小路，当然还有无数的恶魔。所有东西似乎都有手工制作的设计，包括女人，其中象牙魅魔只是一部分。有太多高度详细的物体让你无法尽收眼底，还有你无法发现来源的音乐伴奏，然后你的向导继续拉着你前进。没过多久，你注意到一个紫皮肤的男恶魔正在用墨水笔在一块相当大的画布上进行另一件作品。女恶魔把你介绍给他，说道：[say: 主人，我为您带来了勇者。]");
         outputText("[pg]男魅魔继续专心致志地工作了一分钟，然后将目光转向你。[if (perfect) {[say: 惊艳。美丽。你已经让人想起了最优秀的缪斯，]他高兴地说|[say: 做得好，]他说道}]，他倾身抓住你的下巴，检查你的五官。反过来，你也检查他的，注意到他轮廓分明的关节平滑地流入健美的肌肉，这些肌肉随着他的姿势和动作优雅地紧绷和移动。男魅魔从旁边的小桌子上抓起一根羽毛笔，开始用冰冷湿润的墨水在你的脸上做标记。[say: [if (perfect) {将会进行一些变化术——一些雕刻来完善你。我会喜欢由此产生的结果。|是的，是的，我看到了很多需要改变的地方。必须进行一些雕刻，但我喜欢我手头上的材料。}]][if (hasgooskin) { 虽然墨水理应消散在你无定形的肉体中，但他手和眼睛的闪烁表明某种黑魔法可能让你变得不那么容易吸收。}]");
         outputText("[pg]他把手放在下巴上，沉思着。" + (get_player().dogScore() >= 4 || get_player().wolfScore() >= 4 ? "他轻笑着说，[say: 一只要被设计成像亲爱的赫乌尔夫一样的狼，是的。即使是你这只杂种，也会找到美丽的。]" : "[say: 你会在我的艺术指导下找到光荣的美丽。]"));
         get_game().gameOver();
      }
      
      public function badEnd() : void
      {
         clearOutput();
         if(get_player().isRetarded() && get_silly())
         {
            outputText("起初，你拒绝了。你不能放弃你的任务。雪肤恶魔步步紧逼：[say:你不可能永远坚持你的任务。想想你错过的所有快乐吧！你怎么会知道你是否有一根能完美塞进你屁眼里的完美肉棒？或者一根能完美塞进小穴或肛门里的肉棒？]");
            outputText("[pg]你深思熟虑后妥协了。[say:你说得对，拿走我的灵魂吧；我想体验一下。]");
            outputText("[pg]女恶魔微笑着，知道她将带走你的灵魂。");
            get_game().gameOver();
         }
         else
         {
            outputText("完美与美丽，有什么好争辩的呢？当你来到这个世界时，恶魔们已经存在太久了。即使你[i:能够]拯救它，又还有什么值得挽救的呢？这不值得你费心。你将加入胜利的一方，并获得随之而来的所有特质。");
            outputText("[pg]魅魔对你的接受咧嘴一笑。[say: 那么，跟我来吧，]她一边说着，一边伸出手。你心中仍有一丝迟疑，但你还是握住了她的手，并发现自己，或许有些出乎意料地，被她牵引着前行。她并没有立刻索取你的灵魂。这段旅程将把你带向何方，你只能猜测。");
            doNext(badEnd2);
         }
      }
      
      public function analTail() : void
      {
         clearOutput();
         outputText("当你考虑你的选择时，你的[if (tailLeg) {[underbody.skintone]尾巴|[tail]}]拂过你的下巴。当然，如果她自己的不够，你应该用你所拥有的东西更用力地填满她。用[if (tailLeg) {你的[if (isNaga) {蛇形|[if (isMer) {海洋|更长的}]一半|}]狠狠地打她的脸");
         if(!get_player().hasTailInsteadOfLegs())
         {
            switch(get_player().tail.type)
            {
               case 3:
               case 28:
                  outputText("坚韧的");
                  break;
               case 9:
               case 14:
               case 25:
               case 29:
                  outputText("长满鳞片的");
                  break;
               case 16:
                  outputText("肉感的");
                  break;
               default:
                  outputText("毛茸茸的");
            }
         }
         outputText("[if (!tailLeg) { 附肢}]，你让她知道你显然还没完事。你抓住她穿着长筒袜的双腿并将它们推向一侧，调整她的身体让她四肢着地[if (!tailLeg) { ，然后将你的尾巴夹在双腿之间，就像一根假阳具一样}]。你抓住她的臀部，开始逐渐插入[if (tailLeg) {你那长满鳞片的盘绕身躯，痛苦地撑开她柔软的穴口，直到你无法再深入为止|一寸一寸地，直到你侵入她内脏的深处}]。当你感觉到她的尾巴在扭动时，她也在里外不停地蠕动着。");
         outputText("[pg]这种挤压感出奇地令人舒缓，就像是专门为你那多功能的工具做了一次特别的按摩。魅魔随着你[hips]的挺动发出一声闷哼。你觉得这确实能达到你的目的，于是开始拔出再用力插回去。虽然还是有点别扭，毕竟这部位本来不是这么用的，但渐渐地你找到了节奏，在不减速的情况下操她。她的呻吟和粗重的喘息声在空气中回荡，伴随着啪啪的肉体碰撞声。你加快了速度，准备用双尾插入把她的屁股操烂，但这场粗暴的性爱却让她爽得浑身发抖；她和任何色欲恶魔一样，都是个不折不扣的荡妇。看来这个洞快被玩坏了。");
         outputText("[pg]你推开女恶魔，将她和你的[if (tailLeg) {尾巴|[tail]}]分开。没必要给她喘息的时间；你那灵活的尾巴拍打在她的脸颊上，你表示在继续上路之前需要好好清理一下。这个雪白的荡妇顺从地舔了你好几分钟，直到她的舌头和下巴变得和她的屁股一样酸痛。你满意地从她的随身物品中挑选了战利品，然后回营地去了。");
         dynStats(DynStat.Cor(2),DynStat.Lust(20));
         get_combat().cleanupAfterCombat();
      }
      
      public function analMan() : void
      {
         clearOutput();
         get_player().createCock();
         var _loc1_:int = Utils.rand(4);
         get_player().cocks[0].cockLength = _loc1_ + 4;
         get_player().cocks[0].cockThickness = Utils.rand(2);
         outputText("之前的诱惑再次袭来，促使你询问她关于“像男人一样体验”的提议。魅魔咧嘴笑了。[say:当然，我很乐意给你一些好玩的东西。]她抬起一条腿，轻轻抚摸你的腹股沟。[say:放松身体，顺其自然，]她用性感的语调低语。她改变了姿势，把手放在你的耻骨上，轻轻按压，双手闪烁着黑暗的光环。一阵虚弱感短暂地落入你的肠胃，然后是一阵肾上腺素的激增，最后，一团血肉爆裂开来，露出了一根全新的、顶端有小结的[i:demonic]肉棒[if (isgenderless) {，下面还有两个睾丸}]。[if (isChild) {[say:尺寸适合小男孩，]|[say:对于一个精力充沛的男人来说，这是一个健康的尺寸，]}]她欣赏着自己的杰作说道。");
         outputText("[pg]被一种狂野、盲目的交配欲望所克服，你扑向恶魔，将她按倒在地，你那根全新的、跳动着的肉棒悬停在她柔软的臀部之间那个仍然被占据的洞口。有一瞬间，尾巴开始自行抽出，准备让你独自占有她的内脏，但你立刻挺身而入，迫使尾巴继续埋在里面。[say:哦！这么有攻击性——]你挺动[hips]，无情地撞击她，对言语不感兴趣。无情的嬉闹摇晃着你与她共享空间的肉绳，导致它在她的肠子里蠕动。如果你不是那么专注于强奸她直到她失去知觉，隔着她的紧身胸衣感觉到它可能会让你觉得有趣。然而，你工具的缺乏经验显露出来，当你的肌肉在性高潮中弯曲时，用你的第一次射精涂满了她的内脏。在正常情况下，这可能就是结局了。");
         outputText("[pg]仍然被驱使着，你更加用力地抽插你那喷溅的阴茎，只是短暂地被高潮阻碍。魅魔喘息着呻吟。[say:在我的荣耀中欢欣鼓舞吧，这就是礼物！]她惊呼道。又一次爆发耗尽了你，但这仍然不足以结束这场磨难。即使你的[if (isgoo) {黏液团燃烧|肌肉燃烧}]，你还是像疯了一样挺动和交配。恶魔用双臂环抱你，把舌头伸进你的喉咙，充满爱意地接受你所能给她的一切。又一次射精响起，最后你的身体彻底崩溃了。");
         outputText("[pg]你眨了眨眼，意识到失控的性欲阴霾已经结束，你现在正躺在一个非常高兴的女人身上，她似乎正在休息。当你抽出时，你看到她的尾巴根本没有机会逃脱。在这一点上，它肯定非常酸痛和破损[if (silly) {——或者被[i:baby]弄得破损——| }]。不去理会这些，你[if (!isnaked) {重新穿好衣服|收拾好自己}]，然后走开了。");
         get_player().orgasm("Dick");
         dynStats(DynStat.Cor(4),DynStat.Sens(5),DynStat.Lib(3));
         get_combat().cleanupAfterCombat();
      }
      
      public function analLeave() : void
      {
         clearOutput();
         outputText("你已经得到了你想要的满足，所以你确认你确实已经完事了。恶魔渐渐开始把她的尾巴拔出来，但你最后又[if (singleleg) {用你的[leg]拍打|踢}]了一下，强迫它插回去。她闷哼了一声，然后耐心地等你离开，你在拿走战斗的战利品后便离开了。");
         dynStats(DynStat.Cor(0.5),DynStat.Lust(10));
         get_combat().cleanupAfterCombat();
      }
      
      public function anal() : void
      {
         var _loc1_:Boolean = false;
         var _loc2_:Boolean = false;
         var _loc3_:Boolean = false;
         var _loc4_:Boolean = false;
         clearOutput();
         if(!get_player().hasCock())
         {
            outputText("你压在她身上，用[hands]捧起她柔软、线条优美的屁股。她粗壮多肉的尾巴也反过来抚摸着你。[say: 像大理石一样光滑，却又像棉花糖一样柔软，]当你摸她的屁股时，她向你保证。[say: 这种味道本身就是一种美味，但如果你想以男人的身份体验它，我也可以做到。]一种诱惑感在你的脑海中掠过，但还不足以阻止你；你的[hand]紧紧抓住她的尾巴，把它从你身上拉开。你不需要男人的装备来填满她，她看起来像是那种已经把自己的屁股塞满的类型，你通过扭动你手中的附肢，然后把尾巴尖塞进她的屁股里来证明这一点。[say: 哦，你这个调皮的小东西，]她一边呻吟一边调侃道。[say: 弯曲的时候温柔点。]");
            outputText("[pg]你无视了她的请求，将尾巴在她的肛门里快速抽插，速度快到她那条透明的小短裙上下翻飞。随着你的粗暴对待，她的不适感明显增加，你决定干脆把整根尾巴都塞进她的体内——这可是一项了不起的壮举。随着肠道被填满，她的腹部明显隆起，她因为尾巴塞得太深而痛苦地皱起眉头，直到最后，她尾巴唯一露在外面的部分紧紧夹在她的臀瓣之间。女恶魔松了一口气。[say: 真是了不起。现在都结束了吗？]");
            menu();
            addNextButton("像个男人",analMan).hint("她说她能让你像个男人一样体验，而且你可以用更多的东西塞进她体内。");
            addNextButton("尾巴操",analTail).hint("如果她的尾巴还不够，那就用你的。").disableIf(!get_player().hasPrehensileTail() && !get_player().hasTailInsteadOfLegs(),"这个场景需要一条灵活的尾巴。");
            addNextButton("离开",analLeave).hint("其实，是的，现在都结束了。");
         }
         else
         {
            outputText("你压在她身上，用[hands]捧起她柔软、线条优美的屁股。她立刻就明白了你的意图。[say:像大理石一样光滑，却又像棉花糖一样柔软，]她向你保证，并对你微笑。这种傲慢并不能为她赢得任何好感。[if (!isnaked) {很快，你脱下[armor]，露出身体，魅魔充满期待地看着你。}]你对前戏毫无兴趣，抓住你的[cock]，猛地插入她纯白的屁股，她发出一声愉悦的咕哝，冲击力让她的超短裙也随之颤抖。[if (cocklength < 6) {[say:下面真是个强壮的小兵，]她调侃道。|[if (cocklength > 10) {[say:太——]她还没说完，你就插得更深了。[say:太——太粗暴了。]|[say:太粗暴了，]她高兴地尖叫起来。}]}] [if (cocklength < 6) {你对现在的效果不满意，你抓住[if (multicock) {你的[cock 2]，和第一根一起强行塞进去|她绳子一样的尾巴，也强行塞进去}]，尽管增加了负担，恶魔还是发出了满足的颤抖。[if (!multicock) {虽然比以前更深入自己的屁股，但她还是高潮了。}] }]正如她所说，她里面[i:确实]有一种神奇的柔软。甚至连她的肛门环也以其温和的弹性吸引着你，同时保持着紧密的贴合。");
            outputText("[pg]适应了这种感觉后，你开始拔出，但又忍不住立刻插了回去。象牙魅魔用指甲划过你的手臂，诱惑地咬着嘴唇。[say:用你喜欢的任何方式占有我，]她低语道。你会的。你挺起[hips]，尽可能深地撞击，然后拔出，重复。这场嬉戏变得完全引人入胜，你全身心地拥抱着恶魔，" + (get_player().get_tallness() > ivoryHeight + 7 ? "把她的头按在你的[chest]上" : (get_player().get_tallness() < ivoryHeight ? "把你的头靠在她的胸前" : "把你的额头贴在她的额头上，当她凑过来深吻时，你欣然接受")) + "。迷失在色欲恶魔的诡计中并不是你的本意。你疯狂地摇了摇头，把她推开，拔出你的" + (get_player().cockTotal() > 1 && get_player().longestCockLength() < 6 ? "肉棒" : "[cock]") + "。");
            outputText("[pg]改变技巧，你抓住她的尾巴，把她拉回你身边，然后把她翻转过来，让她趴着，再次将[if (multicock) {一根|你的}]肉棒塞进她的屁股。[if (cocklength < 6) {[if (cocks > 2) {这一次，你把[if (cocks == 3) {三根|[i:两根]额外的工具}]一起挤进女恶魔诱人的屁股里|[if (multicock) {这一次，除了你的[cocktype 2]，你还把魅魔的尾巴弯过来，和这对肉棒一起塞进去|和之前不同，这一次她的尾巴自己弯了过来，先是绕过你的大腿，然后[if (hasBalls) {你的[ballsack]，最后|[if (hasVagina) {在你的阴唇之间，然后}]}]进入她的肛门，充满爱意地包裹着你的[cock]}]}]|[if (multicock) {这一次，你拿出[if (cocks>2) {一根|你的}]第二根肉棒，和第一根一起挤进去|这一次，你把女恶魔的尾巴弯过来，挤进去，陪伴已经插入的[cocktype]}]}]。她发出了狂喜的呻吟，但你迅速把她的脸按在泥土里" + (get_player().isInMountains() || get_player().isInHighMountains() ? "和碎石里" : "") + "，捂住了她的声音。弄乱她“完美”的容貌也许能打击一下她的傲慢。你顺着这个想法，在字面上和比喻上，把你的体重压在你的冲刺上，迫使这个美丽的灯塔磨损她心爱的光滑皮肤和精致缝制的紧身胸衣，用污垢的条纹点缀它。像这样强暴她的屁股相当宣泄。无论你在外面多么无情地对待她，她柔软的内脏都会用温柔、温暖的抓握抚摸你，即使你把她按住，让她的身体在地形上摩擦，也会不断回报你的努力。她试图抬起头，但你迅速把[hands]按下去，让她吃了一嘴");
            if(true == get_player().isInMountains() == true)
            {
               outputText("碎石");
            }
            else
            {
               _loc4_ = true == get_player().isInHighMountains();
               if(_loc4_ == true)
               {
                  outputText("碎石");
               }
               else
               {
                  _loc3_ = true == get_player().isInSwamp();
                  if(_loc3_ == true)
                  {
                     outputText("泥土");
                  }
                  else
                  {
                     _loc2_ = true == get_player().isInBog();
                     if(_loc2_ == true)
                     {
                        outputText("泥土");
                     }
                     else
                     {
                        _loc1_ = true == get_player().isInDesert();
                        if(_loc1_ == true)
                        {
                           outputText("沙子");
                        }
                        else
                        {
                           outputText("土壤");
                        }
                     }
                  }
               }
            }
            outputText("。恶魔咳嗽着，喷着唾沫。不过，如果她真的介意那才叫奇迹呢，因为她的尾巴" + (get_player().longestCockLength() < 6 && get_player().cockTotal() > 2 || get_player().cockTotal() > 1 ? "充满爱意地缠绕着你的[chest]和背部，这激发了你的灵感，你抓住那根绳子般的附肢，把它弯曲着绕在你的那堆阴茎上，然后把尖端塞进去。它毫不受影响，继续扭动和滑动" : "扭动和滑动") + "在你的[if (isgoo) {黏糊糊的}]肉棒上，试图榨干你的一切。你体内跳动的热量表明，那一刻已经不远了。接受了这一点，你重新调整了脚步，开始猛烈地抽插她，不顾一切地把魅魔干倒在地。她那高潮的尖叫声表明，无论她多么自恋，她也只是一个像其他色欲恶魔一样被使用和抛弃的性客体。当高潮重重地冲击你时，你的手臂短暂地失去了力量。这让你喘不过气来，你拥抱着她苍白的身体，一边射精一边将你的[hips]猛撞向她。曾经天鹅绒般的质地因为你不断的射精变得湿滑黏腻[if (cumnormal) {，这让你正常的精液产量痛苦地超负荷了}]。[if (cumhighleast) {从她的深处抽出，你挣扎着爬起来抓住她的角，强迫她面对你，然后把你的精液喷洒在她的脸上，对她的容貌进行最后一次攻击。一旦你把她涂得满满的，你就把[if (multicock) {一根|那根}]肉棒塞进她的嘴里把它清理干净。}]最后，你停下来休息。");
            outputText("[pg]在安静了几分钟后，你恢复了平静，并[if (cumhighleast) {离开|从她体内抽出}]。");
            get_player().orgasm("Dick");
            dynStats(DynStat.Cor(2));
            get_combat().cleanupAfterCombat();
         }
      }
   }
}

