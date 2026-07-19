package classes.scenes.npcs
{
   import classes.BreastRow;
   import classes.CoC;
   import classes.Cock;
   import classes.CockTypesEnum;
   import classes.DebugMenu;
   import classes.DynStat;
   import classes.DynStatOp;
   import classes.Monster;
   import classes.Player;
   import classes.SelfDebug;
   import classes.StatusEffects;
   import classes.TimeAwareInterface;
   import classes.Vagina;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.display.SpriteDb;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.items.Armor;
   import classes.items.ConsumableLib;
   import classes.items.Undergarment;
   import classes.items.UndergarmentLib;
   import classes.items.armors.LustyMaidensArmor;
   import classes.items.armors.NaughtyNunsHabit;
   import classes.items.undergarments.NobleShirt;
   import classes.parser._Parser.TagFun_Impl_;
   import classes.saves.SelfSaver;
   import classes.saves.SelfSaving;
   import classes.scenes.Camp;
   import classes.scenes.Inventory;
   import classes.scenes.combat.Combat;
   import classes.scenes.npcs._CeraphFollowerScene.SaveContent;
   import coc.view.CoCButton;
   import flash.Boot;
   import haxe.IMap;
   
   public class CeraphFollowerScene extends NPCAwareContent implements TimeAwareInterface, SelfDebug, SelfSaving
   {
      
      public var saveVersion:int;
      
      public var saveName:String;
      
      public var saveContent:SaveContent;
      
      public var globalSave:Boolean;
      
      public function CeraphFollowerScene()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         globalSave = false;
         saveVersion = 1;
         saveName = "ceraph";
         saveContent = new SaveContent(null,null);
         super();
         CoC.timeAwareClassAdd(this);
         SelfSaver.register(this);
         DebugMenu.register(this);
      }
      
      public function zetsukoBanana() : void
      {
         clearOutput();
         outputText("香蕉？香蕉到底是个什么鬼东西？[pg]");
         outputText("香蕉。");
         outputText("[pg]香蕉香蕉香蕉。光是说出来就觉得挺好笑的，所以你为了确认又多说了几次。嗯，还是很好笑。[pg]");
         outputText("[say: 操他妈的玛拉，求你别再说香蕉了——操！！][pg]");
         outputText("你听到砰的一声，转头看到绝子脸朝下趴在地上，双手被绑着，徒劳地挣扎着想站起来。她终于勉强挣扎着跪了起来，因为用力过度而气喘吁吁。她的额头上有一大块污渍，好像她一直在不停地把头往地上撞。[pg]");
         outputText("香蕉。[pg]");
         outputText("[say: 操！][pg]");
         outputText("当这个词从你嘴里说出来时，你看到绝子项圈上的铆钉发光，她突然又被迫趴在地上，脸埋在泥土里，屁股高高撅起，而她的小穴舌头在她的双腿之间疯狂地挥舞着。[pg]");
         outputText("[say: 哈……哈……绝子非常……讨厌……那些水果，]她说着，避免自己大声说出那个词，同时试图再次站起来。[pg]");
         outputText("哦，所以香蕉是水果咯？*砰*[pg]");
         outputText("[say: 操！][pg]");
         outputText("你就当她默认了。[pg]");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function yesUdderPWEASE() : void
      {
         clearOutput();
         outputText("你明亮的眼睛和微微张开的嘴唇向她暗示了你的答案。她把衬衫拉到肚子上方，塞进乳沟里，以免碍事。在你的注视下，塞拉芙在肚脐上方捏了两个地方，当她移开手指时，露出了……乳头！她在几英寸低的地方重复了这个过程，然后用拇指和食指框住这四个小凸起，深吸一口气，充满期待。恶魔女收缩腹肌，一个熟悉的隆起弹了出来，乳头也随之变长。还能听到液体在她粉红色的突起周围飞溅的声音，她忍不住轻轻拍了拍那个东西。你们俩都对里面牛奶随之而来的晃动和飞溅感到高兴。随着奶袋的生长，她的脸颊因用力而鼓起，随着越来越多的牛奶，奶袋变得越来越大，越来越宽，最后重重地垂在她的胯部上方。她松了一口气，然后把上衣重新套在新的乳房上，显然对布料上形成的四个小污渍感到自豪。[pg]");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,295,1);
         postUdderChoice();
      }
      
      public function unfetishifyYourselfWithFollowerCeraph() : void
      {
         var _g:CeraphFollowerScene;
         clearOutput();
         spriteSelect(SpriteDb.get_s_ceraphClothed());
         outputText("你要求塞拉芙移除她之前慷慨捐赠的其中一个恋物癖。她叹了口气，点了点头，说道：[say:" + get_player().mf("主人","女主人") + "，您确定吗？这并不容易做到，而且我喜欢知道我的主人被我的穿孔唤起！][pg]");
         outputText("你恼怒地咆哮着，告诉她：[say:是的，我想移除一个恋物癖。][pg]");
         outputText("恶魔女垂下肩膀，点了点头。她解释道：[say:我必须按照添加它们的相反顺序来做……保持不动，好吗？][pg]");
         outputText("你要继续吗？");
         menu();
         addButton(0,"是的",goThroughWithCeraphUnfetishification);
         _g = this;
         addButton(14,"离开",function():void
         {
            _g.ceraphFollowerAppearance();
         });
      }
      
      public function timeChangeLarge() : Boolean
      {
         return false;
      }
      
      public function timeChange() : Boolean
      {
         var _loc1_:int = 0;
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2730) > 1)
         {
            _loc1_ = 2730;
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,_loc1_,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,_loc1_) - 1);
         }
         return false;
      }
      
      public function tellyRpSowingEnd() : void
      {
         clearOutput();
         outputText("[say: 我很享受，[Master]，但你可能真的让我怀孕了，]塞拉芙那令人不适的成熟声音通知你。她娇小身体的幻象已经开始消退，让你呼出一口气，接受回到现实。如果塞拉芙真的带了几个小恶魔，那她也只能走一步看一步了。恶魔女孩从你身下扭动着爬出来，然后坐起身伸了个懒腰。[say: 那么，直到你下次需要我。]");
         outputText("[pg]你很快起身整理好自己，[if (!isnaked) {重新穿好衣服，}]回到营地中心，决定[day]接下来的计划。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function tellyRpSowing() : void
      {
         clearOutput();
         var _loc1_:Cock = get_player().cocks[get_player().smallestCockIndex()];
         outputText("你对购买玩具或零食不感兴趣，而是想协助她进行一些生产。准确地说，是播种。");
         outputText("[pg]特莉给了你一个灿烂的、眯起眼睛的笑容。[say: 您真是太好了，[mister]！我喜欢缝纫，但一个人做是个漫长的过程！]她迈着轻快的步伐，在柜台后面检查用品，然后露出困惑的表情。[say: 我一定是把它忘在床边了！]她宣布道，然后走进了她身后的小房间。");
         outputText("[pg]小恶魔爬上她的床，寻找针线。你跟着她爬了进去，隔着裙子抓住了特莉的屁股。[say: 呀！]她叫道。[say: [Mister]，我不需要推，我够得着，]脸红的商人解释道。在你不断的爱抚下，她向前趴在床垫上，转过身来，不让你碰她柔软的屁股。[say: [Mister]，如果您一直这样，我们永远也做不完缝纫活的……]");
         outputText("[pg]你爬到床上更深处，盘旋在恶魔上方。看来她还没明白你想播的是种，而不是线。特莉的脸涨得更红了。[say: 您是特莉最好的顾客，[mister]，但您肯定不想要一个爱丽丝。]她说话时移开了视线。");
         outputText("[pg]曲线和天赋并不是吸引力的全部。特莉在你心中有着特殊的地位，而作为一个爱丽丝只是她之所以为她的另一个方面。你没有停下来，你要让她成为一个母亲，你通过凑上前去亲吻，与商人唇齿相依，进一步传达了这个意图。");
         outputText("[pg]当你退开时，你可以看到特莉的性欲和兴奋感正在积聚。[say: 那——那我会为您尽力的，[mister]。]");
         outputText("[pg]她[if (!isnaked) {扭动着身子，开始摸索你的[armor]，帮你脱得更舒服些，然后}]把你按在背上，你的[multicock]已经完全勃起了。小女恶魔的舌头滑过你的肉棒[if (cocks > 1) {，在它们之间穿梭缠绕|，缠绕着它[if (cockThickness < 3) {好几圈|比你想象的还要多}]}]，你想起恶魔的血统让她那口中的触手能伸得极长。尽管这力量的来源十分堕落，但她的表情并不淫荡变态，而是带着一种缓慢的渴望。她的舌头上下滑动，在你的肉棒[if (cocks > 1) {们}]上涂满了唾液。当那条触手缩回她嘴里时，她把嘴唇凑到[if (cocks > 1) {其中一根的|}]顶端，印下最后一个吻。");
         outputText("[pg]特莉坐在你身边，脱下她的裙子，当暴露在空气中时，她皮肤上明显起了一层鸡皮疙瘩。虽然看到她除了可爱、孩子气的内裤外几乎全裸是很吸引人的景象，但她选择在脱下鞋子后把内裤拉下来，当她跨坐在你身上时，这件衣服仍然挂在她的脚踝上。她的大腿紧张地并拢在一起，充满期待，她未发育的小穴" + (_loc1_.cockLength < 5 ? "勉强被你同样小巧的" : "被你坚硬的") + "[cockType smallest]遮挡住。[say: 这个特莉的款待只为您准备，[mister]。]");
         outputText("[pg]她深吸了一口气，犹豫地将骨盆抬高，悬停在你的肉棒上方。她乳头的挺立和兴奋的笑容让人怀疑这种担忧的真实性；她想要你进入她体内。突然，一种皮革般的触感让你抽搐了一下，你低头看到女孩铲状的尾巴缠绕着你的[cock smallest]，将它与她的入口对齐。最后，特莉沉下身子，将你纳入她稚嫩的小穴中。[if (cocks > 1) {这种感觉让你其他的[if (cocks > 2) {" + get_player().multiCockDescriptLight(get_player().smallestCockIndex()) + "|[cock smallest2]}]在她的屁股上跳动和退缩，焦躁不安，直到她的尾巴——不再需要用来对齐选定的肉棒——开始抚摸和套弄[if (cocks > 2) {它们|它}]。}]当她习惯了你的侵入时，她纤细的臀部开始旋转。[say: 感觉怎么样？]");
         outputText("[pg]" + (_loc1_.cockLength > 8 || _loc1_.cockThickness >= 3 ? "她能容纳这么多真是个奇迹" : "她像老虎钳一样紧紧夹住你" + (_loc1_.cockLength < 5 ? "，尺寸与你的装备完美契合" : "")) + "。你的手拂过她的大腿，一路摸到她的臀部，并为她的内脏在触摸下颤抖的方式感到高兴。为了向她强调你的享受，你[if (height > 54) {向前倾身并}]把她拉向你，热情地亲吻这位年轻的店主。[say: 我很高兴，]她低语着，与你分开。在变得舒服之后，特莉前后摇晃着臀部，让你的[cock smallest]滑进滑出几[if (metric) {厘米|英寸}]。虽然距离很短，但这被证明是一种有效的技巧。这种效果因她安静、高亢的呻吟声而倍增，当你放松并让快感占据你时，你也发出了自己的呻吟。");
         outputText("[pg]特莉改变了技巧，开始上下套弄，把手放在你的[if (height > 60) {肚子|[chest]}]上作为支撑。她在你骨盆上缓慢弹跳的样子很可爱，尽管她现在的节奏没那么好了。你决定亲自掌握主动权，[if (silly) {字面意义上的，}]你抓住她并把她按住，然后挺动你的臀部。恶魔女孩发出一声尖叫，每次你的腹股沟撞击她的腹股沟时，她都会发出轻柔的咕哝声。她的小穴扭动着，在性高潮中颤抖，不由自主地抱紧了你。[say: [Mister]，别、别这么用力……]她喃喃地说。");
         outputText("[pg]你紧紧地抱着她，不断地抽插，把气喘吁吁的爱丽丝推向了极限。以你现在的速度，很难不很快射精。你一边想着，一边翻过身，把特莉压在身下。接着，你抬起她纤细的双腿，让她的膝盖贴在胸前。你打算尽你所能，把[if (silly) {精液|精液}]射进她的子宫深处。你越来越用力、越来越快地捣弄着这位商人" + (_loc1_.cockLength > 5 ? "的子宫颈" : "") + "。她伸出手抓住你，看着你的[eyes]。[say: 让特莉当妈妈吧，[mister]，]她在欢愉的喘息中结结巴巴地说。[say: 我想当妈妈。]");
         outputText("[pg]为了满足她，你加快了速度，感觉到体内的紧张感随时都会爆发。尖锐而压抑的呜咽声伴随着女孩的又一次高潮，但你的节奏并没有慢下来，很快，强烈的刺激让她彻底陷入了极乐的尖叫。绞紧你肉棒的颤抖肌肉，以及她高潮时令人兴奋的声音，足以让你也达到同样的极乐，在你把精液泵入她体内时，你也同样呻吟喘息着。你能感觉到你的身体随着每一次射精被抽空，用精液填满她的子宫[if (cumQuantity > 500) {，让她的肚子胀大[if (cumQuantity > 1000) {，直到精液开始从你的[cock smallest]根部溢出}]}]。特莉猛地拉下你的头，印上一个极其火热的吻，同时吸吮着你的[tongue]。");
         outputText("[pg]这种体验令人头晕目眩又心满意足，让你的身体在高潮后的余韵中放松下来。她松开你的嘴唇，温柔地笑了。");
         get_player().orgasm("Dick");
         dynStats(DynStat.Sens(-2),DynStat.Cor(0.25));
         doNext(tellyRpSowingEnd);
      }
      
      public function tellyRpPanty() : void
      {
         clearOutput();
         outputText("特莉是个非常熟练的商人，所以她肯定明白，为了确保未来的销量，她应该正确地演示产品的使用方法。[if (!isnaked) {你解开下半身的衣物，释放出里面充满活力的肉棒|你的肉棒已经完全准备好了，坚挺地立着}]，展现出它肉眼可见的勃起光彩。遵从你的命令，小爱丽丝撑开她的内裤，将它们滑过你的[cock]，当你龟头顶在布料的裆部时，她柔软温柔的手掌摩擦着你肉棒的侧面。经过一些调整，她的内衣现在已经完全包裹住了你，被她纤细的手指固定在原位。");
         outputText("[pg]她的手开始上下移动，隔着内裤抚摸你。特莉抬头看着你问道，[say: 您还满意吗，[mister]？]");
         outputText("[pg]虽然你很享受这个过程，但你打算让你的钱花得物有所值，她需要更努力才能真正赚到这笔钱。作为回应，恶魔舔了舔嘴唇，专注于手头的任务，熟练有效地按摩着你的肉棒。她在龟头上施加了足够的压力来刺激你，但又不会因为摩擦过度而让你难受。一种有节奏的紧张感在体内积聚，挑逗着你身体渴望达到的释放。你拍了拍她柔滑的金发，称赞她的服务，并鼓励她继续。");
         outputText("[pg]特莉红了脸，但还是微笑着，继续抚摸着。她凑上前去亲吻龟头，让一点唾液渗入你的肉棒。愉悦的呻吟从你唇间溢出，你不自觉地微微挺动臀部。下半身的眩晕感越来越强烈，你的[if (hasballs) {[balls]|腹肌}]随着脉搏紧绷又放松。你终于大声呻吟起来，将[if (silly && cumquantity < 10) {两小滴精液|精液}]喷射穿过特莉的内裤，溅到她的脸上，让她惊讶地皱起眉头。这个看起来很年轻的恶魔咯咯笑着，然后用手指抹去一些精液，放进嘴里品尝。");
         outputText("[pg][say: 请多来光顾，[mister]。我会给您更多特莉的“款待”！]她高兴地说。当她闭上眼睛再睁开时，颜色明显变回了之前的紫色，她的声音也恢复了更成熟的音调。[say: 没多少人对爱丽丝感兴趣，[Master]，但我希望我能合您的胃口。]");
         outputText("[pg]你发出一声满足的叹息。这是一场精彩的表演。你周围的幻象崩塌了，你重新找回了方向感。");
         get_player().orgasm("Dick");
         dynStats(DynStat.Sens(-2),DynStat.Cor(0.25));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function tellyRpLick() : void
      {
         clearOutput();
         outputText("你把小爱丽丝推到柜台上，把付款放在其余的钱旁边。你真正想要的糖果是那条内裤隐藏的东西。你的手顺着她的腿向上滑动，抚摸着她大腿光滑洁白的肌肤，并告诉她向你展示她的特殊商品。");
         outputText("[pg]特莉悄悄地咽了口唾沫，把自己拉到柜台上，然后抬起双腿，用颤抖的手拉起裙子，展示出她光滑无毛的小穴。这简直无法抗拒；你突然吻了女恶魔的嘴唇，让她吓了一跳，发出一声惊呼。尽管她有些犹豫，但她显然很享受这份工作，因为她已经湿透了，而那味道让你更加兴奋。");
         outputText("[pg][say:我-我可以因为你舔我而向你收费吗？]店主问道。就好像她能假装这根本不是她想要的一样……尽管如此，你还是配合着她，在柜台上又放了几颗宝石。作为回应，她兴奋地把腿张得更开，把一只手伸到大腿下，拉扯着她的阴唇，让你更好地看到她粉红色、天鹅绒般的小穴。她微小的入口处有一圈小小的处女膜，这是纯洁未受玷污的标志。你的[tongue]探入那肉质的通道，在此过程中沾满了美味的汁液。特莉强忍着呻吟，发出呜咽声，希望不要让外面可能存在的任何人知道这笔交易。");
         outputText("[pg]虽然这很有趣，但如果你自己没有得到任何服务，你很难得到满足。当你建议进一步发展时，特莉本能地开始合拢双腿，但你重复了你的愿望。你想和这位小商人做爱。");
         outputText("[pg]她沉默地犹豫了一会儿。[say:我……想把那个留给特别的人，]她说。你不相信她。你拿出许多最闪亮、最耀眼的宝石，再次重复了你的请求。她的眼睛里闪烁着贪婪和欲望的光芒。");
         dynStats(DynStat.Lust(20));
         menu();
         addButton(0,"操",tellyRpFuck).hint("把活塞放进气缸里。").disableIf(!get_player().hasCock(),"需要阴茎。");
         addButton(1,"大腿摩擦",tellyRpGrind).hint("相互的阴道快感。").disableIf(!get_player().hasVagina() || get_player().hasTailInsteadOfLegs(),"需要阴道且不是娜迦或人鱼");
         addButton(2,"算了",tellyRpEarlyEnd).hint("实际上，这超出了你的预算。");
      }
      
      public function tellyRpKiss() : void
      {
         clearOutput();
         outputText("[pg]你凑近这位年轻的店主，告诉她你想要的糖果是一个吻。特莉脸红了，迅速移开视线。[say:M-[Mister]，我不卖那种服务……]");
         outputText("[pg]你从[if (gems < 3) {不知何处|你的[pouch]}]拿出几颗宝石，递给她并重复了你的愿望。特莉盯着钱看了一会儿，然后羞怯地亲了亲你的脸颊。当她伸手去拿钱时，你把钱抽走，告诉她你说的不是那种吻。她的脸更红了。她紧张地撅起嘴唇，在离你几英寸的地方徘徊。你主动拉近距离，将嘴唇贴在她柔软娇嫩的肌肤上，紧接着抱住她的身体，注入更多的热情。");
         outputText("[pg]伴随着你们分开时发出的湿润的亲吻声，她用一种安静、呆滞的目光注视着你。");
         outputText("[pg]悬而未决的沉默终于被恶魔打破了。[say:感谢您在特莉的玩具与糖果店购物，[mister]，]她一边说着一边收下了宝石。然而，就像变魔术一样，你手里已经有了更多的宝石。也许接下来你应该直接买下她的内裤？特莉的眼睛因为这个提议和看到更多的钱而睁得大大的。[say:好的，[mister]，为了我最喜欢的顾客，什么都可以……]");
         outputText("[pg]特莉把手伸进裙子，慢慢地把内裤拉下来，大部分动作都被前面垂下来的布料遮住了。那条看起来很孩子气的内裤滑落到她的脚踝，她小心翼翼地跨出来，然后把你的商品展示给你。");
         dynStats(DynStat.Lust(20));
         menu();
         addButton(0,"亲吻她的\'嘴唇\'",tellyRpLick).hint("既然她已经露出来了，你想再来一次\"亲吻\"。");
         addButton(1,"内裤交",tellyRpPanty).hint("一个好的销售员应该演示如何使用产品。").disableIf(!get_player().hasCock(),"需要阴茎。");
      }
      
      public function tellyRpGrind() : void
      {
         clearOutput();
         outputText("[if (!isnaked) {脱掉[armor]的阻碍，你|你}]准备好行动，和特莉一起爬上柜台。当你的[if (singleleg) {湿润黏液|膝盖}]碰到她的腹股沟时，她喘了口气。你轻轻地在她身上摩擦，听了一会儿她安静的呜咽声，然后退了回来。你躺下[if (singleleg) {，将你无定形的下半身洒在她的骨盆上，在她的腹股沟上起伏你的史莱姆，而她抬起的腿在抽搐和颤抖|在她身上，用你的双腿缠住她的一条腿，开始用你的[vagina]摩擦她，同时用你的腿在她身上重复这个动作}]。她柔软的大腿轻轻压在你的[clit]上的感觉简直像在天堂[if (silly) {，这很讽刺，因为她是个恶魔}]。");
         outputText("[pg][say: 先——[Mister]，] 商人呜咽着。[say: 我——我……] 她没有说出完整的话，只能紧紧地抱住你，同时身体在抽搐。她的呻吟声是被迫发出的，很明显她已经高潮了。什么样的恶魔会这么快就高潮？你毫不减弱你的努力，当你刺激她时，你高兴地将你的[if (singleleg) {黏液|大腿}]滑过她湿透的阴唇。特莉已经没有意志力去压抑她的声音了，在刺激下大声喘息着。");
         outputText("[pg]小爱丽丝拼命地拥抱你当然不是不受欢迎的，但她的颤抖比你预期的更有效地刺激了你的胯部。照这个速度，你几乎会和她一样快达到高潮。[if (singleleg) {她的大腿在你的黏液拥抱中扭动|你的大腿相互摩擦}]发出的湿滑声音充满了房间；现在毫无疑问这家店里正在发生什么。你把特莉紧紧抱在怀里，摩擦得更快，达到了狂热的程度。");
         outputText("[pg]随着即将到来的高潮的电流感快速逼近，你把脸埋进特莉的脸里，深深地吻了她，你们在共同的高潮中互相呻吟，这让你们的动作节奏慢了下来，变成了舒缓而缓慢的摩擦。快乐的火花从让你紧绷转变为放松[if (singleleg) {无论你怎么称呼|你的}]肌肉。你的[if (singleleg) {[if (hasSlimeCore) {核心|中心}]|心}]在她的胸膛上跳动，你感觉到她的胸膛也在跳动。特莉把脸凑过来，又吻了你一下。一声叹息从你的唇间溜出，但这一刻并没有持续多久。");
         get_player().orgasm("Vaginal");
         dynStats(DynStat.Sens(-2),DynStat.Cor(0.25));
         doNext(tellyRpEnd);
      }
      
      public function tellyRpFuck() : void
      {
         clearOutput();
         outputText("[if (!isnaked) {脱掉[armor]的阻碍，你|你}]准备好行动，和特莉一起爬上柜台。看到你的[cock]悬在她未受玷污的小穴上方，她的神经紧张到了极点[if (cocklength < 5) {，尽管你的尺寸很谦虚|[if (cocklength >= 12) {，特别是考虑到你那令人生畏的巨大尺寸}]}]。当你用一只手将你的工具对准她的入口时，特莉抓住了你的另一只手。你看着她，看到她脸红、焦虑的脸庞，轻轻捏了捏她的手，让她平静下来。");
         outputText("[pg]她的阴唇包裹住你的龟头，随着你开始进入，里面的通道紧绷起来。当你推进去时，特莉发出呜咽并扭动着身体，很快你的[cock]就深深地埋入了她的体内。[say: 先——[Mister]，] 她呜咽着。[say: 我——我……] 她没有说出完整的话，而是变成了沉重的呼吸和闷哼，并尽可能紧紧地抓住你的手。你能感觉到它紧紧裹着你的肉棒——她已经高潮了。真是个虚弱的恶魔！你调整了一下姿势，身体前倾，将她拥入怀中，紧紧抱着这个不知所措的小商人。");
         outputText("[pg]让她放松下来后，你开始抽插，享受着你向外滑出时她发出的呜咽声。在你完全退出之前，你又猛地插了回去，惹得她惊叫了一声。这个过程反复进行，艰难而缓慢，直到特莉再也忍不住了。[say: 快一点，[mister]……] 她羞涩地请求道。[say: 尽情享用特莉吧。]");
         outputText("[pg]这可是她要求的。你加快了抽插的速度和力度，越来越快，逼得她连连娇喘。所有的声音都让店外的人清楚地知道里面正在发生什么，但她曾经有过的任何羞涩和保密念头都已被完全抛诸脑后。女恶魔用双腿缠住你的臀部，用整个身体拥抱着你。你开始进行快速的短促抽插。特莉渴望地看着你的眼睛，你则以唇相接作为回应，吻着她直到你的脸发烫。[if (hasknot) {你的肉结已经开始肿胀，决心要确保让她怀孕。}]");
         outputText("[pg]你放声大叫，感受着肌肉随着高潮的节奏收缩和放松。在最后的一阵猛烈抽插中，你把特莉也推向了边缘，她快乐地叫喊出声。她那小巧的恶魔小穴在你的[cock]上扭动，急切地与你一起达到高潮，仿佛要榨干你的[if (hasballs) {[balls]|下体}]能挤出的每一滴精华。你的动作慢了下来，让你的阴茎停留在她现在黏糊糊、饱受蹂躏的体内。[if (hasknot) {随着你的肉结将一切封锁在里面，你别无选择，只能和这个商人躺在一起，等待她的子宫吸收你给她的每一滴精液|随着她的双腿失去力气，你毫无阻碍地向后滑退，拔出了你的阴茎。几下微小的抽搐将额外的精液喷射在商人的阴唇上，让她里里外外都湿透了}]。");
         get_player().orgasm("Dick");
         dynStats(DynStat.Sens(-2),DynStat.Cor(0.25));
         doNext(tellyRpEnd);
      }
      
      public function tellyRpEnd() : void
      {
         clearOutput();
         outputText("当塞拉芙从你身边滚开时，幻象开始崩塌。[say: 很有趣，[Master]。没多少人喜欢这么缺乏“资本”的女孩。]");
         outputText("[pg]她做得很好，或者至少好到足以让你发泄出来。现在你已经充分放松了，可以带着缓解的紧张感继续你的[day]。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function tellyRpEarlyEnd() : void
      {
         clearOutput();
         outputText("看着你手里的钱，你突然意识到，实际上，这是相当鲁莽的消费。[if (gems < 100) {坦白说，你甚至不知道你是从哪里弄来这么多现金的！}]你退后一步，再次上下打量着眼前这个孩子气的身影，摇了摇头。");
         outputText("[pg]特莉一动不动地坐着，只是眨着眼睛。[say: 呃——呃，我们可以……赊账，你可以随着时间的推移分期付款还给我？]");
         outputText("[pg]乍一看是个诱人的提议，但这就是债务。那会更加不负责任。");
         outputText("[pg]恶魔咳嗽了一声，清了清嗓子。[say: 你……知道这只是个幻象，对吧？钱不是真的，你也没有付钱给我，[Master]。]");
         outputText("[pg]虽然这不是真的，但并不意味着你不应该练习理智消费。你立刻转身[walk]回营地，毫不费力地穿过幻象，留下塞拉芙独自一人在原地发愣。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function tellyRolepay() : void
      {
         clearOutput();
         spriteSelect(null);
         if(saveContent.roleplayAsTellyCount == 0)
         {
            outputText("恶魔用手指抵住下巴，目光上移，似乎在思考她是否认识那个人。你花时间向她解释了你所知道的关于那个开店的小爱丽丝的事情。[say: 哦，有意思。体型差异可能需要费点功夫才能伪装得逼真，但我会尽力的，] 塞拉芙说道。[pg]");
         }
         _temp_1.roleplayAsTellyCount += 1;
         outputText("在你眼前，女恶魔的身影开始闪烁变化，你们周围的环境也随之改变。片刻之后，你发现自己置身于特莉的商店中，夕阳的余晖洒进窗户，空气中飘荡着水果糖的甜香。站在你面前的是一个肤色白皙的塞拉芙，她仍在调整自己的形态。虽然她的头发变成了金色，眼睛变成了淡褐色，甚至连衣服也换成了带褶边的裙子，但她还没有完全缩小自己所有的特征。看着她一刻不停地变小，真是一幅迷人的景象。过了一会儿，一个与特莉一模一样的克隆体站在了那里。");
         outputText("[pg][say:欢迎回到特莉的玩具与糖果店，[mister]！我是特莉，我卖玩具和糖果！]充满活力的小女孩宣布道。");
         menu();
         addButton(0,"亲吻",tellyRpKiss).hint("你今天对一项特殊服务感兴趣。");
         addButton(1,"播种",tellyRpSowing).hint("你想帮她“生产”点什么。").disableIf(!get_player().hasCock(),"需要阴茎。");
      }
      
      public function sweetieNOOOO() : void
      {
         var _g2:CeraphFollowerScene;
         var _g1:CeraphFollowerScene;
         var _g:CeraphFollowerScene;
         get_marbleScene().marbleSprite();
         clearOutput();
         outputText("[say: 啊啊啊，对我还不满意吗，" + get_player().mf("主人","女主人") + "？] 塞拉芙气呼呼地说，假装恼怒。她刻意地用手抚摸着她肌肉发达的大腿，向上抚摸着她紧绷的腹部，并绕着她完美形状的淡紫色乳房之一。[say: 那你对我们的……游戏时间有什么想法？][pg]");
         outputText("花了一点时间整理思绪后，你开始描述一个高挑的乡村风格女孩，有着巨大的乳房和对爱称的天赋。塞拉芙用高亢的咯咯笑声打断了你，她实际上在兴奋中用手掌拍打着自己的额头。[say: 玛布尔？] 她在阵阵笑声中问道。[say: 你想让我变成那头母牛？哦，" + get_player().mf("主人","女主人") + "，但你对我来说肯定是个谜。] 你锐利的目光打断了她的遐想，她立刻清醒过来，甚至到了畏缩的地步。[say: 我的歉意，[madam]……你的愿望就是我的命令。][pg]");
         outputText("首先，她再次向环境做手势，从山区地形变成了……惠特尼的谷仓内部？果然，你越过她看去，看到了一个挤奶器");
         if(get_player().hasKeyItem("Breast Milker - Installed At Whitney\'s Farm"))
         {
            outputText("类似于你从工厂得到的那种。");
         }
         else
         {
            outputText("与你在英格纳姆看到的那些没有太大区别，不过似乎是为了人类使用而修改过的。");
         }
         outputText("你对周围环境的进一步探索被搁置了，因为你的目光又落回了塞拉芙身上。她的乳胶套装闪烁着松弛下来，那些战略性的窥视孔被普通的棉布缝合。材料重新塑形，直到她只剩下一条背带裤和一件至少大了四个尺码的纽扣衬衫。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,294) == 0)
         {
            outputText("看到你困惑的目光，她只是回答道：[say:啊，耐心点……亲爱的，]然后又回去工作了。");
         }
         else
         {
            outputText("你只是对这件衣服明显的尺寸差异会意地笑了笑。");
         }
         outputText("她伸出手，试探性地抓住她弯曲的恶魔之角，将它们拉直并塑造成更像牛的形状。她尾巴上的黑桃尖端缩小，然后长出毛发，整个附肢下垂，变得非常像牛尾巴。几乎是事后才想起来，她走到你面前，慢慢脱下你的[armor]。她戏弄了一下[onecock]，然后滑回了原来的位置。[pg]");
         outputText("塞拉芙向你眨了眨眼，举起双手，将左手掌心捏成尖锐的注射器状，然后右手重复同样的动作。她一丝不苟地解开那件超大号衬衫的纽扣，让背带裤滑落到腰间，并深吸了一口气以平复情绪。她托起乳房，将尖端对准她坚挺颤抖的乳头，然后扎了进去，在痛苦和兴奋中激动地呻吟着。她的前臂上鼓起肿块，一直向下延伸到她等待着的双手。你发现，这些肿块把她那针管状的新手掌当成了漏斗；它们从她的手臂上缩小并消失，因为它们的质量被转移到了她的乳房上。她那被挤压的胸部明显增大，证实了这一理论，塞拉芙在快感中痛苦地皱起眉头。新的体积发出了清晰可闻的晃荡声。更多的肿块开始出现，如波浪般向她等待着的胸部移动。虽然已经相当沉重，但[ceraphbus]以前的胸围与她正在注入液体的仍在膨胀的乳房相比，简直小巫见大巫。血肉开始挤向她的手臂托架，生长一直持续，直到最终停留在大约HH罩杯的尺寸。她将小刺从她突然变得沉重巨大的乳头上拔出，只留下一滴——肯定是乳汁——的痕迹。女恶魔挣扎着把衬衫拉过她肿胀的乳房，最终费了很大劲才把纽扣扣上。[pg]");
         outputText("塞拉芙一屁股坐在她美丽的蜜桃臀上，脱下靴子，抓起自己的一只脚。她用手掌按住恶魔高跟鞋并用力推，伴随着一声清脆的骨裂声，骨头退回了她的脚里。她对另一只脚重复了这个过程，然后开始粗暴地按摩她完全正常的双脚。她的动作使四肢变宽变短，将它们塑造成牛的偶蹄。她浑身发抖，双膝碰撞在一起，赤褐色的皮毛从" + (get_noFur() ? "膝盖" : "大腿") + "底部一直长到她的新蹄子上。塞拉芙试图站起来，有点摇晃。[say:同时适应没有脚跟支撑的蹄子……有点棘手，]她若有所思地说，在她现在趾行的腿上重新站稳了脚跟。[say:继续……][pg]");
         outputText("越来越像牛的[ceraphbus]抓住自己臀部的两侧，伴随着一声狂喜的叫喊，向外拉扯，使她的臀部变宽，让她的步态变得更加不稳。她把拇指塞进嘴里吹气，虽然你怀疑这只是为了戏剧效果，但她的大腿变粗了，屁股也变得丰满起来，完美地填满了她的背带裤。塞拉芙伸出手捏了捏自己的脸颊，将她棱角分明的五官变得更加圆润柔和。随着她打了个响指，奶油色的皮肤从她的鼻子上绽放开来，沿着她的脸和脖子蔓延，覆盖了之前紫色的色调。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,5) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,288) == 0)
         {
            outputText("她那粗短的阴茎大概也从宝蓝色变成了较浅的棕色，膨胀到了熟悉的七英寸大小；至少，从背带裤突然鼓起的包来看，你是这么判断的。");
         }
         outputText("她揉了揉头发，引发了类似的颜色变化，变成了和她腿部皮毛一样的棕色，她黑色的眼睛也变成了带有棕色虹膜的眼白。[pg]");
         outputText("[say:最后一步，]她呻吟着，整个身体开始摇晃。伴随着一阵颤抖，她的整个身体跳高了几英寸，然后又跳高了几英寸，直到她的大小与那个熟悉的牛娘差不多。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,295) == 1)
         {
            _g = this;
            doNext(function():void
            {
               _g.postUdderChoice();
            });
         }
         else
         {
            outputText("[say:那么，" + get_player().mf("主人","女主人") + "……或者，我应该说，亲爱的，]她喘息着，她那性感的语调平滑成一种朴实的、略带拖音的口音，[say:还有一个细节她——抱歉，我——没有；你希望我长……一个乳房吗？][pg]");
            outputText("这个问题让你觉得很好奇。你是想让你假扮的玛布尔长出一个乳房，还是没有更好？");
            menu();
            addButton(0,"要乳房",yesUdderPWEASE);
            _g1 = this;
            addButton(1,"不要乳房",function():void
            {
               _g1.noUdderPlz();
            });
            _g2 = this;
            addButton(2,"永远不要乳房",function():void
            {
               _g2.noUdderPlz();
            });
         }
      }
      
      public function sumissivenessToCeraphFollower() : void
      {
         var dog3:Boolean;
         var _g3:CeraphFollowerScene;
         var dog2:Boolean;
         var _g2:CeraphFollowerScene;
         var dog1:Boolean;
         var _g1:CeraphFollowerScene;
         var dog:Boolean;
         var _g:CeraphFollowerScene;
         clearOutput();
         spriteSelect(SpriteDb.get_s_ceraphClothed());
         outputText("当你提出要屈服于你的恋物癖女王时，塞拉芙的脸上闪过一丝喜悦。还没等你再说什么，她就挥舞着她的鞭子（她从哪儿弄来的？）用紧绷的皮革缠住了你的脖子，用力一拉，把你拖倒在地，让你喘不过气来。当你的手一碰到地面，闪亮的皮革就滑落了，但女恶魔已经站在你上方，用她那细高跟鞋推着你，把你滚到一边。");
         outputText("[pg][say: 像你这样没用的小[boy]，就应该待在泥土里，那才是你该待的地方，]女恶魔一边来回踱步一边宣布。她蹲在你旁边，在你耳边低语，[say: 安全词是“苹果”，你这可怜的猪。]");
         outputText("[pg]你温顺地点点头，被这位恶魔女王那威严、自信的指挥光环所震慑。");
         outputText("[pg][say: 弯下腰，荡妇，]塞拉芙命令道。");
         outputText("[pg]你刚想站起来，但塞拉芙再次挥舞鞭子，在你的背上抽了四五下。在疼痛中很难数清到底抽了多少下。你的[skin]上肿起了刺痛的红肿，一股令人陶醉的快感流遍了你的腹股沟。当她完成惩罚时，你已经完全硬了，这在上方那个残忍的双性人看来一清二楚。");
         outputText("[pg]塞拉芙皱着眉头看着你，命令道，[say: 宠物不能坐起来——它们要在泥里打滚，像野兽一样手脚并用地爬行。记住，[name]。你不是人。]她的鞭子轻轻地拍打着你的臀部。[say: 你是宠物。]啪！[say: 是奴隶。]啪！[say: 是财产。]啪！");
         outputText("[pg]你在鞭打下可怜地喵喵叫着，但还是尽力按照命令展示自己，翻滚着爬起来，[armor]上沾满了污垢。更糟糕的是，你的兴奋在很多方面都表现出来了");
         if(get_player().get_gender() == 3)
         {
            outputText("，无论是你那坚硬的男根");
            if(get_player().cockTotal() > 1)
            {
               outputText("");
            }
            outputText("还是从你装备下漏出的湿润");
         }
         else if(get_player().get_gender() == 2)
         {
            outputText("，毕竟你的双腿间已经渗出了湿润的水珠");
         }
         else
         {
            outputText("。任何知道该往哪看的人都能轻易发现你的坚挺，而这恶魔显然知道该往哪看");
         }
         outputText("。");
         outputText("[pg]塞拉芙得意地笑着问：[say: 我的小骚货是不是喜欢我粗暴一点？还是说，当你意识到我有多正确时，你就硬了？享受你的地位没什么可耻的，宠物。毕竟，动物就是为了取悦主人的。]她用一种陌生的温柔抚摸着你的[hair]。这就像是粗暴鞭打后的一剂令人愉悦的香膏，你发现自己不由自主地迎合着，接受这种贬低人的爱抚，只为了感受一些不痛的东西。");
         outputText("[pg][say: 乖[boy]，]紫肤的支配者一边轻柔地说着，一边开始脱你的衣服，整个过程中一直让你趴在地上。[say: 让我们把你从这些烦人的衣服里弄出来。好宠物都是光着身子的，我能看出你有多<b>努力</b>想成为一个好宠物。]她的手在");
         if(get_player().hasCock())
         {
            outputText("[oneCock]");
         }
         else
         {
            outputText("你坚挺的阴蒂上");
         }
         outputText("轻柔地舞动，带来令人发痒的触感");
         if(get_player().balls > 0)
         {
            outputText("然后轻轻捏住你的[sack]");
         }
         outputText("，品味着你的状态。突如其来的感觉让你大声呻吟，一滴");
         if(get_player().hasCock())
         {
            outputText("预精液已经开始在你的[cockHead biggest]上形成");
         }
         else
         {
            outputText("淫液已经开始在你颤抖的入口处形成");
         }
         outputText("。这滴晶莹剔透的凝结欲望慢慢开始悬垂下来，被一根水丝连接了几秒钟，然后断裂，消失在泥土中。");
         outputText("[pg][say: 噢，宠物滴水了？]塞拉芙一边大声琢磨着，一边站起身转了个圈，立刻坐在了你的背上。[say: 也许宠物觉得有点憋得慌。]她把鞭子绕在你的脖子上，轻轻拉了一下，足以让你意识到，如果她想的话，她现在就能控制你的呼吸。那条鞭子该死的魔法让你的血液沸腾，处理过的皮革摩擦你[skinfurscales]带来的色情刺痛感更是火上浇油。又一滴落了下来，你开始回答：[say: 是的……]");
         outputText("[pg]这个词刚一出口就被掐断了。塞拉芙教训道：[say: 宠物，你不是这么说话的！如果你想成为一个不仅仅是没用的顺从者，你需要学会如何沟通。现在，如果你想让我缓解那股压力，你可以像猫一样喵喵叫，或者像狗一样汪汪叫，叫一声代表是。叫两声代表否，然后我们就可以去散步了。]气管周围令人窒息的压力放松了，你得到了回应的机会。");
         if(get_player().hasCock())
         {
            outputText("[pg](同意可能会导致一些屈辱的榨汁……)");
         }
         else
         {
            outputText("[pg](同意可能会导致一些屈辱的假阳具插入……)");
         }
         dynStats(DynStat.Lust(50));
         menu();
         _g = this;
         dog = false;
         addButton(0,"喵一声",function():void
         {
            _g.barkToCeraphOnce(dog);
         });
         _g1 = this;
         dog1 = true;
         addButton(1,"汪一声",function():void
         {
            _g1.barkToCeraphOnce(dog1);
         });
         _g2 = this;
         dog2 = false;
         addButton(2,"喵两声",function():void
         {
            _g2.barkOrMeowTwiceToCeraph(dog2);
         });
         _g3 = this;
         dog3 = true;
         addButton(3,"叫两声",function():void
         {
            _g3.barkOrMeowTwiceToCeraph(dog3);
         });
         addButton(4,"苹果",sayAppleToCeraph);
      }
      
      public function submissiveCeraphOffer() : void
      {
         var _g2:Combat;
         var _g1:NaughtyNunsHabit;
         var monster1:Monster;
         var player1:Player;
         var _g:LustyMaidensArmor;
         ceraphSprite(true);
         clearOutput();
         outputText("再一次，塞拉芙");
         if(get_monster().get_HP() < 1)
         {
            outputText("在你面前倒在地上，被彻底击败了。");
         }
         else
         {
            outputText("瘫倒在地，开始自慰，她几乎是在用拳头操弄自己流着淫液的小穴，同时肆无忌惮地套弄着她那恶魔般的肉棒。");
         }
         outputText("她");
         if(get_monster().get_HP() < 1)
         {
            outputText("抬头看着你，问道");
         }
         else
         {
            outputText("好不容易停下自慰，抬头看着你问道");
         }
         outputText("，[say:我到底在瞎折腾什么？][pg]");
         outputText("你对她的语气感到有些惊讶——沮丧和认输可不是她的风格。你唯一能做出的反应就是");
         if(get_player().cor < 33)
         {
            outputText("紧张地轻笑一声");
         }
         else if(get_player().cor < 66)
         {
            outputText("惊讶地笑了一声");
         }
         else
         {
            outputText("困惑地苦笑");
         }
         outputText("。塞拉芙继续说道，[say:一直以来我都想把你收入我的后宫，但我忽略了一个明显的事实。每次我们交手，你总是占上风……在很多方面都是如此。]这只恶魔用温顺、低垂的眼眸抬头看着你，说道，[say:也许我一直都搞反了……我才应该属于你的后宫。][pg]");
         outputText("你的目光在这只恶魔充满异国情调、宛如雕塑般的肌肤上游走，不禁被她的提议所诱惑……塞拉芙看到你在仔细考虑，便拿出一个项圈，娇媚地说道，[say:别有压力……" + get_player().mf("主人","女主人") + "。你大可以像往常一样在这里要了我，也许，下次你就没这么好运了……][pg]");
         outputText("你要操她吗？");
         menu();
         addButtonDisabled(1,"操她");
         addButtonDisabled(2,"骑她");
         addButtonDisabled(3,"操她屁股");
         addButton(0,"给她戴项圈",collarCeraph);
         if(get_player().get_lust() >= 33)
         {
            if(get_player().hasCock())
            {
               addButton(1,"操她",get_ceraphScene().maleFuckCeraphsPussy);
               if(get_player().cockThatFits(get_monster().analCapacity()) != -1)
               {
                  addButton(3,"操她屁股",get_ceraphScene().buttRapeCeraph);
               }
               else
               {
                  addButtonDisabled(3,"操她屁股","你不可能塞进她的屁股里——你太大了。");
               }
            }
            if(get_player().hasVagina())
            {
               addButton(2,"骑她",get_ceraphScene().rideCeraphsCockLikeaBAWSSexclamation11eleven);
               if(get_player().biggestTitSize() >= 4 && get_player().get_armorName() == "lusty maiden\'s armor")
               {
                  _g = get_player().get_armor();
                  player1 = get_player();
                  monster1 = get_monster();
                  addButton(4,"B.Titfuck",function():void
                  {
                     _g.lustyMaidenPaizuri(player1,monster1);
                  });
               }
            }
         }
         if(get_player().get_armor() is NaughtyNunsHabit)
         {
            _g1 = get_player().get_armor();
            addButton(5,"膜拜肉棒",function():void
            {
               _g1.naughtyNunCockWorship();
            }).hint("通过对这只生物肉棒的奉献来赞美你的主。");
         }
         if(!get_game().ceraphFollowerScene.ceraphIsFollower())
         {
            addButton(6,"够了！",get_ceraphScene().killCeraph).hint("一劳永逸地杀死塞拉芙。");
         }
         _g2 = get_combat();
         setSexLeaveButton(function():void
         {
            _g2.cleanupAfterCombat();
         },"Leave",14,3,10);
      }
      
      public function stuffSomeNippleCunts() : void
      {
         ceraphSprite(true);
         clearOutput();
         outputText("想要利用你身体一些更极端的改变，你拉下你的[armor]，露出饥渴的乳头小穴，你乳头那润滑良好的尖端慢慢张开，期待着即将发生的事情。你把脱下的装备踢到一边，命令道：[say: 奴隶，操我的乳头。]");
         outputText("[pg]塞拉芙看着你，然后低头看了看你的胸部，最后又抬起头看着你，眼中闪烁着难以置信的光芒。[say: 你想……[Master]真是……变态，]她娇嗔着，脱下紧身衣，露出恶魔般的胸部。你那恶魔奴隶走近，臀部摇曳，下半身脱落，露出她那肿胀的紫色女性私处");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,288) == 0)
         {
            outputText("和骄傲的恶魔肉棒");
         }
         outputText("。她抓住你的[chest]检查，手指犹豫地在你初具雏形的胸部小穴入口处试探。塞拉芙露出邪恶的微笑。她的手指用力插入，当你");
         if(get_player().totalNipples() > 2)
         {
            outputText("两个");
         }
         outputText("乳头小穴被侵犯时，你的嘴唇发出了性感的呻吟。");
         outputText("[pg]恶魔的手指一次又一次地强行进入你，一直推到指关节。当塞拉芙感受你的深度、宽度和敏感点时，汁液顺着你乳房的隆起滴落。她试探的手指随意地强暴着你的乳晕，感觉真是太棒了。");
         if(get_player().totalNipples() > 2)
         {
            outputText("她轻松地从一个小穴移动到另一个小穴，探索着你无数的洞口，脸上带着愉快的微笑。");
         }
         if(get_player().lactationQ() > 0)
         {
            outputText("一股母乳喷射而出，差点射进你奴隶的眼睛里，你的乳汁因为这让人乳头紧缩的指奸而不受控制地流出。");
         }
         if(get_player().hasCock())
         {
            outputText("[EachCock]此刻已经硬得不行，把前列腺液抹得塞拉芙满肚子都是，但她并不介意。");
         }
         if(get_player().hasVagina())
         {
            outputText("至于你的[vagina]，你已经湿得足以承受一次猛烈的操弄，但老实说，现在你只想让你的[nipples]被完美而彻底地肏干。");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,288) == 0)
         {
            outputText("这个恋物癖荡妇那湿漉漉的肉棒正滴着水，在你的臀部上蹭来蹭去，被冷落却又兴奋不已。可怜的小东西。");
         }
         outputText("[pg]对自己的杰作感到满意，你顺从的[ceraphbus]退后一步看着你。你的[skin]泛着红晕。你乳房下方的每一寸肌肤都被润滑液[if (isLactating) {和乳汁}]弄湿了。你的[nipples]湿漉漉的，肿胀不堪。最糟糕的是，你像发情的母狗一样喘着粗气。你的奴隶就站在你伸手够不着的地方，带着会意的微笑看着你。她那紫色的皮肤也染上了一层玫瑰色，尽管她似乎比你更好地掩饰了自己的兴奋。你低吼道：[say: 我说了，肏我这该死的乳头！]并抖动着你滴水的乳房以示强调。");
         outputText("[pg]塞拉芙厌恶地皱了皱眉，但她还是回答道：[say: [Master]，请稍等，变形需要时间和准备。不过，我想我已经快准备好为您服务了。看着我为您改变吧……]塞拉芙用手掌托起自己丰满的乳房，开始揉搓。她的乳头虽然已经硬挺，但随着她恰到好处地呼出一口充满快感的娇喘，乳头进一步凸出、变长。");
         if(get_player().bRows() > 1)
         {
            outputText("一秒钟后，");
            if(get_player().bRows() == 2)
            {
               outputText("另一排女性的肉体开始");
            }
            else
            {
               outputText("更多排女性的肉体开始");
            }
            outputText("在她最上面那对乳房下方长出，这个恶魔的胸部在大小和结构上模仿着你的。当最上面那对超大的乳头继续长成巨大的奶头时，塞拉芙在更低的地方重复着她的抚摸，新长出的乳头模仿着它们的大哥，长到了淫秽的长度。");
         }
         outputText("起初，这些变化让她的乳晕看起来更像是长在乳房上的东西，但随着它们变得更大，你意识到它们呈现出明显的男性形状，在球状的尖端下方有一道轻微的隆起。在长出将近七英寸后，向上弯曲的乳头停止了生长。塞拉芙长出了乳头肉棒！");
         if(get_player().averageNipplesPerBreast() > 1)
         {
            outputText("她挨个抚摸着它们，它们从中间裂开，分裂成许多根阴茎，与你的四重乳头小穴完美匹配。");
         }
         outputText("[pg]你忍不住张大嘴巴看着这个淫荡小恶魔的新形态。她绝对、毫无疑问是为了性而生的，从她宽阔的臀部和轮廓分明的阴唇，到她为了满足你的突发奇想而长出的绝对淫秽的器官。塞拉芙把头发向后梳，问道：[say: 我想您喜欢这个造型吧，[Master]？]你点点头，把手指伸进胸前，拉开那些洞来诱惑她。你很难忍住喉咙里涌出的呻吟，但你还是设法保持了平静而诱惑的表情。");
         outputText("[pg]你那天赋异禀的仆从走上前来，脸上挂着热情的表情，花时间和精力将她胸前的每一个工具与你的[nipples]对齐。塞拉芙恭敬地抬头看了你一眼，你点了点头，也许比你预想的还要急切。立刻，" + Utils.num2Text(get_player().totalNipples()) + "根肉棒滑入你长在乳房上的阴道里，它们跳动的恶魔血肉在完美的、令人陶醉的同步中湿漉漉地摩擦着你的多个内部。当你的胸部小穴被占据、完全填满时，一种几乎无法理解的极乐感爆发出来。在这种情况下，你很难思考，更不用说站立了，你紧紧抓住塞拉芙的肩膀，把她拉倒在你身上。");
         outputText("[pg]你的宠物恶魔立刻屈服于她的本能，开始在你身上起伏。在每一次抽插的底部，液体从你被侵犯的洞里喷出，对接的乳肉向外挤压，淫秽地隆起。交织在一起的身体在激情的阵痛中摩擦，塞拉芙的速度越来越快，空气中充满了性交时黏糊糊的拍打声。很快，她的速度快得让人无法分辨出无数种性感的声响，不过你现在也无法正常思考去尝试分辨。你躺在那里，只是享受着性爱，像泥潭里的母猪一样沉迷其中。");
         outputText("[pg]塞拉芙在你身上起伏时，紧张而愉悦地咬着下唇，在一个令人惊讶的清醒瞬间，你命令道：[say: 奴隶，吻我。]她热情地照做了，她那紫色的嘴唇立刻锁住了你的嘴唇，舌头缠绕在一起，就像交战的蛇。这几乎足以让你忘记她那浸满润滑液的乳房拍打在你乳房上的砰砰节奏，几乎。随着每一次进出你体腔的活塞运动，肿胀的乳头肉棒感觉更大了。你意识到她快要高潮了，片刻之后，你那被欲望蒙蔽的头脑也意识到你也要高潮了。");
         outputText("[pg]你咬住塞拉芙的下唇，让她退后足够长的时间，以便你下达命令：[say: 射在里面，宠物，填满我的乳房！]塞拉芙紫色的眼睛微微交叉，黑色的巩膜闪烁着水光，眼睑在狂喜中颤动。她以惊人的力量扑倒在你身上，将所有" + Utils.num2Text(get_player().totalNipples()) + "根抽搐的肉棒插到底，正好释放出它们乳白色的货物。天哪，她把你填得太满了！你伸出手，用力挤压[chest]的边缘，足以感觉到你体内坚硬、喷射精液的肉体。当你开始颤抖和摇晃时，精液从每个入口同步涌出。塞拉芙在填满你时发出一声低沉的呻吟");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,288) == 0)
         {
            outputText("，她的肉棒将自己象牙白色的液体喷射到你的肚子上，作为共鸣的释放。");
         }
         else
         {
            outputText("，她的小穴无力地滴着水，作为共鸣的释放。");
         }
         outputText("她的手穿过你的[hair]，把你的[face]拉到她的肩膀上。她紧紧地抱着你，甚至有些依恋。如果你不是如此沉迷于充满精液的乳头带来的感觉，你也许真的会在意。");
         outputText("[pg]你们俩慢慢放松下来，双重高潮逐渐平息，终于恢复了一丝理智。恶魔女的眼睛一恢复正常，她就站了起来，" + Utils.num2Text(get_player().totalNipples()) + "根肉棒同时从紧紧抓着、塞满精液的小穴中滑出。你喘息着颤抖，敏感的肉体几乎让你再次高潮。当她伸展身体时，塞拉芙的新器官缩小了，失去了它们的男子气概，尺寸缩小的速度甚至更快。你站起身，试图忽略从你被狠狠操过的胸部喷涌而出的恶魔精液细流，你的[chest]因为额外的液体重量而奇妙地晃动着。塞拉芙弯下腰，将一个[nipple]吸进嘴里，快速吞咽了几口后，她满足地叹了口气。");
         outputText("[pg][say: 真美味，我的[Master]，]恶魔女娇嗔着，展开了翅膀，[say: 拜托，我们再来一次吧。]她跃入空中飞走了，毫无疑问是去照顾她自己的宠物了。");
         get_player().orgasm("Nipples");
         dynStats(DynStat.Sens(2),DynStat.Cor(1));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function sayAppleToCeraph() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_ceraphClothed());
         outputText("去他妈的！[say:苹果！]");
         outputText("[pg]塞拉芙站了起来，紫色的脸庞上写满了震惊。[say:你难道不觉得好玩吗？]她问道。[say:我们才刚要进入正题呢！]");
         outputText("[pg]你告诉她这根本一点都不好玩，你想退出。");
         outputText("[pg][say:好吧，那就算了……[Master]……]她嘟囔着。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function saveToObject() : Object
      {
         return saveContent;
      }
      
      public function reset() : void
      {
         saveContent.rapePlay = 0;
         saveContent.roleplayAsTellyCount = 0;
      }
      
      public function punishCeraphForSurpriseThroatFuck() : void
      {
         ceraphSprite(true);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,290,1);
         clearOutput();
         outputText("你一把抓住塞拉芙，将这只受惊的恶魔按在一块岩石上，对着她的屁股就是一顿猛打。她呜咽着，但强忍着没有哭出来，即使你把她紫色的屁股打得青一块紫一块。你每打一巴掌，就向她宣告，她的肉棒只有在你的允许下才能靠近你的嘴，而不是一个毫无价值的奴隶可以自作主张的。到最后，她抽泣着点头，一遍又一遍地喃喃自语，[say: 是的，" + get_player().mf("主人","女主人") + "。][pg]");
         outputText("你放走了这只自尊心受挫的恶魔。毫无疑问——她再也不会犯同样的错误了。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function postUdderChoice(param1:Boolean = false) : void
      {
         if(param1)
         {
            clearOutput();
         }
         outputText("做完这些，她把背带裤拉回肩上，背对着你，等了几秒钟才转过身来。[say: 亲爱的！？]她惊恐地大叫，眼睛睁得大大的，双臂挡在身前，躲避着你。[say: 你……你在干什么……][pg]");
         outputText("“玛布尔”向后退去，被一个水桶绊倒，一屁股跌坐在她宽大的臀部上。[say:亲爱的，求求你，别把我绑在那个挤奶机上……除了那个什么都行！]当你明白她的意图时，一抹邪恶的冷笑浮现在你的唇边；你注视着这位牛娘[ceraphbus]，她的脸上写满了恐惧，身体也在不停地颤抖。当你靠近并抓住她那一大把浓密的头发，将她拖向指定的隔间时，她发出一声微弱的恐惧尖叫。当你准备设备时，她那嚎啕大哭的抽泣声仍未停止");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,295) == 1)
         {
            outputText("，并确保为她的乳房额外准备了四根管子");
         }
         outputText("。你漫不经心地伸出手，一把撕下她紧绷的衬衫，将背带裤的肩带从她肩上滑落，露出她那巨大的HH罩杯。尽管她极力抗议，但她那凹陷的乳头很快就挺立起来，兴奋的乳头不断溢出乳汁。你伸手打开机器，将“玛布尔”拖了过去。你知道真正的牛娘害怕被束缚，所以你非常乐意将她的替身的双手锁在两个悬挂的镣铐上，并将两个吸乳杯悬挂在她巨大的乳房前。吸力刚好足以将她的乳头吸向软管。当你将两个吸乳杯塞入时，她的抗议尖叫被一声压抑的哭喊所扼杀，机器瞬间启动。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,295) == 1)
         {
            outputText("另外四个吸乳杯也紧随其后，像饥饿的孩子一样吸附在乳头上。");
         }
         outputText("[pg]");
         outputText("随着挤奶机活塞的交替运动，玛布尔的整个身体都在摇晃，粗暴的挤奶感让她翻起了白眼。[say:停、停下，]她喘息着，大腿因几乎无法抑制的性奋而抽搐。你大笑着将她拉起，让她双蹄站立，身体弯成两半，她的胸部及其附属物几乎要擦到地面。她那如母牛般巨大的臀部在你面前高高翘起，因压抑的性奋而左右摇摆。你慢慢地，拉长了她高亢的抗议呻吟，将她的背带裤从臀部滑下，任其掉落在地板上。尽管她不断恳求，你还是将食指和中指探入她滴水的阴户，引得被绑住的牛娘倒吸一口凉气。[say:求求你，不、不要……我的小穴……]她呻吟着，徒劳地挣扎着，试图摆脱你的束缚。然而，玛布尔的反抗只会让你的[cocks]更加坚挺，你已经准备好惩罚她的无礼了。[pg]");
         outputText("你的手指深深陷入玛布尔的臀肉中，像揉捏顽固的面团一样推挤、揉捏着她的臀部。被绑住的母牛扭动着身体，她的性奋慢慢削弱了她对这种待遇的本能厌恶。没过多久，她那漏水的小穴就升级成了名副其实的淫液倾盆大雨，她那喋喋不休的抗议声时不时地被一句[say:操我！]或[say:求求你，勇者……]所打断。当你注视着你那几乎精神崩溃的精液母狗时，喉咙里发出一阵咯咯的笑声。带着一个特别邪恶的计划，你抓起[onecock]，对准她紧致的后穴。是时候走后门了！[say:不，亲爱的，不要！]她恳求着，颤抖得足以让她那仍在抽吸的挤奶机产生轻微的乳震。你停顿了一下，甚至松开了握住肉棒的手，她松了一口气。还没等她呼完气，你就在她眼前晃了晃你最新的发现；一个大漏斗，配有一根管子。当你把漏斗塞进她的喉咙，差点让她窒息时，她的抗议被打断了。当你拿出附近的另一个容器时，她的眼眶里涌出了泪水：一壶浓稠的乳白色物质。从那刺鼻的气味来看，那是牛头人的精液……而且还是新鲜的。令人上瘾的液体……好吧，也许她需要尝尝自己的“药”。[pg]");
         outputText("这一次，她可以成为<b>你</b>的奴隶。[pg]");
         outputText("当你开始将装满精液的容器倒入漏斗，用牛头人的精液将其装满时，玛布尔的眼睛瞪得大大的。就像一只过度热情的松鼠，当精液顺着她的喉咙流下并倒流回她的嘴里时，她的脸颊鼓了起来。除了胃，她没有其他出口，只能被迫吞下这令人作呕的液体，眼泪因你的对待而肆意流淌。你只是笑了笑，粗暴地捏住她的脸颊，让她暂时被这东西呛到，从嘴角滴出一点。对进展感到满意后，你退到她宽大的臀部后面，再次掰开她的臀瓣。撇开闷闷的尖叫声不谈，她暴露的臀部就是你需要的所有邀请。你再次抓起[onecock]，戳了她几下，然后直接插了进去，从她突然变得高亢的尖叫声中获得了变态的快感。令人惊讶的是，她的肛门以一种奇妙的方式屈服于你的阴茎；绝对算不上松弛，但也绝对没有阻碍你的前进。你想知道塞拉芙的表演对原型的还原度有多高；牛娘的肠道真的这么奇妙吗？你的胯部拍打着她丰满的臀瓣，你毫不犹豫地从她的深处抽离，然后再次狠狠地插进去。[pg]");
         outputText("玛布尔的乳头因持续不断的挤奶而变得红肿细长，肚子也因被迫吞下的牛头人精液而肿胀，她喉咙里发出低沉的哼声。她的理智现在肯定已经完全丧失了……她是你的性工具，你的奴隶，你的肉便器，她已经从抗议变成了公然鼓励。她的臀部随着你的节奏抽动，她的淫液因数量之多而溅满了你的双腿。在如此顺从、完美包容的肠道下，你很快就感觉到");
         if(get_player().balls > 0)
         {
            outputText("你的[balls]紧绷起来");
         }
         else
         {
            outputText("你的身体准备就绪");
         }
         outputText("，你蓄势待发，准备向她的深处进行最后一次冲刺。");
         var _loc2_:Number = get_player().cumQ();
         if(_loc2_ < 50)
         {
            outputText("她的屁股毫不费力地接纳了你的射精包，像什么都没发生一样把它舔舐干净。");
         }
         else if(_loc2_ < 250)
         {
            outputText("她因为你射入她屁股的精液量而呻吟了一声，但她似乎并不太在意。");
         }
         else if(_loc2_ < 750)
         {
            outputText("当你把精液射进她完美的后庭时，她的肚子实际上又鼓出了一点，但她唯一的反应是一声赞许的咕哝。");
         }
         else if(_loc2_ < 2000)
         {
            outputText("普通的女孩可能无法一次承受这么多精液，但“玛布尔”只是开心地挺着臀部，因为她的肚子被撑得至少和她的胸部一样大，以便为这些精液腾出空间。");
         }
         else
         {
            outputText("当你巨大的精液泵入她的体内时，她的整个身体都在狂喜中扭动，一波又一波的精液将她的肠道撑得满满的。当你完事时，她的肚脐已经凸出来了；更重要的是，它实际上已经擦到了谷仓的地板，如果她的双手是自由的，你毫不怀疑她会开心地抚摸它。");
         }
         if(_loc2_ >= 10000)
         {
            outputText("玛布尔的身体剧烈抽搐，甚至把漏斗都震掉了，管子也从她嘴里滑落。[say:亲爱的！]她尖叫着，在你的身上摩擦着，她的肚子向前隆起，里面装满了足以让整个地精城市繁衍数月的精液。[say:还要！]你刚好能满足她，让她那如波浪般翻滚的肚子淫秽地膨胀，用你的男子气概将她那乳白色的皮肤撑到了几乎破裂的边缘。即使你想拔出来，你也做不到，因为她的肠壁像这样紧紧夹住了你的[cock]。她的肚子实际上增加了足够的质量，几乎填满了整个隔间，把她的乳房推到了下巴上。");
         }
         if(get_player().cockTotal() == 2)
         {
            outputText("你的另一根肉棒喷射出");
         }
         else if(get_player().cockTotal() > 2)
         {
            outputText("你的其他肉棒喷射出");
         }
         if(get_player().cockTotal() > 1)
         {
            outputText("一股");
            if(_loc2_ < 50)
            {
               outputText("温和的");
            }
            else if(_loc2_ < 250)
            {
               outputText("大量的");
            }
            else if(_loc2_ < 750)
            {
               outputText("令人头晕目眩的");
            }
            else if(_loc2_ < 1500)
            {
               outputText("狂野的");
            }
            else
            {
               outputText("海量的");
            }
            outputText("精液喷洒在附近的隔间和设备上");
            if(_loc2_ >= 250 && _loc2_ < 1000)
            {
               outputText("，飞溅得到处都是");
            }
            else if(_loc2_ >= 1000 && _loc2_ < 3000)
            {
               outputText("，把周围都染成了白色");
            }
            else if(_loc2_ >= 3000)
            {
               outputText("，给周围覆盖上了一层厚厚的雪白");
            }
            outputText("。");
         }
         outputText("[pg]");
         outputText("终于发泄完毕，你从玛布尔的屁股里抽出身来，站直了身子，走到一边，看着这个牛娘堕落到了什么地步。挤奶机的储奶罐快要被你的精盆泵入的奶油撑爆了，但玛布尔本人却用沉重的眼皮盯着你。你甚至没有解开她的束缚，只是轻蔑地用脚踩在她的肚子上");
         if(_loc2_ >= 2000 && get_player().cor >= 66)
         {
            outputText("看着精液从她的屁股和嘴里流出来，你轻笑了一声");
         }
         outputText("。又观察了一会儿，你转过身，胜利地双手叉腰。你只是向牛娘道谢，她用满足的呻吟作为回应。突然，一声巨大的水花飞溅声——就像几加仑的液体突然被释放出来一样——传到你的耳朵里，谷仓闪烁着，褪色成你营地熟悉的景象。你感觉到一只手搭在你的肩膀上，你低头一看，看到一只奶油色的手，紫色的静脉在表面蔓延，慢慢爬上她的手指。[say:谢谢你，" + get_player().mf("主人","女主人") + "，]塞拉芙和蔼地回答，暗自窃笑。[say:你有一些怪癖需要解决，不是吗？我喜欢这样。][pg]");
         outputText("她的手松开了，你转过身去，却看到……什么也没有。她就这样消失了，消失得无影无踪。不……不是无影无踪，你意识到。就在挤奶机曾经放置的地方附近，放着一个孤零零的牛铃，躺在一滩你只能假设是精液的池子里。你伸手去拿，但它也消失了，变成了一小股烟雾，随风消散。[say:再见，亲爱的，]你恶魔奴隶那没有实体的声音在你耳边低语，嘲弄的语气中夹杂着进一步欢愉的承诺。");
         get_player().orgasm("Dick");
         dynStats(DynStat.Lib(1),DynStat.Sens(-5),DynStat.Cor(3));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function portalFuckWithFollowerCeraph() : void
      {
         ceraphSprite(true);
         clearOutput();
         var _loc1_:int = get_player().cockThatFits(100);
         var _loc2_:int = _loc1_ + 1;
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,438) == 0)
         {
            outputText("你脱下衣服，问塞拉芙有没有什么主意来点新花样。你的恶魔微笑着回答：[say: 哦，我想我正好有你需要的东西：我在集市上买到的一对小玩意。那里有个……天赋异禀的妓女，我很想把她收入我的后宫，但可惜，如果我要进入那个被诅咒的地方，我必须遵守他们的规矩。]说到这里，贪婪的恶魔女脸上掠过一丝阴霾，但她继续说道：[say: 我设法让她为我制作了两个神奇的阴茎环。它们被施加了强大的白魔法和黑魔法。]");
            outputText("[pg]塞拉芙会意地笑了笑，仍然没有透露它们的真正用途。你不耐烦地挥了挥手，命令她说完。她哼了一声，[say: 好吧，把所有的戏剧性都毁了！这些阴茎环能创造传送门，传送到使用者想去的任何地方。你可以戴上一个，只要想象一下，你的肉棒就能插进我的喉咙。你可以坐在那里的椅子上，用环自慰，同时还能操到我火热的小穴。]");
            outputText("[pg]你有些怀疑地看着金色的戒指，但塞拉芙向你保证，[saystart]相信我，它们很管用。我把其中一个调整到了完美适合我的尺寸，我经常用它来管教我的宠物，无论它们在我的巢穴的哪个角落——甚至在感觉剥夺舱里。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,288) == 1)
            {
               outputText("当然，你似乎不喜欢那个器官，所以我的戒指今天派不上什么用场了，不是吗？");
            }
            outputText("[sayend]");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,288) == 1)
            {
               outputText("塞拉芙把其中一枚戒指在手掌里转了转，它立刻在一阵紫烟中消失了。");
            }
            outputText("[pg]这个淡紫色的恶棍把戒指扔给你，上面还带着她的体温，并因为嵌入的魔法而微微刺痛。你在把简单的椅子上坐下，在手里翻转着它，然后决定采纳她的一个建议。[say: 奴隶！]你厉声喝道，[say: 躺在我面前，张开双腿。]");
         }
         else
         {
            outputText("你提议让塞拉芙拿出她那奇妙的附魔阴茎环，你的奴隶带着调皮的微笑，在一阵紫色的烟雾中变出了一对。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,288) == 1)
            {
               outputText("她有些伤感地将其中一个传送走，因为她知道你命令她为你保持女性的形态。");
            }
            outputText("这个淡紫色的恶棍把你的环扔给了你，上面还残留着她的体温，并因内含的魔法而微微刺痛。她请求道：[say:求你了，[Master]，像以前那样对我吧！你那样看着我，真是太性感了！]");
         }
         outputText("[pg]塞拉芙顺从地躺在你身下的地上，分开她那完美无瑕的紫色大腿，露出她的女性特征");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,288) == 0)
         {
            outputText("和渴望的肉棒");
         }
         outputText("。她把屁股挪上来，靠在你的[legs]和椅子前侧，一个诱人的心形屁股就在你触手可及的地方。你拍了它一下，换来了这个堕落荡妇的一声欢快的娇喘。");
         outputText("[pg]现在一切就绪，是时候见证奇迹了。你把环推到你的[cockHead " + _loc2_ + "]上，直到温暖的金属框架紧紧地固定在你的[sheath]上方。当它在你的手里时，你能感觉到的刺痛与它射穿你的[cock " + _loc2_ + "]的刺痛感相比，简直是小巫见大巫。它们并不令人不快，但确实很强烈，再加上环的紧绷感，让你保持着坚挺。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,438) == 0)
         {
            outputText("嗯，你的老二看起来没什么不同，除了底部卡着一个金色的装饰品。现在，如果它能齐根没入恶魔的小穴里，那就太棒了！");
         }
         else
         {
            outputText("好了，没必要浪费时间了！你低头看着塞拉芙湿润的肉穴，想象着你的老二刺穿她的褶皱。");
         }
         outputText("[pg]白光闪过，伴随着一阵刺痛感，在你的[cock " + _loc2_ + "]上的环下闪烁！你眨了眨眼，低下头，看到阴茎环中心里面有一个奇怪的奥术符号。那个闪烁的符文成了你突然变短、像高原一样的阴茎的终点。塞拉芙愉悦的娇喘声将你的视线拉得更低，你看到她的小穴上方也有一个匹配的符文，而你的[cock " + _loc2_ + "]的其余部分完全埋在她的湿润中。你不仅能看到它，你也能感觉到它。她湿润的紧致感包裹着你的粗壮，像手套包裹着手一样屈服于你的入侵。");
         outputText("[pg]你试探性地抓住环，稍微移动了一下。把它拿起来，你的老二就会从她的小穴里滑出一部分，随着符文被推开，更多的肉体神奇地出现在你的下体上。向下移动会减少你可见的勃起，但也会操到塞拉芙的小穴。恶魔的目光紧紧盯着她那被魔法照亮的肉穴，高兴地看着你试探性地在她湿透的肉穴里进进出出。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,288) == 0)
         {
            outputText("[pg]你的宠物也不甘示弱，她拿起另一枚指环，开始将其强行套在自己那根粗短的恶魔肉棒上。镀金的阴茎饰品稳稳地停留在她那丰满的小穴上方，伴随着同样的闪光，她自己的肉棒也消失了。令人惊讶的是，它并没有出现在你的任何孔洞中。你快速瞥了她一眼，发现她的肉棒竟然跑到了她自己的嘴里。塞拉芙那光泽诱人的嘴唇张成了一个大大的“O”型，一根粗壮的恶魔肉棒撑开了她的嘴，她正上下套弄着。贪婪的吮吸声和含糊的呻吟声从她自我口交的动作中传出，你兴奋地看着，同时用她的小穴自慰着。");
         }
         outputText("[pg]你充分利用了你的新玩具，把它拉到龟头下方，然后猛地插到底，一直插到你的[sheath]处。这种感觉和正常操她一样爽，但你不需要移动整个身体，可以更放松地享受这个过程。作为额外的福利，你可以看到你的宠物荡妇那紫色的下体嘴唇随着她越来越兴奋而泛起红晕，淫液从你粗壮的肉棒周围溢出，顺着她的股沟流下。你用空闲的手揉捏着奴隶那轮廓分明的脸颊，感受着它的重量、柔软和淫荡的颤动。你开始呻吟，这种享受超出了你的预期，让你无法减缓抽插的手。");
         outputText("[pg]汹涌的激情在你体内奔流，无法阻挡。伴随着一声沙哑的叹息，你释放了你的精液。这太神奇了，从这个角度，你不仅能体验到高潮，还能亲眼看着它发生。你可以看到你那脱离身体的肉棒底部随着每一次撑开尿道的射精而膨胀。[if (cumQuantity > 500) { 随着她的肚子鼓起，精液在她的嘴唇边起泡，你甚至能看到塞拉芙的肚脐突然凸了出来。}][if (cumQuantity > 1000) { 片刻之后，她的肚子进一步隆起，看起来完全像怀孕了一样。}][if (cumQuantity > 1500) { 浓稠的精液河流从恶魔那过度饱满的子宫中喷涌而出，因为它已经失去了进一步扩张的能力。}] 你叹了口气，漫不经心地上下移动着传送门，在恶魔那已经变成充满精液的泥泞小穴中抽插着。真是令人愉悦。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,288) == 0)
         {
            outputText("[pg]塞拉芙开心地咕噜了一声，然后她的脸颊鼓了起来。她的喉咙开始吞咽，你意识到她正把精液射进自己的嘴里。看她那像松鼠一样鼓起的脸颊，她几乎来不及吞下一口，下一口就把她塞满了，珍珠般的乳白液体从她的嘴角自由地流下。塞拉芙安静地一次又一次地吞咽着，直到她的肉棒终于开始变软，彻底耗尽了精力。");
         }
         outputText("[pg]你站起身伸了个懒腰，你的肉棒仍然紧紧地插在塞拉芙的小穴里。唉，天下没有不散的筵席，你慢慢地拔了一下，把指环从你的[cock " + _loc2_ + "]上取了下来（同时也将你的男性象征从她的小穴中拔出）。你把借来的物品扔回给她，让它落在你奴隶那起伏的胸膛上，她正试图恢复体力，在泥土中瘫成一团。你转身穿衣服，当你回头看时，塞拉芙已经不见了，直到你下次召唤她。");
         get_player().orgasm("Generic");
         dynStats(DynStat.Cor(1));
         awardAchievement("现在你搞上传送门了",164,true,true);
         var _loc3_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc3_,438,FlagDict_Impl_.arrayReadInt(_loc3_,438) + 1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function onAscend(param1:Boolean) : void
      {
         reset();
      }
      
      public function noZetsukoLoveToday() : void
      {
         var _g:Camp;
         clearOutput();
         outputText("你让她滚蛋；你想要的是塞拉芙，而不是一个连最基本的尊重都不懂的低贱奴隶。你命令她去告诉塞拉芙，别拿这种她自己都没本事调教好的无纪律仆人来浪费你的时间。[pg]");
         outputText("[say: 哦呵呵，女主人肯定会对绝子大发雷霆的……]她说着，舔了舔嘴唇，炫耀着她正常舌头上也钉满的无数舌钉。[say: 绝子等不及了……]");
         _g = get_camp();
         doNext(function():void
         {
            _g.campSlavesMenu();
         });
      }
      
      public function noUdderPlz(param1:Boolean = false) : void
      {
         clearOutput();
         if(param1)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,295,1);
         }
         outputText("你果断地摇了摇头，这就是她需要的唯一拒绝。[say: 当然了，亲爱的，那就不太像……玛布尔了，对吧？][pg]");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,295,0);
         postUdderChoice();
      }
      
      public function noFarmShitYet() : void
      {
         clearOutput();
         ceraphSprite();
         outputText("[say:很好，]她假笑着。[say:还有什么事吗？]");
         ceraphFollowerAppearance(false);
      }
      
      public function makeCarephsLackeysLeave() : void
      {
         var _g:Camp;
         clearOutput();
         outputText("你挥手赶走小恶魔，告诉他们你不感兴趣。其中一个小恶魔抗议道：[say:可是，" + get_player().mf("主人","女主人") + "——]你没等他说完就打断了他，说你要的是塞拉芙，不是什么人类女孩！然后，你把药水扔掉，让他们把女孩带走。[pg]");
         outputText("[say:是、是的，" + get_player().mf("主人","女主人") + "……]小恶魔们怯生生地回答，拉着项圈把女孩拖走了。");
         _g = get_camp();
         doNext(function():void
         {
            _g.campSlavesMenu();
         });
      }
      
      public function load(param1:int, param2:*) : void
      {
         Utils.extend(saveContent,param2);
      }
      
      public function layEggsInSlaveCeraph() : void
      {
         clearOutput();
         ceraphSprite(true);
         outputText("你");
         if(!get_player().isTaur())
         {
            outputText("心不在焉地抚摸着腹部敏感的隆起，同时");
         }
         outputText("注视着你的奴隶。她确实能为你做点什么。你傲慢地告诉她，你有一股存货想要处理掉，并且你打算把它种在她体内。");
         if(get_player().hasCock())
         {
            outputText("塞拉芙迅速瞥了一眼你[armor]上的隆起，然后端庄地垂下眼帘。她美丽的脸庞上浮现出一抹邪恶的微笑，回答道：[say: 是的，[master]。]");
         }
         else
         {
            outputText("塞拉芙皱着眉头瞥向你的胯部。然而，她训练有素，迅速回答了你，声音清脆：[say: 是的，[master]。]");
         }
         outputText("[pg]你命令她转过身弯下腰。你的恶魔奴隶急忙照做，肆无忌惮地向你展示她那被乳胶包裹的私处。那闪闪发光的布料勉强遮掩着私密部位；布条太窄了，你可以看到她丰满的外阴唇从两侧凸出来。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,288) == 0)
         {
            outputText("整个衣物在她那逐渐变硬的肉棒的压力下发出嘎吱声并紧绷着。");
         }
         outputText("[pg]你皱起眉头。你的荡妇知道你要把她当作产卵的容器；她怎么能指望你隔着内裤做这种事？你低吼着，抓住她扭动的尾巴下方那层透明乳胶的腰带，然后[if (strength < 80) {用力向上拉。|猛地向上拉，力量之大甚至让塞拉芙被比基尼下装吊在了半空中。}] [ceraphbus]尖叫起来，因为布料勒进了她私处柔软的肉里");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,288) == 0)
         {
            outputText("；由于无法将其束缚住，她的恶魔肉棒从侧面滑了出来，当你把那件碍事的衣物锯进她的胯部时，它淫秽地来回摇晃着");
         }
         outputText("。");
         outputText("[pg][say: 停下！] 当你粗暴地来回拉扯她的下装时，塞拉芙哭喊道，[say: 我会脱掉它们的，" + get_player().mf("主人","女主人") + "！对不起！]");
         outputText("[pg]你翻了个白眼，把她扔到地上。你知道如果她愿意，她只要一个念头就能让她的衣服蒸发，但你还是让她装模作样地、缓慢而痛苦地剥下下装，然后她才恢复原来的姿势，跪在地上，用她那圆润的紫色屁股对着你。");
         outputText("[pg]当你打量着奴隶身上的各种孔洞时，你的产卵管从鞘中滑出");
         if(!get_player().isTaur())
         {
            outputText("，当你抚摸它那分节的长度时，你的手指微微颤抖，从尖端到底部留下了一道润滑的粘液痕迹");
         }
         outputText("。当你命令你的恶魔荡妇向你展示她的小穴时，她将一只修剪得完美无瑕的手滑入大腿之间，为你张开她那深色、闪闪发光的阴唇。");
         outputText("[pg]当然，她能做得更好。你走上前，将一只[foot]踩在她的屁股上，把她的脸推向营地的泥土里。[say:再张大点，]你命令道。她弓起背，双手伸出；每只手抓住一片紫色的阴唇并拉开，向你露出她外阴的内部。你看到她的洞口大开，汁液横流，在大腿之间留下一长串粘液。");
         outputText("[pg]她做得更好了，但为什么不看看她能把她那堕落的身体发挥到什么程度呢？[say:再张大点！]你吼道。塞拉芙毫不犹豫地将手指滑入她湿透的肉穴里，把它拉开，直到你能看到她的内部。一片由各种深浅不一的紫色和黑色触手和肉瘤组成的森林，在她阴道的每一个内表面上蠕动着。看到它们移动确实让你感到有点恶心，但同时，你也不禁注意到从腹股沟蔓延开来的刺痛的性唤起。");
         outputText("[pg]在她的阴道深处，[ceraphbus]的子宫颈几乎在发光，比周围的肉体浅好几个色调。你笑了笑，命令她打开它。塞拉芙费力地咕哝着，但你看到了微小的裂缝扩张的景象，这算是对你的奖赏。恶魔的腐化能让生物的身体变得如此……顺从，这确实值得一提。");
         outputText("[pg]你站在奴隶身后，开始慢慢地将你的产卵管插入她体内。她的手指仍然拉开她的性器官，你只感觉到最长的肉瘤抚摸着你那异形的器官时带来的轻微瘙痒。当你的产卵管锥形的头部顶住她的子宫颈时，塞拉芙在你身下娇喘着。你几乎不需要施加任何压力就能进入她那堕落的子宫，因为它进一步滑开来欢迎你。当你感觉到腹部的肌肉收缩，从你体内深处带来第一枚卵时，你的呼吸变得粗重；你的恶魔妓女感觉到你的器官底部肿胀，把她的屁股在你的臀部上摩擦，她简直要疯了。");
         outputText("[pg]当你的卵向你的顶端移动时，它们使你的器官肿胀，直到它摩擦到她扩张的小穴两侧。感觉就像那滚烫的肉体试图闭合，像嘴一样包裹着你的假阳具，发出淫秽的吸吮声，并滴下你和你的奴隶混合的泡沫状润滑液。");
         outputText("[pg]这种感觉让你无法忍受，当你把第一枚卵射入塞拉芙体内深处时，你高潮了。");
         if(get_player().get_gender() > 0)
         {
            outputText("你的高潮溅到了你那堕落恶魔的后背上，增加了你的产卵管留下的湿透的混乱。");
         }
         outputText("更多的卵紧随其后，每一枚卵填满她时，都会引发你荡妇的微型高潮。她尖叫着，颤抖着，但小心翼翼地不松开她的小穴。你看着她的肚子因你的卵而膨胀，心想，真是个体贴的奴隶。随着塞拉芙迅速从臃肿变成怀孕，再到被填满到快要爆炸，人造紧身胸衣融化了。在几十枚卵的压力下，塞拉芙的胃部表面实际上微微起伏着。");
         outputText("[pg]终于，在经历了仿佛永恒般的几分钟后，你感到身体被掏空了。你告诉你的奴隶你要拔出来了，如果她敢让她那被撑开的小穴漏出一个卵，你就会把她的洞缝起来。你那疲软的产卵管从她被塞满的阴户中滑出，伴随着一股润滑液的涌出。虽然塞拉芙的肉缝淫荡地向你敞开着，但你很自豪地看到她成功地把你所有的卵都留在了体内。你拍了拍这个荡妇敏感的阴户，让她喘息着痉挛起来。");
         outputText("[pg]你哼着欢快的小曲，绕着塞拉芙抽搐的身体走了一圈，然后抓起她的一把头发，把她从地上拉了起来。她的脸上沾满了泥土，那双闪闪发光的、宝石般的眼睛毫无意识地盯着你。你把产卵管在她的头上蹭了蹭，小心翼翼地把混合着润滑液的体液擦在她的头发上，然后才把器官缩回包皮里。[say: 就这样吧，]你对她说，她梦幻般地对你笑了笑。你转过身去收拾你的东西，头也不回地离开了。");
         get_player().dumpEggs();
         get_player().orgasm("Ovi");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function idLiddellium() : void
      {
         var _g:CeraphFollowerScene;
         clearOutput();
         outputText("在外面冒险的时候，你在一个恶魔营地里发现了一瓶奇怪的药水。你为什么会在那里并不重要，但这是什么东西？作为拥有自己后宫的强大恶魔，塞拉芙肯定知道一些关于恶魔营地常见设施的事情。");
         outputText("[pg]你的[ceraphbus]奴隶接过药水，稍微看了一下就还给了你。[say:那是利德尔药水，我的[Master]。我们这些独立的领袖通常会备上一瓶，以防需要对追随我们的恶魔进行更严厉的惩罚。它会剥夺他们所有的性特征，抽干他们的力量，让他们变成一个可怜的小女孩。][pg]原来那些爱丽丝都是这么来的。真是个新奇玩意儿，也许你能用它找点乐子。也许塞拉芙可以演示一下它的效果？[pg]恶魔紧张起来。[say:不，不，我真的承受不起。代价太大了，我还有追随者和宠物<b>必须</b>照顾！对不起，我尊重你的意愿，但这对来说我太过分了。]");
         outputText("[pg]你轻笑了一声。好吧，处理她后宫陷入混乱的麻烦事实在太多了。暂时，你还是不实施那个惩罚了。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2727,-1);
         _g = this;
         doNext(function():void
         {
            _g.ceraphFollowerAppearance();
         });
      }
      
      public function iQuitCeraphCorruptionDemons() : void
      {
         clearOutput();
         outputText("你大声并明确地告诉她，你对和她玩过家家没有兴趣，下次塞拉芙可以自己来，或者带一个真正的无辜者来让你腐化。[pg]");
         outputText("她懊恼地展开翅膀飞走了，小恶魔们也迅速萎靡不振地跟了上去。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,293,1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function helpWithFarm() : void
      {
         clearOutput();
         ceraphSprite();
         outputText("你问塞拉芙是否能帮你打理你最近获得的农场。");
         outputText("[pg][say:您是说在农场干活？别开玩笑了，[name]！]她咯咯地笑了起来，但在看到你的表情后咳嗽了一声掩饰。[say:我不认为我或我的任何宠物适合务农，]她敲着下巴说道。[say:或者至少不是您想的那种。但如果您愿意，我可以将那个地方标记为受恶魔保护。我只能做一次，]她警告说。[say:而且它最终会失效。]");
         menu();
         addButton(0,"做吧",doFarmShit);
         addButton(1,"稍后",noFarmShitYet);
      }
      
      public function goThroughWithCeraphUnfetishification() : void
      {
         var _g:CeraphFollowerScene;
         clearOutput();
         spriteSelect(SpriteDb.get_s_ceraphClothed());
         outputText("塞拉芙走近了一些，她闪亮的衣服因为移动而发出吱吱声。她的手轻轻地触摸你的额头，尽管她试图避免与你目光接触。这个顺从的荡妇低垂着眼睛，正如一个奴隶应有的那样，她开始揉搓你的太阳穴，施展她的魔法来消除她的恶作剧。温暖涌出，冲过你的太阳穴，留下一种松弛的感觉。塞拉芙咕哝了一声，松开手，踉跄着后退，喘着粗气。她嘟囔着：[say:太难了……在不改变……其他东西的情况下拿走那些。][pg]");
         outputText("过了一会儿，她似乎恢复了，她问道：[say:您还需要我在这里做什么吗，" + get_player().mf("主人","女主人") + "，还是您只是想浪费我的时间？][pg]");
         if(get_player().cor < 33)
         {
            outputText("看来在塞拉芙所有的顺从之下，仍然有一丝火花。");
         }
         else if(get_player().cor < 66)
         {
            outputText("你叹了口气，想知道是否应该因为她如此顶嘴而惩罚她。");
         }
         else
         {
            outputText("你因为她的鲁莽而扇了她一巴掌。");
         }
         dynStats(DynStat.Tou(-1),DynStat.Cor(1));
         get_ceraphScene().removeFetish();
         _g = this;
         doNext(function():void
         {
            _g.ceraphFollowerAppearance();
         });
      }
      
      public function goOnATrotWithCeraph() : void
      {
         clearOutput();
         ceraphSprite(true);
         registerTag("ceraphHasDick",TagFun_Impl_.fromBool(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,288) == 0));
         outputText("塞拉芙虽然是你的奴隶，但她并不和你住在一起，一个好[master]应该花更多的时间和[his]奴隶在一起。这只[ceraphbus]饶有兴趣地顺着你的思路想下去。你用后腿敲了敲地面，告诉塞拉芙和你一起去散步——你甚至会背着她！");
         outputText("[pg][say:[Master]，您真好，]她说着，把手放在你的大腿上，假装不知道。[say:[if (isCentaur) {我一直想多骑骑马|我想我以前从来没见过[b:这些]上面有骑手}]。]她可以说是在害羞，或者有点讽刺，但你对突然甩到你背上的“马鞍”嗤之以鼻。更像是一个挽具。[say:当然，作为我的[Master]，缰绳是给您牵的，]她说着，把它递了过来。");
         outputText("[pg]塞拉芙爬到你身下，用她温暖柔软的皮肤摩擦着你的下腹，将她的脚踝绑在你的侧腹，手腕绑在你的肋骨上，腹部朝下紧紧地固定在原位。她小穴的温度唤醒了你的[cocks]，让这只[ceraphbus]咯咯笑了起来。[say:我准备好去散步了，[Master]。]");
         outputText("[pg]你扭动着你的第二根脊柱，让自己舒服一点，然后拉起缰绳，把你戴着挽具的奴隶从你的腹股沟拉开，同时你试图盲目地对齐自己。[if (cockLength > 12) {你的长度惊人，你必须抓住皮革较低的地方才能把她拉得更远，然后她|她}]毛绒绒的屁股和大腿压在龟头[if (multicock) {们}]和冠状沟上，你试探着进入。当[if (multicock) {[if (cocks=2) {两个|两根}]龟头|你的[cockhead]}]落在她的[if (multicock) {洞|小穴}]上时，你们俩都感到一阵解脱。仅仅是感觉到这个女人在你的肚子上颤抖，以及她和你一样期待着这一切时逐渐平缓的呼吸，就已经很刺激了。最后，你猛地一插，让她沉在你的[cocks]上，她天鹅绒般柔软的肉体火热地包裹着你的阴茎[if (multicock) {们}]。你越插越深，压迫着她体内的轮廓，直到你插到底。");
         outputText("[pg]当你向前迈步时，一声愉悦的呻吟响起，下一步开始让你意识到，在你的双腿之间有一个尽职尽责的奴隶是多么温暖[if (height < 60) {——如果她这么大有点尴尬的话}]。塞拉芙向后仰起头，用她的角戳着你动物形态的胸骨，你不满地跺了跺脚。[say:抱歉，[Master]，我太享受在您身下的位置了，]她说。作为报复，你的下一步伴随着臀部的重重一挺，猛地撞进她饥渴的深处。照这个速度，散步走不了多远，你更加从容地出发，尽管肉便器随着动作来回摆动，把你的鸡巴[if (multicock) {们}]拖向两侧，你还是小跑着。以这种方式旅行，似乎空气都变得更新鲜了。");
         outputText("[pg][say:我希望这[sun]光下的漫步能合您的心意，]她轻快地说。塞拉芙像蛇一样扭动着身体让自己舒服，明显是故意旋转着来抚摸你。[say:上面有什么好风景吗？]为了迁就她，你把一只[foot]放在石头上，站得更高，同时拉着缰绳，拖着她，直到你几乎拔出来看风景。在你放下手臂让她在挽具里摇晃，瞬间插到底之前，她有一刻的时间环顾四周。");
         outputText("[pg]你埋在色欲恶魔的[if (multicock) {屁股和}]小穴里的时间越长，你体内的欲火就烧得越旺。在欲望的驱使下，你跳下石头，开始跑得更快。这是一段颠簸的旅程，塞拉芙被抛上抛下，很快你就开始疾驰，只是为了增加每次抽插的冲击力。恶魔像个廉价荡妇一样喘息着。来到一块大圆石前，你冲向它并直立起来，把你的前[feet]放在石头上。在重力的帮助下，你拉起缰绳，然后快速放下，让塞拉芙在你的[cocks]上疯狂地弹跳。[if (ceraphHasDick) {她的鸡巴疯狂地旋转弹跳，洒下一道道淫液，她|她}]用力地呻吟着，绷紧带子，每次挺动都把屁股推向你。");
         outputText("[pg]你奴隶的尾巴在你的[if (hasBalls) {[ballsack]周围轻弹，并轻轻拉扯它，仿佛在给你挤奶|腿上深情地缠绕，仿佛要把你们俩锚定在一起}]，你积聚力量，尽可能用力地捣进她体内，[if (hasknot) {在荡妇体内成结，并}]在她被刺穿的顶峰爆发出高潮。然而，停在原地，你继续被骑着；塞拉芙拉着带子把自己抬起来，然后猛地坐下，榨干你的每一滴精液。");
         get_player().orgasm("Dick");
         dynStats(DynStat.Cor(0.25));
         doNext(finishTheTrot);
      }
      
      public function giveFollowerBodyBits() : void
      {
         var _g4:CeraphFollowerScene;
         var _g3:CeraphFollowerScene;
         var _g2:CeraphFollowerScene;
         var smallest:Boolean;
         var _g1:CeraphFollowerScene;
         var _g:CeraphFollowerScene;
         var _loc1_:int = 0;
         spriteSelect(SpriteDb.get_s_ceraphClothed());
         clearOutput();
         outputText("你问塞拉芙交出一个身体部位到底意味着什么。你那顺从的恶魔荡妇紧贴着你，双手在你的[armor]下抚摸着，回答道：[saystart]嗯，[Master]，我会用我变移身体的黑魔法移除你身上的一小部分“乐趣部位”，如果你明白我的意思的话。");
         if(get_player().hasCock() || get_player().hasVagina() || get_player().hasBreasts())
         {
            if(get_player().hasCock())
            {
               outputText("我可以拿走你的肉棒。");
            }
            if(get_player().hasVagina())
            {
               outputText("我可以移除你的小穴。别担心，一旦它从你身上取下来，我放进去的任何东西都不会进入你的子宫。");
            }
            if(get_player().hasBreasts())
            {
               outputText("如果你愿意，我甚至可以带走你的奶子。");
            }
         }
         else
         {
            outputText("遗憾的是，你现在没有任何值得拿走的东西。真是太可惜了，我的[Master]。");
         }
         outputText("[sayend]");
         menu();
         if(get_player().get_gender() > 0 || get_player().biggestTitSize() >= 1)
         {
            outputText("[pg]当她喋喋不休地说着，变得越来越兴奋，甚至有些发情时，你挠了挠头。[say: 然后，我可以飞回后宫，把它们加入我的收藏。我的宠物们非常喜欢我给她们装上异国情调的器官，然后整晚都在挑逗它。你能想象吗？晚上上床睡觉，梦见我和我的奴隶们一遍又一遍地做着所有那些淫乱的事情？]");
            outputText("[pg]嗯，她这番说辞还挺有说服力的。你想给她点什么吗？[pg]");
            menu();
            addButtonDisabled(0,"阴茎");
            addButtonDisabled(1,"Smallest Penis");
            addButtonDisabled(2,"小穴");
            addButtonDisabled(3,"胸部");
            if(get_player().hasCock())
            {
               outputText("[pg]你可以给她你的[if (cocks == 1) {penis|biggest penis or smallest penis}]。");
               _g = this;
               addButton(0,"肉棒",function():void
               {
                  _g.ceraphFollowerCockTaking();
               });
               if(get_player().cockTotal() > 1)
               {
                  _g1 = this;
                  smallest = true;
                  addButton(1,"最小肉棒",function():void
                  {
                     _g1.ceraphFollowerCockTaking(smallest);
                  });
               }
            }
            if(get_player().hasVagina())
            {
               outputText("[pg]你的阴道在塞拉芙的群交派对中被使用时，可能会给你带来最奇妙的快感。");
               addButton(2,"阴道",ceraphFollowerCuntTaking);
            }
            if(get_player().biggestTitSize() >= 1)
            {
               outputText("[pg]你真的需要你的乳房吗？");
               _g2 = this;
               addButton(3,"乳房",function():void
               {
                  _g2.ceraphFollowerTitTaking();
               });
               if(get_player().bRows() > 1)
               {
                  _loc1_ = 1;
                  while(_loc1_ < get_player().bRows() && _loc1_ < 10)
                  {
                     if(get_player().breastRows[_loc1_].breastRating >= 1)
                     {
                        addButton(3 + _loc1_,"乳房排" + _loc1_,(function(param1:Array, param2:Array):Function
                        {
                           var _g:Array = param1;
                           var rowNum:Array = param2;
                           return function():void
                           {
                              _g[0].ceraphFollowerTitTaking(int(rowNum[0]));
                           };
                        })([this],[_loc1_]));
                     }
                     _loc1_++;
                  }
               }
            }
            _g3 = this;
            addButton(14,"返回",function():void
            {
               _g3.ceraphFollowerAppearance();
            });
         }
         else
         {
            _g4 = this;
            doNext(function():void
            {
               _g4.ceraphFollowerAppearance();
            });
         }
      }
      
      public function get_debugName() : String
      {
         return "塞拉芙";
      }
      
      public function get_debugHint() : String
      {
         return "";
      }
      
      public function getTonguedByZetsuko() : void
      {
         clearOutput();
         var _loc1_:int = -1;
         if(get_player().hasCock())
         {
            _loc1_ = get_player().biggestCockIndex();
         }
         outputText("当你盯着绝子双腿间蠕动的奇异器官时，热流涌向你的腹股沟，你感到自己因为期待而湿润了。为了进一步引诱你，她向后翻滚，将大部分重量放在肩膀上，下半身蜷曲在空中，她的舌头在自己的大腿上滑来滑去。[pg]");
         outputText("[say: 拜托了，让绝子尝尝女主人的小穴吧？]她说着，在你走近时对你咧嘴一笑。[say: 她确信她的舌头能让女主人非常舒服……][pg]");
         outputText("那个淫荡的器官向你滑来，抚摸着你" + get_player().vaginaDescript(0) + "的外阴唇，温柔地戳弄着你的[clit]，然后退去，做出了一个只能被描述为[say: 过来]的动作。你向前迈了一步，将臀部压在她厚实的屁股上，她的舌头立刻向你的腹股沟卷去，");
         if(_loc1_ >= 0)
         {
            outputText("缠绕住你的" + get_player().cockDescript(_loc1_) + "，短暂地挤压了一下，然后");
         }
         outputText("径直朝着你的肉缝而去。[pg]");
         outputText("当舌尖开始探测你的深处时，你能感觉到她舌头表面覆盖着数百个微小的凸起和颗粒，赋予了它不可思议的质感。当这个肌肉发达的器官在你体内推得更深，弯曲扭曲成各种形状以增强强烈的快感时，你忍不住发出一声淫荡的呻吟。[pg]");
         if(_loc1_ >= 0)
         {
            outputText("绝子以一种令人印象深刻的柔术动作，将脚伸向她的腹股沟来刺激你的[cocks]，用她的脚趾将");
            if(get_player().cockTotal() == 1)
            {
               outputText("它");
            }
            else
            {
               outputText("它们");
            }
            outputText("抬起，并沿着肉棒的下侧抚摸");
            if(get_player().cockTotal() > 1)
            {
               outputText("");
            }
            outputText("用她的脚底。她的脚趾出奇地灵巧，能够卷曲起来轻轻抓住你的" + get_player().cockDescript(_loc1_) + "，温柔地捏着和拉扯着龟头下方的皮肤，摆弄着你跳动的肉棒");
            if(get_player().cockTotal() > 1)
            {
               outputText("");
            }
            outputText("几乎就像她用手一样熟练！[pg]");
         }
         outputText("你将臀部向前滑动，使她的身体进一步向后蜷缩，将你的重量压在她柔软的屁股上，骑在她的舌头上，狂喜地颤抖着。你能感觉到它在探测你的深处，滑入你的体内，填满每一个角落和缝隙，因为它膨胀并沿着你的肉壁流动，占据你所有的空间。她对它的控制程度简直令人难以置信，变粗以撑开你的" + get_player().vaginaDescript(0) + "，然后突然缩回，卷成一个螺旋状的触手，淫荡地钻探着你的小穴。[pg]");
         outputText("[say: 哦哦，女主人的小穴真美味！][pg]");
         outputText("你抓住她的大腿，开始在她的舌头上前后摇摆，当你感觉到它现在开始在你体内抽插时，你发出了强烈的呻吟。器官中心排列的无数凸起开始紧紧压在你" + get_player().vaginaDescript(0) + "的顶部，刺激着你的G点，并在她舌头每次潜回你体内时弹拨你的[clit]。你的手指现在像老虎钳一样掐进她的肉里，你在那根淫荡的触手上磨蹭着，淫荡地呻吟着，高潮的浪潮开始淹没你。[pg]");
         outputText("你的" + get_player().vaginaDescript(0) + "紧紧地绞住绝子的舌头，在你享受高潮余韵时，它还在你体内蠕动着。");
         if(_loc1_ >= 0)
         {
            outputText("" + get_player().SMultiCockDesc() + " 在她的双脚之间有力地抽动着，");
            if(get_player().cumQ() <= 100)
            {
               outputText("喷出一股健康的滚烫精液，洒满了她的脸和胸部。");
            }
            else if(get_player().cumQ() <= 500)
            {
               outputText("明显地膨胀起来，开始喷出浓稠的精液，洒满她等待的脸庞和乳房。");
            }
            else
            {
               outputText("释放出大量的精液，洒满她的脸和乳房，浸透了她的拘束服，用你浓稠的精液把她的头发粘在一起。");
            }
            outputText("她淫荡地咧嘴一笑，张开嘴，露出另一条长得离谱的带钉舌头，用它饥渴地舔舐你的精液，把自己清理干净。[say: 主人的精液真好吃……]");
         }
         outputText("[pg]");
         outputText("你高潮时分泌的滑腻汁液顺流而下，在绝子大张的阴道里汇聚成一滩");
         if(get_player().wetness() >= 4)
         {
            outputText("并溢出来，顺着她丰满的臀部和肚子滴落");
         }
         outputText("。你听到一阵奇怪的咕噜声，看着那滩汁液慢慢地流入她的阴道，一个明显的吞咽动作将它带入她体内。[say: 嗯嗯嗯……绝子喜欢主人汁液的味道……][pg]");
         outputText("完全释放后，你向后退去，用手抓住绝子仍在扭动的舌头，把它从你体内滑出来，让她的下半身砰地一声落在地上。你看着她的舌头在阴唇周围轻轻打转，然后缩回那个奇异的孔洞里，看起来就像一个普通的——如果稍微有点过度拉伸的——小穴。你犹豫着要不要扶她起来，但就在你考虑伸手拉她起来的时候，她突然被堕落的火焰包围，在你眼前消失了。[pg]");
         outputText("[say: 绝子希望能再次品尝到" + get_player().mf("主人","女主人") + "的味道……]");
         get_player().orgasm("Vaginal");
         dynStats(DynStat.Lib(0.25),DynStat.Sens(-5),DynStat.Cor(2));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function getLiddellium() : void
      {
         var _g2:CeraphFollowerScene;
         var _g1:CeraphFollowerScene;
         var _g:CeraphFollowerScene;
         var _loc2_:* = null as Function;
         var _loc3_:* = null as String;
         var _loc1_:Boolean = false;
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2730) == 0)
         {
            outputText("既然利德尔药水对恶魔领主来说算是家常便饭，那塞拉芙能不能提供一些呢？[say:想和手下找点乐子吗？这可是非常昂贵的物品，但我很乐意为我的[Master]提供。毕竟，任何恶魔领主都会随身备着一瓶。]塞拉芙从身后拿出一瓶药水，仿佛凭空变出来的一样。[say:不过我必须警告你，我和大多数人一样，手头只留一瓶。它们非常昂贵且危险。留一瓶作为威慑很好，需要时也能方便使用。我会去弄更多的，但至少一周内我不会有第二瓶了。]那就这样吧。免费获得一种高级变形药水也是一笔相当划算的交易。你把利德尔药水放进了你的[inv]里。");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2730,168);
            _g = this;
            _loc2_ = function():void
            {
               _g.ceraphFollowerAppearance();
            };
            get_inventory().takeItem(get_consumables().LIDDELL,_loc2_);
         }
         else
         {
            _loc3_ = "你告诉塞拉芙你想要更多的利德尔药水。\n\n";
            _loc1_ = false;
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2730) == 1)
            {
               _loc3_ += "塞拉芙从身后拿出一瓶药水，她那非欧几里得的空间控制能力让你感到迷惑。[pg][say:希望你玩得开心，[Master]。][pg]";
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2730,168);
               _loc1_ = true;
            }
            else
            {
               _loc3_ += "塞拉芙道了歉，承认她现在没有利德尔药水了。";
            }
            outputText(_loc3_);
            if(_loc1_)
            {
               _g1 = this;
               _loc2_ = function():void
               {
                  _g1.ceraphFollowerAppearance();
               };
               get_inventory().takeItem(get_consumables().LIDDELL,_loc2_);
            }
         }
         if(!_loc1_)
         {
            _g2 = this;
            doNext(function():void
            {
               _g2.ceraphFollowerAppearance();
            });
         }
      }
      
      public function getCeraphFollowerPiercing() : void
      {
         var _g:Combat;
         clearOutput();
         ceraphSprite(true);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,286,1);
         outputText("你向你的新荡妇露出腰腹，带着");
         if(get_player().cor < 40)
         {
            outputText("一丝犹豫。");
         }
         else
         {
            outputText("一抹得意的笑，确信她已经彻底落败。");
         }
         outputText("塞拉芙扭动着身子凑上前来，将那枚油滑的脐钉抵在你的腰腹上，用手掌将其按入你的体内。一阵刺痛的温热感转瞬即逝，紧接着是一阵邪异的麻木酸痛。当恶魔移开手时，你的肚脐上已经镶嵌了这枚魔法首饰，它似乎在发光，又似乎没有。[pg]");
         outputText("没有挥之不去的强迫感，也没有精神上的攻击，仅仅只是多了一个穿环。你对她的举动感到有些不可思议——尽管她看起来很真诚，但你内心深处的一小部分仍然认为，这个痴迷于性癖的恶魔是在利用这一切设局欺骗你。[pg]");
         outputText("塞拉芙问道，[say: " + get_player().mf("Master","Mistress") + "，在你走之前，你想不想用以前的方式，最后再操一次你的荡妇？]");
         menu();
         addButtonDisabled(0,"操她");
         addButtonDisabled(1,"骑乘她");
         addButtonDisabled(2,"操她的屁股");
         if(get_player().get_lust() >= 33)
         {
            outputText("你要对她为所欲为吗？（如果是的话，你要用哪个身体部位来做？）");
            if(get_player().hasCock())
            {
               addButton(0,"操她",get_ceraphScene().maleFuckCeraphsPussy);
               if(get_player().cockThatFits(get_monster().analCapacity()) != -1)
               {
                  addButton(2,"操她的屁股",get_ceraphScene().buttRapeCeraph);
               }
               else
               {
                  addButtonDisabled(2,"操她的屁股","你根本塞不进她的屁股——你太大了。");
               }
            }
            if(get_player().hasVagina())
            {
               addButton(1,"骑乘她",get_ceraphScene().rideCeraphsCockLikeaBAWSSexclamation11eleven);
            }
         }
         _g = get_combat();
         addButton(14,"离开",function():void
         {
            _g.cleanupAfterCombat();
         });
      }
      
      public function fuckZetsukosTonguepussy() : void
      {
         clearOutput();
         var _loc1_:int = get_player().biggestCockIndex();
         outputText("你的欲望和好奇心战胜了理智。看着那条淫荡的舌头在她双腿间扭动，你的下体涌起一阵热流，血液冲向你的[cocks]。绝子平躺在地上，仰头冲你笑着，她的小穴期待地自我舔舐着。当你俯下身时，她的舌头伸得更长了，开始缠绕住[onecock]，用她那类似唾液的汁液涂抹着它。你敏感的肉棒能感觉到她舌头表面布满了成百上千微小的凸起和颗粒，按摩着你的柱身。舌头上的一排排舌钉性感地摩擦着你，这个奇异的器官像蛇一样盘绕着你的" + get_player().cockDescript(_loc1_) + "，舌尖在你的尿道口边缘轻轻刺激着。[pg]");
         outputText("你惊叹于她对舌头不可思议的控制力，看着它开始在你的柱身上抚摸、挤压，从根部到龟头都涂满了黏滑的唾液。它紧紧地缠住你，你能感觉到它在轻轻地向下拉扯，将你的" + get_player().cockDescript(_loc1_) + "拉向她的入口。当你靠近时，她的阴唇张开，像一张饥饿的嘴一样大张着。随着它的张开，你可以看到她小穴的内壁上有一排排柔软的凸起结节，呈螺旋状向下排列。[pg]");
         outputText("[say: 绝子等不及要让" + get_player().mf("主人","女主人") + "的肉棒插进她的小穴了……她知道" + get_player().mf("主人","女主人") + "一定会喜欢的……]她说着，扭动着臀部，将你拉向她的入口，她的嘴唇轻轻地吸吮着龟头。");
         if(get_player().cockArea(_loc1_) >= 100)
         {
            outputText("你很好奇她打算怎么把你塞进去，但现在你也做不了什么。你只能相信她知道自己在做什么，不管她是不是疯了。");
         }
         outputText("当你开始揉捏她那对巨大的、颤动着的乳房时，你一直低头看着她的舌头在你的肉棒上滑动，伸展开来，然后紧紧地挤压。它开始收缩，这个动作将你肉棒的前一英寸左右挤了进去。她发出一声呻吟，一遍又一遍地重复着这个动作，每次都将你拉进去一点。[pg]");
         outputText("没过多久，你");
         if(get_player().cockArea(_loc1_) >= 100)
         {
            outputText("不知怎么的");
         }
         outputText("发现自己已经齐根没入了这个质地奇特的孔洞中，而她的舌头则在你的肉棒下方滑动。它在你的下方卷曲，");
         if(get_player().balls > 0)
         {
            outputText("滑过你的[balls]，");
         }
         else if(get_player().hasVagina())
         {
            outputText("温柔地舔舐着你阴唇的外侧，");
         }
         outputText("一路向后，");
         if(get_player().balls > 0 || get_player().hasVagina())
         {
            outputText("并且");
         }
         outputText("轻轻地挑逗着你的[asshole]。你双手各抓起她一团柔软的乳肉，开始色情地揉捏，用拇指轻轻按压她穿环的乳头，而她的舌头则继续舔舐和取悦着它能触及的一切。[pg]");
         outputText("[say: 哦——哦！" + get_player().mf("主人","女主人") + "的肉棒在绝子的小穴里尝起来真棒！]她呻吟着，翻着白眼，你感觉到她开始深深地[say: 吸吮]你的" + get_player().cockDescript(_loc1_) + "，前后摇晃着她的臀部。她那流着口水的小穴里的吸力，感觉就像你体验过的最强烈的深喉一样，你甚至有一瞬间忘记了这是来自她的阴道，直到绝子发出迄今为止最响亮的呻吟声，才把你拉回现实。[pg]");
         outputText("决定给这个疯狂的荡妇一点报复，因为她如此粗鲁地打断了你的幻想，你伸出手，开始轻轻地扭动她乳头上的乳钉，像个疯子一样咧嘴笑着，因为这种感觉让她那流着口水的小穴突然紧紧地夹住了你。[pg]");
         outputText("[say: 啊！是的，" + get_player().mf("主人","女主人") + "！惩罚坏绝子吧！还要，还要，求求你！][pg]");
         outputText("随着你继续折磨她的乳头，她狂喜地弓起背，开始疯狂地扭动，她的小穴舌头现在不规则地拍打着，把口水汁液甩得到处都是。她正常嘴里的舌头现在也伸了出来，长得足以碰到她的胸部，她翻着白眼，脸上带着幸福的笑容。你能感觉到你的高潮即将来临，显然绝子也能感觉到，因为她在呻吟间大喊：[say: 啊！" + get_player().mf("主人","女主人") + "，把你好吃的精液给绝子吧！][pg]");
         outputText("以她现在小穴和舌头挤压你的方式，几乎不可能不满足她的要求。你的" + get_player().cockDescript(_loc1_) + "在她体内抽搐，释放出奶油般的洪流，导致绝子开始从两端流口水。[say: 哦……太棒了，太浓了，太滑了……把绝子填满，是的！]");
         if(get_player().cumQ() <= 100)
         {
            outputText("你的高潮结束得比绝子预想的要快，最后几股稀薄的精液喷射进她的小穴里。她的小穴似乎吸得更用力了，仿佛想再榨出几滴来。");
         }
         else if(get_player().cumQ() <= 500)
         {
            outputText("你将浓稠的精液射入她的体内，满足着她那似乎永远无法填满的对精液的渴望，她的小穴紧紧夹住你，榨取着每一滴精华。她的舌头缠绕着你的肉棒，在她的体内顺着长度挤压，迫使你尿道里剩余的液体流出，而她阴道内强烈的吞咽动作则将你浓稠的精液带走。");
         }
         else
         {
            outputText("她小穴强烈的吸吮动作榨干了你肉棒里的一切，贪婪地吞咽着你一波又一波滚烫的精液。即使她的腹部开始因为你精液的体积而膨胀，向外鼓起成一个沉甸甸、晃动着的肚子，她的肉壁仍在继续榨取你。当你的高潮终于结束时，绝子看起来就像怀孕了好几个月，脸上带着极其满足的神情。[say: 嗯嗯嗯啊啊啊啊……绝子……吃饱了。]");
         }
         outputText("[pg]");
         outputText("当你拔出时，她的小穴继续温柔地吸吮着你，当你的" + get_player().cockDescript(_loc1_) + "终于从她那奇异的爱穴中拔出时，她的舌头在阴唇周围温柔地打转，然后缩回体内。你后退一步，正想着是否应该扶起被绑住的狐妖，但就在你考虑的时候，她对你露出一个疯狂的笑容，突然沐浴在紫色的火焰中，在你的眼前消失了。[pg]");
         outputText("[say: 绝子希望能再次品尝到" + get_player().mf("主人","女主人") + "的味道……]");
         get_player().orgasm("Dick");
         dynStats(DynStat.Lib(0.25),DynStat.Sens(-5),DynStat.Cor(2));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function fuckFollowerCeraphsVagoo() : void
      {
         var _loc1_:int = get_player().cockThatFits(115);
         if(_loc1_ < 0)
         {
            _loc1_ = 0;
         }
         var _loc2_:int = get_player().cockThatFits2(115);
         clearOutput();
         ceraphSprite(true);
         outputText("你让塞拉芙知道你要用她的小穴。她叹了口气说，[say:是的，" + get_player().mf("Master","Mistress") + "，]无法掩饰她语气中的失望。塞拉芙动了动，她衣服上的内裤褪去，露出她滴水的阴户");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,288) == 0)
         {
            outputText("和半勃起、跳动的鸡巴");
         }
         outputText("。");
         if(get_player().cor < 33)
         {
            outputText("她四肢着地，然后把脸颊贴在泥土上。她的双臂在背后交叉，突然被同样凭空出现的内裤绑在那里，打了个结。她只靠膝盖、乳房、肩膀和脸支撑着，问道，[say:抓住我，操我，" + get_player().mf("Master","Mistress") + "，请把您奴隶的脸按在泥土里摩擦！][pg]");
         }
         else if(get_player().cor < 66)
         {
            outputText("她四肢着地，然后把脸颊贴在泥土上。她的双臂在背后交叉，你把它们按在那里，微笑着看着她的内裤像变魔术一样出现，在她的手腕上打了个死结。塞拉芙只靠膝盖和上半身支撑着，乞求道，[say:对我粗暴一点。][pg]");
         }
         else
         {
            outputText("你把她推倒，让她四肢着地，然后抓住她的手臂，把它们折叠在她的背后，把她的脸按在泥土里摩擦。恶魔呻吟着，她的小穴滴着水");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,288) == 0)
            {
               outputText("她的鸡巴喷出一股预先的精液");
            }
            outputText("因为粗暴的性游戏让她更加兴奋。突然，像变魔术一样，她的内裤出现在她的手腕上，你紧紧地把它们绑起来，把她牢牢地绑住。塞拉芙只靠膝盖和上半身支撑着，乞求道，[say:对我粗暴一点。][pg]");
         }
         if(get_player().cor < 33)
         {
            outputText("好吧，这不完全是你本来想做的，但你很清楚她想要什么，你也不妨顺着她。以这种粗暴、强硬的方式占有她的想法激起了你内心原始的冲动，你很容易就进入了一个更刻薄、更粗暴的角色。");
         }
         else if(get_player().cor < 66)
         {
            outputText("好吧，有了这样的请求，你粗暴地操她完全没有问题。这种情况唤起了你内心原始的冲动，塞拉芙大腿之间诱人的三角区几乎在召唤你去蹂躏它。");
         }
         else
         {
            outputText("面对这样的邀请，你根本无法拒绝。看着她，一股掠夺的快感传遍全身，驱使着你去彻底侵犯她。");
         }
         outputText("你抓住塞拉芙的大腿");
         if(get_player().get_str() < 60)
         {
            outputText("用力一抬，把她从地上举起，强迫她跨坐在你身上。");
         }
         else
         {
            outputText("轻松地把她举起，强迫她跨坐在你身上。");
         }
         outputText("把恶魔拖回来，你把她淫荡湿润的小穴拉到你的" + get_player().cockDescript(_loc1_));
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,288) == 0)
         {
            outputText("，无视了她那凹凸不平的肉棒上悬挂着的浓稠的预精液。");
         }
         else
         {
            outputText("，感觉到热量从她的阴阜上散发出来，传到你的" + get_player().cockHead(_loc1_) + "上。");
         }
         outputText("你猛地往后一拉，将你那" + Utils.num2Text(Math.round(get_player().cocks[_loc1_].cockLength)) + "英寸长的" + get_player().cockDescript(_loc1_) + "全部埋进塞拉芙那邪恶、温暖的小穴里，");
         if(get_player().cockArea(_loc1_) > 150)
         {
            outputText("你那巨大的肉棒把她的身体撑得变了形。[pg]");
         }
         else
         {
            outputText("让你沉浸在堕落的湿润中。[pg]");
         }
         outputText("有那么一瞬间，你们俩就保持着这样的姿势：你齐根没入，她在泥土中呻吟。塞拉芙的手臂在束缚中弯曲着，仿佛她能凭蛮力撕裂乳胶内裤；虽然她可以用魔法挣脱，但她却选择了徒劳的挣扎。也许她接受了她的束缚，就像一个真正的顺从荡妇应该做的那样？你决定是时候奖励她了，于是你再次捏住她的大腿，慵懒地抽出，凝视着现在浸透你工具的奇妙湿润。恶魔因为空虚而呜咽，她的声音里只有傻笑和痛苦的渴望。你慵懒地滑回去，当你们的胯部紧贴在一起时，轻轻摇晃她的身体，扭曲了塞拉芙的脸。[pg]");
         outputText("你的荡妇呻吟着，[say: 哦，是的，]当你滑入时，最终发出一声含糊不清的咕噜声。浓重的口水从她的嘴唇上滴落，把下面的泥土变成了一层薄薄的粘稠泥浆，让你的宠物在你操她的时候把头枕在上面。你慢慢开始，温柔地操弄着你妓女的小穴，高兴地看着她少女般的润滑液从她肿胀的紫色阴唇上滴落。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,288) == 0)
         {
            outputText("她的肉棒垂向地面，滴下浓稠的预精液，就像她的小穴一样容易。");
         }
         outputText("不知何故，她感觉你的" + get_player().cockDescript(_loc1_) + "周围像处女一样紧，而且湿润度是处女的三倍。生殖器与生殖器之间温柔的拍打声在塞拉芙身上激起涟漪，把她的脸颊抹在越来越大的泥坑里，而她的乳房在透明的乳胶胸罩里危险地摇晃着。[pg]");
         outputText("[say: 更、更多！用力点，" + get_player().mf("主人","女主人") + "！]恶魔喘息着，把腿交叉在你的背后，仿佛这能阻止你完全拔出。你单手抱住她，刚好够你的手掌拍打她紧致、健美的屁股，然后你加快了速度。现在你操她的速度更快了，这个荡妇甚至不想说话了。她的头发贴在头皮上，被泥土染成了棕色，她的手臂在束缚中松弛下来。塞拉芙给人的印象是完全顺从于像玩具一样被操，被使用而不关心她自己的感受或情绪。知道你把一个强大的施虐狂变成了……这个——这让你背脊发凉，让你快速抽插的臀部充满活力。[pg]");
         if(_loc2_ >= 0)
         {
            outputText("一个邪恶的想法闪过你的脑海，你伸手抓住你的" + get_player().cockDescript(_loc2_) + "，瞄准了奴隶湿漉漉的小穴上方那收缩的屁眼。你的下一次抽插把它深深地插入了塞拉芙的肛门，谢天谢地，恶魔不断的喷水润滑了它。随着不断增加、加倍的快感，你咆哮着，恢复了你的节奏，把你两根肉棒齐根插入塞拉芙体内。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,288) == 0)
            {
               outputText("她尖叫起来，从她肿胀的肉棒中喷出一股浓稠的精液。看来只要一点点前列腺的压力，就足以让她的雄性特征达到高潮。");
            }
            outputText("你的奴隶的反应是向你扭动她的臀部，并将她的尾巴卷在你的腰上，试图将你拉得更深。在极度的快感中，你" + get_player().mf("轻笑","咯咯笑") + "着，继续猛烈地抽插，除了自己即将到来的高潮，什么都不顾了。");
            if(get_player().cockTotal() >= 3)
            {
               outputText("可悲的是，你多余的阴茎");
               if(get_player().cockTotal() > 3)
               {
                  outputText("只能在她的脸颊上滑动，把前列腺液滴在她光滑的皮肤上。");
               }
               else
               {
                  outputText("无事可做，只能在她的脸颊上滑动，把先驱液滴得她光滑的皮肤上到处都是。");
               }
            }
            outputText("[pg]");
         }
         else
         {
            outputText("你越来越用力地操着这个婊子，开始猛烈地把你的" + get_player().cockDescript(_loc1_) + "撞进那被俘虏的小穴里，以至于塞拉芙每次被撞击都会在泥地里滑行几英寸。她的阴户开始挤压收缩，紧绷得超乎你的想象。面对如此紧致如老虎钳般的肉穴，你甚至很难再插进去。你叹了口气，将自己齐根没入，任由那绞紧、榨取的紧致感折腾你。为了不让你的奴隶控制局面，你开始打她的屁股，手掌重重地拍在她的屁股上，留下了一个个巴掌印。她的尾巴保护性地卷在你的腰上");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,288) == 0)
            {
               outputText("而她的肉棒则将一串串先驱液喷射到泥土中");
            }
            outputText("。你一动不动地享受着这吸吮、挤压的拥抱，脑子里除了惩罚你的荡妇和享受即将到来的高潮的快感之外，别无他想。[pg]");
         }
         outputText("伴随着一阵颤抖的温暖爆发，你射了。塞拉芙发出一声低沉而响亮的呻吟，她的小穴快乐地抚摸着你的" + get_player().cockDescript(_loc1_) + "，因为它将强效的精液喷射到她恶魔般的子宫里。");
         if(_loc2_ >= 0)
         {
            outputText("她的后庭同样欢快地吞噬着你" + get_player().cockDescript(_loc2_) + "的种子，随着液体的注入而疯狂地收缩。");
         }
         outputText("你把自己留在那里，深深地插在那个淫荡的洞里");
         if(_loc2_ >= 0)
         {
            outputText("");
         }
         outputText("并用黏糊糊的精液涂抹着这个堕落奴隶的通道");
         if(_loc2_ >= 0)
         {
            outputText("");
         }
         outputText("。塞拉芙尖叫着，[say: 是的！是的！操我！填满我！使用我，" + get_player().mf("主人","女王") + "！用精液把我灌满，同时把我的婊子脸按在泥里摩擦！]她的声音变得沙哑、尖锐，尖叫着");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,288) == 0)
         {
            outputText("，她的肉棒开始将更多的恶魔精液泵入泥浆中");
         }
         outputText("。声音逐渐变弱，尽管她的小穴继续挑逗着你的" + get_player().cockDescript(_loc1_) + "，从你的[balls]里榨出你最后的精液。[pg]");
         outputText("塞拉芙叹了口气，");
         if(get_player().cumQ() >= 700)
         {
            outputText("抚摸着她");
         }
         if(get_player().cumQ() >= 1400)
         {
            outputText("肿胀的，");
         }
         if(get_player().cumQ() >= 700)
         {
            outputText("鼓起的肚子，发出咕噜声，");
         }
         else
         {
            outputText("发出咕噜声，");
         }
         outputText("[say: 谢谢你……对于像我这样发情的婊子来说，你真是个好主人。][pg]");
         outputText("你得意地笑了笑，把她扔进她自己那泥泞的精液坑里，然后把她扶起来。她浑身脏兮兮的，堕落不堪，滴着你的精液。塞拉芙在你的");
         if(get_player().get_tallness() >= 80)
         {
            outputText("胸膛");
         }
         else if(get_player().get_tallness() >= 60)
         {
            outputText("嘴唇");
         }
         else
         {
            outputText("额头");
         }
         outputText("，并用口型说道，[say: 谢谢你。][pg]");
         outputText("你点了点头，在她的屁股上拍了一巴掌打发她走，注意到塞拉芙不知何时已经挣脱了双手的束缚，恢复了正常的姿势。她并没有清理身上覆盖的淫秽污迹，但以你对她的了解，她大概也不想清理。");
         get_player().orgasm("Dick");
         dynStats(DynStat.Sens(-2),DynStat.Cor(0.25));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function fuckCeraphsCatgirls() : void
      {
         clearOutput();
         var _loc1_:int = get_player().biggestCockIndex();
         outputText("你对她们笑了笑，说你很乐意让她们来服侍你；她们的角暗示着这将是一次相当刺激的体验。两人开心地发出呼噜声，并指示你平躺下来开始享乐。你按照指示放松下来，猫奴们解开了你身上的[armor]。在她们工作时，她们确保用柔软的" + (get_noFur() ? "" : "毛茸茸的") + "手轻轻抚摸你每一寸新暴露的肌肤；同时越来越靠近你最私密的部位。当[onecock]终于接触到空气时，它得到了更多的关注。[pg]");
         outputText("你忍不住把手放在她们的头上，开始在她们的耳后揉搓和抓挠。突然，其中一个退后一步，而另一个则移到你的" + get_player().cockDescript(_loc1_) + "前面，把它拉进她的乳房里。作为回应，你的双手最终都放在了她的头上，把她的头按在你的肉棒上，你感觉到你的男子气概开始震动，因为猫娘开始发出呼噜声。当你的肉棒被柔软的" + (get_noFur() ? "" : "长满毛的") + "乳肉按摩，而她对着龟头哼唱时，你爽得叫出了声。[pg]");
         outputText("另一个姐妹一直在寻找其他可以摩擦自己的东西，她似乎决定在你的[chest]上。当你的下半身被一只猫覆盖时（这也不错），另一只猫移到你的上半身，把她的乳房搭在你的头上，同时她摸索并把玩着你的[nipples]。");
         if(get_player().biggestLactation() > 1)
         {
            outputText("当你的一些乳汁渗出时，她急切地向前倾身，含住一个乳头，交替着吸吮乳头和舔舐上面的水滴。");
         }
         else
         {
            outputText("她似乎很喜欢把玩她的胸部，尽管它可能很小，她把它推到你的脸上，并在你的鼻子前捏着" + (get_noFur() ? "" : "毛茸茸的") + "乳头。你吹了个覆盆子，把脸埋进她的乳沟里摇晃，");
            if(Utils.rand(5) == 0 && !get_noFur())
            {
               outputText("但有些毛发弄得你的鼻子有点<i>太</i>痒了；你突然对着她的胸部打了个喷嚏，导致它起伏和抖动。");
            }
            else
            {
               outputText("让它前后剧烈震动。");
            }
         }
         outputText("她的姐妹看着这一切，发出闷闷的笑声，笑声直接传递到你的龟头上，将粗糙的快感传遍肉棒，并逼出了一滴前列腺液。[pg]");
         outputText("趴在你脸上的猫坐了起来，因为她姐妹的眼睛在尝到那滴液体后闪烁着渴望的光芒；显然她认出了这个表情，因为她低头看着你说，[say: 拜托，不要把你所有浓郁美味的奶油都给我姐姐。她总是偷走我应得的那份，这只坏猫咪！] 结合上下文，她的意思很明显，当她绕到你的腹股沟，试图用肩膀把她的姐妹挤开，并");
         if(get_player().cockTotal() == 1)
         {
            outputText("将她的手滑入" + (get_noFur() ? "巨大的" : "毛茸茸的") + "乳房之间，顺着你的" + get_player().cockDescript(_loc1_) + "的根部滑下。");
         }
         else
         {
            outputText("抓住那根被遗弃在她姐妹温暖乳房之外的孤独、被忽视的肉棒，把它塞进自己的乳房里，同时用舌头爱抚着龟头。");
         }
         outputText("[pg]");
         outputText("多亏了之前的刺激，她们熟练的舌头几乎立刻让你的身体达到了颤抖的高潮，并且[eachcock]");
         if(get_player().cumQ() >= 1000)
         {
            outputText("释放出一股精液的洪流，慷慨地涂满了两个女孩；她们各自发出幸福的叫声，吸吮着附近的龟头，大口吞咽着。");
         }
         else if(get_player().cumQ() >= 300)
         {
            outputText("释放出大量的“奶油”，两个女孩狼吞虎咽地吞下，粗暴地舔舐着精液和它的源头。");
         }
         else
         {
            outputText("挤出几股毫不掩饰的精液，女孩们推搡着争抢，每个人都争相吞下下一股。");
         }
         outputText("[pg]");
         outputText("你仰面躺下放松，因治疗和高潮而精疲力竭；这对猫咪双胞胎");
         if(get_player().cumQ() >= 1000)
         {
            outputText("急切地清理掉" + (get_noFur() ? "她们自己" : "她们毛发") + "上的残留物，被这巨大的量所安抚，甚至互相用舌头舔舐干净，并且");
         }
         outputText("感谢你的“奶油”。你虚弱地点点头，她们跳起来，向你摇了摇尾巴，然后离开了。[pg]");
         get_player().orgasm("Generic");
         dynStats(DynStat.Lib(-1));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function followerCeraphTongueFucking() : void
      {
         clearOutput();
         ceraphSprite(true);
         outputText("渴望被你的恶魔奴隶侍奉，你张开[legs]，让她能轻易接触到你的[vagina]");
         if(get_player().hasCock())
         {
            outputText("和[cocks]");
         }
         outputText("。[pg]");
         outputText("[say: 用你的舌头服侍我，]你命令道。[pg]");
         outputText("塞拉芙点了点头，眼中闪过一丝不易察觉的光芒，她跪倒在地，端详着你的外阴。她温顺地亲吻着你的肉缝，将湿润的双唇贴在你的[vagina]上片刻。恶魔抬起头看着你，开始从你的会阴舔起，穿过你的阴唇，绕过你");
         if(get_player().get_lust() < 50)
         {
            outputText("仍被包皮覆盖的");
         }
         else
         {
            outputText("充血肿胀的");
         }
         outputText("阴蒂，最后停在你敏感的耻骨皮肤上。接着，她的舌头开始从嘴里伸出，越垂越低，仿佛是从她喉咙里隐藏的线轴上解开一般。塞拉芙不断地吐出这条湿滑的器官，直到有三英尺长的舌头悬垂在她的双乳之间。光是看着它在你阴阜下方蠕动，就让你湿了。[pg]");
         outputText("伴随着一声急促的吸气，她收回了那惊人的长舌，将其缩短到更实用的十到十一英寸。从她微张的双唇间开始，舌头变厚，呈圆柱形并不断变宽，直到你确信它至少有两英寸粗。随着舌头的充血，青筋在恶魔的舌头上跳动并形成纹理，赋予了它一种绝对的……阳具般的外观。变形完成，塞拉芙那肉棒般的舌头顶端形成了一个圆润的龟头状冠状沟，让这幻象变得完美无缺。[pg]");
         outputText("这个堕落的荡妇眨了眨眼，用舌尖舔舐着你，让它沾满湿润的女性淫液，让你感受到她舌头肉棒在你肌肤上的温度。感觉棒极了，就像被一根涂满唾液、粗壮又灵活的肉棒舔舐一样。缓慢地，极其缓慢地，它挤进你的通道，推开你充血的外阴唇，依偎进你");
         if(get_player().wetness() < 3)
         {
            outputText("湿润的");
         }
         else if(get_player().wetness() < 4)
         {
            outputText("潮湿的");
         }
         else
         {
            outputText("湿透的");
         }
         outputText("肉道中。她在你体内扭动着灵活的嘴中肉棒，确保摩擦到你的G点，然后她又滑入了几英寸，感觉像是把一半都塞进了你体内。[pg]");
         outputText("现在你喘着粗气，你的[hips]开始颤抖，渴望骑上这根入侵的器官，操它，与它交配；做任何事来满足你不断增长的欲望。塞拉芙会意地向你眨了眨眼，向前凑了凑，将最后几英寸滑过你张开的下体双唇，进入你[vagina]天鹅绒般的怀抱。你能感觉到它在你体内蠕动、摩擦，以一种缓慢而令人发狂的目的在你的小穴里扭动。它时不时地刷过你的子宫颈，但从不用力，也从不带来痛苦。同时，它似乎总是能接触到你最敏感的地方。这让你不禁怀疑塞拉芙是不是曾经在自己身上练习过，你脑海中短暂地浮现出这个恶魔弯下腰，用她那变态的舌头肉棒猛烈地操弄自己紫色的阴户的画面。[pg]");
         outputText("一阵快感将这个画面从你的脑海中轰走，几乎让你的[legs]发软站立不稳。你猛地一惊，意识到塞拉芙已经张大嘴巴，将你的[clit]吸入口中，不知怎的，她又长出了第二根舌头来服侍它。随着一根触手般的舌头不断刺激你的G点，再加上第二个口腔器官");
         if(get_player().getClitLength() >= 3)
         {
            outputText("吸吮着");
         }
         else
         {
            outputText("舔弄着");
         }
         outputText("你的[clit]，你开始颤抖，试图抵挡你明知即将到来的高潮。你不想让塞拉芙太得意，以为她能这么快就让你高潮，但你已经危险地接近了，而她那不断抽插、挑逗的嘴巴肉棒却毫不留情。[pg]");
         outputText("你抓住塞拉芙的头，把它按在你湿透、紧缩的阴户上，命令道：[say: 喝下我的精液，婊子。吞下你主人所有滑腻的遗留物。别以为如果你漏掉一滴，我就不会惩罚你。][pg]");
         outputText("塞拉芙闭上眼睛，哼哼着，她的双舌在你体内加倍努力。你高潮中的阴户里，每一根神经末梢似乎都在同时爆炸，你弓起背，在你的奴隶脸上高潮了。塞拉芙幸福地咕噜着，她的声音被覆盖在她脸上颤抖的柔软女性肉体所掩盖。她开心地吞下你产生的每一滴液体");
         if(get_player().wetness() >= 5)
         {
            outputText("，尽管她的脸颊鼓鼓的，喉咙也在努力吞下所有喷涌而出的女孩精液。");
         }
         else if(get_player().wetness() >= 4)
         {
            outputText("，尽管她的脸颊微微鼓起，并且正在大口吞咽。");
         }
         else if(get_player().wetness() >= 3)
         {
            outputText("，尽管她时不时地需要大口吞咽。");
         }
         else if(get_player().wetness() >= 2)
         {
            outputText("，尽管你产生的量足够她大口吞咽。");
         }
         else
         {
            outputText("，尽管你的小穴不像这个领域中大多数被腐化的生物那样喷涌。");
         }
         outputText("你仍然在颤抖和紧缩，开始平静下来，但仍然把塞拉芙按在适当的位置。她没有表现出任何不适的迹象，事实上，当你屈尊低头看她时，她的眼睛闪烁着幸福的光芒，脸颊绯红。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,289) == 0)
         {
            outputText("她……用舌头高潮了吗？[pg]看到你脸上的困惑，塞拉芙松开了你沾满口水的生殖器，她的舌头恢复了正常，她说道：[say: 嗯，当然，亲爱的。如果男人知道他们错过了什么……在女人的小穴在你的肉棒上高潮时品尝它，简直是神圣的。][pg]");
         }
         else
         {
            outputText("塞拉芙颤抖着，将舌头恢复正常，带着会心的微笑将其从你娇嫩的阴户中滑出。[pg][say: 我永远不会厌倦这个的，" + get_player().mf("主人","女主人") + "，]她打趣道。[pg]");
         }
         outputText("你把她拉回你的[vagina]，让她舔掉你下体最后一点女孩精液，然后微笑着让她离开。当你看到塞拉芙踉跄了一下，仍然因为她自己的高潮而有些颤抖时，你的笑容更灿烂了。");
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,289,FlagDict_Impl_.arrayReadInt(_loc1_,289) + 1);
         get_player().orgasm("Vaginal");
         dynStats(DynStat.Sens(-2),DynStat.Cor(0.25));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function followerCeraphRoleplay() : void
      {
         var output1:Boolean;
         var _g:CeraphFollowerScene;
         clearOutput();
         outputText("你告诉塞拉芙你想玩点角色扮演。在乳胶束缚下，她的乳头变硬了，她问道：[say: 您想玩什么，" + get_player().mf("主人","女主人") + "？是要我假装被您挑逗得在性欲上屈服，还是您想换换口味，让您的受再次扮演攻？或者……您想让我变形成为其他女孩，做尽她绝对不会做的那些肮脏堕落的事情？]");
         outputText("[pg]她做了一个手势，周围的环境呈现出山区的景象。当然，她可能随心所欲就能改变这些。你想让塞拉芙扮演什么？");
         var _loc1_:Function = null;
         var _loc2_:Function = null;
         var _loc3_:Function = null;
         var _loc4_:Function = null;
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,11) > 0 && (get_player().hasCock() || get_player().hasVagina()) && get_player().get_lust() >= 33)
         {
            _loc1_ = ceraphUrtaRoleplay;
         }
         if(get_player().hasCockThatFits(70) && get_player().hasStatusEffect(StatusEffects.Marble) && get_player().get_lust() >= 33)
         {
            _loc2_ = sweetieNOOOO;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,150) > 0 && get_player().get_lust() >= 33 && get_player().hasCock())
         {
            _loc3_ = cerminika;
         }
         if((get_game().bazaar.telly.get_tellyGenesis() || get_game().bazaar.telly.get_tellyCommute()) && get_allowChild())
         {
            _loc4_ = tellyRolepay;
         }
         if(get_player().get_lust() < 33)
         {
            outputText("[pg]<b>你还没有足够的性致来做爱。</b>");
         }
         menu();
         if(get_player().get_gender() > 0)
         {
            addButton(8,"当宠物",sumissivenessToCeraphFollower);
         }
         addButton(0,"打败她",get_ceraphScene().winRapeChoices);
         addButton(1,"输给她",get_ceraphScene().ceraphRapesYouBADDAWGYODIGGITY);
         addButton(5,"多米妮卡",_loc3_);
         addButton(6,"玛布尔Play",_loc2_);
         addButton(7,"乌尔塔Play",_loc1_);
         addButton(9,"特莉",_loc4_);
         _g = this;
         output1 = false;
         addButton(14,"返回",function():void
         {
            _g.ceraphFollowerAppearance(output1);
         });
      }
      
      public function finishTheTrot() : void
      {
         clearOutput();
         outputText("完全满足后，你[if (cor>50) {解开挽具的前部，把塞拉芙扔到她的手上，她喘着粗气|提示塞拉芙帮你解开这个挽具。她叹了口气，虽然不是不高兴，先解开了前面，解放了她的双手}]。现在她面朝下，屁股朝上，慢慢地爬出来，让你的鸡巴[if (multicock) {们}]品尝她体内的每一[if (metric) {厘米|英寸}]，然后才最终释放到露天。[say:下次您需要暖屌器的时候，一定要告诉我，[Master]。]她站起来解开后面的带子，你绕着大圆石小跑，发现不知怎么的，你回到了家，回到了你开始的地方。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function encounterZetsuko() : void
      {
         clearOutput();
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,406,FlagDict_Impl_.arrayReadInt(_loc1_,406) + 1);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,406) == 1)
         {
            outputText("你召唤了塞拉芙，但出乎意料的是，出现在一团堕落的紫色火焰中的不是你期待的紫肤恶魔，而是一个长着狐狸耳朵的女孩。她从传送门中走出来，像甩水一样甩掉身上的火焰，你花了一点时间打量她。你首先注意到的是，她的双臂被绑在一件胸前敞开的白色拘束服里，让她F罩杯的双乳可以自由晃动。四条巨大的狐狸尾巴在她身后的空气中不规则地扭动着，你可以看到一对小角从她那对大大的三角形耳朵前面的头发里探出来。她的身体和脸上布满了部落纹身，她那有些疯狂的琥珀色眼睛被一头带有黑色挑染的凌乱红褐色头发很好地衬托着。就像塞拉芙后宫的许多成员一样，她身上装饰着无数的穿环和饰钉——几乎多得数不清——还有一个巨大的饰钉项圈。当你终于有时间把这一切都看清楚时，她开口了。[pg]");
            outputText("[say: 绝子为女主人的缺席道歉，" + get_player().mf("Master","other Mistress") + "。女主人不能来这里，所以她派绝子代替。她希望绝子能合您的心意……][pg]");
            outputText("她用一个令人毛骨悚然的笑容结束了她的话，露出了她过大的犬齿，她眼中邪恶的光芒暗示着她内心深处沸腾的混乱。当她带着近乎动物般的饥饿感舔舐嘴唇时，你看到她的舌头非常长，而且上面也有一个很大的饰钉。你对她奇特的说话方式挑了挑眉，但还是尽力去理解她的话。[pg]");
            outputText("[say: 绝子想知道" + get_player().mf("Master","Mistress") + "是否可以……解开她的外套？]她说着，在拘束服里稍微挣扎了一下。[say: 女主人绑得有点太紧了……][pg]");
            outputText("当她转过身向你展示她的束缚时，你发现她背上别着一张小纸条，于是伸手拿了下来。这似乎是塞拉芙写给你的。[pg]");
            outputText("[saystart]" + get_player().mf("Master","Mistress") + "，");
            outputText("[pg]我非常抱歉不能亲自来服侍您，但我派了绝子代替我来。如果您正在读这张纸条，她可能已经试图让您解开她的束缚了。恕我直言，我建议您在任何情况下都不要答应她的请求。绝子有“纪律”问题，您可能很快就会发现，虽然我的穿环压制了她大部分的反叛倾向，但她有着令人沮丧的顽固意志。未经您的同意，她应该无法对您动手，但这并不能阻止她尝试，相信我。尽管她有“困难”，但她确实有一些我认为您会非常喜欢的强化，只要您不上她的当。[pg]");
            outputText("您忠诚的仆人，\n塞拉芙");
            outputText("[pg]附言：以防万一她真的逃出来了，安全词是“香蕉”。\n再附言：不要把任何重要的东西塞进她嘴里。\n再再附言：澄清一下，我指的是她脸上的那个。[sayend][pg]");
            outputText("你困惑地眨了眨眼，重读了最后一行。正当你开始想这是什么意思时，绝子转过身，一屁股坐在她那柔软的屁股上，愤愤不平地抬头看着你。[pg]");
            outputText("[say: " + get_player().mf("Master","Mistress") + "不打算放绝子出来，是吗？呵呵……太聪明了……绝子是个坏女孩，是的……有很多坏习惯，试图欺骗" + get_player().mf("Master","Mistress") + "。女主人试图教导她，但绝子觉得做坏事太有趣了。][pg]");
            outputText("她的双腿淫荡地张开着，当你的目光被绝子流口水的小穴吸引时，你终于开始明白塞拉芙在纸条里的意思了。在这种情况下，流口水是字面意思——你看着一条长得离谱、布满饰钉的舌头从她的阴道里滑出来，沿着她阴唇的外缘舔舐着，滴下似乎是唾液和淫液混合物的液体。谢天谢地，那里似乎没有牙齿，但那条巨大的舌头蠕动的方式是如此令人不安的色情，以至于你似乎无法把目光移开足够长的时间去检查。[pg]");
            outputText("[say: 绝子的小穴合" + get_player().mf("Master","Mistress") + "的心意吗？]她说着，躺在背上，进一步张开双腿，骄傲地向你展示她那畸形的附肢，开始用舌头舔自己的阴蒂，轻轻弹动她的阴蒂环。[pg]");
            outputText("你现在要使用绝子，还是把她送回塞拉芙那里？");
         }
         else
         {
            outputText("你呼唤了塞拉芙，但出现在你面前的并不是你预想中那个紫肤恶魔，而是绝子。她在一阵腐化的紫色火焰中现身，转过头来，冲你咧开嘴，露出一个大大的笑容。[pg]");
            outputText("[say: 绝子为女主人的缺席道歉，" + get_player().mf("主人","另一位女主人") + "。女主人今天来不了，所以派绝子来了。绝子希望今天" + get_player().mf("主人","女主人") + "能大发慈悲，解开绝子的束缚？][pg]");
            outputText("你告诉她今天没打算放开她，这让她微微嘟起了嘴，不过塞拉芙的穿环似乎让她无法做出什么实质性的反抗。你的视线不由自主地向下移去，看着她那条长得离谱的舌头从她的小穴褶皱间伸展开来，期待地在大腿内侧涂抹着黏滑的汁液。");
            outputText("你现在要使用绝子，还是把她送回塞拉芙那里？");
         }
         menu();
         if(get_player().hasCock())
         {
            addButton(0,"肏小穴",fuckZetsukosTonguepussy);
         }
         else
         {
            addButtonDisabled(0,"肏小穴");
         }
         if(get_player().hasVagina())
         {
            addButton(1,"被舔",getTonguedByZetsuko);
         }
         else
         {
            addButtonDisabled(1,"被舔");
         }
         if(get_silly())
         {
            outputText("（你还记得塞拉芙的便条上提到了一个安全词……是什么来着？）");
            addButton(2,"香蕉",zetsukoBanana);
         }
         addButton(14,"离开",noZetsukoLoveToday);
      }
      
      public function doFarmShit() : void
      {
         clearOutput();
         ceraphSprite();
         outputText("[say:那我今晚就过去，]她说道。她拉扯着乳头，眼中闪烁着遥远的兴奋光芒；直到现在你才意识到“标记为受恶魔保护”可能意味着什么。[say:还有什么事吗，[master]？]");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1086,1);
         get_game().farm.farmCorruption.whitneyCorruption(10);
         ceraphFollowerAppearance(false);
      }
      
      public function declineCeraphsCatgirls() : void
      {
         clearOutput();
         outputText("你对着猫咪姐妹摇了摇头，告诉她们你对操猫没兴趣；你想要的是答应给你的性感恶魔。两人委屈地喵喵叫了几声，然后垂头丧气地离开了。");
         doNext(playerMenu);
      }
      
      public function declineCeraphFauxCorruption() : void
      {
         clearOutput();
         outputText("你告诉她，你对让低贱的小恶魔释放欲望没有兴趣。如果他们想要快感，就应该自己去争取。[pg]");
         outputText("[say: 抱歉了男孩们，这是" + get_player().mf("主人","女主人") + "的命令。] 她展开翅膀飞走了，发情的小恶魔们也跟了上去，仍然忙着自慰。一阵“滴答滴答”的声音跟随着他们，那是他们的先列腺液从高处滴落在干燥泥土上的声音。[pg]");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function debugMenu(param1:Boolean = true) : void
      {
         get_game().debugMenu.debugCompEdit(saveContent,new SaveContent(null,null));
      }
      
      public function collarCeraph() : void
      {
         clearOutput();
         ceraphSprite(true);
         outputText("你俯下身，从塞拉芙颤抖的手中夺过项圈。你在手中翻转着它，感受着柔软、顺滑的皮革。黑色的带子表面突出了血红色的饰钉，隐约让你想起狗项圈，尽管攻击性被调到了最大。卡扣机制看起来很容易连接，但你看不出有任何方法可以松开锁扣。塞拉芙有单向项圈也是说得通的；奴隶不应该能够移除他们身份的象征。[pg]");
         outputText("你俯下身，将项圈滑过你新奴隶突然发红的脖子，感觉到她的心脏在皮肤下怦怦直跳。你把它扣上，沉思着");
         if(get_player().cor < 33)
         {
            outputText("你从未想过把一个恶魔变成你的奴隶会成为你任务的一部分。一方面这似乎是错的，但是……她是个恶魔。反对你的人越少，彻底结束他们的威胁就越容易。");
         }
         else if(get_player().cor < 66)
         {
            outputText("当你开始这段旅程时，把恶魔当作奴隶对你来说是令人厌恶的。现在，这只是达到非常愉悦目的的一种手段。");
         }
         else
         {
            outputText("你会有多享受把这个前任支配者当作你个人的");
            if(get_player().hasCock())
            {
               outputText("精液垃圾桶");
            }
            else
            {
               outputText("舌头奴隶");
            }
            outputText("。");
         }
         outputText("塞拉芙跪起身，亲吻你的[feet]，以示绝对的顺从和服从。[pg]");
         outputText("战败的恶魔解释道，[say:虽然我现在和永远都是你的荡妇、你的奴隶、你的婊子……但我后宫里的那些人不能被抛弃。我很遗憾地说我不能和你住在一起，" + get_player().mf("主人","女主人") + "。] 她看到你眼中的神情，急忙补充道，[say:哦，我仍然会随叫随到，但如果我去不了，我一定会派我的一个宠物去。只要你想要我的服务，就摩擦这个护身符，" + get_player().mf("主人","女主人") + "，我就会在那里。] 塞拉芙伸出一根尖端镶有红宝石的微小缟玛瑙棒。宝石闪烁着自身内在的光芒，而黑色的棒身似乎吸收了周围的一切，只留下黑暗。[pg]");
         outputText("好吧，既然她的后宫那么大，她必须把他们留在她的巢穴里照顾他们也是说得通的。你不可能在你的营地里收养这些人，而且，既然他们的女主人是你的奴隶，<b>现在他们也顺理成章地属于你了</b>。塞拉芙伸出手，用她空闲的手");
         if(get_monster().get_lust() >= get_monster().maxLust())
         {
            outputText("继续抚摸");
         }
         else
         {
            outputText("抚摸");
         }
         outputText("她那长满结节的恶魔肉棒。她呜咽着，[say:我的" + get_player().mf("主人","女主人") + "是喜欢带着[his]奴隶的信物，还是把它当作肚脐环戴着？][pg]");
         menu();
         addButton(0,"携带",carryCarephsToken);
         addButton(1,"穿孔",getCeraphFollowerPiercing);
      }
      
      public function cerminika() : void
      {
         spriteSelect(SpriteDb.get_s_uncloaked_dominika());
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,389) == 0)
         {
            outputText("[say:谁？]塞拉芙问道。[pg]");
            outputText("你向你的恶魔婊子解释了那个黑唇女巫的事。[say:嗯，纹身，那会很棘手，]她若有所思地舔了舔下唇。[say:想她一会儿？]你已经在想多米妮卡了，因为你正在向塞拉芙解释她是谁，但你认为忍受她的愚蠢是你为性爱付出的代价。尽管如此，你还是承认你正在想。塞拉芙把手放在你的额头上，闭上眼睛一会儿，然后发出咕噜声并咧嘴笑了。[say:哦，她很可爱。问问她喜不喜欢穿环。][pg]");
         }
         outputText("深吸一口气，塞拉芙闭上了眼睛。当她再次睁开眼睛时，眼中的黑暗已经被明亮的白色巩膜和明亮的蓝色虹膜所取代。从发根开始，她的头发变亮变金，盘成一个别致的发髻。恶魔的脸在肉体下移动和蠕动，骨骼和肌肉适应了细微的差异，并适应了秘术师的特征。睫毛调整并收缩，失去了恶魔过度的魅力，获得了更脚踏实地和自然的外观。在整个过程中，她的皮肤色调逐渐转变为更棕褐色的阴影，现在类似于某人实际出生时可能拥有的颜色。[pg]");
         outputText("她的身形有所收缩，变得更苗条、更矮小。以前淫秽的乳房尺寸缩小了，塞拉芙脱下衣服以防止不必要的损坏。在你的眼前，她的乳晕缩小并改变，乳头变得非常娇小。手臂纤细，转变为更符合女巫预期的体格。她恶魔般的脚跟缩回脚里，脚底比她皮肤的其他部分苍白得多。有趣的是，她的屁股稍微丰满了一些，达到了非运动型的那种摇晃感。在她的双腿之间，塞拉芙的小穴变得端庄整洁");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,288) == 0)
         {
            outputText("而她的肉棒则缩小到大约六英寸长，在玛瑞斯这绝对算得上是一根小巧的阴茎了");
         }
         outputText("。[pg]");
         outputText("虽然她身体的大部分都在缩小，但她的嘴唇却变大了。这并不令人意外，而且看着非常赏心悦目。她的下唇变得圆润饱满，上唇的轮廓也更加清晰。它们像瘀伤一样变暗，直到只剩下光泽的虚空。仿佛被直接吸入皮肤一样，她纹身的线条开始蔓延，从胸前的一个圆圈开始，直到墨水的网格覆盖了她晒黑的身体。[pg]");
         outputText("多米妮卡赤身裸体、毫无拘束地站在你面前。她缓慢地舔了舔嘴唇。[pg]");
         if(get_player().hasCock())
         {
            outputText("[say: 勇者，]那深色的嘴唇发出满足的呼噜声，[say: 你已经做到了我所要求的一切。]她的手抚摸着你的脸颊，走近并抚摸着你的手臂。[say: 我对你的感激之情无以言表。]她的手游走到你的头发里，梳理着，然后捧住你的后脑勺。多米妮卡将你拉入一个深吻，以一种令人窒息的激情将她的嘴唇压在你的嘴唇上。她的舌头卷入你的嘴里，仿佛要夺走你的舌头，她的腿最终抬起并缠绕着你。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,288) == 0)
            {
               outputText("她的肉棒顶在你的胯部。");
            }
            outputText("[say: 我敢说，]她在亲吻间隙发出呼噜声，将额头贴在你的额头上，[say: 你可能已经诱惑了我，勇者。][pg]");
            outputText("她把手按在你的肩膀上，让你慢慢坐下，跨坐在你的腿上。[say: 我一直保持贞洁，是因为害怕在这片土地上失去我的尊严，]她轻柔地发出呼噜声，手在你的胸前划过。");
            if(get_player().biggestTitSize() >= 0)
            {
               outputText("她漫不经心又调皮地轻轻捏了捏你的[chest]。");
            }
            outputText("[say: 但如果我能依靠你——也许我就不需要担心了。]她拉开你的[armor]，让她的手饥渴地在你的身体上游走。她显然被激起了性欲，她的小穴在你的胯部摩擦着汁液");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,288) == 0)
            {
               outputText("，而她的肉棒依然坚挺僵硬");
            }
            outputText("。她的舌头饥渴地舔过她墨色的嘴唇，当她拉起你的[cock]时，她的脸上露出了几乎是掠夺性的笑容。她的指甲在你的龟头下方轻轻地、小心翼翼地挑逗着你，用手掌摩擦着你肉棒的底部。[pg]");
            outputText("[say: 有多久了，]她发出呼噜声，[say: 你想真正进入我体内有多久了？][pg]");
            outputText("多米妮卡向后滑动身体，用她柔软的阴唇摩擦着你的[cock]。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,288) == 0)
            {
               outputText("她肉棒的最底部挑逗着你肉棒上的静脉，但她现在似乎专注于她小穴的快感。");
            }
            outputText("当她到达你肉棒的顶部时，她对你咧嘴一笑，在上面来回摩擦。[say: 嗯，]她轻声沉思，咬了咬下唇。[say: 我已经很久没有让别人拥有我了。我都忘了……肉棒在下面感觉有多温暖。]她的小穴漫不经心地收紧，在你的龟头上摩擦。[say: 你应该感到荣幸。][pg]");
            outputText("你抓住她的臀部，把她拉到你的腿上。她小穴的温暖和湿润立刻吞没了你的肉棒，紧紧地依附着你。面对突然的侵略，她发出一声惊讶的叫声，把手放在你的肚子上。那种自命清高的举动很可爱，但你是来做爱的，任何打扮都无法阻止你。[say: 我-我看出来你也渴望这个！]她喘息着，试图在脸颊泛红的同时保持一些尊严。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,288) == 0)
            {
               outputText("她的肉棒突然笔直地竖起来的程度，也许是这个过程中最有趣的部分。");
            }
            outputText("你只是对她假笑，开始把她按在你的腿上弹跳，把你的[cock]推得更深。她再次咬住嘴唇，手指抠进你的肚子。不管她想表现得多么优雅，你都能很容易地感觉到她有多湿");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,288) == 0)
            {
               outputText("，以及她的肉棒在你的腿上弹跳的热度");
            }
            outputText("。 [say: 嘿，]她喘息着，[say: 你不想好好品味一下吗？][pg]");
            outputText("你拍了一下她的奶子。[pg]");
            outputText("无法将她的表情定格并挂在你营地的树上，这简直是世上最大的不公。当你操弄着她湿透的阴阜时，她黑色的嘴唇因震惊而微张，呆呆地盯着你。她眨了几下眼睛，摇了摇头，满脸写着难以置信。最终，她的手顺着身体滑下，找到了你正握着她臀部的手，轻轻抚摸着你的手指。接着，她突然用力将指甲掐进你的手腕，疼得你不得不松手。[say: 不，]她带着邪恶的笑容说道，将你的手拉到她头部两侧，身体前倾，在你的大腿上缓慢地扭动着臀部。[say: 说真的。好好享受我吧。][pg]");
            outputText("你精心组织了一句反驳，以彰显你的智商优越感，但她只是给了你一个假笑，拍了拍你的脸颊。她半闭着眼睛，慢慢地在你身上滑动，享受着你的[cock]擦过她内壁每一寸的快感。[say: 嗯……]她发出一声满足的咕噜声，[say: 值得……等待。]她的脚趾微微蜷缩，一条腿稍微向后移动，改变了你进入她的角度。这似乎达到了她想要的效果，伴随着她臀部下一次向下滑动，她深深地吸了一口满足的气。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,288) == 0)
            {
               outputText("一滴清液在她的肉棒顶端缓慢形成，越变越大，直到最终滑落到她龟头的曲面上，顺着肉棒流下，滴落在你的大腿上。");
            }
            outputText("她把头发撩到耳后，坐得更直了。为了尽情享受你的肉棒在她体内温暖的肉壁上摩擦的感觉，她忘了把你压制住。[pg]");
            outputText("你抓住她的肩膀，猛地一扭，翻身将她压在身下，再次给了她一个惊喜。[say: 不！]她立刻大喊，看穿了你的意图，[say: 你这个" + get_player().mf("混蛋","婊子") + "！没人能把我按在地上！]你提醒她，事实胜于雄辩，别总以为事情一成不变。她朝你吐口水，但你感到欣慰的是，你的手正按着她的手腕，而你的[cock]深深地插在多米妮卡体内，等你完事后，她可能会吐出精液而不是吞下去。当然，前提是她的阴道和胃是相连的，不过这大概率是不可能的。[pg]");
            outputText("不过，既然她已经在这里了，你还没决定要让她嘴里含点什么。[pg]");
            outputText("[say: 操——操！]那两片深色的嘴唇结结巴巴地骂道，[say: 别操我了！让我骑你，你这坨屎！]她挣脱了你的钳制，却只能在你的胸膛上捶打几下，徒劳地推搡着。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,288) == 0)
            {
               outputText("当你占有她时，她的肉棒在你们的肚子之间来回弹跳。");
            }
            outputText("至于你，你完全没有放慢速度的打算，紧紧抓住她的臀部，对着被你的[cock]完全支配的紧致小穴猛烈地冲刺。你现在比之前更加占据主导地位，有机会真正体会到为了满足你的需求而强行撑开她阴唇的美妙感觉。她那饥渴的淫液早已将那里浸透，让你轻而易举地刺入这位女巫的体内。逼出她那么多湿漉漉的花蜜，把她的大腿弄得一塌糊涂，但考虑到她之前一直端着架子不让你碰，现在弄得有点脏也是她活该。她的指甲抓挠着你的锁骨");
            if(get_player().biggestTitSize() >= 1)
            {
               outputText("并拍打着你的胸膛");
            }
            outputText("，一边发出杀猪般的嘶吼，一边又极力克制着呻吟，生怕暴露了她有多享受你在她下体如活塞般抽插。在这方面，她显然失败了。[pg]");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,288) == 0)
            {
               outputText("她肉棒里喷出的一小股清液，温暖了你们臀部相接处的肌肤。");
            }
            outputText("她的手指慢慢滑上你的肩膀，紧紧抓住你，随着你的抽插咬紧牙关。在你猛烈的撞击下，她大汗淋漓，闷哼连连，头发上的发髻也开始散落。几缕金发贴在她的额头上。她的双腿缠绕着你，在你的身体上摩擦，伴随着从她深色嘴唇中溢出的每一声压抑的喘息而收紧。她的脚跟抵住你的后背，用力摩擦，将你拉得更近。你起初没怎么在意，直到你试图深深地挺进一次，却被她的脚粗鲁地拽了回来。她用手将你抓得更紧，抱住你的后脑勺，开心地发出嘶嘶声，用臀部迎合着你，感受着你的[cock]在体内移动。[say: 我说了，好好享受我，]她邪恶地嘶嘶作响，舔了舔乌黑的嘴唇，漫不经心地轻咬了你一下。[say: 待在这儿，" + get_player().mf("帅哥","美女") + "。][pg]");
            outputText("你之前就没打算让她控制节奏，现在也不想让她得逞。你假装暂时接受了她的主导，任由她引导你进行紧密而亲昵的抽插。你刺入她湿润的阴阜，越来越深，让她内壁对你的挤压比她的手还要用力。你抱住多米妮卡的后背，等待着完美的时机。恰到好处的呼吸急促，传遍她全身的合适颤抖。时机到了，她半闭着眼睛，越过你凝视着前方，发出一声喘息的呻吟，你抓住了这个机会。女巫的力气也就那么大，你只需一个坚定的动作就能挣脱她的束缚，并在过程中拔了出来。她猛地睁开眼睛，意识到你在搞鬼，但想阻止你已经太迟了。你抓住她的手腕，将她原地翻转，强迫她的脸和那深色的嘴唇贴在泥土上。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,288) == 0)
            {
               outputText("你几乎能听到她坚硬如铁的肉棒在地上踢腾的声音。");
            }
            outputText("[say: 你他妈在干——]她刚开口，接着大喊道[say: 你敢！][pg]");
            outputText("你把肉棒在她暗色的臀瓣间摩擦，你早就决定了你非常敢，而且完全不在乎她不可避免的抗议。你平静地嘲弄着她和她的无助，将手指插入她的金发中，把她按住，彻底毁掉了她原本整齐漂亮的发型。[say: 离我的屁股远点！]她终于直白地大喊出来，破坏了侵入那里的神秘感。[pg]");
            outputText("[say: 不，]你回答道。[pg]");
            outputText("出乎意料的是，刺入这位秘术师柔软的后庭竟然如此容易。你本以为像她这样的女人会更紧一些，但浸透你[cock]的淫液足以让你顺滑而愉悦地进入。她不满地闷哼和喘息着，但她深沉的呼吸却出卖了内心不断积聚的兴奋。同时，她似乎有些奇怪的紧张，身体的颤抖不仅仅是因为快感。[pg]");
            outputText("[say: 求……求求你，]她结结巴巴地说着，尽管她的屁眼紧紧地夹着你。虽然很容易就能强行进入多米妮卡紧缩的后庭，但你对她肠道挤压你肉棒的力度感到惊讶。这里没有被玩坏的肛交荡妇，只有一个娇小的肉洞，大小刚好适合被你的[cock]撑开。你拨开她的菊花，以你的名义占领她的屁股——殖民她的肠道。这两瓣屁股存在的全部意义，就是当你猛烈抽插她时，为你的胯部提供缓冲。当你的肉棒征服这肉壁的每一寸时，她小穴留在你肉棒上的汁液喷溅而出。[say: 求求你，]她再次开口，[say: 我坚持了……这么久……]她转过头看着你。就在她头发分界线的后面，两只小角从她的头骨中长了出来。你先是一阵困惑，随后被一抹会意的坏笑所取代。你嘲弄着这个堕落的女巫，嘲笑她无力保护自己。没有了贞操带保护她免受恶魔领域的快感侵蚀，它便可以自由地吞噬她的身体，吞噬她残存的纯洁，只留下又一个魅魔。[say: 别……别让我高潮，]她喘息着。[pg]");
            outputText("在大多数情况下，你不会反对拒绝让像她这样的荡妇高潮，但考虑到她正悬在悬崖边缘，推她一把你也不会觉得有什么不好。你的[cock]继续对她的后庭进行着淫秽的攻击，当你让她的肠道屈服于你肉棒的意志时，你把她多汁的臀瓣向两边分开。多米妮卡发出一声呻吟，似乎她原本打算发出一声沮丧的尖叫，但她的身体已经沉浸在快感中，无法抗拒。就像墨水在纸上晕开一样，一种深邃的暗紫色开始从她的纹身处蔓延开来。颜色相互融合并不断扩大，在交汇处没有留下任何线条。她棕褐色的皮肤开始在堕落的侵蚀下消失。[say: 你这个" + get_player().mf("混蛋","婊子") + "，]她喘着粗气，随着角变大而颤抖着。[say: 你为了自己的快感……就要毁掉我的人性吗？][pg]");
            outputText("[say: 是的，]你平静地回答。[pg]");
            outputText("她在挫败感和快感的交织中哀嚎，随着她饥渴的小穴变得越来越淫荡，淫液飞溅到地上。黑暗吞噬了她的双眼，她的指甲变得又长又尖，而你的[cock]依然在不断地蹂躏她的屁股。就像心脏将血液泵入她的身体一样，你的每一次抽插都让那颜色在她的皮肤上蔓延得更广。她的双脚在痛苦的挫败感中轻轻地蹬踏着地面，但在你身下她却无能为力。你没有停下，只是当一对布满星辰的暗色翅膀突然从她的肩胛骨处爆出时，你才放慢了速度。[pg]");
            outputText("你紧紧抓住你那女巫兼魅魔性玩具的臀部，直起身子，将她从地上抱起，让她在你的身上弹跳。多米妮卡呻吟着，将淫液喷洒在地上，她抬起双腿配合你，肿胀的靛蓝色乳房随着你用力的抽插而晃动。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,288) == 0)
            {
               outputText("她的肉棒变得肿胀而邪恶，上面布满了异常的凸起和青筋。它几乎在喷吐着预精，随着大幅增加的精液量发出咕噜声。");
            }
            outputText("[say: 那就拿去吧，]她喘息着，[say: 占有我……只-只要给我……更多……]她长长的指甲——与其说是指甲，不如说是荡妇的利爪——几乎痛苦地掐进你的手臂，因为你把她举了起来。她狂喜地尖叫着，一条长长的恶魔舌头滑过她那饱满而堕落的乌黑嘴唇，拍打在她的锁骨上，她的眼睛因快感而向上翻白。她的头发变得更金黄、更浓密，自然地向后梳成一个夸张的无脑荡妇发髻，她的角也变得巨大而邪恶。[pg]");
            outputText("对这位前学者被摧毁的贞操感到满意后，你双臂环抱住她的臀部，对着她那被征服的后庭进行了最后几次令人肝肠寸断的猛烈撞击。每一次撞击都让她尖叫喘息，每一次撞击都让你离那令人颤抖的爆发更近一步，而这正是这个荡妇存在的意义。你抓揉着她胸前那淫荡的肉球，将她紧紧贴在你的身上，不是出于亲密，而是为了支配。当你第一股浓稠的精液喷射进她那被蹂躏的屁股，堵住她的肉棒孔时，你对她的绝对控制是毋庸置疑的。她呜咽着紧紧抓住你，所能做的就是尖叫和喘息着呼唤你的名字，赞美你摧毁了她的尊严。");
            if(get_player().cumQ() >= 500)
            {
               outputText("你把大量的精液灌进她体内，就好像她是一个几天没吸毒的瘾君子，用现在撑起她肚子的庞大精液量让她膨胀，羞辱她。不过这个恶魔婊子也没剩下多少尊严可以被剥夺了。");
            }
            else
            {
               outputText("当你的[cock]用温暖填满她的肠道时，她浑身颤抖，臀部紧绷，享受着后庭的高潮。");
            }
            outputText("她的小穴几乎像瀑布一样流出淫液，在享受快感时淫秽地喷射着。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,288) == 0)
            {
               outputText("她双腿间那根恶魔般的肉棒停止了跳动，仅仅是因为它硬得像石头一样，同时将她自己那肮脏的淫液喷洒在她的身体上，溅到她的乳房和脸上。它喷出的灰白色浓浆的量甚至比你射精的时间还要长，把她涂抹得淫秽不堪。");
            }
            outputText("[pg]");
            outputText("她一边呻吟颤抖着，一边从你身上滑落，双手在你的胸膛上抚摸。在这场漫长的性爱之后，你向后挪了挪屁股坐下，看着她最终又爬回你身边，嘴角不禁泛起一丝坏笑。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,288) == 0)
            {
               outputText("她那饥渴的小嘴已经将自己喷出的污秽淫液舔舐得一干二净，生怕弄脏了你那根英俊的肉棒。");
            }
            outputText("这只女恶魔舔舐着你的[cock]，清理着上面的精液、汗水以及积聚的各种污垢，用她那丰满的、午夜般漆黑的双唇吸吮、摩擦着。多米妮卡发出愉悦的呼噜声，似乎很享受被迫变成这副淫荡模样的感觉。[pg]");
            outputText("[say: 舒服吗？] 塞拉芙用她原本的声音问道，瞬间打破了幻象。[saystart]");
            if(get_player().cockArea(0) >= 75)
            {
               outputText("我怀疑她的屁股实际上能不能这么好地接纳你，但是……我想让我的[master]享受一个完美的后庭。要怪就怪我吧。");
            }
            outputText("我希望那个小荡妇能明白她错过了什么。[sayend] 她顶着那个堕落秘术师的面容，又舔了你的阴茎几下，最后直起身子，滑到你身后，开始为你按摩肩膀。[pg]");
            outputText("[say: 话虽如此，] 她在你耳边低语，[say: 如果你有机会对那个婊子这么做，一定要邀请我。]");
         }
         get_player().orgasm("Generic");
         dynStats(DynStat.Sens(-2),DynStat.Cor(2));
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,389,FlagDict_Impl_.arrayReadInt(_loc1_,389) + 1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function ceraphUrtaRoleplaySober2() : void
      {
         hideUpDown();
         get_game().urta.urtaSprite();
         clearOutput();
         outputText("你站起身，双手沿着她" + (get_noFur() ? "" : " 颜色较浅的皮毛") + " 紧致的腹肌滑动。[say: 求你，] 她低语道，[say: 我想感受你在我体内。] 你的[cock]非常乐意，当你慢慢前后摇摆时，跳动的肉棒在她润滑的阴唇上滑动。你将龟头抵在她那流淌着蜜汁的通道口，握住她的一只手，十指紧扣，用力一捏，然后挺身而入。乌尔塔猛地吸了一口气，然后放松下来，闭上眼睛，专注于你那发烫的肉棒分开她内壁的感觉。你插得更深了，惊讶于她已经如此湿润，她对你的爱意让每一个动作都变得更加强烈。尽管在此之前她有过许多性经历，但在这一瞬间，她仿佛是第一次体验到这种快感。痛苦的极乐流遍她的四肢，她只能喘息着，慢慢地左右摇晃着头，随着你更深地陷入女孩体内，她的深处充满了你那跳动着的肉棒带来的几乎是液体的热量。");
         if(get_player().cockArea(0) > 150)
         {
            outputText("即使是你巨大的尺寸也无法阻挡你用激情祝福这个女孩——当你深入她体内，超越你通常预期的极限时，她身体的每一寸都为你让路，仿佛她的身体是为你量身定做的一样。");
         }
         outputText("[pg]");
         outputText("当你终于插到底时，你们俩都已经气喘吁吁，插入的纯粹狂喜将你们俩推向了高潮的边缘。你停止了动作，只是沉浸在她身体紧紧包裹着你的湿润压力中。而乌尔塔，在被如此彻底填满的狂喜中，只能无言地动着嘴唇，她的乳房在胸前起伏，闪烁着玛瑙光泽的乳头在乳房顶端闪闪发光。当你们俩觉得已经控制住自己时，你开始向外抽动，她颤抖的阴户紧紧抓住你的[cock]，仿佛在惋惜失去的每一寸。你以稳定的节奏开始向这位卫兵队长挺进，她的臀部热切地配合着你的动作。她的指尖在你的[chest]上滑动，当你们俩在小床上前后摇晃时，她的手环绕着你的脖子侧面。随着你肿胀的肉棒每一次有力的推进，狐狸女的阴户都会溅出水花，她闪烁的蜜汁在她的双腿间流淌成闪闪发光的小溪。她的脚踝锁住你的[ass]，用她的腿加快你的节奏，直到你发现自己以一种疯狂的频率操着这个狐狸女人。你们俩发出响亮、湿润的撞击声，力量之大，足以让你们激情的声响传遍整个营地，进入周围的森林，呻吟的满足声刺破了空气。[pg]");
         outputText("当你们俩这次达到高潮的顶点时，谁也没有力气再忍耐，胜利地涌向你们同时到来的高潮。乌尔塔紧紧地握住你的手，指关节在她的手中发出咔咔声，而她的腿则将你的[hips]拉入铁一般的拥抱中。你的" + get_player().cockDescript(get_player().biggestCockIndex()) + "将它肥沃的负荷释放到女孩的深处，液体的重量用你爱的乳白色证明淹没了她被蹂躏的通道。她绝望地将你留在她体内，她柔软、黑色的嘴唇用颤抖的低语向你诉说着她的忠诚。当你终于结束时，她让你在她体内多留了一分钟，品味着你的肉棒被你精液的狂喜温暖所包围的感觉，然后终于松开了她的抓握，让你退出。她幸福地叹了口气，当你滑出时，她揉着自己的阴唇，一颗珍珠般的精液从她被塞满的子宫里冒出来。她的指尖穿过精液，将精液按摩在她闪闪发光的阴唇褶皱上。[say: 你知道，] 她调皮地低语道，[say: 既然我的诅咒被打破了，我就不再是不孕的了。] 她闭上眼睛，深吸了一口气，咕哝着你丝滑的精子压在她等待的子宫上的感觉。你不由自主地笑了。[pg]");
         outputText("当你穿好[armor]再次转身时，乌尔塔已经不见了，刚才的那一刻就像无尽大海中的一滴水般消失得无影无踪。[say:谢谢您，" + get_player().mf("主人","女主人") + "，]塞拉芙的声音在风中轻柔地低语，充满了感激。");
         get_player().orgasm("Dick");
         dynStats(DynStat.Lib(-1),DynStat.Sens(-2),DynStat.Cor(2));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function ceraphUrtaRoleplaySober() : void
      {
         get_game().urta.urtaSprite();
         clearOutput();
         outputText("你告诉乌尔塔把瓶子放下。她不再需要那个了。她困惑地看着你，把威士忌放在一边，将尾巴卷在双腿之间，遮住她跳动的阴茎。你拉近了你们之间的距离，当你用一只手臂环住她的后腰，另一只手抬起她的下巴时，她僵住了。你解释说，她不必再感到羞耻了，因为你知道治愈她诅咒的方法。狐狸兽人的眼睛亮了起来，她微微张开嘴，却不敢说话，甚至不敢呼吸。你用拇指抚摸着她的下颌线，闭上眼睛慢慢点头，将她拉入一个紧紧的拥抱，紧到你能感觉到她体温的跳动透过你的[skinfurscales]传来。从她颤抖的下唇你可以看出她非常想问你是怎么做到的，但你只是拨开她眼前的灰斑刘海，凝视着这位卫兵翠绿的虹膜。你能感觉到她喉咙里轻柔的吸气声，她微微向你倾斜，脸颊泛红。你迎上前去，黑曜石般温暖的嘴唇起初试探性地贴在她的嘴唇上，然后变得更加自信。她深深地沉浸在拥抱中，背部紧绷的肌肉慢慢放松，她放弃了自我意识的羞耻，转而投入毫不掩饰的激情，享受着你爱抚的亲密。当你从狐狸女孩令人陶醉的狂热中退开时，你对她耳语了一个词：[say:爱。][pg]");
         outputText("乌尔塔默默地盯着你，起初表情震惊，随后她的克制崩溃了，泪水在眼眶里打转。[say:谢……谢谢你，[name]。我也爱你！从遇见你的那一刻起，我几乎不敢抱有希望，但是……哦，谢谢你！]她双臂环住你的肩膀，用尽全力拥抱你，身体因喜悦而颤抖。片刻之后，她力气耗尽，跪倒在地。[say:啊！]她惊讶地喘息着，她的阴茎在空中抽搐。那根巨大、坚硬如石的肉棒开始缩小，几英寸长的肉缩回她午夜般的包皮中，而她跳动的睾丸则向上退回腹部，随着时间的推移变得越来越小。马阴茎缩小到十二英寸，然后是六英寸，然后是三英寸，张开的顶端几乎没有露出她腹股沟" + (get_noFur() ? "" : "纤细的乌黑绒毛") + "，然后她的包皮也被拉回双腿之间。她的睾丸消失了，身体封闭了被净化的球体，阴囊的皮肤被拉紧，直到没有它们曾经存在过的痕迹。她的阴茎也同样被净化了，肉体在眨眼间愈合了男性器官的枯萎，只留下她的小穴完好无损，闪烁着兴奋的光芒。[pg]");
         outputText("这个扶他终于恢复成了纯粹的女人，她不敢相信地抚摸着腹部愈合的区域，然后跳了起来，兴奋地抓住你的双手。[say:我正常了！不再是个怪物了！哦，[name]，我永远无法报答你。你给了我新的生命！求求你……你愿意，]她带着期待的红晕凝视着你，[say:你愿意和我做爱吗？]她把你的手拉到她的臀部，走近到可以接吻的距离，但只是把额头贴在你的额头上，翠绿的眼睛不再被粗俗的欲望所蒙蔽。取而代之的是，它们几乎闪烁着女孩的热情，她的笑容真实而诚恳。你目不转睛地凝视着她的眼睛，这一刻仿佛延伸成了永恒，你用手捧住她的脸颊。她清楚地读懂了你的接受，就像你在山顶上大喊一样，她回以温柔的微笑，用鼻子蹭着你的鼻子。[pg]");
         outputText("乌尔塔把你拉回你的小床，坐在柔软的床上，双膝分开，向后靠去，用手肘支撑着身体。你沉入她肌肉发达的大腿之间，手掌在她暗色的" + (get_noFur() ? "皮肤" : "皮毛") + "上摩擦，同时把头靠近她流出淫液的小穴。她阴唇娇嫩的褶皱和她的鼻子一样黑，但在它们毛绒绒的深处有一种优雅，就像一朵黑玫瑰的花瓣守护着花朵的花蜜。你用舌头舔舐她外阴的边缘，温暖的皮肤上带着一丝这位运动型女卫兵香水汗液的刺痛感，刺激着你的舌尖，让你把它缩回嘴里，品尝女孩身体纯洁的味道。你在她性器官肿胀的嘴唇上印下细碎的吻，用轻柔的吸吮将女孩的皮肤吸入嘴里，只用嘴唇啃咬着狐狸的肉，慢慢地、令人痛苦地向上移动，直到她阴蒂光滑的结节，它因为你挑逗的口交刺激而肿胀。你用鼻尖抚摸着敏感的肉，将下唇的肿胀刷过乌尔塔的快乐按钮。她呻吟着，臀部随着你的动作前后摇摆。");
         if(get_player().horns.value > 0)
         {
            outputText("狐狸女孩无法将手放在身侧，但也不愿阻挡你的嘴和她的缝隙，她抓住你的角，将你的脸紧紧拉向她的阴阜，胸口紧绷，发出一声几乎听不见的欢愉尖叫。你的舌尖在她的阴部边缘滑动，你让她感受到最轻微的插入，然后退后，在她的阴蒂上印下一个湿吻。前戏够了。");
         }
         dynStats(DynStat.Lust(200));
         doNext(ceraphUrtaRoleplaySober2);
      }
      
      public function ceraphUrtaRoleplayDrunk2() : void
      {
         clearOutput();
         get_game().urta.urtaSprite();
         outputText("滑过你背部的肉棒因为期待而跳动着，你意识到乌尔塔已经过度刺激了自己。她双唇微张，发出一声放荡的呻吟，达到了高潮。她的手指深深陷入她柔软光滑的皮肤中，巨大的肉棒膨胀得比你见过的还要粗大，浓稠的精液从龟头喷涌而出。你能感觉到大量的精液在你臀瓣间涌动，然后从她的顶端喷射而出，在空中划出一道弧线，最后化作乳白色的精液绳索飞溅而下。你的背部、脖子、头发和脸上，到处都是狐狸女孩兴奋时喷洒的黏稠精液。你尽可能紧紧地夹紧臀部，按摩出她最后一勺浓郁的种子。她把你洗成了一种苍白的灰白色，但令你惊讶的是，她仍然在呻吟，抚摸着她改变后的身体的皮肤。[say:这还不够，]她喃喃自语，[say:我还需要更多。]你试图起身，但这个喝醉的女孩把手掌重重地拍在你的肩膀上，把你重新按在地上，身体水平地躺在她身下。她向后滑动，肿胀的龟头坚持不懈地压在你臀部的连接处，仍然冒着一团团精液。[say:太敏感了，]她抱怨着，用她肌肉发达的双腿将你的下半身固定住。你试图从这个喝醉了、发情的女孩身下挣脱出来的努力是徒劳的，所以你转过头，看到她跳动的阴囊——如果有什么不同的话——甚至比以前更大了，她的肉棒仍然坚硬如石，她引导着它抵住你的[vagina]。[pg]");
         outputText("[say:哦，该死，该死，该死，]乌尔塔一边念叨着，一边将她勃起的肉棒压在你流着淫水的阴唇上，马一样的尺寸沿着你被汗水浸透的丰满大腿滑动。她向前挪动，将张开的龟头压在你娇嫩的阴唇上，膨胀的血肉在你紧致的阴道中挣扎，润滑的深处不情愿地一点点分开，直到最后，球状的龟头滑入你的体内，你的小穴紧紧地包裹着它，将这位卫兵队长牢牢地锁在你的体内。[say:啊！操！]她咒骂着。[say:你怎么总是这么紧？]她高兴地呻吟着。她无法克制自己，开始在原地挺动，将她跳动的肉棒的前三英寸在你体内来回滑动，品味着她的摇晃动作在你的[ass]中引起的涟漪，你迷人的臀部让骑着你的女孩着迷。她举起一只琥珀色的手，张开手掌拍在你娇嫩的屁股上，同时又向你体内推进了两英寸，你的肠胃随着这股力量而翻腾。你试图");
         if(get_player().isGoo() || get_player().hasTailInsteadOfLegs())
         {
            outputText("扭动身体以摆出更宽的姿势");
         }
         else
         {
            outputText("张开双腿");
         }
         outputText("为了让插入更容易，但这只母狐狸用膝盖牢牢地夹住了你的下半身，让你的臀部尽可能紧紧地夹紧，心形的臀部因为体内的肉体重量而跳动。[say:你不喜欢法律的长臂吗？]她窃笑着，打了个嗝，又在你的[skin]上拍了一下，这次她将一半的长度插入了你的[vagina]，夺走了你肺里的空气。你喷涌的蜜汁从阴唇间漏出，润滑了女孩的肉棒，一直到她包皮的环。你能感觉到她十英寸长的肉棒在你体内将你的腹部抬离地面几英寸，当她快速抽插时，你只能将手指深深地插入泥土中，浅浅的脉动让你身体的每一寸都在她身下颤抖。");
         get_player().cuntChange(60,true,true,false);
         outputText("[pg]");
         outputText("她抽插的速度越来越快，你能感觉到她的肉棒在你体内危险地膨胀。她疯狂地发情，俯下身，将她光滑的赭色肌肤贴在你沾满精液的背上，她的乳房将狐狸女孩的精液揉进你的[skin]里。她低下头，在你耳边低语，[say: " + (get_noFur() ? "" : "对于那些在饮料里下药的狡猾婊子，可没有避孕套，]她沙哑的声音已经到了极限。[say: 我失去的不仅仅是毛发。") + "我又恢复了生育能力，]她醉醺醺地坚持道。[saystart]我能感觉到我那肿胀的大蛋蛋里充满了力量。");
         if(amilyFollower() || marbleFollower() || izmaFollower())
         {
            outputText("等我让你怀上，你再去向那些婊子解释你孩子身上的狐狸尾巴吧。");
         }
         outputText("[sayend] 乌尔塔伸出手支撑自己，左手抓住你的肩膀，但右手却乱挥，最后手指勾住了你的嘴，把你的脸颊扯向一边。有了额外的抓握力，她扭动着钻得更深，剩下的几英寸像蛇一样钻进你的子宫，直到那像大象一样的龟头摩擦着你的子宫颈，她肉质包皮的底部边缘挑逗地弹拨着你肿胀的阴蒂。各种感觉向你袭来：她健美的腹部温柔的曲线抚摸着你的屁股，她摇晃的胸部将坚硬如纽扣的乳头压在你的背上，你的舌头舔舐着嘴里手指的甜美滋味。这感觉太强烈了，你的身体在入侵的肉棒上紧缩，喷涌出高潮，口水从你张开的嘴里流出，你沉重的眼皮失去焦点，任由狐狸女孩尽情地使用你。[pg]");
         outputText("当她第三次射精时，你能感觉到那股冲击力直接打在你的子宫颈上，她射精的力量冲开了肌肉括约肌，一波波新生的强劲精液淹没了你的子宫。她肿胀的阴囊的重量在你的大腿间跳动，你的肚子在受孕的洪流下鼓了起来。乌尔塔的身体紧绷着，她用腰部的过剩精液淹没你的深处，精液像潮水一样涌入你的子宫，你的身体被她倾泻的精液冲刷得通红。");
         if(get_player().hasCock())
         {
            outputText("" + get_player().SMultiCockDesc() + " 在交感性高潮中释放出自己的精液，将你身下的泥土变成了粘稠的泥浆，你膨胀的肠子从肚子的两侧向外扩张。乌尔塔还在射精，她把嘴唇贴在你的后颈上，温柔地吻你，这个动作似乎传达了一种占有欲，也传达了一种温柔。当她终于从你过度充盈的小穴中抽出时，她过剩的精液像滚滚的雪白奶油一样从你体内冒出。她摇摇晃晃地站起来，站在你上方，她的肉棒终于垂了下来，浓稠的精液仍然在肿胀的尿道和你痉挛的小穴之间滴落。" + (get_noFur() ? "" : " [say: 嘿，我终于可以洗个澡，而不用闻起来像只落水狗了，]她高兴地意识到。") + " 她伸出手想拉你起来，脸上带着幸福满足的表情，但这次经历对你来说太刺激了，你晕了过去。你最后看到的是她焦糖色脸庞上温暖的光环，以及她叶子般眼睛里关切的闪光。");
         }
         outputText("[pg]");
         outputText("没过多久你就醒了，发现自己被清理干净了，虽然还是有点黏糊糊的，就好像有人用舌头把精液从你的[skinfurscales]上舔掉了一样。");
         get_player().orgasm("Generic");
         dynStats(DynStat.Lib(-1),DynStat.Sens(-2),DynStat.Cor(2));
         if(get_player().hasVagina() && get_player().totalFertility() >= Utils.rand(45) && get_player().get_pregnancyIncubation() == 0)
         {
            get_player().knockUp(1,400,61);
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function ceraphUrtaRoleplayDrunk() : void
      {
         clearOutput();
         get_game().urta.urtaSprite();
         outputText("你愉快地祝她“干杯”，看着她借酒消愁，脸上浮现出如释重负的表情。乌尔塔举起酒瓶，仰起头，将瓶口凑到光洁的唇边，开始大口吞咽。她的喉咙有节奏地鼓动着，空气在酒液中冒出气泡，威士忌源源不断地灌入她那渴望忘却羞耻的喉咙。她的脸颊越来越红，酒精的苦涩刺痛感让她暂时忘记了自己长出马匹特征的尴尬。伴随着每一次响亮的吞咽声，她那暴露在空气中的肉棒都在跳动，肿胀的阴茎上依然滴落着精液。喝光整瓶酒后，这位狐狸兽人湿漉漉地深吸了一口气，表情介于兴奋的喜悦和迷茫的困惑之间。" + (get_noFur() ? "" : " 她仔细端详着酒瓶，眨了眨眼。[say: 你——你在这里面放了什么？]") + "[pg]");
         if(!get_noFur())
         {
            outputText("你耸了耸肩，承认你对她能注意到这个小添加剂感到惊讶。毕竟她喝得那么快，按理说应该尝不出什么味道。你咧嘴一笑，问她黑蛋的味道如何。乌尔塔张大了嘴巴，醉意正一点点侵蚀她的大脑，但片刻之后，她恍然大悟。还没等她表达愤怒，变化就开始了，乌尔塔的身体因为痉挛而蜷缩起来。她扔掉酒瓶，捂住肚子，但当她再次抬起手时，一缕缕浅灰色的毛发从她的指缝间飘散在风中。她跪倒在地，开始疯狂地抓挠自己，更多的灰白毛发像是不受控制地脱落下来。看着这个女孩疯狂地抓挠自己，你弯下腰，靠近她的脸，当她抬起头想说话时，你弹了一下她的鼻子。她呜咽着捂住敏感的口鼻，在地上翻滚，每一次颤抖都伴随着毛发的脱落。[pg]");
            outputText("当乌尔塔终于停止颤抖时，这位狐狸守卫看起来截然不同。曾经覆盖在她那苗条、健美躯干上的灰色丝滑皮毛已经褪去，露出了她那暗褐色肌肤上柔和的焦糖色泽。虽然她的小腿和爪状的脚依然保留着铅灰色的皮毛，但现在看起来更像是长筒袜，而不是自然的体毛。她的尾巴似乎也没有受到影响，毛茸茸的尾巴在她紧致的臀部上方抽动着，生赭色的双丘在变形的汗水中闪闪发光。你的目光顺着她深琥珀色的身体继续移动，发现两只尖锐的银狐耳朵从她头上带有黑条纹的银色头发中探出。然而，除了这些地方，这个女孩似乎失去了从膝盖到眉毛之间所有覆盖的狐狸毛。特尔阿德雷城卫队的队长摇了摇头，把手从脸上拿开，惊讶得差点向后跳去。她的口鼻不见了，取而代之的是一个小巧的人类鼻子，下面是丰满的乌黑嘴唇。她那令人惊叹的人类特征让这个喝醉的女孩忍不住用手指按压着她那焦糖色的肌肤，柔软的肌肤凸显出她女性化脸庞上高耸的颧骨。她用手捋了捋头发，不知道该怎么想，也醉得无法形成任何看法。[pg]");
         }
         outputText("你抓住她的肩膀，抬起她的视线与你对视，凝视着乌尔塔翠绿色的眼眸。" + (get_noFur() ? "你" : "你叹了口气，低声说她从未像现在这样美丽，并") + "向前倾身，你的嘴唇急切地寻找着她的唇。她" + (get_noFur() ? "" : "把头偏得太远，试图补偿那已经消失的口鼻，然后咯咯笑着凑进你的嘴里，又转得太远，鼻子撞到了你的鼻子上。她发出一声短促的笑声，") + "湿漉漉地吻了吻你的额头，双手不稳地顺着你的[skinfurscales]滑下。[say: 所以，你喜欢我这个样子，是吧？好吧，现在轮到我了。干杯！]她用力将你向后推去，力道比她预想的要大，你的头撞在柔软的地上，然后她抓住你的[hips]，将你翻转过来，让你趴在[fullchest]上。你回头看去，只见这个女孩正在揉捏她那苍白、粉红色的乳头，乳头从她那丰满的橄榄色乳房上坚挺地凸起。你的臀瓣之间传来一阵温暖、坚实的拍打声，告诉你酒精和她的第一次高潮都没有影响这个双性人狂暴的硬度。当她将肉棒在你的臀部之间上下滑动时，你能感觉到她那二十英寸长的马屌的每一个轮廓——从凸起的血管到肉质包皮的环状边缘，再到她那正在重新充盈的阴囊光滑、凉爽的皮肤，重重地拍打着你的大腿内侧。你配合着她长长的抽插，挤压着你的" + get_player().buttDescript() + "，当她加快速度时，你在双丘之间摩擦着她的肉棒。看来她无法将手从她的新身体上移开，这位女守卫用手掌在她的乳房、肚子、手臂和臀部上摩擦，像她热狗你的[ass]一样急切地感受着她完美无瑕的肌肤。[pg]");
         dynStats(DynStat.Lust(125));
         doNext(ceraphUrtaRoleplayDrunk2);
      }
      
      public function ceraphUrtaRoleplay() : void
      {
         get_game().urta.urtaSprite();
         clearOutput();
         outputText("[say: 角色扮演？我的" + get_player().mf("主人","女主人") + "真是奇妙地利用了[his]宠物的淫荡身体，]塞拉芙发出呼噜声，嘴唇卷起一丝狡黠的微笑。你将双臂放在身体两侧，向被征服的恶魔点点头，示意她应该脱掉你的衣服。她移开视线，顺从地照做，一件一件地脱下你的[armor]，直到你赤身裸体，展现出你所有的光彩。你转向她，简短地发出命令，简要描述了她要变成的形态。令人惊讶的是，她完全知道你在说谁。[say: 啊，那个狐狸婊子，]她若有所思地说，眼睛再次闪烁出纯黑色的光芒。[say: 她长期以来一直是我眼中的刺……让你玷污她将是一种特别强烈的乐趣，" + get_player().mf("主人","女主人") + "。][pg]");
         outputText("她深吸一口气，浑身颤抖，整个身体像一只刚从雨中出来的狗一样抖动。当她结束痉挛时，" + (get_noFur() ? "她淡紫色的皮肤变成了更自然的色调，没有一丝痕迹" : "你看到她淡紫色的皮肤现在覆盖着一层细密的灰色皮毛，在几秒钟内生长变厚，直到没有一丝她光滑肌肤的痕迹，也没有") + "她的乳胶套装。她咬住下唇，从恶魔屁股上卷曲出来的细长附肢向外膨胀成一条浓密的狐狸尾巴，而她头皮上的头发褪成烟熏般的灰白色，夹杂着黑色的挑染。塞拉芙抓住她卷曲的角，慵懒地抚摸着它们，骨头在她的抓握中像油灰一样融化，让她把它们雕塑成尖锐、狭窄的耳朵，不确定地抽动着。" + (get_noFur() ? "" : "她将手指放在鼻梁上，拇指放在下巴下，将头歪向一侧并向前猛拉，她的头骨变形，脸部前部被拉成狐狸的口鼻，嘴唇变厚，变成一个闪闪发光的黑色噘嘴，向你飞吻。") + "[pg]");
         outputText("塞拉芙恭敬地挥舞着双手，向你行屈膝礼，抬起她偷来的脸，中等长度的刘海后闪烁着绿色的眼睛。[say: 在您的允许下，" + get_player().mf("主人","女主人") + "，最后的润色。]你点点头，嘴角已经浮现出一丝笑容。恶魔急切地抓住她那恶魔般的肉棒——既因为变形而坚硬，也因为你淫荡的注视而坚硬——双手小心翼翼地包裹住恶魔的阴茎。变形者用长长的粉色舌头舔过她乌黑的嘴唇，开始自慰，手掌在跳动、凹凸不平的肉棒上下滑动，动作越来越快。她张着嘴，翻着白眼，疯狂的节奏让她" + (get_noFur() ? "" : "毛茸茸的") + "胸部颤动，她抽打的尾巴在身后疯狂地抽搐。渐渐地，你注意到她粗暴的节奏似乎拉长了恶魔的器官，肿胀的坚硬感使它变得更大更长，紫色的色调越来越深，直到尖端褪成红褐色，根部褪成天鹅绒般的黑色。[say: 哦，" + get_player().mf("主人","女主人") + "，您的愿望就是我的命令，]她喘息着，她油滑的声音随着每一个音节变得更加丰富和沙哑，直到它成为乌尔塔的精确回声。当她的龟头张开时，她手中跳动的重塑马肉棒向前猛冲，达到整整20英寸，浓稠的精液从狐狸女孩的马肉棒中喷涌而出。当它在她手中抽动时，一个" + (get_noFur() ? "" : "毛茸茸的、") + "乌黑的囊从她射精的肉棒肿胀的包皮中掉落，颤抖的睾丸重重地落入阴囊。当她终于完成时，特尔阿德雷城市守卫的队长站在你面前，喘着粗气，一只手拿着她还在滴水的肉棒，另一只手拿着一瓶高高的威士忌，周围是乳白色的精液池。[pg]");
         outputText("[say: 哦！[name]！我，嗯，没想到会在这里找到你！这……这不是你看到的那样，]她道歉着，脸涨得通红，紧张的羞愧让她的肩膀因屈辱而颤抖。她渴望地看着手中的瓶子，没有抬起头，而是将目光投向你，无声地询问她该怎么做。");
         menu();
         if(get_player().hasCock())
         {
            addButton(0,"清醒",ceraphUrtaRoleplaySober);
         }
         else
         {
            addButtonDisabled(0,"清醒","这个场景需要你有一根肉棒。");
         }
         if(get_player().hasVagina())
         {
            addButton(1,"喝醉",ceraphUrtaRoleplayDrunk);
         }
         else
         {
            addButtonDisabled(1,"喝醉","这个场景需要你拥有阴道。");
         }
      }
      
      public function ceraphTentacleGrape() : void
      {
         clearOutput();
         ceraphSprite(true);
         outputText("你脱掉你的[armor]，指示塞拉芙：[say: 取悦我。我的全部。]值得赞扬的是，塞拉芙只花了一点时间打量你，然后就行动起来。她的内裤化作飞舞的乳胶碎片消失了，被突然长出的一对紫色起伏的触手彻底摧毁，每根触手的顶端都有一个肿胀的龟头。在它们后面挤出的是第三根较慢的触手。与它的兄弟们不同，这根触手顶端有一个吸吮的孔口，流着透明的粘液，周围环绕着小结节，从让你想起阴蒂包皮的皮肤褶皱中探出头来。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,288) == 0)
         {
            outputText("你可以隐约看到塞拉芙坚硬的恶魔肉棒在所有挥舞的触手下面。她一定是非常字面地理解了你让她把肉棒露出来供你使用的命令，尽管你几乎没有机会把它放在任何地方。");
         }
         outputText("[pg]");
         outputText("两根紫水晶肉棒缠绕在你的[legs]上，以邪恶的力量将你举到半空中，将你倒挂着，同时它们在你的身体上爬行，光滑的皮肤摩擦和抚摸着你的[skinfurscales]。它们卷曲起来滑过你的手，让你感受到塞拉芙激情的非人温暖。你微笑着，纵容你的奴隶，惊叹于她对变形的惊人控制力。塞拉芙将两根阴茎状的触手滑入你的腰间和臀部之间，一根从前面穿入，另一根从后面穿入。它们在你的[vagina]和[asshole]上摩擦，挑逗你，让你有时间变得尽可能湿润。[pg]");
         outputText("一个温暖的吸吮孔口与你的[cocks]对齐，发出淫秽的吧唧声，因为它扩张以容纳");
         if(get_player().cockTotal() == 1)
         {
            outputText("你所有的粗壮");
         }
         else
         {
            outputText("同时容纳你所有的阴茎");
         }
         outputText("。你舒服地弓起背，试图把更多发麻的肉棒推入触手小穴。里面充满了润滑液，多到从你");
         if(get_player().hasSheath())
         {
            outputText("包皮");
         }
         else
         {
            outputText("根部");
         }
         outputText("。更好的是，在黏稠的通道里，感觉有成千上万根蠕动的纤毛，每一根都在反复抚摸和舔舐着[eachcock]。就像成千上万条饥饿的舌头，它们似乎触动了你[cocks]上的每一根神经，几乎让你忘记了触手在为你口交时那有节奏的、脉动的吸吮。[pg]");
         outputText("你被这感觉分散了注意力，以至于你暂时忘记了你的[vagina]，至少直到两个粗大的龟头压在你的嘴唇和后庭上，才把你的注意力拉回来。它们只犹豫了片刻，刚好够在滑入之前把前列腺液滴在你的孔洞上。每一个巨大的、球状的龟头都把你撑得大大的。它们把你的洞撑松，直到它们都弹了进去，起伏的触手把它们的尖端尽可能深地推入你的体内。感觉被彻底侵犯，完全被填满，被无情地操弄，你喘息着，流着口水，你身体的每一个性器官都在被塞拉芙完美制作的性工具伺候着。");
         get_player().cuntChange(24,true,true,false);
         get_player().buttChange(24,true,true,false);
         outputText("[pg]");
         outputText("在因蒸发的汗水和淫液而变得越来越潮湿的空气中挥舞着，你发现自己悬在塞拉芙面前，倒挂着。她的眼睛低垂着，眼睑下垂，充满了欲望，就像你想象中自己的样子一样。她轻轻地喘息着，随着触手每次插入你的身体，以及你被困住的肉棒每次跳动，她微张的嘴唇里都会逸出小小的快感爆发");
         if(get_player().cockTotal() > 1)
         {
            outputText("");
         }
         outputText("。她呼出一口气，[say: 你的奴隶……能要个吻吗，" + get_player().mf("主人","女主人") + "？][pg]");
         outputText("你微笑着点点头，舔了舔嘴唇，触手把你带得更低、更近，仍在操着你。塞拉芙贴上你的嘴唇，她的舌头在你的嘴里做爱，而你则悬在半空中，被她的触手紧紧抓住。沾满口水的嘴唇紧紧地贴在一起，你尽可能热情地和你的恶魔奴隶法式热吻，试图对她的嘴做她的肉棒对你的[vagina]和[asshole]所做的事情。你神魂颠倒，迷失在彼此口腔的快速抽插、缓慢吸吮和急切的舌头推挤中。[pg]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,288) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,290) == 0)
         {
            outputText("突然把你拉回来，塞拉芙把你放得更低，把她那跳动的、浸满前列腺液的肉棒刺进你的喉咙。由于突然的入侵和她漏出的滑溜溜的甜美乳霜，你发出咕噜咕噜的声音。她以后可能需要惩罚，但现在，除了吸吮别无他法。你吸溜着、舔舐着，由于湿滑的阴道触手的纤毛在你自己的[cocks]周围丝滑地抚摸，这些动作对你来说很容易。她的结节在你的嘴里凸起，从她的根部到粗大的龟头呈波浪状起伏，预示着她的高潮即将来临。粗大、有纹理的肉棒爆发了，把塞拉芙的精液直接倒进你的嘴里。与此同时，你小穴和屁股里的肉棒触手也释放了它们自己的种子，把你的子宫和直肠腔塞满了精液，以至于你的肚子都多了一点赘肉。你吞咽着，大口大口地喝着，试图跟上恶魔滚烫、喷涌的精液。过了一会儿，塞拉芙的控制放松了，你被拉到半空中，暂时解放了你的嘴。[pg]");
         }
         else
         {
            outputText("突然把你拉开，塞拉芙仰起头呻吟起来。你能感觉到触手像活塞一样运动得更快，透过你情欲的迷雾，你意识到她要高潮了。这个警告并没有让你对即将发生的事情做好准备，两条触手同时将精液射入你的下体和屁股深处，把这两个体腔都塞满了强效的恶魔精液。它是温暖的——甚至是滚烫的——你的内脏在腐败的精液中刺痛并浸泡着，而它们继续在里面泵入更多。喷了几次之后，你感觉完全被塞满了，甚至因为大量的液体填充，你的肚子上都有了一点多余的赘肉。[pg]");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,288) == 0)
         {
            outputText("塞拉芙的肉棒把精液喷满了她的肚子，随着她的高潮结束，她那可怜的、被忽视的肉棒不顾一切地喷射着种子。[pg]");
         }
         outputText("你的身体僵住了，并在快感中爆发，将淫液喷射到塞拉芙的新器官里和上面。阴道触手");
         if(get_player().cumQ() >= 800)
         {
            outputText("因为巨大的尺寸而膨胀得很大，吸吮着");
         }
         else
         {
            outputText("吸吮着");
         }
         outputText("吞下你从[cocks]中喷发出的精液。当它吞下每一滴精液时，你迷迷糊糊地想她会怎么处理这些精液，但随后仍在抽插的触手移动得更快，将它们的精液从你塞得太满的孔洞中喷射出来，像雨点一样落在你们俩身上。你的[vagina]和[asshole]颤动并收缩，不由自主地挤压着紫色的入侵者，以获得更高层次的快感。这太强烈、太猛烈了。你在满足的呻吟中晕了过去。[pg]");
         outputText("你在你和塞拉芙的精液坑中醒来。恶魔坐在你对面，她的外表恢复了正常。她醒来时眼睛一亮，跪下说，[say: 感谢您允许我如此……彻底地为您服务，" + get_player().mf("主人","女主人") + "。这真是……令人兴奋。][pg]");
         get_player().orgasm("Vaginal");
         dynStats(DynStat.Sens(-2),DynStat.Cor(0.25));
         get_player().knockUp(1,400,61);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,288) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,290) == 0)
         {
            outputText("你得意地笑了笑，心想是否应该惩罚她把肉棒塞进你喉咙的行为。你要惩罚她吗？");
            menu();
            addButton(0,"惩罚",punishCeraphForSurpriseThroatFuck);
            setExitButton();
         }
         else
         {
            outputText("你大度地点了点头，开始清理，暂时打发走了你的私人恶魔……");
            doNext(get_camp().returnToCampUseOneHour);
         }
      }
      
      public function ceraphTalkSlave() : void
      {
         clearOutput();
         outputText("你注意到塞拉芙几乎可以在瞬间完全改变她的性格，展现出一种几乎不可思议的掩饰真实情感的能力。考虑到这一点，你要求她向你确认她是你的奴隶，并且她没有任何反叛的念头。");
         outputText("[pg][say:那是当然的，[Master]，]她眨着眼睛说道，这让你比问她之前更加怀疑她了。你用更严厉的语气命令她对你坦诚相待。这位[ceraphbus]轻轻叹了口气，然后继续说道。[say:您是我的[master]，这是毫无疑问的。我是非常自愿地来到您身边的，这还不够吗？]");
         outputText("[pg]虽然这听起来相当有说服力，但你只是想绝对确定她的感受。毕竟她还是个恶魔，有时看起来她并没有真正屈服于你。");
         outputText("[pg]这位恶魔难得地显得有些不知所措。最终，她深吸了一口气，说道：[say:嗯……这对我来说是一次全新的体验。我从未遇到过能像您这样打败我的人，所以当我意识到我们俩的立场时，我认为成为您的奴隶是理所当然的。]她停顿了一下。[say:对我来说就是这么简单。我不需要更多，也不需要改变我是谁。我是塞拉芙，我是您的奴隶。]");
         outputText("[pg]她闭上眼睛，点了点头，似乎对这个答案很满意。你想她从未直接违抗过你，所以这听起来还算合理，尽管你无法摆脱那种你永远无法真正了解她的感觉。");
         doNext(ceraphTalkMenu);
      }
      
      public function ceraphTalkPartswap() : void
      {
         clearOutput();
         outputText("你问她是否能用她那种奇怪的魔法提供什么特殊的服务。");
         outputText("[pg]塞拉芙随口提到：[say:如果您对那种事情感兴趣的话，[Master]，我可以取下您身上某个<b>美味的</b>部位，并在我的后宫里使用它。据我了解，原主人通常能够在意识放松时——通常是在睡觉时——体验到他们礼物的快感。]");
         outputText("[pg]有意思。你想，如果你哪天想要尝试，只需要开口就行了。");
         doNext(ceraphTalkMenu);
      }
      
      public function ceraphTalkMenu() : void
      {
         var _g:CeraphFollowerScene;
         clearOutput();
         outputText("你想谈论什么话题？");
         menu();
         addNextButton("魔法",ceraphTalkMagic).hint("向塞拉芙询问她那能引发性癖的魔法。");
         addNextButton("奴隶",ceraphTalkSlave).hint("塞拉芙有时似乎有点“不守规矩”，可以这么说，所以你想确认一下你们之间的关系状态。");
         addNextButton("莉希丝",ceraphTalkLethice).hint("询问她对万魔女王的看法。");
         addNextButton("部位交换",ceraphTalkPartswap).hint("询问她能为你做些什么。");
         _g = this;
         setExitButton("返回",function():void
         {
            _g.ceraphFollowerAppearance();
         });
      }
      
      public function ceraphTalkMagic() : void
      {
         clearOutput();
         outputText(get_ceraphScene().hadFetish() ? "你想更多地了解你的奴隶赋予你的性癖，于是你问它们是如何运作的。" : "你对塞拉芙提供的性癖穿环背后的魔法感到好奇，于是你问你的恶魔那是什么，以及它是如何运作的。");
         outputText("[pg]一提到她那奇特的魔法，塞拉芙对你微微一笑。[say:" + (get_ceraphScene().hadFetish() ? "[Master]终究还是对获得性癖感兴趣吗？" : "") + "我可以将某些想法和[i:需求]植入某人的脑海中。微妙的改变和调整可以改变一个人的思维方式，它可以产生滚雪球般的效应，只要有足够的控制力就能引导。]塞拉芙慢慢闭上眼睛，继续说道，[say:如果我在某人脑海中合适的地方种下一颗种子——一个想法——它就能绽放出最令人愉悦的事物！]带着自满的神情，她重新睁开了眼睛。");
         outputText("[pg]你以前从未听说过这样的魔法，听起来它比仅仅用来引发人们的性癖要强大得多。她到底是在哪里学到这个的，你也能学吗？");
         outputText("[pg][say:我可以向您保证，[Master]，其他人没有展示过这种魔法是很正常的。]正当你纳闷她这话是什么意思时，她继续说道，[say:恐怕这不是任何人都能随便学会的，不像大多数人使用的那些简单的戏法。它需要令人难以置信的精神集中力，才能引导和塑造某人的思想。它需要的不仅仅是纯粹的力量，还需要一种特定的……心态，才能做到。]她一边说，一边缓慢而刻意地舔着嘴唇。");
         outputText("[pg]你怀疑你现在能否让她解释得更深入，即使这个话题本身似乎比其他话题更让她兴奋。你轻描淡写地挥了挥手，告诉她你已经听够了。");
         outputText("[pg]塞拉芙恢复了她一贯的从容姿态。[say:还有什么我可以为您效劳的吗，[Master]？]");
         doNext(ceraphTalkMenu);
      }
      
      public function ceraphTalkLethice() : void
      {
         clearOutput();
         outputText("你知道塞拉芙在自由生活时相当独立，但你很好奇她对前任君主的真实感受。然而，一提到她的名字，你奴隶的表情就变得异常难看，这是你很少见到的。");
         outputText("[pg][say:我不想谈论这个，]她说道，声音压得很低。");
         outputText("[pg]好吧，你是她的[master]，所以你会得到你的答案。在你的坚持下，这位[ceraphbus]皱起了眉头，你有一瞬间甚至觉得她可能会违抗你，但伴随着一声叹息，她最终还是开口了。");
         outputText("[pg][say:我不向她效忠，对那个婊子也没有丝毫的尊重。]她看到你的表情，脸色稍微白了一下，立刻换上了一副顺从的姿态。[say:也就是说，我们从来都合不来，[Master]。她根本无法与您相提并论，我期待着您最终推翻她的那一天。]");
         outputText("[pg]她的眼中闪烁着一种让你不确定是否应该感到欣慰的光芒，但你觉得你无法从她那里得到更具体的信息了。");
         doNext(ceraphTalkMenu);
      }
      
      public function ceraphSprite(param1:Boolean = false) : void
      {
         if(param1)
         {
            spriteSelect(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,288) == 0 ? SpriteDb.get_s_ceraph() : SpriteDb.get_s_ceraphNudeFemale());
         }
         else
         {
            spriteSelect(SpriteDb.get_s_ceraphClothed());
         }
      }
      
      public function ceraphSexMenu() : void
      {
         var output1:Boolean;
         var _g:CeraphFollowerScene;
         clearOutput();
         menu();
         addButton(0,"操小穴",fuckFollowerCeraphsVagoo).hint("你可以操她的小穴。").sexButton(1);
         addButton(1,"被舔",followerCeraphTongueFucking).hint("你可以让她舔你的小穴。").sexButton(2);
         addButton(2,"全都要",ceraphTentacleGrape).hint("你可以命令她取悦你所有的器官。").sexButton(3);
         addButton(3,"操乳穴",stuffSomeNippleCunts).hint("你可以让你的奴隶取悦你的乳穴。").disableIf(!get_player().hasFuckableNipples());
         addButton(4,"阴茎魔法",portalFuckWithFollowerCeraph).hint("你可以用你的阴茎，看看塞拉芙有没有什么魔法能玩出新花样。").disableIf(!get_player().hasCockThatFits(100));
         addButton(5,"产卵",layEggsInSlaveCeraph).disableIf(!get_player().canOviposit());
         addNextButton("强暴Play",ceraphRapePlay).hint("让她强行占有你，完全不顾及你的感受。").sexButton(2);
         addNextButton("小跑",goOnATrotWithCeraph).hint("戴着一个温暖的肉套去散步。").sexButton(1).disableIf(!get_player().isTaur(),"你需要不同数量的腿才能做这个。");
         _g = this;
         output1 = false;
         addButton(14,"返回",function():void
         {
            _g.ceraphFollowerAppearance(output1);
         });
      }
      
      public function ceraphRemoveNobleShirt() : void
      {
         clearOutput();
         if(get_undergarments().SEA_SHIRT.saveContent.armorStage > 2)
         {
            outputText("塞拉芙盯着看了一会儿，皱起了眉头。[say:[Master]，这件“衬衫”看起来确实有些不同寻常。]你的恶魔奴隶开始绕着你走，一边评估着事态的发展，一边大声思考。[say:它已经与你融为一体，你被它塑造的同时，它也被你塑造。这可不是简单就能解决的。]她叹了口气，双臂环抱住你，然后在你耳边低语，[say:不过，它让你看起来很漂亮，不是吗？]");
            outputText("[pg]当你下意识地同意时，一阵战栗顺着你的脊背流下。");
         }
         else
         {
            outputText("应你的要求，塞拉芙将手按在你的胸骨上，差点让你失去平衡。[say:啊，好了，]她说。恶魔接着低声嘟囔了些什么，然后她抬起手，让你的衬衫像悬浮一样升起。[say:然后，释放。]");
            outputText("[pg]布料落了下来。你等了一会儿，看看是否还会发生什么，但什么也没发生，这促使你尝试自己脱下衬衫。宽松的布料感觉不一样了，在你的手指间挤成一团，当你拉扯时，它竟然被撕裂了！整件衣服轻而易举地碎成了碎片。");
            outputText("[pg][say:嗯，也许我刚才不够温柔。制作它的人肯定没有考虑到耐用性。]");
            outputText("[pg]尽管如此，这件被诅咒的衬衫现在已经脱下来了，为你省去了很多麻烦。");
            get_player().setUndergarment(UndergarmentLib.NOTHING,0);
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function ceraphRemoveBindingNobleShirt() : void
      {
         outputText("[pg]不可否认，它的魔法效果可能有一些用处，但它与穿戴者绑定的方式是个问题。如果你能对它有那么多的控制权就好了……在短暂地思考之后，你让步了，她可以保持它的“乐趣”，只要它能很容易地被解开。");
         outputText("[pg]一个恶魔般的笑容在她的脸上蔓延开来。[say:我很高兴看到你拥抱一点冒险，[Master]。]塞拉芙神秘地让衬衫悬浮起来，并念诵了一些奥术咒语。这似乎需要高度集中注意力，但突然间闪过一道光芒！[say:现在你可以享受你想要的所有乐趣了，而且它会在你闲暇时解开。]");
         get_undergarments().SEA_SHIRT.saveContent.bound = false;
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function ceraphRapePlayChoice2(param1:int) : void
      {
         clearOutput();
         switch(param1)
         {
            case 0:
               outputText("现在最初的震惊已经过去，你发现自己一想到怀孕就脸红了。这可能不完全是你所要求的，但你不能否认它让你多么兴奋。你告诉她你不介意，而且你也不介意这种事再次发生。");
               saveContent.rapePlay = 1;
               break;
            case 1:
               outputText("好吧，你的措辞不是很具体，而且这也不是什么大不了的事，你不会太责怪她，但这确实是一个惊喜。低头看着你的下体，你想知道她是否真的让你怀孕了。无论如何，你告诉她你不希望她以后再做类似的事情。");
               saveContent.rapePlay = 2;
               break;
            case 2:
               outputText("她绝对应该知道，你不想让她把[i:imps]放进你体内。你会感谢她永远不要再做这种事。低头看着你的下体，你只感到恶心。你告诉她，你必须为她的行为想出一个合适的惩罚。");
               saveContent.rapePlay = 2;
         }
         outputText("[pg]她想了一会儿才说：[say:好吧，[Master]，我会记住的。但是所有这些……“剧烈”的活动让我有点累了，所以如果你不介意给我一点时间恢复的话……]");
         outputText("[pg]你离开了这个女恶魔，她温暖的精液还在从你体内流出。");
         get_player().knockUp(1,400,61);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function ceraphRapePlayChoice() : void
      {
         var choice2:int;
         var _g2:CeraphFollowerScene;
         var choice1:int;
         var _g1:CeraphFollowerScene;
         var choice:int;
         var _g:CeraphFollowerScene;
         clearOutput();
         outputText("塞拉芙满意地叹了口气，瘫倒在地上，她的肉棒从你大张的入口滑出。一股精液随之流出，滴落在泥土上，这让你彻底认清了现实。她真的射在你里面了吗？");
         outputText("[pg]当你向[ceraphbus]表达你的震惊时，她只是困惑地眨了眨眼，说道：[say:当然了，[Master]。你要求我随心所欲的。]她低下头，但你还是能捕捉到她脸上的笑容。[say:难道我没有令人满意地执行你的命令吗？]她面无表情地问道。");
         menu();
         _g = this;
         choice = 0;
         addNextButton("喜欢",function():void
         {
            _g.ceraphRapePlayChoice2(choice);
         }).hint("其实还挺性感的。");
         _g1 = this;
         choice1 = 1;
         addNextButton("她做到了",function():void
         {
            _g1.ceraphRapePlayChoice2(choice1);
         }).hint("你觉得你不能怪她，但你不希望这种事再次发生。");
         _g2 = this;
         choice2 = 2;
         addNextButton("她没有",function():void
         {
            _g2.ceraphRapePlayChoice2(choice2);
         }).hint("这是不可接受的。");
      }
      
      public function ceraphRapePlay() : void
      {
         clearOutput();
         if(saveContent.rapePlay != 0)
         {
            outputText("还没开口，你就感觉到脸上开始发烫，但你无法把这个想法从脑海中赶出去，所以你请求塞拉芙再次“强暴”你。她只惊讶了一瞬，随后脸上便浮现出得意的坏笑。");
            outputText("[pg][say:嗯……我真的不知道该拿你怎么办，[name]。你费了那么大劲把我拉下马，但现在你把我留在这里，却暴露了你的本性。一个不知悔改、毫无价值的荡妇。[i:请求]一个恶魔来强暴你——你知道你有多可悲吗？]");
            outputText("[pg]还没开始呢，她就已经这么恶毒了。你想知道是否——");
         }
         else
         {
            outputText("你告诉塞拉芙你想换点花样。事实上，你想在这次遭遇中做个受，你希望你的[ceraphbus]用她想要的任何方式占有你。最好粗暴一点。她盯着你看了几秒钟，脸上带着难以捉摸的表情，然后突然咧嘴笑了。");
            outputText("[pg][say:你显然没有考虑清楚，愚蠢的凡人。]");
            outputText("[pg]她走近了一步，当你注视着她那引人注目的面容时，你原本想好的任何回答都卡在了喉咙里。她脸上挂着残忍的冷笑，也许是你的错觉，但她的角看起来似乎比平时更长了。你受到了很大的影响，以至于当她靠近你时，你实际上向后[if (singleleg) {挪动|退了一步}]。");
            outputText("[pg][say:什么？你以为我是你的小宠物？一只你可以为所欲为的笼中鸟？以为我已经懦弱到忘记了我的本性？]她舔了舔嘴唇，那双黑曜石般的眼睛里闪烁的火焰确实有些吓人。[say:[Name]，我是一个[b:恶魔]。你忘了这一点。]");
            outputText("[pg]她语气中的某些东西让你真的开始担心了，但这[i:只是]角色扮演。对吧？你问她打算做什么，无法掩饰声音中的颤抖。");
            outputText("[pg]她凑上前，在你耳边轻声细语，[say:我要让你怀孕，[name]。我要让你记住我是什么。]");
            outputText("[pg]你的胃里一阵翻江倒海。你是让她强暴你，没错，但是——");
         }
         outputText("[pg]你的思绪被打断了，你突然发现自己脸朝下摔在了泥土里。你被这突如其来的动作惊呆了，但当你感觉到有什么东西[if (isnaked) {擦过你的[skindesc]|撕扯你的[armor]}]时，你更加惊讶了。你情不自禁地叫出声来，然后才想起自己的处境。然而，当你回过神来时，你扭过头，颤抖着告诉她你[if (isnaked) {会做她想做的任何事|可以自己脱衣服}]，尽管她从后面骑上你的压力让你怀疑她是否在乎。");
         outputText("[pg][say:闭嘴，凡人，]她说着，一只手掐住你的喉咙，脸上几乎看不出任何认识你的迹象。她看起来完全就像你初见她时那样——一个正在狩猎猎物的恶魔。[say:你会成为一个好母亲的。你会喜欢的。]");
         outputText("[pg]她没有再多说一句话，[if (isnaked) {用力捏了一把你的[ass]|撕掉了你最后的防护}]，让你不禁打了个寒颤。你的[vagina]任她索取，但即便如此，你也没料到她会如此粗暴，当她的肉棒野蛮地猛插进你体内时，你发出了一声尖叫。");
         get_player().cuntChange(20,true,true);
         outputText("[pg][say:嗯，你还不错，]她说。[say:作为肉便器来说还不错。用来装我马上要射进去的小恶魔简直完美。]她显然感觉到你在她身下扭动了一下，发出一声轻笑。[say:冷静点，你什么也做不了。]");
         outputText("[pg]话音刚落，她的肉棒就在你体内膨胀起来，预示着她承诺给你的那股浓精。它似乎一直在变大，直到让你感到有些不适，上面的凸起挤压着你的肉壁，不过当她开始抽插时，你还是忍不住呻吟出声。她非常明显地享受着这一切，轻笑着开始认真地操你。");
         outputText("[pg]恶魔粗暴地蹂躏着你，用她全身的重量将你压在地上，完全不顾及你的感受。尽管如此，她还是强行从你受虐的身体里逼出了快感，虽然你忍不住为此感到羞耻。她的肉棒吻上了你体内的一个点，点燃了你的神经，但与此同时，她在你屁股上狠狠拍了一巴掌，几乎盖过了第一种感觉。");
         outputText("[pg]一滴眼泪不由自主地滑落，滴在营地的尘土中。当[ceraphbus]在你体内冲刺时，你尽力保持安静，但她却毫无顾忌，随心所欲地呻吟、低吼，甚至大笑。显然对你的反应不满意，恶魔毫不留情地[if (hashair) {拽住你的头发|把你的头向后猛拉}]，逼出你一声介于呻吟和哭喊之间的声音。");
         outputText("[pg]但在这一切面前，你能感觉到核心深处有一个结正在收紧。尽管你正在遭受屈辱和痛苦，或者也许正因为如此，恶魔粗暴的动作对你的身体产生了不可抗拒的影响。你开始感到轻飘飘的，恐慌和快感在你的脑海中交织，直到你迷失在混乱之中。");
         outputText("[pg]几乎在你意识到之前，你就能感觉到高潮即将来临。塞拉芙的抽插稳定而有力，每一次都能准确无误地击中那个点。她确实是个淫魔，你发现自己无法克制，一阵颤栗传遍全身，你绝望地高潮了。");
         outputText("[pg][ceraphbus]注意到了你体内的颤抖，在你拼命试图恢复时停顿了片刻。[say:嗯？哦，你真是个十足的婊子，不是吗？我很高兴你喜欢被搞大肚子。我压抑太久了，所以能真正让你认清自己的位置感觉真好。你以为自己打败了恶魔是个英雄，但其实你想要的只是[i:这个]。]");
         outputText("[pg]最后一个词伴随着一次特别深的抽插，感觉就像要把你刺穿一样。你仍然非常敏感，但恶魔没有表现出任何怜悯。她的节奏不断加快，你能感觉到她灼热的呼吸喷在你的后颈上，她那长着利爪的手指掐进了你的腰侧。你体内的肉棒开始抽动，每一次动作都让你全身颤抖。");
         outputText("[pg]当[ceraphbus]将她的激情倾注在你的后背时，一种奇怪的感觉占据了你，你不再知道自己对这一切有什么感觉。你只知道，你上一次高潮的余韵正在发展成第二次高潮。恶魔的重量将你的阴蒂压在坚硬的泥土上，虽然痛苦，但你无法否认这种对待带来的不断增长的快感。");
         outputText("[pg][say:我希望你准备好了，不过话又说回来，这不重要，]她压在你身上说道。你猛地睁大眼睛。她真的打算——");
         outputText("[pg]伴随着最后一声几乎是野兽般的嚎叫，塞拉芙释放了，她那污秽的精液冲进你体内，瞬间将你完全填满。你能感觉到她那肿胀的肉棒每一次跳动和脉动，她的臀部继续撞击着你的臀部，发出幸福的娇喘。即使她的爪子抓进你的背部，你也忍不住紧随其后，你的肉壁再次收紧，不由自主地迎来了第二次高潮。");
         outputText("[pg]你的高潮持续了异常长的时间，当[ceraphbus]继续抽插时，你除了在她身下扭动之外什么也做不了。你不知道这是她的恶魔魔法，还是时间对你来说静止了，但这一刻的狂热似乎在无限延伸，被完全填满的感觉让你的大脑一片空白。她释放在你体内的洪流毫无疑问地证明了她的能力，她的耐力绝对是不正常的，让她能够在你预期的极限之后继续让你受孕。在感觉过了几个小时之后，你感觉到她体内的最后一次抽动，然后她停了下来。");
         get_player().orgasm("Vaginal");
         if(saveContent.rapePlay == 0)
         {
            doNext(ceraphRapePlayChoice);
         }
         else if(saveContent.rapePlay == 1)
         {
            outputText("[pg]塞拉芙趴在你身上喘着粗气，过了好几分钟你才意识到发生了什么。她又射在你里面了！你很可能又从你所谓的奴隶手中得到了一个小恶魔孩子，但你觉得这也是你自找的。终于，[ceraphbus]从你身上爬起来站好。");
            outputText("[pg][say:那么，这符合你的期望吗，[Master]？]");
            outputText("[pg]确实如此。残留的快感仍在你的体内涌动，你对她的表现非常满意，所以你暂时放过了你的奴隶。她简单地点了点头接受了你的慷慨，然后溜走了，留下你独自思考从下体漏出的精液。");
            get_player().knockUp(1,400,61);
            doNext(get_camp().returnToCampUseOneHour);
         }
         else
         {
            outputText("[pg]你立刻向前猛扑，眼中喷着怒火从她身下爬了出来。你非常明确地告诉过她不要这样做——她公然违抗了[master]的命令，她最好能给个解释。");
            outputText("[pg][say:嗯？有什么问题吗？]她端庄地问道。");
            outputText("[pg]问题是你被射满了——！你的手划过腹股沟，发现那里完全没有她的精液，你的思绪戛然而止。你低下头确认，确实，那里唯一的液体是你自己的爱液。太奇怪了，你确信你感觉到了她的精液射进你体内。");
            outputText("[pg][say:女人总有她的小把戏，]她看到你的困惑，说道。[say:我想你可能会喜欢这种感觉。]");
            outputText("[pg]好吧，你确实很享受其中的一部分，所以你也没什么好抱怨的。你又试探性地戳了戳自己，因为你不会再次怀孕的事实已经深入人心。既然现在没什么别的要求了，你就打发塞拉芙离开，好让自己从这次遭遇中恢复过来。");
            doNext(get_camp().returnToCampUseOneHour);
         }
      }
      
      public function ceraphLeaveNobleShirt() : void
      {
         clearOutput();
         outputText("你准备好了就会来找她；然而，这个诅咒目前并没有威胁到你的生命。在你做出其他决定之前，探索情况将是首要任务。");
         outputText("[pg][say:如您所愿，[Master]。]");
         get_undergarments().SEA_SHIRT.saveContent.ceraphLeftIt = true;
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function ceraphLackeyCorruption() : void
      {
         clearOutput();
         outputText("你咧嘴一笑，告诉小恶魔们你会接受塞拉芙的贡品。然后你绕着女孩走了一圈，打量着她。[pg]");
         outputText("她非常漂亮……身高大约5英尺4英寸，留着齐肩的金发。她的脸被眼罩蒙着，你用力把它扯了下来。她害怕地喘着气，看着你；她的眼睛像海洋一样蓝，嘴唇粉嫩丰满。[pg]");
         outputText("你视线下移，打量着她的乳房，猜测至少有D罩杯，并看到她戴着一对用链子连接的乳头夹。她的双手被一副皮质手铐铐在身后。[pg]");
         outputText("你伸手探入她的双腿之间，将它们分开以探索她的小穴；当你这样做时，她喘息着。你摸了摸她的小穴，发现它很湿润……哈！这婊子很享受她的困境！你向她展示你闪闪发光的手指，她羞愧地移开了视线。[pg]");
         outputText("小恶魔给你的那瓶黑色液体尝起来又酸又浓，当它滑下你的喉咙时，你能感觉到它在你的喉咙里烧出一条液态热流。液体在你的肚子里沉淀下来，热量传遍你的全身；然后集中在你的胯部。[pg]");
         if(!get_player().hasCock())
         {
            outputText("当你感觉到血液涌向你的腹股沟时，强烈的快感淹没了你；");
            if(get_player().hasVagina())
            {
               outputText("你的[clit]肿胀起来");
            }
            else
            {
               outputText("你的阴阜上形成了一个小凸起");
            }
            outputText("，然后长成了一根16英寸长、3英寸粗的巨大勃起物！龟头几乎要从徒劳地试图包裹它的包皮中爆裂而出。");
         }
         var _loc1_:int = get_player().biggestCockIndex();
         var _loc2_:Boolean = false;
         if(get_player().hasCock())
         {
            if(get_player().cocks[_loc1_].get_cockType() == CockTypesEnum.DEMON)
            {
               _loc2_ = true;
            }
         }
         if(get_player().cockArea(get_player().biggestCockIndex()) < 48 && get_player().hasCock())
         {
            outputText("你的" + get_player().cockDescript(_loc1_) + "跳动着，青筋暴起，变得越来越大，膨胀到了20英寸长、3英寸粗的惊人尺寸。");
         }
         if(!get_player().hasCock() || !_loc2_)
         {
            outputText("一股令人头晕目眩的麝香味从你的肉棒散发出来，接着它的颜色突然变成了闪亮的非人紫色，肉棒上长出了微小敏感的结节；冠状沟处长出了一圈橡胶状的突起，随着你越来越兴奋，这些突起也变得越来越大。[pg]");
         }
         else
         {
            outputText("你抚摸着你那恶魔般的肉棒，让它完全勃起；它跳动着，仿佛知道接下来会发生什么。[pg]");
         }
         outputText("你欣赏着这根跳动的恶魔肉棒，前列腺液从顶端渗出，润滑了你的肉棒，并滴下淫秽的液体落入泥土中；女孩惊恐地看着你。小恶魔们盯着你那被污染的肉棒和女孩恐惧的表情，兴奋地喘着粗气，它们自己的肉棒也因为眼前的景象而硬了起来。[pg]");
         outputText("你命令它们解开女孩的束缚并按住她。它们迅速照做，解开皮质袖口，将女孩按倒在地，然后分开她的双腿，让你能更好地进入她那湿润的通道。[pg]");
         outputText("你抓住她的臀部，用你那布满颗粒的肉棒摩擦她的阴蒂来挑逗这个可怜的女孩，迫使她发出不情愿的欢愉呻吟；片刻之后，她在高潮中尖叫，她的淫液已经溅到了你的");
         if(get_player().balls > 0)
         {
            outputText("阴囊和");
         }
         outputText("[legs]上。当女孩放松下来，头无力地垂在地上时，按住她四肢的小恶魔们嘲笑着她；你示意小恶魔们放开她并退后，然后将自己对准她的小穴。[pg]");
         if(get_player().cockArea(_loc1_) >= 60)
         {
            outputText("很明显，如果你用你这种尺寸的肉棒插进她体内，你会把她撕裂的；谢天谢地，其中一个小恶魔走上前来，拿着一瓶装有蓝色液体的药剂，强行灌进她的喉咙。她毫无抵抗地喝了下去，然后喘息着再次高潮，淫液四溅，她的小穴似乎变得富有弹性且足够湿润，让你毫不费力地将你那巨大的恶魔肉棒的顶端插进她体内。[pg]");
         }
         outputText("你深深刺入她温暖的深处，当你的肉棒强行撑开她的肉壁时，她发出了一声呻吟。当你们的胯部最终碰撞在一起时，她尖叫着，[say: 对，就是这样！]并再次高潮，即使你开始认真地抽插她，她也用强有力的收缩榨取着你的肉棒。塞拉芙的药剂一定在扰乱你的神经末梢；你肉棒新获得的敏感度和她小穴的刺激让你无法忍受，你在她体内爆发了，将一股又一股的精液射入女孩被撑开的小穴中。[pg]");
         outputText("你清空了");
         if(get_player().balls > 0)
         {
            outputText("你的蛋蛋");
         }
         else
         {
            outputText("你自己");
         }
         outputText("，然而你的胯部继续抽插着女孩，仿佛它们有自己的意识。她的双腿夹住你的腰，以新获得的力量将自己从地上抬起，投入你的怀抱。她闭上眼睛片刻，然后睁开，带着近乎绝望的目光。[say: 还要！]她饥渴地要求道。她原本海蓝色的眼睛已经变成了霓虹粉色的欲望药丸，镶嵌在曾经是白色巩膜的黑暗背景上。看着那双眼睛，你觉得你非常乐意满足她的要求。[pg]");
         outputText("你用力地操着她，你们身体上滴落的汗水交融在一起。她拼命地在你身上摩擦，电流般的快感在你们体内激荡；小恶魔们全神贯注地看着，对着你们上演的好戏公然自慰。伴随着一声呻吟和一次有力的活塞运动，你迎来了第二次高潮；这反过来又引发了女孩的另一次高潮。[pg]");
         outputText("你再次无法停止疯狂的抽插，女孩尖叫着，皮肤变成了浅紫色。你们邪恶的欲望都没有得到满足，于是你们又开始认真地操弄彼此。你粗壮的恶魔肉棒捣进她饱受蹂躏的肉壶，挤出一点点精液的黏糊声，而她则扭动着臀部，诱哄你射出更多来填补空缺。这种恶性循环持续了许多次高潮；你每次射进她体内，她就会失去一部分人性，变得更像恶魔。首先是她的头上长出了新的角，然后她的头发变成了和虹膜一样的粉红色，并变长及至后腰。她的双手长出了黑色的爪子，用来抓挠你的皮肤，她的双脚长出了恶魔般的高跟鞋，进一步完善了她淫荡的姿态。她的臀部膨胀，乳房变大，变得丰满起来，呈现出英格纳姆大多数女孩梦寐以求的沙漏型身材；她乳头上的夹子随着乳房的增大而崩裂，乳汁从乳尖喷涌而出，汇入你们两人身下形成的混合体液池中。[pg]");
         outputText("她的舌头变得像蛇一样，充满催眠魔力地起伏着，她充分利用这一点，侵入你的口腔和喉咙，强迫你与她进行湿润的法式热吻。最后，伴随着最后一次绝望的冲刺，你将最后的一股精液注入她体内，完成了她的转化。巨大的蝙蝠状翅膀从她的肩膀上长出，一条带有黑桃尖端的尾巴从她的屁股上方爆出。她用嘴包住你的嘴，在狂喜中尖叫，最后终于放开你，瘫倒在地上喘息着。你也紧随其后，倒在她身上，把头靠在她的乳房上。[pg]");
         outputText("她抚摸着你的头，咯咯地笑着，[say:希望你喜欢我们的小幽会，" + get_player().mf("主人","女主人") + "。塞拉芙大人说你是个操逼好手，她可没撒谎。]你惊讶地抬起头；她是故意变成恶魔的吗？[pg]");
         outputText("[say:不，傻瓜！]她回答道，似乎看穿了你的心思。[say:我当魅魔已经好几年了。只是我觉得被制服并变成性爱机器的想法太性感了……嗯……你可以感谢塞拉芙大人的这个特殊癖好，]她说着，把头转向一侧，向你展示她耳朵上一个发光的黑色小耳钉。[pg]");
         if(!_loc2_)
         {
            outputText("你从她身上爬起来，坐在泥地上；她咧嘴一笑，慢慢向你爬来，将你那根恶魔肉棒含进嘴里，吸吮的力度之大，让你担心她会把你的肉棒整个吞下去。慢慢地，你感觉到有什么东西从你敏感的肉棒里流出来，流进她的嘴里，然后她伴随着<b>啵</b>的一声拔了出来。[say:这应该能解决药效问题了，" + get_player().mf("主人","女主人") + "。]正如她所说，你看着你的肉棒慢慢恢复了原来的颜色");
         }
         if(!_loc2_ && !get_player().hasCock())
         {
            outputText("，随后临时的阴茎萎缩并消失在你的胯部");
         }
         if(!_loc2_)
         {
            outputText("。[pg]");
         }
         outputText("她诱惑地对你微笑，舔了舔嘴唇。一阵拍打声伴随着多重喘息和娇喘引起了你的注意；你和魅魔都四处寻找声音的来源。那些为你带来魅魔的小恶魔们仍在疯狂地自慰。她挑起一根眉毛看着你，说道：[say: 只有一件事你必须做，才能完全征服我。命令我去取悦那些低贱的小恶魔。][pg]");
         outputText("你要这么做吗？");
         get_player().orgasm("Generic");
         dynStats(DynStat.Lib(-3),DynStat.Cor(5));
         menu();
         addButton(0,"同意",acceptMoreCeraphFauxCorruption);
         addButton(1,"拒绝",declineCeraphFauxCorruption);
         addButton(4,"再也不玩",iQuitCeraphCorruptionDemons);
      }
      
      override public function ceraphIsFollower() : Boolean
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,286) <= 0)
         {
            return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,287) > 0;
         }
         return true;
      }
      
      public function ceraphFollowerTitTaking(param1:int = 0) : void
      {
         spriteSelect(SpriteDb.get_s_ceraphClothed());
         clearOutput();
         var _loc2_:int = param1;
         if(get_player().breastRows[_loc2_].fuckable)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,217,4);
         }
         else if(get_player().lactationQ() >= 100)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,217,5);
         }
         else
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,217,3);
         }
         outputText("你拉下你的[armor]，向塞拉芙露出你的胸部，并示意你希望她拿走它。她笑得像一只偷腥成功的猫，低语道，[say: 你的愿望就是我的命令，[Master]。]");
         outputText("[pg]塞拉芙用手托着你的" + get_player().breastDescript(_loc2_) + "颠了颠，玩弄了几秒钟后，她的指甲深深陷入其中并用力拉扯。你的乳房被拉伸了一会儿，紧绷着，而塞拉芙则残忍地咯咯笑着。热量在你的胸腔内绽放，生动的刺痛感从塞拉芙的指尖辐射到你的深处。终于，这种感觉达到了顶峰，伴随着一声低沉的“砰”，你的乳肉从身体上分离了。你仔细观察着离开的乳房——它曾经与你身体相连的地方，现在覆盖着健康的粉红色皮肤和复杂神秘的纹身。同时，");
         if(_loc2_ < int(get_player().breastRows.length) - 1 && int(get_player().breastRows.length) > 1)
         {
            if(_loc2_ >= int(get_player().breastRows.length) - 2)
            {
               outputText("你的躯干发生了变化，你的" + get_player().breastDescript(_loc2_ + 1) + "向上移动，填补了空缺。");
            }
            else
            {
               outputText("你的躯干发生了变化，你其他的乳房向上移动，填补了空缺。");
            }
            get_player().removeBreastRow(_loc2_,1);
         }
         else if(_loc2_ == 0)
         {
            outputText("你现在平坦的胸部慢慢长出了两个四分之一英寸的小乳头。");
            get_player().breastRows[0].breastRating = 0;
            get_player().nippleLength = 0.25;
            get_player().breastRows[0].breasts = 2;
            get_player().breastRows[0].nipplesPerBreast = 1;
            get_player().breastRows[0].fuckable = false;
            get_player().breastRows[0].lactationMultiplier = 0;
         }
         else
         {
            outputText("你的躯干留下了一个平坦、毫无特征的空洞。");
            get_player().removeBreastRow(_loc2_,1);
         }
         if(int(get_player().breastRows.length) == 0)
         {
            outputText("<b>错误！错误！如果你不想让你的存档被破坏，请联系Fenoxo并重新加载你的游戏。</b>");
         }
         outputText("[pg]");
         outputText("当塞拉芙");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,217) == 3)
         {
            outputText("在手中揉捏着乳头时");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,217) == 4)
         {
            outputText("将指尖推入漏水的乳头小穴时");
         }
         else
         {
            outputText("挤出一股乳汁时");
         }
         outputText("，你喘着粗气，双腿有些发软。塞拉芙笑着将那对弹力十足的球体降到她的双腿之间，当她用你脱离身体的乳房进行乳交时，你能感觉到她那堕落肉棒上的每一个小凸起和结节。[pg]");
         outputText("[say: 哦哦，有人喜欢被一根又硬又粗的肉棒埋在乳房里吗？也许我应该把这些留在你身上，这样我在离开前就能充分享受了。也许下次吧，] 恶魔一边嘲弄着，一边继续用你曾经的乳房进行乳交。[say: 别担心，[Master]，我一定会给它们找个好归宿的。你应该能从这些小白兔身上得到很多美梦！][pg]");
         outputText("塞拉芙转过身，在岩石间蹦蹦跳跳地离开了，每隔一会儿就用力捏一下你的乳头，提醒你做出的选择。没过多久她就消失了，留下你独自应对乳房中那根肉棒逐渐减弱的感觉。[pg]");
         dynStats(DynStat.Lust(20),DynStat.Cor(5));
         var _loc3_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc3_,220,FlagDict_Impl_.arrayReadInt(_loc3_,220) + 1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function ceraphFollowerEncounter(param1:Boolean = false) : void
      {
         if(param1)
         {
            ceraphFollowerAppearance();
            return;
         }
         if(Utils.rand(24) == 0 && get_player().hasCock())
         {
            catgirlEncounter();
         }
         else if(Utils.rand(24) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,293) == 0)
         {
            carephCorruptionSlaves();
         }
         else if(Utils.rand(24) <= 1 && get_player().get_gender() > 0)
         {
            encounterZetsuko();
         }
         else
         {
            ceraphFollowerAppearance();
         }
      }
      
      public function ceraphFollowerCuntTaking() : void
      {
         spriteSelect(SpriteDb.get_s_ceraphClothed());
         clearOutput();
         outputText("你脱下衣服，刚好露出你的[vagina]。塞拉芙开心地笑着，若有所思地说，[say: 我正好有个麻烦的荡妇，如果把她的嘴换成小穴，她就能学到一两招了。操脸真是一种有效的管教技巧，谢谢你，亲爱的。]");
         outputText("[pg]塞拉芙的指甲痛苦地刺入你的[skindesc]，在你的外阴周围做圆周运动。随着她的手指深入，像开瓶器一样穿透你的血肉，疼痛感逐渐消退，变成一种温和的、悸动的热量。一秒钟后，她向后一拉，一根没有特征的、被皮肤包裹着的肉柱坐在她的手里，顶部是你的[vagina]。另一端盖着一个奇怪的、神秘的印记，似乎是纹在皮肤上的。你低头看去，以为你的腹股沟被毁了，但你阴道曾经占据的地方被光滑、没有印记的皮肤所取代。");
         outputText("[pg]恶魔将一根手指滑入她手里拿着的小穴，你莫名其妙地呻吟起来，仍然清晰地感觉到每一种感觉。她又玩弄了几秒钟，手指发出轻柔的“噗嗤-噗嗤-噗嗤”声在空气中传播，然后她似乎厌倦了挑逗你。");
         outputText("[pg][say: 哦，别介意这些感觉，等我走远一点，把它塞进我的一个宠物里，感觉就会消失了。再次感谢你，[Master]，支持你宠物不断扩大的后宫。我一定会马上把这个新的便携小穴派上用场，这样你很快就会做个好梦了。不过我会想念它长在你身上的样子的，所以如果你愿意的话，请把它长回来。]塞拉芙带着一种假装温顺的神情指示道。");
         outputText("[pg]你惊愕地咬紧牙关，试图在塞拉芙开始飞走时保持直立，她一边飞一边自慰你旧的小穴来取乐。淫荡的挤压声似乎在空气中回荡，你无能为力，只能在泥土中扭动和呻吟，因为你被一个不存在的阴道带到了高潮。似乎她一离开营地，就忘记了她应该是你顺从的母狗。");
         get_player().removeVagina(0,1);
         get_player().orgasm("Vaginal");
         dynStats(DynStat.Lib(-2),DynStat.Sens(-2),DynStat.Cor(5));
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,219,FlagDict_Impl_.arrayReadInt(_loc1_,219) + 1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function ceraphFollowerCockTaking(param1:Boolean = false) : void
      {
         spriteSelect(SpriteDb.get_s_ceraphClothed());
         clearOutput();
         var _loc2_:int = get_player().biggestCockIndex();
         if(param1)
         {
            _loc2_ = get_player().smallestCockIndex();
         }
         var _loc3_:int = _loc2_ + 1;
         outputText("你叹了口气，脱下衣服，指着你的[cock " + _loc3_ + "]，示意塞拉芙可以拿走它。塞拉芙窃笑着，[say: 乐意之至，我的[Master]。]");
         outputText("[pg]当塞拉芙的手指拂过你的" + get_player().cockDescript(_loc2_) + "时，你感到出乎意料的灼热，仿佛她刚从热水浴缸里出来一样。你还没来得及细想这个小细节，她的手指就捏成了一个紧紧的圆环");
         if(get_player().cocks[_loc2_].cockThickness >= 4)
         {
            outputText("，将你粗壮的肉棒压缩成坚硬的肉柱");
         }
         outputText("，慢慢收紧。这本该很痛，但你却没有感觉到痛，只是觉得越来越热，然后伴随着突然的“啵”的一声，塞拉芙手里拿着你的" + get_player().cockDescript(_loc2_));
         if(get_player().balls > 0 && get_player().cockTotal() == 1)
         {
            outputText("和睾丸");
            get_player().balls = 0;
            get_player().ballSize = 1;
         }
         if(get_player().cockTotal() == 1)
         {
            get_player().removeStatusEffect(StatusEffects.Infested);
         }
         outputText("！在根部有光滑的血肉和一个神秘的印记，不知怎么的，这让离体的阴茎在她的抓握中依然保持着活力，跳动和蠕动着。你腹股沟上的那个地方变得完全光滑，没有任何特征，仿佛它从未存在过一样。");
         outputText("[pg]塞拉芙用手指在上面上下滑动，在你的脑海中燃放起烟花——你还能感觉到它！恶魔女大笑着说，[say: 别担心，等我把它拿远一点，感觉就会消失了，不过你知道晚上会有什么期待，对吧？现在，享受这快感吧！哦，再次感谢你，你不会后悔的。如果你后悔了，概不退货。]");
         outputText("[pg]她旋转着离开，几乎是跳着舞飞向天空，同时抚摸和挑逗着你刚刚失去的阴茎。当高潮席卷你的身体时，你颤抖着，你的精液像雨点一样落在几千英尺外。你发誓，你能听到你的宠物在笑。");
         get_player().orgasm("Dick");
         dynStats(DynStat.Lib(-2),DynStat.Sens(-2),DynStat.Cor(5));
         var _loc4_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc4_,218,FlagDict_Impl_.arrayReadInt(_loc4_,218) + 1);
         get_player().removeCock(_loc2_,1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function ceraphFollowerAppearance(param1:Boolean = true) : void
      {
         var _g:Camp;
         if(param1)
         {
            clearOutput();
         }
         spriteSelect(SpriteDb.get_s_ceraphClothed());
         var _loc2_:NobleShirt = get_undergarments().SEA_SHIRT;
         if(param1)
         {
            outputText("你走到营地一个僻静的角落，在脑海中呼唤你驯服的[ceraphbus]。");
            outputText("[pg]塞拉芙从一块巨石后大步走来，仿佛变魔术一般。她的外表相当有威慑力，但你很清楚她已经被彻底驯服了。这只[ceraphbus]在你面前跪下，没有命令绝不与你对视。她低声说道，[say: 您叫我，" + get_player().mf("主人","女主人") + "？]");
         }
         menu();
         addButton(0,"外貌",ceraphAppearance).hint("看看你的恶魔奴隶。");
         addButton(1,"交谈",ceraphTalkMenu).hint("试着和她谈谈。");
         addButton(2,"性爱",ceraphSexMenu).hint("享受你征服的" + ceraphBus() + "。").sexButton(0);
         addButton(3,"角色扮演",followerCeraphRoleplay).hint("你可以和她玩点角色扮演。根据你的喜好，你可以在这场游戏中扮演顺从或支配的一方。").sexButton(0);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,288) == 0)
         {
            addButton(5,"变女性",cawkTawgle).hint("要求塞拉芙把她的肉棒藏起来——至少在你面前是这样——以完全女性的姿态出现。");
         }
         else
         {
            addButton(5,"变扶她",cawkTawgle).hint("允许塞拉芙在你面前重新长出或展示她的阴茎。");
         }
         addButton(6,"部位交换",giveFollowerBodyBits).hint("和塞拉芙谈谈她的提议。");
         addButton(7,"性癖",ceraphFetishMenu).hint("管理你的性癖。");
         if(get_player().get_upperGarment() == _loc2_ && _loc2_.knownBound())
         {
            if(!_loc2_.saveContent.ceraphAsked)
            {
               addButton(8,"诅咒衬衫",askCeraphAboutNobleShirt).hint("她的专长是诅咒装备，不是吗？");
            }
            else if(_loc2_.saveContent.ceraphLeftIt)
            {
               addButton(8,"脱下衬衫",ceraphRemoveNobleShirt).hint("没必要等了，让她解决这个问题。");
            }
         }
         else if(get_player().hasItem(_loc2_) && !_loc2_.isNormalShirt())
         {
            addButton(8,"解除附魔",ceraphDisenchantNobleShirt).hint("她能解除这件衣服上的诅咒吗？");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1086) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1077) == 1)
         {
            addButton(10,"农活",helpWithFarm);
         }
         if(get_player().hasItem(get_consumables().LIDDELL) && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2727) >= 0)
         {
            addButton(11,"奇怪的药水",idLiddellium);
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2727) < 0)
         {
            addButton(11,"利德尔药水",getLiddellium).hint("塞拉芙能再提供一些吗？");
         }
         _g = get_camp();
         addButton(14,"离开",function():void
         {
            _g.campSlavesMenu();
         });
      }
      
      public function ceraphFetishMenu() : void
      {
         var _g:CeraphFollowerScene;
         menu();
         if(!get_ceraphScene().hasPacifism())
         {
            addButton(0,"获得性癖",CeraphHandsOutNewFetishesLikePervCandy).hint("如果你愿意，你可以允许塞拉芙赋予你她的一种性癖。");
         }
         else
         {
            addButtonDisabled(0,"获得性癖","你已经拥有了塞拉芙能提供的所有性癖。");
         }
         if(get_ceraphScene().hasExhibition())
         {
            addButton(1,"移除性癖",unfetishifyYourselfWithFollowerCeraph).hint("如果你受够了某种性癖，你可以要求塞拉芙将其移除。");
         }
         else
         {
            addButtonDisabled(1,"移除性癖","你没有...被塞拉芙强加的性癖。");
         }
         _g = this;
         setExitButton("返回",function():void
         {
            _g.ceraphFollowerAppearance();
         });
      }
      
      public function ceraphDispelNobleShirt() : void
      {
         outputText("[pg]你给了她一个心领神会的眼神，并确认了你想要的。顺从你的心意，塞拉芙拿起了那块精致的布料，你着迷地看着她的眼睛闪烁着耀眼的光芒。衬衫也闪烁着某种光环，在念了几个奥术词汇后，塞拉芙把它还给了你。[say:为了我亲爱的[Master]，什么都可以。]");
         outputText("[pg]你现在有了一件无害，但仍然迷人且舒适的贵族衬衫！");
         get_undergarments().SEA_SHIRT.saveContent.enchanted = false;
         get_undergarments().SEA_SHIRT.saveContent.bound = false;
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function ceraphDisenchantNobleShirt() : void
      {
         clearOutput();
         menu();
         outputText("你又一次找到了一件看起来很花哨的衬衫，如果有机会的话，它无疑会扭曲你的身体。然而，你想看看塞拉芙是否有什么见解，可以在不损坏衣服的情况下解除诅咒。");
         outputText("[pg]恶魔咧嘴一笑，把一根手指放在下巴下面，以示思考。[say:是的，我应该能做到，[Master]，但这难道不会破坏一点乐趣吗？]");
         addButton(0,"绑定",ceraphRemoveBindingNobleShirt).disableIf(!get_undergarments().SEA_SHIRT.saveContent.bound).hint("也许有一点乐趣，但承诺更少。");
         addButton(1,"驱散",ceraphDispelNobleShirt).hint("你确定你不希望这上面有任何诅咒的痕迹。").disableIf(!get_undergarments().SEA_SHIRT.saveContent.enchanted,"它已经被驱散了。");
      }
      
      public function ceraphBus() : String
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,288) == 0)
         {
            return "双性魅魔";
         }
         return "魅魔";
      }
      
      public function ceraphAppearance() : void
      {
         var _g:CeraphFollowerScene;
         clearOutput();
         outputText("这个恶魔奴隶像往常一样戴着镶有红色饰钉的项圈。然而，她不再像以前那样光着身子到处乱跑，而是穿上了一套淫荡的乳胶装，既遮掩又挑逗。从指尖一直到肩膀，她都被包裹在闪亮的黑色材料中。在她的脖子处，上衣敞开，露出紫色的乳房曲线，不过她的乳头被一件紧身、暴露的猩红色胸罩隐藏了起来，这件胸罩也是乳胶制成的。看起来似乎毫不费力就能把它撕掉。一件橡胶材质的人造紧身胸衣紧贴着她的腰部，在背后与手臂和肩膀上的材料相连。下面那条深红色的微型比基尼泳裤看起来根本遮不住塞拉芙双腿间的任何东西，但不知何故，它似乎勉强把一切都包裹住了。" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,288) == 0 ? "她那恶魔般的肉棒在紧绷的布料上形成了一道隆起，龟头微微从顶部探出" : "谢天谢地，她似乎用某种方法移除或隐藏了她那恶魔般的肉棒，以免用不女性化的凸起破坏她脆弱的装束。") + " 紧密的带扣将她的紧身胸衣与腿上的长筒过膝靴连接起来，防水台和高跟鞋让她的身高增加了近一英尺。红色的条纹顺着靴子前面和鞋底延伸，模仿着鞋带的样子。");
         outputText("[pg]塞拉芙那如液体般漆黑的双眼转动着，表面向内盘旋，汇聚成针尖大小的瞳孔。现在你能看清她的虹膜了，和她的皮肤一样是紫色的，闪闪发光，像宝石一样反光。当你打量她时，她刻意避开你的目光，完全接受了她作为你奴隶的应有角色。然而，你确实看到她的尾巴在身后扭动着，这证明了她内心某种未被满足的渴望。");
         _g = this;
         doNext(function():void
         {
            _g.ceraphFollowerAppearance();
         });
      }
      
      public function cawkTawgle() : void
      {
         var _g:CeraphFollowerScene;
         clearOutput();
         spriteSelect(SpriteDb.get_s_ceraphClothed());
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,288) == 0)
         {
            outputText("你告诉塞拉芙，你希望她在你身边时隐藏她的恶魔肉棒。你戴着项圈的恶魔女仆点点头，诱惑地垂下眼睑。她将一只手滑进乳胶内裤的前面，隔着布料抚摸了一下她那被玷污的阴茎，然后手指朝下，将它的形状隐藏起来。[pg]");
            outputText("她发出一声低沉的嗡嗡声，然后突然弓起背，手陷进去了一英寸。[say: 哦-哦-哦！]她呻吟着，把手抽开，一小串前列腺液将手与她现在没有凸起的内裤连在一起。她心不在焉地舔掉手指上的液体，问道：[say: 还有什么吩咐吗，我的" + get_player().mf("主人","女主人") + "？][pg]");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,288,1);
         }
         else
         {
            outputText("你告诉塞拉芙，你希望她在你身边时展示她的恶魔肉棒。她点点头，露出热切的笑容，将一只手滑进乳胶内裤的前面。当你低头看她的胯部，注意到她在布料下用力地用手指抠弄阴蒂，随着她的弯曲和抚摸，表面凸起时，她脸上那层全神贯注的伪装才被打破。[pg]");
            outputText("随着塞拉芙的抚摸，低沉的呻吟声越来越强烈，然后她突然将臀部向前猛推，一个凸起从她的指尖出现，并沿着内衣的前面向上移动。它越过了内裤线，紫色的龟头露了出来，上面涂满了大量的前列腺液，还在往下滴。她几乎是下意识地抚摸着肉棒，同时向你提出了下一个充满希望的问题。[say: 您还有什么<b>其他</b>想做的吗，" + get_player().mf("主人","女主人") + "？]显然，这种特殊的魔法壮举在个人层面上让她非常享受。");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,288,0);
         }
         _g = this;
         doNext(function():void
         {
            _g.ceraphFollowerAppearance();
         });
      }
      
      public function catgirlEncounter() : void
      {
         clearOutput();
         outputText("你呼唤塞拉芙，但她没有立刻出现，这让你有些惊讶。你环顾四周，想看看是不是错过了她，然后发现荒原上有别的东西正朝你飞奔而来。它扬起了漫天尘土，你还没来得及看清那是什么，它就");
         if(Utils.rand(50) <= get_player().getEvasionChance())
         {
            outputText("撞到了你身上，把你扑倒在地。过了一会儿，你发现自己面前是一对过于热情的猫人，正低头对你咧嘴笑。");
         }
         else
         {
            outputText("勉强与你擦肩而过，撞在你身后的地上。过了一会儿，两具身体从撞击点爬了起来。等她们站起身，你可以看到一对过于热情的猫人来到了你的营地。");
         }
         outputText("[pg]");
         if(get_noFur())
         {
            outputText("你打量了她们一会儿。她们大部分看起来像人类，有着浅色的皮肤和黑色的短发。长而灵活的尾巴在她们身后摇摆，尖尖的猫耳装饰在她们的头顶，毛发从根部的灰白色渐变到末端的深棕色或黑色。她们的胸前有着丰满的E罩杯乳房。她们有着像小猫一样清澈的蓝眼睛，给人一种天真无邪的感觉，但她们额头上的小角却暗示着并非如此。作为塞拉芙的宠物，她们的耳朵和尾巴上不出所料地打满了穿孔。有一件事在你脑海中反复盘旋，那就是这两个人完全一模一样；<b>你面对的是一对暹罗猫双胞胎</b>！[pg]");
         }
         else
         {
            outputText("你打量了她们一会儿。她们身体的大部分被光滑、柔软且柔韧的毛发覆盖，通常呈现出灰白色或珍珠母般的色调。这种颜色在她们的腿和脸上过渡为更深的层次，让她们看起来有一种调皮的、像猫头鹰一样的神态。她们有着猫科动物的腿和爪子，但她们的手臂看起来更像是长着肉垫的毛茸茸的手。长而灵活的尾巴在她们身后摇摆，尖尖的猫耳装饰在她们的头顶。她们的胸前有着丰满的E罩杯乳房，在更靠下的地方有一小块裸露的区域，那里突出了另一对乳头。她们有着像小猫一样清澈的蓝眼睛，给人一种天真无邪的感觉，但她们额头上的小角却暗示着并非如此。作为塞拉芙的宠物，她们的耳朵和尾巴上不出所料地打满了穿孔。有一件事在你脑海中反复盘旋，那就是这两个人完全一模一样；<b>你面对的是一对暹罗猫双胞胎</b>！[pg]");
         }
         outputText("两人异口同声地开始说话。[say: 塞拉芙主人来不了，所以她派我们来满足您的需求；姐妹俩在这里为您服务。] 选择权在你；你是要和这些" + (get_noFur() ? "" : "毛茸茸的、") + "热情的、长着猫" + (get_noFur() ? "耳" : "脸") + "的女孩玩耍，还是把她们打发走？[pg]");
         menu();
         addButton(0,"性爱",fuckCeraphsCatgirls);
         addButton(14,"离开",declineCeraphsCatgirls);
      }
      
      public function carryCarephsToken() : void
      {
         var _g:Combat;
         clearOutput();
         ceraphSprite(true);
         outputText("你告诉你的活体财产，你已经听够了关于她穿环的事，并从她手中一把夺过代币。塞拉芙睁大了眼睛，点了点头，显得十分害怕。看到这只[ceraphbus]如此畏缩，你的脸上露出了微笑。[pg]");
         outputText("塞拉芙问道，[say: 那么，在我的" + get_player().mf("Master","Mistress") + "离开之前，你想不想用以前的方式，最后再操一次你的新荡妇？][pg]");
         outputText("<b>（获得关键物品：黑玛瑙代币）</b>[pg]");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,287,1);
         get_player().createKeyItem("Onyx Token - Ceraph\'s",0,0,0,0);
         menu();
         addButtonDisabled(0,"操她");
         addButtonDisabled(1,"骑乘她");
         addButtonDisabled(2,"操她的屁股");
         if(get_player().get_lust() >= 33)
         {
            outputText("你要对这个不听话的恶魔为所欲为吗？");
            if(get_player().hasCock())
            {
               addButton(0,"操她",get_ceraphScene().maleFuckCeraphsPussy);
               if(get_player().cockThatFits(get_monster().analCapacity()) != -1)
               {
                  addButton(2,"操她的屁股",get_ceraphScene().buttRapeCeraph);
               }
               else
               {
                  addButtonDisabled(2,"操她的屁股","你根本塞不进她的屁股——你太大了。");
               }
            }
            if(get_player().hasVagina())
            {
               addButton(1,"骑乘她",get_ceraphScene().rideCeraphsCockLikeaBAWSSexclamation11eleven);
            }
         }
         _g = get_combat();
         addButton(14,"离开",function():void
         {
            _g.cleanupAfterCombat();
         });
      }
      
      public function carephCorruptionSlaves() : void
      {
         clearOutput();
         outputText("你呼唤塞拉芙，但出现的不是熟悉的紫色[ceraphbus]，而是一个被一群小恶魔带进营地的人类女孩。他们走到你面前，拉下女孩的项圈，强迫她跪在你面前。[pg]");
         outputText("其中一个小恶魔走上前，打开一封信，开始念道：[say:塞拉芙大人向她的" + get_player().mf("主人","女主人") + "致歉，她发现自己无法为您服务。因此，她送来这个人类作为祭品，供" + get_player().mf("主人","女主人") + "腐化。为此，她为您准备了一种药剂。喝下这个，您就能获得完成这项工作所需的条件，" + get_player().mf("主人","女主人") + "。][pg]");
         if(get_player().cor >= 75)
         {
            outputText("你瞪着小恶魔，质问塞拉芙是不是在暗示你自己没本事操这个女孩。[pg]");
            outputText("小恶魔退缩了一下，并迅速道歉。[say:不，当然不是，" + get_player().mf("主人","女主人") + "。请原谅我们，我们无意冒犯。][pg]");
            outputText("你粗鲁地挥了挥手，打发了他。小恶魔鞠了一躬，感谢你的仁慈。[pg]");
         }
         outputText("他合上卷轴，递给你一个冒着泡的黑色小瓶，上面写着[say:喝下我！]。其他小恶魔在女孩身后排成一列。[pg]");
         outputText("你是否接受女孩的“供品”并喝下药水？");
         menu();
         addButton(0,"接受",ceraphLackeyCorruption);
         addButton(14,"离开",makeCarephsLackeysLeave);
      }
      
      public function barkToCeraphOnce(param1:Boolean = true) : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_ceraphClothed());
         if(param1)
         {
            outputText("[say:汪！]你叫道");
         }
         else
         {
            outputText("[say:喵呜——！]你叫道");
         }
         outputText("，声音响亮，甚至带着一丝骄傲");
         if(get_player().tail.type > 0)
         {
            outputText("，兴奋地摇着尾巴");
         }
         outputText("。");
         outputText("[pg]塞拉芙漫不经心地把内裤拉低了一点，以");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,288) == 0)
         {
            outputText("缓解她那被紧紧包裹着的阴茎的压力");
         }
         else
         {
            outputText("让一根阴茎从她阴蒂的位置长出来，完全成型");
         }
         outputText("。她肉棒的根部滴落着她三角区渗出的泥泞般的淫液，她套弄了几下，让它变得又长又硬，九英寸长的跳动着的恶魔般的恐怖之物。细小的结节呈同心圆状点缀在肉棒上，用来刺激任何有幸体验她肉棒的人。当塞拉芙盯着你的后背时，你意识到你很快就会感受到它了。");
         outputText("[pg]");
         if(param1)
         {
            outputText("[say:汪！汪！]");
         }
         else
         {
            outputText("[say:喵呜——！]");
         }
         outputText("你");
         if(param1)
         {
            outputText("叫道");
         }
         else
         {
            outputText("喵");
         }
         outputText("痛苦地试图爬走。你并不想被");
         if(get_player().hasCock())
         {
            outputText("榨干");
         }
         else
         {
            outputText("操");
         }
         outputText("成……成那样！她的鞭子猛地绷紧，将你拖了回来。你在泥土中挣扎了半秒钟，差点窒息，然后放弃了抵抗，软绵绵地瘫倒在她的脚下。慢慢地，你将你的[butt]翘到半空中，让塞拉芙可以进入，后悔地向她屈服，就像你一开始应该做的那样。");
         outputText("[pg]啪！她的手拍在你的屁股上，打完后还停留在上面揉捏着那块红肿的肉。她解释道，[say:那是为了惩罚你的抵抗，而这个……]你感觉到你娇嫩的后庭入口处有一股湿滑的温暖。[saystart]……是为了奖励你做我听话、调皮的小");
         if(param1)
         {
            outputText("小狗");
         }
         else
         {
            outputText("猫咪");
         }
         outputText("。[sayend]她的臀部将那根滚烫的长枪更用力地压向你的[asshole]。");
         if(get_player().ass.analLooseness == 0)
         {
            outputText("尽管你还是个处女，但这根沾满淫液的工具还是轻松地钻进了你的直肠，那些结节按摩着你被严重撑开的肛门环，以适应更粗的宽度，被塞拉芙的肉棒永远地破坏了。");
         }
         else if(get_player().analCapacity() < 20)
         {
            outputText("尽管你很紧，但这根沾满淫液的工具还是轻松地滑进了你的直肠，半软的结节按摩着你的肛门环，以适应这滚烫的刺入。");
         }
         else if(get_player().ass.analLooseness >= 4)
         {
            outputText("这根沾满淫液的工具毫不费力地钻进了你那饱经风霜的屁眼，瞬间没入到底，数以百计的凸起像情人一样温柔地抚摸着你的肛门环，依偎在你的体内。");
         }
         else
         {
            outputText("多亏了你那容量惊人的肛门，这根沾满淫液的工具直接滑了进去，那些温柔的凸起在滑过时按摩着你紧致的肛门环。");
         }
         outputText("当你被你的主人占有时，你呻吟出声，中途回过神来，尽可能快地止住了那声愉悦的咕哝，但这都无济于事——伤害已经造成了。");
         get_player().buttChange(16,true,true,false);
         outputText("[pg]在塞拉芙龟头的边缘有一圈较大的凸起，当她穿过你的屁眼时，它们勾住了你体内的某个东西，将无意中产生的快感热流传导到");
         if(get_player().hasCock())
         {
            outputText("你抽搐的男根");
         }
         else if(get_player().hasVagina())
         {
            outputText("你空虚得发痛的小穴");
         }
         if(get_player().cockTotal() > 1)
         {
            outputText("es");
         }
         outputText("。几乎立刻，你喷出了一大团");
         if(get_player().hasCock())
         {
            outputText("前列腺液");
         }
         else
         {
            outputText("爱液");
         }
         outputText("。它沉甸甸地垂着，足以");
         if(get_player().hasCock())
         {
            outputText("让你[cock biggest]在下面晃动");
         }
         else
         {
            outputText("挑逗和戏弄你的阴蒂");
         }
         outputText("，当你的臀部更用力地压向你主人的身体时，你再次发出一声愉悦的咕哝。");
         outputText("[pg]塞拉芙的双手落在你腰部的两侧。她安抚道，[say:我对待我的宠物很好，[name]。]她的臀部向后抽动，那根布满颗粒、质感粗糙的工具在你的体内摩擦跳动。她继续说道：[say:我让它们乐于做宠物……]那根粗大的恶魔肉棒更用力地顶了回来，把你的手臂压下去，让你的脸贴在泥土上。[say:……乐于被拥有，因为服从就是快乐。]塞拉芙调整了角度，让她勃起的钝头");
         if(get_player().hasCock())
         {
            outputText("直直地撞进你体内的精液储存囊");
         }
         else
         {
            outputText("摩擦着你颤抖的阴道壁，从内到外刺激着你");
         }
         outputText("，你的脑海中开始绽放烟花。");
         outputText("[pg]");
         if(get_player().hasCock())
         {
            outputText("精液");
         }
         else
         {
            outputText("爱液");
         }
         outputText("从");
         if(get_player().hasCock())
         {
            outputText("[eachCock]");
         }
         else
         {
            outputText("你微微张开的小穴");
         }
         outputText("滴落到地板上积成一滩，你被熟练地带入了一场令人浑身酥麻、身体颤抖的肛门高潮。这甚至很难被称为射精。那");
         if(get_player().get_gender() == 2)
         {
            outputText("女性化的");
         }
         outputText("精液只是");
         if(get_player().hasCock())
         {
            outputText("滑落");
         }
         else
         {
            outputText("倾泻");
         }
         outputText("顺畅地流出，随着你的");
         if(get_player().hasCock())
         {
            outputText("内部的储精囊被挤压");
         }
         else
         {
            outputText("小穴内壁通过你的肛门内壁受到了刺激");
         }
         outputText("。塞拉芙继续推进，但她的龟头滑偏了，她迅速将自己重新埋入你的体内，每一个结节滑过你因高潮而紧缩的");
         if(get_player().hasCock())
         {
            outputText("前列腺");
         }
         else
         {
            outputText("内壁");
         }
         outputText("。");
         if(get_player().hasCock())
         {
            outputText("讽刺的是，[eachCock]已经开始失去一些硬度，随着更多的精液从你体内漏出，你变得越来越软");
         }
         else
         {
            outputText("奇怪的是，从你那微微张合、娇嫩的小穴中漏出的淫液越多，你的身体就越是因难以抑制的愉悦而刺痛和颤抖");
         }
         outputText("。");
         outputText("[pg]不过最令人惊叹的是，");
         if(get_player().hasCock())
         {
            outputText("那股“压力”");
         }
         else
         {
            outputText("你内心的一种需求");
         }
         outputText("感觉被释放了，你依然欲火焚身");
         if(get_player().hasCock())
         {
            if(get_player().cockTotal() == 1)
            {
               outputText("，即使阴茎已经疲软");
            }
            else
            {
               outputText("，即使阴茎们已经疲软");
            }
         }
         outputText("。塞拉芙发出呼噜声，[say:我告诉过你我是个好主人，不是吗？现在就躺在那儿，让我好好享受你敏感的屁股吧。]");
         outputText("[pg]她开始快速地将阴茎穿过你的括约肌，用坚定而温柔的抽插撞击你的[asshole]。你");
         if(param1)
         {
            outputText("像个精液荡妇小狗一样快乐地吠叫");
         }
         else
         {
            outputText("像个爱吃鸡巴的小猫一样高兴地喵喵叫");
         }
         outputText("并且没过多久就开始迎合她的动作。那些结节把你的内壁摩擦得太舒服了，它们让你不断滴下白费的");
         if(get_player().hasCock())
         {
            outputText("精液");
         }
         else
         {
            outputText("淫液");
         }
         outputText("从你的");
         if(get_player().hasCock())
         {
            outputText("软趴趴的肉棒");
            if(get_player().cockTotal() > 1)
            {
               outputText("");
            }
         }
         else
         {
            outputText("小穴");
         }
         outputText("中流出，全程都在狂喜的快感中刺痛。很快，你气喘吁吁，而塞拉芙的臀部拍打着你的[butt]，声音大得像微型雷鸣，你可怜的");
         if(get_player().hasCock())
         {
            outputText("前列腺每次都被顶到");
         }
         else
         {
            outputText("，令人沮丧的空虚阴道壁在每一次抽插中都被挑逗着");
         }
         outputText("。");
         outputText("[pg]塞拉芙大声呻吟，突然猛烈地撞向你，力度大到让你觉得肠子都要被挤在一起了，你的");
         if(get_player().hasCock())
         {
            outputText("前列腺");
         }
         else
         {
            outputText("阴道壁");
         }
         outputText("被压平了。温暖在你的肠道内爆炸，慢慢地在恶魔般强化的发光肉棒高潮时向四周扩散。你能听到主人的精液溅到你身后的地上，她呜咽着，[say:好……好[boy]……]，她的肉棒坚定地喷射出浓稠、污秽的乳汁");
         if(get_player().hasCock())
         {
            outputText("直接喷在你酸痛的前列腺上");
         }
         else
         {
            outputText("给你敏感的肉壁带来更多美妙的压力");
         }
         outputText("。当塞拉芙将你的屁股据为己有时，你紧紧闭上眼睛，并且");
         if(get_player().hasCock())
         {
            if(get_player().cockTotal() > 1)
            {
               outputText("你的每根肉棒");
            }
            else
            {
               outputText("你的肉棒");
            }
            outputText("释放出最后一点粘稠、发臭的宠物精液");
         }
         else
         {
            outputText("你的小穴释放出最后一点粘稠、湿滑的淫液");
         }
         outputText("。");
         if(get_player().cumQ() >= 700)
         {
            outputText("淫液到处泛滥。你实在是太多汁了，以至于你的手和[legs]都有一部分陷进了这片泥泞中。");
         }
         outputText("[pg]你的女主人终于结束了，她拔了出来，递给你一块");
         if(param1)
         {
            outputText("美味的骨头形状饼干");
         }
         else
         {
            outputText("散发着鱼腥味的零食");
         }
         outputText("让你狼吞虎咽地吃下去，当你感激地接受奖励时，她拍了拍你的头。");
         outputText("[pg][say: 乖，[boy]。] 她的声音说道，慢慢消散在风中。");
         get_player().slimeFeed();
         get_player().orgasm("Generic");
         dynStats(DynStat.Sens(2),DynStat.Cor(1));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function barkOrMeowTwiceToCeraph(param1:Boolean = true) : void
      {
         var _loc4_:Boolean = false;
         clearOutput();
         spriteSelect(SpriteDb.get_s_ceraphClothed());
         if(param1)
         {
            outputText("[say: 汪！汪！] 你叫道");
         }
         else
         {
            outputText("[say: 喵！喵呜呜！] 你叫道");
         }
         outputText("，开心地摇晃着你的");
         if(get_player().tail.type > 0)
         {
            outputText("尾巴");
         }
         else
         {
            outputText("[butt]");
         }
         outputText("。不知为何，为了更多的羞辱而拒绝释放自己的想法对你很有吸引力。");
         outputText("[pg]塞拉芙温柔地将鞭子的末端系在你的脖子上，做成一个临时的项圈，她顺滑地抚摸着你的背，再次称赞你，[say: 真是个好宠物。我们去散步吧，让你所有的朋友看看你能有多乖。]你的新项圈被轻轻拉了一下，你跟在从奴隶变成主人的她身后爬行，");
         if(param1)
         {
            outputText("呜咽着");
         }
         else
         {
            outputText("喵喵叫着");
         }
         outputText("就像一只饥渴的动物。");
         var _loc2_:Array = [];
         if(get_holliScene().holliFollower())
         {
            _loc2_[int(_loc2_.length)] = 0;
         }
         if(get_amilyScene().amilyFollowerCorrupt())
         {
            _loc2_[int(_loc2_.length)] = 1;
         }
         else if(campCorruptJojo())
         {
            _loc2_[int(_loc2_.length)] = 1;
         }
         _loc2_[int(_loc2_.length)] = 2;
         var _loc3_:int = int(_loc2_[Utils.rand(int(_loc2_.length))]);
         if(_loc3_ == 0)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,682) == 0)
            {
               outputText("[pg]当塞拉芙牵着你经过时，腐化的树妖从她的树里探出头来。[saystart]哦，这真是太有趣了！你现在是一只小");
               if(param1)
               {
                  outputText("小狗");
               }
               else
               {
                  outputText("猫咪");
               }
               outputText("了吗？玛莱母亲到底为什么要派我出来感谢像你这样的人？太可悲了！[sayend] 她从树冠上降下来，一排像鸡巴一样的触手向你袭来，而塞拉芙则在一旁饶有兴致地看着。它们开始拍打你的头，用力比必要的稍微大一点，像居高临下的手一样在你的背上摩擦。她笑着抚摸你，很高兴看到你处于这样的境地。这种羞耻感比牛头怪的精液还要强烈，当它与你恶魔般的“项圈”的魔法结合时，它在你的脑海中扭曲，与性唤起不可阻挡地交织在一起，让你漏得更厉害了。沉浸在这些令人怜悯、居高临下的抚摸中感觉真是太棒了。");
            }
            else
            {
               outputText("[pg]当塞拉芙牵着你经过时，那个堕落的树妖从她的树里探出头来。[say: [name]？你……你在干什么？我的天哪！你难道是个隐藏的受虐狂吗？] 霍莉残忍地咯咯笑着，[say: 你这个该死的受虐荡妇！我早该知道你那副强硬的做派全都是虚张声势！该死，你真的“应该”求我让我操你。你还有什么好说的？]");
               outputText("[pg]塞拉芙微笑着，低头看着你，满怀期待地向你示意。");
               outputText("[pg]");
               if(param1)
               {
                  outputText("[say: 汪！？]");
               }
               else
               {
                  outputText("[say: 喵！？]");
               }
               outputText("[pg]霍莉用触手粗暴地拍打你的后脑勺，粗略地模仿着抚摸的动作。[saystart]真是个乖");
               if(param1)
               {
                  outputText("小狗");
               }
               else
               {
                  outputText("小猫");
               }
               outputText("，[sayend] 她说道，看到你如此堕落，不再关心服从你的事情，她感到非常兴奋。这种羞耻感比牛头怪的精液还要强烈，当它与你恶魔“项圈”的魔法结合时，它在你的脑海中扭曲，与性欲不可阻挡地交织在一起，让你流出更多的淫液。沉浸在这些可怜、居高临下的抚摸中感觉真是太棒了。");
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,682,0);
            }
            outputText("[pg]塞拉芙和你继续散步，尽管她不得不因为你滴在她脚后跟上的淫液而责骂你很多次。每当你表现不好时，她就会弹一下");
            if(get_player().hasCock())
            {
               if(get_player().cockTotal() > 1)
               {
                  outputText("你的其中一根");
               }
               outputText("你那根叛逆的勃起肉棒");
               if(get_player().cockTotal() > 1)
               {
                  outputText("");
               }
               outputText("，这产生了意想不到的副作用，让它肿胀得更厉害了");
            }
            else
            {
               outputText("你那颗叛逆的阴蒂，这产生了意想不到的副作用，让它和你那流着口水的阴唇肿胀起来，比以往任何时候都要红");
            }
            outputText("。");
            if(get_player().hasCock())
            {
               outputText("它在你的肚子上弹跳着");
            }
            else
            {
               outputText("你的阴道肌肉紧绷收缩着");
            }
            outputText("，带着无法满足的渴望，但却无法得到满足。直到你所有的肌肉都酸痛疲惫，塞拉芙才带你回家。你瘫倒在肚子上，气喘吁吁地等待鞭子被解开。当你转过身想和塞拉芙说话时，你发现她已经把你留在了那里，而你的性欲已经无法估量。");
         }
         else if(_loc3_ == 1)
         {
            if(get_amilyScene().amilyFollowerCorrupt() && campCorruptJojo())
            {
               outputText("[pg]没过多久，你遇到了你那两个堕落的、长着老鼠" + (get_noFur() ? "耳朵" : "模样") + "的奴隶。他们停止了互相抚摸生殖器的动作，问道：[say: [Master]，你在干什么？]");
               outputText("[pg]塞拉芙紧紧抓着你的牵引绳，低头看着你。");
               outputText("[pg]");
               if(param1)
               {
                  outputText("[say: 汪！]");
               }
               else
               {
                  outputText("[say: 喵！]");
               }
               outputText("[pg][say: [Master]是塞拉芙的宠物？那……那我们也是她的宠物了……]艾米莉作为代表说道。他们俩都四肢着地，爬到你身边。塞拉芙漫不经心地撕下艾米莉衣服上的布条，做成两个简易的项圈，用简单的绳结系在她的鞭子上。你们四个继续一起走，但当你让老鼠们性感地蹭你时，你一次又一次地被责骂。有姐弟宠物多少有些安慰，但不断暴露在他们性感的体味中却让人分心。塞拉芙朝你们俩喷了半打水，以防止你们做爱，每次都让人感到更加羞耻。你真的是个宠物，一个连[his]最基本的需求都无法控制的宠物。");
            }
            else
            {
               _loc4_ = campCorruptJojo();
               outputText("没过多久，你那堕落的、长着老鼠" + (get_noFur() ? "耳朵" : "模样") + "的奴隶看到你笨拙地跟在紫色的女王身后。");
               if(_loc4_)
               {
                  outputText("他");
               }
               else
               {
                  outputText("她");
               }
               outputText("问道，[say: [Master]，你在做什么？]");
               outputText("[pg]塞拉芙紧紧抓着你的牵引绳，低头看着你。");
               outputText("[pg]");
               if(param1)
               {
                  outputText("[say: 汪！]");
               }
               else
               {
                  outputText("[say: 喵！]");
               }
               outputText("[pg][saystart][Master]是塞拉芙的宠物？那");
               if(!_loc4_)
               {
                  outputText("精液荡妇也是");
               }
               else
               {
                  outputText("我想我也是");
               }
               outputText("她的宠物了……[sayend]");
               if(!_loc4_)
               {
                  outputText("艾米莉");
               }
               else
               {
                  outputText("乔乔");
               }
               outputText("说着，四肢着地爬到你身边。塞拉芙漫不经心地撕下他们衣服上的一条布，做成另一个简易项圈，系在她的鞭子上。你们三个继续走，但当你和");
               if(!_loc4_)
               {
                  outputText("艾米莉");
               }
               else
               {
                  outputText("乔乔");
               }
               outputText("互相摩擦时，你一次又一次地被责骂。有一个");
               if(!_loc4_)
               {
                  outputText("妹妹");
               }
               else
               {
                  outputText("哥哥");
               }
               outputText("宠物多少有些安慰，但不断暴露在");
               if(_loc4_)
               {
                  outputText("他的");
               }
               else
               {
                  outputText("她的");
               }
               outputText("性气味中却让人分心。塞拉芙用水喷了你们半打次，以防止你们做爱，每次的羞耻感都更大。你真的是一个宠物，一个连[his]最基本的需求都无法控制的宠物。");
            }
            outputText("[pg]你和你的同伴在附近的荒地里进行了一次令人筋疲力尽的散步");
            if(get_amilyScene().amilyFollowerCorrupt() && campCorruptJojo())
            {
               outputText("");
            }
            outputText("，你非常享受这种有辱人格的经历。欲望和屈辱在你内心交织成一大团性欲，以至于因此而兴奋让你感到屈辱，而屈辱又让你更加兴奋");
            outputText("。这是一个无休止的性兴奋反馈循环，让你几乎要爆发，除了你回到了营地。项圈被解开，你主人的甜美声音低语道，[say:走得好，宠物。]然后消失在风中。");
            outputText("[pg]");
            if(campCorruptJojo())
            {
               outputText("乔乔");
               if(get_amilyScene().amilyFollowerCorrupt())
               {
                  outputText("和");
               }
            }
            if(get_amilyScene().amilyFollowerCorrupt())
            {
               outputText("艾米莉");
            }
            if(get_amilyScene().amilyFollowerCorrupt() && campCorruptJojo())
            {
               outputText("不确定地环顾四周，然后跑回他们通常的地方，知道如果你想让他们照顾你的欲望，你会下达命令。");
            }
            else
            {
               outputText("不确定地环顾四周，然后跑回通常的地方，知道如果你想让奴隶照顾你的欲望，你会下达命令。");
            }
         }
         else
         {
            outputText("[pg]塞拉芙带你进入荒地，进行了一次令人筋疲力尽、充满屈辱的旅程。不知何故，她总是能找到小恶魔和地精来向你炫耀。那些");
            if(get_player().hasCock())
            {
               outputText("地精");
            }
            else
            {
               outputText("小恶魔");
            }
            outputText("似乎对你那强迫性");
            if(get_player().hasCock())
            {
               outputText("勃起的男性特征");
            }
            else
            {
               outputText("颤抖的阴户");
            }
            if(get_player().cockTotal() > 1)
            {
               outputText("es");
            }
            outputText("，并经常向塞拉芙提供大量的宝石来操你。你的女主人坚持认为你不需要任何这样的性释放，因为你是一只乖巧的");
            if(param1)
            {
               outputText("小狗");
            }
            else
            {
               outputText("小猫");
            }
            outputText("，并从服从中得到你需要的一切。她的话让你夸张地呜咽了一声，同时流出几滴新鲜的珍珠般的");
            if(get_player().hasCock())
            {
               outputText("肉棒");
            }
            else
            {
               outputText("小穴");
            }
            outputText("奶油，但你保持不动，[legs]急切地颤抖着。感觉只要在酸痛的");
            if(get_player().hasCock())
            {
               outputText("肉棒");
            }
            else
            {
               outputText("下体");
            }
            if(get_player().cockTotal() > 1)
            {
               outputText("");
            }
            outputText("。");
            outputText("[pg]其中一个");
            if(get_player().hasCock())
            {
               outputText("地精");
            }
            else
            {
               outputText("小恶魔");
            }
            outputText("甚至注意到了你的状态并对此发表了评论，将");
            if(get_player().hasCock())
            {
               outputText("她的");
            }
            else
            {
               outputText("他的");
            }
            outputText("的手放在你自由流口水的");
            if(get_player().hasCock())
            {
               outputText("勃起");
            }
            else
            {
               outputText("小穴");
            }
            if(get_player().cockTotal() > 1)
            {
               outputText("");
            }
            outputText("下方，收集了一手掌滑溜溜的");
            if(get_player().hasCock())
            {
               outputText("男孩");
            }
            else
            {
               outputText("女孩");
            }
            outputText("-蜜汁。");
            if(get_player().hasCock())
            {
               outputText("她");
            }
            else
            {
               outputText("他");
            }
            outputText("把它举到");
            if(get_player().hasCock())
            {
               outputText("她的");
            }
            else
            {
               outputText("他的");
            }
            outputText("鼻子前闻了闻，叹了口气，[saystart]这位恶魔小姐，[He]看起来确实被驯服得很好。你很幸运能在我之前抓到[him]。有");
            if(get_player().hasCock())
            {
               outputText("这么好的精液，我每次都会在[he]勃起时把[him]榨干");
            }
            else
            {
               outputText("这种气味，我一有机会就会操[him]");
            }
            outputText("。也许你以后会改变主意的。[sayend]");
            outputText("[pg]塞拉芙摇了摇头，但还是微笑着低头看着你，拍了拍你的头。这一切的屈辱感与你的欲望交织在一起，这两种情绪如此混乱，以至于你觉得自己因为被当作宠物对待而变得[if (hascock) {更硬|更湿}]。一滴");
            if(get_player().hasCock())
            {
               outputText("预精液喷射");
            }
            else
            {
               outputText("淫液喷射");
            }
            outputText("到地上，你轻声呜咽着。你的主人注意到了，命令道，[saystart]现在，宠物，我们不能让你把这个");
            if(get_player().hasCock())
            {
               outputText("地精");
            }
            else
            {
               outputText("小恶魔");
            }
            outputText("的家弄得一团糟。把它舔干净。[sayend]");
            outputText("[pg]你弯下腰，舔舐着你留下的性分泌物，品尝着下面的泥土，直到你的");
            if(get_player().hasCock())
            {
               outputText("预精液");
            }
            else
            {
               outputText("爱液");
            }
            outputText("落下的地方。[saystart]够了。走吧，");
            if(param1)
            {
               outputText("小狗");
            }
            else
            {
               outputText("小猫");
            }
            outputText("，我们走完剩下的路！[sayend]");
            outputText("[pg]塞拉芙拽着你的项圈，加快了带你回家的步伐。每一个动作都是一种折磨，因为你那危险地兴奋着的");
            if(get_player().hasCock())
            {
               outputText("勃起");
            }
            else
            {
               outputText("小穴");
            }
            if(get_player().cockTotal() > 1)
            {
               outputText("");
            }
            if(get_player().cockTotal() > 1)
            {
               outputText("感觉它们");
            }
            else
            {
               outputText("感觉它");
            }
            outputText("随时都可能爆发。这段旅程对你可怜的、");
            if(get_player().hasCock())
            {
               outputText("过度膨胀的男性象征");
            }
            else
            {
               outputText("肿胀酸痛的裂隙");
            }
            if(get_player().totalCocks() > 1)
            {
               outputText("es");
            }
            outputText("来说简直是谋杀，但你不知怎么的，在回家的路上竟然没有");
            if(get_player().hasCock())
            {
               outputText("爆发");
            }
            else
            {
               outputText("越过边缘");
            }
            outputText("。不过，那条清晰标记着你旅程的麝香味黏液痕迹就是另一回事了。");
            outputText("[pg]咔哒。");
            outputText("[pg]你脖子上的项圈被取下了，你环顾四周，发现你的主人已经不见了。旅途让你的肌肉酸痛，你现在急需自慰……你甚至不知道自己为什么会这么做。");
         }
         dynStats(DynStat.Sens(4),DynStat.Lust(100,DynStatOp.Eq),DynStat.NoScale);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function askCeraphAboutNobleShirt() : void
      {
         clearOutput();
         get_undergarments().SEA_SHIRT.saveContent.ceraphAsked = true;
         registerTag("shirtStage",TagFun_Impl_.fromInt(get_undergarments().SEA_SHIRT.saveContent.armorStage));
         outputText("你从一个狂热的信徒那里偷了一件看起来不错的衬衫，现在却脱不下来了。[if (shirtStage > 2) {更糟糕的是，它正在改变|毫无疑问，这不是个好兆头}]。塞拉芙听着你的解释，显然觉得很有趣。");
         outputText("[pg][say:[Master]，如果你想要诅咒，你可以直接要一个。]她咧嘴一笑，用手指划过你的[if (hasgills) {鳃|衣领}]。在她额头贴上你的额头之前，她呼吸中令人愉悦的气味充满了你的鼻腔。[say:我的小玩意儿会对你做更多令人兴奋的事情，你真的应该多想想我。]");
         outputText("[pg]她没有给出任何见解。打断她的戏弄，你需要知道她是否能解除诅咒。");
         if(get_undergarments().SEA_SHIRT.saveContent.armorStage > 2)
         {
            outputText("[pg]女恶魔放开你，叹了口气。[say:恐怕现在有点晚了，这件物品像肢体一样与你的身体结合在一起。需要一个更量身定制的反咒语。]塞拉芙把手指放在下巴上，表示深思熟虑，然后继续说道。[say:在它开始改变自己以适应你的身体之前，我不知道从哪里开始。我的专业知识帮不上什么忙。]这是一个令人不满意的答案；你必须去别处调查这件事。");
            doNext(get_camp().returnToCampUseOneHour);
            return;
         }
         outputText("[pg]女恶魔一边思考，一边用锋利的指甲在你的衬衫褶边上划过。[say:微不足道。这种束缚没什么特别的——我光靠触摸就能看出来。]");
         menu();
         addButton(0,"脱下衬衫",ceraphRemoveNobleShirt).hint("没必要等了，让她解决这个问题。");
         addButton(1,"留着它",ceraphLeaveNobleShirt).hint("知道你有这个选择就足够了，它还没有做任何太令人担忧的事情。如果你等一等，它甚至可能有尚未显现的好处。");
      }
      
      public function acceptMoreCeraphFauxCorruption() : void
      {
         clearOutput();
         outputText("你坏笑了一下，觉得这可能会很有趣……所以你命令她去取悦那些小恶魔，同时取悦他们所有人。[pg]");
         outputText("小恶魔们的眼睛在你的命令下发光，他们只停下自慰足够长的时间，扑向魅魔并把她拖到地上。她只是微笑着，没有提供任何抵抗，任由小恶魔们急忙填满她的嘴、小穴和屁股，更不用说让她的双手也忙碌起来。[pg]");
         outputText("这景象令人兴奋；小恶魔们拉扯、摸索并拉扯着魅魔，同时残忍地操着她。你留在她紧致阴道里的巨大精液，随着操她小穴的小恶魔每一次湿润的拍打而四处飞溅；她屁股里的那个残忍地推进，仿佛试图用阴茎爬上她的肛门；她嘴里的那个在每次拔出时都会利用她的乳房；最后，使用她双手的那些把先列腺液溅在她身上，把她紫色的皮肤染成了白色。[pg]");
         outputText("然而，这场表演并没有持续太久。小恶魔们很快在回荡的叫声中达到了高潮。使用她嘴的那个射得如此猛烈，以至于一些精液从魅魔的鼻子里倒流出来。使用她屁股和小穴的那些填满了各自的洞，在最后一次喷射中拔出，把魅魔的身体涂满了精液。当然，她的双手通过用最后两根小恶魔阴茎涂抹剩下的东西完成了工作。在折磨结束时，魅魔在咳嗽和喷溅。[pg]");
         outputText("[say: 看看我发生了什么……被使用并被改造，然后被迫服务一群肮脏的小恶魔……谢谢你，" + get_player().mf("主人","女主人") + "，] 她带着淫荡的微笑呻吟着。[pg]");
         outputText("她舔掉身上的精液，扭动着走向你，在你的脸颊上轻轻啄了一下。[say: 嗯，你真是个好" + get_player().mf("主人","女主人") + "，我可能不得不离开塞拉芙的后宫，加入你的后宫了。回见，性感尤物。] 她围捕了疲惫的小恶魔，展开翅膀，和他们一起出发了。");
         dynStats(DynStat.Lust(5),DynStat.Cor(2));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function CeraphHandsOutNewFetishesLikePervCandy() : void
      {
         var _g:CeraphFollowerScene;
         clearOutput();
         spriteSelect(SpriteDb.get_s_ceraphClothed());
         if(!get_ceraphScene().hasExhibition())
         {
            outputText("塞拉芙在你的命令下走上前来，平静地低语着，同时");
            if(get_player().earsPierced == 0)
            {
               outputText("从一个小袋子里拿出一对闪闪发光的绿色穿孔饰品。[say: 哦，别担心" + get_player().mf("主人","女主人") + "；你会非常喜欢这个的。这些穿孔饰品很特别，它们会给你你想要的东西。]");
            }
            else
            {
               outputText("把手放在你穿孔的耳朵上。她轻声低语：[say: 别担心" + get_player().mf("主人","女主人") + "，我可以轻松地使用你已经有的穿孔饰品。不会疼的。]");
            }
            outputText("[pg]");
            if(get_player().earsPierced == 0)
            {
               outputText("恶魔把一只手放在你的额头上，揉了揉你的太阳穴。麻木感随着她的每一次触摸蔓延到你的全身，直到你几乎感觉不到任何东西。她把一个耳环扣在你的左耳上，一阵眩晕感向你袭来。片刻之后，她又在另一边穿孔，伴随而来的那种现在已经熟悉的眩晕感似乎比以前来得快，去得也快。");
            }
            else
            {
               outputText("恶魔用手揉搓着你的耳朵，让它们微微发麻。你的眼睛后方渐渐升起一阵嗡嗡声，伴随着一阵眩晕感。你眨了眨眼，试图摇摇头，但在这种麻木的状态下，这相当困难。过了一会儿，这种奇怪的感觉消退了，你的耳朵和[face]恢复了正常的知觉，这让你松了一口气。");
            }
            outputText("你希望她不要在你瘫痪的时候拿走你的[armor]，让你在这个领域里完全赤身裸体地游荡。当你试图理解这个奇怪的念头时，困惑和一阵阵新的欲望在你的脑海中交战。[pg]");
            outputText("塞拉芙注视着你的");
            if(get_player().cockTotal() > 0)
            {
               outputText("肉棒随着你怦怦直跳的心跳而跳动");
            }
            else if(get_player().hasVagina())
            {
               outputText("小穴变得越来越湿");
            }
            else
            {
               outputText("微张的双唇和困惑的表情");
            }
            outputText("，看着新的想法和欲望在你体内扎根。她轻轻拍了拍你，解释道，[say: 没关系的，" + get_player().mf("主人","女主人") + "；你现在是个暴露狂了。你想要你的穿孔奴隶给你更多吗？][pg]");
            outputText("塞拉芙是对的——<b>你现在是个暴露狂了。</b>");
            if(get_player().earsPierced == 0)
            {
               get_player().earsPierced = 1;
               get_player().earsPShort = "绿宝石耳钉";
            }
            dynStats(DynStat.Lust(25),DynStat.Cor(1));
         }
         else if(!get_ceraphScene().hasBondage())
         {
            outputText("塞拉芙咯咯笑着，再次向你靠近。你叹了口气，躺在那里，任由你的奴隶按摩你的太阳穴，用她的魔法麻痹你的身体。");
            if(get_player().nipplesPierced == 0)
            {
               outputText("她非常乐意制造悬念，拿出一对闪亮的黑色乳钉，[saystart]哦，你知道这些是用来干什么的吗？那么，我把它们滑进你");
               if(get_player().hasFuckableNipples())
               {
                  outputText("淫荡的");
               }
               else if(get_player().nippleLength < 1)
               {
                  outputText("可爱的");
               }
               else
               {
                  outputText("紧致的");
               }
               outputText("乳头里，然后你告诉我你所有的性癖，以及哪一个让你最兴奋，怎么样？哦，你会喜欢的，" + get_player().mf("主人","女主人") + "！[sayend][pg]");
            }
            if(get_player().nipplesPierced > 0)
            {
               outputText("她非常乐意制造悬念，把手放在你穿孔的乳头上，轻轻地捏了一下，你几乎感觉不到。[say: 别担心，" + get_player().mf("主人","女主人") + "。通过这些把你的新性癖注入你体内会很容易的。只要在我做的时候告诉我哪些性癖让你最兴奋，看看你能不能猜出你的新癖好。][pg]");
            }
            outputText("恶魔没有给你回答的机会；相反，她专注于");
            if(get_player().nipplesPierced > 0)
            {
               outputText("你的[nipples]，用手指在肉质的凸起周围打转。一阵鸡皮疙瘩席卷你的全身，伴随着类似的寒意和太阳穴后方的压力。你打了个寒颤，但这感觉很快就消退了。");
            }
            else
            {
               outputText("将穿孔器的尖端对准你敏感的乳头肉。你的右侧[nipple]被顺滑地刺穿，几乎让你痛得尖叫起来。当她把它固定好时，你感觉到一阵鸡皮疙瘩蔓延全身。第二次穿孔似乎没有那么痛，但鸡皮疙瘩蔓延的感觉却明显得多。");
            }
            outputText("你的眼珠转来转去，好奇你的恶魔奴隶这次给了你什么性癖。[pg]");
            outputText("塞拉芙低头对你微笑并娇嗔道，[say: 希望您对这个新癖好感到满意，" + get_player().mf("主人","女主人") + "。想想看，瘫痪和被绑起来有多么相似，然后告诉我您喜不喜欢。][pg]");
            outputText("你的身体变得通红，突然开始试图挣脱她魔法的无形束缚。这……感觉真好！随着束缚让你越来越兴奋，你几乎要因为情欲而叫出声来。塞拉芙的魔法让你染上了被绑缚的癖好！一想到这片土地上所有可能试图束缚你的奇怪事物，你几乎要晕厥过去，而且你知道，如果它们抓住你，你根本没有希望抵抗。<b>不过不知为何，你觉得你可能会享受成为一个绑缚癖者……</b>");
            dynStats(DynStat.Lust(25),DynStat.Cor(1));
            if(get_player().nipplesPierced == 0)
            {
               get_player().nipplesPierced = 1;
               get_player().nipplesPShort = "无缝黑色乳钉";
               get_player().nipplesPLong = "无缝黑色乳钉";
            }
         }
         else if(!get_ceraphScene().hasPacifism())
         {
            outputText("恶魔女拿出一个镶钻的穿孔饰品向你逼近，她的肉棒从内裤里探出头来，小穴湿润，臀部在前进时诱人地摇曳着。塞拉芙严肃地看着你并警告道，[say: 您意识到在这之后，您甚至无法对敌人抬起手来吗？您真的很喜欢挑战，不是吗，" + get_player().mf("主人","女主人") + "？][pg]");
            outputText("一想到要面对这片土地上的居民，甚至连挥出一拳的能力都没有，你就感到无比兴奋，你喘息着，倒抽着冷气，当");
            if(get_player().totalCocks() > 0)
            {
               outputText("前列腺液从");
               if(get_player().totalCocks() > 1)
               {
                  outputText("你的每一根");
               }
               outputText("[cocks]中渗出。");
            }
            else if(get_player().hasVagina())
            {
               outputText("女性的淫液从你的阴唇间流出，你的[clit]变成了一颗坚硬的豆豆。");
            }
            else
            {
               outputText("你的身体渴望着释放。");
            }
            outputText("塞拉芙带着有趣的笑容，猛地拉下你的装备，并且");
            if(get_player().totalCocks() > 0)
            {
               outputText("抓住你的[cock]");
               if(get_player().cocks[0].get_isPierced())
               {
                  outputText("，旧的穿孔饰品滑落并当啷一声掉在地上，");
               }
               outputText("然后将钻石饰钉穿过你敏感的血肉扣上，痛得你眼前一片血红。[pg]");
               get_player().cocks[0].pierced = 1;
               get_player().cocks[0].pShortDesc = "钻石阴茎钉";
               get_player().cocks[0].pLongDesc = "钻石阴茎钉";
            }
            else if(get_player().hasVagina())
            {
               outputText("拨开你的阴唇");
               if(get_player().vaginas[0].clitPierced > 0)
               {
                  outputText("，旧的穿孔饰品从你的肉体中滑落并当啷一声掉在地上，");
               }
               outputText("，捏住你[clit]根部周围的软肉。她熟练地将穿孔扣上，把钻石饰钉固定在你身上，剧痛让你的视线变得一片血红。[pg]");
               get_player().vaginas[0].clitPierced = 1;
               get_player().vaginas[0].clitPShort = "钻石阴蒂钉";
               get_player().vaginas[0].clitPLong = "钻石阴蒂钉";
            }
            else
            {
               outputText("将钻石眉钉扣入你的眉毛，刺穿了它");
               if(get_player().eyebrowPierced > 0)
               {
                  outputText("并像丢垃圾一样丢弃了你旧的首饰");
               }
               outputText("。这比预想的要痛得多，让你的视线变得一片血红。[pg]");
               get_player().eyebrowPierced = 1;
               get_player().eyebrowPShort = "钻石眉钉";
               get_player().eyebrowPLong = "钻石眉钉";
            }
            outputText("当她完成时，你站起来试图测试这个荡妇的作品。你举起手准备扇她一巴掌，试图打在塞拉芙的脸上。她退缩了，但这一击在离她几英寸的地方停了下来，融化成了一个温柔的抚摸。<b>你无法再使用基本的物理攻击了！</b>她跪倒在地，问道：[say:我让您不高兴了吗？如果您愿意，我可以移除其中的强制力。][pg]");
            outputText("你用手揉了揉恶魔漆黑的头发，让她知道这正是你想要的。[pg]");
            outputText("塞拉芙兴奋地吱吱叫了一声，保持不动，任由你抚摸她。一旦你停下来，她失望地叹了口气，但仍然保持着姿势。");
            dynStats(DynStat.Lust(25),DynStat.Cor(2));
         }
         get_ceraphScene().giveFetish();
         _g = this;
         doNext(function():void
         {
            _g.ceraphFollowerAppearance();
         });
      }
   }
}

