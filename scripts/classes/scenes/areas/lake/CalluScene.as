package classes.scenes.areas.lake
{
   import classes.Cock;
   import classes.CockTypesEnum;
   import classes.DynStat;
   import classes.ImageManager;
   import classes.Player;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.display.SpriteDb;
   import classes.globalFlags.KFLAGS;
   import classes.items.ConsumableLib;
   import classes.scenes.Camp;
   import classes.scenes.Inventory;
   import classes.scenes.api.Encounter;
   import coc.view.CoCButton;
   import flash.Boot;
   import haxe.IMap;
   
   public class CalluScene extends AbstractLakeContent implements Encounter
   {
      
      public function CalluScene()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
      }
      
      public function ottersForGals() : void
      {
         clearOutput();
         if(get_player().isChild())
         {
            get_images().showImage("callu-sex-facesit");
            outputText("你一同意，她脸上就露出了狡黠的笑容。她把鱼竿的一端像柱子一样插进沙子里，防止它跑掉，然后站了起来。没有任何挑逗，没有任何仪式，她脱下比基尼泳裤扔到一边。她新露出的耻骨丘上只有最稀疏的一簇阴毛，一小撮金发" + (get_noFur() ? "" : "在稀疏的棕色皮毛中") + "。");
            outputText("[pg]你走上前，想要抚摸卡露仍然隐藏在比基尼上衣下的小乳房，但她举起一只手说：[say:啊啊，这可不是一个年轻" + get_player().mf("绅士","淑女") + "该有的行为。你只要躺下，让大人来干活就行了。现在，做个乖[boy]，把衣服脱了。]");
            outputText("[pg]你急切地照做，脱下你的[armor]和装备，把它们扔到一边。卡露让你躺在沙滩上，就在她的鱼竿旁边，你也照做了。这个水獭女孩跨坐在你的肚子上，背对着你，不过谢天谢地，她那粗大沉重的尾巴没有扫到你的脸。");
            outputText("[pg]卡露俯下身，把身体趴在你身上，这样她温暖、散发着甜味的小穴就正好在你面前。同时，你感觉到纤细有力的手指在探测你的[vagOrAss]。一条长长的湿舌头舔过你的");
            if(get_player().hasVagina())
            {
               outputText("小穴");
            }
            else
            {
               outputText("后庭");
            }
            outputText("，你觉得有必要对她做同样的事。你伸出舌头，舔舐她娇嫩的阴唇。没过多久，它们就变得肿胀发红，像一朵淫靡的花朵一样绽放开来。你的舌头在每一道褶皱上上下游走，偶尔停下来用舌尖轻弹她迅速变硬的阴蒂。");
            outputText("[pg]同样，她的舌头和嘴唇在你的肌肤上舞动，就像三个舞者。它们旋转、跳跃、挑逗。没有一寸肌肤被遗漏。从你的");
            if(get_player().hasVagina())
            {
               outputText("阴蒂");
            }
            else
            {
               outputText("不自然的平坦胯部");
            }
            outputText("一路向下直到你的后庭，她留下了一串湿漉漉的吻痕。你模仿着她的动作，试图给她带来同样的体验。一声低沉的呻吟从她唇间溢出，当你的舌头舔到正确的位置时，她在你上方微微扭动。");
            outputText("[pg]在享受了几分钟美味的69式后，卡露在你的下体上印下最后一吻，然后坐起身来，几乎把你的脸埋进了她的私处。[say:现在乖乖的，用你的舌头开始练习吧。我们还得抓点晚餐呢。]你表达了不满，但发出的声音只是一串含糊不清的[say:mmmrrrrppphh。]卡露无视了你的抗议，而是拿回她的钓鱼竿，往后坐得更深，将自己更紧地压在你的脸上。由于她那美妙的臀部挡住了你的视线，你什么也看不见，只能听到她钓鱼竿发出的轻微的[say:滴答-滴答]声。");
            outputText("[pg]你很清楚，只要你想，你随时都能挣脱，但这女孩那充满麝香味的鼬科小穴散发出的气味实在太强烈、太醉人、太美妙了，让你无法忽视。你没有挣扎，而是开始大快朵颐，把脸埋在里面摩擦，舔舐、吸吮着紧贴你嘴唇的阴唇。你的舌头上下翻飞，进进出出，挑逗着她柔软肿胀的阴唇，用力按压着她坚硬酸痛的阴蒂，尽情享用着她的小穴。");
            if(get_player().hasLongTongue())
            {
               outputText("[pg]你伸出异于常人的舌头，深深探入卡露的深处。这竟然让这位渔夫发出一声小小的尖叫，她震惊地左右扭动着。你让舌头继续深入，仿佛那是一根肉棒。你在深入的同时撑开她，从内到外品尝着这只水獭，沉醉在她那甜美紧致的小穴的味道中。最终，你的舌头遇到了阻碍，一个紧致的圆环挡住了你前进的道路。你咧嘴笑了，或者至少是尽力去笑，毕竟一只水獭女孩正坐在你的脸上，而且你嘴里还伸出了12英寸长的舌头。你的舌尖在她的子宫颈周围打转，然后找到中心，慢慢地推了进去。卡露又发出一声[say: 呀]，不过这次变成了一声满足的叹息。舌尖进入她的子宫后，你开始用唾液涂抹她的肉壁。你舌头的每一次温柔弹动，都让骑在你脸上的女孩因快感而颤抖。然而，天下没有不散的筵席，你的舌头最终变得太累了，你别无选择，只能把它缩回来。");
            }
            outputText("[pg]这持续了大半个小时。你发现自己一直在寻找那些能让你性感的小朋友跳起来尖叫的敏感点，而她则一条接一条地钓鱼。几次高潮、半打鱼和一张极其凌乱的脸之后，你听到卡露最后一次收线，然后伴随着咔哒声把它放在一边。她从你的脸上站起来，让你再次呼吸到新鲜空气。");
            outputText("[pg]你的老师低头看着你，看着你那涂满淫液的脸，咧嘴一笑。[say: 瞧，这模样多适合你，]她说道。[say: 既然你是个这么好的学生，我想给你点奖励。]卡露俯下身子，来到你的双腿之间，抓住你的大腿，把你的腿搭在她的肩膀上。");
            outputText("[pg]当她一头扎进你的");
            if(get_player().hasVagina())
            {
               outputText("湿润的小穴");
            }
            else
            {
               outputText("屁眼");
            }
            outputText("。她的嘴唇仿佛有魔力一般，吸吮并尽情地爱抚着你的整个胯部。当她服侍你时，你发现自己全身都在因快感而颤抖，随着她的舌头按压你所有的敏感点，你的身体迅速升温。在卡露的服侍下，从指尖到脚趾，你的一切都在发麻、颤抖，让你在她的脸上扭动起伏，喉咙里发出一声极度满足的低吼。");
            outputText("[pg]你抓住自己的[nipples]，在卡露忙活的时候开始把玩它们。你的手指灵巧地揉捏挑逗着它们，深知所有能让你兴奋起来的正确技巧。");
            if(get_player().hasFuckableNipples())
            {
               outputText("你甚至滑了一两根手指进去，撑开你的乳头小穴，带来了极其愉悦的结果。");
            }
            outputText("再加上卡露温柔的舌头");
            if(get_player().hasVagina())
            {
               outputText("在你的湿润小穴上舔舐");
            }
            else
            {
               outputText("在你的后庭里进行洞穴潜水");
            }
            outputText("，你快要坚持不住了。你全身的酥麻感似乎都被挤压进了血管，汇聚在腹股沟的某一点。随着高潮的能量开始溢出，压力越来越大。你的手脚颤抖，脑袋不由自主地摇晃，你甚至猜不到你的脊椎在试图做什么。");
            outputText("[pg]体内的快感终于爆发出来，穿透每一根神经，点燃你身体的每一根纤维。");
            if(get_player().hasVagina())
            {
               outputText("你的小穴紧缩着，夹紧了空气，将你女性的淫液喷洒在卡露的脸上，化作一阵美味清爽的喷雾。");
            }
            else
            {
               outputText("你的后庭随机地紧缩痉挛，渴望被什么东西填满，任何东西都可以，只为寻求释放。");
            }
            outputText("高潮的快感让你向前瘫倒，四肢着地。然而，你金发的爱人紧紧抓住你的大腿，显然打算全额偿还她的债务。");
            outputText("[pg]几次高潮过后，你几乎成了一滩在地上颤抖的肉泥。她从你身下钻出来，舔了舔嘴唇，很高兴地吞下了你最后的汁液。卡露轻轻揉了揉你的背，说道：[say:希望你学到了点什么，亲爱的。]你只能呻吟着回应，你的身体因为连续的高潮而酸痛，实在无法做出任何连贯的回答。");
            outputText("[pg]金发水獭把她所有的装备堆在一起，把比基尼泳裤塞进一个帆布袋里。她从同一个袋子里拿出一块用大绿叶包裹的、散发着美味香气的熟鱼。她把它放在你还在颤抖的身体旁边，简单地说：[say:别以为我忘了我们的晚餐，亲爱的。你一能走路，我建议你就把它吃了，你看起来饿了。]你心不在焉地点点头，伸手去摸那块包好的鱼。卡露又快速揉了揉你的背，然后收拾好她的东西，沿着海滩走去，肚脐以下一丝不挂。");
            outputText("[pg]你花了一分钟恢复，然后也照做了。");
         }
         else
         {
            outputText("你一同意，她脸上就露出了狡黠的笑容。她把鱼竿的一端像柱子一样插进沙子里，防止它跑掉，然后站了起来。没有任何挑逗，没有任何仪式，她脱下比基尼泳裤扔到一边。她新露出的耻骨丘上只有最稀疏的一簇阴毛，一小撮金发" + (get_noFur() ? "" : "在稀疏的棕色皮毛中") + "。");
            outputText("[pg]你走上前，打算摸摸卡露还藏在比基尼上衣下的小乳房，但她举起一只手说：[say:哇哦，亲爱的，“钓鱼操”可不是这么玩的。你只要躺下，我会处理好一切。确保你像刚出生的婴儿一样光着身子。]");
            outputText("[pg]虽然奇怪，但你还是照做了，脱下你的[armor]和装备扔到一边。卡露指示你躺在海滩上她的鱼竿旁边，你也照做了。水獭女孩跨坐在你的肚子上，背对着你，不过谢天谢地，她粗重的大尾巴没有碰到你的脸。");
            outputText("[pg]卡露俯下身，把身体趴在你身上，这样她温暖、散发着甜味的小穴就正好在你面前。同时，你感觉到纤细有力的手指在探测你的[vagOrAss]。一条长长的湿舌头舔过你的");
            if(get_player().hasVagina())
            {
               outputText("阴唇");
            }
            else
            {
               outputText("后庭");
            }
            outputText("，你觉得有必要对她做同样的事。你伸出舌头，舔舐她娇嫩的阴唇。没过多久，它们就变得肿胀发红，像一朵淫靡的花朵一样绽放开来。你的舌头在每一道褶皱上上下游走，偶尔停下来用舌尖轻弹她迅速变硬的阴蒂。");
            outputText("[pg]同样，她的舌头和嘴唇在你的肌肤上舞动，就像三个舞者。它们旋转、跳跃、挑逗。没有一寸肌肤被遗漏。从你的");
            if(get_player().hasVagina())
            {
               outputText("阴蒂");
            }
            else
            {
               outputText("不自然的平坦胯部");
            }
            outputText("一路向下直到你的后庭，她留下了一串湿漉漉的吻痕。你模仿着她的动作，试图给她带来同样的体验。一声低沉的呻吟从她唇间溢出，当你的舌头舔到正确的位置时，她在你上方微微扭动。");
            outputText("[pg]享受了几分钟美味的六九式后，卡露在你的阴阜上印下最后一吻，然后坐起身，几乎把你的脸埋进了她的小穴里。[say:你就乖乖坐好，让你的舌头动起来，好吗？钓鱼操的关键，当然是鱼啦。]你表达了不满，但发出的声音却变成了含糊不清的[say:唔唔唔……]卡露无视了你的抗议，反而拿起了她的鱼竿，往后坐得更深，将自己更紧地压在你的脸上。她那迷人的臀部挡住了你的视线，你什么也看不见，只能听到她鱼竿发出轻微的[say:滴答]声。");
            outputText("[pg]你很清楚，只要你想，你完全可以挣脱，但这女孩身上那股麝香味的鼬科小穴气味实在是太强烈、太醉人、太美妙了，让你无法忽视。你没有挣扎，而是开始大快朵颐，把脸埋在里面，舔舐、吸吮着压在你嘴上的阴唇。你的舌头上下翻飞，进进出出，挑逗着她柔软肿胀的阴唇，用力顶着她坚硬发酸的阴蒂，尽情品尝着她的小穴。");
            get_images().showImage("callu-sex-facesit");
            if(get_player().hasLongTongue())
            {
               outputText("你伸出异常长舌，深深探入卡露的体内。这竟然让这位渔夫发出了一声小小的尖叫，她震惊地左右扭动着。你让舌头继续深入，仿佛那是一根肉棒。你在深入的同时撑开她，从内到外品尝着这只水獭，沉醉在她甜美紧致的小穴中。最终，你的舌头遇到了一处障碍，一个紧致的环挡住了你的去路。你咧嘴笑了，或者至少尽力尝试去笑，毕竟有一只水獭女孩坐在你的脸上，而且你嘴里还伸出了12英寸长的舌头。你的舌尖在她的子宫颈周围打转，然后找到中心，慢慢推入。卡露又发出一声[say:咿]，不过这次变成了满足的叹息。随着你的舌尖进入她的子宫，你开始用唾液涂抹她的肉壁。你舌头的每一次温柔舔舐，都让骑在你脸上的女孩爽得发抖。然而，美好的事物总有结束的时候，你的舌头最终累得不行，你别无选择，只能把它收回来。");
            }
            outputText("这种情况持续了大半个小时。你发现自己一直在寻找那些能让你性感的小朋友跳起来尖叫的敏感点，而她则一条接一条地钓鱼。几次高潮、半打鱼，以及一张极其凌乱的脸之后，你听到卡露最后一次收线，然后伴随着咔嗒声把它放在一边。她从你脸上站起来，让你再次呼吸到新鲜空气。");
            outputText("[pg]渔夫低头对你咧嘴一笑，你的脸上沾满了她的淫液，她俯下身，给了你一个大大的吻。[say:嗯，真是一顿美味的大餐，]她说道。[say:既然你对我这么好，我只想回报你。]卡露回到了最初的六九式姿势，但她抓住你，翻身躺平。");
            outputText("[pg]你坐起身，这次跨坐在她的脸上，而她则一头扎进了你的");
            if(get_player().hasVagina())
            {
               outputText("颤抖的小穴");
            }
            else
            {
               outputText("臀部");
            }
            outputText("。她的嘴唇仿佛有魔力一般，吸吮并尽情地爱抚着你的整个胯部。当她服侍你时，你发现自己全身都在因快感而颤抖，随着她的舌头按压你所有的敏感点，你的身体迅速升温。在卡露的服侍下，从指尖到脚趾，你的一切都在发麻、颤抖，让你在她的脸上扭动起伏，喉咙里发出一声极度满足的低吼。");
            outputText("[pg]你抓住自己的[nipples]，在卡露忙活的时候开始把玩它们。你的手指灵巧地揉捏挑逗着它们，深知所有能让你兴奋起来的正确技巧。");
            if(get_player().hasFuckableNipples())
            {
               outputText("你甚至滑了一两根手指进去，撑开你的乳头小穴，带来了极其愉悦的结果。");
            }
            outputText("再加上卡露温柔的舌头");
            if(get_player().hasVagina())
            {
               outputText("在你的湿润小穴上卖力舔舐");
            }
            else
            {
               outputText("在你的后庭里进行洞穴潜水");
            }
            outputText("，你坚持不了多久了。你体内所有的酥麻感似乎都被挤压进了血管，汇聚在腹股沟的一个点上。随着高潮的能量开始溢出，压力越来越大。你的手脚颤抖，脑袋不由自主地摇晃，你甚至猜不到你的脊椎想干什么。[pg]");
            outputText("体内的快感终于爆发出来，穿透每一根神经，点燃你存在的每一寸纤维。");
            if(get_player().hasVagina())
            {
               outputText("你的小穴紧缩着，夹紧了空气，将你女性的淫液喷洒在卡露的脸上，化作一阵美味清爽的喷雾。");
            }
            else
            {
               outputText("你的后庭随机地紧缩痉挛，渴望被什么东西填满，任何东西都可以，只为寻求释放。");
            }
            outputText("高潮的快感让你向前瘫倒，四肢着地。然而，你金发的爱人紧紧抓住你的大腿，显然打算全额偿还她的债务。");
            outputText("[pg]几次高潮过后，你几乎成了一团颤抖的肉块，骑在渔家女的脸上。她从你身下钻出来，舔了舔嘴唇，很高兴能把你最后的汁液吞下肚。卡露轻轻揉了揉你的背，说道：[say:这可真是个让人神清气爽的休息，亲爱的。]你只能呻吟着回应，你的身体因为接连不断的高潮而酸痛不已，实在无法做出任何连贯的回答。");
            outputText("[pg]金发水獭把她所有的渔具堆在一起，把她的比基尼泳裤塞进一个帆布袋里。她从同一个袋子里拿出一块用大绿叶包裹着的、散发着诱人香味的熟鱼。她把它放在你还在颤抖的身体旁边，简单地说：[say:鱼和操，亲爱的。我得到了我的，你得到了你的。]你心不在焉地点点头，伸手去摸那块包好的鱼。卡露又快速地揉了揉你的背，然后收拾好东西，光着下半身沿着海滩走去。");
            outputText("[pg]你花了几分钟才恢复过来，然后也离开了。");
         }
         get_player().orgasm("VaginalAnal");
         dynStats(DynStat.Sens(-1));
         doNext(gainFishFillet);
      }
      
      public function ottergirlLikesDongs() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         clearOutput();
         if(get_player().isChild())
         {
            get_images().showImage("callu-sex-fuck");
            outputText("你一同意，她脸上就露出了狡黠的笑容。她把鱼竿的一端像柱子一样插进沙子里，防止它跑掉，然后站了起来。没有任何挑逗，没有任何仪式，她脱下比基尼泳裤扔到一边。她新露出的耻骨丘上只有最稀疏的一簇阴毛，一小撮金发" + (get_noFur() ? "" : "在稀疏的棕色皮毛中") + "。");
            outputText("[pg]你忍不住走上前去，想要抚摸卡露依然藏在比基尼上衣下的小乳房，但她举起一只手说道，[say: 啊啊，这可不是年轻" + get_player().mf("绅士","淑女") + "该有的行为。你只要躺下，让大人来干活就行了。现在，做个乖[boy]，把衣服脱了。]");
            outputText("[pg]你急切地照做，脱下你的[armor]和装备，把它们扔到一边。卡露让你躺在沙滩上，就在她的鱼竿旁边，你也照做了。这个水獭女孩跨坐在你的肚子上，背对着你，不过谢天谢地，她那粗大沉重的尾巴没有扫到你的脸。");
            _loc3_ = -1;
            _loc1_ = 0;
            while(_loc1_ < get_player().cockTotal())
            {
               if(get_player().cocks[_loc1_].cockLength < 48)
               {
                  if(_loc3_ < 0)
                  {
                     _loc3_ = _loc1_;
                  }
                  else if(get_player().cocks[_loc1_].cockLength > get_player().cocks[_loc3_].cockLength)
                  {
                     _loc3_ = _loc1_;
                  }
               }
               _loc1_++;
            }
            if(_loc3_ < 0)
            {
               _loc3_ = get_player().smallestCockIndex();
            }
            _loc2_ = _loc3_;
            if(get_player().cocks[_loc2_].cockLength < 6)
            {
               outputText("[pg][say: 这才对嘛，这小东西真可爱，]她一边打量着你那迷你的肉棒一边评论道。[say: 我还从来没见过这么小的。我的意思是，我料到这么年轻的人不会很大，但该死。我只想给它系个小蝴蝶结，然后抱着它睡觉！]");
            }
            else if(get_player().cocks[_loc2_].cockLength < 10)
            {
               outputText("[pg][say: 哎呀，原来你只有腰部以上算年轻？那也没什么不好的，]她一边打量着你的肉棒一边评论道。");
            }
            else if(get_player().cocks[_loc2_].cockLength < 24)
            {
               outputText("[pg][say: 哇，你这个年纪就已经这么大了？]她打量着你那硕大的肉棒评论道。[say: 等你完全长大了，我敢打赌你都能和半人马比一比了。]");
            }
            else
            {
               outputText("[pg][say: 哇哦，]她说道，眼睛睁得大大的，贪婪地盯着你那巨大的肉棒。[say: 那个。那个东西，亲爱的，绝对是一条顶级的裤裆巨蟒，即使对成年人来说也是。我见过一些半人马，在你面前简直就像被阉了一样。你长大后是打算去当水管还是怎么的？]");
            }
            outputText("她悠闲地伸展身体，趴在你的肚子和胸膛上，让她的阴户正好停在你的脸前。");
            outputText("[pg]你感觉到纤细但有力的手指包裹住你的阴茎，紧接着是一双嘴唇。它们环绕着你的" + get_player().cockHead(_loc2_) + "并开始吸吮，产生一种令人愉悦的刺痛感，顺着你的阴茎传遍全身。");
            outputText("[pg][saystart]嘿，亲爱的，最好开始舔吧，我们想让你的");
            if(get_player().cocks[_loc2_].cockLength < 6)
            {
               outputText("小鸡鸡");
            }
            else
            {
               outputText("坏小子");
            }
            outputText("顺利滑进去，不是吗？[sayend] 卡露向你发出咕噜声。你当然想，所以你微微向前倾斜头部，伸出舌头舔舐她娇嫩的阴唇。没过多久，它们就变得肿胀发红，像一朵淫靡的花朵一样绽放开来。你的舌头在她的每一个褶皱上游走，偶尔停下来轻弹她迅速变硬的阴蒂。");
            outputText("[pg]同样，她的舌头和嘴唇在你的" + get_player().cockDescript(_loc2_) + "上像三个舞者一样跳舞。它们旋转、扭动、跳跃和挑逗，确保没有一寸肌肤被遗漏。");
            outputText("她特别关注");
            if(get_player().cocks[_loc2_].get_cockType() == CockTypesEnum.HORSE)
            {
               outputText("你的龟头冠状沟，吸吮、挑逗和");
            }
            else if(get_player().hasKnot(_loc2_))
            {
               outputText("到你阴茎的根部，在你[cockanimalityadj]的[knotword]上印下湿漉漉的吻，");
            }
            else if(get_player().cocks[_loc2_].get_cockType() == CockTypesEnum.DEMON)
            {
               outputText("到环绕你阴茎的恶魔结节，");
            }
            else if(get_player().cocks[_loc2_].get_cockType() == CockTypesEnum.ANEMONE)
            {
               outputText("到环绕你龟头和根部的蠕动小触手，");
            }
            else
            {
               outputText("到龟头下方敏感的小点，");
            }
            outputText("对它倾注了大量的关注。先列腺液和唾液几乎顺着你的肉棒流淌下来，弄得你的");
            if(get_player().balls > 0 && get_player().hasVagina())
            {
               outputText("蛋蛋和小穴");
            }
            else if(get_player().balls > 0)
            {
               outputText("蛋蛋");
            }
            else if(get_player().hasVagina())
            {
               outputText("小穴");
            }
            else
            {
               outputText("屁股");
            }
            outputText("发痒，因为它们滴落下来，在你的[legs]之间形成了一小滩水渍。");
            outputText("[pg]几分钟后，卡露松开了你的阴茎，说道：[say:嗯，好了……现在，让我们开始你的课程吧。]她坐起身，将自己置于你的" + get_player().cockDescript(_loc2_) + "上方。她慢慢地降低身体，首先吞下你的" + get_player().cockHead(_loc2_) + "。她的小穴虽然紧致，但因为湿润和兴奋，没有提供任何阻力。它的内壁在你周围跳动和颤抖，就好像这只水獭完全控制了它一样。她一寸一寸地往下沉，");
            if(get_player().cocks[_loc2_].cockLength < 10)
            {
               outputText("直到她坐在你的大腿上");
            }
            else if(get_player().cocks[_loc2_].cockLength < 24)
            {
               outputText("慢慢吞没你整根肉棒，直到她最终坐在你的大腿上");
            }
            else
            {
               outputText("这是一个极其漫长的过程，几英尺长的坚硬肉棒消失在她的穴里。有一瞬间微小的阻力，接着是一声轻柔的吧唧声，卡露突然发出一声[say:哦哦]。带着不小的惶恐，你意识到你刚刚插进了她的子宫。从她面对的方向你看不出来，但你确信此刻她的肚子一定向外凸起了");
            }
            outputText("。");
            outputText("[pg]随着你整个");
            if(get_player().cocks[_loc2_].cockThickness >= 3)
            {
               outputText("惊人的");
            }
            outputText("粗大肉棒埋入她体内，她在你的腿上坐定，伸直双腿，然后拿回她的鱼竿。[say: 现在，别乱动，亲爱的，]卡露转过头来说。[say: 我们还得抓点晚餐，可不想把它们吓跑，对吧？]");
            outputText("[pg]令人惊讶的是，你仍然能感觉到你的" + get_player().cockDescript(_loc2_) + "周围在跳动，这再次证实了你的想法，她不知怎么的能控制腹部深处的肌肉。即使你一动不动地躺在沙滩上，你也能感觉到抽插的感觉，就好像你在主动操着坐在你上面的老师一样。这种感觉非常舒服，更不用说还有点催眠。你伸出手轻轻抓住卡露的臀部。她似乎并不介意，不过当你开始配合着幻觉中的抽插节奏捏她时，你的手挨了快速的一巴掌，让你知道你越界了。");
            outputText("[pg]无事可做，你闭上眼睛放松下来。这个水獭女孩紧致小穴有节奏的跳动似乎加深了你的放松感，尽管你的鸡巴依然坚硬如铁。几分钟过去了，抽插的感觉似乎并没有减弱。");
            outputText("[pg]突然，一阵奇怪的高亢声音响起，你猛地抬起头，只见卡露正在收线。她打量了一下钓上来的鱼，对自己点了点头，然后把它塞进了一个巧妙地埋在你们俩旁边沙子里的冰盒里。之后她站了起来，让你的阴茎从她体内滑出。你的" + get_player().cockDescript(_loc2_) + "感觉怪怪的，而且不知为何光溜溜的很不舒服，尤其是当凉风吹过它沾满唾液和淫液的皮肤时。");
            outputText("[pg]至少它不用受苦太久，因为卡露重新抛出鱼线，再次跨坐在你的阴茎上。她一寸一寸地吞没你，美妙的感觉让你浑身颤抖。然而，这一次她并没有完全坐下。相反，她跨坐在你的腰上，踮起脚尖。那种熟悉的跳动感又回来了，但除此之外，她还扭动着臀部，一圈又一圈地旋转。随着每一次旋转，你感觉你的阴茎被挤压得越来越紧，但这一次你不能简单地放松并闭上眼睛，因为那个迷人的翘臀就在你面前摇晃。");
            outputText("[pg]她的臀部摇摆、旋转、打转、踮脚尖旋转，但整个过程中她对鱼线的注意力始终如一。就好像你只是她一天中的一个小插曲；就好像这种带来令人兴奋感觉的性爱是家常便饭。她臀部的动作越来越激烈，那个甜美火热的穴里的跳动也越来越强烈。没过多久，你的视线开始变得模糊，你的身体紧绷，被令人愉悦的高潮电流所折磨。");
            outputText("[pg]你的身体弓起，将肉棒完全插入卡露体内，你们的臀部相撞，发出一声淫荡湿润的吧唧声。你的肉棒抽搐着，将一股又一股的精液喷射进水獭女孩贪婪的阴户里。");
            if(get_player().cumQ() >= 250)
            {
               outputText("量实在太多了，");
               if(get_player().cumQ() < 500)
               {
                  outputText("有些开始顺着你的阴茎滴落，在你的屁股蛋下面形成了一个水坑");
               }
               else if(get_player().cumQ() < 1000)
               {
                  outputText("它开始从你的阴茎边缘喷射出来，就像水从堵塞的水龙头里喷出来一样");
               }
               else if(get_player().cumQ() < 2000)
               {
                  outputText("卡露的肚子开始明显地膨胀起来，即使从你的角度也能看出来");
               }
               else
               {
                  outputText("卡露的肚子膨胀到了一个巨大的程度。她突然看起来像怀孕八个月了，尽管她似乎一点也不在意");
               }
               outputText("。");
            }
            outputText("她的子宫贪婪地吸收着一切，直到你筋疲力尽地倒在地上。");
            outputText("[pg]令你惊讶的是，卡露只是继续她刚才的动作");
            if(get_player().cumQ() >= 2000)
            {
               outputText("，尽管她现在挺着个大肚子");
            }
            outputText("。旋转、抽插和她小穴持续不断的节奏共同作用，让你硬得难以忍受。显然她还不满足。");
            outputText("[pg]至少又高潮了三次，钓到了七条鱼，卡露才放松下来；她固定好鱼竿，把它放在一边。她向后躺下，将背部压在你的肚子和胸膛上，转过头来亲吻你的嘴唇。[say: 嗯，你真是个好学生，亲爱的，]她咕哝着，依然紧紧夹着你的肉棒。[say: 我以前从来没见过像你这样的孩子。]这位女渔夫准备站起来，然后");
            if(get_player().hasKnot(_loc2_))
            {
               outputText("失败了，被将你们俩紧紧连在一起的肉结给卡住了。她惊讶地看着你，但最终还是笑了笑，重新躺了下来。你们俩依偎了半个小时，直到你的肉结消退到足以让她“啵”的一声拔出来。她站起身，并且");
            }
            outputText("把她的比基尼泳裤塞进一个帆布袋里。");
            outputText("[pg]她从同一个包里拿出一块用大绿叶包裹着的、散发着诱人香味的熟鱼肉。她把它递给你，简单地说：[say: 我可没忘了晚饭，亲爱的，好好享用吧。]你心不在焉地点点头，接过包好的鱼肉。卡露轻轻拍了拍你迅速软下去的阴茎，然后收拾好东西，沿着海滩走去，留下一串精液和其他爱液的痕迹。");
            outputText("[pg]你花了一分钟恢复，然后也照做了。");
         }
         else
         {
            outputText("你一同意，她脸上就露出了狡黠的笑容。她把鱼竿的一端像柱子一样插进沙子里，防止它跑掉，然后站了起来。没有任何挑逗，没有任何仪式，她脱下比基尼泳裤扔到一边。她新露出的耻骨丘上只有最稀疏的一簇阴毛，一小撮金发" + (get_noFur() ? "" : "在稀疏的棕色皮毛中") + "。");
            outputText("[pg]你走上前，打算摸摸卡露还藏在比基尼上衣下的小乳房，但她举起一只手说：[say:哇哦，亲爱的，“钓鱼操”可不是这么玩的。你只要躺下，我会处理好一切。确保你像刚出生的婴儿一样光着身子。]");
            outputText("[pg]虽然奇怪，但你还是照做了，脱下你的[armor]和装备扔到一边。卡露指示你躺在海滩上她的鱼竿旁边，你也照做了。水獭女孩跨坐在你的肚子上，背对着你，不过谢天谢地，她粗重的大尾巴没有碰到你的脸。");
            _loc3_ = -1;
            _loc1_ = 0;
            while(_loc1_ < get_player().cockTotal())
            {
               if(get_player().cocks[_loc1_].cockLength < 48)
               {
                  if(_loc3_ < 0)
                  {
                     _loc3_ = _loc1_;
                  }
                  else if(get_player().cocks[_loc1_].cockLength > get_player().cocks[_loc3_].cockLength)
                  {
                     _loc3_ = _loc1_;
                  }
               }
               _loc1_++;
            }
            if(_loc3_ < 0)
            {
               _loc3_ = get_player().smallestCockIndex();
            }
            _loc2_ = _loc3_;
            if(get_player().cocks[_loc2_].cockLength < 6)
            {
               outputText("[pg][say: 哎呀妈呀，这小东西可真可爱，]她一边检查你那小巧的阴茎一边评论道。[say: 我还从来没见过这么小的。我简直想给它系个小蝴蝶结，然后抱着它睡觉。你确定这不是阴蒂吗，亲爱的？]");
            }
            else if(get_player().cocks[_loc2_].cockLength < 10)
            {
               outputText("[pg][say: 只是普通尺寸，嗯？那也没什么不好的，]她一边检查你的阴茎一边评论道。");
            }
            else if(get_player().cocks[_loc2_].cockLength < 24)
            {
               outputText("[pg][say: 哎呀，这可真是块充满男子气概的好肉，]她一边检查你那硕大的阴茎一边评论道。[say: 我可以一整天都享受这个坏小子。]");
            }
            else
            {
               outputText("[pg][say: 哇哦，]她说道，眼睛睁得大大的，贪婪地盯着你那巨大的阴茎。[say: 那个。那个东西，亲爱的，绝对是一条顶级的裤裆蛇。我见过的半人马在你面前都像被阉了一样。]");
            }
            outputText("她悠闲地伸展身体，趴在你的肚子和胸膛上，让她的阴户正好停在你的脸前。");
            outputText("[pg]你感觉到纤细但有力的手指包裹住你的阴茎，紧接着是一双嘴唇。它们环绕着你的" + get_player().cockHead(_loc2_) + "并开始吸吮，产生一种令人愉悦的刺痛感，顺着你的阴茎传遍全身。");
            outputText("[pg][saystart]嘿，亲爱的，最好开始舔吧，我们想让这个");
            if(get_player().cocks[_loc2_].cockLength < 6)
            {
               outputText("想当鸡巴的小东西");
            }
            else
            {
               outputText("坏小子");
            }
            outputText("顺利滑进去，不是吗？[sayend] 卡露向你发出咕噜声。你当然想，所以你微微向前倾斜头部，伸出舌头舔舐她娇嫩的阴唇。没过多久，它们就变得肿胀发红，像一朵淫靡的花朵一样绽放开来。你的舌头在她的每一个褶皱上游走，偶尔停下来轻弹她迅速变硬的阴蒂。");
            outputText("[pg]同样，她的舌头和嘴唇在你的" + get_player().cockDescript(_loc2_) + "上像三个舞者一样跳舞。它们旋转、扭动、跳跃和挑逗，确保没有一寸肌肤被遗漏。");
            outputText("她特别关注");
            if(get_player().cocks[_loc2_].get_cockType() == CockTypesEnum.HORSE)
            {
               outputText("你的龟头冠状沟，吸吮、挑逗和");
            }
            else if(get_player().hasKnot(_loc2_))
            {
               outputText("到你阴茎的根部，在你[cockanimalityadj]的[knotword]上印下湿漉漉的吻，");
            }
            else if(get_player().cocks[_loc2_].get_cockType() == CockTypesEnum.DEMON)
            {
               outputText("到环绕你阴茎的恶魔结节，");
            }
            else if(get_player().cocks[_loc2_].get_cockType() == CockTypesEnum.ANEMONE)
            {
               outputText("到环绕你龟头和根部的蠕动小触手，");
            }
            else
            {
               outputText("到龟头下方敏感的小点，");
            }
            outputText("对它倾注了大量的关注。先列腺液和唾液几乎顺着你的肉棒流淌下来，弄得你的");
            if(get_player().balls > 0 && get_player().hasVagina())
            {
               outputText("蛋蛋和小穴");
            }
            else if(get_player().balls > 0)
            {
               outputText("蛋蛋");
            }
            else if(get_player().hasVagina())
            {
               outputText("小穴");
            }
            else
            {
               outputText("屁股");
            }
            outputText("发痒，因为它们滴落下来，在你的[legs]之间形成了一小滩水渍。");
            outputText("[pg]这样过了几分钟后，卡露松开了你的肉棒，说道：[say:嗯，我想这样应该就可以了。]她坐起身，跨坐在你的" + get_player().cockDescript(_loc2_) + "上方。她慢慢地降下身子，首先吞下了你的" + get_player().cockHead(_loc2_) + "。她的小穴虽然紧致，但因为湿润和发情，并没有产生什么阻力。肉壁在你周围跳动颤抖，仿佛这只水獭能完全控制它一样。她一寸一寸地继续往下坐，");
            if(get_player().cocks[_loc2_].cockLength < 10)
            {
               outputText("直到她坐在你的大腿上");
            }
            else if(get_player().cocks[_loc2_].cockLength < 24)
            {
               outputText("慢慢吞没你整根肉棒，直到她最终坐在你的大腿上");
            }
            else
            {
               outputText("这是一个极其漫长的过程，几英尺长的坚硬肉棒消失在她的穴里。有一瞬间微小的阻力，接着是一声轻柔的吧唧声，卡露突然发出一声[say:哦哦]。带着不小的惶恐，你意识到你刚刚插进了她的子宫。从她面对的方向你看不出来，但你确信此刻她的肚子一定向外凸起了");
            }
            outputText("。[pg]");
            outputText("随着你整根");
            if(get_player().cocks[_loc2_].cockThickness >= 3)
            {
               outputText("惊人的");
            }
            outputText("粗大肉棒埋入她体内，她在你的大腿上坐定，伸直双腿，然后拿起了她的鱼竿。[say:现在别乱动，亲爱的，]卡露转过头说道。[say:我可不想把鱼吓跑。等我钓到几条好鱼就放你走。]");
            outputText("[pg]令人惊讶的是，你仍然能感觉到你的" + get_player().cockDescript(_loc2_) + "周围在跳动，这再次证实了你的想法：她不知怎的能控制埋藏在腹部的肌肉。即使你一动不动地躺在沙滩上，你也能感觉到抽插的快感，就好像你在主动操着这个坐在你身上的小骚货一样。这种感觉非常舒服，更不用说还有点催眠。你伸出手轻轻抓住卡露的臀部。她似乎并不介意，但当你开始配合着幻觉般的抽插节奏揉捏她时，她迅速拍了一下你的手，让你知道你越界了。[pg]");
            if(get_player().cocks[_loc2_].get_cockType() == CockTypesEnum.AVIAN)
            {
               get_images().showImage("callu-sex-avian");
            }
            else if(get_player().cocks[_loc2_].get_cockType() == CockTypesEnum.KANGAROO)
            {
               get_images().showImage("callu-sex-kangaroo");
            }
            else if(get_player().cocks[_loc2_].get_cockType() == CockTypesEnum.TENTACLE)
            {
               get_images().showImage("callu-sex-tentacle");
            }
            else if(get_player().cocks[_loc2_].get_cockType() == CockTypesEnum.ANEMONE)
            {
               get_images().showImage("callu-sex-anemone");
            }
            else if(get_player().cocks[_loc2_].get_cockType() == CockTypesEnum.ECHIDNA)
            {
               get_images().showImage("callu-sex-echidna");
            }
            else if(get_player().cocks[_loc2_].get_cockType() == CockTypesEnum.LIZARD)
            {
               get_images().showImage("callu-sex-reptile");
            }
            else if(get_player().cocks[_loc2_].get_cockType() == CockTypesEnum.DRAGON)
            {
               get_images().showImage("callu-sex-dragon");
            }
            else if(get_player().cocks[_loc2_].get_cockType() == CockTypesEnum.DEMON)
            {
               get_images().showImage("callu-sex-demon");
            }
            else if(get_player().cocks[_loc2_].get_cockType() == CockTypesEnum.HORSE)
            {
               get_images().showImage("callu-sex-horse");
            }
            else if(get_player().cocks[_loc2_].get_cockType() == CockTypesEnum.HUMAN)
            {
               get_images().showImage("callu-sex-human");
            }
            else if(get_player().cocks[_loc2_].get_cockType() == CockTypesEnum.HUMAN)
            {
               get_images().showImage("callu-sex-human");
            }
            else if(get_player().cocks[_loc2_].get_cockType() == CockTypesEnum.CAT)
            {
               get_images().showImage("callu-sex-cat");
            }
            else if(Boolean([CockTypesEnum.DOG,CockTypesEnum.WOLF,CockTypesEnum.FOX].contains(get_player().cocks[_loc2_].get_cockType())))
            {
               get_images().showImage("callu-sex-dog");
            }
            else
            {
               get_images().showImage("callu-sex-fuck");
            }
            outputText("无事可做，你闭上眼睛放松下来。这个水獭女孩紧致小穴有节奏的跳动似乎加深了你的放松感，尽管你的肉棒依然坚硬如铁。几分钟过去了，抽插的感觉似乎并没有减弱。");
            outputText("[pg]突然，一阵奇怪的高亢声音响起，你猛地抬起头，只见卡露正在收线。她打量了一下钓上来的鱼，对自己点了点头，然后把它塞进了一个巧妙地埋在你们俩旁边沙子里的冰盒里。之后她站了起来，让你的阴茎从她体内滑出。你的" + get_player().cockDescript(_loc2_) + "感觉怪怪的，而且不知为何光溜溜的很不舒服，尤其是当凉风吹过它沾满唾液和淫液的皮肤时。");
            outputText("[pg]至少它不用受苦太久，因为卡露重新抛出鱼线，再次跨坐在你的阴茎上。她一寸一寸地吞没你，美妙的感觉让你浑身颤抖。然而，这一次她并没有完全坐下。相反，她跨坐在你的腰上，踮起脚尖。那种熟悉的跳动感又回来了，但除此之外，她还扭动着臀部，一圈又一圈地旋转。随着每一次旋转，你感觉你的阴茎被挤压得越来越紧，但这一次你不能简单地放松并闭上眼睛，因为那个迷人的翘臀就在你面前摇晃。");
            outputText("[pg]她的臀部摇摆、旋转、打转，但整个过程中她对鱼线的注意力始终如一。就好像你只是她一天中的一个小插曲；就好像这种带来令人兴奋的快感的性爱，是家常便饭一样。她臀部的运动加剧了，那个甜美、火热的小穴内的跳动也随之加剧。没过多久，你的视线开始变得模糊，你的身体紧绷，被令人愉悦的高潮电流所折磨。[pg]");
            outputText("你的身体弓起，将你的阴茎完全插入卡露体内，你的臀部发出淫荡、湿润的拍打声。你的阴茎抽搐着，将一股又一股的精液喷射进水獭女孩贪婪的小穴里。");
            if(get_player().cumQ() >= 250)
            {
               outputText("量实在太多了，");
               if(get_player().cumQ() < 500)
               {
                  outputText("有些开始顺着你的阴茎滴落，在你的屁股蛋下面形成了一个水坑");
               }
               else if(get_player().cumQ() < 1000)
               {
                  outputText("它开始从你的阴茎边缘喷射出来，就像水从堵塞的水龙头里喷出来一样");
               }
               else if(get_player().cumQ() < 2000)
               {
                  outputText("卡露的肚子开始明显地膨胀起来，即使从你的角度也能看出来");
               }
               else
               {
                  outputText("卡露的肚子膨胀到了一个巨大的程度。她突然看起来像怀孕八个月了，尽管她似乎一点也不在意");
               }
               outputText("。");
            }
            outputText("她的子宫贪婪地吸收着一切，直到你筋疲力尽地倒在地上。[pg]");
            outputText("令你惊讶的是，卡露只是继续她刚才的动作");
            if(get_player().cumQ() >= 2000)
            {
               outputText("，尽管她现在挺着个大肚子");
            }
            outputText("。旋转、抽插和她小穴持续不断的节奏共同作用，让你硬得难以忍受。显然她还不满足。");
            outputText("[pg]直到你又高潮了至少三次，她又钓到了七条鱼，卡露才放松下来；她固定好鱼竿并把它放在一边。她向后躺下，把背压在你的肚子和胸膛上，转过头来亲吻你的嘴唇。[say:嗯，你真是个好搭档，亲爱的，]她咕哝着，仍然紧紧夹着你的阴茎。[say:我以前从来没有遇到过像你这么棒的钓鱼操。]这位女渔夫正要站起来，却");
            if(get_player().hasKnot(_loc2_))
            {
               outputText("失败了，被将你们俩紧紧连在一起的肉结给卡住了。她惊讶地看着你，但最终还是笑了笑，重新躺了下来。你们俩依偎了半个小时，直到你的肉结消退到足以让她“啵”的一声拔出来。她站起身，并且");
            }
            outputText("把她的比基尼泳裤塞进一个帆布袋里。");
            outputText("[pg]她从同一个袋子里拿出一块闻起来很美味的熟鱼，用一片大绿叶包着。她把它递给你，简单地说：[say:钓鱼和做爱，亲爱的。我得到了我想要的，你也得到了你想要的。]你心不在焉地点点头，接过那块包好的鱼。卡露轻轻拍了拍你迅速软下来的阴茎的头部，然后收拾好她的东西，沿着海滩走去，留下了一道精液和其他爱液的痕迹。");
            outputText("[pg]你花了一分钟恢复，然后也照做了。");
         }
         get_player().orgasm("Dick");
         dynStats(DynStat.Sens(-1));
         doNext(gainFishFillet);
      }
      
      public function getSomeFishYaFatty() : void
      {
         clearOutput();
         get_images().showImage("callu-fishing");
         outputText("你告诉卡露，至少在今天，你对鱼比对做爱更感兴趣。她耸了耸肩，把鱼竿的一端像柱子一样插进沙子里，然后转身走向她的背包。");
         outputText("[pg]她拿出一块散发着诱人香味的烤鱼，撒了适量的盐，用一片大绿叶包着。[say:给你，新鲜出炉，除非你想让它还能走能说。]");
         outputText("[pg]你向卡露道谢，然后离开了。");
         doNext(gainFishFillet);
      }
      
      public function gainFishFillet() : void
      {
         clearOutput();
         get_images().showImage("item-fishFillet");
         get_inventory().takeItem(get_consumables().FISHFIL,get_camp().returnToCampUseOneHour);
      }
      
      public function execEncounter() : void
      {
         clearOutput();
         calluSprite();
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,777,FlagDict_Impl_.arrayReadInt(_loc1_,777) + 1);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,777) == 1)
         {
            outputText("你对湖畔的探索让你走得比以前更远。这里的水面几乎完全静止，湖水");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2024) != 2)
            {
               outputText("清澈见底，让你能清楚地看到令人惊叹的湖底景色");
            }
            else
            {
               outputText("只有些许浑浊，让你隐约能看到湖底的景象");
            }
            outputText("。鱼儿在水中来回穿梭，对你在水面上的探索毫不在意。");
            outputText("[pg]你观察了鱼儿几分钟，直到你注意到岸边并非只有你一人。在沙滩的更远处，坐着一个孤单的女性身影，她的双腿分开并弓起。她慵懒地握着一根钓鱼竿。你的目光顺着鱼线望去，看到一小块浮木在离岸边相当远的水面上上下浮动。");
            outputText("[pg]你决定靠近这个身影，她也注意到了你的靠近。你发现她微微调整了姿势，似乎准备好一旦你表现出敌意就立刻逃跑。但她还是让你靠近了。你走得越近，就越能看清她的特征。她的皮肤看起来" + (get_noFur() ? "像人类一样光滑" : "覆盖着潮湿的棕色毛发") + "。一条又长又粗的尾巴从她身后伸出，至少有她的腿那么粗，末端逐渐变细成一个圆润的尖端。一头被阳光漂白的金色短发勉强及下巴，衬托着一张类似人类的脸庞，还有一个可爱的翘鼻头。她的身体像游泳健将一样轻盈结实，只穿着一套两件式比基尼。她的胸部出奇地小，也许只有A罩杯，尽管她看起来身体已经发育成熟。认出这个人是个水獭女孩，你猜想胸部太大会让她很难游泳。[pg]");
            get_images().showImage("callu-intro");
            if(get_player().isChild())
            {
               outputText("[pg]你在离她几英尺远的地方停下。她给了你一个友好的微笑。[say: 看看我们发现了什么，你迷路了吗，小家伙？]她带着轻微的口音问道，让你想起了英格纳姆农夫们的女儿。她的目光在你的身体上下打量。[say: 独自在这个湖边游荡很危险的，外面有那么多讨厌的恶魔……]她用一种居高临下的语气说道，[say: 你想吃点什么吗？]");
               outputText("[pg]你对她的提议感到有些惊讶。这有什么阴谋吗？");
               outputText("[pg][say: 没有阴谋，亲爱的，]她简单地回答道。[say: 反正我总是钓得太多。而且你看起来确实很需要吃点东西，[boy]。]");
               outputText("[pg]你觉得她没有说谎，她看起来一点也不像坏人，而且你确实需要一些食物。");
               if(get_silly())
               {
                  outputText("一个念头在你的脑海中闪过：她可能是个恋童癖；但话又说回来，你真的觉得有人会那样做吗？只是给一个孩子一些食物，然后操" + get_player().mf("他？","她？"));
               }
               outputText("你在她旁边坐下，礼貌地询问她的名字。");
               outputText("[pg][say: 我叫卡露。别担心，亲爱的，我可不打算做任何你没要求的事，]她柔和的声音响起，[say: 不像这附近的其他东西……抱歉我爆粗口了。]");
               outputText("[pg]你待在那里看着她钓鱼。过了几分钟，你的眼睛开始不由自主地向卡露的身体看去");
               if(get_player().hasCock())
               {
                  if(get_player().longestCockLength() <= 5)
                  {
                     outputText("，你感觉到你的[cock]勃起了");
                  }
                  else
                  {
                     outputText("，你无法隐藏你那不成比例的勃起");
                  }
               }
               if(get_player().hasVagina())
               {
                  outputText("并且你的[pussy]开始变湿了");
               }
               else if(!get_player().hasCock() && !get_player().hasVagina())
               {
                  outputText("，幸运的是，除了你涨红的脸，你没有任何东西可以暴露你的欲望");
               }
               outputText("。");
               outputText("[pg]你的反应并没有被忽视，卡露抓住了你色眯眯地盯着她私密部位的眼神。[say: 哎呀呀，你可真是个调皮的[boy]。这样盯着别人看可不礼貌，别人可能会觉得你是个变态，]她用一种威严的声音说道。你试图掩饰你的尴尬，她把钓鱼竿钉在地上，发出一声烦躁的叹息。[say: 我看你肯定是到了那个年纪了，对吧？]她说着，轻轻拍了拍你的头[say: 不如让我在这方面给你点“特别指导”怎么样？]");
               outputText("[pg]那么？");
            }
            else
            {
               outputText("[pg]你在离她几英尺远的地方停了下来。她给了你一个友好的微笑。[say: 嘿，朋友。你闻起来不像那些恶魔家伙，]她带着淡淡的口音说道，让你想起了英格纳姆农夫的女儿们。她的目光在你的身体上下游走。[say: 那么，]她愉快地说道，[say: 你想边钓鱼边做爱吗？]");
               outputText("[pg]你忍不住挑起眉毛。她说什么？");
               outputText("[pg][say: 边钓鱼边做爱，]她简单地回答道。[say: 我钓鱼，你做爱。你不会是个傻子吧，[boy]？]");
               outputText("[pg]就这样？她甚至都不认识你，就这么直接提出来了？");
               if(get_silly())
               {
                  outputText("没有悲惨的背景故事要经历？没有烦人的战斗遭遇？只是见面然后做爱？天哪，这个世界怎么了？");
               }
               outputText("你甚至不知道她的名字！");
               outputText("[pg][say: 我叫卡露。别担心，亲爱的，我可不打算把什么东西塞到不该塞的地方，]她柔和的声音响起，[say: 不像这附近的其他东西。]");
               outputText("[pg]那么，怎么样？");
            }
         }
         else
         {
            get_images().showImage("callu-repeat");
            if(get_player().isChild())
            {
               outputText("你对湖泊的探索将你带回了水獭女孩卡露身边。她慵懒地坐在沙滩上；像往常一样手里拿着钓鱼竿。当你走近时，她友好地挥了挥手，并拍了拍她旁边湖边的沙地。");
               outputText("[pg][say: 哟，看看又是谁来了。]你在她旁边坐下，放松下来，只是坐着看着简易的浮标在水中倾斜摇摆。[say: 你想接受一些额外的指导吗？]她突然问道，把一缕被阳光漂白的金发从脸上拨开。");
               outputText("[pg]那么，你想吗？");
            }
            else
            {
               outputText("你对湖泊的探索将你带回了水獭女孩卡露身边。她慵懒地坐在沙滩上；像往常一样手里拿着钓鱼竿。当你走近时，她友好地挥了挥手，并拍了拍她旁边湖边的沙地。");
               outputText("[pg][say: 哎呀，看到你可真让人高兴。]你在她身边坐下放松，只是坐着看着简易的浮标在水中摇曳。[say: 那你想来一场“钓鱼加打炮”吗？]她突然问道，将一缕被阳光漂白的金发从脸上拂开。");
               outputText("[pg]那么，你想吗？");
            }
         }
         menu();
         addButtonDisabled(0,"操她","此场景需要你拥有合适的阴茎和足够的性奋度。");
         addButtonDisabled(1,"骑脸","此场景需要你拥有足够的性奋度。");
         if(get_player().get_lust() >= 33)
         {
            if(get_player().hasCock())
            {
               if(get_player().shortestCockLength() > 48)
               {
                  outputText("[pg]不幸的是，你觉得她可能承受不了你的肉棒。");
               }
               else
               {
                  addButton(0,"操她",ottergirlLikesDongs);
               }
            }
            addButton(1,"骑脸",ottersForGals).hint("舔她的小穴，作为回报，她也会为你口交。");
         }
         else
         {
            outputText("[pg]你还不够性奋，无法操她。");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,777) > 1)
         {
            addButton(2,"拿鱼",getSomeFishYaFatty);
            addNextButton("只钓鱼",calluJustFish).hint("跳过打炮，但留下来陪她。");
         }
         addButton(14,"离开",avoidZeOtterPussy);
      }
      
      public function encounterName() : String
      {
         return "callu";
      }
      
      public function encounterChance() : Number
      {
         return 0.5 + (get_survival() && get_player().hunger < 10 ? 2 : 0);
      }
      
      public function calluSprite() : void
      {
         if(get_noFur())
         {
            spriteSelect(SpriteDb.get_s_calluNofur());
         }
         else
         {
            spriteSelect(SpriteDb.get_s_callu());
         }
      }
      
      public function calluJustFish() : void
      {
         clearOutput();
         outputText("你问水獭女孩是否介意你加入她一会儿，但不进行任何风流韵事。她给了你一个疑惑、有些怀疑的眼神。");
         outputText("[pg][say:那你觉得我们该干嘛？]她挑起一根眉毛问道。");
         outputText("[pg]钓鱼，你回答。在这个地方，很少有机会能做这么平静的事情，而且，她说她总是钓得太多，所以你的出现肯定不会成为太大的负担。然而，你告诉她，你并没有自己的装备。");
         outputText("[pg][say:嗯……]这个身材健美的女孩让鱼竿靠在自己的大腿上，专注地打量着你的脸。她的表情有那么一会儿让人难以捉摸，但最终她露出了一个苦笑。[say:为什么不呢？你就在这儿等着，我马上就回来，快得你都注意不到。]");
         outputText("[pg]水獭女孩说到做到，她跳进湖里，像箭一样射了出去。看着她身后激起的白色浪花，你觉得也许更快。她消失在视线中，所以目前，你按照她的建议，只是欣赏湖边的气氛。你的思绪在宁静、自然的微风中飘荡，当附近的一声水花宣告她的归来时，你几乎感到惊讶。");
         outputText("[pg]卡露咕哝了一声，朝你的方向扔了一根长杆，然后慢悠悠地走回她的位置。[say:那是备用的，别弄坏了。从头开始做很麻烦的。]说完，她一屁股坐下，拿起鱼竿，目光重新回到水面上。你等了一会儿，才问她你应该做什么。");
         outputText("[pg][say:嗯？哦，对了。我给你拿点鱼饵……]她一只手在身边摸索着，眼睛却没有离开浮标，她拉出一条扭动的虫子，然后把它推向你。[say:你直接把它戳在鱼钩上就行了。最好多折叠几次，外面的鱼很狡猾。如果你让它们得逞，它们会把它吃得一干二净。]");
         outputText("[pg]你按照指示去做，不过当你试图把虫子套上去时，它伸缩不定，有点困难。然而，你[if (spe > 40) {灵巧的双手让你毫不费力地完成了|勉强完成了}]，并把挂好饵的鱼钩展示给她看。");
         outputText("[pg]她点点头，移到一边。[say:好了，现在你要确保抛竿时不要越过我的线。还有，呃]——她瞥了你一眼——[say:小心向后挥杆。]她用空闲的手做了一个模糊的抛投动作，你研究着她熟练的手腕抖动，希望自己也能做到。");
         outputText("[pg]然后就没什么可做的了，只能开始行动。你从[if (singleleg) {直立|站立}]的姿势开始，把线悬在面前，深吸一口气准备。在扫视水面并估计距离后，你向后仰，然后让它飞出去，[if (spe > 40) {虽然你很失望地看到浮标落在了离你想要的地方很远的地方|很高兴看到浮标准确地落在了}]你想要的地方。");
         outputText("[pg][say:哈！嗯，不是我见过最差的。你可能还有点希望。]");
         outputText("[pg]你坦然接受了她的夸奖，在水獭女孩旁边坐下。随着时间流逝，你们俩相对无言，但你并没有觉得无聊。卡露的存在让人感到安心；看着她在这里如此满足，几乎就像这片湖是她的，而你们其他人都只是客人，这让人感到非常平静。她比你先钓上一条鱼，但看到鱼太小后，她轻声抱怨着把它扔回了水里，除此之外，没有什么能打破这份宁静。");
         outputText("[pg]直到你感觉到一阵猛烈的拉扯，差点把鱼竿从你手中拽走。你惊讶地向前倾身，但钓到大鱼的兴奋感在胸中难以抑制。");
         outputText("[pg][say:你钓到了什么，虎鲨人吗？] 水獭女孩带着几分笑意问道。[say:继续，稳住——用力拉！]");
         outputText("[pg]你照做了，然后听从她的其余指示，在她的帮助下缓慢、小心地收线。[if (str < 30) {你确实需要一点帮助才能收线，但水獭女孩很乐意提供帮助，她稳健的手臂和你的手臂一起握住鱼竿|专家级钓鱼者的建议是无价的，你能够稳步前进，你的鱼线离岸边越来越近}]，你在期待中等待着。你几乎已经能闻到烤鱼的香味了。");
         outputText("[pg]伴随着水花四溅，你把它拉出了水面。它很大，绝对超过两英尺长，你立刻为自己的收获感到自豪。当你努力把它甩过来时，卡露咯咯地笑着，然后帮你把鱼钩取下来。");
         outputText("[pg][say:不错，相当不错，] 她说。[say:绝对是一顿美餐。但必须先把它清理干净并煮熟。] 她抬头看着你。[say:你要留下来一起吃吗，还是……？]");
         outputText("[pg]你抬头看了看天空，发现你已经在这里待了一段时间了。你可能很快就得回营地了，所以你遗憾地拒绝了她的邀请。");
         outputText("[pg][say:没关系，我能搞定。给，这是你的辛苦费。] 她拿出一块处理好的鱼片递给你。[if (cor < 30) {向她道谢后|接受了她的慷慨后}]，你接过它并把它放进你的[inv]里，然后挥手告别，踏上回家的路。");
         get_inventory().takeItem(get_consumables().FISHFIL,get_camp().returnToCampUseOneHour);
      }
      
      public function avoidZeOtterPussy() : void
      {
         clearOutput();
         get_images().showImage("callu-avoid");
         outputText("你摇摇头，解释说你不能。她只是耸耸肩，[say:那也没什么大不了的。]");
         outputText("[pg]你们俩默默地坐了一会儿。这并不觉得尴尬，只是一种宁静、放松的无声状态。水面轻轻拍打的声音几乎让你睡着。最后，你站起来，道别并离开。当你离开时，卡露喊道：[say:随时欢迎再来，听见没？]你心不在焉地点点头，然后走回营地。");
         doNext(get_camp().returnToCampUseOneHour);
      }
   }
}

