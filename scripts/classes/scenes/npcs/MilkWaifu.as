package classes.scenes.npcs
{
   import classes.CoC;
   import classes.DebugMenu;
   import classes.DynStat;
   import classes.ImageManager;
   import classes.Player;
   import classes.SelfDebug;
   import classes.Time;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.display.SpriteDb;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.items.Armor;
   import classes.items.ArmorLib;
   import classes.saves.SelfSaver;
   import classes.saves.SelfSaving;
   import classes.scenes.Camp;
   import classes.scenes.npcs._MilkWaifu.SaveContent;
   import coc.view.CoCButton;
   import flash.Boot;
   import haxe.IMap;
   import haxe.ds.IntMap;
   
   public class MilkWaifu extends NPCAwareContent implements SelfDebug, SelfSaving
   {
      
      public var saveVersion:int;
      
      public var saveName:String;
      
      public var saveContent:SaveContent;
      
      public var globalSave:Boolean;
      
      public function MilkWaifu()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         globalSave = false;
         saveVersion = 1;
         saveName = "milkWaifu";
         saveContent = new SaveContent(null);
         super();
         SelfSaver.register(this);
         DebugMenu.register(this);
      }
      
      public function titFuckDatMilkSlut() : void
      {
         clearOutput();
         outputText("你在 [bathgirlname] 身边坐下，轻轻推了她一下，让她仰面躺下。一声微弱的喘息从她唇间溢出，但当你覆在她身上，给了她一个漫长的、充满舌吻的吻时，这声音被淹没了。当你的惊讶变成了充满情欲的呻吟时，你");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,870) == 2)
         {
            outputText("脱下她的衬衫和胸罩");
         }
         else
         {
            outputText("把手指陷入她那像乳房一样的奶子里");
         }
         outputText("，抚摸着她敏感的乳房，直到一股柔和的乳汁顺着她的胸膛流下。当你退后片刻，将你的[cock]从[armor]中释放出来，让它落在她赤裸的肚子上时，她满怀期待地屏住了呼吸。然而，你的臀部向前滑动，离开了她已经湿透的小穴，滑向了她诱人的乳沟。令你高兴的是，你即将在她乳房上倾注的注意力似乎和一次痛快的性爱一样让[bathgirlname]兴奋，当你的肉棒滑入她的双乳之间时，她的呼吸兴奋地加快了。在你的稍微催促下，她托起乳房，将它们挤压在一起，包裹住你坚硬如石的阴茎，将其拥入她暗色肌肤的温暖怀抱中。");
         outputText("[pg]在你开始向她的胸部挺进之前，你伸手捏住她的乳头，在手指间揉搓着那两座突出的山峰，从她深不可测的储备中引出越来越大的乳汁洪流。白色的河流从她的双峰上流下，洪水般涌入你[cock]周围的峡谷。当温暖浓稠的乳汁倾泻在你的阴茎周围时，你浑身颤抖。[bathgirlname]伸手进去，用缓慢而性感的动作将其揉进你的肉棒中，随着越来越多的白色液体淹没你的阴茎，她温柔地抚摸着你。被你的乳汁欲望所征服，你俯身舔舐着[bathgirlname]漏奶的乳房之间乳汁湖的溢出物。你的感官在品尝着染上情欲的甜美乳汁时嗡嗡作响，仿佛是自发地，你的[hips]开始向前滑动，你的[cock]在她的双乳之间滑动，就像在一个润滑良好的小穴里一样。[bathgirlname]对这种感觉咯咯地笑了起来，将她的双乳紧紧地挤压在你的阴茎周围。");
         outputText("[pg]你抓住她的肩膀作为支撑，开始真正地行动起来。你的臀部移动得越来越快，当你猛烈地撞击她被乳汁浸透的乳沟时，腹股沟不断地撞击着[bathgirlname]双乳的下侧。她感觉就像一个温暖湿润的小穴包裹着你的肉棒一样舒服，但还有一个额外的好处：当你的[cock]的[cockHead]从她乳房的顶部探出时，[bathgirlname]仰起头，用她丰满的嘴唇包裹住它，她的舌头在你的尿道口上轻弹，让快感的颤栗传遍你的脊背。当[bathgirlname]在你每次挺进的顶点吸吮你的肉棒时，你发出一声低沉沙哑的呻吟，她将所有的吸吮技巧都用在了你的龟头上，直到你的[cock]感觉几乎被快感点燃。");
         outputText("[pg]在[bathgirlname]口交的诱导下，你暂时离开了她的乳房，");
         if(!get_player().hasTailInsteadOfLegs())
         {
            outputText("跨坐在她的肩膀上，猛地将");
         }
         else
         {
            outputText("将自己缠绕在她身上，猛地将");
         }
         outputText("你的[cock]深深地插入她的嘴里。[bathgirlname]急切地接受了它，当你将你的男子气概一寸一寸地塞进她的喉咙时，她张大了嘴巴。现在她可以真正开始工作了：她的嘴唇紧紧包裹住你的根部，舌头舔舐着你的下侧，就像吃糖果一样，同时她的喉咙肌肉按摩着你的肉棒。你进进出出，看着她的喉咙随着每次挺进而鼓起和收缩");
         if(get_player().balls > 0)
         {
            outputText("，当她的舌头在你的肉棒周围飞舞，轻弹你的蛋蛋时，你浑身颤抖");
         }
         outputText("。");
         outputText("[pg]然而，就在你刚刚适应节奏的时候，[bathgirlname]突然改变了姿势，让你大吃一惊，她翻滚成四肢着地，并把你一起带了过去。你仰面躺下，当这位胸部丰满的女仆骑在你身上，她的脸颊靠在你的大腿上时，你惊讶地叫了起来。你开始抗议，但很快就被压制了，因为她的舌头包裹住你肉棒的根部，慵懒而轻松地顺着你的肉棒向上滑动。你颤抖着放松下来，满足于让她充分发挥她惊人的口交技巧；她确实做到了，很快她就在你的[cock]上方四肢着地，拖着她巨大的双乳穿过你直立的肉棒，直到她双乳的绝对重量将你巨大的阴茎压倒，将其钉在你的肚子上。她温柔地向前摇晃身体，拖着她润滑良好的双乳在你的肉棒上下滑动，只把[cockHead]留给她的嘴。她俯下身，直到你能感觉到她每一次灼热的呼吸喷洒在你敏感的皮肤上。[bathgirlname]不慌不忙，只是慢慢地用舌头绕着你的龟头打转，用舌尖轻弹你的尿道，舔舐着现在正从你的[cock]中大量喷出的先列腺液。你呻吟着握紧拳头，试图忍受乳交和口交的结合，但你就是无法抵挡她的服侍。");
         outputText("[pg]伴随着最后一次性能量的爆发，你将你的[legs]缠绕在[bathgirlname]的肩膀上，再次将她翻转过来，让自己重新回到上面，肉棒牢牢地夹在她沉甸甸的双乳之间。你像手提钻一样将你的[hips]撞入她的下乳，将手指陷入她柔软的肉中，粗暴地揉捏她的乳头，直到她呼吸急促并呻吟起来，乳汁再次溅入她的乳沟，完美地润滑你最后的挺进，直到伴随着一声野性的咆哮，第一团浓稠的奶油状精液喷涌而出，在溅到[bathgirlname]的脖子上之前，与你[cock]周围的乳汁海洋短暂混合，给了她一条即时的珍珠项链。你的肉棒一次又一次地痉挛，将精液射入乳汁湖中，直到她的乳沟变成你肉棒周围精液和乳汁的泡沫状混合物。带着调皮的笑容，你伸手舀起满满两把你们制造的溶液，举到[bathgirlname]的唇边。她充满情欲地对你微笑，然后将它们全部吸吮干净，喝下每一滴提供的甜美乳汁和精液。");
         get_player().orgasm("Tits");
         outputText("[pg]你满足地叹了口气，深情地拍了拍[bathgirlname]的乳房，看着她的肉在你的触摸下颤抖。她带着情欲的温暖对你微笑，当你抓起毛巾擦干身体时，她给了你一个飞吻；你回头看到她正快乐地自慰，用一只手深深地插入她体内完成你开始的工作，而另一只手则漫不经心地玩弄着你留在她双乳之间的泡沫状乳汁。");
         dynStats(DynStat.Sens(-1));
         get_player().changeFatigue(-10);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function superReductoUsage() : void
      {
         clearOutput();
         outputText("你告诉 [bathgirlname]，是时候摆脱她那对巨大的乳房了。她歪着头，不解地看着你。你从你的 [inv] 中摸出拉斯给你的那大瓶缩形膏，举起来让她检查。她犹豫地从你手中接过，转来转去，闻了闻这难闻的东西。她嫌弃地皱起了鼻子。");
         outputText("[pg][say: 来吧，我保证，之后你会感觉好多了，] 你蹲在她身边，盯着 [bathgirlname] 那双棕色的大眼睛说道。");
         outputText("[pg]如果不是因为你温柔的语气，[bathgirlname] 停止了对缩形膏的抱怨，尽力蜷缩在你的腿上，让你能自由地接触她那对大胸。你揉了揉她的头发，开始思考该怎么做。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,870) == 0)
         {
            outputText("[pg]她的胸部很大。这是无法掩饰的。缩形膏可以把它们缩小到一个更适中的水平，但是……她确实有令人惊叹的胸部。你确信保持它们相当大对她没有坏处；在这个时候，任何缩小都是一种恩惠。话又说回来，你可以一路走到底，把她降到一个“正常”的罩杯尺寸，比如一些不错的 DD 罩杯：给她留下足够的尺寸，让她被认为是一个丰满的美女，但又足够小，让她不会有背部问题，虽然你不知道她是否还能分泌足够的乳汁来用那么小的胸部洗澡。");
            outputText("[pg]你让[bathgirlname]在你的腿上转过身，给自己找了个最好的角度来对付她那巨大的乳房。准备好后，你用缩形膏涂满双手，然后伸手绕过去抓住你朋友的乳房，把第一团药膏涂抹在她漏奶的乳头上。她倒吸一口凉气，当冰凉的物质涂抹在她的乳头上时，她颤抖了一下，但几乎立刻你就能看到它开始起作用了：她的乳房颤动着，随着它们像气球一样开始缩小，皮肉也跟着抖动起来。");
            outputText("[pg][say: [name]！] [bathgirlname] 大叫起来，当你按摩她的乳房时，她呜咽着呻吟着，在她的胸部周围涂抹了大量的缩形膏。牛奶像两根软管一样从她体内倾泻而出，随着她的承载能力越来越小，她那充满母性的液体喷洒得到处都是。她越来越小，乳房缩小并漏奶，直到它们大约是 HHH 罩杯——对于一个牛娘来说足够大了，但比以前小得多。");
            outputText("[pg][say: 够了，] 你说着，倾身把手伸进 [bathgirlname] 制造的牛奶喷雾中，洗掉手上的缩形膏。完成后，你用多余的牛奶擦拭她的乳头，擦掉缩形膏，直到她暗褐色的皮肤变得尽可能干净，漂亮而有光泽。");
            outputText("[pg][bathgirlname]试探性地想要站起来。她那依然巨大的乳房像铅块一样沉重，让她差点向前摔倒，但你及时扶住了她，稳住这个体重减轻了的女孩，直到她能靠自己的力量站立。虽然还有些摇晃，但她确实站住了。");
            outputText("[pg][say: 我……我能……]她呻吟着，突然捂住头。你跳了起来，再次扶稳她，[bathgirlname]痛苦地呻吟着，拉扯着自己的黑发，直到她突然安静下来。过了好一会儿，她才转向你，满脸笑容。[say: 我能……走路了，]她努力挤出这几个字。还没等你反应过来，[bathgirlname]就一把抱住你，用尽全力把你紧紧搂在她丰满的胸前，几乎喜极而泣。你笑着回抱她，紧紧拥着她那浸满乳汁的身体，直到她准备好自己站立。女孩给了你一个漫长而深情的吻，然后跌跌撞撞地走开了，在四肢着地这么久之后，她正努力找回双腿站立的感觉。");
         }
         else
         {
            outputText("[pg][bathgirlname]现在的乳房大小堪比牛娘");
            if(get_isabellaFollowerScene().isabellaFollower())
            {
               outputText("，足以让伊莎贝拉");
               if(marbleFollower())
               {
                  outputText("和玛布尔");
               }
               outputText("都自愧不如");
            }
            else if(marbleFollower())
            {
               outputText("，足以让玛布尔都自愧不如");
            }
            outputText("。她现在看起来开心多了，而且依然能产出足以淹没你的乳汁；这是一个令人愉快的平衡。不过，她走到哪儿还是得托着它们，而且因为她人类的体型，你找不到任何适合她这种特殊身材的衣服。话虽如此，你剩下的缩形膏还够把她缩小到一对漂亮、坚挺的DD罩杯。她依然会很漂亮，乳汁丰富，虽然可能不够用来洗澡，但有了更合理的胸围，你也许真的能在什么地方找到一件适合她的胸罩。");
            outputText("[pg]你让[bathgirlname]在你的腿上转过身，给自己找了个最好的角度来对付她那巨大的乳房。准备好后，你用缩形膏涂满双手，然后伸手绕过去抓住你朋友的乳房，把第一团药膏涂抹在她漏奶的乳头上。她倒吸一口凉气，当冰凉的物质涂抹在她的乳头上时，她颤抖了一下，但几乎立刻你就能看到它开始起作用了：她的乳房颤动着，随着它们像气球一样开始缩小，皮肉也跟着抖动起来。");
            outputText("[pg][say: [name]！][bathgirlname]大叫起来，当你按摩她的乳房，在她的胸部周围涂抹大量的缩形膏时，她呜咽着、呻吟着。乳汁像两根水管一样从她体内涌出，随着她的容量越来越小，她那充满母性的体液喷洒得到处都是。她越来越小，乳房不断缩小，漏出的乳汁也越来越多。你在她身上涂抹了更多的缩形膏，用尽你最后一滴药膏来帮助这个可怜的产奶女奴。当她的胸部似乎要被乳汁撑爆时，她再次大叫起来，白色的海啸从她缩小的乳头中涌出，几乎让你睁不开眼。");
            outputText("[pg]当你再次能看清东西时，你和[bathgirlname]都变得比雪还白，全身沾满了乳汁。你低头一看，发现你的双手正捧着一对美丽、坚挺的DD罩杯乳房。她正如你预测的那样停止了缩小，给她留下了一个任何女孩都会引以为傲的匀称胸部。更重要的是，这是一个她可以轻松带着四处走动的胸部。你擦去眼睛里的乳汁，抚摸着[bathgirlname]的头发，温柔地鼓励她尝试站起来。她颤抖着任由你扶她站起来，然后你松开了手。");
            outputText("[pg][bathgirlname]差点摔倒，但在最后一刻稳住了自己，像鸟儿一样挥舞着手臂来保持平衡，努力适应新的重心。她试探性地走了几步，发现自己相对轻松了许多。女孩笑得合不拢嘴，转向你大喊：[say: 我……我能走路了！]然后跳进你的怀里，流着喜悦的泪水，紧紧地把你抱在怀里，坚挺的乳房把乳汁滴在你的胸膛上。看来无论她变得多平，[bathgirlname]都无法停止分泌乳汁；但现在她不用再应付那对巨大的乳房了，目前来说，这就足够了。可怜的女奴把脸颊蹭在你的脖子上，一边抽泣一边颤抖，手指紧紧抓着你的[armor]。");
            outputText("[pg]你让她痛痛快快地哭了好一会儿，抚摸着她的头发，轻声说着安慰的话，直到最后，她退后一步，擦干了眼泪。[bathgirlname]揉了揉太阳穴，因为短暂的疼痛呻吟了一声，然后用明亮的棕色眼睛抬头看着你，轻声说道：[say: 谢谢你……非常感谢，[name]。]");
            outputText("[pg]这……考虑到她平时有限的语言能力，这番话出奇地流利。也许是那些乳汁和极其庞大的乳肉影响了她的心智？你这样问她，依然语速缓慢地使用着简单的词汇。");
            outputText("[pg][say: 以前一切都很模糊，]她呻吟着，[say: 但现在清晰多了。清晰多了，]她深吸一口气，对你微笑着。[say: 谢谢你，[name]。]");
            outputText("[pg]你告诉她这是你的荣幸。");
            outputText("拉萨祖尔走了过来，显然他看到了刚才发生的一切。他向你们俩露出温暖的微笑，显然很高兴能帮上忙。这只老鼠一言不发地拿出一套叠好的衣服：一件绣着复杂图案的布衬衫，以及一套看起来很昂贵的女士内衣，递给了[bathgirlname]。她看了看这件作为礼物的衣服，又看了看炼金术士，接过衣服，在他苍老的额头上深情地吻了一下。他轻声笑着，脸红了。[say: 很抱歉我没有更多的东西可以给你，可怜的孩子，]拉斯说着，开始步履蹒跚地走开。[say: 不过，我想这些东西我留得够久了。]");
            outputText("[pg]你帮[bathgirlname]穿上新衣服，这可能是她几年来第一次能穿上衣服，然后留她自己去适应新的身体——不过在此之前，她拉着你深情地吻了你，再次紧紧抱住你，并轻声表达了她由衷的感谢。");
         }
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,870,FlagDict_Impl_.arrayReadInt(_loc1_,870) + 1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function suckleDatMilk() : void
      {
         clearOutput();
         outputText("你松开 [bathgirlname] 的乳房，让她喘口气，同时把她拉到你的腿上，让她面对着你。她用充满情欲的眼睛看着你，呼吸沉重而灼热地喷洒在你的[skinfurscales]上，你温柔地抚摸着她起伏的胸膛。你的手指环绕住她的左乳，挤出最细微的一缕乳汁，然后将它送到你等待的唇边。你亲吻她红润的顶端，舌头在她的乳头上滚动，换来的是一股强烈的香甜乳汁，在你吞咽之前就撑鼓了你的脸颊。她仿佛永远不会干涸；源源不断的乳汁从她的乳房中倾泻而出，迫使你一次又一次地吞咽，几乎跟不上这速度，直到乳汁顺着你的脸颊流下。");
         outputText("[pg]回应着你温柔的吸吮和舌尖在她敏感蓓蕾上的弹拨，[bathgirlname] 呜咽着颤抖起来，你的每一次触碰对这个不断泌乳的女孩来说都像触电一般。她纤细的手臂环绕着你的肩膀，紧紧贴着你，任由你贪婪地饮用她丰富的储备。当你伸手向下，手指陷入她饱满的臀部，像之前揉捏她的乳房一样揉捏那柔软顺从的肉体时，她喘息起来。她可爱的愉悦喘息声充满了空气，当你从一个漏奶的乳头换到另一个时，她发出了一声充满惊讶和狂喜的尖叫，仅仅是轻轻一碰，另一个乳头就爆发出大量的乳汁，喷涌进你等待的嘴里，当你大口大口地喝着时，她的肉体在母性的释放中颤抖着。");
         outputText("[pg]在短短几分钟内，[bathgirlname] 的呼吸变得越来越不规律，她的胸口剧烈起伏，每一次沉重的呼吸都把你的脸从她身上推开。女孩的声音很快就消失了，取而代之的是沙哑的呻吟和对你口技的赞美，一次又一次地感谢你带给她温柔体贴的释放。当她的身体在你身上起伏时，她的手指穿过你的头发，用更多的乳汁和愉悦的颤抖回应着你的每一次吸吮和抚摸。");
         outputText("[pg]她的高潮既强烈又不可避免。[bathgirlname] 仰起头，一声无声的尖叫从她唇间溢出，她的手指深深陷入你的肉里，尽可能紧紧地抓住你，流过你唇间的乳汁流越来越大，越来越猛，直到你几乎要溺水。当你努力跟上这无情的洪流，快速吞咽以防在她的高潮释放中溺水时，白色的河流从你的嘴里涌出。[bathgirlname] 哭喊着，尖叫着，她的身体被乳头高潮震撼着，没有被你紧紧抓住的乳房疯狂地喷射着，在你们俩周围形成了一个湖泊。你可以看到她薄薄的内裤被淫液染深，她的几根手指飞快地伸下去揉搓她隐藏的阴蒂，随着乳汁从她乳房喷涌的节奏自慰着。");
         outputText("[pg]最终，乳头高潮平息了，留下 [bathgirlname] 在你怀里成为一滩颤抖、喘息的欲望之躯，她的手指心不在焉地隔着内裤揉搓着，最后几滴乳汁顺着她的胸膛和你的下巴流下。你深吸了一口过去几分钟里好不容易才吸到的空气，从附近抓起一条毛巾，试图尽可能地把你和这个漏奶的女孩擦干，擦掉冲刷过你们俩的几加仑乳汁。当你完成后，[bathgirlname] 倾身向前，在你的嘴唇上印下了一个漫长而充满情欲的吻，她的舌头舔舐着你嘴里残留的她自己的乳汁。在一个漫长而愉快的时刻之后，她结束了这个吻，低声说道 [say: 谢谢你，[name]。]");
         get_player().slimeFeed();
         get_player().refillHunger(50);
         get_player().changeFatigue(-50);
         dynStats(DynStat.Lust(10 + get_player().sens / 10),DynStat.NoScale);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function set_milkName(param1:String) : String
      {
         FlagDict_Impl_.arrayWriteString(KFLAGS.flags,869,param1);
         return param1;
      }
      
      public function sendToFarm() : void
      {
         clearOutput();
         outputText("你向[bathgirlname]描述了那个湖，以及湖边的那座农场。你温柔地告诉她，你希望她去那里，把自己交给农场的主人——那个犬女，并听从她的吩咐。");
         outputText("[say:好吧，][bathgirlname]说道，小心翼翼地试探着这个想法。[say:你会偶尔来看看我的，对吧？]当然。得到安抚后，这位前沙漠女巫奴隶站起身，小心翼翼地朝湖边走去。她在保护方面派不上什么用场，但她会大大提高你的产奶量。");
         if(get_player().cor >= 90)
         {
            outputText("[pg]你脑海中浮现出一个阴暗但诱人的想法：一旦她到了农场，要让她重新长出大胸、给她建个新奶罐，并大幅增加农场的产奶量，那简直易如反掌。");
         }
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1089,1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function saveToObject() : Object
      {
         return saveContent;
      }
      
      public function reset() : void
      {
         saveContent.talkedSlut = 0;
      }
      
      public function relaxWithMilkWaifu() : void
      {
         clearOutput();
         outputText("你在浴缸里坐了一会儿，让芳香的液体浸透你的[skinfurscales]。你花了大半个小时闲逛，让你的烦恼在[bathgirlname]无尽的白色恩赐中飘散。最后，你拔掉浴缸的塞子爬了出来，在附近找到了一条毛巾。谢天谢地，牛奶似乎没有留下任何残留物，你感到干净清爽，虽然有点发情。");
         dynStats(DynStat.Lust(10 + get_player().sens / 10),DynStat.NoScale);
         get_player().changeFatigue(-34);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function ratducto() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_rathazul());
         outputText("你抬起头，看到老鼠炼金术士拉萨祖尔正朝你走来，他的鼻子埋在一本看起来很古老的书里。[say:好消息，[name]！]他喊道，就在他被趴在地上的挤奶女工绊倒，摔了个四脚朝天之前。");
         outputText("[pg][say:嘎！救命，我起不来了！]他大喊着，四处挥舞着手臂，直到你冲过去把他拉起来。");
         outputText("[pg][say:啊，谢谢你，年轻人。但是……天哪，[name]，你这次又带了什么回来？]他嘟囔着，从口袋里掏出一副眼镜来打量[bathgirlname]。[say:哎呀，是个女孩……而且是个，呃，胸部非常丰满的女孩。老天保佑，她胸前挂着那些……那些……那些东西，到底是怎么站起来的？]");
         outputText("[pg][say:该挤奶了吗？][bathgirlname]呜咽着，伸手去揉她那圆润饱满的屁股，那是拉斯撞到她的地方。你有些不好意思地解释说，她其实站不起来。你不确定沙漠女巫对她做了什么，但她不太能照顾自己。");
         outputText("[pg][say:我明白了。可怜的孩子，]拉斯说着，颤颤巍巍地在[bathgirlname]身边跪下。他同情地抚摸着她的脸颊，苍老的脸上浮现出一丝悲伤的微笑。[say:我的朋友，她绝不是第一个在这个糟糕的时代被改变得如此彻底的人。除了心理辅导和教导之外，我不知道我能做些什么来帮助这颗无疑经历过恐怖折磨的心灵，但至少，我的缩形膏也许能帮她过上稍微正常一点的生活。]");
         outputText("[pg]拉斯把手伸进长袍，拿出一大瓶这东西——足足有几十剂普通剂量的量。[say:我本来打算把这个留到下次犬椒混进食物储备时用的，但我想她更需要它。给你，[name]，]他说着，把瓶子递给你。[say:你在涂抹这东西方面，呃，比我有经验。而且我相信她需要温柔的抚摸。]");
         outputText("[pg]说完，拉斯一瘸一拐地回到了他的小实验室，留下你和[bathgirlname]。");
         outputText("[pg][say:老鼠真好，]她嘟囔着，挪动着身下那对巨大的乳房。");
         get_player().createKeyItem("Super Reducto",0,0,0,0);
         outputText("[pg](<b>获得关键物品：超级缩形膏</b>)");
         doNext(playerMenu);
      }
      
      public function pullInZeMilkGirl() : void
      {
         clearOutput();
         outputText("你在[bathgirlname]走开之前叫住了她，然后涉水走到浴缸边，让你的脸离她那沉甸甸的乳房只有几英寸远。当你伸出手时，她笑了，把脸颊蹭进你的手里，开心地发出呼噜声，呼唤着你的名字。");
         outputText("[pg]你冲她调皮地咧嘴一笑，然后抓住她的腰猛地一拉，把她拽进了浴缸。挤奶女工跌入浴缸时发出一声尖锐的惊呼，一大片乳汁溅出浴缸边缘，把营地染成了一片白色。她喘着气，头从自己的乳汁中探出水面，乌黑的长发滴落在她那似乎浮力极佳的乳房上，它们在乳白色的波浪上起伏，带着一种奇特而宁静的优雅。[say: [name]？][bathgirlname]在自己的乳汁中跋涉时惊叫道，慢慢地退向浴缸边缘。你轻笑着伸出手抚摸她的脸颊，告诉她你觉得她可能也想洗个澡。她刚想回答，你却用手调皮地抚摸她那巨大的双峰打断了她，催促她靠近你。她对你深信不疑，照你说的做了，滑到你的手臂下，坐在你的大腿上。坐好后，她用那双像碟子一样大的棕色眼睛抬头看着你，直到你捧起她的脸颊，给了她一个短暂而温柔的吻，将你的嘴唇贴在她那暗色的双峰上。令你高兴的是，她似乎在你的抚摸下融化了，当你尽可能紧紧地抱住她时，她瞬间放松下来，你们之间只隔着她那惊人的胸部");
         if(get_player().biggestTitSize() >= 7)
         {
            outputText("，深深地压在你同样巨大的胸部上，你的乳头拂过她那漏奶的乳房");
         }
         outputText("。");
         outputText("[pg][say: 噢——噢，]她呻吟着，声音微弱得几乎听不见，脸颊在你的手中涨得通红。这个可爱的小挤奶女工转过身，把她的乳房移开，这样她就可以把头靠在你的胸前，显然很享受你搂着她肩膀的简单快乐和偶尔的温柔抚摸。你让她享受了漫长而安静的几分钟，满足于这个充满乳香的女孩的默默陪伴。你不时地轻轻抚摸她那像母牛一样的乳头，或者伸手下去，把她浓稠丰富的乳汁涂抹在你的下体，享受着它在你");
         if(get_player().get_gender() == 1)
         {
            outputText(get_player().multiCockDescriptLight());
         }
         else if(get_player().get_gender() == 2)
         {
            outputText("[vagina]");
         }
         else if(get_player().get_gender() == 3)
         {
            outputText("[cocks]和[vagina]");
         }
         else
         {
            outputText("无性别的下体");
         }
         outputText("，依然因你的欲望而火热燃烧");
         outputText("。过了一会儿，你轻轻推了推女孩，让她把手臂和乳房靠在池边。你绕到她身后，捧起一把把她的乳汁。你开始把乳汁浇在她的背和肩膀上，让她完全浸泡在自己甜美的乳汁中，然后你靠近她，开始按摩她的背部，慢慢地揉搓，直到她安静地颤抖。当你的手指陷入她柔软顺从的肌肤，轻轻揉捏她的肩膀和臀部时，她低声呻吟着。你特别关照了她丰满圆润的屁股，试探性地将几根手指滑过她的腿，抚摸她湿滑的阴户和阴蒂的肉蕾。");
         outputText("[pg]当你触碰到她时，她倒吸了一口凉气，");
         if(get_player().cor < 70)
         {
            outputText("你迅速收回手，不想强迫她，但令你惊讶和高兴的是，她向后伸出手，握住你的手，引导你继续抚摸她");
         }
         else
         {
            outputText("你带着强烈的欲望咧嘴一笑，加大了力度，手指轻松地滑入她的体内，她的乳汁提供了完美的润滑。女奴在你的性挑逗下颤抖着，但要么是出于训练有素的恐惧而不敢阻止你，要么就是根本不想让你停下来");
         }
         outputText("。不过，还没等你深入，[bathgirlname]就转过身来，她巨大的双乳将你推过乳白色的池水，然后把你按在对面的池壁上。你只晕眩了短暂的一秒，她的乳房就紧紧地压在你的背上，力度之大，以至于一股新的乳汁从她的乳头喷涌而出，像你刚才弄湿她一样弄湿了你的背。你靠在池壁上放松下来，她捧起一把把乳汁，揉进你的头发和肩膀，灵巧的手指以顶级按摩师的技巧按摩着你背部的每一块肌肉，你能感觉到肌肉的紧张感正在消散。你大大地打了个哈欠，把下巴搁在手臂上，任由这个乳汁女孩为你按摩，让你[skinfurscales]涂满她浓郁美味的乳汁。");
         if(get_player().hasCock())
         {
            outputText("[pg]乳汁女孩的一只手拂过你的大腿，滑到你的[leg]周围；纤细的手指包裹住你的[cock]，乳白色的润滑液让她轻柔的抚摸更加令人愉悦。当她的手指在你迅速勃起的肉棒上滑动时，你发出充满欲望的呻吟");
            if(get_player().balls > 0)
            {
               outputText("，另一只手托起你的[balls]，在掌心灵巧地把玩着那 " + Utils.num2Text(get_player().balls) + " 颗球体，带来阵阵快意");
            }
            outputText("。她越过你们之间那两团巨大的乳房，在你的背上印下一连串的吻，在深情的爱抚中舔舐着散落的乳汁。");
         }
         if(get_player().hasVagina())
         {
            outputText("[pg]她的手向下移动，纤细的指尖滑过你的[vagina]的缝隙。你喘息着，颤抖着，她沾满乳汁的手指轻松地滑入你湿透的穴中，拇指在你的[clit]周围轻轻打转。她的另一只手向上游走，抚摸着你的[hips]和[butt]，最后来到你的[chest]，用熟练的技巧揉捏着。");
            if(get_player().biggestTitSize() >= 1)
            {
               outputText("她捧起你的乳房，由于要绕过你们两人的双峰，她不得不伸长手臂才能揉捏你的[nipples]，但她依然勇敢地尝试着，用她那极其灵巧的手指抚摸着它们。");
               if(get_player().lactationQ() >= 100)
               {
                  outputText("一股乳汁从你饱满的双乳中喷涌而出，汇入你朋友那满满一池的乳汁中。她高兴地喘息着，迅速将脸埋进你的背部，开始动作。她像挤自己的奶一样挤着你的奶，让你那丰沛的母性体液倾泻入池中，偶尔有几滴顺着你的胸膛流下，将你的胸部染得和她一样白。");
               }
            }
         }
         menu();
         addButton(4,"不要",dontFuckTheMilkWaifu);
         if(get_player().hasCock())
         {
            addButton(0,"操她",fuckTheMilkWaifu);
         }
         if(get_player().hasVagina() && get_player().biggestTitSize() >= 3)
         {
            addButton(1,"百合交",beARugMunchingMilkDyke);
         }
      }
      
      public function onAscend(param1:Boolean) : void
      {
         reset();
      }
      
      public function nyanCatMilkTime() : void
      {
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,870) == 1)
         {
            outputText("[say: 挤奶时间！]你说道，调皮地拍了一下[bathgirlname]翘起的屁股，绕过她走到水池边。你跳了进去，把你的[armor]扔了出来，而这位奶水充足的女巫则安顿下来。你很清楚这个可怜的女孩即将用多少奶水喷你，即使她的胸部已经小了很多。不过，她还是得挤奶，而你也很渴。确实是挤奶时间。");
            outputText("[pg]一旦你脱下衣服，[bathgirlname]把她巨大的乳房安放在水池边缘，你就开始工作了。你搓了搓手，把每只手放在她手掌大小的乳晕上，手指轻轻地在她的乳头根部滑动。然而，随着你的每一个动作，你的手似乎都被吸进了那巨大的肉团中，就像被吸进了乳肉的黑洞。不过，随着你的每一次触摸，[bathgirlname]都会颤抖和呻吟，咬着下唇，手臂因快感而颤抖。");
            outputText("[pg]没过多久，你就从你朋友的乳头里挤出了第一股爆炸性的乳汁，两股热腾腾的白色乳汁喷在你的脸上，在你眨眼之前就把你淋透了。[say: 对——对不起，]她呜咽着，当你的手紧紧抓住她的乳头并开始用力挤压时，她的声音变成了狂喜的呻吟，一刻也不让乳汁的喷流减弱。[bathgirlname]在你粗暴的挤奶下呻吟着，而你则得到了几加仑令人愉悦的母乳作为回报。");
            if(get_sophieFollowerScene().sophieFollower())
            {
               outputText("[pg]当你给[bathgirlname]挤奶时，你看到头顶上闪过一个黑影。你抬起头，正好看到你的鹰身女妖育母栖息在水池边缘，就在[bathgirlname]颤抖的身体旁边。[say: 新鲜的牛奶！]索菲笑着，捧起一把送到嘴边。[say: 你不介意索菲妈妈尝尝吧，亲爱的？][pg]这位奶水充足的女孩摇了摇头，几乎没有注意到索菲扑通一声坐在她身边，用鸟类的舌头舔舐着倒入水池的乳汁。");
            }
            if(get_kihaFollowerScene().followerKiha())
            {
               outputText("[pg]你感觉有人在看你，回头瞥了一眼，正好看到奇哈那暗色的身影站在你身后。她只是说了句[say: 呃，]然后就走开了。");
            }
            if(get_isabellaFollowerScene().isabellaFollower())
            {
               if(get_isabellaFollowerScene().isabellaAccent())
               {
                  outputText("[pg][say: 啧，[name]。你对那个可怜的女人做了什么？]");
               }
               else
               {
                  outputText("[pg][say: 啧，[name]，你对那个可怜的女孩做了什么？]");
               }
               outputText("你从工作中抬起头，看到伊莎贝拉站在水池上方，双手叉在宽阔的臀部上。[saystart]你对她太粗暴了，可怜的");
               if(get_isabellaFollowerScene().isabellaAccent())
               {
                  outputText("小东西");
               }
               else
               {
                  outputText("小东西");
               }
               outputText("。让伊莎贝拉来教你");
               if(get_isabellaFollowerScene().isabellaAccent())
               {
                  outputText("该怎么");
               }
               else
               {
                  outputText("该怎么");
               }
               outputText("做。[sayend]你发现自己被粗暴地推到一边，伊莎贝拉跳进水池和你在一起，把她的裙子和衬衫扔到一边，抓住[bathgirlname]的乳头，更温柔地按摩着。当伊莎贝拉开始工作时，这个奶水充足的女孩翻了翻白眼，尽管随着乳汁流到她的大腿和胸部，工作变得越来越困难。");
            }
            if(!get_isabellaFollowerScene().isabellaFollower() || !get_sophieFollowerScene().sophieFollower())
            {
               outputText("[pg]花了很长时间才把[bathgirlname]胀满的乳房控制住，但将近一个小时后，你已经尽可能地把她的奶挤干净了。你浑身湿透，从水池里爬出来，抓起一条毛巾。由于她的乳房暂时变轻了，[bathgirlname]伸出手把你拉向她，刚好在你的脸颊上印下一个吻，并低语道：[say: 谢谢你，[name]。感觉很好。]");
            }
            else
            {
               outputText("[pg]虽然你没打算把这变成公共活动，但[bathgirlname]确实有足够的奶水可以分享。当最后一滴乳汁流入水池时，你放松下来，她的乳房看起来完全瘪了。你决定把塞子留在水池里给你的朋友们，心想他们可能会想在一天中储存一点，然后再把水排干。由于她的乳房暂时变轻了，[bathgirlname]伸出手把你拉向她，刚好在你的脸颊上印下一个吻，并低语道：[say: 谢谢你，[name]。感觉很好。]");
            }
            get_player().changeFatigue(-50);
            dynStats(DynStat.Lust(10 + get_player().sens / 10),DynStat.NoScale);
            doNext(get_camp().returnToCampUseOneHour);
         }
         else
         {
            outputText("你和[bathgirlname]坐在一起，问她是否想好好挤个奶。听到这个建议，她的眼睛亮了起来，低声说[say: 好的，拜托了，]同时已经脱下了衬衫。你帮她脱下上衣和胸罩，让她饱满挺拔的乳房暴露在凉爽的阳光下。你滑到她身后，双手抚摸着她被阳光亲吻过的肌肤，手指从臀部划到胸部；[bathgirlname]在你最轻微的触摸下颤抖着，当你的手包裹住她充满乳汁的肉团时，她发出了充满欲望的呜咽。当你的手指刷过她发红的乳头时，它们已经变得坚硬如石，当你在她宽大的乳晕上画圈时，渗出了透明的珍珠般的液滴。");
            outputText("[pg][bathgirlname]呜咽着，你从她的乳头里挤出一小股乳汁，白色的液体以强有力的弧线喷射而出，在营地上留下了短暂的污迹，然后饥渴的土地将其吞噬，除了女孩膝盖处的一块暗斑外，没有留下任何痕迹。你轻轻地开始挤压和揉捏[bathgirlname]的乳房，把她抱在怀里，从她似乎无穷无尽的储备中按摩出沉重的负担。一股稳定的乳汁从她的胸部流出，顺着你的手指和她平坦的腹部滴落。很快，你的[legs]周围形成了一个水池，贫瘠的土地根本来不及消耗从你朋友身上流出的恩赐。");
            outputText("[pg]随着每一次抚摸和挤压，[bathgirlname]都会颤抖和摇晃，她的胸部很快就随着她粗重、因快感而紧张的呼吸而起伏。你可以看到她充满欲望的分泌物弄脏了她的内裤，她隐藏的小穴在颤抖，当你挤压她过度敏感的乳房时，她渴望得到关注。她的呼吸变得更加不规律，修长的双腿颤抖着，当你挤出几加仑的乳汁时，她翻了翻白眼。她愉悦的呜咽变成了彻底的哭喊，用高潮的呻吟和尖锐的尖叫刺破了营地的宁静，你的手指在她的身上施展魔法，将快感的冲击波从沉重的乳头传送到被性爱冲昏头脑的大脑，使她的整个身体在你的触摸下抽搐和扭动。");
            outputText("[pg][say: 不——不要了。受不了……了……求你了。啊啊啊啊，] [bathgirlname] 哭喊着，在你的怀抱中扭动，你的双手紧紧锁住她的乳房，榨干她的每一滴乳汁。她马上就要迎来一次强烈的乳头高潮了：你可以用温柔的吸吮来安抚她度过，或者用正常的方式让她高潮。");
            if(get_player().hasCockThatFits(50))
            {
               outputText("话又说回来，也许你可以把她的内裤拉下来，狠狠地操她一顿，把她送上顶峰。以她现在的状态，她肯定不会介意的！");
            }
            menu();
            addButton(0,"正常",finishMilkNormall);
            addButton(1,"吸吮",suckleDatMilk);
            if(get_player().hasCockThatFits(50))
            {
               addButton(2,"操她",fuckDatMilkSlat);
            }
         }
      }
      
      public function nameZeMilkBath() : void
      {
         var _loc1_:String = getInput();
         if(_loc1_ == "")
         {
            clearOutput();
            outputText("<b>你必须给她起个名字。</b>");
            menu();
            addButton(0,"下一步",nameZeMilkBath);
            genericNamePrompt("浴盆荡妇");
            return;
         }
         clearOutput();
         set_milkName(_loc1_);
         if(get_milkName() == "Bath Slut")
         {
            outputText("去他的，就叫浴盆荡妇吧。至少她不会搞混。");
         }
         else if(get_milkName() == "Biscuit")
         {
            outputText("去他的，你还不如在她的屁股上抹点黄油呢！");
         }
         else
         {
            outputText("你在刚起好名字的女孩身旁蹲下，将几缕散落在她脸颊上的黑发拨开。[say: 以后不叫浴盆荡妇了。你现在叫[bathgirlname]。[bathgirlname]就是你的名字。]");
            outputText("[pg][say: [bathgirlname]，]她犹豫地重复着。看来她懂了！[say: [bathgirlname]！]在你的鼓励下，她更加自信地说道。");
         }
         if(get_rathazul().followerRathazul() && get_rathazul().get_mixologyXP() >= 16)
         {
            outputText("[pg]就在你刚决定好[bathgirlname]的名字时，你听到一阵拖沓的脚步声向你们走来。抬起头，你看到老鼠炼金术士拉萨祖尔正走过来，鼻子还埋在一本看起来很古老的书里。[say: 好消息，[name]！]他大喊道，结果话音刚落就被趴在地上的挤奶女工绊倒，摔了个四脚朝天。");
            outputText("[pg][say:嘎！救命，我起不来了！]他大喊着，四处挥舞着手臂，直到你冲过去把他拉起来。");
            outputText("[pg][say:啊，谢谢你，年轻人。但是……天哪，[name]，你这次又带了什么回来？]他嘟囔着，从口袋里掏出一副眼镜来打量[bathgirlname]。[say:哎呀，是个女孩……而且是个，呃，胸部非常丰满的女孩。老天保佑，她胸前挂着那些……那些……那些东西，到底是怎么站起来的？]");
            outputText("[pg][say:该挤奶了吗？][bathgirlname]呜咽着，伸手去揉她那圆润饱满的屁股，那是拉斯撞到她的地方。你有些不好意思地解释说，她其实站不起来。你不确定沙漠女巫对她做了什么，但她不太能照顾自己。");
            outputText("[pg][say: 我明白了。可怜的孩子，]拉斯说着，颤颤巍巍地在[bathgirlname]身边跪下。他同情地抚摸着她的脸颊，苍老的脸上浮现出一抹悲伤的微笑。[say: 我的朋友，她绝不是第一个在这个糟糕的时代被改变得如此彻底的人。除了心理辅导和教导之外，我不知道我能做些什么来帮助这颗无疑经历过恐怖折磨的心灵，但至少，我的缩形膏也许能帮她过上稍微正常一点的生活。]");
            outputText("[pg]拉斯把手伸进长袍，拿出一大瓶这东西——足足有几十剂普通剂量的量。[say:我本来打算把这个留到下次犬椒混进食物储备时用的，但我想她更需要它。给你，[name]，]他说着，把瓶子递给你。[say:你在涂抹这东西方面，呃，比我有经验。而且我相信她需要温柔的抚摸。]");
            outputText("[pg]说完，拉斯一瘸一拐地回到了他的小实验室，留下你和[bathgirlname]。");
            outputText("[pg][say:老鼠真好，]她嘟囔着，挪动着身下那对巨大的乳房。");
            get_player().createKeyItem("Super Reducto",0,0,0,0);
            outputText("[pg](<b>获得关键物品：超级缩形膏</b>)");
         }
         else
         {
            outputText("[pg]当你决定好新同伴的名字后，你的目光游移到了她那巨大、充满乳汁的胸部上。被这么沉重的乳房压着，她几乎无法动弹，虽然她总是渴望被挤奶，但这种沉重的乳汁负担绝不会是什么令人愉快的事情。对吧？");
            outputText("[pg]不管怎样，你觉得一个好的炼金术士也许能帮帮这个可怜的女孩，如果你想这么做的话。但是在这个鬼地方去哪找炼金术士呢……？");
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function milkyMenu() : void
      {
         var _g:Camp;
         clearOutput();
         spriteSelect(SpriteDb.get_s_milkgirl());
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1089) == 0)
         {
            outputText("你走到[bathgirlname]的水池边，发现这个肤色微黑的女孩正坐在池边，");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,870) == 0)
            {
               outputText("脸朝下趴在她那巨大的胸部上，丰满的小屁股翘在半空中，任人观看。看到你走近，她眼睛一亮，挪动着她那巨大的胸部转过身来面对你，满眼笑意。[say:该挤奶了吗？]");
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,870) == 1)
            {
               outputText("双臂交叉托在沉甸甸的饱满胸部下，支撑着它们依然可观的重量。她看着你走近，微笑着，能够靠自己的力量站起来给你一个拥抱，那对充满乳汁的奶子紧紧贴着你。[say:是、是该挤奶了吗？]她问道，为你托起她的奶子。");
            }
            else
            {
               outputText("修长、晒成棕褐色的双腿垂在浴缸里。当你走近时，她跳了起来，虽然做这种简单的动作还是有点不稳，但她很快就扑进了你的怀里，在你的脖子上蹭来蹭去，把她那坚挺、俏皮的DD罩杯乳房紧紧贴着你，少量的乳汁透过她穿着的小衬衫弄脏了你的胸膛。[say:[name]，]她开心地发出咕噜声。");
            }
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,870) == 0)
         {
            outputText("当你走到[bathgirlname]身边时，她迷迷糊糊地从胸部带来的恍惚中清醒过来。");
            outputText("[pg][say:洗澡时间到了吗？]");
         }
         else
         {
            outputText("当你走到[bathgirlname]身边时，她对你微笑着。");
            outputText("[pg][say:你好，[name]。你需要什么吗？]");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1089) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1077) == 1)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,870) == 0)
            {
               outputText("[pg]虽然她大量的乳汁无疑会对你的农场大有裨益，但以[bathgirlname]现在的状态，你根本无法把她安置在那里。不过，也许你可以和惠特尼谈谈在那里建一个新水箱的事。");
            }
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1089) == 1 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,870) == 0)
         {
            outputText("[pg]<b>(在把[bathgirlname]送回营地之前，你得想办法缩小她那巨大的奶子。)</b>");
         }
         menu();
         addButton(0,"外貌",milkWriteFuAppearance).hint("仔细看看[bathgirlname]。");
         addButton(1,"交谈",milkTryTalking).disableIf(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,870) == 0 && saveContent.talkedSlut != 0,"在这种状态下试图和她交谈是徒劳的。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,870) < 2)
         {
            addButton(5,"牛奶浴",milkBathTime).hint("让她用母乳注满水池。如果她的乳房变小了，她可能就无法再这样做了。");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,870) > 0)
         {
            addRowButton(1,"挤奶时间！",nyanCatMilkTime).hint("帮她释放一些积攒的乳汁。");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,870) > 0 && get_player().get_lust() >= 33 && get_player().hasCock())
         {
            addRowButton(1,"乳交",titFuckDatMilkSlut).hint("你知道那是什么，对吧？");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1089) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,870) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1077) == 1)
         {
            addButton(10,"农场工作",sendToFarm);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1089) == 1 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,870) > 0)
         {
            addButton(10,"回营地",backToCamp);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,870) < 2 && get_player().hasKeyItem("Super Reducto"))
         {
            addRowButton(2,"缩形膏",superReductoUsage).hint("涂抹一剂超级缩形膏。这会让她的乳房大幅度缩小。");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1089) == 0)
         {
            _g = get_camp();
            addButton(14,"返回",function():void
            {
               _g.campSlavesMenu();
            });
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1089) == 1)
         {
            addButton(14,"返回",get_game().farm.farmCorruption.rootScene);
         }
      }
      
      public function milkWriteFuAppearance() : void
      {
         clearOutput();
         outputText("[bathgirlname]是一个身高五英尺五英寸的人类女性，有着深褐色的皮肤和乌黑的头发。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,870) >= 2)
         {
            outputText("在她柔软的身体上，穿着一件简单的布衬衫，下摆刚好在膝盖上方，遮住了她新获得的贞洁，里面穿着一条丝绸内裤和一件简单的胸罩。");
         }
         outputText("她有着一张人类的脸庞，肌肤丰润光滑，点缀着淡淡的雀斑。她的头发又长又浓密，顺着背部一直垂到腰间。除了胸部之外，她的身材曲线优美，臀部和大腿丰满柔软，还有一个大屁股，你的手指都能陷进去。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,870) == 0)
         {
            outputText("[pg]不过，她最显著的特征还是那巨大的胸部。大到如果没有支撑，她就会被拖得四肢着地，[bathgirlname]的胸部绝对是巨大的。她的乳晕有盘子那么大，随着她的每一次呼吸，不断地滴下母乳。只要轻轻一碰，[bathgirlname]那巨大的乳头就会喷涌而出，足以填满她整个水池，甚至还有剩余。你觉得那肯定不太舒服，即使它们在美丽和性愉悦的潜力上几乎令人着迷。");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,870) == 1)
         {
            outputText("[pg]虽然你已经<i>大幅</i>缩小了它们，但[bathgirlname]最引人注目的特征仍然是她那巨大的胸部。她那对巨大的乳房长在牛娘身上会比长在人类女孩身上看起来更正常，而且她还是个相当娇小的女孩。她的乳晕有手掌那么大，顶端是一对突出的乳头，总是渴望释放出母乳。她可以轻松地用那些东西装满一个浴缸，单凭她一个人就能提供足够养活一个小村庄的奶水，每天的产量比英格纳姆所有奶牛的总和还要多。");
         }
         else
         {
            outputText("[pg]多亏了你的干预，[bathgirlname]的乳房不再大得那么碍事了。缩小到DD罩杯后，你甚至设法凑齐了一些真正适合她的衣服。在她现在的状态下，你甚至可以说她的胸部很挺拔，她那充满乳汁的乳房既坚挺又令人愉悦地柔软；你可以轻松地将手指陷进去，或者把脸埋进去");
            if(get_player().hasCock())
            {
               outputText("或者把鸡巴埋进去");
            }
            outputText("埋进她那柔软的双峰之间。尽管尺寸缩小了，[bathgirlname] 还是很高兴地告诉你，她体内仍然有充足的奶水，虽然可能不如以前那么多：她无法独自填满整个水池，但现在即使是短暂的挤奶，也能让她在接下来的几个小时里感到幸福的空虚。她现在不再是一座自给自足的农场了，考虑到所有情况，她似乎对此相当满意。");
         }
         outputText("[pg]在她修长的双腿和适合生育的臀部之间是她的小穴，上面一小撮深色的柔软毛发吸引了你的注意。而且，隐藏在她挺翘的臀瓣之间的是她紧致的小后门，就在它该在的地方。");
         if(get_game().farm.farmCorruption.hasTattoo("milky"))
         {
            outputText("[pg]");
            if(get_game().farm.farmCorruption.milkyFullTribalTats())
            {
               outputText("她从头到尾都覆盖着部落纹身，情色的线条在她赤裸的身躯上蜿蜒，让她看起来像个勉强被驯服的野蛮人。");
            }
            else if(get_game().farm.farmCorruption.numMilkyButterflyTats() == 4)
            {
               outputText("她从头到尾都覆盖着蝴蝶纹身，仿佛这些美丽的昆虫被她巧克力色的肌肤所吸引。当她移动时，她会带着额外的弹跳和甩头动作，欣赏着自己走动时的模样。");
            }
            else
            {
               if(get_game().farm.farmCorruption.numTattoos("milky") > 1)
               {
                  outputText("她的身上印有以下纹身：\n");
               }
               else
               {
                  outputText("她有");
               }
               if(1157 in KFLAGS.flags.h)
               {
                  outputText(FlagDict_Impl_.arrayReadString(KFLAGS.flags,1157) + "\n");
               }
               if(1158 in KFLAGS.flags.h)
               {
                  outputText(FlagDict_Impl_.arrayReadString(KFLAGS.flags,1158) + "\n");
               }
               if(1159 in KFLAGS.flags.h)
               {
                  outputText(FlagDict_Impl_.arrayReadString(KFLAGS.flags,1159) + "\n");
               }
               if(1160 in KFLAGS.flags.h)
               {
                  outputText(FlagDict_Impl_.arrayReadString(KFLAGS.flags,1160) + "\n");
               }
            }
         }
         menu();
         addButton(0,"继续",milkyMenu);
      }
      
      public function milkTryTalking() : void
      {
         var answer3:int;
         var _g3:MilkWaifu;
         var answer2:int;
         var _g2:MilkWaifu;
         var answer1:int;
         var _g1:MilkWaifu;
         var answer:int;
         var _g:MilkWaifu;
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,870) == 0)
         {
            outputText("[bathgirlname]在她的水池旁边的垫子上平静地" + (get_time().hours > 19 ? "睡着" : "休息") + "，似乎没有意识到你的存在，而你正在考虑如何最好地尝试这件事。毕竟，虽然她确实是" + (get_camp().followersCount() > 1 ? "你比较" : "一个") + "不寻常的" + (get_player().cor > 50 ? "玩具" : "朋友") + (get_camp().followersCount() > 1 ? "" : "") + "，但她也" + (get_player().cor > 50 ? "蠢得像块砖头" : "不太容易交流") + "。也许有什么方法可以" + (get_player().cor > 50 ? "甚至" : "") + "让她明白？");
            outputText("[pg]听到你的" + (get_player().lowerBody.legCount > 1 ? "脚步声" : "靠近") + "，她动了动" + (get_time().hours > 19 ? "并打了个哈欠" : "") + "，尽可能地支撑起身体。当她认出你时，她的眼睛亮了起来，她迅速向前挪动，直到她巨大的乳房悬在空水池上方。[say:洗澡时间？]她问道，已经因为期待你的触摸而颤抖起来。");
            outputText("[pg]你告诉她你不是为了这个来的，她抬头看着你，明显很困惑。" + (get_player().cor > 50 ? "你摇了摇头。至少她知道自己擅长什么——而且你买她也不是为了她的头脑。面对你的沉默，她自顾自地开始为你准备洗澡水，当她按摩出第一缕乳汁时，她的呼吸因快感而加快。" : "当你指着自己，希望她能明白时，[bathgirlname]急切地点了点头。当她伸手去摸乳头时，乳头上已经渗出了乳汁——看来她把你的手势理解为确认你想洗澡了。"));
            outputText("[pg]你不太可能从她那里得到任何有用的东西，但既然你在这里，你可以接受她的提议。");
            saveContent.talkedSlut = 1;
            menu();
            addNextButton("洗澡",milkBathTime);
            addNextButton("离开",milkTalkLeave);
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,870) == 1)
         {
            outputText("她的眼中闪烁着光芒，让你觉得也许能和她进行一些真正的对话，" + (saveContent.talkedSlut != 0 ? "即使你之前的尝试完全失败了" : "尽管你还是有点不确定") + "。你试探性地问[bathgirlname]感觉如何，但她一开始的反应只是眨了几下眼睛。最终，她似乎明白了你在问什么，但即便如此，她显然还是很难回答。");
            outputText("[pg][say:我……挺好的？]她说道，尽管脸上的表情并不自信。也许换个方法更好；你无法想象对她来说表达这么抽象的东西有多难。考虑到这一点，你决定尝试一些具体的东西。你问这个肤色暗淡的女孩是否记得任何事情，关于她的过去，她自己，任何事情都可以。");
            outputText("[pg]听到这个，她明显感到不舒服。[say:一切都……那么……模糊，]她说道，眼神也如她所说的那样迷茫。[say:很难去想……所有的事情。除了牛奶以外的所有事情。]说到最后一个词时，她精神振奋了一些，用大大的、恳求的眼睛看着你。[say:是喝牛奶的时间了吗？]");
            outputText("[pg]令人失望，但你安慰自己，她似乎确实取得了一些进展。虽然内容不多，但她能说出完整的句子了。你觉得你可以奖励你勤奋的奴隶，从她揉捏肿胀乳头的方式来看，她绝对需要挤奶了……");
            saveContent.talkedSlut = 2;
            menu();
            addNextButton("洗澡",milkBathTime);
            addNextButton("离开",milkTalkLeave);
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,870) == 2 && saveContent.talkedSlut < 2)
         {
            outputText("既然她至少恢复了大部分的理智，你想尝试和[bathgirlname]进行一次真正的对话。然而，鉴于你们的关系到目前为止缺乏有意义的讨论，你有点不知道该如何开始。在短暂的考虑之后，在此期间你细心的女奴好奇地看着你，你决定从简单的事情开始——问她好不好。");
            outputText("[pg][say:哦，我感觉很好，[name]。谢谢你的关心，]她甜甜地笑着说。[say:自从你治好了我，或者不管你怎么称呼它，每一分钟都感觉像呼吸到了新鲜空气。呃……]她对这种笨拙的措辞感到有点尴尬。[say:我的意思是，当我能记住事情，并且能真正把我所想的用语言表达出来时，我总是感到惊讶。这可能听起来很傻，但真的太不一样了。]");
            outputText("[pg]说完最后一个词，她就没词了，随着沉默的蔓延，她的脸慢慢变成了一副尴尬的面具。然而，她似乎想到了什么，突然精神一振，轻轻地[say:哦]了一声，然后转向你。[say:那么，呃，[name]，你怎么样？]");
            saveContent.talkedSlut = 3;
            menu();
            _g = this;
            answer = 0;
            addNextButton("很好",function():void
            {
               _g.milkTalkAnswer(answer);
            });
            _g1 = this;
            answer1 = 1;
            addNextButton("还行",function():void
            {
               _g1.milkTalkAnswer(answer1);
            });
            _g2 = this;
            answer2 = 2;
            addNextButton("糟糕",function():void
            {
               _g2.milkTalkAnswer(answer2);
            });
            _g3 = this;
            answer3 = 3;
            addNextButton("发情",function():void
            {
               _g3.milkTalkAnswer(answer3);
            }).disableIf(get_player().get_lust() < 33,"你现在没那个兴致。");
         }
         else
         {
            milkTalkMenu();
         }
      }
      
      public function milkTalkSlave() : void
      {
         clearOutput();
         outputText("好吧，没必要拐弯抹角。你问[bathgirlname]她对住在这里[if (cor < 50) {和你一起|作为你的财产}]感觉如何。");
         outputText("[pg][say:哈？]她脱口而出，显然很惊讶。她真的没想过这个问题吗？");
         outputText("[pg]你解释说，既然你买下了她，你[if (cor < 50) {名义上}]就是她的[master]，但因为她当时并没有完全控制自己的心智，你不确定她现在的感觉是否和那时不同，或者她对自己的地位有什么抱怨。");
         outputText("[pg][say:啊，对，]她有些不好意思地说。[say:嗯，好吧，我真的没有任何问题。你显然对我很好——你给了我第二次生命！如果我留在女巫那里，谁知道我会变成什么样……但因为你，我现在有了第二次机会。]她平静地笑了。[say:我信任你，也相信你会继续照顾我。我会很乐意为你服务的，[Master]，]她轻笑着总结道。");
         outputText("[pg]好吧，你很高兴一切都解决了。");
         doNext(milkTalkMenu);
      }
      
      public function milkTalkPastAnswer(param1:int) : void
      {
         clearOutput();
         switch(param1)
         {
            case 0:
               outputText("听起来，她当时在沙漠里处境艰难。无论沙漠女巫做了什么，那都是她今天能在这里和你说话的唯一原因。即使她在此期间不得不受苦，她也活到了今天，而这并不是每个人都能做到的。");
               break;
            case 1:
               outputText("没有别的看法——发生在她身上的事就是一场悲剧。奴役是毫无疑问的邪恶，人们不应该仅仅因为别人眼中的“必要性”就被剥夺自主权。你很高兴你能把她从那里救出来。");
               break;
            case 2:
               outputText("你告诉她，在不了解所有细节的情况下，你无法真正评判他们。当时看起来正确的事情可能会产生意想不到的后果，你甚至不知道他们收留她的原因。如果你现在就试图做出裁决，那就太冒昧了。");
         }
         outputText("[pg]她点点头，看起来并不完全信服。[say:谢谢你，[name]。我想我得再考虑一下。]她抬头看着你，笑了。[say:但因为你，我现在可以这么做了。哦，不过你的问题还有更多，抱歉我刚才跑题了，]她有些不好意思地说。[saystart]在沙漠之前，对吧……我知道的不多，但我不认为我是本地人。我记得……我记得一个平静、安宁的地方。那里的树很高，草很软。那里有一座小房子，一座小屋。我很安全。我不知道是什么把我从那里带走的。");
         outputText("[pg]但这就是全部了，[name]。还是没有什么具体的，抱歉。[sayend] [Bathgirlname]低头看着自己的脚，双手交叠放在腿上。[say:我希望有一天我能再次找到那个地方。]");
         outputText("[pg]一个值得追求的梦想。");
         doNext(milkTalkMenu);
      }
      
      public function milkTalkPast() : void
      {
         var answer2:int;
         var _g2:MilkWaifu;
         var answer1:int;
         var _g1:MilkWaifu;
         var answer:int;
         var _g:MilkWaifu;
         clearOutput();
         outputText("既然她现在大部分时间都很清醒，你想问问[bathgirlname]关于她过去的事。她到底是怎么成为沙漠女巫的奴隶的？在那之前她的生活是什么样的？");
         outputText("[pg]听到你的问题，她转过头，露出沉思的表情。过了一会儿，她闭上眼睛，似乎在深深地回忆着什么。[say:我……记不太清所有的事情了。但至少，我记得当时感到非常迷茫。那-那时候已经有些不对劲了，有些……我在沙漠里游荡，然后……然后一个女巫收留了我。我记得她们的魔法。我记得很久以来第一次感觉那么好。我记得自己慢慢地迷失了。]");
         outputText("[pg]她打了个寒颤，然后说道：[say:我仍然很感激她们，但是……回想起来，我不知道该怎么看待她们对我做的事。她们救了我，给了我生活，但是……我几乎宁愿她们……]她摇了摇头，睁开眼睛，抬头看着你，脸上写满了纠结。");
         outputText("[pg][say:她们做得对吗，[name]？]她问道。");
         menu();
         _g = this;
         answer = 0;
         addNextButton("对",function():void
         {
            _g.milkTalkPastAnswer(answer);
         }).hint("尽管发生了一切，她们还是救了她的命。");
         _g1 = this;
         answer1 = 1;
         addNextButton("不对",function():void
         {
            _g1.milkTalkPastAnswer(answer1);
         }).hint("没有人应该经历那种事。");
         _g2 = this;
         answer2 = 2;
         addNextButton("不知道",function():void
         {
            _g2.milkTalkPastAnswer(answer2);
         }).hint("如果不亲身经历，很难说。");
      }
      
      public function milkTalkMenu() : void
      {
         clearOutput();
         outputText("既然你们现在可以真正交谈了，那就有许多事情可以聊聊。");
         menu();
         addNextButton("她的过去",milkTalkPast).hint("你非常想了解更多关于她的事。");
         addNextButton("乳房大小",milkTalkBreasts).hint("她对变得这么轻盈有什么感觉？");
         addNextButton("奴隶",milkTalkSlave).hint("谈谈你们的关系。");
         setExitButton("返回",milkyMenu);
      }
      
      public function milkTalkLeave() : void
      {
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,870) == 0)
         {
            outputText((get_player().cor > 50 ? "真是浪费时间。你" : "虽然你可能永远不知道" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,838) > 0 ? "恶魔" : "沙漠女巫") + "对[bathgirlname]做了什么，但你确信她身上还有更多秘密。无论如何，你") + "撇下这个困惑的女孩，回到了营地。");
         }
         else
         {
            outputText("你轻轻拍了拍[bathgirlname]的头，告诉她现在还不是洗澡的时候。她看起来很失望，但并没有争辩，只是顺从地点了点头。");
            outputText("[pg][say:好吧，]她说道，[say:但如果你改变主意了，请随时回来。]");
            outputText("[pg]这是她迄今为止说过的最清晰的话了，真让人好奇。她内心深处绝对还保留着自我，你只需要找到合适的方法把她引导出来。");
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function milkTalkBreasts() : void
      {
         clearOutput();
         outputText("经历如此巨大的变化对她来说一定是个不小的冲击，但你从未问过[bathgirlname]她真正的喜好是什么。她喜欢带着这么大的“累赘”吗？");
         outputText("[pg]她几乎是用一阵气声打断了你。[say:哦，我[i:非常]高兴我现在这个样子。相信我，我无法想象回到那种生活，甚至无法思考。]");
         outputText("[pg]这当然可以理解，但你更好奇的是体型。如果没有那些副作用，她会想要那样吗？");
         outputText("[pg][say:不-不！]她喊道，脸上泛起一丝红晕。[say:胸部大到我甚至无法走路！一动就漏奶！痛，总是痛，直到有人过来，我才能用我的——[b:淹没]他们]她突然停止了说话，脸红得更厉害了。过了一会儿，她又开始说话，脸上带着微笑，你能看出这只是为了掩饰刚才的尴尬。");
         outputText("[pg][say:我，嗯，我想这也没那么糟。我一开始确实是自愿去找沙漠女巫的。不过，我非常高兴我的，呃，“资产”变得更容易管理了。它们仍然很令人享受，]她一边说，一边试探性地挤了挤自己的胸部。");
         doNext(milkTalkMenu);
      }
      
      public function milkTalkAnswer(param1:int) : void
      {
         clearOutput();
         switch(param1)
         {
            case 0:
               outputText("你这边没什么可抱怨的。你的心情非常好，知道她恢复得足以问候你，这让你感觉更好了。");
               outputText("[pg]听到这里，[bathgirlname]咧嘴笑了，露出她漂亮的白牙。[say:太好了！我很高兴，在你为我做了那些之后，你真的值得。]");
               break;
            case 1:
               outputText("你感觉很一般。没有什么特别令人兴奋的，但也没有什么灾难引起你的注意。你的心态最好用耸耸肩来概括。");
               outputText("[pg][Bathgirlname]不太知道该如何反应，紧张地扭动了几下，最后才说出：[say:嗯，我希望事情会变得更好。我想。]");
               break;
            case 2:
               outputText("你不知道该归咎于神明的恶意还是仅仅是运气不好，但事情确实在走下坡路。至少，知道她足够关心你并问候你，确实让你感觉好了一点。");
               outputText("[pg]你的女奴皱起了关切的眉头。[say:听到这个我很难过，[name]。如果有什么我能做的让你感觉好点，一定要告诉我。]");
               break;
            case 3:
               outputText("你感觉越来越热，看着你女奴诱人的身体对事情没有任何帮助。你甚至不需要告诉她，因为你眼中的神情已经说明了一切。");
               outputText("[pg]她红着脸，但并没有退缩。[say:啊，那个，也许我能帮上忙，你知道的，]她说着，两根手指对点着。");
         }
         outputText("[pg]然而，对话再次陷入了停滞，[bathgirlname]看起来有些沮丧。不过，她还是勉强振作了一点，说道：[say:嗯，我想现在我能说的就这些了。谢谢你陪我聊天，[name]，我很乐意以后再和你聊聊。]");
         outputText("[pg]说完，她带着一丝微笑溜走了。不过，知道现在能和她正常交流了，感觉还不错。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function milkSlaveAtCamp() : Boolean
      {
         if(milkSlave())
         {
            return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1089) == 0;
         }
         return false;
      }
      
      override public function milkSlave() : Boolean
      {
         return get_milkName().length > 0;
      }
      
      public function milkBathTime() : void
      {
         get_player().slimeFeed();
         clearOutput();
         outputText("你揉了揉[bathgirlname]的头发，告诉她她的乳房看起来有点胀。当你脱衣服时，她热切地抬头看着你。脱光后，你跳进浴缸里说，[say: 洗澡时间到了。]");
         outputText("[pg]带着颤抖的期待，[bathgirlname]伸手去摸她的");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,870) == 0)
         {
            outputText("乳头般的");
         }
         else
         {
            outputText("突出的");
         }
         outputText("乳头。因为期待，她的乳晕上渗出白色的汗珠，女人的双手急切地在上面忙活起来，开始挤出最初的乳汁，倾注到你周围的池子里。你把塞子放进排水孔，抬起头来。伴随着愉悦的娇喘，这个巨乳女孩终于用颤抖的指尖握住了她那胀痛的喷乳口。她揉捏了一会儿乳头，双眼因快感而半闭着，随后向浴缸中释放出第一股浓稠的白色洪流。当她给自己挤奶时，[bathgirlname]的眼神似乎变得空洞，完全被快感淹没，她的嘴忙着发出舒缓的叹息，根本说不出话来。");
         outputText("[pg]珍珠般的液体迅速填满了浴缸底部的几英寸，从摩卡色的喷口中分出无数股水流倾泻而下。灵巧的双手以平滑、连贯的动作按摩着柔软的女性肌肤，从根部到尖端挤压着每一个乳头，然后再退回底部。稳定而有节奏的来回动作让乳汁的喷射随着节奏起伏，但水流依然浓稠稳定，足以在你的[hips]上溅出白色的斑点。你靠在水池边的一条长凳上放松下来，双手在“水”中漫不经心地划动，享受着乳汁在你的[skinfurscales]上越涨越高的感觉。[bathgirlname]，你唯一的同伴，继续揉捏着她那");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,870) == 0)
         {
            outputText("巨大的");
         }
         else
         {
            outputText("母牛般的");
         }
         outputText("乳房，你不得不承认，看着她那沉甸甸的双乳努力填满你的浴缸时，你感到一阵性奋的战栗顺着脊背滑下。");
         outputText("[pg]你闭上眼睛，将这些液体按摩进皮肤，尽管下半身开始发热，但你却感到一种奇特的宁静与洁净。即使乳脂流过你的");
         if(get_player().get_gender() == 1)
         {
            outputText(get_player().multiCockDescriptLight());
         }
         else if(get_player().get_gender() == 2)
         {
            outputText("[vagina]");
         }
         else if(get_player().get_gender() == 3)
         {
            outputText("[cocks]和[vagina]");
         }
         else
         {
            outputText("[butt]");
         }
         outputText("，你还是忍住了想要自慰的冲动，专注于你原本想做的事——洗澡。当乳汁没过你的[chest]时，[bathgirlname]发出一声满足的呻吟，她的乳房似乎终于稍微平息了一些，尽管此时她正因快感而剧烈颤抖，翻着白眼无意识地揉弄着自己的乳头。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,870) == 0)
         {
            outputText("[pg]尽管如此，那对巨大的产奶器依然大得足以把她钉在浴缸旁边。照这个速度，即使你已经深陷在她那令人愉悦的体液中直到脖子，她可能也依然无法动弹。");
         }
         outputText("[pg]这个深肤色女人的丰润双唇微微张开，舌头淫靡地伸了出来。她看起来……不仅仅是高兴——简直像是高潮了一样。她那原本稳定挤压的双手，现在正以狂热的强度抚摸着乳头，时不时停下来爱抚她胸前那巨大的肉团，挤出更多的乳汁。她颤抖着，为你注满浴缸，快乐地为她的朋友奉献出自己的一切。随着时间的推移，她那幸福的表情变得越来越满足，紧接着伴随一阵战栗，她在狂喜中尖叫呻吟，身体剧烈颤抖，肌肉扭动着，让她那现在正晃动着的双乳产生了一阵巨大的震颤。与此同时，一股巨大的乳汁喷射而出，其力量之大足以将你推到浴缸壁上，并浸湿你的头发。当这一切结束时，浴缸已经满了，而那个神志不清的女孩正幸福地喘息着。[pg]");
         get_player().hasGottenWashed();
         outputText("[pg][bathgirlname]退了回去，舔着她那肿胀的嘴唇，散发着强烈的女性发情气味，不过显然已经满足了。她呜咽着，[say:我喜欢洗澡时间，]然后");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,870) == 0)
         {
            outputText("开始挪动她那庞大的乳房，找个舒服的地方准备小睡一会儿");
         }
         else
         {
            outputText("挣扎着站起身来，双腿因强烈的乳头高潮余韵而发抖");
         }
         outputText("。");
         if(get_player().get_lust() >= 33)
         {
            outputText("如果你想的话，你也许可以在浴缸里自慰，或者把这个深肤色的挤奶女仆拉进来陪你。");
         }
         outputText("你要做什么？");
         menu();
         addButton(1,"奶牛妹",pullInZeMilkGirl);
         if(get_player().get_gender() > 0 && get_player().get_lust() >= 33)
         {
            addButton(0,"喝奶自慰",drinkAndFapturbate);
         }
         var _loc1_:int = 0;
         if(get_sophieFollowerScene().sophieFollower())
         {
            _loc1_++;
         }
         if(jojoFollower())
         {
            _loc1_++;
         }
         if(get_latexGirl().latexGooAtCamp())
         {
            _loc1_++;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,498) == 1 || get_player().get_armor() == get_armors().GOOARMR)
         {
            _loc1_++;
         }
         if(get_amilyScene().amilyFollower() && !get_amilyScene().amilyCorrupt())
         {
            _loc1_++;
         }
         if(get_helScene().followerHel())
         {
            _loc1_++;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,238) == 1)
         {
            _loc1_++;
         }
         if(get_emberScene().followerEmber())
         {
            _loc1_++;
         }
         if(get_kihaFollowerScene().followerKiha())
         {
            _loc1_++;
         }
         if(_loc1_ >= 3)
         {
            outputText("话说回来，既然你在洗澡，也许你的其他朋友也想加入你？");
            addButton(2,"公共浴池",communalBath);
         }
         addButton(4,"放松",relaxWithMilkWaifu);
      }
      
      public function load(param1:int, param2:*) : void
      {
         Utils.extend(saveContent,param2);
      }
      
      public function get_milkName() : String
      {
         return FlagDict_Impl_.arrayReadString(KFLAGS.flags,869);
      }
      
      public function get_debugName() : String
      {
         if(get_milkName() != "")
         {
            return get_milkName();
         }
         return "乳奴";
      }
      
      public function get_debugHint() : String
      {
         return "";
      }
      
      public function fuckTheMilkWaifu() : void
      {
         clearOutput();
         outputText("你转过身，把这个产奶荡妇拉向你，她巨大的乳房紧紧压在你的[chest]上，直到喷出乳汁。你抚摸着她的脸颊，让她的嘴唇贴上你的。她的手再次找到了你的[cock]，随着你的舌头探入她的口中，她撸动的速度越来越快，你的双手也向下游走，摸索着她丰满的屁股和宽大的、适合生育的臀部。你的情人重重地叹了口气，呼吸中充满了欲望。你把她推到浴缸边缘，她的双腿大张，让你能轻松接触到她那被乳汁润滑的小穴。她双臂环住你的肩膀，当你压向她时，她发出愉悦的呻吟，你的[cock]轻松地滑入她湿润的肉穴。");
         outputText("[pg]沉浸在奶油般的乳汁海洋中，滑入[bathgirlname]体内是如此的容易，");
         if(get_player().cockArea(0) < 20)
         {
            outputText("将你那几英寸长的肉棒推入她体内，直到你们的臀部紧贴，她那松软舒适的小穴轻松地容纳了你的长度");
         }
         else if(get_player().cockArea(0) < 50)
         {
            outputText("一次长长的抽插就直没到底");
         }
         else
         {
            outputText("你的肉棒尽可能深地插入，多余的肉棒被你们之间乳白色的液体包裹着");
         }
         outputText("。随着你的肉棒埋入她体内，[bathgirlname]用双腿勾住你的[hips]，开始轻轻摇晃她的臀部，让你掌握主动权。你对着这个温顺的女孩笑了笑，将手指陷入她那产奶的乳肉中，开始移动你的臀部，以有节奏的轻松感向她体内抽插，让乳汁涌入她的通道，包裹你的肉棒，润滑每一次抽插。");
         outputText("[pg][say: 太、太棒了，[name]，]她呻吟着，[say: 感觉太太太舒服了！哦，天哪！]");
         outputText("[pg]你加快了速度，越插越深，乳白色的波浪在她的乳沟里翻腾，甚至溢出了水池。你的爱人紧紧地抱住你，随着你的抽插，她的阴道里流出了乳汁和透明的淫液。在抽插的间隙，你俯下身，将嘴唇贴在她的唇上，用一个漫长的吻堵住了她狂喜的呻吟。当你松开她时，唾液和乳汁的混合物仍然连接着她丰满、暗沉的嘴唇和你的嘴唇，她的舌头因为性爱的快感而微微伸出。她的整个身体开始颤抖，巨大的胸部随着她接近高潮而起伏。当她高潮时，你放纵了自己，随着她第一声高潮的呻吟回荡，你发出原始欲望的咆哮，与她一起高潮，用浓稠的精液涂抹她沾满乳汁的阴道，让一团又一团的精液加入其中，用你强效的种子填满她的子宫。");
         outputText("[pg]你让女孩继续了很长很长一段时间，随着你将最后几滴精液射入她体内，你因性释放而颤抖。伴随着一声沉重的叹息，你向前瘫倒，将头埋进她惊人的胸部休息。当奶牛女孩用双臂环绕着你，将你紧紧抱在怀里时，你咧嘴笑了。");
         outputText("[pg]你的全身都感到深深的清爽，她的奶水彻底浸透了你的身体，让你感到清新和充满活力，由于你们幸福的交媾，每一块肌肉似乎都放松了。你开始感谢[bathgirlname]愉快的陪伴，但当你张开嘴时，她把嘴唇贴在你的嘴唇上，进行了一个漫长而充满舌头的吻。你暗自轻笑，紧紧抱住这个女孩，尽可能地贴紧她的乳房，把她转到一边，让她把脸颊蹭进你的[chest]，在你们俩爬出水池之前亲吻她的头顶。你不得不帮她出来，她巨大的额外重量几乎把她拖回水里，多亏了你敏捷的反应。你收集了你的[armor]，揉了揉奶奴的头发，然后抓起一条毛巾，漫步回到营地的中心。");
         get_player().orgasm("Dick");
         get_player().HPChange(get_player().maxHP() * 0.33,false);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function fuckDatMilkSlat() : void
      {
         clearOutput();
         var _loc1_:int = get_player().cockThatFits(50);
         outputText("坐在那个浑身是奶的女孩身后，胸膛紧紧贴着她的后背，紧到能感觉到她的每一次呼吸，你忍不住感觉到 [bathgirlname] 丰满圆润的屁股摩擦着你的 " + get_player().cockDescript(_loc1_) + "。回应着她的触碰，你的肉棒开始变硬，穿过你的[armor]填满了 [bathgirlname] 的臀沟。当她感觉到你的肉棒顶着她丝滑的内衣时，她微微喘息了一声，但你能感觉到她的心跳加速，她的肉体变得滚烫，她开始更刻意地扭动屁股，从根部到头部摩擦着你。");
         outputText("[pg]你的一只手从 [bathgirlname] 的乳头上滑下，手指沿着她柔软的肌肤和丰满的曲线滑到她内裤的边缘。你一个流畅的动作把它们拉下来，露出了她暗色臀瓣的饱满轮廓。她立刻向后推，在你的肉棒上上下套弄，而你则努力从你的[armor]中挣脱出来。终于，你的 " + get_player().cockDescript(_loc1_) + " 从束缚中弹了出来，却立刻埋进了 [bathgirlname] 的臀沟里；当你的肉棒穿过她的峡谷时，她发出了快乐的、少女般的咯咯笑声，几乎是在你的鸡巴上弹跳。你双臂环绕着她的腰，一只手揉捏着她仍然渴望的乳头，另一只手潜入她的双腿之间，轻松地将几根手指滑入她湿透的阴户。[bathgirlname] 随着你的手指进入而发出充满情欲的呻吟，当你的指尖抚摸着她内壁和痉挛的肌肉时，她咬住了下唇，很快就被她的女性体液浸透了。你的拇指在她阴蒂的蓓蕾上打转，从她唇间引出断断续续的愉悦喘息，直到你用一个吻让她安静下来，把你的舌头伸进她的嘴里，同时你的手指攻击着她的阴户，抠弄着她，直到她变得舒服、湿润，准备好了。");
         outputText("[pg]你微微向前移动，将你的 " + get_player().cockDescript(_loc1_) + " 从 [bathgirlname] 的臀沟中拖出，进入她女性特质的欢迎拥抱中。当你的 " + get_player().cockHead(_loc1_) + " 压入她体内，分开她小穴的褶皱，感受到她内壁亲吻你龟头的滚烫触感时，你们俩都发出了情欲的呻吟。你以一种有节奏的从容滑入她体内，" + get_player().cockDescript(_loc1_) + " 撑开她的内壁，你的臀部迎合着移动，你的腹股沟顶着她的翘臀，肉体屈服着，你试图将尽可能多的鸡巴肉滑入她渴望的通道。");
         outputText("[pg]当你把 [bathgirlname] 操到根部时，她已经一塌糊涂了，阴户淫荡地流着水，舌头挂在嘴边。当你的手指重新环绕住她樱桃红的乳头时，她的胸膛在你的手中起伏，当她在你的鸡巴上起伏，臀部开始在你身上弹跳时，她的乳汁断断续续地喷涌而出。你配合着她的动作，将你的[hips]狠狠地撞向她，将你的 " + get_player().cockDescript(_loc1_) + " 刺入她紧致的深处。[bathgirlname] 双手捧着乳房，捧起一把把乳汁，泼在你的肉棒和她的阴户上，几乎用这股凉爽的乳汁浇灭了你情欲的火焰；但另一次打桩机般的冲刺表明她的乳汁是极好的润滑剂，让你轻松地滑入她体内。很快你们俩都发出了情欲的呻吟，当你操着 [bathgirlname] 滴水的阴户时，愉悦的喘息和叹息在营地里回荡。");
         outputText("[pg]你能感觉到你的高潮在积聚，随着你的 " + get_player().cockDescript(_loc1_) + " 无情地撞击 [bathgirlname] 而汹涌澎湃。伴随着一声野兽般的咆哮，你把她按倒成四肢着地的姿势，抓住她的屁股作为借力点。当你把她按倒时她尖叫了一声，但她瞬间就恢复了，当你的手指陷入她柔软的肉体时，她诱人地扭动着屁股。满眼都是那个大而柔软的屁股随着你的鸡巴猛击 [bathgirlname] 而摇晃，你忍不住要射了。你咬紧牙关，狠狠地在 [bathgirlname] 的屁股上打了一巴掌，让她发出痛苦与快乐交织的尖叫，她的阴户在恰到好处的时刻挤压着你的 " + get_player().cockDescript(_loc1_) + "：你将一股白热的精液直接射入她的子宫，鸡巴齐根埋在她的体内。在你痉挛的鸡巴周围，[bathgirlname] 的小穴颤抖着收缩，榨干你的每一滴精液；她的乳头释放出一股狂野的乳汁，在你们周围汇聚成水洼，几乎掩盖了从她被蹂躏的小穴中流出、弄脏地面的多余精液。");
         outputText("[pg]当你的鸡巴终于射空了存货，你发出一声满足的叹息拔了出来，把最后几滴精液擦在 [bathgirlname] 的大腿上。她翻过身来，脸上带着被情欲迷晕的微笑，漫不经心地用手指抠弄着她被填满的阴户，抚摸着她丰满的乳房。她给了你一个短暂的勾引眼神，召唤你过去，[bathgirlname] 发出少女般的咯咯笑声把你拉进怀里，让你躺在背上，用她的脸颊蹭着你的[chest]。你进入了愉快的休息状态，性方面得到了满足，你的爱人也被挤干了奶。");
         get_player().orgasm("Dick");
         dynStats(DynStat.Sens(-1));
         get_player().changeFatigue(-10);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function finishMilkNormall() : void
      {
         clearOutput();
         outputText("你在 [bathgirlname] 耳边轻声说了几句安慰的话，但手上的动作却没有丝毫放松。你的手指不断挤压揉捏，继续从她的乳房中挤出乳汁，直到她几乎被流淌的乳汁染成白色。几分钟后，你能真切地感觉到她冲破了极乐的边缘：从她坚挺的乳头喷出的乳汁流翻了一倍，喷射出几英尺长的弧线，她的声音也变得沙哑，向着天空发出一声尖叫；[bathgirlname] 的整个身体都在颤抖，双腿几乎要瘫软下去，乳头高潮震撼着她纤细的身躯。");
         outputText("[pg]爆炸性的乳头高潮一平息，她就瘫倒在你身上，胸口因为愉悦的疲惫而剧烈起伏。乳汁的流淌渐渐停止，她的乳房暂时干瘪了下去。[bathgirlname] 抬头看着你，微微一笑，抚摸着你的脸颊，然后捧着她明显酸痛的乳头，踉踉跄跄地站起来，寻找毛巾。");
         outputText("[pg][say: 谢谢你，[name]，] 当你擦干身体时，她简单地说道。");
         get_player().changeFatigue(-50);
         dynStats(DynStat.Lust(10 + get_player().sens / 10),DynStat.NoScale);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function drinkAndFapturbate() : void
      {
         clearOutput();
         outputText("你呼唤那个黑皮肤的女人，让乳汁遮掩住你开始自慰的双手，并告诉她你想喝点东西。[bathgirlname]羞怯而顺从地向你移了回来，展示出她巨大的乳房。");
         outputText("[pg][say: 对不起，[name]，]她呜咽着，依然像往常一样温顺，[say: 多喝点。]");
         outputText("[pg]她转动了一下肩膀，让浴缸边缘那对沉甸甸的“产奶工厂”发出一阵诱人的晃动，她那黑色的乳头沾染着新鲜的白色水滴。乳白色的液滴顺着这个黑皮肤荡妇乳房的下缘滚落，滴入浴缸，在池子里激起微小的奶油波纹。她那被频繁使用的乳房此刻看起来几乎涨得过头了，肿胀、发红，甚至透过她晒得黝黑的皮肤都能看出来。当你靠近时，浓稠的雪白花蜜开始从她的每个乳头尖流出，对于这个永远充满乳汁的“人形产奶机”来说，期待已经太过强烈了。");
         outputText("[pg]你含住她的乳头，试探性地舔了一下。珍珠般的液体带来了甜味，但她的皮肤也尝起来有淡淡的汗水咸味，并不难吃。你低头看着眼前的乳房，意识到即使把这个“喷奶口”含在嘴里，你也只吞下了她乳房的一小部分。她大部分的乳晕在你面前展开，大小几乎相当于");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,870) == 0)
         {
            outputText("一个餐盘");
         }
         else
         {
            outputText("一个张开的手掌");
         }
         outputText("但却更加令人兴奋。在吞下了几口她身体分泌的乳汁后，你伸手摸向你的");
         if(get_player().hasVagina())
         {
            outputText("[vagina]，漫不经心地抚摸着你那肿胀、充满欲望的阴户");
         }
         else
         {
            outputText("[cock]，漫不经心地抚摸着那肿胀的肉棒");
         }
         outputText("，你不禁发出了一声淫荡的呻吟。塞在你嘴里的肥大乳头很好地掩盖了你愉悦的叫声");
         if(get_player().hasCock())
         {
            outputText("，但它几乎无法掩饰[eachCock]的肿胀——你已经有了足够的奶水");
         }
         outputText("。");
         get_player().refillHunger(50);
         outputText("[pg]一声兴奋的呻吟从[bathgirlname]丰满的嘴唇中溢出，证明了她那被奶水胀满的乳房是多么敏感。当你的舌头在漏水的乳头那粗糙的皮肤上打转时，她又发出了一声带着喘息的愉悦娇喘。这声音的颤抖似乎一直传到了你的下半身，与你手指的抚摸交织在一起，激起了你一阵阵酸痛、颤抖的性欲。");
         if(get_player().get_gender() == 3)
         {
            outputText("你的[cock]在手中痛苦地跳动着，如此滚烫坚硬，你确信自己肯定已经开始流出先列腺液了，但任何液体都很快被无处不在的奶水冲刷掉了。");
            if(get_player().cockTotal() > 1)
            {
               outputText("你确保平等地爱抚你的每一根肉棒，随着你不断膨胀的激情节奏，抚摸、挤压、套弄着。");
            }
            outputText("你用另一只手，将沾满奶油般润滑液的手指探入你湿透的阴蒂，阴唇轻易地分开，让你几根探索的手指进入其中。当你的[clit]从包皮中探出，完全充血，因渴望而微微跳动时，美妙的快感随之绽放。你在继续用手指抠弄小穴之前，先在阴蒂上刷了几下，但你确保每隔一会儿就用拇指拨弄一下阴蒂，让自己尽可能保持在巅峰状态。真的，作为一个双性人真是太幸福了。");
         }
         else if(get_player().hasVagina())
         {
            outputText("你的淫液与浴缸里白色的“水”自由混合，让你沾满奶油般润滑液的手指能轻松地插入你的[vagina]。你像一个熟练的情人一样，带着亲密的熟悉感抚摸着你的阴唇，爱抚着产道的内部，玩弄着你的身体，直到你感觉自己失去了控制，被欲望缠绕得像一根过度紧绷的吉他弦，震动得失去了控制。");
         }
         else
         {
            outputText("[OneCock]在手中痛苦地跳动着，如此滚烫坚硬，你确信自己肯定已经开始流出先列腺液了，但任何液体都很快被无处不在的奶水冲刷掉了。");
            if(get_player().cockTotal() > 1)
            {
               outputText("你确保平等地爱抚你的每一根肉棒，随着你不断膨胀的激情节奏，抚摸、挤压、套弄着。");
            }
            if(get_player().balls > 0)
            {
               outputText("你用另一只手托起你的[sack]，掂量着你的[balls]，感受着你的欲望翻腾到新的高度。");
            }
         }
         outputText("[pg]一股温暖的喷流打在你的肩膀上，你转过身去，高兴地看到[bathgirlname]的另一个乳房正在释放出又一股强劲的丝滑美味。带着一丝遗憾，你拔了出来，脸上被喷得满是奶水，连头发都湿透了，然后你在心跳间转向了那个喷泉般的乳头。你努力吞咽以跟上水流，脸颊因压力而鼓起。最终，由于你有限的吞咽能力和从你腹股沟盘旋而出的快感浪潮，你没能把所有的奶水都喝下去，它从你的嘴角喷出，顺着你的下巴流下。");
         outputText("[pg]此时浴缸已经危险地满了，奶水像涨潮一样拍打着边缘，当你高潮时，你短暂地想，也许，它已经溢出来了。白热的温度穿过你的身体中段，慵懒地爬上你的脊椎，对你的大脑发起攻击。你的下巴锁紧，不经意间咬住了巧克力色的乳头，暂时止住了它的流动。你的[hips]似乎不受控制地前后摆动，激起奶油般的波浪，在房间里四处飞溅，把地板和你的装备都浸泡在奶水中。");
         if(get_player().hasCock())
         {
            outputText("[EachCock]释放出自己黏糊糊的精液，喷溅着加入到这珍珠般的洪流中。");
            if(get_player().cumQ() >= 1500)
            {
               outputText("随着你释放的每一股精液，你都能看到它部分地升出浴缸，被你惊人的男子气概推向最近的雌性标本。");
            }
            if(get_player().cumQ() >= 4000)
            {
               outputText("很快，浴缸里的液体冲破了束缚，将你同伴暗色的肌肤染成了白色，这层雪花石膏般的釉面会诱惑你做出更放荡的举动，如果不是你现在的男性特征散发着满足的惬意的话。");
            }
         }
         if(get_player().hasVagina())
         {
            outputText("与此同时，你那充满汁液的小穴感觉就像在里面做后空翻一样，扭曲、挤压着，喷涌出充满女性喜悦的液体。只要在你的[clit]上刷一下，你的[legs]就会发软，但谢天谢地，你漂浮着度过了剩下的高潮。");
         }
         outputText("[pg]当你和她分开时，另一个女孩发出了一声悠长、低沉的满足的咕哝声，她羞涩地低语道，[say:谢谢你，]然后她");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,870) == 0)
         {
            outputText("拖着她巨大的乳房走过满是水坑、被奶水弄得滑溜溜的地板");
         }
         else
         {
            outputText("跌跌撞撞地走开，温柔地捧着她鲜红的乳头");
         }
         outputText("。你得意地笑了笑，性欲得到了满足，拔掉浴缸的塞子，站在那里，看着散发着性爱气味的乳汁浴水顺着下水道流走。快速擦干身体后，你准备出发了，感觉稍微清爽了一些，也相当满足。虽然把你的[armor]弄干并穿好花了一点时间，但你还是搞定了。");
         get_player().orgasm("Generic");
         get_player().refillHunger(30);
         get_player().changeFatigue(-33);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function dontFuckTheMilkWaifu() : void
      {
         clearOutput();
         outputText("你让女孩继续了很长很长一段时间，直到你感觉全身都得到了深度的放松，她的乳汁彻底浸透了你的身体，让你感到神清气爽、充满活力。你正准备感谢这位产奶女孩带来的愉悦陪伴，但当你张开嘴时，她却滑入你的怀中，将嘴唇贴在你的唇上。你暗自轻笑，紧紧抱住女孩，尽可能地贴近她，尽管她那巨大的乳房有些碍事。你把她转到一边，让她把脸颊埋进你的[chest]里，在你们爬出水池前，你亲吻了她的头顶。你不得不帮她一把，她那巨大的额外重量差点把她拖回水池，多亏了你敏捷的反应。你拿起你的[armor]，揉了揉这个产奶奴隶的头发，然后抓起一条毛巾，溜达回营地中心。");
         dynStats(DynStat.Lust(10 + get_player().sens / 10),DynStat.NoScale);
         get_player().HPChange(get_player().maxHP() * 0.33,false);
         get_player().changeFatigue(-20);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function debugMenu(param1:Boolean = true) : void
      {
         get_game().debugMenu.debugCompEdit(saveContent,new SaveContent(null));
      }
      
      public function communalBath() : void
      {
         clearOutput();
         get_images().showImage("communal-bath");
         outputText("当你在浴缸里放松时，你觉得有这么多牛奶却只顾自己独享是不公平的。你坐起来吹了一声响亮的口哨，引起了营地其他人的注意。[say:大家都跳进来吧！]你大喊着，迅速抓住[bathgirlname]的腰，把她拖了进来。她伴随着一声尖锐的惊呼跌入了自己的乳汁中，片刻后又喷着水浮出水面。");
         if(get_isabellaFollowerScene().isabellaFollower())
         {
            outputText("[pg]片刻之后，伊莎贝拉高大的身影漫步走来，已经把她的裙子扔到了一边。");
            if(get_isabellaFollowerScene().isabellaAccent())
            {
               outputText("[say:怎么，伊莎贝拉的奶对你来说不够好吗，[name]。不过，我倒是可以洗个澡。]");
            }
            else
            {
               outputText("[say:怎么，我的奶对你来说不够好吗，[name]？不过，我倒是可以洗个澡。]");
            }
         }
         if(get_sophieFollowerScene().sophieFollower())
         {
            outputText("[pg][say:哦，新鲜的牛奶！]索菲高兴地惊呼。她蹲在池边，舀起一把，将浓稠的奶油状牛奶送到唇边。她开心地舔着，翅膀扑腾着，将更多的牛奶涂抹在绒毛之间白皙的皮肤上。");
         }
         if(jojoFollower())
         {
            outputText("[pg]" + (get_noFur() ? "皮肤苍白" : "长着白毛") + "的僧侣乔乔有些犹豫地走近池子，看着满缸的奶油。[say:多……下流。不过，这么好的东西浪费了就太可惜了。]僧侣慢慢地脱下衣服，只剩内衣，然后下到附近的池子里。");
         }
         if(get_latexGirl().latexGooAtCamp())
         {
            outputText("[pg]你向你那乌黑的乳胶粘液招手，让她喝下去。[say:主—[master]？]她说着，在池边停了下来。你重复了你的命令，拍打着乳白色波浪的表面。看起来她原始的饥饿感在片刻之后占据了上风，她滑入广阔的乳汁海洋中，将其吸收。");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,498) == 1 || get_player().get_armor() == get_armors().GOOARMR)
         {
            outputText("[pg]瓦莱丽娅粘稠的身体在几英尺外成型，当她审视着等待她的牛奶浴时，呈现出人类的形态。[say:该死，[name]。这女孩身上装了水龙头。等我们洗完后，应该从湖里叫些女孩上来完成剩下的工作。]瓦尔轻笑着滑入池中，当奶油流过她多孔的身体时，她变成了更明亮的蓝色。");
            get_valeria().feedValeria(100);
         }
         if(get_amilyScene().amilyFollower() && !get_amilyScene().amilyCorrupt())
         {
            outputText("[pg]鼠娘艾米莉很快回应了你的呼唤。她很高兴能享受简单的沐浴，即使是牛奶浴，她也迅速把衣服扔到一边，跳进你身边，即使棕色的头发湿透了，也笑着调皮地泼水。");
         }
         if(get_helScene().followerHel())
         {
            outputText("[pg]伴随着一声欢呼，赫尔冲向水池。她动作敏捷地将鳞片比基尼扔到一边，像炮弹一样跳入水中，溅起一阵奶油色的潮水。你轻笑着擦了擦眼睛——正好看到她的比基尼泳裤落在你的脸上。");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,238) == 1)
         {
            outputText("[pg]你甚至没注意到伊兹玛进了水池。她出现的第一个迹象是水面上突然出现一个鲜红色的鳍，向你靠近。她在最后一刻浮出水面，开心地笑着，给了她的阿尔法一个吻。");
         }
         if(get_emberScene().followerEmber())
         {
            outputText("[pg]烬走近水池，爬行动物的尾巴急切地摆动着。" + get_emberScene().emberMF("他","她") + "轻松地潜入水中，当牛奶冲刷着" + get_emberScene().emberMF("他","她") + "布满鳞片的身体时，满足地叹了口气。[say:你们人类平时就是这样洗澡的吗？]" + get_emberScene().emberMF("他","她") + "沉思着。[say:真奇怪。]");
         }
         if(get_kihaFollowerScene().followerKiha())
         {
            outputText("[pg]奇哈，你亲爱的暗色母龙，走过来看发生了什么骚动，但看到你在母乳中洗澡时，她嗤之以鼻。[say:呃。你怎么能……在那种东西里打滚？真恶心！]");
            if(get_silly() && get_player().get_str() > 80 && get_player().get_spe() > 80)
            {
               outputText("你毫无预兆地抓住了奇哈。[say: 喂，你在干什么，笨蛋？]当你终于把她拉进牛奶浴时，她大喊道。[say: 你干了什么，白痴！？好吧，我洗。你满意了吧？八嘎！]她嘟囔着。");
            }
         }
         outputText("[pg]在朋友和爱人的簇拥下，你在池子里放松下来，双臂向后靠在池边，闭上眼睛，满足地叹了口气。你的朋友们互相泼水嬉戏，很高兴能享受这片刻的幸福与宁静，远离世俗的烦恼，远离恶魔、怪物，以及这个世界所变成的恐怖模样。你身边的波浪被推开，牛奶向两边分开，一对巨大的乳房向你移动过来；你低头一看，是[bathgirlname]蜷缩在你的臂弯里。她那巨大的乳头漂浮在水面上，在自己制造的海洋上以一种奇特的优雅姿态轻盈地摇曳着。");
         outputText("[pg]不用你开口，[bathgirlname]就转过身来，把一点牛奶揉进你的皮肤里，温柔地为你洗浴。她深色的手指穿过你的头发，彻底清洗干净后，又移到你的手臂、[chest]和腿上，清洁你[skinfurscales]的每一寸肌肤。你在[bathgirlname]的抚摸下放松下来，任由她按摩你疲惫的肌肉，驱散你的烦恼。在你的周围，你的追随者们也开始做同样的事情，轮流为彼此洗浴，用[bathgirlname]慷慨提供的舒缓牛奶擦洗背部和四肢。");
         outputText("[pg]你们就这样持续了将近一个小时，享受着在这个黑暗时代里难得的放松。不过，你最终还是知道自己必须回到职责中去。你和你的同伴们一个接一个地从池子里爬出来，停下来帮助[bathgirlname]和她那胀鼓鼓的乳房；毛巾在开玩笑和调情的手中传递，有几条甚至抽打在裸露的皮肤上，惹得女孩们尖叫连连。营地很快就变成了一片欢声笑语的海洋，而你就在这中心，在无耻的摸索和顽皮的爱抚之间戏弄着你的爱人们。");
         get_player().refillHunger(50);
         get_player().changeFatigue(-40);
         get_player().HPChange(get_player().maxHP() * 0.33,false);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function beARugMunchingMilkDyke() : void
      {
         clearOutput();
         outputText("你在奶白色的池水中转过身，将可爱的挤奶女仆紧紧搂在怀里。她惊讶地喘了口气，但当你把嘴唇贴在她的唇上时，她立刻安静下来。你的双手在她巨大的乳房和柔软、沾满乳汁的身体上游走。她依偎着你，头靠在你的[chest]上，你紧紧抱住她，抚摸着她的黑发。享受了片刻这简单的快乐后，[bathgirlname]的脸颊在你的乳房上蹭了蹭，用她丰满、暗色的嘴唇含住了你的[nipple]。当她温柔地吸吮时，你发出一声长长的呻吟，");
         if(get_player().lactationQ() >= 200)
         {
            outputText("从你充满母性的乳房中吸出了一缕乳汁。她大口吞咽着，仰起头对你微笑，一缕你的乳汁顺着她的下巴流下，滴入她自己");
         }
         outputText("的池水中。她的手顺着你的身体向上滑，拂过你的外阴和[clit]，然后托起你的另一侧乳房，纤细的手指包裹住你的[nipple]。她用灵巧熟练的动作，在手指间揉捏你的乳头，像对待自己的乳房一样揉弄着你的乳房");
         if(get_player().lactationQ() >= 200)
         {
            outputText(", 她用你从未体验过的娴熟技巧为你取精；这也难怪，毕竟她的整个存在都围绕着这同一项技艺？");
         }
         else
         {
            outputText("。");
         }
         outputText("[pg]你向后靠在池边，双臂搭在边缘，任由女孩在你身上施展她的技巧，你的胸膛很快就在她的每一次触碰下起伏颤抖。你几乎没有注意到女孩的另一只手消失在乳白色的波浪下，肯定是在抚慰她自己，而她的舌头和手指则在挤压和爱抚你的");
         if(get_player().lactationQ() >= 200)
         {
            outputText("乳白色的");
         }
         outputText("乳头，手法简直不可思议。当她捏揉、按摩、吮吸并亲吻你坚挺的乳峰时，你忍不住呻吟出声，一阵阵电流般的快感穿透你的胸膛，让你全身都在颤抖。你几乎是下意识地用[legs]缠住奶牛女孩的腰，将她紧紧地贴在你湿透的身体上，尽可能多地把你的[nipple]塞进她那技巧高超的嘴里。");
         outputText("[pg]很快，你能感觉到一种奇怪的压力在你的乳房中涌动。你花了一会儿才意识到这是乳头高潮，但当它袭来时，你仰起头，发出野兽般狂喜的叫声");
         if(get_player().lactationQ() >= 200)
         {
            outputText("，将乳汁喷洒在自己和那个让你体验到爆炸性快感的挤奶女工身上");
         }
         outputText("。你的手指穿过女孩的头发，催促她继续施展技巧。你的胸膛剧烈起伏颤抖着，在巨大的乳头高潮中，淫液从你的小穴喷涌而出，落入下方的乳白水池中。");
         outputText("[pg]你的全身感到无比清爽，她的乳汁浸透了你的身体，让你感到焕然一新、充满活力，每一块肌肉似乎都因为你们那令人沉醉的交欢而放松下来。你正想感谢这位产奶女孩带来的愉悦陪伴，但当你张开嘴时，她却将嘴唇贴上你的，给了你一个漫长而充满舌头交缠的吻。你暗自轻笑，在她的乳房允许的范围内紧紧抱住她，把她转到一边，让她把脸颊蹭进你的[chest]里，在你们爬出水池前亲吻了她的头顶。你不得不帮她出来，要不是你反应快，她那巨大的额外重量差点把她拖回水里。你收起你的[armor]，揉了揉这个产奶奴隶的头发，然后抓起一条毛巾，溜达回营地中心。");
         get_player().orgasm("Tits");
         get_player().HPChange(get_player().maxHP() * 0.33,false);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function backToCamp() : void
      {
         clearOutput();
         outputText("[say: 我想让你回营地去，]你告诉她。[say: 你在那儿对我更有用。][bathgirlName]皱了皱眉，但似乎接受了你的指示。");
         outputText("[say: 如您所愿。]她擦了擦手，然后慢慢地走出农场大门。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1089,0);
         doNext(get_game().farm.farmCorruption.rootScene);
      }
      
      public function arriveWithLacticWaifuAtCamp() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_milkgirl());
         outputText("这一路走得很慢，你不得不一直搀扶着你那产奶的朋友回到营地，但几个小时后，你们终于到家了。当你到达时，你看到沙之母信守了她的诺言，营地边缘的一小部分已经被清理出来，你的物品被移到一边，腾出了空间，在废土坚硬的泥土中挖出了一个半径足有十英尺的大水池。水池周围有一圈金属边缘，宽度刚好够你坐着或躺在上面，让你的[legs]悬垂在即将注满水池的乳白色液体中。");
         outputText("[pg]看到水池，那个产奶女孩高兴地喘着气，跌跌撞撞地走过去，然后四肢着地瘫倒在地，胸部靠在她巨大的乳房上，屁股翘在半空中，赤裸裸地暴露在所有人面前。[say:浴盆荡妇的产奶时间到了吗？]她问道，明亮的棕色眼睛恳求地看着你。");
         outputText("[pg]说到这个，你还真不知道该怎么称呼这位黑皮肤的美女。你觉得你可以继续叫她“浴盆荡妇”，但这对于一个自由的女孩来说，实在不是个合适的名字……");
         menu();
         addButton(0,"下一步",nameZeMilkBath);
         genericNamePrompt();
      }
   }
}

