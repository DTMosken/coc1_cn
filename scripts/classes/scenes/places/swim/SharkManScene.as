package classes.scenes.places.swim
{
   import classes.BaseContent;
   import classes.CoC;
   import classes.Cock;
   import classes.DebugMenu;
   import classes.DynStat;
   import classes.Monster;
   import classes.Player;
   import classes.SelfDebug;
   import classes.internals.Utils;
   import classes.items.Jewelry;
   import classes.items.JewelryLib;
   import classes.parser._Parser.TagFun_Impl_;
   import classes.saves.SelfSaver;
   import classes.saves.SelfSaving;
   import classes.scenes.Camp;
   import classes.scenes.Inventory;
   import classes.scenes.combat.Combat;
   import classes.scenes.places.swim._SharkManScene.SaveContent;
   import coc.view.CoCButton;
   import flash.Boot;
   
   public class SharkManScene extends BaseContent implements SelfDebug, SelfSaving
   {
      
      public var saveVersion:int;
      
      public var saveName:String;
      
      public var saveContent:SaveContent;
      
      public var globalSave:Boolean;
      
      public function SharkManScene()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         globalSave = false;
         saveVersion = 1;
         saveName = "sharkman";
         saveContent = new SaveContent(null,null);
         super();
         SelfSaver.register(this);
         DebugMenu.register(this);
      }
      
      public function sharkManWonCombat(param1:Boolean) : void
      {
         clearOutput();
         registerTag("lustwin",TagFun_Impl_.fromBool(!param1));
         registerTag("vagCould",TagFun_Impl_.fromBool(get_monster().cockArea(0) < get_player().vaginalCapacity()));
         registerTag("assCould",TagFun_Impl_.fromBool(get_monster().cockArea(0) < get_player().analCapacity()));
         outputText("水流猛然搅动，他扑向你的声音在漩涡中被放大，随即将你死死压在他庞大的身躯下。冰冷的湖底紧紧贴着你的[if (!hasVagina && tailLeg) {肚子|后背}]。鲨鱼人的抓握毫不留情，他粗糙的双手[if (isTaur) {摸索着你" + "野兽般的下半身|将你的手腕锁在头顶}]。");
         outputText("[pg]他发出一声低沉的咆哮，片刻后，他带着急不可耐的渴望，[if (singleleg) {将他粗壮的肉棒拍打在你的[vagorass]上|粗暴地分开你的双腿，两根肉棒紧紧抵住你的入口[if (hasVagina) {}]}]。没有任何前戏，也没有任何准备——只有当他[if (isvagorassvirgin) {撕裂你的生涩与纯洁时，那尖锐而令人震惊的痛楚[if (isvagorassvirgin) {。处女小穴被刺穿的巨大惊愕，几乎掩盖了他同时插入了两个洞的事实}]|将自己完全强行塞入你体内时}]的剧烈冲击。你的嘴唇溢出一声窒息般的喘息，[if ((hasVagina && vagCould && assCould) || (!hasVagina && assCould)) {他的肉棒完全埋入你[if (vaginallooseness >= 2) {松弛的|富有弹性的}]小穴[if (hasVagina) {}]中|你的身体被他惊人的粗度撑开，艰难地容纳着他无情的抽插}]。这个狂暴的鲨鱼人根本不在乎。他的本能已经接管了一切，他渴望的只有完全占有你所带来的原始满足感。");
         get_player().buttChange(get_monster().cocks[0].cockLength,true);
         if(get_player().hasVagina())
         {
            get_player().cuntChange(get_monster().cocks[0].cockLength,true);
         }
         outputText("[pg]他的臀部猛地向前挺动，夺走了你肺里的空气。每一个动作都粗暴而无情，每一次抽插都带着野兽般的狂热，他粗糙的皮肤摩擦着你，让你感到一阵眩晕。对他来说，你不过是一块泄欲的肉。鲨鱼人的手在你的[if (ischubbybuild) {丰满}]身体上游走，用力地揉捏挤压；即使他像发情的野兽一样疯狂地抽插，他也觉得不够。你的双臂无力地垂在两侧，手指深深陷入泥泞的沙中，压力不断积聚，直到你释放出自己都没意识到的憋气，终于大声叫了出来。如果这附近有任何没被操晕的鲨鱼女孩，她们毫无疑问能听到你的喘息和呻吟——不，她们能[i:感觉]到。");
         outputText("[pg]当这个[if (!isElder) {年长的}]男人将你举起，调整姿势后再次将你狠狠操向地面时，冰冷的水流在你身下急速涌动。这冲击让你头晕目眩，但另一次猛烈的挺进又将你拉回现实[if (hasVagina) {，这肯定[i:撞伤]了你的子宫颈}]。他疯狂的节奏搅动着水流，他沉重的咕哝声和你们[if (silly) {啪啪作响|结合}]的湿润水声填满了你们之间的空间。你甚至能听到他抓紧你大腿的声音，将你分得更开，用让肌肉麻木的力量猛烈地撞击你。一阵不情愿，[if (cor + libido > 50) {却不可思议的|[if (cor < 5 && libido < 25) {不想要的|压倒性的}]}]高潮席卷了你，一波波的收缩和放松不经意间榨取着袭击者的肉棒[if (hasvagina && !tailLeg) {}]。哎，这并没有让他自己达到顶峰，反而激发了他永不满足的饥渴。");
         outputText("[pg]他丝毫没有减速的迹象。他迷失在绝望的繁殖冲动中。然后，伴随着最后一次震撼骨髓的挺进，他将自己完全埋入，胸腔中震荡出低沉而充满占有欲的咆哮，在你体内爆发了。");
         outputText("[pg]当他浓稠的精液涌入[if (tailLeg) {[if (hasVagina) {你的子宫|你的肠道}]|[if (hasVagina) {你的两个洞|你体内}]}]时，温暖淹没了你的核心，填满了你[if (hasCock) {，同时另一股敏感的精液从你的[cocks]中喷出|直到它像乳白色的溪流一样溢出}]，消散在深水中。他的抓握又持续了片刻，身体在享受高潮时微微抽搐。然后，就像他突然占有你一样，他松开了手，在最后发出一声咕哝后拔出，然后推开你游走了。你被留在他的尾流中，喘息着，颤抖着，彻底筋疲力尽。疲惫感吞噬了你……");
         get_player().slimeFeed();
         get_player().orgasm("VaginalAnal");
         saveContent.hasLost = true;
         get_combat().cleanupAfterCombat();
      }
      
      public function sharkManLostCombat(param1:Boolean) : void
      {
         clearOutput();
         registerTag("lustwin",TagFun_Impl_.fromBool(!param1));
         outputText("你的袭击者瘫倒在地，发出一阵咆哮，陷入发情的狂热中，[if (lustwin) {徒劳地拍打着他的肉棒|因为他那两根仍在跳动的肉棒带来的痛苦而呻吟}]。从一个布满岩石的树根下的缝隙里，一个鲨鱼女孩犹豫地探出头来。当她靠近那个男人时，他退缩并猛烈反击，不让她靠近。");
         menu();
         addButton(0,"帮助满足",doubleTeamSharkMan).hint("两根肉棒显然需要两个洞。");
         addButton(1,"旁观",getCuckedByAShark).hint("用她自己的触手把她绑起来，玩弄她的丝带。").hint("她可能知道怎么对付他。");
         addButton(2,"安抚他",calmTheSharkMan).hint("用你心中那首舒缓的旋律来平息他的愤怒。").disableIf(!get_player().isMermaid(),"也许有一首水生旋律能平息最猛烈的风暴。");
         saveContent.encountered = true;
         setSexLeaveButton();
      }
      
      public function sharkManEncounter() : void
      {
         clearOutput();
         if(!saveContent.hasLost)
         {
            outputText("一声[i:当啷]在水中回荡，引起了你的兴趣。你的鳃几乎能尝到散布在湖中的鲨鱼交配的气味，而无论那声音是什么，那里绝对是鲨鱼的领地。你自然很好奇，但去查看无疑是危险的。");
            menu();
            addButton(0,"调查",investigateTheNoise).hint("在穿过传送门之前，你就知道这个世界很危险。");
            addButton(1,"离开",leaveTheNoiseAlone).hint("最好不要冒险。");
         }
         else
         {
            outputText("一个受了重伤——而且明显被狠狠操过——的鲨鱼女孩似乎处于半昏迷状态，她身下的泥泞湖床上印着一个鲨鱼女孩形状的压痕。在她身后是一些水下住所，这里弥漫着强烈的性爱气味。逃跑也许是明智之举——");
            outputText("[pg]你之前看到的那个鲨鱼人开始向你冲来！");
            menu();
            startCombat(new SharkMan());
         }
      }
      
      public function sharkManConclusion(param1:Boolean = true) : void
      {
         var _g:Combat;
         if(param1)
         {
            clearOutput();
         }
         registerTag("notcalmed",TagFun_Impl_.fromBool(param1));
         outputText("[pg][if (notcalmed) {尽管双腿发软，鲨鱼女孩还是设法从年长的男人身边抽身，让自己冷静下来，然后向你打了个手势。[if (silly) {[say:咕噜噜 咕噜 噜，]|[say:帮我把他绑起来，]}]她请求道，你摆脱了情欲的余韵，伸出[hand]帮忙。}]虽然他非常高大强壮，但要把鲨鱼人拖到水下还是很容易的。你被引导进一间相对豪华的屋子，里面有几个鲨鱼女人，要么受了伤，要么被操得精疲力竭，还有一个严重损坏、隐约像王座一样的岩石结构，似乎就是他被绑住的地方。毛茸茸的苔藓和海草做成的垫子让它看起来至少有几分舒适。粗糙的红色石头散落各处，鲨鱼女孩很快取下男人的阴茎环，卸下上面的红宝石，把它扔进了一堆红宝石里。");
         outputText("[pg][if (silly) {[say:咕噜咕噜咕噜，呜噜，]|[say:它们能让男人们在短时间内不那么暴力，]}]她解释道，然后留下你完成对他的捆绑。等你弄完时，她已经带着凿子和几块石头回来了。现在很明显，那些在湖底巨大树根上生长、看起来像珊瑚的东西，其实是某种独特的物质。[if (silly) {[say:咕噜咕噜 咕噜 咕噜，]|[say:顶部的那些变得黏糊糊、滑溜溜的，就像无限的润滑剂，]她说道。[say:但如果你挖开它们，下面会有这些颜色较浅的。]}]你仔细观察这些颜色较浅的石头。有几块是粉红色的，但有一块乳蓝色的格外引人注目。注意到你的目光，她把所有的材料放在桌子上，开始切割那块水蓝色的宝石。");
         outputText("[pg]没过多久，鲨鱼女孩就向你展示了一枚戒指——大小刚好适合你的一根手指——上面镶嵌着你挑选的那块石头。");
         outputText("[pg]她用随意的语气说道[if (silly) {[say:咕噜，]|[say:谢谢你帮我们消耗他的体力，]}]然后专注于重新安装鲨鱼人的阴茎环，默默地把你赶走了。");
         var _loc2_:Inventory = get_inventory();
         var _loc3_:Jewelry = get_jewelries().AQUARING;
         _g = get_combat();
         _loc2_.takeItem(_loc3_,function():void
         {
            _g.cleanupAfterCombat();
         });
      }
      
      public function saveToObject() : Object
      {
         return saveContent;
      }
      
      public function reset() : void
      {
         saveContent.encountered = false;
         saveContent.hasLost = false;
      }
      
      public function onAscend(param1:Boolean) : void
      {
         reset();
      }
      
      public function load(param1:int, param2:*) : void
      {
         Utils.extend(saveContent,param2);
      }
      
      public function leaveTheNoiseAlone() : void
      {
         outputText("[pg]也许换个时间你会更有兴致，但绝不是现在。你朝着[i:远离]那个声音的方向游去，直到看见海岸，也没有再发现什么能引起你注意的东西。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function investigateTheNoise() : void
      {
         clearOutput();
         outputText("追寻着当啷声的源头，你很快发现自己正扭动着身体，在长满珊瑚的巨大根须周围和下方穿梭，以躲避鲨鱼女孩。虽然她们本身算不上什么大威胁，但如果遇到一个就打一个，你也走不了多远。幸运的是，她们在自己的村庄周围似乎没那么警觉。");
         outputText("[pg][bi:铛。] 这次声音更大了。但当你从另一堆树根后探出头时，你发现自己直接和一名鲨鱼女孩打了个照面！她吓得往后缩了一下，银色的发丝四处飘动，似乎在强调她的震惊。顺着树根往下看，你发现她正用某种镐子敲击着浑浊的粉色珊瑚——那是珊瑚吗？——直到被你打断。");
         outputText("[pg]她似乎想开口说话，但随后你们俩都被一声听起来像是水下[i:咆哮]的声音打了个措手不及，紧接着是金属摩擦的刺耳声。从附近某个深水住所里，一个高大强壮的鲨鱼人冲了出来，以越来越快的速度径直向你游来。在千钧一发之际，你用力蹬开树根拉开距离，而鲨鱼女孩则选择躲在树根下面。片刻之后，发狂的鲨鱼人撞上了茂密的植物血肉，激起周围的沙子、岩石和其他碎屑。");
         outputText("[pg]尘埃落定，他发现了你。");
         startCombat(new SharkMan());
      }
      
      public function get_debugName() : String
      {
         return "SharkMan";
      }
      
      public function get_debugHint() : String
      {
         return "";
      }
      
      public function getCuckedByAShark() : void
      {
         var _g:SharkManScene;
         clearOutput();
         outputText("鲨鱼女孩抓住年长的鲨鱼人，从后面抱住他，手里握着他的一根肉棒。他的身体仍因残留的攻击性而紧绷，但他的呼吸急促，两根肉棒因渴望而跳动；他没有反抗她。");
         outputText("[pg]受到鼓励，她在他两腿之间蹲下，手指描摹着他肉棒的轮廓。她用缓慢、熟练的动作抚摸他，手指在他光滑的肉棒表面滑动，哄诱他释放。然而，他的呼吸一滞，他的克制崩溃了。伴随着一阵猛烈的动作，他向前冲去，让她失去了平衡。她睁大了眼睛，但还没等她反应过来，他就抓住了她的大腿，将她的双腿拉开。他的力量是毋庸置疑的，即使在失败中——她只抵抗了短暂的一瞬，试图让他慢下来，但他不打算退缩。");
         outputText("[pg]一根粗壮的肉棒抵住她的入口，由于她不断增长的性欲，毫不费力地滑了进去。那翻滚的、狂喜的颤抖让你不寒而栗，她张着嘴适应着那粗度。他没有给她太多时间。你看着他抓紧，手指陷入女孩的大腿，他向上挺进她体内，强迫她接纳得更深。随之而来的尖叫声表明了震惊和快乐，当他开始像使用飞机杯一样在她的长度上移动她时，她把脸埋进他的胸膛以掩盖自己的声音。");
         outputText("[pg]但这还不够。");
         outputText("[pg]他的喉咙里发出一声低吼，第二根肉棒固执地抵住她的屁股。她的身体紧绷起来，有那么一瞬间，她看起来似乎想要反抗。但他用力一挺，强行挤入她的体内，把她撑得直翻白眼。水流将他们交媾的震动传达给你，他们的气味和味道席卷了你的感官，让你的身体也渴求着得到满足[if (isgenderless) {；可惜，你没有生殖器来平息这种感觉，只能在一旁看着|[if (lust + libido > 75 && !istaur) {；于是，你屈服于冲动，[hands]急切地探索着你的下体[if (!isnakedlower) {，脱下最碍事的衣物以便抚慰自己}]|——但你咬紧嘴唇，没有[if (istaur) {轻易满足你那野兽般的生理构造|被逼到在光天化日之下发泄的地步}]}]}]。鲨鱼人将女孩按在湖底泥泞的沙地上，毫不留情地填满了她的两个小穴。");
         outputText("[pg]她紧紧抓着他，气喘吁吁。她原本以为自己足以满足他的需求，现在看来不过是种错觉。他已经占据了主导，用深沉有力的抽插操弄着她，每一次撞击都让她的身体随之抽搐颤抖。他们周围的水流因他猛烈的冲刺而剧烈翻滚，随着压力的积聚，细小的气泡在他们交缠的身体间滑落。");
         outputText("[pg]她的叫声越来越高亢，[if (lust + libido > 75 && !istaur && !isgenderless) {你自慰的节奏也在不自觉地试图跟上这激烈的频率|[if (lust > 30 && !isTaur && !isgenderless) {你的[hands]情不自禁地抚慰着你的[genitalsdetail]。[if (isnakedlower) {没有任何遮挡，你开始|你毫无顾忌地沉浸在眼前的景象中，解开你的[armor][if (haslowergarment) {和[lowerwear]}]，然后开始}]让自己陷入狂热|看着这充满激情的画面，你的脸涨得通红}]}]。她的手臂颤抖着，手指无力地在他皮肤上抓挠，接着，伴随着最后一声绝望的尖叫，她痉挛起来，肌肉紧绷，毫无疑问，在一次强烈的性高潮中，她紧紧夹住了他的两根肉棒。[if (lust > 30 && !isTaur && !isgenderless) {这股快感让你[if (hasCock) {用过分狂热的力道套弄着自己}][if (isHerm) {，同时}][if (hasVagina) {用手指摩擦着阴蒂包皮，然后探入湿滑的缝隙[if (!isvirgin) {，抠挖着你那饥渴难耐的小穴}]}]。你脑海中闪过一个念头：既然你的身体如此燥热难耐，也许你该加入这些鲨鱼，但你立刻打消了这个念头，转而专注于更加狂热的自慰。鲨鱼人继续毫无节制、不顾一切地猛烈抽插，只为平息那疯狂的欲望，你跟随着他的节奏，目光死死盯着他那两根肉棒撑开她小穴的画面。最终，你被这一切彻底征服，颤抖着喘息，释放出一次让你无比感激的高潮。}]");
         outputText("[pg]他也紧随其后，动作变得断断续续，伴随着一声低沉的喉音，他将她重重地压向自己，直没入柄。两人抽搐着、呻吟着、呜咽着，他将自己倾注进她的体内。");
         outputText("[pg]一切结束后，她瘫倒下来，软绵绵地漂浮在他的肉棒上。所有的攻击性似乎都已消退。四周只剩下他们两人粗重的喘息声。");
         if(!get_player().isTaur() && !get_player().isGenderless() && get_player().get_lust() >= 31)
         {
            get_player().orgasm("VaginalAndDick");
         }
         else
         {
            dynStats(DynStat.Lust(50));
         }
         _g = this;
         doNext(function():void
         {
            _g.sharkManConclusion();
         });
      }
      
      public function doubleTeamSharkMan() : void
      {
         var _g:SharkManScene;
         clearOutput();
         outputText("你[if (!isnakedlower) {在游动中脱下衣服，}]理清了需要做的事情，然后冲上前去制止鲨鱼人，抓住他的手臂，给鲨鱼女孩创造机会。他那野性的目光在女孩和你之间游移，你有些担心这会让他再次狂暴起来。他眼中的原始饥渴显而易见——如果不加以处理，他发情期的冲动迟早会让他再次陷入疯狂。");
         outputText("[pg]她抓住机会伸出手，手指在他的胸膛上轻轻拂过，安抚并诱惑着他，向他保证他那疯狂的欲望会得到满足。你也跟着照做，手上的力道更重一些，抚摸着他强壮的手臂，感受着他粗糙皮肤下紧绷的肌肉。");
         outputText("[pg]他咕哝了一声，在你们两人的共同抚慰下，身体微微颤抖。他的双手抽搐着，本能地想要夺回控制权，但你们俩都努力让他保持平稳。[if (silly) {[say:咕噜，咕噜噜，]|[say:放松，把紧绷的情绪释放出来，]}]鲨鱼女孩轻声呢喃，她柔和的声音至少让这只年长的鲨鱼稍微平静了一些。这足以让你们俩继续向下摸索，双手顺着他结实的腹肌滑下，直到触碰到他那两根勃起肉棒跳动的炽热。");
         outputText("[pg]你的手指环住他其中一根粗壮的肉棒，而鲨鱼女孩则负责另一根，只有在他臀部突然抽动时才稍作停顿。尽管你和你这位偶然结成的盟友在握法和节奏上各不相同，但这反差丝毫没有让他退缩。你手中的粗壮感比看起来还要大——至少有[if (metric) {五厘米粗，三分之一米|两英寸粗，一英尺多}]长。在你的惊叹中，你放松了警惕，不由自主地惊呼出声，因为一条有力的手臂紧紧勒住了你。看起来鲨鱼人似乎要把你当成布娃娃一样狠狠操弄，但女孩用一个吻转移了他的注意力。");
         outputText("[pg]有那么一瞬间，他似乎变得温顺了，但紧接着他猛地将手推向你的胸口，让你在水中翻滚起来。鲨鱼女孩紧随其后，她的脸落在[if (tailLeg && !hasVagina) {你的肩膀之间，把你的头|[if (isTaur) {你的前腿之间|[if (isfeminine || hasBreasts) {你的[breasts]之间|你的胸肌上}]}]，把你的背}]按进沙子里。你很快就明白了他的意图——他那两根肉棒的顶端抵住了[if (hasVagina) {你和鲨鱼女孩的阴户|鲨鱼女孩的阴户和你的[ass]}]。年长的鲨鱼猛地按下双手，将女孩压在你身上，激起你们两侧的沙子。他在你们俩身上耸动着，盲目地用阴茎在洞口周围摩擦，第一根显然找到了目标，鲨鱼女孩发出一声尖叫[if (height < 61 && !isTaur) {，她那[if (isChild) {成年人的|更高的}]身躯被推到你身上——柔软的乳房[if (tailLeg && !hasvagina) {按摩着你的头皮|几乎塞进你的嘴里}]，同时她高兴地颤抖着|，这位[if (isElder && isfeminine) {年轻女子|女孩}]咬住你以抑制她的呻吟}]。第二根肉棒紧接着也达到了目的，你[vagorass]传来的感觉让你瞪大了眼睛。毫无节制的力量夺走了你们俩的呼吸。");
         if(get_player().hasVagina())
         {
            get_player().cuntChange(get_monster().cocks[0].cockLength,true,false);
         }
         else
         {
            get_player().buttChange(get_monster().cocks[0].cockLength,true,false);
         }
         outputText("突如其来的充实感和毫不留情的节奏令人窒息。被困在两个强大的水下掠食者之下，另一双手臂紧紧抱住了你。女孩依附在你的身体上寻求支撑。");
         outputText("[pg]尽管他的抽插很粗暴，[if (height < 61 && !isTaur) {他|她松开了咬你的嘴，仰起头，在一个绝望的吻中捕捉到了你的嘴唇。她}]的手开始探索，即使在男人用阴茎刺穿她的时候，也在满足你的需求。她的手指在你的身体两侧游走，挑逗着你皮肤上的敏感部位，引导你的身体屈服于快感，而不是仅仅忍受鲨鱼人原始的欲望。这种触感，她身体贴着你移动的方式，以及那压倒性的力量，都变成了令人陶醉的愉悦。低沉的咆哮在水中回荡，隆隆的声响让你不寒而栗。他的抽插变得更加疯狂，试图将自己更深地埋入你们俩体内。水流在你们纠缠的身体周围打转，更添了几分肆意放纵的快感。鲨鱼女孩的呻吟变成了呜咽，她的吻变得更加狂热、更加绝望，她的手指深深地掐进你的肉里。你酸痛的肌肉已经无法承受更多的狂暴。最后一次颤抖的抽插释放出如暴雨般的精液，滚烫而粘稠地射入你的体内，你们俩也跟随着他攀上顶峰，狂喜的浪潮在你的身体里翻滚。鲨鱼女孩颤抖着，彻底精疲力竭，她的呼吸与你的交织在一起，在共享满足的余韵中紧紧依偎着你。");
         get_player().slimeFeed();
         get_player().orgasm("VaginalAnal");
         _g = this;
         doNext(function():void
         {
            _g.sharkManConclusion();
         });
      }
      
      public function debugMenu(param1:Boolean = true) : void
      {
         get_game().debugMenu.debugCompEdit(saveContent,new SaveContent(null,null));
      }
      
      public function calmTheSharkMan() : void
      {
         var dontClear:Boolean;
         var _g:SharkManScene;
         clearOutput();
         outputText("一种无法平息的温柔火焰驱使着你去给他带来平静。游得更近些，你伸出手，鲨鱼女孩忧心忡忡地看着。这位年迈的老人，尽管愤怒，还是停下来看着你的眼睛，然后你的话语开始在水中回荡。旋律发挥了它的魔力，就像疯狂沙漠中的宁静绿洲。");
         outputText("[pg][say:Ruliah，]精神痛苦的老鲨鱼低语道。他身上所有的紧张感都消失了，鲨鱼女孩带着重拾的信心走近。");
         outputText("[pg]她犹豫地看着你，然后松了一口气。[if (silly) {[say: 咕噜咕噜，]|[say: 请帮我制服他，]}]她请求道。");
         _g = this;
         dontClear = false;
         doNext(function():void
         {
            _g.sharkManConclusion(dontClear);
         });
      }
   }
}

