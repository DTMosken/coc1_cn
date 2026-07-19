package classes.scenes.areas.forest
{
   import classes.BaseContent;
   import classes.BreastRow;
   import classes.DynStat;
   import classes.ImageManager;
   import classes.Player;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.display.SpriteDb;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.internals._OneOf.OneOf_Impl_;
   import classes.items.ConsumableLib;
   import classes.scenes.Camp;
   import classes.scenes.Inventory;
   import classes.scenes.api.Encounter;
   import classes.scenes.api.EncounterDef;
   import classes.scenes.api.Encounters;
   import classes.scenes.api._Encounters.EncounterChance_Impl_;
   import flash.Boot;
   import haxe.IMap;
   import haxe.ds.Either;
   
   public class Essrayle extends BaseContent
   {
      
      public var forestEncounter:Encounter;
      
      public function Essrayle()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
         var _loc1_:Either = OneOf_Impl_.fromA(essrayleMeetingI);
         forestEncounter = Encounters.build(new EncounterDef("essrayle",null,EncounterChance_Impl_.fromBoolFun(forestEncounterCondition),_loc1_,null));
      }
      
      public function yesGimmeGiantNipplesEssy() : void
      {
         clearOutput();
         get_images().showImage("item-pFruit");
         outputText("她会意地笑了笑，再次把手伸进小袋子，拿出一个看起来很奇怪的水果。它看起来几乎像一个李子色的茄子，但摸起来却柔软而有弹性。[say: 给你！随时都可以享用！] 她把这个奇怪的东西放在你手里。[say: 就当是我送给另一位胸部鉴赏家的礼物吧。]");
         essyRewardEpilogueOUTTIES();
         get_inventory().takeItem(get_consumables().PRFRUIT,get_camp().returnToCampUseOneHour);
      }
      
      public function plantsForMe2(param1:int = 0) : void
      {
         clearOutput();
         var _loc2_:Boolean = false;
         if(param1 == 1)
         {
            outputText("艾西咧嘴一笑，点了点头。[say: 没错。我毫不怀疑，只要在这里待得够久，它们会变得更加有趣。][pg]");
         }
         else if(param1 == 2)
         {
            outputText("[say: 呵，随你的便。][pg]");
         }
         outputText("艾西上面的手继续在你胸前忙活，把玩着，而她下面的一只手臂则在你的肚子上游走，缓慢地向下蜿蜒。当你在她性感的服侍下扭动挣扎时，她那沉甸甸的乳房突然贴到了你的脸上。[say: 凭什么所有的乐趣都让你占了？] 艾西娇嗔着，引导你的嘴凑向她那肿胀的乳头。你毫不犹豫地含住，用嘴唇顺着它的长度滑下。");
         outputText("[pg]因为它相当大，你花了一点时间才调整好姿势，但你几乎把它整个深喉了进去。艾西惊讶地尖叫了一声，当你把她的乳头完全吞入时，她呻吟出声，同时你的一只手揉捏着她另一侧乳房那几乎像面团一样柔软的肉。你用嘴唇紧紧夹住，开始拼命地拉扯吸吮。当你听到这位植物女孩发出一声长长、响亮而愉悦的“哞”声时，你短暂地惊讶了一下，紧接着，浓稠、糖浆般的乳白色汁液几乎瞬间涌入了你的嘴里。");
         outputText("[pg]她的乳汁是一种美妙的物质，尝起来像甜奶油，你急切地大口吞咽，饥渴地吸吮着想要更多。牛叫声还在继续，艾西最下面的手顺着你的腰部继续向下，最终停在你的胯部。虽然她显然被你对她乳房的关注分散了很大的注意力，但那些灵巧的手指");
         if(get_player().hasCock() && get_player().hasVagina())
         {
            outputText("找到了那里的双性器官。另一只手也加入了进来，一只手握住你变硬的肉棒拉扯，另一只手则罩住你的小穴揉捏。");
         }
         else if(get_player().hasCock())
         {
            outputText("环绕着");
            if(get_player().cockTotal() > 1)
            {
               outputText("其中一根");
            }
            outputText("肉棒");
            if(get_player().cockTotal() > 1)
            {
               outputText("");
            }
            outputText("，开始顺着它的长度挤压滑动，直到你自己的愉悦呻吟打断了你的吸吮");
         }
         else
         {
            outputText("抚摸着你那肿胀充血的花唇，用两根手指夹住花唇，顺着它们的长度上下抚摸，然后转向你湿润的花心。");
         }
         outputText("[pg]一只坚定的手托住了你的");
         if(get_player().isTaur())
         {
            outputText("背部");
         }
         else
         {
            outputText("屁股");
         }
         outputText("并将你拉近，强迫你的[legs]贴紧她的球茎。当你倒下时，它们微微陷了进去，你极不情愿地松开了嘴里的乳头。当它弹出来时，一团浓稠的汁液溅到了你的嘴唇和鼻子上。艾西轻声笑着，用手帮你擦掉。");
         outputText("[pg][say:很高兴你能享受我，亲爱的，我真的很想和你享受更多，但我现在太需要了！]艾西娇嗔道，她那颤抖的丰满双乳也随之摇晃。无数藤蔓般的触手从她背后的花朵中爆发出来，在她周围划出弧线，缠绕在你的手臂、腰部，");
         if(get_player().tail.type > 0)
         {
            outputText("尾巴，");
         }
         outputText("和[legs]，");
         if(!get_player().isTaur())
         {
            outputText("慢慢将你举到半空中");
         }
         else
         {
            outputText("强迫你直起身子");
         }
         outputText("。她下面的手抓住你，帮你抬高到合适的高度，然后她突然将嘴唇贴在了你的胯部。");
         if(get_player().hasCock())
         {
            outputText("[pg]艾西将她细长的舌头拖过[oneCock]的长度，流过它的每一寸，沿着它的曲线舔舐，从根部一直舔到顶端，然后用嘴唇将其吞没。没有丝毫犹豫，她滑到了根部，超现实的紧致感带来了惊人的快感，当你感觉到植物的喉咙在蠕动并实际上在挤奶时，你受到了冲击。");
            outputText("[pg]艾西只是微笑着开始上下摆动她的头，一开始很慢，但随着你愉悦的呻吟声鼓励她，速度越来越快。两根触手升起，顶端呈漏斗状张开，吞没了你的[nipples]");
            if(get_player().breastRows[0].breastRating >= 1)
            {
               outputText("和[breastcup]乳房");
            }
            outputText("。不透明的罩杯抽吸着，艾西自言自语地哼着歌，她舌头的根部继续熟练地挑逗着你[cock biggest]的[cockHead biggest]附近的每一个敏感点，她的长度熟练地在它周围滑动。");
         }
         else
         {
            outputText("[pg]她微笑着亲自检查你现在多汁的褶皱，她的嘴唇闭合在你的嘴唇上，舌头蜿蜒蠕动着进入你颤抖的小穴。这株植物给了你一次皇家级别的舌头鞭打，淫荡地吸吮着，嘴唇以惊人的专业技巧拨弄着你跳动的阴蒂。");
         }
         if(get_player().biggestTitSize() >= 1)
         {
            outputText("[pg]当你上下弹跳时，你的乳房狂野地弹跳和颤抖，被那些触手紧紧抓住，艾西在下面快乐地进餐。那些不透明的覆盖物在你的乳房周围起伏并用力挤压，为了");
            if(get_player().lactationQ() >= 400)
            {
               outputText("你的乳汁和");
            }
            outputText("你的快感而抽吸它们。随着时间的推移，它们抽吸的力量和节奏就像她的嘴唇和舌头一样增加。");
            _loc2_ = Utils.rand(2) == 0;
         }
         get_images().showImage("essrayle-discussion");
         outputText("[pg]另一根触手暂时在她的乳房上摩擦，沾满了汁液变得黏糊糊的，然后它绕到你身后，突然插入你的[asshole]。像个专业人士一样，她一开始慢慢来，让你适应触手深深插入时独特的粗细和轮廓。它平滑地几乎拔出，然后再次深深地抽插进去。");
         get_player().buttChange(10,true,true,false);
         outputText("[pg]没过多久，你就在高潮中尖叫起来。快感稳定地起伏，你的植物朋友发出的声音就像她在享受一顿适合蜂后的四道菜大餐。她继续在各个方面抽插你，不敢停下来，直到她确定已经把你榨干了每一滴。");
         if(get_player().cumQ() >= 500 && get_player().cumQ() < 2000)
         {
            outputText("她花了一些时间才完全榨干你强健的储备，她开心地哼着歌，一次又一次的喷射让她的脸颊鼓起，迫使她的喉咙工作。当你开始变干时，你可以发誓她作为底座的球茎看起来大了一点，也许她的乳房也是。");
         }
         else if(get_player().cumQ() >= 2000)
         {
            outputText("这有点困难，因为你那强劲的精液喷泉让她的平坦小腹变得鼓胀，而构成她底座的球茎也因为你丰沛的灌溉而迅速膨胀。精液甚至从她的嘴角溢出，她贪婪地试图吞下所有，在每一次撑开脸颊的射精中叹息着。");
         }
         outputText("[pg]你无力地挂在她的触手上，她紧紧地吸吮着你，在湿漉漉地松开之前进行了最后一次抽吸。她舔了舔嘴唇，不放过任何一滴溢出的精液，然后将你放到地上，触手松开并缩回原处。她轻轻地颤抖着，双臂抱紧自己，挤压着丰满的胸部。");
         outputText("[pg][say: 哦，是的，]她咧嘴笑着，[say: 这足够我享用一段时间了。]她看着躺在那里的你，你精疲力竭，气喘吁吁，努力想要恢复平静。她温柔地微笑着，伸长了球茎上的茎干，像娜迦一样轻松地伸展过来，“坐”在你的身边。她的手滑过你的额头，擦干汗水，轻轻地梳理着你的[hair]。");
         outputText("[pg][say: 谢谢你的好意，陌生人，]她伴随着每一次抚摸轻柔地低语，雾气慢慢消散。[say: 我很想留下来享受你一两个星期，但我真的该走了；这里还有很多东西要看要体验。]艾西咧嘴笑着，俯下身再次温柔地吻了你，停留了片刻才直起身，依然对你微笑着。[say: 不过嘿，也许我们什么时候还会再碰面，谁知道呢。]她眨了眨眼，咯咯笑着回到了球茎里平时的位置。");
         outputText("[pg][say: 祝你冒险顺利，但别忘了给自己留点时间。]她咧嘴笑着，挥了挥手，然后转身离开，臀部随着步伐诱人地摇摆着离开了这片区域。");
         if(param1 == 1)
         {
            outputText("[pg]艾西在离开空地前突然停下了脚步。她慢慢地在原地转过身，微笑着。[say: 话说回来，吃霸王餐可太没礼貌了。不如我给你一点小小的奖励，感谢你的好意？]她轻声咯咯笑着，再次靠近你，将她绿色的乳房压在你的胸前，用她那柔软的丰满覆盖了它们。你刚要开口，她的手指就落在了你的嘴唇上。[say: 嘘，]她微笑着让你安静下来。");
            outputText("[pg]那对巨大的乳房开始在你的胸前摩擦，肿胀的乳头在缓慢的圆周运动中让你感到温暖，而它们的主人则一直会意地微笑着。这感觉开始变得令人舒缓，甚至有些好玩，直到一股突如其来的压力紧紧抓住了你的[nipples]。感觉就像它们被包裹在一些紧绷的管子里，被紧紧挤压，但并不痛苦。");
            outputText("[pg]出于好奇，你低头看向压力的来源。那些晃动的假乳头不见了，再往下看，一个巨大的紫色乳头似乎正肥厚地挤压着你那较小的乳头，轻松地将其吞没。快速瞥了一眼，你确认其他");
            if(get_player().totalNipples() > 2)
            {
               outputText("的");
            }
            else
            {
               outputText("的");
            }
            outputText("也被吞没了。");
            outputText("[pg]在你的眼前，这位植物少女的乳房似乎突然膨胀起来，随着它们同样突然地缩小，艾西发出了一声愉悦的叹息，一股温暖的压力突然涌入你的胸膛。令人惊讶的是，在感觉到这种感觉后，你自己的乳房似乎也膨胀了一些，并没有像她那样简单地缩回原状。当她上面的两只手移到你变大的乳头上，开始挤压敏感的肉体，用力揉捏时，你的理智被彻底摧毁了。");
            outputText("[pg]随着这种超现实的体验继续，你的[legs]再次颤抖起来。压力随着那对芬芳的绿色乳房的每一次跳动而增长，你自己的乳房也随着它们的每一次脉动而变大。第三只手顺着你的脸颊梳理，埃斯蕾尔对你甜美地低语。[say: 放松，]她轻声说，[say: 放松，好好享受。]");
            outputText("[pg]随着你胸部的重量稳步增加，她的双手抓住了你，让你在这个令人愉悦的过程中保持站立。");
            if(get_player().bRows() > 1)
            {
               outputText("她最终伴随着一声湿润的啵声松开了，让你新长出的乳房晃动起来，然后她顺着你的身体往下移，在每一对乳房上重复着同样的动作。");
            }
            outputText("[pg]由于快感而虚弱，你最后看到的是她微笑的脸庞，然后你向前倒进了她的怀抱。接下来你所知道的，就是你独自一人在林间空地里，盯着上方的树冠。你的胸口感到沉重，你挣扎着坐起来。" + Utils.Num2Text(get_player().bRows() * 2) + "只巨大的乳房在你的胸前晃动摇摆，全都饱满得发胀，渴望被挤奶");
            if(get_player().bRows() > 1)
            {
               outputText("，最上面的一对最大，随后每一对依次减小");
            }
            outputText("。");
            get_player().growTits(7,get_player().bRows(),false,2);
            get_player().boostLactation(get_player().bRows());
            outputText("[pg]在接下来的一两个小时里，你坐在那里，挤着你肿胀的胸部，顺便给植物浇了丰沛的水。当一切都处理妥当后，你经过短暂的挣扎，摇摇晃晃地站了起来，再次穿上你的装备。当你离开时，刚剪下的鲜花香味似乎还萦绕在你的[armor]上。");
            _loc2_ = true;
         }
         if(get_player().hasBreasts() && get_player().isLactating())
         {
            get_player().milked();
            get_player().boostLactation(0.01);
         }
         if(_loc2_)
         {
            get_player().orgasm("Tits");
         }
         else
         {
            get_player().orgasm("Generic");
         }
         dynStats(DynStat.Lib(1));
         get_player().slimeFeed();
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function plantsForMe() : void
      {
         var BE2:int;
         var _g2:Essrayle;
         var BE1:int;
         var _g1:Essrayle;
         var BE:int;
         var _g:Essrayle;
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,774) == 0)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,774,1);
            outputText("埃斯蕾尔咯咯地笑了起来，她丰满的乳房泛起层层涟漪。[say:哦，那真是太感谢你了！这没什么大不了的——我怀疑这对你来说不会是什么负担。但在我的旅行中，我已经枯萎了，耗尽了继续前进的能量。我好饿啊！你能不能——？]她把问题悬在半空，恳求地看着你。你急忙把手伸向存放补给品的地方，但当她轻蔑地挥手时，你停了下来。[say:不，不，我不是指饼干之类的东西。]你困惑地皱起眉头，但当你感觉到她的手放在你的[chest]上时，你的表情柔和了下来。[say:我需要一种特殊的食物来做我做的事，一种根本不会消耗你补给品的食物。][pg]");
         }
         if(get_player().biggestTitSize() > 1)
         {
            outputText("你的乳头变硬了，乳房随着灼热的呼吸而鼓起");
         }
         else
         {
            outputText("你轻轻地弓起背，下意识地向她纤细的手指又压近了一点");
         }
         outputText("当她的手开始在你的胸前画圈时。[say:不过你嘛，那就是另一回事了。]她诱惑地笑着，你周围的空气似乎变得浓稠，弥漫着淡淡的粉色薄雾。出于本能，你环顾四周，试图找出源头——她会是恶魔之一吗？");
         outputText("[pg]你再次听到埃斯甜美而俏皮的笑声，感觉她突然将你紧紧抱入她丰满的胸怀。她的皮肤如此柔软，闻起来如此甜美，带着淡淡的花香，那对巨大的乳房挤压着覆盖了你的下半张[face]，让你无法发出任何抗议。[say:嘘，放松点，]她柔声说道，一只手温柔地抚摸着你的背，[say:深呼吸，小可爱。]");
         outputText("[pg]由于无法争辩，你深吸了一口气，尽管有些颤抖。空气闻起来也很甜美，就像你置身于盛开的野花海洋中。你的眼睑轻轻颤动。这香气如此芬芳，如此令人舒缓。埃斯对你笑了笑。[say:这就对了，你在这里很安全，在埃斯需要的时候帮助她。]再深吸一口气，你感觉肌肉放松了，只想在呼气时赶紧吸下一口气，以便吸入更多的香气。");
         outputText("[pg]她继续着她的工作，让你在过程中保持舒缓和平静。[if (!isnaked) {她的手稳稳地脱下你的[armor]，毫不费力地将它从你僵硬的身体上滑落。每一件装备被丢弃到草地上时，几乎都无声无息地落在你身后，直到你像她一样完全赤裸地站着。[pg][say:真是些愚蠢的东西。我总是想不通你们凡人为什么要穿这么多。] }]你的眼睛扫视着她的身体，寻找任何恶魔本质的线索。她没有角，她自己的角比你见过的任何角都要雄伟美丽，而且她也没有你想象中那种具有威胁性的肌肉。");
         outputText("[pg]在她的背上，似乎绽放着一朵巨大的粉色花朵，粉色的薄雾从中流出，覆盖了整个区域。突然，埃斯把你举起来，轻轻地倾斜你的头，将她那娇小的绿色嘴唇印在你的嘴唇上。没过多久，你们俩就开始热情地亲吻起来，仿佛你们已经相爱多年。她的舌头伸进你的嘴里，感觉异常柔软，有点痒，尝起来有……薄荷的味道？");
         outputText("[pg]慢慢地，你们俩分开了，埃斯将她那像叶子一样的舌头滑过你的嘴唇，让它们暂时感到一阵凉爽的刺痛。[say:我好饿……非常非常饿，]她对你低语，她的脸再次触碰你的鼻子。她的一只手开始顺着你的身前滑下，抓住并挤压你的乳头。");
         if(get_player().breastRows[0].breastRating >= 1)
         {
            outputText("[pg][say:哦，我有多喜欢这些，]她对你柔声说道，用双手托起你的乳房，开始用力地挤压和揉捏那柔软的肉体");
            if(get_player().bRows() > 1)
            {
               outputText("最上面那对的");
            }
            outputText("。你呻吟出声，这似乎更加鼓励了她，她用拇指和食指捏住你的乳头，来回扭转揉捏。她咯咯地笑着，因为你的呻吟声似乎随着她的动作而起伏，她继续挑逗着它们");
            if(get_player().bRows() > 1)
            {
               outputText("，有条不紊地抚弄着你身上那许多肉团");
            }
            outputText("。");
            if(get_player().hasFuckableNipples())
            {
               outputText("她的手指把玩着你的乳头，轻轻按压挑逗着。当它们毫不费力地陷进去时，她显得十分惊讶。她的脸上浮现出笑容，开始稳稳地将手指在你的乳头里抽插，手指在里面不停地打转。");
            }
            outputText("[say: 你的这对乳房确实很可爱，但它们还可以变得更好，你不觉得吗？]");
            menu();
            _g = this;
            BE = 1;
            addButton(1,"是的",function():void
            {
               _g.plantsForMe2(BE);
            });
            _g1 = this;
            BE1 = 2;
            addButton(2,"否",function():void
            {
               _g1.plantsForMe2(BE1);
            });
         }
         else
         {
            menu();
            _g2 = this;
            BE2 = 0;
            addButton(0,"继续",function():void
            {
               _g2.plantsForMe2(BE2);
            });
         }
      }
      
      public function noPlantsForMe() : void
      {
         clearOutput();
         outputText("埃斯撅起嘴，耳朵微微向两侧贴平。[say:我明白了，]她点点头，看着你，眼中流露出难以掩饰的失望。她似乎立刻换上了一副虚假的笑容，走到一边，挥动手臂指向前方的道路。[say:好吧，既然如此，你一定是要去什么重要的地方。最好别让你久等了。祝你冒险顺利！]当你离开时，她继续微笑着，很快就把她甩在了身后。不过当你离开时，你发誓你听到了一句含糊不清的嘟囔，[say:就让我遇到这种古板的人吧。]");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,773,1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function noGimmeGiantNipplesEssy() : void
      {
         clearOutput();
         outputText("她耸了耸肩，轻轻捏了捏其中一团滴着乳汁的乳头。[say: 哎，我想每个人都有自己的喜好。]");
         essyRewardEpilogueOUTTIES();
      }
      
      public function hasPussyFeedEssy(param1:Boolean = true) : void
      {
         if(param1)
         {
            clearOutput();
         }
         else
         {
            outputText("[pg]");
         }
         get_images().showImage("essrayle-discussion");
         outputText("你重新调整了艾西那巨大乳房的位置，决定尝试一些新的、不同的东西。当你爬上她那被施了魔法的花盆边缘时，艾西那又长又肥的乳头闪烁着饱满的承诺。土壤因她的乳汁而变得柔软湿润，你轻轻地将她推倒，让女孩柔软的身体靠在她那突出的丰臀上。她向后靠去，头晕目眩，无法理解你在她那沉甸甸的胸部上方做些什么。你几乎毫不费力地引导其中一个挺拔、拳头粗细的乳头进入你女性的褶皱中，将其滑入你的[vagina]，伴随着");
         if(get_player().looseness() < 2)
         {
            outputText("一声喘息的用力咕哝");
         }
         else if(get_player().looseness() < 4)
         {
            outputText("微弱的阻力");
         }
         else
         {
            outputText("几乎没有任何阻力");
         }
         outputText("。你费了一番力气，将植物娘的乳峰吞没至其叶绿色的根部，她柔软的乳房紧贴着你的[hips]，那如乳头般的肉棒在你[vagina]内跳动。");
         get_player().cuntChange(12,true,true);
         outputText("[pg]埃斯蕾尔因你紧绷的下体传来的感觉而发出吱吱声，开始询问你在做什么，但当你的内部肌肉收紧包裹住她的乳头时，她连一句完整的话都说不出来了。你慢慢地在她的乳房上前后摇摆，享受着她肿胀的乳房紧贴你下体的感觉，同时在柔软的肉体上摩擦，诱使那敏感的凸起深入。你的[hips]撞击着她的胸部，那柔软的肉垫屈服并缓冲着你坚持不懈的热情，紧绷的表面随着每一次拍打臀部的冲击将你向上弹起。植物娘那巨大乳房出乎意料但令人愉悦的弹性让你失去了平衡，只能伸手去抓东西来稳住自己。你伸出手，手掌不经意间抓住了她另外两个空闲的乳头，用力夹紧，粗暴地拉扯着她肥大的乳头，让喷涌的汁液涌向它们不堪重负的顶端。");
         outputText("[pg]你上下起伏，前后摇摆，设定了一个稳定的节奏，伴随着泌乳和翠绿女孩受惊的哞哞声。她强烈的快感让她的乳房失去了所有的节制，满载乳汁的双乳释放出沉重的奶油色汁液，在肿胀的乳房上渗出并喷射，滴落到她身下的土壤中。在你的骑乘过程中，你注意到了女孩周围那些渴望、漏奶的乳头，并特意交替着抽插挤压每一个乳头，挤出如雪花石膏般喷涌的花蜜，确保你们两人都被她温暖、浓郁的汁液完全浸透。伴随着你们两人制造的黏腻、呻吟和肉体拍打的喧闹声，竟然没有人来查看这阵骚动，这简直是个奇迹。不过，你猜想，这个植物荡妇高潮时的哞哞声可能是这个洞穴里最不奇怪的声音了。");
         outputText("[pg]随着她过度受刺激的乳房在你体内膨胀，因她绽放的欲望而变得肥大，你那淫荡的乳交劳作达到了狂热的顶峰。你体内那如肉棒般的凸起因乳汁而肿胀，像气球一样变得更长更粗，直到你吸吮的内壁因承受女孩肿胀的乳头而紧绷。感觉到高潮的颤抖正在积聚，你收紧了抓握，尽可能深地将自己推向那塞满小穴的乳房。她的乳房无法抵抗你达到顶峰的挤压，喷射出高压的肥沃汁液，用一种比精液更具流动性，但又足够浓稠的温暖淹没了你的小穴，让满足的颤栗传遍你的脊背。你看着自己的肚子变得圆润，然后丰满，最后变得肥胖，因为你的子宫被她那令人刺痛的肥沃乳汁淹没了。你们两人在极乐的高潮中大叫，你完全被植物娘的恩赐所撑满，瘫倒在她那湿透的乳沟里，仍然紧紧抓着她泌乳的乳头。你在那里和她一起轻轻喘息了一会儿，只是沉浸在你沉重肚子的刺激快感中，时不时温柔地捏一下艾西的乳房，只为了听她发出愉悦的哞哞声。");
         outputText("[pg]你花了一段时间才把自己拔出来，并尽可能地清理干净，在再次上路之前，你在她的脸颊上留下了一个友好的吻。有你这样的访客，她似乎一点也不介意被困在那个施了魔法的花盆里。");
         get_player().orgasm("Vaginal");
         if(get_player().fertility < 50)
         {
            var _temp_1:* = get_player();
            _temp_1.fertility = _temp_1.fertility + 1;
         }
         doNext(playerMenu);
      }
      
      public function hasCockFeedEssy(param1:Boolean = true) : void
      {
         if(param1)
         {
            clearOutput();
         }
         else
         {
            outputText("[pg]");
         }
         get_images().showImage("essrayle-encounter");
         outputText("[EachCock]直立着，你在她的肚子上摩擦，巨大的乳房奇妙地挤压着它。像乳房一样的肉球随着植物娘每一次灼热的呼吸挤压着[oneCock]，紧绷的皮肤被她高潮余韵的汗水浸透，湿润地吸吮着你的长度。决心充分利用这些多产的乳房，你向前移动，你的[cock biggest]的体积轻松地滑入下面那对乳房之间，她漏水的翡翠枕头紧紧地吞没了你的粗壮，就像她用四只手臂把它们抱在一起一样紧。");
         outputText("[pg]尽管她的乳房很柔软，但多一点润滑也无妨。抓住她两个拳头大小的肿胀乳头，你开始像挤牛奶一样挤压和拉扯它们。艾西发出灼热的、牛一般的呻吟声，糖浆般的白色汁液从她喷涌的乳头中以浓稠的、瀑布般的喷流涌出。因为被沙漠女巫如此彻底地使用过，她似乎对你的挤奶非常接受，就好像她的身体需要更私人的接触。不想让她失望，你收紧了拧挤的握力，抽插得更用力了。");
         outputText("[pg]她那超凡脱俗的紫水晶般的眼睛失去了往日的深邃，变得迟钝和茫然，温顺的阴影笼罩着她，艾西的表情柔和成一种幸福的、像牛一样的满足感。[say: 哞——] 她慵懒地呻吟着，巨大的乳房像海洋一样起伏。它们在你抽吸的抚摸下跳动，仿佛在努力产生更多的汁液。当这个毫无防备的女孩似乎迷失在某种私人的、迟钝的狂喜恍惚中时，她的乳房几乎看起来正在膨胀，仿佛要体现她初露头角的、狂喜的兴奋。");
         outputText("[pg]尽管让植物娘用自己的汁液把自己浇灌得闪闪发光很诱人，但你还是不忍心让她喷涌而出的乳白液体白白浪费。你小心翼翼地保持着稳定的抽插节奏，用那浓稠如糖浆般的\"乳汁\"润滑你现在坚挺的肉棒。在她的花蜜滋养的温暖下，你抛弃了所有的克制，尽情享受着那对翠绿、柔软的乳房。当你操弄时，空气中充满了湿润的吧唧声");
         if(get_player().biggestCockLength() < 20)
         {
            outputText("她下方那对晃动的乳房");
         }
         else
         {
            outputText("她那两对胀满乳汁的乳房");
         }
         outputText("越来越快时，空气中充满了湿润的黏腻声，她丰满的胸部拍打着你的[cock]");
         if(get_player().balls > 0)
         {
            outputText("而你肿胀沉重的睾丸拍打着她丰腴的小腹");
         }
         outputText("，为你狂热的节奏敲响了振奋人心的鼓点。");
         outputText("[pg]没过多久，艾西那如花般绽放的乳房喷涌出的乳汁拥抱了你，诱使你用乳白色的精液将这绿皮女孩的翠绿肌肤染白。当你高潮时，她那颤抖的乳房似乎也迎来了自己的释放，巨大的乳头在你的指间膨胀，因巨大的液体重量而肿胀。紧接着，在一种奇妙的同步释放中，汹涌的乳白汁液如高压间歇泉般喷射而出，化作一场黏稠的激情暴雨，倾泻在你们两人周围。地板上长出了茂密的灌木丛，而植物娘那形状优美的臀部因高潮的愉悦而颤动，她所扎根的土壤变成了深黑色，瞬间被她肥沃的乳汁滋养。");
         outputText("[pg]再次精疲力尽的艾西靠在她的花盆里，已经带着满足的表情打起了瞌睡。虽然她仍然被囚禁着，但你至少让她感到了安心。虽然你可能想把她移到一个更私密的地方，但她花盆的重量足以让你打消任何尝试的念头。最好还是让她留在这里，晚点再来看看。");
         get_player().orgasm("Dick");
         doNext(playerMenu);
      }
      
      public function forestEncounterCondition() : Boolean
      {
         if(get_player().get_gender() > 0)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,866) != 0)
            {
               return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,864) == 1;
            }
            return true;
         }
         return false;
      }
      
      public function feedTrappedEssy() : void
      {
         var newPage1:Boolean;
         var _g1:Essrayle;
         var newPage:Boolean;
         var _g:Essrayle;
         clearOutput();
         outputText("好吧，反正她现在哪儿也去不了，而且她可能也很乐意被朋友好好操一顿。");
         outputText("[pg]你再次靠近埃斯蕾尔，趁着她神志不清的状态脱下衣服，在她意识到你的意图之前悄悄靠近那个被施了魔法的花盆。从这个角度你可以清楚地看到她的手深深地陷在她丰满臀部周围的泥土里。她眨了眨眼，对你突然的唐突感到困惑，但很快就大声呻吟起来，因为你的手掌陷进了女孩最近被按摩过的乳房，手指深深地陷进了柔软的肉里。");
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,865,FlagDict_Impl_.arrayReadInt(_loc1_,865) + 1);
         if(get_player().get_gender() == 1)
         {
            hasCockFeedEssy(false);
         }
         if(get_player().get_gender() == 2)
         {
            hasPussyFeedEssy(false);
         }
         if(get_player().get_gender() == 3)
         {
            outputText("如何最好地利用这位花卉美人？");
            menu();
            _g = this;
            newPage = true;
            addButton(0,"肉棒",function():void
            {
               _g.hasCockFeedEssy(newPage);
            });
            _g1 = this;
            newPage1 = true;
            addButton(1,"小穴",function():void
            {
               _g1.hasPussyFeedEssy(newPage1);
            });
         }
      }
      
      public function essyWitchVictory() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_essrayle());
         get_images().showImage("essrayle-encounter");
         outputText("和以前一样，你在林间空地找到了埃斯蕾尔，但现在她似乎已经从束缚中解脱出来了。刻有符文的花盆被翻倒，潮湿的土壤洒在地上。植物娘咯咯笑着，将双臂交叉在上下两对乳房之间。[say:我想这意味着你成功了，我应该向英雄表达一些感激之情，]她热情地娇嗔道。伴随着她那沉重球茎的涟漪，她走上前来，乳房因丰满而弹跳晃动。");
         outputText("[pg][say:不过我得说，我在那里玩得很开心，甚至还得到了一些很棒的纪念品！]她咧嘴笑着，左右摇晃着四个乳房，紧绷的绿色皮肤因鼓胀的恩赐而泛红肿胀。[say:我爱死它们了！来这里真是个好主意！]她再次挺动胸部，不知怎的，竟然让她那被乳汁胀满的乳房在宽阔的、摇晃的圆圈中滚动。她停止了玩弄自己，也许是想起了她还没有奖励你，当她注意到你的注意力似乎集中在她那突出的乳房上时，她露出了一个大大的、欢迎的微笑。");
         outputText("[pg]她带着灿烂的喜悦向你靠近，露出她双重乳沟的全部深度，并将一根手指放在你的下巴下。[say:我的眼睛在上面，]她戏谑地说道。[say:现在，怎么奖励你最好呢？]她皱着眉头思考着，漫不经心地用手指在左上方的乳房上画圈，挤压着那柔软、几乎呈流体状的表面。[say:嗯，像你这样经验丰富的冒险家可能会喜欢一些又大又闪亮的剑或魔法盔甲之类的东西，但我通常不带这些东西。]");
         outputText("[pg]她的手指继续游走，滑向那迷人的紫色乳晕，用拇指和食指的指尖在肿胀的乳头上反复摩擦，从根部到顶端，一遍又一遍。[say: 也许想要些宝石？你们似乎很喜欢那些东西。] 艾西下方的两只手搭在宽阔的臀部上，上方空闲的一只手则放在其中一个乳房上，手指漫不经心地敲击着，在充满乳汁的肉体上激起阵阵颤动的涟漪。这简单而流畅的动作几乎具有催眠的效果，你的目光再次死死盯住了这位植物娘丰满的胸部。");
         outputText("[pg]注意到你直勾勾的眼神，她嘴角勾起一抹狡黠的微笑。[say: 但我想到了一个能让你非常开心的主意。] 她上方的两只手伸向乳沟，将那对肥大柔软的乳房向两边拉开，然后松手，任由这座肉山在颤动中拍打在一起。[say: 是的，一些我们都会非常开心，你也会真正享受的东西。] 她下方的两只手托住下方乳房的底部，开始在掌心中悠闲地颠弄它们。[say: 毕竟，最重要的是：享受你自己。]");
         outputText("[pg][say: 虽然我只是这个世界的过客，但我也学到了一些东西。] 她咧嘴一笑，将另外两只手臂交叉抱在那对晃动摇摆的丰满双峰上。[say: 既然你这么喜欢这四个，也许你想加入我们？] 埃斯蕾尔娇媚地眨了眨眼，[say: 怎么样？]");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,863,1);
         menu();
         addButton(0,"同意",acceptEssyPrizes);
         addButton(1,"拒绝",declineEssyPrizes);
      }
      
      public function essyRewardEpilogueOUTTIES() : void
      {
         outputText("[pg]突然，她凑上前来深深地吻了你，将她那湿润的、叶片般的舌头深深地探入你的口中。");
         outputText("[pg]这个充满激情的吻持续了一会儿她才松开，粘稠的唾液丝依然挂在你们俩的嘴边。分开后，她向后靠去，再次挺起胸膛，对你微笑着。[say: 好好享受一下吧，英雄。希望我们还能再见。] 她故作神秘地将手背贴在嘴边，压低了声音。[say: 等你有机会好好享受一下你那升级过的胸部后，我很乐意来玩玩那些可爱的肉球！]");
         outputText("[pg]伴随着一声不知羞耻的娇笑，她亲吻了你其中一个乳房的顶端，同时抚摸着旁边的另一个。[say: 嗯，是的，我现在就想狠狠地蹂躏它们，把你榨干，但出于尊重，我还是让你先尝尝鲜吧。] 她优雅地挥了挥手，步履蹒跚地走向出口，再次消失了。[pg]");
         doNext(playerMenu);
      }
      
      public function essrayleMeetingI() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_essrayle());
         get_images().showImage("essrayle-encounter");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,772) == 0)
         {
            outputText("你跌跌撞撞地穿过茂密的树丛，拨开那些挡路的枝条和试图绊住你脚步的长草。前方出现了一片空地，给了你一个明确的前进目标。说真的，你确实需要歇口气了。你在灌木丛中横冲直撞，踩得噼啪作响，闹出一片动静，几乎是一眨眼就冲进了那片林间空地。");
            outputText("[pg]突然你意识到附近不只有你一个人。空地上的另一位住客有些吃惊地望着你，而你回望她的眼神里更多的则是惊叹。这是个女人，对吧？你不敢完全确定。她的身体纤细修长，肤色是一种柔和的绿，长着一张精灵般、没有鼻子的面孔。翠绿的草叶般的长发披散在背后，一根巨大的木质犄角从她的额头伸出，上面布满纹饰，更像是某种甲虫身上的东西，而不是一个人该有的样子。");
            outputText("[pg]首先吸引你目光的是她的眼睛；那是丰富、深邃的紫水晶般的眼睛。");
            if(get_player().cor < 33)
            {
               outputText("尽管你自认为很有骑士风度");
            }
            else if(get_player().cor < 66)
            {
               outputText("尽管你理智尚存");
            }
            else
            {
               outputText("也许最棒的是");
            }
            outputText("，但你的目光仍然不由自主地落在了她的胸前。这位翡翠般的少女挺着一对让魅魔看了都会脸红的乳房，那对绝美的绿色肉球就像两个小西瓜搁在她的上腹，顶端点缀着紫色的乳晕。四根粗大的、像奶头一样的乳头从每一边垂悬下来，足足有三四英寸长。");
            outputText("[pg]同样地，四只纤细的绿色手臂装点着她的身躯。她没有腿，而代替双腿的，是一根从草地上那朵巨大的花苞中延伸出来的、水蛇般光滑的独茎。随着她的动作，它微微地颤动，不过远比不上那对巨乳晃得厉害。");
            outputText("[pg]察觉到你在盯着看，这位植物娘非但没有羞耻地遮掩自己，反而把胸部又往前挺了挺，让那对乳房诱惑地弹跳起来。 [say: 喜欢眼前看到的吗？] 她软语轻哼，狡黠地眨了眨眼，自顾自地咯咯笑起来。你支支吾吾地想说点什么，");
            if(get_player().cor < 33)
            {
               outputText("匆忙地把目光从她赤裸的身体上移开");
            }
            else if(get_player().cor < 66)
            {
               outputText("出于礼貌把目光移开");
            }
            else
            {
               outputText("让你的眼睛在她身上游走，试图在她青春期的身体上寻找更多堕落的特征");
            }
            outputText("。");
            outputText("[pg]一只柔软、散发着甜香的手托住你的下巴，引导你再次看向她。[say: 别这么害羞，]她柔声说道，将那些巨大、柔软的东西紧紧地压在你的");
            if(get_player().biggestTitSize() >= 10)
            {
               outputText("自己的");
            }
            else
            {
               outputText("[chest]");
            }
            outputText("。[say:你一定就是我听说过的那些冒险者之一吧，对吗？]");
            outputText("[pg]你点点头，在你们目光交汇的那一刻，她那双美丽的眼睛似乎就捕捉并锁定了你的视线。");
            outputText("[pg][say:嗯哼，我就知道。能遇到另一个外乡人真是太好了。]你眨了眨眼，她似乎笑了，仿佛猜透了你的心思。[say:我知道，我知道，我看起来像个本地人，但我只是不小心误入这里的！不过我不介意，]她眨了眨眼，咧嘴笑道。[say:我简直爱死这里了！]她惊呼着，张开双臂（最上面那对）示意你们周围的森林。[say:这个地方绝对完美，]她笑着低语，[say:对我这样的人来说太完美了，]然后再次提高音量，[say:我只是想看看，想经历——呃，体验更多！]");
            outputText("[pg]你慢慢地点了点头，努力集中注意力听她说话，但这里相当潮湿，很难集中精神。随着她不断地移动，起伏并荡漾着下半身，她的一举一动似乎都是为了引起任何注视她的人的兴趣和性欲。");
            outputText("[pg]她突然停了下来，脸颊泛起淡淡的紫色，看着你。[say:哦，对不起。我最近太容易激动了。我叫埃斯蕾尔——简称埃斯。很高兴认识你。]虽然她说得很甜美，但当她清晰地吐出“高兴”这个词时，你还是忍不住感到一阵温暖的刺痛，还是说那是你的错觉？这里太温暖了，你的身体感到又热又沉。");
            outputText("[pg]埃斯笑了，当她再次靠近你时，球茎泛起涟漪。[say:说起来，你是个英雄，对吧？你觉得你能帮女孩一个忙吗？~]");
            outputText("[pg]从她移动的方式以及她似乎让周围的空气都充满性张力来看，你确信帮助她会导致一些与性有关的事情。你要帮她吗？");
            dynStats(DynStat.Lust(5));
         }
         else
         {
            outputText("在森林中旅行时，你再次偶然遇到了一张熟悉的面孔。[say:哦，你好！]埃斯蕾尔欢快地向你挥手，导致她丰满的乳房微微颤动。[say:我还在想你是否会回来。]她走近了些，巨大的双峰在离你仅几英寸的地方晃动，[say:不过我有一种预感你会回来的。]她温柔地咕哝着，用夸张的动作将一缕头发拨到一边，让那对弹性的乳房上下跳动。");
            outputText("[pg][say:那么，你回来只是为了打个招呼，还是有其他原因？]那双纤细的绿色双手落在她匀称的臀部上，她那双美丽的紫水晶眼睛深深地凝视着你。[say:如果你是来给我喂食的，我这次一定要谢谢你，我坚持。]突然，当她凑近时，那对乳房挤压在你的胸前，她诱惑地问道，[say:那么，想做点园艺吗？]");
         }
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,772,FlagDict_Impl_.arrayReadInt(_loc1_,772) + 1);
         doYesNo(plantsForMe,noPlantsForMe);
      }
      
      public function declineEssyPrizes() : void
      {
         clearOutput();
         outputText("艾西叹了口气，摇了摇头。[say: 真扫兴！] 她耸了耸肩，无奈地将四只手臂举到空中，然后在藤蔓腰带上的小袋子里翻找起来。[say: 给你，希望这能合你的胃口。] 她伸出手，将一些闪闪发光的宝石放在你的手里。[say: 反正它们对我来说也没什么用。]");
         var _loc1_:Player = get_player();
         _loc1_.set_gems(_loc1_.get_gems() + (100 + Utils.rand(70)));
         statScreenRefresh();
         outputText("[pg][say: 好吧，也许以后你会改变主意，找到其他方法自己解决。不过我想现在我只能说回见啦！谢谢你的搭救，亲爱的！] 这位植物美人向你飞吻，然后转身离去，一路上那鼓胀的乳房都在不停地晃动颠簸。");
         doNext(playerMenu);
      }
      
      public function askMotherToReleaseEssy() : void
      {
         clearOutput();
         get_images().showImage("monster-sandmother");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,849) == 0)
         {
            outputText("你指出女巫们用魔法把你的一个朋友困在了这里，你希望她能被释放。");
            outputText("[pg]沙之母歪了歪头，随后她那发光的眼睛里闪过一丝恍然大悟的神色。[say: 那个植物女人？她像恶魔一样追求快感，却缺乏我们所预期的那种腐化。我可以下令放她走，但你得把她带出去，如果她再回来，我可不能保证她还能重获自由。]");
            outputText("[pg]也只能这样了。");
         }
         else
         {
            outputText("你命令沙之母将你的朋友埃斯蕾尔从魔法束缚中释放出来。这位女巫女王看起来想要抗议，但在短暂的停顿后，她妥协了，[say: 好吧，我会让人放了她。你可以去接她了。] 她几乎是咬牙切齿地说出最后一句话。");
            outputText("[pg]这就够了。");
         }
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,864,1);
         doNext(playerMenu);
      }
      
      public function approachTrappedEssy() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_essrayle());
         get_images().showImage("essrayle-encounter");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,865) == 0)
         {
            outputText("曾经长着两个西瓜大小巨大乳房的树叶少女，现在拥有了四个巨大的乳房，让她以前的胸部相形见绌。起伏的乳房闪烁着水光，似乎随着她每一次疲惫的呼吸而膨胀。她的臀部——你能从植物巨大的乳房后面看到的那些——浸泡在填满花盆边缘的黑色肥沃土壤中。她紫色的眼睛里闪烁着光芒，她似乎因为什么事情而非常疲惫。");
            outputText("[pg]当你靠近时，她猛地坐直了身子，肿胀的乳房泛起如海浪般的涟漪，让她的整个身体都像液体一样晃动起来。[say: 谁在那儿？时间还没到吧！]她惊慌失措地脱口而出，然后才注意到你。当她认出你时，紫罗兰色的红晕染上了她翠绿的脸颊，她的恐慌迅速被温柔的微笑所取代。[say: 哦，嘿，又是你。]");
            outputText("[pg]你问这盆栽女孩发生了什么事，这让她的脸颊泛起了更深的红晕。[say: 哦，呃，那个，我当时正在四处旅行，当我到达森林边缘时，我发现了一位非常迷人的女士从沙漠里走出来。] 埃斯蕾尔轻声咕哝着，回忆起那件事时咧嘴笑了。[say: 然后当然啦，我们找了点乐子，她似乎很喜欢我的胸部，特别是我的汁液，所以她建议我和她一起回去，和她的姐妹们分享。我觉得去拜访她们会很有趣，但……我想她们有别的打算。]");
            outputText("[pg]她轻笑了一下，似乎这种情况并没有让她感到困扰。[say: 哎，我想我的冒险可能会有更糟的结局，对吧？] 她耸了耸肩，在这个过程中，她那四个乳白色的乳房也随之晃动。[say: 我的意思是，她们把我照顾得很好——她们似乎绝对喜欢我的汁液。我想这对她们来说是某种美味佳肴。]");
            outputText("[pg]当你的植物朋友说话时，你忍不住盯着她那超大的乳房看，但这也不能怪你，因为它们沉重的体积覆盖了她的大部分身体。她说的每一个字都会让那黄绿色的乳房颤动，每一次笑声都会让这个女人的常春藤身躯颤抖。最终，你意识到她停止了说话，你能感觉到她困惑的目光落在你身上。你尴尬地试图打破僵局，问她既然似乎没有守卫，为什么不直接离开。艾西只是笑了笑，摇了摇头。[say: 她们采取了措施，确保我无法离开。]");
            outputText("[pg]她深吸了几口气，胸部剧烈起伏，然后演示了一番：她将四只手臂都撑在花盆边缘，试图站起来。几个奇怪的符文出现，并开始在她陶瓷牢笼的表面发光。幽灵般半透明的手凭空出现，开始在植物娘身上劳作，揉捏、按摩并抚摸她巨大的乳房。埃斯蕾尔发出炽热的呻吟，瘫倒回泥土中。其中一只手停止了对那柔软、黏糊糊、几乎像面团一样的乳房的揉捏，开始挤压并拉扯她那丰满乳房顶端拇指粗细的紫色乳头。");
            outputText("[pg]没过多久，她就开始在狂喜中呻吟（一种奇怪的牛叫声，让你觉得更像是一声“哞”），她那糖浆般的汁液开始如倾盆大雨般喷涌而出。挤奶的力度加大了，艾西在性高潮的阵痛中扭动着，发出顺从的欢快咕噜声，她的花蜜像淡琥珀色的雨一样在空中倾泻而下。偶尔，当那些过度膨胀的乳房被粗暴地抚摸时，你会看到一个奇怪的、球状的红色花蕾，上面有一对肿胀的绿色嘴唇。植物娘奇特的阴部闪烁着漆般的光泽，随着它的颤抖，你意识到它已经被她闪闪发光的汁液完全浸透了。");
            outputText("[pg]一双空灵的手加深了揉捏的力度，它们抽吸着女孩巨大、喷涌的乳房，她紫丁香般的红晕从脸颊一直蔓延到胸部。风信子般的色调使她绿色的皮肤发紫，并给埃斯蕾尔痉挛的乳头带来深深的紫罗兰色红晕，她牛一般的呻吟声变得更大、更短、音调更高。在这种肆无忌惮的展示中，她偶尔能喘息着说出一个词，试图穿透泌乳引起的性高潮带来的令人窒息的阴霾进行交流。这花了一些时间——中间穿插着极乐的尖叫声，不断喷涌的乳汁，以及从她双腿间球状猩红花蕾喷出的淫液——但你明白她是在解释过度的刺激让她太虚弱而无法逃离花盆。");
            outputText("[pg]被施了魔法的手最终消失了，让植物娘在极度疲惫中瘫倒，皮肤上闪烁着她覆盖在自己身上的乳白色汁液。她臀部周围的泥土移动了，她慢慢苏醒过来，她的乳房已经在你眼前重新充满。你可以理解为什么沙漠女巫想要留住这个植物娘——她那充满青春活力的乳房的恩赐似乎是无穷无尽的！她们一定是把她种下，然后去寻求帮助来移动这头植物奶牛，因为她们确信她短期内无法靠自己的力量离开。");
            outputText("[pg]你们俩坐在那里，试图想办法让她摆脱困境，尽管你不能确定你的逗留是否有别有用心。说话很慢，因为她必须与挥之不去的快感作斗争——幽灵般的手把她巨大的乳房揉捏得如此彻底，以至于即使是一阵微风也足以让高潮的极乐传遍她的下半身。值得庆幸的是，没有沙漠女巫来调查这些噪音，尽管从你周围地上的脚印来看，在你发现她之前，有不止几个女巫拜访过艾西。");
            outputText("[pg]最终你们俩决定，" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,838) != 0 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,847) != 0 ? "既然女巫首领已经被解决了" : "也许通过打败女巫首领，那个对她施咒的人") + "，她就能安全离开了。[say: 那太-太-太好了，] 她叹了口气，就在另一次颤抖的余震让她在盲目的喜悦中摇晃之前，这让她花盆里慢慢积聚的淫液小湖又增加了一些，并顺着边缘滴落到她身下的草地上。你站起身准备出发，但现在你体内的热量已经因为这整个展示而燃烧得相当旺盛了。");
         }
         else
         {
            outputText("埃斯蕾尔像你离开她时一样坐在她的花盆里。她似乎又有些神志不清了，没有意识到你在那里。她沉重的乳房随着最轻微的动作而摇晃和起伏，显然是从泥土中吸收营养来重新填满自己。仅仅是看着这个毫无防备的女孩喘息着，因为牛一般的过剩而膨胀，就莫名地让人兴奋，而且已经品尝过她的汁液了……难怪沙漠女巫把她留在这里。从她四个乳房不断滴落的液体来看，幽灵般的手似乎最近刚给她好好挤过奶，但你确信她不会介意更私人的接触。");
         }
         dynStats(DynStat.Lust(10 + get_player().lib / 10));
         menu();
         if(get_player().get_gender() > 0)
         {
            addButton(0,"喂食",feedTrappedEssy);
         }
         addButton(14,"离开",playerMenu);
      }
      
      public function acceptEssyPrizes() : void
      {
         clearOutput();
         outputText("埃斯蕾尔喜笑颜开。[say: 我就知道！你是个识货的人！] 她拉起你的手，引导你坐在翻倒的锅边。她向后退了几步，从嘴角伸出绿色的叶状舌头，同时用手指敲了敲自己的头侧。[say: 现在……那咒语是怎么念的来着？] 她皱起眉头，努力回忆着，过了一会儿，她的表情再次亮了起来，充满了傻乎乎的喜悦。[say: 哦，等等，我知道了！你就待在那儿别动，我的小嫩芽。]");
         outputText("[pg]她匆匆跑出林间空地，对于一个胸部如此沉重，更不用说腿部还是个球茎的人来说，这真是一项令人印象深刻的壮举！就在你快要感到无聊的时候，她终于回来了，带着一种令人眼花缭乱的气息蹦蹦跳跳地出现在你的视线中。[say: 抱歉！] 她咯咯地笑着，舔掉嘴唇上一些苍白的奶油状液体，[say: 我去进行了一点谈判。] 她再次在你身边坐下，拿出一个小卷轴，打开它，用沙漠女巫的语言念诵起来。");
         outputText("[pg][say: Ytnuob ruoy htiw sdnas eht doolf. Edit yklim eht wolf tel!]");
         get_images().showImage("essrayle-prize");
         outputText("[pg]你感到一阵闷热笼罩了你。伴随着一种突如其来的冲动，你挺起胸膛，与此同时");
         if(get_player().biggestTitSize() <= 1)
         {
            outputText("四个鼓胀的乳房从你的胸前隆起");
            get_player().breastRows[0].breastRating = 4;
            if(get_player().bRows() == 1)
            {
               get_player().createBreastRow();
            }
            get_player().breastRows[1].breastRating = 4;
         }
         else if(get_player().bRows() == 1)
         {
            outputText("又有两个鼓胀的乳房从你的胸前隆起");
            if(get_player().breastRows[0].breastRating < 4)
            {
               outputText("同时你最上面的一排乳房也在膨胀");
               get_player().breastRows[0].breastRating = 4;
            }
            if(get_player().bRows() == 1)
            {
               get_player().createBreastRow();
            }
            get_player().breastRows[1].breastRating = get_player().breastRows[0].breastRating;
         }
         else
         {
            outputText("你的[fullChest]在咒语不断膨胀的魔力下变得越来越大");
            get_player().growTits(6,get_player().bRows(),false,2);
         }
         get_player().boostLactation(get_player().bRows());
         outputText("，充满了温暖液体的重量。它们在适应这饱满的丰盈时，相互摩擦着，也在你的肚子上晃动摇摆。你现在自豪地拥有了[fullChest]。");
         outputText("[pg]埃斯蕾尔开心地笑着点了点头，将卷轴重新卷起。[say: 是的，这在你身上看起来非——常棒！] 她盯着你的胸部看了一会儿，然后低头看了看自己的。[say: 但我想我能给你更好的，既然你对我这么好，] 这位纯天然的美女开心地咕哝着。[say: 作为给你的特别奖励，你想要这些吗？] 她像牛一样叫了一声，用手指在自己四个丰满的乳头上画着圈，给了你一个诱惑的微笑。");
         dynStats(DynStat.Lust(10));
         menu();
         addButton(0,"同意",yesGimmeGiantNipplesEssy);
         addButton(1,"拒绝",noGimmeGiantNipplesEssy);
      }
   }
}

