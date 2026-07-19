package classes.scenes.places.farm
{
   import classes.CoC;
   import classes.Cock;
   import classes.CockTypesEnum;
   import classes.DynStat;
   import classes.ImageManager;
   import classes.MasteryLib;
   import classes.PerkLib;
   import classes.Player;
   import classes.StatusEffects;
   import classes.Vagina;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.display.SpriteDb;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.scenes.Camp;
   import classes.scenes.combat.Combat;
   import flash.Boot;
   
   public class KeltScene extends AbstractFarmContent
   {
      
      public var kelly:Kelly;
      
      public function KeltScene()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         kelly = new Kelly();
         super();
      }
      
      public function youBadEndKeltForGood() : void
      {
         clearOutput();
         get_images().showImage("item-kelt\'sBow");
         outputText("你不假思索地抓住凯尔特的脖子。半人马大喊：[say: 不！别这样，婊子！][pg]");
         outputText("你猛地一扭，扭断了他的脖子，结束了他的生命。你从凯尔特身上拿走那把弓。看到它比你那把脆弱的弓看起来更结实，你折断了旧弓，把它扔在地上。你为新得到的弓感到自豪。[pg]");
         outputText("<b>(你获得了凯尔特的弓！)</b>");
         get_player().removeKeyItem("Bow");
         get_player().createKeyItem("Kelt\'s Bow",0,0,0,0);
         get_player().createStatusEffect(StatusEffects.KeltOff,0,0,0,0);
         get_player().upgradeBeautifulSword();
         dynStats(DynStat.Cor(2));
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2030,1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function leaveKelt4Good() : void
      {
         clearOutput();
         get_images().showImage("item-kelt\'sBow");
         outputText("你觉得他不值得你浪费时间，于是转身离开。不知怎么的，你有一种感觉，你再也不会见到他了。");
         outputText("你还发现了凯尔特留下的弓。看到它比你那把脆弱的弓看起来更结实，你折断了旧弓，把它扔在地上。你为新得到的弓感到自豪。[pg]");
         outputText("<b>(你获得了凯尔特的弓！)</b>");
         get_player().removeKeyItem("Bow");
         get_player().createKeyItem("Kelt\'s Bow",0,0,0,0);
         get_player().createStatusEffect(StatusEffects.KeltOff,0,0,0,0);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function keltSubmitGivingBJ() : void
      {
         spriteSelect(SpriteDb.get_s_kelt());
         get_player().slimeFeed();
         clearOutput();
         outputText("[say: 这就对了。谁是个乖巧的小婊子？谁是个饥渴的小荡妇？好了，婊子……是时候填满你那肚子了。张大嘴巴。][pg]");
         outputText("你不情愿地，带着脸颊上燃烧的羞耻感和蹂躏着你理智的欲望，在他面前跪下，照做了。[pg]");
         if(get_player().statusEffectv2(StatusEffects.Kelt) >= 90)
         {
            get_player().createStatusEffect(StatusEffects.BlowjobOn,0,0,0,0);
         }
         keltReluctantGivingBJ();
         doNext(continueAfterBJ);
      }
      
      public function keltSubmissiveBadEnd() : void
      {
         spriteSelect(SpriteDb.get_s_kelt());
         clearOutput();
         outputText("你向农场飞奔而去，脑海中只有一个念头。凯尔特……你的主人，你的爱人，你的渴望。你满脑子都是他的肉棒，幻想着他今天会怎么用它来操你。曾经，你似乎有什么任务……一项重要的职责。然而，这个游离的念头几乎瞬间就消失了。你当然有职责！那就是随时随地被凯尔特操！[pg]");
         outputText("几乎在你到达的瞬间，你的衣服就从身上滑落，被急不可耐地撕扯下来，暴露了你的欲望。凯尔特带着残忍的愉悦看着这一幕，然后走上前，用手捏住你的下巴，傲慢地审视着你。他的气味充满了你的鼻腔，对他的肉棒的渴望占据了你的思绪。你调皮地暗示，你需要再上一次“射箭”课。[pg]");
         outputText("他的脸色阴沉下来。这是你得到的唯一警告，紧接着他狠狠地扇了你一巴掌，打得你闷哼一声，在地上转了一圈。疼痛让你充满幸福感，你急切地把屁股高高撅起，希望他能就地办了你。凯尔特对你咆哮，你微微颤抖，但依然把屁股撅得高高的。[pg]");
         outputText("[say: 射箭？我已经玩够这个游戏了，婊子。我决定不再教你射箭了。][pg]");
         outputText("一种恐惧感涌上心头。没有课了？没有……凯尔特了？接着，又是一阵剧痛，他粗暴地抓住你的头发，把你拖到一个干草垛旁，把你脸朝下扔了上去。片刻之后，他沉重的身躯压在你身上，肿胀的肉棒顶着你的后背。[pg]");
         outputText("[say: 不，没有射箭了。是时候接受真正的教育了，婊子。第一课……你是个骚货，来这里只是为了取悦我。没有冒险，没有探索。从现在起，你只是一个让我射精的洞。听懂了吗？][pg]");
         outputText("你高兴地呜咽着，一遍又一遍地感谢他。一块大石头落地了，你的真正使命显露无疑。你怎么以前就没发现呢？凯尔特是你的主人，而你只是他饥渴的骚货！这个启示让你欣喜若狂。你急切地向后迎合他，渴望被填满，渴望得到满足。他在你身上研磨着，脸上一直挂着邪恶的笑容。然后，他仁慈地向后退了一点，找准位置，用他的肉棒填满了你的屁股。[pg]");
         get_images().showImage("kelt-farm-smallbarn");
         outputText("[say: 呃！真是个好婊子。从现在起，你是我的，只属于我一个人。如果你敢和别的生物上床，我就杀了你。不过，做个乖乖的骚货，也许我会赏你几只小马驹填满你的肚子。现在给我叫床，婊子。我想听你在被我占有时的尖叫。][pg]");
         outputText("你确实尖叫了，但那是愉悦的尖叫，因为他的肉棒在你肠道深处爆发了。这就是你想要的……这就是你一直想要的。凯尔特满足地释放后闷哼了一声，然后又开始抽插，肉棒依然坚挺，准备向他最新的后宫成员注入第二发。你一次又一次地乞求他给你更多，毫无遗憾地拥抱你的新生活。");
         doNext(keltBadEndEpilogue);
      }
      
      public function keltResistancePussyOut() : void
      {
         spriteSelect(SpriteDb.get_s_kelt());
         outputText("你暂时压抑住了愤怒。是的；凯尔特是个混蛋，但他教了你很多，顺着这个可爱的种马有什么不好呢？你摇了摇头，对这个不合时宜的想法感到不舒服。你匆匆离开，无法面对你的主人。");
         get_player().addStatusValue(StatusEffects.Kelt,2,2);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function keltResistance() : void
      {
         spriteSelect(SpriteDb.get_s_kelt());
         clearOutput();
         outputText("你闭上眼睛，");
         if(get_player().hasMuzzle())
         {
            outputText("喉咙深处发出一声低吼");
         }
         else
         {
            outputText("强忍着愤怒引起的肌肉痉挛");
         }
         outputText("因为凯尔特的侮辱太过分了。你已经受够了他虚伪的断言！[pg]");
         outputText("一个如何让他认清自己位置的想法在你的脑海中慢慢形成，尽管你确信这样做会让这个自负的半人马颜面扫地，再也不敢在农场周围露面。你要这么做吗？");
         menu();
         addButton(0,"是",fuckKeltsShitUp);
         addButton(1,"否",keltResistancePussyOut);
      }
      
      public function keltResistGivingBJ() : void
      {
         spriteSelect(SpriteDb.get_s_kelt());
         clearOutput();
         outputText("召唤出你支离破碎的意志力中仅存的部分，你抵抗了这种需求，向凯尔特道歉并转身离开。这样做很痛苦，胸口隐隐作痛，几乎有一种想要回去的生理需求；想要道歉并虔诚地跪在他面前。[pg]");
         outputText("然而，令你惊讶的是，凯尔特似乎并不特别在意。事实上，当你离开时，他笑了。[pg]");
         outputText("[say: 继续自欺欺人吧，婊子。等你饿了的时候，我会等你的。]");
         outputText("[pg]凯尔特离开了，拒绝现在教你。");
         get_player().addStatusValue(StatusEffects.Kelt,2,-5);
         dynStats(DynStat.Lust(5));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function keltRequiresNakedness() : void
      {
         clearOutput();
         get_images().showImage("kelt-encounter");
         outputText("你再次在惠特尼的农场遇到了半人马凯尔特。你走近他，想再要一节射箭课，但当你靠近时，凯尔特已经对你怒目而视了。[pg]");
         outputText("[say: 这样我没法教你，]他冷笑道。[say: 你的平衡感糟透了。我认识的小马驹都比你射得准。你真的想学这门手艺吗？那你就得像半人马一样练习。你绝对看不到我穿盔甲！][pg]");
         outputText("他骄傲地拍了拍自己赤裸的胸膛，你意识到他的意思是让你脱光衣服。当你抗议时，他烦躁地眯起眼睛，冷笑变得更加残忍。[pg]");
         outputText("[say: 没想到你还是个懦夫。那好吧……滚开吧。既然你受不了，那就回你的营地去编头发，或者干点别的什么。如果你等得够久，我相信会有一只友善的牛头人来把你变成他的婊子。这就是你唯一的用处，对吧？][pg]");
         outputText("你服从他的要求吗？");
         if(get_player().cor + get_player().lib + get_player().get_lust() * 100 / get_player().maxLust() >= 180)
         {
            outputText("你当然服从。你喜欢表演。");
            doNext(keltEagerlyGetNaked);
            return;
         }
         menu();
         addButton(0,"勉强",keltReluctantlyGetNaked);
         addButton(1,"急切",keltEagerlyGetNaked);
         if(get_player().get_inte() > 40 && (get_player().isCorruptEnough(70) || get_player().hasPerk(PerkLib.Sadist) || get_player().hasPerk(PerkLib.Pervert)) && !get_player().isTaur())
         {
            outputText("[pg]<b>如果你反击并煞煞他的威风，你可能再也见不到他了……</b>");
            addButton(3,"反客为主",keltResistance);
         }
         else
         {
            addButtonDisabled(3,"反客为主","一个足够强硬聪明的人也许能让他措手不及……不过，身为半人马形态绝对帮不上什么忙。");
         }
         addButton(4,"绝不",keltRefuseNakedness);
      }
      
      public function keltRequiresBlowjobs() : void
      {
         var _g3:KeltScene;
         var _g2:KeltScene;
         var _g1:KeltScene;
         var _g:KeltScene;
         clearOutput();
         spriteSelect(SpriteDb.get_s_kelt());
         get_player().createStatusEffect(StatusEffects.KeltBJ,0,0,0,0);
         get_images().showImage("kelt-encounter");
         outputText("穿过惠特尼的农场，当你远远地看到半人马凯尔特时，你的心跳开始加快。你忍不住欣赏他强健的侧腹和他自由奔跑时骄傲的身姿。也许是对自己有点满意，你还仔细看了看他那悬挂着的装备，虽然被包皮包裹着，但尺寸依然可观。这景象令人着迷。[pg]");
         outputText("尽管你克制自己，嘴角还是不争气地浮起一丝笑意。凯尔特这人有时候是真让人受不了。大多数时候都受不了。好吧，是每时每刻都受不了。但他身上就有种什么东西，让你莫名觉得……对劲。他当然是在损你……可他那么强壮、那么威武。那么……男人，你一时想不出更好的词。狂妄、自大，而且完全掌控着局面。说不上为什么，这让你膝盖发软。[pg]");
         outputText("[say: 风景不错，是吧？][pg]");
         outputText("你猛地眨了眨眼，回过神才发现自己走了神。就在你胡思乱想的时候，凯尔特已经走到了你面前，而你正直勾勾地盯着他的裤裆。他居高临下地看着你，一脸嚣张的坏笑。你脸颊发烫，结结巴巴地说你是来继续学射箭的。他嗤笑一声，显然被逗乐了。[pg]");
         outputText("[say: 是啊，我敢打赌。当他们谈论射出长杆时，婊子，他们说的是箭。不过我敢打赌，你更喜欢另一种，对吧？][pg]");
         outputText("他绕着你踱步，姿态近乎掠食。他粗壮的马身擦过你，他身上那股味儿浓得让你有些晕乎乎。那味道浓烈而麝香，像一剂烈性春药，直直切进你的小腹深处。你忍不住轻轻呜咽了一声，凯尔特挑起一边眉毛。不知是你多心，还是他脸上几乎露出了一丝……满意？[pg]");
         outputText("[say: 好吧，我觉得你已经占够便宜了。也许我不想再教你了。毕竟……我能从中得到什么？我花了一整天的时间教一个白痴怎么才不会射中[him]自己的脚，结果我什么也没得到。我觉得是时候让你付点报酬了。][pg]");
         outputText("你下意识地点点头，手忙脚乱地去摸装宝石的袋子。凯尔特随手一巴掌把你打倒在地。你的脸颊火辣辣地疼，疼痛让你的头脑清醒了一些。凯尔特正冷笑着俯视你，但他的表情中却透着一丝阴暗的愉悦。[pg]");
         outputText("[say: 我他妈才不要你的钱。我能买什么……色情漫画和学者茶吗？滚开。你想学更多射箭技巧？那你是时候表现出一点感激之情了。][pg]");
         outputText("他轻而易举地把你推倒，让你脸朝下摔进泥里。你一边吐着泥水，一边试图爬起来，却发现凯尔特已经移动了位置，站在你上方，两只蹄子分别踩在你头部两侧。你擦去脸上的污泥，这才明白他为什么这么做。在他那桶状的腹部下方，他巨大的肉棒正慢慢从包皮中滑出，并且还在以肉眼可见的速度变大。[pg]");
         outputText("你忍不住盯着那充血肿胀的龟头，它从斑驳的柱体顶端膨胀开来。在你上方，凯尔特打了个响鼻，听起来更像是一匹不耐烦的马而不是人，他稍微向前移动了一下；他半勃起的阴茎压在了你的脸颊上。当那滚烫、湿润的龟头冠状沟压在你的脸上，并在你的脸颊上留下一大坨浓稠的先列腺液时，你发出一声惊呼。凯尔特又咕哝了一声，显得更加急不可耐。[pg]");
         outputText("[say: 你知道代价的，荡妇。你想上射箭课，而我想把精液射进你的喉咙里。双赢。现在开始吧。][pg]");
         outputText("你艰难地咽了口唾沫。你没必要忍受这个！凯尔特是个傲慢、粗暴、天赋异禀、诱人、美味的……你摇了摇头，思绪变得模糊。那根肉棒每一秒都在变得更大更粗，它的麝香味让你的感官愉悦不已。你心里有个声音在说，只是口交一次而已，没什么大不了的……对吧？");
         outputText("[pg]你要屈服吗？");
         if(get_player().cor + get_player().get_lib100() + get_player().get_lust100() >= 200 && get_player().get_inte() < 60)
         {
            outputText("你当然会，你这个荡妇。");
            _g = this;
            doNext(function():void
            {
               _g.keltBlowjobRequirementEagerly();
            });
            return;
         }
         menu();
         _g1 = this;
         addButton(0,"羞耻地",function():void
         {
            _g1.keltBlowjobRequirementShamefully();
         });
         _g2 = this;
         addButton(1,"渴望地",function():void
         {
            _g2.keltBlowjobRequirementEagerly();
         });
         _g3 = this;
         addButton(2,"绝不！",function():void
         {
            _g3.keltBlowjobRequirementNever();
         });
         if(get_player().get_inte() > 40 && (get_player().isCorruptEnough(70) || get_player().hasPerk(PerkLib.Sadist) || get_player().hasPerk(PerkLib.Pervert)) && !get_player().isTaur())
         {
            outputText("[pg]<b>如果你反击并煞煞他的威风，你可能再也见不到他了……</b>");
            addButton(3,"反客为主",keltResistance);
         }
         else
         {
            addButtonDisabled(3,"反客为主","一个足够强硬聪明的人也许能让他措手不及……不过，身为半人马形态绝对帮不上什么忙。");
         }
         addButton(4,"战斗！",kelly.fightToBeatKelt);
      }
      
      public function keltReluctantlyGetNaked() : void
      {
         spriteSelect(SpriteDb.get_s_kelt());
         clearOutput();
         outputText("想到要在这位粗鄙又残忍的监工面前赤身裸体，你浑身不自在。但他确实有两下子，如果这是唯一能让他教你射箭的办法，那你只能硬着头皮上。你不情不愿地答应了他的条件，开始脱掉身上的" + get_player().armorDescript() + "。[pg]");
         outputText("你" + get_player().clothedOrNaked("先脱掉上衣，慢慢露出你的" + get_player().allBreastsDescript(),"展示你的" + get_player().allBreastsDescript()) + "。凯尔特围着你踱步，眼睛饥渴地盯着你的胸部。当你的上衣掉在地上时，他嘲弄地笑了起来，");
         if(get_player().get_gender() == 1 && get_player().biggestTitSize() < 1)
         {
            outputText("[say: 你是个娘们吗？快点，让我看看我到底在面对什么。][pg]");
         }
         else if(get_player().biggestTitSize() == 0)
         {
            outputText("[say: 哎呀！我还以为能在你身上找到一对奶子呢，看来是我眼花。没关系……我信你总有一天会发育的！][pg]");
         }
         else if(get_player().biggestTitSize() <= 5)
         {
            outputText("[say: 哈！难怪你跟那些怂包人类一样裹得严严实实！随便哪个半人马姑娘，要是胸口只挂着" + Utils.num2Text(get_player().totalBreasts()) + "个蚊子叮的包就出门，都得羞得不敢见人！你老家那帮人管你叫什么来着……\'小咪咪\'？还是他们都直接把你当男的算了！][pg]");
         }
         else if(get_player().biggestTitSize() <= 11)
         {
            outputText("[say: 哎哟，男孩们……当心点！这位“巨乳小姐”最近好像长了点肉啊！像你这样的人是怎么当上冒险者的？腰部以上，你除了卖淫什么也干不了！][pg]");
         }
         else
         {
            outputText("[say: 哦哟，这看着可真馋人呐！老实说……你真想学射箭？你每放一箭，弓弦都得弹到你那对奶子上！嘿嘿……我看你就好这口吧！该转行了，小骚货，当个奶妈或者奶牛得了……你也就配干这两样了！][pg]");
         }
         outputText("纵使他嘴上刻薄，你还是能看到凯尔特眼里赤裸裸的欲火。他显然正欣赏着你赤裸的肉体，乐在其中。尽管羞耻难当，你暗自下定决心，绝不让他的话戳到你。但随着你继续，他的点评只有越来越下流。" + get_player().clothedOrNaked("当你脱下下半身的衣物，彻底一丝不挂","当你挺胯扭腰，缓缓转了一圈") + "时，他盯着你的屁股，发出一声粗鄙的嗤笑，满是鄙夷的快意。");
         if(get_player().butt.rating < 6)
         {
            outputText("[say: 哟呵，看来还真练过！这小屁股又翘又紧，不错嘛！就是……大概紧过头了吧？没关系，跟哥说实话……那些又丑又老的怪物操你这可怜巴巴的小屁股时，疼不疼啊？哈哈！][pg]");
         }
         else if(get_player().butt.rating < 13)
         {
            outputText("[say: 嘿，你这后面的小肉垫可真不赖！成天坐着才攒出来的吧？不对，肯定不是。我猜你这小宝贝平时没少被操练……不过说真的，多挨几顿肏可代替不了正经运动，明白不！][pg]");
         }
         else
         {
            outputText("[say: 这屁股，我他妈真想怼上去！明明自称英雄，身材却跟个泄欲玩具似的！你这屁股让我想起我上次上的那个妞……当然啦，她可是匹母马！][pg]");
         }
         outputText("他张开巴掌扇在你的[ass]上，顺势狠狠捏了一把。他那股野兽般的麝香味钻进你的鼻腔，让你脑袋发晕，甚至莫名有点情动。这个半人马毫不掩饰对你身体的享受，虽说他嘴上不干不净，但这反倒让你有点受用。他绕到你面前，脸上挂着恬不知耻的坏笑，嘴上继续逗弄你。");
         if(get_player().totalCocks() == 0)
         {
            outputText("[say: 哎呀，你可真是个漂亮的小东西，浑身上下都是。你和我一定会相处得很愉快的，那是肯定的！][pg]");
         }
         else
         {
            outputText("几乎不可避免地，他的目光落在了你的[cock]上。他哼了一声，");
            if(get_player().cocks[0].get_cockType() == CockTypesEnum.HUMAN)
            {
               outputText("[saystart]呵。只是个普通型号，是吧？你知道这里有句话……像人类一样大！相信我……这可不是什么恭维的话。");
            }
            if(get_player().cocks[0].get_cockType() == CockTypesEnum.DOG)
            {
               outputText("[saystart]哦，快看啊！我们这儿有根小狗屌！好吧，不管你长没长鸡巴，你在我眼里永远是个小母狗，杂种。");
            }
            if(get_player().cocks[0].get_cockType() == CockTypesEnum.HORSE)
            {
               outputText("[saystart]那可真是太可悲了。有点嫉妒我了，是吧？非得自己跑出去弄根漂亮的马鸡巴？你早该问我的。我本来可以让你尝尝我的！");
            }
            if(get_player().cocks[0].get_cockType().get_Index() >= 3)
            {
               outputText("[saystart]哈！我倒要问问……你他妈到底是个什么东西？那是根鸡巴，还是条长错地方的丑陋尾巴？哈！");
            }
            if(get_player().cocks[0].cockLength <= 10)
            {
               outputText("所以，当你用那玩意儿捅女人的时候，她能感觉到吗？还是说你得提醒她什么时候开始装高潮？[sayend][pg]");
            }
            else if(get_player().cocks[0].cockLength <= 20)
            {
               outputText("不过，至少你的鸡巴尺寸还算过得去。你知道的，对于一匹小马驹来说。也许你运气好，真正的女人会可怜可怜你！[sayend][pg]");
            }
            else
            {
               outputText("要是他们能想个办法，让你别走两步就踩到自己的鸡巴，也许你就能算个真正的男人了！都长成这样了，你还能硬得起来吗？还是说硬起来会让你失去平衡摔倒？哈！[sayend][pg]");
            }
         }
         outputText("他最后打量了你一番，居高临下地冷笑了一声。[say: 嘛，就英雄而言，你这身板也算不上什么。但总比没有好。行吧，我会再教你一些。不过下次我叫你脱的时候，动作给我快点……不然我可就没这么大方了。][pg]");
         outputText("你点点头，对他冷酷的态度感到有些恼火。你并不完全确定自己是否想在这个粗鲁的半人马面前赤身裸体……但至少现在，他会再教你一些东西。不过他盯着你屁股看的方式确实让你感到有些不舒服。[pg]");
         get_player().addStatusValue(StatusEffects.Kelt,2,7);
         dynStats(DynStat.Lust(int(get_player().lib / 10) + 5));
         doNext(keltMainEncounter2);
      }
      
      public function keltReluctantGivingBJ() : void
      {
         spriteSelect(SpriteDb.get_s_kelt());
         get_player().slimeFeed();
         clearOutput();
         outputText("凯尔特立刻走到你身上，用力将他的阴茎在你的脸上摩擦。当你焦急地等待他的命令时，他似乎最喜欢用它来戏弄你，你用鼻子蹭着他的阴茎，但在他允许之前什么也做不了。它那麝香般的气味让你充满了一种你不敢承认的欲望……但它却真实存在。[pg]");
         get_images().showImage("kelt-farm-reluctantbj");
         outputText("[say: 好了，婊子。把我的肉棒吞下去。][pg]");
         outputText("没有什么能比这更让你感到愉悦了。你试图克制自己，强迫自己试探性地抚摸了几下他的肉棒……但你的饥渴无法被遏制。你满脸通红，张大嘴巴，贪婪地将他的龟头含入口中，品尝着那美妙先列腺液的绝佳滋味。凯尔特满意地咕哝了一声，坚持不懈地将臀部向前挺进。你甚至没有多想，就向他敞开了喉咙，当他的肉棒穿过你的扁桃体，再次撑开你的喉咙时，你微微干呕了一下。那对肿胀的睾丸在你够不着的地方诱惑着你，一想到他的精液会温暖你的肚子，你就忍不住想要吞下更多、更多这根奇妙的肉棒。[pg]");
         outputText("凯尔特毫不犹豫，而且做得比他该做的还要多。每当你犹豫不决时，他就会坚定地向前推进，从你的喉咙里哄骗出比你愿意给的更多的东西。虽然他坚持了一段时间，但在他大声呻吟并开始将浓稠的精液喷射到你的胃里之前，时间还是太短了。你能感觉到那黏糊糊的精液温暖了你的内脏，滑入你被塞满的肚子里，你不由自主地满足地颤抖着。他浓稠的精液属于你的体内，你这个饥渴、需要被填满的小精液垃圾桶。当他结束时，你的胃已经撑得发痛了……但再次被他的精液填满的满足感，对你受伤的自尊心来说，是一种更加残酷的满足。当他滑腻的肉棒变软并从你酸痛的喉咙里抽出时，你几乎感到一种不完整……但你忍住了把它舔干净的冲动。");
         get_player().refillHunger(50);
         outputText("[pg][say: 干得不错，荡妇。我就知道我留着你是有原因的。下次再来，也许我真的会教你点什么。或者，谁知道呢？也许我只会再给你点零食，嗯？哈！][pg]");
         outputText("你温顺地点了点头，感到屈辱，肚子里装满了精液。到目前为止，最糟糕的部分是你在内心深处有多么高兴。你试图告诉自己这是错的，凯尔特是一个傲慢、残忍的生物，这是最后一次了。但你并不真的相信。尽管你对自己撒了谎，你还是期待着他下次决定使用你的时候。[pg]");
         dynStats(DynStat.Lust(5));
         get_player().addStatusValue(StatusEffects.Kelt,2,5);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function keltRefuseNakedness() : void
      {
         spriteSelect(SpriteDb.get_s_kelt());
         clearOutput();
         outputText("你坚决拒绝，决心不让这个傲慢的半人马得逞。凯尔特嘲弄地向你冷笑，并就什么东西能塞进你的屁股给了你几条建议。随着他的侮辱变得越来越丰富多彩，你转身离开；他嘲笑的声音跟在你身后。你决定不再理会他了。");
         outputText("[pg](不知为何，你知道你再也不会遇到他了。)");
         get_player().createStatusEffect(StatusEffects.KeltOff,0,0,0,0);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function keltMainEncounterPostBlowjob() : void
      {
         clearOutput();
         if(get_player().hasStatusEffect(StatusEffects.BlowjobOn))
         {
            if(get_player().get_lust100() >= 75 || get_player().statusEffectv2(StatusEffects.Kelt) >= 90 && Utils.rand(2) == 0)
            {
               outputText("今天等待与凯尔特会面的时间显得格外漫长。他那熟悉的麝香味点燃了你的感官，让你因渴望而隐隐作痛。你们并肩走着，你试图诱惑地向凯尔特扭动屁股，迫不及待地想要开始例行的口交。即使是你，通常也不会如此饥渴，但对凯尔特肉棒的渴望填满了你的内心。你别无所求，只想好好伺候你那强壮的种马。[pg]");
               outputText("令你惊讶的是，凯尔特并没有带你去训练场，而是走向了场地边缘的一个小谷仓。当你怯生生地问他为什么带你来这里时，他眉头紧锁，猛地发作，随手给了你一巴掌。");
               outputText("[say: 贱货！我叫你进去。还需要我重复一遍吗，你这愚蠢的荡妇？][pg]");
               outputText("你连滚带爬地站起来，语无伦次地道着歉，急忙推开谷仓的门，立刻走了进去。在你面前是一张细长的高脚桌，上面有带子，就像马鞍的脚蹬。你的心兴奋地狂跳起来，凯尔特暗自轻笑了一声，命令你趴上去。你赶紧照做。[pg]");
               outputText("你趴在粗糙的桌子上，双脚踩在脚蹬里，屁股悬空在恰到好处的高度。凯尔特带着明显的饥渴动作着，手指顺着你的下体滑动。");
               if(get_player().totalCocks() > 0)
               {
                  outputText("你的[cock]硬得像石头，但他却几乎带着轻蔑地无视了它。与他双腿间慢慢膨胀的雄风相比，你甚至对它感到有些羞耻。");
               }
               if(get_player().hasVagina())
               {
                  outputText("片刻间，他的手指描摹着你暴露在外的" + get_player().vaginaDescript(0) + "的轮廓，给了你最轻微的警告，然后便粗暴地将两根手指深深插入，仿佛在试探你的深度。你对这种对待发出急促的呜咽，当凯尔特抽出手指，带着明显的愉悦舔舐时，你的呜咽声更大了。");
               }
               outputText("[pg][say: 哦？喜欢这样，是吗？不过，我们来这里可不是为了满足你的喜好。你来这里是为了满足我，荡妇。而且我知道我想要什么。][pg]");
               outputText("当凯尔特从后面骑上你时，他的两只前蹄重重地落在你头部两侧，你微微瑟缩了一下。你能感觉到他巨大的肉棒紧紧压在你的背上，一小团温热的先列腺液滴落在你的肩胛骨之间。在几个令人焦虑的瞬间，你颤抖着咬住嘴唇，等待他瞄准目标。当他那膨大的龟头冠状沟直直地抵在你的[ass]之间时，你几乎当场高潮。[pg]");
               outputText("凯尔特没有犹豫。伴随着一声近乎原始的咆哮，他猛地向前挺动肉棒，急切地想将自己深深埋入你的屁股。在没有润滑也没有前戏的情况下，当那根巨大的肉棒将你劈开时，你发出了一声尖叫。幸运的是，它急切地将先列腺液滴入你的后庭，让下一次的抽插变得容易了一些，尽管力道丝毫不减。凯尔特毫不留情，试图将自己塞进你");
               if(get_player().get_tallness() < 112)
               {
                  outputText("较小的");
               }
               outputText("身体里，完全不顾及你的死活。");
               get_player().buttChange(70,true,true,false);
               outputText("[pg]");
               get_images().showImage("kelt-farm-smallbarn");
               outputText("你控制不住自己……一想到被当作他毫无价值的性玩具，你自己也经历了一次轻微的高潮，哭喊着向这个强大的生物臣服。");
               if(get_player().totalCocks() > 0)
               {
                  outputText("在你身下，紧紧压在粗糙的骑乘板上的[cock]爆发了，将你自己的精液溅满了肚子。当浓稠的精液滑向你的脸庞时，你开始在自己温热的精液上滑动，随着凯尔特对你后庭的每一次粗暴捣弄而前后摇晃。");
               }
               if(get_player().hasVagina())
               {
                  outputText("你那可怜的、被忽视的小穴因喜悦而颤抖，甚至没有被触碰就痉挛起来。浓稠的淫液顺着你的腿自由地流下，滴落下来溅在下面的干草上，你像发情的母狗一样呻吟着。");
               }
               if(get_player().get_gender() == 0)
               {
                  outputText("从未有过完全没有生殖器会如此令人沮丧……或如此令人愉悦。由于无法在身体上达到高潮，高潮的爆炸只是在你的体内不断累积……一波又一波的快感倾泻而下，没有释放，也没有怜悯。");
               }
               outputText("[pg]如果说有什么不同的话，你的高潮似乎只会刺激凯尔特，让他插得更深、更快。把那根将近三英尺长的巨大肉棒塞进你的肠道里，这个想法似乎很荒谬，但这只好斗的半人马显然不打算接受“不”的回答。随着他臀部每一次有力的抽插，他把更多的肉棒深深地埋进你的屁股里，填满你，撑开你，撕裂你，而且还有更多。当你感觉到他巨大的睾丸撞击你的屁股，终于没入根部时，这几乎是一种可怕的解脱。即使在胜利中，凯尔特也依然刻薄。");
               if(get_player().looseness(false) < 3)
               {
                  outputText("[say: 操！终于进去了！你这小屁股还真是紧啊，不过别担心，荡妇。我们很快就会把它撑开的。我向你保证……从现在开始，你会得到更多我的肉棒，所以你最好准备好！][pg]");
               }
               else if(get_player().looseness(false) < 5)
               {
                  outputText("[say: 操！终于进去了！你这屁股还真不错，不过别担心，荡妇。我们很快就会把它变成一个真正的无底洞。幸好你一直在练习……从现在开始，你会得到更多我的肉棒，所以你最好准备好！][pg]");
               }
               else
               {
                  outputText("[say: 操！终于进去了！你这小屁眼还真是被撑得不错，不过别担心，荡妇。我很快就会把你训练得能恰到好处地夹紧。我向你保证……从现在开始，你会得到更多我的肉棒，所以你最好准备好！][pg]");
               }
               outputText("你失去了时间的概念，在你的主人的身下呻吟和呜咽，他无情地从你鼓胀的屁股里获取快感。你又高潮了吗？几乎可以肯定……但很难专注于那一种感觉。在你心中涌起的更强烈的感觉是一种正确感。这就是你属于的地方；这就是你快乐的地方。当他的肉棒开始在你体内膨胀，准备把他的精液卸在你深处时，你的声音在欢呼中提高。被你主人的肉棒刺穿，现在和永远，被他的精液填满……你别无所求。[pg]");
               outputText("精液的洪流淫荡地泵入你的体内，凯尔特沉重的睾丸将一阵又一阵的精液射进你的肠道，用滚烫的半人马精液填满你的肚子。直到你的屁股被填满到让你恶心的地步，他才停下来……有一次你咳出了一口他的精液，却又虚弱地试图把它咽下去。这是你主人的精液……它属于你体内。[pg]");
               outputText("当凯尔特拔出时，他留下了你被蹂躏的屁眼，张得大大的，里面充满了精液。当他退出时，你呜咽着，但无法动弹，无法思考。你隐约听到他再次嘲笑你，当他把一根手指伸进你张开的屁眼，然后按在你的嘴唇上时，你再次尝到了他精液的味道。[pg]");
               outputText("[say: 现在在那儿待一会儿，婊子。让它好好地卡在里面。明天再来，也许，如果你运气好的话，我会再操你一次。毕竟，你是个相当不错的精盆。][pg]");
               outputText("几个小时后你才振作起来，尽可能地夹紧屁股，把精液留在里面。尽管你努力了，但还是有一条稳定的痕迹顺着你的腿流下来，标记着你缓慢、快乐地跋涉回营地的路线。");
               doNext(get_camp().returnToCampUseTwoHours);
               get_player().slimeFeed();
               if(get_player().buttChange(70,true))
               {
                  outputText("[pg]");
               }
               get_player().addStatusValue(StatusEffects.Kelt,2,10);
               get_player().orgasm("Anal");
               dynStats(DynStat.Cor(1));
               return;
            }
            outputText("当你走向练习场时，你感觉到凯尔特的眼睛盯着你，目光热烈，也许还有点饥渴。知道接下来会发生什么，你故意尽可能地扭动臀部，试图在他面前炫耀。这显然有帮助，因为你只走到一半，凯尔特就用熟悉的语气咆哮道，[say: 跪下，婊子。][pg]");
            outputText("兴奋感涌遍全身，你焦急地跪在他面前，张大嘴巴，心跳加速。凯尔特立刻走到你身上，把他的肉棒用力地在你的脸上摩擦。他似乎最喜欢用它来戏弄你，而你焦急地等待着他的命令，用鼻子蹭着他的肉棒，但在他允许之前什么也做不了。[pg]");
            get_images().showImage("kelt-farm-eagerbj");
            outputText("[say: 好了，婊子。把我的肉棒吞下去。][pg]");
            outputText("没有什么能给你带来更多的快乐了。现在你已经很有经验了，你张得足够大，贪婪地吸吮着他那根肉棒的头部，只花了一会儿时间品尝他先列腺液的美妙味道，然后就张开喉咙供他使用。凯尔特对自己咕哝着，高兴地接受了你的邀请，你开始崇拜地深喉他，抚摸他暴露的阴茎，并在可能的时候抚摸他肿胀的睾丸，试图鼓励每一滴美妙的精液流出。[pg]");
            outputText("虽然他坚持了一段时间，但在他大声呻吟并开始将浓稠的精液喷射到你的胃里之前，时间还是太短了。你欣喜若狂，急切地吞咽着，感觉它温暖了你的内脏，滑入你饱满的腹部。当他结束时，你的胃被塞得满满的，甚至有些隐隐作痛……但再次被他的精液填满的满足感却远胜于此。凯尔特允许你在他拔出之前清理他的阴茎。[pg]");
            outputText("[say: 挺不错的，荡妇。我就知道留着你是有原因的。不过我已经够纵容你了。去那边射几箭，趁我还没对你感到厌烦。][pg]");
            outputText("你几乎不记得剩下的训练了。你完全被饱满的腹部和也许能再得到一点的想法分散了注意力。尽管你在课程中试图引诱他，但凯尔特在结束时似乎有些厌烦，并在不久后离开了，这让你感到懊恼。");
            get_player().slimeFeed();
            get_player().addStatusValue(StatusEffects.Kelt,2,5);
            bowSkill(3);
            dynStats(DynStat.Lust(20),DynStat.Cor(1));
            doNext(get_camp().returnToCampUseOneHour);
            return;
         }
         if(Utils.rand(10) <= 3)
         {
            get_images().showImage("event-archery");
            outputText("你走向练习场，试图无视凯尔特公然且饥渴地盯着你赤裸身体的目光。他越来越不掩饰对你的欲望。尽管如此，你还是忍不住享受他的关注。[pg]");
            outputText("一到场地，你正准备抽箭开始练习，凯尔特却粗暴地把你推倒在地，让你跪下。[pg]");
            outputText("[say: 今天不行，婊子。我想是时候让你回报一点了。所以做个乖巧的小婊子，开始伺候我的鸡巴吧。在继续教你之前，我要在那张漂亮的小嘴里射一发。][pg]");
            outputText("一阵欲望的战栗和恐惧的颤抖传遍你的全身。你曾希望能避免这个要求。一种饥渴在你体内潜伏……再次吞下半人马精液的想法几乎是不可抗拒的。但你害怕每一次这样做，你都在一点点地迷失自己……[pg]");
            if(get_player().cor + get_player().get_lib100() + get_player().get_lust100() >= 220 && get_player().statusEffectv2(StatusEffects.Kelt) >= 80)
            {
               outputText("你试图抵抗这种需求。你真的尝试了。但这一次，根本无法阻止。你对凯尔特再次射在你体内的渴望是如此强烈，你立刻跪倒在他面前，饥渴地等待着你的奖赏。你的一部分在想，为什么你一开始要反抗……事实上，为什么不在每节课前都给他口交呢？这肯定会让他更喜欢你……[pg]");
               doNext(keltSubmitGivingBJ);
               return;
            }
            get_images().showImage("kelt-dream");
            outputText("尽管有需求，尽管有欲望，你仍然有足够的控制力做出选择。你是屈服于半人马的意志和你自己的饥渴？还是你会以某种方式找到离开的力量？");
            menu();
            addButton(0,"屈服",keltSubmitGivingBJ);
            addButton(1,"抵抗",keltResistGivingBJ);
            addButton(4,"战斗！",kelly.fightToBeatKelt);
            return;
         }
         doNext(keltMainEncounter3);
      }
      
      public function keltMainEncounterAfterNakedReq() : void
      {
         if(get_player().hasStatusEffect(StatusEffects.NakedOn))
         {
            outputText("他点点头，嘴角挂着一丝似有似无的得意，然后不耐烦地朝你的衣服打了个手势。你带着几分愉悦，二话不说在他面前脱了个精光，脱的时候还故意带上了点小风情。等你脱完，凯尔特已经咧嘴笑得合不拢嘴，毫不掩饰地上下打量着你赤裸的身体，而你也因为乖乖服从了他这道强势的命令，身子不由得又燥热了几分。");
            get_player().addStatusValue(StatusEffects.Kelt,2,3);
         }
         else if(Utils.rand(10) <= 5)
         {
            outputText("凯尔特轻蔑地把你赤裸的身体从上到下扫了一遍，说除非你愿意再脱光了来学，否则他可没兴趣教你。");
            if(!(get_player().cor + get_player().get_lib100() + get_player().get_lust100() >= 180 && get_player().get_inte() < 30 || get_player().statusEffectv2(StatusEffects.Kelt) >= 60))
            {
               outputText("[pg]你不确定自己是否想再次裸体练习……特别是看到凯尔特看着你的眼神，他脸上挂着傲慢的坏笑。你同意他的条件吗？");
               menu();
               addButton(0,"同意",keltReluctantlyGetNaked);
               addButton(1,"拒绝",keltRefuseNakedness);
               if(get_player().get_inte() > 40 && (get_player().isCorruptEnough(70) || get_player().hasPerk(PerkLib.Sadist) || get_player().hasPerk(PerkLib.Pervert)) && !get_player().isTaur())
               {
                  outputText("[pg]<b>如果你反击并煞煞他的威风，你可能再也见不到他了……</b>");
                  addButton(2,"扭转局势",keltResistance);
               }
               else
               {
                  addButtonDisabled(2,"扭转局势","足够强硬和聪明的人也许能让他措手不及……不过，身为半人马形态绝对帮不上忙。");
               }
               addButton(4,"战斗！",kelly.fightToBeatKelt);
               return;
            }
            outputText("这一次，这个念头反倒让你有点兴奋了，你几乎是下意识地就答应了，满怀热情地在凯尔特面前把自己剥了个一丝不挂。他显然很是享受这场表演，而光是感受到他的目光，你就已经兴奋得不行。心里头有个声音在说，既然裸着训练效果更好，那是不是以后每次都应该直接脱光？这念头光是想想，就刺激得让人浑身发烫。");
            if(get_player().cor + get_player().get_lib100() + get_player().get_lust100() >= 220 && get_player().get_inte() < 40 || get_player().statusEffectv2(StatusEffects.Kelt) >= 70)
            {
               outputText("<b>带着淫荡的微笑，你决定在练习前总是脱光衣服。</b>");
               get_player().createStatusEffect(StatusEffects.NakedOn,0,0,0,0);
            }
            outputText("[pg]");
            get_player().addStatusValue(StatusEffects.Kelt,2,7);
         }
         else
         {
            outputText("凯尔特再次不悦地看着你的衣服，嘲笑你所谓的“人类的娇气”。不过，他并没有直接叫你脱掉。[pg]");
            if(get_player().cor + get_player().get_lib100() + get_player().get_lust100() >= 180 && get_player().get_inte() < 40 || get_player().statusEffectv2(StatusEffects.Kelt) >= 60)
            {
               outputText("不过这一次，这个想法让你有点兴奋。你问凯尔特是否更喜欢看你裸体，然后开始在他面前脱衣服。他似乎有些惊讶，但显然很享受这场表演，而他的注视让你异常兴奋。你心里有一部分在想，如果裸体训练效果更好，也许你每次都应该直接脱光？这个想法相当刺激。");
               if(get_player().cor + get_player().get_lib100() + get_player().get_lust100() >= 220 && get_player().get_inte() < 40 || get_player().statusEffectv2(StatusEffects.Kelt) >= 75)
               {
                  outputText("<b>你向凯尔特投去一个诱惑的微笑，并决定在练习前总是脱光衣服</b>。");
                  get_player().createStatusEffect(StatusEffects.NakedOn,0,0,0,0);
               }
               outputText("[pg]");
               dynStats(DynStat.Lust(int(get_player().lib / 10) + 5));
            }
            else
            {
               outputText("你尽可能地无视他那些带刺的话语，很快，他便不再纠缠此事，转而开始批评你的射箭技巧。[pg]");
            }
         }
         doNext(keltMainEncounter2);
      }
      
      public function keltMainEncounter3() : void
      {
         var _loc2_:int = 0;
         clearOutput();
         var _loc1_:Number = 0;
         if(!get_player().hasStatusEffect(StatusEffects.NakedOn))
         {
            if(get_player().get_gender() > 1)
            {
               get_images().showImage("kelt-archery-female");
            }
            else
            {
               get_images().showImage("kelt-archery-male");
            }
            outputText("凯尔特傲慢、粗鲁，而且在一次又一次嘲笑你的射箭尝试时，往往显得非常残忍。然而，尽管如此，他显然很清楚自己在做什么。你尽量无视他的侮辱和下流评论，专注于射箭。最后，你觉得你学到了很多，尽管凯尔特依然冷嘲热讽。[pg]");
            _loc2_ = Utils.rand(4);
            if(_loc2_ == 0)
            {
               outputText("[say: 噢，是的。看来你正在成长为一个相当精准的弓箭手。只要确保你只和瞎眼的巨人战斗就行了。你知道的，就是那种毫无躲闪机会的巨大目标。你会做得很好的。][pg]");
            }
            if(_loc2_ == 1)
            {
               outputText("[say: 哈！你想成为一名弓箭手？给你个提示……停止想吸鸡巴两秒钟，然后瞄准。][pg]");
            }
            if(_loc2_ == 2)
            {
               outputText("[say: 看到靶子中间的红点了吗？想象那是你的屁股，而箭是一根又大又粗的牛头人鸡巴。那应该能帮你射中目标。][pg]");
            }
            if(_loc2_ == 3)
            {
               if(get_player().get_race() != "centaur")
               {
                  outputText("[say: 如果你是个半人马，我会建议你自杀。既然你是个[race]，我只能说你最好的选择就是滚蛋。][pg]");
               }
               else
               {
                  outputText("[say: 作为一个半人马，我会建议你自杀。真的，要么去死，要么就他妈的像个男人一样。][pg]");
               }
            }
            if(get_player().masteryLevel(MasteryLib.Bow) < 5)
            {
               bowSkill(5 + Utils.rand(4));
            }
            else
            {
               bowSkill(1);
            }
         }
         else
         {
            if(get_player().get_inHeat() && get_player().get_gender() > 1)
            {
               outputText("你像往常一样排好队开始练习，向远处的靶子射击，而凯尔特则批评你的技术……通常是以尽可能大声、下流和冒犯的方式。然而，今天他似乎特别精力充沛。他逼近你，近得让人分心，他的蹄子像一匹焦躁的马一样在地上跺着。他的侮辱一如既往地刺耳……甚至比平时更残忍，因为他嘲笑你试图击中目标的尝试。[pg]");
               outputText("一箭射偏了，凯尔特愤怒地要求你去把插在附近干草捆里的箭捡回来。你迅速照做，带着一丝愉悦的颤栗服从了他的命令。不知为何，服从他的每一个愿望感觉很对；尽你所能去满足他。他的气味一直让你分心……他那浓郁、充满阳刚之气的力量。你以前怎么没注意到凯尔特是如此壮观的生物？[pg]");
               outputText("你弯下腰去拔干草堆里的箭，突然感觉后脑勺挨了重重一击，把你打倒在地，意识开始旋转。你晕乎乎地意识到凯尔特正站在你上方，扔掉了他刚才用来敲你脑袋的弓。在他的马腿之间，一根巨大的阴茎正从包皮中垂下，两侧是垒球大小的睾丸。他脸上挂着淫荡的笑容。[pg]");
               outputText("[say: 你以为我没注意到吗，荡妇？你闻起来就像发情的母马。你一到这儿我就闻到了。幸运的是，我知道该怎么对付一只发情的母狗。让我们在你那紧致的小穴里塞个半人马宝宝吧。][pg]");
               outputText("凯尔特的前腿微微抬起，刚好搭在你的肩膀上，他巨大的重量压在你身上。干草捆把你抬得刚好能对准他粗大的勃起，此时它正挤压在你的臀瓣之间。[pg]");
               if(get_player().statusEffectv2(StatusEffects.Kelt) <= 30)
               {
                  outputText("你尽力挣扎，但凯尔特比你重得多。当他挺动臀部，焦急地将鸡巴压向你的下体时，你意识到这件事无论你是否愿意，都即将发生。这个想法让你感受到一阵无法否认的愉悦颤栗。[pg]");
               }
               else if(get_player().statusEffectv2(StatusEffects.Kelt) <= 70)
               {
                  outputText("你象征性地挣扎了一下，但从一开始就很明显，你根本无法从半人马沉重的身躯下逃脱。此外，流经你全身的欲望是显而易见的……在某种程度上，你希望这一切发生。以至于当凯尔特抽插着，试图对准他的肉棒时，你抬起臀部来帮助他，默默地渴望着被插入。[pg]");
               }
               else
               {
                  outputText("他身上散发着强烈的、令人绝望的雄性气息。你的身体只想屈服于凯尔特狂野的欲望，你的理智也同意了。你急切地挺起臀部，一只手向后伸去，引导他的肉棒进入你湿润的小穴。凯尔特满意地哼了一声，你感到一阵情欲的颤栗传遍全身。[pg]");
               }
               outputText("半人马的肉棒有着真正的马匹尺寸，足足有两英尺半长，三英寸多粗。");
               if(get_player().vaginalCapacity() <= 16)
               {
                  outputText("这尺寸似乎根本插不进去，但凯尔特才不在乎你舒不舒服，毫不犹豫地将膨大的龟头塞进了你的体内。你尖叫出声，感觉自己要被他的肉棒撕裂了，它粗暴地挤压着你的内壁，将你完全撑开。凯尔特越来越烦躁地抽插着，但尽管他用尽全力，也只能将一半的肉棒塞进你的体内。每一次抽动都让你痛呼出声，因为你紧致的小穴正在挤压、榨取着那根巨大的器官。[pg]");
               }
               else if(get_player().vaginalCapacity() <= 40)
               {
                  outputText("即使对你来说，凯尔特的肉棒也显得太大了，他将那根巨大阳具膨大的龟头压在你的阴唇上。即便如此，他也没有犹豫，猛地向前一挺，毫不迟疑地用他的阳具刺穿了你。你发出一声呻吟，那根巨大的器官将你完全撑开，挑战着你的极限，几乎肯定会把你撑得更开。半人马的抽插毫不留情，但即使他尽了全力，也只能插进大约四分之三的肉棒。他烦躁地哼了一声……但你被填得太满了，脑子里满是快感，晕乎乎的。[pg]");
               }
               else
               {
                  outputText("当凯尔特将膨大的龟头深深插入你的体内时，它似乎完美地契合了你那大张着、饥渴的小穴。你感觉到那根雄伟的阳具填满了你，这是如今很少有肉棒能做到的，它将你完全撑开，探索着你的深处。当凯尔特插到底时，他发出一声满意的笑声，而你勉强能容纳他的尺寸。他沉甸甸的睾丸令人愉悦地拍打着你的屁股，你舒服地呻吟着，被肉棒填满了核心。");
               }
               get_player().cuntChange(50,true,true,false);
               if(get_player().isTaur())
               {
                  get_images().showImage("kelt-farm-female-inheat-taur");
               }
               else
               {
                  get_images().showImage("kelt-farm-female-inheat");
               }
               outputText("[pg]从那以后，骑乘变得越来越粗暴。凯尔特开始稳定地抽动臀部，又深又重，试图每一次抽插都尽可能多地埋入他的阳具。他很少考虑你的快感，但这无关紧要。面对那么大的肉棒，他每一次挺动臀部，你都忍不住呻吟出声。[pg]");
               outputText("[say:还不错，还不错！你是个相当不错的操物！也许等你给我生几个小马驹后，我会把你加入我的后宫。你会喜欢的，不是吗？你迫不及待地想怀上一肚子半人马，对吧？][pg]");
               if(get_player().statusEffectv2(StatusEffects.Kelt) <= 30)
               {
                  outputText("你颤抖着呻吟，无法控制自己。很明显，凯尔特完全打算让你怀孕，而你无力阻止身体的冲动。每天被这只残忍的野兽强暴的可怕画面充满了你的脑海……你的肚子一次又一次地怀上他的孩子。你发出一声呻吟，在凯尔特的笑声中无助地高潮了。[pg]");
               }
               else if(get_player().statusEffectv2(StatusEffects.Kelt) <= 70)
               {
                  outputText("一想到这里，你从头到脚都充满了可怕的情欲颤栗。你的身体渴望被一次又一次地播种，屈服于这个强大生物的想法是如此强烈地色情，以至于你当场就射了，在令人愉悦的放纵中高潮。成为这只半人马的生育奴隶的想法感觉太棒了！[pg]");
               }
               else
               {
                  outputText("你无助地呜咽着表示肯定，高兴地颤抖着。你在内心深处有一种感觉，这个强大的生物，这个男子汉的典范，是你的主人，而你只是他的生育奴隶。你的小穴挤压、榨取着他的阴茎，试图催促那场让你永远属于他的精液爆发。知道你伟大的主人很快就会让你怀孕，用他的种子填满你，这让你陷入了令人抓狂的高潮。[pg]");
               }
               outputText("[say:好了，荡妇……你的宝宝来了！][pg]");
               outputText("当半人马的肉棒在你体内爆发，将浓稠的精液直接泵入你的子宫时，你感到一阵温暖的绽放。这数量令人难以置信，仅仅是他冒着热气的精液填满你肚子的感觉就让你再次高潮。他肉棒的每一次微小抽动都会让精液和汁液从你被塞满的小穴中喷涌而出，大部分都被困在里面。由于数量庞大，你的肚子开始微微隆起，你几乎融化成了一滩满足的烂泥。[pg]");
               outputText("过了一会儿，凯尔特巨大的肉棒软了下来，足以从你受虐的小穴中滑出，随后一股精液的洪流涌了出来。你躺在干草捆上，疲惫地喘着粗气，双手按在饱满的肚子上。凯尔特低头看着你，哼了一声。[pg]");
               outputText("[say:这副模样挺适合你的。如果没怀上，明天再来，荡妇。我很乐意再干一次。][pg]");
               get_player().slimeFeed();
               get_player().orgasm("Vaginal");
               outputText("他一言不发地离开了你。");
               get_player().addStatusValue(StatusEffects.Kelt,2,5);
               get_player().knockUp(30,420,50);
               doNext(get_camp().returnToCampUseOneHour);
               return;
            }
            _loc1_ = Utils.rand(5);
            if(_loc1_ <= 2)
            {
               get_images().showImage("kelt-archery-naked");
               outputText("课程像往常一样进行，你射箭，而凯尔特傲慢地批评你的姿势，尽可能地抛出丰富多彩和富有创意的侮辱。他毫不羞耻地嘲笑你的身体，就像他嘲笑你的箭术一样，并对你的身体可能有什么用处发表了几句粗俗的评论。");
               if(get_player().statusEffectv2(StatusEffects.Kelt) <= 30)
               {
                  outputText("你试图无视那些粗话，告诉自己他就是这样的人。但这并没有什么帮助，因为有时你会感觉到凯尔特的眼睛色眯眯地在你身上游走。至少他的一些评论不是嘲笑，而是建议。整个经历让你在这个粗暴的半人马身边感到更加不舒服。");
               }
               else if(get_player().statusEffectv2(StatusEffects.Kelt) <= 70)
               {
                  outputText("尽管如此，他的一些粗俗评论还是让你脸红了。到现在为止，你已经习惯了恶魔世界经常出现的堕落性行为……但让自己遭受这种待遇还是有点丢人……而且，让你感到羞耻的是，有时这有点令人兴奋。虽然凯尔特很侮辱人、残忍而且粗俗，但你也注意到他的一些目光中流露出真正的欲望。在课程结束时，你因兴奋和劳累而满脸通红。");
               }
               else
               {
                  outputText("当然，凯尔特的话只会让你更加分心，无法击中目标。不是因为你生气……而是因为你被唤起了。不知何故，他下流的评论和粗俗的嘲笑让你因期待而颤抖。他太强大了，太有男子气概了。凯尔特似乎很清楚他对你的影响，有一次还伸出手用力拍打你的屁股。在训练结束时，你感到极度饥渴。");
               }
               dynStats(DynStat.Lust(10));
               if(get_player().masteryLevel(MasteryLib.Bow) < 5)
               {
                  bowSkill(4);
               }
               else
               {
                  bowSkill(1);
               }
               doNext(get_camp().returnToCampUseOneHour);
               return;
            }
            if(get_player().biggestTitSize() == 0 && _loc1_ == 3)
            {
               _loc1_ = 4;
            }
            if(_loc1_ == 3)
            {
               get_images().showImage("kelt-boobs");
               outputText("练习像往常一样开始，但今天有点不同。令你惊讶的是，凯尔特平时的侮辱和评论似乎不那么严厉了，反而有点困惑。虽然他仍然侮辱你的成就并嘲笑你的失败，但他似乎对你的努力感到很有趣。他明显的好心情并不一定更好……没有了他平时激烈的侮辱，你有点不确定你的进度如何。一箭射偏了，令你惊讶的是，凯尔特没有对你大喊大叫。相反，他爽朗地笑了起来。你满脸通红，有点尴尬地问你做错了什么。[pg]");
               outputText("[say: 这还不明显吗？]他居高临下地看着你，带着嘲讽的笑意问道。[say: 你的重心完全不稳。当然，如果我胸前也挂着几磅重的肥肉，我也会站不稳的。][pg]");
               outputText("你愤愤不平地用双手捂住胸部，让他严肃点。他又笑了起来，这次笑得更加刻薄。[pg]");
               outputText("[say: 我很严肃。女人当不了战士。长着奶子的更当不了战士。我只是觉得好笑。你，胸前挂着那两个大奶袋，居然还求我教你！][pg]");
               outputText("出乎你的意料，他突然向前倾身，拳头直奔你的头部而来。你举起双臂想要格挡，但他突然改变策略，一把抓住了你的一只[breasts]。你浑身一僵，还没来得及做出进一步反应，他就粗暴地揉捏起来，双手在你的乳房上肆虐。[pg]");
               if(get_player().biggestTitSize() <= 5)
               {
                  outputText("[say: 哈！就算你的奶子小得可怜，你也得承认这是一种……弱点，不是吗？真他妈敏感，对吧？哦，我是不是把小女孩弄湿了？调皮的荡妇！][pg]");
               }
               else if(get_player().biggestTitSize() <= 11)
               {
                  outputText("[say: 看看这两个大肉球！你想当弓箭手？我真惊讶你每次射箭的时候没打到自己的奶子！这么容易抓的目标。不过嘿，我打赌你喜欢这样。喜欢别人摸你这对肥奶子吗？][pg]");
               }
               else
               {
                  outputText("[say: 看看你！你简直是科学的奇迹……换作其他生物，拖着这两个大奶袋到处跑，背早就断了！说实话……你父母哪个其实是头母牛？][pg]");
               }
               outputText("尽管他的话语刻薄，但当他粗暴地揉捏你敏感的胸部时，你还是忍不住发出一声轻哼。凯尔特似乎很享受你的无助，他捏着、弹着你的[nipples]。[pg]");
               if(get_player().biggestLactation() > 1)
               {
                  outputText("不可避免地，你的乳尖渗出了乳汁，凯尔特发出一阵大笑。[pg]");
                  outputText("[say: 哎呀，好家伙！妈妈给大家带点心来了！那我就不客气了！][pg]");
                  outputText("他毫不犹豫地低下头，含住你肿胀的乳房，吸吮着乳头。他立刻得到了一股乳汁的奖赏，当半人马开始粗暴地吸吮你的奶子时，你舒服得发出轻声呜咽。他饥渴地吞咽着你甜美温暖的乳汁，你完全沉浸在释放的快感中，无力阻止他尽情享用。他的另一只手继续粗暴地揉捏你另一边无人看管的乳房，尽管你不想承认，但你能感觉到自己的欲望正在高涨。最后，凯尔特放开了你，带着傲慢的笑容擦了擦嘴。[pg]");
                  outputText("[say: 对于一头母牛来说，还不错。你看起来也很享受嘛。][pg]");
                  outputText("即使被放开，你的乳头依然在微微滴漏，乳汁羞耻地洒在地上，而凯尔特则继续揉捏着你的乳房。[pg]");
                  get_player().addStatusValue(StatusEffects.Feeder,1,1);
                  get_player().changeStatusValue(StatusEffects.Feeder,2,0);
               }
               outputText("[say: 听我的，婊子。认清你自己的位置。奶子是女人的，而女人就是用来操的，直到她们的肚子里塞满小马驹。“教我射箭吧，凯尔特！”哈！真是个笑话。][pg]");
               outputText("凯尔特最后一次用力弹了一下你挺立的乳头，然后大笑着走开了。");
               doNext(get_camp().returnToCampUseOneHour);
               get_player().addStatusValue(StatusEffects.Kelt,2,5);
               if(get_player().masteryLevel(MasteryLib.Bow) < 5)
               {
                  bowSkill(4);
               }
               else
               {
                  bowSkill(1);
               }
               return;
            }
            if(_loc1_ == 4)
            {
               get_images().showImage("kelt-archery-naked");
               outputText("然而，你今天所做的一切似乎都无法让你的导师满意。你犯的每一个错误他都会对你咆哮，每一次射偏他都会大发雷霆，即使你真的射中了，他也只是轻蔑地冷笑。虽然他对你的努力嗤之以鼻已经不是什么新鲜事了，但他今天似乎特别暴躁。");
               outputText("[pg]他咄咄逼人的态度开始让你分心，最后，你犯了一个巨大的错误。你的箭飞了出去，离目标十万八千里，而凯尔特突然出现在你身后。[pg]");
               outputText("[say: 你这个愚蠢的荡妇！]他咆哮着，带着漫不经心的轻蔑反手给了你一巴掌。你跌倒在地，虽然有些头晕但并没有受伤，听着他大声斥责。[say: 给我射中那该死的目标！[pg]这并不难，你这个肮脏的婊子！也许如果你不那么专注于挨操，你就能射中一箭！站起来……我叫你站起来，混蛋！][pg]");
               outputText("他咄咄逼人的态度让你猝不及防，你急忙站起来，在他的命令下，面对目标，微微颤抖。凯尔特从背后逼近你，粗暴地抓住你的头发。然后，他用另一只手粗鲁地将两根手指插进你的屁股。你发出一声惊呼，但凯尔特低吼一声，抓着你头发的手更紧了。[pg]");
               outputText("[say: 好了。这就是你他妈想要的吗，婊子？想要点好东西塞满你的屁股？感觉不错吧，嗯？我打赌你他妈做梦都想有一根又粗又大的鸡巴插进你的屁股。好吧，给你！现在被操了感觉好点了吗，荡妇？][pg]");
               outputText("他用手指向上提，凭借巨大的力量将你痛苦地提离地面。你扭动着，尽管自己不愿意，却还是被这突如其来的侵入激起了性欲。凯尔特低吼一声，将你放回地面并松开了你的头发。片刻之后，你的弓回到了手中……尽管凯尔特的手指依然没有抽出。[pg]");
               outputText("[say: 好了。既然我们的小母狗正在挨操，也许她会满足到能射中那该死的靶子。现在射箭……你敢再搞砸一次试试。][pg]");
               outputText("你呻吟着，心烦意乱又忐忑不安，急忙尽力瞄准。凯尔特的手指弯曲，迫使你站得更直。你瞄准时手臂在颤抖，能感觉到凯尔特灼热的呼吸喷洒在你的头发上，然后箭飞了出去！十米……五米……正中靶心！[pg]");
               outputText("伴随着一声冷哼，凯尔特将你推倒在地，同时抽出了手指。你痛苦地瑟缩着坐起身，半人马正居高临下地冷笑着盯着你。[pg]");
               outputText("[say: 今天的课到此为止。下次就是我的肉棒了，荡妇。][pg]");
               outputText("他一言不发地转身离开，带走了你仅存的一点尊严。");
               dynStats(DynStat.Lust(15));
               get_player().addStatusValue(StatusEffects.Kelt,2,5);
               if(get_player().masteryLevel(MasteryLib.Bow) < 5)
               {
                  bowSkill(4);
               }
               else
               {
                  bowSkill(1);
               }
               bowSkill(4);
               doNext(get_camp().returnToCampUseOneHour);
               return;
            }
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function keltMainEncounter2() : void
      {
         var _loc1_:Number = 0;
         if(!get_player().hasKeyItem("Bow"))
         {
            get_images().showImage("item-bow");
            outputText("[say: 拿着，]凯尔特说着，扔给你一把备用弓。[say: 你现在可以用这个。我们都是用它来训练小马驹的……你知道的，在他们的蛋蛋掉下来之前。应该刚好适合你的水平。想要的话就留着吧。][pg]");
            outputText("尽管他描述得充满嘲讽，但他给你的这把弓确实是一把不错的武器。你拿起它，走向练习场，凯尔特跟在后面。[pg]");
            if(!get_player().hasKeyItem("Bow"))
            {
               get_player().createKeyItem("Bow",0,0,0,0);
            }
         }
         else
         {
            outputText("凯尔特看着你的弓，冷笑道：[say: 你还在用那个破烂玩意儿？好吧，也凑合。我们只能射击近处的靶子了。][pg]");
            outputText("你们俩一起前往练习场。[pg]");
         }
         if(get_player().statusEffectv2(StatusEffects.Kelt) >= 60 && Utils.rand(4) == 0 && get_player().hasStatusEffect(StatusEffects.KeltBJ))
         {
            doNext(keltMainEncounterPostBlowjob);
            return;
         }
         doNext(keltMainEncounter3);
      }
      
      public function keltMainEncounter() : void
      {
         clearOutput();
         get_images().showImage("kelt-encounter");
         spriteSelect(SpriteDb.get_s_kelt());
         outputText("你再次在惠特尼的农场遇到了半人马凯尔特。他对着你坏笑，问是不是那个傻瓜又来向大师学习了。[pg]");
         if(get_player().statusEffectv2(StatusEffects.Kelt) <= 30)
         {
            outputText("你恼火地咬了咬牙，但还是咽下了自尊向他寻求帮助。");
         }
         else if(get_player().statusEffectv2(StatusEffects.Kelt) <= 70)
         {
            outputText("你勉强地点了点头，凯尔特咧嘴笑了。他可能很傲慢，但他的确很厉害。");
         }
         else
         {
            outputText("你热情地点头，几乎是在求他教你。");
         }
         if(get_player().statusEffectv3(StatusEffects.Kelt) <= 3)
         {
            outputText("凯尔特似乎觉得训练一个人类这件事近乎可笑，但他表示，你要是想跟着他转悠一阵子，他倒也无所谓。尽管他这副态度实在让人恼火，但你还是决心尽可能多学点东西。");
            doNext(keltMainEncounter2);
            return;
         }
         keltMainEncounterAfterNakedReq();
      }
      
      public function keltFirstTime() : void
      {
         outputText("当你靠近惠特尼的农场时，你注意到远处的牧场里有一个身影。令你惊讶的是，那似乎是一个骑着马的人……甚至可能是惠特尼本人。你没想到在这个被遗弃的国度里还能找到真正的马。如果你能想办法换到一匹，那绝对会帮上大忙。这个想法让你精神振奋，你跳过栅栏，向远处的那个身影走去。[pg]");
         get_images().showImage("kelt-encounter");
         outputText("然而，当你走近时，那个身影变得清晰起来。骑马的不是惠特尼，而是一个肌肉发达的男人。而且那匹马没有头……在它本该长着头的地方……你猛地一惊，意识到这根本不是什么马和骑手。那个身影是一个高大的雄性半人马！[pg]");
         outputText("你的警惕性越来越高，放慢了脚步。但已经太迟了……半人马已经看到了你。他打了个响鼻，向你飞奔而来，高大得令人望而生畏。你摆出战斗姿态，准备应对他可能的攻击，而半人马在离你几英尺远的地方停了下来。");
         outputText("[pg]他轻蔑地看着你，大笑起来，");
         outputText("[say: 别傻了。你根本连靠近我的机会都没有。如果我想杀你，你早就死了一百次了。我叫凯尔特。][pg]");
         outputText("他摸了摸挂在胸前的一把长弓。那把弓的尺寸足以让你信服。如果他能拉开那么粗的弓，他绝对有足够的力量从田野的另一端射中你。像这样的武器在抵御这片土地上的一些怪物时会非常有用。半人马注意到你在看，傲慢地咧嘴笑了。[pg]");
         outputText("[say: 喜欢我的弓吗？你当然应该喜欢。这才是真正战士的武器！如果你哪天想学，再来找我吧。也许如果你不是太蠢的话，还能学到点什么。不过我可不抱太大希望。][pg]");
         outputText("他又嘲弄地笑了起来，小跑着离开了。你微微有些恼火……他傲慢得让人讨厌。但如果他能教你使用那样的武器，忍受他的陪伴也许是值得的……");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function keltEncounter() : void
      {
         spriteSelect(SpriteDb.get_s_kelt());
         clearOutput();
         if(!get_player().hasStatusEffect(StatusEffects.Kelt))
         {
            get_player().createStatusEffect(StatusEffects.Kelt,0,0,0,0);
         }
         get_player().addStatusValue(StatusEffects.Kelt,3,1);
         if(get_player().statusEffectv3(StatusEffects.Kelt) <= 1)
         {
            keltFirstTime();
         }
         else
         {
            if(get_player().statusEffectv3(StatusEffects.Kelt) <= 3)
            {
               keltMainEncounter();
               return;
            }
            if(get_player().statusEffectv2(StatusEffects.Kelt) >= 130)
            {
               if(get_player().lib + get_player().get_lust() < 30 && get_player().get_inte() >= 50 || !get_player().hasStatusEffect(StatusEffects.KeltBadEndWarning))
               {
                  get_player().createStatusEffect(StatusEffects.KeltBadEndWarning,0,0,0,0);
                  get_images().showImage("kelt-dream");
                  outputText("你向农场飞奔而去，脑海中只有一个念头。凯尔特……你的主人，你的爱人，你的渴望。你满脑子都是他的肉棒，幻想着他今天会怎么用它来操你。曾经，你似乎有什么任务……一项重要的职责。然而，这个游离的念头几乎瞬间就消失了。你当然有职责！那就是随时随地被凯尔特操！[pg]");
                  outputText("突然，另一个念头闪过你的脑海。你有一种预感，如果去见他，这可能就是你冒险的终点。你是要屈服于自己的念头，最后一次向凯尔特臣服，还是选择反抗？");
                  doYesNo(keltSubmissiveBadEnd,defySubmission);
                  addButton(4,"战斗！",defySubmissionAndFight);
               }
               else
               {
                  keltSubmissiveBadEnd();
               }
               return;
            }
            if(get_player().isTaur() && get_player().statusEffectv2(StatusEffects.Kelt) >= 100 && get_player().get_gender() > 1)
            {
               if(get_player().get_inte() > Utils.rand(40) && get_player().statusEffectv2(StatusEffects.Kelt) < 130 && !get_player().hasStatusEffect(StatusEffects.KeltBadEndWarning))
               {
                  get_player().createStatusEffect(StatusEffects.KeltBadEndWarning,0,0,0,0);
                  clearOutput();
                  get_images().showImage("kelt-dream");
                  outputText("你靠近农场，准备接受另一次射箭课程。凯尔特并没有注意到你的存在，他正忙着用自己的弓练习。风向变了，把他的麝香味吹向了你。你不自觉地深吸了一口气，一股热流在你的后腿间奔涌。当意识到他的存在对你产生了什么影响时，你脑海中警铃大作，赶在他发现你之前跑回了营地。很明显，你已经无法再抵抗他多久了；下次再见到他，你很可能会主动要求成为他的繁育母马。也许你应该避开凯尔特和农场，直到你觉得他对你的影响减弱为止。");
                  dynStats(DynStat.Lust(get_player().lib / 5 + 10));
                  doNext(get_camp().returnToCampUseOneHour);
               }
               else
               {
                  keltCentaurBadEnd();
               }
               return;
            }
            if(get_player().statusEffectv3(StatusEffects.Kelt) == 4 && !get_player().hasStatusEffect(StatusEffects.NakedOn))
            {
               keltRequiresNakedness();
               return;
            }
            if(get_player().statusEffectv2(StatusEffects.Kelt) >= 40 && !get_player().hasStatusEffect(StatusEffects.KeltBJ))
            {
               keltRequiresBlowjobs();
               return;
            }
            if(get_player().statusEffectv3(StatusEffects.Kelt) > 4)
            {
               keltMainEncounter();
            }
         }
      }
      
      public function keltEagerlyGetNaked() : void
      {
         doNext(get_camp().returnToCampUseOneHour);
         spriteSelect(SpriteDb.get_s_kelt());
         clearOutput();
         outputText("你在凯尔特面前" + get_player().clothedOrNaked("脱光衣服","赤身裸体") + "毫无压力，甚至还有点享受这个过程。从他色眯眯的眼神来看，凯尔特也很享受。他似乎更因为他对你的控制力而兴奋……你发现自己承认，你也有点被这激起了性欲。[pg]");
         outputText("你" + get_player().clothedOrNaked("先脱掉上衣，慢慢露出你的" + get_player().allBreastsDescript(),"炫耀你的" + get_player().allBreastsDescript()) + "。凯尔特在你周围踱步，眼睛饥渴地盯着你的胸部。当你让上衣掉到地上时，他却嘲讽地笑了起来，");
         if(get_player().get_gender() == 1 && get_player().biggestTitSize() < 1)
         {
            outputText("[say: 你是个娘们吗？快点，让我看看我到底在面对什么。][pg]");
         }
         else if(get_player().biggestTitSize() == 0)
         {
            outputText("[say: 哎呀！我还以为能在你身上找到一对奶子呢，看来是我眼花。没关系……我信你总有一天会发育的！][pg]");
         }
         else if(get_player().biggestTitSize() <= 5)
         {
            outputText("[say: 哈！难怪你跟那些怂包人类一样裹得严严实实！随便哪个半人马姑娘，要是胸口只挂着" + Utils.num2Text(get_player().totalBreasts()) + "个蚊子叮的包就出门，都得羞得不敢见人！你老家那帮人管你叫什么来着……\'小咪咪\'？还是他们都直接把你当男的算了！][pg]");
         }
         else if(get_player().biggestTitSize() <= 11)
         {
            outputText("[say: 哎哟，男孩们……当心点！这位“巨乳小姐”最近好像长了点肉啊！像你这样的人是怎么当上冒险者的？腰部以上，你除了卖淫什么也干不了！][pg]");
         }
         else
         {
            outputText("[say: 哦哟，这看着可真馋人呐！老实说……你真想学射箭？你每放一箭，弓弦都得弹到你那对奶子上！嘿嘿……我看你就好这口吧！该转行了，小骚货，当个奶妈或者奶牛得了……你也就配干这两样了！][pg]");
         }
         outputText("尽管他的话语尖酸刻薄，但你能看到凯尔特眼中的欲望，他那嘲弄的笑声让你感到有些兴奋。当你继续动作时，他的批评变得更加下流。" + get_player().clothedOrNaked("当你脱下下半身的衣服，变得一丝不挂时","当你挺起骨盆，慢慢转过身时") + "，他盯着你的屁股，发出一声粗鲁的、充满轻蔑的欢呼，");
         if(get_player().butt.rating < 6)
         {
            outputText("[say: 哟呵，看来还真练过！这小屁股又翘又紧，不错嘛！就是……大概紧过头了吧？没关系，跟哥说实话……那些又丑又老的怪物操你这可怜巴巴的小屁股时，疼不疼啊？哈哈！][pg]");
         }
         else if(get_player().butt.rating < 13)
         {
            outputText("[say: 嘿，你这后面的小肉垫可真不赖！成天坐着才攒出来的吧？不对，肯定不是。我猜你这小宝贝平时没少被操练……不过说真的，多挨几顿肏可代替不了正经运动，明白不！][pg]");
         }
         else
         {
            outputText("[say: 这屁股，我他妈真想怼上去！明明自称英雄，身材却跟个泄欲玩具似的！你这屁股让我想起我上次上的那个妞……当然啦，她可是匹母马！][pg]");
         }
         outputText("他张开手掌拍了拍你的屁股，顺便狠狠地摸了一把。他身上野兽般的麝香味钻进你的鼻孔，让你感到头晕目眩，甚至有些兴奋。他咧嘴大笑，然后绕到你面前，");
         if(get_player().totalCocks() == 0)
         {
            outputText("[say: 哎呀，你可真是个漂亮的小东西，浑身上下都是。你和我一定会相处得很愉快的，那是肯定的！][pg]");
         }
         else
         {
            outputText("几乎不可避免地，他的目光落在了你的[cock]上。他哼了一声，");
            if(get_player().cocks[0].get_cockType() == CockTypesEnum.HUMAN)
            {
               outputText("[saystart]呵。只是个普通型号，是吧？你知道这里有句话……像人类一样大！相信我……这可不是什么恭维的话。");
            }
            else if(Boolean([CockTypesEnum.DOG,CockTypesEnum.WOLF].contains(get_player().cocks[0].get_cockType())))
            {
               outputText("[saystart]哦，快看啊！我们这儿有根小狗屌！好吧，不管你长没长鸡巴，你在我眼里永远是个小母狗，杂种。");
            }
            else if(get_player().cocks[0].get_cockType() == CockTypesEnum.HORSE)
            {
               outputText("[saystart]那可真是太可悲了。有点嫉妒我了，是吧？非得自己跑出去弄根漂亮的马鸡巴？你早该问我的。我本来可以让你尝尝我的！");
            }
            else if(get_player().cocks[0].get_cockType().get_Index() >= 3)
            {
               outputText("[saystart]哈！我倒要问问……你他妈到底是个什么东西？那是根鸡巴，还是条长错地方的丑陋尾巴？哈！");
            }
            if(get_player().cocks[0].cockLength <= 10)
            {
               outputText("所以，当你用那玩意儿捅女人的时候，她能感觉到吗？还是说你得提醒她什么时候开始装高潮？[sayend][pg]");
            }
            else if(get_player().cocks[0].cockLength <= 20)
            {
               outputText("不过，至少你的鸡巴尺寸还算过得去。你知道的，对于一匹小马驹来说。也许你运气好，真正的女人会可怜可怜你！[sayend][pg]");
            }
            else
            {
               outputText("要是他们能想个办法，让你别走两步就踩到自己的鸡巴，也许你就能算个真正的男人了！都长成这样了，你还能硬得起来吗？还是说硬起来会让你失去平衡摔倒？哈！[sayend][pg]");
            }
         }
         outputText("他最后打量了你一番，居高临下地冷笑了一声。[say: 好吧，作为英雄来说，你这也不算什么。但总比没有好。行吧，我会再教你一些东西。但我不想再看到那些该死的衣服了。你得按我说的去学，明白吗？][pg]");
         outputText("你点点头，几乎有些感激能有借口光着身子。从凯尔特盯着你屁股的眼神来看，你觉得他也会喜欢的。[pg]");
         get_player().createStatusEffect(StatusEffects.NakedOn,0,0,0,0);
         get_player().addStatusValue(StatusEffects.Kelt,2,10);
         dynStats(DynStat.Lust(int(get_player().lib / 10) + 5));
         doNext(keltMainEncounter2);
      }
      
      public function keltCentaurBadEnd() : void
      {
         spriteSelect(SpriteDb.get_s_kelt());
         clearOutput();
         outputText("你小跑着走向农场，对你这强壮的半人马形态的移动方式感到满意。你脑海中只有一个念头……向凯尔特炫耀，报复他之前对你的那些侮辱。在经历了这一切之后，听到他赞美你这与他如此相似的新马形态，应该会非常令人满足。一个奇怪的念头闪过你的脑海，也许他会做的不仅仅是赞美，一阵快感不由自主地传遍全身。[pg]");
         outputText("一旦你在地平线上发现他，你便向前冲去，全速疾驰，心跳加速。想要靠近他、再次闻到他气味的渴望突然变得势不可挡……吞噬了一切。当你靠近时，你放慢了脚步，想要品味他看到你时的表情。他似乎只惊讶了一瞬间，然后便露出了阴暗的笑容。慢慢地，他向你走来。[pg]");
         outputText("[say: 所以……只是想尝尝这是什么感觉，对吧？很好……我喜欢你这样。是的……这正合我意。][pg]");
         outputText("他围着你踱步，你立正站好，因为他的赞美而兴奋得发抖。你不由自主地感觉到你那像马一样的尾巴高高翘起，仿佛在炫耀你的下体。凯尔特花了一点时间检查它们，显然很享受。[pg]");
         if(get_player().get_gender() == 1)
         {
            outputText("[say: 哼。技术上来说还是个男的，是吧？什么，你管这叫肉棒？][pg]");
            outputText("他粗暴地抓住你的胯部，让你发出一声轻微的嘶鸣。然而，很难分辨那是出于痛苦还是快乐。你感到一种奇怪的、矛盾的情绪……主要是一种想要和凯尔特在一起、取悦凯尔特、操凯尔特的渴望……这种紧迫感让你感到惊讶。更令人惊讶的是，你的肉棒完全是软的。[pg]");
            outputText("[say: 好吧，我对男人没用，荡妇。幸运的是，在此期间你还有我能用的东西。][pg]");
            outputText("他的腿突然抬起，缠绕在你身体的躯干上。你发出一声惊恐的抗议，但没有动……你的身体不让你动。事实上，如果有什么不同的话，那就是你向后推他，渴望并准备好了。事实上，你的一部分是快乐的。你想要的不是操凯尔特！");
            outputText("<b>……而是让他操你！</b>[pg]");
            get_images().showImage("kelt-lost-male");
            outputText("凯尔特毫不犹豫地宣示了他的统治地位，立即将他的肉棒推向你的屁股，轻松地插了进去。你发出一声近乎野性的欢呼，凯尔特恶毒地笑着，他抓得更紧，将勃起的肉棒插得更深，在你的后躯上急切地抽插着。他人类的双手环绕着你，抓住你的下巴，强迫你转过身来面对他，同时他品味着你痛苦的呻吟。[pg]");
            outputText("[say: 果然不出我所料，]他冷笑着，特别用力地抽插，让你因渴望而呜咽。[say: 你不是什么种马。只是另一个阉马，渴望成为一个真正的女人。好吧，我正好需要另一个精液垃圾桶，荡妇。所以把这当作你的入会仪式吧。你现在是我的了，我想什么时候用就什么时候用。希望你喜欢我肉棒的感觉，婊子。在很长一段时间里，这将是你唯一能感觉到的东西。][pg]");
            outputText("他再次无情地抽插，完全填满了你的[asshole]，同时他无情地咆哮着，在你体内深处用力射精。你的肉棒一直保持疲软……很明显在这种情况下谁才是雄性。当他滚烫的精液泵入你被虐待的屁股时，你最后的抵抗崩溃了，你像发情的母马一样呻吟，渴望更多。凯尔特满足了你，从未软下来，并准备向他最新的后宫成员输送第二发。一次又一次，你乞求他给你更多，毫无遗憾地拥抱你的新生活。[pg]");
         }
         if(get_player().get_gender() == 0)
         {
            outputText("[say: 哈！你他妈的到底是个什么东西？没鸡巴，没小穴？好吧，没关系，婊子。你还有我想要的东西。][pg]");
            outputText("他粗暴地将几根手指塞进你的屁股，让你发出一声轻微的嘶鸣。然而，很难分辨那是出于痛苦还是快乐。你感到一种奇怪的、矛盾的情绪……主要是一种想要和凯尔特在一起、取悦凯尔特、操凯尔特的渴望……这种紧迫感让你感到惊讶。但是怎么操……用什么操？[pg]");
            outputText("[say: 好吧，男人还是女人，对我来说都无所谓。你还是只有一种用处。是时候给你一个目标了，荡妇。][pg]");
            outputText("他的腿突然抬起，缠绕在你身体的躯干上。你发出一声惊恐的抗议，但没有动……你的身体不让你动。事实上，如果有什么不同的话，那就是你向后推他，渴望并准备好了。事实上，你的一部分是快乐的。你想要的不是操凯尔特！");
            outputText("<b>……而是让他操你！</b>[pg]");
            get_images().showImage("kelt-lost-male");
            outputText("凯尔特毫不犹豫地宣示了他的统治地位，立即将他的肉棒推向你的屁股，轻松地插了进去。你发出一声近乎野性的欢呼，凯尔特恶毒地笑着，他抓得更紧，将勃起的肉棒插得更深，在你的后躯上急切地抽插着。他人类的双手环绕着你，抓住你的下巴，强迫你转过身来面对他，同时他品味着你痛苦的呻吟。[pg]");
            outputText("[say: 果然不出我所料，]他冷笑着，特别用力地抽插，让你因渴望而呜咽。[say: 你不是什么种马。只是另一个阉马，渴望成为一个真正的女人。好吧，我正好需要另一个精液垃圾桶，荡妇。所以把这当作你的入会仪式吧。你现在是我的了，我想什么时候用就什么时候用。希望你喜欢我肉棒的感觉，婊子。在很长一段时间里，这将是你唯一能感觉到的东西。][pg]");
            outputText("他再次无情地抽插，完全填满了你的屁股，同时他无情地咆哮着，在你体内深处用力射精。被这样使用，找到了你的目标，这让你充满了一种强烈的、无法言喻的快乐！当他滚烫的精液泵入你被虐待的屁股时，你最后的抵抗崩溃了，你像发情的母马一样呻吟，渴望更多。凯尔特满足了你，从未软下来，并准备向他最新的后宫成员输送第二发。一次又一次，你乞求他给你更多，毫无遗憾地拥抱你的新生活。");
         }
         if(get_player().get_gender() >= 2)
         {
            if(get_player().get_gender() == 3)
            {
               clearOutput();
               outputText("[say: 噢，这小骚货还带着家伙呢？告诉我，这根肉棒对你来说好用吗？][pg]");
               outputText("当然不好用。一点也不……你完全软趴趴的，而凯尔特也知道这一点。他粗暴地抓住你肉棒的根部，试探性地拽了几下，同时嘲弄地大笑。你没有任何反应……除了你的小穴变得更湿了。[pg]");
               outputText("[say: 算了，没关系。这才是我的目标。][pg]");
            }
            outputText("凯尔特粗鲁地将三根手指插进你暴露的小穴，让你发出一声轻微的嘶鸣。他暗自发笑，然后插进四根手指……接着是整个拳头。你呜咽呻吟着，无法控制自己离开。他试探性地抽插了一会儿，享受着轻易解除你武装的快感。你发情又饥渴，就算想阻止他也做不到。[pg]");
            outputText("[say: 哎呀……我们这儿确实有匹漂亮的小母马，不是吗？不过，小母马只有被操的时候才会真正开心。除非她的肚子里怀满了主人的小马驹。既然你费尽心思为我做好了准备，婊子……我想我只能勉为其难了。][pg]");
            outputText("他的双腿突然扬起，缠绕住你圆筒般的身躯。你发出一声惊恐的抗议，但并没有动弹……你的身体不允许你这么做。事实上，你反而向后迎合他，急不可耐。你的小穴焦急地流着淫水，准备迎接他，准备被播下他的种。其实，你的一部分内心是狂喜的。你想要的根本不是操凯尔特！");
            outputText("<b>……而是让他操你！</b>[pg]");
            get_images().showImage("kelt-lost-female");
            outputText("凯尔特毫不犹豫地确立了他的统治地位，立刻向前挺进肉棒，找准目标，瞬间撑开你饥渴的入口。你发出一声野性的欢愉尖叫，凯尔特恶毒地笑着，抓得更紧，将勃起的肉棒插得更深，在你后臀上饥渴地抽插着。他人类的双手环抱住你，捏住你的下巴，强迫你转过头面对他，同时品味着你痛苦的呻吟。[pg]");
            outputText("[say: 果然不出我所料，]他冷笑着，抽插得格外用力，让你饥渴地呜咽。[say: 射箭……真是个笑话！用来配种的骚货可不射箭。她们只会被操到怀孕，然后再被操。只要我一声令下，她们就会跪下来给我口交，肚子里怀满我的种。好吧，我正好缺个精液垃圾桶，骚货。就把这当成你的入会仪式吧。你现在是我的了，我想什么时候用就什么时候用。希望你喜欢我肉棒的感觉，婊子。很长一段时间内，这将是你唯一能感觉到的东西。][pg]");
            outputText("他再次无情地挺进，将整根肉棒埋入你的体内，同时无情地咆哮着，在你体内深处猛烈地射精。你感觉到他的温热在你体内爆发，寻找着你肥沃的卵子，准备让你怀上主人的小马驹，而你自己也高潮了。当他滚烫的精液泵入你的子宫时，你最后的抵抗也土崩瓦解，你像发情的母马一样呻吟着，祈祷能怀上双胞胎。凯尔特毫不疲软，继续急促地抽插，准备向他最新的后宫成员注入第二发。你一次又一次地乞求他给你更多，毫无遗憾地拥抱你的新生活。");
         }
         doNext(keltBadEndEpilogue);
      }
      
      public function keltBlowjobRequirementShamefully(param1:Boolean = true) : void
      {
         spriteSelect(SpriteDb.get_s_kelt());
         if(param1)
         {
            clearOutput();
         }
         get_player().slimeFeed();
         outputText("一想到要把它做完就令人毛骨悚然。一想到不把嘴唇裹在那根光荣的阴茎上，同样令人无法想象。[pg]");
         outputText("你脸上满是欲望和羞耻交织的红晕，你犹犹豫豫地伸出手，握住了那根正在膨胀的肉棒，感受着它惊人的热度。凯尔特发出一声满足的呻吟，胯部不由自主地向前一挺。他那根巨屌顶端伞状张开的龟头淫荡地滴着前液，你又犹豫了一下，内心无比挣扎。但手心传来的肉棒的温度告诉你，已经没有回头路了。[pg]");
         outputText("你俯身向前，怯生生地用舌尖轻舔那龟头，尝到了他前液的味道。那咸腥黏滑的汁液让你的感官如烈火般燃烧，饥渴难耐……你可曾尝过如此美妙的东西？一舔之后便是第二下、第三下，很快，你就张大双唇将那肿胀的龟头含了进去，迫不及待地想要吮吸干净每一滴汁液。[pg]");
         outputText("那巨屌的龟头勉强塞进了你的双唇之间，下巴被撑得咯咯作响，但这一切都值了——你的口腔里充满了凯尔特精种的味道。你几乎是饥渴地吮吸着它，当一股热液喷溅在你的喉咙上时，你不由得一颤。想到自己在做什么如此粗鄙的事，确实令人痛苦，但你无法抗拒人马精液那股滚烫滋味带来的快感。它就像是对你彻底抛弃自尊的奖赏。[pg]");
         outputText("凯尔特没给你多少时间哀悼失去的自尊。他一只蹄子不安分地刨着地面，兽性十足，胯部再次向前猛顶。伞状的龟头强硬地撞进你的喉咙深处，你不由得干呕了一下。为了让这个急不可耐的施暴者好受些，你一边吮吸着龟头，一边用双手套弄起他那根肉棒的茎身。他的下腹因快感微微发颤，而你因为取悦了他，心底竟也泛起一阵羞耻的愉悦。[pg]");
         outputText("[say: 嗯……我从第一眼看到你就知道了。你真是个天赋异禀的小骚货，口活一流。再深点，贱货。我要你被我的精液呛到。][pg]");
         outputText("你竭力无视那些残忍的字眼，尽管身体的某个角落竟因快感而微微颤抖。尽管这一切如此羞辱下贱，但取悦这头强大的生物却让你心中涌起一种奇异的幸福。你把嘴张得更大，俯身向前，努力把那根伟岸的肉棒吞得更深。你的老师以一次胯部的猛顶回应了你，龟头粗暴地挤进了你喉咙的最深处。你被噎得喘不过气，喉咙被撑得生疼，但凯尔特发出一声满足的呻吟，稳定地抽送着胯部，试图把更多的肉棒塞进你的食道。[pg]");
         get_images().showImage("kelt-farm-shamefulbj");
         outputText("[say: 啊啊，对……操，贱货，你这张嘴可真够舒服的。我会上瘾的。你呢，嗯？喜欢我鸡巴的味道吗，小婊子？][pg]");
         outputText("承认这一点很痛苦，但你确实喜欢。那味道美妙绝伦，时不时就有一股滚烫的前液滑入你的喉咙。他那两颗沉甸甸的睾丸，每颗都有哈密瓜那么大，在你眼前诱人地晃来晃去。你想象着那对精囊里蓄满了多少存货，酝酿着一股又一股的精浆，全是为你准备的；随时准备爆发，把你的肚子灌满他的浓精。你最后的防线崩溃了，你加倍卖力，拼命想要给伟大的主人带来解脱。[pg]");
         outputText("你的勤奋很快得到了回报。随着一声充满欲望的低吼，凯尔特最后一次猛顶，将他那近三英尺长的巨物几乎一半都深深埋进了你的喉咙——肉棒猛地绷紧，然后爆发了。你整个人都僵住了，被那根巨屌劈开一般，任由它开始往你胃里直直灌入一股股浓稠滚烫的咸腥奶油。你的喉咙被撑得太紧了，能清清楚楚感觉到每一波精液顺着那根勃起的肉棒脉动喷射，一波接一波，无休无止。片刻之后你的胃已经鼓胀起来，但他的高潮仍在继续，你的肚子每隔一会儿就明显隆起一次，又一股精种被深深种入你体内。[pg]");
         outputText("等到他终于射完，最后几波喷射几乎让你那可怜胀大的胃袋疼痛难忍，隔着衣服都能看到腹部明显隆起的弧度。随着人马的那根肉棒软下来，它轻易地从你饱受摧残的喉咙里滑出，茎身上裹着一层黏腻的浊液。解脱之后，你瘫软跪倒在地，一边咳嗽一边感受着那巨量精液在你胃里沉淀下来。嘴里残留的唯一味道，就是凯尔特肉棒上的麝香气味，以及随之而来的咸腥浓精。");
         get_player().refillHunger(50);
         outputText("[pg]凯尔特挪到一旁，居高临下地看着你，一脸志得意满的满足。你虚弱地朝他摆摆手，为自己刚才的所作所为感到羞耻难当，而他则恶劣地大笑起来。[pg]");
         outputText("[say: 习惯就好，贱货。不得不说，你吞得还挺好。几乎一滴都没浪费。很好。因为要是你敢把我的精液吐出来，我就得确保再补一发了。][pg]");
         outputText("[say: 规矩是这样的。你想要射箭课？行。我会继续教你，虽然你就是个蠢货。但只要我开口，你就得跪下，尽你的本分。要我教一个像你这样的丑婊子，你至少得吞一发。下课了。明天见，贱货。][pg]");
         outputText("他走了，显然对自己相当满意。而你筋疲力尽地躺在一小滩他的精液里。那股气味紧紧附着在你身上，即使你强撑着站起身、双臂抱着鼓胀的肚子一瘸一拐地走回营地，那味道依然挥之不去。你的一部分感到无比羞辱，再也不想见到凯尔特。而另一部分呢？嗯，那一部分正迫不及待地盼着，盼他下次再欲火焚身，再给你一次吮吸他肉棒的机会。[pg]");
         outputText("一次又一次地去找他，也许不太健康。当然，你总可以说不的，对吧？他是个好老师。而且……而且再多给他口几次，又有什么大不了的呢？不会那么糟糕的……对吧？[pg]");
         get_player().orgasm("Lips",false);
         get_player().addStatusValue(StatusEffects.Kelt,2,7);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function keltBlowjobRequirementNever(param1:Boolean = true) : void
      {
         spriteSelect(SpriteDb.get_s_kelt());
         if(param1)
         {
            clearOutput();
         }
         get_images().showImage("kelt-encounter");
         outputText("你挣扎着，试图抓住你支离破碎的思绪。凯尔特的气味，或者说他的存在，让人无法抗拒。屈服的诱惑几乎压倒了一切，但你咬紧牙关，闭上眼睛，拼命试图无视你狂跳的心脏。[pg]");
         outputText("凯尔特的脚步显得有些迟疑，蹄子在地上刨着，重新站稳。他似乎有一瞬间的困惑，臀部试探性地向前挺动。当没有进一步的感觉时，他的困惑开始被愤怒所取代。[pg]");
         outputText("他花了几分钟时间咒骂你，肿胀的肉棒仍然时不时地向前抽动，仿佛期待你随时会含住它。这个半人马显然不习惯被拒绝。当他残酷的话语羞辱你时，诱惑比以往任何时候都更加强烈。直接屈服难道不是更容易吗？给这个强大的雄性他想要的，这样他就会再次喜欢你？那根肉棒在触手可及的地方戏弄地盘旋着，只等着给你一个美妙的品尝……但你与这种异样的冲动抗争着，紧闭着嘴。[pg]");
         outputText("你只有片刻的反应时间，因为气氛突然变了。一直在愤怒地跺脚和咒骂的凯尔特，决定了一个新的目标。你回想起训练的内容，向侧面翻滚，就在凯尔特扬起前蹄，踩在你刚才头部所在的位置时。[pg]");
         outputText("凯尔特向你走来，眼中闪烁着怒火，你本能地蹲下身子。即便如此，当凯尔特愤怒地向你猛击时，你的脸还是挨了重重的一击。你手忙脚乱地防守，但这次攻击，或者说所谓的攻击，刚开始就结束了。这个暴虐的半人马已经转身离开，每一步都明显带着挫败感。[pg]");
         outputText("[say: 蠢货。拒绝我，哈？拒绝我？去你妈的，还有你那双走过来的[legs]！你想射箭，自己去学吧！更好的主意是……去他妈的沙漠，找个恶魔，然后他妈的求他让你做他的屁股奴隶。去吧！滚开，荡妇！][pg]");
         outputText("他的话比你想象的还要伤人，你转过身，落荒而逃。凯尔特在你跑的时候继续对你破口大骂，但没有追上来。你的头晕乎乎的，很困惑。你真的想向他这样的怪物屈服吗？他对你做了什么？不管怎样，很明显你在这里不再受欢迎了。这个想法让你充满了那种同样奇怪的渴望，以及一种想要爬回去，像个好奴隶一样，虔诚地把那根光荣的肉棒含进嘴里的冲动。[pg]");
         outputText("但这种感觉现在变弱了。无论是什么让你被他束缚，现在似乎都在消退，尽管很慢。即便如此，一阵欲望的颤栗还是传遍了你的全身。这可能需要很长时间才能恢复。[pg]");
         get_player().createStatusEffect(StatusEffects.KeltOff,0,0,0,0);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function keltBlowjobRequirementEagerly(param1:Boolean = true) : void
      {
         spriteSelect(SpriteDb.get_s_kelt());
         if(param1)
         {
            clearOutput();
         }
         get_player().slimeFeed();
         outputText("就像有人回应了你的祈祷一样。你急切地答应了，面对着那根越来越硬的巨大肉棒，你语无伦次地向凯尔特道谢。他轻蔑地哼了一声。[pg]");
         outputText("[say: 我没让你道谢，荡妇，]他残忍地说。[say: 我是让你吸我的鸡巴。现在张大嘴吞下去，不然我就操你的屁股。][pg]");
         outputText("这个想法让你又是一阵愉悦的颤栗，但你还是立刻服从了凯尔特的命令。也许如果你做得足够好，他也会操你的屁股……？你兴奋得满脸通红，伸出手握住那根不断胀大的肉棒，感受着它奇妙的热度。凯尔特发出一声满足的呻吟，他的臀部不由自主地向前挺动。他那巨大肉棒膨大的龟头淫荡地滴下先列腺液，你立刻倾身向前，饥渴地舔舐着。浪费哪怕一滴都是没有道理的！[pg]");
         outputText("那咸咸的、黏稠的汁液点燃了你渴望的感官……你尝过这么美妙的东西吗？尝了第二口就想尝第三口、第四口，很快，你就把嘴唇张得大大的，吸入那肿胀的龟头，企图吸干你能吸到的每一滴。巨大肉棒的龟头勉强能塞进你的嘴唇，但当你的嘴里充满凯尔特精液的味道时，下巴的酸痛也是值得的。[pg]");
         outputText("你几乎是饥渴地吮吸着它，当你感觉到一股精液喷在你的喉咙上时，你几乎要融化在快感中了。能在这里被凯尔特使用，感觉是如此正确。他会选择你来卸下他那天堂般的精液……这就是你一生所求。如果你余生都在吞咽他多余的精液，你会很幸福的。[pg]");
         outputText("凯尔特没有给你太多时间来回味你的满足感。他的一只蹄子焦躁地在地上刨着，像野兽一样，再次将臀部向前推。当膨大的龟头坚持不懈地撞击你的喉咙深处时，你微微干呕。你明白他的需求必须放在首位，于是你开始用手套弄他的肉棒，同时试图将更多肉棒吸进嘴里。他的下腹部因快感而微微颤抖，你感到一丝自豪……他很享受！[pg]");
         outputText("[say: 嗯……我从第一眼看到你就知道了。你真是个天赋异禀的小骚货，口活一流。再深点，贱货。我要你被我的精液呛到。][pg]");
         outputText("他侮辱性的话语让你内心涌起一种根深蒂固的幸福感。你以前怎么会不知道呢？你以为自己是个英雄，是个勇者……但这才是正确的感觉。一个淫荡的、吸鸡巴的婊子……这才是你注定要成为的样子！你张得更大，身体前倾，试图吸入更多这根光荣的肉棒。你的主人配合着挺动臀部，他的龟头粗暴地推进你喉咙的深处。你为了呼吸而干呕，因为喉咙被撑开而皱眉，但凯尔特发出一声满足的呻吟，稳定地抽插着臀部，试图将更多的肉棒埋进你的食道。[pg]");
         get_images().showImage("kelt-farm-eagerbj");
         outputText("[say: 啊啊，对……操，贱货，你这张嘴可真够舒服的。我会上瘾的。你呢，嗯？喜欢我鸡巴的味道吗，小婊子？][pg]");
         outputText("你几乎听不到他的话，你的感官被彻底点燃了。他的鸡巴尝起来棒极了，每隔一会儿，就有一小股滚烫的先列腺液滑下你的喉咙。他那沉甸甸的睾丸，每一个都有哈密瓜那么大，在他身下诱人地来回摇晃，就在你眼前。你想象着那些蛋蛋有多满，专为你积聚着一波又一波的精液；准备爆发，用他的精液灌满你的肚子。你最后一点自我价值也崩溃了，你加倍努力，拼命想给你的伟大主人带来释放；不惜一切代价，拼命想被操。[pg]");
         outputText("你的卖力很快就得到了回报。凯尔特闷哼一声，猛地向前最后一挺，把那根将近三尺长的巨物差不多一半都狠狠埋进了你的喉咙深处，紧接着他的肉棒绷紧到极限，然后轰然爆发。你整个人被极致的快感冲得浑身麻痹，被这根巨物活活劈开——浓稠滚烫的咸腥浓浆开始一浪接一浪地往你胃袋深处狂灌。你的喉咙被撑得严严实实，紧得你能清清楚楚地感受到每一股精液沿着他勃发的柱身一抽一抽地喷涌而出，一下又一下，没完没了。没一会儿你的肚子就已经胀成了个球，可他的高潮还在继续，你的小腹每隔几秒就随着又一股浓浆灌入而肉眼可见地鼓胀起来。");
         get_player().refillHunger(50);
         outputText("[pg]等他终于发泄完，最后那几股喷射几乎让你那被撑得惨不忍睹的可怜肚子都隐隐作痛，隔着衣服都能看见腹部被撑得鼓了出来。随着半人马的肉棒渐渐软下去，那根东西开始从你那被蹂躏得不像样的喉咙里缓缓滑出来，黏糊糊的浊液在柱身上拖出一道亮晶晶的痕迹。尽管肚子已经胀得不行，你还是想要更多，贪得无厌地吮吸着那根长枪，拼命想榨干每一滴。此刻你嘴里已经尝不出别的味道，只剩下凯尔特肉棒上那股浓烈的麝香味儿，以及随之而来的、咸腥的浓精。");
         outputText("过了一会儿，凯尔特挪开了身子，你顺着他的沉默意愿松开了他的鸡巴，心里一阵沮丧。要是你能再快一点，再骚一点……说不定他就能重新硬起来，给你更多了！即便如此，他低头看着你的神情里带着一抹得意洋洋的餍足，倒也让你的心底生出几分诡异的满足。你虚弱地撑起身子，小心翼翼地绕过鼓胀的肚子，把屁股高高撅起，回头用充满希冀的眼神望着他。凯尔特放声大笑，笑声里满是残忍和恶意。");
         outputText("[say:还发骚呢，母狗？哈！我早看出你是个荡妇，但谁想到你能骚成这样？给我坐下，蠢母狗。什么时候操你，我说了算，轮不到你来求。不过这次倒也不算太差。就你这种丑婊子，好歹当个精壶还挺称职。所以要是你还想多上几堂课，规矩听好了。在你射出哪怕一发子弹之前，先给我吞下一泡精液。既然非得跟一个彻头彻尾的骚货搭档，那我至少得看着你的肚子被我的精液灌满。听明白了没，烂货？下次想开枪，先跪下来，把嘴张大。][pg]");
         outputText("他转身离开，显然对自己相当满意。你的双腿再也撑不住，整个人软倒在地，方才的经历让你浑身无力。即便如此，你还是发疯般地自慰起来，仰躺在他留下的一小滩精液里，体会着真正极致的快感。那股精液的气味缠在你身上，久久不散，哪怕你挣扎着撑起身子，双臂环着肿胀的肚子，一瘸一拐地朝营地挪回去，也依然闻得到。原来这就是幸福的感觉……被使用、被精液灌满的感觉。[pg]");
         outputText("然而，内心深处，你对整件事隐隐感到一丝不安。你是不是……有点太依赖凯尔特了？一次又一次回去找他，或许不太健康。而且外面不是还有别人吗，对不对？可是……可是你就是没法把这个半人马从脑子里赶出去。跪在他脚下，做他淫荡的小精壶——这感觉太对了。你来这里的初衷是什么，你已经快想不起来了……[pg]");
         get_player().orgasm("Lips",false);
         get_player().createStatusEffect(StatusEffects.BlowjobOn,0,0,0,0);
         get_player().addStatusValue(StatusEffects.Kelt,2,15);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function keltBadEndEpilogue() : void
      {
         spriteSelect(SpriteDb.get_s_kelt());
         clearOutput();
         outputText("第二年，在你的主人建议你进行了一些变异之后……");
         outputText("[pg]女英雄犹豫着向前走去，穿过田野，带着那种在这个陌生土地上一直保护她安全的熟练的谨慎。如果她没算错的话，农场应该就在附近。当然，在这个不断变移的风景中，谁能说得准呢？[pg]");
         outputText("突然的声音引起了她的注意。一个淫荡的、黏糊糊的声音，伴随着马的嘶鸣。是怪物吗？不管是什么，声音是从谷仓后面传来的。女英雄准备好剑，小心翼翼地向前移动，准备迎接危险。[pg]");
         outputText("她发现的并不是她所期望的。两只半人马，沉浸在肉欲的极乐中。好吧，至少那个" + (get_player().hasPerk(PerkLib.BroBody) || get_player().hasPerk(PerkLib.FutaForm) || get_player().get_gender() == 3 ? "双性人" : "雌性") + "看起来沉浸在肉欲的极乐中。她在伴侣身下虔诚地呻吟着，呜咽着揉捏着自己西瓜般大小的乳房，而强壮的雄性则用他那巨大的马根一次又一次地抽插着她。就在女英雄着迷地看着的时候，雌性半人马爆发性地高潮了，向着高天大喊着她的满足。如果下面那滩浓稠的汁液" + (get_player().hasPerk(PerkLib.BroBody) || get_player().hasPerk(PerkLib.FutaForm) || get_player().get_gender() == 3 ? "和精液" : "") + "能说明什么的话，这一定是她众多高潮中的最后一次。她的体型几乎只有伴侣的一半，显然在享受着他那巨大的肉棒每一次插入她肿胀的马穴，淫荡地迎合着，乞求他再次射在里面。[pg]");
         outputText("过了一会儿，雄性满足了她，残忍地扯着半人马娘的头发，发出一声低吼，用力地射了出来。女英雄惊奇地盯着他那巨大的睾丸一次又一次地抽搐，把精液灌满他的母马。如果她仔细听，她甚至能听到每一次精液射入她体内时发出的淫荡的黏糊声，稳定地将精液泵入她的子宫。" + (get_player().hasPerk(PerkLib.BroBody) || get_player().hasPerk(PerkLib.FutaForm) || get_player().get_gender() == 3 ? "与此同时，她喷出大量的扶他精液，这明显是双性人的标志。" : "") + "[pg]");
         outputText("半人马一满足就下了马，在需求得到满足后就不再理会那匹被蹂躏的母马。他显然是占主导地位的一方，而他的伴侣则用饥渴的眼神看着他，想要更多。又有两只半人马……看样子是年轻的雌性，从谷仓里出来，匆匆走向她们的母亲，高兴地吸吮着她的乳房。母亲高兴地咕咕叫着，让她们吸吮自己饱满的乳房，同时满怀希望地看着她们离去的父亲。女英雄仔细一看，就能看到母马的肚子有多大……她可能又怀上了一匹小马驹。不知怎么的，这个画面对女英雄来说似乎非常色情，她焦急地咬着嘴唇。[pg]");
         get_images().showImage("badend-kelt");
         outputText("[say: 喜欢这场表演吗，混蛋？她还不错，偶尔来一发快餐挺好的。有点粘人，但做个精液垃圾桶还不错。怎么……你嫉妒了？][pg]");
         outputText("女英雄脸色苍白，转过身面对那个雄性，责备自己让他偷偷靠近。她挥舞着剑，试图后退，警惕着攻击。半人马饶有兴趣地看着她的剑，然后爆发出一阵恶毒的笑声，");
         outputText("[say: 哈！自以为懂得用剑的人类小婊砸。你就用那根小棍子来抵挡那些冲着你小穴来的大坏蛋？得了吧。这才是真正男人的武器。][pg]");
         outputText("他傲慢地摸了摸挂在宽阔胸膛上的弓。女英雄犹豫了一下，看着那把武器。她的家乡也有那样的弓，但她没有。这可能是一个有用的工具……而且半人马似乎知道怎么用它。他看起来没有威胁性……也许有点傲慢，而且非常粗鲁。也许……[pg]");
         outputText("半人马注意到她在看，咧嘴笑了。[say: 喜欢你看到的吗？也许我可以教你几招。当然，前提是你没有那个荡妇那么蠢。][pg]");
         outputText("他自信地向母马挥了挥手，母马仍然带着狂喜的表情给幼崽喂奶。精液慢慢地从她的小穴里渗出来，在她身下的地上积成一滩，女英雄一时感到有些羡慕。大多数马都有后宫，精力充沛的雄性同时满足许多雌性。这匹母马一天被操多少次？[pg]");
         outputText("半人马心照不宣地咧嘴笑了。他的麝香味在空气中很重，一种浓烈的、动物般的雄性气味。[say: 好吧，反正我也需要找点乐子。愚蠢的婊子也许是个不错的操物，但男人需要……稍微放松一下。明天再来，也许我能把你那空空如也的脑袋敲醒。我叫凯尔特。][pg]");
         get_game().gameOver();
      }
      
      public function fuckKeltsShitUp() : void
      {
         spriteSelect(SpriteDb.get_s_kelt());
         clearOutput();
         if(get_player().face.type == 5 && get_player().tongue.type == 1 && get_player().hasTailInsteadOfLegs())
         {
            outputText("你假装露出娇羞的微笑，用分叉的舌头舔了舔嘴唇，向凯尔特招手。这头愚蠢的种马小跑向你，说道：[say: 这样才对嘛，小虫子。也许等我用完你的嘴，我也会让我的鸡巴插进你的屁股里。] 他的包皮泛起涟漪并肿胀起来，粗壮的阴茎开始慢慢从褶皱的皮肤中垂下，悬向地面。随着他越来越近，它继续变大，直到最后开始变得僵硬，并向你的脸部弯曲。当你吸入他美妙的气味时，你感到了一阵自我怀疑——直接屈服会不会更好、更安全？不，你脑海中一个冰冷的爬行动物声音说道。你才是这里的捕食者，而他，傲慢的猎物，已经踏入了你的陷阱。让他付出代价。让他知道他在这个世界上的位置。[pg]");
            outputText("你张开嘴，并没有含住凯尔特的鸡巴，而是以闪电般的速度出击，双臂环抱住他的侧腹，一口咬在他的背上。将毒牙埋入如此上等的一块肉中所带来的满足感，几乎与凯尔特因突如其来的疼痛而发出的尖叫声一样强烈。[say: 你在干什么，你这个蠢货？滚开。现在！] 你懒得理会他。他用强壮的后腿猛踢，但你早就料到了；你向上蠕动，开始将长长的蛇身缠绕在他马形的背上。他试图将你的下半身困在他的蹄子下，但你注入他体内的毒液已经开始起效——他无法协调动作，只能晕乎乎地向你刺去。你用布满鳞片的尾尖轻轻一弹，巧妙地将他绊倒跪地，然后在他身下穿梭，再绕过他人类的上半身。他用双臂微弱地挣扎着，但在你的毒液流遍全身的情况下，他根本不是你强壮肌肉盘绕的对手。当你的视线与他的脸齐平时，你停了下来，他的双臂和整个身躯都被你那长满花纹的长尾巴紧紧包裹和困住。[pg]");
            outputText("你花了一点时间沉浸在这种感觉中——这个肌肉发达的庞然大物紧贴着你温暖的鳞片，任你摆布的感觉。他惊慌失措的心跳声在你的身躯中回荡，他怒视着你，无力反抗，而你则慵懒地用手指描摹着他骄傲的下巴轮廓。[say: 现在放开我，我保证不杀你。我可能得揍你一顿，但我不会杀你，] 他咆哮道。你几乎没在听——你正盯着他的眼睛。除了愤怒，那里还有别的东西——是恐惧吗？你得意地笑了笑，开始慢慢在他上方升起，直到你的生殖裂与他的脸齐平。与此同时，你将尾尖滑向凯尔特的阴茎，轻轻弹了一下它的末端；当他那根巨大的马鸡巴再次开始紧绷着立正时，他咬紧了牙关。你轻轻地绕着他的头转圈，一边说话一边折磨他。[pg]");
            get_images().showImage("kelt-farm-naga-subkelt");
            if(get_player().hasCock())
            {
               if(get_player().cockTotal() == 1)
               {
                  outputText("[say: 漂亮的小马踩到了一条蛇。现在漂亮的小马必须付出代价，] 你叹息着说道，张开嘴唇，让你的" + get_player().cockDescript(0) + "滑出来，感受新鲜空气。[pg][say: 你要是敢把它放进我嘴里，我就把它咬下来，] 凯尔特咆哮道。[pg][say: 是吗？] 你冷笑。[say: 我会再长出一根。而你，另一方面，将会在缓慢而痛苦的折磨中死去。放聪明点。] 他抬头盯着你，是的，那是恐惧：一匹马对一条毒蛇纯粹的、动物本能的恐惧。你张开嘴，向他露出毒牙，绽放出一个灿烂的、胜利的微笑；毒液顺着你的下巴滴落。他垂下眼睛，顺从地张开了嘴。不需要进一步的邀请，你将你的[cock]滑入他的嘴里，同时用双手揉搓着他的头发。[pg]");
                  outputText("他一开始很不熟练，犹豫不决；你感觉到他的牙齿摩擦着你的长度，有一瞬间你怀疑他是否真的会兑现他的威胁。你用尾巴挑逗着他的马鸡巴，在他的头部周围隐约画圈，然后，轻轻地，将尾巴的最尖端插入他的尿道。他含着你的[cock]呻吟起来，他的牙齿似乎消失了，取而代之的是一种吸吮的、急切的湿润。你开始慢慢地将更多的长度送入他口中。[pg]");
               }
               else
               {
                  outputText("[say: 漂亮的小马踩到了一条蛇。现在漂亮的小马必须付出代价，] 你叹息着说道，张开嘴唇，让你的鸡巴滑出来，感受新鲜空气。你漫不经心地用你的" + get_player().cockDescript(0) + "拍打他的脸。[say: 你要是敢把它放进我嘴里，我就把它咬下来，] 凯尔特咆哮道。[pg][say: 是吗？] 你冷笑。[say: 我会用下一根操你的嘴。然后我会让第一根重新长出来，再过来用那根操你！放聪明点。] 他抬头盯着你，是的，那是恐惧：一匹马对一条毒蛇纯粹的、动物本能的恐惧。你张开嘴，向他露出毒牙，绽放出一个灿烂的、胜利的微笑；毒液顺着你的下巴滴落。他垂下眼睛，顺从地张开了嘴。不需要进一步的邀请，你将你的[cock]滑入他的嘴里，同时用双手揉搓着他的头发；你半勃起的" + get_player().cockDescript(1) + "撞到了他的下巴，这是一个不容忽视的威胁提醒。[pg]");
                  outputText("他一开始很不熟练，犹豫不决；你感觉到他的牙齿摩擦着你的长度，有一瞬间你怀疑他是否真的会兑现他的威胁。你用尾巴挑逗着他的马鸡巴，在他的头部周围隐约画圈，然后，轻轻地，将尾巴的最尖端插入他的尿道。他含着你的[cock]呻吟起来，他的牙齿似乎消失了，取而代之的是一种吸吮的、急切的湿润。你开始慢慢地将更多的长度送入他口中。[pg]");
               }
               if(get_player().cocks[0].cockLength <= 10)
               {
                  if(get_player().balls > 0)
                  {
                     outputText("当你的鸡巴顶到他的喉咙深处时，你的[balls]撞到了他的下巴。");
                  }
                  else
                  {
                     outputText("当你的鸡巴顶到他的喉咙深处时，你的生殖裂撞到了他的下巴。");
                  }
                  outputText("他现在完全被你的长度占据了，他的头前后移动，舌头在上面涂满口水，也许是希望越早让你射出来，这场噩梦就能越早结束。你得意地笑了笑，抓住他的头发，让他的头随着你自己的动作节奏移动。[pg]");
                  outputText("你感觉到你的[cock]周围传来一声巨大的呻吟，凯尔特的鸡巴开始在你的尾巴上急促地跳动。你迅速而熟练地将尾端紧紧缠绕在半人马的阴茎上，拒绝让他释放，并用另一声在你的肉棒中回荡的痛苦、沉闷的尖叫来奖励自己。[pg]");
                  outputText("[say: 啧，啧，啧，] 你发出嘶嘶声。[say: 荡妇可不能在主人之前高潮。] 一个邪恶的念头击中了你。在仍然用你的盘绕抓住半人马鸡巴的同时，你开始将尾尖向凯尔特的屁股缠绕。这并不容易；你已经将整个身躯都投入到抓住半人马上，所以当你的尾巴向他的肛门移动时，你是逐渐将他勒得更紧。当你找到他的括约肌时，他已经被你的盘绕勒得骨头都要碎了，你轻柔但坚定地将尾尖沉入其中。凯尔特用尽最后的力气反抗这最终的屈辱，但他无能为力；你的毒液折磨着他的四肢，你的盘绕紧紧缠绕着他的身躯，你的鸡巴埋在他的脸上，你已经剥夺了他的一切。他的口水涂满了你的");
                  if(get_player().balls > 0)
                  {
                     outputText(get_player().ballsDescriptLight());
                  }
                  else
                  {
                     outputText("胯部");
                  }
                  outputText("当你开始用他的头发粗暴地推拉他迎合你的鸡巴时，你一点一点地将尾巴送入他的屁股。你感觉到你的尾尖触碰到了某个跳动的东西，当你粗暴地操他的嘴，开始达到顶峰时，你轻轻地探测它。当你挤奶般刺激他的前列腺，同时继续拒绝让他的鸡巴释放时，凯尔特只发出了几声沉闷的尖叫，然后你用一股精液让他闭嘴，直接倒进他的喉咙里。[pg]");
                  outputText("[say: 噢，你做这个真是太太太棒了，]你叹息着，看着他默默地吞下你的精液，他的脸因痛苦的兴奋而扭曲。[say: 没错，全都吞下去。谁能猜到你是个吸鸡巴的勇者呢？也许如果你放下硬汉的伪装，我会让你多吸几次。我们可以给你找点粉红色的染料，也许再来点魅魔的奶，然后你就能看起来像你……真正的……漂亮小马驹了！][pg]");
                  outputText("你用最后的三次冲刺为这些话画上句号，然后，精疲力竭地，慢慢地将你的[cock]从他嘴里抽出，口水和精液顺着你俘虏的嘴唇流下。你得意地笑了笑，将尾巴从他的屁股里抽出来，稍微松开了一点束缚。凯尔特甚至没有高潮；他沙哑地呻吟着，精液像水桶倒水一样从他被虐待的鸡巴里流出来。[pg]");
               }
               else
               {
                  outputText("你缓慢而坚定地将你那根粗大的阴茎更多地送入他口中，直到你感觉到他的喉咙深处，而你大部分的[cock]仍然在他的嘴唇外面。半人马现在完全被你的长度占据了，他的头前后移动，舌头在上面涂满口水，也许是希望越早让你射出来，这场噩梦就能越早结束。你得意地笑了笑，抓住他的头发，让他的头随着你自己的动作节奏移动。[pg]");
                  outputText("你感觉到你的[cock]周围传来一声巨大的呻吟，你的蛇尾尖感觉到凯尔特的鸡巴开始急促地跳动。你迅速而熟练地将尾端紧紧缠绕在半人马的阴茎上，拒绝让他释放，并用另一声在你的鸡巴中回荡的痛苦、沉闷的尖叫来奖励自己。[pg]");
                  outputText("[say: 啧，啧，啧，] 你发出嘶嘶声。[say: 荡妇可不能在主人之前高潮。] 一个邪恶的念头击中了你。在仍然用你的盘绕抓住半人马鸡巴的同时，你开始将尾尖向凯尔特的屁股缠绕。这并不容易；你已经将整个身躯都投入到抓住半人马上，所以当你的尾巴向他的肛门移动时，你是逐渐将他勒得更紧。当你找到他的括约肌时，他已经被你的盘绕勒得骨头都要碎了，你轻柔但坚定地将尾尖沉入其中。凯尔特用尽最后的力气反抗这最终的屈辱，但他无能为力；你的毒液折磨着他的四肢，你的盘绕紧紧缠绕着他的身躯，你的鸡巴埋在他的脸上，你已经剥夺了他的一切。你慢慢地开始将更多的[cock]送入他的嘴里，直到你看到他的喉咙因你的男子气概而鼓起。那种紧致感令人惊叹，你呻吟起来。你让他习惯了深喉你的感觉，然后开始加快速度，将你大部分的鸡巴撞进他的嘴里，直到你的[balls]开始拍打他的下巴。在你的另一端，你感觉到你的蛇尾尖触碰到了某个跳动的东西，当你继续粗暴地操他的嘴，开始达到顶峰时，你轻轻地探测它。当你挤奶般刺激他的前列腺，同时继续拒绝让他的鸡巴释放时，凯尔特只发出了几声沉闷的尖叫，然后你用一股精液让他闭嘴，直接倒进他的胃里。[pg]");
                  outputText("[say: 噢，你做这个真是太太太棒了，]你叹息着，看着他默默地吞下你的精液，他的脸因痛苦的兴奋而扭曲。[say: 没错，全都吞下去。谁能猜到你是个吸鸡巴的勇者呢？也许如果你放下硬汉的伪装，我会让你多吸几次。我们可以给你找点粉红色的染料，也许再来点魅魔的奶，然后你就能看起来像你……真正的……漂亮小马驹了！][pg]");
                  outputText("你用最后三次挺进为这些话画上句号，然后，精疲力尽地，慢慢地将你的[cock]从他嘴里抽出，唾液和精液挂在俘虏的嘴唇上。你得意地笑着，把尾巴从他的屁股里抽出来，稍微放松了对他的束缚。凯尔特甚至没有高潮；他沙哑地呻吟着，精液像水桶一样从他被虐待的鸡巴里流出来。");
               }
            }
            else if(get_player().hasVagina())
            {
               outputText("[say: 漂亮的小马驹踩到了蛇。现在漂亮的小马驹必须付出代价，]你叹息着说，张开嘴唇，让你的" + get_player().vaginaDescript(0) + "敞开，感受新鲜空气。[say: 你把你的花蕾放进我嘴里，我就把它咬下来，]凯尔特咆哮道。[say: 你会吗？]你冷笑。[say: 我会再长出一个。而你，另一方面，将死于缓慢而痛苦的折磨。放聪明点。]他抬头看着你，是的，那是恐惧：一匹马对一条毒蛇纯粹的、动物般的恐惧。你张开嘴，对他露出一个灿烂的、胜利的微笑，露出你的毒牙；毒液顺着你的下巴滴落。他垂下眼睛，顺从地张开嘴。不需要进一步的邀请，你将你的" + get_player().vaginaDescript(0) + "降到他的舌头上，同时用手揉搓他的头发。[pg]");
               outputText("起初他很不熟练，也不确定；你感觉到他的牙齿摩擦着你的" + get_player().clitDescript() + "，有那么一瞬间，你怀疑他是否真的会兑现他的威胁。你用尾巴挑逗他的马鸡巴，在他的龟头周围轻轻地画圈，然后，轻轻地，把尾巴尖插进他的尿道。他对着你的" + get_player().vaginaDescript(0) + "呻吟，他的牙齿似乎消失了，取而代之的是一种吸吮的、渴望的湿润。你紧紧地把腹部贴在他身上，强迫你的[clit]进入他的嘴里，他的舌头进入你湿润的洞里。[pg]");
               outputText("淫液开始顺着凯尔特的下巴滴落。他现在完全投入到你的" + get_player().vaginaDescript(0) + "中，他的头来回移动，舌头在你的阴蒂上涂抹着注意力，也许是希望他越早让你高潮，这场噩梦就能越早结束。你得意地笑着，抓住他的头发，强迫他的头转来转去，这样你粉红色的开口的每个角落都不会被忽视。[pg]");
               outputText("你感觉到一声巨大的呻吟，凯尔特的鸡巴开始在你的尾巴上急促地跳动。你迅速而熟练地将尾巴紧紧地缠绕在半人马的阴茎上，拒绝让他释放，并用另一声痛苦的、沉闷的尖叫在你的小穴里回荡来奖励自己。[pg]");
               outputText("[say: 啊，啊，啊，]你发出嘶嘶声。[say: 荡妇不能在主人之前高潮。]一个邪恶的念头击中了你。当你仍然用你的盘绕抓住半人马的鸡巴时，你开始将尾巴尖绕向凯尔特的屁股。这并不容易；你已经把整个身体都投入到抓住半人马上，所以当你的尾巴向他的肛门移动时，你只能一点一点地把他勒得更紧。当你找到他的括约肌时，他已经被你的盘绕紧紧地抓住了，你轻柔但坚定地将尾巴尖插了进去。凯尔特用他最后的力气反抗这最后的屈辱，但他无能为力；你的毒液折磨着他的四肢，你的盘绕紧紧地缠绕着他的身体，他的脸埋在你的生殖器里，你已经剥夺了他的一切。当你收紧肌肉，将他的舌头困在你的" + get_player().vaginaDescript(0) + "里，然后粗暴地在他身上摩擦，尽你所能地操他的脸时，他的唾液覆盖了你的开口；你的阴蒂在他的上唇上弹跳带来的感觉是巨大的，你加快了速度。在你的另一端，你感觉到你的尾巴尖触碰到了他肛门深处跳动的东西，当你粗暴地操他的嘴时，你轻轻地探测它，开始达到你的顶峰。当你挤奶他的前列腺，同时继续拒绝他的鸡巴释放时，凯尔特只发出了几声沉闷的尖叫，然后你用瀑布般的淫液让他安静下来，在狂喜中，你把淫液涂满了他整个脸。[pg]");
               outputText("[say: 噢，你做这个真是太太太棒了，]你叹息着，看着他默默地接受这种待遇，他的脸因痛苦的兴奋而扭曲。[say: 没错，继续用你的舌头舔我。像这样，对！谁能猜到你是个舔穴的勇者呢？也许如果你放下硬汉的伪装，我会让你多舔几次。我们可以给你找点粉红色的染料，也许再来点魅魔的奶，然后你就能看起来像你……真正的……漂亮小马驹了！][pg]");
               outputText("你用最后三次对着他脸的挺进为这些话画上句号，然后，精疲力尽地，你慢慢地退开，唾液和粘液挂在俘虏的嘴唇上。你得意地笑着，把尾巴从他的屁股里抽出来，稍微放松了对他的束缚。凯尔特甚至没有高潮；他沙哑地呻吟着，精液像水桶一样从他被虐待的鸡巴里流出来。[pg]");
            }
            else
            {
               outputText("[say: 漂亮的小马驹踩到了蛇。现在漂亮的小马驹必须付出代价，]你说。[say: 你打算做什么，怪胎；给我读诗吗？]凯尔特冷笑。[say: 组建一个读书会，这样我们就可以讨论在一个建立在欲望之上的世界里，没有他妈的生殖器意味着什么？还是说像你这样没有性别的废物有其他方式……高潮……]他的声音渐渐变小，因为你以蜿蜒的优雅扭动身体，让他的嘴现在正对着你的[ass]。你转过头，对他露出一个幸福的微笑，同时你张开你的[hips]，向他展示你的" + get_player().assholeDescript() + "。[say: 我注意到你很擅长摇晃你漂亮的小舌头，小马驹。看到你浪费那种天赋让我很难过，所以我找到了一个好用途。否则你将死于缓慢而痛苦的折磨。放聪明点。]他抬头看着你，是的，那是恐惧：一匹马对一条毒蛇纯粹的、动物般的恐惧。你张开嘴，对他露出一个灿烂的、胜利的微笑，露出你的毒牙；毒液顺着你的下巴滴落。他垂下眼睛，顺从地张开嘴。不需要进一步的邀请，你将你的[asshole]压在他身上。[pg]");
               outputText("起初他很不熟练，也不情愿；你感觉到他的牙齿摩擦着你的洞");
               outputText("。你用尾巴挑逗他的马鸡巴，在他的龟头周围轻轻地画圈，然后，轻轻地，把尾巴尖插进他的尿道。他绕着你的[ass]呻吟，他的牙齿似乎消失了，取而代之的是一种吸吮的、渴望的湿润。带着爬行动物的柔软，你慢慢地向后靠，把手压在他的后脑勺上，把他的脸更深地推向你自己。当他的舌头推入你的肛门，在上面涂抹着注意力时，你对这种感觉咯咯地笑，也许是希望他越早让你高潮，这场噩梦就能越早结束。你得意地笑着，抓住他的头发，让他的头随着你自己蜿蜒的动作有节奏地移动。[pg]");
               outputText("你感觉到一声巨大的呻吟在你体内回荡，凯尔特的鸡巴开始在你的尾巴上急促地跳动。你迅速而熟练地将尾巴紧紧地缠绕在半人马的阴茎上，拒绝让他释放，并用另一声痛苦的、沉闷的尖叫在你的屁股里回荡来奖励自己。[pg]");
               outputText("[say: 啊，啊，啊，]你发出嘶嘶声。[say: 荡妇不能在主人之前高潮。]一个邪恶的念头击中了你。当你仍然用你的盘绕抓住半人马的鸡巴时，你开始将尾巴尖绕向凯尔特的屁股。这并不容易；你已经把整个身体都投入到抓住半人马上，所以当你的尾巴向他的肛门移动时，你只能一点一点地把他勒得更紧。当你找到他的括约肌时，他已经被你的盘绕紧紧地抓住了，你轻柔但坚定地将尾巴尖插了进去。凯尔特用他最后的力气反抗这最后的屈辱，但他无能为力；你的毒液折磨着他的四肢，你的盘绕紧紧地缠绕着他的身体，他的舌头埋在你的屁股里，你已经剥夺了他的一切。当你收紧肌肉，将他的舌头困在深处，然后粗暴地用你的[ass]在他身上摩擦，尽你所能地操他的脸时，他的唾液覆盖了你的开口；你体内柔软、滑溜的感觉是巨大的，你加快了速度。在你的另一端，你感觉到你的尾巴尖触碰到了他肛门深处跳动的东西，当你粗暴地操他的嘴时，你轻轻地探测它，开始达到你的顶峰。当你挤奶他的前列腺，同时继续拒绝他的鸡巴释放时，凯尔特只发出了几声沉闷的尖叫，然后你感觉到体内有什么东西收紧了，你开始享受你奇怪但令人满意的肛门高潮。[pg]");
               outputText("[say: 噢，你做这个真是太太太棒了，]你叹息着，看着他默默地接受这彻底的屈辱，他的脸因痛苦的兴奋而扭曲。[say: 没错，继续用你的舌头舔我。像这样，对！谁能猜到你是个舔屁股的勇者呢？也许如果你放下硬汉的伪装，我会让你多舔几次。我们可以给你找点粉红色的染料，也许再来点魅魔的奶，然后你就能看起来像你……真正的……漂亮小马驹了！][pg]");
               outputText("你用最后三次对着他脸的向后挺进为这些话画上句号，然后，精疲力尽地，你慢慢地退开，唾液从你的屁股挂在俘虏的嘴唇上。你得意地笑着，把尾巴从他的屁股里抽出来，稍微放松了对他的束缚。凯尔特甚至没有高潮；他沙哑地呻吟着，精液像水桶一样从他被虐待的鸡巴里流出来。[pg]");
            }
            outputText("你慢慢地从半人马身上解开自己，继续享受你的鳞片刷过他纯种马身体的感觉。凯尔特已经没有能力报复你了；你的毒药和对他的折磨让他处于半昏迷状态。他睁大眼睛，眼神迷离，似乎不敢相信刚才发生的事情。你悠闲地穿上你的[armor]，然后微笑着，在他被你咬过的地方深情地拍了一下，然后滑走了。你想知道他是否还能再面对你。");
         }
         else
         {
            outputText("你假装露出一个羞涩的微笑，跪在地上，向凯尔特招手。这个愚蠢的种马小跑过来，说：[say: 这才像话，荡妇。也许等我操完你的嘴，我也会让我的鸡巴插进你的屁股里。]他的包皮起伏膨胀，他粗壮的阴茎开始慢慢地从褶皱的皮肤里垂下来，悬在地上。随着他越来越近，它继续生长，直到最后开始变得僵硬，向上弯曲指向你的脸。你吸入你主人美妙的气味，然后——不！这次你不会向他屈服的！[pg]");
            outputText("你抓住他龟头冠状沟下方的鸡巴，用力向下拉，然后向后退，直到你到了这头野兽的后面。他灵活的马鸡巴似乎很好地适应了这个角度，所以你把它拉得更远，直到凯尔特不舒服地跳来跳去，试图放松他暴露在外的阴茎上的压力。他吠叫道：[say: 你他妈的真的不知道你在做什么，对吧，婊子？][pg]");
            outputText("你的脸颊变红了，但你的愤怒驱散了屈服的冲动。你在他膨胀的鸡巴上猛地一拉，让凯尔特痛苦地嘶鸣，他用后腿猛烈地踢了过来。你预料到了这一招，然后躲开了，就在他的后背开始抬起的时候，你把他的长度弯得更远了。疼痛夺走了他踢腿的任何力量，你能够侧身避开一条腿，并在另一条腿踢中之前用格挡把它推开。他重重地摔在地上，摇摇晃晃，不舒服地嘶鸣着，甚至开始哭泣：[say: 啊，嗷……求你了，别再伤害我了！][pg]");
            if(get_player().get_tallness() < 50 || get_player().totalCocks() == 0)
            {
               if(get_player().get_tallness() < 50)
               {
                  outputText("意识到自己太矮，无法好好地支配他，你又想出了一个计划。");
               }
               outputText("你在他的屁股上狠狠拍了一巴掌，然后握紧拳头。[say:现在谁才是母狗？！]你嘲讽着，一拳捅进他的屁眼。突如其来的不适让他大叫起来，但你感觉到他手里的肉棒明显变粗了。当你在他体内碰到一个苹果大小的肉结时，你张开手，试探性地轻轻捏了一下。凯尔特痛苦地嘶鸣着，像花园里的水管一样喷射出大量的透明先列腺液，溅在草地上。你像狼一样咧嘴笑了，手指紧紧握住他的器官。他的马鞭在你的手中抽搐、膨胀，在刺激下喷射出大量的精液。[pg]");
            }
            else
            {
               outputText("你在他的屁股上狠狠拍了一巴掌，将你的[cock]对准他那巨大的后庭。你向前挺进，深深地插进他的屁眼，嘲讽道：[say:现在谁才是母狗，你这个该死的肉便器？]你感觉到你的龟头撞上了他坚硬的前列腺，接触的瞬间，你能感觉到他的肉棒在你的手中抽搐，将一股先列腺液喷射到泥土里。你操着这个可怜的半人马，听着他痛苦的嘶鸣声大笑，但每次你插回他体内，他都会喷出更多粘稠的先列腺液，直到你感觉到他的肉棒在你的手中膨胀，开始喷射。[pg]");
            }
            outputText("伴随着湿润的“噗嗤”声拔出后，你用附近的一个水桶洗掉了污垢，这水桶可能是半人马打算用来对付你时准备的。你抓起一根套索，把它套在他的肉棒上，无视他的抗议，将它紧紧地系在他还在漏液的阴茎上。凯尔特哀嚎着，[say:你在干嘛啊啊啊啊啊？！][pg]");
            outputText("[say:母狗不应该先高潮，荡妇。]你把绳子从他的屁股沟里拉上来，走上前去，把它绕过他的肩膀。现在你站在他面前，猛地拉了一下绳子，看着他因绳子勒进屁股而痛苦扭曲的脸，绳子把他的肉棒向后拉，看起来就像第二条尾巴。无视他的眼泪和哭泣的抗议，你把他带到附近的一条长凳上，爬上去，用一只手解开你的[armor]。他低头看着你现在暴露的胯部，浑身发抖，公然哭泣起来。[pg]");
            if(get_player().get_gender() == 0)
            {
               outputText("你转过身，弯下腰露出你的[asshole]。[say:舔它，母狗，]你命令道。当他不照做时，你拉了一下绳子，他的蹄子痛苦地刨着泥土。[say:我说舔！]你尖叫着，这次他照做了。他的舌头滑进你的" + get_player().assDescript() + "之间。[say:深一点，]你叹息着，他顺从了，不再有反抗的能力。你让他用舌头操你，直到你达到颤抖的高潮。[pg]");
            }
            else if(get_player().hasVagina() && (get_player().totalCocks() == 0 || Utils.rand(2) == 0))
            {
               outputText("你张开[legs]，露出你的" + get_player().vaginaDescript(0) + "。[say: 舔它，婊子，]你命令道。当他没有照做时，你拉了一下绳子，他的蹄子痛苦地刨着泥土。[say: 我说舔！]你尖叫道，这次他照做了。他的舌头滑入你肿胀的阴唇之间");
               if(get_player().vaginas[0].vaginalWetness < 3)
               {
                  outputText("试探性地品尝着它们。");
               }
               else
               {
                  outputText("立刻被你的淫液弄得湿滑。");
               }
               outputText("[say:深一点，]你叹息着，他顺从了，不再有反抗的能力。你让他用舌头操你，直到你达到颤抖的、阴道紧缩的高潮。");
               if(get_player().totalCocks() > 0)
               {
                  outputText("你的[cock]将精液溅在他的头发上，进一步羞辱了他。");
               }
               outputText("[pg]");
            }
            else
            {
               outputText("你张开[legs]，露出你的[cock]。[say: 舔它，婊子，]你命令道。当他没有照做时，你拉了一下绳子，他的蹄子痛苦地刨着泥土。[say: 我说舔！]你尖叫道，这次他照做了。他略显粗糙的舌头在你的肉棒上下滑动，小心翼翼地品尝着你阴茎上的皮肤。[say: 含深一点，]你叹息道，他顺从了，不再有任何抵抗的能力。他张大嘴巴，把脸埋进你的胯部");
               if(get_player().cocks[0].cockLength < 10)
               {
                  outputText("轻松地吞下整根肉棒，他的舌头舔着你，让你达到");
               }
               else if(get_player().cocks[0].cockLength < 25)
               {
                  outputText("将整根肉棒深深地吞进喉咙。显然半人马没有呕吐反射，你可以看到他的喉咙被你撑开，让你达到");
               }
               else
               {
                  outputText("尽可能多地将肉棒深深地吞进喉咙。尽管他的整个脖子都被你巨大的阴茎撑得变形，但他的喉咙根本不够长，无法吞下更多。你扭动着身体，深喉的快感让你达到");
               }
               outputText("爆炸性的高潮。你把精液直接射进他的肚子里，拔出时让他打了个嗝，精液滴在半人马被蹂躏的嘴唇上。[pg]");
            }
            get_images().showImage("kelt-farm-subkelt");
            outputText("出于怜悯，你转过身松开绳子，推倒他疲惫的身体。他重重地摔在地上，被紧紧绑住的肉棒在他身下的泥土里弹跳。你小心翼翼地解开肿胀的半人马肉棒，注意到它因压抑的性欲而膨胀得多么厉害。随着每一层绳子被剥落，精液开始越来越多地从他体内漏出。随着最后一个结的解开，他开始无助地喷射。你拍拍他的侧腹说：[say:好母狗。现在你为什么不去找点魅魔的奶，好让自己看起来更像个荡妇呢？][pg]");
            outputText("在昏迷的半人马恢复意识之前，你重新穿好衣服，想知道他是否能恢复足够的自尊再次面对你。");
         }
         get_player().orgasm("Generic");
         dynStats(DynStat.Inte(2),DynStat.Cor(4));
         get_player().createStatusEffect(StatusEffects.KeltOff,0,0,0,0);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function fightToBeatKeltVictoryLust() : void
      {
         clearOutput();
         outputText("凯尔特被欲望淹没，瘫倒在地。");
         chooseToFinishKelt();
      }
      
      public function fightToBeatKeltVictoryHP() : void
      {
         clearOutput();
         outputText("凯尔特虚弱得无法继续战斗，倒在了地上。");
         chooseToFinishKelt();
      }
      
      public function defySubmissionAndFight() : void
      {
         clearOutput();
         outputText("为了反抗你对凯尔特的顺从，你突然摇了摇头，终于下定了决心。够了。那个半人马必须受到惩罚！是时候让他尝尝苦头了。");
         doNext(kelly.fightToBeatKelt);
      }
      
      public function defySubmission() : void
      {
         clearOutput();
         outputText("为了反抗你对凯尔特的顺从，你突然摇了摇头，回到了你的营地。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function continueAfterBJ() : void
      {
         spriteSelect(SpriteDb.get_s_kelt());
         clearOutput();
         get_images().showImage("event-archery");
         outputText("短暂休息后，你设法回到了射箭练习中。");
         keltMainEncounter3();
      }
      
      public function chooseToFinishKelt() : void
      {
         get_combat().cleanupAfterCombat();
         outputText("[pg]你走到被打败的半人马面前，想着该怎么做。");
         addButton(0,"杀了他",youBadEndKeltForGood);
         addButton(1,"强暴他",fuckKeltsShitUp);
         addButton(4,"拿弓离开",leaveKelt4Good);
      }
      
      public function bowSkill(param1:int) : int
      {
         var _loc4_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = param1;
         while(_loc2_ < _loc3_)
         {
            _loc4_ = _loc2_++;
            get_player().masteryXP(MasteryLib.Bow,5 + Utils.rand(11));
         }
         return get_player().masteryLevel(MasteryLib.Bow);
      }
   }
}

