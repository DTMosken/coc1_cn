package classes.scenes.areas.desert
{
   import classes.BaseContent;
   import classes.CoC;
   import classes.DebugMenu;
   import classes.DynStat;
   import classes.Monster;
   import classes.Player;
   import classes.SelfDebug;
   import classes.internals.Utils;
   import classes.items.UndergarmentLib;
   import classes.items.Weapon;
   import classes.items.WeaponLib;
   import classes.parser._Parser.TagFun_Impl_;
   import classes.saves.SelfSaver;
   import classes.saves.SelfSaving;
   import classes.scenes.Camp;
   import classes.scenes.areas.desert._OasisShamanScene.SaveContent;
   import classes.scenes.combat.Combat;
   import coc.view.CoCButton;
   import flash.Boot;
   
   public class OasisShamanScene extends BaseContent implements SelfDebug, SelfSaving
   {
      
      public var saveVersion:int;
      
      public var saveName:String;
      
      public var saveContent:SaveContent;
      
      public var questioned:Boolean;
      
      public var globalSave:Boolean;
      
      public function OasisShamanScene()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         questioned = false;
         globalSave = false;
         saveVersion = 1;
         saveName = "oasisshamanscene";
         saveContent = new SaveContent(null);
         super();
         SelfSaver.register(this);
         DebugMenu.register(this);
      }
      
      public function winCombatOasisShaman(param1:Boolean) : void
      {
         registerTag("lustwon",TagFun_Impl_.fromBool(!param1));
         clearOutput();
         get_player().setUndergarment(UndergarmentLib.NOTHING,0);
         outputText("[if (lustwon) {被情欲冲昏了头脑|被打得遍体鳞伤、疲惫不堪}]，恶魔屈服了，停止了袭击。危险的解除让你有时间回头看，发现你的[armor]沉在绿洲底部，你恍然大悟——你现在一丝不挂！不仅是不雅，而且是[i:自由]！诅咒消失了。");
         outputText("[pg]也许是你尚未恢复的状态在影响你，但你觉得必须让这个袭击者平安离开；无论有意与否，他确实解决了你的问题。[if (lust>30) { 也许，甚至可以为此奖励他……你体内的燥热催促着你。}]");
         menu();
         addNextButton("骑乘他",rideOasisShaman).hint("[if (silly) {让他尝尝人鱼小穴的滋味|放纵你的需求，接纳他进入你体内}]").sexButton(2);
         addNextButton("操他",fuckOasisShaman).hint("[if (silly) {打赌他喜欢鱼屌|他肯定想把你当成肉洞来用，但你装备齐全，可以反过来操他}].").sexButton(1);
         addNextButton("杀死",killOasisShaman).hint("处决这个邪恶的强奸犯。");
         setSexLeaveButton(leaveOasisShamanAfterCombat);
         button(null,"离开").hint("你会宽恕他。你该回家了。").disableIf(get_player().get_lust() == get_player().maxLust(),"你太兴奋了，不能就把他留在那里。");
      }
      
      public function submitOasisShaman() : void
      {
         var type2:int;
         var _g2:OasisShamanScene;
         var type1:int;
         var _g1:OasisShamanScene;
         var type:int;
         var _g:OasisShamanScene;
         clearOutput();
         outputText("抬起头，你看到他眼中充满了好色的饥渴。他以最原始的方式[i:渴望]着你。一阵猛烈的动作将他的嘴唇印在你的嘴唇上；他的味道证明和他的话语一样令人陶醉，你的脸完全红了。他闻起来有大海、沙子和几乎被洗掉的淡淡汗水味。有力的双臂将你紧紧抱在怀里，他的双手抚摸着你的背。当他的嘴唇移动时，你倒吸了一口凉气，当它们顺着你的脸颊啄到你的脖子上时，你尖叫起来。尽管你的鳃通常非常敏感，甚至会感到疼痛，但现在却没有灼烧感。不，你的身体在这种感觉下蜷缩颤抖，而兴奋则飙升到了绝望的高度。而他知道这一点。");
         outputText("[pg][say:在我族的所有传说中，没有哪个迷人的诱惑[if (isfeminine) {者|者}]或出身高贵的[lord]拥有我在你身上发现的魅力，]他低语道。[say:这种超凡脱俗的吸引力，让我无法自拔。]他的手指按摩着你的[hips]。[say:我克制自己只是为了向你优雅的容貌表示应有的尊重，否则我会像野兽一样蹂躏你。]你心中的悸动默默地乞求体验那种疯狂的、野兽般的欲望。[if (silly) {你肯定已经够湿了。}]");
         outputText("[pg]他的肉棒在你们两人之间跳动着，他在你[butt]上捏了一把，让你忍不住叫出声来，这让你不禁怀疑他是否察觉到了你的渴望，还是说你们就是如此契合。你捏了捏他紧绷的肌肉作为回应，你们两人沉入水中，在波光粼粼的水中漂浮着。你的一只[hand]向下滑动，握住那根耐心等待着关注的粗壮肉棒，它的粗细[if (vaginallooseness >= 2 or anallooseness >= 2) {可能会吓到经验不足的伴侣|令人感到畏惧}]，但你的理智已经被对它的渴望所支配。");
         outputText("[pg]萨满顺着你的身体向下滑动，他的指尖抚摸过你的每一寸肌肤，让你忍不住颤抖。冰凉的池水从你的腹部退去，取而代之的是他滚烫的双唇。就好像他体内的火焰传递给了你，点燃了你的渴望。你已经准备得不能再充分了，下意识地用尾巴尖缠住他的肉棒，催促他继续。[if (isvagorassvirgin) { 这样真的好吗？你真的是这样的人吗？让一个刚认识的男人成为你的第一个？[if (cor > 33) {这种自发性只会让你更加兴奋|很难找到比他更体贴、更关心你的人了}]……}]");
         menu();
         _g = this;
         type = 0;
         addNextButton("被操",function():void
         {
            _g.fuckedByOasisShaman(type);
         }).hint("你可没有他对待你时那么娇弱，你现在就需要他进入你！");
         _g1 = this;
         type1 = 1;
         addNextButton("被动",function():void
         {
            _g1.fuckedByOasisShaman(type1);
         }).hint("他想做的时候自然会做，尽管你欲火焚身，但这种缓慢的铺垫正是你所需要的。");
         _g2 = this;
         type2 = 2;
         addNextButton("主动",function():void
         {
            _g2.fuckedByOasisShaman(type2);
         }).hint("让他按照你的节奏来服侍他的[prince]。");
      }
      
      public function spiritOasisShaman() : void
      {
         dynStats(DynStat.Lust(20));
         clearOutput();
         outputText("为了不偏离主题，你追问关于这个精灵及其祝福的更多细节，并慢慢向后涉水以延缓他的靠近。你遇到了一个魔法性质的问题，而且似乎与水有关——也许在你与这个实体交流[i:之后]，他可以再谈谈对你的兴趣……尽管你尽可能委婉地表达了这一切，但你已经退到了浅水区，速度慢了下来，刚好让他能够触及你。");
         outputText("[pg][say:女士，我很乐意帮忙，但精灵需要毫无阻碍地接触你的身体表面……让赤裸的肌肤接触水，]他说道。他的手抚上你的胸膛，你感到心跳漏了一拍。你盯着他那闪烁着光芒的绿色眼眸越久，他的一切就越发迷人。你们周围的水面波光粼粼，当你低头看时，你发现自己一丝不挂——就像你出生那天一样赤裸。[say:现在让我向你展示召唤仪式。]");
         menu();
         addNextButton("顺从",submitOasisShaman).hint("他已经瓦解了你所有的防线。");
         addNextButton("抵抗",resistOasisShaman).hint("快击退他！").disableIf(get_player().get_lust() == get_player().maxLust(),"你太兴奋了，无法抵抗。");
      }
      
      public function saveToObject() : Object
      {
         return saveContent;
      }
      
      public function rideOasisShaman() : void
      {
         clearOutput();
         outputText("萨满在你面前漂浮着，神志不清且毫无防备。他曾试图引诱你，让你屈服于自己的欲望——但现在，情况逆转了。不过，他想要的只是性，暴力并非他的首选。而且你的诅咒也因他的努力而解除了。当你看着他健美的身体时，那种原始的吸引力驱使着你，想要为这份礼物奖赏他。");
         outputText("[pg]在水中滑行靠近，你的存在迫使他承认即将发生的事情。他的喉咙闪烁着奥术光芒，试图抗议，他的呼吸急促，肌肉微微紧绷以示反抗，但这正是他想要的，即使不是按照他的条件。你捏住他的下巴，强迫他与你对视，一声舒缓的声音下意识地滑出，平息了他的抵抗。萨满恶魔半眯着眼睛，轻轻叹了口气。[say:我美丽的[prince]，]他低语道。");
         outputText("[pg]你的[hand]向下游走，滑过他紧绷的腹部，然后握住他的阴茎。他颤抖着，无法控制自己对你的触碰做出反应。他身体的紧绷感是不可否认的，驱使他想要抓住你，但你推开了他的手臂。这首先是为了你，而不是他。");
         outputText("[pg]你不假思索地发出一声满足的呼噜声，动作缓慢而刻意地抚摸着他。他的臀部向前抽动，尽管脸上闪过一丝挫败，但还是暴露了他的渴望。他的脑海中燃烧着占有你的欲望；然而，这里是你的主场。水流托着他，你重新调整了姿势，[if (hasvagina) {将你的小穴贴在|背对着他，将你的[butt]贴在}]他的肉棒上。他现在抬头看着你，表情在不情愿和原始的饥渴之间挣扎。");
         outputText("[pg]当他戳弄着你那饥渴的洞穴时，你们之间的期待感噼啪作响，但他继续屈服于你的支配。最后，你将自己降到他身上，享受着那粗壮的尺寸撑开你肉壁的感觉，以及他喉咙里溢出的低沉呻吟。他的手指深深陷入你的[hips]。[if (isvagorassvirgin) {当你的身体努力接纳它的第一根肉棒时，会有阵阵疼痛和轻微的灼烧感，但他的急切让你继续动作，将你向下拉，直到他的阴茎完全埋入你[if (hasvagina) {曾经纯洁的小穴|处女的深处}]|[if ((hasVagina && vaginallooseness <= 1) || anallooseness <= 1) {当他的尺寸超出了你那小小的[if (hasvagina) {小穴|雏菊}]所能承受的范围时，一种幸福的疼痛感袭来，他急切的拉扯让你的臀部迎合他，而你则细细品味着这种感觉|他的肉棒滑入其中，仿佛它本就该在那里，撑开那泛红的肉壁，直到完全埋入你的深处}]}。");
         if(get_player().hasVagina())
         {
            get_player().cuntChange(get_monster().cockArea(0),true);
         }
         else
         {
            get_player().buttChange(get_monster().cockArea(0),true);
         }
         outputText("[if (hasCock) {当你适应了这种充实感时，你的[cocks]在水里[if (hasvagina) {在你们之间}]跳动着。}]你控制着节奏，围绕着入侵物旋转，让他感受到他所渴望的洞穴的每一丝美妙。按摩的双手探索着你的身体，滑过你的[if (ischubbybuild) {柔软、缓冲的[if (hasgooskin) {肿块|肉体}]|腰部，向上抚摸你的肋骨}]，不再是为了支配，而是为了崇敬。当你骑乘他时，他咬着嘴唇，你[if (hasvagina) {阴道|肠道}]里的跳动宣告着他随着时间流逝而逐渐崩溃的理智。");
         outputText("[pg]为了迎合这一点，你[if (hasvagina) {靠近他|转过头}]，深情地看着他那玻璃般的灰色眼睛，促使他更加崇敬你。他的声音沙哑而充满欲望，在水中勉强挤出，[say:你真是优雅的奇迹，我的[prince]。我希望能如你所愿地满足你。]");
         outputText("[pg]他的肌肉散发着紧绷感与热量；你的尾巴卷住他的双腿以稳住他，但他对你那野兽般的渴求并未消退。这只恶魔终于屈服了，他的释放漫长而颤抖，你也紧随其后攀上顶峰，你的整个身心都在愉悦中扭动[if (hascock) {，用精液玷污了他“神圣”的绿洲}]。一种深深的满足感席卷了你——在快感的洪流中燃烧殆尽了你所有的感官。突然，他用有力的双臂拥抱你，紧紧抱住你，同时将他痉挛的肉棒抽插进出，彻底将你淹没。当他充满男子气概的身体拍打着你，你像个发情的荡妇一样被操时，你的脑海中无法形成任何连贯的思绪。他的一只手[if (hashair) {扯住你的头发|捏住你的下巴}]，把你的头扭向他，印下一个吻。他的舌头侵入你的口腔，就像另一次虔诚的突刺。你们俩都无法控制这疯狂的欲望。");
         outputText("[pg]水流拍打着你们交缠的躯体，却又在下一次抽插中被推开，水流涌动，将性爱的热度在周围的水中传递，就像柔软床铺的温暖。你们交媾的震动在波浪中来回激荡。萨满恶魔滚烫的精液不断注入你的体内，而你渴望更多。他无情的攻势带来了最美妙的痛楚，如果不是水声掩盖，你知道自己嘴里发出的声音绝对是毫无克制的欢愉尖叫；最后一次挺进将他肉棒硕大的龟头尽可能深地推入你的体内，直到将你填满。你腹部鼓胀的精液如同沙漠般滚烫。");
         outputText("[pg]随着余韵消退，周围的绿洲恢复了平静，他抬起头看着你，目光中多了一丝柔和——像是尊重，又或许是勉强的钦佩。他也许一开始试图诱惑你，但最终，是你夺取了你想要的东西。");
         outputText("[pg]你松开缠在他腿上的尾巴，任由他在水中漂远，同时收拾好自己的物品。沙漠的酷热或许令人望而生畏，但现在，你带着充足的“额外体液”踏上回家的路……");
         get_player().slimeFeed();
         dynStats(DynStat.Cor(5),DynStat.Lib(5));
         if(get_player().hasVagina())
         {
            get_player().knockUp(1,432,90);
            get_player().orgasm("VaginalAndDick");
         }
         else
         {
            get_player().orgasm("DickAndAnal");
         }
         get_combat().cleanupAfterCombat();
      }
      
      public function resistOasisShaman() : void
      {
         clearOutput();
         outputText("你鼓起意志力，用[hands]猛推他，将他推开。你的脑子乱成一团！他想要你的身体，而且你感觉到你对他的渴望不仅仅是原始的性欲。");
         outputText("[pg]他沮丧地做了个鬼脸。[say:好吧，好吧，那我们就来硬的。]幻象消散，翅膀展开，角从他的头骨中长出；他是个恶魔。[say:如果我们继续演下去，你会更享受这种体验的，]他说。");
         outputText("[pg]只要你待在水里，你就会变得敏捷而持久。干燥炎热的沙子会消耗你的体力。逃跑是不可行的。[if (!isunarmed) {你迅速潜入绿洲底部，在他行动之前抓住了你的[weapon]。}]这个恶魔会发现和你战斗是个多大的错误。");
         startCombat(new OasisShaman());
      }
      
      public function reset() : void
      {
         saveContent.didEncounter = false;
      }
      
      public function rejectOasisShaman() : void
      {
         var swoon:Boolean;
         var _g:OasisShamanScene;
         dynStats(DynStat.Lust(10));
         clearOutput();
         outputText("他觉得你很有魅力，光是听到这句话就让你心里一阵悸动。这是一种令人不快的反应，在这件被诅咒的衣服之前，你对男人并不感兴趣，而且在完全理智的层面上，你仍然不喜欢一个男人对你为所欲为的想法。你咬紧牙关，克制住身体的倾向，游得更远，并向那个男人保证你不感兴趣。对一个没有努力追求[him]的男人产生欲望，这有失淑女[if (!isfeminine) {——呃，绅士}]的风度——而且这根本不是重点！");
         outputText("[pg]男人理解地点了点头。[say:我当然不是想把你当玩物，你很美。我只希望能像骑士俘获[prince]的心一样赢得你的芳心。]");
         menu();
         if(get_player().get_lust() > 50)
         {
            _g = this;
            swoon = true;
            addNextButton("心醉",function():void
            {
               _g.flirtOasisShaman(swoon);
            }).hint("他太会说话了……");
         }
         addNextButton("提问",questionOasisShaman).hint("换个话题！");
         addNextButton("拒绝",denyOasisShaman).hint("他必须停止，你没兴趣。").disableIf(get_player().get_lust() == get_player().maxLust(),"你太兴奋了，无法拒绝他。");
      }
      
      public function questionOasisShaman() : void
      {
         var swoon:Boolean;
         var _g:OasisShamanScene;
         dynStats(DynStat.Lust(10));
         clearOutput();
         outputText("他不是唯一一个没料到会有同伴的人。他是天生喜欢探索，还是有什么原因才来这里的？你的试探让他咧嘴一笑，他高兴地回答，[say:我是部落里的萨满。我来这里是为了在平静中与水交流。]");
         outputText("[pg]这激起了你的好奇心，你想知道这里的绿洲有什么特别之处。[say:这里有一个古老的水之精灵，比沙漠本身还要古老得多。这就是为什么绿洲能保留下来。]他从边缘滑下，开始向你漂来。[say:我的召唤将他们从沉睡中唤醒，他们用原始的法术来帮助我的族人。]");
         outputText("[pg]那个男人健美紧致的身体逐渐向你靠近。想到一个拥有你所不熟悉的魔法的古老灵魂能给你带来希望，你必须努力表达这样的想法，因为萨满那棱角分明的下巴和性感的目光实在太让人分心了。");
         questioned = true;
         menu();
         _g = this;
         swoon = false;
         addNextButton("调情",function():void
         {
            _g.flirtOasisShaman(swoon);
         }).hint("也许解决办法可以等等再说。");
         addNextButton("灵魂",spiritOasisShaman).hint("集中精神。集中精神！这可能很重要。");
         addNextButton("拒绝",denyOasisShaman).disableIf(get_player().get_lust() == get_player().maxLust(),"你太兴奋了，无法拒绝他。");
      }
      
      public function onAscend(param1:Boolean) : void
      {
         reset();
      }
      
      public function oasisShamanEncounter() : void
      {
         var swoon:Boolean;
         var _g:OasisShamanScene;
         var _gthis:OasisShamanScene = this;
         questioned = false;
         saveContent.didEncounter = true;
         registerTag("beautifulsword",TagFun_Impl_.fromBoolFun(function():Boolean
         {
            return _gthis.get_player().get_weapon() == _gthis.get_weapons().B_SWORD;
         }));
         registerTag("question",TagFun_Impl_.fromBoolFun(function():Boolean
         {
            return _gthis.questioned;
         }));
         dynStats(DynStat.Lust(10));
         clearOutput();
         outputText("就在你发现远处闪烁着微光——一片绿洲时，灼热的沙子开始让你感到刺痛！你揉了揉太阳穴，深吸了一口气，希望能确定那不是海市蜃楼。[Weapon]准备就绪，你[walk]走完了剩下的路。");
         outputText("[pg]海市蜃楼并没有随着你的视线移动，当你靠近时，它也没有弯曲或消失，它非常真实地存在于这里，肾上腺素的飙升迫使你立刻跳入水中。当清凉的水将你吞没时，你的身体受到了冲击！真的，你终于觉得可以轻松呼吸了，直到你发现水边有一个人影。");
         outputText("[pg]一个正在泡脚的男人。他身材匀称苗条，浅棕色的皮肤似乎更接近灰色而不是棕色。除了尖尖的耳朵，他与人类唯一的区别就是尖尖的耳朵。他猛地一震，一边说话一边拂去脸上的海绿色卷发。[say:请原谅，我没想到会有客人……更没想到会是如此迷人的客人。]");
         outputText("[pg]你注意到了他的赤身裸体，发现他的衣服放在一段距离之外。在这个世界遇到陌生人的紧张感，并不能阻止你的身体将他视为一个迷人的存在……");
         get_player().hasGottenWashed();
         menu();
         if(get_player().sexOrientation <= 10)
         {
            addNextButton("拒绝",rejectOasisShaman).hint("这个诅咒带来的欲望并不能代表你！");
         }
         addNextButton("询问",questionOasisShaman).hint("他在这儿干什么？");
         _g = this;
         swoon = false;
         addNextButton("调情",function():void
         {
            _g.flirtOasisShaman(swoon);
         }).hint("在这片沙漠里，他是唯一让你心甘情愿觉得火辣的存在。");
      }
      
      public function lostToOasisShaman() : void
      {
         clearOutput();
         outputText("你疲惫不堪的身体在水中无力地漂浮着，四肢的斗志已然耗尽。尽管这种形态在水中赋予了你充沛的活力，但现在却只感觉像是一种沉重的压迫。那个虚伪好色的“萨满”向你滑行而来，他在绿洲深处的动作毫不费力，灰色的眼眸中闪烁着胜利的光芒。也许他说得对，如果你从一开始就乖乖配合，一切都会容易得多。");
         outputText("[pg]一抹缓慢而心领神会的微笑在他的唇边蔓延，他的双手落在你的腰间，稳住你的身体。他的触碰坚定而充满占有欲。[say:你那么拼命地抗拒这种快感，]他若有所思地说，声音中充满了愉悦与得意。[say:可现在，你还不是无助地落在了我的手里。]");
         outputText("[pg]他火热结实的身体突然紧紧贴住你，将你拥入怀中，你的[breasts]压在他坚实的胸肌上。你能清晰地感觉到他的肉棒，完全勃起并散发着热气，抵在你的[if (ischubbybuild) {柔软的}]小腹上，无可辩驳地提醒着你接下来会发生什么。他的一只手抚上你的背部，托住你的后脑勺，而另一只手则向下游走，手指张开覆在你的[butt]上。");
         outputText("[pg][say:你本来可以享受温柔的，]他说道，呼吸拂过你的嘴唇。[say:我本来会很乐意把你当成宝贝一样对待。但你选择了反抗，现在你对我来说只能是个荡妇。]");
         outputText("[pg]他没有再多说什么，改变了姿势，[if (hasvagina) {抓住你的大腿，用拇指撑开你布满鳞片的泄殖腔|把你转过身，将他的肉棒拍打在你的臀瓣之间}]。他那肉感十足的龟头挤压着你紧绷的穴口，感觉滚烫，挑逗般的摩擦点燃了你的神经。你发出一声尖叫般的喘息，一阵电流窜上脊背，他阴茎的顶端现在已经挤进了你的入口！[if (isvagorassvirgin) {这感觉有点灼痛，你感到很矛盾，一方面沉浸在第一次被他这种水准的男人占有的快感中，另一方面又因为无论你如何反抗都被无视而感到焦虑和羞耻。}][if ((hasVagina && vaginallooseness <= 1) || anallooseness <= 1) {感觉你的整个身体都在变形、裂开，以容纳他|这种插入的感觉就像是变得完整了}]，肿胀的肉体伴随着一次漫长而充满占有欲的抽插，深深陷入你的温暖之中。你的[claws]深深抓进[if (hasvagina) {他的肩膀|他体内}]，但你无法逃避这种感觉。他把你紧紧抱在怀里，直没至柄，陶醉在你无助的喘息中。");
         outputText("[pg][say:没错，]他呻吟着，声音里充满了满足感。[say:这才是你一直需要的，小婊子。]");
         outputText("[pg]他设定了惩罚般的节奏，臀部以一种完全掌控局面的男人的毫不费力的节奏摆动着。随着每一次抽插，水流在你周围打着旋，随着那无情的动作荡起涟漪。他的双手自由地探索着，摸索、揉捏、占有你身体的每一[if (metric) {寸|厘米}]，这种感觉既令人兴奋又充满侵犯感。他的嘴唇找到了你的脖子，锋利的牙齿擦过敏感的[skindesc]，然后他吸吮出一个印记，一个所有权的烙印。");
         outputText("[pg]热量在你的小腹深处汇聚，一种无法抗拒的快感随着每一次无情的抽插而不断累积。他感觉到了——你的内壁收得更紧了，你的呼吸变得急促，你的身体，尽管不情愿，却开始迎合他的节奏。一声轻笑从他的胸腔里传出。");
         outputText("[pg][say:就是这样，]他低语道。[say:你清楚自己的位置，荡妇[prince]。]");
         outputText("[pg]随着一次更猛烈的挺进，你的肠胃一阵翻江倒海，他的肉棒更加无情地捣入你的体内。他的手指勾住你的下巴，强迫你迎上他的目光——得意、强势、完全掌控一切。这一刻仿佛凝固了，带着令人触电般无法逃避的张力，随后他吻住你的嘴唇，吞噬了你可能残存的最后抗议。");
         outputText("[pg]放弃了最后一丝抵抗，所有的疼痛都化作了极乐。你在高潮中扭动，肌肉紧绷着收缩，紧紧绞着体内的入侵物，直到你头晕目眩、喘不过气来。[if (hasCock) {一股股精液从你体内射出，在水流的阻力下缓慢地漂散开来。}]尽管身体和情感上都感到痛苦，但你还是向后迎合着他，像他所说的那只发情的母狗一样，迎接着他的抽插。");
         outputText("[pg]他的征服毫不留情；每一次抽插都在宣示对你的占有，将肉棒深深挺进你的体内深处，只顾追逐自己的快感，对其他一切毫不在意。他那粗暴的肏弄与周围混乱翻涌的柔软水流形成了鲜明对比，水流像毯子一样将热量散布开来。他的手指掐进你的肉里，呼吸变得粗重，每一次呼气都伴随着充满支配欲的低吼，他一次又一次地齐根没入，用粗壮的尺寸撑开你，直到你除了紧紧抱住他默默忍受外什么也做不了。最后，伴随着一声低沉而颤抖的呻吟，他在你体内射精了，肉棒跳动着，用他的精液填满你。他把你牢牢锁在原处，深深埋在里面，确保每一滴精液都深深注入后，才最终停歇下来。");
         outputText("[pg][say:认清你自己的身份，]他喃喃道，充满占有欲且心满意足。[say:你会再次[b:渴望]这种感觉的，你的身体生来就是被使用的。]留下这句话后，他松开了你，一股冷水涌入空虚的体内，夺走了你仅存的慰藉。你无法说清是对这种支配感到兴奋还是羞耻，但在身体上，你无法否认那种感觉棒极了。强烈的余韵逐渐消退，你发现自己渐渐陷入了沉睡。");
         outputText("[pg]几个小时后你醒了过来，身体稍微恢复了一些。你将目光投向绿洲的底部，发现你的物品都还在那里。当你收拾好东西浮出水面时，你心想，至少你现在摆脱了那件被诅咒的衣服。回营地的路还很长。");
         get_player().slimeFeed();
         get_player().setUndergarment(UndergarmentLib.NOTHING,0);
         if(get_player().hasVagina())
         {
            get_player().knockUp(1,432,90);
            get_player().orgasm("VaginalAndDick");
         }
         else
         {
            get_player().orgasm("DickAndAnal");
         }
         get_combat().cleanupAfterCombat();
      }
      
      public function load(param1:int, param2:*) : void
      {
         Utils.extend(saveContent,param2);
      }
      
      public function leaveOasisShamanAfterCombat() : void
      {
         clearOutput();
         outputText("没过多久，你就把装备都拖了出来，重新穿戴整齐，这次可没穿任何被诅咒的衣物。既然现在有了恢复身体的选择，你开始思考是否应该这么做。你感到优雅、充满女性魅力且端庄。难道你不该是这个样子吗？");
         outputText("[pg]下意识地，你的[hand]摸向脖子一侧，提醒着你鳃的存在。如果能毫无不适地呼吸新鲜空气，那将是一种解脱。也许存在某种物质能恢复人的自然状态，或者任何其他陆生生物的特征也可以。");
         get_combat().cleanupAfterCombat();
      }
      
      public function killOasisShaman() : void
      {
         clearOutput();
         if(get_player().get_weapon() == get_weapons().DULLSC)
         {
            outputText("你握紧黑暗镰刀，甩了甩尾巴，然后向前冲刺，将邪恶的刀刃挥过恶魔的脖子。");
         }
         else if(get_player().get_weapon().isKatana())
         {
            outputText("你平复呼吸，集中精神，准备好你的刀刃。随着一个迅速的动作，你的[weapon]干净利落地滑过晕眩的萨满。当你的敌人还在处理刚刚发生的事情时，武器已经回到了它的鞘中。[say:我——]他开始咕哝，然后裂成两半，两半都在水中静静地漂走。");
         }
         else if(get_player().get_weapon().isChanneling())
         {
            outputText("在恶魔败北之际，你的头脑变得更加清醒，你集中精神，将力量注入你的[weapon]。你用力一刺，将法杖的尖端猛地扎进秘术师的胸膛，在撞击的瞬间释放出所有凝聚的能量。冲击波在水中回荡，恶魔眼中的生命之光逐渐消散。");
         }
         else if(get_player().get_weapon().isAxe() || get_player().get_weapon().isScythe() || get_player().get_weapon().isBlunt())
         {
            outputText("你甩动尾巴积蓄力量，然后挥舞着你的[weapon]向前冲去，" + (get_player().get_weapon().isBlunt() ? "砸碎了恶魔的头骨" : "砍进了恶魔的脖子") + "，力量残暴。");
         }
         else if(get_player().get_weapon().isStabby())
         {
            outputText("你在水中疾驰，迅速用[weapon]刺穿了恶魔，[if (beautifulsword) {用其耀眼的力量焚毁了他的心脏|劈碎了他的心脏，终结了他}]。");
         }
         else
         {
            outputText("你瞄准目标，一拳击中恶魔的喉咙，打断了他用来在水下呼吸的法术，并让他陷入了一阵剧烈的咳嗽。在痛苦的挣扎中，他呛了水，拼命想游到安全的地方，但最终不可避免地溺水身亡。");
         }
         outputText("[pg]世界上又少了一个好色的祸害[if (cor<33){，为了你，也为了其他人}]。");
         get_player().upgradeBeautifulSword();
         get_combat().cleanupAfterCombat();
      }
      
      public function get_debugName() : String
      {
         return "绿洲萨满";
      }
      
      public function get_debugHint() : String
      {
         return "";
      }
      
      public function fuckedByOasisShamanNext() : void
      {
         clearOutput();
         dynStats(DynStat.Cor(10),DynStat.Lib(5));
         get_player().setUndergarment(UndergarmentLib.NOTHING,0);
         outputText("[pg]你眨了眨眼，抬头看向上方不远处波光粼粼的水面，[sun]光在水波中荡漾扭曲，形成了一幅美丽的奇景。你正躺在绿洲的底部。但你在这里偶遇的那个人呢？你游了一圈，没有发现他的踪迹——不过，你找到了你的[armor]，包括那件曾与你的[skinshort]粘合在一起的“被诅咒的”衬衫残骸。你解脱了！你猜这是你神秘情人留下的临别礼物。你心怀感激地整理好自己，踏上了回家的路。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function fuckedByOasisShaman(param1:int) : void
      {
         clearOutput();
         if(param1 == 0)
         {
            outputText("你尽力用尾巴绞紧他的肉棒，要求他好好利用它，你能感觉到他的轻笑声在水中回荡。这位秘术师游了上来，一边抚摸你的身体，一边调整姿势[if (hasvagina) {正对着你|来到你身后}]。");
         }
         else
         {
            if(param1 == 1)
            {
               outputText("你那柔软灵活的鳍肉显然取悦了他，这位沙漠秘术师将他抽动的阴茎在丝滑的薄膜上摩擦。他摸索着你的[hips]，然后将手指伸向你的[if (hasvagina) {生殖裂|[ass]}]，将其掰开，随后他的舌头展现出了惊人的长度。漂浮在绿洲深处，你在他的掌控中轻若无物，可以任由自己瘫软下来，而他则[if (!hasvagina) {将你转过身，}]把那条黏滑的触须探入你的私密之处。尽管浸没在水中，你的呻吟声依然在水中回荡，让你猛地绷紧身体并捂住嘴，但男人的舌头进一步压迫，贪婪地钻进你的体内，打消了你那一瞬间的羞涩冲动。你几乎要在快感中歌唱——");
            }
            else
            {
               outputText("你把尾巴往后拉，直到你鳍上柔软灵活的薄膜仅仅擦过他抽动着的阴茎。水流中回荡着他的轻笑，也许是被你的挑逗逗乐了，但你没让他分心，你把[hand]放在你的[if (hasvagina) {生殖裂|[ass]}]上，拉扯着它，重申他在下面的职责。他给你的苦笑让你也跟着坏笑起来，直到你惊讶地看到他那不断伸长的舌头滑了出来。这让你兴奋不已，你调皮地用鳍更快地刷过他的肉棒，仿佛在鼓励他。");
               outputText("[pg]秘术师用一只手臂环抱住你的人鱼身体[if (!hasvagina) {，游到你的背后}]，将他的脸对准目标。你满怀期待地吸了一口气，屏住呼吸，直到感觉到那条湿滑的触须在探测你的私密处。感激的呻吟声脱口而出。那黏滑的附肢弄湿了这位萨满想要埋入肉棒的沟壑。他的舌头再次顶住你的小穴，蠕动着想要进入，你把他的头按向自己，命令他把舌头插进去。他顺从了他的[prince]。火热、兴奋的穴口为他敞开，感觉就像最令人满足的止痒和舒缓的按摩结合在一起。自己抚摸绝对比不上这种感觉——");
            }
            outputText("[pg]他从你体内抽出，留下你随着他的离开而扭动。你呜咽着，抱怨他的离去，但很快就被打断了，因为他从水中窜上来贴住你的嘴唇，热情地亲吻你，一只手固定住你的头。");
         }
         outputText("[pg]他的脖子散发出光芒，棕灰色的皮肤在内部白光的映照下变得半透明。[say:我被宠坏的小[prince]，我会给你应得的，]他承诺道。他的肉棒拍打着你的[if (hasvagina) {布满鳞片的泄殖腔|臀部}]，强壮有力的双臂以一种令人安心的方式拥抱着你。那根肉棒柔软多肉的头部抵住了你的入口，[if (isvagorassvirgin) {想到你很快就会失去童贞，你陷入了最后一次短暂的焦虑之中|将你的欲望推向了顶峰}]。");
         outputText("[pg]你肺里的水伴随着一声惊呼全部涌出。你的[vagorass]在男人的阴茎周围张开，火花四溅；某种神奇的力量正在冲击你的感官。他拉过你的下巴，又印下一个吻，仿佛你失去的所有呼吸都回来了。[if (hasvagina) {你拥抱他，用另一个吻回应他|你抓住环绕着你的手臂寻求安慰}]——他那不可思议的肉棒更多地进入了你，当他的臀部拍打着你时，带来了一阵满足感。");
         if(get_player().hasVagina())
         {
            get_player().cuntChange(get_monster().cockArea(0),true);
         }
         else
         {
            get_player().buttChange(get_monster().cockArea(0),true);
         }
         outputText("一切都开始变得麻木。");
         outputText("[pg]你睡眼惺忪，漂浮在幸福、失重的宁静中；在你的体内，你的身体在萨满那根粗大坚挺的肉棒周围抽搐收缩[if (hascock) {——你自己的[cocks]也在肆意地流出先列腺液}]。在他的怀抱中，你感到一种前所未有的充实与平静。萨满开始向外抽动，引得你发出一声不由自主的绝望哭喊——你不能让他走！你的[underbody.skinfurscales]像蛇一样缠住他的腿，乞求他留下来，但他根本没打算拔出来；你的爱人猛地一挺！这股力量让你喘不过气来，你翻着白眼，猛烈地达到了高潮。你的一部分意识认为自己受伤了，但你却沉醉于这个野兽般的男人。他的臀部向后退去，留下了一阵空虚，然后他再次挺进。高潮并没有消除你的需求，在你的脑海深处留下了一个令人不安的警告：有些不对劲。");
         outputText("[pg]他比之前更缓慢地滑出，龟头上的大凸起按摩着敏感的通道，你感觉比刚才被撑得更开了。[say:别害怕，[if (isChild) {小}]美人鱼，]他低语道。另一个吻落在你的脸颊上，他翠绿的眼睛闪闪发光。他的臀部不断运动，迫使你的内脏腾出空间；他终于用他一直压抑的原始强度在操你。你感到疼痛，却又渴望着他，你的嘴唇迎上他的，将你的[tongue]伸进他的嘴里，回应着他的激情。他无情地、更用力地操你，你们俩的呻吟声交织在一起。里面[b:燃烧]着，你停不下来。");
         outputText("[pg]一股精液涌入，用舒缓的热度沐浴着你的体内[if (hasCock) {，你的[cocks]也与他同步，尽可能地喷射着精液}]。虽然泪水从你的眼角滑落，但那并非出于痛苦，你带着微笑，渐渐进入了平静的梦乡。");
         doNext(fuckedByOasisShamanNext);
      }
      
      public function fuckOasisShaman() : void
      {
         clearOutput();
         outputText("那个萨满在你面前漂浮着，神志不清，毫无防备。他曾试图引诱你，让你屈服于自己的欲望——但现在，情况逆转了。不过，他想要的只是性，而且强迫并不是他的首选。更何况，你的诅咒也因他的努力而解除了。当你看着他健美的身体时，那种原始的吸引力驱使着你去“奖励”他这份礼物。");
         outputText("[pg]你在水中滑行靠近，你的存在迫使他认清即将发生的事情。他的喉咙闪烁着奥术光芒，似乎想要抗议，他的呼吸变得急促，肌肉紧绷着微微反抗，但这正是他想要的，即使不是以他预想的方式。你捏住他的下巴，强迫他与你对视，一声安抚的低语不自觉地溜出唇齿，平息了他的抵抗。萨满恶魔猛地呼出一口气，灰色的眼眸中闪烁着期待与受挫自尊交织的复杂情绪。他本以为自己才是占有你的那一方，但现在，他已是任[i:你]索取的囊中之物。");
         outputText("[pg]你的[hands]在他紧绷的身体上游走，手指沿着肌肉的轮廓滑下，抚过他的臀部曲线。他的呼吸变得急促，但并没有退缩。随着你抚摸的停留，他浑身颤抖，身体的紧绷感也随之消散。当这只恶魔屈服于你的触碰时，他最初那种温文尔雅的自信早已荡然无存。即使在水下，他身体的灼热也清晰可辨，那是一种被他假装的抗拒所掩盖的无声恳求。");
         outputText("[pg]当你从背后贴近他时，萨满咬住了嘴唇。你的[cocks]坚硬地抵在他的后腰上，让气氛变得更加紧张。他的手指抽动着，似乎在犹豫是否要推开你，但当你的[if (hasclaws) {爪子刺入|双手紧紧抓住}]他的臀部时，他放弃了抵抗。你将自己对准他紧致而顺从的入口，享受着他的颤抖在水流中回荡的感觉；当你向前挺进时，恶魔发出了一声尖锐、不由自主的呻吟，他的手指紧紧抓住了你紧搂着他的手臂。当他的指甲陷入你的手臂时，你能感觉到他腹肌的收缩，他在努力接受自己作为承受者的位置。");
         outputText("[pg]你一开始的动作很慢，让他感受到他屈服的每一刻，以及你的[cocktype] [if (cocklength <= 6) {侵入他|撑开他}]的每一次脉动。他的自尊在抗拒，但他的身体却在每一次喘息中，在每一次抽插时指甲陷入你[skindesc]的动作中，说出了实话。他那箭形的尾巴尖在水中疯狂地来回摆动，似乎在担心自己会暴露那不愿完全承认的如潮水般的快感。你臀部的每一次摆动都迫使他的嘴唇发出又一声哽咽，他之前那种自鸣得意的镇定开始崩溃。");
         outputText("[pg]你靠上前去[if (isfeminine || !isflat) {，你的[breasts]紧贴着他的后背，}]并且[if (tallness > 70) {轻咬他的耳朵|调皮地咬他的手臂[if (hasFangs) {，留下一个浅浅的伤口，让他惊讶地轻呼出声}]}]。恶魔萨满在无意识的屈服中向后仰起头，他那带着喘息的喘气声变成了低沉、绝望的呻吟，你加快了速度作为对他让步的奖赏，直到他的抵抗完全瓦解。他紧致的臀部紧紧包裹着你，体内炽热，声音因快感而沙哑，曾经桀骜不驯的眼睛也闭上了。你的情圣现在只是一个为你[cock]发情的荡妇。");
         outputText("[pg]他浑身颤抖，身体因即将到来的释放而紧绷，无言地乞求你用精液填满他的肠道。没有必要再克制了，你用长满鳞片的鱼尾紧紧缠住他的腿作为支撑，用同样甚至更强烈的渴望操弄他。那如老虎钳般的肛门试图徒劳地阻止你，而内壁则像珍宝一样包裹着你的[if (cocklength <= 5) {小}]肉棒，那种感觉要求你屈服。他的肉棒在无人理会的情况下抽动着，而他的臀部却被如此狂热地使用着，然而那根肉棒仍在跳动，当他终于射精时，他的叫声在水面上回荡，毫无防备，不知羞耻。你没有停下来——直到他紧紧包裹着你的感觉将你拉入自己的高潮，快感如波浪般撕裂你，你完全占有了他。");
         outputText("[pg]随着余韵消退，周围的水面恢复平静，萨满温柔地看着你——也许是出于敬意，又或者只是顺从。他一开始可能试图诱惑你，但最终，是你夺取了你想要的东西。");
         outputText("[pg]你松开缠在他腿上的尾巴，任由他在水中漂远，同时收拾起自己的物品。");
         dynStats(DynStat.Cor(5),DynStat.Lib(2));
         get_player().orgasm("Dick");
         get_combat().cleanupAfterCombat();
      }
      
      public function flirtOasisShaman(param1:Boolean) : void
      {
         dynStats(DynStat.Lust(10));
         clearOutput();
         registerTag("swoon",TagFun_Impl_.fromBool(param1));
         if(param1)
         {
            outputText("这样的魅力让你融化……在某些方面，这让你感到痛苦。这并不是你过去的感觉，但一个念头悄悄爬上你的心头：对于这个世界的男人来说，他显得如此英勇和高贵。当你把双臂紧紧抱在胸前，把目光移开时，那个男人滑入水中，向你走来。");
         }
         else if(questioned)
         {
            outputText("希望绿洲之灵不介意你的不请自来，但你开口说道，这里的萨满肯定不会做出越轨之举。");
         }
         else
         {
            outputText("你也没有预料到会有这样的邂逅。你感到忐忑不安是很自然的，但你还是忍不住大声说出你欢迎他的陪伴。男人咧嘴一笑，滑入水中，但仍然靠在沙滩上以尊重你的空间。[say:我很高兴，]他说。[say:我可不想在神灵赐予我如此美丽的景象时，离开我最喜欢的冥想之地。][if (isfeminine) {你的眼睛盯着水面，打量着自己的脸。美丽，他说。你忍不住脸红了|这个诅咒一直试图改变你——但美丽？也许他说的是甜言蜜语；然而，这加深了你的红晕，温暖了你的胸膛}]。似乎感觉到了你的情绪，他慢慢地从浅水区向你漂来，进一步向你示好。[say:尽管这些神圣的水域有着所有的优雅和壮丽，但当我看着你，我神秘的异国[prince]时，我从未感到如此着迷。]“[prince]”这个词触动了你的心弦；你几乎无法控制自己。而他，如此健壮英俊，会成为一个如此高贵的追求者。");
         }
         outputText("你转过身去，却又带着调情的意味朝他走去。软弱的抵抗之词根本无法阻止他伸出手。害羞又腼腆——这真的是你吗，那个注定要保护英格纳姆免受恶魔侵害的勇者？这个念头并没有停留多久，这位神秘人拉住你的肩膀，你发现自己再次被他那灰白、结实的胸肌所吸引。[say:亲爱的，让这受祝福的泉水带走你的重担，让我为你美丽的脸庞带来幸福。]他把手按在你的胸口，让你的[if (hasgooskin) {核心|心}]漏跳了一拍。[if (beautifulsword) {绑在你身上的闪亮剑刃摇晃着溅起水花，将你更用力地推向他，然后滑入深处……}]你低下头，意识到你的[armor]已经脱落了。");
         doNext(submitOasisShaman);
      }
      
      public function denyOasisShaman() : void
      {
         clearOutput();
         outputText("无论他对你有什么幻想，都只是幻想——[i:你不会接受他的追求。]当然，你的身体有它的感觉，但你的大脑却没有丝毫兴趣，你会尽可能坚定地让他明白这一点。萨满靠近了[if (!Question) {, entering| in}]水里，涟漪似乎闪烁着微弱的光芒。他说话时，闪烁的绿眼睛吸引了你的注意力。[say:别这么冷淡，你这么漂亮，不该把心封闭起来。]闪烁的光芒增强了，你正要做出反应，他突然一个动作，手结结实实地落在了你的胸前。你所有的[armor]突然都漂到了深处。然而，你仍然保持着理智，用你的[hands]推开他，把这个卑鄙的男人推开。他可不是他想把自己打扮成的那种勇敢的追求者！");
         outputText("[pg]他苦心维持的幻象崩溃了，露出了恶魔的角、翅膀和尾巴。[say:好吧，好吧，那我们就来硬的。]他抱怨着翻了个白眼。[say:如果我们继续演下去，你本来会更享受的，]他说。如果不是因为折磨你心智的诅咒，也许你不会这么脆弱，但如果他认为自己已经赢了，那就大错特错了。深知你在水中的耐力和优雅，以及干燥沙地和酷热带来的可怕消耗，你决定战斗[if (!isunarmed) {，并潜入深水抓起你的[weapon]}]。");
         startCombat(new OasisShaman());
      }
      
      public function debugMenu(param1:Boolean = true) : void
      {
         get_game().debugMenu.debugCompEdit(saveContent,new SaveContent(null));
      }
   }
}

