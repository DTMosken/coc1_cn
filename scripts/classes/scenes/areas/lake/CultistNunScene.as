package classes.scenes.areas.lake
{
   import classes.Cock;
   import classes.CockTypesEnum;
   import classes.DynStat;
   import classes.ItemType;
   import classes.Player;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.items.ArmorLib;
   import classes.scenes.Camp;
   import classes.scenes.Inventory;
   import coc.view.CoCButton;
   import flash.Boot;
   
   public class CultistNunScene extends AbstractLakeContent
   {
      
      public function CultistNunScene()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
      }
      
      public function meetCultistNunAgain() : void
      {
         var overrideAbandon:Object;
         var nextAction:Function;
         var itype:ItemType;
         var _g:Inventory;
         clearOutput();
         outputText("沿着湖岸散步时，你再次遇到了那位修女，她又一次跪在那里，向她的神祈祷。");
         outputText("[pg][say: 很高兴再次见到你，陌生人。什么风把你吹来了？你想和我一起祈祷吗？]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2702) == 1 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2700) == 0)
         {
            outputText("[pg]她朝旁边的一个小箱子点了点头。[say: 如果你想加入我的信仰，这个提议仍然有效。]");
         }
         menu();
         if((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2702) == 1 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2703) == 1) && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2700) == 0)
         {
            _g = get_inventory();
            itype = get_armors().NNUNHAB;
            nextAction = joinNunFinish;
            overrideAbandon = joinNunMaybeLater;
            addNextButton("拿走修女服",function():void
            {
               _g.takeItem(itype,nextAction,overrideAbandon);
            }).hint("拿走修女服。");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2702) == 0 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2703) == 0)
         {
            addNextButton("祈祷",joinNun).hint("和她一起祈祷。");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2703) == 0 && get_player().cor > 60 && !get_player().isGenderless())
         {
            addNextButton("玷污她",defileHer).hint("让她见识见识你是怎么\"赞美造物\"的。");
         }
         addNextButton("拒绝",denyPrayer).hint("你有更好的事情要做。");
      }
      
      public function meetCultistNun() : void
      {
         var answer2:int;
         var _g2:CultistNunScene;
         var answer1:int;
         var _g1:CultistNunScene;
         var answer:int;
         var _g:CultistNunScene;
         clearOutput();
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2701,1);
         outputText("沿着湖岸散步时，你发现远处有什么东西；有人跪在那里，穿着蓝色的长袍。从你站的地方看，那似乎没什么危险，好奇心驱使你走了过去。");
         outputText("[pg]随着你的靠近，更多的细节变得清晰起来。跪着的人显然是个女性，她似乎在对自己重复着某种祈祷。你以为的长袍实际上是一件修女服，而且非常短，露出了她大半粗壮的大腿。");
         if(get_player().isReligious())
         {
            outputText("这绝对不是你在长大的修道院里习惯看到的景象。");
         }
         outputText("[pg]走了一会儿，你离那个女人足够近了，引起了她的注意。她闭着眼睛，双手合十祈祷。她面前有一个小小的、不起眼的神龛，由一个小木十字架、几根蜡烛和各种各样的花组成。她没有看你，而是直接对你说话。");
         outputText("[pg][say: 这个世界，很美，不是吗？]她问道。你对这个突如其来的问题感到有些困惑，但还是以一种不置可否的方式回答了。[pg][say: 我理解你可能对赞美这片土地感到犹豫，因为它遭受了太多的苦难。但是生命，无论以何种形式存在，都必须受到赞美和庆祝，因为这是我们的主赐予我们这些卑微仆人的礼物。]");
         outputText("[pg]你挠了挠头。你该怎么回答她？");
         menu();
         _g = this;
         answer = 0;
         addButton(0,"玛莱",function():void
         {
            _g.answerNun(answer);
         }).hint("你以为玛莱是这片土地的神，而她绝对不像是一个“主”。");
         _g1 = this;
         answer1 = 1;
         addButton(1,"伪神",function():void
         {
            _g1.answerNun(answer1);
         }).hint("在英格纳姆，你被教导只有一位真神，你希望她赞美的是那位神。");
         _g2 = this;
         answer2 = 2;
         addButton(2,"不信教",function():void
         {
            _g2.answerNun(answer2);
         }).hint("你不是特别信教。");
      }
      
      public function joinNunStay() : void
      {
         clearOutput();
         outputText("你决定耐心一点，等她的高潮平息下来。");
         outputText("[pg][say: 主啊，我感受到了您的触碰！它蹂躏我，撑开我！求您，让我进一步侍奉您！给我一个启示！]");
         outputText("[pg]她刚说完，一阵新的快感袭来，她再次潮吹了。她在原地痉挛，无法控制自己。");
         outputText("[pg][say: 是的！是的！我看到了！我将追随您的指引！是的！]");
         outputText("[pg]她大声呻吟，最终又化作一声叹息。她深吸一口气，片刻之后，她又恢复了往日平静的模样。");
         outputText("[pg]她再次跪下。她把手伸向大腿，将十字架在体内抽插了几下。她叹了口气，直直地看着你。");
         outputText("[pg][say: 感谢你留下来陪我。在我祈祷时，我看到了一个幻象。我的主对我说话了，祂看到了你的潜力。祂相信你会成为祂伟大的仆人。祂看到了你的潜力！]");
         outputText("[pg]侍奉\"祂\"？");
         outputText("[pg][say: 这并不困难，而且能带来巨大的快乐。只要赞美祂的繁衍工具，将它置于你生命中一切事物之上，你就会得到祂荣耀的祝福。]");
         outputText("[pg]她再次揉搓着大腿。");
         outputText("[pg][say: 传播祂的伟大，在祂出现的任何地方赞美祂。你意下如何？]");
         menu();
         addButton(0,"好……？",joinNunJoinReligion).hint("她的宗教似乎只是赞美鸡巴。你能做到。");
         addButton(1,"……不。",joinNunFuckOffMormons).hint("你现在不想听这个好消息。");
      }
      
      public function joinNunMaybeLater() : void
      {
         clearOutput();
         outputText("你现在真的拿不了这件修女服。");
         outputText("[pg][say: 我理解。别担心；这件修女服只是你传播祂的话语的辅助工具。它不是必需的。不过，如果你需要它，随时来找我。]");
         outputText("[pg]你点点头。");
         outputText("[pg][say: 找到另一位信仰的成员令人兴奋，但我必须独自与我主交流。请稍后再来。]");
         outputText("[pg]你觉得无所谓。你留她继续\"祈祷\"，自己返回了营地。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function joinNunJoinReligion() : void
      {
         clearOutput();
         dynStats(DynStat.Lust(15));
         outputText("尽管你对她那套\"宗教\"的粗鲁介绍实在难以恭维，但不得不承认，你也是个狂热的鸡巴爱好者。[if (hascock) {尤其是你自己的那根。}] 内心翻涌着淫荡的期待，你告诉她你接受了，但不确定这究竟意味着什么。");
         outputText("[pg]她再次平静地微笑，完全恢复了她那平和的伪装。[say: 如果你真的爱祂，那么你需要做的就是继续你的崇拜。但作为低等生物，我们可能需要某种动力，一种对我们奉献的物理支撑。我理解。]");
         outputText("[pg]她从旁边的地上拿出一个小箱子并打开它，露出一件和她自己穿的很像的海军蓝缎面修女服。[say: 给你。这是祂的恩赐。愿祂像祝福我一样祝福你。]");
         outputText("[pg]你接过缎面修女服。手指上的触感已经让你的想象力燃烧起来，脑海中浮现出各种形状和大小的阴茎，某种东西驱使你立刻穿上它。这上面肯定注入了某种魔法。");
         get_inventory().takeItem(get_armors().NNUNHAB,joinNunFinish,joinNunMaybeLater);
      }
      
      public function joinNunFuckOffMormons() : void
      {
         clearOutput();
         outputText("你举起双手，叫她停下。你对加入一个崇拜鸡巴的教会不感兴趣。");
         outputText("[pg]她看起来有些失望，但很快又恢复了平静的神情。[say: 好吧，陌生人。我太冒昧了。希望假以时日，我主会向你展示祂的光芒，你会回到这里。没有人能被强迫接受真理。]");
         outputText("[pg]随便吧。你对她的话不以为然，她深吸一口气，又回到了她那淫荡的祈祷中。你不知道为什么你会期望这片土地上的宗教有任何纯洁性。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function joinNunFinish() : void
      {
         clearOutput();
         outputText("你接过修女服，修女脸上洋溢着虔诚的幸福。[say: 谢谢你，陌生人，在这样艰难的时期，信仰是很难得的。你的任务很重要。无论你走到哪里，都要传播祂的话语。不要贬低祂的力量和你改变的能力；一个人就能改变世界。]");
         outputText("[pg]你心里有一部分在想，她有多少只是在扮演一个角色，又有多少是对阴茎之神有真正的信仰。你觉得，这最终并不重要。你偶尔会穿着这件修女服找点乐子。");
         outputText("[pg][say: 再次感谢你。现在请离开我吧。我必须再次与主交流。]");
         outputText("[pg]你觉得这也没什么大不了，便让她继续她的\" 祈祷\" ，自己动身返回了营地。[pg]");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2700,1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function joinNun2() : void
      {
         clearOutput();
         outputText("她在原地烦躁不安地动了动。");
         outputText("[pg][say: 它长得很大，强壮，坚硬，充满阳刚之气，充满活力，随时准备爆发！]");
         outputText("[pg]什么？");
         outputText("[pg]她揉搓着大腿，将丰满的双乳挤压在一起。她的乳头隔着缎面修女服凸显出来，显然已经硬挺。她的声音不再平静，而是狂喜地向着天空尖叫。");
         outputText("[pg][say: 它在跳动，渴求着关注！渴求着完全的崇敬！我们必须赞美它，侍奉它，直到它释放出神圣的种子，让荣耀渗透整个世界！]");
         outputText("[pg]她到底有什么毛病？");
         outputText("[pg][say: 当它爆发时，我们将直接感受到祂的祝福触碰我们！当它爆发时……当它爆发时……]");
         outputText("[pg]她尖叫着，整个身体向后仰倒。当她躺在地上时，她向你张开双腿，你不可能不注意到她双腿间的东西：一个十字架，它的末端深深地插入她湿透的小穴中，还在高潮的收缩中反射性地吸吮着它。");
         outputText("[pg]你立刻站起来，与这个明显疯了的女人拉开几步距离。她继续呻吟着，享受着高潮，把十字架留在体内，同时隔着缎面修女服揉搓着自己的乳头。");
         doNext(joinNunStay);
      }
      
      public function joinNun() : void
      {
         clearOutput();
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2702,1);
         outputText("是的，听起来是个好主意。毕竟，这是一个放松的好地方。你点点头，躺在她身边，她平静地微笑着。她的眼睛是充满活力的绿色，从修女服里漏出来的几缕头发是金色的。你觉得，这就像凝视着纯洁本身。");
         outputText("[pg][say: 谢谢你加入我。让我们继续祈祷吧。]");
         outputText("[pg]你默默地等待她继续。她深吸了一口气，然后继续。");
         outputText("[pg][say: 主啊，感谢您用您的造物祝福我们。]");
         outputText("[pg]你点点头。");
         outputText("[pg][say: 您的造物，触及宇宙中的所有生物。让生命得以成长，繁衍，展现它们所有的荣耀。]");
         outputText("[pg]你点点头。");
         outputText("[pg][say: 您的造物，它本身也在成长，雄伟，持久……]");
         outputText("[pg]你不确定她在说什么。");
         doNext(joinNun2);
      }
      
      public function getDefiledVagene3() : void
      {
         clearOutput();
         outputText("突然，你发现自己回到了湖边，修女抱着你出汗的身体，直勾勾地盯着你。你张开嘴，目光在她双眼之间游移，但什么也没说，无法描述你差一点就被那根完美的肉棒刺穿，然后又突然被拒绝所感到的纯粹恐惧。");
         outputText("[pg][say: 哦，我拔得太快了吗？原谅我，我无法想象那是什么感觉。] 她再次微笑，保持着她那完全贞洁的伪装。[say: 你现在看到祂的荣耀了吧？正如我告诉你的，这就是等待着祂的光芒追随者的东西。请考虑一下。][pg]你只是点点头，凝视着远方。她发出一声小小的、天使般的笑声。[say: 谢谢你。现在，你还没有受洗，对吧？我会解决这个问题的。] 她将十字架假阳具对准你的小穴，再次将它插入你的体内。你大声呻吟，你的思绪被带回了那个朦胧、空灵的虚空。[pg]你眨了眨眼，发现自己回到了刚才的地方。你的[pussy]里溢出了淫液，每一次收缩都会喷出几缕，射出相当远的距离。那个人形只是将他的龟头在你的嘴唇上滑动，每一次触碰都会引起快感的火花，让你的身体抽搐，每一次触碰你的[clit]都会让你高兴得尖叫。");
         outputText("[pg]在经历了难以忍受的挑逗之后，他开始向里面推进，撑开你那乞求着的小穴的肉壁。当他慢慢插入时，你屏住呼吸，每一寸都在你的脑海和你的小穴里引发高潮般的爆炸。你心想，这就是你出生的目的。生活中没有比这更重要的了。");
         outputText("[pg]那个人形将自己完全没入你的体内，并保持了一会儿静止。随着每一次心跳，你都能感觉到他肉棒在你体内的绝妙质感，完美地填满了你。他慢慢地抽出肉棒，直到顶端，然后再次猛地插进去。你无法抑制自己的笑声，那是对你目前处境的纯粹喜悦。");
         outputText("[pg]片刻之后，速度加快，变成了一场粗暴、野兽般的性交。你极度渴望变得更加主动，用你的臀部以与他匹配的速度迎合他的肉棒，甚至可能把这个无形的人形拉过来接吻。然而，你做不到。每一次抽插都如此彻底地支配着你的身体，以至于你完全瘫痪，除了承受之外什么也做不了，只有当你的大脑还能勉强运转时，偶尔才会呻吟几声。");
         outputText("[pg]在经历了十分钟的残酷性交后，那个人形把你从他的肉棒上推开，并把它指向你。尽管在整个性交过程中你都处于恍惚状态，但你本能地知道该怎么做。你低头盯着肉棒的马眼，张开嘴，准备接受你的洗礼。");
         outputText("[pg]一波又一波神圣的精液覆盖在你的身体上，它触碰到的每一个地方都闪烁着快感，引发了你自己强烈的高潮。你一边含糊不清地嘟囔着，一边吞下落在你嘴里的精液，感谢你的神用他的光芒祝福你。他强有力地跳动了多次，每一次收缩都释放出惊人数量的精液，浓稠的精液覆盖了你的全身。然而，你依然尽职尽责，连眼睛都不眨一下就全部接受了。");
         outputText("[pg]你的神向你展示了他现在疲软的肉棒，上面仍然滴着他高潮后最后残留的几滴精液。你心领神会地接受了它，漫不经心地吸吮和舔舐着你能用舌头舔到的任何精液。随着肉棒的萎缩，你感觉到你的意识离开了虚空，回到了玛瑞斯。当你意识到你留下了什么时，一种深深的渴望和恐惧感充满了你的脑海。");
         outputText("[pg]你消失了。");
      }
      
      public function getDefiledVagene2() : void
      {
         clearOutput();
         outputText("你在一个黑暗的虚空中醒来，感到困惑。令你惊讶的是，你可以移动，但你没有方向感。");
         outputText("[pg]你走了几步，才意识到自己哪儿也去不了。黑暗、雾蒙蒙、荒芜的气氛延伸到你所能看到的尽头，甚至可能更远。");
         outputText("[pg]你环顾四周，惊慌失措，不知道该怎么办。绝望几乎淹没了你，直到你注意到身后有一道闪光。你转过身，看到黑暗的雾中有一片空地，还有一个似乎是人形的身影。");
         outputText("[pg]你向那个身影走去。当你靠近时，那个身影的任何特征都没有变得更清晰，除了一件事；他的阴茎。");
         outputText("[pg]尽管你可能迷失和绝望，但你仍然无法将目光从那根阴茎上移开。它绝对闪耀着勃勃生机，它的每一个比例，从龟头的形状到静脉的粗细，十英寸的长度到两英寸的宽度，显然都是由神精心制作的。它跳动着，滴下一滴先列腺液到雾蒙蒙的地面上，一阵内疚感袭来，仿佛你不应该让那一滴白白浪费。");
         outputText("[pg]你像飞蛾扑火一样走向那根阴茎。不知不觉中，你已经[if (tailLeg) {盘绕|跪}]在它面前，你的眼睛催眠般地跟随着阴茎的每一次跳动和抽动。");
         outputText("[pg]然而，你不知道该怎么办。你应该抚摸它吗？吸它？你甚至确定自己配得上看到这样的阴茎吗？怀疑充满了你的脑海，直到你内心有什么东西低语说你被允许赞美它。喜悦充满了你的脑海，你双手颤抖着，触摸着那根神圣的阴茎。");
         outputText("[pg]你的手一碰到它就感到刺痛。你叹了口气，特别大胆地把双手都放在上面。你上下滑动你的手，感受着龟头和阴茎干的精致质感。你抚摸它一次，两次，以一种慵懒、胆怯的节奏。马眼扩张，露出另一滴先列腺液。你认为，这是你顺从到这种程度的奖励。你伸出舌头，温顺地舔了舔。");
         var _loc1_:String = get_player().textByWetnessVagina("你感觉到你的小穴正在湿润，挑战着它平时的干燥，因为你正在侍奉的阴茎是如此的宏伟。","你的小穴感到刺痛，自我润滑并滴下期待的液体，无法抑制被这根完美阴茎填满的欲望。","你的小穴抽搐着，几缕润滑液滑落滴下，乞求被这根完美的阴茎填满。","你的小穴抽搐着，一股小小的淫液喷涌而出，表明它有多么需要被这根完美的阴茎填满。","你的小穴抽搐着，一股小小的淫液喷涌而出，表明它有多么需要被这根完美的阴茎填满。","你已经湿透的小穴喷涌出一股淫液，用你渴望的液体浸透了你的[legs]，暴露了你无法忍受的被这根完美阴茎填满的需要。");
         outputText(_loc1_);
         outputText("[pg]你张开嘴，舌头颤抖着。你绝对需要这根阴茎在你的嘴里，但没有允许你不敢拿。你让它开着，欢迎它，希望它接受它的邀请。突然，那个人形身影将自己完全插入你体内，十英寸全部深入你的喉咙。你认为，这根阴茎是你尝过的最美味的东西。你在原地烦躁不安，你的身体无法抑制被这根阴茎使用的感觉有多好。你的一部分想要挑逗你饥渴的[pussy]和勃起的乳头，但你知道你现在唯一的工作就是取悦这根阴茎。你自己的需求以后再说。");
         outputText("[pg]你闭上嘴唇包住阴茎，人形身影开始用你的嘴来取悦自己。它开始得很慢，故意把阴茎往后拖。当它退出时，你的舌头在阴茎周围滑动，感受着阴茎干上青筋暴起、光滑的质感，龟头海绵状的质感，并品尝着从中大量流出的咸味先列腺液。你闭着眼睛，只是欣赏着味道。");
         outputText("[pg]随着每一次抽插，速度不断加快。你没有丝毫反抗；你的身体根本不敢在这根美妙的肉棒上作呕。你原本紧闭的双唇变成了一个愚蠢、流着口水、张着嘴的笑容，随着深喉的速度加快，你的大脑已经无法承受被用来取悦这根完美阳具所带来的幸福感。");
         outputText("[pg]速度最终变得如此粗暴，以至于你整个瘫软的身体都被抛来抛去，被那个人形胯部的纯粹力量震得摇摇晃晃。伴随着一次特别猛烈的抽插，你无法保持直立，瘫倒在地上。你躺在那里，对目前的处境感到满足，脑子里除了那根刚刚蹂躏过你嘴巴的肉棒，什么也想不起来。");
         outputText("[pg]那个人形粗暴地[if (singleleg) {把你的[leg]拉向他|把你的[legs]推开}]，露出了你那完全湿透的小穴，把你从迷茫中拉了回来。他走近你，他的肉棒跳动着向上翘起，你的心一沉；难道？他真的要用那根肉棒刺穿你的[pussy]吗？你的一部分几乎无法抑制自己的期待，而另一部分则在想，在被<b>那个东西</b>彻底操过之后，你是否还能保持理智。");
         outputText("[pg]那个人形将他的肉棒对准你的小穴。你呼吸急促，因期待而颤抖。");
         doNext(getDefiledVagene3);
      }
      
      public function getDefiledVagene() : void
      {
         clearOutput();
         outputText("你试图靠近她，但除了转动眼球和呼吸，你什么也做不了。到底发生了什么事？");
         outputText("[pg]修女站了起来，你用力推搡留下的泥土直接从她的修女服上滑落，让她再次变得一尘不染。[say: 你竟敢袭击神职人员！真的，如果没有我主的指引，这片土地已经堕落到了堕落的罪恶之中。]");
         outputText("[pg]你的脸因愤怒而扭曲，但尽管你用尽了全力，却依然无法打破束缚你的法术。她看到了你的窘境，并且不知为何，明白了这意味着什么。");
         outputText("[pg][say: 审判罪人并非我的职责。但看来主认为我配得上向你展示光明，试图引导你走上正义之路。]");
         outputText("[pg]她向你走来，诱人地扭动着臀部，同时保持着极其贞洁的目光。你可以看到十字架仍然牢牢地插在她的体内，细细的淫液顺着她的大腿滑落。她直视着你的眼睛，脸庞离你只有几英寸远。");
         outputText("[pg][if (isnakedlower) {[say: 你为什么光着身子这样走来走去？你打算用这种粗鲁的性感展示来唤起我主的工具吗？无知。别担心，我会向你展示正义之路。]|[say: 值得庆幸的是，你似乎并没有完全迷失。我会引导你，向你展示你必须如何表现自己来侍奉我的主。准备好。]}]");
         outputText("[pg]她把一只手伸到双腿之间，抓住了十字架。她慢慢地把它拔出来，小穴的内壁紧紧地贴着玩具。当它弹出来时，她发出一声轻柔的呻吟，随后是一连串的润滑液。她把它举到你僵硬的目光前，你注意到它比你最初想象的要变态得多；十字架的末端相当粗，形状和质地就像一根真实的、青筋暴起的人类阴茎。她把它放在你的鼻子下，穿过你的嘴唇，女性的气味让你的头脑发昏。");
         outputText("[pg][say: 我曾经也像你一样迷失。成为腐败的猎物，成为我猖獗欲望的猎物。在得到祂的光芒祝福后，我明白没有比侍奉更大的快乐了。当祂认为我配得上时，我以最令人愉快的方式被洗净了欲望。我会给你看一个例子。]");
         outputText("[pg][if (istaur) {她走到你身后，手里拿着假阳具。[say: 我不知道我的主是否关心像你这样具有野兽形态的生物，但我希望他足够仁慈，向你展示祂的光芒。] }]她低声念着一段舒缓的、难以理解的祈祷，将假阳具的头部对准你的[vagina]，挑逗着你的嘴唇，轻轻地摩擦着你的[clit]。你的呼吸变得急促，由于魔法的束缚，你无法抑制自己的欲望，也无法阻止这种挑逗。");
         outputText("[pg][say: 主啊，像你祝福我一样祝福这个人吧。]她把假阳具塞进你体内，你的视线变得一片空白。");
         doNext(getDefiledVagene2);
      }
      
      public function getDefiledTake() : void
      {
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2700,1);
         doNext(get_camp().returnToCampUseTwoHours);
      }
      
      public function getDefiledEnd() : void
      {
         clearOutput();
         outputText("当你醒来时，修女已经不在那里了。你挠了挠头，不确定自己为什么睡在草地上，然后一切都回想起来了。");
         outputText("[pg]你四处寻找修女，但除了一个小箱子什么也没找到。你打开它，发现了一件海军蓝色的缎面修女服，很像她穿的那件。这是她让你皈依她宗教的方式吗？");
         outputText("[pg]好吧，不管你的信仰如何，你确信这件修女服在角色扮演时会很有趣。[pg]");
         dynStats(DynStat.Cor(-5));
         get_inventory().takeItem(get_armors().NNUNHAB,getDefiledTake,get_camp().returnToCampUseTwoHours);
      }
      
      public function getDefiledCock2() : void
      {
         clearOutput();
         get_player().orgasm();
         var _loc1_:int = get_player().longestCock();
         outputText("她动作敏捷，瞬间就将" + (get_player().cocks[_loc1_].cockLength <= 16 ? "你的整根肉棒" : "你肉棒的前十六英寸") + "吞入口中，惹得你发出一声呻吟。");
         outputText("[pg]她静止了片刻，只是品尝和舔舐着含在嘴里的那段肉棒。就像她顺滑地吞下你的阴茎一样，她又将其滑出到顶端，上面完全覆盖着浓稠的唾液。");
         outputText("[pg]她再次深吸一口气，将你的阴茎重新塞进嘴里。她抓住你的[legs]作为支撑，开始用你的肉棒操弄自己的脸，每一次深喉都比上一次更快。");
         outputText("[pg]在你长时间的挑逗之后，你的[legs]在无情的快感冲击下[if (singleleg) {shakes|shake}]。在如此粗暴的口交中，她很难保持姿势，一缕缕金发从她的修女服中滑落，勾勒出这位宁静修女绝对不贞的形象。");
         outputText("[pg]当她继续膜拜你的阴茎时，空气中充满了湿润的吧唧声。你感觉到精液在体内沸腾，身体紧绷，再也无法抑制自己的欲望。然而，似乎察觉到了这一点，修女在你释放之前迅速将你的阴茎从嘴里吐了出来。");
         outputText("[pg][say: 还没到时候，罪人。我不知道你的种子是否已经被净化到足以适当地为我洗礼。]");
         outputText("[pg]你甚至无法挺动腰部来获得某种释放，只能在强烈的挫败感中呜咽和喘息。修女对你的痛苦毫不在意，她从修女服的口袋里拿出一件物品。一串念珠，珠子比平常的要大。");
         outputText("[pg]她拿着念珠，把它绑在你的阴茎根部。感觉并不是特别紧或不舒服，让你想知道她为什么要费心这么做。");
         outputText("[pg]做完这些，她开始快速套弄你的肉棒，在她的唾液和你的先列腺液的帮助下，她的手滑动得很顺畅。她舔舐着你的[cockhead longest]，偶尔用舌头直接娇柔地摩擦你的尿道。这足以把你推向边缘，你高潮了，大声呻吟着。");
         outputText("[pg]但是，什么也没发生。你没有感觉到释放，也没有射精。快感只是不断累积，你的欲望没有得到满足，精液在绑着念珠的地方停了下来，被某种无形的力量完全阻挡了。她继续抚摸和舔舐你，你很快又一次次地高潮，却找不到真正的释放。");
         outputText("[pg]你愉悦的喘息变成了绝望的呻吟，你整个身体都在疯狂的渴求中颤抖。在你数不清体内积累了多少次高潮之后，她再次停了下来。");
         outputText("[pg][say: 我相信你的精液现在已经被适当地净化了。这是一次值得的洗礼。]");
         outputText("[pg]你甚至懒得去想如何回应。你现在完全失去了理智，无法应对你有多么需要射精。");
         outputText("[pg]修女将手伸向自己的小穴，此刻那里早已被她的淫液浸透。[say: 最后再\"推\"一次，这样你才配得上承载祂的赐福。] 她抓住仍然嵌在自己体内的十字架，将其拔出，阴唇紧紧咬住那罪恶的玩具，不愿松口。伴随着一阵湿漉漉的声响，它终于弹了出来，整根都被她天然的润滑液浸透了。十字架的末端实际上是一个变态的假阳具，表面纹理做得和真阳具一模一样。");
         outputText("[pg]你仍然无法动弹，只能眼睁睁地看着她将玩具对准你的[asshole]，她的另一只手放在念珠上，低头盯着你的马眼。[say: 为我射精吧！用你的种子祝福我，圣者！]");
         outputText("[pg]她把十字架塞进你体内的同时取下了念珠，束缚你阴茎的超自然封印在邪恶假阳具的头部碾压你前列腺的瞬间被解除了。你终于射精了，你的大脑和视线完全空白，无法处理这纯粹的、邪恶的快感。");
         outputText("你强有力地抽动了几次，" + get_player().lowMedHighCum("每一次收缩都将一小股精液射到修女的脸上。她尽职尽责地承受了这一切，面不改色。[pg][say: 我会为您努力工作的，主啊。从这次洗礼中，我能看出我的虔诚还不够。]","每一次收缩都用浓稠的精液涂抹她的身体。她尽职尽责地承受了这一切，面不改色，精液在她的乳房上汇聚。[say: 感谢您，主啊，感谢这次洗礼。我下次会努力做得更好。]","每一次收缩都用淫秽数量的精液覆盖她的身体。尽管你射精的量大得离谱，她仍然保持静止，面不改色。精液在她的躯干上汇聚，大团大团地顺着光滑的缎面织物滑落。她舔了舔嘴唇，抹去刚好足够她说话的精液。[say: 感谢您，主啊，感谢这神圣的祝福。这次洗礼证明了我是正义的，并且会努力变得更加正义。]"));
         outputText("[pg]她从你的屁股里拔出十字架，麻痹你的法术消退了。你瘫倒在地，筋疲力尽。[say: 我明白，洗礼通常会让祂的光芒的承载者感到疲惫。但我相信你仍然可以学习更多关于祂的道路。当你醒来时，请带上我的礼物，加入我的信仰。你有很大的潜力。]");
         outputText("[pg]你实在不确定是该因为她那套\"宗教\"说辞揍她一顿，还是该感谢她带给你如此震撼的高潮。不过这一切很快就无所谓了，因为你渐渐沉入了梦乡。");
         doNext(getDefiledEnd);
      }
      
      public function getDefiledCock() : void
      {
         clearOutput();
         var _loc1_:int = get_player().longestCock();
         outputText("你试图靠近她，但除了转动眼球和呼吸，你什么也做不了。到底发生了什么事？");
         outputText("[pg]修女站了起来，你用力推倒她时沾上的泥土从她的修女服上滑落，让她再次变得一尘不染。[say:你竟敢袭击一位神职人员！没有我主的指引，这片土地果然已经堕落到了罪恶的深渊。][pg]你的脸因愤怒而扭曲，但尽管你用尽全力，也无法打破束缚你的法术。她看出了你的窘境，并且不知为何，明白了这意味着什么。[pg][say:我无权审判罪人。但看来主认为我配得上向你展示光明，尝试引导你走上正义之路。][pg]她向你走来，诱人地扭动着臀部，同时保持着极其贞洁的目光。你可以看到十字架仍然牢牢地插在她体内，细细的淫液顺着她的大腿滑落。[if (isnakedlower) {她把手放在你暴露的[cock longest]上。[say:你漫不经心地向世界展示主的荣耀，却又攻击祂的仆人。我将向你展示如何正确地传播祂的福音。]|她脱下你的[armor]，把手放在你暴露的[cock longest]上。[say:你想要传播祂的福音，却又攻击祂的仆人。我将向你展示如何正确地侍奉祂。]}]");
         outputText("[pg]她小心翼翼地用双手握住你的肉棒，甜美地在上面吹气，让你不禁颤抖。当你的肉棒在她的手中变大时，她开始仔细端详它。");
         if(get_player().cocks[_loc1_].cockLength < 6)
         {
            outputText("[say:这可不是个好榜样，不是吗？你可以做得更好。主的荣耀是无限的，我不能要求你与祂比肩，但你可以做得更好。]");
         }
         else if(get_player().cocks[_loc1_].cockLength > 15)
         {
            outputText("[say:傲慢是最大的罪过，陌生人。如果你太努力地想要与祂的荣耀比肩，你只会走向毁灭。这根肉棒配得上你的傲慢，你必须变得谦卑。]");
         }
         else
         {
            outputText("[say:啊，一个很好的例子。既不傲慢，也不谦卑。当你接受自己作为祂的仆人的身份时，你将真正成为祂事业的巨大助力。]");
         }
         outputText("[pg]她把你的[cockhead longest]含进嘴里，轻轻地吸吮，同时舔舐着龟头。它跳动着，渴望更多，但她停了下来，把它从嘴里拿出来，然后抚摸了几下。");
         if(get_player().cocks[_loc1_].get_cockType() == CockTypesEnum.ANEMONE)
         {
            outputText("[pg][say:我的舌头在发麻，我能感觉到罪恶的燥热在我的身体里蔓延……这样的肉棒，真是堕落的产物。难道你不能在不给女人染上邪恶毒液的情况下让她们快乐吗？]");
         }
         else if(get_player().cocks[_loc1_].get_cockType() == CockTypesEnum.TENTACLE)
         {
            outputText("[pg][say:我见过许多长着这种肉棒的堕落野兽。你为什么要这样堕落自己？难道你只想成为一个没有思想的怪物吗？]");
         }
         else if(get_player().cocks[_loc1_].get_cockType() == CockTypesEnum.DEMON)
         {
            outputText("[pg][say:真是可悲的景象。仅仅是把这根肉棒含在嘴里，我最脆弱的地方就感到一阵酥麻。仅仅是气味……就让我的脑海中充满了被恶魔的精液蹂躏、撑开和玷污的画面。][pg]一滴淫液从她紧紧夹着十字架的小穴中滴落。[pg][say:但一个真正的信徒是不会向堕落屈服的。恶魔竟然这样玷污祂荣耀的工具……真是可耻。]");
         }
         else if(get_player().cocks[_loc1_].get_cockType() != CockTypesEnum.HUMAN)
         {
            outputText("[pg][say:如此野兽般的肉棒。动物被软弱的伪神提升来同化人类。你为什么决定堕落到它们的水平？]");
         }
         else
         {
            outputText("[pg][say:我很高兴你没有堕落。人类的肉棒……它是祂荣耀的工具。形状、大小、质感……它让像我这样有信仰的女人忍不住想要赞美它。]");
         }
         outputText("[pg]她开始用长长、慵懒的动作抚慰你的肉棒。每当她的手到达你的龟头时，她就会用拇指抚弄它的顶端。[if (istaur) {由于你的身体构造，你只能感觉到她对你做的事情，这让每一种新的感觉都成为一个完全的惊喜|你恢复了足够的行动能力，把目光转向她，你看到她E罩杯的乳房随着每一次抚摸而弹跳，她的乳头透过修女服的缎面布料凸显出来。}]");
         outputText("[pg]她每一次抚摸都会用拇指按压你肉棒的下半部分，把每一滴先列腺液都挤出来，并在它滴落时舔舐干净。随着你欲望的增长，你的呼吸变得急促，但她的节奏依然如故。");
         outputText("[pg]突然，她停了下来，任由你的肉棒绝望地跳动着，无人理睬。");
         outputText("[pg][say:主啊，感谢您给我这个机会，让我再次以您的名义接受洗礼。]");
         outputText("[pg]你还在纳闷她在说什么，她却小心翼翼地握住你的肉棒，几乎没有碰到它。她深吸一口气，把嘴对准了你肉棒的顶端。");
         doNext(getDefiledCock2);
      }
      
      public function execEncounter() : void
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2701) == 1)
         {
            meetCultistNunAgain();
         }
         else
         {
            meetCultistNun();
         }
      }
      
      public function encounterChance() : Number
      {
         return 0;
      }
      
      public function denyPrayer() : void
      {
         clearOutput();
         outputText("你其实并不关心她的信仰。你告诉她你不感兴趣。");
         outputText("[pg]她似乎并没有因为你的拒绝而受到影响。[say: 很好。一个人不能强迫另一个人看到光明。我希望，最终，你会回到这里和我一起祈祷。]");
         outputText("[pg]她继续默默地祈祷。你耸耸肩，原路返回营地。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function defileHer() : void
      {
         clearOutput();
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2703,1);
         outputText("你对她的祈祷嗤之以鼻，并告诉她你会向她展示你对此的真实想法。她柔软白皙的身体，从修女服中露出的金发，明亮的绿眼睛和丰满的曲线，简直就是为了被玷污而生的！");
         outputText("[pg]在她还没来得及反应之前，你用力将她推倒在地，准备蹂躏她纯洁的身体。她倒地时发出一声轻呼，不小心向你张开了双腿。");
         outputText("[pg]然而，她双腿间的光景却让你大吃一惊。在她的修女服下，竟然藏着一个十字架，而十字架的末端正深深地插在她湿透的小穴里！这强烈的反差让你一时愣住了。");
         outputText("[pg]然后你发现自己动弹不得。");
         doNext(get_player().hasCock() ? getDefiledCock : getDefiledVagene);
      }
      
      public function answerNun(param1:int = 0) : void
      {
         clearOutput();
         outputText("她长长地、舒缓地叹了口气。[pg]");
         switch(param1)
         {
            case 0:
               outputText("[say: 哦，主可以有多种形式，可以是许多不同的存在，但只有一个。玛莱代表着生育，美丽生命的丰硕成长，只是祂的一个方面，愿祂受赞美。]");
               break;
            case 1:
               outputText("[say: 当然，孩子。我无意冒犯你的宗教。重要的是我们都践行我们的信仰并赞美造物，无论我们认为是谁创造了它。]");
               break;
            case 2:
               outputText("[say: 面对如此多的腐化，要保持信仰是很困难的，我能理解。希望有一天主能向你展示祂的光芒，你也会赞美祂。]");
         }
         outputText("[pg]她深吸了一口气，再次叹息。");
         outputText("[pg][say: 和我一起祈祷吧。让我们一起赞美造物。就一会儿好吗？]");
         menu();
         addButton(0,"当然",joinNun).hint("片刻的宁静和冥想也许并不坏。");
         addButton(1,"拒绝",denyPrayer).hint("你还有更好的事情要做。");
         if(get_player().cor > 60)
         {
            addButton(2,"玷污她",defileHer).hint("让她看看你是怎么\"赞美造物\"的。");
         }
      }
   }
}

