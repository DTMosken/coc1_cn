package classes.scenes.npcs
{
   import classes.Appearance;
   import classes.CoC;
   import classes.CoC_Settings;
   import classes.Cock;
   import classes.CockTypesEnum;
   import classes.DynStat;
   import classes.DynStatOp;
   import classes.ImageManager;
   import classes.Monster;
   import classes.PerkLib;
   import classes.Player;
   import classes.PregnancyStore;
   import classes.StatusEffects;
   import classes.TimeAwareInterface;
   import classes.Vagina;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.display.SpriteDb;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.items.WeaponLib;
   import classes.scenes.Camp;
   import classes.scenes.Inventory;
   import classes.scenes.camp.ScarredBlade;
   import classes.scenes.combat.Combat;
   import coc.view.CoCButton;
   import flash.Boot;
   import haxe.IMap;
   
   public class SheilaScene extends NPCAwareContent implements TimeAwareInterface
   {
      
      public var pregnancy:PregnancyStore;
      
      public function SheilaScene()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         pregnancy = new PregnancyStore(1211,762);
         CoC.timeAwareClassAdd(this);
      }
      
      public function winAgainstDemoNSheilaForVaginas() : void
      {
         clearOutput();
         outputText("你毫不犹豫地坐到那女人腿上，");
         if(!get_player().isTaur())
         {
            outputText("双手粗暴地揉弄着她的奶子，");
         }
         outputText("同时急切地用小穴在她腹部蹭磨。她顺从地把两根手指探进你体内，可你");
         if(!get_player().isTaur())
         {
            outputText("一把抓住她的脸，慌乱中把一根拇指插进了她的嘴角，然后");
         }
         else
         {
            outputText("转过头并");
         }
         outputText("直视她的双眼。你拼命集中精神想着自己的幻想，试图单凭意志力把你对更进一步的渴望传达给这个恶魔。她回望着你，唇角勾起一抹狡黠的笑——这真的能行吗？");
         outputText("[pg][say: 所以……你也喜欢别人射在你里面？]她红着脸说道。[say: 我不能让你怀上孩子，但如果你想让我的汁液洒满你的子宫，我可以做到。]");
         outputText("[pg]成功了！你能感觉到她腿间、就在你的[butt]下方，有什么东西硬了起来，而你");
         if(!get_player().isTaur())
         {
            outputText("用双手撑着爬开");
            if(get_player().tail.type > 0 && get_player().hasTailInsteadOfLegs())
            {
               outputText("，抬起尾巴");
            }
         }
         else
         {
            outputText("爬起来站上蹄子，弯下前腿");
         }
         outputText("，把你渴求的[vagina]展露给她。希拉坐起身，双手扶住你的[hips]，然后挺起胯部，用某个圆鼓鼓又温热的东西挑逗着你下面的唇瓣。它把黏液抹在上面，让那里微微刺痛，那感觉并不完全舒服。");
         outputText("[pg][say: 我听说一开始会疼，]你的恶魔情人说道。[say: 对不起。]");
         outputText("[pg]你还没来得及说半个字来拖延，她就猛地把胯部撞向你，用她的铲形尾尖利落地插进了你体内。");
         get_player().cuntChange(10,true,true,false);
         outputText("天啊，烧起来了！希拉那条黑色尾巴流出的液体侵袭着你的小穴，让你剧烈地颤抖起来，一波波疼痛在里面扭动，逼得穴壁紧紧夹住这个入侵者。恶魔被你夹得倒抽一口气，向前压到你的背上");
         if(sheilaCorruption() > 0)
         {
            outputText("，把她的乳房压在你身上");
         }
         outputText("。[say: 冷静点！]她厉声说道，抓住你的手臂往她那边拉。双手这样被按在身后，你几乎没法阻止她的热情……但希拉还没有开始抽插。[say: 很快就会退下去的，亲爱的，然后你就会感觉到了，]她保证道，吻上你的");
         if(!get_player().isTaur())
         {
            outputText("脖颈");
         }
         else
         {
            outputText("马肩隆");
         }
         outputText("，而她那根奇怪的、静止不动的肉茎仍在不断往你的小穴里滴淌。你的胯间因疼痛而发热，她的话听起来却很空洞。灼痛似乎完全没有好转；你越过肩头回头看她，绷紧的脸上清楚写着恐惧和受伤。她紧张地对你笑了笑，但黏液的流动并没有停止。你的小穴里每一秒都变得更湿、更滑，很快你就感觉到黏液开始从你的[vagina]里渗出来。一股又一股液体从你体内流出，落在下方的地面上。");
         outputText("[pg][say: 要来了，]希拉向你保证道。随着更多分泌物被你挤出，那细流变得更急，而奇迹般的是，液体流出来时，疼痛似乎也减轻了，落地时发出轻轻的“啪嗒”声。你的困惑一定全写在脸上了，因为希拉凑近过来，像在分享秘密一样说道。[say: 现在这可不是我弄出来的了，亲爱的。是你。]为了证明这一点，她从你体内抽了出来——而液体落地的轻响反而变得更多了！她把手伸到你的小穴前，轻轻托住你，然后又抽回手，举到你面前。她的掌心满是清澈的女性淫液。[say: 看看你湿成什么样了，我的小婊子，]希拉说着张开手指，让那女孩子的润滑液从指缝间滴落。你还在消化这一切时，她把自己靠在你的[butt]上，又把那条黑色的铲形尾巴滑进你体内；这一次进入得轻而易举，没有了先前的不适，只剩让你心跳加速的愉悦热意。");
         outputText("[pg][say: 我现在要像干一个荡妇那样干你，然后把我滚烫的一大泡全射进你贪吃的小穴里，]女孩低声说道，双手又回到你的臀上。[say: 我真希望能让你怀上，把你变成我的女人。像你这么棒的小骚货，留给这个烂透了的世界里那堆垃圾实在太浪费了。]她慢慢顶入，搅弄着你，让你的穴口尽情享受这一下漫长而挑逗的抽送。[say: 你会喜欢那样吗？被我的孩子填满？你知道的，我也可以长出一根真正的鸡巴。]她那根伪肉棒胀大起来，蹭着你小穴的入口，铲形尾尖上的倒刺轻轻扯弄着你；当她下一次缓慢顶入时，你发誓自己甚至感觉到一条条血管正沿着它的长度鼓起。[say: 我可以让它长得很大，既然你现在湿得像季风过后的排水沟一样，然后一直把我的精液灌满你。]她俯下身再次吻住你，让你发热的身体一阵战栗。");
         outputText("[pg][say: 我会每天都来看你，把你掰开；你会在地上滴出一滩水，准备好迎接我，而我会一边撸着我的肉棒，一边看你玩弄自己，给我好好表演……然后，当我再也忍不住的时候，]希拉气喘吁吁地低语道，[say: 我就爬到你身上，把你干到脑子发昏……就像<b>这样！</b>]女人的双手向上抓住你的腰，开始狠狠捅弄你，用尾巴猛撞你的肉穴，力道大得让液体落地的滴答声变成一阵阵水声——插入时短暂安静，等那圆鼓鼓的尖端抽回时又一下子泼溅出来。你歪着头，舌头从嘴里垂出，希拉趁机抓住你一把头发。[say: 听起来不错吧，母狗？]她一边质问，一边把你的头往后拽。[say: 你想当我的精液垃圾桶吗？你想让我随心所欲地强行插进你身体，一天又一天把我的精液灌满你吗？像个男人一样射在你里面，告诉你我爱你，然后把你丢在一边，直到我又发情为止？你想一个接一个生下我的孩子，造出一群小恶魔填满天空，用我们的颜色玷污这个世界吗？]");
         outputText("[pg]一想到自己如此堕落，你的[vagina]就在高潮中痉挛起来——");
         if(get_player().lib < 20)
         {
            outputText("即便你依然如此骄傲，");
         }
         outputText("这幅画面却有种奇异的吸引力——被珍爱与被使用并存，竟带着某种强烈的力量。希拉尖叫着松开你的头发，手指深深掐进你的臀部，把一股浓稠、缓缓流淌的热流喷进你的小穴深处。那热意扩散开来，又随着你自己倾泻而出的淫液把她的精液挤出体外而渐渐变淡。你低头从两腿之间望去，看见它落到地上；那是黏稠的黑色污泥，冒着泡、腾着热气，仿佛还想重新爬回你的性器里。");
         if(get_player().cor < 50)
         {
            outputText("她一次又一次地抽送，把更多污浊的泥浆灌进你的[vagina]，同时用她能想到的最下流的话辱骂你");
            if(sheilaCorruption() > 0)
            {
               outputText("；她的乳房随着抽插剧烈摇晃，随后又在她弓起背、把她的肉铲整根顶入时停了下来");
            }
            outputText("。希拉仰天长嚎，把她恶魔般的黏液化作最后一股结实的水流灌入你体内。你能感觉到它急切地穿过你丰沛的体液，一路抵达你的子宫入口……然后进入其中。");
            if(get_player().fertility < 50)
            {
               outputText("你体内深处泛起一阵酥麻，让你变得更加容易受孕。");
               var _temp_1:* = get_player();
               _temp_1.fertility = _temp_1.fertility + 1;
            }
         }
         else
         {
            outputText("她停止抽送，倒在你的背上喘息着；最后一点黏液从她体内渗出，又被你泉涌般的雌性精液沿着她的肉棒周围挤了出来。随着高潮逐渐退去，你的头脑比之前清醒了些；不过，毫无道理地，你几乎可以发誓自己感觉到她的乳房正贴着你变大。");
         }
         outputText("[pg][say: 该死，]她一边说，一边揉着你的[butt]，并抽出她的肉铲；你的小穴把多余的黑色黏液挤出，发出啪嗒一声。[say: 我真的好爱你，[name]。]你们双双瘫倒在地；你趴在地上，希拉压在你身上，而你的[vagina]仍持续滴淌着带有暗色的润滑液，过了一阵子才终于恢复到几乎正常的状态。");
         if(get_player().wetness() < 5)
         {
            outputText("[pg]不过你觉得，自己可能比以前更湿了一点。");
            var _temp_2:* = get_player().vaginas[0];
            _temp_2.vaginalWetness = _temp_2.vaginalWetness + 1;
         }
         get_player().slimeFeed();
         get_player().orgasm("Vaginal");
         dynStats(DynStat.Lib(-1));
         if(get_player().cor < 50)
         {
            sheilaCorruption(-10);
            dynStats(DynStat.Cor(10));
         }
         else
         {
            sheilaCorruption(10);
            dynStats(DynStat.Cor(-10));
         }
         if(get_game().get_inCombat())
         {
            get_combat().cleanupAfterCombat();
         }
         else
         {
            doNext(get_camp().returnToCampUseOneHour);
         }
      }
      
      public function timeChangeLarge() : Boolean
      {
         return false;
      }
      
      public function timeChange() : Boolean
      {
         var _loc1_:* = null as IMap;
         pregnancy.pregnancyAdvance();
         if(get_game().time.hours > 23)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,858) < 0)
            {
               _loc1_ = KFLAGS.flags;
               FlagDict_Impl_.arrayWriteInt(_loc1_,858,FlagDict_Impl_.arrayReadInt(_loc1_,858) + 1);
            }
         }
         return false;
      }
      
      public function tellSheilaDemonToFuckOff() : void
      {
         clearOutput();
         outputText("[say:哦，]她说。[say:别这样嘛。你可是我最好的伙伴，你知道的。我的挚爱。我永远、永远都不会放开你。]她的眼神有些恍惚，");
         if(Utils.rand(10) < 3)
         {
            outputText("她脱口而出：[say:我知道我能让你明白。除非你也说爱我，否则你别想走！]你甩开她的手，向后退去，可她又逼近过来，试图抓住你！");
            startCombat(new Sheila());
            return;
         }
         outputText("但她还是努力重新控制住了自己。[say:别担心。真遗憾，我特别的人儿，看来你现在没空谈情说爱。我会一直在这里等到你有空，一边想着你，一边抚摸自己。]她松开你，退开几步，接着粗俗地把自己的黑桃形尾尖从大腿间塞过去，一把抓住它。她一边前后挺动骨盆，一边半呻吟着，套弄着手中那截粗大的黑色肉质物。她向你眨了眨眼，忽然松开它，转身离去。");
         doNext(get_camp().returnToCampUseOneHour);
         dynStats(DynStat.Lust(10));
      }
      
      public function talkToDemonSheilaAboutWhatNow() : void
      {
         clearOutput();
         get_images().showImage("sheila-corrupted");
         outputText("[say: 我接下来要做什么？还能做什么呢，我傻乎乎的爱人？]希拉望向平原。[say: 我总是为你欲火焚身。我们可以来点坏坏的事，让彼此都舒服起来。]");
         outputText("[pg]女人凑近了些，像是在说悄悄话。[say: 既然你问了，伙计，那我就说清楚点……我现在对自己的力量掌控得多了。只要我们还碰着彼此，就算我没在高潮，也能用上一点点……要是我集中精神，甚至完全不用也行。我可以在结束时把我所有的感觉都传给你。或者我也可以轻轻汲取你的感觉，用它来延长我的高潮，让你只要还和我在一起，就一直徘徊在边缘。我们真的可以用一整天来持续一场漫长的高潮……]");
         if(get_player().lib >= 30)
         {
            outputText("[pg]你扬起眉毛。[say: 引起你注意了，对吧？不过，]");
         }
         else
         {
            outputText("[pg]你的嘴角绷紧了。[say: 你说得对，]");
         }
         outputText("希拉说道，[say: 那个我还是留到我们的蜜月再说吧。]她的眼中闪烁着迷恋的光。[say: 我甚至可以把这片土地的污秽从你体内抽出来，用它让我的身体为你变得更加淫荡，我的" + get_player().mf("骑士勇者","伟大的女士") + "……]");
         outputText("[pg]她抬起手捏住你的下巴，将你的视线带过来与她相对。随着几秒拉长成几分钟，你也说不清她到底是在试着浪漫，还是在用某种方式衡量你。最后，她开口了。");
         if(get_player().cor < 50)
         {
            outputText("[saystart]不过，我想我不会那么做，我爱撒娇的伴侣……我更想用我的颜色把你染上，哪怕要为此付出我的身体也无所谓。又或者，如果我的身材更朴素一点，你会更喜欢我吗？你，是我自信而有风度的" + get_player().mf("领主","贵妇") + "；而我，是崇敬你、带点假小子气的" + get_player().mf("侍从","侍女") + "，偷偷爱着你，愿意跟你去任何地方、为你做任何事，只为让你认可我，接受");
            if(get_player().hasCock())
            {
               outputText("我的小穴");
            }
            else
            {
               outputText("我为你长出来的鸡巴");
            }
            outputText("？</i>什么都行？<i>");
         }
         else
         {
            outputText("[saystart]……你会喜欢那样吗？如果我的乳房大到我只能作为你的性玩具、你的所有物，耐心地等着你；为了配合你的身体，长出你需要的任何新部位，依赖着你，在一天结束时欢迎你回家，等我们躺在一起、造出我们的孩子之后，邀请你在你亲手塑造的胸怀里休息……那会让你满足吗？那时你会爱我吗？");
         }
         outputText("[sayend]");
         outputText("[pg]希拉松开你的脸，又重新望向前方。[saystart]我想要你。我也想和你有孩子，只要你愿意");
         if(get_player().hasCock())
         {
            outputText("给我孩子");
         }
         else
         {
            outputText("为我生孩子");
         }
         outputText("。还有什么比这更简单的？[sayend]");
         outputText("[pg]她现在对生孩子这件事执着得厉害，比你见过的任何人都更甚");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,39) > 0)
         {
            outputText("，除了一个人。说真的，她们俩还真有点像……");
         }
         outputText("。可是，恶魔生下的后代都会是小恶魔，对吧？");
         outputText("[pg][say: 小恶魔很可靠，像狗一样，]她皱着眉反驳道。[say: 你可以指望它们只在乎一件事，而且它们对此永远坦坦荡荡。可不像这世上其他那些装腔作势的垃圾，把这里弄得污秽不堪，还笑着撒谎，好像自己知道身边的人怎样才最好。]希拉开始在你的手臂上胡乱描着没有意义的形状。[saystart]这也是我喜欢你的地方，伙计");
         if(get_player().cor < 50)
         {
            outputText("；就算你把它藏起来，我也见过它潜伏在你心里");
         }
         outputText("。想不想暂时亮出你的本色？[sayend]");
         dynStats(DynStat.Lust(get_player().lib / 15),DynStat.NoScale);
         menu();
         addButton(0,"别的问题",demonSheilaTalkAnotherQuestion);
         if(get_player().get_lust() >= 33)
         {
            addButton(1,"让她干",sheilaLetHerFuckYou);
         }
         addButton(2,"抵抗",demonSheilaResist);
      }
      
      public function takeScarredBlade() : void
      {
         clearOutput();
         outputText("你抓住这把嗜血的军刀，将它从地里拔了出来。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2175,0);
         get_inventory().takeItem(get_weapons().SCARBLD,get_camp().returnToCampUseOneHour);
      }
      
      public function tailSpadeSoundingForFuckHugeDongsWithDemonSheila() : void
      {
         clearOutput();
         outputText("恶魔解开你的[armor]，替你脱下衣服，打量着你的胯下。[say:有点太夸张了吧，[name]？]她嘲弄道，用膝盖蹭着你的[cock biggest]。[say:我的魔力还没强到能吞下这头怪物——也许等我把见到的每样东西都操上几个月，我才会松到那种程度吧。]希拉冲你咯咯笑了起来。");
         outputText("[pg]你的肉棒在刺激下硬了起来，高高挺立，她满是渴望地用手指沿着它向上划去。[say:倒不是说我不想把这漂亮东西塞进我身体里……也许我们可以退而求其次。]她把它压低到与地面平行，然后转过身，将[cockHead biggest]夹进自己的大腿之间，在小穴上摩擦，让自己的淫液和渗出的前液混在一起。[say:又滑又顺，]她确认道，一边用手指拨弄你的尿道口，令你浑身一颤。");
         outputText("[pg]希拉向前迈了半步，弯下腰，让你的阴茎从她腿间脱出；她棕色的尾巴缠住了它，像套索一样套在龟头冠后方的肉茎上。光滑的皮肤触感相当舒服，希拉回头看向你。[say:这景色好看吗？]她问着，晃动圆润的屁股，也带着你的[cock biggest]左右摆动。又一滴前液代替你作出了回答。");
         outputText("[pg][say:抓紧了，]她提醒道。你还没来得及问她什么意思，希拉就把黑色的桃心尾尖抬到你的肉棒顶端，把上面渗出的分泌物抹在你的裂口上。那灼痛感相当强烈；你只能咬住嘴唇，不让自己叫出声。恶魔仔细观察着你的表情，执拗地把尾尖压进你的尿道出口，将其一点点撑开，让你的[cockHead biggest]被她深色的油液淹没。你现在几乎能感觉到它就要刺入体内——当尾尖最宽的部分滑进你的孔里时，希拉浑身一颤，捏住自己的乳房。它一挤过那圈入口，她便露出邪恶的笑容。[say:要来了！]");
         outputText("[pg]她光滑的棕色尾巴收紧了束缚，恶魔将粗厚的桃心尾尖无情地在你的尿道里进出，用前端的两瓣勾扯着你的肉棒；那股压力和她污浊体液从内侧灌进肉茎的热意，几乎让你昏过去。青筋在表面鼓起，肉体开始发炎；你的龟头末端也开始肿胀，在她试图抽动时反过来挤压着她的尾巴。");
         outputText("[pg][say:操，好紧……你都把我的黏液从我体内挤出来了，伙计！]果然，当她抽出来时，你能感觉到一大股刺激性的液体沿着你的家伙向根部滑去，扩散出疼痛的热意，把你的阴茎撑胀起来，直到整根肉茎都比之前粗长了好几英寸。希拉再次强行插入，让一阵新的感觉沿着你的肉棒传下去，这一次没有她油液带来的灼痛——看来你已经被浸透了，或者你自己的前液正在把她的液体冲出去。只有当希拉再次从你紧窄的裂口中抽出一部分时，又一团她的油液才顺着你的肉棒滑下，这次抵达了更深处，随后渗入你体内尚未受影响的皮肤深处。");
         outputText("[pg]恶魔一次又一次地抽插着你，而随着她的欲望攀升，那液体也开始不断从她的尾尖流出，缓慢地向你体内更深处推进，与你的前液相互抗衡。当它逼近你的前列腺时，你开始扭动起来；希拉仍从肩头回望着你，察觉到接下来会发生什么后，露出了顽皮的笑容。她松开缠住你[cockHead biggest]的棕色尾巴，只靠埋在里面的尾尖让它固定住，然后用同一条尾巴缠住旁边那根，借着你溢出的前液当润滑，卖力地撸动那根黑色肉茎。");
         outputText("[pg][say:嗯嗯，]她呻吟着，[say:要、要去了！]女人的小穴淌出淫液，尾巴也抽搐着肿胀起来；你甚至能亲眼看见后者随着某种东西强行穿过棕色套环、挤进你的尿道而逐渐变粗，把它撑得大开。当那处隆起抵达你能感觉到她尾尖卡住的位置时，她的尾巴末端骤然鼓胀，喷吐出一股滚烫黏稠的黏液；它在你的肉棒内部翻搅着向下滑去，凭借更高的密度挤开前液，沉入你的体内。你怀着愈发强烈的恐惧等待着它穿过你肉棒的[sheath]，进入你的身体——仿佛是被你的迟疑，或是被你最深处位置的临近所刺激，那贪婪的黏液似乎加快了速度，直冲你的前列腺而去。异物如浪潮般穿过那里，试图向外压迫并撩拨着那处器官；在这股滚烫刺激的回应下，你的身体开始把精液倾泻进尿道，与之对抗。");
         outputText("[pg][say:哈啊，]希拉气喘吁吁地笑道。[say:我能感觉到你的肉棒在抽动，伙计……看来我的高潮找到你里面了？]她无力地把耗尽的尾巴从你体内抽出，让它垂在两腿之间，然后转过身欣赏接下来的烟火。恶魔高潮的后半段沿着你的肉棒滑下，试图尽可能久地把最前端的部分推挤在你的前列腺上，但你的身体最终占了上风；你能感觉到自己不受控制的高潮正把她的高潮逼回你[cock biggest]敞开的末端。恶魔咧嘴一笑，把一只手探到你身下，抚摸着你龟头后方的阴茎下侧；这份刺激将你推过了临界点。你的神经猛然爆发，在第一波之后又送出一股，杂乱而色泽交错的液体呈扇形喷射而出。");
         get_images().showImage("sheila-corrupted-vag");
         outputText("[pg]希拉的双眼因欲望而迷离，她再次转过身，把自己的小穴抬向你的[cockHead biggest]。[say:射进来……]她喃喃道，接着又更大声地说，[say:射到里面！]她现在用两条尾巴引导你的顶端抵住自己的小穴，同时用两根手指分开阴唇，下一团喷射便射进了她体内。黑白交杂的液体从希拉狼藉的小穴里淌出，而你过大的肉棒则不断射进并喷在女人");
         if(get_player().cockTotal() > 1)
         {
            outputText("；没人控制的那");
         }
         if(get_player().cockTotal() == 2)
         {
            outputText("另一根抽动着喷射");
         }
         else if(get_player().cockTotal() > 2)
         {
            outputText("其他几根抽动着喷射");
         }
         if(get_player().cockTotal() > 1)
         {
            outputText("得到处都是，覆盖了她的背、你、草地，以及任何");
         }
         if(get_player().cockTotal() > 2)
         {
            outputText("它们碰巧指向的其他东西");
         }
         if(get_player().cockTotal() == 2)
         {
            outputText("它碰巧指向的其他东西");
         }
         outputText("。你的腰胯本能地想把肉棒往她温暖的穴里顶得更深，却只让她失去平衡，迫使这个恶魔撑到了双手上。高潮渐渐退去时，你的头向后仰起，肉棒也从她的阴户中滑出，把最后一股射在了她的屁股上。");
         outputText("[pg]希拉心满意足地叹了口气，重新站起身来，两种交融的颜色染在她的大腿上。[say: 刚才真是……嗯。我在想，对你来说那感觉是不是也和我一样呢，亲爱的？]她走到你面前，双手捧住你的脸，在你唇上印下一个热烈的吻，然后把你无力的身体放倒在地。[say: 先休息吧，[name]……我很快还想再来一次。]");
         outputText("[pg]你筋疲力尽地昏了过去，脑海里还在想着，她的体液究竟会在你身上造成怎样永久的变化。");
         var _temp_1:* = get_player();
         _temp_1.cumMultiplier = _temp_1.cumMultiplier + 1;
         get_player().orgasm("Dick");
         dynStats(DynStat.Cor(10));
         sheilaCorruption(-10);
         if(get_game().get_inCombat())
         {
            get_combat().cleanupAfterCombat();
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function shielaXPThreeSexyTimePostSexStayII() : void
      {
         clearOutput();
         if(get_player().hasCockThatFits(32))
         {
            get_images().showImage("sheila-vag");
            outputText("她的手滑到你的胯间，克服了那点犹豫，握住你的[cockFit 32]，开始懒洋洋地套动，慢慢把血液重新刺激回其中。[say:我不知道自己这是怎么了，]她咯咯笑着说。[say:也许我只是太贪心了，可是……我还想再要你一次。]她推了推你");
            if(get_player().isTaur())
            {
               outputText("，你便配合地翻身");
            }
            outputText("仰躺下来；希拉把一条腿跨过你的");
            if(get_player().isTaur())
            {
               outputText("腿");
            }
            outputText("，让自己坐到你胯上，并把你的龟头引向她的小穴。它稍稍顶开阴唇，迎来一片温暖的湿意。[say:这……可以吗，[name]？我能进去吗？]");
            outputText("[pg]你与她对视了半分钟，一言不发，只等着看这个女人究竟变得有多饥渴。她的脸涨得更红，一边等你的回答，一边扭动腰肢，用你的肉棒刺激自己，但她的克制很快就崩溃了，身体随之颤抖。[say:对、对不起！我等不了了！]希拉叫道，断断续续地沉到你的肉棒上，用她火热的体内将它紧紧包住。[say:啊、啊、啊！你好舒服。]");
            outputText("[pg]她软倒在你身上，扭动着身子，用你的家伙搅动自己。[say:[name]，你真坏……居然让我求你，]希拉说着，吻了吻你");
            if(!get_player().isTaur())
            {
               outputText("一颗[nipple]的上方");
            }
            else
            {
               outputText("的大腿");
            }
            outputText("。[say:我可得为这事惩罚你一下，你这个坏蛋。]她就这样给自己找了个借口，坐起身来，开始沿着你的[cockFit 32]上下滑动。");
            if(!get_player().isTaur())
            {
               outputText("你的双手几乎不由自主地捏住她的腰，帮着她用力坐下去，她的头也随之向后仰起。");
            }
            outputText("她的");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,760) < 30)
            {
               outputText("小巧乳房在胸腔上方起伏得越来越快，随着她的节奏加快，呼吸也变得短促而浅。");
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,760) > 60)
            {
               outputText("巨大的乳房随着她的摆动剧烈晃荡，在她沉下身时几乎要拍到自己的脸，随后又带着一阵肉波落回原位。");
            }
            else
            {
               outputText("乳房随着她套弄你的肉棒而诱人地颤动着，但你还没来得及想着伸手去抓，她的双手已经捧住并揉抚起它们，玩弄着自己挺立的乳头，引得她连连叹息。");
            }
            outputText("[pg]希拉努力对抗着自己的冲动，想兑现她要“惩罚”你的承诺，可这注定是一场败仗。如今她一边上下抽送，一边让腰部前后滑动，不断调整角度，好在每次沉下去时都让你的龟头顶上她的阴道壁，嘴也始终微微张着。你咬紧牙关，试着承受她用你的家伙挠遍自己每一处痒意的感觉，可你的爱人已经没有半点余裕了。[say:不……不、不要，]希拉呻吟道，[say:太快了！啊，太快了！]");
            outputText("[pg]天啊，这女孩还真是容易满足。希拉的阴道在你的肉棒周围抽搐起来，她的身体大半都僵住，再次向前倒在你身上，用她柔软的头发盖住了你的");
            if(get_player().isTaur())
            {
               outputText("粗壮躯干");
            }
            else
            {
               outputText("胸膛");
            }
            outputText("——可她的腰竟然还在继续抽送。");
            if(get_player().cor >= 90 || get_player().cor > FlagDict_Impl_.arrayReadInt(KFLAGS.flags,760))
            {
               outputText("她小穴里紧绷、起伏的肌肉死死夹住你，几乎把你的鸡巴固定在原处；她还想继续骑乘，却只能让你的肉棒上下抽动，从中挤出前液。[say:好、好满，]希拉呻吟着，[say:你是不是在我里面又变大了？]她深吸一口气，胸膛随之鼓起，坚硬的乳头压进你的[skinfurscales]里。");
            }
            else if(get_player().cor < FlagDict_Impl_.arrayReadInt(KFLAGS.flags,760))
            {
               outputText("她的小穴紧紧夹住你，起伏的肉壁绞得那么紧，要不是你的家伙周围满是滚烫的淫液，她甚至连上下套弄都做不到。[say:啊、啊，]希拉呻吟道，[say:你也动起来！把我干到发昏！]她试着用双手抵住你，想把自己撑回直立的姿势，可几乎连胸口都离不开你——她拼尽力气时，乳头也只是勉强从你[skinfurscales]的表面退开一点。");
            }
            else
            {
               outputText("她的小穴时而喷涌、时而吮吸，尽管她的腰胯还在上下抽动，里面仍拼命想要含住你的鸡巴；那感觉让你几乎发狂。[say:[name]，你这根老二真是太棒了……]");
            }
            outputText("你的鸡巴抽动着胀大，仿佛要回应她的话；你开始射精，骨盆也向希拉顶去。[say:不……拔出来，不然你会让我怀孕的，]她哭喊道，这时");
            if(get_player().cockTotal() == 1)
            {
               outputText("你的鸡巴在她体内抽动");
            }
            else
            {
               outputText("她瞥见第一滴珍珠般的精液从");
            }
            if(get_player().cockTotal() == 2)
            {
               outputText("你那根孤零零、没派上用场的肉棒里溢出");
            }
            if(get_player().cockTotal() > 2)
            {
               outputText("你每一根孤零零、没派上用场的肉棒里溢出");
            }
            outputText("。");
            outputText("[pg][say:你自己来！你在上面！]你回嘴道，硬是凭意志把高潮压住了短短几秒。");
            outputText("[pg]希拉试图把仍在痉挛的小穴从你的肉棒上抬起来，可她也被自己的高潮折磨得浑身发紧。[say:妈的！不行！射在我里面吧，[name]！]听到她的邀请，你的防线彻底崩溃，阴茎将你强忍住的精液喷进你的爱人体内");
            if(get_player().cockTotal() > 1)
            {
               outputText("，随后又有一阵混乱的体外喷射，将黏稠的白浊斑斑点点地溅满她的大腿和小腹");
            }
            outputText("。");
            if(get_player().cumQ() >= 1000)
            {
               outputText("精液一波波从你体内涌出，灌满希拉的小穴，直到她被填得再也容不下，多余的部分被挤出来，把你自己的胯间也弄得黏糊糊一片。");
            }
            get_player().orgasm("Dick");
            dynStats(DynStat.Lib(-2));
            if(get_player().cor >= 90 && sheilaCorruption() >= 90)
            {
               menu();
               addButton(0,"继续",sheilaGoesDemon);
               return;
            }
            outputText("[pg]终于释放完之后，希拉向前滑下，任由你的鸡巴软软地脱出；她的小穴淌出一些你留在里面的精液，在你肚子上晕开一片温热湿润的痕迹。她一遍又一遍地吻你，满足得几乎整个人都在发光，直到这份亲昵终于耗尽，她才从你身上翻下来。你们两人再次并肩躺着，气氛大体上很平静——只是当她紧张地在脑中回想刚才发生的一切时，双手总是不停地伸向自己的小腹。");
            if(get_player().cor < 30)
            {
               outputText("[pg][say:放轻松，]你说着，抓住她其中一只手并轻轻握紧。她转头看向你，琥珀色的眼睛仔细打量着你，过了一会儿，终于回以一个微笑和羞涩的点头。");
            }
            sheilaPreg();
            sheilaCorruptionUpdate();
         }
         else if(get_player().hasVagina())
         {
            outputText("她的手滑向你的胯间，克服了犹豫，将两根手指探进你的[vagina]，刺激着你，迫使你的[clit]重新硬了起来。[say:我不知道自己是怎么了，]希拉紧张地说。[say:我平常不会因为" + get_player().mf("双性人而兴奋，除非对方有根合适的肉棒","女孩而兴奋") + "，但你不一样。我想知道这种感觉到底是什么……]");
            outputText("[pg][say: 当然是爱了，]你回答道，尽管快感让你的身体绷紧，你仍得意地笑着。");
            outputText("[pg]希拉的手停了下来，她一时间显得有些不安，仿佛担心这真的就是答案。[say: 你真这么想吗，伙计？]");
            outputText("[pg]你有些恼火地从她身上退开，坐起身来，然后把这个怯生生的女人推倒在背上。[say: 别老是纠结这个了。有人也想要你，你该高兴才对。]你分开她的双腿，露出她小巧而光滑的阴唇，用一根手指轻轻逗弄，温柔地将其拨开。希拉倒吸一口气，在一波波感觉中绷紧又放松，她的小穴开始往你的手指上淌下透明的润滑液。[say: 既然你能像这样投入进去，那还有什么问题？]");
            get_images().showImage("sheila-lickhergina");
            outputText("[pg][say: 对、对，]她喘息着，又渗出一缕液体。[say: 噢，天啊……操我吧。我不在乎怎么做，求你操我！]");
            outputText("[pg]你微笑着，在她大腿内侧轻轻吻了一下，然后抽回手。");
            if(get_player().isTaur())
            {
               outputText("你转过身，跨坐在她一条腿上，蹲下身让你的[vagina]压在她的胯间。[say: 顶上来，]你命令道，希拉急切地照做，扭动身体，让她兴奋的小穴贴上你的。");
            }
            else if(get_player().hasTailInsteadOfLegs())
            {
               outputText("你把它滑到她身下，轻轻抬起；希拉带着不安的表情配合着你，翻过身来，把小穴翘到空中，而你将自己的小穴抵在她屁股上，尾巴则滑入她两腿之间。[say: 看吧，你只是需要更……灵活一点，]你打趣道。");
            }
            else
            {
               outputText("你用自己的双腿跨住她的腿，把她的小穴压进你的；当滚烫的嫩肉相接时，希拉倒吸一口气，你试探着摆动腰肢，让下方的阴唇彼此摩擦。");
            }
            outputText("[pg][say: 嗯嗯，]她呻吟着，用下身在你身上蹭动。这个女人越蹭越用力，几乎让你失去平衡，同时努力把身体贴得更近。[saystart]要是你能揉揉我的乳房，我会感觉更好，伙计……如果你摸摸它们，我会很开心");
            if(sheilaCorruption() < 30)
            {
               outputText("，哪怕它们又小又不起眼");
            }
            else if(sheilaCorruption() > 60)
            {
               outputText("；可我又担心它们会变得太大");
            }
            outputText("。[sayend]一只手游移到她的乳头上，在她张着嘴时捏住它。她用掌心揉弄着乳头，随后把乳房压向自己的肋骨；她因情欲而起的颤抖透过");
            if(get_player().hasTailInsteadOfLegs())
            {
               outputText("她紧绷的臀瓣");
               outputText("。");
               outputText("[pg]你看着她的不安笑了笑，把双手伸到她胸前，托住她的乳房。[say: 你喜欢别人摸你的胸吗？这会让你觉得自己更像女人吗？]希拉在你的掌握中扭动身体，以再次呻吟作为回答，同时把屁股压向你的[vagina]。");
               outputText("[pg][say: 是、是的，]她承认道，双手覆上你的手，逼着你往下按，同时用大腿夹住你那条沾满淫液的尾巴。");
               outputText("[pg]你加重了自己的摆动，让小穴在她泛红的臀瓣上摩擦。");
            }
            else
            {
               outputText("她滚烫而湿滑的小穴。");
               outputText("[pg][say: 之后再说，]你一边回答，一边把自己的小穴碾上去，[say: 你想让我怎么玩，我就怎么玩。你被我摸那里时会发抖吗？这会让你觉得更有女人味吗？]");
               outputText("[pg][say: 是、是的，]她承认道，再次拨弄自己的乳头，而她的小穴也贴着你的颤动起来。");
               outputText("[pg]你加快了自己摇摆的节奏，用小穴蹭刮着她的阴唇；那双唇如今正大张着吮住你，想把你拉进她体内。");
            }
            outputText("[pg][say:[name]，]希拉喘息着说，[say:你再这样下去，我很快就要高潮了！]");
            outputText("[pg]作为回应，你更用力地朝她顶去，用你的");
            if(get_player().hasTailInsteadOfLegs())
            {
               outputText("尾巴，狠狠划过她的阴唇，沿着那滚烫的入口往上滑，再将它盘回去，好让这段温热、沾满润滑的尾巴在你顶弄她屁股的同时再次掠过。");
            }
            else
            {
               outputText("小穴，把她当成性玩具一样研磨着，追逐着你自己的高潮。");
            }
            outputText("[say:高潮吧！]你命令道，迫不及待想感受她的小穴贴着你痉挛，也迫不及待想感受自己的小穴夹紧她。[say:和你的女同情人一起高潮！]");
            outputText("[pg]希拉的皮肤因羞耻而泛起潮红，身体也僵住了，她的高潮开始爆发。[say:天啊……哦……我真希望你能吻我！]");
            if(get_player().cor >= 90 || get_player().cor > sheilaCorruption())
            {
               outputText("她的阴道可不等什么浪漫，开始痉挛并大张开来，试图把你吸进去，拉扯着你的");
               if(get_player().hasTailInsteadOfLegs())
               {
                  outputText("鳞片");
               }
               else
               {
                  outputText("小穴");
               }
               outputText("，直到你再也承受不住那股热意，也跟着高潮了。");
               if(get_player().hasTailInsteadOfLegs())
               {
                  outputText("她的乳房在你掌中鼓胀起来，她猛地吸了一口气，感受着你的小穴把淫液滴落到她屁股上。");
               }
            }
            else if(get_player().cor < sheilaCorruption())
            {
               outputText("她的阴道可不等什么象征意义，直接倾泻出一波高潮，几乎能听见那股液体拍打在你身上的声响。你的小穴也以自己的高潮回应，开始打湿身下的女人");
               if(get_player().hasTailInsteadOfLegs())
               {
                  outputText("；她像是想把屁股更深地顶进你颤抖的小穴里，连带着她的乳房都仿佛要从你手中挣脱开来");
               }
               outputText("。");
            }
            else
            {
               outputText("她的阴道淌着淫液、阵阵痉挛，比起那些姿态，她更在乎释放，并给");
               if(get_player().hasTailInsteadOfLegs())
               {
                  outputText("你的尾巴");
               }
               else
               {
                  outputText("你自己的小穴");
               }
               outputText("裹上一层新鲜滚烫的体液，也激起了你意料之中的反应。");
            }
            if(get_player().hasCock())
            {
               outputText("你那被冷落的");
               if(get_player().cockTotal() == 1)
               {
                  outputText("肉棒颤抖着喷射起来");
               }
               else
               {
                  outputText("肉棒一齐颤抖着喷射起来");
               }
               outputText("无力地淌出精液，在她皮肤上积成一摊。");
            }
            if(!get_player().isTaur())
            {
               outputText("[pg]你俯下身，小穴仍在高潮中抽搐着，把希拉的头拉到自己面前，轻轻吻上她的嘴唇。她以和她小穴同样的急切迎向你，用那条粉色的小舌探入你的口中，就这样与你唇齿相依，直到她的高潮结束，整个人瘫软在你怀里。你在最后几下抽动中射出，然后把她放到地上，自己也倒在她身边。");
            }
            else
            {
               outputText("[pg]现在来一个好吻听起来确实不错，但远不如用你悸动发热的小穴去摩擦恋人的小穴，尽可能延长这场让全身都颤抖的高潮来得诱人。于是你用重新开始的挺动回应她的请求，惹得这个瘫软的女孩又喘息一声、再次颤了颤。高潮愈发强烈，你的身体也随之发抖，胯间像烧起来一样，在她身上紧缩着喷出淫液。最后，精疲力尽的你把自己放倒在地上。");
            }
            get_player().orgasm("Vaginal");
            dynStats(DynStat.Lib(-2));
            if(sheilaCorruption() >= 90 && get_player().cor >= 90)
            {
               menu();
               addButton(0,"继续",sheilaGoesDemon);
               return;
            }
            outputText("[pg]希拉依偎到你身边，一只手臂搭在你身上。你们就这样躺了一会儿，直到她开口。[saystart][name]……");
            if(!get_player().isTaur())
            {
               outputText("也许我真的爱上你了……[sayend][pg]你翻过身看向她的眼睛，她却又把这个念头抛开了。[say: 逗你玩的，]她说着，微笑着抚摸你的脸颊。");
            }
            else
            {
               outputText("你都没亲我。[sayend]");
               outputText("[pg]你翻过身，看进她的眼睛。[say: 当然不亲，]你回答道。[say: 我可是匹马。]你皱起脸，把嘴唇从牙齿上掀开，尽力模仿出一副马露着牙龈的笑容，逗得她大笑起来。");
               outputText("[pg][say: 该死，快停下！]希拉笑得几乎喘不过气，眼泪都快出来了，而你还把脸往她那边凑。你终于放过她，闭上嘴，等她平静下来后在她脸颊上亲了一下。");
            }
            sheilaCorruptionUpdate();
         }
         else
         {
            outputText("她的手垂向胯间，把中指滑进自己的小穴。[say: 我也不知道自己到底怎么了，]希拉紧张地说。[say: 我甚至不明白，为什么一想到你就会发热……你身上明明没有什么我能用的东西。]");
            outputText("[pg]听到她承认这点，你笑了");
            if(get_player().hasCock())
            {
               outputText("，尽管她嘴上这么说，你仍抚弄着自己那根尺寸夸张的家伙");
            }
            outputText("。[say: 但其实有吧？]");
            get_images().showImage("sheila-masti");
            outputText("[pg]希拉脸上微微泛红，又点了点头，手还在抠弄自己。[say: 可我觉得自己像个蠢货，没来由、没道理地盯着你看得发情；就像个地精什么的，见到谁都会湿。]");
            outputText("[pg][say: 可你还是这样，]你回答道。为了强调你没说出口的意思，你抓住希拉的手，把它从她胯间拉出来，然后把那根手指含进嘴里。你用舌头裹弄着她的手指，希拉随之颤了颤，小穴淌下一滴淫液。你微微一笑，用自己的手替代她的手，探入那湿滑的洞口。她空着的那只手很快按到你的手上，却只是覆在上面，轻抚着你，没有半点阻拦，任由你的手指在她体内进出。她的嘴唇摆出“不”的口型，可发出的却只有一声轻轻的叹息。");
            if(get_player().hasCock())
            {
               outputText("[pg]希拉把手指从你嘴里抽出来，同时朝你挪得更近，让你更好地摆弄她的阴道。那只手");
               if(!get_player().isTaur())
               {
                  outputText("落到你的腿上");
               }
               else
               {
                  outputText("滑到你的双腿之间");
               }
               outputText("，随后一路爬向你的[cock]。她开始抚弄它，起初动作迟缓，可随着一滴前列腺液滑落、打湿她的掌心，她也变得越来越兴奋。[say:怎么了，地精姑娘？]你问道。[say:无论如何都得弄点精液吗？]");
               outputText("希拉被你探入的手指弄得浑身一颤，不由得皱起脸。[say:闭嘴，你个混账，]她反驳道，恼火之下把你的肉棒撸得更用力了些。");
            }
            outputText("[pg]你折腾着她湿透的小穴，手指深深插入，只顾着挑动她的敏感处，同时用掌心爱抚她小巧挺立的阴蒂。每一次触碰，你都在她耳边低声说她是个多么下流的姑娘；她用耳朵弹你作为回应，可你反过来朝那双长长的耳廓吹气、轻咬，惹得她全身发颤。[say:哎呀……看来这个放荡女人的耳朵很敏感嘛，对吧？]你故意拖长音节，让声音贴着她的皮肤震动。很快，希拉便软倒在你身上，把高潮的叫声闷进你的肩头。");
            if(get_player().cor >= 90 || get_player().cor > sheilaCorruption())
            {
               outputText("她的阴道变得滚烫，紧紧夹住你的手指，力道大到你几乎抽不出来再继续揉弄她；你还清楚地看到她的乳房胀了起来——考虑到她之前告诉你的话，这姑且也算是你技巧了得的证明。她们这一族肯定很不擅长假装高潮。");
            }
            else if(get_player().cor < sheilaCorruption())
            {
               outputText("她的小穴涌出清亮的液体，在你手心捧出的凹处积起一汪暖意；她弓起背脊时，你似乎看见她的乳房也微微绷紧了些，不过她抖得太厉害，你也不敢确定。");
            }
            else
            {
               outputText("她的小穴在你指间颤动，你抽出手指，塞进希拉嘴里。她贪婪地吮吸起来，你则挑眉看着她。她又一次脸红了，但显然这并不是她第一次这么做！");
            }
            if(sheilaCorruption() >= 90 && get_player().cor >= 90)
            {
               menu();
               addButton(0,"继续",sheilaGoesDemon);
               return;
            }
            if(get_player().hasCock())
            {
               outputText("[pg]你收回自己的手，按在希拉的手上，逼着这个被高潮弄得神志恍惚的女人继续撸动；她带着歉意地喘了一声，用生硬而无力的动作重新开始。你又急又恼，离顶点也只差一步，于是加快节奏，连腰都顶了起来，几乎是在操她的掌心。你把胯部朝希拉倾去，将肉棒对准她的脸，准备射出；她起初稍稍往后缩了缩，但还是心虚地把嘴凑到你的[cockHead]前，亲吻顶端，用舌头舔弄那道孔口。神经上传来的酥麻把你推过临界点，你抓住她的头按住，将精液射进她的唇间。");
               if(get_player().cumQ() > 1000)
               {
                  outputText("她的嘴很快就被填满，在你的掌控中扭动着，总算勉强转开了头。[say:天啊，不行！]她咳着，吐出足够糊满下巴的精液，而你持续的高潮仍溅在她的脸颊上。");
               }
               if(get_player().cumQ() >= 2000)
               {
                  outputText("仅仅这样你还不满足，又把她的头转向另一边，完成最后的喷射，把剩下的脸也射满，在她挣扎时给她补上了一圈黏糊糊的白胡子。");
               }
               if(get_player().cockTotal() > 1)
               {
                  outputText("另外几股不是从这根肉棒射出的精液也各自尽了装点你情人的职责，把她的头发弄成一团黏滑的乱糟。");
               }
               outputText("在你彻底射空自己时，她从你手里挣脱，侧身避开，把精液呛吐到干草地上。");
            }
            outputText("[pg]那女人虚弱地向后倒去");
            if(get_player().hasCock())
            {
               outputText("，脸上仍然糊着一片片白色黏痕");
            }
            outputText("。[say:操……]她呻吟道。[saystart]你真是个混蛋，[name]。");
            if(get_player().hasCock())
            {
               outputText("我真不敢相信你居然叫我地精，你个王八蛋。");
            }
            outputText("[sayend]");
            outputText("[pg]你");
            if(get_player().hasCock())
            {
               outputText("有时候真不敢相信她居然这么像……不过你");
            }
            outputText("只是笑了笑，拽了拽她的耳朵；她耳朵一抖，从你身边躲开，反手轻轻捶了你肚子一下。[say: 别闹了！]");
            outputText("[pg][say: 你真的这么担心吗？]你问道。没有回答");
            if(get_player().hasCock())
            {
               outputText("，就算希拉擦干净脸、盯着你看之后也没有");
            }
            outputText("，于是你也只是安静地在她身边躺了一会儿。");
            if(get_player().hasCock())
            {
               get_player().orgasm("Dick");
               dynStats(DynStat.Lib(-2));
            }
            else
            {
               dynStats(DynStat.Lust(get_player().lib / 4));
            }
            sheilaCorruptionUpdate();
         }
         outputText("[pg][say: 呃……]希拉打破重新降临的沉默，开口说道。[say: 我们大概该找个地方扎营。我刚才跑的时候，在通往山脉边缘的一处岩石突出下面看见了一个小洞。一个人的时候我没怎么考虑——要是我走神被堵住，就没地方可逃了——但我们有两个人可以轮流守夜，那地方就再合适不过了。你会……留下来陪我吗？]");
         outputText("[pg]你咧嘴一笑，其实早在刚才就已经做出了决定，但还是稍微逗了逗她。你告诉她，你还不太确定。毕竟，她在你面前甚至都不用自己的真名。");
         outputText("[pg]希拉的脸又红了。[say: 我在谁面前都不用！好、好吧……就今晚，但你保证不许拿这个笑我！保证！]她恳求似的看着你的眼睛，然后继续说道。[say: 我的名字是照着一个有名的男人取的，所以对我来说有点太傻了。不过如果你愿意，可以叫我……哈丽雅特。]");
         outputText("[pg]你故作高深地点点头，起身穿衣。希拉，或者说哈丽雅特，也照做了，迅速扭身穿上内裤和短裤，又套上上衣。收拾完毕后，她急切地拽着你前往今晚的住处，帽子攥在手里，肢体动作与其说像个久经风霜的独行猎人，倒更像是第一次约会时兴奋不已的少女。");
         get_player().changeFatigue(-20);
         get_player().HPChange(get_player().maxHP() / 2,false);
         if(get_game().time.hours > 6)
         {
            var _temp_1:* = get_game().time;
            _temp_1.days = _temp_1.days + 1;
         }
         get_game().time.hours = 6;
         statScreenRefresh();
         doNext(playerMenu);
      }
      
      public function shielaXPThreeSexyTimePostSexStay() : void
      {
         clearOutput();
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,761,4);
         outputText("你抓住她的尾巴，让这个本打算独自过夜的女人投来好奇的目光——但那目光并没有拒绝的意思。[say: 怎么了，[name]？]");
         outputText("[pg]你相当大胆地宣称，自己要爱希拉一直到天亮。");
         outputText("[pg]希拉脸红了。[say: 你这呆子……你知道那不是我的真名，对吧？]她在你身边躺下，让你得以把手环上她的腰。[say: 你真的想陪我熬夜吗？]你用一个落在她脸颊上的吻作答，她叹了口气，终于放松地靠进你的怀里。希拉依偎过来，然后转身回吻你。直到许久之后才分开，她轻轻哼了一声。[say: 真奇怪……你让人感觉这么安心，]她说道，接着又有些勉强地补上一句，[say: 我大概只是太寂寞了，对吧？]");
         outputText("[pg]你故意摆出一副受伤的表情，她轻轻笑了起来——但那笑声里似乎藏着什么。她真的是吗？");
         outputText("[pg]她皱起眉，神情也阴沉下来；就连耳朵都耷拉了下去。尴尬地沉默了几秒后，她才回答你。[say: 是的。我是。]希拉摇摇头，然后伸手抱住你。[say: 我不想记起那些……就让我假装我们可以一直这样待着吧，伙计。至少，先这样一会儿。]");
         outputText("[pg]你和这个女人躺在一起，抚摸着她的肌肤，听她轻声叹息、低低哼唱，几乎过了一个小时。就在你觉得该提一下找地方睡觉和安排守夜顺序的时候，希拉的手指开始在你身上游移。[say: [name]……]她低声说道，[say: 我……]");
         outputText("[pg][say: 又发情了？]你善解人意地替她接上。希拉咬住嘴唇，然后点了点头。");
         menu();
         addButton(0,"继续",shielaXPThreeSexyTimePostSexStayII);
      }
      
      public function sheilaXPThreeSexyTimeSex() : void
      {
         clearOutput();
         outputText("希拉看见你的笑容，眼睛一下睁大，随即从你身边退开。[say: 这个，呃……]");
         outputText("[pg]这个撩人的家伙……你灿烂的笑容转为皱眉，然后转身离开。女人发出一声轻轻的呜咽，似乎终于下定了决心。");
         outputText("[pg][say: 好吧，]她怯生生地说着，抓住你的手。你任由她把你拉回去。[say: 你想……做什么，伙计？]");
         menu();
         sheilaXP4Sex(false);
      }
      
      public function sheilaXPThreeSexyTimePostSexLetHerBe() : void
      {
         clearOutput();
         outputText("希拉从你身边离开，收拾好衣服后动身走了，看起来颇为满足。她越过肩头投给你的那一瞥，甚至比之前还多了几分温度。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,761,4);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function sheilaXPThreeSexyTimeGuardDuty() : void
      {
         clearOutput();
         outputText("你抱起双臂，对希拉皱起眉头，但还是答应帮忙。她立刻高兴起来，接着见你没有进一步动作，又露出困惑的神情。[say: 那……]她开口道，[say: 我该做什么？]");
         outputText("[pg][say: 随你觉得怎么做最好，]你回答道，背过身去。[say: 我来留意有没有麻烦；</i>你<i>自己决定怎么摆脱这个。]");
         outputText("[pg]希拉松开你，也转过身去，把腿收在身下，跪坐着思考。你说到做到，扫视着地平线和天空，寻找任何可能构成威胁的东西");
         if(get_player().level >= 8)
         {
            outputText("——你想，这大概也得包括小恶魔，虽然它们比你低了不知多少个档次，简直都像钻到地下去了");
         }
         outputText("。你在那里站了很久，久到差点陷入白日梦，直到一条皮带被小心解开的声音才把你惊醒。重新集中注意力后，你听见希拉粗重的呼吸和她大腿相互摩擦的声音，接着是一只手在皮肤与布料间滑动……看来她已经做出决定了。");
         if(get_player().lib < 40)
         {
            outputText("[pg]好吧，这不关你的事。虽然你不会真的认为这些是色情的环境，但根据她告诉你的，这个选择确实有某种意义。你继续专心致志地监视着平原，试图忽略女性自慰的湿润声音。布料的摩擦声也加剧了，因为另一只手滑进了别的东西里——新的声音似乎与希拉的呼吸同步，每一个声音后面都跟着她呼气时轻柔的“哈啊”声。");
            outputText("[pg]这种状态持续了好几分钟，湿漉漉的声音逐渐盖过其他一切，节奏和音量都不断加快，直到它们突然停下。[say: 嗯嗯……]希拉低声呻吟。[say: 天啊，[name]，你太棒了！]");
            outputText("[pg]好吧，这就太过了。你转过身去；希拉坐在那里，短裤被稍稍拉下，双腿张开，一只手伸在胯间，另一只手粗暴地揉着自己的乳房，正带着惊恐到极点的表情回头看着你。[say: 你刚才——]你才刚开口，就被她剧烈摇头打断了。");
            outputText("[pg][say: 没有！]她尖叫道，完全控制不住自己的音量，断续的高潮把内裤浸湿，她浑身发抖。[say: 当、当然没有！]");
            outputText("[pg]你挑了挑眉，又转过身去，让这个古怪的女孩弄完并穿好衣服；她偷偷摸摸地站起来扣上腰带，然后重重地清了清嗓子。");
         }
         else
         {
            outputText("[pg]有意思的选择……你回头看向她。希拉正坐在那里，短裤稍稍褪下，双腿分开，和你预料的一样，她已经把一只手伸进了内裤。你看着她，另一只手也钻进了上衣下面，指节在布料下清晰地凸起，她开始揉捏自己的乳房。她用力摩擦着，每当挺立的乳头碾过掌心，她都会轻轻呻吟，而另一只胳膊肘在空中微微晃动，两根手指在小穴里进进出出。某一次特别深的插入让她的头向后仰去，眼睛也睁开了——然后，她在与你四目相对的瞬间僵住了。");
            outputText("[pg]你们两个互相盯着看了好一会儿，希拉的脸越来越红，直到你咳了一声打破沉默。[say: 你把内裤再往下拉一点，可能会舒服些，]你建议道。");
            outputText("[pg]这句话似乎冲垮了她心里的堤坝；她睁大眼睛，点了点头，又坐直了身子。你绕到她正面，希拉咬着嘴唇，心虚地移开视线——但还是把湿透的布料从入口处拉开，露出光滑的阴唇。一缕湿润短暂地牵连在她和内裤之间，但随着她重新插入手指，那丝水光便断开了。她撑开自己，再次摸索着自己的入口。[say: 是……是这样吗？]她羞怯地问。");
            outputText("[pg]你赞许地笑了笑。[say: 看起来差不多就是这样。几乎完美了。只差一样东西。]希拉不解地盯着你，手指只是心不在焉地抚弄自己，一边努力琢磨你的意思，直到你");
            if(get_player().hasCock())
            {
               outputText("把骨盆往前送了送");
            }
            else
            {
               outputText("俏皮地吐了吐舌头");
            }
            outputText("。女孩见状咯咯笑了起来，放松下来，终于让自己真正投入到自慰中。");
            outputText("[pg][say: 你说得对，伙计，]她说道，叹息着打了个颤，又开始按摩自己的乳房。[say: 我也想早点弄一个那种东西，可我的供货商一直吊着我。]希拉意识到自己刚才暗示了什么，脸色微微一红，但她很快把这事甩开，又加快了速度，弓起背，手指在体内寻找着最舒服的地方。[say: 啊、啊，天啊……我要去了，[name]！]");
            outputText("[pg]她闭上眼睛，全身绷紧，收拢双腿把自己的手夹在原处，可惜的是，那双覆着赤褐色毛发的修长脚掌挡住了你看她颤抖小穴的视线。高潮袭来时，她的身体几乎蜷成一团，最后缩成胎儿般的姿势，把脸埋在膝盖里，对着自己的皮肤尖叫着宣泄快感，耳朵疯狂地抖动。过了一分钟，希拉终于耗尽力气，舒展开身体，然后乖乖地重新穿好衣服，带着笑意不时瞥你一眼。");
         }
         outputText("[pg][say: [name]，]希拉开口，却没有把话说完。她伸出一只手，你下意识地也伸手想和她握手，直到注意到她指尖上闪着湿润的光。希拉低头顺着你的视线看去，随即一惊，慌忙把液体擦在短裤上。[say: ……真不敢相信我居然做了这种事，]她嘟囔道。[say: 嗯，我现在没事了。再见。]");
         outputText("[pg]你笑了笑，提议再陪她待一会儿，但希拉的脸一下子红得像甜菜，摇了摇头，一句话也没再说就离开了。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,761,4);
         if(get_player().get_lib100() < 40)
         {
            dynStats(DynStat.Lust(5));
         }
         else
         {
            dynStats(DynStat.Lust(15));
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function sheilaXPThreeSexyTimeDitchHer() : void
      {
         clearOutput();
         outputText("你摇摇头，从这个女人身边退开，告诉她她会没事的。[say: 不！]她尖叫道。[say: 你得帮我！]");
         outputText("[pg]你可没有非得这么做。天色越来越暗，你也该回家了，于是你向这女孩告别后离开，任由希拉在身后呼喊你的名字——直到那声音突然戛然而止。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,760,100);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,764,1);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,765,-1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function sheilaXPThreeSexyTime() : void
      {
         clearOutput();
         outputText("你在暮色笼罩的草原中徘徊，趁着阴冷的红月带来夜晚与种种限制之前，懒洋洋地寻找着什么有趣的东西。没什么能引起你的注意，除了地平线上一个圆滚滚的剪影。你一开始还以为那是块石头，没想到你靠近的声音竟让它颤抖起来！它舒展开身体，抬起头转向你，露出灌丛女孩希拉那张涨红的脸。她的目光落到你身上，眼中的恐惧很快变成了如释重负，随即喊出声来。[say: [name]！哦，谢天谢地；求你帮帮我！]");
         outputText("[pg][say: 怎么了？]");
         outputText("[pg]希拉紧紧贴住你，双臂环住你的身体，回答道：[say: 我……小恶魔……有个小恶魔。他偷偷接近我，施了他们常用的那种法术，然后我的身体一下子就软了！我踢了他一脚就跑，可是……可是他还在跟着我！我看见他了……]");
         if(get_player().lib < 50)
         {
            outputText("[pg]小恶魔？真的假的？你的怀疑大概全写在了脸上，因为希拉抱得更紧了。[say: 求你了，[name]！别把我一个人丢下……我不想就因为那家伙走了狗屎运，就被一只小恶魔毁掉！]你一边思索，一边随手把手放在她头上。");
         }
         else
         {
            outputText("[pg]她的身体失控了？真的吗？你用手托住她的下巴，把她的脸抬起来。[say: 只中了一发法术，你就失控了？]你问道。[say: 你该不会一整天都在想着我吧？]希拉的目光飘向一旁，结结巴巴说不出话。猜中了。");
            outputText("[pg][say: 呃……我……昨晚没机会像平时那样发泄一下，]她回答道，脸涨得通红。天啊，这姑娘每晚都自慰吗？她的眼神紧张地四处乱瞟。");
         }
         outputText("[pg][say: 真倒霉，]你说道。希拉又颤抖了一下，把脸藏了起来。");
         outputText("[pg][say: 求你了，伙计，]她哀求道，[say: 帮帮我……我不能整晚都这么跑下去，而且殖民地入口现在肯定已经关了。要是我不能把这股劲儿消下去，找个地方躲起来，我就完了！就算不是那只小恶魔，也会有别的东西找上我！]");
         outputText("[pg]事实上，你倒是能想到几种有心人可以帮上忙的方式……");
         menu();
         addButton(0,"做爱",sheilaXPThreeSexyTimeSex);
         addButton(1,"守夜",sheilaXPThreeSexyTimeGuardDuty);
         addButton(2,"抛下她",sheilaXPThreeSexyTimeDitchHer);
      }
      
      public function sheilaXP4Sex(param1:Boolean = false) : void
      {
         var cock1:Boolean;
         var _g1:SheilaScene;
         var cock:Boolean;
         var _g:SheilaScene;
         if(param1)
         {
            clearOutput();
            outputText("你伸手搂住这位丛林游侠，凑近她。[say:我在想，我们或许可以做爱……有兴致吗？]");
            outputText("[pg]你一边等她回答，一边让手指在她衬衫底下游走，沿着她的背向上摸去，希拉也随之有些坐立不安。[say:色胚，]她低声嘟囔道。[say:我就知道你想要这个。]");
            outputText("[pg]你带着诱惑意味靠近她的长耳，嘴唇轻轻擦过耳缘，逗弄似地问她，这是不是表示不行。");
            outputText("[pg]她微微脸红，带着羞怯的笑望向地面，几乎有些迫不及待地告诉你：[say:我可没这么说……]");
         }
         menu();
         addButtonDisabled(0,"阴茎69","此场景需要你拥有阴茎。");
         addButtonDisabled(1,"69（小穴）","这个场景需要你拥有阴道。");
         addButtonDisabled(2,"操她","这个场景需要你有一根尺寸合适的肉棒。");
         if(get_player().hasCock())
         {
            _g = this;
            cock = true;
            addButton(0,"69（肉棒）",function():void
            {
               _g.consensualSheila69(cock);
            });
         }
         if(get_player().hasVagina())
         {
            _g1 = this;
            cock1 = false;
            addButton(1,"69（小穴）",function():void
            {
               _g1.consensualSheila69(cock1);
            });
         }
         if(get_player().hasCockThatFits(32))
         {
            addButton(2,"操她",consentacleVagSexForKangarooSlutBitches);
         }
         addButton(3,"自慰",sheilaMutualMasturbation);
      }
      
      public function sheilaReconcileKay2() : void
      {
         clearOutput();
         outputText("没过多久，你就在一小片空地上生起了火坑。[say: 啊，经典的荒野剧场，]希拉欣赏着它说道。她动作灵巧地把两块剥了皮、卸下来的兔肉串到一根长棍上，在舔舐的火焰上方旋转。不久，肉汁滴在滚烫石头上的滋滋噼啪声、以及你这位厨子哼唱的简单小调，便充满了空气。你盯着");
         if(get_player().lib < 50)
         {
            outputText("那些招人的大块肉");
         }
         else
         {
            outputText("她上下起伏的胸脯，装作是在看她干活");
         }
         outputText("，直到她偶然抬起头，正好对上你的视线。[say: 抱歉，没有欧芹，]她说着，露出一个浑然不觉的开心笑容。看来她的性情简直天生就适合这种生活方式。");
         outputText("[pg]你满肚子都是问题，想问问她那份蓬勃绽放、讨人喜欢的个性，但还是咬住了嘴唇。先吃东西——你的牙齿都快泡在口水里了。她把烤叉从火上取下来，用一把折叠刀在肉块上戳了几处，检查里面熟了没有，然后把其中一块用小木棍递给你。");
         outputText("[pg][say: 啊，对了，]她忽然说道，掏出一块饼干，也递给了你。你小心接过来；摸起来有点滑。[say: 鱼油饼干，]希拉解释道。[say: 我今早自己做的。要是光吃兔肉，就会头疼得要命，还馋油脂——其实任何瘦肉都差不多。大多数丛林客都是吃了苦头才明白。我厨艺没好到能把它做得好吃，所以先把它咽下去，再放开吃后面的。]你打量着这块又干又腥、毫无食欲的面饼，一口吞下去，然后皱起脸；她则冲你灿烂一笑。尽管这个举动显然出自善意的关心，但她……确实没有把描述说得好听半分。");
         outputText("[pg]你们俩贪婪而沉默地吃光了前半只兔子，毫不客气地从骨头上撕下碎肉；希拉比你先吃完，把后半只兔子串上烤叉，又像刚才那样举到火上烤。你隔着自己那块几乎啃干净的兔肉看向她，把脑子里酝酿好的问题翻来覆去想了几遍。");
         get_player().refillHunger(50);
         outputText("[pg][say: 所以，你和你的朋友们为什么会自己住在这种地方？]");
         outputText("[pg]她停止哼歌，心不在焉地盯着肉看了一会儿，像是在决定要不要回答。那一瞬间，你几乎以为自己永远也别想穿透她这层直来直去的外壳了。");
         outputText("[pg][say: 你说得好像就只有三个爷们儿加本姑娘缩在山洞里取暖似的，]她终于回答道。[saystart]抱歉，我知道我也没说过别的；只是想想挺好笑的。实际上，我们属于一个藏起来的小聚落，有村子那么大，住着十五户以上的人家。我见过的所有像我这样的人，都住在类似的飞地里，由一个兼具政治和半宗教色彩的混球头头领导");
         if(get_player().get_race() == "kangaroo-morph")
         {
            outputText("——我猜你除外");
         }
         outputText("。我们会在事先约好的旧货店和秘密投放点交换物资，但避免把外人带进自己的定居点，哪怕对方是个顶好的人也一样。[sayend]");
         outputText("[pg]你追问她最后那一点。[say: 呃，你不知道的事，恶魔抓住你时你也就说不出来，对吧？]她回答道。[say: 我不知道该不该告诉你这个，不过……另一个原因和我们的身体有关。]她看向你，似乎想从你脸上搜寻某种难以读懂的东西；你一边又嚼了一口肉，一边摆出一副耐心而专注的表情。[say: 你看，我们在某些情况下对情绪非常容易共感，也很容易传导情绪——也就是说，在做爱的时候。]她又移开视线，看向火堆；你凑近观察，发现她居然好像在脸红。[say: 当我们，呃……高潮的时候，]她继续说道，依然没有看你的眼睛，[saystart]我们会根据伴侣的情绪比我们多还是少，从对方那里给予或吸收情绪和感受。比如说，这意味着那些色心上头的家伙");
         if(get_player().lib >= 50)
         {
            outputText("像你一样——我看到你在偷窥了——");
         }
         outputText("会让我们也更色一点，而邪恶的混蛋会让我们也稍微更邪恶一点。我们的身体往往会自行改变，以反映我们被污染的程度……这也等于说，我们之中确实有些可悲的家伙会去撩拨恶魔能量，只为了把自己的尺寸撑大，好配得上他们的自尊心。可要是和恶魔本身的性欲与无底线的贪婪比起来……？[sayend]");
         outputText("[pg][say: 我们本来就算不上人丁兴旺，可他们第一次袭击时，把我们撕得像羊皮纸一样。暴露在外的村子一夜之间消失，只剩下那些由仇外、孤立、痴迷隐蔽的疯子管理的地方。要是你见过不少恶魔，很可能以前就遇到过我那些被同化的同族；哪个倒霉蛋一旦被抓住，只要他或她高潮，被恶魔的情绪灌满，几乎立刻就会转变。]她把剩下的肉从火上拿下来检查，然后分了一半给你。看见你的眼神，她咧嘴一笑。[say: 其实也没那么糟。不幸福的婚姻几乎闻所未闻，因为情侣之间的情绪强度会彼此拉平。有点像“自制灵魂伴侣”工坊，对吧？问题永远都是恶魔。]");
         if(get_game().telAdre.isAllowedInto())
         {
            outputText("[pg]你在这里插话，提起你在沙漠里发现的那座城市。希拉皱起脸，点了点头，然后回答道：[say: 我们前阵子从沙漠附近一个贸易伙伴那里听说了那事。听说他们发现之后，镇民会议上吵得天翻地覆，一半年轻居民收拾铺盖就徒步去了那儿，受够了躲躲藏藏。]她闷闷不乐地嚼着，像是已经预见到了自己故事的结局。");
            outputText("[pg][say: 十个月后，有几个孩子跑了回来……他们离开时才刚开始谈恋爱，可在城里结了婚；其中一个姑娘怀了孕，快要生了，后来被一支狩猎队接了回来。契约组织很早就发现了我们的能力，于是给那些离乡的人施压，要他们繁育新一代，再把孩子交出去接受“正规的公民教育”；压力既有大棒也有胡萝卜。优先住房啦，游手好闲或犯罪可以暂缓起诉啦，你懂的。有些单身汉甚至发誓说，选择独身或离群索居的人会受到微妙的公众谴责——在一个满是妓女、人人都有得爽的小镇里，要形成那种风气再容易不过了。]希拉用力把一块软骨吐到地上。[say: 不知道他们想拿那些娃娃做什么，不过故事传回来之后，我们这个小社群里各种猜测都炸开了锅。至少有个疯子的理论说，契约组织的法师们自己想要一个字面意义上倾倒污秽念头的垃圾场；但更多人觉得，他们只是想把孩子们养得根正苗红，然后把这些孩子配给那些年轻气盛、老是闹事的刺头，一边让他们互相告密，一边用上床把他们收拾服帖。不管真相是什么，我们那个年轻姑娘都不想觉得自己是为了救济金，把自己的小崽子交给契约组织学校；她男人也支持她。所以，那群人那边，对任何不想要孩子、或者想亲手把孩子养大的人来说，差不多就是禁区。]");
         }
         outputText("[pg]她把最后一根骨头丢到两膝之间的地上；而你因为听她讲故事太入神，自己的第二份还没吃到一半。[say: 抱歉啊，你这混蛋，]她笑道，[say: 我是不是用我的伤心故事坏了你的胃口？谁叫你这傻瓜非要问呢。]");
         outputText("[pg]她脸上那抹大大的笑容让你知道她只是在开玩笑。她用烤叉拨散渐渐冷却的火堆，搅开并摊散灰烬。[say: 谢谢你陪我聊。也许还能再见。]她拎起自己的猎物，转身蹦跳着离开了。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,761,2);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function sheilaReconcileKay() : void
      {
         clearOutput();
         outputText("有点新鲜肉吃，听起来确实挺诱人。你朝那个女人点了点头，她便站起身来。[say: 漂亮！帮我个忙，去找点火绒来。]");
         menu();
         addButton(0,"下一步",sheilaReconcileKay2);
      }
      
      public function sheilaReconcileDunWanna() : void
      {
         clearOutput();
         outputText("你抬起双手，掌心向外，表示拒绝。希拉脸上微微泛红，误会了你的犹豫。[say: 嘿，我又不是在撩你什么的。我只是想找个理由自己吃掉半只兔子，就这样。]");
         outputText("[pg]你赶紧组织了几句客套话来缓和尴尬，并向她保证你只是正忙；她似乎平静了下来。你转身回营地时，还能听见她在嘟囔。");
         outputText("[pg][say: 看来今天又得吃破饼干了……]");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function sheilaReconcile() : void
      {
         clearOutput();
         outputText("[say: 哟，是你啊，]一个声音在你身后唱歌似的响起。[say: 又回来啦？]");
         get_images().showImage("monster-sheila");
         outputText("[pg]你迅速转过身，在地平线上寻找声音的来源。你很快就在草丛上方认出了希拉的脑袋和长耳朵——她之前肯定一直躺在那片草里。你简单挥了挥手回应她的招呼，但想起上次那冷淡的接待，还是紧闭着嘴没说话。");
         outputText("[pg][say: 嘿，]她咧嘴一笑，说道。[say: 你学得挺快嘛，伙计。]她身旁的草丛沙沙作响，一只手伸了出来，拎着一捆死兔子，兔脚被绑在一起。[say: 不过蛋白质捐献者我已经有不少了。我刚才只是懒了一会儿，还没决定晚饭吃啥呢，然后你就来了，站在那儿显眼得跟狗蛋似的。]她挠了挠后脑勺，移开视线。[say: 嗯……要不要跟我一起喝杯茶？我之前大概是有那么点没礼貌，而且这也给了我个借口烤一只这小畜生。酒水自带，当然。]");
         menu();
         addButton(0,"好吧",sheilaReconcileKay);
         addButton(1,"不想",sheilaReconcileDunWanna);
      }
      
      public function sheilaReallyMadStandGround() : void
      {
         var _loc1_:* = null as Monster;
         clearOutput();
         if(!get_silly())
         {
            outputText("你把那些动物扔到身后，抱起双臂。");
            outputText("[pg]希拉打了个哆嗦，接着开口说道。[say: 好吧，伙计。如果非得这样的话。]她没什么气势地举起了拳头。");
         }
         else
         {
            outputText("你戏剧性地把那捆东西甩到一边，高声喊出你替身的名字！希拉睁大了眼睛，看着你的身体涌出新的力量；一个幽灵般的另一个自我在你身旁显现，她吓得向后一跳。");
            outputText("[pg][say: 所以……非得变成这样吗？好吧！]希拉一拳举向空中，眼中闪着光，大喊道：[say: 出来吧！“准备好了，世界”！]一道身影从她体内流淌而出，化作一个苗条的深色女人，卷曲的头发几乎像液体一般，身穿宽松背心和鼓起的长袖束腰外衣。希拉朝你扑来，她和她那华丽的替身都向后蓄势，准备挥拳！");
         }
         startCombat(new Sheila());
         if(get_silly())
         {
            _loc1_ = get_monster();
            _loc1_.set_HP(_loc1_.get_HP() * 1.2);
            get_player().changeFatigue(-10);
            get_player().HPChange(20,false);
         }
      }
      
      public function sheilaReallyMadLeave() : void
      {
         clearOutput();
         outputText("你气呼呼地把那些动物扔到地上，转身离开。真是精彩的表演。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function sheilaReallyMad() : void
      {
         clearOutput();
         outputText("灌木丛里一阵沙沙声吸引了你的注意，你转过头，看见希拉突然站了起来。她认出你后眯起眼睛，随即拔腿就跑！");
         outputText("[pg]当然，没过多久她就意识到自己忘了带走猎物；当你捡起那捆猎物递向她时，希拉一脸心虚地小跑回来，在你面前几步远处停下。");
         outputText("[pg][say:我不想和你扯上任何关系，]她闷闷不乐地说着，低头盯着地面。[saystart]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,760) >= 90)
         {
            outputText("我已经越来越难记得自己是谁了，而你留在我体内的污秽，只要你一碰我就会发疯。你想让我四肢着地趴下吗？[sayend]女人伏低身子，跪到地上。[saystart]我求你了。");
         }
         outputText("求求你，求你别再管我了。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,761) == -3)
         {
            outputText("我知道你……你不像这里其他怪物那么坏，所以……求你了。");
         }
         outputText("[sayend]");
         menu();
         addButton(0,"坚守",sheilaReallyMadStandGround);
         addButton(14,"离开",sheilaReallyMadLeave);
      }
      
      public function sheilaPreg() : void
      {
         if(pregnancy.knockUpChance(5,75))
         {
            pregnancy.knockUp(25,72);
         }
      }
      
      public function sheilaPologyFight() : void
      {
         clearOutput();
         outputText("你一言不发，举起你的[weapon]就挥了过去！希拉吓了一跳，及时闪开，随后带着认命般的神情，也举起了拳头。[say: 行吧，我想也该这样。不管你信不信，我真的很抱歉。]");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,761,-3);
         startCombat(new Sheila());
      }
      
      public function sheilaPologyCastArouse() : void
      {
         clearOutput();
         get_player().changeFatigue(15,1);
         outputText("你对那女人点点头，告诉她你原谅她，同时复仇的齿轮却在你内心阴暗的角落里转动起来。她露出笑容，开始如释重负地喋喋不休，而你则把注意力集中到她纤细的身体上，低声念起第一段咒式，准备让她变成神志不清、只会哀求的模样。");
         outputText("[pg][say: ——想谢谢你没有往心里去。我是说……那天确实不太顺，没错，但我真不知道那种感觉离表面这么近，只是被你稍微逗了几下就会失控，你懂吧？]你再次点头，装出理解的样子，同时目光移向那女人的裤裆，口中的祷咒也进入了第二阶段。");
         outputText("[pg][say: 我很高兴你没有记仇，而且……呃，]希拉继续说道。[say: 我、我希望，啊，我们能]——她的膝盖开始发颤——[say: 能从、从一、一开始就好好地呃呃——]");
         outputText("[pg]当你完成法术时，她短裤前襟上浮现出一小片湿痕。[say: 操啊啊啊！]她呻吟着，双腿猛地并拢，整个人瘫了下去。[say: 噢、天啊，发生什么了？我、我真的很抱歉！]");
         outputText("[pg]你装出关切的样子，问她是不是没事。她不好意思地抬头看着你。[say: 我、我不知道！]她呜咽道。[say: 有什么地方不对劲——啊……]希拉的脸刷地红了。[say: ……是我的……身体。]");
         outputText("[pg]她试探性地碰了一下自己，随即又是一阵战栗，整个人都缩了缩。[say: 天啊！啊，我就是突然……好想要！]袋鼠女孩挣扎着站起身。[say: 只要专心想着回家，继续走，我就会……没事的。]");
         outputText("[pg]她颤抖着迈出一步，在你眼前，她短裤的裆部又渗出了一片新的湿痕，随后她再次瘫软下来。[say: 操！] 女孩再次大喊，把手伸向裤子。那只手滑进了她的腰带，她根本无力阻止——她所能做的就是嘴里发出一声轻柔的“啊-啊-啊”。");
         outputText("[pg]你后退一步转身离开，想到这个傲慢女人被你弄成这副模样，嘴角不由得露出笑意。但她在你身后叫住了你。[say:等等！啊——我需要你帮忙……求你了。]你勉强摆出一副平静的表情，回头看向她。[say:我不能……啊——不能让人看到我这副样子……]她继续说道，[say:你、你能不能——啊！]");
         outputText("[pg]你眯起眼睛，问她到底想让你做什么。希拉羞愧地低下头，垂落的头发遮住了她的脸，她只能从发丝下偷偷望着你。你又把问题重复了一遍。");
         outputText("[pg][say:求你……让我跟你做吧！]她脱口而出，随即脸涨得通红。[say:要是我不能把这股劲儿发泄掉，又被恶魔发现的话，我就死定了！]");
         outputText("[pg]真是越来越有意思了。");
         dynStats(DynStat.Lust(get_player().lib / 5),DynStat.NoScale);
         menu();
         addButton(0,"让她来",castArouseAndLetHer);
         addButton(14,"离开",castArouseAndLeaveSheila);
      }
      
      public function sheilaMutualMasturbation() : void
      {
         clearOutput();
         var _loc1_:String = "";
         var _loc2_:Array = [];
         if(get_player().hasCock())
         {
            if(get_player().isTaur() && get_player().get_tallness() * 0.8333333333333334 < get_player().cocks[get_player().longestCock()].cockLength || get_player().hasCock())
            {
               _loc2_[int(_loc2_.length)] = "肉棒";
            }
         }
         if(get_player().hasVagina() && !get_player().isTaur())
         {
            _loc2_[int(_loc2_.length)] = "小穴";
         }
         if(get_player().hasFuckableNipples())
         {
            _loc2_[int(_loc2_.length)] = "乳头穴";
         }
         if(get_player().get_gender() == 0 || int(_loc2_.length) == 0)
         {
            _loc2_[int(_loc2_.length)] = "肛门";
         }
         if(int(_loc2_.length) == 0)
         {
            CoC_Settings.error("");
            outputText("错误——希拉自慰出问题了，哥们");
            doNext(get_camp().returnToCampUseOneHour);
         }
         _loc1_ = _loc2_[Utils.rand(int(_loc2_.length))];
         outputText("你一把夺过希拉的帽子和背包扔到一边，然后把手伸进女孩的衬衫里，用两根手指夹住她的一粒乳头，一边轻咬她的脖子，一边用轻柔的力道将她推倒在地。她叹了口气，把一只手探进衣服里抚上你的手。[say: 啊，]她喘息着，轻轻吐出一口气，[saystart]我们要在草地上做什么呀，[name]");
         if(get_silly())
         {
            outputText("酱");
         }
         outputText("？[sayend]");
         outputText("[pg]你没有回答，手从她的衬衫里抽出来，转而去解她的腰带。腰带松开后，你解开她的短裤，连同内裤一起往下拉，直接从她腿上褪了下来。你把她的爪子从下装里扯出来，又把那些衣物扔到一旁，希拉有些紧张地挪动着身子，夹紧了膝盖。你短暂地把手滑进她大腿间的空隙，摸了一下她的小穴，随后又直起身，剥下她的马甲，把她的衬衫从头上推脱下来，趁着给她脱衣时好好揉了几把她的乳房。等希拉浑身赤裸、满怀期待地等着你时，你站起身，脱下自己的[armor]，随手丢到一边。");
         outputText("[pg][say: 呵呵，]她咯咯笑着，欣赏着你赤裸的身体，也看着你那莽撞地脱掉她衣服、把衣物扔得到处都是的样子。[say: 真棒，衣服到处都是。接下来你还想给我梳头吗？]");
         outputText("[pg]你在希拉身旁躺下");
         if(get_player().isTaur())
         {
            outputText("，把双腿盘在身下，");
         }
         outputText("然后开始");
         if(_loc1_ == "cock")
         {
            outputText("抚弄自己的[cock]，将它对准她，同时把前液抹到手指上");
         }
         else if(_loc1_ == "cunt")
         {
            outputText("把手滑向自己的[vagina]，用两根手指分开阴唇");
         }
         else if(_loc1_ == "nipplecunt")
         {
            outputText("将手指插进自己一粒别扭鼓胀的乳头里");
         }
         else if(_loc1_ == "ass" && !get_player().isTaur())
         {
            outputText("舔湿一根手指，用浅浅的动作逗弄自己的肛门，轻轻绕着那圈褶皱打转");
         }
         else
         {
            outputText("挑逗地吮吸一根手指，用手指抽插自己的嘴，把它裹满唾液");
         }
         outputText("。[say: 哦……你是打算摸我，还是只想玩那个？]希拉咧嘴笑着问道。");
         outputText("[pg][say: 后者，]你狡黠地笑着回答。一次格外深入的抽动让你因期待而浑身一颤，希拉脸上的笑容也渐渐淡了下去。");
         outputText("[pg][say: [name]……]她迟疑地开口。你伸出另一只手打断她，她警惕地把自己的手放了上来。你微笑着把她的手举到唇边，落满亲吻，又用湿漉漉的手指在上面描画。希拉咯咯笑了起来，但笑得很克制，仍然拿不准你的做法。等你玩够了她的手，你便把它塞到她大腿间，托住她的手，强迫她的两根手指插进自己的小穴。[say: 啊、啊、啊啊，]希拉喘息着，[say: 你在做什么？]");
         outputText("[pg][say: 确认你懂得怎么玩，]你逗弄道。[say: 发挥想象力。]希拉因此红了脸，任由你把她的手指越来越用力地送进她的小穴。就在她开始呻吟时，你抽回手，让它回到自己身上继续动作。她的目光沉了下去，但当你");
         if(_loc1_ == "cock")
         {
            outputText("开始套弄自己的肉棒，让前液滴到她的皮肤上，并");
         }
         else if(_loc1_ == "cunt")
         {
            outputText("把手指滑进自己的[vagina]里作示范，并");
         }
         outputText("兴奋地轻叹起来，她便跟着你的动作开始抚弄自己。你一边玩弄自己一边等待，直到她面颊泛红，才俯身过去偷了一个吻。你用舌头撬开她的唇，女孩闭上眼，毫不掩饰地在你口中呻吟；随后你退开，留下她气喘吁吁。[say: 觉得你能用这个创造出自己的幻想世界吗？]你问。");
         outputText("[pg][say: 也许吧，]希拉回答，[say: 如果你亲我这里……或者摸我那里……]她空着的那只手先滑向一边乳房，又滑到腰腹，鼓励你配合她。你把嘴唇落到她胸前，贴在乳头上方一点的位置，同时抚摸着她的肚子。你的手指在她滚烫的皮肤上留下一道道体液的痕迹；她仰起头，胸口向你挺来，修长的脖颈也随之绷起。[say: 啊……啊……对，]女孩有节奏地呻吟着。");
         outputText("[pg][say: 所以，你是打算让我任你摆布吗？]你问道，说完用舌尖含弄她挺立的小乳头。");
         if(_loc1_ == "cock")
         {
            outputText("你把手放回自己的[cock]上，用力套弄，想赶上情人的步调；她压在你唇边的光滑肌肤更催着你继续下去。");
         }
         else if(_loc1_ == "cunt")
         {
            outputText("你再次把手滑到自己的[legs]之间，不甘被希拉抢在前头，一边贴着她的乳房叹息，一边用力揉弄自己的[clit]。");
         }
         else if(_loc1_ == "nipplecunt")
         {
            outputText("你的手回到胸前，滑入乳头内敏感的肉里；一缕湿意从你胸口淌下，你贴着希拉的乳头低吟出声。");
         }
         else if(!get_player().isTaur())
         {
            outputText("你的手伸回被冷落太久的[asshole]，一根手指刺入那处褶口，摩擦着里面的神经，急着让自己的兴奋追上希拉。");
         }
         else
         {
            outputText("看着情人在你身下扭动，你真希望手边能有点什么可以拿来玩");
            if(get_silly())
            {
               outputText("，哪怕只是一枚回形针");
            }
            outputText("。");
         }
         get_images().showImage("sheila-masti");
         outputText("[pg]希拉一边喘息着把手指深深塞进自己的小穴，一边把一只手贴在你的头侧。[say: [name]，只要你愿意这样碰我，我就是你的明星；我会跪下来求你！] 她的手此刻动作变得凌乱，臀部也猛地抽动、扭转");
         if(_loc1_ != "cock" && _loc1_ != "cunt" && _loc1_ != "nipplecunt")
         {
            outputText("，而你的手也加入其中，贴着她的手指一起滑进她的入口");
         }
         outputText("。[say: 只要……说我永远属于你！] 她又把你转向她的脸，与你深深吻在一起，而你的");
         if(_loc1_ == "cock")
         {
            if(get_player().cockTotal() == 1)
            {
               outputText("肉棒开始");
            }
            else
            {
               outputText("肉棒们开始");
            }
            outputText("抽动起来，一股精液射在希拉的腹部和手腕上。少女感受到这股新的热意，贴着你的嘴发出呻吟，身体也在高潮中颤抖起来。");
         }
         else if(_loc1_ == "cunt")
         {
            outputText("小穴抽搐着，");
            if(get_player().wetness() < 4)
            {
               outputText("淫液淌落");
            }
            else
            {
               outputText("潮水喷涌");
            }
            outputText("在你的手上。你的身体颤抖，嘴唇贴着希拉的唇也随之发颤，而她打了个寒战，自己的高潮也开始了。");
         }
         else if(_loc1_ == "nipplecunt")
         {
            outputText("乳头小穴在高潮中紧紧裹住你的手指，将润滑液渗到你的伴侣身上。当你的[breasts]滴下的液珠落到她自己的乳房上时，希拉再次弓起背，自己的高潮也开始了。");
         }
         else
         {
            outputText("手指被她收缩的肌肉拉进阴道，她的高潮也随之开始。");
         }
         if(get_player().cor >= 90 || get_player().cor > FlagDict_Impl_.arrayReadInt(KFLAGS.flags,760))
         {
            outputText("[pg]高潮来临时，她的嘴唇像是要把你的唇吸进去，恍惚间仿佛从时间之初你们就一直这样紧贴着；她吸吮时胸口起伏，你清楚地看见她的乳房鼓胀起来——这让你实在难以忍受，于是用空着的手抓住其中一只用力揉捏。希拉则把舌头更深地探进你口中作为回应。");
         }
         else if(get_player().cor < FlagDict_Impl_.arrayReadInt(KFLAGS.flags,760))
         {
            outputText("[pg]少女失去对肌肉的控制，这个吻也随之中断。她向前倾身，将额头抵在你的额头上，带着微笑和半阖的眼神仰望你的双眼。她又颤抖了一下，而你能感觉到热意涌上脸颊，让脑子发昏；她似乎也在你的怀里蜷缩起来。");
         }
         else
         {
            outputText("她结束了这个吻，把手从自己的小穴里抽出来，捧住你的头；她颤抖着，眼神里也泛起了温柔的爱意。");
            if(_loc1_ == "cunt" || _loc1_ == "cock" || _loc1_ == "nipplecunt")
            {
               outputText("你把积蓄都倾泻一空，任由自己倒进她怀里，把头枕在她胸口。");
            }
         }
         if(_loc1_ == "cunt" || _loc1_ == "cock" || _loc1_ == "nipplecunt")
         {
            get_player().orgasm("Generic");
         }
         else
         {
            dynStats(DynStat.Lust(50));
         }
         if(get_player().cor >= 90 && sheilaCorruption() >= 90)
         {
            menu();
            addButton(0,"继续",sheilaGoesDemon);
            return;
         }
         if((get_player().cor > 90 || get_player().cor > sheilaCorruption()) && sheilaCorruption() >= 80 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,761) != 3)
         {
            sheilaCorruptionUpdate();
            outputText("[pg][say: 天啊，我的奶子！它们看起来简直像是长在某个金发傻妞身上一样！]");
            outputText("[pg]确实很像。你真想一头埋进去再来一次，但最后只是伸手在其中一边上用力揉了一把。希拉的下唇因一瞬间的放纵而微微颤抖，但她还是一把拍开了你的手。");
            outputText("[pg][say: 住手，[name]！你身上到底带着多少恶魔能量？] 你的头好奇地从她那对巨大的胸脯上抬起来，手却又朝它们伸了回去。沉浸在高潮后的余韵里，你甚至想不出这有什么问题——她的话只是在你脑中回响。[say: 我说了住手！我不是你的玩偶娃娃，你也不能想让我的衣服绷得多紧就多紧！我不能一直从你身上吸走堕落，还指望自己能继续跟正常人相处……]");
            outputText("[pg]嗯……正常人到底有什么好的？正常人过的都是无聊又普通的生活。再来一场派对也不会有什么坏处，对吧？来嘛，我们走……");
            menu();
            addButton(0,"听她的",sheilaCorruptionWarningListenToHer);
            addButton(1,"抚摸她",sheilaCorruptionWarningsChooseFondle);
            return;
         }
         sheilaCorruptionUpdate();
         outputText("[pg]希拉抚摸着你的[hair]，你们");
         if(_loc1_ == "cock")
         {
            outputText("躺在那里，盯着你留在她肚脐里的那摊精液");
         }
         else
         {
            outputText("躺在一起");
         }
         outputText("。[saystart]哦，我玩得真开心，伙计。");
         if(get_player().get_gender() == 0 && get_silly())
         {
            outputText("我爱你，我的肯娃娃。");
         }
         outputText("[sayend]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,761) == 3)
         {
            outputText("[pg]她叹了口气，从你身下钻了出来。");
            outputText("[pg][say: 怎么了？]你坐起身问道。");
            outputText("[pg][say: 今晚还得找个地方躲起来，]希拉回答道。[say: 然后明早我就能再去城里转转了。不过，下次我想亲热的时候，我会记得你的。]女孩的脸颊微微泛红。");
            outputText("[pg]咦，她真的打算一个人过夜。");
            menu();
            addButton(0,"任她去",sheilaXPThreeSexyTimePostSexLetHerBe);
            addButton(1,"陪着她",shielaXPThreeSexyTimePostSexStay);
            return;
         }
         outputText("[pg]她在高潮后的柔情里依偎着你，直到她抽身站起。[say: 我也想留下来聊聊，可我的公民义务催着我上路，]希拉带着歉意说道。她收拾起散落的衣服，轻轻挥了挥手，便离开了。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function sheilaLossRapeRouter() : void
      {
         if(!get_player().hasCock() || Utils.rand(3) == 0)
         {
            sheilaForcedOralGeneric();
            return;
         }
         sheilaCowgirlRapesYou();
      }
      
      public function sheilaLetHerFuckYou() : void
      {
         var consensual:Boolean;
         var _g:SheilaScene;
         clearOutput();
         get_images().showImage("sheila-corrupted-prepare");
         outputText("贴在你身上的赤裸肌肤让你的脑海里充满放纵的幻想，而希拉从你失神的脸上把它们看得一清二楚，仿佛你就是一本摊开的书。[say: 那就算你答应了？]她问道，用她铲形尾尖上的裂口在你的手指间挑弄。[say: 还是说你又想让我拿它自己解决？你知道的，我可是很寂寞的。]");
         outputText("[pg]你摇摇头，放松姿态，任由她整条手臂把你完全搂住。[say: 哦，[name]。我就知道你爱我。]她热烈地吻住你，把她");
         if(sheilaCorruption() >= 40)
         {
            outputText("枕头般柔软的");
         }
         else
         {
            outputText("挺翘的");
         }
         outputText("乳房压在你身上。");
         menu();
         _g = this;
         consensual = true;
         addButton(0,"下一步",function():void
         {
            _g.loseToSheila(consensual);
         });
      }
      
      public function sheilaIsSorrySheRapedYou() : void
      {
         clearOutput();
         get_images().showImage("sheila-talk");
         outputText("你在平原上潜行，寻找能填肚子的东西，或是能让你在这片严酷土地上占点优势的玩意儿。你走进一片高草时，身后传来一阵窸窣声；过了好几分钟，你才惊觉那声音和你的脚步并不完全同步。你猛地转身，却发现……希拉正不好意思地盯着你。她这一路都在跟着你吗？你们互相看了好几分钟，谁也没有动作，只是每多一刻沉默，她的脸颊就更红几分。");
         outputText("[pg][say: 呃……你好啊，]她终于鼓起勇气开口了。[say: 在你说话之前，我想……嗯，为之前的事道个歉……]她犹豫了一下，又急促地继续说道。[say: 我当时有点上头了——当然，这不是借口，真的！但我就是想让你知道，那其实不是平时的我，我也绝不会……呃……]");
         outputText("[pg]她的声音渐渐低下去，一只手横过腹部揉着自己的胳膊肘，目光也转向别处。[say: 总之，你能不能给我这个姑娘一次公平机会？]她显然很努力地想表现得谦逊些，只是看起来并不怎么熟练。你要怎么回应？");
         menu();
         addButton(0,"原谅",sheilaIsSorryAndYouForgive);
         addButton(1,"战斗",sheilaPologyFight);
         if(get_player().hasStatusEffect(StatusEffects.KnowsArouse))
         {
            addButton(2,"施放唤欲术",sheilaPologyCastArouse);
         }
         addButton(3,"别烦我",sheilaIsSorryButLeaveMeAlone);
      }
      
      public function sheilaIsSorryButLeaveMeAlone() : void
      {
         clearOutput();
         outputText("你摇摇头，转身离开，用一个明确的手势打发希拉。[say: 喂、喂！]那女孩在你身后恼火地喊道。[say: 该死的，我都说了对不起了，你这混蛋！去你的！看我以后还理不理你！]");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1210,1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function sheilaIsSorryAndYouForgive() : void
      {
         clearOutput();
         outputText("[say: 好吧。]");
         outputText("[pg][say: 啊？就一句“好吧”？]她问道。[say: 你不在意？]你忍住没有当着她的面耸肩。毕竟她光着身子的样子也不算糟，而且那事也有一半是你造成的……不过为了让样子更像那么回事，你还是皱起眉，告诉她你愿意给她一个重新开始的机会。");
         outputText("[pg]她稍稍精神了一些。[say: 太棒了！这下我心里一块石头落地了。呃……不是我想扫兴，但我得把猎物带回家，所以……回头见？]");
         outputText("[pg]你点点头，她便转过身，迈着两条长腿大步跑远了。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,763) > 0)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,761,4);
         }
         else
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,761,1);
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function sheilaGotWhomped() : void
      {
         var dick1:Boolean;
         var _g1:SheilaScene;
         var dick:Boolean;
         var _g:SheilaScene;
         clearOutput();
         outputText("希拉瘫倒在地，");
         if(get_monster().get_HP() < 1)
         {
            outputText("伤得四肢大张");
         }
         else
         {
            outputText("，大腿彼此摩擦，把小穴流出的湿痕抹得到处都是");
         }
         outputText("。当你站在她身旁时，她强撑着用手肘支起身体，试图从你身边挪开，脸上写满了恐惧。[saystart]对不起……求你，不要……");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,761) > -4)
         {
            outputText("别的我都可以原谅你，可是求你，别做这个！");
         }
         outputText("[sayend]她哀求道。");
         if(sheilaCorruption() >= 90)
         {
            outputText("[say: 如、如果你再碰我……天啊，我现在连脑子都转不动了！别这么做！]");
         }
         if(get_player().get_lust() >= 33)
         {
            outputText("[pg]你要趁机欺负这个惊恐的女孩，还是放她走？");
         }
         else
         {
            outputText("[pg]反正你现在也没饥渴到非要趁人之危不可……");
         }
         menu();
         if(get_player().get_lust() >= 33)
         {
            if(get_player().hasCockThatFits(48))
            {
               addButton(0,"操小穴",rapeSheilasCooter);
            }
            if(get_player().hasCock())
            {
               if(!get_player().isTaur() && get_player().shortestCockLength() <= get_player().get_tallness() * 0.35 || get_player().isTaur() && get_player().get_tallness() * 1.2 <= get_player().shortestCockLength() && get_player().shortestCockLength() <= get_player().get_tallness() * 1.55)
               {
                  _g = this;
                  dick = true;
                  addButton(1,"强迫口交",function():void
                  {
                     _g.forcedSheilaOral(dick);
                  });
               }
            }
            if(get_player().hasVagina())
            {
               _g1 = this;
               dick1 = false;
               addButton(2,"强迫舔舐",function():void
               {
                  _g1.forcedSheilaOral(dick1);
               });
            }
         }
         addButton(14,"离开",letSheilaGo);
      }
      
      public function sheilaGoesDemon() : void
      {
         clearOutput();
         outputText("希拉从你身边抽开，背对着你；她安静了几分钟，偶尔发着抖。从她手臂的位置看，她已经又在抚弄自己了！她的手肘不停晃动，脑袋也随之摇晃，一边摆弄着自己的小穴，可最后还是放弃了。[say: 嗯嗯……]女人终于低声说道，[say: ……还不够。我还得再来一次。]她环顾四周，半失焦又狂乱的眼神最后落在你身上，随即站起身，带着显而易见的意图朝你逼近。");
         outputText("[pg]你才刚勉强站直，希拉就又贴了上来；她用被欲望催生出的力气强硬地把你推回去，盯着你。[say: [name]，我脑子还是清醒不下来……我还得再爽一次，所以得借你的身体用用。你没意见吧？]");
         outputText("[pg]你还没来得及回答，希拉就扑到你身上，用大腿夹住了你的脸！她的小穴已经被淫液浸得湿滑无比，毫不留情地在你嘴唇上来回碾磨。[saystart]操……舔我，随便做点什么，在我疯掉之前！快点，你");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,761) < -2)
         {
            outputText("平时不是他妈的总急着想上我吗！");
         }
         else
         {
            outputText("可是我最好的哥们儿！");
         }
         outputText("帮帮忙啊！[sayend]");
         outputText("[pg]你疲惫地伸出舌头，埋进她体内。希拉尖叫一声，喘着气，随后开始挺动臀部，像骑肉棒一样骑在你脸上。她向后仰去，扯得你脖子发紧，硕大的乳房也顺着躯干向上滑动；接着她双手撑住地面，好借力更用力地冲撞。你的双手也顺势托住她的屁股，支撑住她狂乱的挺动。希拉强行用胯下蹂躏你的脸好几分钟，不断用下体撞击你，把你浇得湿透；淫液灌进你的鼻子和嘴里，你甚至能在喉咙深处尝到她的味道。[say: 神啊，]她咒骂道，[say: 为什么就是出不来？！]");
         outputText("[pg]你能感觉到她的胯间在你的舌头周围越来越烫；润滑液此刻不断涌出，顺着你的脸往下流，可希拉还是更加用力地挺动着，为迟迟无法高潮而焦躁不已。[say: 好痒……]她一边近乎失神地抽送，一边呻吟道。[say: 好麻……]她不再支撑自己的身体，开始用手指抓挠自己的耳朵和" + (get_noFur() ? "腿" : "大腿") + "；你向前倾身，缓解这个巨乳女人压在你脖子上的压力，让她的背靠到地上。希拉似乎没有注意到……她正困惑地盯着自己手里一撮撮脱落的毛，已经完全被吸引住了。[say: 这是……我的毛……？]");
         outputText("[pg]她仍像是凭本能一样对着你的脸挺动，同时慌忙抓住自己的耳朵，仿佛只要紧紧捂住就能阻止这诡异的脱毛；可当她松开时，手上已经沾满了松落的赤褐色毛发。她吓了一跳，把那些毛在草地上擦掉，又摸向自己的耳廓……那里已经变得完全光滑，她的表情也只剩下惊恐。接着她的手指移向自己的" + (get_noFur() ? "腿" : "大腿") + "；她不敢置信地把手指插进毛里用力一扯，可结果还是一样：一片裸露的皮肤，以及一把毛发。[say: 不……这是怎么回事，伙计？]她呜咽着，而你却冷酷地玩弄着她的阴蒂，对她身上发生了什么毫不在意。");
         outputText("[pg]她的双腿在你头边猛地绷紧，里面所有肌肉都锁死般变得僵硬。希拉的头向后仰去，你能感觉到她滚烫的小穴紧紧收缩，双脚也蹬进你的背里；脚上的趾甲开始变长、弯曲，在她紧紧夹住你时留下几道浅浅的划痕，而一枚小小的利爪从她脚跟处冒出，不舒服地戳着你。[say: 啊……啊！]她呻吟着，随着新生的变化浑身抽搐；你因疼痛皱起眉头，注意力也有些涣散。[say: 对不起！真的对不起！我控制不住；求你别生气！别停……我需要你！]");
         outputText("[pg]女人短短的尾巴在她哀求时疯狂抽动，脱落的毛洒满你的[chest]，还不断抽打你的手；你抓住尾巴末端，试图压制它，却能感觉到它正在稍稍变长。[say: 我的尾巴……别拉我的尾巴！]希拉哀求着，又一次把小穴往你脸上压来。[say: 这要把我逼疯了！]然而这一切都不是你造成的，那条尾巴仍在继续生长——直到它停下，并淫猥地鼓胀起来。你手里的末端肿起，长出圆鼓鼓的瓣状突起，在皮肤下微微蠕动，仿佛里面藏着什么生物。它再次紧绷起来，希拉在快感中尖叫，皮肤撕裂，她的尾巴一分为二；其中一半随着你的手分离开来，外层皮肤碎裂剥落，连同剩余的毛一起脱下。你小心试探后发现，那已经变成了两条截然不同、纤细的尾巴。它们在她身下摇摆；当她重新对着你的脸抽送时，你看清其中一条与她如今无毛的皮肤颜色相同，另一条则是深得近乎发黑的暗褐色——当它探向你时，那些瓣状突起显现出短短的铲形。末端的一道小缝流出深色油腻的液体，并向你戳来，试图钻进你嘴里；你不得不用一只手挡开它，同时舔吸着面前的小穴，试图让怀里的希拉彻底瘫软下来。");
         outputText("[pg][say: 哦，天啊……对……再伸出来一点，这样我就能蹭到所有舒服的地方！我快到了！]希拉鼓励道，一边揉捏按摩自己的乳房，已经把那些奇异的变化抛在脑后。你试着，");
         if(get_player().tongue.type > 0)
         {
            outputText("把你的口中肌肉一直伸到她小穴最深处。");
         }
         else
         {
            outputText("但你只勉强刮到她的入口；她浑身一颤，似乎对此已经很满足了，从她接下来的话便能听出来。");
         }
         outputText("[say: 要、要去了！终于要去了！]她的大腿夹紧，小穴开始痉挛，胯间一下下撞在你的下巴上。一股黏稠缠人的液体从她的小穴喷进你嘴里，在你舌头上积成一滩；你惊讶之下松开了那条黑色尾巴，它立刻挤进空隙穿过你的嘴唇，释放出某种味道恶劣的东西。你赶紧转过头把它推开；它把剩下的东西全挤在你脸颊上，留下黑色而黏滑的一团。你脑中闪过一些幻想：也用同样的方式坐在她脸上，把她的嘴填满。希拉抽搐完后软倒下来，放开了你，跌在地上。你把嘴里的混合物垂涎般吐到手里；最先感觉到的那股浓稠液体是淡薰衣草色，但随着她尾巴里流出的黑色淤泥渗入其中，它逐渐变成深紫色。混合物彼此黏合，凝胶化，随后凝固成一块不规则而富有光泽的石头——一枚水晶。它在你手中发热，你能感觉到一股撩人的力量正渗入你体内。");
         outputText("[pg]希拉半有兴趣地看着它硬化，但当那团物质不再动弹后，她的注意力便转向了自己变化后的身体。[say: 哦……哦，伙计……你对我做了什么？]她叹息道。你随意瞥了她一眼。她的毛已经完全消失，尾巴也分裂成了两条；她的脚上不再是平直的趾甲，而是伸出一枚枚看上去邪恶的利爪，尽管中间那枚依旧比其他稍大。除此之外，她还是你记忆中那个苗条却巨乳的女人。嗯……她的皮肤也许稍微变深了一点？");
         get_images().showImage("sheila-corrupted");
         outputText("[pg][say: 你看起来没事，]你敷衍地说道，站起身，把新得到的水晶收好。你整理好自己的东西，带着战利品转身离开。");
         outputText("[pg][say: 真的吗？]她急切地在你身后喊道。[say: 下次见面时，你还会跟我做爱吗？因为……你知道的，我随时都可以再来一次？我已经不在乎打猎了……我们可以整天都干个不停！只要能和你在一起！]希拉的声音戛然而止，领域的魔力将你从平原带回了营地。");
         get_player().orgasm("Generic");
         dynStats(DynStat.Lib(-1),DynStat.Cor(3));
         get_player().createKeyItem("Sheila\'s Lethicite",0,0,0,0);
         sheilaCorruption(100 - sheilaCorruption());
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,765,1);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,764,1);
         if(!get_game().get_inCombat())
         {
            doNext(get_camp().returnToCampUseOneHour);
         }
         else
         {
            get_combat().cleanupAfterCombat();
         }
      }
      
      public function sheilaGettingFamiliar() : void
      {
         clearOutput();
         outputText("[say: 嘿，是[name]。]");
         get_images().showImage("monster-sheila");
         outputText("[pg]希拉的声音从你右侧响起。你转过身面对她；这个曾经寡言的女人坐在草地上，暖洋洋地冲你微笑。[say: 你刚好错过饭点了，]她开口道，[say: 可惜。]");
         outputText("[pg]附近看不见篝火，这让你不由得挑了挑眉。[say: 冷午饭，]希拉改口道。[say: 就是面包夹点肉干和水果。你没早点来真是太可惜了，我还挺喜欢我们的烤肉坑呢。]哪怕刚吃过东西，希拉的眼睛还是因食欲亮了起来。");
         outputText("[pg]她对这些简单乐趣近乎孩子气的热情很有感染力，你发现自己也忍不住朝她咧嘴笑了。她把一个小包裹递给你。[say: 我已经逮到够带回去的猎物了，所以我本来留着的点心就给你吧；算朋友价。走运吧？有些日子我从日出一直待到宵禁，都未必能找够。]你接过来打开，看到里面有几片烟熏盐腌肉和蜜饯水果。[say: 我知道，卖相烂透了，]她说，[say: 不过你要是饿了，就尝尝看呗。]");
         outputText("[pg]你在她身旁坐下，挑着吃起她给的东西。她向后躺下，享受着阳光；从她的态度来看，似乎因为你先前纵容了她的贪嘴，她在你身边自在了许多。只要你愿意，现在大概能从她嘴里套出点消息来。");
         menu();
         addButton(0,"常来这儿？",sheilaFriendlyComeHereOften);
         addButton(1,"她的族人",sheilaFriendlyHerPeoples);
         addButton(2,"宵禁？",sheilaFriendlyCurfew);
         addButton(3,"不问了",sheilaFriendlyNoQuestions);
         setExitButton();
      }
      
      public function sheilaGetsRapedWithADildont() : void
      {
         clearOutput();
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,761,-4);
         outputText("看着身下的女人，一个残酷的念头在你脑中成形。你从背包里取出那根荒唐的粉色地精假阳具；希拉认出那东西的地精制式，眼神顿时阴沉下来。她试图从你身边挪得更远些，但你抓住她的腿，冷酷地把她翻了过去，然后将一只手伸到她身下，托起她的胯部，强迫她把屁股翘到空中。");
         outputText("[pg][say: 你在干什么？]她惊慌地问。你无视她，解开她的腰带，把她的短裤和内裤一并拽下；当你把布料从她外阴上拉开时，她不安地扭动起来。[say: 停下，求你了！]");
         outputText("[pg][say: 为什么？]你冷冷地回答。你抓住她的尾巴向上一拽，让女人发出一声尖叫，同时毫无预警地把假阳具捅进她的小穴。");
         get_images().showImage("sheila-dildofuck");
         outputText("[pg][say: 等等！]希拉尖叫道。[say: 拿出去！]你非但没有照做，反而捏了捏玩具，将能激发情欲的地精液体从顶端挤进她体内。你转动着它，把那些药液涂抹到她小穴内壁；很快，她便贪婪地喘息起来，几乎忘了自己原本想逃。你看着她一只手撑着地面，另一只手摸索着自己的乳房……");
         outputText("[pg]看来现在正是抽出来的绝佳时机。你放开希拉，开始往后退——她立刻察觉到了那令人痛苦的空虚。[say: 嗯？你要去哪？喂！]");
         outputText("[pg][say: 回家，]你回答，装作要把玩具收起来。");
         outputText("[pg][say: 你不能这样！你要是把我丢在这儿，我会疯掉的，而且还可能有别的东西找到我！]女人哀求着，竟然手脚并用地向后爬来，用小穴在你身上摩擦。[say: 求你，把它放回去！我求你了！]");
         outputText("[pg][say: 你就这么想要它插在里面？不管怎样都要？]你抚摸着她的屁股，再次把她的尾巴拨到一旁；她颤抖着，急切地对你点头，双眼因药液浸染的欲望而失焦。你再次用粉色假阳具的龟头摩擦她的外阴，把她不断流出的润滑液抹得到处都是；她扭动臀部，试图自己套上去，却只是把它顶开了。");
         outputText("[pg][say: 快点！]她呻吟道。[say: 赶紧塞进去！]");
         outputText("[pg]你在颤抖的女人看不见的地方露出笑容，然后把手臂向后拉开。希拉诱人地冲你摇晃着屁股；你把她的尾巴拽得更高，随后将那枚粉色飞弹送入目的地——正中她的肛口。");
         outputText("[pg][say: 啊啊啊啊！]她尖叫起来，而你用一场缓慢、粗暴、撑开肛门的漫长推进，将那东西一截截强行塞进她体内。[say: 不……不要……不要！]希拉试图从你身边爬开，但你加重了攥住她尾巴的力道，把她硬生生拉了回来，借着这股力把假阳具整根顶进她的直肠。你开始再度将它抽出时，泪水涌上她的眼眶；多亏她慷慨贡献出的润滑液，你才勉强让它从那股摩擦中脱离。她的肛门一定把假阳具夹得很紧，因为当你终于把假龟头拔出来时，一股粉色液体也随之喷出。你用玩具轻轻逗弄希拉的肛门，等待药液再次发挥作用；当她浑身一颤，你便把这当作等待结束的信号。你再次将顶端抵上她的肛口，当它在你轻柔的压力下张开、一抽一抽地容纳整根进入时，你其实还有些惊讶。");
         outputText("[pg][say: 你可真是反复无常啊，知道吗？] 随着你操弄假阳具，在她的直肠里来回抽插，女人的皮肤泛起红潮，轻轻呻吟起来。没过多久，她就像之前被你插进小穴时一样投入，主动把屁股顶向你的手，帮着你操弄她那被撑得大开的肛穴。");
         outputText("[pg][say: 要、要……要去了……] 她呻吟着，仰着脖颈甩动头发。");
         outputText("[pg]你俯身向前，直到脸贴近她耳边，低声说：[say: 光靠肛交就能去？你还真是个荡妇！] 希拉被地精药物弄得神志迷乱，似乎根本不在乎；她抬起一只手贴在你脸旁，凑过来亲吻你的脸颊，同时最后一次把自己沉沉压到假阳具上。");
         outputText("[pg][say: 嗯嗯嗯，] 她呻吟着，贴着你的[skinfurscales]低哼。");
         if(get_player().cor >= 90 || get_player().cor > sheilaCorruption())
         {
            outputText("你的脸因她湿乎乎的亲吻而发烫，而那热度并不全都来自她的嘴。感觉就像她正从你身上抽走能量一样，你甚至敢肯定她的乳房正在变大。");
         }
         else if(get_player().cor < sheilaCorruption())
         {
            outputText("她的嘴唇越来越烫，你的身体一阵发麻；你能看见她一边颤抖着、把口水蹭满你的脸，一边乳房正在缩小——至少从这个角度看起来是这样。");
         }
         else
         {
            outputText("她在肛门高潮中颤抖着，这个吻湿漉漉又下流；她的嘴唇没有停在一个地方，而是带着口水在你脸上到处拖蹭。");
         }
         outputText("[pg][say: 干得好，我的小肛奴，] 你打趣道，同时把假阳具从女人的屁股里拔出来。一股粉色的仿精液随之滑出，和她高潮时从小穴里喷出的液体混在一起。");
         if(get_player().hasCock())
         {
            outputText("[say: 或许下次你会想试试让真正的肉棒插进那里？] 即便她已经精疲力尽，还被地精药物弄得神志不清，她仍有足够的清醒对此摇头。你笑了起来。");
         }
         if(get_player().cor >= 90 && sheilaCorruption() >= 90)
         {
            menu();
            addButton(0,"继续",sheilaGoesDemon);
            return;
         }
         outputText("[pg]你转过身离开那个女人，把用过的假阳具斜斜举在一旁，确保她能一直看见，直到你消失不见。私下里，你也在等着先把它洗干净，再收起来——或者用在自己身上，在脑海里重新回味刚才那一幕。");
         if(get_player().cor >= 90 || sheilaCorruption() < get_player().cor)
         {
            dynStats(DynStat.Cor(-10));
            sheilaCorruption(10);
         }
         else if(get_player().cor < sheilaCorruption())
         {
            dynStats(DynStat.Cor(10));
            sheilaCorruption(-10);
         }
         dynStats(DynStat.Lust(get_player().lib / 3),DynStat.NoScale);
         get_combat().cleanupAfterCombat();
      }
      
      public function sheilaFriendlyNoQuestions() : void
      {
         clearOutput();
         outputText("你决定闭口不言，只是尽量学着她的姿势，在草地上放松下来。太阳很热，但多亏附近一棵大树遮挡，照到这里的角度并不刺人。接下来的四十五分钟里，柔和的阳光几乎让你睡过去，直到同伴开口，把你唤醒。");
         outputText("[pg][say: 咱们刚见面的时候，我还真没看出来你是个这么安静的" + get_player().mf("小伙子","姑娘") + "，[name]……不过跟你待在一起挺安生的。]");
         outputText("[pg]你抬起头看去，发现希拉已经站了起来，正在调整猎物的位置，让它横在肩上方便携带。");
         outputText("[pg][say: 你要走了？]你问道，尽量不让自己听起来像是刚睡醒。");
         outputText("[pg][say: 嗯。]希拉转过身，迈着她那双长腿的步子离开了。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,761,3);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function sheilaFriendlyHerPeoples() : void
      {
         clearOutput();
         outputText("你也在草地上躺下来，把包裹平衡地放在肚子上，问起她的族人。");
         outputText("[pg][say:你还真是一根筋啊，是不是？]她问道。她闭上眼，用鼻子深深吸了口气。[say:我已经把最重要的事都告诉你了……反正你能问到的也就这些了。要是你以为我会说出任何能让你反推出我村子位置的东西，那就别想了。]");
         outputText("[pg]到这份上，她会这么回答也不出所料。你告诉她，你对那方面的情报并没有多大兴趣。");
         outputText("[pg][say:嗯。不知道我是该松口气，还是该觉得受了冒犯。]她转头看向你，正好在你来得及掩饰之前，捕捉到你脸上那副沮丧的表情，随后便玩笑似地捶了你胳膊一拳。[say:哎呀，我就是逗你呢，傻瓜！我想想……你已经知道我们大概会很讨厌你——不是针对你个人，只因为你是外人——所以这方面也没什么好唠叨的。]");
         outputText("[pg]这话里有点让你觉得好笑的地方；你问她，要是他们同族里有人看上了另一个村子的人，他们要怎么避免麻烦。她用手肘撑起身子。");
         outputText("[pg][say:嗯，有些村子确实会不赞成，但就算是我们最固执的队长也明白，我们不需要一群近亲繁殖出来的傻子和病秧子到处乱跑。一般来说，队长们会把两个社群的人口拿来和各自村子的最大承载量对比，然后那对小情侣就去能容纳一个家庭的那边。被连根拔走的那个人一开始会有点难熬，不过……只要你每次胡闹完都会变得更像你的伴侣，用不了多久，那群人就会把你当成他们的女性或男性对应族人接纳了。]");
         outputText("[pg][say:这只会在高潮时发生，对吧？那如果有一方没高潮呢？]你问道。");
         outputText("[pg][say:……倒也不是什么问题，]她思索着回答。[say:要是有一方性冷淡，伴侣就会把自己的一些……呃，多余热情捐给对方。要是两边都性冷淡，那从这个意义上说，他们已经是天造地设的一对了。非性方面的磕磕绊绊，等他们真脱光上阵之后总会磨平的。新婚的还是新婚，鸡巴也还是鸡巴，对吧？肯定会的。]");
         if(get_player().get_femininity() < 35)
         {
            outputText("她心不在焉地看了看你的胯下。");
         }
         outputText("[pg][say:呃，]你插话道。[say:那同性伴侣呢？]");
         outputText("[pg]希拉似乎被这个问题问得有些措手不及，过了一会儿才回答。[say:通常不会发生。我们挺抱团的，队长们也总是在唠叨，说每个年轻人都得生孩子，把家族血脉延续下去。但要是两个小伙子或两个姑娘铁了心，他们也能被说服睁一只眼闭一只眼——前提是其中一人愿意用药剂临时拼出一套能生育的结合方式。也就是所谓的“长出一对”吧。要是两个人都不愿意，那他们就会被冷落了！]看到你惊讶的表情，她又解释道。[say:不是很粗暴的那种；我们总是缺劳力。队长们会给他们安排一块自己的地方，远离那些一心成家的人的喧闹。毕竟很难把一个你看着长大的人直接一脚踢开。而且他们随时都可以改变主意。]");
         if(get_player().lib < 50)
         {
            outputText("[pg][say:还有，]你继续追问，[say:如果恶魔发现一个有迁入者的村子呢？]");
            outputText("[pg][say:嗯……按照约定，通常的做法是一有麻烦的苗头，就把那个可怜的流亡者塞上干粮袋和铺盖卷，从后门送出去。大多数队长会在每个侧翼都保留又长又能折叠的逃生隧道，有人通过后就能把它拆塌，末端也薄到足够一个人自己挖出去；有时候他们甚至会让那个新家庭自己建一条或清出一条。你会惊讶有多少孩子是在半完工的撤离隧道里怀上的——负责挖洞的大家伙趁休息时，把自己的小钻头也派上了用场。]说完这句，希拉冲你露出一个坏得要命的得意笑容，你不禁怀疑她自己是不是也算其中之一。");
            outputText("[pg][say:总之，]她收起笑意，继续说道，[say:只要恶魔还控制着天空、毒害着这个世界，这状况也不比别人更危险多少。]她站起身，拿起那包猎物。[say:你都说得我想回去看看我的族人了，[name]。回头见。]");
         }
         else
         {
            outputText("[pg]你色眯眯地笑着凑近，问出了脑中自然而然冒出来的问题。");
            outputText("[pg][say:所以，要是你们部族里有人爱上了外面的人，会怎么样？比如说，你和我……]");
            outputText("[pg]希拉的脸一下子红了。[say:放屁！你还真把自己当回事了，笨蛋？]");
            outputText("[pg]你装出一副严肃而公正的样子。[say:没有，我只是想知道，要是你决定爱上我，会发生什么。高潮的次数够多之后，你会来和我一起住吗？]");
            outputText("[pg]女孩现在已经红得像甜菜根一样。[say:就、就算我喜欢你，我也不会让我的族人少个帮手。]");
            outputText("[pg][saystart]所以我们就时不时见面，在野外来一场爽翻天的性爱");
            if(get_player().hasCock())
            {
               outputText("，然后孩子由你在家带？还是交给保姆");
            }
            outputText("？[sayend]");
            outputText("[pg][saystart]嗯，我想那样也行");
            if(get_player().hasCock())
            {
               outputText("，然后我就把孩子们交给");
            }
            outputText("——不，我是说，");
            if(!get_player().hasCock())
            {
               outputText("如果我决定");
            }
            else
            {
               outputText("我还没准备好");
            }
            outputText("——呃……去<b>你的！</b>[sayend] 最后这声叫骂，是冲着你爆发出的阵阵大笑来的。[say: 混蛋！]");
            outputText("[pg]她站起身，紧抿着嘴，满脸羞得通红，一句话也没再说，肩上挂着那捆猎物就离开了……但说出口的话，终究是收不回去了。");
         }
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,761,3);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function sheilaFriendlyCurfew() : void
      {
         clearOutput();
         outputText("[say: 宵禁？]");
         outputText("[pg]她转头看向你，用那双浅色眼睛迎上你的目光。[say: 对。我们头儿下令，只要小恶魔团伙在天上出没，从黄昏到黎明所有人都必须进隐蔽所；做好伪装，全部转入地下。在解除之前，谁都不能进出。]");
         outputText("[pg]你指出，就算做了伪装，她也应该能靠地标找到入口位置。");
         outputText("[pg][say: 嗯，是这么回事，]希拉回答道。[say: 问题是入口总会设在一片看起来完全一样的地面中央，哪怕我们得先把那片地清理出来也一样；而且唯一的地标只有入口打开的时候才有——三名守望者会把一扇铺着草皮垫的木门拉到位，晚上绑牢，然后轮班看守到日出。过一阵子还会把它们停用，再填起来。我很清楚，挖掘队现在就有人在一片地里捡石头，好让几年后草长起来时那地方能派上用场；那些石头也会拿来填塞旧隧道和旧房间，因为殖民地会迁移。界域魔法也不是万能的；你要怎么在一片没有路、全是草、什么都分不清的地方，想象出正确的位置还准确到达？就算到了，你又怎么找到那块草皮垫？备用隧道和通风口平时不是塌掉，就是被泥土填死，需要时才清开，而且也在内部巡逻路线之内。就算我找到了其中一个，光靠小小的我也打不开。所以我要是被困在外头，就只能熬一个漫长无眠的夜晚，跟苍蝇一起喝水。吃的倒是不缺……但要是我不想招来一大片鸡巴云从天而降，就不能生火做饭，也不能取暖。]想到这里，她苦涩地笑了笑。");
         outputText("[pg]她的族人一定相当擅长挖地道；这倒是有些奇怪，毕竟至少从她的外表看，她像是被设计来在辽阔开阔的地方奔跑的。");
         outputText("[pg][say: 那还用说！鼹鼠在我们面前都不算什么；我们能直接挖到你脚底下，在入侵部队从你屁股下面冒出来、就地安营扎寨之前，你根本不会察觉，]你提起这点时，女孩骄傲地回答道。[say: 不过你也没说错……我们喜欢地表和阳光；现在挖掘队里没有一个人不在盼着轮换下来，调去狩猎队或作战队的那一天。形势所迫嘛。恶魔袭击时，最早的避难所只有一半在地下，全靠剩下的那些神明保佑才活了下来，但我们也算吸取教训了。]希拉站起身，朝你点点头。[say: 今天就先说到这儿吧……我真的该回去了。以后再来找我，我们可以多聊聊，好吗？]");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,761,3);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function sheilaFriendlyComeHereOften() : void
      {
         clearOutput();
         outputText("你问她为什么这么喜欢待在平原上。");
         outputText("[pg][say: 这——个嘛……]她拖长声音开了口。[say: 也不能说我特别喜欢这里。我只是喜欢不被村里队长管得死死的。倒不是说我不同意他的那些规矩，你懂的，除了他是个该死的铁腕控制狂这点以外。但其他地方现在基本都不让我们去了。]");
         outputText("[pg][say: 我小时候去过一次湖边，那会儿我还没地精高——当然，是在恶魔把那里毁掉之前——那地方可美了。现在可不能去了，满地都是往外渗东西的增生物，还有蓝色怪物拽着人的鸡巴，把人拖进水里淹死。最糟的是那些邪教徒。我有个朋友住在湖对面的村子，以前会拿鱼和他净化过的牧场奶来跟我们交易，对吧？有一天我去交易点找他，结果只有他的厨娘在；我一问，她就一本正经地告诉我，他们的船刚到，就有个穿袍子的蠢货堵在船边，张口就说要以他那蠢货宗教的名义征用那条船。于是我那朋友挥拳就上，结果那家伙用……呃，总之，用一根巨大的橡胶假鸡巴把他们俩都打趴了……等他醒过来时，他整根都已经埋进那怪胎的棕色菊眼里了。顺便说一句，他的女人当时还被捆着在旁边看。]");
         outputText("[pg][say: 到了那时候，他们俩谁也挣不开，那怪胎就一路骑着他骑到了头。]你的同伴说到这里皱起眉，懊恼地咬了咬嘴唇。[say: 他一，咳，射出来，眼神就直接……空了。就像，比修女的下面还空；完全看不出还有脑子。他女人一看到这样，就硬撑着站起来，全速朝那怪胎撞了过去……把他直接撞飞，脑袋磕在码头上昏了过去。之后她设法在码头旁一根老旧开裂的木桩上割断了绑绳，把她男人带回了家，可他现在只会坐在角落里自言自语，拿到什么东西就用来撸他那根老家伙，还管每一样都叫他的“全新终极癖好”——木头、皮带、家里的宠物，什么都行。]");
         outputText("[pg][say: 总之，就是那样——对我来说太危险了。大多数其他地方到处都是恶魔……或者小恶魔；它们要是抓住你，本身也一样糟：没心没肺，一门心思只想着强奸。倒不是说我们从来不会跑那么远，但我们还没蠢到拍拍一个姑娘的背，说声“日安”就让她独自上路。]她为自己的俏皮话笑了笑。");
         outputText("[pg][say: 所以，对我们大多数人来说，还是灌木荒野最合适。豺狼人和萨堤尔虽然凶得很，但只要你能跑能躲，基本也没什么大不了；而且偶尔有小恶魔或恶魔从那支怪异的商队里游荡出来，它们通常也会把对方揍趴下——前提是它们抓得住。]");
         outputText("[pg]解释完毕，她把双手交叠在肚子上，又开始望着云发呆。你陪了她一会儿，然后起身离开。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,761,3);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function sheilaForcedOralGeneric() : void
      {
         clearOutput();
         outputText("希拉又吻了你一次，舌头强行探进你嘴里，同时一只手滑进你的[armor]；面对这突如其来的变化，你惊讶地望进她那满含爱意又饥渴的眼睛。直到");
         if(get_player().hasCock())
         {
            outputText("她的手握住你的[cock]");
         }
         else if(get_player().hasVagina())
         {
            outputText("她的手指滑入你的阴唇之间");
         }
         else
         {
            outputText("她摩挲你光裸的胯间好几秒");
         }
         outputText("，她才从恍惚中回过神；她脸上一红，羞愧地移开视线。她内疚地把手抽了回来，然后开始脱下短裤和内裤。[say: 对、对不起……我不是故意要这么随便的。我会很快结束的。]");
         outputText("[pg][say: 那是——] 你话还没说完，她就突然爬到你身上，把她的小穴送到你眼前");
         if(get_player().get_str() < 61)
         {
            outputText("；她的重量把你慢慢压倒在地");
         }
         outputText("。希拉用那道光滑的肉缝在你的[face]上磨蹭，想让阴唇在你脸上分开；当你的嘴唇擦过她的唇瓣时，她轻轻颤了一下。");
         get_images().showImage("sheila-lickhergina");
         outputText("[pg][say: 舔……] 她低声说，语气几乎像是在道歉，[say: 求你了。不然……不然我就得再打你一次。] 她绷起脸，抓住你一把头发，用力拧住");
         if(get_player().hair.type == 4)
         {
            outputText("；当你的刺针把毒液注入她掌心时，她脸上一红");
         }
         outputText("。你乖乖伸出舌头");
         if(get_player().cor > 60)
         {
            outputText("，这样做与其说是因为那点轻微得近乎玩闹的疼痛，不如说只是你一时兴起，");
         }
         outputText("并用舌尖浅浅探进希拉的小穴。");
         outputText("[pg]你的舌头探进去时，女人微微一颤，却又放松地叹了口气。[say: 这样很好……来吧，伙计，再多舔舔我。] 她把小穴抵在你的[face]上，想把你的舌头含得更深。");
         if(get_player().tongue.type > 0)
         {
            outputText("她提出这个要求时，你脸上掠过一丝狡黠；她注意到了，却还没来得及从你身上下来，你的长舌就猛地探入她体内。在舌头不断伸展时，你抚弄着她入口周围的敏感神经。[say:啊——啊啊！]她呻吟道，[say:搞什么……你的嘴到底是怎么回事？]");
            outputText("[pg]你一边动作，一边有些不满地瞪着她，舌头还伸在她的小穴里，根本说不了话。她在你的注视下脸红起来，随后俯身抱住你，让隔着衬衫的" + sheilaCup() + "乳房蹭过你的头顶。[say:你说得对，伙计……嘴里塞满了还说话是很没礼貌的……啊啊！]她体内一处稍硬的小点引出了最后这声反应；你试探着再次用舌头扫过那里，女人顿时剧烈地颤抖起来。");
            outputText("[pg][say:不、不……你碰到什、什么了？感觉好……]希拉还没能把话说完，你就用口中的探寻者不断进攻这个新发现的位置，而她只能紧紧抱住你的头，像抱着什么传家宝一样。你一遍又一遍地摩擦，可她就是倔强地不肯高潮；到最后，你的舌头都真的又累又酸了，可每当你想把它抽出来歇一歇，她就又拽住你的头发，求你别停，求你再去抚弄那个地方，一次，又一次。");
            outputText("[pg]过了将近一个小时，当你的眼皮因为极度疲惫开始不受控制地合上，甚至正在考虑把她推开逃走时，她终于高潮了。");
         }
         else
         {
            outputText("[pg]你借着更方便发力的姿势，用唾液涂满她小巧光滑的外阴，让舌头从下拖到上，再用宽阔的舌面刮过她的小阴蒂，随后又将舌头向下探去，寻找她的入口。[say:对……]希拉呻吟着，整个人缠在你的头上。[say:对！哦天啊，再用力揉我的小豆豆！]");
            outputText("[pg]你看到了一个轻松脱身的办法，于是照做；她在你身上颤抖、抽搐，骨盆一下下撞着你的鼻子，而你则不停舔弄那颗小小的凸起。女人在你的挑逗和轻扫下呻吟、喘息，到最后，她所有的声音都汇成了一声连绵不断的长吟。她就这样持续了好几分钟，一边无意识地把臀部顶向你的脸，一边任你挑逗她的阴蒂，并把一根手指滑入她的小穴。[say:操——！不、不，太快了！我不想这么快结束！]");
            outputText("[pg]迫不及待想看她高潮，你最后一次滑入她的小穴。");
         }
         outputText("[pg]女人的小穴在她达到高潮时紧紧收缩，");
         if(get_player().cor >= 90 || get_player().cor > sheilaCorruption())
         {
            outputText("用肌肉绞住你的舌头，仿佛要把它锁住，还想把它往里拉。");
            if(get_player().tongue.type > 0)
            {
               outputText("你已经累成这样，便干脆顺着她，让她起伏收缩的肉壁慢慢把你的舌尖往更深处拉去，直到它碰上她的宫颈；你昏昏沉沉地用舌头扫过她子宫的入口，而她则浑身一颤，亲吻着你的头顶。");
            }
            else
            {
               outputText("不过，它并没深入太多；你只是懒洋洋地让舌头在她体内晃动，任她慢慢消化那股情欲。");
            }
            outputText("希拉大声呻吟，你的视野渐渐模糊；透过那片朦胧，你几乎敢肯定，能感觉到她抵在你额头上的乳房正在变得更大。");
         }
         else if(get_player().cor < sheilaCorruption())
         {
            outputText("用她的爱液灌满你的嘴。她的小穴贴得太近，迫使你吞咽下去，你的嘴唇和喉咙也随之发热；当她虚弱地朝你的脸顶动臀部，试图延长自己的高潮时，你越来越希望自己也能回敬她，");
            if(get_player().hasCock())
            {
               outputText("用性器狠狠干她的脸，把一股精液射进她嘴里，再捏住她的下巴不让她张开，直到她不情愿地咽下去。");
            }
            else if(get_player().hasVagina())
            {
               outputText("把你的阴缝蹭在她脸上，直到你高潮，用喷涌而出的雌性淫液淹没她。");
            }
            else
            {
               outputText("逼她用舌头舔你的肛门，直到你高潮，一边扭动身体，一边用你的[butt]把她的头压进草地里。");
            }
         }
         else
         {
            outputText("她温柔地抚摸着你的头，而她的肉壁仍挤压着你的舌头。[say:哦，伙计……]她满含爱意地低语着，彻底忘了这场交欢最初是怎么在挣扎中开始的。");
         }
         if(get_player().cor >= 90 && sheilaCorruption() >= 90)
         {
            menu();
            addButton(0,"继续",sheilaGoesDemon);
            return;
         }
         outputText("[pg]希拉最后抽搐了一下，慢慢与你分开，");
         if(get_player().get_str() < 61)
         {
            outputText("从你身上爬下来，跪在你身旁。");
         }
         else
         {
            outputText("她顺着你的身体慢慢滑下，直到那双长腿再次踏到地面上。");
         }
         outputText("她满足地望进你的眼睛，摩挲着你的脸颊……可随后又猛地一怔，愧疚地移开了视线。[say: 妈的……]她喃喃道。[say: 我又这么做了。明明我都答应过自己不会再……]");
         outputText("[pg]你还没来得及问她是什么意思，她就退开身子，套上了下装。希拉刻意避开与你再次对视，收拾好自己的东西，用那种大步跳跃般的奔跑离你而去；你因方才的折腾而疲惫不堪，试着在脑中琢磨她的话，却越想越乱，最后迷迷糊糊地睡了过去。");
         if(get_player().tongue.type > 0)
         {
            get_player().changeFatigue(15);
         }
         dynStats(DynStat.Lust(get_player().lib / 3 + 30),DynStat.NoScale);
         if(get_player().get_lust() >= get_player().maxLust())
         {
            dynStats(DynStat.Lib(1));
         }
         sheilaCorruptionUpdate();
         get_combat().cleanupAfterCombat();
      }
      
      public function sheilaFirstEncounter() : void
      {
         clearOutput();
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,760,30);
         outputText("一个奇怪的景象映入眼帘，你立刻躲到一丛灌木后，仔细观察起来。" + (get_noFur() ? "你分不清那是动物还是人，只看见人类衣物下面露出一双毛茸茸的腿，还有一条短短的尾巴伸出来" : "它看起来像条狗，不过你只能看见一对毛茸茸的后臀，以及搭在上面的短尾巴") + "。但当你靠近些时，它直起身来，露出了显然近似人形的上半身！那生物似乎穿着一件白衬衫和一件脏兮兮的棕色背心" + (get_noFur() ? "，背上" : "；远看像狗肩膀的部分，其实是") + "背着一个小包。它头上戴着一顶落满灰尘的宽檐软帽，此刻正摘下来给自己扇风。帽子一摘，你便能看见一对红褐色的长耳朵从它的头发里伸出，分别指向两侧。它转身环顾四周时，你甚至能看清一对曲线不错的乳房。你原本以为从背后看见的是" + (get_noFur() ? "动物" : "狗") + "的后腿，其实是" + (get_noFur() ? "" : "一对") + "赤褐色、毛茸茸" + (get_noFur() ? "" : "、趾行") + "的肢体" + (get_noFur() ? "，和你见过的任何动物都不太一样" : "，只是略微像犬类") + "，脚上还有拉长的跖骨。那双兽化的腿只一直延伸到" + (get_noFur() ? "膝盖" : "大腿") + "的位置；再往上，你能看见皮肤在毛发和她那条用来遮住剩余臀部的极短短裤之间露出一截。她的胯部比腰略宽，那条短而渐细的尾巴从布料的破口中伸出，就在系住短裤的腰带下方。");
         menu();
         addButton(0,"凑近看看",sheila1ndEncLookCloser);
         addButton(1,"继续躲着",sheila1stEncStayHidden);
      }
      
      public function sheilaEncounterRouter() : void
      {
         spriteSelect(SpriteDb.get_s_sheila());
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,858) > 0)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,858,0);
         }
         if(sheilaCorruption() >= 100 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,764) == 0)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,764,1);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,764) == 1)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,761,4);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,764) == 0)
         {
            if(pregnancy.get_isPregnant() && pregnancy.get_incubation() == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,761) >= -2)
            {
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,763) == 0)
               {
                  normalSheilaPregNotifNumberOne();
               }
               else
               {
                  normalSheilaPregNotifREPEATEDED();
               }
               return;
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,761) == 0)
            {
               sheilaFirstEncounter();
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,761) == -1)
            {
               sheilaApology();
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,761) == -2)
            {
               sheilaIsSorrySheRapedYou();
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,761) == -3 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,761) == -4)
            {
               sheilaReallyMad();
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,761) == 1)
            {
               sheilaReconcile();
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,761) == 2 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,761) == 3 && get_game().time.hours != 20)
            {
               sheilaGettingFamiliar();
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,761) == 3 && get_game().time.hours == 20)
            {
               sheilaXPThreeSexyTime();
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,761) == 4)
            {
               fuckBuddySheilaMeeting();
            }
            else
            {
               outputText("出 BUG 了。YOUR SHEILA_XP: " + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,761) + "。<b>数值应在 -3 到 4 之间。</b>");
               doNext(get_camp().returnToCampUseOneHour);
            }
         }
         else if(pregnancy.get_isPregnant() && pregnancy.get_incubation() == 0)
         {
            demonImpChildren();
         }
         else
         {
            demonSheilaEncounter();
         }
      }
      
      public function sheilaCup() : String
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,760) < 10)
         {
            return "极小，那还用说吗";
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,760) < 20)
         {
            return "A罩杯";
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,760) < 30)
         {
            return "B罩杯";
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,760) < 40)
         {
            return "C罩杯";
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,760) < 50)
         {
            return "D罩杯";
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,760) < 60)
         {
            return "DD罩杯";
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,760) < 70)
         {
            return "E罩杯";
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,760) < 80)
         {
            return "EE罩杯";
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,760) < 90)
         {
            return "front-running";
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,760) < 100)
         {
            return "FF罩杯";
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,760) < 110)
         {
            return "G罩杯";
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,760) < 120)
         {
            return "GG罩杯";
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,760) < 130)
         {
            return "H罩杯";
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,760) < 140)
         {
            return "HH罩杯";
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,760) < 150)
         {
            return "\'Holy Honkin\' Hooters!\'罩杯";
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,760) < 160)
         {
            return "I \'want to squeeze them\'罩杯";
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,760) < 170)
         {
            return "II罩杯";
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,760) < 180)
         {
            return "Jiggle罩杯";
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,760) < 190)
         {
            return "JJ罩杯";
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,760) < 200)
         {
            return "K罩杯";
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,760) < 210)
         {
            return "KK罩杯";
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,760) < 220)
         {
            return "L罩杯";
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,760) < 230)
         {
            return "\'Ladylove\'罩杯";
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,760) < 240)
         {
            return "M罩杯";
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,760) < 250)
         {
            return "\'Mega Milk\'罩杯";
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,760) < 260)
         {
            return "N罩杯";
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,760) < 270)
         {
            return "NN罩杯";
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,760) < 280)
         {
            return "O罩杯";
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,760) < 290)
         {
            return "\'so big it makes you say\' OO罩杯";
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,760) < 300)
         {
            return "P罩杯";
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,760) < 310 && int(get_player().cocks.length) > 0)
         {
            return "\'would feel great around your\' PP罩杯";
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,760) < 310 && int(get_player().cocks.length) == 0)
         {
            return "PP罩杯";
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,760) < 320)
         {
            return "Q罩杯";
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,760) < 330)
         {
            return "QQ罩杯";
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,760) < 340)
         {
            return "R-u-serious?罩杯";
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,760) < 350)
         {
            return "RR罩杯";
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,760) < 360)
         {
            return "S-rank";
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,760) < 370)
         {
            return "\'Shooting Star\'罩杯";
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,760) < 380)
         {
            return "T罩杯";
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,760) < 390)
         {
            return "\'damn, those are some big\' TT罩杯";
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,760) < 400)
         {
            return "\'bigger than\' U罩杯";
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,760) < 410)
         {
            return "UU罩杯";
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,760) < 420)
         {
            return "V罩杯";
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,760) < 430)
         {
            return "\'Va-Va-Voom\'罩杯";
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,760) < 440)
         {
            return "\'War Head\'罩杯";
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,760) < 450)
         {
            return "World罩杯";
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,760) < 460)
         {
            return "X-Buster罩杯";
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,760) < 470)
         {
            return "XXXX罩杯";
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,760) < 480)
         {
            return "\'Yay\'罩杯";
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,760) < 490)
         {
            return "YY罩杯";
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,760) < 500)
         {
            return "Z-Saber罩杯";
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,760) < 510)
         {
            return "ZZ罩杯";
         }
         return "他妈的魔法";
      }
      
      public function sheilaCowgirlRapesYou() : void
      {
         clearOutput();
         outputText("希拉使劲推着你，你任由她把你逼倒在地，又让你仰面躺下");
         if(get_player().isTaur())
         {
            outputText("；你的蹄子别扭地歪向一边");
         }
         outputText("。她满脸通红，不肯与你对视，但这并没有妨碍她一气呵成地脱下背心和衬衫，露出她" + sheilaCup() + "的胸部。[say: 摸、摸我，]她命令道，[say: 揉我。]她像是才想起来似的，又补了一句：[say: 拜托。]");
         outputText("[pg]你把手移到她光滑的肌肤上，双手各捧住一只");
         if(sheilaCorruption() < 30)
         {
            outputText("小巧的");
         }
         else if(sheilaCorruption() > 70)
         {
            outputText("硕大的");
         }
         outputText("乳房，轻轻揉捏着，并用拇指摩挲她硬挺的乳头。希拉在你把玩她身体时微微发颤，她把手覆在你的手上，引导你摸向她最喜欢的地方。你看着她呻吟；当她仰起头时，你们的目光撞在一起，她立刻克制住自己，又把视线移开。[say: 别盯着我看……]");
         outputText("[pg]希拉急于避开你那张好奇的脸，于是把你的手从她胸前推开，转向你的胯间。她");
         if(get_player().isTaur())
         {
            outputText("把你的双腿分开");
         }
         else
         {
            outputText("解开并脱下你的[armor]");
         }
         outputText("，露出你的[cocks]；");
         if(get_player().cockThatFits(32) < 0)
         {
            outputText("当[eachcock]弹出来时，她瞪大了眼睛。那半勃起的怪物般肉棒让她满心懊恼。");
            outputText("[pg][say: 该死！]她喊道，一拳砸在地上。[say: 又是个下半身比脑子还发达的混蛋……你还指望自己能好好爱女人吗？]");
            outputText("[pg][say: 有问题吗？]你无辜地问。");
            outputText("[pg]希拉咬住嘴唇，点了点头。[say: 我根本塞不进去……我用不了它。]");
            get_images().showImage("sheila-vag");
            outputText("[pg]更准确地说，她的意思是自己想象力不够，不知道该怎么用它？希拉似乎从你眼里看出了几分你暗自的轻蔑，于是绷紧了下巴。[say: 好吧，]她语气不善地说，[say: 我接受挑战。]这个女人解开腰带，像刚才脱上衣时一样匆忙地脱下短裤和内裤。她的内裤轻易就脱了下来，几乎没怎么黏住——或许她打算用意志力弥补自己兴奋度的不足？希拉又把你的背按平在地上");
            if(get_player().isTaur())
            {
               outputText("，或者至少尽量按到平");
            }
            outputText("，然后坐到你的肚子上");
            if(get_player().isTaur())
            {
               outputText("，把她修长的双腿滑进你的腿间");
            }
            outputText("。她慢慢向前挪动，当小穴贴上你滚烫充血的肉棒时，她不禁倒吸一口气。");
            outputText("[pg][say: 啊……啊。还、还不错，]她叹息道。她用大腿轻轻夹住你的[cock]，开始上下挪动，摩擦着自己。她双腿间的空隙几乎正好合适；当她夹紧你时，你也忍不住呻吟起来。[say: 所以，]希拉颤抖着低声说，[say: 你很享受，是吧？]");
            outputText("[pg]你喘着气表示认同，臀部也开始挺动，帮着增加刺激；你的");
            if(get_player().isTaur())
            {
               outputText("前腿亲昵地搭在她的躯干上");
            }
            else
            {
               outputText("双手摸索着找到她的乳房，抚弄揉捏着");
            }
            outputText("，而她的喘息和你脑中的画面都变得越发强烈。希拉用自己的手抓住其中一只，拉到嘴边，覆满亲吻");
            if(!get_player().isTaur())
            {
               outputText("，还吮吸你的手指");
            }
            outputText("。[say: 噢……[name]……]");
            outputText("[pg]你哼了一声作为回应，太过沉浸于在她温暖、沾满淫液的大腿间挺动，根本说不出完整的话。[say: [name]……我、我要……高潮了！]希拉尖叫道。");
            if(get_player().sens >= 50)
            {
               outputText("[pg][say: 高潮吧！]你命令道，自己也已经接近高潮。");
            }
            else
            {
               outputText("[pg]什么？！你甚至还远没到射出来的时候！");
            }
            outputText("希拉颤抖着向后仰去，头发垂落下来，臀部猛地一挺，大腿紧紧夹住你的肉棒。");
            if(get_player().cor >= 90 || sheilaCorruption() < get_player().cor)
            {
               outputText("你能感觉到，她的小穴在你肉棒上摩擦的那一处正逐渐发热……几乎同时，其他部位却像是在冷却。骑在你身上的女人弓起背，猛地倒吸一口气，她的乳房似乎占据了你的整个视野，胀大起来——不过也可能只是角度造成的错觉。");
            }
            else if(get_player().cor < sheilaCorruption())
            {
               outputText("她高潮涌出的淫液沾湿了你的肉棒，将它覆上一层液体。希拉在你的肢体间把自己缠得更紧，把乳房压在胸前；而当她过剩的情绪让你的脑袋一阵发蒙时，你仿佛能感觉到它们稍微变小了一点。");
            }
            else
            {
               outputText("高潮时她的臀部僵住不动，只留下你自己努力寻求释放，而她在你的肉棒周围逐渐发热。");
            }
            if(get_player().sens >= 50)
            {
               outputText("[pg]她大腿间温热、光滑、湿润的触感足以引出你自己的高潮，[eachcock]终于释放，将团团精液喷向空中，雨点般落在你们交缠的身体上。希拉看着你把污浊的精液涂满她的腹部，笑出了声，还用一只手调皮地抚弄你敏感的[cock]，帮你把精液从根部一路挤上来，令你浑身发颤。");
               if(get_player().cumQ() >= 2000)
               {
                  outputText("然而，咯咯的笑声和抚弄远在你的高潮结束前就停下了；到最后，希拉只是躺在那里，目瞪口呆地看着你把一层又一层白色网纹洒在她的皮肤上。[say: 见鬼，]她含糊地嘟囔着，不知是清醒得发愣，还是被眼前的景象灌醉了。");
               }
               outputText("等精液之雨渐渐停歇，她才从你身上分开，浑身黏滑，还在滴落。");
               if(get_player().cor >= 90 && sheilaCorruption() >= 90)
               {
                  menu();
                  addButton(0,"继续",sheilaGoesDemon);
                  return;
               }
               outputText("[pg][say: 那么……这感觉怎么样？]希拉笑着在草地上清理自己，然后拿起自己的东西离开，留下你靠睡一觉来缓过疲惫和败北感。");
               get_player().orgasm("Dick");
               dynStats(DynStat.Sens(1));
               get_combat().cleanupAfterCombat();
            }
            else
            {
               outputText("[pg]你猛烈地挺动，想把自己推过临界点，可希拉的高潮已经开始退去——她往上挪了挪，把小穴从你仍在摩擦、饱受折磨的肉棒上移开，只留下你独自陷在痛苦的空虚感里。");
               if(get_player().cor >= 90 && sheilaCorruption() >= 90)
               {
                  menu();
                  addButton(0,"继续",sheilaGoesDemon);
                  return;
               }
               outputText("[pg][say: 你在干什么啊，伙计？你又要把我弄得兴奋起来了！]");
               outputText("[pg]她回头看向你，而你脸上那副难受的表情已经说明了一切。她眼中闪过一丝恶作剧般的光，俯身凑近你。[say: 我早就说过了，像你那样的大家伙可不适合拿来疼女人，]希拉一边说，一边在你胸口画着圈。[say: 这也怪不了别人，只能怪你自己，对吧？]");
               outputText("[pg]你的伴侣从你身上离开，站起身来；你仰躺着，看她重新穿好衣服。临走前，她又最后一次揉了揉你的[cock]，正好在龟头下方的位置，随后便迈着弹跳般的步子跑开了。");
               if(get_player().get_HP() < 1)
               {
                  outputText("[pg]疲惫与欲望在你脑海中拉扯，但最终你还是陷入了昏睡，脑中被那柔软湿润的肌肤记忆折磨着。");
               }
               dynStats(DynStat.Sens(3),DynStat.Lust(50 + get_player().lib / 10),DynStat.NoScale);
               get_combat().cleanupAfterCombat();
            }
         }
         else
         {
            outputText("你俯身去看她的表情时，能看到她眼中闪着欲望。希拉用余光注意到了你，脸又红了起来。她转过身，背对着你。");
            outputText("[pg][say: 我是认真的……看别的地方去！]");
            outputText("[pg][say: 那我该看哪儿？]你一脸无辜地问。");
            outputText("[pg]希拉的耳朵竖了起来，但她没有回答，而是");
            if(get_player().cockTotal() > 1)
            {
               outputText("分开并且");
            }
            outputText("抚摸着你的[cockFit 32]。一滴前列腺液渗了出来，她用空着的那只手的食指碰了碰，让你浑身一阵酥麻；她把手指抽开，带出一缕滑腻的水丝。希拉将那根手指从胸乳之间划过，把液体擦在胸口上，身体微微一颤。这一幕对你来说实在太过刺激，你伸出手，悄悄绕到她腰间，摸索着直到够到她的皮带扣。你开始解开它时，女孩轻轻叹了口气，可一个突如其来的念头又把她拉回现实——她猛地抓住了你的手。");
            outputText("[pg][say: 你在干什么？]她尖叫一声，震惊地盯着你。你毫不退让地回望着她，直到她终于败下阵来，移开了视线。");
            outputText("[pg][say: 这……我们又不是恋人！]希拉结结巴巴地说。[say: 别想怎么脱我衣服就怎么脱！]");
            outputText("[pg][say: 抱歉，]你回答道，[say: 你只是准备去游泳吗？这不就是你想要的吗？]你再次动起手来，完全没被她那点微弱的抵抗吓退。");
            outputText("[pg][say: 我想要的……]希拉话说到一半停住了；她挣开你的手站起身，短裤还半解着。[say: 好吧！既然你非要看，那就看吧！]她飞快地解开皮带，把下装褪到地上，接着又更小心地脱下内裤。[say: 给你看！]");
            if(get_player().lib < 25)
            {
               outputText("[pg]你没有去看她的小穴，而是继续盯着她那张心虚的脸。希拉的嘴唇发颤，眼眶也湿了；在你一刻不停的注视下，她的意志仿佛快要崩溃，几乎就要哭出来。[say: 求你……]她难过地呜咽着，[say: 别再那样盯着我看了。]");
               outputText("[pg][say: 可你不也只是想利用我的鸡巴吗？]");
               outputText("[pg][say: 不，我是……]她皱着眉试图辩解，随后却认输般垂下肩膀。[say: 你说得对。这样不对。对不起。]希拉转过身，安静地把短裤拉回去，扣好皮带，然后找到上衣，套过胸口。她收起剩下的东西，回头看了你一眼，随后迈步离开。你精神亢奋又百感交集地目送她远去——偏偏她把衬衫拉下、盖过那片泛红冒汗的后背的画面，深深留在你脑海里，挑逗着你，让她离开许久之后你的肉棒依旧硬挺着。");
               dynStats(DynStat.Lib(1),DynStat.Lust(70));
               get_combat().cleanupAfterCombat();
               return;
            }
            outputText("[pg]她柔软的白色内裤贴在小穴上，被她拉开时仍黏连着；凑近一看，原因便很明显了——她的小穴覆着一层润滑的水光，昭示着它早已准备妥当。那股气味飘到你鼻尖，你的鸡巴顿时充血膨胀，痛苦地变粗变硬。");
            outputText("[pg][say: 混蛋，]希拉压低声音骂道，而你的身体又挤出一滴前列腺液。[say: 你明明想要……我就知道。]");
            outputText("[pg]你再次抬头看向她的脸，露出一抹狡黠的笑。[say: 只是自主反应，我发誓。]");
            outputText("[pg]她皱起眉，跨坐到你的胯上");
            if(get_player().isTaur())
            {
               outputText("，把你的双腿分开");
            }
            outputText("；她看着你的脸，皱眉渐渐变成了调皮的坏笑。希拉转过身去，把背对着你。[say: 要怪就怪你自己，盯着人看可不礼貌，]她咯咯笑着，悬在你的[cockHeadFit 32]上方。她伴着一声清晰的叹息沉了下来，用你的顶端分开她湿滑光洁的阴唇，将你" + Utils.num2Text(Math.round(get_player().cocks[get_player().cockThatFits(32)].cockLength)) + "英寸的长度吞了进去。[say: 噢……]希拉呻吟道。她把一只手伸到你的胯下，想确认你的肉棒还剩多少没进去，却在发现自己第一下就把整根都吞下时微微一惊！");
            outputText("[pg][say: 看来不只是我一个人啊，]你轻声调侃。希拉的脖颈红了起来，但她只是开始摆动臀部，什么也没说。她短短的尾巴在空中晃动，随着她套弄你的肉棒，在你腹部拍打出一阵节奏");
            if(!get_player().isTaur())
            {
               outputText("，而你的双手按上她的腰，急切得几乎是把她推起，又狠狠压回去");
            }
            outputText("。这场交合变得越来越湿、越来越快，她仰头摇晃，头发垂落在肩头，背部肌肉随着她的动作起伏绷紧；每当她落下，让你的颈部擦过她外阴上的敏感点时，她的耳朵都会轻轻一颤。");
            outputText("[pg]刺激实在太强烈了，在某次下压时，你顶端发麻的神经引爆了高潮，你无声地射进这个分神的女人体内；她还忙着套弄自己湿透的小穴，完全没察觉多出来的湿意。她呻吟着喘息，用两根手指揉搓阴蒂，也开始抽搐起来，用越来越黏滑的小穴凌乱地干着你。");
            if(get_player().cor >= 90 || get_player().cor > sheilaCorruption())
            {
               outputText("你能感觉到她被爱液浸得滑腻的内壁在吸吮你；她开始高潮时，你的脑袋反而清醒了些，一边把精液射进她体内，一边想着她什么时候才会同样回过神来。");
            }
            else if(get_player().cor < sheilaCorruption())
            {
               outputText("她的小穴随着高潮喷涌，把你的精液挤出来，浸湿了她内侧的阴唇，可她仍在骑着你的肉棒；你的意识变得模糊，脑中几乎只剩下一个念头：尽可能把更多精液偷偷射进她体内。");
            }
            else
            {
               outputText("即使她失神地高潮着，不知为何你还是忍住了自己的呻吟，心想着她要多久才会发现自己的小穴正被你追逐卵子的精子灌满。");
            }
            if(get_player().cumQ() <= 250)
            {
               outputText("希拉即使高潮了也仍在摆动臀部，沉溺在快感之中；在一次抬得格外高的时候，你的肉棒滑了出来，射出一道精液，落在");
               if(get_player().tail.type > 0)
               {
                  outputText("你的尾巴");
               }
               else
               {
                  outputText("草地");
               }
               outputText("上，她的眼睛顿时睁大了。");
            }
            else
            {
               outputText("希拉仍在不停摆动臀部，她早晚会察觉到小穴里越来越明显的胀压……在一次格外深入的下压中，她逼出一股白浊，眼睛猛地睁大，随即抽身离开，让你射在草地上。");
            }
            if(get_player().cor >= 90 && sheilaCorruption() >= 90)
            {
               menu();
               addButton(0,"继续",sheilaGoesDemon);
               return;
            }
            outputText("[pg][say: 搞什么？！]她喊道。[say: 你刚才到底射了多少在我里面？]");
            if(get_player().cumQ() <= 250)
            {
               outputText("[pg][say: 全、全都射进去了……]");
            }
            else
            {
               outputText("[pg][say: 一点点……]");
            }
            outputText("你呻吟道。[say: 真不敢相信你居然没注意到……]");
            outputText("[pg][say: 该死……] 女人惊魂未定地从你身上爬下来；你的精液一缕缕从她的小穴里滑出，又从阴户淌下，沿着她的" + (get_noFur() ? "双腿" : "大腿") + "滚落，把她的皮毛都黏湿了，疼得她皱起眉。[say: 天啊，要是我怀孕了怎么办？]");
            outputText("[pg]她慌慌张张地折腾着把衣服穿回去，而你躺在草地上，平静地打起了盹。就算她真怀上了，又怎么样？这本来就是她先提的主意……");
            sheilaPreg();
            get_player().orgasm("Dick");
            sheilaPreg();
            dynStats(DynStat.Lib(-1));
            get_combat().cleanupAfterCombat();
         }
         sheilaCorruptionUpdate();
      }
      
      public function sheilaCorruptionWarningsChooseFondle() : void
      {
         clearOutput();
         outputText("管他呢。你把手直接伸向她的入口。[say: 别这样嘛……]你贴着她的脖颈轻声说道。她在你的触碰下颤抖起来，抵抗也开始减弱，你温柔地将两根手指滑入她体内。[say: 不，]她低声说，然后就在你探进去时，[say: 不！]她猛地清醒过来，把你推开，慌忙站起身。");
         get_images().showImage("sheila-private-talk");
         outputText("[pg][say: 够了，[name]！我说话的时候你他妈给我听清楚！在你现在这种状态下，我绝对不能再和你做这种事，否则我会彻底越过那条线，再也回不了头！我得控制住自己，不需要你来让我更难受。你要是还不明白，就给我滚开！]");
         outputText("[pg]她背对着你，拿着衣服快步离开，留下你");
         if(get_player().hasCock())
         {
            outputText("硬挺着");
         }
         else if(get_player().hasVagina())
         {
            outputText("湿漉漉的");
         }
         else
         {
            outputText("隐隐作痛");
         }
         outputText("。即使她走开了，你仍能从她躯干两侧看到那对惊人又摇晃的胸部轮廓。");
         outputText("[pg]贱货，就会撩人。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,761,-3);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,760,90);
         dynStats(DynStat.Cor(-10));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function sheilaCorruptionWarningListenToHer() : void
      {
         clearOutput();
         outputText("[say: 所以……]你回答道，做到一半的身体僵在原地，[say: 什么？]");
         get_images().showImage("sheila-private-talk");
         outputText("[pg]希拉盯着你看了很久。[say: [name]，我比喜欢任何一个我认识的人都更喜欢你。我不想不再见你。但在你被这样污染的时候，我们绝对不能再做爱了。你明白吗？如果我们那么做，我就会除了交配之外什么都想不了，永远都是。我不想变成一只没脑子的恶魔袋熊！]");
         outputText("[pg]她意有所指地低头看向你的手，你把手拿开了。");
         outputText("[pg][say: 谢谢你，]她说。她在你脸颊上轻轻一吻，然后站起身收拾衣服，接着叹了口气。[say: 我知道这不全是你的错；一个巴掌拍不响。接下来这几周，我会努力控制好自己。求你了，也请你一样。等我觉得自己准备好了，你会再见到我的。我……爱你。再见。]");
         dynStats(DynStat.Lust(-10));
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,858,-4);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function sheilaCorruptionUpdate() : void
      {
         var _loc1_:int = 0;
         if(get_player().cor > 90)
         {
            dynStats(DynStat.Cor(-10));
            sheilaCorruption(10);
         }
         else
         {
            _loc1_ = int(Math.round(sheilaCorruption() - get_player().cor));
            dynStats(DynStat.Cor(Utils.boundInt(-10,int(_loc1_ / 2),10)));
            sheilaCorruption(int(-_loc1_ / 2));
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,764) == 1)
         {
            dynStats(DynStat.Cor(1));
         }
      }
      
      public function sheilaCorruption(param1:int = 0) : int
      {
         var _loc2_:* = null as IMap;
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,760) + param1 < 0)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,760,0);
         }
         else
         {
            _loc2_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc2_,760,FlagDict_Impl_.arrayReadInt(_loc2_,760) + param1);
         }
         return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,760);
      }
      
      public function sheilaApology() : void
      {
         clearOutput();
         outputText("当你在平原上漫无目的地搜寻天知道什么东西时，你的[leg]忽然绊到了什么；脚下灌木里一阵窸窣作响，这是你得到的唯一警告，下一刻，一个巧妙隐藏的套索便收紧了！");
         outputText("[pg][say: 哈，逮到你了吧，你这小——哦，是你啊。]");
         outputText("[pg]希拉显然刚才要么躲在掩护里打盹，要么就是懒散地窝着，以至于都没注意到你；此刻她从一片高草里探出头和肩膀。你解开陷阱时，她一脸意外地盯着你。[say: 我还真没看出你这么舍己为人。不过要是你活腻了，想把自己喂给我和我的哥们，我看你身上的肉倒是够吃。]她露出一个凶狠的笑容，在你回瞪她时，小心翼翼地踱了过来。");
         outputText("[pg]你侧身让开，好让她取回陷阱，同时始终与这个女人对视，警惕着她的每一个动作。最后，她叹了口气，说道：[say: 你是不是有什么话想说？我可不想下半辈子都在你身边小心翼翼地走路。]");
         outputText("[pg]在这种情况下，她大概已经算是你能指望的最愿意听你说话的样子了。你要对她说点什么吗？");
         menu();
         addButton(0,"道歉",apologySheilaApology);
         addButton(1,"扇耳光并辱骂",apologySheilaSlapSult);
         addButton(2,"什么也不说",apologySheilaSayNothing);
         addButton(3,"避开她",apologyAvoidSheila);
      }
      
      public function sheilaAnalHateFuckAGoGoNO() : void
      {
         clearOutput();
         outputText("[say: 去死吧。]当你的鸡巴开始痉挛时，你把自己深深埋进这个恶魔的屁股里。第一缕精液沉入她体内时，她的尾巴扭动起来。[say: 什么？有本事你说句话试试。]");
         outputText("[pg]失败者没有资格决定自己会被怎么干。如果她对此有意见，那就拿出点本事来。出乎意料地，她乖乖闭上嘴承受着，让你尽情释放。你把滑腻的精液涂抹进她滚烫的肠道里，那感觉简直美妙；你每一次新的喷射，她甚至都会发出细小的喘息。她紧窄的肛门很快被填满，你能感觉到精液已经漫到你的龟头边缘。");
         if(get_player().cumQ() >= 500)
         {
            outputText("你过量的精液淹没了她的体内，希拉呻吟着，精液开始倒流出来，滴淌到她的小穴上。[say: 嘿，你这不就如愿了吗，]你调侃道。这个淫荡的女人试图把屁股抬得更高，好让你溢出的更多精液流进她的阴道里，但你笑着狠狠拍了她的臀胯一巴掌，又把她打得单膝跪了下去。");
         }
         outputText("[pg][say: 你这个……混蛋，]希拉呻吟着，而你把射空的[cockFit 56]从她体内抽出，发出一声湿黏的吸吮声。她的尾巴垂在被折腾过的穴口上，拨开了");
         if(get_player().cumQ() < 250)
         {
            outputText("细流");
         }
         else if(get_player().cumQ() < 1000)
         {
            outputText("水流");
         }
         else
         {
            outputText("瀑布");
         }
         outputText("般的精液，那是她的身体把一部分异物挤出来时形成的。");
         outputText("[pg][say: 写一首关于你感受的诗。]");
         get_player().orgasm("Dick");
         dynStats(DynStat.Lib(-1),DynStat.Cor(2));
         if(get_game().get_inCombat())
         {
            get_combat().cleanupAfterCombat();
         }
         else
         {
            doNext(get_camp().returnToCampUseOneHour);
         }
      }
      
      public function sheilaAnalHateFuckAGoGoGETYOUSOMEWORMS() : void
      {
         clearOutput();
         outputText("[say: 嗯……]你含糊地答道。你的");
         if(get_player().balls > 0)
         {
            outputText("[balls]");
         }
         else
         {
            outputText("体内");
         }
         outputText("一阵蠕动，让你迟疑了一下，于是你把[cockFit 56]拔了出来。[say: 其实……我觉得我一点也不适合你。]");
         outputText("[pg][say: 你适合！天啊，太适合了，伙计！你的老二就该插在我的小穴里！]希拉用她的阴户蹭着你湿漉漉的肉棒，试图引诱你。");
         if(!get_player().isTaur())
         {
            outputText("[pg]你把一只手放在");
         }
         else
         {
            outputText("[pg]你用大腿夹住");
         }
         outputText("你的");
         if(get_player().balls > 0)
         {
            outputText("[sack]");
         }
         else
         {
            outputText("[cockFit 56]");
         }
         outputText("，你确实能感觉到那些憋了许久的宠物正急着被放出来玩。[say: 不，]你说道，[say: 我知道什么才更合你的路数。像你这样的垃圾就该被丢进泥里，和泥里的虫豸作伴。]希拉似乎有些惊慌，但当你滑进她紧紧含住的小穴时，她立刻忘了自己的疑问，扭动臀部榨取你的精液。你集中精神，逼着一波黏滑的环节虫顺着你的肉棒涌下去。[say: 你的新宝宝们来了！]");
         outputText("[pg]你的阴茎爆发时，希拉浑身一颤，精液和寄生虫塞满了她的阴户。[say: 天啊，对！塞满我！我要去了，[name]！我会接纳你所有的愤怒和仇恨；全都发泄出来吧！我是你的母狗！]哦，确实如此。恶魔尖叫起来，她的小穴开始舔吮你的肉棒，吸入更多被污染的混合物；你的身体也顺势又送上一波，把她填得满满都是蠕动的虫群，以至于有虫子开始从她的阴唇间探出来。[say: 啊！啊！啊、呃……]希拉停下动作，捂住自己的肚子，脸上挂着一片茫然，而她的阴道在高潮中紧紧痉挛着包住你。一个格外巨大的鼓包沿着你的[cockFit 56]往上涌，当所有最肥大的虫子一股脑脱离、连成一串被吸进那个女人体内时，你的尿道口被撑得大张，也让你头脑一清。当你彻底排空自己，从她阴道里那团蠕动黏滑的 mess 中抽身而出时，你体内已经一只寄生虫都不剩了——连一丝抽动都感觉不到。");
         outputText("[pg]恶魔慢慢翻过身坐起来，然后抬头看着你，脑袋微微歪向一边，嘴巴努力想拼出话来。[say: 呜、呜呃……]她伸手往下，从自己小穴里渗出的那堆沾满精液、不断扭动的虫子中抓起一把，端详片刻，又像献礼一样递给你。你摇了摇头，她便漫不经心地把它们丢下，随即锁定了你还在滴液、被撑开的马眼。希拉凑得极近，几乎是在盯着里面看，然后开始把一根手指往你的尿道里探。那感觉让你一颤，连忙躲开；她噘起嘴，又伸手去够。与此同时，那些被递出的虫子竟然又朝她爬回去，把精液和黏液抹在她的大腿上，迁移到她的胯间，又在裸露的皮肤上漫无目的地游荡，仿佛因为她没有阴茎而感到困惑。她那还在滴液的桃心尾尖心不在焉地朝它们伸去，其中一些游荡的虫子好奇地钻了进去，又让她浑身一颤。");
         outputText("[pg][say: 嗯……]她低声哼着，急切地用手指去够你的[cockHeadFit 56]，仿佛把手指塞进去才是唯一重要的事。你再次后退，她便爬过来压到你身上，用黏滑的小穴蹭着你的[legs]。她的摩擦让自己迎来一次小小的高潮，当她的小穴把一波虫子喷到你的[skinfurscales]上时，她亲昵地吻住你，直直看进你的眼睛；你脑海中顿时涌入一团模糊的画面：你和一个纤瘦、病态苍白的希拉交合，庞大的虫群覆盖住你们、遮蔽[sun]光；她用那蠕动着、满是虫子的小穴骑在你身上，直到从你的[cockFit 56]喷出的精液把她体内的寄生虫一路引到你的尿道口；而最令人不安的是，希拉把你湿滑的尿道撑得大开，亲自爬进了你的阴茎里！你甩开这些念头，迅速断开接触，拿起自己的东西离开，把这个被感染的女人留在身后……但那些幻象并没有消失。");
         get_player().removeStatusEffect(StatusEffects.Infested);
         get_player().orgasm("Dick");
         dynStats(DynStat.Cor(10));
         dynStats(DynStat.Lust(get_player().lib / 5));
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1210,3);
         if(get_game().get_inCombat())
         {
            get_combat().cleanupAfterCombat();
         }
         else
         {
            doNext(get_camp().returnToCampUseOneHour);
         }
      }
      
      public function sheilaAnalHateFuckAGoGo() : void
      {
         clearOutput();
         outputText("你看着她抚弄自己的小穴，[cockFit 56]在[armor]里硬了起来，但你咬紧牙关，忍住不把她想要的东西给她——一个更好的主意正在你脑中成形。[say: 转过去，]你命令道。");
         get_images().showImage("sheila-corrupted-anal");
         outputText("[pg]希拉咬住嘴唇，脸上一红，然后背过身去，胸口贴在地上，屁股高高翘起；两条尾巴在她圆润的臀瓣和湿漉漉、饥渴的小穴上方晃动。[say: 嘻嘻，我准备好啦，亲爱的……看我都湿成这样了！]你脱掉衣物，释放出你的[cocks]，走上前去。你在她光滑的阴唇上摩擦，把她的湿润抹到你的[cockHeadFit 56]上，她满怀期待地哼了起来。[say: 快点嘛；该插进来了！别逗我了！]");
         outputText("[pg]你无声地表示赞同，没人看见你的笑容咧得更大了。");
         if(!get_player().isTaur())
         {
            outputText("用一只手环握住你的[cockFit 32]");
         }
         else
         {
            outputText("跨坐在她身上");
         }
         outputText("，你将臀部向后撤，对准[cockHeadFit 32]，然后猛地一顶——直直捅进她的屁眼。她抬起头，咬紧牙关；你把滑腻的龟头硬挤过她的肛口。[say: [name]，搞什么鬼？！很疼啊！你要用那个洞就轻点；我还不擅长把身体撑开！]");
         outputText("[pg][say: 不。]你");
         if(!get_player().isTaur())
         {
            outputText("抓住她乱踢的双腿，利用它们作为杠杆，当你");
         }
         outputText("把阴茎硬生生挤进这个愤怒的女人体内。[say: 你嘴上说得那么好听，说什么喜欢被肉棒塞满，可我真把一根塞进去，你就开始像个泼妇一样闹，装得好像自己还没准备好；你就不能闭上嘴乖乖挨肏吗，骚货？]");
         outputText("[pg][say: 啊！停下！你会把我撕裂的！]连她的尾巴都抵在你身上绷紧了，拼命想把你顶出去，但那感觉实在太棒，你不可能让这种事发生。相反，你顶得更用力了。希拉的双臂撑不住一软，上半身摔到草地上");
         if(sheilaCorruption() >= 90)
         {
            outputText("；她那对巨大而柔软的乳房在身下摊开，而你的肉棒把她顶得全身重量都重重压在胸上");
         }
         outputText("。她揪起一簇簇草，徒劳地用拳头捶打地面，而你则尽可能深地沉入她体内。[say: 去你妈的！你他妈到底有什么毛病，混蛋？！放开我，我再也不想和你有任何关系了！]");
         outputText("[pg]也许如果她一开始就这么说，你就会放过她。可事到如今，你都已经做到这一步了，要是不趁机享用她那又热又紧的小穴，你永远都不会原谅自己。你开始抽送，用湿滑黏腻的肉棒顶搅着希拉的肠道。随着你的前液被挤出来，你的抽插变得越来越顺畅，很快你就用力把她干进地里，在你进出冲刺时，她的脸也被蹭进泥土里。她的舌头耷拉出来，抗议早已被抛在脑后，只剩你湿漉漉的鸡巴挑动着她肛门里敏感的神经。[say: 啊、啊、啊，该死……]");
         outputText("[pg]你停了下来。她的脸过了一会儿才反应过来，最后转向你。[say: 怎、怎么了？继续啊，伙计！]");
         outputText("[pg][say: 是你叫我停的，]你回答。[say: 现在又想让我继续？你脑子是不是有毛病？]");
         outputText("[pg][say: [name]，别闹了！我要你干我，不是折腾我！]希拉喊道，试图把腿撑起来，只靠自己的腰继续这场性交。");
         outputText("[pg][say: 我懂了，]你回答着，用足以让她失去平衡的力道顶进她体内，然后又一次停下。[say: 所以我不能折腾你，但你想什么时候折腾我都行？是这样吗，你这个蠢婊子？我就是来听你那些幼稚幻想，然后在你想要硬鸡巴的时候随叫随硬的？]");
         outputText("[pg][say: 啊，不是！我是真的喜欢你！]希拉慌张地说道。[say: 你是我最喜欢的男人，我保证！只是……继续吧！我需要这个！]");
         outputText("[pg]废话，废话，全是废话。你再次抽送起来，挑逗着她的肛门；女人配合地扭动腰臀，在你胯间蹭来蹭去，故意让你看到她的快感，好让你别停下抽插。[say: 终于决定闭嘴了，是吧，]你嘲弄道。希拉没有回应，尽管她双颊发麻，因羞耻而涨红。她的嘴终于安静下来后，你才真正投入这场性交，用鸡巴摩擦着她滚烫的内壁。你感觉高潮渐渐逼近，头向后仰去，而希拉也注意到了，从眼角盯着你。");
         outputText("[pg][say: [name]！请射在我的小穴里！我想养育你的孩子！只有你才适合我！]");
         if(get_player().cor >= 80 && get_player().hasStatusEffect(StatusEffects.Infested))
         {
            menu();
            addButton(0,"否",sheilaAnalHateFuckAGoGoNO);
            addButton(1,"虫子更适合你",sheilaAnalHateFuckAGoGoGETYOUSOMEWORMS);
         }
         else
         {
            menu();
            addButton(0,"继续",sheilaAnalHateFuckAGoGoNO);
         }
      }
      
      public function sheila1stEncStayHidden() : void
      {
         clearOutput();
         outputText("你调整呼吸，屏住身子不动，免得轻轻碰响什么东西，只等那生物忙完自己的事后离开。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function sheila1ndEncLookCloserPtIITalkLeave() : void
      {
         clearOutput();
         outputText("你一言不发地站起身，从那个女人身边退开……当然，临走前不忘狠狠瞪她一眼。她一直用目光跟着你，直到你觉得自己离得够远，才敢转身背对她。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function sheila1ndEncLookCloserPtIITalkFight() : void
      {
         clearOutput();
         startCombatImmediate(new Sheila());
      }
      
      public function sheila1ndEncLookCloserPtIITalk() : void
      {
         clearOutput();
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,761,-1);
         outputText("[say: 行吧，你这个吵个没完的家伙，那就随你。我饿起来脾气可差了；别说我没提醒过你。]话音刚落，希拉就朝你挥出一拳！你猛地后仰想躲开，却还是慢了一步，她擦中了你[face]的前端。好大的劲儿！要是她真想结结实实打中你，这记冷不防的拳头八成能把你直接放倒。你刚张嘴还想说话，她便单腿后仰蓄势，用另一条腿狠狠把你踹开，把你胸口的空气都撞了出去。你重重摔倒在地，背上一阵剧痛。");
         get_player().takeDamage(2);
         outputText("[pg][say: 现在想走了吗？]她问道，冷冷咧嘴一笑，在身前举起双拳。你揉着发疼的鼻子坐起身，愤怒地看着她。她已经证明了自己速度极快，而且大概也相当有力，尽管你完全不知道她实战经验如何——更何况，她眼里似乎还带着一点懊悔。你要夹着尾巴逃走，还是还手？");
         menu();
         addButton(0,"战斗",sheila1ndEncLookCloserPtIITalkFight);
         addButton(14,"离开",sheila1ndEncLookCloserPtIITalkLeave);
      }
      
      public function sheila1ndEncLookCloserPtIILeave() : void
      {
         clearOutput();
         outputText("[say: 挺识相。说不定以后还会见到你。]说完，你便离开了这个奇怪的女人。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,761,1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function sheila1ndEncLookCloserPtII() : void
      {
         clearOutput();
         outputText("你任由她打量；她似乎以一种专业的兴趣观察着你握持[weapon]的方式。");
         if(get_player().get_weaponName() == "Scarred Blade")
         {
            outputText("那把刀感受到她的目光后，便兴奋地朝她微微震动，从上过油的刀鞘里滑出了一截；她盯着露出的金属看得出神，仿佛正望进前世的日记。突然，她摇了摇头，转过脸去，那把军刀也随之安静下来。");
         }
         outputText("与此同时，你趁机也好好打量了她一番。她直起身时大约有六英尺半高，不过她的" + (get_noFur() ? "脚长得惊人" : "腿像动物一样弯曲") + "，如果" + (get_noFur() ? "她踮起脚尖" : "伸直") + "，说不定能把她推到七英尺。她那条渐细的尾巴只稍稍越过臀部一点。她头上的直发颜色和毛发相近，剪到下颌线的位置，刘海被掖到一只长耳朵后面。每当她低下头时，刘海就会滑到前面；等她再抬头，又会用空着的手重新掖回去。她的脸整体相当漂亮，呈鸡蛋形或椭圆形，下巴处逐渐收窄，颧骨也略微分明，但还称不上真正的美人，只是因为多少显得有些普通。她的鼻子小巧端正，眼睛是很浅的棕色——在某些光线角度下甚至像琥珀色。往下看去，你能发现她的衬衫是 V 领剪裁，露出一对中等大小乳房间的乳沟；大概是 C 罩杯，不过有背心挡着，很难说准。她的身体结实有型，皮肤也有些晒黑，你猜她大概经常待在户外。");
         outputText("[pg]她终于把你打量够了，说道，[say: 没事了。抱歉耽误你，不过谁知道这种鸟不拉屎的地方会碰上什么样的人，对吧？]");
         if(get_player().lib >= 50)
         {
            outputText("注意到你还在打量她的身体，她露出一丝坏笑，说道，[say: 看得挺尽兴啊？眼睛往上，伙计，]这让你不好意思地猛然抬起头来。");
         }
         outputText("你朝这个奇怪的女人点点头，介绍了自己。");
         if(get_player().get_short() != "Sheila")
         {
            outputText("[say: [name]，是吧？我的伙伴们都叫我希拉。那帮混蛋，就爱开玩笑。]");
         }
         else
         {
            outputText("[say: 你也是啊？希拉是我那帮哥们给我起的绰号。不过我猜你这名字应该不是一群脑子还没长大的混球给取的吧。]");
         }
         outputText("[pg]在这么偏僻的地方还能见到别人，而且对方还挺友善，实在有些奇怪。希拉对你抿嘴一笑，告诉你她自己也有同感。[say: 这地方可危险得很，到处都是该死的豺狼人和好斗的牛。当然，它们一直都挺疯的。我本来只是想猎点吃的，结果那东西跑得一干二净。]她朝地上示意。她脚边有个巧妙藏在灌木里的陷阱，不过看起来她的猎物已经把套索挣断了。");
         outputText("[pg][say: 真倒霉，]你说道。");
         outputText("[pg]她点点头，皱起眉头，显然不想让你继续在这事上多说。你拿出自己的一些食物递给她，但她只是盯着你。[say: 算了，伙计；我从不拿陌生人的食物。不过还是谢你这份心。]");
         outputText("[pg]你好奇又急着换个话题，便问她刚才提到的那些“哥们”到底在哪儿。她听到这个问题眯起眼睛。[saystart]这好像不关你的事吧，爱打听的？别见怪，可我跟你又不熟，哪知道你是不是玛莱；我可不打算把情报告诉某个伪装起来的蠢货恶魔混混。");
         if(get_player().demonScore() >= 4)
         {
            outputText("我是说，瞅瞅你自己吧。你简直连藏都懒得藏；我见过的小恶魔都比你更像正常人。");
         }
         outputText("算了。[sayend]你否认了她的指控，但她仍旧瞪着你。");
         outputText("[pg][say: 没事，]她说道，话里的意思和她冰冷的表情完全对不上。[say: 你赶紧走，我们就当这事没发生过。]");
         outputText("[pg]你问她能不能再聊几句；你已经有一阵子没遇见新面孔了。她更用力地盯着你，身体也微微绷紧。[say: 也许吧，但不是今天下午。识相点，听懂暗示。我正想抓午饭呢；一个姑娘要是看见你这么纠缠不休，说不定会觉得你另有所图。]她看起来脾气不太好，也没什么聊天的兴致……你可以暂时由她去，也可以再试一次。");
         menu();
         addButton(0,"交谈",sheila1ndEncLookCloserPtIITalk);
         addButton(1,"离开",sheila1ndEncLookCloserPtIILeave);
      }
      
      public function sheila1ndEncLookCloser() : void
      {
         clearOutput();
         outputText("你稍稍探出头，想把那生物的其余部分看得更清楚。它用那双长脚平稳站着，也把头伸得更远，打量着起伏平缓的乡野，可随后眼角余光却发现了你！它尖叫一声，再次用后爪撑起身子，以一种明显的女性声音喊道，[say: 是朋友还是敌人？！]");
         outputText("[pg]你挺直身子站到全高，回应她的质问，并确保她能看见你。她没有拉近距离的意思，于是你主动朝她走去；她没动，却在大约十步远的地方叫停了你。[say: 够近了！让我看清楚，]她喊道。");
         menu();
         addButton(0,"继续",sheila1ndEncLookCloserPtII);
      }
      
      public function rebellingScarredBlade(param1:Boolean = false) : void
      {
         var _plotFight:Boolean;
         var monster1:Monster;
         var _g:SheilaScene;
         var _loc2_:int = 0;
         if(!param1)
         {
            outputText("<b>你携带的那把满是刮痕的剑像一匹尥蹶子的马一样剧烈乱颤，随后剑柄向下倾斜，自己从剑鞘里滑了出来。你还没来得及把它捡起并重新入鞘，它就朝你的手猛地一划，割伤了你，然后剑尖朝外落在地上。即使你试着绕到旁边去抓剑柄，这把诡异的军刀也会转动刀刃将你逼退。你烦躁地叹了口气，暂时放弃了它。</b>[pg]");
         }
         else
         {
            outputText("你刚想挥动这把剑，它就像一匹尥蹶子的马般猛地乱跳起来。你赶紧把它塞回包里，免得它伤到你。");
         }
         if(!param1)
         {
            _loc2_ = 20;
            _loc2_ -= int(get_player().get_armorDef());
            if(_loc2_ < 1)
            {
               _loc2_ = 1;
            }
            get_player().HPChange(-_loc2_,false);
            get_player().setUnarmed();
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2175,1);
         }
         doNext(playerMenu);
         _g = this;
         monster1 = new ScarredBlade();
         _plotFight = true;
         addButton(1,"战斗",function():void
         {
            _g.startCombatImmediate(monster1,_plotFight);
         }).hint("与这把军刀战斗，试着折断它。这将是一场危险的战斗，失败可能意味着你的死亡。");
      }
      
      public function rapeSheilasCooter() : void
      {
         clearOutput();
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,761,-4);
         var _loc1_:int = get_player().cockThatFits(48);
         outputText("你抓住女孩毛茸茸的腿；她试图把你踢开，但你把她拽了回来，将她按住");
         if(get_player().isTaur())
         {
            outputText("，把前蹄踩在她臀部上方");
         }
         outputText("。你伸手抓住她衬衫的领口，然后一把撕开，露出她的");
         if(sheilaCorruption() < 30)
         {
            outputText("小巧");
         }
         else if(sheilaCorruption() > 60)
         {
            outputText("硕大而柔软的");
         }
         outputText("乳房，在那股力道下晃动起来。她试图用双臂遮住自己，但你抓住她的手臂，把它们拉到一边，再次露出她的胸口。当你打量着她裸露的身体时，她别过脸去，羞耻让脸颊染上红晕。你粗暴地揉捏她的奶子，拨弄乳头，直到它们挺立起来；她嘴唇紧绷，闭上了眼睛。");
         outputText("[pg]你顺着她的身体稍微往下挪，把注意力放到她腰间，解开她的腰带，又解开她沾满灰尘的短裤。你拉开裤门时，一小片三角形的白色布料映入眼帘；你迅速把下装往下拽，露出她的内裤。你把一根手指抵在她小穴的入口处，");
         if(get_monster().get_HP() < 1)
         {
            outputText("沿着她的阴唇滑进去，弄出一片湿痕，然后");
         }
         outputText("拖着那片湿布在她的阴户周围蹭动。");
         get_images().showImage("sheila-vag");
         outputText("[pg]确认她已经准备好后，你解开自己的[armor]，掏出你的[cockFit 48]；你把它扯出来时，" + get_player().cockHead(_loc1_) + "上已经滴着前列腺液。你将它搁在她的胯间，让黏液浸透白色布料，直到能透过布料看见她浅棕色的肌肤。她在下面扭动，又挤出一滴液体；你把龟头抵在她小穴的入口，急切地隔着布料往里压。[say: 求你了……]她呜咽道，[say: 我求你了，别这样。]");
         if(get_player().cor < 50)
         {
            outputText("[pg]你皱眉看着这个女孩。明明身体这么渴望，她居然还想着逃？你能感觉到她湿漉漉的小穴正对着你的" + get_player().cockHead(_loc1_) + "抽动。你拖着渗液的龟头沿着她湿透的内裤摩擦，引得她一阵发颤，体内又涌出一片液体，可她咬住嘴唇，拒绝与你对视。");
            outputText("[pg][say: 你是认真的？]你问道，同时轻轻一顶，分开她的阴唇，把湿透的布料推进她体内。隔着布料，你几乎已经能看清她小穴的每一处轮廓。");
            outputText("[pg][say: 是、是的……]她呻吟道，[say: 求你别碰我的皮肤。如果一定要的话，隔着布料可以，可是求你……别放进去！]真是奇怪的要求……你眯起眼看着她，但在你听完之后，她反倒抬眼与你对视了。她泛红的脸上满是真切的绝望；她是真的很在意这件事！");
            outputText("[pg]算了，随便吧。你试探着再次往里顶，看看她的内裤究竟能让你进去多深；她的阴唇顺滑地接纳了你，让布料在你的" + get_player().cockHead(_loc1_) + "上摩擦。双唇被撑开后，连她小小的阴蒂都能隔着布料感觉到，于是你趁机蹭弄它");
            if(get_player().isTaur())
            {
               outputText("，用你的小腹");
            }
            outputText("。回应你的是女孩羞怯的一声喘息，以及她阴道那柔软而迎合的触感，在你的龟头上又裹上一层新的湿意。被温热滑腻的体液包裹后，那条内裤贴在你的肉棒上感觉相当不错……你还真能这样射出来。[say: 动动你的腰，]你迟疑地命令道，[say: 让我爽一点。]她不安的眼睛在意识到你接受了她的条件后亮了起来，她大大分开双腿，迎着你扭动，用你肉棒的前端隔着几近透明的内裤爱抚自己小小的性器。");
            outputText("[pg][say: 这样……可以吗？]希拉问道，用那被布料包住的阴道口在你的马眼上磨蹭，把从中渗出的那滴前列腺液抹开。你想说不，想装作这还不够，但她紧致、裹着布料的阴户正摩擦着你肉棒末端布满神经的部位，让你说不出话来。随着她体温升高，热意透过湿透的布料传到你身上；这个淫荡的女孩在你暂时放过她所担心的那件事后，竟然开始抓揉自己的乳房、抚摸自己。她的皮肤随着身体发热而泛红，她更用力地抵着你的肉茎，发出轻柔的呻吟，几乎——但还没有完全——把龟头含进她的小穴里。[say: 啊……！不、不行……要去了！]她的阴唇饥渴地夹紧你的肉棒，而你也有同样的感觉。");
            outputText("[pg]她的膝盖一度夹住你，直到想起自己不许肌肤接触的要求，才又强迫自己分开；她刚才短暂伸向你的双手也缩了回去，双臂紧紧抱在胸前，把乳房挤在一起。[say: 对、对不起！]她叫道。你感觉到她在痉挛中隔着内裤不断流出淫液。你也到了极限，便把你的" + get_player().cockHead(_loc1_) + "往下滑到她阴道口，半顶进去，隔着布料用龟头摩擦刺激神经，跨过通向高潮的最后一步。");
            outputText("[pg][say: 拿出去！]女孩还在高潮的颤抖中哀叫道。[say: 别、别射在我里面！]");
            outputText("[pg][say: 闭嘴，]你咬着牙回道，[say: 我已经给了你想要的，现在轮到你也满足我了！]你的[cockFit 48]抽搐起来，肌肉也随之震颤，第一股精液喷涌而出；你费尽全力才撑住身体，避免压倒在你的情人身上。而她内裤那道可渗透的屏障则收取着从你泄出的精液，随着你不断灌进女孩体内的黏稠液体而变得越发厚重。温热的种液透过布料侵入她体内，她的脸更红了，却没有再提出抗议。");
            if(get_player().cumQ() >= 500)
            {
               outputText("很快，在这浅浅的插入所能允许的范围内，你已经把她填得满满当当，内裤也开始反过来压住你的肉棒，那道多孔的屏障装不下的精液便往你身上渗出来。");
            }
            else if(get_player().cumQ() >= 1500)
            {
               outputText("它在你枪尖周围下坠、鼓起，随着每一次新的喷射而脉动，裤边则把精液漏到她的腿上和屁股上。");
            }
            outputText("你漫不经心地想象里面会是什么样子：每一股精液的冲势都被布料挡住，懒懒地滴进她体内，直到下一股把它再往前推开一点。你不禁想着，这样够不够让她怀孕。你从女孩身上退开，留下她喘息着，再次移开视线。");
            outputText("[pg]她试着站起来，捂着自己的腹部，不高兴地看着你。");
            if(get_player().cumQ() >= 500)
            {
               outputText("她小穴里塞满了太多精液，以至于开始往外滑出，再次让她的内裤恢复了不透明——虽然并没有恢复干爽。");
            }
            outputText("你迎上她的目光，轻蔑地扬了扬鼻子。意识到自己仍旧赤裸，她拉起短裤，扣好背心遮住身体，而你则把她留在身后。");
            sheilaPreg();
            get_player().orgasm("Dick");
            dynStats(DynStat.Lib(-1));
         }
         else
         {
            outputText("[pg][say: 我为什么不该这么做？]你向后退开，把一只手伸进她的内裤，让指尖垂在她的入口处；她每一寸肌肤都因情欲而发烫，出卖了她的话。就连她的小穴唇也在轻轻摩挲、抚弄你的手指。[say: 你身上唯一不想要这个的，就只有你那张撒谎的嘴。]");
            outputText("[pg]希拉颤抖着，还想再开口，可你突然把手指弯进她体内，又猛地抽回手，她的脑袋也随之一震。你拽着她的内裤，布料绷紧在她屁股上。[say: 住、住手！]她喊道。[say: 求你了！]");
            outputText("[pg][say: 不。]你绷紧手臂，更用力地一扯，撕裂布料的声音在你们之间响起，她的内裤被撕成两半。你把这件破烂衣物丢到一边，重新摆好姿势，用你的[cockFit 48]顶弄她的外阴；当你挤入其中时，那里渗出的润滑液沾满你的龟头，更加坚定了你的决定。");
            outputText("[pg]当你终于推进去时，女孩又开始挣扎，受这亲密接触");
            if(get_player().cockArea(_loc1_) > 32)
            {
               outputText("以及容纳一根对她来说稍微过大的阴茎所带来的疼痛");
            }
            outputText("的刺激，她甚至向后仰起身，用指甲抓你。你抓住她的手按住，她却朝你吐了口唾沫！[say: 去你妈的，混蛋！]希拉尖叫道。[say: 拔出去！]你伸手下去，扇了她一耳光。");
            outputText("[pg][say: 不，]你重复道，羞愧的女孩盯着旁边看。你完全插进去，让她的身体产生一阵颤动，这");
            if(sheilaCorruption() > 10)
            {
               outputText("晃动她的乳房，并且");
            }
            outputText("牙关也咬紧起来。一抹红晕在她脸颊上绽开，其中一边因为那记耳光而更红……不过她仍然拒绝看你。无所谓；反正你们正在做爱。你开始有力地抽插她的小穴，湿滑的淫液足以让你毫无预热地快速顺畅地推进。[say: 你真是个烂透了的骗子，]你低声说道");
            if(!get_player().isTaur())
            {
               outputText("，俯身亲吻她修长的脖颈和锁骨");
            }
            outputText("。希拉又颤抖了一下，仍旧移开视线，而你继续动作。[say: 我已经能感觉到你的阴道在主动摩擦我了。你是不是很快就要高潮了？等你高潮的时候，你会不会告诉我你有多讨厌这样，然后用双腿缠住我，把我留在里面来惩罚我？]女孩脸上的红晕更深了，她羞耻地咬住嘴唇。你自信地松开她的手");
            if(!get_player().isTaur())
            {
               outputText("，同时把自己的手移到她的乳房上，拨开她撕裂的衬衫");
            }
            outputText("；她没有再挣扎，而是慢慢把手放下来");
            if(!get_player().isTaur())
            {
               outputText("，覆在你的手上");
            }
            outputText("，证实了你的猜想。她闭上眼睛，认命似的抬起下巴");
            if(!get_player().isTaur())
            {
               outputText("，任由你得意地攥紧手里的软肉，亲吻她下颌下方");
            }
            outputText("。");
            outputText("[pg]这场粗暴的性爱不会持续太久了；你能感觉到自己的高潮正在逼近，而你的伴侣小穴发出的淫靡水声也说明，不只是你一个人如此。[say: 求你……]她低声呢喃，几乎听不见。你凑得更近，等她再次开口。[say: 求你……拔出去……]");
            outputText("[pg]你近乎温柔地");
            if(!get_player().isTaur())
            {
               outputText("把一只手贴在她脸侧，将她转向你，然后吻上她的嘴唇。");
            }
            else
            {
               outputText("弯下腰，压低上身，直到能抚摸她的脸颊。");
            }
            outputText("[say:我当然不会，]你温柔地回答。[say:那有什么意义呢？]希拉在你将自己整根没入时皱了皱脸，你的[cockFit 48]深深插进她体内，直到你们的下身紧贴在一起。你浑身一颤");
            if(!get_player().isTaur())
            {
               outputText("，并捏住她的乳房");
            }
            outputText("，高潮随之来临，第一股精液灌进她紧紧收缩的小穴里。你灌满她时，她的背弓了起来");
            if(!get_player().isTaur())
            {
               outputText("，她不适地压住你的手");
            }
            outputText("，随着自己的高潮开始而喘息起来。她的双膝缠上你的腰侧，正如你所预料的那样，而她的小穴");
            if(get_player().cor >= 90 || sheilaCorruption() < get_player().cor)
            {
               outputText("贪婪地吮裹着你的[cockFit 48]，以你射出的速度吞饮着你的精液。她在高潮中倒吸一口气，终于睁开眼睛，头向后仰去");
               if(!get_player().isTaur())
               {
                  outputText("；你几乎能感觉到掌下她的乳房发热、充血胀起，乳头顶进你的掌心");
               }
               outputText("。");
            }
            else if(get_player().cor < sheilaCorruption())
            {
               outputText("向你喷涌出淫液，倾泻在你抽动的肉棒周围，多得让你觉得像是把它探进了温泉里。");
               if(!get_player().isTaur())
               {
                  outputText("她把你的手攥得那么紧，让你发誓都能感觉到她的乳房在你掌下被挤压，同时尖叫着宣泄快感。");
               }
            }
            else
            {
               outputText("急切地淌着淫液，与你的体液交融，直到那些液体开始因白浊的精液而变得浓稠。");
            }
            if(get_player().cumQ() >= 500)
            {
               outputText("一如既往地过量，你的精液很快就把她体内填满，并开始沿着你的肉棒喷溢出来，弄脏了她的大腿。");
            }
            if(get_player().cockTotal() > 1)
            {
               outputText("你其余的");
               if(get_player().cockTotal() == 2)
               {
                  outputText("肉棒也喷射出来");
               }
               else
               {
                  outputText("肉棒也纷纷喷射出来");
               }
               outputText("，在她浅棕色的皮肤上留下一道道痕迹。");
            }
            outputText("[pg][say:哈哈，]你轻声笑道。[say:你果然和我想的一样渴望。]");
            if(sheilaCorruption() >= 90 && get_player().cor >= 90)
            {
               menu();
               addButton(0,"继续",sheilaGoesDemon);
               return;
            }
            outputText("[pg]希拉一言不发地从你身边退开，然后扣上背心遮住乳房，又提起短裤；粗糙的布料碰到她毫无遮挡、仍然敏感的下身时，她瑟缩了一下。重新穿好衣服后，她终于看向你——不是带着你预想中的愤怒，而是痛苦地皱着眉，那是一种认命般、似曾相识的失望。你哼了一声，重新穿好衣服，把女孩留在身后。");
            sheilaPreg();
            get_player().orgasm("Dick");
            dynStats(DynStat.Lib(-1));
            sheilaCorruptionUpdate();
         }
         get_combat().cleanupAfterCombat();
      }
      
      public function pregDemonSheilaOtherSex() : void
      {
         clearOutput();
         outputText("你提出另一种选择时，她的眉头皱了起来。");
         if(get_player().hasCock())
         {
            outputText("[say: 哎呀，我想我也该有发言权吧？我可是很期待让你的种子灌进我身体里的……那东西简直值得装瓶珍藏。]她");
            if(sheilaCorruption() >= 80)
            {
               outputText("费力地站起身，沉重的乳房随之摇晃");
            }
            else
            {
               outputText("灵巧地一跃，用带爪的双脚站稳");
            }
            outputText("，双手沿着臀胯的曲线游走，叫人难以移开视线。[say: 你可以随便对我的身体做你想做的事，亲爱的……只要你能说服我。当然，我也会要求同样的特权！]希拉朝你扑了过来，毫不掩饰她打算用什么方式来“说服”你！");
            startCombat(new Sheila());
         }
         else if(get_player().hasVagina())
         {
            outputText("[say: 嗯，听起来没有让那么棒的你进到我身体里那么好，不过能得到什么我就要什么，亲爱的。]希拉更亲密地贴到你的手臂旁，用一只手拨开你的手指，把它们滑进自己柔软滚烫的阴唇之间，然后亲了亲你的脸颊。[say: 那么，你有什么打算？我全听你的。]她抽出你的手指，在草地上坐下，张开双腿，满怀期待地看着你。");
            dynStats(DynStat.Lust(15));
            beatUpDemonSheila(false);
         }
         else
         {
            doNext(get_camp().returnToCampUseOneHour);
         }
      }
      
      public function pregDemonSheilaKnockUp() : void
      {
         clearOutput();
         outputText("当她用自己裂缝状铲形尾端滴下的滑腻黏液涂抹穴口时，你的[cock]硬得发疼。她一边挑逗自己的乳房，一边用眼神赤裸裸地勾着你，这更让情况雪上加霜。很快，你勃起得厉害，不得不把肉棒从[armor]里掏出来，好缓解那股压力。你让你的大肉棒从自由地晃动着，希拉朝你挑了挑眉。[say: 所以……答应了？]");
         menu();
         if(get_player().hasCockThatFits(56))
         {
            addButton(0,"继续",missionaryForThePurposesOfCreatingImpsWithSheila);
         }
         else
         {
            addButton(0,"继续",bigDickAndThighs);
         }
      }
      
      public function normalSheilaPregNotifREPEATEDEDWalkWithHer() : void
      {
         clearOutput();
         outputText("你捡起她忘下的帽子，也站起身来，小心地把希拉没吃的午饭重新用草叶包好，替她塞回背包里。她有些心不在焉地从你手里接回帽子。");
         outputText("[pg][say: 谢了，伙计……下次怕不是连自己的脑袋都忘了。]她甚至没有戴上，只是拿在手里继续沉重地往前走。你在她身边[walk]着，很轻松地跟上这个疲惫的女人。她抬起脸，带着询问的神情看向你。[say: 怎么了，[name]？]");
         outputText("[pg][say: 只是想在后面照看你一会儿。毕竟你的背影还挺好看的，]你回嘴道。");
         outputText("[pg]希拉脸红了。[say: 真体贴……你愿意陪到我布好几个套索，再找个好地方藏起来躺会儿吗？那可太棒了。]");
         outputText("[pg]女人再次把空着的手塞进你手里，半是带路，半是寻求安慰。你们两人沉默地在草丛中走了一阵，希拉拖着沉重的眼皮四下张望，不时从背包里取出套索布下。");
         outputText("[pg][say: 瞧瞧那边，伙计，]她指着一片高高的杂草说道。[say: 那儿遮掩不错，我可以眯一会儿。应该行。]她把手从你手里抽出来，终于把帽子戴到头上，然后卸下背包。[say: 我现在要布置一下了。再次谢谢……待会儿见。]");
         dynStats(DynStat.Cor(-1));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function normalSheilaPregNotifREPEATEDEDLetHerGo() : void
      {
         clearOutput();
         outputText("对此你也没什么办法——就算你想替她照看你的孩子，她也是把孩子藏在地下的洞里。你把包裹递还给她");
         if(get_player().cor < 40)
         {
            outputText("，劝她把剩下的吃完，好保持体力");
         }
         outputText("。希拉虚弱地笑了笑，接过包裹，又把草叶重新裹好。[say: 谢了，[name]。我很快会再见你的……大概吧。]");
         outputText("[pg]她走得很慢，脚步踉跄得不像平时；走出大约二十英尺后，她转过身，又朝你走回来。你站起身，以为她还有什么坏消息要说，但她只是点了点头。");
         outputText("[pg][say: 忘拿帽子了。]");
         outputText("[pg]她捡起帽子戴到头上，简短地点了点头，又拖着步子走开了。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function normalSheilaPregNotifREPEATEDEDHelpABitchOutTOCAMP() : void
      {
         clearOutput();
         outputText("你一言不发地把那捆猎物从希拉肩上拿下来，甩到自己肩上。她抬头看着你，困惑得连眼泪都忘了掉。[say: 你这是干什么？]");
         outputText("[pg][say: 跟我来，]你简单地回答，牵起她的手。");
         outputText("[pg]希拉被你拉着，踉踉跄跄地跟在你身后。[say: 我们去哪儿，伙计？]");
         outputText("[pg][say: 回家。]");
         outputText("[pg]没过多久，你们就回到了荒原上那个熟悉的营地；这里安静地沉睡着。你小心地把猎物放到火坑旁的地上，然后自己也一屁股坐了下来。");
         outputText("[pg][say: 看起来……挺不错的，]希拉轻声说着坐了下来，[say: 但这里太暴露了——更别提那个明晃晃的大靶子了。]她看向传送门，那东西在天空映衬下投出不祥的轮廓。[say: 我可说不好这地方行不行。]");
         if(get_player().hasStatusEffect(StatusEffects.DefenseCanopy))
         {
            outputText("[pg]你对她的反对不以为意，指了指已经在入口处蔓延生长的荆棘。希拉似乎确实被这近乎魔法般的景象震住了。");
         }
         else if(get_camp().isGuard("Jojo"))
         {
            outputText("[pg]你招手让乔乔过来，介绍他们认识，并解释说这位修士夜里会看守营地，而你白天会来检查。那只白色小老鼠礼貌地向你的客人鞠了一躬，然后在附近坐下。[say: 你好，希拉，]他说。");
         }
         else if(get_camp().isGuard("小A"))
         {
            outputText("[pg]你摆摆手，打消希拉的异议，指向那个住着你瘦巴巴房客的大桶，并解释说她晚上会替你看守营地，作为交换，你给她一个住处。那个高个蓝皮女孩拖着步子走过来坐下，害羞地躲在你身后，希拉看起来仍有些怀疑。[say: 呃……你好，]海葵小声咕哝道。");
         }
         else
         {
            outputText("[pg]你一副很有道理的样子指出，即便如此，在一个舒适的营地里，有铺盖和热食，还能和认识的人轮班守夜，也远比在脏兮兮的洞里又饿又怕、靠抽自己耳光硬撑着不睡要好得多。希拉抿着嘴点了点头。[say: 那……我能值第二班吗？]她带着歉意问道。[say: 我感觉自己现在累得风一吹就倒。]你耸了耸肩。");
         }
         outputText("[pg]没过多久，你就生起了一小堆火，希拉也麻木地从猎物里挑出几只小鸟，拔了毛串起来。她把它们放在火焰上转动着，偶尔叹一口气。");
         if(get_player().get_inte() >= 60)
         {
            outputText("[say: 孩子会没事的，]你试探着说道，姑且猜测着。[say: 护士们不就是为这个在那儿的吗。]");
         }
         else
         {
            outputText("你伸出一条胳膊搂住她，问她还好吗。");
         }
         outputText("她默默地点点头，把食物从火里取了出来。");
         if(get_camp().isGuard("Jojo"))
         {
            outputText("她递给你一只鸟，又递给乔乔另一只。他抬起手，礼貌地摇了摇头。");
         }
         else if(get_camp().isGuard("小A"))
         {
            outputText("希拉递给你一只鸟，又把另一只递给你那位古怪的房客。海葵抿紧嘴唇，用力摇了摇头，脸上泛起深蓝色的红晕。");
         }
         outputText("你们沉默地吃完了东西，希拉清了清嗓子。");
         outputText("[pg][say: 我得在天亮前走，所以趁你还没睡着，先把话说了，免得我走的时候你睡着了，]她宣布道，视线仍然落在地上。[say: 谢谢你帮我……这次也是，之前也是。真的，你是个顶好的人。]");
         if(!get_camp().campGuarded())
         {
            outputText("[pg]你咧嘴一笑，她站起身来，随后走向你的睡铺。她没多久就睡着了；你饶有兴致地看着她翻来覆去……还把口水流在了你的枕头上。");
         }
         else
         {
            outputText("[pg]你咧嘴一笑，站起身来，希拉跟着你走到床边。");
            if(FlagDict_Impl_.arrayReadString(KFLAGS.flags,701) != "")
            {
               outputText("她有些嫌弃地看了眼附近睡着的人，然后越了过去。你拿起睡铺跟上她，心想如果她真能遵守承诺，在天亮前离开，那应该也不会惹出什么问题。[say: 看来你挺会交朋友嘛，]希拉嘟囔道……但当你重新铺开睡铺时，她的眼睛立刻死死盯住了它，就像溺水的人看见木筏一样，之后便再没说什么。");
            }
            outputText("她先躺了下来，任由你尽可能地贴近她。就在你快要睡着的时候，你感觉希拉握住你的手，把你的胳膊拉过她的身体。");
         }
         outputText("[pg]早上她已经不见了。");
         get_camp().sleepRecovery(false);
         get_game().time.hours = 7;
         var _temp_1:* = get_game().time;
         _temp_1.days = _temp_1.days + 1;
         doNext(playerMenu);
      }
      
      public function normalSheilaPregNotifREPEATEDEDHelpABitchOutANDWELP() : void
      {
         clearOutput();
         outputText("[say:唉，]你轻声说道。");
         if(get_player().cor < 50)
         {
            outputText("你把一只手放在希拉肩上，稍稍稳住她，而她的眼泪已经开始往下掉。");
         }
         outputText("[say:没事的。]");
         outputText("[pg][say:我知道，]女人抽泣着说，[say:可感觉所有事情都一下子乱套了！]");
         outputText("[pg]你心里觉得这话其实没什么道理……尽管情况有些特殊，但她并不是第一个因为新生儿而睡不好的父母，也不会是最后一个。你开口告诉她，她只是需要把情绪发泄出来，好让自己冷静下来；村子少一晚肉肯定也能撑过去，护士们会照看好她的孩子——毕竟她们本来就是干这个的。她又哭了一会儿，但没有再那么激烈。");
         outputText("[pg][say:你说得对，]希拉最后吸了吸鼻子，擦去发红的眼睛。[say:我只是……一时被情绪压垮了。我现在没事了。谢了，伙计。]她无力地抱了抱你，然后提起自己的猎物。[say:回头见啦……]");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function normalSheilaPregNotifREPEATEDEDHelpABitchOutANDSTAYDEREBUTLEAVEHERBE() : void
      {
         clearOutput();
         outputText("你让步了，任由这个女人挣脱开来，并在你脸颊上轻轻亲了一下。她把猎物装好，然后转向你。[say: 谢了，[name]。我欠你一次。]");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function normalSheilaPregNotifREPEATEDEDHelpABitchOutANDSTAYDERE2() : void
      {
         clearOutput();
         get_game().time.hours = 5;
         statScreenRefresh();
         outputText("你睡得并不安稳，但也不算完全没用。几个小时后，希拉叫醒你时，你打着哈欠动了动");
         if(get_player().isGoo())
         {
            outputText("；她已经穿好了衣服，看起来刚从外面回来");
         }
         outputText("。");
         outputText("[pg][say: 天快亮了，]她说，[say: 现在出去应该安全了。]女孩开始解开那层草盖，在狭窄的空间里不时蹭到你。");
         if(get_player().get_lust() < 30)
         {
            outputText("你帮了她一把，又帮她收拾好东西。临走前，她在你脸颊上轻轻亲了一下。[say: 谢了，亲爱的。]");
         }
         if(get_player().get_lust() >= 30)
         {
            outputText("一想到这间舒适的小窝棚要被拆掉，也就意味着她温暖的身体再也不会贴在你身上，你心里竟然真的有点难过。她忙活时，你的双手也开始在她身上游走起来。");
            outputText("[pg][say: [name]，别闹，]她笑着说。");
            outputText("[pg]你抬头看着她，问她愿不愿意晚点再走。她看起来有些疲惫，但还是任由你把她拉下来，坐到你身边。[say: 我里面还胀着呢……]她叹了口气。[say: 我觉得现在真没那个力气。]");
            outputText("[pg][say: 嗯，]你回答道，[say: 也许这就是为什么那叫“做”爱吧。]希拉没有回答，只是腼腆地笑了笑。");
            dynStats(DynStat.Lust(get_player().lib / 10 + 5),DynStat.NoScale);
            menu();
            sheilaXP4Sex(false);
            addButton(9,"别管她",normalSheilaPregNotifREPEATEDEDHelpABitchOutANDSTAYDEREBUTLEAVEHERBE);
         }
         else
         {
            doNext(get_camp().returnToCampUseOneHour);
         }
      }
      
      public function normalSheilaPregNotifREPEATEDEDHelpABitchOutANDSTAYDERE() : void
      {
         clearOutput();
         outputText("你带着一抹苍白的微笑，把女人拉了起来。她没有抗拒，却仍旧沮丧地望着你的脸。[say:我累得脑子都转不动了，连先该做什么都想不出来……]");
         outputText("[pg][say:嗯，首先大概是给我们找个地方躲起来，]你提议道。");
         outputText("[pg]希拉点点头，没精打采地四下张望了一会儿。突然，她像是彻底听懂了你话里的意思，眼睛一下子睁大了。[say:呃……[name]，你说的是……我们？]她红着脸问。");
         outputText("[pg][say:找个舒服点的地方，]你肯定道。");
         outputText("[pg]希拉听了微微一笑，但很快又强迫自己摆出严肃的表情。[say:我平时喜欢找一丛高草——可以把中间压倒或者挖开，再用绳子把两边拢起来，这样从空中看就很正常；要是有什么东西发现你，也能很快冲出去。我们两个人的话得找一大片……就像那边那块，]她指着不远处说道。");
         outputText("[pg]没花多久，你们就把草丛整理好并藏了进去，只是里面没有足够空间让你们两个人都躺下。希拉在你");
         if(get_player().hasTailInsteadOfLegs())
         {
            outputText("盘起身子");
         }
         else
         {
            outputText("坐下");
         }
         outputText("之后便依偎过来，接着抓住你的手臂，把它们环到自己的腰上。");
         if(get_player().isGoo())
         {
            outputText("她想了片刻，擦掉一些你蹭在她短裤上的黏液，又从你黏滑的皮肤上挣开。[say:呃……你……我要是把衣服脱了，免得弄坏，你会不会介意？]");
            if(get_player().lib >= 40)
            {
               outputText("你表现出的色眯眯的眼神如此好色，以至于她似乎快要重新考虑了，但你镇定下来，并且");
            }
            else
            {
               outputText("你");
            }
            outputText("只是露出一个灿烂的笑容，就算是同意了。希拉把衬衫从头上脱下来，露出她" + sheilaCup() + "的乳房，可当双手摸到腰带时，她又迟疑地抬头看向你。");
            outputText("[pg]你朝天翻了个白眼。[say: 我们孩子都有了。我早看过了。]");
            outputText("[pg]希拉脸上的红晕更深了，但她还是点点头，把衣服脱完，褪下短裤和内裤，露出光滑的小穴，然后把衣物堆在一旁。她背对着你，再次挪了进来；当她因害羞而发烫的肌肤碰到你时，那阵刺痒般的触感让你忍不住把她抱得更紧。[say: 这样感觉真舒服，]她说，[say: 像泡在热水澡里一样。]你本能地将她赤裸的身体更深地拉进自己体内，希拉紧张地咯咯笑了起来。[say: 嘿、嘿，[name]。别把我吞了，伙计。]你愉快地冒着泡，在她周围放松下来，用一层薄薄的自己覆盖住她锁骨以下大部分裸露的皮肤。");
            dynStats(DynStat.Lust(get_player().lib / 5 + get_player().sens / 3),DynStat.NoScale);
         }
         else if(get_player().hasTailInsteadOfLegs())
         {
            outputText("[pg]她调整好姿势时，你把尾巴缠在她身上，希拉贴着它扭了扭。[say: 这感觉……好怪，]她说，[say: 但不坏。有点像一条又光滑又结实的毯子。能稍微松一点吗，伙计？]你露出一个看不见的笑容，放松了缠在她腰间和臀上的环圈");
            if(get_player().lib >= 40)
            {
               outputText("——但那条滑过她胸前的却稍稍收紧了些。你摩擦着她的乳头，希拉的脖子顿时红了，耳朵也抖动起来，而你在她后颈上落下一吻");
            }
            outputText("。[say: 啊，]她叹了口气，在你的盘绕中挪动着。[say: 就保持这样……]");
            if(get_player().lib >= 40)
            {
               dynStats(DynStat.Lust(get_player().lib / 4),DynStat.NoScale);
            }
         }
         else if(get_player().isTaur() && get_player().get_tallness() >= 60)
         {
            outputText("[pg]空间实在有限，她那双长脚仍然从草叶的遮蔽下伸出一大截，于是她又坐起身，把脚收到了身下。[say: 呃……[name]，我不是想冒犯你，不过……]她的目光瞥向你宽阔的后背，你叹了口气，尽可能舒服地把腿折起来，然后点点头。她咯咯一笑，爬到你身上，随后大致把自己摊开来。");
            outputText("[pg][say: 你挺喜欢马的，对吧？]你问。");
            outputText("[pg][say: 我小时候特别喜欢看小马，]她依偎到你肩上回答道。[say: 我一直想养一匹小的。]");
            outputText("[pg]她亲昵地抚蹭你下半身的样子，甚至还有点可爱");
            if(get_player().sens >= 40)
            {
               outputText("……如果不是有顶在你身上的乳头，以及夹住你侧腹的大腿让你分心的话");
            }
            outputText("。");
            if(get_player().sens >= 40)
            {
               dynStats(DynStat.Lust(get_player().sens / 4),DynStat.NoScale);
            }
         }
         else if(get_player().lowerBody.type == 13 && get_player().tail.type == 11)
         {
            outputText("[pg]她在你的怀抱里挪来挪去，上上下下地蹭得你心烦意乱。[say: 天啊，女人，你到底怎么了？]你问。");
            outputText("[pg][say: 抱歉，伙计……你的羽毛弄得我好痒，]希拉抗议道。");
            outputText("[pg]这里几乎没什么活动空间，就算你知道她哪里痒，也不知道该怎么阻止羽毛继续蹭到她，于是你把环在她身上的手臂松开。[say: 往下滑。]");
            outputText("[pg]她照做了，在你柔软的羽绒腿上靠了一会儿，但很快又坐了起来。你挑起眉看着她，可她只是脱下背心垫在头下，然后又安顿下来，显然自在多了。这让你有点烦躁；你基本上是挺直了身子坐着，姿势端正得不得了。要这么别扭地保持好几个小时，可不太舒服。");
         }
         else if(get_player().lowerBody.type == 7)
         {
            outputText("[pg]她的头才刚躺下，立刻又抬了起来。你用眼神向她发问。");
            outputText("[pg][say: 你的腿又硬又冷得要命，[name]，]她毫不留情地解释道，敲了敲硌进她后背的甲壳。");
            outputText("[pg][say: 好吧，抱歉，]你回答道，几乎有点被冒犯了。[say: 上帝把我造成这样，我也没办法。]");
            outputText("[pg]希拉不高兴地皱起眉。[say:我知道，伙计……我最近就是心情糟透了。]她把手塞进你的手里，试着把头靠在你肩上。[say:别因此就看低我……我还是觉得你棒极了。]");
            outputText("[pg]她渐渐睡去，而你却忍不住琢磨：她刚才那话是不是故意的……");
         }
         else if(get_player().isDrider())
         {
            outputText("[pg]即使你双臂环着她的身体，她还是贴着你发抖。[say:冷吗？]你问。");
            outputText("[pg]希拉点点头。你把她推得坐直，自己站起身，伸展开腿时发出细小的咔嗒声。你从腹部吐出一缕缕长长的丝，在草地上把它们织成一张宽大而粗糙的薄片，再用腿把织好的部分收拢起来。等它差不多有八英尺长时，你把它抖开。它仍然有点黏，但很柔软；你坐下来，把它披在你们两人身上。[say:送你的，]你郑重其事地宣布。");
            outputText("[pg][say:[name]……哇，]她喃喃道，一边依偎着你，一边回头看去。[say:你会把所有女朋友都裹在黏糊糊的白色丝线里吗？]");
            outputText("[pg]你对她这番想当然挑了挑眉，希拉便低下脸，盯着地面，耳朵因为尴尬而剧烈抽动。你把头靠在她头上，这似乎让她稍微平静了一点。");
            outputText("[pg][say:这个我要留下，]希拉轻声说。然后她又用几乎听不见的声音补了一句：[say:这是最近别人送过我最好的东西。]");
            var _temp_1:* = get_player().tail;
            _temp_1.venom = _temp_1.venom - 10;
            if(get_player().tail.venom < 0)
            {
               get_player().tail.venom = 1;
            }
         }
         else
         {
            outputText("[pg][say:抱歉没法让你更舒服点，伙计，]她道歉道。[say:还有……谢谢。]");
         }
         outputText("[pg]你偶尔调整一下姿势，好让你的");
         if(!get_player().isGoo())
         {
            outputText("血液");
         }
         else
         {
            outputText("黏液");
         }
         outputText("保持流动，不确定自己能不能睡着，但希拉就没有这种问题。几分钟之内，这女人就睡死过去，脑袋一点一点地往前栽。你想，这大概意味着第一班守夜归你了……尽管周围景色不错，时间还是过得很慢，不过等你实在撑不住时，你终于把你的同伴推醒了。");
         outputText("[pg][say:唔……再让我睡十五分钟，伙计，]她含糊地嘟囔道。");
         if(get_player().cor < 60)
         {
            outputText("[pg]你累得差点真考虑答应她，直到你想起睡着的人说的十五分钟，在清醒世界里等于两个小时，于是又摇了摇她，直到她起身为止。");
         }
         else
         {
            outputText("[pg][say:我倒是不介意，]你低声说，[say:不过这只小恶魔好像有急事要传话给你。]");
            outputText("[pg]希拉的脑袋瞬间猛地抬起，惊慌地四下张望；等发现并没有小恶魔出现，她转过头来，恶狠狠地瞪着你，然后一巴掌扇在你脸上！[say:这不好笑，混蛋！该死的，我还以为心脏要从胸口跳出来了！]");
            outputText("[pg]你揉着火辣辣的下巴，瞪了回去，并告诉希拉该她守夜了。好吧，至少肾上腺素会让她保持清醒。");
         }
         if(!get_player().isTaur())
         {
            outputText("她不情不愿地换了个姿势，让你能靠在她身上休息。");
         }
         var _temp_2:* = get_game().time;
         _temp_2.days = _temp_2.days + 1;
         get_game().time.hours = 2;
         statScreenRefresh();
         menu();
         addButton(0,"下一步",normalSheilaPregNotifREPEATEDEDHelpABitchOutANDSTAYDERE2);
      }
      
      public function normalSheilaPregNotifREPEATEDEDHelpABitchOut() : void
      {
         clearOutput();
         outputText("你捡起她忘下的帽子给她戴到头上，然后把她的午饭重新用草叶包好，塞进她的背包。");
         outputText("[pg][say: 啊，谢了，伙计，]希拉说道。她犹豫了一会儿，随后像是下定决心，伸手环住你，虚弱地抱了抱你。");
         outputText("[pg][say: 让我帮你吧，]你贴着她耳边低声坚持道。");
         outputText("[pg]那只耳朵在你面前轻轻一颤，女人随即退开，从沉重的眼皮下好奇地打量你。[say: 我倒是不反对，可是……你打算怎么帮？]");
         if(get_player().isTaur())
         {
            outputText("[pg]你凝视着她暗淡的琥珀色眼睛，花了一会儿给自己鼓劲，然后开口道。[say: 上来。]");
            outputText("[pg]希拉迷迷糊糊地盯着你。你朝自己的马身半边竖了竖拇指，她这才慢慢涨红了脸，终于让你话里的意思渗进她缺觉的脑袋里。");
            outputText("[pg][say: 这……呃，你确定吗？]她问道。你叹了口气，稍稍伏低身体，好让她更容易上来。她把手臂搭在你背上，弯下身轻巧地跳到你身上，跨过一条腿。她一只手抓住你的上身，免得自己这个疲惫的女人直接从另一边摔下去；等坐稳之后，另一只手也跟着抓了上来。她又摘下帽子，把它挂在你脖子上，然后喃喃道：[say: 好……我准备好了。]");
            outputText("[pg]你开始小跑起来，希拉把头靠在你身上，懒洋洋地抖着耳朵，时不时看向一侧或另一侧。偶尔她会拍拍你的侧身引起你的注意，指出她想下去布置陷阱的地方，但大多数时候，这段路都在沉默中度过。你们绕着平原巡了好几圈，检查套索，把捕到的动物加进她挂在你背上的包裹里；有一次，你们来到一个已经触发的陷阱旁，你却从希拉的呼吸声里意识到她睡着了，而且肯定已经睡了有一阵！你拉了拉她的手，把这个女人叫醒。");
            outputText("[pg][say: 呃！]她哼了一声，慢慢抬起头。一缕口水从她嘴边连到你的背上，你回头盯了她好几秒，直到她重新意识到自己在哪儿，眼睛猛地睁大。[say: 靠！对不起！]");
            outputText("[pg]希拉飞快地从你身上滑下来，擦了擦嘴，然后取回猎物。[say: 呃……真的，对不起，]她嘟囔着，把猎物固定到包裹上。她的手在你的腰侧停了一会儿，然后开始从你身上卸东西。[say: 这些已经够多了。谢谢。我现在没问题了……]");
            outputText("[pg][say: ……因为你刚睡了一觉？]你替她把话补完。");
            outputText("[pg]她一缩。[say: 我不是故意睡着的，可你身上很暖，而且……我觉得很安心。]");
            outputText("[pg]你不以为意地摆摆手，示意她别尴尬。你让希拉又抱了你一次，并把猎物——还有帽子——挂到她肩上，随后留下她，自己往回走去。");
         }
         else if(get_player().hasTailInsteadOfLegs())
         {
            outputText("[pg][say: 你就照平常那样做，我会想办法的。]");
            outputText("[pg]希拉慢慢点了点头，牵起你的手拉着你往前走。你在她身旁滑行了好几分钟，直到她忽然停下，在你开口问为什么之前就伸手捂住了你的嘴。顺着她的目光看去，你明白了她为什么突然停下：两只大雉鸡警惕地抬起身子，眼睛盯着希拉和你，只要察觉到一丝敌意就会立刻逃跑。你身旁的女人已经在低声咒骂，懊恼自己失去了出其不意的机会。");
            outputText("[pg]不过对你来说，这点惊讶已经足够了。你盯着那些动物，开始缓缓朝它们滑去。希拉想再次抓住你的手，但你已经越过了她，逐渐逼近那些鸟，而它们的身体却反而放松下来。你在大约十五码外停下，开始扭动身体，摆出各种图案，同时用双眼牢牢锁住它们的视线。你的蛇躯一圈圈变成圆形，又变成方形，再变成黏糊糊的三角形，如此反复，用凝视强迫猎物服从。没有你的允许，它们连动弹都做不到，只能在你的招引下走上前来，直到坐在你面前。");
            outputText("[pg]肩上的一碰差点把你从恍惚中惊醒。希拉就在你身旁，满脸难以置信，压低声音说道：[say: 这……简直像作弊啊，伙计。]你差点就忍不住用那种老套的坏笑回应她。");
            outputText("[pg]她趁机收拾好你的“猎物”，随后你们两人在草原上穿行，靠着这样的配合很快就完成了她的份额，甚至还有盈余。[say: 怎么样？]等她身上挂满了猎物后，你向希拉问道。");
            outputText("[pg][say: 老[name]在土里画几个圈，还挺厉害的嘛，]她回嘴道，肩膀被一大堆动物压得微微弓起。[say: 有这么多收获，明天我说不定还能睡个懒觉。]她张开双臂抱了你一下，然后看向你的眼睛。");
            outputText("[pg]她装出一副疲惫的样子，夸张地打了个哈欠，你挑起眉看着她。[say: 哎呀不好了，[name]，你要做什么？别也把我催眠了……]希拉松开拥抱坐了下来，把你们的猎物和她的背包放在身边，然后满怀期待地转向你。[say: 我不是想厚脸皮啦……不过，要不要陪我睡个午觉？]");
            outputText("[pg][say: 哦瞧瞧，]你回道，[say: 又有一个女人想跟我睡觉。]她笑了起来，抓住你的手把你拉下去，依偎到你身边；疲倦很快追上了她，没多久她就带着安宁的微笑睡着了。你看了她一会儿，随后也在阳光的抚慰下沉沉睡去。");
         }
         else if(get_player().canFly() && get_player().hasKeyItem("Bow"))
         {
            outputText("[pg][say: 你就四处走走，把猎物赶出来；看到动物就指给我看。]");
            outputText("[pg]希拉看起来有些困惑，但还是闷闷不乐地点了点头。[say: 好吧，[name]；就按你的办法来。]她开始往前走，见你没有跟上，又回过头来。[say: 你不来——]");
            outputText("[pg]她的问题在看见你时戛然而止：你已经把箭搭在弓上，双翼拍打地面，将自己推向空中。你连招呼都没打一声，就一路升上高空，让太阳落在你侧后方。下方的希拉几乎难以察觉地耸了耸肩，然后继续往前走。");
            outputText("[pg]没过多久，她就指向一小丛草；随着她手臂一动，一只雉鸡腾空而起，试图从她身边逃开。你拉开弓，仔细瞄准那飞速移动的目标前方，然后放出箭矢。重力带着箭下坠，弥补了你拉弓不深的不足，第一箭就把那只鸟钉在地上，当场射杀。希拉走过去把它收起来。接下来的几个小时里都是如此：你的同伴把动物从藏身处赶出来，而你的箭大多都能找到目标。偶尔射偏的几次，也让你摸清了微风对弹道的细微影响；等你累得再也拉不开弓时，你感觉自己的箭术或许真的进步了。你慢慢让疲惫的双翼带着自己落回地面，停在那位已被猎物压得满满当当的同伴身旁。");
            outputText("[pg][say: 哇，[name]，]她一边说，一边带着几分俏皮把你的箭还给你。[say: 真厉害——简直就像我有了自己的守护天使。我现在带回家的猎物已经绰绰有余了，所以你想不想……再一起做点别的？]");
            outputText("[pg]你疲惫的大脑过了一会儿才反应过来：她居然是在跟你调情！你呆呆地回望她，努力让自己眼中的疲惫足够明显，好让你不用开口解释。");
            outputText("[pg][say: 哦……哦！对，抱歉。我都没想到那个，伙计。一边飞一边射箭肯定很累。]你感激地点点头，她则伸手搂住你的脖子。[say: 不过要是你之后想要，这个提议一直有效。]她亲了亲你的嘴唇，然后松开你，慢慢走远，还特意摆动着臀部，回头朝你望来。看来箭术正中她的靶心了？");
            get_player().changeFatigue(20);
         }
         else if(get_player().get_spe() >= 80 && get_player().hasPerk(PerkLib.Runner))
         {
            outputText("[pg][say: 你就照平常那样做，我来帮忙。]");
            outputText("[pg]希拉茫然地看着你，但还是牵起你的手开始往前走。或者说，更像是在漫无目的地游荡。她神情恹恹地转着头，拖着你继续前进。");
            outputText("[pg][say: 所以我们在找什么？]你问道。");
            outputText("[pg]希拉吓了一跳，然后含糊地回答道：[say: 呃。什么有用就找什么——足迹、活物、新鲜的猎物尸体……或者一个安静得能蜷起来等死的地方……]");
            outputText("[pg]不能让她就这么消沉下去；");
            if(get_player().lib < 50)
            {
               outputText("你捏了捏她的耳朵，惹得那只耳朵不耐烦地抖了一下。");
            }
            else
            {
               outputText("你在她屁股上拍了一巴掌，顺手抓了一把，好让她别再沉浸在自己的痛苦里。");
            }
            outputText("[say:该死，[name]……不是现在，]她皱起眉，从你身边躲开。");
            outputText("[pg][say:那就别再盯着地面看了。]");
            outputText("[pg]希拉只是哼了一声，但多少清醒了些。你们又一起走了一会儿，直到草丛里一阵窸窣声把你俩都吓了一跳；一只野兔从藏身处窜出来飞奔而去，你的同伴因为这么近的猎物都错过了而咒骂起来。");
            outputText("[pg][say:你往那边走，别出声……设个陷阱之类的，]你打断她，指向与野兔逃跑路线垂直的方向。");
            outputText("[pg]希拉露出古怪的表情，但还是照做了，朝你指的方向大步跑去。你伸展了一下身体，随即轻松地");
            if(!get_player().isGoo())
            {
               outputText("跑了起来");
            }
            else
            {
               outputText("滑行起来");
            }
            outputText("，绕了一个大圈来到那只警觉动物的后方，然后开始有条不紊地把它往你的搭档那边逼近。她已经把一根绳线系在灌木根部，正朝你打手势，要你把野兔赶进那条线上。");
            outputText("[pg]猎物或许察觉到不对劲，开始朝线的旁边躲闪。为了补救，你又猛地加快速度，凭借奔跑的本事，每当它试图转向逃开时，就在冲刺中追上它，将它逼回原路。就在它跨过那条线的一瞬间，希拉猛地将线绷紧，正好绊住疾奔中的野兔，让它翻滚出去；它还没来得及恢复，你就已经扑上去按住它，等你的搭档靠近，给它最后一击。");
            outputText("[pg][say:[name]，你跑得还真快，]她语气温和地说。");
            outputText("[pg][say:改天跟你赛一场，]你回答道。");
            outputText("[pg]希拉摇摇头，然后半眯着眼侧头看你。[say:啊……不过，太快结束可不是最重要的。你得有能坚持一整天的耐力才行。]她笑了笑。");
            outputText("[pg][say:你什么时候想练，我都奉陪，]你故作含蓄地回答。");
            outputText("[pg]你们就这样把猎物赶出来追捕了好几个小时，在一次次奔走间和这位越来越合拍的同伴互相打趣；她似乎忘了时间，也忘了自己的烦躁，从低头消沉盯着地面，变成了脸红着盯着你。不过最终她捕到的猎物已经足够带回去了，你也只能接受她的感谢，与她告别。");
         }
         dynStats(DynStat.Cor(-2));
         if(get_game().time.hours + 4 < 21)
         {
            doNext(get_camp().returnToCampUseFourHours);
         }
         else
         {
            outputText("[pg]<b>[say:哦，真他妈的。]</b>");
            outputText("[pg]希拉的声音吓了你一跳，你转头看向她。这个女人瘫坐在地上，望着地平线；你仔细一看，能看到她的胸口正颤抖着，像是在强忍啜泣。[say:怎么了？]你问。");
            outputText("[pg]她抬起泪汪汪的眼睛看着你，几乎就要哭出来了。[say:我真是太蠢了……我忘了时间，错过了宵禁……现在这些东西送不回去了，我也没法去看孩子！我得在外面待上一整夜，还得强撑着不睡，然后明天再把这一切重来一遍！]她脸上的镇定已经彻底崩溃了。");
            menu();
            addButton(0,"陪她留下",normalSheilaPregNotifREPEATEDEDHelpABitchOutANDSTAYDERE);
            if(!get_holliScene().holliFollower() && !vapulaSlave())
            {
               addButton(1,"去营地",normalSheilaPregNotifREPEATEDEDHelpABitchOutTOCAMP);
            }
            addButton(2,"唉",normalSheilaPregNotifREPEATEDEDHelpABitchOutANDWELP);
         }
      }
      
      public function normalSheilaPregNotifREPEATEDED() : void
      {
         clearOutput();
         outputText("你踏进平原时，希拉就在这里。她膝上放着一包用草叶裹着、已经打开的食物，帽子倒扣在她身旁。她向你招手，示意你过去。");
         outputText("[pg]你坐下后，她微笑着把点心递给你，然后闭上了眼。你从她的礼物里挑了一小块吃下时，女人的呼吸深沉而均匀。正当你犹豫要不要叫醒她时，她开口了。[saystart][name]……我，啊……又给你的后代添了一员。生下来");
         if(Utils.rand(10) < 7)
         {
            outputText("很健康。它吃得可多了……说真的，是个小闹腾鬼，抓得特别紧，哭声也响亮。[sayend]");
         }
         else
         {
            outputText("有点虚弱……我们一度还以为要失去它了。除非我在旁边，不然它不肯喝奶娘的奶，所以我只好自己整夜陪着它。有点累瘫了。[sayend]");
         }
         outputText("她看向你，让你看到她眼中那一圈圈疲惫的痕迹。");
         outputText("[pg]希拉把手滑进你的手里");
         if(get_player().cor < 40)
         {
            outputText("，你也轻轻握了握");
         }
         outputText("。[say: 我只是想把你的宝宝的事告诉你。不能久留……还得把定额补上。]她拖着步子站起来，转身要走，尾巴无精打采地垂着。连她的耳朵都耷拉下来；这姑娘是真的累坏了。");
         pregnancy.knockUpForce();
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,763,FlagDict_Impl_.arrayReadInt(_loc1_,763) + 1);
         if(sheilaCorruption() > 80)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,760,80);
         }
         menu();
         if(get_player().get_spe() > 80 && get_player().hasPerk(PerkLib.Runner) || get_player().isTaur() || get_player().hasTailInsteadOfLegs() || get_player().canFly != null && get_player().hasKeyItem("Bow"))
         {
            addButton(0,"帮忙",normalSheilaPregNotifREPEATEDEDHelpABitchOut);
         }
         addButton(1,"陪她走",normalSheilaPregNotifREPEATEDEDWalkWithHer);
         addButton(2,"让她走",normalSheilaPregNotifREPEATEDEDLetHerGo);
      }
      
      public function normalSheilaPregNotifNumberOneYepIssue() : void
      {
         clearOutput();
         outputText("[say: 我明白了，]希拉茫然地说道。[say: 很抱歉你这么想……说实话，我自己也不太乐意要个孩子，可生都生出来了。]");
         outputText("[pg]她突然站起身，开始往外走。[say: 认识你挺好的，伙计。你不会再见到我了——我会确保这一点。]话音落下没几秒，她就已经迈开那种迅捷而跳跃的步子狂奔起来，快到根本没有追上的希望。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1210,2);
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,763,FlagDict_Impl_.arrayReadInt(_loc1_,763) + 1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function normalSheilaPregNotifNumberOneCoolDeal() : void
      {
         clearOutput();
         outputText("当你轻轻摇头时，希拉猛地长出一口气，随即张开双臂抱住你，把脸埋进你的肩头。[say: 哦，谢天谢地，]她闷声说道。[say: 说真的，我还没准备好要个小袋鼠崽。做妈妈这种事，感觉像是会发生在我妈身上的。]她又往你怀里蹭近了些。[say: 不过我喜欢抱着它。]");
         outputText("[pg]她松开了你；她刚才埋脸的地方留下了一小块湿痕。看见之后，她用手背抹掉眼泪。[say: 抱歉。不是故意把你弄湿的。]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,761) < 0)
         {
            outputText("[pg]她吸了吸鼻子。[say: 我其实没指望你会这么热情地赞同，知道吧？我是说，咱俩也算不上多亲密，所以我很感激。现在还没法把你们两个带到一起，让你看看它过得怎么样；而且它长大的时候爸爸不在身边，我也觉得各种过意不去。不过……如果你愿意的话，我们可以保持联系，我会把消息告诉你。你……你愿意以后多见见我吗？]");
            outputText("[pg]她用真诚的目光望向你，而你把一只手放到了这个女孩的头上。她笑了，像是已经默认了你的回答。[say: 太棒了……你现在是俺的伴儿了。]希拉又往你怀里靠近了一点，把头枕在你的胸口，让你不禁琢磨她刚才说的那个词到底是哪层意思。你们就这样坐了好几分钟，直到她起身，带着羞怯的一瞥向你道别。");
         }
         else
         {
            outputText("[pg]希拉坐了一会儿，抽着鼻子，揉了揉鼻尖，然后才又开口。[say: 啊……有件事你大概会喜欢。我的队长一直因为我还没给聚落添更多人手而气得不行，所以当我带着一个幼崽出现，还告诉他那孩子……呃，是从哪儿来的之后，他决定延长我在狩猎队的时间。我们还能再见上好一阵子，之后我才会被调回去挖洞或者当兵——我是说，如果你愿意的话。]希拉占有欲十足地伸出一只胳膊环住你。[say: 之前我还没把握，所以没提，不过……如果你真的喜欢我，我想我能说服他，只要我们还在一起，就一直延长下去。]女人的脸涨得通红。[say: ……只要我们继续多生几个。]");
            outputText("[pg]你把一根手指滑进她的腰带里，问她这算不算是在邀请你。");
            outputText("[pg][say: 好色的" + get_player().mf("小子","姑娘") + "，]她回答道，[say: 虽然那肯定很有意思，可我现在母性正上头，得去看看你的宝宝。我可不想当那种把小崽子丢给帮手、自己从来不见的妈妈。]她吻了你一下，然后站起身准备离开——不过当她回头看向你时，眼里那份温柔很明显，她正期待着下一次见面。");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,761) < 4)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,761,4);
         }
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,763,FlagDict_Impl_.arrayReadInt(_loc1_,763) + 1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function normalSheilaPregNotifNumberOne() : void
      {
         pregnancy.knockUpForce();
         clearOutput();
         outputText("你穿过草地远远走来，老远就看见希拉坐在一棵矮树的树荫下。她也同样看见了你，坐在那里朝你挥手，招呼你过去。你带着好奇向她走去。");
         get_images().showImage("sheila-talk");
         outputText("[pg][say: 你好啊，[name]，]她开口道，显得有些紧张。[say: 我有件事得告诉你。坐下说？]");
         outputText("[pg]你照她说的，在她身旁坐下。她亲昵地靠到你身上，可那份紧张并没有消失——甚至还变得更明显了。");
         if(get_player().cor < 50)
         {
            outputText("你伸手揽住她的肩膀，似乎让她稍微安定了一些。");
         }
         outputText("[pg][say: 嗯，是这样的，]她开口道，[say: 我呃……生了……你的孩子。]");
         outputText("[pg]你的表情已经说明了一切，她没等你开口，就急急忙忙地解释起来。");
         outputText("[pg][say: 对我们来说不需要多久，]她有些脸红地说道。[say: 所以你之前也没怎么从我身上看出来……可我昨晚生了个小[name]。孩子吃得挺好，也壮得像头牛。我今天出来打猎时，把小家伙留在托儿所了；现在大概有哪个奶妈正把它舒舒服服地揣在育儿袋里，等妈妈回家呢。等它再长大一点，一周后应该就能看出性别了。呃……这事以后会不会影响我们？]她满怀期待地看着你，显然很想得到你的安慰。");
         menu();
         addButton(0,"嗯，有问题",normalSheilaPregNotifNumberOneYepIssue);
         addButton(1,"没事",normalSheilaPregNotifNumberOneCoolDeal);
      }
      
      public function missionaryForThePurposesOfCreatingImpsWithSheila() : void
      {
         clearOutput();
         outputText("你解开[armor]，彻底脱光，希拉的目光贪婪地掠过你赤裸的身体。衣物褪尽后，你来回抚弄自己的阴茎几下，挤出一滴前列腺液。");
         outputText("[pg][say: 哎呀，你是要把那条黏糊糊的东西强行塞进我的小花里吗？太可怕了！]希拉尖叫着，一只手臂搭上额头，作势晕倒。");
         if(get_player().cor < 40)
         {
            outputText("她这番表演让你的热情稍稍冷却了一点，但看到你脸上露出歉意，");
         }
         else
         {
            outputText("你对她无耻的演戏感到更加愤怒，并且");
         }
         outputText("她却突然笑出声来。[say:我逗你玩呢，亲爱的。你知道我的身体随你怎么用。]");
         get_images().showImage("sheila-corrupted-vag");
         outputText("[pg]她把头发从脸上甩开，向你伸出手。[say:想要我就别装害羞了，我最好的伙伴。]你不情不愿地把手放进她手里，她便把你往前拉，直到你压在她身上。你能感觉到一条湿滑的尾巴贴着你的[cockFit 56]下侧轻轻施压，引导它摆正位置。[say:毕竟，这里才是你该待的地方。欢迎回家。]她用双臂搂住你的");
         if(!get_player().isTaur())
         {
            outputText("肩膀");
         }
         else
         {
            outputText("肋侧");
         }
         outputText("，瞳孔因兴奋而跃动；有那么一瞬间，你甚至沉浸在她的热情里，忘了她的恶魔身份，只看见身下那个真诚又爱慕着你的女孩。[say:现在，顶进来！]");
         outputText("[pg]希拉轻轻把你拉下去，一股温热包裹住你的[cockHeadFit 56]，它挤过她发烫的阴唇。她的命令在你耳边回响，再加上这股触感，你几乎只能勉强按自己的节奏滑进去享受，而不是对她言听计从。你一寸寸滑入她的小穴，她不耐烦地咬着嘴唇。[say:你可真会吊人胃口，[name]。你明知道我有多想让你进来，却每次都要我等。]你开始缓慢地抽插她；她的背弓了起来");
         if(sheilaCorruption() >= 40)
         {
            outputText("，柔软的乳房也随之晃动");
         }
         outputText("，你的顶弄带来的快感让她倒抽一口气，迫使她重新调整姿势，好再一次找到那处。[say:就是那里！你的肉棒<b>最棒了！</b>狠狠干我，你这该死的精液喷管！]");
         outputText("[pg]当她抬起身亲吻你的胸口，用嘴唇在你的[skinfurscales]上游移，留下一路酥麻的神经时，克制瞬间烟消云散。你的");
         if(!get_player().isTaur())
         {
            outputText("手臂");
         }
         else
         {
            outputText("前腿");
         }
         outputText("摇摇晃晃，你得集中全部注意力，才不至于倒在这个女人身上，化成一滩没骨头的软泥；几乎已经没什么能阻止你抽动的腰胯满足她的要求了。你一次又一次把骨盆狠狠撞向她的身体，引得你这位毫不知羞的伴侣发出欢喜的叫喊。[say:噢，是的！把你的种汁灌满我，混蛋！]希拉用胳膊和双腿缠住你的后背" + (get_player().isTaur() ? "，几乎把自己从地上抬起来，用小穴死死套住你的[cockFit 56]，不让你抽出去" : "") + "。");
         if(get_silly())
         {
            outputText("[say:让我感觉自己又回到十五岁，在田野里和犬变种们玩闹的时候！]天哪，真要命！");
         }
         else
         {
            outputText("[say:你就是为了这个才来的！一滴都不许漏！]");
         }
         outputText("[pg]你试着抵抗，可你已经能感觉到肌肉放弃了除逼出高潮以外的一切。你小心地倒在爱人的身体上，把她的");
         if(sheilaCorruption() < 40)
         {
            outputText("紧实");
         }
         else
         {
            outputText("柔软");
         }
         outputText("胸口压向自己");
         if(get_player().isTaur())
         {
            outputText("，身体也随之前倾瘫下");
         }
         outputText("。你的肉棒");
         if(get_player().cockTotal() > 1)
         {
            outputText("和它的");
            if(get_player().cockTotal() == 2)
            {
               outputText("兄弟");
            }
            else
            {
               outputText("兄弟们");
            }
            outputText("一起胀大并喷射");
         }
         else
         {
            outputText("胀大并喷射");
         }
         outputText("，把你的精液灌进希拉饥渴的小穴里");
         if(get_player().cockTotal() > 1)
         {
            outputText("，还在她胯间裹上一层白浊");
         }
         outputText("；她的眼睛亮了起来，有那么一瞬间，你感觉她的身体仿佛正把精液直接从你体内吸出来");
         if(get_player().cumQ() >= 500)
         {
            outputText("，直到她被灌满，余下的精液才随着高潮慢吞吞地自行淌出");
         }
         outputText("。她亲吻着你");
         if(get_player().isTaur())
         {
            outputText("的前腿");
         }
         outputText("，深情而投入地");
         if(get_player().cockTotal() > 1 || get_player().cumQ() >= 500)
         {
            outputText("，而多余的精液正从她胯间滴落");
         }
         outputText("，然后她松开你，抬头看向你的脸。");
         outputText("[pg][saystart][name]，你");
         if(get_player().cumQ() >= 500 || get_player().cockTotal() > 1)
         {
            outputText("洒出来了一些。要是你在操草地，我怎么怀上你的孩子啊。而且你");
         }
         outputText("射得太早了；我还没尽兴呢。[sayend]");
         outputText("[pg]这婊子刚才是不是……看到你瞪大眼睛，希拉咧嘴大笑起来。[saystart]开玩笑的，伙计！冷静点！");
         if(Utils.rand(10) <= 6)
         {
            outputText("我用了点力量帮你射出来。别因为这个恨我；你把种子交给我的时候，那张高潮的脸实在太可爱了。[sayend]女人把手放在自己的肚子上，肚脐下方。[say:谢谢你给我这个。希望能怀上，这样我就能养大一个强壮的小恶魔，让他和" + get_player().mf("他父亲一样多产","他母亲一样性感") + "。]她再次轻柔地吻了吻你，而你呻吟着翻身离开。[say:你的精子最棒了，]希拉低声说，[say:所以快点再来找我吧。我还会想要更多的。]你的恶魔站起身来，对你眨了眨眼，然后走开了，尾巴愉快地摇晃着，一缕白浊顺着她裸露大腿上的棕色皮肤流下。");
            get_player().orgasm("Dick");
            dynStats(DynStat.Lib(-1));
            sheilaPreg();
            if(get_game().get_inCombat())
            {
               get_combat().cleanupAfterCombat();
            }
            else
            {
               doNext(get_camp().returnToCampUseOneHour);
            }
         }
         else
         {
            outputText("我稍微推了你一把，因为我真的太想让你的精液射进我身体里了……不过如果你愿意，我们还可以继续哦？看着我的眼睛，爱人，看看我有多需要你。[sayend] 尽管高潮已经让你精疲力尽，你还是根本无法把注意力挪到别处，只能呆呆地盯着身下的少女。她脸上慢慢绽开笑容，眼中闪着光，一幅画面在你脑海里成形：你一遍又一遍地干着希拉，每天都把异常多的精液灌进她的小穴里");
            if(get_player().hasVagina())
            {
               outputText("，而她的小恶魔后代们则轮流从背后对你做同样的事");
            }
            else
            {
               outputText("，而她的小恶魔后代们围在周围，一边抚弄自己，一边在高潮时不时把滚烫而污浊的精液喷在她或你的身上");
            }
            outputText("。");
            if(get_player().lib < 40)
            {
               outputText("震惊之下");
            }
            else
            {
               outputText("脸上发烫");
            }
            outputText("，你移开视线，切断了这份连接，可希拉的笑容却只变得更灿烂了。");
            outputText("[pg][say:你看见了吗？我们共同的未来？] 恶魔伸手上来，拨弄着你的头发。[say:我们美好的家庭……我们的孩子……他们会像他们的[father]一样，满是可供播撒的精种。我能感觉到你又在我体内硬起来了——我让你兴奋了吗？] 她的手滑到你的嘴边，用拇指轻轻摩挲你的嘴唇。[say:为什么不再来干我一次呢？让我看看你的心意吧，亲爱的；我除了抚摸你之外什么都不会做，所以你可以慢慢来。我是你顺从又爱你的妻子，就是为了让你开心才在这里的。] 她最后一次抚过你的脸颊，然后把手放到你的胸口，一边漫无目的地画着圈，一边用期待的目光看向你。");
            get_images().showImage("sheila-corrupted-vag");
            outputText("[pg]这实在太过火了。");
            if(!get_player().isTaur())
            {
               outputText("你吻上希拉的嘴唇，把舌头探进去与她纠缠，同时双臂撑起这具已经被掏空的身体，重新摆好姿势准备再次挺入。");
            }
            else
            {
               outputText("你伸下一只手，贴在希拉的脸旁；她的耳朵轻轻一抖，眼神明亮地看着你，有那么一瞬间，你又想起了先前对她的印象——一个甜美而全心全意的爱人。你的双腿吃力地撑起你那马一样庞大的身躯，重新回到抽插的姿势，用挺立的肉棒把她的下体拖得抬了起来。");
            }
            outputText("少女咯咯笑着，看你把阴茎抽出一截，连带着一些先前射进去的精液也被带出来，从她体内痒痒地淌下，顺着屁股滴到地上。[say:感觉真好……再灌我一次。提醒我，我是谁的女人；提醒我，你在我的小穴里留下了什么！] 这一次你随心所欲地进出着，再也感觉不到她之前施加在你身上的强迫感。她湿漉漉、还淌着精液的性器开始在你周围发热，那湿滑得让你轻易挺入的感觉也逐渐影响了你的节奏；很快，你便又像刚才在她力量影响下短暂做到的那样，充满劲头地在希拉体内抽送起来。");
            outputText("[pg]恶魔满意地呻吟起来。[say:所以你到最后还是干得这么快了……天、天啊，你可真懂我喜欢怎样！继续！] 她抬起另一只手，兴奋地同时揉捏起两颗乳头。她的阴道夹住你的肉棒，起初因为里面液体太多而有些使不上力，但随着收缩越来越强，夹得也越来越紧。你也顺着她的意思加大了自己挺动的力道，看着这女人在狂喜中颤抖扭动，疲惫早已被抛在脑后。[say:啊、啊、啊，要去了，快要去、去了，来吧[name]，继续，顶到最舒服的地方……]");
            outputText("[pg][say:哦，<b>[name]</b>！跟我一起去！] 希拉尖叫着，再次用身体缠住你，一股不属于你的情欲浪潮冲刷过你全身。");
            if(get_player().cor < 50)
            {
               outputText("她高潮时，小穴剧烈痉挛，你感觉一股热流吞没了你的[cock biggest]，从顶端开始一路蔓延到根部。当那股热意抵达根部时，她涌出的体液冲破了小穴与你之间的密封，把你的精液也一并挤了出来，喷出一股白浊与透明混杂的液体。恶魔的阴道夹紧又淌液，持续了足足半分钟，把她污浊的爱液全都倒在你紧贴着她的身体上，直到你的胯间被她黏热的液体浸透，并以自己的方式作出了回应。");
            }
            else
            {
               outputText("她高潮时，小穴把你往里吸，你能感觉到一波又一波越来越汹涌的前列腺液被从你的肉棒里抽出来；那感觉几乎像是她在牵扯你的整个存在。没过多久，你的肉棒便抽动起来，开始给她那贪婪的性器送上第二份精液。");
            }
            outputText("她全身瘫软下来，抽搐的小穴接管了一切，开始从你的肉棒上喝走它能得到的每一滴，用来补回你刚才挤出去的黏液");
            if(get_player().cumQ() >= 500)
            {
               outputText("；这一次你几乎能把所有精液都射进她体内，因为上一轮之后你的产量仍然有些跟不上");
            }
            outputText("。肌肉再次无力下来，你又一次俯身压到她身上，任由她抚摸你的");
            if(!get_player().isTaur())
            {
               outputText("后背");
            }
            else
            {
               outputText("身侧");
            }
            outputText("，等她平复下来。");
            outputText("[pg][say: 太棒了，[name]，]她终于说道。你瞪了她一眼，又戳了戳她的腰侧作为回应；她在你还没准备好之前又逼出了你一次高潮，这让你有些恼火。");
            outputText("[pg][say: 啊哈哈，]希拉咯咯笑了起来，正确理解了你这个报复的小动作。[say: 我骗你的，抱歉。不过你知道的，情侣一起高潮真的很浪漫嘛。]");
            outputText("[pg]她在你身上轻轻亲了一下，一只手贴上你的脸颊。[say: 恭喜你，亲爱的；你居然连性魔都能满足……还想再来一次吗？]你睁大眼睛，慌忙从她身上爬起来，肉棒从她的小穴里滑出，在她腿上拖出一道白痕，而她笑个不停。希拉坐起身，在你试图转身离开时抓住你的手，然后把它放到自己小腹下方。");
            outputText("[pg][say: 这里就是我们的宝宝会成长的地方，亲爱的。谢谢你给了我这个。很快再见。]她松开手时，眼神也柔和下来，随后站起身，开心地摇着尾巴离开了。你花了几分钟恢复体力，然后收拾好东西，也离开了。");
            sheilaPreg();
            get_player().orgasm("Dick");
            dynStats(DynStat.Lib(-1));
            get_player().slimeFeed();
            if(get_player().cor < 50)
            {
               get_player().slimeFeed();
            }
            if(get_player().cor < 50)
            {
               dynStats(DynStat.Cor(10));
               sheilaCorruption(-10);
            }
            else
            {
               dynStats(DynStat.Cor(-10));
               sheilaCorruption(10);
            }
            if(get_game().get_inCombat())
            {
               get_combat().cleanupAfterCombat();
            }
            else
            {
               doNext(get_camp().returnToCampUseOneHour);
            }
         }
      }
      
      public function loseToSheila(param1:Boolean = false) : void
      {
         var _loc2_:* = null as Array;
         clearOutput();
         if(get_player().get_HP() < 1 && !param1)
         {
            outputText("这位刚才还与你为敌的对手见你因伤倒下，眼中闪烁着兴奋的光芒，随即朝你跑来。恶魔急切地剥下你的[armor]，但你已经撑不到享受那份乐趣了。意识渐渐滑远，你昏了过去。");
            var _temp_1:* = get_game().time;
            _temp_1.hours = _temp_1.hours + 8;
            if(get_game().time.hours > 23)
            {
               var _temp_2:* = get_game().time;
               _temp_2.hours = _temp_2.hours - 24;
               var _temp_3:* = get_game().time;
               _temp_3.days = _temp_3.days + 1;
            }
            menu();
            addButton(0,"下一步",loseToDemonSheila);
         }
         else
         {
            _loc2_ = [];
            if(get_player().hasCockThatFits(56))
            {
               _loc2_[int(_loc2_.length)] = loseToNormalSheilaAndGetRidden;
            }
            if(get_player().hasCock() && get_player().biggestCockArea() > 56)
            {
               _loc2_[int(_loc2_.length)] = tailSpadeSoundingForFuckHugeDongsWithDemonSheila;
            }
            if(get_player().hasVagina())
            {
               _loc2_[int(_loc2_.length)] = clitSwellingDemonSheilaClitSoundingAnal;
            }
            if(get_player().get_gender() == 0)
            {
               _loc2_[int(_loc2_.length)] = aintGotNoGenderAndKangarooRaped;
            }
            _loc2_[Utils.rand(int(_loc2_.length))]();
         }
      }
      
      public function loseToNormalSheilaAndGetRidden() : void
      {
         clearOutput();
         var _loc1_:int = get_player().cockThatFits(56);
         outputText("希拉把你推倒在地");
         if(get_player().isTaur())
         {
            outputText("你不得不放下前腿支撑身体，最后坐在后腿上");
         }
         else
         {
            outputText("并分开双腿。恶魔解开你的[armor]，轻而易举地从你的下身剥了下来");
         }
         outputText("露出了你的[cocks]。");
         outputText("[pg]");
         if(get_player().cockTotal() > 1)
         {
            outputText("[say:这些看起来都棒极了，不过……今天我想要这根，]她说着，选中了你的[cockFit 56]。");
         }
         outputText("她用手握住它，开始上下套弄，挤出一滴前液抹到自己的掌心。[say:你还真急啊，]希拉咯咯笑道。[say:已经快要射了吗？这可不行……我还想再多玩一会儿呢。]");
         outputText("[pg]恶魔松开了你的阴茎，全神贯注地看着它上下跳动和抽搐，然后凑到你面前，并且");
         if(get_player().isTaur())
         {
            outputText("把你的前腿搭到她肩上，");
         }
         outputText("把她那对" + sheilaCup() + "乳房");
         if(sheilaCorruption() < 100)
         {
            outputText("压在你身上，让她的乳头摩擦着你的乳头。");
         }
         else
         {
            outputText("用力压在你身上，甚至在你的胸口两侧挤开。");
         }
         outputText("[say:真是个" + get_player().mf("帅小伙","漂亮妹子") + "，还长着这么棒的鸡巴，]她低声说，[say:看来我得骑上去好好玩玩你了。刚进去可别马上射出来！]");
         outputText("[pg]希拉恶狠狠地咧嘴一笑，坐到你的[cockFit 56]上，以慢得折磨人的速度让它滑进自己的小穴");
         if(get_player().hasCock())
         {
            outputText("，同时把你没用上的那截肉棒夹在她大腿之间");
         }
         outputText("；随着她压低身子，每多进入一寸，你都能感到新的热意。女人呻吟着扭动腰肢，[eachcock]都因痛苦的勃起而抽动。");
         if(get_player().balls > 0)
         {
            outputText("[pg][say: 哎呀，]她看着你翻白的眼睛说道。[say: 忍不住了？好吧，伙计，既然你这么快就要喷出来，那至少得让你喷个够！]");
            outputText("[pg]在恶魔身后，她那黑色、短粗的铲形尾尖不祥地悬在你的[sack]上方，而旁边那条棕色的尾巴缠住了它，挤压又抚弄。一缕深色油状分泌物从末端滴落；落下的瞬间，你的[balls]开始痛得发烫。又一滴灼热的黏液从你的恶魔情人身上滴到你娇嫩的卵蛋上，令你胃里一阵翻腾；那感觉就像有什么东西在里面，正试图朝四面八方顶出来。");
            if(!get_player().isTaur())
            {
               outputText("希拉用双手捧住你的脸，把它按进自己的乳房里，轻声安抚着你。");
            }
            outputText("[pg][say: 很快就会结束的，亲爱的……]恶魔柔声哄着，用力甩动尾巴，把你的阴囊涂满。");
            outputText("[pg]没过多久，那股可怕的恶心感便退去了，可压力只是变得均匀地分布开来；非要说的话，反而更强烈了一点。你疑惑地看向女人的小穴下方，只见一个红肿的囊袋映入眼帘，上面覆着一层深色油光，几乎膨胀到了原来的两倍大！");
            outputText("[pg][say: 啊哈哈，]希拉笑道，[say: 现在有好多小精子要给我的小穴了吧？]确实，光是看着你新近胀大的[balls]，你就感到憋得厉害……仿佛再不射出来，它们就要从你的毛孔里渗出来了！你的[cockFit 56]再次硬起，与其说是纯粹的欲望，不如说是迫切的本能；当它填满她的阴道时，你的恶魔愉悦地哼唱起来，开始上下起伏腰胯，用屁股拍打你敏感的[sack]，并在你耳边低语。[say: [name]……光是想到你会用那么多精液灌满我，我就要兴奋得不行了。]");
            outputText("[pg]你赞同地呻吟起来；她在一次角度绝佳的起伏中，让你胀硬的肉棒重新滑入她的小穴，[cockHeadFit 56]擦过她的阴道壁，挤出一股浓稠的淫液。[say: 天啊，]恶魔喘息道，[say: 连你的前列腺都在拼命干活呢，伙计！你的预精本身就像一次射精……我再也等不及你射出来了！现在，把你的种子给我！]");
            outputText("[pg]希拉的小穴在你周围痉挛，她直视着你的双眼；你从她眼中感到一阵强迫感，而每一处你的[skin]触碰到她身体的地方，都有欲火涌入你体内。无法抵抗她由高潮催动的力量，你的[balls]向肉棒根部收紧，你释放出高潮，抓住她的腰，把精液倾泻进她的小穴");
            if(get_player().cockTotal() > 1)
            {
               outputText("和腿间");
            }
            outputText("，就像她也在把感情倾泻进你的脑海里一样。[say: 亲爱的！]她尖叫道。[say: 用你的孩子把我塞满！]");
            get_images().showImage("sheila-loss-male");
            outputText("[pg]事到如今，你又怎么可能忍得住……你的[cockFit 56]用浓稠的精液填满她的小穴，压力开始把它挤进她的子宫；希拉惊叹地张着嘴，而你的卵蛋再次向上收紧，第二次高潮开始了！你用你的");
            if(get_player().isTaur())
            {
               outputText("前腿");
            }
            else
            {
               outputText("双手");
            }
            outputText("把她压到你肉棒根部，从她的小穴里挤出一团精液，紧接着又有更多精液涌出，因为你再次射了出来。这些精液里的精子浓密得惊人，厚得几乎像胶体；它在她皮肤上微微颤动，几乎不往下滑，而你的腰胯还在撞向她。这个过程几乎持续了");
            if(get_player().cumQ() < 250)
            {
               outputText("十分钟，又经历了两次");
            }
            else if(get_player().cumQ() < 1000)
            {
               outputText("三十分钟，又经历了四次");
            }
            else
            {
               outputText("五十分钟，又经历了八次");
            }
            outputText("高潮，但最终，你的卵蛋终于排空了那份由恶魔诱发的负荷，而你的情人也抽身离开，站了起来。");
            outputText("[pg][say:我这辈子大概从没觉得这么满过……]希拉梦呓般说着，捧着自己的肚子，成团的精液像雪崩一样从她的小穴里缓缓滚落出来。你直接瘫倒在地，而在她终于停下抚摸小腹、想象着自己将要孕育的孩子时，你早就昏睡过去了。她俯下身。[say:射完就睡……真不像话啊，伙计。我甚至还没来得及告诉你我爱你呢。]恶魔在你脸颊上亲了一口，又捏了捏你的阴囊，这才走开，下半身已经完全被染成了白色。你打盹时，肿胀的蛋蛋慢慢瘪了下去，只是并没有缩回最初那么小。");
            pregnancy.knockUpForce(25,72);
            var _temp_1:* = get_player();
            _temp_1.ballSize = _temp_1.ballSize + 1;
            if(get_player().ballSize < 10)
            {
               var _temp_2:* = get_player();
               _temp_2.ballSize = _temp_2.ballSize + 1;
            }
            var _temp_3:* = get_player();
            _temp_3.cumMultiplier = _temp_3.cumMultiplier + 1;
            get_player().orgasm("Dick");
            dynStats(DynStat.Cor(10));
            sheilaCorruption(-10);
            if(get_game().get_inCombat())
            {
               get_combat().cleanupAfterCombat();
            }
            else
            {
               doNext(get_camp().returnToCampUseOneHour);
            }
         }
         else
         {
            outputText("[pg][say:喂，[name]，]希拉说着，在抵达你[cockFit 56]的根部时停了下来。你抬头看向她，等着她接下来又要说什么。[say:你觉得你的种子是从哪儿来的？]");
            outputText("[pg]你直截了当地问她这话是什么意思。");
            outputText("[pg][say:这个嘛。你又没有蛋蛋，]恶魔继续说道，慢慢开始让自己的小穴顺着你的家伙往上滑。[say:所以……你怎么会有精子？又怎么能让别人怀孕？]");
            outputText("[pg]你呻吟一声，回答说她才更该知道吧，毕竟她是本地人。");
            if(get_player().isTaur())
            {
               outputText("你用前腿强迫她向下，以便");
            }
            else
            {
               outputText("你抓住她的臀部，");
            }
            outputText("帮她把自己贯到你的家伙上。");
            outputText("[pg]当你的[sheath]顶到她的外阴时，恶魔浑身一颤。[say:是、是啊，可我以前也没留意过这种没蛋蛋却能长鸡巴的奥术怪事啊，伙计……在你插进我之前，我可没想过自己会跟你这种奇怪的[race]上床。我一直想嫁给像我爸那样的普通男人。]");
            outputText("[pg][say:抱歉，]你烦躁地打断她，把她往上推开，[say:但现在是</i>你<i>自己在往里面坐。还有，要是你那么想上你爸，就去找他，别来烦我。]");
            outputText("[pg]希拉的眼睛顽皮地闪了闪。[say:等我见到他的时候我会的，亲爱的。在那之前，你就先享受我这份投错地方的爱意带来的全部好处吧。]她又一次坐下你的肉棒，扭动臀部，让你蹭上她小穴里另一侧的软肉。[say:我注意到，我们这段小聊天倒是让你没像处男一样太早射出来……]");
            if(get_player().cor < 70)
            {
               outputText("[pg]你尴尬得身体一僵。希拉笑了笑，在你的[skinfurscales]上亲了一口，然后一脸无辜地看着你。[say:别生气嘛，伙计。我只是想让我们在一起的时间更久一点。]");
               outputText("[pg][say:是吗？]你回了一句，开始更用力地干这个恶魔，想把她刚才消磨掉的兴致补回来。希拉呻吟着，任你把[cockFit 56]凶猛地顶进她的穴里，在入口处来回摩擦，把你们混在一起的体液抹满她的胯间。");
               outputText("[pg][say:是啊……]你顶中她的敏感点时，她从齿缝间抽着气，嘶声说道。[say:你是我的唯一。]");
            }
            else
            {
               outputText("[pg]她这带刺的告白让你更加烦躁，你皱起眉头。[say:说得好像我在乎你爽不爽似的，你这麻烦精，]你回嘴道，开始粗暴地将她的臀部上下顶动。[say:你就不能闭上嘴，让我射出来，然后滚到一边去，在我睡觉的时候给我弄点吃的？]");
               outputText("[pg]希拉一边被你斥骂、被你撞击小穴，一边揉捏着自己的乳房。[say:哈哈……你想要自己的女人就是为了这个？把你粗鸡巴里的精液吸干，然后给你端晚饭？我可以啊……不过我可不保证不会对着你的饭撸尾巴。我每天不高潮一次，脾气就会变坏。]");
            }
            outputText("[pg]这场粗暴的性交继续进行，把你重新推向高潮；但不管你怎么用力干她，你的恶魔伴侣似乎都始终比你更接近顶点。她含情脉脉地望着你的眼睛，而你的每一次挺动都震得她身体发颤。");
            outputText("[pg][say:你知道的吧，我其实不在乎我们这段关系里谁在上面，]她说道。[say:支配啊服从啊，这些东西全是狗屁，根本不重要。只要我知道你永远不会把我甩掉，我愿意做任何你喜欢的事，也愿意当你肮脏的奴隶。]希拉用双臂环住你的胸膛，借力让自己顺着你的肉棒向上抬起，眼神因兴奋而湿亮。[say:我想要的是对你最好的东西，伙计……而对你最好的就是我，也只能是我。只、只要你同意这一点，我就不再逗你，立刻就跟你结婚，这样我们就能开始一起生活了！]");
            outputText("[pg]恶魔松开你，任由重力和你的压力再次把她压回下方，她的小穴也开始在高潮中淌出淫液、喷溅起来。[say:啊……要、要去了！你也一起！跟我一起射吧，亲爱的！]希拉俯下身，把嘴唇贴在你身上，像是在亲吻，又像是在流口水；一股陌生的高潮浪潮从她皮肤接触你的地方传进你体内，你借着恶魔传来的快感开始射精。你的精液积在她的小穴");
            if(get_player().cockTotal() > 1)
            {
               outputText("和腿间");
            }
            if(get_player().cumQ() >= 1000)
            {
               outputText("；她很快就到了极限，随即退开，一边撸动你那黏糊糊、一塌糊涂的[cockFit 56]，让你把最后几股全都喷在她的脸和胸口上");
            }
            if(get_player().cumQ() >= 6000)
            {
               outputText("。剩下的量实在太多，等你射完时，她简直像被淹在里面一样；她咯咯笑着，覆盖在她唇上的黏稠液体里冒起一串气泡");
            }
            outputText("。");
            get_images().showImage("sheila-loss-male");
            outputText("[pg][say:真有意思，]希拉笑着向后挪开，在草地上留下一道白色痕迹。[say:回头见……记住我说的话，伙计。拿出点胆量，早点向我求婚吧。]她被自己的玩笑逗笑了，接着朝你送来一个湿漉漉的飞吻，站起身准备离开。真正出力的大多是你，于是你趁机一头栽倒，昏了过去。");
            get_player().orgasm("Dick");
            dynStats(DynStat.Cor(10));
            sheilaPreg();
            sheilaCorruption(-10);
            if(get_game().get_inCombat())
            {
               get_combat().cleanupAfterCombat();
            }
            else
            {
               doNext(get_camp().returnToCampUseOneHour);
            }
         }
      }
      
      public function loseToDemonSheila() : void
      {
         clearOutput();
         get_images().showImage("sheila-corrupted-loss");
         outputText("八小时后，你醒了过来，浑身青一块紫一块，酸痛不已……却发现自己正躺在地上，脑袋枕在希拉的大腿上；她心不在焉地抚摸着你的[hair]。[say:醒了？]她低头看着你，咧嘴一笑。[say:话说回来，你身上那些伤都是哪儿来的？你知道的……要是那些野东西让你吃了苦头，你可以找我帮忙——我们回我那儿去，整天光着身子待在一起。我们的小恶魔会给我们送吃的喝的。也会带来新的玩伴。想跟我回家吗？]");
         outputText("[pg]你脑中的迷雾开始散去。你刚才真的被一个恶魔照看着吗？");
         outputText("[pg]希拉紧张地支支吾吾起来。[say:嗯，除非我允许，不然谁都不能碰你的身体。我不准。还有……还有，我最爽的时候，是能看到你高潮时的表情。那样太可爱了。我才不会趁你睡着就直接干你。除、除非你想让我那么做，呃……]");
         outputText("[pg]女人给自己鼓了鼓劲，重新把思绪拉回正轨，表情也变得严肃起来。[say:不，别管那个了。要是你总是惹上这些麻烦，我可不会等你开口求我。我会把你带走，不管你愿不愿意。你是我的，一想到你去跟哪个勒索混混硬碰硬，最后把命丢了，我就受不了。起来。]");
         outputText("[pg]你仍有些动摇，但还是站起身来，也让希拉跟着起身。她眯起眼看着你，然后再次开口。[say:小心点，伙计。一想到我的[boy]被垃圾货色糟蹋，我就恶心得要命。]女人没再多说，转身离去，留下你自己走回营地。");
         get_player().orgasm("Generic");
         get_player().set_HP(get_player().maxHP());
         get_player().changeFatigue(-50);
         get_combat().cleanupAfterCombat();
      }
      
      public function letSheilaGo() : void
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,761) >= -3)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,761,-1);
         }
         get_combat().cleanupAfterCombat();
      }
      
      public function leaveScarredBlade() : void
      {
         clearOutput();
         outputText("你选择不拿走这把军刀，任由它生锈。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2175,-1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function leavePregDemonSheila() : void
      {
         clearOutput();
         outputText("你对她摇摇头，往后退开。她有些闷闷不乐，随后开口道。[say: 看在你上次把我伺候得那么舒服的份上，这回我就放过你吧。不过下次，你可得给我一点……满足。]她用一根手指挑逗似的顺着胸口往下划，朝你露出半个笑容。");
         if(get_player().hasCock())
         {
            outputText("你的拒绝并没有阻止她亲自完成这桩情事。她把渗着液体的铲形尾端滑进自己的入口，猛烈地抽送起来。[say: 怎么？]她开口，把你从走神的凝视中惊醒。[say: 我现在可是一直都很想要，而你又不肯陪我，所以……走吧。说不定会有更有趣的人找到我，一起加入呢。]湿滑的尾巴又一次格外深入地顶了进去，她仰起头，毫不在意地朝刺眼的太阳喊出自己的快感。她自慰时湿黏的噗嗤声一路跟着你，直到这片领域的魔法猛然将你带回营地。");
         }
         if(get_player().hasCock())
         {
            dynStats(DynStat.Lust(10));
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function jojoRuinsTheAnalHateFuck(param1:Boolean = true) : void
      {
         if(param1)
         {
            clearOutput();
         }
         else
         {
            outputText("[pg]");
         }
         outputText("你的嘴角咧开一抹病态的笑，盘算着干脆照她的要求去做。[say: 乔乔……]");
         outputText("[pg]他的耳朵立刻竖了起来。[say: 是，[master]？]");
         outputText("[pg][say: 你要给这个没用的女人她想要的东西。从她屁股里拔出来，改去操她的小穴。不过，先把自己擦干净。我要你进去的时候干得像骨头一样。她要是真想把子宫派上用场，那就让她自己湿起来。]");
         outputText("[pg]乔乔听到这话扬了扬眉，但还是安静地把渗着液体的肉棒拔了出来，在恶魔的大腿上蹭掉黏滑的前列腺液。与此同时，希拉正忙着想把小穴弄湿；你一把抓住她的手，将它拉开。[say: 一个合格的奴隶可不总能享受有只空手的待遇。你的身体得自己学会！]");
         outputText("[pg]那只老鼠像是在给你的话加上句点一般，把干燥的阴茎猛地插进她的小穴，希拉在它没入体内时疼得皱起脸。[say: 啊……！这太过分了，伙计！]你无视她的抗议，与乔乔对上视线，微微点头。他开始顶弄这个紧绷的女人，因血肉摩擦而咬紧牙关。你把他的尾巴拉紧，然后紧紧缠在他的肉棒上，压住他大量涌出的前列腺液。");
         outputText("[pg][say: 太粗暴了！]希拉呜咽道。[say: 要是我一点都享受不了，根本湿不起来！]");
         outputText("[pg]你双手捧住她的脸，抚摸着她的脸颊。[say: 可我这不是在给你想要的东西吗？你刚才说想让精液射进小穴里，难道全都只是说说而已？光是想着被种子填满，被奴隶的鸡巴塞进孩子，变成你想当的种马，你难道不会兴奋吗？你不想感受他败给你身体的紧致，把滚烫的精液喷出来，涂满你小穴内壁，把对你的崇拜全都射给你吗？不想感受它往更深处探索，扩散开来，用温热填满你，搜遍每一处角落，直到滑进你的子宫，找到你的卵子，孕育出新的生命吗？]");
         outputText("[pg]希拉害羞地移开视线，嘴唇翕动着，脸又红了起来；乔乔似乎也轻松了些，你低头看去，能看到她发亮的淫液沾在他的家伙上，证明你的话起了作用。随着他顶得更用力，她也开始主动上下滑动，身体发颤，喉间哼出声来。[say: 哦，[name]，你说得对！我感觉到了！我要去了！]");
         outputText("[pg]你俯下身，抓住你那位鼠僧根部的阴囊；你一捏，他便发出一声尖细的吱叫，精液的去路被你堵住。你凑近到喘息的恶魔耳边，对着它吹气，又轻轻咬弄，等待她迎来高潮。当她开始抽搐颤抖，亲昵地用脸颊蹭着你时，你退开一些，贴着她耳边低声说道。");
         outputText("[pg][say: 我骗你的。只要我在，就绝不会让你这种烂货生孩子。]你危险而温柔的语气让希拉瞪大双眼，她的神经被点燃，高潮开始涌上来。[say: 你就是一块自我放纵的垃圾，根本不配繁殖。你嘴里吐出一堆冠冕堂皇的废话，身体却来者不拒，只要还有谁能对着你这副破烂身子硬起来，你就什么鸡巴都能接——哪怕是条狗，只要它肯听你胡扯，你也照样会让它操。我不爱你。我也不知道怎么会有人爱得上你。你还不如住在洞里，浑身沾满泥土。你是……字面意义上的……我认识的最糟糕的女人。]她张着嘴，小穴如决堤般喷涌，悲伤让她无法控制自己，只把少许情绪释放给乔乔；当希拉的痛苦与兴奋化作浪潮冲击他时，他开始伏在她背上哭泣，尽管他的鸡巴仍随之痉挛，射出第一次徒劳而空虚的高潮。");
         outputText("[pg]希拉此刻也哭了起来，一边抽搐发抖，一边让她的恶魔身体把污秽和不想要的感情倾泻进你的奴隶体内。他的睾丸肿胀起来，鸡巴也是；你能看见它在那些体液浸泡、渗入之下逐渐变粗。希拉腋下冒出一对小小的尖角，腐化之力在乔乔的头骨上强行催生出恶魔般的角，随后向上弯曲，越过她的肩膀");
         if(sheilaCorruption() >= 90)
         {
            outputText("，随着它们变粗，把她的乳房挤在一起");
         }
         outputText("。事实上，老鼠本人似乎也在长大。他的双脚踢蹬挣扎，腿部惊人地拉长，同时长出看起来十分危险的指甲。随着体重增加，他白色" + (get_noFur() ? "" : "-furred") + "的皮肤开始像旧破布一样绽裂剥落，露出下面新生的深色血肉。");
         outputText("[pg][say: 啊！]希拉尖叫起来，把你的注意力拉了回来。[say: 它顶到我的……我的子宫了！]乔乔的鸡巴显然不只是变粗，也在变长。你看准机会，用手指捏住她的阴蒂，带着挑逗意味揉弄起来，引出这个女人又一波高潮；短暂的片段涌入你的脑海，让你感受到她的绝望，也让你的嘴里泛起苦涩，直到你切断接触。她竟真的在希望父亲此刻能在这里抱住她，借肩膀给她哭泣。希拉再次高潮，新的液体喷涌而出，浸透乔乔的鸡巴；随着他的尺寸再度增大，疼痛地将龟头顶过她的宫颈，她的声音化作女妖般的哀嚎。");
         outputText("[pg]她无法集中体内失控的恶魔能量来打开子宫，过量的震惊反而让她安静下来，双眼也变得呆滞；乔乔的阴茎刺入那些本不该容纳它的地方时，她的尖叫终于彻底消失。");
         if(sheilaCorruption() >= 40)
         {
            outputText("她的乳房绷紧起来，罩杯迅速缩小；那位");
         }
         else
         {
            outputText("那位");
         }
         outputText("前僧侣的睾丸再次膨胀到篮球大小，阴囊也从你手中滑脱，因为上面的皮肤正在剥落——你的手里只剩下一片正在碎裂的残皮。终于能射精后，乔乔的阴囊猛地上提，鸡巴上青筋暴起，开始喷射。乔乔把精液直接灌进希拉的子宫里，她的眼睛翻到脑后；他最近才膨大的睾丸产出的精液远超平常。精液无处可去，她的肚子被撑得远远超过正常容量，让你稍微有些担心。随着她被填满，乔乔的鸡巴里竟然隆起一个凸块，并缓慢向上移动；那东西卡在希拉小穴入口处时，前僧侣呻吟着挣扎起来，而她的小穴像虎钳一样死死夹住他膨胀得荒唐的阳具。他嚎叫着想要歪头，却只是用新长出的角把希拉在自己鸡巴上又顶高了一点。你伸手下去帮忙，居然能隔着他勃起的肉棒摸到里面有什么坚硬的东西，于是你用双手轻轻引导、推送它向上，直到它滑进阴道。");
         get_images().showImage("sheila-corrupted-superjojo");
         outputText("[pg]射出最后这团东西后，乔乔放松下来，向后倒去，也把那个肿胀的女人一起带倒。你惊讶地眨了眨眼，看着他伸展开身体；他现在至少有八英尺高，甚至衬得希拉都显得娇小。后者的脸色恢复得稍微正常了些，因为仰躺的僧侣和逐渐消肿的肉棒终于把龟头从她宫颈中抽离，她的双手立刻按向自己圆鼓鼓的腹部。[say: 哦，天啊……太多精液了……]在她的推挤下，乔乔的鸡巴周围开始缓缓渗出细流。随着渗出的黏液覆盖他的胯部，他又开始喘息，液流也在他再次硬起来时被截断。希拉这才第一次意识到自己的处境，开始在乔乔的角间挣扎，想把几乎变平的胸口从这副骨质束具中拔出来，可根本没有足够活动的空间。不过，她的挣扎一定惹恼了这位前僧侣；他抬起两只巨大的手抓住她的臀部，将她稳住，然后再次顶弄起来，从被塞满的小穴里悠闲地挤出一摊摊精液。希拉的脸在龟头再次顶到宫颈时皱紧，你低头望向紧绷女人身下那只曾经的老鼠。迎接你的并不是奴隶那双温顺听话的眼睛，而是一双坚硬、贪婪的恶魔之眼。");
         outputText("[pg][say: 那么，]你宣布道。[say: 我很荣幸主持这两位的神圣婚礼。现在我宣布，你们结为精液与垃圾桶。]你俯身靠近希拉，低声说道：[say: 也许，如果你能当个足够称职的妻子，甚至还能挤出个孩子来。你得听话又聪明，才不会让你的新丈夫为了报复就一天二十四小时不停地干你，连拔都不拔出来……但就算他真那么做，你也会接受的，对吧？毕竟，被操就是你的用途。]");
         outputText("[pg]你苦笑着离开身后潮湿的交合声，心里想着，下次再召唤乔乔时，他还会不会应声而来。");
         dynStats(DynStat.Lust(get_player().maxLust(),DynStatOp.Eq),DynStat.Cor(10),DynStat.NoScale);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1210,4);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,80,1);
         if(get_game().get_inCombat())
         {
            get_combat().cleanupAfterCombat();
         }
         else
         {
            doNext(get_camp().returnToCampUseOneHour);
         }
      }
      
      public function getBeatUpBySheila() : void
      {
         clearOutput();
         outputText("你在希拉面前瘫坐下来，喘着粗气；这个女人");
         if(get_monster().get_lust100() < 75)
         {
            outputText("趁机抓起她的猎物，拔腿就跑！就算你想追，现在也追不上她了……你倒了下去，脑袋里满是");
            if(get_player().get_HP() < 1)
            {
               outputText("五彩斑斓的光点");
            }
            else
            {
               outputText("关于她的幻想：她除了帽子外一丝不挂，正张开双腿等着你");
            }
            outputText("。");
            get_combat().cleanupAfterCombat();
         }
         else
         {
            outputText("盯着你，脸上欲望与怯意交战。她的大腿不由自主地互相摩擦，想强迫自己离开却怎么也做不到……慢慢地，她朝你迈出一步。");
            outputText("[pg][say: [name]……你不是恶魔吗？] 希拉眼神炽热地问道。");
            outputText("[pg]你迷迷糊糊地摇摇头。你才眨了下眼，她就扑了上来，把身体贴向你，夺走一个漫长而热烈的吻，也让你的思绪重新集中起来。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,761) > -4)
            {
               outputText("[pg][say: 别因此恨我……] 她低声说。");
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,761,-2);
            }
            addButton(0,"下一步",sheilaLossRapeRouter);
         }
      }
      
      public function fuckBuddySheilaMeetingMaybeLater() : void
      {
         clearOutput();
         outputText("你告诉她你现在没时间，但起身时还是捏了捏她的膝盖。");
         outputText("[pg][say: 好吧，]她有些低落地答应道。[say: 那就下次吧。]");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function fuckBuddySheilaMeetingJustHangOut() : void
      {
         clearOutput();
         outputText("作为回答，你伸手捏了捏她的屁股，然后");
         if(!get_player().isTaur() && !get_player().isDrider())
         {
            outputText("把自己的屁股往前挪了挪");
         }
         else
         {
            outputText("把腿盘在身下");
         }
         outputText("躺在灌木丛的阴影里。");
         outputText("[pg][say: 坏家伙……]她说着，语气里却没什么恶意。她滑到你身边，贴在你身侧。[say: 要是我睡着了就叫醒我，好吗？答应我！]");
         outputText("[pg]你放松下来，任由思绪飘远。云影安静地在你的视野中来去，直到你终于想起该继续动身了。你瞥了希拉一眼，确认这个女人果然已经睡着了，完全信任你会护她周全。你轻轻推了推她的肩膀，她猛地惊醒。");
         outputText("[pg][say: 什——哦，对，]她眨着眼说道。[say: 已经要走了？好吧……我想我也该走了。]");
         outputText("[pg]她站起身，从灌木丛下取回自己的收获。[say: 谢谢你陪我。抱歉在你旁边睡过去了，我最近没怎么睡；不管什么时辰都有一堆活要干。]");
         outputText("[pg][say: 真可怜啊，]你回答道。她咧嘴一笑，转身走开，随后又回过头来，朝你飞了个吻。");
         outputText("[pg][say: 下次你再碰见我的时候，说不定我就有兴致找点乐子了，]她说道。[say: 注意安全。]");
         dynStats(DynStat.Lust(-10),DynStat.Cor(-1));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function fuckBuddySheilaMeetingChatWhyHide() : void
      {
         clearOutput();
         outputText("她看着你，眼神阴沉，带着怀疑。[say: 嗯，就像我之前说的。要是有恶魔抓住我们中的一个，我们就完了。你肯定也知道，恶魔一旦能让某个傻瓜把快感看得比什么都重要，并且也变成恶魔，他们就会得到一份免费纪念品——那些能赋予力量的小水晶。想想看，要是有一百来个我们聚在同一个地方，只差一点刺激就能把我们变成一场狂欢派对，外加一堆免费的神力小饰品，有多少混账会乐疯。你明白的，那就是所有恶魔都会想要。]");
         outputText("[pg]她瞪着你，你却摆摆手不以为意。看起来大家待在一个地方应该还是更好，可以互相照应，而不是在没有支援的情况下慢慢枯萎。");
         if(get_game().telAdre.isAllowedInto())
         {
            outputText("毕竟，不管她心里怎么想，沙漠里的那座城市看起来都热闹得很，而且武器林立，足以抵抗恶魔。");
            outputText("[pg]希拉不屑地哼了一声，想了想，又开口道。[say: 也许吧……可一颗坏苹果就能从里面毁掉整筐。下次你去那里，不妨问问他们，有多少次差点因为某个色迷心窍或者贪心的浑小子只顾自己，把脏东西带进去，害得大家无家可归。我们也许弱到你能端掉一两个洞穴，但我们繁殖得快，总能活到数量足够多、可以反击的那一天。]她摇了摇头。");
         }
         outputText("[pg][say: 反正也不是你想的那样；并不完全是。我们会在交换会上和其他殖民地保持联系——如果某个族群需要食物，我们就给他们食物。如果他们需要人手清理荒野，确保安全，或者建立新的殖民地，我们就拿起武器去帮忙。躲起来只是为了更容易看住自己人，也能在……万一真出了事的时候，把附带损失降到最低。]");
         outputText("[pg]希拉微微打了个寒战，抬起你的胳膊搭在她肩上，然后神情阴郁地望向平原远处。她似乎已经没心情再说话了。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function fuckBuddySheilaMeetingChatOldLoves() : void
      {
         clearOutput();
         get_images().showImage("sheila-private-talk");
         outputText("[say: [name]，我不想谈那个，]希拉说，[say: 一提起来我就觉得恶心。]");
         outputText("[pg]你提出可以讲讲你自己的过去，当作引子，但她摇了摇头。[say: 那个我也不想谈！听着，不管一个人多见多识广，也没人真想听自己姑娘脸上曾经长过多少根鸡巴。我是说，到底多少才算合适的答案？]");
         outputText("[pg]你换了个说法，指出希拉因为她的……情境共感……多少会从他们那里继承一些性格，所以你了解一点也是公平的，对吧？");
         outputText("[pg]她半垂着眼看你。[say: 你这假设可太离谱了。而且，就算你知道了，伙计，你也做不了什么特别的事。我就是我。反正也没那么重要，毕竟如果……嗯，我会越来越接近</i>你<i>的性格。]希拉妩媚地看着你。");
         outputText("[pg][say: 这是不是意味着，总有一天你</i>会<i>愿意谈这件事？]你咧嘴笑着问。");
         outputText("[pg]那女人忍住笑。[say: [name]，这不好笑。我……大概会吧，不过我现在抵触得厉害，所以还得过一阵子。真的，没什么可知道的；我保证。等我们在一起久到连口音都一样了再问吧——也许是十年幸福婚姻之后。]");
         if(get_player().lib < 50)
         {
            outputText("[pg][say: 真会那样吗？伴侣说话会越来越像？]私下里，你连听懂她一半的用词都很难想象，更别说自己用了。");
            outputText("[pg][say: 会的……我妈以前说话像个富家小姐。我小时候她也还是那样。可她跟我爸在一起那么久，又那么……频繁之后，不管我脑子里怎么把他们分开，他们现在都差不多成同一个人了。不是说用词会互相串过去，只是那些词听起来不再别扭了。我已经偶尔会发现自己在想你会怎么称呼某样东西，还得在跟我哥们儿开口之前先改回来——不过也可能只是因为我觉得你特别棒。]希拉露齿一笑，捏了捏你的手。");
            outputText("[pg]就像这个……“bonzer”到底是什么意思？");
            outputText("[pg]那女人脸上微微泛红，低头看去。[say: 呃……]她嘟囔道，[say: 意思就是你很棒，[name]。一等一的。我最喜欢的" + get_player().mf("小伙子","姑娘") + "。]");
            outputText("[pg][say: 哦。是这样吗？]你故意打趣道。");
            outputText("[pg][say: 别这么逗我啦，]她说着，把你的手臂拉过去搂住自己。[say: 你真是要把我逼疯了。]");
            outputText("[pg][say: 你会习惯的。]");
         }
         else
         {
            outputText("[pg][say: 你刚才是在向我求婚吗？]");
            outputText("[pg]希拉的脸一下子涨得通红。[say: 没有。]");
            outputText("[pg][say: 嗯，要是你想开始算那十年的话，最好快点哦。]");
            outputText("[pg]女人移开视线，双臂抱在胸前");
            if(get_player().cor >= 60)
            {
               outputText("——虽然这大概是想摆出防备的姿态，可结果只是把她白衬衫底下的乳房挤在一起，又被浅棕色的肌肤衬托出来");
            }
            outputText("。[say: [name]，你这个满脑子黄色废料的混蛋，我才不会嫁给你。为了晚上能睡在一起，就得一路从一大群怪物中硬闯过去见你，还要轮班守夜——这种事偶尔一次也许挺浪漫，但可不是我下半辈子每天都想过的日子。]");
            outputText("[pg]你有些不安，问她是不是真这么想——如果恶魔没有被打败，你们的关系会变得很艰难，她是不是就打算不再见你了。");
            outputText("[pg]希拉想到这个合乎逻辑的结论，显得越来越难过。[say: 不、不要……我不想！]她最后像个孩子似的脱口而出，放下姿态，一把抱住你。[say: 我不想放开你，也不想在你在外面冒险的时候，自己只能躲在地下；我想留在你身边！我真希望那些恶魔统统下地狱去，这样我就能过上正常日子了！]她就这样抱了你好几分钟，脸贴在你身上，直到抽鼻子和发抖都停下来");
            if(get_player().cor < 30)
            {
               outputText("；你把一只手放在她肩上，安抚着她");
            }
            outputText("。最后她又退开了些，鼻尖微微发红。[say: 抱歉，伙计；我不是故意冲你闹脾气的。]");
            outputText("[pg][say: 那你还是打算撑下去？]你小心地问。");
            outputText("[pg]希拉不高兴地皱着眉，没有回答……但她确实一直摆弄着你的手，一根根拨动你的手指，又把它贴在她温暖的脸颊上轻轻摩挲，直到她该离开为止。");
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function fuckBuddySheilaMeetingChatLiveWithMe() : void
      {
         clearOutput();
         outputText("你邀请希拉搬到你的营地和你一起住，她的脸一下子涨得通红。");
         outputText("[pg][say: 伙计，我都还不怎么了解你呢。我是说……呃，如果我们……呃，我能感觉到你的感觉，好像也没法拿这个当借口。不是。答案是不行。]");
         outputText("[pg]看到你失望的样子，她稍微软了下来。[say: 如果这是另一个世界，一个没有恶魔的世界，那也许可以；等我们再多相处一阵子之后。但此时此地？我们需要每一个能帮忙守卫、找吃的伙伴，我没法说服自己把族群抛在身后。我确实喜欢你……不过别太得意。]她把手覆在你的手上，在你脸颊上亲了一下。[say: 谢谢你开口问我。]");
         outputText("[pg]希拉站起身，把猎物平衡地扛到肩上，神色有些怅然。可当你问起时，她只是摇摇头，说没什么，然后情绪低落地走开了。看起来，她其实真的很想答应你。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function fuckBuddySheilaMeetingChatKidsRest4Now() : void
      {
         clearOutput();
         outputText("[say:随时都想，]你回答道，[say:不过如果你需要放松一下、睡一会儿，我也可以陪你这样。]你把手抽回来，拍拍她的脸颊。");
         outputText("[pg]希拉吻了吻你的额头，然后把头靠在你的");
         if(get_player().isTaur())
         {
            outputText("后背");
         }
         else
         {
            outputText("膝上");
         }
         outputText("。[say:你真好……谢谢。你这两个提议我都会接受——不过今天下午也许就先小睡一会儿吧。大概一个小时后叫醒我好吗？]");
         outputText("[pg]你点点头，她便打起盹来；睡着时她的脸平静多了。一小时后，你轻轻把她推醒，她起身给了你一个拥抱，随后离开。[say:爱你，[name]。]");
         dynStats(DynStat.Cor(-1));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function fuckBuddySheilaMeetingChatKids() : void
      {
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,763) == 1)
         {
            outputText("[say: 啊？]希拉有些不好意思地转向你说道。");
            outputText("[pg][say: 我是说，“孩子怎么样了？”]你重复道。");
            get_images().showImage("sheila-private-talk");
            outputText("[pg][say: 我听见了，伙计……只是有点意外。]希拉挽住你的胳膊。[say: 宝宝挺好的。吃得香，也喜欢别人关注。前几天我把手指伸进那只胖乎乎的小手里，结果它一下子攥住我，怎么也不放……我就那样坐了差不多一个小时，只顾着看着它叹气。有时候我都觉得自己快变成以前总让我尴尬的那种傻乎乎的新手妈妈了。]她带着一丝笑意看向你。");
            outputText("[pg][say: 握力很强？]你问。");
            outputText("[pg][say: 你对这件事真的很认真，不是吗？] 希拉嘟囔着。你点点头，她继续说道。[saystart]你让我想起了我爸爸……自从我把小袋鼠带回家并告诉他我们的事后，他就一直待在育儿室里照看它。他说他想见见那个能和他宝贝女儿生下这么健康宝宝的男人—— ");
            if(get_player().get_femininity() > 50)
            {
               outputText("不过我不知道他看到你这么漂亮的脸蛋会有什么反应；他不知道我是——");
               if(get_player().get_gender() >= 2)
               {
                  outputText("[sayend][pg][say: 是女同性恋？喜欢女人？吃蛤蜊的？]");
               }
               else
               {
                  outputText("[pg][say: 喜欢的是漂亮男孩，而不是高大强壮、毛茸茸的熊男？]");
               }
               outputText("你猜着逗她，惹得她脸红得更厉害。");
               outputText("[pg][say: [name]，别闹了。]");
            }
            else
            {
               outputText("我也不确定他到底是想跟你握手，还是想揍你一拳。[sayend]");
               if(get_player().get_gender() <= 1)
               {
                  outputText("[pg][say: 听起来……挺护着你的。]");
               }
               else
               {
                  outputText("[pg][say: 你觉得他真会揍一个女孩吗？他肯定特别护着你，]你打趣道。");
               }
               outputText("[pg]希拉叹了口气。[say: 我是爸爸的宝贝女儿。他的第一个孩子，占尽了他时间上的好处，而且我自己也没有孩子和丈夫来把感情从他那儿分走。我一直都是他的宝贝……也许持续得比本该有的更久，但我那时候很孤单，伙计。我们很亲。]");
            }
            outputText("[pg][say: 所以，他是认真的……想见我？]你小心地追问。");
            outputText("[pg]希拉看着你的眼睛，试图读懂你的表情。[say: 嗯，我觉得是认真的。我希望他不是打算堵你，不过……他说等他被调回狩猎队，就会想办法找到你。]");
            outputText("[pg][say: 那会很快吗？]");
            outputText("[pg][say: 我不知道，伙计，]她耸了耸肩，肩膀抵着你的手臂。[say: 这全看殖民地需要什么。要是我们损失了猎人，或者带不回足够的食物，就会从其他队伍和预备队里抽人来补缺——只要是能胜任这活的人都行。否则就得等他的轮换排到，前提是我们别先损失士兵或挖掘工。]");
            outputText("[pg][say: 这种事经常发生吗？]你追问道。[say: 我是说，猎不到足够的猎物？]");
            outputText("[pg][say: 不……不常发生。不是所有猎人都负责打猎——新来的蝾螈小饼干大多只是被派出去，跟着一个会飞的同伴采野果和野菜。比起背着沉甸甸的篮子四处跋涉、在泥地里刨上十个小时，我能布陷阱然后打个盹，不过那也只是因为我们擅长弄到肉的兄弟实在不多。对受过药剂师训练的人来说，食物净化也是狩猎工作的一部分，不过殖民地里的预备役在这方面帮了不少忙。所以你可能一周后就见到他，也可能活一辈子直到死都见不着他——这全看下一个没法继续干活的人是谁。]");
            outputText("[pg]你点点头，努力忍住笑意，因为脑海里浮现出她爸爸穿着粉色园艺罩衫、手拿铲子，肩上扛着两袋根茎蔬菜的画面。希拉看见你几乎藏不住的笑，便戳了戳你的腰侧。[say: 有什么好笑的吗，伙计？]");
            outputText("[pg]你摇摇头，靠到她身上；你们就这样待着，直到她起身离开，向你道别。");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,763) < 10)
         {
            outputText("[say: 那孩子们怎么样了？]");
            outputText("[pg]希拉垂着眼微微一笑。[say: 他们挺好的，亲爱的。有些已经长得挺大了。]");
            outputText("[pg]她把双手分开八到十英寸。你扬起眉毛表示惊讶，她便解释道。[say: 不过你要记得，他们出生时很小……刚出生大概只有四英寸。我们会把他们塞进小袋子里保暖，让他们贴着乳头。]");
            outputText("[pg]四英寸？难怪她的身材能保持得这么苗条");
            if(get_player().lib > 50)
            {
               outputText("，小穴也能这么紧、这么热");
            }
            outputText("……你问他们要多久才能长大。");
            outputText("[pg][say: 嗯，]希拉说道，[say: 我不知道你的孩子会怎样，不过纯种孩子大概两年左右就能起来帮殖民地干活了——那时候他们差不多有三四英尺高。只是些简单的事，比如帮他们的妈妈或爸爸从仓库把小袋食物带回家。再过两年，他们基本上就算成年了……当然，没成年人那么懂事，不过那时候他们就会开始起色心、找伴了，不管家里的长辈怎么劝都没用。荷尔蒙的魔力嘛，世界都任他们折腾，差不多就是这样。]");
            outputText("[pg]你立刻意识到其中的含义，便问她多大了。五岁？十岁？");
            outputText("[pg]希拉笑了。[say: 不是，伙计；比那大多了。不过我可不会告诉你到底大多少。]她眯起眼，装出怀疑的样子，又咧嘴一笑。[saystart]一位 " + get_player().mf("绅士","淑女") + " 可不会问另");
            if(get_player().get_gender() >= 3)
            {
               outputText("一位");
            }
            outputText("女士的年龄，对吧。[sayend]");
            if(get_player().lib >= 50)
            {
               outputText("[pg][say: 可我又不是什么 " + get_player().mf("绅士","淑女") + "，]你反驳道，凑近她耳边，用话语轻轻撩拨她。[say: 再说了，我只是因为你的皮肤这么光滑，乳头又这么挺才问的……]你轻咬她的耳垂。[say: 而且你的小穴夹起来还像第一次一样。]");
               outputText("[pg][say: [name]！]希拉尖叫一声，往后退开，甩了你一巴掌。[say: 你这个下流的色耗子！]");
               outputText("[pg]你咧嘴一笑，揉了揉脸颊。女人红着脸，耳朵也耷拉下来；她移开视线，嘟囔道，[say: 对不起……我不是故意要打你的。你只是吓了我一跳。]");
               outputText("[pg][say: 别迁怒传话的人嘛，]你打趣道，伸手揽住她的腰。她颤了一下，却没有反抗，任由你的手指沿着她的衬衫下摆游移，直到她起身准备离开。");
            }
            else
            {
               outputText("[pg][say: 所以你真的能做到？]你换了个话题问道。[say: 才四岁就能生自己的孩子？]");
               outputText("[pg]希拉点点头。[say: 大多数队长都不鼓励这么做，因为一天里根本没那么多时间，既要好好学一门手艺，又要抚养孩子。可年轻又欲求不满的时候……那些幼崽通常就会被留在托育所，再由某个保育员收养。我妈现在好像就带着一个。对生下孩子的那个姑娘来说，真是心都碎了。]");
               outputText("[pg]你小心地看着她，问她是不是有亲身经历。");
               outputText("[pg][say: 什么？没有……]希拉迎上你的目光。[say: 我只是因为我妈的身份，见得太多了。总有可怜的小姑娘在后半夜哭着跑到我家门口，求着再多抱一会儿自己的孩子。我爸妈一边安慰她，一边劝她回家睡觉，免得第二天精神不济，成了什么强奸野兽的猎物。怀孕容易得跟滚下坡似的，怎么小心都不为过。]她握紧你的手，把额头抵在你的肩上。[say: 怀上你的，才是我的第一次，伙计。]");
               outputText("[pg]希拉叹了口气，没再说什么；看来她已经没有心情继续聊下去了。最后她站起身，给了你一个拥抱，然后离开了。");
            }
         }
         else
         {
            outputText("[say: 孩子们还好吗？]");
            outputText("[pg]希拉转向你，脸色憔悴而布满纹路。[say: 你说呢，伙计。]看着那张脸，你能清楚地看出，你那一大窝孩子已经把多少压力刻进了她的皮肤里。她身上的青春气息消失了；天真被一个老练母亲的神态取代，尽管她的身体看起来几乎没怎么变。你咬了咬嘴唇。");
            outputText("[pg][say: 我知道；你不用说，]希拉低声说道。[say: 我在倒影里看得见。我甚至都不漂亮了。]");
            outputText("[pg][say: 那是——]你刚想开口，试图反驳，可她摆摆手，把你的话挡了回去。");
            outputText("[pg][say: 我不是在讨夸，伙计……别放在心上。就算拿整个魅魔军团的美貌来换，我也不会拿你，或者你的任何一个孩子去换。]她把手滑进你的掌心。[say: 就连那个小魔头也不换。]");
            if(get_player().lib >= 50)
            {
               outputText("[pg][say:你还是让我欲火难耐，]你低声坚持道。[say:无论何时何地，我都想要你的身体。比如这里。或者……这里。]说最后这句话时，你的手滑进她的衬衫，覆上一只" + sheilaCup() + "的乳房。希拉脸红了。");
               outputText("[pg][say:[name]，就知道你永远不会变。你……真的想做爱吗？]她那双因操劳而憔悴的眼睛望进你的眼里，重新燃起了些从前的热情；你的指尖下，她的皮肤也热了起来。");
               dynStats(DynStat.Lust(get_player().lib / 10 + 5),DynStat.NoScale);
               sheilaXP4Sex(false);
               addButton(9,"先休息",fuckBuddySheilaMeetingChatKidsRest4Now);
               return;
            }
            outputText("[pg][say: 你就没有别人能帮你看一会儿吗？]你问道。");
            outputText("[pg]希拉的眼神冷了下来。[say: 有啊……我妈主动提过。有几个邻居也想帮忙，但我妈悄悄把她们都赶走了，说她很乐意接手，毕竟是自家人的事。]");
            outputText("[pg][say: 所以……？]");
            outputText("[pg][say: 孩子们已经整天都待在育儿室里，听她和那群老巫婆不停灌输那些屁话——什么“女人的工作”就在家里，像我这样的姑娘跑到外面、离开孩子就是不对。当然她从来不会把话说得这么直白，可孩子会从眼睛看到的东西里学。就因为我懒得去接他们，我可不想让我的孩子晚上再跟她回家，听她开小灶。我都能想象她会怎么说……“你们妈妈工作累坏了，得先休息一下才能见你们，所以你们就跟我回家吧，姥姥会照顾好你们的。”放她的屁。]");
            outputText("[pg]这话……怨气重得有点吓人。");
            if(get_player().cor < 40)
            {
               outputText("你小心地拍了拍她的肩膀，提议道，[say: 我可以替你看一会儿。]");
            }
            outputText("[pg][say: 天啊，那可太好了。但在他们准备好学习一门手艺之前，我不能把他们带出殖民地；规矩就是这样。只有保育员可以带出去，而且也得是在她们需要给一班孩子教些基础东西的时候——上就是上，石头就是石头，诸如此类——她们出门时还会有士兵小队护送。再说我也不想那么做……不是不信你，但我们只有两个人，却有" + Utils.num2Text(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,763)) + "个孩子。不过我真希望能把你带进去。]");
            outputText("[pg]你问她为什么不能，毕竟到现在为止已经很明显了，你又不是什么怪物。");
            outputText("[pg]你的同伴看起来非常不开心。[saystart]别让我解释一项我自己都讨厌的规定。我最想要的，就是晚上能和你一起睡在真正的床上，而不是独自熬夜，担心你会不会出事");
            if(get_silly())
            {
               outputText("，还紧紧抱着我做的[name]等身抱枕");
            }
            outputText("。但现在还不可能。[sayend]");
            outputText("[pg]真可惜。你安慰地搂住她，她依偎到你怀里。[say:要是你需要睡一会儿，]你提议道，[say:我可以守着你一个小时。]");
            outputText("[pg][say:谢谢。这主意不错。]没多久她就彻底睡着了，毫无顾忌地在你身上流口水；约好的一个小时过后，你轻轻拍醒了她。");
            outputText("[pg]希拉叹了口气，站起身来，朝你点点头，然后收拾起自己的东西。[say:爱你。很快再见。]");
            if(get_player().cor < 40)
            {
               dynStats(DynStat.Cor(-1));
            }
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function fuckBuddySheilaMeetingChatFamilyAndFriends() : void
      {
         clearOutput();
         get_images().showImage("sheila-private-talk");
         outputText("[say: 他们？他们过得挺好。]希拉故作迟钝地盯着你，想逼你换个话题；你也直直盯回去。她叹了口气。[say: 不行，是吧？]");
         outputText("[pg][say: 既然我们可能永远都见不到他们，你至少该跟我说说他们的事吧，]你温和地提醒她。");
         outputText("[pg][say: 好啦，好啦。呃……我也说不好，他们挺普通的吧。我爸是个好人，跟大家一样在殖民地里干活出力。他干起活来跟老兵一样卖力，我一直觉得他是个骄傲又坚强的士兵——不过那也可能只是他女儿眼里的样子。]她淡淡地笑了笑。[say: 不过论设陷阱，我可比他强；他太闲不住了。动来动去的，猎物都被他吓跑了。]");
         outputText("[pg][say: 那你妈妈呢？]你追问道。");
         outputText("[pg]希拉皱起眉。[say: 我妈……算是个大人物。她是护士，所以不用参加常规执勤，只在预备队里。她一直在托儿所照顾孩子。]");
         outputText("[pg]听起来倒也不错……奇怪的是，希拉好像并不这么觉得。");
         outputText("[pg][say: 护士得帮忙维持育儿室运转，伙计。她们会被鼓励服用药剂，确保自己一直大量泌乳。按惯例，她们还被期望生孩子——一个没有孩子的护士，在受尊重的程度上就是社会最底层，所以她们也全都在吃助孕药，或者一天到晚跟人做，或者两样都来。大多数日子里，爸回到家做的第一件事，就是把妈带去一间空屋待上十分钟……不过育儿室满员的时候，就得是我们出去腾地方，好让他用主屋。]希拉郁郁地看着你。[say: 以前他在军务组的时候，我其实偷偷高兴得不行。他会因为训练累得没力气做爱，所以我反而能不被打扰地和他待一会儿，给他读每日公告，或者在小盆里给他洗衣服，听他讲他排里的故事。换成其他岗位时，就总是“哈蒂，跑一圈去把你的弟弟妹妹们找回来，开始做饭，我和你妈要独处一会儿。”]");
         outputText("[pg]听到那个昵称，你忍不住笑了笑。希拉脸微微一红，才继续说下去。[say: 现在除了他，已经没人这么叫我了。总之，因为我妈是那样的人，我们队长很看重我们家。我的大多数姐妹都在她手下受训，准备走她的路，哪怕空缺少得可怜……不过年纪大些的那些，则是在她们男人手底下受训。护士的女儿很早就会配对，因为男人都喜欢一个整天想要他们的姑娘——也许你不信？]");
         outputText("[pg][say: 所以你身边有很多兄弟姐妹？]你翻了个白眼问道。");
         outputText("[pg][say: 大概吧，]希拉简短地回答。直到你又盯住她，她才懒得解释。[say: 那可是托儿所，你懂吧？妈会接收整个殖民地的孩子，这样大人们就能安心干活；人人都算你兄弟。我是她亲生孩子里最大的，不过比我小的每一年里，大概都有一两个。我们一被种下就长得很快；估计很快就有第四代了。前几天我一个姐妹的孩子叫我“希拉老阿姨”，我差点踢他一脚。搞得我像什么没嫁人的老处女一样。]");
         outputText("[pg]看着她气得咬紧下巴，你决定换个话题。[say: 那你的朋友呢？]");
         outputText("[pg][say: 你大概会叫他们工友吧。我是那群人里的姑娘，所以后来他们终于把我从“那个小妞”升级成了直接叫“希拉”。就像我说的……一群混蛋。他们大多是些男人，一听说我妈是谁就黏上了我，大概是希望我以后也会像她那样。可惜他们想错了，我一直想成为像我爸那样的人。]她坏笑起来。");
         if(get_player().lib >= 50)
         {
            outputText("[pg][say: 哦，]你凑近了些，像是在共谋似的说道，[say: 所以你对性没那么感兴趣？]");
            outputText("[pg][say: 我们需要食物和住处，[name]。我的工作很重要。生三十个孩子，却只有一个成年人站着干活，这可不是什么好事。我真希望我妈能明白这点……不是我不想找个人，而是我不想变成另一个懒虫，整天坐在家里，怀里喂着奶娃，腿也张着，什么都依赖自己的男人。]");
            outputText("[pg]话虽如此，她并没有回答问题；你凑得更近，挑起一边眉毛。");
            outputText("[pg]希拉脸红了。[say: 我……跟别的姑娘一样感兴趣。也许还更有兴趣，因为那在我们家就是再平常不过的日常。爸总是黏着妈，好像他的手天生就该放在她的乳房和屁股上。我的姐妹们显然很吃这一套；你都想象不到她们那副样子。她们有一半还穿着旧衬衫，明明已经开始吃泌乳药，胸都涨大了四个尺码。要不就是自己的衣服被撑破了，就偷我的来穿。]");
            outputText("[pg]那画面想想倒挺不错，但你一听就知道她在转移话题。[say: 我们说的不是你的姐妹……]");
            outputText("[pg]你一只手搂住她的腰，女人不自在地扭了扭。[say: 该死，[name]……你想让我说什么？说要不是我还有活要干，我真想跟你在高草丛里躲上一整天？我以为我愿意忍你这些破事，这一点已经很明显了，你这混蛋。]");
            outputText("[pg]你把她的衬衫往上拨了拨，用一根手指逗弄她的侧腰，安静地笑着；她把头靠在你身上待了一会儿，闭着眼任你在她皮肤上描画花样，但最后还是把你的手臂拨开，去收拾自己的收获。[say: 不过，我</i>确实<i>还有活要干。所以你只好自己色一会儿了。回头见。]");
            outputText("[pg][say: 好啊，待会儿见，]你冲着她离去的背影回答道，[say: ……阿姨。]");
            outputText("[pg]希拉的脖子一下子烧了起来，耳朵也抽动着；她僵着身子，带着恼意走远了。");
         }
         else
         {
            outputText("[pg][say: 怎么，]你说，[say: 全是男的，一个女性朋友都没有？]");
            outputText("[pg]希拉看起来有些郁郁寡欢。[say: 我这个年纪的姑娘还都在找人组建家庭呢，才不想跟我混在一起——色情女王的女儿，肯定能把每个男人都玩弄于股掌之间。我的女性朋友要么是我帮忙照顾过的年纪小些的女孩，要么就是年纪大的阿姨们。]她把头转开。[say: 也不是说大多数男人就喜欢我。毕竟他们一发现我的名声根本不属实，就会很不高兴。他们暗示我的本分更像是该陪他们在床上待一星期，而我只是像看笑话一样看着他们之后，他们就不会再留下来了。其实我挺为我的那些哥们儿骄傲的；他们现在都有自己的家庭了，但也没让家里那些醋坛子拦着他们跟我说话。]");
            outputText("[pg]真奇怪，如果他们一直都陪在希拉身边，她怎么没和其中一个在一起呢。");
            outputText("[pg][say: 嗯，我也想过……大多是在我觉得孤单的时候，]她回答道。[say: 可他们全都被灌输着同一套观念，或多或少也都还是觉得我会变成我妈那样。我跟他们谈起我自己的事时，感觉不到接纳，也感觉不到包容……只有耐心。]希拉把手滑进你的手里，轻轻捏了捏。[say: 我更喜欢你。]");
            outputText("[pg]她松开手，然后站起身，收拾起自己的收获。[say: 我该回去了……待会儿见？]");
            outputText("[pg]你告诉“哈蒂”自己一定会的。");
            outputText("[pg]希拉的皮肤泛起一片红，嘴唇抿成细细一线；她猛地转身，一句话也没再说就走开了。");
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function fuckBuddySheilaMeetingChat() : void
      {
         clearOutput();
         outputText("[say: 想聊聊？]希拉问道。[say: 尽管说吧。]");
         outputText("[pg]你要提起什么话题？");
         menu();
         addButton(0,"家人朋友",fuckBuddySheilaMeetingChatFamilyAndFriends);
         addButton(1,"旧情人",fuckBuddySheilaMeetingChatOldLoves);
         addButton(2,"为何躲藏？",fuckBuddySheilaMeetingChatWhyHide);
         addButton(3,"跟我住",fuckBuddySheilaMeetingChatLiveWithMe);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,763) > 0)
         {
            addButton(4,"孩子",fuckBuddySheilaMeetingChatKids);
         }
      }
      
      public function fuckBuddySheilaMeeting() : void
      {
         var display:Boolean;
         var _g:SheilaScene;
         clearOutput();
         get_images().showImage("sheila-talk");
         outputText("[say: 嘿……]");
         outputText("[pg]一个从灌木丛里传来的轻柔声音让你停下脚步。你探头绕过去一看；希拉正坐在那里，帽子放在腿上，抬头看着你。你们目光相接时，她害羞地笑了笑。[say: 真巧啊，居然在这儿遇见你，]她说。");
         outputText("[pg]你一屁股坐到她身边，问她最近怎么样。");
         outputText("[pg][say: 挺好的，]她回答道。[say: 已经打完猎了，不过我只是还在附近待着，想着万一——啊，我是说我在想……]她心虚了一瞬，随后坦白了。[say: ……我想你了。]");
         outputText("[pg][say: 别担心，]你借用了她的说法。她咧嘴一笑，把头靠在你的胳膊上，闭上了眼睛。");
         outputText("[pg]希拉就这样靠了一会儿，才再次开口。[say: 那么……想一起待会儿吗？或者做点什么？]");
         outputText("[pg]你注意到她现在的乳房是" + sheilaCup() + "大小……");
         menu();
         addButton(0,"聊天",fuckBuddySheilaMeetingChat);
         _g = this;
         display = true;
         addButton(1,"性爱",function():void
         {
            _g.sheilaXP4Sex(display);
         });
         addButton(2,"就待会儿",fuckBuddySheilaMeetingJustHangOut);
         addButton(3,"下次吧",fuckBuddySheilaMeetingMaybeLater);
      }
      
      public function forcedSheilaOral(param1:Boolean = true) : void
      {
         clearOutput();
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,761,-4);
         outputText("你俯下身，抓住女孩的衬衫前襟，把她提到跪姿；她的双手本能地抓住你的手。");
         outputText("[pg][say: 放开我！]她尖叫着，试图挣脱你的掌握。");
         outputText("[pg][say: 好了，好了，冷静点，]你训斥道。你的另一只手从她衬衫下摆探进去，抚过她的肚子，摸索着寻找她的");
         if(sheilaCorruption() >= 50)
         {
            outputText("柔软饱满的");
         }
         else
         {
            outputText("小巧挺翘的");
         }
         outputText("乳房。[say: 你也不想把衣服扯破吧？在这种荒郊野外，想弄到这么好的布料肯定不容易。]");
         outputText("[pg]你一揉捏，希拉便浑身一颤；当你用两根手指摩挲她的乳晕时，她更是猛地倒吸一口气。[say: 不、不要，]她呜咽着，试图从你的手下躲开。");
         outputText("[pg][say: 你当然不想，]你顺势打断她，故意曲解了她的回答。[say: 那就先把它们挪开吧……]你抽回手；当你把背心从她肩上褪下、仔细打量她的乳房时，她对那只手的离开竟几乎显得有些失望，");
         if(sheilaCorruption() < 20)
         {
            outputText("那对小巧浑圆的乳房在宽松衬衫下勾勒出柔和的曲线。");
         }
         else if(sheilaCorruption() < 50)
         {
            outputText("那对健康饱满的隆起把她的衬衫撑得鼓鼓的。");
         }
         else
         {
            outputText("那对肿胀的圆球从她的V领上方鼓出来，把衬衫的缝线绷得紧紧的。");
         }
         outputText("看到这番景象，你笑着抓住衣摆，粗鲁地向上掀起。希拉愣愣地眨了眨眼；等你把她挺立的乳头暴露在空气中后，她才脸上一红，用双手捂住。");
         outputText("[pg]你仍然带着笑，解开自己的[armor]，露出胯下。");
         if(param1)
         {
            outputText(get_player().SMultiCockDesc() + "垂落出来，半硬着；随着你打量这个女人的身体，血液不断涌入其中，让它稳稳胀大。");
         }
         else
         {
            outputText("你的[vagina]微微淌着液，阴唇分开，[clit]探了出来；你想象着自己想用它做些什么。");
         }
         outputText("希拉看着你的脸，看你陷入幻想，一边半心半意地玩弄她的乳头——可就在你开始沉浸进白日梦时，她猛地转身，试图爬起来逃开！");
         if(param1)
         {
            outputText("[pg]你一把揪住女孩的头发，截断她的逃跑，把她再次拖到你面前。你仍然死死抓着她，把她紧闭的嘴引到你的[cock shortest]顶端。[say: 用嘴，]你简短地命令道，握住自己的肉棒，把刚开始滴出的前液抹在她唇上。希拉的眼睛像她的嘴一样紧闭起来，试图往后躲，但你摇晃着她，直到她再次看向你，然后执拗地指了指你的肉棒。[say: 用嘴，]你重复道，更用力地扯着她的头发。[say: 要不然，我们也可以把你的裤子脱下来——如果你更喜欢那样的话……]");
            outputText("[pg]她不知是因为疼痛还是惊慌张开了嘴；你趁机把阴茎朝她嘴里顶去，");
            if(get_player().cocks[get_player().shortestCockIndex()].cockThickness <= 6)
            {
               outputText("分开她的嘴唇，顺利地挤了进去。感觉不错，但完全是单方面的，于是你命令希拉动起来。");
            }
            else
            {
               outputText("用你巨大的[cockHead shortest]戳着她小得可怜的嘴。[say: 太粗了！]她抱怨道，试图把脸转开。");
               outputText("[pg][say: 那又怎样？自己想办法！]你拖着她的脸蹭过你阴茎的顶端，把前列腺液抹到她的嘴唇和脸颊上；她最终放弃了，双手握住你的肉棒以便控制，用舌头舔弄并向下滑过你的尿道口。你的颤抖和她的同时到来……不过她的多半只是出于羞辱。");
            }
            get_images().showImage("sheila-blowjob");
            outputText("这个寡言的女人也用上了嘴唇，小心翼翼地吮吸着，");
            if(get_player().cocks[get_player().shortestCockIndex()].cockLength <= 8)
            {
               outputText("而她口腔温暖的包裹也带来了令人愉悦的刺激。");
               outputText("[pg][say: 很、很好，]你鼓励道，[say: 舌头多用一点！]希拉照做了，用那条粉色小舌的整个宽面沿着你龟头下侧摩擦。她的一只手顺着你的身体滑上来，抚摸着");
               if(get_player().balls > 0)
               {
                  outputText("你的[sack]");
               }
               else
               {
                  outputText("你的阴茎根部");
               }
               outputText("，另一只手则迟疑地摸向自己的乳房，显然渐渐投入了这场性爱。她捻弄着自己的乳头，起初动作很轻，但随着她对你肉棒的服侍越发卖力，热情也逐渐高涨。你用眼角瞥见这一幕，便把");
               if(!get_player().hasTailInsteadOfLegs())
               {
                  outputText("一只[foot]");
               }
               else
               {
                  outputText("你的尾尖");
               }
               outputText("伸到她双膝之间的胯下，隔着短裤摩擦她的小穴；布料上很快渗出一片湿痕，希拉含着你的肉棒发出含混的低哼，并开始扭动臀部迎向那股压力。你用双手捧住她的头，以回应她的热情，拇指亲昵地抚过她细长尖耳的表面。她脸上一红，随即又往你的肉棒上沉下去，用舌背摩擦裂口处的敏感神经，把你推得更接近高潮。");
               outputText("[pg][say: 所以你喜欢别人摸你的耳朵？]你一边颤抖，一边再次抚摸它们，问道。");
               outputText("[pg]希拉把你的肉棒从嘴里退出来，抬头望着你，露出一个羞怯的浅笑——可随后她僵住了。她的眼睛睁大，脸上的血色瞬间褪去，像是突然回过神来。[say: 不、不是……]她移开视线，羞愧地回答。她的臀部停了下来，一只手也从乳房上垂下；另一只手的动作又变得机械起来，不再是带着感情的爱抚，只是沿着你的肉棒上下套动。[say: 求你了，就……快点结束，放我走。]");
               outputText("[pg]妈的，真是够了……偏偏刚开始有点热起来。[say: 行！]你咕哝道。你阴沉着脸收紧手劲，把她的耳朵压平在头侧；粗暴的接触让她缩了一下，但你把她往前拽，将她的嘴撞向你的肉棒，决心把她那副冷淡反应浪费掉的进展补回来。你把骨盆顶在她脸上，强行操弄这个女孩的嘴，像使用任何湿漉漉的小穴一样使用她的口腔；柔软的嘴唇和舌头在你肉棒上的挑逗没过多久就把你推向高潮，而当你的肉棒抽动起来时，希拉开始慌了");
               if(get_player().balls > 0)
               {
                  outputText("，你的[balls]也收紧起来");
               }
               outputText("。她用双手推着你，想要挣脱，但你只是把她按在自己胯前，同时俯身压在她头上。");
            }
            else
            {
               outputText("但这种敷衍了事的服侍，怕是到太阳下山都没法让你射出来。");
               outputText("[pg][say: 天啊，]你呻吟道，[say: 你这也太差劲了。]希拉担忧地睁大眼睛，双掌转向你，做出徒劳的防御姿态，但已经太迟了；");
               if(get_player().cocks[get_player().shortestCockIndex()].cockThickness <= 6)
               {
                  outputText("你抓住她的两只耳朵，强行把你的[cock shortest]捅进她喉咙里！她干呕反胃时，你能感觉到她的食道肌肉在你周围起伏抽动；你又把它抽出来，确认她不会吐在你的肉棒上。似乎没有东西要涌出来，于是你再次把她的头往前拽，又一次滑进她抽搐着的温热喉咙。那通道在你的龟头周围收紧时，你忍不住发出呻吟；她挤压着的喉道感觉简直像个紧窄的小穴，而你急切的臀部也开始把它当成那样来用，在希拉体内进进出出，而她只能颤抖着微弱挣扎。");
                  outputText("[pg][say:也许吧，]你闷哼道，[say:要是不想被人操小穴，你就该好好练练口活。只要在他们脱掉你裤子之前先把鸡巴塞进嘴里，那你根本不会打架也就无所谓了。]希拉用湿漉漉、满含怨恨的眼睛看着你，但你只是加重了抽插的力道，扯着她的头往前，好让角度更直地顶进她喉咙。你能感觉到高潮正在体内翻涌，前液抹得她的通道又滑又湿，你把肉棒往里推进，操弄着那湿润的洞——她也同样感觉得到。当你的肉棒抽动起来时");
                  if(get_player().balls > 0)
                  {
                     outputText("，你的[balls]也开始上提");
                  }
                  outputText("，那女人开始慌了，又拼命挣扎着想把你推开。");
               }
               else
               {
                  outputText("你抓住肉棒撸了一下，逼出一大团积攒已久的前液，滴到希拉脸上，又淌进她张开的嘴里。那女人咳嗽着呛了起来，滑腻的液体从嘴和鼻子里流出，然后她试图用手背把它擦掉；结果只是把它抹得到处都是，一片狼藉。");
                  outputText("[pg][say:这副样子挺适合你，]你嘲弄道，一边用力撸动你的[cock]，一边按住她，让她乖乖接受你的涂抹。下一滴液体凝成珠，顺着第一滴开出的痕迹往下渗时，她想要躲开；但你的手指疼痛地揪紧她的耳朵，她只能紧紧闭上眼睛，发出呜咽。");
                  outputText("[pg]下一滴盖住了她脸上更多地方，接着又是一滴……你沉迷于给自己手淫，把龟头在希拉紧闭的眼皮上、以及她如今滑腻的脸颊上来回摩擦，以至于高潮毫无预兆地悄悄袭来。你的肉棒胀大");
                  if(get_player().balls > 0)
                  {
                     outputText("，你的[balls]也向身体收紧");
                  }
                  outputText("；你仍执意要把这称作口交，于是捏住希拉的下巴，强迫她张开嘴，再把滴着液体的尿道口顶到她嘴边，第一股白浊刚刚探出头来。");
               }
            }
            if(get_player().cor >= 70 && get_player().statusEffectv1(StatusEffects.Infested) == 5)
            {
               outputText("[pg]一个邪恶的念头掠过你的脑海，是那些蠕动着的烦人东西催生的");
               if(get_player().balls > 0)
               {
                  outputText("；它们塞满你的[balls]，一心繁殖，令你的欲火不断高涨");
               }
               else
               {
                  outputText("；它们在你身体深处游走，沿着你最私密部位的神经拖出阵阵感觉，并不断刺激你的产量");
               }
               outputText("，于是你决定放纵这个念头。[say:今天的口粮不用担心了，]你喊道，[say:我有的是东西喂饱你！]希拉那副认命的表情显然只把这当成又一句男人式的吹嘘——这样你的惊喜才更有效。你从体内深处发力，挤出一大股满是蠕虫的浓稠精液，直接灌进那女人喉咙里；她的身体因那种触感而绷紧，再次试图挣脱。随着更多精液接连涌来，把那团蠕动的东西推下她的食道，她开始剧烈挣扎，用疲惫的拳头捶打你，试图把头从你手里扯出来，哪怕会扯伤自己的耳朵也在所不惜。幸运的是，在刚才的战斗和残酷的口交折磨之后，她已经没有力气对你或她自己造成永久伤害，而你肆无忌惮地把这股寄生虫满溢的精液灌进她体内。");
               if(get_player().cumQ() >= 2500)
               {
                  outputText("你灌进她体内的精液和黏滑蠕虫数量如此之多，撑得她的胃都绷紧了；你甚至能看见几十条环节虫在她鼓胀腹部紧绷的皮肤下蜷成一团，不停蠕动。");
               }
               outputText("最终，你把能挤出的虫子全都顶出来后，总算射完并退了出来。你的");
               if(get_player().balls > 0)
               {
                  outputText("[sack]");
               }
               else
               {
                  outputText("身体");
               }
               outputText("确实明显轻了一些——不过你仍能感觉到体内深处还有一些，提醒着你很快又会被填满。说到这个……");
               outputText("[pg]你俯身凑近希拉；她捂着肚子，感受着体内的蠕虫，脸色早已苍白而惊恐。[say:希望你喜欢今天的收获，]你低声说。[say:等我又攒够了，再来看你。]你重新穿上并系好[armor]，把那个女人留在身后；她正开始剧烈干呕，把蠕虫和精液吐到草地上。");
            }
            else
            {
               outputText("[pg][say:给我吞下去，婊子！]你喊道，把希拉的头按在你的肉棒上，射精随之开始。以你这样按着她，她其实没多少选择；要么吞下去，要么被精液呛死。你的高潮灌满了她的嘴，硬生生冲下她的喉咙");
               if(get_player().cumQ() >= 1000)
               {
                  outputText("，很快你就能感觉到它漫到你肉棒的末端");
               }
               outputText("。");
               if(get_player().cumQ() >= 3000)
               {
                  outputText("不过你的身体还没射完，仍不断涌出精液，直到它沿着你的肉棒四周喷溅，又从希拉的鼻子里一小股一小股地喷出来。");
               }
               outputText("把自己射空后，你把希拉的嘴从你的[cock shortest]上拉开，又将那根黏滑的肉棒拖过她的胸口，把唾液和精液抹得她满胸都是，同时也擦掉了她衬衫上最后一点污渍。");
               outputText("[pg]你把那件弄脏的衣服拉下来，盖住希拉的乳房");
               if(get_player().cumQ() >= 1000)
               {
                  outputText("，不过现在它已经被精液浸得湿透，你几乎还是能透过布料把它们看得一清二楚");
               }
               outputText("。[say: 这布料确实不错。你应该好好爱惜它。] 扔下这句临别嘲讽后，你把那个一脸反胃的女人留在原地，让她慢慢消化你的精液和这份羞辱。");
            }
            get_player().orgasm("Dick");
            dynStats(DynStat.Lib(-1),DynStat.Cor(1));
         }
         else
         {
            outputText("[pg]你一把抓住那女孩的头发，将她往后一扯，摔到地上");
            if(sheilaCorruption() >= 30)
            {
               outputText("；她的乳房在胸前愉快地晃动着，让你忍不住想把玩一番");
            }
            outputText("。你跨坐在她身上，把你的[vagOrAss]压到她脸前。[say: 舔。]你命令道，一边用你的[butt]蹭着希拉的鼻子");
            if(!get_player().isTaur())
            {
               outputText("，同时揉弄着她的奶子");
            }
            outputText("。");
            outputText("[pg]那个不情愿的女人照做了，把舌头伸了进去。那片粉红色的小三角断断续续地弄着你的穴口，用僵硬机械的动作擦过入口处的敏感神经。光凭感觉就能知道，她只是在把舌头一进一出地抽送，模仿着世界上最小的肉棒。");
            if(get_player().hasVagina() && get_player().vaginalCapacity() >= 100 || !get_player().hasVagina() && get_player().analCapacity() >= 100)
            {
               outputText("她还总是反复顶到同一个地方——她甚至懒得调整角度，去碰你被撑开的入口其他部位。");
            }
            outputText("[pg][say:你这也太差劲了吧，]你抱怨着，重重坐到她头上。身下传来一声含糊的抗议，但你根本不理会。[saystart]没有男根，尾巴又短得塞不进去……现在连口技也不会。说真的，除了挨屌操、给人生孩子，你还能有什么用？你干脆待在家里张开腿，端着个乞讨碗算了？");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,141) > 0)
            {
               outputText("我在山里认识个养狗的好男孩，我敢肯定他会很喜欢你这样的子宫，正好用来装下它们的种。到明天这个时候，你两个洞里都能塞着肉棒，被灌满地狱犬的孩子——反正你连人都伺候不好。");
            }
            outputText("[sayend]");
            outputText("[pg]你能感觉到她的脸在你的[butt]下发烫，羞耻让她涨红了脸；看来你戳到她痛处了。你");
            if(!get_player().isTaur())
            {
               outputText("捏住她的乳头加重语气，接着摆动臀部在她脸上碾磨，用屁股蹂躏她的鼻子。[saystart]我就算去操一棵树，在床上也不会像你这么木头");
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2298) >= 40)
            {
               outputText("——事实上，我见过不少树看起来都比你更会当情人。也许我该把你扛到森林里，绑在一朵漂亮的、长得像小穴的巨花上，让它好好给你上上课");
            }
            outputText("。");
            if(FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,18) > 0 || get_player().hasPerk(PerkLib.MinotaurCumAddict))
            {
               outputText("也许我该把你交给一个牛头人；等你迷上他们那美妙的精液，舌头肯定会用得更好。你喜欢那样吗？清晨睁眼第一眼看到的，就是一根硕大、龟头外翻的巨根，杵在你面前，滴着天堂般的前液，等着你的嘴……或者你的小穴。你就会变成平原上又一个专门伺候牛头人的荡妇。");
            }
            outputText("或者我也可以把你带回家，亲自给你做私人训练，想什么时候训练就什么时候训练，还可以邀请路过的旅人也照样训练你");
            if(izmaFollower() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,439) == 0)
            {
               outputText("；我本人就认识一根十五英寸长、又粗又红的鸡巴，还有四颗沉甸甸的卵蛋，很乐意在我骑着你的脸时，从你另一头插进去");
            }
            outputText("。[sayend]");
            outputText("[pg]你的[vagOrAss]裹住希拉犹豫的舌头，但让你兴奋的与其说是她那拙劣的努力，不如说是把她身体卖掉的想象。她在你身下扭动，双腿相互摩擦；你尽情描绘着你能想象到的、她未来最糟糕的下场，然后达到了高潮");
            if(get_player().hasStatusEffect(StatusEffects.HairdresserMeeting) || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,53) > 0)
            {
               outputText("，脑中想象着她被交给地精做实验，被迫喝下一瓶又一瓶药水——当然，大多数药水都会专门用来让她身上长出鸡巴，或是提高精液产量");
            }
            outputText("。你的穴口收紧，在她脸上淌下淫液；女人那笨拙的舌头承受不住这股压力退了出去，让你空得难受。");
            if(!get_player().isTaur())
            {
               outputText("就算你恶狠狠地挤压她的乳房，也没法逼她把舌头重新伸进去，虽然你倒是试得颇为自娱自乐。");
            }
            outputText("[pg][say: 没用的东西，]你啐了一句，从她身上爬下来。你重新穿好衣服离开时，她抬起一张沮丧又湿漉漉的脸看着你，却没有为自己辩解。");
            get_player().orgasm("Generic");
            dynStats(DynStat.Lib(-1),DynStat.Cor(1));
         }
         get_combat().cleanupAfterCombat();
      }
      
      public function findScarredBlade() : void
      {
         outputText("附近一道金属反光吸引了你的目光。你走近一看，发现你之前丢下的那把刀正剑尖朝下插在泥土里。那把受污染的军刀朝你倾斜过来，几乎像是在恳求般把剑柄递到你面前。要重新拿起这把剑吗？");
         doYesNo(takeScarredBlade,leaveScarredBlade);
      }
      
      public function demonSheilaTalkAnotherQuestion() : void
      {
         var consensual:Boolean;
         var _g:SheilaScene;
         clearOutput();
         if(get_player().get_lust100() <= 99)
         {
            outputText("希拉的手继续往下探，");
            if(get_player().hasCock())
            {
               outputText("用手指和拇指更多地包住你的阴茎");
            }
            else if(get_player().hasVagina())
            {
               outputText("把你的阴唇分得更开");
            }
            else
            {
               outputText("揉着你赤裸的胯间");
            }
            outputText("，同时还鼓励似的对你笑着。[say: 当然可以，伙计。你就自己玩吧。我反正也正有此意。]");
            dynStats(DynStat.Lust(get_player().sens / 10));
            menu();
            addButton(0,"变化",askDemonSheilaAboutDahChange);
            addButton(1,"她的聚落",askDemonSheilaAboutHerColony);
            addButton(2,"现在怎么办？",talkToDemonSheilaAboutWhatNow);
            addButton(3,"滚开",tellSheilaDemonToFuckOff);
         }
         else
         {
            outputText("希拉见你结结巴巴、语无伦次，坏坏地咧嘴一笑。[say: 才不，]她一边回答，一边用空着的手扳过你的头。[say: 我觉得我们该把说话这事抛到一边了，你说呢？]当她的目光与你相接时，你的身体危险地颤抖起来；你已经让她靠得太近、待得太久了，而她满怀期待地散发着光彩，准备夺走她想要的东西。");
            menu();
            _g = this;
            consensual = true;
            addButton(0,"下一步",function():void
            {
               _g.loseToSheila(consensual);
            });
         }
      }
      
      public function demonSheilaTalk() : void
      {
         clearOutput();
         outputText("问题困扰着你，你问希拉是否介意回答几个问题。她大摇大摆地走过来，并且");
         if(!get_player().isTaur())
         {
            outputText("挽住你的胳膊，另一只手则滑进你的护甲里");
         }
         else
         {
            outputText("在你的两腿之间");
         }
         outputText("，摸向你的");
         if(get_player().hasCock())
         {
            outputText("[cock]");
         }
         else if(get_player().hasVagina())
         {
            outputText("[vagina]");
         }
         else
         {
            outputText("光滑肌肤");
         }
         if(get_player().lib < 20)
         {
            outputText("，看见你表情僵住，她咯咯笑了起来");
         }
         outputText("。[say:为你做什么都行；我正好找点东西转移注意力。你在想什么，亲爱的？]");
         dynStats(DynStat.Lust(2 + get_player().sens / 5),DynStat.NoScale);
         menu();
         addButton(0,"变化",askDemonSheilaAboutDahChange);
         addButton(1,"她的聚落",askDemonSheilaAboutHerColony);
         addButton(2,"现在怎么办？",talkToDemonSheilaAboutWhatNow);
         addButton(3,"滚开",tellSheilaDemonToFuckOff);
      }
      
      public function demonSheilaResist() : void
      {
         clearOutput();
         outputText("你从这个恶魔身边后退，阴沉地瞪着她，举起你的[weapon]。希拉朝你撅起嘴，然后说道，[say: 没心情吗，伙计？可我现在好想要……我敢打赌，我能让你也有感觉。让我给你看看我有多爱你……]她的耳朵剧烈地抽动着，暴露了她的意图；与此同时，她");
         if(sheilaCorruption() < 30)
         {
            outputText("把黑色的铲形尾巴向前挺出，用手把尾尖不断渗出的液体沿着尾巴抹开");
         }
         else
         {
            outputText("妩媚地揉捏着自己的乳房，掐弄着乳头");
         }
         outputText("。当她向你伸出手时，你的姿态稍稍放松下来");
         if(sheilaCorruption() < 30)
         {
            outputText("，她倾斜手掌，让一捧气味浓烈的深色油液淌下来");
         }
         outputText("，可她虐待般地咯咯笑着走近时，你又再次绷紧了身体。从她那副不以为然的摇摆步伐来看，很明显她没法好好接受你的拒绝！");
         startCombat(new Sheila());
      }
      
      public function demonSheilaEncounter() : void
      {
         clearOutput();
         get_images().showImage("sheila-corrupted");
         outputText("伴随着一阵沙沙声，一个影子从你身后低矮的树上落了下来。[say: 嘿，亲爱的；好久不见……要不要陪我一会儿？]");
         outputText("[pg]你转过身时，希拉正扭着腰向你走来。除了她长长的光裸耳朵上挂着一枚淡紫色小水晶，以及手上戴着几枚戒指外，她现在一丝不挂，把她那对" + sheilaCup() + "乳房和光滑、滴着淫液的小穴毫无遮掩地暴露在外。两条灵活的尾巴——一条带铲形尾尖，一条没有——满怀期待地摩擦着她的阴唇；她在你面前摆出马步，等着你的回答，双眼燃烧着欲望。");
         menu();
         addButton(0,"交谈",demonSheilaTalk);
         if(get_player().get_lust() >= 33)
         {
            addButton(1,"让她干",sheilaLetHerFuckYou);
         }
         addButton(2,"抵抗",demonSheilaResist);
         addButton(4,"逃跑",get_camp().returnToCampUseOneHour);
      }
      
      public function demonImpChildren() : void
      {
         clearOutput();
         outputText("[say: [name]！]身后的草丛一阵窸窣，除此之外你毫无预兆，赤裸的希拉就已经扑上来抱住你，");
         if(sheilaCorruption() < 40)
         {
            outputText("她挺立的乳头蹭着你的手臂，整个人依偎上来");
         }
         else
         {
            outputText("她那对巨大而下垂的乳房几乎从你身侧分开，和她的双臂一起把你裹住");
         }
         outputText("。");
         outputText("[pg][say: 猜怎么着？我生下你的孩子了！他可爱得不得了。]");
         outputText("[pg]她把你惊讶的表情当成了让她继续说下去的许可。[say: 嗯，干嘛瞪这么大眼睛，伙计？我们族人生孩子向来很快。只不过，我没有把他塞进贴着我奶子的婴儿背巾里，而是把他塞进了稍微……低一点的地方。]她把你的手臂搂得更紧，几乎是在用自己的小穴摩擦你的手背；当她的手指滑进你的[armor]里时，还在你手上留下一道淫液的痕迹。[saystart]他长着和" + get_player().mf("爸爸","另一个妈妈") + "一样的鸡巴。");
         if(!get_player().hasCock())
         {
            outputText("或者说，本来有……[sayend]她伸到你光裸的胯下，皱着眉把话说完。[say: 你把那根威风的老家伙丢哪儿去了？我还盼着再来一回呢。]她把手抽出来，又噘着嘴凑向你。[say: 我现在也好想要啊……]");
         }
         else
         {
            outputText("不过，还是比不上让你进到我身体里……[sayend]她握了握你[cock]的根部，随即把手抽开，滑向自己的双腿之间。[say: 我还想着你能帮我再造一个，说不定还能让这附近像样的男人多几个呢。]她向后仰躺，张开双腿，分开自己小巧光滑的阴唇");
            if(sheilaCorruption() <= 80)
            {
               outputText("用手指撑开，好让这份邀请彻底敞开");
            }
            else
            {
               outputText("用分叉的尾巴拨开，同时托起自己硕大的乳房，确保你看清这份敞开的邀请");
            }
            outputText("。她急不可耐地把那短短的、滴着液体的阳具状铲形尾端抵在穴口上摩擦，刻意强化着那幅画面。她用浅浅的动作挑逗着自己，你能感觉到血液正往胯下涌去。");
         }
         pregnancy.knockUpForce();
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,859,FlagDict_Impl_.arrayReadInt(_loc1_,859) + 1);
         if(get_player().hasCock())
         {
            dynStats(DynStat.Lust(10 + get_player().lib / 10),DynStat.NoScale);
         }
         menu();
         addButton(0,"其他性爱",pregDemonSheilaOtherSex);
         if(get_player().hasCock())
         {
            addButton(1,"让她怀孕",pregDemonSheilaKnockUp);
         }
         addButton(14,"离开",leavePregDemonSheila);
      }
      
      public function consentacleVagSexForKangarooSlutBitches() : void
      {
         clearOutput();
         var _loc1_:int = get_player().cockThatFits(48);
         if(_loc1_ < 0)
         {
            _loc1_ = get_player().smallestCockIndex();
         }
         outputText("希拉摘下帽子，在你凑近时羞怯地垂下浅色的眼睛；随后她抬起头，双臂环住你的脖子，而你也搂住她的腰。她脸上泛起一丝红晕，也跟着靠了过来；你迅速吻住她的唇，轻轻一吻，又是一吻。第二个吻分开时，她发出一声细得几乎听不见的低吟，接着又主动扑了上来，嘴唇与你紧紧贴合，用舌头探索你的口腔。你也以同样热烈的吻回应她，手从她腰间向上滑去，探进她的衬衫下。你的手很快摸到她半硬的乳头，开始用手指夹弄、揉搓；在你的挑逗下，她贴着你的嘴唇轻轻发颤，最后终于分开唇瓣，仰起头发出一声低低的呻吟。趁机从她的亲吻中脱身，你的嘴唇沿着她修长的脖颈一路向下，而手指则描摹着她乳房的轮廓。");
         outputText("[pg][say: 啊，天啊……]她叹息着，而你继续用嘴唇轻挠她的脖颈。她松开拥抱，匆忙把背心和衬衫从头上脱掉，露出她那对" + sheilaCup() + "乳房；两颗乳头都已经完全挺立，像是在竖着小小的“摸我”招牌。你便如它们所愿，抚摸起她");
         if(sheilaCorruption() <= 30)
         {
            outputText("挺翘的");
         }
         else
         {
            outputText("晃颤的");
         }
         outputText("乳房，同时摆弄着你的衣服。她设法脱掉了你的[armor]上衣，露出了你的[chest]；然后她投桃报李，");
         if(!get_player().hasFuckableNipples())
         {
            outputText("揉捏把玩");
         }
         else
         {
            outputText("将两根手指探进");
         }
         outputText("你的[nipples]。她拨弄着你胸前敏感的突起，让你浑身一颤，但你并没有停下攻势，而是把嘴移到她的一颗乳头上，用牙齿和舌头轻轻挑逗。很快，她就在你的爱抚下颤抖抽动；一只手揉着自己的下体，另一只手则半心半意地试图反过来挑逗你。");
         outputText("[pg][say: 求你了……我受不了了，]她呜咽道。[say: 别再对着我的奶头又亲又舔了，把它插进来，伙计。]她放在下体的那只手开始试着解开腰带，另一只手则抓住并揉弄自己的乳房；你咧嘴一笑，迅速用双手脱掉自己剩下的衣物。当[eachcock]从衣物中显露出来，因充血而胀大时，她又停下脱衣的动作，转而继续揉弄自己。她喘息急促，隔着布料抚弄着自己，目不转睛地盯着你的");
         if(get_player().cocks[get_player().cockThatFits(32)].get_cockType() == CockTypesEnum.KANGAROO)
         {
            outputText("前端渐尖、肉感十足的阴茎。[say: 哇……这种可不常见。]");
         }
         else
         {
            outputText("[cocks]。");
         }
         outputText("[pg][say: 怎么了？]你逗她。[say: 我还以为你想让我插进去呢，可你的裤子还挡着啊？]");
         outputText("[pg]她的脸颊一下子涨得通红，双手又忙着解开腰带；她刚一松开，你就伸手把她的短裤扯了下来。当你把湿漉漉的内裤从她光滑的小穴上拉开时，一长串液体被牵了出来；她湿得简直像父亲节那天的地精寄宿学校！你用两根手指沿着她饥渴的裂缝来回摩挲，感觉它在指下抽动，并渗出更多淫液。");
         outputText("[pg][say: 别、别再逗我了，你这个笨蛋！]你刺激着她迫切的小穴，她喘息着说道。[say: 快……快点干我！]");
         outputText("[pg]你咧嘴一笑。");
         if(!get_player().isTaur())
         {
            outputText("握住你的" + get_player().cockDescript(_loc1_));
         }
         else
         {
            outputText("你试着将你的" + get_player().cockDescript(_loc1_) + "调整到位");
         }
         outputText("，用顶端沿着她湿淋淋的小穴摩擦，把她的淫液抹在上面。");
         if(!get_player().isTaur())
         {
            outputText("接着你抓住她的" + (get_noFur() ? "" : "毛茸茸的") + "大腿，抬起她的屁股，将");
         }
         else
         {
            outputText("她抬起屁股，将");
         }
         outputText("她滑腻的甬道对准你的肉棒。[say:要进去了！]你喊道。话音刚落，你便挺身刺入，用肿胀的" + get_player().cockHead(_loc1_) + "撑开她的穴唇。你终于进入她体内，她如释重负地呻吟起来，但这份轻松并没有持续多久，因为你已经开始在她湿滑的小穴里抽插。她无力地喘息着，仰躺到地上；");
         if(sheilaCorruption() <= 30)
         {
            outputText("她挺翘的乳房来回摇晃");
         }
         else
         {
            outputText("她颤动的乳房被压成浑圆的半球，在胸前起伏");
         }
         outputText("，你则在她温暖湿润的小穴里进出抽送。");
         outputText("[pg]你抽插时，她用力揉搓挤捏着自己的乳房；看着那敏感的乳肉被揉弄变形，你的欲火更添了几分。");
         if(!get_player().isTaur())
         {
            outputText("你短暂停下，调整角度，俯身再次与她深吻，并帮着抚弄她那");
            if(sheilaCorruption() <= 30)
            {
               outputText("紧实的");
            }
            else
            {
               outputText("柔软丰满的");
            }
            outputText("乳房，随后从新的角度继续抽插；你每次挺动，她的乳头都会刷过你的[chest]。");
         }
         if(get_player().balls > 0 || get_player().hasVagina())
         {
            outputText("她短短的尾巴朝你卷来，蹭着你的");
            if(get_player().balls > 0)
            {
               outputText("[balls]");
            }
            else
            {
               outputText(get_player().vaginaDescript(0));
            }
            outputText("，在她因快感扭动时轻轻挠着你。");
            if(get_player().balls == 0 && get_player().hasVagina())
            {
               outputText("你的小穴抽搐着，往这毛茸茸的闯入者身上淌下一点淫液。");
            }
         }
         outputText("你抽插得更用力，狠狠填满希拉，力道大得让她的");
         if(sheilaCorruption() < 30)
         {
            outputText("挺翘而硬起的乳头在你的皮肤上划出长长的弧线");
         }
         else
         {
            outputText("晃动的奶子几乎拍到她脸上");
         }
         outputText("。[say:噢噢，]她呻吟着，[say:对！]就在那一刻，你感觉她的阴道猛地夹住你的[cockFit 32]，在高潮中疯狂地绞榨着。你尽可能继续抽插，但在她痉挛的小穴连番夹击下，你撑不了多久；");
         if(get_player().cor >= 90 || get_player().cor > FlagDict_Impl_.arrayReadInt(KFLAGS.flags,760))
         {
            outputText("你的胯下有某种感觉越积越强，几乎变得痛苦。那感觉就像两次令人神魂颠倒的高潮同时到来，还在争抢谁先释放出来。你很快逼近高潮，却又在令人抓狂的瞬间被拽了回去，如此反复。作为回应，你更加用力地挺动，以惊人的速度在女孩体内来回抽插；要不是你们两个流出的前列腺液和淫液多到足以浇灭一场灌木火，这种摩擦简直会把人磨得生疼。最终，快感压过了高潮中那股古怪的迟滞；你在顶峰时大声叫了出来，将一小股精液挤进她紧紧缠住你的阴道里。");
            if(get_player().cockTotal() > 1)
            {
               outputText("你其余的");
               if(get_player().cockTotal() == 2)
               {
                  outputText("肉棒也喷发了");
               }
               else
               {
                  outputText("肉棒也一同喷发了");
               }
               outputText("，把黏稠的精液丝挂满了她的胯间。");
            }
            outputText("那强烈的感觉开始沿着你的肉棒缓缓上涌；你的身体自行进入过载状态，而随着它逼近顶端，你伴侣的呻吟也像是感同身受般越来越急。最后，它伴随着一股精液，在一次巨大的挤压中冲出你的身体。希拉也配合般倒抽一口气，随着这次脉动进入她体内，她的小穴在第二次高潮中抽搐起来，令她弓起了背。她被快感攫住，在地上扭动挣扎，胸部似乎比之前抖得更加剧烈。");
         }
         else if(get_player().cor < FlagDict_Impl_.arrayReadInt(KFLAGS.flags,760))
         {
            outputText("你的抵抗注定要以失败告终。希拉发出颤抖的欢愉尖叫，双臂双腿缠住你，把你牢牢钉在她体内。她的阴道强有力地在你的肉棒周围抽搐；你甚至敢发誓，随着她起伏收缩的小穴把你越拉越深，你能感觉自己被一点点拉长。就在你觉得自己的肉棒简直长得有一英里时，她全身猛地绷紧，指甲陷进你的背里。希拉带着疯女人般的神情，张着嘴直直盯着你，肌肉锁紧，小穴断断续续地颤抖着释放高潮；甚至连她那");
            if(sheilaCorruption() < 30)
            {
               outputText("挺翘的");
            }
            else
            {
               outputText("柔软丰满的");
            }
            outputText("乳房似乎也被绷紧，压实得一动不动。突然，她的臀部狠狠撞向你，并猛地仰起头；你还来不及说出半句抗议，她的小穴便带着近乎超自然的灼热，最后一次绞紧你的" + get_player().cockDescript(_loc1_) + "；你的意识蒙上一层雾，剧烈的高潮直冲脊椎根部，并随着第一波射精反震回来。");
         }
         else
         {
            outputText("在她绞榨着你、并用乳头摩擦你的[chest]时，你的高潮很快压过了你的控制。" + get_player().SMultiCockDesc() + "开始抽动，把第一股精液卸进她痉挛的小穴里");
            if(get_player().cockTotal() > 1)
            {
               outputText("，或是射到她的大腿和肚子上");
            }
            outputText("。");
         }
         outputText("[pg][say:天啊！]她喊道。[say:拔出来，别把我弄怀孕了！]");
         if(!get_player().hasKnot(_loc1_))
         {
            outputText("你颤抖着照做，把你的" + Appearance.cockNoun(get_player().cocks[_loc1_].get_cockType()) + "从她紧夹的小穴里拔出，发出湿黏的吸吮声。一缕精液从她的阴唇间淌出，而你也将剩下的精液尽数释放，喷在她的腹股沟上");
            if(get_player().cumQ() > 500)
            {
               outputText("、胸部和脸上");
            }
            outputText("。");
            if(get_player().cumQ() >= 1500)
            {
               outputText("越来越多团精液从[eachcock]顶端喷射出来，把希拉粘在干草上，你把她的身体涂成一片雪白。");
            }
         }
         else
         {
            outputText("你试着照她说的做，可你肿胀的肉结牢牢卡在她紧夹的小穴里，把你锁在原地。徒劳地拉扯了几下后，你只能一边道歉一边任由高潮吞没自己，瘫倒在她剧烈起伏的胸口上，无力地把剩下的精液全都灌进这个抽搐的女人体内。");
            if(get_player().cumQ() >= 1000)
            {
               outputText("你过于旺盛的睾丸不断挤出体内庞大的精液储量，她的肚子也开始鼓胀起来");
               if(get_player().cumQ() >= 3000)
               {
                  outputText("，直到被撑到极限，而随后每一股喷射都从她小穴紧紧裹住肉结形成的密封处挤出一阵阵带沫的精液");
               }
               outputText("。");
            }
            if(get_player().cockTotal() > 2)
            {
               outputText("你的其他肉棒也一同爆发，把她的胯间浸得湿透，并用白浊" + (get_noFur() ? "覆盖" : "糊住她大腿上的毛发") + "她的大腿。");
            }
         }
         outputText("你们两人的高潮都渐渐平息");
         if(get_player().hasKnot(_loc1_))
         {
            outputText("，你也终于设法从她体内拔了出来");
         }
         outputText("；你们两人躺在那里，粗重地喘息了好几分钟。希拉率先打破了沉默。");
         get_player().orgasm("Dick");
         dynStats(DynStat.Lib(-0.5));
         if(get_player().cor >= 90 && sheilaCorruption() >= 90)
         {
            menu();
            addButton(0,"继续",sheilaGoesDemon);
            return;
         }
         if((get_player().cor > 90 || get_player().cor > sheilaCorruption()) && sheilaCorruption() >= 80 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,761) != 3)
         {
            sheilaCorruptionUpdate();
            outputText("[pg][say: 该死的[name]，看看我的奶子都变得多大了！]");
            outputText("[pg]你看了过去。然后继续看着。");
            outputText("[pg][say: 这肯定都有G罩杯什么的了！]她继续说道。[say: 我看起来就像头丑得要命的母牛！你血里到底流着多少污秽啊，你这只交配鼠？！喂……听我说话！]");
            outputText("[pg]你从性爱后的、被巨乳迷得恍惚的状态中稍微清醒了一点。");
            outputText("[pg][say: 你他妈认真的？我刚才说我胸部的事，你到底有没有听见？]");
            outputText("[pg]你告诉她，她说得对。它们……挺不错的。");
            outputText("[pg]希拉听到这话似乎踉跄了一下，带得她那对巨乳令人愉悦地晃动起来。你能感觉到自己又开始");
            if(get_player().hasCock())
            {
               outputText("硬了");
            }
            else
            {
               outputText("湿漉漉的");
            }
            outputText("，你想象着那对硕大的乳房压在自己身上，又忍不住兴奋起来。你一边俯身想吻她，一边把手顺着她的大腿往上滑。[say: 不，它们才不是！]她喊道，偏过头去，于是你的嘴唇只落在了她的脖颈上。[say: 我现在连本职工作都快做不好了，你还让情况变得更糟！这些东西不光碍事，我还总是忍不住想着把你推倒，骑在你身上一整天！你得答应我，会稍微净化一下自己；我不能为了讨你高兴，就一直变得越来越大、越来越放荡！]");
            outputText("[pg]也许在那堆……不断起伏、颤动不止的乳肉里，确实埋着那么一丁点道理，可是……呃，你刚才在想什么来着？");
            menu();
            addButton(0,"听她的",sheilaCorruptionWarningListenToHer);
            addButton(1,"抚摸她",sheilaCorruptionWarningsChooseFondle);
            return;
         }
         outputText("[pg][say: 啊，你这个笨蛋！]她抱怨道。[say: 你射在我里面了！]");
         outputText("[pg][say: 对不起，]你喘息着说道，几乎累得说不出话来。");
         outputText("[pg][say: 你最好是真知道错了，老兄，]她调笑道。她轻轻吻了吻你的脸颊，又低声喃喃道，声音小得几乎听不见：[say: ……你还是最棒的。]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,761) == 3)
         {
            outputText("希拉望向你，眉宇间满是感激。[say: [name]……我真的很感谢你刚才做的事。我宁愿怀孕，也不想因为太发情、没法好好躲到聚居地开门，就被什么噩梦般的怪物抓住——呃，不是说我想怀上你的孩子啦，虽然你人确实很好。]");
            outputText("[pg]咦……所以她打算把后半夜都躲起来？");
            outputText("[pg][say: 嗯，]在你追问下，希拉答道。[say: 其实也没那么难啦，你知道的，天黑嘛。我挖个洞什么的就行。]她捏了捏你的手，然后站起身来。这姑娘居然真的想一个人在洞里躲上一整晚……");
            menu();
            addButton(0,"任她去",sheilaXPThreeSexyTimePostSexLetHerBe);
            addButton(1,"陪着她",shielaXPThreeSexyTimePostSexStay);
            return;
         }
         outputText("[pg]你在阳光下躺了一会儿");
         if(get_player().cumQ() < 500)
         {
            outputText("，任由她抚摸你胸口的[skinfurscales]");
         }
         else
         {
            outputText("，她则尽可能把精液擦掉");
         }
         outputText("，然后起身收拾好你的装备。[say: 嗯……回头见，好吗？]她说道。");
         doNext(get_camp().returnToCampUseOneHour);
         sheilaPreg();
         sheilaCorruptionUpdate();
      }
      
      public function consensualSheila69(param1:Boolean = true) : void
      {
         clearOutput();
         get_images().showImage("sheila-private-talk");
         outputText("你凑近女人，在她耳边低语，她的皮肤顿时泛起红晕。[say: [name]，你真是没救了。这次别再那么逗我了，直接开始吧。]你笑着哼了哼，坐起身开始解开盔甲；希拉也趁机照做，而且比你更先把自己脱得一丝不挂。");
         outputText("[pg]你挑起眉，看着她袒露的身体。她红着脸抬头回应，闭口不言地盯着你，带着安静的羞窘等你脱完衣服。");
         if(param1)
         {
            if(get_player().hasCockThatFits(32))
            {
               outputText("不过，当你亮出你的[cockFit 32]时，她坦然地笑了。");
               outputText("[pg][say: 那么，你是要把那个放进我里面吗？]希拉问道，一边期待地轻轻分开自己的阴唇。你没有回答，她露出惊讶的神情。");
            }
            else
            {
               outputText("[pg]当你露出[eachcock]时，她的眼睛越睁越大，与抿紧的薄唇形成鲜明对比；那丰硕的肉柱在微风中轻轻摇晃。");
               outputText("[pg][say: [name]……你真的太过火了。我根本不可能……我是说，这尺寸也太！]尽管希拉已经当面拒绝，她的眼睛还是离不开你的胯间，贪婪地盯着你的肉棒");
               if(get_player().cockTotal() > 1)
               {
                  outputText("");
               }
               outputText("，一边用力揉着自己小巧光滑的阴唇。[say: 你到底指望我拿这种东西怎么办？]");
            }
         }
         else
         {
            outputText("等你终于褪下下装，露出湿润的" + get_player().vaginaDescript(0) + "时，她温柔地笑了。");
            outputText("[pg][say: 可爱的小花……]希拉一边玩弄自己的那里，一边说道。你模仿她的动作，把一根手指滑进阴唇之间刺激自己");
            if(get_player().getClitLength() > 8)
            {
               outputText("，让你的[clit]硬挺起来。[say: ……而且花茎还挺精神，]你的爱人总结道。[say: 你确定那不是鸡巴吗？]");
            }
            else
            {
               outputText("，带出一声轻叹，也让手指变得湿漉漉的。[say: 所以急不可耐的那个是我，对吧？]你的爱人揶揄地问道——尽管她自己的手指也一样湿。");
            }
         }
         outputText("[pg]你依旧微笑着，凑近希拉，把一只手伸到她屁股下面，轻轻把她往前引，直到她躺倒在草地上。她似乎并不介意你这令人捉摸不透的沉默，柔柔地吻着你，直到你分开她的大腿。");
         if(param1 && get_player().cockThatFits(32) < 0)
         {
            outputText("[say: [name]，我都说了，塞不进去的！]");
         }
         else
         {
            outputText("[say: 不说话了，是吗？随你便。]");
         }
         outputText("她的话戛然而止，因为你");
         if(!get_player().isTaur())
         {
            outputText("转过身，把你的");
         }
         else
         {
            outputText("跨坐在她身上，蹲下来，让你的");
         }
         if(param1)
         {
            outputText("渗着前液的肉棒");
         }
         else
         {
            outputText("湿漉漉的小穴");
         }
         outputText("悬在她头顶上方，挑逗地晃动着，同时把手指探入她体内。");
         outputText("[pg][say: 啊……啊……你直说不就好了，]希拉喘息着，");
         if(param1)
         {
            outputText("一只手握住你的肉棒");
            if(get_player().cockThatFits(32) < 0)
            {
               outputText("，引着它舒服地弯贴在她胸前；随着她把它摆好位置，前液拖出一道湿痕");
            }
            outputText("。");
         }
         else
         {
            outputText("也投桃报李，把手猛地探进你的" + get_player().vaginaDescript(0) + "里。");
         }
         outputText("她在你里面抽送了一下，逼出一缕液体，然后又开口道：[say: 再放低一点……]");
         outputText("[pg]你照做了，");
         if(!get_player().isTaur())
         {
            outputText("把背压低");
         }
         else
         {
            outputText("蹲得更低");
         }
         outputText("让你的");
         if(param1)
         {
            outputText("肉棒向下沉去");
            if(get_player().hasCockThatFits(32))
            {
               outputText("，送进她温热而等待着的嘴里");
            }
            else
            {
               outputText("；她松开它，转而抓住自己的乳房，试着把它们挤在敏感的肉棒两侧，同时用舌头沿着下侧向上舔去");
            }
            outputText("。");
         }
         else
         {
            outputText("你的小穴就悬在她脸上方；她");
            if(get_player().getClitLength() > 8)
            {
               outputText("轻咬并吮吸着你阴蒂的尖端，还用舌头来回拨弄");
            }
            else
            {
               outputText("用舌头分开你的阴唇，温柔地舔弄着它们，挑逗你小小的阴蒂");
            }
            outputText("。");
         }
         outputText("不愿在创意、技巧或胆量上输给她，你");
         if(!get_player().isTaur())
         {
            outputText("俯下身，把自己的舌头深深埋进希拉体内，用嘴强行分开她的阴唇");
         }
         else
         {
            outputText("尽力伸出双手一起上阵，一只手抚弄并拉开希拉的阴唇，另一只手则挑逗她暴露出来的阴蒂，或是滑进她的小穴里");
         }
         outputText("；你的情人停下了舔弄，你能感觉到她的嘴离开你敏感的肌肤，脑袋向后仰去。");
         outputText("[pg][say:天啊，爽！]她叫喊道。她的小穴阵阵收缩，试图从侵入者那里榨出根本不会有的精液。你任由她的身体抽搐着吸吮你一会儿，然后轻轻清了清嗓子，提醒她该履行自己的职责了。[say:妈的！抱歉，伙计……继、继续！]希拉说着，");
         if(!param1)
         {
            outputText("把舌头重新探回你体内");
            if(get_player().getClitLength() > 8)
            {
               outputText("，同时用一只手快速抚弄你的[clit]");
            }
            outputText("。");
         }
         else if(get_player().hasCockThatFits(32))
         {
            outputText("再次把你含入口中，舔去那滴被冷落的前液。");
         }
         else
         {
            outputText("一只手抚弄着你的鸡巴，同时把挺立的乳头抵在侧面，沿着它划出一道痕迹。");
         }
         if(!get_player().isTaur())
         {
            outputText("[pg]你确定就算只是因为难堪，希拉也会继续努力让你高潮，于是准备对她的小穴展开全面的折磨。你的手指加入忙碌的嘴唇，一边抚弄并拉开她小小的阴唇，另一边让自己的嘴唇在用舌头抽插她时开始擦过她的阴蒂。你能感觉到她沿着你的身体颤抖，你稳稳地把她推向快感的临界点，而这些震颤也无意间通过她的");
            if(param1 && get_player().cockThatFits(32) < 0)
            {
               outputText("颤抖撩人的乳头和起伏的胸口");
            }
            else
            {
               outputText("嘴唇传到你身上，她正愉悦地低哼着");
            }
            outputText("。");
         }
         else
         {
            outputText("[pg]你确信经过刚才的提醒后，希拉会继续伺候你的性器，于是专心给她带来远超她承受极限的刺激。你一只手的两根手指撑开她的阴唇，将她的小穴暴露在你探寻的中指面前；另一只手则忙着挑弄她的阴蒂，时而用拇指揉搓那颗小肉粒，时而把它按在掌心平面上来回摩擦。你还特意收集从希拉体内渗出的湿意，让那颗小肉粒始终保持滑润，并越弄越快，上下左右不停抚弄。身下可怜的女人呻吟着、颤抖着，又借着她的");
            if(param1 && get_player().cockThatFits(32) < 0)
            {
               outputText("坚挺的乳头");
            }
            else
            {
               outputText("喉咙");
            }
            outputText("。");
         }
         if(param1 && get_player().cockThatFits(32) < 0)
         {
            outputText("[pg][say: [name]！我要高潮了！]希拉叫道。");
         }
         else
         {
            outputText("[pg][say: 嗯唔！嗯嗯嗯！]希拉被你的身体堵着，发出含混的呻吟。你过了一秒才反应过来这意味着什么。");
         }
         outputText("她的小穴一阵抽搐，");
         if(get_player().cor >= 90 || get_player().cor > FlagDict_Impl_.arrayReadInt(KFLAGS.flags,760))
         {
            outputText("贪婪地想把你的");
            if(!get_player().isTaur())
            {
               outputText("舌头");
            }
            else
            {
               outputText("手指");
            }
            outputText("吸进去。你简直能感觉到她体内的肌肉起伏收缩，摩挲着你，仿佛想把你榨射出来。希拉在高潮中倒吸一口气，胸口随之鼓起；你能感觉到她的乳房越来越用力地抵在你身上。");
         }
         else if(get_player().cor < FlagDict_Impl_.arrayReadInt(KFLAGS.flags,760))
         {
            outputText("喷出一股液体。那感觉仿佛持续了好几分钟，她的小穴不断淹没你的");
            if(!get_player().isTaur())
            {
               outputText("嘴，让她的味道充满你的口腔。");
            }
            else
            {
               outputText("双手，把它们彻底浸透在她高潮的液体里。");
            }
            outputText("她的大腿绷紧，迫使骨盆抬向空中，也把她的阴户送向你；与此同时，她的胸口垂落下去，你慢慢感觉到那对挺翘的乳头从你的腹部离开。");
         }
         else if(get_player().cor == FlagDict_Impl_.arrayReadInt(KFLAGS.flags,760) && get_player().cor < 90)
         {
            outputText("淌下一缕液体，一边舔弄着你，一边对着你的胯间尖叫着释放她的狂喜。");
         }
         outputText("希拉猛地把脸向上顶，");
         if(param1 && get_player().cockThatFits(32) < 0)
         {
            outputText("把嘴唇和舌头贴到你的肉棒根部，同时用力撸动它。");
         }
         else if(param1)
         {
            outputText("让你的[cockHeadFit 32]沉入她喉咙温暖的深处，那里肌肉正轻柔地抚弄、诱引着它。");
         }
         else
         {
            outputText("用舌头深深插入你，同时双手伸上来狂乱地抚弄你的阴蒂。");
         }
         outputText("你的身体在她狂热的进攻下败下阵来，肌肉控制也离你而去，让你的胯间压到了这个女人脸上。");
         if(param1)
         {
            outputText("[pg]一股又一股精液沿着[eachcock]涌过，");
            if(get_player().hasCockThatFits(32))
            {
               outputText("灌进你爱人等候已久的喉咙。她被呛得作呕，你能感觉到黏稠的精液又回涌到你的[cockHeadFit 32]上");
               if(get_player().cumQ() < 250)
               {
                  outputText("；你从她嘴里抽出，让她的喉咙一阵抽搐，把你的精液又咳回她的嘴唇和脸颊上。");
               }
               else if(get_player().cumQ() < 2000)
               {
                  outputText("，可你停不下来的高潮又把它压了回去，往她喉咙里灌进更多精液。你能感觉到她的双手抓挠着你的[butt]，而你终于释放着积蓄已久的欲望。");
               }
               else
               {
                  outputText("。很快，她的肚子肉眼可见地鼓了起来，龟头也再次被回涌的液体冲刷；接下来的几股精液一路顶了上去，她开始从口鼻里淌出黏滑的精液与唾液混合物，惊慌之下双手也挣扎得更加急促。");
               }
            }
            else
            {
               outputText("喷溅在你们交缠的身体上，又流进彼此之间，浸湿你的[chest]和脖颈，以及希拉仍在轻轻抽动的下身。");
               if(get_player().cumQ() > 1000)
               {
                  outputText("你的身体像一眼精液泉般持续产出，直到她" + (get_noFur() ? "双腿" : "大腿") + "和尾巴上的绒毛都被你们之间淌落的白浊彻底糊住。");
               }
               if(get_player().cockTotal() > 1)
               {
                  outputText("你其余的阴茎");
                  if(get_player().cockTotal() == 2)
                  {
                     outputText("也随之抽搐起来");
                  }
                  else
                  {
                     outputText("也随之抽搐起来");
                  }
                  outputText("，把自己的精液也添进了覆盖着这个可怜女人的淫乱狼藉中。");
               }
            }
         }
         else
         {
            outputText("[pg]高潮袭来时，你的小穴颤抖着夹住她的舌头，裹住那条湿热的软肉。希拉摆动舌头、将它伸得更深，哪怕还在报复似的折磨你敏感的阴蒂，也试图用舌尖刮蹭你抽搐的内壁。你的淫液");
            if(get_player().wetness() <= 2)
            {
               outputText("缓缓淌出，很快便被她贪婪的嘴吸走");
            }
            else if(get_player().wetness() <= 4)
            {
               outputText("肆意喷涌，把她的脸弄得湿滑一片");
            }
            else
            {
               outputText("泛滥而出，即使她紧紧闭上眼睛抵挡这股水流，还是浸透了她的头发");
            }
            outputText("。高潮中，你夹住她的脑袋，用力之大甚至把她的耳朵都压平在头侧。她的双手抓住你的屁股，试图把你推开，但她早已在自己的激情痉挛中耗尽力气，根本敌不过你仍在继续的高潮；你紧紧压着她，直到身体终于放松下来。");
         }
         outputText("[pg]力气耗尽后，你从希拉身上滚到一旁");
         if(param1 && get_player().hasCockThatFits(32))
         {
            outputText("，同时从她喉咙里抽了出来。她也立刻翻过身，强撑着四肢跪伏起来，随即干呕着咳出大量你的精液。等她吐出足够多、总算清开喉咙后，她向前瘫倒，把那片狼藉抹到自己胸口上，又花了几分钟才喘过气来。等呼吸平稳后，她翻回身坐起，你的黏液还拉成细丝，将她的乳房和草地连在一起。");
         }
         else
         {
            outputText("。她坐起身，擦去眼边的汗水和残留的液体。");
         }
         if(get_player().cor >= 90 && sheilaCorruption() >= 90)
         {
            menu();
            addButton(0,"继续",sheilaGoesDemon);
            return;
         }
         if((get_player().cor > 90 || get_player().cor > sheilaCorruption()) && sheilaCorruption() >= 80 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,761) != 3)
         {
            sheilaCorruptionUpdate();
            outputText("[pg][say: 操，看看你把我的奶子弄得多大？它们看起来都像是随时会从我胸口发射出去，把冒出来的怪物全轰飞！]");
            outputText("[pg]你被高潮冲得迷迷糊糊的大脑按她的要求，把注意力落在了希拉的胸脯上。它们确实显得巨大又好捏，于是你想也不想就伸手揉上其中一只。希拉在你触碰她泛红的皮肤时颤了一下，却一把抓住你的手腕。[say: 该死，[name]，住手！你身上到底带着多少该死的污秽啊，你这浪货？] 见你终于注意到了，她松开了手。[say: 刚才那样对不起，但要是你再这样污染我，我就没法继续和你待在一起了！我还有职责，还有同伴指望着我，可现在我脑子里想的全是把他们按倒，变成被我囚起来的肉棒，想什么时候塞进我身体就什么时候塞！]");
            outputText("[pg]呃……好吧，把她的朋友们绑起来再操到神志不清，确实不是什么值得赞成的事……至少不能不分给你用。啊，等等，你刚想抓住的那个滑溜念头，又因为希拉的乳房在你手里起伏了一下而溜走了。说到该抓住再绑起来的东西……");
            get_player().orgasm("Generic");
            dynStats(DynStat.Lib(-0.5));
            get_player().slimeFeed();
            menu();
            addButton(0,"听她的",sheilaCorruptionWarningListenToHer);
            addButton(1,"抚摸她",sheilaCorruptionWarningsChooseFondle);
            return;
         }
         outputText("[pg][say: 诸神啊，[name]，] 希拉咳了一声，盯着你。你还沉在高潮后的脱力里，转头看向她。");
         if(param1 && get_player().balls > 0)
         {
            outputText("你看到的景象让疲惫的你都忍不住爆笑出声。希拉一直用嫌恶的眼神瞪着你，直到你缓过劲来，足以解释自己为什么笑：她的额头上留下了一个完美的");
            if(get_player().balls == 2)
            {
               outputText("无穷符号");
            }
            else
            {
               outputText("双重无穷符号");
            }
            outputText("形状印记，和周围皮肤形成鲜明对比——那正是你的[balls]压出来的。袋鼠女孩对这幼稚的表现翻了个白眼，又继续数落起来。");
         }
         outputText("[say: 你要做这种事之前，好歹该给姑娘提个醒吧。我还以为你要杀了我呢！]");
         get_player().orgasm("Generic");
         dynStats(DynStat.Lib(-0.5));
         sheilaCorruptionUpdate();
         get_player().slimeFeed();
         outputText("[pg]她一时间平静了下来，然后贴到你身旁。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,761) == 3)
         {
            outputText("[say: [name]……谢谢。就算浑身沾满你的东西，也比在外面困上一整夜强——怕得不敢碰自己，又欲火焚身到没法逃跑。] 希拉在你脸颊上亲了一下。[say: 我的黏糊糊英雄，对吧？我现在没事了；我能撑到早上大门重新打开。]");
            outputText("[pg]不管那是什么意思……她该不会打算整晚都待在外面，独自一人，还浑身都是正在干掉的性液吧？");
            outputText("[pg][say: 呃……差不多，是啊？这也不是第一次了——我是说，通宵不睡这件事。] 希拉有点脸红。[say: 要是赶不上宵禁，就只能这样；我得自己照看好自己。不过现在你已经……帮过我了，我总算能集中精神了。]");
            outputText("[pg]希拉轻轻抱了你一下，便开始抽身离开；她显然真的打算一直清醒到早上，在外面奔跑、躲藏，避开任何可能靠近的东西。听起来可没什么意思。");
            menu();
            addButton(0,"任她去",sheilaXPThreeSexyTimePostSexLetHerBe);
            addButton(1,"陪着她",shielaXPThreeSexyTimePostSexStay);
            return;
         }
         outputText("[say: 算了。你刚才把我弄成那样，我原谅你了。只是小心点，你这混蛋。]希拉闭上眼睛，把你的手臂拉到她肩头");
         if(param1 && get_player().hasCockThatFits(32))
         {
            outputText("，让你垂下的手蹭进她胸上的一片狼藉");
         }
         outputText("。你们俩就这样躺了一会儿，直到她起身。[say: 我真的该走了……得去治治我染上的那玩意儿。更别说，我还得先把自己清理干净，才能把这该死的衣服穿回去。]希拉拿起自己的东西。[say: 嘿嘿……回头见。]");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function clitSwellingDemonSheilaClitSoundingAnal() : void
      {
         clearOutput();
         if(!get_player().isTaur())
         {
            outputText("希拉把手放在你后腰的凹处，俯身靠近你的脸，同时把你的腰往她那边拉去。");
         }
         else
         {
            outputText("希拉把手搭在你的马肩隆上，一边看着你的眼睛，一边轻轻向下按。");
         }
         outputText("[say: 为什么不放松点呢，[name]？躺下来，让我好好照顾你……]她眼帘微垂，嘴角勾起狡黠的笑容；有那么一瞬间，看着她那恶魔般的表情，你不禁有些退缩。[say: 别担心，亲爱的，]她收起那副表情说道。[say: 我保证你会喜欢的。]");
         outputText("[pg]你脑子有些发懵，却仍带着几分矜持；即便如此，你还是任由希拉把你放倒在草地上，脱下你的[armor]。她");
         if(!get_player().isTaur())
         {
            outputText("转过身来，跨坐在你的胯间，并回头看向你。");
         }
         else
         {
            outputText("绕着你走到你的臀后，然后转过身，自己也跪了下来，越过肩头看着你。");
         }
         outputText("她那条黑色、带铲尖的尾巴从大腿间抬起，蛇一般探向你的小穴，");
         if(get_player().hasCock())
         {
            outputText("轻抚着");
            if(get_player().balls > 0)
            {
               outputText("你的[balls]");
            }
            else
            {
               outputText("你的[cock biggest]下侧，随后");
            }
         }
         outputText("强行分开你的阴唇，在你迅速肿胀的[clit]上逗留。[saystart]哦，天哪。这个");
         if(get_player().getClitLength() <= 6)
         {
            outputText("淫荡的小");
         }
         else
         {
            outputText("怪诞的");
         }
         outputText("东西，怎么会长在你这样漂亮的女孩身上？这大小简直正适合拿来玩玩。[sayend]");
         outputText("[pg]你的双眼惊慌地睁大，与此同时，她也因快感张开了嘴；她猛地把铲尖上的裂缝套上你的那颗小豆");
         if(get_player().getClitLength() > 6)
         {
            outputText("，将它吞入数英寸深");
         }
         outputText("。被吞没的阴蒂传来的快感压倒了你，让你头脑一阵眩晕，随后又逐渐逼近真正的疼痛。大量恶魔体液堵在她的尾巴里，开始从尖端周围渗出，裹住你的阴蒂，又滴落到你的阴唇上；随着热意攀升到令人难以承受的程度，你的肌肉绷紧，身体开始剧烈扭动，试图把自己肿胀的小肉棒从恶魔的身体构造中拔出来。[say: 啊、啊，天啊，[name]，停下！别这么乱动！你挑逗得太快了！]希拉的话根本传不到你耳中，你已经深陷在过度敏感的肌肤与持续刺激构成的地狱里。那感觉就像暴露在折磨下的神经还在不断增生，仿佛那些你之前甚至感觉不到的皮肤，也突然被浸进了这污浊的黏液之中。");
         outputText("[pg]她的尾巴在你的[clit]周围越收越紧，你的双眼因短暂的冲击而上翻；那阵攻势稍稍减弱，让你得以拼尽全力集中精神，看见那个恶魔也同样受到了影响！她的头垂在双肩之间，双手撑在身前的地面上稳住自己。她臀上的两条尾巴痉挛般抽甩着，又一波痛苦的快感挤进你的胯间。你只能呆呆看着，希拉那根乱甩的黑色桃形尾尖划出一小段急促的弧线，一根又长又粗的肉茎从中长出，将你们的身体连在一起。");
         if(get_player().getClitLength() <= 6)
         {
            outputText("[pg]你的意识慢慢回笼；那根肉茎正是你的阴蒂，被希拉的体液过度异变成了这样！");
         }
         else
         {
            outputText("虽然你如今已经习惯了自己阴蒂的模样——比起娇小的女性小突起，它更像是一根肉棒——但眼前这东西完全是另一回事！那根刺进她尾巴里的巨大玩意，几乎有你记忆中那根纤细凸起的两倍粗，上面鼓胀着血管；你看得出神，一缕希拉油滑而漆黑的分泌物顺着它滑下，随后被你腹股沟附近的血肉吸收，伴随一次脉动又让它增厚了一圈！");
         }
         outputText("[say:操，好紧！]恶魔喘息着，此刻她用手肘撑着，胸口和脸都贴在草地上。她的尾巴又是一抽，把你的肉茎扯得左摇右摆，同时释放出更多积在里面的体液。那些液体一路滑到你肉茎根部，才渗进你的皮肤。");
         outputText("[pg]你阴蒂末端的灼烧感已经逐渐减退，如今它与其说是颗小钮，不如说是一根杆；只有根部还在微微发麻，那种几乎难以忍受的感觉让你意识到它还在继续生长。[say:该死的，[name]，]希拉喊道，强迫自己再次用手肘撑直身体。[say:你要是再粗下去，就要把我撑裂出另一条尾巴来了。]你只是傻愣愣地张着嘴。");
         if(get_player().getClitLength() <= 6)
         {
            outputText("[pg]她跪坐起来，然后转过身面对你。");
            if(!get_player().isTaur())
            {
               outputText("她用手托住你的脸，帮你把下巴合上，然后凑过来在你的下巴上亲了一下。");
            }
            else
            {
               outputText("她眼中闪着戏谑的笑意。");
            }
            outputText("[say:怎么这副表情，伙计？看样子你现在已经吸饱了，而且正是时候。这……简直是……]她把尾巴从你阴蒂末端抬起，然后又慢慢滑下去。[say:……完美！]当她紧致的穴口再次吞下你敏感的雌性肉棒时，你眼睛一翻，她的头也垂了下去，头发拖着");
            if(get_player().isTaur())
            {
               outputText("掠过草地");
            }
            else if(get_player().biggestTitSize() >= 1)
            {
               outputText("在你的" + get_player().allBreastsDescript() + "之间");
            }
            else
            {
               outputText("，沿着你平坦的胸膛滑过");
            }
            outputText("。[say:操，连你的女性部位都这么棒。]希拉一吻接一吻地落在你的");
            if(!get_player().isTaur())
            {
               outputText("[chest]");
            }
            else
            {
               outputText(get_player().buttDescript());
            }
            outputText("，同时用她的桃形尾尖浅浅地套弄你的[clit]。你的骨盆无力地抽动；她的尾巴在空中挥动，而不是抵在自己身上，你根本控制不了这场交合的节奏。[say:不乖的希拉，]她一边说，一边用手捏住你扭动的髋部。你心里暗想，她这话说不定也完全是在说她自己。[say:我是不是不够快？那我加快点。]");
            get_images().showImage("sheila-corrupted-anal");
            outputText("[pg]你的恶魔情人再次转过身，双手重新撑在地上，抬起了屁股。她短钝的桃形尾尖干脆利落地套上你的肉茎，速度快得惊人，润滑液在紧窄空间的快速抽送中被挤出，开始迅速消散。热意再次席卷你的阴蒂，这次并不是来自药性的刺激，而只是来自你们不断升高的体温和彼此之间的摩擦。很快，你能在靠近她尾尖的地方感到干燥皮肤相互摩擦的灼热感，那里的润滑已经被完全挤走了。[say:天……对……操我，操我这条下流的尾巴，不上润滑狠狠干，用你那怪胎似的阴蒂把我的脏精液全都磨出来，插进来，让我看看谁才是男人！]希拉的声音在说完这些要求时已经尖得像在叫喊。[say:操、操！我要去了！]她向前瘫倒，而");
            if(get_player().cor < 50)
            {
               outputText("她的尾巴剧烈颤抖，你感觉有什么滚烫的东西舔上了你阴蒂的顶端。桃形尾尖往后一退，又再次沉下，那股热意又向下推进了几英寸；她又重复了两次，直到你能感觉到那必定是她精液的东西一路灌满到她的尾尖，可当她试图再次后退，把自己的高潮强行挤过边缘那片又热又被磨得生疼的皮肤时，她的尾巴却只是在你的阴蒂上一抽，随后她虚弱地倒在地上。");
               outputText("[pg][say:不……不要！就差一点了！]黑色尾茎无力地抽动着，她的身体几乎失去了所有肌肉控制，只剩下负责把精液挤出来的部位还在运作。她可怜地呻吟着，语无伦次地嘟囔；她的尾巴在你的阴蒂周围鼓胀起来，用她液态的高潮将你吞没，桃形尾尖后方也因不断堆积的体液而膨胀到两倍粗。眼前这一幕实在太过分——这个傲慢的女人想利用你来让自己爽到，却只做到不断挑逗自己，同时让你的阴蒂浸满她滚烫的体液；再加上那热度，终于把你推过了你一直徘徊的边缘。你的" + get_player().vaginaDescript(0) + "一阵收缩并喷涌，把你自己的高潮也倾泻在");
               if(get_player().wetness() >= 4)
               {
                  outputText("恶魔的腿上");
               }
               else
               {
                  outputText("草地");
               }
               outputText("，你的阴蒂在饱受折磨的伴侣体内进一步肿胀起来。希拉呻吟道，[say: 去你的，[name]……]");
               outputText("[pg]她恼火地用另一条躁动的尾巴缠住那条仍在绷紧的黑色尾巴，用力一挤，终于让部分高潮液越过末端那圈紧绷的皮肤；随着液体连成一道桥，你感觉那股紧绷猛然松开，一波黑色滑腻的尾液将她的裂口强行撑开，喷涌而出，浸透你的阴蒂，接着淋到下面的小穴上。[say: 啊！啊！终于！]她叫喊着，大股躁动的黏液沿着你的[clit]滑下，在你的小穴边冒泡、舔舐，仿佛想钻进去一般。");
            }
            else
            {
               outputText("她的尾巴一阵颤抖，接着把她的小穴推向你的。[say: 天啊，对！]你的恶魔情人高潮时，一滩滚烫的液体溅到你的" + get_player().vaginaDescript(0) + "上，另一股则开始从你的阴蒂尖端周围流淌下来，而它仍被悬在她扭动的尾巴里。突如其来的阴唇热意让你再也承受不住，你也以自己的高潮回应她，");
               if(get_player().wetness() >= 4)
               {
                  outputText("滴滴答答地淋在");
               }
               else
               {
                  outputText("大量浸湿");
               }
               outputText("她的小穴上，流下你自己的女液。感觉就像她的小穴近在咫尺，把你的高潮拖得淫靡而漫长；你一次又一次地高潮，把更多液体滴到她放荡的小穴上，而她则用肉唇在你身上研磨。她抚弄着自己的乳房，同时让抽搐的小穴摩擦你的，捏弄、拉扯着它们，直到你几乎发誓自己能看见它们被拉长。");
            }
            outputText("[pg]精疲力尽的她靠在你身上喘了好几分钟，然后才用发软的双腿撑起身子。她小心翼翼地把那条被折磨得不成样子的尾巴从你巨大的阴蒂上扯出来，随即皱起脸，一手按住肚子，积压的液体从铲形尾尖大量渗出。[say: 呃，感觉我要吐了。伙计，回头见。]她反胃似的转身离开，身后留下一道黑色黏液的痕迹。你昏昏欲睡地想着，自己那根正慢慢缩小的阴蒂会不会在醒来时恢复正常。大体上它确实恢复了，只是至少还保留了一英寸的额外长度。");
         }
         else
         {
            outputText("[pg]她把尾巴从你的阴蒂里抽出来，紧张地看着残留在上面的深色油液被皮肤吸收，而它又变宽了半英寸。希拉用不太确定的眼神看向你，再次开口。[say: 呃呵。就算你是女人，看起来你这玩意儿对我的小洞来说也太像男人了。]她漫不经心地玩弄着自己的乳头，看着你呼吸时那段异常拉长的皮肤在温暖空气中上下晃动，随后俯下身，咧嘴朝它吹了口气；你扭动起来，惹得她咯咯一笑。[say: 我可以像撸普通肉棒一样给你撸出来……你喜欢那样吗？]这恶魔用手抚摸着你，思索了一会儿。[say: 啊，不行。刚才被你插在里面之后，我也发情了。可这个荒唐玩意儿……哦，我知道了。]");
            get_images().showImage("sheila-corrupted-anal");
            outputText("[pg]你盯着希拉，看着她转过身去");
            if(get_player().isTaur())
            {
               outputText("并仰面躺倒");
            }
            outputText("，然后用尾巴缠住你变粗的阴蒂。尾巴扭绞拉扯，让一圈圈快感沿着密集的神经传开，并开始轻柔却执拗地把你拽向她棕褐色的屁股。希拉把顶端对准她臀瓣之间，你能感觉到她正用它摩擦穴口周围的肉环。[say: 我觉得这个大小应该挺适合你，亲爱的，]她调笑着，让你的[clit]刺入自己。一寸又一寸缓慢滑入她体内，那股温热把你折磨得几近疯狂，直到");
            if(get_player().getClitLength() <= 12)
            {
               outputText("整根都没入她的肠道，她滚烫的小穴抵在你的小穴上");
            }
            else
            {
               outputText("她已经吞下了自己能承受的全部长度");
            }
            outputText("。她对你露出一个半笑半皱眉的表情。[say: 我平时不怎么用这个洞来受，不过我想感受你的小穴为我发疯。]");
            if(get_player().getClitLength() <= 12)
            {
               outputText("她的臀部一动，肉唇擦过你的，同时隔着她的肛穴搅动你的阴蒂，而那里还在夹紧你；你的小穴在刺激下抽搐起来。");
            }
            else
            {
               outputText("她的尾巴突然滑进你体内，其中一条仍因被你不断长大的阴蒂撑开、折磨而肿胀，并带来那种轻微的灼烧感；要不是你早已被这种感觉浸透，恐怕早就昏过去了。");
               if(get_player().hasVirginVagina())
               {
                  outputText("[say: 这是什么？]希拉调笑道。[say: 哎呀，你的贞操居然还完好无损呢，小姑娘！我可不想让它出什么事！]她把尾巴稍稍抽出一些，只满足于挑逗你的唇瓣，把你撩拨得渴望被插入、几乎发疯。");
               }
               outputText("这恶魔绕着你的阴蒂挪动身子，一阵快感穿过你全身，让你的阴唇不由自主地包住入侵者。");
            }
            outputText("[pg]希拉将长着长爪的双脚抵在");
            if(!get_player().hasTailInsteadOfLegs())
            {
               outputText("你的大腿，把你的[legs]大大分开，然后从上方勾住，让它们碰到");
            }
            outputText("你屁股旁边的地上，利用杠杆原理开始把你的阴蒂在她的屁眼里抽插，每次她滑到底时都会抚摸你的" + get_player().vaginaDescript(0) + "。[say: 我能习惯这个，亲爱的。要不我一直给你下这种药，让你做我的假阳具怎么样？我每次都会用不同的洞骑你！] 你的眼睛向上翻，至少部分是因为她抚摸你阴蒂的节奏不规律。希拉再次大幅减速时抓住了她的乳房，用手揉捏着，然后一寸一寸地沉到你身上。[say: 操……我喜欢你的玩意儿，[name]。也许我也该抓个地精，让她挑逗我的小穴，而你填满我的屁股。] 她重新抬起身体并");
            if(get_player().getClitLength() > 12)
            {
               outputText("拔出她那条黑色尾巴，上面滴着你的淫液，然后");
            }
            outputText("又开始用湿淋淋的铲形尾尖沿着你的阴蒂摩擦，把她的黏液抹满你粗大的小鸡棒。你能感觉到她尾尖上那个被撑开的孔洞边缘在你的皮肤上蠕动，随着大量受污染的润滑液渗出，微微地一张一合。你的[clit]肯定已经彻底湿透了，因为那些滑腻的黏液没有再渗进去，而是停留在表面。[say: 要把你弄得湿——湿透才行，亲爱的……哦，]希拉说道，短尾湿滑的末端沿着你描摹带来的快感让她几乎分心。");
            outputText("[pg]终于用油腻的分泌物把你涂到满意之后，希拉又开始抽动。先前那种灼热的摩擦感消散了，取而代之的是一股钝钝的、扩散开的暖意，随着她的屁眼沿着你的阴蒂滑动而蔓延。阻力变小后，她的节奏快得近乎疯狂，在地面上蹭得太快，甚至开始把草皮都撕扯起来。你尽可能承受着她臀部一次次抽送和扭动的攻势，但最终那感觉还是太过强烈，你的神经先一步失控，高潮随之到来。你的" + get_player().vaginaDescript(0) + "抽搐着，淌落到她的");
            if(get_player().getClitLength() <= 12)
            {
               outputText("小穴上；当她光滑小巧的阴唇碰到那些液体时，便贪婪地舔舐着，同时擦过你的阴唇，引出更多抽动和喷溅。");
            }
            else
            {
               outputText("挑逗着你的尾巴上；它们从摩擦你的阴唇转为将其撑开，任由你的小穴想怎么喷就怎么喷。");
            }
            outputText("她突然在抽动到一半时停住，屁眼一阵颤抖，让你正因高潮而敏感的阴蒂一路发麻。[say: 操——！这么快！我也要去了，[name]！]希拉沉下身，把你的[clit]深深埋进她的屁眼里。");
            if(get_player().getClitLength() <= 12)
            {
               outputText("她的尾巴随着她的扭动沉入你体内，分开你的阴唇，挤了进去。");
               if(get_player().hasVirginVagina())
               {
                  outputText("<b>你失去了童贞！</b>");
               }
               outputText("埋在你小穴里的铲形尾尖开始淌出越来越多的黑色液体，而希拉也在高潮中浑身痉挛。");
            }
            if(get_player().cor < 50)
            {
               outputText("恶魔的小穴涌出多得不自然的液体，像一道小小的瀑布从她的阴唇间倾泻而下，浸透你的胯间。希拉至少在你身上喷洒了足足一分钟，流出的热液多到超乎你的想象，直到她看起来简直像被榨干了水分——就连乳房似乎都变小了，晃动也没那么明显了。");
            }
            else
            {
               outputText("恶魔的皮肤似乎变得干渴起来，她不依不饶地磨蹭着你，将你的体液蒸发得飞快，大部分甚至还来不及落下。她滚烫的肉体沉沉压在你的阴唇上，延长着你的高潮，诱出比你以为自己体内还要多的潮喷。就连你的嘴里似乎都变干了，仿佛她正把你的精华尽数吸走。");
            }
            outputText("[pg][say: 啊，[name]，]过了一分钟才缓过来的希拉说道。[say: 在我屁股里感觉真舒服。]她慢慢与你分开，让你的阴蒂以折磨人的速度从她的后门里滑出，然后站了起来。");
            if(get_player().getClitLength() > 12 && get_player().hasVirginVagina())
            {
               outputText("[say: 抱歉弄破了你的处女膜，亲爱的，可我就是忍不住，想把你这么可爱的小荡妇变成我的女孩。希望你会记得我——我只希望自己有根真正像样的肉棒，那样也能让你怀上我的孩子。]");
            }
            outputText("即便你已经累成这样，看到那个恶魔女孩身上的样子还是让你笑了出来。她为此愣了一下，然后顺着你的视线看去；");
            if(!get_player().isTaur())
            {
               outputText("她的奶子上沾满了草渍，全是刚才疯狂抽动时蹭上的。");
            }
            else
            {
               outputText("她扭头一看，才发现自己的两瓣屁股因为一次又一次猛烈地砸向你，已经被撕碎的草弄得又绿又湿。");
            }
            outputText("[say: ……哦，真他妈的，]希拉抱怨道。她走过来，把你的脸按进那里，慢慢地蹭了好一会儿，随后想到一个笑话似的咯咯笑起来。[say: 好了，[name]；我把你染上我的颜色了！]她在你沾满草渍的额头上长长亲了一口，然后把你放回地上，站直身子离开了。筋疲力尽的你迷迷糊糊睡了过去，想着醒来之后到底能不能把肿胀的阴蒂塞回衣服里，还是只能让它露在外面一路走回营地。你睡着时，它慢慢消肿了，但还是保留了一点额外的长度。");
         }
         if(get_player().getClitLength() > 12 || get_player().cor < 50)
         {
            get_player().cuntChange(12,false,false,false);
            get_player().slimeFeed();
         }
         get_player().changeClitLength(1);
         if(get_player().hasPerk(PerkLib.BigClit))
         {
            get_player().changeClitLength(0.5);
         }
         if(get_player().cor < 50)
         {
            dynStats(DynStat.Cor(10));
            sheilaCorruption(-10);
         }
         else
         {
            sheilaCorruption(10);
            dynStats(DynStat.Cor(-10));
         }
         get_player().orgasm("Vaginal");
         dynStats(DynStat.Lib(-1),DynStat.Sens(-2));
         if(get_game().get_inCombat())
         {
            get_combat().cleanupAfterCombat();
         }
         else
         {
            doNext(get_camp().returnToCampUseOneHour);
         }
      }
      
      public function castArouseAndLetHer() : void
      {
         clearOutput();
         outputText("你刚一点头，女孩就猛地弹起身来扑向你，那股热切的冲劲把你压得微微一沉。");
         dynStats(DynStat.Cor(10));
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,761,4);
         menu();
         addButton(0,"下一步",sheilaLossRapeRouter);
      }
      
      public function castArouseAndLeaveSheila() : void
      {
         clearOutput();
         outputText("你遗憾地摇了摇头。[say:抱歉，我现在没时间。]");
         outputText("[pg]气喘吁吁的女孩露出惊恐的表情。[say:不！求你，别这样！要是你把我一个人丢在这里被抓到，我就完了！]");
         outputText("[pg][say:你太夸张了。我相信不会有事的。]");
         outputText("[pg]你再次转身离开，任由那个女人在身后呼喊。对于一个声称不想被发现的人来说，这可不是什么避人耳目的好办法。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,760,100);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,764,1);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,765,-1);
         dynStats(DynStat.Cor(10));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function breakScarredBlade() : void
      {
         outputText("伤痕之刃落到地上，不再动弹。你走过去抓起那把军刀，却发现它仍在微微颤动。必须把这把军刀折断，才能确保它不再构成威胁，同时还能继续使用。[pg]");
         if(get_player().get_str() >= 85)
         {
            outputText("你抓住军刀的刀身，使出全力将它弯折。金属发出呻吟般的声响，勒希晶石也随之开裂。你反复扭动刀身，直到军刀的一段终于断裂脱落。");
         }
         else
         {
            outputText("你抓住军刀的刀身，试图使出全力将它弯折。可无论你怎么用力，刀身都拒绝弯曲。");
            if(followerHel())
            {
               outputText("你把赫莉娅叫了过来。[say: 嘿，亲爱的！需要帮忙吗？]她问道。你问她能不能折断伤痕之刃。[say: 当然，亲爱的。把剑举好。]赫莉娅指示道。你举起伤痕之刃，赫莉抬起自己的弯刀，干净利落地劈过伤痕之刃，斩断了刀身的一段。");
            }
            else if(followerKiha())
            {
               outputText("你把奇哈叫了过来。[say: 嗯？]");
            }
            else if(marbleFollower())
            {
               outputText("你把玛布尔叫了过来。[say: 你需要什么，亲爱的？]她问道。你问她能不能折断伤痕之刃。[say: 当然，亲爱的。我去拿锤子。]");
            }
            outputText("你把剑朝树扔去，剑身有一截嵌进了树干。借着额外的支点，你反复把剑向侧面推拉。金属发出呻吟般的声响，勒希晶石也随之开裂。弯折了几分钟后，军刀的一段终于断裂脱落。");
         }
         outputText("[pg]你仔细检查这把如今已经折断的军刀，发现它再也不动了。伤痕之刃内部的某种恶魔力量现在应该已经消失了。看起来这把剑仍然可以使用。");
         get_combat().cleanupAfterCombat();
      }
      
      public function bigDickAndThighs() : void
      {
         clearOutput();
         outputText("希拉一边抚弄着自己，你");
         if(!get_player().isTaur())
         {
            outputText("脱下你的[armor]；当你把[eachcock]掏出来时，这个恶魔的眉毛都挑了起来");
            if(get_player().cockTotal() > 2)
            {
               outputText("一个接一个，几乎像是叠在一起似的");
            }
            outputText("。");
         }
         else
         {
            outputText("慢慢向她靠近，你的[cocks]随着每一步轻轻晃动。");
         }
         outputText("[pg][say:哦，不……]她红着脸说道。[say:[name]，你也太大了……你真的要把那种东西塞进我可怜的小穴里吗？]");
         if(get_player().cor < 40)
         {
            outputText("[pg]唔……和你那根高耸的大家伙比起来，她的小穴确实显得有点小得可怜。你问她想让你放到哪里。");
            outputText("[pg]希拉笑了笑，翻过身去，四肢着地分开双腿。[say:我有件事想试试……你也会舒服的，所以能过来一下吗，搭档？]她把手伸到两腿之间，但并没有像你预想的那样探进自己的小穴，而是在下面朝你勾了勾手指。[say:这里；把它带到这里来。]");
            outputText("[pg]你有些好奇地[walk]向她，把你的[cockHead biggest]对准她小穴下方，在她掌心蹭了蹭，抹上一团前液。你能看见她无声地颤抖着，并拢手指把玩那股滚热黏稠的液体，在指间拉出半透明的丝。");
            if(get_player().cockTotal() > 1)
            {
               if(get_player().cockTotal() == 2)
               {
                  outputText("两根");
               }
               else
               {
                  outputText("全部");
               }
               outputText("都……把它们滑到这里来，亲爱的，[sayend]恶魔坚持道。你把剩下的阳具也对准那里，强行夹进她的大腿之间。");
            }
            outputText("她握住你[cock biggest]的顶端，轻轻往前拉，引着你靠近；你缩短了距离，直到[eachcock]都从她双腿间探出头来，你的胯部也贴上了她的胯部。");
            outputText("[pg][say:我要借用一点你的感觉……]希拉轻声宣布。");
            if(!get_player().isTaur() && get_player().get_tallness() >= 60)
            {
               outputText("她直起身来，在你脸颊上吻了一下；她双唇碰到的地方让你的脸有些发麻。");
            }
            outputText("[say:希望这对你来说还是会很棒，但是……这样我也能一起感受了。]恶魔用那只湿滑的手试探着给你揉了几下；你几乎什么都感觉不到。可她自己却像是快要撑不住了；她的小穴贴着你扭动，膝盖一软，半个身子都搭在了你的肉棒上。");
            outputText("[pg][say:太棒了……这真的……]你的伴侣红着脸颤抖起来。[say:对、对不起，呃……只是想知道你平时能感受到什么。我会乖的。]");
            outputText("[pg][say:我觉得你有点快枪手呢，]你回敬道。希拉坏坏地笑了");
            if(get_player().isTaur())
            {
               outputText("，虽然你看不见");
            }
            outputText("。");
            outputText("[pg][say: 我们来看看谁先高潮。] 她靠在你的[cocks]上支撑身体，抬起另一只手触摸你；这次几乎能感觉到全部的触感，你高兴地叹了口气。希拉开始用新加入的手和原来的手一起抚摸，抓住");
            if(get_player().cockTotal() == 1)
            {
               outputText("双手握住你的阴茎");
            }
            else
            {
               outputText("每只手各握住一根阴茎");
            }
            outputText("，并向上调整角度，让前液往下淌，润湿她的手指。");
         }
         else if(get_player().cor >= 40)
         {
            outputText("[pg]那他妈有什么关系？她可是个恶魔。你沉下脸逼近，希拉皱着脸翻过身，把屁股高高抬起。[say: 只是……慢点，让我先撑开，]她坚持道。");
            outputText("[pg]嗤。你把[cock biggest]对准她的小穴，完全不顾这女人的感受，直接顶了上去。她试着集中精神，把自己的小穴张开；你确实能看见它扩开了好几英寸，随后你便毫不留情地将[cockHead biggest]撞了进去。希拉倒吸一口气，接着咬紧牙关，任由你一次次冲撞她的入口，索要进入，却又每次都被挡在外面。");
            outputText("[pg][say: 真没用，]你抱怨道。[say: 哪有性魔连自己的小穴都张不开的？]");
            outputText("[pg][say: 该死，[name]；我在努力了，可你碰到我那些该死的神经，把我弄得停不下来，这活儿他妈太难了，]她反呛回来。你在她炙热而被撑开的穴口里扭动、碾转[cockHead biggest]，把滑腻的前液抹得到处都是，她的身体也随之颤抖。她的尾巴垂下来缠住你的肉茎，试图让它别再乱动；你却不服气地更用力顶动、摆动腰胯。希拉手肘一软，跌趴在地。她败下阵来似的垂着头，而你得意地折磨着她脆弱的私处。[say: 嗯嗯……操……]");
            outputText("[pg]两条尾巴松开了对你[cock biggest]的缠绕，并在它上方拱起，突然把它推偏了位置，让你下一次顶动滑进了她大腿之间，撞上了她的小腹。恶魔的双手立刻抓住它，将它固定住，不让你再抽出去。[say: 抱歉，老兄……那样我没法集中精神……]她嘟囔着，回头看向你。[say: 不过我会补偿你的……我保证。]她的手指摸索到你已涌出前液的尿道口，在上面轻轻拨弄，让一阵酥麻沿着你的家伙往上窜。");
            if(get_player().cockTotal() > 1)
            {
               outputText("[pg]她出人意料的娴熟让你浑身一颤，但你的脑子仍然抓住了能获得更多快感的办法。[say: 好吧，]你同意道，[say: 但你可不会轻松。]你将另一根阴茎对准");
               if(get_player().cockTotal() == 2)
               {
                  outputText("，让它从她双腿间滑过去，挤在你第一根阴茎和她小穴之间，像犁沟一样碾过她的入口；她浑身发颤，你能感觉到那里正贴着你的皮肤收缩。");
               }
               else
               {
                  outputText("，你将它们一根接一根地推过这女人的双腿，每推进一根，都把温热的前液抹在她的大腿上；当你用自己的液体涂满她的肌肤时，她的小穴也贴着你[cock biggest]的上方收紧。");
               }
            }
            else
            {
               outputText("[pg]");
            }
            outputText("希拉向后挪动，顺着那根怪物般的巨根一路贴近，直到屁股抵上你的胯部，接着她双手环住你，开始给你手淫，用你淌出的液体和她自己的湿意当作润滑。");
            outputText("[pg]她似乎和你一样沉迷其中；抚弄时，她的舌头微微伸出，开始把你的[cocks]夹在她的" + sheilaCup() + "乳房之间摩擦，将你的分泌物抹遍她整个上半身。她的皮肤很烫，触感也很好，只是没有你预想中那么鲜明。恶魔的小穴明明只是贴在你的肉茎上没有动作，却又一次疯狂收缩起来，你这才意识到：她其实是在从你身上汲取快感！");
         }
         outputText("[pg]那女人很快就沉浸在自己的小世界里，摸索着你肉棒");
         if(get_player().cockTotal() > 1)
         {
            outputText("");
         }
         outputText("上的每一处敏感神经，并逐一挑逗；你无力地顶进她手里，帮着引导她的双手，可你孤零零的顶端仍渴望着刺激。就在那感觉强烈到你准备开口说些什么时，希拉却像预知到一样，抢先顺着你的肉茎挪动小穴，将你的[cockHead biggest]含进嘴里。她的舌尖轻点你的尿道口，品尝你的液体，而她的双手");
         if(get_player().cockTotal() > 2)
         {
            outputText("放弃你其他的肉棒并");
         }
         if(get_player().cockTotal() == 2)
         {
            outputText("松开你的另一根肉棒，转而");
         }
         outputText("专心从你身上挤出更多液滴。她几乎把自己的嘴唇都涂满了它，用你的马眼在唇上摩擦，然后又把整颗[cockHead biggest]含回嘴里。你忍不住发出一声呻吟，紧接着另一声也从希拉喉中传来，顺着你的[cock biggest]传遍全身。");
         outputText("[pg]随着她的注意力重新集中到你的[cockHead biggest]上，你的[cocks]中段涌起一阵失落感——又很快被她的胸口压了下去。");
         if(sheilaCorruption() < 50)
         {
            outputText("虽然她并不丰满的乳房根本包不住你的粗度，希拉仍兴致勃勃地用乳沟蹭着你的肌肤，同时用舌头逗弄你的龟头。");
         }
         else if(sheilaCorruption() < 150)
         {
            outputText("她那对硕大的" + sheilaCup() + "罩杯乳房轻松包住你的粗度，她一边把柔软泛红的肌肤挤在一起，一边沿着你的肉棒上下滑动。");
         }
         else
         {
            outputText("这个恶魔大得离谱的乳房轻松覆盖了你肉棒的整个长度");
            if(get_player().cockTotal() > 1)
            {
               outputText("");
            }
            outputText("，从她胯间一直垂到嘴边，让她整具身体都像一个巨大而湿润的肉穴");
            if(get_player().cockTotal() > 1)
            {
               outputText("，就是为了容纳" + Utils.num2Text(get_player().cockTotal()) + "根肉棒而生");
            }
            outputText("。");
         }
         outputText("[pg]然而，这一切挑逗归根结底都只是前戏；你想要更多，想要射出来，把精液洒满她的脸和胸口。你把肉棒从她嘴里抽出，开始在她湿滑的大腿间挺动，同时想着她劫持了你的情绪，会不会也让她想要同样的东西。像是在回答你的疑问，希拉把黏糊糊的手指从胸前移开，垂到地面，重新摆回最初的姿势，并将双腿紧紧夹住。");
         if(sheilaCorruption() >= 150)
         {
            outputText("她巨大的乳房一路垂到地面，形成了第二个更柔软的洞口，让你肿胀的肉棒能顶进去");
            if(get_player().cockTotal() > 1)
            {
               outputText("");
            }
            outputText("。");
         }
         outputText("[say: 对、对，]她喃喃道，[say: 要操她……更用力……]");
         outputText("[pg]这个显而易见的回答与你擦肩而过，你浑然未觉，只顾把自己的家伙");
         if(get_player().cockTotal() > 1)
         {
            outputText("");
         }
         outputText("硬生生挤进她双腿夹成的虎钳里；你越来越沉溺在快感中，甚至没注意到希拉的腰臀开始与你同步挺动，将她的阴阜向下压在你的");
         if(get_player().cockTotal() > 1)
         {
            outputText("最上方的");
         }
         outputText("肉棒上。伴随着最后一次猛烈无比的挺进，你把胯部狠狠撞上她的下身，开始射精。");
         if(get_player().cor < 50)
         {
            outputText("那感觉似乎让希拉重新清醒过来；她抬起身体，让小穴紧贴上来，而你被夺走的感受也一股脑涌回体内——还夹带着一份意外的礼物。你能感觉到你的……不，是<i>她的</i>恶魔小穴一阵阵抽搐，徒劳地想把精液吸进去，同时她自己的高潮也爆发了。她用狡黠的眼神看着你。[say: 这是给我爱人的一点回礼，]女人娇声说道，[say: 让你知道我有多在乎你。]");
         }
         else
         {
            outputText("[say: 天啊！]希拉尖叫道。[say: 我要去了！精液喷得到处都是！]确实，随着你的身体射出一股股精液，希拉瞄准[eachcock]引导着它们的方向，把自己弄得满身都是；她一边呻吟，一边用双手尽可能多地挤出来。");
         }
         outputText("[pg]结束后，你把敏感而湿透的肉棒");
         if(get_player().cockTotal() > 1)
         {
            outputText("");
         }
         outputText("从她仍在夹紧的大腿间抽出来，浑身一颤；希拉也跟着你一起颤抖，直到你终于完全抽离、断开皮肤接触，她才小心翼翼地落到地上。恶魔转向你，露出被你的精液溅满的脸和胸口。她盯着你逐渐软下来的肉棒");
         if(get_player().cockTotal() > 1)
         {
            outputText("");
         }
         outputText("，神情里几乎带着留恋，像是在舍不得看着");
         if(get_player().cockTotal() == 1)
         {
            outputText("它");
         }
         else
         {
            outputText("它们");
         }
         outputText("离开。");
         outputText("[pg][say: 既然你这么喜欢肉棒，为什么不自己长一根？]你问。");
         outputText("[pg]希拉听了咯咯一笑，抬眼迎上你的目光。[saystart]可我爱的只有你的那根，[name]。只要你答应");
         if(!get_player().hasVagina())
         {
            outputText("为我长出一个好看的小穴，让");
         }
         outputText("我随时想插你就能插，我也许就会把它从你身上取下来哦。[sayend] 她冲你吐了吐舌头，滴在她唇边的精液也淌到了舌尖上。");
         outputText("[pg]你摇摇头，把她抛在身后离开了。");
         get_player().orgasm("Dick");
         dynStats(DynStat.Lib(-1),DynStat.Sens(-1));
         if(get_player().cor < 50)
         {
            dynStats(DynStat.Cor(10));
            sheilaCorruption(-10);
         }
         else
         {
            dynStats(DynStat.Cor(-10));
            sheilaCorruption(10);
         }
         if(get_game().get_inCombat())
         {
            get_combat().cleanupAfterCombat();
         }
         else
         {
            doNext(get_camp().returnToCampUseOneHour);
         }
      }
      
      public function beatUpDemonSheila(param1:Boolean = true) : void
      {
         if(param1)
         {
            clearOutput();
            outputText("[say: 啊，你赢了，伙计。我认输。]希拉瘫坐到地上，");
            if(get_monster().get_HP() < 1)
            {
               outputText("她的伤口开始在柔和的淡紫色光芒中愈合。[say: 真他妈强。我猜你身上没有精液能给我吧？我真想给你生几个孩子……]她恳求地看着你，轻轻抚弄着自己。");
            }
            else
            {
               outputText("用力抚弄着自己。[say: 想怎么处置我都行，亲爱的；条件就是这样。你不来拿我的身体满足自己吗，你这粗暴的家伙？]这个大胆的女人吐出舌头，像是在挑衅你粗暴地对待她。");
            }
         }
         if(get_player().get_lust() <= 33 && param1)
         {
            outputText("[pg]不过你现在还没色欲高涨到想和她做爱的程度。你转身离开时，她稍稍蔫了下去。[say: 抱歉，我只是玩得开心了点……那我们很快再见，好吗？]她满怀期待地喊道。");
            get_combat().cleanupAfterCombat();
            return;
         }
         if(get_player().get_gender() == 0)
         {
            get_combat().cleanupAfterCombat();
            return;
         }
         menu();
         addButtonDisabled(0,"传教士","此场景需要你拥有一根尺寸合适的阴茎。");
         addButtonDisabled(1,"肛交泄愤","此场景需要你拥有一根尺寸合适的阴茎。");
         addButtonDisabled(2,"用她大腿","此场景需要你拥有一根大阴茎。");
         addButtonDisabled(3,"阴蒂插入","此场景需要你拥有阴道。");
         if(get_player().hasCockThatFits(56))
         {
            addButton(0,"传教士",missionaryForThePurposesOfCreatingImpsWithSheila);
         }
         if(get_player().hasCockThatFits(56))
         {
            addButton(1,"肛交泄愤",analHateFuck);
         }
         if(get_player().hasCock() && get_player().biggestCockArea() > 56)
         {
            addButton(2,"用她大腿",bigDickAndThighs);
         }
         if(get_player().hasVagina())
         {
            addButton(3,"阴蒂插入",winAgainstDemoNSheilaForVaginas);
         }
      }
      
      public function badEndScarredBlade() : void
      {
         outputText("你因伤势倒下，同时意识到伤痕之刃接下来要做什么。它正冲着你来！你尖叫起来，那把军刀朝你猛刺而来。");
         if(get_silly())
         {
            rawOutputText("\n\n[数据删除]");
         }
         if(marbleFollower())
         {
            outputText("[pg][say: 不——！亲爱的！]玛布尔哭喊道。");
         }
         get_game().set_inCombat(false);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2175,1);
         get_game().gameOver();
      }
      
      public function askDemonSheilaAboutHerColony() : void
      {
         clearOutput();
         outputText("[say: 那地方？你想去那儿吗？]希拉露出不怀好意的笑容，接着抬起你的下巴，在你来得及躲开前偷走了一个吻。[say: 带你去那群假正经的巢穴，我倒是没什么意见，不过……]她的眼神暗了下来。[say: 现在已经什么都不剩了。可惜你没早点坚持，他们本来还能见识一下什么叫了不起的[man]。]");
         outputText("[pg]她咯咯笑了起来。[say: 我得到新天赋后做的第一件事，当然就是回家，把它分享给我爱的人。那感觉太美妙了，[name]！当我们高潮、他们饮下我的一部分时，我所有的欲望和渴求都被抽走，只剩下满满的幸福，还有彻底合为一体的感觉。每当有人把我榨干，我又会重新满溢，再把自己倾注给另一个人。多亏你为我打开了那扇门，我才能以前所未有的方式向他们表达感情。]女孩把头靠在你身上，闭上眼睛。[say: 尤其是对队长。]");
         if(get_player().cor < 30)
         {
            outputText("[pg]惊恐之下");
         }
         else
         {
            outputText("[pg]尽管不愿承认，你还是来了兴趣");
         }
         outputText("，你问起他后来怎么样了。希拉平静地微笑着回答。[say: 不出所料，他那根鸡巴迫不及待地想把精子灌进我体内，毕竟他讲过无数次道，说扩大家族是每个女人的责任。我爬到他身上后，他连三分钟都没撑住。哦，那小小的一射，是最让我满足的一次。看着他在我身下融化，我才真正明白自己一直拥有多大的力量……真希望我还是个笨拙小女孩、坐在那里听他训斥忠诚和服从的时候，就能知道这一点。]");
         outputText("[pg]希拉抬手扯了扯自己的耳环。[say: 这是他的……我是说，灵命石。他把自己献给我的小穴、变成恶魔之后，凡性留下的残余。很小，对吧？我看到他的灵魂其实那么微不足道、那么贫乏时，差点笑出来。]");
         outputText("[pg]想到那天被");
         if(get_player().cor >= 75)
         {
            outputText("收割的灵魂数量，你怅然叹了口气");
         }
         else
         {
            outputText("偷走的灵魂数量，你皱起了脸");
         }
         outputText(". 希拉从刘海底下睁着一只眼偷看你，准确地读懂了你的表情。[say: 在想其他人去哪儿了，对吧，亲爱的？]她松开抓着你手臂的手，又伸出那只没有在你[armor]上摸索的手，展示出几枚戒指。[say: 这些戒指是我最亲近的人。我把它们留下来，是因为有纪念意义。至于其他的嘛……我把他们吃了。]");
         outputText("[pg]当你盯着她看时，她睁开双眼，挑衅地迎上你的目光。淡紫色的光芒在她冰冷的虹膜中跳跃，让你倾向于相信她的话。[say: 它们很美味，[name]。我吃下的每一个都让我觉得自己更强大、更大、更重要、更像一个性爱女神。等我到达殖民地的内部圣所时，我只要碰一下就能把人撞倒。当那些较弱的家伙在我的眼睛里看到我想对他们做什么时，他们的先列腺液都把裤子弄湿了。说到这个……]她更用力地看着你，你能感觉到一个幻想正在进入你的脑海，在这个幻想中");
         if(get_player().hasCock())
         {
            outputText("她把你绑起来，骑在你身上，直到她被你的精液灌得满满当当，甚至只要按一按自己的肚子就能把它挤出来");
         }
         else
         {
            outputText("她绑住你的双手，坐到你身上，用她渗着黏液、抽动不已的铲形尾尖挑逗你无力反抗的身体，直到她在你身上高潮得一塌糊涂，从那尾尖喷出深色黏滑的液体");
         }
         outputText("。你");
         if(get_player().cor < 50)
         {
            outputText("移开视线，脸红了起来");
         }
         else
         {
            outputText("凝视着她闪亮的双眼，随着那幻象一路演到最后，身体变得越来越燥热");
         }
         outputText("。");
         outputText("[pg][say: 喜欢我的点子吗，爱人？]她笑了起来。");
         dynStats(DynStat.Lust(get_player().lib / 3 + 5),DynStat.NoScale);
         menu();
         addButton(0,"别的问题",demonSheilaTalkAnotherQuestion);
         if(get_player().get_lust() >= 33)
         {
            addButton(1,"让她干",sheilaLetHerFuckYou);
         }
         addButton(2,"抵抗",demonSheilaResist);
      }
      
      public function askDemonSheilaAboutDahChange() : void
      {
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,765) >= 1)
         {
            outputText("希拉脸红得厉害。[say: 傻瓜，你当时就在那儿呀。]她看着你，回想起那场让她变成如今模样的交欢，瞳孔微微晃动。[say: 不过，我想你问的不是这个。]");
            outputText("[pg][say: 该怎么说呢？那感觉……像是某种重大时刻。我和你一起高潮的时候，所有烦恼都从我身上滑走了。]希拉把一只手探向胯间，开始挑逗自己");
            if(get_player().hasCock())
            {
               outputText("，而你也感觉到自己的一座丰碑正在竖立起来");
            }
            outputText("。[say: 我的小穴每一次收缩，也都把我的注意力压缩得更集中，直到我的脑子比你让我流出来的淫液还要清澈。我就在那儿，和你在一起时，明白了自己的使命。]");
            outputText("[pg]你听到这里挑了挑眉。希拉微笑着解释道：[say: 说来奇怪，但队长是对的。我人生的使命，真的就是做爱。当你和我在一起时，我忘掉了所有抱怨，忘掉了一辈子都压在我身上的那些无关紧要的唠叨。挖掘、担忧、躲藏……从来都不重要。什么都不重要。是你让我看清了这一点；拥有你，才是我在乎的事。]她向你抛来一个飞吻。[say: 所以……如果你愿意，我们可以来点真正的。]");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,765) <= -1)
         {
            outputText("希拉露出怀念的神情。[say: 嗯……我真希望那个人能是你。但你离开我之后，我把自己抠得太用力，叫声引来了一只小恶魔。不是豺狼人，不是萨特，甚至也不是那些一直浑身冒火、吓人的该死火蜥蜴，而是一只货真价实的小恶魔。就是个破破烂烂、遍体鳞伤的小东西，离死只差一步，却还想把他的老家伙塞进什么地方，灌满种子，好把血脉延续下去。]");
            outputText("[pg][say: 他眨眼间就进了我的身体里，拼命抽插，好像这就是唯一重要的事，好像如果不能射在我体内，他的命就一文不值。然后……]她羞怯地看着你，脸又红了。[say: 他是对的。性确实就是他唯一有用的地方，也是任何人唯一有用的地方。当他射出来，用那股滚烫的精液灌满我时，我心里有什么东西突然通了。我放下了一切：担忧、伪装，还有努力当个乖巧听话工人的念头。天啊，那次高潮！我把他榨得一滴不剩！而我躺在那里抽搐着、夹紧他那根小玩意儿的时候，我一直在哭，不停地哭，因为我终于明白，自己以前竟然在乎那些事，是多么错误。做爱才是最重要的，[name]。那才是真实的东西。连最低贱的小恶魔都明白这一点。我可以让你看看……]");
         }
         if(get_player().get_femininity() < 50)
         {
            outputText("[pg]女孩凑近过来，压低声音。[say: 你知道吗，男人射在我里面的时候，我最觉得陶醉。那感觉……纯粹又正确，就像他承认了自己人生的目的就是给我孩子。没有伪装，也没有废话。我喜欢那样，如果你射在我里面，我也会爱你。]希拉又红了脸。[say: 这听起来有点肉麻，不过……你想被爱吗？]");
         }
         dynStats(DynStat.Lust(12),DynStat.NoScale);
         menu();
         addButton(0,"别的问题",demonSheilaTalkAnotherQuestion);
         if(get_player().get_lust() >= 33)
         {
            addButton(1,"让她干",sheilaLetHerFuckYou);
         }
         addButton(2,"抵抗",demonSheilaResist);
      }
      
      public function apologySheilaSlapSult() : void
      {
         clearOutput();
         outputText("她收拾好套索并重新站起来时，你一言不发。");
         outputText("[pg][say: 怎么？]她问道，嘴唇抿成一条僵硬的线，直直看进你的眼睛。");
         outputText("[pg]她甚至还没来得及做出比一颤更多的反应，你就从身侧抬手抽过她的脸，一记响亮的耳光在干燥开阔的荒野上炸开。在她回过神开口之前，你一时冲动说出的几句关于排外和偏见的话已经脱口而出。");
         outputText("[pg][say: 去你妈的，混蛋！]她打断你，反击道。[say: 我可不会站在这儿，任由某个一冒出来就以为自己遇到的所有人都会被[his]魅力迷得神魂颠倒、把[he]当成故事书里的英雄" + get_player().mf("","") + "的蠢货来臭骂！你要是想找个一听你说“你好”就愿意当你灵魂伴侣的姑娘，就去那些地精贱货那儿捡别人玩剩下的吧！]");
         outputText("[pg]她举起拳头又朝你挥来，但这次没了出其不意的优势；你侧身贴进她的拳路里，让她的上臂无害地擦过你的脸侧，然后在她能踢你之前粗暴地把她推开。她踉跄着后退，差点摔倒。");
         outputText("[pg][say: 原来你要这样是吧！我不想再跟你讲道理了，你这蠢货！]这个怒火中烧的女人摆出战斗架势，你也同样应对。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,761,-3);
         startCombat(new Sheila());
      }
      
      public function apologySheilaSayNothing() : void
      {
         clearOutput();
         outputText("你决定暂时把想法藏在心里，防备地抱起双臂，皱起眉头。");
         outputText("[pg][say: 好吧，随你便，你个混账，]希拉说道，一边重新布置陷阱，一边从你身旁退开。[say: 走路的时候看着点。]");
         outputText("[pg]你哼了一声，看着她重新在高草里隐蔽起来，然后转身返回营地。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function apologySheilaApology() : void
      {
         clearOutput();
         outputText("你漫不经心地挠了挠耳后的[skinfurscales]，不知道该怎么开口谈和解——毕竟你觉得先挑事的是她——但还是含糊地说了些抱歉事情一开始就闹得不愉快之类的话。");
         outputText("[pg]希拉听到你的道歉，挑了挑眉。[say: 行吧，]她只是这么说道，没有追究你不愿明确说是谁的错。[say: 我想也不能怪你吃惊，毕竟在这片土地上，居然有人没在第一次见面时就立刻把你亲到喘不过气、然后像新婚伴侣一样跟你干上一整天。不过别把太多事都当成理所当然。要是随便相信陌生人，你可没法在恶魔手里保住自由。]");
         outputText("[pg]她露出一丝无力的笑，示意你离套索附近远点，然后重新布置好陷阱，回到高草丛的掩护里。你还没来得及再开口，她就朝你投来一个警告的眼神。[say: 我还得抓晚饭呢，所以现在别在我耳边废话。我可不需要你叽叽歪歪，把所有靠近的吃食都吓跑。]");
         outputText("[pg]好吧……看来你们又回到原点了。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,761,1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function apologyAvoidSheila() : void
      {
         clearOutput();
         outputText("你对这个满脸戒备的女孩摇了摇头，告诉她，如果你们再也见不到彼此，你会和她一样高兴。");
         outputText("[pg][say: 行吧……要是你愿意配合，我想我可以安排，]她说道，耳朵因恼火而抽动着。[say: 照顾好自己，伙计。]她重新布置好陷阱，又在高草丛里的老地方趴下，还刻意侧过身去，把后背留给你看。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1210,1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function analHateFucksWithJojoNo(param1:Boolean) : void
      {
         if(param1)
         {
            clearOutput();
         }
         else
         {
            outputText("[pg]");
         }
         outputText("[say: 不。]");
         outputText("[pg]希拉眼中的光黯淡下去，满是难过与不解，而你继续说道：[say: 很明显，就算别人把你的角色解释给你听，你也蠢到接受不了。乔乔，拔出来。]鼠人带着疑问看向你，但还是服从了，把沾满前液的肉棒从希拉屁股里抽出来，让它挺在她双腿之间。");
         outputText("[pg][say: 是、是的，[master]，]他喘着气说，[say: 我现在该怎么做？]");
         outputText("[pg][say: 你可以自己弄完，但把种子射到地上。一滴都不许碰到这个废物。]乔乔热切地点点头，用尾巴缠住自己的肉棒套弄起来；很快，他的鸡巴开始抽搐，卵蛋绷紧，精液喷洒到草地上。希拉呆呆地看着大量鼠人精液在她面前汇成一摊白浊，直到这位前僧侣射完，从她屁股底下滑出来。你抓住她一把赤褐色头发，狠狠拽得她生疼，在这个恶魔耳边嘶声道：[say: 要是你还有点用，我或许会准你受孕。可现在，你唯一勉强能派上用场的，就是替奴隶的鸡巴暂存一下，等它准备好射进真正的女人体内。]你用力一拧，引得她尖叫一声，接着猛地把她拽得失去平衡、向前摔倒，让她脸朝下栽进乔乔射出的那摊东西里。[say: 走吧，乔乔；我们离开。]");
         outputText("[pg]乔乔反应很快，立刻站到你身旁，和你一起从这个被践踏的恶魔身边退开。她撑起身子，浑身沾满污液；此刻你能在她眼中看到的唯一光芒，只剩下暗暗燃烧的怒火。满意于毁掉了她的乐趣，你转身离去。");
         dynStats(DynStat.Lust(get_player().lib / 3),DynStat.Cor(2));
         if(get_game().get_inCombat())
         {
            get_combat().cleanupAfterCombat();
         }
         else
         {
            doNext(get_camp().returnToCampUseOneHour);
         }
      }
      
      public function analHateFucksWithJojo() : void
      {
         var clear1:Boolean;
         var _g1:SheilaScene;
         var clear:Boolean;
         var _g:SheilaScene;
         clearOutput();
         outputText("看着她若无其事地坐在那里玩弄自己，好像你刚才并没有当众暴露出她的弱点一样，这触动了你内心深处的一根神经。你皱起眉，集中意念召唤那位鼠人前僧侣，决心让这个恶魔看看一个合格的托钵僧该如何行事。");
         outputText("[pg]你的仆从最终越过草原，朝着你召唤的信标一路狂奔而来，扑倒在你面前。他气喘吁吁地趴了好一会儿，才终于能开口。[say: 是，[master]；我该如何取悦您？]");
         outputText("[pg][say: 奴隶，今天你要示范如何</i>正确地<i>服从已经证明比你优越的人。你的谦卑与忠诚，会给你那个失职的搭档上一堂活生生的课。]你微微转过头，用刀子般的目光盯着希拉；她狡黠地笑着，眼中闪烁着对这一展开的兴趣。哦，她还不了解你……但她会懂的。[say: 坐到她身后去，乔乔。]");
         outputText("[pg]你的小老鼠顺从地在希拉身后的草地上坐下，然后往前挪，直到他跳动的肉棒抵住她的下背。前列腺液沿着她的脊背抹开，恶魔因期待而颤抖；你能看见她的尾巴正缠绕着这名僧侣的肉棒。她试图把他的鸡巴榨干时，他的脸皱了起来，但仍然确认自己是否按命令做了。[say: 主、[master]，这样……可以吗？]");
         outputText("[pg][say: 是的，很好。现在，把手放到她屁股上，把她托起来，对准你的肉棒。]");
         outputText("[pg]乔乔照做了，她的尾巴松开他的肉棒时，他松了口气；那女人向前倾身，迎合般把小穴对准他，又用他的一只手引着他对准自己的胯间。你弯下腰凑到希拉面前，一只手捏住她的下巴。[say: 现在，向你的[master]祈求吧。]");
         outputText("[pg][say: 哈哈……]希拉把表情收拾成一副假正经的样子，念道：[say: 求求您，[master]，能让您的手下把精液射进我的小穴里，好给您生个孩子吗？]一想到这事，她的眼睛几乎亮了起来；显然，她只把这当成一场游戏。");
         outputText("[pg][say: 不，这可不行，]你作出决定，从下方捏住她的脸，直到她的脸颊鼓起来。[say: 好奴隶在提出请求时，该表现出应有的谦卑。乔乔，你改去操这个傲慢女孩的屁眼。]她瞪大了眼睛，你把另一只手按在她肩上往下压，让鼠人的肉棒刺进她的肛门。她在你的钳制下挣扎，挣脱你的手想要站起来；你反手一巴掌抽在她脸上。");
         get_images().showImage("sheila-corrupted-jojo");
         outputText("[pg][say: 你真丢人！]你吼道。突如其来的暴力让希拉愣住了，一动不动；乔乔趁机开始用肉棒在她的屁眼里抽动。你抓住她一只长耳朵用力拧着，开始训斥这个恶魔。[say: 看看你自己；你到底有哪点像样？你把头上这团脏拖把也叫头发？你上次洗澡是什么时候？你甚至一点都不可爱；我随便往哪儿扔块石头，都能砸出一张跟你差不多的脸！]你松开她的耳朵，冷酷地捏住她的乳房。");
         if(sheilaCorruption() < 40)
         {
            outputText("[say: 这两颗小奶子是怎么回事？会有男人对你这点蚊子包起反应吗？我在梦魔身上都见过比这更大的胸！]");
         }
         else
         {
            outputText("[say: 你胸口上这两袋恶心的肥肉……你该不会以为男人喜欢巨大的妊娠纹，还有垂到膝盖的奶头吧？你怎么不去好好练练身材，你这邋遢婊子？]");
         }
         outputText("[pg]你拉扯她的乳头又猛地松开，让希拉疼得皱起脸；随后你直起身，用一只[foot]粗暴地蹭进她的小穴。[say: 你以为凭这种胯也能生出像样的孩子……真是笑死人了！它们也就比你的腰宽一点点；我往营养不良的地精肚子里都能弄出更大的宝宝！更别说我可能还真得那么做；看看你那小得可怜的小穴，小姑娘！传送门这边根本没有哪根鸡巴能塞得进去。这里甚至连毛都没有！你知道这会让你看起来像个小孩吧？我都觉得我该给你擦干净、换上新尿布，而不是操你！]");
         outputText("[pg]在你痛骂她的时候，希拉的脸颊越来越红，而乔乔的动作也让她颤抖得愈发厉害。你说完后，又一巴掌抽在她脸上，留下的白色掌印只停留了短短一瞬，随后血色便涌了回来。她避开视线，眼里噙着泪，喃喃道：[say: 对、对不起，哥们儿……]");
         outputText("[pg][say: “对不起”可形容不了你这种东西。你不如再问一次，别再假装自己不只是个垃圾桶，也别装得好像用哪个洞给鸡巴取暖有什么区别似的。]");
         outputText("[pg]她低头看着地面，消化着这最后一句话，脸上满是倔强的怨恨。最后她开口道：[say: 求求您……[Master]，][say: 能让您的奴隶改射在我这不配的小穴里吗？]显然，她仍在抗拒这场教训。");
         if(get_player().cor >= 80)
         {
            menu();
            _g = this;
            clear = true;
            addButton(0,"继续",function():void
            {
               _g.analHateFucksWithJojoNo(clear);
            });
            outputText("[pg]<b>你确实可以彻底毁掉他们，但之后你大概再也见不到乔乔了。</b>");
            _g1 = this;
            clear1 = true;
            addButton(1,"毁掉他们",function():void
            {
               _g1.jojoRuinsTheAnalHateFuck(clear1);
            });
         }
         else
         {
            analHateFucksWithJojoNo(false);
         }
      }
      
      public function analHateFuck() : void
      {
         clearOutput();
         outputText("该死的贱人，像什么都没发生一样玩弄自己，明明你刚刚才用铁一般的事实证明了自己的优越。有一部分的你想亲自惩罚这个不知天高地厚的女人，狠狠贯穿她的体内，把精液灌进去，完全不顾她会不会爽……但另一部分的你又觉得，看着她被彻底贬低也许会很有趣，把她的可悲彻底钉死——比如把她变成你专属泄精奴的肉棒套子。");
         menu();
         addButton(0,"肏烂她",sheilaAnalHateFuckAGoGo);
         if(get_jojoScene().campCorruptJojo())
         {
            addButton(1,"叫乔乔",analHateFucksWithJojo);
         }
      }
      
      public function aintGotNoGenderAndKangarooRaped() : void
      {
         clearOutput();
         outputText("希拉摇曳着走到你身边，毫不遮掩地把手伸进你那片光滑无物的胯间。[say: 真可惜你把自己弄成了这样，亲爱的……还是说你是故意这么做来逗我的？你知道吗，我其实没那么介意。]");
         outputText("[pg]你困惑地看着她。");
         outputText("[pg][say: 嗯，]她继续说道，[say: 你和我现在没法生孩子，这确实有点烦人，不过要解决也很简单，对吧？等我们搬到一起住，我只要往你的饭里偷偷加一小口药水，然后……惊喜！你又会有一根最可爱的小家伙了。立刻变老公。]");
         outputText("[pg][say: 还是说，你更想当那个小娘们儿？不过我可能会是个有点占有欲的汉子；让你在家里一直怀着孕，这样你就没法从我身边逃走了。]你摇头抗议她这自作主张的想法，可这似乎并没有打断她的白日梦。希拉把手放在你的额头上，望进你的眼睛。");
         outputText("[pg][say: 哈，]她说道，虹膜泛起薰衣草色的光芒，[say: 你不用现在就决定。慢慢想吧；你甚至可以两边都当。]她注视着你，一段古怪的幻想涌入你的脑海：希拉把你的阴茎塞进你自己的阴道里，又一瓶接一瓶地往你体内灌药，每当一剂药水把你推向高潮，她就强迫你射在自己体内。她传来的幻象带着施虐的意味，说明她并不像表面装出来的那样，对现在不能玩弄你这件事毫不在意。你能感觉到身体逐渐发热，一根又一根由药物催生出的阴茎从你身上冒出来，又被囚禁你的恶魔塞进你的小穴。突然，那恶魔眨了眨眼，幻想戛然而止；你沉浸在她的白日梦里时，她已经把你放到了地上。她在你唇上落下一个纯洁的吻，然后退开。");
         outputText("[pg][say: 回头见，[name]……记得想我。]她残留的魔力保证了她的要求会得到满足，你随即陷入短暂而疲惫的浅眠。");
         dynStats(DynStat.Lust(20 + get_player().lib / 4),DynStat.NoScale);
         if(get_game().get_inCombat())
         {
            get_combat().cleanupAfterCombat();
         }
         else
         {
            doNext(get_camp().returnToCampUseOneHour);
         }
      }
   }
}

