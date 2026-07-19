package classes.scenes.areas.desert
{
   import classes.BaseContent;
   import classes.BreastRow;
   import classes.CoC;
   import classes.Cock;
   import classes.CockTypesEnum;
   import classes.DynStat;
   import classes.ImageManager;
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
   import classes.internals._OneOf.OneOf_Impl_;
   import classes.parser._Parser.TagFun_Impl_;
   import classes.scenes.Camp;
   import classes.scenes.combat.Combat;
   import coc.view.CoCButton;
   import flash.Boot;
   import haxe.IMap;
   import haxe.ds.Either;
   
   public class SandWitchScene extends BaseContent implements TimeAwareInterface
   {
      
      public var pregnancy:PregnancyStore;
      
      public function SandWitchScene()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         pregnancy = new PregnancyStore(589,588);
         pregnancy.addPregnancyEventSet(26,[96]);
         pregnancy.addPregnancyEventSet(15,[96]);
         CoC.timeAwareClassAdd(this);
      }
      
      public function witchBirfsSomeBees() : void
      {
         clearOutput();
         get_images().showImage("sandwitch-give-birth-bee");
         outputText("[pg]当你在狂风肆虐的荒凉沙漠中跋涉时，可以听到熟悉的蜜蜂嗡嗡声。你暗自思忖，试图弄清楚一群蜜蜂大老远跑到这里来干什么。然后你恍然大悟；那个和你交配过的沙漠女巫一定在附近，而且她可能已经生了！");
         outputText("[pg]你冲向嗡嗡声越来越大的地方，偶然发现那位傲慢的女巫躺在沙地上，她的臀部周围积聚着蜜蜂产卵后的明显痕迹。蜂群只停留了短暂的片刻");
         if(get_silly())
         {
            outputText("，回荡着微弱的[say: @]的叫声");
         }
         outputText("；很可能只是在等有人找到它们的母亲，然后才朝森林的大致方向飞去。沙漠狐狸微弱的声音在空气中回荡，她对你说话。[say:那……是最棒的。我不敢相信我当妈妈了！]她向你投来感激的目光，感谢你向她展示了作为宿主是多么令人愉悦。看到她需要休息，你点点头，转身准备离开……却感觉一只手抓住了你的[leg]。[say:如果你不经常来“打个招呼”，我会很失望的；记住这一点，" + get_player().mf("帅哥","美女") + "。]她柔声说道，然后沉沉睡去。在这个沙漠阴凉的地方休息，她会没事的，沙丘目前挡住了太阳，让她免受阳光的灼伤。");
         outputText("[pg]对事情的结果感到满意，你回到营地，决定今天的下一步行动。");
         pregnancy.knockUpForce();
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function timeChangeLarge() : Boolean
      {
         return false;
      }
      
      public function timeChange() : Boolean
      {
         pregnancy.pregnancyAdvance();
         if(pregnancy.get_isPregnant() && pregnancy.get_incubation() == 0)
         {
            pregnancy.knockUpForce();
         }
         return false;
      }
      
      public function sandwitchTitFuck() : void
      {
         clearOutput();
         registerTag("hasPrehensileTail",TagFun_Impl_.fromBool(get_player().hasPrehensileTail()));
         outputText("你把女巫推到一边，拉扯着宽松的布料，直到你成功地将她暗褐色的肌肤暴露在沙漠的[sun]光下，与苍白的沙子形成鲜明对比——最重要的是，露出了两对丰满的乳房。按照英格纳姆的标准，她绝对算得上是波霸，[if (silly) {但这里是玛瑞斯，所以必须是字面意义上的“波霸”，一对D罩杯叠在一对C罩杯上面|至少第一对是D罩杯，第二对只小一点点}]。");
         outputText("[pg][say:畜生，]她嘶嘶地说道，[if (isTaur || hasFur || hasScales) {[if (silly) {但这顶多只说对了一半|就好像大多数玛瑞斯人长得不像你一样}]|对你的急躁感到不满}]。尽管她表情如此，但她的乳头却坚挺地凸起着。");
         outputText("[pg]遵循你的本能，你摸索着沙漠女人的一个乳房，将手指陷了进去。它显然很柔软，但阻力比人们想象的要大，这很快就由她乳头流出的大量乳汁解释了。你捏得越用力，她呻吟得就越大声，仅仅几秒钟就挤出了足够满足一个婴儿的量，但这种赋予生命的液体却流过了你的手指，流到了她的双乳之间。一股暗流般的口渴感升起，迎合着新鲜乳汁的香气。");
         outputText("[pg][say:你饿了吗，[if (isUnderage) {孩子|野兽}]？这不是给你的，]她说道。但你对喝奶不感兴趣——[if (isnakedlower) {你的[if (!isnaked) {着装让你的[cockplural]暴露在外|明显裸体}]应该已经说明了这一点|当你脱下[armor]时，你清楚地表明了这一点}]。");
         if(get_player().isGoo())
         {
            outputText("你简单地将自己倾泻在她的中段，用你粘稠的身体将她压在身下");
         }
         else if(get_player().isTaur())
         {
            outputText("[if (cor > 33) {你用[foot]将她推入沙中，然后坐在她的中段|你小心翼翼地对待她，向前迈出一步，轻轻地坐在她的中段}]");
         }
         else
         {
            outputText("[if (cor > 33 && !tailLeg) {你用[foot]将她牢牢地推入沙中|你靠近她，在就位时轻轻地将她压入沙中}]");
         }
         outputText("。女巫的声音卡在喉咙里，只能默默地看着[eachcock]。[say:像恶魔一样的饥渴，]她终于说道。");
         outputText("[pg][if (isday) {她应该更感激你在沙漠的阳光下提供阴凉|她温暖的乳房在寒冷的沙漠之夜是一种恩赐}]。起初，你随意地将[prickplural]放在她乳白色的枕头上，但那滑溜溜的感觉几乎把你吸进了它们之间，[if (cockthickness < 9) {完全}]包裹住了你[if (multicock) {最粗的}]肉棒。湿润、火热、柔软，它简直就像一个小穴[if (cockLength > 10) {——一个能比普通小穴容纳你更多长度的小穴}]。[if (isTaur) {考虑到你所处的位置，你[i:可以]盲目地操她，但你命令她把乳房合拢，以获得适当紧致的体验|唯一缺少的是紧致感，但你用[hands]抱住她的乳房，挤压你的[dickplural]}]；增加的压力挤出了更多的乳汁，涂满了你的肚子，并漏出了大量的润滑剂。你[if (istaur) {调整前腿|倾身}]并挺进！所有的四个乳房都在撞击下泛起涟漪。而这个淫荡的女巫甚至呻吟起来！她说话的语气可能像是在评判你，但她和这个世界上的任何东西一样变态。[if (!isTaur) {为了保险起见，你捏了捏那几个坚挺、修长的乳头，引得她发出一声发情的呜咽。}]");
         outputText("[pg]你的臀部开始出于本能地摇晃，起初只是轻柔、平稳的节奏，但随着你的[cockhead]在这个温暖、充满乳汁的山谷中来回摩擦，你感到下体传来一阵刺痛的冲动，想要加快速度。[if (tailLeg) {你的尾巴下部变得湿润，那里肯定没有乳汁，你意识到她的阴道正摩擦着你的鳞片，促使你将尾巴挤进她的双腿之间。|[if (hasPrehensileTail) {你的[tail]无意识地摇摆着，当你再次挺进时，你不假思索地拍打下尾巴，让女巫发出愉悦的尖叫。黏糊糊的残留物附着在尾巴上，你回头看去，发现了她淫液留下的湿润污迹。她可能是敌人，但你不会完全不理会她。你弯曲尾巴，稍微抬起你的[ass]调整角度，然后在坐下时挤进她其中一个小穴。}]}]她喘息着，无法停止扭动。[if (isTaur) {你再次|你克制着}]告诉她把乳房挤在一起[if (!isTaur) {，一对用她的手，另一对用你的手}]。她深吸一口气平复心情，点了点头，在你抽插时紧紧握住你临时充当的飞机杯。[if (cockLength > 8) {你的[cock longest]在发情中不断撞击和摩擦她的脸，也许这会让你曾经的袭击者感到困扰，但你只听到一声短暂的不满惊呼，随后就被你的肉棒强行塞进她张开的嘴里而变得含糊不清。至少她能喝到她把你淋透的乳汁。}]");
         outputText("[pg][if (hasgooskin) {黏液在你腹部浓稠地凝结|热量在你的肌肉中积聚}]。弹跳的乳肉排斥并把你向后拖拽。你毫无顾忌地猛烈抽插以求释放，呻吟着，沉浸在享受这种体验中。你达到了顶峰，突然射出一股精液[if (cockLength > 8) {顺着她的喉咙[if (multicock) {并喷洒在她的脸上}]|喷洒在她的脸上}]，紧接着是另一股，然后是随着你臀部抽插减慢而体积减小的微弱喷射。[if (cumHighLeast) {当你慢慢停下来时，女巫正因为那股将她深褐色皮肤染成苍白色的洪流而语无伦次。}]几次呼吸之后，你踉跄着站起来[if (!tailLeg && hasPrehensileTail) {，[tail]湿漉漉地从她的小穴中拔出，}]并感觉到你的[if (multicock) {阴茎在露天中自由悬垂，它们|阴茎在露天中自由悬垂，它}]沾满乳汁的长度在微风中迅速冷却。[if (allowBaby) {你想知道，如果让它们舔干净你的[dickplural]，你能喂饱多少个婴儿。}]不仅仅是你的生殖器——乳汁到处都是。回到营地后可能需要洗个澡。");
         get_player().orgasm("Dick");
         get_combat().cleanupAfterCombat();
      }
      
      public function sandwitchTauntChild() : void
      {
         clearOutput();
         outputText("在取得明显的胜利后，你感到欣喜若狂，你懒洋洋地绕着气喘吁吁的女巫转圈，并嘲笑她。[say:看看你，]你嘲弄道，[say:一个伟大的沙漠女巫被一个无助的小[boy]打败了。你甚至无法停止幻想着我自慰，不是吗？]你踢开她的手，她跌倒成一团，羞愧地轻声哭泣，但仍在自慰。是时候找点乐子了！");
         outputText("[pg]你抓住无助的女巫，兴致勃勃地（可能还有她的帮助）把她翻了个底朝天。她喘着粗气，屈辱地瞪着你，双臂交叉在长袍前面，遮住了下面看起来像四个大奶子的东西。别想！你出其不意地挠她的痒痒，她开始大笑。然后，你把飞快的手指移到她的肚子上，顺着大腿往下。施法者放声大笑，试图拍开你的手臂，这给了你所需的机会。你轻松地避开她因大笑而无力的拍打，摸到她棕色长袍粗糙的布料，一个快速的动作，你撕开她的布料，露出一片晒黑的乳房，上面有四个突出的乳头。");
         outputText("[pg][say:一-一个孩子怎么能这样-]女巫的笑声平息后抗议道。你坏笑着，开始捏和拉扯她的乳头，扭动着娇嫩的凸起，直到乳汁顺着她四个沉甸甸的奶子流下来。");
         outputText("[pg]你毫不费力地挤奶，漫不经心地拉扯和扭动着乳头，同时向她提出一连串的问题，问她除了试图把石头塞进陌生人的屁眼之外，还有没有更好的事情可做。她晒黑的脸颊因尴尬而泛红，但她保持沉默，在你玩弄她的乳头时怒视着你。");
         outputText("[pg]像这样玩弄她的喷奶口其实挺好玩的，虽然你对自己这样利用她感到有点内疚，但她可能会对你做更糟糕的事。你带着傻笑扭动和戏弄着，笑着把其中一个奶子对准女巫的脸，把她自己雪白的汁液溅了她一身。你太投入了，以至于没有注意到俘虏脸上越来越愤怒的目光。她的奶子实在太好玩了，你根本不想浪费时间去注意她脖子以上的部分。这是一个错误，因为她的体型是你的两倍，而且年纪大到可以做你的母亲了。");
         outputText("[pg]太迟了，你看到女巫的手在颤抖，还没等你反应过来，伴随着一声响亮的<b>**啪**</b>，你的视线变得模糊，她的手打在你的脸颊上，把你整个人打翻在地。你试图站起来，但失去了平衡，你又摔倒了，耳朵嗡嗡作响。");
         outputText("[pg]女巫似乎恢复了过来，居高临下地看着你。她尖叫道：[say:我的奶水可不是玩具！]然后将双臂举过头顶。从下方，一块躯干大小的沙岩从沙丘中隆隆升起，正中你的胸口，将你举起，你的双腿和双臂无力地悬空着。几句低语的咒语过后，你的手腕和脚被吸入石块中，将你束缚成一个无助的姿势。");
         outputText("[pg][say:你父母没教过你规矩吗？！]她厉声说道，空气中噼啪作响着魔法。[say:你需要被教训一下，孩子！]女巫抓住你[armor]的底部，猛地向下拉，将你娇嫩的屁股暴露在炎热的沙漠空气中。更糟糕的是，你的[genitalis]紧紧贴在滚烫粗糙的石头上。这感觉一点也不好受。你对自己的无助感到愤怒，但你无能为力。手指在你光滑白皙的屁股上挠痒痒，然后，毫无预兆地，你的[ass]挨了一巴掌！清脆的响声在沙漠中回荡，力道之大，让你像个手无寸铁的孩子一样哭了起来。");
         outputText("[pg]坏笑的女巫大笑着，[say:你太骄傲了，这对你没好处。现在，我要教你不要浪费食物，并尊重我们的教团，一巴掌一巴掌地教！]她甚至没有等待就再次打你，毫不犹豫地将手拍在你毫无防备的屁股上，留下红色的鞭痕。你痛苦地扭动着，试图逃跑，试图挣脱，但无济于事——你被石头束缚着，根本无法逃脱。你所能做的就是在束缚中无用地扭动，而你那小小的屁股被晒得通红，即使没有被打，也残留着刺痛。" + (get_silly() ? "[say:我要把你的屁股打得你一个星期都坐不下来，[boy]！]" : ""));
         outputText("[pg]这似乎持续了永远，尽管实际上只有几分钟。在感觉像是几个小时的痛苦之后，你开始乞求停止，呜咽着，眼泪和鼻涕流下你稚嫩的脸庞。一旦你的声音带上了真正的悔意，击打就停止了。");
         outputText("[pg]女巫发泄完心中的沮丧后，说道：[say:这还算可以接受。现在，我要留你在这里反省你的罪过。让太阳恶毒的目光烤去痛苦，用纪律取而代之。]她对教团的奉献听起来几乎是狂热的。" + (get_silly() ? "但难道没人告诉过她不要为打翻的牛奶哭泣吗？" : ""));
         outputText("[pg]沙漠女巫捡起她的长袍，准备离开。她走了几步后停下来，转过身看着你，[say:也许这能缓解等待的痛苦，既然你这么喜欢它们，孩子。]当她做出熟悉的动作时，你的眼睛因愤怒和恐惧而睁大，但你无能为力。很快，光滑的石球滑过你的脸颊，进入你小小的臀部。它们都以略微不同的节奏振动着，你如此专注于这振荡的肛门交响乐，以至于错过了女巫的离开。照这样下去，你真的一个星期都坐不下来了！[pg]最终，魔法柱消退，退回沙子中。与此同时，毫无生气的石球从你的[ass]中滚出。你带着瘀伤，在沙滩上高潮到精疲力竭，你的[armor]褪到了脚踝处。也许下次你就不会浪费她的奶水了。");
         get_player().orgasm("Anal");
         get_combat().cleanupAfterCombat();
      }
      
      public function sandwitchSpanking() : void
      {
         clearOutput();
         outputText("在取得明显的胜利后，你感到欣喜若狂，你慵懒地绕着气喘吁吁的女巫转圈，嘲笑她。[say:看看你，]你嘲讽道，[saystart]一个强大的沙漠女巫，被一个无助的旅行者打倒了。");
         if(get_monster().get_HP() < 1)
         {
            outputText("你甚至站不起来！");
         }
         else
         {
            outputText("你甚至无法停止自慰，不是吗？");
         }
         outputText("[sayend]你踢开她的手，她跌倒成一团，悲痛欲绝地轻声哭泣");
         if(get_monster().get_lust() >= get_monster().maxLust())
         {
            outputText("但仍在自慰");
         }
         outputText("。是时候找点乐子了！");
         get_images().showImage("sandwitch-get-spank");
         outputText("[pg]你抓住无助的女巫，把她翻转过来。她喘着粗气，挑衅地瞪着你，双臂交叉在长袍前面，遮住了下面看起来像四个大乳房的东西。这可不行！你出其不意地挠她的痒痒，她开始大笑。然后，你将你那飞快的手指移到她的肚子上，然后顺着她的大腿往下。施法者放声大笑，试图拍开你的手臂，这给了你所需的机会。你轻松地滑过她因笑声而混乱的攻击，来到她棕色长袍的粗糙布料上，随着肌肉的快速收缩，你从中间撕开了布料，露出了一片晒黑的乳房，上面有四个突出的乳头。");
         outputText("[pg][say:不，]女巫在笑声平息后抗议道。你坏笑着，开始捏拉她的乳头，捏着娇嫩的乳头，直到奶水从她四个沉重的乳房上滚落下来。你毫不费力地挤奶，漫不经心地拉扯和捏着乳头，同时向她提出问题，问她是否有比试图把石头塞进陌生人屁股里更好的事情可做。她晒黑的脸颊因尴尬而变红，但她保持沉默，在你玩弄她的乳头时怒视着你。");
         outputText("[pg]像这样玩弄她的乳头其实挺有趣的，");
         if(get_player().cor < 33)
         {
            outputText("虽然你觉得这样利用她有点过分，但她对你做的事可能会更糟。");
         }
         else if(get_player().cor < 66)
         {
            outputText("虽然你不确定是否应该这样利用她，但她对你做的事可能会更糟。");
         }
         else
         {
            outputText("虽然你以前觉得这种事很恶心，但现在你已经完全不在乎了。");
         }
         outputText("你带着傻笑捏弄挑逗着，大笑着把其中一个乳头对准女巫的脸，把她自己雪白的乳汁溅了她一脸。你太投入了，以至于没有注意到俘虏脸上越来越愤怒的目光。她的奶子实在太好玩了，你根本没花时间去注意她脖子以上的部分。这是一个错误。");
         outputText("[pg]太迟了，你看到女巫的手发光，还没等你反应过来，一根坚硬的石棍就砸在了你的头上，把你整个人打翻在地。你试图摇摇晃晃地站起来，但你失去了平衡，又摔倒了，耳朵嗡嗡作响。女巫似乎恢复了过来，正居高临下地看着你。她尖叫道：[say: 我的奶水不是玩具！]然后把双臂举过头顶。从下面，一块躯干大小的沙岩块从沙丘中隆隆升起，正中你的神经丛，把你举了起来，[legs]和手臂无力地悬垂着。几句低语的咒语之后，你的手腕和[foot]被吸进了石块中，把你绑成了一个无助的姿势。");
         outputText("[pg][say: 现在是谁倒下了？！]她厉声说道，空气中噼啪作响着魔法。[say: 你需要被教训一下，异星人！]女巫抓住你[armor]的底部，把它拉下来，把你的[butt]暴露在炎热的沙漠空气中。");
         if(get_player().hasCock())
         {
            outputText("更糟糕的是，[eachCock]现在毫无保护，被你的体重压在粗糙的石头上。这感觉一点也不好。");
         }
         else if(get_player().hasVagina())
         {
            outputText("更糟糕的是，你的[vagina]紧紧贴在粗糙的石头上。这感觉一点也不好。");
         }
         outputText("你对自己的无助感到愤怒");
         if(get_player().hasPerk(PerkLib.FireLord) || get_player().hasPerk(PerkLib.Hellfire) || get_player().hasPerk(PerkLib.Dragonfire))
         {
            outputText("，愤怒地喷出一股火焰，但你甚至无法像这样正确地引导爆炸。它所做的只是把下面的一些沙子融化成玻璃");
         }
         else
         {
            outputText("，但你无能为力");
         }
         outputText("。手指在你的屁股[skin]上挠痒痒，然后，毫无预兆地，你的[butt]被拍了一下！击打的声音在沙漠中回荡，硬得让你眼角泛起泪花。");
         outputText("[pg]得意洋洋的女巫笑着说：[say: 你太骄傲了，这对你没有好处。现在，我将教你尊重我们的秩序，一次打一下屁股。]她甚至没有等待就再次打你，毫不犹豫地把手拍在你毫无保护的屁股上。你痛苦地扭动着，试图逃跑，试图挣脱，但没有用——你被石头束缚着，你无法逃脱。你所能做的就是在你的[butt]被打得通红时，无用地在束缚中扭动，即使没有被打，也会因为残留的疼痛而刺痛。");
         outputText("[pg]这似乎持续了永远，在感觉像几个小时的痛苦之后，你开始乞求它停止，呜咽和抽泣。一旦你的声音带上了真正的悔改，打击就停止了。女巫发泄了她的挫败感，说道：[say: 这是可以接受的。现在，我将留你在这里思考你的罪过。让太阳恶毒的目光烤去痛苦，用纪律取而代之。]");
         if(get_player().cor < 50)
         {
            outputText("她听起来对她的秩序几乎是狂热的。");
         }
         else
         {
            outputText("她到底在说什么？她真的认为她的小折磨会改变你的态度吗？");
         }
         outputText("[pg]捡起她破烂长袍的碎片，沙漠女巫准备离开。走了几步后，她停下来，转身看着你，[say: 也许这能缓解等待。]当她做出熟悉的动作时，你愤怒地睁大了眼睛，但你无能为力。很快，光滑的石球滑过你的脸颊，进入你的[butt]");
         if(get_player().hasVagina())
         {
            outputText("和 [vagina]");
         }
         outputText("。它们都以略微不同的节奏振动着，你太专注于这震荡的肛门交响乐了，以至于错过了女巫的离开。你骑着振动的石头达到了无数次高潮。最终，魔法柱消退了，退回了沙子中。与此同时，毫无生气的石球从你的[asshole]里滚了出来");
         if(get_player().hasVagina())
         {
            outputText("和 [vagina]");
         }
         outputText("。你浑身是伤，在沙地上高潮到精疲力尽，失去了意识，你的[armor]还挂在脚踝上。也许下次你就不会浪费机会去幸灾乐祸了。");
         get_monster().set_lust(98);
         get_monster().set_HP(2);
         get_player().set_lust(get_player().maxLust());
         FlagDict_Impl_.arrayWriteFloat(KFLAGS.flags,89,get_monster().XP);
         get_combat().cleanupAfterCombat();
         get_player().orgasm("VaginalAnal");
         dynStats(DynStat.Sens(5));
      }
      
      public function sandwitchSexChild() : void
      {
         spriteSelect(SpriteDb.get_s_sandwich());
         clearOutput();
         outputText("沙漠女巫显得有些害怕，但当你用你那孩子气的手指轻轻挑逗她的阴唇时，她的呼吸开始慢慢急促起来，开始呻吟，双腿也不由自主地张开了。[say:怎么了，被一个小男孩弄得这么慌乱？]你满意地咧嘴一笑，将你那小巧却坚挺的[cock 1]抵在她的唇上，缓慢而温柔地推进。起初，你忍不住注意到她看到你那孩子气的肉棒时在咯咯地笑。");
         outputText("[pg]沙漠女巫大叫出声，她的双手抓住你的臀部，紧紧地压在你的[skin]上，你年轻的心智失去了对感官的控制，你强行将你的[cock 1]插入她的深处。你几乎觉得自己像个处男，你的[cock 1]在跳动，射精的冲动几乎超出了你的控制能力。");
         outputText("[pg]你靠在她的胸前，她那巨大的乳房将乳汁喷射到你的背上，你的头仍然埋在那些褶皱中，你的手臂伸出，满意地抚摸着那巨大的乳房。");
         outputText("[pg]你亲吻着沙漠女巫，渐渐习惯了她那令人难以置信的紧致。你前后抽插着，像个傻瓜一样咧嘴笑着，因为这片土地让你体验到了你在英格纳姆时从未想过自己的身体能做到的事情。即使是魅魔也无法与她那丰满的深处相媲美。");
         outputText("[pg]沙漠女巫渐渐习惯了你那孩子气的阴茎，开始认真起来，她紧紧地抱住你，将你们俩翻滚过来，开始在你的性器官上研磨和猛击。你们的腹股沟猛烈地拍打在一起，如果是普通人，第二天醒来肯定会青一块紫一块。你挣扎着呼吸，沙漠女巫的体液浸透了你的身体，汗湿的肉团将你压平并使你窒息。如果一个人要死，被埋在这样一对奶子里绝对是一个合适的死法。沙漠女巫在狂喜中尖叫，她原本就紧致的深处变得像老虎钳一样，你拍打着她的胸膛试图呼吸空气！你闷哼一声，终于射精并填满了她的深处。");
         outputText("[pg]她得意地笑了笑，终于将手臂从你的背上松开，让你吸入一口炎热的沙漠空气。你的“战利品”躺在你身上，脸上带着得意的傻笑，她的手穿过你的[hair]。");
         outputText("[pg][say:真是个英俊的小伙子……也许我应该把你带回去当我的玩物……]她说着，伴随着调皮的笑声渐渐安静下来。就像你这个年纪的年轻人一样，你睡着了，深深地埋在沙漠女巫的阴道里，你的头埋在她的胸前。");
         outputText("[pg]你猛地惊醒，却发现沙漠女巫仍然昏倒在你身上。她似乎在你们俩周围建起了一道石障来挡住阳光，这提醒了你，在那场战斗中她只展示了她真正致命力量的一小部分。你温柔地触摸你的腹股沟并轻轻揉捏。有一丝微弱的酸痛感，你想起了她将骨盆猛烈撞击你的骨盆的力度。你试图从她体内滑出，但这个动作导致你原本就紧绷的[cock 1]再次变硬，搅动了她的内脏，也把她搅醒了。");
         outputText("[pg][say:呵呵，准备好第二回合了吗，亲爱的？你肯定不会以为我在沙漠里游荡时发现这么可爱的小男孩，做一次就会满足吧！你得为让一个老女人感觉如此……年轻而负责！]");
         outputText("[pg]哦，不，她肯定没打算……");
         outputText("[pg]唉，这位年长的女巫体力远超你这个孩子，她不顾你的抗议和你那紧绷的肉棒，再次开始了动作。又过了一个小时，她才终于对你的身体感到满足。在把最后一滴精液吸进那个真正如天堂般的肉洞后，沙漠女巫终于站起身来离开了。不久之后，你摇摇晃晃地站起来，寻找你的战利品……或者也许是提供服务的报酬？");
         get_player().orgasm("Dick");
         get_combat().cleanupAfterCombat();
      }
      
      public function sandwitchSex() : void
      {
         spriteSelect(SpriteDb.get_s_sandwich());
         clearOutput();
         get_images().showImage("sandwitch-male-win-vagsex");
         outputText("带着迷人、解除武装的微笑，你伸手到她的双腿之间，触摸她小穴湿滑的嘴唇。她有");
         if(get_player().cockTotal() > 1)
         {
            outputText(Utils.num2Text(get_player().cockTotal()));
         }
         else
         {
            outputText("两");
         }
         outputText("！沙漠女巫显得有些害怕，但当你用手指轻轻挑逗她的阴唇时，她的呼吸开始慢慢急促起来，开始呻吟，双腿也不由自主地张开了。你满意地咧嘴一笑，将你坚挺的[cock]抵在她的唇上，缓慢而温柔地推进。");
         outputText("沙漠女巫大叫出声，她的双手抓住你的手臂，紧紧地压在你的[skindesc]上，而你则缓慢而挑逗地将你的" + get_player().cockDescript(0) + "送入她紧致的深处。你几乎觉得自己像个处男，你的[cock]在跳动，射精的冲动几乎超出了你的控制能力。");
         outputText("你靠在她的胸前，她那巨大的乳房将乳汁喷射到你的胸膛上，似乎你的重量足以让她兴奋到分泌乳汁，如果说你现在的所作所为还不够的话。");
         outputText("你亲吻着沙漠女巫，渐渐习惯了她那令人难以置信的紧致。你前后抽插着，像个初恋的傻瓜一样咧嘴笑着。即使是魅魔也无法与她那丰满的深处相媲美。");
         outputText("你终于认真起来，开始放开手脚操弄沙漠女巫，慢慢加快速度和深度，你们的腹股沟猛烈地拍打在一起，如果是普通人，第二天醒来肯定会青一块紫一块。你猛烈地撞击着沙漠女巫，让她在狂喜中尖叫，她原本就紧致的深处变得像老虎钳一样，你喘息着释放你的欲望，射精并填满她的深处。你的");
         if(get_player().balls >= 2)
         {
            outputText("蛋蛋隐隐作痛，你的");
         }
         outputText("[cock]因渴望而跳动，即使你已经将你的欲望倾泻在被击败的沙漠女巫体内。");
         outputText("[pg]带着满意的傻笑，你躺在你的战利品上，你的" + get_player().cockDescript(0) + "还在她的深处抽搐。沙漠女巫的一只手揉着你的头，挑逗着你的[skindesc]。就像一个充满活力的年轻人一样，你睡着了，[cock]深深地埋在沙漠女巫体内。");
         outputText("你猛地惊醒，却发现沙漠女巫仍然昏倒在你身边。你几乎以为这是一场梦，你温柔地触摸你的腹股沟并轻轻揉捏。有一丝微弱的酸痛感，你想起了你们骨盆猛烈撞击的力度。你起身准备出发。");
         get_player().orgasm("Dick");
         get_combat().cleanupAfterCombat();
      }
      
      public function sandwitchRaped() : void
      {
         spriteSelect(SpriteDb.get_s_sandwich());
         clearOutput();
         if(get_player().isTaur())
         {
            doNext(get_camp().returnToCampUseOneHour);
            sandwitchCentaurBoning();
            get_combat().cleanupAfterCombat();
            return;
         }
         outputText("即使你从她身上撕下沙色的长袍，她的眼睛里也充满了力量和蔑视。她的胸前有四个大乳房，每一个都在沙地上漏出乳汁。");
         if(get_player().get_gender() == 1 || get_player().get_gender() == 3)
         {
            if(get_player().isPureEnough(50))
            {
               outputText("你对沙漠女巫微笑，试图显得迷人。尽管她带着担忧的皱眉，但一丝微小的笑容还是在她的脸上掠过。她向你伸出手，你任由她轻轻地将你拉向她。你惊叹于她多个乳房，每一个都完美地圆润。每一个都有大约两英寸长的乳头，如果你想的话，足够吸吮了。");
               outputText("你的注意力转移到她腿下潮湿的沙子上，她那麝香般的气味扑鼻而来。你要追求哪一个？[pg]");
               menu();
               addButton(0,"乳房",sandwitchBewbs);
               addButton(1,"性爱",get_player().isChild() && get_player().longestCockLength() <= 7 ? sandwitchSexChild : sandwitchSex);
            }
            else
            {
               if(get_player().cockTotal() == 1)
               {
                  if(get_player().hasKnot())
                  {
                     knotSandwitch();
                  }
                  else
                  {
                     get_images().showImage("sandwitch-male-win-hardsex");
                     outputText("你把你的[foot]放在湿沙上，拉着她的头发，让她看着你的眼睛。沙漠女巫对你展示的力量感到震惊，这只会让你更加兴奋。你解开你的[armor]并摸索她的下体，却发现了一个惊喜。她有" + Utils.num2Text(int(get_player().cocks.length) + 1) + "个小穴，而且每一个似乎都是为你量身定做的。把她推倒在地，你把[cock]渗出液体的龟头带到她的一个小穴，慢慢地进入她的深处。");
                     outputText("你深深地挺进，直达底部，当你感觉到你的" + get_player().cockDescript(0) + "的龟头摩擦着她湿滑小穴的尽头时，你惊叹于这种感觉，这只会让你更加渴望她。仿佛在回应你的意志，你的[cock]在长度和粗细上都稍微增长了一点。");
                     outputText("伴随着你满足的欲望低吼，以及沙漠女巫痛苦的尖叫，你突破了她的子宫颈，进入了她的子宫。拔出后，你在她湿润的外阴唇上摩擦，随着沙漠女巫的挣扎，你离高潮越来越近，她的眼睛因为恐惧而睁大，因为她开始明白你拥有比她更强大的力量。");
                     outputText("伴随着野兽般的欲望呼喊，你将肉棒深深地插入她的一个小穴，穿过她的子宫颈，进入她的子宫，在那里你喷射出强效的、堕落的、被恶魔污染的精液。");
                     outputText("[pg]当你将精液深深地播种在她的体内时，沙漠女巫发出了野蛮的拒绝尖叫，毫无疑问，你的堕落让它变得更加强效。你凝视着她的眼睛，陶醉于她恐惧的表情。你一言不发，继续操她，确保你的精液在她的子宫内根深蒂固，感受它在你的[cock]周围飞溅和冒泡。你想知道她是否会记得今天身体感受到的快感，以及她是否更有可能在你面前跪下而不是战斗……");
                     outputText("终于结束了，你将你的" + get_player().cockDescript(0) + "从她被过度使用的裂隙中拔出，你的[cock]即使现在还在滴着精液。你带着微笑走开，对这次小小的邂逅感到满意。");
                     get_player().orgasm("Dick");
                  }
               }
               if(get_player().cockTotal() > 1)
               {
                  get_player().orgasm("Dick");
                  if(Utils.rand(2) == 0)
                  {
                     rapeSandwitchMultis();
                     return;
                  }
                  outputText("利用你血液中的堕落力量，你将[foot]踩在发芽的嫩枝上，将它们从存在中抹去。沙漠女巫对你展示的力量感到震惊，这只会让你更加兴奋。你解开缠腰布，摸索她的下体，却发现了一个惊喜。她有" + Utils.num2Text(int(get_player().cocks.length) + 1) + "个松弛湿润的小穴，每一个似乎都是为你量身定做的。将她推倒在地，你将渗出液体的[cocks]龟头对准她的下体，慢慢地进入她的深处。");
                  outputText("你深深地挺进，直达底部，当你感觉到你的" + get_player().multiCockDescriptLight() + "的龟头摩擦着她湿滑小穴的尽头时，你惊叹于这种感觉，这只会让你更加渴望穿透。仿佛在回应你的意志，你的[cocks]在长度和粗细上都稍微增长了一点。");
                  outputText("伴随着你满足的欲望低吼，以及沙漠女巫痛苦的尖叫，你突破了她的子宫颈，进入了她的子宫。将你的[cocks]龟头从她的子宫中拔出，你在她的小穴外摩擦和发情，随着沙漠女巫的挣扎，你离高潮越来越近，她的眼睛因为恐惧而睁大，因为她开始明白你拥有比她更强大的力量。");
                  outputText("伴随着野兽般的欲望呼喊，你将肉棒深深地插入她的阴道，穿过她的子宫颈，进入她的子宫，在那里你喷射出强效的、堕落的、被恶魔污染的精液。");
                  outputText("[pg]当你将精液深深地播种在她的体内时，沙漠女巫发出了野蛮的拒绝尖叫，毫无疑问，你的堕落让它变得更加强效。你凝视着她的眼睛，陶醉于她恐惧的表情。你一言不发，继续操她，确保你的精液在她的子宫内根深蒂固，感受它在你的[cocks]周围飞溅和冒泡。你想知道她是否会记得今天身体感受到的快感，以及她是否更有可能在你面前跪下而不是战斗……");
                  outputText("终于结束了，你将你的" + get_player().multiCockDescriptLight() + "从她被过度使用的裂隙中拔出，你的[cocks]即使现在还在滴着精液。你带着微笑走开，对这次小小的邂逅感到满意。");
               }
               get_combat().cleanupAfterCombat();
            }
         }
         else
         {
            outputText("你对沙漠女巫微笑，试图显得迷人。尽管她带着担忧的皱眉，但一丝微小的笑容还是在她的脸上掠过。她向你伸出手，你任由她轻轻地将你拉向她。你惊叹于她多个乳房，每一个都完美地圆润。每一个都有大约两英寸长的乳头，如果你想的话，足够吸吮了。");
            outputText("你的注意力转移到她双腿下潮湿的沙子上，她麝香般的气味扑鼻而来。[pg]");
            sandwitchBewbs();
         }
      }
      
      public function sandwitchRape() : void
      {
         var _loc1_:Boolean = false;
         var _loc2_:int = 0;
         var _loc3_:* = null as IMap;
         spriteSelect(SpriteDb.get_s_sandwich());
         get_player().clearStatuses();
         if(get_player().get_lust() >= get_player().maxLust())
         {
            _loc1_ = false;
            if(get_player().biggestTitSize() >= 9 && get_player().biggestLactation() >= 3 && !get_player().isPureEnough(25))
            {
               clearOutput();
               outputText("被体内震动球引起的强烈快感所淹没，你跪倒在地。");
               outputText("[pg]你可怜地呜咽着，绝望地想要高潮，沙漠女巫走近你，轻轻抚摸你的脸。她残忍地笑了笑，让她的手滑落到你的胸前，然后撕开你的上衣，让你巨大的乳房弹出来。这个神秘的女人用力地揉捏它们，让你喘息和扭动，直到她开始轻轻弹击你痛苦坚硬的乳头。你越来越接近高潮，像个妓女一样喘息着，而女巫则用她的手和魔法戏弄你。[pg]");
               outputText("就在你高潮之前，她俯身对你耳语，用温暖的呼吸逗弄你的耳朵：[say: Evals klim ym emoceb llahs uoy.]");
               outputText("[pg]一种熟悉的压力在你的胸腔中积聚，但它比以往任何时候都要强烈得多。你感觉到你的乳房迅速膨胀，乳汁从你的乳头喷出，白色的水滴溅了你和女巫一身。当你高潮时，你翻着白眼，舌头伸了出来，你的心智几乎被那震撼世界的性高潮所摧毁。");
               outputText("[pg]你晕了过去。");
               doNext(sandWitchBadEnd);
               return;
            }
            clearOutput();
            outputText("当你身体的战斗意志蒸发时，你摇晃的双腿在你身下支撑不住了。[pg]");
            if(get_player().hair.color.indexOf("sandy blonde") != -1)
            {
               outputText("沙漠女巫邪恶地笑着，吟唱道：[say: Tresed eht retaw llahs klim ruoy.][pg]");
               if(int(get_player().breastRows.length) == 0 || get_player().biggestTitSize() == 0)
               {
                  outputText("你长出了一对完美的C罩杯乳房！");
                  if(int(get_player().breastRows.length) == 0)
                  {
                     get_player().createBreastRow();
                  }
                  get_player().breastRows[0].breasts = 2;
                  get_player().breastRows[0].breastRating = 3;
                  if(get_player().breastRows[0].nipplesPerBreast < 1)
                  {
                     get_player().breastRows[0].nipplesPerBreast = 1;
                  }
                  dynStats(DynStat.Sens(2),DynStat.Lust(1));
               }
               if(get_player().biggestTitSize() >= 1 && get_player().biggestTitSize() < 3)
               {
                  outputText("你的乳房突然向外膨胀，直到变成完美的C罩杯才停下来。");
                  get_player().breastRows[0].breastRating = 3;
                  dynStats(DynStat.Sens(1),DynStat.Lust(1));
               }
               if(get_player().averageNipplesPerBreast() < 1)
               {
                  outputText("每个乳房上都出现了一个黑点，迅速形成了一个敏感的乳头。");
                  _loc2_ = int(get_player().breastRows.length);
                  while(_loc2_ > 0)
                  {
                     _loc2_--;
                     if(get_player().breastRows[0].nipplesPerBreast < 1)
                     {
                        get_player().nippleLength = 0.2;
                     }
                     get_player().breastRows[0].nipplesPerBreast = 1;
                  }
                  dynStats(DynStat.Sens(2),DynStat.Lust(1));
               }
               if(get_player().biggestLactation() > 0)
               {
                  outputText("你的胸口积聚起一股强烈的压力，痛得厉害。你猛地拉下上衣，这时");
                  if(get_player().biggestLactation() < 2)
                  {
                     outputText("强劲的乳汁从你的乳头喷射而出，化作粗壮的水流喷洒在沙漠上。你在这感觉中呻吟着，挤压着你的乳房，用你的乳汁浇灌着这片被污染的土地。当乳汁停止喷射时，你脸红了，对你增加的产奶量感到非常尴尬。");
                  }
                  if(get_player().biggestLactation() >= 2 && get_player().biggestLactation() <= 2.6)
                  {
                     outputText("乳汁从你的乳头喷涌而出，粗壮的水流四处喷洒。这种液体不断涌出的感觉非常色情，你觉得自己的性欲越来越高涨。当水流减弱时，你开始挤压你的乳房，渴望继续这种快感，但美好的事物终究会结束。");
                  }
                  if(get_player().biggestLactation() > 2.6 && get_player().biggestLactation() < 3)
                  {
                     outputText("粗壮的乳汁从你酸痛的乳头喷涌而出，在沙地上形成水坑。你微笑着，看着自己如此慷慨地喂养着沙漠，乳汁覆盖沙地的速度比它被吸收的速度还要快。持续的泌乳令人愉悦……以一种高度色情的方式，你发现自己不受控制地呻吟着，拉扯着自己的乳头。过了一会儿，你意识到乳汁已经停止了，甚至有时间渗入沙地。你对你奇怪的想法感到惊讶，把手从敏感的乳头上拿开。");
                  }
                  if(get_player().biggestLactation() >= 3)
                  {
                     outputText("你跪倒在地，抓住你的乳头。伴随着非常性感的呻吟，你开始给自己挤奶，喷出大量的乳汁。你喘息着，咕哝着，尽可能多地奉献出你的乳汁。它像小溪一样顺着沙丘倾泻而下，你忍不住因为骄傲……和欲望而脸红。当你尽最大努力用你所有的乳汁喂养沙漠时，色情的快感不断累积。你在高潮的边缘徘徊了很久，到处都是乳汁。当你回过神来时，你意识到自己正跪在那里，拉扯着你干燥的乳头。你尴尬地停了下来，但你的性欲依然存在。");
                  }
                  if(get_player().biggestLactation() < 3)
                  {
                     get_player().boostLactation(0.7);
                     outputText("你的乳房感觉更饱满……更成熟……就像你下一次挤奶可能会更多。");
                  }
                  dynStats(DynStat.Lib(1),DynStat.Sens(4),DynStat.Lust(15));
                  _loc1_ = true;
               }
               if(get_player().biggestLactation() == 0)
               {
                  outputText("一种令人愉悦的释放突然从你的乳头喷发！两股乳汁从你的乳房喷射而出，立刻渗入沙地。它很快就停止了，尽管女巫向你保证你现在可以经常泌乳。");
                  get_player().boostLactation(1);
                  dynStats(DynStat.Lib(0.5),DynStat.Sens(1),DynStat.Lust(10));
               }
               outputText("[pg]女巫在你耳边低语，[say: 我总是能得到我想要的，亲爱的……]");
            }
            else
            {
               outputText("沙漠女巫邪恶地笑着，吟唱道，[say: 漠中赤日灼如沙，沙发缠梦乐无涯——]");
               outputText("[pg]你感觉头皮发麻，意识到你的头发变成了沙金色！");
               get_player().hair.color = "sandy blonde";
               outputText("[pg]女巫在你耳边低语，[say: 我总是能得到我想要的，亲爱的……]");
            }
            outputText("你听到她的长袍落在沙地上的轻柔声音，忍不住偷看了一眼你的俘虏者。你转过身，看到一个曲线优美、深色皮肤的美女，她的身形被四个正在泌乳的乳房所主导。在你被欲望蒙蔽的脑海中，你隐约感觉到上面两个大约是DD罩杯，下面两个大约是C罩杯。她微笑着俯身看着你，猛地把你推倒在地。");
            outputText("[pg]她翻身压在你身上，将她湿滑的蜜壶紧紧贴在你的嘴上。她的气味很浓，强烈得令人难以抗拒。你的舌头伸出来尝了一口，发现了一个充满粘稠甜蜜的宝库。你本能地用舌头操她，贪婪地吞食她的爱液，把舌头尽可能深地伸进去，然后吸吮她的阴蒂。你隐约感觉到乳汁溅在你身上，从你身上溅落到温暖的沙漠沙地上。乳汁触及的每个地方都感觉如丝般光滑和敏感，你的手开始抚摸你的身体，随着女巫喷出越来越多的乳汁，你不断地揉搓着。你忘记了时间，高潮了许多次，浑身都是湿滑粘稠的性液。");
            if(_loc1_)
            {
               get_player().orgasm("Tits");
            }
            else
            {
               get_player().orgasm("Generic");
            }
            get_player().slimeFeed();
            dynStats(DynStat.Lib(1),DynStat.Sens(5));
            _loc3_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc3_,2310,FlagDict_Impl_.arrayReadInt(_loc3_,2310) + 1);
            get_combat().cleanupAfterCombat();
         }
         else
         {
            if(get_player().biggestTitSize() >= 9 && get_player().biggestLactation() >= 3 && !get_player().isPureEnough(25))
            {
               clearOutput();
               outputText("你踉跄着单膝跪地，痛得无法继续战斗。");
               outputText("[pg]当你的视线因疲惫而模糊时，女巫大步向你走来，似乎在沙地上滑行。你的意识开始消退，你看到那个充满异国情调的女人舔了舔嘴唇，残忍地笑了，盯着你丰满的乳房。");
               outputText("[pg]在你昏迷之前听到的最后一件事是一个神秘的咒语，用低沉、沙哑的耳语在你耳边低语：[say: Evals klim ym emoceb llahs uoy.]");
               outputText("[pg]你梦见自己骄傲地走在沙漠中，巨大的双乳随着每一步不知羞耻地晃动，诱惑着年轻性感的勇者用嘴唇包裹住你的乳头并吸吮。你的睡眠变得狂热，因为你的梦变得越来越堕落——你梦见使用黑魔法分泌魅魔乳汁，梦见你以前在英格纳姆的朋友贪婪地喝着你强化的乳汁，直到他们的肚子撑得装不下，然后当一磅又一磅的乳肉突然在他们的胸前膨胀时，他们睁大了眼睛……");
               doNext(sandWitchBadEnd);
               return;
            }
            outputText("[pg]<b>你倒下了，被沙漠女巫打败了！</b>[pg]");
            if(get_player().isChild())
            {
               _loc3_ = KFLAGS.flags;
               FlagDict_Impl_.arrayWriteInt(_loc3_,2687,FlagDict_Impl_.arrayReadInt(_loc3_,2687) + 1);
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2687) >= 5)
               {
                  doNext(childBadEnd);
                  return;
               }
            }
            get_combat().cleanupAfterCombat();
         }
      }
      
      public function sandwitchOverwhelm() : void
      {
         clearOutput();
         outputText("她似乎很享受你的情色能力。尽管她已经被迫屈服，你还是集中精神，引导你的魔法让她陷入更深的性唤起。沙漠女巫的脸因为不断升高的热度变得通红。她也有淫荡的法术，但与你的力量相比就相形见绌了。她呻吟着，双腿间摩擦得更快，拼命想从这种紧张感中找到释放。");
         outputText("[pg]伴随着一声幸福的尖叫，女巫高潮了，在沙地上扭动着。她脸上浮现出深深的羞愧，因为她竟然这么快就在你面前达到了高潮，但她的折磨不会就此停止。你集中精神再次施放法术，她的眼睛睁得大大的。");
         outputText("[pg][say: 不！我受不了了，我还很敏感，]她乞求道。当你再次施法时，女巫开始蜷缩成胎儿的姿势，双手捂着腹股沟一动不动。她的呜咽只会鼓励你继续用情色魔法给她充能。当又一次高潮流过她的身体时，她尖叫着哭泣，尽管她没有主动摩擦，但她的身体还是在颤抖。你再次施放法术。");
         outputText("[pg][say: 天哪，不，我里面要烧起来了！发发慈悲吧！]她惊呼道。她虚弱无力的身体既没有力量也没有意志来反抗你的神秘影响，而你也没有让步。在你压迫性的法术下，她狂野地喘息着，在沙地上颤抖，听起来越来越像一只野兽而不是一个人。她再次高潮了，神志不清，无助地在痛苦中胡言乱语。");
         outputText("[pg]当她最后一次高潮似乎终于结束时，她彻底昏了过去。这是对她企图强奸，或者她可能有的任何其他变态想法的合适惩罚。");
         get_combat().cleanupAfterCombat();
      }
      
      public function sandwitchGetsDildoed() : void
      {
         clearOutput();
         get_images().showImage("sandwitch-u-win-dildoher");
         outputText("你拔出塔玛尼的假阳具，向无助的女巫逼近。当你靠近她时，她的臀部成了一个诱人的目标，而她穿的那件简单的棕色长袍根本无法保护她的身体免受你不同寻常的关注。[pg]");
         outputText("你推开她的双腿，拿起玩具，把它塞进她湿润的小穴里。她大叫起来，在沙丘中大声尖叫，虽然你不确定是因为痛苦还是快乐。无论如何，她现在会三思而后行，不敢再派她的震动石来对付你了。你把假阳具进一步塞进她体内，力度大到足以把她的膝盖从沙子里抬起来。当你把它完全塞进她体内后，她猛地摔了回去，来回扭动着她柔软的屁股，仿佛这能以某种方式减轻快速插入带来的痛苦。[pg]");
         outputText("[say:这不是我想要的，]被击败的女巫哭喊着，但你可以看到她四个乳房下的沙子因湿润而变暗。你把她翻过来，露出她长袍前面湿透、沾满沙子的部分。你粗暴地把它撕下来，露出她那四个闪闪发光、晒黑的球体。她出汗的古铜色皮肤没有被晒痕破坏，她滴着乳汁闪闪发光，仿佛在来到沙漠之前涂了油。[pg]");
         outputText("在给她适应插入的时间后，你开始越来越快地抽插假阳具，看着她那胀满乳汁的乳房前后摇晃。你单手抓住她左下方的乳房用力挤压，感受着柔软的肉体在手中屈服。一股乳汁从她的乳头喷涌而出，其数量和力度让你吃了一惊，不过很快就减弱了。你对这种变态的展示感到高兴，把手移向下一个肿胀的肉团，依次挤压，直到沙漠女巫的身体被白色的乳汁淋满，她那突出的乳头硬得像石头一样。[pg]");
         outputText("你能感觉到玩具开始慢慢膨胀，就像你村子附近海里的一种鱼，为了吓跑捕食者而膨胀。只是这个玩具的膨胀是为了完全不同的目的。女巫的小穴里充满了不断变大的粉红色肉块，她的手移向自己的乳头，协助你进行相当用力的挤奶。她的双腿张得大大的，仿佛这能帮助她缓解撑开小穴的不断增加的压力。她在你身下像发情的母狗一样呻吟扭动，已经开始受到从扭曲的玩具中漏出的催情剂的蛊惑。[pg]");
         outputText("你松开她那过大的乳房，开始用空闲的手玩弄她的阴蒂，同时用另一只手操纵玩具。她大叫起来，开始在你身下挣扎，闪亮的乳头喷涌出大量的乳汁。你感觉到假阳具在你的手中抽搐，它将大量的催情剂注入她的小穴。在它完成之前，你把它拔出来，塞进她第二个被冷落的小穴里，在一个流畅的动作中把它撑得和第一个一样宽，而她因为高潮而神志不清，根本感觉不到。她的眼睛翻白，然后闭上，她的意识完全被强烈的高潮抹去了。[pg]");
         outputText("你摇晃着玩具，享受着占了现在已经失去意识的敌人这么大便宜的感觉。但你还有地方要去，你拔出玩具，");
         if(get_player().cor > 50)
         {
            outputText("把它舔干净，");
         }
         outputText("然后回到营地，你很清楚在经历了如此火辣的遭遇后，你需要缓解一下紧张的情绪。");
         dynStats(DynStat.Lust(20 + get_player().lib / 5 + get_player().cor / 10));
         get_combat().cleanupAfterCombat();
      }
      
      public function sandwitchCentaurBoning() : void
      {
         spriteSelect(SpriteDb.get_s_sandwich());
         get_player().orgasm("Generic");
         outputText("沙漠女巫在你面前喘着粗气，她的衣服凌乱不堪");
         if(get_monster().get_HP() < 1)
         {
            outputText("并且多处破损。");
         }
         else
         {
            outputText("她的手指捏着自己的乳头，情欲已经淹没了她。");
         }
         if(get_player().biggestTitSize() > 3)
         {
            outputText("当你靠近时，她的目光飘向你的" + get_player().allBreastsDescript() + "，她");
            if(get_monster().get_HP() < 1)
            {
               outputText("忍不住慢慢舔了舔嘴唇。");
            }
            else
            {
               outputText("性感地舔了舔她微张的嘴唇。");
            }
         }
         if(get_player().biggestLactation() > 1)
         {
            outputText("当她看到已经从你的[nipples]滴下的乳汁时，她的眼睛睁大了，她的手滑落到双腿之间，开始慢慢自慰。");
         }
         outputText("[pg]");
         if(get_player().cor < 70)
         {
            outputText("你微笑着靠近");
            if(get_player().biggestTitSize() >= 1)
            {
               outputText("；你的[nipples]变得坚挺");
            }
            if(get_player().totalCocks() > 0 && !get_player().hasVagina())
            {
               outputText("并且你的[cock]变硬了。");
            }
            if(get_player().hasVagina() && get_player().totalCocks() == 0)
            {
               outputText("并且你的" + get_player().vaginaDescript(0) + "开始滴下爱液。");
            }
            if(get_player().hasVagina() && get_player().totalCocks() > 0)
            {
               outputText("并且你的[cock]变硬了，同时你的" + get_player().vaginaDescript(0) + "开始滴下爱液。");
            }
            if(get_player().get_gender() == 0)
            {
               outputText("她。");
            }
            outputText("她起初似乎有些犹豫，但很快就走上前来，开始用手抚摸你的肚子和你的[hips]");
            if(get_player().biggestTitSize() >= 1)
            {
               outputText("，眼睛死死盯着你的" + get_player().allBreastsDescript());
            }
            outputText("。[pg]");
            if(SWCentaurMore(3))
            {
               return;
            }
            outputText("[pg]");
            outputText("纤细的双手环抱过来");
            if(get_player().biggestTitSize() >= 1)
            {
               outputText("爱抚你的" + get_player().allBreastsDescript() + "并且");
            }
            outputText("挑逗你的[nipples]，你能感觉到她正把身体贴在你强壮的肩膀上摩擦。");
            outputText("你猛然意识到女巫的宝珠还在你的体内，它突然在你的[assholeorpussy]里开始跳动，让你忍不住叫出声来，加快了穿越沙丘的步伐。");
            outputText("你在奔跑中失去了对时间和地点的感知，只感觉到她一次又一次地在你身上高潮，她的乳汁顺着你的背流下，洒在沙地上。");
            if(get_player().biggestTitSize() >= 1)
            {
               if(get_player().biggestLactation() >= 1)
               {
                  outputText("你自己的[nipples]也在漏奶，");
                  if(get_player().biggestLactation() < 3)
                  {
                     outputText("细流不断涌出");
                  }
                  else
                  {
                     outputText("如洪流般喷涌而出");
                  }
                  outputText("在她熟练的手法下。");
               }
            }
            outputText("你不知怎的能感觉到她的情欲通过她的乳汁渗入你的皮肤，让你充满她自己的感觉，让你的整个身体像一个性爱的音叉一样震动。随着这种感觉变得势不可挡，你感觉自己跌跌撞撞，速度慢了下来，直到最后停了下来。你喘着粗气，听着沙漠女巫在你耳边低语着甜言蜜语……但这些甜言蜜语似乎正在起作用。[pg]");
            if(SWCentaurMore(1))
            {
               return;
            }
         }
         else
         {
            outputText("当看到你脸上的表情时，沙漠女巫回过神来。她迅速爬起来，试图恐惧地逃跑。你咧嘴一笑，轻松地超过了她，绕着她奔跑，把她赶得团团转，偶尔还为了好玩把她撞倒。当她开始慢下来时，你抓住她沙色的长袍，然后");
            if(get_player().get_str() >= 50)
            {
               outputText("轻松地把它们从她身上撕下来。");
            }
            else
            {
               outputText("拖着她走了一段，直到它们脱落。");
            }
            outputText("长袍下面是一具美丽的身体，有四个乳房，即使现在也有乳汁顺着她的胸部和肚子流下。乳汁流过她的腹肌，在流下她那对双胞胎小穴的缝隙时分开。意识到她跑不过你，她终于转过身来，站在原地，用一种夹杂着恐惧和愤怒的眼神盯着你，这只会增加你的欲望。[pg]");
            if(SWCentaurMore(2))
            {
               return;
            }
         }
      }
      
      public function sandwitchBirthsYourMonstrosities() : void
      {
         clearOutput();
         get_images().showImage("sandwitch-give-birth-drider");
         outputText("感觉过了好久好久，你终于到了营地边缘，在边界外停下，把沙漠女巫放在凉爽的泥土上。[say:它-它们来了！]她大叫一声，然后痛苦地皱起眉头。她张开双腿，终于放松下来，让分娩过程不受阻碍地继续，绿色的粘液慢慢从她体内流出，这是分娩的明显迹象。当分娩液从她体内流出时，她脸上痛苦的表情突然变得欣喜若狂，这液体在过程中起到了麻醉剂和催情剂的作用。没过多久，你刚孵出的孩子们就从母亲的身体里出来了，身上覆盖着各种液体。它们一个接一个地跑出来，对这个它们终于进入的陌生新世界感到惊讶和敬畏。但这很快就变成了饥饿；孩子们显然因为整个折磨而又渴又饿。你们结合的结晶爬上母亲的身体，迅速爬上沙漠女巫的两对乳房，尽量减少为了争夺喂食权而发生的内斗。");
         outputText("[pg]沙漠女巫终于松了一口气，她靠在草地上微笑着，为自己能经历如此快乐的体验而欢欣鼓舞。她向所有能听到的人哼唱着她的幸福，享受着这短暂的母亲时光，而你的孩子们则喝得饱饱的，摇摇晃晃地跑开了，毫无疑问是去了沼泽。");
         outputText("[pg]当你转向施法者时，她向你投来感激的目光……甚至有些渴望。[say:谢谢你。也许……我们什么时候可以再试一次？]她询问道，声音里充满了希望能再次见到你的期盼。");
         outputText("[pg]你没有排除任何可能性；几乎可以肯定她总有一天会再碰到你……但也许下次她可以跳过施法的环节？响亮的呼噜声划破空气作为回应，让你叹了口气。毫无疑问，她的折磨令人筋疲力尽。你弯下腰，");
         if(get_player().cor < 60)
         {
            outputText("，在她的嘴唇上快速地吻了一下");
         }
         outputText("，在她耳边低语，说你会再见到她的……");
         if(get_player().cor >= 60)
         {
            outputText("[pg][say:下次，用点常识吧。]");
         }
         pregnancy.knockUpForce();
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function sandwitchBewbs() : void
      {
         spriteSelect(SpriteDb.get_s_sandwich());
         clearOutput();
         get_images().showImage("sandwitch-male-win-kiss-suckherbreast");
         outputText("你移动到被击败的沙漠女巫身上，将嘴唇贴在她的乳房上。当第一滴奶水接触到你的舌头时，你饥渴地、迫切地、贪婪地喝了起来。你摸索并按摩她的乳房，她向后靠去并大声叫喊，惊讶地睁大了眼睛。你大口喝着她甜美的乳汁，当你喝下原本打算给沙漠沙子的雪白水流时，你身下的小幼苗似乎在沙沙作响并移动。");
         outputText("温暖填满了你贪婪的肚子，沙漠女巫将一只手放在你的肚子上，当你从她的乳房喝奶时轻轻地摩擦它，当你喝完一个时就换另一个。");
         outputText("你打了个嗝，脸涨得通红，但沙漠女巫将一只手放在你的脸上，靠近你，甜蜜地亲吻你的嘴唇。她的舌头滑出并潜入你的嘴里。她将你的脸拉向她，将她的乳房摩擦你的胸部。你能感觉到新鲜的奶水滴在你的[skindesc]上，这种气味让你因欲望而发狂。");
         outputText("她结束了亲吻，对你微笑，低声耳语。当你变得昏昏欲睡时，你的眼睛慢慢闭上；你意识到得太晚了，她正在施法。你睡着了，沙漠女巫的奶水在你的肚子里翻腾、咕噜作响。");
         outputText("你在沙漠中醒来，立刻抓住自己的身体，看看是否有任何变化……");
         get_player().slimeFeed();
         get_player().refillHunger(35);
         dynStats(DynStat.Lust(25));
         get_combat().cleanupAfterCombat();
         outputText("[pg]");
      }
      
      public function sandWitchBadEndPartTwo() : void
      {
         clearOutput();
         outputText("伴随着清晰的咕噜声，你的乳房开始充满大量的乳汁。当你感觉到你的乳房在肿胀、充盈、膨胀到极限时，你惊讶地睁大了眼睛。这感觉令人震惊地愉悦，而且不知为何几乎是对的，就像你注定要拥有这些大得可耻、充满乳汁的乳房一样。当你看着柔软的肉被拉紧时，你的乳房在你身下变得非常圆润，而那种愉悦的感觉变成了一种痛苦的紧迫感。[pg]");
         outputText("有一瞬间什么也没发生，你惊讶地发现你的乳头没有漏奶。沙漠女巫对你笑了笑，倾身将手臂和下巴靠在你那过度紧张的乳房上，说道：[say: 请求被挤奶，奴隶。]你惊恐地摇了摇头，然后咬紧牙关呻吟起来，因为你意识到胸口的压力仍在增加，变得难以忍受。女巫耐心地重复着她的话，直视着你的眼睛，你被一个可怕的认知击中了：你很可能永远被困在这里了。");
         doNext(sandWitchBadEndPartThree);
      }
      
      public function sandWitchBadEndPartThree() : void
      {
         clearOutput();
         outputText("你灵魂深处的某种东西破碎了，伴随着一声压抑的抽泣。屈辱的泪水顺着你的脸颊流下，你微微张开颤抖的双唇。[say: 请给我挤奶，女主人。你的奴隶需要被挤奶。][pg]");
         if(get_player().hasPerk(PerkLib.MarblesMilk))
         {
            outputText("你话音刚落，一股乳汁就从你的每个乳头喷涌而出，但效果并不像以前那么令人愉悦；事实上，你开始感到非常虚弱。沙漠女巫困惑地看着你，因为从你巨大乳房中喷出的乳汁很快就变慢了，你的乳房也开始萎缩。[pg]");
            outputText("你试图弄清楚为什么你感觉如此虚弱，你回想了一下可能导致这种情况的原因。你上次喝玛布尔的奶是什么时候？感觉到你的身体开始枯萎，你恍然大悟。当世界开始变暗时，你对着你的俘虏轻声轻笑；看来你将是笑到最后的人……[pg]");
            outputText("你听到的最后一件事是沙漠女巫的尖叫，[say: 到底发生了什么？我总是能得到我想要的！]");
         }
         else
         {
            outputText("你话音刚落，一股巨大的乳汁就从你的每个乳头喷涌而出。在疼痛的突然减轻和乳头的敏感之间，你几乎立刻就高潮了，发出了一声巨大的如释重负的呻吟。当你能再次集中视线时，你看到沙漠女巫……你的新女主人……正慵懒地在盆里洗澡，在你的新鲜母乳池里放松。[pg]");
            outputText("这位皮肤黝黑的女巫与你目光相遇，微笑着，这次比以前更温暖了。[say: 看？如果你服从你的女主人，你会更享受自己。毕竟，我<b>总是</b>能得到我想要的……]");
            outputText("[pg]尽管你很不情愿承认，但你意识到她是对的。你被困在这里，趴在你那肿胀的胸部上，任凭这个变态施法者摆布。她有的是时间来训练你，在乳房过度充盈的痛苦和被排空的性高潮的喜悦之间，她不需要很长时间就能把你变成一个完全顺从，甚至渴望的奶奴……");
         }
         get_game().gameOver();
      }
      
      public function sandWitchBadEnd() : void
      {
         clearOutput();
         outputText("你在一个点着蜡烛的石头神殿里醒来，赤身裸体地趴在一些温暖舒适的抱枕上。回想起与女巫的战斗，你急忙试图起身，却因为胸口传来的沉重痛感而倒吸一口凉气。你低头寻找重量的来源，震惊地眨了眨眼，随后努力压抑住不断上升的恐慌——你躺着的“抱枕”竟然是你自己的乳房，它们肿胀得如此巨大，以至于你根本无法将它们抬起！[pg]");
         outputText("[say: 你好，我美丽的宠物，]一个熟悉的声音说道。你向前看去——并努力不去注意占据你下半视野的那片广阔的乳沟——你看到沙漠女巫赤身裸体地坐在你正前方地板上的一个大花岗岩盆里。当她看到你的眼睛如何避开你那大得惊人的胸部时，她得意地笑了。[pg]");
         outputText("[say: 怎么了？你不喜欢它们吗？]女巫向你倾身，粗暴地拉扯着你那巨大的乳头，让你又惊又喜地叫出声来。[say: 恐怕太糟糕了。你把自己献给了我，现在你是我的了，全都是我的，永远都是。]她慢慢地用手抚摸着你那巨大的胸部，当你扭动身体、咬着嘴唇时，她赞许地低吟着。[say: 嗯，是的……首先，你要给我洗个澡。]");
         outputText("[pg]你还没来得及想明白她是什么意思，胸口就传来一阵熟悉的、极其强烈的压力……");
         doNext(sandWitchBadEndPartTwo);
      }
      
      public function sammitchBirthsDriders() : void
      {
         clearOutput();
         outputText("当你在炎热的沙漠中艰难地跋涉时，一声微弱的嚎叫传到了你的耳朵里。你好奇地停下来倾听，试图找到声音的潜在来源。然而，你真正能听到的只有风吹过被沙子侵蚀的荒凉地形的声音，这让你耸耸肩，继续你愉快的旅程。");
         outputText("[pg]也就是说，直到另一声嚎叫传到你的耳朵里；比以前大得多。仔细一想，那风的嚎叫声听起来完全不是那么回事；你猜测附近有人，而且可能处于困境中……或者在性爱的高潮中，因为在这个地方谁知道呢？");
         outputText("[pg]你尽力在轻微的沙尘暴中寻找哭声，朝着你听到声音的大致方向出发。当沙子吹进你的眼睛时，你努力看清你要去的地方，你碰巧偶然发现了一个俯卧的沙漠旅行者；从他们的体型来看，这个旅行者绝对是女性……而且显然怀孕了！");
         if(get_player().cor < 50)
         {
            outputText("打算帮忙");
         }
         else
         {
            outputText("好奇");
         }
         outputText("，你顺着沙丘滑下，停在这位痛苦的女人身边。然而，看清她的脸后，你意识到这就是那个曾和你翻云覆雨的沙漠女巫！");
         outputText("[pg][say: 别、别过来！我现在没法——是你！我真没想到在咱们的小宝贝降生前还能再见到你！]这位疲惫的女巫承认道，看到你让她松了一大口气。你点头致意，盯着她高高隆起的肚子。");
         outputText("[pg][say: 我本来想回集会所的，但是……大自然有别的安排……]她虚弱地开着玩笑，随后明显因为疼痛而弯下了腰。[say: ……它们要出来了！我没法走到合适的地方生孩子了！求求你，帮帮我！]");
         outputText("[pg]你可以猜到，如果没有帮助，她在这种恶劣气候下生出的孩子肯定会枯萎而死。");
         if(get_player().isPureEnough(60))
         {
            helpZeWithBirfBabies();
         }
         else
         {
            reluctantlyHelpZeWitch();
         }
      }
      
      public function reluctantlyHelpZeWitch() : void
      {
         outputText("[pg]太棒了。在所有你能做的事情中，你偏偏被困在这里帮这个笨蛋。你现在完全不明白她为什么不待在家里或者去沼泽——你抱怨着自己的倒霉，一边扶着怀着你孩子的女人站起来。");
         if(!get_player().isDrider())
         {
            outputText("[pg][say: 你、你这几天到底对自己做了什么？]沙漠女巫脱口而出，注意到了自从你们结合后你外貌的变化。然而，她接下来的话被打断了，因为她痛得弯下了腰。好吧，反正你也不需要一个长着四个奶子和好几个小穴的女人的废话。");
         }
         if(get_player().isDrider() || get_player().isTaur())
         {
            outputText("[pg][say: 我、我站不起来了，太痛了！]她大声哭喊，绝望地认为自己无法及时赶到安全的地方，你们的孩子将会在同一天出生并死在这里。你对她缺乏常识感到恼火，告诉她趴到你的背上，然后俯下身子让她爬上来。");
            outputText("[pg][say: 拜托，别太快！]她大声喊道，显然在尽力不让你们情欲的结晶现在就生出来。如果她真的在这里生下孩子，你绝对会气疯的；当你的手臂够不到的时候，清理身体的某些部位简直是场噩梦！你站起身，试图回想该往哪个方向走，却意识到自己迷路了。更棒的是——好吧，其实这根本不重要。你集中精神想着营地，大喊着让沙漠女巫抓紧，然后");
            if(get_player().isDrider())
            {
               outputText("飞奔");
            }
            else
            {
               outputText("疾驰");
            }
            outputText("穿过干燥的沙漠之海……");
         }
         else
         {
            outputText("[pg]你把一只手伸进她的腋下，给她提供在滚烫的沙漠上蹒跚前行所需的支撑。不过，该往哪个方向走让你有些犯愁；你现在根本不知道自己在哪儿。你只能做出唯一的选择，集中注意力想着营地。脑海中有了个大致的画面后，你告诉沙漠女巫抓紧，然后你们俩慢慢地穿过干燥的沙漠之海……");
         }
         doNext(sandwitchBirthsYourMonstrosities);
      }
      
      public function refuseSandWitchMagic() : void
      {
         spriteSelect(SpriteDb.get_s_sandwich());
         clearOutput();
         outputText("伴随着一声愤怒的尖叫，沙漠女巫发起了攻击！");
         startCombat(new SandWitch());
      }
      
      public function rapeSandwitchMultis() : void
      {
         spriteSelect(SpriteDb.get_s_sandwich());
         clearOutput();
         get_images().showImage("sandwitch-male-win-multidick-vagsex");
         outputText("随着这个领域的腐化在你无耻的静脉中舒适地跳动，你感觉到你的思想向新的可能性敞开。尽管当你捣入沙漠女巫时，她多个小穴的湿滑完美贴合，以及她随着你巨大阴茎的每一次抽插而呻吟的方式，你觉得她体内还有一些更深层次的快感小巷有待探索。长期习惯于肉体上的快感，这会让你早期、更纯洁的自我失去知觉，你的思绪回到了女巫的欲望武器，那块振动的快感之石。你觉得是时候让她尝尝自己的苦果了。[pg]");
         outputText("当你强暴这个被羞辱和呜咽的女巫时，你邪恶地对她咧嘴一笑。当你稳步地捣入她湿透的小穴时，她不由自主地喘息着，她看起来很害怕，不知道你欢乐的来源。很快就变得很清楚了。当她听到自己那块腐化的快感之石发出低沉的嗡嗡声时，她挣扎了一下，当你把这个持久的小护身符推入她紧致但被精液充分润滑的屁股时，她开始反抗和挣扎。石头在她体内振动的感觉传遍了你的阴茎，当她被多种方式侵犯而收紧和痉挛时，增强了快感。很快，它就给你带来了一次喷涌的高潮。当你最终从麻烦的沙漠女巫体内拔出时，你向她渗出乳汁的身体吐了口唾沫，然后离开了。");
         get_player().orgasm("Dick");
         get_combat().cleanupAfterCombat();
      }
      
      public function ovipositSandWitches() : void
      {
         clearOutput();
         outputText("当你低头看着");
         if(get_monster().get_HP() < 1)
         {
            outputText("伤痕累累的");
         }
         else
         {
            outputText("充满欲望的");
         }
         outputText("沙漠女巫，你感觉到下体传来熟悉的性唤起。然而，你目前的……情况提供了一个绝佳的机会，可以通过使用你的“另一个”性器官来缓解一些紧张。你期待地舔了舔嘴唇，将自己降到那个固执的施法者身上，她立刻做出了反应");
         if(get_monster().get_HP() < 1)
         {
            outputText("惊恐地大叫着想要逃跑。");
         }
         else
         {
            outputText("带着不安的好奇心想看看你到底有什么计划。");
         }
         if(get_monster().get_HP() < 1)
         {
            outputText("[pg]你翻了个白眼，向被击败的女巫伸出同情之手，向她表明你不想再伤害她，你心里有更……令人愉悦的想法。");
         }
         outputText("沙漠女巫停了下来，评估着你的意图，当你脱下衣服，把你的[armor]扔到一边，露出你的");
         if(get_player().hasCock())
         {
            outputText("坚硬的[cocks]");
         }
         if(get_player().get_gender() == 3)
         {
            outputText("和");
         }
         if(get_player().hasVagina())
         {
            outputText(get_player().clitDescript());
         }
         outputText("供她观赏。当你这样做时，你提出了一个非常有说服力的非敌对论点，沙漠女巫终于让步了，脱下她的斗篷，露出她那四个乳房，");
         if(get_player().totalCocks() > 1)
         {
            outputText(Utils.num2Text(get_player().cockTotal() + 1));
         }
         else
         {
            outputText("两");
         }
         outputText("性特征的身体，让阳光在赤裸的肌肤上闪烁。");
         outputText("[pg]靠近俯卧的女人，你能看到她强烈的欲望在娇嫩的私处积聚；但你也能清楚地看到她残留的警惕，毫无疑问，她听说过");
         if(get_player().canOvipositBee())
         {
            outputText("蜂人");
         }
         else
         {
            outputText("蛛化精灵");
         }
         outputText("会对伴侣做些什么，不确定这是否真的是她想要的。可怜的女孩似乎需要一点“鼓励”……当然，如果你真的想的话，你也可以直接跳过这一切。");
         menu();
         addButton(0,"前戏",eggwitchForeplay);
         addButton(1,"直接开干",getToFuckingWithZeEggsInWitch);
      }
      
      public function missingoSex6() : void
      {
         spriteSelect(SpriteDb.get_s_sandwich());
         get_player().orgasm("Generic");
         get_combat().cleanupAfterCombat();
         hideUpDown();
         statScreenRefresh();
         clearOutput();
         outputText("你成功恢复了游戏。一切完好无损。至少，你是这么认为的。你一定是在哪里弄错了密码，但奇怪的是，唯一的区别是时钟拨快了一个小时，而且你的口袋里多了一些宝石和经验值。[pg]");
         outputText("这简直就像他妈的Christmas一样。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function missingoSex5() : void
      {
         spriteSelect(SpriteDb.get_s_sandwich());
         clearOutput();
         outputText("去他妈的，这什么鬼。说真的。你紧紧握住手柄，勉强压抑着怒火，努力克制着把它扔过房间的冲动。你花了一点时间平复心情，然后测试了一下游戏。是的，现在按键完全没反应了。这该死的东西又死机了。[pg]");
         outputText("你无奈地叹了口气，切断了超级芬天堂的电源。拔出《勇者的堕落》卡带并检查是否有损坏后，你把它翻过来，对着开口处吹了几下。清脆、干净的吹气，从一端吹到另一端。彻底。专业。这些游戏应该为你成为它们的主人而感到自豪。[pg]");
         outputText("你掀开小恶魔头形状的芬天堂上那个塑料小软呢帽，露出卡带插槽看了看。似乎没什么问题。为了保险起见，你又呼哧呼哧地吹了吹灰尘。这台主机只支持一款游戏就已经够糟了，而且每次开发者对游戏做出一两个微小的改动，你还得跑去商店买一份新的。但上一幕里那些崩溃和糟糕的对话是怎么回事？你甚至会觉得有些编剧根本就不想干了。[pg]");
         get_images().showImage("coc-title");
         outputText("系统启动了，伴随着你所期待的这台8位机发出的熟悉的滴滴嘟嘟声。到目前为止一切顺利。《勇者的堕落》标题画面弹了出来，一个像素化的小恶魔正用双手和身体上突出的某个东西热情地向玩家挥手。CoC的主题曲响了起来，你暗自微笑。妈的，这主题曲真是太洗脑了。你敢打赌，这曲子会在你脑子里萦绕一整天，但至少你在自慰的时候有东西可以哼哼了。[pg]");
         outputText("哦，该死。你记起之前的进度已经丢失了，现在你必须从头开始。你忍不住翻了个白眼，呻吟了一声，虽然你还不至于气到把手柄砸穿电视屏幕。但是嘿！至少你还算聪明，记下了勇者密码。也许有一天，电子游戏会变得足够复杂，拥有某种内部存储进度的方法，但至少有了这个，你应该能找回你所有的旧东西！");
         menu();
         addButton(0,"恢复",missingoSex6);
      }
      
      public function missingoSex4() : void
      {
         spriteSelect(SpriteDb.get_s_sandwich());
         clearOutput();
         get_images().showImage("sandwitch-silly-missingosex");
         outputText("_oo_o@_oo, ooo %o-+. oo@-@@oo, ooo o_oo o_o\'o oooo @_oo _ oo_ooo_o. oo_ oo o_oo o-oo o_ ooo_ooo _o ooo oo_o,\',, o@^@oooooo o@oo, #ooo _oo o-oo o_ooo. o_oo oo- ooo\'o oo|o oo_oo_ oo oo oooo! o_oo-o*))o oooo ooo_o, oo@o@oo o( ooo oo_o, oo_oo_o_o oo- oo^o ooo@ o @ ooo@o ooo -oooo. ooo ooooo oo oo!2!o!o, oo_oo_ o?oo oo o_oo oo oo_o o_ooo_o oooo o_o o_ooo. @oo @oo@ ooo_oo oo_o oo oooo, ooo@o o@_o_o oo_oo_oo_, ^oo oooo oo$ooo o--o oo. o_o oo_ooo_oo oo@ooooo@o ooo-oo oo ooo o_ooo, l@o_oo@ oo o_ooo o_o o_o_.[pg]");
         outputText("\"@ @o@\'o o@ooo^o o_o o@oo _ooo_ oo_o.\" o@o oo_o @?oo o )_=o. \"oo_\'oo @oo(o oo o_o o_o oo ooo o))oo o& o_o_ooo_ooooo ooo_oo ^& oo_ oo-_o o@oo o@.\"[pg]");
         outputText("\"@_o@_...\" o_o oooo, ##o@%7o @o oo_ o_@_o. \"o_@ o_o\'o @o_ (ooo o=o( oo_ @o_ _o_@ o_@oo...\"");
         menu();
         addButton(0,"去他的！",missingoSex5);
      }
      
      public function missingoSex3() : void
      {
         spriteSelect(SpriteDb.get_s_sandwich());
         clearOutput();
         get_images().showImage("sandwitch-silly-missingosex");
         outputText("自然，你失败了。老实说，她的洞承受不了这样的捣弄。你可以通过看着她俯卧、脆弱的身体看出来，她已经准备好接受你的虐待了。你的臀部甚至不足以做到这一点！你的臀部没能够着，落在了沙地上，溅起一阵沙子打在她的身上。她惊讶地喘着气，勉强没让沙子进到嘴里。她的乳房也没好到哪去，被厚厚地盖了一层，她的奶水和沙子混在了一起。由此产生的混合物粘在她的胸前，弄得一团糟。[pg]");
         outputText("“我真不敢相信你刚才居然试了那个。”她气呼呼地说。“如果你继续这样下去，你会在各种不舒服的地方弄进沙子的。”[pg]");
         outputText("“不过……”她狡黠地看着你说。“你为什么不退后一点，再试一次呢……”[pg]");
         menu();
         addButton(0,"下一步",missingoSex4);
      }
      
      public function missingoSex2() : void
      {
         spriteSelect(SpriteDb.get_s_sandwich());
         clearOutput();
         get_images().showImage("sandwitch-silly-missingosex");
         outputText("自然，你失败了。老实说，她的洞承受不了这样的捣弄。你可以通过看着她俯卧、脆弱的身体看出来，她已经准备好接受你的虐待了。你的臀部甚至不足以做到这一点！你的臀部没能够着，落在了沙地上，溅起一阵沙子打在她的身上。她惊讶地喘着气，勉强没让沙子进到嘴里。她的乳房也没好到哪去，被厚厚地盖了一层，她的奶水和沙子混在了一起。由此产生的混合物粘在她的胸前，弄得一团糟。[pg]");
         outputText("“我真不敢相信你刚才居然试了那个。”她气呼呼地说。“如果你继续这样下去，你会在各种不舒服的地方弄进沙子的。”[pg]");
         outputText("\"不过……\"她狡黠地看着你说道，\"你为什么不退回去再试一次呢……\"");
         menu();
         addButton(0,"下一步",missingoSex3);
      }
      
      public function missingoSex() : void
      {
         spriteSelect(SpriteDb.get_s_sandwich());
         clearOutput();
         get_images().showImage("sandwitch-silly-missingosex");
         outputText("你骄傲地走向你最新的战利品，那个趴着的女巫用一种纯粹而令人愉悦的无助眼神盯着你。她四肢着地向后退去，但你嘴里吐出的一个简单的“停下”就足以让她僵在原地。你低头看着她，你的\" + player.multiCockDescript(0) + \"在你的衣服里跳动。什么衣服？哦，就是那些你正从身上撕下来的衣服，这让她非常沮丧。[pg]");
         outputText("很明显，这个婊子需要肉棒。而你正是那个能给她肉棒的勇者。你舔了舔嘴唇，跪了下来，抓住她的腿，强行将它们分开。低头看去，你发现她的身体已经为你准备好了，她暴露的肉洞微微撅起，湿润无比。你忍不住对这种情况大笑起来，当你因笑声而抽搐时，你的\" + player.multiCockDescript(0) + \"在空气中弹跳。她的抵抗只会让你更加兴奋，让你在占有那个极品屁股之前好好品味一番。[pg]");
         outputText("你想让她更加难堪，在她曾经自认为是她领地的沙地上彻底羞辱她。你把她的长袍撕成碎片，露出她那四只丰满的乳房。你的目光追随着她滴着奶水的乳头，瞳孔也随之跳动。[say: 你-你打算干什么？强暴我？！]女巫哭喊着，语气中既有恐惧又带着期盼。她的大腿试图合拢，不过你确信这更多是为了摩擦它们，而不是为了保全她的贞洁。你俯下身，张开嘴，让你的舌头舔舐她肿胀的阴蒂。她弓起背，呻吟着，尽可能地把臀部推向你。[pg]");
         outputText("现在是时候了。但是不行，她得不到你的肉棒。她还没资格得到肉棒。她甚至还不配享受你的" + get_player().vaginaDescript(0) + "。不，不，不，你需要先让那个骚穴热热身。你吹了声口哨引起她的注意，同时，你把你的臀部翘起来对着她。她睁大了眼睛，下巴都掉下来了。“不-不要……不要全塞进去。”你点点头回应她的恳求。“全塞进去？！”[pg]");
         outputText("现在她开始恐慌了。当你向后拉开你的臀部，并把它们推向她张开的穴口时，她拼命地摇头……");
         outputText("[pg]<b>别把这个当成bug报告，好吗，老兄？</b>");
         menu();
         addButton(0,"下一步",missingoSex2);
      }
      
      public function laySomeEggsInThatWitchFinally() : void
      {
         clearOutput();
         var _loc1_:Boolean = Utils.rand(2) == 0;
         if(get_player().canOvipositBee())
         {
            get_images().showImage("sandwitch-u-lay-beeegg");
         }
         else
         {
            get_images().showImage("sandwitch-u-lay-drideregg");
         }
         outputText("没过多久，想要完成这一行为的强烈需求变得太过清晰而无法忽视，伴随着满意的哼声，你终于将产卵管钻进了她紧致的");
         if(_loc1_)
         {
            outputText("阴户褶皱中");
         }
         else
         {
            outputText("肛门环中");
         }
         outputText("。就像发烧时的梦境一样，你挥舞的奇异附肢越来越深地钻进她的");
         if(_loc1_)
         {
            outputText("私处");
         }
         else
         {
            outputText("屁股");
         }
         outputText("，那");
         if(_loc1_)
         {
            outputText("小穴的罗纹轮廓");
         }
         else
         {
            outputText("内脏的紧密贴合");
         }
         outputText("随着每一英寸的深入，都让你的产卵管沉醉其中。你开始润滑焦躁不安的女巫的");
         if(_loc1_)
         {
            outputText("爱-");
         }
         else
         {
            outputText("肛门");
         }
         outputText("通道，以便产下你的后代；女巫几乎无法抑制她的呻吟，被如此火热、湿润的物质填满让她感到无比的欢愉。在变态的愉悦中，沙漠女巫在亲吻间娇喘，她的呻吟暴露了她想要探索这种交配方式究竟能有多么令人愉悦的好奇心。");
         outputText("[pg]深入她体内的过程不可避免地慢了下来，因为越来越难以推进，需要腾出空间以便进一步插入的感觉变得非常明显。在一种充满幸福感的欢迎侵犯中，沙漠女巫乞求你更深入，直到你们的性器官真正交织在一起。在几声充满呻吟的片刻之后，你的产卵管终于到达了目的地，挤进了");
         if(_loc1_)
         {
            outputText("你爱人子宫颈的开口");
         }
         else
         {
            outputText("她括约肌的最深处");
         }
         outputText("。输卵管与");
         if(_loc1_)
         {
            outputText("子宫");
         }
         else
         {
            outputText("肛门");
         }
         outputText("的连接现在已经完成，你准备好迎接你那奇异的附肢不可避免的高潮痉挛，低头对着沙漠女巫咧嘴一笑，那笑容只能传达出一个信息：好戏即将开始。伴随着突然而猛烈的震颤，你的产卵管随着第一批卵的到来而隆隆作响，将你未出生的后代挤下你的肉棒，推向");
         if(_loc1_)
         {
            outputText("沙漠女巫阴道那等待着的嘴唇");
         }
         else
         {
            outputText("穿过她的直肠壁");
         }
         outputText("。伴随着一丝不苟的推挤，你后代的先锋成功地潜入了她的通道，随着每一次痉挛，勇敢地向她的深处进发。");
         outputText("[pg][say:哦，天哪！]女巫大叫起来，双腿紧紧缠住你，随着卵向上移动而呻吟。当你的后代的卵壳滑过她的内环时，安静的幸福娇喘变得响亮起来，你的伴侣的肌肉紧紧地夹住你的产卵管，仿佛她试图榨干你附肢的所有价值。伴随着低沉的咕噜声，卵到达了目标并滑入");
         if(_loc1_)
         {
            outputText("她等待着的子宫");
         }
         else
         {
            outputText("你能安全塞入的最深处");
         }
         outputText("，安稳地依偎着，直到生命的争夺战开始。");
         outputText("[pg][say:更多……给我更多……]沙漠女巫呜咽着，抚摸着你的");
         if(get_player().canOvipositBee() && !get_player().isTaur())
         {
            outputText("躯干");
         }
         else
         {
            outputText("骨盆");
         }
         outputText("来激励你。当然，你满足她的愿望没有任何问题；你那跳动的性器官被冷落");
         if(get_player().cockTotal() > 1 || get_player().get_gender() > 2)
         {
            outputText("es");
         }
         outputText("是你唯一不满意的地方，当你");
         if(get_player().hasCock())
         {
            outputText("抓住你的[cocks]并把它");
         }
         else
         {
            outputText("把你的" + get_player().vaginaDescript(0));
         }
         outputText("凑到她面前时，你清楚地表达了这一点。她半眯着眼睛的可爱凝视变成了嘴唇向你下体的猛扑，这个沙漠女巫像被附身了一样，努力地想要开始下一批……");
         outputText("[pg]你坐在柔软的女巫身上，感觉像过了一个世纪，让她照顾你的下体");
         if(get_player().cockTotal() > 1 || get_player().get_gender() == 3)
         {
            outputText("es");
         }
         outputText("，同时你慢慢地把卵注满她的身体，她那少女般娇小的呻吟声在你的身体里回荡，她用嘴刺激着你的");
         if(get_player().hasCock())
         {
            outputText(get_player().multiCockDescriptLight());
         }
         if(get_player().get_gender() == 3)
         {
            outputText("和");
         }
         if(get_player().hasVagina())
         {
            outputText("你的" + get_player().vaginaDescript(0));
         }
         outputText("。最后，她热情的努力让你得到了更“传统”的释放，涂抹了");
         var _loc2_:int = Utils.rand(2);
         if(_loc2_ == 0)
         {
            outputText("她的面部特征，证明了你的高潮");
         }
         else if(_loc2_ == 1)
         {
            outputText("她的口腔内部，伴随着你滚烫的精液");
         }
         outputText("。终于释放了，而且卵子也用光了，你伴随着一声响亮的“啵”声，将自己从沙漠女人身上拔了出来，那");
         if(get_player().canOvipositBee())
         {
            outputText("像蜂蜜一样的");
         }
         else
         {
            outputText("黏糊糊的");
         }
         outputText("润滑液在你亲密的塞子离开后从她体内流出。沙漠女巫完全被淹没并筋疲力尽，只能在沙漠烈日明亮、灼热的注视下积蓄力量。你对自己笑了笑，开始重新穿上你丢弃的[armor]，在离开时说你期待下一次相遇；女巫一定同意这个观点，因为她虚弱地向你挥手，用双臂抱着肚子，一想到怀着你的孩子就充满了母性的喜悦。");
         if(get_player().fertilizedEggs() > 0)
         {
            if(get_player().canOvipositBee())
            {
               pregnancy.knockUpForce(26,192);
            }
            else
            {
               pregnancy.knockUpForce(15,192);
            }
         }
         get_player().dumpEggs();
         get_player().orgasm("Ovi");
         get_combat().cleanupAfterCombat();
      }
      
      public function knotSandwitch() : void
      {
         spriteSelect(SpriteDb.get_s_sandwich());
         clearOutput();
         get_images().showImage("sandwitch-male-win-dogcock-vagsex");
         outputText("你将[cock]的顶端抵在她芬芳花朵的入口处。多亏了你阴茎上已经滴落的先列腺液，它滑了进去，她湿滑的褶皱触感让你爽得翻白眼。你忍不住突然将[cock]整根刺入她的体内，当[cockhead]顶在她的子宫颈上时，你呻吟出声。[pg]");
         outputText("当你的[cock]在她体内搅动时，她开始向后推，她天鹅绒般的肉壁紧紧地夹住你，让你能更深入一点。她拔出来，然后再次捣入，你[knotword]撑开她的力量让她发出一声闷哼。你的睾丸来回摆动，以一种美妙的方式拍打和弹跳在她的屁股上。你能感觉到高潮的开端在你的下体中酝酿，通过你[cock]的顶端跳动。随着快感的增加，你的身体准备好喷发，你的[knotword]开始膨胀。");
         outputText("你开始以疯狂的速度向她挺进，你身体释放的需要成为了你的动力。起初，你[knotword]的膨胀是一种额外的感觉，一种美妙的紧致感，因为纯粹的刺激迫使越来越多的血液进入其中。[pg]");
         outputText("然后它开始碍事，阻止你的长度完全进入，导致你[cock]尖锐的[cockhead]渴望她小穴中无法触及的深处。你用力顶入，感觉到[knotword]被挤压进去，在她痉挛的小穴中用温暖湿润的快感压垮你，只有在你拔出时才释放。随着它继续膨胀，你再也无法将你的阴茎完全插入她体内，你充满精液的[knotword]膨胀得超出了她的容量。你的欲望几乎达到了顶峰；触手可及，但如果没有那种紧紧围绕着你[knotword]的紧致感，你将很难射精。");
         outputText("你闷哼一声，用力推挤，拼命想把球状的阴茎肉塞进去，随着一声湿润的吧唧声，它弹了进去，你得到了回报。围绕着你[cock]根部收紧的压力将你推向了边缘，精液开始射入她紧致的洞穴中，而你的[cock]被困在里面！[pg]");
         if(get_player().cumQ() < 25)
         {
            outputText("当你继续尝试抽插时，精液润滑了你的阴茎，缓解了你阴茎过度敏感的感觉，同时你们被锁在她小穴中的球状[knotword]粘在一起。");
         }
         if(get_player().cumQ() >= 25 && get_player().cumQ() < 100)
         {
            outputText("你的精液撑开了她的小穴，将她拉伸开来，让你的[cock]在你的精液中游泳，被你巨大的[knotword]困在她紧绷的肉壁内。");
         }
         if(get_player().cumQ() >= 100 && get_player().cumQ() < 500)
         {
            outputText("你的精液开始泵入她被塞住的身体，将她的洞穴填满。压力肯定将精液深深地堆积在她的子宫里，在感觉像过了漫长的时间之后，过满的精液反推在你的[knotword]上，随着她的小穴达到极限，一点点从她紧绷的女性褶皱边缘滴落出来。");
         }
         if(get_player().cumQ() >= 500)
         {
            outputText("你的精液以快速的喷射状射入她体内，短暂地将她的内壁涂成白色，因为更多的精液继续涌入她体内。她的小穴开始填满，当她挣扎着缓解继续泵入她体内的压力时，她只成功地将你的高潮推向了一个新的高度。你继续在她体内爆发，你的[knotword]紧紧地抓住她，让她扭动，你阴茎射出的每一发精液都设法从你们锁住的生殖器中挤出一点点精液。");
         }
         get_player().orgasm("Dick");
      }
      
      public function helpZeWithBirfBabies() : void
      {
         outputText("[pg]想到自己即将成为“父亲”，你心中充满自豪，迅速冲到沙漠女巫身边，扶她站起来。她现在几乎站不稳，一边痛苦地呻吟，一边努力推迟孩子们的降生。");
         if(!get_player().isDrider())
         {
            outputText("[pg][say: 你、你这几天到底对自己做了什么？]沙漠女巫脱口而出，注意到了自从你们结合后你外貌的变化。然而，她接下来的话被打断了，因为她痛得弯下了腰。");
         }
         if(get_player().isTaur() || get_player().isDrider())
         {
            outputText("[pg][say: 我、我站不起来了；太痛了！]她大声哭喊，绝望地认为自己无法及时赶到安全的地方，你们的孩子将会在同一天出生并死在这里。你严厉地告诉她趴到你的下半身上，然后俯下身子让她爬上来。");
            outputText("[pg][say: 拜托，别太快！]她在你身后喊道，显然在尽力不让你们情欲的结晶现在就生出来。你站起[feet]，试图回想该往哪走，却意识到这根本不重要。你集中精神想着营地，大喊着让沙漠女巫抓紧，然后");
            if(get_player().isDrider())
            {
               outputText("飞奔");
            }
            else
            {
               outputText("疾驰");
            }
            outputText("穿过干燥的沙漠之海……");
         }
         else
         {
            outputText("[pg]你把一只手伸进她的腋下，给她提供在滚烫的沙漠上蹒跚前行所需的支撑。不过，该往哪个方向走让你有些犯愁；你现在根本不知道自己在哪儿。你只能做出唯一的选择，集中注意力想着营地。脑海中有了个大致的画面后，你告诉沙漠女巫抓紧，然后你们俩慢慢地穿过干燥的沙漠之海……");
         }
         doNext(sandwitchBirthsYourMonstrosities);
      }
      
      public function getToFuckingWithZeEggsInWitch() : void
      {
         clearOutput();
         get_images().showImage("sandwitch-spread-her-leg");
         if(get_player().cor < 66)
         {
            outputText("虽然你理解她对突然变成你后代宿主的保留态度，但你知道这种体验可以是相互愉悦的。你俯身压在俯卧的沙漠女巫身上，温柔地拥抱她以抚慰她的不安，并向她耳语说你理解她的担忧，但请她给这次机会。在你温柔的话语下，她的恐惧稍微消散了一些，但当她看到你身后饥渴地摇晃着的产卵管时，又迅速燃起。你急忙向她保证她会享受这种体验，然后在沙漠女巫柔软的嘴唇上印下深情的一吻。");
            outputText("[pg]女巫不情愿地张开双腿，欢迎你进入她的身体。在你们互相爱抚的同时，你用你那异形的附肢摩擦她湿润的私处，用你“特殊”的欲望挑逗并涂抹她的阴蒂和肛门。");
         }
         else
         {
            outputText("看到沙漠女巫的恐惧，你脸上露出了愤怒的表情；她为了自己变态的愉悦而愿意袭击你，然而在面对一次真正独特的性爱时，她却像个懦夫一样发抖？这女人真有胆量！如果角色互换，她可不会给你什么“有说服力”的前戏；那你为什么要给她？你无视她的不确定，告诉女巫你知道她和这里的所有东西一样渴望一场痛快的性爱，别再装了。你扑向她，将她按倒在地，展现出毫无节制的性欲狂怒。当你的身体将她压在滚烫的沙子上时，她恐惧地睁大了眼睛，理所当然地担心你会强迫她接受你的欲望和未出生的后代。");
            outputText("[pg]当你的产卵管那球状的肿块褪下包皮，压在她润滑的私处上时，她沉重的呼吸变得更加不规律，她的整个身体因为即将发生的事情而恐惧地紧绷起来。");
            outputText("[pg]但这到底有什么用呢？强迫她？你“知道”这个女人外表下隐藏着一个堕落、放荡的婊子；那个乞求被你粗暴地操干和占有的婊子。她需要的只是一点点说服，让她承认她想要这个，让她接受内心的荡妇。当你向沙漠女巫耳语，说你知道她渴望你那异世界的附肢进入她的小穴；说她对这件事感到恐惧的表象不过是用来否认她本性的幻觉时，她颤抖了。你在内心深处知道，她最想要的莫过于躺下，与你一起享受肉体的极乐；而你可以让这一切发生——她只需要<i>承认它</i>，停止对自己的谎言。沉重、迟缓的呼吸和眼睛的抽动是你的回应，沙漠女巫努力在你的话语中寻找意义。");
            outputText("[pg][say: 不……我……] 沙漠女巫试图抗议，但她看到你产卵管时的兴奋暴露了她一直以来的伪装。你给出了最后一击，告诉她承认自己的欲望并不可耻，但否认自己变成了什么，否认自己渴望什么才是可耻的。你话语的分量似乎卸下了女人肩上的重担，直到她承认了在这片土地上几乎所有生物中生根发芽的堕落。");
            outputText("[pg][say: 求你……占有我……]");
         }
         doNext(laySomeEggsInThatWitchFinally);
         dynStats(DynStat.Lust(15));
      }
      
      public function encounter() : void
      {
         spriteSelect(SpriteDb.get_s_sandwich());
         clearOutput();
         if(!get_player().isChild())
         {
            outputText("一个奇怪的女人似乎从沙丘中现身。她自称是沙漠女巫，并礼貌地询问是否可以对你施放一个法术。");
         }
         else
         {
            outputText("一位陌生女子仿佛从沙丘之中凭空现身。她瞧见你这个小孩在沙间蹦蹦跳跳地穿行，脸上掠过一丝困惑，但很快便调整好了神态。她自称是一位沙漠女巫，甜腻腻地询问能否对你施一道咒语，好“帮你快点长大”。");
         }
         unlockCodexEntry(2052);
         if(get_player().statusEffectv1(StatusEffects.Exgartuan) == 1 && get_player().cockArea(0) > 100 && get_player().statusEffectv2(StatusEffects.Exgartuan) == 0)
         {
            outputText("[pg]覆盖你下半身的[armor]掉在地上，仿佛被魔法扯下。你的[cock]阴暗地跳动着，在几秒钟内变得坚硬，因为你体内的恶魔接管了控制权。它咆哮道，[say: 操，不如让我对你施个法吧，宝贝？][pg]");
            outputText("沙漠女巫");
            if(get_player().cor < 50)
            {
               outputText("和你都涨红了脸");
            }
            else
            {
               outputText("涨红了脸");
            }
            outputText("，你猛地把[armor]拉回原位。这里是你说了算，而不是某个被附身的器官！埃克斯加图安大喊了一些刻薄的话，但声音太闷了，听不清楚。你抬起头，刚好避开沙漠女巫的攻击。看来你必须和她战斗了！");
            startCombat(new SandWitch());
         }
         else
         {
            doYesNo(allowSandWitchMagic,refuseSandWitchMagic);
         }
      }
      
      public function eggwitchForeplay() : void
      {
         clearOutput();
         get_images().showImage("sandwitch-bee-drider-give-foreplay");
         outputText("知道沙漠女巫此刻的感受，你决定帮助她放松，以便接受你的后代。慢慢地，你的手指滑上不安的女人的腿，你的手沿着她娇弱的身躯抚摸的感觉引起了沙漠女巫可怜的喘息。逐渐向上，你的手掌沿着金发美人的大腿弯曲和扭动，一直让她因刺激而颤抖，她的");
         if(get_player().totalCocks() > 1)
         {
            outputText(Utils.num2Text(get_player().cockTotal() + 1));
         }
         else
         {
            outputText("两");
         }
         outputText("个阴蒂都因为你肉欲的关注而变硬。位于她的大腿之间，你的手停下来，你等待她渴望的目光，恳求你继续。沙漠女巫没有让你失望；她渴望的眼睛恳求你张开她的腿，与她调皮的部位亲密接触。");
         outputText("[pg]对沙漠狐狸的顺从感到高兴，你满足了她的欲望，张开了她的大腿；她兴奋的香气和热量上升到你的鼻孔，是对你完美的问候和欢迎。随着血液涌向你的性器官");
         if(get_player().cockTotal() > 1 || get_player().get_gender() == 3)
         {
            outputText("es");
         }
         outputText("，你降临在她的爱之钮上，甜蜜的女性汁液的味道随着舌头的插入拥抱了你的味蕾。曾经因为你拒绝她的提议而攻击你的桀骜不驯的女人融化在你的突发奇想中，当你把脸贴在她的骨盆上，帮助刺激她的另一个阴道时，她咕咕叫着，呻吟着");
         if(get_player().cockTotal() > 1)
         {
            outputText("");
         }
         outputText("与你的舌头同步。沿着她私处的每一次颤动都会产生更多的体液，更多的收缩，以及更多的大腿挤压，当你继续前进时，沙漠女巫非常愿意把你钉在你所在的地方，她向天空大喊，脸上充满了狂喜的快乐，渴望尽可能长久地保持这种状态。但你来这里不仅仅是为了“前戏”；你有一批需要宿主的后代，还有一种需要满足的欲望。");
         outputText("[pg]已经让这个女巫热身");
         if(get_player().cor > 50)
         {
            outputText("足够");
         }
         outputText("尝试你的繁殖方式，你迅速在沙漠女巫身上就位。");
         if(get_player().canOvipositBee())
         {
            outputText("坐着");
         }
         else
         {
            outputText("躺着");
         }
         outputText("贴紧你的伴侣，你们俩都花时间沉浸在对交媾的期待中。");
         dynStats(DynStat.Lust(25),DynStat.Cor(-0.35));
         doNext(laySomeEggsInThatWitchFinally);
      }
      
      public function childBadEnd2() : void
      {
         clearOutput();
         outputText("你的皮肤呈深棕色，头发呈沙金色，胸部丰满，你和母亲一起在沙漠中漫游，你成为一名成熟女巫的试炼正在进行中。你可以看到远处特尔阿德雷的废墟城市，那里早已被莉希丝的军队占领。");
         outputText("[pg][say:记住要控制好振动，否则你会伤害到他们的。][pg][say:是的，母亲大人。][pg][say:不要因为我监督你的试炼就放松警惕。可能会有恶魔潜伏在——啊！那里就有一个！][pg]你凝视着荒原，看到一个女骑士在沙滩上踉跄而行，她似乎被娜迦打伤了。她的盔甲上印有英格纳姆的标志……嗯？英格纳姆？为什么这个名字听起来这么熟悉？为什么你知道那是什么？你感到泪水在眼眶里打转了一会儿，不知道为什么，你迅速擦去了它们。好吧，这无关紧要。另一个毫无防备的猎物是教团的另一个潜在女巫。毕竟，在沙漠里不浪费任何东西是很重要的。[pg]你对不得不这样欺骗勇者感到内疚，但这都是为了击败莉希丝军队的更大利益，你内心深处渴望通过成年试炼，加入那场最终的对抗。你走近那个女人，似乎是从沙丘中出现的，表明自己是沙漠女巫。[pg][say:我可以对你施个法术吗，美丽的勇者？]");
         get_game().gameOver();
      }
      
      public function childBadEnd() : void
      {
         clearOutput();
         outputText("你踉跄着单膝跪地，痛得无法继续战斗。");
         outputText("[pg]当你的视线因疲惫而模糊时，女巫大步向你走来，似乎在沙滩上滑行。你的意识开始消退，你看到这位充满异国情调的女人摇了摇头，理解地笑了笑，盯着你娇小的身躯。");
         outputText("[pg]在你昏迷之前，你听到的最后一件事是她柔和的声音在吟唱，用低沉沙哑的耳语在你耳边喃喃自语：[say: Htrofecneh uoy esiar llahs sehctiW dnaS eht. Dlihc, dlrow siht fo noitpurroc eht rof ydaer ton era uoy.]");
         outputText("[pg]当你醒来时，你发现自己和其他小女孩一起在教团的巢穴里，一个沙漠女巫用她黑色的乳头哺育你，温暖的奶水涌入你的嘴里。当她继续喂你时，你发现自己处于一种催眠的恍惚状态。你对父母的记忆变成了遥远的过去，你来到这片腐败土地的记忆和动机也是如此。不久之后，你所能想到的就是你将学到的所有魔法，以及在与同龄人玩耍时如何最好地为沙之母服务，在这个原本腐败的世界里享受你的童年……");
         doNext(childBadEnd2);
      }
      
      public function beatSandwitch() : void
      {
         var _g:Combat;
         spriteSelect(SpriteDb.get_s_sandwich());
         clearOutput();
         if(get_monster().get_lust() >= get_monster().maxLust())
         {
            outputText("你满意地微笑着，看着[monster.short]四肢着地，开始狂热地自慰。");
         }
         else
         {
            outputText("你满意地微笑着，看着[monster.short]四肢着地，挣扎着想要站起来。");
         }
         if(get_player().isChild())
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2687,0);
         }
         menu();
         addButtonDisabled(0,"强暴","此场景需要足够的唤情值。");
         addButtonDisabled(1,"假阳具强暴","此场景需要你拥有豪华假阳具和足够的唤情值。");
         addButtonDisabled(2,"嘲讽","此场景需要足够的唤情值。");
         addButtonDisabled(3,"产卵","此场景需要你拥有足够的唤情值、产卵管和生殖器。");
         addButtonDisabled(4,"使用舒尔德拉","此场景需要你拥有足够的唤情值、舒尔德拉同伴和生殖器。");
         if(get_player().get_lust() >= 33)
         {
            outputText("遗憾的是，你意识到自己的需求还没有得到满足。当然，你还是可以操这个女巫……");
            outputText("当然，仅仅是嘲讽、戏弄和羞辱她的傲慢也会同样有趣，<b>但这会给她足够的时间来扭转局面……</b>");
            addButton(0,"强暴",sandwitchRaped);
            if(get_player().hasKeyItem("Deluxe Dildo"))
            {
               addButton(1,"假阳具强暴",sandwitchGetsDildoed);
            }
            addButton(2,"嘲讽她",get_player().isChild() && get_player().get_tallness() < 55 ? sandwitchTauntChild : sandwitchSpanking);
            if(!get_player().isGenderless() && get_player().canOviposit())
            {
               addButton(3,"产卵",ovipositSandWitches);
            }
            if(get_game().shouldraFollower.followerShouldra() && !get_player().isGenderless())
            {
               addButton(4,"使用舒尔德拉",get_game().shouldraFollower.sandWitchGetsGhostly);
            }
            if(get_silly())
            {
               addButton(5,"使用 3i@-",missingoSex);
            }
            addButton(6,"乳交",sandwitchTitFuck).hint("钻进那件长袍，在那对奶子之间摩擦。").sexButton(1);
         }
         if(get_player().abilityAvailable(OneOf_Impl_.fromA("Arouse"),{
            "ignoreLust":true,
            "ignoreFatigue":true
         }))
         {
            addNextButton("压倒",sandwitchOverwhelm).hint("用魔法将她的欲望推向极限。").disableIf(get_monster().get_lust() < get_monster().maxLust(),"她的唤情值还不够。");
         }
         if(get_player().hasMultiTails())
         {
            addNextButton("强迫梳毛",get_game().forest.kitsuneScene.kitsuneGenericFluff).hint("让[themonster]梳理你的尾巴。").sexButton(-1);
         }
         _g = get_combat();
         setSexLeaveButton(function():void
         {
            _g.cleanupAfterCombat();
         });
      }
      
      public function allowSandWitchMagic() : void
      {
         spriteSelect(SpriteDb.get_s_sandwich());
         clearOutput();
         if(get_player().hair.color == "sandy blonde")
         {
            outputText("她邪恶地笑了笑，吟唱道：[say: Tresed eht retaw llahs klim ruoy.][pg]");
            if(int(get_player().breastRows.length) == 0 || get_player().biggestTitSize() == 0)
            {
               outputText("你长出了一对完美的C罩杯乳房！");
               if(int(get_player().breastRows.length) == 0)
               {
                  get_player().createBreastRow();
               }
               get_player().breastRows[0].breasts = 2;
               get_player().breastRows[0].breastRating = 3;
               if(get_player().breastRows[0].nipplesPerBreast < 1)
               {
                  get_player().breastRows[0].nipplesPerBreast = 1;
               }
               get_player().orgasm("Tits",false);
               dynStats(DynStat.Sens(2),DynStat.Lust(1));
            }
            if(get_player().biggestTitSize() >= 1 && get_player().biggestTitSize() <= 2)
            {
               outputText("你的乳房突然向外膨胀，直到变成完美的C罩杯才停下来。");
               get_player().breastRows[0].breastRating = 3;
               get_player().orgasm("Tits",false);
               dynStats(DynStat.Sens(1),DynStat.Lust(1));
            }
            if(get_player().breastRows[0].nipplesPerBreast < 1)
            {
               outputText("你的胸部出现了两个黑点，迅速形成敏感的乳头。");
               get_player().breastRows[0].nipplesPerBreast = 1;
               get_player().orgasm("Tits",false);
               dynStats(DynStat.Sens(2),DynStat.Lust(1));
            }
            if(get_player().biggestLactation() > 0)
            {
               outputText("你的胸口积聚起一股强烈的压力，痛得厉害。你猛地拉下上衣，这时");
               if(get_player().biggestLactation() < 2)
               {
                  outputText("强劲的乳汁从你的乳头喷射而出，化作粗壮的水流喷洒在沙漠上。你在这感觉中呻吟着，挤压着你的乳房，用你的乳汁浇灌着这片被污染的土地。当乳汁停止喷射时，你脸红了，对你增加的产奶量感到非常尴尬。");
               }
               if(get_player().biggestLactation() >= 2 && get_player().biggestLactation() <= 2.6)
               {
                  outputText("乳汁从你的乳头喷涌而出，粗壮的水流四处喷洒。这种液体不断涌出的感觉非常色情，你觉得自己的性欲越来越高涨。当水流减弱时，你开始挤压你的乳房，渴望继续这种快感，但美好的事物终究会结束。");
               }
               if(get_player().biggestLactation() > 2.6 && get_player().biggestLactation() < 3)
               {
                  outputText("粗壮的乳汁从你酸痛的乳头喷涌而出，在沙地上形成水坑。你微笑着，看着自己如此慷慨地喂养着沙漠，乳汁覆盖沙地的速度比它被吸收的速度还要快。持续的泌乳令人愉悦……以一种高度色情的方式，你发现自己不受控制地呻吟着，拉扯着自己的乳头。过了一会儿，你意识到乳汁已经停止了，甚至有时间渗入沙地。你对你奇怪的想法感到惊讶，把手从敏感的乳头上拿开。");
               }
               if(get_player().biggestLactation() >= 3)
               {
                  outputText("你跪倒在地，抓住自己的乳头。伴随着非常性感的呻吟，你开始自己挤奶，喷出大量的乳汁。你喘息着，咕哝着，尽可能多地奉献你的乳汁。它像小溪一样顺着沙丘倾泻而下，你忍不住因为骄傲……和欲望而脸红。当你尽最大努力用你所有的乳汁喂养沙漠时，色情的快感不断增强。你在高潮的边缘徘徊了很久，到处都是乳汁。当你回过神来时，你意识到自己跪在那里，拉扯着干燥的乳头。你尴尬地停了下来，但你的性欲依然存在。");
               }
               if(get_player().biggestLactation() < 3)
               {
                  get_player().boostLactation(0.75);
                  outputText("你的乳房感觉更饱满……更成熟……就像你下一次挤奶可能会更多。");
               }
               dynStats(DynStat.Lib(1),DynStat.Sens(4),DynStat.Lust(15));
               get_player().orgasm("Tits",false);
            }
            if(get_player().biggestLactation() == 0)
            {
               outputText("一阵愉悦的释放突然从你的乳头喷涌而出！乳汁从你的乳房喷射出来，立刻浸透了沙子。它停得太快了，尽管女巫向你保证你现在可以经常产奶。");
               get_player().boostLactation(1);
               dynStats(DynStat.Lib(0.5),DynStat.Sens(1),DynStat.Lust(10));
               get_player().orgasm("Tits",false);
            }
            outputText("沙漠女巫微笑着感谢你的奉献。你注意到她裙子前面有四个地方湿了。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2310) == 0)
            {
               outputText("当她消失在沙丘中时，你好奇她的长袍下隐藏着什么。");
            }
            else if(get_player().cor <= 33)
            {
               outputText("当她消失在沙丘中时，你很高兴能避免再次服侍她。");
            }
            else if(get_player().cor <= 66)
            {
               outputText("当她离开时，你怀疑自己是否应该反抗并尝试和她做爱。");
            }
            else
            {
               outputText("你希望你刚才拒绝了，这样你就可以和她以及她那四个宏伟的乳房再多做爱一会儿。");
            }
         }
         else
         {
            outputText("她邪恶地笑着，吟唱道：[say: 漠中赤日灼如沙，沙发缠梦乐无涯——]");
            outputText("[pg]你感觉头皮发麻，意识到你的头发变成了沙金色！");
            get_player().hair.color = "sandy blonde";
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function SWCentaurMore(param1:Number) : Boolean
      {
         spriteSelect(SpriteDb.get_s_sandwich());
         if(param1 == 1)
         {
            outputText("你意识到得太晚了，在过去几分钟里她一直在施法。还没等你反应过来，周围的一切都变暗了。");
            get_player().orgasm("Generic");
            if(get_player().biggestTitSize() == 0)
            {
               outputText("[pg](你长出了一对完美圆润的C罩杯乳房！)");
               if(int(get_player().breastRows.length) == 0)
               {
                  get_player().createBreastRow();
               }
               get_player().breastRows[0].breasts = 2;
               get_player().breastRows[0].breastRating = 3;
               if(get_player().breastRows[0].nipplesPerBreast < 1)
               {
                  get_player().breastRows[0].nipplesPerBreast = 1;
               }
               dynStats(DynStat.Sens(2),DynStat.Lust(1));
               return false;
            }
            if(get_player().biggestTitSize() < 3)
            {
               outputText("[pg](你的乳房突然向外膨胀，在达到完美圆润的C罩杯时停了下来。)");
               get_player().breastRows[0].breastRating = 3;
               dynStats(DynStat.Sens(1),DynStat.Lust(1));
               return false;
            }
            if(get_player().biggestLactation() == 0)
            {
               outputText("[pg](你的乳房现在开始分泌乳汁了。)");
               get_player().boostLactation(1);
               dynStats(DynStat.Lib(0.5),DynStat.Sens(1),DynStat.Lust(10));
               return false;
            }
            if(get_player().biggestLactation() < 3)
            {
               get_player().boostLactation(0.7);
               outputText("[pg](你的乳房感觉更饱满……更成熟……奶水更多了……)");
               return false;
            }
            dynStats(DynStat.Lib(4));
            outputText("[pg](你的性欲被沙漠女巫的魔法显著提升了。)");
            return false;
         }
         if(param1 == 2)
         {
            if(get_player().cockTotal() > 0 || get_player().get_gender() == 3 && Utils.rand(2) == 0)
            {
               outputText("结束了你的游戏，先列腺液开始在你跳动的[cock]下积聚。");
               if(get_player().cocks[0].cockThickness >= 3)
               {
                  if(get_player().hasKnot(0))
                  {
                     outputText("看到它惊人的尺寸加上你肿胀的肉结，她恐惧地喘息着，试图再次逃跑。");
                  }
                  else
                  {
                     outputText("看到它那惊人的尺寸，她吓得倒吸一口凉气，转身又想跑。");
                  }
               }
               get_images().showImage("sandwitch-male-taur-win-hardsex");
               outputText("你抓住女巫，把她按倒在沙地上，迅速降低你的[cock]，抵住她的臀部。");
               if(get_player().cockTotal() == 1 && get_player().countCocksOfType(CockTypesEnum.TENTACLE) == 0)
               {
                  outputText("你猛地一挺，深深地插入了她的一个小穴，");
               }
               if(get_player().cockTotal() == 1 && get_player().countCocksOfType(CockTypesEnum.TENTACLE) == 1)
               {
                  outputText("你的[cock]挑逗地抚摸着她的肛门，让她在兴奋和抗拒中呜咽。你野蛮地一挺，突破了她紧绷的肌肉，");
               }
               if(get_player().cockTotal() == 2)
               {
                  outputText("将你的[cocks]对准她的双穴后，你深深地插入了她，");
               }
               if(get_player().cockTotal() >= 3)
               {
                  outputText("将你的两根肉棒对准她的双穴，另一根对准她的肛门，你毫不犹豫地插了进去。她的肛门肌肉试图将你拒之门外，但它们根本无法与你腿部的力量抗衡。你撕裂了她，");
               }
               outputText("当你的后半身用力将她推过沙地时，她发出了一声尖叫。");
               if(get_player().cocks[0].cockThickness >= 3)
               {
                  outputText("很难相信她有多紧，但如果她的哭喊能说明什么的话，那就是在你完事后她就不会这么紧了。你变得更加兴奋，随着越来越猛烈的抽插，你试图尽可能地撑开她。");
               }
               if(get_player().cockTotal() >= 2)
               {
                  outputText("你的[cocks]透过她狭窄的身体隔层互相触碰的感觉让你舒服地咕哝起来，在每一次抽插中都能重新体验到这种感觉。");
               }
               if(get_player().cocks[0].cockLength >= 12)
               {
                  if(get_player().cockTotal() == 1)
                  {
                     outputText("当你的[cocks]抵住她的子宫颈时，她的身体越来越屈服。");
                  }
                  else
                  {
                     outputText("当你的[cocks]抵住她的双子宫颈时，她的身体越来越屈服。");
                  }
                  outputText("当你最终突破时，她张开嘴，发出无声而痛苦的哭喊。");
               }
               if(get_player().countCocksOfType(CockTypesEnum.TENTACLE) == 1 && get_player().cockTotal() == 1)
               {
                  outputText("当你的[cock]深深地插入她的肠道，在操她内脏的同时蜿蜒深入她的身体时，她的身体越来越屈服。");
               }
               outputText("感觉你好像已经插了她好几个小时了");
               if(get_player().cocks[0].cockLength >= 12 || get_player().cocks[0].cockThickness >= 3)
               {
                  outputText("；她的哭喊声早已减弱为呜咽。");
               }
               else
               {
                  outputText("，她的哭喊声早已变成了欢愉的呻吟。");
               }
               outputText("你再也无法抑制你的高潮了。你的[cocks]爆发了");
               if(get_player().cockTotal() == 1)
               {
                  outputText("");
               }
               outputText("，");
               if(get_player().cumQ() >= 250)
               {
                  outputText("喷涌出大量的精液");
               }
               else
               {
                  outputText("将你的精子推入");
               }
               outputText("她的深处");
               if(get_player().cockTotal() == 1 && get_player().countCocksOfType(CockTypesEnum.TENTACLE) == 1)
               {
                  outputText("肛门");
               }
               else if(get_player().cocks[0].cockLength >= 12 || get_player().cocks[0].cockThickness >= 3)
               {
                  if(get_player().cockTotal() == 1)
                  {
                     outputText("小穴");
                  }
                  if(get_player().cockTotal() >= 2)
                  {
                     outputText("小穴");
                  }
               }
               else
               {
                  outputText("子宫");
                  if(get_player().cockTotal() >= 3)
                  {
                     outputText("和肠道");
                  }
               }
               outputText("。伴随着满足的呻吟，你拔了出来，让你的[cocks]将最后一点精液滴在被蹂躏的女巫身上。心满意足后，你骑马驶向沙漠。");
            }
            else
            {
               outputText("结束了你的游戏");
               get_images().showImage("sandwitch-taur-win-get-cunning-fingered");
               if(get_player().hasVagina())
               {
                  outputText("你的" + get_player().vaginaDescript(0) + "滴落着欲望的汁液");
               }
               outputText("，你毫不客气地将女巫推倒在地，并给了她的乳房一巴掌。她痛苦地叫喊着，乳汁溅到了沙子上。你脸上露出了残忍的笑容，开始更用力地扇它们，同时交替着拍打她那对小穴作为惩罚。令人惊讶的是，随着每一次拍打，她痛苦的叫喊声开始变成愉悦的呻吟。她甚至可能在微微迎合这些击打，尽管很难分辨。在大量的乳汁和她的体液流进她身下的沙子里后，你伸出手，开始将手指用力插入沙漠女巫的一个小穴中。最初的几次抽插就足以让她猛烈地达到高潮。你慢慢向前小跑，直到你跨在她身上，女巫突然跳了起来。将她的脸埋进你的");
               if(!get_player().hasVagina())
               {
                  outputText("[asshole]，她比你刚才更用力地抠弄自己。她的舌头探入你的[asshole]，一边热情地舔舐，一边挤压着她的乳头。");
                  if(get_player().analCapacity() < 10)
                  {
                     outputText("这种感觉非常强烈，你甚至能发誓，当她的嘴里发出奇怪的声音时，她的舌头正在勾勒出某种图案。");
                  }
                  else if(get_player().analCapacity() < 20)
                  {
                     outputText("不满足于仅仅品尝，你很快感觉到她的手指用力插入你的体内，并听到她嘟囔着听起来像是堕落欲望的淫秽词语。");
                  }
                  else
                  {
                     outputText("不满足于仅仅品尝，女巫抓住自己的一侧乳房，将乳汁喷射进你巨大的洞穴中。你意识到她甚至在将整只手插入你体内时，还在用乳汁润滑它。这种感觉太强烈了，你欢愉的尖叫声淹没了她充满欲望的嘟囔声。");
                  }
                  outputText("她的嘟囔声结束了，同时高潮也淹没了你。");
                  outputText("[pg]");
                  SWCentaurMore(1);
                  doNext(get_camp().returnToCampUseTwoHours);
                  return true;
               }
               outputText(get_player().vaginaDescript(0) + "，她比你刚才更用力地抠弄自己。她的嘴唇锁住你的[clit]并吸吮着，让你发出一声痛苦的喘息，并导致你的爱液喷涌在她的脸上。你感觉到");
               if(get_player().vaginalCapacity() < 10)
               {
                  outputText("她的一根手指");
               }
               else if(get_player().vaginalCapacity() < 20)
               {
                  outputText("她的几根手指");
               }
               else
               {
                  outputText("一个拳头");
               }
               outputText("深深地插入你的" + get_player().vaginaDescript(0) + "，你惊讶地发现");
               if(get_player().analCapacity() < 10)
               {
                  outputText("她的舌头");
               }
               else if(get_player().analCapacity() < 20)
               {
                  outputText("她的两根手指");
               }
               else
               {
                  outputText("一个拳头");
               }
               outputText("穿透了你的[asshole]");
               outputText("。");
            }
            return false;
         }
         if(param1 == 3)
         {
            outputText("随着她开始显得不那么惊慌，你把手伸进她的长袍，将其从她的肩膀上推下，露出了下面美丽的身体。一对小穴暴露了沙漠女巫的兴奋——她的大腿已经湿透了。你开始挑逗她的四个乳房，同时低下头，在她的嘴唇上印下一个热情的吻。结束亲吻并咧嘴一笑，你");
            if(get_player().get_str() > 50)
            {
               outputText("把她抱起来，扔到你的背上。");
            }
            else
            {
               outputText("向她伸出手，帮助她爬上你的背。");
            }
            outputText("你强壮的蹄子带着你在清澈的沙漠中轻快地小跑。没有了长袍的保护，你能感觉到女巫赤裸的小穴在你的背上摩擦，同时她将四个乳房压在你的肩膀上。随着你加快步伐，她的呻吟声越来越强烈。");
         }
         return false;
      }
   }
}

