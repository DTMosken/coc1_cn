package classes.scenes.places.telAdre
{
   import classes.CoC;
   import classes.CockTypesEnum;
   import classes.DynStat;
   import classes.Player;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.display.SpriteDb;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.scenes.Camp;
   import classes.scenes.places.TelAdre;
   import coc.view.CoCButton;
   import flash.Boot;
   import haxe.IMap;
   
   public class Ifris extends TelAdreAbstractContent
   {
      
      public function Ifris()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
      }
      
      public function workOutForIfris() : void
      {
         spriteSelect(SpriteDb.get_s_ifris());
         clearOutput();
         outputText("你对着那个长得像恶魔的女孩笑了笑，告诉她你只是来健身的。[pg]");
         outputText("[say: 哦，那别管我。请便，千万别客气。]她指了指卧推床，向后退了一步，微笑着看着你。[pg]");
         outputText("[say: 希望你别介意我陪着你。我很乐意……看看你的表现。][pg]");
         menu();
         addButton(0,"锻炼",liftWhileIfrisWatches).hint("正常锻炼。");
         addButton(1,"炫耀",showOffForIfris).hint("向她展示你的力量。");
         if(get_player().get_str() > 90)
         {
            addNextButton("全力以赴",ifrisAllOut).hint("向伊弗里斯展示你的真正实力。");
         }
      }
      
      public function showOffForIfris() : void
      {
         var _loc1_:* = null as IMap;
         var _loc2_:* = null as Player;
         spriteSelect(SpriteDb.get_s_ifris());
         _loc1_ = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,208,FlagDict_Impl_.arrayReadInt(_loc1_,208) + 1);
         get_player().changeFatigue(30);
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,167) == 0)
         {
            outputText("在门口工作的半人马娘走过来收费，你在她手里放了10颗宝石，作为一小时锻炼的费用。[pg]");
            _loc2_ = get_player();
            _loc2_.set_gems(_loc2_.get_gems() - 10);
            statScreenRefresh();
         }
         outputText("你看了一会儿器械上的设置，决定给这个红皮肤的小可爱留下点深刻的印象。你把杠铃调到最底层，躺在卧推床上时搓了几下手作为准备。她红色的眼睛微微睁大，光滑额头上的细长黑眉也挑了起来，注视着你。看着她可爱地跳了一下并双手合十的样子，你忍不住觉得她简直像是在为你加油……[pg]");
         if(get_player().get_str() < 40)
         {
            outputText("你紧紧握住杠铃，咬紧牙关，用力向上推！或者说，并没有那么用力，尽管你英勇地与重量抗争。然而，你似乎根本无法撼动它，手臂上一阵剧痛告诉你，这是一个多么糟糕的主意！你痛呼一声，松开杠铃，揉着自己的二头肌。[pg]");
            outputText("伊弗里斯只是翻了个白眼，一边走开一边不屑地朝你挥了挥手，嘴里嘟囔着。[pg]");
            outputText("[say: 亲爱的，我可没时间陪那些只会说大话的爱显摆的家伙。][pg]");
            outputText("你感到羞愧难当，站起身离开，抚慰着酸痛的身体和受伤的自尊心。");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,208,0);
            get_player().takeDamage(10);
            doNext(get_camp().returnToCampUseOneHour);
            return;
         }
         if(get_player().get_str() < 75)
         {
            outputText("你紧紧握住杠铃，咬紧牙关，用力向上推！你的肌肉紧绷，吃力地发出闷哼，但那沉重的分量几乎纹丝不动。你听到她发出一声略带失望的[say: 哎呀……]，她注视了你很长一段时间，但无论羞辱感如何激励你，你似乎就是做不到。[pg]");
            outputText("[say: 算了吧……] 她叹了口气，显然很沮丧。她一只手叉在腰上，轻轻拍了拍你的[leg]，然后离开了你的视线，片刻后便消失在门外。[pg]");
            outputText("好吧，至少你还有点常识，在伤到自己之前停了下来……[pg]");
            doNext(get_camp().returnToCampUseOneHour);
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,208,0);
            return;
         }
         if(get_player().isGenderless() || get_player().get_femininity() < 40 && !get_player().isPureEnough(75) && get_player().face.type == 3)
         {
            outputText("当你走到长椅旁时，伊弗里斯注视了你一会儿，但她的目光显然时不时地游移到别处。她那张漂亮的脸上始终挂着愉快的微笑，但很明显，她因为某种原因分心了，甚至不感兴趣。很快她就转身离开，发出一声无聊的轻叹。她的臀部摇曳生姿，步伐性感，仿佛那是天生的，尽管此刻她身上似乎没有任何特别兴奋的地方……");
            if(get_player().get_str100() < 90)
            {
               dynStats(DynStat.Str(0.5));
            }
            if(get_player().get_tou100() < 40)
            {
               dynStats(DynStat.Tou(0.3));
            }
            outputText(get_player().modTone(85,5 + Utils.rand(5)));
            doNext(get_camp().returnToCampUseOneHour);
            return;
         }
         if(get_player().hasCock())
         {
            if(get_player().cockTotal() > 1 && Utils.rand(2) == 0 && get_player().cockThatFits(70) != -1 && get_player().cockThatFits2(70) != -1)
            {
               ifrisDP();
               return;
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,206) == 0)
            {
               outputText("紧紧抓住杠铃，你咬紧牙关，用力向上推！你的肌肉紧绷，你用力地咕哝着，随着重量缓慢而稳定地举起，这位红色美人的嘴唇里发出一声惊叹的喘息。当你的手肘锁定，重量完全举起时，你忍不住骄傲地咧嘴笑了，然后你把它放下来，准备再次推起。[pg]");
               outputText("伊弗里斯靠得更近了，她涂了油的皮肤闪闪发光，看着你紧绷的肌肉，弯下腰想看得更清楚。当你低头看时，你注意到她向前弯腰，重量暂时被遗忘了，因为那对甜美、完美的乳房几乎要从她的比基尼上衣里溢出来。她顺着你的目光慢慢地对你微笑，甚至挑逗地摇晃了一下，让那对肉球颤动起来。[pg]");
               outputText("[say:嗯，继续，亲爱的……我喜欢我看到的，]她几乎是发出咕噜声说道。[pg]");
               outputText("在自尊心的驱使下，你毫不费力地举起了巨大的重量。随着你的肌肉燃烧和紧绷，这个恶魔女孩似乎靠得更近了。突然，你感觉到她的一只纤手滑上了你的[leg]，光滑的手掌抚摸着你的大腿，然后握住了你的胯部。一阵性奋的涟漪穿过你的阴茎，随着她的挤压，你的肉棒抽动着，并立即开始膨胀，让你停下了动作。[pg]");
               outputText("[say: 嗯，现在别停，] 她用沙哑的声音挑逗着，同时抓住你下装的腰带，猛地把它们拉下来，当场露出了你的阴茎。那些柔软灵活的手指环绕着肉棒的根部，在她看着它完全变硬时，轻柔地、有节奏地挤压着。她的眼睛一直盯着你的阴茎，一条深色、几乎是黑色的舌头舔了舔她的嘴唇，然后缓慢、几乎是慵懒地在肉棒上抚摸了一下。[pg]");
               outputText("在她的服侍下，你发出呻吟——她握住你阴茎的方式如此挑逗，却又如此有效。没过多久，你就被她短暂的抚摸和挤压弄得分心，几乎滑倒，于是决定休息一下，让杠铃稳住。伊弗里斯发出一声可爱的咯咯笑，当她弯下腰时，她终于紧紧握住了你那汗津津、跳动着的阴茎，让她那深色、丰满的嘴唇在龟头上印下一个性感的吻。你的身体感到如此酸痛和疲惫，但对你肿胀龟头的吻就像一道闪电穿过你的身体，你发出一声轻微的呻吟。[pg]");
               outputText("她对自己迄今为止对你产生的影响感到满意，她的目光转移到你的脸上，同时她可爱的嘴唇微张，她呼吸的热度比正常人类高出好几度。它以沉重、湿润的气息拂过你的阴茎。她用湿润的舌头在你的肉棒顶端挑逗地舔了一下，然后把它含进嘴里，轻轻地吸吮。恶魔的嘴是如此湿润，如此令人愉悦地火热，当她用力吸吮那跳动的顶端时，她的脸颊几乎瞬间凹陷下去。她慢慢地往下，厚实的嘴唇顺滑地滑下你的肉棒，她把越来越多的部分含进嘴里。当你顶到她的喉咙深处时，她甚至没有停顿，继续往下，当她的嘴唇在你能想象到的最亲密的吻中贴上你的胯部时，她看着你的表情，眼中闪烁着情欲的光芒。[pg]");
               outputText("突然，她似乎失去了挑逗的耐心，这让你非常高兴，当她向后拉时，对你阴茎那用力、长长的拉扯简直就像天堂一样，她的脸颊凹陷了进去。她快速地往下，一次又一次地用你的肉棒深喉自己，淫荡、湿润的吧唧声从她被塞满的喉咙里传出。没过多久，你就在狂喜中呻吟，希望自己有力量抓住她的头，让她慢下来，这样你就可以把它拔出来好好享受，但很快快感就涌上心头，你的[balls]收紧，甚至当她捧起");
               if(get_player().balls > 0)
               {
                  outputText("它们并轻轻挤压囊袋时。[pg]");
               }
               else if(get_player().hasVagina())
               {
                  outputText("你的下唇并轻轻挤压。[pg]");
               }
               else
               {
                  outputText("你的会阴并轻轻挤压。[pg]");
               }
               outputText("就在你快要承受不住时，这个漂亮的恶魔将脸埋在你的胯部，拼命地吞咽着你的肉棒。随着你的阴茎肿胀抽搐，你发出一声欢愉的喊叫，滚烫的精液喷射进她的肚子里。她耐心地等待着，嘴唇包覆着你的阴茎根部，看起来甚至像是在微笑，尽管她的眼睛在颤动，几乎要翻白眼了。终于，你射精的冲动平息下来，她慢慢地从你的肉棒上退开，在伴随着淫荡的“啵”声离开你的肉体之前，最后一次用力地、几乎有些痛苦地吸吮了你那过度敏感的龟头。她慢慢地舔了舔嘴唇，让你喘着粗气，感到头晕目眩。她站起身来，经过你身边时只是轻轻拍了拍你的肉棒，然后迈着轻快的步伐离开了，大腿上还留下一道闪闪发光的湿痕……");
            }
            else
            {
               outputText("当你告诉伊弗里斯你完全准备好打破那个记录时，她高兴得几乎尖叫起来，厚厚的嘴唇咧开一个大大的笑容，当你看到她那锋利的牙齿时，你短暂地担心了一下……但随后你提醒自己她用牙齿的技巧有多好。你躺回长椅上，抓住上方的杠铃。这个恶魔女孩这次甚至没有等待，直接拉下你的下装，露出你的[cock]。她坐在你的[legs]上，她那柔软舒适的翘臀紧贴着你，等待着你开始。[pg]");
               outputText("就在你第一次举起重量的那一刻，她弯下腰，用光滑的脸颊摩擦着你半勃起的阴茎");
               if(get_player().balls > 0)
               {
                  outputText("，她的手托住你的[balls]");
               }
               outputText("。她微笑着，仔细地看着你，舌头从唇间滑出，舔舐着阴茎的下侧，催促它迈向完全坚挺的最后一步。当她再次将你的" + get_player().cockHead() + "含入口中时，她发出渴望的呻吟，第一次用力吸吮你敏感的龟头就让你发出一声呻吟；看来她不想再挑逗了。[pg]");
               outputText("这个性感的小黑发恶魔将你的肉棒含入");
               if(get_player().hasSheath())
               {
                  outputText("包皮");
               }
               else
               {
                  outputText("根部");
               }
               outputText("她的喉咙深处，一直保持在那里，直到你将重量推起，随着你的动作在阴茎上滑动，然后随着你放下而退回，用她甜美嘴巴的快感鼓励你锻炼。不过，她知道你无法一直坚持下去，所以她只是催促你做得更好，然后就屈服了，她的手紧紧抓住你[cock]的根部，头开始有目的地在你粗大的肉棒上上下套弄。[pg]");
               outputText("随着你力气耗尽，嘴唇因不断的呻吟而干燥，你的[cock]如此美妙地跳动着，伊弗里斯感觉到你的高潮即将来临，在你的肉棒周围微笑着。这次她没有停下来，仍然在你的肉棒上套弄，舌头无情地在下侧起伏，迎接你高潮的到来。她熟练地吞下那些喷射出的精液，在每一次喷射之间退回，在嘴里接住一股精液并品尝它，然后将你推回她的喉咙深处吞下下一股，以一种色情的节奏交替进行，直到你精疲力尽。[pg]");
               outputText("伴随着那缓慢、几乎痛苦的用力吸吮，她从你[cock]的" + get_player().cockHead() + "上退开，深吸了一口气，咯咯笑着俯身吻你。她喃喃地说，[say:你每次都做得更好，亲爱的。希望我们能再见。]说完，她又离开了你，几乎是蹦蹦跳跳地走出门，那湿润的液体顺着她修长的红色大腿流下……");
            }
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,206,FlagDict_Impl_.arrayReadInt(_loc1_,206) + 1);
         }
         else if(get_player().hasVagina())
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,207) == 0)
            {
               outputText("紧紧抓住杠铃，你咬紧牙关，用力向上推！你的肌肉紧绷，你用力地咕哝着，随着重量缓慢而稳定地举起，这位红色美人的嘴唇里发出一声惊叹的喘息。当你的手肘锁定，重量完全举起时，你忍不住骄傲地咧嘴笑了，然后你把它放下来，准备再次推起。[pg]");
               outputText("伊弗里斯靠得更近了，她涂了油的皮肤闪闪发光，看着你紧绷的肌肉，弯下腰想看得更清楚。当你低头看时，你注意到她向前弯腰，重量暂时被遗忘了，因为那对甜美、完美的乳房几乎要从她的比基尼上衣里溢出来。她顺着你的目光慢慢地对你微笑，甚至挑逗地摇晃了一下，让那对肉球颤动起来。[pg]");
               outputText("[say:嗯，继续，亲爱的……我喜欢我看到的，]她几乎是发出咕噜声说道。[pg]");
               outputText("在自尊心的驱使下，这个巨大的重量似乎毫不费力。突然，这位美人的一只手伸了出来，抚摸着你结实的腹部，对你露出相当恶魔般的笑容。她的手指勾住你的下装，当她那柔软、深色的嘴唇贴上你的腹部，亲吻你的皮肤，甚至用她异常温暖的舌头舔舐它以品尝你的汗水时，你微微跳了一下。她的一只纤细的手滑入你的腰带下，手指挑逗地滑过你的阴唇，让你喉咙里发出一声轻柔的呻吟。她熟练地挑逗着你的阴唇，让你在举重时停下来，低头看着这位甜美的美人，而她也正抬头看着你。发现你的下体湿润而诱人，她弯曲手指，突然快速地将它们深深滑入你的体内，让你大叫出声，紧紧地夹住她的手指。[pg]");
               outputText("你让杠铃休息，几乎忘记了它们，你的手指埋入她柔软卷曲的头发中，嘴唇里发出欢愉和渴望的呻吟。她推开你的上衣，将你的乳头暴露在她探索的嘴巴下，急切地吸吮着其中一个，同时用手指尽可能深地操弄你的小穴。每次她的手在你体内弯曲，那些手指在你湿透的通道内又深又好地剪切时，你都能感觉到她的手掌一次又一次地摩擦着你的阴蒂。[pg]");
               outputText("随着感官上强烈的性爱变得更加急迫，你腹部的温暖感不断增长和蔓延。很快，这位黑发美人从你的乳头上退开，她的手指从你滴水的裂缝中滑出，刚好足够将你的下装完全褪下。她弯下腰，那双厚厚的、用来吸吮肉棒的嘴唇被用在了截然不同的地方，它们压在你的小穴上吸吮着，她火热的舌头深深滑入你的体内，鞭打着你敏感的内壁，让你大为欢愉。她的尾巴在身后摇摆得更快了，她像是在拼命一样吸吮着你的小穴……这比你当时所能要求的还要多。[pg]");
               outputText("你的背部弓起，");
               if(get_player().hasTailInsteadOfLegs())
               {
                  outputText("你的[if (isNaga) {强壮的}]尾巴来回弯曲，同时你的腹部紧缩");
               }
               else
               {
                  outputText("脚趾卷曲，同时你的腹部紧缩");
               }
               outputText("，随着高潮的降临，你的肌肉紧绷起来。伊弗里斯发出一声闷哼，声音传入你的小穴，你把她的头紧紧按向自己，骑在她漂亮的脸蛋上，迷失在狂喜的浪潮中。当你终于平静下来时，她伴随着一声可爱的喘息从你的小穴中抽离，接着咯咯笑了起来。透过迷离的双眼低头看去，你看到她可爱的脸庞上闪烁着你的淫液，她在你的大腿上轻轻吻了一下。她站起身，转身离开，留下你躺在那里喘息，她的步伐轻快，大腿内侧流下一道清澈的湿痕……");
            }
            else
            {
               outputText("当你告诉伊弗里斯你完全准备好打破那个记录时，她高兴得几乎尖叫起来，厚厚的嘴唇咧开一个大大的笑容，当你看到她那锋利的牙齿时，不禁有些担忧……但随后你提醒自己她用起牙齿来有多棒，你向后躺在长椅上，握住上方的杠铃杆。这个恶魔女孩这次甚至没有等待，她凑上来在你的脸颊上轻轻啄了一下，同时把你的[chest]从上衣里拉了出来。[pg]");
               outputText("还没等你开始，她就凑了过来，在你的[nipples]和");
               if(get_player().biggestTitSize() >= 1)
               {
                  outputText("乳房上落下密集的吻");
               }
               else
               {
                  outputText("胸膛上落下密集的吻");
               }
               outputText("落下轻柔的吻，用舌尖轻弹，挑逗着你的乳头直到它们变硬。当她向下滑动时，你急切地抬起你的" + get_player().legs() + "，她扯下你的下装，将你渐渐湿润的小穴暴露在她饥渴的目光下。她催促你分开[legs]，爬到你的双腿之间，身后的尾巴摇摆着，等待你开始。你顺从了她的意愿，比起锻炼带来的酸痛，你更渴望感受她嘴唇带来的快感，而她也没有让你失望。[pg]");
               outputText("随着你的第一次推举，那条长长的恶魔之舌沿着你的" + get_player().vaginaDescript() + "向上滑动，不是挑逗，而是坚定地在阴唇间舔舐，在品尝你的同时微微将它们分开。伴随着一声娇俏的呻吟，伊弗里斯在你举铁时一遍又一遍地舔舐你的小穴，享受着你的味道，但她知道你需要更多才能真正兴奋起来。两根手指撑开你的[vagina]，她的嘴唇含住你的[clit]，小心翼翼地吸吮着，舌头在上面打转。她的手指快速而有力地在你体内抽插，这是你应得的愉悦奖赏……好吧，你不太明白为什么这会让她兴奋，你也不在乎。[pg]");
               outputText("那条舌头加入了她手指的行列，一起撑开你的小穴，让你在快感和惊讶中叫出声来，你把杠铃扔在一旁，身体用力地弓起。高潮席卷了你，强烈的快感让你的身体止不住地颤抖，她急切地舔舐和吸吮着你的喷发，她的动作变得轻柔、缓慢，延长了你的高潮，让你尽情享受。当你平静下来时，她慢慢站起身，在从你身上爬下来之前，再次给了你一个淫荡而狡黠的笑容。[pg]");
               outputText("[say: 总是这么愉快，亲爱的。我等不及想快点再见到你了……] 她再次离开了你，屁股扭动得比平时更厉害，淫液顺着她修长纤细的双腿流下……");
            }
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,207,FlagDict_Impl_.arrayReadInt(_loc1_,207) + 1);
         }
         if(get_player().get_str100() < 90)
         {
            dynStats(DynStat.Str(0.5));
         }
         if(get_player().get_tou100() < 40)
         {
            dynStats(DynStat.Tou(0.3));
         }
         get_player().orgasm("Generic");
         outputText(get_player().modTone(85,5 + Utils.rand(5)));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function liftWhileIfrisWatches() : void
      {
         var _loc2_:* = null as Player;
         spriteSelect(SpriteDb.get_s_ifris());
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,208,FlagDict_Impl_.arrayReadInt(_loc1_,208) + 1);
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,167) == 0)
         {
            outputText("在门口工作的半人马娘走过来收费，你在她手里放了10颗宝石，作为一小时锻炼的费用。[pg]");
            _loc2_ = get_player();
            _loc2_.set_gems(_loc2_.get_gems() - 10);
            statScreenRefresh();
         }
         outputText("你把器械调到一个你知道不会太重的重量，然后躺在卧推床上。你感觉到她的目光落在你的身躯上，当你握住把手向上推时，她毫不掩饰的欣赏让你脊背微微发凉。没过多久，你就出了一身痛快的汗，肌肉也在燃烧，但她那充满赞赏的注视让你始终无法摆脱那种分心的感觉。[pg]");
         outputText("当你完成几组动作后，她对你笑得更灿烂了，伸出手，用一根指尖在你的下颌线上挑逗地划过。[pg]");
         outputText("[say: 嗯……真迷人。也许下次我能看到更多。]她微微咧嘴一笑，短暂地向你露出尖牙，然后转身溜出了健身房，她那俏丽的小屁股摇曳生姿，简直有些过分了。你忍不住盯着她看，直到她消失不见，你摇了摇头，试图清醒一下，继续做你自己的事……");
         if(get_player().get_str100() < 90)
         {
            dynStats(DynStat.Str(0.5));
         }
         if(get_player().get_tou100() < 40)
         {
            dynStats(DynStat.Tou(0.3));
         }
         dynStats(DynStat.Lust(5));
         outputText(get_player().modTone(85,5 + Utils.rand(5)));
         get_player().changeFatigue(30);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function ifrisThot() : void
      {
         clearOutput();
         outputText("你把杠铃和那个女人放回等待位置，然后从长椅上站起来。你感谢了这个恶魔的赞赏，转身准备离开" + (get_player().hasCock() ? "。伊弗里斯爬过来拦住你。[say: 等等！你不想……再来点吗？]" : "，当你走开时，你能感觉到她的目光在你的身体上流连。[say: 随时欢迎，亲爱的……我喜欢看你的表现。]"));
         outputText("[pg]你只想回家，但这确实是一次不错的锻炼。走出健身房时，你似乎听到她气呼呼地坐下时发出了一声呜咽。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function ifrisShowerSex() : void
      {
         clearOutput();
         outputText("你把杠铃推到架子上，告诉伊弗里斯，是的，你的身体确实值得好好欣赏。从长椅上站起来，你伸出一只手，邀请她加入你进行<i>真正的</i>锻炼。");
         outputText("[pg]恶魔从杠铃上跳下来，握住你的手。[say: 带路吧。]");
         outputText("[pg]你把伊弗里斯带进淋浴室，把她拉进一个隔间。在你的命令下，仿佛这还需要命令似的，她脱掉了比基尼" + (get_player().isNaked() ? "" : "，同时你也脱掉了自己的衣服") + "。衣服被扔到一边，她扑到你的[chest]上，一只手顺着你的身体侧面抚摸。[say: 你的肌肉里蕴藏着如此惊人的力量，] 她诱惑地说。你把双手放在她紧实的臀部上，解释说你还有更多能让她震惊的东西。");
         outputText("[pg]你的[cock]滑入她的大腿之间，在摩擦她紧实红润的肌肤时，引得她扭动起来。伊弗里斯向你发出咕噜声，催促道，[say: 那就别再挑逗了，直接拿走你想要的吧！]");
         outputText("[pg]你把她按在隔间的墙上，挺起腰身，将你的肉棒狠狠地插进她的体内。" + (get_player().longestCockLength() < 5 ? "[say: 我猜，在几百" + (get_metric() ? "公斤" : "磅") + "的推力下，就算是图钉也能造成点伤害，]她咧嘴笑着调侃道" : "她闷哼一声，脚趾蜷缩起来，承受着你粗暴的侵入") + "。她那充满诱惑的眼神乞求着更多，你很快就用另一次冲刺满足了她。伊弗里斯双臂环抱着你，感受着你动作时肌肉的每一寸起伏。[say: 我想要你最用力的——]她低语着，但话还没说完就被一个吻打断了。你会给她想要的。");
         outputText("[pg]随着你抽插的速度越来越快，你们交欢时发出的湿润拍打声引起了淋浴间里其他人的注意。大多数人选择无视；然而，也有几个顾客偷瞄着这边的动静。伊弗里斯翻着白眼，她的呻吟声表明她根本不打算躲避观众。你紧紧抓住她的身体，感受着她紧致身躯的坚实触感，毫不掩饰自己正在征服这样一个拥有完美身材的女人。在有节奏的抽插中，你感觉到高潮正在酝酿。");
         outputText("[pg]由于她逐渐往下滑，你重新调整姿势，将伊弗里斯推得更高，紧贴着墙壁，在找到舒服的位置时，将你的[cock]直直地顶进她的深处。她的内壁扭动着、颤抖着回应你，她自己已经迎来了高潮。这个红皮肤的恶魔尖叫着宣泄她的狂喜，随着你操得越来越狠，她的叫声变成了呻吟和娇喘。很快，你的下半身紧绷起来，将精液一发接一发地射进她的体内，溅在她的子宫颈上。" + (get_watersportsEnabled() ? "在过度刺激下，她的肌肉开始失控，尿在了你身上，温热的液体喷洒在你的肉棒根部，顺着你的[legs]流进下方的排水沟" : "她颤抖着，被一个强壮[man]的种子填满，陷入了极乐之中") + "。你喘了口气，把这个大脑已经一片空白的运动员放了下来。她的眼神涣散，半梦半醒地抬头看着你。");
         outputText("[pg]你在淋浴间里冲了个放松的澡，从刚才的剧烈运动中缓过神来。水流打在伊弗里斯身上，几乎无法让她从高潮的恍惚中清醒过来。当你觉得冲洗干净后，你走出隔间，收拾好东西，离开了健身房。");
         get_player().orgasm("Dick");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function ifrisIntro() : Boolean
      {
         if(get_game().time.hours >= 15)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,205) > 0)
            {
               outputText("[pg]伊弗里斯站在房间的角落里，穿着她平时那件黑色的比基尼，你一走进去她就盯着你看。");
            }
            else
            {
               outputText("[pg]房间的角落里站着一个孤零零的身影，她鲜艳的樱桃红皮肤让她显得格外引人注目。一条长长的、带有铲状末端的尾巴在她身后缓慢地摆动着，其粗细程度超过了你见过的绝大多数恶魔尾巴。她身高不超过五英尺，苗条轻盈的身材看起来更具运动感而非肌肉感。一件黑色的比基尼勉强遮住了关键部位，她那柔软的C罩杯乳房挺拔得有些不可思议。她慢慢地用食指卷起一缕富有弹性的卷发，闪烁着红光的目光难以置信地盯着附近的一台举重机。感觉到你的目光落在她闪闪发光、涂满油脂的皮肤上，她慢慢地把目光转向了你。");
            }
            return true;
         }
         return false;
      }
      
      public function ifrisDP() : void
      {
         outputText("你将机器设定到一个你确信能应付的惊人重量，然后开始锻炼。你的肌肉在反复举起和放下重物时起伏紧绷，以此来取悦那个看起来像恶魔的女人。感受到伊弗里斯那发光的深红色面容正贪婪地注视着你的锻炼，你更加卖力，身上渗出一层汗水滴落下来。你的手臂还没开始酸痛，但在你胸腔深处，心脏跳动得越来越快，这也许是因为那个涂满精油的健身狂的注视，也许是因为持续的沉重举重——也许两者皆有。[pg]");
         outputText("第一组动作完成后，你放下杠铃，直到发达的肌肉不再承受重量。这位恶魔美女俯下身，趴在你的[chest]上，贪婪地注视着你身上每一处被汗水浸湿的地方。她的乳房危险地晃动着，那闪烁着光泽的深色嘴唇微微张开，向你飞吻。接着，那如黑玛瑙般柔软的双唇轻启，发出满足的咕噜声：[say:嗯……干得漂亮，亲爱的。]她俯得更低了，任由她那滑腻的乳房在你的" + Utils.cnName(get_player().get_armorName()) + "的胯部摩擦，同时问道：[say:你觉得……你还能举起更重的吗？重到足以应付这个世界可能抛给你的任何东西？]伊弗里斯的手指在你的[armor]上游走，随着她吐出的每一个音节，慢慢解开你的装备。[pg]");
         outputText("在这个红肤小可爱的催促下，你把机器的重量调高了一点，专心举重，相信她会兑现她的挑逗。你弯曲肌肉，用力将更重的重量举得越来越高，直到完全举起。就在你达到那光荣顶点的瞬间，你的遮蔽物滑落，将你的[cocks]暴露在健身房充满荷尔蒙气息的空气中。当你把沉重的杠铃举在半空中时，它们跳动着，慢慢充血。你渐渐把机器放下来，当伊弗里斯将你两根半勃起的肉棒握在手中时，你长舒了一口气，发出一声呻吟，感受着肉棒在她火热、涂满精油的手指间逐渐胀大。[pg]");
         outputText("[say:嗯……别停，亲爱的。你可真是……一手难以掌握呢。继续举，下面的一切交给我，]你的同伴用性感的嗓音承诺道。你心领神会地点点头，回到你被赋予的任务上——用一场表演来换取性愉悦。你的[cocks]充血胀大，让这个痴迷肌肉的恶魔欣喜若狂，当它们完全勃起时，她发出了惊喜的娇呼。她缓慢地抚摸着它们，让紧绷的肉棒在她涂满精油的抓握中滑动了几次，以确保你完全准备好了，每当你开始在分配的锻炼中犹豫时，她就会立刻停下来。[pg]");
         outputText("在五次大力的推举之后，那双手消失了，但只是一小会儿，她那轻盈、健美的身体就爬到了你的身上，涂满精油的大腿顺着你汗水覆盖的身体滑向你的腹股沟。伊弗里斯娇呼道：[say:嗯……继续，亲爱的。健身本身就是一种回报……][pg]");
         outputText("她湿润的泳衣贴在你的[onecock]上，带来一阵愉悦的触感，你倒吸一口凉气，开始用力推举，更加卖力地锻炼，随着疲劳感的袭来，你发出了低沉的喘息。就在下一次推举之前，伊弗里斯挤压着你的两根[cocks]，让它们笔直向上。你困惑地停顿了一下，直到你感觉到湿润的嘴唇含住了一根，紧致、涂满油脂的肌肤挤压着另一根。就像被闪电击中一样，能量充满了你的身体，你强迫自己继续下去。随着杠铃升起，伊弗里斯的小穴和后庭降下，将那两根幸运的肉棒挤压在她火热、紧致的体内。保持着那个姿势，你努力控制着肌肉，适应这极致的快感。杠铃缓慢下降，但伊弗里斯的穴口也随之升起，刚好离开你敏感、饥渴的肉棒。[pg]");
         outputText("这个恶魔般的女人的折磨人的穴口让你保持着勃起，在快感的浪潮中挣扎，这样你才能继续举重，作为回报，你会获得更多的快感。你的手臂开始感到酸痛，举起如此巨大的重量变得越来越困难。伊弗里斯似乎对你的进展很满意，她低声说着鼓励的话。[say: 好……强壮……嗯哼，继续。你能做到的。]她的小穴挤压并蠕动着包裹住主肉棒，而她的括约肌则紧紧夹住另一根，按摩着你以弥补速度的减慢。汗珠滴落在你身上，与你疲惫的汗水混合在一起，落到地板上，你们俩都被运动和性爱的气味浸透了。[pg]");
         outputText("伊弗里斯俯下身，双臂环绕着你的肩膀，把头靠在你的后颈上，她深色的舌头舔舐着你[skin]上的盐分。你全身都在颤抖，在屈服于这位深红美人的身体的欲望和支撑机器巨大负荷的需要之间挣扎。你的手臂滚烫而颤抖，感觉就像融化成虚弱、燃烧的橡胶。伊弗里斯感觉到了这一点，她说道，[say: 放下它，释放……为我释放，亲爱的。][pg]");
         outputText("你把机器的杠铃放回原位，让你疲惫的四肢在伊弗里斯的身体上放松下来，你的手停留在她紧致、有弹性的臀部上。那两个湿滑的穴口开始了一波全新的收缩，没有了重物的干扰，你无法抗拒。");
         if(get_player().countKnottedCocks() >= 2)
         {
            outputText("你的两根" + (get_player().dogCocks() >= 2 ? "犬科" : "") + "肉棒都因精液而膨胀，肉结膨胀并拉伸得如此之宽，以至于伊弗里斯即使想拔出来也做不到。片刻之后，这对" + (get_player().dogCocks() >= 2 ? "狗" : "") + "肉棒喷射出雪白奶油的柱子，将这个被真正锁结的女人的内脏染成了白色。");
            if(get_player().cumQ() >= 1000)
            {
               outputText("当她被填满时，她呻吟着，身体膨胀起来，以应对你的阴茎喷出的那不可思议的精液量。");
            }
            outputText("在整个大规模的释放过程中，你轻声地咕哝着，被你" + (get_player().dogCocks() >= 2 ? "野兽般的" : "") + "身体本能固定住，你的阴茎拼命地想要让你那过于健美的伴侣怀孕。你还在射精，但你的肉结终于开始缩小了。");
         }
         else if(get_player().countCocksOfType(CockTypesEnum.DEMON) >= 2)
         {
            outputText("你的两根恶魔阴茎在伊弗里斯体内爆发，每根阴茎上的结节都肿胀起来，变粗，抚摸和爱抚着你那油滑的爱人的内壁。片刻之后，那被污染的龟头爆发出来，将恶魔的精液喷射进两条丝滑的通道中。");
            if(get_player().cumQ() >= 1000)
            {
               outputText("当她被填满时，她呻吟着，身体膨胀起来，以应对你的阴茎喷出的那不可思议的精液量。");
            }
            outputText("与此同时，你的双手用力挤压她的臀部，你的臀部开始像风钻一样撞击她，猛烈地撞击她，仿佛她只是一块毫无价值的肉，供你播种。你颤抖着，感觉自己无法完全控制自己，你那被污染的阴茎的恶魔影响剥夺了你的控制力。");
         }
         else if(get_player().countCocksOfType(CockTypesEnum.HORSE) >= 2)
         {
            outputText("你的两根马阴茎在伊弗里斯体内爆发，它们的龟头向外肿胀成粗大的冠状沟，堵住了她被塞满的通道。片刻之后，肿胀的龟头释放出雪白的精液柱，将冠状沟上方的一切都染成了白色。");
            if(get_player().cumQ() >= 1000)
            {
               outputText("当她被填满时，她呻吟着，身体膨胀起来，以应对你的阴茎喷出的那不可思议的精液量。");
            }
            outputText("你的臀部开始摇摆和抽插，无论你试图做什么，你似乎都无法让你的身体平静下来，你的动物本能控制了你的腰部，让你在你那诱人、爱戏弄人的爱人体内播种。");
         }
         else if(get_player().countCocksOfType(CockTypesEnum.TENTACLE) >= 2)
         {
            outputText("你的两根植物般的阴茎在伊弗里斯体内爆发，紫色的龟头在她体内肿胀到不成比例的大小。片刻之后，藤蔓阴茎爆发出两根绳状的精液柱，用精液涂满了她的内壁。");
            if(get_player().cumQ() >= 1000)
            {
               outputText("当她被填满时，她呻吟着，身体膨胀起来，以应对你的阴茎喷出的那不可思议的精液量。");
            }
            outputText("与此同时，两根触手阴茎卷曲并像活塞一样运动，在你们身体之间的空间里互相缠绕，卷曲并抽插，用你敏感、能抓握的阴茎的每一寸摩擦伊弗里斯的小穴内壁。你颤抖着，感觉自己更像一只触手怪，而不是一个[manboy]。");
         }
         else if(get_player().countCocksOfType(CockTypesEnum.ANEMONE) >= 2)
         {
            outputText("你的两根不寻常的水生阴茎在伊弗里斯体内爆发，它们的阴茎干变粗，准备释放。片刻之后，它们爆发出两根雪白的精液柱，用粘稠的精液涂满了她的内壁。");
            if(get_player().cumQ() >= 1000)
            {
               outputText("当她被填满时，她呻吟着，身体膨胀起来，以应对你的阴茎喷出的那不可思议的精液量。");
            }
            outputText("与此同时，你那刺人的纤毛变得疯狂，在她的体内外刺痛她，无法控制地将催情剂强行注入你伴侣那颤抖、高潮的身体。这些药物迫使她攀升到全新的快感高度，让她发出毫无悔意的快感尖叫。你痉挛着，以这种方式使用你奇怪的阴茎，让你更加猛烈地高潮。");
         }
         else
         {
            outputText("你的两根阴茎在伊弗里斯体内爆发，向她提交了雪白的精液柱，以回应她对你释放的请求。这位红色的性感尤物发出一声快乐的哼声，前后摇摆着臀部，她那油滑、润滑的洞穴挤压着你的阴茎，榨取每一滴美味的精液。");
            if(get_player().cockTotal() > 2)
            {
               outputText("那");
               if(get_player().cockTotal() == 1)
               {
                  outputText("剩下的一根未被束缚的阴茎将粘液涂在肌肉女人的下背部，但她似乎并不介意。");
               }
               else
               {
                  outputText("其他未被束缚的阴茎将粘液涂在肌肉女人的下背部，但她似乎并不介意。");
               }
               outputText("");
            }
         }
         outputText("她发出咕噜声，在你耳边[say:太棒了，]，并在你身上印下了一个湿润的吻，肯定会在你的脖子上留下一个暗黑色的唇印。[pg]");
         outputText("最后几次收缩穿过你的身体，将你最后的精液排空在伊弗里斯体内，让你感到完全、彻底的平静。她向上滑动，让你慢慢缩小的阴茎");
         if(get_player().dogCocks() >= 2)
         {
            outputText("发出响亮的啵声，拔了出来");
         }
         else
         {
            outputText("滑出");
         }
         outputText("离开了她那沾满精液的小穴和后庭。她站起身，身体的温暖随之消失。她眨了眨眼，重新穿上比基尼泳裤，紧身的衣物紧紧贴合着她湿透的骆驼趾，将你留下的所有东西都兜在里面。她一言不发地走开了，");
         if(get_player().cumQ() >= 1000)
         {
            outputText("她的身体因为精液而肿胀，每走一步都能听到明显的晃荡声");
         }
         else if(get_player().cumQ() >= 500)
         {
            outputText("她的肚子胀鼓鼓的，每走一步都发出咕噜咕噜的声音");
         }
         else
         {
            outputText("她的身体里塞满了双倍的精液");
         }
         outputText("。你瘫倒在长椅上，大口喘着粗气，感觉就像刚跑完一场马拉松。[pg]");
         outputText("过了好一会儿，你才恢复了起身的力气。");
         get_player().changeFatigue(10);
         if(get_player().get_str100() < 90)
         {
            dynStats(DynStat.Str(0.75));
         }
         if(get_player().get_tou100() < 40)
         {
            dynStats(DynStat.Tou(0.5));
         }
         get_player().orgasm("Generic");
         outputText(get_player().modTone(85,5 + Utils.rand(5)));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function ifrisAllOut() : void
      {
         clearOutput();
         outputText("你向她解释说，这次她将面临" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,208) > 0 ? "远超以往的挑战" : "超出她预期的挑战") + "，并在你设置好所有重量时向她眨了眨眼。伊弗里斯向你挑了挑眉，虽然有些怀疑，但非常兴奋。你躺在长椅上，握住杠铃，深吸了几口气，准备开始表演。");
         outputText("[pg]你轻松地举起杠铃，平稳地将其从最高点降到脸部，然后再举起。尽管你[arms]上肌肉收缩清晰可见，但你展示了完美的控制力。虽然这确实让这个恶魔女孩印象深刻，但对她来说这并不新鲜，她期待地交叉双臂，想看看你还有什么花招。准备好提高难度后，你让她站到杠铃上去。");
         outputText("[pg][say: 你说什么？] 伊弗里斯惊讶地说。她确实很敏捷，所以在上面保持平稳应该没问题。你把杠铃降到靠近胸口的位置，邀请她上来。她犹豫了一下，但很快就趴在了杠铃上。");
         outputText("[pg]当你向上推杠铃时，伊弗里斯在保持姿势时微微颤抖，当你把她举到一臂高时，她很快就笑了起来。[say: 这<b>确实</b>令人印象深刻，虽然有点傻，] 她笑着说。虽然你不打算大声说出来，但她确实增加了相当大的重量，不过这仍然在你的承受范围之内。");
         outputText("[pg]她那健美的身体就在你上方，这景象非常诱人，当她低头看着你在她下方弯曲的身体时，很明显她觉得你同样诱人，甚至更诱人。[say: 像你这样经过精心锻炼的身体值得被<b>好好</b>欣赏，] 伊弗里斯告诉你，充分证实了你展示的效果。感觉到肌肉的酸痛，你得出结论，现在是休息的好时机。" + (get_player().hasCock() ? " 接受她的提议，让她好好欣赏一下？" : ""));
         if(get_player().hasCock())
         {
            menu();
            addNextButton("性爱",ifrisShowerSex).hint("好啊，操伊弗里斯。").disableIf(!get_player().hasCock(),"这个场景需要你有阴茎");
            addNextButton("不了",ifrisThot).hint("不了，去他妈的伊弗里斯。");
         }
         else
         {
            doNext(ifrisThot);
         }
      }
      
      public function askIfrisToJoinYou() : void
      {
         spriteSelect(SpriteDb.get_s_ifris());
         clearOutput();
         outputText("你问伊弗里斯是否愿意和你一起做些运动。她的眼睛里闪烁着调皮的光芒，显然从你的话里听出了弦外之音，你忍不住脸红了。[pg]");
         outputText("[say: 你真贴心，亲爱的……但我不想碍事。我等轮到我就行了。完全不用管我。][pg]");
         outputText("你对她的回答耸了耸肩，但她现在看你的眼神似乎有点不对劲……");
         menu();
         addButton(0,"锻炼",liftWhileIfrisWatches).hint("正常锻炼。");
         addButton(1,"炫耀",showOffForIfris).hint("向她展示你的力量。");
         if(get_player().get_str() > 90)
         {
            addNextButton("全力以赴",ifrisAllOut).hint("向伊弗里斯展示你的真正实力。");
         }
      }
      
      public function approachIfris() : void
      {
         spriteSelect(SpriteDb.get_s_ifris());
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,205) == 0)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,205,1);
            outputText("当你走过去时，她漂亮脸蛋上好奇、打量的目光变成了愉悦的微笑，她长着爪子的脚趾在地上轻轻敲击，走完最后几步来迎接你。当你张开嘴准备说话时，她抢先开口了，那涂着黑色唇膏的漂亮嘴唇微微张开，一个过于沙哑、圆滑、不怀好意的声音向你问好。[pg]");
            outputText("[say: 你好，亲爱的。我很高兴你决定加入我……你可以叫我伊弗里斯。]她可爱地歪着头，透过睫毛仰望着你。[pg]");
            outputText("你告诉了她你的名字，当她给你那个性感的微笑和挥之不去的凝视时，你的嘴突然觉得有点太干了。[pg]");
            outputText("[say: 很高兴认识你。你是来使用机器的，还是只是想看漂亮的身材流汗？]她可爱地咯咯笑着，两根长着爪子的手指端庄地捂住嘴。[pg]");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,206) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,207) == 0)
         {
            outputText("当你再次走过去时，伊弗里斯咧嘴笑了，这个恶魔女孩深色的舌头轻舔着她更深色的嘴唇，几乎是在向你献媚。[pg]");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,208) == 0)
            {
               outputText("[say: 你好，亲爱的……是来给我表演的吗？][pg]");
            }
            else
            {
               outputText("[say: 你好，亲爱的……是来再表演一次的吗？我非常喜欢你上次的表演。][pg]");
            }
         }
         else
         {
            outputText("当你再次走过去时，伊弗里斯咧嘴笑了，这个恶魔女孩深色的舌头轻舔着她更深色的嘴唇。当你想象她回忆起你的味道时，你不禁打了个寒颤……[pg]");
            outputText("[say: 你好，亲爱的……很高兴见到你。你这次是来给我表演的吗？还是你想尝试打破你上次的记录？][pg]");
            outputText("你有点困惑，问她说的记录是什么，结果只引来她一声短促可爱的笑声。[pg]");
            outputText("[say: 当然是你能举起那么多重量多久，直到我的注意力让你分心为止。][pg]");
         }
         outputText("（你可以继续锻炼，让她看着，邀请她加入你，或者离开。）");
         menu();
         if(get_player().fatigueLeft() >= 30)
         {
            addButton(0,"锻炼",workOutForIfris);
            addButton(1,"加入我？",askIfrisToJoinYou);
         }
         else
         {
            addButtonDisabled(0,"锻炼","你现在这么累，根本没法锻炼。也许你可以在下次锻炼时再来和这个看起来像恶魔的女孩调情。");
            addButtonDisabled(1,"加入我？","你现在这么累，根本没法锻炼。也许你可以在下次锻炼时再来和这个看起来像恶魔的女孩调情。");
         }
         addButton(14,"离开",get_telAdre().gym.gymDesc);
      }
   }
}

