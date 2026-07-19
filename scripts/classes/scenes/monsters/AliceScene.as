package classes.scenes.monsters
{
   import classes.BaseContent;
   import classes.CoC;
   import classes.Cock;
   import classes.CockTypesEnum;
   import classes.DebugMenu;
   import classes.DynStat;
   import classes.ItemType;
   import classes.Monster;
   import classes.PerkLib;
   import classes.Player;
   import classes.SelfDebug;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.display.SpriteDb;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.internals.WeightedChoice;
   import classes.internals._OneOf.OneOf_Impl_;
   import classes.items.Armor;
   import classes.items.ArmorLib;
   import classes.items.ConsumableLib;
   import classes.items.UseableLib;
   import classes.items.Weapon;
   import classes.items.WeaponLib;
   import classes.parser._Parser.TagFun_Impl_;
   import classes.saves.SelfSaver;
   import classes.saves.SelfSaving;
   import classes.scenes.Camp;
   import classes.scenes.Inventory;
   import classes.scenes.api.Encounter;
   import classes.scenes.combat.Combat;
   import classes.scenes.monsters._AliceScene.SaveContent;
   import coc.view.CoCButton;
   import flash.Boot;
   import haxe.IMap;
   import haxe.ds.Either;
   import haxe.ds.StringMap;
   
   public class AliceScene extends BaseContent implements SelfDebug, SelfSaving, Encounter
   {
      
      public var stealthArouse:Array;
      
      public var saveVersion:int;
      
      public var saveName:String;
      
      public var saveContent:SaveContent;
      
      public var pantiesLong:String;
      
      public var panties:String;
      
      public var lewd:Boolean;
      
      public var globalSave:Boolean;
      
      public var eyeColor:String;
      
      public var canArouse:Boolean;
      
      public var _currentAlice:Alice;
      
      public function AliceScene()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         lewd = false;
         globalSave = false;
         saveVersion = 1;
         saveName = "alice";
         saveContent = new SaveContent(null,null,null,null,null,null,null,null);
         canArouse = false;
         stealthArouse = ["Arouse"];
         pantiesLong = "pristinely white";
         panties = "white";
         eyeColor = "hazel";
         super();
         SelfSaver.register(this);
         DebugMenu.register(this);
      }
      
      public function trystOrTreatIntro() : void
      {
         var _loc1_:Boolean = chooseTreat() != null;
         saveContent.trystOrTreatedYear = int(get_date().getFullYear());
         clearOutput();
         outputText("尽管夜晚的空气很清冷，你[if (hasGills) {的鳃还是乞求你}]离开营地，[walk]到附近的小溪边喝点水提神。这水喝得很舒服，你深吸了一口气，然后转身回去——却听到不远处传来咯咯的笑声。你保持警惕，没有表现得太明显，继续注意着声音的来源，并向其靠近。");
         outputText("[pg]一对年轻的恶魔从黑暗中冲了出来，挡住了你回营地的路，并大喊：[say:不给幽会就捣蛋！]");
         outputText("[pg]仔细一看，他们似乎是一个魅魔和一个男魅魔，不过穿着很不寻常。长着紫色角的[if (allowChild) {小|十几岁的}]女孩穿着一件华丽的斗篷，领子夸张地向外翻着，戴着明显的假牙，化着苍白的妆。与此同时，长着红色角的[if (allowChild) {小|十几岁的}]男孩戴着一对狼耳，还有一条毛茸茸的尾巴。");
         outputText("[pg]男魅魔打开一个袋子，重申道：[say:不给幽会就捣蛋！]看到你显然对这句话不熟悉，他继续说道：[say:你应该把糖果放进袋子里！]");
         outputText("[pg]抢劫？还是勒索？你不太清楚两者的区别。但你觉得[if (allowChild || isElder) {这些孩子|他们}]应该有更好的伪装；女孩的斗篷至少部分遮住了她的翅膀，但男孩甚至没有隐藏他的翅膀，而且两人都没有隐藏他们的角。你保持防御姿态，询问这对抢劫犯，如果你给他们想要的东西，他们是否会放过你。");
         outputText("[pg]女孩抱怨道：[say:我们不是抢劫犯！我是可怕的吸血鬼！]她展开斗篷，露出她的“尖牙”，然后戏剧性地指着男孩。[say:那是狼人！]");
         outputText("[pg][say:但我是一个恶——]");
         outputText("[pg][say:嘘！总之，你应该给我们糖果。]然后她向前倾身，眨了眨眼睛。[say:或者幽会。]她身后那条铲状的尾巴下意识地摇晃着，充满期待。");
         menu();
         addNextButton("幽会",totTryst).hint("很明显他们真正想要的是什么。");
         addNextButton("糖果",totTreat).hint("把糖果放进袋子里。").disableIf(!_loc1_,"你没有糖果给他们！");
         addNextButton("战斗！",totFight).hint("恶魔！攻击！");
      }
      
      public function totTryst() : void
      {
         clearOutput();
         dynStats(DynStat.Cor(1));
         outputText("你回头看了看营地，又环顾了一下四周，觉得不如就给这些恶魔他们想要的东西，告诉他们可以得到他们的幽会。女孩已经兴奋得叫出声来了[if (!isnaked) {，你开始脱下你的[armor]，这让她无比高兴}]。");
         outputText("[pg]男魅魔——“狼人”——困惑地慢慢放下袋子。[say:等等，那是什么意思？]他看向魅魔，魅魔只是对他翻了个白眼。[say:我们不是来要糖果的吗？]");
         outputText("[pg]你自己也觉得有些好笑，你明确表示你完全知道他是个男魅魔，并半开玩笑地拉了拉他的角。带角的发箍从他头上滑落。你和他的同伴都愣了一下，然后你抓住女孩的角，换来了一声痛苦的呻吟，因为那坚硬的装饰物牢牢地扎根在她的头骨上。恶魔女孩和狼男孩面面相觑，得出了同样的结论。");
         outputText("[pg][say:你不是恶魔！？]");
         outputText("[pg-][say:你是恶魔！？]");
         outputText("[pg][if (allowChild && knowsAlices) {爱丽丝|魅魔}]挣脱你的手，抓住男孩的衬衫。[say:我本来可以直接操[b:你]的，而不是搞这些无聊的换装游戏！]在她气得血管爆裂之前，她叹了口气。");
         outputText("[pg]狼男孩脸红了，结结巴巴地说。[say:你会那样做吗？我、我不知道你喜欢我……]女孩烦躁地眯起了眼睛。");
         outputText("[pg]她推开他，朝你的方向指了指，说道：[say:现在不了，我现在有更好的选择了！]");
         menu();
         addNextButton("操她",totChooseLoli).hint("好吧，她没说错。").disableIf(get_player().isGenderless() || !get_player().hasCock() && get_player().isTaur(),"恰恰相反！[if (isgenderless) {下面什么都没有|你需要一根阴茎或者不同的腿部结构才能做到}]。");
         addNextButton("操他",totShotaFuck).hint("[if (silly) {显然最有趣的事情就是给[if (allowChild && knowsAlices) {爱丽丝|魅魔}]戴绿帽|她太傲慢了，那个男孩值得更好的}]。").sexButton(1,false);
         addNextButton("骑他",totShotaRide).hint("[if (silly) {显然最有趣的事情就是给[if (allowChild && knowsAlices) {爱丽丝|魅魔}]戴绿帽|她太傲慢了，那个男孩值得更好的}]。").disableIf(get_player().hasTailInsteadOfLegs() && !get_player().hasVagina(),"这个场景需要腿或者阴道。");
         addNextButton("离开",totLeave).hint("他们现在有彼此了，不需要你了。");
      }
      
      public function totTreat() : void
      {
         var _loc2_:* = null as String;
         var _loc3_:Boolean = false;
         clearOutput();
         dynStats(DynStat.Cor(-3));
         var _loc1_:ItemType = chooseTreat();
         if(_loc1_ == get_consumables().LOLIPOP == true)
         {
            _loc2_ = "一根棒棒糖";
         }
         else
         {
            _loc3_ = _loc1_ == get_consumables().NUMBROX;
            _loc2_ = _loc3_ == true ? (get_silly() ? "一些跳跳糖" : "一些麻木岩") : "糖果";
         }
         outputText("你不想惹麻烦，所以你顺从了恶魔们，迅速翻找着拿了些糖果。男孩已经兴奋得叫出声来，你把" + _loc2_ + "扔进袋子里，让他无比高兴。");
         outputText("[pg]愣住的[if (allowChild && knowsAlices) {爱丽丝|魅魔}]——“吸血鬼”——完全没有阻止你回营地的意思。[say:可、可是怎么会？这附近到底哪儿能[b:弄到]糖果啊！？]她慌张地四下张望。[say:他们明明说大家都会选幽会的！这也太——]她踉跄了一下，看起来彻底垮了。[say:这简直是灾难节。]");
         outputText("[pg][say:是万圣节，]男魅魔纠正道。女孩狠狠一拳打在他肋侧，疼得他呜咽起来。尽管如此，两人还是一瘸一拐地消失在夜色中，留下你安然无事。");
         get_player().destroyItems(_loc1_);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function totShotaRide() : void
      {
         var _loc1_:Boolean = get_player().isDrider() && !get_player().hasVagina();
         registerTag("pussylessdrider",TagFun_Impl_.fromBool(_loc1_));
         clearOutput();
         totShotaIntro();
         outputText("[pg]狼男孩并没有注意到这些，他的目光紧紧锁定在你赤裸的身体上。他的双手按压着你的[if (hasBreasts || isFeminine) {[breasts]，仿佛要将这种感觉深深烙印在记忆中|胸膛，并顺着你[if (isthinbuild) {肋骨的轮廓|[if (ischubbybuild) {柔软的}]躯干曲线}]向下滑动}]。[if (hasBreasts || isFeminine) {你剥夺了他抚摸你柔软胸部的机会，|你}]将脸凑到他双腿之间，舔舐着他阴茎的顶端。狼男孩颤抖着，将他[if (allowChild && !isChild) {小小的}]手指[if (hasHair) {穿过你的头发|抚过你的头皮}]，当你含住他的龟头时，他轻轻地喘息了一声。你的舌头在龟头周围打转，开始品尝到先列腺液的味道，这促使你慢慢退开，向那个恶魔偷窥狂展示那条细细的粘稠液体。");
         outputText("[pg][say:那是我的，]她呜咽道，但手上的动作更快了，把内裤拨到一边，好更方便地触碰自己。[say:把他还给我……]");
         outputText("[pg]你当然看得出，她刚才可是很乐意为了你把他丢到一边。突然，狼根强行闯入口中，害你一阵作呕，肉结撞上你的嘴唇。他已经欲火焚身，根本没耐心慢慢来。你用力吮吸着他的肉棒，品味那淡淡的咸味，随后彻底退开。这场幽会可不能止步于口交。你[if (isTaur || pussylessDrider) {转过身|重新调整姿势坐下}]时，那[if (allowChild) {小狗|狼}]立刻来了劲；一看到你的[if (pussylessDrider) {吐丝器|[vagorass]}]，你甚至还没完全摆好姿势，他就手忙脚乱地扑上来骑住你，[if (isTaur || pussylessDrider) {抱住你的[if (isTaur) {腰胯|腹部}]|把你的后背[if (isDrider) {顶在你鼓胀的蜘蛛腹部上|压向泥地}]}]。");
         outputText("[pg]一个发情的狼男孩[if (isTaur || pussylessDrider) {扑在你的[if (isDrider) {吐丝器|[ass]}]上|[if (tailLeg) {缠着你的尾巴|挤在你的双腿之间}]}]，你选择了最简单的做法：[if (pussylessDrider) {放松你的吐丝器，迎接那根尖尖的狗鸡巴顶撞着寻找入口|把[if (tailLeg) {你的泄殖腔}]张得更开，迎接那根尖尖的狗鸡巴顶着你的[if (hasVagina) {[if (tailLeg) {裂口|阴唇}]|[asshole]}]}]。当他终于将那根形状奇特的肉棒推进你体内时，他的腰胯先是一顿，随后又稳了下来，最初的震颤渐渐化作有节奏的抽送。你情不自禁的呻吟，换来恶魔女孩阴郁的闷闷不乐；她用力把手指插进自己深处，模仿着那只犬类疯狂操弄你的动作。");
         if(get_player().hasVagina())
         {
            get_player().cuntChange(5,true);
         }
         else
         {
            get_player().buttChange(5,true,false);
         }
         outputText("最初的疼痛很快就转化为了快感。随着他的每一次抽插，他的尾巴都在狂野地甩动着[if (isBiped) {，拂过你的膝盖|，沉浸在极度的狂喜中}]。你[if (isTaur || pussylessDrider) {在地上张开双腿，在快感中呼气，不断地鼓励他|用[hands]捧住他[if (allowChild && !isChild) {小小的}]脸庞，用鼓励的话语刺激他，这只会让他更加融化}]。");
         outputText("[pg]他的肉结刚开始进一步胀大，鼓起的部分就猛地挤了进来，把你入口处的褶皱撑得更开，你不由得浑身一颤。虽然已经卡在里面，他却没有慢下来，只是满足地继续用浅浅的抽插干你，口中发出急切的呻吟。除了这个发情的[if (allowChild) {孩子|少年}]满是欲望的喘息，再没有别的声音响起；你的[if (hasVagina) {小穴|[if (isDrider) {吐丝器|肛门}]}]在入口浅处被折腾得阵阵抽痛，可你还是忍不住沉溺其中。在高潮爆发般的冲刺中，狼男孩咬住你的[if (isTaur || pussylessDrider) {后躯|肩膀}]，一边流着口水，一边凶猛地连续顶弄，每一下都把滚烫的精液[if (hasVagina) {喷在你的子宫颈上|射进你的深处}]。你和他一同迎来高潮，最后任由他小狗般的精种在你体内汇聚。");
         outputText("[pg]那个[if (allowChild && knowsAlices) {爱丽丝|魅魔}]在泪水中哽咽了。[say:下、下一个是我，]她乞求道。她双腿之间的地面已经湿透了，即使在夜空下，你也能看到那块深色的污迹。你那长着肉结的情人对着你的[if (isTaur || pussylessDrider) {背部|胸膛}]喘着粗气，呻吟着，他太累了，也太敏感了，今晚无法再做爱了。女恶魔再次抽泣起来。[say:这太折磨人了。]");
         outputText("[pg][say:万圣节，]男孩疲惫地纠正道。");
         get_player().orgasm("VaginalAnal");
         get_player().slimeFeed();
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function totShotaIntro() : void
      {
         outputText("你无视了那个傲慢的荡妇，把狼男孩拉向你，并向他传达了一个明确的信息：你喜欢他“那样”。他脸上的红晕现在蔓延得更加厉害了，而那个恶魔则跺着脚，半喘着气，试图表达自己的不满。");
         outputText("[pg][say:不是那样的！]她徒劳地惊呼道。她冲上前来，试图插在你们俩中间，但你把她推开了，她一屁股摔在地上。甚至当你把手伸进狼男孩单薄的服装里时，魅魔还在继续试图抗议。[say:你不应该那样做……]");
         outputText("[pg]她的同伴似乎曾经喜欢过她，但他并没有那么快忘记她无视他时的那种急躁，所以当你的手指滑过他的腰带，抚摸他正在变硬的阴茎时，他转过身来，热情地吻了你。他的舌头盲目而急切地进入你的嘴里，你轻轻吸吮着它，以激起他的性欲。那双迷离的眼睛充满渴望地看着你。他凌乱的棕色头发里飘出一股淡淡的松树和青草的香味，让人不禁有些好奇这对搭档是怎么走到一起的。你没有被这些想法吓倒，只需要看到他摇晃的尾巴，就足以邀请你对这个[if (allowChild) {[if (isChild) {孩子|小男孩}]|发情的青少年}]为所欲为了。");
         outputText("[pg][if (allowChild && knowsAlices) {爱丽丝|魅魔}]闷闷不乐地看着你和她前任伴侣一起倒在溪边。她羞愧地张开双腿，把一只手伸进大腿之间，隔着内裤揉搓着自己的小穴。一个被贬为旁观者的欲望恶魔，其欲望也不会减少分毫。");
      }
      
      public function totShotaFuck() : void
      {
         clearOutput();
         totShotaIntro();
         outputText("[pg]狼男孩没有注意到，当你把他推倒仰面躺下，并把你的[hand]滑过去托住他柔软的[if (allowChild) {小}]屁股时，他太投入了。偷窥的眼睛如此绝望地盯着你的[cocks]，以至于你都能感觉到，但当你[if (isTaur) {把前腿跨过他的肩膀，}]戳刺男孩[if ((allowChild && !ischild) || isElder) {年轻的}]肛门时，她所能做的只有旁观。他在你的触碰下颤抖着，抓住你的[if (isTaur) {[feet]|手臂}]来稳住自己。深吸一口气。狼紧紧地拥抱着你，摇晃着尾巴。被他的女孩抛弃后，他尽其所能地放松下来，当你的[cockhead]突破他时，他发出了一声尖叫。你慢慢地沉入这个[if (allowChild) {孩子|青少年}]柔软、火热的体内，在他发出的每一声呜咽中接收到一阵快感的脉动。");
         outputText("[pg][say:那本来应该是我，]恶魔女抱怨着，但手淫的速度更快了，把内裤拉到一边以便更好地接触。[say:我才应该是那个被操的人……]");
         outputText("[pg]她体内的欲望像篝火一样在[if (metric) {仅仅一米|几英尺}]外燃烧，随着她的同伴发出的高亢呻吟而加剧，他扭动着身体以适应你的[cock]。他的双腿开始减弱对你臀部的挤压，你低头看着身下的他。[say:继续，]他恳求道。这还用他说。你在男孩体内抽插着，他勃起的[if (allowChild) {小狗|狗}]阴茎拍打着他的肚子，同时渗出前列腺液。[if (multicock) {你的另一根阴茎[if (cocks>2) {们滑进|滑进}]他旁边，与他润滑的前列腺液摩擦着。}]他的[if (nofur) {皮肤|皮毛}]在你的[if (isTaur) {腿|手}]上感觉很柔软——与你猛烈撞击他肠道时那种坚硬的触感形成鲜明对比。[say:啊！]他尖叫着，但他毛茸茸的尾巴却在用力地摇摆着。");
         outputText("[pg]哭喊声从[if (allowChild && knowsAlices) {爱丽丝|魅魔}]口中传出。她用与你操狼相同的节奏和力度，将手指强行插入自己的小穴。[say:停——停下。别再无视我了。]再多的乞求也无法阻止你操这只可爱的狗狗。[say:我什么都愿意做，求求你，操我吧！]");
         outputText("[pg]仿佛是为了巩固他作为你伴侣的地位，狼男孩向上摇动臀部来迎接你的抽插，并发出了一声尖叫。你压上更多的重量，猛烈地抽插着。你[if (hasBalls) {蛋蛋|肠胃}]里的紧张感警告着你的极限——或者邀请你完成。[if (hasKnot) {你的臀部又一次沉重的摆动，你的肉结穿过了他的括约肌，在另一声响亮的尖叫中把你们俩锁在了一起。}]浅浅的、快速的、无情的抽插，然后突然一口咬下！你皱着眉头，看到男孩咬住你的[if (isTaur) {腿|手臂}]来压抑自己，他在高潮时向你发出滚烫湿润的呻吟。你加入了他，开始将你的种子深深地洒下，发现释放感如潮水般向你袭来。");
         outputText("[pg][if (allowChild && knowsAlices) {爱丽丝|魅魔}]在泪水中哽咽着。[say:下——下一个是我，]她乞求道。她双腿之间的地面已经湿透了，即使在夜空下，你也能看到那块深色的污迹。你[if (hasKnot) {结了肉结的}]爱人趴在你的胸前喘着粗气，呻吟着，今晚已经太累太敏感了，无法再做爱了，而你和他一样满足。恶魔女再次抽泣起来。[say:这太可怕了。]");
         outputText("[pg][say:万圣节，]男孩疲惫地纠正道。");
         get_player().orgasm("Dick");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function totLeave() : void
      {
         clearOutput();
         outputText("既然她显然没你在场也能得到自己想要的东西，你决定返回营地。魅魔沮丧地看着你。[say:等等，别走，]她恳求道。你继续[walking]，她终于放弃了。[say:好吧，过来，小狗，你今晚得好好补偿我白费的力气。]");
         outputText("[pg]片刻之后，你回到了舒适的营地。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function totFight() : void
      {
         clearOutput();
         if(get_player().hasPerk(PerkLib.HistoryDEUSVULT))
         {
            dynStats(DynStat.Cor(-1));
         }
         outputText("你反应飞快，趁男魅魔举着袋子的时候一拳狠狠挥去，正中他的脑袋，把他打倒在地。魅魔吓得尖叫一声，转身逃进了黑暗！很好，现在你只需要担心一个对手了。你抓紧时间，趁他还没缓过来，准备好你的[weapon]，迎接战斗。");
         outputText("[pg]男孩倒在地上啜泣着，抱住脑袋侧过身去，扯坏了自己的假翅膀，毛茸茸的尾巴也夹到了两腿之间。他揉着头上的淤青，顺手把头上的角形发箍也蹭掉了。");
         outputText("[pg]你脑子一转，立刻跑回营地！");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function totChooseLoli() : void
      {
         clearOutput();
         dynStats(DynStat.Cor(3));
         outputText("狼男孩慌乱地看着[if (allowChild && knowsAlices) {爱丽丝|魅魔}]，她站在那里，斗篷半开，神情中夹杂着骄傲和不耐烦。果然，你正在给她她想要的——她的朋友不是男魅魔，他不参与进来也能活下去。");
         outputText("[pg][say:你正是我的菜，]她发出呼噜声，甩动着尾巴。在她身后，狼男孩紧张地挪动着，用不确定的眼神看着你们俩。他试图说话，但当你们和恶魔女拉近距离时，他只发出了低声的嘟囔。");
         outputText("[pg]在你碰到她之前，她兴奋地[i:跳]了起来，给了你一个热烈的吻，把你扑倒在地。世界倾斜了片刻。这个急切、饥渴的魅魔散发着自信，跨坐在你的[if (ischubbybuild || ispregnant) {肚子|[if (isfitbuild) {腹肌|胃部}]}]上。她的手去解紧身胸衣，但她停了下来，把腿向前摆，然后抬起膝盖，向你露出她柔软的、穿着内裤的屁股。");
         outputText("[pg][say:我不想浪费任何时间，快把这些脱掉，然后操我，[boy]，]她开心地说道。");
         outputText("[pg]这个姿势可能有点尴尬，但你顺势抓住腰带，把黑色的布料从她[if (allowChild) {纤细的|多汁的}]大腿上拉过膝盖，饱览她闪闪发光的[if (allowChild && silly) {小穴|阴唇}]。她把内裤垂到脚踝，小心翼翼地滑出一只脚，然后，内裤挂在另一只脚上，她转了一圈，把它踢向她的同伴。");
         outputText("[pg]狼男孩本能地伸手接住被丢弃的衣物，看着它，脸红得更厉害了。他的尾巴垂了下来，紧张地低着头坐着，但还是怯生生地抬起头，看着你们俩继续。");
         if(get_player().hasCock())
         {
            outputText("[pg][say:哈，看看那个可爱的小——啊——]当你站起来，把她扔到地上时，她大叫起来。你正在给她她想要的，没有浪费任何时间。[say:嘿！]她说道[if (isTaur) {，当你的[feet]重重地踩在她身旁的泥土上时，}]然后你的[cock]拍打在她湿润的小穴上。这平息了她的抗议。");
            outputText("[pg]魅魔的双手紧紧握住你的龟头，感受着它的形状和弹性。那个狼人男孩也模仿着她的动作，用同样的方式抚摸着自己那带有肉结的[if (allowChild) {小}]鸡巴。你那发情的“幽会捣蛋鬼”张开双腿，为你对准了龟头，她已经迫不及待了，你顺势前倾，开始对着那湿滑的阴阜施加压力。欲望如实质般在空气中弥漫，你[if (isTaur) {后腿向前发力|抓住这个[if (allowChild) {小}]恶魔的臀部，隔着衣服抚摸她[if (allowChild) {纤细|丰满}]的身躯}]，然后猛地挺进，将你的阴茎挤入那滚烫、紧得不可思议的肉穴中。她的翅膀在身后抽动张开，在狂喜中扭动着身体，终于沉浸在她一直渴望的快感之中。");
            outputText("[pg][say:哦操，就是这个，这才是真正的鸡巴，]她呻吟道。狼人男孩呜咽着，吸引了你的目光，让你看到了他自慰的模样，那条沾着污渍的内裤正在他的鸡巴上摩擦着。");
            outputText("[pg]这个堕落荡妇发出的每一声娇喘都比上一声更加高亢，让空气中都充满了她的极乐——这股气息将你拉入其中，驱使你不断挺动，[if (cockLength < 5) {用你的小鸡巴|直到你顶到底部撞上她的子宫颈}]狠狠地操着这个欲望怪物。在亲吻和轻咬的间隙，她的双手紧紧抓着你，指甲陷入你的肉里，[if (cockThickness > 1.5) {因为被撑开而猛烈地抓挠|无声地要求你操得更狠}]。恍惚间，你甩了甩脸上的燥热，加快了速度。");
            outputText("[pg]狼男孩像只——像只狗一样——喘着粗气，同时更用力地手淫。虽然肯定沾上了一些淫液，但那条内裤真的有那么好吗？他满脸通红，夹杂着嫉妒和敬畏，被女孩抛弃的挫败感已经消退了。");
            outputText("[pg]这个[if (allowChild && knowsAlices) {爱丽丝|魅魔}]再次注意到了他。[say:谢谢你来陪我“幽会捣蛋”，]她得意地咯咯笑着，声音轻快。当你再次猛烈撞击时，她倒吸了一口凉气，随后你从那紧如台钳的肉穴中拔出，[if (isTaur) {用[foot]碰了碰她的肩膀，示意她转过身来。和一个位置这么低的穴做爱让你感到酸痛|抓住她的肩膀把她转过来}]。她跪在地上，向你摇晃着屁股。[say:来吧，[boy]！来这里，[boy]！]她戏谑道。[say:用“后入”式！]");
            outputText("[pg]她的嘲弄丝毫没有让你慢下来；你像拼了命一样骑上她！断断续续的呻吟在你们之间回荡。她娇柔又柔软，[if (isTaur) {贴着你的下腹，当你盲目地摇摆臀部时，她简直像个梦|在你的怀里，你紧紧抱住她，亲吻她的脖子，轻咬她的耳朵}]，让你完全着迷。在你的狂热中，那条湿滑的小通道肯定会被弄伤，但她却尖叫着，[say:还要！] 并向后撅起她[if (allowChild) {年轻的|柔软的}]屁股来迎接你的撞击。你的脑海中一片混沌，视线完全集中在这个性爱恶魔的小穴上。肌肉紧绷。下体颤抖。");
            outputText("[pg]你大口喘着气，[if (isTaur) {用大腿紧紧夹住她|紧紧抱住她}]，释放出失控的狂风暴雨，用敏感的肉棒抽插并射精。每一股[if (multicock) {你的[cocktype]|精液}]都消失在她的子宫里，就像一个不断吸吮的黑洞[if (multicock) {，而你多余的肉棒则在她的屁股和背上疯狂地[if (cocks>2) {喷射|喷射}]}]。片刻之间就被榨干，你感到视线边缘闪过一道白光，但仍继续挺动，渗出并喷射出一股股浓精。最后，你大汗淋漓地倒下。声音、气味和景象很快恢复，只见魅魔的脸被按在了泥土里。");
            outputText("[pg][say:嗯……我……我能试试下一个吗？]狼男孩犹豫地问道。");
            outputText("[pg][if (allowChild && knowsAlices) {爱丽丝|魅魔}]眨了眨眼，从泥土中抬起涨红的脸，带着些许困惑转向他。[say:哈？谁——哦，行吧，随便啦，我想。] 她又瘫倒下去，在极乐中闭上了眼睛。这比你预想的要消耗更多体力，你踉踉跄跄地向营地走去。");
         }
         else
         {
            outputText("[pg][say:哈，看看这个可爱的小——啊——] 当你起身把她扔到地上时，她大叫起来。你给了她想要的东西，没有浪费任何时间。[say:嘿！] 她刚开口，就在你将脸紧紧压入她的腹股沟时颤抖起来。柔软的阴阜在你的舌头周围分开，渗出微咸的动情淫液，点燃了你更多的渴望。");
            outputText("[pg]魅魔的双手紧紧抱住你的头，[if (hasHair) {手指揉搓着你的[hairShort]|手指深深陷入你的头皮}]。她发出一声深沉而愉悦的叹息，那个狼人男孩也安静地模仿着，抚摸着他那带肉结的[if (allowChild) {[if (!isChild) {小}]男孩}]肉棒，而你则将[tongue]钻进女孩的阴缝中。她的尾巴突然缠上你的脖子，扁平的尾尖拍打着你的脸颊，她摇晃着臀部，用下体操弄着你的嘴。");
            outputText("[pg][say:就是这样，完全是我的菜，]她说道。[say:吸它——]你的嘴唇紧紧裹住她的阴蒂，她的尾巴在原地扭动，失去了抓力，这恶魔的声音拔高成一声尖叫，[say:——啊！我每年都要来一次！]");
            outputText("[pg]你爬到她身上，无需多言，她便看穿了你的意图，[if (tailLeg || isDrider) {将双腿张开环绕着你的[if (isDrider) {[hips]，让你的小穴与她的紧紧贴合|鳞片尾巴，让你的泄殖腔与她的小穴紧紧贴合}]|抬起一条腿，让你们的膝盖与彼此的小穴紧紧贴合}]。她的短裙和黑红相间的紧身胸衣在你的[if (isDrider) {前肢|手指}]尖下顺滑地滑动，当你抚摸那隆起并用拇指摩擦她的乳头时，包裹着她[if (allowChild) {平坦|适中}]乳房的薄薄布料简直形同虚设。接着，你的两只[hands]张开按在她的胸前作为支撑，你转动臀部，挺动着下体摩擦她的[if (tailLeg || isDrider) {[if (silly && allowChild) {小逼|小穴}]，阴蒂贴着阴蒂|大腿，让你的腿沾满恶魔的淫液}]。");
            outputText("[pg]这个[if (allowChild && knowsAlices) {爱丽丝|女恶魔}]向你招手，你顺从地凑近她的脸，她的嘴唇离你只有几[if (metric) {厘米|英寸}]，她猛地扑过来，用她的“獠牙”徒劳地咬了你一下，然后咯咯笑着拔出了这个道具。[say:抱歉，]她轻快地说着，然后拥抱你，给了你一个真正的吻。色欲恶魔的长舌头侵略性地探索着你的口腔。");
            outputText("[pg]这让你感到一阵恍惚；这个堕落荡妇发出的每一个声音都层层叠加，让空气中都充满了她的极乐。她把你拉近，强迫你继续动作，让你在这个性爱狂魔身上摩擦。你甩了甩脸上的热气，但又在另一个吻中将其吸了回去，你绷紧身体，在[if (tailLeg || isDrider) {她的阴蒂|她柔软的大腿}]上扭动着你的[clit]。她揉捏着你的[if (hasBreasts || isfeminine) {[breasts]|身躯}]，深深地按摩着，以此来奖励你的努力。");
            outputText("[pg]狼男孩像只——像只狗一样——喘着粗气，同时更用力地手淫。虽然肯定沾上了一些淫液，但那条内裤真的有那么好吗？他满脸通红，夹杂着嫉妒和敬畏，被女孩抛弃的挫败感已经消退了。");
            outputText("[pg][if (allowChild && knowsAlices) {爱丽丝|魅魔}]再次注意到了他，把舌头从你的喉咙里抽了出来。[say:谢谢你来陪我玩“不约会就捣蛋”，]她带着得意的咯咯笑声轻快地说。因为暂时失去了她的嘴唇，你轻轻咬住她的脖子，吸出一个吻痕。[say:我以为[b:我]才是吸血鬼。]");
            outputText("[pg]在欲望的迷雾深处，你搂住她的臀部，揉捏她的[if (allowChild) {胸部|乳房}]，将你所有的渴望和注意力都倾注在她身上，对其他一切视而不见。你体内变得滚烫而紧致。");
            outputText("[pg][say:为我……为我高潮吧，]她命令道，或者说是在恳求。她的额头蹭着你的额头，发出呜咽声。这个发情的“不约会就捣蛋”的女孩前后摇摆着亲吻你，狂喜如瀑布般倾泻而下。滚烫的液体在彼此的腹股沟里狂野地喷洒，你们俩都喘息着、呻吟着，最后你瘫倒在她身上。她缓慢而深情地抚摸着你的背。");
            outputText("[pg][say:嗯……我……我能试试下一个吗？]狼男孩犹豫地问道。");
            outputText("[pg][if (allowChild && knowsAlices) {爱丽丝|魅魔}]眨了眨眼，伸长脖子，带着些许困惑看向声音传来的地方。[say:哈？谁——哦，当然，随便吧，我想。]她又瘫倒下去，眼睛在极乐中渐渐闭上。你花了好几口气的功夫才让自己从她身上起来，但你还是做到了，然后跌跌撞撞地走回营地。");
         }
         get_player().orgasm("DickVaginal");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function strayAkkyReady() : Boolean
      {
         if(get_game().forest.akbalScene.saveContent.strayCat && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2698) != 0 && (get_player().isInForest() || get_player().isInDeepWoods()))
         {
            return !saveContent.akkySeen;
         }
         return false;
      }
      
      public function strayAkkyLeave() : void
      {
         clearOutput();
         outputText("这一刻的宁静还是不要打破为好。这是一个没有恶意的恶魔，和一只看起来很眼熟的小猫在亲热，这让你在继续前行时感觉更积极了一些。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function strayAkkyIntervene() : void
      {
         clearOutput();
         outputText("你朝他们的方向[walk]，猫最先做出反应——起身冲进了灌木丛。爱丽丝又惊又怕地跳了起来，先是看了看灌木丛，然后又看向你。");
         outputText("[pg][say: 啊-啊！我相信你的直觉，小猫咪！]她大叫着跑开了。看来这里没什么事了。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function strayAkky() : void
      {
         spriteSelect(SpriteDb.get_s_alice_demon());
         saveContent.akkySeen = true;
         clearOutput();
         outputText("当你在树林间[walk]时，一股熟悉的气息侵入了你的感官。你意识到附近肯定有一只爱丽丝。你集中精神，顺着感觉追踪，同时尽量保持隐蔽。");
         outputText("[pg]你注意到那个女恶魔正靠着一棵树坐着，看起来疲惫又憔悴，但脸上却挂着微笑。一只长着黑斑的黄褐色小猫正靠在她的腿上。她正在抚摸它。");
         outputText("[pg][say: 真希望生活能轻松点，小猫先生……]");
         outputText("[pg]年轻的恶魔闭上浮肿的双眼，叹了口气。");
         outputText("[pg][say: 至少我没看到那只大美洲豹。他说我们比小恶魔好吃，这还是让我很害怕。]");
         outputText("[pg]她再次睁开眼睛，低头看着猫。");
         outputText("[pg][say: 你觉得我好吃吗，小猫咪？]");
         outputText("[pg]猫打了个哈欠，舔了舔她的手。她轻声咯咯笑着，继续抚摸着这只猫科动物。");
         outputText("[pg][say: 我猜那就是好吃咯。]");
         menu();
         addNextButton("干预",strayAkkyIntervene).hint("采取行动。");
         addNextButton("离开",strayAkkyLeave).hint("没必要打扰他们的宁静。");
      }
      
      public function shouldraPossession() : void
      {
         clearOutput();
         outputText("打败了这只小恶魔后，你召唤了舒尔德拉。这个幽灵女孩从你的胸口探出头来，脸上带着好奇，问道：[say: 怎么了？你想让我附身她吗，勇者？没问题，包在我身上！] 爱丽丝惊恐地盯着她，她年轻的身体因为幽灵的突然出现而颤抖。你的幽灵同伴无视了这个被腐化生物明显的恐惧，迅速扑向恶魔，完全消失在她的体内。");
         outputText("[pg]爱丽丝剧烈地挣扎着，尖叫道：[say: [b: 从我的脑子里滚出去！滚出去！滚出去！滚出去！]] 她紧紧抓着自己的太阳穴，疯狂地把头撞向地面。你看着她在地上打滚，身体被强行夺走，那绝对是纯粹的痛苦。这个[if (silly) {萝莉|孩子般}]的恶魔弓起背，高高地挺起，眼睛翻白，只露出眼白。她突然完全瘫软下来，她的抵抗相当突然地结束了。");
         outputText("[pg]你看着爱丽丝慢慢坐起来。她脸上茫然的表情让你怀疑是不是出了什么差错……");
         outputText("[pg]当她突然跳起来，可爱的脸上挂着灿烂的笑容，大声喊道：[say: 我们抓住她了，勇者！那么，我们现在要做什么？] 你的任何担忧都烟消云散了。你一言不发地伸出[if (tallness < 54) {手|[if (tallness < 66){手|手}]}]，深情地拍了拍她的头。");
         outputText("[pg]尽管一开始看起来很困惑，但舒尔德拉慢慢地因为这个温柔的举动而笑了起来。[say: 嘿，感觉挺不错的！继续，不过再稍微用力一点！] 答应了她的请求，你用力地用手指抓挠她的头皮，赢得了被附身恶魔满足的叹息。你发现她的头发摸起来出奇的柔软，质地如丝般顺滑，你继续热情地用手指穿过她的头发，她那铲状的尾巴也高兴地甩来甩去作为回应。");
         outputText("[pg]在又一次梳理的抚摸下，舒尔德拉突然抓住了她那甩动的尾巴。当她这么做时，你能感觉到她全身都在颤抖，她颤抖着说：[say: 哇——哇！这东西超级他妈的敏感！] 她开始用手指捏住尾巴尖，导致她的膝盖几乎要弯曲，甚至碰撞在一起。她的呻吟声变得越来越沉重，她急切地左右摇摆着她那年轻的臀部。你只是继续温柔地抚摸她的头，欣赏着她天真的脸上闪过的幸福表情。");
         outputText("[pg][say: 你美妙的抚摸，还有这超级敏感的尾巴！我这辈子都错过了什么！？] 她大喊道，兴奋的话语后紧接着是一声淫荡的娇喘。当她继续把玩着她那娇嫩的尾巴时，你看着女孩柔软的双腿发软，她的脸不雅地摔在地上。尽管她的脸颊在泥土上摩擦，她还是发出了无数满足的呻吟。爱丽丝的牙齿打着颤，嘴里发出一声响亮的喘息，然后她把屁股撅在半空中，接着就完全瘫软了。看来她对自己恶魔尾巴的粗暴亵玩，加上你那天堂般的摸头杀，对她来说实在是太刺激了，让她无法承受。");
         outputText("[pg]幽灵从昏迷的爱丽丝背上飘起，气喘吁吁地说道：[say: 呼……！难道所有小鬼都这么敏感吗？我们也许得多测试几次才行！] 给你留下这个值得考虑的想法后，你那空灵的朋友悠闲地飞回了你的体内。确认她安顿好后，你把这只被击败的恶魔丢在泥地里，任由路过的什么东西去处置她。");
         aliceCorruption(15,true);
         get_combat().cleanupAfterCombat();
         spriteSelect(SpriteDb.get_s_alice_demon());
      }
      
      public function saveToObject() : Object
      {
         return saveContent;
      }
      
      public function reset() : void
      {
         saveContent.foxSeen = false;
         saveContent.foxWatched = false;
         saveContent.foxNeedArouse = true;
         saveContent.rented = false;
         saveContent.knowInnocent = false;
         saveContent.knowBossy = false;
         saveContent.akkySeen = false;
         saveContent.trystOrTreatedYear = 0;
      }
      
      public function rentAnAliceYuriNormal2(param1:Boolean, param2:Boolean = false) : void
      {
         clearOutput();
         if(param1)
         {
            outputText("你的手指轻轻滑过她的胸膛，若有若无地掠过她的乳头，这似乎引起了她的注意，当她[if (tallness <= 60) {转过头|抬起头}]看你时，她[if (tallness > 60) {娇小的}]身体在你的怀里颤抖着。也许她已经知道自己应得的奖励，这就是为什么当你俯下身，双手贴上她的" + (param2 ? "臀部时，她的呼吸变得急促起来。" : "[alicepanties]内裤时，她的呼吸变得急促起来。尽管它们如此柔软、可爱，而且正如你一触所知的那样，已经湿透了，你仍然需要脱掉它们。当你把布料抓在手里，顺着她温暖的肌肤向下滑动，直到她完全暴露出来时，她没有做出任何阻止你的动作。") + " 她的兴奋显而易见，当你顺着她的大腿向上摸索，挑逗着分开她的阴唇时，你的手指已经沾满了黏稠的淫液。");
            outputText("[pg]尽管她急切地想要在你的手上摩擦，但你很容易就能抽身。当你凑近时，单是你的呼吸就让她颤抖，直到你靠近到足以品尝她的味道时才停下来。在你的第一口舔舐下，她的双臂紧紧抱住你，[if (ischild) {虽然她的味道让你有些意外，但这并不[i: 糟糕]。事实上，你渴望得到更多，而她也很乐意提供，把你拉近，直到你的鼻子在她敏感的肌肤上蹭得发痒。|你几乎无法阻止自己沉浸其中。这是罕见的美味，如此年轻之人的新鲜、性感的汁液。当那味道在你的舌尖散开时，你浑身一颤，把她拉得更近，直到你的每一次呼吸都拂过她滚烫的阴唇。}] 她那压低了声音、只为你发出的娇喘就是最好的奖励，当你把她含在唇间时，她紧紧依偎着你的样子让你的脉搏因欲望而狂跳。");
            outputText("[pg]你的双手紧紧抓住她[if (!ischild) {纤细的}]双腿，稳住她的身体，同时你的舌头不断向她的阴蒂逼近。当你拂过它，用你滚烫的唾液涂抹她时，她紧张得浑身发抖。她[if (!ischild) {娇小的}]臀部向你挺动，尽管[if (ischild) {她缺乏经验|她还未完全发育}]，但她的身体知道自己想要什么。你毫不迟疑地满足她，当她在你的舌头下悸动时，你的手指顺着她大腿上[aliceskin]的肌肤向上滑动。当你压上她的入口时，你已经沾满了她的淫液，而当你一推入，她的肉壁就紧紧地绞住了你。");
            outputText("[pg]当你进一步深入时，她用双臂环抱住你，一旦你完全滑入并开始抽插，她就忍不住叫出声来。她的呻吟声告诉你再用力些，你急切地服从了，一边将她的阴蒂含在唇间，一边尽可能深地滑入她的体内。当你抬起头时，她[aliceeyes]的眼睛正盯着你，燃烧着欲望，当你把一根手指蜷缩在她的体内时，你觉得她根本无法移开视线。当你用舌头在她身上打转时，连她的嘴唇都在颤抖，只有当她紧紧夹住你的头，她的手指[if (hashair) {埋在你的头发里|按在你的头皮上}]时，你才意识到她已经离高潮有多近了。");
            outputText("[pg]当你滑入另一根手指时，她的淫液顺着你的手流下，填满她的深处，直到她在你的触碰下颤抖，她的肉壁紧紧绞住你，尽最大努力把你留在里面。无论你放慢多少速度，她仍然在你的嘴里颤抖，看到[if (ischild) {她|这个小女孩}]为你崩溃的样子，[if (lib < 50) {让你屏住呼吸|让你[if (isgoo) {身体|血液}]因渴望而燃烧}]。只有当她终于平静下来时，你才从她体内滑出，在最后一次亲吻她的阴蒂后，你[if (singleleg) {起身|站起来}]把她拉进你的怀抱。");
            outputText("[pg]她满脸通红，紧贴着你的[skindesc]感觉异常温暖，即使只是这样紧紧抱着她也感觉像是一场梦。随着她逐渐恢复，她滚烫的呼吸平稳地慢了下来，当你的手指穿过她汗湿的[alicehair]头发时，她依偎在你的怀里。尽管你很想永远待在这里，但[timeofday]的空气让你打了个寒颤，你知道你最好[if (isnaked) {回去|穿上衣服}]了。");
         }
         else
         {
            outputText("不过，现在你除了努力喘口气之外，不确定自己还能做些什么。你把她抱得更紧，抚摸着她的背，感受着她的柔软和温暖，如果她期待更多，她也没有说出来。相反，她一直留在你的怀里，直到你在她令人安心的拥抱下平静下来。");
         }
         outputText("当你终于放开她时，她[if (isnaked) {收拾好她的东西|把你的[armor]递给你}]，脸上带着满足的微笑。她甚至懒得穿上衣服就转身离开了，在离开你的视线之前，你有充足的时间欣赏[if (ischild) {这番美景|她年轻的身体}]。");
         outputText("[pg]你花了一点时间清理自己[if (!isnaked) {，然后穿上衣服，|，然后}]心满意足地回到营地。你能想到比这更糟糕的消磨[if (paid) {几颗宝石|一个小时}]的方式。");
         aliceCorruption(15,true);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function rentAnAliceYuriNormal(param1:Boolean) : void
      {
         var favor1:Boolean;
         var _g1:AliceScene;
         var touched1:Boolean;
         var favor:Boolean;
         var _g:AliceScene;
         clearOutput();
         if(param1)
         {
            outputText("不过，你并不着急。并不是每天都有一个[if (ischild) {和你同龄的女孩|年轻女孩}]紧贴着你的[if (hasplainskin) {裸露肌肤|赤裸身体}]，距离如此之近，以至于你可以[if (tallness <= 60) {凑过去|俯下身}]闻到她纯洁的、[if (ischild) {令人振奋的|孩子般的}]气味。你几乎希望自己知道那是什么味道，这样你就可以[if (ischild) {自己也涂上它|在手边留一些}]，永远记住她。");
            outputText("[pg]相反，当你摘下她的帽子，手指穿过她的发丝时，你只能沉醉在她那明亮的眼眸中。就在你[if (tallness <= 60) {凑上前去|轻轻抬起她的下巴}]，吻上她那[if (!ischild) {令人愉悦的}]柔软双唇之前，她那羞涩的微笑变得真诚起来，这让你的心跳加速。当你退开时，她看起来更加美丽了，脸上泛着欲望的红晕，期待着更多。");
            outputText("[pg]你无法拒绝她无声的请求，加深了这个吻。当你的手顺着她的肚子滑向她的[alicepantieslong]内裤时，她热切地回应着你，让你如痴如醉。这层布料是你们完全交融的唯一阻碍。当她离开你的唇时，你将手指滑入布料，抚摸着她[if (ischild) {光滑的|裸露的}]肌肤，她的眼睛几乎在闪闪发光。你迫不及待地想看到她的全部，于是你的手继续向下滑，将内裤褪下，直到她完全暴露在你面前，为你闪烁着诱人的光泽。");
         }
         outputText((param1 ? "[pg]她靠得更近了，当她" : "她") + "的嘴唇在你的[chest]上短暂地掠过，然后顺着你的[if (ispregnant) {怀孕的肚子|小腹}]滑下，同时她降低了身子，来到你的[if (singleleg) {面前|双腿之间}]，你几乎无法控制自己。当她抬起头与你对视时，眼中闪烁着期待的光芒，她靠过来时，急促而浅浅的呼吸拂过你的身体，她的舌头顺着你的大腿向上舔舐，直到它们颤抖起来。你艰难地咽了口唾沫，尽力克制住自己的声音，她的手指[if (tailLeg) {抚摸着你的下腹部|[if (isgoo) {按摩着你黏滑的身体|紧随其后，轻轻地触碰着你的[skinshort]}]}]。然而，她始终没有碰到你的[vagina]，当你试图在她身上摩擦时，她咯咯地笑了起来。");
         outputText("[pg][say:嘘，]她低语道，你几乎能感觉到那声音爬过你的身体，你的[if (isgoo) {感官|神经}]随着她的每一次呼吸而刺痛。");
         outputText("[pg]当她向内探索时，你伸手想要寻找支撑，却什么也没抓到。周围空无一物，你只好用双手捧住她的头，手指深深插入她[alicehair]的头发中，任由她在唇间挑逗你的双唇。初尝你湿润的滋味似乎更加激发了她的兴致，低头看到[if (ischild) {[if (isfeminine) {另一个|一个可爱的}]女孩|一个小女孩}]埋首于你的双腿之间，让你屏住了呼吸。你几乎不敢相信这一刻是真实的，但随着她的舌头滑入，你腹部聚集的燥热让你确信无疑。");
         outputText("[pg]她舌尖在你肉壁上的每一次颤动都让你更紧地抓住她的头发，但她似乎并不在意。尽管她[if (ischild) {并不比你大|的年龄摆在那}]，但她没有丝毫犹豫，[if (ischild) {双手环抱住|紧紧抱住}]你的[if (tailLeg) {[if (isNaga) {蛇形|[if (isMer) {海洋|滑溜}]}]下半身|[if (isgoo) {身体|双腿}]}]，同时向更深处压去。她每一次贪婪的舔舐都让舌头的热度席卷你的全身，当她的鼻子擦过你的[clit]时，那感觉简直要在你的[if (isgoo) {核心中脉动|血液中沸腾}]。");
         outputText("[pg]当你低头看去，她那熟悉的[aliceeyes]双眼半闭着，因欲望而变得深邃。随着她一路向上舔舐，直到她柔软的双唇包住你酸胀的阴蒂，你的淫液[if (vaginalwetness > 2) {顺着大腿流下|沾湿了}]你的大腿。她的温暖包裹着你，尽管她动作很温柔，但当[if (singleleg) {你感到站立不稳|你的双腿开始发软}]时，你还是忍不住将她拉向自己。她似乎把这当成了鼓励，手指顺着你的[skinshort]向上滑动，直到你舒服得呻吟出声。");
         outputText("[pg]你想要感受她进入你的体内，只需颤抖着抚摸一下她的头发，就能向她表明你有多么渴望。没过多久，她的手便将你拨开，用轻柔的触碰挑逗着你，同时一路吻向你的穴口，探入其中再次品尝。当她滚烫的舌头触碰到你更加火热的肉壁时，她颤抖得几乎和你一样厉害，像品尝最稀有的美味一样品味着你。");
         outputText("[pg]当她离开时，你忍不住叹息了一声，但当她的嘴再次含住你的[clit]时，这声叹息便卡在了喉咙里。她舌头每一次慵懒的画圈都让你无助地收缩着，渴望着那些迟迟未到的手指。当她的指甲刮过你大腿敏感的[skinshort]时，你只能绝望地在她的唇上摩擦，感觉如果没有她的触碰，你的身体就要爆炸了。即使透过笼罩在你脑海中的浓重迷雾，你的声音听起来也是那么可怜，也许正因如此，一根指尖终于拨开了你的阴唇，在你因渴望而颤抖时，轻柔地没入你的体内。");
         outputText("[pg]她停顿了一下，刚好让你以为自己喘过气来了，但当她滑入第二根手指时，你又瞬间屏住了呼吸。突如其来的充实感让你紧紧绞住她，而这种反应正是她所需要的，她顺势向你体内抽插，直到指关节擦过你的阴唇才停下。被困在她嘴唇的火热和手部持续的压力之间，你完全将自己交给了她，毫无保留地随着她的每一次触碰而收缩得更紧。她每一次深入都将你推向高潮的边缘，你的大腿已经紧紧夹住她，不愿让她离开。");
         outputText("[pg]当她的双唇最后一次吸吮你的[clit]时，你的整个身体都在颤抖，[if (isgoo) {仿佛要散架了一样|如同电流窜过脊背}]。你唯一能确定的是她紧贴着你的温暖，以及你的内壁随着她抽插的节奏紧紧绞着她的手指。随着她将你推向高潮，你的每一次呼吸都变得滚烫而急促，她舔舐着你的淫液，直到[if (vaginalwetness > 2) {它在她的脸上闪闪发光，并且}]她认为你已经被清理干净。只有当你靠着她平静下来时，她才终于放开你，当她缓缓退出时，你的心跳在耳边砰砰作响。");
         outputText("[pg]当她起身时，你的[vagina]仍然因为她的触碰而感到酥麻，甚至连扶她起来都显得有些吃力。不过，她的笑容让这一切都值得了，当她双臂环抱住你，依偎在你的[if (tallness > 60) {胸前|肩膀}]时，你根本无法拒绝。当她依偎着你时，之前那种[if (ischild) {淡淡的泥土气息|纯净、孩子般的气息}]再次拂过你的鼻尖，只是现在它夹杂着你们混合在一起的动情气味。一想到这里，[if (hasscales) {你就觉得身体更热了|你的[skinshort]就一阵刺痛}]，你确信她也和你一样兴奋。");
         get_player().orgasm("Vaginal");
         menu();
         _g = this;
         favor = true;
         touched1 = param1;
         addNextButton("回报",function():void
         {
            _g.rentAnAliceYuriNormal2(favor,touched1);
         });
         _g1 = this;
         favor1 = false;
         addNextButton("不要",function():void
         {
            _g1.rentAnAliceYuriNormal2(favor1);
         });
      }
      
      public function rentAnAliceYuriCorrupt(param1:Boolean) : void
      {
         clearOutput();
         outputText((param1 ? "当你揉乱她的头发，用她不配得到的赞美来奉承她时，她僵住了。你所能哄出的只是一个不安的微笑，所以你" : "你的表情没有改变，她迅速移开视线，直到你") + "收紧对她的抓握，把她拉进你的[vagina]。对空气的渴望让她很快意识到了自己的位置，她的舌头舔舐着你的兴奋，带着你从未见过的活力。即使是她绝望的努力也让你的[skinshort]泛起红晕，当她用自己的嘴唇含住你的嘴唇，然后向上移动到你的[clit]时，你的呼吸在喉咙里停滞了。");
         outputText("[pg]当她的嘴在你周围张开时，她[if (ischild) {[aliceeyes]的|天真的}]眼睛里闪烁着泪光，她舌头的每一次旋转都让你因愉悦而颤抖。当你挤压她的[if (singleleg) {身体|头}]时，连她的手也加入了进来，她柔软的指尖在你的褶皱上颤抖着拂过，让你知道她有多么渴望取悦你。很难说当她犹豫地推入时谁更紧张，但你在她头皮上的[claws]就是她需要的所有答案，让她可以轻松进入。");
         outputText("[pg]当你在突如其来的充实感中呻吟时，她浑身一阵战栗，但她并没有停止将手指探入你的深处，直到你将她所有的手指都吞没。当她挑逗你的内壁，用嘴唇包裹住你的阴蒂，尽其所能地取悦你时，你的身体不禁颤抖起来。每一次抽插都将你推向高潮的边缘，速度越来越快，直到你除了她抽插的节奏和喘息声之外，再也无法集中注意力。在你体内不断积聚的温暖之下，其他一切似乎都变得迟钝，她舌头的每一次扫过都让你在力量流失时更难抓住她。");
         outputText("[pg]当她的手指在你的内壁上弯曲，向上按压进你的体内，直到你视线模糊，颤抖的[if (tailLeg) {尾巴失去了|[if (isgoo) {史莱姆失去了|四肢失去了}]}]抓握力时，你不再费心去克制自己。即使你紧紧夹住她的手，在她的嘴唇上痉挛，她也没有停止，当快感如潮水般涌来时，你将头向后仰，靠在你的[inv]上。透过迷雾，你可以隐约感觉到她的抽插慢了下来，随后她也停了下来，瘫倒在你身上。");
         outputText("[pg]当你最终平息下来时，她的喘息声与你的交织在一起，当你把她滚到地上时，她只能发出一声可怜的呻吟。当你再次看她时，她的嘴唇因你的淫液而闪闪发光，泪水点缀着她的眼睛，[alicepanties]内裤也被打湿了。你不得不承认，她这个样子很好看。当你[if (singleleg) {起身|站起来}][if (!isnaked) {并穿上你的[armor]}]时，她甚至一动不动，但你觉得以她的价格，你不能指望更多了。");
         outputText("[pg]一旦你[if (isnaked) {收拾好东西|穿好衣服}]，你就把她留在身后，回到你的营地。");
         get_player().orgasm("Vaginal");
         aliceCorruption(15,true);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function rentAnAliceYuri() : void
      {
         var touched1:Boolean;
         var _g3:AliceScene;
         var touched:Boolean;
         var _g2:AliceScene;
         var praised1:Boolean;
         var _g1:AliceScene;
         var praised:Boolean;
         var _g:AliceScene;
         clearOutput();
         outputText("她向你伸出手，当[if (isflat) {她的手指抚摸你的胸部|她描摹你乳房的下缘}]时，一声呻吟从你的喉咙里撕裂出来，刚好让你颤抖。她的嘴唇微微撅起，当她靠近时，她的呼吸在你的乳头上幸福地滚烫，等待并折磨着你，感觉就像永恒，直到她锐利的[aliceeyes]眼睛捕捉到你的眼睛，你滑入——思想、身体和一切——她嘴巴的温暖中。");
         outputText("[pg]当周围的世界渐渐褪去，只剩下她双唇缓慢而温柔的节奏时，一切似乎都消失了。她舌尖的每一次拂过都点燃了你的[skinshort]，但就在你以为你可能会把她留在这里一整[if (hours < 21) {天|晚}]时，她微微后退，直到你的[if (isgoo) {史莱姆身体在微风中颤动|乳头在微风中感到一阵酥麻}]。你可以数出她在把你重新吸入之前每一次令人折磨的呼吸，而且[if (corrupt) {这几乎就像她属于这里，永远被你拥入怀中。|这几乎就像你属于这里，永远被她拥入怀中。}]");
         outputText("[pg]在那个[if (corrupt) {诱人的|令人惊讶的}]想法之后，她抬起头，脸上明显流露出欲望与紧张的可爱混合。不过，她显然知道[if (corrupt) {你|她}]想要什么，她的手抓住你的手，将你的手掌按在她的裙子布料上。一个渴望却又犹豫的点头，就是你所需要的一切，随后你的手指滑入其中，探索她的身体。她柔软的肌肤在你的抚摸下似乎变得更加温暖，当你缓慢而挑逗地脱下她的衣服时，红晕蔓延了她的脸颊。[if (corrupt) {她没有帮忙，但你不在乎|她太慌乱了帮不上忙，但你并不介意}]——这只意味着每一寸新露出的肌肤都只属于你一个人。");
         outputText("[pg]不想浪费这个机会，你顺着她的身体往下，在她光滑的肌肤上印下一连串的吻。每次她扭动时，你只会多停留一会儿，尽可能多地引出她微弱的呻吟。当你到达她的腹部时，她在你的唇下颤抖，当你俯身到她的[alicepantieslong]内裤边缘时，这个可怜的女孩几乎无法呼吸。");
         if(get_player().cor >= 50 || get_player().get_lust() == get_player().maxLust())
         {
            outputText("[pg]那明显的污迹没有逃过你的眼睛，当你退开时，她向你挺进的饥渴模样让你确信她已经被挑逗得够多了。以她现在的绝望程度，你毫不怀疑她会做任何你想做的事，而且你似乎回想起了她之前的一个提议，关于依偎在你的双腿之间……");
            outputText("[pg]仅仅是提到这个，就让她低下了头，但没有说出任何话。她现在看起来如此脆弱，当你把她的帽子扔到一边，手指穿过她的头发时，她先前的兴奋逐渐消退，变成了顺从。它几乎和她一样如丝般柔软，当你停下来[if (ischild) {看着她的眼睛|抬起她的下巴直到她与你对视}]时，一阵颤栗传遍了她的全身。如果她不想发生这种事，也许她就不该[if (paid) {出卖自己|勾引你}]。");
            outputText("[pg]尽管红晕爬满了她的脸颊，但当你[if (singleleg) {后退|退后一步}]躺下，用你的[inv]作为临时枕头时，她并没有移开视线。你示意她靠近，她呼出一口颤抖的气，脸上的担忧清晰可见。");
            outputText("[pg][say: 那个，嗯……] 她握紧拳头，向你走来，当她蹲下并[if (tailLeg) {跨坐在你的尾巴上|[if (isgoo) {沉入你的史莱姆中|犹豫地将手放在你的大腿上}]}]时，她的眼睛死死盯着你。");
            outputText("[pg]你笑了，但她没有回应。不过没关系——看到一个可爱的[if (!ischild) {年轻}]女孩跪在你面前，离你的[vagina]只有几英寸远，这就足够幸福了。当她俯身时，她的手指在你的[skinshort]上颤抖，她平坦的胸膛每一次起伏，都伴随着她灼热的呼吸扑面而来。");
            outputText("[pg]她完全知道你想要什么，你等待着她张开嘴，真正屈服于你的欲望的那一刻。连她自己也一定知道[if (ischild) {她有多么孤立无援|她不可能制服你}]，就在你以为她在试图考验你的耐心时，一种温暖、细腻的触感拂过你的嘴唇。你用[claws]穿过她的[alicehair]头发表示赞许，换来她一声惊讶的尖叫。如果她认为这就足够了，那太糟糕了，因为你已经不想再等了。");
            outputText("[pg]她收到的唯一警告就是突然的动作，随后你的[if (tailLeg) {尾巴缠住了她的双腿|[if (isgoo) {无定形的身体包裹住了她的双腿|双腿缠住了她}]}]，将她紧紧抱住。她的整个世界缩小到了你的双腿之间，当你[if (singleleg) {开始挤压|抓住她的头}]时，你确信她明白你想要什么。当她的手指滑向更低处时，她艰难地咽了口唾沫，当它们推向你的入口时，你的[if (isgoo) {核心|每一根神经}]都因期待而嗡嗡作响。");
            outputText("[pg]她没有把它们滑进去，而是抬头看着你，无言地请求停止。");
            menu();
            _g = this;
            praised = true;
            addNextButton("赞美",function():void
            {
               _g.rentAnAliceYuriCorrupt(praised);
            }).hint("鼓励她继续。");
            _g1 = this;
            praised1 = false;
            addNextButton("无视",function():void
            {
               _g1.rentAnAliceYuriCorrupt(praised1);
            }).hint("那不是你的问题。");
         }
         else
         {
            outputText("[pg]如果她那么兴奋，你只好停下来。当你改变路径向上，抚摸她臀部柔和的曲线、腰侧柔软的肌肤和胸前敏感的蓓蕾时，她[if (!ischild) {娇小的}]大腿颤抖着，直到你将手指滑入她的帽子下，穿过她如丝般柔滑的[alicehair]头发才停下来。在你的抚摸下，她颤抖着靠向你，她的肌肤贴着[if (hasplainskin) {你的肌肤|你的[skindesc]}]感到温暖。这[if (ischild) {出奇地令人平静，把她抱得这么紧|几乎就像抱着你自己的孩子，当她依偎着你时}]。");
            outputText("[pg][say: 嗯……] 她说话时，嘴唇在你的[if (ischild) {肩膀|胸膛}]上发痒。[say: 那……怎么办？]");
            outputText("[pg]她的指尖慢慢滑向你的臀部，这清楚地表明了她的请求。");
            menu();
            _g2 = this;
            touched = true;
            addNextButton("让她做",function():void
            {
               _g2.rentAnAliceYuriNormal(touched);
            }).hint("你已经等得够久了。");
            _g3 = this;
            touched1 = false;
            addNextButton("再次触摸",function():void
            {
               _g3.rentAnAliceYuriNormal(touched1);
            }).hint("不要让这个机会白白浪费。");
         }
      }
      
      public function rentAnAliceTooMuchTwo() : void
      {
         clearOutput();
         if(lewd)
         {
            outputText("[if (gems < 5) {不幸的是，对你来说，就连这个价钱你也付不起。|也许她就是没搞明白。在这个地方，你几乎走不了十步，就会绊上一个温热的[if (hascock) {小穴|舌头}]。她真觉得自己有那么特别吗？}]");
         }
         else
         {
            outputText("[if (gems < 5) {说来挺丢人的，但你连五颗宝石都没有。|她或许能从别的傻瓜那儿骗走[his]宝石，但别想骗你。你才不会花钱买一个拥抱，没得商量。}]");
         }
         outputText("[pg]" + (lewd ? "" : "[say: 你比我想象的更需要这个……] ") + "她似乎看穿了你，然后叹了口气。[say: 好吧……就这一次。]");
         outputText("[pg]" + (lewd ? "虽然你不敢相信[if (gems < 5) {你听到了什么|这居然管用}]，但她打断了你，没让你接受她的提议。" : "[if (gems < 5) {被一个[if (ischild) {和你同龄的女孩|小女孩}]可怜感觉很奇怪，但是|虽然你不敢相信这居然管用，}]她打断了你，没让你接受她的提议。[pg]") + "[say: 但是，]她说着，举起一根手指，做出了一个不太有威胁性的手势。[say: 作为交换，你需要告诉别人我的……嗯，服务。]");
         if(get_allowChild())
         {
            dynStats(DynStat.Lust(10));
         }
         menu();
         addNextButton("同意",rentAnAliceTooMuchAgree).hint("这似乎很公平。");
         addNextButton("离开",rentAnAliceTooMuchLeave).hint("这不值得。");
      }
      
      public function rentAnAliceTooMuchLeave() : void
      {
         clearOutput();
         outputText("你摇摇头，告诉她你改变主意了。你想要的只是" + (lewd ? "发泄一下" : "一个简单的拥抱") + "。如果她要开始抛出承诺和义务，那你就去找别人。" + (lewd ? "反正这里也不缺做爱的地方。" : (get_camp().getCampPopulation() != 0 ? "毕竟你还有你的追随者来让你开心。" : "这能有多难呢？")));
         outputText("[pg][say: 等、等等！]她喊道，但你已经转过身，任由她的恳求在无尽的荒原上无人理睬，径直走回营地。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function rentAnAliceTooMuchAgree() : void
      {
         var price:int;
         var _g:AliceScene;
         clearOutput();
         outputText("你点点头，[if (cor >= 50) {其实并不打算这么做|觉得这个折扣很值}]。");
         outputText("[pg][say: 不够，]她伸出手说。[say: 你必须保证。]");
         outputText("[pg]你还没来得及开口，就感觉到她柔软的手掌贴着你的[skindesc]，轻轻地引导你的手与她的手相握。你只能好奇地看着她用手指勾住你的[if (hasclaws) {锋利爪子|手指}]，进行某种奇怪的仪式。" + (get_player().hasSpells() ? "你很确定这没什么用，但你听说过巫师不小心订下无法遵守的契约的故事。" : "你觉得这没什么用……但话又说回来，你对魔法又了解多少呢？"));
         if(get_allowChild())
         {
            dynStats(DynStat.Lust(10));
         }
         _g = this;
         price = 0;
         doNext(function():void
         {
            _g.rentAnAlicePay(price);
         });
      }
      
      public function rentAnAliceTooMuch() : void
      {
         var price:int;
         var _g:AliceScene;
         clearOutput();
         if(lewd)
         {
            outputText("[if (gems < 20) {即使[if (corrupt) {虽然|如果}]你想，你也没有足够的宝石付给她。|二十颗宝石？在接下来的五分钟里，你就可以[if (hascock && !hasballs) {埋在|[if (hascock) {蛋蛋|手腕}]深处}]一个地精体内——而且[i:她]还会感谢你。}]");
            outputText("[pg][say: 嗯。] [if (ischild) {她|小女孩}]在你的注视下扭动着身体，摆弄着她的帽子。[say: 我……也许五颗宝石就够了？]");
         }
         else
         {
            outputText("[if (gems < 20) {不幸的是，你没有[if (gems == 0) {任何|那么多}]宝石。|二十颗宝石能买到很多东西。一瓶奇迹药水，几顿饭——你指出，所有这些都比一个拥抱更有可能改善你的生活。}]");
            outputText("[pg][say:那个，呃……]她凑近了些，声音轻得几乎要被微风盖过去。[say:听起来你真的很需要一个拥抱，所以……五颗宝石就够了。]");
         }
         if(get_allowChild())
         {
            dynStats(DynStat.Lust(10));
         }
         menu();
         _g = this;
         price = 5;
         var _loc1_:Function = function():void
         {
            _g.rentAnAlicePay(price);
         };
         var _loc2_:String = lewd ? "这就够了。" : "你想要一个拥抱。";
         addNextButton("支付",_loc1_).hint(_loc2_).disableIf(get_player().get_gems() < 5,"你没有那么多宝石。");
         addNextButton("太贵了",rentAnAliceTooMuchTwo).hint("[if (gems < 5) {你还是付不起。|这还是太贵了。}]");
      }
      
      public function rentAnAliceQuestion() : void
      {
         var _g1:AliceScene;
         var _g:AliceScene;
         clearOutput();
         if(lewd)
         {
            outputText("你一定是听错了[if (corrupt) {，尽管你希望自己没听错}]。二十颗宝石到底是什么意思？");
            outputText("[pg][say: 我。] 她环顾四周，尽管你并没有发现附近有什么东西——或者任何人。[say: 你可以，嗯……[if (hascock) {把它放进我里面|把我夹在你的大腿中间}]。][if (singleleg && !hascock) { 当她低头看到你的[if (tailLeg) {[if (isNaga) {蛇|长长的}]身体|黏糊糊的底座}]时，她睁大了眼睛，你担心这个可怜的女孩可能会哭出来。[say: 或者，嗯……我们可以做任何这位好心的[if (tailLeg) {[if (isMer) {鱼|[if (isNaga) {蛇|怪物}]}]|黏液}]-[if (ischild) {女孩|女士}]喜欢的事情。]}]");
            outputText("[pg]她点点头，似乎在试图说服自己，而你简直不敢相信[if (corrupt) {你的运气。[if (hascock) {[if (hasarmor) {一想到她[if (tallness > 60) {娇小的}]身体缠绕着你，你的[cock]就难受地顶着你的[armor]。|[if (ischild) {这个|这个小}]荡妇在考虑她的提议时，甚至忍不住偷看你变硬的[cock]。}]|她娇小的手指几乎可以塞进你想要的[i:任何地方]，你几乎可以想象她在你的抚摸下崩溃时会发出多么可爱的声音。}]|你所听到的一切。无论是什么——或者是谁——驱使这个孩子做出这种不可思议的事情，都让你浑身发冷。[if (ischild) { 你很清楚，这可能就是明天的你。}][pg]当你问她为什么要这么做时，她的眼神黯淡下来。[say: 我饿了，] 她呜咽着，把身体贴在你的身上，这种接触让你不寒而栗。[say: 请帮帮我。]}]");
            dynStats(DynStat.Lust(10));
            menu();
            _g = this;
            addNextButton("支付",function():void
            {
               _g.rentAnAlicePay();
            }).hint("买下她。").disableIf(get_player().get_gems() < 20,"你买不起。");
            addNextButton("捐赠",rentAnAliceDonate).hint("给她一些宝石来帮忙。").disableIf(get_player().get_gems() == 0,"你没有钱可以给。");
            addNextButton("太贵了",rentAnAliceTooMuch).hint("[if (gems < 20) {就算你想买她，你也买不起。|那太贵了。}]");
            setExitButton("离开",rentAnAliceApproachLeave);
         }
         else
         {
            outputText("一个拥抱？你告诉她，在这个领域里，这似乎[if (cor < 50) {令人耳目一新地|令人惊讶地}]温和，作为回应，她[if (cor < 50) {笑了|脸红了}]。");
            outputText("[pg][say: 有时候恶魔会……嗯，让你沮丧。] 她的目光与你交汇了一秒钟，然后害羞地移开了视线。[say: 但是我的拥抱能让你感觉很好，无论发生什么。]");
            outputText("[pg][if (cor < 50) {回想发生的一切，也许你确实需要一个拥抱。|你已经不记得上次看到有人提供像拥抱这样纯洁的东西是什么时候了，这个想法出奇地诱人。}] 反正也没什么坏处，不是吗？");
            menu();
            _g1 = this;
            addNextButton("支付",function():void
            {
               _g1.rentAnAlicePay();
            }).hint("你想要一个拥抱。").disableIf(get_player().get_gems() < 20,"你付不起。");
            addNextButton("太贵了",rentAnAliceTooMuch).hint("[if (gems < 20) {你付不起|你绝对不会付那么多钱}]。");
         }
      }
      
      public function rentAnAlicePay(param1:int = 20) : void
      {
         clearOutput();
         var _loc2_:Player = get_player();
         _loc2_.set_gems(_loc2_.get_gems() - param1);
         registerTag("paid",TagFun_Impl_.fromBool(param1 > 0));
         if(!lewd && get_player().get_lust() == get_player().maxLust() && get_allowChild() && !get_player().isGenderless())
         {
            outputText("在令人窒息的炎热中，你几乎无法呼吸，你的大脑和身体都变得模糊发麻，你拼尽全力想要保持专注。[if (hascock) {[if (isnaked) {你的[cock]抽动着，渴望释放，你注意到她的目光无法从你身上移开。|只要一想到她[if (tallness > 60) {娇小的}]身体缠绕着你，你的[cock]就不舒服地顶着你的[armor]。}]|[if (isnaked) {她的目光无法从你暴露的身体上移开，而你觉得你并不希望她这样。|只要一想到她的嘴唇贴着你，你的[armor]就完全湿透了。}]}]");
            outputText("[pg]你必须得到她，[if (cor < 50) {虽然你知道你应该对这个想法感到恐惧，但你无法让自己停下来。|而且你一定会得到她。}]");
            outputText("[pg][say: 嗯……]她[if (tallness <= 60) {看着|抬头看着}]你，[if (isnaked) {明显在盯着看|脸上带着困惑。}] [say: 你没事吧，[Mister]？]");
            outputText("[pg][if (cor < 50) {不，你想这么说，但你无法开口。|你从未感到如此充满活力，如此接近你所需要的东西。}]当你向她伸出手时，她顺势靠向你的抚摸，当她用双臂环抱你时，你全身都在颤抖。");
            outputText("[pg][say: 别担心，[Mister]。我也提供特别的拥抱。][pg]");
            lewd = true;
         }
         if(lewd)
         {
            dynStats(DynStat.Lust(10));
            outputText("[if (paid) {你[if (corrupt) {急切地|谨慎地}]把[if (!gems) {你所有的积蓄|宝石}]交给她，" + (param1 == 5 ? "对你的折扣感到[if (cor >= 50) {相当得意|有点内疚}]" : "不耐烦地等待着") + "她把它们放进包里。}][say: 我想这已经搞定一切了，]她说着，把身体紧紧贴着你，让你能感觉到她的每一次心跳。[say: 嗯，除了……除了你。]");
            if(get_player().hasCock())
            {
               outputText("[pg]她一说完这句话，脸就有点红了，但当她低头看去，意识到摩擦着她的是你正在变硬的[cock]时，她的脸变得通红[if (isnakedlower) {，它的兴奋随着她的每一个动作涂抹在她的裙子上。|。也许是出于好奇" + (get_silly() && get_player().longestCockLength() >= 12 ? "——或者自我保护——" : "，") + "她凑近了，往你的[armor]里偷看了一眼。}] [if (cocklength >= 12) {她的眼睛睁得大大的，显然明白了你到底有多巨大，而且你们俩都知道，你绝对不可能把它塞进她体内。[if (cocklength >= 48) {一旦完全勃起，它甚至比[i:her]还要大，你就把那呆滞的目光当作赞美吧。}]|[if (cocklength < 6) {当她轻轻捏你时，她[if (tallness > 60) {小巧的}]手[if (isnaked) {完美地握住了你的肉棒|隔着衣服捧住了你的龟头}][pg][say: 对我来说尺寸刚刚好，]她微笑着说[if (!ischild) {，尽管她的赞美也许并没有她希望的那么讨人喜欢}]。|她皱起嘴唇，集中注意力考虑你的尺寸。[say: 我……嗯，觉得应该可以。]}]}]");
               outputText("[pg][if (hasarmor) {当你准备脱下[armor]时，一只手抓住了你的手腕。[say: 全交给我吧，]她解释道，而你非常乐意从命——尤其是当她细小的手指在你的[skindesc]上挑逗，滑入你的衣服下，一寸一寸令人煎熬地向下滑动时。当冷空气第一次接触到你的[cock]时，一阵战栗传遍你的全身，当她的嘴唇拂过你，在龟头上印下最轻柔的吻时，你花了[if (cor >= 50) {你甚至不知道自己拥有的控制力|你所有的控制力}]才保持冷静。[pg]当她站起身时，她的手指[if (isgoo) {按进你的史莱姆身体|[if (tailLeg) {顺着你的下腹部向上滑|顺着你的腿向上滑}]}]，她丝滑的触感让你[if (isgoo) {核心|脊背}]随着她手掌的每一次抚摸而发麻。}]说完，她停了下来，双手交叠在身前，保持着令人惊讶的静止。你[if (corrupt) {不在乎|不确定}]为什么，但话又说回来，除了你那因未满足的需求而跳动的紧绷肉棒之外，你很难集中注意力在其他任何事情上。当她的嘴终于张开时，你满脑子想的都是它的温暖包裹着你，当她拂过你所有最敏感的地方时，它包裹着你的肉棒。");
               outputText("[pg][say: 你可以，嗯，解开我。]她一说完就移开了视线。[say: 如果你想的话——]");
               outputText("[pg]她只来得及发出一声惊讶的尖叫，你就已经压在了她身上，双手顺着她的身体摸索，疯狂地寻找进入的方法。没有找到，你被欲望冲昏头脑的大脑决定自己创造一个，几乎没有意识到身下扭动的女孩。当你抓住她的衣服时，她[if (tallness <= 60) {在你的重压下|徒劳地}]挣扎着，你的手指直到听到她惊慌失措的声音才停下来。");
               outputText("[pg][say:别撕坏它，]她哀求道，试图用双手遮住自己。");
               outputText("[pg][if (corrupt && hasclaws) {可惜，晚了。你已经不想再等了，长着利爪的手一挥，便在布料上撕开一道参差的裂口，顺势将它扯碎，完全不理会身下她的呜咽。你从她[if (tallness > 60) {娇小的}]身体上剥下那些破碎布片时，她的[aliceeyes]眼睛从帽檐下瞪着你；但你的爪尖只是在她皮肤上轻轻一压，似乎就让她明白了自己究竟有多脆弱。|[if (corrupt) {你不情不愿地|你低声道着歉，}]扶她站起身，急切地看着她没怎么磨蹭便脱下裙子，又把叠好的衣物放进包里。}]");
               outputText("[pg]当你打量着眼前的景象时，很难不注意到她[aliceskin]肌肤上健康的光泽——首先映入眼帘的是她那可爱的[if (!ischild) {年轻}]脸庞。当你拉近距离，[if (tallness <= 60) {凑近|俯下身}]去吻她时，她的嘴唇上浮现出一丝[if (corrupt && hasclaws) {不安的|羞涩的}]微笑。她回应得如此之快，让你有些措手不及，她轻咬并挑逗着你的下唇，拼命地想要品尝更多你的味道。她的热情[if (corrupt) {令人振奋，当你想象着她[if (cocklength >= 12) {被你的长度噎住|在你滑入时呻吟}]，她那紧致的小穴在你一次次深入的抽插中榨干你所有的精华时，你的[cock]只会变得更硬。为什么不能每个人都这么早就认清自己的位置呢？|[if (!ischild) {有些令人担忧，不过当你|甚至超过了你自己的热情，当你}]她把你拉得更近，双臂环抱住你的后背，仿佛永远不想放开你时，你很快就忘记了这一点。}]");
               outputText("[pg]当你终于设法抽身时，她紧紧地抱住你，[if (tallness <=60) {依偎在|挂在}]你身上，让你喘口气。当你不得不[if (tallness <= 60) {放开她|把她放下来}]时，她微微撅起嘴，但当你的手指轻轻划过她的肋骨时，她脸上的不满立刻烟消云散——尤其是当你的手指滑过她[if (!ischild) {那美味的、尚未发育的}]胸部，并轻轻捏住她的一侧乳头时。事实上，你几乎可以把那声音称为呜咽，你毫不犹豫地将另一侧乳头含入嘴中，用舌头挑逗着每一寸，试图从她口中诱哄出更多甜美的声音。");
               outputText("[pg]她的呼吸一急促起来，你就退开些，一边享受着鼻间萦绕的那股奇异的土壤气息，一边看着她扭动身体。不会太久——[if (corrupt) {毕竟你也有自己的需求|你还没残忍到那种地步}]——但也足够让她在期待中微微发颤，等你的[cock]挤进她的双腿之间，被她柔软的肌肤和湿润的内裤美妙地包裹住。每一次缓慢的挺动，都让你在与她摩擦时咬紧牙关；而[if (isgoo) {她的双手陷入你胸口的触感|她的指甲划过你胸口带来的刺痛}]，更让你每一次颤抖的呼吸都燃起同样的热意。那股热意充满了你的全身，化作一阵吞噬般的饥渴，只想把她拉进怀里，将她彻底据为己有。");
               doNext(rentAnAliceCock);
            }
            else
            {
               outputText("你手指的每一次触碰，都让她那双明亮的[aliceeyes]眼睛睁得更大了。如果你非要猜的话，那也许是惊讶，但其中还夹杂着一种不确定的渴望，让你想要紧紧抱住她，抚摸她的头发，同时[if (corrupt) {让她帮你发泄|带她体验欢愉}]。她看起来如此[if (ischild) {害羞|年轻}]，让你不禁怀疑这是否是她第一次和[if (isfeminine) {[if (ischild) {另一个女孩|一个女人}]|像你这样的[if (ischild) {男孩|男人}]}]在一起。");
               outputText("[pg]也许真是这样，而当她[if (ischild) {在你把她拉近、直到她的帽檐抵在你头顶时紧张地笑出声来|在你的触碰下轻颤，被你抬起下巴朝向你自己}]时，这只会让她显得更加[if (ischild) {可爱|诱人}]。你用一根手指顺着她的脸颊滑下，她比你想象中还要柔软，肌肤已经因羞赧与情欲交织而泛起诱人的红晕。你俯身靠近时，她的呼吸变得急促；尽管她[if (ischild) {先前还有些犹豫|年纪摆在那里}]，此刻却已经如此渴望，以至于你的嘴唇只是轻轻擦过她的唇，就让她发出一声细小的呜咽。");
               outputText("[pg]然而，这对你来说还不够；当你的指尖沿着她颈间敏感的肌肤一路向下时，她[if (tallness > 60) {娇小的}]身体更紧地贴上你，你把[if (corrupt) {你想要她回报给你的|她应得的}]全部爱意都倾注在她身上。每当你稍作停留，她都会用力咽一下口水；当你找到她的脉搏时，那跳动[if (!corrupt) {几乎和你的一样剧烈|带着毫不掩饰的兴奋}]。[if (corrupt) {不管她怎么试图伪装，她的身体都在诉说着另一套真相|尽管她先前还有些迷茫，但看着她在你的触碰下逐渐沦陷，你的心里不禁涌起一阵自豪}]。");
               outputText("[pg]当你的手指沿着她的侧身游走，隔着礼服丰润的布料描摹她[if (!ischild) {尚未发育成熟的}]身体时，她在你的唇间轻轻发颤。她身上散发出的暖意几乎有了实体，像厚重闷湿的热浪一阵阵涌过来，让[if (hasplainskin) {你的皮肤泛起潮红|你的身体阵阵酥麻}]，也让你的思绪在每一次触碰中变得朦胧。可当你吸入她那清新而纯净的气息时，你实在很难去在意这些。你从没想过自己会遇见一个[if (ischild) {与你同龄|年纪小到足以当你[if (isteen) {妹妹|[if (iselder) {孙}]女儿}]的人}]，但如今她就在你的怀里，双唇因期待而微微颤抖，目光[if (tallness > 60) {仰起}]望进你的眼中，你知道，从来没有什么事像此刻这样理所当然。");
               outputText("[pg]你克制着自己，没有立刻屈服于不断高涨的欲望，而她每一次呼出的气息都轻轻拂过你的[skinshort]，让你感到一阵酥痒。席卷全身的热度似乎随着时间的推移而不断攀升，在短暂而美妙的一瞬间，这种热度被她唇间的甜蜜所取代。仅仅一秒钟后，她便抽身离去，但你却无法感到懊恼，因为她的双臂[if (isgoo) {陷入了你的背部|紧紧环抱住你的背部}]，将你拉入更深的拥抱。然而，与她那轻微的、带着喘息的叹息相比，这一切都显得黯然失色。随后，她[if (!ischild) {向上伸展身体，}]主动迎合你，她那轻柔如羽毛般、却绝不单纯的每一个吻，都[if (lib < 50) {点燃了你的身体|让你那" + (get_player().get_race() == "human" ? "非人的" : "不自然的") + "欲望越烧越旺}]。");
               outputText("[pg]当你终于退开时，她整张脸都烧得通红，那双[aliceeyes]眼眸比以往任何时候都更加明亮、炽热。她身后的整个世界仿佛都模糊成一片浑浊的水影，反倒让她那[if (ischild) {纤细|娇小}]的身形以水晶般清晰的轮廓映入你眼中。你的视野里只剩下她——也只[i:需要]看见她——你的手指朝她身前探去，沿着她肋骨的起伏缓缓描摹，随后滑过她[if (!ischild) {初绽的}]胸口。你需要感受她，让双手抚过她柔软而细嫩的肌肤，听着她的呼吸随着每一次触碰而变得急促，直到你像了解自己的身体一样了解她，才肯停下。");
               if(get_player().isNaked() && get_player().get_armor().get_id() != get_armors().VINARMR.get_id())
               {
                  outputText("[pg]仿佛她也生出了同样的念头，她[if (tallness <= 60) {朝你瞥来|抬头看向你}]，目光贪婪地扫过你裸露身体的每一寸，那份渴望[if (ischild) {[if (lib >= 50) {足以与你自己的欲望匹敌|远远超过你自己的欲望}|[if (!corrupt) {出现在她这个年纪的人身上多少有些令人担忧|是你从未想过会在她这个年纪的人身上看到的}]}]。");
               }
               else
               {
                  outputText("[pg]她的手指迟疑地落在你的[armor]上。");
                  outputText("[pg][say: 呃，我……] 她咽了咽口水，脸一秒比一秒更红。[say: 让我来……]");
                  outputText("[pg]那两个词轻得几乎只是耳语，却足以在你向她招手回应的瞬间，让整个世界都安静下来。");
                  if(get_player().get_armor().get_id() == get_armors().VINARMR.get_id())
                  {
                     outputText("[pg]她的触碰起初有些犹豫，指尖轻轻拂过覆盖在你[skindesc]上的黑曜石藤蔓，随后她明显有些困惑地缩回了手。");
                     outputText("[pg][say: [Mister]，嗯……] 她停顿了一下，轻轻拉扯着你身上绳索般的束缚物。[say: 它们卡住了。]");
                     outputText("[pg]你点点头。它们是……你身体的一部分，你最终决定这么说，觉得这听起来比寄生虫更顺耳——而且没那么像传染病。");
                     outputText("[pg][say: 啊……] 她的目光落在了" + (get_armors().VINARMR.saveContent.armorStage != 0 ? "点缀在你那勉强算是衣服上的彩色花朵上。[say: 它们真漂亮……]" : "你暴露的身体上。[say: 所以你已经……]"));
                  }
                  else
                  {
                     outputText("[pg]她的手在你的[skindesc]上轻轻拂过，带来一阵痒意，这是你收到的唯一警告，随后你的[armor]滑落，让你一丝不挂。当你们四目相对时，她眼中的饥渴显而易见，并且[if (!corrupt) {让你感到十分紧张|只会让你更加兴奋}]。");
                  }
               }
               doNext(rentAnAliceYuri);
            }
         }
         else
         {
            outputText("[if (paid) {你把[if (gems == 0) {身上所有的宝石都交给了她，心里对未来的财务状况感到有些不安。|宝石交给了她，[if (cor < 50) {帮了她之后，你的心情轻松了一些。|希望这钱花得值。}]}]}]");
            outputText("[pg][say: 都在这里了。] 当她向你走来时，她的笑容[if (cor < 50) {很有感染力|有一种奇怪的吸引力}]，让你很难不感到心情舒畅。[say: 一个拥抱，马上就来。]");
            outputText("[pg]第一次接触——她的双臂环绕着你的身体，轻轻地挤压着，将你拉入她的温暖之中——似乎抽走了你所有的烦恼，当你回抱她时，你的心变得柔软而轻盈。靠得这么近，她甜美的花香萦绕在你的鼻尖，她[if (!ischild) {充满青春活力的}]热情让你觉得世界[if (cor < 50) {站在你这边|尽在你的掌握之中}]。");
            outputText("[pg]你可以在这里待上一整天，沐浴在她的温暖中，享受着当你的手停在她的背上时她发出的叹息。这很平静，几乎就像你回到了英格纳姆，远离了所有的责任和[if (!builtcabin && silly) {不幸的众所周知的}]门外的恶魔。");
            outputText("[pg]尽管感觉很舒服，但你知道你还有自己的营地要照顾，所以当她开始退开时，你只多抱了一小会儿。");
            outputText("[pg][say: 随时欢迎你再来。] 她的手指划过你的手掌，有那么一瞬间，她拥抱中所有令人舒缓的温暖再次掠过你的全身。[say: 我随时都有拥抱可以给你。]");
            outputText("[pg]你[if (cor < 50) {向她道谢|告诉她你会考虑的}]，然后跋涉回营地，感觉[if (cor < 50) {出奇地轻松|自己无所不能}]。");
            aliceCorruption(get_allowChild() ? 15 : 0);
            doNext(get_camp().returnToCampUseOneHour);
         }
      }
      
      public function rentAnAliceLook() : void
      {
         outputText("[pg]为了稳妥起见，你迅速挪动位置以便看得更清楚。据你观察，她[if (ischild) {和你年纪相仿，你忍不住想她是不是也是个勇者|是个小女孩，尽管你无法理解她为什么会在这里}]。尽管身处荒郊野外，她却穿着带褶边的连衣裙，戴着一顶软边帽，大概是希望这些能保护她免受烈日暴晒。她身边放着一个小包，里面装的什么不得而知。");
         if(get_allowChild())
         {
            dynStats(DynStat.Lust(10));
         }
         addButtonDisabled(0,"观察");
      }
      
      public function rentAnAliceLeave() : void
      {
         outputText("[pg]她一个人似乎过得挺好，而且你怀疑[if (ischild) {另一个|一个}]孩子在你的旅途中也帮不上什么忙。你转过身，向营地走去。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function rentAnAliceHugMore() : void
      {
         var _g:AliceScene;
         outputText("[pg]当你告诉她你改变主意时，她的笑容充满了令人不适的掠夺性。[say: 当然，[Mister]。]");
         lewd = true;
         dynStats(DynStat.Lust(10));
         _g = this;
         doNext(function():void
         {
            _g.rentAnAlicePay();
         });
      }
      
      public function rentAnAliceHugBack() : void
      {
         clearOutput();
         outputText("你摇摇头，告诉她你改变主意了。虽然她对你的选择似乎有些惊讶，但她什么也没说。");
         lewd = true;
         rentAnAliceApproach();
      }
      
      public function rentAnAliceHug() : void
      {
         var _g:AliceScene;
         clearOutput();
         outputText("你告诉她你只想要一个拥抱，她困惑地看着[if (isnaked) {你暴露的身体|你}]。");
         outputText("[pg][say: 就这样？] [if (isnaked) {她靠近时，目光从未离开过你。[say: 可是你已经脱光了……] }]她摇了摇头，似乎[if (isnaked) {想理清思绪|难以置信}]。[say: 如果这就是你想要的……]");
         outputText("[pg][say: 一个拥抱，还是二十颗宝石。] 她的目光与你交汇，显然是在试探你的反应。[say: 所以如果你想要更多……]");
         lewd = false;
         dynStats(DynStat.Lust(10));
         menu();
         _g = this;
         addNextButton("支付",function():void
         {
            _g.rentAnAlicePay();
         }).hint("你只想要一个拥抱。").disableIf(get_player().get_gems() < 20,"你付不起。");
         addNextButton("太贵了",rentAnAliceTooMuch).hint("[if (gems < 20) {你付不起|你绝对不会付那么多钱}]");
         addNextButton("更多",rentAnAliceHugMore).hint("不妨物尽其用。").disableIf(get_player().get_gems() < 20,"你付不起。");
         setExitButton("算了",rentAnAliceHugBack).hint("你宁愿做点别的。");
      }
      
      public function rentAnAliceDontCum() : void
      {
         clearOutput();
         outputText("你咬紧牙关，用尽你能鼓起的所有克制力，在她把手移开时保持在边缘。汗珠在你的[skinshort]上凝结，当她柔软的指尖拂过你的长度，然后终于退开时，你艰难地咽了一口唾沫。");
         outputText("[pg][say: 我，嗯……知道你想……]她的手顺着她的肚子滑下，当她探入她的[alicepantieslong]内裤下方时，你的呼吸因期待而加快。她纤细手指的每一个动作在布料后面都清晰可见，当其中一根手指陷入她的深处并拖出一声颤抖的呻吟时，一阵颤栗传遍了你的全身。[say: 所以，嗯……]");
         outputText("[pg]当她慢慢脱下内裤时，她安静了下来，当你看到[if (!ischild) {她赤裸、紧致得要命的裂缝|下面隐藏的东西}]时，你的脑海中默默地咒骂着你的尺寸，绝望地想要你得不到的东西。当她跨出内裤时，你的眼睛与她的眼睛锁在一起，你的[cock]颤抖着，你尽量不去想你面前的[if (!ischild) {小|裸体}]女孩。不去想她的乳头如何从她刚刚发育的胸部凸出。不去想她如何偷偷看你，显然梦想着将你纳入体内。");
         outputText("[pg]绝对不去想她的[alicepanties]内裤如何包裹着你的肉棒，像手套一样抚摸和榨取你。");
         outputText("[pg]它们也是湿润的，她情欲的温暖、光滑的感觉贴着你的[skinshort]，将你带回了边缘。当她套弄你的[cock]时，布料像天鹅绒般的手一样紧紧抓住你，随着她越来越快，她的身体颤抖得几乎和你一样厉害。单是气味就几乎要把你推向高潮，但正是她饥渴的[aliceeyes]眼睛[if (tallness > 60) {抬头}]盯着你，热切地等待着你的释放，最终打破了你的决心。伴随着最后一次颤抖的抽插，你爆发了，用你的精液弄脏了她的内裤[if (cumhighleast) {，直到它渗出并滴到地上}]，只有当世界似乎恢复正常，你的高潮平息时才停止。");
         outputText("[pg][say: 让我感受你，]她低语着，嘴唇凑近拂过你的[skinshort]。她的手仍在按摩你的长度，随着你肉棒的每一次跳动，她的笑容越来越灿烂。感觉你似乎没有什么可以给的了，但她从未放开你，显然打算哄出最后一滴。当她放开你时，你几乎无法[if (singleleg) {保持直立|站立}]，你的[if (singleleg) {身体|双腿}]虚弱，你的[if (hasballs) {[balls]|[cock]}]完全耗尽。当她再次拉起她的[alicepanties]内裤时，一阵颤栗顺着她的脊椎滑下，你担心这个可怜的女孩在将你的精液压入她的幽谷时会因兴奋而晕倒。随着她手指的每一个动作，她都会发出小声的喘息，当她注意到你盯着她看时，她变成了一种可爱的红色。");
         outputText("[pg][say: 嗯……谢谢，[Mister]，]她嘟囔着，呼吸沉重地开始走开，几乎不记得捡起她的衣服[if (paid) {和宝石}]。");
         outputText("[pg]虽然你不确定这是否是你当时所期望的，但你不可否认，对于[if (ischild) {你这个年纪的人|一个孩子}]来说，她的技术出奇地好。即使现在你的[if (singleleg) {身体仍在颤抖|双腿仍在颤抖}]，这也让你更难[if (!isnaked) {穿好衣服并}][walk]回营地。");
         get_player().orgasm("Dick");
         aliceCorruption(15,true,true);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function rentAnAliceDonate() : void
      {
         clearOutput();
         outputText("你[if (gems > 20) {数出二十颗宝石放进|把你所有的宝石都倒进}]她等待的袋子里。你还没来得及[if (gems <= 20) {收起空袋子|合上宝石袋}]，她就开始脱衣服了，但你放在她肩膀上的手[i:谢天谢地]阻止了她。");
         outputText("[pg][say: 哦。] 她把衣服穿好，冲你笑了笑。[say: 你更喜欢我穿着衣服吗？]");
         outputText("[pg]不——好吧，是的——但她什么都不需要做。你只是[i:给]她宝石。你很确定地指出，你没有买任何东西。小女孩[if (tallness <= 60) {看着|抬头看着}]你，脸上闪过一丝困惑，双手尴尬地抚平裙子。[say: 这不好，] 她喃喃自语道。[say: 你应该得到一些回报才对。]");
         outputText("[pg]几秒钟后，她带着重新燃起的决心挺直了身子。[say: 也许只要一点点？]");
         outputText("[pg]这就够了。你转过身，把宝石留给了她。即使她不明白你的好意，至少[i:你]知道自己做了一件好事。");
         var _loc1_:Player = get_player();
         _loc1_.set_gems(_loc1_.get_gems() - 20);
         dynStats(DynStat.Cor(-2));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function rentAnAliceCum() : void
      {
         clearOutput();
         outputText("你做不到。一旦她释放了压力，一切都结束了。无论你多么努力地想要阻止它，你即将到来的高潮已经让你兴奋得发抖，你的手似乎不受控制，松松地握着你的[cock]，甚至没有力气去挤压。她的嘴唇诱人地靠近，当你寻找它们时，它们柔软的温暖充满了你的脑海，每一次匆忙的抽插都将你的欲望涂抹在她的脸颊上。你靠得太近了，她的皮肤太柔软了，让你无法克制，所以伴随着最后一声呻吟，你将自己交给了快感。");
         outputText("[pg]当你的第一股精液喷出时，你的身体因如释重负而颤抖，当她用脸接住它时，她惊讶地眨了眨眼，但你知道[if (cumhighleast) {你才刚刚开始|还有更多}]。下一股喷射在她的帽子上，当它滴落到她[if (!ischild) {平坦的}]胸部时，一阵颤栗传遍了她的全身。[if (!cumhighleast) {甚至她|她}]的[alicehair]头发被染成了乳白色[if (cumhighleast) {，因为[if (hasballs) {你的蛋蛋排空了自己|你排空了自己}]，泵出越来越多，直到" + (get_currentAlice().skin.tone == "milky-white" || get_currentAlice().skin.tone == "fair" ? "她被你的精液覆盖" : "甚至她的[aliceskin]皮肤也变得苍白") + "。|到你终于结束的时候。}]");
         outputText("[pg]她[if (!ischild) {小巧的}]手将脸擦干净，然后伸进嘴里品尝你的味道。她唇边泛起的微笑让你的[cock]跳动，当她[if (ischild) {看|抬头看}]向你时，灿烂的红晕蔓延到她的脸颊。尽管她很尴尬，但她还是靠得更近了，当她的嘴再次包裹住你敏感的龟头时，她的眼睛害羞地移开了。只有当你完全干净时，她才将你从她的嘴唇中释放出来，即使她[if (isnaked) {拿起她的包|把你的[armor]递给你}]并站起身来，她最后的吻在你的[skinshort]上依然温暖。");
         outputText("[pg]伴随着最后一次挥手告别，她转身走向附近石头的阴影处。她缓慢而从容的步伐让你有充足的时间观看[if (!isnaked) {你穿衣服的过程}]，你发誓她在消失在视线中之前对你露出了微笑。回到营地的旅程从一个摇晃的[if (singleleg) {动作|步伐}]开始，你的身体仍然沉浸在快感中。");
         outputText("[pg]只有当你走到一半时，你的[skinshort]才停止刺痛。对于[if (ischild) {你这个年纪的人|一个孩子}]来说，这已经很不错了，你不得不承认。");
         get_player().orgasm("Dick");
         aliceCorruption(15,true,true);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function rentAnAliceCock() : void
      {
         var cockIndex1:int;
         var _g1:Player;
         var cockIndex:int;
         var _g:Player;
         clearOutput();
         var _loc1_:int = get_player().cockThatFits(12,"length");
         _g = get_player();
         cockIndex = _loc1_;
         registerTag("cock",TagFun_Impl_.fromStringFun(function():String
         {
            return _g.cockDescript(cockIndex);
         }));
         if(_loc1_ < 0)
         {
            _loc1_ = get_player().longestCock();
            _g1 = get_player();
            cockIndex1 = _loc1_;
            registerTag("cock",TagFun_Impl_.fromStringFun(function():String
            {
               return _g1.cockDescript(cockIndex1);
            }));
            outputText("但你做不到。即使你头脑发昏，你也意识到了这一点。她跨坐在你巨大的阴茎上，随着她身体的每一次移动，将它压在她的入口处，并涂抹着她溢出的淫液——这已经是你能做到的极限了。她的大腿夹紧你，随着她的前后滑动挤压和榨取你，让你[if (isgoo) {身体颤抖|[if (tailLeg) {尾巴颤抖|双腿颤抖}]}]，因为她把你推向了边缘。你的[if (hasballs) {[balls]|体内}]翻腾着，疼痛着，[i:乞求]你释放你的种子，但你还没有结束。");
            outputText("[pg]你深吸一口气，放慢了速度，当你把这个困惑的女孩扶到地上时，你慵懒的抽插终于完全停止了。她那充满欲望的眼睛茫然地向前盯着，但当你[if (tallness <= 60) {[if (!corrupt) {引导|推}]她跪下并}]把你的[cock]压在她的嘴唇上时，她很快就明白了你想要什么。没过多久，她的嘴唇就分开了，在你的龟头上轻轻地吸吮了几下，然后她的舌头在你的龟头周围游走，用她温暖湿润的唾液包裹着你。当她按摩你的[if (hasballs) {蛋蛋|肉棒}]时，一声[if (isNaga) {嘶嘶声|呻吟}]从你的喉咙里撕裂出来，她[if (tallness > 60) {小巧的}]手威胁着要把你的精液挤出来。");
            outputText("[pg]轻微的移动是你唯一的警告，然后她把你含进嘴里，让那种包容的、令人窒息的温暖越来越低，直到你能感觉到自己在摩擦她的喉咙，这个[if (ischild) {急切的|小}]女孩尽可能多地把你含在里面，直到她慢慢地、毫不费力地退开，让你光滑的肉棒在冷空气中刺痛。你的第一次抽插比较浅，但同样强烈，当她把你吸回去时，她的舌头在你敏感的下侧挑逗着。当你摘下她的帽子，手指穿过她丝滑的[alicehair]头发，抓住你能找到的任何东西来唤回你的欲望时，她似乎并不在意。当她把你更深地吞进嘴里时，你的视线颤抖着，你的手紧紧抓住她的头皮，同时体内的压力不断增加，当你努力坚持时，你的呼吸变得急促而不稳定。");
            if(!(get_player().cor >= 50 || get_player().get_lust() == get_player().maxLust()))
            {
               outputText("[pg]太迟了。她一定感觉到了，即使你的肉棒因期待而抽搐，她的嘴唇也从你身上滑落，当她的手紧紧抓住你的长度并拒绝你的释放时，你几乎要呻吟出声。随着她手指每一次缓慢得令人痛苦的抽动和挤压，她的笑容似乎都在扩大，你毫不怀疑她喜欢她对[if (ischild) {你|[if (isteen) {一个年长的[boy]|一个成年的[man]}]}]所拥有的权力。");
               outputText("[pg][say: 还没完，]她对着你的肉棒低语，即使她的嘴唇最轻微的触碰也威胁着要把你推向边缘。");
               outputText("[pg]一旦她的握力开始松动，你的呼吸就会颤抖，她很快就握得更紧了，让你[if (hasballs) {[balls]|勃起的肉棒}]因绝望而跳动。[say: 为我忍住，]她说，她的舌头在龟头周围短暂地打转，你什么都想做，就是不想忍。[say: 求你了……]");
               menu();
               addNextButton("内射",rentAnAliceCum).hint("你已经受不了了。");
               addNextButton("忍住",rentAnAliceDontCum).hint("尽可能地忍耐。");
               return;
            }
            outputText("[pg]太迟了。她一定感觉到了，随着你即将到来的高潮涌遍全身，她向后退去，但你绝不允许这样。你[if (paid) {付钱雇了|正在使用}]她，如果[i:她]认为她能决定你射在哪里，那你就是个傻瓜。[if (!ischild || str >= 50) {你强壮的手臂|你用尽全力}]环绕着她的头，把她拉向你，直到你的肉棒猛地撞进她的喉咙深处。她的哭喊声在你的肉棒周围消失了，被你一次又一次的抽插所淹没，你迷失在你的[if (!ischild) {小}]荡妇嘴巴的快感中。那双惊恐的[aliceeyes]眼睛把你推向了边缘，随着最后一次抽拉，你尽可能多地用你巨大的长度填满她，让她的喉咙紧紧包裹着你的[cock]，同时一股颤抖的、刺痛的热流撕裂了你的全身。");
            outputText("[pg]当你的第一股种子射入她的喉咙时，她挣扎着干呕，你享受着她的身体紧紧包裹着你的感觉。她所有的抵抗所能做的就是抽出你更多的精液，当你的下一批精液溅在她的嘴里时，你深情地抚摸着她的头发作为感谢。[if (cumhighleast) {你[if (cumveryhighleast) {还差得远呢|还没完呢}]，不过，每次你把精液卸在她的喉咙里，她的反抗就会减少，当你的高潮终于结束时，这个[if (!ischild) {小}]女孩无力地挂在你疲软的肉棒上。|她颤抖的身体并没有停止紧握你，即使你已经空了，每一次抽搐都给你敏感的龟头带来更多的快感。}]");
            outputText("[pg]当你从她的嘴里滑出来时，你猛地吸了一口冷空气[if (cumhighleast) {，当你的精液从她嘴里滴落时，你满意地叹了口气}]。当你[if (singleleg) {转身|走开}][if (!isnaked) {，穿好衣服，}]并回到营地时，你那被充分使用的玩具昏迷着倒在地上。");
            outputText("[pg]你不得不承认，这是消磨[if (paid) {一些宝石|一个小时}]的好方法。");
         }
         else
         {
            outputText("不过，你想好好享受这一刻，所以你继续在她滑腻的阴唇上摩擦，每一次抽插都让你沾上越来越多的淫液。她发情的味道在空气中弥漫，你觉得你不能再等了。你需要感觉到[if (ischild) {她|那美妙的年轻紧致}]包裹着你的[cock]，将她撞向你的臀部，直到[if (!corrupt) {她可爱的娇喘声充满你的耳朵|她像个荡妇一样乞求你的精液}]。");
            outputText("[pg]当你的动作慢下来时，困惑掠过她的脸庞，她迷糊的头脑显然太分散注意力了，以至于没有意识到你为什么停下来。不过，这[if (!corrupt) {没关系|不关你的事}]，因为当你把她[if (!corrupt) {放|扔}]到地上并[if (!corrupt) {分开|拉开}]她的双腿时，她[if (!corrupt) {似乎明白了|清醒了过来}]。只有她那沾满污渍的[alicepanties]内裤将你的肉棒与目的地隔开，即使从这里也能明显看出她的湿润。当你用手指顺着布料向上滑，并用力按压到足以感受到她的热度时，她扭动着身体。");
            outputText("[pg]当你滑入布料下方并顺着她的大腿内侧向上抚摸时，她的双腿因[if (!corrupt) {渴望|恐惧}]而颤抖，你的触摸慢得足以让她因[if (corrupt) {她可耻的}]需求而呜咽。她腹部的起伏让人毫不怀疑[if (!corrupt) {她的兴奋|她知道接下来会发生什么}]，当你把她的内裤滑到一边，让她闪闪发光的阴唇[if (!ischild) {赤裸地}]展现在你面前时，她[if (!corrupt) {扭动着她[if (!ischild) {小巧的}]臀部|紧张起来}]。");
            outputText("[pg]她因渴望而涨红了脸[if (corrupt) {，尽管她嘴上那么说}]，你靠得更近，吸入她[if (!ischild) {年轻的}]气味，同时舔舐她的淫液，你的舌头每一次刷过她的阴唇都会换来[if (!corrupt) {一声轻喘|大腿的收紧}]。她的小阴蒂呼唤着你的触摸，当你的手指刷过它时，[if (!corrupt) {她全身都在颤抖|她再也忍不住呻吟起来}]。她的味道[if (ischild) {超乎你的想象|[if (!corrupt) {如天堂般美好，一种你无法抗拒的纯粹甜美|罪恶般美味，每一滴都充满了失去的纯真}]}]，你需要[if (!corrupt) {所有的意志力|肉棒日益增长的需求}]才能将自己拉开。");
            outputText("[pg][say: 求你……]她低语道，她的声音带着喘息，心不在焉，当她的双腿试图抱紧你时，她乞求着。[say: 进来……]");
            outputText("[pg][if (!corrupt) {你不是那种会拒绝这种提议的人|她们转变态度的速度真可爱}]，当你将自己对准她的入口时，她的身体[if (!corrupt) {在明显的挫败感中|就像她知道自己属于哪里一样}]在你身上摩擦。她嘴唇刷过龟头时那如天鹅绒般的触感比你想象的[if (!corrupt) {还要}]柔软，你几乎无法阻止自己插进去。不过，你想[if (!corrupt) {让她享受它|细细品味它}]，当你[if (!corrupt) {抚摸|分开}]她的大腿时，她呜咽的样子只会让你变得更硬。");
            if(get_player().cor >= 50 || get_player().get_lust() == get_player().maxLust())
            {
               outputText("[pg]如果她那么想要，你很乐意效劳，你伸出手将她的肩膀按[if (ischild) {下|在你的重量下}]，她的眼睛睁得大大的。你不得不怀疑，她期待的是什么，因为她在你身下扭动，她微弱的力量不足以[if (ischild && str < 30) {推开你|让你让步}]。她的每一次挣扎都用她的淫液涂抹你的[cock]，她阴缝的每一个甜蜜的吻都让你更难忍住不插进去。");
               outputText("[pg]毕竟，她的身体在呼唤你，说着她不敢说出口的话，你又是谁，凭什么拒绝呢？");
               outputText("[pg]当你猛地把她拉向你，分开她的阴唇，用一次野蛮的抽插深深刺入她的深处时，她的哭喊声与你满足的呻吟声混合在一起。她温暖、湿滑，像柔软的皮革一样包裹着你，她的抵抗只会让她变得更紧，当她紧紧裹住你的长度时，她的肉壁紧紧抓住并挤压着你。当你再次抽插，你的臀部与她的臀部相遇，你完全、光荣地滑入她体内时，她颤抖的声音充满了你的耳朵。");
               outputText("[pg]低头一看，她[aliceeyes]的眼睛里闪烁着泪光，这只会让她看起来更年轻。当你开始向后拉时，她甚至没有力气反抗，但她那脆弱[if (!ischild) {、小巧}]的身体知道它想要什么，拼命地依附着你，为了吞下你最后一滴精液。她甚至到了可以生孩子的年龄了吗[if (ischild){——话又说回来，你到了吗}]？");
               outputText("[pg]这并不重要。你抓住她的腰，尽可能深地向前推，你的[if (hasballs) {[balls]拍打着她|臀部与她的臀部相遇}]，因为她一次又一次地吞下你所有的长度。当你将自己完全插入时，她的抽泣声在你的耳边回荡，大到足以掩盖皮肤拍打[skinshort]的声音。也许她[if (paid) {没想到你会觉得物有所值|如果她要抱怨的话，就不应该提供免费的性服务}]，但现在唯一重要的是你肠胃里逐渐积聚的熟悉热量。");
               outputText("[pg]她现在一定也感觉到了，她的肉壁紧紧夹住你，尽最大努力哄骗出你的精液。每一次你陷入她深处的难以置信的紧致中，都会让你的[if (singleleg) {手臂|双腿}]颤抖，她的身体也会颤抖，你几乎找不到理由克制自己，加快速度，直到你的汗水溅到她的肚子上，你的[cock]在她体内跳动。当你更用力地压住她时，你似乎从内心燃烧起来，确保她无法逃脱，因为你的第一股精液溅在她的内壁上。");
               outputText("[pg]当你在她体内排空自己时，你们俩都大叫起来，[if (cumhighleast) {即使她被完全填满也没有停下来|倾注你所拥有的一切}]。不过，她仍然想要更多，贪婪地榨取你，直到你被榨干的身体只能勉强进行几次微弱的抽插。当你瘫倒在她[if (!ischild) {平坦的}]胸膛上并试图喘口气时，你几乎感觉不到你的[legs]。当你躺在她潮湿的皮肤上时，她的心脏因兴奋而狂跳，你喜欢当你体内移动时她身上掠过的每一次不由自主的颤抖。");
               outputText("[pg]虽然你很想留在她的温暖中，但她变得有点软弱无力，而你还有事情要做。即使她似乎完全失去了意识，当你滑出时，你发誓她会轻声呜咽[if (cumhighleast) {，你的精液从她身上滴落，直到你|并}]把她的[alicepanties]内裤拉回原位。你不得不承认，她很可爱，特别是当你[if (singleleg) {跪下|放低自己}]将你的[cock]浸入她柔软的嘴唇之间，轻轻地插入她嘴里的热度，直到你完全干净。");
               outputText("[pg]你认为你不会从她那里得到更多，但你能想到更糟糕的方式来度过[if (paid) {几颗宝石|一个小时}]。在她的额头上留下最后一个吻后，你[if (!isnaked) {穿好衣服并}]把她留在身后，然后回到你的营地。");
            }
            else
            {
               outputText("[pg]你小心翼翼地向前移动，靠得更近，直到你感觉到她的热度在你的[cock]上，她的皮肤贴着你[if (hasplainskin) {的皮肤|的[skindesc]}]。她的颤抖让你毫不怀疑她有多想要这个，当她的阴唇在你周围分开时，她抬头看着你的眼睛。当你滑入更深处时，你们俩都无法呼吸，当你把她拉向你时，一寸一寸地慢慢消失在她的阴唇之间。");
               outputText("[pg]每一次刷过她肉壁丝滑的抓握都会让你不寒而栗，你把她害羞的微笑当作继续的信号。当你进一步放松自己时，你的手找到了她的臀部，当你完全沉入她的深处并低头看到她紧贴着你时，你简直不敢相信。不过，你不想伤害她，所以当你滑出来时，你放慢了速度，当她颤抖并紧紧抱住你时，你的呼吸变得急促。");
               outputText("[pg]当你再次与她对齐时，她轻轻地点了点头，这一次你一次抽插就沉入了她体内。当你触底时，她[aliceeyes]的眼睛闪闪发光，你几乎想拔出来，只是为了再次看到那一幕。不过，包裹着你的天堂般的热度给了你一个更好的主意，当你开始认真移动时，充满你耳朵的甜美声音告诉你这是正确的选择。即使她[if (ischild) {只比你大一点|只是个小女孩}]，你也从未发现有人能如此完美地适合你，从她灿烂的笑容来看，她一定也有同感。");
               outputText("[pg]当她双臂环住你的背，将你拉近时，也许这[if (ischild) {是命中注定的，特别是|是错的，但你无法让自己去在意}]。每一次抽插都让她颤抖得更厉害，而你自己的身体也好不到哪里去，你的[if (hasballs) {[balls]|[cock]}]已经紧贴着她跳动。她一定感觉到了，紧紧地抱住你，仿佛永远不想让你离开，但这没有必要。现在，你几乎想不出有什么比将自己埋在她渴望的幽谷中，让你们的欲望之声传遍荒原更好的事了。");
               outputText("[pg]你的肉棒在她体内抽动，渴望用你的精液填满她，你需要集中全部注意力才能克制住自己。即使只是用手抚摸她的身体两侧，也感觉会让你崩溃，所以你倾身向前，当你挺动臀部撞击她时，吻住了她[if (!ischild) {小巧的}]嘴唇。她的肉壁对你毫不留情，即使是最轻微的动作也在按摩着你，乞求着你的释放。伴随着最后一次冲刺，你将自己深深埋入她体内，臣服于她的抚摸。");
               outputText("[pg]她的头向后仰去，当她在你周围痉挛时，你们的声音交织在一起，榨取着你的一切，你将自己倾泻在她的深处。随着你肉棒的每一次收缩，滚烫、朦胧的快感席卷全身，她的身体不断地紧缩，直到[if (hasballs) {你的蛋蛋完全干涸|她榨干了你最后一滴精液}]。当你终于被榨干时，她的眼睛闪烁着明亮的光芒，当她再次吻你时，你几乎找不到力气靠近。即使是拔出来似乎也是一项不可能完成的任务，所以你决定放松地趴在她身上，听着她的心跳和轻柔的呼吸。");
               outputText("[pg]她温暖而亲近，这就是你现在所需要的一切，你们拥抱在一起，即使你慢慢地从她的大腿间滑出也不想放手[if (cumhighleast) {，你的精液从她的嘴唇滴落}]。她的手垂下，拉起她被弄脏的内裤，将其推回原位，将[if (cumhighleast) {剩下的|你的精液}]困在里面。");
               outputText("[pg][say: 嗯……谢谢，]她嘟囔着，当她扶你[if (singleleg) {起来|站起来}][if (!isnaked) { 并把你的[armor]递给你}]时，她的脸因尴尬而涨得通红。她甚至懒得穿好衣服就转身离开了，在滑到岩石后面之前，你有充足的时间欣赏[if (ischild) {这番景象|她年轻的身体}]。");
               outputText("[pg]你花了一点时间清理自己，[if (!isnaked) {然后穿好衣服，}]心满意足地回到营地。你能想到比这更糟糕的方式来度过[if (paid) {几颗宝石|一个小时}]。");
            }
         }
         get_player().orgasm("Dick");
         aliceCorruption(15,true,true);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function rentAnAliceApproachLeave() : void
      {
         clearOutput();
         outputText("难怪她这么急着见你：她显然不是乞丐就是小偷，而你不想留下来弄清楚到底是哪一个。你一只眼睛盯着她，另一只眼睛盯着你的[inv]，慢慢地[if (singleleg) {移动|后退}]，直到确定她没有跟上来，才转身回到营地。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function rentAnAliceApproach(param1:Boolean = false) : void
      {
         var _g:AliceScene;
         if(param1)
         {
            clearOutput();
            outputText("你走近了些，觉得她应该没什么危险。毕竟，能和同类交谈的机会并不多，错过这个机会就太傻了。她是英格纳姆来的吗？她是怎么到这儿的？当你向她[walk]去时，脑海中盘旋着各种问题。");
            outputText("[pg]女孩终于抬起头看到你时，朝你的方向挥了挥手，脸上已经洋溢着兴奋的神情。她[if (tallness <= 60) {和你差不多大，似乎也没有带武器|和你想象的一样娇小}]，这让你更加好奇她[if (ischild) {也}]是怎么来到这里的。你继续向前走去迎接她，但还没走到一半，她就已经紧紧抓着包向你跑来了。");
            outputText("[pg][say:你好，[Mister]。] 至少你觉得她是在这么说——她气喘吁吁的，很难听清她在说什么。[if (!allowchild || isgenderless) {[say: 二十颗宝石换一个拥抱？我保证这会让你开心一整天！]|[say: 我要二十颗宝石。]}]");
            outputText("[pg]她微笑着，满怀期待地伸出她的袋子。");
         }
         if(get_allowChild())
         {
            dynStats(DynStat.Lust(10));
         }
         menu();
         _g = this;
         addNextButton("支付",function():void
         {
            _g.rentAnAlicePay();
         }).hint("你绝对想要那个。").disableIf(get_player().get_gems() < 20,"你买不起。");
         addNextButton("太贵了",rentAnAliceTooMuch).hint("虽然你想要她，[if (gems < 20) {但你没有那么多宝石|但你绝不会付那么多钱}]。");
         addNextButton("提问",rentAnAliceQuestion).hint("问问她到底在卖什么。");
         addNextButton("拥抱",rentAnAliceHug).hint("你只想要一个拥抱。").hideIf(!lewd);
         setExitButton("离开",rentAnAliceApproachLeave);
      }
      
      public function rentAnAlice() : void
      {
         var output1:Boolean;
         var _g:AliceScene;
         var _gthis:AliceScene = this;
         spriteSelect(SpriteDb.get_s_alice());
         clearOutput();
         outputText("正当你快要放弃在这片无尽的荒野中找到任何有趣东西的希望时，一个[if (ischild) {令人不安地熟悉的|非常不寻常的}]景象引起了你的注意。在前方，一个[if (tallness > 60) {小}]女孩坐在路边，斜靠在附近一块岩石的阴影里。她似乎还没有注意到你。");
         registerTag("corrupt",TagFun_Impl_.fromBoolFun(function():Boolean
         {
            if(_gthis.get_player().cor < 50)
            {
               return _gthis.get_player().get_lust() == _gthis.get_player().maxLust();
            }
            return true;
         }));
         lewd = get_allowChild() && !get_player().isGenderless();
         saveContent.rented = true;
         menu();
         addNextButton("观察",rentAnAliceLook);
         _g = this;
         output1 = true;
         addNextButton("靠近",function():void
         {
            _g.rentAnAliceApproach(output1);
         });
         addNextButton("离开",rentAnAliceLeave);
      }
      
      public function randomAlice() : Alice
      {
         var _loc1_:WeightedChoice = new WeightedChoice().add("hazel",2).add("brown",2).add("blue",1).add("green",1);
         var _loc2_:WeightedChoice = new WeightedChoice().add("bronze",2).add("brown",2).add("auburn",2).add("blonde",1).add("black",1).add("red",1);
         var _loc3_:WeightedChoice = new WeightedChoice().add("milky-white",4).add("fair",3).add("olive",2).add("dark",1).add("ebony",1).add("mahogany",1).add("russet",1);
         var _loc4_:WeightedChoice = new WeightedChoice().add("white",4).add("striped",2).add("black",1);
         eyeColor = _loc1_.choose();
         panties = _loc4_.choose();
         var _loc5_:IMap = new StringMap();
         if("white" in StringMap.reserved)
         {
            _loc5_.setReserved("white","纯白的");
         }
         else
         {
            _loc5_.h["white"] = "纯白的";
         }
         if("striped" in StringMap.reserved)
         {
            _loc5_.setReserved("striped","可爱的条纹");
         }
         else
         {
            _loc5_.h["striped"] = "可爱的条纹";
         }
         if("black" in StringMap.reserved)
         {
            _loc5_.setReserved("black","黑色的蕾丝");
         }
         else
         {
            _loc5_.h["black"] = "黑色的蕾丝";
         }
         var _loc6_:String = panties;
         var _loc7_:StringMap = _loc5_;
         pantiesLong = _loc6_ in StringMap.reserved ? _loc7_.getReserved(_loc6_) : _loc7_.h[_loc6_];
         return new Alice(_loc2_.choose(),_loc3_.choose(),eyeColor,panties);
      }
      
      public function onAscend(param1:Boolean) : void
      {
         reset();
      }
      
      public function load(param1:int, param2:*) : void
      {
         Utils.extend(saveContent,param2);
      }
      
      public function get_skinTone() : String
      {
         return get_currentAlice().skin.tone;
      }
      
      public function get_hairColor() : String
      {
         return get_currentAlice().hair.color;
      }
      
      public function get_debugName() : String
      {
         return "Alice";
      }
      
      public function get_debugHint() : String
      {
         return "";
      }
      
      public function get_currentAlice() : Alice
      {
         if(_currentAlice == null)
         {
            generateAlice();
         }
         return _currentAlice;
      }
      
      public function generateAlice() : void
      {
         _currentAlice = randomAlice();
      }
      
      public function execEncounter() : void
      {
         generateAlice();
         canArouse = get_player().abilityAvailable(OneOf_Impl_.fromB(stealthArouse),{
            "ignoreLust":true,
            "ignoreFatigue":true
         });
         var _loc1_:int = Utils.countSetBits(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2697));
         var _loc2_:int = int(Math.min(15,3 * _loc1_));
         if(!saveContent.foxSeen)
         {
            _loc2_ *= 3;
         }
         if(saveContent.foxWatched)
         {
            _loc2_ *= 2;
         }
         if(saveContent.foxNeedArouse && canArouse)
         {
            _loc2_ *= 2;
         }
         if(canRent() && Utils.randomChance(get_allowChild() ? 50 : 100))
         {
            rentAnAlice();
         }
         else if(_loc1_ > 1 && (get_player().isInForest() || get_player().isInDeepwoods()) && _loc2_ > Utils.rand(100))
         {
            aliceFoxIntro();
         }
         else if(strayAkkyReady() && Utils.randomChance(50))
         {
            strayAkky();
         }
         else
         {
            aliceEncounter();
         }
      }
      
      public function encounterName() : String
      {
         return "alice";
      }
      
      public function encounterChance() : Number
      {
         if(get_allowChild() || canRent())
         {
            return 0.3;
         }
         return 0;
      }
      
      public function debugMenu(param1:Boolean = true) : void
      {
         get_game().debugMenu.debugCompEdit(saveContent,new SaveContent(null,null,null,null,null,null,null,null));
      }
      
      public function confrontMenu() : void
      {
         var _loc1_:Boolean = [2,3,8,9,12,14,25,26,28].indexOf(get_player().tail.type) >= 0;
         menu();
         addButton(0,"战斗",aliceNotNice);
         addButton(1,"交谈",aliceChatSelect);
         addButton(2,"尾交",aliceTailfuck).disableIf(!_loc1_ || get_player().get_gender() == 0 || get_player().get_lust() < 33,"需要足够的欲望，以及生殖器和合适的尾巴。");
         if(!get_player().isGenderless() || get_watersportsEnabled())
         {
            addNextButton("亲热",aliceIntimate).hint("她可能是个恶魔，但稍微靠近她一点应该也没什么大碍。").sexButton(-1);
         }
         addNextButton("哺乳",aliceNursing).hint("这个可怜的女孩只是需要喂食。").disableIf(!get_player().isLactating(),"你没有奶水喂她。");
         addNextButton("摸头",alicePatMenu).hint("有时候可爱的东西只需要摸摸头。");
      }
      
      public function chooseTreat() : ItemType
      {
         var _gthis:AliceScene = this;
         var _loc1_:Array = [get_consumables().LOLIPOP,get_consumables().NUMBROX];
         return Lambda.find(_loc1_,function(param1:ItemType):Boolean
         {
            return _gthis.get_player().hasItem(param1);
         });
      }
      
      public function canRent() : Boolean
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2698) == 0)
         {
            return !saveContent.rented;
         }
         return false;
      }
      
      public function bossyTrust() : void
      {
         clearOutput();
         outputText("无论她的计划是什么，你现在都会跟着。一个小女孩不太可能构成任何威胁，而且有她作为向导，你对这个陌生的地方感觉好多了。不过，你走得越远，就越不确定你来的方向。这种善意的举动可能会让你更加迷失。");
         bossyContinue();
         aliceCorruption();
      }
      
      public function bossyStop() : void
      {
         clearOutput();
         outputText("尽管她的手握着你的感觉很舒服，但如果没有一个解释，你是不打算顺从她的。她撅起嘴，握得更紧了。[say: 你不知道怎么回家；如果我不负点责任，你打算怎么办？]");
         outputText("[pg]你的眉头因为这句话而皱起，因为它不知怎么的听起来很真实。你回头环顾四周，发现没有足够熟悉的地方可以称之为来时的路。你确实迷路了。");
         bossyContinue();
         aliceCorruption();
      }
      
      public function bossySex() : void
      {
         clearOutput();
         if(get_player().hasCock())
         {
            outputText("这孩子再次将手按在你的腹股沟上，这次她性感地揉搓着你的[cocks][if (!isnakedlower) {，隔着你的[armor]}]。[if (!isNaked) {[say: 给我脱掉，]她命令道。[say: 如果你裹得严严实实的，我可帮不了你，而且你至少应该能自己搞定这点。][pg]你顺从地照做了。她用一种混合着轻蔑和欲望的眼神打量着你的勃起。}][if (isChild) {[say: 好[boy]可不应该这么下流地看着[if (isfeminine) {其他}]女孩，你知道的。]|[say: 对一个还没成年的女孩就硬成这样？[if (cocklength < 4.5) { 诚然，你的装备也只够应付比你小的，}]]她用嘲弄的语气说道。}]她纤细的手指在你的肉棒上缓慢地上下滑动，让你的身体一阵颤栗，更加激发了你焦躁不安的渴望。她把身体贴近你，凝视着你的眼睛。[say: 躺下，我会给你比这更好的。]");
            outputText("[pg]这孩子根本不需要你顺从，因为她还是推了你一把。鉴于你本来就打算顺从，你踉跄着走完了剩下的路，毫无形象地跌坐在地上。这孩子又推了你一下，示意你躺下，然后她四肢着地[if (singleleg) {跨过你的[if (tailLeg) {[if (isNaga) {蛇形|细长}] }]身体|在你的双腿之间}]。她抓住了你阴茎[if (cocks > 1) {们}]的根部。[say: [if (cocks > 1) {不能满足于只有一个。真有冒险精神|" + (get_player().cocks[0].get_cockType() == CockTypesEnum.HUMAN ? "一根正常的，人类的鸡巴" : "[Cocktype]") + "，真不错}]，]她饶有兴趣地评论道。当她的舌头在上面滑动时，你的肉棒立刻跳动起来，她对这种味道的明显喜爱更是让你兴奋不已。随着她的动作，她的舌头伸长了，尽可能地按摩着你生殖器的每一寸，同时半闭着眼睛盯着前方。这一幕真是令人叹为观止，而且技巧也出奇的好，但她停了下来。[say: 我不想让你在主菜上来之前就射了，]她解释道。");
            outputText("[pg]她看着你焦急的肢体语言咯咯直笑——你对她贪得无厌的渴求根本无法隐藏。幸运的是，你不需要等太久，因为她很快站起身，露出了之前藏在裙子底下的吊袜带和[alicepantieslong]内裤。内衣缓缓褪下，然后突然停住，让你感到一阵焦急。小女孩得意地对你咧嘴一笑，陶醉于她所掌握的性主导权中。她继续褪去衣物，那光洁、平滑的[aliceskin]小穴毫无保留地展现在你面前。[say: 别担心，我也不想再等了。]");
            outputText("[pg]说完这句话，她便跨坐在你的[cock]上，先是停顿了一下，让龟头抵住她饱满的阴户，然后猛地坐到底，完全插入。她和你一样，发出一声极其满足的叹息。[saystart][if (cocklength > 9) {感觉就像被撕成了两半！[sayend]她惊呼道。|[if (cocklength < 5) {[if (isChild) {我只能想象你长大后会有多舒服。[sayend]|真可惜你已经过了发育期，不过也凑合了，[sayend]她调侃道。}]|有你在我里面感觉真好。[sayend]}]}] 她的阴唇贴到了你的骨盆[if (cocklength > 9) {，真是奇迹|[if (cocklength < 5) {，轻而易举}]}]，她开始扭动臀部，让你的阴茎摩擦她的内壁。这感觉简直像在天堂，仿佛她天生就是为了这个目的而存在的。然而，她再次表达了在这场交锋中炫耀自己主导地位的需要，她把自己从你的肉棒上拔出了一半。[say: 我可不打算把活全干了。用你的腰来操我，]她用严厉而性感的语气命令道。");
            outputText("[pg]你毫不犹豫。你热情高涨地向上挺起你的[hips]，引得她发出一声惊呼。你再次向上挺送，猛烈地撞击着她那娇小的阴户。这个过程持续着，每次你在她紧致年轻的通道里顶到底时，都会带来难以置信的愉悦感，你不仅没有因为疲劳而慢下来，反而感到更加兴奋。她收缩的肉壁刺激着你，让你意外地迎来了第一次高潮的突然喷发。你的脸和身体变得更加滚烫，更加慌乱。在一阵狂乱的动作中，你释放出无数次短促的抽插，充满激情地迎来了你的高潮。此时，你的肌肉在燃烧，但你却无法慢下来。第二次高潮到来，你的性欲终于得到了足够的满足，让你倒回地上。你发现自己气喘吁吁，大口喘气，甚至还没有把所有的精液都射进骑在你身上的孩子体内。她看着你筋疲力尽的样子咯咯直笑。[say: 继续，我终于得到了我急需的东西！]");
            outputText("[pg]女孩坐下来骑在你身上，在你敏感的" + (get_player().hasBarkSkin() ? "肉棒" : (get_player().hasGooSkin() ? "黏滑的" : "")) + "肉棒上前后摇晃。你能感觉到自己内心深处在颤抖，努力承受着更强烈的快感。[say: 好[boy]，]她在你第三次高潮时高兴地说。你的呻吟既是幸福也是痛苦，你的身体因为这场折磨而过度劳累。[say: 我们下次还得再来一次……]一切开始消退，你最后注意到的是这个充满欲望的孩子头上长出的角。");
            get_player().orgasm("Dick");
         }
         else if(get_player().hasVagina())
         {
            outputText("孩子再次抚摸你的腹股沟。[say:我将亲自教导[if (isfeminine) {另一个}][boy]如何满足这些需求……]她的语气变得更加性感。她的抚摸还在继续[if (!isnaked) {，同时解开了你的衣服}]，很快将手指滑入你的阴唇之间。[say:你简直都湿透了，你这个变态，]她挑起眉毛嘲笑道。[say:躺下，让我教你怎么处理这个。]女孩推了你一下，你顺势跌倒在地上，完全被她的气势所吸引。她并没有停留在你的下体，而是将一根带着咸香味的手指塞进你的嘴里。[say:尝尝你有多需要我的帮助，]她咯咯笑着说。");
            outputText("[pg]这个调皮的孩子爬回你的[legs]间，迅速开始戏弄般地轻咬你的[clit]，惹得你倒吸一口凉气，但她紧接着的亲吻立刻安抚了你。很明显，玩弄你也是乐趣的一部分[if (!isChild) {，这加深了你和一个只把这当成游戏的孩子的禁忌感}]。她火热柔软的舌头探入你的阴户，你长长地呼出一口气，满是愉悦。仿佛所有被压抑的欲望都能在瞬间倾泻而出，她湿滑的舌头舔舐着每一丝痕迹。[if (!istaur) { 你伸出手，抚摸着她头顶那丝滑的[alicehair]头发。}]");
            outputText("[pg]很快，女孩的舌头环绕着你的入口，你因期待而微微绷紧身体，当终于感觉到她侵入你的[vagina]时，你倒吸了一口凉气。她像蛇一样钻了进去，随着她越陷越深，挤压着每一个角落。她那不可思议的能力让你整个阴道都在她扭动舌头时因快感而蠕动。这根肉质的触手戳弄着你的子宫颈，因为它已经无处可去了。这个荡妇般的小孩并没有因为旅程的结束而气馁，她把嘴压在你的[clit]上，用嘴唇和舌头把它包裹起来。尽管她的舌头仍然伸在你的通道里，她甚至还能产生一些吸力。一切都达到了压倒性的感觉，你身体的每一块肌肉都快要崩溃了。第一波快感像海啸一样袭来，你的身体在巨大的高潮面前崩溃了。第二波快感逆转了这个过程，带来了一阵阵的收缩，最后第三波快感像第二波一样到来，但随之而来的是完全失去控制。你像一滩烂泥一样躺在那里[if (watersports) {，在颤抖的极乐中尿了自己一身。这孩子却不为所动，甚至在吞下每一滴液体时发出闷闷的咯咯笑声}]。");
            outputText("[pg]你的双眼变得迷离，几乎无法聚焦在她身上。她最后一次悬停在你上方，脸上挂着得意的笑容。当她起身离开时，那条铲状的尾巴正开心地摇摆着。你终于可以休息了。");
            get_player().orgasm("Vaginal");
         }
         else
         {
            outputText("那孩子再次抚摸你的腹股沟。[say: 我会亲自教导[if (isfeminine) {另一个|一个}][boy]如何解决这些需求……]她用更加性感的语气说道。她的抚摸还在继续[if (!isnaked) {，同时解开了你的衣服}]，但她似乎有些困惑。[say: 它……是从什么地方滑出来的吗？我是不是没找到缝隙？]");
            outputText("[pg]虽然你已经欲火焚身，但你承认自己没有生殖器，这让如何解决这个问题变得有些棘手。还有另一种方法，[if (isanalvirgin) {但你不确定自己是否能接受那种方式|而且你在这方面还有些经验}]。女孩轻轻叹了口气。[say: 真是拿你没办法，对吧？]她翻了个白眼，想了一会儿。[say: 躺下。]");
            outputText("[pg]你顺从地躺在地上，等待着她接下来的举动。这孩子趴在你身上，深深地吻了你，让你脸上泛起意想不到的红晕。[say: 做个乖[boy]，]她结束亲吻后说道。[say: 放松，好好享受这一切。]她的小手按摩着你[if (thickness> 60 && tone < 50) {胖乎乎的|[if (thickness<10 && tone<25) {瘦骨嶙峋的}]}]身体，将她带给你的温暖传遍全身。她将指尖移到你的脸上，轻轻滑过你的脸颊，然后顺着脖子往下，描摹着你的锁骨，并在你的[breasts]周围摸索。你完全沉醉在这个[if (isChild) {小妖精|小鬼头}]令人愉悦的抚摸中。");
            outputText("[pg]她的手掌顺着你的肋骨滑下，落到了你[if (thickness > 60) {[if (tone > 50) {壮硕的|柔软的}] |[if (tone > 50) {结实的}]}]腹部上。你腹中的欲火燃烧起来，尽管你有着无性的" + (get_player().get_race() == "dryad" ? "植物躯体" : (get_player().get_race() == "goo-girl" || get_player().get_race() == "goo-boy" ? "黏液躯体" : "生理结构")) + "，却依然感到兴奋。她的手指打着圈，有节奏地揉捏着你的下腹部，这让你兴奋不已，引得你呻吟出声，清楚地表明了她的手法有多么高明。她对着你轻笑了一声，站起身来。");
            outputText("[pg]你抬头看着她撩起的裙子，她的[alicepanties]内裤一览无余。[say: 如果只有我被伺候得这么舒服，那就不公平了。难道你不应该感谢我为你做的一切吗？]你一言不发地凑向她那柔软的[aliceskin]双腿，抓住她吊袜带处透明丝袜与裸露肌肤交界的地方。她的皮肤如此温暖，闻起来有花朵和阳光的味道。你睁开眼睛，发现自己不知不觉中已经把脸埋进了她的胯部，小女孩对你这副浑然不觉的模样咯咯直笑。[say: 来吧，让我舒服舒服，]她说道。你欣然接受了邀请，拨开她的内裤，让你的[tongue]滑过她光滑的阴户。她[if (hairLength > 0) {的手指穿过你的[hair]|的手掌抚摸着你的头皮}]，这种鼓励的感觉让你更加卖力地舔弄，换来她愉悦的呻吟作为奖励。");
            outputText("[pg]女孩把你推倒。[say: 既然你这么听话，我会继续让你舒服的，]她保证道，尽管你已经完全沉浸在品尝她美味下体的快感中，甚至忘了她的按摩带来的愉悦。她脱下她的[alicepanties]内裤，然后转过身坐在你的脸上。看来现在这是一场双向的互动了，而你毫无怨言。你再次埋头苦干，用唾液浸湿她光滑的阴阜，用舌尖挑逗她的阴蒂，同时感受着她可爱的臀部压在你身上的柔软舒适。与此同时，她灵巧的双手顺着你的身体游走，让你的每一块肌肉都放松下来。[if (height > 80) { 随着她倾身试图够到你的腹肌，挡住你视线的肉垫也随之移动。}]");
            outputText("[pg]之前那种旋转的动作又回来了，就在你那平坦的耻骨上方不远处。精湛的节奏和精准的手法让你的体内充满了梦幻般的刺激。毫无疑问，照这样下去，高潮马上就要来了，你加倍努力，想让她在你之前泄出来。当你的[tongue]侵入她时，这孩子的身体颤抖起来，呻吟声也越来越大。当你用嘴巴努力侍奉时，你颤抖的肌肉几乎快要坚持不住了，最后这孩子大叫出声，她的高潮与你身体屈服的瞬间同时降临，你们一起达到了顶点。你身上的每一根神经都体验着一波又一波的紧绷与释放，仿佛过了几个世纪。到最后，你竟然感到异常疲惫。");
            outputText("[pg][say: 希望能再次找到你，]她说道，当你昏过去时，她那长着角的面容逐渐消散。");
            get_player().orgasm("Anal");
         }
         aliceCorruption(15,true,get_player().hasCock());
         doNext(get_camp().returnToCampUseOneHour);
         spriteSelect(SpriteDb.get_s_alice_demon());
      }
      
      public function bossyLeave() : void
      {
         clearOutput();
         outputText("你把手从她的紧握中滑出，拒绝了这个把戏，转身回家。毫无疑问，在这里多待一秒都会对你的感官造成危险，而那个傲慢的小孩在你离开时只是瞪着你。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function bossyDeny() : void
      {
         spriteSelect(SpriteDb.get_s_alice_demon());
         clearOutput();
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,2697,FlagDict_Impl_.arrayReadInt(_loc1_,2697) | 1);
         saveContent.knowBossy = true;
         outputText("周围陌生的环境只是幻觉，你的心智受到了干扰，而这种不自然的催情无疑也是同一个邪恶黑手所为。这个孩子在欺骗你，而你绝不屈服。面对你的抵抗，她皱起了眉头。你继续集中精神，清除身上的影响，很快真相便显露出来：翅膀、犄角，还有一条铲状的尾巴。[say: 现在想退出已经太迟了，我让你在我的魔法里浸泡得太久了，]她说道。");
         unlockCodexEntry(2698);
         startCombat(get_currentAlice());
      }
      
      public function bossyContinue() : void
      {
         outputText("[pg]手上的拉扯让你无法进一步评估周围的环境，因为你的帮手没有减速的意图。这种对你身在何处或如何返回营地越来越缺乏意识的情况非常令人不安。你将注意力从周围环境转移开，问女孩她在这里干什么。");
         outputText("[pg][say: 拯救迷路的[if (isChild || height<51) {孩子|人}]。你又在干什么？]");
         outputText("[pg][if (isChild) {你又不是普通的小孩——你是英格纳姆的勇者|[if (height < 51) {她又来了——你不是小孩，你只是碰巧很矮|你显然比她大得多，她表现得好像你需要帮助一样，这太荒谬了}]}]。你能照顾好自己！然而，任何争论对她都没有影响，她继续贬低你，并抛出关于你在这个地区出现以及你除了呼吸之外还能做什么的问题。然而，她拉着你到处走并责骂你的时间越长，你就越想靠近她。她轻薄的衬衫和保养得很好的裙子暗示着她的阶级和优雅，她那穿着白色长袜的[aliceskin]双腿吸引了你的目光。");
         outputText("[pg]小女孩用手掌轻轻拍打着你的胯部，带着评判的口吻嘲笑道。[say: 你[if (isChild) {尽管是个|竟然对}]孩子也会发情？你真是无可救药的恶心。] " + (get_player().hasCock() || get_player().isNakedLower() && !get_player().isGenderless() ? "" : "你真好奇她是怎么看出来的，因为你不觉得有什么明显的迹象，而") + "意识到你在她面前勃起了，这让你既感到惊讶，又觉得完全在预料之中。她并没有做任何与性有关的事情，但她很美，而且有一种令人安心的存在感。");
         outputText("[pg]伴随着一声[i:哼]，她双臂交叉，直视着你的眼睛。[say: 我想你自己也处理不了这事，对吧？]");
         menu();
         addNextButton("性爱",bossySex).hint("你无法抗拒内心涌起的感觉。");
         addNextButton("拒绝",bossyDeny).hint("她在利用你，而你无法容忍这种事。");
      }
      
      public function bossyConfront() : void
      {
         spriteSelect(SpriteDb.get_s_alice());
         clearOutput();
         outputText("你把手从她的紧握中挣脱出来，完全意识到了她魔法的影响。她是个恶魔，这种把戏以前也用过。你花了一点时间才清醒过来，但你感觉自己已经控制住了局面，准备好采取任何必要的手段来对付她。爱丽丝用傲慢的态度瞪着你，但她的表情动摇了。最后，在短暂的对视后，她发出一声呜咽，妥协了。[say: 好吧，那这招行不通了！]");
         confrontMenu();
         aliceCorruption();
      }
      
      public function aliceWombDeepthroat() : void
      {
         clearOutput();
         outputText("饥饿感在你体内涌动。这个粗俗的小妖精费尽心思想要激怒你，她确实成功了，但你觉得她不会喜欢你表达激情的方式。她依然倒在你面前，每一个动作都在试图诱惑你，即使你正在盘算着她的死期。");
         outputText("[pg]当你靠近时，你眼中闪烁的暗光一定向她传达了什么，因为她确实试图爬开，但太迟了。你已经扑到了她身上，将她推倒在地，撕开她的裙子，露出她的[alicepanties]内裤。那些内裤也很快被你脱掉，你将她完全暴露出来，贪婪地欣赏着她青春的胴体。当拔出刀时，爱丽丝原本以为只会被侵犯的希望瞬间破灭了。");
         outputText("[pg]她的[aliceeyes]眼睛闪烁着，试图将躯干移向一侧，但你绝不允许。你把她按在原地，用刀沿着她的锁骨划过，享受着她从你身下散发出的极度恐惧。");
         outputText("[pg][say:求、求求你！我……我什么都愿意做，只求你……别这样……]");
         outputText("[pg]多么美妙的节奏。你从她肚脐下方开始切开，当你的刀刃刺破她[aliceskin]的皮肤时，她嚎叫起来。对她来说幸运的是，除了单纯地让她受苦之外，你还有一个目标，所以你迅速向下滑动，在她的腹部开了一条长长的口子。你的双手几乎瞬间沾满了鲜血，滑得你在这个过程中好几次差点把刀掉在地上，但最终你还是切开了一个足够大的伤口。在整个过程中，爱丽丝一直在扭动和尖叫，但你的体重足以让她动弹不得。");
         outputText("[pg]当你把手伸进年轻恶魔的体内时，她发出了一声呻吟。当你摸索着向下寻找她的子宫时，她甚至还打了个可爱的小嗝。而当你开始切割它时，她甜美的泪水开始真正地涌出，在她的脸颊上留下了两道泪痕。你非常想把它们舔干净，但你还没完事，所以你用力一扯，把她的女性器官扯了下来，同时引出了一声特别悦耳的尖叫。");
         outputText("[pg]最后，你把它拿在手里——她那微小、发育不全的子宫。把它弄出来费了不少劲，但看着这个可爱的小球，你觉得这真的很值得。然而，爱丽丝在整个过程中受到了极大的折磨，随着她慢慢失血，她的呼吸变得越来越浅。你很惊讶她还能撑到现在。也许是她恶魔生命力的作用？不管怎样，看起来支撑她活下去的力量也撑不了多久了。");
         outputText("[pg][say:为什么？为……] 随着鲜血从她嘴里涌出，她的声音开始变弱。也许你做得太过火了——她离死亡的距离比你现在希望的要近得多。");
         outputText("[pg]但这不仅仅是毫无意义的暴力，不，你为你的战利品想好了一个去处。虽然你很不舍得放弃它，但它在她的食道里会找到一个更好的归宿。你用空着的手开始试图掰开她的下巴，但小恶魔反抗着你，徒劳地左右摇头。当她挣扎的新鲜感消失后，你狠狠地扇了她一巴掌，把她打晕，然后掰开她的嘴唇[if (str < 30) {，尽管这确实有些困难}]。");
         outputText("[pg]道路终于畅通了，你可以自由地把器官塞进她的喉咙，塞得足够深，让她不容易咳出来。[if (silly) {谢天谢地，她的喉咙容量足够大，可以容纳这个。}]趁她还晕着，你绕到她身后找个更好的角度，接着[if (isnaked) {亮出你的[cock]|把你的[cock]从[armor]里掏出来}]，把它塞进她张开的嘴里。当你把你的长度完全沉入时，你把她的子宫也一起推了进去，直到它牢牢地卡在原位，让她有点作呕。她的手无力地摸索到你的大腿上，但这更让人觉得可爱，你可以轻松地开始前后摇摆。");
         outputText("[pg]你能感觉到她正虚弱地试图在你的肉棒周围喘气，但密封得太紧了。她只能推着你的臀部，但由于失血过多，她原本就可怜的力气已经完全消失了。受到她即将到来的死亡的刺激，你继续抽插着你的臀部，每一次抽插都撞击着嵌在她喉咙里的肉块[if (hasvagina) {，同时你的阴蒂摩擦着她的小鼻子}]。这种快感几乎让人无法抗拒，你被迫向前倾身，一只手在她娇小的胸部寻找支撑，另一只手则充满爱意地抚摸着她的脖子。");
         outputText("[pg]这只爱丽丝不知怎么地积攒了最后一声闷哼的力气，她声带震动的感觉让你达到了高潮的边缘。你向后仰去，发出一声呻吟，然后释放出来，用你的精液淹没了她小小的喉咙[if (cocks > 1) {，而你剩下的肉棒[if (cocks > 2) {们}]则在她的身体上喷洒了更多}]。你高潮的阴茎前端仍然压在她的子宫上，那种天堂般的触感几乎让你晕厥过去。");
         outputText("[pg]然而，你最终还是平静了下来，大口喘着粗气，在她的体内慢慢变软。当你慢慢地把肉棒从爱丽丝的喉咙里拔出来时，你几乎为留下你的战利品而感到难过，但天下没有不散的筵席。从恶魔那呆滞的眼神和玩偶般的寂静中，你可以看出她确实已经死了。");
         outputText("[pg]你最后看了一眼这具正在迅速变冷的尸体，就在几分钟前，她还在如此活泼地挣扎着，然后你迈着轻快的步伐离开了。");
         get_player().orgasm("Dick");
         aliceCorruption(15,true,true,true);
         get_combat().cleanupAfterCombat();
         spriteSelect(SpriteDb.get_s_alice_demon_nude());
      }
      
      public function aliceWin() : void
      {
         var needDraft1:Boolean;
         var _g:AliceScene;
         spriteSelect(SpriteDb.get_s_alice_demon());
         clearOutput();
         if(get_monster().get_HP() < 1)
         {
            outputText("爱丽丝被揍得远远超出了她的承受极限，痛苦地倒在地上。她抬头看着你，眼神中充满了真正的疲惫和痛苦。[say:求、求求你……我不想再打了……][pg]");
         }
         else
         {
            outputText("小恶魔因为焦急的渴望而颤抖着，捂着自己的胯部疯狂地揉搓，同时身体瘫软在地上。当她抬头看着你时，手上的动作慢了下来。[pg]");
         }
         var _loc1_:Boolean = get_monster().get_lust() < get_monster().maxLust();
         menu();
         addNextButton("内裤",alicePanties).hint("你很清楚恶魔以性能量为食，但这并不意味着你找不到发泄的方法……").disableIf(get_player().get_lust() < 33,"这个场景需要你有足够的欲望。");
         addNextButton("捆绑",aliceBind).hint("如果你把她绑起来，这可能会很有趣。");
         addNextButton("摸头",aliceHeadpats).hint("给她应得的惩罚。");
         addNextButton("肛交",aliceAnal).hint(get_silly() ? "插进她的菊花里。" : "练习正确的避孕方法。").disableIf(get_player().get_lust() < 33 || !get_player().hasCock(),"这个场景需要你有阴茎和足够的欲望。");
         addNextButton("粗暴性爱",aliceAsphyxiation).hint("在这个小妖精身上发泄你的一些挫败感。").sexButton(-1);
         if(get_silly())
         {
            addNextButton("内裤玩法",alicePanties2).hint("她的内裤必须物尽其用。");
         }
         if(get_game().shouldraFollower.followerShouldra())
         {
            addNextButton("舒尔德拉",shouldraPossession).hint("让舒尔德拉附身爱丽丝，进行一些爱抚。");
         }
         _g = this;
         needDraft1 = _loc1_;
         addNextButton("情欲交媾",function():void
         {
            _g.aliceLustFuck(needDraft1);
         }).hint(_loc1_ ? "压倒这个色欲恶魔。需要催情剂。" : "她完全被欲望淹没了，所以就满足她吧。").disableIf(_loc1_ && !get_player().hasItem(get_consumables().L_DRAFT) && !get_player().hasItem(get_consumables().F_DRAFT),"这个场景需要你通过情欲获胜或拥有催情剂。").sexButton(1);
         addNextButton("杀死",aliceKill);
         if(get_goreEnabled())
         {
            addNextButton("虐杀性爱",aliceSnuff).hint(get_silly() ? "你可以为了爽一发而杀人。" : "你不能让这个恶魔活下去，但你仍然有需要解决的冲动。").sexButton(1);
            addNextButton("子宫深喉",aliceWombDeepthroat).hint("和她最私密的部位找点乐子。","子宫深喉").sexButton(1);
         }
         if(get_player().hasMultiTails())
         {
            addNextButton("强迫梳毛",get_game().forest.kitsuneScene.kitsuneGenericFluff).hint("让[themonster]梳理你的尾巴。").sexButton(-1);
         }
         addButton(14,"离开",aliceLeave);
      }
      
      public function aliceWilling() : void
      {
         clearOutput();
         outputText("你高兴地抱着小女孩在草地上打滚。每一次肌肤相亲都温暖着你的心。你无法放开她。你需要感受更多。你再次压在她身上，开始隔着那件带褶边的白色衬衫抚摸她的胸部。她咯咯地笑着，[say:好痒啊！]你情不自禁地向前倾身，亲吻她的脖子，嗅着她头发上花朵般的香气。这只引得这个懵懂的孩子发出更多的笑声。[pg]");
         if(get_player().hasCock())
         {
            outputText("你强迫性地开始用你那仍在[armor]里跳动的肉棒在她身上摩擦。");
         }
         else if(get_player().hasVagina())
         {
            outputText("你强迫性地开始用你那渐渐湿润的小穴在她的腿上摩擦。");
         }
         outputText("意识到还穿着衣服是个错误，你迅速开始脱衣服来弥补。女孩困惑地抬头看着你，问道：[say:你脱衣服干什么？]你告诉她不穿衣服玩更有趣，她也应该试试。她似乎有些忐忑不安，但很快就顺从地解开了衬衫。然而，你的欲望战胜了耐心，一想到她赤裸的胸部，你就迫不及待。你猛地伸出双手，粗暴地扯开她的衬衫，甚至可能在拉扯中撕破了它，尽管你已经欲火焚身，根本注意不到这些。她惊叫起来，对你的行为感到恐慌。[pg]");
         outputText("[say:唔……请、请停下，我好害怕！]她睁大眼睛说道。已经没有回头路了。你把她拉上前，吸吮着其中一颗在微风中变硬的裸露乳头。她的呜咽声可爱极了，只会让你的心跳得更快。虽然她的皮肤尝起来就是皮肤的味道，但不知为何却让人忍不住想舔。你的舌头滑过她小巧的乳晕，然后在她的胸前胡乱舔舐。你用急切的亲吻享受着这一切。她开口说道：[say:这、这太奇怪了！我不喜欢！我想回家……][pg]");
         outputText("你告诉她，你会很乐意进行一些更有趣的事情，同时将她推倒，开始笨拙地脱她的紧身裤。那层薄薄的白色布料太难脱了，所以你胡乱地撕开它，直奔她那神圣的盆地。虽然她最宝贵的地方仍然被可爱的[alicepanties]内裤遮盖着，但你还是忍不住急切地将脸埋进她的腹股沟。她那柔软的小腿贴在你脸颊上，给你带来舒适和愉悦，而她则紧绷着双腿以示抗议。你兴奋地亲吻她的内裤，吸入她身体逐渐高涨的情欲气息。无论她如何抗拒，她的身体都知道这是对的。你将一根手指滑入她内裤的一侧，拉开它，露出那纯洁的阴唇。那完美无瑕、光滑的阴阜正乞求着被品尝，而你也确实这么做了。");
         if(get_player().hasLongTongue())
         {
            outputText("抱歉，该文本包含违反安全政策的内容，无法进行翻译。");
         }
         else
         {
            outputText("你的[tongue]美妙地滑入她的阴唇之间，舔舐着她小穴里渗出的水珠。");
         }
         outputText("你伸出舌头在她的阴唇间打转，接着挑逗她的阴蒂并用力吸吮。她瑟缩了一下，无奈地呼出一口气。[pg]");
         if(get_player().hasCock())
         {
            outputText("你向前挪动身体，跪在地上，顺势将她的双腿抬起。好戏才刚刚开始。你将你的[cock]抵在她湿滑的阴唇上，一边摩擦旋转，一边逼近那狭小的萝莉入口。她非常虚弱地挣扎着想要躲开，一阵新的恐慌感再次席卷了她。你抓住她的臀部向前挺进，撑开她稚嫩的阴户。小女孩哭喊出声，但这只会让你更有动力继续下去。你前后抽插着你的[hips]，每一次都比上一次更快、更深。你插得越用力，她的叫声就越大，这驱使你更加无情地抽插。没过多久，你便开始全速冲刺。泪水顺着她的脸颊流下，她不停地抽泣着，但她的阴道却热情地紧缩、蠕动，紧紧包裹着你的[cock]。然而，你并不打算让她哭得这么大声，于是你抬起她的上半身，将舌头探入她可爱的嘴里。你热烈的亲吻掩盖了她的抽泣声。你让她在你的腿上上下颠簸，直到关键时刻的到来。你将她重重地压下，将你体内能挤出的每一滴精液都直接喷射进她的子宫颈。她因为突如其来的冲击尖叫了一声，随后便安静了下来。[pg]");
            get_player().orgasm("Dick");
         }
         else if(get_player().hasVagina())
         {
            outputText("你向后靠去，准备迎接新的刺激，将小女孩的内裤完全褪下。你向前爬去，将膝盖轻柔而坚定地抵上她裸露的阴唇，双腿夹紧她的腿。你将那个小小的孩子拥入怀中，在开始用腿研磨她、同时让她的腿也研磨你时轻声爱抚。她因这陌生的刺激而颤抖呻吟，令你愈发亢奋。你靠近她的脸，将她引向一个吻。她的面颊因兴奋与情欲而绯红。相互的腿部研磨令你在每一刻都无比爱恋着她，珍视着她回赠给你的每一个吮嘴亲吻。你的嘴合上她的嘴，将舌头探入与她的嬉戏。她口腔内部的味道甜蜜可口。你轻轻吸吮，将她的舌头引出，吸入自己口中。你的双手忙碌地揉搓抚摩着她每一寸柔嫩细腻的皮肤。你撑起身子以获取更大的力道；终章近在眼前。你命令她伸出舌头，对她晕乎乎的顺从感到满意，开始吸吮她的舌头，同时将膝盖热切地磨入她那年轻的裂缝。她带着半睁的、目光涣散的神情凝视着你，看你将双唇沿她的舌头上下滑动。你亲昵地舔吸着那根纤细的小东西，她则笨拙地尝试将膝盖顶向你的[vagina]作为回应。你感受到她脸上的热度与砰砰作响的心跳，高潮随之而来。你将一根手指插入她那小小的洛丽塔小穴，迫切地用手掌根部磨蹭她的阴蒂，她的高潮以全力涌来。她在狂喜中尖叫，随后瘫软下去。[pg]");
            get_player().orgasm("Vaginal");
         }
         outputText("满足之后，这种行为带来的快感开始消退。你感到有些疲惫，也有些羞愧。你重新穿好衣服，走回营地，思考着自己刚才的所作所为。");
         aliceCorruption(15,true,get_player().hasCock());
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function aliceTrust() : void
      {
         clearOutput();
         outputText("不过，在所有人中，你肯定永远不会做任何伤害她的事。她很可爱，你会尽你所能保护这个孩子的纯真。[pg]");
         outputText("[say: 嗯……]她开始说话，你专注地听着。[say: 你能陪我玩吗？][pg]");
         outputText("当然，你带着愉快的神情说道。只要能靠近这样充满童真欢乐的小天使，做什么都行。这也是个好借口，万一有什么邪恶的东西想伤害她，你就能在附近保护她！你跟在现在更加活泼的小女孩身后，看着她一路小跑。你一边走一边打量着她的容貌，注意到她那美丽飘逸的[alicehair]头发随着她的步伐跳动。她穿着一套可爱的衣服，由白色衬衫、深海军蓝和红色相间的格子裙组成，衬衫领口还系着一个红色的蝴蝶结。她是一个纯洁无瑕、美丽优雅的小女孩。[pg]");
         outputText("女孩停下脚步，转过身来，用她那双迷人的[aliceeyes]眼睛看着你。你太沉浸在这一刻了，甚至不确定自己跟着她走了多久。她抓住你的双手，上下蹦跳着宣布道：[say: 我们就在这里玩吧！][pg]");
         outputText("她那[aliceskin]的双手触碰着你，让你浑身一颤。你想抓住她，更多地感受她那纤细却柔软、让人想拥抱的身体。你向前倾身，在空地柔软的草地上依偎着她。你的双手把她抱得越来越紧，同时你的下体也升起了一股热流。");
         aliceCorruption(15);
         menu();
         addButton(0,"继续",aliceWilling);
      }
      
      public function aliceTailfuck() : void
      {
         spriteSelect(SpriteDb.get_s_alice_demon_nude());
         clearOutput();
         outputText("你告诉她，即使知道她的真实身份，你还是想和她做爱。爱丽丝兴奋地看着你。[say: 真的吗？终于有人愿意主动配合了！别担心，我虽然是个恶魔，但只要你小心点，对你来说也不算太危险。" + (get_player().isChild() ? " 不过我得提醒你，我可能看起来和你一样年轻，但我的经验可比你丰富多了。所以做个乖[boy]，尽量跟上我的节奏。别说我带坏了你，毕竟这是你自找的。" : "") + "] 她诱惑地对你笑了笑，解除了隐藏她恶魔本性的幻象。你们俩开始脱衣服，她继续说道。[say: 用这具毫无性吸引力的身体想搞点什么简直太痛苦了。我看起来就像个小孩！就因为我做了某件比我地位高的人不喜欢的事。而且还是为了两厢情愿的性爱？我敢打赌，你绝对找不到第二个人愿意和一个明知是恶魔，而且身体还像……这样的人做爱。] 她用手在自己身上比划着，尽可能诱惑地展示着她那看起来很年轻的身体。" + (get_player().isChild() ? " [say: 不过我想对你来说，这样可能更自然些。]" : ""));
         outputText("[pg]当你们俩都一丝不挂时，你走近了这位年轻的恶魔。你用手挑逗她平坦的胸部，捏住她小巧挺立的乳头，将她推倒在地。[say: 喂！你在干什么！？] 你告诉这个身体尚未发育成熟的魅魔安静点，不用担心，因为你马上就会让她爽上天。你俯下身，将双腿跨在她娇小脆弱的身体两侧。你跨坐在她的臀部上，用你" + (get_player().hasVagina() ? "湿润的[vagina]" : "坚挺的[cock]") + "摩擦着她，迅速调整姿势，以女上位的方式将" + (get_player().hasVagina() ? "你的[clit]紧贴着她的阴蒂" : "你的龟头紧贴着她的阴蒂") + "。[say: 哦，对。这就对了。] 这个小恶魔向上挺动，用她充血的阴蒂摩擦着你的" + (get_player().hasVagina() ? "阴蒂" : "肉棒") + "。你用" + (get_player().hasVagina() ? "自己跳动的阴蒂摩擦着她的阴蒂" : "肉棒摩擦着她跳动的阴蒂") + "，觉得在这么好的情况下，你还能做更多的事情。");
         outputText("[pg]你将长长的[tail]绕过来，抓住它，用它在她那滴着淫液的少女小穴入口处挑逗。[say:对！快！用你那根又大又长的尾巴操我！]你急于取悦她，便照她说的做了。你紧紧握住尾巴，将它深深地插入她那紧致得不可思议的小穴中，直到你感觉到尾巴尖擦过她的子宫颈。小魅魔在狂喜中尖叫，乞求你再用力些。你加快了在她身上摩擦的速度，同时开始在她体内来回抽插你的尾巴，每一次都深深地捣进这个爱丽丝紧致的少女小穴深处。" + (get_player().isChild() ? "[say:来吧，小[boy]，用力操我！用力，再用力！我不知道你这个年纪到底是从哪学来这招的，但再用力点！]" : "[say:来吧，大[boy]，操我！狠狠地捣我，把你的全部都给我，撑开我的小穴，直到把我玩坏！]"));
         outputText("[pg]你本来就打算这么做，于是你猛烈地在她身上摩擦，同时用尾巴撑开她，你对她的猛烈撞击甚至没有让她的肚子鼓起来，这简直令人难以置信。你抽插着尾巴，摩擦着" + (get_player().hasVagina() ? "你们的阴蒂" : "她的阴蒂") + "，你们俩都在快感中喘息呻吟，没过多久你们就都高潮了。你先到了，这让你的背部弓起，" + (get_player().hasVagina() ? "你的小穴疯狂地痉挛，把你的淫液喷得她胯下和你的尾巴上到处都是" + (get_player().hasCock() ? "，你的肉棒也射得她肚子、胸部和脸上到处都是。" : "") : "你的肉棒把精液射得她肚子、胸部和脸上到处都是") + "。不过她很快也跟着高潮了，快感猛烈地冲击着她的身体，她大声尖叫着，一波波的快感席卷了她的全身，让她不停地痉挛。");
         outputText("[pg]随着你们的高潮逐渐平息，你从她湿透的缝隙中抽出尾巴，从这个孩童般的恶魔身上爬了起来。当她终于坐起身时，你已经穿好了衣服，你告诉她，即使她有着这样的身体，你对这次体验仍然非常满意。" + (get_player().isChild() ? "[say: 那当然了。我的身体只是看起来和你同龄，我实际上要老得多，而且知道怎么使用它。但对于你这个年纪的人来说……这比我预期的要好。]" : "[say: 真的吗？！]她高兴地对你笑逐颜开，似乎对你的赞美感到非常兴奋。[say: 我是说，你自己也不赖。事实上，你相当棒。如果你不介意我这个样子，也许你有空可以再来？看穿我幻象的人通常会立刻攻击我。能有人……拥抱我，感觉真好。]") + " 听到最后一句话，你发誓你看到她脸红了，然后她把目光从你身上移开。即使不考虑她的身体，她也是个非常可爱的魅魔。而且就恶魔而言，她也很友好。你说了声再见，然后返回营地，希望能有机会再次遇到她。");
         get_player().orgasm("Vaginal");
         aliceCorruption(0,true);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function aliceStop() : void
      {
         spriteSelect(SpriteDb.get_s_alice_demon());
         clearOutput();
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,2697,FlagDict_Impl_.arrayReadInt(_loc1_,2697) | 1);
         saveContent.knowInnocent = true;
         outputText("你猛地站起身，警觉地意识到自己的心智受到了影响。你咬紧牙关，集中精神，直到头脑恢复清醒。躺在你面前地上的，依然是你一路跟来的那个天真无邪的小女孩，但她的头上却长着两根恶魔般的角，身后还蜿蜒着一条末端呈铲状的尾巴。甚至能看到她背上长出了一对小小的蝙蝠翅膀。毫无疑问，这是一只恶魔。[pg]");
         outputText("[say: 怎、怎么了？你不想玩了吗？]紧张的小魅魔说道。虽然你现在已经看穿了她的把戏，但她的担忧似乎是发自内心的。[say: 我想我们可以不玩了……只要再陪我一会儿，好吗？][pg]");
         outputText("你摇了摇头，表示不会再上她的当了。你准备好你的[weapon]以表明你的立场。她冷笑一声站了起来，拍去裙子上的草屑。[say: 该死的去性化惩罚。用了这么多黑魔法，我还是得挨饿。我不会这么轻易退缩的。就算用强，我也要你留在这里！]");
         unlockCodexEntry(2698);
         startCombat(get_currentAlice());
      }
      
      public function aliceSnuff() : void
      {
         clearOutput();
         outputText("你无意喂养恶魔，但你也有自己的需求要满足。你一边脱下[armor]，一边想，也许可以折中一下。爱丽丝茫然地抬起头，羞涩地移开视线，同时将双腿分开。她骗不了你，你知道这正是她想要的。");
         outputText("[pg]你觉得没必要破坏这份惊喜，于是眼中带着欲望向她压去。她的眼中也同样闪烁着期待。你粗暴地扯下她的内裤。没有多余的前戏，只有你的[cock]紧紧压入年轻魅魔的体内，开始抽插。");
         outputText("[pg]你挺动臀部，魅魔喘息了一声。你心想，她等这一刻等了多久？她的体内像孩子一样紧致，这究竟是魅魔的天性、她的形态所致，还是她最近缺乏性生活，你也不清楚。你向后退去，再次向前挺进，引来她又一声喘息。一次又一次，伴随着喘息和颤抖。随着你的动作，她体内温暖如天鹅绒般的褶皱逐渐放松。她的身体变得柔软，内部也变得湿滑，她已经准备好迎接下一阶段了。");
         outputText("[pg]你把手伸向她的脖子，紧紧握住。她本能地把手放在你的手上，但她脸上幸福的表情表明，她还没有意识到这不仅仅是粗暴的性爱。你握得更紧了，勒住她的喉咙，直到她的呼吸变得沙哑且不规律。爱丽丝的小穴痛苦地颤抖着，更好地按摩着你的[cock]。但这还不够。你交替着紧握和放松，让这个小恶魔在没有恐惧的情况下体验窒息的快感。你前后摇摆着臀部，性爱的节奏足以让你沉醉其中。你的腹部紧绷，用力地推挤，一次又一次，然后再次恢复平稳而持续的动作。一阵阵舒缓的快感让你越来越接近高潮。");
         outputText("[pg]知道自己很快就会射出来，你双手掐住女恶魔已经酸痛不堪的脖颈。她的双眼红得充血，泪水盈盈，却还像发情的母狗一样呻吟、尖叫。你压在她身上，此刻主要靠自己的体重来施力。爱丽丝突然意识到自己的性命有多么危在旦夕；这一次你不会再松手了。她的身体抽搐扭动，让你更加兴奋。每一次挺入都遭遇比最初几下还要强烈的抵抗。她在惊恐痛苦中呛咳着，喉间发出咕噜声。那声音听起来几乎像是在哀求。一次又一次地哀求，好继续繁殖小恶魔瘟疫，扩散恶魔的侵染。但你绝不会允许。你的胯部狠狠顶动，胸膛剧烈起伏，口中发出愉悦的呻吟；骨盆肌肉绷紧，将一股股精液射入这渴求的恶魔体内深处。");
         outputText("[pg]你停在那里喘息着，眼看那逐渐消逝的恶魔抽搐越来越慢。她双眼布满血丝，泪水顺着脸颊淌下，生命已经离她而去。你不会留下任何肮脏的后代，也不会再去满足恶魔那贪婪的渴求。");
         get_player().orgasm("Dick");
         aliceCorruption(0,true,true,true);
         get_combat().cleanupAfterCombat();
         spriteSelect(SpriteDb.get_s_alice_demon_nude());
      }
      
      public function alicePatMenu() : void
      {
         spriteSelect(SpriteDb.get_s_alice_demon());
         clearOutput();
         outputText("你告诉这个看起来很年轻的恶魔，你并没有打算伤害她。她确实试图伪装成一个迷路的孩子来骗你和她做爱，但[if (silly) {嘿，这里可是玛瑞斯。这种破事常有。|在被揭穿之后，她看起来似乎并没有什么危害。}]");
         outputText("[pg][say: 好吧……既然你都这么说了。]她解除了幻象，向你展示出她恶魔的翅膀、角和尾巴。[say: 那么你想要什么呢？]");
         outputText("[pg]仔细打量着她，你无法否认她确实很可爱。虽然是个淫魔，但却娇小得像个小女孩，有着你所期望的，比她实际年龄小得多的人才有的所有可爱特征。所以稍微想了一下后，你告诉她你想花点时间摸摸她的头。这个迷你的女恶魔一脸困惑地看着你，嘴巴微张。[say: 摸我的头？真的吗？这……真是个奇怪的请求。不过我想这也没什么坏处，所以好吧，我答应你。]");
         menu();
         addNextButton("摸她的头",alicePatHer).hint("给她应得的摸头待遇。");
         addNextButton("被摸头",aliceGetPatted).hint("你才是可爱的小东西，你需要被摸头。");
         addNextButton("带福利的摸头",alicePatHerLewd).hint("摸摸她那可爱的小脑袋，顺便做点别的事。","带福利的摸头").sexButton(-1);
         addNextButton("被带福利的摸头",aliceGetPattedLewd).hint("你可以享受一些摸头待遇，以及一些其他的事情。","接受带福利的摸头").sexButton(-1);
      }
      
      public function alicePatHerLewd() : void
      {
         clearOutput();
         outputText("对她的回答感到高兴，你抓住她的小手，带她走到附近的一棵树下。你背靠着树[if (haslegs) {坐下|躺下}]，示意她坐在你的腿上。她带着有些不悦的表情照做了。她很轻，正如她的体型所预期的那样。在她坐在你的腿上后，你用一只手臂环抱住她，从后面抚摸她平坦的胸部。面对这突如其来的色情举动，她羞得满脸通红，扭动着身体，无意中把头靠得离你更近了。她真可爱。但她毕竟是个色欲恶魔，你知道她总是需要什么。不想再等了，你把空闲的[hand]伸向她的头，指尖轻轻穿过她[alicehair]的头发。");
         outputText("[pg]非常柔软，甚至像丝绸一样顺滑。但这还不是重头戏。在抚摸她的头发和按摩她的头皮时，你慢慢将空出的手伸进她的裙子，探入她的双腿之间。当你的手碰到她那渐渐湿润、孩子般的私处时，你听到这个小恶魔发出了一声动情的娇喘。她的头蹭着你的手，鼓励你按摩她那恶魔般的角。当你开始这么做时，她那孩子般的手指[if (!isnaked) {钻进了你的[armor]|摸向了你的胯部}]，并且[if (hascock) {开始套弄你勃起的肉棒|抚摸你[wet]的小穴，用她的小手掌压在你肿胀的阴蒂上}]。");
         outputText("[pg]有什么比在互相抚慰的同时摸摸一个小魅魔的头更好的方式呢？你抚摸着她的头发，按摩着她的头皮和角，同时你们互相取悦着对方。她那孩子般柔软的手感觉就像丝绸一样，[if (hascock) {包裹着你的[cocktype]上下套弄|紧贴着你的阴蒂和外阴急切地揉搓着}]。你将手掌用力压在她光洁的阴阜和勃起的小肉核上，同时分开她闪闪发光的阴唇，将两根手指滑入她紧致的小穴中。在抽插和揉搓下，你很快就让她在极乐中呻吟起来，并将背紧紧贴在你的[chest]上。");
         outputText("[pg]就这样在荒野中露天席地，你们俩继续着。没过多久，她发出一声响亮的呻吟，身体微微颤抖。你感觉到一股淫液喷涌在你仍在抽插的[hand]上。紧接着，你感觉到你的[if (hascock) {[cock]|[vagina]}]一阵痉挛。你发出一声极乐的高潮呐喊，[if (hascock) {你的精液喷射而出，覆盖了她的小手和手腕|你肿胀的阴蒂跳动着，一股女性的淫液浸透了她的小手}]。沉浸在极乐中，你们俩充满情欲地继续着。当你们的高潮终于平息后，你们俩很快停了下来。");
         outputText("[pg][say: 这真是……出乎意料。绝对不是我听到你的请求时所想象的那样。但作为我这样的存在，我当然很喜欢。] 她站起身，稍微整理了一下裙子。你也从地上爬起来，告诉她你肯定也同样享受。毕竟，不是每天都能在互相抚慰的同时，摸摸一个看起来像小女孩的人的头。");
         outputText("[pg]你们俩互道再见，她友好地挥了挥手，然后你回到了营地。也许恶魔不是什么好人，但她们绝对能带来不少乐子。");
         aliceCorruption(15,true);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function alicePatHer() : void
      {
         clearOutput();
         outputText("听到她的回答，你高兴地抓住她的小手，带她走到附近的一棵树下。你背靠着树[if (haslegs) {坐下|躺下}]，示意她坐在你的腿上。她脸上带着些许不悦的神情，照做了。正如她的体型所预示的那样，她非常轻。在她坐在你的腿上后，你用一只手臂环绕着她，从背后给了她一个轻轻的拥抱。她因为这个拥抱而脸红，稍微扭动了一下，把头靠向你。她真是太可爱了。不想让她久等，你将空闲的[hand]放在她的头上，指尖轻轻穿过她[alicehair]的头发。非常柔软，甚至像丝绸一样。正是你对像她这样可爱的生物所期望的那样。你听到这个小恶魔发出一声轻柔的咕哝，现在她已经对这种关注感到温暖了。你非常享受这一切，决定进一步放纵一下。你将手紧紧贴在她温暖的头上，做了一个向下的抚摸动作。重复你的动作，你引出了这个少女恶魔满足的叹息，她向后靠去。");
         outputText("[pg][say:好吧……这感觉还不赖。我承认。] 在她承认自己很享受之后，这个恶魔靠在你的[chest]上放松了下来。她将一只柔软、孩子般的手放在你的手上，另一只手轻轻地抚摸着你的[if (haslegs) {thigh|hip}]。");
         outputText("[pg]这是一种很舒服的状态。你抚摸着她柔顺丝滑的头发，偶尔揉揉她可爱的小恶魔角，紧紧地抱着她娇小的身体。她在你的怀抱中融化了。在你的[day]里，你能够在大自然中度过一段舒适的时光。而且有趣的是，还是和一个恶魔一起。每当你抚摸到她头上或角上特别敏感的地方时，你偶尔会听到她发出可爱的声音，但总的来说，你们俩只是静静地坐着，你抱着她，沉浸在你们相当纯洁的欲望中。");
         outputText("[pg]时间流逝，虽然你仍然能感觉到她的恶魔气息，但你成功地控制住了局面，没有让事情变得色情。不过你也不能整天待在这里，所以你给了这个女恶魔一个快速的拥抱，然后把她从你的腿上移开。站起身来，你告诉她你玩得很开心。她微微脸红，说道：[say:呃……谢谢。我和别人在一起度过的时间比这更糟。即使这对我来说有点太纯洁了。]你挥了挥手，说了声再见，然后回到了营地。和恶魔共度时光，这真是一种美好得出乎意料的健康方式。");
         aliceCorruption();
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function alicePantiesSniff() : void
      {
         clearOutput();
         outputText("[say: 那么，我们现在要做什么呢？] 恶魔女孩用假装无辜的语气问道。[say: 你打败了我，我完全任你摆布了~ 现在你甚至征服了我的内裤！哦，我该怎么办呢，我只是一个无助的、赤身裸体的小女孩，等待着……] 但她的声音在你的脑海中被淹没，消失在虚无之中，因为你已将脸埋进她的内裤里，深深地吸了一口。");
         outputText("[pg]当她的气味瞬间淹没你的理智时，你幸福得几乎窒息，仿佛在白昼中看到了璀璨的星辰。尽管她有着恶魔的本性，但她闻起来就像一个真正的小孩。不，比那更好。简直像天使一样。清新、天真、纯洁，完全是贞洁的。虽然这可能是她努力掩饰的结果，而不是本性如此。但你毫不在意。在这一刻，你感到无比的愉悦。柔软的布料像温暖的毯子一样包裹着你的脸，甜美的气味像恋童癖迷晕猎物一样麻痹着你的大脑。");
         outputText("[pg]你想要更多。");
         outputText("[pg]你的耳朵隐约听到了爱丽丝的声音，听起来有些担忧。或者也许是在抱怨。谁知道呢。谁在乎呢。你抓住内裤的腰带，把它们撑开，然后套在头上，你的鼻子紧紧贴着她小巧的胯部弄脏布料的地方。");
         outputText("[pg]你立刻意识到了。你已经达到了：顿悟。这太简单了，比偷走婴儿的棒棒糖并用它自慰还要简单。这就是神明发明内裤时的真正意图。旁观者可能会指着你，称你为疯子，但你比他们更清楚。现在，你了解了真正的光芒，那种将孩子的内衣戴在头上，呼吸着几分钟前穿过它的年轻女孩的甜美香气的幸福。令人兴奋、舒适又刺激。你的思想和性欲合二为一，" + get_player().cockVaginaNeuter("你的肉棒威胁要[if (isnakedlower) {爆裂开来|把你的[armor]撕成碎片}]","你的小穴更像是一个瀑布","你平坦的胯部感到被冷落") + "，随着你升入新的快感高度。");
         outputText("[pg]当你花时间愉快地把丝滑的布料在脸上摩擦，把世界上其他一切都抛在脑后时，你几乎忘乎所以了。");
         outputText("[pg]一阵战栗。即将高潮的明显感觉将你从沉醉中猛然拉回现实。你猛地睁开眼睛。太迟了吗？你深吸一口气，屏住呼吸；你不想做到那一步，哦，不。你在边缘与汹涌的欲望搏斗，几乎要被推下深渊。但凭借着所有的精神力量，你稳稳地站在了悬崖边上。攻势再次退去。你胜利了。你呼出一口气，露出了微笑。好险。尽管你很想，但你不能留下这条内裤，至少现在不行。触觉和嗅觉上令人陶醉的双重冲击对你来说太过强烈，你还没有准备好。当你把它们从脸上拿开时，一阵沮丧感涌上心头。你必须把它们还回去。");
         outputText("[pg]看着手中现在已经皱巴巴的内裤，你突然有了一个主意。那是你小时候，你母亲有时会用你的内裤做的事情。那很可爱，这个想法让你开心地笑了起来。但现在你必须试着回想她到底是怎么做的。" + (get_player().isChild() ? "虽然没过多久，但你以前从来没有太注意过。你现在后悔了。" : "已经有一段时间了。你希望能想起来，但记忆很模糊。你只能临场发挥了。"));
         outputText("[pg]你在手中翻转着，仔细检查着小女孩的内裤。");
         outputText("[pg]嗯，这个翻过那个，然后转过来从这里穿过去，然后……不对。从这里？感觉好软，这布料，太可爱了。你想多抚摸一下……也许把它们弄平，然后……不，不，完全错了。你撤销了刚才的步骤，重新开始。也许像这样拿着它们，然后闻——不，不是闻——把腰带向内<i>折叠</i>，然后这个翻过那个……对。你摩擦着大腿，咽了口唾沫。按住中间，然后翻过来，折叠另一边。现在它看起来应该像……嗯……不太对。拉一下这里？不，不，退后一步，再试一次。折叠这里，按住那里，转，再折叠，再转一次。好了。你喘着粗气，身体发热，但你把这些抛在脑后。集中注意力，回想起来！腰带需要穿过这个环……像这样。稍微调整一下，然后……拉紧这个环。对。把蝴蝶结再展开一点，大功告成！");
         outputText("[pg]伴随着灼热、沉重的呼吸，你得意地把内裤蝴蝶结举在面前。完美。但你真的必须把它们还回去吗？它们现在看起来更漂亮了。你真的想留下它们，闻它们，把它们据为己有。不。不，你会还回去的。");
         outputText("[pg]大半个小时过去了，你这才第一次低头看向被你打败的爱丽丝。她的双腿依然张开着，那孩童般的小穴一览无余，她看着你，脸上似乎凝固着深深的、困惑的皱眉。当你拿着蝴蝶结跪在她双腿之间时，她甚至没有任何反应。只有她那充满怀疑的眼睛跟随着你的动作。你本想把它系在她的脖子上，但发现她那里已经有一个了。好吧。你稍微整理了一下她那[alicehair]、凌乱的头发，把她那变成丝带的内裤放在她的头顶，就在她那可爱的小角之间，然后充满爱意地拍了拍她。");
         outputText("[pg]然后你才反应过来。你无视了警告，现在你已经在半空中了，被扔下了悬崖。");
         outputText("[pg]你俯身在这个小女孩上方，双手紧紧撑在地上，随着液体般的快感在体内爆发，你颤抖着呻吟起来，肌肉紧绷，终于达到了高潮。" + get_player().cockVaginaNeuter("你的[cock]，[if (isnakedlower) {没有衣物和盔甲的束缚|可怜地被困在你的[armor]里}]，喷射出粘稠的液体[if (isnakedlower) {落在身下的恶魔身上，用她极度渴望的精液弄脏了她|进入它的牢笼，迅速用精液弄脏了你的装备，有些漏到了身下的恶魔身上}]。","你的[vagina]，一直没有被触碰，收缩着[if (isnakedlower) {并用女性的汁液弄湿了你的大腿，有些滴落到身下的恶魔身上|在你的[armor]里，用女性的汁液弄脏了你的装备}]。","当然，这只是精神上的；你双腿之间荒芜的区域只流出了一股泪水，浸湿了你的[armor]。") + " 但你现在什么也做不了——也不想做——所以你顺着颤抖的狂喜浪潮直到结束。你突如其来的高潮很快平息下来，你发现自己正与皱着眉头的恶魔四目相对，沉重地喘息着喷在她的脸上。");
         outputText("[pg][say: 那个……] 你灼热的呼吸一定把她从恍惚中唤醒了。[say: 你是……我……什么？]");
         outputText("[pg]你深吸一口气，在小女孩的脸颊上亲了一下，然后站起身来。拍了拍身上的灰尘，你欣赏着自己的杰作。她依然四仰八叉地躺着，摆出一个半吊子的求欢姿势，困惑的目光在你湿透的裤裆、她自己完好无损的私处，以及她头上那个内裤蝴蝶结之间来回游移。");
         outputText("[pg]你对自己点了点头，然后转身向营地走去。回家的每一步都伴随着满足的轻快步伐。");
         get_player().orgasm("all");
         aliceCorruption(0,true);
         get_combat().cleanupAfterCombat();
         spriteSelect(SpriteDb.get_s_alice_demon());
      }
      
      public function alicePantiesFold() : void
      {
         clearOutput();
         outputText("[say: 那么，我们现在该怎么办呢？]恶魔女孩用假装无辜的语气问道。[say: 你打败了我，我完全任你处置~ 现在你甚至征服了我的内裤！哦，我该怎么办，我只是一个无助的、赤身裸体的小女孩，等待着——]你让她安静一会儿，你需要集中注意力。[say: 我——嗯，好吧。]她看起来一点也不确定。");
         outputText("[pg]在你小的时候，你妈妈有时会用你的内裤做些什么。那很可爱，一想到这个你就忍不住开心地笑了起来。但现在你得试着回忆她到底是怎么做的。" + (get_player().isChild() ? "虽然没过多久，但你以前从来没怎么注意过。现在你后悔了。" : "已经过去一段时间了。你希望能想起来，但记忆很模糊。你只能临场发挥了。"));
         outputText("[pg]你在手中翻转着，仔细检查着小女孩的内裤。");
         outputText("[pg]好吧，这个大概是翻过去，然后把它们转过来，从这里挤过去，然后……不对。从这里？也许把它们弄平，然后……不，不，完全错了。你拆掉刚才折的，重新开始。也许像这样摊开并按住，然后把腰带向内折，接着这个叠在那个上面……对。按住中间，然后翻过来，把另一边也向内折。现在它看起来应该像……嗯……不太像。拉一下这里？不，不，退后一步，再试一次。折这里，按住那里，转过来，再折一次，再转一次。好了，这样看起来就对了。现在需要把腰带塞进这个环下面……像这样。稍微调整一下，然后……把环拉紧。对。把丝带再展开一点，大功告成！");
         outputText("[pg]你得意洋洋地把内裤折成的蝴蝶结举在面前。虽然看起来没有你母亲折的那么优雅，但也只能这样了。已经够好看了。");
         outputText("[pg][say: 嗯……]你低头看向爱丽丝，她脸上写满了疑惑。[say: 它……很可爱，我很喜欢，但是……为什么？]你轻笑一声，告诉她你还没弄完，好戏还在后头呢。");
         outputText("[pg]当你跪在她张开的双腿间，手里拿着蝴蝶结，离她那稚嫩的阴缝只有几英寸远时，她皱着的眉头舒展开来，脸上闪烁着兴奋的光芒，开始漫不经心地抚摸自己。你注意到，她的脖子上已经戴着一个蝴蝶结了。戴在她身上很好看，但这意味着你需要给你的蝴蝶结找个新位置。当你凑近抚摸她那凌乱的[alicehair]头发时，她温热的呼吸弄得你的下巴痒痒的。");
         outputText("[pg][say: 嗯~ 你大可直接告诉我你想要什么，没必要一开始就这么粗暴嘛，]正在自慰的爱丽丝一边迎合着你的抚摸，一边发出满足的咕噜声。[say: 即使是这样，我也能为你做任何事。任何事~]任何事？那太好了。你把内裤折成的蝴蝶结放在她的头顶，正好在她那可爱的小角之间，然后在她的脸颊上亲了一下，接着向后靠去，欣赏着她的模样。");
         outputText("[pg]完美。她现在看起来真是可爱极了。也许你应该把她当成一个活生生的洋娃娃养起来，这样你就可以整天玩换装游戏了。但这可不行，这个小女孩需要留在她的自然栖息地。你揉了揉她的头发，站起身来。");
         outputText("[pg]她很快意识到你已经完事了，自慰的手也停了下来。[say: 等等，就这样？你不打算像个恋童癖一样蹂躏我吗？] 她的声音听起来很困惑，甚至有些绝望。[say: 我的意思是，你可以——我……求你了？] 你啧啧两声，责备了这个小女孩。像她这么甜美的小家伙不应该这样乞求被操。而且她应该穿上内裤，不然会感冒的。看着她生气的样子，你笑了起来。看起来太可爱了。");
         outputText("[pg]你决定不再让这个可怜的恶魔女孩难堪，最后看了一眼你的杰作，然后转身溜达回你的营地。");
         outputText("[pg][say: 但是，为什么啊？] 她在你身后喊道。你没有理她，只是轻声笑了笑。");
         outputText("[pg][say: 喂——！]");
         dynStats(DynStat.Cor(-1));
         get_combat().cleanupAfterCombat();
         spriteSelect(SpriteDb.get_s_alice_demon());
      }
      
      public function alicePanties2() : void
      {
         clearOutput();
         outputText("当你靠近倒在地上的爱丽丝时，她的表情从疲惫变成了恐惧。你不得不怀疑她的小脑袋里到底在想些什么。你脸上那柴郡猫般的笑容就那么让她害怕吗？她确实该害怕。你的" + get_player().cockVaginaNeuter("[cock]在[armor]的束缚下紧绷着，乞求着释放","[vagina]浸湿了[armor]的内侧，乞求着释放","平坦的下体微微刺痛，乞求着不可能的释放") + "。你确信，面前的小女孩也会喜欢这种释放的。但你不会让事情发展到那一步。不，你计划了比仅仅侵犯一个小女孩更邪恶的事情。一些更……刺激的事情。你的笑容更灿烂了。");
         outputText("[pg]站在她身旁，俯视着这个被打败的孩子，你清了清嗓子，用最威严的语气下达了命令。她要把她的内裤交给你。立刻，马上。");
         outputText("[pg]惊讶、困惑、释然、不确定，然后又是困惑。当她那双[aliceeyes]的眼睛注视着你时，她的表情无声地诉说着她内心的想法。你可不打算把刚才的话再重复一遍。");
         outputText("[pg][say:我的内裤？]女孩终于开口问道，神情中带着一丝紧张和困惑。[say:你是要——我是说……当然可以？]她似乎终于明白了你的意思，踢掉鞋子，撩起裙子，将她的胯部完全展现在你面前。一条近乎不透明的白色连裤袜包裹着她纤细的双腿，而隐藏在下面的正是你渴望的东西：她那" + (panties == "black" ? "黑色的、少儿不宜的" : "纯洁的、孩子气的") + "内裤。看到你充满欲望的目光，她脸上露出了会意的微笑。");
         outputText("[pg]小恶魔纤细的手指滑入薄薄的布料下，小心翼翼地将连裤袜褪下。当她露出那" + (panties == "black" ? "性感的" : "可爱的") + "内裤时，你感到下身一阵抽动。你勉强克制住伸手将它们扯下的冲动，任由她以慵懒的节奏继续。紧身裤终于离开了她现在赤裸的双腿，她开始重复脱内裤的动作，尽管动作要缓慢和刻意得多。就在内裤只遮住她一半私处的时候，她那黑桃状的尾巴，在你提出奇怪的要求后仿佛重获新生，潜入她的下唇之间，性感地卷住布料。这个稚气未脱的女恶魔用她长长的尾巴逗弄着她发育不全的小穴，在帮助滑下内裤的同时，尾巴上也沾满了她发情的淫液。一声轻柔的呻吟从她唇间溢出，但你无暇顾及这番景象。你的目光死死盯着她的[alicepantieslong]内裤，看着它们顺着小女孩[aliceskin]的双腿缓缓滑落。她将内裤举向空中，递到你面前，同时展示着她闪闪发光的阴唇，这个姿势与她孩子气的外表截然不同。");
         outputText("[pg]经过仿佛一个世纪的诱惑与挑逗，这个娇小的尤物终于将内裤褪过脚踝，彻底脱了下来。随后，她大大地张开双腿，用尾巴尖挑起那件你梦寐以求的衣物递给你——眼神迷离，还将一根手指含在唇间。");
         outputText("[pg]就是这个，这就是你想要的。距离你的鼻子仅有几寸之遥。你伸出手，抓住了小女孩的内裤。");
         aliceCorruption(5);
         menu();
         addButton(0,"闻一闻",alicePantiesSniff).hint("深深地吸一口气。");
         addButton(1,"折叠",alicePantiesFold).hint("把它们折成一个可爱的蝴蝶结。");
      }
      
      public function alicePanties() : void
      {
         clearOutput();
         outputText("你大步走到被打败的女恶魔面前，告诉爱丽丝，如果不先享受一下，你是不会离开的。她假装痛苦地用手捂住头。[say:我投降，只求你温柔点，]她说道，毫无疑问，她正期待着她一直渴望的性爱。你把手放在她的头上，一边揉着一边解释说你会非常温柔的。你让她仰面躺下，为你张开双腿。她当然照做了，你顺势压在了她身上。[pg]");
         outputText("你的手滑过她薄薄的白色长筒袜，悠闲地向上摸索，来到她柔软的[aliceskin]大腿上。随着时间的推移，年轻的魅魔在越来越强烈的期待中颤抖着。虽然对你的敌人不需要前戏，但你还是忍不住从挑逗她中获得了一丝自鸣得意的满足感。你捏着她的大腿，在上面轻轻地吻着，同时一点点地靠近她的胯部。她的肌肉兴奋地紧绷起来。她想要进入正题。你把脸埋进她的[alicepantieslong]内裤里，闻着她散发出的情欲气息，感到一阵兴奋。当你的鼻子在她的阴蒂上摩擦时，她发出呜咽声，这是你允许她获得的唯一一丝快感。[pg]");
         outputText("你觉得前戏够了，于是把她的内裤从腿上拉了下来。");
         if(get_player().get_armor().get_name() != "nothing" && get_player().get_lowerGarmentName() == "nothing")
         {
            outputText("紧接着你脱下了自己的[armorName]。");
         }
         else if(get_player().get_armor().get_name() == "nothing" && get_player().get_lowerGarmentName() != "nothing")
         {
            outputText("紧接着你脱下了自己的[lowergarment]。");
         }
         else if(get_player().get_armor().get_name() != "nothing" && get_player().get_lowerGarmentName() != "nothing")
         {
            outputText("紧接着你脱下了自己的[armorName]和[lowergarment]。");
         }
         if(get_player().get_gender() == 2)
         {
            outputText("你把小女孩微湿的内衣举到脸前，深深地吸着她的信息素。你的脸颊泛红，你的[clit]因需求而肿胀，让你产生了一种想要自慰的冲动。当你开始自慰，把她晾在一边时，爱丽丝困惑地盯着你。你强忍住笑意，看着年轻魅魔的困惑，提醒她她已经被打败了。她没有权利享受快感。没有权利满足她恶魔般的饥渴。你张开你的[vagina]，进一步用你的私处挑逗她。爱丽丝把手伸向她赤裸的胯部，直到你阻止了她。当你向前倾身时，她紧张地看着你。[say:不，不，]你命令道，向她解释在这里她不被允许获得<b>任何</b>快感，甚至不能自己动手。她把手放回地上，默默地呜咽着。这种支配和控制让你更加兴奋——很高兴看到一个饥渴的性爱恶魔拼命地克制自己，而只有你一个人在继续高潮。你把她的内裤从脸上移到你的下体。她能得到的最接近性爱的东西，就是你和她的气味混合在一起，而她只能无助地看着。内裤在你的阴蒂上产生粗糙的摩擦；过度刺激让它几乎燃烧起来。你不自觉地用你的[hips]在这个临时的性爱道具上摩擦。她私处的气味仍然留在你的鼻孔里，为你提供了额外的推力，让你达到了高潮。当你喷射在她的内裤上时，你发出了狂喜的呻吟。你把弄脏的衣物留给她，扔在她的肚子上。[pg]");
            get_player().orgasm("Vaginal");
         }
         else
         {
            outputText("你掏出你的[cock]，向倒下的恶魔展示它的全部荣耀。她饥渴地盯着它。当你把柔软的" + panties + "布料裹在你的工具上时，她的希望变成了困惑。这次她不会从你这里得到任何滋养。她残留在内裤上的淫液带来的感觉提供了额外的刺激。你缓慢而刻意地套弄着，嘲弄着她。她不配感受到你的肉棒插入她的身体。她还没有赢得吸食你性能量的权利。几滴前列腺液形成了一个湿润的斑点，更加激发了爱丽丝对精液的渴望。你加快了速度，炫耀着你自己的兴奋。她原本的猎物，正跪在她身上，喘息着需要。一根[cock]如她所愿地在欲望中跳动，却又遥不可及。高潮只是为了嘲笑她。爱丽丝无法忍受眼前的景象，把手伸向她自己赤裸的胯部，直到你阻止了她。当你向前倾身时，她紧张地看着你。[say:不，不，]你命令道，向她解释在这里她不被允许获得<b>任何</b>快感，甚至不能自己动手。她把手放回地上，默默地呜咽着。这种支配和控制让你兴奋——很高兴看到一个饥渴的性爱恶魔拼命地克制自己，而只有你一个人在继续高潮。她的内裤现在沾满了她渴望的汁液和你滑溜的前列腺液，粗糙的摩擦开始让你无法抗拒。你发出呻吟，同时双手的套弄加快到了疯狂的程度。你的腹肌紧绷，随着精液开始喷射，你又发出一声呻吟。你强迫性地向前挺动臀部，想要让你拒绝满足的雌性受孕。你是勇者，你的肉棒是一种特权。当爱丽丝看着精液从拉伸在你龟头上的内裤中渗出时，她流下了口水。你把弄脏的衣物从身上扯下来，扔给了她。[pg]");
            get_player().orgasm("Dick");
         }
         outputText("也许她能从那上面得到一点点你的性爱残渣，你评论道，然后你");
         if(get_player().get_armor().get_name() != "nothing" || get_player().get_lowerGarmentName() != "nothing")
         {
            outputText("重新穿好衣服并");
         }
         outputText("溜达回家。");
         aliceCorruption(0,true);
         get_combat().cleanupAfterCombat();
         spriteSelect(SpriteDb.get_s_alice_demon_nude());
      }
      
      public function aliceNursing() : void
      {
         spriteSelect(SpriteDb.get_s_alice_demon());
         clearOutput();
         outputText("像所有魅魔一样，她想要的只是进食，这既不需要暴力，也不需要魔法操纵。[if (hasarmor) {你一边将你的[breasts]从上衣中解放出来|你一边轻轻抚摸着你的[breasts]}]，一边向她解释你很乐意喂她。");
         outputText("[pg]一抹淡淡的红晕开始在她[aliceskin]的脸颊上浮现。[say: 我真的不是小孩子了，你知道的，]她小声嘟囔着。你当然知道这一点，但这并不妨碍她在你眼里显得十分可爱。让她吸吮你也是一件让你享受的事，而且她从中得到的可能比她预期的还要多。你坐在地上，张开双臂欢迎她。");
         outputText("[pg][say: 好吧，]她说道，语气中带着明显的尴尬。这只爱丽丝走过来坐在你面前。她先咽了口唾沫，然后身子前倾，撅起嘴唇含住了你的[nipple]。你发出一声满足的叹息，享受着乳汁流入小恶魔口中的感觉。虽然她一开始有些犹豫，但现在似乎在你身边放松了下来。像这样，你简直就像是她的妈妈一样。" + get_player().mf("或者爸爸，就你而言。爱丽丝突然咳嗽起来。[say: 拜托别这么说，你这么说感觉怪怪的。] ","") + "你抚摸着她[alicehair]的头发" + get_player().mf("，让她重新放松下来","") + "。照这样下去，人们可能会忘记她是个性爱恶魔。你拥抱着这个年轻的恶魔，把她更紧地压在你的胸前。有一段时间，她只是个小女孩。");
         outputText("[pg]爱丽丝开始更紧地抱住你，并调整姿势躺在你的腿上。她撩起裙子，在她的[alicepanties]内裤附近来回摇晃着尾巴，邀请你。看来她[i:真的]很喜欢[daddy]的奶水。" + (get_silly() ? get_player().mf("恶魔大声呻吟着。[say: 我跟你说过<b>拜托</b>了，那听起来太奇怪了！]她声音里的恐惧很有趣，但你会放过她，转而满足她的需求","既然如此，你就满足她的需求吧") : "既然如此，你就满足她的需求吧") + "。你开始隔着内裤抚摸她，这种感觉足以让她的双腿立刻绷紧。随着你继续揉搓，她叹了口气，她的吸吮似乎也变得更有力了。既然她的欲望得到了满足，之前对这种安排的任何犹豫现在都烟消云散了。");
         outputText("[pg]你将一根手指顺着她内裤的边缘滑入，将其推开，钻进下面的缝隙中。随着刺激的增加，恶魔猛地吸了一口气，你才刚插进去一点，她的内壁就紧紧地收缩，夹住了你的手指。她[aliceeyes]的眼睛渴望地盯着你，充满了被点燃的情欲。她捏了捏你的[chest]，无声地催促你继续，你也很乐意向她体内推进得更深。滚烫的肉壁紧紧包裹着你的手指，阻碍了任何拔出的企图。然而，在湿润的环境中，没有任何紧箍咒能真正阻止你。");
         outputText("[pg]你加快了速度，手指在她湿滑的[if (silly) {奇妙}]隧道中滑动。她吸吮着你的[breast]，发出的呜咽和呻吟声比平时可爱得多，你也很享受进一步刺激她的乐趣。她突然痛苦地皱起眉头，将你的[hand]夹在双腿之间，同时她的内脏也在颤抖。这么快？等她再次平静下来后，你加倍努力，在她的[if (silly) {有机滑水道|阴道}]中抽插。被这突如其来的刺激所淹没，她把脸从你的乳头上移开，毫不掩饰地发出呜咽和呻吟。");
         outputText("[pg][say: 不——不要了，妈妈，我吃饱了，]她神志不清地说道。她可没那么容易逃脱。你塞进第二根手指，增加了抽插的力度。她发出的声音开始听起来像是哭泣和喘息的混合体。最后，你插到极限，在里面打圈揉搓，享受着她的尖叫声。一股股液体喷在你的手掌上，爱丽丝大叫着迎来了又一次高潮。她喷出的液体很快浸透了你手上唯一干燥的地方，你让这个可怜的女孩放松下来。");
         outputText("[pg][say: 比我想象的要好，]她喘息着说道。你抚摸着她的头发安抚她，她闭上眼睛，温柔地笑了。你平静地起身，让爱丽丝放松下来，沉浸在高潮后的余韵中。");
         get_player().milked();
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function aliceNotNice() : void
      {
         spriteSelect(SpriteDb.get_s_alice_demon());
         clearOutput();
         outputText("你举起你的[weapon]准备攻击她，爱丽丝的眼睛睁得大大的。[pg]");
         startCombat(get_currentAlice());
      }
      
      public function aliceLustFuck3() : void
      {
         clearOutput();
         outputText("你抽身退开，向后倒去，只觉得眼前的一切都在天旋地转。几分钟后，那只爱丽丝爬到你身边，与你面对面。[say:谢、谢谢你，]她说着，随后给了你一个深吻。她已经满足了，也吃饱了，而且很可能已经怀上了。你内心那个斩妖除魔的勇者为此感到懊恼，不过你想，等她把小恶魔生下来之后再杀掉就是了。");
         outputText("[pg]你收拾好东西，踉跄着离开了，疲惫程度远超你的预想。");
         get_combat().cleanupAfterCombat();
         spriteSelect(SpriteDb.get_s_alice_demon_nude());
      }
      
      public function aliceLustFuck2(param1:Boolean) : void
      {
         clearOutput();
         if(param1)
         {
            outputText("[say:我只想成为你鸡巴的延伸！]她欢喜地尖叫道。[say:把我绑起来，把我当成你的专属飞机杯来用！要是我叫得太大声就堵住我的嘴，要是我不听话就扇我！除了<b>鸡巴！</b>我不需要任何活下去的理由！][pg]");
         }
         outputText("你不断抽送着，忍受着她的喋喋不休，同时短暂地琢磨着，以后是不是该避免把爱丽丝们逼到这种失控的地步。你揉捏着她的大腿和屁股，让她老实待在原位，也顺便享受那份手感；接着，你用拇指短暂按上她那小小的快感开关，她的小穴立刻有了反应。她的阴蒂就像个按钮，一按就能让她的小穴死死绞住你的鸡巴。");
         outputText("[pg][say: <b>操</b>，敏感得像火烧一样，可我不想让你停下！]她哭喊道。发情的魅魔可不好应付。你再次整根没入她体内，感到一阵紊乱的痉挛，伴随着更多充满欲望的尖叫——毫无疑问，这只是她在这过程中经历的众多高潮之一。" + (param1 ? "这只爱丽丝神志不清地发出各种声音，过了一会儿才又勉强能清楚地说话。[say: 把我的子宫颈都顶出淤青来！就算我高潮太多昏过去，也别停，直到你满足为止！]" : ""));
         outputText("[pg]她紧紧夹住你的鸡巴，那力道简直足以把一棵树连根拔起；但她喷涌得如此厉害，你也没有停下动作。欲火在你体内灼烧之际，你突然意识到，不管她是不是有意为之，她那催情光环正以最大强度渗入你的身体。你抽搐的[cock]猛地射出几股，你感觉全身都绷紧了，但你还是继续挺动。");
         var _loc2_:String = get_silly() ? "三次定律，你大概是这么想的。" : "";
         outputText("[pg]女恶魔吐着舌头，脚趾蜷曲起来。" + (param1 ? " [say: 用精液强奸我的子宫！]她央求道。[say: 把我的子宫灌成一个胀鼓鼓、装满你喷射精液的气球！]" : "") + " 一阵短暂的眩晕袭来。你伏在女恶魔身上，紧紧抱住她，好让自己找回一点踏实感，同时继续摆动你的[hips]。又一次射精到来，让你更加疲惫，但你仍没有停下。" + _loc2_);
         outputText("[pg]湿漉漉的拍打声与浓烈的性爱气味充斥着周围的" + (get_player().location == "森林" || get_player().location == "密林" ? "森林" : "区域") + "。每当你整根没入，自己的精液都会溅到大腿上。你深吸一口气，更用力、更快速地挺动，只为迎来最后一次高潮。年轻的魅魔尖叫起来，你也随之释放，把仅剩的每一分力气都倾泻出来，将她喂养到极限。");
         aliceCorruption(15,true,true);
         get_player().orgasm("Dick");
         doNext(aliceLustFuck3);
      }
      
      public function aliceLustFuck(param1:Boolean = true) : void
      {
         var choice1:Boolean;
         var _g1:AliceScene;
         var choice:Boolean;
         var _g:AliceScene;
         spriteSelect(SpriteDb.get_s_alice_demon_nude());
         clearOutput();
         outputText("她的一切幻象，都是为了在不引人注意的情况下施展魔法，直到受害者被难耐的欲望吞没。" + (param1 ? "也该让她尝尝自食其果的滋味，不是吗？你从背包里取出一瓶起泡的淫欲液，拔开瓶塞。你抓住她的[alicehair]头发，把瓶口抵到她唇边，明确让她知道自己必须喝下去。爱丽丝皱了皱脸，张开嘴；你倾斜小瓶时，她没有做任何抵抗。" : ""));
         if(param1)
         {
            outputText("[pg]药剂开始生效，女恶魔浑身颤抖不止。你松开她的头发，她便蜷成胎儿般的姿势，双手紧紧捂在胯间。她满脸涨得通红，甚至似乎因为那无法满足的需求而微微哭了出来。");
         }
         outputText("[pg]现在，轮到她被欲望逼得快要发疯了。你觉得这再合适不过。当然，你可不会白白浪费时间把她挑逗到这种地步。眼下，你自己也已经恰到好处地半硬起来了" + (get_player().isNaked() ? "" : "，并迅速亮出你的阳具") + "。你拍了拍这个燥热难耐的小姑娘，夺过她的注意力" + (get_silly() ? "，让她别再盯着自己的小穴" : "") + "。她看着你的[cock]，露出一副显而易见、甚至能听得出来的惊叹表情。" + (get_player().longestCockLength() < 5 ? "她一定是饥渴到了极点。" : "") + "你直截了当地命令她仰躺下，把小穴摆到你面前，否则你就去找个更好的对象。");
         outputText("[pg]带着你所见过最强烈的热情，爱丽丝改变了姿势，掀起裙子，毫不夸张地说，一把撕下了她的[alicepanties]内裤。她现在赤裸的[aliceskin]小穴在期待中颤抖，阴蒂明显勃起。[say:不、不要找别人，我保证我会是你拥有过的最棒的魅魔！]她大声宣布。");
         outputText("[pg]" + (get_silly() && param1 ? "看着那被撕碎的内裤和心形的瞳孔，你看了看空空如也的药水瓶，思考着科学是否走得太远了。" : "") + "这种程度的被精神破坏的欲望正是你所寻找的，尽管她本来可以把内裤拨到一边。你和她一起趴在地上，把她的腿完全拉起来，把她的膝盖推到胸前。在这种状态下，她不需要前戏，所以你毫不客气地用尽全力插入你的[cock]。她那光滑稚嫩的小穴轻松地扩张开来，她发出一声狂喜的尖叫，惊得附近的鸟儿惊慌失措地飞走。");
         outputText("[pg][say:天啊，<b>太棒了！</b>谢谢你，]她喊道，尽管双腿挡着，她还是笨拙地想要抱住你。你抽出来又猛地顶回去作为回应，引得她又发出一声快感的尖叫。你再往前俯身，找到了一个舒服的姿势，好把你的肉棒深深送进她体内" + (get_silly() ? "贵宾室" : "") + "。[say:用你的[cocktype]狠狠撞我的子宫颈！把我弄坏！把精液灌满我，直到我的内脏都被淹没！]");
         outputText("[pg]她已经被欲望吞没，在你一次次挺入的间隙，她的喃喃自语听起来越来越像是在行商那里能买到的廉价漫画，而不像是一个神志清醒的人会说的话。");
         if(param1)
         {
            if(get_player().hasItem(get_consumables().L_DRAFT))
            {
               get_player().destroyItems(get_consumables().L_DRAFT,1);
            }
            else
            {
               get_player().destroyItems(get_consumables().F_DRAFT,1);
            }
         }
         menu();
         _g = this;
         choice = false;
         addNextButton("充耳不闻",function():void
         {
            _g.aliceLustFuck2(choice);
         }).hint("什么胡言乱语。无视她的喋喋不休。");
         _g1 = this;
         choice1 = true;
         addNextButton("仔细听听",function():void
         {
            _g1.aliceLustFuck2(choice1);
         }).hint("什么胡言乱语！听听这个疯子在说什么！");
      }
      
      public function aliceLoss() : void
      {
         clearOutput();
         outputText("爱丽丝注视着你无力的身体，眼睛亮了起来。[say: 你知道吗，这个形态比我以前的要弱得多，]她一边说着，一边大步向你走来。她的脸上洋溢着兴奋的神情。[pg]");
         outputText("在她占你便宜之前，你虚弱地撑起身子，结果却被她一脚踹得仰面朝天。腹部突然传来的重量吓了你一跳，你看到那个小恶魔正坐在你身上，得意洋洋地对你咧嘴笑着，她的尾巴充满活力地来回甩动。她继续自言自语。[say: 自从我把上级惹毛了太多次之后，我就被困在了这个尽可能去性化的身体里。如此虚弱又矮小。]魅魔凑近你，低声说道。[say: 我已经好久没有支配过任何人了。没想到我能找到一个这么弱的人！]她兴高采烈地嘶嘶作响。[pg]");
         outputText("当她拉开距离时，她的兴奋显而易见。毫无疑问，这对她来说是一次特殊的经历。爱丽丝开始从上到下剥去你的衣服，当她摸到你的腹股沟时，动作慢了下来。一抹极其戏谑的冷笑浮现在她的脸上，同时她露出了你的");
         if(get_player().get_gender() == 0)
         {
            outputText("平滑、没有任何特征的下体。她愤怒地皱起眉头。[say: 我好不容易赢了一场战斗，我的战利品竟然是个没有性别的怪胎！？] 她站起来，用尽全力踢向你那平滑的下体，这力道就算没有生殖器也足以让你痛不欲生。她走到你的头部，又狠狠地踢了一脚，直接把你踢晕了过去。");
            aliceCorruption(15,true,true);
            get_combat().cleanupAfterCombat();
            return;
         }
         if(get_player().get_gender() == 3)
         {
            outputText("[cock]和[vagina]。");
         }
         else if(get_player().hasCock())
         {
            outputText("[cock]。");
         }
         else if(get_player().hasVagina())
         {
            outputText("[vagina]。");
         }
         outputText("她轻笑一声，在你的");
         if(get_player().hasCock())
         {
            outputText("[cock]");
         }
         else
         {
            outputText("[vagina]");
         }
         outputText("上用力弹了一下，带来一阵刺痛，让你全身都颤抖起来。[pg]");
         if(get_player().hasCock())
         {
            if(get_player().longestCockLength() < 6)
            {
               outputText("她强忍着笑意，嘴角微微颤抖。[say: 居然有人长着这么小的鸡巴！？带着这么可悲的玩具到处跑，你<b>肯定</b>还是个处男吧！] 尽管她如此羞辱你，你依然完全勃起，丝毫没有软下去的迹象。小魅魔又弹了一下你的[cock]。[say: 真是太小了！这就是你这么兴奋的原因吗？因为太小满足不了女人，所以想操小女孩？] 既然你已经被打败了，除了躺在那里接受她的羞辱，你也做不了什么。这个年轻的女孩走到你的躯干上方，脱下鞋子和长袜。最后，她褪下[alicepanties]内裤，露出光滑稚嫩的耻骨丘。她跨坐在你的脖子上。[pg]");
               outputText("[say: 怎么？你以为我会坐到那个可笑的鸡巴上吗？才怪！我虽然小，但还不至于堕落到那种地步，] 她带着得意的冷笑宣布。[pg]");
            }
            else
            {
               outputText("她在你那根跳动的肉棒顶端轻轻吻了一下。[say: 真可爱，这么幼稚发育不良的人居然硬成这样。] 她的语气中带着嘲弄。她柔软娇小的手紧紧握住你的肉棒，调皮地左右摇晃。[say: 肿胀得这么厉害，却又如此无助。我打赌你一定很想知道，在这个小女孩的秘密花园里是什么感觉！] 她极其异想天开地说着。魅魔又深情地弹了一下你的[cock]，然后站起身来，开始脱鞋子和长袜。她脱内裤的动作特别缓慢而刻意，像是在给你表演。你满怀期待地僵住了，你的兴奋对她来说也显而易见。她又露出了一个苦涩的笑容，用脚踩住你的鸡巴，把它压在你的肚子上。[say: 噢，我知道你那是什么眼神。别高兴得太早，我才是赢家。这是为了取悦我，而不是你。] 她的脚从你那根痛苦而渴望的工具上移开。她跨过你，跪在你的脸上，她那纤细柔软的[aliceskin]大腿夹住你的脸颊。她撩起裙子，低头对你冷笑。[pg]");
            }
         }
         else if(get_player().hasVagina())
         {
            outputText("[say: 多么可爱的一双嘴唇啊，因为我这个小可爱而兴奋得湿漉漉的。] 爱丽丝带着胜利的自我满足感说道。当她极其缓慢地舔过你的[vagina]时，你的身体颤抖起来，紧接着是一声娇笑。[say: 一个小女孩正在舔你的小穴。" + (get_player().isChild() ? "难得有个合适的伴侣，你不觉得吗？" : "觉得不对劲吗，还是说这让你更兴奋了？") + "] 年轻的魅魔在你的[clit]上印下告别的一吻，然后站起身，脱下她白色的透明紧身裤和鞋子。当布料滑落时，她的双腿显得如此优雅，露出了她那完美无瑕的[aliceskin]肌肤的每一寸。");
            outputText("[pg]她脱内裤的动作更加缓慢，裙子遮挡了视线，以此来挑逗你。她上演了一场精彩的表演。爱丽丝漫步走过来，站在你的脸庞上方，用她刚才残忍挑逗的风景来恩赐你。[say: 尽管我很享受品尝你那变态的嘴唇，但我[b:是]胜利者，我们理应把重点放在我的快乐上，] 她说着，跪了下来，闷住你的脸。[pg]");
         }
         outputText("你感觉到一个尖锐但柔软的物体在戳你的");
         if(get_player().hasCock())
         {
            outputText("[cock]");
         }
         else if(get_player().hasVagina())
         {
            outputText("[vagina]");
         }
         outputText("，大概是她的尾巴。[say: 但如果你是个乖[boy]，我也许会让你也爽一爽。] 有了这个令人欣慰的想法，加上别无选择，你决定为她献上一场勇者级别的表演。你将双臂勾在她的双腿上，把她的肉缝紧紧拉向你的脸。她动情的味道立刻涌上你的舌尖，咸咸的又带着甜味。你轻柔地吸吮着她的阴蒂，引得这个傲慢的恶魔一阵颤栗。当你的舌头探索她阴蒂包皮的每一个角落时，她兴奋地呜咽呻吟着，但好戏才刚刚开始。你将湿滑的舌头坚定地滑向她等待着的入口，在边缘舞动，然后深入。听到她的喘息声，你脸上露出了得意的笑容。你注意到，她的里面和外面一样美味娇嫩。你的舌头在她年轻的恶魔小穴入口处旋转，浸透了汁液。她的味道会在你身上停留一段时间，而且令人愉悦。你撅起嘴唇，紧紧地吻了一下，同时把舌头抽出来。当你开始沉浸在口交的技巧中时，你的");
         if(get_player().hasCock())
         {
            outputText("[cock]");
         }
         else if(get_player().hasVagina())
         {
            outputText("[vagina]");
         }
         outputText("感觉到魅魔坚硬的尾巴在上面摩擦。显然，她对你的表现很满意，决定回报你的快乐。[pg]");
         outputText("[say: 是的，真是个乖[boy]！现在别分心，只有你继续保持好表现才行。] 爱丽丝在她的尾巴");
         if(get_player().hasCock())
         {
            outputText("缠绕拥抱中说道。");
         }
         else
         {
            outputText("探索性地试探中说道。");
         }
         outputText("这个恶魔散发出的色情气息，在她这样支配你之前就已经让你兴奋不已了。现在，你的脸埋在她青春期前性器官的奇妙气味中，你就像一触即发的扳机，勉强支撑着。那条可爱的黑桃尾巴不需要费多大力气就能让你崩溃，而她显然也知道这一点。肉乎乎的尾巴用力地摩擦着");
         if(get_player().hasCock())
         {
            outputText("在你的[cock]上摩擦，迫使你的骨盆肌肉痉挛，高潮从下半身爆发，将精液喷洒在你的臀部和爱丽丝的尾巴上。");
            get_player().orgasm("Dick");
         }
         else if(get_player().hasVagina())
         {
            outputText("在你流着口水的双唇间摩擦，同时将温暖的液体涂抹在你的[clit]上。你再也无法忍受，肌肉一阵痉挛，迫使你的臀部猛地向上抽动。高潮的汁液全力喷射而出，给你带来了一阵解脱感。");
            get_player().orgasm("Vaginal");
         }
         outputText("魅魔的肌肉与你的肌肉交织在一起紧绷着，用大腿死死夹住你的头。喷涌而出的淫液用美味的精华覆盖了你的舌头。疲惫感袭来，你的眼睛向后翻去。你看到爱丽丝笨拙地瘫倒在你身上，试图支撑起身体，这让你在完全失去意识之前，对自己的表现产生了一种得意的胜利感。");
         aliceCorruption(0,true,true);
         get_combat().cleanupAfterCombat();
         spriteSelect(SpriteDb.get_s_alice_demon_nude());
      }
      
      public function aliceLeave() : void
      {
         clearOutput();
         outputText("看着一个恶魔竟然利用小孩子的魅力，你叹了口气，实在不忍心在这里做什么。你从她身上收集了你能用的东西，然后离开了她。");
         get_combat().cleanupAfterCombat();
         spriteSelect(SpriteDb.get_s_alice_demon());
      }
      
      public function aliceKill() : void
      {
         clearOutput();
         if(get_player().get_weapon().isUnarmed())
         {
            outputText("恶魔已经屈服，你很乐意花点时间来清除这个害虫。你举起双手，");
         }
         else if(get_player().get_weapon().isFist())
         {
            outputText("恶魔已经屈服，你很乐意花点时间来清除这个害虫。你举起戴着护手套的双拳，");
         }
         else
         {
            outputText("恶魔已经屈服，你很乐意花点时间来清除这个害虫。你握紧你的[weapon]，");
         }
         if(get_player().get_weapon().isScythe())
         {
            outputText("像死神收割一样，戏剧性地将它举过肩膀。你呼唤爱丽丝。她抬头看着你，看到死神本身正高高在上地俯视着她，她的眼睛睁得大大的。你一挥手，干净利落地切断了她的脖子。她的头颅滚落一旁，那最后的恐惧神情永远地印在了上面。");
         }
         else if(get_player().get_weapon().isHolySword())
         {
            outputText("感受着它准备净化的正义能量。你俯下身，命令爱丽丝站起来。她温顺地照做了。毫无预兆地，你将剑刺穿了她的胸膛。当她恶魔的心脏被你武器的纯洁所烧焦时，剑刃闪耀着光芒。年轻的魅魔睁大眼睛默默地盯着你，她的生命迅速消逝。");
         }
         else if(get_player().get_weapon() == get_weapons().FLINTLK)
         {
            outputText("弯下腰准备近距离射击。你抓住她的头发把她的头拉起来，将枪管抵在她的眼睛上。在扣动扳机之前，恐惧的神情在她的脸上闪过了一瞬，随后你扣动扳机，将脑浆和骨头碎片从她的头骨中轰出。");
         }
         else if(get_player().get_weapon() == get_weapons().BLUNDER)
         {
            outputText("走上前准备近距离射击。你告诉小魅魔抬起头，她照做了。当她注视着你那令人生畏的枪管时，她的脸上充满了恐惧。在她做出任何逃跑的举动之前，你将枪塞进她的脸并开火，轰碎了她的头骨，将碎片溅射到她身后的地上。");
         }
         else if(get_player().get_weapon() == get_weapons().H_GAUNT)
         {
            outputText("凝视着她的身体，寻找致命一击的有效位置。你意识到一个可以下钩的好地方，粗暴地踢了她的肩膀，让爱丽丝仰面躺下。一个邪恶的微笑划过你的脸庞，你对她的腹部进行了沉重而残忍的打击，撕裂了血肉，并成功地钩住了她的肠子。彻底的开膛破肚应该足够了。");
         }
         else if(get_player().get_weapon().isStaff() && get_player().get_weapon().isChanneling())
         {
            outputText("吟唱着你所知道的魔法，为致命一击注入力量。你踢了恶魔的肩膀，让她平躺在地上，同时将你现在发光的法杖尖端直接猛击进她的胸膛。鲜血从她的嘴里喷涌而出，她的眼睛因震惊而凸出。你从倒下的魅魔身上抬起法杖，在她的胸膛上留下了一个烧焦的法杖印记。");
         }
         else if(get_player().get_weapon().isBlunt())
         {
            outputText("将它高高举起，以充分利用重力，然后向她的头部挥下。爱丽丝的头骨在令人满意的碎裂声中被砸开，过程中内脏四处飞溅。");
         }
         else if(get_player().get_weapon().isAxe())
         {
            outputText("准备处决。然而，你选择不像经典姿势那样走到她的侧面，而是选择从你当前的位置用斧刃进行一次强力的劈砍。爱丽丝的头颅伴随着一声清脆的碎裂声被垂直劈成两半。");
         }
         else if(get_player().get_weapon().isWhip())
         {
            outputText("伴随着一声响亮的脆响挥动它，引起爱丽丝的注意。你命令她站起来，她温顺地照做了。当她这样做时，你将鞭子抽打并缠绕在她的脖子上，猛地拉紧，在这个过程中将她推倒。她的手急忙去拉脖子上的线圈，但徒劳无功。她窒息恐慌的声音让你非常满足。你猛拉了几次鞭子，伴随着她挣扎的咯咯声，直到最后她的身体变得瘫软。");
         }
         else if(get_player().get_weapon().isKnife())
         {
            outputText("大步走到她的侧面，这样你就可以坐下并跨坐在她的背上。你的手抓住她的头发，尽可能高地拉起她的脸。她似乎很痛苦，但你用匕首迅速划过她的脖子，结束了这一切。");
         }
         else if(get_player().get_weapon().isSpear())
         {
            outputText("向小魅魔冲去。你尽可能地集中稳定的力量，刺穿了她的脖子。在死亡的痛苦中，她只能喷出几口鲜血。");
         }
         else if(get_player().get_weapon().isBladed())
         {
            outputText("把她推到膝盖上。她开始从战斗中恢复过来，足以看到你准备挥剑。当爱丽丝试图站起来时，她惊恐地尖叫，但你的砍击太快太重了。剑刃刺入她的脖子，从她的颈静脉喷出鲜血。你没有完全斩首她，因为她在你挥剑时移动了，但看起来你完成了任务。");
         }
         else if(get_player().get_weapon().isFist())
         {
            outputText("掰响你的指关节以引起她的注意。你伸出手，抓住她的头，然后扭动。她的脖子发出令人满意的断裂声。");
         }
         else
         {
            outputText("将它挥向她的太阳穴，结束了这个幼稚的魅魔。");
         }
         aliceCorruption(15,false,false,true);
         get_combat().cleanupAfterCombat();
         spriteSelect(SpriteDb.get_s_alice_demon());
      }
      
      public function aliceIntimateWatersports2() : void
      {
         clearOutput();
         outputText("当你欣赏着发情的小爱丽丝，享受着她的气味时，她有了动作。你娇小的伴侣将身体压低到你的唇边，用她稚嫩的私处轻轻摩擦着你。不难猜出她现在想要什么。你伸出舌头用力舔舐她，品尝着她美味的少女淫液。你的舌头滑过她的阴唇，轻弹她勃起的阴蒂，在紧致的阴道口周围浅浅地试探，并格外关照地挑逗着她的尿道口。她在你上方咯咯娇笑，很快便抬起身体离开了你。");
         outputText("[pg][say:好吧，好吧。我会给你想要的。准备好了……]爱丽丝挪动身体，让她那美妙湿润的小穴悬停在你的眼睛上方，让你尽情欣赏它的全貌。你只来得及沉浸在这令人愉悦的景象中片刻，一股滚烫的金色水流便从她体内涌出。这个看起来很年轻的恶魔的尿液浇在你的额头上[if (hairlength > 0){并覆盖了你的头发}]，然后她慢慢地向前移动。滚烫的水流很快到达你的鼻子，然后是嘴唇。你为她张开嘴，她咯咯笑着把你的嘴填满，在这个地方停留，以确保你能好好品尝她所提供的东西。她的尿液很快填满了你张开的嘴，溢出到你的脸颊上，促使你吞咽。当她再次向前移动时，强烈而苦涩的味道压倒了你的味觉，充满了你的整个喉咙。她迅速覆盖了你的下巴和脖子，然后站起来开始向前走。当她缓慢地迈步覆盖你的[chest]、肚子，最后是你的[if (hascock){[cock]|阴户}]时，她自己的一点液体溅到了她的大腿上。当最后一点温暖的液体从她的双腿间流出时，恶魔在你的胯部上方徘徊，最后变成涓涓细流溅在她的大腿内侧，然后终于停止了。");
         outputText("[pg][say:好吧，那么……我们正式开始吧。] 你的身体被这个小女孩的尿液淋得湿透，而她又重新坐回你的嘴上方。被你浑身湿透的模样彻底挑起兴致后，你立刻将她肿胀的阴蒂含入口中，开始用舌头按揉。爱丽丝被你这番热情的表现逗得愉悦地呻吟起来，很快也俯下身来。她将干爽的上身贴上你满是尿液的身体，顺着你的身体向前滑动，直到抵达你的[if (hascock){勃起的阴茎|硬挺的[clit]}]。你感觉到自己那肿胀而沾满尿液的性器进入了她的口中，她小小的嘴唇紧紧含住它，开始熟练地[if (hascock){吮吸你，那技巧完全不愧是欲望恶魔|用舌头环绕挑逗，按揉你女性化的勃起}].");
         outputText("[pg]被这看似年幼的女孩的尿液覆盖，加上嘴里依然残留的味道，让你感到无比兴奋，没过多久，你便不由自主地在她身下扭动起来。她熟练的[if (hascock){口交|舔阴}]很快让你的肌肉紧绷，你的[if (hascock){[cocktype]|阴蒂}]开始痉挛，强烈的性高潮如潮水般袭来，[if (hascock) {精液喷射进她少女般的口中|淫水顺着大腿内侧流下}]。一察觉到你高潮了，她立刻加快了速度，在你最敏感的时候给予你强烈的刺激。在感受到这巨大的快感的同时，你也不禁想要回报她。你用力地用舌头卷弄着她小巧的阴蒂，直到感觉到它在你嘴里跳动，这让她发出了被你嘴里的[if (hascock){肉棒|阴蒂}]堵住的呻吟声。小恶魔在你湿漉漉的身体上扭动着，很快你感觉到更多的液体涌到了你的脸上，这更加鼓励你在她强烈的高潮中尽可能地过度刺激她。");
         outputText("[pg]当你们俩都完全满足后，她从你的身体上移开，躺在草地上，头靠着你的头。你们俩身上仍然覆盖着金色的液体，她依偎在你身边，亲吻你湿润的脸颊。[say:那很有趣。非常有趣。]你表示同意，并用一只手臂搂住她，将她抱紧。她脸红了，再次亲吻你，这次是吻在嘴唇上。你们俩就这样继续了几分钟，在完全湿透的情况下拥抱和亲吻。然而，你很快决定你可能需要回营地了。你们俩都站了起来，但随后恶魔说了一些让你有点惊讶的话。[say:说起来，你想让我帮你清理一下吗？这是我能为你……做的最起码的事。]你欣然接受，她在手头没有水的情况下，尽可能地帮你擦拭干净。当她让你差不多干了的时候，她柔软的小手感觉很舒服。一旦你差不多干了，你[if (!isnaked){穿上衣服，}]在她的额头上印下一个告别吻，并向她道别。[say:再见！很高兴认识你，如果能再见到你就好了。]你点点头，向她挥手告别，然后出发了。");
         get_player().orgasm("Generic");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function aliceIntimateWatersports() : void
      {
         spriteSelect(SpriteDb.get_s_alice_demon_nude());
         clearOutput();
         outputText("你嘴角挂着诱惑的坏笑，凑近她，告诉她你其实觉得她现在的样子非常性感。小恶魔脸红了，你重重地吻上了她的嘴唇。[say:真的吗？你的口味还真是有点特别呢？不过……如果你喜欢我这样，我也不会抗拒。所以……]爱丽丝的声音渐渐变小，[if (!isnaked){开始帮你脱下[armor]，然后轻轻将你推倒|轻轻将你推倒}]在地上。你赤身裸体地躺在柔软的草地上，小恶魔很快就爬到了你的身上。她把脸凑近你，深深地吻着你，用她柔弱的小舌头撬开你的双唇。你回应着她的吻，双臂环抱住她，揉捏着她娇小的臀部。");
         outputText("[pg]她松开你，充满情欲地看着你的眼睛。[say:操，太爽了，我太需要这个了。]恶魔一边说着，一边将双手放在臀部，动作流畅地一把脱下裙子和内裤。你主动抓住她的衬衫，往上一拉帮她脱掉，和她其他的衣服一起扔到一旁。现在全裸的恶魔跨坐在你的躯干上，她那孩子气般湿透的小穴紧紧贴着你。[say:现在……你想怎么做？]她咧嘴笑着，对你眨了眨眼，等待着你的回答。对于一个恶魔来说，直接让你来决定还真是相当有礼貌。");
         outputText("[pg]你思索了片刻，决定放纵一下自己某种有些不寻常的癖好。毕竟，作为一个勇者，想让一个看起来格外年幼的恶魔尿在自己脸上，也没什么大不了的。在向她表达了你的渴望后，她微笑着点了点头。[say:既然这就是你想要的，那我很乐意效劳。]娇小的恶魔站起身，移动到你头顶上方跪下，面向你身体的方向。她这个姿势让你能完美地欣赏到她那稚嫩的小穴和屁股，她闪烁着水光的外阴缓缓降下，直到离你的脸只有几英寸的距离。");
         doNext(aliceIntimateWatersports2);
      }
      
      public function aliceIntimateTribbing3() : void
      {
         clearOutput();
         outputText("很快，你们的高潮都完全消退，你们安静下来。爱丽丝把头从你身上移开，[if (tallness > 50){抬起头}]看着你，用双臂和尾巴紧紧缠住你。[say:太棒了……非常感谢。] 她直视着你的眼睛，[if (tallness > 50){抬起}]头，热情地吻了你的嘴唇，然后[if (tallness > 50){再次}]低下头靠在你的胸前。心满意足的你低下头，在她头顶印下一连串温柔的吻。你们俩心满意足地默默拥抱了一小会儿。然而，天下没有不散的筵席，所以没过多久你就告诉她你该走了。你把她放回地上，她给了你最后一个紧紧的拥抱。[say:我真的很享受。我真的希望我们能再见面。]");
         outputText("[pg]你退后一步，告诉她你也希望如此。[if (!isnaked){你们俩迅速穿好衣服|你喘口气，看着她穿好衣服}]，然后你启程返回营地，离开时挥手告别。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function aliceIntimateTribbing2() : void
      {
         clearOutput();
         outputText("[say:来吧宝贝，让我看看你的本事！] 她带着一种你很少在恶魔身上看到的青春活力说道。你非常渴望取悦她，也渴望被取悦，于是决定照她说的做。你将她完全湿润的生殖器紧贴着你，然后将她放低，直到你感觉到你那跳动、勃起的[clit]擦过她的阴蒂。她感受到这种感觉，倒吸了一口凉气，急忙用双腿缠住你。既然她已经牢牢地贴着你，你决定是时候真正让气氛升温了。她娇小的身体很轻，你可以毫不费力地降低和抬高她的身体来刺激你们俩，同时挺动你的臀部。当你们的两个快乐按钮摩擦在一起时，[if (tallness > 50) {她很快意识到她的头部高度正好可以关注一下你的[breasts]。她凑上前，将你的一个乳头含在嘴里，灵巧地用舌头绕着它转圈。当你因为这种新的口部刺激而发出一声呻吟时，她用一只手臂紧紧抱住你，另一只手则[if (hasbreasts) {揉捏把玩你的另一个乳房。|捏住并揉捏你挺立的乳头。}] [if (breastrows > 1) {随着她现在完全紧贴着你，她平坦的胸部和坚硬如钻的小乳头现在正好贴着你的第二排" + get_player().breastDescript(1) + "，当她被你轻轻地上下摇晃时，你们的乳头滑过彼此，互相刺激。|随着她现在完全紧贴着你，她完美的平坦胸部现在紧紧贴着你的肚子，当你轻轻上下摇晃她的身体时，她坚硬如钻的乳头四处滑动。}]|她很快意识到这是她将柔软的嘴唇贴上你的嘴唇的完美姿势。爱丽丝紧紧贴着你，深深地吻着你，当她的舌头侵入你的嘴里探索一切时，你能感觉到她平坦的胸部和坚硬如钻的乳头贴着你的[breasts]。你热切地回应她的吻，并确保摇晃她的身体，让她的乳头刷过你的乳头，带来刺激的快感。}]");
         outputText("[pg]你们俩在狂喜中一起呻吟，你越来越快地挺动，尽可能多地从她可爱的小阴蒂中获得刺激。她小巧的翅膀扑腾着，尾巴左右摇摆，完全迷失在狂喜中，将她的全部身心都投入到取悦你和被取悦中，[if (tallness > 50){越来越猛烈、越来越专注地对付你的[breasts]|更深、更热情地吻你}]，因为她越来越接近急需的高潮。然而，越来越接近高潮的不只是她，你用力捏住她的小屁股，意识到你[if (tallness <= 50){在嘴里}]充满情欲的呻吟声越来越频繁，因为你生殖器里的热量越来越高。甚至在你意识到即将发生之前，你就感觉到自己已经到了边缘。你高兴地大叫出来，只能更快、更用力地对付她，你们的阴蒂疯狂地摩擦在一起，快感的浪潮淹没了你，你的肌肉收紧，体液喷涌到你的大腿上。甚至在你的高潮消退之前，你就听到你的伴侣爆发出少女般的欢愉叫声。[if (tallness > 50){她紧紧咬住你的乳头|她将舌头尽可能深地伸进你的嘴里，不受控制地绕着你的舌头跳舞}]，并在身后猛烈地甩动尾巴，无法停止她响亮的高潮叫声，你感觉到她的体液涌到了你的胯部。你仍然沉浸在高潮中，并希望尽可能多地回报她的快感，你绝对没有放慢速度，直到她欢愉的叫声停止。");
         get_player().orgasm("Vaginal");
         doNext(aliceIntimateTribbing3);
      }
      
      public function aliceIntimateTribbing() : void
      {
         spriteSelect(SpriteDb.get_s_alice_demon_nude());
         clearOutput();
         outputText("见她还没意识到这一点，你不禁一笑，慢慢凑过去亲了亲她的额头。小个子女恶魔脸上一红，惊讶地看着你。[say:哦……既然这样的话……]她微笑着踮起身，在你唇上轻轻啄了一下，[say:你愿意陪我待一会儿吗？]听到这句话，你已经没有别的答案了。你笑着告诉她，你当然愿意，而且忍不住觉得她现在这副样子性感极了。[say:如果你喜欢我现在的样子，那就等你亲自感受一下吧。]她坏笑着把身体贴向你，尽可能地用双臂搂住你。准备好让她直接贴上你的[skinfurscales]，你[if (!isnaked){决定迅速脱下身上的[armor]。|坏笑着准备进入正题。}]");
         outputText("[pg][If (tallness <= 50) {一个念头突然在你脑海里冒了出来。尽管你比她还矮，但你觉得她大概还是轻到能被抱起来。你让她先别动，然后伸手环住她的身体，双手一路往下滑，探进她的裙底，稳稳按在她娇小的屁股上。你先用力捏了一把，随后托住她柔软的臀瓣，将她抱离了地面。|拥抱固然不错，但你想让她身体的每一处都贴上你。你让她稍微退开一点，然后俯身抚过她的大腿，接着双手从她裙子的后摆下方探进去，托住她柔软娇嫩的屁股，将她抱离了地面。}]当这个可爱的恶魔姑娘[if (tallness > 50){被抱到能与你平视的高度时，|被抱起来时，}]她紧紧搂住你的脖子，把你拉过去亲吻。你热切地回应着，用你的[tongue]轻轻分开她的双唇，同时用手指温柔地揉捏着她小巧的臀瓣。");
         outputText("[pg]毫无预兆地，爱丽丝突然结束了亲吻。[say:操，你真会接吻。但我希望你打算做的不止是接吻。] 她魅惑地笑着说出最后几句话，然后迅速将上衣从头上脱下扔到地上，向你露出她平坦的胸部和挺立的乳头。你被她那小巧的乳房迷得眼花缭乱，越来越[wet]的小穴里涌起一阵渴望快感的酸痛。还没等你采取任何行动来满足自己的需求，她就放下手，粗暴地从你手下扒掉内裤，然后掀起裙子，露出她湿透的私处。");
         doNext(aliceIntimateTribbing2);
      }
      
      public function aliceIntimateFuck() : void
      {
         spriteSelect(SpriteDb.get_s_alice_demon_nude());
         clearOutput();
         outputText("你[i:do]知道是什么让你有这种想法，而且你非常乐意向她展示。她可能认为世界上没有人会心甘情愿地给予她任何爱意，但你燃烧的头脑中已经想出了一百万种方法来证明她错了。你选择了那个让你心跳最快的方法。");
         outputText("[pg][say:怎么了？]爱丽丝怀疑地看着你问道。[say:你什么都不说。你是不是——]");
         outputText("[pg]你愿意，你现在愿意做任何事。然而，你首先选择做的是抓住她的肩膀，[if (tallness > 66) {俯下身|[if (tallness > 48) {凑上前|踮起脚}]}]去吻她。她毫无防备，以至于在你嘴里发出了一声小小的[say:呀！]。但你的嘴唇没有浪费任何时间，在将注意力转移到她的脖子上之前，你放开了她的嘴唇，让她吸了一口气，这从小恶魔那里引出了更多美妙的声音。");
         outputText("[pg]没有什么比你撕开她的裙子，露出她胸前[aliceskin]的肌肤时发出的哭喊声更美妙的了。爱丽丝试图说些什么，但你[ears]里泵动的血液淹没了她的声音。对你来说，唯一重要的是她那小巧的乳房，那只是刚刚从她的胸腔上隆起的小鼓包。它们在乞求被吸吮。");
         outputText("[pg]没有进一步的犹豫，你移向了她的乳头。你饥渴的舌头疯狂地扫过那小小的凸起，倾注了她无法处理的爱意，她和你一样惊讶。就在她开始习惯你的服侍，感激地呻吟时，你突然把她推倒，让她仰面躺下，这一下让她娇小的身体相当晕眩。");
         outputText("[pg]爱丽丝看起来完全不知所措，但她的眼神清楚地表明她绝对是愿意的。她清了清嗓子，开始说道：[say:我-我明白我错了，但是，嗯……]她没有说完。没关系，你完全知道该怎么做。");
         outputText("[pg]你的[hands]向下移动，拉着她皱巴巴的裙子，她顺从地抬起臀部让你把它脱下来。她的[alicepantieslong]内裤太可爱了，你有一瞬间都不忍心脱下它们，但在你快乐的祭坛上必须做出一些牺牲。你尽可能温柔地脱下它，在再次抬头之前，你注意到布料上有一丝潮湿。");
         outputText("[pg]她光滑的缝隙看起来比你所知道的这个小恶魔要纯洁得多，但尽管如此，你还是被吸引了，完全被她纯洁的错觉迷住了。你想要它，你太想要它了，以至于你[if (!isnaked) {撕下你的[armor]并}]扑倒在她身边，凑上前去，用你的[arms]抱住她。");
         outputText("[pg]你现在侧躺着，把爱丽丝抱在怀里。像这样，她的小翅膀贴在你的[chest]上，偶尔的扑腾让你浑身发抖，她的尾巴[if (haslegs) {在你的大腿之间|缠绕着你}]蜿蜒，安全地避开了。现在只需要把她的一条腿抬高到足以让你的[cock]停留在她的入口下方，准备刺穿她的深处。");
         outputText("[pg][say:呃-呃……]爱丽丝的声音吓了你一跳。她在户外的寒风中微微发抖。[say:你真的想要这个吗？]");
         outputText("[pg]你用行动回答，将你的肉棒向上压入她体内。她很紧，[if (cocklength < 6) {但你的尺寸对她来说刚刚好，而且|[if (cocklength > 12) {由于你的尺寸，几乎有些痛苦|而且你滑进去有些困难}]，但}]没过多久，你就完全沉浸在她体内了。由于没有太多时间准备，她仍然很紧张，但爱丽丝慢慢地呼出一口气，过了一会儿，她放松下来，允许你移动。");
         outputText("[pg]你不需要进一步的邀请，你的臀部立刻开始以轻快的节奏运动，越来越有力地拍打着她的大腿。你紧紧地抱住她，用你游走的双手占据她身体的每一寸。这个娇小的小恶魔是如此柔软，如此柔韧，你几乎不敢相信你在这里，自由地蹂躏一个愿意的小女孩。你的[cock]带着你全部的欲望继续撞击着她，你不确定你能坚持多久。");
         outputText("[pg]但你想兑现你之前的意图——向她展示你有多么欣赏她那妙龄的身体。你的手滑过，然后突然抓住她的阴蒂，这突如其来的袭击让她用细微、紧绷的声音叫了出来。你知道你击中了目标。你继续挑逗她，直到她再也说不出话来，她的小手指伸下来寻找你的手指，无论她是想阻止你还是催促你，你都不在乎。");
         outputText("[pg]你只是继续你的工作，揉捏、抚摸和抽插，直到伴随着最后一声你确信某处某人一定听到的尖叫，她僵住了，她娇小的身体在你身上颤抖和痉挛。尽管她力量微弱，但要把她固定在原地还是有点困难，但这种感觉是值得的，当她的肉壁在你的肉棒周围蠕动时，你自己也发出了一声呻吟。");
         outputText("[pg]想要和她一起享受极乐，你加快了速度，以不顾一切的速度撞击着她。带着如此单一的目的，几乎没过多久你就能感觉到你的高潮即将来临，世界上绝对没有任何东西能阻止你释放并享受她身体的狂喜。");
         outputText("[pg]你的肉棒开始在她体内卸载，每一次脉动都伴随着她双腿的轻微颤抖。她欣然接受了，你把精液洒在她体内的每一秒都感觉像是天堂的新切片。你的精液很快[if (cumhighleast) {在你周围流出|开始减慢}]，你变软的肉棒滑了出来，在她的腿上射出最后几股。");
         outputText("[pg]你沉重的呼吸填满了你高潮后留下的空虚空气，只有当你平息下来时，你才听到她同样气喘吁吁。当你开始从她体内抽离时，爱丽丝似乎有些不情愿，但她显然现在没有力气做任何事情，回想起来，你也感到相当疲惫，即使考虑到前面事件的剧烈消耗。");
         outputText("[pg]尽管你疲惫得厉害，眼下也没别的事可做了，只能[if (isnaked) {收拾好你的随身物品|穿上你的[armor]}]，然后继续上路。离开时，你最后回头看了一眼那个恶魔，她的笑容里似乎透着某种奇异的捕猎意味，但你并没有放在心上，而是任由一股弥漫开来的满足感占据思绪，随后[walk]离去。");
         get_player().orgasm("Dick");
         aliceCorruption(15,true,true);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function aliceIntimateFingering() : void
      {
         spriteSelect(SpriteDb.get_s_alice_demon_nude());
         clearOutput();
         outputText("很好奇她怎么还没明白，你迅速凑近她的脸。她因为害怕而微微僵硬，但当你把嘴唇移到她的头侧，在她的耳朵上轻轻落下一吻时，她很快就放松了下来。你停留了片刻，直接在她耳边低语，说你其实觉得她现在的样子很可爱，而且你想和她多待一会儿，即使这有点冒险。退开身子，你看到她满脸通红，神情惊讶。你决定在柔软的草地上坐下，拍了拍身旁的地面示意她过来，她立刻照做了。她将娇小的身躯靠在你身上，你顺势用一只手臂环住她，紧紧地抱住她。");
         outputText("[pg][say:呵。我已经很久没做过这种事了。换换口味也不错。]小恶魔微笑着，把一只手放在你的大腿上，转头看向你。一看到她那可爱的脸庞，你就忍不住将嘴唇贴上她的双唇，给了她一个漫长而满足的吻。");
         outputText("[pg]过了一会儿，她退开身子，脸颊泛红，脸上带着一丝挫败的神情。[say:来嘛……如果你想要我，那就直接上我。]就在这小恶魔说完后因极度发情而喘息时，你抓住她的衬衫，从她头上扯下来扔到一边。随着她那诱人的平坦胸部展露出来，小巧挺拔的乳头硬得像钻石一样，你决定是时候更进一步了。你俯身将她压倒在背上，[if (!isnaked){脱下你的衣服，然后跨坐在|并跨坐在}]她那充满少女感的身躯上，你的[vagina]滴落着动情的淫液，落在她的身上。");
         outputText("[pg][say:这就对了，来占有我吧。我能感觉到你有多渴望我，所以对我做你想做的任何事吧。] 这个有着青春期少女身体的女孩在说到最后一句时眨了眨眼；看来她很渴望取悦你。你不想让这个苦苦哀求的小家伙失望，于是调整了姿势，俯下身去吻她。她那柔软、年轻的嘴唇散发着无法抗拒的诱惑。你毫不迟疑地分开她的双唇，将你的[tongue]探入她的口中。当你品尝到她甘甜的唾液时，你们的舌头交织在一起，你的一只手游走着，直到托住她的小脑袋。感受着手中她如丝般顺滑的头发，你开始温柔地抚摸，你们两人在柔软的草地上热烈地拥吻。");
         outputText("[pg]没过多久，你的小情人需要你做更多。她拉扯着你空闲的手臂，直到你握住她的手，然后引导你的手去触摸她的裙腰。你立刻心领神会，将她的裙子褪到膝盖处，随后她便一脚将其完全踢开。接着，你温柔而坚定地将手放在她柔软的内裤上，此时内裤已经被她动情的淫液完全浸透，变得湿滑无比。你看着她充满情欲的双眼，结束了亲吻。正当她带着疑惑的表情抬头看着你时，你迅速扯下她的内裤，立刻将一根手指滑入她紧致稚嫩的小穴中。她闭上眼睛，发出了最惹人怜爱的欢愉呻吟。你再次低下头，靠近这个令人无法抗拒的小魅魔的身体，这一次，你将嘴紧紧贴在她平坦的乳房上，亲吻并吮吸着她那小巧却坚挺的乳头。");
         outputText("[pg][say:太棒了！我已经好久没享受过这种感觉了，]她愉悦地呻吟着，开始用她的一只小手急切地揉捏你的[clit]。当她开始挑逗你时，你发出一声轻喘，决定奖励她，于是将第二根手指滑入她湿滑的下体，开始用力地抽插。随着爱丽丝在你每一次用力的抽插中开始呻吟和娇喘，你决定把更多的注意力放在她那可爱的小胸脯上。你开始交替关注她的乳房，头左右移动，一路亲吻，挑逗地玩弄着一边乳头，然后移到另一边，再回到原处。随着你更多地弹弄、挑逗和亲吻她的乳头，她的手揉捏你阴蒂的速度越来越快，你很快感觉到她的三根手指进入了你[wet]的阴道。虽然她的小手指伸得不深，但当你感觉到那柔软娇嫩的手指插入你体内，很快开始按摩你饥渴的下体，同时她的拇指用力摩擦你的阴蒂时，你还是忍不住发出愉悦的叫声。");
         outputText("[pg]你的嘴贴在她的胸前，手抚摸着她柔软美丽的头发，你们都在拼命地取悦对方，没过多久，你就听到她用颤抖的声音大声叫喊。仅仅几秒钟后，你感觉到她那紧致的小穴在你的手指上剧烈地痉挛，当你继续在她体内抽插时，她紧紧地夹住你，高潮的体液喷涌在你的手上和她身下的草地上。你的性欲随着手周围收紧的感觉而增强，而她则更加用力地向你抽插，只需片刻，你就会感觉到自己达到了高潮。当你用淫液弄湿她的手臂和手腕时，快感的浪潮淹没了你。你在喉咙深处呻吟着，忍不住用力吸吮着你嘴里的乳头，用力到足以留下一个印记，让她记住你。你们俩继续着，直到你们都感觉到高潮完全消退，这时你精疲力竭地躺在她身边。她转过身来面对你，依偎着你，在你的嘴唇上轻轻吻了一下，然后对你低语，[say:谢谢你。]你和这个小恶魔躺了一会儿，发现她在某个时候睡着了。");
         outputText("[pg]抱着熟睡的小恶魔几分钟后，似乎是时候该走了。[if (!isnaked){重新穿好衣服后，你|你}]决定把她的衣服收起来，然后抱起她，让她靠在附近的一棵树上。你转身准备离开，却发现她先睁开了眼睛。[say:哦，我一定是睡着了。你要走了吗？好吧……有空一定要再来看我！在外面注意安全！]告诉她你会尽量后，你[walk]开，留她休息。");
         get_player().orgasm("Vaginal");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function aliceIntimate() : void
      {
         spriteSelect(SpriteDb.get_s_alice_demon());
         clearOutput();
         outputText("你告诉这个看起来很年轻的恶魔，你根本不打算伤害她，但你并不欣赏她试图欺骗你的行为。爱丽丝带着些许悲伤的表情看着你，然后说道。[say:听着……对不起。这并不是我[b: 喜欢]做的事。假装成一个孩子，同时用魔法压制我的受害者，信不信由你，这并不是世界上最有趣的做爱方式。现在几乎不可能只是遇到一个人然后正常地和他们做爱了！但我总得想办法活下去。]你很好奇她没有伪装成孩子的幻象时是什么样子，于是你问她是否可以看看她平时的样子。[say:好吧。那好吧，我很少遇到在知道我是什么以及我的意图后还能保持礼貌的人。]");
         outputText("[pg]突然，仿佛凭空出现一般，你能够在这个娇小的女恶魔身上看到各种恶魔特征。她背上长着蝙蝠般的小翅膀，头上长着两只短角，臀部伸出一条细长的铲状尾巴。[say:好了，就是这样。对你不再有任何幻象了。这不是针对你，我只是太饿了！有时候我真的受不了了！]注意到小女恶魔可怜的状态，你对她笑了笑，告诉她你确信外面有很多人会接受她现在的样子，即使公开展示自己是恶魔会有风险。[say:哦，是吗？你凭什么这么认为？]她用苦涩的语气回答道。");
         menu();
         addNextButton("操她",aliceIntimateFuck).hint("给她看看你激情的证据。").sexButton(1);
         addNextButton("指交",aliceIntimateFingering).hint("向这个可爱的恶魔展示你的手指能做什么。").sexButton(2);
         addNextButton("磨豆腐",aliceIntimateTribbing).hint("尽可能让你们双方都享受。").sexButton(2);
         if(get_watersportsEnabled())
         {
            addNextButton("水上运动",aliceIntimateWatersports).hint("勇者被可爱的小恶魔尿在身上也没什么不好的。").sexButton(-1);
         }
      }
      
      public function aliceIgnore() : void
      {
         clearOutput();
         outputText("叹了口气，你告诉孩子你对她的游戏不感兴趣。她困惑而悲伤地盯着你，但没有说话。你毫无阻碍地走开了，靠近她带来的那种奇怪感觉也消失了。[pg]");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function aliceHeadpattedTooHard() : void
      {
         clearOutput();
         outputText("你用拇指勾住她的一只角，继续温柔地抚摸她，另一只手顺着她柔软的脸颊往下，托起她的下巴。她慵懒地睁开[aliceeyes]的眼睛，充满期待和希望地看着你。");
         outputText("[pg][say: 嗯~ 哦，你想——] 她剩下的话被一声清脆的骨裂声淹没，你猛地把她的头扭向一边。小魅魔脸上的满足笑容凝固了，她瘫倒在树干上，永远地陷入了沉寂。");
         outputText("[pg]你站起身，在旁边的灌木丛上擦了擦手。你头也不回地离开了，任由她的尸体被下一个发现她的生物处置。");
         aliceCorruption(5,false,false,true);
         get_combat().cleanupAfterCombat();
         spriteSelect(SpriteDb.get_s_alice_demon());
      }
      
      public function aliceHeadpatsTrib() : void
      {
         clearOutput();
         outputText("你把女孩推倒在粗糙的树皮上，用你的身体压住她娇小的身躯。她对你突如其来的举动惊叫了一声，但并没有试图阻止你" + get_player().clothedOrNaked("，你开始摆弄你的[armor]，脱下碍事的衣物，直到你赤身裸体地暴露在空气中") + "。你的一只手继续在她[alicehair]的头发里穿梭，另一只手则贪婪地顺着她发育不全的身体滑下，抚过她那诱人的平坦胸部，越过她的小肚子，探入她的格子裙下。当你隔着连裤袜和内裤的布料抚摸她那未成熟的阴唇时，她急促的呼吸停滞了。在你的抚摸和揉搓下，她在你的触碰中扭动着，双眼迷离，沉浸在无尽的快感中。但你想要更多。需要更多。");
         outputText("[pg]你抓住她的臀部，调整自己的角度，将你那因期待而流着淫液的[vagina]压在她穿着衣服的胯部。这种接触让你火热的下腹传来一阵阵令人战栗的狂喜，迅速蒸发了你仅存的理智，你开始认真地在这个小女孩身上摩擦起来。在罪恶的拥抱中，她的背部在粗糙的树皮上摩擦，肯定会撕破她的衣服，但你不在乎——原始的本能已经紧紧攫住了你的心智，就像你紧紧抓住她一样，你不顾一切地将骨盆压在这个小小的诱惑者身上摩擦、挤压。她连裤袜的布料在你发烫的肌肤上感觉美妙极了，但你渴望感受她的全部，她的一切。你暂时从她身上移开，着魔般的手拉起她纯洁的衬衫，撕开她的连裤袜，把她的内裤推到一边。");
         outputText("[pg]看着这个被蹂躏的赤裸小女孩，你忍不住流下口水，你的大脑像贪婪的捕食者一样翻滚——你吞噬她，紧紧抱住她，将她狂喜的呻吟和抽泣闷在你的[chest]里，将你赤裸的骨盆与她的摩擦，让自己沉浸在肉欲的百合之欢中。放肆的喘息和叫喊声在树林中回荡，毫无疑问会让你淫乱的行为被附近的任何人听到，但你不在乎。你什么都不在乎，只在乎你即将到来的甜蜜释放。");
         outputText("[pg]你完全迷失在狂喜之中，你的大脑在火热的粉色快感中爆炸，你更紧、更用力地抱住这个小恶魔的头和臀部，就像一位母亲在面对死亡时抱住她的孩子一样，你大叫着迎来了高潮。");
         outputText("[pg]一阵眩晕突然袭来，你瘫倒在粗壮的树干上，气喘吁吁。脑海中的迷雾慢慢散去。终于能再次清晰地思考了，你从小女孩身上抽离，低头看着她，她那可爱、昏睡的面容定格在纯粹的喜悦中。");
         outputText("[pg]你喘了口气，最后摸了摸她的头，然后穿好衣服离开，感觉比平时更迟钝了些。也许该休息一下了。");
         get_player().orgasm("Vaginal");
         aliceCorruption(0,true);
         get_combat().cleanupAfterCombat();
         spriteSelect(SpriteDb.get_s_alice_demon_nude());
      }
      
      public function aliceHeadpatsPats() : void
      {
         clearOutput();
         outputText("你来这里不是为了让她高潮，但这并不意味着你不能让她享受一段美好时光。");
         outputText("[pg]你把手指当成活梳子，双手放在她的头侧。她慵懒地睁开眼睛，带着一丝不确定地看着你。");
         outputText("[pg][say: 嗯，你要做什——啊~] 她的问题消失在长长的叹息和颤抖中，你开始以缓慢的节奏起伏，手指深深地穿过她的头发，就像抚摸小猫一样。你确信如果她能的话，她一定会发出呼噜声。你越来越刻意，越来越强烈地在她的丝发中挖掘，让她在你的手中融化和颤抖，让她沉浸在可能她一生中从未体验过的平静的快感海洋中。");
         outputText("[pg]这个孩子气的魅魔完全迷失在狂喜中，紧紧抓住你耙梳的手指，就像它们涂满了猫薄荷一样。她真是太讨人喜欢了。你想多抚摸她，像宠爱你的" + (get_player().isChild() || get_player().isTeen() ? "妹妹" : "女儿") + "一样宠爱她，仅仅因为她是一个如此可爱、迷人的小东西而奖励她。你想永远听到她的咯咯笑声和哼哼声；那些迷人的声音让你的手移动得越来越有力，让你的心跳随着你沉重的呼吸加快，让你想靠得更近，从任何衣服和道德的束缚中解放出来，将这个孩子拥入充满激情的怀抱，并且——");
         outputText("[pg]她突然发出的怕痒的笑声在你的脑海中回荡，你把自己从恍惚中摇醒。");
         outputText("[pg]" + get_player().clothedOrNaked("你仍然衣冠楚楚。她也是。","她仍然衣冠楚楚。") + " 你的手仍然只是在抚摸她的头，尽管它们已经向下游走了一点，就在她的耳朵下面。什么都没发生。你松了一口气，严峻地意识到你绝不能在像她这样的恶魔面前放松警惕——你下体不断增长的热度证明了这一点。你觉得是时候结束这一切并离开了。");
         outputText("[pg]最后一次揉乱小女孩的头发——引来一声顽皮的抱怨，让她看起来就像刚从床上爬起来一样——你站起身，拍了拍自己。");
         outputText("[pg][say: 你要走了吗？] 她问道，失望之情溢于言表。你有点想留下来，但你还有其他事情要做，于是下定决心拒绝了。");
         outputText("[pg][say: 哦。啊，好吧……] 她叹了口气，也许是因为你们的战斗和你用力的抚摸而太累了，无法试图阻止你。");
         outputText("[pg]你向她道别并离开，感觉比以前更脸红了。");
         aliceCorruption(20);
         get_combat().cleanupAfterCombat();
         spriteSelect(SpriteDb.get_s_alice_demon());
      }
      
      public function aliceHeadpatsLewd() : void
      {
         clearOutput();
         outputText("你越来越频繁地滑过小魅魔的角，每次都从她那甜美的嘴唇中引出一声呻吟，直到你发现自己几乎在抚摸它们，带着充满欲望的活力顺着它们微小的长度滑下。她太小了，太弱了，太没有防备了。她可爱的、充满快感的话语就像一首令人陶醉的圣歌在你的耳边回荡——她孩子般的、扭动的身体激起了你内心的激情之火。");
         outputText("[pg]在你脑海深处，有个微弱的声音试图警告你与这只小恶魔亲热的危险，但你现在欲火焚身，除了最原始的欲望之外什么也听不进去。");
         outputText("[pg]你想要她。");
         aliceCorruption(20);
         menu();
         addButton(0,"指交",aliceHeadpatsFinger).hint("用你那有魔力的手指伺候她。");
         addButton(1,"操她",aliceHeadpatsFuck).hint("给她最想要的东西。").disableIf(!get_player().hasCock(),"此场景需要阴茎。");
         addButton(2,"磨豆腐",aliceHeadpatsTrib).hint("像另一个女人那样满足她。").disableIf(!get_player().hasVagina(),"此场景需要阴道。");
      }
      
      public function aliceHeadpatsLeave() : void
      {
         clearOutput();
         outputText("警惕着这个小恶魔的被动影响，你最后一次拍了拍她的头，然后站起身来。");
         outputText("[pg]她满足地叹了口气，抬头看着你。");
         outputText("[pg][say: 嗯~ 你要走了吗？] 即使她想，她的声音也听不出悲伤，毫无疑问，她的思绪仍在柔软的云端飘荡。她只是对你的确认报以微笑，然后再次闭上眼睛。当你转身离开，让这个小魅魔睡觉时，她平稳的呼吸声微弱地传入你的耳朵。");
         aliceCorruption(5);
         get_combat().cleanupAfterCombat();
         spriteSelect(SpriteDb.get_s_alice_demon());
      }
      
      public function aliceHeadpatsFuck() : void
      {
         clearOutput();
         outputText("你把小女孩推倒在粗糙的树皮上，掰开她的双腿。她对你突然改变的行为发出一声惊叫，但当你把手按在她的胯部摩擦时，她并没有试图反抗，只有一层白色的薄裤袜和里面的内裤将你与她那未成熟的阴缝隔开。你没有心思做前戏。" + get_player().clothedOrNaked("你的[armor]被迅速脱下扔到一边，将你的[cock]暴露在新鲜空气中。","你已经一丝不挂，蓄势待发，当你扑向她时，你的[cock]已经昂首挺立。") + "她试图扭动身体换个更舒服的姿势，但你没有给她时间，一把撕开碍事的裤袜，扯开她的内裤，执意将你的肉棒压在她湿滑的阴唇上。随着她那紧如台钳的入口承受的压力不断增加，年轻的女恶魔紧绷起身体，直到最后，伴随着她的一声尖叫，你猛地插了进去。");
         outputText("[pg]当你向更深处挺进时，她的肉壁紧紧绞着你，而这只幼年魅魔——被肉棒填满的感觉让她欣喜若狂——正尽力去迎合你。但这无济于事，没过多久，你就遇到了阻碍。你慢慢地向外抽动，直到几乎离开她那不断蠕动的紧致通道，然后猛地向前挺起你的[hips]。一点一点地，你将越来越多的长度硬生生凿进这个小女孩体内，直到最后你那跳动的龟头抵上了她的子宫颈，你整根没入了她的体内，被埋入" + (get_player().isChild() ? "另一个" : "一个") + "孩子体内的快感让你兴奋不已。");
         outputText("[pg]你一只手扶着她的臀部，另一只手再次抚上她的头，继续刚才的动作。你向前倾身，让她缠住你，将她抱在怀里，开始卖力地抽插起来。湿润的黏腻声、急促的娇喘和呻吟在树林中回荡，你一边抚摸着这个小小的诱惑者，一边将她按在树上操弄。你毫不在意谁会听到你们这放荡的交欢，而是全神贯注地用你的肉棒尽可能深地填满她，双手始终没有离开她柔软的头发和臀部。");
         outputText("[pg]欲望化作疯狂，驱使你更用力、更快、更深地冲刺，直到你脑海中只剩下在血管中奔涌的白热化狂喜。当你将[cock]狠狠地插到底，将你的种子深深地泵入她青春期前的子宫时，小女孩在你的肩膀上痛苦又快乐地哭喊着。为了不浪费任何一滴，你不断地抽插，直到最后一滴精液都被挤进她紧致的通道里。");
         outputText("[pg]突然感到一阵眩晕，你从昏迷的女孩体内抽出，最后摸了摸她的头，然后摇摇晃晃地站起来，重新穿好衣服。在走回营地的路上，你感觉比以前迟钝了一些。也许睡一觉会好点。");
         get_player().orgasm("Dick");
         aliceCorruption(0,true,true);
         get_combat().cleanupAfterCombat();
         spriteSelect(SpriteDb.get_s_alice_demon_nude());
      }
      
      public function aliceHeadpatsFinger() : void
      {
         clearOutput();
         outputText("你把她推到粗糙的树皮上，跨坐在她身上。她对你突如其来的举动惊叫了一声，但当你扑上前去，将舌头深深探入她那令人无法抗拒的小嘴时，她并没有试图反抗。你被欲望冲昏了头脑，疯狂地蹂躏着她，将一只手从她的头上移开，伸向你的战利品。你不耐烦地掀起她的裙子，潜入她的紧身裤下，在隔开你和她湿润阴唇的柔软内裤上摩擦，准备好随时占有她。你不会再让她等下去了。当你压下去，将手指和布料一起埋入她未成熟的缝隙时，她在你饥渴的嘴里呻吟着。这简直是天堂。当你顺着内裤的阻碍，一直推进到第二个指关节时，她的肉壁紧紧地夹住了你的手指。");
         outputText("[pg]你离开她的嘴唇，让她在极乐中呻吟，同时你的手指在她体内抽插，用小女孩的汁液浸透了她原本纯洁的内裤。这个孩子般的魅魔用双臂环绕着你，像抱着她的[father]一样紧紧贴着你，近到能透过她娇小的胸膛感受到她的心跳。你很乐意满足她，抱着她，温柔地抚摸她柔软的头，而你贪婪的双手将她带向越来越高的快感巅峰，直到她再也承受不住——在你肩头哭喊着——绷紧身体，剧烈地颤抖，然后在你怀里瘫软下来。");
         outputText("[pg]你保持着这个姿势待了一会儿，努力控制着自己燃烧的性欲，最后摸了摸她的头，站起身来。");
         outputText("[pg]你暗自叹了口气，留下小恶魔继续睡觉，转身往回走，下身隐隐作痛，急需释放。");
         aliceCorruption(30,true);
         get_combat().cleanupAfterCombat();
         spriteSelect(SpriteDb.get_s_alice_demon());
      }
      
      public function aliceHeadpats() : void
      {
         clearOutput();
         outputText("你掰得指关节咔咔作响，大步走向倒在地上的女孩。她瞪大了眼睛，试图匆忙爬走，踢起泥土和枯枝。但在她拉开任何明显的距离之前，她的背撞上了一棵高耸、布满沟壑的树干，逃跑的企图被挫败了。那棵巨大的树几乎没有察觉到她微不足道的撞击，只是在你们俩身上落下几片深色的树叶。");
         outputText("[pg][say: 哎哟哟……]她哀叹着，随后在深深的恐惧中抬起头。你[if (tallness > 60) {高高地 }]站在她上方，目光落在她颤抖的身躯上，进行着无声的审判。她无处可逃。你伸出了手。");
         outputText("[pg][say: 不，不要！求求你别这样！我——我会离开的，我发誓！你再也不会见到我了，只——只求你放过我！]她紧闭双眼，无法直视自己逼近的末日。");
         outputText("[pg]你在离她近在咫尺的地方停下了动作。这个女孩是个恶魔。甚至是个魅魔，你知道她拥有怎样的腐化力量。靠得这么近，你能抵挡住她的影响吗？算了，这不重要，一切很快就会结束了。你的触碰让她呜咽着瑟缩了一下。");
         outputText("[pg]你捏住一片缠在她[alicehair]头发里的落叶将它弹开，然后把手放在她的小脑袋上。当你用手指轻轻划过她的头皮时，她的头发摸起来和看起来一样柔软——简直就像天鹅绒一样。你在她面前蹲下，用整个手掌抚摸她，沉浸在捧着小女孩脑袋的顺滑触感中。与此同时，你看着她颤抖的脸庞上紧张的神情逐渐消退，她慢慢睁开眼睛，原本的极度恐惧被惊讶和困惑交织的情绪所取代。她张开可爱的嘴唇，似乎想说些什么，却又找不到合适的词。这对你来说无所谓，她什么都不用说——你知道她想要什么。你轻轻拍了拍她的头顶，然后用手在她的头上大圈大圈地抚摸着。");
         outputText("[pg]你的拇指擦过什么尖锐的东西，她倒吸了一口气。是她的角。两个小巧的、尖尖的突起从她的额头探出。它们看起来很可爱，而不是令人生畏，几乎不符合她这样的恶魔身份。它们坚硬且角质化，但她似乎对它们仍有感觉。你捏住尖端，然后顺着它们短短的长度滑下。她这次的喘息被压抑住了，但证实了你的猜想。你坏笑着，回到她的头发上，手指穿过她长长的、[alicehair]的秀发，顺着她的头侧滑下，然后又向上挠她的耳朵。她靠向你，眼睛在幸福中扑闪着闭上，你用另一只手彻底揉乱她的头发，同时按摩、拍打和挠痒。如果魅魔也能上天堂的话，她似乎已经迷失在天堂里了。你不知道她在那里是否会受欢迎。但从她嘴唇间不时传出的满足叹息来看，你确实让她在这里感到宾至如归。");
         outputText("[pg]但每次你拂过她的小角时，那些叹息就会变成半呻吟。她显然在放松和兴奋之间犹豫不决，而你无情的抚摸让她很难做出决定。");
         aliceCorruption(15);
         menu();
         addButton(0,"离开",aliceHeadpatsLeave).hint("最好现在就结束。");
         addButton(1,"只是摸摸",aliceHeadpatsPats).hint("这一切都很纯洁。");
         addButton(2,"下流",aliceHeadpatsLewd).hint("屈服于你的欲望。").disableIf(get_player().get_lust() < 33,"这个场景需要你有足够的性奋度。");
         addButton(3,"杀戮",aliceHeadpattedTooHard).hint("正确地结束她。");
      }
      
      public function aliceGetPattedLewd() : void
      {
         spriteSelect(SpriteDb.get_s_alice_demon_nude());
         clearOutput();
         outputText("你对她的回答感到很高兴，于是你抓住她的小手，带她走到附近的一棵树旁。你示意她靠着树坐下，她犹豫了一下后照做了。你跟着她，坐在她旁边，把头靠在她的头上。");
         outputText("[pg][say: 呃……你在做什么？] 你告诉她，你想要她答应过的摸头。[say: 可是，我还以为……算了。] 这个娇小的女恶魔发出一声小小的懊恼声，片刻之后，你便感觉到她柔软得像孩子一样的小手贴上了你的头。她开始慢慢地[if (hashair) {用纤细的手指梳过你的头发|用纤细的手指抚过你的头皮}]。[if (hashorns) {片刻之后，你感觉到另一只手温柔地按摩着你[horns]的根部。|片刻之后，你感觉到另一只手轻轻拍着你的头。}] 能让这么一个可爱的小女孩抚摸并[if (hashorns) {爱抚|轻拍}]你的头，感觉真是惬意又撩人。她那双小手有着孩子般的柔软触感，实在太舒服了，让你忍不住感到一股热意在[if (haslegs) {两腿之间|胯间}]升起。你抬眼一瞥，发现这个恶魔正低头望着你，脸颊泛红，嘴角还带着一丝笑意。想到恶魔的天性，你觉得自己很清楚该怎么做，才能让她更加享受这一切。你慢慢把头往下移，一路亲吻着她的身体。");
         outputText("[pg][say: 嘿——嘿，你在干什么？]");
         outputText("[pg]你无视了她的问题，继续往下，直到来到她的腿上。你猛地拉下她的裙子和内裤，将她那孩子般的私处暴露在空气中。你[if (!isnaked) {脱下下半身的衣物，}]调整姿势，让[if (hasvagina) {你的胯部坐在|你的阴茎摩擦着}]她伸出的一条腿的膝盖上，并告诉她继续做她正在做的事。她点点头，你设法将脸贴近她的外阴。");
         outputText("[pg]她继续拍着你的头，[if (hashair) {抚摸着你的头发|按摩着你的头皮}]，而你则欣赏着她那年轻小穴的景象和气味。虽然她绝对不是个孩子，但那却是孩童般的生殖器。她的阴唇闪烁着湿润的光泽，小巧的阴蒂渴望地跳动着。她是个色欲恶魔，而你打算给她你们双方都想要的东西。你将嘴唇贴在她那肿胀的快乐小核上，伸出舌头舔舐，让她发出一声轻微的狂喜娇呼。听到她愉悦的声音，你满意地开始[if (hasvagina) {在她的膝盖上摩擦|用你的肉棒顶弄她的膝盖}]。她立刻领会了你的意图，并充满活力地[if (hasvagina) {将膝盖压在你的[vagina]上|熟练地用膝盖摩擦你的[cocktype]}]，渴望参与其中。她的双手依然在拍打和把玩你的头，你吸吮并舔舐着她那饥渴的阴蒂。但你无法忽视她那紧致的小洞。你将一只[hand]伸向她年轻小穴的入口，用两根手指分开她的阴唇，插入并立刻开始前后抽插。饥渴的女恶魔发出更多幸福的娇呼，并将她的膝盖[if (hasvagina) {紧紧压在你的胯部|牢牢抵在你的勃起上}]。你不断地抽插，你们俩逐渐找到了节奏。");
         outputText("[pg][if (hashair) {她柔软的双手热切地抚摸着你的[hair]，同时将你的头进一步压向她|她的双手热切地按摩着你的头皮，同时将你的头进一步压向她}]。取悦一个正在摸你头的恶魔小魅魔是有好处的。考虑到你对待她的方式，她显然非常热情。你挺动着手指和臀部。她用膝盖摩擦着你，并揉弄着你的头。你的手指更快更用力地在紧致的小穴里抽插。没过多久，这样的好时光就让她阴道肌肉痉挛，紧紧夹住你的手指，同时发出一声高潮的娇喘。一股淫液涌上你的[hand]和下巴，仅仅几秒钟后，你发现自己也迅速接近了高潮。你对着她仍在抽搐的私处呻吟，[if (hasvagina) {用你自己的淫水浸湿了她的膝盖，在肌肉痉挛时用力顶着她，度过你的高潮|感觉到你的[cock]抽搐了一下，然后将你的精液射在她的整个大腿上，随着你度过高潮，每一次喷射都逐渐覆盖得更多}]。你们都没有停下来，直到双方的高潮都平息下来。");
         outputText("[pg][say: 那么……当你说你想要摸头时，我绝对没料到会这样。尤其是当你说你想让[b:我]摸[b:你]的头时。但这正是我需要的，我跟你说。]你站起身，[if (!isnaked) {把下半身重新遮好，然后}]告诉她你也确实很享受。毕竟，能在一个小女孩摸你头的时候舔她的小穴，通常是非常罕见的情况。女恶魔微笑着站起身，重新穿好衣服。");
         outputText("[pg][say: 如果你这么觉得，那就改天再来吧。用这副身体要得到我需要的东西可不容易。]你告诉她你一定会记住的，然后向她告别。她向你挥了挥手，你便回营地去了。");
         aliceCorruption(15,true);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function aliceGetPatted() : void
      {
         clearOutput();
         outputText("你对她的回答感到很高兴，于是抓住她的小手，带她走到附近的一棵树下。你示意她靠着树坐下，她犹豫了片刻后照做了。你跟着她，坐在她旁边，然后迅速把头枕在她小巧的膝盖上。");
         outputText("[pg][say:呃……你在干嘛？]你告诉她，你想要她答应过的摸头。[say:但是，我以为……算了。]小恶魔发出一声小小的沮丧声音，片刻之后，你感觉到她柔软、孩子般的手放在了你的头上。她开始慢慢地[if (hashair) {用纤细的手指穿过你的头发|用纤细的手指抚摸你的头皮}]。[if (hashorns) {过了一会儿，你感觉到另一只手在温柔地按摩你[horns]的根部。|过了一会儿，你感觉到另一只手在轻轻地拍打你的头。}]能有一个可爱的小女孩抚摸和[if (hashorns) {爱抚|拍打}]你的头，真是太令人舒缓和放松了。她那孩子般柔软的双手实在是太舒服了，当她给予你想要的关注时，你忍不住让全身的肌肉都放松下来。你抬起头，注意到这个恶魔正红着脸低头看着你，脸上带着一丝微笑。看来即使是恶魔也能享受这样的事情。");
         outputText("[pg]这真是一种意想不到的消磨时间的方式，只是在一棵好树下放松，让一个恶魔摸你的头。对于一个色欲恶魔来说，这是一种非常健康的活动，但它确实发生了。也许是因为她是一种特别脆弱的生物，或者也许她只是真心喜欢这样。不管怎样，这种舒适的活动是很难被超越的。随着你越来越放松，你的眼睛闭上了，你的意识很快就模糊了。");
         outputText("[pg][say:喂？喂————。醒醒，瞌睡虫。]你从短暂的小睡中被唤醒，睁开了眼睛。爱丽丝的双手放在你的头上，而你的头还枕在她的腿上。[say:这虽然很有趣，但我们已经在这里待了一会儿了。]好吧，你觉得天下没有不散的筵席。你坐起来，紧紧地抱住她娇小的身体，她因此羞红了脸。感谢她给你带来了一段愉快的时光后，你站起身准备离开。");
         outputText("[pg][say:是啊，我想这也不算太糟。即使这不完全是那种能帮我维持生计的活动。也许以后再见吧。]她挥手告别，你则踏上了回家的路。你确信她比她愿意承认的更享受这一切。");
         aliceCorruption();
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function aliceFoxWatch() : void
      {
         saveContent.foxWatched = true;
         clearOutput();
         outputText("可以说这一幕引起了你的兴趣；你带着热切的期待观察着。");
         outputText("[pg]魅魔伸出舌头，慢慢靠近狐狸阴茎尖端，却难以接触。深吸一口气，她闭上眼睛，将舌头和嘴唇紧紧贴在阴茎上。她的舌头本能地开始来回摆动，探索着她最新性猎物的形状和味道。");
         outputText("[pg][say: 味道有点怪……可能有点铁锈味……也可能没有……我不知道。想想就觉得奇怪。我想这也不算……坏。]");
         outputText("[pg]伴随着又一次令人安心的呼吸，爱丽丝再次潜入，这次将狐狸的阴茎妥当地含入嘴里。她的脸上流露出不情愿的好奇，逐渐演变成对这种行为更舒适的适应。她的眼睛半睁着，手把头发拨到一边，以免挡住脸，所有表明这是一次不寻常事件的迹象都消失了。她像任何魅魔一样吸吮阴茎，尽管“受害者”如此野性。人们几乎可以钦佩她如此迅速适应的韧性，但归根结底，她是一个正在给野生动物口交的魅魔。");
         outputText("[pg]毛茸茸的橙色狐狸开心地叫着，吓了恶魔一跳。她无法摆脱自己为了满足需求而堕落到何种地步的想法，但还是继续了下去。她的头低了下去，嘴唇紧紧包住肉结，然后向上拔出，在整个阴茎上留下一道唾液。恶魔的下巴和脸颊不断移动，她的舌头舔舐着她能吞下的每一[if (metric) {厘米|英寸}]狐狸阴茎——事实上，当你看到她那长长的恶魔舌头从嘴唇里滑出，缠绕在肉结上，并尽可能地施加压力时，你发现她吞下的甚至更多。她舌头有节奏的运动有些催眠——一条肉质的触手缠绕在野兽的肉结上，不仅上下移动，还将它的长度拉进拉出。");
         outputText("[pg]兴奋的叫声打破了你和爱丽丝的恍惚状态——它肉结的肿胀清楚地表明狐狸要射精了。虽然她可能会惊讶地睁大眼睛，但当她的肚子开始充满精液时，魅魔又回到了恍惚状态，对这野性的来源毫无芥蒂。她满足地叹了口气，抚摸着这只极乐的生物。狐狸精液的每一次喷射都融化了她曾经拥有的所有顾忌。");
         outputText("[pg]她恶魔般的光环和她为你上演的情色表演，足以让任何人欲火焚身，你决定在事情变得不可收拾之前离开。");
         aliceCorruption(15);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function aliceFoxLeave(param1:int) : void
      {
         switch(param1)
         {
            case 0:
               outputText("[pg]不管那个恶魔在搞什么鬼，你都不想卷进去。你原路返回，多亏了你敏锐的感官，你轻松地避免了冲突。");
               break;
            case 1:
               clearOutput();
               outputText("好吧，这景象确实令人叹为观止，但你绝对对接下来可能发生的事情不感兴趣。你穿过灌木丛往回走，轻笑着，因为你移动发出的声音让爱丽丝倒吸了一口凉气。你回到了营地。");
               aliceCorruption(1);
               break;
            case 2:
               clearOutput();
               outputText("现在你自己也充满了情欲，你觉得是时候回营地冷静一下了。这真是一场精彩的表演。");
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function aliceFoxJump() : void
      {
         clearOutput();
         outputText("在看了那样的表演之后，你觉得<b>必须</b>介绍一下自己，见见这场精彩表演的主角爱丽丝。你从灌木丛中跳出来，一边靠近一边挥手，吓了恶魔和她的野狐狸一跳。");
         outputText("[pg]你再往前走一步，狐狸试图逃跑，以惊人的力量拽着仍然被结住的小恶魔。[say:嘿，等等，什么——！]她尖叫着，在被抓住的震惊和突然的移动之间挣扎。狐狸带着魅魔跑进了森林，她一直在困惑地尖叫。");
         outputText("[pg]该死的名人，连见个粉丝的时间都没有吗？");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function aliceFoxIntro() : void
      {
         var variant:int;
         var _g:AliceScene;
         saveContent.foxWatched = false;
         clearOutput();
         outputText("在灌木丛中漫步时，一种熟悉的恶魔气息席卷而来。你大概知道它可能来自哪里，但这次似乎不是冲着你来的。伴随着这股气息的，还有某种野生动物的吠叫声。");
         menu();
         addButton(0,"继续",aliceFoxContinue);
         _g = this;
         variant = 0;
         addButton(1,"离开",function():void
         {
            _g.aliceFoxLeave(variant);
         });
      }
      
      public function aliceFoxInterrupt() : void
      {
         clearOutput();
         outputText("看够了之后，你决定暴露自己的存在，从灌木丛中跳到空地上，吓了恶魔一跳。");
         outputText("[pg]她立刻僵住了，跳了起来，甚至还没来得及看你一眼就开始大喊。[say: 我没有操动物，我只是在摸它！]");
         outputText("[pg]就在她完成绝望的声明时，她脚跟一绊，摔倒在地上，把狐狸从恍惚中惊醒，让它逃离了现场。你站着，强忍着笑，爱丽丝从逃跑的狐狸转向你，她的脸因尴尬而涨得通红。你们俩之间陷入了一阵沉默。");
         outputText("[pg]女恶魔挣扎着站起来，拍掉裙子上的草。[say: 你、你好，很高兴见到你，我是一个正常的人类小孩。不要跟任何人提起这件事，否则我父母会发现的，他们会因为我跑得这么远而生我的气的。再见希望我们永远不要再见面。]");
         outputText("[pg]你看着她冲向树林深处，肯定打算把自己埋在洞里，直到她忘记这件事。你带着另一个你确信将来会和很多人分享的故事回家了。");
         aliceCorruption(1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function aliceFoxHelp() : void
      {
         var variant:int;
         var _g:AliceScene;
         saveContent.foxWatched = true;
         saveContent.foxNeedArouse = false;
         clearOutput();
         outputText("虽然这场表演很精彩，但你觉得她需要一点推力来加快进度。幸运的是，你碰巧有这样的力量。你悄悄地集中魔力，暗中唤起恶魔的欲望，希望她被眼前的情况分散注意力，没有注意到你的影响。");
         outputText("[pg]爱丽丝似乎仍然没有察觉，紧张地把脸凑过去，嘴巴微微张开。她的嘴唇滑过狐狸的阴茎，让它高兴地喵喵叫。狐狸阴茎的味道在爱丽丝的舌头上蔓延，触发了你的法术渗透到她体内的情色电荷。很快，她的手隔着[alicepantieslong]内裤揉搓着自己的阴道，渴望更多野兽的味道。随着她的头上下摆动，她的脸颊在吸吮时凹陷进去，急切地想要品尝动物精液的味道；即使在这个距离，她内裤上积聚的水分也变得清晰可见。你的计划奏效了，也许比预期的还要好。");
         outputText("[pg]爱丽丝看起来有些苦恼，她把嘴从阴茎上移开，把脸贴在狐狸毛茸茸的肚子上。[say:我……我需要的不仅仅是这个……]她的需求增长得很快，她转过身，拉开内裤，让狐狸可以清楚地看到她饱满的阴阜。");
         outputText("[pg][say:来，来这里，小狐狸，小狐狸。你会比上一个更喜欢这个温暖湿润的地方。]爱丽丝笨拙地低语着她的诱惑。她的脸因欲望和焦虑而涨得通红。");
         outputText("[pg]狐狸不需要进一步的强迫。它翻身站起，开始舔舐恶魔的胯部，当她惊讶地尖叫时，它跳了起来。从狐狸的角度来看，再多闻一闻、舔一舔就足以让她准备好了。它跳起来骑在小魅魔身上，立刻开始盲目地寻找目标。爱丽丝低着头，在所有的期待中退缩着。");
         outputText("[pg]爱丽丝大声地喘息和呻吟。看来狐狸击中了目标。恶魔的手指卷曲起来，从地上拔起草。虽然狐狸很小，但它正在用足以让她前后摇晃的力量猛烈地撞击。她的咕哝声和吐着舌头的脸表明她有多么享受这一刻。");
         outputText("[pg]湿润的吧唧声对你来说就像音乐一样，都是由你自己的魔法指挥的。在这一点上，你可能已经把她变成了一个彻头彻尾的恋兽癖。狐狸尽可能用力地压进去，导致爱丽丝发出另一声沉重的咕哝和呻吟。她被结住了。虽然她可能喘不过气来，但恶魔似乎很平静和快乐，以泵入她子宫的性能量为食。");
         aliceCorruption(15);
         menu();
         _g = this;
         variant = 2;
         addButton(0,"离开",function():void
         {
            _g.aliceFoxLeave(variant);
         });
         if(get_silly())
         {
            addButton(1,"跳出来",aliceFoxJump).hint("见见表演者。");
         }
      }
      
      public function aliceFoxContinue() : void
      {
         var variant:int;
         var _g:AliceScene;
         spriteSelect(SpriteDb.get_s_alice_demon());
         saveContent.foxSeen = true;
         outputText("[pg]穿过灌木丛，你顺着感觉来到了一片有些狭小杂乱的空地，但视野还算开阔，足以看到一个爱丽丝似乎正在这里引诱一只狐狸。");
         outputText("[pg][say: 别、别紧张……你不会伤害我的，你觉得很放松，对吧？]女恶魔说道，这似乎更多是为了自我安慰，而不是试图与野兽交流。她的姿态充满戒备，即使面对的是一只可能刚好能塞进你怀里的小毛茸茸动物。尽管如此，她对安全感的需求仍在继续。[say: 所以只要我使用这种魔法，你唯一的念头就是……高、高潮。就像人一样。这……就像人一样。]");
         outputText("[pg]爱丽丝犹豫地跪下，伸出手，当狐狸凑过来蹭她的手时，她微微跳了一下。有那么几个瞬间，这个小恶魔女孩紧张地抚摸着一只野生狐狸的场景显得如此纯真；这个世界离奇而淫靡的腐化似乎褪去了，就像一个害怕的孩子学会了与自然交朋友。至少，如果不是因为狐狸的包皮里滑出的阴茎随着每一寸的勃起而跳动，你可能会这么想。正如她所说，她的魔法对狐狸的作用就像对人类一样。");
         outputText("[pg]随着唤情和陪伴带来的舒适感，狐狸翻了个身，现在将它红色的狐狸阴茎展示给女恶魔看，她的反应是睁大眼睛，茫然地盯着。缓慢而颤抖的动作将她的手带向了正急切等待着它的野兽阳具。");
         outputText("[pg][say: 它……很温暖。有点滑，算是吧。它，呃，]爱丽丝咽了口唾沫，在继续自言自语地经历这一切时，笨拙地寻找着词汇，[say: 这样就行了。我可以靠这个进食，总比挨饿好。]");
         menu();
         addButton(0,"打断",aliceFoxInterrupt).hint("暴露你的存在。");
         addButton(1,"观察",aliceFoxWatch).hint("看看这会发展成什么样。");
         addButton(2,"唤情",aliceFoxHelp).hint("推她一把。");
         _g = this;
         variant = 1;
         addButton(3,"离开",function():void
         {
            _g.aliceFoxLeave(variant);
         }).hint("你看够了，你能猜到接下来会发生什么。");
      }
      
      public function aliceEncounterInnocent() : void
      {
         spriteSelect(SpriteDb.get_s_alice());
         clearOutput();
         outputText("当你漫步时，一种奇怪的平静感席卷了你。身后的动静让你警觉到有其他人的存在，你转过身，看到一个年轻的女孩。她");
         if(get_player().get_tallness() > 50)
         {
            outputText("抬头看着你");
         }
         else
         {
            outputText("看着你");
         }
         outputText("带着害羞和天真的表情。她似乎不确定你是否友好。知道");
         if(saveContent.knowInnocent)
         {
            outputText("这种熟悉的感觉正是爱丽丝捕食你之前的前兆，你可能想离开或与她对峙。或者，也许这只是一个迷路的孩子。如果是的话，让她失去保护就太糟糕了……");
            menu();
            addButton(0,"离开",aliceIgnore);
            addButton(1,"对峙",aliceConfront);
            addButton(2,"信任",aliceTrust).hint("这当然是个孩子。放下你的戒备吧。").sexButton(-1,false);
         }
         else
         {
            outputText("在这片土地上你所见过的事情，这种担忧显然是很有道理的。不过，你肯定是绝对不会做任何伤害她的事情的。她很可爱，你会尽你所能保护这个孩子的天真。[pg]");
            outputText("[say: 嗯……]她开始说话，你专注地听着。[say: 你能陪我玩吗？][pg]");
            outputText("当然，你带着愉快的神情说道。只要能靠近这样充满童真欢乐的小天使，做什么都行。这也是个好借口，万一有什么邪恶的东西想伤害她，你就能在附近保护她！你跟在现在更加活泼的小女孩身后，看着她一路小跑。你一边走一边打量着她的容貌，注意到她那美丽飘逸的[alicehair]头发随着她的步伐跳动。她穿着一套可爱的衣服，由白色衬衫、深海军蓝和红色相间的格子裙组成，衬衫领口还系着一个红色的蝴蝶结。她是一个纯洁无瑕、美丽优雅的小女孩。[pg]");
            outputText("女孩停下脚步，转过身来，用她那双迷人的[aliceeyes]眼睛看着你。你太沉浸在这一刻了，甚至不确定自己跟着她走了多久。她抓住你的双手，上下蹦跳着宣布道：[say: 我们就在这里玩吧！][pg]");
            outputText("她那[aliceskin]的双手触碰着你，让你浑身一颤。你想抓住她，更多地感受她那纤细却柔软、让人想拥抱的身体。你向前倾身，在空地柔软的草地上依偎着她。你的双手把她抱得越来越紧，同时你的下体也升起了一股热流。");
            aliceCorruption(15);
            menu();
            addButton(0,"继续",aliceWilling).sexButton(-1,false);
            addButton(1,"停止",aliceStop);
         }
      }
      
      public function aliceEncounterBossy() : void
      {
         spriteSelect(SpriteDb.get_s_alice());
         clearOutput();
         outputText("你的脚步慢了下来，因为你感到一种奇怪的感觉在体内涌起。自然地，你环顾四周寻找任何可能的袭击者，但几乎没有发现什么，直到你的目光瞥见一缕[alicehair]的头发，就在它们移动到一块" + (get_player().isInMountains() ? "岩石" : "树") + "后面时。在考虑是离开、保持静止还是靠近时，你发现自己倾向于去接触这个未知的人或事物。当你[walk]过去时，它似乎并没有离开藏身之处，而在对峙前，你放慢了脚步，慢得像冰川移动一样。");
         outputText("[pg]那个躲藏着的看似小孩的人跳了出来，指着你的[face]，严厉地质问你。[say: 你[if (!isday) {这么晚|在这里}]在外面干什么！？在荒野里游荡很危险！]她人类般的外貌和[aliceskin]的皮肤，与她年轻娇小的身躯一样让人放松警惕——身高不超过[if (height>52 || height<47) {家乡的小孩|你}]，[if (height<47) {尽管还是明显比你高|差不多}]。[say: 你迷路了吗？]小女孩问道。你从她的表情中读出了一丝烦躁，但你突然想到，其实，你才是那个应该问这个问题的人。[say: [if (height<51 || isChild) {难道我要无视一个在[areaname]漫无目的地走动的小孩吗？我才是这里年纪大的那个！|你根本不知道你要去哪里！你就是个一团糟的人，迟早会饿死在某块石头下面。}]]显然没有耐心等待回答，女孩抓住你的手，开始拉着你和她一起走。接触的瞬间，温暖立刻传遍全身，");
         if(saveContent.knowBossy)
         {
            outputText("你的大脑立刻恢复了理智，看清了爱丽丝的真面目。");
            menu();
            addNextButton("对峙",bossyConfront);
            addNextButton("信任",bossyTrust);
            setExitButton("离开",bossyLeave);
         }
         else
         {
            outputText("赋予你一种安全感，吸引你去信任她。");
            if(get_player().get_inte() < 20)
            {
               doNext(bossyTrust);
            }
            else
            {
               menu();
               addNextButton("信任",bossyTrust).hint("你必须信任她。");
               addNextButton("停止",bossyStop).hint("你真的需要调查一下情况，而不是盲目跟随。");
            }
         }
         aliceCorruption();
      }
      
      public function aliceEncounter() : void
      {
         var _loc1_:int = 20;
         if(Utils.randomChance(_loc1_))
         {
            aliceEncounterBossy();
         }
         else
         {
            aliceEncounterInnocent();
         }
      }
      
      public function aliceCorruption(param1:int = 15, param2:Boolean = false, param3:Boolean = false, param4:Boolean = false) : void
      {
         var _loc5_:* = null as IMap;
         if(param1 != 0)
         {
            get_player().takeLustDamage(param1,false);
         }
         if(param2)
         {
            dynStats(DynStat.Lib(1),DynStat.Cor(1));
            get_player().changeFatigue(5);
         }
         if(param3 && !param4)
         {
            dynStats(DynStat.Str(-1));
            get_player().changeFatigue(5);
         }
         if(param4)
         {
            if(get_player().cor < 25)
            {
               dynStats(DynStat.Cor(-0.5));
            }
            _loc5_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc5_,2725,FlagDict_Impl_.arrayReadInt(_loc5_,2725) + 1);
            get_player().upgradeDeusVult();
         }
      }
      
      public function aliceConfront() : void
      {
         clearOutput();
         outputText("你深吸一口气，在她的光环影响刚刚开始时理清思绪。你不会容忍她的恶作剧，并这样告诉她。女孩表现得很困惑，尽力维持着她的伪装。保持坚定和严厉的表情，你不会向她屈服。[pg]");
         outputText("她叹了口气，妥协了。[say: 我猜你以前见过我的同类。至少你没有决定直接杀了我。]");
         confrontMenu();
         button(null,"战斗").hint("直接杀了她。");
      }
      
      public function aliceChatSelect() : void
      {
         var _loc1_:int = 2;
         var _loc2_:int = 4;
         var _loc3_:int = 8;
         var _loc4_:Array = [];
         if((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2697) & _loc1_) == 0)
         {
            _loc4_.push(1);
         }
         if((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2697) & _loc2_) == 0)
         {
            _loc4_.push(2);
         }
         if((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2697) & _loc3_) == 0)
         {
            _loc4_.push(3);
         }
         if(int(_loc4_.length) == 0)
         {
            _loc4_ = [1,2,3];
         }
         var _loc5_:Array = _loc4_;
         switch(int(_loc5_[Utils.rand(int(_loc5_.length))]))
         {
            case 1:
               aliceChat1();
               return;
            case 2:
               aliceChat2();
               return;
            case 3:
               aliceChat3();
               return;
            default:
               return;
         }
      }
      
      public function aliceChat3() : void
      {
         spriteSelect(SpriteDb.get_s_alice_demon());
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,2697,FlagDict_Impl_.arrayReadInt(_loc1_,2697) | 8);
         clearOutput();
         outputText("爱丽丝双臂交叉，沉思了片刻。[say: 噢，随你的便吧，我想，] 她说着，褪去了隐藏她恶魔特征的幻象。你看着她走来走去，尾巴随着步伐左右摆动。你问她为什么爱丽丝们不尝试组队。她们个体可能很弱，但如果一群小恶魔都能造成麻烦，她们肯定会更难对付。[pg]");
         outputText("[say: 敏锐的观察。除了这片区域很大，很难找到彼此之外，这也有助于不引人注意。那些最强大的敌人肯定会杀死我们中的一些人，而没有人愿意为了团队牺牲自己。不过，有些爱丽丝尝试过。她们的稀少应该就能说明我刚才解释的问题了……][pg]");
         outputText("她非常主动，而且透露了很多信息。她如此镇定且乐于助人让人有些惊讶，你怀疑她是否有什么不可告人的动机。你的思绪被魅魔打断了。[say: 你知道，我们爱丽丝之间可能无法互相起作用，但如果我们和比自己更强的人组队，就会有很大的用处……比如你。] 这只恶魔一边详细说明，一边迈着优雅的步子靠近。[say: 想象一下我的幻象和情色魔法在你的冒险中能发挥的所有作用。我非常擅长潜行，能够置身于战斗之外。在场外隐形地协助……我的光环可能会让人更容易被说服。我打赌你会喜欢的。有我的帮助，你可以得到任何你想要的东西。][pg]");
         outputText("爱丽丝用炽热的目光盯着你的眼睛，嘴角勾起一抹得意的笑。这些确实是很好的理由。你无法反驳其中的逻辑，就好像她正在让你变得更容易被说服一样……此时你对这种魔法已经不再陌生了。你知道她在做什么。看着她靠得如此之近，你刚才几乎迷失了自我，于是你一把推开她，充满威胁地举起你的[weapon]。你结盟是出于自己的意愿，而不是受魔法或欲望的影响。[pg]");
         outputText("这个喜欢操纵人心的小女孩举起双手，向后退去。[say: 冷静点，我只是对一个非常好的主意比较主动而已。我这就走。][pg]");
         outputText("她留下你一个人，让你感到有些燥热难耐。");
         aliceCorruption(15);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function aliceChat2() : void
      {
         spriteSelect(SpriteDb.get_s_alice_demon());
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,2697,FlagDict_Impl_.arrayReadInt(_loc1_,2697) | 4);
         clearOutput();
         outputText("这只爱丽丝精神焕发地振作起来，她的翅膀和尾巴从幻象中甩了出来，上下蹦跳着。[say: 是的！是的！我已经好久没有和其他有智慧的生物说过话了！][pg]");
         outputText("她冲到你跟前，似乎想给你一个拥抱，你赶紧举起双手阻止她。她踉跄了一下，僵在原地，差点摔倒。你告诉她你不会让她靠得太近，因为她的光环对你来说有点麻烦。[say: 啊-啊。我明白！我只是——我已经在这里待了好几个星期了。我甚至都不确定有多久了。我遇到过另一只陪着我的爱丽丝，但她被美洲豹吃掉了……这里可不是个好客的地方。我们需要用魔法魅惑遇到的任何东西，这样我们才能吸取精气然后逃跑，否则我们很容易就会死掉。我们比那些肮脏的小恶魔聪明得多，但身体上并没有强壮多少。我们对变形也有抵抗力，因为制造一只爱丽丝需要用到大量的炼金术。非常强效的混合物。]她语速极快、紧张地解释着。你问她有多久没和别人说过话了。[pg]");
         outputText("[say: 至少有几个星期了。也许更久。也许久得多。我经常在夜里被噪音吵醒，不得不找另一个地方睡觉。这么频繁地醒来，很难准确地分辨日子。]她叹了口气，花了一点时间让自己放松下来。[say: 我确实还需要进食，但每个人最终都需要社交联系。所以——呃——你……你是做什么的？我是说——跟我说说你的事吧！][pg]");
         outputText("为了顺着她，你详细说明了一下你在玛瑞斯的情况。你提到了你遇到的人，以及你迄今为止取得的成就。");
         if(get_player().hasPerk(PerkLib.HistoryDEUSVULT))
         {
            outputText("当你解释说你来这里是为了肃清这片土地上的恶魔时，爱丽丝的双眼因震惊而瞪得大大的，她的笑容也因恐惧而僵在脸上。");
         }
         outputText("这一切都是你阻止莉希丝及其追随者任务的一部分。你很享受在冒险的短暂间歇分享你的故事。这个小恶魔插嘴道，[say: 哇！这是一个非常有趣又紧张的故事。你肩上的担子真重啊，勇者！我很高兴我不是莉希丝，也和她完全没有关系。我只是个小女孩。希望你的努力能取得成功！][pg]");
         outputText("魅魔步履蹒跚地走开了。这样最好，反正你也应该在暴露于她的光环下太久之前离开。");
         aliceCorruption(15);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function aliceChat1() : void
      {
         spriteSelect(SpriteDb.get_s_alice_demon());
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,2697,FlagDict_Impl_.arrayReadInt(_loc1_,2697) | 2);
         clearOutput();
         outputText("随着她解除幻象，爱丽丝的形态舒展开来，她的小翅膀伸展着，仿佛它们之前是被收起来了，而不仅仅是用魔法掩盖。[say: 我很少有机会能这样单纯地聊天。通常如果我不能吸食我的猎物，我就需要迅速逃跑，否则就会有严重的危险。只是……别靠得太近。我不信任你。我承担不起信任你的代价。][pg]");
         outputText("你举起双手，走到附近的一棵树旁，手肘靠在树干上，以示自己没有恶意。不管怎样，靠近恶魔的气息对你来说也不是什么好事。你让爱丽丝多告诉你一些关于她“同类”的事情。对于一个魅魔来说，拥有如此未发育的身体似乎没什么用，尤其是还伴随着娇小虚弱的体型。[pg]");
         outputText("[say: 当恶魔违抗上级时，就会受到惩罚。通常是性折磨，也就是那些高阶恶魔喜欢施加或观看的把戏。我，呃……我有点太不守规矩了，]她解释道。你点点头，想让她继续说下去。她接着说道：[say: 当强大的恶魔彻底厌倦你时，他们就不在乎从惩罚你中获得快感了。他们只想让你消失，想让你一直受苦。他们用大量的炼金术和魔法把我们变小。我们还会被剥夺进食很长一段时间，以此来降低我们魔法的效力。花了这么多时间和精力，就因为我有时候真他妈受不了那个自大的婊子！][pg]");
         outputText("她的愤怒显而易见。你猜想她是因为自己太虚弱而感到紧张，所以才努力保持冷静。她皱起眉头，用力跺了跺脚。[say: 我这个样子什么都做不了！我不能打架，我几乎没法做爱，甚至都没人<b>想</b>操我！]她紧绷着身体，翅膀和尾巴都挺直了。她恼怒地叹了口气，继续说道。[say: 所以，像我这样的倒霉蛋只能尽力而为。即使我们被削弱了，我们仍然懂基础的黑魔法。我试着调整它以更好地适应我的情况，依靠诡计在人们不知情的情况下不断向他们施加魔法。据我所知，每一个还没死的爱丽丝都在做同样的事情。这是个相当合乎逻辑的策略，也不难想出来。][pg]");
         outputText("说到这里，你感觉到体内的燥热正在逐渐积聚。不管是不是故意的，她的魔法正在对你起作用。这可能是你该离开的信号了，于是你感谢她陪你聊天，并向她道别。");
         aliceCorruption(15);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function aliceBindLewdMore() : void
      {
         clearOutput();
         outputText("你怎么能对<i>那样</i>可怜的脸说不呢？你可能没那么狠心。你叹了口气，妥协了，将手指压在她的胯部，再次听到了那熟悉的喘息声。然而，这一次，你用长而有力的动作按压和揉搓她的阴唇。她自然地试图张开双腿，但这个动作对她来说似乎很尴尬。随着刺激的增加，她那带着喘息的呻吟是渴望情欲的可爱表现，因为你给她的只是隔着布料的轻轻揉搓。作为爱丽丝的生活真的如此悲惨，以至于这就是她能得到的最好的东西吗？");
         outputText("[pg][say: 更……更多。]");
         outputText("[pg]你说什么？");
         outputText("[pg][say: 请-请给我更多……[master]？] 她乞求道。");
         outputText("[pg]作为一个恶魔，落得如此下场真是失败，但你不能否认她在这里已经尽力了。算她走运，你现在有点仁慈。你将手滑入她的内裤下，直接感受她下体的热度。这种直接刺激的跳跃让魅魔感到震惊，你能感觉到她越来越湿。积累了这么多，你能够毫无问题地滑入几根手指，浸入那滚烫的蜜罐，直到刚好没过第一指节才停下来。她对再次被拒绝的想法的反应是真正的恐惧。让她再乞求一下。");
         outputText("[pg]魅魔紧张地结结巴巴地说：[say: 我是个无助的小荡妇，我求你让我用你的手指操我自己！……求-求你了，[master]？]");
         outputText("[pg]你假装思考地伸了伸脖子，决定满足女孩这个愿望。欣喜若狂的爱丽丝笨拙地开始在你的手上摇晃她的臀部，对她在颤抖的肉壁内设法得到的每一点动作都发出呻吟。很难不对一个如此渴望释放的恶魔发笑，她甚至只要有你一动不动的手指可以摩擦就会感到幸福。一声更强烈的呻吟从她的唇间传出，你意识到她不知怎么地更用力地把自己推向你的手，完全吞没了你的手指。当她的眼睛向后翻时，你意识到这实际上足以把她完全推向高潮，她的阴道肌肉几乎在你的手指上振动。");
         outputText("[pg]你从那恶魔的小穴中抽回手指，暴露在开放空气的寒意中。你短暂地欣赏着指缝间闪烁光泽、拉出细丝的湿润，并为你那小小的魅魔玩具想出了最后一件事。她那张开的嘴巴在象征意义上正在乞求，你将浸透性爱气息的手指插了进去。一声命令之下，她顺从地将自己的汁液从你手上吸吮干净，舔遍指缝与四周，尽职地清洁她的\"[master]\"。");
         outputText("[pg]你解开她手腕和脚踝上的绳子，把绳子收好，留下她自己去想办法解开尾巴上的发圈，前提是她没有像现在这样晕过去。");
         aliceCorruption(15,true);
         get_combat().cleanupAfterCombat();
         spriteSelect(SpriteDb.get_s_alice_demon_nude());
      }
      
      public function aliceBindLewd() : void
      {
         var afterLewds:Boolean;
         var _g:AliceScene;
         spriteSelect(SpriteDb.get_s_alice_demon_nude());
         clearOutput();
         outputText("虽然欣赏这番美景很有趣，但你心里还有别的想法。你对着女孩坏笑，戏谑地将手滑上她的腿。当你慢慢地将手伸进她的裙底时，她身体的颤抖让你更加渴望剥夺她的需求，你将手指停在她大腿根部过膝袜上方的裸露肌肤上。一个渴望而绝望的地方近在咫尺，而你所做的只是在它下方用手指跳舞。你将手指绕到后面，滑向她臀部的曲线。考虑到你绑她的方式，拱起的背部和被拉扯的尾巴确实很好地凸显了她匀称的臀部！你在她的脸颊上轻轻拍了一下，她的喉咙里发出了一声尖叫。即使在这种不光彩的情况下，她也极度渴望淫荡的接触。");
         outputText("[pg]既然她这么绝望，你还不如给她想要的！你将拇指平压在她的胯部，清楚地知道在薄薄的棉布下，那颗颤抖的阴蒂就在那里。年轻的魅魔因突如其来的刺激而喘息，同时在你的手上扭动，试图获得更多。你抓住她的臀部，稳住她，直到她停下来，直到她大腿的轻微摩擦也停止了，你才继续。她必须知道，你控制着她如何、何时、何地受到刺激。爱丽丝痛苦地呜咽着——既因为缺乏刺激，也因为她不舒服的束缚——但她咽了口唾沫，深吸了一口气。");
         outputText("[pg]回到她的胯部，你再次将拇指压在她的内裤上，揉搓着隐藏在里面的小豆豆。恶魔的呼吸颤抖着，被呜咽声打断，她试图保持冷静，但收效甚微。当她闭上眼睛时，她开始沉浸在刺激的洪流中，但当你再次抽离时，她本能地夹紧了双腿。你大声思考着是否应该继续，还是就这样把她留在这里。");
         outputText("[pg][say: 不-不要！求求你！] 满脸通红的年轻女孩尖叫道。[say: 我-我是说我……我受不了了，我什么都愿意做。请继续。]");
         outputText("[pg]如果她的头发没有被拉到屁股上，她泪眼汪汪的注视可能会更可爱。该怎么办，该怎么办……");
         aliceCorruption(15);
         menu();
         _g = this;
         afterLewds = true;
         addButton(0,"离开",function():void
         {
            _g.aliceBindLeave(afterLewds);
         });
         addButton(1,"继续",aliceBindLewdMore);
      }
      
      public function aliceBindLeave(param1:Boolean) : void
      {
         if(param1)
         {
            clearOutput();
            outputText("[pg]为什么要奖励这个恶魔？毕竟，<b>你</b>才是胜利者。当爱丽丝看着你收拾好自己离开时，恐惧蔓延在她的脸上，她被困在荒野中，无助地燃烧着欲望。");
         }
         else
         {
            outputText("[pg]做完这一切后，你其实相当满意。你拍了拍自己的背，对自己的手艺表示赞赏，然后动身返回营地，留下爱丽丝在无助的痛苦中挣扎。");
         }
         get_combat().cleanupAfterCombat();
         spriteSelect(param1 ? SpriteDb.get_s_alice_demon_nude() : SpriteDb.get_s_alice_demon());
      }
      
      public function aliceBind() : void
      {
         var afterLewds:Boolean;
         var _g:AliceScene;
         clearOutput();
         outputText("当你开始靠近她时，这个小恶魔仍然处于发呆状态，突然回过神来。无论她是害怕还是充满希望——或者两者兼而有之——她都缺乏抵抗你前进的力量。尽管如此，你不打算给她选择的机会。");
         outputText("[pg]" + (get_player().tail.type == 5 ? "迅速从你的吐丝器中吐出一些丝" : "从以前用来系小袋子的绳子上取下一段绳子") + "，你将爱丽丝的手腕握在一起，迅速将它们绑起来。还没完，你把她翻转过来，让她趴着，对她的脚踝重复这个过程。没费什么力气，你就得到了一个被绑住的魅魔！然而，似乎还是有些不对劲。她太蜷缩了，像个胎儿；这个姿势不够屈辱。当你在思考这个问题时，她尾巴紧张的抽搐引起了你的注意，你灵光一闪！你在她身边坐下，一手抓住她的尾巴，一手抓住她的头发，惹得这个可怜的孩子发出一声惊叫。这比之前的捆绑要费力一些，但努力得到了回报，你把恶魔的尾巴像某种残忍的魅魔发圈一样绑在她的头发上。她的头现在被迫向后仰向她的屁股，这让她处于一个更适合的屈辱姿势！");
         menu();
         _g = this;
         afterLewds = false;
         addButton(0,"离开",function():void
         {
            _g.aliceBindLeave(afterLewds);
         });
         addButton(1,"淫荡",aliceBindLewd).disableIf(get_player().get_lust() < 33,"这个场景需要你有足够的性欲。");
      }
      
      public function aliceBallWatch() : void
      {
         var nextAction:Function;
         var itype:ItemType;
         var _g:Inventory;
         clearOutput();
         outputText("这个[aliceSkin]皮肤的小女孩继续把球扔向树干，看起来很无聊，直到她差点没接住！当她猛地伸出手时，她开始精神起来了。接着，她稍微用力地扔出球，这次需要轻轻一跃才能防止球从她头顶飞过！她越拍越起劲，玩得不亦乐乎。");
         outputText("[pg]球离开她的手时闪过一丝火花，撞在树干上，又弹到泥土上，然后以惊人的速度弹回她的手中。小女孩得意地笑了笑，再次扔出球，在树皮上砸出一个凹坑，然后高高地弹向半空。她直勾勾地盯着天空，笨拙地走来走去，但还是在球落下来时接住了它。");
         outputText("[pg]她满腔热情地用尽全力把球扔向那棵树——球直接弹回来砸在她的额头上，[if (guro && allowChild) {砸碎了她的头骨，脑浆溅得草地和泥土上到处都是|再次飞向天空}]，女孩也被砸倒在地。");
         if(get_goreEnabled() && get_allowChild())
         {
            menu();
            _g = get_inventory();
            itype = get_useables().RBRBALL;
            nextAction = get_camp().returnToCampUseOneHour;
            addNextButton("离开",function():void
            {
               _g.takeItem(itype,nextAction);
            }).hint("白嫖的球！");
            addNextButton("使用她",aliceBallUse).hint("这正是她想要的。").disableIf(get_player().isTaur(),"你需要不同数量的腿才能做这个。").sexButton(-1);
         }
         else
         {
            get_inventory().takeItem(get_useables().RBRBALL,get_camp().returnToCampUseOneHour);
         }
      }
      
      public function aliceBallUse() : void
      {
         clearOutput();
         outputText("当你靠近尸体时，不由得发出一声无奈的叹息。[if (isChild) {想想看，当你找到一个和你同龄的女孩时，她——她|她}]根本不是什么小女孩，她是个恶魔！角、尾巴、翅膀，一应俱全。你觉得如果有什么能让人感到安慰的话，那就是她死得其所。满脑子都是球。你的目光扫过恶魔柔软的[aliceskin]肌肤，贪婪地欣赏着眼前的景象。你没有让这种变态的念头阻碍你，而是掀起女孩的裙子，看到了她的[alicePantiesLong]内裤。柔软的布料很贴身，弹性很好，你可以用拇指轻松地把它拨到一边，露出里面丰满无毛的阴户。魅魔可以用这个把[if (hasCock) {你的|一个}]灵魂榨干的事实被你抛在脑后——她已经死了，额头凹陷得像个破花瓶，已经没有任何危险了。至少你是这么想的，但在你眼前，那两片阴唇之间却渗出了水珠。[if (watersports) {不，等等，不是你一开始想的那样，她只是在慢慢地尿裤子|也许这是这具身体最后一次绝望的交配尝试。虽然在现在这个时候已经不会有任何结果了}]。");
         outputText("[pg]你滑上一只[hand]，抚摸着她的脸。一只眼球因为眼眶被毁而淤青变形，几乎要滑落进大脑里，而另一只眼睛则平静地闭着。在血液变暗之前，鲜红的血迹和她[aliceSkin]的肌肤之间的对比恰到好处。你的本能驱使着你的动作，你凑上前去舔了舔，尝到了铁锈味和独特的恶魔气息。");
         if(get_player().hasVagina())
         {
            outputText("[pg]无论是魅魔血液的影响，还是你本能的冲动，你都感到一种强烈的渴望，想要更进一步。你抚摸着这个女恶魔，解开她的衬衫，手指滑过她的胸膛。尽管平坦，她的乳房依然柔软，如果不是感觉不到任何心跳或脉搏，那份温暖会让你以为她还活着。她的小乳头在你的牙齿间被挤压，但无论你怎么啃咬，都不会有任何呻吟或乳汁流出。");
            outputText("[pg]你转移了注意力，从肩膀处抱起这个死去的女孩，[if (!isnakedlower) {手忙脚乱地露出自己的下体，然后}][if (tailLeg) {用尾巴缠住她以固定她的位置，她的双腿环绕在你的臀部，她的阴户紧贴着你的|跨坐在她的腿上，用大腿紧紧夹住它来刺激自己}]。你觉得她的脖子应该没断，但在这一连串的动作中，她的头以一种活人绝对做不到的极端角度向后耷拉着。随着伤口流出大量血液，血腥味变得更加浓烈，这促使你托住她那被砸开的头骨。再次面对面，冲动战胜了你，你将嘴唇贴在她的嘴唇上，并在下面摩擦以获取快感。");
            outputText("[pg]你的臀部顶向她，却在无意中将她从你的怀抱中推开，迫使你更紧地拥抱她，以固定住这具尸体。鲜血顺着爱丽丝的脸颊流下，你停止了亲吻去舔舐它，发现又一波欲望将你推向了恋尸癖的深渊。小恶魔女孩身上好闻的气味混合着血液氧化的味道，充满了你的鼻腔。你的[if (tailLeg) {下体|大腿}]感到一阵紧绷，你加快了抽插的速度。在你的狂乱中，你用力吸吮她的嘴，并出乎意料地开始口交魅魔的舌头。那肉质的触手在你的喉咙里发痒。");
            outputText("[pg]焦虑的喜悦在你的呻吟中回荡，你在你的小肉体性玩具上摩擦，向着高潮迈进。她的存在所渴望的，不过是你现在给予她的，释放了她所承受的无尽压力。如果那个色欲恶魔的饥渴还有任何残留，你也会让它平息。扭动着臀部，你的小穴在她的[if (tailLeg) {小穴|大腿}]上摩擦，当高潮终于席卷而来时，你浑身颤抖。这既是一种令人欣慰的解脱，又像是一盆冷水，打破了你的恍惚状态。当她舌尖滑离时，你的喉咙本能地收缩了一下，她的头毫无优雅可言地向后垂下。现在，你摆脱了低级需求的负担，站起身来，整理好自己，拿起那个小橡胶球。你会比这个爱丽丝玩得更有责任心。");
            get_player().orgasm("Vagina");
         }
         else
         {
            outputText("[pg]无论是因为魅魔之血的作用，还是你天生的冲动，你都感到一种直奔主题的渴望，[if (isnakedlower) {握住|掏出}]你肿胀的[cocks]。当你压在她湿润的阴唇上时，有一种如释重负的感觉，你移动着肉棒，感受着她娇小三角区的每一个细节。她的脸依然毫无反应，即使她生前所追求的一切都在靠近，也没有任何生命的迹象。你的[cockhead]顶入她的入口，填满了那个空间。就在刚才，她还像个无忧无虑的孩子一样玩着球，但她的阴道却像个期待下一根肉棒的婊子一样湿润，让你一滑到底[if (watersports) {，压力让她最后喷出了一股尿液}]。");
            outputText("[pg]当你抽动臀部时，肉壁有一点阻力。虽然周围没有肌肉收缩，但她的身体足够娇小狭窄，足以挤压任何肉棒[if (cockThickness > 3) {——当你挑战她正常、无辅助的极限时，她的骨盆发生了偏移|[if (cockThickness < 1) {——即使是你那细小的阴茎}]}]。你弯腰趴在年轻的女恶魔身上，在操她的同时紧紧抱住她柔软的身躯。这种瘫软的感觉更像是一个毛绒玩具，而不是一个活物——只不过是一个有着漂亮脸蛋的飞机杯。在那一刻，你突然想到，既然没有肌肉试图榨干你，你用哪个洞其实都无所谓。");
            outputText("[pg]你拔出[cock]，把它移到爱丽丝的头上。你短暂地看了一眼那只淤青的眼睛，感觉她正在注视着这一切的发生。你用[hands]捧住她的头，把肉棒拍在橡胶球砸出的洞上。头骨上的破口可能并不平整，但这个凌乱的开口足够大，你并不担心，你的肉棒依然能轻松地[if (cockWidth >= 4) {撑开受损的头骨|滑入}]。她大脑的密度甚至远不及她阴道里瘫软的肌肉；感觉就像是拉丝的明胶，而且比她的阴道凉得多。然而，感觉[i:很好]。你的手指间她[aliceHair]头发的丝滑感，以及她颅骨内并非管道状的内部结构，带来了一种新奇的体验。当你再次看着她的脸，看到你造成的血肉模糊的惨状时，你几乎感到惊讶。每一次抽插都在撕裂血管，把黏糊糊的脑脊液从她的鼻子和眼睛里挤出来——但你依然停不下来。你加快速度操着这个死去小女孩的脑袋，让吧唧吧唧的声音回荡在四周。你体内的一切都紧绷起来，夺走了你的呼吸，你伴随着沉重的咕哝声高潮了。带着粉色血丝的白色粘液[if (cummediumleast) {喷涌|渗出}]她的鼻子。");
            outputText("[pg]不清楚时间过去了多久，你只是坐在那里，把精液滴进她的头骨里。[if (cor < 33) {虽然她的死不是你的错，但这仍然让你心里有些不舒服|毫无疑问，如果她还活着，她会希望这样的。[if (cor + lib > 100) { 也许甚至你也会希望有一天你死后能被这样使用。}]}]把这些想法抛到脑后，你站起身来继续漫步，想知道接下来会发现什么。");
            get_player().orgasm("Dick");
         }
         dynStats(DynStat.Cor(4));
         get_inventory().takeItem(get_useables().RBRBALL,get_camp().returnToCampUseOneHour);
      }
      
      public function aliceBallEncounter() : void
      {
         clearOutput();
         generateAlice();
         outputText("你在[sun]光下的漫步进行得很顺利，视野内没有任何危险。就在你刚产生一丝不祥的预感时，你惊讶地发现前面有一个小女孩！从远处看，她似乎穿着一件漂亮的裙子，留着长长的[aliceHair]头发，正在对着一棵树拍球。你没多想，就已经朝她[walking]过去了，但在被发现之前你停下了脚步。你不认识她，她也不认识你——也许你不应该靠近。");
         menu();
         addNextButton("观察",aliceBallWatch).hint("享受这简单的美好，不要惹麻烦。");
         addNextButton("靠近",aliceBallApproach).hint("她很可爱，而且如果出了什么岔子你也做好了准备。").disableIf(!get_allowChild(),"她的父母不可能离得太远，而且在这个世界里，他们绝对不想看到有陌生人靠近他们的孩子。");
      }
      
      public function aliceBallApproach() : void
      {
         clearOutput();
         outputText("你感到的那种异样感依然存在，就像有什么东西在啃噬你的心智，但你把它抛在脑后，继续前进，直到那个女孩注意到你靠近。");
         outputText("[pg]她的眼睛睁得大大的，开始喘气，但被弹回来的球打断了，球敲在她的头上。[say:啊——] 她揉着太阳穴，皱着眉头，你看到她的角、翅膀和尾巴露了出来。是幻觉！这是一只爱丽丝！女孩怒视着你，你准备好战斗了！");
         FlagDict_Impl_.arrayWriteString(KFLAGS.flags,234,get_useables().RBRBALL.get_id());
         startCombat(get_currentAlice());
      }
      
      public function aliceAsphyxiation() : void
      {
         clearOutput();
         outputText("现在爱丽丝完全任你摆布，你开始考虑在经历了这一切之后，到底什么能让你感觉好点。你可以看出，尽管她已经被打败了，但她仍然试图引诱你，但你突然想到，你可以满足自己的欲望，而不必让她享受这个过程。");
         outputText("[pg]当你靠近时，她什么也没做，只是在你[if (isnaked) {露出下体|开始脱衣服}]时发出一声微弱的轻哼，她的大眼睛死死盯着你的胯部。她毫无防备，直到你一巴掌扇在她的脸上，将这个恶魔女打得晕头转向，趁机将她推倒在地，撕扯她的衣服。");
         outputText("[pg][say:等、等等，停下！]她哭喊道。[say:我以为我已经表现得很明显了，你想做什么我都配合！求求你，别打我……]你稍微缓和了一下，但一只手依然高举着以示威胁，小恶魔一边发抖一边开始脱衣服。她很快就脱掉了裙子，但在脱下她的[alicepanties]内裤时却有些不情愿，看起来有些纠结。你觉得一个恶魔会对性感到不适，这实在有些奇怪。不过，你并不在乎她的感受。你催促她快点，她吓得浑身一颤。");
         outputText("[pg]终于，她年轻的身体毫无保留地展现在你面前。她完全平坦的胸部，纤细的臀部，以及除了你刚才打出的红印外完美无瑕的光滑肌肤，这一切都太诱人了。你的脸已经涨得通红，你的[if (hascock) {肉棒已经坚硬如铁|花瓣已经湿润滴水}]。你看着爱丽丝脸上期待与恐惧交织的神情，这种混合的表情太过强烈，让你再也无法克制。");
         outputText("[pg]你把她向后推倒并骑了上去，用力掰开小女孩的大腿，让它们保持大张的姿势。这个姿势似乎让她有些不舒服，但你现在根本不在乎；你只想用她纤细年轻的身体来满足你的欲望。然而，当你开始俯身时，你感觉到一只小手抵在了你的胸口。");
         outputText("[pg]爱丽丝小声呜咽着说道，[say:啊-啊，等一下，这——好痛！你能不能——]");
         outputText("[pg]但你不想再听下去了，于是双手掐住了她的脖子。随着你开始用力收紧，她随后的尖叫声被硬生生掐断在喉咙里。她强忍住下一声痛苦的呜咽，看来她已经充分领会了你的意思，是时候把注意力转移到其他地方了。也就是，你自己的快感上。");
         outputText("[pg]你将你的[cockorvag]对准她那未成熟的小穴，告诉她这就是她想要的，但她无法回应，因为你正掐着她的脖子，把她掐得半死。她虚弱的双手抓住你的手臂，但她太虚弱了，根本无法反抗[if (str < 30) {哪怕是}]你。不想再浪费一秒钟，你向前挺进，[if (hascock) {将你的肉棒深深插入这个孩童般的恶魔体内|将你的入口与她的紧紧贴合，粗暴地摩擦}]。");
         outputText("[pg]爱丽丝似乎承受得住，她的身体显然就是为了承受这种虐待而生的。好吧，那只意味着你得再加把劲了。你加重了手上的力道，当你的[claws]掐进她[aliceskin]的肌肤时，她瞪大了眼睛。看着她痛苦的样子，你满意地开始前后摆动臀部。速度并不快，但你确保每一次挺进都用尽全力，[if (hascock) {当你用力撞击她的肌肤直到留下淤青时|每次你摩擦到她的阴蒂时}]，她都会发出一声尖叫。");
         outputText("[pg]两道泪痕顺着她的脸颊滑落，但在你毫不留情地操弄她时，你觉得没有比这更美丽的表情了。她的皮肤开始有些泛红，但她似乎有着异乎寻常的生命力，所以你觉得你还能再继续折腾一段时间。你继续抽插，享受着能够如此蹂躏这样一个年轻女孩所带来的纯粹快感。");
         outputText("[pg]无论这对她来说有多么痛苦，她终究拥有一具恶魔的躯体，而她的身体只能背叛她，[if (hascock) {紧紧夹住你，爱抚并按摩着插在她体内的肉棒|在你身下抽搐，她的阴唇与你的互相摩擦，爱抚着你的阴蒂}]。你分不清她到底是快要高潮了还是快要昏过去了，但你自己也快到极限了。伴随着一声低吼，你将全身的重量压在双臂上，然后猛地松开，在最后一次冲刺中将你的胯部狠狠撞向她。");
         outputText("[pg]你的[if (hascock) {精液注入她的体内，将这个女孩填得满满当当|爱液溢出，涂满了她的肌肤}]。[if (cumhighleast || issquirter) {弄得一团糟|她似乎并没有高潮}]，但你并不怎么在乎，你脑子里唯一的念头就是尽可能地从这个乏味的小婊子身上榨取快感。你的[if (hascock) {[if (hasballs) {蛋蛋跳动着|[if (hasvagina) {小穴流着淫水|会阴抽动着}]}]，你将一切都泵入她的体内|小穴在她的上面紧缩颤抖着}]，而爱丽丝在你铁钳般的抓握下勉强发出一声尖细的哭喊。你的视线变得模糊，你想象她现在也是如此，你的身体继续在她身上摩擦，你的下半身紧绷到了极限。");
         outputText("[pg]终于，你耗尽了力气，瘫倒在一旁。你听到身旁的爱丽丝大口大口地喘着粗气，听得出来她的喉咙已经沙哑了。尽管你也被榨干了力气，但你还是最先恢复过来的。你[if (singleleg) {起身|站起来}]，转头看向她。这个赤裸的孩子像个坏掉的洋娃娃一样躺在那里，双眼无神，嘴巴微张，不过她腿部偶尔的抽搐让你确信她还活着。");
         outputText("[pg]你迅速整理好自己的东西，将她留在这片[areaname]中。希望她以后能小心一点。");
         get_player().orgasm("Dick");
         aliceCorruption(15,true,true);
         get_combat().cleanupAfterCombat();
         spriteSelect(SpriteDb.get_s_alice_demon_nude());
      }
      
      public function aliceAnalLick() : void
      {
         clearOutput();
         outputText("你伸展手指，按摩着这个年轻魅魔的臀部，然后更加用力地将脸埋了回去。在你的拇指用力掰开和舌头蠕动探索的双重作用下，你将[tongue]滑了进去。她的尾巴僵硬了，因为这突如其来的侵入而喘息着，这暗示着这对她来说可能是一次全新的体验。给一个魅魔展示全新的性体验，这可真是个新奇的概念……");
         outputText("[pg]爱丽丝温暖、柔软的臀部成了一个舒适的枕头，你把脸埋进去，将舌头探入。当你的舌头抵住她紧缩的菊穴褶皱时，它们逐渐平滑开来，而当你的舌头滑向另一侧时，它们又重新收紧。你一边舔弄一边亲吻，让这整个过程几乎变得浪漫起来。你欢快地收回舌头，听着女孩在舌头滑出时发出的呻吟。");
         doNext(aliceAnalFuck);
      }
      
      public function aliceAnalFuck() : void
      {
         clearOutput();
         var _loc1_:int = 1 + get_player().cockThatFits(get_currentAlice().analCapacity());
         outputText("前戏够了，你现在的需求更为紧迫，不过她也不会抱怨的。");
         if(_loc1_ <= 0)
         {
            outputText("你用[cock]在恶魔的屁股上清脆地拍了一下。她倒吸了一口凉气，但很快就开始来回摇摆尾巴，邀请你继续。你将龟头抵在她光滑的肛门上，但无论你怎么用力推，似乎都进不去。你用力一顶，结果只是让爱丽丝痛苦地呻吟了一声。你的老二对一个孩子来说太大了，即使她是个恶魔。");
            outputText("[pg]你叹了口气，将肉棒推入她的臀缝间，用手将两瓣臀肉挤压在一起以增加压力。你可不想完全被剥夺释放的机会。你用力一挺[if (hasballs) {，听着你的蛋蛋拍打在她身上的声音，}]她失望地呜咽了一声。你提到如果她愿意的话，你可以尝试更用力地强行插进去，但在片刻的沉默后，她顺从地在你的[cock]上上下摩擦着她的屁股。这对你来说已经是足够的信号了，你再次在她的臀缝间抽插起来。虽然这并非你最初的打算，但这种刺激依然证明是值得的。随着你抽动工具，她也开始呻吟起来。在几次更加用力的抽插后，你终于迎来了高潮，将精液喷溅在她翻起的裙子和头发上。");
            outputText("[pg]你站起身，伸展身体放松一下。爱丽丝继续趴在地上，生着闷气。臀缝摩擦虽然不在计划之内，但至少你玩得很开心。她应该振作起来，庆幸自己至少得到了一些东西。");
         }
         else
         {
            outputText("你用[cock " + _loc1_ + "]在恶魔的屁股上清脆地拍了一下。她倒吸了一口凉气，但很快就开始来回摇摆尾巴，邀请你继续。");
            outputText("[pg]你在被唾液润滑的穴口上扭动着龟头，带着些许轻松却又施加了足够的压力挤了进去。你那根肉棒的每一寸都伴随着绝妙的快感滑入，恶魔也随之发出同样愉悦的叹息，直到最后你将自己连根埋入。你带着同样回味的从容将自己拔出，直到龟头处停下。慢慢来的时间终于结束了。");
            outputText("[pg]当你猛地将臀部向前撞击，瞬间再次没入到底时，魅魔发出了一声响亮的呻吟。她有点太紧了，无法以同样的速度拔出，但你继续用力。小女孩的屁股再怎么柔软顺从，你也要挑战它的极限。你再用力一挺，听到爱丽丝的呻吟声更大了。");
            outputText("[pg][say: 还要……]");
            outputText("[pg]她几乎无法呼吸，但她喜欢这种粗暴的方式。然而，永远不要低估一个勇者。你更用力地摇摆臀部，加强了抽插的力度，直到恶魔在狂喜中尖叫。随着你一次又一次如活塞般的抽插，那紧致感从未减弱，催促着你在里面喷发。在最后一次耗尽体力的撞击中，你呻吟着射精了，感觉一天的烦恼和忧虑都烟消云散了……");
            outputText("[pg]你回过神来，从你的玩具中抽身而出。她被填得很满，被留在地上喘息着。你高兴地收拾好自己，回到营地，感觉精疲力尽。");
         }
         get_player().orgasm("Dick");
         aliceCorruption(0,true,true);
         get_combat().cleanupAfterCombat();
         spriteSelect(SpriteDb.get_s_alice_demon_nude());
      }
      
      public function aliceAnal() : void
      {
         spriteSelect(SpriteDb.get_s_alice_demon_nude());
         clearOutput();
         outputText("看着恶魔纤细的双腿，你的思绪飘到了她柔软的臀部。仔细想想，这绝对是最好的选择；既不用担心生出小恶魔，又能享受插入的快感。顺着这个逻辑，你走到晕乎乎的小魅魔身边，把她翻过身，让她趴在地上。");
         outputText("[pg]当你在她身后找了个舒服的姿势坐好时，爱丽丝羞怯地回头看着你，尾巴左右摇摆着。她翘起尾巴，把裙子拨开，让你毫无遮挡地看到她心形的臀部。正如你对任何魅魔的期望一样，她对此非常渴望。你平静地抓住她的臀部，手指卷住她内裤的边缘，故意放慢动作来折磨她。她的内裤顺滑地滑落，轻轻地挠着她，直到停在她的膝盖处。");
         outputText("[pg]你觉得必须花点时间欣赏一下这个小恶魔光滑赤裸的臀部、稚嫩饱满的阴户，以及穿着白色过膝袜的双腿。虽然这些特征都很不错，但你这次有特定的欲望，于是你双手捧住她的臀瓣。你的拇指在缝隙处拉扯，将她肛门周围的臀肉向两边掰开。在你的注视下，它微微颤抖，爱丽丝也小声地呜咽着。她真的有资格挑剔你选择哪个洞吗？");
         outputText("[pg]然而，你并没有残忍到直接干插进去。你将舌头平贴在她的穴口上，惹得她发出一声惊呼。那里隐约透着一丝玫瑰般的色泽，你继续用舌头舔弄着。听着她颤抖的声音，你的小恶魔现在正享受着这一切。随着你的舌头在周围滑动，她的臀部放松下来，享受着你提供的温暖润滑。");
         menu();
         addButton(0,"更深",aliceAnalLick).hint("舔屁股是礼貌，吃屁股是激情。");
         addButton(1,"操她",aliceAnalFuck).hint("废话少说，");
      }
   }
}

