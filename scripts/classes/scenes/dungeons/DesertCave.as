package classes.scenes.dungeons
{
   import classes.BreastRow;
   import classes.CoC;
   import classes.Cock;
   import classes.CockTypesEnum;
   import classes.DynStat;
   import classes.DynStatOp;
   import classes.ImageManager;
   import classes.ItemType;
   import classes.Monster;
   import classes.Output;
   import classes.PerkLib;
   import classes.Player;
   import classes.StatusEffects;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.display.SpriteDb;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.items.Armor;
   import classes.items.ConsumableLib;
   import classes.items.armors.NaughtyNunsHabit;
   import classes.scenes.Camp;
   import classes.scenes.Inventory;
   import classes.scenes.PregnancyProgression;
   import classes.scenes.VaginalPregnancy;
   import classes.scenes.areas.desert.CumWitch;
   import classes.scenes.combat.Combat;
   import classes.scenes.dungeons._DungeonRoomConst.DungeonRoomConst_Impl_;
   import classes.scenes.dungeons.desertCave.SandMother;
   import classes.scenes.dungeons.desertCave.SandWitchMob;
   import coc.view.CoCButton;
   import coc.view.MainView;
   import flash.Boot;
   import haxe.IMap;
   import haxe.ds.IntMap;
   
   public class DesertCave extends DungeonAbstractContent implements VaginalPregnancy
   {
      
      public var riddlesChosen:Array;
      
      public var fuckedWitches:Boolean;
      
      public function DesertCave()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         riddlesChosen = [];
         fuckedWitches = false;
         super();
         PregnancyProgression.registerVaginalPregnancyScene(25,22,this);
      }
      
      public function yoYouBeatUpSomeSandWitchesYOUMONSTER() : void
      {
         clearOutput();
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,836,1);
         outputText("沙漠女巫们全都瘫倒在一大片乳汁与淫液混成的水洼里，");
         if(get_monster().get_HP() < 1)
         {
            outputText("照料着自己的伤口");
         }
         else
         {
            outputText("疯狂地彼此热吻，蜷作一团，在地上扭成一场蠕动的乱交");
         }
         outputText("。你独自站着，作为唯一的胜者，战胜了自己的敌人；现在，你可以轻松继续深入洞穴了。");
         menu();
         if(get_player().get_lust() >= 33)
         {
            outputText("[pg]不过话说回来，既然你已经证明自己凌驾于这些女巫之上，如果你愿意，也许该稍微发泄一下了。");
            if(get_player().hasCock())
            {
               addButton(0,"操一个",dicksHaveSexWithAWitch);
            }
            if(get_player().hasVagina())
            {
               addButton(1,"强迫舔舐",forceCunnilingusRimjobClitAndNipple);
            }
         }
         setSexLeaveButton();
      }
      
      public function yesDemandMilkRelease() : void
      {
         clearOutput();
         outputText("你告诉沙之母，每个人都应当拥有自由，就算她们神志不清，就算她们有用。她不能只因为觉得把人留在自己身边会过得更好，就这样<i>把人关起来</i>。");
         outputText("[pg]她叹了口气，悲伤地摇着头，转身走回王座厅。[say:你是个多愁善感的理想主义者，[name]。为了你那点微不足道的道德感，你宁可把那个女孩送去受折磨。如今这个世道，容不下这种感情用事。每一个没有变成恶魔的灵魂，哪怕是我用锁链留住的，都压在我的良心上。可我甘愿背负这份重量，[name]。也许有一天，等你准备好承担同样的责任时，你就会明白了。]");
         doNext(runFunc);
      }
      
      public function volunteerConfirmation() : void
      {
         clearOutput();
         outputText("你确定要自愿加入吗？你的冒险将就此结束，但你会帮助沙漠女巫扩充人数，并击败恶魔。");
         doYesNo(reallyVolunteer,runFunc);
      }
      
      public function vaginalBirth() : void
      {
         outputText("[pg]<b><u>惊人的变化发生了……</u></b>\n");
         if(int(get_player().vaginas.length) == 0)
         {
            outputText("你的胯下传来一股可怕的压力……随后是血肉撕裂般的强烈不适。你低头一看，发现那里出现了一个小穴。");
            get_player().createVagina();
         }
         outputText("一阵突如其来的剧痛从你鼓胀的腹部扩散开来，你痛得呻吟出声。你笨拙地撑起身子，摇摇晃晃地走出营地，随即在羊水破裂的声音中倒了下去，浸湿了身下荒原干燥的土地。你尽可能摆出一个舒服的姿势，咬紧牙关，开始用力……");
         outputText("[pg]你的整个世界都被身体的需求所吞没，只剩下一轮又一轮痛苦的用力与筋疲力尽的放松。时间仿佛不复存在，但最终，也必然地，你的身体将那个啼哭的入侵者推到了外面的世界。你瘫倒在地，大口大口地喘着气，身体里的疼痛逐渐退去，只剩下钝钝的跳痛。等你觉得自己动一动也不会散架时，你撑起身子，去查看你那哭喊着的健康后代。");
         outputText("[pg]一个健康又漂亮的女婴躺在尘土飞扬的地面上，身上还沾着子宫里的滑腻体液。她头上有一层沙金色的细绒毛，皮肤呈橄榄色。她胸前两组小小的乳头，以及下身的两个小穴，是她并非完全人类的唯一迹象。");
         outputText("[pg]一种突如其来的母性自豪感让你露出微笑，你抱起这个女婴巫女，把她贴到你的乳房上。她闹腾着扭动了一会儿，但很快就安静下来，依偎在你的[chest]上咕咕作声。乳汁开始从你的[nipples]渗出，就像铁被磁石吸引一样，你的宝宝的嘴唇也被那香甜浓稠的乳汁吸了过去。孩子吮奶时，一阵阵快感的火花在你的乳房中刺麻般掠过，你忍不住笑了起来。你温柔地抱着她，轻轻前后摇晃，任她从你身上响亮地吮吸着。");
         outputText("[pg]等她终于喝完时，你惊讶地发现她一点也没长大——除非把她正心满意足抚摸着的那个又大又圆的肚子也算进去，那是这个贪吃小姑娘喝下太多乳汁的结果。随着她的贪嘴开始带来不适，她扭动着闹腾起来，于是你把她搭在肩上，轻轻替她拍嗝，那声音回荡在荒原之上。等婴儿在你怀里安定下来、开始睡去，你小心地收集了一些碎布给她做成毯子，然后收拾好自己的东西，朝沙漠出发。");
         outputText("[pg]你很快找到了沙漠女巫们隐藏的洞穴，并把你的新女儿带到育婴室。那里的沙漠女巫们对亲自照看她这件事并不太高兴，坚持说你应该留在这里和她们一起亲手抚养她，但你也坚持自己不能留在这里，而且把女儿带在身边并不安全。最后，她们让步了，开始围着你的女儿忙前忙后，这也给了你悄悄溜出去、返回家中的机会。[pg]");
         get_player().changeFatigue(40);
      }
      
      public function updateVaginalPregnancy() : Boolean
      {
         var _loc1_:int = 0;
         if(get_player().get_pregnancyIncubation() == 336)
         {
            outputText("[pg]最近你的乳房感觉异常沉重，偶尔还会从里面传来奇怪的脉动感。你的胃口也有点不对劲；你真的很想喝点奶……\n");
            return true;
         }
         if(get_player().get_pregnancyIncubation() == 280)
         {
            outputText("[pg]你最近一直在做奇怪的梦，梦见种子在你眼前长成美丽的花朵；真正诡异的是，看着它们绽放时，你竟会感到一种骄傲和母性的满足。你的乳房肯定比平常更沉重了，有时醒来还会发现它们湿漉漉的；你是不是");
            if(get_player().biggestLactation() < 1)
            {
               outputText("开始泌乳了");
            }
            else
            {
               outputText("泌乳量变多了");
            }
            outputText("？你的肚子甚至也鼓起了一点，已经不是吃多了能解释的程度。[pg]");
            _loc1_ = get_player().bRows();
            while(_loc1_ > 0)
            {
               _loc1_--;
               if(get_player().breastRows[_loc1_].breastRating < 1)
               {
                  get_player().breastRows[_loc1_].breastRating = 1;
               }
            }
            while(get_player().biggestLactation() < 1.5)
            {
               get_player().boostLactation(0.5);
            }
            return true;
         }
         if(get_player().get_pregnancyIncubation() == 216)
         {
            outputText("[pg]你的乳房确实变大了，而且偶尔会滴出乳汁。更重要的是，你的肚子正鼓出一个不大却无可否认的小腹。你肯定是怀孕了。\n");
            _loc1_ = get_player().bRows();
            while(_loc1_ > 0)
            {
               _loc1_--;
               if(get_player().breastRows[_loc1_].breastRating < 20)
               {
                  var _temp_1:* = get_player().breastRows[_loc1_];
                  _temp_1.breastRating = _temp_1.breastRating + 1;
               }
               else
               {
                  var _temp_2:* = get_player().breastRows[_loc1_];
                  _temp_2.breastRating = _temp_2.breastRating + 0.5;
               }
            }
            while(get_player().biggestLactation() < 1.5)
            {
               get_player().boostLactation(0.5);
            }
            return true;
         }
         if(get_player().get_pregnancyIncubation() == 180)
         {
            outputText("[pg]你的肚子继续变大，激素也让乳汁分泌更上一层。你的乳房沉重又敏感，隐隐发胀，渴望被用来喂养某个生命，把赋予生命的乳汁送出去。\n");
            while(get_player().biggestLactation() < 2)
            {
               get_player().boostLactation(0.5);
            }
            return true;
         }
         if(get_player().get_pregnancyIncubation() == 120)
         {
            outputText("[pg]你有时会发现自己正对着未出生的孩子轻轻哼歌，像个心满意足的母亲一样抚摸着肚子。另一些时候，你又会发现自己自豪地抚摸着肿胀的乳房，欣赏着乳汁因此喷涌、流淌的模样。");
            while(get_player().biggestLactation() < 3)
            {
               get_player().boostLactation(0.5);
            }
            return true;
         }
         if(get_player().get_pregnancyIncubation() == 72)
         {
            outputText("[pg]现在，乳汁不断从你的乳头滴落出来，从很多方面来说，这比你日渐隆起的腹部还要难以应付。奶香始终萦绕在你周围的空气中，让你产生了想要吮吸的渴望，几乎和你的乳房渴望被吮吸一样强烈。\n");
            while(get_player().biggestLactation() < 4.5)
            {
               get_player().boostLactation(0.5);
            }
            return true;
         }
         if(get_player().get_pregnancyIncubation() == 48)
         {
            outputText("[pg]你的肚子沉甸甸地向外挺出，又圆又重，简直和英格纳姆那些足月的母亲没什么两样；你的乳房也几乎同样紧绷肿胀，仿佛在嫉妒你子宫里那即将成形的生命。早晨时，你发现自己会把乳房里的奶挤出来，直到倾泻而下的乳汁在你鼓胀的肚子上镀上一层漂亮的乳白光泽——不过这似乎也并没有让你的产奶量有什么变化。你只能希望肚子里正在成长的东西胃口够大，能跟得上你为它准备的这些食物……");
            while(get_player().biggestLactation() < 5.5)
            {
               get_player().boostLactation(0.5);
            }
            return true;
         }
         return false;
      }
      
      public function unfriendlyWitchToggle() : void
      {
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,854) == 0)
         {
            outputText("你傲慢地抱起双臂，命令这群奶水荡妇的女王停止她的女巫集会在沙地上无休止的骚扰袭击。听到这道命令，她脸上露出难以置信的神情，也摆出与你对峙的姿态，双臂深深压进她那惊人胸脯的沟壑里。你等着她回应，有那么一瞬间，你还以为自己又得和她打一场。可随后，她严厉的目光动摇了，整个人也颓然陷回宝座里，甚至还没来得及反抗就已经败下阵来。");
            outputText("[pg][say: 好吧。我想这样一来……]她将炽亮的目光投向一旁，[say: ……你就不能对她们用强了。]你听了轻笑出声。");
            if(get_player().cor < 50)
            {
               outputText("你大概不会做那种事，至少在没有被挑衅的情况下不会！");
            }
            else
            {
               outputText("说得好像那就能拦住你似的。");
            }
            outputText("你拍了拍她的肩膀，祝贺她终于明白事理。她危险地眯起眼睛，扭身避开你的触碰。");
            outputText("[pg][say: 就……就放过我们吧，]沙之母用细弱的声音恳求道。");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,854,1);
         }
         else
         {
            outputText("你微笑着告诉沙之母，你希望她那些爪牙重新开始纠缠你。你已经好一阵子没机会教训她宠着的女巫、让她们认清自己的位置了，而且在沙地上遇到移动奶水供应器，向来都是受欢迎的消遣。听到这个提议，她的脸色气得铁青，竟真的从宝座上站了起来，浑身因愤怒而颤抖。你举起你的[weapon]，歪过头，挑衅她来反抗你。");
            outputText("[pg][say: 不，]这位棕褐肤色的女妖术师低声嘟囔着，重新坐了回去。[say: 我不能……好吧。我会告诉她们，只要她们敢，就可以追逐你。可别指望我们会毫无挣扎地倒在你面前。]");
            outputText("[pg]你回答道：[say: 我可从没这么想过。]");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,854,0);
         }
         doNext(playerMenu);
      }
      
      public function turnIntoASammitch(param1:Boolean = false) : void
      {
         clearOutput();
         if(!param1)
         {
            outputText("你无力地");
            if(get_player().get_lust() >= get_player().maxLust())
            {
               if(get_player().hasVagina())
               {
                  outputText("把双手探向自己的胯间，狠狠抚弄饥渴的小穴，淫液溅得那名女巫的长袍上到处都是。");
               }
               else
               {
                  outputText("把手指插进你的[asshole]里，像命都系在上面似的拼命抠弄。");
               }
            }
            else
            {
               outputText("你试图站起来，可最后只是又滑倒回地上。");
            }
            outputText("精液女术士微微一笑，松开了她的法杖。那根法杖没有哐当一声掉在地上，而是一段一段地解除实体、逐渐淡去；若不是你正忙着别的事，这景象本该令人着迷。她掀起长袍，连同帽子一起摘下，甩开一头出乎意料地浅亮的金发。[say: 好啦，刚才那一通可把我弄得挺兴奋，而且我觉得姑娘们不会介意让我给你初次尝尝精液女巫术的滋味。你说呢，亲爱的？]她一边问，一边回头瞥向身后昏迷的女巫。");
            outputText("[pg][say: 偶没事……]一个轻轻的声音拖长了调子，几乎细不可闻。");
            outputText("[pg]抓住你的女人朝你灿然一笑，咯咯笑道：[saystart]看吧？我就说她们不会介意。现在，");
         }
         else
         {
            outputText("精液女术士微微一笑，咯咯笑道：[saystart]所以你想成为沙漠女巫？很好，我们正需要更多同伴。现在，");
         }
         if(get_player().get_pregnancyType() == 0)
         {
            outputText("我们就先把你的第一个女儿送进你身体里，好吗？");
         }
         else
         {
            outputText("我们就先来找点乐子，好吗？在我给你第一个女巫孩子之前，还得等你把子宫里的东西生出来才行。");
         }
         outputText("等着的时候，有的是时间把你变成我们的一员。[sayend]");
         if(!get_player().hasVagina())
         {
            outputText("[pg]她朝你一挥手，一股鲑粉色的光流便向你涌来。它一碰到你，你就大声呻吟起来，开始把[hips]抬到空中，对着一股看不见却能清楚感觉到的压力挺动胯间。那里缓缓裂开一道竖直的缝隙，随着它分开，湿润的光泽中露出一颗新生的阴蒂。<b>你长出了阴道！</b>");
            get_player().createVagina();
            get_player().setClitLength(0.25);
         }
         outputText("[pg]深色皮肤的扶她抚弄着");
         if(get_monster().get_lust100() < 65)
         {
            outputText("自己，直到完全硬挺；当浓稠的精液开始从她肿胀的龟头上淌下时，她露出了笑容。");
         }
         else if(get_monster().get_lust100() < 85)
         {
            outputText("自己，直到精液开始从她肿胀的龟头上淌下。");
         }
         else
         {
            outputText("自己，收集起不断滴落的精液，把它涂满整根肉棒。");
         }
         outputText("[pg]她满怀期待地舔了舔嘴唇，做好准备；不过片刻后，她看到你眼中仍有一丝反抗，便停了下来");
         if(get_player().get_lust() >= get_player().maxLust() && !get_player().hasVirginVagina())
         {
            outputText("，即便你的手已经齐指节插进你的小穴里");
         }
         outputText("。");
         outputText("[pg]神秘的女巫跪在无力的你面前，叹了口气，低声说道：[say: 你为什么就不能接受呢？你本就该和我们在一起。我们会修复这片沙漠——还有玛瑞斯。恶魔阻止不了我们。怪物也阻止不了我们。它们做不到。]她轻轻用手梳过你的头发，一边漫不经心地把淫液抹到你身上，一边絮絮叨叨：[say: 放轻松，宝贝。来，也许这个会有帮助。]女巫的双手突然握住你的耳朵，她的嘴唇以毫无意义的方式动了起来。她到底在说什么你根本听不见，因为她正这样捂着你。");
         outputText("[pg]她的法术像枪声一样爆开，至少在你感觉中就是如此。它带着轰鸣的涟漪劈进你的意识，将你震得陷入无思无想的沉默，你的思路一瞬间像是短路了。你的嘴无力地张开，舌头滑出来，口水往下流，整个身体都瘫软下去，失去控制。若不是精液女巫稳稳的双手扶着你，你早就倒进她的某滩体液里了；不过她好心地撑住了你，同时开始脱下你的[armor]。");
         outputText("[pg][say: 好了好了，亲爱的，这样不是好多了吗？]女术士问道，[say: 听我的总是更好。]你一眨不眨地盯着她。[say: 对嘛，]她咯咯一笑，[say: 我就知道！你会喜欢成为沙漠女巫的，绝对会喜欢。]一只深色的手——掌心比手背要浅——轻轻碰上你的脸颊，引着你的脑袋小小地点了一下。她打趣道：[say: 没错，成为沙漠女巫是最棒的！你会有四只硕大、满是奶水的乳房，闲下来就能挤奶；还会有两个小穴，只要你来拜访，随时都能被灌满。]每一句漫无边际的解释都穿过你的耳朵，落在你昏沉迟钝的心智上，赶在你的大脑重新掌控自己之前，滑进那些空白无思的缝隙里。");
         outputText("[pg]精液女巫替你移动着你的手，笨拙地玩弄着你的小穴，同时在你耳边低声细语。她正在给你洗脑，而你无助又空茫，连一根手指都抬不起来。再说了，听她的话才更好。只要听着就好，更好。对，就是这样。");
         outputText("[pg][say: 哦，我一看就知道你会成为很棒的姐妹！你会爱上被挤奶的，几乎会像爱上怀我的孩子一样爱，]她柔声哄着。你刚要点头表示同意，才想起自己该乖乖听着，思绪也慢慢恢复运转。[say: 你会非常喜欢怀我的宝宝，等你有了第二个子宫后，你会一直想让两个子宫都怀得满满的，对吧？你喜欢我的精液，也想让它灌进你所有的洞里，尤其是你的子宫。]这次你真的点了点头——那一定会很有趣！你已经迫不及待想要");
         if(get_player().bRows() < 2)
         {
            outputText("长出四只又大又能产奶的奶子");
         }
         else if(get_player().lactationQ() < 200)
         {
            outputText("把你的奶子变成完美的产奶器");
         }
         else
         {
            outputText("让你四只大奶子被挤奶");
         }
         outputText("，也迫不及待想接受第一次正式的女巫精液灌注。");
         outputText("[pg]你咯咯笑着，发自内心地表示赞同，并请求她帮你爬到长凳上，好让你被好好受种。现在先在肚子里揣上一个，就能抢先一步让两个子宫都怀上——你只需要在这之后让她们再给你弄出第二个小穴。");
         if(get_player().get_pregnancyIncubation() > 0)
         {
            outputText("看来你不知怎么的，已经忘了自己本来就怀孕了，而精液女巫似乎也不打算提醒你。");
         }
         outputText("只是想到她，你就湿了，比原本还要更湿，而你先前就已经热得发烫、湿得一塌糊涂。她把你抱到齐腰高的长凳上时，你的双腿自己张开，小穴里的淫液顺着被精液磨亮的硬木滴落；这间屋子里弥漫的浓烈性爱气味让你头晕目眩。你扭着屁股，诱人地来回晃动你的[butt]，在伴侣那根淌液的家伙面前摇来摇去，双眼死死盯着那根乱糟糟的器具，仿佛它不知为何能救你的命一样。");
         outputText("[pg]精液女巫拍了你不安分的屁股一下，让它稳住。突如其来的粗暴对待让你痛呼出声。“她好粗鲁，”你在心里委屈地抱怨，但另一个声音回答道：“可她会好好对你的！”你满足地叹了口气，听从那第二个、更响亮的念头，趴在那里，看着你的情人慢慢对准你的入口。当她肉棒渗液的顶端第一次擦过你的阴唇时，一道原始快感如电流般贯穿全身，仅仅这一下触碰就让你滑溜溜地喷出一股淫液。天上地下的诸神啊，这实在太热了，光是碰到它都像是让你的小穴变得更湿。如果不是你还清楚一点，你简直会发誓你的小穴正因欲火沸腾，因渴求而泛起泡沫。");
         outputText("[pg]两只巨大的奶子压在你的背上，用惊人的重量把你压在下面，汗湿光滑的肌肤像丝绸般擦过你的身体。那根坚硬的肉棒撑开你的外阴，穿过不断渗出的雌性淫液帘幕。你为这受欢迎的侵入愉快地呻吟起来，一种惊人的充实感——不，不如说是理所当然的契合感——以最完美、最女性化的方式填满了你。");
         if(get_player().hasCock())
         {
            outputText("[EachCock]在你身下悸动着，硬得像石头，被挤在你的肚子和滑得发亮的木头之间。和上面正在发生的事比起来，这似乎一点也不重要。");
         }
         get_player().cuntChange(get_monster().cockArea(0),true,true,true);
         outputText("当那两颗奇妙地鼓胀着的大卵抵在你的[butt]上时，你意识到她已经完完全全地插进了你体内。那根坚硬、美妙的肉棒就在你里面，顶着你的子宫颈，浓稠而强劲的精液直接渗进你体内，流到它该去的地方。你满足地叹息，收紧体内的肌肉，夹住那根插在你里面的肉棒，仿佛能把它挤出奶来；这让你黑皮情人深色的双唇间漏出一声惊讶的喘息。她坚硬的乳头更用力地抵进你的背里，而你的[vagina]里湿热感的增加，也提醒着你她有多享受这一切。");
         outputText("[pg]精液女巫抚摸着你的头发，承诺道：[say: 我会每天都为你这么做，如果有必要，每个小时都来，直到你怀孕……等你进了产房，我也会去看你，把你想要的所有精液都给你。]一团肥厚的鼓包沿着女巫的肉棒向下推进，撑胀了你的阴唇，随后在你体内爆裂般喷出，证明了她对这个想法有多兴奋。你简直不能更开心了！你不仅要成为一个巨乳产奶女巫，你的爱人还会让你一直被填满、温暖，塞满精液与生命。想到这里，你的[vagina]一阵酥麻颤抖，愉快地按摩着那女人粗大的黑色肉棒；而她也开始慢慢摆动腰胯，轻轻把自己抽出些许，放出几颗精液泡泡后，又再次将自己完全套进你的小穴里。");
         outputText("[pg]你剧烈地颤抖着，再次被贯穿，正如你所渴望的那样。那完美的极乐转瞬即逝，因为精液女巫开始更快、更用力地操你，她的奶子在你身上危险地摇晃，屁股随着每一次挺动弓起又绷直。你开始随着每一次冲刺发出呻吟，像一幅女性满足的画面，被另一位（部分）女性完美地骑在身上。你的金发情人会意地微笑着，亲吻你的肩头。她湿润柔软的嘴唇缓慢却不可阻挡地越来越靠近你的脊柱，直到带着一阵电流般的战栗，吻上你的一节脊椎。你颤抖起来，但她还没结束。她温柔的吻一路来到你的后颈，在那里停下，沾满唾液的舌头顺滑地掠过你的身体，舔向你的耳角。");
         outputText("[pg]在这场感官浓烈的做爱中，你感觉到精液不断在体内冒泡，这是精液女巫那仿佛无穷无尽的爱意持续而有节奏的提醒。她的种子已经开始从你的小穴唇间滑出来，先在你的[clit]上挂了一瞬，随后滴落到地板上。这种持续的液体流动意外地令人愉悦；如果你还没有像置身天堂的娼妇那样呻吟，现在也该开始了。插在你体内的粗大肉棒似乎也同样享受这种感觉——至少从它的抽动，以及逐渐增大的精液流量来看是如此。双性人的腰胯猛烈地像活塞般抽送着，对你的照顾似乎毫不停歇，热情得令人难以置信。");
         outputText("[pg]接着，就在你以为她会彻底失控，带着你们一起抵达高潮时，她却抽了出去，把你翻过身来，让你仰面面对她。她天蓝色的眼睛愉快地闪闪发亮，欣赏着你被精液撑起的小腹；可当你伸手向下，掰开饥渴的小穴唇时，这段间歇便结束了。精液女巫带着野兽般的凶猛骑上你，把整个身体压到你身上，粗暴地捣弄你的小穴。每当她挺进你那湿透的下身，肥厚的精液团几乎不停地从她的肉棒里喷出。即便你随着她震颤发抖，你也能看出她还没有射。她的眼神确实有些迷离；想着让自己更快受精，你伸手摸向她巨大的乳头。");
         outputText("[pg]它们和她身体的其他部位一样柔软，只是带着微微颗粒般的质感，让你恨不得能舔一舔、吮一吮其中一颗。但此刻，那对巨大的奶子几乎要把你的双手完全吞没，庞大的乳房压扁在你的[chest]上。精液女巫突然叫出声来，你看见她咬住下唇，眼帘低垂，身体颤抖。她的腰胯最后一次狠狠撞进你体内，强硬而美妙地将你填满。她的卵袋上下弹动，你感觉到她的肉棒突然从根部到顶端都开始变粗，膨胀着为她正要泵进你子宫的庞大精液洪流让出通道。神圣的热流冲刷过你，你感觉[skin]被撑得发紧。你满胀紧绷得仿佛能把肚子当成鼓来敲，可精液女巫的高潮才刚刚开始。每一次脉冲般爆发的精液，都由你湿透的小穴里喷出的对应洪流回应，积成水洼落在地板上。你在她身下抽搐，被如此大量液体流过小穴的感觉逼至高潮，快乐将你淹没，你闭上了眼睛。");
         outputText("[pg]你们俩在腰胯相连的状态下停留了不知多久，汗湿的身体在狂喜中交缠。就像所有美好的事物一样，它终究会结束；一名普通的沙漠女巫走进来打断了你们。那位乌黑美人突然离开，让你体内顿时空荡荡的，她的液体如洪水般滴落到地板上，同时她宣布道：[say: 我制服了那个闯入者，不过我说服她加入我们了。]");
         outputText("[pg]另一个女人听到这话有些困惑，但当她看见你睁得大大的、兴奋的眼睛时，还是勉强点了点头。她对你的存在闪过一丝不悦，但当你的情人开口提出时，那份不快便消退了：[say: 别板着脸嘛，亲爱的，我给你留了一些。你为什么不先带你的姐妹去见母亲大人呢？等你回来，我保证把你们三个小穴都塞得满满的，好吗？]");
         outputText("[pg]这似乎安抚了那个有四个乳房、三个小穴的女人，她脸上绽开灿烂的笑容。她扶你起身，带你离开房间，走向你的新生活；临走前你看到的最后一幕，是精液女巫朝你意味深长地眨了眨眼……");
         get_player().orgasm("Vaginal");
         dynStats(DynStat.Lib(100),DynStat.Sens(100));
         menu();
         addButton(0,"下一步",chicksLoseToSandWitchesBadEndFinale);
      }
      
      public function tooBigCumWitchLossNoFacial() : void
      {
         clearOutput();
         outputText("你告诉她，你宁愿不要被她的精液糊一脸。看她那副不爽的表情，她似乎是真的对你的选择感到惊讶，好像从没想过会有人不愿意被她的精液糊满脸。这婊子显然和她那些性欲狂姐妹待得太久了。");
         outputText("[pg]她低吼道，[say: 是你亏了，" + get_player().mf("handsome","beautiful") + "。反正我还是要、要……爽到。]精液女巫强行扭动臀部，把你的[cock biggest]压向一旁；她黑色的肉棒在你身上抽搐，让她浑身发颤，又喷出一股新鲜白浆洒在你身上，而她甚至还没真正射出来。她的睾丸饥渴地震颤着，不断跳动、鼓胀，准备爆发");
         if(get_player().balls > 0)
         {
            outputText("，就像你自己的一样");
         }
         outputText("；她残忍地笑着，双脚更用力地踩住你，忽然带上了超自然力量的刺麻感。近乎疼痛的热流涌过你的腰腹，她越来越用力地与你摩擦，无意间用乳房夹弄着你巨大的勃起，直到把你逼上高潮。");
         outputText("[pg]你的第一股喷射又长又浓，立刻浸进了沙地里。第二股就小得多，只留下一道细小黏滑的痕迹。精液女巫在你身上爆发，她的硬挺喷出一团大到会被自身重量扯裂的精液，沿着你肉棒两侧坠向沙地。此刻你的肉棒已经完全被她的精液浸透；虽然没那么显眼，她的雌液也正顺着你的[sheath]和[hips]滴落，用她甜美的女性气味标记你，而她咸腥的白浆则淋透了你更大的肉棒。她的喷射越来越汹涌，你的却逐渐衰弱，直到最后只能射出可怜巴巴的细小白滴，小到要攒上好几滴才足以坠落到地面。");
         outputText("[pg]射完之后，疲惫席卷了你，让你陷入断断续续的昏睡；而精液女巫还在继续从她的家伙里泵出看起来像一整片湖的精液。她到底偷走了你多少精力？");
         if(get_player().ballSize > 5)
         {
            var _temp_1:* = get_player();
            _temp_1.ballSize = _temp_1.ballSize - Math.round(get_player().ballSize * 0.333);
         }
         var _loc1_:Number = get_player().cumMultiplier * 0.75;
         get_player().cumMultiplier = Math.round(_loc1_);
         get_player().orgasm("Dick");
         get_combat().cleanupAfterCombat();
      }
      
      public function tooBigCumWitchLossFacial() : void
      {
         clearOutput();
         var _loc1_:int = get_player().biggestCockIndex();
         outputText("你苦笑着告诉她，如果能让自己的能力得到增强，你并不介意沾上一点精液。她脸上浮现出心照不宣的笑容，看起来就像她早知道这个结果根本毫无悬念。");
         if(get_player().cor < 33)
         {
            outputText("一想到接下来会发生在你身上的事，你不禁打了个寒战。你到底为什么会答应这种事？");
         }
         else if(get_player().cor < 66)
         {
            outputText("当你意识到接下来自己会遭遇什么时，你发现自己竟然在舔嘴唇。尽管你急忙停下，精液女巫还是看见了，她笑了起来。");
         }
         else
         {
            outputText("你朝她投去淫荡的眼神，用舌头舔过嘴唇，期待着她即将喂给你的那份又大又浓的精液；无论心里还有多少顾忌，你都渴望着那湿热又堕落的快感。");
         }
         outputText("[pg]她在你的" + get_player().cockDescript(_loc1_) + "上分泌出的温热湿意，似乎也和那些");
         if(get_player().hasFuckableNipples())
         {
            outputText("来自");
         }
         else
         {
            outputText("作用于");
         }
         outputText("你的[nipples]处的震动一样影响着你。你感觉勃起里像是被硬灌进了太多血液，过度胀大到几乎要爆开。欲望压倒了一切。你必须射出来，而且你浑身湿透，沾满了精液和淫液，现在正是时候。精液女巫的鞋跟压在你的");
         if(get_player().balls > 0)
         {
            outputText("[balls]上，轻轻挤压着它们，同时一阵魔力的刺麻感刺入你体内，在她的摆弄下让它们胀大起来");
         }
         else if(get_player().hasVagina())
         {
            outputText("[vagina]上，陷进滑腻的肉缝，同时一阵魔力的刺麻感在其中扩散，并钻入你的核心，让你体内某个器官变得更加厚实");
         }
         else
         {
            outputText("会阴上，一边摩擦着，一边让一阵带着电流般欲求的刺麻穿过你的[skinfurscales]，袭向你肿胀的前列腺和精囊");
         }
         outputText("，就在这一刻，你彻底失去了忍耐的能力。你射了，而且就是现在。");
         outputText("[pg]你怀着敬畏看着自己巨大的尿道口缓缓扩张，敞开来露出即将奔涌而出的黏稠白浊；仅仅片刻之后，它便直直喷向你的脸、头发和嘴里。");
         if(get_player().biggestCockLength() >= get_player().get_tallness() / 1.6)
         {
            outputText("精液女巫握着它微笑起来，将它弯下，确保那根过长的肉棒把浓稠的精液倾倒在你的[face]上——那正是它该去的地方。");
         }
         outputText("你的俘获者在你射精时依然骑在上面挺动，丰沛的白浆鼓胀着顶住她较小的硬挺，让她呻吟不止。她脸上满是狂喜，沉重的乳头拖蹭着你的[chest]，动作在快感中变得断断续续，也开始发出低哼。");
         outputText("[pg]随着你超负荷的生殖系统开始发威，渗出的精液越来越频繁地溅到你身上；厚重的白浊从你的下巴滴落，而精液女巫也攀上高潮，把她自己雄性十足的喷射也加入这场精液暴雨。你的[hair]被象牙白的精液浸透、黏成一团，多到从耳边垂下一缕缕黏腻的卷发。那感觉舒服得让你忍不住呻吟，可下一瞬间，鼓满脸颊的精液喷发就把声音堵了回去。你分不清那到底是你的还是她的，只能把它咽下去，并努力透过这层咸腥的面罩呼吸；而它还在越堆越厚。精液多到在你身后积成一滩滚热潮湿的水洼，又顺着你的[chest]流下，那些嗡嗡震动的石头一边帮你泄出来，一边把它挤得四处飞溅。");
         outputText("[pg]在持续了至少一分钟的连番颜射后，精液女巫终于从你身上爬了下来，可你还在射，快感把你的脑子搅得一塌糊涂，连挪开自己的喷精管都做不到。你眼睛因狂喜而翻白，在胜利的扶她穿衣服时，一路射到失去意识；她临走前还停下来，把最后几丝魔力揉进你体内。她可不想让你的精液太早耗尽，不是吗？");
         if(get_player().cumQ() < 1000)
         {
            var _temp_1:* = get_player();
            _temp_1.cumMultiplier = _temp_1.cumMultiplier + 5;
         }
         else
         {
            var _temp_2:* = get_player();
            _temp_2.cumMultiplier = _temp_2.cumMultiplier + 2;
         }
         if(get_player().ballSize < 7)
         {
            var _temp_3:* = get_player();
            _temp_3.ballSize = _temp_3.ballSize + 1;
         }
         get_player().orgasm("Dick");
         dynStats(DynStat.Lib(1),DynStat.Sens(1));
         get_combat().cleanupAfterCombat();
      }
      
      public function tentacleVictoryGangbangCumWitch() : void
      {
         clearOutput();
         outputText("那败下阵来的女术士在你走近时疑惑地看着你；当你分开[armor]，露出你的[cocks]时，她的惊讶更深了。你兴高采烈地将多根肉棒彼此缠绕，扭成一条层层交叠的螺旋；油亮、滴着前液的植物阴茎纠缠成束，满载着几乎压抑不住、翻涌起泡的欲望。柔顺的肉质因获得自由而愉快地脉动，并立刻朝那发情的女巫扭了过去，在她上方停住，仿佛正在思索她湿滑褶缝的紧致，或是她勃起阴茎表皮的柔软。");
         outputText("[pg]你的勃起蓄势待发，金发女人只能盯着看，心里发慌。她的下唇因不安而颤抖，可她刚鼓起勇气想要抗议，你就松开一根扭动的肉棒，将它深深塞进她的喉咙里，堵得她只能发出：[say:——唔嗯唔！]那黑皮女孩的喉咙被顶出淫靡的凸起，你怪物般的巨物继续向深处钻去，把泛紫的龟头埋进她柔软而纹理细腻的喉管深处。她试图呼吸时产生的吸力反而让你的阴茎在她体内胀得更大，像地精制造的性玩具一样有效地刺激着你。");
         outputText("[pg]你因那感觉而低声呻吟，放松了将一束阴茎缠成单根肉棒的控制，让它们自由散开。最快的那根立刻弹下去，在她的小穴唇边蹭动，把你的体液抹进她自己的淫液里。急促的摩擦把感官的液体搅成一团滑腻、带着泡沫的乳白色淫乱混合物。可惜，对它来说，这根抢先一步的阴茎很快就被你的另一根触手肉棒取代。新的那根沿着第一根的下方滑行，随后挤进另一根阴茎与那道美妙湿缝之间，向下弯曲，钻入其中安顿下来。女巫弓起背，眼睛疯狂上翻，既要挣扎着呼吸，又要承受这突如其来、强硬无比的插入。");
         outputText("[pg]那根被拒之门外的阴茎带着怨气震颤着，像蝎子一样弓起，随时准备出击。它似乎在权衡选择，也许正通过你的眼睛看见自己的兄弟们贯穿着这发情荡妇的两个洞口。这根能灵活卷动的阴茎决定缠住她的一条腿，像蛇一样盘绕其上，沿着光滑的黝暗肌肤越爬越高。当它几乎抵达那道渗着淫液、刚被干过的小穴时，又向下扭去，钻入两瓣屁股之间的幽暗沟壑；随着你唇间逸出一声愉悦的叹息，你让第三根触手肉棒滑进了她脆弱的肛门。它轻而易举地穿过她的括约肌，立刻开始来回抽插，毫不顾及她的舒适，缓慢地锯磨着女巫饱受摧残的直肠。");
         outputText("[pg]你将堵住喉咙的那根尖棒从精液女巫的口腔中抽出，低头朝她一笑，把这根沾满唾液、润滑发亮的阴茎放在施法者挺翘的双乳之间。她咳嗽着、喘息着，胸口剧烈起伏。作为回应，她肿胀的乳房围着你嵌在其中的巨物愉快地晃动，无意间按摩着你那根扭动的肉塞。三重快感叠加而来，让你也随之摆动臀胯；哪怕你的肉棒们完全不需要你再添动作，也能自行充分抽插。放开束缚，真正享受这受祝福形体带来的成果，感觉实在太美妙了！你加快速度，阴茎们像蛇一样折回又猛刺向前，令这个痴迷精液的女巫全身每一处都颤抖起来，连她那根漏液的阴茎也不例外。");
         if(get_player().countCocksOfType(CockTypesEnum.TENTACLE) >= 4)
         {
            outputText("[pg]你第四根空闲的肉棒缠上女术士黝暗的阴茎，一边摩擦一边套弄，两根阴茎把带着泡沫的黏液涂满彼此的棒身。你的阴茎拱过那根黑色巨物上方，俯下去将龟头狠狠撞上对方的龟头；感受到前液在两道马眼之间来回交换，你不禁浑身一颤。精液女巫在被迫承受的极乐中翻起白眼。与此同时，她的嘴巴张开，涎水从那张松软无力的嘴里滴落，顺着下巴淌下。你收紧缠绕在黑色阴茎上的圈，把一团新鲜前液从中挤出，并加快节奏，以配合你施加在她身上的猛烈奸弄。");
         }
         outputText("[pg]你这多根齐攻所释放出的原始性力，让这名黑皮美人的背脊猛然弓起；她高潮了，既狼狈又响亮，声音像报丧女妖一样尖锐。白色洪流从她鼓胀、脉动的阴茎中爆发出来");
         if(get_player().countCocksOfType(CockTypesEnum.TENTACLE) >= 4)
         {
            outputText("，肆无忌惮地溅在与你摩擦的龟头上");
         }
         outputText("，与其说是高潮，不如说像消防水管在喷射。乳白色的洪流冲过她紧绷的腹部皮肤，沿着你夹在乳间抽动的阴茎，以及女巫胸部下方晃动的弧线一路覆上白浆。她紧致的小穴像虎钳一样夹住你，波浪般的收缩从你深埋其中的龟头一路传到根部。女巫肛门那枚紧窄的穴口也同样收缩起来；虽然它不像她的小穴那样努力榨取你的阴茎，但那股又热又紧的挤压感也以它自己的方式美妙得无以复加。");
         if(get_player().balls > 0)
         {
            outputText("[pg]你的睾丸开始带着震颤的热意发抖，释放出浓稠的载荷，灌入[eachCock]。");
         }
         else
         {
            outputText("[pg]你的身体开始在震颤的热意中发抖，释放出浓稠的载荷，灌入[eachCock]。");
         }
         outputText("你浑身一颤，双手抓住这位黑肤女术士的乳房，紧紧揉捏着她古铜色的圆润双乳，射精的快感贯穿全身。几股精液涌出，同时堵进女巫的小穴和肛门。她双乳之间那根沾满唾液、溅满精液的藤蔓意味深长地颤动起来，随即喷发，将一股浓稠的白浊射到她脸上。");
         if(get_player().countCocksOfType(CockTypesEnum.TENTACLE) >= 4)
         {
            outputText("当然，你的第四根肉棒也不甘示弱，将黏稠的精液涂满女巫自己那根跳动的肉棒，让它缠上一道道糖浆般的乳白。");
         }
         if(get_player().cumQ() >= 500)
         {
            outputText("一波又一波精液冲刷着敌人紧窄的孔洞和紧致的身躯，把她弄得一塌糊涂。");
         }
         if(get_player().cumQ() >= 1000)
         {
            outputText("又是几股强劲的喷射，彻底将她灌满，让她的肚子鼓胀成一个绷得紧紧的圆丘。");
         }
         outputText("[pg]你抽回已经射空的肉棒，看着大量精液从精液女巫被弄脏的下体中倒涌而出，不禁露出得意的笑。她已经被彻底玩坏，从各种意义上都被肉棒支配了。一个崇拜这种器官的女术士，反倒被它彻底征服，真是美妙的讽刺！你穿好衣服，懒洋洋地向她挥了挥手，邀请她哪天再来试试。");
         get_player().orgasm("Generic");
         get_combat().cleanupAfterCombat();
         spriteSelect(SpriteDb.get_s_cumWitch());
      }
      
      public function tentacleGangBang() : void
      {
         clearOutput();
         outputText("你咧嘴一笑，兴奋地脱下[armor]，释放出那团扭动的生殖附肢，让它们在空中挥舞，彼此贴着那覆满汗水和前液、海绵般的皮肤滑动。它们威胁般地在空中摇摆，一群闪闪发亮的绿色鸡巴，正等着被放出去蹂躏眼前这具强悍的女性肉体。沙之母恐惧地把自己缩向墙边，结结巴巴地说：[saystart]不……");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,848) == 0)
         {
            outputText("不该是这样的！我、我们本来要解放玛瑞斯的！");
         }
         else
         {
            outputText("别再来一次了！");
         }
         outputText("[sayend]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,848) == 0)
         {
            outputText("[pg]这个蠢婊子还以为你在跟恶魔合作呢！");
         }
         else
         {
            outputText("[pg]这个蠢婊子还以为自己对此有发言权呢！");
         }
         outputText("好吧，也没必要纠正她这个误会。你放出那一丛饥渴的触手，让它们伸展开来，超出平日那寒酸的长度，滑进女巫的衣摆下。丝绸布料拂过你肉质的茎身，带来令人愉悦的瘙痒感；它们一路向上，贴着布料与那颤抖荡妇无瑕的肌肤之间游走。她试图甩开你四处探寻的肉茎，但你将它们缠上她的双腿，有条不紊地扭动着继续向上。");
         outputText("[pg]当第一根滑过她的大腿根时，你欣喜地发现她根本没穿内衣。你的顶端碰到一对光滑无毛的唇瓣，片刻后又碰到第二对一模一样的。滑腻的湿意润滑着这两对唇瓣，两颗凸起的阴蒂在你的茎身四处摸索时顶弄、戳刺着它。受此鼓舞，你让自己翠绿的肉棒藤蔓肆意生长，沿着女术士的躯干向上，钻进她四只西瓜般大小的乳房之间。透过被乳汁浸湿的布料，你能看见它没入那道乳沟深谷，几乎将你的整段长度吞没——至少直到它从顶端重新弹出，惬意地搏动着。");
         outputText("[pg]沙之母喘息起来，身体被肉棒牢牢缠住，陷入一片蠕动的阴茎之中，手脚很快就被固定得动弹不得。夹在她胸间的那根绕过其中一只乳房侧面，接着又横向穿过双乳之间。它继续自己的旅程，在四只乳房周围蠕动滑行，直到四只都被触手紧紧束缚；每一次动作都揉弄着它们，挤压的力道恰到好处，逼得它们喷溅、渗出丰沛的乳汁。你其余的肉棒触手也没闲着，与此同时，它们缠上她的脖颈和臀部，其中一对悬停在下方湿滑的洞口上。你已经厌倦了这种不够尽兴的视角，便屈动其中一根肉茎，轻易撕开柔软的布料，将它从这位高大主母的身上扯下。");
         outputText("[pg]如今她彻底暴露在外，你得以欣赏这位深色肌肤的女术士被绿色肉棒五花大绑的壮观景象。你众多肉茎那肿胀发紫的头部在移动时留下一道道闪亮的前列腺液，把沙漠女巫的女王弄得几乎只是个沾满肉棒汁液的荡妇。光是这景象，再加上她光滑肌肤带来的触感，就让你头晕目眩，但你渴望更多。[EachCock]都硬得发疼，蓄势待发，而你急切地需要有什么东西来容纳它们。你暂停片刻，判断目标是否准备好了。她在你的束缚中喘息、脸红、扭动，并非出于恐慌，而是出于欲望。她的乳头像坚硬的子弹，喷溅着乳汁。你弹了一下其中一颗来测试它的硬度，随即得到一股浓稠乳浆作为回报。她已经准备好了。");
         outputText("[pg]你同时驱使那两根饥渴于小穴的触手肉棒向前挺入。一连串湿滑的咕叽声宣告了你的成功插入，每根肉棒都能隔着狭窄的间隙感受到另一根。两根茎身兴奋地双重插入女巫，甚至还没有碰到她的肛门……暂时还没有。即便已有一英尺长的肉棒进入她体内，你仍继续向更深处推进，顶过子宫颈，好让自己的阴茎在温暖而迎人的子宫里蜷曲盘绕。感受到紧窄的宫颈环箍住自己，你不由得浑身一颤，几乎射出来，但你忍住了，等到自己所有的需求都能得到满足。");
         outputText("[pg]更上方，你试图将一件工具压进沙之母那丰满的唇间，用你的肉棒汁液把它们涂得油亮。那皱缩的入口依旧坚定地对你紧闭，被一排闪亮的白牙挡住，无论多大的肉棒压力都无法让你进入。你低吼一声，向后抽开，随后将藤蔓般的肉棒来回抽打，狠狠拍在她脸颊上。冲击带来的刺痛沿着你美妙的肉茎传来，但你忍耐下来，继续惩罚她，直到她的脸颊变得红彤彤、沾满黏液。等她因疼痛而倒抽一口气时，你顺势收回又以一道蜿蜒的动作猛然刺入，将九英寸的肉棒血肉埋进她毫无防备的喉咙。她的反应只剩含混的咕噜声，任何抗议的话语都变成了被迫口交时为你带来快感的颤动断音。");
         outputText("[pg]不甘落后的第五根肉棒沿着金发婊子的背部爬下，朝她臀部柔和隆起处前进；它知道最后一个尚未被侵犯的洞口就在那里。它挤过柔软的臀瓣，亲吻般掠过那皱缩的肛门。女巫立刻紧紧收缩，而这种反应你能从已经双重塞满她两只小穴的肉棒上感受到。你那逗弄的卷须缓缓在紧绷的肛沟间来回摩擦，让那些紧张的肌肉逐渐放松。每次抽动到尽头时，顶端都会轻轻绕着她的肛门打圈，温柔地顶碰那收缩的洞口，诱使它放松。那个抗拒的洞口顽强地抵抗着，但在三个洞都被操了一分钟左右后，沙之母的第四个洞也开始松弛，先是吞下一部分顶端，接着伴随湿润的啵声将整颗都接纳进去。");
         if(get_player().countCocksOfType(CockTypesEnum.TENTACLE) >= 6)
         {
            outputText("[pg]你还有");
            if(get_player().countCocksOfType(CockTypesEnum.TENTACLE) >= 7)
            {
               outputText("根尚未得到照料的蛇形茎身需要取悦");
            }
            else
            {
               outputText("根尚未得到照料的蛇形茎身需要取悦");
            }
            outputText("，可所有洞口都已经被填满了！你将那");
            if(get_player().countCocksOfType(CockTypesEnum.TENTACLE) == 6)
            {
               outputText("剩下的一根穿过");
            }
            else
            {
               outputText("剩下的几根穿过");
            }
            outputText("这个被肉棒支配的女术士的手指之间。到了这时，她的身体已经彻彻底底背叛了她；她像个饥渴肉棒的荡妇一样一把握住，立刻上下套弄，手法熟练得像个老手。一声含混的满足叹息顺着你操弄她喉咙的肉棒传来，提醒你这名堕落的敌人已经被阳具弄得神魂颠倒。你重新鼓起劲头，将埋在她各个洞里的四根肉棒抽插起来。那根操弄乳房的藤蔓也沿着弯曲的路径活塞般来回运动，弄得女巫的乳房疯狂摇晃、喷溅乳汁。唯一");
            if(get_player().countCocksOfType(CockTypesEnum.TENTACLE) == 6)
            {
               outputText("保持不动的是正在被手交的那根，而你让它保持不动");
            }
            else
            {
               outputText("保持不动的是正在被手交的那两根，而你让它们保持不动");
            }
            outputText("，好让你这一部分能放松下来，享受被俘女王热情的套弄。");
         }
         if(get_player().countCocksOfType(CockTypesEnum.TENTACLE) >= 10)
         {
            outputText("[pg]这样一来，你那无数根肉棒里已经有七根派上了用场，但你的本钱可远不止如此。还有三根肉棒一直潜伏在后方，被它们更积极的兄弟们遮住了。如今她已经成了心甘情愿的参与者，仰躺在这张阳具之床上，精液女巫又遭到了那些触手般肉棒的袭击。其中一根朝着被肉棒塞满的肛门压下去，硬是挤在旁边插了进去，让扩张程度翻倍，也让你同时享受到双倍肛交和肉棒摩擦的极乐。其余两根阳具也气势汹汹地加入这场乱交，像蛇一样钻进那两只小穴，贴着已经深埋其中的同伴挤了进去。");
         }
         outputText("[pg]如今她已经被彻底包裹，你俯身看着这个正开心地咕噜呻吟的猎物，欣赏着她被乳汁涨得鼓鼓的胸部，同时用能想到的一切方式占有她。你无声地命令众多肉棒加快抽插，然后低下头，啜饮一口甜美的乳汁。你畅快地喝着，任由身体陷入性欲狂潮，抽送、猛顶、滑动、挤压，以勇者化作触手怪般无情的力量肏着她。她每一寸裸露的肌肤和每一个孔洞都被你的前列腺液涂得滑腻不堪，而当你这场一人乱交推向狂热的顶点时，你松开那只乳汁淋漓的奶子，在极乐中咆哮着狠狠射精。");
         outputText("[pg]你高潮时，一串串鼓包沿着你的肉棒向上涌动，几十股精液迅速从根部奔向顶端，沿途把小穴和大张的肛门都撑得更开。当它们抵达你粗大悸动的龟头时，你的马眼大大张开，喷出一道道相互呼应的白浪。两只小穴从子宫到阴唇都被精液灌满。你新宠的荡妇肛门也被灌了一场乳白灌肠。四只奶子全都沐浴在起泡的精液里。");
         if(get_player().countCocksOfType(CockTypesEnum.TENTACLE) >= 6)
         {
            outputText("翻涌的精种浸透了她疯狂套动的双手。");
         }
         outputText("这还只是第一波释放。你的高潮拖得很长，像消防水管一样不断喷射，把可怜的女巫从头到脚浇成一片雪白。她的肚子淫靡地鼓了起来，喉咙、屁股和子宫全都被塞满，直到容量彻底被撑到极限，前面提到的四个洞都向外喷涌着黏稠的白色雄乳，在地上积成厚厚的水洼。");
         outputText("[pg]快感渐渐平息后，你抽了出来，把全部" + Utils.num2Text(get_player().countCocksOfType(CockTypesEnum.TENTACLE)) + "根精液喷口都对准她上方，像一场淫秽的淋浴，再次把她从头到脚淋透，让她变成一个满身咸腥白浊、狼狈不堪的精盆。她的喉咙终于久违地获得自由，她吞咽着，呜咽道，[say:噢噢噢……诸神啊。] 这个被精液灌得神志迷离的肉便器荡妇，开始用眼下唯一能用的方式清理自己——用嘴。她已经被肏到脱力，就算想施展魔法也做不到。你带着满足的得意劲儿穿好衣服。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,849) == 0)
         {
            outputText("[pg]女巫们已经被恰到好处地震慑住了，但你也毁掉了与她们友好和平相处的一切可能。");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,849,1);
         }
         else
         {
            outputText("[pg]她们或许不怎么瞧得起你，但把沙漠女巫女王变成一个只会娇声呜咽的荡妇，这种事永远不会腻。");
         }
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,848,FlagDict_Impl_.arrayReadInt(_loc1_,848) + 1);
         get_player().orgasm("Generic");
         dynStats(DynStat.Cor(1));
         if(!get_game().get_inCombat())
         {
            doNext(playerMenu);
         }
         else
         {
            get_combat().cleanupAfterCombat();
         }
      }
      
      public function talkDownTheMother() : void
      {
         clearOutput();
         outputText("你平静地走近沙之母的王座，说道：[saystart]我不是恶魔，女巫。我是[name]，我");
         if(get_player().cor < 33)
         {
            outputText("是一名勇者");
         }
         else if(get_player().cor < 66)
         {
            outputText("不受任何人驱使");
         }
         else
         {
            outputText("势不可挡");
         }
         outputText("。没有任何恶魔的枷锁能束缚我。[sayend] 你抓住她的肩膀，力道坚定却不粗暴，直视着她天蓝色的双眼，强调自己的清白。女巫女王茫然地点了点头，明显平静下来，尽管刚才的战斗仍让她心有余悸。她迟疑地向你点头，抚平自己的长袍，慢慢重新摆出那副高高在上的王者姿态。");
         outputText("[pg][say: 好吧。你要么不是恶魔的爪牙，要么就是玛莱湖这边最聪明的间谍，]这位高贵的女巫承认道，一边安静地整理着头发。[say: 不管怎样，在你的行动证明相反之前，我似乎也只能相信你的话。] 她整理完头发，随意地把双手交叠在膝上，这个动作反倒让丝绸长袍在她的两对乳房上绷得更紧。");
         outputText("[pg][say: 你有什么想谈的事，或是需要我提供什么帮助吗？我已经很久没有享受过与外来者交谈的乐趣了。]");
         var _temp_1:* = get_player();
         _temp_1.XP = _temp_1.XP + 200;
         get_mainView().statsView.showStatUp("xp");
         statScreenRefresh();
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,838,1);
         sandWitchMotherFriendlyMenu();
      }
      
      public function takeLaBovaOrLactaid(param1:Boolean = true) : void
      {
         clearOutput();
         outputText("你冷笑着绕过沙之母的王座，走向她身后那些上锁的箱子。你靠近时，她浑身一僵，却没有任何动作。这个可怜的小女巫害怕你，而且害怕得很有道理。你拿起此行要找的东西，回到她王座前时，还居高临下地拍了拍这位女术士铂金色的发丝。她恶狠狠地瞪着你。[pg]");
         if(param1)
         {
            get_inventory().takeItem(get_consumables().LACTAID,roomSandMotherThrone);
         }
         else
         {
            get_inventory().takeItem(get_consumables().LABOVA_,roomSandMotherThrone);
         }
      }
      
      public function takeFertilePills() : void
      {
         clearOutput();
         if(!get_player().hasStatusEffect(StatusEffects.Contraceptives))
         {
            outputText("你并未处于避孕效果之下，所以吃粉色药丸也不会有任何作用。");
         }
         else
         {
            outputText("你很快就弄明白了，粉色药丸应该能抵消避孕效果。你把它丢进嘴里咽下，片刻之后，胯间传来一阵微微的刺麻感。你应该又能怀上孩子了");
            if(!get_player().hasVagina())
            {
               outputText("，前提是你以后长出阴道");
            }
            outputText("。");
            get_player().removeStatusEffect(StatusEffects.Contraceptives);
         }
         doNext(playerMenu);
      }
      
      public function takeBarrenPills() : void
      {
         clearOutput();
         if(get_player().hasStatusEffect(StatusEffects.Contraceptives))
         {
            outputText("你已经处于避孕效果之下了。再吃一颗棕色药丸也不会有什么用。");
         }
         else
         {
            outputText("你觉得这些棕色药丸应该能让你无法受孕，于是把一颗丢进嘴里咽下，可不想被人搞大肚子。");
            if(get_player().get_pregnancyIncubation() > 0)
            {
               outputText("当然，你已经怀孕了，而这药似乎对那件事毫无作用。");
            }
            outputText("你确实感到小腹里一阵空落落的，这让你放心——药丸已经发挥作用了。");
            if(!get_player().hasVagina())
            {
               outputText("现在就算你以后碰巧长出阴道，应该也没问题了。");
            }
            get_player().createStatusEffect(StatusEffects.Contraceptives,0,0,0,0);
         }
         doNext(playerMenu);
      }
      
      public function sphinxSubmissionOptions() : void
      {
         var submitted:Boolean;
         var _g2:DesertCave;
         var skipped:Boolean;
         var _g1:DesertCave;
         var submit:Boolean;
         var _g:DesertCave;
         clearOutput();
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,845,FlagDict_Impl_.arrayReadInt(_loc1_,845) + 1);
         outputText("输掉谜题游戏后，你照着斯芬克斯女孩的命令行事：脱下你的[armor]，让自己赤裸地暴露在沙漠烈日下。[say: 那么，我迟钝的小宠物，我该拿你怎么办呢……]");
         menu();
         addButtonDisabled(1,"被口交","该场景需要你拥有阴茎。");
         addButtonDisabled(2,"爪交","该场景需要你拥有阴茎。");
         addButton(0,"被假阳具插",fenPutsHisShittyFetishInYoSphinx);
         if(get_player().hasCock())
         {
            _g = this;
            submit = true;
            addButton(1,"被口交",function():void
            {
               _g.getBlown(submit);
            });
            _g1 = this;
            skipped = true;
            addButton(2,"爪交",function():void
            {
               _g1.lionpaws(skipped);
            });
         }
         _g2 = this;
         submitted = true;
         addButton(3,"奥术玩弄",function():void
         {
            _g2.sanuraCunnilingus(submitted);
         }).hint("在她填满你后穴的同时，给她舔阴。");
      }
      
      public function sphinxMenu() : void
      {
         menu();
         addButton(0,"外貌",sphinxAppearance).hint("查看萨努拉的外貌。");
         addButton(1,"谜题游戏",riddleGameGo).hint("开始谜题游戏。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,835) > 0)
         {
            addButton(2,"上她",fuckDatSphinx).hint("拿萨努拉泄欲。");
         }
         setExitButton("返回",moveToEntrance);
      }
      
      public function sphinxAppearance() : void
      {
         clearOutput();
         outputText("站在你面前的是萨努拉。这位令人敬畏的斯芬克斯有着女性的上半身，以及雌狮的身躯。");
         outputText("[pg]她那基本像人类的头顶上长着两只猫科耳朵，一头及肩黑发垂在脸颊两侧，也将你的目光引向她深蓝色的眼睛。两只巨大的羽翼从她肩下的背部伸展开来。");
         outputText("[pg]一件蓝色胸罩和一条相似的缠腰布遮住了她的人类躯体，金色手镯与戒指则点缀着她的手臂和手指。她服饰的色彩与她古铜色的肌肤，以及狮身半边的棕色毛皮形成了漂亮的对比。");
         outputText("[pg]她的四条腿末端都是爪子，利爪平时隐藏着，只有在她需要时才会露出。一条狮尾在她身后左右摆动。");
         outputText("[pg]萨努拉有一对柔软圆润的C罩杯乳房，每颗乳尖上都有一枚0.5英寸长的乳头。");
         outputText("[pg]在她尾巴下方，恰好该在的位置，有一个紧致的屁眼和湿润的小穴。");
         menu();
         addButton(0,"下一步",runFunc);
      }
      
      public function slavesDiscussion() : void
      {
         menu();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,866) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,864) == 0)
         {
            addButton(0,"埃斯蕾尔",get_game().forest.essrayle.askMotherToReleaseEssy).hint("请求沙之母释放埃斯蕾尔。");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,871) > 0 && !get_game().milkWaifu.milkSlave())
         {
            addButton(1,"乳奴",freeSlaves).hint("请求沙之母释放你在浴室里发现的那名乳奴。");
         }
         setExitButton("返回",sandWitchMotherFriendlyMenu);
      }
      
      public function sexWithFriendlySandMother() : void
      {
         if(get_monster() == null || get_monster().get_short() != "Sand Mother")
         {
            set_monster(new SandMother());
            get_monster().set_HP(0);
         }
         menu();
         if(get_player().hasVagina())
         {
            addButton(0,"灌奶",lesboMilkFilling).hint("与沙之母来一场女女性爱，让你的阴道被乳汁灌满！","灌奶");
         }
         else
         {
            addButtonDisabled(0,"灌奶","此场景需要你拥有阴道。");
         }
         if(get_player().hasCockThatFits(get_monster().vaginalCapacity()))
         {
            addButton(1,"干她",friendlySandMotherFuck).hint("用你的阴茎干沙之母的小穴。");
         }
         else
         {
            addButtonDisabled(1,"干她","此场景需要你拥有一根合适的肉棒。");
         }
         addButton(14,"返回",sandWitchMotherFriendlyMenu);
      }
      
      public function sendOutOrKeepInEnding() : void
      {
         outputText("[pg]沙之母点点头，宽容地回答道：[say: 很好。我会尊重你的请求，暂时如此。至于其他集会，我无法替她们保证，不过你不太可能误入她们的领地。等到我们崛起之时，就别指望我还会如此轻易地尊重你的要求了。无论你愿不愿意，我们都会以一切必要手段阻止恶魔女王。]");
         doNext(playerMenu);
      }
      
      public function sendOutCumWitch() : void
      {
         clearOutput();
         outputText("你请求她让精液女巫无尽的雄性精力与欲望为集会效力，放一些精液女巫出去，在沙漠中寻找新的成员。(<b>从现在起，你有几率在沙漠中遇到精液女巫。</b>)");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,853,1);
         sendOutOrKeepInEnding();
      }
      
      public function scissorAndDrink() : void
      {
         clearOutput();
         outputText("看着沙之母，你不由得感觉一股热流在下身翻涌；而当你靠近时，能感觉到阴阜上已经因期待而泛起湿意。这个曲线夸张的女巫，那些乳头已经把她的长袍顶成了四顶湿透的小帐篷；从她散发出的气味来看，她和你一样，已经准备好来点女人之间的亲热了。你捏住她的一只乳房，直到这个丰满得过分的女人发出呻吟，乳汁穿过丝质长袍喷涌出来，顺着胸部下方的弧线滴落。你用指尖接了一些，然后粗暴地塞进她那张还在抗议的嘴里，堵住她刚开始发出的无聊抱怨。");
         outputText("[pg][say:闭嘴。你和你们那一伙人除了给我添麻烦什么都没做。至少在我拿你爽的时候，你该乖乖配合，好好享受，]你低吼着，用力捏了一把她沉甸甸的胸口作为警告。");
         outputText("[pg]女巫女王在你抽回手指时喘息着，[say:你摧垮不了我，恶魔的奴隶！……但我已经没法再和你斗下去了。可你给我记住，你绝对摧垮不了我！]");
         outputText("[pg]随便吧。你揉捏着上面两只乳房，直到乳汁像河流一样淌到她最下方的胸脯上；乳白的奶液顺着薄薄的布料倾泻而下，把它浸得半透明又紧贴身体。沙之母暗色的脸颊微微泛红，看着自己胸口乳汁成河般涌出，毫无疑问还有更多正沿着衣物内侧滴落。你抓住她一颗饱满的乳头，从根部一路挤到顶端，让一股乳汁喷进你张开的嘴里。终于开始享受起来的沙之母呻吟着弓起背，把那沉甸甸、满是乳汁的胸口压进你的手里。你舔去唇上带着乳香的汁液。她的味道真棒！");
         outputText("[pg]你贬低她的产奶效率，直到这个高挑女人的眉头因愤怒而拧在一起。她抿起嘴正要反驳，你却猛地扑上去，抓住她的铂金色长发，将嘴唇狠狠压上她的唇，饥渴地把舌头塞进她口中，直到那些因怒气而僵硬的肌肉放松下来，变成安静而淫荡的顺从。她的眼睛渐渐闭上，舌头也迟疑地伸出，与你的舌头共舞。没过多久，你们几乎一刻不停地交换着唾液。你的双手愉快地抚摸着她湿透、沾满乳汁的肌肤，剥开她身上的遮蔽物，直到指尖能感受到那光滑肌肤在你的探弄下陷下去，她沉重的乳房也在你炽热的触碰中被挤压、晃荡。");
         outputText("[pg]你引着她的一只手摸向你的[armor]，稍稍退开片刻，在她耳边低语，[say:帮——]你又满怀热情地吻了回去，把自己的话堵在唇齿之间。这个不情愿的情人迟疑地摸索着你的[armor]几秒，直到你带着威胁意味地拧了一下她漏奶的乳头，惹得她呻吟出声。她的声音被你淫欲的嘴堵得含混不清，但她明白了你的意思，开始用颤抖的双手剥下你的装备；只有当你们放荡的缠吻变得过于激烈时，她才会停下。又拧了一下，她才继续动作。很快，你便赤裸着身子，被");
         if(get_player().get_tallness() < 85)
         {
            outputText("更高大的");
         }
         else if(get_player().get_tallness() > 105)
         {
            outputText("更娇小的");
         }
         outputText("女人搂在怀里，湿润滑腻的身体交缠在一起，你们彼此揉抓、摩擦。");
         outputText("[pg]你咬住这个迷人金发女人的下唇，力道刚好让她倒抽一口气。她的眼中除了受伤与愤怒，还有无法熄灭的炽烈决心。没关系。只要她能让你爽、让你喝到那些奶，她爱有什么决心就有什么决心！你一路亲吻她脆弱的颈项，接着把脸埋进她四只瓜般硕大的乳房正中央，在那四重乳沟间舔吻前行，直到一颗肥厚的乳头滴着奶蹭到你的脸颊。你把脸偏向一侧，直到它滑过你的嘴边，拖出一道乳汁的痕迹；你兴高采烈地吮吸起来，含着那颗粗大的乳头露出坏笑，而它主人的双手也不受控制地紧紧捏住你的[butt]。");
         outputText("[pg]她的两副阴唇已经热得几乎要贴着你的[leg]冒出蒸汽。她不断挪动身体，将它们压向你，在你的[skinfurscales]上留下一枚枚滚烫、湿滑、形似小穴的透明湿痕。你也因得不到满足的欲望而呻吟着，畅饮一大口美味的乳汁，同时把自己那座灼热的欲望熔炉压向曾经的敌人。她乳白色的大腿贴着你的阴户，感觉简直像天堂一样；你淫荡地把[clit]抵在她柔软的腿上研磨，直到能感觉到她的湿意开始滴进你的蜜穴。你那背叛意志的肌肉猛地将下流的小穴撞进沙之母丰沛而紧缩的胯间，你们两人的意识都被原始而感官的快感雪崩彻底淹没。");
         outputText("[pg]你拖着湿滑的阴户碾过那两只小穴，褶皱擦过褶皱，[clit]接连撞上一颗又一颗阴蒂。这场淫乱的磨穴交缠是一曲精妙绝伦的感官交响，你的[vagina]几乎贪婪地将其尽数饮下。滚烫的雌液从每一对紧贴的阴唇间涌出、泛起泡沫；当它们压上对面的那一对时，你脑中仿佛炸开烟火，让你除了在吞咽间含着嘴里渗奶的乳头呻吟、呜咽之外，什么也做不了。那位铂金发色的妖艳女子浑身发颤，似乎想要压抑自己的高潮，可你那沉溺享乐、追逐快感的下身却像是一心要让她的小穴彻底融化。");
         outputText("[pg]突然，乳汁的流量猛然增强，剩下三颗乳头喷出滚烫的乳白甘泉，洒遍你娇嫩的身躯；一波波黏腻的雌液也在你的[vagina]、[hips]和大腿上炸开。那滚烫的爱液在你的神经上爆裂，热度仿佛在你颤动的甬道里引爆了某种催情高潮炸弹。白热的爆发让你的肌肉在毫无理智的快感痉挛中时而绷紧、时而松弛。你湿滑的雌液");
         if(get_player().wetness() >= 5)
         {
            outputText("以震碎小穴般的喷涌炸裂而出");
         }
         else if(get_player().wetness() >= 4)
         {
            outputText("化作沉重的水花喷涌而出");
         }
         else if(get_player().wetness() >= 3)
         {
            outputText("化作浓稠湿润的河流倾泻而出");
         }
         else if(get_player().wetness() >= 2)
         {
            outputText("化作稳定的细流淌出");
         }
         else
         {
            outputText("在震碎小穴般的抽搐中滴淌而出");
         }
         outputText("。你的双颊被撑得淫乱地鼓起，几乎盛不住那股乳汁洪流，而你想也不想便将其吞下，完全凭本能行动。");
         get_player().refillHunger(40);
         outputText("[pg]两条有力的手臂环住你的后脑，把你的[face]更深地按进那片喷涌乳汁的胸肉里，逼得你别无选择，只能一边吮吸一边吞咽；与此同时，那些颤动的小穴也终于用液化的高潮把彼此彻底沐浴了一遍。你在过度敏感的极乐中轻哼着——吃饱喝足，也得到满足；每隔几秒，只要你的[clit]蹭到一道褶皱或另外两颗硬挺的小按钮，你就会颤抖一下。沙之母雕塑般的身体在你的攻势下逐渐越来越软，直到她仰面躺倒，而你的研磨又从她体内榨出最后几缕颤抖的快感火花。");
         outputText("[pg]几分钟后，你离开她被榨干的乳头，擦去下巴上的白色痕迹。这一下可真是正中要害。");
         outputText("[pg][say: 啊啊啊，]沙之母叹息着，瘫倒在一滩滩性爱留下的液体中，[say: 我说……说过了……你不可能——嗯嗯……弄垮我……]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,849) == 0)
         {
            outputText("[pg]女巫们已经被恰到好处地震慑住了，但你也毁掉了与她们友好和平相处的一切可能。");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,849,1);
         }
         else
         {
            outputText("[pg]她们或许不怎么瞧得起你，但把沙漠女巫女王变成一个只会娇声呜咽的荡妇，这种事永远不会腻。");
         }
         get_player().orgasm("Vaginal");
         dynStats(DynStat.Cor(1));
         if(!get_game().get_inCombat())
         {
            doNext(playerMenu);
         }
         else
         {
            get_combat().cleanupAfterCombat();
         }
      }
      
      public function savinMakesAwesomeFemdom() : void
      {
         clearOutput();
         if(get_player().get_HP() < 1)
         {
            outputText("你再也无法承受女巫的魔法攻势，倒在柔软温暖的沙地上。还没等你恢复过来，女巫已经压到你身上，强健的双腿跨坐在你的[hips]两侧。她纤长精致的手指扣住你的[armor]，把你的脸从沙子里拉起来，又将你翻过身，让你仰视着她。");
         }
         else
         {
            outputText("无法控制的欲火在你体内汹涌翻腾，心脏在你的[chest]下砰砰狂跳，你的[legs]也随之无力地瘫软。你的双手拼命抓挠着自己的[armor]，想要抚摸那饥渴的小穴，下体的火焰仿佛白焰般灼烧着你的血管。女巫俯身压近，你只能在无助的欲望中呻吟；她抓住你的双手，将它们从胯间拉开，又把你推倒在背上。片刻之后，她便压在你身上，用丰腴的大腿夹着你的[hips]跨坐下来。");
         }
         outputText("[pg]你被女巫压在身下，只能在她手中虚弱地挣扎。她慢慢脱下你的[armor]，让你的[chest]暴露在她出乎意料地柔软温柔的爱抚下。");
         if(get_player().bRows() > 1)
         {
            outputText("她抚摸着你的每一只乳房，逐一托在掌中，用拇指摩挲每颗乳头");
            if(get_player().lactationQ() >= 200)
            {
               outputText("，直到乳汁顺着你的胸口流下，这让她十分愉悦");
            }
            outputText("。");
         }
         else if(get_player().lactationQ() >= 200)
         {
            outputText("她灵巧的手指在你的[nipples]上游走，爱抚出一缕乳汁，随后用漫长而慵懒的动作舔入口中，让你被阳光亲吻过的肌肤仿佛通了电一般。");
         }
         else
         {
            outputText("她用灵巧的手指捻弄你的[nipples]，快感的战栗沿着你的脊背一路窜上，可她却似乎有些奇怪地不满……[say:不给我点奶吗？看来得想想办法了……]");
         }
         outputText("她缓缓从你的[chest]一路向下移到腹部，一边脱去你的[armor]，一边让更多[skinfurscales]暴露出来；她的双手始终不忘在你全身游走，抚摸并亲吻每一寸裸露的肌肤，直到来到你的胯间。出于本能，你在她掌控中扭动起来，而她将你身上最后一件[armor]扔到一旁，让你彻底赤裸地躺在她双腿之间。");
         if(get_player().hasCock())
         {
            outputText("[pg][EachCock]半硬地挺着，贴在你的腹部。精液女巫咧嘴一笑，敞开自己的长袍，让衣料挂在肩头，露出她自己的本钱。她的肉棒是一根巨大而跳动的肉柱，沉甸甸地垂落在你的肉棒上，");
            if(get_player().longestCockLength() < 10)
            {
               outputText("让你相比之下小得可怜的短棒都黯然失色");
            }
            else if(get_player().longestCockLength() < 15)
            {
               outputText("几乎与你自己的[cock]不相上下");
            }
            else
            {
               outputText("与你怪物般的巨根相比显得十分渺小");
            }
            outputText("。她轻笑着，用一只手同时握住你和她的肉棒，试探性地套弄了几下，并用臀部轻轻碾磨着你。她和你互相摩擦了好一阵，让你在她粗大的肉棒滑过你敏感的阴茎肌肤时颤抖扭动……但这种阴茎带来的快感只持续了几分钟，很快，女巫的注意力便转向别处——你肉棒下方那道女性的裂缝。");
         }
         outputText("[pg]女巫满怀欲望地舔了舔乌黑的嘴唇，");
         if(get_player().isGoo() || get_player().isDrider() || get_player().isTaur() || get_player().hasTailInsteadOfLegs())
         {
            outputText("顺着你非人的身体向下挪去");
         }
         else
         {
            outputText("分开你的双腿，把它们架到她肩上，让你的双脚垂在她身后");
         }
         outputText("。她握住自己那根巨大而跳动的肉棒，一只手漫不经心地套弄着，另一只手则抚过你的大腿，探索你的胯间和你女性部位周围敏感的肌肤。她的一根手指意外地纤巧，滑过你的外唇，绕着你的穴口打转，直到擦过你的[clit]，让一阵快感猛地贯穿全身；一缕女性的蜜液随着她的触碰从你下身渗出，润湿了她的手指，使其在沙漠的阳光下泛起光泽。女巫故意把那根发亮的手指送到唇边，用指尖划过她丰满的黑唇，然后用舌头极其漫长而细致地舔舐起你的淫液，很快便像吮吸一根沾满你汁液的纤细小肉棒那样含住了自己的手指。");
         outputText("[pg]女巫缓缓将注意力转回你颤抖的[vagina]。她的肉棒此刻平贴在你的腹部，灼热地悸动着，你能轻易透过那根蓄势待发的阳具感受到她的心跳，一股稳定的前液正满怀期待地淌过你的胸口，迎接即将到来的交合。女巫向后仰身，让她的阴茎沿着你的身体向下滑去，直到粗大的龟头擦过你的[vagina]，你尽可能做好了承受的准备。你浑身一颤，一半是期待，一半是充满欲望的渴求；当她推入时，你颤巍巍的小穴中那些渴求肉棒的肌肉轻易便在她的触碰下放松下来，最初几寸女巫之棒将你的阴道壁撑开，顺从地接纳这根支配性的肉棒，子宫也准备好受孕，吸尽精液女巫强健腰间的每一滴种子。");
         outputText("[pg][say:真乖，]女巫柔声哄着，一边抚摸你的[hair]，一边缓慢而温柔地进入你，她宽阔的臀部将那根悸动的肉棒一寸接一寸推入你的小穴。");
         get_player().cuntChange(get_monster().cockArea(0),true,false,true);
         outputText("突然，女巫用手指勾住你的后颈，把你从沙地上提了起来。你不安地喘了一声，直到她把你的头引向她巨大的乳房——那里已经因期待而开始渗出乳汁。她对你微笑，出人意料地温柔，将你的脸颊埋进她宽阔乳沟的深谷里。一股突如其来的原始本能攫住了你，你环住女巫的腰，紧紧抱住她。女巫被你突然的举动惊得喘了一声，但很快像你在她怀里那样放松下来，任由你支撑住自己，同时她为你捧起一只乳房，将滴着奶的乳头引到你唇边。你急切地含住它，第一滴甜美浓郁的乳汁流进你等待的口中时，你的呼吸都为之一滞。你像婴儿一样吮吸着女巫，吞饮她那美味的乳汁，任其灌入体内。女巫大声呻吟，头向后仰去，乳汁不断流入你口中，她外扩的臀部终于压上你的身体，那根惊人的肉棒完全埋进你体内，龟头亲吻着你宫颈的唇。[say:真乖，]她重复道，抚摸着你的头发和被乳汁撑鼓的脸颊，除此之外仍与你维持着这场性爱中的拥抱。");
         outputText("[pg]女巫慢慢开始摆动臀部，只从你下身抽出几寸便又滑回去，你的润滑液和她不断流淌的前液从她肉棒周围溢出，弄脏了沙漠的沙地。配合着你的吮吸，她抽插你的[vagina]，一次又一次顶入，将你紧紧抱在怀里，让越来越多的前液灌入你饥渴的子宫。她低沉地呻吟着，闭着眼，额头靠着你的头，炽热而沉重的呼吸扑在你裸露的肌肤上。");
         outputText("[pg]此刻，女巫几乎像是沉溺在极乐之中……也许你可以反客为主，最后骑到她身上？不过，她是如此温柔，而她的乳汁又是那么、那么美味……当她让你受孕，把精液和乳汁灌满你时，你真的还想抗拒她吗？");
         menu();
         addButton(0,"反抗",resistSavinStuff);
         addButton(1,"不反抗",doNotResistSavin);
      }
      
      public function sanuraCunnilingus(param1:Boolean = false) : void
      {
         clearOutput();
         outputText("萨努拉仰面躺在一块开裂的砂岩石块旁。斯芬克斯朝你招了招手，带着邀请的意味，你开始慢慢地[if (isnaked) {踱过去|脱下你的[armor]，露出更多[skinfurscales]，直到全身赤裸}]。她看了看你，又低头看向自己的胯间，同时舔了舔嘴唇。[if (" + ("" + param1) + ") {[say:希望你明白我的暗示，]|[say:我任你享用，]}]她用俏皮的语气说道。");
         outputText("[pg]当你俯身靠近她的小穴时，她向你投来鼓励的目光。你试探性地舔了舔她的阴户，尝到了一种奇怪的味道——像是香草和无花果混合在一起。[say:惊讶吗？你不该惊讶的。你大概已经知道了，我可以随心所欲地扭曲现实。]她的眼神催促你继续。你的[tongue]探入她那令人愉悦的小穴，缓缓拨开她的阴唇，舔起越来越多带着味道的淫液。过了一会儿，你开始把一些注意力放到她的阴蒂上，但她似乎仍然不满意你的表现。");
         outputText("[pg][say:看来你需要一点鼓励……]她坏笑着说道。她的手指开始舞动，在空中画出一道道蓝色的魔法线条。法术完成后，她抓住你的头，把它埋进自己的胯间。当她的下体占满你的视野时，你感觉有什么东西在试探你的[asshole]；一个幽灵般的物体挤了进去，令一阵阵快感震颤着传遍全身。你已经快要射了，可还没来得及释放，就感觉到魔法包裹住了你的胯间。[say:我可不能让你先结束。只是确保你有足够的动力，]她诱惑地说道。");
         get_player().buttChange(10,true,true,false);
         outputText("[pg]一根虚幻的阴茎正顶进你的肛门，而你的[genitals]又被她的魔法牢牢掌控着，情欲的热浪彻底吞没了你，你以全新的热情向她的小穴发起进攻。你的舌头舔遍她的下体，整个身体前后晃动，把脸在斯芬克斯湿润的下体上不断摩擦。你振作起来的努力似乎终于达到了她的高标准，萨努拉发出一声轻轻的呻吟。");
         outputText("[pg]突然间，你感觉空气中又涌起更多魔力。你抬起眼睛，只见另一根奥术阳具在你上方成形，随后朝你的[butt]飘来。第二根魔法肉棒挤进体内时，你微微扭动了一下。两根假阳具撑开你的肛门，让你口中开始泄出带着快感的呜咽呻吟，可这声音很快就被打断——你的脸再次深深埋进了萨努拉的小穴里。");
         outputText("[pg]随着你的肛门被越撑越开，你也加倍努力，想要迎来释放。你能感觉到斯芬克斯也越来越接近高潮；当她打破沉默，发出一声响亮的呻吟，并更快地把小穴在你脸上磨蹭时，你的预感得到了证实。两根假阳具配合着动作，将一波又一波快感送遍你的身体——可她的魔法依旧愉悦地阻止着你的高潮。又是一阵疯狂舔舐后，那些阳具——响亮地拍打着你的肉体——变得更粗，萨努拉的呻吟也越来越响，她还用兽类的后腿牢牢夹住了你的头。");
         outputText("[pg]突然，你听见一声响亮的啪声，感觉包裹着你生殖器的魔法消失了。被压抑许久的高潮猛烈喷涌而出，与此同时，萨努拉也发出一声狮子般的吼叫，随之达到高潮，用她带着奇异风味的淫液淹没了你的脸。她高潮时仍牢牢把你的脸按在她的下体上，而那些假阳具合并成了一根巨大的魔法肉棒，用奥术精液灌满了你的体内。等它彻底把你填满后，便溶解消散，留下突然而强烈的空虚感；但这种感觉很快就被压了下去，因为魔法开始制造出更多液体，把你从里到外灌得满满当当。");
         outputText("[pg]她终于放开了你，但你还站不起来——刚才的折腾让你仍在喘息和颤抖。尽管直肠里压力沉重，她召出的液体仍惬意地留在你体内。于是，你疲惫而被填满地趴在萨努拉的肚子上躺了好一会儿，脸上挂着傻乎乎又满足的表情。");
         outputText("[pg]萨努拉用一只前爪亲昵地拍了拍你的头。[say:希望你和我一样玩得开心。]你能给出的回答，也只有在用仍有些发软的[feet]站起身时，向她露出一个肯定的微笑。");
         get_player().orgasm("肛门");
         if(param1)
         {
            get_game().inDungeon = false;
            doNext(get_camp().returnToCampUseOneHour);
         }
         else
         {
            menu();
            addButton(0,"进入",openZeDoorToParadize);
            addButton(14,"离开",exitDungeon);
         }
      }
      
      public function sandWitchMotherFriendlyMenu() : void
      {
         var price1:int;
         var iType1:ItemType;
         var _g1:DesertCave;
         var price:int;
         var iType:ItemType;
         var _g:DesertCave;
         menu();
         addButton(0,"外貌",sandMotherAppearance);
         addButton(1,"交谈",sandMotherTalk);
         _g = this;
         iType = get_consumables().LABOVA_;
         price = 25;
         addButton(5,"购买拉波娃",function():void
         {
            _g.buyPotion(iType,price);
         }).hint(get_consumables().LABOVA_.get_description());
         _g1 = this;
         iType1 = get_consumables().LACTAID;
         price1 = 50;
         addButton(6,"购买催乳剂",function():void
         {
            _g1.buyPotion(iType1,price1);
         }).hint(get_consumables().LACTAID.get_description());
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,866) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,864) == 0 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,871) > 0 && !get_game().milkWaifu.milkSlave())
         {
            addButton(7,"解放奴隶",slavesDiscussion).hint("请求沙之母释放一名奴隶。");
         }
         if(get_player().get_lust() >= 33)
         {
            addButton(8,"做爱",sexWithFriendlySandMother).hint("和沙之母共度一段香艳时光。");
         }
         else
         {
            addButtonDisabled(8,"做爱","你的性欲还不够高。");
         }
         setExitButton("离开",playerMenu);
      }
      
      public function sandWitchMobNotBadEnd() : void
      {
         clearOutput();
         outputText("几个小时后，你在地牢外醒来，所有东西都还在，竟然连宝石也一颗没少。");
         get_game().inDungeon = false;
         get_player().orgasm("Vaginal");
         dynStats(DynStat.Lib(1),DynStat.Sens(-1));
         get_combat().cleanupAfterCombat();
      }
      
      public function sandWitchMobBadEnd() : void
      {
         clearOutput();
         outputText("当你的脑子终于开始理清状况时，你发现自己躺在一张床上，屁股、小穴，还有其他地方都酸痛得超乎记忆。你揉着隐隐作痛的部位，注意到床边坐着一个披着斗篷、戴着宽檐尖顶帽的身影，正读着一本白色的书。那人见你从沉睡中醒来，便在书里夹上书签，把它放到旁边的床头柜上。");
         outputText("[pg][say: 早上好，姐妹，睡得还好吗？]");
         outputText("[pg]姐妹？你跟这个女孩可没有血缘关系……对吧？");
         outputText("[pg][say: 看来你又误闯公共厅了。你知道的，在学会所有法术之前，你不该去那里的。那些女孩会把你操到生疼……而她们也确实这么做了。]");
         outputText("[pg]哦对，你怎么会忘了这种事呢？之前都被提醒过几百次了，别靠近那个地方。好吧，以你现在每个洞都又酸又疼的样子，短时间内你肯定忘不了了。");
         outputText("[pg]披着斗篷的女孩站起身，把毯子从你赤裸的身体上扯开。你有着古铜色的皮肤、沙金色的头发、两个酸痛的小穴，还有三排大小相当、正渗着乳汁的乳房。披斗篷的女孩递给你一面镜子，让你看看自己。没错，你有一张普通的女性人类面孔，就像你这辈子一直以来那样……对吧？");
         outputText("[pg]她扶你下了床，你也更清楚地看见了她的脸，那肤色几乎和她身上的斗篷与尖帽一样深。黑肤女孩提醒你，在学会法术之前，你不能离开圣所。接着，她把你拉近，说明在那之前，你永远别想体验一场像样的性交，也别想尝到她的精液。你低头看向她长袍的胯间，发现那里撑起了一顶相当巨大的帐篷。你向这位本钱雄厚的双性人保证自己会尽力而为，她在你的[butt]上友好地拍了拍又抓了一把，而你则跑回去继续开始学习。");
         outputText("[pg]<b>几个月后……</b>[pg]");
         outputText("经过数周刻苦学习，你终于掌握了成为沙漠女巫所需的一切知识。你得到了沙漠色的长袍，被允许加入公共厅里的其他女巫，甚至可以离开圣所。在与精液女巫的第一次会面后，你惬意地到外面散步，精液从你的两个小穴里淌出来，顺着双腿流下，留下一道湿漉漉的痕迹。你第一次迈步走向这个世界时，感觉有点似曾相识。你只是摇摇头，把这种感觉甩到一边。");
         outputText("[pg]你在沙漠里游荡了一阵，一边低声念着关于自己是谁、想做什么的自我介绍。然后，你看见有个身影正沿着沙丘行走。好，该向对方展示你的本事了。你走到那人面前，报上自己的身份：");
         outputText("[pg][say: 打扰一下，我是沙漠女巫，可以对你施一个法术吗？]");
         get_player().set_HP(get_player().maxHP());
         get_game().gameOver();
      }
      
      public function sandWitchHistory() : void
      {
         clearOutput();
         outputText("你询问沙漠女巫的历史，以及她们是如何诞生的。沙之母对你露出温和的微笑，提议道：[say:乐意之至。能把这个故事讲给我们教团之外的人听，可是十分难得。]她低声念出几句蛛网般细碎的词语，它们似乎在你耳边回响；随后，一个发光的悬浮幻象出现在她面前，尽是些漂浮着、无定形的色彩。当她开始讲述时，那些色块便变成了她故事中的角色，让你得以亲眼旁观故事的发生。");
         outputText("[pg][say: 二十多年前，玛瑞斯还是另一番模样。沙漠只有如今很小的一部分，各种规模、各种来历的部族遍布各地。在有些地方，你几乎走不了多远，就会撞见某座城镇、贸易站或村庄。一座由人类法师建立的小城在山顶上兴起，他们是远古定居者的后裔。沙漠女巫与恶魔，都是从这一脉中诞生的。] 沙之母皱起眉头，像是咽下了一颗酸葡萄，显然很不愿意承认自己与那样可憎的敌人同出一源。");
         outputText("[pg]你被勾起了兴趣，追问这两个人类派系究竟是如何诞生的，以及这些女人为什么会长出双重胸部。沙之母点点头，继续说道：[say: 的确是个值得一问的问题。关于那场大堕落的细节当然已经有些模糊了，但我的母亲——伟大母亲，以及我一些年长的姐妹都亲身经历过。我还没能从她们任何一人口中撬出一份详尽的叙述。我只知道，那次堕落当时被欢呼为同时发现了永生与庞大的魔法力量。在短短几个小时内，大多数人便欣然抛弃了自己的灵魂，以换取更强的力量，并摆脱衰老的暴政。伟大母亲没有这么做。]");
         outputText("[pg]这位蓝眼睛的讲述者愉快地轻笑着，兴致勃勃地叙述道：[say: 当她看见自己的爱人被那股力量改变时，她便把女儿们送走了，自己也没有加入那场放纵。她向新生的恶魔们承诺，等她确认没有任何弊端之后就会加入他们。那时，他们正陶醉于新获得的力量之中，并不太在意有几个蠢货要磨蹭多久才肯加入。毕竟，他们许诺的是无穷无尽的欢愉与力量，谁能抗拒呢？我的母亲便利用这段疏忽，研究他们的特征与魔法，并在逃离时带走了这些知识。她消失在无路可循的沙海之中，让风掩盖她一家穿越沙丘的踪迹。抵达那里后，她利用他们的黑暗巫术改造了自己的身体，以便供养自己。她的能力将大地本身塑造成了居所，而沙之母也开始精研自己的技艺，将所知的一切传授给女儿们。]");
         outputText("[pg]真是引人入胜。所以二十年前，一位母亲和她的女儿们逃离了新生的恶魔，而她们繁衍得如此之快，如今已经成了一支军队？这实在令人难以置信，你也照实这么说了。");
         outputText("[pg][say: 哦，我知道，这听起来像是短时间内发生了大量近亲繁殖，但事实并非如此。我们也寻找过其他异见者，尽管我们的人数并不多。没过多久，他们也开始从母亲大人的角度看待事情了。她可以……相当有说服力，] 这位高贵的女巫说道，目光变得有些遥远。她轻轻一颤，又继续说道：[say: 此外，传送门也开始在世界各地开启。大多数传送门里都陆续来了些新人，我们尽力救下了能救的人。短短两年内，第一支女巫集会便已经人满为患，而我们的血统也足够多样，得以正式开始繁衍。]");
         outputText("[pg]女巫继续讲述时，一只手无意识地垂向平滑的腹部：[say: 我们之中有少数人被选为精液女巫，成为部族繁育能力的承载者。她们学习了生育与繁殖的魔法，使我们能够以惊人的速度生产并成熟。其余的人则成为容器或采集者，用一切必要手段扩充我们的人数。最终，我们认为分散族群才是明智之举，于是第二支女巫集会便诞生了。此后，我们如野火般扩散，繁衍、藏匿，并尽可能招募一切可用之人。当然，凡是被我们发现的恶魔，都被处理掉了。]");
         outputText("[pg]好吧，你觉得这倒也算说得通，但这些女巫又是如何抵抗腐化的？");
         outputText("[pg]沙之母笑着解释道：[say: 这个比你想的要简单。玛瑞斯的巨蜂对腐化有极高的抗性，甚至它们纯净、未经稀释的蜂蜜还会主动对抗腐化。经过适当处理后，这种琥珀琼浆可以被蒸馏成一种不会改变饮用者身体，却仍能清除体内腐化的形态。我们与巨蜂建立了贸易关系，为她们充当孵化器，以换取蜂蜜。为了维持理智，忍受这点小小的屈辱并不算什么。遗憾的是，我们与繁育阶级的联系已经沉寂了，我们担心蜂巢可能出了什么事。我们储备的琼浆足够满足自身所需，但必须谨慎配给。]");
         outputText("[pg]你点点头，询问如果你带来纯净蜂蜜，她们是否愿意为你蒸馏，以供你使用。沙之母回答道：[say: 当然。] 她微微颔首，最后说道：[say: 能说的也差不多就这些了。我们成长，我们扩散，如今已有许多沙之母。恶魔夺走过一两支女巫集会，但我们分散的结构保护了我们。我们经常歼灭那些愚蠢到来追猎我们的巡逻队，但这似乎阻止不了他们。你还有别的事想问吗，[name]？]");
         sandWitchMotherFriendlyMenu();
      }
      
      public function sandMotherTalk() : void
      {
         menu();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,854) == 0)
         {
            addButton(0,"停止袭击",leaveAloneSendLackeysToggle).hint("你已经受够沙漠女巫了。她们该别再来烦你。","停止袭击");
         }
         else
         {
            addButton(0,"开始袭击",leaveAloneSendLackeysToggle).hint("告诉沙之母，你想再次遇到沙漠女巫。","开始袭击");
         }
         addButton(1,"沙之母",askHowSandMothersAreChosen).hint("询问沙之母是如何被选出来的。","沙之母");
         addButton(2,"精液女巫",discussCumWitches).hint("向沙之母询问精液女巫的事。");
         addButton(3,"女巫集会状态",currentStateOfInterwebs).hint("向沙之母询问女巫集会的现状。","女巫集会状态");
         addButton(4,"历史",sandWitchHistory).hint("向沙之母询问沙漠女巫的历史。");
         setExitButton("返回",sandWitchMotherFriendlyMenu);
      }
      
      public function sandMotherStuffGOA() : void
      {
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,838) > 0)
         {
            outputText("当你走进沙之母的王座室时，她朝你的方向微微颔首。她和你记忆中一样威严，至少，一个胸前挂着四只西瓜大小巨乳的女人能有多威严，她就有多威严。[say:你回到我们这里了，远方的旅人。你想从沙之集会这里得到什么吗？只要说出你的所需，我们便会助你对抗恶魔女王。]这位痴迷泌乳的大附魔师随手将一缕白金色卷发拨出眼前，等待着你的答复。");
            sandWitchMotherFriendlyMenu();
            return;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,847) > 0)
         {
            outputText("沙之母坐在王座上居高临下地瞪着你，但在先前那次败北之后，她已经不敢再对你动一根手指。她嘶声说道：[say:你已经洗劫过我的集会了！你还想从我们这里得到什么？]与此同时，她的胸口因惊慌而剧烈起伏。四座山峰从女巫的丝袍下高高顶起……你有了几个主意，而这位女巫女王似乎也有自己的想法。");
            outputText("[pg]沙之母在王座上畏缩着向后靠去，警惕地打量着你。看来你已经给自己树了个敌人，不过至少这个敌人畏惧着你。在她的王座后方，有一只装满拉·博娃和催乳剂药水的箱子");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,850) >= 5)
            {
               outputText("，不过现在里面空空如也。你得等她们重新补货");
            }
            else
            {
               outputText("，而且没人能阻止你把它们拿走");
            }
            outputText("。");
            sandMotherPOMenu();
         }
         else
         {
            outputText("斜倚在一张雕刻繁复的王座上的，是一位只能称作沙漠女巫女王的存在。这个气势逼人、雕像般的女人站起来时肯定超过八英尺高，丝绸长袍下四峰西瓜大小的乳房清晰可见，三英寸长的乳头高高挺立着。白金色的长发垂到肩头，颜色浅得几乎发白。她用一双异样发光的眼睛居高临下地瞪着你。她的虹膜纯白而明亮，只剩黑色的瞳孔盯着你。她问道，[say: 所以，就是你把我的姑娘们搅得不得安宁？]");
            outputText("[pg]女巫女王将十指指尖相抵，隔着手指打量着你。[saystart]好吧，你为何闯入我的女巫集会？");
            if(get_player().cor >= 66)
            {
               outputText("你身上散发着腐化的臭味，但我依然能感到你体内还有灵魂。你还不是恶魔……至少现在还不是。");
            }
            else
            {
               outputText("你身上的腐化臭味并不算太重，不像这片土地上的许多人那样，但这并不代表你就不是莉希丝的走狗。");
            }
            outputText("解释你的所作所为，异教徒，否则我就把你像莉希丝的恶魔一样从这间厅堂里驱逐出去。[sayend]");
            outputText("[pg]这个女人……她看起来随时都会出手。你最好谨慎选择自己的行动。你是直接解释自己的处境？还是先跟她打一场，之后再解释？");
            menu();
            addButton(0,"解释",explainYourSelfToZeSandBitch).hint("试着向沙之母解释你不是恶魔。");
            addButton(1,"战斗",fightTheSandWitch).hint("去他的。和沙之母打一场！");
         }
      }
      
      public function sandMotherPOMenu() : void
      {
         var lactaid1:Boolean;
         var _g1:DesertCave;
         var lactaid:Boolean;
         var _g:DesertCave;
         if(get_monster() == null || get_monster().get_short() != "Sand Mother")
         {
            set_monster(new SandMother());
            get_monster().set_HP(0);
         }
         menu();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,854) == 0)
         {
            addButton(0,"停止攻击",unfriendlyWitchToggle).hint("你已经受够沙漠女巫了。她们应该别再来烦你。","交谈：停止攻击");
         }
         else
         {
            addButton(0,"开始攻击",unfriendlyWitchToggle).hint("告诉沙之母，你想再次遭遇沙漠女巫。","交谈：开始攻击");
         }
         addButtonDisabled(1,"剪刀式","此场景需要你拥有阴道，并且性欲足够高。");
         addButtonDisabled(2,"触手群交","此场景需要你拥有至少五根触手肉棒，并且性欲足够高。");
         addButtonDisabled(3,"干她","此场景需要你拥有一根合适的肉棒，并且性欲足够高。");
         if(get_player().get_lust() >= 33)
         {
            if(get_player().hasVagina())
            {
               addButton(1,"剪刀式",scissorAndDrink).hint("来一场女女性爱，再喝点奶。");
            }
            if(get_player().countCocksOfType(CockTypesEnum.TENTACLE) >= 5)
            {
               addButton(2,"触手群交",tentacleGangBang).hint("用你的触手肉棒干沙之母。","触手群交");
            }
            if(get_player().hasCockThatFits(get_monster().vaginalCapacity()))
            {
               addButton(3,"干她",fuckTheSandMothersCunt).hint("用你的肉棒干沙之母的小穴。");
            }
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,850) < 5)
         {
            _g = this;
            lactaid = false;
            addButton(5,"拿拉波娃",function():void
            {
               _g.takeLaBovaOrLactaid(lactaid);
            }).hint(get_consumables().LABOVA_.get_description());
            _g1 = this;
            lactaid1 = true;
            addButton(6,"拿催乳剂",function():void
            {
               _g1.takeLaBovaOrLactaid(lactaid1);
            }).hint(get_consumables().LACTAID.get_description());
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,866) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,864) == 0)
         {
            addButton(7,"埃斯蕾尔",get_game().forest.essrayle.askMotherToReleaseEssy).hint("请求沙之母释放埃斯蕾尔。");
         }
         addButton(14,"离开",playerMenu);
      }
      
      public function sandMotherBadEndsLadiesEpilogue() : void
      {
         clearOutput();
         outputText("勇者醒来时，发现身体已经变了。[His]身体被转化成了沙漠女巫的模样。");
         if(get_player().bRows() > 2)
         {
            outputText("不过，与其他沙漠女巫不同的是，她还多长了几对乳房，并将这个优势发挥到了极致。");
         }
         if(get_player().biggestTitSize() >= 22)
         {
            outputText("凭借天生无比硕大的乳房，她产奶的能力无人能及，其他姐妹根本望尘莫及。它们大到常常妨碍她行动，不过说实话，她对此并不怎么介意。");
         }
         outputText("[pg]在她所能记得的记忆里，她的人生不过是在十年前才开始的。她迅速成长，在五岁时便已准备好为沙之母的女巫集会效力。她热切地献出自己的乳汁，并用两个子宫尽可能孕育更多新的姐妹。");
         if(get_player().hasPerk(PerkLib.BroodMother))
         {
            outputText("她很快便展现出一种独特的天赋：怀孕速度极快，产下新姐妹的效率是其他沙漠女巫的两倍。她那出人意料地多产的子宫，让沙之母的计划更添了一份优势。");
         }
         if(get_player().hasPerk(PerkLib.BroodMother) && get_player().biggestTitSize() >= 22)
         {
            outputText("结果，那个再也想不起自己真正过去的勇者，几乎只剩下一个巨大的孕肚，周围环绕着" + Utils.num2Text(get_player().bRows()) + "只硕大无比的乳房。其他沙漠女巫常常把她的奶子当成舒适的坐垫坐在上面，用大腿紧紧夹住每一颗巨大的乳头，让它们抵在自己饥渴的小穴上取乐。");
         }
         outputText("[pg]两年后，响应伟大母亲的召唤，沙漠女巫们走向了战争。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,493) == 0)
         {
            outputText("她们的鹰身女妖与不死鸟盟友让她们得以畅通无阻地逼近莉希丝的要塞，而在");
         }
         else
         {
            outputText("在");
         }
         outputText("玛瑞斯有史以来最血腥的一战中，恶魔被击败，在白色烈焰中从这个世界上被彻底抹去。在随后的岁月里，各个女巫集会致力于纠正世上的一切错误。仍有许多恶魔残存，但它们的影响力正在衰退。世界继续向前，而那些幸存者也明智地躲藏了起来。");
         outputText("[pg]沙漠女巫们将沙漠化作丛林乐园。尽管她们没有腐化的污秽，却从未停止过以激进手段吸纳新血的政策。许多人像勇者一样被洗脑后投入效力，但和平确实降临在了玛瑞斯。那个没有答案的问题依旧存在：一个由淫荡奶巫统治的世界，真的比之前那个“腐化”的世界更好吗？");
         get_game().gameOver();
         removeButton(1);
      }
      
      public function sandMotherAppearance() : void
      {
         clearOutput();
         outputText("你面前这位女子举止威严，显然是沙漠女巫集会的领袖。她身高超过[if (metric) {250厘米|八英尺}]，即使没有那过分丰腴的身体，也依旧显得气势逼人。她两对沉甸甸的乳房，以及仿佛渴求着受孕的丰满臀胯，让她看起来就像一位丰饶女神；而那一头飘逸白发与洁白轻盈的长袍，更是衬托了这种气质。");
         outputText("[pg]当她发现你在打量自己时，那双幽灵般苍白的眼睛里射出的锐利目光，分明是在催你赶紧办正事。");
         button(0).disable();
         get_output().flush();
      }
      
      public function roomWestHall2() : void
      {
         clearOutput();
         outputText("<b><u>西部地穴主厅（西段）</u></b>\n");
         outputText("光滑的隧道到这里便到了尽头，被无处不在的砂岩堵住。蓝宝石般的光辉在粗凿的石面上流转，显得格外美丽，但你并没有花时间细想。向东，那条拱形走廊通往洞穴里一处宽阔的公共区域。南北两侧的墙上各有门大小的开口，被做工精细、布料厚实的织毯挡住。它们连一丝缝隙都没留下，光线和声音都无法渗进大厅。要是你想知道里面发生了什么，就得亲自探头看看。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,863) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,772) > 0)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,866,1);
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,864) > 0)
            {
               outputText("[pg]<b>你的注意力立刻被埃斯蕾尔吸引过去……</b>");
               menu();
               addButton(0,"继续",get_game().forest.essrayle.essyWitchVictory);
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,863,1);
               return;
            }
            outputText("[pg]这个房间里等着你的，是一幅相当不同寻常的景象。坐在一只超大花盆里的，似乎正是你早些时候遇到的那个胸部过分丰满的植物女孩，埃斯蕾尔。不过自你上次见到她以来，她已经变了很多。她那张非人般光滑、精灵似的脸似乎没有变化，但她翠绿的身体其余部分，却像是被扭曲成了一尊极度色情化的生育神像，特征中还带着那个游牧沙漠女巫部族的影子。");
            addButton(0,"埃斯蕾尔",get_game().forest.essrayle.approachTrappedEssy).hint("接近植物女孩埃斯蕾尔。");
         }
      }
      
      public function roomWestHall1() : void
      {
         clearOutput();
         outputText("<b><u>西部地穴主厅（东段）</u></b>\n");
         outputText("东边随处可见的超自然光辉在这里同样存在，只是数量更少，亮度也大为减弱。蓝白色的光涡沿着天花板缓慢而有节奏地滑动，与前一个洞窟中欢快飞舞的光芒形成鲜明对比。这里有些地方的天花板将近十二英尺高，而东西向通道两侧则压得最低。正如你对沙漠洞穴的预期，这里的地面是砂岩，不过上面铺了大量编织地毯，几乎将其遮住。沙漠女巫们忙着差事来来往往，只会停下脚步，兴致缺缺地瞥你一眼。她们大多显出怀孕的迹象，或是牵着年幼女孩。无论如何，这些女人似乎都没有战意。南北两侧的墙边分布着一些门大小的小洞口，厚重的帘幕垂在上面，足以轻易隔绝任何声响。往西，隧道毫无阻碍地继续延伸。而往东，洞穴则敞开成一座大得多得多的房间。");
      }
      
      public function roomSleepingChamber() : void
      {
         clearOutput();
         outputText("<b><u>东部地穴，西段北侧（寝室）</u></b>\n");
         outputText("这间宽敞而舒适的房间里摆着几十张床，排列得整整齐齐，只有少数几张小床大胆地挨在一起，稍微破坏了整体的规整。显然，这里是部族主要的睡眠区域。厚重的手织地毯遮住了地面，柔软地蹭过你的[feet]。屋内并没有你已经习以为常的幽灵般光源，而是由一盏盏类似灯笼的玻璃嵌板构造物照亮。当然，这些灯里没有燃料或灯芯，只有仿佛火焰般被困住的摇曳幻光。百叶片可以调暗灯光，不过眼下这里只有你一个人，没必要把视野弄得更差。东边有一扇门，南边则有个被帘子遮住的开口。");
      }
      
      public function roomSandMotherThrone() : void
      {
         clearOutput();
         outputText("<b><u>沙之母王座</u></b>\n");
         outputText("这个房间由旋转的魔法色彩漩涡照亮，每一种色彩都与另一种色彩协调地交织起舞。墙壁由凿成形的砂岩砌成，镶嵌着象牙雕纹，看上去似乎描绘的是流动的牛奶。前方有一张巨大的白色王座，同样由象牙制成，是一件极其华美的工艺品。很显然，你已经找到了首领的王座厅。王座上有一个身披长袍的身影。");
         addButton(0,"上前",sandMotherStuffGOA).hint("接近沙之母。");
      }
      
      public function roomSacrificalAltar() : void
      {
         clearOutput();
         outputText("<b><u>献祭祭坛</u></b>\n");
         outputText("这个房间显然对女巫集会有着某种重要意义。地板和墙壁都铺满了闪亮的白色反光瓷砖，房间外围摆着大量雕刻精美的壶。整个地方都隐约散发着牛奶的气味。你嗅了嗅，朝香气的源头靠近。气味来自你正前方的房间中央，看起来像是一口金色水井的东西。那些容器里也隐约飘着这种白玉般美味的气味，而且奇怪的是，你闻不到一丝变质的酸臭；一切都像新鲜的一样。这里一定有某种魔法在发挥作用。你探头越过井沿，勉强看见下方似乎储存着一片牛奶之海：泛着白沫的象牙色浪潮在一个巨大到看不见墙壁的空间里翻涌。它一定是通过魔法保存下来的。");
         outputText("[pg]南边有一道门，北墙上也有一道。");
      }
      
      public function roomPlayRoom() : void
      {
         clearOutput();
         outputText("<b><u>西部地穴，东段，北侧（儿童游戏室）</u></b>\n");
         outputText("厚重的帘幕后，是你最意想不到的景象。这里有将近一打孩子，还有三个胸部丰满、身怀六甲的沙漠女巫在看着她们。金发的小孩子们把玩具撒得到处都是。你闯进来时，她们的看护正忙着织东西，但她们立刻恶狠狠地瞪着你，做出驱赶的手势。除非你原本打算抢孩子的玩具，再揍一顿孕妇，否则这里没什么可拿的。");
      }
      
      public function roomPharmacy() : void
      {
         clearOutput();
         outputText("<b><u>西部地穴，西段，南侧（药房）</u></b>\n");
         outputText("这个房间小得几乎勉强才能被称作房间。真要说的话，它更像是一个小巧舒适的壁龛。这里没有其他人，不过房间同样被这座奇妙小洞穴中无处不在的魔法照亮。南侧墙边，一只巨大的柜子像是在静静守望，高高矗立在你面前，几乎一直延伸到天花板。它整洁得近乎不可思议，每一个抽屉都严丝合缝地完全关着。被这种异样感驱使，你随手拉开了几个抽屉。一个抽屉里装着粉色药丸，另一个装着棕色药丸。你一格一格地翻找，最后发现每个隔间里都放着同样的两种药。你环顾房间，发现墙上贴着一张褪色的羊皮纸，上面写着：[say: 粉色助孕，棕色绝育。] 北侧的墙上有一个开口。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,837) == 0)
         {
            outputText("[pg]地上还有一根拉杆。你仔细看了看，发现它似乎连接着通往东边的机械装置……");
            addButton(0,"拉动拉杆",pullLever).hint("拉动拉杆。你觉得它也许能打开门");
         }
         addButton(1,"棕色药丸",takeBarrenPills).hint("吞下棕色药丸。");
         addButton(2,"粉色药丸",takeFertilePills).hint("吞下粉色药丸。");
      }
      
      public function roomNursery() : void
      {
         clearOutput();
         outputText("<b><u>西部地穴，西段，北侧（育婴室）</u></b>\n");
         outputText("你刚一穿过帘子，就意识到这里没有什么值得你关注的东西。房间由玫瑰粉色的光球照亮，里面的家具上不是睡着的母亲，就是正在吃奶的婴儿，或是午睡的大一点的孩子。房间里挤满了人，虽然空气中弥漫着浓重的女人味，但这里没有任何值得调查的东西。");
      }
      
      public function roomLustRoom() : void
      {
         clearOutput();
         outputText("<b><u>西部地穴，东段，南侧（淫欲室）</u></b>\n");
         outputText("这个房间出奇地宽敞——里面有 " + Utils.num2Text(Utils.rand(6) + 5) + " 位大腹便便的女人，再多容纳十来个人也不成问题。和外面的隧道一样，这个房间也由魔法照亮，不过里面的东西同样寻常，只是要……有趣得多。几乎每个平面上都摆满了各式各样的女性用性玩具。它们堆在地上，挂在墙上，甚至还有些直接固定在墙面上，方便原地插弄。许多这类玩具都有多根假阳具，形状从标准款到犬类款，再到下流至极的马类款应有尽有。所有女巫此刻都正和彼此，或是和她们的“夫妻用品”交合；但你一走进来，她们便用饥渴而充满欲望的眼神看向你。");
         if(get_silly())
         {
            outputText("很显然，只要你愿意，就能往某个沙漠女巫身上再添一根肉棒。");
         }
         spriteSelect(SpriteDb.get_s_sandwich());
         addButtonDisabled(0,"操女巫","此场景需要你拥有阴茎，并且性奋值足够高。");
         if(get_player().hasCock() && get_player().get_lust() >= 33)
         {
            addButton(0,"操女巫",knockUpSomeDoubleStuffedSandWitches).hint("利用这些沙漠女巫发泄一番。");
         }
      }
      
      public function roomEntrance() : void
      {
         clearOutput();
         outputText("<b><u>沙中奇异门扉</u></b>\n");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,833) > 0)
         {
            outputText("就在前方一座较大的沙丘上，有一道方形的石门嵌在一座闪闪发光的巨大沙山侧面。要不是太阳正好处在合适的角度，在斜坡一侧勾勒出一道矩形阴影，你根本不会注意到它。你走近时，发现门侧嵌着一颗熟悉的黑曜石圆球。很明显，那就是开启它的机关。");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,834) == 0)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,834,1);
            outputText("就在前方一座较大的沙丘上，有一道方形的石门嵌在一座闪闪发光的巨大沙山侧面。要不是太阳正好处在合适的角度，在斜坡一侧勾勒出一道矩形阴影，你根本不会注意到它。你走近时，发现门侧嵌着一颗光滑的黑曜石圆球。也许那就是开启它的机关？");
            outputText("[pg]突然，一个巨大的影子笼罩住你，头顶高处传来翅膀拍打的回响。你猛地转身，正好看见一只庞然大物从沙丘顶端跃下，重重落在几英尺外的地面上。乍一看，那生物像是一个高挑、晒成古铜色皮肤的女人，披着一头飘逸的黑发，身上缀满了黄金与珠宝。然而片刻之后，你才看清她完整的身形：从腰部往下，她匀称的人类身躯变成了一头金毛巨狮的下半身，四条强健的腿支撑着身体，末端是锋利的爪子。她狮身两侧生着一对巨大的翅膀，展开足有十几英尺宽，此刻正迅速收拢贴回身侧。她是个斯芬克斯！");
            outputText("[pg]这位斯芬克斯姑娘踱步向你走来，双臂交叉在她小巧得一手可握的乳房下方。栗色的眼睛打量着你，从你的[hair]一直看到你的[feet]，女性化的面容上浮现出顽皮的笑意。[say: 哦呵！瞧瞧这是什么？一个可怜的、迷路的[race]在沙漠里徘徊；还是说，你其实不止如此？确实，我想应该是后者。看你的[weapon]这般渴望战斗，还有你的[armor]，像是已经经受过千百次打击。哎呀，哎呀。难道你是来挑战我女主人的巢穴的？啊，若真如此……你必须回答我的三个谜题，否则我就不会把钥匙交给你！]她说着，声音里带上了一点轻快的曲调，同时朝你逼近。");
            outputText("[pg][say: 我们甚至可以让它更有趣一些……如果你猜不出我的谜题，就必须把你的身体交给我享乐。如果你赢了，那么取悦你便是我的心愿。]");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,856) == 0)
            {
               outputText("[pg]<b>（你发现了一座新的地牢！“沙漠洞穴”已添加到地点菜单。）</b>");
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,856,1);
            }
            addButton(0,"外貌",sphinxAppearance).hint("查看萨努拉的外貌。");
            addButton(1,"谜题游戏",riddleGameGo).hint("开始谜题游戏。");
            addButton(2,"呃，开打！",fuckItAttack).hint("管他什么谜语，直接跟她打！");
         }
         else
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,845) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,846) > 0)
            {
               outputText("你走向斯芬克斯萨努拉，她正围着巨大的石门框踱步。你靠近时，她薄薄的嘴唇上浮现出一抹顽皮的笑意。[saystart]哦呵！我看你又回来了。嗯，自从你上次<i>来过</i>之后，这里可真是无聊透了。在这片荒原上，再没有比你更有意思的玩伴了。那么……想再来试试我的游戏吗？");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,835) > 0)
               {
                  outputText("还是说，你宁愿跳过这些客套？我想，我们都知道谁的脑子更灵光。");
               }
               outputText("[sayend]");
            }
            else
            {
               outputText("斯芬克斯萨努拉正在石门框周围踱步。她偶尔拍打一下狮子般的翅膀，或是大大地打个呵欠，显然因为眼下缺少刺激而无聊透顶。不过，看见你站在附近，萨努拉便向你投来一个勾人的眼神，又妩媚地眨了眨眼。你不太确定她是想诱惑你的头脑，还是你的身体。");
            }
            addButton(0,"萨努拉",sphinxMenu);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,835) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,833) == 0)
         {
            removeButton(6);
            spriteSelect(null);
         }
         addButton(11,"离开",exitDungeon);
      }
      
      public function roomEastHall2() : void
      {
         clearOutput();
         outputText("<b><u>东部地穴主厅（东段）</u></b>\n");
         outputText("东部地穴的主厅在这里走到了尽头，终点不过是一面光秃平整的石墙。熟悉的魔法光芒将这一带照得很亮，让你能清楚看见记录历史的挂毯，以及那些尚待填补的空白。你忍不住猜想，等这片区域被填满后，女巫们是会就此停止记录历史，还是会继续扩建，好给自己留下更多空间。看看这里描绘的事件便能明白，这个聚落算得上相当古老，大约已有二十年历史。画面中有一位金发女子，身披飘动的金色长袍，离开一座恶魔城镇，朝沙漠进发。难道这就是沙漠女巫的起源？你摇摇头，继续打量房间其余部分。南边有一道被帘子遮住的门口；当然，隧道也通向西边来路。");
      }
      
      public function roomEastHall1() : void
      {
         clearOutput();
         outputText("<b><u>东部地穴主厅（西段）</u></b>\n");
         outputText("这条光滑的砂岩隧道从东到西笔直延伸，仿佛是照着某个埋在地板下、巨大而无形的罗盘对齐的一样。拱形天花板下，闪烁的白色光焰在空中起伏流动，拖曳出珍珠般的辉光，将整座厅室照得一片幽亮。你正站在东部地穴的入口——往西还能清楚看见公共厅，往东的通道则还会延伸一段。手工编织的挂毯装点着墙壁，以图画形式讲述着这个聚落从创立至今的历史。再往东看，你还能看到几处空白的位置，等到下一段历史值得被记录时，便会覆上新的织物。北侧的墙上有个小开口，被朴素的白色帘子遮住了。");
      }
      
      public function roomCumWitchOffice() : void
      {
         clearOutput();
         outputText("<b><u>东部地穴，西段南侧（精液女巫的办公室）</u></b>\n");
         spriteSelect(SpriteDb.get_s_cumWitch());
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,838) > 0)
         {
            outputText("精液女巫就在这里，一如往常地挺身猛干着一位姐妹的小穴。她似乎不断把自己的精液射进伴侣重重叠叠的穴褶里，而随着她的激情与速度攀升，流量也变得越发浓厚，最后竟把可怜乳汁女巫的子宫彻底灌满。她们又像野兽一样交合了几秒，随后在一次高潮中分开，在不平整的地面上留下一滩足有数英寸深的精液。精液女巫把失去知觉的姐妹挪到附近的长凳上休息，然后戴上帽子，披上长袍。她朝你眨眨眼，说道：[say:好吧，希望你喜欢刚才的表演，闯入者。你是来讨要一点我的恩赐，还是为了别的事？]");
            addButton(0,"自愿加入",volunteerConfirmation).hint("自愿成为一名精液女巫。[pg]这将结束你的冒险。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,855) == 0)
            {
               addButton(1,"祝福",friendlyCumWitchBlessing).hint("接受精液女巫的祝福。");
            }
         }
         else
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,839) == 0)
            {
               menu();
               outputText("帘子很容易就被拉到一边，而你刚一进去，左侧某处便传来肉体拍打肉体的声音。你转向那阵淫靡声响时，匆匆注意到这里有几张书桌，但真正吸引你目光的，是两个正交合在一起的女孩。其中一个是看起来很普通的沙漠女巫，她弯腰趴在长凳上，正被狠狠干着。她四个肥大的乳头滴下大颗乳汁，新鲜的精液涓流则沿着她大腿上干掉的精斑淌落。压在她身上的则完全是另一种存在：一个更高的女人，只有一对大得下流的乳房。她的皮肤黑得惊人，昏暗光线下你一开始甚至难以看清她的五官。闪亮的汗水沿着她的身体滑落，从沉甸甸的乳房上滴下；她仰起头呻吟道：[say:就要……这样……收下吧！收下我的恩赐！]");
               outputText("[pg]在那黑檀肤色的女人身下，你看到那个沙漠女巫开始颤抖呻吟，浓稠的精液大股大股地从她被塞满的嫩穴里倒涌而出，她的肚子因美妙的受孕感而微微隆起。她的肌肉紧绷，然后无力地抽搐了几秒，接着便滑进了刚淌出的那滩精液里，整个人瘫软在地板上，成了一摊沉浸在高潮极乐中的无意识肉团。你正看得神魂颠倒，以至于当那个黑檀肤色的扶她转身面对你时，你甚至都忘了躲——她戴上了一顶尖顶宽檐帽，披上了黑袍。就在那一瞬间，你瞥见了一对橙子大小的睾丸和一根沾满精液润滑的粗大肉棒，但那些很快就消失在了宽大的袍子里。");
               outputText("[pg][say:哎呀，你肯定不是这里那些来接受我种子的女巫，]这位奇特的女巫沉吟道，[saystart]恐怕你是个闯入者了。真可惜，");
               if(get_player().hasVagina())
               {
                  outputText("不过，也许你可以作为母亲来为我们效力。我们部族可不会浪费任何东西。");
               }
               else if(get_player().hasCock())
               {
                  outputText("不过也许，等你彻底摆脱那些关于自由的妄想之后，你可以成为我忠诚的榨精泵。独自给这些女孩们播种，确实太累人了。");
               }
               else
               {
                  outputText("不过，也许还能让你用别的方式来服侍。");
               }
               outputText("[sayend]");
               outputText("[pg]那名煤黑肤色的扶她优雅地摊开一只手掌，低声念出一个难以理解的词。就在你眼前，点点光芒凭空闪现，竖直排列起来，又像一块块完美无瑕的水晶拼图般缓缓合拢。随着所有碎片拼合在一起，闪烁的虚幻光辉渐渐褪去，女人手中留下了一根无瑕的象牙法杖。她将杖底重重砸入地面，魔力的涟漪顿时穿过房间里四处散落的精液池。<b>看来你不得不和她打一场了！</b>");
               startCombat(new CumWitch());
               return;
            }
            outputText("这个房间彻彻底底被精液的气味淹没了。没错，你注意到地板上装着几处格栅，用来排走大部分液体，但这并没有阻止一大片巨大的水洼在房间各处积聚起来，而这多半是房里那两个半昏迷女人造成的。一个是刚被播种过的沙漠女巫，另一个则是精液女巫，前者被后者狠狠操了个爽。两人都正面朝下趴在精液里，被折腾过的身体虚弱地颤抖着。那名精液女巫曾试图与你战斗，但她完全不是你高超技巧的对手。");
            if(get_player().get_lust() >= 33)
            {
               outputText("[pg]如果你愿意，大概可以把那名精液女巫拉起来，用她满足自己。她看起来根本没有反抗的能力。");
               addButton(0,"做爱",cumWitchDefeated).hint("拿精液女巫泄欲。");
            }
         }
      }
      
      public function roomCumWitchBedroom() : void
      {
         clearOutput();
         outputText("<b><u>东部地穴，东段南侧（精液女巫的卧室）</u></b>\n");
         outputText("你刚拨开帘子，一股刺鼻的咸腥味便扑面而来，几乎让你想起温吞的海水……或者精液。不管怎样，你还是强行走了进去，环顾四周。这里陈设齐全，像一处小小的居所，甚至有一张结实的橡木床和床垫。床垫与床单似乎被打理得一丝不苟，也许还借助了魔法。这里有个朴素的衣柜，虽然看起来是用粗糙工具做成的，但木料坚固耐用。当然，所有抽屉都关着。附近的桌上放着几本书，但很明显，它们使用的是你完全看不懂的语言。写下它们的人，要么用的是另一种语言，要么就是某种需要花费数年才能破译的魔法文字。北侧有一道厚帘，将这间房与东部地穴主厅隔开。西边的岩壁开口处挂着一层更薄、更轻透的纱帘，后面很可能通往一间类似的房间。");
      }
      
      public function roomCaveCommons() : void
      {
         clearOutput();
         outputText("<b><u>洞窟公共厅</u></b>\n");
         outputText("飞舞的光点在洞窟顶部盘旋，彼此缠绕成复杂到难以追随的轨迹。不管它们究竟是什么，显然都带有魔力，也让这里染上了一种你从未见过的异世氛围。这座巨大的房间在某种意义上让你想起村里的公共场地——它显然是一处公共区域。西北角有一台水泵，房间中央则燃着一堆紫色篝火，温暖着地下清冷的空气。地面是泥土而不是沙子，像道路一样被踩得十分结实。各式椅子和长凳摆在四周，供女巫们休息。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,836) == 0)
         {
            spriteSelect(SpriteDb.get_s_witchmob());
            fuckedWitches = false;
            outputText("最糟的是，一大群施法者正聚成一伙，显然来者不善。");
            outputText("[pg]<b>出口处出现了一道魔法屏障，挡住了你的去路！</b>");
            startCombat(new SandWitchMob(),true);
            return;
         }
         outputText("你之前击败的那些女人已经回去继续忙自己的事了，她们偶尔会警惕地朝你瞥上一眼，但已经不再构成威胁。");
         if(fuckedWitches)
         {
            outputText("你注意到先前被你干过的那个仍然恍惚地躺在那儿，对周遭的一切毫无察觉。");
         }
         outputText("洞穴通道分别向东、向西延伸，通往更多地下房间。南边有一条路通向出口。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2979) >= 3 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,849) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,838) <= 0)
         {
            outputText("[pg]一道魔法屏障挡住了南边的路。看来在找到首领之前，你没法离开。");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,837) == 0)
         {
            outputText("[pg]一道巨大的石门挡住了北边的路。你看不出有什么办法能把它打开。");
         }
         else
         {
            outputText("[pg]北面有一扇敞开的门。你隐约能看见门后似乎有某种祭坛。");
         }
         get_output().flush();
      }
      
      public function roomBathroom() : void
      {
         clearOutput();
         outputText("<b><u>东部地穴，东段北侧（浴室）</u></b>\n");
         outputText("你一踏进去，就闻到空气中弥漫着一股甜甜的、像乳制品般的气味。等你的眼睛适应了较暗的光线后，你才意识到自己闯进了沙漠女巫们的浴室！蓬松的毛巾挂在墙上，随时可供取用。房间中央有一只巨大的浴池，深深嵌进地面。浴池侧边刻着几处座位，底部还有一个小小的敞开孔洞。从天花板上垂下一条长链，链端连着一个塞子。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,871,1);
         if(!get_game().milkWaifu.milkSlave())
         {
            spriteSelect(SpriteDb.get_s_milkgirl());
            outputText("你看不到任何水龙头或水源，但还没等你开口发问，角落里便传来沉重的液体晃荡声，解答了你的疑惑。发出声音的是一个被巨乳拖累着的黑皮肤人类女孩。她把涨满乳汁的乳房拖到浴池边缘，用急促而兴奋的声音问道：[say:洗澡时间？]不管她曾经是谁，女巫们显然已经把她彻底摧垮了——她如今只关心被挤奶，或是在自己的角落里懒洋洋地待着。出口在西边。");
            addButton(0,"洗澡时间",milkBathsAhoy).hint("来一次牛奶浴。");
         }
      }
      
      public function riddleTwo() : void
      {
         clearOutput();
         outputText("[say:嗯哼，我一直很喜欢这个谜语。简单得很讨人喜欢，真的——别想太复杂了，亲爱的。\'我总是在跑，却从不走路；我常常低语呢喃，却从不说话；我有一张床，却从不睡觉。我是什么？\']");
         menu();
         addButton(0,"河流",answerCorrect);
         addButton(1,"低语",answerWrong);
         if(get_player().get_inte() < 50)
         {
            addButton(2,"钉子",answerWrong);
         }
         if(get_player().get_inte() < 35)
         {
            addButton(3,"兔女郎",answerWrong);
         }
         addButton(5,"呃，攻击！",fuckItAttack);
      }
      
      public function riddleTwelve() : void
      {
         clearOutput();
         outputText("[say: 这儿有一道同时诉说星空与大地的谜题：“我们一个接一个从天穹坠落，落入过去的深处；我们的世界总被颠倒，如此方能让时间延续片刻。我们是什么？”]");
         menu();
         if(get_player().get_inte() < 50)
         {
            addButton(0,"坠落的星辰",answerWrong);
         }
         if(get_player().get_inte() < 35)
         {
            addButton(1,"天使",answerWrong);
         }
         addNextButton("沙",answerCorrect);
         addNextButton("雨",answerWrong);
         addButton(5,"呃，攻击！",fuckItAttack);
      }
      
      public function riddleThree() : void
      {
         clearOutput();
         outputText("[say: 哦，这个有点阴森：『造我的人，会卖掉我。买我的人，从不用我。而用我的人嘛，永远不会知道。请问我是什么？』]");
         menu();
         addButton(0,"毒药",answerWrong);
         if(get_player().get_inte() < 50)
         {
            addButton(1,"避孕套",answerWrong);
         }
         if(get_player().get_inte() < 35)
         {
            addButton(2,"箭矢",answerWrong);
         }
         addNextButton("棺材",answerCorrect);
         addButton(5,"呃，攻击！",fuckItAttack);
      }
      
      public function riddleTen() : void
      {
         clearOutput();
         outputText("[say: 这一题可够狡猾：“造出我的人不会说破；拿到我的人并不知道；知道我的人不会去拿。我是什么？”]");
         menu();
         addButton(0,"疾病",answerWrong);
         addButton(1,"假货",answerCorrect);
         if(get_player().get_inte() < 35)
         {
            addButton(2,"往河里撒尿",answerWrong);
         }
         if(get_player().get_inte() < 50)
         {
            addNextButton("破烂卷轴",answerWrong);
         }
         addButton(5,"呃，攻击！",fuckItAttack);
      }
      
      public function riddleSix() : void
      {
         clearOutput();
         outputText("[say: 这个谜语总让我有点伤感，不过……“我的生命不过数小时，效力之时便被吞噬。瘦时我走得快，胖时我走得慢，而风永远是我的敌人。我是什么？”]");
         menu();
         if(get_player().get_inte() < 35)
         {
            addButton(0,"地精",answerWrong);
         }
         addNextButton("蜡烛",answerCorrect);
         if(get_player().get_inte() < 50)
         {
            addNextButton("船",answerWrong);
         }
         addNextButton("箭",answerWrong);
         addButton(5,"呃，攻击！",fuckItAttack);
      }
      
      public function riddleSeven() : void
      {
         clearOutput();
         outputText("[say: 为沙漠女巫效力的我，很能体会这个谜中说话者的感受：“每天清晨，我似乎躺在你的脚边；整整一天，不管你跑得多快，我都会跟着你，可到了正午的烈日下，我几乎就要消亡。我是什么？”]");
         menu();
         addButton(0,"影子",answerCorrect);
         addButton(1,"狗",answerWrong);
         if(get_player().get_inte() < 35)
         {
            addButton(2,"水",answerWrong);
         }
         if(get_player().get_inte() < 50)
         {
            addNextButton("微风",answerWrong);
         }
         addButton(5,"呃，攻击！",fuckItAttack);
      }
      
      public function riddleReturn() : void
      {
         riddlesChosen[int(riddlesChosen.length) - 1]();
      }
      
      public function riddlePicker() : void
      {
         var _loc5_:* = null as Function;
         var _loc1_:DesertCave = this;
         var _loc2_:Array = [];
         var _loc3_:int = 0;
         var _loc4_:Array = [riddleOne,riddleTwo,riddleThree,riddleFour,riddleFive,riddleSix,riddleSeven,riddleEight,riddleNine,riddleTen,riddleEleven,riddleTwelve];
         while(_loc3_ < int(_loc4_.length))
         {
            _loc5_ = _loc4_[_loc3_];
            _loc3_++;
            if(!Boolean(_loc1_.riddlesChosen.contains(_loc5_)))
            {
               _loc2_.push(_loc5_);
            }
         }
         _loc4_ = _loc2_;
         var _loc6_:Array = _loc4_;
         _loc5_ = _loc6_[Utils.rand(int(_loc6_.length))];
         riddlesChosen.push(_loc5_);
         _loc5_();
      }
      
      public function riddleOneSphinx() : void
      {
         clearOutput();
         outputText("斯芬克斯眯起眼睛看着你，双臂抱在胸前。[say:你还真敢说？拜托，拿出点本事来，[name]。抱歉，答错了。我们再来一次。]");
         menu();
         riddlesChosen.pop();
         addButton(0,"继续",riddlePicker);
      }
      
      public function riddleOne() : void
      {
         clearOutput();
         outputText("[say:嗯，这是个老谜题，不过我觉得很不错。也是我最喜欢的谜题之一，如果你已经知道答案就叫停我吧：“早晨用四条腿走路，中午用两条腿，晚上用三条腿。我是什么？”]");
         menu();
         addButton(0,"斯芬克斯",riddleOneSphinx);
         addButton(1,"半人马",answerWrong);
         addButton(2,"人类",answerCorrect);
         if(get_player().get_inte() < 35)
         {
            addButton(3,"高跷",answerWrong);
         }
         addButton(5,"呃，攻击！",fuckItAttack);
      }
      
      public function riddleNine() : void
      {
         clearOutput();
         outputText("[say: 像猫一样，这道谜题也有多条命：“我有三种生命，温柔时足以抚慰肌肤，轻盈时足以轻抚天空，坚硬时足以击碎石头。我是什么？”]");
         menu();
         if(get_player().get_inte() < 35)
         {
            addButton(0,"鸡巴",answerWrong);
         }
         addNextButton("水",answerCorrect);
         addNextButton("声音",answerWrong);
         if(get_player().get_inte() < 50)
         {
            addNextButton("信仰",answerWrong);
         }
         addButton(5,"呃，攻击！",fuckItAttack);
      }
      
      public function riddleGameGo() : void
      {
         clearOutput();
         riddlesChosen.resize(0);
         outputText("[say:哦！你要玩我的游戏吗？太棒了！那么，我们开始吧……]");
         menu();
         addButton(0,"继续",riddlePicker);
      }
      
      public function riddleFour() : void
      {
         clearOutput();
         outputText("[say: 给你来个经典的：『我总是饥肠辘辘，必须一直被喂饱，否则就会闪烁着熄灭。然而，若是喂养我的手碰到我，我也一定会反咬一口。请问我是什么？』]");
         menu();
         if(get_player().get_inte() < 35)
         {
            addButton(0,"妖精",answerWrong);
         }
         addNextButton("火",answerCorrect);
         addNextButton("狗",answerWrong);
         if(get_player().get_inte() < 50)
         {
            addNextButton("疾病",answerWrong);
         }
         addButton(5,"呃，攻击！",fuckItAttack);
      }
      
      public function riddleFive() : void
      {
         clearOutput();
         outputText("[say: 这是我亲爱的地精朋友们很喜欢的一题：『年轻时，我在阳光下甜美可口；到中年，我让你兴致高昂；可等我老了，我比黄金还珍贵。请问我是什么？』]");
         menu();
         if(get_player().get_inte() < 50)
         {
            addButton(0,"男人",answerWrong);
         }
         if(get_player().get_inte() < 35)
         {
            addButton(1,"女人",answerWrong);
         }
         addNextButton("葡萄酒",answerCorrect);
         addNextButton("奶酪",answerWrong);
         addButton(5,"呃，攻击！",fuckItAttack);
      }
      
      public function riddleEleven() : void
      {
         clearOutput();
         outputText("[say: 游荡在这片沙漠中的那位可爱娜迦，对这道谜的讲述者可是熟得很：“一个没有铰链、锁或钥匙的盒子，里面却藏着金色的财宝。我是什么？”]");
         menu();
         if(get_player().get_inte() < 35)
         {
            addButton(0,"宝箱",answerWrong);
         }
         if(get_player().get_inte() < 50)
         {
            addNextButton("纯蜜",answerWrong);
         }
         addNextButton("蛋",answerCorrect);
         addNextButton("酒瓶",answerWrong);
         addButton(5,"呃，攻击！",fuckItAttack);
      }
      
      public function riddleEight() : void
      {
         clearOutput();
         outputText("[say: 啧，真是个悲伤的故事，如微风中的旋律般转瞬即逝：\'你曾听过我的声音，往后也还会再听见，待我匆匆消逝——你便又会将我唤回。我是谁？\']");
         menu();
         if(get_player().get_inte() < 35)
         {
            addButton(0,"恶魔",answerWrong);
         }
         if(get_player().get_inte() < 50)
         {
            addNextButton("宗教",answerWrong);
         }
         addNextButton("想法",answerWrong);
         addNextButton("回声",answerCorrect);
         addButton(5,"呃，攻击！",fuckItAttack);
      }
      
      public function resistSavinStuff() : void
      {
         clearOutput();
         outputText("你只需轻轻一推，就把女巫按倒在背。她喘息着，而你跨坐在她身上，[legs]分开，夹在她宽阔、适合生产的臀部两侧，她的肉棒仍然整根埋在你体内。令你惊讶的是，她从如今臣服的位置上抬起手，抚摸你的脸颊，像一只感到愉悦的猫般发出呼噜声。你俯下身，这一次亲吻的是她的嘴唇，而不是她的乳头，在那丰满的黑色唇线间留下珍珠般的奶渍。你微笑着将双手撑在她胸口以稳住自己，开始在她的肉棒上起伏，几乎将那巨大的东西从你体内拖出，又以诱人的缓慢重新坐下，沉醉于再次被填满到极限的感觉。你一次又一次挺动臀部，在她肉棒上弹动，节奏越来越快，化作狂热而淫荡的交合；呻吟与原始的低吼交织成乐章，回荡在沙漠之上。你让女巫受你支配，从她粗大而跳动的阳具中榨取你迫切需要的精液。");
         outputText("[pg][say:是的，哦，求你，]她呻吟着，在你骑乘她肉棒时紧紧抓住你的[hips]，[say:把我的种子纳入你体内，怀上我的孩子……我们都需要这个，对吧？别忍着……操我！]");
         outputText("[pg]你最后一次狠狠坐上她的阳具，第一股精液涂抹上你内壁、用强效的女巫精种将你体内染白时，你因快感而尖叫出声。你的小穴紧紧攥住她的阴茎，将精液榨出；女巫在野性的快感中呻吟着，向上挺动臀部，种子不断填满你，更多又从她肉棒周围溢出，直到你身下的沙地看起来像覆了一层雪。");
         outputText("[pg][say:是的，哦，是的，]女巫呻吟着，向后倒在沾满精液的沙丘上，满是乳汁的胸膛起伏着，又为这片生物的污浊增添了新的痕迹。[say:让我成为你孩子的父亲吧……你会是个出色的母亲，我们的孩子也会无比荣耀。]");
         outputText("[pg]你默默地点了点头，倒在她身上，把头埋进她满载乳汁的胸口，在性爱后的疲惫中昏了过去。");
         get_player().orgasm("Vaginal");
         dynStats(DynStat.Sens(2));
         get_combat().cleanupAfterCombat();
         get_player().knockUp(22,360,90);
      }
      
      public function repeatLoseToCumWitchForDudes() : void
      {
         var _loc1_:int = get_player().cockThatFits(get_monster().vaginalCapacity());
         clearOutput();
         if(get_player().get_HP() < 1)
         {
            outputText("你在伤势的重压下支撑不住，向后摔倒在[butt]上，整个人伏倒在地，扬起一片沙尘。看着你这副狼狈模样，黑肤扶她笑了起来，冷静地向你走近，顺手将宽檐帽丢到一旁。[say: 哦，可怜、可怜的勇者。你是求沙之母放我们出来，好让我们能这样对你吗？强大威武的" + get_player().mf("英雄","女英雄") + "是不是就喜欢屈服在我的抚摸和粗大肉棒之下？又或者，你想要的是别的什么……]");
            outputText("[pg]女巫一边脱下你的[armor]，一边抚摸着你，对你的伤口表现出非凡的温柔。她用魔法愈合了最严重的伤口以确保你安然无恙，并亲吻着其他伤口，仿佛这样就能让它们好起来。她在你的腹股沟处停下，打量了[eachCock]一会儿，手指滑过[oneCock]，掂量着它那柔软的、");
            if(get_player().get_lust100() < 40)
            {
               outputText("疲软的");
            }
            else if(get_player().get_lust100() < 60)
            {
               outputText("半软的");
            }
            else if(get_player().get_lust100() < 70)
            {
               outputText("半硬的");
            }
            else
            {
               outputText("胀硬的");
            }
            outputText("分量。她用灵巧的动作上下套弄，同时专注观察你的表情；这名曲线玲珑的女人让你沉浸在愉快而色情的暖意之中，兴奋无比炽烈地流过全身，相比之下，你剩下的伤口似乎都无关紧要了。");
         }
         else
         {
            outputText("你瘫倒在自己的[legs]上，扯掉[armor]，仰面躺下，好专心折腾自己的性器。[EachCock]已经硬得开始流出前液");
            if(get_player().balls > 0)
            {
               outputText("，而你的[balls]几乎因渴求而颤抖");
            }
            outputText("。黑肤扶她看着你笑了起来，自信地迈步上前，将帽子摘下丢开。[say: 你真的有打算和我战斗吗？还是说你是求沙之母派我们出来，好让我们蹂躏你那永不满足的性欲？我不知道你怎么没被抓住，不过我想我可以照顾一下你的需求……这一次。]");
            outputText("[pg]女巫跪在你身旁，双手沿着你的[skinfurscales]一路抚向胯间。她握住[oneCock]，托起那根坚硬的分量，衡量着你的尺寸。她的手指很快就被你滴落的前液弄得发亮，她缓缓套弄你，确保你所有注意力都集中在她身上。[say: 真是无助啊……不过希望这东西能射出像样的一发。]她眼中闪过促狭的笑意，接着说道，[say: 要是不行，我也总能想办法鼓励一下。]");
         }
         if(get_player().cockThatFits(get_monster().vaginalCapacity()) < 0)
         {
            outputText("[pg]精液女巫突然爬上你被情欲折磨得发软的身体。她一把脱下长袍，你终于得以欣赏她那汗水淋漓、黑玉般的身体；她坐在你巨大过头的男根上，身躯在沙漠的阳光下闪闪发亮。她用拇指在你的" + get_player().cockHead(_loc1_) + "下方轻轻拨弄，挑逗着你那根巨大的肉棒，而她自己坚硬的阴茎也垂落在上面，分量刚好足以在你的尿道隆起处压出一道鸡巴形状的印痕。无处不在的热浪和方才的战斗让你们两人的身体都被汗水浸透，彼此之间轻易就能滑动摩擦。精液女巫借着这点缓缓摇动腰肢，外阴褶缝敞开，在你的肉棒上渗着淫液。她的阴茎已经开始缓缓滴下女性精液，落在你的上面，几乎像是在宣告那也是她的东西。");
            outputText("[pg]黑玉般的精液法师咯咯笑着，慢慢开始与你对磨肉棒。[say: 长得这么大，却什么都塞不进去，那还有什么用呢？]她暧昧地抚摸着你那大得过分的肉棒，随后俯下身，舔舐你的" + get_player().cockHead(_loc1_) + "。你浑身一颤，把一滴前液挤到了自己的");
            if(get_player().biggestCockLength() < get_player().get_tallness() / 2)
            {
               outputText("[chest]");
            }
            else if(get_player().biggestCockLength() < get_player().get_tallness() / 1.6)
            {
               outputText(get_player().faceDescript());
            }
            else
            {
               outputText(get_player().hairDescript());
            }
            outputText("。黑肤施法者评价道：[say: 我得承认，看着确实挺有趣，不过它好像还没准备好喷出来呢。要不要再加点刺激？]");
            outputText("[pg]精液女巫打了个响指，两颗光滑的球形石块便浮了起来。它们开始高速震动，快到你能听见它们在空中嗡嗡作响。它们划过你胸前，轻飘飘地落到");
            if(get_player().totalNipples() > 2)
            {
               outputText("你的两枚");
            }
            outputText("[nipples]");
            if(get_player().hasFuckableNipples())
            {
               outputText("，几乎立刻陷进你湿润的乳头孔里");
            }
            outputText("。两枚震动器蹂躏着你的[nipples]，那位黑肤美人又把你的肉棒当成她的私人火箭一样骑在身下，你几乎快要忍不住了。你的背弓了起来，想要挺动腰部，想要操她，操她的阴茎，随便什么都好；可你仍因方才的战斗疲惫不堪，根本推不开她的体重。你只能躺在那里任她摆布，看着她挺动腰肢蹭弄你的肉棒；她那根乌黑的长物在你的" + get_player().cockDescript(_loc1_) + "上拖曳出淫靡的快感，而你则在狂喜中扭动挣扎。");
            outputText("[pg]持续挑逗了一阵后，黑肤的诱惑者俯到你身上，让她硕大的乳房轻柔地贴上你象鼻般的巨物。她低下头，仿佛要吻你，却在最后一刻偏向一旁，从你的后颈一路舔到耳边，再贴着你的耳朵喘息般低语许诺：[say: 工作之后，在这片沙地里发泄一下，最舒服不过了。而且还能有这么一个……天赋异禀的[boy]陪我玩，这本身就是份奖赏。]她低哼一声，汗湿的睾丸在你的[sheath]上弹动。[say: 明明带着这么大的家伙，你看起来却这么无助。真想看看等我的精液遮住你这副表情时，你会是什么样子。]");
            outputText("[pg]你皱起眉头，直到她揉过你" + get_player().cockDescript(_loc1_) + "上一处格外敏感的地方，傻乎乎、被快感冲昏的笑容立刻取而代之。她吻了吻你的脸颊，柔声哄道：[say: 这样才对嘛，宠物。我会把你弄得一塌糊涂的。]她的脚趾爱抚着你的[sheath]，一路滑向你的");
            if(get_player().balls > 0)
            {
               outputText("[balls]，用脚底揉弄着那");
               if(get_player().ballSize < 2)
               {
                  outputText("小巧的");
               }
               else if(get_player().ballSize >= 5)
               {
                  outputText("沉甸甸的");
               }
               outputText("圆球，让它们在她的脚掌下滚来滚去。");
            }
            else if(get_player().hasVagina())
            {
               outputText("[vagina]，几根脚趾滑进你的褶缝间，大脚趾则拨弄着你的[clit]。");
            }
            else
            {
               outputText("会阴，轻柔地抚摸你胯间和[asshole]之间的敏感皮肤。");
            }
            outputText("[pg]精液女巫呻吟着问道：[say: 既然你这根又大又敏感的肉棒让我玩得这么开心……噢，对……呃，那我给你一个选择！]她得意地笑了笑，整具身体沿着你惊人的巨物滑动，乳房在侧边上下弹跳，而她的阴茎不断滴落在你身上，给你覆上一层白浊。[say: 我可以射你满脸，也保证让你一起射出来，而且作为交换，我还会让你稍微更有生殖力一点。或者，我可以射到旁边去，但那样我就要顺手借走你一点生殖力。你选哪一个，" + get_player().mf("stud","hun") + "？]");
            outputText("[pg]也就是说，如果你避开颜射，她就会偷走你一部分精液产量；但如果你接受，她反而会让你变得更有生育力。你还在犹豫时，她仍然在你身上研磨，用一阵阵淫靡的快感分散你的注意力。时间正在流逝，要是你不快点选，她可能就要替你做决定了。");
            dynStats(DynStat.Lust(get_player().maxLust(),DynStatOp.Eq),DynStat.NoScale);
            addButton(0,"颜射",tooBigCumWitchLossFacial).hint("允许精液女巫射你一脸，并提升你的精力。");
            addButton(1,"不颜射",tooBigCumWitchLossNoFacial).hint("不允许精液女巫进行颜射。这会使你的精液产量倍率降低25%。");
         }
         else
         {
            outputText("[pg]精液女巫突然爬上你被欲望折磨的身体。她的长袍一瞬间滑落，你终于得以欣赏她那被汗水浸得光滑发亮、黑玉般的肌肤。她坐在你的腰腹上，在沙漠阳光下闪闪发亮。她双臂交叉托在那对巨大乳房下方，那尺寸大得足以让牛女都自惭形秽；她一用力，便让它们摇晃颤动起来，硕大的棕色乳头在你眼前催眠般摆动。你的视线不由自主地被那对天堂般的乳房吸引过去，每一只都宽大柔软，顶端那硬硬的、鹅卵石般的凸起仿佛在召唤你的舌头。她咯咯笑着，把一只手向后伸去握住[oneCock]，然后将臀部向后滚动，直到你的硬挺被她滑腻的臀瓣吞没，沿着漆黑的臀缝挤压过去，直到你感觉到她深色而湿润的阴唇在上面拖拽摩擦。你的" + get_player().cockHead(_loc1_) + "从她那对大睾丸下方探出头来，把欲液滴落在你的肚子上。");
            outputText("[pg][say: 这样怎么样？我可以就这么在你身上前后滑动，让你的眼睛追着我的奶子看，被乳头迷得神魂颠倒，直到你把用尽的精液射满自己可爱的小肚子，]她提议道。你的" + get_player().cockDescript(_loc1_) + "在她身下猛地一颤，兴奋得充血，她自己的愉悦低吟打断了话语。[say: 哦，你喜欢这样，对吧？勇者大人难道有点小小的乳房催眠癖？]她的乳房仍在缓缓摇摆，臀部也加入了同样缓慢的节奏。此刻她的双手都亮了起来，泛起紫白色的光芒，她为了取悦你而摇动着乳房和屁股。她自信地解释道：[say: 我很擅长精神操控，不过你肯定早就知道了。我的乳头确实很色情。你现在连视线都移不开了，不过你应该不介意吧？]");
            outputText("[pg]精液女巫用臀瓣夹紧你痉挛的勃起，松开你的" + get_player().cockDescript(_loc1_) + "，好腾出手支撑自己向前俯身，把那对弹跳着、带着催眠意味的乳房送得更贴近你的脸。你睁大眼睛，想把它们那片淫靡的丰盈看得更多。你的" + get_player().cockDescript(_loc1_) + "变得越来越热、越来越湿，而这位女术士自己的勃起也已经完全硬挺起来，那根漆黑的阳具在你的[chest]上淫荡地弹跳着，同时她把湿透的小穴在你身上来回研磨。");
            outputText("[pg]她的嗓音像猫儿般低吟：[say: 只要专心看着我的乳头就好，怎么让你舒服就交给我。我的小穴已经让你的肉棒着迷又听话了，用不了多久肯定会射出来，而你只需要放松，享受我胸前这副摇曳的天堂般的形状，对吧？]");
            outputText("[pg]你确实感觉很好……好得不得了。大概不用多久你就会喷发，而她的乳房靠得这么近，反正你也没什么别的可看。你的肌肉越来越松弛，脸上也浮现出一抹傻乎乎的笑容。这个女人可太懂怎么摆弄肉棒了。");
            outputText("[pg][say: 看吧？我说过，专注看着我的乳头会让你感觉很好。现在，就继续看着它们。让你的脑子彻底只想着它们，把其他一切都排除在外，我会让你越来越舒服，]女巫说道，而除了她那柔软的深色乳尖之外，周围的一切似乎都融化进了快感的迷雾。她的声音变得低沉而沙哑，继续说道：[say: 对，就是这样，宠物。专心看着乳头，听着我的声音。它会告诉你现在感觉如何。]伴随着黏腻湿滑的挤压声，你的" + get_player().cockDescript(_loc1_) + "被拉进一个丝滑湿润的洞里。[say: 而你感觉这么舒服，正是因为你专注得这么好。你越是专注，感觉就越美妙，也越不需要在意我说了什么，只要单纯去感受就好。]");
            outputText("[pg]她说得太对了，而且这感觉实在太舒服。你的脑袋仿佛正慢慢清空，只剩下她乳头的景象；温暖湿润的快感从视野边缘一同涌入，还有那些你根本来不及理解的话语——欣赏眼前的景色与享受快感实在太重要了。当那条紧致的甬道包裹并压缩住你的" + get_player().cockDescript(_loc1_) + "时，一声高亢的愉悦呜咽从你唇间漏出。太完美了——就像它是专门为你、也只为你打造的一样，那些褶皱滑动摩擦着你肉棒上的每一条血管、每一处神经末梢、每一寸部位，用亵渎般的快感将你冲刷得几乎失去意识。放松地躺在她身下，感觉真是太好了。");
            outputText("[pg]那对乳房停止了摇摆，但这并不重要——这反而让你能更好地盯着她的乳头看。就算她把其中一颗按到你的唇上，你仍然能在脑海中看见它，仿佛从脱离身体的视角观看。她美丽又丰盈的乳房到处压在你身上，一切都那么温暖、湿润又舒适，让你只觉得自己仿佛能直接融化进她的胸怀。它尝起来和看上去一样美妙，你不假思索地满怀渴望吮吸起来。");
            if(get_player().balls > 0)
            {
               outputText("[pg]一只手牢牢扣住你的[sack]，挤压并拉扯着你抽搐的精液工厂，把里面翻涌的种子按摩得愈发狂乱。女巫一边揉弄你的蛋，一边用越发强势的声音说道，");
            }
            else
            {
               outputText("[pg]一只手按在你生殖器与[asshole]之间的交界处，缓缓画圈揉动，力道刚好重到让你隐约感觉它正压迫着体内的某处。女巫一边摆弄你的身体，一边用越发强势的声音说道，");
            }
            outputText("声音响亮而坚定，足以让你被迷得晕乎乎的脑袋理解她的话：[say: 哦，我漂亮的小母狗[boy]，感觉你体内的压力正在积聚。越来越高……越来越高……已经快要承受不住了，对吧？你不用回答，只要感觉它变得更浓、更热。你会因为我像喷泉一样射出来，而且你会爱上这种感觉。你会永远想为我射，对不对？]");
            outputText("[pg]一阵颤动而断续的快感从她的指尖炸开，直直窜进你的[balls]。一瞬间，一股沉重感降临了。你的生殖器官里出现了清晰可感的密度，仿佛它们稍稍肿胀起来，或者至少容量变大了；可它们依然胀满得像是马上就要爆开。精液正从[eachCock]自由地滴淌出来");
            if(get_player().cockTotal() > 1)
            {
               outputText("，尤其是插在她体内的那根。");
            }
            outputText("它滴得到处都是，又从她下体里漏出，浓稠得都被你体内荒唐涌出的海量精液染成了发白的颜色。又一阵魔法能量的新鲜痉挛冲刷过你的腰胯，把你下面胀得恰到好处，直到你再也无法忍耐。你体内的那个声音轻柔地低语：[say: 为我射出来，]而你照做了。");
            outputText("[pg]这次高潮是你近期记忆中最令人放松、最为美妙的一次。狂喜的快感在你的神经系统中奔涌，强烈到你都不确定自己还能承受多久；但你松软无力的身体只是瘫在那里，任由臀部与胯间自行扭动，追赶那不断脉动的生理节奏。温热的飞溅洒在你的胸口");
            if(get_player().cockTotal() > 1)
            {
               outputText("，同时你额外勃起的肉棒");
               if(get_player().cockTotal() > 1)
               {
                  outputText("也喷射出");
               }
               else
               {
                  outputText("喷出");
               }
               outputText("一些白浊，溅上你女主人乌黑拱起的背脊");
            }
            else
            {
               outputText("，从她上下弹动的乌黑阴茎里喷出");
            }
            outputText("。与此同时，她紧夹着的肉穴也在你填满它时环着你达到了高潮。你把一股股精液飞快地射进她体内，快到甚至顺着你的" + get_player().cockDescript(_loc1_) + "周围倒涌出来；血管鼓动得几乎和你亢奋过度的生殖系统一样剧烈。");
            outputText("[pg]这一切持续得太久了，久到远远超过你以为该结束的时候，你却还在射个不停，而你已经再也承受不住。即便你的目光仍痴痴锁在她那漂亮的乳头上，你的眼睛还是开始翻白，每当你喷出满载泡沫精液的量时，眼球就在眼皮底下抽动得更厉害。她从你身上退开时，你呜咽了一声；她那被用得透彻的小穴和慢慢软下去的阴茎上仍滴着精液。你依然在射，依然沉浸在她训练你只要面对她乳房就会感到的无上快感里；当她穿好衣服，在你身旁跪下时，你把湿漉漉的一股股精液直直喷向空中，而她则低声承诺，只要你一次次屈服于她，她就会让你射得越来越多。");
            outputText("[pg]她用一阵新生的魔力刺麻感戳弄你的胯下，你在将一股精液激流喷上十几英尺高空的同时，眼前也随之彻底一黑。");
            get_player().orgasm("Dick");
            dynStats(DynStat.Sens(5));
            if(get_player().cumQ() < 60000)
            {
               var _temp_1:* = get_player();
               _temp_1.cumMultiplier = _temp_1.cumMultiplier + 2;
            }
            get_combat().cleanupAfterCombat();
         }
      }
      
      public function reallyVolunteer() : void
      {
         if(get_player().hasCock() && (get_player().get_gender() == 1 || Utils.rand(2) == 0))
         {
            cumWitchCumPumpBadEnd(true);
         }
         else
         {
            turnIntoASammitch(true);
         }
      }
      
      public function reallyAttack() : void
      {
         clearOutput();
         outputText("去他的。你握紧你的[weapon]，准备一路打穿这个该死的斯芬克斯，可你刚摆出威胁的架势，这个半狮少女就尖叫一声[say: 咿呀！]，举起双手投降。[say: 求、求你，没必要动粗！我对这些女巫没有半点忠诚，是她们</i>逼<i>我守门的。我不想和你打；如果你想进巢穴，我不会拦你。]");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,833,1);
         doNext(openZeDoorToParadize);
      }
      
      public function pullLever() : void
      {
         clearOutput();
         outputText("公共厅那边传来一阵巨大的轰隆声……");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,837,1);
         get_dungeons().remakeMaps();
         doNext(playerMenu);
      }
      
      public function pawThatPussy() : void
      {
         clearOutput();
         get_player().orgasm("Vaginal");
         outputText("你脱下[armor]放到一旁，迈着轻松的步子走向等待着你的斯芬克斯。萨努拉打量着你，将你赤裸的身体尽收眼底，愉悦地露出坏笑。[say:哦，没错，我觉得这样就够我发挥了。]她把狮尾伸向你，轻柔地抚过你裸露的身体。她的尾巴在你的腹部、乳房，甚至小穴上轻抚扫动，似乎打算不依不饶地挑逗你。但你想要的不只是挑逗，于是你向她靠近，试图去抓她那一手可握的乳房。就在你伸手碰向她时，她在最后一刻闪身躲开。她绕着你转了一圈，从你的视线中消失。片刻之后，你感觉到她两只大爪子按上你的肩背，向前一推，将你撞倒在沙漠的沙地上。");
         outputText("[pg][say:哦，不不不。这样可不行，我本来正玩得开心呢。既然你想直接进入正题，那我就让你一头扎进去好了。]她邪恶地笑着，把你翻到背上，又让你坐起身来。你甚至还没来得及看清她，她就已经转过身去，那具半兽的身体站在你的" + (get_player().hasTailInsteadOfLegs() ? "尾巴" : "双腿") + "上方，湿润而毛茸茸的雌狮小穴正对着你的脸。[say:所以，现在就一头扎进去，怎么样？]你觉得这个状况实在再合适不过，于是照她说的做了。你把脸紧紧贴上她斯芬克斯的胯间，热切地舔舐她美味而湿润的小穴。一只手按在她背上，抚摸着她漂亮的棕色毛皮，另一只手则摸到她的阴蒂，开始揉弄挑逗，同时把舌头探进她紧窄的阴道里。");
         outputText("[pg][say:嗯，这才舒服。也许现在我该给你一点属于你的东西了。]一开始你还不确定会发生什么，但很快便感觉到她一只毛茸茸的大爪子在你大腿内侧摩擦。你兴奋地更深地埋进她湿润的阴户里，随后便感到一块温暖柔软的肉垫贴上了你的[clit]。这种触感对你来说十分陌生，你带着好奇的欲望在她体内呻吟起来。你响亮的呻吟无声地鼓励了她，她沿着你湿淋淋的性器抚弄着，同时小心地没有伸出爪子。她揉弄你的外阴和阴蒂，用力按住你的性器并打着圈摩擦，还用爪尖在你小穴入口处挑逗；这样的爪抚让你欲火中烧，几乎发狂。你舔舐着她的内里，用舌头按摩她的阴道壁，又用手指绕着她的阴蒂打转，而她的抚弄也驱使你更加用力地取悦她。");
         outputText("[pg]你抓住她背上的毛，把她往后拽。她惊讶地叫了一声，而你又一遍遍这么做，直到她明白你的意思。她开始前后摆动下身，用力把胯部压向你的脸，再向前移开，然后又再次压回你身上。一次又一次，她喘息着，因快感而把爪子抠进沙里，尽可能凶猛地用小穴操你的脸。前后往复，越来越快，她的喘息愈发沉重，爪子对你的抚弄也越来越用力，最后她决定彻底放开。毫无预兆地，你感觉到她那只毛茸茸的大爪子整个插进了你的小穴。最初的扩张让你疼得厉害，你发出一声闷闷的尖叫。但当她的爪子在你湿滑的[vagina]里前后抽动时，疼痛很快便转化为快感。她一边在你体内揉动爪子，一边强硬地抽插，让你觉得小穴内部像是被按摩着，同时又被狠狠地操弄。");
         get_player().cuntChange(5,true,true);
         outputText("[pg]她整只爪子都在你体内，你很快便感觉高潮逼近。你用深而缓慢的动作让舌头在她的小穴里进出，感觉自己的小穴逐渐收紧，脚趾也在一波波贯穿全身的快感中不受控制地蜷起。你不想让她这么快停下，于是尽可能把舌头伸进她美味的小穴深处，同时将手指从她的阴蒂上移开，改用掌心用力压住那里，狠狠摩擦。没过多久，你便察觉她自己的高潮也要来了；她喘得越来越急，爪子在你体内以凶狠而野性的节奏进出。她的小穴在你的舌头周围痉挛，你很快便感觉一股味道美妙的淫液涌进你的嘴里。你急切地吞咽下去，继续取悦她，而她则顶着你的脸摇摆身体，用爪子操弄你，丝毫没有停下的意思。");
         outputText("[pg]许多次高潮之后，你们精疲力尽地躺在沙地上。她的狮身趴伏在地，人类的上半身向前舒展开来。你的背和头靠在她柔软的棕色毛皮上，尽力平复呼吸。她抬起人类的上半身，也抬起刚才用在你身上、仍旧湿漉漉的前爪，开始舔干净它。[say:这和我原本想的不太一样。你最好常来找我，我还想再多来点这样的。也许下次我们可以坚持得更久。]你看着萨努拉，紧张地笑了笑；一想到她还能拿出更多花样，你既兴奋又害怕。");
         menu();
         addButton(0,"进入",openZeDoorToParadize);
         addButton(14,"离开",exitDungeon);
      }
      
      public function openZeDoorToParadize() : void
      {
         clearOutput();
         get_images().showImage("dungeon-entrance-desertcave");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,840) == 0)
         {
            outputText("你犹豫着触碰那颗黑色球体，欣赏着它光滑而富有光泽的表面。几乎就在你碰到它的瞬间，它便缩回了墙里。门口轰隆作响，一块巨大的石板消失在沙土深处，露出通往内部的入口。镶嵌着珍珠的精细雕刻描绘着大量胸部丰满的女巫，尽管那些符文的具体含义对你来说十分陌生，但很明显，这里是某种属于沙漠女巫的圣所。");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,840,1);
         }
         else
         {
            outputText("前方就是沙漠女巫集会所那熟悉的景象。它由一座嵌在沙丘侧面的砂岩拱门凿成。入口处装饰着镶嵌珍珠的图案，描绘着胸部丰满、正在泌乳的女巫，让你很清楚里面会有什么在等着你。");
         }
         doNext(moveToNorthDoor);
      }
      
      public function noDemandMilkRelease() : void
      {
         clearOutput();
         outputText("她这么一说，你也觉得或许是这样。那个可怜的女孩待在这里，总比落到恶魔手里要好。见你让步，沙之母微微一笑，拍了拍你的肩膀。[say: 我很高兴你能理解我的想法，[name]。你心中有智慧。来吧，我们谈谈别的事，]她说着，带你回到了她的王座室。");
         doNext(playerMenu);
      }
      
      public function moveToNorthDoor() : void
      {
         get_dungeons().set_playerLoc(12);
         runFunc();
      }
      
      public function moveToEntrance() : void
      {
         get_dungeons().set_playerLoc(17);
         runFunc();
      }
      
      public function moreCumWitchesPlease() : void
      {
         clearOutput();
         if(get_player().hasPerk(PerkLib.BimboBrains) || get_player().hasPerk(PerkLib.FutaFaculties))
         {
            outputText("要是有很多精液女巫，长着能让你含吮的美味鸡巴，难道不会更好吗？");
            outputText("[pg][say: 不，那一点也不好，]沙之母反驳道，结束了这场谈话。");
            doNext(playerMenu);
         }
         outputText("你问她，是否更人道的做法其实是再创造几名精液女巫，让她们分担职责，并真正有时间以其他方式服务集会——无论是像普通姐妹一样，还是协助招募新人。");
         outputText("[pg][say: 那样会在一定程度上减少乳汁产量，也会减少我们的繁殖人口，]沙丘之母反对道。[say: 我们用这种方式已经将近二十年了……这是效率最高的办法。]");
         outputText("[pg]这也许确实是效率最高的办法，但把自己负责照看的某个人降格到几乎只是性奴的地步（哪怕她本人乐在其中），也并不会让她比自己所对抗的恶魔显得高尚多少。");
         outputText("[pg]这位巧克力色皮肤的女族长靠回王座上，带着目瞪口呆的表情思索着你的话。[say: 我从没这样想过，]她一边说，一边抚着下巴细细琢磨。[say: 她们到底愿不愿意，这才是真正的问题。我们的精液女巫似乎对自己的工作怀有一种扭曲的自豪感。]");
         outputText("[pg]嗯，问问也无妨，对吧？");
         outputText("[pg]沙之母听后点了点头，显然被你的论点打动了。她召来自己的精液女巫，对方匆匆赶到，浑身都浸透了汗水和自己的精液。");
         outputText("[pg][say: 我的夫人，您决定要亲自孕育一个孩子了吗？]那名乌黑肌肤的双性人问道。");
         outputText("[pg]集会领袖平静地微笑着回答道：[say: 不，不，亲爱的。[name]有个想法。[He]建议我们扩充你的行列，让你有更多时间以繁殖之外的方式帮助集会。也许是通过魔法，甚至外出巡逻、招募新人。你愿意有几位姐妹来分担你的时间，还是想继续独自一人填满姐妹们的子宫？]");
         outputText("[pg]精液女巫露出邪气的笑容，回答道：[say: 哦，母亲大人，那真是太棒了。有了更多精液女巫，我就有时间进一步研究那些能加速孩子们成长的祝福。更好的是，我还能亲自教导我的新姐妹们，成为我这一员究竟意味着什么……]她明显因兴奋而颤抖，一缕透明黏液挂在她那根明显勃起、脉动的阴茎顶端。");
         outputText("[pg][say: 我明白了……好吧，我会立刻宣布试炼。今天结束之前，你就会多出几位新姐妹，]女巫女王宣布道，挥手示意你们二人退下。");
         outputText("[pg](<b>这个集会现在拥有了多名精液女巫。你可以再次与沙之母交谈，并要求她派她们外出寻找新成员；如果你想在将来有机会与她们战斗的话。</b>)");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,852,1);
         sandWitchMotherFriendlyMenu();
      }
      
      public function milkBathsAhoy() : void
      {
         clearOutput();
         outputText("嗯，你大概还能挤出时间快速洗个澡。你已经解决了她们之中的大部分，而这片区域似乎也没有更多她们的同伴了。你把[armor]轻松脱下，堆在圆形石浴缸旁；那个暗肤色的乳房怪物则满怀期待地注视着。等你一丝不挂后，你跳进浴缸里，告诉她该洗澡了。");
         outputText("[pg]带着颤抖的期待，黑皮肤的乳奴把手伸向自己奶牛般鼓胀的奶头。她那巨大如盘子的乳晕上因期待而渗出白色的汗珠，女人的双手几乎陷进了胸前的肉球里，她费劲地想要抓住自己肿胀不堪的奶头。你把塞子丢进排水口，抬头看去。巨乳女孩愉悦地轻哼着，终于用颤抖的指尖捏住了两边胀痛的喷奶孔。她揉捏着自己的乳头嫩肉好一会儿，眼睛因快感而半闭着、沉甸甸的，然后她释放出第一股浓稠的白色激流，涌入浴缸。出乎意料的是，这液体稀薄而水润，比你想象中更不像奶。到底是那些女巫还是这个女人自己的身体机能在作怪，你无从判断。她的眼神太过空洞，找不到任何线索，而她的嘴巴正忙着发出解脱的叹息，没空说话。");
         outputText("[pg]珍珠色的液体很快就填满了浴缸最初的几寸深，从摩卡色的喷口中分出无数叉流喷涌而出。深色的双手用流畅不间断的动作揉捏着柔软的女性肉体，从乳根到乳尖挤压每一个奶头，再退回根部。这稳定的一来一回的动作让奶流随着节奏忽高忽低，但流量始终浓稠充沛，足以把白色的液体溅到你的[hips]上。你靠在一张长椅上放松下来，懒洋洋地在水里滑动手指，享受着奶液越涨越高、浸润你[skinfurscales]的美妙触感。你唯一的同伴，那个巧克力色皮肤的女人，在你注视下继续揉搓着她饱满鼓胀的双乳，而你不得不承认，看着她那沉甸甸的奶子努力灌满你的浴缸时，一阵性兴奋沿着你的脊柱往下直窜。");
         outputText("[pg]你闭上眼，把这些液体按摩进皮肤里。尽管下身逐渐发热，你却莫名感到宁静而洁净。即使乳白色的液体流过你的");
         if(get_player().hasCock())
         {
            outputText(get_player().multiCockDescriptLight());
         }
         else if(get_player().hasVagina())
         {
            outputText("[vagina]");
         }
         else
         {
            outputText("[butt]");
         }
         outputText(", 你强忍住以性意味触碰自己的冲动，把注意力集中在你原本想做的事上——泡澡。乳奴发出一声满足的呻吟，她的乳房终于缩减到能让她轻松够到奶尖的程度了，手指又拽又挤，尽情释放着她此刻一定感受到的极致快感。即便如此，那对庞然巨乳依然大到足以把她困在浴缸旁边。照这个速度，就算你已经被她美妙的汁液淹到脖子了，她大概还是动弹不得。");
         outputText("[pg]黑檀肤色的女人微微张开肥厚的嘴唇，舌头懒洋洋地耷拉出来，下流地垂在外面。她看起来……很爽——几乎是爽到高潮的那种。她的双手刚才还在稳定地泵送，现在正以狂热的力度抚弄着自己的乳头，时不时停下来爱抚胸口那庞大的肉团，挤出更多奶水。她抖了抖，又颤了颤，为你灌满浴缸，哪怕是对一个完全陌生的人也如此顺从。她恍惚陶醉的表情随着时间一秒秒过去而变得越来越满足，然后猛地一颤（就在奶水漫到你[chest]的时候），她尖叫着呻吟起来，浑身痉挛，沉浸在极度狂喜的愉悦中，肌肉阵阵抽动，引发一阵巨大的震颤穿过了那对正在剧烈晃荡的巨乳。与此同时，一大股奶水喷溅而出，力道之大把你冲得撞在浴缸壁上，浸透了你的头发。等这一切平息下来，浴缸已经满了，而那个神魂颠倒的女孩正快乐地喘着粗气。");
         outputText("[pg]乳奴收回身子，舔着肥厚的嘴唇，身上散发着浓烈的雌性发情的气味，但显然已经满足了。她呜咽着，[say: 我最喜欢泡澡时间了，] 然后开始把她那对乳房的庞大体积挪回属于她的角落。");
         outputText("如果你愿意，大概可以在浴缸里自慰一下，或者把这个暗肤色的乳汁女仆拉进来作伴……你要怎么做？");
         get_player().changeFatigue(-10);
         menu();
         addButton(0,"继续",finishMilkBath);
         if(!get_player().isGenderless())
         {
            addButton(1,"喝奶自慰",drinkNFap).hint("喝点牛奶，然后自慰。","喝奶并自慰");
         }
         else
         {
            addButtonDisabled(1,"喝奶自慰","此场景需要你拥有生殖器。","喝奶并自慰");
         }
         addButton(2,"牛奶女孩",grabTheMilkGirl).hint("把牛奶女孩拉进来。");
      }
      
      public function menLoseToQueenMotherVolI() : void
      {
         clearOutput();
         outputText("勇者醒来时，身体已经改变。[He]如今看起来简直就是精液女巫的翻版——一根粗大饱满的肉棒，两颗肿胀的睾丸，一对下垂的丰满乳房，以及如最深黑夜般漆黑的肌肤。她已经成了她们中的一员，一个欲望永不满足的扶她女巫。就她所能记得的，她才在短短十年前出生，并在五年内成熟。征召发出时，她自愿成为精液女巫，并击败了二十多名同样淫荡的姐妹，赢得了这个备受尊崇的位置。如今，年长的精液女巫成了她最好的朋友，两人整日欢快地把肉棒深深插进双穴里，肆无忌惮地让姐妹们怀上孩子。闲暇时，她们研习法术，并练习用越来越大量的精液把彼此塞满。");
         outputText("[pg]两年后，响应伟大母亲的召唤，沙漠女巫们走向了战争。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,493) == 0)
         {
            outputText("她们的鹰身女妖与不死鸟盟友让她们得以畅通无阻地逼近莉希丝的要塞，而在");
         }
         else
         {
            outputText("在");
         }
         outputText("玛瑞斯有史以来最血腥的一战中，恶魔被击败，在白色烈焰中从这个世界上被彻底抹去。在随后的岁月里，各个女巫集会致力于纠正世上的一切错误。仍有许多恶魔残存，但它们的影响力正在衰退。世界继续向前，而那些幸存者也明智地躲藏了起来。");
         outputText("[pg]沙漠女巫们将沙漠化作丛林乐园；尽管她们没有腐化的污染，却从未停止以强硬手段引入新血的政策。许多人都像勇者一样被洗脑后投入效力，但和平确实降临了玛瑞斯。那个无人回答的问题是……一个由淫荡奶巫统治的世界，真的比此前那个腐化的世界更好吗？");
         get_game().gameOver();
      }
      
      public function menFuckUpSomeCumWitch() : void
      {
         clearOutput();
         var _loc1_:int = get_player().cockThatFits(get_monster().vaginalCapacity());
         var _loc2_:int = get_player().cockThatFits2(get_monster().vaginalCapacity());
         outputText("你满怀期待地脱下[armor]，[eachCock]已经");
         if(get_player().get_lust100() < 50)
         {
            outputText("半硬起来");
         }
         else
         {
            outputText("硬得像铁");
         }
         outputText("，并随着愈发高涨的欲望跳动着。精液女巫抬头鄙夷地看着你，但她肉棒的坚挺，以及她泛红小穴那湿淋淋的状态，已经把她的欲情暴露无遗。你摆正她的身体，将她的双腿舒舒服服地大大分开，她的身体也诚实地泛起红晕。你不得不托起她沉甸甸的阴囊，才露出那片又厚又湿的阴唇。她浑身一颤，肥大的肉棒随即往她深色的腹部上渗出一缕前液，把她深色的肌肤润出一层诱人的光泽。");
         outputText("[pg][say: 你觉得那东西能和我、我的奇妙……完美阴茎相比？我让怀孕的女人比你多得多啊啊——]她嘲弄着你，直到你一记角度精准的挺进打断了她。[OneCock]");
         if(get_player().cockThatFits(get_monster().vaginalCapacity()) < 0)
         {
            outputText("几乎整根");
         }
         else
         {
            outputText("整根");
         }
         outputText("没入她体内，深深插进她那许久未被使用的小穴。她紧致的甬道包裹着你的" + get_player().cockDescript(_loc1_) + "，就像一只量身定做的手套；那滑腻温热的拥抱，几乎要夺走你的理智。女巫开始随着你腰部的动作套弄自己乌黑的肉棒，仰起头，沉浸在只有真正的双性人才能体会的无言快感之中。");
         if(get_player().hasVagina())
         {
            outputText("这可不是只有她会玩。");
         }
         if(get_player().get_gender() == 3)
         {
            outputText("[pg]你转过身，让你的[butt]朝向她，而你的肉棒则笔直刺入她蜜液淋漓的紧窄深处。这个姿势没有刚才那么舒服，至少在你把带屌女孩的鸡巴从她手里拽出来、猛地塞进自己的肉缝之前是这样——随后你同时干着她雄健的家伙和丰润的小穴。你的扶她情人终于屈服于交合的快感，不再抵抗。她哀求道，[say: 对，别停！骑着我狠狠干！诸母神在上，太爽了！]与此同时，她的臀部迎着你抬起，狠狠撞向你的胯间，力道震得回响不绝。");
            get_player().cuntChange(get_monster().biggestCockArea(),true,true,false);
            outputText("[pg]你下定决心要把这头叛逆的母牛骑到屈服，于是迎着她的动作，一次次对顶，一下下抽插，每一次撞上去都把她更狠地压向地面。没过多久，你们两人都覆上了一层细密的汗，像两具瘦弱身体里困着四头野兽般不顾一切地交配着。女巫大胆地在每一次胯部震响相撞时拍打你的[butt]，让那一片啪啪声变得更加嘈杂。因为姿势所限，你除了不悦地皱眉什么也做不了，尽管那些拍打让你的肉棒阵阵跳动，小穴也随之收紧。");
            outputText("[pg]");
            if(get_player().balls > 0)
            {
               outputText("做爱时，你们汗湿的阴囊彼此滑蹭，挤成一团颤动的肉球，仿佛都在争着比对方更早喷出自己泡沫般的浓精。");
            }
            else
            {
               outputText("做爱时，她汗湿的阴囊在你的[skinfurscales]上滑动，贴着你挤压颤抖，像是在渴求释放那泡沫般的浓精。");
            }
            outputText("[pg]幸运的是，这场狂热的交合伴随着性器相撞的震骨巨响，同时抵达了高潮。男女两种器官交合在一起，达成了完美而狂喜的和谐。粗暴的拍臀立刻变成了热烈而近乎膜拜的抚摸，女巫与你一同射了出来。你们两根胀满精液的肉棒都在对方体内爆发，喷出浓稠的精流，将彼此的子宫染成白色，阴囊也随着彻底排空而肉眼可见地瘪了下去。");
            if(get_player().cumQ() > 2000)
            {
               outputText("当然，就算是精液女巫的魔法也没能耗过你。你把她体内灌满了精液，直到她的肚子圆鼓鼓地隆起，像怀孕般鼓成一颗球，而你的腹部只是微微发胀。");
            }
            else if(get_player().cumQ() > 1000)
            {
               outputText("当然，你们都成功用性爱的排泄物把彼此的肚子撑得鼓了起来。");
            }
            else
            {
               outputText("当然，她射得比你更久、更猛烈，把你的肚子灌满精液，直到它微微弯出一条丰饶的弧度。");
            }
            outputText("[pg]你缓缓起身，从身下那只裹满黏液的小穴里抽出自己，同时努力无视从你双腿间倾泻而出的那道相同的白色河流。你特意俯身压在这位黑玉般的情人上方，把她自己滴落的精液洒在她身上，直到那股流淌慢慢变成涓滴。她起初怯怯地抗议，随后又带着欲望的叹息放弃了，任由纯白精液涂抹在自己皮肤上，思绪也重新滑回下流的沟渠里。你一边穿衣服，一边好好欣赏自己的成果。");
            get_player().knockUp(22,360,90);
            get_player().orgasm("Dick");
            dynStats(DynStat.Lust(5));
         }
         else if(_loc2_ >= 0)
         {
            outputText("[pg]你皱着眉，把她的手从那根弹跳着、硬得发烫的肉棒上拉开，说道：[say: 你想感受双倍的快感？那就尝尝这个！]你用行动为这句宣言加上重音，向后一退，将你的" + get_player().cockDescript(_loc2_) + "对准她的后门，不等她反应便狠狠顶到底。她因疼痛和震惊而皱起脸，惊愕地抬头看着你，却说不出话来。你冷笑着，用拳头缠住她一缕厚厚的金发，把她拽起来接吻，用舌头以同样粗暴而强硬的力道侵入她的嘴，就像此刻侵犯她肛门的那股力道一样。女人在快感与疼痛中尖叫，又带着恨意的激情回吻舌交，含混的哭喊渐渐消失。");
            outputText("[pg]尽管她仍在与你纠缠，她那丝滑的甬道很快便急切地夹紧你的" + get_player().cockDescript(_loc1_) + "，而她紧致的后穴也逐渐松开。即使放松下来，那里依然以远胜小穴的紧热感轻轻颤动。你几乎要对这种感觉上瘾了。这个倒霉的棕肤女神用屁股榨弄着你的" + get_player().cockDescript(_loc2_) + "，与此同时，她胀大的乳头压在你身上，滑溜溜地擦过你汗湿的皮肤。你咬住她的嘴唇，更加用力地猛干她，以沉重的抽插骑在她身上。这一切都只是为了让你的[cocks]爽到射出来，你一点也不在乎她的快感。");
            outputText("[pg]在你粗暴蹂躏她的屁股时，女巫虚弱地又想去抓自己的鸡巴，但你粗鲁地扇了她一边乳房。那一下重击让她的肉棒抽搐着滴下浓稠的前液。好吧，如果这就是她想要的……你开始配合自己的抽插节奏拍打她的奶子，反复拍击那对乳房，直到那片暗色、被汗水润亮的皮肤都因刺激而泛红。她的乳头似乎在这番虐待下变得更大更硬，等你厌倦了每次拍打带来的愉快晃动后，便抓住其中一颗乳尖，用力一捏。");
            outputText("[pg]在你彻底虐待并羞辱她时，一股浓稠的双性精液从女人被冷落的勃起中喷涌而出。你把这当成全力冲刺的信号，便将那颗乳头向侧面拧去，像着了魔的[manboy]一样猛干她，让两根肉棒不停拍进她痉挛的洞里，直到你感觉热意在腰间翻涌，已经准备好在她体内爆发。");
            outputText("[pg]你对这个哭哭啼啼、高潮到崩溃的废人问道：[say: 准备好了吗，婊子？]见她没能回答，你便在快感中大吼着射了。精液");
            if(get_player().cumQ() < 250)
            {
               outputText("从你两道射精口流出，把两个洞都弄得一片狼藉。");
            }
            else if(get_player().cumQ() < 500)
            {
               outputText("从你两道射精口喷涌而出，用珍珠般的白液把两个洞从里到外都浸透。");
            }
            else if(get_player().cumQ() < 1000)
            {
               outputText("以惊人的力道从你两道射精口喷出，很快用精液把两个洞灌得满满当当，女巫的肚子也缓缓隆起，被精液撑胀。");
            }
            else
            {
               outputText("如潮水般从你两道射精口涌出，用你雄性的精种淹没那两个饥渴的洞。你射了又射，把女巫的肚子灌满精液。一开始只是微微鼓起，但很快就被你撑成了怀孕般的圆顶。");
            }
            outputText("女人喷涌小穴上方那根弹跳的女孩肉棒也很好地把她的肚子和胸脯涂成了白色。它一股接一股地喷在她巧克力色的肌肤上，很快，她看起来就不再像个可怕的敌人，倒更像一块淋满糖霜的甜挞。");
            outputText("[pg]你感到空空如也，却又心满意足，于是将两根肉棒拔出，露出你辛勤耕耘的成果——两份水润的中出痕迹，一个竖着，另一个小小的、皱缩着，还在往外渗。");
            get_player().orgasm("Dick");
         }
         else
         {
            outputText("[pg]你拉开这不听话贱人的手，训斥道：[say: 啧啧，坏母狗可没资格长鸡巴。]她像个闹脾气的孩子似的撅起嘴，随意把一缕金发从脸前吹开，下唇还撅得更厉害了。你笑着捏住她的脸颊，逗弄道：[saystart]拜托，如果你只是想玩玩，打一开始就不该想强迫我。在你学会礼貌之前，你的鸡巴归我管");
            outputText("。[sayend]");
            outputText("[pg]听到你这番强势的拒绝，施法者那不断渗出润滑液的入口似乎变得更湿了。于是你继续慢慢地操她，随手拍开她任何想要摸自己的尝试。直到她终于放弃，轻轻抓住你的肩膀，你才朝她笑了笑");
            if(get_player().cor < 50)
            {
               outputText("，也流露出一丝怜惜");
            }
            else
            {
               outputText("，终于纡尊降贵地让她尝到些快感");
            }
            outputText("。你逐渐加快做爱的节奏，手也懒洋洋地往下滑，抓住女巫柔软而富有弹性的大腿。她的皮肤温热发烫（或者说，黑檀色的肌肤能泛红到这个程度），而你的手指越往上探，就越能感觉到潮湿。你轻轻拨弄着她的阴唇和自己的男根，寻找那颗坚硬的阴蒂。");
            outputText("[pg]你的手一碰到女巫的敏感点，那双漂亮的黑玉大腿立刻在你背后交叠起来。一只脚跟勾住另一只，双腿鼓励般地绷紧，仿佛在央求你更深地插进这个性感黑美人的小穴。你的鸡巴简直像是到了天堂，被深深包裹在湿热的天鹅绒怀抱里，只有熟练的情人才能给予这样的抚慰。你喘着粗气，俯在女人身上，有节奏地操弄着她。她的双臂缠上你的脖颈，以先前从未展现过的温柔轻抚你的肩膀和后背。");
            outputText("[pg]你沿着这位女士修长的脖颈一路吻到她耳边，低声道：[say: 这样才对，]随后轻轻咬了咬她的耳垂。你退开时，她抬头望着你，既有些困惑，又明显沉溺在欲望中。她舔了舔嘴唇，问道：[say: 再用力点……求你了？]");
            outputText("[pg]你拨开她的金色发丝，轻轻点头，开始加快动作，让你的" + get_player().cockDescript(_loc1_) + "在那条天鹅绒般的甬道里越来越快地抽插。她用力弓起背，将乳房送到你嘴边，你贪婪地含住其中一只吮吸，同时手指探入她痉挛的小穴，揉弄她的敏感小豆。整个过程中，女巫的那根东西都在断断续续地弹跳、搏动，仿佛急切地渴求关注。你无视它，也无视那滩不断扩大的前液，全心全意地向这个女人展示，作为女人该如何享受爱欲。");
            outputText("[pg]她的双腿在你背后颤抖，渐渐失去夹紧的力气。女巫哀求地抬头望着你，央求道：[say: 我要……求、求你……我可以——噢噢噢……我、我可以射了吗！？我快到了……就……就让我射吧！]你自己也离高潮不远了，于是大度地点点头，将你的" + get_player().cockDescript(_loc1_) + "狠狠顶进它的新家，把女巫柔软的屁股压在你的大腿上。她愉快地尖叫一声，身体猛然绷紧，双脚用力抵住你的后背，将你困在她体内。与此同时，她那根粗大的东西从腹部抬起一寸，变得更粗，尿道口一瞬间鼓起，随即开始抽搐，将黏液喷洒到她的乳房和脸上。她的小穴用芬芳的女性淫液浸湿你的腰胯，而你终于也释放出来，即使已经整根深埋在她的穴里，仍更用力地向她顶去。你的" + get_player().cockDescript(_loc1_) + "毫不迟疑地倾泻出一股股浓稠精液");
            if(get_player().cumQ() < 700)
            {
               outputText("，源源不断地喷射，直到她体内完全被精液灌满，腰腹也微微鼓起。");
            }
            else
            {
               outputText("，把她的小穴灌得满满当当，直到彻底泛滥，肚子也胀成圆鼓鼓的弧形。");
            }
            if(get_player().cumQ() >= 1500)
            {
               outputText("你还想继续，但里面已经没有空间了，一股股精液从这女人可怜而被灌得过满的小穴里喷涌出来。");
            }
            outputText("[pg]女巫叹了口气，漫不经心地揉着自己");
            if(get_player().cumQ() >= 700)
            {
               outputText("肿胀的");
            }
            outputText("小腹，一边在你抽身退开并重新穿好衣物时，把她自己浪费掉的黏液抹进皮肤里。");
            if(get_player().cor < 33)
            {
               outputText("你希望她能从这次经历里学到点什么，但想到这片怪异土地上的大多数人，她大概很快又会回到那副恶劣的老样子。");
            }
            else if(get_player().cor < 66)
            {
               outputText("你不知道她会不会从中学到什么，只是无所谓地耸了耸肩。谁在乎呢？");
            }
            else
            {
               outputText("你一边想着她会不会从中学到什么，一边露出坏笑。你希望她不会——毕竟这课教起来还挺有趣的。");
            }
            get_player().orgasm("Dick");
         }
         get_combat().cleanupAfterCombat();
         spriteSelect(SpriteDb.get_s_cumWitch());
      }
      
      public function memeberedFolksFindTrueWuv3() : void
      {
         clearOutput();
         outputText("你从恍惚中醒来，发现自己身处一个堆满性玩具的房间，其中一些正被那些丰满的女巫使用。没过多久，其中一人便注意到你的状态，给你食物和饮水，又把她湿淋淋的双穴呈到你面前。你注意到这两个女人都怀孕了，但她们的性欲显然已经高涨到不可思议的程度。你立刻挺身进入她体内，贪婪享用她奉上的滋养，并履行自己作为被俘爱奴的职责，一次又一次取悦她们的穴，直到每一次雄浑的射精都让她们体内满溢的精液从穴口淫荡地一波波溢出。");
         outputText("[pg]有时候，当你看起来不开心时，她们会让你和奥菲莉娅共度一夜。她依旧像你们初遇时那样体贴而关怀，哪怕她已经变得更庞大、更强大。尽管她有着非人的外貌，甜美的性情仍从中透出；她会整夜温柔地榨取你，而你们两个则彼此分享各自人生中的故事。");
         outputText("[pg]最终，她被认为已经净化到足以独自穿行洞穴；虽然奥菲莉娅不会泌乳，姐妹们却将她的体液派上了大用场。不过，你那位怪物恋人大多数时间仍陪在你身边。你的冒险结束了，但你找到了一个真心珍视你的爱人，并确保你能连续数日、每小时体验几十次高潮……");
         get_player().orgasm("Dick");
         dynStats(DynStat.Lib(5));
         get_game().gameOver();
      }
      
      public function memeberedFolksFindTrueWuv2() : void
      {
         clearOutput();
         outputText("<b><u>一周后……</u></b>[pg]");
         outputText("房门裂开一条缝，将光洒进这几天来你一直沉溺其中的污秽、盘绕纠缠的场景。某个时候，你得知这位同伴被姐妹们命名为奥菲莉娅；而随着这场喷精、舔穴、榨棒的乱交持续下去，你也和她越靠越近。当然，第一晚你是独自睡的——或者说，在身边有一团触手");
         if(get_player().cockTotal() == 1)
         {
            outputText("争抢着你的肉棒");
         }
         else
         {
            outputText("榨取着你的几根肉棒");
         }
         outputText("，逼得你一场接一场地做春梦时，那也算不上真正的独处——但她始终待你很温柔，哪怕你根本无法选择自己会被带到高潮多少次。第二晚，你睡在她的盘绕之中。第三晚，你开始真心喜欢上她。第四晚，她向你展示了自己的主小穴，而你睡在她身下，任由她骑着你度过整夜。");
         outputText("[pg]现在，你已经沉醉在爱意之中，也沉醉于这位用催情药迷住你的恋人的温柔爱抚里。这段时间里，你只靠她的淫液维生，但她有很多淫液，而且味道和质感各不相同。你已经用嘴和肉棒品尝过她的每一条触手，却仍然挑不出最喜欢哪一条。好吧，她球茎底部的主小穴简直像位指挥大师，能围绕[oneCock]指挥出一整场性爱交响乐，只是味道不如其他一些部位那么美妙。此刻你的腰正被夹在里面，不过你仍坐直身子，抱着她光滑湿润的躯体，对着门口傻笑；达拉则嗅到了整整一周浓烈性爱留下的气味。");
         outputText("[pg]当她鼻翼翕动，吸入数日来凝结沉淀的费洛蒙时，淫液从她双腿之间喷涌而出。她的皮肤涨得通红，膝盖发颤。她抓住门框支撑身体，怯生生地咕哝道，[say:噢，诸神啊，]随即再次高潮，将淫液溅得满地都是。她舌头垂在外面，却仍勉强保持着理智，穿过那片交媾的雾气向前，把你从肩膀处一把抓住。奥菲莉娅用肢体从达拉腰间摘下好几个瓶子，除此之外，她并未反抗。即便你被从她的小穴里拉出来，她的声音依旧欢快地冒着泡，[say:很快再见，亲爱的。我相信我们的主人在我们再次见面前，还有更多东西要教给我们两个！]");
         outputText("[pg]达拉砰地关上门，随即扑倒在你身上，两具身体一起滚落到地板上。她的脸落在你的腰间，近到嘴唇和鼻尖都沿着[oneCock]摩擦。这个晒成小麦色、身上带着纹身的美人放声呻吟，因尚未释放的欲望而浑身发抖，双穴像筛子一样淌着淫液。她几乎没多想便爬到你身上，在大厅中央占有了你；她的姐妹们在一旁看着，其中许多人只是闻到那股被封闭了一周的繁殖气味，就已经开始抚弄自己。[say:操操操操噢诸神太爽了……]达拉哭喊着。当伯妮丝坐到你脸上，用你的鼻子摩擦她硬挺的阴蒂，并让淫液倾泻进你的喉咙时，她的淫靡话语被另一副丰满臀胯闷住了。");
         outputText("[pg]在被囚禁的这段时间里，你的身体已经被训练得十分彻底，于是你立刻为这些女性主宰者们狼狈地射了出来。你在感官的狂喜中抽搐，双手也被塞进那些早已等候、被撑开的穴里。快感与调教夺走了控制权，迫使你吮吸、舔舐，取悦眼前的小穴，同时又为另一个女人射精。沙漠女巫们似乎早已料到会发生类似的事，却没想到效果会强烈到这种程度。她们充分利用局势，一个接一个地与你交媾。有时，她们会把灌满精液的小穴套在你的拳头上抽弄，或者在你播种她们的姐妹时与你热吻。另一些时候，你面对的则只是新鲜、尚未被操过的小穴。");
         get_player().orgasm("Dick");
         dynStats(DynStat.Lib(5));
         menu();
         addButton(0,"下一步",memeberedFolksFindTrueWuv3);
      }
      
      public function memeberedFolksFindTrueWuv() : void
      {
         clearOutput();
         if(get_player().get_HP() < 1)
         {
            outputText("在浑身伤势的重压下，你身形一垮，勉强挣扎着想让自己站稳。然而，当你的[legs]一软，地面猛地朝你扑来时，这番挣扎证明只是徒劳。撞上地面的前一瞬，你的视野里只剩下坚硬夯实的泥土。星光和黑暗充满了你的视线，你晕乎乎地躺在那里，伤得连尝试起身都做不到。女孩们看到你的惨状后发出的尖细娇笑刺得你耳朵发痒。好吧，你会让她们瞧瞧的。你用尽每一分意志力，强迫双臂动起来，然后以一头在泥里打滚的猪般的速度，把自己翻了个身。效果一点也不惊艳，但至少你能看见那群俯视着你的女人了。她们无数乳白色的丰满胸脯投下阴影，将你笼罩在黑暗中，而你也终于意识到自己败得有多彻底。");
            outputText("[pg]一个矮个女巫从她的姐妹们之间挤了出来，审视着你。尽管这个女人比她们大多数人至少矮了一英尺，她的姐妹们却在她自信的步伐前纷纷让开，带着一种出人意料的敬意。她甚至都没有巨乳！运气好的话，也就双D或E罩杯吧。一片盘旋的纹身遮住了她右半张脸的大半，其纹路精细复杂到几乎让你看花眼，也清楚地将她和同伴们区分开来。");
            outputText("[pg][say: 闯入者，嗯？既然你已经发现了我们，我们也不能就这么放你自由离开，对吧，姐妹们？]这位娇小的女附魔师说道，语气冰冷，带着阴暗的威胁。人群中响起一阵低声却听不清内容的附和。该死，你这下麻烦大了。那个带纹身的骚货随意地把手掌悬在你脸上方，开始吟唱毫无意义的词句。再过一秒，就会有火焰爆炸，或是砂岩轰然砸落，而你会被烧成灰，或被碾成肉泥送去另一个世界……你闭上眼，深深吸气，细细品味这注定是最后一口的清凉新鲜空气。");
            outputText("[pg]一阵麻痹般爆开的暖意将你的痛楚驱散，让你感觉身体完好又健康。这就是……死亡吗？那股舒适的热意缓缓流过你的四肢，最后窝进胸膛。你的心跳加快，仿佛体内某处有个过度兴奋的鼓手在猛敲。等等，死人可不会有心跳。你睁开眼，抬头看见女巫微笑的脸，她发光的纹身照亮了面庞，而你身上剩余的伤势也随之消失。她转动手腕，让手掌和手指在你上方旋舞，将那人为的温热挑得更烫。你[armor]下方的一阵抽动提醒你，有种新的感觉正在体内蔓延——欲望。热度越高，你的心跳就越快，[eachCock]也胀得越硬。那股情欲撕咬着你的克制，让你呜咽着去抓揉自己撑起帐篷、不断抽动的鼓包。在装备内侧摩擦的[nipples]情况也好不到哪去。它们隐隐发疼，渴望被触碰");
            if(get_player().hasFuckableNipples())
            {
               outputText("、抚弄，甚至被插弄");
            }
            else
            {
               outputText("和抚弄");
            }
            outputText("。");
            if(get_player().hasVagina())
            {
               outputText("你的[vagina]也不甘寂寞，把内衣弄成一团湿漉漉的烂摊子，满是雌性信息素和不断滴落的润滑液。");
            }
         }
         else
         {
            outputText("你……你还怎么继续抵抗下去？女巫们走近了一步，她们起伏的胸脯就在你伸手够不到的地方，硬挺的乳头把布料顶起，有些还沾着乳汁，另一些则只是勉强将布料撑起。也许那些鼓胀的乳晕里，还藏着几颗可爱小巧的内陷乳头？你因为[eachCock]硬得惊人而喘息着，坐倒在自己的[butt]上，开始隔着[armor]摸弄自己。操，你真希望这些火辣的女人能随心所欲地玩弄你……");
            outputText("[pg]其中一人从人群里走了出来，那是个矮些的女孩，身上布满彼此交织的奥术纹身。她身材紧致，长着两对出乎意料地朴素的DD罩杯乳房。要不是她比其他人高了将近一英尺，那些乳房相比之下会显得很小，但以她的体型来说比例刚刚好。其他女孩在她靠近你时给她让出充足的空间，也许是出于尊敬，也许是出于畏惧。她注视着你下流地摸弄自己，最后开口说道。");
            outputText("[pg][say: 闯入者，你找到了我们的女巫集会。很遗憾，我们不能让你带着这个秘密离开。从这一刻起，对外面的世界来说，你已经死了。]");
            outputText("[pg]……什么！？这个念头足以让你停下手上的动作，也让胀痛的性器僵住。她们要……杀了你吗？你脸上的惊恐一定暴露无遗，因为那名施法者忽然笑了起来。");
         }
         outputText("[pg][say: 你该不会以为我们真要杀了你吧？]娇小的女巫轻声说道。[say: 不能让你离开，并不代表你非死不可。]她慢慢抚摸着你的下巴，坦白道：[say: 你可以用别的方式服侍我们。]她的手滑进你的[armor]里，亲昵地握了握[oneCock]。你呻吟一声，手指深深抠进泥土，背脊弓起，把[hips]结结实实地顶进她的掌心。你如此强烈的反应让人群中响起一阵兴奋的低语。她开始慢慢套弄，同时低声说道：[say: 姑娘们，我想沙之母不会反对我们把这个家伙收作集会最新的玩具。把[him]带回去，好好玩一玩吧。]");
         outputText("[pg]当那只手从你僵硬的凸起上移开时，你失望地叫出声，恳求她继续。此刻你的需求几乎像是超自然的冲动——要是再不快点让[oneCock]得到一点摩擦，你肯定会疯掉！");
         outputText("[pg][say: 好了好了，耐心点，宠物。我们很快就会让你舒服起来的，]首领保证道，语气里还带着一丝……那是怜悯吗？她抚摸着你的头，而她的姐妹们围拢过来，几十只乳房从四面八方压在你身上，一群充满欲望的手臂把你抬了起来。不止一只手找到了你的乳头去揉捏，捏住你的屁股，或是玩弄你的孔穴；当你被抬着穿过隧道时，你的[armor]也一点一点消失，被那群近乎偷窃狂般的手扯走。");
         outputText("[pg]一只手发现了[oneCock]");
         if(get_player().cockTotal() == 2)
         {
            outputText("，另一只手则抓住了你的另一根");
         }
         else if(get_player().cockTotal() > 2)
         {
            outputText("，还有更多手缠上了剩下的那些");
         }
         outputText("，套弄立刻又开始了，对你过度刺激的身体来说实在来得太猛。[EachCock]喷出一股白色的爱液，直直射进那群咯咯笑着的女人中间，但她们似乎并不介意你把精液弄得她们的手、长袍和皮肤上到处都是。对她们来说，这是一种有趣的新体验——她们一定已经很久没有机会把一根阴茎彻底支配到这种程度了。你呻吟着，在高潮的恍惚中被一路颠着带走，沿途不断喷射，直到进入你的新家都没意识到自己已经到了；直到那些沾满精液的滑腻手掌放开你的[cocks]，你才在自己肚子上又吐出一小股精液。");
         outputText("[pg][say: 哎呀，这可不行，]矮个子女巫故作羞怯地宣布道，[say: 要是你想当我们的好玩具，就得好好练练持久力。算你走运，我们正好有合适的东西！伯妮丝，把我们的另一个俘虏带过来！]");
         outputText("[pg]另一名穿长袍的女人走了出来，她一定就是伯妮丝，正拖着一辆带轮子的推车。车上放着一只闪亮的笼子，上面贴满了封印和卷轴。那些纸质封条随着它靠近而不祥地沙沙作响，只让你勉强瞥见里面一圈圈紫色的皮肤，那湿润而橡胶般的质感在栅栏后泛着光。伯妮丝向那位满身纹身的女首领鞠了一躬，说道：[say: 她在这里，达拉。不过为什么不能先让我们玩玩新玩具呢？]");
         outputText("[pg]一直掌管全局的达拉同时回答了她的手下和你：[say: 新宠物已经把[his]那一发全射在我们身上了，记得吗？]她舔掉拇指上你那带咸味的精液。[say: 等到[he]什么时候又能随时陪我们玩了，就让她先训练这个被榨干的新来者吧。]这似乎让伯妮丝满意了，可你心里恐惧和困惑各占一半。这他妈到底是什么东西？如果它是触手怪，为什么又要用“她”来称呼？");
         outputText("[pg]达拉把她的同伴们赶向出口，自己走近笼子。她撕下一张封印，把手掌伸到缺口前，满怀期待地看着你。一条泛着紫色的卷须从开口处探出，顺从地落进达拉沾满精液的掌心。接触到那咸涩液体的瞬间，那看似阴茎的顶端向后翻开，露出一张粉色的口器，滴下透明的润滑液丝。它贴上那富有营养的湿润液体，数百根纤毛伸出来舔净每一丝黏液，直到那名纹身施法者的手被清理得没有半点精液，只剩满掌润滑液才停下。");
         outputText("[pg][say: 她是从沙漠里闯进来的。有几个姑娘在沙丘里发现她时，她已经快死了，干枯又可怜，像个小东西。太惨了！我们把她带回来，用乳汁，还有精液魔女愿意分给我们的那些精液，把她照料到恢复健康。母亲大人并不赞同，但我们一直把她关着，而且从那以后就一直在净化她。你看，这些野兽并不是恶魔，虽然它们确实被腐化了。也就是说，它们可以被净化，而这一只已经……基本上可以了。我们、我们还在努力。]达拉有些紧张地搓了搓手，无意间把那生物的体液抹得到处都是，还打了个寒战。[say: 呃……总之，她这一路都很坚强，而且她不太说话，但很体贴，再过几个月，她甚至可能就能自己到处走了。当然，她还是需要乳汁和精液才能活下去，所以你们两个简直天生合适！]");
         outputText("[pg]达拉放开那条探查着你的藤蔓小穴，退回你身边，握住");
         if(get_player().cockTotal() > 1)
         {
            outputText("一根");
         }
         else
         {
            outputText("你的");
         }
         outputText("软塌塌的阴茎，开始把触手生物留下的液体抹在上面。你立刻感到浑身发热，随着心脏重重跳动三下，你的肉棒就在她手中硬得像石头。你那晒成小麦色的俘获者放开你胀硬的肉茎，带着得意的笑容退向门口那群微笑的女孩。她脸红得相当明显，但声音却稳得像百炼钢：[say: 顺便一提，它的润滑液是催情剂。我们大概一周后再来看看你。]笼子的一侧打开了，女巫们离开，并把门在身后封上。");
         outputText("[pg]那只雌性触手怪——如果它真是那种东西的话——并不怎么像你预想的样子。它的大部分躯体似乎都是由扭动的湿润突起组成，每一条都细长而能灵活抓握，堆叠在一起，让这生物休息时的姿态像是一盘意大利面，上面放着一颗巨大的紫色肉丸。那个中央球体——姑且这么称呼——表面光滑，紫绿斑驳，还覆着一层闪亮的湿气。你看不到眼睛或嘴巴，但它依然用肢体转动着，仿佛在注视你。它挥舞着一大群扭动的肢体，从自己的洞穴中移动出来，伸展开来，用那些阴茎般的朱红色突起占据了房间的大半空间。其中几条已经张开，露出带有纹理和起伏的内部。有些里面长着细长的纤维状纤毛，细到看起来像粉色蕾丝。另一些则布满粗糙的小凸点。有些入口大大咧开，形状像是为了容纳下流的犬科肿胀而生。这生物似乎就是为了取悦阴茎而存在，但它还没有强行扑到你身上……");
         outputText("[pg][say: 嗨，]那生物忽然发出声音，听起来像四重奏般的嗓音完美和声。[say: 我希望，呃，你不会介意我……嗯……噢噢噢！]她话还没说完，其中一只花朵般的小穴就猛地向前窜出，带着无法满足的饥渴含住了[oneCock]。滑腻的内部并不像你想象中那么温暖，却布满了细小震动的凸点，足以压迫你敏感的神经；与此同时，她的润滑液渗进你的皮肤，带来更多不自然的兴奋。[EachCock]因未得到释放的欲望而鼓胀起来，肿到完全坚硬、阵阵发痛");
         if(get_player().balls > 0)
         {
            outputText("，你的[balls]也开始运作，在化学物质的刺激下时而收紧、时而放松，酝酿出一大股浓稠的精液。");
         }
         else
         {
            outputText("，你的身体也开始运作，在化学物质的刺激下时而收紧、时而放松，急切地酝酿出一大股浓稠的精液。");
         }
         outputText("[pg][say: 哎呀！]那生物说道，[say: 我实在很难不……嗯……这感觉真好……]它圆润的表面泛起更深的紫色。[say: 好了！我平时没什么机会得到精液，有你这样的人在这儿，对我来说真的很棒。伯妮丝说我可以……呃……对……]那条紫色、灵活的小穴一直套到你的[sheath]根部，里面的凸起开始越震越快。");
         if(get_player().cockTotal() > 1)
         {
            outputText("质感相似的小穴也嬉闹般缠上你的其他肉棒");
            if(get_player().cockTotal() > 2)
            {
               outputText("们");
            }
            outputText("，欢快地把你抽动的硬挺吮进");
            if(get_player().cockTotal() == 2)
            {
               outputText("自己体内");
            }
            else
            {
               outputText("它们体内");
            }
            outputText("。");
         }
         outputText("小穴发出响亮的啜吸声，");
         if(get_player().cockTotal() > 1)
         {
            outputText("一齐上下套弄");
         }
         else
         {
            outputText("上下套弄");
         }
         outputText("、来回吞吐，把");
         if(get_player().cockTotal() > 1)
         {
            outputText("它们的");
         }
         else
         {
            outputText("它的");
         }
         outputText("滴落的淫涎溅满你裸露的胯间。你的[hips]不由自主地顶起，迎向那些饥渴的触手。满足这生物对精液的渴望，似乎已经成了你身体此刻被驱使着要做的事；在她的侍弄下，你含糊地咕哝着，沉浸在无言的欢愉里。");
         outputText("[pg]那生物的颜色变得更深，中央核心像果冻一样明显地晃动着，气息微乱地说道：[say: 哇，你尝起来真好！嗯嗯嗯，我们会成为好朋友的，对吧？]");
         outputText("[pg]你听着她悦耳的多重嗓音，闷哼着射了出来。[eachCock]喷出一股股淫浊的精液，把各自的管状伴侣灌得满满当当。被肉棒塞住的卷须表面因为你那浓厚的注入而鼓胀起来，形成一个凸起，又被慢慢拉向核心，正好为你下一次射精腾出空间。等你射完、无力地仰倒在地时，你的[balls]里已经泛起一阵舒服却又疼痛的酸胀。");
         outputText("[pg][say: 哦不！来，喝点这个！你会好起来的！]那怪物般的雌性说着，把一只鼓起的小穴按到你嘴边。你已经虚脱得无力反抗，又渴得无法拒绝。更何况，在她的催情物质影响下，嘴里含着小穴似乎也挺不错。你虚弱地抓住那根管状器官，开始用舌头探索；当一股新鲜、带着果香的雌液猛地涌进你喉咙时，你不禁呻吟出声。它……它……太好喝了！你兴致勃勃地吞下那甘露，大口大口地灌着，全然没注意到它让你的[skin]热得发烫，也没注意到精液已经开始在你的[balls]里不断涌动、翻腾。");
         outputText("[pg]一只湿滑的小穴温柔地把潮湿的汁液蹭过你的脸颊，她的多重嗓音自豪地说道：[say: 你一定真的很喜欢我！哇，真让人放心。你看起来好忙，而且，嗯……那感觉真的、真的好舒服，所以我想我就——呃啊啊啊……]她喘了几下。[say: ……呃，一边你喂我，一边我也喂你！我的汁液应该能让你精液充沛、欲火难耐，足够一直跟上我。是不是很棒？]");
         outputText("[pg]你埋在她的小穴间点了点头，而你体内那股庞大、不断膨胀的精液量还在继续增加。喂饱她一定会很有趣……");
         get_player().orgasm("Dick");
         dynStats(DynStat.Lib(5));
         menu();
         addButton(0,"下一步",memeberedFolksFindTrueWuv2);
      }
      
      public function maleTooBigVictorySex() : void
      {
         clearOutput();
         var _loc1_:int = get_player().biggestCockIndex();
         outputText("你刻意放慢动作脱下[armor]，那份紧紧束缚着你巨物的压力以最美妙的方式转移开来。那种既不适又撩人的重量逐渐减轻，刚一获得自由，你的" + get_player().cockDescript(_loc1_) + "便猛地弹了出来，迎向开阔空气的自由；随着血液涌入，它几乎胀大了一倍。女巫困惑地抬眼看着你惊人的尺寸，随即震惊地瞪大了眼睛。");
         outputText("[pg][say:你、你比我还大……]她拖着声音说道，嘴巴因震惊而张开。她用手掌遮住那张大开的嘴，笨拙地试图掩饰自己对你那根巨大香肠的惊愕。");
         outputText("[pg]你握住自己的根部，随意地将它向前对准，让它继续胀大，直到蹭上她的鼻尖；你的尿道口仿佛都要将其整个吞下。那名乌黑皮肤的女术士双眼对焦到你的肉棒上，脸上浮现出饥渴而又有些困惑的神情。她抗议道：[say:这……这绝对塞不进我身体里！]她担忧地抬头看你，同时抚摸着下侧。[say:我们肯定能找到别的办法……]");
         outputText("[pg]你粗暴地把女巫推开，让她平躺在地。她摔得四仰八叉，眼中带着恐惧，紧张地用双臂挡住自己裸露、晃动的乳房。你没有理会她，而是牢牢抓住她的大腿，毫不客气地将其扯开，露出她花瓣般泛着粉色的褶缝。失去双手支撑后，你的肉棒垂落到位，柔韧而跳动的勃起遮住了那片黑色肌肤。女巫把手臂从你的重量下抽出来，这也放开了她的双乳，让它们垂向两侧，贴着压在她身上的沉重肉棒变形。");
         outputText("[pg]当你开始动作时，女术士向你投来朦胧的目光；每当你的一条青筋擦过她的阴蒂，或把她的阴茎更用力地压进腹部，她就会发出可爱的享受喘息。你的肉棒很快就被女巫的前液和雌液弄得湿滑，于是当你拉扯她的乳头、让双乳更多地贴上你的巨物时，它便顺畅地滑了过去。你因欲望而扩张的尿道口在她下巴上吐出一大滴浓稠前液，你命令道：[say:就这样托着。]");
         outputText("[pg]女巫笑着回答：[say:我还能做得更好！]她手指一挥，让粉色火焰缠绕其上，随后按在自己迅速变得湿滑的胸脯上。当那双深色的手指抽离时，粉色的轮廓留了下来，替她托住紧贴肉棒的乳房，也让她的双手得以空出来抚摸你的" + get_player().cockHead(_loc1_));
         if(get_player().balls > 0)
         {
            outputText("，或是爱抚你的[balls]");
         }
         outputText("。你握住她的双脚高高抬起，让她柔软大腿的重量压在你的[sheath]周围。如此多光滑肌肤包裹着你，那快感强烈得几乎令人神魂颠倒。女巫的双手在你的肉棒上游走，将一阵阵愉悦的酥麻沿着它送入你的[balls]；而每当你向前挺动，她就用丰润的深色嘴唇把你的前液抹遍龟头。");
         outputText("[pg]在一次漫长、漫长的后撤中，你那迷恋精液的伴侣娇声道：[say:天啊，继续！这太——唔噗噗噗。]你用肥大的肉棒堵住了她的喋喋不休，看着她那柔软丰润、吸吮着肉棒的唇肉变成一个抽吸的“o”形，不禁赞叹。你能感觉到她正把前列腺液直接从你的尿道中吸出来，一路吸进她鼓起的脸颊里。当她松开真空般的吸力去吞咽时，你弹了出来又再次滑回去，但你感觉比之前更加欲火焚身、更充盈、更迫不及待想要射精。那位阴影般的美人透过低垂的睫毛向上望来，笑意满溢。你意识到她不知用什么魔法影响了你，很可能是为了增强你高潮的威力；可一想到要用一波又一波白浊把这个金发婊子奢侈地喷个满头满脸，你真的会在意吗？");
         outputText("[pg]你用力向前挺进，逼得那个女人将你的" + get_player().cockHead(_loc1_) + "前端数寸吞进体内，同时咽下每次愉悦抽搐时喷出的浓稠透明前液。她双眼对在一起，因快感而颤动。当你退出来时，她淫荡地呻吟着，用舌头舔去你唇上最后的残留，而她那根逊色的小鸡巴仍在你的下面鼓胀着。你察觉到下方多了些温热和黏滑的热意——她刚刚射了吗？你加快抽插，享受着额外的润滑，也确认了自己的猜测。");
         outputText("[pg]你操弄她时，女巫的屁股轻轻颤动，正适合你游移的双手下手；你转而揉捏其中一瓣，又拍打另一瓣。她仍在你粗大的肉棒下射个不停，交叉脚跟，用两条腿的全部力量夹紧你。她的双臂也同样抱住那根裹满精液的肉棒，将其紧紧压进震颤的乳肉之中。女术士仿佛正把整个身体塑造成一只自慰套；每当你把鸡巴撞进她嘴里，她就更饥渴地吸吮，深深饮下你的精华。她闭眼的时间比睁眼还多，而每当嘴唇没有锁在肉棒上时，她就在呻吟，并把自己的腹部弄得一片湿白。她不断涌出的泡沫状精液从身体两侧滴落，可这景象只会刺激你更用力、更快速地操她，直到你能倾泻出自己那一大股浓烈精浆。");
         outputText("[pg]这个浑身沾满精液的双性人女巫试图乞求你的精液，但你又用一股冒泡的前液堵住了她的嘴。看着她努力把它全部咽下，你感觉自己体内一阵热意抽动");
         if(get_player().balls > 0)
         {
            outputText("，同时你的[balls]也绷紧起来");
         }
         outputText("，你知道高潮已经到来。你将自己的" + get_player().cockDescript(_loc1_) + "狠狠送回原处，撞在她脸上。第一波仿佛永远滞留在你体内，逐渐把你的尿道撑宽，直到你看见自己的" + get_player().cockHead(_loc1_) + "肿胀张开。一股白浊灌满这婊子的嘴，浸透她的头发，冲刷过她的双肩。那乳白色的黏稠物多得惊人，一条条垂在她头周围，像帷幕般挂着，缓缓滴落到地板上汇成一滩。你稍稍后退一点，让下一次爆发落在她的乳房上。精液像从五加仑桶里倒出来的水一样倾泻而出，那对黑色乳房立刻被闪亮的白浊包裹。");
         outputText("[pg]你的" + get_player().cockDescript(_loc1_) + "渴求更多摩擦，把你又牵回她的脸前；而这一次，她甚至没有试着用嘴接住。这个黑皮荡妇只是吻在你开口下方，迎着你的目光承受那股乳白色的洪流，尽可能久地与你对视。当然，这并没有持续多久，她很快就被精液淋透，双眼也被糖浆般黏稠的精丝糊住。");
         outputText("[pg]你还没完！远远没有！这个黑暗生物赐予了你近乎亵渎神明般的旺盛精力，你可不会浪费。你站开一步，将你的" + get_player().cockHead(_loc1_) + "抵进她的下唇之间，把高潮剩余的部分直接注入这个女人等待已久的子宫。她的腹部鼓成漂亮的孕肚，连她的鸡巴也被顶了起来；你也第一次有机会看到这名精液女巫自身高潮后的成果。那根深色发亮的鸡巴完全被精液浸透，而她的卵蛋则被翻搅出的泡沫状精液环绕。等你把她的子宫灌成一个肿胀的圆丘后，你抬起方向，把最后几缕精液淋在她可悲的半软鸡巴上。");
         outputText("[pg]终于筋疲力尽后，你亲昵地拍了拍自己的" + get_player().cockDescript(_loc1_) + "。要不是女巫的头发比你打算清理的[skin]还脏，你本会把它在她头发上擦干净。她开始舔自己的手指，把脸上的东西清理掉。你只是笑了笑，然后穿好衣服。还有很多事要做。");
         get_player().orgasm("Dick");
         get_combat().cleanupAfterCombat();
         spriteSelect(SpriteDb.get_s_cumWitch());
      }
      
      public function loseToTheSandMother() : void
      {
         clearOutput();
         if(get_player().hasCock())
         {
            loseToSandMotherBadEnd();
         }
         else
         {
            loseToSandMother();
         }
      }
      
      public function loseToSandMotherBadEnd() : void
      {
         clearOutput();
         outputText("你踉跄着退到墙边，试图撑住自己");
         if(get_player().get_HP() < 1)
         {
            outputText("伤痕累累的身体，可你的伤势太重，力量被彻底夺走。");
         }
         else
         {
            outputText("不受控制的身体，可你的欲望太过强烈，把你的身体变成了一团颤抖的废物。");
         }
         outputText("你");
         if(get_player().get_HP() < 1)
         {
            outputText("带着怨恨看着沙之母走近；当她高高俯视着你倒地的身躯时，你却只能仰望并欣赏她雕塑般的体态。");
         }
         else
         {
            outputText("饥渴地看着沙之母走近；你仰望着她雕塑般的体态，只能抚摸自己");
         }
         outputText("。她低头看着你，轻蔑地哼了一声。[say:真令人失望。莉希丝派你这样的弱者来对付我们，姐妹们居然连拖慢你的脚步都做不到。她们必须为此严厉赎罪。] 她那双如沙漠天空般湛蓝的眼睛再次审视着你，低声说道：[say:不过首先，该处理的是你，不是吗？]");
         outputText("[pg]一只修剪精致、未穿鞋袜的脚从飘动的丝袍下探出，戳了戳你的[armor]，灵巧地拨开裆部，露出你的");
         if(get_player().get_HP() < 1)
         {
            outputText("迅速胀大的勃起肉棒");
         }
         else
         {
            outputText("硬挺、沾满前液的肉棒");
         }
         if(get_player().cockTotal() > 1)
         {
            outputText("");
         }
         outputText("。[say:哦，这是什么？你刚才是在想什么不洁的事吗，我的小恶魔爪牙？]高大的女术士问道。你立刻抗议，坚称自己清白无辜，哪怕你悸动的男根正一阵阵抽跳，在腹上弹动。身披丝袍的女王轻哼一声，轻轻将脚踩在你身上，用柔软的脚底沿着你敏感的尿道凸起摩挲，脚趾蜷下，夹在它的两侧。[say:哦，现在已经没必要再装清白了。不过我必须承认，看你这样叫出声还挺有趣的，]她微笑着说道。[say:无论你原本是什么，都到此为止了。你会侍奉沙海，像姐妹们一样尊我为女王。]");
         outputText("[pg]不！你试着从她脚下挣脱，可在她熟练的爱抚和刚才战斗的消耗之下，你的肌肉虚弱得像婴儿一样。你甚至连翻身爬走都做不到。你最多只能无力地左右晃动，把自己朝出口挪上一两寸，而那出口看起来却比以往更遥远。你的[hips]因一次格外巧妙的挤压而向上猛地一挺，一声虚弱的呜咽从你口中漏出。一团清亮的前液从顶端渗出，落在沙之母柔软的足弓上，成了这场温柔却强迫的足交的润滑。你在低沉的呜咽间喘息着，最终瘫软下来，任由她的脚趾持续不断地爱抚。");
         outputText("[pg]你的身体或许已经屈服于快感，但脑海中仍有一部分在抗拒。你明明只是想拯救自己的村子，却被当成恶魔的爪牙对待。这不对！那莫名舒服的肉棒摩擦让你脸颊发烫，你勉强止住呻吟，挤出一句虚弱的抗议。你告诉她，你");
         if(get_player().cor < 66)
         {
            outputText("并没有堕落");
         }
         else
         {
            outputText("并不效忠恶魔");
         }
         outputText("，一边恳求地仰望着她");
         if(get_player().cockTotal() == 1)
         {
            outputText("，而她则兴致勃勃地套弄着你，把你漏出的汁液涂满整根阴茎。");
         }
         else
         {
            outputText("，而她则兴致勃勃地转向你的第二根肉棒，用第一根肉棒的前液将它涂湿，让每根阴茎渗出的液体把你的[cocks]弄得一塌糊涂。");
         }
         outputText("[pg]那折磨般的抚弄慢了下来，最后彻底停住，只留下你硬得发疼、颤抖着胀大，仿佛随时都会爆发，却又在没有刺激时射不出来。那威严的沙漠女巫审视着你，一边思索，一边将一缕散开的漂白发丝拨到肩后。最后，她低声说道：[say:……听起来倒像是真话。]希望在你心中涌起，却又与肉欲快感骤然中止的失落彼此冲突。沙之母懒洋洋地用大脚趾划过你那沾满前液的肉棒，宣告道：[say:但那并不重要。我不能让你带着这些情报和这份软弱离开，否则你会把我们出卖给恶魔。]你重获自由的梦想就此破碎，而你内心某个阴暗而野性的角落，却因那撩拨触碰的回归而暗自欢喜。");
         outputText("[pg][say:姐妹们！把精液女巫叫来！]你的俘虏者高声命令道，手脚间专注于你肉棒的玩弄却丝毫没有放慢。一片应和声回荡开来，那位双重丰腴的美人重新把注意力放回你身上，脚掌向下压住你，轻柔地拖着你的阴茎滑过你肚脐上方那摊由你制造出的前液。空气中性爱的气味越来越浓，大多来自你自己的分泌物");
         if(get_player().hasVagina())
         {
            outputText("和被冷落的小穴");
         }
         outputText("，但你也能察觉到一丝陌生的雌性麝香。沙之母薄薄的丝袍下能看见四颗子弹般的乳头，它们淫靡地顶起布料，并用潮湿的乳白色水渍将其染湿。那景象让你已经不堪重负的胯下泛起一阵愉悦的酥麻，又为她熟练爱抚下不断积聚的灼热添了一把火。");
         outputText("[pg][EachCock]因期待而变得更加粗胀，硬挺到几乎能从你腹部抬起。体内的肌肉收缩、颤抖，将滑腻的热流泵过下腹，鼓胀的一发已经随时准备爆开。女术士毫无预兆地加重脚上的力道，把[oneCock]重新压进你那摊前液里。[say:来吧，释放出来，]她鼓励道，一边维持快感，一边迅速上下滑动。[say:我保证，会让你的新生活过得很愉快。]那痛苦般强烈的感觉在你体内引爆一阵巨大的炽热快感，你即便被压制着，仍不由得弓起背。你淫荡地将[cock biggest]顶进她滑腻的足弓里，射了出来，[eachCock]弹跳着、胀开，向你身上喷射出一道道新鲜而咸腥的白浊。");
         if(get_player().cumQ() >= 500)
         {
            outputText("一波又一波精液冲刷过你的身体，将你彻底浸透；乳白色的浓浆从头顶到腰间都黏滑地糊满了你。");
         }
         if(get_player().cumQ() >= 3000)
         {
            outputText("一滩精液在你周围汇聚，在你无穷精力的作用下不断加深，沿着你的身体一点点上涨，直到你觉得自己仿佛要漂浮在自己的珍珠色精液之中。");
         }
         outputText("[pg]就在你快要结束、只剩几股无力的精液滴流而出时，另一个披着长袍的身影走进了房间。尽管你那成股的高潮黏液已经用浓烈气味充满了整间屋子，但随着新来者靠近，精液的味道反而变得更强，几乎翻了一倍。沙之母在你的[leg]上擦净自己的脚，低声说道：[say:乖[boy]。现在放松，我们会让你舒服起来的。]她转过身，不再看你，而是去迎接那位黑檀色的姐妹。她可不只是肤色黝黑或晒得很深……她简直如午夜般漆黑。更糟的是，她的长袍上溅满了白色污渍，而一处足以让大多数男人的勃起都自惭形秽的凸起，正毫不掩饰地急切撑起那身袍子。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,839) > 0)
         {
            outputText("精液女巫就在这里，而且她似乎已经从上次的败北中恢复过来了！");
         }
         else
         {
            outputText("这一定就是精液女巫了！");
         }
         outputText("[pg]两个女人低声交谈了几句，声音太小，你听不清。从你听到的只言片语来看，她们像是几乎在争论什么……而争论的对象就是你。沙之母皱起眉，摇了摇头，声音刚好大到让你听见：[say: 我觉得我们不需要它，但你说得对。浪费了也可惜。]她们都点了点头，转回来看向你那被高潮折腾得一塌糊涂的身体，欣赏着你起伏的[chest]和身上厚厚一层白浊光泽。");
         outputText("[pg]巧克力肤色的女人潇洒地甩开长袍，露出一副出人意料地正常的身体——除了那份格外雄伟的男性特征外，她只有两只乳房。[say: 这样可不行，]她啧了一声，用脚在你身上戳戳碰碰，[say: 不过身体可以等等。我们得先把你这里修好。]精液女巫用一根手指点了点你的额头以作强调，同时跨坐到你身上，把她那滴着液的乌黑肉棒压在你半硬不硬、沾满精液的阳具上。你的");
         if(get_player().balls > 0)
         {
            outputText("睾丸");
         }
         else
         {
            outputText("前列腺");
         }
         outputText("刚在那场仿佛被榨空的高潮中受尽刺激，仍然敏感得要命，你浑身一颤，想要退开，却无处可逃。温柔的双手按在你脑袋两侧，将你固定住；那欲火焚身的双性人开始吟唱，每念出几句奥秘的词句，便缓缓用身体在你沾满精液、滑腻不堪的腰腹间磨蹭一下");
         if(get_player().balls > 0)
         {
            outputText("，两副滑溜溜的卵袋彼此弹跳、摩擦着");
            if(get_silly())
            {
               outputText("。好极了，现在变成男同了");
            }
         }
         outputText("。");
         outputText("[pg]一阵低低的嗡鸣在你耳边响起，太阳穴也随之泛起逐渐增强的麻痒。吟唱结束时，你视野边缘浮现出一层淡粉色的光芒，那嗡嗡声也更加强烈，在你脑中有力地震荡着。腰间传来的刺激与渗入脑海的强大魔力交织在一起，让你的思绪四散崩裂；即便你努力想把碎片拼凑成有意义的意识，它们也仍然不断破碎。你从未经历过这样的事，一直试着思考、反应，哪怕做点什么也好，可每一次，刚成形一半的念头都会被震得散开，融化成糖浆般黏稠的一片空白。过了一会儿，你索性放弃了。感受……体验此时此刻……这便成了你的整个世界。");
         outputText("[pg]当你的记忆开始碎裂，震散成一小片一小片时，你毫无反应。它们滑入你颅底那片粉红色泥沼，一一溶解进粉红的欢愉之海。你曾经偷东西被抓的那段经历渐渐消失，连同童年的一两年也一并褪去，被不断上涨、纯粹而无思的感官 bliss 所取代。[EachCock]再次喷发，在精液女巫的命令下断断续续地射出，每一道都完美配合着她那根黑色阳具抽送的节奏。每一次喷射，都会有更多记忆与知识化作烂泥。很快，连你的目的也消失了。你的眼睛翻了上去，身体仍不停射精，成了一个只剩高潮快感的空壳。");
         outputText("[pg]午夜色肌肤的魔法师猛地抽身离开，粉红光芒从你的视野中褪去。她已经完全勃起，龟头巨大而充血，随着每一下心跳颤抖着，竭力忍住不射。哪怕她不再触碰你，你仍在持续高潮，沉溺在无休止的极乐里，即便你的[balls]");
         if(get_player().balls > 0)
         {
            outputText("被排空");
         }
         else
         {
            outputText("被排空");
         }
         outputText("，珍珠般的液流也断了。沙之母从头到尾都在一旁看着，此时一只手伸进长袍里，仔细地抚弄着自己的胯间。隔着完全湿透的丝质长袍，你也能轻易看出她正在自慰；而另一只手则一下下挤压、吮榨般地从她四只乳房中挤出白色液流，一只接一只。");
         outputText("[pg][say: 既然你已经空了，就该把你填满了，]一个丝滑的嗓音庄重地宣告。你感觉到一股压力抵在你的[vagOrAss]，毫无预警、也毫无阻力地顺滑滑入你体内。那根肉棒上覆盖的精液多得惊人，让进入变得轻而易举，整根很快便没入你体内，只有湿漉漉的卵袋拍在你[butt]上的黏腻水声宣告它已经完全插入。深巧克力色的施法者呻吟着吟唱，话语中染上快感，还夹杂着欢喜而含糊不清的喘息。她那粗大的肉棒在你紧紧收缩的");
         if(!get_player().hasVagina())
         {
            outputText("肠腔");
         }
         else
         {
            outputText("肉褶");
         }
         outputText("中微微胀粗，下方起伏的卵袋因满载液体而晃动，贴着你越来越膨大。它们变得越来越沉，直到发出清晰的水声，像是需求已经快要压抑不住；每一颗都大得像你的半边屁股，又软上三倍。");
         if(!get_player().hasVagina())
         {
            get_player().buttChange(12,true,true);
         }
         else
         {
            get_player().cuntChange(12,true,true);
         }
         outputText("[pg]你体内那颗肿胀的龟头向外胀开，在你身体里形成严丝合缝的插入封口。紧接着，粗大的肉茎喷吐出滚烫的精液，强行把热流注入你的最深处。第二双手轻轻贴上你的太阳穴，一个熟悉却想不起的声音接过了咏唱。嗡鸣声再次响起，信息开始随着奔流的精液节奏涌入你的脑海。你发出一声快乐的咕哝，舌头无力地从嘴角垂下，又一次因这反常的充实感而高潮。精液灌满你的");
         if(!get_player().hasVagina())
         {
            outputText("肠道");
         }
         else
         {
            outputText("子宫");
         }
         outputText("，以足以发出水声的力道泵入你体内，在里面翻涌搅动，轻轻撑厚了你的腹部。一道晶体般的格架从那精神浆液中构筑而起，攀升进一个全新的参照框架，里面充满了他人的思想与经历——不，是你的过去。新的记忆填补了空白，而你的肚子也随之隆起，形成一个小小的鼓包，足以被轻易误认成怀孕。");
         outputText("[pg]杂乱冲突的思绪逐渐汇聚起来，你在令人迷惑的粉色雾霭中眨了眨眼，理解力重新占据脑海。你隆起的肚腹带着液体的重量晃动，肚脐也被顶得凸了出来，暴露在所有人眼前。你的上方，你最好的朋友——精液女巫——正低头对你微笑，身体轻颤着，把最后几股种液射进你被塞得满满的");
         if(!get_player().hasVagina())
         {
            outputText("[butt]");
         }
         else
         {
            outputText("子宫");
         }
         outputText("。她满足地叹了口气，抽身滑出，紧随其后的是她那充满雄性的种液，伴着响亮的喷涌声倾泻而出。天啊，尽管她总是这样操你，可感觉仍像她第一次把你填满时一样美妙。她和集会分享了一整天后还愿意给你这么多，你真是太幸运了！你捧着自己像怀孕般鼓起的肚子，咯咯笑着道谢，然后瘫回那摊积起的精液里。眼皮沉重地垂下，你向清醒告别，在这场折磨后不安地沉入睡眠。");
         get_player().orgasm("VaginalAnal");
         menu();
         addButton(0,"下一步",menLoseToQueenMotherVolI);
      }
      
      public function loseToSandMother() : void
      {
         clearOutput();
         outputText("世界在你眼前天旋地转，而你的");
         if(get_player().get_HP() < 1)
         {
            outputText("饱受摧残、疼痛不堪的身体被过量痛楚填满，再也无法继续支撑。");
         }
         else
         {
            outputText("燥热而兴奋的身体涌满难以忍受的欲望，终于让你再也无心继续战斗。");
         }
         outputText("于是，你向后倒去，靠在墙上");
         if(get_player().get_HP() < 1)
         {
            outputText("，愤怒地咬紧牙关，眼看沙之母步步逼近。");
         }
         else
         {
            outputText("你大口喘息，沙之母逼近时，你的血液也随之沸腾。");
         }
         outputText("你不禁为她惊人的体格所折服。她高高地立在你面前，凶厉的眼中满是轻蔑，俯视着你的身体。[say:莉希丝真该有点自知之明，不该派你这种可悲的蠢货来和我们交战。我简直不敢相信，你居然能闯过我们那么多姐妹。]她叹了口气。[say:不过我想，要是就这么杀了你，反而更浪费。]");
         outputText("[pg]随着她手指做出复杂的手势，你的[armor]开始自行剥落，仿佛被无形的手一件件解开。转眼间，你的肉体便赤裸裸地呈现在她面前，任由她审视评判。");
         if(!get_player().hasVagina())
         {
            outputText("惊人的是，你的胯间出现了一道凹陷，缓缓分裂成两片饱满的肉唇，中间夹着一道湿润的缝隙。沙之母只用一个简单的法术便塑造着你的血肉，你新生小穴上方的阴阜立刻因兴奋而泛起湿亮的光泽。");
            get_player().createVagina();
            get_player().setClitLength(0.25);
         }
         outputText("她短暂地打量着你的[vagina]，看着它");
         if(get_player().wetness() <= 2)
         {
            outputText("变得湿润起来。");
         }
         else if(get_player().wetness() <= 4)
         {
            outputText("因情欲而滴出淫液。");
         }
         else
         {
            outputText("淫液不堪地淌个不停。");
         }
         outputText("[say:我们当然还能把这里改得更好。]你试图开口反对，但她很快就让你闭上了嘴。[say:不！你现在就给我明白，你能活着，全凭我们的怜悯。你的身体属于沙。你过去的人生已经结束了。从今以后，你那失败的人生将为更伟大的目标效力。]");
         outputText("[pg]你试图反抗，但");
         if(get_player().get_HP() < 1)
         {
            outputText("你饱受摧残的身体传来的疼痛");
         }
         else
         {
            outputText("色欲的冲动充满你的感官，");
         }
         outputText("阻碍了你所有反击的尝试。你试图辩解，说自己并不是恶魔的仆从，说你和她一样，是为了自己的族人在对抗恶魔，可每当你张开嘴，她都会用魔法再次强迫你闭上。[say:我对恶魔仆从的谎言不感兴趣。是时候彻底处置你了。]");
         outputText("[pg]她跪下来，用手指拨弄你湿滑的小穴，逼得一阵阵快感沿着身体上涌，最终化作呻吟从你唇间溢出。[say:这个你当然还得再多一个。]沙之母伸出空着的那只手，揉捏你的奶子。");
         if(get_player().bRows() == 1)
         {
            outputText("还得再多一套这个，好确保你能和你那些即将成为姐妹的人一样，产出足够多的奶。");
            get_player().createBreastRow();
         }
         else if(get_player().bRows() == 2)
         {
            outputText("谢天谢地，你已经有足够多的乳房，可以马上开始产奶了。");
         }
         else
         {
            outputText("嗯……我们还从没见过哪位姐妹蒙福拥有超过四只乳房。我在想，也许能利用你这副不同寻常的身体。");
         }
         outputText("她捏住一颗[nipple]，你不由得发出一声愉悦的惊叫。[say:看来你很喜欢这个主意。很好。]");
         if(get_player().biggestTitSize() < 3)
         {
            outputText("[say:当然，我们还得把它们再养大一些，才适合我们的需要。]");
         }
         else if(get_player().biggestTitSize() >= 14)
         {
            outputText("[say:嗯……有这么巨大的乳房，我相信你能产出的奶一定比我们大多数姐妹都多。]");
         }
         outputText("[pg]沙之母的手指滑过你的阴唇，挑逗着它们，时不时探入你的入口，又用拇指揉弄你的阴蒂。你的[skinfurscales]上渗出一层薄汗。[say: 是啊，你真的开始喜欢这个主意了，对吧？]你刚要点头，却又恢复了神智。[say: 我明白了。你还需要再被说服一下。]她捏住你的阴蒂，一阵高潮开始在你的[hips]里颤动。[say: 当然，这一点从来都毫无疑问。就算我能让你接受我们的想法，我也永远不可能完全信任你。]");
         outputText("[pg][say: 姐妹们！把精液女巫带来！]沙之母下令时微笑着。她看着你的身体一阵抽搐，双乳");
         if(get_player().biggestTitSize() < 5)
         {
            outputText("轻颤");
         }
         else if(get_player().biggestTitSize() < 10)
         {
            outputText("弹跳");
         }
         else
         {
            outputText("剧烈颤抖");
         }
         outputText("，回应着她在你体内手指的每一次抽动。");
         if(get_player().lactationQ() >= 50)
         {
            outputText("乳汁已经开始顺着你乳房的隆起处流淌下来。");
         }
         outputText("她的手指开始压得更深，像拨弄乐器一样挑逗着你的敏感带，将你身体的快感拨向新的高度。她玩弄着你的小穴，直到你一次又一次在她的手掌周围高潮，淫液沿着她的手臂喷涌而下。你腰部以下的一切都脱离了你的控制，臣服于她的摆布。你高潮着，能做的只有抓揉自己的乳房，在浸透全身的快感浪潮中起伏。");
         outputText("[pg]等到沙之母终于把你大脑中的快感中枢搅成一团浆糊时，一个披着长袍的身影已经走进房间。透过情欲的迷雾，你眯起眼睛，看清那是一名黑檀肤色的女人，身上的长袍沾满了新鲜的白色污渍。长袍没能遮住她那根尺寸惊人的勃起物，足以让大多数普通男人自惭形秽。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,839) == 1)
         {
            outputText("她显然就是你遇到过的那位精液女巫，而且她明显已经恢复了力量！");
         }
         else
         {
            outputText("这一定就是沙之母派人去叫来的精液女巫！");
         }
         outputText("[pg]她和沙之母来回低声交谈，似乎在某件事上意见不合。从精液女巫投向你的目光来看，你推断她们讨论的正是你。最后，精液女巫皱起眉，用足以让人听见的声音说道，[say: 我觉得我们不需要它，但你说得对。浪费了也可惜。]她向沙之母鞠了一躬，随后朝你走来");
         if(get_player().bRows() <= 2)
         {
            outputText("，欣赏着你已经拥有的那额外一对乳房");
         }
         else
         {
            outputText("，欣赏着你喘息的躯干上竟然长出了 " + Utils.num2Text(get_player().bRows()) + " 排乳房，而不只是两排");
         }
         outputText("。");
         outputText("[pg]那名巧克力肤色的女人夸张地甩开长袍，将她那具结实得不可思议的身体俯低到你的大腿之间。尽管她有一根尺寸夸张的人类阴茎，而且已经挺立到超出你的预期，但她整体的身形相当女性化，也很正常——只有一对乳房。她戳了戳你彻底湿透的小穴，说道，[say: 这里也得改改。只有一个根本不够，不过眼下身体方面还不是最优先的。]她把肉棒对准你小穴的褶皱之间，随即刺入你体内，像是在试探你的深度一样将整根长度推进去。适应之后，她把双手抬到你头部两侧，而肉棒则以稳定的节奏抽插着你的小穴。[say: 这上面……]她用手指点了点你的头，同时调整你的脸，让你直视她的双眼，[say: ……才是我们得先修好的地方。]");
         get_player().cuntChange(12,true,true);
         outputText("[pg]那名深肤色的双性人开始随着稳定的抽插吟唱。你试图挣扎，但在虚弱又兴奋的状态下根本毫无用处。你能做的只有看着她的眼睛，听着她的声音，让那些词句填满你的脑海。咒文强行挤进你的思想，就像她那根勃胀的男根正强行挤进你的身体一样。你的大脑仿佛嗡嗡作响，被她的话语填满，而你的小穴也在颤抖着，被她的肉棒填满。被填得这么满，却没有足够的空间。");
         outputText("[pg]你感觉自己的皮肤之内变得拥挤不堪。那种被塞到快要胀裂的感觉充满了你。这具身体里没有足够的空间容下你们两个。[say: 觉得很满吗？]她狡黠地问。[say: 已经没有空间了？]你忍不住点头。[say: 容不下我们两个了，对吧？可等我射出来的时候，又会发生什么呢？]这个念头让你的脊背一阵发颤。你感到一种令人不适的满胀，而只要一想到还要再被填进去哪怕一点点，你的肚子就仿佛因即将胀裂而隐隐作痛。");
         outputText("[pg][say: 我要，嗯……快射了，小家伙。你最好给它腾出空间。]恐慌开始在你混沌的脑海中蔓延。如果不腾出空间，你就会被胀裂，可要怎么做？[say: 放手吧，小家伙。你里面太拥挤了，而且你想要我的精液，对吧？]这听起来确实很有道理。如果精液女巫在你体内，而你也在你体内，那你们之中就必须有一个离开；既然你喜欢体内充满精液，那么应该离开的就是你……对吧？");
         outputText("[pg]精液女巫乌黑的肉棒变得更加粗胀，黏稠的一团团种子在其中充满。随着第一股滚烫的精液射入你的小穴，你感觉自己的意识正在滑落。思绪分崩离析，为精液腾出空间。记忆被抛到一边，为精液女巫必须赐予你的珍贵精华让路。梦想、希望、野心，全都瓦解，被丢弃，只为了给她腾出更多位置。[say: 对，小家伙。就这样放手。让我得到你、填满你、占有你……]这听起来很合理。精液女巫已经填满了你，所以把你的身体交给她大概才是最好的。反正正在使用它的是她。你真正想做的，也只是让它被精液填满而已，而她可以替你做到。她可以替你做一切……你只要让她来……你只要屈服……只要屈服……屈……服……");
         outputText("[pg]精液女巫的高潮结束时，苍白的精液从你的[vagina]中汩汩流出。你淫荡肉体里的每一块肌肉都绷紧了，一次又一次地达到高潮，每一次高潮都在慢慢掏空你的意识。快感成了你唯一能理解的东西，你的表情也变得空洞茫然。也是你唯一想要的东西。永远……");
         outputText("[pg][say: 结束了吗？]沙之母问道，一只手探在自己的大腿之间，一边看着这场景，一边淫荡地揉弄着自己。");
         outputText("[pg]那巧克力色肌肤的女巫站起身来，半硬的肉棒垂在双腿之间，滴落着你小穴的淫液与她精液混合而成的汁液，[say: 我已经为她注入了新的使命。]她低头看着你那被汗水浸湿、仍沉浸在性爱余韵中发颤的身体。[say: 现在，该处理她的肉体了。]");
         get_player().orgasm("Vaginal");
         menu();
         addButton(0,"下一步",sandMotherBadEndsLadiesEpilogue);
      }
      
      public function loseToSammitchMob() : void
      {
         if(get_player().hasCock() && get_player().biggestCockArea() >= 6)
         {
            memeberedFolksFindTrueWuv();
            return;
         }
         clearOutput();
         if(get_player().get_HP() < 1)
         {
            outputText("你倒在泥土地面上，遍体鳞伤，再也没有继续战斗的意志。沙漠女巫们全都围了上来，讥笑着你的软弱。你视线模糊，抬头望着那些高高俯视着你倒地身躯的黑影，只能想着她们接下来会对你做什么。");
         }
         else
         {
            outputText("挫败感压得你几乎喘不过气，你倒了下去，只能用你的[weapon]支撑身体。你的视线一片模糊，腰间渴望被触碰，而沙漠女巫们全都围了上来。其中一个走到你喘息的身体前，一脚把你的[weapon]从你身下踢开，让你脸朝下摔在地上，引得这些女人一阵笑声和窃笑。你翻过身仰面躺着，看向那些笼罩在你上方的身影。");
         }
         outputText("[pg]她们把你的[armor]一件不剩地撕下来，然后把它");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,838) == 0)
         {
            outputText("像垃圾一样扔进火里");
         }
         else
         {
            outputText("丢到一旁");
         }
         outputText("，让你赤身裸体地暴露在这些迷人的女人面前。");
         if(get_player().hasCock())
         {
            getMockedForSmallDongBySammitchMob();
         }
         else
         {
            femaleGirlsLoseToSammitches();
         }
      }
      
      public function lionpaws(param1:Boolean = false) : void
      {
         clearOutput();
         if(param1)
         {
            outputText("[say: 真的吗，[name]？] 萨努拉坏笑着摇了摇头。[say: 我大概不该因为你开口就做这种事，不过你对我爪子的着迷实在可爱得让人没法拒绝。来吧，脱给我看，我这就开始。] 你照做了，开心地把盔甲扔到一边。[EachCock]早已因期待而挺立起来，在你面前自由地弹跳着。斯芬克斯盯着");
            if(get_player().cockTotal() == 1)
            {
               outputText("它");
            }
            else
            {
               outputText("它们");
            }
            outputText("，眼中满是欲望，一时被你肉棒摇晃的动作迷住了");
            if(get_player().cockTotal() > 1)
            {
               outputText("");
            }
            outputText("。");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,841) == 0)
         {
            outputText("萨努拉听到你的要求，挑起眉毛，表情介于惊讶和好奇之间。[say: 呃，这要求还真有点奇怪，不过既然这是你的愿望，我想我也该照办。] 你没打算给她更多考虑的机会，直接脱下盔甲扔到一旁。[say: 说实话，以前还真没人向我提过这种要求……我先为自己的生疏道个歉，[name]。] 斯芬克斯低头看着自己的爪子，显然不明白你为什么偏偏要提出这个。");
         }
         else
         {
            outputText("[say: 又来？] 萨努拉歪着头问道。[saystart]它们摸起来一定比我想象中舒服得多……那好吧，把衣服脱了，我照你说的做。");
            if(get_player().biggestCockArea() > 100)
            {
               outputText("反正除了这个，我对你那怪物一样的家伙也没多少别的办法。");
            }
            outputText("[sayend] 她抬起一只爪子仔细打量，像是在琢磨你到底喜欢它们哪一点。等你脱下最后一件盔甲后，你咳了一声引起她的注意，把她从出神中拉了回来。");
         }
         outputText("[pg]萨努拉让你跪下，你急切地照做了。");
         if(get_player().get_lust100() < 50 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,841) == 0)
         {
            outputText("就在你跪倒在萨努拉面前时，你的肉棒");
            if(get_player().cockTotal() > 1)
            {
               outputText("");
            }
            outputText("开始");
            if(get_player().cockTotal() == 1)
            {
               outputText("");
            }
            outputText("因期待而变硬，同时你也在脑中想象这究竟会是什么感觉。");
         }
         outputText("斯芬克斯也弯下身，让她的头与你的胯间齐平。她轻轻一跃，将那双大爪子环上你的腰，粗鲁地把你拉近。守护者没有浪费时间，用柔软而娴熟的舌头沿着");
         if(get_player().cockTotal() > 1)
         {
            outputText("");
         }
         outputText("你的");
         if(get_player().cockTotal() > 1)
         {
            outputText("几根");
         }
         outputText("肉棒");
         if(get_player().cockTotal() > 1)
         {
            outputText("");
         }
         outputText("的茎身舔弄起来。");
         if(get_player().get_lust100() < 50 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,841) == 0)
         {
            outputText("没过多久，她口舌的服侍便让你的肉棒");
            if(get_player().cockTotal() > 1)
            {
               outputText("");
            }
            outputText("彻底挺立起来，因渴望更多刺激而搏动不已。你不知道她具体打算怎么做，但你觉得事情正朝着不错的方向发展。");
         }
         outputText("她娴熟而绵长的舔弄有条不紊地将你的阴茎裹上");
         if(get_player().cockTotal() > 1)
         {
            outputText("");
         }
         outputText("一层闪亮的唾液。过了一会儿，她抬起头，打量着自己的成果。");
         outputText("[pg]她显然认为");
         if(get_player().cockTotal() > 1)
         {
            outputText("它们");
         }
         else
         {
            outputText("它");
         }
         outputText("已经足够润滑，萨努拉抬起一条前腿，小心地把爪子伸向你的胯间。");
         if(get_player().get_lust100() < 50 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,841) == 0)
         {
            outputText("你惊讶地挑起眉毛，却也没什么余力阻止她的脚继续靠近。");
         }
         outputText("她调皮地拍了拍你的肉棒，轻轻一拨让它弹动起来，同时发出撩人的咕噜声。看了一会儿后，她有些迟疑地向前探去，让爪垫小心翼翼地贴向");
         if(get_player().cockTotal() > 1)
         {
            outputText("你的其中一根");
         }
         outputText("阴茎");
         if(get_player().cockTotal() > 1)
         {
            outputText("");
         }
         outputText("，把你的肉棒压向腰间，还因努力保持动作轻柔而微微发颤。她的爪垫被沙漠的砂砾磨得柔软而温暖，轻轻包住你的肉棒。她缓慢而迟疑地开始上下摩擦，爪垫顺着你湿滑的皮肤滑动。");
         if(get_player().smallestCockArea() < 100)
         {
            outputText("当她稍稍加重力道压上来时，你的阴茎滑进了她两根趾头之间。她继续缓慢而有节奏地动作，握得也稍紧了一些；当她擦过你的腹部时，你不禁庆幸她的爪子能收放自如。");
         }
         outputText("[pg]萨努拉不停套弄着你，棕褐色的蓬松毛发挠得你发痒；你肉棒上仍覆着厚厚一层唾液，让她的动作变得无比顺滑。她宽大柔软的爪垫包裹着你，舒服而愉悦的触感强烈得仿佛随时都会将你的肉棒吞没。");
         if(!param1 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,841) == 0)
         {
            outputText("这感觉以一种奇妙的方式令人沉醉；虽然这绝不是你预料中会得到的待遇，但你确实能感觉到欲火正被她的脚一点点推高、堆积起来。");
         }
         if(get_player().cockTotal() > 1)
         {
            outputText("斯芬克斯不愿冷落你的其他肉棒，便俯下身，再次舔弄并吮吸那些没有被她爪子压住的阴茎。她的舌头在一根根肉棒之间游移，挑逗着你的龟头；更鲜明的快感穿插在她脚下持续不断的取悦之中，令你浑身一颤。");
         }
         outputText("那毛茸茸的温暖感受让你的脑子一片迷蒙，你有些恍惚地站在原地微微摇晃，任由她随着动作将你前后带动。");
         outputText("[pg]虽然她的服侍确实很舒服，但这场爪交生涩而不稳定，随着你肉棒里的紧绷感不断累积，反而让你更加渴望更多");
         if(get_player().cockTotal() > 1)
         {
            outputText("");
         }
         outputText("。你突然抓住她的脚踝，她困惑地抬头看向你，大概以为你是要她停下。不过你很快就引导她换成更稳定、更快速的动作，引得这只调皮的斯芬克斯咯咯笑了起来。有你的手在旁引导，她更自信地压向你，不再那么害怕弄伤你。你带着她的爪子越滑越快，迫切想要更多刺激，好让自己射出来。感觉这样还不够，你又把她另一只按在你腰上的大爪子拿过来，将爪垫也压在你的阴茎上，像使用某种古怪的性玩具一样，用她的双脚包住你的[cock biggest]。萨努拉并没有因为被如此奇特地使用而不快，反而娇声轻哼，更紧地抓住你的肉棒，沉浸在这份怪异的体验中。你配合着她的套弄微微挺动腰身，没过多久，熟悉的需求与热意便在体内涌起。");
         if(get_player().cumQ() < 250)
         {
            outputText("[pg]最后几下推进后，你终于释放出来，一股股浓稠精液沿着她的腿喷洒而出。");
         }
         else
         {
            outputText("[pg]大量精液从你的肉棒中喷涌而出");
            if(get_player().cockTotal() > 1)
            {
               outputText("");
            }
            outputText("像喷泉一样，把你和萨努拉都淹没在你的精液洪流之中。喷射完全没有停下来的意思，精液在你体内翻涌、灼烧着。斯芬克斯想要躲开这突如其来的大量精液，却毫无作用：她上下半身都被涂成了白色，你的精液从她的头发一路滴到皮肤、毛发和翅膀上。她至少想把脸擦干净，却只把更多精液抹到了脸颊上。她叹了口气，把手上能甩掉的东西甩了甩。");
         }
         outputText("高潮过后的疲惫让你松开了她，只剩斯芬克斯用自己的肉垫轻轻施压，把最后几滴精液挤出来。萨努拉重新站起身，笑了起来。[say:瞧瞧你弄得多乱！]她把弄脏的爪子按在你胸口，把你往后一推，轻轻松松就让你摔坐在自己的[ass]上。[saystart]嗯，这还真是……有意思");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,841) > 0)
         {
            outputText("一如既往");
         }
         outputText("，[name]。现在把衣服穿回去吧，我还得守神殿，还得清理这身毛呢。[sayend]说完，她转身迈着爪步离开你，趴在门前，舔着自己的");
         if(get_player().cumQ() < 250)
         {
            outputText("腿。");
         }
         else
         {
            outputText("被染白的毛发，徒劳地想把你的一些精液舔掉。");
         }
         get_player().orgasm("Dick");
         dynStats(DynStat.Sens(-2));
         menu();
         if(param1)
         {
            get_game().inDungeon = false;
            addButton(0,"继续",get_camp().returnToCampUseOneHour);
         }
         else
         {
            menu();
            addButton(0,"进入",openZeDoorToParadize);
            addButton(14,"离开",exitDungeon);
         }
      }
      
      public function lesboMilkFilling() : void
      {
         clearOutput();
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,851,FlagDict_Impl_.arrayReadInt(_loc1_,851) + 1);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,851) == 1)
         {
            outputText("你环顾四周，确认没人窥探后，故作神秘地压低眉头，打听起沙之母的感情生活。");
            outputText("[pg]沙之母微微脸红，一只手漫不经心地在泛红的脸颊旁扇了扇，随后将一缕白金色的发丝从脸上拨开。她紧张地咬住下唇，才承认道：[say: 这并不关你的事，勇者。不过，没有。我的职责相当繁重，实在太忙，没空让子嗣拖累自己。而挤奶器已经能提供我所需的所有……刺激。]她巨大的乳头正缓缓硬起，将丝绸长袍从乳房上顶开，带着渴求挺立起来。她调整姿势、交叠双腿时，你发誓自己能听见那对硕大圆乳里丰沛的乳汁晃荡作响。紧接着，你闻到了明显的女人发情时的气味。");
            outputText("[pg]你看着她挺硬、湿润的乳头，打趣说她似乎不止在一个方面都欲求不满。她顺着你的视线低头看向自己的胸口，身体明显地扭动起来，喘息道：[say: 怎……我……我没有……]她发光的眼睛瞥向你的[chest]，在你靠近她的王座时打量着你柔软的身形。她无意识地舔了舔嘴唇，又松开了那根正绕着闪亮发丝打转的手指。");
            outputText("[pg]她叹了口气，承认道：[say: 我确实……呃……确实有些需求。也许交合一下，终究会有些好处。]");
         }
         else
         {
            outputText("你环顾四周，确认没人窥探后，故作神秘地压低眉头，问她是否想让你照料一下她更原始的需求。沙之母看向你的胯间，舔了舔嘴唇，乳头在长袍下挺起，撑出两个硬硬的小帐篷。她用手指绕着一绺头发，低声娇吟道：[say: 嗯，稍微交合一下，让脑子清醒清醒，或许正是我需要的。]");
         }
         outputText("[pg]你让自己的[face]上露出急切而愉悦的表情，剥下盔甲上半部分，露出随着兴奋喘息而起伏的[chest]和[nipples]。沙之母带着淫邪的表情注视着你，同时敞开自己袍子的上半截。她四片乳晕又大又湿，沾满乳白的滴液，那粗粝的纹理在诡异的光线下泛着暗光，新鲜液体凝在她那因欲望而绷紧的巨大乳头上。你扭动着脱下下装，把双手高高举过头顶，弓起后背");
         if(get_player().biggestTitSize() >= 10)
         {
            outputText("，[fullChest]诱人地摇曳着，摆出撩人的姿势");
         }
         outputText("。摆脱身上束缚的快感，几乎不亚于勾引这位乳汁女术士们的女王，而你");
         if(get_player().biggestTitSize() >= 2)
         {
            outputText("捧起自己的双乳");
         }
         else
         {
            outputText("双手顺着胸口向下抚去");
         }
         outputText("，一边向她走近。");
         outputText("[pg][say: 哦，伟大母亲在上，]这位晒成褐色的施法者低声娇吟道，[say: 过来……我积了这么多奶，正好知道该把它们灌到哪里去。]她眨了眨眼，抓住自己一只乳头的根部，挤出一道细细的乳流，同时把更多乳汁逼进那鼓胀、足有三英寸长的乳头里。她朝你勾了勾手指，掀起长袍下摆，用空着的手指随意抚过自己肿胀而黏湿的阴阜。沙之母开始取悦自己，口中轻轻呜咽，但她的目光始终锁在你身上，许诺着诱人的快感，以及一场彻底的乳汁灌注。");
         if(get_player().isTaur())
         {
            outputText("[pg]你轻快地走到她面前，想要含住她的乳头喝上一口，可她却在最后一刻把那滴淌的喷口移到了一边。[say: 啧啧，顽皮的小马。我可没说是让你喝的，]她微笑着说道。她的手怜爱地抚过你的脸颊，示意你转过身去；你照做了，随即恍然大悟——她是要把乳头塞进你的[vagina]里！你向后退去，尽量把自己的马身后躯贴近她。你的后腿撞上她的膝盖和王座，阻住了去路，但这已经足够近，足以让你感觉到她那颗粒状、湿透的肌肤贴上你的阴唇，甚至擦过你的[clit]。");
         }
         else
         {
            outputText("[pg]你靠近她，想要含住她的乳头喝上一口，可她却在最后一刻把它移开了。[say: 啧啧，顽皮的[boy]。我可没说要让你喝我的奶，]她微笑着说道。她的手怜爱地抚过你的臀侧，让你自己琢磨这句话的意思；随后，她把沾满欲望的手指从黏湿的私处抽出，转而伸向你的[vagina]。她分开你的阴唇，露出里面闪亮的缝隙，拇指抚过你的[clit]，让那层含义慢慢变得清晰——她想用乳头操你！她松开你敏感得发疼的褶皱，抓住你的[hips]把你举了起来，动作间把混合的爱液抹到你右侧身上。她强得惊人，就算对一个八英尺高的女人来说也是如此");
            if(get_player().get_tallness() > 72 || get_player().isTaur())
            {
               outputText("，不过从她双手周围的光芒判断，她用了些魔法来帮忙");
            }
            outputText("。她那颗粒状、湿透的顶端诱人地滑过你的下身，恰到好处地擦上你的[clit]，只等着被狠狠顶进去，开始用乳汁给你灌种。");
         }
         outputText("[pg]她更用力地压向你时，你咬住自己的嘴唇，试图压下愉悦的呻吟；那异常结实的乳头几乎没有遇到多少阻力，便滑进了你体内。它被滴淌的乳汁和你滚烫的分泌物润得如此滑腻，以至于你几乎怀疑她能把整只淫乱的乳房都塞进你身体里，但你知道那不可能。本能地，你迎着那股温热而令人欢迎的压力向后顶去，用力把小穴在她带着纹理的乳房皮肤上研磨。温热的液体几乎立刻涌进你的甬道，比牛头人的精液还要黏稠、还要丰沛。其中一部分甚至喷进了你的子宫，而几缕漏出的乳液则从阴道口溢出，滴过你的外阴，落在这个被你骑着、乳白与巧克力色肌肤交织的女人身上。");
         get_player().cuntChange(3,true,true,false);
         outputText("[pg]你");
         if(get_player().isTaur())
         {
            outputText("捏揉自己的[nipples]");
         }
         else
         {
            outputText("抓住她的头");
         }
         outputText("，一边开始抽身退开又挺身顶回去，慵懒地用她喷涌的乳柱操弄自己，让那乳白的湿意灌满你微噘、滴液的小穴和饥渴的子宫。");
         if(!get_player().isTaur())
         {
            outputText("不知怎的，她竟能在仍把你托在半空的同时，把手从你的臀侧抽开。即使她把注意力转向别处，那里仍残留着一道发光的手臂轮廓。");
         }
         outputText("“咕啾、咕啾、咕啾。”你能听见她把手指深深插进那被冷落的女穴里；从那成双的、湿漉漉的插入声判断，她一定正把两根手指用力塞进自己那两只小穴。");
         outputText("[pg][say:噢噢，太好了，勇者，这才是我需要的，]她低声娇吟，伴随着她自我取悦时淫靡的声响。第二根三英寸长、像阳具般的乳头也和它的兄弟一起，开始顶弄你满是乳汁的裂缝。你愉悦地呻吟一声，感觉它滑入体内，把你撑得又宽又湿。它们交替进退，一股股滚烫的乳白奶油接连射入你深处。你能看见那女巫正用空着的手轮流挤压自己的乳房，一次又一次地榨弄那对产量过剩、喷涌不止的乳房。");
         if(get_player().get_pregnancyIncubation() == 0)
         {
            outputText("你可怜的子宫正被这东西灌得满满当当。它越来越撑，撑到你都觉得自己该被贴上“奶油馅”的标签了；你的腹部也随之开始鼓起一小块隆起。");
         }
         else
         {
            outputText("你可怜的孕肚子宫被这东西不断冲击，但由于你早已被填满，一股股滚烫的奶油正从那些乳头状注奶器周围的[vagina]里喷溅出来。");
         }
         get_player().cuntChange(6,true,true,false);
         outputText("[pg][say:好——，]你发现自己嘶声呻吟着，");
         if(get_player().isTaur())
         {
            outputText("希望能揉揉自己鼓胀的肚子");
         }
         else
         {
            outputText("揉着自己鼓胀的肚子");
         }
         outputText("。你的[vagina]感觉就像某种活生生、会呼吸的东西，吞饮着乳汁，只回馈出一道道足以填满灵魂的快感闪电。被淫靡的感觉折磨得浑身发颤，你趴在沙之母身上，无助地骑弄着她的乳头。她又把第三根挤到你身上，却没能在你被塞满的裂缝里找到入口。那多出来的乳头只是对着你的入口喷洒，湿滑地压过每一道潮湿、被情欲浸透的褶皱。你的[vagina]抽搐着痉挛，把那些乳尖更深地吸入体内；就在它于一次次吮吸收缩之间稍稍放松时，第三根终于找到了位置，伴着一阵白液爆发，消失在你垂涎般饥渴的蜜穴里。");
         get_player().cuntChange(9,true,true,false);
         outputText("[pg]沙之母喘息着说：[say:太舒服了。乳汁怎么样，勇者？好喝吗？你的小穴吞得可真棒！]");
         outputText("[pg]的确很棒。你朝她点点头，同时注意到她舌头耷拉出来的模样，以及她自慰声迅速加快的节奏。她很快就要高潮了，而且她的乳头大概会像她那两只小穴一样喷得厉害。你的思绪被你塞满的三角地带里突如其来的侵入打断——那是……那是第四根乳头进到你里面了吗？随之而来的乳液注入，证实了你惊讶的意识正努力接受的事实。四根乳头几乎不停地往你体内喷射。诸神啊，你快被灌满了！");
         if(get_player().get_pregnancyIncubation() == 0)
         {
            outputText("你能感觉到自己的腹部变得圆滚滚的，剧烈摇晃着。啵！你的肚脐被撑成了外凸，体内也多了一份摇晃而令人安心的重量。四个月……五个月，不——六个月……你放弃了计数；但每过一秒，你都变得越来越大，看起来已经和你成长过程中见过的任何孕妇没什么两样。");
         }
         else
         {
            outputText("你能感觉它从你体内喷涌而出，回流般溅到女巫身上，让她的肌肤在白色潮水下变得油亮。如果你不是已经怀孕，恐怕早就被她这份乳液负荷撑得鼓胀起来，变成一个圆滚滚、灌满奶汁的奶油气球了。");
         }
         outputText("[pg][say:呃，啊……要、要高、高、高潮了——！]沙之母含混地叫着，女穴里喷出的湿液像一阵女液之雨般溅在你的[butt]上。她尖叫道：[say:操，太爽了！爽死了！]随后彻底失神。她把四只乳房拢在臂弯里，同时用力挤压；你顿时被仿佛好几加仑喷涌快感般的东西塞满。你的身体本就已经攀向高潮，而这爆发性的注入对你狂喜、颤抖的小穴唇来说实在太过猛烈。你呻吟着，高潮的热浪在体内扩散，最终化作一阵强烈到让小穴紧紧夹住的收缩，逼得那些乳头在被弹出去前的一瞬间，把最后的乳汁全都倾泻在你体内。乳白的内射液沿着你的[legs]滴落，而你抽搐的[butt]落进女巫的腿间，漏得她满身都是。");
         outputText("[pg]这位女术士女王把手指探进你满是乳汁的蜜穴，掬起一把不断渗出的淫液。她把它送到唇边，尝到味道时愉悦地哼了一声，随后又分给你。你沉浸在狂喜中，根本无暇在意；每当她把手掌送到你唇边，你都会淫荡地把上面的东西舔个干净，而她也一次又一次地这么做。");
         outputText("[pg]你叹了口气，最终从心满意足的女巫身上分开；不过在那之前，你先给了她一个漫长而湿润的吻。");
         outputText("[pg][say:或许下次我们的欲求再次失控时，可以彼此照料一番，]她提议道。是啊，你或许确实该这么做。");
         get_player().orgasm("Vaginal");
         doNext(playerMenu);
      }
      
      public function leaveAloneSendLackeysToggle() : void
      {
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,854) == 0)
         {
            outputText("你请求沙漠里的斥候别再用那些带刺的魔法邀约来烦你。你不想非得和她们斗殴不可，那对双方来说都是白费力气，你觉得这事该到此为止了。");
            outputText("[pg]沙之母晒成棕褐色的面容依旧毫无表情，静静消化着你的请求。沉默几乎变得有形，而且拖得越久，你就越怀疑自己是不是犯了什么忌讳。");
            outputText("[pg][say:好吧，]她简短地说道，语气利落得让你微微一惊。她炽亮的双眼盯住你，继续说道：[say:我的姑娘们不会在你的旅途中打扰你。但你要知道，要做到这一点并不容易——我们的集会并不习惯对潜在新成员作出如此细致的甄别。]她双臂抱在胸前，摆出一种高傲而不容置疑的收尾姿态。");
            outputText("[pg]好吧，你想这算是成功了。");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,854,1);
         }
         else
         {
            outputText("你提到说，如果女巫们像以前那样试着招募你，你也不介意。");
            outputText("[pg][say:真的吗？]沙之母娇声说道，声音里带着一丝急切。[say:你不反对我解开斥候们的缰绳，让她们试着……塑造你？]");
            if(get_player().cor > 66)
            {
               outputText("[pg]你自信地咧嘴一笑，回答说你欢迎这样的挑战。");
            }
            else if(get_player().cor > 33)
            {
               outputText("[pg]你苦笑着告诉她，这会是个能让双方都变强的好挑战。");
            }
            else
            {
               outputText("[pg]你用脚尖蹭着地面，努力掩饰听到她的话后泛起的脸红，但还是告诉她，这能当作不错的斗殴练习。");
            }
            outputText("[pg]这位集会女王微微一笑，双眼燃着欲望，宣告道：[say:那就这么定了。希望下次我们见面时，你的乳头一路拖在地上、一路漏着奶去浴室，你也不会太介意。]她的乳头隔着厚重长袍明显挺立起来，因自身的乳欲而濡湿了布料。她愉快地哼着声，唤来一名地位较低的女巫服侍她。年轻的女法师抵达后，便受命去传达消息；但在离开前，她还用漫长而淫荡的目光看了你一眼。");
            outputText("[pg]你突然不太确定这是不是个好主意了。");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,854,0);
         }
         doNext(sandWitchMotherFriendlyMenu);
      }
      
      public function ladyVictorySex() : void
      {
         clearOutput();
         outputText("你脱下衣物，伴着一声柔媚的叹息将它们丢到一旁。你刚一露出自己，女巫的眼睛就开心地闪了起来。她一边看着你，一边抚摸自己硬挺的家伙，又捏了捏自己的一枚乳头。[say:如果你想让小小的我来操你，只要弯下腰就好了，亲爱的。]");
         outputText("[pg]你把一只[foot]踩在她臀上，用危险的目光制止她乱动。[say:你没资格操我，女巫。是我要操你，]你宣告道。那个身材丰满的黑辣妹荡妇把漂亮的脸皱成一副不满表情，但还是温顺地点了点头。她的小穴看起来依旧肿胀湿润，鸡巴也完全没有缩小。你凑上前，把几根手指探进她的阴道，试探一番。正如你所料，她的体液和大多数沙漠女巫的乳房一样丰沛。她在你的触碰下虚弱地扭动着，鸡巴则在腹部上欢快地晃动。你亲昵地拍了拍那根深色肉棒，又顽皮地拉扯她乌黑的皮肤。");
         outputText("[pg][say:啊……别逗我！]她一边抗议，一边试图从你探入的手指下扭开。你把手指捏成一个紧紧的圈，扣住她的阴囊向下拉，立刻让她动弹不得。这个淫荡的女人可怜兮兮地呜咽着，但你收紧握力，将手指更深地顶进她体内。尽管她很不舒服，这个黑皮美人的乳头却笔直挺立，又大又肿。她的鸡巴正把一缕缕前列腺液滴得到处都是，洒满腹部；她喘息道：[say:不要……]");
         outputText("[pg]你动了恻隐之心，松开她的睾丸，但手指仍旧留在原处。她懊恼地咬住下唇，腰却朝你扭动起来。你的手指偷偷绕到她的睾丸下方，找到她的阴蒂，开始挑弄它，在它上面、周围和下方来回滑动。那枚小小的敏感点在你指间愉快地跳动，简直像是在求你触碰、抚弄它。当然，你全都照做了，把这女人起伏不止的女性肉体挑弄得陷入一阵阵欢愉的呻吟。她像抓住救命稻草一样死死抓住你的手臂，将它往自己体内拉得更深，像报丧女妖一样尖叫着高潮了。爱液从她的小穴里喷涌而出，弄湿你的双手，于是你抽动得更快了一些，并得到更汹涌的回报。她湿滑的肉壁像虎钳一样夹住你，用近乎邪异的力道绞紧你的手；随后她就像灯熄了一样瘫软下来，虚弱地胡言乱语。");
         outputText("[pg]你把手在她大腿柔软的皮肤上擦干净，又责备她弄得这么一团糟。至于那女巫，她已经半昏半醒、喘息不止，沉溺在快感里，连理智都被冲散了。一层白色黏液在她肚子上积成一滩，但她的阴茎依然硬挺得很，似乎因为刚才那场强烈的高潮而胀得更加厉害。你小心翼翼地将它抬起，跨坐上去，用自己的[vagina]沿着肉棒慢慢研磨，让自己做好准备。直到那根肿胀的肉棒被你的雌液充分涂满，你才调整姿势，将它对准体内。");
         outputText("[pg]你缓缓坐上那根坚硬的肉柱，沉醉于它劈开你下身的感觉；它美妙地撑开你甬道的肉壁，把那里扩成一个能吞下阴茎的圆润开口。你的[clit]因热意与快感而颤动，你仍在缓慢下沉；等你终于坐到根部时，你的[legs]已经虚弱地发抖，腹部肌肉也在不受控制地抽搐、收紧。你俯下身，贴着那对棕色乳房蹭了蹭；等你开始摆动[hips]时，它们便成了让你倚靠的舒适枕头。");
         get_player().cuntChange(get_monster().biggestCockArea(),true,true,false);
         outputText("[pg]半昏迷的女巫在你身下动了动，回应着你强行还给她的性快感。[say:……什？]她问道，理解之色渐渐浮上脸庞。[say:噢……你还没完吗？]你一边套弄她的阴茎，一边咬住她的下唇，毫无顾忌地上下抽送。她所需要的唯一答案，就是你在她身上攀向高潮的身体感觉；你开始玩弄她的乳房，朝着那个目标继续努力。");
         outputText("[pg]那深色皮肤的金发女人喘着气说：[say:太快了……要……又要去了……！]她紧闭双眼，仰起头，舌头无力地歪到一边；你感觉到她的阴茎猛然爆发，沉甸甸的睾丸在你的[butt]下抽动。滚烫如熔浆的精液涌过你的甬道，用浓稠的精子浸满你的子宫，让你以另一种方式感到被填满；仿佛被生理本能触发一般，你也高潮了，用自己的雌液裹满那根粗大的肉棒。");
         if(get_player().wetness() >= 5)
         {
            outputText("它从你体内喷涌而出，化作一股湿透的洪流，彻底浇湿了扶她的腹部、臀胯和屁股。");
         }
         if(get_player().lactationQ() >= 50)
         {
            outputText("与此同时，乳汁从你的胸口喷出，淋洒在你的双性人身上。");
         }
         outputText("[pg]高潮无情地驱使着你的身体，你被迫像骑一匹尥蹶子的野马那样骑着这名双性人，不停榨取她的阴茎。你的臀胯湿漉漉地撞在这位巧克力色女士的大腿上；直到你最后一次让湿透的肉体相撞，发出回响般的啪响，你才终于缓过劲来，虚弱地倒进下方那对舒适的乳房里。女巫满足地叹了口气，开始抚摸你的[hair]，但片刻之后，她的手指便垂落下去，双眼也颤动着闭上了。");
         outputText("[pg]几分钟后你恢复过来，站起身。女巫的阳具从你体内抽离时，那股压倒性的感觉让你的腿还在发抖，但你还是站稳了，任由精液从你的[vagina]里涌出。真是一场胜利！");
         get_player().knockUp(22,360,90);
         get_player().orgasm("Vaginal");
         get_combat().cleanupAfterCombat();
         spriteSelect(SpriteDb.get_s_cumWitch());
      }
      
      public function ladyFucks() : void
      {
         clearOutput();
         outputText("你在乳白的池中转过身，将这个可爱的小奴隶紧紧拉进怀里。她惊讶地轻喘一声，但当你把双唇贴上她的嘴后，她立刻安静下来；你的双手游走过她巨大的乳房和柔软、满是乳香的身体。她依偎着你，头靠在你的[chest]上，而你把她搂在怀中，抚摸着她的黑发。这样简单地享受了片刻后，小奴隶女孩把脸颊沿着你的乳房蹭动，用丰满而暗色的双唇含住你的[nipple]。她轻轻吮吸，你发出一声长长的呻吟");
         if(get_player().lactationQ() >= 200)
         {
            outputText("，从你母性的储备中吸出一小缕乳汁。她深深吞咽，仰头朝你微笑，一滴你的乳汁顺着她的下巴滑落，滴入由她自己的乳汁汇成的池水里");
         }
         outputText("。她的手沿着你的身体向上滑，掠过你的阴户和[clit]，随后托住你另一只乳房，纤细的手指圈住你的[nipple]。她动作娴熟而灵巧，把你的乳头夹在指间揉弄，像对待自己的乳房一样");
         if(get_player().lactationQ() >= 200)
         {
            outputText("，用你从未体验过的高超手法为你挤奶；这又有什么奇怪的呢，毕竟她的整个存在都围绕着同样的技巧打转？");
         }
         else
         {
            outputText("。");
         }
         outputText("[pg]你向后靠在池沿上，双臂搭在边缘，任由那女孩在你身上施展她的本事。很快，你的胸口便随着她每一次触碰而起伏、颤抖。你几乎没注意到女孩的另一只手消失在乳白色的波浪下，多半是去照顾她自己了；与此同时，她的舌头和手指正用令人难以置信的方式挤压、爱抚着你的");
         if(get_player().lactationQ() >= 200)
         {
            outputText("涨满乳汁的");
         }
         outputText("乳头。她捻弄、按摩、吮吸、亲吻着你坚硬如石的顶端，你在这一连串动作下呻吟低喘，酥麻的快感如电流般穿过胸口，直到全身都为之颤栗。你几乎是无意识地用[legs]缠住这个奶香四溢的女孩的腰，把她越来越紧地压向你湿透的身体，尽可能将你的[nipple]送进她那张技巧惊人的嘴里。");
         outputText("[pg]很快，你感觉到一股奇异的压力从乳房深处涌起。你花了一瞬才意识到那是乳房高潮；而当它真正袭来时，你在近乎野性的快感中仰起头");
         if(get_player().lactationQ() >= 200)
         {
            outputText("，把乳汁喷得自己和引发这场爆发快感的挤奶女满身都是");
         }
         outputText("。你的手指穿过女孩的发间，催促她继续施展那些床上技巧；你的胸口剧烈起伏、颤抖，在这场巨大的乳房高潮中余韵不绝，雌性的淫液也从你的小穴里喷出，落入下方乳白色的池水中。");
         outputText("[pg]你的整个身体都感到深深的舒畅，她的乳汁渗入你的肌肤，让你焕然一新、精力复苏；而那场欢愉的交合也让你每一块肌肉都放松下来。你刚想感谢这位奶娘带来的愉快陪伴，可你才一张口，她便把嘴唇贴上来，与你来了一个漫长而舌尖交缠的吻。你暗自轻笑，在不挤压到她乳房的前提下尽可能紧地抱住她，把她侧过身，让她把脸颊蹭进你的[chest]，又亲了亲她的头顶，这才与你一同爬出池子。你还得扶她一把，她那额外的巨大重量差点又把她拖回池里，幸好你反应够快。你收起自己的[armor]，揉了揉这名奶奴的头发，然后转身回到眼前的正事上。");
         if(get_player().lactationQ() >= 200)
         {
            get_player().orgasm("Tits");
         }
         else
         {
            get_player().orgasm("Vaginal");
         }
         doNext(playerMenu);
         get_player().changeFatigue(-15);
         doNext(playerMenu);
      }
      
      public function knockUpSomeDoubleStuffedSandWitches() : void
      {
         clearOutput();
         outputText("你觉得这些发情的怀孕荡妇应该很乐意来上一点性爱，于是脱下了你的[armor]。[pg]");
         outputText("那些大腹便便的沙漠女巫全都目不转睛地盯着你的[cock biggest]，随后开始朝你爬来。[say:求你了！]她们一个个叫喊着。[say:太骚了！激素太多了！]其中一些用手和膝盖爬行，四只乳房和怀孕的肚子拖在地上。[say:我们还要更多！]一个喊道。[say:更多肉棒！]另一个叫着。[say:更多孩子！]第三个一边抚摸肚子一边哀求。[say:填满我们！]一个开始反复喊，其他人也随之加入。[say:对；填满我们！填满我们！填满我们！]她们用爪子般的手抚弄你的性器，眼中燃烧着性欲的饥渴。湿漉漉小穴的气味弥漫在空气中，勾起你身体本能的兴奋。");
         dynStats(DynStat.Lust(33));
         menu();
         if(get_player().cockThatFits(50) < 0)
         {
            outputText("[pg]<b>你他妈太大了，根本没法干她们中的任何一个。</b>");
         }
         addButton(0,"操一个",fuckOneSandWitch).sexButton(1).disableIf(get_player().cockThatFits(50) < 0);
         addButton(1,"操两个",fuckTwoPregWitches).sexButton(1).disableIf(get_player().cockThatFits(50) < 0 || get_player().cockThatFits2(50) < 0,"此场景需要你有两根尺寸合适的阴茎。");
         addButton(2,"全都操了",fuckAllThePregWitches).sexButton(1).disableIf(get_player().cockThatFits(50) < 0);
         setExitButton("返回",playerMenu);
      }
      
      public function keepCumWitchesIn() : void
      {
         clearOutput();
         outputText("你请求她暂缓派出精液女巫。她们那种充满侵略性的性爱招募手段正在妨碍你，而眼下最好还是让她们别来碍你的事。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,853,0);
         sendOutOrKeepInEnding();
      }
      
      override public function initRooms() : void
      {
         var _loc1_:IMap = new IntMap();
         _loc1_.h[17] = roomEntrance;
         _loc1_.h[12] = roomCaveCommons;
         _loc1_.h[11] = roomWestHall1;
         _loc1_.h[16] = roomLustRoom;
         _loc1_.h[6] = roomPlayRoom;
         _loc1_.h[10] = roomWestHall2;
         _loc1_.h[5] = roomNursery;
         _loc1_.h[15] = roomPharmacy;
         _loc1_.h[13] = roomEastHall1;
         _loc1_.h[8] = roomSleepingChamber;
         _loc1_.h[9] = roomBathroom;
         _loc1_.h[14] = roomEastHall2;
         _loc1_.h[19] = roomCumWitchBedroom;
         _loc1_.h[18] = roomCumWitchOffice;
         _loc1_.h[7] = roomSacrificalAltar;
         _loc1_.h[2] = roomSandMotherThrone;
         dungeonRooms = _loc1_;
      }
      
      override public function initMap() : void
      {
         dungeonMap = [1,1,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1];
      }
      
      public function grabTheMilkGirl() : void
      {
         clearOutput();
         outputText("你在那名牛奶奴隶溜走之前叫住了她，涉水走到浴桶边，让自己的脸离她那对硕大、盛满乳汁的奶子只剩下短短几寸。她把头歪向一边，显然不习惯受到这样的关注，低声呢喃道，[say: " + get_player().mf("主、主人？","女、主人？") + "]");
         outputText("[pg]你朝她露出一个淘气的笑容，随后一把抓住她巨大的乳房用力一拽，把她拉进浴桶里。牛奶女仆惊叫一声，跌入桶中，大量乳白色液体溅过浴桶边缘，把墙壁都染成了白色。她喘着气，脑袋从自己的乳汁里冒出来，长长的乌黑头发滴着水，落在她那仿佛自带浮力的乳房顶端；那对乳房在乳白色的波浪上起伏，竟带着一种奇异的宁静与优雅。[say: " + get_player().mf("主、主人？","女、主人？") + "]奴隶女孩又重复了一遍，下唇因恐惧而颤抖着，一边涉过自己分泌出的乳汁，一边慢慢退向浴桶边缘。你微笑着伸手抚摸她的脸颊，告诉她没事的，你只是觉得她或许也会喜欢泡个澡。她开始用那种蹩脚的方言回答，但你用玩闹似的动作抚过她那对巨大的乳房，打断了她，并示意她靠到你这边来。尽管仍有些紧张，她还是照你说的做了，滑到你的臂弯下，坐到你的腿上。坐稳后，她用一双茶碟般的棕色眼睛仰望着你，直到你捧住她的脸颊，给了她一个短暂而温柔的吻，将嘴唇贴上她黝黑的乳丘。令你欣喜的是，她似乎在你的触碰下融化了，瞬间放松下来；你尽可能把她抱紧，与你之间只隔着她那过分丰硕的胸部");
         if(get_player().biggestTitSize() >= 8)
         {
            outputText("，深深压进你同样巨大的胸脯里，你的乳头擦过她还在滴乳的奶子");
         }
         outputText("。");
         outputText("[pg][say: 哦、哦……]她轻声呻吟，声音几乎细不可闻，脸颊在你掌心里热得发烫。这个可爱的小奴隶侧过身，把自己的乳房挪开，好让脑袋靠在你胸前；显然，她很享受你把手臂环在她肩上的简单动作，以及那些奇妙又温柔的触碰。你让她这样享受了漫长而愉快的几分钟，安静地陪伴着这个浑身奶香的女孩。你时不时轻轻抚摸她那像母牛般的乳房，或是伸手向下，把她浓稠丰润的乳汁抹进自己的胯间，享受它在你");
         if(get_player().get_gender() == 1)
         {
            outputText("[cock]");
         }
         else if(get_player().get_gender() == 2)
         {
            outputText("[vagina]");
         }
         else if(get_player().get_gender() == 3)
         {
            outputText("[cock]和[vagina]");
         }
         else
         {
            outputText("没有性器的胯间上那不可思议的触感，你的欲望依旧灼热难耐");
         }
         outputText("。过了一会儿，你轻轻推了推女孩，让她把双臂和乳房靠在浴池边缘。你挪到她身后，捧起一把把她的乳汁，开始将其倾倒在她的背部和肩膀上，让她被自己甜美的乳汁好好浸湿。随后你贴近过去，开始按摩她的背，将乳汁缓慢而细致地揉进去，直到她安静地颤抖起来。你的手指陷入她柔软而顺从的肉里，轻轻揉捏她的肩膀和臀部；她压低声音呻吟着。你特别照顾她丰满圆润的屁股，又试探着将几根手指绕过她的腿，沿着她湿滑的外阴和阴蒂的小突起抚摸。");
         outputText("[pg]当你碰到她时，她的身体绷紧了，");
         if(get_player().cor < 70)
         {
            outputText("你立刻收回手，不想强迫她；但令你惊讶又欣喜的是，她向后伸手握住你的手，把你重新带回去，让你用手指抚弄她");
         }
         else
         {
            outputText("你带着充满欲望的笑意更加用力地推进，手指轻而易举地滑入她体内，她的乳汁成了最完美的润滑，让你顺利进入。奴隶女孩因你的性挑逗而颤抖着，但她要么是出于训练有素的恐惧而不敢阻止你，要么就是根本不想让你停下");
         }
         outputText("。不过，在你来得及更进一步之前，奴隶女孩忽然转身，她那巨大的胸部把你推着穿过乳白色的浴池，最后抵在边缘上。你只恍惚了一瞬，她的乳房便紧紧压上你的后背，压得如此用力，以至于新的乳汁从她的乳头流出，像你刚才对她做的那样濡湿了你的背。你靠在边缘放松下来，看着奴隶捧起一把把乳汁，揉进你的头发和肩膀；她灵巧的手指以最顶尖按摩师般的技艺按揉你背上的每一块肌肉，你能感觉到紧绷感正从肌肉中流走。你重重打了个哈欠，把下巴搁在手臂上，任由这个奶香四溢的女孩为你按摩，用她浓郁而美味的乳汁涂满你的[skinfurscales]。");
         if(get_player().hasCock())
         {
            outputText("[pg]牛奶女孩的一只手擦过你的大腿，绕到你的[leg]旁；纤细的手指握住你的[cock]，乳汁般的润滑让她柔软的套弄更加令人愉悦。她的手指沿着你迅速硬起的肉棒上下滑动，你因欲望和快感而呻吟出声");
            if(get_player().balls > 0)
            {
               outputText("，她另一只手托住你的[balls]，以惊人的灵巧在掌心里揉动那[ballcount]颗球");
            }
            outputText("。她俯身越过横在你们之间的两只硕大乳房，沿着你的后背一路落下亲吻，又在温柔的爱抚间舔去零星的奶滴。");
         }
         if(get_player().hasVagina())
         {
            outputText("[pg]她的双手向下移去，纤细的指尖滑过你[vagina]的缝隙。你倒吸一口气，浑身发颤；她沾满乳汁的手指轻易探入你湿透的小穴，拇指则温柔地绕着你的[clit]打转。她的另一只手向上游移，抚过你的[hips]和[butt]，最后来到你的[chest]，以熟练的手法揉按起来。");
            if(get_player().biggestTitSize() >= 1)
            {
               outputText("她捧住你的乳房；为了绕过你和她那同样庞大的胸部，她不得不把手伸得很远，几乎绷紧了手臂才够到你的[nipples]，但她还是努力地用灵巧无比的手指抚弄着它们。");
            }
            if(get_player().lactationQ() >= 200)
            {
               outputText("一股乳汁从你自己胀满的乳房中喷出，汇入你这位新朋友已经积满一池的乳液之中。她又惊又喜地轻呼一声，立刻把脸贴到你的背上开始动作，像给自己挤奶那样为你挤弄，让你丰沛的母性乳液倾泻进池中，零星的细流顺着你的胸口淌下，把你的胸膛也染得和她一样雪白。");
            }
         }
         menu();
         dynStats(DynStat.Lust(33),DynStat.NoScale);
         if(get_player().hasCock())
         {
            addButton(0,"肉棒性交",fuckMilkbabeWithPenor).hint("用你的阴茎干这个乳奴。");
         }
         if(get_player().hasVagina() && get_player().biggestTitSize() >= 3)
         {
            addButton(1,"女体交欢",ladyFucks).hint("进行阴道和乳房玩弄。");
         }
         addButton(2,"不做",dontFuckMilkBathBabe).hint("跳过性交。");
         if(get_player().isGenderless())
         {
            doNext(dontFuckMilkBathBabe);
         }
      }
      
      public function gimmeDatDeliciousMilkWaifuINeedMoreWaifusCauseTheTwoCowslutsWerentEnoughForMyInsatiableLacticLustandDesire() : void
      {
         clearOutput();
         outputText("你有个更好的主意：把那个女孩交给你。你可以在营地里照顾并保护她，同时也在这艰难世道允许的安全范围内，给她尽可能多的自由。");
         outputText("[pg]沙之母叹了口气，悲伤地摇了摇头。[say: 你是个理想主义者，[name]。但你的话里也有智慧。也许……也许你是对的。不过，她对我们的女巫集会相当有用。若能得到某种补偿，或许我可以被说服放她离开。两千枚宝石应该足够了。]女术士看着你，等待你的回答。");
         if(get_player().get_gems() < 2000)
         {
            outputText("[pg]<b>你没有那么多钱。</b>");
         }
         menu();
         addButton(0,"太贵了",TwoExpensive4Me).hint("她太贵了！拒绝这个提议。","太贵了");
         if(get_player().get_gems() >= 2000)
         {
            addButton(1,"买下她",BuyHer).hint("用2000枚宝石买下乳奴？");
         }
      }
      
      override public function get_connectivity() : Array
      {
         return [1,1,2,1,1,2,2,get_checkQueenDoor(),DungeonRoomConst_Impl_.fromStr("ES"),DungeonRoomConst_Impl_.fromStr("W"),DungeonRoomConst_Impl_.fromStr("NSE"),DungeonRoomConst_Impl_.fromStr("NESW"),DungeonRoomConst_Impl_.fromStr("NESW"),DungeonRoomConst_Impl_.fromStr("EWN"),DungeonRoomConst_Impl_.fromStr("SW"),1,1,1,DungeonRoomConst_Impl_.fromStr("E"),DungeonRoomConst_Impl_.fromStr("WN"),0,0,0,0,0];
      }
      
      public function get_checkQueenDoor() : int
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,837) > 0)
         {
            return DungeonRoomConst_Impl_.fromStr("NS");
         }
         return DungeonRoomConst_Impl_.fromStr("LNNS");
      }
      
      public function getMockedForSmallDongBySammitchMob() : void
      {
         outputText("[pg]一个女巫喊道：[say: 看看[his]鸡巴有多小！]所有人的目光都转向你的胯间，嘲弄的笑容在她们脸上绽开。[say: 都能放进我掌心里了。][say: 我的乳头都比那玩意儿大！][say: 我们有放大镜吗？我都看不见它。]她们就这样不停地戏弄你，直到其中一个跪下来，用中指和食指夹住你的[cock smallest]。[say: 来看看这根小鸡巴到底能不能射出来……]");
         outputText("[pg]她开始揉弄你的鸡巴，那并不能算真正的套弄，更像是甩动手腕，让手指沿着你小小的肉茎向下拨弄。其他沙漠女巫都饶有兴致地看着，看你那点微小的硬度拼命装出又大又有威慑力的样子。她们甚至朝你小得可怜的[cock smallest]做出可爱的亲吻表情，就像逗弄小动物时会露出的那种神情。");
         outputText("[pg]一小滴一小滴前列腺液在你的[cockHead smallest]上凝结又溢出，润滑着折磨你的女巫的手指。她一边继续羞辱你，一边说你会像个处女婊子一样射出来，还说你这副装备根本不配想象一场像样的性爱。");
         outputText("[pg]你努力不让这些沙漠女巫如愿看到你射出来，可你已经完全任由她们摆布了——尽管她们那点怜悯少得可怜。");
         if(get_player().cumQ() < 250)
         {
            outputText("一小股精液喷出，弄脏了女巫的两根手指，在指间拉出一小片黏糊糊的丝网。[say: 呵，我就知道。]女巫得意地说道，用轻蔑的眼神看着你。");
         }
         else if(get_player().cumQ() < 500)
         {
            outputText("一阵解脱的快感从你的[cock smallest]喷涌而出，黏糊糊地糊满了那个贱女巫的手。[say: 也没什么了不起的。]她刻薄地评论着，把你的精液在泥土地上蹭掉。");
         }
         else
         {
            outputText("你的[cock smallest]向那个贱人的脸上喷出一连串精液，把她难以置信的表情厚厚糊上一层滑腻的黏液。她的姐妹们则笑着指向她那张沾满精液的脸。");
         }
         outputText("[pg][say: 哦，看啊，它变得更小了。]一个骚女巫说道，指着你正在缩回去的鸡巴。你反倒有点庆幸事情变成这样。她们对你的折磨终于结束了！看到她们的乐趣正在软下去，她们看起来还有些失望，直到其中一个突然出声，把一只手伸进自己的乳沟，从上衣里掏出一个瓶子。所有女巫都开始对你露出恶作剧般的笑容。");
         outputText("[pg]她们按住你的头，捏住你的鼻子，强行撬开你的嘴。拿着瓶子的那个女巫把调合药剂灌进你的喉咙。你拼命不去吞下那东西，但她们强行合上你的嘴，揉按你的喉咙，迫使那恶心的液体流下去。你的反射出卖了你，你把它全都咽了下去。女巫们满意地让你重新呼吸，然后兴奋地注视着接下来会发生什么。");
         outputText("[pg]一开始，你的小腹深处泛起一阵暖意，顺着传到你那根微小鸡巴上，立刻让它硬得像刚才一样。折磨人的快感还没结束。另一名女巫把她脏兮兮的脚踩在你被药物催硬的肉棒上。她说自己纤细的脚竟然能盖住你整根[cock smallest]，真是可悲，然后轻轻踩着你敏感的肉。你那根软弱的小鸡巴试图顶住她柔软赤裸的脚底，却被她踩得死死的。接着，她轻踩的动作变成了摩擦，你能感觉到她脚底平滑的纹路蹭过你短小的长度。");
         outputText("[pg]她们给你灌下的药肯定让你的身体变得异常敏感，因为你已经感觉到新一轮高潮正在你的鸡巴里搏动。你咬紧牙关，试图忍住。沙漠女巫们全都嘲笑你这可怜的反抗。这反而鼓励了踩着你的那名女巫，她一边用脚趾抚弄、弹拨你的[cock smallest]，一边踩得更用力了。");
         outputText("[pg]你试图抗拒她的挑逗，但她的乐子在你射出来之前是不会停下的。你咬紧牙关，想要忍住，可她对你来说实在太会了。你只射出几滴可悲的精液，落在她的脚底上。");
         if(get_player().balls > 0)
         {
            outputText("你的[balls]根本没来得及再攒出完整的一发。");
         }
         outputText("精液稀得很，从她的脚趾间滴落下去。你的鸡巴上还留下了她脚踩过的脏印。");
         outputText("[pg]她把脚抬到你脸前，命令你舔。在你意志薄弱的状态下，你照着她的命令，伸出舌头去舔她脚上泥垢和稀薄精液混在一起的味道。你把每一小滴精液都舔干净，而即使精液早就没了，她也让你继续舔。现在你只是在舔她脚上的污垢。");
         outputText("[pg]你一直舔到她的脚底重新露出原本的浅棕色。然后她又用那只脚踩上泥土地面，把你舌头做的一切全都毁了。");
         outputText("[pg]你的鸡巴依旧硬挺、渴求着，下一位沙漠女巫");
         if(get_player().isBiped())
         {
            outputText("跪到你的双腿之间");
         }
         else
         {
            outputText("跪到你身旁");
         }
         outputText("。她把你脏兮兮的鸡巴握在手里。她肯定是被怂恿要做点什么。她用恳求的眼神看着同伴，说道，[say:你们确定要这样吗？]一小群女巫在旁边起哄，叫她[say:做吧。]");
         outputText("[pg]那名女巫像是陷入两难般叹了口气，然后深吸一口气。她把你整根鸡巴都含进嘴里，开始用舌头来回卷弄。她替你清理上一名女巫留下的脏污烂摊子，在同伴的压力下取悦着你。");
         outputText("[pg]她喘着热气，舌头取悦着你整根鸡巴。那几个怂恿她的女巫带着震惊和好笑的表情看着，不敢相信自己的同伴真做了这种事；要是你还在乎，肯定会觉得受辱，但这女巫的技术真的很好。");
         if(get_player().balls > 0 && get_player().hasVagina())
         {
            outputText("她甚至捧住你的[balls]，但在感觉到湿意正从睾丸上滴落时，又转而去摸你的[vagina]。");
         }
         else if(get_player().balls > 0)
         {
            outputText("她甚至捧住你柔嫩的[balls]，轻轻揉按起来。");
         }
         else if(get_player().hasVagina())
         {
            outputText("她甚至轻轻抚摸你小穴的阴唇。");
         }
         outputText("[pg]你把一股滚烫的精液射进沙漠女巫的喉咙。她吞下精种后张开嘴，但不是为了向你展示她有多会当婊子。不，她这么做是为了给她的[say:朋友]看，她完成了她们的挑战。女孩们为这个含鸡巴的婊子欢呼，而她带着满口精液气味站起身，加入她们继续围观。");
         outputText("[pg]沙漠女巫们不断轮流羞辱你，让你的小鸡巴一次次射精、漏出精液，把你的精种榨得一干二净，直到你最终因脱水昏了过去。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,838) > 0)
         {
            outputText("[pg]几小时后，你在地牢外醒来，随身物品都还在，甚至出人意料地一颗宝石也没少。");
            get_game().inDungeon = false;
            get_player().orgasm("Dick");
            dynStats(DynStat.Lib(1),DynStat.Sens(-1));
            get_combat().cleanupAfterCombat();
         }
         outputText("[pg]你用余生给沙漠女巫们当母狗。你一直赤裸着、硬挺着，被像动物一样锁在房间里，双手反绑在背后，确保你没法自己玩弄自己。女巫们偶尔会来折腾你一下，但大多数时候，她们只是让你沉溺在自己的欲望里。许多个夜晚，你都渴望感受女主人们的触碰。只要能让她们取悦你的小鸡巴，你甚至希望她们羞辱你。有时，当一群女巫从旁边走过时，你会尽可能表现出渴求的样子。她们却只是走过去，说你看起来有多绝望、多可悲，然后把你和那根怒挺的鸡巴一起丢在那里不管。");
         outputText("[pg]你唯一的慰藉，就是这些年来不断有新成年的女巫加入，和其他姐妹一起享乐。她们中有很多似乎挺喜欢你，有时还会拿你练习法术。你的头发已经变成沙金色很久了，胸口也一直在渗出乳汁。除了法术之外，她们还喜欢拿你练习性交。起初她们还算温柔体贴，但随着时间过去，她们变得越来越索求无度、越来越羞辱你，直到最后把你忘在一边。");
         get_player().orgasm("Dick");
         dynStats(DynStat.Lib(1),DynStat.Sens(-1));
         get_game().gameOver();
         get_player().set_HP(get_player().maxHP());
      }
      
      public function getLactaidFromWitches() : void
      {
         clearOutput();
         outputText("你");
         if(get_player().cor < 33)
         {
            outputText("礼貌地请求");
         }
         else if(get_player().cor < 66)
         {
            outputText("请求");
         }
         else
         {
            outputText("很不客气地要求");
         }
         outputText("她的集会提供一剂催乳剂。");
         outputText("[pg][say:你在考虑加入我们吗？我们可以用魔法更直接地完成这件事，]沙之母提议道。[say:这些沙丘对我们来说就像母亲的怀抱一样舒适，而你在我们之中的位置也可以无比惬意。]");
         outputText("[pg]你拒绝了她的提议，再次提出想要催乳剂，这让那女人的脸色微微沉了下来。她取来一瓶递给你时，嘴角仍带着半分似笑非笑的弧度。随后，她伸手抚过长袍覆盖的大腿；有那么一瞬间，你甚至怀疑她是在示意你坐到那里去……你摇摇头，低头查看手中的瓶子。你已经拿到了此行想要的东西。[pg]");
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,850,FlagDict_Impl_.arrayReadInt(_loc1_,850) + 1);
         get_inventory().takeItem(get_consumables().LACTAID,roomSandMotherThrone);
      }
      
      public function getLaBova() : void
      {
         clearOutput();
         outputText("你向她要一些拉·博娃");
         if(get_player().cor < 33)
         {
            outputText("，脸上泛起红晕");
         }
         else if(get_player().cor < 66)
         {
            outputText("，有些迟疑");
         }
         else
         {
            outputText("，露出心照不宣的微笑");
         }
         outputText("。");
         outputText("[pg][say: 哦？你该不会是打算搬到山里去，用奶水诱得牛头人俯首称臣吧？]沙之母问道。[say: 那可必定会让你堕入腐化。]");
         outputText("[pg]你摇了摇头");
         if(get_player().cor > 66)
         {
            outputText("，不过这个念头确实相当诱人地钻进了你的想象里");
         }
         outputText("。");
         outputText("[pg][say: 那就好。野兽之道能带来许多好处。比如这东西，在增强泌乳方面就相当有用。不过，沉溺于这样的转变也伴随着极大的风险。务必小心，别在其中迷失自我，]这位身姿如雕像般高挑的女术士警告道。");
         outputText("[pg]你点点头，她便把拉·博娃交给了你。[pg]");
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,850,FlagDict_Impl_.arrayReadInt(_loc1_,850) + 1);
         get_inventory().takeItem(get_consumables().LABOVA_,roomSandMotherThrone);
      }
      
      public function getBlown(param1:Boolean = false) : void
      {
         clearOutput();
         outputText("你脱下护甲，让你的[cocks]暴露在沙漠干燥的热浪中。萨努拉饥渴地舔了舔嘴唇；你倚在石柱上，招手让她过来，好让她仔细看看你的肉棒。斯芬克斯走近，兽性的腰臀摇曳生姿；很快，她小巧纤细的双手便抚过你的[skinfurscales]，恰到好处地擦过那些敏感的地方。指尖沿着你的[chest]游走，缓慢而挑逗地绕着你的[nipples]打转，随后向下滑去，掠过你的腹部，一路来到你的[hips]");
         if(get_player().balls > 0)
         {
            outputText("，一只手下探托住你的[balls]，在掌心里揉弄，直到一缕白浊从你的[cockHead biggest]渗出");
         }
         outputText("。斯芬克斯在你面前跪下，俯身用舌头沿着你的[cock biggest]侧面舔舐；那舌面粗糙，却出人意料地温柔地爱抚着你最敏感的肉茎。她舔舐顶端，急切地饮下最初几滴黏腻的前液，随后又把注意力转向别处，任由接下来的几滴落在沙地上。");
         outputText("[pg]她用鼻尖蹭着你的胯间，慢慢侍弄着");
         if(get_player().cockTotal() > 1)
         {
            outputText("你的每一根");
         }
         outputText("肉棒");
         if(get_player().cockTotal() > 1)
         {
            outputText("");
         }
         outputText("，揉弄着你的阳具，直到你觉得自己快要爽到爆开。直到这时，萨努拉才用明亮的眼睛仰望着你，与你四目相对，然后将你的[cock biggest]的[cockHead biggest]含入口中，用丰满的双唇裹住你悸动的勃起。你呻吟起来，[legs]因欲望与焦渴而发软打颤；她舔弄挑逗着你的龟头，纤细的手指沿着下侧轻轻划过。");
         outputText("[pg][say:再坚持一会儿，我的朋友，]斯芬克斯含着你的肉棒，话音显得有些含糊。[say:我们才刚刚开始呢……]");
         outputText("[pg]你正想追问她这话是什么意思，她却突然松开了你的肉棒，让它硬挺挺地在空中弹动；唾液和大量前液像旗帜一样挂在你的柱身上。还有几缕黏丝仍将你们连在一起，从你的顶端牵到萨努拉的唇边，把她两片丰满的嘴唇染成乳白。她抬头冲你一笑，与此同时，她的手指开始以奇异而奥秘的方式移动，在身后编织出细细的蓝色魔力线条，一道法术逐渐成形。眨眼间，一双半透明的手出现在萨努拉自己的双手上方，闪烁着异界的光芒。第一只魔法之手拂过你的肌肤时，你呼吸一滞，一阵令人头脑发麻的刺痒从接触点涌遍全身。你张了张嘴，却说不出话来，整个身体仿佛都软了下去，几乎化成一滩水；那些魔法之手拂过你的大腿和臀胯，挑逗地停在离你的[cocks]很近却又够不着的地方，那些带来酥麻感的手指偏偏碰不到你最敏感的部位。");
         outputText("[pg]一根手指擦过你的[cock biggest]，仅仅是短短一瞬。你仰头尖叫，整个身体都在抽搐，一股浓稠的精液从顶端喷出，把萨努拉的脸涂满了你的种子。她彻底放开你，任由你扭动挣扎，随着你的");
         if(get_player().balls > 0)
         {
            outputText("睾丸将精液排空");
         }
         else
         {
            outputText("身体将精液倾泻一空");
         }
         outputText("，全都射到她渴求的脸上。然而，当你感觉自己正从这场魔法诱发的高潮中缓过来时，一个奇异的蓝色符印出现在空中，环绕着");
         if(get_player().cockTotal() > 1)
         {
            outputText("你的每一根");
         }
         else
         {
            outputText("你的");
         }
         outputText("还在滴液的肉棒");
         if(get_player().cockTotal() > 1)
         {
            outputText("");
         }
         outputText("。[say:你确实还想再来一次，对吧？我想我的魔力还够让那根漂亮的[cock biggest]硬上一阵，好让我的新手陪你玩玩……]");
         outputText("[pg]你点点头，随即浑身一颤；斯芬克斯的性魔法在你体内运作，她的奥术符号让你刚刚释放过的阳具重新振作。转眼间，你硬得比之前更厉害，一道道浓稠的精液从你的顶端涌出");
         if(get_player().cockTotal() > 1)
         {
            outputText("");
         }
         outputText("——咸腥的液体从萨努拉张开的嘴里淌出，畅快地流到沙地上，而你的");
         if(get_player().balls > 0)
         {
            outputText("[balls]不断翻涌");
         }
         else
         {
            outputText("身体不断翻涌");
         }
         outputText("，仿佛挤出源源不绝的精液。你的呼吸变得急促粗重，越来越多的精液从你体内涌出；重新变得强劲的阳具不断排出无尽的精潮，令你一阵头晕目眩。萨努拉慢慢地、温柔地凑近，用双唇含住你[cock biggest]的顶端，舔饮着涌入她口中的精液之河。");
         if(get_player().cockTotal() >= 3)
         {
            outputText("[pg]萨努拉吮吸着你[cock]的顶端，她那双灵体之手握住了");
            if(get_player().cockTotal() == 2)
            {
               outputText("你的");
            }
            else
            {
               outputText("你的两根");
            }
            outputText("另外 " + Utils.num2Text(get_player().cockTotal() - 1) + " 根肉棒，紧紧缠住那一根根饱满的肉茎。那一根根发麻的手指沿着你的肉棒缓缓向上游走，异样的触感让你的心脏疯狂悸动，你不由得从喉咙里发出低沉的呻吟。");
            if(get_player().cockTotal() >= 5)
            {
               outputText("你还没来得及适应那些诡异的手正套弄你额外长出的肉棒，萨努拉自己的双手也加入进来，探入你胯间那一团纠缠的阳具，抓住了另外一对肉棒。五根肉棒被手掌、魔法和嘴唇包围着，萨努拉慢慢开始让自己的动作同步起来，温柔地抚弄你那许多根肉棒。");
            }
         }
         outputText("[pg]她的嘴和手在你的肉体上施展了片刻奇技之后，这名斯芬克斯少女开始加快节奏；短短一分钟里，她就从温柔的口交变成了毫不留情的深喉，随着你每一次心跳、每一股从被魔法刺激的[balls]中涌出的精液，她的动作都变得越来越快。尽管你已经射出了海量的精液，你仍能感觉到又一次高潮正在逼近，哪怕第一次的余韵还未散去，它也依然汹涌而来。");
         outputText("[pg]当它真正袭来时，你几乎失去意识。第二次高潮带来的纯粹快感让你在抽搐中仰面倒下，身体因极乐而剧烈痉挛。你颤抖着呻吟，肉棒");
         if(get_player().cockTotal() > 1)
         {
            outputText("");
         }
         outputText("如喷泉般射向空中，又化作雨点落下，在你和那已经满身精液的斯芬克斯周围积成一滩。");
         outputText("[pg][say:舒服吗？]这名乳白色的狮身少女问道，跪到你身旁，一只手搭在你起伏不定的胸口上。你虚弱地竖起大拇指，然后摇摇晃晃地站上你的[feet]。");
         get_player().orgasm("Dick");
         menu();
         if(param1)
         {
            get_game().inDungeon = false;
            addButton(0,"继续",get_camp().returnToCampUseOneHour);
         }
         else
         {
            menu();
            addButton(0,"进入",openZeDoorToParadize);
            addButton(14,"离开",exitDungeon);
         }
      }
      
      public function fuckTwoPregWitches() : void
      {
         clearOutput();
         var _loc1_:int = get_player().cockThatFits(50);
         var _loc2_:int = get_player().cockThatFits2(50);
         outputText("这群被激素折磨得失控的女巫，每一个几乎都只剩下五团巨大的肉球——乳房和肚子。她们用手和膝盖拼命朝你爬来，视线死死盯着你的" + get_player().cockDescript(_loc2_) + "。");
         if(get_player().countCocksOfType(CockTypesEnum.TENTACLE) >= 2)
         {
            outputText("你的触手肉棒几乎自行抽甩而出，缠住离你最近的两个女孩的手臂，把她们提到跪姿，又将她们向后翻倒，让她们侧身躺下，背靠着背。");
         }
         else
         {
            outputText("你毫不费力地抓住最近的两个女巫，把她们拉起来，又把她们推倒在地，让她们侧身躺下，背靠着背。");
         }
         outputText("两个女巫躺在你面前，起伏的乳房和肚子向两侧突出，屁股则紧紧挤在一起。你分别抓住她们的一只脚踝，抬起她们的腿，露出她们拥有的两对小穴。");
         if(!get_player().hasTailInsteadOfLegs())
         {
            outputText("你跨坐在");
         }
         else
         {
            outputText("你用蛇一般的尾巴缠住");
         }
         outputText("她们留在地上的那两条腿，同时让她们抬起的腿");
         if(get_player().biggestTitSize() >= 15)
         {
            outputText("滑入你的乳沟之间");
         }
         else
         {
            outputText("靠在你的躯干和肩膀上");
         }
         outputText("。");
         if(get_player().get_pregnancyIncubation() > 0 && get_player().get_pregnancyIncubation() < 200)
         {
            outputText("每条被抬起的腿都小心地屈起膝盖，好给你悬在她们身上的孕肚腾出空间。");
         }
         outputText("当两个女巫侧身躺着时，她们都开始感觉到你坚硬的肉棒拍打在她们多个小穴上。她们呻吟起来，四对阴唇都因期待接下来的交合而张开。每一组下唇都颜色发暗，滴着大股渴求的淫液，但每个女孩身上都有一处看起来张得格外厉害，仿佛内部的压力正把它撑开。不难看出，那些就是通往她们已经被占据的子宫的入口，而另外那些则正急切等待着新鲜精液的灌入。");
         outputText("[pg]你已经完全准备好满足她们对精液的渴求，于是小心地对准了你的肉棒。");
         if(get_player().cocks[_loc1_].get_cockType() == CockTypesEnum.HORSE && get_player().cocks[_loc2_].get_cockType() == CockTypesEnum.HORSE)
         {
            outputText("你马根宽大外翻的顶端平贴在那对灼热的阴唇上，只是稍稍一压，它们便轻易分开。你抵住她们的阴道入口时，滚烫肿胀的肉褶迫不及待地吞裹住你宽阔、带脊的龟头冠缘。她们比大多数普通小穴都要松一些，可在这么粗大的龟头周围，仍然紧得令人愉悦。你稍微用力向前一顶，便轻易贯穿了两个淫荡的女巫。你的马根钻入她们深处时，她们唇间逸出又惊又爽的叫声。");
         }
         else if(get_player().cocks[_loc1_].get_cockType() == CockTypesEnum.DOG && get_player().cocks[_loc2_].get_cockType() == CockTypesEnum.DOG)
         {
            outputText("你的犬形肉棒轻易分开女孩们湿得不像话的阴唇肉褶。每个女人的淫液都顺着你光滑的肉棒滴落；当你开始把尖端压入她们紧窄的入口时，她们纷纷发出愉悦而迫切的哀求，索要更多。你的骨盆轻轻一挺，两个小穴便同时被你的狗根贯穿，让你彻底掌控了这些受激素驱使的女巫。");
         }
         else if(get_player().cocks[_loc1_].get_cockType() == CockTypesEnum.TENTACLE && get_player().cocks[_loc2_].get_cockType() == CockTypesEnum.TENTACLE)
         {
            outputText("你的绿色触手状阴茎硬挺起来，却又在面前各个小穴之间蜿蜒穿行。暗紫红色的龟头像是有自己的意识一般，描摹着每个小穴的轮廓，把这些可怜又欲火难耐的女巫挑逗得更加饥渴。每一次沿着阴唇滑过，那些焦躁的小穴都会喷出淫液。你的灵活阴茎对这番愉悦的戏弄感到满意，随即开始办正事，像毒蛇扑向猎物般猛地刺入每个淫荡的穴口。你能感觉到每个女孩的入口被你的肉棒粗暴地撑开，好容纳它们深深钻进各自的阴道口，令两人都在疯狂的快感中尖叫起来。");
         }
         else if(get_player().cocks[_loc1_].get_cockType() == CockTypesEnum.DEMON && get_player().cocks[_loc2_].get_cockType() == CockTypesEnum.DEMON)
         {
            outputText("[pg]你每个恶魔龟头边缘上排列的大块凸起与结节，在强行挤进每个女巫尚未受精的小穴那深色肿胀褶皱之间时，带来格外美妙的触感。随着你肉棒上的恶魔纹脊与柔软凸起不断挑逗、折磨她们小穴内壁的敏感带，两个女孩都在快感中呜咽、尖叫。你那受诅咒的阴茎仿佛特意胀得更大，只为在这两个女孩体内达到最紧密的贴合；没过多久，在那纹理分明的肉棒加倍抽插两只小穴时，每个女孩都开始沿着肉棒渗出大量淫液。");
         }
         else
         {
            outputText("[pg]你将龟头抵在每一对湿漉漉、肿胀的阴唇上，肉棒寻找着其中的入口，将深色褶皱分开。随着你的阴茎达成目的，分别刺入这两个被荷尔蒙折磨得失控的荡妇入口，一阵湿滑吮吸般的感觉包裹住每个龟头。你的肉棒毫不费力地滑进那两只淫荡的小穴，迫使每个淫乱的女巫都因终于得到渴求已久的快感而幸福地叫出声来。她们的内壁紧紧夹住你的每根肉棒，身体的肌肉也因这股感觉而颤抖。");
         }
         if(get_player().cockTotal() >= 4)
         {
            outputText("你盯着她们被彼此紧贴的屁股夹在中间、微微皱缩的小屁眼，将另外两根阴茎对准过去，让前列腺液恰到好处地润滑她们紧窄的穴口，然后开始把额外的肉棒推进她们的后门。一个女孩因过于紧绷而咬住嘴唇，另一个则像是曾经体验过似的尖叫起来。");
         }
         outputText("[pg]你如此舒服地埋在这对双倍丰乳的怀孕荡妇体内，开始认真地操弄起来。你轻松摆动臀部，让肉棒一次又一次顺畅地 thrust 进那对湿淋淋、滴着淫液的小穴。随着你越操越深，每个女孩的淫液都顺着你的肉棒流下，弄湿了你的大腿。");
         if(get_player().cocks[_loc1_].cockLength < 20 && get_player().cocks[_loc2_].cockLength < 20)
         {
            outputText("[pg]终于，你插得足够深，能感觉到她们子宫的入口正抵着你悸动的龟头。你撞上她们的宫颈时，每个女孩都在美妙的疼痛中叫出声来，可只要你稍稍后退，她们又都会抗议。顺从她们的需求，你用尽全力抽插冲撞；没过多久，你的肉棒便因即将释放的感觉而阵阵发麻。");
         }
         else
         {
            outputText("[pg]你一次又一次地挺进，在每个女孩女人深处的紧窄通道里，一寸一寸艰难地向更深处探索。最后，你终于蹭到她们子宫那又深又紧的入口；当你撞上她们体内的关口时，两人都在带着快感的疼痛中叫喊起来。你的阴茎长度还绰绰有余，将每只小穴的通道彻底填满，而这些女巫即使被短暂的痛楚刺激，仍苦苦哀求更多，让你别无选择，只能尝试直接把自己顶进她们真正的子宫。你向前俯身，她们高高抬起的双腿紧紧压在你的躯干上，你把更多体重压到每根肉棒后方。女孩们在欢愉的痛楚中尖叫，因为她们都感觉到自己的宫颈被撑开，两个子宫都被贯穿。她们的身体吞下了远超普通女人所能承受的肉棒，让你得以把她们的腹部当成活生生的肉棒套来抽插。有了这样的机会，你迫不及待地开始这么做，反复顶进她们的子宫。她们的宫颈就像小穴深处的第二个穴口，没过多久，[eachCock]便感觉快要高潮了。");
         }
         outputText("[pg]这两个怀孕荡妇那八只灌满乳汁的乳房，随着每个女巫的身体在你的抽插下震颤而淫荡地摇晃。喷奶的乳头把奶水糊满了地板。");
         if(get_player().lactationQ() >= 200)
         {
            outputText("你的乳房也开始喷出乳汁，淋在这两个怀孕荡妇身上。");
         }
         if(get_player().biggestTitSize() >= 5 && get_player().biggestTitSize() < 20)
         {
            outputText("每一次插入那两只饥渴的小穴，都会让你的乳房上下弹跳。");
         }
         else if(get_player().biggestTitSize() >= 20)
         {
            outputText("每一次插入那两只饥渴的小穴，都会让你巨大的乳房前后摇摆，拍打在你自己的身体两侧。");
         }
         if(get_player().bRows() >= 3)
         {
            if(get_player().breastRows[2].breastRating >= 20)
            {
               outputText("你下方那对海滩球大小的乳房大到足以在你操弄时分别搁在两侧地板上；两个女巫最终放下她们一直抬着的双腿，好把腿勾在你巨大的乳房上，让你的肉体更紧地贴近她们的大腿。");
            }
         }
         if(get_player().balls > 0)
         {
            outputText("你的肉棒越接近高潮，睾丸就绷得越紧，准备将精液通过阴茎泵送出去。");
         }
         outputText("[pg]房间里的其他每个女巫都一边看着你肆意猛操她们的姐妹，一边用手指自慰。终于准备好后，你决定让她们看看自己错过了什么，于是把肉棒尽可能深地插进去，随后彻底射了出来。你的肉棒膨胀起来，精液从根部涌向被你熟练埋进这些奶水荡妇体内的顶端。");
         if(get_player().cumQ() < 500)
         {
            outputText("这对女孩感到滚烫的精液在体内喷溅开来，顿时尖叫出声。数以百万计的精子游进她们肥沃的子宫，试图把她们变成怀上双重身孕的荡妇。");
         }
         else if(get_player().cumQ() < 1000)
         {
            outputText("这对淫荡的奶袋感到异常大量的精液直接灌进她们孕育孩子的地方，在感官的震惊中叫喊起来，让她们如愿怀上双重身孕。你灌入体内的所有精液让她们的肚子鼓胀起来。");
         }
         else if(get_player().cumQ() < 3000)
         {
            outputText("这两个由乳房和肚子堆成的女人，在快感逼近疯狂时尖叫起来，她们空荡的子宫正被汹涌的精液洪流冲击。你能感觉到一阵阵沉重的精液在你的肉棒内奔涌，倾泻进吞下你阳具的淫荡穴口。随着你的性器一次又一次把精液泵入每个子宫，你的大脑在狂喜中发烫，迫使它们仅仅因精液就膨胀到远超本该承受的程度。等你的阴茎终于满足时，每个女巫看起来都像是已经怀上第二个孩子并且足月了一样；被精液填满的子宫在第一次怀孕的圆隆旁边，形成了分明的第二个球状隆起。");
         }
         else
         {
            outputText("房间里每个女巫都震惊地睁大眼睛，看着她们姐妹的肚子淫靡地鼓胀起来。你的肉棒感觉像是在试图夺走你对身体的控制权，将数升滚烫精液直接而有力地泵入每个淫荡女巫格外肥沃的子宫。那两个四乳荡妇在足以冲昏头脑的快感中抽搐，令她们巨大的、灌满乳汁的乳房到处震颤弹跳。她们过度充盈的子宫无法容纳你丰厚的授孕精液，白色的射精洪流便从她们小穴中绕着你的肉棒喷涌而出。");
         }
         if(get_player().cockTotal() >= 4)
         {
            outputText("当你让她们彻底满足时，精液从她们被折腾过的肛门里成股滴落。");
         }
         if(get_player().cumQ() < 1000)
         {
            if(!get_player().hasTailInsteadOfLegs())
            {
               outputText("[pg]你用虚弱的双腿");
            }
            else
            {
               outputText("[pg]你用虚弱的[if (isNaga) {蛇形|[if (isMer) {鱼形|尾巴般的}]}]身体");
            }
            outputText("撑起身子，让你的肉棒从那些怀孕女巫饥渴索精的小穴里滑出。溢出的精液糊满了她们的双腿和小穴，让她们看起来不像是刚被一个人干过，倒像是刚被好几个男人轮流操过。她们的姐妹们失望地轻声哼叫着，眼里满是遗憾——被你选中播种的不是她们的小穴，可这也没办法。也许等你处理完更重要的事后，很快就会回来满足她们对繁殖的渴求。");
         }
         else
         {
            outputText("[pg]过量的精液让你很轻易就能把肉棒从那些放荡的肉洞里滑出来。你的精液在你的[feet]和女巫们的腿边汇成一滩。你敏感的肉棒又撸动了几下，将更多精液喷洒在那两个自称女巫的乳房堆上。飞溅的精液把她们彻底浸湿，剩下那些怀孕发情的沙漠女巫立刻扑向这两个女孩，拼命舔舐、刮蹭她们身上的精液涂层，奢望能把一点精液舀进自己空着的第二子宫里。这群四乳孕肚女巫随即在乳房与精液堆里彼此扭打成一团。");
         }
         get_player().orgasm("Generic");
         dynStats(DynStat.Sens(-2));
         doNext(playerMenu);
      }
      
      public function fuckTheSandMothersCunt() : void
      {
         if(get_monster() == null || get_monster().get_short() != "Sand Mother")
         {
            set_monster(new SandMother());
            get_monster().set_HP(0);
         }
         clearOutput();
         var _loc1_:int = get_player().cockThatFits(get_monster().vaginalCapacity());
         var _loc2_:int = get_player().cockThatFits2(get_monster().vaginalCapacity());
         outputText("你欣赏了片刻自己的战利品，一边匆忙脱衣，一边陶醉于胜利的凯旋之中。沙之母败下阵来，虚弱地宣告道，[say:好吧，那就随你处置。你休想让我屈服。] 她声音里的怨毒让你有些意外——她居然还以为你是恶魔的爪牙！你耸耸肩，把她翻过身来，拉起她让她四肢着地。她爱怎么想就怎么想，反正你都要享用她那曲线夸张的身体。你隔着她透明的长袍拍了一下虚弱女王的屁股，欣赏那波纹从她丰满臀部的一侧荡到另一侧。");
         if(get_silly())
         {
            outputText("这屁股也太顶了，哟！");
         }
         outputText("又是一巴掌，这次从另一边拍下去，肉浪又反向荡了回来，你忍不住立刻用力捏住那对柔软的臀瓣。");
         outputText("[pg][say:快……快点结束吧！] 女巫女王哀求着，越过肩头狠狠瞪着你。哪怕隔着长袍的布料，她的肌肤摸上去也十分温热，脸颊上还能看见淡淡的红晕。不管她嘴上怎么说，她肯定多少有些享受。你掀起她长袍的下摆，露出发红的臀部，轻轻抚摸着。手指往下探去，你找到她女性的褶缝，随意试探了一下。两对微微发热的小穴用大量淫液弄湿了你的手指，那液体浓稠得仿佛随时都会滴落，拉出长长的丝来。");
         outputText("[pg]你笑着问她为什么还要假装不想要——她的小穴湿得都能淹没沙漠了！被你揭穿后，沙之母羞愧地垂下眼，羞耻地颤抖起来，体液开始啪嗒啪嗒地滴在地板上。你从她身下站起身，把手指上的淫液擦在");
         if(get_player().get_tallness() >= 90)
         {
            outputText("她的后颈上，");
         }
         else
         {
            outputText("她的肚子上，");
         }
         outputText("然后换了个姿势，捧住她肿胀的乳房。那对柔软到不可思议、充满液体的奶子仿佛要用自身的柔软吞没你的手指，你开始粗暴地揉捏挤压，肆意玩弄她的乳房时挤出了几滴乳汁。在你算不上温柔的摆弄下，她的乳头硬了起来，涨大到几乎有原本的两倍。你弹了一下其中一颗，听见这位巨乳沙漠女王发出一声细小的呜咽呻吟，不由得笑了起来。");
         outputText("[pg]你一只手重新抓住她的屁股，另一只手抚弄她的小穴，直到手指都被黏滑的淫液浸透。既然她已经准备得差不多了，你便把她的体液抹到你的" + get_player().cockDescript(_loc1_) + "上，和你自己翻涌的前液混在一起。你一离开她的女处，她就开始主动向后顶来，渴求更多刺激。你得意一笑，将湿滑的肉棒对准其中一个迎来的洞口");
         if(_loc2_ >= 0)
         {
            outputText("，同时抓住第二根肉棒，打算把她两处湿透的入口一起贯穿");
         }
         outputText("。她的阴唇刚一抚过你的");
         if(_loc2_ >= 0)
         {
            outputText("龟头");
         }
         else
         {
            outputText(get_player().cockHead(_loc1_));
         }
         outputText("，她意识到自己正在做什么，顿时僵住，试图抽身离开。");
         outputText("[pg]一心只想插进去，你抓住女巫发育成熟的丰满胯部，将她虚弱的身体往下拽，让她顺畅地被你的");
         if(_loc2_ >= 0)
         {
            outputText("肉棒");
         }
         else
         {
            outputText(get_player().cockDescript(_loc1_));
         }
         outputText("贯穿。她大声呻吟，快感中疯狂甩动着漂白般的长发，一寸又一寸的肉棒钻进她的通道");
         if(_loc2_ >= 0)
         {
            outputText("");
         }
         outputText("。当你尽根没入时，你的[hips]拍在她颤巍巍的屁股上，冲击让她整个身体向前摇去，身下四只乳房全都弹跳摇晃起来，在地板上洒出一道道乳汁。随后，你缓缓抽出，露出沾满爱液的性器，又再次顶入，丝毫不给她抽身的机会。你刚把自己一路插到[sheath]，便又退开，前后进出、来回抽插，缓慢而稳定地操着她，让这位女术士除了在你掌中扭动胯部、像发情的娼妇一样呻吟以外，几乎什么都做不了。");
         outputText("[pg]那位高挑、雕像般的女士，在你手中和你的阴茎");
         if(_loc2_ >= 0)
         {
            outputText("们");
         }
         outputText("周围都几乎成了任你揉捏的软泥；每当你抽离，让她空虚时，她那湿滑跳动的火热小穴都会颤抖着期待下一次顶入。你狠狠地摆弄着她，每当觉得她还不够投入，就鼓励似地拍打她的屁股。到了这时，她已经毫不掩饰、毫无羞耻地放声呻吟起来，还把身体伏低到地上，开始用双手挤压自己的乳房，先从一对乳房挤出一滩滩乳汁，又换到另一对，来回晃动，直到四滩乳汁汇成一小片乳湖。女巫的双穴随着每一次动作都喷涌出淫液，而当你感觉你们双方的高潮都在逼近时，你猛地完全抽出，让她空虚得发疼，被撑开的穴口还久久合不拢。");
         outputText("[pg]沙之母哀求道，[say: 插回来！求你，操我！我好需——要它！]她试图爬回你身上，想用她那丰硕的屁股把你夹在墙和她之间。你轻易侧身躲开，让她的屁股重重撞上石墙；她一边凄然呻吟，一边下流地挤压着自己丰满的臀肉。等她爬开时，墙上留下了两道小穴形状的水渍，正拖着长长的水痕滴落到地面。天神在上，她也太湿了！");
         outputText("[pg]你告诉她，如果她想像母狗一样被操，就得像母狗一样乞求——脸朝下、屁股翘高，像她这种饥渴的骚货一样呜咽着求你。希望在她眼中亮起，却又与被压抑的自尊相互拉扯；她小心翼翼地把脸贴向地面，不敢迎上你的目光，同时高高抬起臀部，分开双腿。她唇间挤出一声可怜的呜咽，轻得几乎听不见。还不够。你告诉她，你并不相信。她听起来根本不像一条发情的母狗，正求着被肉棒塞满。女巫再次呜咽起来，但这一次声音又高又尖，像一声哀切的哭叫，既像呻吟，又像是在催促。汁液顺着她的双腿肆意滴落，她彻底屈服了，双膝微微抽动，两只小穴张开，如花般绽放，饥渴地一收一张，仍因刚才被你操过而微微敞开。");
         outputText("[pg]看着她这样自甘堕落，[eachCock]变得更加坚硬，渗着液，涨得发疼，渴望射精。你把自己重新推进她灼热的小穴");
         if(_loc2_ >= 0)
         {
            outputText("们");
         }
         outputText("里，以此奖励这个没出息的女术士终于学会了正确的呜咽。你又快又狠地操着她，几乎不在意她的快感，只是骑上她粗暴地交配。她甚至没有停止乞求，时不时你还能听清几个词，比如[say: 求你，]和[say: 射吧。]你一把抓住她的头发，把她的脑袋向后拉，命令她为你高潮，而你也感觉自己的高潮正在体内升起、汇聚。");
         outputText("[pg]你顶得又重又狠，胯间与她屁股相撞的拍打声清晰可闻；随后你猛然爆发，狂乱地射进那痉挛收缩、紧致无比的爱欲甬道");
         if(_loc2_ >= 0)
         {
            outputText("");
         }
         outputText("。高潮的力量让精液从你体内汹涌喷出，奶油般灌满那湿润的小穴");
         if(_loc2_ >= 0)
         {
            outputText("");
         }
         outputText("，随着");
         if(_loc2_ < 0)
         {
            outputText("那小穴紧紧绞住你");
         }
         else
         {
            outputText("它们猛地夹紧");
         }
         outputText("，把淫液和残留的精液喷溅到你的[feet]上。");
         if(get_player().cumQ() >= 500)
         {
            outputText("一次又一次，你把可怜施法者的小穴灌满");
            if(_loc2_ >= 0)
            {
               outputText("");
            }
            outputText("，射得多到成团厚厚地冒出来，湿答答地落在地上。");
            if(get_player().cumQ() >= 2000)
            {
               outputText("随着你射精，它们落下的速度越来越快，女巫的肚子也胀了起来，圆滚滚得夸张。她的双腿被不断漏出的精液浸得湿透。");
            }
         }
         outputText("等你把每一滴雄性汁液都泵进那等着承接的地方");
         if(_loc2_ >= 0)
         {
            outputText("");
         }
         outputText("，你便抽身而出，欣赏着自己留在这个曾经高傲的女人身上的咸湿印记。");
         outputText("[pg][say:啊啊啊，]她叹息着，瘫倒在性爱留下的水洼里，[say:早……早告诉过你……你不可能——嗯嗯……摧垮我……]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,849) == 0)
         {
            outputText("[pg]女巫们已经被恰到好处地震慑住了，但你也毁掉了与她们友好和平相处的一切可能。");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,849,1);
         }
         else
         {
            outputText("[pg]她们或许不怎么瞧得起你，但把沙漠女巫女王变成一个只会娇声呜咽的荡妇，这种事永远不会腻。");
         }
         get_player().orgasm("Dick");
         dynStats(DynStat.Cor(1));
         if(!get_game().get_inCombat())
         {
            doNext(playerMenu);
         }
         else
         {
            get_combat().cleanupAfterCombat();
         }
      }
      
      public function fuckOneSandWitch() : void
      {
         clearOutput();
         var _loc1_:int = get_player().cockThatFits(50);
         if(_loc1_ < 0)
         {
            _loc1_ = get_player().smallestCockIndex();
         }
         if(get_player().countCocksOfType(CockTypesEnum.TENTACLE) == 0)
         {
            outputText("你抓住离你最近的怀孕女巫那晒成褐色的肩膀，把她翻倒在地，让她被自己肚子和乳房的重量压在身下，同时抓住她的两只脚踝。她汗湿的脏金色头发在地板上披散在头边，因性欲难耐而沉重地喘息着。");
         }
         else
         {
            outputText("你的触手肉棒猛地甩出，一边伸长一边缠住离你最近的女孩的脚踝。它将她翻倒在地，让她的上半身被自己沉重的孕肚和四只巨大的漏奶乳房压住。");
         }
         if(get_player().countCocksOfType(CockTypesEnum.TENTACLE) > 1)
         {
            outputText("另一根触手肉棒伸向女孩的另一只脚踝，你的肉棒们一起将她晒成褐色的双腿大大分开，露出她因怀孕而胀大的宽大双重小穴。");
         }
         else
         {
            outputText("你向前伸手抓住她的另一只脚踝，用你的肉棒和手臂将她晒成褐色的双腿大大分开，露出她因怀孕而胀大的宽大双重小穴。");
         }
         outputText("[pg]她两套阴唇的颜色比周围晒成褐色的肌肤更深，正热切地滴淌着淫液。其中一套已经张得很开，显然是被体内的子宫撑出了压力。另一套则肿胀着，却渴望被真正的肉棒填满，好让她的第二个子宫也被种子播满。[say: 求、求你！]她像受伤的小兽一样哀求着。她的多只乳房和肚子在身上晃动摇摆，她努力把骨盆朝你这边送来。她的肚脐凸起随着腰臀的扭动在空中画着圈。");
         var _loc2_:Boolean = false;
         if(get_player().countCocksOfType(CockTypesEnum.TENTACLE) >= 2 && get_player().cockTotal() >= 3 && get_player().cocks[_loc1_].get_cockType() != CockTypesEnum.TENTACLE)
         {
            outputText("[pg]你的触手肉棒松开怀孕女巫的脚踝，转而缠住她的大腿。你将第三根肉棒对准她第二个小穴的根部，龟头轻轻滑入她下体湿透的唇瓣之间。随着触手肉棒用力一拽，它们拉开女孩晒成褐色的大腿，将她的性器刺穿在你的阳物上。");
            _loc2_ = true;
         }
         else if(get_player().countCocksOfType(CockTypesEnum.TENTACLE) >= 2 && get_player().cocks[_loc1_].get_cockType() != CockTypesEnum.TENTACLE && get_player().cockThatFits2(50) >= 0 && get_player().cockTotal() >= 4)
         {
            outputText("[pg]你松开女孩的脚踝，将你的肉棒对准她第二个小穴那淌着淫液的阴唇之间。[say: 好、好啊！]当你开始把数根肉棒同时往她体内推进时，她尖声叫了出来，[say: 好、好多肉、肉、肉棒！]她幸福地喊着，女性器官被撑到了几乎疼痛、远超本该能承受的程度。");
            _loc2_ = true;
         }
         else
         {
            outputText("[pg]你的双手沿着女巫的双腿滑上大腿，直到握住她的臀部。你任由自己的" + get_player().cockDescript(_loc1_) + "的棒身在她湿淋淋的阴唇褶皱间上下摩擦，直到龟头滑入其中，抵住她的入口。[say: 求、求你！快、快点！我需、需、需要它！]你同样迫不及待地想满足她，于是向前挺身刺入。");
         }
         outputText("女巫愉悦的呻吟和闷哼挑起了房间里其他女巫的情欲，她们带着极度的嫉妒注视着这一切。有的抓着自己的乳头，有的试着用手指抠弄小穴；她们一边呜咽，一边看着你操她们的姐妹，从这种嫉妒的窥淫中获得快感。");
         outputText("[pg]你的抽插变得有力到足以让被贯穿的女巫上半身在地板上上下摇晃。她上方的乳房一次次拍打在自己脸上，下方的乳房则拍在怀孕肚腹肿胀的两侧。她四只胀满乳汁的巨乳都向空中喷出道道乳汁。高潮狂喜中的呜咽呻吟不断从她饱满漂亮的嘴唇里流出。她的身体因接连不断的高潮痉挛而颤抖抽搐。每次抽插时，你赤裸的肉棒贴着她体内深处的嫩壁滑动，这种感觉很快就让女孩的高级脑功能彻底停摆。她变成了一只失去理智、沉溺在快感中的怀孕雌兽，在你的肉棒");
         if(_loc2_)
         {
            outputText("不断猛撞");
         }
         else
         {
            outputText("不断猛撞");
         }
         outputText("进她下体时，她的口水从唇边流出，顺着脸颊滴落，双眼也翻到头顶。还真是容易上手的一炮。");
         if(get_player().biggestTitSize() >= 4 && get_player().biggestTitSize() < 15)
         {
            outputText("[pg]当你渐渐进入操弄怀孕玩物的节奏时，你的乳房上下弹跳起来。");
            if(get_player().get_pregnancyIncubation() > 0 && get_player().get_pregnancyIncubation() < 200)
            {
               outputText("每当如此，你自己的乳房都会拍打在肿胀的腹部上。");
            }
            else if(get_player().bRows() >= 2)
            {
               outputText("每次抽插时，你下方那对乳房都会拍在怀孕女孩的肚子上。");
            }
         }
         else if(get_player().biggestTitSize() >= 15)
         {
            outputText("[pg]你的[chest]大到每次抽插时与其说是在弹跳，不如说是在晃动。");
            if(get_player().bRows() == 1)
            {
               outputText("你那两只沉重的奶袋摇晃不止，有时你不得不把它们搁在可怜女巫的肚子上，免得自己过早累垮。");
            }
            else if(get_player().bRows() >= 2)
            {
               outputText("你的巨乳彼此叠着，又压在女巫腿上；每当你的臀部一动，那一团团硕大的乳肉便随之震颤。");
            }
            outputText("房间里的女巫们都忍不住瞪大眼，看着你的乳房比她们自己的还要丰满；只要你往前或往后动错一下，你或被你干着的那个女巫都可能突然被你那大得离谱、肿胀沉重的奶子压得喘不过气。");
         }
         outputText("[pg]没过多久，湿热裸露的肉体沿着你的");
         if(_loc2_)
         {
            outputText("肉棒");
         }
         else
         {
            outputText("肉棒");
         }
         outputText("滑动的感觉便逼得你也迎来高潮。");
         if(get_player().balls > 0)
         {
            outputText("你的[balls]因即将把腰间孕育生命的精华释放进她等候已久的子宫而绷紧起来。");
         }
         outputText("你伸出双手，抓住女巫下排乳房肥大的乳头，像拉缰绳一样拽着它们，同时试图顶得更深。[say:唔！啊！]女巫在快感与疼痛中咬住下唇，任由你粗暴地摆弄她流着奶的乳头。");
         if(get_player().biggestTitSize() >= 15)
         {
            outputText("你自己的奶子沉甸甸地压在手臂上，你一边拉扯着情人的乳头，一边努力保持臀部动作稳定。");
         }
         else
         {
            outputText("你的每个[nipples]都开始朝女巫喷洒乳汁，而你的身体也开始冲向高潮。");
         }
         outputText("[pg]这股涌动起初很缓慢。你感觉精液先在下身积聚，然后在体内一路上涌，灌满你肉棒的根部");
         if(get_player().cockTotal() > 1)
         {
            outputText("");
         }
         outputText("。女孩感觉到你在她体内膨胀，即将喷出那股洪流，不由得尖叫起来。她的双手抓挠着地板，像是想找个支撑让自己的感官稳住，但这毫无用处，因为你丰沛的精液已经在她体内爆发。");
         if(get_player().cumQ() < 500)
         {
            outputText("[pg]你感觉自己的肉棒");
            if(_loc2_)
            {
               outputText("");
            }
            outputText("顶着女孩被蹂躏的宫颈，一股又一股地灌进她空荡的子宫。感受着你的精液倾注进她的子宫，她的呻吟逐渐变成了语无伦次的呢喃。幸福的泪水在她眼角凝聚，顺着脸颊滚落；她心中满是确信，自己很快就会带着两个被填满的子宫。");
         }
         else if(get_player().cumQ() < 1500)
         {
            outputText("[pg][say:我、我、我感、感觉到了！]她大声哭喊，任由精液之河灌满自己。她阴道壁紧紧夹住你，迫使所有精液都径直穿过宫颈，流进她的子宫。随着你充足的精液像吹气球一样将她灌满，她的肚子也微微鼓了起来。灌进去这么多，她恐怕很快就会怀上一个新孩子。");
         }
         else if(get_player().cumQ() < 5000)
         {
            outputText("[pg]这个激素高涨的女巫脸颊滚落喜悦的泪水，而你的腰间开始将一股股强劲的精液射进她体内深处。她的小穴紧紧夹住你的肉棒，迫使一升多精液直接灌进她空荡的子宫。[say:太、太多了！]她在高潮般的疯狂中哭喊，原本就隆起的肚子膨胀得更加巨大。第二个子宫被精液灌得过满后，她的腹部看起来就像已经怀上了第二个孩子。尽管她嘴上惊慌喊叫，双腿却仍试图把你留在体内，渴望让子宫吞下更多精液。");
         }
         else
         {
            outputText("[pg]她的头来回摇晃，大脑已经无法处理被滔滔精液灌入体内的强烈快感。她的宫颈完全阻挡不住，数升精液如决堤洪水般涌进她体内。短短几秒内，她的第二个子宫便胀到与已经足月的第一个子宫相仿。随着一股股精液继续灌入，她腹部两侧开始浮现妊娠纹。两个子宫的位置有些怪异，使它们各自形成了鲜明的隆起，就像她肚子里藏着两块小圆石。身体被彻底灌满时，她在失神的幸福中尖叫起来。");
         }
         if(get_player().hasVagina())
         {
            outputText("[pg]你自己的阴道也因快感而绷紧，感觉阴蒂火热地悸动。可惜在你把这个发情孕妇灌满精液时，没有一根肉棒来填满你。");
            if(get_player().wetness() >= 4)
            {
               outputText("一团团淫液溅到你和女巫的腿上，你的高潮逼得小穴一次又一次喷射。");
            }
            if(get_player().balls > 0)
            {
               outputText("等到你的小穴高潮结束时，你的[sack]已经湿透了。");
            }
         }
         if(get_player().cumQ() < 1500)
         {
            outputText("[pg]你任由逐渐软下来的胯间从她的小穴里滑出。一小股白浊从她的阴唇间流了出来。可怜的女巫用双手抚过自己鼓胀的肚子和乳房，性爱后的余韵让她陷入朦胧的快感之中。");
         }
         else
         {
            outputText("[pg]你小心地抽身而出，尽管你的肉棒");
            if(get_player().cockTotal() > 1)
            {
               outputText("");
            }
            outputText("仍在");
            if(get_player().cockTotal() == 1)
            {
               outputText("");
            }
            outputText("喷出一股股精液。你白浊的精液成束溅在女巫赤裸的肚子和乳房上。你用双手套弄着你的" + get_player().cockDescript(_loc1_) + "，直到把这位晒成小麦色的美人从头到脚都浇满你的精液。其他女巫很快围上那个筋疲力尽的女孩，舔去她乳房上的精液，又从她一道道乳沟的凹陷里把精液舀出来，急切地抹到自己的小穴上，妄想着让自己的额外子宫也受孕。");
         }
         get_player().orgasm("Generic");
         dynStats(DynStat.Sens(-2));
         doNext(playerMenu);
      }
      
      public function fuckMilkbabeWithPenor() : void
      {
         clearOutput();
         var _loc1_:int = get_player().cockThatFits(50);
         if(_loc1_ < 0)
         {
            _loc1_ = get_player().smallestCockIndex();
         }
         outputText("你转过身，将这个奶骚货拉进怀里，她那巨大的乳房重重压在你的[chest]上，压得乳汁都喷了出来。你抚着她的脸颊，把她的嘴唇引向自己的唇。她的手又一次找到你的[cock]，动作越来越快地套弄着；你的舌头探入她口中，双手则向下游移，揉捏她丰腴的屁股和适合生育的宽胯。你的奶女仆重重叹息，吐息中满是情欲；你把她推到浴池边缘，她双腿大大分开，方便你进入那被乳汁润滑过的小穴。她双臂环住你的肩膀，愉悦地呻吟着，而你压入她体内，你的" + get_player().cockDescript(_loc1_) + "轻易滑进她湿透的小穴。");
         outputText("[pg]沉在一片乳白的奶海之下，滑进这个奴隶女孩体内实在是轻而易举，");
         if(get_player().cockArea(_loc1_) < 30)
         {
            outputText("一记长驱直入便直没至根");
         }
         else if(get_player().cockArea(_loc1_) < 50)
         {
            outputText("将你那长长的阳具推进她体内，直到你们的胯部贴合；她柔软松弛的小穴轻易吞下了你的长度");
         }
         else
         {
            outputText("你的肉棒尽可能深入她体内，剩下塞不进去的粗长肉茎则被你们之间的乳白液体包裹着");
         }
         outputText("。你的肉棒埋在她体内，乳奴用双腿勾住你的[hips]，开始轻轻摆动腰身，把主动权交给你。你朝这个温顺的女孩笑了笑，手指陷入不断渗出乳汁的乳肉之中，随即开始摆动腰胯，从容而有节奏地挺入她体内，让乳汁涌进她的甬道、裹住你的阴茎，为每一次动作都添上润滑。");
         outputText("[pg][say:好、好舒服，[Master]，]她呻吟着，[say:[Master]让浴池里的骚货舒服极了。哦！]");
         outputText("[pg]你加快了节奏，一下比一下更用力地挺入，乳白的浪花被你拍进她乳沟的谷地，又溅过池沿。你的爱人紧紧攀着你，乳汁不断渗出，小穴里也淌下一道清亮的淫液，而你则一下下猛力贯入。你配合着每次挺动俯身吻住她，用一个绵长的吻堵住她欣喜若狂的呻吟。等你分开时，唾液与乳汁的细丝仍连着她丰满而暗色的双唇和你的嘴，她的舌头也因性福而微微垂出口外。她的整个身体开始颤抖，巨大的胸口起伏不止，显然已经逼近顶点。你在她高潮时也放开了自己；当她第一声高潮的呻吟回荡开来，你发出充满原始欲望的低吼，与她一同释放，把一大团浓稠精液涂满她被乳汁润滑的小穴，又让一股接一股的精液注入其中，用你强盛的种子填满她的子宫。");
         outputText("[pg]你任由女孩继续了很久很久，在释放的余韵中颤抖着，把最后几滴精液射在她体内。你重重叹了口气，向前瘫去，把头埋进她惊人的胸脯里恢复体力。乳女孩伸出双臂抱住你，将你紧紧搂在怀里，你不由得咧嘴一笑。");
         outputText("[pg]你的整个身体都感到深深的舒畅，她的乳汁渗入你的肌肤，让你焕然一新、精力复苏；而那场欢愉的交合也让你每一块肌肉都放松下来。你刚想感谢这位奶娘带来的愉快陪伴，可你才一张口，她便把嘴唇贴上来，与你来了一个漫长而舌尖交缠的吻。你暗自轻笑，在不挤压到她乳房的前提下尽可能紧地抱住她，把她侧过身，让她把脸颊蹭进你的[chest]，又亲了亲她的头顶，这才与你一同爬出池子。你还得扶她一把，她那额外的巨大重量差点又把她拖回池里，幸好你反应够快。你收起自己的[armor]，揉了揉这名奶奴的头发，然后转身回到眼前的正事上。");
         get_player().orgasm("Dick");
         get_player().changeFatigue(-15);
         doNext(playerMenu);
      }
      
      public function fuckItAttack() : void
      {
         clearOutput();
         outputText("你确定这是个好主意吗？");
         doYesNo(reallyAttack,riddleReturn);
      }
      
      public function fuckDatSphinx() : void
      {
         var submitted:Boolean;
         var _g2:DesertCave;
         var skipped:Boolean;
         var _g1:DesertCave;
         var submit:Boolean;
         var _g:DesertCave;
         clearOutput();
         outputText("你淫笑着看向这位漂亮的狮女，告诉她该找点乐子了。她动作轻盈地让天蓝色的宽松短裙从肩头滑落，露出挺翘、堪堪一握的乳房。[say: 好吧，毕竟你赢了我的游戏……你想怎么处置我都行，我聪明又" + get_player().mf("英俊","美丽") + "的朋友。]");
         menu();
         addButtonDisabled(0,"干她","此场景需要你拥有阴茎。");
         addButtonDisabled(1,"被口交","该场景需要你拥有阴茎。");
         addButtonDisabled(2,"爪交","该场景需要你拥有阴茎。");
         if(get_player().hasCock())
         {
            addButton(0,"干她",fuckDatLionPussah);
            _g = this;
            submit = false;
            addButton(1,"让她口交",function():void
            {
               _g.getBlown(submit);
            });
            _g1 = this;
            skipped = false;
            addButton(2,"爪交",function():void
            {
               _g1.lionpaws(skipped);
            });
         }
         addButton(3,"魔法假阳具",forceDildos);
         addButton(4,"爪插",pawThatPussy).disableIf(!get_player().hasVagina(),"此场景需要你拥有小穴。");
         _g2 = this;
         submitted = false;
         addButton(5,"奥术玩弄",function():void
         {
            _g2.sanuraCunnilingus(submitted);
         }).hint("舔她的小穴，同时让她填满你的后穴。");
         addButton(14,"返回",sphinxMenu);
      }
      
      public function fuckDatLionPussah() : void
      {
         clearOutput();
         outputText("你脱下衣物，把[armor]扔到一旁堆成一小堆。你在干燥的沙漠空气中舒展筋骨，享受温暖阳光洒落在你的[skinfurscales]和[cocks]上。萨努拉轻巧地绕着你踱步，用栗色的眼睛打量你的模样，随后赞许地咂了咂舌。她的狮尾从你的[cock biggest]顶端扫过，用尾端那撮丝滑柔软的毛轻抚着它。那触感让你一阵战栗，一时间不知该作何反应。可你的阴茎就没有这种纠结了，立刻开始挺立起来。");
         if(get_player().biggestCockArea() < 6)
         {
            outputText("[pg][say:哎呀，又小又可爱。我都不知道这东西还有女式尺寸呢，]她咯咯笑着，用尾巴轻弹你肉棒的[cockHead biggest]。你脸一下子红了起来。就算按英格纳姆的标准，你也比平均水平略小一点；而在玛瑞斯嘛，你就实在小得可怜了。[say:别担心，亲爱的，这已经够我接下来要做的事用了。]");
         }
         else if(get_player().biggestCockArea() < 30)
         {
            outputText("[pg][say:嗯，虽然不是我在这儿见过最大的，但看起来确实很美味……]她低声咕哝着，把尾巴缠上你的肉棒。萨努拉轻轻夹了一下，随后咯咯笑着把尾巴甩开。");
         }
         else if(get_player().biggestCockArea() < 100)
         {
            outputText("[pg][say:嗯，这才像话嘛，]萨努拉低声咕哝着，用尾巴缠住你粗大的阴茎，挑逗你的");
            if(get_player().balls > 0)
            {
               outputText("睾丸");
            }
            else if(get_player().hasVagina())
            {
               outputText("小穴");
            }
            else
            {
               outputText("肛门");
            }
            outputText("，还带着那一小撮毛。[say: 那个坏小子肯定再合适不过。]");
         }
         else
         {
            outputText("[pg]萨努拉一看到你那根怪物般的肉棒，眼睛顿时瞪大。她张开嘴想说些什么，却一个字也说不出来。她的尾巴探过来，徒劳地缠住你的肉棒。[say: 以玛莱那软绵绵的奶子起誓，这玩意儿也太大了，]她终于找回声音说道。[say: 我不知道自己能不能吃得下这么大的东西……但该死的，我要试试。]");
         }
         outputText("[pg]在她的注视下，你的阳具猛地上翘，硬得发疼，而这位斯芬克斯仍在打量你的身体。她的尾巴轻轻拂过你的[skinfurscales]，短暂停下来逗弄");
         if(get_player().totalNipples() == 2)
         {
            outputText("两边");
         }
         else
         {
            outputText("每一边");
         }
         outputText("的乳头；它们也随之挺立起来，就像你的肉棒一样。你忍不住觉得这里面似乎有什么魔法在作祟。她的尾巴从你大腿间掠过，优雅地搔弄你的");
         if(get_player().hasVagina())
         {
            outputText("湿漉漉的小穴；它突然收紧，几乎喷涌出滑腻的淫液。");
         }
         else
         {
            outputText("肛门；它反射性地一紧，让一阵战栗窜上你的脊背。");
         }
         outputText("[pg]最后，她停了下来，正面看着你。[say: 好了，躺下吧，我们开始，]她随口说道，把双臂交叉在自己小巧的乳房下。你疑惑地挑起眉看着她。[say: 这不就是你想要的吗？]她问着，转过那性感的兽身，露出一个湿润滴水的小穴。[say: 因为那个，]她舔着嘴唇，指向你的肉棒说道，[say: 就是我想要的。]");
         outputText("[pg]那只母狮的小穴已经足够诱人。你跪了下来，随后仰面倒下，肉棒像附近的石柱一样高高挺立、傲然昂起。那位光彩照人、迷人的斯芬克斯迈步来到你上方，用柔软的皮质爪掌轻轻按住你的手腕。[say: 嗯，别担心这个，亲爱的，我只是想确保你不会跑掉。]你轻轻挣了挣她的爪掌，并不是真的想脱身，只是在试探她的力气，而她确实很强。");
         outputText("[pg][say: 先来稍微热热身，怎么样？]她带着狡黠的笑容问道。她的狮躯朝你压低，让你僵硬的肉棒碰上她猫科的肉缝，顿时令你猛吸一口气。可惜，并没有插入。相反，萨努拉只是让身体沿着你的肉棒上下磨蹭，用她滚烫湿润的肉缝挑逗、撩拨着它。你咬住嘴唇，而你上方的斯芬克斯则带着些许愉悦呻吟起来。[say: 哦呵，]她笑道，[say: 你也许在智力上胜过了我，但我还是能挑逗你。]");
         outputText("[pg]萨努拉抓住自己一只乳房，粗暴地捏弄着乳头，同时继续沿着你的肉柱上下滑动。你试着把腰往前顶，渴望插进她的小穴，可她只是嘟囔一声，[say: 啧啧，]然后不赞同地朝你摇了摇手指。你朝她瞪了一会儿，随后脑中计上心来。趁这位丰艳的斯芬克斯把注意力重新放回自己的乳房上，你专心观察她腰部的动作，在脑海里掌握起她的节奏。");
         outputText("[pg]你默数着节奏，等时机一到，便猛地挺腰向上又向前，狠狠顶开萨努拉的小穴。震惊的神情掠过她的脸庞，又很快被狂喜的陶醉取代。她的嘴唇张成O形，发出一声悠长的呻吟。[say: 我……你不该……]她开口说道，低头看着你，神情里混杂着恼怒与快感。[say: 哦，操……好爽！别停！]");
         outputText("[pg]你咧嘴一笑，再次挺身插入她。她的腰也跟上节奏，随着你的顶动上下起伏；当你一次又一次把你的[cock biggest]插进她体内时，湿滑的水声不断响起。萨努拉的小穴紧紧夹住你，紧得完全不像你想象中半兽身生物会有的程度；与此同时，她还玩弄着自己挺翘的小乳房，显然已经沉溺在快感的忘我之海里。每隔几次挺入，她的唇间就会逸出细小的喘息，散入温热的沙漠微风中。你的腰不断冲撞，整个身体都因激情而变得滚烫，渴望着某种释放，但你还没有屈服。");
         outputText("[pg]你让萨努拉迎来了第一次尖叫般的高潮，接着是第二次，第三次。直到这位斯芬克斯几乎只剩一团在高潮狂喜中颤抖的肉体，你才肯罢休。她的双腿像果冻一样发颤，几乎压不住你的手臂，但那已经不重要了。你很清楚现在是谁掌控局面，而绝对不是骑在你身上的那头母狮。你一次又一次地挺入，把肉棒更深地埋进萨努拉的穴腔里，让她迎来第四次高潮；她的脸都扭曲了，几乎只剩下因高潮而浮现的笑容，双眼翻到了眼眶上方。");
         outputText("[pg]你也再撑不下去了，最后一次向前猛顶，把肉棒尽可能深地埋入她体内");
         if(get_player().hasKnot(get_player().biggestCockIndex()))
         {
            outputText("，你的肉结伴着湿润的<b>啵</b>一声滑入到位，确保你们在接下来一段时间里都被锁在一起");
         }
         outputText("。一股又一股精液从你的[cock]里喷涌而出，把这位斯芬克斯的内壁染成白色。");
         if(get_player().cumQ() < 250)
         {
            outputText("[pg]你的一些精液从旁边渗出，沿着你的肉棒淌下，滴进下方滚烫的沙漠沙地里。");
         }
         else if(get_player().cumQ() < 750)
         {
            outputText("[pg]一股精液从萨努拉的肉缝中溢出，溅到你的腿上和滚烫的沙漠沙地上。");
         }
         else if(get_player().cumQ() < 3000)
         {
            outputText("[pg]随着你将满满的爱液射进萨努拉体内，她的肚子肉眼可见地鼓了起来；好几股精液从她的小穴里涌出，淋满你的双腿和身下的沙地。");
         }
         else if(get_player().cumQ() < 10000)
         {
            outputText("[pg]萨努拉的肚子胀了起来，看上去像是突然怀上了一个巨大的精液宝宝。一股名副其实的精液洪流从她被肏弄过的小穴中涌出，将你的下半身和周围数尺内的沙地都彻底裹上了滚烫的白浊液体。");
         }
         else
         {
            outputText("[pg]萨努拉的肚子向外鼓胀，仿佛她突然有了九个月的身孕，但这还没有停下。她的腹部继续膨胀，直到压在你的肚子上……接着又把她的身体从你身上抬起了好几英寸。最后，一场堪称洪水般的乳白色浊流从她被肏弄过的穴里涌出，将你的全身，以及十尺内大半片沙漠，都裹进了满满的精液黏腻之中。");
         }
         outputText("[pg]你终于瘫倒下来，让全身肌肉都放松下来。萨努拉也没能撑多久，倒在你身旁，");
         if(get_player().hasKnot(get_player().biggestCockIndex()))
         {
            outputText("这让你有些不太舒服，毕竟你的肉结仍然牢牢卡在她体内，");
         }
         outputText("她剧烈地喘息着。你花了好几分钟才缓过来，而那位斯芬克斯花的时间更久，");
         if(get_player().hasKnot(get_player().biggestCockIndex()))
         {
            outputText("你的肉结又过了更久才消胀到足以从她体内滑出来，");
         }
         outputText("但你最终还是攒起力气，把自己撑了起来，站到你的[feet]上。");
         outputText("[pg][say: 嗯，这可真不是我原本想做的事，]萨努拉在那场猛烈的交合后重新整理好自己，说道。[say: 不过我也没什么可抱怨的。]你也没有，你在心里得意地笑了笑。");
         get_player().orgasm("Dick");
         menu();
         addButton(0,"进入",openZeDoorToParadize);
         addButton(14,"离开",exitDungeon);
      }
      
      public function fuckAllThePregWitches() : void
      {
         clearOutput();
         var _loc1_:int = get_player().cockThatFits(50);
         outputText("女巫们向前爬行，肚腹和两排涨满奶水的乳房拖慢了她们的动作。尽管她们晒成浅褐色的身体泛着光泽，双腿也相当健美紧实，但说到底，她们也不过是一堆淫荡的肉球；每个都有两对小穴，其中一对更是贪婪地渴求着精液，好填满她们空荡荡的第二子宫。她们浅棕色、汗津津的身体看起来都同样诱人，而随着[eachCock]慢慢胀大，事情也变得很清楚：如果你要操她们中的任何一个，就得把她们全都操了。不能让所有女巫都怀上你的种，那可远远不够。等你把她们全部搞定时，下一代沙漠女巫里有一半都得叫你“父亲”。");
         outputText("[pg]随着[eachCock]开始向空中挺起，你很容易就绕到行动迟缓的女巫们身后，诱导她们把两处小穴高高翘起。她们的上半身被沉重地压在地上，反而让她们更容易抬起骨盆，确保滴着淫液的小穴在紧实的大腿之间完整展示出来。每个女巫身上都有两对深色肿胀的阴唇呈现在你面前；你能清楚看见，其中一对下唇因为连接的子宫内压力积聚而大大张开。另一对同样肿胀，却滴下更多淫液，仿佛正渴望用精种填满自己空荡荡的子宫。成股流淌的淫液让这些淫妇的大腿和孕肚下方都湿滑得惊人。");
         var _loc2_:Boolean = false;
         if(get_player().cockTotal() == 1 || get_player().cockThatFits2(50) < 0)
         {
            outputText("[pg]你没有浪费时间，立刻向前，把你的[cock]沿着最近那个女巫的阴唇褶皱上下摩擦，好让它变得更加润滑。她在受折磨般的快感中呻吟，急切地想感受你整根男根直接顶进那些肉褶里。当你感觉龟头顶端沿着她小穴的唇瓣滑动时，你决定不再为了自己的快感继续挑逗她。你用两只手的手指扒开她的下体，把肉棒直接压进她的入口，感受那紧窄的孔道围着你的男根被撑开，并尽可能深地吞下你的肉棒。");
         }
         else if(get_player().cockThatFits2(50) >= 0 && get_player().cockTotal() < 3)
         {
            outputText("[pg]你向前走去，把两个女巫并排推到一起，让她们的屁股翘在空中，一对对小穴朝向你，而你的肉棒则抵在通往她们空子宫的下体上。随着你向前顶进，她们深色的小穴分开并吞下你的肉棒，引得这些淫荡女巫发出快感的尖叫，也逼得一团团淫液从她们欲火高涨的肉洞里沿着你的肉棒滴落。");
            _loc2_ = true;
         }
         else
         {
            outputText("[pg]你把三个弯腰的女巫聚到一起，让她们翘起的屁股紧紧并排贴着，距离近到足以让三根长肉棒同时操进她们湿透的小穴。随着你硬挺的肉棒每一刻都变得更坚硬，你抓住自己的阳物，将它们对准那些充血的深色小穴。你一感觉到每个女巫的小穴入口抵住你的龟头，便开始向前顶进。三人同时叫出声来，你的肉棒刺入她们的小穴，同时填满她们的深处。她们体内的肌肉收缩着夹紧你的肉棒，几乎像是要把你这一束肉棒吸得更深，吸进她们淫荡怀孕的身体里。");
            _loc2_ = true;
         }
         outputText("[pg]随着你的肉棒");
         if(_loc2_)
         {
            outputText("");
         }
         outputText("被女巫那湿润紧致的深处彻底吞没");
         if(_loc2_)
         {
            outputText("们");
         }
         outputText("，你开始前后摆动腰胯，让自己在");
         if(!_loc2_)
         {
            outputText("她的");
         }
         else
         {
            outputText("它们的");
         }
         outputText("天鹅绒般湿滑的深处进进出出。");
         if(!_loc2_)
         {
            outputText("她");
         }
         else
         {
            outputText("她们");
         }
         outputText("幸福的欢叫充满了房间，伴随着你将敏感的肉棒一次比一次更深、更狠地顶入时发出的阵阵湿滑吞咽声。");
         if(!_loc2_)
         {
            outputText("她");
         }
         else
         {
            outputText("她们");
         }
         outputText("四只乳房贴着地板摇晃弹跳，");
         if(!_loc2_)
         {
            outputText("她的");
         }
         else
         {
            outputText("它们的");
         }
         outputText("怀孕的");
         if(!_loc2_)
         {
            outputText("肚子摇晃着");
         }
         else
         {
            outputText("肚子摇晃着");
         }
         outputText("随着你阴茎每一次猛烈顶入而晃动");
         if(_loc2_)
         {
            outputText("");
         }
         outputText("。里的肌肉");
         if(!_loc2_)
         {
            outputText("她的");
         }
         else
         {
            outputText("它们的");
         }
         outputText("大腿和小腿的肌肉因快感而绷紧，你把");
         if(!_loc2_)
         {
            outputText("她的身体");
         }
         else
         {
            outputText("她们的身体");
         }
         outputText("逼到了极限。");
         if(get_player().biggestTitSize() > 3 && get_player().biggestTitSize() < 10)
         {
            outputText("你的乳房随着你热切的研磨动作上下弹跳。");
         }
         else if(get_player().biggestTitSize() >= 10 && get_player().biggestTitSize() < 20)
         {
            outputText("你那对巨大乳房沉甸甸的重量，让它们随着你每一次挺腰都来回摇摆。");
         }
         else if(get_player().biggestTitSize() >= 20)
         {
            outputText("你硕大无比的乳房压在身前女孩的屁股上。");
         }
         if(get_player().bRows() >= 2)
         {
            if(get_player().breastRows[1].breastRating >= 3)
            {
               outputText("你的第二排乳房拍打着身前女孩的屁股。");
            }
         }
         if(get_player().bRows() >= 3)
         {
            if(get_player().breastRows[2].breastRating >= 3 && get_player().breastRows[2].breastRating < 20)
            {
               outputText("你最下方那排乳房被压扁在女巫");
               if(_loc2_)
               {
                  outputText("");
               }
               outputText("肌肉结实的大腿上。");
            }
            else if(get_player().breastRows[2].breastRating >= 20)
            {
               outputText("当你前倾着抽插时，最下面一排乳房落到地板上，而女巫");
               if(_loc2_)
               {
                  outputText("们");
               }
               outputText("几乎能把");
               if(_loc2_)
               {
                  outputText("它们的");
               }
               else
               {
                  outputText("她的");
               }
               outputText("大腿撑在你那淫靡的乳房上，在你阴茎不断冲撞下向后仰去。");
            }
         }
         if(get_player().lactationQ() >= 200)
         {
            outputText("仅仅一小会儿失神般的交媾后，你的乳房便开始渗出乳汁，很快，你湿亮的乳头就把奶水喷洒到");
            if(!_loc2_)
            {
               outputText("女巫晒成褐色的背臀上");
            }
            else
            {
               outputText("你正贯穿着的那些褐色身体上");
            }
            outputText("。房间里的另外几名女巫也迫不及待地走上前来，含住你的[nipples]吮吸，等待轮到她们受孕。");
         }
         outputText("[pg]你下腹深处的精液开始涌动，灌满你阴茎的根部");
         if(_loc2_)
         {
            outputText("");
         }
         outputText("，你感觉高潮正从体内一点点逼近。那种吮吸般的触感来自");
         if(!_loc2_)
         {
            outputText("女孩小穴对你阴茎的包裹");
         }
         else
         {
            outputText("女孩们的小穴对你阴茎的包裹");
         }
         outputText("，开始变得难以承受；等你反应过来时，你已经濒临射出种子的边缘。你正在猛力抽插的");
         if(!_loc2_)
         {
            outputText("小穴");
         }
         else
         {
            outputText("小穴们");
         }
         outputText("似乎");
         if(!_loc2_)
         {
            outputText("");
         }
         outputText("察觉到了它渴求的精液即将释放");
         if(!_loc2_)
         {
            outputText("它所渴求的");
         }
         else
         {
            outputText("它们渴求的");
         }
         outputText("，强烈的收缩开始将你的肉棒吮吸得");
         if(_loc2_)
         {
            outputText("");
         }
         outputText("更加急切。你忍不住给");
         if(!_loc2_)
         {
            outputText("它注入它渴求的那股精液");
         }
         else
         {
            outputText("它们注入它们渴求的一股股精液");
         }
         outputText("。");
         outputText("[pg]你的");
         if(!_loc2_)
         {
            outputText("肉棒下侧膨胀起来");
         }
         else
         {
            outputText("几根肉棒的下侧膨胀起来");
         }
         outputText("，丰沛的精液涌遍肉棒全长，将");
         if(!_loc2_)
         {
            outputText("女巫的小穴");
         }
         else
         {
            outputText("女巫们的小穴");
         }
         outputText("撑得更开。你尽可能向前顶去，让");
         if(!_loc2_)
         {
            outputText("你的龟头抵住她饱受蹂躏的宫颈");
         }
         else
         {
            outputText("你的几根龟头抵住她们已经虚弱的宫颈");
         }
         outputText("，就在这时，你的精液开始喷涌而出。");
         if(get_player().cumQ() < 1000)
         {
            outputText("[pg]你把");
            if(!_loc2_)
            {
               outputText("她的小穴内壁");
            }
            else
            {
               outputText("她们的小穴内壁");
            }
            outputText("涂满精液，其中不少直接射进");
            if(!_loc2_)
            {
               outputText("她的子宫");
            }
            else
            {
               outputText("她们的子宫");
            }
            outputText("。当你终于抽出来时");
            if(!_loc2_)
            {
               outputText("一股");
            }
            else
            {
               outputText("数股");
            }
            outputText("精液留在了里面。");
         }
         else
         {
            outputText("[pg]发情的");
            if(!_loc2_)
            {
               outputText("女巫还没");
            }
            else
            {
               outputText("女巫们还没");
            }
            outputText("准备好承受从你性器中爆发出的洪流。一升接一升地喷涌而出，灌满了");
            if(!_loc2_)
            {
               outputText("她空荡荡的子宫，让它像气球一样膨胀");
            }
            else
            {
               outputText("她们空荡荡的子宫，让它们像一串气球一样膨胀");
            }
            outputText("，也让你在倾泻一空的极致快感中翻起白眼。当");
            if(!_loc2_)
            {
               outputText("她的肚子");
            }
            else
            {
               outputText("她们的肚子");
            }
            outputText("胀得和旁边那些孕肚一样大，两侧开始出现一道道妊娠纹时，你终于抽身出来，任由你的肉棒");
            if(_loc2_)
            {
               outputText("");
            }
            outputText("把");
            if(!_loc2_)
            {
               outputText("它的");
            }
            else
            {
               outputText("它们的");
            }
            outputText("最后几股精液喷洒在");
            if(!_loc2_)
            {
               outputText("淫荡女巫的背上");
            }
            else
            {
               outputText("女巫们成片撅起的屁股上");
            }
            outputText("。");
         }
         if(!_loc2_)
         {
            outputText("[pg]她倒");
         }
         else
         {
            outputText("[pg]她们倒");
         }
         outputText("下去。很快，房间里其余的女巫都迫不及待地把小穴高高抬起，乞求轮到自己受孕。你欣然成全她们，把肉棒尽可能深地捅进这些被激素折磨得神魂颠倒的荡妇献上的每一个湿穴里。一个接一个的小穴被你贯穿，你反复抽插，直到她们穴内按摩般收缩的嫩肉榨出她们空虚子宫饥渴以求的滚滚精液。女巫们一个个被灌满，仍在余韵中颤抖着倒在地上，随即又有新的女巫顶上来，带着比上一个更渴望精液的湿淋淋小穴。");
         if(get_player().cockThatFits2(50) >= 0)
         {
            outputText("[pg]最后一个女巫，你选择把两根肉棒一起塞进她空虚的小穴里。你双棒并用的顶弄每一下都逼得她发出欢喜的尖叫。[say:啊！太、太多了！]她尖叫着，可她的阴道却依旧死死不肯放开你。当你终于射出来时，奔涌的精液让她感觉自己几乎要被撑爆。子宫的膨胀让她的肚子鼓胀起来，甚至把四只乳房都顶得向上抬起，重心也明显偏移。你的精液强势灌进她的子宫和输卵管时，那伴随而来的高潮已超出她所能承受的极限；她像被用烂的飞机杯一样从你的肉棒上滑落，暗色的阴唇间不断渗出一团团精液。");
         }
         outputText("[pg]终于结束后，你站在自己射出的精液池中，低头看着那一堆堆乳房和肚子。她们据说是女人，可从各种意义上来说，都已经成了装满乳汁、胎儿与精液的肉袋。每个人身上都覆着一层汗水和精斑，满足而愉悦的细小呜咽声从那些沉重肉球下的某处传来。你忍不住想着，她们还要多久才能生产，好让你再一次让她们怀上她们的身体显然注定要孕育的一窝窝孩子。");
         get_player().orgasm("Generic");
         dynStats(DynStat.Sens(-3));
         doNext(playerMenu);
      }
      
      public function friendlySandMotherFuck() : void
      {
         if(get_monster() == null || get_monster().get_short() != "Sand Mother")
         {
            set_monster(new SandMother());
            get_monster().set_HP(0);
         }
         clearOutput();
         var _loc1_:int = get_player().cockThatFits(get_monster().vaginalCapacity());
         var _loc2_:int = get_player().cockThatFits2(get_monster().vaginalCapacity());
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,851) == 0)
         {
            outputText("你环顾四周，确认没人窥探后，故作神秘地压低眉头，打听起沙之母的感情生活。");
            outputText("[pg]沙之母微微脸红，一只手漫不经心地在泛红的脸颊旁扇了扇，随后将一缕白金色的发丝从脸上拨开。她紧张地咬住下唇，才承认道：[say: 这并不关你的事，勇者。不过，没有。我的职责相当繁重，实在太忙，没空让子嗣拖累自己。而挤奶器已经能提供我所需的所有……刺激。]她巨大的乳头正缓缓硬起，将丝绸长袍从乳房上顶开，带着渴求挺立起来。她调整姿势、交叠双腿时，你发誓自己能听见那对硕大圆乳里丰沛的乳汁晃荡作响。紧接着，你闻到了明显的女人发情时的气味。");
            outputText("[pg]看着她硬挺而湿润的乳头，你评论说，她似乎不止一方面都被晾得太久了。她顺着你的视线望向自己的乳房，身体明显扭动起来，喘息着说道：[say: 什……我……我没有……]她发光的眼睛瞥向你的胯下，看见你靠近王座时逐渐鼓起的隆起。她无意识地舔了舔嘴唇，松开了那根正绕弄着闪亮发丝的手指。");
            outputText("[pg]她叹了口气，承认道：[say: 我确实……呃……确实有些需求。也许交合一下，终究会有些好处。]");
         }
         else
         {
            outputText("你环顾四周，确认没人窥探后，故作神秘地压低眉头，问她是否想让你照料一下她更原始的需求。沙之母看向你的胯间，舔了舔嘴唇，乳头在长袍下挺起，撑出两个硬硬的小帐篷。她用手指绕着一绺头发，低声娇吟道：[say: 嗯，稍微交合一下，让脑子清醒清醒，或许正是我需要的。]");
         }
         outputText("这位深色皮肤的女术士做出一个奥术手势，手中亮起力量的光芒；一道发光的蓝色符文在她肚脐周围扩展开来，繁复的发光纹路织成六边形图案，光是看着就让你头晕目眩。[say:我虽是沙之母，但还没准备好真的当母亲。]光芒已经开始褪去，和出现时一样迅速地消失了。");
         outputText("[pg][say:脱掉。]她轻啧一声，指了指你的[armor]。");
         outputText("[pg]你开始脱下衣物，一边看着她，等她也宽衣解带，可她并没有。没错，她确实换了个姿势，坐到了王座边缘，但她身上那件丝滑而做工精湛的长袍，连一条手臂都没滑出来。你打趣地问她，难道打算让你隔着衣袍干她吗。");
         outputText("[pg]沙之母咯咯笑了起来，慢慢掀起法衣下摆，露出膝盖、光滑的大腿，以及两腿间潮热的三角地带。即使隔着这么远，你也已经能看见她的淫液，正蜿蜒成细流缓缓滴下，在她身下积成一摊；当她在你充满欲望的注视下挪动身子时，那摊液体便被她圆翘的臀部压得轻轻作响。那两只小穴共有四片鼓胀的阴唇从外阴间探出，泛红肿胀，满是情欲。你还看不清她的阴蒂，但能看见阴蒂包皮微微鼓起，泛着柔亮的湿光。你确信，只要稍加刺激，就能让那些敏感的小东西探出来玩耍。");
         outputText("[pg][say:我坐在王座上统治时，你来服侍我，想必你不会介意吧？]沙之母问道，将长袍往上扯到足够高的位置，不让它碍事，布料堆在她的臀部周围和身后。一只手懒洋洋地绕着她鼓胀的大乳头打圈，乳汁几乎立刻涌出，顺着她的多只乳房不断流淌。另外三只乳头也仿佛被牵动般湿润起来，很快把她胸前的衣料弄得又湿又热、一塌糊涂。她的脸颊红到了深色皮肤所能显出的极限。她喘息着恳求道：[say:来占有我吧，勇士。我需要这个。我需要你进入我身体里！]最后一个词几乎是呻吟出来的，她的手指用力捏住乳头，挤出一道乳汁，湿漉漉地喷洒在王座前方。");
         outputText("[pg]你自己也早已按捺不住，走到她面前，");
         if(!get_player().isTaur())
         {
            outputText("把[oneCock]握在");
            if(_loc2_ >= 0)
            {
               outputText("一只");
            }
            else
            {
               outputText("你的");
            }
            outputText("手里");
            if(_loc2_ >= 0)
            {
               outputText("，另一根则握在另一只手里");
            }
            outputText("，粗实的肉棒晃动着，血管在表皮下搏动；你将");
            if(_loc2_ < 0)
            {
               outputText("它");
            }
            else
            {
               outputText("它们");
            }
            outputText("抵上了那两只湿漉漉的小穴。");
         }
         else
         {
            outputText("肉棒");
            if(_loc2_ >= 0)
            {
               outputText("");
            }
            outputText("在你的马身腹下晃动，粗实的肉棒上血管在表皮下搏动；随着");
            if(_loc2_ < 0)
            {
               outputText("它");
            }
            else
            {
               outputText("它们");
            }
            outputText("抵上了那两只湿漉漉的小穴。");
         }
         if(get_player().get_tallness() >= 90)
         {
            outputText("以你的身高，得跪下来才行。");
         }
         else if(get_player().get_tallness() <= 48)
         {
            outputText("以你的身高，站着几乎够不到她的小穴。");
         }
         outputText("她被润滑液浸得发亮的穴口包裹住你的" + get_player().cockHead(_loc1_));
         if(_loc2_ >= 0)
         {
            outputText("和另一根龟头");
         }
         outputText("，滚烫的湿意吞没着你的每一寸，又湿又热地紧贴着那根过分敏感、跳动着的肉棒");
         if(_loc2_ >= 0)
         {
            outputText("");
         }
         outputText("。这个高大的女人如释重负地叹息着，仿佛你终于替她挠到了那处说不出口的隐秘痒处。你的[hips]带着连自己都怀疑无法停下的狂热向前挺去，用");
         if(_loc2_ >= 0)
         {
            outputText("你的两根肉棒");
         }
         else
         {
            outputText("你的" + get_player().cockDescript(_loc1_));
         }
         outputText("。");
         if(get_player().isTaur())
         {
            outputText("[pg]你愉悦地嘶鸣着，将前腿搭在");
            if(get_player().get_tallness() < 78)
            {
               outputText("她的肩上");
            }
            else
            {
               outputText("她王座的顶端");
            }
            outputText("，随即挺身冲刺，带着野兽般的快意狠狠抽插着她。沙之母在你兽性的庞大身躯下颤抖，双手隔着湿透、几乎遮不住身体的长袍拉扯着自己的乳头。她呜咽起来，开始亲吻你人类部分的腹部，用舌头舔弄你的肚脐，而她正被你那根能干垮母狗的勃起肉棒骑压着");
            if(_loc2_ >= 0)
            {
               outputText("");
            }
            outputText("。你用手指抓住一缕铂金色长发，牢牢控制住她，同时任由下半身非人的欲火掌控你的身体。");
         }
         else
         {
            outputText("[pg]你愉悦地呻吟着，把双手撑在她的");
            if(get_player().get_tallness() < 60)
            {
               outputText("下排乳房上");
            }
            else if(get_player().get_tallness() < 84)
            {
               outputText("上排乳房上");
            }
            else
            {
               outputText("肩上");
            }
            outputText("，随即挺腰抽插，将你的阳具有力地贯入她那被润滑液裹得发亮的甬道");
            if(_loc2_ >= 0)
            {
               outputText("");
            }
            outputText("。沙之母在你面前颤抖着，双手隔着湿透、早已遮不住什么的长袍揉扯着自己的乳头。她饥渴地呜咽着，而");
            if(get_player().get_tallness() < 72)
            {
               outputText("你吻住她，让她安静下来，你的舌头与腰胯的顶动保持着同样的节奏");
            }
            else
            {
               outputText("你含吮她一只沉甸甸、涨满乳汁的乳房，让她更加愉悦");
            }
            outputText("。她的手指穿过你的[hair]，任由激情将自己彻底淹没。她的淫液啪嗒作响地滴落、喷溅，围着你猛烈抽插的肉棒四处飞散");
            if(_loc2_ >= 0)
            {
               outputText("");
            }
            outputText("，又在你刚从她体内挤出后立刻被新的分泌物补上。");
         }
         outputText("[pg]你呻吟起来，裹住你肉棒的吸吮般热意");
         if(_loc2_ >= 0)
         {
            outputText("");
         }
         outputText("猛地痉挛起来，热得、紧得、销魂得让你无法忍受。有那么一瞬间，你拼命想撑住，想在释放进那甜美得令人发疼的小");
         if(_loc2_ < 0)
         {
            outputText("穴里");
         }
         else
         {
            outputText("穴里");
         }
         outputText("。");
         if(get_player().hasVagina())
         {
            outputText("你自己的[vagina]也无力地颤抖着，内壁彼此摩擦、挤压，像要从你的");
            if(get_player().wetness() >= 4)
            {
               outputText("不断喷液的");
            }
            outputText("通道里榨出每一滴淫液。");
         }
         if(get_player().lactationQ() >= 200)
         {
            outputText("乳汁从你的[nipples]中");
            if(get_player().lactationQ() < 200)
            {
               outputText("渗出");
            }
            else if(get_player().lactationQ() < 1000)
            {
               outputText("滴落");
            }
            else
            {
               outputText("喷涌而出");
            }
            outputText("，带着一份新鲜的乳白献礼溅上王座。要不是你正忘我地往她的小穴里猛顶，你或许还会去想她是否认可你的供奉；但此刻每一根神经都在把你的身体推向一场令人失神的高潮。");
         }
         outputText("你闷哼一声，紧缩的[balls]里那股热意穿过胯间，向[eachCock]扩散。");
         outputText("[pg]");
         if(get_player().cockTotal() > 2 || get_player().cockTotal() == 2 && _loc2_ < 0)
         {
            outputText("白色精液从你不再受缚的肉棒中成股射出，落在她的长袍上");
            if(get_player().cockTotal() > 3 || get_player().cockTotal() == 3 && _loc2_ < 0)
            {
               outputText("们");
            }
            outputText("。一缕接一缕，黏稠的白浊与滴落的乳汁交融在一起，织成一片雪白的淫液帷幕。");
         }
         if(get_player().cumQ() < 250)
         {
            outputText("你在一波又一波的抽送中释放激情，径直射进沙之母小穴最深处。她湿滑的肉壁一次次挤压着你，把你拉得更深，温柔摩挲着你，诱使你的高潮赐予她更多精液。随着你继续喷射，你意识到她那饥渴的肉穴");
            if(_loc2_ >= 0)
            {
               outputText("们都");
            }
            else
            {
               outputText("确实");
            }
            outputText("在某种程度上得逞了，因为你喷射到几乎发疼，最后以");
            if(_loc2_ < 0)
            {
               outputText("从你顶端挤出的一大滴浓白精液");
            }
            else
            {
               outputText("从你几个顶端挤出的一颗颗浓白精液");
            }
            outputText("。");
         }
         else if(get_player().cumQ() < 1000)
         {
            outputText("你将欲火化作大股喷涌的浓稠精液。每一道精液都滑入沙之母小穴最深处，用黏稠的精浆浇遍她敏感的甬道和柔软的宫颈。她被精液镀满的肉壁仍不断夹紧你，催促你献给她更多充满雄性的浓汁，而你也毫不费力地满足了她的索求。随着身体承受这场反常漫长的高潮，你的眼睛半翻上去，直到被榨得空空如也、干涸无物之前都不愿停止射精。黏液正从她湿漉漉、被狠狠干过的穴唇间漏出，凝成一团团肥厚的白浊。");
         }
         else
         {
            outputText("你将欲火化作喷泉般爆发的精液，第一股就已足够把沙之母小穴最深处都覆上一层白浊。第二次爆射的压力更是将你的浓精冲过她的宫颈，深入子宫，又从她颤抖的穴唇间倒流出来，化作滴滴答答的精液。她的私处用力裹紧你，像是在催促你把她填得更满；那些收缩的肉壁把你拉进她体内更深处，以至于你接下来射出的精液");
            if(_loc2_ >= 0)
            {
               outputText("都");
            }
            else
            {
               outputText("就");
            }
            outputText("径直灌进她的子宫");
            if(_loc2_ >= 0)
            {
               outputText("");
            }
            outputText("，把她的肚子撑得像怀孕了一样。她被精液灌到超过承受极限，呻吟不止，直到被塞满的子宫里压力");
            if(_loc2_ >= 0)
            {
               outputText("不断升高");
            }
            else
            {
               outputText("不断升高");
            }
            outputText("，高到一股股白浆从你周围喷溅而出，她才稍稍得到缓解。但这并没有让你停下——你继续把更多浓稠的精液强行灌进她体内，直到她语无伦次、胡言乱语，而你也彻底射空。");
         }
         outputText("[pg]从她体内抽离时，强烈的快感几乎让你的[legs]当场发软，伴随着湿滑的“啵——”声冲上顶点。你踉跄后退，喘着气欣赏眼前这被灌满的战利品。沙之母气喘吁吁，浑身乳白一片，正瘫在一摊自己的精液里。过了片刻，她不再抚弄自己、发出呻吟，而是渐渐放下被弄脏的袍摆，脸上浮现出满足而幸福的神情。");
         outputText("[pg][say: 谢谢你，勇士。也许将来某个时候，你不介意再帮我一次……]");
         var _loc3_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc3_,851,FlagDict_Impl_.arrayReadInt(_loc3_,851) + 1);
         get_player().orgasm("Generic");
         doNext(playerMenu);
      }
      
      public function friendlyCumWitchBlessing() : void
      {
         var virility1:Boolean;
         var _g1:DesertCave;
         var virility:Boolean;
         var _g:DesertCave;
         clearOutput();
         outputText("你询问精液女巫，既然她对性魔法和生育力如此亲和，能不能用魔法赐给你某种祝福。");
         if(get_player().cor < 33)
         {
            outputText("你脸上一红，");
         }
         else if(get_player().cor < 66)
         {
            outputText("紧张地，");
         }
         else
         {
            outputText("大胆地，");
         }
         outputText("脱下护甲，心想不管她要赐予怎样的祝福，多少都会带点情色意味。");
         outputText("[pg][say: 哎呀，你还真是迫不及待呢，对吧？] 这位肤色黝黑的女术士绕着你踱步，同时摘下帽子，性感地甩了甩近乎铂白的长发，让它们从束缚中散开。[say: 嗯，我确实可以赐你祝福，但你必须真心想要才行。我的“魔杖”得先充满能量，才能把它的力量赐给你。] 她褪下长袍，露出那根修长的乌黑阳具，顶端已经渗出前液。看起来它似乎不需要多少挑逗就能“祝福”你，不过也许这女人无休止的性征服，早已给了她超出你预料的耐力。");
         if(get_player().isGenderless())
         {
            outputText("[pg]精液女巫说道：[say: 哦，你没有性别。为什么不先弄点性器官，再回来享受真正的乐趣呢？]");
            doNext(runFunc);
         }
         else
         {
            if(get_player().isMale())
            {
               outputText("[pg]精液女巫说道：[say: 既然你态度这么好，我可以祝福你，让你的射精量和雄性活力都得到增强。你要做的，只是帮我把我的一点东西释放到你身上……]");
            }
            else if(get_player().isFemale())
            {
               outputText("[pg]精液女巫说道，[say: 既然你这么配合，我可以赐予你超凡的生育力。只要一点种子进入你体内，你就会怀着孩子鼓胀起来。听起来不错吧？]");
            }
            else if(get_player().isHerm())
            {
               outputText("[pg]精液女巫说道，[say: 哦哦，原来是同为双性人的同伴。告诉我，你更想让我赐给你无穷无尽的雄性精力，还是发情荡妇般的生育力？我只能给你其中一种。]");
            }
            menu();
            if(get_player().hasPerk(PerkLib.MagicalVirility))
            {
               addButtonDisabled(0,"雄性","你已经拥有这项祝福了。");
            }
            else if(get_player().hasCock())
            {
               _g = this;
               virility = true;
               addButton(0,"雄性",function():void
               {
                  _g.cumWitchBlessed(virility);
               }).hint("接受雄性祝福。这会提高你的精液产量和雄性评分。");
            }
            else
            {
               addButtonDisabled(0,"雄性","该场景要求你拥有阴茎。");
            }
            if(get_player().hasPerk(PerkLib.MagicalFertility))
            {
               addButtonDisabled(1,"生育力","你已经拥有这项祝福了。");
            }
            else if(get_player().hasVagina())
            {
               _g1 = this;
               virility1 = false;
               addButton(1,"生育力",function():void
               {
                  _g1.cumWitchBlessed(virility1);
               }).hint("接受生育祝福。这会提高你的怀孕速度和生育力评分。");
            }
            else
            {
               addButtonDisabled(1,"生育力","该场景要求你拥有小穴。");
            }
            setExitButton("算了",changeMindAboutBlessings).hint("算了！别再谈这个话题了。想的话你以后还能再回来。");
         }
      }
      
      public function freeSlaves() : void
      {
         clearOutput();
         outputText("想起你在女巫集会这里见到的那个可怜浴室女孩——她神志崩坏，胸大得像个怪物——你告诉沙之母，是时候释放她，还有她藏起来的其他所有奴隶了。");
         outputText("[pg]沙之母冲你挑起一边眉毛，坐在王座上颇为傲慢地嗤笑了一声。[say:你或许打败了我的守卫，但你凭什么觉得自己能这样命令我，外来者？奴隶对集会的运转至关重要；我们不能就这么</i>释放<i>她们。]");
         if(get_player().get_inte() <= 20)
         {
            outputText("[pg]你刚想回应，却又停了下来，不得不思考片刻。你花了好一会儿认真琢磨，最后耸了耸肩。你确信一定有个有力的理由能反驳她，可眼下就是想不出来。");
            doNext(playerMenu);
            return;
         }
         get_dungeons().set_playerLoc(9);
         get_dungeons().remakeMaps();
         outputText("[pg]你摇了摇头。女巫们声称自己反对恶魔，可她们又在做什么？她们袭击不肯屈服的旅人，奴役反抗者，玛莱知道她们还干了些什么。这绝不能容忍。如果沙之母是个奴隶主，把那个可怜的乳奴女孩当成牲畜一样养着，那她和恶魔也没什么两样。");
         outputText("[pg]沙之母皱起眉头，从王座上站了起来。[say:跟我来，]她说着，带你离开房间，穿过她地下避难所里的重重走廊。最后，她把你带到了浴室。那个巨乳女孩蜷缩在角落里，正浅浅打着盹，直到年长的女巫清了清嗓子。女孩立刻醒来，温顺地爬了过来，双手托着自己硕大的乳房，呜咽般说道：[say:到沐浴时间了吗，女主人？]");
         outputText("[pg][say:不，女孩，]女巫说道，让那名女奴露出困惑的神情。[say:不如你亲口告诉你这位朋友，你有多想获得自由吧，女孩。用话说出来。]");
         outputText("[pg][say:女、女主人？]女奴歪着头说道。[say:我……]她呜咽着，显然在努力组织几个简单的词，最后却还是放弃了，只重复起她那满是乳香的口头禅：[say:沐浴时间？]");
         outputText("[pg]沙之母摇了摇头，转身看向你。[say:她脑子已经不清醒了，[name]。就算我放她走，她也只会被恶魔，或者某个游荡的变态抓去。天知道这两种东西都多得很。把她放进荒野，比把她关在这里更残忍；至少在这里她有人照料，而且也有用处。她在我们之中承担着职责，亲爱的[name]，因此她受到尊重，也会被好好照看。她的一切需求都能得到满足，什么也不缺。你真的能凭良心要求我释放她，让她注定遭受强奸、折磨和腐化吗？]");
         menu();
         addButton(0,"是",yesDemandMilkRelease);
         addButton(1,"否",noDemandMilkRelease);
         addButton(2,"将她给我",gimmeDatDeliciousMilkWaifuINeedMoreWaifusCauseTheTwoCowslutsWerentEnoughForMyInsatiableLacticLustandDesire).hint("问问沙之母是否愿意把那名乳奴交给你。");
      }
      
      public function forceDildos() : void
      {
         clearOutput();
         outputText("你开始脱下[armor]，可萨努拉一根手指轻轻一转，便让你转身面向石柱撑好自己。半猫般的她无声而优雅地贴近你，游移的双手开始探索你的身体，纤细的手指沿着你[butt]与[hips]柔软的曲线描摹，随后又以缓慢挑逗的动作朝你的[chest]移动。她每一次轻微的动作都让你的脊背窜起一阵战栗。当她的手指拂过你的[nipples]时，你的呼吸一滞，她轻轻捏住它们");
         if(get_player().lactationQ() >= 200)
         {
            outputText("，直到你母性般的乳汁缓缓流出，淌满她的双手。斯芬克斯少女发出少女般的轻笑，把头钻到你的胳膊下，舔舐你流着乳汁的乳头。她喉中逸出一声低沉的呼噜，直到你轻轻推了她一下，让她回到正事上来");
         }
         outputText("。");
         outputText("[pg]斯芬克斯滑跪到地上，俯下身，让自己的脸与你的[butt]齐平。你从肩后回头看去，只见这名狮身少女的唇边浮现出欲望满满的笑容。她抚摸着你的臀瓣，慢慢将它们分开，好让自己仔细欣赏你那等待着的[vagOrAss]。你又弯下身子，把屁股送到萨努拉脸前，带着邀请意味轻轻摇晃。她拍了拍你的[butt]，直视着你的眼睛，用舌头沿着你颤抖的穴口缓慢而绵长地舔过，激起一股快感在你体内奔涌。你的[legs]颤抖起来，而你的情人又用一次漫长而感官的舔舐尽情宠爱着你。她猫科般的舌头拂过你的[vagOrAss]，让那里用力收缩，仿佛在渴求一根肉棒来榨干，来把它撑得满满当当，再灌入温热起沫的精液。");
         outputText("[pg]然而，斯芬克斯少女只是又一次舔舐着挑逗你，一次接着一次；与此同时，你能看见她的手指正做出奥术般的手势，指尖划过之处编织出细细的蓝色魔法线条，法术逐渐成形。很快，一根手腕粗细、由半透明蓝光构成的长柱在她双手之间凝聚而出，顶端的冠状形状让它毫无疑问地像一根阳具。她最后一次舔过你敏感的肉体，然后将你的臀瓣尽可能分开，让你被唾液润湿的穴口尝到干燥的沙漠空气。片刻之后，你感觉到那根幽灵般的假阳具顶端抵住了你的[vagOrAss]入口，构成它的魔法能量如电流般窜过你的全身；甚至还没真正插入，你赤裸身体上的每一根汗毛就都竖了起来，快感像火焰一样在你体内燃烧。");
         outputText("[pg]当顶端真的滑入时，你几乎当场高潮。");
         if(get_player().hasVagina())
         {
            get_player().cuntChange(10,true,true,false);
         }
         else
         {
            get_player().buttChange(10,true,true,false);
         }
         outputText("[pg]那根奥术伪阳具每压过你敏感内壁的一寸，都像在快感的烈焰中爆开，电流般刺激着你的每一根神经。萨努拉缓缓将她召唤出的假阳具沉入你的[vagOrAss]。你咬紧牙关，试图承受从被操弄的穴中扩散开来的高潮过载，可那股魔法冲击波很快便蔓延到你的全身。半狮般的她将那根长柱越来越深地插入你体内，你的[legs]不断发颤；一寸又一寸让人头脑发麻的刺激，将你最深处都撑开碾过。可突然间，她的推进停了下来，只留下你被一根轻轻震动的奥术快感之柱贯穿。就在你被性欲搅乱的脑子开始疑惑为何不再动作时，你忽然感觉到一股强烈到压倒一切的力量，在已经埋入你体内的肉棒之上，又抵住了你的[vagOrAss]，试图把你的穴撑得更宽。第二根虚幻的肉棒甚至比第一根还要大，缓缓地顶进、挤入你那被折腾过的穴中，强行将你撑开，直到你在快感与疼痛中尖叫。终于，那根巨大的肉棒一下挤了进去，宽慰感随即传遍全身，萨努拉开始温柔地将它推进，一边轻声呢喃，一边再次贯穿你。");
         if(get_player().hasVagina())
         {
            outputText("[pg]你颤抖的小穴试图适应那两根撕扯着它的巨大入侵物时，这名撩人的斯芬克斯又召唤出了第三根长柱，和上一根一样巨大。你咬紧牙关，准备承受她把那东西也塞进你裂缝里的尝试；可你感觉到的却只是抵在你[ass]上的一阵温柔试探的湿意。萨努拉的舌头沿着你的后门拖过，舌尖压入，寻找入口，你从身体深处打了个寒战。尽管你的小穴里翻涌着静电般的快感，你还是尽力放松括约肌；终于，在漫长的试探之后，你感觉到那根魔法假阳具的第一寸刺入了你的[asshole]，而萨努拉则将它的大小塑造成足以彻底填满你后穴入口的程度，把你撑到极限，甚至超越极限。");
            get_player().buttChange(10,true,true,false);
         }
         else
         {
            outputText("[pg]两件奥术器具撕扯着你的肛门时，你几乎没有注意到第三根召唤出的长柱顶端也开始压入你的穴口，急切地想要加入它的同伴。突然，你感觉到已经卡在体内的两根长柱移动起来，向旁边让开位置，容纳第三根魔法阳具——它和萨努拉刚刚塞满你的前两根一样巨大。你可怜而被折腾过的屁眼被撑到远超你想象中能承受的程度，三根巨大的肉棒深深滑入你的肠道，你的整个身体都随之抽搐。你的肌肉围绕着那些发麻的长柱痉挛，内壁用力收缩，仿佛要从这些东西里榨出它们所谓的精液。");
         }
         outputText("[pg]三根由纯粹能量构成的巨大假阳具在你体内抽插，你根本不觉得自己能撑多久。你把手指抠进沙漠方尖碑坚硬而毫不退让的石面里，呻吟着承受萨努拉以无情的节奏让她的假阳具在你体内进出；构成它们的奇异魔法，让你敏感的深处被不可名状的快感电流般贯穿。当你高潮时，那感觉猛烈至极——尖叫从你唇间撕裂而出，在沙丘之间回荡。");
         outputText("[pg]高潮袭来时，你感觉到——有什么东西——射进了你体内，一股滚烫液体的洪流点燃了你的下腹，并带着高潮般的快感在你体内扩散。你剧烈地颤抖着，倒灌而出的魔法精液又从你的[vagOrAss]喷涌出来，溅到萨努拉早已等候着的脸上；你的肚子鼓胀得如同怀孕一般，直到这场高潮终于平息。");
         outputText("[pg]那些假阳具在你体内消散得无影无踪，你也随之瘫倒下来，只觉得从最深处都被掏空了。[say:玩得开心吗？]那名满身精液的狮身少女问道，跪到你身旁，一只手搭在你剧烈起伏的胸口上。你虚弱地朝她竖起大拇指，然后踉跄着站起身，回到你的[feet]上。");
         get_player().orgasm("VaginalAnal");
         menu();
         addButton(0,"进入",openZeDoorToParadize);
         addButton(14,"离开",exitDungeon);
      }
      
      public function forceCunnilingusRimjobClitAndNipple() : void
      {
         clearOutput();
         outputText("你打量着这群败下阵来的人");
         if(get_player().get_HP() < 1)
         {
            outputText("，视线穿过她们破烂的长袍，注意到许多又大又湿的乳房，以及不止几对柔软的小穴唇");
         }
         else
         {
            outputText("透过她们扭动着、纵欲般的动作，你注意到她们许多硕大滴液的乳房，以及不断喷涌的多重小穴");
         }
         outputText("。她们或许");
         if(get_player().cor < 33)
         {
            outputText("是误入歧途才与你为敌");
         }
         else if(get_player().cor < 66)
         {
            outputText("只是有点过分热衷于守护家园");
         }
         else
         {
            outputText("战斗水平烂得可以");
         }
         outputText("，但感受到下身一阵骚动，你至少能想到她们还有一个好用处。你开始脱下你的[armor]，一只手揉捏着自己的屁股；也许她们还能派上第二个用场……");
         outputText("[pg]在你把那些乳[if (silly) {b|w}]itches叫过来后，战败的女人们沮丧地应了过来，不过当她们看见你赤裸的身体时，不止一道目光里都暗藏着欲火。你");
         if(get_player().hasTailInsteadOfLegs())
         {
            outputText("蜿蜒爬行");
         }
         else if(get_player().isTaur())
         {
            outputText("踏着蹄声");
         }
         else if(get_player().isGoo())
         {
            outputText("黏滑地蠕动");
         }
         else if(get_player().isDrider())
         {
            outputText("咔嗒作响地");
         }
         else
         {
            outputText("大步走");
         }
         outputText("到最近的一人面前，一把抓住她琥珀色的长发，将她的脸拽向你的[vagina]，她的鼻子被挤得半陷进你的缝隙里，而你则在她漂亮年轻的嘴上摩擦。啊，就是这个感觉。她的舌头几乎立刻探出来，舔舐你的湿润。要不是她眉眼间还带着怒意，你简直会发誓她绝对喜欢死了。无所谓。");
         outputText("[pg]你像戏剧导演一样，开始指挥其余的女孩。首先，你要让这个婊子像个合格的女同奴隶一样好好享受，于是你命令她的两个姐妹去舔她的小穴。她们看起来有些不情愿，但还是照样埋进了那湿润的小穴里。哦，天啊，效果简直天差地别。那名褐肤女术士的眼睛慢慢闭上，在姐妹们舔舐的安抚下渐渐放松。她的舌头大胆地抚过你的肉缝，殷勤地满足你的需求，撩得你的身体分泌出更多黏稠淫液，而她也津津有味地享用着这份奖赏。等她进入节奏后，你拍了拍她的头，努力把注意力放在保持站稳上。");
         outputText("[pg]剩下的还有不少，于是你如法炮制，把她们铺展开来——每个女巫的胯下都配上两张嘴，形成一座不断扩大的舔穴极乐金字塔。你把其中最饥渴的几个留到最后；她们已经兴奋到一边吞舔小穴，一边用手指猛弄自己发胀的小穴，根本不需要额外刺激。两个人会让这座以小穴为中心的金字塔显得不太平衡，于是你把她们叫回自己身边。");
         outputText("[pg]今天最矮的那个要负责最羞辱的差事。你把双手放在自己的[butt]上，掰开臀瓣，命令她舔那里。");
         outputText("[pg]女巫浑身一颤，哀求般问道：[say:我一定要吗？]你坚定地给出了肯定回答。");
         outputText("[pg]那名褐肤产奶器跪倒在地，慢慢把舌头伸向你的[asshole]。她的四只乳房挤在你的[legs]后侧，而你因期待而微微发颤。接触到了。你差点腿软倒下，只好靠在前面舔你小穴的人身上支撑自己；当她温热的舌头滑过你的肛口、挑逗你的神经时，你愉悦地呻吟起来。没错，就是这样……在两个洞都被她们精妙地舔舐时，你缓缓前后摆动着[hips]。你下身的热意越烧越旺，而你很清楚该用什么来冷却这团咆哮的阴道之火。");
         outputText("[pg]你一把抓住两人中较高的那个，将她拉向你的[clit]，纵情追逐着体内那股仿佛永远无法满足的欲望。");
         if(get_player().getClitLength() < 3)
         {
            outputText("她熟练地一下就把它吸进嘴里。她的舌头在你那女性器官敏感到不可思议的表面上舞动，淫靡的舔舐中带着非同寻常的技巧。如果这是她第一次做这种事，你才会感到惊讶。她在你身上贪婪地流着口水，甚至把唾液都弄出了泡沫；当她的嘴唇碰上那些正贴在你小穴上的姐妹们时，你不禁笑了起来。她们愉快地吸吮了一下，发出含混的呻吟，一半贴在你的[vagina]上，一半贴在对方嘴上，随后又回到各自的任务中。愉悦的低哼震颤着你最柔嫩的部位，而你意识到，自己马上就要把高潮全都喷洒在这些异域女人身上了。");
         }
         else if(get_player().getClitLength() < 12)
         {
            outputText("她从容地一口含了上来，尽管它又粗又大，足以让大多数男人的鸡巴都相形见绌。她在你这根不那么女性化的女性器官表面淫靡地舔吮流涎，显然曾跟某个不太像女人的对象练习过；但你怀疑这些女人里没谁能给她这种训练。她一路含到你的蜜穴处，让自己的嘴唇碰上那个埋在你小穴里的姐妹的唇，两人一边与你的身体纠缠，一边温柔地接了个吻。愉悦的轻哼一路震过你肿胀的女肉棒，让你意识到自己就要把这些异域女人射得满身都是了。");
         }
         else
         {
            outputText("她尽可能俯身吞了上来，尽管那是一颗巨大而悸动的肉珠，大到足以让大多数男人看一眼都自惭形秽。她淫荡地在你的“冠头”上舔吮流涎的模样，说明她对舔鸡巴并不陌生；但你很确定，她不可能是跟这些荡妇练出这套本事的。无论如何，她还是扑向你敏感的阴蒂肉棒，把那团庞大的神经束尽可能多地含进口中。她的脑袋沿着它温柔地上下套弄，手掌则飞快撸动，快得让她滴落的口水都泛起泡沫。你恍惚间意识到，自己就要射得她和她的姐妹满身都是了。");
         }
         outputText("[pg]一阵仿佛雷鸣般、让小穴紧缩的快感从头到[feet]炸穿你的全身，逼得你的[hips]像打桩机一样撞向其中一个女巫的脸。你[butt]边的女孩依旧坚定地贴在你的[asshole]上，而你也随之高潮");
         if(get_player().wetness() >= 4)
         {
            outputText(", 把带着麝香气息的淫液喷洒在你胯间那些漂亮脸蛋上，一路淋湿到她们第一排乳房。你的汁水与她们乳头滴落的奶水混在一起，变成黏稠的乳白美味，让你舔了舔嘴唇，愉悦得浑身发颤。趴在你[vagina]上的诱人女子咕噜作响、轻声叹息，努力想跟上你汹涌的雌性精液，可你喷得如此猛烈，她似乎注定要失败。");
         }
         else if(get_player().wetness() >= 2)
         {
            outputText(", 分泌物顺着那个准小穴奴隶的嘴唇倾泻而下，逼得她不断吞咽，试图跟上你的量。你湿得要命，而你的甬道又在她舌头周围收缩起伏，只会把更多汁液挤出来。");
         }
         else
         {
            outputText(", 滑腻的雌性精液直接滴进那个准小穴奴隶嘴里，逼得她吞下你那股带酸的味道。她的舌头在你痉挛的小穴里卖力搅弄，让你很难不变成一滩湿淋淋的烂泥，不过你们俩似乎都不介意。");
         }
         if(get_player().hasCock())
         {
            outputText("在上方，[eachCock]射出一道道真正雄性的浓精，落在女孩们裸露的背上，把她们好好标记下来。");
            if(get_player().cumQ() >= 500)
            {
               outputText("它把她们古铜色的肌肤染成稀糊般的白色，随后又化作粗厚的丝线垂落到地上");
               if(get_player().cumQ() >= 1500)
               {
                  outputText(", 每一股都开始汇成一摊");
               }
               if(get_player().cumQ() >= 2500)
               {
                  outputText("。那些液洼汇聚在一起，在这些淫荡奴隶的身体下形成一片精液之湖，连她们合起来的奶水丰沛的乳房都相形见绌");
               }
               outputText("。");
            }
         }
         outputText("[pg]你仰面瘫倒在地，把最近的几具古铜色身体也一起拉了下来。这引发了一连串多米诺骨牌般的女巫倒塌，所有人都摔了下去，因为她们原本正贴着的湿润蜜壶被粗暴地抽走了。嘴唇寻上你的[nipples]，你任由她们");
         if(get_player().lactationQ() >= 200)
         {
            outputText("尽情饮用");
         }
         if(get_player().lactationQ() >= 1000)
         {
            outputText(", 至少在她们能承受你产奶量的范围内，");
         }
         else if(get_player().lactationQ() < 200)
         {
            outputText("慢慢吮吸你");
         }
         outputText("，而你也从高潮的余韵中缓缓平复下来。她们为什么一开始不直接这么做呢？");
         outputText("[pg]在这番士气提振之后，你从翻滚扭动的雌性肉体乱交堆里爬出来，拍掉身上的尘土，准备继续深入探索这处罪恶巢穴。");
         get_player().orgasm("Generic");
         dynStats(DynStat.Sens(-1));
         get_combat().cleanupAfterCombat();
         spriteSelect(SpriteDb.get_s_witchmob());
         fuckedWitches = true;
      }
      
      public function finishMilkBath() : void
      {
         clearOutput();
         outputText("你在浴桶里坐了一会儿，任由芬芳的液体浸润你的[skinfurscales]。不过你还有事要做，最终，你也厌倦了在沙漠女巫无尽的白色馈赠中放松。你拔掉浴桶的塞子，爬了出来，在墙上找到一条毛巾。谢天谢地，牛奶似乎没有留下任何残留物，你感觉干净又神清气爽，只是有点欲火难耐。");
         dynStats(DynStat.Lust(10));
         get_player().changeFatigue(-50);
         doNext(playerMenu);
      }
      
      public function fightTheSandWitch() : void
      {
         clearOutput();
         outputText("你挥起你的[weapon]，带着威胁的气势向前逼近。沙漠女巫女王缓缓站起，从长袍下抽出一柄权杖，眼中带着坚定的神色。[say: 你会为这个举动后悔一阵子的，直到我们纠正你那病态的思维方式。现在，尝尝沙之母的力量吧！]");
         startCombat(new SandMother(),true);
      }
      
      public function fightCumWitch() : void
      {
         spriteSelect(SpriteDb.get_s_cumWitch());
         clearOutput();
         outputText("一个披着长袍的女巫翻过沙丘顶端，在无情的沙漠烈日下，她乌黑的肌肤泛着湿润的光泽。她发现了你，暗色的嘴唇扬起一抹笑意，一根白色法杖在她手中显现出来。她带着玩笑的口吻喊道：[say: 我要对你施个咒……]");
         startCombat(new CumWitch());
      }
      
      public function fenPutsHisShittyFetishInYoSphinx() : void
      {
         clearOutput();
         outputText("你开始脱去衣物，");
         if(get_player().hasCock())
         {
            outputText("把你的[cocks]甩在干燥的沙漠热气中，让");
            if(get_player().cockTotal() == 1)
            {
               outputText("它");
            }
            else
            {
               outputText("它们");
            }
            outputText("来回摇晃");
         }
         else if(get_player().hasVagina())
         {
            outputText("你把自己的[vagina]暴露在灼热的沙漠空气中，任由它变得湿润");
         }
         else
         {
            outputText("你把自己的[butt]暴露出来，任由它泛起红晕");
         }
         outputText("无处不在的热意和诱人的斯芬克斯一起撩拨着你高涨的性欲。你的[armor]落到地上，发出沉重的闷响；萨努拉则啪地一下把手掌举到你面前。");
         outputText("[pg][say: 你不用勾引我，知道吗？直接摆好姿势就行，]她命令道，双翼扇动着灼热干燥的空气，拂过她的胸口，给那对诱人的小麦色乳丘送去阵阵热风。");
         outputText("[pg]呃，姿势？你不太确定自己有没有听懂，于是老实说了出来。");
         outputText("[pg]萨努拉双臂抱在挺翘的乳房前，翻了个白眼。[say: 你知道的，弯下腰，趴在地上，屁股翘起来、张开？]她恼火地叹了口气，吹开一缕垂到脸前的黑发。[say: 你到底来玛瑞斯多久了？算了，别管了，把屁股翘起来，让我好好犁一犁。]");
         outputText("[pg]你忍不住指出一个显而易见的问题：她没有阴茎，至少你看不到。");
         outputText("[pg][say: 那又怎样？]");
         outputText("[pg]呃，没有那东西的话，她其实没法干你的[asshole]……");
         outputText("[pg]萨努拉笑了起来，[say: 我可是斯芬克斯。现实不过是我的玩物！来吧……]她沉重的前爪落在你的肩上，柔软的猫科肉垫像枕头一样压在你的[skinfurscales]上，迫使你俯下身去。你不情不愿地弯下腰，把[butt]朝这位强势的雌狮抬起；这种完全敞开、暴露无遗的姿势让你一阵发颤，你的[asshole]紧缩着，已经准备好被她犁开。她另一只爪子也压上你的右肩，肌肉结实的狮形下半身投下阴影，将你笼罩其中，温热的体温随之扑面而来。萨努拉柔软的腹毛擦过你的后背，带来撩人的痒意，而她也摆好了姿势。她的趾头勾过你的双肩，伸出看上去致命的利爪，但它们只是抵在你胸口上方，用柔软的肉垫和尖锐的威胁把你牢牢固定在原地。");
         outputText("[pg]你把头偏向一侧，试着抬眼往上看，可越过她蓬松的腹毛，你只能看到她挺翘的乳沟隆起，以及几个围绕着她手腕旋转、转瞬即逝的六边形光影；她的手指以非人的灵巧飞快转动。几乎听不见的一声“噗”响过后，一阵刺麻感贴上你的[asshole]，那魔法般的气泡感猛地钻进你的括约肌里，某个扁平而钝圆的东西顶在了那里。后门上传来的压力让你惊讶地睁大了眼，而萨努拉显然很享受你的反应，她俯下人形上半身欣赏你的表情，同时用前爪把你更用力地推向她的魔法长矛。");
         if(get_player().analCapacity() >= 100)
         {
            outputText("[pg]你强迫自己放松下来，仿佛受了魔法影响一般，你的[asshole]轻易地扩张开来，承受住那根巨象般的力场肉棒，将那根扁平而外扩的阴茎径直吞进直肠。它越顶越深，让你的腹部微微鼓起；当中段凸环卡住一瞬又猛地挤进去时，萨努拉低哼一声，沉醉于你那热情迎纳的屁眼所能带来的快感。她懒洋洋地对你一笑，随后挺直身体，把手放在你头上，抚摸你的[hair]，又漫不经心地轻拍着你。她终于完全插到底，伴随着火花般刺麻的睾丸重重拍打在你[butt]上的感觉。");
            outputText("[pg][say: 嗯……我就知道你会是个乖[boy]。]");
         }
         else if(get_player().analCapacity() >= 40)
         {
            outputText("[pg]你强迫自己放松，可即便如此，在萨努拉那根外扩的力场肉棒真正挤进去之前，你的[asshole]就已经被撑到了极限。你因不适而呜咽，试着承受她强行肛交的尝试。可她显然没有停下来的打算，那根粗大的、能把屁股干坏的马一样的肉棒一次又一次撞向你，每一次都把你的屁眼撑得更开，将你括约肌的防线一点点砸垮，碾成一个软弱、只能接受的肛门。你能感觉到它在压力下逐渐屈服。萨努拉低吼一声，把那根东西抵在那里，以蛮横而执拗的力道不断下压，直到你的入口一下子让了步；她那根肉棒残暴而鼓胀的顶端噗地挤进你的直肠。她并没有就此停下。一寸又一寸刺麻的幻影肉棒径直顶进你紧绷的直肠里，只有在肿胀的中段凸环卡住半秒时，才短暂停顿了一下。");
            outputText("[pg]她完全顶到底时，带着电流般刺麻感、足有大甜瓜大小的睾丸啪地撞在你的[butt]上。[say: 嗯……我就知道你会是个乖[boy]。]萨努拉咕噜般低哼着，拍了拍你的头。");
         }
         else
         {
            outputText("[pg]你强迫自己放松，可你后面那里实在不够大，根本起不了多大作用。光是这么一根巨大的肉棒抵在你的后门，就足以把你逼到极限，而你的括约肌甚至还没张开到能容纳她半点粗度的程度。萨努拉挫败地低吼一声，开始朝那里顶弄，用钝圆的顶端一次又一次拍打你的入口。那种冲击般的感觉让你的肛门肌肉抽动、痉挛，又渐渐放松；她则努力突破你那多少还算有点的抵抗，把自己硬生生犁进去。");
            if(get_player().ass.analLooseness == 0)
            {
               outputText("[pg]她哼了一声，[say: 别告诉我你还是处吧？]你点点头，咬住嘴唇，努力忍耐。听到这个消息，萨努拉立刻停了下来，神情淡漠地思索片刻，脸上慢慢浮现出笑容。[say: 真的？]她问道，臀部又开始缓缓抵弄你的屁股，逐渐恢复到先前的节奏。[say: 那你能骑的是我的魔法肉棒，而不是什么粗暴家伙的东西，还真是件好事。可能会有点疼，但我保证，这会是一场让你永远忘不了的肛交……]");
            }
            else
            {
               outputText("[pg]她哼了一声，[say:众神啊，你紧得简直像处男小恶魔的屁眼！]");
            }
         }
         outputText("[pg]这对你可怜又酸痛的直肠来说可算不上什么安慰。用不了多久，它就会被这个怪物般的女人撑得大开，被一下一下捣到张开、拉伸、屈服，就像它的主人一样。被这样强行撑开的疼痛让你眼角泛泪，也让你的胯间涌起一阵奇异的兴奋。你怎么会享受这种事？你根本没有时间细想，在萨努拉这番摧残臀部的抽插下，你的肌肉正一点点崩溃，缓慢却不可阻挡地被撑开，去容纳她粗大的膨胀前端。众神啊！你呜咽起来，你的[asshole]突然彻底放弃抵抗，让萨努拉的幻影阳具探入其中；短短几秒内，她那带着酥麻感的交合工具就有好几英寸埋进了你体内。");
         get_player().buttChange(75,true,true,false);
         outputText("[pg]萨努拉挺直身子，带着你看不见的笑意，手指调皮地缠弄着你的[hair]，同时把剩下的长度一路顶进你饱受折磨的肛门，直到那对晃动的魔法睾丸拍上你的[butt]才停下。[say:好样的，[boy]。有那么一瞬间，我还以为这次魔法白费了呢。现在就放松下来，好好享受吧。]你一想到自己不知为何确实在享受，便忍不住皱起脸来。随着屁眼里魔法般的嗡鸣感，疼痛似乎已经褪去，剩下的只有被撑满的满足感，以及随之而来的摩擦。");
         outputText("[pg]萨努拉有些不情愿地换了方向，开始把那根巨大长物从你体内拔出。她居然往后抽得那么远，连顶端都从你被撑开的孔口里滑了出来，淫靡地拍在一条[leg]上，然后她又重新对准，准备第二次推进。当这位斯芬克斯把她那树干般的图腾再次抵进你体内时，你试图想象这东西究竟有多大。看它把你内脏撑得变形的样子，它肯定有好几英尺长，至少四英寸宽，顶端也许有五英寸。你呻吟着，无力地把自己交给她那虚幻勃起物在你被塞满的皱口里带来的异样感受。");
         outputText("[pg][say:对嘛，我就知道你会喜欢，]萨努拉拖着腔调说道，[say:我第一次见你时，就觉得你是某种屁眼荡货。]她猛地向前顶胯，把剩下的部分全都埋进你体内。[say:现在嘛，我是真的把你钉住了。]她坏笑着，重新开始漫长而缓慢地抽弄你的肠道。");
         if(get_player().cockTotal() > 0)
         {
            outputText("[eachCock]不断渗出前列腺液，拉成一缕缕稳定的细丝垂落到泥地上；当你的前列腺被挤压得足够用力时，你那带着咸味的“乳汁”便被榨出一丝丝，在你身下绘出旋涡般的痕迹。");
         }
         outputText("[pg]萨努拉现在动得更快，陷入了性爱的狂热。她像被什么附身的野兽一样抽插你的屁眼，而考虑到她那根马一样的肉棒本就是幻影性质，你不禁怀疑事情是不是正是如此。这位狮身美人用又长又沉的抽送凶狠地捣弄你的[asshole]，所过之处只留下酥麻的兴奋感。");
         if(get_player().cockTotal() > 0)
         {
            outputText("每当她的膨胀前端滑过你的前列腺，那宽大而钝圆的头部都会把它挤得够狠，榨出一大缕前液。");
         }
         outputText("几次这样的挺入之后，她那对弹跳的假睾丸在仿真的肉袋里向上收紧。她肿胀的龟头在你体内胀大到超出你的想象，宽得你甚至能隔着肚皮摸到，并惊叹于它的尺寸。萨努拉从头到四只狮爪般的脚趾都在颤抖，随即射了出来。");
         outputText("[pg]那根足以把屁股撑坏的马屌向你体内释放出大量精液，多到让你的腹中发出清晰的咕噜声，肚子也开始鼓胀起来；酥麻感与液体的温热灌满你的肠道。谢天谢地，即使还在射精，萨努拉也开始慢慢拔出；她的肉棒每退出一英寸，都会在你被蹂躏的屁眼里抽动一下，沿途留下足够多的黏液，让你的内里根本得不到放松。");
         if(get_player().cockTotal() > 0)
         {
            outputText("当她越过你那已经被充分使用、肿成一团的前列腺时，你彻底失控，伴随着一次舒爽而绵长的射精浑身发颤，双臂一软，整个人脸朝下摔在地上，同时把乳白色的精液喷到自己的胸口、下巴，随后又喷到地面上。");
         }
         else
         {
            outputText("当她几乎完全拔出时，你终于屈服并射了出来，在她那根魔法播种工具周围颤抖着收缩，而它也正把最后的精液灌进你的肠子里。");
         }
         outputText("那颗龟头肿胀得厉害，她竟然得费力才能把它从你的[asshole]里拔出来，臀部向后颠了几下却没什么效果");
         if(get_player().cockTotal() > 0)
         {
            outputText("，还把你拖过你刚射出的乳白水洼");
         }
         outputText("。最后，她猛地一挺，撑开你的括约肌，从你的[butt]里弹了出来，退出来时把那里涂得一片雪白。");
         outputText("[pg]你像一摊被彻底干透的烂泥般瘫倒在地，而萨努拉额外变出的那件东西也渐渐消散。她在你身旁躺下，用翅膀给自己扇风，你则努力恢复过来。她的手臂抚过你一边臀肉，那里仍因她睾丸里的某种魔法而敏感不已。她说道：[say:真是太有趣了。下次再来一次？]");
         outputText("[pg]你勉强攒起力气竖了个大拇指，脸上还挂着傻乎乎的笑容。");
         get_player().orgasm("Anal");
         get_game().inDungeon = false;
         menu();
         addButton(0,"继续",get_camp().returnToCampUseOneHour);
      }
      
      public function femaleGirlsLoseToSammitches() : void
      {
         outputText("[pg]两个女巫分开你的[legs]，把它们牢牢按住。你正要大喊抗议，却有一个女巫把她的两个小穴压到你脸上，开始骑弄你的[face]，在你发出半点声音前就迅速堵住了你的嘴。");
         if(get_player().hasMuzzle())
         {
            outputText("她把你的口鼻当成肉棒来干，让它顶进其中一个小穴，同时玩弄着另一个。");
         }
         else
         {
            outputText("她用逐渐湿润的两个小穴在你的嘴唇上磨蹭，阴蒂则紧紧压在你的鼻子上。");
         }
         outputText("[pg]你试着挣动手臂，但又有两个女巫坐了上来，用她们的淫穴在你手臂上变态地磨蹭，将你牢牢压制。坐在你[legs]上的女巫看到姐妹们这么有创意，也有样学样，把你的[legs]分得更开，将它们变成自己的取乐玩具，让湿漉漉的小穴开始来回摇动摩擦。");
         outputText("[pg]两个女巫离开了房间，其他人则排着队，等着在这个新婊子身上占个位置。骑在你四肢上泄欲的四个女孩愉悦地呻吟着，玩弄着自己产乳的成排乳房，还把一些乳汁挤到你身上。");
         if(!get_player().hasVagina())
         {
            outputText("令人惊讶的是，随着油液在你的胯间蔓延，那里的肉裂开了，露出一个小小的、湿润的入口，以及一颗小阴蒂。");
            get_player().createVagina();
            get_player().setClitLength(0.25);
         }
         outputText("她们温热的液体流遍你的身体：淌过你的[chest]，滑下你的[hips]，又挑逗般地绕过你的[vagina]。到了这一步，你已经渴望到不行，只能揉捏自己的胸口，掐弄乳头，并抚弄你的[clit]。");
         outputText("[pg]然而这些女孩偏偏不让你得到那份快感，她们一边在你的四肢上淌得到处都是，一边发出你此刻无比渴望的欢愉呻吟。其他女巫更让你嫉妒，她们看着姐妹们行动，能用轻轻的抚摸和抓揉来满足自己的欲望。有些甚至会帮那些更淫乱的女巫一把，手指插进她们湿透的小穴，揉捏她们涨满乳汁的乳房，而那些发情的荡妇就在欲望的恍惚中紧紧攀着她们。要是你也有那么幸运就好了。");
         outputText("[pg]你的[vagina]现在饥渴得想感受任何东西的触碰，[say:她们是故意这样折磨你的，]你这样想着，而你的[vagina]正像要榨取肉棒一样阵阵紧缩。你的双眼因痛苦的欲火而迷离，看到刚才离开的两个女巫从拱门回到房间里，怀里抱着一捆捆东西。其他女巫看到那两个女孩回来，全都显得很高兴。");
         outputText("[pg][say:抱歉耽搁了这么久，那个怀孕的骚货非要玩点角色扮演，]一个沙漠女巫说道，随手放下怀里的东西，露出她全裸的身体，以及身上戴着的一根巨大龙鞭穿戴式假阳具。她放下的那捆东西里，是各式各样可装戴的情趣玩具。许多都有多根柱体，形状从标准款到犬形，再到下流至极的马形，应有尽有。");
         outputText("[pg]所有围观的女巫都走向那堆性玩具，随手把衣服扔到一旁，只剩下你和那个骚货");
         if(!get_player().hasMuzzle())
         {
            outputText("在你脸上磨蹭");
         }
         else
         {
            outputText("一边玩弄自己，一边把你的口鼻当成肉棒来干");
         }
         outputText("，以及另外四个哼叫着享受的家伙，让你自己的小穴感觉被冷落了，迫切需要有什么东西来填满它。");
         outputText("[pg]假阳具堆旁的女巫们跪了下来，每个人都用自己独特的方式挑选装备。有些只是把一根假阳具握在手里，看了看，就又扔回堆里。另一些则像对待真肉棒一样含住它来试尺寸，把那些怪物般的玩具直往喉咙深处塞。她们能吞下那么多，实在令人惊讶。最后，还有几个会骑上自己挑中的那根来试用。所有试骑的女巫都会把不止一个淫秽玩具塞进身体里，两道阴茎般的形状从里面顶起她们的肉，让她们的肚腹都变了形。这些女孩一边用小穴在玩具上猛烈坐下、撞击，一边发出你听过的最响亮的呻吟之一，高潮时喷出大股淫液，溅到她们的姐妹和其他玩具上。");
         outputText("[pg]骑在你脸上的那个沙漠女巫直接高潮，把淫液喷进你嘴里，让你浑身一颤，你的注意力也被重新拉回压在你身上的这些沙漠女巫身上。温热的液流也洒满你的手臂和[legs]。压在你身上的女巫们拼命把小穴往你身上顶，紧紧抓住你的身体，发出最后一声响亮的呻吟。她们在余韵中用沾满淫液、黏糊糊的小穴继续磨蹭，随后疲惫地喘息起来。等她们终于把能从你身上榨出的每一丝快感都吞吃干净后，才起身加入姐妹们的性玩具展示，只留下你一个人浑身沾满乳汁和淫液，眼睛几乎被干结的女人淫液糊得睁不开。");
         outputText("[pg]管他呢——你的手终于自由了。你立刻把一只手伸向下体，开心地用手指插进湿透的小洞，同时抚弄[clit]。一个已经挑好穿戴式假阳具的女巫看见你玩得正开心，立刻跑过来阻止你；她选的是一根硬挺的猫科假阳具，上面带着柔软的橡胶倒刺。你们短暂地挣扎了一下，但她把你的双手按举起来，自己骑坐到你的肚子上，她的猫科假阳具");
         if(get_player().biggestTitSize() >= 1)
         {
            outputText("夹在");
         }
         else
         {
            outputText("作用于");
         }
         outputText("你的[chest]。");
         outputText("[pg][saystart]嘿，姑娘们，快点挑根鸡巴吧！这个");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,838) > 0)
         {
            outputText("骚货");
         }
         else
         {
            outputText("新人");
         }
         outputText("有点欲火上身了！[sayend]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,838) > 0)
         {
            outputText("[pg]你本该再多想想那个词，可你现在满脑子都是胸口上的鸡巴玩具。你眼中满是欲望地盯着它，哀求它的主人用它操你、用它让你高潮，把你变成她的母狗。");
         }
         outputText("[pg]其他女巫纷纷拿来各式各样的假鸡巴，把你围在中间。骑在你身上的女巫翻身下来，让你跪坐起来，同时把你的双手按在背后，贴着你的耳朵低声说，她们会给你想要的所有\"鸡巴\"，但你得先让她们看看你有没有本事。她把你推到四肢着地的姿势，三个女巫站到你面前。她们的兽形假鸡巴全都指着你的脸，脸上挂着得意的坏笑。");
         outputText("[pg]你伸手握住左右两边的鸡巴，嘴里则含住中间那根用力吸吮。沙漠女巫们像恶魔一样笑着，看你拼命服侍她们，虽然她们得到的唯一快感只是看你那副饥渴的模样。你为了让她们干你，心甘情愿地讨好她们。装着鸡巴的女巫揉捏着你的[chest]，把玩并掐弄你的[nipples]，同时将那根布满倒刺的鸡巴在你[vagina]的唇瓣间来回滑动。细小的凸点刮蹭着你的小穴，挑逗着你的阴蒂，而这玩具很快就被你自己的淫液润得湿滑。她在你耳边低语：[say: 真是个会吸鸡巴的乖孩子。想要奖励吗？]嘴里还含着一根玩具鸡巴的你笑着点了点头。猫女巫把你从正在服侍的鸡巴上拉开，转过你的身子，让你坐到她交叠的[legs]上，她那根猫咪鸡巴顶着你的[vagina]和肚子，仿佛是活物一样。");
         outputText("[pg]你弯起膝盖，让流着淫液的骚穴悬在猫鸡巴上方，然后毫不犹豫地重重坐了下去。");
         get_player().cuntChange(30,true,true,false);
         outputText("你被填得满满当当，爽得头脑发白；你拼命把自己往沙漠女巫的\"鸡巴\"上撞，淫液不断飞溅出来。你像发疯的骚货一样骑着她，边呻吟边尖叫，激烈的抽插晃得女巫身体发颤，也让她奶白的双峰随之摇晃。其他女巫也把她们的假勃起送到你面前，你欣然含住其中一根，能吸什么就吸什么，其余的则在你的[skinfurscales]上磨蹭。那些假阳具不像真正的阴茎那样能感受到触觉，但光是把这些阳具般的东西蹭遍你这淫荡家伙的每一寸身体，就已经足够让她们兴奋了。女孩们一边把绑带假阳具在你身上到处按摩，一边互相亲吻、舔舐起来。");
         outputText("[pg]你已经乱糟糟地在那个装着猫鸡巴的女巫胯间高潮了。你完全没有因为高潮而停下，仍旧继续抽插着那根你渴求至极的人造勃起。女巫抓住你的[butt]，站起身时把你也托了起来，可你还在朝她胯下挺动[hips]。她掰开你的臀瓣，大声宣布：[say: 你们这些骚货里，谁想要这个屁股？]");
         outputText("[pg]装着坚硬龙形鸡巴的女巫走上前来，帮她的姐妹托住你，同时把自己的玩具家伙对准你的[asshole]。你感觉那根龙形玩具顶住洞口，臀瓣下意识地夹紧。她试着插进你体内，可你却完全不理会，这让她很是恼火。此刻你唯一在乎的，就是把自己的小穴塞满。装着龙形假阳具的女巫只好记住你挺动的节奏，等待合适的时机。");
         outputText("[pg]她瞅准时机一顶，整根塑料鸡巴都贯入了你的[asshole]，让你惊得瞬间僵住。要不是这些女巫和她们的\"鸡巴\"托着你，你早就光着身子摔到地上了。至少在你停住的时候，她们还算体贴地继续给你快感。两根独特的鸡巴都插在你体内，带倒刺的那根惬意地刮蹭着你的肉壁，而带棱纹的那根则在你的后穴里进进出出。你能感觉到它们隔着各自被干的肉洞在体内彼此摩擦。你所渴求的一切刺激，如今全都倾泻在你身上。你意识朦胧地望着女巫涂着黑色唇彩的嘴唇，自己的嘴也在恍惚中微微张开。");
         outputText("[pg]女巫注意到你对她的嘴唇很感兴趣，便舔了舔唇，又故意噘起嘴，像是在邀请你主动上前。你凑近过去，迷迷糊糊地吻住她；你们的舌头彼此缠绕，而你的[asshole]和[vagina]仍被人造鸡巴不停地抽插着。");
         outputText("[pg]你高潮了，几乎毫无征兆。然后又来了一次，再一次……高潮就这么一波接一波，停不下来。");
         outputText("[pg]接下来的几个小时都变得模糊不清。你记得自己跪在地上吸着鸡巴，同时小穴被舔弄；记得自己用手和[feet]撸着三根鸡巴，甚至有一刻整个人都倒挂了起来。随后，一切都渐渐陷入黑暗……");
         get_player().orgasm("Vaginal");
         dynStats(DynStat.Lib(1));
         menu();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,838) > 0)
         {
            addButton(0,"继续",sandWitchMobNotBadEnd);
         }
         else
         {
            addButton(0,"继续",sandWitchMobBadEnd);
         }
      }
      
      public function explainYourSelfToZeSandBitch() : void
      {
         clearOutput();
         outputText("你解释说，自己是从一个叫英格纳姆的地方穿过传送门来到这里的，作为勇者被派来守护故土、抵御恶魔。你讲述了自己在这里的旅行和经历，自信地说明了你是如何发现这个女巫集会，以及你对沙漠女巫产生了怎样的误解。她们看起来和这片土地上的其他人一样被淫欲冲昏了头脑，而你便以为她们和你屡屡遇到的恶魔是一伙的。");
         outputText("[pg]女巫女王全神贯注地听着你的故事，可当你说完后，她只是闭上眼睛，似乎陷入了沉思。你停下来，等待她的回应。几秒过去，又渐渐变成了几分钟。你无所事事地轻敲着你的[foot]。她到底还要琢磨到什么时候？");
         outputText("[pg]突然，女王猛地抬起头，用那双白色虹膜的奇异眼睛直视着你。");
         if(get_player().isCorruptEnough(15 + get_player().get_inte100()) || get_game().jojoScene.isJojoCorrupted() || get_player().hasStatusEffect(StatusEffects.Exgartuan) || get_game().amilyScene.amilyCorrupt() || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,283) > 0 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,282) > 0 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,450) > 0)
         {
            outputText("[say: 你的说法里确有几分真实，[name]，但我是沙之母。我们受过训练，精于辨识腐化与污秽之人。若我们无法识破伪装的恶魔和恶魔的走狗，我们也不会像如今这样繁盛，而这片大沙漠也不会即将迎来复苏。]");
            outputText("[pg]沙之母走下王座，起身时挥起一柄闪亮的权杖。她的嘴角勾起残酷的笑意，向你发出挑战：[say: 与我一战吧，[name]，然后像你之前每一个恶魔走狗一样倒下。不必害怕，因为当你败北后，你将获得重生，去服务于正义的事业。你身上的污秽或许还来得及驱除。]");
            outputText("[pg]无路可退了，只能战斗！");
            startCombat(new SandMother(),true);
         }
         else
         {
            outputText("[say: 你的说法听起来确有真实之处，[name]。我是这个女巫集会的沙之母，而看来我们终究并非敌人。如果你愿意，我可以吩咐我的女儿们，让你在沙地中畅行无阻。]她大方地张开双臂，问道，[say: 你有什么想谈的吗？我已经很久没有和新来者交谈过了。][pg]（+200 经验）");
            var _temp_1:* = get_player();
            _temp_1.XP = _temp_1.XP + 200;
            get_mainView().statsView.showStatUp("xp");
            dynStats(DynStat.Lust(0),DynStat.NoScale);
            statScreenRefresh();
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,838,1);
            sandWitchMotherFriendlyMenu();
         }
      }
      
      public function exitDungeon() : void
      {
         get_game().inDungeon = false;
         get_game().dungeons.usingAlternative = false;
         clearOutput();
         outputText("你离开那扇门，穿过沙漠朝营地返回。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function enterDungeon() : void
      {
         get_game().inDungeon = true;
         get_game().dungeons.startAlternative(this,17,"沙漠洞穴");
         get_game().dungeons.setDungeonButtons();
         get_game().dungeonLoc = 23;
         runFunc();
      }
      
      public function drinkNFap() : void
      {
         clearOutput();
         outputText("你向那名黑肤女人招呼一声，让乳汁遮住你开始自慰的双手，并告诉她你想喝点东西。那名奶奴有些怯生生地照做，挪动身体，把自己的乳房重新拖回合适的位置。");
         outputText("[pg]她哀求道，[say: 请原谅，[Master]。浴池荡妇很乐意再给你更多奶。]她转了转肩膀，让压在浴池边、灌满乳汁的丰硕乳房诱人地一颤；她黑貂般深色的乳头上，又沾上了新滴落的白色乳珠。那些乳白的小滴沿着这个黑肤荡妇乳房的下弧滚落，滴进浴池里，在池中荡开一圈圈细小的乳白波纹。到这时，她那被反复使用的乳头看起来几乎胀得过了头，即便隔着煤黑色的肌肤，也能看出它又鼓又肿，还有些泛红。当你凑近时，一股股浓稠的象牙白蜜汁已经从她每个乳头尖端流淌出来；对这个永远奶水充盈的女人来说，光是期待就已经太过强烈了。");
         outputText("[pg]你含住她的乳头，试探性地舔了一下。珍珠般的乳汁让它带着甜味，但她的肌肤也隐约有些体盐的味道，并不难吃。你低头看着面前的乳房，这才意识到，就算那只喷奶口已经含在你嘴里，你也只吞下了她乳头的一小部分。她大半片乳晕仍在你眼前铺展开来，几乎有餐盘那么大，却远比餐盘诱人。你咽下几口她体内的水润甘露后，伸手摸向自己的");
         if(get_player().hasVagina())
         {
            outputText("[vagina]，漫不经心地抚弄着自己因欲望而肿胀的阴户");
         }
         else
         {
            outputText("[cock]，漫不经心地抚弄着那根胀硬的肉茎");
         }
         outputText("，不经意间从自己口中引出一声淫荡的呻吟。塞在你嘴里的肥厚乳头，倒是很好地闷住了你因快感发出的声音");
         if(get_player().hasCock())
         {
            outputText("，但它可遮不住[eachCock]渐渐胀大——不过有这些乳汁替你遮掩");
         }
         outputText("。");
         outputText("[pg]一声兴奋的呻吟从那名漆黑肤色的奴隶女孩饱满的唇间钻出，证明她那被乳汁撑胀的双乳有多么敏感。你的舌尖在那漏奶乳头粗糙的小颗粒肌肤上打转时，她又吐出一声带着喜悦的轻喘。那声音的颤意仿佛一路轻吟到你的腰间，与你手指的爱抚交织在一起，把你撩拨得欲火灼痛、浑身发颤。");
         if(get_player().get_gender() == 3)
         {
            outputText("你的[cock]在手中疼痛地搏动，又热又硬，硬到你确信自己一定已经开始流出前列腺液；但任何液体都会被无处不在的乳汁迅速冲散。");
            if(get_player().cockTotal() > 1)
            {
               outputText("你确保自己每一根肉棒都得到同等的爱抚，随着欲望不断高涨的节奏抚摸、揉捏、套弄着它们。");
            }
            outputText("你用另一只手，把沾满乳白润滑液的手指探进湿透的小穴，肉缝轻易分开，容纳几根摸索的手指进入。甜美的快感从你的[clit]蔓延开来，它从包皮下挺出，完全充血，因难耐的渴望而微微悸动。你拨弄了那颗敏感的小豆几下，随后又继续指弄自己的穴口，但仍不忘每隔片刻就用拇指扫过阴蒂，让自己尽可能贴近高潮边缘。说真的，身为双性人简直是极乐。");
         }
         else if(get_player().get_gender() == 2)
         {
            outputText("你的淫液与浴缸里乳白色的“水”自由交融，让沾满乳白润滑液的手指能轻松插入你的[vagina]。你抚弄着阴唇，像熟练的情人般熟悉地爱抚着产道深处，玩弄自己的身体，直到感觉自制力逐渐滑落；欲火绷得太紧，仿佛一根被拧过头的吉他弦，失控地颤动着。");
         }
         else
         {
            outputText("你的[cock]在手中痛苦地悸动，又烫又硬，硬到你确信自己肯定已经开始渗出先走液了，可任何液体都会被无处不在的乳汁迅速冲刷干净。");
            if(get_player().cockTotal() > 1)
            {
               outputText("你确保自己每一根肉棒都得到同等的爱抚，随着欲望不断高涨的节奏抚摸、揉捏、套弄着它们。");
            }
            else
            {
               outputText("你用另一只手托住自己的[sack]，掂弄着[balls]，感受欲望翻涌到新的高度。");
            }
         }
         outputText("[pg]一股温热的液流溅到你的肩头，你转向那边，欣喜地看见被俘女人的另一只乳头又喷出一阵强劲而丝滑的乳汁。你略带遗憾地松开嘴，被迎面浇了满头满脸的奶，随即立刻换到那只喷涌的乳尖上。你努力吞咽，想跟上奶流的速度，双颊被压力撑得鼓起。最终，受限于你的吞咽能力，再加上从胯间翻卷而出的阵阵快感，你还是没能把所有乳汁都咽下去；奶液从嘴角喷溅出来，一道道顺着下巴流淌而下。");
         outputText("[pg]到了这时，浴缸已经满得危险，乳汁像涨潮一样拍打着边缘；当你高潮来临时，你甚至短暂地怀疑它或许真的涨潮了。白热的灼意贯穿你的腹部，慵懒地沿着脊柱上攀，直冲脑海。你的下颌锁紧，不由自主地咬住那颗巧克力色的乳头，令奶流暂时止住。你的[hips]仿佛自行活塞般前后摆动，搅起乳白的浪花，四处飞溅，弄得地板和装备都浸满了奶。");
         if(get_player().hasCock())
         {
            outputText("[EachCock]都释放出属于自己的黏稠精液，断断续续地喷吐着，为这场珍珠般的洪流再添一股。");
            if(get_player().cumQ() >= 500)
            {
               outputText("你每释放出一股精液洪流，都能看见它被你惊人的雄性活力推动着，半抬出浴缸，朝最近的雌性目标涌去。");
            }
            if(get_player().cumQ() >= 3000)
            {
               outputText("很快，浴缸里的液体冲破边界，把你同伴暗色的肌肤染成一片雪白；那层白玉般的釉光本会诱使你继续堕入更深的淫乱，可你男性部位如今散发出的满足感让你无心再进一步。");
            }
         }
         if(get_player().hasVagina())
         {
            outputText("与此同时，你湿透的小穴像是在体内翻跟头一般，不断扭动、收缩，喷涌出液体与女性的欢愉。只是在你的[clit]上轻轻一碰，就让你的[legs]一软倒下；不过幸好，你在乳液中漂浮着，度过了高潮剩下的余韵。");
         }
         outputText("[pg]当你与另一个女孩分开时，她发出一声拖长而低柔的满足呢喃，又害羞地低声说道：[say:谢谢你，]同时拖着那对巨大的乳房掠过满是积奶、滑腻不堪的地板。你带着坏笑，性欲得到满足，拔开浴缸的塞子，站在那里看着弥漫性爱气息的乳白浴水流进下水口。很快擦干身体后，你准备出发，感觉稍微清爽了些，也相当满足。要把你的[armor]同样弄干并重新穿好倒是花了点时间，但你还是搞定了。");
         get_player().changeFatigue(-15);
         get_player().refillHunger(30);
         get_player().orgasm("Generic");
         dynStats(DynStat.Sens(-3));
         doNext(playerMenu);
      }
      
      public function dontFuckMilkBathBabe() : void
      {
         clearOutput();
         outputText("你任由女孩继续服侍了很久很久，直到全身都深深放松下来；她的乳汁渗入你的身体，让你感到清爽而充满活力。你正想感谢这位奶女孩带来的愉快陪伴，可刚一张口，她便滑进你的怀里，将双唇贴上你的嘴。你暗自轻笑，尽可能把她紧紧搂住——只要她那对硕大的乳房允许——又将她稍稍转到一旁，让她用脸颊贴着你的[chest]磨蹭。你亲了亲她的头顶，随后你们一起爬出池子。你还得扶她一把；她身上那额外的巨大重量差点把她又拖回池里，要不是你反应够快的话。你收起自己的[armor]，揉了揉乳奴的头发，然后转身回到眼前的任务上。");
         get_player().HPChange(get_player().maxHP() * 0.33,false);
         get_player().changeFatigue(-20);
         doNext(playerMenu);
      }
      
      public function doNotResistSavin() : void
      {
         clearOutput();
         outputText("你需要她在你体内，需要被她的种子……她的孩子填满。需要被支配，需要受孕。你沉入女巫的怀抱，任由她缓慢而充满爱意地用厚实的臀部向你体内抽送，将越来越多的前液和乳汁纳入体内，直到你感到胀满沉重，体内满载着白色的女巫精种，以及你很快将为你们共同的后代孕育出的食粮。精液女巫温柔得不可思议，她的动作始终轻柔，小心翼翼地呵护着你——以她自己的方式爱着你——一次又一次用她的肉棒填满你。你沐浴在那份充实感中，因快感而瘫软，心满意足地任由她把你操到怀上一窝小女巫，让你成为沙丘之母，正如你应得的那样。");
         outputText("[pg][say:乖女孩，漂亮女孩。如此强大，如此急切。如此心甘情愿。你会成为一位好母亲，一匹优秀的孕马，对吗？]你急切地点头，而她随即更加用力、更快地顶入你体内。[say:我们的孩子会是美妙而美丽的女巫，沙漠的女王。你的子宫将成为恶魔们覆灭的基石……现在，收下我的种子，让它成为你的，为我们二人孕育一个孩子。]");
         outputText("[pg]你除了喘息什么也做不了，乳汁从你唇边喷溅而出，而第一股滚烫的精液已经刺入你的子宫。女巫摆动臀部，一股又一股浓稠的精种灌入你体内，把后代的希望填满你，直到浓厚的精液沾染你的大腿，从她那根巨大而支配性的阳具周围不断涌出。女巫体内仿佛有无穷无尽的精液储备，高潮似乎永不止息，将越来越多的精液灌满你，直到沙丘都被多余的女巫精种染得雪白。");
         outputText("[pg]终于，那场无尽的高潮逐渐退去，女巫满足地呻吟着，向后倒在沾满精液的沙丘上，满是乳汁的胸膛起伏着，又为这片生物的污浊增添了新的痕迹。[say:让我成为你孩子的父亲吧……你会是个出色的母亲，我们的孩子也会无比荣耀。]");
         outputText("[pg]你默默地点了点头，倒在她身上，把头埋进她满载乳汁的胸口，在性爱后的疲惫中昏了过去。");
         get_player().orgasm("Vaginal");
         dynStats(DynStat.Sens(2));
         get_combat().cleanupAfterCombat();
         get_player().knockUp(22,360,90);
      }
      
      public function discussCumWitches() : void
      {
         clearOutput();
         outputText("你询问她们为什么会有精液女巫。");
         outputText("[pg][say: 哦，你是说精液女巫？嗯，这个团体的诞生是出于需要，而不是欲望。我们需要繁衍后代，而随便找个普通男人是不够的。伟大母亲需要某种超越普通人类男性能力的东西——一具明白身为女人是何种感受的身体，再结合近乎无限的雄性精力，以及经过精心改造、能让我们的人数增长为我们正需要之模样的种子。她已经学会了随心所欲地塑造身体，所以形成一根阴茎和专门的高产性腺，对她来说轻而易举。]");
         outputText("[pg]沙之母说到这里微微脸红，在椅子上紧张地坐立不安。你的好奇心被勾了起来，于是问她：[say: 那么，她们是怎么被选出来的？]");
         outputText("[pg][say: 这，呃……是个相当艰苦的过程。集会的沙之母会判断何时需要更多精液女巫，然后选拔便会开始。因为精液女巫这个职位在身体上相当……严苛，所有希望成为精液女巫的人都必须证明自己能够承受职责所带来的一切。为此，候选者会被安排在一个房间里彼此取悦，直到疲惫压垮她们，最后只剩一人还能继续。被选为精液女巫，就等于通过性爱试炼，被确认为性欲过人的女人——当然，这都是为了共同的利益，]这位古铜肤色的女王带着怀念的微笑叙述道。");
         outputText("[pg]听起来相当折磨人");
         if(get_player().cor + get_player().lib > 100)
         {
            outputText("，不过也可能挺有趣");
         }
         outputText("。你带着一点淫荡的笑意，问她是否也曾参加过选拔。");
         outputText("[pg]沙之母皱起脸，但脸红得更深了，[say: 是的，在我拥有自己的集会之前，我也曾经参加过那个职位的选拔。我那时年轻又愚蠢，以为那是一个充满权力与荣耀的位置。毫无疑问，身居其位的人也会这么认为，但现在我看清了它的真面目。奴役。被自己身体里悸动不休的欲热所奴役，也被持续服侍姐妹们的职责所奴役。沙漠女巫可以自由行走在沙漠中，侦察或寻找新成员。精液女巫呢？她们性交。性交。再性交。她们唯一真正的喘息机会就是学习魔法，而她们本就几乎没有多少时间。]她苦笑着承认道，[say: 我很庆幸自己没有成为精液女巫。我被允许成为更重要的存在，也许有一天，我会继承我母亲的衣钵，统治一个自由的玛瑞斯。]");
         menu();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,852) == 1)
         {
            outputText("[pg]你已经说服她为自己的后宫增加更多精液女巫，好让她们也能体验到一点自由。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,853) == 0)
            {
               outputText("如果你让她派她们出去寻找新成员，将来你就有可能在沙漠中与她们战斗并性交。");
               addButton(0,"派出去",sendOutCumWitch).hint("请求沙之母派精液女巫外出寻找新成员。","派她们出去");
            }
            else
            {
               outputText("她们之中有许多人此刻正游荡在沙漠中，搜寻着新成员。如果你外出，就有可能最终不得不与她们交战。倘若你提出要求，她或许会让她们避开你。");
               addButton(0,"留在营地",keepCumWitchesIn).hint("请求沙之母让精液女巫别来碍你的事。","让她们留下");
            }
         }
         else
         {
            outputText("[pg]如果你想改善她们的处境，可以请求她增加她们的人数，让她们难得有些空闲时间。");
            addButton(0,"增加人数",moreCumWitchesPlease).hint("询问集会能否再增加几名精液女巫。");
         }
         setExitButton("返回",sandWitchMotherFriendlyMenu);
      }
      
      public function dicksHaveSexWithAWitch() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         clearOutput();
         outputText("看着那堆");
         if(get_monster().get_HP() < 1)
         {
            outputText("痛苦地");
         }
         outputText("扭动着的女性肉体，你双手叉在[hips]上，打量着这群人里最漂亮的那个。她们都有着迷人的古铜色肌肤和亮泽的金发，但在五官、发型、乳房大小和臀部曲线上又各有不同，足以让你挑出自己最想要的那个。至少从脸蛋来看，她有着古典意义上的真正美貌。她有一个小巧的纽扣鼻，饱满的嘴唇，一头金发扎成及腰的马尾。她的四只乳房都是浑圆的E罩杯，大到足以让你的手指陷进去，却又挺翘得恰到好处，几乎看不出下垂。");
         outputText("[pg]你走近时，一双棕色的大眼睛带着明显的恐惧抬头望向你。嗯，这可不行。你平静地向她伸出手，尽量对这位倒下的敌人露出欢迎的微笑。她环顾四周，望向她那些");
         if(get_monster().get_lust() >= get_monster().maxLust())
         {
            outputText("正在自慰的同伴们");
         }
         else
         {
            outputText("呻吟着的同伴们");
         }
         outputText("寻求建议，却什么也得不到。别无选择之下，她握住你的手，任由你将她从同族身边带开。你把手放到她脸颊上，告诉她你不会伤害她。她和她的同类在你体内激起了大量欲火，而你打算在她身上发泄出来，但你也不觉得这非得让她难受不可。");
         if(get_monster().get_lust() >= get_monster().maxLust())
         {
            outputText("从她脸上始终不退的潮红，以及空气中弥漫的女性蜜液气息来看，她早就准备好帮你解决这个问题了。");
         }
         else
         {
            outputText("一想到这点，她的双颊慢慢染上颜色，几乎变得一片通红。与此同时，她的乳头似乎在长袍下收紧，昭示着她的身体已经接受了你的意图。");
         }
         outputText("[pg]美丽的沙漠女巫颤抖着脱下长袍，让她四只被汗水润得发亮的乳房在你眼前几寸处自由摇晃。你立刻将其中一只握在手里揉捏起来——力道并不算太重，只是足以好好欣赏她那曲线饱满的胸脯。她因这触碰而瑟缩了一下，但当你试探的拇指抚过她乳晕边缘时，她仰起头，轻轻叹息。一滴乳汁从她满含欲意的乳头上溢出，落到你的手指上，你抬手送入口中品尝。浓郁而甜美的味道在舌尖荡开。你出乎意料地愉悦地哼了一声，真是妙极了！");
         outputText("[pg]你绕到这位正在泌乳的施法者身后，一边单手脱下衣物，一边继续抚弄她。随着你揉捏的力道越来越重，她挺翘而坚硬的乳头滴出的乳汁也越来越快，而你在[cocks]中不断膨胀的热意驱使下，触碰愈发急切。丢开你的[armor]后，你亲吻她纤细的肩膀和脖颈，在她下颌边缘流连片刻，又轻轻吮了一下她的耳垂。她在你怀里颤抖，却没有躲开。事实上，她还弓起后背，让自己更紧地贴向你。当你把另一只手也覆上她胸膛另一侧时，这位女术士几乎要融化在你怀里。");
         outputText("[pg][EachCock]挺立着");
         if(get_player().get_tallness() < 60)
         {
            outputText("顶在她的臀瓣之间");
         }
         else
         {
            outputText("贴着她弓起的脊背");
         }
         outputText("，完全充血，随时准备大干一场。眼下，你仍满足于继续亵玩这个被你选中的泄欲玩具，将两根手指探入她那");
         if(get_monster().get_lust() >= get_monster().maxLust())
         {
            outputText("早已湿透的");
         }
         else
         {
            outputText("迅速湿润起来的");
         }
         outputText("两只小穴里，好确认她已经做好准备。女巫咬住嘴唇，试图压下淫荡的呻吟，于是你用指腹同时擦过她的两颗阴蒂。这一下将她仅存的克制彻底击碎，化作滑腻的淫液。即便现在，那些淫液也正沿着她的大腿内侧往下滴。她已经随着你的抚弄真正呻吟起来，而你判断她已经准备好了。");
         if(get_player().smallestCockArea() <= get_monster().vaginalCapacity())
         {
            _loc1_ = get_player().cockThatFits(get_monster().vaginalCapacity());
            _loc2_ = get_player().cockThatFits2(get_monster().vaginalCapacity());
            outputText("[pg]把她放成四肢着地的姿势后，你欣赏着她弹软臀部的曲线，以及她那一片片饱满小穴唇上凝成珠的湿亮淫液。女巫的小穴因炽热欲望而泛红，已经完全充血肿胀。你能看见她那对阴蒂从包皮下探出头来，简直是在求你去碰。你又有什么理由拒绝呢？你绕过她的腰侧，开始用一根手指在其中一个幸运的小铃铛周围打转，同时把你的" + get_player().cockDescript(_loc1_) + "对准她其中一个小穴");
            if(_loc2_ >= 0)
            {
               outputText("，又把你的" + get_player().cockDescript(_loc2_) + "瞄准她另一个小穴");
            }
            outputText("。她双膝一软，但你早有准备，她径直滑坐到你支撑着她的那根肉棒上");
            if(_loc2_ >= 0)
            {
               outputText("");
            }
            outputText("，把自己一路套到根部。");
            outputText("[pg][say: 噢噢噢……]女术士在你身上安顿下来时叹息着。你用双臂托住她的身体，把她的四只乳房挤在一起，享受着她淌出的乳汁带来的温热，而她的");
            if(_loc2_ < 0)
            {
               outputText("小穴紧紧夹住你");
            }
            else
            {
               outputText("两个小穴紧紧夹住你");
            }
            outputText("。沙漠女巫完全由你的身体支撑着，除了那些正紧紧裹住你肉棒的肌肉外，浑身都松软下来");
            if(_loc2_ >= 0)
            {
               outputText("");
            }
            outputText("。她的呼吸粗重又急促，你抱起她，同时向后摆动腰身，几乎把你的" + get_player().cockDescript(_loc1_));
            if(_loc2_ >= 0)
            {
               outputText("和" + get_player().cockDescript(_loc2_));
            }
            outputText("全都抽出来，紧接着又几乎瞬间反向挺进，猛地一路顶到根部。你打桩机般的抽插把那位曾经骄傲的女术士变成了一滩颤抖的性爱泥浆，她完全沉溺在小穴里的快感中");
            if(_loc2_ >= 0)
            {
               outputText("");
            }
            outputText("，以至于她的理智几乎都要从小穴里流出来了。");
            outputText("[pg]你继续越来越快地干着这位漂亮的大胸沙漠女巫，享受着她的奶子在你掌中跳动、滴淌的模样，而她的姐妹们只能被迫看着你如此淫荡地占有她。她们对欲望并不陌生，其中许多人一边吮吸着离自己最近的女孩的乳头，一边公然抚弄自己自慰。你把一只手收回到伴侣的阴阜上，将食指和中指按上她的两颗阴蒂。你怀里那团抽泣着的性爱泥浆倒吸了一口气。");
            outputText("[pg]你一边在她的阴蒂上打圈，一边继续抽插她，几乎以旁观般的好奇看着她围着你的");
            if(_loc2_ < 0)
            {
               outputText(get_player().cockDescript(_loc1_));
            }
            else
            {
               outputText("双根肉棒");
            }
            outputText("泄出一圈白浆。一波波起伏的收缩把你包裹在闪烁而短暂的快感中。就像脑中有什么东西咔哒归位，一股生物本能猛然浮现，释放出从你体内深处沸腾上涌的热意，仿佛火山喷出的熔岩。[EachCock]一阵痉挛，释放出一股咸涩的精液。女巫肯定感觉到了，因为你的种子刚一碰到她湿滑的小穴");
            if(_loc2_ >= 0)
            {
               outputText("");
            }
            outputText("，她黏腻的小穴唇似乎就收紧起来，裹住你的粗硬，想把精液封在里面。");
            if(get_player().cumQ() >= 400)
            {
               outputText("但这没能容纳你全部旺盛的喷射，一缕缕精液从她穴唇两侧喷了出来。");
               if(get_player().cumQ() < 2000)
               {
                  outputText("不过，她的努力倒也让你成功送了她一个漂亮的小精液肚。");
               }
               else
               {
                  outputText("你射得太快，哪怕有那些缝隙外泄，对她也没多大帮助。慢慢地，她的肚子开始向外鼓起。随着精液不断灌入，她的肚皮被撑开、晃动，直到她看起来像是怀了好几个月才停下。那里面的液体随着她每一个动作晃荡不已，任何敢看她的人都能一眼明白她肚子里装了什么。");
               }
            }
            outputText("[pg]你把她放到姐妹们面前，任由她从你的");
            if(_loc2_ >= 0)
            {
               outputText("双根肉棒");
            }
            else
            {
               outputText(get_player().cockDescript(_loc1_));
            }
            outputText("上滑落到地上，好让她们见识一下你究竟有多大能耐。她们之中最强的也会被你击败，被你干成泥地上一滩抽搐的烂泥。尽管这群人似乎已经被你展现出的威势震慑住了，她们却仍然看着你对她们姐妹做过的事，继续自我慰藉。你让剩下的人轮流舔净你阴茎上射完后残留的精液和结块的淫液");
            if(_loc2_ >= 0)
            {
               outputText("们");
            }
            outputText("，然后才穿好衣服，回到正事上。");
         }
         else
         {
            outputText("[pg]你一句警告都没有，直接把她转了个身，温柔地按倒在地。你的手指离开她柔滑的小穴时，她失望地呻吟了一声；可当你爬到她身上时，她的态度立刻变了。你的[cock biggest]垂落到她胸前，挤开她四只枕头般柔软的乳房。摆好姿势后，你抓住她的双臂，朝她湿润的裂缝压去，把她的前臂分别摆在胸部两侧，让那片柔软的肉将你的肉棒垫住、夹紧。当然，额外的压力也挤出了四道乳汁，从四面淌到你的[cock biggest]上，把这女巫的胸口变成了一只由四片乳肉组成、供你阴茎穿行的肉棒套。");
            outputText("[pg]这漂亮女孩的手指深深插进自己好几处阴道里。她无声地吐出一声愉悦的叹息，嘴唇慢慢张开，正好在你第一次挺进时迎上你的肉棒。你的[cockHead biggest]顶开那两片唇，推进到刚好撞上她牙齿的位置，随后你又把[hips]抽回，准备下一次推进。每当这个金发女人碰到特别敏感的地方，她的双腿就会一阵抽搐。你抓住她漏着奶的乳头，开始越来越快地抽干她那四只颤动的乳房，看着那些大胸在你猛烈的乳交下乱晃，同时轻轻扭动乳头，直到她呜咽着呻吟起来，四只乳房都喷涌出乳汁。");
            outputText("[pg]四处飞溅的乳汁喷泉为你狂暴的乳交提供了更多润滑。滚烫的湿意渗进你和她的皮肤，你忍不住低吼，沉浸在这又热又湿、黏腻不堪的乳交里。你的[cockHead biggest]滴着预精，一次又一次撞上她抿起的嘴唇；女巫似乎很喜欢这样，因为每当你靠近她喘息呻吟的唇边，她都会伸出舌头绕着你打转。下腹深处不断酝酿的热意驱使你越动越快。你的动作快到身上又沁出一层汗光，那股热度也越来越烫，随之而来的标志性收缩与奔涌热流，预示着你即将越过高潮边缘，把这个女孩漂亮的脸射成一片雪白。");
            outputText("[pg]女巫一边自慰，一边呻吟着挺起身，感激地尽可能把你的[cock biggest]含进嘴里。她刚好尝到第一股射精的味道，下一瞬便");
            if(get_player().cumQ() >= 500)
            {
               outputText("费力地吞咽着它");
            }
            else
            {
               outputText("把它咽了下去");
            }
            outputText("。她把双臂夹得更紧，让胸部更加用力地裹住你因高潮而跳动的肉棒。那感觉好得仿佛你的[balls]里又掀起了一轮全新的高潮，哪怕你明明已经开始射了！");
            if(get_player().cumQ() < 250)
            {
               outputText("这个可爱的女人把每一滴都吞了下去。她吞完时甚至还满足地呻吟了一声。");
            }
            else if(get_player().cumQ() < 1000)
            {
               outputText("这个可爱的女人两颊鼓胀，试图把一切都含住。尽管你的精液汹涌不止，她仍然努力地吞咽着，只让几道白色细流从被撑开的嘴角漏了出来。");
            }
            else
            {
               outputText("这个可爱的女人的两颊被你淫乱的精液洪流灌满。她试着吞下去，可无论她多么急切地咽，精液仍以惊人的力道不断涌入，从她嘴角喷溅出来。几秒后她干脆放弃，任由它像瀑布一样顺着下巴流下。大部分精液在她身下的地板上积成一滩，浸进她的马尾，把头发黏成一绺绺带着咸味的精液。");
            }
            outputText("[pg]结束后，你从她的乳房间抽身而出，用她的长袍擦干净自己，再把那件带着麝香味的长袍扔到她脸上，而她也开始淫荡地尖声呻吟，迎来自己的高潮。现在，该去探索这座沙漠鼠地窖的其余地方了。");
         }
         get_player().orgasm("Dick");
         dynStats(DynStat.Sens(-1));
         get_combat().cleanupAfterCombat();
         spriteSelect(SpriteDb.get_s_witchmob());
         fuckedWitches = true;
      }
      
      public function defeatedByCumWitch() : void
      {
         spriteSelect(SpriteDb.get_s_cumWitch());
         if(get_game().inDungeon)
         {
            if(get_player().hasCock() && (get_player().get_gender() == 1 || Utils.rand(2) == 0))
            {
               cumWitchCumPumpBadEnd();
            }
            else
            {
               turnIntoASammitch();
            }
         }
         else if(get_player().hasCock() && (!get_player().hasVagina() || Utils.rand(2) == 0))
         {
            if(Utils.rand(2) == 0)
            {
               TDMsLoseToCumWitchScene();
            }
            else
            {
               repeatLoseToCumWitchForDudes();
            }
         }
         else if(get_player().hasVagina())
         {
            savinMakesAwesomeFemdom();
         }
         else
         {
            get_combat().cleanupAfterCombat();
         }
      }
      
      public function defeatTheSandMother() : void
      {
         clearOutput();
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,847,1);
         outputText("喘息着");
         if(get_player().get_HP() > 1)
         {
            outputText("，疲惫不堪");
         }
         else
         {
            outputText("，欲火难耐");
         }
         outputText("，沙之母瘫回王座，汗水和乳汁沾污了她丝滑的长袍。她轻声呻吟，乳渍慢慢扩散开来，而你思索着接下来该怎么做。这个女人竟敢与你为敌。你要怎么处置她？");
         get_combat().cleanupAfterCombat();
         menu();
         addButton(0,"劝服她",talkDownTheMother).hint("劝沙之母冷静下来。让她相信你不是恶魔。","劝服她");
         addButtonDisabled(1,"剪刀式","这个场景需要你拥有阴道。");
         addButtonDisabled(2,"干她","这个场景需要你拥有合适的鸡巴。");
         addButtonDisabled(3,"触手群交","这个场景需要你至少拥有5根触手鸡巴。");
         if(get_player().hasVagina())
         {
            addButton(1,"剪刀式",scissorAndDrink).hint("进行女性间的性爱，并尽情饮用。");
         }
         if(get_player().hasCockThatFits(get_monster().vaginalCapacity()))
         {
            addButton(2,"干她",fuckTheSandMothersCunt).hint("用你的鸡巴干沙之母的小穴。");
         }
         if(get_player().countCocksOfType(CockTypesEnum.TENTACLE) >= 5)
         {
            addButton(3,"触手干她",tentacleGangBang).hint("用你的触手鸡巴干沙之母。","触手性交");
         }
      }
      
      public function declineSandWitch() : void
      {
         clearOutput();
         outputText("你拍去身上的尘土，放下[weapon]，留下精液女巫独自承受败给你的屈辱。她眼中那副被欲望攫住、饥渴难耐的神情，让你毫不怀疑她还会再来挑战你，也毫不怀疑她仍想和你性交。此刻，她滑进自己流成一滩的精液里，漫不经心地抚摸着自己。");
         if(get_game().get_inCombat())
         {
            get_combat().cleanupAfterCombat();
         }
         else
         {
            doNext(playerMenu);
         }
      }
      
      public function currentStateOfInterwebs() : void
      {
         clearOutput();
         outputText("你询问沙漠女巫目前的状况，以及这支女巫集会的具体情形。女巫女王听了你的请求后陷入思索，眉头微蹙，一边轻敲下巴，一边凝望着上方繁复旋转的光芒。");
         outputText("[pg][say: 总的来说，我想我会说我们的处境还算不错，] 她承认道，[say: 多亏了我们的魔法，我们并不缺乏食物。洞穴为我们挡下了最猛烈的沙暴，也确保我们从不会过冷或过热。而且直到最近，我们一直以为自己的居所隐藏得很好，也很安全。] 沙之母向你投来一个苦笑，又会意地叹了口气。[say: 我们都知道，那样想是错的。不过，我们的防御至今还没有被腐化的爪牙攻破，而这次经历也会给我和姐妹们留下许多值得思考的东西。比起恶魔女王的军队，倒不如说幸好是你砸开了前门。]");
         outputText("[pg]这位女术士在王座上轻轻调整了一下姿势，叙述道：[say: 我们人数众多，而精液女巫的魔法只会继续扩充我们的数量。加速成长是伟大母亲最早开创的技艺之一，因此一名新女巫只需几年便能成熟为成人，加入我们的队伍。地精和小恶魔的繁殖速度远远超过我们，但这也在意料之中。] 沙之母脸上浮现出自豪的笑容，夸耀道：[say: 在我所知道的各支女巫集会之间，我们应该会在一两年内拥有足以正面挑战恶魔的数量。]");
         outputText("[pg]真的？那可真是一股相当强大的力量！");
         outputText("[pg]这位深肤色的女族长露出狼一般的笑容，说道：[saystart]真的。在腐化蔓延各地时，我们可没有闲着。伟大母亲明智地让我们走上这条道路，召集我们、塑造我们、培养我们，只为等到我们以救世主之姿重回世间的那一刻。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,493) == 0)
         {
            outputText("剩下的，就只是让那些尚未成熟的成员做好准备，并等待我们的盟友继续壮大数量。我们将乘着不死鸟的双翼进入恶魔女王的堡垒，打一场前所未有的荣耀之战！");
         }
         else
         {
            outputText("剩下的，就是寻找新的空中盟友，或找到一种能够轻松且持续飞行的方法。不死鸟被火焰恶魔击溃，它们的巢穴也遭入侵者袭击并摧毁。要是事情当初有所不同就好了……卡莱斯明明已经那么接近了。");
         }
         outputText("[sayend]");
         outputText("[pg]你提出了她们是否适合与恶魔作战的问题。毕竟，当你遇到沙漠女巫时，她们看起来并不算特别致命。");
         outputText("[pg][say: 哈！会得出这种结论也可以理解，但归根结底，她们并不是想杀你，而是想招募你。你知道要凝成一颗完美无瑕的石球，并让它在某人体内震动而不造成伤害，需要多么精细的控制力吗？相比之下，制造一股能撕裂血肉的沙之旋涡简直是小孩子把戏。以无与伦比的精准度投掷巨石，也几乎不算费什么心神。相信我，说到战斗魔法，我们足以匹敌恶魔，] 她带着了然的微笑向你保证道。");
         outputText("[pg][saystart]所以事情就是这样，[name]。我们很强大，也还算安全；如果计划能继续推进，我们或许终有一天能拯救玛瑞斯。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,493) > 0)
         {
            outputText("当然，这一切都取决于我们能否找到一位盟友，攻破山巅堡垒的城墙。");
         }
         outputText("你还有别的事要问吗？[sayend]");
         sandWitchMotherFriendlyMenu();
      }
      
      public function cumWitchDefeated() : void
      {
         var next:Object;
         var _g2:Combat;
         var _g1:NaughtyNunsHabit;
         var _g:Combat;
         spriteSelect(SpriteDb.get_s_cumWitch());
         clearOutput();
         if(get_monster().get_HP() < 1)
         {
            outputText("巧克力色皮肤的女巫四肢着地地瘫倒下来，破烂的长袍残片在她身边旋绕。衣物被毁后，你得以将她半勃起的肉棒和肿胀的睾丸尽收眼底，它们在她身下诱人地摇晃着；同时展露出来的，还有她湿润多汁的小穴上闪闪发亮的淫液。她那如乳房般硕大的奶子随着她不协调的晃动一同摇摆颤动。她咕哝道：[say: 你打败我了，闯入者……]");
         }
         else
         {
            outputText("巧克力色皮肤的女巫四肢着地地瘫倒下来，身上的长袍也随之被撕裂。她那硬得发胀的肉棒在颤抖的睾丸上方滴着前液，而她同样诱人的小穴看起来也已经被雌性的淫液彻底浸湿。她翻身仰躺，双乳剧烈摇晃，同时把双手都塞向胯间，疯狂自慰起来。女巫喘息着呻吟道：[say: 你赢了……哦哦哦……过来干我！求你了！][pg]嗯，她倒是求得挺客气……");
         }
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,839,1);
         menu();
         addButtonDisabled(0,"巨根性交","此场景需要你拥有一根过大的阴茎。");
         addButtonDisabled(1,"干她","此场景需要你拥有一根合适的肉棒。");
         addButtonDisabled(2,"触手","该场景需要你至少拥有三根触手。");
         addButtonDisabled(3,"女体性交","该场景需要你拥有阴道。");
         if(get_player().hasCock())
         {
            if(get_player().biggestCockArea() > get_monster().vaginalCapacity())
            {
               addButton(0,"巨根性交",maleTooBigVictorySex);
            }
            if(get_player().hasCockThatFits(get_monster().vaginalCapacity()))
            {
               addButton(1,"干她",menFuckUpSomeCumWitch).hint("那小穴看起来很诱人。用你的阴茎干精液女巫的穴。");
            }
         }
         if(get_player().countCocksOfType(CockTypesEnum.TENTACLE) >= 3)
         {
            addButton(2,"触手",tentacleVictoryGangbangCumWitch).hint("用你的触手肉棒干精液女巫。");
         }
         if(get_player().hasVagina())
         {
            addButton(3,"女体性交",ladyVictorySex).hint("骑着精液女巫的肉棒，直到她射出来！");
         }
         if(get_game().get_inCombat())
         {
            if(get_monster().get_HP() >= 1)
            {
               addButton(14,"离开",declineSandWitch);
            }
            else
            {
               _g = get_combat();
               addButton(14,"离开",function():void
               {
                  _g.cleanupAfterCombat();
               });
            }
         }
         else
         {
            addButton(14,"返回",playerMenu);
         }
         if(get_player().get_armor() is NaughtyNunsHabit)
         {
            _g1 = get_player().get_armor();
            _g2 = get_combat();
            next = function():void
            {
               _g2.cleanupAfterCombat();
            };
            addButton(4,"崇拜肉棒",function():void
            {
               _g1.naughtyNunCockWorship(next);
            }).hint("通过侍奉这生物的肉棒来赞颂你的主。");
         }
      }
      
      public function cumWitchCumPumpBadEnd(param1:Boolean = false) : void
      {
         clearOutput();
         if(!param1)
         {
            outputText("因");
            if(get_player().get_HP() < 1)
            {
               outputText("你的伤势");
            }
            else
            {
               outputText("血管中奔涌的欲望");
            }
            outputText("而虚弱不堪，你瘫倒在一张书桌旁，重重倚着它支撑身体，同时");
            if(get_player().get_HP() < 1)
            {
               outputText("挣扎着想站起来");
            }
            else
            {
               outputText("挣扎着想控制住自己的胯下");
            }
            outputText("。");
         }
         else
         {
            outputText("你告诉精液女巫，你愿意自愿帮忙扩充人数。她对你露出微笑。");
         }
         outputText("[pg][say: 让我来帮你一把，]身披长袍的美人低声说道，灵巧地脱下你的[armor]，让你赤裸裸地暴露在她随意的抚摸和淫邪的目光之下。[saystart]多么可爱的" + get_player().mf("male","hermaphroditic") + "样本");
         if(get_player().cumQ() > 1000)
         {
            if(get_player().balls > 0)
            {
               outputText("，还有如此雄壮、被精液涨满的睾丸。绝对是个优秀的种马！");
            }
            else
            {
               outputText("，还有如此充满雄性的身体！绝对是个优秀的种马！");
            }
         }
         else
         {
            outputText("，可惜雄性气概如此可悲。");
         }
         outputText("只要再施一点魔法，你就会很适合和我一起孕育女儿了。也许如果你表现够好，我还会允许你让我的子宫受孕。[sayend]");
         outputText("[pg]精液女巫纤细的手指划过你起伏不定、疲惫不堪的身体，解释道：[say: 在进入有趣的部分之前，先让我们看看怎么把你调整到合适的状态。]你");
         if(get_player().get_HP() < 1)
         {
            outputText("你一边低吼，一边用力挣扎，仍然试图反抗，尽管你知道这根本毫无希望。");
         }
         else
         {
            outputText("你呻吟着抚摸自己，想让她看看你已经多么“有兴致”了。");
         }
         outputText("她亲昵地揉乱你的[hair]，啧啧说道，[say: 好啦，好啦，你还以为自己有得选，这点倒是挺可爱的。不过你真的该乖乖躺好，让我来处理！]");
         outputText("[pg]精液女巫卷起袖子，有节奏地比划起来。每一个动作，都有磷光般的火焰从她的指甲拖曳而出，而你被一股股虚幻的力量托起，升到了空中。你就这么悬浮了片刻，随后一道发光的能量拂过，你横向滑到了一张长凳上，那股魔法也逐渐消散，将你轻轻放在坚硬的木面上。就这样暴露在外，[eachCock]有力地挺立起来，仿佛是在展示自己，等着接受检查。而就现在的情况来看，恐怕还真是如此。");
         outputText("[pg]黑皮肤的施法者打了个响指，发光的力场束带便缠住了你的胸膛、手腕、上臂和[feet]，其束缚效果丝毫不逊于任何刑架。你短暂地挣扎了一下，可你自己也说不清是想挣脱，还是想抚摸自己。这真的重要吗？无论如何，你都被绑住了，赤身裸体，无助而又兴奋。她轻柔地抚摸着你[chest]上的[skinfurscales]，用安抚般的语气低声哄道，[say: 放松，我强壮的朋友。你毫无疑问是一路奋战才来到这里的，但现在，你只需要放松。]");
         outputText("[pg]柔软的触感掠过你的肚脐，绕着你的腰腹游走，避开正中那块敏感而坚硬的肉，转而沿着你的[legs]抚去。[say: 感觉到我的触碰有多么舒缓了吗？像这样被按摩，是不是让人彻底放松？你的肌肉就这样……松弛下来，紧绷感从你的[feet]流走，只留下舒适。]你想要抵抗，但在一路奋战到这里又落败之后，这感觉实在太他妈舒服了。你的[legs]不顾你的意愿放松下来，任由紧绷感消散。她继续动作，而你因这出乎意料的愉悦叹了口气。");
         outputText("[pg]接着，女巫一路揉回你的[hips]。她说道，[say: 我要沿着你的身体一路向上，每揉到一处，你都会释放出更多积压的紧张。]正如她所说，你的身体从腰部以下开始变得像软泥一样——成了过去那个自己的无力仿品。那份柔软甚至感染了你的[cocks]，夺走了它们原本的一部分硬度。你叹了口气，不知不觉放下了戒备。你已经输了，而如果这个女人在随意摆布你之前还想给你按摩一下，那为什么不好好享受呢？");
         outputText("[pg][say: 事实上，你现在已经放松到不需要我的触碰，那种美妙而柔软的感觉也会继续向上蔓延。你能感觉到一双娴熟的手指正在为你身体的每一处排解紧张，让你从深处彻底放松，]你的俘获者如此指示着，同时把手从你身上移开。她的话语听起来无比真实，你的手臂也逐渐失去力气，像身体其他部分一样软了下去。那份美妙的放松进入你的躯干，你愉快地呼出一口气。");
         outputText("[pg][say: 放松极了，]女巫低声呢喃，[say: 你已经释放了这么多紧张，开始变得疲倦了，非常、非常疲倦，以至于你的眼皮都开始往下垂。它们很沉，对吧？不用回答。只要感受它们正被拖拽着往下落，就像挂上了铁块一样，拉着你的眼皮合上。]");
         outputText("[pg]你努力保持清醒，可那么多舒缓爱抚的余韵仍停留在你的[skinfurscales]上，再加上那沉重的坠力不断把你往下拉……往下。你眨了眨眼，勉强睁开一半。下一次闭上时，它们便再也没有睁开，只留下你沉浸在那想象中的按摩里。");
         outputText("[pg]随着你的心跳放缓，宁静的感觉充满了你的身体，而你开始疑惑她究竟打算什么时候进入性爱的部分。[say: 现在，别思考。只要放松。你这样感觉很好，而闭上眼睛之后，你就能完全专注于这份愉悦，并聆听我的声音。现在你能如此清楚地听见我，以至于我的声音仿佛从你体内传来，随着每一句事实渗入你放松的身体与思绪里。是不是很舒服？如果是，那就随意沉得更深，让这舒缓的话语之声不经思考、不带疑问地流入你体内。]");
         outputText("[pg]……等等，什么？你皱起眉头，试图更仔细地听她的话，弄明白刚刚发生了什么，但她的手指瞬间按上你的额头，将你的忧虑按摩得烟消云散。在她的触碰下，你的脸明显放松下来，呼吸也变得缓慢而平和。[say: 乖[boy]，]精液女巫用甜得发腻的语调说道，[say: 既然你现在这么乖巧又容易接受，那我们就稍微加快一点进度，好吗？]");
         outputText("[pg]魔法的火花闪烁明灭，亮到足以透过你眼皮的黑暗被看见。它们向上移动，围绕着女术士的手指盘旋，随后随着她坚定的按压钻进你的头颅。对你来说，唯一的变化只是光芒消失了，或许还有一种更深的宁静感——一条柔软的幸福毯子覆在你身上，在杂念萌生之前便将其熄灭。你顺从而易于接受，敞开自己去感受、去聆听，却无法组织出属于自己的清晰念头。[say: 完美。]");
         outputText("[pg]一场由话语、信息和指令组成的讲授开始了，不过到了第三段时，你的意识便不再留意它们，而是任由它们不受阻碍地塑造你。不知何时，那些按摩的手指抽离了。这并不重要，因为按照先前的指示，你仍然能感觉到它们停留在你的肉体上，将你心中的任何担忧或不和谐抚平。你内心某个不断缩小的部分仍在躁动并试图抗拒，但每一次都会被抚平，然后被遗忘。随着每一份被压倒的抵抗，它都变得更弱、更小，也更不堪一击，要更久才会再次冒头反抗。");
         menu();
         addButton(0,"下一步",beACumPumpPartII);
         get_player().orgasm("Generic");
         dynStats(DynStat.Lib(100),DynStat.Sens(100));
      }
      
      public function cumWitchBlessed(param1:Boolean = true) : void
      {
         clearOutput();
         outputText("你做出了选择，俯下身坐在自己的[legs]上，脸正好对准她那根湿淋淋的黑曜石般肉棒，适合为她口交的高度。你仍能闻到刚干过小穴的气味，像某种淫靡的雾气般萦绕在她的肉棒周围。她款款走近，宽阔的乌黑臀部催眠般摇摆着，而她男性的一半也如钟摆般晃动，越来越近。她的双手落在你头上，缓慢地抚过你的[hair]，同时将冠状沟顶上你的上唇，让上面的汁液抹到你的鼻下与脸颊上。那十一英寸的尺寸在你脸侧愉悦地搏动着，血管清晰地凸起；你低头看向她那对橙子大小的精液工厂，它们被紧紧包在下方光滑的囊袋里。");
         outputText("[pg]你不假思索地伸手爱抚那沉甸甸的一包，手指绕住这女人柔软的阴囊，来回揉动那肿胀的睾丸。那位黑肤美人抓住自己的肉棒，把它横压过你的鼻梁，伸到你双眼之间，再贴上你的额头，逼得你斗着眼去欣赏它。一阵电流般的酥麻从她指尖传入你的头皮，让你的思绪短暂地宕机了一瞬。");
         outputText("[pg]……她的肉棒真美。光是看着它，你就口水直流。你舔了舔嘴唇，随后犹豫着伸出舌头，舔舐她那神圣肉棒最下方的部位。她汗水和凝结在上面的雌性淫液味道浓烈得让你发颤。又一股力量的震颤滑入你体内。味道<b>太棒了</b>！你把口水涂得它到处都是，试图把她那陈旧、耗尽的精液滋味全都卷到舌上，双眼紧盯着那根勃起物，看着它沿你的鼻梁滴下一道充满欲望的液痕。它喜欢你！知道自己如此出色地取悦了它，一阵狂喜的战栗掠过你的脊背。你小心翼翼地握住它，往后拉开，好让整根东西笔直地塞进你的嘴里。");
         outputText("[pg]当它穿过你的双唇，压过你扭动的舌头，顶进你喉咙深处时，你已经不在乎这笔交易到底能不能换来祝福了。她那完美的鸡巴就含在你嘴里，待在它该待的地方；你发出一声纯粹而神圣的兴奋低吟。你前后吞吐着，欣赏自己的唾液如何起沫，又如何在口交时把她那根光辉的肉棒润得发亮。有几次，你差点被它噎住，但当你含着她的肉棒咳嗽时，精液女巫的双手又将熟悉的酥麻按摩进你体内，压下了所有这样的担忧。下一次你向前吞去时，你让她一路顶进你的喉咙深处，而让她操弄你的喉咙感觉实在太舒服了。");
         outputText("[pg]你费力将目光从她的粗硬上移开，天真地仰头看向她，同时仍慢慢捏着她逐渐充盈的阴囊——此时那两颗卵蛋每一颗都大得足以塞满一只手。这位精液术士露出淫荡的笑容，开始摆动臀部，操弄你的嘴。你任由她掌控，并把嘴唇抿成一个紧紧闭合的“O”形。精液女巫把你的嘴操得越来越快、越来越狠，叹息着说道，[say: 啊，你的嘴又好又湿。这么紧的小肉洞——很快就能得到我的祝福了，贱货。这不让你开心吗？]");
         outputText("[pg]你发出一声表示同意的低哼，在被她使用时嘴角向上皱起，露出笑意。感觉开始变得真的很舒服，就好像你的喉咙真的是一只小穴，一只饥渴、渴求肉棒的骚穴，需要被她粗大的乌黑肉棒又深又久又狠地犁开。它正把一长股一长股被浪费的前精滴进你肚子里，还带着令人愉悦的酥麻，预告着即将到来的浓精。你尽力晃动舌头来增强那份触感，每过一刻都变得更加火热、更加饥渴。");
         if(get_player().tongue.type > 0)
         {
            outputText("你那非人的舌头越伸越远，沿着女巫鼓胀、充满前列腺液的尿道一路追向她的卵蛋，在那里卷住它们，用湿滑的唾液将它们包裹起来。你能在她皮肤上尝到她独有的味道，这让你因兴奋而浑身发颤。");
         }
         outputText("[pg][say: 操，希望你已经准备好接受祝福了，]那位呻吟着的扶她一边抽出肉棒一边宣布道。她一只手仍握着自己那根美味、浸满唾液和精液的鸡巴，在泡沫般的混合液中套弄着，同时看着你那娼妓般撅起的双唇。另一只手仍留在你的头发里，几乎持续不断地传来酥麻感，而你则准备迎接她的涂抹——那份你一直渴求的完美馈赠。你的欲望已经攀升到难以忍受的程度，让你的");
         if(param1)
         {
            outputText("[eachCock]不停滴下、淌出你自己的精液，落到地板上。你体内的热意滚烫到让你无法再把情欲关住，它正从你的[balls]里缓缓沸腾而出，化作一场充满快感却唯独无法带来解脱的高潮。你很确定，只要碰一碰自己，就能获得一次真正的高潮，但你把手放在它们该在的地方——她的卵蛋上。");
         }
         else
         {
            outputText("你的[vagina]");
            if(get_player().wetness() < 3)
            {
               outputText("滴下");
            }
            else if(get_player().wetness() < 4)
            {
               outputText("淌出");
            }
            else if(get_player().wetness() < 5)
            {
               outputText("渗出");
            }
            else
            {
               outputText("喷溅出");
            }
            outputText("你湿润的分泌物流到下方的地面上。你确信只要碰一下阴蒂，就能让自己爽到脑子都快融化，但你还是把双手按在她的睾丸上。");
         }
         outputText("[pg]她完美而光亮的龟头忽然张开，神圣的液体随之涌出。你张开嘴，想用舌头接住它，尝尝那完美的味道，可它却啪的一声湿漉漉地打在你的额头上。下一团则抹过你的脸颊，量大到已经从你的下巴滴落。她那受祝福的黏液所触及的每一处都被快感点亮，很快，你真的高潮了，在难以形容的快感中颤抖、抽搐。大团大团的精液溅满你的[chest]和小腹，甚至连[legs]也没放过，你整个人都被这东西涂满了。而当你终于设法接住一些含进嘴里时，你的舌头本身都高潮了，在口腔里痉挛、拍打，把那美味的东西搅得到处都是，随后又被你抽搐着咽了下去。");
         outputText("[pg]她继续用那亵渎般的雄性精力把你浇透，而你仰面瘫倒在地，迎来一场强烈得惊人的全身高潮。当你眨掉眼里的精液，带着傻乎乎的表情抬头望去时，你看见房间另一头，那名精液女巫正在干一名沙漠女巫，已经用不断渗出的前液填满了她的小穴。一阵嫉妒刺痛了你，但你随即意识到，她只是用魔法让你人为地渴求她的汁液。不过，你的");
         if(!param1)
         {
            outputText("子宫");
         }
         else
         {
            outputText("[balls]");
         }
         outputText("里那种充盈感提醒着你，你确实得到了自己想要的东西——哪怕她让你喜欢这件事的程度，比你本来愿意承认的还要多那么一点……");
         outputText("<b>");
         if(param1)
         {
            if(!get_player().hasPerk(PerkLib.MagicalVirility))
            {
               outputText("[pg]（获得专长：魔力雄精——每次高潮额外射出200毫升精液，并增强生殖力。）");
               get_player().createPerk(PerkLib.MagicalVirility,0,0,0,0);
            }
            else if(get_player().perkv1(PerkLib.MagicalVirility) < 3)
            {
               outputText("[pg]（专长升级：魔力雄精——每次高潮额外射出100毫升精液，并增强生殖力。）");
               get_player().addPerkValue(PerkLib.MagicalVirility,1,1);
            }
         }
         else if(!get_player().hasPerk(PerkLib.MagicalFertility))
         {
            outputText("[pg]（获得专长：魔力生育——怀孕几率提高10%，并加快妊娠速度。）");
            get_player().createPerk(PerkLib.MagicalFertility,0,0,0,0);
         }
         else if(get_player().perkv1(PerkLib.MagicalFertility) < 3)
         {
            outputText("[pg](专长升级：魔力生育——怀孕几率提高 5%。)");
            get_player().addPerkValue(PerkLib.MagicalFertility,1,1);
         }
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,855,1);
         get_player().orgasm("Generic");
         dynStats(DynStat.Lib(1),DynStat.Sens(-5));
         outputText("</b>");
         doNext(playerMenu);
      }
      
      public function cumPumpVolumeThree() : void
      {
         clearOutput();
         outputText("随着勇者被洗脑，变成了近乎只忠于沙漠女巫的精液泵，她们的数量与力量以惊人的速度增长。短短八年间，沙漠就化作了一片葱郁的森林。无论是福是祸，女巫们终于在力量上足以与恶魔抗衡。她们将影响力扩展得更远，最终");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2024) == 2)
         {
            outputText("毁灭了");
         }
         else
         {
            outputText("拯救了");
         }
         outputText("玛莱。她们的能力、数量，以及对付恶魔时积累的经验，使她们在对抗莉希丝日益壮大的大军时取得了巨大成功；又过了十年，恶魔便被彻底消灭。女巫们被尊为救世主，各族年轻女性都渴望加入她们。当然，你会让她们每一个都受孕。");
         get_game().gameOver();
      }
      
      public function chicksLoseToSandWitchesBadEndFinale() : void
      {
         clearOutput();
         outputText("<b>一段时间后……</b>");
         outputText("[pg]你微笑着，双手轻抚自己的子宫。精液女巫说到做到，很快就让你的两个子宫都怀上了，而你简直再幸福不过。自从姐妹们发现你如此热衷于产奶和孕育孩子后，便一直对你宠爱有加。起初，她们对你似乎永远爱不够精液女巫的精液这点还有些不安；但随着你产出越来越多的奶水和孩子，她们也不再担心要让你穿好衣服，或是替你擦掉皮肤上的精液。没过多久，你就搬去和她同住，成了她的住家精液便器。生活真美好。");
         outputText("[pg]你咽下一大口浓稠的精液，捧住她沉甸甸的睾丸。自从你搬进来后，它们似乎又长大了一点，大概是为了跟上你对她精种贪得无厌的胃口；不过你的黑肤情人似乎并不介意。倒不如说，她在研习法术时，很乐意让你待在她的双膝之间。你可以专心吞咽她的精液，直到被灌饱为止，而她也能得到好好钻研魔法所需的动力。哎，就在上周，她还学会了怎么让自己的精液尝起来像巧克力——那可真是美好的一周！");
         outputText("[pg]不过，当你按摩着她颤抖的睾丸，吞饮着她美味的精液时，你还是忍不住想着：[say: 生活真美好。]");
         get_game().gameOver();
         removeButton(1);
      }
      
      public function changeMindAboutBlessings() : void
      {
         clearOutput();
         outputText("仔细想了想，你拿起自己的[armor]穿好衣服，告诉这个痴迷精液的女术士，你暂时不需要她的馈赠。");
         outputText("[pg][say: 哎呀，我还以为我们能好好玩一玩呢，]这位黑貂般的诱人女子轻声咕哝道。[say: 也许你很快就会意识到自己的错误，回来接受一次正式的祝福。]她套弄着自己的粗大肉棒，直到一滴滴带着精液色泽的浓稠前列腺液再次从她流涎般的龟头口淌出。[say: 别太见外哦。]");
         doNext(playerMenu);
      }
      
      public function buyPotionConfirm(param1:ItemType, param2:int) : void
      {
         var _loc3_:Player = get_player();
         _loc3_.set_gems(_loc3_.get_gems() - param2);
         get_inventory().takeItem(param1,sandWitchMotherFriendlyMenu);
         statScreenRefresh();
      }
      
      public function buyPotion(param1:ItemType, param2:int) : void
      {
         var price1:int;
         var iType1:ItemType;
         var _g:DesertCave;
         clearOutput();
         if(param1 == get_consumables().LACTAID)
         {
            outputText("你");
            if(get_player().cor < 33)
            {
               outputText("礼貌地请求");
            }
            else if(get_player().cor < 66)
            {
               outputText("请求");
            }
            else
            {
               outputText("很不客气地要求");
            }
            outputText("她的集会提供一剂催乳剂。");
            outputText("[pg][say:你在考虑加入我们吗？我们可以用魔法更直接地完成这件事，]沙之母提议道。[say:这些沙丘对我们来说就像母亲的怀抱一样舒适，而你在我们之中的位置也可以无比惬意。]");
            outputText("[pg]你拒绝了她的提议，并再次提出想要催乳剂，这让女人的神情略微沉了下来。[say: 好吧，每瓶要 " + param2 + " 颗宝石。][pg]");
         }
         else
         {
            outputText("你向她要一些拉·博娃");
            if(get_player().cor < 33)
            {
               outputText("，脸上泛起红晕");
            }
            else if(get_player().cor < 66)
            {
               outputText("，有些迟疑");
            }
            else
            {
               outputText("，露出心照不宣的微笑");
            }
            outputText("。");
            outputText("[pg][say: 哦？你该不会是打算搬到山里去，用奶水诱得牛头人俯首称臣吧？]沙之母问道。[say: 那可必定会让你堕入腐化。]");
            outputText("[pg]你摇了摇头");
            if(get_player().cor > 66)
            {
               outputText("，不过这个念头确实相当诱人地钻进了你的想象里");
            }
            outputText("。");
            outputText("[pg][say:这很好。野兽之道能带来许多益处。比如这一种，对促进泌乳就很有用。不过，沉溺于这样的转化也有很大风险。千万别让自己迷失其中，]这位雕像般高挑的女术士警告道。[say:每瓶要 " + param2 + " 颗宝石。][pg]");
         }
         menu();
         if(get_player().get_gems() >= param2)
         {
            _g = this;
            iType1 = param1;
            price1 = param2;
            addButton(0,"是",function():void
            {
               _g.buyPotionConfirm(iType1,price1);
            });
         }
         else
         {
            addButtonDisabled(0,"是","你买不起！");
         }
         addButton(1,"否",sandWitchMotherFriendlyMenu);
      }
      
      public function beACumPumpPartII() : void
      {
         clearOutput();
         outputText("<b>*啪*</b> 你打了个哈欠，开始眨眼驱散睡意，同时用手遮住房间里的环境光。你的脑袋昏昏沉沉，就像熬夜太晚，或者又喝牛奶喝过头了一样。一只柔软的手正按摩着你的睾丸，像恋人般温柔地抚弄着那两颗圆球。它们感觉暖暖的……而且很满。");
         if(get_player().balls == 0)
         {
            outputText("等一下，你没有——之前没有——睾丸！你带着责备的目光转向那位胸部丰满的女巫，惊讶地看着新长出的囊袋慢慢绷紧，被你那些塞满精液、不断胀大的产精工厂撑得鼓起。她拍了拍你新近充盈的阴囊，评论道，[say: 我必须确保你足够有生育力……另外，我也得确保你只会为我们生下女儿。我们不需要那么多像你这样的家伙，我忠诚的" + get_player().mf("stud","cum donor") + "。]");
         }
         else if(get_player().cumQ() < 3000)
         {
            outputText("精液女巫轻轻晃了晃它们，微笑着看它们继续变大、肿胀，里面充满了饱满成熟的精种。她说道，[say: 把一个没用的入侵者变成对社会有贡献的一员，还有什么比公牛般的生育力，以及足以孕育一支女性大军的精种更合适呢，对吧，种马？]");
         }
         else
         {
            outputText("精液女巫轻轻拍了拍它们，说道，[say: 没必要去破坏完美……至少不该超出必要范围。我们可不想让你生出任何男孩，对吧？]");
         }
         if(get_player().balls < 2)
         {
            get_player().balls = 2;
         }
         outputText("[pg][say: 也许再稍微多一点，]这个充满欲望的女人一边揉着你的睾丸，一边带着气息吐出话语。你的囊袋绷得更紧了些，皮肤变得光滑发亮，毫无瑕疵，完美无缺。她以母亲般的细心按摩着那两颗肿胀的圆球，而它们似乎变得更沉、更满。她摆弄你的宝贝时，你发誓自己能听见里面晃荡的声音，那里面充满了浓稠的精种，满到几乎带来痛感。你的背弓了起来，臀部随之抬高，渐渐有些投入其中，而你的欲望也随着不断胀起的勃起一同攀升");
         if(get_player().cockTotal() > 1)
         {
            outputText("");
         }
         outputText("。当然，这个邪恶的女巫直到这时才放开你。[say:我看起来像这附近那些饥渴求精的丫头吗？]");
         dynStats(DynStat.Lust(get_player().maxLust(),DynStatOp.Eq),DynStat.NoScale);
         outputText("[pg]听到这话，几分挥之不去的担忧猛地涌上你被欲望搅昏的脑海。你被催眠了！更糟的是，你几乎什么都记不起来，更别提自己是怎么来到这里的了。另外，虽然没那么迫在眉睫，她还对你做了什么手脚，让你只能孕育出女性后代。你记不清太多事，但你知道这绝不对劲。你猛地跳起来，急着远离这个女人——尽管她如此迷人又撩人，差点被自己的[feet]绊倒。你把后背紧紧贴在墙上，呼吸越来越急促，拼命在意识里搜寻一个解释。");
         outputText("[pg]那个深色皮肤的女人——看起来熟悉得不可思议——平静地走近你，带着歉意说道：[say:哦，亲爱的，这对你来说一定很难接受。来，坐下吧。我保证不咬你。]");
         outputText("[pg]你很不情愿地坐了下来，警惕感在血管里奔流，先前还勃起的阳具");
         if(get_player().cockTotal() > 1)
         {
            outputText("们");
         }
         outputText("因惊讶与恐惧的冲击而萎软下去。");
         outputText("[pg][say:你刚刚完成了精液女巫的入门仪式，而它显然给你造成了很大的创伤。十年前，你诞生出来就是为了协助我履行职责，而今天，你的潜力终于迎来了圆满的实现，]她用半垂的神秘双眼解释道。你听得皱起眉头——你明明记得自己是在别的地方出生的，身边有男女两性的朋友……那是个很快乐的地方。");
         outputText("[pg][say:坏泵泵，]女巫看见你皱眉思索时说道。下一瞬，你便叫出声来，猛烈地射了出来。你的双眼因快感而上翻，[eachCock]喷发了，即使还处于软趴趴的状态，也把精液喷得满[legs]都是。你一波接一波地射着，在地板上积成一滩又一滩，把你那惊人的卵袋里每一滴精华都榨干，甚至榨出更多。极乐冲刷过你的大脑，把那些念头和疑问一并带走，直接从你体内泵到地板上，任它们被冲进排水口。直到你的疑问被快感彻底碾碎，你才被允许停下，沉入流着口水、全然顺从的状态。");
         outputText("[pg]当你回过神来时，你笑了，轻轻叹息，为你的女主人屈尊让你射精而感到高兴。你一定是做了什么特别棒的事，才配得到这样一场突如其来的高潮！现在，你刚才在做——哦对，她正在提醒你，为什么你愿意让她修整你的卵袋！你微笑着告诉她，你已经完全冷静下来了，可以继续。");
         outputText("[pg]这位一反常态的金发性感尤物清了清嗓子，然后继续说道：[say:对，正如我刚才所说，你是为此被培养出来的，而今天，你已经踏上了解放全部潜力的道路。你是我的学徒" + get_player().mf("巫师","女巫") + "，有这么合适的工具，还有经过魔法强化的卵袋，你会做得很好的。现在，既然你已经射过了，你的第一项任务就是学习雄性咒。拿着这本典籍学会这个法术，然后对自己施放不少于十二次。]");
         outputText("[pg]你的女主人把书递给你，并保证道：[say:越多越好。等你再也承受不住时，我会带一个姐妹来让你受孕。]你开心地点点头，起身跌跌撞撞地走到附近一张书桌前。法术书是新的，但上面的文字却古老异常。你迫不及待地研读起来，像海绵一样吸收着新的知识。说真的，你的大脑吸收新信息的速度快得有些滑稽，简直像是其中大片区域都被清空过，专门腾出来学习一样。不到一个小时你就学会了这个法术，尽管你的任务因为女主人正忙着在一个吵闹女巫的每个洞里猛烈抽插而变得更加困难。");
         outputText("[pg]完成任务的第一部分后，你开始着手第二部分。你用紧张而颤抖的双手施放法术，努力不在半句咒文中途响起一声炽热的[say:哦，诸神啊，就是这样！]时失去专注。你维持住了集中，魔力的奔流冲刷过全身，让[eachCock]硬挺到半勃起的状态。前液从你的精缝中汩汩滴落，而你的[balls]以惊人的速度重新充盈。仅仅施放一次就变成这样……你要怎么撑过十二次？");
         outputText("[pg]你的老师把一个灌满精液的女巫推倒在地，她的肚子膨胀得有些滑稽。两股精液从她被用得发软的小穴里喷出，与另一道从她被蹂躏过的后门中淌下的液流相映成趣。看来除了惯常的授精以外，你的女主人几乎没花什么时间享受个人快感。她赤裸着身体，浑身闪着爱液的光泽，款款走来。她用声音鼓励你：[say:继续。施得再快些。如果你连区区十二次雄性咒都承受不住，那就不配做我的学徒。]");
         outputText("[pg]不！你闭上眼睛开始吟唱，以最快速度念完法术。每一次完成后，你都咬紧牙关重新开始。到了第四次咒文时，欲望已在你体内奔流，让你难以集中精神——那时你已经彻底硬了，卵袋也前所未有地胀满，但你压下那股乱窜的情绪，专注于眼前的任务。五次……六次……七次，你已经成功施放到了这里！长凳被你不断渗出的前液弄得黏糊糊的，让你紧张地坐立不安，肿胀的卵袋拖过自己流出的汁液。下一次奥术仪式让你因渴求而颤抖。你紧紧闭着眼，试着冲击第九次，因为你知道，只要偷偷瞥上你的双性人女主人哪怕一眼，你就会失控，求她来操你。");
         outputText("[pg]这个念头让你一阵发抖，差点当场屈服；你那肿胀的喷精肉棒此刻已经不停漏着液。你的身体里充满了咸腥的浓精，以至于它被迫源源不断地流出来，像是一场淫乱的仿制高潮；而当你完成第九次、第十次、第十一次施法时，这股流淌只变得更强。你在快感与痛苦的渴求中颤抖，但当你开始念出第十二次、也是最后一次咒文时，女巫打断了你。");
         outputText("[pg][say:停下！]她喊道，指向你那根悸动着、不断喷吐精液的勃起肉棒");
         if(get_player().cockTotal() > 1)
         {
            outputText("");
         }
         outputText("，[say:我没想到你能走到这一步。你的意志确实强大，[name]，但我交给你的任务，连我自己都从未做到过。十次就是我的极限了。我还不想让你这么快就伤到自己。]她拉开帘子，吼道：[say:下一个！]");
         outputText("[pg]另一个女人走了进来，她有着橄榄色的肌肤，丰满下垂的乳房大得仿佛把身体都压沉了。她迟疑地看了你一眼。双性人微笑着点头，示意她靠近你。此刻[EachCock]看起来就像一座精液火山，笼罩在永不停歇的乳白色精液泡流中。你的卵袋胀得滚圆，肉眼可见地翻涌着，即使已经被精液塞到不能再满，仍在继续产出更多。这个巨乳乳汁女巫皱起眉头，但还是不情愿地跨坐到你身上，轻松地沉坐在你满是精液的权杖上。");
         if(get_player().smallestCockArea() >= 100)
         {
            outputText("你正在缩小的阴茎让插入稍微容易了些。你敬畏地看向沙漠女巫，注意到她发光的双手。她心照不宣地朝你眨眨眼，转身离去，法术已经完成，只留下你尽情享受。");
         }
         outputText("[pg]新来的女巫那对巨乳压到你脸上，在她开始骑乘你如喷泉般涌动的勃起时，喷溅的乳汁也抹了你一脸。");
         if(get_player().cockTotal() > 1)
         {
            outputText("她丰硕的屁股被你其余[cocks]流出的黏液彻底抹满，在你那魔法般的雄性精力染出的白色中闪闪发亮。");
         }
         outputText("她骑在你身上，技巧出人意料地娴熟，完全不像是那个对如此健康的精液产量还显得有些迟疑的人；她的四只乳房紧紧挤压着[chest]。她紧致的小穴在你周围收缩、颤动，被白浊浸透，彻底被精液润滑，还贪婪地渴求更多。");
         outputText("[pg]你已经被挑逗得欲火焚身，短短几秒就射了出来，弓起后背，抓住她柔软丰满的屁股来稳住自己。你的精液如巨浪般喷涌而出，第一波爆发就轻易填满了女巫的第一个子宫，强劲的冲力甚至让她的腹部鼓胀起来。她叹息一声，不知从哪儿挤出力气抬起身子，随即又用第二个小穴坐回你身上。你在几秒内就把那个子宫也灌满，大股乳白色的精液把她原本平坦的小腹撑成了怀孕般的精液圆球。她在高潮中尖叫，虚弱地趴在你身上抽搐，浑身软得像块湿抹布。很快，她被灌得太满，只能从你身上滑落到地上，离开时一股白色长河从她胯间猛然涌出。她满怀感激地俯身想亲吻你的阴茎，却给自己糊上了一层白色面具；既然亲吻失败，她干脆用四只乳房把它全都裹住。你的肉棒被滑腻的乳房彻底包住。在你那魔法般的雄性精力终于慢慢减弱成愉悦的细流之前，你把她的乳房全都镀上了一层白浊。");
         outputText("[pg]还在喘息的女巫叹道，[say: 谢谢，]接着转向那名微笑着的双性人，[say: 他会……我想他会很合适的……天啊，我被灌满了。]她紧张地摇晃着离开，临走时还朝你眨了眨眼，带着几分性感的摇摆。你已经等不及再找机会和她来一次了！");
         menu();
         addButton(0,"下一步",cumPumpVolumeThree);
      }
      
      public function askHowSandMothersAreChosen() : void
      {
         clearOutput();
         outputText("你询问沙之母，她们的族人是如何决定谁会成为新集会的沙之母的。");
         outputText("[pg]这位高挑的女人苦笑着一撇嘴：[say: 当然是政治。]政治？她看见你脸上困惑的表情，解释道：[saystart]这不该让你惊讶。你");
         if(get_player().get_race() == "human")
         {
            outputText("是人类");
         }
         else
         {
            outputText("曾经是人类");
         }
         outputText("。我们的族人向来以结成帮派和小圈子而闻名，那些团体往往围绕某位领袖的个人魅力而形成。这种习性延续到玛瑞斯也很自然。就算有人告诉我，连恶魔都有自己的派系和政治上的不满分子，我也不会惊讶；不过我想，她们处理这种人的手段可比我们严厉得多。[sayend]");
         outputText("[pg]沙之母随意地挥了挥手，说道：[say: 当一个集会变得稍微太庞大时，沙之母就会宣布建立一个新的集会。通常到这个时候，更富冒险精神、也更有野心的女巫们会开始把志同道合者聚集到自己身边，她们都会试图讨好自己的沙之母，好确保她们所支持的领袖能够晋升。]她先将指尖相抵，随后又十指交握。[say: 即便是最受欢迎的团体，也不总能如愿。最终，这取决于伟大母亲或沙之母的决定；有时候，她也只是会选择一个受宠的女儿。]");
         outputText("[pg]那样不会招来某个潜在强敌的怨恨吗？你把疑问说了出来。");
         outputText("[pg][say:哦，那是肯定的。不过，不满这种东西不能任由它滋长。被精液女巫悉心照料几个月，再生下一批新生儿，往往能抚平政治分歧。从某些方面来说，我们就像这个世界的蚁女。我们必须为了更大的利益而协作，否则就会衰亡。每个人都有自己的位置，]她如此宣称，语气或许有些过于自豪了。");
         outputText("[pg]你若有所思地摸着下巴，感谢她提供的信息，同时琢磨着她们这些奇怪的做法。她们放弃了几乎所有最私人的自主权和自由，换来一个更强大、更紧密的整体。你不太确定这是不是个好主意，但也拿不出别的替代方案。");
         sandWitchMotherFriendlyMenu();
      }
      
      public function answerWrong() : void
      {
         clearOutput();
         outputText("[say: 那……恐怕不对，]她说道，唇边浮现出得意的笑容。[say: 错、错、错。好吧，也许到头来是</i>我<i>看错了</i>你<i>……我还以为你会挺有趣呢。不过至少你的身体应该能很好地为我所用。嗯，你会很合适的。来吧，亲爱的，把你的[armor]脱给我看。毕竟，交易就是交易……]");
         menu();
         addButton(0,"屈服",sphinxSubmissionOptions).hint("向斯芬克斯屈服。毕竟，交易就是交易。");
         addButton(1,"呃，攻击！",fuckItAttack).hint("去他的！你也许输掉了谜题，但绝不会让萨努拉对你为所欲为。");
      }
      
      public function answerCorrect() : void
      {
         var _loc1_:* = null as IMap;
         clearOutput();
         if(int(riddlesChosen.length) < 3)
         {
            outputText("斯芬克斯少女叹了口气，[say: 那是……正确答案。还不赖嘛。不过，我们还没结束……我袖子里还藏着几手呢。呃，打个比方。]");
            menu();
            addButton(0,"继续",riddlePicker);
         }
         else
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,835) == 0)
            {
               outputText("[say: 什、什么！？]你正确答出了她最后一道谜题，斯芬克斯倒吸一口气。[say: 我、我不……可是怎么会？从来没有人聪明到能答对三道谜题！]");
               outputText("[pg]她花了点时间让自己镇定下来，然后轻轻耸了耸肩，[say: 好吧，那<i>确实</i>出乎意料。抱歉，我其实从没想过你会赢……不过，我确实答应过要给你努力的回报。我是萨努拉，]她躬身行礼，而你忽然看见她肩后的一座沙丘表面浮现出一扇小门。[say: 你可以随时进入沙漠女巫的巢穴。或者……如果你愿意的话……我的身体也任你处置，]她俏皮地补充道。");
            }
            else
            {
               outputText("[say: 啧，我又输了！]萨努拉撅起嘴，抱起双臂。[say: 看来你只能给我来一场胜利者的蹂躏了，不是吗？不过下手轻点……你已经伤到我的自尊了，所以……]");
            }
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,835,FlagDict_Impl_.arrayReadInt(_loc1_,835) + 1);
            outputText("[pg]你要怎么做？");
            menu();
            addNextButton("上她",fuckDatSphinx);
            addNextButton("返回",moveToEntrance);
         }
      }
      
      public function TwoExpensive4Me() : void
      {
         clearOutput();
         outputText("你解释说自己付不起这么多。");
         outputText("[pg]沙之母耸耸肩，说道：[say: 那就等你付得起的时候再来问她吧。]她没等你回答便离开了，只留下你和那个产奶女孩站在那里。");
         outputText("[pg][say: 洗澡时间？]");
         doNext(runFunc);
      }
      
      public function TDMsLoseToCumWitchScene() : void
      {
         clearOutput();
         var _loc1_:int = get_player().cockThatFits(get_monster().vaginalCapacity());
         if(_loc1_ < 0)
         {
            _loc1_ = get_player().smallestCockIndex();
         }
         outputText("长袍已经被丢在一旁，精液女巫则得意地站在你身体上方。一根晃动的肉棒擦过你的脸旁，挺得笔直，迫不及待地想要被服侍。这个双性人懒得和你废话，粗暴地把你按倒在背上。她打了个响指；弯曲的石带从地面猛然弹出，缠住你的四肢，把你牢牢捆在地上。很明显，不管你愿不愿意，你马上就要被干了。你抬头望去，只见这个黑肤女人脸上挂着神秘的微笑，利落地脱下你的[armor]。转眼间，你的" + get_player().cockDescript(_loc1_) + "就被她坐了上去。");
         if(get_player().cockTotal() > 1)
         {
            outputText("[pg]你的" + get_player().cockDescript(_loc1_) + "深深埋进她唯一的小穴后，女巫探手从丢在一旁的长袍里取出几个小布袋。她注意到你的困惑，便笑了笑，却没有解释，只是把一个布袋套在");
            if(get_player().cockTotal() == 2)
            {
               outputText("你的另一根阳具上。");
            }
            else
            {
               outputText("其余的[cocks]上。");
            }
            outputText("骑在你身上的扶她依旧神秘地微笑着，再也没有把半点注意力分给你的下体。");
         }
         outputText("[pg]做完这些，你的袭击者短暂地露出专注的神情，然后说道：[say: ！的我成变将液精和男根的你]魔力击中了你，[eachCock]忽然失去知觉；紧接着，你意识到了一根陌生的附肢。它感觉像是从你胯下长出来的，也感觉像一根肉棒，但它并不是");
         if(get_player().cockTotal() > 1)
         {
            outputText("你的其中一根");
         }
         outputText("你的……");
         outputText("[pg]你再一次抬头看向精液女巫那仿佛洞悉一切的神秘笑容，一阵恐惧顺着你的脊背爬下。她用一根修长的黑色手指轻轻点了点自己的鼻尖，然后引着你的意识落到她晃动的肉棒上。她轻轻抚弄了一下它，你这才意识到自己刚才感知到的究竟是什么。你正像感受自己的肉棒一样感受着她的肉棒！从这位黑肤施法者的笑声来看，你脸上的震惊和错愕已经写得清清楚楚，任谁都看得出来。");
         outputText("[pg]这名可怕的扶她开始挑逗自己肉棒的龟头，绕着顶端画出一个小圈。你的身体本能地想往上顶向她。可惜，这并不会增加她肉棒上的刺激，而你自己的下体依然什么都感觉不到；唯一的回报，就是看到她丰满的乳房在你面前晃动。[say: 很难受吗？]她仍然笑着问你。[say: 想射出来吗？]挑逗还在继续，却只给她的整根肉棒带来最轻微的刺激。你愤怒地低吼一声，拼命挣扎着想摆脱压住你的砂岩束缚，迫切地想获得更多刺激。[say: 哦，看来你很想。很好。那我有个好消息要告诉你。别担心，马上就能如愿了。]你已经快受够她脸上那副一成不变的神秘笑容了。");
         outputText("[pg]你的注意力忽然被拉向");
         if(get_player().balls > 0)
         {
            outputText("你男性部位中唯一还能感觉到的部分——你的[sack]。");
         }
         else
         {
            outputText("[eachCock]根部后上方的身体部位，大概是你的前列腺。");
         }
         outputText("[pg]这感觉很奇怪。那里又麻又紧，像是被压缩起来，仿佛一根被拧得过紧的弹簧。你感觉自己体内所有精液都在被挤出来，但这并不是高潮；更像是你正在积蓄某种更庞大的东西。这种感觉真的很难形容，但确实很舒服。");
         outputText("[pg]她俯身靠近，脸离你只有几英寸；她唇间传来轻柔的低语：[say: 看来你现在准备好了。你还想射吗？]你表示肯定后，她打了个响指，缠住你双臂的束缚随即松开。[say: 那就让我看看你能把我的肉棒伺候得多好，]她一边说着，一边回到之前的姿势，舔了舔嘴唇。");
         outputText("[pg]你用双手牢牢握住她的肉棒，认真套弄起来。你渴望已久的刺激，终于真真切切地落在了你的指尖！大滴大滴的前液开始从顶端流出，那位会施法的诱惑者还鼓励你用她的体液来增加润滑。眼前这根美妙的肉棒上下晃动着，你急切地想从中得到更多感觉，于是把每一滴溢出的前液都派上了用场。");
         outputText("[pg]套弄那根黑色肉棒实在是种特别的体验。它和你的[cocks]感觉很不一样。");
         if(get_player().get_sens100() < 70)
         {
            outputText("首先，它比你的更敏感，而且");
         }
         else
         {
            outputText("首先，它没有你的那么敏感{are/is}，但");
         }
         outputText("她那不断滴落的前液中涌动着魔力的酥麻，这是你从未感受过的东西。更有意思的是，你现在的姿势让你握住她阴茎的方式，和你自慰时握住自己的方式截然不同。当然，最重要的是，你想把她那可爱的肉棒从头到尾每一寸都揉弄到位，并透过她那奇妙的法术感受其中的每一秒。你的精液从[balls]里被抽走的感觉，只让整场体验变得更加美妙。");
         outputText("[pg]空气中响起响亮的拍打声，你这才注意到，尽管你感觉不到自己的" + get_player().cockDescript(_loc1_) + "，却其实正试图往精液女巫的小穴里挺入。你停了下来，可那女巫却开始扭动臀部，让你的" + get_player().cockDescript(_loc1_) + "在她体内转动，同时又把她的肉棒往你的双手里挺送。你猜，虽然你感觉不到自己的肉棒在她体内，但她显然能感觉得到。");
         outputText("[pg]你现在已经接近顶点，女巫命令你把手从她的肉棒上拿开；你不情愿地照做了。一切在你眼中仿佛变成了慢动作，黑色的双手向下移动，牢牢握住你刚才还在套弄的阴茎。女巫向后仰去。她把自己雌雄同体的下体指向天空，一大股精液猛然喷射到空中。");
         if(get_player().cumQ() < 200)
         {
            outputText("[pg]一道道精液飞起数英尺高，随后如雨般洒落在地面和你们被欲望锁在一起的身体上。凡是落到沙地上的部分，都很快被饥渴的沙漠吸收，而你和那位深色皮肤的女人则被她的精液浇得满身都是。那不可能全是她的。你敢肯定，她从你体内抽出的东西也混在其中。毫无疑问，她抽出来的量比你平时一次射精要多得多。你感觉自己被彻底榨干了，");
         }
         else if(get_player().cumQ() < 3000)
         {
            outputText("[pg]从你们共同的肉棒里喷涌而出的精液足足持续了至少半分钟！一道诡异的白色精液喷泉在你们周围倾泻而下，也落满了你们全身。你和那位深色皮肤的女人都被这东西彻底浸透，可事后沙漠的沙子看起来却几乎完全干燥。你最终收获了她对你慷慨贡献的赞赏目光。你顶着黏糊糊的面具点了点头，不知为何十分确信，其中大部分都来自你[balls]标志性的巨量射精，只是不知怎么的，这次甚至比你平常释放的还要更多。你那放荡的伴侣把你榨得相当彻底，");
         }
         else
         {
            outputText("[pg]眼前一片雪白——除此之外别无他法形容。强烈的快感淹没了你的感官，感觉就像你的生命本身都正从那该死的肉棒里被泵出来。你不知道这持续了多久，但你知道，至少有好几分钟你都在射精。这场体验让你全身都浸透在滚烫黏稠的液体中。你平时就惊人的射精量，再加上女巫那诡异法术的影响，唤醒了某种仿佛精液之神震怒般的力量，而你爱死了其中的每一秒。[pg]当一切终于结束时，你抹去脸上的精液，十分惊讶地看到那些没有落在你们两人身上的最后一点精液，正迅速被沙漠的沙子吸收。你感觉自己仿佛濒临死亡，浑身上下都被彻底掏空，");
         }
         if(get_silly())
         {
            outputText("无论身体，还是[balls]里都是如此。");
         }
         else
         {
            outputText("无论身体，还是精神都是如此。");
         }
         outputText("[pg]那位浑身沾满你们混合精液的女人从你身上起身，披上了明显变得更白的长袍。她擦去脸上的液体，再次露出那抹神秘而了然的笑容，随后轻轻碰了碰你的头，在你耳边低语了些什么。又一道法术攫住了你的身体，你随即沉入深深的睡眠。");
         get_player().orgasm("Dick");
         dynStats(DynStat.Str(-1));
         var _temp_1:* = get_player();
         _temp_1.cumMultiplier = _temp_1.cumMultiplier + 1;
         if(get_player().cumQ() >= 200)
         {
            dynStats(DynStat.Str(-1));
         }
         if(get_player().cumQ() >= 3000)
         {
            dynStats(DynStat.Str(-1));
         }
         get_combat().cleanupAfterCombat();
      }
      
      public function BuyHer() : void
      {
         clearOutput();
         var _loc1_:Player = get_player();
         _loc1_.set_gems(_loc1_.get_gems() - 2000);
         outputText("你交出了两千枚来之不易的宝石。");
         outputText("[pg]沙之母打趣道：[say: 很好，把这女孩带走吧。给她自由，也保护好她。多年来她忠心服侍，早已配得上一段安逸的生活。至于我们留下的其他人……离这里不远有一座城市。我会在夜里把其他仆人送到那里。也许她们能在玛瑞斯最后一座自由之城的怀抱中找到慰藉。]");
         outputText("[pg][say: 女主人？]产奶女孩说着，目光在你和沙之母之间来回游移。");
         outputText("[pg]母亲大人露出圣洁般的微笑，跪下身，拍了拍这名奴隶的脸颊。[say: 你现在自由了，女儿。[name]会带你离开这里，去一个能让你自由又安全的地方。你明白吗，亲爱的？我不再是你的女主人了。]");
         outputText("[pg]困惑了片刻后，这个念头像是终于在她被奶水搅得迷糊的脑袋里亮了起来。奴隶女孩转向你，拼命想在自己那对巨大乳房的重压下站起身。[say: [Master]?]");
         outputText("[pg][say: 不，不是，]你一边说，一边上前托住她那对硕大奶子的重量，[say: 不是[master]，是[name]。明白吗？我是[name]。]");
         outputText("[pg][say: [name]！]她带着孩童般的欢喜重复道，在你的帮助下终于能站直身体。");
         outputText("[pg]沙之母为你打开房门，又补充道：[say: 我会派几名女儿把她的……用具送到你的营地。你得经常给她挤奶，而那汹涌的乳汁总得有地方盛放；你愿意的话，可以用个大碗。退一步说，你的营地，以及你以后招来的其他追随者，永远都不会缺奶喝。]");
         outputText("[pg]你感谢沙之母的理解，也感谢她对你这位奶水充盈的朋友所展现的善意。她点点头，黝黑的唇边带着一抹狡黠的微笑。你扶稳那位挤奶女，帮她离开这间天知道被她当成家多久的房间，走进沙漠的黄沙之中——前往营地。前往她的新家。");
         menu();
         addButton(0,"下一步",get_game().milkWaifu.arriveWithLacticWaifuAtCamp);
      }
   }
}

