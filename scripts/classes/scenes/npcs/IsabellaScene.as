package classes.scenes.npcs
{
   import classes.Appearance;
   import classes.CoC;
   import classes.Cock;
   import classes.CockTypesEnum;
   import classes.DynStat;
   import classes.Monster;
   import classes.PerkLib;
   import classes.Player;
   import classes.PregnancyStore;
   import classes.StatusEffects;
   import classes.TimeAwareInterface;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.display.SpriteDb;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.items.Weapon;
   import classes.scenes.Camp;
   import classes.scenes.combat.Combat;
   import coc.view.CoCButton;
   import flash.Boot;
   import haxe.IMap;
   
   public class IsabellaScene extends NPCAwareContent implements TimeAwareInterface
   {
      
      public static var OFFSPRING_HUMAN_BOYS:int = 1;
      
      public static var OFFSPRING_HUMAN_GIRLS:int = 2;
      
      public static var OFFSPRING_HUMAN_HERMS:int = 3;
      
      public static var OFFSPRING_COWGIRLS:int = 4;
      
      public static var OFFSPRING_COWFUTAS:int = 5;
      
      public static var ISABELLA_PREGNANCY_LAST_STAGE:int = 240;
      
      public var pregnancy:PregnancyStore;
      
      public var isabellaOffspringData:Array;
      
      public var checkedIsabella:int;
      
      public function IsabellaScene()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         isabellaOffspringData = [];
         checkedIsabella = 0;
         super();
         pregnancy = new PregnancyStore(2214,2215);
         pregnancy.addPregnancyEventSet(25,[2160,1920,1680,1440,1200,960,720,480,240]);
         CoC.timeAwareClassAdd(this);
      }
      
      public function volunteerToSlurpCowCunt() : void
      {
         spriteSelect(SpriteDb.get_s_isabella());
         clearOutput();
         outputText("你向伊莎贝拉表示，你其实更想尝的不是她的奶，而是她本人。肤色黝暗的牛娘呆呆地看着你，一时没明白你的意思。你还没来得及解释，她的脸颊就泛起了绯红——她终于明白了。红发女人小声问道，");
         if(isabellaAccent())
         {
            outputText("[say: 你是说，想舔我那里？]伊莎贝拉再次抢在你开口前行动了起来，不过这一次，她是掀起裙摆，慢慢分开了双腿。衣料的阴影遮住了里面的宝物，但一丝淡淡的女性气息飘入你的鼻中，证明她和你一样期待。[pg]");
         }
         else
         {
            outputText("[say: 你是说，想舔我那里？]伊莎贝拉再次抢在你开口前行动了起来，不过这一次，她是掀起裙摆，慢慢分开了双腿。衣料的阴影遮住了里面的宝物，但一丝淡淡的女性气息飘入你的鼻中，证明她和你一样期待。[pg]");
         }
         outputText("伊莎贝拉把身上的衣物又往上拉了些，将裙子折到束腰上，让你能毫无遮挡地看见她的女性部位。她的小穴被丰腴大腿上古铜色的肌肤衬托着，将她的女人味展露无遗。上方一丛鲜亮的红色阴毛被修剪成整齐的小泪滴形状，与她因兴奋而涨红、微微肿胀的外阴相得益彰。你俯下身，滑到她两腿之间，眼看着她下身的唇瓣变得更加饱满，又随着牛娘每一次情欲满溢的喘息而缓缓分开。她开始渗出的微黏淫液悬在逐渐张开的唇瓣之间，像一层被慢慢拉长的薄纱。[pg]");
         if(get_player().cor < 33)
         {
            outputText("你有些迟疑地越靠越近，直到距离牛娘湿滑的小穴只剩几英寸。空气中几乎都弥漫着她的期待。一只有力而急切的手抓住你的后脑，把你往前一推，让你的鼻子和嘴唇埋进她湿润、啧啧作响的唇瓣里。");
         }
         else if(get_player().cor < 66)
         {
            outputText("你急切地越靠越前，直到距离牛娘湿滑的褶缝不到一英寸，空气中弥漫着情欲的期待。你还没来得及扑上去，她的手就抓住你的后脑，硬是把你按进她里面。她贪婪的唇瓣伴着一声湿漉漉的啧响，将你的鼻子和嘴唇吞没。");
         }
         else
         {
            outputText("你毫不害臊地一头埋进牛娘被情欲润湿的小穴里。她贪婪的唇瓣伴着一声湿漉漉的啧响，将你的鼻子和嘴唇吞没，但牛娘似乎还不太满足，直到她把手按在你的后脑上，粗暴地将你的[face]在她性器上来回碾压。");
         }
         outputText("你贴着她颤抖的阴唇露出笑意，张开嘴，将她的爱钮含入口中，让舌头醉醺醺地在她的甬道里游走。红发女人的大腿正好让你用双臂和双手环抱住；当你的手指陷入那柔软的肉里时，你逐渐进入了节奏，交替着吮吸、舔弄，并对着她逐渐长大的阴蒂发出低哼。[pg]");
         if(isabellaAccent())
         {
            outputText("伊莎贝拉呻吟道，[saystart]噢，是呀……你很会这个。嗯，继续舔，");
            if(get_player().get_tallness() < 60)
            {
               outputText("小");
            }
            else if(get_player().get_tallness() > 80)
            {
               outputText("大");
            }
            outputText("[boy]。[sayend]仿佛你还需要什么鼓励似的。她的味道出乎意料地甜美清新，只有一丝像她这样强壮的女人才会有的微微酸味。随着你更加主动地用舌头舔弄，她按住你的手也放松下来；你把嘴唇紧紧贴在她的外阴上，让舌头探入她阴唇的每一道褶缝。期间，牛娘那正在发育的阴蒂仍在你口中不断胀大，而你一有机会就吮住它，直到它完全涨到一英寸半长为止。[pg]");
            outputText("[say: 别停！对，舔伊莎贝拉妈妈的小豆豆！呀——对！对！]深色皮肤的女人低吼着。她粗壮的大腿像剪刀般合拢，用柔软却如虎钳般的压力把你锁在原位。每一次你吮舔她那加大号的女性器官，都有一缕缕蜜甜的淫液流到你的舌头上。它在你唇间搏动着，而每当牛娘发出颤抖的低哼，或是从唇边漏出几乎不成声的呻吟，伊莎贝拉的双腿就会猛地收紧。她喘息着说，[say: 舌头真会操的小家伙……我——噢噢噢……我是不是不该放你走，呀？就把你留在你该待的地方，待在伊莎贝拉的大腿中间——当一只专门用舌头伺候人的口交宠物。][pg]");
         }
         else
         {
            outputText("伊莎贝拉呻吟着叫道，[saystart]噢噢……对……你很会这个。嗯嗯，继续舔，");
            if(get_player().get_tallness() < 60)
            {
               outputText("小");
            }
            else if(get_player().get_tallness() > 80)
            {
               outputText("大");
            }
            outputText("[boy]。[sayend]仿佛你还需要什么鼓励似的。她的味道出乎意料地甜美清新，只有一丝像她这样强壮的女人才会有的微微酸味。随着你更加主动地用舌头舔弄，她按住你的手也放松下来；你把嘴唇紧紧贴在她的外阴上，让舌头探入她阴唇的每一道褶缝。期间，牛娘那正在发育的阴蒂仍在你口中不断胀大，而你一有机会就吮住它，直到它完全涨到一英寸半长为止。[pg]");
            outputText("[say: 别停！对，舔伊莎贝拉妈妈的小豆豆！对！对！]深色皮肤的女人低吼着。她粗壮的大腿像剪刀般合拢，用柔软却如虎钳般的压力把你锁在原位。每一次你吮舔她那加大号的女性器官，都有一缕缕蜜甜的淫液流到你的舌头上。它在你唇间搏动着，而每当牛娘发出颤抖的低哼，或是从唇边漏出几乎不成声的呻吟，伊莎贝拉的双腿就会猛地收紧。她喘息着说，[say: 舌头真会操的小家伙……我——噢噢噢……我是不是不该放你走，嗯？就把你留在你该待的地方，待在伊莎贝拉的大腿中间——当一只专门用舌头伺候人的口交宠物。][pg]");
         }
         if(get_player().cor < 33)
         {
            outputText("听到她的话，你脸上一红，希望她只是说些淫话助兴而已。");
         }
         else if(get_player().cor < 66)
         {
            outputText("听到她的话，你脸上一红，忍不住想：如果她不是在说淫话助兴，那会是什么样子。");
         }
         else
         {
            outputText("尽管知道她大概只是情到浓时说说而已，你还是觉得这个想法颇有吸引力；不过，如果把角色反过来，或许会更火辣？");
         }
         outputText("有什么东西溅到你的[armor]上，又顺着你的背流下来。那东西温热、潮湿，正是体温的温度。难道只是被舔了几下小穴，她就开始漏奶了吗？你好奇她到底会滴到什么程度，便重新投入手头的活儿。她下身的汁水几乎和上面一样丰沛，你舔弄她小穴的时候，不时还得吞下满口她的淫液。[pg]");
         outputText("伊莎贝拉带着浓重口音的嗓音因快感而高喊起来，音调飙升到几乎刺耳的高度；她的大腿和小穴也开始在你周围痉挛。倒还不至于疼，但一种被翻涌的古铜色海洋包围的诡异感觉，不由自主地浮现在你脑海里。浓稠得惊人的乳汁溅满你的头和后背，像水龙头出水一样倾泻而下。与此同时，她渴求的气味变得更加强烈，熏得你头晕目眩；而持续涌出的淫液则逼得你不是吞咽，就是被呛住。你沉浸在不断吞咽之中，直到奶水的飞溅渐渐停下、那双大腿从你耳边松开时，你才勉强察觉到。[pg]");
         outputText("按在你头上的有力手掌最后又把你往前推了一下，把你的脸涂满牛娘的淫液，随后才把你拉开，拽着你站起来。伊莎贝拉眼帘半垂，显得疲惫而满足。她的上衣已经被浓稠、甜香的乳白液体完全浸透，你甚至能看见一些没能从她颤动乳沟中流出去的小小奶洼。牛娘把你拉向前，嘴唇重重压上你的唇，粗鲁又湿漉漉地吻着你；她那又长又扁的舌头滑过你的嘴唇和脸颊，把上面的汁液舔干净。她放开你，看着你踉跄后退，咯咯笑了起来；你们嘴唇之间还挂着一缕混着精液味的唾丝。[pg]");
         if(!isabellaAccent())
         {
            outputText("伊莎贝拉满足地叹了口气，说道：[say: 谢谢你，[name]。你真是个了不起的舔小穴好手。也许哪一次，我会把你留给我自己，呀？开玩笑，开玩笑。]她猛地红了脸，仿佛这才意识到自己刚刚说了什么，随后转身忙着收拾起来。你穿好衣服，却很难掩饰这番举动在你体内激起的欲火。[pg]");
         }
         else
         {
            outputText("伊莎贝拉满足地叹了口气，说道：[say: 谢谢你，[name]。你真是个了不起的舔小穴好手。也许哪一次，我会把你留给我自己，嗯？开玩笑，开玩笑。]她猛地红了脸，仿佛这才意识到自己刚刚说了什么，随后转身忙着收拾起来。你穿好衣服，却很难掩饰这番举动在你体内激起的欲火。[pg]");
         }
         dynStats(DynStat.Lust(10 + get_player().lib / 10));
         if(get_player().hasCock())
         {
            outputText("牛娘忽然回头瞥了一眼你的胯下");
            if(get_player().shortestCockLength() <= tinyPenis())
            {
               outputText("随后又提出了别的事。[saystart]也许你可以脱掉衣服？我");
               if(isabellaAccent())
               {
                  outputText("想回报你一下。[sayend]");
               }
               else
               {
                  outputText("想回报你一下。[sayend]");
               }
               doYesNo(izzyGivesSmallWangsFreeOral,get_camp().returnToCampUseOneHour);
               return;
            }
            outputText("随后惆怅地叹了口气。");
         }
         get_isabellaFollowerScene().isabellaAffection(2);
         if(!isabellaFollower() || !get_player().hasVagina() || get_player().biggestTitSize() < 1)
         {
            doNext(get_camp().returnToCampUseOneHour);
         }
         else
         {
            if(!isabellaAccent())
            {
               outputText("看到你的身体——湿滑而准备好的小穴，以及挺立的乳头——如此明显地表现出刚才服侍她所激起的强烈欲望，牛娘微微一笑，问道：[say: 或许你也想让我回报一下？这样才公平，不是吗……]");
            }
            else
            {
               outputText("看到你的性服务如此明显地在你身体上激起了热切的欲望——那湿滑待入的小穴和挺立的乳头就是明证——牛娘微微一笑，问道：[say:也许你想让偶也回报你一下？这样才算公平……]");
            }
            menu();
            addButton(0,"被舔舐",get_isabellaFollowerScene().receiveAllTheCowTOngues);
            setExitButton();
         }
      }
      
      public function victoryLactation69() : void
      {
         clearOutput();
         outputText("好吧，既然她提到了奶水，你的" + get_player().allBreastsDescript() + "确实感觉有点胀，因为你自己的乳汁重量而肿胀。甚至你的[nipples]也感觉胀鼓鼓的，准备好被吸吮了。你带着恶魔般的笑容，在俯卧的牛娘美人周围踱步，并嘲弄她，非常淫荡地暗示你将如何吸干她的乳房，同时强迫她大口吞下你自己的珍珠般液体。她的眼睛睁得大大的，先是震惊，然后是越来越强烈的欲望。当你在她头部停下并解开你的[armor]的绑带时，这位牛娘的面容柔和下来，变成了顺从的接受。[pg]");
         outputText("伊莎贝拉嘟囔着，");
         if(isabellaAccent())
         {
            outputText("[say: 哞哞奶？嗯，听起来确实有点不……]");
         }
         else
         {
            outputText("[say: 哞奶？听起来确实挺不……]");
         }
         outputText("一条牛舌滑过她暗色的嘴唇，打断了她的喋喋不休，同时为她即将到来的盛宴润湿了嘴唇。这个母牛婊子假装矜持，但骨子里却是个饥渴的荡妇——看看她那沾满唾液的嘴唇、起伏不定几乎遮不住的胸部，还有那充满渴求、乞怜的眼神就知道了。她想要这个。你拉扯她的上衣，但衣服只是被拉伸而没有撕裂。受到这种弹性布料的启发，你把它往下拉，松开她的束腰，把她的衬衫卷到伊莎贝拉那丰满的乳房下面。[pg]");
         outputText("不知不觉中，你的[nipples]尖端开始渗出乳汁，你把这当作你的身体准备好教训伊莎贝拉的信号。你俯下身，让你的");
         if(int(get_player().breastRows.length) > 1)
         {
            outputText("最上面一排");
         }
         outputText("[breasts]悬在伊莎贝拉的头上，但她的角不舒服地戳着你的乳房。你稍微弓起背，调整了一下姿势，让你的其中一个圆润的肉球压在这个母牛娘的脸上，乳头流出的奶水顺着她的脸颊流下。她那丰满的乳房就在你下方一两英寸的地方，散发着令人愉悦的甜味和奶油味。[pg]");
         outputText("伊莎贝拉几乎立刻就含住了，用力吸吮，让你的乳汁流出并大口吞咽。她的一只手挤压着她古铜色的乳房，把乳晕推得更高，正好塞进你惊讶地张成“O”形的嘴里。味道温暖而甜美，就像从四个乳头尖喷射到你喉咙里的奶水一样。你轻松地吞咽下去，甚至出于本能，每次吞咽后你都开始吸吮，让越来越多的奶油味牛奶重新充满你的嘴巴。这个胸部丰满的红发女郎的嘴唇吸了又吸，只有在她的舌头舔舐你[nipple]上的奶水时才会停顿。[pg]");
         outputText("你觉得你已经失去了对局面的控制，或者至少放弃了一部分控制权，以换取共享的乳汁带来的极乐。好吧，总比嘴里含着胀满的乳头，而一个饥渴的榨汁荡妇把你肿胀乳房里的酸痛压力吸干要好。你能感觉到它从你的[nipple]流出时的起伏，慢慢地用一种感官上的、几乎是色情的释放取代了压抑的不适。沉重的眼皮颤动着闭上，你完全专注于你的嘴和胸部，与你的“受害者”以完美的、充满乳汁的节奏吸吮和喷射。[pg]");
         outputText("空气中弥漫着奶油和欲望的浓郁香气。伊莎贝拉在你身下扭动，她大腿的人类部分因为汗水和淫液变得湿滑。她扭动着，把空出的手伸进被液体浸湿的裙摆下寻求释放。");
         outputText("你跟着她的动作，向后伸手去");
         if(get_player().hasCock())
         {
            outputText("轻轻挤压[eachcock]，感受着沉重、肿胀的肉块随着你的每一次心跳而跳动。");
         }
         else if(get_player().hasVagina())
         {
            outputText("用手指摩擦你阴户肿胀的阴唇，感觉你的外阴张开，让沾满汁液的手指进入。");
         }
         else
         {
            outputText("用手指顺着会阴摸到你紧闭的后庭，用一根手指在紧闭的肛门周围画圈，然后把它埋进去。");
         }
         outputText("[pg]");
         outputText("伊莎贝拉的奶水越来越甜的味道在你胸部被吸干的同时戛然而止，你们俩在某种默契的配合下同时换到了下一个乳房。[pg]");
         outputText("随着你们的肚子被填满，引发这一切的冲突似乎变成了一个遥远的梦，随着每一次性释放的爆发和吞咽珍珠般的乳汁而消散。伊莎贝拉愉悦的哞哞声震动着你的[nipple]，增加了你自己的");
         if(int(get_player().breastRows.length) > 1)
         {
            outputText("，而你的另一个" + get_player().breastDescript(1) + "把她的红发贴在她的头皮上");
         }
         outputText("。她的臀部在地上挺动扭曲，她自慰的吧唧声充斥着空气，就像她抽插的手指填满了她的阴户一样。");
         if(get_player().hasVagina())
         {
            outputText("当然，你也在同样用力地抽插自己的阴户，但这个邋遢的牛娘的动静还是盖过了你的声音。");
         }
         else if(get_player().hasCock())
         {
            outputText("当然，你也在同样用力地抽插[eachcock]，但你自慰的声音很容易就被这个热情的牛娘盖过了。");
         }
         else
         {
            outputText("当然，你也在同样用力地抠弄你的[asshole]，但当你侵犯它时，那个肌肉发达的洞几乎没有发出任何声音。");
         }
         outputText("牛娘因为高潮而从头到脚颤抖着，当她从四个乳头尖把奶水喷到你的舌头上时，奶水变稠成了甜奶油。[pg]");
         outputText("大口吞咽着伊莎贝拉高潮时喷出的乳汁，片刻之后，你自己的高潮也开始酝酿，从你喷射乳汁的[nipple]和");
         if(get_player().hasCock())
         {
            outputText(get_player().multiCockDescriptLight());
         }
         else if(get_player().hasVagina())
         {
            outputText(get_player().vaginaDescript());
         }
         else
         {
            outputText(get_player().assholeDescript());
         }
         outputText("蔓延开来。你弓起背，用你那晃动的丰满乳房压住牛娘的脸，把最后一点乳汁都排进她嘴里，把她当成了你私人的吸乳器。");
         if(get_player().hasFuckableNipples())
         {
            outputText("伊莎贝拉把舌头伸向你的[nipple]，深深地钻进那不寻常的通道，想要吸干你最后的液体馈赠，却无意中加剧了你的快感。你的手臂失去了力气，倒在了她身上，把她埋在你的乳房里，而她的乳房则成了你的枕头。");
         }
         if(get_player().get_gender() == 3)
         {
            if(get_player().wetness() == 5)
            {
               outputText("从你的[vagina]里飞溅出来的汁液似乎只是事后的点缀，但当你高潮时，你<i>全身上下</i>都在高潮。");
            }
            else if(get_player().wetness() > 3)
            {
               outputText("从你的[vagina]里滴落的汁液似乎只是事后的点缀，但当你高潮时，你全身上下都在高潮。");
            }
            else
            {
               outputText("你的[vagina]的紧缩似乎只是事后的点缀，但当你高潮时，你全身上下都在高潮。");
            }
         }
         if(get_player().hasCock())
         {
            outputText("随着几下有力的抽插，[eachcock]变得坚硬如石");
            if(get_player().balls > 0)
            {
               outputText("，你的[balls]紧紧地贴着你的腹股沟");
            }
            outputText("。温暖的感觉从你的腹股沟蔓延开来，一股股精液喷射在泥土上，有几股甚至打在了伊莎贝拉的头上。她似乎完全没有察觉，也没有在意，她全神贯注地吸吮着你的乳汁。");
            if(get_player().cumQ() >= 1000)
            {
               outputText("你喷射和滴落了很久，在你们周围形成了一个大水坑。");
            }
         }
         if(get_player().get_gender() == 2)
         {
            outputText("不断地抠挖你的[vagina]达到了目的，让你那柔软的通道像老虎钳一样紧紧地夹住入侵的手指。");
            if(get_player().wetness() >= 4)
            {
               outputText("汁液从你的小穴里喷射出来，溅在泥土上。");
            }
            else if(get_player().wetness() >= 2)
            {
               outputText("淫液从小穴里滴落，渗入泥土中。");
            }
            else
            {
               outputText("淫液浸透了你的阴唇，空气中弥漫着雌性的淫欲。");
            }
            outputText("你的拇指每一次拂过，你的[clit]都会跳动和脉动，你几乎迷失在这享乐主义的自我安慰中。");
         }
         if(get_player().get_gender() == 0)
         {
            outputText("不断地抠挖你的[asshole]终于有了结果，从你的肛门通道传来阵阵快感。那颗星星紧紧地夹住你的手指，不由自主地收缩着，包裹着入侵者。");
         }
         outputText("[pg]");
         outputText("乳房被吸空，乳头隐隐作痛，你侧过身，和伊莎贝拉一起躺在泥土上");
         if(!isabellaFollower())
         {
            outputText("的营地");
         }
         outputText("。你们互相打量着对方，舔去嘴唇上最后的乳汁，共享着这一刻。她先开口，用嘴型说道，");
         if(isabellaAccent())
         {
            outputText("[say: 刚才真不错……是个平息怒火的好办法。下次我们打架的时候……再来一次吧！]");
         }
         else
         {
            outputText("[say: 刚才真不错……是个平息怒火的好办法。下次我们打架的时候……再来一次吧！]");
         }
         outputText("你点点头，这位沉浸在极乐中的牛娘闭上了眼睛，心满意足地抚摸着你给她带来的微凸小腹。片刻之后，你恢复了体力，但由于体内充满了乳汁，你很难再穿上你的[armor]。");
         if(!isabellaFollower())
         {
            get_isabellaFollowerScene().isabellaAffection(8);
         }
         get_player().slimeFeed();
         get_player().addStatusValue(StatusEffects.Feeder,1,1);
         get_player().changeStatusValue(StatusEffects.Feeder,2,0);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,260,0);
         get_player().orgasm("Tits");
         get_combat().cleanupAfterCombat();
      }
      
      public function victoryAgainstIzzzzzySixtyNine() : void
      {
         var _loc1_:int = get_player().cockThatFits(38);
         if(_loc1_ < 0)
         {
            _loc1_ = 0;
         }
         clearOutput();
         outputText("不过你对她的奶水不感兴趣。你来是为了另一种释放，伊莎贝拉应该庆幸你打算和她分享。这头困惑、被击败的母牛睁着大大的、无助的眼睛看着你脱下衣服，把你的[armor]重重地扔在她的地毯上。她的裙子应该不成问题；轻轻一推，它就堆积在伊莎贝拉的腰间。随着这件碍事的衣物被移开，你可以好好看看你打算在接下来的十五分钟左右<b>亲密</b>接触的景象。[pg]");
         outputText("在你面前的是");
         if(!get_player().hasStatusEffect(StatusEffects.Edryn))
         {
            outputText("你所见过的最丰满、最多汁的阴唇，你真想舔一舔。");
         }
         else
         {
            outputText("自从你遇到埃德琳以来，你见过的最丰满、最多汁的阴户。");
         }
         outputText("它们闪闪发光并不让你感到惊讶，或者她的下体慢慢分开，露出她小指大小的阴蒂和湿润的通道，但让你惊讶的是这位红发女郎的嘴唇散发出的甜美、宜人的气味。在全神贯注地看着这挑逗的展示后，你终于注意到她入口上方水滴状的红色阴毛。它似乎与她绽放的“花朵”完美匹配，随着母牛阴户不断、紧张的蠕动而起伏。[pg]");
         outputText("你蜿蜒地扭动着，将你的[hips]滑过伊莎贝拉，直到你的腹股沟悬停在她的嘴上，你的[legs]擦过她的耳朵。她试探性地张开嘴，舌头舔着她那暗色的嘴唇，把它们张得大大的。牛娘抓住你的" + get_player().assDescript() + "，完全知道她该做什么，然后拉起来去");
         if(get_player().get_gender() == 2)
         {
            outputText("蹭你的" + get_player().vaginaDescript(0) + "，用她的嘴唇涂抹你的阴户，甚至她分开褶皱来接触你的[clit]");
         }
         else if(get_player().cockThatFits(38) != -1)
         {
            outputText("把你的" + get_player().cockDescript(_loc1_) + "整个吞下去，用她光滑、沾满口水的舌头在它的每一寸上游走");
         }
         else
         {
            outputText("舔你的" + get_player().cockDescript(_loc1_) + "，用她长而光滑的舌头以人类无法做到的方式爱抚它");
         }
         outputText("。[pg]");
         outputText("这位美丽的牛娘暂停了她的动作，向你的生殖器吹着热气，等待你的回报。对于一个刚刚输掉战斗的人来说，她确实很自以为是。你俯下身去舔她的阴户，感觉她耻骨丘上方出奇柔软的毛发在你的下巴上发痒。天鹅绒般的褶皱像窗帘一样拉开，你用舌头在上面抽打，只是勉强将舌尖伸进她的通道去品尝她。她尝起来和她闻起来一样甜，只有一丝酸味附着在你的舌头上。现在你避开她肿胀的阴蒂——这个婊子必须赢得那个大花蕾将要得到的任何快感。[pg]");
         if(get_player().get_gender() == 2)
         {
            outputText("伊莎贝拉热情地回到了她的任务中，深深地、用力地舔着阴户，把她那修长的舌头深深地植入你的体内。她的嘴唇环绕着你的[clit]，");
            if(get_player().getClitLength() >= 5)
            {
               outputText("与那像肉棒一样的附属物搏斗");
            }
            else if(get_player().getClitLength() >= 2)
            {
               outputText("缓慢而有节奏地吸吮着那个大按钮");
            }
            else
            {
               outputText("吞噬着那个小花蕾");
            }
            outputText("甚至当她舌头光滑的皮肤不经意间抚摸它时。你扭动着身体，你的汁液");
            if(get_player().wetness() < 3)
            {
               outputText("包裹着她的舌头");
            }
            else if(get_player().wetness() < 4)
            {
               outputText("四处流淌");
            }
            else
            {
               outputText("每次她碰到特别敏感的地方时都会喷水");
            }
            outputText("。伊莎贝拉的舌头卷成管状，开始在你体内像活塞一样进进出出，像任何阴茎一样用力地操你，同时还保持着灵活性，在里面拱起并按压你所有的敏感点。你在她精湛的技巧下颤抖，被地狱般的快感轰炸。");
         }
         else if(get_player().cockThatFits(38) != -1)
         {
            outputText("伊莎贝拉兴致勃勃地继续她的工作，用嘴唇包裹住你的");
            if(get_player().hasSheath())
            {
               outputText("包皮");
            }
            else
            {
               outputText("根部");
            }
            outputText("并吸吮着，直到她的脸颊因真空而凹陷。同时，她的舌头在" + get_player().cockDescript(_loc1_) + "周围抽打，甚至在它卷住你的阴茎时发出吸溜声。它缓慢地绕着它转圈，逐渐形成一个紧密的、由舌头组成的茧，在它绕着你滑动时挤压着，释放出地狱般的快感。");
            if(get_player().cockTotal() > 1)
            {
               outputText("她无视了你其他的阴茎");
               if(get_player().cockTotal() > 2)
               {
                  outputText("，任由它们涂抹在她的脸颊上，专注于这根完美匹配的标本。");
               }
               else
               {
                  outputText("，任由它涂抹在她的脸颊上，专注于这根完美匹配的标本。");
               }
            }
         }
         else
         {
            outputText("伊莎贝拉兴致勃勃地继续她的工作，用舌头包裹住");
            if(get_player().hasSheath())
            {
               outputText("包皮");
            }
            else
            {
               outputText("根部");
            }
            outputText("好几次，然后上下摆动她的头。她把舌头当成某种飞机杯来用，那温暖、湿滑的压力让你的" + get_player().cockDescript(_loc1_) + "想要在快感中融化。牛娘一直滑到顶端");
            if(get_player().hasKnot(_loc1_))
            {
               outputText("，在肉结处挣扎");
            }
            else if(get_player().cocks[_loc1_].get_cockType() == CockTypesEnum.HORSE)
            {
               outputText("，卡在中间的环处");
            }
            else if(get_player().cocks[_loc1_].get_cockType() == CockTypesEnum.DEMON)
            {
               outputText("，被所有的凸起减缓了速度");
            }
            else if(get_player().cocks[_loc1_].get_cockType() == CockTypesEnum.CAT)
            {
               outputText("，被所有的倒刺减缓了速度");
            }
            else if(get_player().cocks[_loc1_].get_cockType() == CockTypesEnum.TENTACLE)
            {
               outputText("，停在蘑菇状的龟头下方");
            }
            else if(get_player().cocks[_loc1_].get_cockType() == CockTypesEnum.ANEMONE)
            {
               outputText("，因为你那海葵般的肉棒给她的“刺痛”而咯咯直笑");
            }
            else
            {
               outputText("，把嘴唇贴在你的尿道隆起处摩擦");
            }
            outputText("然后在你的开口处印下一吻。她温柔地亲吻着你的精孔，同时让她的舌鞘紧紧包裹着你的阴茎。你因她精湛的技巧而颤抖，被地狱般的快感轰炸着。");
         }
         outputText("[pg]");
         outputText("有这样一位天才在你的腹股沟处工作，你很害怕她会先让你高潮——谁知道当你因高潮而虚弱时，她聪明的头脑会想出什么样的报复手段！你加倍努力，舔舐她的阴唇，吸吮她的阴蒂，并把你的整张脸紧紧贴在她身上，力度大到能感觉到她的阴唇在你的鼻子周围分开。");
         if(get_player().hasMuzzle())
         {
            outputText("这给了你一个主意，你挪动了一下，闭上嘴巴。片刻之后，你猛地向下，将你的口鼻深深埋入那泥泞的小穴中。它令人愉悦地在你周围伸展，你感觉到呻吟声在你的胯下震动。");
         }
         else
         {
            outputText("她的阴蒂碰到了你的鼻子，你决定是时候彻底制服伊莎贝拉了。你把那颗肉核吸进嘴里，举起一只手。然后，伴随着一阵模糊的动作，你将拳头插入她张开的裂口，并疯狂地舔舐她的阴蒂。作为回应，你感觉到呻吟声在你的腹股沟处震动。");
         }
         outputText("浓稠的乳液从你身下喷涌而出，前几股喷射弄脏了你的肚子，随后喷泉变成了乳白色的消防水龙带。[pg]");
         if(get_player().get_gender() == 2)
         {
            outputText("就在你沉浸在胜利的喜悦中时，伊莎贝拉高潮时发出的嗡嗡的愉悦尖叫声穿过她的嘴唇和舌头，直达你的[clit]。高潮的冲击力如此之大，让你手臂失去了力量，你瘫倒在牛娘身上，下意识地将你的[hips]在她的脸上摩擦。你的[vagina]起伏并收缩，挤压着伊莎贝拉的舌头，仿佛能从里面挤出某种精液。满嘴的小穴并没有阻止你发出高潮的叫声，当你");
            if(get_player().wetness() < 5)
            {
               outputText("喷射");
            }
            else
            {
               outputText("滴落");
            }
            outputText("进伊莎贝拉的嘴里时，她也以同样的强度在你的嘴里尖叫。你们汗流浃背的身体花了一些时间才停止因快感而颤抖。");
         }
         else if(get_player().cockThatFits(38) != -1)
         {
            outputText("就在你沉浸在胜利的喜悦中时，伊莎贝拉发出的嗡嗡的愉悦尖叫声震动了你整个" + get_player().cockDescript(_loc1_) + "。舌套颤抖并痉挛，随着你失去控制而失去凝聚力。精液从你的顶端冒出气泡，在伊莎贝拉吞下之前，涂满了她的舌头、喉咙和脸颊。一大口吞咽之后，她吞下了");
            if(get_player().cumQ() >= 250)
            {
               outputText("它，但你才刚刚开始。下一股精液用乳液填满了牛娘的嘴巴，再下一股几乎让她窒息。她吞下了每一滴咸咸的液体");
               if(get_player().cumQ() >= 500)
               {
                  outputText("，但你还在继续射精，每一次喷发都将越来越多的精液泵入她的口腔");
               }
               if(get_player().cumQ() >= 1000)
               {
                  outputText("。在她的肚子被填满后，她放弃了，向后退去，让你把剩下的射在她的脸上");
               }
               if(get_player().cumQ() >= 1500)
               {
                  outputText("。当你结束时，她棕褐色的脸庞上涂满了厚厚的一层精液");
               }
            }
            else
            {
               outputText("你所有的精液");
            }
            outputText("。");
         }
         else
         {
            outputText("就在你沉浸在胜利的喜悦中时，伊莎贝拉高潮时发出的嗡嗡的愉悦尖叫声穿过她的嘴唇和舌头，顺着你的肉棒蔓延。这种效果是深刻而直接的，就在伊莎贝拉失去对她口腔名器控制的同时，高潮席卷了你的" + get_player().cockDescript(_loc1_) + "。它颤抖并跳动了一秒钟，随后第一股精液从顶端喷出，溅在伊莎贝拉薄薄的白色衬衫上。下一股没有飞那么远，落在了她的领口上。之后，你将几股精液倾泻在她的脸上。");
            if(get_player().cumQ() > 250)
            {
               outputText("远未结束，你把足够多的精液倾倒在她的胸部和头上，给它们都均匀地涂上一层釉");
               if(get_player().cumQ() > 500)
               {
                  if(get_player().cumQ() > 1000)
                  {
                     outputText("，不知为何，你的高潮还在继续，在伊莎贝拉身下积起了一滩精液泥潭");
                  }
                  else
                  {
                     outputText("。她的上衣紧紧贴在身上，勾勒出胸部的每一道曲线，以及她那奇特乳头的许多尖端");
                  }
               }
               outputText("。");
            }
         }
         if(get_player().cockTotal() > 1)
         {
            outputText("在整个过程中，你感觉自己就像在进行一场单人颜射表演，从你的[cocks]中喷射出精液，洒在正在高潮的牛娘身上。");
         }
         outputText("[pg]");
         outputText("终于完全满足了，你翻身离开，");
         if(get_player().hasCock())
         {
            outputText("当你的阴茎从她的舌头上解脱出来时，你抽搐了一下。");
         }
         else
         {
            outputText("当你的阴蒂最后一次碰到她的舌头时，你虚弱地抽搐了一下。");
         }
         outputText("你花了一会儿才喘过气来，但一旦恢复，你便带着焕发的活力和满足感站了起来——伊莎贝拉正神志不清地喘着粗气。你俯身倾听，她低语道：[say: ……爱你。舔舔舔，吸溜吸溜，射射！好玩好玩，射射……] 这可怜的女孩完全沉浸在极乐之中了！见鬼，听起来她已经原谅了你的粗暴对待，理应如此。[pg]");
         outputText("你穿好衣服，微笑着离开了。");
         get_player().orgasm("Generic");
         if(!isabellaFollower())
         {
            get_isabellaFollowerScene().isabellaAffection(9);
         }
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,260,0);
         get_player().slimeFeed();
         if(get_game().get_inCombat())
         {
            get_combat().cleanupAfterCombat();
         }
         else
         {
            doNext(get_camp().returnToCampUseOneHour);
         }
      }
      
      public function vaginalProdNPokeIsabella() : void
      {
         var _loc1_:int = get_player().cockThatFits(get_monster().vaginalCapacity());
         if(_loc1_ < 0)
         {
            _loc1_ = 0;
         }
         clearOutput();
         outputText("你低头看着伊莎贝拉，嘴角勾起一抹坏笑，告诉她乳汁是你最不关心的东西。这位");
         if(get_monster().get_lust() >= get_monster().maxLust())
         {
            outputText("充满欲望的");
         }
         else
         {
            outputText("战败的");
         }
         outputText("牛娘脸色苍白地问道，");
         if(isabellaAccent())
         {
            outputText("[say: 可是为什喵不呢？我的奶水那么好喝。]");
         }
         else
         {
            outputText("[say: 可是为什么不呢？我的奶水那么好喝。]");
         }
         outputText("最后一个词的“o”音被拉得极长，听起来几乎像是一声牛叫。你推开她的双腿，掀起她的裙子，露出她女性的裂缝。她甚至懒得穿内裤，所以没有什么能保护她那");
         if(get_monster().get_HP() < 1)
         {
            outputText("慢慢充血的");
         }
         else
         {
            outputText("被汁液润滑的");
         }
         outputText("阴唇。你抬头看着她，评论着她阴道的状况，问她是否确定她不想这样。[pg]");
         if(isabellaAccent())
         {
            outputText("[say: 不！我……我从来没想过要和你打架！而且我绝对不想双腿张开坐在屁股上，被一个英俊的[manboy]盯着我的阴道看！]牛娘大声喊道。[pg]");
         }
         else
         {
            outputText("[say: 不！我……我从来没想过要和你打架！而且我绝对不想双腿张开坐在屁股上，被一个英俊的[manboy]盯着我的阴道看！]牛娘大声喊道。[pg]");
         }
         outputText("你伸手触摸她腰部周围的皮肤，在不接触她湿润裂缝任何部位的情况下，绕着她肿胀的阴唇画圈。伊莎贝拉大声呻吟，张开她" + (get_noFur() ? "" : "长着柔软绒毛的") + "大腿，下意识地欢迎你试探性的服侍。随着你手指每一次挑逗性的画圈，那湿润的阴阜肉眼可见地丰满起来，直到她的阴道逐渐像花朵一样绽放；如果花朵是跳动着的、充满闷热欲望的粉红色隧道的话。尽管如此，她阴唇的张开仍然是一个迷人且令人兴奋的景象。一颗胖乎乎的小阴蒂在顶部附近长出，并逐渐肿胀，直到达到其最大尺寸。在整个过程中，你拒绝给她阴道它所渴望的触摸，只是用手指以恒定、均匀的力度绕着她的阴户画圈。[pg]");
         outputText("[say: 你确定吗？]你问道。伊莎贝拉任性地咬着嘴唇，但当你拂过她大腿内侧敏感的皮肤时，这位暗色的牛娘呻吟着，");
         if(isabellaAccent())
         {
            outputText("[say: 好吧！我-我想要你插进我的小穴！操我！操我的逼……]");
         }
         else
         {
            outputText("[say: 好吧！我-我想要你插进我的小穴！操我！操我的逼……]");
         }
         outputText("她的声音渐渐变成了半哭半叫的呻吟，伴随着不经意的快感而颤抖。她的臀部对着你抽动，乞求更多的刺激，更多的快感；任何能满足你在她双腿间激起的渴望的东西都可以。[pg]");
         outputText("你退后一步脱衣服。伊莎贝拉趁机伸手去摸她湿透的小穴，但你用[foot]拨开了她探索的手指。她瞪了你一会儿，然后又开始淫荡地扭动，对满足的渴望压倒了被拒绝的恼怒。你一边掏出你的[cocks]，一边对着她" + get_player().mf("轻笑","咯咯笑") + "。红发女孩睁大了眼睛，看着你抚摸[eachcock]，舔了舔嘴唇。[pg]");
         outputText("你尽可能夸张地带着肉欲靠近，俯身在这个大胸婊子身上，让[onecock]戳刺着她扩张的阴户。伊莎贝拉在阴道被插入的暗示下发出牛叫声，同时乳汁开始在她的乳头上凝结成珠，浸透了她紧绷的衬衣。你坏笑着挤压其中一个暗色的乳房，同时挤出四股细小的乳汁。令人惊讶的是，即使你松开了晃荡的牛子，乳汁的喷涌仍在继续。你不管不顾地继续按压，一个流畅的动作将自己完全埋入那个渗出淫液的通道，而这个泌乳女人的湿透上衣开始紧贴着她丰满的躯干。[pg]");
         if(isabellaAccent())
         {
            if(get_player().cockArea(_loc1_) > get_monster().vaginalCapacity())
            {
               outputText("[say: 哦！这根鸡巴！对我来说太大了！我……被撑得好大啊！]");
            }
            else if(get_player().cockArea(_loc1_) > 13)
            {
               outputText("[say: 哦，你的鸡巴真棒！它把我的小穴摩擦得好舒服！]");
            }
            else
            {
               outputText("[say: 哦，真是个惊喜！这根鸡巴在我的小穴里又舒服又合适。我最喜欢可爱的小鸡巴了！]");
            }
            outputText("伊莎贝拉用带着浓重口音的笨拙话语尖叫着。[pg]");
         }
         else
         {
            if(get_player().cockArea(_loc1_) > get_monster().vaginalCapacity())
            {
               outputText("[say: 哦！这根鸡巴！对我来说太大了！它……把我撑得好大啊！]");
            }
            else if(get_player().cockArea(_loc1_) > 13)
            {
               outputText("[say: 哦，你的鸡巴真棒！它把我的小穴摩擦得好舒服！]");
            }
            else
            {
               outputText("[say: 哦，真是个惊喜！你的鸡巴在我的小穴里又舒服又合适。我最喜欢可爱的小鸡巴了！]");
            }
            outputText("伊莎贝拉用带着轻微口音的笨拙话语尖叫着。[pg]");
         }
         outputText("你坏笑着拍打牛娘的一个乳房作为回应，引发了一阵乳汁喷泉，像雨点一样落在你们俩身上。既然伊莎贝拉的乳房已经开始分泌乳汁，那雪白的乳流就停不下来了。她的乳汁喷洒在她、你和她的物品上，不受紧贴在她巧克力色双峰上湿透的衬衫的束缚。你舔了舔嘴唇上的几滴，惊叹于它的甜美。她真是太美味了。[pg]");
         outputText("尽管奶水喷泉让人分心，但你的主要注意力仍然集中在她的阴户上，以及那个火热的小盒子包裹着你" + get_player().cockDescript(_loc1_) + "的感觉是多么美妙。");
         if(get_player().totalCocks() > 1)
         {
            outputText("你希望你有空间容纳");
            if(get_player().totalCocks() > 2)
            {
               outputText("另一个[onecock]");
            }
            else
            {
               outputText("你的另一根阴茎");
            }
            outputText("在她体内，但她因兴奋而湿滑的阴唇紧紧地挤压着你，让你无法再把任何东西塞进那个洞里，而且在这个角度，肛交几乎是不可能的。");
         }
         outputText("每次伊莎贝拉的臀部撞击你时，她的阴户都会发出湿润的吧唧声，冒出大量泡沫般的淫液，而她突出的阴蒂则在每次动作的顶点撞击你的下腹。你予以回击，闷哼着越来越用力地将自己直没入柄，在半懂不懂的男性本能驱使下，你将每一寸肉棒都埋入她柔软的蜜壶中。[pg]");
         outputText("一股牛奶喷到了你的眼睛里。谢天谢地，它并不刺痛；你眨了眨眼，把那讨厌的液体弄掉，然后低头瞪了你的战利品一会儿，决定自己动手。你伸手摸向母牛起伏的胸部，双手抓住她那多孔的乳头，用力捏住，用强烈的压力阻止了乳汁的流出。伊莎贝拉猛地向后仰起头，在强烈的刺激下瞬间高潮了，但当她开始在你身下挣扎时，你的手紧紧锁住了她的乳头，尽管乳汁在不断冲击着你，试图喷射出来。你甚至能听到她的乳房随着时间的流逝发出晃荡的声音，在你的手中变得越来越大。[pg]");
         outputText("她的双腿紧紧缠绕着你，用力挤压");
         if(get_player().get_tou() > 80)
         {
            outputText("要是换个弱点的人肯定会受伤");
         }
         else if(get_player().get_tou() > 50)
         {
            outputText("甚至让你感到疼痛");
         }
         else
         {
            outputText("让你担心她会夹碎你的骨盆");
         }
         outputText("。你的" + get_player().cockDescript(_loc1_) + "被同样紧紧地绞住，在伊莎贝拉那肌肉发达的小穴里几乎要被压碎，她那令人沉醉的滚烫肉缝正疯狂地痉挛着。这种痛苦的紧致感让人不适，但同时你的肉棒感觉比以往任何时候都要坚硬。如波浪般起伏的肌肉收缩不断地拉扯着你的肉棒，像挤奶一样榨取着你可怜的阴茎，仿佛它只是普通的牲畜。仅仅几秒钟后，你就在这强有力的脉动中屈服了，你猛地仰起头，用尽全身力气撞进她的体内。[pg]");
         outputText("精液在[eachcock]中翻滚，夺走了你的紧绷感。当你松开对这牛女乳头的抓握时，乳汁从那深色的乳头上喷发而出，化作倾盆而下的白色液体。它如大雨般倾泻在你身上，至少有一大滴落入了你的嘴里。它像糖果一样浓稠香甜，这宛如天堂般的奶油让你的大脑因其美味而晕眩，同时你的整个身体在性高潮的极乐中紧绷。你的释放被那紧紧收缩的天鹅绒般的肉鞘阻碍了，一波波精液在你体内堵塞，几乎让你感到痛苦，直到她终于放松下来，让你伴随着一次漫长的、挺动臀部的射精将她填满。");
         if(get_player().cumQ() >= 1000)
         {
            if(get_player().cumQ() < 1500)
            {
               outputText("当你结束时，伊莎贝拉的肚子因为子宫里装满了精液而微微凸起；这是你男子气概的可见证明。");
            }
            else if(get_player().cumQ() < 2500)
            {
               outputText("当你结束时，伊莎贝拉的肚子已经高高隆起，展示了你那淫荡的男子气概的可见证明。");
            }
            else
            {
               outputText("伊莎贝拉那高高隆起的肚子和喷射着精液的小穴，就是你男子气概所需的全部证明。");
            }
            if(get_player().cumQ() >= 1500)
            {
               outputText("不过你留下的那一大滩水迹倒是个不错的额外奖励。");
            }
         }
         outputText("你发出一声满足的叹息，拔了出来，几乎没注意到自己身上已经完全沾满了伊莎贝拉那乳白色的奶水。回头看了她一眼，你注意到她那迷离的表情和仍在滴水的乳头。她依然挂着傻乎乎的笑容，你觉得等她回想起刚才有多爽时，肯定不会对这事太生气。你穿上你的[armor]，在回去的路上顺便在湖边洗了个澡，不过一路上你大部分时间都在忙着舔舐她留下的美味奶水。[pg]");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,260,0);
         if(!isabellaFollower())
         {
            get_isabellaFollowerScene().isabellaAffection(7);
         }
         get_combat().cleanupAfterCombat();
         get_player().orgasm("Dick");
      }
      
      public function unwelcomeFightCowGal() : void
      {
         clearOutput();
         outputText("你握紧[weapon]，摆出战斗架势。没有哪头牛能把你赶走！");
         if(!isabellaFollower())
         {
            get_isabellaFollowerScene().isabellaAffection(-5);
         }
         startCombat(new Isabella());
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,260,FlagDict_Impl_.arrayReadInt(_loc1_,260) + 72);
         spriteSelect(SpriteDb.get_s_isabella());
      }
      
      public function tryToTalkDownAngryCow() : void
      {
         var _loc1_:* = null as IMap;
         clearOutput();
         spriteSelect(SpriteDb.get_s_isabella());
         if(get_player().get_inte() < 25)
         {
            outputText("你开口告诉她，在她明白你不是她的敌人之前，你是不会离开的。她喷了喷鼻息，嘲弄道，[say: 你以为伊莎贝拉会中这种诡计吗？哈！][pg]");
            outputText("她放低盾牌冲锋而来，震耳的蹄声盖过了你的回答。[pg]");
            startCombat(new Isabella());
            if(!isabellaFollower())
            {
               get_isabellaFollowerScene().isabellaAffection(-2);
            }
            get_combat().startMonsterTurn();
         }
         else if(get_player().get_inte() < 50)
         {
            outputText("你开始试着解释自己来到这里的理由，因为匆忙而微微结巴；可这位愤怒的牛娘看起来越来越不愿听了。她喷了喷鼻息，压低盾牌喊道，[say: 你以为伊莎贝拉会相信这种胡话吗？哈！准备承受我的怒火吧！]");
            if(!isabellaFollower())
            {
               get_isabellaFollowerScene().isabellaAffection(-2);
            }
            startCombat(new Isabella());
         }
         else if(get_player().get_inte() < 75)
         {
            outputText("你尽力解释眼下的情况，可即使你的说法简洁明了、条理清晰，似乎也帮不上什么忙。她不屑地哼了一声，说道，[say: 闭嘴。我没耐心应付这片土地上的变种怪。现在，如果你真没有恶意，最好在伊莎贝拉的盾牌砸碎你的脑袋之前，自己想办法离开我的空地！]");
            if(!isabellaFollower())
            {
               get_isabellaFollowerScene().isabellaAffection(-2);
            }
            startCombat(new Isabella());
         }
         else
         {
            if(!get_player().get_weapon().isAttached())
            {
               outputText("你把[weapon]扔到一边，并");
            }
            else
            {
               outputText("你");
            }
            outputText("举起双手表示和平，平静地说明你对她没有恶意，只是至少想和她谈谈。她上下打量了你一番，喷了喷鼻息道，[say: 很好，伊莎贝拉会听你说。][pg]");
            outputText("你在泥地上坐下，讲述自己的经历，解释你是如何作为村子选中的“勇者”来到这里的。你继续说起一路上的遭遇，以及这里的一切有多么古怪；伊莎贝拉则一边听，一边心领神会地点头。既然已经开了头，话语便一句接一句地从你嘴里涌出。它们像一条没有断开的链子，从你的口中不断延展开来，直到将近一个小时后，你才终于无话可说。你揉了揉下巴，长篇大论让你的喉咙有些发痛，然后看向伊莎贝拉，想知道她会有什么反应。[pg]");
            outputText("这位丰满的牛娘大大的棕色眼眸角落里闪着泪光，她用力向你点头，诉说着自己的感受：[say: 我也明白你的感受，勇者[name]。我自己的故事也很相似，虽然我的命运并不是这样被强加而来的。也许有一天我会告诉你，但现在，我们该分别了。以后你可以再回来。][pg]");
            outputText("你暗自微笑，很高兴交到了一个朋友。[pg]");
            doNext(get_camp().returnToCampUseOneHour);
            if(!isabellaFollower())
            {
               get_isabellaFollowerScene().isabellaAffection(10);
            }
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,258,FlagDict_Impl_.arrayReadInt(_loc1_,258) + 1);
         }
      }
      
      public function totalIsabellaChildren() : int
      {
         return int(int(isabellaOffspringData.length) / 2);
      }
      
      public function tooBigVictoryTittyFuckingFuntimesWithMilk() : void
      {
         var _loc1_:int = get_player().biggestCockIndex();
         clearOutput();
         outputText("你脱下你的[armor]，向");
         if(get_monster().get_lust() >= get_monster().maxLust())
         {
            outputText("充满欲望的");
         }
         else
         {
            outputText("虚弱");
         }
         outputText("牛娘展示你的" + get_player().cockDescript(_loc1_) + "。当她看到那完全暴露的长度时，眼睛睁得大大的，看着它");
         if(get_player().get_lust100() > 70)
         {
            outputText("随着你狂暴的欲望而跳动");
         }
         else
         {
            outputText("随着你不断增长的欲望而慢慢充血");
         }
         outputText("。你一边靠近一边套弄着，直到你站在她上方，俯视着她那深不可测的乳沟。当你向伊莎贝拉解释她的任务时，她开始撅起嘴——她要用她那巨大的乳房为你乳交");
         if(get_player().cockThatFits(get_monster().vaginalCapacity()) == -1)
         {
            outputText("，因为你根本不可能把它塞进她的小穴或屁眼。[pg]");
         }
         else
         {
            outputText("。[pg]");
         }
         if(isabellaAccent())
         {
            outputText("牛娘抱怨道：[say: 可、可是我不想把它放在我的奶子里！你的东西……又大又恶心又难看，就像恶魔的一样！][pg]");
         }
         else
         {
            outputText("牛娘抱怨道：[say: 可、可是我不想那样！你的鸡巴……又大又恶心……又难看，就像恶魔的一样！][pg]");
         }
         outputText("[saystart]");
         if(get_player().cor < 33)
         {
            outputText("很抱歉，但你实在太性感了，我无法抗拒。而且，我这样做总比强行塞进一个根本无法容纳它的洞里要好，");
         }
         else if(get_player().cor < 66)
         {
            outputText("这没得商量。");
            if(get_monster().get_lust() >= get_monster().maxLust())
            {
               outputText("你都湿透了，反正你也想要这个，");
            }
            else
            {
               outputText("你输了，就必须承担后果，");
            }
         }
         else
         {
            outputText("真倒霉，");
         }
         outputText("[sayend]你回答道。为了强调你的观点，你伸手去解她的紧身胸衣，一次解开一根带子。每一根带子的断裂都在伊莎贝拉巨大的乳房上引发了一场雪崩，随着压力的突然释放，这两座山峰般的肉团弹跳起来。她打了个寒颤，脸上露出厌恶的表情，但你可以看到她的乳头将透明的上衣撑得更紧了。[pg]");
         outputText("伊莎贝拉因为被脱掉衣服而兴奋起来！你也没有停在她的紧身胸衣上；她腰部以上的每一件衣服都被扯下并丢弃，最后才脱下那件丝绸衬衫。");
         if(get_player().cor < 33)
         {
            outputText("你小心翼翼地脱下它，以免损坏衣物，仿佛尊重财产就能弥补你在她不情愿的身体上发泄欲望的过错。");
         }
         else if(get_player().cor < 66)
         {
            outputText("你脱下衣服时并没有太在意它的状况，在用力扯下时也没有造成太大的损坏。");
         }
         else
         {
            outputText("你毫不留情地撕下那件碍事的衣服，完全不顾及牛娘的财产。");
         }
         outputText("她用泪汪汪的棕色眼睛抬头看着你，问道，[saystart]请对我温柔一点");
         if(isabellaAccent())
         {
            outputText("，好吗？");
         }
         else
         {
            outputText("。");
         }
         outputText("[sayend][pg]");
         outputText("你的目光如此专注地盯着那四个乳晕，以至于几乎没有理会她的请求。当你抚摸你的肉棒，用双手轻轻挤压时，你的嘴唇里漏出了一声轻微的咕哝。你向前迈了半步，将你的" + get_player().cockHead(_loc1_) + "对准伊莎贝拉的乳房之间。第一滴先列腺液刚好从顶端渗出，涂抹在乳沟的深谷中，进一步润滑了出汗的皮肤。她的身体因为刚刚的战斗而发热，当你滑入她胸部的深谷时，牛娘温暖湿润的怀抱感觉绝对像天堂一样。[pg]");
         outputText("你幸福地叹了口气，抓住伊莎贝拉突出的乳头，将它们拉到一起，完成了对你阴茎的令人兴奋的包裹。当她看着你侵犯她的乳房时，她因为用力的拉扯而大声呻吟。你的" + get_player().cockDescript(_loc1_) + "的" + get_player().cockHead(_loc1_) + "从柔软的肉团之间爆发出来，漏在牛娘的胸膛上，而这位美丽的牛娘只能以深红色的红晕作为回应。因为伊兹乳房的紧致和火热，你的龟头已经开始稳定地渗出先列腺液；高潮已经不远了。[pg]");
         outputText("牛娘发出一声愉悦的哞哞声，以回应紧绷的乳头。你紧紧抓住，在手指间滚动那四个乳头，同时开始慢慢地操弄牛娘，无视开始在它们之间喷射的湿润。伊莎贝拉的臀部似乎在不由自主地扭动，牛娘的双腿张得大大的，将她穿着裙子的下体在你的[legs]上摩擦。你通过将温柔的抽插变成粗暴的活塞运动来回应，这让摇晃的肉团在你的" + get_player().cockDescript(_loc1_) + "周围剧烈震动，但这似乎只会让喷奶的母牛感到高兴。[pg]");
         outputText("伊莎贝拉疯狂地在你身上摩擦，在你的[legs]上狂野地扭动。她的动作只会加剧挤奶你" + get_player().cockDescript(_loc1_) + "的乳交套的紧致感，当你低头看着抽搐的牛娘幸福的表情时，你感觉到你的[balls]里涌起了一股明显的压力。你等待她的嘴张得特别大，然后向前猛插，");
         if(get_player().cocks[_loc1_].cockLength < 50)
         {
            outputText("将你那几英寸长的顶端埋入她的嘴里");
         }
         else
         {
            outputText("将你的肉棒推过她撅起的嘴唇，越过她的额头");
         }
         outputText("。乳汁从你的手掌上溅开，呈扇形喷出，将这个巨乳怪物浸透在她自己的奶油中。你试图不去理会，但眼前的景象实在太色情了，你知道自己根本无法忍住高潮。[pg]");
         outputText("你的" + get_player().cockDescript(_loc1_) + "正压在一个巨乳、喷奶的牛娘身上，一直压到");
         if(get_player().cocks[_loc1_].cockLength < 50)
         {
            outputText("她的嘴里");
         }
         else
         {
            outputText("用沉甸甸的肉棒闷住她的脸");
         }
         outputText("。与此同时，伊莎贝拉的表情充满了无意识的、压倒性的快感。甚至她的眼睛似乎都失去了焦点，微微斗鸡眼——她正沉浸在被乳交的快感中！实际上，随着滑腻的淫液从伊莎贝拉丰满的阴唇中漏出，你的[foot]周围正积聚起一滩越来越深的液体。");
         if(get_player().balls > 0)
         {
            outputText("你的蛋蛋紧紧贴着你的下腹，伴随着一阵温暖的爆发");
         }
         else
         {
            outputText("一股暖流在你的下腹部升起");
         }
         outputText("，你知道现在已经无法阻止你的高潮了。[pg]");
         outputText("从");
         if(get_player().hasSheath())
         {
            outputText("包皮");
         }
         else
         {
            outputText("根部");
         }
         outputText("开始，一个扭曲的凸起在你的尿道中膨胀，向前推进，在伊莎贝拉乳沟紧密的峡谷处停顿了一下，然后挤进了汗湿的乳房怀抱中。你发出一声呻吟，声音大到足以淹没牛娘极致快感的呻吟声，下一股精液甚至在你释放第一股之前就开始了释放的旅程。她");
         if(get_player().cocks[_loc1_].cockLength < 50)
         {
            outputText("向前倾身，吞下更多你的肉棒，就在");
         }
         else
         {
            outputText("向后仰，吞下你的" + get_player().cockHead(_loc1_) + "并舔舐它，就在");
         }
         outputText("它在她的嘴里爆发之前。");
         if(get_player().cumQ() < 25)
         {
            outputText("一口就吞下了你微薄的射精量。");
         }
         else if(get_player().cumQ() < 150)
         {
            outputText("她脸颊形状的轻微变化是你对你射精量大小得到的唯一反应。一个明显的吞咽动作清空了她的嘴。");
         }
         else if(get_player().cumQ() < 250)
         {
            outputText("一股精液从这位牛类美人的嘴里流出，而她鼓起的脸颊慢慢变窄。她发出清晰的吞咽声，咽下了沉甸甸的精液。");
         }
         else
         {
            outputText("一股精液的洪流顺着她的下巴流下，但这位牛类美人大口吞咽着，尽力跟上你的节奏。");
         }
         outputText("接下来的一股比第一股还要大，伊莎贝拉在吞咽你的精液时，用一种迷离却充满爱意的眼神看着你。她喷出的乳汁变得像浓奶油一样粘稠，当你们一起高潮时，你轻轻地上下拉扯她那四指宽的乳头。[pg]");
         outputText("就像所有美好的事物一样，你的高潮最终结束了。然而，当你欣赏自己的杰作时，你感觉到你的[cocks]传来一阵快乐的悸动。这真是一次阴茎与乳房的完美结合。伊莎贝拉那沉甸甸的双峰上仍然留有你的精液痕迹——在最初的几下喷射之后，你拔了出来，让剩下的精液");
         if(get_player().cumQ() < 500)
         {
            outputText("喷射在");
         }
         else
         {
            outputText("浸透");
         }
         outputText("她的乳房上。她现在正心满意足地哞哞叫着，拉扯着自己的乳头，在你的注视下挤出最后一点奶油。此时，这位牛娘似乎几乎没有意识到你的存在。[pg]");
         if(!isabellaFollower())
         {
            get_isabellaFollowerScene().isabellaAffection(3);
         }
         outputText("你耸了耸肩，在她的嘴唇上擦干净[eachcock]，然后穿上衣服。这头母牛真是一个不可思议的精液垃圾桶。");
         get_player().orgasm("Dick");
         get_combat().cleanupAfterCombat();
      }
      
      public function tinyVictoryTittyFuckingFuntimesWithMilk() : void
      {
         var _loc1_:int = get_player().smallestCockIndex();
         clearOutput();
         outputText("你脱下你的[armor]，向");
         if(get_monster().get_lust() >= get_monster().maxLust())
         {
            outputText("充满欲望的");
         }
         else
         {
            outputText("虚弱");
         }
         outputText("牛娘。看到你的[cocks]时，她发出了愉悦的尖叫");
         if(get_player().cockTotal() > 1)
         {
            outputText("，不知为何，她挑出了最小的那个");
         }
         if(isabellaAccent())
         {
            outputText("。 [say: 这就是你想从我这里得到的吗？哦，宝贝，你大可直接开口的！伊莎贝拉妈妈最喜欢吸你这种可爱的小鸡鸡了，特别是像那个小家伙一样的那种。][pg]");
         }
         else
         {
            outputText(". [say: 这就是你想要的吗？噢，宝贝，你早说就好了嘛！伊莎贝拉妈妈最爱吸你这样可爱的小鸡鸡了，特别是那边那个小家伙。][pg]");
         }
         outputText("牛娘为了强调，一把抓住了你的" + get_player().cockDescript(_loc1_) + "，开始热情地套弄起来。她那宽大（但依然充满女性魅力）的手掌包裹着你，相比之下，你的肉棒显得格外娇小，");
         if(get_player().cor < 33)
         {
            outputText("让你的脸颊泛起羞耻的红晕");
         }
         else if(get_player().cor < 66)
         {
            outputText("让你的脸颊泛起一丝红晕");
         }
         else
         {
            outputText("但你其实一点也不在意");
         }
         outputText("。你清了清嗓子，试图重新掌控局面，要求她用乳房来服侍你。伊莎贝拉高兴地答应了，甚至在脱掉上衣时兴奋地拍起手来。她似乎真心喜欢这个主意，甚至到了让她忘记");
         if(get_monster().get_lust() >= get_monster().maxLust())
         {
            outputText("自己需求的程度。");
         }
         else
         {
            outputText("自己伤痛的程度。");
         }
         outputText("[pg]");
         outputText("伊莎贝拉撑起身子靠在你的腹股沟上，双手托起她那沉甸甸的乳房，将它们挤压在你的" + get_player().cockDescript(_loc1_) + "周围。那柔软的乳房完全包裹住了你的阴茎，温暖且被汗水润滑的拥抱让你感到无比舒适");
         if(get_player().cockTotal() > 1)
         {
            outputText("，但她完全忽略了另一根");
            if(get_player().cockTotal() > 2)
            {
               outputText("");
            }
         }
         outputText("。伊莎贝拉对你坏笑，开始前后晃动着她的乳房，同时说道，");
         if(isabellaAccent())
         {
            outputText("[say: 你这可爱的小鸡巴喜欢这样吗？哦哦，我想它喜欢的。它想乖乖地射进我的乳沟里，对吧？]");
         }
         else
         {
            outputText("[say: 你这可爱的小鸡巴喜欢这样吗？哦哦，我想它喜欢的。它想乖乖地射进我的乳沟里，不是吗？]");
         }
         outputText("你刚想点头，却又猛地停住了。现在是你掌控局面，不是她！[pg]");
         outputText("伊莎贝拉似乎根本没注意到你的内心冲突，因为她已经完全被你的" + get_player().cockDescript(_loc1_) + "在她的乳房里跳动的感觉迷住了，乖乖地流着先列腺液，仿佛在努力让她的语言成为现实。你慢慢地瘫倒在地上，开始虚弱地喘息，任由伊莎贝拉用她的乳房完全支配你那小巧的阴茎。汗水和乳汁从她的乳头滴落，你开始闻到空气中她发情的味道越来越浓烈。[pg]");
         outputText("没过多久，你全身都开始泛红，你那小巧的肉棒无法承受这只喜欢挑逗的牛娘的服侍。她直视你的眼睛，开始上下晃动整个身体，摇晃着她的乳房，同时问道，");
         if(isabellaAccent())
         {
            outputText("[say: 你快要为我射了吗？我想让那根小鸡巴把所有可怜的精液都喷在我的乳房上，直到它软掉。这不是你想要的吗？]");
         }
         else
         {
            outputText("[say: 你快要为我射了吗？我想让那根小鸡巴把所有可怜的精液都喷在我的乳房上，直到它软掉。这不是你想要的吗？]");
         }
         outputText("她那撩人的戏弄让你兴奋到了极点，你感觉到你的阴茎开始释放");
         if(get_player().cumQ() < 50)
         {
            outputText("它那可怜的一点点精液");
         }
         else if(get_player().cumQ() < 250)
         {
            outputText("一股浓稠的精液");
         }
         else if(get_player().cumQ() < 500)
         {
            outputText("它那沉甸甸的、足以浸透乳房的精液");
         }
         else
         {
            outputText("它那巨大的、足以浸透全身的精液");
         }
         outputText("射进了伊莎贝拉的乳沟里。");
         if(get_player().cumQ() >= 1000)
         {
            outputText("它不断地喷射，弄脏了她的胸部和脸颊，让她露出了狂喜又震惊的表情。");
         }
         if(isabellaAccent())
         {
            outputText("[say: 哎呀！真是根听话的小鸡巴！对啦；用你的种子盖满我吧，我可爱的小鸡巴！]");
         }
         else
         {
            outputText("[say: 哎呀！真是根听话的小鸡巴！对啦；用你的种子盖满我吧，我可爱的小鸡巴！]");
         }
         outputText("你贴着她颤抖扭动，随着每一次射精，你的身体变得越来越虚弱，直到你仰面躺倒，把最后一点精液喷在自己的肚子上。[pg]");
         outputText("伊莎贝拉尽职尽责地用舌头把你清理干净，然后又埋头在自己的胸前，开始从滴着奶水的乳房上舀起精液。你看着她过了一会儿，直到感觉恢复了体力，才穿好衣服离开，[legs]还有些摇摇晃晃。伊莎贝拉发出响亮的吞咽声，随后是一声口哨。");
         if(isabellaAccent())
         {
            outputText("[say: 记得早点回来！你有最美味的小鸡巴，我还想多玩玩它呢，好吗？]");
         }
         else
         {
            outputText("[say: 记得早点回来！你有最美味的小鸡巴，我还想多玩玩它呢！]");
         }
         if(!isabellaFollower())
         {
            get_isabellaFollowerScene().isabellaAffection(8);
         }
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,260,0);
         get_combat().cleanupAfterCombat();
         get_player().orgasm("Dick");
      }
      
      public function tinyPenis() : Number
      {
         var _loc1_:Number = 6;
         if(get_player().isChild())
         {
            _loc1_--;
         }
         if(get_lowStandards())
         {
            _loc1_ += 3;
         }
         return _loc1_;
      }
      
      public function timeChangeLarge() : Boolean
      {
         §§push(false);
         §§push(false);
         §§push(false);
         §§push(false);
         §§push(false);
         §§push(false);
         var _loc1_:int;
         checkedIsabella = (_loc1_ = checkedIsabella) + 1;
         if(_loc1_ == 0)
         {
            §§pop();
            §§push(get_game().time.hours == 6);
         }
         if(§§pop())
         {
            §§pop();
            §§push(get_isabellaFollowerScene().isabellaAtCamp());
         }
         if(§§pop())
         {
            §§pop();
            §§push(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,376) == 0);
         }
         if(§§pop())
         {
            §§pop();
            §§push(get_player().hasCock());
         }
         if(§§pop())
         {
            §§pop();
            §§push(int(get_game().time.days % 2) == 0 || !get_player().hasPerk(PerkLib.MarblesMilk));
         }
         if(§§pop())
         {
            §§pop();
            §§push(get_player().shortestCockLength() <= tinyPenis());
         }
         if(§§pop())
         {
            spriteSelect(SpriteDb.get_s_isabella());
            get_isabellaFollowerScene().isabellaMorningWakeupCall();
            return true;
         }
         return false;
      }
      
      public function timeChange() : Boolean
      {
         var _loc1_:int = 0;
         var _loc2_:* = null as IMap;
         checkedIsabella = 0;
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,260) > 0)
         {
            _loc1_ = 260;
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,_loc1_,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,_loc1_) - 1);
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,260) > 300)
            {
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,260,300);
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,260) < 0)
            {
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,260,0);
            }
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,380) > 0)
         {
            _loc1_ = 380;
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,_loc1_,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,_loc1_) - 1);
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,380) < 0)
            {
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,380,0);
            }
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,373) > 1)
         {
            _loc1_ = 373;
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,_loc1_,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,_loc1_) - 1);
         }
         if(isabellaFollower())
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2219) > 0)
            {
               _loc1_ = 2219;
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,_loc1_,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,_loc1_) - 1);
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2219) == 0 && get_player().hasCock())
            {
               get_isabellaFollowerScene().isabellaTalksAboutPotentialPregnancy();
               return true;
            }
         }
         if(pregnancy.get_isPregnant())
         {
            pregnancy.pregnancyAdvance();
            if(pregnancy.get_incubation() == 0)
            {
               get_isabellaFollowerScene().isabellaGivesBirth();
               return true;
            }
         }
         if(get_game().time.hours > 23)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,707) == 1)
            {
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,707,0);
            }
            if(get_game().isabellaFollowerScene.isabellaAtCamp() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,375) >= 0)
            {
               _loc2_ = KFLAGS.flags;
               FlagDict_Impl_.arrayWriteInt(_loc2_,375,FlagDict_Impl_.arrayReadInt(_loc2_,375) + 1);
            }
         }
         return false;
      }
      
      public function talkWithIsabella() : void
      {
         spriteSelect(SpriteDb.get_s_isabella());
         clearOutput();
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,262,FlagDict_Impl_.arrayReadInt(_loc1_,262) + 1);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,262) == 1)
         {
            outputText("你向伊莎贝拉讲述了自己的故事，然后问她是否愿意分享一下她是怎么落到现在这个地步的。这位平时脾气火爆的红发女郎叹了口气，回答道：[say: 好吧，我想这很公平。][pg]");
            outputText("她紧张地清了清嗓子，然后开始说道：[say: " + (isabellaAccent() ? "我在我的家乡曾是一名冒险者。我会在荒野中漫游，除了我的盾牌、我的技能和我的智慧，我什么都没有。那真是太棒了。在做佣兵和探索地牢期间，我积累了一小笔财富，但有一天我深入得太远了。那里有一个闪烁的粉色传送门，满脑子想着发财的我，就这么走了进去" : "我在我的家乡曾是一名冒险者。我会在荒野中漫游，除了我的盾牌、我的技能和我的智慧，我什么都没有。那真是太棒了。在做佣兵和探索地牢期间，我积累了一小笔财富，但有一天我深入得太远了。那里有一个闪烁的粉色传送门，满脑子想着发财的我，就这么走了进去") + "。][pg]");
            outputText("伊莎贝拉看着你，眼眶里盈满了泪水。[say: 那个传送门" + (isabellaAccent() ? "不让我回去。我被困在了这里，远离了我的朋友和家人，只有一群性变态作伴。谢天谢地，他们大多数人都对付不了我的" : "不让我回去。我被困在了这里，远离了我的朋友和家人，只有一群性变态作伴。谢天谢地，他们大多数人都对付不了我的") + "盾牌。][pg]");
            outputText("你好奇地看着她，问她是不是一直都是这副……牛的模样。她得意地笑了笑，回答道：[say: 我想我" + (isabellaAccent() ? "是自作自受。不过，我并不总是你看到的这个样子。我打败的一些敌人掉落了一些药水。而且……那些牛的药水真是太好喝了。我忍不住。我甚至把几种不同的药水混合在一起，想看看会发生什么。它让我的" : "是自作自受。不过，我并不总是你看到的这个样子。我打败的一些敌人掉落了一些药水。而且……那些牛的药水真是太好喝了。我忍不住。我甚至把几种不同的药水混合在一起，想看看会发生什么。它让我的") + "奶奶变得又奇怪又甜。][pg]");
            outputText("伊莎贝拉继续说道，神情也变得明朗起来：[say: 但我在这里安了一个舒适的小家，而且时不时地，我也能交到一些朋友。][pg]");
            outputText("这位胸部丰满的牛娘探出身子，紧紧地抱住你，把你挤在她的乳房上，然后告诉你她营地里还有些活要干。你点点头，离开了。[pg]");
            if(!isabellaFollower())
            {
               get_isabellaFollowerScene().isabellaAffection(10);
            }
         }
         else
         {
            outputText("你和伊莎贝拉坐在一起，分享着你最近冒险的故事。虽然有人陪伴感觉很好，但在聊了一个多小时后，你们决定各自离开。");
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function nomOnMommaIzzysTits() : void
      {
         var _loc2_:* = null as IMap;
         clearOutput();
         spriteSelect(SpriteDb.get_s_isabella());
         var _loc1_:int = get_player().cockThatFits(20);
         if(get_player().get_tallness() > 78 || get_player().isTaur())
         {
            outputText("当你告诉伊莎贝拉你正想喝点什么时，她的脸顿时亮了起来。她从一只箱子上抓起一条毯子，铺到地上。那条织有精致花纹的铺毯落在泥地上，其品质与大小都令你惊叹。它从一边到另一边足有三米多，把这片泥地衬得舒服多了。丰满的牛娘走到毯子上，几乎像走上一张地毯，随后她侧身躺下，开始漫不经心地解开黑色紧身胸衣上的红色系带。她那山峦般的乳房随着每一次拉扯危险地晃动着，接着她便把紧身胸衣扔到一旁。少了这件衣物，在你与牛娘那泛着光泽、沐过阳光的肌肤之间，就只剩下一层薄纱般的丝绸了。[pg]");
            outputText("你走上前去，想到即将品尝牛娘的奶汁，口中不禁微微分泌唾液；而她那对“被遮住”却又完全暴露的乳房，也让你在无意间越来越兴奋。");
            if(get_player().hasCock())
            {
               outputText("你的[armor]被");
               if(get_player().biggestCockArea() > 40)
               {
                  outputText("硬硬地撑起，几乎束缚不住[eachcock]。");
               }
               else
               {
                  outputText("[eachcock]明显顶起。");
               }
               outputText("");
            }
            if(get_player().hasVagina())
            {
               if(get_player().hasCock())
               {
                  outputText("就连你");
               }
               else
               {
                  outputText("你");
               }
               outputText("的" + get_player().vaginaDescript(0) + "");
               if(get_player().wetness() < 3)
               {
                  outputText("泛着");
               }
               else if(get_player().wetness() < 5)
               {
                  outputText("滴下");
               }
               else
               {
                  outputText("淌出");
               }
               outputText("湿液，对这幅情色景象作出了反应。");
            }
            outputText("伊莎贝拉沉重的胸部随着每一次粗重的呼吸起伏着，她示意你躺在她身边。她暗色的嘴唇轻启，说道，");
            if(isabellaAccent())
            {
               outputText("[say:靠近些，我不咬人。咱们都知道你渴得厉害。伊莎贝拉会让你喝个够，]她一边说，一边将绷得紧紧的丝绸拉过那对诱人的古铜色乳丘。[pg]");
            }
            else
            {
               outputText("[say:靠近些，我不咬人。我们都知道你有多渴。伊莎贝拉会让你喝个够，]她一边说，一边将绷得紧紧的丝绸拉过那对诱人的古铜色乳丘。[pg]");
            }
            outputText("她的乳晕很大，直径大概有两三英寸，可它们坐落在如此壮观的圆润乳房上，看起来依旧显得小巧。每片乳晕上都有四个乳头，几乎从表面凸起了一英寸，每一个都开始凝出细小的奶珠。你有些迟疑地凑近，看着那些奶珠慢慢胀成水滴，随后沿着牛娘深色胸脯的弧线滚落。气味非常甜……比你想象中还要甜，但空气中还飘着另一股从伊莎贝拉下身传来的味道，暗示着另一种截然不同的需求。耳边隐约传来被压低的湿润咕啾声，直到这时你才注意到，她的一只手已经消失在裙子下面。[pg]");
            outputText("你还没来得及开口，她另一只手就抓住了");
            if(get_player().horns.value > 0 && get_player().horns.type > 0)
            {
               outputText("你的角");
            }
            else
            {
               outputText("你的后脑勺");
            }
            outputText("，把你的脸狠狠按向她正漏着奶的乳头。你反应够快，及时张大嘴，四个乳头全都滑进了你的口中。它们的尖端挤在一起，在你的舌头上留下稳定不断的奶流；你绕着那些饥渴的乳头舔舐、吮吸，既缓解了伊莎贝拉哺乳的欲望，也满足了自己的口渴。那只巨大圆润的乳房几乎包住了你的大半个脑袋，伊莎贝拉用力把你往上拉，使它几乎贴合着你的脸。眼前一片黑暗，你闭上眼睛喝了起来，深深吮吸着，奶流也变得越发强劲。甚至每咽下一口，这牛娘的乳汁似乎都会变得更甜。[pg]");
            outputText("你很快就沉浸在这项任务里，忘记了时间，只顾更加用力地吸吮，想看看她体内这乳汁究竟能供应到什么程度。作为回应，一股奶油般香甜的洪流几乎要把你淹没，你不得不连续大口吞咽好几秒，才能跟上那汹涌的流量。即便没有你的吸力，奶水也比之前强劲得多，并且相当有效地解了你的渴。伊莎贝拉那被歌声强化过的嗓音开始大声呻吟起来；由于她浓重的口音，以及不时夹杂进来的奇异语言，你听不清具体的词句，但意思却再明白不过：[say:乖[boy]]——一阵听不懂的呻吟——[say:对，继续喝……]她又呻吟了一声。[pg]");
            outputText("你被粗暴地从喷奶的乳房上拽开，拉到伊莎贝拉脸前。牛娘古铜色的面庞涨得更深，就连她脖子上的一块白斑都被欲望染上了绯红。她用一条格外宽大而光滑的舌头舔去你唇上的乳白奶水，随后热烈地与你法式深吻，整个过程中还不断把更多奶水喷到你的[chest]上。");
            if(get_player().hasCock())
            {
               outputText("" + get_player().SMultiCockDesc() + "因这个吻的激烈而抽动、滴液，但你在喝奶时已经完全忘了自己的性欲。");
            }
            else if(get_player().hasVagina())
            {
               outputText("你的" + get_player().vaginaDescript(0) + "因这个吻的激烈而渴求发疼，但你在进食时已经完全把它抛在了脑后。");
            }
            outputText("不过这个吻并没有持续太久。等她那条异常灵活的舌头把你嘴里的奶渍舔干净后，你又被拉向另一只还在漏奶的乳房。[pg]");
            outputText("乳汁沿着那只尚未被使用的乳房曲线缓缓淌下，像一道慢吞吞的小瀑布，直到你的嘴唇封住那处“泉眼”。就像刚才一样，她越压越用力，直到乳汁喷进你的喉咙，那只泛红的古铜色乳房也将你裹住。牛娘那美味的甘露比你记忆中还要可口，而且还在变得更甜！她张开的臀胯和丰润的大腿不断撞着你，随着伊莎贝拉自慰的声音越来越响，那碰撞也变得越来越快、越来越重。可你并没有被那些声响挑起欲望，反而将其抛在脑后，继续大口喝着，细细品味那逐渐浓稠的奶液冲进喉咙的感觉。[pg]");
            outputText("伊莎贝拉发出一声雷鸣般的欢愉尖叫，而你只是趁着吞咽的间隙轻轻叹息，贪婪地吞下她灌入你体内的浓厚、糖果般甜美的奶油。她的双臂环住你的肩膀");
            if(get_player().wings.type != 0)
            {
               outputText("，抚摸着你的翅膀");
            }
            outputText("，将你哄入一种平静放松的状态；你能感受到的，只有她柔软的肉体包裹着你，以及她美妙的乳脂不断填满你的肚子，直到几乎要撑开。你叹息着松开口，依偎到她的颈边，听着她在你耳畔催眠般地轻声哼唱，渐渐打起盹来。[pg]");
            if(get_player().hasCock() && _loc1_ >= 0)
            {
               outputText("你在做了一个小时格外色情的梦后醒来，发现自己正依偎着伊莎贝拉，被她紧紧搂在臂弯里。她睡得很沉，鼾声均匀，于是你悄悄从她手臂下挣脱出来，又把毯子给她盖好。你伸了个懒腰，这才意识到自己浑身赤裸，胯下酸痛，而且全身都散发着女性情欲的气味。");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,261) == 0)
               {
                  outputText("她、她趁你睡着把你上了？这倒是解释了为什么你的梦会那么舒服。一方面你多少觉得有点被侵犯了，可另一方面，你又忍不住去想，这个女人独自守着营地对抗恶魔这么久，身边究竟有多久没有任何东西能取悦她了。");
               }
               else
               {
                  outputText("看来她又趁你睡着把你上了一次。你真希望自己喝完她的奶后不要睡得那么死，这样至少也能在性爱里出点力；可你醒来时无论哪方面都被彻彻底底地满足了，心里也明白，以后恐怕很难拒绝她。");
               }
               get_player().orgasm("Dick");
               get_player().changeFatigue(-50);
               _loc2_ = KFLAGS.flags;
               FlagDict_Impl_.arrayWriteInt(_loc2_,261,FlagDict_Impl_.arrayReadInt(_loc2_,261) + 1);
            }
            else
            {
               outputText("一小时后你醒了过来，依偎在伊莎贝拉的几床毯子里，感到十分满足。这位牛娘正坐在她的椅子上，把她盾牌的底缘打磨成极其锋利的切割面。她回头看着你，微笑着停下手里的活问道，");
               if(isabellaAccent())
               {
                  outputText("[say: 喜欢窝的小点心吗？窝想我们俩都需要喝上一顿，对吧？] 你点点头，站起身伸了个懒腰，感觉精力充沛、神清气爽。");
               }
               else
               {
                  outputText("[say: 喜欢这份点心吗？我想我们俩都需要喝上一顿，对吧？] 你点点头，站起身伸了个懒腰，感觉精力充沛、神清气爽。");
               }
               get_player().changeFatigue(-65);
            }
         }
         else
         {
            outputText("你感到十分口渴，并且毫不掩饰地告诉了伊莎贝拉。她的脸上绽放出心领神会的笑容，回答道，");
            if(isabellaAccent())
            {
               outputText("[say: 那你可走运啦！窝这里有你在任何地方都找不到的美味牛奶。过来吧，小家伙，伊莎贝拉会给你所需要的一切。][pg]");
            }
            else
            {
               outputText("[say: 那你可走运啦！我这里有你在任何地方都找不到的美味牛奶。过来吧，小家伙，伊莎贝拉会给你所需要的一切。][pg]");
            }
            outputText("这位胸部丰满的牛娘漫不经心地开始解开束身衣的系带，每一次用力拉扯，都让那对几乎遮不住的巨乳晃动起来。你猛地向前倾去，舔了舔微微干裂的嘴唇，已经被伊莎贝拉无意间的脱衣诱惑牢牢勾住。随着最后一下干脆利落的猛拽，这位深色肌肤的美人脱下了那件碍事的衣物，把它放到旁边的毯子上。失去束身衣的支撑后，她的乳房沉甸甸地弹跳、摇摆着，让一排坚硬湿润的乳头在上衣那层丝滑的囚笼下拖过。片刻后，那双晒成橄榄色的手又把这件碍事的衣物向上拉起，带离你的视线。此刻你和伊莎贝拉精美的乳房之间，只剩下空荡荡的空气。[pg]");
            outputText("你停下来盯着它们看，只是看着，空气中只剩下一阵漫长而意味深长的沉默，仿佛会一直持续下去。伊莎贝拉咳了一声，把你从恍惚中惊醒——你正站在那对汗光微亮的圆丘前，距离不过一英尺，你连忙把头往后一缩。要是你再向前倾一点，她那显眼的、带着四个乳头尖的乳晕就要进到你嘴里了。牛娘笑了起来，在你继续犹豫之前便伸手把你抱进怀里。你的脸颊被压在她左乳侧面的一块白斑上，而你的[ass]落在" + (get_noFur() ? "她粗壮的大腿上" : "她粗壮大腿上长出的短毛上") + "。伊莎贝拉柔声哄道：[say: 放松，[name]，让伊莎贝拉来满足你的口渴吧。你会喜欢的。][pg]");
            outputText("她强行调整你的姿势，左臂换了个角度托住你的背，把你从她胸口那片乳白色区域拖开，移到那对乳丘更深色的部分上。一个三英寸宽的乳头笼罩在你视野下方，湿润的甜香擦过你的嘴唇。你忽然强烈意识到，眼下这一切完全不在你的掌控之中。那双自信的手将你牢牢锁在怀里，而你以近乎无助的姿态蜷在伊莎贝拉的腿上；就算你想阻止，也没多少办法。你的嘴在她执拗压来的乳头前屈服，让四个乳尖一起滑过你收紧的入口，贴着你的舌头挤在一起。[pg]");
            outputText("也许是因为你的口渴，也许是这位高大牛娘的气场，又或是某种潜藏的本能，你发现自己开始用舌头绕着那几枚聚在一起的乳头打转，并吸吮起来。伊莎贝拉愉快地呻吟一声，用一股稳定流出的甜美温热乳汁奖赏你的饥渴。流速仍然不快——与其说是喷涌，不如说是四个乳头不断滴出的细流汇成了一道还算可观的水线——但你实在口渴，依旧照样吮吸、吞咽。托着你的手臂微微挪动，把你更用力地压向她古铜色的肌肤，直到你几乎被那光滑的褐色乳肉闷住。你稍稍加重吸力，细流便变成了水柱，轻易而迅速地灌满你的口腔，几乎不用你再费力去吸。焦糖色的乳丘挡住了你的视线，于是你干脆闭上眼，让它们休息，同时又咽下一大口越来越甜的母乳。[pg]");
            outputText("你叹了口气，亲昵地蹭了蹭伊莎贝拉，平静地喝着她的乳汁，却没注意到她的皮肤正逐渐升温，泛起一片片粉红。带着花蜜味的乳汁，以及吸吮、吞咽、呼吸的固定节奏，逐渐成了你全部的世界；你任由自己更深地靠进那对枕头般柔软的牛乳房里。两具身体贴得太近，空气变得又热又湿，一股熟悉的刺鼻气味在空气中弥漫开来，还伴随着伊莎贝拉那只空着的手发出的轻微湿响。你能感觉到它每一次抽动时都会擦过你的[ass]，正用有力的动作自慰着这位牛娘欲火肿胀的小穴。[pg]");
            outputText("那些平时足以撩起欲望的声音，此刻对你没什么影响，毕竟你正忙着。事实上，那一阵阵反复的湿滑声反倒有种安抚作用，像持续不断的背景低鸣，让你纷乱的心绪渐渐平静下来。随着口渴迅速消退，你开始用力吸吮，好奇她这对会喷奶的牛乳房到底要多久才会被吸干。白色的液体涌过你的舌头灌进喉咙，几乎要把你淹没，逼得你要么大口大口咽下去，要么松开嘴，而你并不想松口。你的手指陷进柔软的乳房里，一边挤压一边真正含紧不放，乘着那股白色浪潮一路吞饮，直到它终于耗尽，慢慢变回涓涓细流。[pg]");
            if(isabellaAccent())
            {
               outputText("伊莎贝拉喘息着把你拉开，你这才第一次看清她晒成褐色的肌肤已经泛起多么红润的色泽；可紧接着，你又被带着横过她的胸口，朝另一处尚未开封的淡色甘露泉移去。你刚想说自己已经够了，伊莎贝拉便在低沉而淫靡的呻吟间嘘声制止了你。[saystart]不，喝光吧，朋友。俺们可不想让你");
               if(!isabellaFollower())
               {
                  outputText("在回去的路上中暑！");
               }
               else
               {
                  outputText("在外头到处跑时中暑！");
               }
            }
            else
            {
               outputText("伊莎贝拉喘息着把你拉开，你这才第一次看清她晒成褐色的肌肤已经泛起多么红润的色泽；可紧接着，你又被带着横过她的胸口，朝另一处尚未开封的淡色甘露泉移去。你刚想说自己已经够了，伊莎贝拉便在低沉而淫靡的呻吟间嘘声制止了你。[saystart]不，喝吧，我的朋友。我们可不想让你");
               if(!isabellaFollower())
               {
                  outputText("在回去的路上中暑！");
               }
               else
               {
                  outputText("在外面到处跑时中暑！");
               }
            }
            outputText("噢噢……[sayend]她呻吟着，把你的嘴按进另一只乳房淌着奶的瀑流里。你含糊地想要回答，可张开的嘴立刻被乳头和乳汁填满，只剩下一串乱糟糟的咕噜声。你马上又开始重新吸吮，所有抗议都被那糖浆般的甜美冲得无影无踪。[pg]");
            outputText("牛娘暗褐色的柔软肉体压在你身上，她不断抽动着胯间，节奏越来越快。再加上她放浪的呻吟音调越拔越高、声音也越来越响，你能判断出她就快高潮了。乳汁先是变得更甜，接着又变得更浓稠。短短几秒间，它就化作醇厚沉重的奶油，让你的舌头都为之雀跃，撑得满满的肚子也咕噜作响。你吸得更用力，沉浸在这一刻，也沉浸在伊莎贝拉丰软怀抱带来的安适中；而她夹杂着哞叫的高潮，又把更多奶油灌满了你的嘴。你迷失在吞咽琼浆的感觉里，只要它还在流，就一直大口灌下，意识也彻底放空。不断涌入的乳汁把你的肚子撑得越来越胀，几乎像要爆开一样，可你还是继续喝着。[pg]");
            outputText("不知过了多久，你响亮地打了个嗝，依偎在面前那片完美而柔软的胸口上。一只手轻抚着你的[hair]，让你幸福地叹息。伊莎贝拉在你耳边轻声呢喃着无意义的温柔话语，而你也渐渐滑入一场无梦而安稳的沉睡。[pg]");
            if(get_player().hasCock() && _loc1_ >= 0)
            {
               outputText("一个小时后，你在一大堆铺开的毯子里醒来。你身下有一个柔软的枕头，上方还有另一个，你努力想从中间钻出去，直到一双手臂环住了你。那根本不是枕头——你被困在了牛娘的乳房之间！你小心翼翼地往下滑，带着渴望看了她那对巨大、仍在漏奶的乳头一眼，然后谨慎地从她的怀抱中脱身。她依旧打着鼾，对你的离开一无所觉；你找到自己的[armor]，重新穿戴起来。你的胯间隐隐有些紧绷酸痛，等你伸手下去调整了一下，再抬起手时，手上已经满是牛娘雌性的气味。");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,261) == 0)
               {
                  outputText("她、她趁你睡着把你强上了？你不确定她到底是怎么办到的，但你的");
                  if(get_player().balls > 0)
                  {
                     outputText("蛋蛋感觉");
                  }
                  else
                  {
                     outputText("身体感觉");
                  }
                  outputText("如此空虚又满足，想必已经泄了好几次。好吧，综合来看，你确实休息得相当充分，哪怕得到的东西比你要求的多了一点。也许下次你至少能在有趣的部分保持清醒！");
               }
               else
               {
                  outputText("她又趁你睡着把你睡了！你叹了口气，把手在自己的[leg]上擦干净，对这个似乎太害羞、不敢和醒着的人上床的牛娘有些哭笑不得。不过，你现在从各方面来说都彻底满足了。看来会是个不错的");
                  if(get_game().time.hours < 12)
                  {
                     outputText("一天");
                  }
                  else if(get_game().time.hours < 4)
                  {
                     outputText("下午");
                  }
                  else
                  {
                     outputText("夜晚");
                  }
                  outputText("。");
               }
               get_player().orgasm("Dick");
               get_player().changeFatigue(-50);
               _loc2_ = KFLAGS.flags;
               FlagDict_Impl_.arrayWriteInt(_loc2_,261,FlagDict_Impl_.arrayReadInt(_loc2_,261) + 1);
            }
            else
            {
               if(isabellaAccent())
               {
                  outputText("一小时后，你在地上一堆毯子里醒来，感到相当满足，也休息够了。伊莎贝拉在几尺外哼着一支好听的小曲，用磨刀石打磨一面巨盾的下缘。她注意到你便停下来，把那块巨大的金属物搁到一旁，发出“咚”的一声闷响。她以惊人的速度向你伸手，把你抱起来，在你的额头上亲了一下，说道，[say: 睡了个好觉没？嗯？谢谢你喝得这么起劲，我已经好几天没觉得这么轻松了。]伊莎贝拉把你放回地上，你伸了个懒腰，觉得精力格外充沛。");
               }
               else
               {
                  outputText("一小时后，你在地上一堆毯子里醒来，感到相当满足，也休息够了。伊莎贝拉在几尺外哼着一支好听的小曲，用磨刀石打磨一面巨盾的下缘。她注意到你便停下来，把那块巨大的金属物搁到一旁，发出“咚”的一声闷响。她以惊人的速度向你伸手，把你抱起来，在你的额头上亲了一下，说道，[say: 睡得好吗？嗯？谢谢你喝得这么起劲，我已经好几天没觉得这么轻松了。]伊莎贝拉把你放回地上，你伸了个懒腰，觉得精力格外充沛。");
               }
               get_player().changeFatigue(-65);
            }
         }
         if(!isabellaFollower())
         {
            get_isabellaFollowerScene().isabellaAffection(4);
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,375) > 0)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,375,0);
         }
         get_player().slimeFeed();
         get_player().refillHunger(40);
         if(Utils.rand(2) == 0)
         {
            outputText(get_player().modThickness(75,4));
         }
         if(Utils.rand(2) == 0 && get_player().hasVagina())
         {
            outputText(get_player().modTone(0,4));
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function leaveAngryIzzy() : void
      {
         spriteSelect(SpriteDb.get_s_isabella());
         clearOutput();
         outputText("你耸耸肩，明确表示自己要离开了。疯牛。她大喊道，[say: 离我远点，恶魔！伊莎贝拉不需要你的邪恶把戏！]");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function izzyGivesSmallWangsFreeOral() : void
      {
         spriteSelect(SpriteDb.get_s_isabella());
         var _loc1_:int = get_player().smallestCockIndex();
         clearOutput();
         outputText("你");
         if(get_player().cor < 33)
         {
            outputText("红透了脸，告诉伊莎贝拉，如果她想舔的话可以舔。");
         }
         else if(get_player().cor < 66)
         {
            outputText("脸一红，告诉伊莎贝拉她当然可以舔你一下。");
         }
         else
         {
            outputText("摆出淫荡的姿势，用手指划过你的胯部凸起，同时告诉伊莎贝拉，如果能感觉到她的舌头在你的" + get_player().cockDescript(_loc1_) + "上，你会多么高兴。");
         }
         outputText("牛娘脸红得厉害，连黝暗的双颊都泛起一抹玫瑰色，可她的胸膛因几乎压抑不住的兴奋而起伏不已。她从椅子上滑跪到地上，饥渴地舔了舔嘴唇，像个盯着最爱点心的孩子。她双手猛地向前探来，抓住你的[hips]，把你拽进一个由丰满乳房垫着的拥抱里。[pg]");
         outputText("伊莎贝拉立刻动手，用强硬有力的动作解开你[armor]的下半部分，强行剥下衣物时震得你的" + get_player().assDescript() + "一晃一晃。终于挣脱束缚后，你的" + get_player().cockDescript(_loc1_) + "垂弹出来");
         if(get_player().cockTotal() > 1)
         {
            outputText("和你那套不同寻常家伙的其余部分一起露了出来，不过伊莎贝拉");
            if(get_player().biggestCockArea() > 50)
            {
               outputText("把那根更大、没那么合她心意的肉棒");
               if(get_player().cockTotal() > 2)
               {
                  outputText("");
               }
               outputText("推到一旁");
            }
            else
            {
               outputText("把多出来的那根");
               if(get_player().cockTotal() > 2)
               {
                  outputText("");
               }
               outputText("推到一旁");
            }
         }
         else
         {
            outputText("，在牛娘强有力的手指间无力地颤抖着");
         }
         if(isabellaAccent())
         {
            outputText("。丰满的红发女郎高兴地尖叫起来，[say: 噢噢，它好可爱！就算像这样硬起来，看着也有点像该长在女孩子身上的东西。]她拽着它，牵着你的" + get_player().cockDescript(_loc1_) + "把你一路带到她的椅子前，然后把你推回座位上；那椅子还残留着牛娘丰腴屁股的温热。她问道，[say: 你觉得它能撑多久，嗯？真想知道它的奶是什么味道……][pg]");
         }
         else
         {
            outputText("。丰满的红发女郎高兴地尖叫起来，[say: 噢噢，它好可爱！就算像这样硬起来，看着也有点像该长在女孩子身上的东西。]她拽着它，牵着你的" + get_player().cockDescript(_loc1_) + "把你一路带到她的椅子前，然后把你推回座位上；那椅子还残留着牛娘丰腴屁股的温热。她问道，[say: 你觉得它能撑多久，嗯？真想知道它的奶是什么味道……][pg]");
         }
         outputText("牛娘拉低自己的领口，让你得以窥见她奶油与焦糖色交织的诱人乳沟。她俯身向前，把被乳汁胀满的双乳压在你的[legs]上，上下摩擦，让你能感觉到那两团柔软的乳肉在你周围挤压。伊莎贝拉的舌头伸了出来……越伸越长……还在伸，直到你看见至少七英寸长的舌头悬在你的" + get_player().cockDescript(_loc1_) + "上方。温热的唾液从她那条诱人舌头脉动着的光滑粉色表面滴落；舌尖来回甩动，离你的" + get_player().cockHead(_loc1_) + "还不到一英寸。每一滴落在你" + get_player().cockHead(_loc1_) + "上的牛娘唾液，都只会让你更加兴奋，直到你对着她低哼喘息，脸上带着渴求的表情，像野兽一样乞求着。[pg]");
         outputText("伊莎贝拉会意地坏笑着，一边抚摸你" + get_player().cockDescript(_loc1_) + "敏感的下侧，一边娇声说道，");
         if(isabellaAccent())
         {
            outputText("[say: 你喜欢，对吧？嗯哼，伊莎贝拉知道。我从你脸上看得出来。你不是那种变态吧？我觉得你可能是，不过我们得看看才知道，对吧？如果你是那种人，很快就会射得伊莎贝拉满舌头都是。我真心希望你能证明我是错的。]");
         }
         else
         {
            outputText("[say: 你喜欢，对吧？嗯哼，伊莎贝拉知道。我从你脸上看得出来。你不是那种变态吧？我觉得你可能是，不过我们得看看才知道，对吧？如果你是那种人，很快就会射得我满舌头都是。我真心希望你能证明我是错的。]");
         }
         outputText("为了强调自己的话，这位身材丰腴的牛娘俯下身，向你展示她究竟有多柔韧。她那又热又湿、滑腻无比的口中器官侧转过来，紧紧压在你" + get_player().cockHead(_loc1_) + "的一侧。下一瞬，它便滑了下去，她的舌头又在你的" + get_player().cockDescript(_loc1_) + "上绕了一圈。这个过程不断持续着，宽大的牛舌裹着唾液，像束带一样缠住你的男性，直到整根都被包进伊莎贝拉丝绒般的拥抱之中。[pg]");
         outputText("这感觉实在太他妈爽了！你忍不住大声呻吟");
         if(get_player().cor < 50)
         {
            outputText("，随后又红着脸，为自己放荡的举动感到羞耻，却又并不真的希望这一切停下。");
         }
         else
         {
            outputText("，随后幸福地叹息起来，沉浸在她舌头带来的触感里，完全不想让这一切结束。");
         }
         outputText("伊莎贝拉用舌头螺旋般地缠绕着你，你身体里的力气逐渐流失，包裹着你" + get_player().cockDescript(_loc1_) + "的温热黏湿也变得越来越烫。随着你逐渐适应这种感觉，先前感受到的满足感就像晴天里的冰淇淋一样融化消散。你的身体渴求着更多，而伊莎贝拉也顺势满足你，张大嘴唇，将你整个吞入口中。[pg]");
         outputText("那感觉像是阴道和口交之间某种奇妙的混合体，用糖浆般温热的触感浸透你的整根。");
         if(get_player().sens < 50)
         {
            outputText("你愉快地呻吟着，臀部本能地迎向牛娘那紧密如真空般的舌交。她将动作推到极限，试图让你赶快射出来。你淫荡地喘息着，抓住她的双角，把她的脸往后拉开一截，随后又按了下去；与此同时，你的" + get_player().cockDescript(_loc1_) + "正把先列腺液滴在她的舌面上。她来回拍动舌头，把那滑腻的东西抹满你的" + get_player().cockHead(_loc1_) + "，以精妙的快感折磨着你，那感觉足以让意志稍弱的人几秒内就喷出来。[pg]");
            if(isabellaAccent())
            {
               outputText("伊莎贝拉闷哼一声，向后退开，从你因快感而虚软的手指间抽出自己的双角，重重喘息着。她呻吟道，[say: Nein，我真不敢相信！这么小、这么硬的小鸡巴，我居然没能让它喷出来，连用上我的特殊技巧都不行！]她仰头望着你，脸颊潮红、气息紊乱，娇声说道，[say: 你果然不是变态。不是个" + get_player().mf("boy","maid") + "，而是一个[man]，还长着一根漂亮又美味的小鸡巴给伊莎贝拉吸。伊莎贝拉真是太幸运了！][pg]");
            }
            else
            {
               outputText("伊莎贝拉闷哼一声，向后退开，从你因快感而虚软的手指间抽出自己的双角，重重喘息着。她呻吟道，[say: 不，我真不敢相信！这么小、这么硬的小鸡巴，我居然没能让它喷出来，连用上我的特殊技巧都不行！]她仰头望着你，脸颊潮红、气息紊乱，娇声说道，[say: 你果然不是变态。不是个" + get_player().mf("boy","maid") + "，而是一个[man]，还长着一根漂亮又美味的小鸡巴给伊莎贝拉吸。伊莎贝拉真是太幸运了！][pg]");
            }
            outputText("牛娘兴致勃勃地重新投入工作，用舌头缠住你的" + get_player().cockDescript(_loc1_) + "。不过这一次，她没有全力施展螺旋技巧，而是开始上下套动，以娴熟的动作让那股滚烫湿滑沿着你的肉棒上下滑动。");
            if(get_player().balls > 0)
            {
               outputText("她托住你的[balls]，开始抚摸那对抽动的圆球；每当快感迫使它们不由自主地向你的腹股沟收缩时，她就轻轻捏上一下。");
            }
            else if(get_player().hasVagina())
            {
               outputText("她用手指探弄你的[vagina]，指尖划过你充血肿胀的唇瓣，并给你的[clit]");
               if(get_player().getClitLength() < 3)
               {
                  outputText("轻轻捏弄");
               }
               else
               {
                  outputText("用力套动");
               }
               outputText("。");
            }
            else
            {
               outputText("她用一根手指从");
               if(get_player().hasSheath())
               {
                  outputText("包皮");
               }
               else
               {
                  outputText("根部");
               }
               outputText("" + get_player().cockDescript(_loc1_) + "根部一路滑向你的[asshole]，用指甲轻轻挑弄那片敏感的肌肤。");
            }
            outputText("你再次抓住她的牛角，把她拉回位置；这位妩媚的牛女仆也毫不耽搁，立刻又用撅起的双唇吮吸起来。[pg]");
            outputText("伊莎贝拉并不反抗，任由你抓着她的牛角摆出不同姿势，引导这个痴迷口交的牛娘让嘴唇上下移动。即便她正用舌头发出淫靡的声音操弄你，你也依然在干她的脸。她始终满眼欢喜地仰望着你，或许是被人用如此粗俗的方式、用这么小巧的取乐工具使唤，反而让她兴奋不已。她的眼中闪着愉悦的光，脸上却因情欲而泛红。你加快节奏，试图让她措手不及。可这根本没用，她只是继续望着你，任你粗暴地干着她的脸，让口交的黏湿声响充满四周。[pg]");
            outputText("这样的情形持续了不知多久，直到你们两人都喘息不止，身上覆着一层细密汗水。伊莎贝拉终于闭上眼睛，舌头也在那一刻变得疯狂起来，螺旋般扭动的同时不断抽弄。简直像上了天堂！在高潮欲望催生出的力量下，你用力拉住她的牛角，把她撅起的双唇狠狠压到你的");
            if(get_player().hasSheath())
            {
               outputText("包皮");
            }
            else
            {
               outputText("身体");
            }
            outputText("上，而她的舌头则旋转着、抽送着你的" + get_player().cockDescript(_loc1_) + "，将你推向无可避免的释放。你努力忍耐得眼神都有些失焦，可不过数秒，那预示高潮的热意就在体内积聚起来。终于，你放弃抵抗，任由精液涌向牛娘那正在吮吸的小嘴。[pg]");
            outputText("伊莎贝拉绷紧舌头，用力挤压着你，哪怕");
            if(get_player().cumQ() >= 500)
            {
               outputText("粗大的");
            }
            outputText("一团团精液挤过你的尿道。在如此虎钳般的紧窒挤压下，释放几乎变得不可能，感觉越来越多的精液都倒堵在你的尿道里。伊莎贝拉仰头看着你，眨了眨眼，然后放松下来；下一瞬，你便将自己所能射出的最粗一股精液直直灌进她喉咙深处。妩媚的牛娘又让舌头动了起来，沿着你的整根肉棒上下抽送，随着");
            if(get_player().cumQ() < 100)
            {
               outputText("一股股");
            }
            else if(get_player().cumQ() < 1000)
            {
               outputText("一阵阵");
            }
            else
            {
               outputText("一波波");
            }
            outputText("精液从你痉挛的喷精肉管中飞溅而出。你");
            if(get_player().cumQ() < 250)
            {
               outputText("把最后的精液全都射在她舌头上，然后抽身退出。");
            }
            else if(get_player().cumQ() < 500)
            {
               outputText("把最后一股精液射进她肚子里，在抽出来时又淌满她早已等候的舌头。");
            }
            else if(get_player().cumQ() < 1500)
            {
               outputText("一大股一大股地把精液射进她肚子里，直到里面咕噜作响、被灌得满满当当；等你抽出来时，滴落的量也足够把她的舌头彻底浸透。");
            }
            else
            {
               outputText("在牛娘体内射入了足够多的精液，灌满她的肚子，甚至倒涌到她喉咙里。等你抽出来时，她嘴角两侧都挂着流淌的精液，滴落到她的乳房上，把她暗色的肌肤染成一片白。");
            }
            outputText("[pg]");
            outputText("伊莎贝拉退开身子，舔了舔嘴唇，这才让你意识到，你的[legs]已经被牛娘自己甜美的蜜液彻底浸湿了。");
            if(get_player().isGoo())
            {
               get_player().slimeFeed();
            }
            if(isabellaAccent())
            {
               outputText("她叹了口气，抬头望向天空，发出一声心满意足的“哞”。你自己愉悦的喘息要低调得多，但说真的，你也感到彻底满足了。伊莎贝拉看向你，欢快地说道：[say: 你不是变态！哦，伊莎贝拉真为你高兴！能遇到一个知道该怎么应付我舌头的人真是太有趣了，尤其是他还有这么多汁……这么小巧的家伙可以让我吸！][pg]");
               outputText("这位火辣的红发姑娘高高兴兴地帮你重新穿上[armor]，又毫不客气地在你的[ass]上拍了一巴掌，然后向你告别：[say: 早点回来，[name]！你可真是个了不起的[man]，就算你那根好吃的阴茎小了点。哦，别露出那种表情，它能产出这么美味的咸奶呢！我随时都愿意舔干净。好了，快去吧，你肯定还有很多事要做！]");
            }
            else
            {
               outputText("她叹了口气，抬头望向天空，发出一声心满意足的“哞”。你自己愉悦的喘息要低调得多，但说真的，你也感到彻底满足了。伊莎贝拉看向你，欢快地说道：[say: 你不是变态！哦，我真为你高兴！能遇到一个知道该怎么应付我舌头的人真是太有趣了，尤其是他还有这么多汁……这么小巧的家伙可以让我吸！][pg]");
               outputText("这位火辣的红发姑娘高高兴兴地帮你重新穿上[armor]，又毫不客气地在你的[ass]上拍了一巴掌，然后向你告别：[say: 早点回来，[name]！你可真是个了不起的[man]，就算你那根好吃的阴茎小了点。哦，别露出那种表情，它能产出这么美味的咸奶呢！我随时都愿意舔干净。好了，快去吧，你肯定还有很多事要做！]");
            }
         }
         else
         {
            outputText("你试图抵抗包裹着你的" + get_player().cockDescript(_loc1_) + "的极乐，但这对你可怜而敏感的身体来说实在太难承受。你终于放弃抵抗，放松下来，臀部本能地往她嘴里抽送，高潮的热意在你体内升起。伊莎贝拉的双眼仰望着你的脸，专注地注视着你，同时她的双唇始终紧紧包住");
            if(get_player().hasSheath())
            {
               outputText("你的肉鞘");
            }
            else if(get_player().balls > 0)
            {
               outputText("你睾丸上方的部位");
            }
            else
            {
               outputText("你的根部");
            }
            outputText("。她保持着这个姿势，随着你每一下不由自主的抽动而起伏，");
            if(get_player().balls > 0)
            {
               outputText("她的手抚摸并轻轻挤压着你的[balls]，仿佛这样就能从里面榨出更多精液来。");
            }
            else if(get_player().cockTotal() > 1)
            {
               outputText("她的手抚摸并挤压着你那被冷落的" + get_player().cockDescript(1) + "，几乎像是在漫不经心地把玩。");
            }
            else
            {
               outputText("她的手不断抚弄着，像是要把你的精液榨出来。");
            }
            outputText("[pg]");
            outputText("伊莎贝拉绷紧舌头，用力挤压着你，哪怕");
            if(get_player().cumQ() >= 500)
            {
               outputText("粗大的");
            }
            outputText("一股股精液正挤过你的尿道。在这种虎钳般的紧缚之下，释放似乎几乎不可能，而你感觉越来越多的精液都堵在了尿道里。伊莎贝拉眨了眨眼，随即放松下来，你立刻将自己所能射出的最粗一股精液喷进她的喉咙。诱人的牛娘又让舌头动了起来，沿着你的整根上下抽动，随着");
            if(get_player().cumQ() < 100)
            {
               outputText("一股股");
            }
            else if(get_player().cumQ() < 1000)
            {
               outputText("一阵阵");
            }
            else
            {
               outputText("一波波");
            }
            outputText("精液从你痉挛的喷精肉管中飞溅而出。你");
            if(get_player().cumQ() < 250)
            {
               outputText("把最后的精液全都射在她舌头上，然后抽身退出。");
            }
            else if(get_player().cumQ() < 500)
            {
               outputText("把最后一股精液射进她肚子里，在抽出来时又淌满她早已等候的舌头。");
            }
            else if(get_player().cumQ() < 1500)
            {
               outputText("一大股一大股地把精液射进她肚子里，直到里面咕噜作响、被灌得满满当当；等你抽出来时，滴落的量也足够把她的舌头彻底浸透。");
            }
            else
            {
               outputText("在牛娘体内射入了足够多的精液，灌满她的肚子，甚至倒涌到她喉咙里。等你抽出来时，她嘴角两侧都挂着流淌的精液，滴落到她的乳房上，把她暗色的肌肤染成一片白。");
            }
            outputText("[pg]");
            outputText("伊莎贝拉退开身子，舔了舔嘴唇，这才让你意识到，你的[legs]已经被牛娘自己甜美的蜜液彻底浸湿了。");
            if(get_player().isGoo())
            {
               get_player().slimeFeed();
            }
            if(isabellaAccent())
            {
               outputText("你浑身无力地叹了口气，牛娘却冲你调皮地晃了晃舌头，让你的" + get_player().cockDescript(_loc1_) + "因为回想起刚才的快感而跳动了一下。红发女人呻吟道，[say: 噢，我就知道！你就是个变态！我只是想稍微舔一舔，结果你用你那咸咸的……嗯……精液把我弄得全湿了。]她又停下来舔了舔嘴唇，随后满足地轻轻哞了一声。至少她看起来并没有生你的气！[pg]");
               outputText("这位晒成小麦色的女人失望地低头看着你，说道：[say: 你该走了，我的小鸡鸡变态朋友。也许你该去多做点爱，好学会别在刚尝到一点快感时就屈服？]你气得满脸通红，但她全程都在抚弄你半软的" + get_player().cockDescript(_loc1_) + "，唇边挂着一抹了然的笑。伊莎贝拉帮你穿好衣服，告别时在你的[ass]上用力拍了一下，说道：[say: 别变太多哦，" + get_player().mf("boy","maid") + "！我只希望你下次回来时，已经学会别在我一碰你的开关时就射出来！]");
            }
            else
            {
               outputText("你浑身无力地叹了口气，牛娘却冲你调皮地晃了晃舌头，让你的" + get_player().cockDescript(_loc1_) + "因为回想起刚才的快感而跳动了一下。红发女人呻吟道，[say: 噢，我就知道！你就是个变态！我只是想稍微舔一舔，结果你用你那咸咸的……嗯……精液把我弄得全湿了。]她又停下来舔了舔嘴唇，随后满足地轻轻哞了一声。至少她看起来并没有生你的气！[pg]");
               outputText("这位晒成小麦色的女人失望地低头看着你，说道：[say: 你该走了，我的小鸡鸡变态朋友。也许你该去多做点爱，好学会别在刚尝到一点快感时就屈服？]你气得满脸通红，但她全程都在抚弄你半软的" + get_player().cockDescript(_loc1_) + "，唇边挂着一抹了然的笑。伊莎贝拉帮你穿好衣服，告别时在你的[ass]上用力拍了一下，说道：[say: 别变太多哦，" + get_player().mf("boy","maid") + "！我只希望你下次回来时，已经学会别在我一碰你的开关时就射出来！]");
            }
         }
         if(!isabellaFollower())
         {
            get_isabellaFollowerScene().isabellaAffection(2);
         }
         get_player().orgasm("Dick");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function isabellaRapesYouWithHerAss() : void
      {
         clearOutput();
         var _loc1_:int = get_player().cockThatFits(38);
         if(_loc1_ < 0)
         {
            _loc1_ = 0;
         }
         if(get_player().get_HP() < 1)
         {
            outputText("你倒在伊莎贝拉的脚边，受到的伤害让你几乎失去了知觉。");
         }
         else
         {
            outputText("你倒在伊莎贝拉的脚边，可怜巴巴地自慰着，而她则低头怒视着你。");
         }
         outputText("牛娘把一只蹄子踩在你的胸口，将你按在她营地满是灰尘的草皮上，上下打量着你。这位胜利的红发女郎色眯眯地盯着你的下体，开始撕扯你的[armor]。没过几秒钟，她就让你的[cocks]暴露了出来。");
         if(get_player().get_lust() >= get_player().maxLust())
         {
            outputText("你抽搐的坚挺让伊莎贝拉露出了微笑，她柔声说道，");
            if(isabellaAccent())
            {
               outputText("[say: 噢，这么渴望被教训一顿，是吗？很好，伊莎贝拉会给你惩罚的！][pg]");
            }
            else
            {
               outputText("[say: 噢，这么渴望被教训一顿，嗯？很好，我会给你惩罚的！][pg]");
            }
         }
         else
         {
            outputText("她古铜色的肌肤抚摸着你的肉体，很快就将其挑逗得完全坚挺。伊莎贝拉的脸上浮现出会意且近乎残忍的微笑，她问道，");
            if(isabellaAccent())
            {
               outputText("[say:这么快就想要教训了，是吗？很好，伊莎贝拉可以惩罚你这个调皮的小[boy]。][pg]");
            }
            else
            {
               outputText("[say:这么快就想要教训了，嗯？很好，我可以惩罚你，你这个调皮的小[boy]。][pg]");
            }
         }
         outputText("她打算对你做什么？她之前看起来那么生气，但这……这听起来就像你要爽了。这位牛娘跨坐在你身上，她的橄榄色裙子像附近的平原草一样沙沙作响，当她在你的腹股沟上方摆好姿势时，裙子几乎掩盖不住里面的宝藏。这位巨乳红发女郎微微扭动着臀部，弯曲着粗壮的大腿，慢慢蹲下身来。等待的每一秒都令人备受煎熬，她那汗津津的翘臀摩擦着你的" + get_player().cockHead(_loc1_) + "的感觉简直让人发狂。");
         if(get_player().cockTotal() > 1)
         {
            if(get_player().cockTotal() > 2)
            {
               outputText("这头母牛伸手拍开你的一些" + Appearance.cockNoun(CockTypesEnum.HUMAN) + "，把它们推到一边。[saystart]真恶心。为什么");
               if(isabellaAccent())
               {
                  outputText("你会想要这么多肉棒？[sayend]");
               }
               else
               {
                  outputText("你会想要这么多阴茎吗？[sayend]");
               }
            }
            else
            {
               outputText("这个母牛婊子伸手抚摸你的" + get_player().cockDescript(_loc1_) + "。[saystart]这么急不可耐，");
               if(isabellaAccent())
               {
                  outputText("对吧？为什么你这么渴望被惩罚？[sayend]");
               }
               else
               {
                  outputText("嗯？为什么你这么渴望被惩罚？[sayend]");
               }
            }
         }
         outputText("[pg]");
         outputText("伊莎贝拉又往下沉了一英寸，将你的" + get_player().cockHead(_loc1_) + "紧紧压在她紧致的菊穴口上。她研磨着、收缩着，夹紧臀瓣，用那被汗水润滑的“台钳”包裹住你的肉棒。你大声呻吟，伸手想要抓一把那古铜色的“天堂”，但这位大腿粗壮的胜利者根本不吃这一套。一记响亮的耳光打得你眼冒金星，差点让你的下巴脱臼。伊莎贝拉斥责道，");
         if(isabellaAccent())
         {
            outputText("[say: Nein！你正在受罚！]");
         }
         else
         {
            outputText("[say: 不！你正在受罚！]");
         }
         outputText("你垂下手，痛苦地呻吟着，先列腺液漏在这个淫荡牛娘的屁眼上，而她继续拒绝你的插入。[pg]");
         outputText("她在干什么！？她的屁股只是在你的肉棒上挤压和弹跳，用插入的念头挑逗你，而她紧致的、沾满先列腺液的括约肌却对你的" + get_player().cockDescript(_loc1_) + "紧闭着。这头母牛突然改变了节奏，开始交替收缩她女性化的臀瓣，用它们交替抚摸你" + get_player().cockDescript(_loc1_) + "的两侧，不断变化的压力使其微微弯曲和弯折。感觉很好，甚至很棒，但这还不够——不足以让你高潮。伊莎贝拉看着你痛苦、饥渴的表情，咯咯地笑着说：[say: 你为你是个调皮、邪恶的[boy]感到抱歉吗？][pg]");
         outputText("这不公平！你哀怨地大叫，问她到底想让你做什么，但伊莎贝拉看起来比以往任何时候都失望。[say: 这还不明显吗？]她质问道，");
         if(isabellaAccent())
         {
            outputText("[say: 我要你打心底里为你那邪恶下流的行为道歉。在你道歉之前，我会一直用我的屁股夹着你摩擦！]");
         }
         else
         {
            outputText("[say: 我要你打心底里为你那邪恶下流的行为道歉！在你道歉之前，我会一直夹着你摩擦！]");
         }
         outputText("你闭上眼睛，试图专注于她带给你的有限快感——也许你可以不用道歉就能射出来？但这位牛娘可不吃这一套，每当你感觉到高潮临近的标志性温热");
         if(get_player().balls > 0)
         {
            outputText("，或是你的[sack]收紧并拉扯着你的[balls]时");
         }
         outputText("，她就会放慢动作，拒绝让你释放出那泥泞的奖赏。你试图微微挺起臀部来获取更多的摩擦，但这只换来了一记响亮的耳光。[pg]");
         outputText("你别无选择。你硬得发疼，而伊莎贝拉却是个无情的挑逗者。每当你闭上眼睛，她就会把奶水喷到你脸上，等你眨眼把奶水从眼睛里挤出去时，她已经把那件薄纱上衣拉回了原位。尽管如此，你还是能透过被奶水浸湿的布料看到她那四尖乳晕的轮廓，这只会让你那已经硬得发疼的肉棒充血得更厉害。没有别的办法了。你咽下自尊，努力无视眼角滑落的泪水，尽可能真诚地乞求道，[say: 好吧好吧，对不起！我会乖乖的。我保证。让我射吧！好疼啊！][pg]");
         outputText("伊莎贝拉看起来若有所思，但她轻蔑地摇了摇头。");
         if(isabellaAccent())
         {
            outputText("[say: 不，那不是悲伤。你只是遗憾自己不能射精，而不是为自己像个野兽一样而感到抱歉。你必须说服我！]");
         }
         else
         {
            outputText("[say: 不，那不是悲伤。你只是遗憾自己不能射精，而不是为自己像个野兽一样而感到抱歉。]");
         }
         outputText("她命令道。你撅起下嘴唇，可怜巴巴地抬起头，下定决心要从这头残忍的母牛那里赢得你的高潮。你哀鸣着，[saystart]求求你了，伊莎贝拉，我一直是个非常坏的[boy]！我那调皮的");
         if(get_player().hasCockThatFits(38))
         {
            outputText("小");
         }
         else
         {
            outputText("、下流的");
         }
         outputText("肉棒已经又硬又胀了，只要你让我高潮，我保证会乖乖听话。求你了！只要你愿意，我随时都可以喝你的奶，舔你的小穴。我什么都愿意做！[sayend][pg]");
         outputText("牛娘笑得像只偷吃了奶油的猫，不过在这个情况下，这只“猫”自己就能产出很多奶油。她柔声说道：[say:嗯，真是个好[boy]，我最喜欢给我的好[boy]很多奖励了。准备好让伊莎贝拉妈妈让你爽上天了吗？]你拼命点头，脖子都快扭到了，惹得红发女郎发出一阵可爱的娇笑。");
         if(get_player().hasCockThatFits(38))
         {
            outputText("她丰满的屁股向下滑动，弓起背，将你的" + get_player().cockHead(_loc1_) + "紧紧压在她那紧致、被先列腺液润湿的肛门上。牛娘慢慢放松，让肌肉扩张，容纳你的性器进入。紧致的肌肉环滑过你的龟头，在冠状沟处紧缩了片刻，随后她肌肉的紧绷感才慢慢消散。当你的" + get_player().cockDescript(_loc1_) + "一寸寸被她的肠道吞没时，她那大而圆润的臀瓣不由自主地收缩着。这个过程极其折磨人，但最终，红发女郎将她柔软的臀部紧紧贴在了你的腹股沟上");
            if(get_player().cockTotal() > 1)
            {
               outputText("，挤压着你的另一根肉棒");
            }
            if(get_player().cockTotal() > 2)
            {
               outputText("");
            }
            outputText("。[pg]");
            outputText("在短暂的适应之后，伊莎贝拉开始上下摇晃，喘息着、闷哼着，你的" + get_player().cockDescript(_loc1_) + "用滴落的先列腺液涂满了她的内壁。每一次淫荡的、吞没肉棒的后庭交媾，那圆润的古铜色牛臀都会拍打在你的身上。你呻吟着，被这肌肉发达的牛娘那紧致得令人窒息的后门和折磨人的前戏弄得神魂颠倒。而这头母牛则忙着舔嘴唇和拉扯乳头，不断地将母乳泼洒在你身上，随着她臀部的跳动起伏不定。[pg]");
            outputText("你忍不住了——在经历了这么多挑逗之后！你下体的紧绷感清晰可辨，随着时间的推移，这种感觉越来越强烈。");
            if(get_player().balls > 0)
            {
               outputText("不随意肌收缩着，将你的[sack]拉向胯部，同时你的[balls]肉眼可见地收缩，让你的身体充满了即将爆发的欲望之液。");
            }
            else
            {
               outputText("不随意肌收缩着，在你的体内紧绷，你的前列腺让尿道充满了即将爆发的欲望之液。");
            }
            outputText("伴随着一次猛烈的、让肉棒肿胀的抽搐，你将第一股浓稠的精液射入了牛娘等待着的穴中。她的尾巴展现出惊人的控制力，卷住了你的");
            if(!get_player().hasSheath())
            {
               outputText("根部");
            }
            else
            {
               outputText("包皮");
            }
            outputText("，在你泵出下一团爱液时深情地挤压着它。当她紧致的孔洞将你的精液榨出时，你闷哼、呻吟、叹息。");
            if(get_player().cumQ() >= 1000)
            {
               outputText("这种情况持续了一段时间，甚至让伊莎贝拉因为被液体灌满的不适而闷哼出声");
               if(get_player().cumQ() >= 1500)
               {
                  outputText("，但你的" + get_player().cockDescript(_loc1_) + "却没有停歇的意思。她哭喊着、呻吟着，精液从你的肉棒周围溢出");
               }
               if(get_player().cumQ() >= 2500)
               {
                  outputText("，但你还是坚持了下去，流出浓稠的精液，直到连地面都被浸透了");
               }
            }
            outputText("。");
            if(get_player().cockTotal() > 1)
            {
               outputText("与此同时，你的胸膛被那根可怜的、被压住的肉棒射满了精液");
               if(get_player().cockTotal() > 2)
               {
                  outputText("");
               }
               outputText("被困在母牛那汗流浃背的身体下。");
            }
            outputText("[pg]");
            outputText("伊莎贝拉叹了口气，拔出来时因为用力而微微喘息着，到处滴落着粘稠的精液。看着你脸上的紧绷感消退，她微笑着说：[say:真是个好[boy]，全都射出来了。所有那些肮脏、恶心的东西都为了我从你的身体里涌出来……是的，你是我的好男孩。]牛娘在你的嘴唇上印下深深的一吻，将她宽阔平坦的舌头滑过你的舌头。你叹了口气，但她打破了吻，慵懒地伸了个懒腰。疲惫感袭来，你陷入了安稳的沉睡，只有在身体被移动时摇晃的感觉才会打断你的睡眠。");
         }
         else
         {
            outputText("她丰满的屁股一路滑到你的");
            if(!get_player().hasSheath())
            {
               outputText("根部");
            }
            else
            {
               outputText("包皮");
            }
            outputText("，让你不由自主地发出一声低沉的呻吟。接着她绷紧大腿向上抬起，将那黝黑、满是汗水的臀瓣沿着你的肉棒向上拉扯，收缩肌肉，时紧时松地夹弄着你。她上下起伏，紧绷并弹动着她那丰满的臀部，套弄着你的" + get_player().cockDescript(_loc1_) + "。");
            if(get_player().cockTotal() > 2)
            {
               outputText("尽管它们被忽视了，但每次她的臀瓣挤压到你其他的肉棒时，都会挤出几股先列腺液。");
            }
            else if(get_player().cockTotal() > 1)
            {
               outputText("尽管它被忽视了，但每次她的臀瓣挤压到你另一根肉棒时，都会挤出一股先列腺液。");
            }
            outputText("[pg]");
            outputText("经过这么多的挑逗和折磨，你猛烈地高潮了。");
            if(get_player().balls > 0)
            {
               outputText("你的[sack]紧紧贴着身体，你的每颗[balls]都在颤抖，将里面的存货推挤出来。");
            }
            else
            {
               outputText("你的身体似乎紧绷得像小提琴的琴弦，你感觉到你的器官在颤抖，努力将你的存货推挤出来。");
            }
            outputText("温暖的压力越来越高，然后你立刻射了出来，将一串串精液喷射到半空中。你的尿道膨胀，喷出下一批精液，溅在伊莎贝拉的背上。其中一些落在了她的黑色皮革紧身胸衣上，给它涂上了一层灰白色的光泽。");
            if(get_player().cockTotal() > 1)
            {
               outputText("精液喷洒在你的胸前，那是被你遗忘的额外肉棒射出的");
               if(get_player().cockTotal() > 2)
               {
                  outputText("");
               }
               outputText("，但它比较微弱，几乎像是个事后的补充。");
            }
            outputText("你不断喷射，直到身体完全被掏空，留下你的" + get_player().cockDescript(_loc1_) + "在抽搐和收缩，试图卸下幻影般的精液。[pg]");
            outputText("你视线重新聚焦，看着你的杰作。伊莎贝拉的衣服上涂满了一层厚厚的粘液。它顺着她古铜色的臀部滴落，渗过你的");
            if(get_player().balls == 0)
            {
               outputText("胯部");
            }
            else
            {
               outputText("蛋蛋");
            }
            outputText("，在地上汇聚在你的[legs]周围。");
            if(get_player().cumQ() >= 1000)
            {
               outputText("一串串精液从伊莎贝拉深红色的头发上滴落，把她的头发粘在脖子上，滴在她的衬衫上。你周围的泥土已经变成了粘稠的泥浆，因为你大量的遗留物而几乎变成了白色。");
            }
            if(get_player().cumQ() >= 2000)
            {
               outputText("精液完全浸透了你们俩，它的体积和数量甚至让你都感到惊讶。");
            }
            outputText("[pg]");
            outputText("伊莎贝拉叹了口气，看着你脸上的紧张感消退，她因为刚才的努力而微微喘息着。[say:真是个好[boy]，全都释放出来了。所有那些肮脏、下流的东西都为了我从你的身体里倾泻而出……是的，你是我的好男孩。]牛娘在你的嘴唇上深深一吻，将她宽阔平坦的舌头滑过你的舌头。你叹了口气，但她打破了吻，慵懒地伸了个懒腰。你疲惫不堪，陷入了宁静的沉睡，只有在身体被移动时摇晃的感觉才会打断你的睡眠。");
         }
         if(!isabellaFollower())
         {
            get_isabellaFollowerScene().isabellaAffection(4);
         }
         get_player().orgasm("Dick");
         dynStats(DynStat.Sens(2));
         get_combat().cleanupAfterCombat();
      }
      
      public function isabellaGreetingFirstTime() : void
      {
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,256,1);
         isabellaGreeting();
      }
      
      public function isabellaGreeting() : void
      {
         var _loc2_:* = null as IMap;
         spriteSelect(SpriteDb.get_s_isabella());
         clearOutput();
         var _loc1_:Function = null;
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,256) == 0)
         {
            outputText("你穿行在高高的草丛中，听见一个丰润而高亢的嗓音正用你不太听得懂的语言，婉转地哼唱着一段旋律。你要靠近，还是避开？");
            menu();
            addButton(0,"靠近",isabellaGreetingFirstTime);
            setExitButton();
            return;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,260) > 0)
         {
            outputText("你无意间闯进了伊莎贝拉的营地，而这位牛娘看起来仍然对你相当火大。她朝你冲来，一边靠近，一边把手臂穿进盾牌的绑带里。要开打了！");
            startCombat(new Isabella());
            if(!isabellaFollower())
            {
               get_isabellaFollowerScene().isabellaAffection(-4);
            }
            spriteSelect(SpriteDb.get_s_isabella());
            return;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,257) == 0)
         {
            _loc2_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc2_,257,FlagDict_Impl_.arrayReadInt(_loc2_,257) + 1);
            outputText("你跌跌撞撞地穿过高大草叶间的一处缺口，发现了一片狭小而荒芜的空地。这里看起来曾经长过草，但早已被踩进了泥土里。你凑近一看，它让你想起小时候邻居谷仓里那些总是被压进坚硬泥地的旧稻草。这里有几只相当大的箱子，都用沉重的铁锁锁着，上面还搭着看起来很舒服的毯子。这些沉重的箱子围成半圈，环绕着一把椅子，而营地主人那相当宽大的屁股此刻正坐在椅子上。这里让你想起了自己营地的简陋版本。[pg]");
            outputText("即使只是坐着，这处露天营地的主人也显得很有压迫感。要是她站起来，身高至少得有[if (metric) {两米|七英尺，甚至可能有八英尺}]。你从背后看着她，除了她身形中显而易见的女性曲线和那轻快婉转的嗓音外，你能看到的只有她那头乱糟糟的红发。女人的声音攀至高处，以尖锐到让你以为箱子上的铁锁和铆钉都会裂开的音调，结束了她那首奇特的歌。幸好，她歌声的高潮十分短暂，很快便降成低低的颤音，最后消散在沉默之中。她站起身，回头瞥了一眼，注意到你后双眼因震惊而睁大，猛地向后一跳。[pg]");
            outputText("她是个牛娘！好吧，也不完全是。");
            if(get_player().hasStatusEffect(StatusEffects.Marble))
            {
               outputText("她和玛布尔有点像——长着人类的脸，却有角和像牛一样的耳朵。");
            }
            else
            {
               outputText("她有一张人类的脸，但头顶还长着一对短短的牛角，旁边垂着一对软塌塌的牛耳。");
            }
            outputText("她的皮肤晒得很深，几乎像牛奶巧克力般棕褐，但几块圆润的、珍珠般白皙的皮肤斑点打破了这份单一。这个牛娘穿着一件薄如蝉翼的丝质衬衫，由黑色皮革束身衣和红色蕾丝撑托着。她还穿着一条朴素的橄榄色短裙，勉强遮住私处；每当微风轻拂，几乎都要失去它本来的作用。她宽大的臀部向下延展成丰腴的大腿，随后" + (get_noFur() ? "在膝盖上方一点" : "") + "隐没在一层蓬乱的赤褐色毛发下；那毛发越接近她的蹄子就越发浓密。[pg]");
            if(get_player().get_tallness() > 78)
            {
               outputText("牛娘不悦地皱起眉头，打量着你那令人印象深刻的高大身形。她带着奇怪的口音说道：[say:你是谁，你在这里做什么？][pg]");
               outputText("你开口回答，开始解释自己的来意，可她打断了你：[say:滚出去！这是我的营地，我不准你待在这里！][pg]");
               outputText("她激烈的反应让你有些措手不及。你困惑地眨了眨眼，只见她从椅子后面抽出一面巨大的盾牌，熟练地把手臂套进绑带里。你要怎么做？[pg]");
               menu();
               addButton(0,"试着交谈",tryToTalkDownAngryCow);
               addButton(1,"战斗",unwelcomeFightCowGal);
               addButton(14,"离开",leaveAngryIzzy);
            }
            else
            {
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,259) < 0)
               {
                  _loc2_ = KFLAGS.flags;
                  FlagDict_Impl_.arrayWriteInt(_loc2_,259,FlagDict_Impl_.arrayReadInt(_loc2_,259) + 1);
               }
               outputText("牛娘那双棕色大眼睛在看向你相对娇小的身形时变得柔和。她微笑着，用哄人的语气说道：[say:哎呀，你真是个小可爱！伊莎贝拉怎么可能赶走你这样的人呢。过来吧，想喝点什么吗？]");
               outputText("[pg]你走上前，与这位友善的女人互相介绍了一番，但仍有些被她的热情弄得措手不及。");
               if(get_player().hasCock())
               {
                  outputText("她嗅了嗅空气，立刻朝你的胯下瞥去。");
                  if(get_player().shortestCockLength() <= tinyPenis())
                  {
                     outputText("当看到你那小小的隆起时，这牛娘的眼中几乎蒙上一层欲火。伊莎贝拉央求道：[say:你、你能再靠近一点吗？我……我喜欢“小”情人，也喜欢……“舔”。]为了强调这一点，她伸出舌头给你看，那是一片将近八英寸长、扁平宽阔的粉红舌肉。");
                     _loc1_ = izzyGivesSmallWangsFreeOral;
                  }
                  else
                  {
                     outputText("牛娘合上眼睛；当她看到你胯下隆起的惊人尺寸时，脸上的失望清晰可见。");
                  }
               }
               menu();
               addButton(0,"交谈",talkWithIsabella);
               addButton(1,"喝奶",nomOnMommaIzzysTits);
               addButton(2,"被舔",_loc1_);
               addButton(3,"战斗",fightIsabella);
               setExitButton();
            }
            return;
         }
         if(get_player().get_tallness() > 78 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,258) == 0)
         {
            outputText("你跌跌撞撞地穿过草丛，险些绊倒。草叶分开后，伊莎贝拉营地那如今已熟悉的景象出现在眼前。牛娘立刻发现了你，龇牙低吼道：[say:滚开！我已经警告过你一次了！]");
            menu();
            addButton(0,"试着交谈",tryToTalkDownAngryCow);
            addButton(1,"战斗",fightIsabella);
            addButton(14,"离开",leaveAngryIzzy);
            return;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,258) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,259) == 0 && get_player().get_tallness() <= 78)
         {
            _loc2_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc2_,259,FlagDict_Impl_.arrayReadInt(_loc2_,259) + 1);
            outputText("你跌跌撞撞地穿过一堵高高的草墙，回到了伊莎贝拉的营地！真不可思议，自从你上次来过之后，这些草竟然长高了这么多。又或者，只是因为你的身高变了，才让它们看起来如此高大。你四处寻找伊莎贝拉，很快就看到那个火红头发的牛娘正朝你猛冲过来，哞哞叫着喊道，[say:啊啊啊，你变得可爱多了！有这么小小的、可爱的朋友真是太棒了！你是回来喝我的特制饮品的吗？]她一把将你抱住，把你压进颤巍巍的胸肉之间。短短几秒后，你就被她抱在怀里，而她则惊叹地打量着你如今的新尺寸。[pg]");
            if(get_player().hasCock())
            {
               outputText("她的鼻子抽动了一下，并且");
               if(get_player().shortestCockLength() <= tinyPenis())
               {
                  outputText("她低头看向你小小的鼓包。伊莎贝拉的嘴唇勾起一个淫荡的笑容，声音也变得沙哑起来。[say:也许你可以……把它掏出来给我看看？我只是想稍微舔一下。]");
                  _loc1_ = izzyGivesSmallWangsFreeOral;
               }
               else
               {
                  outputText("她低头看向你的");
                  if(get_player().cocks[get_player().shortestCockIndex()].cockLength < 20)
                  {
                     outputText("大大的");
                  }
                  else
                  {
                     outputText("巨大的");
                  }
                  outputText("鼓包。伊莎贝拉叹了口气，嘟囔着说它太大了，玩起来就没意思了。");
               }
               outputText("[pg]");
            }
            outputText("这个牛娘深色的脸颊因尴尬而泛起粉红，随后她把你放下并道歉道，[say:我真的很抱歉。这里的平原太寂寞了，而且，喂别人喝东西的时候，该怎么说呢……如果能把他们抱在怀里，就会更有趣！][pg]");
            outputText("你今天想和伊莎贝拉做些什么？");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,259) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,258) == 0 && get_player().get_tallness() > 78)
         {
            outputText("你轻松拨开高高的草丛，大步走进牛娘伊莎贝拉的营地。你到来时，她似乎正坐在椅子上缝补一条毯子。你趁机看了一会儿她弯着腰的姿态，那让她的乳房紧紧挤在她钟爱的薄纱丝质上衣上。透过近乎透明的布料，可以清楚看到一侧乳晕的轮廓，但最引人注目的是，每个乳晕上都有四个格外显眼的乳头尖。她看向你，先是吓了一跳，随后又因为认出了你，并立刻意识到你刚才在做什么而尴尬起来。[pg]");
            dynStats(DynStat.Lust(10 + Utils.rand(10)));
            outputText("伊莎贝拉抱怨道，[say:你刚才是在偷看我吗？好吧，我得承认，你个子更矮的时候我更喜欢。也许你要是好好开口求我，我可以让你看一眼，再喝一点。那会很不错，不是吗？][pg]");
            _loc2_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc2_,258,FlagDict_Impl_.arrayReadInt(_loc2_,258) + 1);
            if(get_player().hasCock())
            {
               outputText("她嗅了嗅，又瞥了一眼你的胯下");
               if(get_player().shortestCockLength() > tinyPenis())
               {
                  outputText("随后惆怅地叹了口气。");
               }
               else
               {
                  outputText("，接着又提出了别的建议。[say:也许你可以把衣服脱掉？我喜欢用舌头玩，要是你懂我的意思。]");
                  _loc1_ = izzyGivesSmallWangsFreeOral;
               }
            }
         }
         else
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,371) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,369) == 0 && get_isabellaFollowerScene().isabellaAffection() >= 50 + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,367) * 15)
            {
               get_isabellaFollowerScene().isabellaMoovesInGreeting();
               return;
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,259) < 0)
            {
               _loc2_ = KFLAGS.flags;
               FlagDict_Impl_.arrayWriteInt(_loc2_,259,FlagDict_Impl_.arrayReadInt(_loc2_,259) + 1);
            }
            outputText("你穿过高高的草丛时，听见一个熟悉的声音正用尖细的嗓音唱着异国的歌曲。听起来牛娘伊莎贝拉又开始了。你循着那悠扬的旋律慢慢走去，随着歌声在旅途中变得越来越高、越来越响，你也不由得露出微笑。不久后，你从草丛边缘钻出，正好看见伊莎贝拉唱完最后一句。这个曲线丰腴的牛娘似乎完全没注意到你的存在，仍沉浸在故乡的音乐之中。[pg]");
            outputText("你耐心等待着，看着她丰满的身体微微移动，看着她那对因奶水而胀大的乳房在近乎透明的衬衫里危险地晃动。她长着四个乳头尖的乳晕清楚地暴露在外，显然已经胀得厉害，随时都可能渗出奶来。如果不是身处这个怪异的地方，你一定会惊讶于她的胸部简直就是长在人身上的乳房。但在这里，这不过又是为她异域魅力添彩的一点罢了。[pg]");
            outputText("伊莎贝拉唱完歌，转向你，带着闪闪发亮的笑容问道，[say:你是回来喝些奶的吗？]");
            if(get_player().hasCock())
            {
               outputText("她深深嗅了一口，目光从你的[legs]之间看向你的胯部");
               if(get_player().shortestCockLength() > tinyPenis())
               {
                  outputText("，惆怅地叹了口气。");
               }
               else
               {
                  outputText("。她的舌头不自觉地舔过嘴唇，然后问道，[say:嗯，尺寸刚刚好。我可以舔一下吗？]");
                  _loc1_ = izzyGivesSmallWangsFreeOral;
               }
            }
         }
         menu();
         addButton(0,"交谈",talkWithIsabella);
         addButton(1,"喝奶",nomOnMommaIzzysTits);
         addButton(2,"被舔",_loc1_);
         addButton(3,"战胜强奸",fightIsabella);
         addButton(4,"主动口交",volunteerToSlurpCowCunt);
         setExitButton();
      }
      
      public function isabellaDefeats() : void
      {
         if(get_monster().statusEffectv1(StatusEffects.Sparring) <= 1)
         {
            if(get_player().hasCock() && Utils.rand(2) == 0)
            {
               isabellaRapesYouWithHerAss();
            }
            else
            {
               IsabellaWinsAndSpanks();
            }
         }
         else
         {
            get_combat().cleanupAfterCombat();
         }
      }
      
      public function getIsabellaChildType(param1:int) : int
      {
         var _loc4_:* = null as Array;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         while(_loc3_ < int(isabellaOffspringData.length))
         {
            if(int(isabellaOffspringData[_loc3_]) > 3)
            {
               _loc4_ = isabellaOffspringData;
               _loc4_[_loc3_] -= 2;
            }
            if(int(isabellaOffspringData[_loc3_]) == param1)
            {
               _loc2_++;
            }
            _loc3_ += 2;
         }
         return _loc2_;
      }
      
      public function getIsabellaChildGender(param1:int = 0, param2:String = undefined, param3:String = undefined, param4:String = undefined) : String
      {
         if(param2 == null)
         {
            param2 = "boy";
         }
         if(param3 == null)
         {
            param3 = "girl";
         }
         if(param4 == null)
         {
            param4 = "na";
         }
         switch(int(isabellaOffspringData[param1 * 2]))
         {
            case 1:
               return param2;
            case 2:
               return param3;
            case 3:
               if(param4 == "na")
               {
                  return param3;
               }
               return param4;
               break;
            case 4:
               return param3;
            case 5:
               if(param4 == "na")
               {
                  return param3;
               }
               return param4;
               break;
            default:
               return "[pg]错误！无效的孩子或性别：i = " + param1 + "，switch = " + int(isabellaOffspringData[param1 * 2]) + "[pg]";
         }
      }
      
      public function getIsabellaChildAge(param1:int = 0) : int
      {
         return int(get_game().time.days) - int(isabellaOffspringData[param1 * 2 + 1]);
      }
      
      public function fightIsabella() : void
      {
         clearOutput();
         if(!isabellaFollower())
         {
            get_isabellaFollowerScene().isabellaAffection(-5);
         }
         outputText("你对伊莎贝拉露出坏笑，握紧[weapon]，告诉她你打算随心所欲地享用她。她的脸一下子涨得通红，抓起盾牌宣告道，[say: 你不会觉得我这么容易得手吧，我会惩罚你这个坏家伙的！]");
         startCombat(new Isabella());
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,260,FlagDict_Impl_.arrayReadInt(_loc1_,260) + 72);
         spriteSelect(SpriteDb.get_s_isabella());
      }
      
      public function defeatIsabella() : void
      {
         var _g:Combat;
         clearOutput();
         if(get_monster().statusEffectv1(StatusEffects.Sparring) == 2)
         {
            outputText("你推了推");
            if(get_monster().get_HP() < 1)
            {
               outputText("被打晕的");
            }
            else
            {
               outputText("被情欲冲昏头脑的");
            }
            outputText("牛娘，她立刻瘫倒在地，认输了。既然这只是一场轻松的切磋，你把她扶起来带回营地，好让她");
            if(get_monster().get_HP() < 1)
            {
               outputText("休养生息。");
            }
            else
            {
               outputText("解决她的需求（或者被解决）。");
            }
            get_combat().cleanupAfterCombat();
            return;
         }
         outputText("你推了推");
         if(get_monster().get_HP() < 1)
         {
            outputText("被打晕的");
         }
         else
         {
            outputText("被情欲冲昏头脑的");
         }
         outputText("母牛婊子，感觉你的手陷进她那枕头般柔软的乳房里半秒钟，然后她就失去平衡，一屁股重重地摔在地上。伊莎贝拉");
         if(get_monster().get_HP() < 1)
         {
            outputText("呻");
         }
         else
         {
            outputText("呻");
         }
         outputText("吟着，");
         if(get_monster().get_HP() < 1)
         {
            if(isabellaAccent())
            {
               outputText("[say: 为什么你非得像他们一样？你的行为简直像个恶魔！离我的牛奶远点！]");
            }
            else
            {
               outputText("[say: 为什么你非得像他们一样？你的行为简直就像个恶魔！离我的牛奶远点！]");
            }
         }
         else if(isabellaAccent())
         {
            outputText("[say: 我不想这样的！……但是，求你了，我涨了好多奶……喝我的哞哞——奶吧！]");
         }
         else
         {
            outputText("[say: 我不想这样的！求你了，我涨了好多奶……喝我的哞哞——奶吧！]");
         }
         if(get_monster().get_HP() < 1)
         {
            outputText("她表现得那么高傲，但却掩饰不住她那顶起薄薄上衣的乳头。");
         }
         else
         {
            outputText("她表现得好像她需要的只是挤奶，但你能闻到她“下面”渗出的湿气。");
         }
         menu();
         addButtonDisabled(0,"泌乳69");
         addButtonDisabled(1,"肛交");
         addButtonDisabled(2,"六十九");
         addButtonDisabled(3,"阴道交");
         addButtonDisabled(4,"大乳交");
         addButtonDisabled(5,"小乳交");
         _g = get_combat();
         addButton(14,"离开",function():void
         {
            _g.cleanupAfterCombat();
         });
         if(get_player().get_lust() < 33)
         {
            return;
         }
         var _loc1_:Boolean = get_player().hasCock();
         addButton(0,"泌乳69",victoryLactation69).disableIf(get_player().biggestLactation() < 1);
         addButton(1,"肛交",PCVictoryOnIsabellaButtsex).disableIf(!_loc1_ || get_player().cockThatFits(get_monster().analCapacity()) <= -1);
         addButton(2,"六十九",victoryAgainstIzzzzzySixtyNine).disableIf(get_player().get_gender() <= 0);
         addButton(3,"阴道交",vaginalProdNPokeIsabella).disableIf(!_loc1_ || get_player().cockThatFits(get_monster().vaginalCapacity()) <= -1);
         addButton(4,"大乳交",tooBigVictoryTittyFuckingFuntimesWithMilk).disableIf(!_loc1_ || get_player().cockArea(get_player().biggestCockIndex()) <= 70);
         addButton(5,"小乳交",tinyVictoryTittyFuckingFuntimesWithMilk).disableIf(!_loc1_ || get_player().shortestCockLength() > tinyPenis());
      }
      
      public function chooseRandomIsabellaChild(param1:Array) : int
      {
         var _loc2_:Array = [];
         var _loc3_:int = 0;
         while(_loc3_ < int(isabellaOffspringData.length))
         {
            if(param1.indexOf(int(isabellaOffspringData[_loc3_])) >= 0)
            {
               _loc2_.push(int(Math.floor(_loc3_ / 2)));
            }
            _loc3_ += 2;
         }
         return int(_loc2_[Utils.rand(int(_loc2_.length))]);
      }
      
      public function PCVictoryOnIsabellaButtsex() : void
      {
         var _loc1_:int = get_player().cockThatFits(get_monster().analCapacity());
         var _loc2_:int = get_player().cockThatFits2(get_monster().analCapacity());
         clearOutput();
         outputText("乳汁，是吗？不，那可不行。你告诉这个");
         if(get_monster().get_lust() >= get_monster().maxLust())
         {
            outputText("发情的");
         }
         outputText("母牛荡妇翻个身，四肢着地。");
         if(get_monster().get_HP() < 1)
         {
            outputText("她努力照做，挪动着沉重的身躯，直到她摇摇晃晃地四肢着地，差点摔倒在泥土里。");
         }
         else
         {
            outputText("她努力照做，把手从敏感部位移开，摇摇晃晃地用颤抖的双手和膝盖支撑着身体。");
         }
         outputText("你绕着她转圈，像捕食者盯着生肉流口水一样盯着她。她打了个寒颤，丰满、被阳光亲吻过的臀部和摇晃的双乳泛起阵阵涟漪。她的裙子被撩得很高，起皱并被推到了背上，但在你注视的目光下，伊莎贝拉不敢把它放下来。[pg]");
         outputText("你脱下[armor]，将[eachcock]暴露在温暖微风的空气中");
         if(get_player().get_lust100() < 70)
         {
            outputText("，让");
            if(get_player().cockTotal() == 1)
            {
               outputText("它");
            }
            else
            {
               outputText("它们");
            }
            outputText("迅速变硬。[eachcock]肿胀的肉体变得越来越硬，在看到伊莎贝拉深色的菊穴和多汁、流着淫液的小穴的刺激下");
         }
         else
         {
            outputText("，风在你的硬度上挑逗着");
            if(get_player().cockTotal() == 1)
            {
               outputText("。它似乎");
            }
            else
            {
               outputText("。它们似乎");
            }
            outputText("变得越来越硬，当你盯着伊莎贝拉深色的菊穴和多汁、流着淫液的小穴时，肿胀的肉体无比充血");
         }
         outputText("。伊莎贝拉回过头，眼神中交织着恐惧与原始的欲望。她似乎没意识到自己已经开始前后扭动臀部，用那丰满、汗水浸透的臀部曲线和蛇一般扭动的尾巴挑逗着你。[pg]");
         outputText("伊莎贝拉呻吟着");
         if(get_monster().get_HP() < 1)
         {
            outputText("，在你赤裸的身体和她淫荡、妥协的姿势之间，她忘记了自己的伤痛");
         }
         else
         {
            outputText("充满欲望，她的身体乞求着被插入，而她的声音则试图与你的耳朵做爱");
         }
         if(isabellaAccent())
         {
            outputText("。 [say: 你能……把它放进我里面吗？求你了，我很抱歉没让你蹂躏我。占有我，用你那欲望的长矛侵犯我！]");
         }
         else
         {
            outputText("。 [say: 你能……把它放进我里面吗？求你了，我很抱歉没让你蹂躏我。占有我，用你那欲望的长矛侵犯我！]");
         }
         outputText("她恳求道。她试图说脏话，但实在太糟糕了，几乎让你感到尴尬。她还不如像发情的野兽一样呻吟和哞哞叫，也许把她当成野兽对待才是最好的。[pg]");
         outputText("你走上前，抓住她的尾巴，用力向后拉扯这个牛的附肢，将那迷人的臀部拉近你的" + get_player().cockDescript(_loc1_) + "。");
         if(get_player().cockTotal() > 1)
         {
            outputText("在你的[cocks]中，这可能是最适合这项任务的了");
            if(_loc2_ >= 0)
            {
               outputText("，而你的" + get_player().cockDescript(_loc2_) + "也可以顺势进入那个湿滑的牛穴");
            }
            outputText("。");
         }
         outputText("伊莎贝拉的眼睛因为你的" + get_player().cockHead(_loc1_) + "突然带来的压力而睁大");
         if(_loc2_ >= 0)
         {
            outputText("还有另一个" + get_player().cockHead(_loc2_) + "压在她的洞口上");
         }
         else
         {
            outputText("压在她那深色的雏菊上");
         }
         outputText("，当你拍打她湿润的臀部时，她发出一声不适的哞哞叫。你无视了她，更用力地拉扯她的尾巴，迫使她的肛门一口气吞下你整根" + get_player().cockDescript(_loc1_));
         if(_loc2_ >= 0)
         {
            outputText("同时她的小穴用融化鸡巴的温暖包裹住你的另一根肉棒");
         }
         outputText("。[pg]");
         outputText("这个天赋异禀的红发女郎在你身下颤抖，她的肌肉不由自主地夹紧，力量之大让你在抽插中途动弹不得。不知怎么的，她就这样夹住你，挤压的力量大到让你的" + get_player().cockHead() + "感觉快要爆裂了。你用力拍打她的屁股，力道大到在她丰满的臀部留下了一个手印，扩散的冲击力让伊莎贝拉撅起嘴唇，同时也扩张了她的肛门。她无言地咕哝着，已经沉沦得无法表达她的抱怨。你猛地撞回她闷热的怀抱");
         if(_loc2_ >= 0)
         {
            outputText("");
         }
         outputText("力道大到让拍打声在远处的地标上回荡。[pg]");
         outputText("可以听到奶水“滴答滴答”地滴在泥土上，那是从母牛摇晃的乳房中溢出的。随着每一次将肉棒没入，伊莎贝拉响亮的咕哝声开始发生变化，她的声音中加入了一声低沉的欲望呜咽，直到这个牛娘发出一长串满足的欲望哞叫。你松开她的尾巴，抓住她的腰。每一次拉扯，手指都深深陷入她紧身胸衣的红色蕾丝中，将这个红发女郎近乎小母牛般大小的臀部拉向你的[hips]。她仍然紧紧夹住你的");
         if(_loc2_ >= 0)
         {
            outputText("肉棒");
         }
         else
         {
            outputText(get_player().cockDescript(_loc1_));
         }
         outputText("但不再像之前那样紧紧夹着你的肉棒了。[pg]");
         outputText("你拉扯着她的头发，将那短短的红色乱发缠在手指上，迫使她仰起脖子，保持不动。她的小穴");
         if(_loc2_ >= 0)
         {
            outputText("紧紧收缩，包裹着你的" + get_player().cockDescript(_loc2_) + "，挤出一股滚烫的爱液浇在阴茎上，那温暖湿润的触感让你仿佛要融化了一般。");
         }
         else
         {
            outputText("喷出几缕爱液，粘在你的[legs]上，随着每一次肉体碰撞的啪啪声，拉出长长的丝线。");
         }
         outputText("伊莎贝拉的哞哞声越来越高亢，这是你唯一的警告，但即便如此，你也没有料到她高潮的威力。她的身体从蹄子到头顶都在抽搐，从古铜色的大腿开始，蔓延到被汗水浸透的丰满臀部。最后，这股颤栗传遍了她的双臂和摇晃的乳房，释放出一股散发着甜香的乳汁。[pg]");
         outputText("牛娘肉穴里那抽搐、挤压的痉挛");
         if(_loc2_ >= 0)
         {
            outputText("");
         }
         outputText("让快感的烟花顺着你的脊椎直冲大脑，在脑海中炸开。你低吼着，像发情的野兽一样，用力捣弄着伊莎贝拉那渗出先列腺液的穴口");
         outputText("感觉精液在你的[balls]里不断积聚。");
         if(_loc2_ < 0)
         {
            outputText("虽然你永远无法让这样的孔穴受孕，但你想要用雄性精华填满她紧致肉穴的本能已经占据了上风，直到她的后庭流出你的精液，你才会满足。");
         }
         else
         {
            outputText("虽然你知道至少有一半的精液会被浪费掉，但你想要填满她的本能已经占据了上风，直到牛娘每一个空虚的肉穴都流出精液，你才会满足。");
         }
         outputText("热流从你的[balls]涌起，宣告着终于到了教训这个傲慢女人的时候了。[pg]");
         outputText("伊莎贝拉短短的红发从你因高潮而无力的指尖滑落，但你正全神贯注于精液从尿道喷涌而出的快感，根本不在乎这些。精液在她体内爆发，从你扩张的马眼喷射进牛娘最深、最黑暗的深处。");
         if(_loc2_ >= 0)
         {
            outputText("你的" + get_player().cockDescript(_loc2_) + "也效仿着它的兄弟，将一束束精液射进牛娘湿润的小穴里。");
         }
         outputText("伊莎贝拉全身的高潮本已渐渐平息，但被你的精液填满的感觉让她再次爆发。她的双臂无力地垂下，躺在自己制造的乳白色水坑里，泥水和乳汁从她现在鼓胀的乳房边缘喷射而出。");
         if(get_player().cumQ() >= 750)
         {
            outputText("你继续动作，用更多的精液填满她的后庭");
            if(_loc2_ >= 0)
            {
               outputText("和湿润的小穴");
            }
            outputText("喷出更多的精液，足以让她的后门像气球一样膨胀，并让你" + get_player().cockDescript(_loc1_) + "的大部分感觉消失。");
            if(get_player().cumQ() < 2000)
            {
               outputText("当你结束时，她的肚子微微隆起，但她那疲惫、半斗鸡眼的眼神似乎并不介意。");
            }
            else
            {
               outputText("白色的黏液从她被灌满的后庭喷射而出，被你不断喷涌的精液压力挤压出来。当你结束时，她的肚子看起来像是怀了你的精液，但她那幸福的、斗鸡眼的神情表明她一点也不介意。");
            }
         }
         outputText("[pg]");
         outputText("终于发泄完毕，你狠狠地拍了一下她的屁股，从她那泥泞不堪的肉穴中抽出身来");
         if(_loc2_ >= 0)
         {
            outputText("");
         }
         outputText("。伊莎贝拉瘫倒在地，闭上了眼睛，尽管她的屁股仍然高高翘起，展示着你留在她直肠里的精液。令人惊讶的是，她漏在泥里的奶水似乎已经被吸收了，让土地再次变得干燥多尘。[pg]");
         outputText("你穿好衣服出发了，对你如何对付这头傲慢的外国母牛感到非常自豪。");
         if(!isabellaFollower())
         {
            get_isabellaFollowerScene().isabellaAffection(3);
         }
         get_player().orgasm("Dick");
         get_combat().cleanupAfterCombat();
      }
      
      public function IsabellaWinsAndSpanks() : void
      {
         clearOutput();
         if(get_player().get_tallness() <= 78)
         {
            if(get_player().get_HP() < 1)
            {
               outputText("你倒在伊莎贝拉的脚边，受到的伤害让你几乎失去了知觉。");
            }
            else
            {
               outputText("你倒在伊莎贝拉的脚边，可怜巴巴地自慰着，而她则低头怒视着你。");
            }
            outputText("一只手抓住你[armor]的后背，把你拎了起来，稳稳按到牛娘覆着毛皮的膝上。你能感觉到肚腹下方皮毛过渡为肌肤的触感，位置就在她" + (get_noFur() ? "膝盖上方" : "大腿中段") + "。");
            if(get_player().get_lust() >= get_player().maxLust())
            {
               outputText("你开始试图挺胯磨蹭，但愤怒的牛娘根本不吃这一套。");
            }
            outputText("啪！一记重击狠狠落在你的" + get_player().assDescript() + "上，让你因疼痛");
            if(get_player().hasPerk(PerkLib.Masochist))
            {
               outputText("和快感");
            }
            outputText("而喘息。下一击很快接踵而至，同样用力，却落在你另一边尚未淤青的屁股上。");
            if(get_player().hasPerk(PerkLib.Masochist))
            {
               outputText("你喘息着，并且");
               if(get_player().hasCock())
               {
                  outputText("喷出先列腺液");
               }
               else if(get_player().hasVagina())
               {
                  outputText("弄湿你的大腿");
               }
               else
               {
                  outputText("颤抖着");
               }
               outputText("沉浸在受虐的快感中。");
            }
            outputText("[pg]");
            if(isabellaAccent())
            {
               outputText("伊莎贝拉哼了一声，[say:看看你，跟那些恶魔一个德行！现在伊莎贝拉非得把你身上的腐化揍出去不可！]你");
            }
            else
            {
               outputText("伊莎贝拉哼了一声：[say:瞧瞧你，跟那些恶魔一个样！现在我得把你身上的腐化打出去！]你");
            }
            if(get_player().hasPerk(PerkLib.Masochist))
            {
               outputText("兴奋地呻吟着，心里想着自己还能挨上多少下");
            }
            else
            {
               outputText("可怜地呻吟着");
            }
            outputText("，而伊莎贝拉已屈起手肘，准备再赏你一巴掌。啪！这一击重得让你全身每一处柔软的地方都泛起波纹。远处不知哪里，有只鸟被惊得振翅飞起");
            if(get_player().hasPerk(PerkLib.Masochist))
            {
               outputText("，而你神魂颠倒地呻吟着，扭动着屁股");
            }
            outputText("。牛娘加快了节奏，每次重重抽打你的屁股之间，还不忘训斥你。[pg]");
            outputText("[say:不乖]--啪！--[say:[boy]！]--啪裂！--[say:给我]--啪！--[say:好好]--啪！--[say:长记性！]她这句话的每个字都伴随着一次震得骨头发麻的重击，最后一下");
            if(!get_player().hasPerk(PerkLib.Masochist))
            {
               outputText("逼得你尖叫出声，将你推过了意识的边界。伊莎贝拉像拎湿面条一样把你瘫软的身体扛起；你被带走时，身后的草叶随风摇曳。");
            }
            else
            {
               outputText("把你逼到了极限。");
               if(get_player().hasCock())
               {
                  outputText("你像炮弹般射了出来，把浓稠的精液喷满伊莎贝拉毛茸茸的膝盖");
                  if(get_player().cumQ() >= 50)
                  {
                     outputText("，打湿了那里的毛发");
                  }
                  if(get_player().cumQ() >= 250)
                  {
                     outputText("，还一路滴落到她的蹄子上");
                  }
                  if(get_player().cumQ() >= 1000)
                  {
                     outputText("，直到在她身下积成一滩");
                  }
                  outputText("。");
               }
               if(get_player().hasVagina())
               {
                  outputText("你的[vagina]颤抖着，并且");
                  if(get_player().wetness() < 5)
                  {
                     outputText("滴落");
                  }
                  else
                  {
                     outputText("喷涌出淫液，溅在牛娘的脚踝和蹄子上");
                  }
                  outputText("。");
               }
               outputText("仅仅因为疼痛就达到高潮的感觉，让你虚弱又疲惫。你的双眼渐渐合上，而伊莎贝拉抱起你，开始把你带往某处。");
            }
            outputText("[pg]");
            outputText("<b>一段时间后……</b>[pg]");
            outputText("你在嘈杂的吞咽声中睁开眼睛。伊莎贝拉左乳那深色、晒黑的皮肤完全占据了你的视线，就像她那四个尖端的乳头完全塞满了你的嘴一样。她正用指关节摩擦着你的脸颊，而你正在吞咽着她那无比甜美的乳汁。她母乳的温暖充满了你那伤痕累累的身体，但从你肚子的咕噜声来看，它已经填补你有一段时间了。从你的" + get_player().assDescript() + "刺痛的程度来看，你很庆幸她能这样抱着你。牛娘轻柔地说道，");
            if(isabellaAccent())
            {
               outputText("[say:乖啦乖啦，小家伙，就躺在那儿喝吧。咱们会把之前那些不愉快都忘掉的。要是把你一个人丢在这儿，被什么怪物折磨、强奸，我可是会过意不去的！][pg]");
            }
            else
            {
               outputText("[say:好了好了，小家伙，就躺在那儿喝吧。我们会把之前那些不愉快都忘掉的。要是把你一个人丢在这里，被什么怪物折磨、强奸，我会很过意不去的！][pg]");
            }
            outputText("尽管理智告诉你不要这样，但你发现自己还在继续吸吮，你的双臂向上伸去，抓住她那如山般高耸的圆球，依偎在上面。伊莎贝拉吃吃地笑着，但随着你开始更用力地吸吮，从她沉甸甸的乳房中吸出越来越多的乳汁，连这笑声也变成了愉悦的喘息。她稍微改变了一下抓着你的姿势，但你只是躺在那里继续喝着。你的眼睛慢慢闭上，虽然你还醒着一段时间，吸吮并品尝着越来越甜的乳汁。附近开始传来湿漉漉的吧唧声，但你太专注于嘴里那奶油般的味道，也太累了，不想去弄清楚那是什么。[pg]");
            outputText("你又睡了过去，屁股青肿，肚子里装满了伊莎贝拉的乳汁。[pg]");
            get_player().refillHunger(30);
            get_player().changeFatigue(-40);
            dynStats(DynStat.Sens(4));
            if(get_player().hasPerk(PerkLib.Masochist))
            {
               get_player().orgasm("Generic");
            }
         }
         else
         {
            if(get_player().get_HP() < 1)
            {
               outputText("你倒在伊莎贝拉的脚边，受到的伤害让你几乎失去了知觉。");
            }
            else
            {
               outputText("你倒在伊莎贝拉的脚边，可怜巴巴地自慰着，而她则低头怒视着你。");
            }
            outputText("一只手抓住你[armor]的后背，把你撑了起来，屁股翘在空中。");
            if(get_player().get_lust() >= get_player().maxLust())
            {
               outputText("你开始试着给自己自慰，但这头愤怒的牛娘可不会让你如愿。");
            }
            outputText("啪！一记重击狠狠落在你的" + get_player().assDescript() + "上，让你因疼痛");
            if(get_player().hasPerk(PerkLib.Masochist))
            {
               outputText("和快感");
            }
            outputText("而喘息。下一击很快接踵而至，同样用力，却落在你另一边尚未淤青的屁股上。");
            if(get_player().hasPerk(PerkLib.Masochist))
            {
               outputText("你喘息着，并且");
               if(get_player().hasCock())
               {
                  outputText("喷出先列腺液");
               }
               else if(get_player().hasVagina())
               {
                  outputText("淫液浸湿大腿");
               }
               else
               {
                  outputText("浑身发抖");
               }
               outputText("，沉浸在受虐般的快感中。");
            }
            outputText("[pg]");
            if(isabellaAccent())
            {
               outputText("伊莎贝拉哼了一声，[say:看看你，跟那些恶魔一个德行！现在伊莎贝拉非得把你身上的腐化揍出去不可！]你");
            }
            else
            {
               outputText("伊莎贝拉哼了一声，[say:看看你，跟那些恶魔一个德行！现在我得把你身上的腐化揍出去！]你");
            }
            if(!get_player().hasPerk(PerkLib.Masochist))
            {
               outputText("可怜地呻吟着");
            }
            else
            {
               outputText("兴奋地呻吟着，心里想着自己还能挨上多少下");
            }
            outputText("，而伊莎贝拉屈起手肘，准备再给你一巴掌。啪！这一记力道十足，震得你全身柔软的部位都泛起波纹，下巴也被压进泥土里。远处某个地方有只鸟受惊飞起");
            if(get_player().hasPerk(PerkLib.Masochist))
            {
               outputText("，而你神魂颠倒地呻吟着，扭动着屁股");
            }
            outputText("。牛娘加快了节奏，每次重重抽打你的屁股之间，还不忘训斥你。[pg]");
            outputText("[say:坏]——啪——[say:[boy]！]——啪——[say:长点]——啪——[say:记性]——啪——[say:吧！]她的话语伴随着一次次令人骨头震颤的重击");
            if(get_player().hasPerk(PerkLib.Masochist))
            {
               outputText("让你忍不住尖叫出声，将你推过了意识的边缘。伊莎贝拉沉重地扛起你瘫软的身体，在你的双眼闭上时，拖着你在泥土中前行。");
            }
            else
            {
               outputText("将你推过了极限。");
               if(get_player().hasCock())
               {
                  outputText("你像大炮一样高潮了，将浓稠的精液喷射得满脖子满脸都是");
                  if(get_player().cumQ() > 100)
                  {
                     outputText("，弄湿了你的头发");
                  }
                  if(get_player().cumQ() > 250)
                  {
                     outputText("，并滴落到地上");
                  }
                  if(get_player().cumQ() > 1000)
                  {
                     outputText("，直到在你周围形成了一个水坑");
                  }
                  outputText("。");
               }
               else if(get_player().hasVagina())
               {
                  outputText("你的[vagina]颤抖着，并且");
                  if(get_player().wetness() < 5)
                  {
                     outputText("滴落");
                  }
                  else
                  {
                     outputText("喷射，将淫液溅在泥土上");
                  }
                  outputText("。");
               }
               outputText("仅凭疼痛就达到高潮的感觉让你虚弱疲惫。当伊莎贝拉抓住你的脚踝，把你翻转过来，开始在草地上拖拽你时，你的双眼渐渐闭上。");
            }
            outputText("[pg]");
            outputText("<b>一段时间后……</b>[pg]");
            outputText("你在嘈杂的吞咽声中睁开眼睛。伊莎贝拉左乳那深色、晒黑的皮肤完全占据了你的视线，就像她那四个尖端的乳头完全塞满了你的嘴一样。她正用指关节摩擦着你的脸颊，而你正在吞咽着她那无比甜美的乳汁。她母乳的温暖充满了你那伤痕累累的身体，但从你肚子的咕噜声来看，它已经填补你有一段时间了。从你的" + get_player().assDescript() + "刺痛的程度来看，她刚才把你揍得不轻，你真希望自己没有坐在这么粗糙的地上。牛娘轻柔地说道，");
            if(isabellaAccent())
            {
               outputText("[say:好了好了，大[boy]，就躺在那儿喝吧。我们会忘记之前那些不愉快的事的。把你一个人留在这里我会觉得很过意不去——你可能会变成那些怪物之一的！][pg]");
            }
            else
            {
               outputText("[say: 乖哦，大[boy]，就躺在那儿喝吧。我们会把之前那些不愉快的事都忘掉的。把你一个人留在这里我会过意不去的——你大概会变成那些怪物之一！][pg]");
            }
            outputText("尽管理智告诉你不要这样，但你发现自己还在继续吸吮，你的双臂向上伸去，抓住她那如山般高耸的圆球，依偎在上面。伊莎贝拉吃吃地笑着，但随着你开始更用力地吸吮，从她沉甸甸的乳房中吸出越来越多的乳汁，连这笑声也变成了愉悦的喘息。她稍微改变了一下抓着你的姿势，但你只是躺在那里继续喝着。你的眼睛慢慢闭上，虽然你还醒着一段时间，吸吮并品尝着越来越甜的乳汁。附近开始传来湿漉漉的吧唧声，但你太专注于嘴里那奶油般的味道，也太累了，不想去弄清楚那是什么。[pg]");
            outputText("你又睡着了，你的后背青一块紫一块，肚子里装满了伊莎贝拉的乳汁。");
            get_player().refillHunger(30);
            get_player().changeFatigue(-40);
            dynStats(DynStat.Sens(4));
            if(get_player().hasPerk(PerkLib.Masochist))
            {
               get_player().orgasm("Generic");
            }
         }
         if(get_player().hasCock())
         {
            if(get_player().shortestCockLength() <= tinyPenis())
            {
               doNext(IsabellaPostSpankFeedSex);
               return;
            }
         }
         get_combat().cleanupAfterCombat();
      }
      
      public function IsabellaPostSpankFeedSex() : void
      {
         var _loc1_:int = get_player().smallestCockIndex();
         clearOutput();
         outputText("<b>吧唧……吧唧……吧唧……</b>[pg]");
         outputText("<i>哇啊？</i>你呻吟着，睁开眼睛，有什么东西把你从沉睡中唤醒。有什么东西在拍打你，你感到如此温暖和湿润。还有些不对劲——你感觉很好，非常非常好。你试图坐起来，但被汗水浸透的肉体猛地撞在你的肚子上，把你压平的同时也把肺里的空气撞了出来。突如其来的压力和疼痛让你终于睁大了眼睛，揭示了让你迷失方向的源头，同时一阵情欲传遍了你湿透的腹股沟。[pg]");
         outputText("汗珠在赤裸、胀满乳汁的乳房上滚动，它们在你上方弹跳并喷射，偶尔挡住你的视线，让你只能看到四个滴着奶水的乳头。连接着这壮丽双球的是看起来神志不清的伊莎贝拉，她的舌头垂过下巴，一边咕哝着一边骑着你，眼神迷离。她的小穴完全暴露在外；无毛、沾满精液的阴唇肿胀着滑过你的" + get_player().cockDescript(_loc1_) + "，像蛇吞噬猎物一样吞噬着它。她那突出的阴蒂上方水滴状的红发也同样浸透了带着白色的爱液，这清楚地表明你已经高潮过一次了。[pg]");
         outputText("伊莎贝拉的眼睛缩小成疯狂的针尖，当她意识到你醒来时，目光紧紧锁定了你。她呻吟着，");
         if(isabellaAccent())
         {
            outputText("[say: 这样很好，[boy]！别动！打断长辈的享乐是很不礼貌的，而且你的小鸡巴是如此的小巧独特。你就躺在那里，直到妈妈满足为止，好吗？] 为了强调她的话，她把一只手");
         }
         else
         {
            outputText("[say: 真是个好[boy]！别动！打断长辈的享乐是很不礼貌的，而且你的小鸡巴是如此的小巧独特。你就躺在那里，直到妈妈满足为止，好吗？] 为了强调她的话，她把一只手");
         }
         if(get_player().biggestTitSize() < 1)
         {
            outputText("按在你的胸口上");
         }
         else
         {
            outputText("在你的" + get_player().allBreastsDescript());
         }
         outputText("，用力推你的躯干，让你陷进散发着伊莎贝拉淫液气味的泥浆里一两英寸。你躺在那里，动弹不得，被强行强暴，像一个一次性的小假阳具一样被使用。[pg]");
         outputText("牛娘减轻了一些压力，以便捏住你的一个[nipples]，但当你喘息时，她的舌头强行伸进你的嘴里，用她那如同牛舌般光滑的器官堵住了你的");
         if(get_player().tongue.type == 0)
         {
            outputText("较小的");
         }
         else
         {
            outputText("较长的");
         }
         outputText("舌头。它滑过顶部，卷起来挤压，然后又钻到你的舌头下面，引诱你越过伊莎贝拉那自然深色的嘴唇。她的手指伸进你的头发里，拉扯着，让你乖乖待在她想要的位置，就像一只被拴住的狗。你无助地在她的嘴里呻吟，你的声音与她狂热的呻吟融为一体，她每一次大腿颤动的撞击都溅起泥浆、乳汁和淫液。[pg]");
         outputText("感觉太好了，真的太好了，但你在快感中挣扎。被按在地上强暴，直到你陷入散发着性爱气味的泥浆中，这不应该感觉这么好，然而你的" + get_player().cockDescript(_loc1_) + "在伊莎贝拉肌肉发达的褶皱里抽动，变得如此坚硬，你感觉就像一根钉子被钉进黄油里。牛娘的乳汁喷泉更是火上浇油，用甜美浓稠的奶油浸透了你的肚子和[chest]，在肮脏的泥浆中增添了更多白色的漩涡。伊莎贝拉弓起背，尖叫着，");
         if(isabellaAccent())
         {
            outputText("[say: 哞哞哞哞哞哞哞哞，啊啊啊啊啊啊啊啊！]");
         }
         else
         {
            outputText("[say: 哞哞哞哞哞哞哞哞，是的是的是的！]");
         }
         outputText("浓稠的白色波浪从她泛红的乳头上喷涌而出，滚过你的身体。几滴甚至落入你刚刚空出来的嘴里，让你想起了父母在春季解冻时，河里还有冰的时候，有时会做的一种冷饮。[pg]");
         outputText("她的小穴收紧，紧紧夹住，感觉越来越小。这简直不是人类能做到的，比紧握的拳头还要紧——只是这种紧握是由糖浆般的滑腻和天鹅绒般的垫子组成的。你再也无法抗拒这种快感，你弓起背，把自己更深地埋进泥里，为了把你的" + get_player().cockDescript(_loc1_) + "再往伊莎贝拉痉挛的怀抱里推一点点。精液从你的[balls]里沸腾起来，");
         if(get_player().cumQ() < 50)
         {
            outputText("喷射进伊莎贝拉饥渴收缩的小穴里。");
         }
         else if(get_player().cumQ() < 250)
         {
            outputText("喷射进伊莎贝拉突然收紧的小穴里，浓稠的精液甚至从她的阴唇流了出来。");
         }
         else if(get_player().cumQ() < 1000)
         {
            outputText("喷发进伊莎贝拉收缩的小穴里，用你大量的精液浸透了她通道的每一寸。");
         }
         else if(get_player().cumQ() < 2000)
         {
            outputText("喷发进伊莎贝拉收缩的小穴里，填满了她的子宫，让她的肚子微微隆起，像个装满精液的小肚子。");
         }
         else
         {
            outputText("像巨浪一样喷发进伊莎贝拉收缩的小穴里。你感觉到她的通道在你周围被填满，然后是她的子宫，接着下一次抽插让她的肚子鼓了起来，给了她一个装满精液的小肚子。随着每一次连续的播种填满她，直到她的肚子怀上了精液，她的阴唇被涂成了白色并滴落下来，她呻吟着。");
         }
         if(get_player().cumQ() >= 10000)
         {
            outputText("漏出来的量太多了，泥浆的颜色变浅，质地变稠，变得像精液一样粘稠。");
         }
         outputText("[pg]");
         outputText("当你把最后一点屈服的精华射进伊莎贝拉体内后，她从你身上滚了下来，大口喘着粗气。");
         if(isabellaAccent())
         {
            outputText("[say: 真是个乖[boy]！希望我教会了你一些规矩。也许有空可以来看看我，但对我可得礼貌点，不然我又得打你屁股了！]");
         }
         else
         {
            outputText("[say: 你真是个乖[boy]！希望我教会了你一些规矩。也许你应该找个时间来看看我，但对我可得礼貌点，不然我又得打你屁股了！]");
         }
         outputText("她用发软的双腿爬起来走开了，留你像一张用过的纸巾一样在被玷污的泥坑里打盹。[pg]");
         if(!isabellaFollower())
         {
            get_isabellaFollowerScene().isabellaAffection(3);
         }
         get_player().orgasm("Dick");
         get_combat().cleanupAfterCombat();
      }
   }
}

