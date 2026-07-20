package classes.scenes.npcs
{
   import classes.Appearance;
   import classes.Cock;
   import classes.CockTypesEnum;
   import classes.DynStat;
   import classes.ImageManager;
   import classes.ItemType;
   import classes.Monster;
   import classes.Player;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.display.SpriteDb;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.items.ArmorLib;
   import classes.items.ConsumableLib;
   import classes.items.UseableLib;
   import classes.items.Weapon;
   import classes.items.WeaponLib;
   import classes.scenes.Camp;
   import classes.scenes.Inventory;
   import classes.scenes.combat.Combat;
   import classes.scenes.places.TelAdre;
   import coc.view.CoCButton;
   import flash.Boot;
   import haxe.IMap;
   
   public class KihaScene extends NPCAwareContent
   {
      
      public function KihaScene()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
      }
      
      public function victoryDickKiha() : void
      {
         var _loc3_:Number = NaN;
         var _loc4_:int = 0;
         spriteSelect(SpriteDb.get_s_kiha());
         var _loc1_:int = get_player().cockThatFits(get_monster().vaginalCapacity());
         var _loc2_:int = get_player().cockThatFits2(get_monster().vaginalCapacity());
         clearOutput();
         get_images().showImage("kiha-vagfuck");
         outputText("你走上前，把龙女从树上推倒，让她侧躺着，以便更好地观察她那湿透的小穴和紧致的臀部。起初她没有反应，但当她意识到你要做什么时，她哭喊道，[saystart]你和我以前的主人真像。只要你打赢了，脑子里就只有做爱。");
         if(get_monster().get_lust() >= get_monster().maxLust())
         {
            outputText("别以为你挑起了我的欲望，我就会享受这个！");
         }
         else
         {
            outputText("别以为我会享受这个！");
         }
         outputText("[sayend][pg]");
         outputText("奇哈确实嘴硬，不过话说回来，你现在对她那张嘴也没什么兴趣。你抬起她的腿，但她卷起尾巴，挡住了你的视线，不让你看她的小穴");
         if(get_monster().get_lust() >= get_monster().maxLust())
         {
            outputText("，下意识地在她的阴唇上蹭来蹭去");
         }
         outputText("。你有些恼火，把那条碍事的尾巴扭到一边，但要按住它还真费劲。这头母龙一点也不配合。不过，你还是好好欣赏了一番她湿透的私处，这景象");
         if(get_player().get_lust100() > 60)
         {
            outputText("只会让[eachcock]变得更硬。");
         }
         else
         {
            outputText("很快就让[eachcock]硬了起来");
         }
         outputText("。她最末端的肢体从你手中挣脱，再次遮住了她的女性特征，你暂时由着她去了。[pg]");
         outputText("你停顿了一下，开始脱下你的[armor]，释放出[eachcock]");
         if(get_player().hasVagina())
         {
            outputText("和[vagina]");
         }
         outputText("暴露在潮湿的空气中。看到你赤裸的身体，奇哈的眼睛微微睁大，但没有其他反应。她似乎完全认命了，同时又很镇定。从她的表情来看，你敢打赌她已经预料到战败后会被侵犯。好吧，她会得到她所期待的。[pg]");
         outputText("你走向她无助的身体，重复之前的动作，抬起她的腿，把她的尾巴推到一边。她反抗了，但没有之前那么激烈。当你俯下身，将你的[hips]对准奇哈湿润的小穴时，她的尾巴很容易就被挡开了。她下体散发出的热量简直不真实。她的小穴似乎用温暖和湿润的结合让空气起雾，当你把你的" + get_player().cockDescript(_loc1_) + "压得更近时，感觉几乎就像一个女人要给你口交，她灼热的呼吸拂过你的生殖器。[pg]");
         if(_loc2_ != -1 && get_player().cockTotal() > 1)
         {
            outputText("那个完美的、滴着水的入口在召唤你的" + get_player().cockDescript(_loc1_) + "，但你的另一根阴茎");
            if(get_player().cockTotal() == 2)
            {
               outputText("是");
            }
            else
            {
               outputText("是");
            }
            outputText("疼得厉害，你还不如试着让你的快乐和乐趣加倍。你毫不犹豫地将两根肉棒滑入你毫无防备的伴侣体内。上面那根顺利地插入了奇哈天鹅绒般的通道。她紧闭的后庭对你的" + get_player().cockDescript(_loc2_) + "的突然入侵表现出更强的抵抗力，随着一寸又一寸地穿透她美味的后庭，她用近乎痛苦的力量反推。最后一次光荣的推进将你的两根骨头完全埋在她们的龙穴中，如果她的呻吟可信的话，这让你的俘虏非常高兴。[pg]");
            outputText("[say: 这就是——哦——你所有的本事？我……呃……几乎没感觉到！]奇哈抗议道，即使在你的两根长矛在她体内带来的感觉让她呻吟和扭动时，她也试图保持冷漠的举止。感觉到她的身体完全在随着你的节奏起舞，你松开她的腿和尾巴，让自己更舒服。你一只手撑在泥土上，另一只手放在奇哈乳房柔软、有轻微鳞片的肉上。她呼出一口气，一声高亢的享受和快乐的声音从她的嘴唇中滑落。你用手指捏住她的乳头，轻轻地扭动它，同时让自己习惯她的双通道为你的双重成员提供的快乐。[pg]");
            outputText("奇哈扭动着喘息着，她原本完美无瑕的皮肤泛起了一层红晕，即使透过她暗淡的肤色也能看出来。你移动你的手，在她的另一个乳头周围画圈，感觉到它在你的触摸下变硬和充血。很快它就变得坚硬如石，但你继续，抚摸和拉扯着娇嫩的凸起，直到母龙开始在你身下扭动和摩擦，徒劳地抽动着她被困住的臀部，同时她喘息着，[say: 你-你坏了吗还是怎么的？你-你甚至知道怎么做爱吗，你……哦……怪物？][pg]");
            outputText("你叹了口气，扇了她一巴掌，告诉她应该闭上嘴，庆幸你花时间取悦她的身体，同时满足你自己。奇哈吠叫道，[say: 是啊，对！好像我会享受这种——][pg]");
            outputText("你向后一退，然后猛地一插，打断了她傲慢的喋喋不休，她的长篇大论从条理清晰的抱怨变成了含糊不清的呻吟。在你蹂躏她的同时，你的两根肉棒每一次抽插都让她发出被迫享受的尖叫。你绝不可能放慢速度，也不会给她再次开始抱怨的机会。随着每一次震撼身体的撞击，淫液从她的大腿间喷涌而出，溅在地上和你的下半身，将她紧致抗拒的后穴变成了一个几乎和她的小穴一样湿润的屁眼。[pg]");
            outputText("不知从哪里冒出来，她的尾巴贴着你的背部向上，缠住了你的脖子。它以令人窒息的力量挤压着你的气管。你低头瞥了一眼奇哈，她在呻吟间微笑着，用沉重、半闭的眼睛看着她试图让你窒息的举动。这个婊子！你干得更快了，用尽你所能聚集的每一分力量猛烈撞击她的穴。这场性爱激烈、快速且不顾一切，但不知怎的，她设法用尾巴保持着压力。气急败坏之下，你开始扇她耳光，扭弄她的乳头，甚至用一只手掐住她的脖子。尽管性爱极其粗暴，她仍然紧紧勒住你。她的身体在抽搐和颤抖，嘴巴张成一个无言的“O”形，享受着快感，但你仍然无法呼吸！[pg]");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,432,1);
            _loc3_ = -1;
            _loc4_ = int(get_player().cocks.length);
            while(_loc4_ > 0)
            {
               _loc4_--;
               if(get_player().cocks[_loc4_].get_cockType() == CockTypesEnum.TENTACLE && _loc4_ != _loc1_ && _loc4_ != _loc2_)
               {
                  _loc3_ = _loc4_;
                  break;
               }
            }
            if(get_player().isNaga() || get_player().tail.type == 9 || _loc3_ >= 0)
            {
               outputText("带着恶意，你的");
               if(_loc3_ == -1)
               {
                  outputText("尾巴");
               }
               else
               {
                  outputText("空闲的触手");
               }
               outputText("也以牙还牙，弯曲起来勒住奇哈的脖子，甚至在她下一次张嘴发出动情的喘息时，将尖端插入她的嘴里，强行塞进她的食道。当她意识到自己成了你龙族报复的对象时，脸上闪过一丝愤怒的神色，但接下来几次对她淫荡小穴的拼命抽插很快就打消了这种情绪。你每抽插一次，她就把你的气管勒紧一点，而你也同样予以回击");
               if(_loc3_ >= 0)
               {
                  outputText("，将你的龟头在她的喉咙里进进出出。");
               }
               outputText("[pg]");
            }
            outputText("你迟钝地意识到[eachcock]正在抽搐，她那强有力的紧致小穴配合着你疯狂的抽插，让你难以忍受。随着高潮的临近，热量从你的[balls]中沸腾而出，甚至当黑暗吞噬你的视线边缘时，也威胁着要从你的下体爆发出来。去他的——如果她要掐死你，你至少要先射出来。你抓住她的两个乳头，将自己深深埋入，然后狠狠地扭动。精液从你的肉棒中喷涌而出，涂满了奇哈那火热多汁的小穴，");
            if(get_player().isNaga() || get_player().tail.type == 9 || _loc3_ >= 0)
            {
               outputText("喘息的嘴，");
            }
            outputText("以及紧致的后庭涂上了一波波白色的浊液。");
            if(get_player().cumQ() >= 500)
            {
               outputText("没过多久，她的肚子就鼓了起来，被你射出的大量浓精填得满满的。");
            }
            if(get_player().cockTotal() > 2)
            {
               outputText("多亏了你额外的阴茎，你甚至把她的肚子和乳房都涂满了精液");
               if(get_player().cockTotal() > 3)
               {
                  outputText("");
               }
               outputText("。");
            }
            outputText("[pg]");
            outputText("你瘫倒在她身上，你的肉棒继续在母龙超级温暖的穴里泵入精液。突然间，你能呼吸了！你摇了摇头，驱散脑海中的迷雾，低头看向奇哈，发现她正不受控制地颤抖着。你回头看去，只见她的尾巴在你身后疯狂地甩动，任何残存的控制力都被爆炸般的高潮吹得烟消云散。现在你终于能喘口气了，可以好好欣赏你那肌肉发达的对手屈服于身体本能的模样。她在你身下美妙地起伏着，她的身体榨干了你两根鸡巴里的最后一滴精液。[pg]");
            outputText("你叹了口气，抽出身来，注意到奇哈的高潮似乎还在继续。她甚至对小穴和屁眼突然空出来毫无反应。也许这能给她一个教训，让她不要低估对手，但你对此表示怀疑。你穿好衣服离开，听着身后传来的淫靡喘息声，露出了微笑。");
         }
         else
         {
            outputText("那完美、滴着淫液的入口在召唤你的" + get_player().cockDescript(_loc1_) + "，你毫不犹豫地滑了进去。奇哈低吼道，[say:就这样？真没技术含量。] 尽管她的语气充满失望，但她湿滑的通道却以不可思议的紧致度挤压着你的肉棒，用紧实、天鹅绒般的握力拥抱着你的" + get_player().cockDescript(_loc1_) + "。你幸福地叹了口气，享受了片刻龙穴的压力，将奇哈的抱怨抛诸脑后，专注于她的身体带给你的天堂般的感觉。[pg]");
            outputText("最终，你习惯了这条爬虫类通道里沸腾的汁液的感觉，渴望更多的刺激，你开始在湿透的肉洞里抽插你的" + get_player().cockDescript(_loc1_) + "。你身下的龙女发出夹杂着不满的愉悦呜咽和呻吟，既无法抗拒你，也无法让自己享受其中。她在你强迫的爱抚下扭动挣扎，变得");
            if(get_monster().get_lust() >= get_monster().maxLust())
            {
               outputText("更加兴奋，尽管她假装漠不关心");
            }
            else
            {
               outputText("非常兴奋，尽管她很想和你战斗");
            }
            outputText("。至于你，你加快了速度，越来越快地向着最终的高潮冲刺。奇哈将她长满鳞片的手指放在胸前，试图阻止乳房随之晃动，但你推开了她的手，想要她的乳房自由地弹跳，以此取乐。[pg]");
            outputText("很快，你发现你的" + get_player().cockDescript(_loc1_) + "屈服于奇哈那滚烫小穴带来的快感，随着高潮的临近，你的阴茎下方积聚起阵阵热量。你松开了她的尾巴，加快了节奏，将身体推向释放的边缘。这只龙的鳞片附肢立刻在你的背上忙活起来，用沉重的拍打猛击你，如果她使出全力，这可能会严重伤害你。就目前而言，它们可能会留下一些瘀伤。你捏了捏奇哈的一个乳头，看着她突然因快感而呻吟，你笑了，这淫荡的叫声正是你射入她体内所需要听到的。[pg]");
            outputText("你将自己完全推入，直没至柄，然后释放，将一股又一股浓稠的精液射入这只龙那滴着水的小穴，只让它流出更多。");
            if(get_player().cumQ() >= 500)
            {
               outputText("她紧绷、轮廓分明的腹部出现了一个圆润的凸起，这是你产生大量精液的唯一可见迹象。");
            }
            if(get_player().cumQ() >= 1000)
            {
               outputText("即便如此，浓稠的精液还是从她那塞满阴茎的阴唇中喷涌而出，在你的敌人身下形成了一滩水洼。");
            }
            outputText("你拔了出来");
            if(get_player().cor < 33)
            {
               outputText("，清理干净，穿好衣服，留下奇哈去思考她傲慢的后果。");
            }
            else if(get_player().cor < 66)
            {
               outputText("，把你的阴茎在她的脸上擦干净，然后穿好衣服，留下奇哈去考虑变得更谦虚一点。");
            }
            else
            {
               outputText("，把你那滴着精液的阴茎涂满她的脸，让她舔干净，然后，穿好衣服。也许这个婊子在面对这片领地的真正主人——你时，会考虑稍微谦卑一点。");
            }
            outputText("不知为何，你怀疑她是否能从这次遭遇中学到什么。");
         }
         get_player().orgasm("Dick");
         get_combat().cleanupAfterCombat();
      }
      
      public function tsundereMasturbationChristmasCarol() : void
      {
         clearOutput();
         get_images().showImage("kiha-mutualmasturbation");
         spriteSelect(SpriteDb.get_s_kiha());
         outputText("你走向那个龙族女人，一边脱下你的[armor]，一边观察着她紧致的、");
         if(get_player().get_lust() >= get_player().maxLust())
         {
            outputText("放荡的");
         }
         else
         {
            outputText("却又无精打采的");
         }
         outputText("的身影瘫倒在身后风化的树皮上。她小心翼翼地看着你，试图弄清情况，然后注意到了你");
         if(get_player().get_gender() > 0)
         {
            outputText("勃起的生殖器");
         }
         else
         {
            outputText("明显缺乏生殖器");
         }
         outputText("。[pg]");
         if(get_player().cockTotal() > 1 || get_player().get_gender() == 3)
         {
            outputText("[say: 你……你要做什么，你这个怪胎？如果你逼我玩那些，我发誓……我发誓我会打你的！]");
         }
         else if(get_player().hasCock())
         {
            outputText("[say: 离……离我远点！好像我会想碰你那根硬邦邦、多汁的鸡巴似的！白痴！]");
         }
         else if(get_player().hasVagina())
         {
            outputText("[say: 你打算用那个可悲的、滴着水的小穴做什么，嗯？我发誓，如果你逼我舔……舔那个东西……]");
         }
         else
         {
            outputText("[say: 呃……啊？你到底为什么要靠近？你下面平得像块木板，你能做什么，你这个失败者！]");
         }
         outputText("然而，今天你并不打算直接操她");
         if(get_player().get_gender() == 0)
         {
            outputText("，而且既然你没有任何东西可以操她，你也不可能这么做");
         }
         outputText("。你一言不发地走到她身后，在树和她温暖的身体之间懒洋洋地坐下，同时向她靠近。她拼命想转过身来看你，但她似乎虚弱得连脖子都动不了。仅仅几秒钟，你就已经靠在树上了，而虚弱的龙女则舒服地坐在你的腿上");
         if(get_player().get_tallness() < 72)
         {
            outputText("——尽管你被她高大的身材挡住了");
         }
         else
         {
            outputText("——尽管你比她高得多");
         }
         outputText("。龙女试图挣扎，但她太虚弱了，根本动弹不得。[say: 你在做什么？我他妈的搞不懂你！你到底在——] 在她继续责骂你之前，你把她的头拉向自己，坚定地吻了她的嘴唇，打断了她的话。她惊讶地睁大了眼睛，但很快就垂下眼帘，开始回应你的吻。你们的嘴唇紧紧贴在一起，仿佛过了一个世纪，当你们分开时，一根唾液丝依然连接着你们。[pg]");
         outputText("女孩试图说话，但你把手伸向她的下体，将两根手指放在她光滑的腹部，慢慢地向下移动，当你触碰到她湿润的入口时，你的猎物发出了一声轻喘。她勉强伸出手抓住你的手，当你开始抚摸她已经被淫液润滑的湿润处时，她紧张了起来。你轻笑着说，她一定是被那个吻挑起了性欲——如果她刚才还没湿，现在肯定湿透了。[say: 不……不！你……你错了……] 龙女结结巴巴地说，但当你加快爱抚的速度时，她发现自己无法继续说下去。这个龙族女人成了你灵活手指的奴隶，任何试图压抑呻吟的努力最终都失败了，奇怪的叫声或喘息从她撅起的嘴唇中溢出。你轻轻一推，进入了她的体内，你那气喘吁吁的玩具紧紧夹住双腿，夹住了你探索的手指。[pg]");
         outputText("当你感受到她体内的温暖时，你注意到龙女温暖的呼吸弥漫在空气中，她湿滑的舌头开始从嘴里流出口水，因为她湿润的嘴唇被你严厉的手侵犯了。她那在潮湿空气中挺立的乳头让你有了一个主意，你用空出的手开始在手指间揉捏和按摩她的乳房。当你粗鲁地挤压她起伏的胸部时，乳头在你的服侍下挺立起来，几乎就像在挤牛奶一样。当你把你的");
         if(get_player().hasCock())
         {
            outputText("[cocks]在柔软的肉体上摩擦时，");
            if(get_player().cockTotal() == 1)
            {
               outputText("一小滴先列腺液从顶端渗出，用你的汁液涂抹在她的背上。");
            }
            else
            {
               outputText("一小滴先列腺液从顶端渗出，用你的汁液涂抹在她的背上。");
            }
         }
         else
         {
            outputText("[nipples]在坚硬的背脊上摩擦时，你的舌头轻轻舔舐她光滑的皮肤。");
         }
         outputText("你加快了动作的节奏，手指在她滴水的阴户里进进出出，同时腾出一只手捏揉她柔软乳房上变硬的乳头。龙女在你的抚摸下扭动抽搐，咬着嘴唇，成了你手中任由摆布的奴隶。[say:我……我一点也不享受……绝不和像你这样的人！]她勉强低吼着，她那令人钦佩的抵抗只会让你更想将她推入快乐的深渊。你将第三根手指塞进她紧致的穴口，她肉壁的温度像天鹅绒火炉一样紧紧包裹着你。你俯下身再次吻她，决定更加热情地将舌头探入，与她的舌头缠绕在一起。[pg]");
         outputText("你那燥热难耐的奴隶除了在你身体的热度下融化之外，什么也做不了。讽刺的是，这只龙女在激情的游戏中败下阵来，迷失在你粗暴、霸道的双手和她柔软嘴唇的味道中。在树荫下，你们交织成一个纯粹欲望的整体。当这只龙兽女孩在快感中颤抖，宣告她的释放时，这一切便如开始时一样迅速结束了。[pg]");
         outputText("她湿润的汁液从身下涌出，将你的手指浸透在她的精华中。她慢慢地将嘴唇从你的唇上移开，向你靠近");
         if(get_player().hasCock())
         {
            outputText("并不小心擦过你颤抖的生殖器，用力推了你一下，导致你射在她的背上");
            get_player().orgasm("Dick");
         }
         outputText("。女孩松了一口气，与其说是战斗，不如说是感官体验让她精疲力竭。你慢慢地抽身，留下疲惫的女孩在树下休息。[pg]");
         outputText("[say:我……恨你……]她低语着，然后陷入了沉睡。你看着她熟睡时柔软的脸庞，像猪一样优雅，然后走回营地。");
         if(!get_player().hasCock())
         {
            dynStats(DynStat.Lust(120));
         }
         get_combat().cleanupAfterCombat();
      }
      
      public function tellKihaTributeWasYourIdea() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_kiha());
         outputText("你问她为什么改变了对你主意的主意。奇哈的脸扭曲了一下，她巧克力色的脸庞扭曲成一个恼怒的鬼脸。这可能是一个错误。她尖叫道：[say: 好像你这样的人会有什么值得我采纳的主意似的！我一离开你，就把你那微不足道的提议忘得一干二净了。这个贡品完全是我凭借自己巨大的智慧和狡猾想出来的！][pg]");
         outputText("龙女从背后拔出斧头，扭动双手，让斧刃在浑浊的沼泽空气中发出橙色的光芒。[say: 你本该闭嘴的，可怜虫。现在提议取消了！我唯一能给你的就是痛苦！]");
         startCombat(new Kiha());
      }
      
      public function retributionArmorIsCoolShit() : void
      {
         clearOutput();
         outputText("随着你的话音落下，箱子发出一声咔哒声。你正准备掀开盖子，它却自己打开了，这让你吓了一跳。闪耀夺目的光芒充满了整个房间。你本以为魔法会有点炫耀的成分，是的，但让长袍真的从箱子里升起来似乎有点过分了。深红色的布料向上伸展，就像穿在人体模型——或者幽灵身上一样。金色的滚边沿着边缘延伸。手套的背面清楚地绣着你不认识的印记，但你怀疑它们对一个早已被遗忘的文化来说意味着什么。它似乎主要由两个主要部分构成——一件无袖高领内衣和裙子，以及一件带风帽的外套和披风。你收起长袍，把它们放进你的[inv]里，以便在营地进一步检查。[pg]");
         outputText("转身准备离开时，你被站在你和楼梯井之间的幽灵吓了一跳。没有脸的半透明身影穿着你刚刚发现的同款长袍，正仔细地注视着你。你做好战斗准备，但他们一个接一个地退到一边。你小心翼翼地继续前进。当你经过他们时，每个人都向你鞠躬。[pg]");
         outputText("这景象让你感到正气凛然。[pg]");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,415,1);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2342,1);
         get_inventory().takeItem(get_armors().I_ROBES,get_camp().returnToCampUseOneHour);
      }
      
      public function rapeKihaWithWORDS() : void
      {
         var _loc1_:* = null as IMap;
         clearOutput();
         get_images().showImage("kiha-forced-talk");
         spriteSelect(SpriteDb.get_s_kiha());
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,344) == 0)
         {
            outputText("你跪下身，迎上战败龙女的目光，问她为什么这么暴力，领地意识这么强。奇哈困惑地抬起头，问道：[say: 等等……你打败了我，然后你想……聊天？][pg]");
            outputText("你点点头，再次问她为什么非要打败任何靠近她的人。奇哈紧张地挠了挠手肘，回答道：[say: 我不知道。我就是想。我——我太强大了——我必须打败所有人。这是我成为最强者的唯一途径。我不能依赖弱者，也不能指望这种怜悯。恶魔没有给我任何怜悯，我打算以牙还牙。你甚至不应该和我说话。你应该强暴我或者杀了我，做任何能削弱我、巩固你顶级掠食者地位的事。][pg]");
            outputText("听到这话，你轻笑了一声，直到你捕捉到她眼中危险的光芒。她绝对是认真的！你把手放在她的肩膀上，开始解释，但她耸了耸肩甩开了。你叹了口气，重新开始。你告诉她你不是这里的人，解释了你那个世界的习俗，以及你为什么决定和她谈谈。你告诉她你的任务和动机，希望她能理解你的观点。[pg]");
            outputText("奇哈对你的话感到退缩，像个试图寻找勇气不再害怕黑暗的孩子一样摇着头，[say: 不。你听起来像很久很久以前的人，但这不可能那么简单。如果真是那样，恶魔就不会统治这个世界了。] 当你还在回味这句话时，奇哈突然抓起她的武器，一跃而起。她展开双翼，飞走了。即使她拒绝了你，你觉得你可能已经打动了她。");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,344) == 1)
         {
            outputText("你再次蹲下身，开始和你的敌人交谈。奇哈立刻叹了口气，说道：[say: 又来？我以为我告诉过你——你错了。][pg]");
            outputText("你问她是否真的相信这一点。毕竟，你已经打败她两次了。奇哈浑身一颤，大喊道：[say: 我刚说了！天哪，别这么……这么他妈的迟钝！如果你是对的，莉希丝就不会坐在她的王座上，他们也永远无法制造出像……啊，算、算了。笨蛋！][pg]");
            outputText("你耸耸肩，觉得她现在不太可能在这个话题上多说，所以你把话题转移到了其他事情上——你自己的历史。你告诉她你的村庄，传送门，以及你被选为勇者的那一天。你谈到了你的训练，以及这片土地与你预想的有多么不同。你讲述了你的挣扎。你描述了你的胜利。你对你的失败表示同情。你倾诉了在这个陌生领域旅程中所有最好和最坏的经历。令人惊讶的是，奇哈全神贯注地听着，一次也没有打断。[pg]");
            outputText("等你讲完，她回过神来，嘟囔道：[say: 所以你过得很艰难？无所谓。我过得更艰难。] 没等你回答，她就腾空而起，飞走了。");
            if(get_silly() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,281) > 0 && get_telAdre().lottie.lottieMorale() <= 33)
            {
               outputText("这就是洛蒂的感觉吗？");
            }
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,344) == 2)
         {
            outputText("尽管你再次击倒了龙女，但你还是坐下来准备再聊一次，而不是做些更肉欲的事。奇哈笑了笑，稍微放松了一些，问道：[say: 还在坚持你的道德观，是吗？][pg]");
            outputText("你点点头，问她是否愿意讲讲她的故事，因为你上次分享了你的故事。龙女笑得前仰后合，空气中喷出微小的火焰，鼻孔里喷出小股烟雾。她捂着肚子，弯下腰，大口喘着气。直到她从欢乐中恢复过来，才气喘吁吁地回答道：[say: 你是认真的？][pg]");
            outputText("你再次点头，她回答道：[say: 除非猪会飞！在你提议之前，猪鼻小恶魔不算。] 你期待地双臂交叉在胸前，提醒她你才是胜利者。[pg]");
            outputText("奇哈怒吼道：[say: 你赢了是因为……我让你赢的。我只是想看看你会透露多少信息。][pg]");
            outputText("你叹了口气，令人惊讶的是，这得到了回应。[say: 我……不记得了，好吗？我记得的第一件事就是在莉希丝的基地里醒来，就是这个样子。我们有几个人，恶魔教导我们，训练我们像他们一样……我猜他们计划让我们成为下一代恶魔。我们中有几个人逃了出来，各奔东西。][pg]");
            outputText("那一刻，这位龙女看起来非常像一个年轻、紧张的女孩。她脸颊泛红，跳了起来，没等你再问她什么就飞走了。");
         }
         else
         {
            outputText("你坐在奇哈旁边，又开始说话。虽然她一开始露出了一丝微笑，但很快就开始生闷气。无论你说什么或做什么，似乎都无法让她摆脱这种状态。也许现在，真的没什么好和她讨论的了。");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,344) < 3)
         {
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,344,FlagDict_Impl_.arrayReadInt(_loc1_,344) + 1);
         }
         get_combat().cleanupAfterCombat();
      }
      
      public function payKihaTribute() : void
      {
         var _g:KihaScene;
         clearOutput();
         spriteSelect(SpriteDb.get_s_kiha());
         outputText("你叹了口气，付给她200颗宝石。她甚至没有提到这原本是你的主意，但不管怎样，你得到了你想要的——不受阻碍地探索她领地的能力。当然，你不知道这200颗宝石能管多久。[pg]");
         var _loc1_:Player = get_player();
         _loc1_.set_gems(_loc1_.get_gems() - 200);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,342,3 + Utils.rand(4));
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,341,FlagDict_Impl_.arrayReadInt(_loc2_,341) + 1);
         _g = this;
         doNext(function():void
         {
            _g.kihaExplore();
         });
      }
      
      public function offerToBuyPassageFromKiha() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_kiha());
         outputText("你摇了摇你的宝石袋，问她是否可以付钱让她放你过去。奇哈把斧头扛在肩上，挠了挠她的一只角，仔细考虑着这个主意。她停了下来，突然摇了摇头。[say: 今天不行。现在快滚，趁我还没改变主意！][pg]");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,341,1);
         menu();
         addButton(0,"战斗",meetKihaAndFight);
         addButton(14,"离开",leaveWhenMeetingAgressiveKiha);
      }
      
      public function noThankYouSirIDontWantAwesomeArmors() : void
      {
         clearOutput();
         outputText("你对提供的奖励不感兴趣，转身原路返回。在入口处，你把苔藓放回原处，尽力隐藏传送门，以防你以后想回来，或者至少不让里面任何有力量的物品落入充满敌意的沼泽居民手中。你可能白费力气了，因为当你走开时，你听到身后石头摩擦和变移的声音。果然，检查证实门已经再次封死了。[pg]");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function meetKihaAndFight() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_kiha());
         outputText("你走近一步，宣称你想去哪就去哪。奇哈哼了一声，说道：[say: 真可爱。可悲的是，盲目的自信只会让你更痛苦。]");
         startCombat(new Kiha());
      }
      
      public function leaveWhenMeetingAgressiveKiha() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_kiha());
         outputText("你点点头，向后退去，撤回营地。你不想和这样一个火爆的对手战斗。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function killKiha() : void
      {
         var _g:Combat;
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2658,1);
         spriteSelect(SpriteDb.get_s_kiha());
         clearOutput();
         outputText("你走近龙女，准备用你的[weapon]了结她。她试图站起来时，眼里盈满了泪水。[say: [name]……你真的变成了一个怪物……停下，求你了！]");
         outputText("[pg]她的话语和她的攻击一样毫无作用。你和她四目相对。一滴眼泪从她眼中滑落，突然间，她重新焕发了活力，向你扑来，发起了绝望的攻击。");
         if(get_player().get_weapon().isHolySword() || get_player().get_weapon().isBladed())
         {
            outputText("[pg]不过，你早就知道她会战斗到最后一刻。她的攻击并没有让你感到惊讶，但你的反应却让她大吃一惊。你迅速闪到一边，将武器刺向她的胸口。当她扑空落地时，似乎失去了平衡。[say: 我经历了那么多……为什么……？][pg]她跪倒在地，看着自己的鲜血在身下的地面上汇聚成一滩。没过多久，她就倒下了。她死了，深深地意识到她唯一的错误就是一开始信任了你。奇哈死了。");
         }
         else if(get_player().get_weapon().isKnife())
         {
            outputText("[pg]不过，你早就知道她会战斗到最后一刻。她的攻击并没有让你感到惊讶，但你的反应却让她大吃一惊。你迅速向她逼近，在她发起攻击之前，将匕首刺入了她的胸膛。你们俩倒在地上，纠缠在一起，但很明显，她在这次冲突中受了重伤。[say: 我经历了那么多……为什么……？][pg]她看着你的脸，绝望地寻找着你身上残存的一丝人性。你扭动着刺穿她的匕首，她痛苦地呻吟着。没过多久，她就闭上了眼睛。她死了，深深地意识到她唯一的错误就是一开始信任了你。奇哈死了。");
         }
         else if(get_player().get_weapon().isRanged())
         {
            outputText("[pg]不过，你早就知道她会战斗到最后一刻。她的攻击并没有让你感到惊讶，但你的反应却让她大吃一惊。你迅速举起你的[weapon]向她开火，直接击中了她的胸部，阻止了她的冲势。她踉跄了一下，捂住胸口，看着自己沾满鲜血的双手。[say: 我经历了那么多……为什么……？][pg]没过多久，她就倒下了。她死了，深深地意识到她唯一的错误就是一开始信任了你。奇哈死了。");
         }
         else if(get_player().get_weapon().isBlunt())
         {
            outputText("[pg]不过，你早就知道她会战斗到最后一刻。她的攻击并没有让你感到惊讶，但你的反应却让她大吃一惊。你迅速摆好攻击姿势，在她有机会调整方向之前猛扑过去。你直接击中了她的胸部，她自身的冲力加强了这一击的威力。她吐出一口鲜血，胸腔碎裂。她立刻倒下，无法动弹。[say: 我经历了那么多……为什么……？] 她痛苦地皱起眉头。[pg]没过多久，她就安静了下来。她死了，深深地意识到她唯一的错误就是一开始信任了你。奇哈死了。");
         }
         else if(get_player().get_weapon().isSpear())
         {
            outputText("[pg]不过，你早就知道她会战斗到最后一刻。她的攻击并没有让你感到惊讶，但你的反应却让她大吃一惊。你迅速摆好攻击姿势，在她有机会调整方向之前猛扑过去。你刺穿了她的胸膛，她自身的冲力加强了这一击的威力。她吐出一口鲜血，躯干被完全刺穿。她立刻倒下，无法动弹。[say: 我经历了那么多……为什么……？] 她痛苦地皱起眉头。[pg]没过多久，她就安静了下来。她死了，深深地意识到她唯一的错误就是一开始信任了你。奇哈死了。");
         }
         else
         {
            outputText("[pg]不过，你早就知道她会战斗到最后一刻。她的攻击并没有让你感到惊讶，但你的反应却让她大吃一惊。你在最后一刻向侧面翻滚，导致她的攻击落空，并将她置于你的前方，背对着你。你迅速上前，从后面勒住她的脖子。她拼命试图反击，但她的力气已经耗尽。经过几秒钟痛苦的挣扎，她昏了过去。你使出全力一扭——扭断了她的脖子。[pg]她死了，深深地意识到她唯一的错误就是一开始信任了你。奇哈死了。");
         }
         var _loc1_:Inventory = get_inventory();
         var _loc2_:Weapon = get_weapons().KIHAAXE;
         _g = get_combat();
         _loc1_.takeItem(_loc2_,function():void
         {
            _g.cleanupAfterCombat();
         });
      }
      
      public function kihaVictoryPomfTail() : void
      {
         clearOutput();
         get_images().showImage("kiha-taildildo");
         spriteSelect(SpriteDb.get_s_kiha());
         outputText("你走向那个");
         if(get_monster().get_lust() >= get_monster().maxLust())
         {
            outputText("充满欲望的");
         }
         else
         {
            outputText("受伤的");
         }
         outputText("龙女，脑子里满是邪恶的想法。而她则用挑衅的目光抬头看着你，仿佛这能阻止你身体里涌动的性冲动。你绕到侧面，俯下身，双手抓住她扭动的尾巴。奇哈试图把它从你手里抽出来，但在她虚弱的状态下，它只能像一条被抓住的鱼一样无力地扑腾。你笑着，用她自己长满鳞片的后半身拍打她的脸，然后松开。你知道该怎么利用那个“方向盘”，但首先你得脱掉你的[armor]。[pg]");
         outputText("装备落在你身后的苔藓上");
         if(get_silly())
         {
            outputText("，发出一声闷响 =3");
         }
         else
         {
            outputText("。");
         }
         outputText("现在你赤身裸体，性感地前后摇摆着你的[hips]，强迫奇哈在被你享用之前看着你的身体。");
         if(get_player().biggestTitSize() <= 4)
         {
            outputText("她移开视线，红着脸说：[say:我才不会觉得这么小的胸部有吸引力呢！]但她的举止似乎表明她其实很喜欢。");
         }
         else if(get_player().biggestTitSize() <= 12)
         {
            outputText("她叹了口气说：[say:好像我会对那种像牛犊一样的乳房印象深刻似的！]");
         }
         else
         {
            outputText("她笑着嘲讽道：[say:你带着那么可笑的巨乳是怎么走路的？来吧，哞，母牛！]");
         }
         outputText("你厌倦了她不断的侮辱和不愿面对现实的态度。啊哈！你抓起你的内衣揉成一团，注意到上面散发着汗水和性爱的刺鼻气味。这个长满鳞片的荡妇向后退缩，但你逼近她，把充满麝香的内衣塞进她嘴里，无视她的挣扎，抓起一些藤蔓绑住她的手臂。完美！[pg]");
         outputText("奇哈的眼眶里涌出了泪水，但她的眉头依然紧锁，保持着那副永远愤怒的瞪视。与此同时，你开始听到液体滴落到地上的声音。你偷偷瞥了一眼下面，确认了你最初的想法是正确的——在被迫吸吮了你的小穴-");
         if(get_player().hasCock())
         {
            outputText("、精液-，");
         }
         outputText("和被汗水浸透的内衣。她那双嵌着深红色的黑色眼眸微微眯起，勉强压抑着怒火，但以她现在的状态，对你构不成任何威胁。[pg]");
         outputText("你再次伸手抓住那条不安分的龙尾。[say: 我要自己解决。如果你能更配合一点，我或许还会考虑帮你一把。现在，如果你不介意的话，我觉得这条带螺纹的尾巴假阳具就挺好用的。] 你扭动着她那挣扎的附肢，用底部较厚的鳞片摩擦着你的下唇，身体因快感而颤抖。当你把这根滚烫的、长满鳞片的假阴茎滑过你的女性部位时，它");
         if(get_player().wetness() <= 3)
         {
            outputText("变得湿润了");
         }
         else if(get_player().wetness() <= 4)
         {
            outputText("很快变得黏糊糊的");
         }
         else
         {
            outputText("立刻被你不断滴落的淫液浸透了");
         }
         outputText("。[pg]");
         outputText("确认它已经足够润滑后，你捏住现在滑溜溜的尾巴，将它那粗糙的尖端对准你的入口。当你与那条挣扎的后肢搏斗时，它撞到了你的[clit]，这反而让你更加兴奋。感觉到尖端在你的通道口盘旋，你用力一推，将那条触手般的尾巴深深地塞入体内。");
         get_player().cuntChange(1,true,false,true);
         outputText("天哪，她好……温暖，那些凸起的纹路，正在抚摸你体内的每一寸，甚至包括你的G点！你的[legs]不稳地颤抖着，但在欲望的驱使下，你死死地抓住了这个新发现的玩具。奇哈也没有停止反抗。[pg]");
         outputText("你背靠着龙女之前占据的那棵树滑坐下来，让你的[legs]完全放松。奇哈的挣扎无意中增加了你的快感，让她的尾巴变成了世界上最温暖、最强力的按摩棒。你的双手开始将她粗壮的尾巴推入更深处，把可怜的小穴撑得越来越大。");
         get_player().cuntChange(35,true,false,true);
         outputText("你呻吟着，看着她，与她对视。她看起来依然很生气，但脸上也带着一丝困惑。你低头一看，发现她滴得更快了，她那肌肉发达、紧紧夹住的大腿间已经积聚了一大滩淫水。她一定兴奋得难以置信，但她依然在反抗！[pg]");
         outputText("好吧，那是她的损失。你继续用她那带螺纹的尾巴操着自己，享受着那快速的抽搐、剧烈的扭动和其他持续不断的动作。感觉就像它在攻击你的小穴，用令人愉悦的撞击敲打着你的女性部位。你的[hips]迎着这受欢迎的入侵向后推去，又将它塞入体内一两英寸，你离那极度渴望的释放越来越近。感觉太棒了！你幸福地尖叫出声，整个身体都在起伏，抽插、挺动、扭曲，直到达到快感的绝对巅峰，感觉的顶点。");
         if(get_player().wetness() < 3)
         {
            outputText("滴着");
         }
         else if(get_player().wetness() < 4)
         {
            outputText("漏着");
         }
         else if(get_player().wetness() < 5)
         {
            outputText("喷涌着");
         }
         else
         {
            outputText("喷射着");
         }
         outputText("淫水，你的[vagina]迎来了强烈的高潮。它紧紧收缩，伴随着阵阵涟漪，终于让尾巴停止了疯狂的挣扎，将它固定在你的女性部位中。[pg]");
         outputText("奇哈的呻吟声将你从高潮的迷雾中唤醒，你看到她的小穴竟然流出了一股稳定的润滑液，但她依然没有高潮。太完美了！你看着她，直到心跳恢复正常，最终，你满足地叹了口气，将沾满淫水的尾巴从下体拔出。没有了她巨大尾巴在体内的热度，感觉……有些冰冷和空虚，但你觉得你总能应付过去的。[pg]");
         outputText("当你把弄脏的内衣从她嘴里扯出来时，龙女厉声说道。[say: 婊子！我-我不会放过你的！][pg]");
         outputText("你唯一的反应就是穿好衣服，享受着她那冒泡的唾液在你的女性部位上带来的令人愉悦的刺痛感。奇哈怒视着你，徒劳地扭动着臀部，仿佛这样就能平息席卷她全身的欲望狂潮。也许在你离开后，沼泽里的其他居民会来陪她？");
         get_player().orgasm("Generic");
         get_combat().cleanupAfterCombat();
      }
      
      public function kihaVictoryIntroduction() : void
      {
         var _g:Combat;
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,345,1);
         clearOutput();
         spriteSelect(SpriteDb.get_s_kiha());
         outputText("奇哈摇晃了一会儿，然后双手麻木地丢下了斧头。她一松手，武器锋利边缘的炽热光芒就褪成了银色，武器重重地“砰”的一声落在了泥土里。龙女跪倒在地，瘫倒在一棵树上，她的四肢");
         if(get_monster().get_lust() >= get_monster().maxLust())
         {
            outputText("因为欲望");
         }
         else
         {
            outputText("虚弱地");
         }
         outputText("颤抖着，试图站起来。[pg]");
         if(get_monster().get_lust() >= get_monster().maxLust())
         {
            outputText("[say:你……别想让我喜欢上这个！]她大喊着，拼尽全力不让自己的手碰到私处。不知怎么的，她似乎做到了。");
         }
         else
         {
            outputText("[say:你……你……还没……打败我，]她嘟囔着，尽管很明显你已经赢了。");
         }
         outputText("现在你已经挫了这头自命不凡的母龙的锐气，你打算怎么处置她？");
         outputText("[pg]你可以强行让她自慰。");
         menu();
         addButton(0,"手淫",tsundereMasturbationChristmasCarol).hint("强行给奇哈手淫。");
         if(get_player().get_lust() >= 33 && get_player().hasVagina())
         {
            outputText("[pg]你可以把她的尾巴当假阳具用。");
            addButton(1,"使用尾巴",kihaVictoryPomfTail).hint("把她的尾巴当假阳具用。");
         }
         if(get_player().hasCock())
         {
            if(get_player().cockThatFits(get_monster().vaginalCapacity()) != -1 && get_player().get_lust() >= 33)
            {
               outputText("[pg]你可以操她的小穴");
               if(get_player().cockThatFits2(get_monster().vaginalCapacity()) != -1 && get_player().cockTotal() > 1)
               {
                  outputText("和屁股");
               }
               outputText("。");
               addButton(2,"操她小穴",victoryDickKiha).hint("插入奇哈的小穴。");
            }
         }
         if(get_player().hasCockThatFits(get_monster().analCapacity()) && get_player().get_lust() >= 33)
         {
            addButton(3,"操她屁股",analRapuzulaKiha).hint("肛交奇哈。");
         }
         if(get_player().isPureEnough(40))
         {
            outputText("[pg]既然她现在只能乖乖听你说话，你大可以和她聊聊。");
            addButton(4,"交谈",rapeKihaWithWORDS).hint("和奇哈谈谈，试着取得一些进展。");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,423) > 0)
         {
            addButton(5,"了结她",killKiha).hint("是时候让她后悔离开你了。");
         }
         _g = get_combat();
         addButton(14,"离开",function():void
         {
            _g.cleanupAfterCombat();
         });
      }
      
      public function kihaRapesMen() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_kiha());
         get_images().showImage("kiha-loss-male");
         var _loc1_:int = get_player().cockThatFits(get_monster().vaginalCapacity());
         if(_loc1_ < 0)
         {
            _loc1_ = 0;
         }
         outputText("你试图站起来，但龙女猛地转过身，她那又长又粗的尾巴重重地抽在你的侧脸上，将你重新打倒在[ass]上。长着鳞片的女人得意洋洋地站在你身旁，气喘吁吁地看着你，这反而暴露了她目光中的冰冷。她眯起眼睛，挑起一侧傲慢的眉毛上下打量着你，将双手收回至齐肩高，几乎擦过她的乳房。她的尾巴在双腿间来回甩动，缠绕在小腿上，同时她抬起一只长着利爪的脚，轻轻地放在你逐渐变硬的腹股沟上。显然，你们的战斗让她想要的不仅仅是你的宝石。她灵活的脚趾隔着[armor]挤压着你的[cocks]，并嘲弄地哼了一声。[say: 就这，嗯？真可悲。如果我想指望你满足我，我恐怕得包揽所有的活儿了。][pg]");
         outputText("奇哈迅速踢向你的锁骨，将你仰面击倒并站在你上方，尽管她嘴上说着冰冷的侮辱之词，但她的阴户却因兴奋而肿胀。她用长长紧握的利爪解开你的[armor]，刚好露出[eachcock]。龙女将尾巴卷在双腿之间，这条灵巧肢体温暖且布满鳞片的表面不耐烦地摩擦着你娇嫩的血肉，尾尖在缠绕住你的龟头冠部之前，先是轻弹了一下[onecock]。她尾巴狭窄的尖端戳着你的尿道，分开狭窄的缝隙，挑逗着敏感如丝的内部，让你发出一声微弱的喘息。[say: 是啊，我打赌你肯定很想被插，]她嘲笑道，双手环握住从她大腿间探出的粗壮尾巴，就像一根巨大的、布满鳞片纹理的肉棒。她抚摸着厚实的鳞片，用拇指摩挲着尾巴底部脊状的凸起，伴随着臀部的摇摆，她的胸部也随之晃动。[say: 但是，]她继续说道，尾巴从你的[cocks]上抬起并向上卷曲，[say: 这可由不得你。][pg]");
         outputText("奇哈的臀部紧绷，双腿间那根扭动的“船舵”像蛇一样向上蜿蜒，紧紧压在她肿胀发热的下体上——她阴户那柔软、暗色的阴唇在猩红尾尖的触碰下显得十分顺从。刚刚还在挑逗你肉棒的尾尖，转而缠绕住她的阴蒂包皮，将那层类似包皮的鞘向后拉，露出那颗坚硬如豆的敏感核。龙女在你上方以越来越紧的圆圈刺激着自己，她双手叉腰，嘴唇卷起一抹邪魅的笑容。");
         if(get_player().tail.type == 9 || get_player().hasTailInsteadOfLegs())
         {
            outputText("[say: 呵，要是你的灵巧能有你厚脸皮的一半，我倒是会让你来帮我弄。不过这显然不可能，]她漫不经心地说道。");
         }
         outputText("没过多久，她的小穴就几乎要滴下水来，但你不确定她更享受哪一个，是挑逗着她阴蒂的尾巴，还是在你脚边不受控制地硬起来的肉棒。她咧嘴一笑，与其说是出于快感，不如说是为了露出牙齿，然后开始将尾巴塞进自己的小穴，女孩的肉褶急切地为这根粗糙的肢体分开，她的蜜壶几乎立刻就把鳞片润滑得水光发亮。当她在体内进行长而缓慢的抽插时，奇哈换成单腿站立，再次将她灵巧的脚伸向你的" + get_player().cockDescript(_loc1_) + "");
         if(get_player().balls > 0)
         {
            outputText("，将脚跟抵在你肿胀的[balls]上，施加恰到好处的压力，感受里面翻滚的精液");
         }
         outputText("。[say: 啊！就-就待在原-原-原地别动！]她命令道，同时尾巴加快了速度。[say: 我一会-会就来伺候你……啊！马上，]她娇喘着，将自己抽插到了高潮的边缘。龙女紧闭双眼，双手握拳，将自己刺穿在那如活塞般运动的肢体上，当她插到底时，强忍住一声颤抖的呻吟，将晶莹剔透的淫液涂抹在上面，液体顺流而下，在她长满鳞片的臀部上覆盖了一层闪闪发光的薄膜。[say: 啊哈……]她颤抖着。[say: 那么，就算你证明了你在操逼方面和打架一样是个废物，我今天至少也高潮过一次了。][pg]");
         outputText("龙女的小表演已经让你完全勃起，她脚上肉垫般的鳞片在你的肉棒上下来回摩擦，让你硬得像石头一样，在她的脚跟下无助地抽搐着。她用长长的脚趾勾住你跳动的龟头，将你的" + get_player().cockDescript(_loc1_) + "拉向空中，紧绷的肉棒顺从着她的要求挺立起来。奇哈不情愿地将尾巴从她流着淫液的裂隙中抽出，蹲下身子，直到你的肉枪与她的腹部平行。她向前挪动，你的冠状沟离她的小穴只有一发之遥，她在喉咙深处发出[say: 啧]的一声。[say: 考虑到你刚才那场烂透了的战斗，你当然不配用这个洞，也不配有任何生孩子的机会。]尽管她充满蔑视，但她下方的阴唇还是将龙女剧烈自慰后产生的温暖液体溅到了你的" + get_player().cockDescript(_loc1_) + "上。你因为洒在腹股沟上的热量而颤抖，不知道自己还能承受多少挑逗。这位胜利的女人又向前滑动了一点，引导着她狭窄的后庭对准你跳动的肉棒。[say: 这应该更适合你的节奏，小妖精，]她嘲弄道，然后将自己猛地坐到了你的命根子上。[pg]");
         outputText("当她自慰时，喷涌而出的蜜液汇聚在她的尾巴和臀瓣上，为你提供了充足的润滑，让你能够分开这只母龙丝滑的通道。她肌肉发达的括约肌有节奏地收缩着，与其说是对突然插入的反应，不如说是为了把你拉得更深。你因为那紧紧吸吮着你" + get_player().cockDescript(_loc1_) + "的强烈紧致感而大叫出声，并伸手去抓女孩的乳房，但她却狠狠地打掉了你的手。[say: 如果你用你那双脏手弄脏了我的鳞片，我就用大腿夹死你！]她喘息着，双手穿过自己的头发，头舒服地向后仰去。她用力地骑乘着你，在你的大腿上弹跳，完全不顾她那健美的臀部给你的[hips]带来的瘀伤，但除了她直肠那老虎钳般的紧致感之外，你几乎感觉不到任何东西。你张开嘴想求她轻点，但她却趁机将尾巴插进了你微张的嘴唇之间，那条温暖的附肢上还滴着女孩的淫液。你差点因为这插入而作呕，但这种震惊很快就被兴奋所取代，因为你的嘴里充满了她汗津津的花蜜的二手味道。你条件反射般地开始吸吮那长满鳞片的尖端，用舌头缠绕着这个长满鳞片的入侵者，甚至转动下巴，舔舐着奇哈臀部流下的乳汁。[pg]");
         outputText("伴随着一阵低沉的咆哮，母龙将她自己狠狠地刺入你的" + get_player().cockDescript(_loc1_) + "，力道之大几乎让你喘不过气来。她紧紧夹住你，开始在你的腹股沟上前后扭动臀部，仅仅依靠她直肠紧致内壁的阵阵收缩来为你套弄。你离高潮只有一步之遥，只能无助地将手指紧紧抠进泥土里");
         if(get_player().hasTailInsteadOfLegs() || get_player().tail.type == 9)
         {
            outputText("同时你的尾巴卷起来找到了自己的屁眼。龙女下体的紧致感如此强烈，你几乎感觉不到自己尾巴的压力，它轻松地推入，舒缓地抚慰着你过度劳累的前列腺");
         }
         outputText("。你嘴里的尾巴开始向你喉咙深处抽插，强行撑开你的下巴，光滑且布满纹理的鳞片越过你的舌头和悬雍垂，如蛇般钻进你的食道，将女孩的蜜汁强行挤入你口腔的每一个缝隙。看着你被她那阳具般的附肢操弄着脸颊，足以让她尖叫着迎来第二次高潮，奇哈的屁股终于放松下来，让你下腹部沸腾的高潮得以爆发");
         if(get_player().balls > 0)
         {
            outputText("，随着沉甸甸的存货汹涌地冲过你的血肉，你的[balls]几乎在如释重负的狂喜中跳动起来");
         }
         outputText("。一股滚烫的精液从你的" + get_player().cockDescript(_loc1_) + "中喷涌而出，将她之前的挑逗和虐待在你体内积聚的沉重精液如洪流般灌满她的体内。");
         if(get_player().cockTotal() > 1)
         {
            if(get_player().cockTotal() > 2)
            {
               outputText("你空闲的肉棒在龙女的重压下抽搐紧绷着，向四周喷射出成股的精液。");
            }
            else
            {
               outputText("你空闲的肉棒在龙女的重压下抽搐紧绷着，向四周喷射出成股的精液。");
            }
         }
         outputText("她紧紧收缩括约肌，将喷涌的精液留在体内，同时将她的尾巴塞进你的喉咙深处，直到粗壮的肉体再也无法塞过你的下颌。她在你体内扭动着那条肢体，施虐般地喘息着，你脖子上的凸起又向下滑动了一英寸。你开始窒息。[pg]");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,432,1);
         outputText("[say:用精液填满我的屁股，]她发出呼噜声，暂时忘记了她的敌意。[say:我想在肚子里感觉到它。]你只能顺从，窒息引起的恐慌为你的高潮增添了力量，直到她的腹部被你沉重的精液撑得膨胀起来。在你晕倒之前，你能看到她将四根长着利爪的手指勾进她的小穴，同时拇指疯狂地揉搓着她暗色的阴蒂。然后，只剩下黑暗。[pg]");
         outputText("当你醒来时，你的喉咙感到刺痛，嘴唇上还残留着她小穴的味道。令人惊讶的是，你的下体湿漉漉的，但并不黏糊，到处都没有精液的痕迹。她一定是在你昏过去后把[eachcock]舔干净了。你的[hips]因为那个野蛮女人的骑乘仍然酸痛，所以你花了比平时更长的时间才一瘸一拐地回到营地。");
         get_player().orgasm("Dick");
         get_combat().cleanupAfterCombat();
      }
      
      public function kihaRapesLittleGirlsISawItOnTheNews() : void
      {
         clearOutput();
         get_images().showImage("kiha-loss-female");
         spriteSelect(SpriteDb.get_s_kiha());
         outputText("[say: 哎呀，哎呀……你这里的小穴真可爱！]她嘲弄地惊呼，将手掌压在你湿润的私处。带着邪恶的笑容，龙女强行将两根手指塞入你的体内，它们长而坚硬的指尖无情地分开了你敏感的血肉。你因她强行进入而发出痛苦和快感交织的尖叫，在她的手上不舒服地扭动着。[say: 哈哈！你很享受这个？别担心，荡妇，我们才刚刚开始。]奇哈稍微向后拉了一点，又滑入了一根手指，用她手指的粗细撑开你的小穴，疯狂地在你的小穴里进进出出，享受着你脸上蔓延的喘息和红晕。[pg]");
         outputText("你呻吟着，虚弱地乞求她停下来，或者至少慢一点，温柔一点。她无情刺激带来的快感让你的小穴流口水，而这只龙残酷的漠不关心带来的痛苦迫使你强忍着不说话，试图不让她因看着你尖叫而感到满足，唾液在你的嘴里冒泡。她撑开你的阴唇，粗暴地刺入你的深处，专注地看着你的脸，享受着你的软弱。当最后，你在高潮的阵痛中大叫时，她满意地撅起嘴唇，一丝微弱的深情红晕爬上了她暗黑色的脸颊。[pg]");
         outputText("尽管你崩溃的克制带来了快感，但你高潮身体的恳求颤抖让她比以前更具攻击性。[say: 是的！求饶吧！你不配得到我的一分钟时间！像我这样的人怎么会对你这样的猪感兴趣？]为了强调她正在用你的蜜壶玩的游戏，奇哈用手指捏住你的[clit]，她爪子狭窄的指甲紧紧地挤压着你敏感的肉核，以至于你张开下巴，发出了无声的极乐尖叫。[pg]");
         outputText("[say: 接下来会是这样的，]当你终于停止喘息时，她喃喃自语。[say: 你要舔我，直到我让你停下来，每次你惹我不高兴，我都会在你敏感的小骚穴上发泄。]她转过身，坐在你的脸上，将她湿润的小穴砸在你的[face]上。[say: 感激我让你这么做吧，]她咯咯地笑着，再次捏住你的阴蒂以示强调。按照她的吩咐，你深深地舔进这只龙温暖天鹅绒般的褶皱中。");
         if(get_player().tongue.type == 1)
         {
            outputText("你很感激你分叉的舌头，这让你能一次覆盖她更多的小穴。");
         }
         else if(get_player().hasLongTongue())
         {
            outputText("你那非人般长且能抓握的舌头在这里是一种恩赐；你可以伸进她最深处的凹陷，吸溜着进入每一个角落和缝隙，并且通常能提供人类永远无法做到的舌交。");
         }
         outputText("[pg]");
         outputText("尽管你热情地努力，但无论怎么舔舐、吸吮和轻咬似乎都无法取悦她，几分钟后，你感觉到你的[clit]又传来一阵痛苦的捏掐，你粉红色的珍珠在她的手指间跳动。[say: 不是这样做的！既然你这么无能，我只好教你怎么做了！记下来。]她弯下腰，她脸上的热气在你颤抖的阴户上呼出了一层闪烁的温暖帷幕。她以闪电般的速度将灵活的舌头塞进你的小穴，你因她刺痛的唾液舔舐你下体深处的美妙湿润而颤抖，她用肌肉发达的舌尖划过你的血肉，然后在你脆弱的深处吹出一口热气，快感在你的肉壁中荡漾。[pg]");
         outputText("你在夹杂着恐惧的狂喜中颤抖，加倍努力，像一个快要渴死、突然遇到清泉的女人一样，吸溜着你那爬行动物折磨者现在源源不断流出的汁液。伴随着另一声呻吟，奇哈在你疼痛的小穴里呼出了一口热气，感觉几乎像是令人痛苦又美妙的火焰，你几乎要越过边缘，你的汁液蒸发成一团淫荡的欲望香水，飘进龙女的鼻孔。[say: 是的，为我高潮吧，]她轻柔地说着，一边将她的小穴在你的[face]上摩擦，用她自己那闷烧的香味淹没了你的口鼻。[pg]");
         outputText("你无法也不愿做任何事，只能服从，你在肌肉的颤抖紧绷中达到了高潮，这震动了趴在你身上的龙。");
         if(get_player().wetness() >= 5)
         {
            outputText("你的汁液像鸡巴射出的精液一样喷在她的脸上，你大量的润滑液无法抵抗高潮的压力而倾泻而出。");
         }
         outputText("她也以同样的方式回应，将她那无法言说的吸引力喷洒在你紧绷的脸上。你沉溺在龙女的淫液中，在快感中颤抖，最终昏了过去。[pg]");
         outputText("等你醒来时，奇哈早就没影了。");
         get_player().orgasm("Vaginal");
         dynStats(DynStat.Sens(2));
         get_combat().cleanupAfterCombat();
      }
      
      public function kihaRapesHerms() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_kiha());
         get_images().showImage("kiha-loss-herm");
         outputText("龙女翻了个白眼，以缓慢而从容的步伐拉近了你们之间的距离。她轻松地拍开了你虚弱的防御，直到站在离你几英寸远的地方，她的尾巴来回甩动，暗色的嘴唇上勾起一抹冷笑。[say: 脱，]她命令道，声音轻如耳语。当你没有照做时，一道猩红的闪电划过你的视线，你的脸爆发出剧烈的疼痛。你眨了眨眼，踉跄着后退了几步，奇哈的手背还高高举着。她脸上闪过一丝恼怒，用怒火中烧的目光死死盯着你，咬牙切齿地发出嘶嘶声：[say: 我不说第二遍。]为了不进一步激怒这个龙女，你顺从了，脱下你的[armor]，向她露出你赤裸的身体。一丝喜悦在她的嘴角闪过，但很快就被她轻蔑的伪装压制了下去。[say: 软弱，渺小，完全是个废物。啧，我想这也是没办法的事，]她嘟囔着，声音大到足以让你听见。她再次向你逼近，将一只长着利爪的手放在你的[chest]上，动作几乎称得上温柔。然后，她动作敏捷地用掌根猛击你的胸骨，突然将你击倒在地。她弯腰俯视着你倒下的身体，放低身子跨坐在你的[hips]上，她那肌肉发达、布满鳞片的双腿紧紧夹住你的下半身。[pg]");
         outputText("你张开嘴，她凑了过来，她那挺拔的双峰火热地压在你的[chest]上，在几乎要吻到你的时候停了下来。她嘴角勾起一抹微笑，随后扭曲成一个冷笑。[say: 一句话也别他妈说。我不需要你在这个时候保持清醒。]然后，奇哈向后伸出手，抓住她那又长又粗的尾巴，把它拉到你们俩中间。当她把尾巴拉向她那炭黑色的笑容时，她那覆盖着鳞片的附肢尖端急切地蠕动着，她用柔软的嘴唇贴住狭窄的末端，轻轻地把它吸进嘴里。她每次几英寸地在嘴里进进出出，脸颊因为吸吮的力量而凹陷，她的胸膛随着时间的推移起伏得越来越快。最后，当她把尾巴从嘴里拔出来时，红黑相间的鳞片上闪烁着她浓稠唾液的光泽。那根泛红的附肢转了半圈面向你，龙女用力将它滑入你的唇间。她温暖体液的味道让你的肌肉产生了一阵阵微小的电流，让你的下巴痉挛着张开，并在那里僵住了一会儿。你开始流口水，她小心翼翼地用灵活的尾刺在你的舌头周围滚动，收集你的体液并与她自己的混合在一起。[pg]");
         outputText("她靠近的体温和不断探索的尾巴开始让你兴奋起来，[cocks]紧贴着你的腹部慢慢变硬。注意到你的勃起，龙女把她的尾巴从你嘴里拔出来，再次卷到身后。[say: 你很想把你那玩意的每一寸都塞进我紧致的小穴里，对吧？]她嘲弄道，双手按在身后的地上。她向后靠去，顺着鼻梁轻蔑地俯视着你，卷起上唇露出她参差不齐的尖牙。");
         if(get_player().isGoo() || get_player().hasTailInsteadOfLegs())
         {
            outputText("稍微向后滑动");
         }
         else
         {
            outputText("她将一条腿勾在你的腿下");
         }
         outputText("，奇哈调整了姿势，让她灰白色的阴户湿润地贴在你的" + get_player().vaginaDescript(0) + "上，她下身丰满的阴唇在狂热的拥抱中舔舐着你的花瓣。龙女以一个倾斜的角度在你身上摇晃，她滚烫的私处摩擦着你敏感的血肉，当她坚挺粉嫩的阴蒂珠擦过你的[clit]时，过度刺激带来的微小电流穿过你的臀部。你模仿着她的动作，随着你的肉体充血，你越来越急切地在女孩身上摩擦，几乎忘记了你的[cocks]那悸动着的冲动。[pg]");
         outputText("你完全沉浸在你们柔软的身体相互盘旋摩擦的动作中，以至于当一根坚硬的物体滑入你们的阴户之间时，你没有想到低头去看，只是带着毫无疑问的热情在上面扭动。然而，当粗糙的凸起开始抚摸你紧绷的女性私处时，你猛地吸了一口气，眨了眨眼，驱散了眼中的情欲迷雾。奇哈扭动的尾巴从她的臀缝间滑了上来，钻入你们两人之间，带有纹理的坚硬鳞片沾满了淫水，摩擦着你们两人的小穴。龙女逐渐在你们紧紧包裹的阴户之间抽插着她的尾巴，她向后仰起头，爽得闭上了眼睛。[say: 噢，我可比你擅长多了！]她呻吟着，小心翼翼地用她鳞片的凸起弹拨着她那被包皮包裹的甜美阴蒂，几乎是顺便才按摩了一下你的[clit]。[say: 你他妈真走运，我居然会可怜你这种失败者，]她呼出一口气，声音被迅速逼近的高潮所掩盖。[pg]");
         var _loc1_:Boolean = false;
         if(get_player().hasItem(get_consumables().INCUBID))
         {
            outputText("当你们两人在奇哈沾满淫液的尾巴上纠缠时，她注意到了你们旁边堆着的一堆你的物品。[say: 你给我带了什么狗-狗-狗屎礼物，]她咧开长满利齿的嘴笑着喘息道。她用一只手拨开你的物品，注意到了你那瓶阴茎形状的梦魇药剂，并用拇指和食指夹住了瓶子。[say: 恶魔的垃圾，果然。你甚至都不知道怎么正确使用它。让我来教教你。]她弹开小瓶的软木塞，将药剂一口吞下。你还没来得及抗议，她阴蒂上的包皮就向后滑开，她充血阴户上方指尖大小的肉珠每秒都在变粗。伴随着一阵剧烈的痉挛，她那带来快乐的肉芽高高翘起，长到三英寸，然后是六英寸，最后停留在九英寸长。她那巨大的阴蒂有着两英寸粗的肉棒，正在不断跳动，底部向外凸起，因为矩形、相互咬合的鳞片硬化成了一个从底部到顶端的阶梯。她那没有特征、圆润的龙根顶端肿胀并淫秽地突出，弯曲成一个倾斜的冠状，随着她新长出的肉棒顶端裂开一条细缝，染上了情欲的红晕。[pg]");
            get_player().consumeItem(get_consumables().INCUBID);
            outputText("奇哈动作不停，将她更多的尾巴穿过你喷涌着淫液的下身阴唇之间，并将长而灵活的尾巴尖缠绕在你的[cock]上，把它拉向她的新肉棒。完成缠绕后，这条沾满女孩淫液的灵巧肢体紧紧勒住你们的器官，疯狂地上下滑动。她长而光滑的肉棒鳞片摩擦着你肉棒敏感底部的感觉非常美妙，你伸出一只手去帮助龙尾进行快速、盘旋的套弄。奇哈抬起腿，用她肉垫脚的脚跟把你的手臂踢了回去。[say: 这是给我的，]她几乎是在尖叫，[say: 你只是来蹭车的！我甚至都不喜欢你滚-滚-滚烫的肉棒摩擦我的，也不喜欢你喷水的淫水吸吮我的尾-尾-尾巴。所以你就像个小垃-垃-垃圾一样躺好，然后他妈的……射出来！]说到这里，龙女迷失在了快感中，她那处女般的肉棒喷发出一阵沸腾的精液，向后划出一道弧线，将她自己乳白色的精液溅了她一脸和一胸。[pg]");
            _loc1_ = true;
         }
         outputText("当奇哈达到高潮时，一声颤抖、脆弱的呻吟从她毫无防备的唇间溢出，你自己的防线也随之崩溃。你的" + get_player().vaginaDescript(0) + "在肌肉紧绷的狂喜中痉挛，而你的[cocks]随着如喷泉般喷涌而出的精液而抽动。苍白粗壮的精液从你的下体喷射而出，充满激情的雪白液滴如雨点般落在你们两人身上，一场精液雨将你高潮的余热溅洒在你们沉沦的身体上。即使在你释放的兴奋感消退之后，龙女依然用她沾满精液的尾巴摩擦着你们俩，直到第二次较弱的高潮穿透你疲惫的肉体。龙女从你的下半身抽离出来，站起身，依然充满着精力并带着嘲弄的责备。[say: 这就是我对付入侵者的方法！如果没有合适的贡品，我不想再在这里看到你紧致的屁股，]她警告道，嘴角勾起一抹极淡的歪笑。");
         if(_loc1_)
         {
            outputText("[pg]当她退回泥潭时，她嘟囔的声音传到了你的耳边。[say: 尽管我很想留着它，但最好还是把这事了结了，]她叹了口气，低头看了一眼自己肿胀的龙根。[say: 幸好在那个水晶瓶让我怀孕之后，我把那些粉红色的蛋都留了下来。]然而，故事的其余部分你无从知晓，因为她那纤细摇曳的身躯再次被沼泽的怀抱所吞没。");
         }
         get_player().orgasm("Dick");
         dynStats(DynStat.Lib(1),DynStat.Sens(3));
         get_combat().cleanupAfterCombat();
      }
      
      public function kihaMilkTitHumiliation() : void
      {
         clearOutput();
         get_images().showImage("kiha-loss-milking");
         spriteSelect(SpriteDb.get_s_kiha());
         if(get_player().get_lust() >= get_player().maxLust())
         {
            outputText("你滑倒在地，欲火焚身，无法战斗，公然抚摸着自己。");
         }
         else
         {
            outputText("你滑倒在地，彻底败北，无力再战。");
         }
         outputText("奇哈哼了一声，从鼻孔里喷出一小股火焰和烟雾，高高地俯视着你趴在地上的身体。[pg]");
         outputText("[say: 就这？]龙女低头看着你问道。[say: 你确定你不应该和其他黏液块一起在湖边闲逛吗？我觉得那更适合你。我甚至听说那里有个农场。也许他们会欣赏你那可笑的、充满乳汁的肉球。他们甚至可以给你一个写着你名字的隔间，“奶牛”。我打赌你会喜欢的。]她平静地剥开你上衣的上半部分，露出你滴着奶水的乳头。[pg]");
         outputText("奇哈对你[nipple]上渗出的白色水珠感到厌恶，问道：[say: 你真的觉得这很性感吗？真恶心。只有病态的……哺乳动物才会喜欢的身体变态。][pg]");
         outputText("长满鳞片的女人弯下腰，依次拉扯你的[nipples]，每次你的乳房喷出奶水时，她都会大笑。每一次粗暴的挤压都会让你的身体产生情色的颤栗，你很快就因为这种粗暴的对待而兴奋起来。奇哈继续着，");
         if(get_player().hasCock())
         {
            outputText("没有注意到你下体的坚挺");
         }
         else if(get_player().hasVagina())
         {
            outputText("没有注意到你日益增长的渴望的气息");
         }
         else
         {
            outputText("没有注意到你皮肤的潮红");
         }
         outputText("她毫无经验地挤着你的乳房。她甚至没有脸红；如果说有什么的话，她的表情让你想起一个玩新玩具的孩子。奇哈对此一点也不兴奋！[pg]");
         outputText("更用力的一拉释放出一股浓稠的乳汁，让你呻吟起来。龙女听到你愉悦的声音退缩了，问道：[say: 你觉得这很爽吗？哦……以莉希丝的名义，你竟然觉得爽！你干脆一边爽一边“哞哞”叫算了，你这头该死的奶牛。]奇哈对你的乳头变得更加粗暴，拉扯和捏弄的力度刚好让你感觉更好。你在她毫不温柔的拉扯下扭动着，每次她用力过猛时都会痛得皱眉。[pg]");
         outputText("*啪*[pg]");
         outputText("她的手狠狠地扇在你的脸上，留下一个红色的掌印。[say: 我说你应该“哞哞”叫，奶牛。][pg]");
         outputText("你眨了眨眼，忍住涌出的泪水，点了点头，发出一声微弱的、几乎听不见的“哞”声。[pg]");
         outputText("[say:你说什么？大声点，不然我可能会用力挤奶，把这些乳房扯下来一个，]奇哈带着施虐的微笑威胁道。你立刻哞哞叫了起来，这次声音更大了。她奖励你快速地挤压了一下你的乳房，将更多的乳汁喷射到空中。你颤抖着，随着每一次被迫从你体内喷出的乳白色液体，你变得越来越兴奋。[pg]");
         outputText("奇哈继续动作，挤着你的乳头直到它们几乎干涸，并让你大声哞哞叫，声音大到肯定有其他人能听到。你感到彻底的挫败和屈辱。你觉得自己就像一头母牛。然而，你又是如此发情，酸痛的乳头如此敏感，让你感觉快要高潮了。这只母龙一定看出了你眼中的神情，因为她停了下来，把手在你的头发上擦干净。[pg]");
         outputText("奇哈宣布道，[say: 都搞定了，母牛。现在让我拿几颗宝石作为辛苦费，然后送你回农场。]她翻找你的宝石袋，但你无法阻止她。你太虚弱，太发情了。袋子落在你的肚子上，奇哈最后捏了一下你受虐的乳房，挤出一滴微弱的乳汁，并让你嘴里发出一声相配的“哞”。她对此放声大笑，然后离开了。[pg]");
         outputText("你步履蹒跚地回到营地，在你那充满性欲的脑海中一遍又一遍地回放着那色情的折磨。你就是无法摆脱它，一旦你到了安全的地方，你最终花了几个小时自慰，一边玩弄自己的身体，进一步虐待你那充满乳汁的乳房，一边一遍又一遍地哞哞叫。");
         if(get_player().cor < 33)
         {
            outputText("你堕落得有多深。");
         }
         else if(get_player().cor < 66)
         {
            outputText("这一切是多么令人困惑。为什么事情不能像在家里那样简单呢？");
         }
         else
         {
            outputText("该死，真火辣。");
         }
         get_player().orgasm("Tits");
         dynStats(DynStat.Tou(-1),DynStat.Sens(5));
         get_combat().cleanupAfterCombat();
      }
      
      public function kihaLossIntro() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_kiha());
         if(get_player().get_lust() >= get_player().maxLust())
         {
            outputText("你放弃了战斗，发情得无法继续打下去了。奇哈用斧头砸向地面，喷出一口烟雾。[say:真是个不知廉耻的荡妇！在激烈的战斗中你居然还在对我发情，就像一只普通的小恶魔！你连舔我脚爪缝的资格都没有！][pg]");
         }
         else
         {
            outputText("你倒下了，伤得太重无法继续战斗。奇哈用斧头砸向地面，喷出一口烟雾。[say:真是个懦夫！我才刚开始打，你就已经输了！][pg]");
         }
         if(get_player().biggestLactation() >= 2)
         {
            kihaMilkTitHumiliation();
         }
         else if(get_monster().get_lust100() >= 50)
         {
            outputText("母龙叹了口气，环顾四周。[say:既然你不能在战斗中满足我，那就看看你还有什么别的能耐吧……][pg]");
            outputText("奇哈把斧头扔在几英尺外的地上，脱下你的[armor]，露出你的");
            if(get_player().hasCock())
            {
               outputText(get_player().multiCockDescriptLight());
            }
            if(get_player().hasCock() && get_player().hasVagina())
            {
               outputText("和");
            }
            if(get_player().hasVagina())
            {
               outputText(get_player().vaginaDescript());
            }
            outputText("。[pg]");
            if(get_player().get_gender() == 0)
            {
               kihaGenderlessBeating();
            }
            else if(get_player().get_gender() == 1)
            {
               kihaRapesMen();
            }
            else if(get_player().get_gender() == 3)
            {
               kihaRapesHerms();
            }
            else if(get_player().get_gender() == 2)
            {
               kihaRapesLittleGirlsISawItOnTheNews();
            }
         }
         else
         {
            outputText("奇哈双手握紧斧头向后拉，你确信死期已至。片刻之后，斧面猛地拍在你的头上，将你击晕。");
            get_player().takeDamage(1000);
            get_combat().cleanupAfterCombat();
         }
      }
      
      public function kihaGenderlessBeating() : void
      {
         spriteSelect(SpriteDb.get_s_kiha());
         outputText("[say: 真是个没种的家伙！]她冲你大喊，在剥光你后注意到了你没有任何性别特征。[say: 怎么了，小矮子？太害怕邪恶的小恶魔和地精会虐待你吗？]她沮丧地用尾巴拍打地面，抓起她的斧头。[say: 真是浪费时间。你无论是在战斗中还是在战斗外都毫无用处。]她开始踢你，最后重重地一击将你打晕。");
         get_player().takeDamage(1000);
         get_combat().cleanupAfterCombat();
      }
      
      public function kihaExplore(param1:Boolean = true) : void
      {
         if(param1)
         {
            clearOutput();
         }
         var _loc2_:int = 342;
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,_loc2_,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,_loc2_) - 1);
         var _loc3_:Number = Utils.rand(10);
         var _loc4_:ItemType = null;
         if(_loc3_ == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,415) == 0)
         {
            inquisitorRobesDiscovery();
            return;
         }
         if(_loc3_ < 5)
         {
            outputText("你在沼泽里转了一会儿，但什么也没找到。");
            doNext(get_camp().returnToCampUseOneHour);
            return;
         }
         if(_loc3_ < 7)
         {
            _loc4_ = get_consumables().REDUCTO;
         }
         else if(_loc3_ < 8)
         {
            _loc4_ = get_consumables().GROPLUS;
         }
         else if(_loc3_ < 9)
         {
            _loc4_ = get_consumables().COAL___;
         }
         else if(_loc3_ < 10)
         {
            _loc4_ = get_useables().T_SSILK;
         }
         outputText("在探索时，你在地上发现了一件物品！");
         get_inventory().takeItem(_loc4_,get_camp().returnToCampUseOneHour);
      }
      
      public function inquisitorRobesDiscovery() : void
      {
         clearOutput();
         outputText("你在沼泽中披荆斩棘，希望能找到一些不是蜘蛛的东西，当你真的成功时，你感到一阵惊喜。你在一个低矮的山坡上发现了一扇长满青苔的石门，上面装饰着某种复杂的拼图锁，由多个刻有动物符号的石圈组成。你不知道门后潜伏着什么，但如果冒险没有教会你别的，那就是拼图后面总是藏着很酷的东西。[pg]");
         if(get_player().get_inte() < 60)
         {
            outputText("不幸的是，无论你怎么尝试，似乎都无法解开这个锁。你多次旋转石环，试图找出其中的规律，但结果总是令人失望。最后，你甚至试图去听门后锁簧转动的声音，希望能找到线索，但这并没有你想象的那么成功。虽然失望，但你并未气馁，你决定等以后更有能力解开这个巧妙的谜题时，再回到这个神秘的锁前。");
            doNext(get_camp().returnToCampUseOneHour);
            return;
         }
         outputText("在旋转拼图锁试图找出解法时，你注意到上面重复的符号有些奇怪。虽然一开始你以为它们代表锁应该放置的位置，但你开始怀疑其中另有玄机。你慢慢排除了各种可能性，最终证实了你的猜想：这些符号是一个密码，隐藏着打开这扇门的真正答案。它们的旋转只是一个障眼法，用来掩盖其本质。如果你的翻译没错，这扇门实际上是被魔法封印的，正在等待一个口令来开启：一个在它面前绝不会被随意说出的词。[pg]");
         outputText("[say: 贞洁，]你说。[pg]");
         outputText("门上的锁簧转动，停在了一个毫无意义的位置。石制铰链在地上摩擦发出隆隆声，密封的入口缓缓打开。浑浊的空气从洞穴中涌出。在你面前，石阶向下延伸，墙上的火把也随之亮起。这个房间可能已经几十年无人涉足了。[pg]");
         outputText("你警惕地走下楼梯。地上的灰尘让你很难判断房间里是否有陷阱，但这种谨慎似乎是多余的，因为你平安无事地到达了楼梯底部。房间里只有一张桌子和一个箱子。桌子上放着一卷羊皮纸。虽然你对箱子很好奇，但你更想知道这里到底是什么地方。你展开羊皮纸，开始阅读。[pg]");
         outputText("<i>我失败了。");
         outputText("[pg]如果我少一点傲慢，我本可以阻止降临在这片土地上的所有悲剧。根除王国中的腐败，确保没有任何力量能玷污我们的名誉，或亵渎我们的女王，这是我的职责。但我太自信了，太确信自己所认为的真相。我以为我的职责是保护女王，让她免受那些思想危险鲁莽、不纯洁的平民和渴望权力的法师的伤害。[pg]");
         outputText("相反，我本该保护他们免受女王的伤害。[pg]");
         outputText("当我终于认清莉希丝所作所为的真相时，一切都已经太迟了。腐败像一头饥饿的野兽一样在王国中蔓延。平民和法师都被它的堕落所吞噬，并被重塑。恶魔诞生了，如果我有先见之明，更仔细地观察我的女王，我本可以阻止这一切。[pg]");
         outputText("不要把我当成懦夫，我只是个傻瓜。当我终于睁开眼睛时，我站出来反抗我的女王。我敢于向她举起武器，召唤出最明亮的白色火焰，燃烧着一个决心拯救国家的男人的绝望。但我失败了。她吞噬了太多的灵魂，获得了太多可耻的力量。我甚至还没站稳脚跟，就已经耗尽了我的能量。[pg]");
         outputText("她嘲笑我。也许她是对的。一个地狱般的印记烙在我的身上，作为对我傲慢的惩罚。[say: 无法被吞噬的灵魂，]她这样称呼我。我被剥光衣服，被迫在城市里爬行，被吐口水，被射精，被现在占据这座城市的享乐主义者嘲笑。没有人敢试图改变我，因为我身上有莉希丝的印记。这就是我的惩罚。我无能为力地看着这片土地沦陷于我曾经负责控制的污秽之中。[pg]");
         outputText("我没能阻止恶魔，也没能阻止莉希丝。但我只是一个人，以后还会有更多的人来。许多人——太多的人——将会倒下，他们的灵魂和本性将被这片土地吞噬，我将为他们承受痛苦。这不是他们的错，是我的不作为创造了一股比他们更强大的力量。[pg]");
         outputText("但恶魔——我曾经的女王——是贪婪的。他们会扩张，会征服，总有一天他们会扩张得太远。总有一天，会有一位勇者向他们发起挑战。也许来自另一片土地，一个更强大的部落，傲然挺立，对抗威胁他们的力量。也许来自我们王国的一个据点，一个躲藏起来长大的孩子。我不知道。[pg]");
         outputText("如果你找到了这个房间，那么你很明智。比大多数人都要明智和聪明。也许你有能力成为那个勇者。虽然我失败了，但我已经采取措施确保我的错误不会重演。我的魔法受到了限制。你的不会。[pg]");
         outputText("我耗尽了我最后的能力，制作了一套适合勇者的服装。它被锁在箱子里。我不是傻瓜——我知道可能需要调整这套盔甲，以适应被腐败力量扭曲的身体。也可能需要让它稍微堕落一些，以便在同样发生改变的社会中不那么引人注目。[pg]");
         outputText("站在箱子前，说出“惩戒”或“肉欲”。我注入其中的最后魔法会完成剩下的工作。[pg]");
         outputText("我由衷地、真诚地、用我全部的生命希望你能成功。我任命你为一个战败王国的最后一位审判官，并在这里散尽我的力量。如果我足够幸运，我将活着看到这片土地恢复原貌。如果没有，那也是对我傲慢的应得惩罚。[pg]");
         outputText("玛莱保佑。[pg]");
         outputText("-审判官扎图尔</i>[pg]");
         outputText("你放回卷轴，看向箱子。你要说出其中一个口令吗？[pg]");
         menu();
         addButton(0,"惩戒",retributionArmorIsCoolShit);
         addButton(1,"肉欲",carnalityArmorIsCoolShitToo);
         addButton(4,"不了！",noThankYouSirIDontWantAwesomeArmors);
      }
      
      public function encounterKiha() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_kiha());
         if(get_kihaFollowerScene().followerKiha() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,429) == 1)
         {
            get_kihaFollowerScene().kihaReactsToHorseDicking();
            return;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,421) > 0 && !get_player().isPureEnough(66) && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,423) != 1)
         {
            get_kihaFollowerScene().kihaBitchesOutCorruptPCs();
            return;
         }
         if(get_player().isPureEnough(66) && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,423) == 1)
         {
            get_kihaFollowerScene().kihaUnbitchesUncorruptedFolks();
            return;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,421) >= 1 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,423) != 1)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,421) == 2 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,422) >= 100 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,427) == 0)
            {
               get_kihaFollowerScene().kihaOffersToMoveIn();
               return;
            }
            get_kihaFollowerScene().kihaFriendlyGreeting();
            return;
         }
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,343,FlagDict_Impl_.arrayReadInt(_loc1_,343) + 1);
         if(get_player().isPureEnough(66) && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,421) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,344) >= 3 && get_player().get_gender() > 0)
         {
            get_kihaFollowerScene().kihaSpiderEventIntro();
            return;
         }
         get_images().showImage("kiha-intro");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,343) == 1)
         {
            outputText("一个高大的身影从粗糙的沼泽树上跳下，落地时将泥土和苔藓溅得到处都是。你立刻举起你的[weapon]，摆出战斗姿态。陌生人放声大笑，直起身子，将她铁锈红色的翅膀收在背后。她正忙着大笑，让你有机会好好看看这个六英尺高的怪物女人。虽然她的脸有类似人类的特征，但额头上突出一对邪恶的角，证明她受到了不小的污染。这对双角与她头骨的曲线相吻合，尖端向后伸出一段距离。她的眼睛几乎是纯红色的，中间有墨黑色的竖瞳。深红色的鳞片顺着她的手臂和腿向上延伸，在背部交汇。一条强壮的爬行动物尾巴垂在她身后，以危险的力量来回抽打着。[pg]");
            outputText("[say: 眼睛往上看，" + get_player().mf("屌丝","荡妇") + "，] 龙女命令道——她绝对是个女人；她肌肉发达的双腿之间那深色的入口就足以证明这一点。她旋转着一把看起来很邪恶的双刃斧，警告说：[say: 你似乎闯入了我的领地。让我把话说明白：这片沼泽是我的，如果你再踏入这个区域，我会把你打得后悔没遇到莉希丝。现在快滚，趁你还没后悔遇到奇哈！] 随着她斧刃的每一次挥动，空气中都会留下一道细细的热浪，这显然是一件魔法武器。[pg]");
            outputText("你要做什么？");
            menu();
            addButton(0,"战斗",meetKihaAndFight).hint("和龙女战斗！");
            addButton(1,"询问原因",askWhy).hint("问奇哈为什么要赶你走。");
            addButton(2,"买路",offerToBuyPassageFromKiha).hint("试着给奇哈200宝石买路。");
            addButton(14,"离开",leaveWhenMeetingAgressiveKiha);
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,345) == 1)
         {
            outputText("奇哈从天而降，重重地砸在长满苔藓的泥土上，巨大的冲击力让泥土四处飞溅。她站起身来，咆哮道：[say: 别以为你以前打败过我，就意味着你真的赢了我。我永远不会被打败！][pg]");
            outputText("她一边挑衅地尖叫着，一边向你冲来，你几乎没有时间准备战斗！");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,345,0);
            startCombat(new Kiha());
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,341) == 1 && Utils.rand(2) == 0)
         {
            outputText("奇哈从树后走了出来，背上背着斧头，双臂交叉抱在丰满的胸前。[say: 又是你？我一直在想你说的话。与其把你打得失去知觉，不如你给我进贡200颗宝石，我就让你在我的领地里畅通无阻。当然，如果你闯进我的巢穴，我可能还得教训你一顿。]她那暗色的脸庞上浮现出贪婪的笑容，眼中闪烁着调皮的深红色光芒。等一下……这难道不是你的主意吗？[pg]");
            menu();
            addButton(0,"战斗",meetKihaAndFight).hint("和龙女战斗！");
            addButton(1,"支付",payKihaTribute).hint("支付给奇哈200宝石，让她允许你探索她的领地？");
            if(get_player().get_gems() < 200)
            {
               outputText("[pg]你付不起钱！");
               removeButton(1);
            }
            addButton(2,"我的主意",tellKihaTributeWasYourIdea).hint("告诉奇哈，整个进贡的事都是你的主意。");
            addButton(14,"离开",leaveWhenMeetingAgressiveKiha);
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,341) > 1 && (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,342) == 1 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,342) == 0 && Utils.rand(2) == 0))
         {
            outputText("奇哈从树后走了出来，背上背着斧头，双臂交叉抱在丰满的胸前。[say: 如果你想再次探索我的领地，你需要支付费用，]她平淡地说道。这太荒谬了——她这么快就想要更多的宝石了？这样下去你会破产的，而且这本来就是你的主意！你该怎么做？");
            menu();
            addButton(0,"战斗",meetKihaAndFight).hint("和龙女战斗！");
            addButton(1,"支付",payKihaTribute).hint("支付给奇哈200宝石，让她允许你探索她的领地？");
            if(get_player().get_gems() < 200)
            {
               outputText("[pg]你付不起钱了！");
               removeButton(1);
            }
            addButton(2,"我的主意",tellKihaTributeWasYourIdea).hint("告诉奇哈，整个进贡的事都是你的主意。");
            addButton(14,"离开",leaveWhenMeetingAgressiveKiha);
         }
         else
         {
            outputText("附近的一棵树突然爆炸，木屑和燃烧的余烬四处飞溅。奇哈拿着她标志性的双刃斧从废墟中走了出来。[pg]");
            outputText("[say: 别废话了，]她命令道，一边向你逼近一边继续说，[say: 我告诉过你避开我的领地，你却无视我的命令回来了。你可能个受虐狂或者白痴，但相信我，你不会喜欢接下来的事情的。][pg]");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,341) == 0)
            {
               outputText("如果你动作快点，也许还能插上一句话。你该怎么做？");
               menu();
               addButton(0,"战斗",meetKihaAndFight).hint("和龙女战斗！");
               addButton(1,"询问原因",askWhy).hint("问奇哈为什么要赶你走。");
               addButton(2,"买路",offerToBuyPassageFromKiha).hint("试着给奇哈200宝石买路。");
               addButton(14,"离开",leaveWhenMeetingAgressiveKiha);
            }
            else
            {
               outputText("战斗开始！");
               startCombat(new Kiha());
            }
         }
      }
      
      public function carnalityArmorIsCoolShitToo() : void
      {
         clearOutput();
         outputText("随着你的话音落下，箱子发出一声咔哒声。你正准备掀开盖子，它却自己打开了，这让你吓了一跳。闪耀夺目的光芒充满了整个房间。你本以为魔法会有点炫耀的成分，是的，但让长袍真的从箱子里升起来似乎有点过分了。一个连着袖子的深红色姿势项圈漂浮在上面，就像穿在人体模型——或者幽灵身上一样。在它下面升起的紧身胸衣看起来非常合身");
         if(get_player().biggestTitSize() < 1)
         {
            outputText("，考虑到你平坦的胸部，这让你觉得很不寻常");
         }
         outputText("。它红得像干涸的血液，看起来紧得要命。金色的滚边沿着……嗯，滚边延伸。同样颜色的系带顺着背部垂下。它自然地连接到一条腰带上，腰带前面印着一个你不认识的符号，腰带又固定在一条偏向一侧的波浪裙上。实际上似乎没有任何下装，这条裙子看起来好像根本遮不住你双腿之间的任何东西——但考虑到你的选择，这可能在预料之中。一双高跟靴子使整套服装更加完美，侧面呼应着类似的深红色蕾丝。你收起这套衣服，把它们放进你的[inv]里，以便在营地进一步检查。[pg]");
         outputText("转身准备离开时，你被站在你和楼梯井之间的幽灵吓了一跳。没有脸的半透明身影穿着红金相间的带风帽长袍，类似于刚刚发现的服装，正仔细地注视着你。你做好战斗准备，但他们一个接一个地退到一边。你小心翼翼地继续前进。当你经过他们时，每个人都向你鞠躬。[pg]");
         outputText("这景象让你感觉自己像个狠角色。[pg]");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,415,1);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2341,1);
         get_inventory().takeItem(get_armors().I_CORST,get_camp().returnToCampUseOneHour);
      }
      
      public function askWhy() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_kiha());
         outputText("你问她为什么要赶你走。奇哈的眉头闪过一丝困惑，但很快她的表情又恢复成了自信的冷笑。[say: 我不需要向你解释。我足够强大，能从莉希丝的基地里逃出来，我也足够强大，能杀掉她派来追杀我的每一个走狗。][pg]");
         outputText("你以为你找到了一个赢得这位强大战士好感的方法，于是你开始解释说你来这里的全部目的就是打败恶魔女王。她打断了你，向空中呼出一股旋转的火焰龙卷风。灼热的烈焰似乎吸干了你肺里的空气，让你说不出话来。当残影还在你的视野中徘徊时，她宣布：[say: 我才不管你为什么来这里。我就是要揍你一顿，就因为你浪费了我的时间！]");
         startCombat(new Kiha());
      }
      
      public function analRapuzulaKiha() : void
      {
         clearOutput();
         get_images().showImage("kiha-buttfuck");
         spriteSelect(SpriteDb.get_s_kiha());
         var _loc1_:int = get_player().cockThatFits(get_monster().analCapacity());
         if(_loc1_ < 0)
         {
            _loc1_ = 0;
         }
         var _loc2_:int = get_player().cockThatFits2(get_monster().analCapacity());
         outputText("你看着龙女瘫倒在树旁，她的尾巴勉强遮住她湿透的私处。你饥渴地舔了舔嘴唇，想要蹂躏这个高傲龙女的小穴，但你决定她应该得到一些更特别的东西。你想要她那紧致的屁股，而且现在就要。[pg]");
         outputText("你叫她转过身去，但她依然桀骜不驯，拒绝了。你怒视着她，用最威严的声音向她吼出命令。她仍然拒绝。[pg]");
         if(get_player().cockArea(_loc1_) <= 20)
         {
            outputText("你迅速脱下[armor]，让你的[cocks]在温暖潮湿的沼泽空气中透透气。她红色的眼睛微微睁大，但很快又恢复了镇定，尽管明显处于劣势，却突然变得自信满满。[say: 哦？你以为你要用那个做什么，嗯？就像某种性饥渴的恶魔一样蹂躏我？这就是你的天才计划吗？][pg]");
         }
         else
         {
            outputText("你迅速脱下[armor]，让你的[cocks]在温暖潮湿的沼泽空气中透透气。她红色的眼睛微微睁大，但很快又恢复了镇定，尽管明显处于劣势，却突然变得自信满满。[say: 哈，看看那个可怜的东西。你可能让我有点兴奋，但我真的很怀疑你能用那个微不足道的装备取悦任何人。][pg]");
         }
         outputText("她的话刺痛了你，你决定要确保她享受你接下来要做的事。你走近这只充满戒备的龙，抓住她的双臂，把她转过身来。令人惊讶的是，她几乎没有反抗你的动作，只有当你粗暴地把她的脸推到树上时，她才挣扎了一下。[pg]");
         outputText("傲慢的龙现在面朝树干，你仔细打量着她紧致的屁股。感觉到你充满欲望的目光，她突然用尾巴缠住下体，把她的女性特征藏在鳞片带后面。你嘲笑她的无知。你告诉她，你渴望的不是她滴水的私处，而是她那令人想捏一把的臀部。[pg]");
         outputText("[say: 哦，所以你不仅是个性饥渴的怪胎，你还喜欢奇怪的东西。你知道那里不应该放东西进去的，对吧？] 无视了这只母龙的嘲弄，你把她的尾巴猛地拉开，举到她的臀瓣上方，以便看得更清楚。令人惊讶的是，她没有反抗，任由整个屁股暴露出来。你咧嘴一笑，掰开她巧克力色的臀瓣，把你的" + get_player().cockDescript(_loc1_) + "放在中间。龙的脸扭曲成充满恨意的怒容，但随着你开始上下摩擦你的肉棒，只在用龟头挑逗这只母龙的菊穴时才停下来，她的决心动摇了。[pg]");
         outputText("你开始感觉到龟头周围的温度升高。她流着淫液的小穴散发出的强烈热量让你的血液沸腾，让[eachcock]长到最大尺寸。你停止了摩擦臀瓣，把你的肉棒贴在她光滑的阴唇上，在她的会阴处摩擦以获得额外的润滑，为你的后庭冒险做准备。[pg]");
         outputText("[say: 听着，]你邪恶地笑了笑，[say: 你自己的淫液正在润滑我，让我占有你。我还以为你一想到屁股被操就会倒胃口呢。] 听到你的侮辱，她明显地收紧了肌肉，把屁股从你的抓握中抽离。你再次抓住她的臀部，把准备好的肉棒猛地插进她如处女般紧致的屁眼里作为惩罚。[pg]");
         outputText("你的手指一碰到她的皮肤，她的尾巴就缠住了你的[cocks]，包裹住你的腹股沟");
         if(get_player().balls > 0)
         {
            outputText("并威胁要捏碎你的[balls]");
         }
         outputText("。 [say: 哦，你还挺暴躁的，不是吗，]你刺激她。[say: 你倒是很会说些尖酸刻薄的侮辱人的话，但承受起来……你的脾气真糟糕。] 你痛苦地皱起眉头，因为缠在你生殖器上的鳞片尾巴作为回应收紧了。[pg]");
         outputText("你需要想个快速的办法摆脱这种痛苦的局面。一个想法在你的脑海中形成。她可能表现得像个高高在上的清教徒，但你对她仍然有明显的影响，就在几分钟前，她的小穴绝对因为你的触摸而湿透了。看来她并不像她希望的那样高高在上。一个狡猾的笑容在你的脸上蔓延，你伸手绕过去，摸索着龙女的乳房。[pg]");
         outputText("她倒吸一口凉气，打破了沉默。你继续按摩她的乳房，手指陷入她晒黑的肌肤，继续你的动作。当你用手指扭弄她的乳头时，她开始轻声喘息，但她的尾部肌肉再次收紧，增加了对你腹股沟的压力。你需要找到一种方法让她的尾巴离开你的胯部……也许你有办法做到。[pg]");
         if(get_player().cor < 33)
         {
            outputText("你把手从她的两座双峰移开，顺着她的身体两侧向下，停在她的臀部上方。希望这会奏效，你开始挠这个固执女孩的痒痒。");
         }
         else if(get_player().cor < 66)
         {
            outputText("既然她似乎把注意力集中在你的手上，你拼命地想找一个不需要用手的解决办法。一个想法形成了，决定机不可失，你向前倾身，轻咬她的耳尖。");
         }
         else
         {
            outputText("既然她此刻似乎把注意力集中在你的手上，你的大脑飞速运转，试图找到一个不需要用手的解决办法。一个想法形成了，决定机不可失，你向前倾身，舌头慢慢滑过她的脸颊。");
         }
         outputText("她被你突如其来的举动吓得尖叫起来。达到了预期的效果，你的分散注意力给了你所需的一瞬间，让你的生殖器从她尾巴的抓握中滑出。你迅速把你的" + get_player().cockDescript(_loc1_) + "放在她紧致的菊穴处，用力向前滑去。你的龟头突破了紧致的圆环，挤了进去。你出其不意的挑逗似乎让她震惊得停止了收紧屁股，额外的润滑液帮助你把一半的长度插了进去。母龙发出了你认为是愉悦的呻吟，终于打破了她一直拼命试图维持的冷酷外表。[pg]");
         outputText("现在环绕着你的" + Appearance.cockNoun(get_player().cocks[_loc1_].get_cockType()) + "的热量是巨大的；她的紧致，令人难以置信。你几乎被一种想把整个长度都插进去，然后把脑浆都射出来的冲动所淹没。但你也想让她享受这个过程。你慢慢地从她的直肠里滑出来，直到只有龟头尖端勉强留在里面才停下来。你向前倾身，胸膛贴着她背部温暖的皮肤，把你的" + get_player().cockDescript(_loc1_) + "再次插进她屁眼那令人窒息的灼热中。[pg]");
         outputText("她因为屁股突然被插入而扭动着。你沉醉于你的肉棒爬进她黑暗深处的快感中，从这只淫荡的母龙开始扭动臀部的方式来看，你很确定她也是。你咧嘴一笑，抓住她的臀部，用力一挺，把自己完全插进她的屁股里。你听到你不情愿的伴侣发出一声痛苦的咕哝，但当你开始对她的肛门进行全面猛攻时，你现在能想到的只有她那火热、紧致的屁股的感觉。[pg]");
         outputText("她痛苦的呻吟变得越来越频繁，音调和热情慢慢改变，直到你意识到它们已经变成了愉悦的呻吟。[say: 哎呀，哎呀，哎呀，]你嘲笑道。[say: 毕竟，你是个相当放荡的荡妇。] 她强迫自己停止不断的呻吟，取而代之的是你的大腿拍打着她大腿的湿润的啪啪声。[pg]");
         if(_loc2_ >= 0)
         {
            outputText("一个变态的想法在你的脑海中形成。你伸出手，抓住");
            if(get_player().cockTotal() == 2)
            {
               outputText("你的另一根肉棒");
            }
            else
            {
               outputText("你的又一根肉棒");
            }
            outputText("，并将其对准她已经被撑开的入口，在下一次挺进时将两根肉棒同时塞入，把她紧致的通道撑得远超正常极限。随着你的两根肉棒蹂躏她的后庭，龙女发出一声尖叫打破了沉默，她因震惊而收紧肌肉，肠壁几乎要将你的阴茎夹碎。极度的紧致和包裹着你肉棒的难以置信的高温变得难以忍受，你感觉到高潮的临界点正在迅速逼近。[pg]");
            outputText("在即将到来的高潮降临之前，你勉强又在这位龙女体内抽插了几下，每一次猛烈的撞击都让她在被迫的双龙入洞中发出夹杂着快感与痛苦的呻吟。你感觉到尿道扩张，喷出一股先列腺液，填满了她的直肠，并在你的肉棒上涂抹了一层新鲜的润滑液，为最后一次冲刺进入女孩饱受蹂躏的后庭做好了准备。[pg]");
            outputText("你最后一次拔出，将它们抵在她大张的后庭口。知道你接下来要做什么，龙女明显放松了下来，试图让过程尽可能少些痛苦。你紧紧抓住她的臀部，将肉棒向前挺进，同时将她向后拉向你的肉棒。你的" + get_player().cockDescript(_loc2_) + "从暴露的洞口滑落，滑入她的臀沟之间，而你剩下的" + get_player().cockDescript(_loc1_) + "则正中目标。[pg]");
            outputText("奇哈在自己的高潮中颤抖着，当你的精液最终释放进她饱受蹂躏的屁股时，她的淫水浸湿了她的大腿。你的另一根" + Appearance.cockNoun(get_player().cocks[_loc2_].get_cockType()) + "紧随其兄弟之后，用雪白的乳霜涂抹着她皮革色的肌肤");
            if(get_player().cockTotal() >= 3)
            {
               if(get_player().cockTotal() == 3)
               {
                  outputText("；你剩下的肉棒用精液玷污了地面");
               }
               else
               {
                  outputText("；你剩下的肉棒们用精液玷污了地面");
               }
            }
            else if(get_player().hasVagina())
            {
               outputText("；你的[vagina]随着快感跳动，当你的肉棒卸载时，女孩的精液浸湿了你的大腿");
            }
            outputText("。[pg]");
            outputText("龙女瘫倒在地，将你精疲力竭的肉棒从她屁股深处抽了出来。看来她已经因为难以承受的痛苦、快感和疲惫而晕倒了。觉得这里的事情已经结束，你取回你的[armor]，把女孩留在你们混合的精液坑里。也许现在她会更尊重你一点。你回到了营地。");
         }
         else
         {
            if(get_player().cockArea(_loc1_) <= 20)
            {
               outputText("你把手移到她的乳房上，感受着那覆盖着轻微鳞片的肉体，并开始配合你持续的抽插揉捏她的乳头。她发出一声长长而愉悦的叹息，打破了自己强加的沉默，但当你嘲笑她的身体背叛了她的情感时，她又立刻停了下来。[say: 怎、怎么会有人喜、喜欢这种事？]她喘息着，几乎无法掩饰自己的快感。[say: 你所做的只是把你那可悲的肉棒塞进一个根本不、不适合它的地方。我、我几乎感觉不到你那小、小小的肉棒……呃……撑开我的屁股，用这、这么大的力气填满它。它的龟头摩擦着我的肠壁，伴随着你……哦……可悲的想让自己高、高潮的尝试……][pg]");
            }
            else
            {
               outputText("你把手移到她的乳房上，感受着那覆盖着轻微鳞片的肉体，并开始配合你持续的抽插揉捏她的乳头。她发出一声长长而愉悦的叹息，打破了自己强加的沉默，但当你嘲笑她的身体背叛了她的情感时，她又立刻停了下来。[say: 怎、怎么会有人喜、喜欢这种事？]她喘息着，几乎无法掩饰自己的快感。[say: 肉棒根本就不该插在那里，你……你这个变态！这……这根本就不舒服……撑开我的屁股，用这、这么大的力气填满它。它的龟头摩擦着我的肠壁，伴随着你……哦……可悲的想让自己高、高潮的尝试……][pg]");
            }
            outputText("随着你继续操她的屁股，她的呻吟声变得越来越大，当你的入侵物在她扩张的括约肌中进进出出时，她的后庭变得和她的小穴一样湿润。她不由自主的享受迹象激励着你，先列腺液从你的肉棒中自由流淌，让你能够无视她那令人窒息的紧致，享受包裹着你" + get_player().cockDescript(_loc1_) + "的火热快感。你怀疑即使是她小穴的深处也无法给你这种感觉。[pg]");
            outputText("你又揉了揉她的乳头，没有意识到她正在努力压抑自己的高潮。她痉挛的肠壁紧紧夹住你的肉棒，急切地榨取着你，同时她浓稠的淫水浸湿了她的大腿。[pg]");
            outputText("你闷哼一声，最后一次挺进，将你的精液射入她体内，用粘稠的精液填满了她的直肠。");
            if(get_player().hasVagina())
            {
               outputText("你的[vagina]随着快感跳动，但这是一种空虚的高潮，让你希望有什么东西能填补那隐隐作痛的空虚。尽管如此，你还是不禁惊叹于用多个性器官高潮的卓越感觉。");
            }
            outputText("伴随着满足的叹息，你从龙女体内拔出，并感谢她带来的美好时光。她靠在树上坐下，愤怒地瞪着你，尽管你很容易就能看出她已经得到了极大的满足。[pg]");
            outputText("觉得这里的事情已经结束，你取回你的[armor]离开了女孩。也许现在她会更尊重你一点。你回到了营地。");
         }
         get_player().orgasm("Dick");
         get_combat().cleanupAfterCombat();
      }
   }
}

