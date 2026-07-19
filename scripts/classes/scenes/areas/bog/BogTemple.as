package classes.scenes.areas.bog
{
   import classes.BaseContent;
   import classes.CoC;
   import classes.DebugMenu;
   import classes.DynStat;
   import classes.PerkLib;
   import classes.Player;
   import classes.SelfDebug;
   import classes.StatusEffects;
   import classes.Time;
   import classes.internals.Utils;
   import classes.items.ShieldLib;
   import classes.saves.SelfSaver;
   import classes.saves.SelfSaving;
   import classes.scenes.Camp;
   import classes.scenes.Inventory;
   import classes.scenes.areas.bog._BogTemple.SaveContent;
   import coc.view.CoCButton;
   import flash.Boot;
   
   public class BogTemple extends BaseContent implements SelfDebug, SelfSaving
   {
      
      public var saveVersion:int;
      
      public var saveName:String;
      
      public var saveContent:SaveContent;
      
      public var globalSave:Boolean;
      
      public var SEENSTATU:int;
      
      public var SEENSCULP:int;
      
      public var SEENPUDDL:int;
      
      public var SEENENTER:int;
      
      public var SEENBOOKS:int;
      
      public var SEENBALCO:int;
      
      public var SEENALTAR:int;
      
      public var SEENAHOLE:int;
      
      public function BogTemple()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         SEENENTER = 256;
         SEENBALCO = 128;
         SEENPUDDL = 64;
         SEENAHOLE = 32;
         SEENBOOKS = 16;
         SEENSTATU = 8;
         SEENALTAR = 4;
         SEENSCULP = 2;
         globalSave = false;
         saveVersion = 1;
         saveName = "bogtemple";
         saveContent = new SaveContent(null,null,null,null,null,null,null,null);
         super();
         SelfSaver.register(this);
         DebugMenu.register(this);
      }
      
      public function templeRelaxCamp() : void
      {
         clearOutput();
         outputText("你决定现在先回去。");
         outputText("[pg]沿着原路穿过沼泽、泥泞和成群的昆虫，你走出了沼泽。没过多久，你的营地再次出现在视野中。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function templeRelax() : void
      {
         clearOutput();
         outputText("你决定稍微休息一下；在沼泽中跋涉让你筋疲力尽，在你去其他地方之前，你需要一些喘息的时间。");
         outputText("[pg]神庙宁静的氛围非常适合休息，你发现自己悠闲地漫步在柱子和雕塑之间，让你的目光在它们上面游移，但并没有真正仔细地注意它们中的任何一个。虽然在祭坛前，你停下来凝视着女神，时间比你预想的要长一些。你从她迷人的微笑中抽身，挑了一个方便的水坑，蹲下来用清澈的水洗了洗脸和手，然后继续以放松的步伐前进。");
         outputText("[pg]走着走着，你轻轻地伸展和按摩了几块肌肉，深吸了几口新鲜空气。不知不觉中，你的漫步已经带你走遍了整个圣所，你再次站在入口前，感觉神清气爽，准备好迎接前方的旅程。[pg]");
         get_player().dynStats(DynStat.Lust(-10));
         get_player().changeFatigue(-30);
         get_player().HPChange(get_player().maxHP() / 10,true);
         menu();
         addNextButton("沼泽",templeBogExplore).hint("进一步探索沼泽。");
         addNextButton("湿地",get_game().swamp.explore).hint("原路返回湿地。");
         addNextButton("营地",templeRelaxCamp).hint("直接返回营地。");
      }
      
      public function templePray() : void
      {
         clearOutput();
         outputText("这[i: 毕竟]是一座神庙，所以祈祷似乎是理所当然的事，" + (get_player().isReligious() ? (get_player().hasPerk(PerkLib.HistoryDEUSVULT) ? "虽然这位无名神祇不是你信仰的女神，但她看起来绝对像是会反抗恶魔及其腐化，而不是与他们同流合污的那种。" : (get_player().wasElder() ? "虽然你至今为止的一生都奉献给了其他神明，但你并不排斥在这里向这位神明祈祷。" : "尽管你不知道英格纳姆的长老和牧师们如果看到你向这位无名女神祈祷会怎么说。")) : (get_player().cor > 45 ? "虽然你不确定自己希望得到什么。你是想成为一个更好的人，还是有什么其他理由向这样一位明显善良的神祇祈祷？" : "而且这位女神可能已经很久没有人向她祈祷过了。")) + " 你甚至不知道她是否还存在，但你还是[if (singleleg) {滑行|迈步}]向前。");
         outputText("[pg]你在祭坛前跪下，抬头看了一眼她那充满怜悯的石雕面容，然后低下头，闭上眼睛。");
         outputText("[pg]你在心中默默地祈祷，嘴唇微微翕动，将你选择的话语传达给面前的雕像。你没有太多要说的话，但当你结束时，你感到一种强烈的冲动，想要在地上多待一会儿，只是在无言的敬畏中低着头，专注于神庙固有的宁静和你自己的内心。");
         if(!get_player().hasStatusEffect(StatusEffects.TempleBlessing))
         {
            outputText("[pg]几秒钟过去了。几分钟？你不知道，时间变得无关紧要。事实上，你的大部分感官也是如此。你什么也听不见，什么也看不见，什么也感觉不到。什么也不需要。除了胸口一小团温暖的光球，它在你体内逐渐跳动，焕发生机。当你放下一切去专注于它时，它一点一点地裂开，溢出并像[if (ischild) {一杯热巧克力|一口烈酒}]一样流过你的血管，让你漂浮起来，没有任何重量感，然后轻轻地抬起你的头，睁开你的眼睛。");
            outputText("[pg]伴随着一声轻微的喘息，你猛地惊醒。");
            outputText("[pg]你仍然跪着，抬头看着上方的女神。那是什么？你在做梦吗？梦到了什么？你试图回忆，但似乎做不到；记忆消失了，褪色了。你只感觉到一种微弱的温暖和宁静取而代之，但不知道为什么。那种感觉又停留了片刻，直到它也消失了，你再次想起了神庙冰冷的地板和空气。");
            outputText("[pg]你站起来拍了拍身上的灰尘，感觉没什么不同，但又似乎发生了某种改变。最后看了一眼石雕神像后，你转过身，走出了神庙，在回去的路上心不在焉，直到你的营地再次出现在视野中。");
            get_player().createStatusEffect(StatusEffects.TempleBlessing,24,1,0,0);
         }
         else
         {
            outputText("[pg]几秒钟拉长成几分钟，你一直低着头，但当你最终感觉到注意力正在消退时，你决定再次睁开眼睛，从思绪中浮出水面。石雕神像一如既往地温暖地注视着你，当你站起来拍掉身上的灰尘时，她那静止的目光一直跟随着你。");
            outputText("[pg]你没有感觉到任何不同，也许只是感觉轻盈了一点，那可能只是你的错觉。最后看了一眼雕塑，你点点头转过身，走出了圣所。回去的路似乎很短，没过多久，你的营地就再次出现在视野中。");
         }
         get_player().dynStats(DynStat.Cor(-1.5));
         _temp_1.timesPrayed += 1;
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function templeMenu(param1:Boolean = true, param2:Boolean = true) : void
      {
         var _g:BogTemple;
         if(param1)
         {
            clearOutput();
            if(param2)
            {
               outputText("周围的环境开始变得熟悉，很快，你又来到了那座长满杂草的古老神庙前。一阵清爽的微风拂过你的脸颊，驱散了你[if (singleleg) {[walk]|走}]进去时还附着在你身上的几只昆虫。这里的气氛一如既往地宁静，" + (saveContent.timesVisited > 8 ? "连鸟儿都没有抱怨" : "除了几只扑腾着翅膀飞走、大声抱怨") + "你的到来。");
            }
            outputText("[pg]你环顾四周。");
            outputText("[pg]时间和天气在这里留下了明显的痕迹。一面墙上有一个大洞，地板下粗壮的树根拱起了一些瓷砖，形成了一滩滩清澈的积水，长椅都已经腐烂，壁灯上覆盖着好几层铁锈和鸟粪。一侧立着一个石制书架，但上面的书只要轻轻一碰就会碎裂。上方有内部阳台，引导你的视线看向高处的狭长窗户和部分塌陷的穹顶。最后，在最深处，一个祭坛坐落在一件令人印象深刻的石雕作品前：一块占据了后殿大部分空间的单块大理石，上面雕刻着一位长着羽翼、长发飘飘的女性，她穿着一件褶边长裙，像巨大的面纱一样在她身后飘动。其他墙壁上装饰着一些较小的雕塑，其中大部分都处于年久失修的状态。");
            if(get_marielle().saveContent.state > 0)
            {
               outputText("[pg]" + (get_time().isTimeBetween(22.5,6.5) ? "玛瑞斯占据着缺口的大半个帐篷里漆黑一片，寂静无声。你往里偷看，发现这个亡灵女孩蜷缩在睡袋里，周围堆满了成卷的布料和装有各种缝纫及露营用品的箱子。她睡着了。" : "亡灵裁缝玛瑞斯占据了那个缺口，从外面拉起了一个大半个帐篷盖在上面，把它变成了她裁缝店的入口。女孩本人正坐在推到低矮残墙边的一张桌子旁，她周围的空间里散落着大量的缝纫工具、箱子，以及成卷的布料、线和丝带。她平常穿的衣服已经足够得体了，而一副旧夹鼻眼镜和一盏点燃的油灯则帮助她集中注意力。她" + (get_marielle().saveContent.commissionTime > get_time().get_totalTime() ? "没有注意到你，她的注意力完全集中在制作你要求的物品上。" : "似乎全神贯注于某事，你也不确定她是否注意到了你的进入。")));
            }
         }
         menu();
         addNextButton("玛瑞斯",get_marielle().encounter).hint("靠近" + (get_time().isTimeBetween(22.5,6.5) ? "熟睡的" : "") + "裁缝。").disableIf(get_marielle().saveContent.commissionTime > get_time().get_totalTime() && get_time().isTimeBetween(6.5,22.5),"你或许应该让裁缝专心完成你的委托，不要去打扰她。").hideIf(get_marielle().saveContent.state != 1);
         _g = this;
         addNextButton("检查",function():void
         {
            _g.templeInspect();
         }).hint("更仔细地环顾神庙。");
         addNextButton("放松",templeRelax).hint("在继续旅程之前，先放松一会儿。");
         addNextButton("祈祷",templePray).hint("献上祈祷。");
         if((saveContent.inspection & SEENPUDDL) != 0)
         {
            addNextButton("沐浴",templeBathe).hint("洗个舒服的净化浴。");
         }
         addButton(14,"离开",templeLeave);
      }
      
      public function templeLeave() : void
      {
         clearOutput();
         outputText("你[walk]出神庙，沐浴在透过树冠洒下的玛瑞斯的[sun]光中，寻找着来时的路。昆虫们在这里迎接你，还有沼泽柔软泥泞的地面、难闻的气味，以及更加潮湿的空气。");
         outputText("[pg]你硬起心肠，动身返回营地。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function templeInspect(param1:int = -1) : void
      {
         var arriving:Boolean;
         var output1:Boolean;
         var _g9:BogTemple;
         var choice8:int;
         var _g8:BogTemple;
         var choice7:int;
         var _g7:BogTemple;
         var choice6:int;
         var _g6:BogTemple;
         var choice5:int;
         var _g5:BogTemple;
         var choice4:int;
         var _g4:BogTemple;
         var choice3:int;
         var _g3:BogTemple;
         var choice2:int;
         var _g2:BogTemple;
         var choice1:int;
         var _g1:BogTemple;
         var _g:BogTemple;
         clearOutput();
         var _loc2_:int = param1;
         if(_loc2_ == -1)
         {
            outputText("这座古老建筑里有一些有趣的地方，也许值得一看。似乎已经很久没有人来过这里了，所以除了大自然本身的手笔之外，大部分地方都基本保持着原样。");
         }
         else if(_loc2_ == 0)
         {
            outputText("其中最引人注目的一件作品，俯瞰着整个神殿，是一尊比真人还要大的神像，雕刻在远处的墙壁上。这是一件令人印象深刻的大理石作品。");
            outputText("[pg]她的头发和裙子都很长，飘逸着，被一阵想象中的风吹散，仿佛她正从天而降。她身后展开的双翼以及她的姿势更加强化了这种形象：她的双臂向两侧伸展，手心向上，就像一位圣人向她的追随者提供救赎的形象，而且她的脚没有接触地面——她似乎漂浮在空中。从她的臀部、她光滑纤细的美丽以及她胸部微微隆起的样子来看，她绝对是个“她”。她看起来也很年轻，但你发现不可能确定一个具体的年龄，尽管她既不是孩子也不是成年人。在某种程度上，她是不老的。");
            outputText("[pg]然后是她的微笑。那充满爱意、仁慈、永恒的微笑。无论哪位石匠雕刻了这尊雕像，都一定是不知疲倦地努力使其完美，因为无论你站在哪里，它似乎都能找到你。");
            outputText("[pg]你很难将视线从这景象上移开，你的眼睛想要重新回到它身上，你盯着它看的时间越长，就越被它迷住，但在雕像下方有几行符文，一半被苔藓覆盖。你摆脱了恍惚状态，走近了一些。");
            outputText("[pg]这种文字对你来说完全陌生，你无法理解。它们看起来都很奇怪、呈漩涡状，而且非常圆润，这使得区分这些符文变得更加困难，更不用说破译它们了。你没有办法做到这一点。");
         }
         else if(_loc2_ == 1)
         {
            outputText("祭坛是一个相当朴实无华的东西，并没有分散人们对它后面那座令人印象深刻的雕塑的注意力。" + (get_silly() && get_player().cor > 90 ? "大到足以在上面献祭一个孩子" : "和餐桌一样大") + "，它是用石头做的，就像这里大多数幸存下来的其他家具一样，背面被挖空以提供一些存储空间，尽管现在里面完全是空的。");
            outputText("[pg]正面雕刻着一个被玫瑰环绕的、高度风格化的长弓图案，除此之外别无他物。侧面延续了花朵的主题，而顶部则完全没有装饰，光滑的石面上只有些许灰尘和污垢。实用，但并不起眼。虽然各处都有一些缺口和划痕，但总体上保存完好；它肯定也很重，你试着拉了几下，它纹丝不动。");
            outputText("[pg]真的没什么特别的——没有残留的祭品，没有盘子或篮子，甚至连个烛台都没有。");
            if(!saveContent.shieldTaken)
            {
               outputText("[pg]好吧，你找到并留在这里的那个奇怪的金属圆盘还在上面，在[sun]光下闪烁着光芒。");
               _g = this;
               doNext(function():void
               {
                  _g.templeInspect();
               });
               addNextButton("拿走",templeFirstTake);
               return;
            }
         }
         else if(_loc2_ == 2)
         {
            outputText("沿着墙壁摆放着相当多的小型雕像，有些斜倚在壁龛里，有些独立站在自己的基座上，显然它们对这座神庙都很重要。");
            outputText("[pg]如果你猜的话，也许是圣人或女神的杰出追随者，尽管每个雕像下面刻着的奇怪符文（很可能是她们的名字和事迹）对你毫无帮助，而且大多数雕像在这么多年里遭受的损坏也无济于事。你确实注意到——至少从还能辨认出的部分来看——她们都是女性，而且显然是人类。这个观察结果可以有多种解释：这是一个全女性的邪教，还是一个更大宗教中受限制的教团？她们中的大多数（如果不是全部的话）都带着武器，表明她们是女战士，这个事实太突出了，不可能没有意义。剑、斧、戟、镰刀、法杖、长矛，你甚至在她们的武器库中注意到了一条鞭子。至少是一部分，其余的肯定躺在碎石堆里的某个地方。");
            outputText("[pg]武器并不是她们唯一不同的装备选择。没有两个看起来是一样的，因为她们穿着各种各样的服装，从长裙、精致的束腰外衣、连帽斗篷，到一些更紧身的法衣（其中一些露出了大量的皮肤），偶尔还点缀着一件或一整套盔甲。没有修女服，她们唯一统一的地方就是站着或跪着默默守夜时，脸上雕刻着的庄严肃穆的神情。");
            outputText("[pg]它们似乎无法移动，因为它们被固定在各自的底座上。");
         }
         else if(_loc2_ == 3)
         {
            outputText("有几个石架，大部分是空的，但其中一个架子上放着一小部分书，引起了你的兴趣。");
            outputText("[pg]可悲的是，皮革装订的书脊是唯一没有腐烂的部分，即使是它们也严重变色和开裂，书名褪色得无法辨认；书页本身在这一点上已经无法挽救了。你试了几本，但对所有书来说，情况都差不多。没有什么可以抢救的了。");
         }
         else if(_loc2_ == 4)
         {
            outputText("有一件事很引人注目，那就是墙上被撕开的那个洞。");
            outputText("[pg]大到足以让一个强壮的半人马穿过，如果你正确判断了碎石在附近散落的方式，它看起来像是某种非自然的东西造成的。附近的一根柱子也受到了一些损坏，一大半被削掉了，但它不知怎么地还在支撑着。你想知道这是多久以前发生的事——一些碎片上生长的苔藓表明它不可能太近，但除了这单一的见解之外，似乎不太可能推断出更多信息。");
            outputText("[pg]你[if (singleleg) {滑|走}]近了一点。");
            if(get_marielle().marielleAvailable(false,false))
            {
               outputText("[pg]就在外面，玛瑞斯建起了她的精品店，用她固定在神庙正面和周围植被上的半个帐篷有效地覆盖了整个洞。这位女裁缝本人正");
               if(get_time().isTimeBetween(22.5,6.5))
               {
                  outputText("蜷缩在她的铺盖卷里睡着了，把一个看起来很舒服的枕头紧紧抱在脸上。她的睡眠很安静，没有被你的存在打断，这让你能够进一步调查，尽管你仍然小心翼翼，不要靠得太近或发出任何可能吵醒她的声音。");
                  outputText("[pg]她把桌子推到倒塌墙壁的低矮部分，这部分与木制桌面的高度非常吻合。在它旁边，开口一直延伸到地面，形成了一个方便进入她帐篷的入口。");
                  outputText("[pg]由于外面的地面上堆满了箱子、盒子和堆放在防护垫上的成卷织物，它也无法为你提供关于到底发生了什么的线索。没有明显的痕迹，无论是在石头上，还是在没有被占据的草地上，而且要看看防雨布绑在上面的树木和灌木丛，你必须走出神庙，在泥泞中涉水绕过它。你决定不这么做。");
               }
               else if(get_marielle().saveContent.commissionTime > get_time().get_totalTime())
               {
                  outputText("坐在她的桌子前，处理你给她的订单。她的许多手高效而有目的地移动着，每只手都被分配了自己的任务，同时她保持着稳定的节奏。");
                  outputText("[pg]你觉得现在不应该打扰她。");
               }
               else
               {
                  outputText("坐在她的桌子前，沉浸在看起来像刺绣的工作中。她的许多手缓慢地，甚至悠闲地移动着，在布料上绣着一个你从这个角度看不清的图案。");
                  outputText("[pg]她的帐篷里堆满了箱子、盒子和成卷的布料，它们被放在防护垫上，所以你无法确定外面的地面是否能提供更多线索。当你调查她桌子靠着的墙壁下半部分是否有明显的痕迹时——你什么也没发现——玛瑞斯终于察觉到了你的靠近，她微微一惊，停下了手中的针线活。");
                  if(!(get_marielle().saveContent.insulted != 0 && get_marielle().saveContent.insulted != 2))
                  {
                     outputText("[pg][say: 哦！哦，[name]。] 她微张着嘴似乎还想说些什么，但随后又闭上了，盯着你看了一会儿，平复了一下心情，然后问道，[say: 是……出什么事了吗？你看起来，啊，心事重重的。] 她说得没错；你向她解释了你正在做的事情。");
                     outputText("[pg][say: 我明白了……] 她只说了这些，之后好一会儿都没再说什么，而是把绣了一半的布料放在一边，一双手叠放在腿上，另一双手开始把玩着头发，同时观察着你。她那沉默的、灰蓝色的目光让你感到有些不适，但你觉得你现在能看的都看过了。你把这些告诉了她。");
                     outputText("[pg][say: 我明白了，] 她重复道，停下手中的动作，身子前倾。[say: 那么……说说看，你对此有何看法？] 她表现出了真正的好奇，所以你告诉了她。她的头微微点着，眼神游移不定。");
                     outputText("[pg][say: 听起来很合理，不是吗？] 玛瑞斯说道。[say: 只是，我从未见过如此]——她用一根手指紧紧缠绕着一缕金发——[say: 强大的生物……至少在这片区域没有。也许……] 她的声音渐渐变小，似乎不想说出她的想法，所以你问她是否有什么主意，以此让她继续说下去。她皱了皱眉。[say: 不。不，恐怕我不知道。这个地方有太多奇怪的野兽，还有，啊……强大而可怕的怪物。] 她松开头发，若有所思地扶了扶夹鼻眼镜，沉默在蔓延。");
                     outputText("[pg][say: 好吧，我宁愿相信它已经走了。]");
                     outputText("[pg]大概是吧。不过，你觉得猜测也就到此为止了。");
                     outputText("[pg]裁缝的注意力已经从破碎的墙壁上移开，现在又看着你，似乎在默问你在这里还有什么事。");
                     get_marielle().marielleMenu();
                     return;
                  }
                  outputText("[pg]她僵住了，紧紧握着针，但什么也没对你说。当很明显你也不是来聊天的时候，女孩默默地回到了她的工作中，尽管在你环顾她帐篷内部时，她一直警惕地盯着你。");
                  outputText("[pg]里面堆满了箱子、盒子和成卷的布料，它们被放在防护垫上。这里真的没有什么能给你提供进一步线索的东西了，所以你结束了调查，再次留她一个人。");
               }
            }
            else
            {
               outputText("[pg]石头上没有任何明显的痕迹能给你提供进一步的线索，外面的草地、灌木或树木也没有什么故事可讲。根本没有什么可依据的。");
            }
         }
         else if(_loc2_ == 5)
         {
            outputText("神庙里散布着各种各样的水坑，主要集中在外面树木的根部撑裂了地板，顶起了一些石砖的地方。");
            outputText("[pg]有趣的是，水清澈见底，也许是因为经过了石雕的过滤，看起来可以安全饮用，尽管像这样平静的水坑可能隐藏着肉眼看不见的危险。但即使是那样，它们至少也足以洗去你身上积累的沼泽泥土和污垢。");
            outputText("[pg]其中最主要的一个位于大洞对面的墙边。它比其他的要大得多，而且树根可能不是造成这个水坑的原因；它看起来像是被什么大型生物的手或爪子挖出来的。或者也许是地板塌陷成了一个天坑。墙壁的下半部分也跟着塌陷了，让外面的光线照进来，照亮了池塘。");
            if((saveContent.inspection & SEENPUDDL) != 0)
            {
               outputText("[pg]这里水温适宜，空间宽敞，是个洗澡的好地方。");
            }
            else
            {
               outputText("[pg]它看起来足够深，可以淹没你的整个身体，而且它的宽度可以同时容纳一整群人。你走近它，试探性地把手伸进水里，惊讶地发现水是温的。可能是一种温泉，但对于温泉来说，它似乎太局限了，而且你没有注意到水面上有任何涟漪或其他明显的流入迹象。真奇怪。你甩了甩手，又站了起来。");
               outputText("[pg]苔藓已经占据了它附近的大部分区域，使得大部分地面走起来很危险，但总而言之，抛开谜团不谈，这似乎是一个洗澡的好地方，隐藏在这个潮湿、充满敌意的沼泽地中间。");
            }
         }
         else if(_loc2_ == 6)
         {
            outputText("两侧的墙壁上有一排内部阳台，由高高的柱子支撑在离你很远的地方。拱门从那里进一步向上延伸并连接到天花板，这肯定是防止整个结构坍塌不可或缺的一部分。");
            if(get_player().canFly() || get_player().lowerBody.type == 3)
            {
               outputText("[pg]" + (get_player().canFly() ? "曾经通向它们的蜿蜒楼梯可能已经损坏，但这并不能阻碍你。你拍打着[wings]，迅速飞到空中，然后落在栏杆上。你降落时，有什么小东西溜走了" : "曾经通向它们的蜿蜒楼梯已经坍塌，但你觉得你可以缠绕在一根柱子上爬上去。你挑了一根看起来完好无损的柱子，然后小心翼翼地蜿蜒而上。当你伸手去抓栏杆并把自己拉过去时，有什么小东西溜走了"));
               outputText("，但你只看到了那只啮齿动物的尾巴，它通过一条裂缝消失在外面的屋顶上。");
               outputText("[pg]高处狭长的窗户让[sun]透了进来，在阳台和下方的地板上投下细细的光束。这里比一楼脏多了——灰尘、树叶、树枝，还有墙壁和天花板掉落的碎屑，在你四处查看时，在你的脚下嘎吱作响。似乎所有的污垢都被扫到了这里，卡在这些缝隙中。甚至有几朵勇敢的蘑菇从砖石间探出头来。");
               outputText("[pg]在一个角落里，你发现了一对粗陶烧瓶。这是你看到的第一个有人居住过的迹象，但它们是怎么上来的却是个谜。也许那时的楼梯还是完好的。它们是空的，没有标签，但隐约让你想起酒瓶。它们的气味早已消散，所以谁知道你的猜测是否正确。你把它们留在那里，继续探索。");
               outputText("[pg]但除此之外，什么也没有。除非你在找鸟巢，这里有很多，当你经过时，甚至有一只长着棕色羽毛、瑟瑟发抖的鸟妈妈在勇敢地守卫着一个鸟巢。你有些失望，再次爬上栏杆，[if (canfly) {滑翔|降落}]下去。");
               saveContent.seenBalcony = true;
            }
            else
            {
               outputText("[pg]曾经通向高处的蜿蜒楼梯已经坍塌，看起来没有其他方法可以爬上去。[if (tallness > 96) {即使是你|你}]也够不到那么高。");
            }
         }
         else if(_loc2_ == 7)
         {
            outputText("入口可能是这座神庙里最无趣的地方，但你还是仔细看了看。");
            outputText("[pg]它和你想象中的教堂一样宽敞高大，但保持着相当简单和谦逊的风格。地砖向外延伸了一点，然后被沼泽的泥土和草地所取代，在里面，四级宽敞的半圆形台阶向下通向中殿。");
            outputText("[pg]曾经肯定挡住大门的沉重门扉已经不见了，显然没有经受住时间的考验；你仍然可以看到铰链固定的地方。从外观上看，它们在某个时候被以一种非常粗暴的方式扯了下来，在石头上留下了深深的沟壑。");
            outputText("[pg]除了两个壁灯和门框上褪色的雕刻图案外，几乎没有什么装饰。也许是花，你不太确定。");
         }
         _temp_1.inspection |= 1 << param1 + 1;
         menu();
         _g1 = this;
         choice1 = 0;
         addNextButton("雕塑",function():void
         {
            _g1.templeInspect(choice1);
         }).hint("研究大型雕塑。");
         _g2 = this;
         choice2 = 1;
         addNextButton("祭坛",function():void
         {
            _g2.templeInspect(choice2);
         }).hint("搜索祭坛。");
         _g3 = this;
         choice3 = 2;
         addNextButton("小雕像",function():void
         {
            _g3.templeInspect(choice3);
         }).hint("仔细检查小雕像。");
         _g4 = this;
         choice4 = 3;
         addNextButton("书籍",function():void
         {
            _g4.templeInspect(choice4);
         }).hint("仔细阅读书架。");
         _g5 = this;
         choice5 = 4;
         addNextButton("洞口",function():void
         {
            _g5.templeInspect(choice5);
         }).hint("调查墙上的大洞。");
         _g6 = this;
         choice6 = 5;
         addNextButton("水坑",function():void
         {
            _g6.templeInspect(choice6);
         }).hint("检查水坑。");
         _g7 = this;
         choice7 = 6;
         addNextButton("阳台",function():void
         {
            _g7.templeInspect(choice7);
         }).hint("检查上面的阳台。");
         _g8 = this;
         choice8 = 7;
         addNextButton("入口",function():void
         {
            _g8.templeInspect(choice8);
         }).hint("搜索入口。");
         _g9 = this;
         output1 = true;
         arriving = false;
         setExitButton("返回",function():void
         {
            _g9.templeMenu(output1,arriving);
         });
         if(param1 >= 0)
         {
            button(param1).disable("你刚刚看过了。");
         }
      }
      
      public function templeFirstTime() : void
      {
         clearOutput();
         outputText("泥水没过了你的腰部，你在这片潮湿的泥沼中艰难跋涉，努力不让自己绊倒淹死。");
         outputText("[pg]你一直跟随着早期文明留下的小迹象：低矮的石墙，早已坍塌并长满青苔，偶尔还能瞥见污泥下铺砌的小路。很明显，建造它们的人早就离开了，但如果你能找到更多，也许就能了解玛瑞斯的历史。或者至少是这个闷热地方的历史。也许这甚至值得你到目前为止收集到的所有蚊子包。你又拍死了一只。这真是一项徒劳的运动。");
         outputText("[pg]头顶茂密的树冠只偶尔漏下几缕[sun]光，但尽管[if (hours >= 21) {几乎一片漆黑|树荫浓密}]，你还是热得像在被烤一样。汗珠从你的眉毛上滚落，你在倒塌的柱子上坐下喘口气，听着沼泽的声音。你从未听过的鸟鸣，轻微的水流咕噜声，远处不知名生物的叫声。还有蚊子。又一只被你一巴掌拍死。你看了看你的手。其实是两只。当你叹了口气站起来时，你发现几乎古老的树木之间有什么东西。一块石头的斑点，一座建筑的轮廓，虽然几乎被爬满外墙的野生植物遮住了。也许是一座房子；你可能发现了一个古老的村庄。");
         outputText("[pg]然而，当你涉水靠近时，你意识到它比普通的住宅要大，而且从周围一圈断裂的柱子来看，它一定具有某种重要意义。很可能是一个礼拜场所。");
         menu();
         addNextButton("进入",templeFirstEnter).hint("寻找入口并进去。");
         addNextButton("离开",templeFirstLeave).hint("暂时离开。");
      }
      
      public function templeFirstTake() : void
      {
         clearOutput();
         outputText("经过一番思考，你决定带走这个奇怪的发条圆盘。" + (get_player().seenTimeMagic() ? "像这样的时间魔法源应该会非常" : "无论它蕴含着什么魔法，都可能会") + "在你的冒险中派上用场。");
         outputText("[pg]把装置装进口袋，你最后环顾了一下四周，然后转身离开，准备回营地。当你走出神庙时，蚊子和沼泽的湿气都卷土重来，但你现在的心思都在别处，根本不在乎这些。[pg]");
         saveContent.shieldTaken = true;
         get_inventory().takeItem(get_shields().CLKSHLD,get_camp().returnToCampUseOneHour);
      }
      
      public function templeFirstLeave() : void
      {
         clearOutput();
         outputText("有些地方或许还是不去打扰为妙。");
         outputText("[pg]你转过身，沿着原路返回营地，将那座长满杂草的古老建筑抛在身后。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function templeFirstEnter() : void
      {
         clearOutput();
         outputText("你沿着长满常春藤的墙壁走，直到找到一个入口。几级台阶通向下方，也许是为了补偿不平坦的地形。你走进去，立刻感觉到一阵清新的微风拂过你的[skindesc]。当你的眼睛适应后，你开始打量内部。");
         outputText("[pg]这是一座神庙，和你记忆中家乡的那些很像，尽管岁月的侵蚀留下了深深的痕迹：在这个恶劣的气候下，长椅早已腐烂，苔藓占据了大部分角落，一面墙上还破了个大洞。从周围散落的碎石来看，肯定是有什么东西从外面撞破了墙壁。抬头望去，你能看到由柱子支撑的内部阳台，再往上，玛瑞斯的天空透过破损的圆顶天花板显露出来。这里和建筑的其他部分一样，似乎很受筑巢鸟类的欢迎。其中一只——一只蓝色的小家伙——从墙上的壁灯处朝你尖叫，然后扑腾着飞走了。地上散布着一些出奇清澈的小水坑，干净得似乎可以饮用，有些甚至深到足以让你在里面洗个澡。你有些欣慰地注意到，蚊子都不见了。");
         outputText("[pg]当你被远处墙上的中心装饰品吸引时，你小心翼翼地不被那些顶起地砖的树根绊倒。");
         outputText("[pg]那是一座由整块大理石雕刻而成的石雕，描绘了一位穿着长款褶边裙的年轻有翼女子。她长长的头发披散在两侧，双臂张开，摆出圣徒般的姿势。这是一件美丽的石雕作品，除了表面长着大片苔藓外，几乎没有受到时间和破坏的痕迹。雕像下方有文字，但你看不懂" + (get_silly() && get_player().get_inte() < 20 ? "" : "。你以前从未见过这种文字，而且大部分都被遮挡了") + "。");
         outputText("[pg]这个雕像可能是一位古老的神明，或者是曾经在这里受到崇拜的其他生物。你发现自己很难将目光从它的美丽中移开，大理石女神以天使般的仁慈注视着你，在她的光辉下，你感到胸口升起一股令人愉悦的温暖。但你摇了摇头。" + (get_player().isReligious() ? "你不知道这个存在是谁，所以你转过身，" : "它太大了，无法拖回营地，所以你") + "四处寻找其他可能有价值的东西。");
         outputText("[pg]壁灯生锈了，上面布满了鸟粪，你在架子上找到的几本书在你触碰时化为了灰烬。你正准备结束今天的探索回营地，这时祭坛下方的一道金属反光引起了你的注意。你走近并弯下腰查看。一个大约有你前臂那么宽的金属圆盘躺在地板上。它很厚，但看起来像个小盾牌。你把它捡起来在手里转了转；它比看起来要轻——里面肯定是空的——透过几个开口，你窥见了里面齿轮和机械装置的运作。");
         outputText("[pg]当你进一步调查这个奇怪的装置时，早些时候的那只鸟回来了，显然还带了它的伴侣。这两只鸟对你的出现很不高兴，在你周围扑腾，用它们尖锐、愤怒的声音叽叽喳喳地叫着。[if (cor > 50) {真烦人。你想抓住并捏死这些小混蛋，但抓住它们比它们没完没了的叽叽喳喳更麻烦。|它们很烦人，但不肯被赶走。}]");
         outputText("[pg]当你试图再次将注意力集中在盾牌上时，你感觉你探索的手指碰到了类似隐藏开关的东西，于是你拨动了它。突然，圆盘活了过来。你听到齿轮转动的声音，听起来像是在上发条，伴随着一声[i: 咔哒]声，叽叽喳喳的声音停止了。");
         outputText("[pg]你眨了眨眼。外面沼泽的声音仍然能听到，圆盘发出微弱的滴答声，但当你抬头看时，你发现鸟儿冻结在半空中。[if (cor > 75) {真方便。你一抓住其中一只，它就开始移动，并在你捏碎这个小生物的骨头时发出一声惊恐的尖叫。第二只也紧随其后。你把它们扔掉，但在扭曲的尸体离开你手的下一秒，它们又冻结了。|你困惑地盯着它们。你试探性地伸出手去触摸其中一只，但你一碰到它，它就开始移动并扑腾着飞走，结果又一次冻结了。再试一次结果也是一样：它一离开你的触碰就会冻结。}]你疑惑地皱着眉头看着手中的圆盘。");
         outputText("[pg]然后，伴随着另一声[i: 咔哒]声，滴答声停止了，[if (cor > 75) {毫无生气的鸟儿砰的一声掉在地上|叽叽喳喳的声音恢复了，惊慌失措的鸟儿再次逃离了神庙}]。");
         outputText("[pg]" + (get_player().seenTimeMagic() ? "你开始意识到这可能是什么" : "你发现了一个多么奇怪的装置") + "。你不知道这件魔法科技产品来自哪里，但刚才发生的事情肯定是它干的。它一定能够" + (get_player().seenTimeMagic() ? "操纵使用者周围的时间" : "以某种方式冻结使用者周围的动物。甚至可能是人") + "。背面有两条带子，所以你可以像普通盾牌一样戴着它。它很小，但看起来仍然是由某种金属制成的；它可能能承受一些打击。");
         outputText("[pg]你把它放在祭坛上，考虑该怎么做。");
         saveContent.foundTemple = true;
         menu();
         addNextButton("拿走",templeFirstTake).hint("拿走这面奇怪的盾牌。");
         addNextButton("离开",templeFirstDontTake).hint("最好还是让它留在原处吧。");
         if(get_silly())
         {
            addNextButton("烧掉",templeFirstBurn).hint("试着烧掉这个奇怪的圆盘。");
         }
      }
      
      public function templeFirstDontTake() : void
      {
         clearOutput();
         outputText("你决定不拿走金属圆盘，把它留在祭坛上。谁知道它还蕴含着什么奇怪的魔法，或者它是否安全。你不急于弄清楚。");
         outputText("[pg]转过身，你走出神庙准备回营地，在回去的路上任由无数蚊子摆布。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function templeFirstBurn() : void
      {
         clearOutput();
         outputText("无论你怎么尝试，火焰法术都无法融化钢铁盾牌。");
         menu();
         addNextButton("拿走",templeFirstTake).hint("拿走这面奇怪的盾牌。");
         addNextButton("离开",templeFirstDontTake).hint("最好还是让它留在原处吧。");
      }
      
      public function templeEncounter() : void
      {
         _temp_1.timesVisited += 1;
         get_marielle().registerTags();
         var _loc1_:int = get_time().hours;
         var _loc2_:Number = get_time().minutes / 60;
         get_marielle().saveContent.visitTime = _loc1_ + _loc2_;
         if(!saveContent.foundTemple)
         {
            templeFirstTime();
         }
         else if(saveContent.timesVisited >= 5 && get_marielle().saveContent.state == 0)
         {
            get_marielle().meet();
         }
         else if(get_marielle().saveContent.state > 0 && get_marielle().saveContent.openDate == 0)
         {
            get_marielle().open();
         }
         else
         {
            templeMenu();
         }
      }
      
      public function templeBogExplore() : void
      {
         saveContent.excludeExplore = get_time().get_totalTime();
         get_game().bog.explore();
      }
      
      public function templeBatheSolo(param1:Boolean = true) : void
      {
         if(param1)
         {
            clearOutput();
         }
         outputText("[pg][if (hasarmor) {你脱下[armor]，将其整齐地放在一个空着的基座上，然后|你已经一丝不挂了，所以你迅速把行李放在地板上，然后}]将[if (tailLeg) {[if (isMer) {你的鳍|你的尾尖}]|你的[foot]}]浸入水中。几乎不需要适应温度，所以你坐在边缘，然后让自己慢慢沉入舒适的水中。");
         outputText("[pg]这让你的[skinshort]感到轻微的刺痛，当你长舒一口气时，一阵愉悦的战栗顺着你的脊背流过。你已经感觉到，因长途冒险而疲惫的肌肉正在慢慢放松舒展，一种抚慰人心的宁静感如平静却深邃无垠的海洋中温柔的波浪般席卷全身。如果你想的话，你大概能在这里睡着。");
         outputText("[pg]但为了防止那种情况发生，你开始擦洗身体，洗去[skinfurscales]上的污垢。你没有肥皂，但现在这样也行了。毕竟还要回营地，路上肯定又会沾满泥巴……你尽量暂时不去想这些，而是沉浸在杂草丛生的神庙里这个温暖、洁净的小水池中，让水没过下巴。你又叹了口气，仿佛卸下了任务中积累的重担。就在这一刻，你只是靠在池边闭目养神，让身心飘散入虚无之中。");
         outputText("[pg][if (cor < 66) {耳边传来一声轻柔的鸟鸣，将你从睡梦中唤醒。你伸了个懒腰，转头看到一只小巧的白棕色小鸟正慌忙地从你身边飞走，停在远处的一个壁灯上。你打了个哈欠。|你倒吸一口凉气，猛地惊醒。你刚才打瞌睡了吗？肯定是。你一边伸展着手臂和脖子，一边纳闷这水对你的影响到底有多大。}] 好了，看你指尖起皱的程度，是时候出去了。");
         outputText("[pg]神庙里的空气和池水的温暖形成了鲜明的对比，当你从舒适的池水中起身时，不禁打了个寒颤。由于没带毛巾，你别无选择，只能在偶尔吹过的微风中晾干身体，然后再穿上你的[armor]。");
         outputText("[pg]不过，你最终还是准备好离开了，你迈着小步走到了外面。沼泽依然像往常一样潮湿且充满敌意，但不知为何，在返回营地的路上，你感觉自己仿佛仍处于半漂浮的状态。");
         dynStats(DynStat.Cor(-0.6));
         get_player().changeFatigue(-50);
         get_player().hasGottenWashed();
         _temp_1.timesBathed += 1;
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function templeBathe() : void
      {
         var _g:BogTemple;
         clearOutput();
         outputText("穿过恶劣的沼泽让你浑身污垢、疲惫不堪，而且被虫子咬的包比你希望的要多，所以现在，你想洗个舒服、放松的澡。水池很大，水面清澈，被从外墙坍塌部分下方延伸进来的[sun]光照亮，你用手在水面上划过，试探着水温。");
         outputText("[pg]水很温暖，非常适合你的需求。");
         if(get_marielle().marielleAvailable(false,false))
         {
            if(get_marielle().saveContent.commissionTime > get_time().get_totalTime() && get_time().isTimeBetween(6.5,22.5))
            {
               outputText("[pg]你瞥了一眼玛瑞斯，她正全神贯注地处理你的委托——以至于如果你就在这里安静地洗个澡，她可能都不会注意到。");
            }
            else
            {
               outputText("[pg]你瞥了一眼" + (get_time().isTimeBetween(22.5,6.5) ? "玛瑞斯安静的帐篷，她的灯已经熄灭，女孩在她的货物和材料后面的某个地方睡着了。你怀疑如果你在这里洗澡会不会吵醒她——距离够远了，所以除非你决定弄出很大的动静，否则你不会打扰她睡觉。" : "玛瑞斯，她显然正在一叠笔记上画着什么，铅笔在纸上快速、无声地飞舞。如果你在这里洗澡，她可能不会介意，甚至可能不会注意到。"));
            }
            menu();
            _g = this;
            addNextButton("独自洗澡",function():void
            {
               _g.templeBatheSolo();
            }).hint("[if (silly) {独自一人洗个悲伤的澡。|自己洗个澡。}]");
            addNextButton("邀请她",get_marielle().bathe).hint("邀请裁缝和你一起洗澡。").disableIf(get_marielle().saveContent.commissionTime > get_time().get_totalTime(),"她现在很忙。").disableIf(get_time().isTimeBetween(22.5,6.5),"她现在睡着了。").disableIf((get_marielle().saveContent.talks & get_marielle().TALK_SEX) == 0,"你觉得和她还不够亲密，不能这么做。");
            setExitButton("返回",templeBathBack);
         }
         else
         {
            templeBatheSolo(false);
         }
      }
      
      public function templeBathBack() : void
      {
         clearOutput();
         outputText("你现在不想洗澡。");
         templeMenu(false);
      }
      
      public function saveToObject() : Object
      {
         return saveContent;
      }
      
      public function reset() : void
      {
         saveContent.foundTemple = false;
         saveContent.shieldTaken = false;
         saveContent.inspection = 0;
         saveContent.seenBalcony = false;
         saveContent.excludeExplore = 0;
         saveContent.timesVisited = 0;
         saveContent.timesPrayed = 0;
         saveContent.timesBathed = 0;
      }
      
      public function onAscend(param1:Boolean) : void
      {
         reset();
      }
      
      public function load(param1:int, param2:*) : void
      {
         Utils.extend(saveContent,param2);
      }
      
      public function get_marielle() : Marielle
      {
         return get_game().bog.marielle;
      }
      
      public function get_debugName() : String
      {
         return "沼泽神庙";
      }
      
      public function get_debugHint() : String
      {
         return "";
      }
      
      public function debugMenu(param1:Boolean = true) : void
      {
         get_game().debugMenu.debugCompEdit(saveContent,new SaveContent(null,null,null,null,null,null,null,null));
      }
   }
}

