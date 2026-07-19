package classes.scenes.areas.plains
{
   import classes.BaseContent;
   import classes.CoC;
   import classes.DynStat;
   import classes.ImageManager;
   import classes.Monster;
   import classes.Player;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.display.SpriteDb;
   import classes.globalFlags.KFLAGS;
   import classes.internals.GuiOutput;
   import classes.internals.Utils;
   import classes.items.Armor;
   import classes.items.ArmorLib;
   import classes.items.armors.LustyMaidensArmor;
   import classes.scenes.Camp;
   import classes.scenes.combat.Combat;
   import classes.scenes.monsters.pregnancies.PlayerSatyrPregnancy;
   import coc.view.CoCButton;
   import flash.Boot;
   import haxe.IMap;
   
   public class SatyrScene extends BaseContent
   {
      
      public function SatyrScene(param1:GuiOutput = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         new PlayerSatyrPregnancy(param1);
      }
      
      public function willinglyBoneSatyr() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_satyr());
         outputText("萨堤尔饥渴地上下打量着你；他的手移向你的[chest]，轻轻地捏着你的[nipples]，然后他向下移向你的");
         if(get_player().hasCock())
         {
            outputText("逐渐变硬的男性象征，撸动了几下让它完全勃起，然后他继续移向你的");
         }
         if(get_player().balls > 0)
         {
            outputText("[balls]，带着对它们产生的孕育生命的精华的敬畏，滚动着你的每一颗球；最后他转向你的");
         }
         if(get_player().hasVagina())
         {
            outputText("[vagina]，掰开你的阴唇，查看你迅速湿润的内壁。");
         }
         else
         {
            outputText("[ass]，掰开你的臀瓣，凝视着你那眨眼般的雏菊。");
         }
         outputText("[say: 太棒了！有了这样的[vagOrAss]，我相信你会成为我们孩子的好[father]的，]他说道，凑近闻了闻你的");
         if(get_player().hasVagina())
         {
            outputText("[vagina]，舔遍你的下体嘴唇，品尝你的汁液。");
         }
         else
         {
            outputText("[butt]，在你的洞口周围舔舐，为接下来的事情做准备。");
         }
         outputText("[pg]他咩咩叫着，大声喊道：[say:你快把我逼疯了！我真想现在就把你填满，让你怀上我的种……但我希望你能记住我，所以我们来点特别的吧。你觉得怎么样？]");
         outputText("[pg]你轻声呻吟着，告诉他这听起来棒极了。你心里暗想，在这片土地上，能找到一个愿意在做爱前询问你意见，而不是强迫你按他们的方式来的人，真是太罕见了。萨堤尔对你的同意报以微笑，他温柔地握住自己的肉棒，上下套弄，挤出一些先列腺液来润滑。没过多久，一想到马上就要狠狠地操你，他就兴奋不已，马眼像漏水的龙头一样滴着水。");
         outputText("[pg]他抓住你的臀部，将他巨大的肉棒对准你的[vagOrAss]；然后伴随着一声羊叫，他极其缓慢地推进。他先插进去几英寸，然后停下来，肉棒在里面跳动，用滑腻的先列腺液涂抹着你的[vagOrAss]内壁，接着拔出几英寸，再插得更深。这个过程一遍又一遍地重复，直到最后他整根没入你的体内。");
         if(get_player().hasVagina())
         {
            get_player().cuntChange(25,true,true,false);
            get_images().showImage("satyr-sex-vag");
         }
         else
         {
            get_player().buttChange(25,true,true,false);
            get_images().showImage("satyr-sex-butt");
         }
         outputText("[pg]当他巨大的阳具填满你时，你大叫出声，用[legs]缠住你的羊人情人，紧紧地贴着他，恳求他抱紧你，把你操得失去理智。萨堤尔开始颤抖，轻轻地顶弄着你，每一次小幅度的抽插，他的蛋蛋都会轻柔地拍打在你的[butt]上。然而，他克制住了让欲望支配自己的冲动，对你微笑着。[say:我说过我希望你能记住我……不管我现在有多想射在你里面，我都会按我说的做。]");
         outputText("[pg]他动作敏捷地把你翻转到他身上，瞬间和你交换了位置，让你坐在他那根轻轻跳动、勃起、巨大的旗杆上。伴随着一声很快变成羊叫的呻吟，他积聚力量，向上猛地顶入你的体内；撞击的力度足以让拍打声回荡，紧接着是第二声，他的蛋蛋像桨一样拍打着你的屁股。萨堤尔巨大的推力足以把你从他的柱子上顶起，一直到顶端，而你所要做的就是等待重力把你带回他那根刺穿你的肉棒上，伴随着同样响亮的拍打声。[say:放松点，让我来处理一切，]萨堤尔喘着粗气，为下一次抽插蓄力。");
         outputText("[pg]你抓挠着你的羊人情人，急切地将你的臀部撞向他的臀部，陶醉于被撑得如此饱满的美妙感觉，惊叹于肉体碰撞发出的啪啪声。你疯狂地胡言乱语，试图表达他让你感觉有多好，你有多渴望他。受到鼓舞的萨堤尔不仅开始用越来越快的顶弄把你送上云端，而且在你落下的途中用同样强有力的抽插迎接你。你在他身上扭动，在狂喜中疯狂地抓挠他的背，伸出手抓住他的一只角，把他的头拉上来，进行一个充满肉欲、舌头交缠的吻。");
         outputText("[pg]萨堤尔结束了亲吻，大声咩咩叫着，将臀部猛烈地撞向你，迫使他巨大的肉棒尽可能深地插进去，然后将他所有的精液射入你的");
         if(!get_player().hasVagina())
         {
            outputText("紧缩的屁股");
         }
         else
         {
            outputText("痉挛的小穴");
         }
         outputText("。这感觉就像有人把一根软管塞进你体内并打开了喷嘴，用源源不断的热精液填满你；你能感觉到它在你体内汇聚，用他巨大的射精量撑起你的肚子。");
         outputText("[pg]你大叫出声，当他滚烫的雄性气息用他强效的精液填满你时，你发出喜悦的嚎叫，然后随着高潮席卷你的身体而颤抖；你自己的");
         if(get_player().hasVagina())
         {
            outputText("小穴喷出淫液，顺着他巨大的阳具流下");
         }
         if(get_player().get_gender() == 3)
         {
            outputText("并且");
         }
         if(get_player().hasCock())
         {
            outputText("肉棒喷出白浊，溅在你们交缠的身体上");
         }
         outputText("。你轻声呻吟着，大口大口地喘着粗气，瘫倒在他身上，感到彻底的满足。");
         outputText("[pg]萨堤尔的射精量已经减少到涓涓细流，但他仍然试图把更多的精液泵入你的");
         if(!get_player().hasVagina())
         {
            outputText("肠道");
         }
         else
         {
            outputText("子宫");
         }
         outputText("；进行缓慢而短促的抽插，以确保你得到了你需要的所有精液。他气喘吁吁地躺在地上，对你咧嘴一笑。[say:那么告诉我……你喜欢吗？觉得这些精液够不够让你怀上一个小萨堤尔？如果不够，我可以再来一次。]他自信地笑着。");
         if(!get_player().hasVagina() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,603) == 0)
         {
            outputText("[pg]你茫然地盯着他，然后，当你的思绪恢复连贯时，你问他，你连子宫都没有，他怎么能让你怀孕。");
            outputText("[pg]他对着你不安的表情眨了眨眼。[saystart]萨堤尔的种子非常强效，我们可以让任何东西怀孕，甚至是");
            if(get_player().hasCock())
            {
               outputText("雄性");
            }
            else
            {
               outputText("无性人");
            }
            outputText("像你这样的，亲爱的。[sayend]");
            outputText("[pg]你盯着你的伴侣，然后难以置信地把手放在肚子上。你要有孩子了？甚至连雌性都不是？你打了个寒颤，不禁怀疑，既然如此，和这个萨堤尔做爱到底值不值得……");
         }
         if(get_player().cor < 66)
         {
            outputText("[pg]虽然这个邀请听起来很诱人，但你还是不得不拒绝。你觉得你已经得到了足够生一个孩子的量，而且你认为两个小萨堤尔可能有点超出你的承受能力。");
            outputText("[pg]你的情人只是笑了笑。[say: 随你便。]");
         }
         else
         {
            outputText("[pg]你摸着下巴想了想，决定你还需要更多的种子；你向后伸出手，狠狠地捏了一把他的蛋蛋，惹得萨堤尔发出一声痛苦的咩咩叫，他那过度劳累的阳具又喷出了几股微弱的精液。");
            outputText("[pg]他揉了揉肚子，抬头对着你笑。[say: 真过分……但我很乐意效劳。]");
         }
         outputText("[pg]你疲惫的肌肉发出一声轻柔的呻吟，你慢慢地从刺穿你的萨堤尔肉棒上拔出自己，让他刺鼻的精液从你被蹂躏的小穴里流出来，溅得他满身都是，然后在不远处瘫倒在地。");
         outputText("[pg]萨堤尔用不稳的蹄子站了起来，在和你做完之后明显有些虚弱。[say: 好了，抱歉不能多待了。但我还有地方要去，还有人要操，所以我想我们以后还会再见的。]羊人友好地拍了拍你的[butt]，开始收拾他能找到的任何剩下的东西；然后转身给你飞吻，飞奔而去。");
         outputText("[pg]你看着他离去，然后勉强挣扎着站起来，踉踉跄跄地走开，以免有什么更不友好的东西在这里发现你。");
         get_player().slimeFeed();
         get_player().orgasm("VaginalAnal");
         satyrPreggo();
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function trickZeSatyr() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_satyr());
         get_images().showImage("monster-satyr");
         outputText("你想出了一个计划，假装又开始喝酒；一旦你注意到萨堤尔分心了，你就迅速把大部分酒洒在地板上，然后把一个空酒袋还给他。");
         outputText("[pg]他惊讶地眨了眨眼。[say:这么快就喝完了？哎呀，看来有人很懂怎么享受美酒嘛！]他大笑着。你的同伴迅速抓起另一个酒袋递给你。[say:喝吧，喝吧！我都记不清上次痛快拼酒是什么时候了！]这个羊人欢快地咯咯笑着，已经打开了一瓶气味非常浓烈的啤酒。");
         outputText("[pg]你再次假装喝酒，结果把大部分酒都洒在了地板上；不过这次你小心翼翼地没有把酒袋倒得太快。");
         outputText("[pg]萨堤尔对你这么快就喝完感到惊讶，他迅速把整瓶酒一饮而尽，随着酒精上头，他明显摇晃起来。他接过空酒袋，给了你一个玻璃瓶，然后开始喝一个新的酒袋。");
         outputText("[pg]你重复这个过程，直到萨堤尔看起来完全醉倒了，更不用说他发情了……他巨大的肉棒直立着，在喝空另一瓶酒时滴下先列腺液。");
         outputText("[pg]萨堤尔又举起一个酒袋放到嘴边，结果却只是把酒洒了自己一身。他打了个嗝，左右摇晃，最后终于倒下了。[say:怎么会……以前拼酒从来没输过……]他含糊不清地说着，眼睛忽闪着闭上了，体内的酒精让他失去了知觉。");
         outputText("[pg]凡事都有第一次嘛……你扔掉最后一个酒袋，走过去查看打呼噜的萨堤尔；搜查他时，你设法找到了一个装满宝石的袋子。既然他试图欺骗你，你不如也拿点东西作为回报，于是你把袋子里的宝石装进口袋，然后把袋子扔掉。");
         var _loc1_:Player = get_player();
         _loc1_.set_gems(_loc1_.get_gems() + (10 + Utils.rand(10)));
         statScreenRefresh();
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function skipForeplay() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_satyr());
         outputText("你得意地笑了笑，向萨堤尔爬去，扔掉酒袋，撞翻了路上的几个盘子和瓶子。一旦你靠得足够近，你就粗暴地抓住他巨大的肉棒开始抚摸。[say:我们都知道这会发展成什么样……]你低语道，[say:所以为什么不跳过前戏呢？]");
         outputText("[pg]萨堤尔看起来很惊讶，然后咧嘴笑了。[say:很好，既然你坚持……]他发出咕噜声，伸出手抓住你，把你推倒在地，粗暴地撕扯你的[armor]，直到你一丝不挂。");
         doNext(willinglyBoneSatyr);
      }
      
      public function satyrPreggo() : void
      {
         if(get_player().hasVagina())
         {
            get_player().knockUp(19,160);
         }
         else
         {
            get_player().buttKnockUp(19,160,1,1);
         }
      }
      
      public function satyrEncounter(param1:int = 0) : void
      {
         var loc1:int;
         var _g1:SatyrScene;
         var loc:int;
         var _g:SatyrScene;
         clearOutput();
         spriteSelect(SpriteDb.get_s_satyr());
         if(Utils.rand(2) == 0 || get_player().get_pregnancyIncubation() > 0 || get_player().get_buttPregnancyIncubation() > 0 || get_player().get_gender() == 0)
         {
            get_images().showImage("monster-satyr");
            outputText("当你穿过");
            if(param1 == 0)
            {
               outputText("长满草的平原");
            }
            else
            {
               outputText("泥泞的沼泽");
            }
            outputText("时，你听到了下流的吼叫和醉醺醺的咒骂。从那片绿色的广阔区域中走出一个类人生物，头上长着一对卷曲的羊角。看到你，他发出一声发情的咩咩叫，然后冲了过来，赤裸的勃起在他身前晃动！");
            unlockCodexEntry(2053);
            startCombat(new Satyr());
         }
         else
         {
            outputText("你在");
            if(param1 == 0)
            {
               outputText("长满草的平原");
            }
            else
            {
               outputText("泥泞的沼泽");
            }
            outputText("中漫步时，听到不远处传来奇怪的音乐。你要去调查吗？");
            if(param1 == 0)
            {
               _g = this;
               loc = 0;
               doYesNo(function():void
               {
                  _g.consensualSatyrFuck(loc);
               },get_camp().returnToCampUseOneHour);
            }
            else
            {
               _g1 = this;
               loc1 = 0;
               doYesNo(function():void
               {
                  _g1.consensualSatyrFuck(loc1);
               },get_camp().returnToCampUseOneHour);
            }
         }
      }
      
      public function satyrBirth(param1:Boolean) : void
      {
         spriteSelect(SpriteDb.get_s_satyr());
         get_images().showImage("birth-satyr");
         outputText("[pg]突然，一阵剧烈而尖锐的阵痛撕裂了你的肠胃，似乎是从你的");
         if(param1 && !get_player().hasVagina())
         {
            outputText("新长出的阴道");
            get_player().createVagina();
         }
         else if(param1)
         {
            outputText("[vagina]");
         }
         else
         {
            outputText("[butt]");
         }
         outputText("传来的，那是一种紧抓着、扭动着的感觉，就好像有什么东西在你体内翻腾，想要出来。看来你体内的东西是时候出来了。");
         outputText("[pg]你脱下[armor]躺下，等待着即将到来的宫缩，果然它们来了。当你用力把新生儿挤出来时，你的身体被剧烈的疼痛折磨着；你的肌肉扭动收缩着，急于完成它们的任务，清空你那孕育着新生命的肿胀肚皮。");
         outputText("[pg]没过多久，你就看到一个小圆脑袋从你的");
         if(param1)
         {
            outputText("[vagina]");
         }
         else
         {
            outputText("[asshole]");
         }
         outputText("；上面还长着一对微小的角。当它的肩膀将你撑得更宽时，你痛苦地呻吟着，但最糟糕的部分已经过去，没过多久，你就生下了你的孩子。");
         if(param1)
         {
            get_player().cuntChange(40,true,false,true);
         }
         else
         {
            get_player().buttChange(40,true,false,true);
         }
         outputText("漫长的几分钟过去了，你的身体从疲惫中恢复过来，以一种不自然的活力从分娩的疲惫和痛苦中恢复过来，最后你终于准备好看看它了。");
         outputText("[pg]它看起来像一个可爱的小羊人；证明这一点的东西挂在他的双腿之间，比任何婴儿都大得多。他温顺地向你咩咩叫，然后开始自己生长！他的角延伸成卷曲、奢华的骨环，弯曲在他的头顶；随着肌肉的发育，他柔软的肉体变得更加坚韧，给了他一个很好的运动体格。最后，他的阴茎和睾丸长到了令人印象深刻的大小，不仅因为他自然的——或者说不自然的——生长，还因为它随着时间的推移而变硬；尽管才出生没多久，你新出生的儿子似乎已经有了性意识。片刻之后，他伸直了身子，你得以好好看看你刚出生、已经长大的萨堤尔。");
         outputText("[pg]他抚摸着自己的小胡子，给了你一个邪恶的笑容，向你挺动着臀部，溅了你几滴先列腺液，然后转身跳开了。精疲力竭");
         if(get_player().cor < 33)
         {
            outputText("而且感到有些恶心");
         }
         outputText("，你陷入了短暂而断断续续的睡眠中。");
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,603,FlagDict_Impl_.arrayReadInt(_loc2_,603) + 1);
         if(get_player().butt.rating < 10 && Utils.rand(2) == 0)
         {
            var _temp_1:* = get_player().butt;
            _temp_1.rating = _temp_1.rating + 1;
            outputText("[pg]你注意到在经历了这场磨难后，你的[ass]感觉更大了，也更丰满了。");
         }
         else if(get_player().hips.rating < 10)
         {
            var _temp_2:* = get_player().hips;
            _temp_2.rating = _temp_2.rating + 1;
            outputText("[pg]分娩后，你的[armor]在你的[hips]周围更紧贴了。");
         }
         outputText("[pg]");
      }
      
      public function malesTakeAdvantageOfSatyrs() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_satyr());
         var _loc1_:int = get_player().cockThatFits(get_monster().analCapacity());
         if(_loc1_ < 0)
         {
            _loc1_ = get_player().smallestCockIndex();
         }
         outputText("你打量着你的战利品，试图决定该如何利用他来获得一些性释放。为了看得更清楚，你大步走过去，把他推倒在地，粗暴地捧起他的脸。萨堤尔恐惧地抬头看着你，在你的抓握中挣扎，以便你更好地检查他；他绝对是个雄性；你无法忽视他脸颊上像山羊一样的纹路，也无法忽视他下巴上长出的小山羊胡，他呼吸时鼻孔扩张，当你把他的脸拉来拉去时，他发出微弱的咩咩声。最后，萨堤尔设法把脸从你手中挣脱出来，趴在地上，依然在揣测你的动作。");
         outputText("[pg]你决定不想操他的嘴，至少这次不想，于是你迅速把受惊的萨堤尔翻了个身，让他仰面朝天。他惊恐地再次咩咩叫起来，你一巴掌狠狠地拍在他的屁股上，让他安静下来。啊，没错，他的屁股……它颤动起伏的程度远远超过了任何雄性应有的程度。你摸索着它，更仔细地检查；它丰满圆润，有点柔软——你甚至可以说它像垫子一样。你掰开他的臀瓣，看到一个相当松弛的洞眼正对着你眨眼，尽管萨堤尔再次挣扎着想要逃离你的掌控；看来这个羊人对接受肛交并不陌生……");
         outputText("[pg]你的[cock]在你的胯下膨胀肿大，你赞许地点点头，满怀期待地舔了舔嘴唇。是的，这会很不错。你毫不迟疑地脱下裤子，让你那迅速勃起的肉棒暴露在空气中，你寻思着在插进去之前是不是该先润滑一下……你一露出自己，萨堤尔就爆发出新的活力开始挣扎，试图把你踢开，像一只被困的羊一样咩咩叫着哭泣。");
         outputText("[pg]你无视他的反抗，尽力粗暴地将他按倒在地，伸手去抓他那粗壮的肉棒……哈！不管他怎么挣扎，这怪物的肉棒已经渗出了先列腺液。你粗暴地在萨堤尔的肉棒上套弄，收集了一大把他的先列腺液，然后抹在自己的肉棒上作为临时润滑剂。虽然不是很有效，但你觉得也够用了。你又抓了第二把，然后是第三把，这次你把它们按摩进萨堤尔黑色的雏菊里——你的两根，然后是三根手指轻松滑入他的体内，这证实了在做这种事上他绝不是个处男。");
         outputText("[pg]你的手指滑入无助的萨堤尔体内的那一刻，他咩咩叫了起来，不是出于恐惧，而是出于愉悦。他拼命想逃离你的挣扎来了个一百八十度大转弯，取而代之的是，他努力让你的手更多地进入他那紧致的洞穴；他的肉棒跳动着，变得更加坚硬，将先列腺液喷洒在下方的地面上，他的蛋蛋翻腾晃动，渴望着你用自己的" + get_player().cockDescript(_loc1_) + "给他做前列腺按摩。你忍不住对萨堤尔态度的转变笑出声来；真是个荡妇。");
         get_images().showImage("satyr-sex-anally");
         outputText("[pg]好吧，你知道该怎么对付发情的屁股荡妇，不是吗？你对萨堤尔耳语了几句，他发出一声充满期待的轻柔咩咩声，然后你抓住他的角以获得额外的杠杆力，毫不迟疑地将你的肉棒尽可能深地插入他的体内。萨堤尔发出一声尖叫般的欢愉咩咩声，立刻开始用屁股迎合你，以一种你只能归因于野生动物的凶猛程度与你交媾。他的双手不再支撑上半身，而是立刻移向他那坚硬如石的勃起，开始套弄。");
         outputText("[pg]你对萨堤尔的热情感到惊讶，发出一声呻吟，但在这里你才是主导者，你觉得你应该向这个发情的羊人表明这一点。你拍打他的屁股，引得正在交媾的萨堤尔发出一声尖锐的咩咩声，但他似乎并没有停下来；他所做的只是以更大的活力将自己刺穿在你身上，把你当成假阳具来达到他渴望的释放。你几乎要被冒犯了，但事实是你并不在乎；他的屁股像个熟练的挤奶女工一样榨取着你，他温暖湿滑的内壁熟练地在你的肉棒周围起伏。你打他的屁股，清脆的响声在周围的草地上回荡，你嘲笑他是个可悲发情的小屁股荡妇。");
         outputText("[pg]每次你进入他被撑开的洞穴并摩擦他的前列腺时，他的肉棒都会喷出一股先列腺液，很快就开始在草皮上汇聚成洼；这个过程一遍又一遍地重复，直到萨堤尔伴随着一声尖叫般的咩咩声高潮了。他的蛋蛋鼓了起来，似乎在几秒钟内就膨胀了，然后翻腾着，他开始连续不断地喷射出难闻的羊精；没过多久，水坑就溢出了它的小盆地，并开始向外扩张，直到萨堤尔把脸蹭在自己制造的精液泥里。他的屁股超负荷运转，用起伏的肌肉吸吮着你，试图将你肥沃的种子吸入体内，涂满他的肠道。");
         outputText("[pg]你发出一声低沉的呻吟，然后将自己的高潮释放进他等待着的肠道里。");
         if(get_player().cumQ() < 250)
         {
            outputText("他试图榨取远超你能给他的东西，有那么一刻，你觉得他的肛门肌肉要把你的老二扯下来了，直到最后它们放松下来，让你滑了出来。");
         }
         else if(get_player().cumQ() < 1000)
         {
            outputText("你射出的量比平时多得多；萨堤尔紧缩的屁眼确保榨干你每一滴精液，直到最后它放松下来，让你滑了出来，给羊人留下了一个圆鼓鼓的肚子。");
         }
         else
         {
            outputText("你射出一股又一股的精液，速度远快于萨堤尔的屁股榨取你的速度，但他似乎仍然没有停止尝试。他起伏的肌肉将你的精液吸入他的肠道，形成巨大的气泡。当他的屁股终于放松时，你被自己倒流的种子的力量推出了一半；萨堤尔的屁股看起来像个废墟，他的肚子里溢满了精液，你很惊讶它没有从他嘴里吐出来。");
         }
         outputText("[pg]暂时满足后，你的目光转向萨堤尔。他没有发出任何声音；事实上，当你仔细看他时，你发现他已经睡着了，仍然漫不经心地前后摇晃着屁股，套弄着他那滴着精液的肉棒。你甚至没有给他一个轻蔑的眼神，就拉起裤子往回走。");
         get_player().orgasm("Dick");
         get_combat().cleanupAfterCombat();
      }
      
      public function loseToSatyr() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_satyr());
         if(get_player().get_lust() >= get_player().maxLust())
         {
            outputText("你气喘吁吁地开始疯狂自慰，发情的你根本不在乎面前这个咧嘴笑的萨堤尔在想什么。");
         }
         else
         {
            outputText("你试图稳住自己，痛苦地抱住身体，而那个萨堤尔则对你咧嘴笑着。");
         }
         outputText("[pg]这个长角的亚人没有浪费时间在调情或品味胜利上，而是得意洋洋地大步上前，一把将你推倒仰面朝天。他蹲下来，粗暴地扯下你的[armor]，直到你的胯部暴露出来。他不耐烦地");
         if(get_player().hasTailInsteadOfLegs())
         {
            outputText("按住你[if (isNaga) {蛇一般的|[if (isMer) {鱼一般的|修长的}]}]身体");
         }
         else if(get_player().isBiped())
         {
            outputText("分开你的[legs]");
         }
         else
         {
            outputText("将你按倒在地");
         }
         outputText("并向前探出手，摸索着寻找小穴。");
         if(get_player().hasVagina())
         {
            outputText("找到后，他色眯眯地咧嘴一笑，原本就勃起得惊人的肉棒更是完全挺立起来。");
         }
         else
         {
            outputText("发现你没有那个器官后，他不屑地咕哝了一声，粗暴地摸索起你的屁眼。在你的臀瓣之间找到目标后，他撸动了几下自己的肉棒，让它完全勃起。");
         }
         outputText("他抓住你的[ass]，粗暴地揉捏着你的臀肉，跪下来将你抬起，以便能刺入你的[vagOrAss]。");
         outputText("[pg]你只能在欲望与恐惧交织中，眼睁睁地看着他粗大的肉棒对准你的穴口。最后，伴随着一声闷哼，他向前挺身，毫不留情地用肉棒贯穿了你");
         if(get_player().hasVagina() && get_player().vaginalCapacity() < get_monster().cockArea(0) || !get_player().hasVagina() && get_player().analCapacity() < get_monster().cockArea(0))
         {
            outputText("，完全不在乎他的肉棒根本塞不进你的身体");
         }
         outputText("。");
         if(get_player().hasVagina())
         {
            get_player().cuntChange(get_monster().cockArea(0),true,true,false);
            get_images().showImage("satyr-sex-vag");
         }
         else
         {
            get_player().buttChange(get_monster().cockArea(0),true,true,false);
            get_images().showImage("satyr-sex-butt");
         }
         outputText("[pg]萨堤尔粗暴的插入让你在痛苦与快感中尖叫出声，你挣扎着，妄图逃离他那根硕大的肉棒。");
         outputText("[pg]这个兽人只是将抓着你[butt]的手移到了你的肩膀上，淫荡地咕哝着，开始在你饱受蹂躏的穴口粗暴地抽插；他根本不在乎你，只想把他那胀痛、饥渴的睾丸清空在你的肚子里。");
         outputText("[pg]你羞耻地呻吟着，感觉到自己变得");
         if(get_player().hasVagina())
         {
            outputText("湿润");
         }
         if(get_player().get_gender() == 3)
         {
            outputText("且");
         }
         if(get_player().hasCock())
         {
            outputText("坚挺");
         }
         if(get_player().get_gender() == 0)
         {
            outputText("发情的");
         }
         outputText("被他粗暴地操弄着。随着他野蛮的抽插，润滑液四处飞溅。他胯部每一次响亮的拍打都让你的身体感到一阵震颤和快感，你发现自己每次都会呻吟出声。性爱的气味变得如此强烈，甚至掩盖了你那像山羊一样的伴侣身上散发出的浓烈酒气。");
         outputText("[pg]萨堤尔的抽插速度加快了，因为他终于有了一个可以操的受害者而变得更加兴奋，他的抽插导致他肿胀的睾丸肉感地拍打着你的屁股，在强壮有力的手臂中摇晃着你。他喉咙里发出咕噜声和咳嗽声；他已经到了高潮的边缘……");
         outputText("[pg]你尖叫着，你的[vagOrAss]紧紧收缩，像老虎钳一样死死绞住萨堤尔的肉棒。");
         if(get_player().hasCock())
         {
            outputText("[EachCock]跳动着，将一串串精液直接射向萨堤尔的胸膛，将其染成白色。");
         }
         if(get_player().hasVagina())
         {
            outputText("真正的淫水洪流从你的阴道壁和萨堤尔巨大的肉棒之间的狭小空间中溢出，用你的女性体液覆盖了他的睾丸和腿。");
         }
         outputText("[pg]萨堤尔几乎没有注意到你的高潮，因为他自己的高潮终于到来了，当他射在你体内时，发出了一声令人惊讶的像羊叫一样的叫声，一股浓稠、滚烫的精液涌入你的身体，淹没了你的肠道，直到绝对的数量迫使它进入你的");
         if(get_player().hasVagina())
         {
            outputText("子宫");
         }
         else
         {
            outputText("胃");
         }
         outputText("；随着他将几升精液泵入你的体内，你的肚子开始肿胀凸起。");
         outputText("[pg]最后，当你看起来像一个怀孕中期的孕妇时，他发出了最后几声咕噜声并停了下来。他乱七八糟地从你体内拔出，伴随着清晰可闻的吧唧声，他那沾满精液的肉棒无力地悬挂着。这只野兽从腰带上抓起一个酒袋，大口喝了几口，然后打了个嗝，抓了抓胸口，然后无忧无虑地跑开了。");
         outputText("[pg]一旦你从粗暴的操弄中恢复过来，你");
         if(get_player().cor < 50)
         {
            outputText("羞愧地");
         }
         else
         {
            outputText("不知羞耻地");
         }
         outputText("收集并重新穿上你的衣服，然后回到营地，精液还在你走的时候从你身上滴落。");
         get_player().slimeFeed();
         satyrPreggo();
         get_player().orgasm("VaginalAnal");
         dynStats(DynStat.Sens(3));
         if(get_player().cor < 50)
         {
            dynStats(DynStat.Cor(1));
         }
         get_combat().cleanupAfterCombat();
      }
      
      public function leavePartySatyr() : void
      {
         var _loc1_:* = null as Satyr;
         clearOutput();
         spriteSelect(SpriteDb.get_s_satyr());
         outputText("你感谢了萨堤尔的慷慨，但你觉得自己应付不了这种烈酒，于是你起身开始返回营地。");
         if(Utils.rand(2) == 0)
         {
            outputText("[pg]你身后突然传来一声响亮、愤怒的羊叫，接着你听到有什么东西笨拙地猛冲过来。直到有什么东西猛地撞到你的背上，把你撞倒在地，你才意识到这一点。当你翻滚时，你发现萨堤尔站在你上方，脸因愤怒而扭曲。[say:在我完事之前，谁也别想离开我！]他咆哮着，再次向你发起攻击！[pg]");
            _loc1_ = new Satyr();
            startCombat(_loc1_);
            _loc1_.satyrCharge();
         }
         else
         {
            outputText("[pg]尽管已经过去了一会儿，你回头看去，发现萨堤尔还在继续喝酒，似乎并不介意你已经离开。看来你暂时安全了，你平安无事地回到了营地。");
            doNext(get_camp().returnToCampUseOneHour);
         }
      }
      
      public function keepDrinking() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_satyr());
         outputText("你对萨堤尔的鼓励咧嘴一笑，继续喝了起来，放慢了速度以免再洒出来；没过多久，你就把空酒袋递给他，要更多的酒。");
         outputText("[pg]萨堤尔一直很高兴地陪你一杯接一杯地喝，他高兴地接过空酒袋，递给你新的酒；这次是一个玻璃瓶。[say: 这东西有三十多年的历史了；相信我，没有比这更好的了。]事实上，他似乎决定要证明自己的话，拔开瓶塞，猛灌了一大口，然后才递给你。");
         outputText("[pg]你非常乐意接过他的酒瓶，看看这“东西”到底有多好。你猛灌了一口，尝到了萨堤尔的唾液和瓶子里美味的酒；它真的很美味！你懒得把瓶子还给他，直接把整瓶都喝光了。在你意识到之前，你的世界已经缩小到只剩下喝酒和吃提供的美味食物了。");
         outputText("[pg]萨堤尔就在你身边吃喝，劝你尽情享受。不过，他最终停止了进食，而是拿出了他的排箫，开始吹奏一首轻柔的曲子，几乎让你想起了一首摇篮曲。");
         outputText("[pg]你无法抗拒这轻柔的旋律，开始感到困倦；你停止了吃喝，打了个哈欠……现在你停下来了，你觉得非常热。你不假思索地脱下你的[armor]，甚至懒得遮掩身体。一旦你感觉到凉爽的空气吹在你的[skinfurscales]上，你叹了口气，躺下来放松地小憩。");
         outputText("[pg]萨堤尔继续吹奏着，微笑着。在失去意识之前，你看到的最后一件事是他那双奇怪的像山羊一样的眼睛里闪烁着渴望的光芒……");
         if(get_player().hasVagina())
         {
            get_player().cuntChange(25,true,true,false);
         }
         else
         {
            get_player().buttChange(25,true,true,false);
         }
         get_images().showImage("satyr-hangover");
         outputText("[pg]你不知道过了几个小时才醒来，因为之前喝了太多酒，头痛欲裂。回想起来……所有的瓶子和食物似乎都不见了。唯一剩下的就是你周围和你身上的一滩滩温暖的精液。你茫然地站起来，却感觉到你的[vagOrAss]里有一种奇怪的感觉；当疼痛从你的[vagOrAss]中爆发出来时，你弯下腰，喘着粗气，大量的精液从你被使用过的");
         if(get_player().hasVagina())
         {
            outputText("小穴");
         }
         else
         {
            outputText("屁股");
         }
         outputText("。这一定是那个萨堤尔干的好事！你在心里提醒自己下次要小心他。你尽可能地清理干净自己并重新穿好衣服，然后摇摇晃晃地向营地走去，一路上努力忍受着头部和其他地方的疼痛。");
         satyrPreggo();
         doNext(get_camp().returnToCampUseFourHours);
      }
      
      public function femaleTakesAdvantageOfSatyr() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_satyr());
         get_images().showImage("monster-satyr");
         outputText("你若有所思地打量着他那巨大的肉棒，然后打消了这个念头。他如此粗鲁地攻击你，凭什么还能享受你小穴带来的真正快感？不，如果有人能从中获得快感，那也只能是你自己。想到这里，你以最傲慢的姿态脱下你的[armor]，直到你一丝不挂地站在那里。");
         outputText("[pg]萨堤尔发出咩咩的叫声，眼睛因期待而睁大，目光直勾勾地盯着你的[vagina]；他开始喘着粗气，巨大的肉棒变得更加坚挺，渴望着得到他之前被剥夺的释放。");
         outputText("[pg]你漫步上前，将他推倒仰面朝天。他发出一声犹如挨打的山羊般的叫声，而你顺势将他按在地上，扭动臀部，直到你几乎坐在他的脸上，将你的[vagina]对准他的嘴。你把胯部压在他的脸上，命令他舔你，同时抓住他私处周围浓密的毛发拉扯着，暗示拒绝的下场。");
         outputText("[pg]萨堤尔发情得根本无力反抗或抗议，他迫不及待地将脸埋进你的下体，舔舐亲吻着你的阴唇，轻咬你的[clit]");
         if(get_player().hasCock())
         {
            outputText("，甚至还用舌头舔了一两下");
            if(get_player().balls > 0)
            {
               outputText("你的[sack]");
            }
            else
            {
               outputText("你的[cocks]根部");
            }
         }
         outputText("；尽管你之前暗示过不服从会有什么下场，但这只萨堤尔还是在你的手中挺动着，希望能用任何可能的方式释放出来。你皱起眉头，抓住他那已经沾满先列腺液而滑溜溜的肉棒，紧紧捏住以警告他保持安静，专心舔你，同时用大腿夹住他的头，试图将他固定在原位。");
         outputText("[pg]萨堤尔痛苦地咩咩叫着，但他并没有停下来，反而加快了挺动的速度；他那涂满先列腺液的阴茎轻易地滑过了你紧握的手，你越是捏紧他那因欲望而膨胀的肉棒，他挺动得就越快，完全不在乎你对他敏感的工具造成的痛苦。他对你[vagina]的注意力也从未动摇；他舔舐吮吸着你的小穴，渴望得到更多你甜美的汁液，像野生动物一样带着野蛮的渴望，将脸在你湿润的下体上摩擦。任何理智的痕迹早就从你身下这个又顶又吸的家伙身上抹去了；这只萨堤尔现在能做的，就是在你收紧对他命根子的握力时，在痛苦和快乐中咩咩叫，并吸吮你的汁液直到他被淹没。");
         outputText("[pg]当他的舌头以淫荡的方式吸吮舔舐着你最私密的地方时，你颤抖着扭动身体，一阵阵美妙的快感在你体内荡漾。为了“鼓励”他更卖力，你收紧了[legs]的夹力，开始抚摸他的肉棒，紧握着双手上下滑动，给这只萨堤尔巨大的雄性工具来了一次粗暴的手淫。");
         outputText("[pg]萨堤尔那被闷住的愉悦咩咩声是你得到的唯一警告，他那巨大的肉棒有力地跳动着，挣脱了你对它滑溜溜的长度的掌控。你可以看到它在变大，顶端小小的射精孔张开成一个“O”形，精液像喷泉一样喷射到你头顶几英尺高的地方。几团散发着难闻气味、滚烫的羊精液如雨点般落在你们俩身上，萨堤尔将几加仑积压的精液喷射到空气中，毫无疑问会引起周围任何路人的注意。");
         outputText("[pg]这场突如其来的精液雨是如此恶心，却又如此火辣，以至于你发现自己的高潮也紧随其后。伴随着挺动、喘息和呻吟，你将湿透的裂口径直贴在羊人的嘴上摩擦，在你射得他满脸都是的时候，把他的脸涂得一塌糊涂");
         if(get_player().hasCock())
         {
            outputText("，你自己的肉棒也喷吐出平时的精液，洒在他的肚子和周围");
         }
         outputText("。");
         outputText("[pg]几分钟后，那变态的山羊精液喷泉终于减弱成了涓涓细流；然而萨堤尔的肉棒依然坚硬如石，跳动着，在它那黏糊糊的柱身上喷出长长的残余精液。萨堤尔本人则瘫软下来；他似乎在爆发性的高潮中昏了过去。");
         outputText("[pg]你最后一次把小穴在他的脸上摩擦，然后，带着女王般的优雅，你从这个失去知觉、浑身沾满淫液的萨堤尔身上离开。捡起衣服，你重新穿戴整齐。一旦你衣冠楚楚，你便丢下这个昏迷的羊人，让他成为任何被这大量精液臭味吸引来的生物的猎物。");
         get_player().orgasm("Vaginal");
         get_combat().cleanupAfterCombat();
      }
      
      public function drinkAndSex() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_satyr());
         outputText("你对萨堤尔的鼓励报以微笑，继续喝酒，放慢了速度，这样你就不会再洒出来了。你告诉他你想和他做爱。");
         outputText("[pg]萨堤尔高兴地接过空酒袋并把它收起来。他点头同意，示意你慢慢脱下你的[armor]，展示你的");
         if(get_player().hasCock())
         {
            outputText("[cock]");
         }
         if(get_player().hasCock() && get_player().hasVagina())
         {
            outputText("，");
         }
         if(get_player().hasVagina())
         {
            outputText("[vagina]");
         }
         if(get_player().hasCock() || get_player().hasVagina())
         {
            outputText("并且");
         }
         outputText("[butt]展示给这个萨堤尔。他上下打量着你。你毫不迟疑地抚摸起他的肉棒，与此同时，他也抚摸着你的[butt]。");
         doNext(willinglyBoneSatyr);
      }
      
      public function defeatASatyr() : void
      {
         var _g:LustyMaidensArmor;
         clearOutput();
         spriteSelect(SpriteDb.get_s_satyr());
         if(get_monster().get_lust() >= get_monster().maxLust())
         {
            outputText("萨堤尔跪倒在他那像山羊一样的膝盖上，沮丧地咩咩叫着，疯狂地抓着他巨大的肉棒，为了发泄而对一切都视而不见。先列腺液已经从羊人的肉棒中喷涌而出，他抽动的动作将刺鼻的性液涂抹在冠状沟上。");
         }
         else
         {
            outputText("被打败并晕头转向的萨堤尔跪倒在他那像山羊一样的膝盖上，摇着头，徒劳地试图从你刚刚给他的残酷痛打中恢复过来。然而，打击和他之前的醉酒状态的结合意味着他完全无法站起来。");
         }
         menu();
         addButtonDisabled(0,"操他屁股","这个场景需要你有一个合适的肉棒和足够的欲望。","操他屁股");
         addButtonDisabled(1,"骑脸","这个场景需要你有一个阴道和足够的欲望。");
         if(get_player().get_lust() >= 33 && !get_player().isGenderless())
         {
            outputText("[pg]你想知道你是否应该对萨堤尔试图强奸你进行某种报复……你要利用这个无助的羊人吗？");
            if(get_player().hasCockThatFits(get_monster().analCapacity()))
            {
               addButton(0,"操他屁股",malesTakeAdvantageOfSatyrs);
            }
            if(get_player().hasVagina())
            {
               addButton(1,"骑脸",femaleTakesAdvantageOfSatyr);
               if(get_player().biggestTitSize() >= 4 && get_player().get_armor() == get_armors().LMARMOR)
               {
                  _g = get_player().get_armor();
                  addButton(2,"骑脸",function():void
                  {
                     _g.lustyMaidenPaizuri();
                  });
               }
            }
         }
         if(get_player().hasMultiTails())
         {
            addNextButton("强迫梳毛",get_game().forest.kitsuneScene.kitsuneGenericFluff).hint("让[themonster]给你梳理尾巴。").sexButton(-1);
         }
         setSexLeaveButton();
      }
      
      public function consensualSatyrFuck(param1:int = 0) : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_satyr());
         get_images().showImage("monster-satyr");
         outputText("你决定寻找音乐的来源。");
         outputText("[pg]坐在一个小圈的");
         if(param1 == 0)
         {
            outputText("被踩平的草地");
         }
         else
         {
            outputText("相对干燥坚实的地面");
         }
         outputText("上的是一个奇怪的身影，看起来像一个长着山羊腿和角的男人——一个萨堤尔。他周围散落着瓶子、酒囊和一盘盘食物。他正在吹奏排箫，停下音乐抓起一个酒囊，狼吞虎咽地喝下里面的东西，紫色的液体洒在他的胸前，散发出强烈的酒精气味。他解了渴，用一只毛茸茸的手臂的背部擦了擦嘴唇，满意地笑了。终于注意到你，他灿烂地笑了。[say: 欢迎！欢迎，朋友；请，过来！坐！和我一起喝！这些天我很少有好的同伴一起分享我的饭菜！]他充满欢呼地劝告你。");
         outputText("[pg]看到食物和饮料，你的肚子咕咕叫了起来，突然你觉得好像很久没吃东西了……你急切地接受了萨堤尔的邀请，坐在他对面。");
         outputText("[pg]萨堤尔欢欣鼓舞地笑着，毫不犹豫地为你提供周围的食物，递给你一整袋酒（或者同样含有酒精的东西），满得甚至都不会晃动。[say: 吃！喝！尽情欢乐！毕竟，不是每天都能找到一个只想享受生活中美好事物的人。]他笑着，然后夸张地悲伤地摇了摇头。[say: 真遗憾，现在每个人都这么不耐烦——都是匆匆忙忙，操操操，强奸强奸。没有人有时间聚会了，]他发出一声戏剧性的不赞同的叹息。");
         outputText("[pg]你几乎没听清他在说什么，只是拼命把食物往嘴里塞，然后抓起他递来的皮囊大口喝了起来。醇美的液体刚沾上舌尖，一股暖流便席卷全身，蔓延至四肢百骸（最后汇聚到了你的胯下）。");
         outputText("[pg]萨堤尔爽朗地笑了。[say: 很好！吃吧，喝个痛快；看到有人享受自己，我感到很自豪。]他轻轻叹了口气。[say: 曾经，我们萨堤尔举办过最喧闹的派对……但我想那些日子已经过去了。]他摇了摇头，笑了。[say: 话又说回来，这些时代也有它们好的一面。]");
         outputText("[pg]你几乎没有注意到他在说什么，饮料以如此大的力量击中你，你立刻停止喝酒并开始咳嗽，把一些酒洒在了地板上。");
         dynStats(DynStat.Lust(25),DynStat.NoScale);
         outputText("[pg]萨堤尔放声大笑，拿起自己的酒袋猛灌了一大口。[say: 看来你的酒量还需要多练练！]他咯咯笑着。[say: 继续，喝吧；熟能生巧。]");
         outputText("[pg]你突然意识到这个萨堤尔可能没安什么好心……从你体内蔓延开来的热流来看，你很确定他给你的饮料里加了某种催情剂。");
         if(get_player().get_inte() > 60 && get_player().get_lust() < get_player().maxLust())
         {
            outputText("[pg]也许你可以骗他自己喝下去，把他自己放倒？");
            addButton(0,"戏弄他",trickZeSatyr);
         }
         else
         {
            addButtonDisabled(0,"戏弄他","骗他把自己放倒需要一些聪明的手段和足够清醒的头脑。");
         }
         if(get_player().lib > 60)
         {
            outputText("[pg]不过，他的肉棒看起来很美味……没必要搞这些花招，你很确定自己知道怎么对付一根鸡巴；也许你应该跳过前戏，让他把你填满……");
            addButton(2,"跳过前戏",skipForeplay);
         }
         else
         {
            addButtonDisabled(2,"跳过前戏","你还不够饥渴，不能这么急躁。");
         }
         if(get_player().get_lust() >= 33)
         {
            outputText("[pg]如果你愿意，你可以再喝一杯，然后和他做爱。");
            addButton(3,"喝酒做爱",drinkAndSex);
         }
         else
         {
            addButtonDisabled(3,"喝酒做爱","你还不够饥渴，不能这么急躁。");
         }
         addButton(1,"继续喝",keepDrinking);
         addButton(14,"离开",leavePartySatyr);
      }
   }
}

