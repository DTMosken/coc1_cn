package classes.scenes.areas.glacialRift
{
   import classes.BaseContent;
   import classes.CoC;
   import classes.DebugMenu;
   import classes.DynStat;
   import classes.Monster;
   import classes.Player;
   import classes.SelfDebug;
   import classes.internals.Utils;
   import classes.items.Weapon;
   import classes.parser._Parser.TagFun_Impl_;
   import classes.saves.SelfSaver;
   import classes.saves.SelfSaving;
   import classes.scenes.Camp;
   import classes.scenes.areas.glacialRift._MoraScene.SaveContent;
   import classes.scenes.combat.Combat;
   import coc.view.CoCButton;
   import flash.Boot;
   
   public class MoraScene extends BaseContent implements SelfDebug, SelfSaving
   {
      
      public var saveVersion:int;
      
      public var saveName:String;
      
      public var saveContent:SaveContent;
      
      public var globalSave:Boolean;
      
      public function MoraScene()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         globalSave = false;
         saveVersion = 1;
         saveName = "莫拉";
         saveContent = new SaveContent(null);
         super();
         SelfSaver.register(this);
         DebugMenu.register(this);
      }
      
      public function saveToObject() : Object
      {
         return saveContent;
      }
      
      public function reset() : void
      {
         saveContent.encountered = false;
      }
      
      public function onAscend(param1:Boolean) : void
      {
         reset();
      }
      
      public function moraWinChoices(param1:Boolean) : void
      {
         clearOutput();
         registerTag("lustvictory",TagFun_Impl_.fromBool(!param1));
         outputText("[if (lustvictory) {莫拉倒在一旁，气喘吁吁，满脸通红|莫拉安静下来，倒在地上，无法战斗}]。走近后，你有机会检查她的身体。虽然骨瘦如柴，但她显然是女性。她那分叉的蹄子、长着爪子的手，以及[if (nofur) {深陷的眼窝|像羚羊一样的鼻梁}]让她看起来明显不像是人类，而她的角、柳枝般的翅膀和尾巴则具有恶魔的特征。尽管有这些迹象，你还是可以在她那几乎只穿着破布的身体上发泄你的欲望。");
         menu();
         addNextButton("操她",moraFuck).hint("操她。").sexButton(1);
         addNextButton("磨骨",moraBonegrind).hint("抚摸并顶弄这个骨瘦如柴的怪物。").sexButton(2).disableIf(get_player().isTaur(),"你需要少一点腿才能这么做");
         addNextButton("肋骨交",moraRibjob).hint("把你的[genitals]在骨瘦如柴的裸露胸部上摩擦。").sexButton(-1).disableIf(get_player().isTaur(),"你需要少一点腿才能这么做");
         addNextButton("杀死",killTheMora).hint("这感觉像是仁慈。");
         setSexLeaveButton();
      }
      
      public function moraRibjob() : void
      {
         clearOutput();
         outputText("你[walk]近倒下的莫拉，[if (lustvictory) {短暂地停顿了一下，惊叹于她的呼吸没有产生任何雾气|停顿了一下，想知道她是否还在呼吸}]。微风吹拂着破烂的布料，对她的身材没有任何帮助，但当你俯身用[hand]抚摸她的躯干时，很明显她并没有什么身材可以炫耀。尽管如此，恶魔那骨瘦如柴的身躯依然具有迷人的女性魅力，她袖子间隐约可见的肋骨激发了你的兴趣，促使你粗暴地撕开那廉价的亚麻布。它很容易就被撕碎了。");
         outputText("[pg]莫拉继续茫然地盯着雪地。她变色的皮肤紧贴着骨头，误导了任何观察者，让人无法看出她有多强壮。你的手指在每根肋骨之间的小凹陷处上下滑动，然后托起她几乎不存在的乳房，都没有任何反应。至少，不是来自她——你的身体反应很强烈。[if (isemaciatedbuild) {也许人们看待你自己饥饿的体格，就像你看待她的一样。}]你俯身吸吮她的一个乳头，同时揉捏她的胸部，品尝着没有任何油脂或汗水的皮肤，仿佛真的死了一样。当你用舌头探索她的肋骨时，里面微弱的脉搏似乎加快了。");
         outputText("[pg][if (!isnakedlower) {尽管很冷，你还是照料着你的[armor]，直到你把你的[genitalsdetail]暴露在自然环境中。}]急于摆脱寒冷，你[if (tailLeg) {把尾巴松散地扭在她的双腿之间和周围|跨坐在恶魔身上}]，把你的[if (hascock) {长度|[if (hasballs) {蛋蛋和}]大腿}]压在最初冰冷的肉体上，但随着你们两人之间的风被挡住，它很快变得温暖起来。莫拉依然软弱无力地侧躺着，你抬起她那纤细、看起来很脆弱的手臂，以此为杠杆拉扯并在她的肋骨上滑动。");
         outputText("[pg]当你如释重负地叹息时，浓雾笼罩了你的脸。虽然她的骨头很坚硬，但挤压那光滑的隆起却令人满足。[if (silly) { 这一定就是他们所说的\"为[his]快感而生\"的意思。}]当你伸手抚摸她时，她在你身下摇晃，抚摸她的锁骨，顺着她胸骨的沟壑往下摸，然后再次揉捏她的乳房。你的另一只手臂抓着她的手臂，当你前后挺动臀部时，你用力拉扯它，操着她的肋骨[if (hasVagina) { 用你的[pussy][if (isHerm) { 和 }]|，}][if (hasCock) {让你的[cockhead]与你几乎不敢相信没有折断的小树枝碰撞}]。");
         outputText("[pg]你松开莫拉的手臂，把她平推在背上。调整你的姿势，把你的[if (hasCock) {肉棒在她的胸口中间摩擦}][if (hasvagina) {[if (isHerm) {，你的[clit]嗡嗡作响|[clit]}]抵着她的胸骨底部}]。她平坦的乳房，尽管营养不良，但在它们所依靠的骨头上仍然很柔软，你在骑向高潮时紧紧抓住它们。它几乎要到来了，但又躲开了你，你更快、更急切地压迫着。她那骨瘦如柴的胸部没有一丝脂肪，你的[genitalis]尽可能地靠近她的心脏，砰砰地撞击着她的横膈膜，迫使她发出浅浅的喘息。呻吟着，你终于得到了释放，颤抖着[if (hascock) {射在她的脖子、下巴和脸上|喷水并弄湿了她空荡荡的肚子}]。");
         outputText("[pg]深吸一口气后，你抚摸着她的脸，看着那双似乎完全无动于衷的空洞眼睛。你站起身来，[if (!isnakedlower) {[if (hasCock) {收起你的肉棒|掩盖起来}]|整理好衣服}]。");
         get_player().orgasm("VaginalAndDick");
         get_combat().cleanupAfterCombat();
      }
      
      public function moraLose() : void
      {
         clearOutput();
         outputText("趁你身形摇晃之际，莫拉向你扑来，将你按倒在地！你被深深地压进雪里，冰冷的雪冻得你头疼。");
         outputText("[pg][say:别怕，宝贝，我在这里，]她低语道。你忍受着寒冷的刺痛，抬头看着怪物空洞的眼睛，被那哀伤的凝视所吸引。飞舞的雪花似乎变大了，你的身体只有栖息在上面的生物保护着，当她笨重的身躯压下来时，你发现呼吸变得更加困难。[say:我会保护你的，]莫拉说道。在你虚弱的状态下，这个皮包骨头的[i:食尸鬼]现在显得沉重得多。你努力想把她推开，但她抓住你的[hand]并将其猛地按在雪下的冰面上，使其完全麻木。那锐利的凝视中没有一丝生机。即使这个可怕的恶魔[if (isnaked) {用指甲在你的躯干上游走|用那细长的手指侵入你的[armor]}]，她的表情也完全是超然的。你因她冰冷地抓住你的[genitalsdetail]而退缩。");
         outputText("[pg][say: 你真是个烂摊子，]她说道。[say: 为什么会有人想要你？]锋利的指甲刮过你的[if (hascock) {肉棒|[if (hasVagina) {阴唇|屁股}]}]。焦虑的恐惧占据了你，让你紧张起来[if (!hascock) {，这只会让情况变得更糟}]。那破烂的[i:东西]，或许可以称之为翅膀，拍打着、摇摆着，吹走了一些雪，给你的[skinshort]带来了一阵无情的寒风。尖锐刺痛的疼痛让你大叫出声。那些像刀子一样的指甲，[if (hascock) {在你的[cock]上拖拽|强行进入你的[vagorass]}]。[say:但别怕，[if (isChild) {小[boy]|宝贝}]。]你在她身下扭动。[say: 我在这里。]");
         if(get_player().hasCock())
         {
            outputText("[pg]当她跨坐在你身上时，她的蹄子踩在你的[if (isTaur) {动物般的下半身|[if (tailLeg) {尾巴|[leg]}]}]上，欢迎你的阴茎进入一个几乎被她穿的破布遮住的裂缝。接触时，湿润感让你的阴茎发冷，当阴唇分开将你纳入其中时，你发现风的保护几乎没有带来任何缓解。她的阴道几乎没有温度。她以一种机械的方式骑着你，遵循着固定的节奏和姿势，没有任何偏差。");
         }
         else
         {
            outputText("[pg]当她强行将两根手指插得更深时，她的蹄子踩在你的[if (isTaur) {动物般的下半身|[if (tailLeg) {尾巴|[leg]}]}]上，对那些爪子引起的不适毫不在意。");
            if(get_player().hasVagina())
            {
               get_player().cuntChange(0,true,false);
            }
            else
            {
               get_player().buttChange(0,true,false);
            }
            outputText("手指的抽插没有停止，刮擦着你的内部，直到试图拒绝入侵的疲劳让你放松下来。当她从你体内抽出时，你如释重负地喘了口气，但当她跨坐在你身上，用她羽毛般的尾巴拍打你的臀部时，这种解脱感就被剥夺了。以一种可怕的速度，她的尾巴弯曲并刺入你体内，那些像头发一样的毛囊戳刺着，带来的不适几乎和她的爪子一样多。");
         }
         outputText("[pg]突然一拳打在你的脸颊上，让你措手不及！那些骨头看起来很脆弱，但她是一个[i:恶魔]，并且有足够的力量来证明这一点。从眩晕中恢复过来，你回头看着她冷漠的脸，不禁想知道她自己是否知道为什么要这么做。你因为臀部受到更重的撞击而发出咕哝声——她操你操得更狠了。莫拉倾身向前，双手环住你的喉咙，逐渐增加压力。她强暴你越狠，勒得就越紧。你把你的[hand]放在她的手腕上，这激起了她握力的一阵增强。你退缩、咳嗽、干呕。感觉不再那么冷了。世界让你为性做好了准备，但现在肾上腺素向你尖叫，你必须挣脱，否则你可能会死。你的脸颊湿润了。强行睁开你的[eyes]，你抬头盯着看，看到了这个怪物身上出现的第一个情感迹象。");
         outputText("[pg][b:仇恨。]她的眼睛里充满了沸腾的、无法控制的仇恨。[if (hasgooskin) {你的膜被痛苦地拉伸，你向所有的神祈祷你的粘液形态能在斩首中幸存下来。}]莫拉靠得更近了，她充满愤怒的眼睛钻进你的灵魂，她开始抬起你的头，然后反复猛烈地砸下，同时发出一声刺耳的哀嚎。介于高潮和完全失去肌肉控制之间的某种感觉，在变得软弱和黑暗之前，给了你最后一次抵抗的冲动。");
         get_player().set_fatigue(get_player().maxFatigue());
         get_player().dynStats(DynStat.Tou(-5),DynStat.Cor(2));
         get_combat().cleanupAfterCombat(get_camp().returnToCampUseEightHours);
      }
      
      public function moraFuck() : void
      {
         clearOutput();
         outputText("当你靠近这个干瘪的生物时，你挺起了你的[cocks]。当你蹲下身子与她平齐时，她没有任何反应；当你拉起破烂的亚麻布并分开她骨瘦如柴的双腿时，她也没有挣扎的迹象。她空洞的眼睛越过你，一眨不眨地盯着天空。");
         outputText("[pg]触摸那紧绷在骨头上的皮肤，就像在抚摸一具干尸。她的臀部很尖锐，肋骨在残破的裙子下若隐若现。你的[hand]顺着她的身体滑下，拂过她突出的骨盆。她没有发出任何情色的喘息。然而，当你的手指滑向她的小穴时，你陷了进去，发现那里出奇的湿滑。");
         outputText("[pg]你毫不客气地[if (isTaur) {走上前去，为了那个开口而耸动，跪得很低才能够到。你花了好一会儿盲目地操着她纤细的大腿，但很快你就}]把你的[cocktype]推进了恶魔的阴户。她进入时并没有收紧，对入侵毫无反应。这种令人不安的软弱无力让你怀疑她是否真的还活着，但你不屈不挠地在她体内移动——一开始慢慢地操她，然后越来越用力，追寻着她松弛的肉壁无法回应的摩擦。然而，湿润的血肉仍然令人兴奋。你越来越强的冲刺摇晃着她的身体，几乎产生了一种回应的错觉，但她空洞的眼睛继续一眨不眨地盯着虚无。");
         outputText("[pg]每一次动作都让你紧贴着她的骨头。这种寂静让这个行为感觉冷酷、阴森，却又有一种奇怪的亲密感。她的呼吸，当它出现时，是浅浅的、平静的。也许是因为有这样一个软弱无力的伴侣，这种单调扭曲了你对时间的感知，你喘息着，微微颤抖。[if (isTaur) {把你野兽般的身体靠在|拥抱着}]这个脆弱的生物，你在最后一次猛烈的冲刺中挺动着臀部，然后一声真正令人释然的呻吟从你的唇间溢出；你射入了她的深处[if (cumnormalleast) {，立刻感觉到精液顺着你的长度倒流，从莫拉的小穴里渗出来}]。这并不吸引人，但也并非完全不愉快。");
         outputText("[pg]你站起身来，抵御寒冷。恶魔仍然一动不动地躺着。没有必要逗留。你拿走你能找到的贵重物品，继续朝着营地的方向冒险。");
         get_player().orgasm("Dick");
         get_combat().cleanupAfterCombat();
      }
      
      public function moraEncounter() : void
      {
         var monster1:Monster;
         var _g:MoraScene;
         clearOutput();
         if(!saveContent.encountered)
         {
            outputText("风雪开始变大，将你笼罩在雪花和狂风的迷雾中，你不得不遮住眼睛。即使你改变方向来保护你的脸，被卷起的雪也让你很难看清远处的景象。半盲的徘徊让你走出了很远，你决定最好还是回家，而不是忍受这种天气。");
            outputText("[pg]转过身，你看到一个身影。起初很难看清细节，除了一对向后弯曲并交汇于一点的长角。她正在靠近。疲惫的女性低语在你的脑海中回荡，[say:留下来陪我……] 恶魔继续步履蹒跚地朝你走来，即使你已经做好了战斗的准备。她的翅膀像柳树的枝条一样伸展——破烂的皮革细丝沉重地挂在肢体上。你很怀疑它们还能不能飞。");
            outputText("[pg][say:你已经无处可去了，]她低语道。");
            _g = this;
            monster1 = new Mora();
            addButton(0,"战斗",function():void
            {
               _g.startCombatImmediate(monster1);
            }).hint("听起来对你很有威胁。");
            addButton(1,"逃跑",fleeTheMora).hint("听起来对你很有威胁！");
         }
         else
         {
            outputText("卷起的雪遮蔽了你的视线，迫使你用[hand]捂住脸来保护自己。当你环顾四周时，你看到远处有一个柳树的剪影。你知道雪下只有冰，那不可能是树。");
            startCombat(new Mora());
         }
         saveContent.encountered = true;
      }
      
      public function moraBonegrind() : void
      {
         clearOutput();
         outputText("她的四肢松散地张开，翅膀像雪地里脆弱的树枝一样皱缩在身后。莫拉茫然地盯着远方，当你蹲在她身边时，她的表情没有变化。尽管她的外表如此，但她并没有死。");
         outputText("[pg]你的[hands]滑进她破烂的裙子下，探索着她臀部生硬的棱角、腹部凹陷的跨度，以及在薄薄的皮肤下凸起的肋骨，每一道隆起都清晰可见。你把手掌平压在上面，颤抖着，因为她感觉如此脆弱而兴奋。她那骨瘦如柴的体格有一种诱惑力[if (hasarmor) {，当你脱衣服时，感受着她和你之间的差异}]。当你抚摸和揉捏这个饥饿的女人时，你的遐想把你带入了一个近乎拥抱的状态。你的欲望仍在沸腾，你[if (tailLeg) {深情地把尾巴缠在她的腿上|跨坐在她身上}]，把你的[genitalsdetail]压在她的臀部上。");
         outputText("[pg]自然而然地，当你开始耸动时，你的一只[hands]移到了她的大腿上，将一根手指按进她的小穴，这似乎是一种未被注意到的快感回报。你缓慢地摩擦着，把你的[clit]拖过她身体冰冷、纤薄的血肉，享受着你不断积聚的热量与她毫无生气的冰冷之间的对比。尽管你用手指抠弄着恶魔顺从的阴户，她仍然没有任何反应。这可能完全是一次单方面的体验。");
         outputText("[pg]你托起她的一侧乳房，注意到她胸前那浅浅的柔软。即使紧绷在骨头上，也还有女人的残余。她的乳头没有反应，但你还是用手指揉捏着其中一个，在用[tongue]滑过那个小凸起之前感受着它。");
         outputText("[pg]当你放弃她松弛的阴道，把手指张开放在她的肋骨上时，你能感觉到那种空虚，那是一个空洞的空间。你移向她的脸，拂去她空洞眼睛上的头发，俯身亲吻她的嘴唇。它们干燥且不欢迎你。随着你摩擦得越来越用力、越来越快，摩擦力不断增加，每一次动作的改变都推挤着她坚固的骨架。你骑着她，就像她是一个专门为此而生的表面，专为你的欲望而雕刻。莫拉没有眨眼，没有呼吸得更重，也没有任何反应，但你的快感依然在增长。");
         outputText("[pg]你在高潮中大叫，紧紧抓住她软弱无力的身体，好像她会溜走一样[if (hasCock) {，把你的精液喷洒在她身上}]。你的身体随着热量跳动，当你瘫倒在她身上时，汗水在冷空气中化作薄雾。当你的体液浸透她时，她依然毫无变化，漠不关心。");
         outputText("[pg]当你安顿下来时，裂谷的严寒刺骨。是时候离开了，你在离开前从恶魔那里收集了你能收集的东西。");
         get_player().orgasm("VaginalAndDick");
         get_combat().cleanupAfterCombat();
      }
      
      public function load(param1:int, param2:*) : void
      {
         Utils.extend(saveContent,param2);
      }
      
      public function killTheMora() : void
      {
         outputText("[pg]怪物软绵绵地躺着，一动不动，即使你准备处决她。");
         if(get_player().get_weapon().isAxe() || get_player().get_weapon().isScythe())
         {
            outputText("你的[weapon]快速挥向莫拉的脖子。");
         }
         else if(get_player().get_weapon().isBlunt())
         {
            outputText("你举起你的[weapon]，猛地砸在莫拉的头上，毫不留情地结束了她。");
         }
         else if(get_player().get_weapon().isRanged())
         {
            outputText("你稳稳地握住你的[weapon]，直接向莫拉的头部射击。");
         }
         else if(get_player().get_weapon().isStabby())
         {
            outputText("你转动着手中的握柄，将尖端向下，然后刺入。当[weapon]刺入她的心脏时，莫拉没有做出任何明显的反应，平静地死去了。");
         }
         else
         {
            outputText("将她压在你的[foot]下，你紧紧抓住并扭断了莫拉的脖子。");
         }
         get_player().upgradeDeusVult();
         get_combat().cleanupAfterCombat();
      }
      
      public function get_debugName() : String
      {
         return "莫拉";
      }
      
      public function get_debugHint() : String
      {
         return "";
      }
      
      public function fleeTheMora() : void
      {
         outputText("[pg]你至少还有一个营地可以回，所以她错了，但你不打算留在这里和她争论！[if (hasWings) {你本能地拍打你的[wings]，转身逃跑，[if (canFly) {把自己从雪地里拉起来|对你[feet]陷进去的雪地没什么帮助}]|你匆忙穿过雪地}]，把那个步履蹒跚的怪物甩在后面。她似乎并没有花太多力气追赶；然而，刺骨的寒风消耗着你的体力，最终让你的逃跑变成了爬行。有些不对劲。");
         outputText("[pg][say:什么都不会改变，]她低语道。寒冷刺痛了你的[skinshort]。继续前进，你很快发现脚下的冰层破裂了，紧接着喷出一股水流，水雾中夹杂着冰霜，但你避免了掉进深渊。[say:你应该心存感激。]");
         outputText("[pg]你转过身，看到高高举起的垂柳般的翅膀勾勒出那个骨瘦如柴的怪物。不知怎么的，她跟上了你，或者也许你在原地打转。");
         startCombat(new Mora());
      }
      
      public function debugMenu(param1:Boolean = true) : void
      {
         get_game().debugMenu.debugCompEdit(saveContent,new SaveContent(null));
      }
   }
}

