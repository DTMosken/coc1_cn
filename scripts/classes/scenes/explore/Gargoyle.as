package classes.scenes.explore
{
   import classes.BaseContent;
   import classes.CoC;
   import classes.Cock;
   import classes.DynStat;
   import classes.ImageManager;
   import classes.Output;
   import classes.Player;
   import classes.SettingsNPC;
   import classes.StatusEffects;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.display.SpriteDb;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.items.Weapon;
   import classes.parser._Parser.TagFun_Impl_;
   import classes.scenes.Camp;
   import coc.view.CoCButton;
   import flash.Boot;
   import haxe.IMap;
   
   public class Gargoyle extends BaseContent
   {
      
      public function Gargoyle()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
      }
      
      public function watersportsStay() : void
      {
         clearOutput();
         outputText("当你抬起脚准备离开时，你的注意力被脚下留下的水坑吸引了。一抹苦笑掠过你的嘴唇。你转过身，再次将[garg]拥入怀中，扶着她在长椅上坐起。然后，你一气呵成地牵起石像鬼的手，和她一起降落到教堂的地板上，伴随着一声湿润的*啪嗒*声，落在了尿液的水坑和冰冷的大理石板上。[garg]仍然微微颤抖着，用半是疲惫半是情欲的眼神看着你。你们俩都没有力气再来一次了，但如果她想和主人多待一会儿，你可以满足她。");
         outputText("[pg]你让[garg]平躺下来，开始顺着她纤细紧绷的身体一路吻下去。越过她的脖子，你温柔地挑逗着她的" + (garLoli() ? "胸膛" : "乳房") + "；她几乎无声地叹息着表示赞同。继续向下，你的舌头平贴着她的大腿滑向她的私处。随着你的动作，冰冷无味的肌肤被咸味所取代，你漫不经心地舔舐着她大腿间依然闪烁着微光的尿液。你把脸埋进[garg]的小穴里，在深情地舔舐和摩擦她的阴唇与阴蒂之间，收集了一大口尿液。你退开身子重新抬起头，亲吻着这个" + (garLoli() ? "小" : "") + "石像鬼女孩的嘴唇。[garg]的舌头有目的地伸出来迎接你的舌头，发出一声可爱的小*吧唧*声，她从你的唇间吸吮着你的精华，贪婪地吞咽着。");
         outputText("[pg]你又从她的下体吸了三大口，每次都喂她喝下你咸咸的尿液。继续你的服侍，你深情地品尝着她冰凉的小穴，让她迎来了最后一次高潮。再次拥抱她，你们俩深吸了一口气，尿液、汗水和性爱的气味在你们周围的空气中弥漫。尽管身下的地板很硬，你还是沉沉睡去，而[garg]则漫不经心地舔舐着你的皮肤和头发，品尝着你每一滴体液。");
         outputText("[pg]你后来醒了，轻轻地从[garg]的怀抱中挣脱出来，悄悄地重新穿好衣服，动身返回营地。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function watersportsLeave() : void
      {
         clearOutput();
         outputText("你重新穿好衣服并收拾好装备，+name+在一旁看着，她一只手放在仍然装满你尿液的肚子上，显得非常满足。[say: 再见，主人，]当你离开时，她向你呼唤。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function washRoughly() : void
      {
         clearOutput();
         outputText("你命令这个[if (garloli) {年轻的}]女孩站到你面前，她照做了，只是稍微有些犹豫。你向她解释说，你会洗掉她身上的一些污垢，但对她这个人本身你无能为力。她对这种侮辱没有太大反应，但当你抓住她的手臂，把她猛拽进房间时，她还是忍不住发出了一声轻呼。");
         outputText("[pg]到了那里，你立刻把她甩向水盆，她姿势难看地跌了进去。她把脸转过去在那儿躺了一会儿，直到你命令她把水打开，她才爬过去，用手划过墙上的符号。一股水流开始从墙上涌出，你觉得没必要给她什么警告，就粗暴地把她拖了过来。");
         outputText("[pg][Garg]看起来有些迟疑，但你可没耐心等她，于是你一把抓住她的脑袋，直接按在水流下，惹得她微微挣扎起来。你开始粗暴地擦洗她的皮肤，想要洗掉上面的污渍，这干净纯粹的水用在她这种可悲的东西身上，简直是一种浪费。");
         outputText("[pg]当你把她按在水下时，这只石像鬼喘息着、呛着水，她脸上夹杂着恐惧和痛苦的神情，让你觉得她似乎并没有对她的[master]愿意浪费时间清理像她这样的垃圾而表现出应有的感激。毕竟，她不过是个玩具；你大可轻易地丢弃她，而不是屈尊为她做这种事，所以她的行为实在是相当无礼。");
         outputText("[pg]尽管如此，你还是坚持完成了这个过程，勤奋地擦洗着她的全身。你特别用力地抚摸她[if (garloli) {娇小|脆弱}]的乳房，每次这样做都会引来她的一声喘息。当你把她身上积累的灰尘和污垢全部清理干净时，[garg]正喘着粗气，紧握着双拳，在你注视她时，她不愿与你对视。");
         outputText("[pg]但这差不多就是你能做的全部了；你毫不客气地放开石像鬼，然后[if (singleleg) {起身|站起来}]。她跌倒在地，双臂颤抖着，试图从这场清洗中缓过神来。你懒得去管她状况如何，带着满足感离开了大教堂。");
         gargoyleConfidence(-5);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function washNevermind() : void
      {
         returnToCathedral(true);
         clearOutput();
         outputText("转念一想，你觉得现在给她清洗也没什么意义。你把注意力转回[garg]身上，她正带着[if (gargconfidence > 70) {温柔的微笑|茫然的表情}]等待你的下一个命令。");
         get_output().flush();
      }
      
      public function washGently() : void
      {
         clearOutput();
         outputText("你招手让这个[if (garloli) {小}]女孩靠近，并告诉她你想帮她洗澡。她用疑惑的眼神看着你，但你坚持说，这对你们俩都会是一次愉快的体验。");
         outputText("[pg]在[if (gargconfidence < 70) {短暂地眯起眼睛表示困惑|沉思了片刻}]之后，[garg]只是说，[say:好的，主人。]她靠近你，和你一起待在房间里，坐在水盆边缘，交叉着她那[if (garloli) {纤细的|柔软的}]双腿。她低着头坐在那里，看起来有些脆弱，但这只会让你更想马上开始。");
         outputText("[pg]在[garg]的指示下，你的手拂过那个符号，一股清澈闪亮的水流喷涌而出。考虑到你在这片土地上看到的大部分景象，这简直是个奇迹，但你没有让自己分心，而是温柔地引导石像鬼来到水源处。当第一缕水流接触到她的皮肤时，她微微颤抖了一下，但你安抚的触摸很快就让她平静下来，她明显放松了。");
         outputText("[pg]当你开始勤奋地为她清洁，尽可能轻柔地摩擦她的身体时，她的心情变得更好了。当你用[hands]抚过她那柔软、完美无瑕的灰色身体时，水流从她身上滑落，随着你温柔的对待让她向后靠去并满足地闭上眼睛，你也能感受到她同样的愉悦。");
         outputText("[pg]你继续尽你所能地清洗她，抚摸她的头发、肩膀、手臂、她那[if (garloli) {极其平坦的|丰满的}]胸部、她的肚子，以及你能触碰到的一切。[Garg]在你的服侍下只是微微颤抖，静静地待着，任由你净化她身体的每一寸肌肤。你的思绪偶尔会飘向其他念头，但这种行为却有一种莫名的平静感，当你清洗这只[if (garloli) {年幼的|温和的}]石像鬼时，其他的一切都开始消散。");
         outputText("[pg]这样过了几分钟后，你觉得已经洗得差不多了，但你还是多逗留了一会儿，享受着这种彻底放松的感觉。这是少数几个你能完全忘记其他事情，只专注于当下的时刻之一，专注于她那干净的肌肤是多么的滑腻美妙。");
         outputText("[pg]不过，最终你还是得离开了。水流开始变弱，无论你怎么仔细看，都找不到任何污点了，于是你直起身来，告诉她该走了。");
         outputText("[pg][Garg]似乎有点失落，但还是对你笑了笑，说道：[say:谢谢您，主人。感觉真好。] 仿佛为了强调她的话，她恭敬地低下头，看起来完全是一副充满感激的模样。");
         outputText("[pg]带着胸中涌起的一股暖意，你离开了大教堂，朝营地走去，思绪轻松而满足。");
         gargoyleConfidence(5);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function wash() : void
      {
         clearOutput();
         outputText("虽然石像鬼灰色的皮肤异常光滑均匀，但你注意到有几个地方的完美被破坏了。这可不行；你希望你的石像鬼尽可能干净，所以好好擦洗一下似乎是必要的，但你不确定这个教堂是否有合适的设施。");
         outputText("[pg]你环顾四周，问[garg]这里是否有可以用来洗澡的地方。");
         outputText("[pg][say:是的，主人，]她回答道，[say:那边有一个盆可以用来清洗。]");
         outputText("[pg]她伸出一根手指示范，你顺着她指的方向看到大教堂后面的一扇关着的门。往里看，是一个小房间，中间有一个圆形的凹陷，背面镶嵌着一个复杂的符文。墙上装饰着古老、大多已褪色的图案，但因为年代久远，无法让这个地方显得有生气。");
         outputText("[pg][Garg]在后面插话道，[say:那个符文每天可以产生少量的纯净水。虽然不多，但对仪式有帮助……]她的声音越来越小，带着不确定的表情看向一旁。");
         outputText("[pg]无论如何，这似乎适合你的目的。你只需要决定如何给她洗澡。");
         menu();
         addNextButton("温柔",washGently).hint("给她应得的关怀。");
         addNextButton("粗暴",washRoughly).hint("她只是个雕像。");
         setExitButton("算了",washNevermind).hint("去忙别的事。");
      }
      
      public function useHerGargoyleFemale() : void
      {
         clearOutput();
         outputText("你随手脱下你的[armor]，一边绕着蹲伏的石像鬼转圈，一边开始挑逗自己的小穴。" + (get_player().sexOrientation < 40 ? "" : " 你有些遗憾她没有男性生殖器，但这绝不会阻止你在石像鬼身上满足你的欲望。") + " 你抓住她的尾巴，由于她那类似尸僵的状态，尾巴仅仅勉强能够改变位置，你将尾巴尖端弯曲朝上。");
         outputText("[pg]随着你用力一捏，她尾巴尖端沉重的石刺缩了回去，让她的尾巴变得和她身体其他部位一样异常光滑。你把她的尾巴调整到刚好适合你的高度，然后顺势坐了下去。多亏了她尾巴那雕塑般的光滑感，进入的过程很轻松，很快你就坐到了底，深到能感觉到那尖端正试图强行挤进你的子宫。你在她的附肢上挺动臀部，淫荡地呻吟着，开始像骑一根粗大肉棒一样骑乘它。");
         get_player().cuntChange(15,true,true,true);
         outputText("[pg]完全失去知觉的[garg]保持着低矮的蹲姿在你面前，甚至连呼吸都没有。尽管如此，当你在她的尾巴上弹跳，一次又一次地将自己刺穿在她光滑的附肢上时，她还是把你撑得又大又宽。作为奖励，你向前伸出手，将几根手指滑入她冰凉紧致的小穴中。她无法做出回应，但你确信她仍然能感觉到你的手指在她体内滑动，随着你在她肉感的尾巴上每一次弹跳而深入。");
         outputText("[pg]你高兴地注意到，由于你的[vagina]涌出大量的润滑液，石像鬼的尾巴现在变得又黑又湿。现在你几乎是在[garg]的尾巴上滑动，骑乘着走向不可避免的高潮。你在一次弹跳的顶点射了，重重地将自己砸在[garg]的尾巴上，直到她的尾尖突破了你子宫的入口。你狂喜地尖叫着，将你的淫液肆意地喷洒在石像鬼的尾巴、背部和腿上，直到你完全筋疲力尽。");
         outputText("[pg]心满意足的你花了几分钟时间恢复，然后慢慢地穿回你的[armor]。你走了出去，在离开时确保轻轻拍了拍[garg]的头。");
         get_player().orgasm("Vaginal");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2788,1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function useGargoyleMaleHerm() : void
      {
         clearOutput();
         outputText("你带着色眯眯的眼神走近那座一动不动的雕像。你迅速脱下你的[armor]，绕着这个" + (garLoli() ? "小小的" : "") + "被冻结的女孩转了一圈。费了一番力气，你把她那条沉重带刺的尾巴抬开，露出了隐藏在她双腿之间的紧致" + (garLoli() ? "小穴" : "阴户") + "。你在石像鬼身后跪下，把脸埋进她的" + (garLoli() ? "可爱小屁股里，吸吮着她未发育成熟的私处" : "股沟里，吸吮着她的阴道") + "，把它弄得湿润，为你的肉棒做准备。");
         outputText("[pg]令你惊讶的是，当你把舌头滑进她体内时，石像鬼对你的舌头毫无反应。她完全一动不动——甚至当你把唾液涂抹在她体内时，她爱之通道的内壁也是静止的。准备了几分钟后，你抓住你的[cock biggest]滑了进去。" + (garLoli() ? "即使有" : "尽管她天生紧致，但多亏了") + "你刚才涂抹的大量润滑液" + (garLoli() ? "，你还是得用力把它塞进去" : "，进去的过程相对容易") + "，很快你就齐根没入了石像鬼的体内。你在她紧致光滑的洞里快速抽插了几下，很快就演变成了一场快速、猛烈的操弄。");
         outputText("[pg]但你并不满足于仅仅操弄一个没有知觉的洞。知道你有能力通过触摸“唤醒”[garg]，你决定把这用在相当狡猾的地方。你伸手绕过她的身体，抓住" + (garLoli() ? "她平坦的胸部，粗暴地揉捏着" : "她的一只乳房，用力挤压了几下") + "，直到你听到小石像鬼发出微弱的喘息声。你立刻松开手。你的手转向她紧绷的屁股，响亮地拍了一下。你重复了两次这个动作，终于感觉到她的阴户——只有一点点——在你的肉棒周围收缩。你把注意力转移到她的大腿上，在你抽插的[cock biggest]下方，双手轻轻地抚摸着两片灰色的皮肤。你感觉到她微微颤抖，但就在她即将苏醒的边缘，你收回了手。");
         outputText("[pg]你继续在她体内抽插，随着你的快感稳步攀升至高潮，你的动作变得快速而猛烈。只有当你突破高潮的门槛时，你才再次把手放在[garg]身上，抓住她的屁股，最后一次猛烈地插入她体内，把你的[cock biggest]齐根推入。就在她醒来的时候，你射在了她里面，在她的耳边色情地呻吟着，精液从你的阴茎周围滴落下来。");
         outputText("[pg][say:主……主人？][garg]喘息着，当你慢慢从她体内抽出时，她全身都在颤抖。你的精液从她的小穴里流出，在她身下汇聚成一滩。你调皮地把手指塞进她双腿之间，将你的精液堵在她体内。令你高兴的是，这个简单的动作直接让[garg]达到了高潮：她抽搐着，伴随着沉重的“砰”的一声瘫倒在地！");
         outputText("[pg]你轻轻拍了拍石像鬼的头，以表扬她干得不错，然后转身离开。");
         get_player().orgasm("Dick");
         dynStats(DynStat.Sens(-1));
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2788,1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function titFuckTheGargoyle() : void
      {
         clearOutput();
         outputText("你在长椅上坐好，张开双腿。你拍了拍大腿，让[garg]坐在你两腿之间，同时掏出你[cock biggest]。她犹豫地走近，坐在你两腿之间的地板上，而你则向后靠去，抚摸着你的肉棒直到完全勃起。你让石像鬼坐在那里，睁大眼睛看着你继续自慰。虽然你只是在为正戏做准备，但你还是忍不住享受这种基本性行为带来的快感，尤其是当你抚摸自己时，脚边那个" + (garLoli() ? "天真无邪的青春期前女孩" : "生物") + "的脸离你的龟头只有不到一英寸的距离，这让快感更加强烈。");
         outputText("[pg]当你对肉棒坚硬的程度感到满意时，你告诉[garg]用她那" + (garLoli() ? "" : "大而柔软的") + "乳房来服侍你。[say:主、主人？]她" + (garLoli() ? "带着困惑的表情问道，低头看了一眼自己不存在的乳房" : "喘息着，在离你肉棒只有一英寸的地方用嘴做出了一个可爱的小“o”形") + "。你重复了命令，并用肉棒敲了敲她的鼻子以示强调。她害羞地" + (garLoli() ? "把胸前那点婴儿肥挤在一起，徒劳地想让它们变大一点" : "托起她的D罩杯") + "，然后靠向你，" + (garLoli() ? "徒劳地试图" : "") + "把你的[cock biggest]夹在中间。");
         outputText("[pg]" + (garLoli() ? "虽然几乎没有乳房，但这对你来说并不重要。光是看到这个可爱的孩子尽力而为的样子就足够令人兴奋了。" : "") + "在你的鼓励下，[garg]开始跪在地上起伏，" + (garLoli() ? "用胸部摩擦你的肉棒" : "让你的肉棒穿过她柔软冰凉的乳房") + "。伴随着愉悦的叹息，你伸出手抚摸她的头发，在女孩" + (garLoli() ? "慢慢摩擦" : "开始缓慢但稳定地用乳房操") + "你时抚摸着她。你一边继续嘟囔着鼓励的话，一边向后靠去，任由快感席卷全身，陶醉在" + (garLoli() ? "这个小女孩尽力抚摸你的可爱模样中" : "她那丰满的胸部按摩你肉棒时令人难以置信的柔软中，稳步地向着") + "把你榨干的目标前进。");
         outputText("[pg]突然，你感觉到肉棒上传来一阵强烈的湿润感。你低下头，本以为会看到先列腺液从你身上自由流淌，却看到[garg]将你肉棒的顶端滑入她的嘴里，开始" + (garLoli() ? "在肉棒摩擦她胸部的同时口交龟头" : "在乳交的同时为你口交") + "。你又给了她几句鼓励的话，把她的头进一步压在你的肉棒上，强迫她吞下" + (garLoli() ? "更多" : "她乳房夹不住的剩余部分") + "。尽管她大理石般的肌肤略带寒意，但她的嘴却出人意料地诱人，她那" + (garLoli() ? "" : "长长的") + "舌头迅速缠绕住你的[cock biggest]，配合着她胸部的起伏挤压着它。");
         outputText("[pg]既然没有理由克制，你尽可能地放松下来，在双重刺激的快感中迷失了理智。你很快发现自己随着她柔软的" + (garLoli() ? "胸部摩擦" : "乳房包裹") + "你的肉棒，并用舌头挑逗你现在正在扩张的尿道而轻声喘息。你很快感觉到肠胃翻滚，老二变得更加僵硬——要来了！");
         outputText("[pg]你抓住[garg]用力将她按倒，在射精的同时将你的肉棒猛地插进" + (garLoli() ? "这个孩子的" : "她的") + "喉咙。如果是人类肯定会被这一下弄得窒息——但[garg]只是扭动挣扎着，你能看到并感觉到她吞咽着涌入她嘴里的精液，她的喉咙按摩着你膨胀的龟头，比任何乳交都更能榨取你的精液。当她的脸被按在你的腹股沟上时，你猛地挺动臀部，深深地插进" + (garLoli() ? "这个小女孩的" : "她的") + "喉咙，最后的一股精液喷射而出，顺着她的食道流下。");
         outputText("[pg]完事后，[garg]的脸上一片狼藉，白色的液体顺着她的脸颊流下。伴随着湿润的“啵”的一声，你将你的[cock biggest]从她嘴里拔出，释放出的精液如同决堤一般，迅速从她大张的嘴里漏出，弄脏了她的" + (garLoli() ? "平胸" : "乳房") + "和肚子。看到这幅景象，你轻笑起来");
         if(gargoyleConfidence() >= 70)
         {
            outputText("，令你惊讶的是，[garg]也笑了");
         }
         outputText("。");
         outputText("[pg][say: 刚才……舒服吗，主人？]她天真地问道。");
         outputText("[pg]你轻轻拍了拍她的头，告诉她这不仅是令人愉悦，简直太棒了。小石像鬼心满意足地开始舔舐你的精液，而你则清理干净自己，准备返回营地。");
         get_player().orgasm("Dick");
         dynStats(DynStat.Sens(-1));
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2788,1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function talkToGargoyleHistoryA() : void
      {
         clearOutput();
         outputText("你问[garg]关于玛瑞斯的历史她能告诉你些什么。她轻轻耸了耸肩。[say: 我不能告诉您太多，主人。我一生都在这片土地上度过。我所知道的大部分都是教会教导的教义。这样可以吗？]");
         outputText("[pg]你告诉她，当然，你很乐意听。[say: 教会的人相信——曾经相信——女神玛莱在很多世代以前，远在恶魔到来之前，就在这里创造了智慧生命。她是众多神明中最高的一位，是自然世界的化身。她带来了动物" + (get_noFur() ? "人" : "形态的生物") + "，他们为了纪念她建造了这座大教堂。利用魔法知识，这座教堂的祭司试图效仿玛莱的力量，创造出像我这样的生物。然而，最终恶魔来了，我不知道他们从哪里来，并开始传播他们的腐化。祭司们……试图抵抗……试图抵御……对不起，主人，]她抽泣着说。你注意到她转过身去，试图隐藏她的羞愧。[say: 我不想再想这些了。求您了，]她恳求道。未能保护教会人民的记忆仍然沉重地压在她的心头。你觉得你可以责备她的情绪化，或者试着安慰她。");
         menu();
         addButton(0,"责备",berateGargoyleForBeingDumb);
         addButton(1,"安慰",comfortGargoyleDumbness);
      }
      
      public function talkToGargoyle(param1:Boolean = true) : void
      {
         var woken:Boolean;
         var _g:Gargoyle;
         var _loc2_:Boolean = false;
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,829) >= 3 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,830) >= 3 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,831) >= 3 && (gargoyleConfidence() > 99 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2786) < 1))
         {
            _loc2_ = true;
         }
         if(param1)
         {
            clearOutput();
            get_images().showImage("gargoyle-cathedral");
            outputText("你在圣所的一张长椅上坐下，示意[garg]过来。");
            if(gargoyleConfidence() < 50)
            {
               outputText("她温顺地走向她的主人，跪在你面前，顺从地低着头。");
            }
            else if(gargoyleConfidence() < 70)
            {
               outputText("她几乎是蹦蹦跳跳地跟着你，在你脚边蹲下，满怀期待地抬头看着你。");
            }
            else
            {
               outputText("她开心地坐在你身边，伸出一只手臂揽住你的" + (garLoli() && !get_player().isChild() ? "腰" : "肩膀") + "，将你锁在亲密的陪伴中。");
            }
            if(_loc2_)
            {
               outputText("[say:主人……我一直想问您一件事。]");
            }
            else
            {
               outputText("你告诉她你想和她聊几分钟，这立刻让她的眼睛兴奋地亮了起来。[say:主人太抬举我了……您想聊些什么？]");
            }
         }
         menu();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,829) < 3)
         {
            addButton(0,"历史",historyGo);
         }
         else
         {
            addButtonDisabled(0,"历史");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,830) < 3)
         {
            addButton(1,"大教堂",cathedralTalks);
         }
         else
         {
            addButtonDisabled(1,"大教堂");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,831) < 3)
         {
            addButton(2,"关于她",talkAboutGarName);
         }
         else
         {
            addButtonDisabled(2,"关于她");
         }
         if(_loc2_)
         {
            addButton(3,"关系",relationshipTalk);
         }
         else
         {
            addButtonDisabled(3,"关系",FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2786) < 1 ? "你应该先和" + FlagDict_Impl_.arrayReadString(KFLAGS.flags,825) + "亲近一点。" : "");
         }
         _g = this;
         woken = true;
         addButton(14,"返回",function():void
         {
            _g.returnToCathedral(woken);
         });
      }
      
      public function talkCathedralA() : void
      {
         clearOutput();
         outputText("你让[garg]给你讲讲周围的大教堂。听到这个主意，她明显亮了起来。[say: 这是方圆几英里内最宏伟的建筑，]她自豪地宣称，指着拱形天花板和残存的彩色玻璃窗。[say: 嗯，虽然现在看起来不怎么样，主人，但它曾经非常壮观。人们从四面八方来到这里祈祷。那真是太棒了……]她的声音渐渐变小，眼眶湿润地望着远方，陷入了回忆。");
         outputText("[pg][say: 主人？]她看着你的眼睛问道。[say: 我……我想重建大教堂。我知道……没有谁会再回到这里了，但是……我不知道。感觉修复造成的破坏就像是一场胜利。虽然只是一个小小的胜利，但仍然是一场胜利。][garg]突然倒吸了一口凉气，说道，[say: 如-如果主人您同意的话？]");
         outputText("[pg]你可以告诉她这毫无意义，或者鼓励她。");
         menu();
         addButton(0,"毫无意义",pointlessGargoylesArePointless);
         addButton(1,"鼓励",encourageGargoyleWaifuToDoSomething);
      }
      
      public function talkAboutGarName() : void
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,831) == 0)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,831,1);
            garNameA();
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,831) == 1)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,831,2);
            garNameB();
         }
         else
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,831,3);
            garNameC();
         }
      }
      
      public function tailFuckGargoyleScene() : void
      {
         clearOutput();
         outputText("毫无预兆地，你抓住了[garg]那条长满尖刺的粗壮尾巴，调皮地拽了一下。她发出一声惊讶的[say:呀！]，但在你告诉她蹲下并把尾巴绷直后，她就安静了下来。她乖乖地压低身子蹲下，将尾巴在双腿间绷成一个\"U\"形，尾巴尖笔直地指向上方，正好位于你的小腹和她的脸之间。你揉了揉她的头发，脱下你的[armor]，很快就赤身裸体地站在石像鬼面前。在你的命令下，她尾巴尖上突出的粗糙石刺缩了回去，让这根附肢变成了一个光滑冰凉的表面。");
         outputText("[pg]借助旁边长椅的一点支撑，你在她狭窄的尾巴尖上方稳住身体，然后慢慢地坐了下去。尾巴尖轻松地滑过你的下体阴唇，当你顺着石像鬼的尾巴柱身向下滑动时，它那如石头般冰冷的表面让你的脊背一阵发凉。");
         get_player().cuntChange(15,true,true,true);
         outputText("当你终于坐到底时，你浑身一颤，将她的尾巴完全吞没，直到你的小穴被她越来越粗的尾巴撑得几乎发痛，你能感觉到尾巴尖正抵着你的子宫口。");
         outputText("[pg]现在她的尾巴已经牢牢地插在你的深处，[garg]开始在你体内扭动尾巴，在你的[vagina]里滑进滑出几英寸。为了鼓励她，你抓住她的肩膀作为支撑，把你的小穴向她的脸推得更近了一些。领会了你的暗示，她像蛇一样伸出长长的舌头，在你的阴蒂上轻轻一舔，立刻引得你发出一声愉悦的喘息。她很快就开始对你进行双重攻势，一会儿吸吮着你的[clit]，一会儿又将尾巴猛插进你的[vagina]里。");
         outputText("[pg]就在你感觉到身体开始紧绷，准备迎接高潮时，石像鬼的双手滑到了你的腰间。你正想问她要做什么，却感觉到一根手指抵住了你的[asshole]。在她的口舌侍奉下，你很难放松括约肌让她进入，但当她终于插进去时，她那冰冷光滑的手指在你的直肠通道里游走的感觉简直妙不可言。");
         outputText("[pg]还没等你适应后庭的入侵者，你已经舒服得翻起了白眼。淫液从你的小穴中喷涌而出，在你高潮时溅了[garg]一脸。你的穴肉紧紧绞住她的手指和尾巴，将它们困在你的体内。你享受着高潮的余韵，在她坚硬且迅速湿润的尾巴上弹跳着，直到你的身体平静下来。");
         outputText("[pg]完事后，你小心翼翼地从石像鬼的尾巴上下来，有些罗圈腿地捡起你的[armor]。等你穿好衣服，[garg]也已经把自己清理干净，正热切地期待着你的赞许。");
         outputText("[pg][say:主人还满意吗？]她问道");
         if(gargoyleConfidence() > 70)
         {
            outputText("，嘴角带着一丝笑意");
         }
         outputText("。");
         outputText("[pg]你揉了揉她的头，告诉她，哦，是的，你确实是。你留给她一个满意的微笑，挂在她薄薄的嘴唇上。");
         get_player().orgasm("Vaginal");
         dynStats(DynStat.Sens(-1));
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2788,1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function submitName() : void
      {
         var _loc1_:String = getInput();
         if(_loc1_ == "")
         {
            clearOutput();
            outputText("你必须给她起个名字。");
            menu();
            genericNamePrompt();
            addButton(0,"继续",submitName);
            return;
         }
         FlagDict_Impl_.arrayWriteString(KFLAGS.flags,825,_loc1_);
         clearOutput();
         outputText("[say: [Garg]，]她发出咕噜声，[say: [garg]，[garg]。主人的品味很有趣。]");
         outputText("[pg]她继续满怀期待地跪在你面前。你想你可以给" + (garLoli() ? "这个奇怪的小女孩" : "她") + "下达一个命令——也许是一些幽默的事情，或者也许是一些肉欲的事情——或者只是和她说话，尽管到目前为止她似乎有点……奇怪。");
         gargoyleStarterMenu();
      }
      
      public function strapOnGargoyle() : void
      {
         clearOutput();
         outputText("你快速环顾了一下废墟，吩咐[garg]去找点能让你们俩更<i>亲密</i>的东西。");
         outputText("[pg][say: 亲密？]她困惑地问道。你翻了个白眼，让她去拿祭坛上的那根圣杖，并把它穿过一根皮带。她犹豫了一下，但还是尽职地照做了，不一会儿就拿着那根光滑的银色圆柱体和一根皮绳回来了。稍微费了点功夫，你就用圣杖做成了一个简单的穿戴式假阳具，并指示[garg]穿上它。现在她明白了！石像鬼穿上皮带，当圣杖的一端滑入她体内时，她可爱地打了个寒颤。还没等她回过神来，你一手抓住她的法杖肉棒，另一手轻轻推了她一下。");
         outputText("[pg]她躺了下来，你跨坐在" + (garLoli() ? "小女孩的" : "她的") + "腰上，抚摸着她的法杖，换来的是石像女孩急促的欢愉喘息。你这些动作几乎没有刺激到她的小穴——她一定能<i>透过</i>法杖感觉到，就好像那是一根真正的肉棒一样。你觉得很有趣，开始给这根法杖打飞机，用握紧的拳头缓慢而有节奏地套弄着。在令人愉悦的刺激下，[garg]扭动着身体，很快就开始抚摸她那" + (garLoli() ? "平坦的胸部" : "丰满的双乳") + "，并挺起臀部迎合你的拳头，随着你每一次的套弄，将更多的法杖肉棒塞进你的手中。");
         outputText("[pg][say: 看来有人很享受嘛，]你打趣道，[garg]立刻僵住了，尴尬地张大了嘴巴。你轻笑一声，拍了拍她的大腿，开始脱下你的[armor]。但你不能就这么把[garg]晾在一边，总得给她点刺激：");
         if(!get_player().isTaur() && !get_player().isGoo() && !get_player().isDrider() && !get_player().hasTailInsteadOfLegs())
         {
            outputText("你先露出一条腿，动作缓慢而性感，让她对你的下体惊鸿一瞥，然后又将其隐藏起来。你咧嘴一笑，将脚悄悄伸到她的大腿上，用脚跟轻轻摩擦她光滑柔嫩的肌肤。你来到她法杖肉棒的根部，它像旗杆一样笔直地竖在空中。脱衣服时，你用大脚趾和二脚趾夹住她的肉棒，沿着光滑的柱身滑到顶端。[garg]呻吟着，头向后仰，你开始用脚交她的肉棒，慢慢地在钢铁般的阴茎上施加越来越大的压力，直到它紧贴着她的肚子。你的脚跟接管了工作，沿着她肉棒的底部快速摩擦，同时你终于脱掉了你的[armor]。");
         }
         else
         {
            outputText("你给她上演了一场好戏，为石像鬼跳了一段简短的脱衣舞。你缓慢而性感地脱下你的[armor]，直到最后一刻才露出你私处的冰山一角，那时你最后一件衣服掉落在了地板上。");
         }
         if(get_player().hasVagina())
         {
            outputText("[pg]当你结束对她的挑逗和脱衣舞时，[garg]已经欲火焚身，气喘吁吁了。现在你赤身裸体，跪倒在她神圣的法杖肉棒上，跨坐在她的臀部，让它对准你的[vagina]。你降低身体，直到法杖的尖端压在你的下唇上——你惊喜地发现，接触点周围迅速蔓延开一阵温暖的刺痛感，你的小穴立刻做出了反应，流出一小股淫液，在石像鬼的柱身上凝结成珠。");
            outputText("[pg]事不宜迟，你坐到假阳具上，将自己降到那根令人刺痛的金属棒上，直到你的腹股沟紧贴着[garg]的腹股沟。与此同时，当你的[vagina]吞没她的长度时，她咬着下唇，舒服地呜咽着。一旦你完全吞下了她所能提供的一切，你便开始用臀部摩擦她，在石像鬼身上前后摇摆。令你惊讶的是，[garg]抓住了你，将她修长的手指挤进你的[hips]，把你拉起来，几乎要脱离她的法杖。你决定顺其自然；你" + (garLoli() ? "把手放在她的胸前" : "抓住她的奶子") + "作为支撑，开始在她的肉棒上弹跳。");
            get_player().cuntChange(15,true,true,false);
            outputText("[pg]很快，你们俩都舒服地呻吟起来，当你继续骑乘[garg]的假阳具时，你们挺动着臀部迎合彼此。然而，你能感觉到高潮即将来临的紧绷感在你的肠道中积聚，如果你的伴侣那紧张的喘息声能说明什么的话，她也快到了。你开始弹跳得更快，加快到疯狂的节奏，你的小穴收缩着夹紧里面的金属棒，试图榨干这根假肉棒，快感的浪潮席卷了你。你在高潮期间没有放松，毫不夸张地说，你一直骑乘着直到[garg]发出一声尖锐的尖叫，抓住你的背，把你的脸埋进她的" + (garLoli() ? "平胸" : "奶子") + "里，紧紧地抱着你，因为她也高潮了。突然间，变成了她在猛干你，将她的臀部挺进你的[vagina]里。");
            outputText("[pg]等她结束时，你的臀部和大腿上都溅满了汗水和淫液。你还在为刚才的激烈交锋喘着粗气，慢慢地从[garg]的肉棒上爬下来，翻身平躺，精疲力尽。等你恢复了些许体力，踉跄着站起来时，[garg]已经在你身边沉沉睡去，发出可爱的呼噜声，她的金属肉棒依然直挺挺地竖在半空中。你轻轻拍了拍她的大腿，穿好衣服，留下这只睡得正香的石像鬼，独自返回营地。");
         }
         else
         {
            outputText("[pg]当你结束对她的挑逗并脱光衣服时，[garg]已经欲火焚身，喘着粗气。现在你赤身裸体，跪在她的法杖肉棒上方，跨坐在她的臀部，将它对准你的[asshole]。你慢慢放低身体，直到法杖的顶端抵住你紧闭的后庭——令你惊喜的是，一股温暖酥麻的感觉迅速从接触点蔓延开来。你的肛门立刻做出了反应，完全放松下来，让[garg]假阳具的顶端滑入你的体内。");
            outputText("[pg]事不宜迟，你顺势坐上假阳具，将自己沉降在那根令人酥麻的金属法杖上，直到你的屁股紧紧贴住[garg]的大腿。在此期间，她一直咬着下唇，随着你的后庭吞没她的长度，发出愉悦的呜咽声。当你完全接纳了她的一切后，你开始用臀部摩擦她，在石像鬼身上前后摇摆。令你惊讶的是，[garg]抓住了你，将她修长的手指掐进你的[hips]，把你往上拉，几乎要让你脱离她的法杖。你决定顺从她的动作；你" + (garLoli() ? "把手放在她的胸膛上" : "抓住她的乳房") + "作为支撑，开始在她的肉棒上起伏。");
            get_player().buttChange(15,true,true,false);
            outputText("[pg]很快，你们俩都在愉悦中呻吟，当你继续骑乘[garg]的假阳具时，你们挺动臀部迎合着彼此。然而，你能感觉到肠道中正在酝酿着即将到来的肛交高潮的紧绷感，如果从你伴侣那压抑的喘息声来看，她也快到了。你开始加快起伏的速度，节奏变得狂野起来，你的后穴收缩着夹紧体内的金属法杖，本能地想要把入侵者挤出去，但这只会让一波波的快感席卷全身。你在整个高潮期间都没有停下，名副其实地骑乘到底，直到[garg]发出一声尖锐的尖叫，抓住你的背，把你的脸按进她" + (garLoli() ? "平坦的胸膛" : "的乳房") + "里，紧紧抱住你，同时她也高潮了。突然间，变成了她在猛干你，将她的臀部狠狠挺进你的[asshole]，直到你们都猛烈地高潮，在极致的快感冲击下紧紧相拥。");
            outputText("[pg]你还在为刚才的激烈交锋喘着粗气，慢慢地从[garg]的肉棒上爬下来，翻身平躺，精疲力尽。等你恢复了些许体力，踉跄着站起来时，[garg]已经在你身边沉沉睡去，发出可爱的呼噜声，她的金属肉棒依然直挺挺地竖在半空中。你轻轻拍了拍她的大腿，穿好衣服，留下这只睡得正香的石像鬼，独自返回营地。");
         }
         get_player().orgasm("VaginalAnal");
         dynStats(DynStat.Sens(-1));
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2788,1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function sharkgirlsArentExclusiveBiatch() : void
      {
         clearOutput();
         outputText("你抚摸着[garg]的头发，安慰她说，和伊兹玛在一起不会影响你和她的关系——你完全可以同时喜欢很多女孩。这似乎并没有让她完全满意，但她也没有发脾气，所以你觉得这样就够了。");
         returnToCathedral(true);
      }
      
      public function ritualGargoyle() : void
      {
         var _g:Gargoyle;
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,827) == 0)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,827,1);
            outputText("你注意到圣所祭坛上的碎石已经被清理干净，上面点燃了许多蜡烛。平坦的石面上放着一个简单的铁碗，里面装满了看起来像水的东西。出于好奇，你问[garg]她在忙些什么。");
            outputText("[pg][saystart]在主人到来很久以前，我一直守护着教区居民和他们的信仰。他们举行奇怪的圣礼和仪式来净化身体和驱除邪恶。");
            if(gargoyleConfidence() < 50)
            {
               outputText("请原谅我的无礼，但是");
            }
            outputText("我想主人也许有一天会需要这些仪式，所以为您准备了它们。我知道一种净化身体的仪式，另一种净化心灵的仪式，还有第三种驱逐邪恶生物和灵魂的仪式，但我警告您：净化身体最好通过痛苦来实现，而驱逐可能和……附身一样……具有侵入性。主人需要这些吗？[sayend]");
         }
         else
         {
            outputText("你走到教堂的祭坛前，[garg]紧随其后。你问她是否还能执行教堂的仪式，她回答说[say: 当然，主人。您需要吗？]");
         }
         menu();
         addButton(0,"身体",bodyRitual);
         addButton(1,"心灵",mindGargoyleRitual);
         if(get_player().hasStatusEffect(StatusEffects.Infested) || get_player().hasStatusEffect(StatusEffects.Exgartuan))
         {
            addButton(2,"驱逐",banishmentGargoyleRitual);
         }
         else
         {
            addButtonDisabled(2,"放逐","驱逐邪恶生物和灵魂的仪式……");
         }
         _g = this;
         addButton(14,"返回",function():void
         {
            _g.returnToCathedral();
         });
      }
      
      public function returnToCathedral(param1:Boolean = false) : void
      {
         var woken:Boolean;
         var _g2:Gargoyle;
         var _g1:Gargoyle;
         var _g:Gargoyle;
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1165,1);
         gargoyleSprite();
         _g = this;
         registerTag("gargconfidence",TagFun_Impl_.fromIntFun(function():int
         {
            return _g.gargoyleConfidence();
         }));
         registerTag("garloli",TagFun_Impl_.fromBool(garLoli()));
         if(!param1)
         {
            clearOutput();
            if(Utils.rand(3) == 0)
            {
               outputText("你回到了废土中那座化为废墟的大教堂。你注意到庭院里的一些瓦砾已经被清理干净，一些窗户也被木板封了起来。显然，自从你上次离开后，[garg]一直在努力工作，试图让这座建筑变得更适合居住。由于道路比以前畅通了，你走了进去。");
            }
            else if(Utils.rand(2) == 0)
            {
               outputText("你远远地看到了大教堂，并看到有缕缕青烟升起。你警觉地准备好你的[weaponName]冲了过去。然而，让你松了一口气的是，你发现燃烧的物体只是几只死掉的小恶魔，它们本来想找点容易抢劫的东西，却遇到了大教堂刚刚苏醒的保护者。你绕过它们烧焦的尸体，走了进去。");
            }
            else
            {
               outputText("你漫步走进大教堂的庭院，惊讶地看到两个绿色的小地精荡妇在外面东张西望，试图搬走一些石墓碑来实施她们邪恶的计划。然而，她们看到你走近，就迅速逃跑了——今天她们对打捞战利品比打架或做爱更感兴趣。你暗自轻笑，走了进去。");
            }
         }
         menu();
         if(get_game().time.hours <= 9 || get_game().time.hours >= 18 || param1)
         {
            if(!param1)
            {
               get_images().showImage("gargoyle-cathedral");
               outputText("[pg]在昏暗的");
               if(get_game().time.hours <= 9)
               {
                  outputText("清晨");
               }
               else
               {
                  outputText("傍晚");
               }
               outputText("阳光从破碎的窗户倾泻而入，你看到[garg]在瓦砾中翻找，缓慢但坚定地努力修复大教堂受到的破坏。然而，一看到你，她立刻放下手中的活计，并且");
               if(gargoyleConfidence() < 70)
               {
                  outputText("在你面前跪下，深深地低下了头。");
               }
               else if(gargoyleConfidence() < 99)
               {
                  outputText("在你面前深深鞠躬，石唇上挂着一丝微笑。");
               }
               else
               {
                  outputText((garLoli() ? "开心地跑到你身边" : "扭动着性感的臀部走向你") + "，在你脸颊上印下一个轻柔的吻，然后向你低下了头。");
               }
               outputText("[pg][say:主人回来了，] [garg]说道");
               if(gargoyleConfidence() > 50)
               {
                  outputText("开心地。");
               }
               else
               {
                  outputText("庄重地。");
               }
               outputText("[say: 您有什么吩咐？]");
            }
            addButton(0,"外貌",gargoyleAppearance);
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,829) < 3 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,830) < 3 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,831) < 3 || gargoyleConfidence() > 99 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2786) < 1)
            {
               _g1 = this;
               addButton(1,"交谈",function():void
               {
                  _g1.talkToGargoyle();
               });
            }
            else
            {
               addButtonDisabled(1,"交谈","她没有什么可告诉你的了。");
            }
            if(get_player().get_lust() >= 33)
            {
               addButton(2,"性爱",gargoyleSexMenu);
            }
            else
            {
               addButtonDisabled(2,"性爱","你还不够兴奋。");
            }
            addButton(5,"仪式",ritualGargoyle);
            if(gargoyleConfidence() >= 70 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,827) > 0)
            {
               addButton(6,"淫乱仪式",gargoyleKinkyRituals);
            }
            else
            {
               addButtonDisabled(6,"淫乱仪式","也许如果你更了解她的话……");
            }
            addRowButton(1,"清洗",wash).hint("给她擦洗一下。");
         }
         else
         {
            if(!param1)
            {
               outputText("[pg]在废墟中，你可以看到[garg]栖息在她的基座上，保持着低矮的、像捕食者一样的蹲伏姿势，就像你发现她时一样。你在她眼前挥了挥手，确认她处于某种休眠模式。只要主人的简单触碰就能唤醒她");
               if(get_player().get_lust() >= 33)
               {
                  outputText("，或者你可以利用她来满足你自己的欲望，就像一个真人大小的性玩具一样");
               }
               outputText("。");
            }
            _g2 = this;
            woken = true;
            addButton(0,"唤醒她",function():void
            {
               _g2.returnToCathedral(woken);
            });
            if(get_player().get_lust() >= 33)
            {
               if(get_player().hasCock())
               {
                  addButton(1,"使用她",useGargoyleMaleHerm);
               }
               else if(get_player().hasVagina())
               {
                  addButton(1,"使用她",useHerGargoyleFemale);
               }
               else
               {
                  addButtonDisabled(1,"使用她","这个场景需要你有生殖器。");
               }
            }
            else
            {
               addButtonDisabled(1,"使用她","你还不够兴奋。");
            }
         }
         setExitButton();
      }
      
      public function relationshipTalk() : void
      {
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2786,1);
         outputText("[pg]你拍了拍她的头，让她继续。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2787) == 1)
         {
            outputText("[say: 我知道主人说过我不过是个工具……但、但是，我们已经这么亲密了，主人一直对我这么好……]");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2787) == 2)
         {
            outputText("[say: 即使我已经算是主人的女朋友了，我还是想确认一下……]");
         }
         else
         {
            outputText("[say: 只、只是……我们已经这么亲近了，而且……]");
         }
         outputText("这只" + (garLoli() ? "小" : "") + "石像鬼在你身边局促不安地扭动着，然后抬起头看着你问道：[say: 你觉得我怎么样？如果……如果我是自由的，而你也不是主人……对你来说，我会是什么？]");
         outputText("[pg]她紧张地看着你，等待着你的回答。你该怎么回答呢？");
         menu();
         addButton(0,"爱人",gargoyleWaifu);
         addButton(1,"家人",gargoyleDaughter);
         addButton(2,"奴隶",gargoylePet);
      }
      
      public function reassureTheGargoyle() : void
      {
         clearOutput();
         gargoyleConfidence(10);
         get_images().showImage("gargoyle-cathedral");
         outputText("你忍不住为这个可怜的" + (garLoli() ? "小女孩" : "石像鬼") + "感到难过。不难猜出发生了什么，说实话，她让你想起了自己——以及如果你失败了会有什么后果。" + (garLoli() && get_player().isChild() ? " 你们都只是小孩子，却背负着超出年龄的责任。" : "") + " 你伸出手，放在她光滑冰冷的肩膀上。你尽可能安慰地告诉她，你是英格纳姆的勇者[name]。你的职责和她曾经的职责并非完全不同，虽然你希望自己永远不会经历她所经历的一切，但你完全能体会她的感受。");
         outputText("[pg][garg]抬头看着你，她红宝石般的眼睛在大教堂昏暗的光线中闪烁着。你捧起她的脸颊，对她笑了笑。[say: 来吧，]你回答道，向她伸出一只手。[say: 我们离开这里。]");
         outputText("[pg][say: 主人……我不能，]她说着，再次避开你的目光。[say: 求您了，不要对我提出这样的要求。我……我仍然被束缚在这个地方。求您了，主人。我再也不会向您提出任何要求了。求您了。]");
         outputText("[pg]" + (garLoli() ? "你不想把这孩子一个人留在这里，但你别无选择。" : "") + "你慢慢地点了点头，问她一个人留在这里会不会有事。她对你微微一笑，说道：[say: 当然，主人。特别是如果……如果您回来的话。您会回来的，主人？对吗？]她" + (garLoli() ? "" : "深深地") + "看着你的眼睛，" + (garLoli() ? "怯生生地说：[say: 我们可以一起玩……" : "声音沙哑地发出呼噜声：[say: 如果您回来的话……我可以让它……很舒服……") + " ]");
         outputText("[pg]你揉了揉[garg]的头发，向她保证你会回来的，然后你才离开并返回营地。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function pointlessGargoylesArePointless() : void
      {
         clearOutput();
         gargoyleConfidence(-5);
         outputText("你翻了个白眼，试图解释这有多愚蠢。这是荒郊野外的一栋建筑；恶魔们绝对不在乎它，尤其是在周围没有人类可以腐化或奴役的情况下。你命令她不要把时间浪费在修复建筑上，只要能让你在那里待得下去就行了；除此之外的任何努力都是白费力气。");
         outputText("[pg][say:我……当然，主人。我、我真是太傻了。]");
         outputText("[pg]你点点头，转移了话题。");
         talkToGargoyle(false);
      }
      
      public function noReactionToBodyRitual() : void
      {
         clearOutput();
         outputText("你只是静静地躺着，试图从[garg]“温柔的服侍”中恢复过来。几分钟后，你喘过气来，收拾好你的东西，一言不发地走出了大教堂。该死，你全身酸痛。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function nameZeGargoyle() : void
      {
         clearOutput();
         outputText("你要给她起什么名字？");
         menu();
         addButton(0,"继续",submitName);
         genericNamePrompt();
      }
      
      public function mindRitualPervy() : void
      {
         clearOutput();
         gargoyleConfidence(2);
         outputText("你告诉[garg]你一直被肮脏的想法所困扰，并希望消除一些蔓延到你脑海中的腐化。" + (garLoli() ? "小女孩" : "[garg]") + "深深地点了点头，表达了对你选择的尊重和参与仪式的渴望，并告诉你跪在祭坛前。你照做了，在大教堂前面的树神像前摆出低矮的恳求姿势，而石像鬼则清理了祭坛，只留下一个简陋的水碗。");
         outputText("[pg][garg]只一振翅，便飞身落到祭坛上，在你面前盘腿坐下。她露出性感的笑容，拿起小小的水盆举到唇边，轻轻喝了一口。[say:[he]若追寻纯洁，便是有福的，]她开始吟诵，水盆也从薄唇边放低。与此同时，她缓缓抬起左腿，把脚趾抵在你的下巴上。[garg]与你四目相对，将水盆移到自己的大腿旁，开始倾倒，让水顺着她石头般光滑的腿感性地淌下。[say:[he]若追寻智慧，便是有福的，]她低声呢喃，而你本能地张开嘴，让圣水从她的脚上滴入口中。");
         outputText("[pg][garg]迅速将她的小脚趾滑入你的嘴里，让你像婴儿一样吮吸上面的圣水。她让你保持这种状态将近一分钟，从流向你的小溪中吸取圣水，然后收回她的腿，连带着你的头。当你靠近时，她向后倾斜，用蝙蝠般的翅膀保持平衡，完成了吟唱：[say: 在肉体享乐之前，渴望圣洁和美德的人是有福的。]她再次从水盆里倒水，将圣水直接倒在" + (garLoli() ? "她光滑平坦的胸部" : "她大而匀称的乳房") + "上。水顺着她的胸部和腹部流下，在她的阴蒂上形成了一个小瀑布，她引导你过去。");
         outputText("[pg]你按照她明显的意愿，张开她的双腿，好好看看她现在湿透的裂缝。她的阴道看起来" + (garLoli() ? "很小，像青春期前的孩子" : "很小") + "，但试探性的触摸证明它非常有延展性——你的一次触摸就让[garg]弓起背，因为突如其来的快感而喘息。看着她脸上可爱、着迷的表情，你微笑着，开始猛烈地舔舐，抓住她的大腿，把脸埋在她的双腿之间。你将舌头伸进她光滑凉爽的裂缝中，灵活的舌头每次轻弹都会舔起几滴水，每次都会引起喘息或呻吟。");
         outputText("[pg]很快，当你舔她时，[garg]抓着她的乳房，快速地用手指抚摸她樱桃般的阴蒂，尽力与你保持均匀的节奏，即使瀑布结束，你开始感到头晕目眩，仿佛脑海中的迷雾已经散去。为了表示感谢，你加倍努力取悦她，将舌头伸进她的深处，无情地操她。很快，她开始紧张，停止了自己的动作，抓住你的[hair]，把你的脸进一步推向她的胯部，当她接近高潮时，用双腿和尾巴锁住你的背。");
         outputText("[pg][garg]尖叫着，弓起背，将蝙蝠翅膀完全展开，在高潮时夹住你的舌头。你放慢了速度，在她喘息、倒吸气和呻吟时，给了她最后几下舔舐，慢慢地从高潮中平静下来。她向后倒下，抓着胸口，盯着椽子。你轻笑着站起来，满意地拍了拍她的大腿内侧，让她知道她为你做得很好。你留她在祭坛上微笑着，慢慢地控制住呼吸。");
         dynStats(DynStat.Inte(0.5),DynStat.Lust(-10),DynStat.Cor(-0.5));
         get_player().changeFatigue(50);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2788,1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function mindGargoyleRitual() : void
      {
         clearOutput();
         outputText("你告诉[garg]你一直被肮脏的念头所困扰，希望能消除一些蔓延到你脑海中的腐化。[garg]恭敬地点点头，让你在祭坛前跪下。你照做了，在大教堂前方的树神像前摆出一个低矮的祈求姿势，而石像鬼则拿起水碗高高举起。");
         outputText("[pg][say: 寻求纯洁的[he]是有福的，]她闭上眼睛低下头说道，[say: 寻求智慧的[he]是有福的；在肉体欢愉之前渴望神圣和美德的[he]是有福的。]");
         outputText("[garg]安静地结束了祈祷，将碗放回祭坛上。[say: 喝下这个，主人，]她说着，把碗递给你，[say: 让您的心灵得到治愈。]");
         outputText("[pg]你照做了，大口喝下圣水。当你放下碗时，你感到头脑轻盈，仿佛脑海中的迷雾已经散去。你高兴地喘着气，能够比这几天更清晰地思考。你感谢了[garg]，摸了摸她的头，然后迈着轻快的步伐回到了营地。");
         dynStats(DynStat.Lust(-10),DynStat.Cor(-0.5));
         get_player().changeFatigue(50);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function marbleAintExclusiveBiatch() : void
      {
         clearOutput();
         outputText("你抚摸着[garg]的头发，安慰她说，和玛布尔在一起不会影响你和她的关系——你完全可以同时喜欢很多女孩。这似乎并没有让她完全满意，但她也没有发脾气，所以你觉得这样就够了。");
         returnToCathedral(true);
      }
      
      public function kinkyBodyRitual() : void
      {
         clearOutput();
         outputText("你告诉[garg]，你需要逆转一些影响你身体的腐化。她急切地点点头，脱下你的衣服，把你带到祭坛附近的一个侧壁龛，并指示你张开双臂和双腿。出于对你的小石像鬼的信任，你照做了，任由她用长长的皮带把你绑成大字型。");
         outputText("[pg]你回头看着她从祭坛上拿出一根小马鞭，在手掌中试着抽了一下，然后漫不经心地走回你身边。她依然咧着嘴笑，将身体紧紧贴在你赤裸的背上");
         if(get_player().biggestTitSize() >= 1)
         {
            outputText("，用她冰冷的石头双手托住你的[chest]");
         }
         outputText("。你的[nipples]因为她冰冷的触摸而变得坚硬，当她轻轻咬住你的耳朵，并用马鞭顺着你的大腿拖动时，你浑身一颤。");
         outputText("[pg][say: 你真是个调皮的[boy]，身体竟然变得如此扭曲，]她说着，再次用马鞭划过你极其敏感的大腿内侧，让你因这种感觉而颤抖。你敏锐地感觉到她" + (garLoli() ? "平坦的胸部" : "柔软丰满的乳房") + "压在你汗涔涔的背上。[garg]声音沙哑地低语道：[say: 别担心，主人。我会好好照顾你的……]啪！她挥下马鞭，在你的大腿上留下了一道短暂而刺痛的抽痕。你喘息着，既感到痛苦又感到愉悦，依然沉浸在她拥抱的感觉中。");
         outputText("[pg]仿佛看穿了你的心思，她松开你并向后退了一步，给自己留出空间再次挥鞭——啪！这次她在你的背上留下了一道印记，你因马鞭的刺痛而喘息。但不到一秒钟，她又贴上了你，用她长长、冰凉的舌头舔过她留在你身上的红痕。她向后仰起身子，发出“啧啧”的声音，拍了拍你的[butt]。[say: 痛苦带来纯洁，]她低语着，直起身子将下巴依偎在你的脖颈处。[say: 苦痛带来启迪。]啪！她直接在你的屁股上抽了一下，让你倒吸一口凉气——还没等你合上嘴，她就深深地吻住了你，轻而易举地将她细长的舌头滑入你的口中。");
         outputText("[pg]她在你口中游刃有余地挑逗着，用她冰凉的舌头滑过你的舌头，让它滑过你的牙齿和脸颊，同时她的一只手向下滑向你的");
         if(get_player().hasCock())
         {
            outputText(get_player().cockDescript(0));
         }
         else if(get_player().hasVagina())
         {
            outputText(get_player().vaginaDescript());
         }
         else
         {
            outputText("光秃秃的胯部");
         }
         outputText("。她结束了亲吻并向后退去，最后一次挥下马鞭——啪！强烈的痛苦与愉悦交织在一起，再次刺痛了你。在刺激下，你喘息着，当[garg]解开你的束缚时，你几乎要瘫倒在地，不过她眼疾手快地在你倒下前接住了你。");
         outputText("[pg]她引导你走到祭坛前，扶你躺在上面休息。等你舒服地躺好后，[garg]滑到你身边，将脸颊靠");
         if(get_player().biggestTitSize() < 1)
         {
            outputText("在你的胸膛上");
         }
         else
         {
            outputText("在你的[chest]之间");
         }
         outputText("。你已经感觉到自己的脸皮变厚了，欲望也减少了，于是你向你可爱的小石像鬼露出了感激的笑容。作为回应，她用鼻子蹭了蹭你，并用蝙蝠般的翅膀保护性地将你们俩包裹起来。");
         outputText("[pg]你花了几分钟和[garg]拥抱，但遗憾的是，你知道你不能让你的营地无人看管太久。你拍了拍她的头，吻了吻她的额头，然后收拾好衣服，回到了营地。");
         dynStats(DynStat.Tou(0.5),DynStat.Lib(-0.5),DynStat.Sens(-2));
         gargoyleConfidence(2);
         get_player().takeDamage(Math.round(get_player().maxHP() / 2));
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2788,1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function izmaAndIsabellaDodge() : void
      {
         clearOutput();
         gargoyleConfidence(-5);
         outputText("你开了个烂玩笑，尴尬地笑了笑，试图完全避开这个话题。[garg]可怜巴巴地吸了吸鼻子，但还是领会了你的意思，沉默了下来，让你转移话题。");
         returnToCathedral(true);
      }
      
      public function historyOfGargoylesB() : void
      {
         clearOutput();
         outputText("你让[garg]告诉你一些关于恶魔来到玛瑞斯的事情");
         if(gargoyleConfidence() >= 70)
         {
            outputText("如果她愿意的话");
         }
         outputText("。");
         outputText("她犹豫着点了点头表示同意，但还是说道：[saystart]对不起，主人，但我必须警告你：我曾受过恶魔的极大虐待。他们是我这个世界所有灾难的罪魁祸首");
         if(gargoyleConfidence() > 70)
         {
            outputText("，我打心底里鄙视他们");
         }
         outputText("。我提供的信息可能不是最公平、最客观的。[sayend]");
         outputText("[pg]你告诉她没关系。她强作镇定，然后开始讲述：[say: 恶魔是几十年前来的。我记不清具体有多久了；在遇到你之前，我大部分时间都被锁链锁着，处于休眠状态，时间变得模糊不清。当他们到来时，就像一股腐化的狂潮……他们从山上席卷而下，横扫田野。他们出其不意地袭击了这个世界，在短时间内……占领了大部分地区。人们几乎无法阻止他们。有些人逃跑了，有些人死了，更多的人被抓走，变成了——变成了性玩具，或——或者更糟……]她的声音渐渐微弱，身体明显在颤抖。那段记忆对她来说一定非常可怕。[say: 对不起，主人。只是……那些腐化的怪物在第一年快结束时来到了这里。我们坚持了那么久……但还是不够。]她沉默下来，羞愧地移开视线。你猜想目前只能从她那里了解到这些了。");
         gargoyleConfidence(10);
         talkToGargoyle(false);
      }
      
      public function historyGo() : void
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,829) == 0)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,829,1);
            talkToGargoyleHistoryA();
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,829) == 1)
         {
            historyOfGargoylesB();
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,829,2);
         }
         else
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,829,3);
            gargoyleHistoryC();
         }
      }
      
      public function giveGargoyleAFunnyOrder() : void
      {
         clearOutput();
         outputText("既然她这么想扮演仆人，你觉得也可以配合一下。你用最具威严的声音厉声说道：[say: 滚过来！]");
         outputText("[pg]值得称赞的是，[garg]只犹豫了一瞬，便趴在地上，肚皮朝上打起滚来，四肢高高举起，就像一只正在接受训练的小狗。你强忍着笑意，弯下腰，快速地揉了揉她的肚子。她的皮肤摸起来凉凉的，而且无比光滑，就像你想象中的大理石雕像一样。似乎很高兴，[garg]又爬起来，在你面前低低地蹲下，等待你的下一个命令。");
         gargoyleStarterMenu();
      }
      
      public function getRevengeForBanishments() : void
      {
         clearOutput();
         outputText("看到[garg]就站在你上方幸灾乐祸，你冷笑一声，猛地发起攻击。你正中她的胸口，把她击退到教堂前方的树神像上。她瘫倒在地，温顺地把目光从你身上移开。趁她还没回过神来，你收拾好你的[armor]，踉踉跄跄地走出了大教堂。");
         gargoyleConfidence(-5);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function gargoylesTheShowNowOnWBNetwork() : void
      {
         clearOutput();
         outputText("你出发去寻找新的天地，从营地朝着一个你以前从未尝试过的方向离开。远离你迄今为止发现的玛瑞斯的部分，这个世界的大部分似乎都是一片贫瘠的荒原");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2299) > 0)
         {
            outputText("，相比之下，甚至连沙漠都显得生机勃勃");
         }
         outputText("。你的旅程很快就开始显得徒劳无功，既没有发现玛瑞斯的新区域，也没有接触到任何居民。你叹了口气，转身返回营地。");
         outputText("[pg]然而，很快你就在远处隐约瞥见了<b>什么东西</b>！你眯起眼睛，遮住阳光，试图辨认地平线上那奇怪的闪光，但它实在太远了。好吧，不管那是什么，肯定值得去查看一下——它可能是任何东西，也许是一座城市，");
         if(get_game().telAdre.isAllowedInto())
         {
            outputText("或者是特尔阿德雷某个较远邻邦的废墟，");
         }
         outputText("甚至可能是某个需要被摧毁的恶魔飞地。你快速检查了一下你的[weapon]，开始向远处的微光长途跋涉。");
         menu();
         addButton(0,"继续",gargoyleMeeting2);
         cheatTime(1);
      }
      
      public function gargoylesDontCountAsSharkWaifus() : void
      {
         clearOutput();
         gargoyleConfidence(-5);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2787,1);
         outputText("你嗤之以鼻，告诉她不要担心——毕竟，你和她在一起又不是背叛伊兹玛。她只是个雕像——说白了就是个玩具。她低下了头，小石像鬼发出一阵颤抖，那可能是一声抽泣。你摇了摇头，转移了话题。");
         returnToCathedral(true);
      }
      
      public function gargoylesAreSlavesYo() : void
      {
         clearOutput();
         gargoyleConfidence(-15);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2787,1);
         outputText("说真的，她除了是个奴隶还能是什么？她只是你想要发泄性欲时的玩具，是你要求举行仪式时的仆人，此外还有点养眼。她甚至不是一个真正的人——不是真的。你非常直白地告诉了她。她没有做出任何回应，至少在口头上没有，但她确实发出了类似抽泣的颤抖，并在她坐的地方蜷缩成一个小球，把脸藏了起来，不让你看到。");
         outputText("[pg]既然你暂时弄坏了石像鬼，你就慢悠悠地回营地去了。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function gargoylesAreGirlfriends() : void
      {
         clearOutput();
         gargoyleConfidence(15);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2787,2);
         outputText("你对着[garg]微笑，揉了揉她的头发。你温和地告诉她，如果她愿意，她也可以做你的女朋友。你觉得多角恋挺适合你的。小石像鬼高兴地倒吸了一口气，跳进你的怀里，双臂环绕着你，紧紧地抱着你，让你几乎喘不过气来。她在你的脖子和脸颊上印下一连串细碎的吻，然后深深地吻住了你的嘴唇。你回吻了她，很快就开心地笑着回应她的拥抱。等她平静下来后，[garg]依偎在你的怀里，脸颊贴着你的胸膛，尾巴和翅膀充满爱意地包裹着你。你在她的额头上轻轻啄了一下，下巴蹭着她的头发，满足于永远这样待下去。");
         outputText("[pg]然而，当你发现[garg]稍微从你身边退开时，你很快就感到惊讶了，尽管她的手臂仍然勾着你的脖子。[say: 主人……如果你想让我做你的女朋友，那么……我们应该——当然，如果你愿意的话，主人——也许……主人，你愿意和我做爱吗？]她脱口而出，突然被自己的唐突吓了一跳。");
         menu();
         if(get_player().hasCock())
         {
            addButton(0,"阴道",gargoyleCoochiiGetsPlowed);
         }
         else
         {
            addButton(1,"假阳具",strapOnGargoyle);
         }
         setExitButton();
      }
      
      public function gargoyleWatersports() : void
      {
         clearOutput();
         outputText("你将你那如雕像般的情人拉向自己，并拥抱了她。当你低头迎上她的目光时，她冰冷的肌肤触感让你起了鸡皮疙瘩。[garg]的眼睛深深地凝视着你，反映出一种比任何诅咒或魔法都要深刻的爱意。她真的爱你，这种感觉温暖了你的心，即使她冰冷的指尖让你的脊背发凉。你们开始接吻，缓慢而温柔地与[garg]唇齿相依。每一个小小的吻都比前一个更深，没过多久，你们的舌头就交织在一起，你们的呻吟和叹息在教堂中回荡。");
         outputText("[pg]你身上的[armor]被一件件脱下。随着你的腰部、肩膀和胸部依次暴露出来，[garg]挠痒、挑逗并抚摸着你[bodytype]的每一寸肌肤；你们互相嬉戏地抓着对方的臀部、" + (garLoli() ? "平坦的胸部" : "坚挺的乳房") + "和屁股。你的[cock]在变大时紧贴着你的盔甲；一旦她把它放出来，你的肉棒就会完全勃起，紧贴着她平坦腹部冰凉的皮肤。你们的吻，曾经温柔而柔软，现在变得具有侵略性；你们俩结束了唇齿相依，开始来回亲吻、轻咬和摩擦对方的耳朵、鼻子、脖子和胸部。");
         outputText("[pg][say: 哦，主人……] [garg]喘息着。[say: 哦，主人，哦，主人，] 她重复着，此刻已经不知道该说什么了。当你把她抱起来走向附近的长椅时，她发出一声高亢的“呀！”并停了下来。当你把她放在长椅上时，她的双腿锁在你的后腰上。她放松了大腿，保持安静，除了一声呜咽，她屏住呼吸等待着你。你满足了她，将你[cock]的头部对准了她" + (garLoli() ? "年轻的" : "") + "小穴颤抖的灰色嘴唇。伴随着一声低沉的咕哝，你将你的男子气概深深地插入了你的石像鬼情人。");
         outputText("[pg][garg]的小穴紧致而又让你感到熟悉，你开始以稳定的节奏抽插，在这位温顺的石像鬼女孩体内深处来回滑动你的肉棒。不过，无论你操她多少次，[garg]下体那种独特的冰凉感总是让你感到惊讶。这种感觉麻痹了你腹股沟的燥热，你发现自己正以相当充沛的精力操弄着她。随着每一次用力的挺进，汗珠在你的皮肤上渗出。[garg]的呻吟声逐渐变成了娇啼，当她高潮时，你感觉到她的手臂和双腿紧紧地缠住了你。你还远未满足，继续保持着节奏。");
         outputText("[pg][say: 主、主、主、主、主——人！哦，主人，再、再多一点，求求你，还要！]她结结巴巴地说着，随着你的[cock]让她陷入疯狂，她渐渐失去了理智。你数着，两次，四次，五次高潮。你背上的皮肤感觉暖和了一些；一缕阳光掠过你们俩。你心想，你们已经做了好一阵子了。");
         outputText("[pg]然而，没有什么是永恒的，双腿间那明显的紧绷感告诉你，轮到你了。你用尽仿佛是最后的力气挺动臀部，将龟头深深埋入[garg]冰凉的下体中，然后射了出来。随着滚烫的精液一股股地灌满你爱人的小穴，你骨盆的肌肉收缩，[balls]也紧紧绷起。[garg]已经语无伦次地胡言乱语了好一会儿，现在她开始喘息，并用一个请求来回应你的精液在她子宫里的感觉。");
         outputText("[say: 嗯嗯……还、还要……]她伴随着每一次呼气呻吟着。[say: 还要……主、主人……]即使你再次吻住她的双唇，她依然向你发出轻哼和娇喘，[say: 还要……]");
         outputText("[pg]你的肉棒现在变软了，但仍然深埋到底，随着你的心跳而跳动，因为过度劳累而酸痛。你觉得你现在已经没有力气再来第二回合了。大教堂曾经回荡着你们做爱时的叫喊、咕哝和抽插声，现在却安静了下来，除了那句因爱而醉的请求。");
         outputText("[pg]然而，你仍然感觉到另一种冲动。虽然在做爱时很容易被遗忘，但你的膀胱在体内膨胀，随着你的肌肉在性交后的疲劳中放松，尿尿的冲动变得越来越难以抗拒。你闭上眼睛，再次深深地吻了[garg]，然后释放自己，尿在石像鬼的子宫里。你的尿道随着温暖的液体流出而膨胀。你感觉到她的手指深深地掐进你的背部，[garg]在接吻时咬了你的嘴唇，她的大腿再次环绕你的臀部紧紧抱住。起初，[garg]的小穴膨胀着，充满了你的精液和尿液，但没过多久，就没有空间容纳你了。你精华的温暖从你肉棒的头部逐渐向下蔓延。当淡黄色、灰白色的尿液从你爱人紧致的" + (garLoli() ? "孩子般的性器官" : "下唇") + "中滴落和飞溅出来时，你注意到它已经冷却了很多，室温的汁液顺着你的大腿和脚踝流下，然后汇聚在你的脚趾之间，在你下方华丽的大理石板上形成一个水坑。");
         outputText("[pg]你最后的水流减慢成涓涓细流，你从石像鬼女孩被操得很爽的小穴中抽出你疲软的肉棒。一只光滑的灰色手伸下来捂住她的阴道，阻止了你的精华从她体内流出。[garg]深深地叹了口气，看着你。[say: 哦，主人，太感谢你了。] 当你轻笑并在她的额头上印下一个吻时，她的眼睛里闪烁着无条件的爱。");
         get_player().orgasm("Dick");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2788,1);
         menu();
         addButton(0,"离开",watersportsLeave).hint("让她休息一会儿，然后返回营地。");
         addButton(1,"留下玩耍",watersportsStay).hint("留下来陪她玩一会儿。");
      }
      
      public function gargoyleWaifu() : void
      {
         clearOutput();
         outputText("你微笑着抚摸她的头发，告诉她，如果她愿意，她当然会是你的" + (garLoli() ? "小" : "") + "爱人。她兴奋地搂住你，把脸埋进你的[chest]里。[say: 我爱你，主人！]她的尾巴缠绕着你，依偎得更紧了，她抬起头给了你一个轻柔的吻，紧接着又是一个更长、更热烈的吻。你们俩就这样拥抱了很久，直到你不得不离开。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2787,2);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function gargoyleStarterMenu() : void
      {
         menu();
         addButton(0,"搞笑命令",giveGargoyleAFunnyOrder);
         addButton(1,"肉欲命令",carnalOrder);
         addButton(2,"交谈",firstGargoyleTalk);
      }
      
      public function gargoyleSprite() : void
      {
         if(garLoli())
         {
            spriteSelect(SpriteDb.get_s_gargoyleLoli());
         }
         else
         {
            spriteSelect(SpriteDb.get_s_gargoyle());
         }
      }
      
      public function gargoyleSexMenu() : void
      {
         var _g:Gargoyle;
         clearOutput();
         get_images().showImage("gargoyle-cathedral");
         outputText("你走近[garg]，告诉" + (garLoli() ? "这个小女孩" : "她") + "你有一些……需要释放的压力。");
         if(gargoyleConfidence() <= 69)
         {
            outputText("石像鬼在你面前深深鞠躬，面无表情。[say: 听从您的吩咐，主人。您希望我怎么做？]");
         }
         else
         {
            outputText("她那红宝石般的眼睛与你对视，灰白大理石般的面容上浮现出" + (garLoli() ? "一抹浅笑" : "迷人的笑容") + "。她一只手臂环住你的腰，将她" + (garLoli() ? "平坦的胸部贴向你，试图可爱地诱惑你" : "丰满且出奇柔软的乳房压在你的胸膛上") + "。[say: 主人希望我怎么做？]");
         }
         menu();
         if(get_player().hasCock())
         {
            addButton(0,"阴道",gargoyleCoochiiGetsPlowed);
            addButton(1,"肛交",gargoyleAnal);
            addButton(2,"乳交" + (garLoli() ? "?" : ""),titFuckTheGargoyle);
            if(get_watersportsEnabled())
            {
               addButton(5,"水上运动",gargoyleWatersports).disableIf(!get_player().hasCock() || get_player().cockThatFits(garLoli() ? 30 : 70) == -1,"这个场景需要你有一根合适的阴茎。");
            }
         }
         else
         {
            addButtonDisabled(0,"阴道交","这个场景需要你有一根阴茎。");
            addButtonDisabled(1,"肛交","这个场景需要你有一根阴茎。");
            addButtonDisabled(2,"乳交","这个场景需要你有一根阴茎。");
         }
         addButton(3,"假阳具",strapOnGargoyle);
         if(get_player().hasVagina())
         {
            addButton(4,"尾巴交",tailFuckGargoyleScene);
         }
         else
         {
            addButtonDisabled(4,"尾巴交","这个场景需要你有一个阴道。");
         }
         _g = this;
         addButton(14,"离开",function():void
         {
            _g.returnToCathedral();
         });
      }
      
      public function gargoyleRevengeAfterBodyRitual() : void
      {
         clearOutput();
         outputText("看到[garg]就站在你上方幸灾乐祸，你冷笑一声，猛地发起攻击。你正中她的胸口，把她击退到教堂前方的树神像上。她瘫倒在地，温顺地把目光从你身上移开。趁她还没回过神来，你收拾好你的[armor]，踉踉跄跄地走出了大教堂。");
         gargoyleConfidence(-5);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function gargoylePet() : void
      {
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2787) == 1)
         {
            outputText("你向她解释说，什么都没有改变。即使你对她很好，也无法改变她的本质，充其量她只能算是一只忠诚的宠物。老实说，她这样自作多情真是个麻烦。");
         }
         else
         {
            outputText("你直截了当地告诉她，即使她没有被束缚在这里，她也永远只能是个奴隶。她甚至不是一个真正的人，只是一件物品；一个漂亮的性玩具和一个有用的工具。只要她能取悦你，你也许会善待她，但也仅此而已。");
         }
         outputText("[pg]这名" + (garLoli() ? "小女孩" : "石像鬼女孩") + "的眼睛睁得大大的，你的话语像刀子一样刺入她的身体，让她那石质的躯体明显地颤抖起来。她没有回应，只是默默地坐在你身边。意识到她暂时派不上用场了，你站起身准备离开，在回营地前快速拍了拍她的头，就在你离开大教堂时，传来了啜泣声。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2787,1);
         gargoyleConfidence(-60);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function gargoyleMeeting2() : void
      {
         clearOutput();
         gargoyleSprite();
         outputText("你终于拉近了与那座奇怪建筑的距离，它的轮廓在前方逐渐清晰。虽然它有一半被常年堆积的沙子和瓦砾掩埋，但你依然能清楚地辨认出由拱顶支撑的高大石墙。墙壁上时不时出现彩色玻璃窗的破碎残骸，还有两扇被彻底摧毁的橡木门，几乎隐藏在一排高大的大理石柱后面，其中许多柱子早已坍塌。在离地很高的地方，你可以看到一对高耸入云的细长塔楼，其中一座似乎遭到了难以想象的猛烈撞击，几乎被完全摧毁，与另一座相比只剩下一个光秃秃的残桩。从屋顶上，一些奇怪的形状正俯视着你——那是按照恶魔、巨龙和其他怪物的形象雕刻的石像。");
         outputText("[pg]你来到了废墟周围的场地上，这里被齐腰高的锻铁栅栏围着。栅栏环绕着建筑，以及一个曾经可能是美丽田园风光的花园。如今这里已经腐败枯萎，树木被砍伐或烧毁，那些只剩枝条的灌木只要一阵大风就会变成风滚草。几十块墓碑勾勒出一条通向一个巨大豁口的道路，那里曾经是宏伟的木门。由于没有看到明显的危险迹象，你小心翼翼地跨过庭院里散落的瓦砾和腐烂的碎片，向里面走去。");
         outputText("[pg]里面相当昏暗，只有从破碎的窗户和裂开的门缝中透出的几缕细微光线提供照明。你能辨认出几十张木制长椅，它们要么被扔在一旁腐烂，要么早已被压碎，这些长椅通向一个石头祭坛和一个巨大的绿色树木雕像，现在上面布满了涂鸦和污垢。祭坛旁边的楼梯向上通往塔楼，向下则通往地下深处的地下墓穴或地牢。");
         outputText("[pg]然而，进入圣所后最吸引你眼球的是沿着墙壁排列的雕像。雕刻精美的灰色石头神像，有各种生物、奇美拉，而在靠近祭坛的地方，则是神明般的存在，它们各自被安置在自己的小壁龛里。不幸的是，大多数雕像都随着大教堂一起被摧毁了，每一个都躺在自己破碎的废墟堆中；有些雕像的整个肢体或其他末端被折断并被掠夺者带走，只留下它们昔日辉煌的影子。");
         get_images().showImage("gargoyle-cathedral");
         outputText("[pg]除了其中一个。在最远、最暗的壁龛里，你看到了一座似乎仍然完好无损的雕像。雕刻的是一个" + (garLoli() ? "小女孩——虽然比起人类小孩，她更像是一只年幼的魅魔" : "女人——好吧，比起人类女性，她更像是一只魅魔") + "。尽管她摆出了一种低矮的、掠食者般的蹲伏姿势，但她正常站立时应该有将近" + (garLoli() ? "四" : "六") + "英尺高，雕刻的头发俏皮地披散在肩膀上。一对从她背部伸出的蝙蝠状翅膀向后卷曲，露出了" + (garLoli() ? "平坦的、孩子般的胸部" : "丰满光滑的双乳，在人类中绝对算得上是DD罩杯") + "。一条带刺的、像狼牙棒一样的尾巴盘绕在她的腿上，而她的腿则与她所在的基座相连。当你站在那里惊叹于" + (garLoli() ? "这座雕像有多么可爱" : "这座雕像的美丽") + "时，你忍不住注意到了几乎隐藏在她身下的那" + (garLoli() ? "微小的" : "") + "、" + (garLoli() ? "未发育的" : "") + "小穴裂口。奇怪的是，它似乎被雕刻成了中空的，如果你愿意的话，你可以" + (garLoli() ? "挤进一根手指" : "轻松地插入几根手指") + "。");
         if(get_player().lib >= 40)
         {
            outputText("也许你可以把它作为一个真人大小的性玩具带在身边？");
         }
         outputText("[pg]然而，你的注意力很快从她的身体转移到了她站立的基座上。一对纯金链条从基座延伸到她" + (garLoli() ? "小巧的" : "") + "手腕上，束缚着雕像。你注意到基座上用螺栓固定了一块牌匾，这是这里其他任何雕像上都没有的特征。你弯下腰，吹掉牌匾上厚厚的灰尘，露出了下面简短的铭文：");
         outputText("[pg][say: 打破我的束缚，让我变得温顺。]");
         outputText("[pg]你觉得你可以打破雕像上的锁链。但谁知道如果你这样做了会发生什么呢？");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1165) == 0)
         {
            outputText("[pg]<b>（“大教堂”已添加到地点菜单中。）</b>[pg]");
         }
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1165,1);
         menu();
         addButton(0,"打破锁链",breakZeChains);
         addButton(1,"不打破",dontBreakThatShit);
      }
      
      public function gargoyleKinkyRituals() : void
      {
         var _g:Gargoyle;
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,828) == 0)
         {
            outputText("你向你的石像鬼提起仪式的话题，却意外地看到她露出了腼腆的笑容。你问她在想什么，对此[garg]" + (garLoli() ? "咯咯笑着" : "轻笑着") + "说，[say: 我一直在想，主人。如果您愿意的话，也许可以……增强……我一直在使用的仪式。]");
            outputText("[pg]你问她到底在想什么。");
            outputText("[pg][say: 上一任主人沉迷于肉体之欢，当她得知我能进行精神仪式时，便设计了符合她口味的堕落版本。如果您允许的话，我相信我能找到一个折中方案——让仪式对我们双方都更愉悦，同时又不会产生腐化的影响。主人有兴趣和我尝试一下吗？]");
         }
         else
         {
            outputText("你走到教堂的祭坛前，[garg]紧随其后。你告诉她你需要她进行一次神圣仪式，但你也希望能找点乐子。她咧嘴一笑，说道：[say: 这是我的荣幸，我的主人。我们该怎么做？]");
         }
         menu();
         addButton(0,"肉体",kinkyBodyRitual);
         addButton(1,"精神",mindRitualPervy);
         if(get_player().hasStatusEffect(StatusEffects.Infested) || get_player().hasStatusEffect(StatusEffects.Exgartuan))
         {
            addButton(2,"放逐",banishPervRitual);
         }
         else
         {
            addButtonDisabled(2,"放逐","驱逐邪恶生物和灵魂的仪式……");
         }
         _g = this;
         addButton(14,"返回",function():void
         {
            _g.returnToCathedral();
         });
      }
      
      public function gargoyleHistoryC() : void
      {
         clearOutput();
         if(get_game().izmaScene.izmaFollower() && get_game().isabellaFollowerScene.isabellaFollower())
         {
            outputText("你让[garg]给你讲讲玛瑞斯世界的事。她静静地思考了一会儿，回答道：[say: 主人，我没有任何在教堂范围外的经验，但我记得上一任主人和她之前的教区居民的话。有……这个世界有广阔的平原和林地，被山脉和湖泊隔开。后两个地方居住着野蛮的野兽、牛头人、牛娘、海葵和鲨鱼人，他们都会撕裂你的血肉或者把你强暴个半死。]");
            outputText("[pg]哇哦，等等。你打断了[garg]，向她解释你的一些情人——甚至伴侣——就是这样的野兽。你跟她讲了一点关于伊兹玛和伊莎贝拉的事，强调她们不仅非常友好，而且很温柔。她们只是普通人");
            if(gargoyleConfidence() > 50)
            {
               outputText("就像她一样");
            }
            outputText("。如果可以的话，你确信当你教导[garg]关于跨物种的宽容和理解时，她一定会羞得满脸通红。她受了教训，在你讲完后点了点头表示理解，经过长时间的停顿后，问道：[say: 如——如果主人真的有很多……女朋友……那……不，这太傻了，当然没有……]");
            outputText("[pg]你摸了摸她的头，鼓励她说出心里的想法。她怯生生地呜咽着：[say: 如果主人有很多女朋友……那我算什么？]");
            outputText("[pg]哦，该死。又来了。你觉得你可以避开这个话题，或者告诉她你的真实想法：她只是你偶然得到的一个奴隶，还是你对她有更多的想法？");
            menu();
            addButton(0,"避开",izmaAndIsabellaDodge);
            addButton(1,"奴隶",gargoylesAreSlavesYo);
            addButton(2,"女朋友",gargoylesAreGirlfriends);
         }
         else if(get_game().marbleScene.marbleFollower())
         {
            outputText("你让[garg]给你讲讲玛瑞斯世界的事。她静静地思考了一会儿，回答道：[say: 主人，我没有任何在教堂范围外的经验，但我记得上一任主人和她之前的教区居民的话。我相信离这里不远有一个湖。除此之外，这个世界有广阔的平原和林地，被一条巨大的山脉隔开——那里住着奇怪的怪物，但最糟糕的是被称为牛头人的野蛮牛形野兽。还有牛娘……我想她们被称为泌乳牛，她们也一样讨厌。]");
            outputText("[pg]你立刻打断了[garg]，解释说那些“野蛮的野兽”中有一个是你的情人，玛布尔，她其实非常温柔。石像鬼惊恐地喘了口气，捂住了嘴。[say: 我很抱歉，主人！我不知道……我听到的都是几年前的故事。我不是那个意思……但是……我——我不知道主人有女朋友，]她可怜巴巴地呜咽着。显然，知道她不是你唯一的女性朋友让这个可怜的小家伙很沮丧。");
            outputText("[pg]好吧。你对此有什么要说的：你和玛布尔不是专属关系，还是[garg]不算，因为她是个雕像？");
            menu();
            addButton(0,"非专属",marbleAintExclusiveBiatch);
            addButton(1,"不算数",gargoyleDoesntCountAsAWaifu);
         }
         else if(get_game().izmaScene.izmaFollower())
         {
            outputText("你让[garg]给你讲讲玛瑞斯世界的事。她静静地思考了一会儿，回答道：[say: 主人，我没有任何在教堂范围外的经验，但我记得上一任主人和她之前的教区居民的话。有……这个世界有广阔的平原和林地，被一条巨大的山脉隔开。如果我没记错的话，离这里不远有一个湖；那里住着一个非常危险的鲨族。]你轻笑一声，告诉[garg]你对此再清楚不过了；事实上，你认为其中一个这样的生物是你的伴侣，你的贝塔。她倒吸了一口凉气，连声道歉。[say: 我很抱歉，主人！我没意识到……我以为……]她沉默了一会儿，然后害羞地说：[say: 我不知道主人有女朋友。]显然，知道她不是你唯一的女性朋友让这个可怜的小家伙很沮丧。");
            outputText("[pg]好吧。你对此有什么要说的：你和伊兹玛不是专属关系，还是她不算，因为她是个雕像？");
            menu();
            addButton(0,"不排他",sharkgirlsArentExclusiveBiatch);
            addButton(1,"不算数",gargoylesDontCountAsSharkWaifus);
         }
         else
         {
            outputText("你让[garg]给你讲讲玛瑞斯世界的事。她静静地想了一会儿，回答道：[say: 主人，我在教堂外没有任何经历，但我记得上一任主人和她之前的教徒们说过的话。这个世界……有广阔的平原和林地，被一条巨大的山脉隔开。如果我没记错的话，离这里不远有一个湖……]她接着给你讲了一些玛瑞斯常见的怪物，不过除了那些经常骚扰教堂的怪物（主要是小恶魔和地精）之外，她对其他怪物的细节知之甚少。你感谢她的讲述，然后转向了另一个话题……");
            gargoyleConfidence(5);
            returnToCathedral(true);
         }
      }
      
      public function gargoyleDoesntCountAsAWaifu() : void
      {
         clearOutput();
         outputText("你嗤之以鼻，告诉她不要担心——毕竟，你和她在一起又不是背叛玛布尔。她只是个雕像——说白了就是个玩具。她低下了头，小石像鬼发出一阵颤抖，那可能是一声抽泣。你摇了摇头，转移了话题。");
         gargoyleConfidence(-5);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2787,1);
         returnToCathedral(true);
      }
      
      public function gargoyleDaughter() : void
      {
         clearOutput();
         var _loc1_:String = "";
         if(get_player().isElder() && garLoli())
         {
            _loc1_ = "孙女";
         }
         else if(get_player().isChild() || get_player().isTeen())
         {
            _loc1_ = "妹妹";
         }
         else
         {
            _loc1_ = "女儿";
         }
         outputText("你考虑了一会儿，最终决定，比起爱人，你更把她当成" + _loc1_ + "，当成家人。");
         outputText("[pg]这个" + (garLoli() ? "小女孩" : "石像鬼") + "眨了眨眼，脸上惊讶的表情清楚地表明她没有料到你的回答。[say: 家人……]她微笑着向你点头，[say: 我喜欢这个。我从来没有过家人。]");
         outputText("当她依偎着你时，你温柔地抚摸着她的头，但很快她就松开了手，带着纠结的表情抬头看着你。[say: 如果主人是家人，我们还能……做、做爱吗？]她尴尬地扭动着身体，你敢肯定，如果她会脸红的话，现在她的脸一定红透了。");
         outputText("[pg]你笑着揉乱了她的头发，告诉她");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2788) == 1)
         {
            outputText("你们可以成为非常“亲密”的家人。");
         }
         else
         {
            outputText("你会考虑的。");
         }
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2787,3);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function gargoyleCuddleAfterBodyRitual() : void
      {
         clearOutput();
         outputText("尽管她给你带来了痛苦，但你知道[garg]是听从你的命令才这么做的——而且见鬼，这只会对你有帮助。在她反应过来之前，你伸手把灰色的石像鬼拉下来，紧紧地贴着她柔软冰冷的嘴唇吻了下去。她发出一声可爱的喘息，但很快就在你的怀抱中放松下来，让你调整她的重心，使她几乎躺在你身上。你心满意足地叹了口气，紧紧地抱住你的石像鬼，把她抱在怀里，直到你恢复过来。当你感觉好些时，你揉了揉她的头发，感谢她……温柔的服侍。如果她会脸红的话，你确信当她用闪烁着火焰的眼睛看着你时，她一定会脸红的。你收拾好你的东西，走出了大教堂。");
         gargoyleConfidence(5);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function gargoyleCoochiiGetsPlowed() : void
      {
         clearOutput();
         var _loc1_:int = get_player().cockThatFits(garLoli() ? 20 : 60);
         if(_loc1_ < 0)
         {
            _loc1_ = get_player().smallestCockIndex();
         }
         outputText("你轻轻地将[garg]推倒仰卧，分开她修长的大理石双腿，让你清楚地看到她那" + (garLoli() ? "看起来像青春期前" : "紧致") + "的小穴。你的手拂过她的大腿，当你的指关节划过她光滑冰冷的肌肤时，她喘息着。你的手指来到她小巧的阴蒂，抚摸着她小小的快感按钮，引得石像鬼发出一声微弱的呻吟。你咧嘴一笑，又弹了一下；[garg]扭动着身体，试图增强或结束这种感觉，你也不确定。你开始更用力地用手指抚摸她的阴蒂，在它周围画着小圈，同时将另一根手指滑入她紧致的通道。");
         outputText("[pg]你的努力得到了回报，[garg]将臀部挺向你的手，呻吟着，[say: 主……主人……求求你……] 还没戏弄够她，你把另一只手放在她平坦的小腹上，开始向上爬，一边挠她痒痒，一边向她丰满的乳房进发。你抓住其中一个，粗暴地捏了一把，同时将手指比之前更深地插入她体内。[say: 主人……] [garg]呜咽着，伸手抚摸你的脸颊。觉得你已经把这个可怜的女孩戏弄得够多了，你准备开始主菜。");
         outputText("[pg]你从[armor]里掏出你的" + get_player().cockDescript(_loc1_) + "，让它耷拉在她的胯部。尴尬的[garg]转过头去，你用肉棒的下侧摩擦她的阴阜，" + (garLoli() ? "把你的先列腺液揉进去" : "吐口水") + "作为额外的润滑剂。你向后靠，将龟头对准石像鬼紧致的裂缝，然后向前压。当你的肉棒压向她时，她发出一声尖锐的喘息，推开她的阴唇，最终滑入她的深处。");
         outputText("[pg]" + (garLoli() ? "这个小女孩的小穴紧得让人发疼，但你还是强行" : "虽然她的入口紧得让人发疼，但她内部的通道很容易就顺着你的肉棒扩张开来，让你滑入") + "越来越多的肉棒，直到你埋入");
         if(get_player().cockArea(_loc1_) > (garLoli() ? 20 : 60))
         {
            outputText("到了她能承受的极限。");
         }
         else
         {
            outputText("直至没根。");
         }
         outputText("现在你已经深深地进入了石像鬼体内，你可以看到她明显在颤抖，因为快感而喘息着。你俯下身，捧起她的脸颊，在她薄薄的嘴唇上印下一吻。她热切地回应着，让你试探的舌头进入与她的舌头交缠。在亲吻中，她用手臂和双腿缠住你，将你紧紧抱在她起伏的胸前。");
         outputText("[pg]你开始在她身上抽插，在她冰凉的通道里进行短促而快速的进出。很快，当你们改变节奏，换成长而用力的抽插时，你们都因为快感而呻吟起来，这使得大教堂里回荡着你的臀部拍打[garg]翘起的屁股的声音。她只能把你抱得更紧，咬着下唇，闭着眼睛，任由你开始真正地猛烈捣弄她。");
         outputText("[pg]让你有些懊恼的是，你感觉到小腹传来一阵熟悉的紧缩感，预示着你即将高潮。你抓紧[garg]的肩膀，最后一次狠狠地撞进她的身体，直抵最深处，射出了第一股精液。你浓稠滚烫的精液在她体内爆发的感觉也让石像鬼达到了高潮：她仰起头，发出一声轻柔的尖叫，小穴紧紧绞住你的肉棒，让你甚至担心它会被夹爆。你把脸埋进她的脖颈，任由她榨干你肉棒里的每一滴精华，直到你的精液几乎要溢出来，在地上汇成一滩。");
         outputText("[pg]之后，你们俩在那里躺了一会儿，直到你的" + get_player().cockDescript(_loc1_) + "软了下来，两人也从剧烈运动和快感中平息了喘息。你又给了她一个吻，从她冰冷的深处抽了出来——多亏了你的激情，那里现在已经温暖了许多——然后把你的老二塞回盔甲里。");
         if(gargoyleConfidence() >= 70)
         {
            outputText("然而，还没等你站起来，[garg]就紧紧抱住你，把你拉倒在她身上，把你的脸埋在她柔软的乳房之间。");
         }
         outputText("[pg][say:谢谢您，主人，]她一边说着，一边用手抚摸着你的[hair]。[say:真是太美妙了。]");
         outputText("[pg]你摸了摸她的头，然后动身返回营地。");
         get_player().orgasm("Dick");
         dynStats(DynStat.Sens(-1));
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2788,1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function gargoyleConfidence(param1:int = 0) : int
      {
         var _loc2_:* = null as IMap;
         if(param1 != 0)
         {
            _loc2_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc2_,826,FlagDict_Impl_.arrayReadInt(_loc2_,826) + param1);
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,826) > 100)
            {
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,826,100);
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,826) < 0)
            {
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,826,0);
            }
         }
         return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,826);
      }
      
      public function gargoyleAppearance() : void
      {
         clearOutput();
         get_images().showImage("gargoyle-cathedral");
         outputText("[garg]是一座灰色的" + (garLoli() ? "小女孩" : "") + "大理石雕像，通过你无法完全理解的魔法，她被赋予了生命。");
         outputText("[pg]她身高大约" + (garLoli() ? "四" : "六") + "英尺，体态纤细，充满少女感。她不着寸缕，似乎毫无羞耻之心，并用她那长满尖刺的尾巴作为武器。她有一张可爱的" + (garLoli() ? "略带棱角的稚气脸庞" : "略带棱角却极具女性魅力的脸庞") + "。她的皮肤和头发呈浅灰色，但她那双纯粹的红宝石般的眼睛却");
         if(gargoyleConfidence() < 70)
         {
            outputText("胆怯地发着光，反映出这只石像鬼顺从和奴性的本质。");
         }
         else
         {
            outputText("眼中闪烁着冷静的火焰，显示出她对你日益增长的自信和热情。");
         }
         outputText("她的皮肤摸起来冰冷光滑，这是她大理石材质的结果，但她却非常柔软，几乎是软绵绵的。[garg]的额头上有一对可爱的小角，背上长着蝙蝠般的翅膀，每隔几秒钟就会轻轻拍打一下，这是你盯着她看时她下意识的动作。她有一条长长的带刺尾巴，卷曲着");
         if(gargoyleConfidence() < 70)
         {
            outputText("胆怯地");
         }
         else
         {
            outputText("调皮地");
         }
         outputText("绕在她的腿上。她有两条正常的人类腿，雕刻成正常的人类脚。");
         outputText("[pg]她有" + (garLoli() ? "平坦光滑的胸部。上面" : "一对大而柔软的D罩杯乳房。上面") + "没有乳头。");
         outputText("[pg]她的双腿之间有一个小巧但容易拉伸的小穴，阴蒂长0." + (garLoli() ? "1" : "2") + "英寸。");
         outputText("[pg]在她柔软的臀瓣之间有一个紧致的屁眼，就在它该在的地方。");
         returnToCathedral(true);
      }
      
      public function gargoyleAnal() : void
      {
         clearOutput();
         outputText("你脱下[armor]，释放出已经开始变硬的阴茎，并命令" + (garLoli() ? "这个小石头女孩" : "她") + "四肢着地。石像鬼紧张地按照你的吩咐，迅速找到一块干净的地板，双手和膝盖撑在地上。你跪在她身后，扒开她紧绷的臀瓣，露出她紧致的缝隙和她小巧后庭的大理石圆环。你咧嘴一笑，用舌头舔湿食指，尽可能地润滑它，然后把它压在她的后门上。");
         outputText("[pg]当你把手指推入[garg]体内时，她发出了一声短促的喘息。" + (garLoli() ? "她的小屁股非常紧，但你还是强行把手指插了进去" : "你出人意料地轻松滑入她体内") + "，陶醉于她体内那<i>冰冷</i>的触感。她里面就像冰一样！你开始加快抽插手指的速度，试图让她稍微暖和一点，为她的肛门做准备。[garg]在你用手指操她屁股时扭动着身体，发出轻柔的呻吟，慢慢地从不适的呻吟变成了愉悦的喘息。");
         outputText("[pg]觉得她已经准备得非常充分了，你握住你的[cock biggest]，将龟头抵在她仍然紧致的屁股上。当你抓住她的臀部并推入她体内时，她的嘴形成了一个代表愉悦的尖锐的“O”形。虽然你已经给她做了充分的润滑，但她的通道仍然紧得令人难以置信，而且里面非常凉，你需要用意志力才能防止你的阴茎萎缩。但只要看一眼她越过肩膀的脸，眼睛因愉悦而翻白，就能让你保持完全勃起的状态继续抽插。");
         if(get_player().cocks[get_player().biggestCockIndex()].cockLength >= (garLoli() ? 30 : 50))
         {
            outputText("[pg]你很清楚这个活生生的雕像在解剖学上并没有什么结构，你继续将越来越多巨大的阴茎推入[garg]" + (garLoli() ? "小巧的" : "") + "后庭，高兴地看着" + (garLoli() ? "这个孩子的" : "她的") + "肚子因为你巨大的阴茎而开始膨胀。然后她的胸部隆起，让她痛苦地喘息" + (garLoli() ? "" : "并抓住她的乳房") + "；但这并没有阻止你。伴随着一次强有力的大幅度抽插，你将自己连根插入[garg]的屁股，并高兴地看着龟头从她的嘴里爆出来，将先列腺液和口水喷得满地都是。可怜的石像鬼发出一声闷响的尖叫，开始无助地挥舞着手臂，试图对现在从她嘴里伸出来的巨大阴茎做<i>点什么</i>。");
            outputText("[pg]你兴致勃勃地开始猛烈地操弄你活生生的肉便器，把她的整个身体当成一个巨大的飞机杯来容纳你巨大的尺寸。认命的[garg]向前瘫倒，抓住你[cock biggest]的龟头，通过她的嘴给你打手枪，同时她的内脏挤奶般地榨取你剩下的肉棒。");
            outputText("[pg]然而，直接贯穿石像鬼的快感实在太过强烈，你伴随着最后一次猛烈的挺进，将自己交给了高潮。你大叫出声，精液喷射穿过她的身体，从她的嘴里喷涌而出，喷洒在她面前的地板上，在她的脸和胸前留下了大团的精液。");
            outputText("[pg]现在你满足了，你把手放在她的屁股上，把她从你巨大的肉棒上推开，让她脸朝下栽进地板上那滩蔓延的精液里。你轻笑一声，拍了拍这个失去知觉的" + (garLoli() ? "孩子" : "石像鬼") + "的头，然后回营地去了。");
         }
         else
         {
            outputText("[pg]你花了几分钟时间在这个" + (garLoli() ? "孩子" : "石像鬼") + "的屁股里进行短促而缓慢的抽插，慢慢地向她体内越来越深的地方探索，直到你插到底");
            if(get_player().balls > 0)
            {
               outputText("，你的蛋蛋拍打着她的屁股");
            }
            outputText("。 [say: 主、主人，] 她喘息着，经历过这一切后胸口剧烈起伏。你调皮地推了她一下，让她脸贴在冰冷的石板地上，同时将你的肉棒从她冰冷的石头内脏中抽出，直到只剩龟头。当你再次猛插进去时，她紧紧地夹住了你，差点让你当场射精。现在轮到你呻吟了，于是你决定赏她屁股一记响亮的巴掌作为奖励。当你打她时，她发出一声小小的尖叫，但她夹得更紧了，她的肠道在你抽出时试图榨干你。当你再次插进去时，你又拍了她一下，得到了同样的结果。你咧嘴一笑，加快了速度，交替着猛干她紧致的屁眼和拍打她紧绷的臀瓣。");
            outputText("[pg]很快，她又开始呻吟了，这次完全是出于快感，完全沉浸在你对她后庭的猛烈攻势中。她带刺的尾巴和翅膀在你周围疯狂地痉挛抽搐，这无疑是她已经屈服于你粗暴的后庭性爱带来的快感的标志。然而，她只坚持了几分钟，你就感觉到她的屁股紧紧地收缩在你的肉棒上，她的肌肉紧绷着，身体准备迎接一次巨大的后庭高潮。看到你的服侍即将让她达到高潮，你感到很满意，于是你放纵自己，很快就感觉到精液涌上肉棒的熟悉感觉。你又坚持了一会儿，直到[garg]发出愉悦的叫声，发出一声回荡在屋顶的尖叫。你也射了，将浓稠的精液射进她的屁股里，这只会为你提供更多的润滑，让你狠狠地操她，直到你射出最后一滴精液。");
            outputText("[pg]完全满足后，你轻轻地将[garg]从你的肉棒上推开。她瘫倒在地板上，失去了知觉，很快就被从她屁股里漏出的一滩精液包围了。你咧嘴一笑，拍了拍她的头，收起你的[armor]，然后回到了营地。");
         }
         get_player().orgasm("Dick");
         dynStats(DynStat.Sens(-1));
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2788,1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function garNameC() : void
      {
         gargoyleConfidence(5);
         clearOutput();
         outputText("你问[garg]她是否终于准备好告诉你她前任主人发生了什么事，以及她之后发生了什么。她犹豫了一下，同意了你的请求。[say:主人是一个黑暗女巫，拥有操纵他人身体的技能，尽管这会给他们带来难以置信的痛苦。" + (garLoli() ? "她似乎特别喜欢在孩子身上做实验。虽然" : "") + "我想……也许她对我的迷恋来自于我的不可改变性，她无法通过魔法随心所欲地改变我的身体。所以她试图改变我的思想，打破我的意志，把我塑造成她想要的样子。]她带着苦涩的笑容补充道，[say:你可以说，是她把我变成了今天这个样子。]");
         outputText("[pg]她继续说道，[say:在主人在这里住了两三年之后——一直都在对靠近的怪物进行实验和操纵——我们最终遇到了一个恶魔。不是小恶魔或低级怪物，而是一个拥有强大力量的真正恶魔。一个自诩为魔法大师的双性魅魔，他从那些在主人玩乐后设法爬走、被折磨得血肉模糊的小恶魔那里听说了主人的技能。他向她发起决斗，赌注是她的魔法和她的身体。在傲慢的驱使下，她接受了。]");
         outputText("[pg][garg]在她的故事中停顿了一下，抽泣着，用手背擦了擦眼睛，尽管她流不出眼泪。[say:我知道会发生什么。我试图告诉她。我见过恶魔能做什么，亲身体验过他们的残忍。但我甚至不是一个人；我的意见并不重要。我们都知道这一点。她甚至把我锁起来，离开了我，这样我就不会干涉。于是她走了出去，充满了傲慢和虚张声势。]");
         outputText("[pg]她继续说道，[say:她根本没有机会。主人被彻底摧毁了，被完全打败了。我最后一次看到她时，她正被抓着头发拖走，又踢又叫，乞求我的帮助。但我无能为力。我无助，我无力。一如既往。]");
         outputText("[pg]她沉默了，发出一声沉重、绝望的叹息。你可以安慰她，她不是一个无助的非人，或者也许你最好责备她情感上的软弱？");
         menu();
         addButton(0,"安慰",comfortGarNameC);
         addButton(1,"责骂",berateGargoyleC);
      }
      
      public function garNameB() : void
      {
         clearOutput();
         outputText("准备好进行一次可能很长的谈话，你问[garg]她是否终于准备好告诉你关于她上一任主人的事了。她沉重地叹了口气，但在一些鼓励下，她开始说道：[say: 主人是……一个不寻常的标本，我想。她非常美丽，非常温柔，]石像鬼几乎是带着怀念的语气说道。");
         outputText("[pg]但她的声音变了，变得冷酷而低语，[say: 而且非常残忍。对她来说，我是一个活生生的玩具，只不过是她想要时满足她欲望的工具。她是个虐待狂，如果我对她的命令有丝毫犹豫，她就会对我使用某种电击魔法。我开始害怕她的每一句话，尤其是她对快感的要求——我想，她从痛苦中获得快感，并且非常享受把它施加在我身上。]");
         outputText("[pg]当她的声音渐渐低落时，你温柔地转移了话题，问她，比如说，她主人的名字，或者是长相。[say:啊。主人是个女人，身高大概不到六英尺。她很美，是一种黑暗的美。就好像她周围总是笼罩着一团风暴云。我记得……我记得她的皮肤最柔软。浓密的金发那么顺滑，那么……]");
         outputText("[pg]你感到困惑，不得不问她是否还在谈论同一个人。[say:哦。是的，我想是的。对不起，主人。我只是……回想起来，我感到很困惑。我清楚地记得那种痛苦，但也有很多快乐。我恨她，用我身上的每一个细胞恨她。但我也爱她。我不怀念她，我也不沉湎于我做她玩具的那些年，但我想，我内心深处确实爱过她。然而，我并不后悔她的离开。]");
         outputText("[pg]这次你不需要提醒[garg]了。[say:她离开了，大概是十年前。有一天，我还在听从主人的命令取悦她，第二天我就被绑在基座上，戴着主人打破来放我自由的锁链。]");
         outputText("[pg]虽然她还没有完全回答你的问题，但你点了点头，继续听下去。");
         gargoyleConfidence(5);
         talkToGargoyle(false);
      }
      
      public function garNameA() : void
      {
         clearOutput();
         outputText("出于对你的石像鬼的好奇，你让[garg]讲讲在你到来之前她的生活。听到这个要求，她紧张地轻笑了一声，羞涩地说：[say: 主人太客气了……我不是什么特别的人……]");
         outputText("[pg]你催促她继续，并补充说如果有必要，你可以把它变成一个命令。她尴尬地扭捏了一会儿，终于说道：[saystart]如果主人坚持的话。我是在离这里不远的一个村庄里被雕刻出来的。大祭司向这片土地上最好的雕刻家订购了我和其他十几个人。在某种程度上，我们是完美的。我们每个人都是独一无二的、完整的，被制造得像你一样像人类");
         if(get_player().get_race() == "human")
         {
            outputText("一样");
         }
         else
         {
            outputText("曾经一样");
         }
         outputText("，主人，甚至更多。我们本应成为他们的守护者、保护者——他们完美的仆人。[sayend]");
         outputText("[pg][say: 当恶魔来临时……我活了下来，其他人没有。在那之后，我独自在这里待了一段时间。然后，大概十年前，上一任主人来了。她来这里是为了躲避一大群恶魔；她发现的是我，孤身一人。]");
         outputText("[pg]你让她讲讲关于[say: 上一任主人]的事。她犹豫了一下，同意了：[say: 主人来这里寻求庇护。由于我被束缚，我不得不保护大教堂——以及她——免受追捕她的小恶魔的伤害。然而，她是一位有些本事的法师，当我告诉她我的束缚时，她操纵了控制我的魔法，迫使我服侍她。正是同样的魔法让我被束缚来服侍你，主人。]");
         if(gargoyleConfidence() > 69)
         {
            outputText("她继续说道，[say:不过就算我没有被强迫，我还是会服侍您的，]她调皮地眨了眨眼。");
         }
         outputText("[pg][saystart]然而，当上一任主人找到我时，我并不正常。恶魔的到来在我的脑海中仍然历历在目；他们虐待的伤疤即使在现在也沉重地压在我的心头，但当她束缚我时，这些伤疤是毁灭性的。我想情况可能会更糟——我可能会被恶魔或真正的虐待狂带走，但我和她在一起的时间几乎摧毁了我的心智。");
         if(gargoyleConfidence() <= 69)
         {
            outputText("[pg]在她对我做了那些事之后，我无法享受性爱；仅仅是想到它就让我不寒而栗。[sayend]");
         }
         else
         {
            outputText("在她对我做了那些事之后，我从未想过我还能再次享受性爱。[sayend] 带着充满爱意的微笑，[garg]握住你的手，在她的脸颊上蹭了蹭。[say: 但为了你，主人，我想我可以破例。]");
         }
         outputText("[pg]你忍不住问……她的上一任主人到底做了什么那么可怕的事，让她在第一次见到你时那么害怕你，现在又对最亲密的接触感到恐惧？");
         if(gargoyleConfidence() <= 69)
         {
            outputText("[say:对不起，主人，我不能……一想到这个就太痛苦了。]");
         }
         else
         {
            outputText("[say:对不起，主人。我只是……现在不想谈论这个。改天再问我吧。]");
         }
         outputText("[pg]你考虑继续追问，但想起你离开营地已经有一段时间了。你决定下次再问她，然后向石像鬼告辞。");
         gargoyleConfidence(10);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function garLoli() : Boolean
      {
         if(get_npcSettings().gargoyleChild)
         {
            return get_allowChild();
         }
         return false;
      }
      
      public function firstGargoyleTalk() : void
      {
         clearOutput();
         get_images().showImage("gargoyle-cathedral");
         outputText("你决定暂时不给[garg]下达命令。相反，你扶正了附近一条倒塌的长椅，在蹲着的石像鬼对面坐下，用同样强烈的目光回敬她的注视。");
         outputText("[pg][say: 你为什么被锁起来？]你终于开口问道，瞥了一眼地上破碎的锁链。");
         outputText("[pg][say: 主人找到了新玩具，很快就对我厌倦了。不过，她不想我被偷走。]");
         outputText("[pg][say: 你的上一任主人？]");
         outputText("[pg][say: 没错。]");
         outputText("[pg][say: 她……是谁？]");
         outputText("[pg][say: 她是……主人。]");
         if(get_silly())
         {
            outputText("[pg][say: 你知道“主人”是男性的称呼，对吧？][pg][say: 确实。主人也是男的。][pg][say: 但你刚才……算了。]");
         }
         outputText("[pg][say: 好吧，]你叹了口气。显然她不想告诉你，你也不想现在就追问。[say: 既然如此，这里发生了什么事？]");
         outputText("[pg]突然，[garg]移开了视线，似乎感到羞愧。[say: 即使是现在仍在蹂躏玛瑞斯的恶魔之灾，也在这里造成了破坏。一个已经不复存在的小镇的人们相信他们在玛莱的庇护下是安全的。受到保护。他们的信仰……错付了。]");
         outputText("[pg]看来导致大教堂毁灭的事件在[garg]的心中留下了沉重的阴影。你打算怎么做？");
         menu();
         addButton(0,"斥责",berateTheGargoyle);
         addButton(1,"安慰",reassureTheGargoyle);
      }
      
      public function encourageGargoyleWaifuToDoSomething() : void
      {
         clearOutput();
         gargoyleConfidence(10);
         outputText("你摸了摸[garg]的头，告诉她这是个好主意。她发出一声开心的尖叫，立刻飞到一堆废墟旁开始清理。不知不觉中，这只小石像鬼已经干得热火朝天，一边吹着轻快的口哨，一边开始修复一些明显的损坏。看着她如此投入，你忍不住笑了。你走过去，开始给她帮忙。");
         outputText("[pg]不到一个小时，你们俩就清理掉了大教堂里相当一部分的废墟，[garg]甚至还成功地把一个枝形吊灯重新挂回了椽子上。你筋疲力尽地向这只快乐的小石像鬼道别，然后回到了营地。");
         get_player().changeFatigue(10);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function dontFreakOutAfterBanishment() : void
      {
         clearOutput();
         outputText("你只是静静地躺着，试图从[garg]“温柔的服侍”中恢复过来。几分钟后，你喘过气来，收拾好你的东西，一言不发地走出了大教堂。该死，你全身酸痛。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function dontBreakThatShit() : void
      {
         clearOutput();
         outputText("哦，不。不行。没门。绝对不可能。你才不会上当呢！不，先生。只要你砍断那些锁链，它可能就会活过来，然后" + (garLoli() ? "那个看起来很甜美的女孩就会变得很凶恶，试图杀掉" : "试图杀掉——或者强暴——") + "你。你觉得自己很聪明，转过身走出了大教堂——现在这里没什么可看的了。");
         outputText("[pg]如果你改变主意了，随时可以回来。这座雕像已经在这里几十年了，它可以再等一会儿。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function cuddleForBanishments() : void
      {
         clearOutput();
         outputText("尽管她给你带来了痛苦，但你知道[garg]是奉你的命令这么做的——而且见鬼，这只会对你有帮助。在她反应过来之前，你伸出手把这只灰色的石像鬼拉到你的腿上，搂住她的腰，在她的后颈上飞快地亲吻了一下。她咯咯地笑着，用尾巴缠住你，轻轻地挤压你，同时在你的胸口蹭来蹭去。你保持着这个姿势几分钟，拥抱着这只可爱的石像鬼，但最终你知道你需要回营地看看情况。当你感觉好些了，你揉了揉她的头发，感谢她……温柔的服侍。如果她会脸红的话，你确信当她用闪烁着火光的眼睛看着你时，她一定会脸红的。你收拾好你的东西，走出了大教堂。");
         gargoyleConfidence(5);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function comfortGargoyleDumbness() : void
      {
         clearOutput();
         gargoyleConfidence(10);
         outputText("你叹了口气，伸手去拉[garg]；");
         if(gargoyleConfidence() < 50)
         {
            outputText("她退缩了，但");
         }
         outputText("你捧起她的脸颊，让她转过身来面对你。如果她能流泪，你确信眼泪一定会顺着她的脸颊流下来。你给了她一个最让人安心的微笑，然后凑上前去在她的额头上轻轻吻了一下。她倒吸了一口凉气，但还没等你反应过来，她就已经跳到了你的腿上，把脸埋在你的胸前，紧紧地抱住你，仿佛那是她生命中最重要的东西。你伸出双臂环抱住她，在她哭泣的时候紧紧地抱着她，在接下来的几分钟里，你要么轻声安慰她，要么抚摸她的背和头发。最终，她平静了下来。[garg]非常害羞地回吻了你。[say: 对不起，主人，]她蜷缩在你身边，轻声说道。[say: 我本应该足够强大来保护我的人民。我知道。他们都被拖进某个邪恶的肉欲深渊，这都是我的错。我只是……]你打断了她，告诉她不，这不是她的错。她无能为力。她试图给你一个勇敢的微笑，然后说：[say: 我知道。我们……能谈点别的吗，主人？]");
         talkToGargoyle(false);
      }
      
      public function comfortGargoyle() : void
      {
         clearOutput();
         outputText("你抱起[garg]，紧紧地拥抱她，告诉她一切都会好起来的，你会陪着她。她发出一声快乐的、少女般的尖叫，回抱住你，迅速用双腿盘住你的腰，在你的脸颊上印下一个吻。你重新坐下，让她坐在你的腿上，揉了揉她的头发。她咧嘴笑着，把你抱得更紧了，直到你几乎喘不过气来。");
         outputText("[pg][say: 谢谢你，主人，]她在你耳边低语，给了你一个小小的吻。[say: 我也会一直陪着你的。我发誓。]");
         outputText("[pg]你又陪了你的小石像鬼几分钟，摸摸她的头，抱抱她。但是，最终，你知道是时候回营地了。你道了别，走向门口。");
         outputText("[pg]令你惊讶的是，[garg]跟了上来，跑着追上了你。她牵起你的手，在你们走的时候用一只翅膀裹住你，紧紧地抱着你，直到你们走出大门，来到空地上。但很快，你看到[garg]放慢了脚步，皱起了眉头——她正在接近她边界的边缘。你们俩在大教堂周围的熟铁栅栏处停了下来，面对面站着。");
         outputText("[pg]你意识到这是你第一次看到她离开圣所，于是骄傲地在门口给了她一个吻。当你们分开时，她羞涩地嘱咐你回去的路上要小心，并说她会在这里等你回来。");
         gargoyleConfidence(10);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function comfortGarNameC() : void
      {
         clearOutput();
         outputText("你把[garg]拉到你的腿上，用手抚摸着她的头发。你告诉她她错了——大错特错。她是一个人，她并不无助。她绝对不是。");
         outputText("[pg]小石像鬼蜷缩在你的腿上，给了你一个害羞的微笑。[say:谢谢你，主人。我-我-我……]她结结巴巴地说，明显在发抖。[say:我希望你是对的，主人。我真的希望。但是，我不是。我不是一个人，我没有自由意志。这是一个美好的梦，但是……]");
         outputText("[pg]你打断了她的话。你命令她停止这样想，告诉她你从未见过比她更像人类的人。她确实有自由意志——也许有一天，她能找回它。在那之前，你保证你永远不会给她下达她不想执行的命令，你永远不会像她前任主人那样抛弃她。");
         outputText("[pg]她虚弱地笑了笑，把头靠在你的胸前。[say:如您所愿，主人，]她说着，陷入了沉默。你在那里坐了很长时间，抚摸着石像鬼柔软的头发，希望你给她留下了深刻的印象。但是，最终，你知道你必须离开。你在[garg]的额头上轻轻吻了一下，告诉她你不在的时候想做什么就做什么。");
         outputText("[pg][say:想——想做什么就做什-什么？]她结结巴巴地说，感到困惑。你肯定了自己，但她反应迟缓。[say:我只是……我只想和主人在一起。我……主人，请不要走！就，就一会儿。求求你了？这就是我想要的，胜过一切。]");
         outputText("[pg]叹了口气，你拍了拍[garg]的头，告诉她你很乐意再多待一会儿。她喜笑颜开，问你想做什么。");
         gargoyleConfidence(15);
         returnToCathedral(true);
      }
      
      public function cathedralTalks() : void
      {
         var _loc1_:* = null as IMap;
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,830) == 0)
         {
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,830,FlagDict_Impl_.arrayReadInt(_loc1_,830) + 1);
            talkCathedralA();
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,830) == 1)
         {
            cathedralBTalk();
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,830,2);
         }
         else
         {
            cathedralC();
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,830,3);
         }
      }
      
      public function cathedralC() : void
      {
         clearOutput();
         outputText("当你和[garg]坐下来交谈时，你想起了你们初次见面时她说过的话，那表明即使你要求她离开，她也不能——或者说不愿意——离开大教堂。你向她询问了这件事。");
         outputText("[pg][say: 主人，][garg]说着，现在直视着你的眼睛，[saystart]大教堂是我的家，我唯一知道的家。即使我能离开，我也不想离开");
         if(gargoyleConfidence() > 69)
         {
            outputText("除非是和你在一起，也就是说");
         }
         outputText("。但我被束缚在这个地方了，主人。即使我想离开，我也无法离开。我的创造者对他们的造物很警惕，所以选择把我束缚在这里；他们认为，如果我有一天反叛了，只要被限制在大教堂内，我就不会造成太大的伤害。[sayend]");
         outputText("[pg]你问她其他的石像鬼有没有反叛过。这让她迅速移开视线，藏起了脸。[say: 有，]她低语道。[say: 有一个。当恶魔来袭时，一个石像鬼看到了摆脱束缚的机会，当所有的教区居民都聚集在里面躲避攻击时，他推开了大门。他们无力抵抗恶魔，无论我们其他人多么努力地保护他们……]");
         outputText("[pg][say: 而且，]她呜咽着，[say: 我也无能为力。这个神圣的地方变成了一个肉欲的深坑。我们被强暴，强暴，再强暴，直到连恶魔都满足了。然后他们把村民拖走，摧毁了石像鬼。]");
         outputText("[pg]除了她，你很快指出了这一点。[say: 除了我，]她附和道。[say: 其中一个恶魔" + (garLoli() ? "似乎喜欢小孩子" : "看上了我") + "，想把我当宠物养。我想我很幸运；祭司们施加在我身上的束缚使我免于被拖走并被虐待到世界末日……至少，没有被他虐待。如果没有这些束缚，我永远也不会遇到你，]她甜甜地补充道，再次满怀期待地抬头看着你。你能看到她眼中的悲伤，但也有希望。");
         outputText("[pg]你可以安慰这只小石像鬼，或者你可以提醒她失败的后果。");
         menu();
         addButton(0,"责骂",berateDatGargoyle4SomeSavin);
         addButton(1,"安慰",comfortGargoyle);
      }
      
      public function cathedralBTalk() : void
      {
         clearOutput();
         outputText("你让[garg]多给你讲讲把大教堂当作家园的那个宗教。令人高兴的是，这似乎是小石像鬼很感兴趣的话题，她急切地解释道：[say: 他们崇拜着众神——那些在动物" + (get_noFur() ? "人" : "变形者") + "崛起之前，在恶魔到来很久之前就居住在这个世界上的存在。玛莱是主神，]她说着，向圣所前方的树形圣像点了点头。[say: 她教导人们改善生活的仪式，净化身心的仪式，甚至帮助他们学习生活的基础知识。这些神明是创造者，他们赋予了世界上的动物智慧，使之与人类相仿。正因如此，他们受到了崇拜……在某些情况下，还被模仿。]");
         outputText("[pg]你问她是不是指她自己，她点了点头。[say: 教会的高级祭司创造了我和许多其他人来做他们的保护者。我们是由石头雕刻而成，并被魔法——强大的魔法赋予了生命。我们是完美的仆人和守卫……而现在，只剩下我一个了。]");
         outputText("[pg]她陷入了深深的、忧郁的沉默。你很快试图转移话题。");
         gargoyleConfidence(10);
         talkToGargoyle(false);
      }
      
      public function carnalOrder() : void
      {
         clearOutput();
         outputText("好吧，好吧。[garg]似乎愿意服从你下达的任何命令，无论多么肉欲，而且你刚才也不禁注意到了她那相当<i>诱人</i>的" + (garLoli() ? "小身板" : "特征") + "。你坏笑着，命令你的新石像鬼用手指自慰。");
         outputText("[pg][say: 主人让我想起了上一任主人，]她平静地，甚至有些冷漠地说道，但毫不犹豫地一屁股坐在紧绷的臀部上，为你张开她" + (garLoli() ? "纤细的" : "") + "双腿。" + (garLoli() ? "她那未发育的小穴张开，她用一根手指抵住那小小的裂缝。她目不转睛地看着你，开始揉搓自己" : "她轻松地将三根手指滑入裂缝，裂缝微微撑开以容纳手指的插入。她目不转睛地看着你，开始快速地抽插手指") + "，自慰的节奏几乎与你");
         if(get_player().cor < 40)
         {
            outputText("慌乱的");
         }
         else
         {
            outputText("兴奋的");
         }
         outputText("心跳同步。" + (garLoli() ? "这个长着翅膀的小女孩" : "她") + "目不转睛地盯着你，一边" + (garLoli() ? "揉搓" : "用手指抠弄") + "自己的样子相当令人不安，你很快就命令她停下来。她立刻照做了，虽然你觉得她可能叹了口气，然后低低地蹲下，等待你的下一个命令。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2788,1);
         gargoyleStarterMenu();
      }
      
      public function breakZeChains() : void
      {
         clearOutput();
         get_images().showImage("gargoyle-cathedral");
         outputText("你将你的[weapon]举过头顶，向锁链砸去。");
         if(get_player().get_weapon().isUnarmed())
         {
            outputText("哎哟！该死，真疼！你到底在想什么！？不过，看来你确实取得了成果……");
         }
         outputText("一声震耳欲聋的<i>铿锵！</i>声在教堂中回荡，金色的碎片四处飞溅。你向后退缩，用手臂护住脸，以防链条破碎时产生的惊人爆炸力。当尘土落定，你小心翼翼地放下手臂，清楚地看到了在你面前躺着——或者说，跪着——的东西：");
         outputText("[pg]那只" + (garLoli() ? "年轻的" : "") + "石像鬼已经从她的基座上走下来，现在像一个恳求者在国王面前一样跪着，额头贴近地面，重量压在她的石头指关节上，即使她巨大的翼展在她身后展开，她那像狼牙棒一样的尾巴在她身后快速地摆动。慢慢地，石像鬼抬起头注视着你，她现在红宝石般的眼睛盯着你的眼睛。她光滑的，" + (garLoli() ? "平坦的胸部起伏着" : "没有乳头的乳房起伏着") + "，曾经是石头的头发一缕缕地向前垂下，遮住了她" + (garLoli() ? "孩子般的" : "光滑、棱角分明的") + "脸。她薄薄的灰色嘴唇慢慢地卷起一个微小的" + (garLoli() ? "" : "，性感的") + "微笑，她用刚好能听到的声音说……");
         outputText("[pg][say: 主人。我的……主人。]");
         outputText("[pg]你回头看了一眼，但这里没有其他人。她一定是在说你！");
         outputText("[pg][say: 主人，您想让这个仆人做什么？]她问道，满怀期待地抬头看着你。");
         outputText("[pg]你仍然很谨慎，问她到底是什么。显然她不是普通的雕像！");
         outputText("[pg][say: 我是您卑微的仆人，主人。您的工具。您的玩物。您的玩具。只要您吩咐，我就会服从。]她似乎停顿了一下，用一种毫无感情的耳语补充道，[say: 如果主人愿意，这个仆人很荣幸能取悦主人。]");
         outputText("[pg]这带来的问题比回答的还要多。现在慢慢来，你问她的名字。");
         outputText("[pg][say: 我……我是……我就是我。主人想叫我什么？]");
         menu();
         addButton(0,"继续",nameZeGargoyle);
      }
      
      public function bodyRitual() : void
      {
         clearOutput();
         outputText("你告诉[garg]，你希望能逆转一些影响你身体的腐化。她庄重地点了点头，把你带到祭坛附近的一个侧边壁龛，并指示你张开双臂和双腿。你犹豫地照做了，[garg]从地板和天花板上拉出带有粗糙环扣的皮带。还没等你反应过来，她就绑住了你的四肢，让你呈大字型贴在冰冷的石墙上。");
         outputText("[pg][say:痛苦带来纯洁，][garg]说道，声音小得你几乎听不见。[say:准备好，主人，]她补充道。当你听到身后传来鞭子的破空声时，你的心几乎漏跳了一拍。哦，该死，这肯定会很痛——啪！白热化的剧痛贯穿你的身体，让你眼冒金星，对着墙壁惨叫出声。你能感觉到牛皮鞭在你背上留下了一道火辣辣的血痕，在下一声“啪！”之前无情地抽痛着。她又抽了你一鞭，巨大的力道让你猛地向前撞在束缚带上。");
         outputText("[pg]在你粗重、痛苦的喘息声中，你勉强能听到[garg]在吟唱：[say:痛苦带来纯洁……啪！折磨带来启迪……啪！苦难带来神圣……啪！]最后一鞭让你呻吟出声，喘不过气来，瘫软在束缚带中。不过，不知为何，你确实感觉……更纯净了？就像心里的一块石头落地了。而且你知道，在那之后你的皮会变得更厚！[garg]安静而克制地解开了你的束缚，你踉跄着倒进她等候的怀抱中。她扶你走到祭坛边躺下，让你在经受折磨后休息一下。她站在你身旁，看着你大口喘息。你想你可以报复她的残暴——或者你可以仁慈一点。你要怎么做？");
         dynStats(DynStat.Lib(-0.5),DynStat.Sens(-2));
         get_player().takeDamage(Math.round(get_player().maxHP() / 2));
         menu();
         addButton(0,"什么都不做",noReactionToBodyRitual);
         addButton(1,"依偎",gargoyleCuddleAfterBodyRitual);
         addButton(2,"报复",gargoyleRevengeAfterBodyRitual);
      }
      
      public function berateTheGargoyle() : void
      {
         clearOutput();
         gargoyleConfidence(-10);
         get_images().showImage("gargoyle-cathedral");
         outputText("一股怒火在你心中沸腾。你站起身，紧握双拳，告诉她你是英格纳姆的勇者[name]。你的职责和她曾经的职责一样，都是保护自己的家园。而她失败了。她让所有人都失望了。你告诉她，她是个毫无价值、令人作呕的失败者。");
         outputText("[pg][garg]退缩了，畏缩着躲避你，以为你会打她。然而，你只是朝地上吐了口唾沫，转身走向出口。你头也不回地大喊，让她留在这里，在她的失败中沉沦，直到你屈尊降贵地使用她。");
         outputText("[pg]你带着满腹的鄙夷冲出了大教堂。从你身后，你不太确定，但也许你听到了[say: 就算我想，我也离不开这里。]");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function berateGargoyleForBeingDumb() : void
      {
         clearOutput();
         gargoyleConfidence(-5);
         outputText("[pg]你试图毫不客气地拍打[garg]的头，并责备她竟敢拒绝向你提供信息。然而，你严厉的声音只会让她公开地抽泣，并在你打到她之前从你身边退缩。你沮丧地叹了口气，在不得不听仆人多哭一秒钟之前冲出了大教堂。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function berateGargoyleC() : void
      {
         clearOutput();
         outputText("你大笑起来，准确地告诉[garg]你对她的看法——对于一块会说话的石头来说，她太他妈的健谈了，对每件事都太他妈的情绪化了。她静静地坐在那里，听着你的每一句话。她甚至时不时地点头，同意你的观点！你不确定这是否让你更生气了。");
         outputText("[pg]当你解释完她到底有什么毛病后，你向后靠了靠，问她打算怎么做。");
         outputText("[pg][say:少一点情绪化，主人，]她尽可能平静地说。[say:我不会再沉湎于过去了，主人。我活着只是为了服侍您，当然。我还能做什么呢？求您了，主人，给我下达您想要的任何命令。我热切地等待着它们，毫不犹豫，我的主人。]");
         outputText("[pg]你赞赏地点了点头，思考着该吩咐她做些什么。");
         gargoyleConfidence(-10);
         returnToCathedral(true);
      }
      
      public function berateDatGargoyle4SomeSavin() : void
      {
         clearOutput();
         outputText("对。因为成为你的活体脚凳，完全值得她认识的所有人都被强暴到失去理智。你狠狠地拍了[garg]一下，提醒她现在的行为有多么愚蠢。她退缩了，在你站起身走向门口时躲避着你。你头也不回地告诉她，你很高兴她被束缚在这里——这样她就不会搞砸事情，把你也害死了。");
         gargoyleConfidence(-10);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function banishmentGargoyleRitual() : void
      {
         clearOutput();
         outputText("谈到[garg]的仪式，你解释说你似乎沾染了");
         if(get_player().hasStatusEffect(StatusEffects.Exgartuan))
         {
            outputText("一个寄生虫");
         }
         else
         {
            outputText("一些寄生虫");
         }
         outputText("在你的旅行中，并且想要摆脱它们。她让你脱光衣服，靠在祭坛上。[say:不幸的是，既然你被入侵了，那么这也是一个非常……侵入性的仪式。]你点头同意——你真的想把");
         if(get_player().hasStatusEffect(StatusEffects.Exgartuan))
         {
            outputText("这个混蛋");
         }
         else
         {
            outputText("这些混蛋");
         }
         outputText("离开你的身体。");
         outputText("[pg]从祭坛下方，[garg]拿出了一个看起来像完美圆柱形假阳具的东西，上面覆盖着几十个闪烁着微弱蓝光的暗色符文。她慢慢地绕到你身后，跪在你的[butt]后面。[say: 深呼吸，主人，放松自己。这样会好受些。]");
         outputText("[pg]你尽力放松自己，但只要你稍微放松一点，你就会感觉到一股强烈的、侵入性的压力压在你的[asshole]上。你深吸一口气，咬紧牙关，强迫自己放松。光滑的圣杖滑了进去，不可阻挡地挤进你的肛门。你感觉到一种灼烧感开始蔓延全身，像小火苗一样从你的肛门向外蔓延。");
         outputText("[pg][say: 别担心，主人，] [garg]说道");
         if(gargoyleConfidence() >= 50)
         {
            outputText("安慰地，用她空闲的手抚摸你的大腿");
         }
         outputText("。[say:痛苦是必要的。一切都会好起来的。]");
         outputText("[pg]尽管如此，当神圣的灼烧感蔓延全身，渗入你脆弱的生殖器和敏感的胸部时，你还是忍不住痛苦地嘶嘶作响。");
         if(get_player().hasStatusEffect(StatusEffects.Exgartuan))
         {
            outputText("恶魔的声音从你体内轰鸣响起：[say:喂！这他妈的是什么鬼！？你在干什么？快他妈停下，你这个忘恩负义的家伙！]");
         }
         else
         {
            outputText("然而，令人欣慰的是，你能感觉到体内的寄生物在蠕动扭曲，拼命地想要逃跑。");
         }
         outputText("[pg]突然，塞入你[asshole]的圣杖发出一声巨大的嘶嘶声，然后抽了出来。你气喘吁吁地瘫倒在地，紧紧捂着肚子。一切都结束了，你感到……有些空虚。那个");
         if(get_player().hasStatusEffect(StatusEffects.Exgartuan))
         {
            outputText("你体内的生物已经");
         }
         else
         {
            outputText("你体内的那些生物已经");
         }
         outputText("被法杖吸收并净化了，随后[garg]把法杖扔出了窗外。希望她还有更多这种法杖，以防你以后被");
         if(get_player().hasStatusEffect(StatusEffects.Exgartuan))
         {
            outputText("附身");
         }
         else
         {
            outputText("寄生");
         }
         outputText("了。");
         outputText("[pg]你还在为刚才的折磨喘着粗气，这时你注意到[garg]正站在你面前，微笑着。你可以因为她给你带来的痛苦而对她发火，也可以感谢她的帮助。");
         if(get_player().hasStatusEffect(StatusEffects.Exgartuan))
         {
            get_player().removeStatusEffect(StatusEffects.Exgartuan);
         }
         else
         {
            get_player().removeStatusEffect(StatusEffects.Infested);
         }
         get_player().takeDamage(Math.round(get_player().maxHP() / 3));
         get_player().changeFatigue(10);
         addButton(0,"什么都不做",dontFreakOutAfterBanishment);
         addButton(1,"拥抱",cuddleForBanishments);
         addButton(2,"复仇",getRevengeForBanishments);
      }
      
      public function banishPervRitual() : void
      {
         clearOutput();
         outputText("你向[garg]解释说，你似乎在旅途中染上了");
         if(get_player().hasStatusEffect(StatusEffects.Exgartuan))
         {
            outputText("一个寄生虫");
         }
         else
         {
            outputText("一些寄生虫");
         }
         outputText("，你已经厌倦了");
         if(get_player().hasStatusEffect(StatusEffects.Exgartuan))
         {
            outputText("它");
         }
         else
         {
            outputText("它们");
         }
         outputText("。她理解地点了点头，让你脱掉衣服。当你这样做时，她潜入祭坛下方，带着一根覆盖着蓝色符文的银色棒子重新出现，棒子嵌在看起来像皮带的东西里。[garg]穿上皮带，当棒子的内端进入她体内时，她的嘴唇里漏出了一声轻微的喘息。");
         outputText("[pg]她试探性地抚摸了几下假阳具的轴，满意地说，[say: 我已经调低了符文的力量，所以它不会让你那么疼……虽然它会比平时花更长的时间。我建议你润滑它，主人。]微笑着，" + (garLoli() ? "孩子" : "她") + "坐在祭坛上，向你展示她的银色“鸡巴”。你跪下来，把脸滑进她张开的双腿之间，快速舔了一下棒子。它非常光滑，而且很冷，就像它的佩戴者一样，但你的舌头离开时，一股温暖的刺痛感蔓延开来——不是疼痛，更像是麻木。你把棒子含在嘴里，用舌头舔过它的长度，把脸贴在上面，像吹箫一样吹它，同时用你的唾液把它弄得湿透。你才做了一分钟，就注意到[garg]正在微微挺动臀部，小声呻吟，显然从这种感觉中得到了不少乐趣。也许她能通过它感觉到，就像一根真正的鸡巴？你咧嘴笑着，加倍努力地给她口交。");
         outputText("[pg][say: 够了，主人，]她喘息着，把你推开。她大口喘着气，拉着你的手，让你靠在祭坛上。你现在整个嘴巴都麻木了，因为神圣的棒子鸡巴散发出的奇怪感觉而刺痛。[garg]滑到你身后，把一只凉爽柔软的手放在你的[hips]上，准备插入。你紧紧抓住祭坛的边缘，尽力放松你的括约肌，因为你开始感觉到后门传来刺痛的压力。");
         if(get_player().ass.analWetness > 0)
         {
            outputText("她轻松地滑入，将她那令人刺痛的圣杖滑入你体内，直到她的臀部紧贴着你的[butt]");
         }
         else
         {
            outputText("她缓慢但坚定地将圣杖哄入你的屁眼，对你进行漫长而缓慢的抽插，直到她最终插到底");
         }
         outputText("。");
         outputText("[pg]随着她的圣杖牢牢地插在你的体内，[garg]把手放在你的[hips]上借力，开始再次向外拔出，在你的直肠里留下了一阵火热、强烈的酥麻感。她猛地插了进来，这次比你预想的要快得多，当她的臀部撞上你的臀部时，你忍不住喘息呻吟起来。");
         if(!get_player().hasStatusEffect(StatusEffects.Exgartuan))
         {
            outputText("你能感觉到她的肉棒撞击着你的前列腺，并且随着她的肉棒挤压它们，那团蠕动的蠕虫开始恐慌，显然给这些生物带来了巨大的痛苦，你因此而颤抖。");
         }
         outputText("[garg]开始认真地操你，用穿戴式假阳具猛烈地撞击你的[asshole]，直到你们俩都气喘吁吁，几乎被快感淹没。");
         if(get_player().hasStatusEffect(StatusEffects.Exgartuan))
         {
            outputText("你能听到脑海中埃克斯加图安恶魔般的声音，他在大喊大叫和咒骂，因为他正迅速从你的身体中被抽离，并被封印在你体内的圣杖中。");
         }
         if(get_player().hasCock())
         {
            outputText("[pg][garg]突然松开了你的臀部，将她柔软的双乳贴在你汗津津的背上，用冰冷的手抓住了你的[cock biggest]。当她开始给你打飞机时，你发出了一声轻喘，她快速地套弄着你的肉棒，同时继续猛干你的屁股。在双重刺激下，你感觉到一股压力开始在你饱受蹂躏的前列腺内膨胀，这是高潮来临的明显迹象。在你射精之前，她又给了你最后几次猛插，随着你们俩在狂喜中大叫，浓稠的精液喷溅在祭坛上。");
         }
         else
         {
            outputText("[pg][garg]的速度达到了顶峰，彻底地蹂躏着你，同时");
            if(get_player().hasStatusEffect(StatusEffects.Exgartuan))
            {
               outputText("埃克斯加图安");
            }
            else
            {
               outputText("蠕虫");
            }
            outputText("被从你的身体里吸了出来。突然，她俯下身，将嘴唇贴在你的嘴唇上，将她的舌头推向你的舌头，让你感觉到她开始因为释放而抽搐和颤抖。你捧着她的脸颊，热情地回吻她，努力让自己达到肛门高潮。片刻之后，那种难以置信的刺痛感和快速的操干结合在一起，让你达到了高潮，你在高潮时紧紧地夹住体内的圣杖，在石像鬼的怀抱中颤抖着。");
         }
         outputText("[pg]突然，塞进你[asshole]里的圣杖发出一声响亮的嘶嘶声，然后退了出来。你喘着粗气，瘫倒在地上，捂着肚子。一切都结束了，虽然你的一部分突然感到非常空虚，但很快就被遗忘了，因为[garg]滑倒在你身边，她已经把圣杖扔出了窗外。这只生物");
         if(get_player().hasStatusEffect(StatusEffects.Exgartuan))
         {
            outputText("在你体内已经");
         }
         else
         {
            outputText("们在你体内已经");
         }
         outputText("被法杖吸收并净化了；你忍不住希望她还有更多……以防万一。");
         outputText("[pg]你刚经历了一场折磨，仍在喘着粗气。你伸出一只手臂揽住[garg]的肩膀，将她紧紧拥入怀中。她可爱地笑着，将脸颊在你的胸膛上蹭了蹭，然后用她那巨大的蝙蝠翅膀将你们俩包裹在一起。你在她的额头上印下了一个漫长而温柔的吻，让她就这样依偎了很久，沉浸在彼此的陪伴中。");
         outputText("[pg]不过，你知道自己最终还是得回营地。你试着告诉[garg]，但令你惊讶的是，她已经睡熟了，还发出轻柔的鼾声。你咧嘴一笑，从她的怀抱中挣脱出来，找了点东西给她盖上，然后又吻了她一下，这才动身回家。");
         if(get_player().hasStatusEffect(StatusEffects.Exgartuan))
         {
            get_player().removeStatusEffect(StatusEffects.Exgartuan);
         }
         else
         {
            get_player().removeStatusEffect(StatusEffects.Infested);
         }
         get_player().takeDamage(Math.round(get_player().maxHP() / 3));
         get_player().changeFatigue(10);
         gargoyleConfidence(2);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2788,1);
         doNext(get_camp().returnToCampUseOneHour);
      }
   }
}

