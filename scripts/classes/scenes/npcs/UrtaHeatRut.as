package classes.scenes.npcs
{
   import classes.CoC;
   import classes.DynStat;
   import classes.DynStatOp;
   import classes.Player;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.scenes.Camp;
   import classes.scenes.places.TelAdre;
   import flash.Boot;
   import haxe.IMap;
   
   public class UrtaHeatRut extends NPCAwareContent
   {
      
      public function UrtaHeatRut()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
      }
      
      public function watchDrunkRuturtaJerkoff() : void
      {
         clearOutput();
         get_urta().urtaSprite();
         outputText("你决定要看看特尔阿德雷守卫队骄傲的队长在众目睽睽之下沦为一个发情的荡妇，于是你只是后退了几步，静静地看着。");
         outputText("[pg]乌尔塔那巨大的马鞭实在太显眼了，以至于最后她");
         if(!urtaLove())
         {
            outputText("脱下了裙子");
         }
         else
         {
            outputText("粗暴地撕开了腰部以下的裙子");
         }
         outputText("，向欣赏的观众露出了她那流淌着液体的肉棒和滴着淫水的裂口。就在你注视的时候，她的龟头正在变大，对于这个好色的双性狐狸兽人来说，你的气味太浓烈了，因为她的意志已经被大量的酒精侵蚀了。她的舌头从嘴里伸出来，她开始用长期练习的熟练手法抚摸它，用双手环绕它三英寸的周长，随着她的需要上下拉动，并发出轻柔的呜咽声。她苹果大小的睾丸和D罩杯的乳房都随着她手臂活塞般的运动而在脚跟上前后摇晃。");
         outputText("[pg]你忍住了一丝好笑的咯咯声，开始炫耀自己，试图挑逗这个可怜的扶他——你毫不怀疑她暗地里喜欢这样。毕竟，尽管现在整个酒吧似乎都在盯着她看，她甚至都没有脸红。事实上，她的姿势改变了；她开始站得更直，举止中流露出更多的骄傲，从她的阴茎不断勃起，以及在她身下的地板上形成了一大滩扶他先列腺液来看，似乎他们的注意力实际上让她更兴奋了。");
         outputText("[pg]当你缓慢、慵懒地开始为乌尔塔的私人乐趣摆姿势时，你拉着衣服，勾勒出你[chest]、[cocks]和[vagina]隐藏的乐趣，弯下腰让她渴望地盯着你的[butt]，这个双性狐狸兽人发出呜咽和呻吟。此时，她的阴茎几乎笔直地竖起，她用一只手松开了它。这只现在腾出的手滑到她的双腿之间，照顾她被忽视的裂缝，手指巧妙地舞动着，在探测和摆弄时发出清晰的吧唧声。她的另一只手操纵着她的阴茎，让它正好躺在她丰满柔软的乳房之间，笨拙地试图在抚摸她的阴茎、摆弄她黑色的乳头和把她的乳房挤在一起给自己乳交之间交替进行。她笨拙地在自己的乳沟里抽插和摩擦，先列腺液顺着她的胸前流下，弯下腰去舔她马鞭膨大的龟头。");
         outputText("[pg]你把目光从乌尔塔身上移开，意识到你的信息素、她的小表演和你自己挑逗她的努力结合在一起，确实让其他顾客非常兴奋。成双成对甚至三三两两的人开始到处亲热，单身的人开始摆弄自己，还有几个看起来非常感兴趣的扶他，都在玩弄他们的阴茎，他们用色迷迷的眼神看着你，并笨拙地试图偷偷靠近你。如果你继续挑逗乌尔塔，事情可能会变得非常疯狂；也许你应该停止了？");
         menu();
         addButton(1,"停止挑逗",stopTeasingDatHornyFox);
         addButton(0,"继续挑逗",keepTeasingDatHornyFawkes);
      }
      
      public function urtaQuestDone() : Boolean
      {
         return FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,711) == 1;
      }
      
      public function stopTeasingDatHornyFox() : void
      {
         clearOutput();
         get_urta().urtaSprite();
         outputText("你决定没必要做得太过火——况且，乌尔塔现在看起来已经快要爆发了，尤其是她正疯狂地吮吸着自己的龟头。");
         outputText("[pg]她确实爆发了；伴随着一声清晰的“啵”声，她把头从肉棒上拔了出来，发出一声更像是狼而不是狐狸的嚎叫，向后仰去。她肿胀的肉棒终于卸下了重担，一股狐狸精液像喷泉一样喷涌而出，浓稠黏滑地射向空中，然后像雨点般落在她身上，把她从头到脚都糊满了自己的精液。与此同时，她的小穴也在抽搐，身下涌出大量淫液。她高潮了一次又一次，被扶他精液浸透，直到双腿发软，一屁股跌坐在她那丰满的臀部上。她的肉棒最后射出了一股精液，然后她和肉棒一起瘫软在精液池中。");
         outputText("[pg]看到她一动不动地躺在那里，你有些担心，赶紧走上前去；你可不想杀了她！谢天谢地，她还在呼吸；她只是因为高潮过度和喝得太多而晕过去了。环顾四周，你看到一场群交派对正在你周围爆发，你赶紧逃离了这里。走的时候，你忍不住想自己到底在想什么……");
         dynStats(DynStat.Lust(20 + get_player().lib / 5));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function soberUrtaSatingPCHeat() : void
      {
         clearOutput();
         get_urta().urtaSprite();
         outputText("当她把你的背压在墙上时，你张开[legs]，让乌尔塔很容易就能接触到你那期待已久的女性特征");
         if(get_player().hasCock())
         {
            outputText("把你的[cocks]");
            if(get_player().hasCock() && get_player().balls > 0)
            {
               outputText("和[balls]");
            }
            outputText("推开");
         }
         else if(get_player().balls > 0)
         {
            outputText("把你的[balls]推开");
         }
         outputText("。慢慢地，你感觉到她那根宏伟肉柱宽大的冠状沟压在你的穴口上，撑开你的阴唇，让你的[clit]因期待而变硬，同时你的[butt]也在颤抖，等待着她的侵入。慢慢地，乌尔塔巨大的阴茎开始进入你。");
         if(get_player().vaginalCapacity() >= 100)
         {
            outputText("你饥渴的裂口急切地欢迎着她，乌尔塔轻松地滑入到底。");
         }
         else if(get_player().vaginalCapacity() > 60)
         {
            outputText("你感觉到它以最令人愉悦的方式撑开你，随着她越插越深，温暖跳动的肉棒填满了你。");
         }
         else
         {
            outputText("你因为被撑得太开而痛苦地皱起眉头，但随着乌尔塔慢慢地将自己推入你的深处，你变得越来越湿，你的[vagina]慢慢变得更湿润、更温暖，接纳了这个入侵者。快感开始压倒痛苦，你喘息出声。");
         }
         get_player().cuntChange(60,true,true,false);
         outputText("[pg]当乌尔塔将她勃起的肉棒插入你体内大约一英尺，然后继续推进时，你舒服地呻吟起来。你的内脏，连同所有敏感点，同时被这根撑开你的跳动肉柱刺激着，乌尔塔终于插到底了。");
         if(get_player().vaginalCapacity() >= 60)
         {
            outputText("乌尔塔勃起的肉棒似乎完全适应了你的深处，被你跳动的[vagina]湿润的肉壁完全包裹。");
         }
         else
         {
            outputText("你再次呻吟，感觉到乌尔塔的阴茎在伸展、变硬、跳动，血液在其中流淌。你感到完整，你的发情被这种美妙而巨大的东西填满的感觉进一步点燃。");
         }
         outputText("[pg]乌尔塔靠得更近，将她的大乳房压在你的[fullChest]上，同时伸手下去刺激你的");
         if(get_player().hasCock())
         {
            outputText("[cock biggest]");
         }
         else
         {
            outputText("阴蒂，");
            if(get_player().getClitLength() < 2.5)
            {
               outputText("用手指揉搓着那坚硬、受刺激的敏感点");
            }
            else
            {
               outputText("用手指抚摸你整个巨大的阴蒂，然后像对待阴茎一样套弄它");
            }
         }
         outputText("，让你有片刻时间适应她那巨大的阴茎并容纳它。");
         outputText("[pg][say:准备好被操了吗，亲爱的？]她把你的背推到墙上，然后抽出她的臀部和阴茎，接着又插了回去，让你因刺激而大叫。她开始用长而深的抽插猛烈地操你，她巨大的双性人肉棒将你撑得很开，让你很难感觉到或思考除了快感之外的任何事情。乌尔塔一边继续猛烈地操你，一边舔着你的[nipples]，你感觉到高潮正在快速逼近。这个性感的双性人狐狸精又猛撞了你几次，然后你放纵自己，向空荡荡的小巷墙壁宣告你的狂喜。");
         if(get_player().hasCock())
         {
            outputText("精液从[eachCock]喷涌而出，喷在乌尔塔腹部" + (get_noFur() ? "结实的肌肉" : "柔软的皮毛") + "上，然后随着她的抽插慢慢漏出。");
         }
         outputText("当你高潮时，你的小穴紧紧地夹住乌尔塔，");
         if(get_player().wetness() >= 4)
         {
            outputText("淫水在她的阴茎周围喷射而出，覆盖了乌尔塔的" + (get_noFur() ? "皮肤" : "皮毛") + "，浸湿了她的睾丸和阴茎根部。");
         }
         else
         {
            outputText("爱液从你体内大量流出，让乌尔塔阴茎的皮肤泛起明显的光泽，并蔓延到她的睾丸上。");
         }
         outputText("[pg]被你饥渴的小穴紧紧夹住，这个双性人狐狸发现自己无法控制，抓住你的[hips]，将你举起，更紧地压在墙上，开始拼命地操你，加快了抽插的速度和猛烈程度。你的[vagina]快乐地回应着过度刺激，跳向另一次高潮，但乌尔塔现在似乎更明显地关心她自己的快感。");
         outputText("[pg]你伸出手把玩你的[chest]和[nipples]，而另一只手则向下移动，开始取悦你的");
         if(get_player().hasCock())
         {
            outputText("[cock biggest]");
         }
         else
         {
            outputText("[clit]");
         }
         outputText("。乌尔塔在性感的呻吟和粗野的低吼之间交替，她自己的大腿也被她自己的分泌物稍微浸湿了，但她继续用她的肉棒抽插你。你们俩热情地接吻，她把乳房压在你的[chest]上，你趁机移动手去捏她的胸部，然后把一只手臂绕在她的脖子上，把她更紧地压在吻中。");
         if(!urtaLove())
         {
            outputText("[pg][say: 感觉太棒了！我要射了！]");
         }
         else
         {
            outputText("[pg][say: 你的小穴绝对是最棒的，亲爱的！我快到了！我要把你填满！]");
         }
         outputText("[pg]你大声呻吟，乞求乌尔塔把她巨大的精液射进你体内，确信这至少能平息发情，同时引发你自己的高潮。你们俩几乎同时达到高潮，她巨大的阴茎突然在你[vagina]里泵出一大波液体，就在它开始挤压和收缩的时候，爱液");
         if(get_player().wetness() >= 4)
         {
            outputText("四处喷射");
         }
         else
         {
            outputText("顺着她的阴茎和你的[butt]缝流下，在你们俩身上涂满了你们激情的证明");
         }
         outputText("。");
         outputText("[pg]乌尔塔前两波精液用滚烫粘稠的液体撑开了你的内壁，你的发情状态意识到它正在得到它需要的东西，并开始努力挤出更多。问题是，试图从乌尔塔那里得到更多可能会非常危险；一波又一波的精液从她的肉棒流出，流入你体内，当她抽插时，精液从她的肉棒侧面涌出，让你有了一个小肚子，然后随着她继续填满你，你的肚子变得相当大。授精引发了你的另一次高潮，");
         if(get_player().hasCock())
         {
            outputText("你自己的阴茎也对乌尔塔的做出了同样的反应，射出了精液，");
         }
         outputText("你的[vagina]");
         if(get_player().wetness() >= 4)
         {
            outputText("再次出发，用你的汁液涂满乌尔塔。");
         }
         else
         {
            outputText("挤压着她，试图榨干她的精液。");
         }
         outputText("[pg][say: 玛莱啊，[name]！操，你要把我榨干了！]");
         outputText("[pg]过了一会儿，她射出的量变小了，开始变得类似于正常男性射精的量，直到最后，她只是把精液滴进你体内。乌尔塔把你的脚放回地上，开始拔出。你感觉到她肉棒根部的皮肤离开了你，接着是她的肉棒，但你的小穴突然收紧，显然想把入侵者留在里面。");
         outputText("[pg][saystart]什么？");
         if(!urtaLove())
         {
            outputText("你还不满足吗？[sayend]");
         }
         else
         {
            outputText("你想继续吗，亲爱的？我想让你满足，所以我愿意花所有的时间！[sayend]");
         }
         outputText("[pg]你慢慢地点头，表达了继续的愿望。乌尔塔伴随着一声响亮的吧唧声把她剩下的阴茎从你体内拔出，她温暖的精液顺着你的[hips]流下，你的肚子稍微瘪了下去。她示意你转过身去，你明白了她的意思，撅起你的[butt]。狐狸抓住你的[hips]，把她半勃起但慢慢变硬的阴茎带回你洞口的入口。伴随着一次抽插，她的龟头再次进入你的[vagina]，你把臀部向后推向她，用你贪婪的繁殖洞吞噬她阴茎的一寸又一寸。");
         outputText("[pg]乌尔塔呻吟着，将她剩下的肉棒猛地插进你的体内，再次用她那非凡的马形生殖器填满你。然后，她开始从后面抽插你，她的肉棒撑开你的同时，她的腹股沟拍打着你的[butt]。");
         outputText("[pg]你伸手下去抚摸自己，你的[clit]");
         if(get_player().hasCock())
         {
            outputText("和[cocks]");
         }
         outputText("在交配的刺激下再次变硬。乌尔塔继续猛烈地撞击你的后背，轻轻拍打着你的[butt]。");
         if(!urtaLove())
         {
            outputText("[pg][say: 真是个贪婪的荡妇！]");
         }
         else
         {
            outputText("[pg][say: 你就这么想让你的性感狐狸配种吗？你满脑子想的都是我的肉棒用我的快乐汁液涂满你那饥渴的小穴吗？你会如愿以偿的，宝贝，放心吧！]");
         }
         outputText("[pg]当她加快速度，在你的小穴里抽插时，你在狂喜和期待中呻吟。你很确定在这个过程中你又高潮了一次，但你的心思完全集中在交配的最高潮时刻。它很快就到来了。乌尔塔将她的睾丸清空在你体内，用滚烫、粘稠的白色液体将你撑得大大的。");
         outputText("[pg]狐狸捏住你的[butt]，将自己完全插到底，你感觉到她的肉棒用她珍贵的精液涂满你最深处的内壁，它在你体内跳动和抽搐，将你撑得难以想象地宽，同时满足了你整个女性的特征，并将精液直接送入你的子宫。你完全沉浸在狂喜中大叫，因为");
         if(get_player().hasCock())
         {
            outputText("[eachCock]将精液射在小巷的地上，无助地");
         }
         else
         {
            outputText("你的[vagina]挤压并拉扯着她射精的肉棒，将自己的汁液漏在她的肉棒上，高潮的强度让你浑身颤抖");
         }
         outputText("。");
         outputText("[pg]乌尔塔瘫倒在你的背上，完全精疲力竭，她的肉棒慢慢变软，在你的脖子上喘着粗气。你这辈子从来没有觉得这么饱满过，她之前射出的大部分精液仍然留在你体内，现在除了她二十英寸的肉棒，还有另一大股温暖的双性精液。慢慢地，她拔了出来，你感觉到她半勃起的肉棒要离开你那诱导射精的通道，需要走过一段不可思议的漫长路程。");
         outputText("[pg][saystart]感觉太棒了！");
         if(!urtaLove())
         {
            outputText("要是我每次需要发泄的时候都能有你在身边就好了。");
         }
         else
         {
            outputText("你的小穴绝对棒极了，甜心：我希望我能帮你平静下来？你现在的发情期满足了吗？");
         }
         outputText("[sayend]");
         outputText("[pg]当你靠在墙上，把[butt]放在地板上时，你再次转向乌尔塔。你满足地叹了口气，感谢她帮你度过发情期，同时她的精液从你体内大量流出。");
         outputText("[pg][saystart]");
         if(!urtaLove())
         {
            outputText("没问题，我就是来帮忙的，[sayend]她眨了眨眼回答道。");
         }
         else
         {
            outputText("如果你需要我，我就在这里，亲爱的。只要能让你开心就好。你已经帮我解决了很多问题，所以我至少欠你一次。更不用说，和你做爱感觉绝对棒极了！[sayend]");
         }
         if(!urtaQuestDone())
         {
            if(!urtaLove())
            {
               outputText("[pg][say: 我们很安全。不管我射多少黏糊糊的精液进去，你都不会怀孕的。]");
            }
            else
            {
               outputText("[pg]她看起来有些伤心，或者至少在再次解释自己不孕的事实时，显得不那么高兴。");
            }
            outputText("她抓住你的手，帮你站了起来。");
         }
         else
         {
            outputText("[pg][say: 啊，[name]，你可能会怀孕的！]她跪在你面前，亲吻你的额头。[say: 我觉得世界上所有的避孕药都阻止不了这个……]");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,723) == 1)
            {
               get_player().knockUp(21,515,25);
               get_player().knockUp(21,515,25);
               get_player().knockUp(21,515,25);
            }
         }
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,12,FlagDict_Impl_.arrayReadInt(_loc1_,12) + 1);
         urtaLove(1);
         outputText("[pg]心满意足后，你们在这里分道扬镳，你离开时乌尔塔向你挥手，显然是在寻找什么东西。你的发情期现在稍微平静了一些，你发现自己正在回营地的路上，黏糊糊的精液顺着你的[legs]流下细细的痕迹，而你的[vagina]则拼命收缩，试图把它们都留在里面。");
         get_player().orgasm("Vaginal");
         dynStats(DynStat.Lib(1),DynStat.Sens(-2));
         dynStats(DynStat.Lust(0,DynStatOp.Eq));
         dynStats(DynStat.Lust(0,DynStatOp.Eq));
         dynStats(DynStat.Lust(0,DynStatOp.Eq));
         _loc1_ = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,13,FlagDict_Impl_.arrayReadInt(_loc1_,13) + 6);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function sateRutWithSoberUrtaButHuegDicked() : void
      {
         clearOutput();
         get_urta().urtaSprite();
         var _loc1_:int = get_player().biggestCockIndex();
         outputText("乌尔塔带着饥渴、急切的表情注视着你靠近的" + get_player().cockDescript(_loc1_) + "。她目不转睛地盯着它，掀起了她的");
         if(!urtaLove())
         {
            outputText("裙子");
         }
         else
         {
            outputText("连衣裙");
         }
         outputText("，她那巨大的马巴猛地弹起，拍打在她的双乳之间，先列腺液已经顺着顶端滴落。然而，当你靠近时，她的表情突然垮了下来，她的肉棒也开始萎缩。[say: 对不起，但是……那太大了！]她抗议道。[say: 你闻起来绝对棒极了，我也愿意尝试比平时大一点的，但那……那简直大得吓人——我绝对塞不下那个怪物！]她宣称。[say: 就算我有一根种马的肉棒，也不代表我有一个母马的屄！]");
         outputText("[pg]你茫然地盯着你的" + get_player().cockDescript(_loc1_) + "。你现在该怎么发泄呢？你抬起头，看到乌尔塔风情万种地向你走来，身前挺立着勃起的肉棒，脸上挂着调皮的笑容。[say:虽然我待会儿得自己解决这玩意儿，但我还是可以帮你一把……]她喉咙里发出性感的呼噜声。她跪在你面前，你不得不小心躲闪，以免她那二十英寸长的肉棒拍到你的[leg]。她自信地伸出手，先是一只手，然后是另一只手，握住了你的" + get_player().cockDescript(_loc1_) + "。");
         outputText("[pg]她的触感令人难以置信；她施加的压力恰到好处，她的手指在上下移动时，触碰到了所有最敏感的地方。她抚摸、她挠痒、她爱抚、她套弄，所有这些都带着你难以置信的专业技巧。你的呼吸卡在喉咙里，心脏狂野地跳动，回应着她带给你的强烈快感。");
         outputText("[pg][say: 找一个自己长着鸡巴的妞做情人的好处之一，]她评论道，试图听起来漫不经心，但脸上却挂着你见过的最大、最得意的坏笑。[say: 就是她完全知道怎么打飞机才舒服……]");
         if(!urtaLove())
         {
            outputText("[pg]乌尔塔可不是在空口说大话；你都不记得上一次打飞机这么爽是什么时候了，甚至连你自己动手的时候都没这么爽。没过多久，你就发现自己爆发性地射了，");
            if(get_player().cumQ() <= 50)
            {
               outputText("把精液溅到了乌尔塔的脸上");
            }
            else if(get_player().cumQ() <= 250)
            {
               outputText("用你的精液溅满了她的脸和奶子");
            }
            else
            {
               outputText("让这个震惊的狐狸兽人浑身沾满了你的精液");
            }
            outputText("；虽然你仍然有让有生育能力的雌性怀孕的冲动，但你的欲望暂时得到了满足。乌尔塔");
            if(get_player().cumQ() >= 500)
            {
               outputText("漫不经心地");
            }
            outputText("擦了擦脸上的精液，给了你一个友好的微笑。[say: 好了，这样应该感觉好多了；我知道那种欲火焚身却无处发泄的滋味。]她站起身来，手里还握着你的肉棒，捏了捏。[say: 在这期间，如果你想彻底放纵一下，我建议你去找点东西把它缩小。]");
            outputText("[pg]她带着令人惊讶的狐狸般的身体抖动和一声轻叹，转身快步回家，她的勃起在她身前上下跳动；显然，她打算用她的一些玩具来自己发泄一下。你重新穿好衣服，自己也往回走，试图弄明白你那非人类的繁殖发情期。");
         }
         else
         {
            outputText("[pg][say: 当然，]她补充道。[say: 还有比光用手好玩得多的东西，]她调戏着，然后低下头凑近，张开嘴，长长的、流着口水的舌头伸出来，轻轻舔舐着龟头。她小心翼翼地舔舐和吸吮，把龟头弄得又湿又滑，然后勇敢地开始吞咽，尽可能深地把它吞进去。你很快就能感觉到它顶到了她的喉咙深处，虽然她试图吞得更深，但她做不到；她的呕吐反射太强烈了，让她呛咳起来，口水顺着你的肉棒大量流下。");
            outputText("[pg]她把头拔出来，大口喘着气，用钦佩的眼神看着你。[say: 玛莱啊……你是怎么为我做到这一步的，亲爱的？]她震惊地问道。但随后，她又勇敢地把注意力转回你的" + get_player().cockDescript(_loc1_) + "上，舔舐、吸吮、用嘴含着龟头。与此同时，她那双灵巧的手继续对你长长的肉棒进行着不懈的攻势。她凑得更近了，让你靠在她的DD罩杯之间。[say: 你能感觉到我的心跳通过你的肉棒跳得有多快吗？你让我太兴奋了，]她发出满足的呼噜声。");
            outputText("[pg]毫不意外，你最终无法再忍耐，在乌尔塔准备好的嘴里释放了自己。");
            if(get_player().cumQ() <= 50)
            {
               outputText("她毫无怨言地把它们全吞了下去，当你把肉棒从她嘴里抽出来时，她舔干净了嘴唇上残留的液滴。");
            }
            else if(get_player().cumQ() <= 250)
            {
               outputText("她被你射入的量撑得脸颊鼓起，但她还是以令人钦佩的控制力咽了下去，大口喘着气。");
            }
            else
            {
               outputText("精液从她的唇间喷涌而出，但她固执地吸吮并尽可能多地吞咽，她的肚子因为突然涌入的精液而开始鼓起。当你停下来时，她流着精液，大口喘着气，但她骄傲地看着你的眼睛，甚至还打了个湿漉漉的嗝。");
            }
            outputText("[pg][say: 嗯……你尝起来真不错，亲爱的。不过，我更希望能把它喂进它该待的洞里，所以你为什么不试着把这个怪物缩小一点呢，嗯？]她建议道。她站起身来，带着令人惊讶的狐狸般的身体抖动和一声轻叹，转身快步回家，她的勃起在身前上下晃动；显然，她打算用她的一些玩具来寻找自己的释放。你重新穿好衣服，自己也往回走，试图弄明白你那非人的发情期。");
         }
         dynStats(DynStat.Lib(1),DynStat.Sens(-2),DynStat.Lust(0,DynStatOp.Eq));
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,13,FlagDict_Impl_.arrayReadInt(_loc2_,13) + 1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function sateRutWithSoberUrta() : void
      {
         var _loc1_:int = get_player().biggestCockIndex();
         clearOutput();
         get_urta().urtaSprite();
         outputText("乌尔塔用饥渴、急切的表情注视着你逼近的胯下。她的视线一刻也没有离开它，掀起裙子，她那巨大的母马肉棒向上甩起，拍打在她的双乳之间，先列腺液已经顺着龟头滴落下来。");
         outputText("[pg]眼前的景象让你停止了前进。不是因为对乌尔塔的身体感到厌恶——既然你以前和她做过爱，怎么会厌恶呢？不，问题是你不知道该怎么靠近她——她那苹果大小的蛋蛋挡住了路。");
         outputText("[pg]乌尔塔看着你，然后开始把自己从墙上推开，显然是打算转过身来，把屁股对着你，方便你进入。当你意识到这一点时，你突然行动，把她按回木板上。她疑惑地看着你，张开嘴想说话，你却用吻打断了她。当你们的舌头在她的嘴里交缠时，你伸手向下抓住了她的蛋蛋。它们太大了，一只手握不住，你不小心晃动了它们。乌尔塔在刺激下呻吟和呜咽，在漫长的几分钟里，你抚摸和爱抚着她肿胀的睾丸，先列腺液开始从她膨大的龟头冠状沟流出，涂抹在她美丽的DD罩杯大乳房和你自己的[chest]上。你能感觉到她的乳头摩擦着你的乳头，接触时电流的火花在你们两人身上涌动。最后，你终于笨拙地托起她的蛋蛋，让你的" + get_player().cockDescript(_loc1_) + "能够接触到她流着淫液的黑色下体。");
         if(!urtaLove())
         {
            outputText("[pg][say: 是的——给我！]");
         }
         else
         {
            outputText("[pg][say: 哦，是的！难得换成你拼命想把它插进我身体里，感觉真好。你知道，我喜欢被你渴望的感觉。现在给我！]");
         }
         outputText("她含着你的舌头含糊不清地说，如此沉浸在欲望中，她根本不在乎你们在哪里。确实，看来你的小双性狐狸兽人有点暴露狂的倾向……");
         outputText("[pg]好吧，你不打算让这位女士等得太久，你把它滑了进去，一旦你安全进入，就让她的睾丸垂下来。那球状的器官在你的" + get_player().cockDescript(_loc1_) + "上弹跳，在你的肚子上前后摇晃，随着你们两人的每一个动作而晃动，乌尔塔的肉棒被紧紧夹在你们的身体之间，夹在她的双乳之间。");
         outputText("[pg]乌尔塔终于结束了亲吻，色眯眯地看着你。[say: 变态的[boy]……]她调戏你，[say: 但我喜欢。]她立刻开始前后摇晃，试图同时让自己的身体不断被你的肉棒刺穿，并在你们的身体之间摩擦她自己巨大的肉棒。");
         if(urtaLove())
         {
            outputText("[say: 你是唯一一个接受我每一部分的人，]她告诉你，一只手深情地抚摸着你的脸颊。");
         }
         outputText("[pg]你只是呻吟着回应，你被欲望冲昏了头脑，只能集中注意力在你被她的女性特征包围的事实上。你前后抽插，你的" + get_player().cockDescript(_loc1_) + "在她的体内深处涌动，然后湿漉漉地拔出，接着又滑了回去。你轻咬和亲吻她突出的乳头，让这只母狐狸高兴地发出呼噜声，她也回吻了你。她的前面现在沾满了先列腺液，她的龟头喷涌着液体，就像喷泉一样，你忍不住弯下腰，玩弄她的龟头。当你猥亵她的双性器官时，她高兴地" + (get_noFur() ? "喘息" : "尖叫") + "和咆哮，你的舌头在龟头周围游走，舔舐着流出的甜美先列腺液。她让你感到惊讶，她伸长脖子，自己也开始舔舐，她又长又宽的舌头熟练地卷住她宽大的龟头冠状沟。你们俩把它当成了一场游戏，看谁能舔得更好，偶尔在这样做的时候，你们的舌头还会滑过对方的舌头。");
         outputText("[pg]一直以来，乌尔塔快乐的小穴有节奏地挤压和榨取着你，即使你急切地将自己插入她的深处。");
         outputText("[pg]毫不意外，在你们两人中，是乌尔塔先失去了控制。她像狐狸一样仰起头嚎叫着，她高潮了——她的小穴像老虎钳一样紧紧夹住你，甚至当她的女性淫液喷涌而出，溅在你的胯下时。像你这样紧贴着她，她的蛋蛋在你的" + get_player().cockDescript(_loc1_) + "上弹跳，她的肉棒夹在你们的身体之间，当她肿胀的蛋蛋终于开始收缩时，你能感觉到每一寸，浓稠的双性精液顺着她又长又宽的母马肉棒涌上来，鼓包在你们的肚子前荡漾，最后，它们到达龟头，喷射到空气中。滚烫、咸咸的精液像浓稠、黏糊糊的斑点一样，像雨点般落在你们俩的脸上。沉浸在这一刻中，你仰起头，试图用嘴接住一些，乌尔塔也不假思索地模仿了这个动作。");
         outputText("[pg]最后，你自己的" + get_player().cockDescript(_loc1_) + "达到了极限，在乌尔塔体内爆发了");
         if(get_player().hasVagina())
         {
            outputText("，引发了你[vagina]的共同爆发");
         }
         outputText("。你们俩大口喘着粗气，显然都精疲力竭了……但你的荷尔蒙仍在沸腾，你的" + get_player().cockDescript(_loc1_) + "在她体内并没有完全软化。没过多久，你又硬了起来；一喘过气，你们就又开始了。你都数不清做了多少次——也许三四次？——但最后你实在太累了，甚至你的发情期都得到了满足，至少现在，你已经把乌尔塔彻底喂饱了。");
         outputText("[pg]当你们终于结束时，你和乌尔塔都成了一副惨状，浑身沾满了黏糊糊的精液。谢天谢地，你的衣服还好，但乌尔塔的衣服已经一团糟了。你们俩都不在乎，依然紧紧抱在一起。最后，伴随着湿润的吸溜声，你把自己从乌尔塔的小穴里拔了出来，让她那现在已经疲软的阴茎在空气中沉甸甸地晃荡着，从你们的身体之间剥离。乌尔塔打量着你，好笑又难以置信地摇了摇头。");
         outputText("[pg][say:真是一团糟……不过，说实话，这很值得。现在感觉好点了吗？]她问你。当你慢慢点头时，她笑了笑，然后开始脱下她那沾满精液的衣服，直到她随意地赤裸在你面前。她");
         if(urtaLove())
         {
            outputText("带着调情的眨眼向你飞吻，然后");
         }
         outputText("用衣服干燥的部分擦掉了" + (get_noFur() ? "皮肤上" : "皮毛里") + "最糟糕的精液。她调皮地走到垃圾桶前，把衣服扔了进去。");
         if(urtaLove())
         {
            outputText("她的臀部故意以一种迷人的方式摇摆着，尾巴左右甩动，让你能诱人地瞥见她那仍在滴水的小穴和下面现在已经疲软的阴茎。");
         }
         outputText("你看着她用爪子撬开一块松动的石头，移开它露出了一个小隔间，她从里面拿出一套备用衣服。");
         if(urtaQuestDone())
         {
            outputText("[pg]你问乌尔塔她打算怎么办；你都没机会用避孕套。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,723) == 1)
            {
               outputText("[pg][say:那我们只能祈祷了，不是吗，[name]？]");
            }
            else
            {
               outputText("[pg][say:我现在吃了那么多避孕药，就算有那么多精液射在里面，我也不太可能怀孕。][pg]你松了一口气，转身走向城市的街道。");
            }
            get_urta().knockUpUrtaChance();
            get_urta().knockUpUrtaChance();
            get_urta().knockUpUrtaChance();
         }
         else
         {
            outputText("[pg]她漫步走到你面前，在你的鼻子底下挥了挥手指，带着调皮的嘲弄。");
            if(!urtaLove())
            {
               outputText("[saystart]你最好学会控制自己，" + get_player().mf("先生","小姐") + "。");
            }
            else
            {
               outputText("[saystart]但你应该学会控制自己，情[boy]。");
            }
            outputText("我宁愿在自己家里做这种事，也不愿在大街上做。[sayend]");
            outputText("[pg]你得意地笑了笑，告诉她你不能保证。她在你的[butt]上拍了一下，声音在墙壁间回荡，然后漫步离开了。你松了一口气，转身走向城市的街道。");
         }
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,12,FlagDict_Impl_.arrayReadInt(_loc2_,12) + 1);
         urtaLove(1);
         _loc2_ = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,1033,FlagDict_Impl_.arrayReadInt(_loc2_,1033) + 1);
         dynStats(DynStat.Lib(1),DynStat.Sens(-2),DynStat.Lust(0,DynStatOp.Eq));
         _loc2_ = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,13,FlagDict_Impl_.arrayReadInt(_loc2_,13) + 6);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function sateRutWithDrunkUrtaWithHugeDick() : void
      {
         clearOutput();
         get_urta().urtaSprite();
         outputText("乌尔塔爬到你身上，将她湿润的肉缝压在你的龟头上。她确实试图把它弄进去，但被撑开的疼痛很快让她意识到，即使她成功了，这场性爱也不会有多愉快，反而会相当痛苦。她沮丧地呻吟和咆哮着，从你身上爬起来，把她苹果大小的睾丸压在");
         if(get_player().balls > 0)
         {
            outputText("你自己的[balls]上");
         }
         else if(get_player().hasVagina())
         {
            outputText("你的[clit]上");
         }
         outputText("你的[hips]之间");
         outputText("。");
         outputText("[pg]有时候，这玩意儿能变得这么大，简直就是个废物，你个笨蛋。见鬼，我都知道这一点，而且我还比你小呢！");
         outputText("[pg]她将她那依然令人印象深刻的双性人肉棒压在你的[cock biggest]上，用双手环住你们贴在一起的肉棒，开始给它们手淫。");
         outputText("[pg][say: 我也欲火焚身了！我本来准备好要给你来一场痛快淋漓的性爱的，但你非得给自己长个他妈的怪物！]");
         outputText("[pg]她的肉棒和睾丸压在你的[cock biggest]上带来的温暖，以及她熟练但有些粗暴地揉捏你们贴在一起的器官，确实给了你相当大的快感，但你意识到，如果乌尔塔真的把你那跳动的阴茎放进她那湿润、紧紧挤压的小穴里，感觉会好得多。");
         outputText("[pg][saystart]你到底为什么需要这么大的鸡巴？他妈的怪物都不需要这么大就能满足了！你是不是想");
         if(get_player().biggestCockArea() < 150)
         {
            outputText("跟牛头人比大小吗？");
         }
         else
         {
            outputText("创个世界纪录什么的？");
         }
         outputText("[sayend]");
         outputText("[pg]她对你[cock biggest]的动作变得更加粗暴、狂野，你的阴茎紧贴着她的肉棒。但你意识到你们都处于高潮的边缘，她只是想快点结束，发泄自己的欲望。你的[cock biggest]开始大量分泌先列腺液，你的阴茎上沾满了乌尔塔的分泌物。你红着脸发现，她湿润的小穴里流出的淫液顺着她的睾丸和你的身体，一直流到了你的[asshole]。");
         outputText("[pg]乌尔塔开始发出轻柔的呜咽和呻吟，她的肉棒在你的阴茎上抽动得越来越剧烈，她撸动的手也越来越快。你无法控制自己，也抓住了你们贴在一起的阴茎，现在有四只手在同时套弄乌尔塔那马一样的勃起和你的[cock biggest]。");
         outputText("[pg][say: 操——操！要射了！]");
         outputText("[pg]你们的高潮几乎是同步的，乌尔塔的阴茎快速跳动的感觉，以及她的精液涂满你[cock biggest]龟头的感觉，足以引发你自己的高潮。");
         if(get_player().cumQ() <= 50)
         {
            outputText("你射得满[chest]都是，而乌尔塔则将浓稠的狐狸精液喷洒在你的阴茎和上半身，其中一发还落在了你的嘴唇上。");
         }
         else if(get_player().cumQ() <= 500)
         {
            outputText("当乌尔塔的肉棒痉挛着，开始用温暖的双性人精液覆盖你的[cock biggest]和[chest]时，你感觉到一股精液涌过你的阴茎，在乌尔塔发情、温暖的身体下猛烈地喷射，力度之大甚至溅到了你的脖子上，甚至有几滴精液沾到了她丰满的乳房上。乌尔塔本能地舔了舔你的一些精液，但量实在太多了，你感觉自己身上沾满了你和她的精液。");
         }
         else
         {
            outputText("你[cock biggest]里的水坝决堤了，精液四处喷射，甚至让乌尔塔那令人印象深刻的高潮都相形见绌。你射得太多了，" + (get_noFur() ? "" : "她下半身的毛发") + "都被精液覆盖了，浓稠的精液覆盖了她的乳房，你的[chest]几乎被浓稠的白色粘液淹没，在她的撸管手下，你甚至给自己来了个颜射。");
         }
         outputText("[pg]乌尔塔从你们俩的阴茎里挤出最后几滴精液，看着你沾满精液的身体，一半满足，一半恼火。她从你身上下来，你注意到你吸引了不少观众。乌尔塔的手伸向她滴水的阴道，掰开它，把一根手指插了进去。你意识到这一定是她沮丧的原因；虽然她射了一发，但这一次，她更兴奋的是她的女性部位。");
         outputText("[pg][say: 去把自己洗干净。如果你要到处乱跑，闻起来像你那么渴望、准备好让人怀孕，至少让你的那根愚蠢的怪物鸡巴能塞进别人身体里！]");
         outputText("[pg]她以一种对于喝了几杯酒、身上沾满精液的人来说不同寻常的优雅和敏捷跳下桌子，走到桌边结账。与她的话相反，她看起来有些悲伤和失望，既对你，也对她自己。");
         outputText("[pg]意识到和她说话没有意义，而且你已经有些满足了，你回到了你的营地。");
         dynStats(DynStat.Lib(1),DynStat.Sens(-1),DynStat.Lust(0,DynStatOp.Eq));
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,13,FlagDict_Impl_.arrayReadInt(_loc1_,13) + 1);
         _loc1_ = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,12,FlagDict_Impl_.arrayReadInt(_loc1_,12) + 1);
         urtaLove(1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function notInterestedInUburDrunkUrtaRuts() : void
      {
         clearOutput();
         get_urta().urtaSprite();
         outputText("你说今天看起来不一样的是她，然后轻轻推开她，道了歉便离开了。");
         if(get_player().face.type == 2)
         {
            outputText("你的鼻子似乎察觉到，乌尔塔在你身后仍然异常兴奋。");
         }
         if(get_player().get_inRut() && get_player().hasCock())
         {
            outputText("[EachCock]抽搐着，抗议你留下一个愿意献身的伴侣。");
         }
         if(get_player().tongue.type == 1)
         {
            outputText("你本能地品尝着空气，乌尔塔突然显得无比美味。");
         }
         if(get_player().get_inRut() && get_player().hasCock())
         {
            outputText("你的[cocks]在裤子里硬了起来，但你仍然强迫自己离开。");
         }
         else
         {
            outputText("你的身体状况似乎在抗议你留下这样一个愿意献身的伴侣，但现在不是放纵的时候。");
         }
         dynStats(DynStat.Lust(5 + get_player().lib / 20),DynStat.NoScale);
         menu();
         addButton(0,"继续",get_telAdre().barTelAdre);
      }
      
      public function keepTeasingDatHornyFawkes() : void
      {
         clearOutput();
         get_urta().urtaSprite();
         outputText("你得意地笑了；这里的事情才刚刚开始变得有趣，你为什么要停下来呢？你开始更加卖力地表演，向酒馆里的所有人展示你的气味和你的身体，而不仅仅是那个在你面前狂热地自慰的醉酒双性狐狸兽人。你不记得在来到玛瑞斯之前是否跳过舞，但你觉得你为周围的观众表演的业余脱衣舞还不错。你慢慢地脱下你的[armor]，性感地将它们丢弃，弯下腰，让乌尔塔和酒馆里任何长着肉棒的角色都能清楚地看到你的[vagina]，");
         if(get_player().balls > 0)
         {
            outputText("淫荡地托起并抚摸你的[balls]，");
         }
         outputText("为了那些长着小穴的人，你开始慢慢地抚摸和爱抚你的[cocks]。");
         outputText("[pg]当你性感地转过身再次面对乌尔塔时，你惊讶地发现她已经停止了玩弄自己的器官；相反，她的双手紧紧地握住她的肉棒，就在包皮上方。你脸上露出夸张的失望表情，自信地走到乌尔塔面前，戏弄她怎么了；她不想高潮吗？她的蛋蛋——你停下来调皮地摇晃它们——充满了精液；难道现在不是放纵一下，把它们都射出来的时候吗？");
         outputText("[pg]听到这话，她猛地睁大眼睛——眼底燃烧着疯女人般的光芒。[say:没错！]她大叫着，突然把她的肉棒拉过来，让龟头直直对着你受惊的脸，然后松开了手。一股如同瀑布般的精液喷涌而出，喷得你浑身都是！你大口喘息着，结结巴巴，大团咸腥的黏液射进你的嘴里，黏住了你的[hair]，把精液喷满了你的[chest]，遮蔽了你的视线，让你在突如其来的猛攻下踉跄后退。你双手撑地，");
         if(get_player().isGoo() || get_player().hasTailInsteadOfLegs())
         {
            outputText("用你[legs]上类似膝盖的部位撑在地上");
         }
         else
         {
            outputText("跪在地上。");
         }
         outputText("[pg]当你语无伦次、咳嗽不止时，你听到有脚步声靠近；终于设法擦干眼睛，你抬起头，看到你被一群扶他包围了，周围正在进行一场狂乱的群交派对。你没有时间去清楚地辨认他们是什么，因为你的注意力立刻被无数形状各异的肉棒吸引了，它们都指着你，都在颤抖着，渴望释放出被灵巧的手挑逗出来的精液……");
         outputText("[pg]然后你又看不见了，因为精液从四面八方喷向你，一场精液的倾盆大雨浸透了你的脸，喷在你的背上，糊在你的头发上，涌过你的胸部，在你的屁股上汇成水洼。你被从四面八方喷射，笑声、胜利的呼喊声和嘲笑声在你的耳边回荡。直到你完全被精液糊满，他们才停下来；只有在那时，洪流才平息下来。你咳嗽着，把咸咸的液体从嘴里和鼻子里咳出来，慢慢地站起来，抓起你的[armor]，然后");
         if(get_player().cor < 50)
         {
            outputText("逃离");
         }
         else
         {
            outputText("得意洋洋地走开");
         }
         outputText("离开了湿身婊酒馆那喧闹的群交派对；这名字真是名副其实。");
         dynStats(DynStat.Lust(15 + get_player().lib / 10));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function interestedInUburDrunkurtaRuts() : void
      {
         var chosenSex1:int;
         var _g1:UrtaHeatRut;
         var chosenSex:int;
         var _g:UrtaHeatRut;
         clearOutput();
         get_urta().urtaSprite();
         outputText("你挑了挑眉，问乌尔塔是否介意告诉你她如此关注你的原因，以及你到底闻起来像什么。");
         if(get_player().get_inRut() && get_player().get_inHeat() && get_player().hasCock() && get_player().hasVagina())
         {
            outputText("[pg][say: 天哪，真性感！你闻起来就像是走进来生孩子的——就像你想抓住那些女孩和扶他，把她们灌满精液，同时又让那些男人和扶他把你的贪婪小穴塞满婴儿果汁，让你也怀孕一样。这是有史以来最好的味道……]");
         }
         else if(get_player().get_inRut() && get_player().hasCock())
         {
            outputText("[pg][say: 嗯，让我这么说吧：你闻起来就像是走进来抓住这里每个女孩的臀部，然后连续几个小时地繁殖她们，直到她们全部怀孕。]");
         }
         else if(get_player().get_inHeat() && get_player().hasVagina())
         {
            outputText("[pg][say: 嗯，让我这么说吧：你闻起来就像是走进来挑逗和勾引这里的每一个男人和扶他……像女王一样大步走到场地中央，然后脱掉衣服，弯下腰，让自己被操和繁殖几个小时，直到你彻底怀孕。]");
         }
         if(get_player().get_inRut() && get_player().get_inHeat() && get_player().hasCock() && get_player().hasVagina())
         {
            outputText("乌尔塔因欲望而颤抖，令你震惊的是，她开始公然抚摸她那巨大的肉棒");
            if(!urtaLove())
            {
               outputText("在她的裙子下面");
            }
            else
            {
               outputText("透过她迅速湿透的裙子");
            }
            outputText("。[say: 操，但你闻起来太棒了……女神啊，我不知道我更想要你的哪一部分！给我一点，性感的人……求你了！]她绝望地乞求你。");
            outputText("[pg]你是要把你的肉棒给她？还是你的小穴？或者你就站在这里，看着她在酒吧中间自慰？");
            menu();
            _g = this;
            chosenSex = 1;
            addButton(0,"肉棒",function():void
            {
               _g.drunkUrtaIntroPartDuex(chosenSex);
            });
            _g1 = this;
            chosenSex1 = 2;
            addButton(1,"小穴",function():void
            {
               _g1.drunkUrtaIntroPartDuex(chosenSex1);
            });
            addButton(2,"旁观",watchDrunkRuturtaJerkoff);
         }
         else if(get_player().get_inRut() && get_player().hasCock())
         {
            drunkUrtaIntroPartDuex(1,false);
         }
         else
         {
            drunkUrtaIntroPartDuex(2,false);
         }
      }
      
      public function drunkenUrtaFucksPCInHeat() : void
      {
         clearOutput();
         get_urta().urtaSprite();
         outputText("你只是对她微笑，用鼻子深吸了一口气；你发誓你能闻到她的双性人麝香，从她身上散发出来的味道，就像你自己的费洛蒙从你身上散发出来一样强烈。那种美妙的、泥土般的、原始的气味，一个健康、准备好并愿意交配的繁育者的气味……没有什么比这更美妙的了。");
         if(!urtaQuestDone())
         {
            outputText("你知道她不能给你生孩子……但是，说实话，在这一刻，你根本不在乎。她那美妙的种马阴茎就在那里，准备就绪，全都是为了你。");
         }
         else
         {
            outputText("你隐约记得乌尔塔可能有生育能力，但她就在那里，她那巨大的母马阴茎正滴着水，准备插入你成熟的[vagina]并让你怀孕。你已经不在乎了；你想要她的孩子！");
         }
         outputText("[pg]乌尔塔的眼睛里闪烁着情感的光芒，她弯下腰又给了你一个吻，然后粗暴地抓住她的");
         if(!urtaLove())
         {
            outputText("裙子");
         }
         else
         {
            outputText("连衣裙");
         }
         outputText("并把它撩起来，露出她那正滴着先列腺液的肉棒。一股稳定的女性淫液从她的阴唇中流出，渗过她苹果大小的睾丸，滴答滴答地落在地板上，但乌尔塔根本不在乎；她太专注于把她的男性象征插入你准备好的小穴里，以至于没有注意到她女性的冲动。");
         outputText("[pg]狐狸兽人尴尬而又不情愿地后退，她柔软的手指带着爪状的指甲在你身上色情地游走，以一种让快感火花在你的大脑中涌动的方式玩弄着你的[nipples]，直到最后她到达了你的胯部。她给了你一个温柔的假笑，低下头，直到她的脸悬停在你的[vagina]上方，戏剧性地嗅着从你肥沃的繁殖洞中升起的气味，然后把鼻子伸了进去");
         if(get_player().hasCock())
         {
            outputText("，不耐烦地推开你的[cocks]");
            if(get_player().balls > 0)
            {
               outputText("和你的[balls]");
            }
            outputText("去够下面的女性孔口");
         }
         outputText("。当你的[vagina]被填满时，你高兴地大叫起来，" + (get_noFur() ? "" : "她柔软的皮毛刷过你的内壁") + "然后她尽可能地张大嘴巴，伸出舌头。那又长又宽的狐狸舌头滑出并深入你的深处，抚摸着内壁，舔舐着你的汁液，");
         if(get_player().getClitLength() < 2.5)
         {
            outputText("玩弄着你的[clit]");
         }
         else
         {
            outputText("舔舐着你巨大的快感豆，把它吸进嘴里吮吸");
         }
         outputText("，让你不停地扭动和尖叫，直到你以为光是被舔穴就要高潮了。");
         if(get_player().wetness() >= 4)
         {
            outputText("仿佛是为了强调这一点，你那发出吧唧声、被吸吮着的小穴突然喷出了一股淫液，喷了乌尔塔一脸，让她震惊地摇了摇头，抽身而出。");
         }
         else
         {
            outputText("似乎感觉到了你即将到来的高潮，乌尔塔把头从你的[vagina]里移开，给了你一个傲慢的笑容，摇了摇头。");
         }
         outputText("[pg]既然你已经被充分润滑了，乌尔塔突然向你扑来，直接跳到你身上，同时把她巨大的肉棒插入你的[vagina]。");
         if(get_player().vaginalCapacity() < 60)
         {
            outputText("乌尔塔的肉棒又长又粗，足以让一匹种马感到自豪，而且大得让人不舒服。它那惊人的周长和膨大的龟头冠状沟在你的开口处卡住，然后这个被欲望冲昏头脑的扶他狐狸粗暴地把它挤了进去，不耐烦地把一寸又一寸粗壮的扶他肉棒塞进你的下唇。如此又长又宽的东西突然入侵，把你可怜的小穴撑得大大的，但在你被欲望迷住的脑海里，震惊和痛苦仅仅变成了快感。");
         }
         else
         {
            outputText("乌尔塔巨大的肉棒就像一只手戴进舒适的手套一样适合你，当它滑入时，你高兴地嚎叫起来，在所有正确的地方拉伸你，能够感觉到它表面上的每一个肿块和静脉，膨大的龟头刺入你最深的地方。");
         }
         get_player().cuntChange(60,true,true,false);
         outputText("[pg]像动物一样，乌尔塔开始前后摇摆，带着野蛮的渴望疯狂地把她的肉棒插入你体内，用如此大的力量撞击你，以至于桌子发出嘎吱嘎吱的呻吟声，如果你不是太沉浸在自己的快感中而不在乎的话，这将会非常令人担忧。你在狂喜中向后仰起头，短暂地瞥见了周围酒吧里的情况。看起来其他人也很享受这场表演——你看到好几对情侣或三人行开始接吻、互相爱抚，甚至开始自己做爱。");
         outputText("[pg]乌尔塔平时的羞涩似乎被遗忘了——她平时的礼貌也是如此，因为她根本不注意你的[clit]");
         if(get_player().hasCock())
         {
            outputText("甚至你的[cocks]");
         }
         outputText("，尽管她通常试图让你感觉同样好。她开始以比以前更大的力量插入你。你在她身下呻吟和呜咽；部分是因为被如此粗暴、如此胜利地占有的快感，部分是为了刺激她，让她感到更加兴奋和像个阿尔法雄性。");
         outputText("[pg]这招奏效了。乌尔塔发出一声胜利的嚎叫，她的肉棒终于在你体内爆发，滚烫咸腥的精液如洪水般涌入你的体内。随着她将一股又一股的精液射入你体内，你的肚子咕噜作响并鼓胀起来，子宫里灌满了她的双性人种子。当你的爱液也喷涌而出时，你发出了狂喜的叫喊，你的[vagina]正尽最大努力从你的狐狸情人那里榨取尽可能多的精液。当你的肚子膨胀成一个小肚腩，最后几股精液溅入你的子宫时，你等待着精疲力竭的乌尔塔拔出来……然后你意识到乌尔塔的肉棒并没有变软。你能感觉到它开始松弛，但基本上还是勃起状态，深呼吸了几次后，乌尔塔开始再次向你挺进，她的勃起在你体内迅速变硬变挺，直到她再次猛烈地撞击你，就像之前一样凶猛。她再次将种子喷洒在你体内，但她的勃起依然没有疲软；尽管她的大部分精液都被她那粗壮的肉棒和埋在你体内那宽大的龟头冠状沟堵在里面，但还是有大量的精液从你体内漏出并滴落下来，顺着你的[butt]流下，在桌子上汇聚成一滩。");
         outputText("[pg]当你躺在桌子上，因为你的情人用只有她才能做到的方式填满你而狂喜地扭动挣扎时，湿身婊酒馆里的其他酒客在你周围陷入了一场混乱的群交，你脑子里想的只有向乌尔塔索要更多。而她也确实给了你更多；当你最终失去意识时，你最后看到的是你的肚子，因为乌尔塔的精液而变得巨大肿胀，在你上方晃动着。");
         get_player().cuntChange(60,true,true,false);
         outputText("[pg]<b><u>过了一会儿……</u></b>");
         outputText("[pg]当你醒来时，你发现自己身处一个陌生的环境中——你意识到自己躺在床上。当你看到那个双性狐狸兽人坐在你旁边带软垫的座位上，小心翼翼地用一条湿毛巾捂着她的胯部时，你很快就明白这是乌尔塔的床了。[say: 嗯……嗨，]她害羞地说。[say: 刚才那事……好吧，我不会说我不喜欢，但我估计我这一个星期都硬不起来了，]她告诉你。[say: 还有，以后我们能不能尽量在私底下做这种事？守卫队长不仅带头搞公开群交，还需要被水管冲好几分钟才能停止操人，这影响太不好了。]");
         outputText("[pg]你小心翼翼地动了动，因为自己的酸痛而皱了皱眉，你告诉她你以后会尽量这样做的。");
         if(urtaQuestDone())
         {
            outputText("[pg]你犹豫地问她你们俩现在该怎么办；你当时在发情期，而且你很清楚她没有戴避孕套。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,723) != 1)
            {
               outputText("[pg]乌尔塔笑了笑，告诉你幸运的是她一直在吃避孕药。");
            }
            else
            {
               outputText("[pg]乌尔塔幸福地微笑着，[say: 我知道，这不是很棒吗？]");
            }
         }
         outputText("[pg]乌尔塔把衣服递给你，并帮你穿上；这其中没有任何色情的成分，因为你们俩都太累了，暂时还无法再次做爱。你穿好衣服后，开始往外走……就在这时，乌尔塔突然抓住你的肩膀，然后吻了你。[say: 我可没说我不喜欢，]她突然宣布，让你感到困惑，然后她轻轻地把你推出了门。");
         outputText("[pg]走回营地的路相当痛苦，但你死不了。杀不死你的会让你更强大，诸如此类的……");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,723) == 1)
         {
            get_player().knockUp(21,515,25);
            get_player().knockUp(21,515,25);
            get_player().knockUp(21,515,25);
         }
         dynStats(DynStat.Lib(2),DynStat.Sens(-4),DynStat.Lust(0,DynStatOp.Eq));
         dynStats(DynStat.Lust(0,DynStatOp.Eq));
         dynStats(DynStat.Lust(0,DynStatOp.Eq));
         dynStats(DynStat.Lust(0,DynStatOp.Eq));
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,13,FlagDict_Impl_.arrayReadInt(_loc1_,13) + 24);
         _loc1_ = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,12,FlagDict_Impl_.arrayReadInt(_loc1_,12) + 1);
         urtaLove(1);
         doNext(get_camp().returnToCampUseFourHours);
      }
      
      public function drunkUrtaRidesARutPCsCock() : void
      {
         clearOutput();
         var _loc1_:int = get_player().biggestCockIndex();
         get_urta().urtaSprite();
         outputText("你决定不反抗这个局面；说实话，看到火辣的双性人狐狸爬到你身上，这景象点燃了你的欲望，以一种你认为自己无法安全忽视的方式呼唤着你的发情期。");
         outputText("[pg]乌尔塔抬起她的睾丸，将你已经坚硬的阴茎压在她黑色的阴唇上，证明了你的决定是正确的。慢慢地，你感觉到你的龟头沉入她体内，然后是你剩下的部分，她发出一声轻柔的呻吟。她继续向下压，强迫你的" + get_player().cockDescript(_loc1_) + "进入她湿润的裂口，直到你感觉到她的屁股压在你的");
         if(get_player().balls > 0)
         {
            outputText("[balls]");
         }
         else
         {
            outputText("[hips]");
         }
         outputText("，而她自己的睾丸舒服地放在你的腹部。当你感觉到她的小穴慢慢收紧并按摩你的" + get_player().cockDescript(_loc1_) + "时，她咬紧牙关，你则发出呻吟作为回应。乌尔塔开始在你的阴茎上上下弹跳，用她的大腿和屁股撞击你的身体，完全不介意她自己巨大的马肉棒甩来甩去，偶尔还会打在你的胸膛上。她让她的舌头在空气中弹动了一下，发出愉悦的呻吟，然后加快了速度，开始在饥渴的通道里疯狂地抽插你的阴茎。");
         outputText("[pg]在你疯狂的配种状态下，面对这只母狐狸热情的求爱，你无法克制自己太久，你");
         if(get_player().balls > 0)
         {
            outputText("感觉到你的蛋蛋在翻腾");
         }
         else
         {
            outputText("感觉到从你的" + get_player().cockDescript(_loc1_) + "一直蔓延到脊椎的酥麻感");
         }
         outputText("，这预示着你的阴茎已经准备好将浓稠的精液射入正在你身上弹跳的痴女双性人体内。你试图告诉她，但她并没有放慢速度。片刻之后，");
         if(get_player().cumQ() <= 50)
         {
            outputText("你将浓稠的精液射入了她的小穴");
         }
         else if(get_player().cumQ() <= 250)
         {
            outputText("你在她体内爆发，用一波又一波温暖浓稠的精液填满了她");
         }
         else
         {
            outputText("你不断地将大量的精液射入她体内。狐狸的肚子鼓了起来，精液顺着大腿流到桌子上，而她继续在你身上骑乘");
         }
         outputText("。当你射精时，狐狸的小穴开始挤压收缩，你意识到这个双性人也高潮了。更浓稠的白色液体突然从她的肉棒顶端大量滴落，偶尔还会射到半空中。");
         outputText("[pg][say: 啊，这热身真不错。现在，我们只需要继续把你榨干，直到你感觉好些。也许在那之后，我也会难得地感到满足……]");
         outputText("[pg]你的" + get_player().cockDescript(_loc1_) + "试图在乌尔塔体内软下来，但狐女强大的内部肌肉突然开始在她体内蠕动，按摩着你的阴茎，并在她用女性部位摩擦你时，将剩余的精液从你的尿道中挤出。片刻之后，你再次完全勃起，乌尔塔在你身上越来越用力地摇晃着臀部。这一次，她用手握住自己的肉棒，开始在中间部分摩擦，在你喂饱她女性部位的同时，自慰着她双性人身体的男性部分。");
         outputText("[pg]乌尔塔开始微微左右摆动臀部，然后上下起伏，交替着动作，寻找哪种动作对你们俩更刺激。她继续自慰着她现在已经勃起的肉棒，并允许你的手在她身上游走，揉捏她的臀部、屁股、腰部，然后是乳房，同时她的另一只手抚摸着你的胸膛和乳头。");
         outputText("[pg][say: 操，这感觉太爽了。]");
         outputText("[pg]你很赞同，狐狸的小穴按摩着你肉棒的根部和中段，保证了这种感觉会持续下去。");
         if(get_player().hasKnot(_loc1_))
         {
            outputText("你慢慢感觉到血液流向你勃起的阴茎，根部的肉结似乎开始膨胀");
         }
         else
         {
            outputText("你不介意保持这个姿势更久，更久，而在你身上的双性人似乎也同意这一点");
         }
         outputText("。你鼓起有些疲惫的力量，将她的臀部拉得更深，然后开始用你自己的抽插来回应双性人的摇晃和弹跳。这加剧了快感，让你的情人惊讶地叫了一声，然后露出灿烂的笑容，从喉咙深处发出低沉、满足的呻吟和呼噜声。");
         outputText("[pg]她继续摇晃着臀部挤压你，没有让她的屁股离开你的身体太多。虽然你这次能坚持得更久，但看来你最终还是会在这只狐狸体内射出另一发。当她感觉到你的");
         if(get_player().hasKnot(_loc1_))
         {
            outputText("肉结充血膨胀，你的勃起抽搐着，确保你完全被困在她体内，直到你被榨干。");
         }
         else
         {
            outputText("龟头膨胀，因为你准备好射出另一发了。");
         }
         outputText("乌尔塔在你身上呻吟着，加快了动作的速度，并用更强烈的动作在自己的肉棒上快速套弄。");
         if(!urtaLove())
         {
            outputText("[pg][say: 我难道不是你操过最棒的吗？]");
         }
         else
         {
            outputText("[pg][say: 来吧，亲爱的，你知道只要你给我更多，感觉会更好！]");
         }
         outputText("随着你的身体和你的" + get_player().cockDescript(_loc1_) + "最终屈服于你的发情期和这只狐狸精强烈的欲望，乌尔塔疯狂地自慰着。这一次，你们俩完全同步了，她湿润的黑色小穴用老虎钳般的紧致和强烈的节奏挤压着你，同时她射出了一大股精液，落在你桌子旁边的地板上，然后在你的胸膛和腹部涂抹上较小的白色细丝。");
         if(get_player().cumQ() >= 500 && get_player().cumQ() <= 1500)
         {
            outputText("[pg]乌尔塔现在看起来完全被填满并撑开了，你的发情期几乎暂时平息了，她被撑开的肚子非常像怀孕了。");
         }
         else if(get_player().cumQ() > 1500)
         {
            outputText("[pg]乌尔塔被撑开并完全填满了，所以，她手里拿着你的" + get_player().cockDescript(_loc1_) + "片刻，将自己从你的阴茎上抬起，按压她的腹部，让你的一些精液从她体内滴出，涂满了桌子、你的大腿和你的");
            if(get_player().balls > 0)
            {
               outputText("[balls]");
            }
            else if(get_player().hasVagina() && get_player().getClitLength() >= 3.5)
            {
               outputText("像阴茎一样的阴蒂");
            }
            else if(get_player().hasVagina())
            {
               outputText("阴唇");
            }
            else
            {
               outputText("大腿内侧");
            }
            outputText("沾满了你自己浓稠的白色精液。然后，她再次将你变软的勃起滑回她体内。");
         }
         outputText("[pg][say: 很好……太好了！再来几回合，我们就完事了——别他妈给我软下去！]");
         outputText("[pg]在经历了前两次高潮后，你的" + get_player().cockDescript(_loc1_) + "感觉敏感而娇嫩，但这个饥渴的色情狂只是把它深深地塞进她的小穴里，敏感的龟头和肉棒一直到你的根部再次被紧紧挤压，她开始上下弹跳，试图让你的勃起恢复生机。她疯狂而热情地亲吻你，用舌头探索你的嘴，同时保持对你腹股沟的刺激，咕咕叫着、呻吟着、喘息着，仿佛试图将她自己的欲望注入你体内。");
         outputText("[pg][say: 来吧，来吧，不惜一切代价！捏那些奶子，拍那个屁股，只要他妈的硬起来！]");
         outputText("[pg]听从她的请求，你相当粗暴地捏了捏她的乳房，你感觉到你的" + get_player().cockDescript(_loc1_) + "奇迹般地在她体内再次硬了起来。");
         if(get_player().balls > 0)
         {
            outputText("你的[balls]似乎还没有完全空");
         }
         else
         {
            outputText("这似乎不是你身体能产生的极限");
         }
         outputText("，当你狐狸般的爱人感觉到你在她体内变硬时，她高兴地尖叫起来。她用她巨大、半硬的阴茎拍打你的[chest]。");
         outputText("[pg][say: 愿意帮我一把吗？这里也有很多奶油可以挤出来。]");
         outputText("[pg]你疲惫且被欲望蒙蔽的头脑认为没有理由不这样做，你抓住她，所以乌尔塔巨大的母马阴茎开始被她自己的手以及你的手取悦。饥渴的狐狸精高兴地尖叫着，回到了似乎完全占据她脑海的事情上：在你身上热烈地弹跳，你的" + get_player().cockDescript(_loc1_) + "被困在她湿润的小穴里。");
         outputText("[pg]刺激是强烈的，你现在敏感得多的阴茎完全任由她的内部肌肉摆布。乌尔塔似乎一点也不累，反而更加凶猛，渴望与你分享另一组令人兴奋的高潮，她的臀部撞击着你的[hips]，而她的尾巴背面偶尔会挑逗");
         if(!get_player().hasVagina() && get_player().balls == 0)
         {
            outputText("你的大腿内侧");
         }
         else if(get_player().balls > 0)
         {
            outputText("你的[balls]");
         }
         else if(get_player().hasVagina())
         {
            outputText("你的[clit]");
         }
         outputText("当她完全贴在你身上时。她拍了拍自己的屁股，你用另一只手抚摸着她的身体，你们俩一起拉扯着她巨大的勃起，把它拉向你的脸，越过你的[chest]，浓稠的先列腺液和残留的精液从她的阴茎上滴落到你的身体上。乌尔塔舔了舔嘴唇，低头看着你，带着");
         if(!urtaLove())
         {
            outputText("强烈、纯粹的欲望");
         }
         else
         {
            outputText("占有欲和饥渴，但不知为何又有些温暖的表情");
         }
         outputText("。");
         outputText("[pg][say: 我应该让你每天都这么做！]");
         if(urtaLove())
         {
            outputText("她突然显得有些害羞和惊讶，然后说道，[say: 记得以后提醒我我说过这话……]");
         }
         outputText("[pg]虽然你现在的状态让你欲望高涨，对繁殖的渴望也让你能继续下去，但你实在太累了，而且过于敏感，无法用自己的抽插来回应这只狐狸精狂野的动作，尽管她似乎执意要激励你这么做。");
         outputText("[pg][saystart]来吧，操回来！");
         if(!urtaLove())
         {
            outputText("让我看看你才是这里的" + get_player().mf("男人","种马") + "！[sayend]");
         }
         else
         {
            outputText("你不想让我觉得我在虐待你吧？我知道你想要这个，所以用力干我！[sayend]");
         }
         outputText("[pg]过了一会儿，抵抗这种刺激成了一种折磨，你试图通过回应乌尔塔的动作来加快自己的高潮，伸展你的[hips]，把你的" + get_player().cockDescript(_loc1_) + "推入她的小穴更深处。虽然你们俩很难找到共同的节奏，但她看起来比你更有活力，也更热情。");
         outputText("[pg]在经历了很长一段时间稍微有些粗暴的骑乘后，你的" + get_player().cockDescript(_loc1_) + "再次在这只发情的狐狸精体内抽搐，她在你高潮爆发前几乎在自己的高潮中嚎叫起来。当她饥渴的爱洞榨取你的阴茎时，又一发精液涂满了你的[chest]，迫使你第三次射精，将更多的精液送入她的体内。");
         if(get_player().cumQ() >= 500)
         {
            outputText("如果你们俩能理性思考，你们会很清楚继续下去对她的内脏可能相当危险，但乌尔塔似乎执意要继续这场折磨，或者至少，当你看着她那充满幸福和狂喜的表情，眼睛翻白，舌头在空中舞动时，你是这么觉得的。");
         }
         outputText("[pg]你试图宣布你已经结束了，就到此为止，但这个发情的色情狂似乎执意要把你发情的" + get_player().cockDescript(_loc1_) + "据为己有，她的想法与你不同。她让你的阴茎从她体内滑出片刻，但只是为了排出一些充满她的精液，并用另一种方式刺激你。乌尔塔顺着你的身体往下移动，抚摸着你的[chest]和你的[nipples]，然后把脸和手臂降到你的[hips]。她舔了一会儿你敏感的龟头，然后对着你的" + get_player().cockDescript(_loc1_) + "发出了几声响亮有力的吸吮声。之后，她舔了舔你的");
         if(get_player().balls > 0)
         {
            outputText("[balls]");
         }
         else if(get_player().hasVagina())
         {
            outputText("[vagina]和[clit]");
         }
         else
         {
            outputText("会阴");
         }
         outputText("然后终于用舌头舔过你的[asshole]，再一路向上，再次吞下你的阴茎，同时捏住你的[butt]。你交替着呻吟、喘息和呜咽，因为血液似乎离开了你的头部和整个身体，涌入你的" + get_player().cockDescript(_loc1_) + "，让你难以思考或移动，更不用说抵抗了。");
         outputText("[pg][saystart]我们不是说好了让我全盘接收的吗，别这么懒散！我还想再干！我要一直干到把桌子干碎，把地板干穿！");
         if(urtaLove())
         {
            outputText("待会儿再休息！我甚至可以给你按摩，所以继续给我！");
         }
         outputText("[sayend]");
         outputText("[pg]她再次把身体压在你身上，身上滴落着她自己的精液，同时也把你的精液涂得到处都是。");
         if(get_player().cumQ() <= 200)
         {
            outputText("光是乌尔塔的努力，桌子似乎就已经被染白了，而你自己的体液更是雪上加霜。");
         }
         else if(get_player().cumQ() < 1000)
         {
            outputText("你们俩已经在一小滩混合着精液的汁水中做爱了，发出的淫荡声音响彻整个酒吧，而她那滴着你体液的阴道，只会让这滩水看起来更大。");
         }
         else if(get_player().cumQ() >= 2000)
         {
            outputText("你们混合的精液覆盖了桌子和地板，谁要是来清理这个地方，那可就倒霉了。尽管周围有如此多得离谱的体液，她似乎还是认定你们俩才刚刚进行到一半。");
         }
         outputText("[pg]乌尔塔再次将你半勃起的阴茎滑入体内，同时稳住身子，手伸向你的[chest]寻求支撑。[saystart]来吧，这么点精液可没法让酒馆里所有的女孩都怀孕！");
         if(get_player().cumQ() >= 1000)
         {
            outputText("好吧，也许你可以，但我们来生对双胞胎吧！");
         }
         outputText("继续！[sayend]");
         outputText("[pg]回应着让人怀孕的想法，以及乌尔塔那温暖、柔软、非常湿润、滴着水且被填满的内里的感觉，你的阴茎挣扎着恢复生机，在双性人体内再次慢慢变硬。你在她身下呻吟，身体的疲惫和酸痛不愿忍受这一切，却又无法鼓起力量甚至欲望去反抗。乌尔塔只是咯咯笑着回应，对你身体的反应感到满意，然后把她阴茎的顶端拉得离你的脸尽可能近。");
         outputText("[pg][say: 舔。我吸过你的了，所以这很公平。让我们继续把精液喷得到处都是，把它淹没在精液里。等等……不，你应该直接把它泵进我体内，尽可能多地留在里面。]");
         if(get_player().get_tallness() <= 53)
         {
            outputText("[pg]你甚至不需要弯下腰，就可以开始舔舐和吸吮她阴茎的顶端。");
         }
         else if(get_player().get_tallness() <= 65)
         {
            outputText("[pg]只需转动脖子，你就能轻松地将嘴唇贴在她勃起的顶端。");
         }
         else if(get_player().get_tallness() <= 78)
         {
            outputText("[pg]你轻松地弯下腰，用舌头爱抚乌尔塔的阴茎，回报她的快感。");
         }
         else if(get_player().get_tallness() <= 93)
         {
            outputText("[pg]乌尔塔不得不向后弯一点腰，你也得有点痛苦地伸展背部才能碰到她勃起的阴茎，但你还是设法开始用舌头爱抚她的龟头。");
         }
         else
         {
            outputText("[pg]无论你多么努力，在这个姿势下你都无法回报她。你的身体实在太高了。");
         }
         outputText("[pg]乌尔塔在你身上狂野地弹跳，她的肌肉收缩又放松，按摩着你的" + get_player().cockDescript(_loc1_) + "。即使里里外外都涂满了你的精液，并且因为做爱而被撑开，她阴道通道的肌肉仍然提供了一种紧致、温暖、美妙的感觉，而这种行为的肮脏似乎只会进一步让你兴奋——周围那些女性和一些扶他投来的肮脏、嫉妒的目光也是如此，她们显然希望和你或乌尔塔来一发。不，这在以前可能是真的。她们完全清楚，你们俩似乎只专注于彼此，如果这个双性人狐狸兽人如愿以偿的话，你们的交配还会持续一段时间。");
         outputText("[pg][say: 离远点，蠢货荡妇们！这个是我的！]她用双手捧住你的脸，抚摸着你的脸颊，把你拉向她勃起的阴茎，");
         if(get_player().get_tallness() <= 93)
         {
            outputText("让你舔舐、亲吻并吸吮她那宽大膨胀的龟头");
         }
         else
         {
            outputText("她深深地凝视着你的双眼，同时她勃起的肉棒拍打着你的[chest]");
         }
         outputText("。");
         if(!urtaLove())
         {
            outputText("看到你没有反抗，她咧嘴笑了。");
         }
         else
         {
            outputText("[say: 你是我的，对吧？现在，你只属于我一个人。我那充满男子气概的绝佳种马，[his]所有的种子都只属于我。]");
         }
         outputText("[pg]周围的女性身影发出投降和沮丧的呻吟，但有些人开始自慰，这反而让你的阴茎在乌尔塔那热情的通道里变得更加坚硬并抽动起来。她似乎认为这是她的努力造成的，于是高兴地呻吟起来。");
         outputText("[pg][saystart]对！操，玛莱啊，这简直太棒了！我们就这样一直操下去，直到我们被彻底榨干！");
         if(urtaLove())
         {
            outputText("再来几发就好，好吗？你不介意吧，亲爱的？我简直上瘾了，就让我他妈的爽过头吧！");
         }
         outputText("[sayend]");
         outputText("[pg]你喘息着、呻吟着，你的" + get_player().cockDescript(_loc1_) + "穿过她的通道，进入她温暖的身体。你的龟头对准了她的子宫，那里现在已经装满了你的精液，而且注定很快会装得更多。你那狐狸般的情人一边在你身上弹跳，一边不断呼唤你的名字。她呻吟着、喘息着、高兴地大叫着、狂喜地嚎叫着，掩盖了你们结合的生殖器发出的水声和拍打声，以及周围微弱的呻吟声。显然，湿身婊酒馆已经陷入了一场不断扩大的狂欢：单身的人在自慰或寻找伴侣，而情侣或三人行则撕碎彼此的衣服，开始就地做爱。");
         outputText("[pg]你面前的那根马鸡巴突然抽动了一下，将一股浓稠的精液射在你的舌头和嘴唇上，覆盖了你的脸，射过你的头发和额头，把你弄得一团糟。乌尔塔狂喜的叫声似乎卡在了喉咙里，但她抽搐的身体、紧紧拥抱的动作、跳动的内壁，突然紧紧抓住你的肩膀，以及在你脸部附近释放的一发又一发浓稠的精液，似乎都很好地表明她又高潮了。你感觉到自己的高潮也即将来临，而乌尔塔似乎完全打算把它给你，她紧致的繁殖孔拉扯着你因发情而勃起的阴茎");
         if(get_player().balls > 0)
         {
            outputText("，你的[balls]疯狂地收集着里面剩下的任何精液，准备向这个双性人渴望的下体再射一波");
         }
         outputText("。你似乎慢慢失去了身体大部分的知觉。对周围环境的意识逐渐消失，你所有的思想和感觉都集中在腹股沟，努力跟上乌尔塔迄今为止保持的疯狂交配节奏。当你感觉到又一阵狂喜传遍全身，并集中在你的" + get_player().cockDescript(_loc1_) + "上，再次在她诱人的洞里射精时，你很难保持清醒。你听到有人呼唤你的名字，以及那种挤奶般、挤压般的感觉，你勉强能将这些感觉与她那贪婪、贪得无厌的小穴联系起来。");
         outputText("[pg]这只性疯狂的狐狸还在继续，而你同样疯狂的阴茎似乎也打算在她的体内保持勃起。");
         outputText("[pg]你的大脑无法追踪后来发生的事情。你非常疲惫，几乎被榨干了，但你还是设法让这个骑在你勃起阴茎上的双性人又高潮了一两次。你真的不记得她在此期间高潮了多少次，也不记得之后发生了什么。你是怎么离开湿身婊酒馆的？又是怎么来到一个有些熟悉的屋顶下，背下垫着毛皮，空气中没有那种无孔不入的性爱和精液气味的？");
         outputText("[pg][say: [name]，看来如果我喝了几杯，而你又处于这种准备就绪的状态，我们就不能互相信任了。虽然过程很享受，但是……好吧，这么说吧，湿身婊酒馆可能会有一段时间有味道，我的名声可能会比以前更糟，而且，嗯，我不认为我的女性部位在短时间内还能准备好采取更多行动。我希望你感觉还好？]");
         outputText("[pg]你回答说你有点酸痛和受伤，但至少现在你已经控制住了自己的性冲动。然而，你解释说，你不完全确定你的发情期最终会对这种性爱马拉松做出什么反应。");
         outputText("[pg][say: 我明白了。我希望这带给你的不仅仅是暂时的缓解。]");
         outputText("[pg]她痛苦地皱了皱眉，但精神似乎相对较好。");
         outputText("[pg][say: 我不知道我在使用女性部位时能这么有攻击性。我想我已经配得上我最喜欢的酒馆的名字了。我为——道歉]");
         outputText("[pg]你打断了乌尔塔，说你和她一样有责任。");
         if(get_player().cor > 35 || get_game().ceraphScene.hasExhibition())
         {
            outputText("你告诉她，在公共场合进行如此充满激情的性爱其实是一次很棒的体验。听到这个建议，她脸红了。");
         }
         if(!urtaQuestDone())
         {
            outputText("[pg][saystart]好吧，我想这感觉还不错，虽然事后有点痛，但能对一个如此渴望且愿意繁衍后代的人有用，也挺好的。");
            if(urtaLove())
            {
               outputText("要是我能……呃，我想我应该享受我能享受的。");
            }
            outputText("[sayend]");
         }
         else
         {
            outputText("[pg]你意识到乌尔塔刚才不顾一切地强迫你高潮了许多次，而且完全没有采取任何保护措施。你担心当时你们俩的头脑都不清醒，于是向她询问此事。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,723) != 1)
            {
               outputText("[pg][say: 别担心，亲爱的，我吃了足够的避孕药，我们不用担心这个，]乌尔塔承认道。");
            }
            else
            {
               outputText("[pg][say: 我们确实做了，不是吗？那会很美好，不是吗？如果每次你发情的时候，都能再往我肚子里播种一个孩子……我真的很想要，[name]！我爱你！]");
            }
            outputText("[pg]你点点头，告诉她你理解。");
            get_urta().knockUpUrtaChance();
            get_urta().knockUpUrtaChance();
            get_urta().knockUpUrtaChance();
         }
         outputText("[pg]她");
         if(!urtaLove())
         {
            outputText("在你准备离开时向你眨了眨眼。[say: 希望我很快能再和你一起玩。]");
         }
         else
         {
            outputText("给了你一个快速但充满爱意的吻，然后起身开始准备离开房子。当你准备动身时，她嘟囔着什么，然后伸出手，害羞地抓住了你的手臂。");
            outputText("[pg][say: [name]，下次，嗯：等我清醒的时候来找我。我想体会一下被别人渴望的感觉，就像我平时渴望你那样，好吗？]");
            outputText("[pg]你" + get_player().mf("轻笑","咯咯笑") + "了一声，她开玩笑地捶了你的肩膀一下，但努力不让自己脸红得更厉害。她似乎对自己能说出那番表白感到很满意。");
         }
         outputText("[pg]即使你浑身酸痛，你的" + get_player().cockDescript(_loc1_) + "似乎被榨干了，干燥、灼热，几乎要破裂，但你依然感到满足。你带着淡淡的微笑离开了房子，带着一身浓烈的体液气味回到了营地。");
         dynStats(DynStat.Lib(2),DynStat.Sens(-10),DynStat.Lust(0,DynStatOp.Eq));
         get_player().orgasm("Dick");
         get_player().orgasm("Dick");
         get_player().orgasm("Dick");
         get_player().orgasm("Dick");
         get_player().orgasm("Dick");
         get_player().orgasm("Dick");
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,12,FlagDict_Impl_.arrayReadInt(_loc2_,12) + 1);
         urtaLove(1);
         _loc2_ = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,1033,FlagDict_Impl_.arrayReadInt(_loc2_,1033) + 1);
         _loc2_ = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,13,FlagDict_Impl_.arrayReadInt(_loc2_,13) + 24);
         doNext(get_camp().returnToCampUseFourHours);
      }
      
      public function drunkUrtaIntroPartDuex(param1:int = 1, param2:Boolean = true) : void
      {
         if(param2)
         {
            clearOutput();
         }
         else
         {
            outputText("[pg]");
         }
         get_urta().urtaSprite();
         outputText("突然，乌尔塔的手猛地抓向");
         if(get_player().balls > 0 && param1 == 1)
         {
            outputText("你的[balls]，在她的手中揉搓着，捏得有点太用力了。");
         }
         else if(get_player().hasVagina())
         {
            outputText("你的[clit]，揉搓着直到它");
            if(param1 == 1)
            {
               outputText("变得和最近[eachCock]经常出现的状态一样，");
            }
            outputText("勃起并跳动着。");
         }
         else
         {
            outputText("你的[hips]，沿着它们向[eachCock]抚摸，展现出令人难耐的挑逗。");
         }
         outputText("[pg]这只狐狸立刻用她的嘴唇紧紧贴住你的嘴唇，强行将舌头伸进你的嘴里，让你闭嘴。你忍不住被她的侵略性所刺激");
         if(param1 == 1)
         {
            outputText("，而[eachCock]已经在你的[armor]里硬了起来。");
         }
         else
         {
            outputText("，你感觉到你的[armor]内部迅速被你[vagina]兴奋分泌的爱液弄得湿滑。");
         }
         outputText("[pg]你对她的反应感到有些惊讶，当你还在她手中任其摆布时，乌尔塔用对她体型来说几乎不可能的力量将你推倒在吧台上。你感觉到背下的木头。她的尾巴展开，向你展示了她已经勃起的马鞭，");
         if(get_player().get_inRut() && get_player().get_inHeat() && get_player().hasCock() && get_player().hasVagina())
         {
            outputText("然后她开始揉捏自己的乳房，先列腺液从她的肉棒中大量渗出，她的小穴流出的淫液滴落在她的蛋蛋上，然后滴落到地板上。");
         }
         else if(param1 == 1)
         {
            outputText("但她目前似乎并不介意。相反，" + (get_noFur() ? "她的大腿似乎" : "她大腿之间的皮毛似乎") + "正在迅速被浸湿。");
         }
         else
         {
            outputText("她似乎非常想把它插进你体内，尽管你确实看到一些女性的润滑液顺着她的蛋蛋滑落。");
         }
         outputText("[pg]她开始挣扎着想把你从[armor]里弄出来，同时继续在言语上攻击你。[say:当然，如果你真的打算这么做，你至少会有礼貌地等到我离开这里，所以我相信你不会介意的。]她似乎对你的衣服在这种姿势下不太配合感到沮丧。对于一个已经喝醉的人来说，她做得相当不错。[saystart]呃，你最好是");
         if(param1 == 1)
         {
            outputText("硬的");
         }
         else
         {
            outputText("湿的");
         }
         outputText("吧。[sayend] 几秒钟后，当你感觉到光溜溜的[butt]贴在桌子上时，她的目光落在了你的");
         if(param1 == 1)
         {
            outputText(get_player().multiCockDescriptLight());
         }
         else
         {
            outputText("[vagina]");
         }
         outputText("上。乌尔塔的笑容更灿烂了，她向你展示了一张性感的脸庞，似乎混合了绝对的愉悦和捕食者的气息。");
         if(param1 == 1)
         {
            outputText("[pg][say: 那么，我相信你不会介意我把你所有的精液和那几个小时的性爱都据为己有，]她一边说着，一边把一条腿放在桌子上，靠在你身边，同时脱下裙子，润滑液现在从狐狸的女性部分滴落下来，落在你的[hips]上。");
         }
         else
         {
            outputText("[pg][say: 我想你会发现，对于你贪婪的小穴来说，我绝对是个足够强壮的种马……]她带着欲望咆哮着，一只手抚摸着你的[vagina]，然后她笨拙地跳上桌子，来到你的双腿之间。");
         }
         menu();
         if(param1 == 1)
         {
            if(get_player().hasCockThatFits(get_urta().urtaCapacity()))
            {
               addButton(0,"继续",drunkUrtaRidesARutPCsCock);
            }
            else
            {
               addButton(0,"继续",sateRutWithDrunkUrtaWithHugeDick);
            }
         }
         else
         {
            addButton(0,"继续",drunkenUrtaFucksPCInHeat);
         }
      }
      
      public function approachSoberUrtaHeatRutProc() : void
      {
         clearOutput();
         get_urta().urtaSprite();
         outputText("当你走向你那狐狸扶她情人坐着的桌子时，你觉得有眼睛在跟着你，你的出现吸引了异乎寻常的注意力。");
         if(get_player().get_inHeat() && get_player().get_inRut() && get_player().hasCock() && get_player().hasVagina())
         {
            outputText("雄性、雌性和扶她都用一种混合着困惑、渴望和敌意的目光盯着你，似乎不确定他们是想和你打一架，还是想把你操到失去理智，亦或是被你操到失去理智。");
         }
         else if(get_player().get_inRut() && get_player().hasCock())
         {
            outputText("雄性盯着你的眼神中带着一丝挑衅，而雌性则专注地打量着你。扶她似乎不确定他们是想和你打一架还是想操你。");
         }
         else if(get_player().get_inHeat() && get_player().hasVagina())
         {
            outputText("雄性，以及那些乍一看像雌性，直到你发现她们衣服里或双腿间至少有一根肉棒的明显凸起的人，都用明显的欲望盯着你走过，在你身后，不止几个人开始勃起。");
         }
         outputText("你无视了他们所有人，把注意力集中在乌尔塔身上。");
         outputText("[pg]当你靠近时，");
         if(urtaLove())
         {
            outputText("她张开双臂拥抱你，并微笑着。");
         }
         else
         {
            outputText("她看到你时笑了笑，但随后嗅了嗅空气，" + (get_noFur() ? "她的皮肤" : "她皮毛下的皮肤") + "似乎立刻变得更红润了。[say:呃，我，我明白了。]你在她旁边坐下，但即使她还没有暗示什么，你已经发现自己很难控制自己了。");
         }
         if(get_player().get_inRut() && get_player().hasCock())
         {
            outputText("乌尔塔就在你旁边，她已经证明了自己是个不错的床伴");
         }
         else
         {
            outputText("你不断提醒自己乌尔塔双腿间藏着什么，以及它能提供多少宝贵的精液，忍不住现在就想尝试一下");
         }
         outputText("。更不用说，无论她双腿间有没有那个怪物，她的身体都性感得要命。");
         outputText("[pg][saystart]好吧，你确实帮我发泄过，所以我想这很公平……");
         if(get_player().get_inHeat() && get_player().hasVagina())
         {
            outputText("你……闻起来很香，所以我至少希望你不是来逗我的。");
         }
         outputText("[sayend]她向你靠近，并且");
         if(get_player().get_inRut() && get_player().hasCock())
         {
            outputText("当她向你低语时，你的目光很快被她丰满的乳房吸引。你被迷住了，根本不在乎她在说什么。");
         }
         else
         {
            outputText("你沉浸在想象中，想象着乌尔塔直接干你，把你灌满精液。你听到一个微弱的声音，当你回过神来时，你意识到那是乌尔塔的声音。");
         }
         outputText("她咳嗽了一声，重复了一遍。[saystart]你是因为你的，嗯，状况才来这里的吗？你更愿意和");
         if(urtaLove())
         {
            outputText("你可爱、火辣的狐狸精");
         }
         else
         {
            outputText("你认识并信任的人");
         }
         outputText("发泄一下，对吧？[sayend]");
         outputText("[pg]你过于热情地点了点头。她在桌上留下几颗宝石，然后抓住你的手，小心翼翼地不触碰你此时可能过于敏感的任何部位。");
         outputText("[pg]当她带你走进小巷，显然是朝着她家走去时，你的心思和目光");
         if(get_player().get_inRut() && get_player().hasCock())
         {
            outputText("集中在狐狸兽人的臀部上");
         }
         else
         {
            outputText("你的注意力全集中在想一睹那根惊人肉棒的风采上，脑海里不断幻想着她能用它做些什么");
         }
         outputText("。你那极具侵略性的荷尔蒙状态要求你");
         if(get_player().get_inRut() && get_player().get_inHeat() && get_player().hasCock() && get_player().hasVagina())
         {
            outputText("让她怀上你的孩子，然后再让她让你怀上孩子");
         }
         else if(get_player().get_inRut() && get_player().hasCock())
         {
            outputText("让她怀上你的孩子，这样她就能从那美丽的臀部把孩子生下来");
         }
         else
         {
            outputText("把那根美丽的大肉棒插进你饥渴的[vagina]里");
         }
         if(!urtaQuestDone())
         {
            outputText("，即使总有什么在提醒你那是不可能的。");
         }
         else
         {
            outputText("。");
         }
         outputText("[pg][saystart]你知道吗，[name]，我总是很高兴见到你。");
         if(urtaLove())
         {
            outputText("我真的很感激你能控制住自己，带着这个来见我。你知道，如果你需要我，我随时准备帮忙，亲爱的。[sayend]");
         }
         else
         {
            outputText("在这种状态下你能想到我，我真是受宠若惊！[sayend]");
         }
         outputText("[pg]突然，本能变得有些过于强烈，就在你们走进一条有些长、黑暗、独立的巷子时，你用双臂搂住乌尔塔，将你的");
         if(get_player().get_inRut() && get_player().get_inHeat() && get_player().hasCock() && get_player().hasVagina())
         {
            outputText("混合生殖器");
         }
         else if(get_player().get_inRut() && get_player().hasCock())
         {
            outputText("[cock biggest]");
         }
         else
         {
            outputText("[vagina]");
         }
         outputText("顶在她的背上。");
         outputText("[pg][say: 嗯，你知道，我也很饥渴，但至少等我们到了我家再说……]");
         if(get_player().get_inRut() && get_player().get_inHeat() && get_player().hasCock() && get_player().hasVagina())
         {
            outputText("[pg]你把乌尔塔转过身来，看到她眼中的欲望几乎和你一样强烈。你几乎是扑向她，把她推到墙上，揉捏着她的大乳房，袭击她的嘴唇，用你的大腿摩擦她那根巨大、勃起的马屌，还不太确定到底该怎么一次性满足你身体所有的欲望。乌尔塔发出充满欲望的低吼，撕开她的裙子，你们俩很快就把你的[armor]扔得到处都是。");
            outputText("[pg]乌尔塔看起来想说些什么，但随后她停了下来，困惑暂时取代了饥渴。[say: 我……你打算用什么？你的肉棒？还是你的小穴？]她问道，喘着粗气，迫不及待地想要开始。");
            menu();
            if(get_player().hasCockThatFits(get_urta().urtaCapacity()))
            {
               addButton(0,"肉棒",sateRutWithSoberUrta);
            }
            else
            {
               addButton(0,"肉棒",sateRutWithSoberUrtaButHuegDicked);
            }
            addButton(1,"小穴",soberUrtaSatingPCHeat);
         }
         else if(get_player().get_inRut() && get_player().hasCock())
         {
            outputText("[pg]你粗暴地把手指塞进她的嘴里，另一只手则向下摸索，探入她的双腿之间。这个调皮的荡妇甚至没有穿正经的内衣，你很快就开始抚摸她黑色的阴唇，然后将一根手指滑入其中。");
            if(get_player().hasVagina())
            {
               outputText("你的[cocks]和[vagina]分泌出的混合汁液浸湿了你的衣服");
            }
            else
            {
               outputText("你的[cock biggest]开始渗出先列腺液，弄湿了你的衣服");
            }
            outputText("，所以你决定把它们脱掉，同时将乌尔塔按在墙上。");
            outputText("[pg][say: 好吧，好吧。这是我自找的，]乌尔塔说道，尽管她听起来对在小巷里做爱并不怎么抗拒，而且从她坚挺的肉棒和湿润的小穴来看，她的身体甚至更加渴望。");
            outputText("[pg]你脱下你的[armor]，手里握着肉棒，走向这只心甘情愿的狐狸兽人");
            if(get_player().hasVagina())
            {
               outputText("你的小穴湿漉漉的，充满渴望");
            }
            outputText("。");
            menu();
            if(get_player().hasCockThatFits(get_urta().urtaCapacity()))
            {
               addButton(0,"继续",sateRutWithSoberUrta);
            }
            else
            {
               addButton(0,"继续",sateRutWithSoberUrtaButHuegDicked);
            }
         }
         else
         {
            outputText("[pg]你隔着衣服紧紧抓住乌尔塔的乳房和肉棒，将自己贴向她，饥渴地亲吻着这只狐狸兽人。你要求她现在就在这里要了你，说你已经等不及了。");
            outputText("[pg][say: 好吧……我知道控制不住自己是什么感觉。如果你真的想让我……]");
            outputText("[pg]你脱下你的[armor]，你的[vagina]已经湿透，渴望着她。你在小巷的墙下将这只母狐狸拥入怀中，她开始将她那根滴着先列腺液的巨大肉棒对准你的穴口。");
            menu();
            addButton(0,"继续",soberUrtaSatingPCHeat);
         }
      }
      
      public function approachDrunkenUrta() : void
      {
         clearOutput();
         get_urta().urtaSprite();
         outputText("当你走向你那毛茸茸的扶她情人坐着的桌子时，你觉得似乎有目光在追随着你，你的出现吸引了异乎寻常的注意力。");
         if(get_player().get_inHeat() && get_player().get_inRut() && get_player().hasCock() && get_player().hasVagina())
         {
            outputText("雄性、雌性和扶她都用一种混合着困惑、渴望和敌意的目光盯着你，似乎不确定他们是想和你打一架，还是想把你操到失去理智，亦或是被你操到失去理智。");
         }
         else if(get_player().get_inRut() && get_player().hasCock())
         {
            outputText("雄性盯着你的眼神中带着一丝挑衅，而雌性则专注地打量着你。扶她似乎不确定他们是想和你打一架还是想操你。");
         }
         else
         {
            outputText("雄性，以及那些乍一看像雌性，直到你发现她们衣服里或双腿间至少有一根肉棒的明显凸起的人，都用明显的欲望盯着你走过，在你身后，不止几个人开始勃起。");
         }
         outputText("你无视了他们所有人，把注意力集中在乌尔塔身上。");
         outputText("[pg]事实上，她已经先看到了你，并在你靠近时站了起来，主动拉近你们之间的距离。出乎意料的是，你被这位狐狸兽人推到了吧台上，停下了脚步，而她自己也只是稍微失去了一点平衡。");
         outputText("[pg][say: 哎呀，哎呀。你知道你闻起来像什么吗？你以为我不会注意到吗？还是说你来这里就是为了让我注意到？]");
         outputText("[pg]不知为何，这个双性人似乎比平时更粘人、更轻浮，对你们之间的关系也更不加掩饰。当你深吸一口气时，你明白了原因——她身上散发着她最喜欢的饮料的味道……你是感兴趣，还是决定等她恢复正常、稍微清醒一点再来拜访？");
         menu();
         addButton(1,"不感兴趣",notInterestedInUburDrunkUrtaRuts);
         addButton(0,"感兴趣",interestedInUburDrunkurtaRuts);
      }
   }
}

