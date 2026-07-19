package classes.scenes.places.telAdre
{
   import classes.Cock;
   import classes.PerkLib;
   import classes.Player;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.display.SpriteDb;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.items.ConsumableLib;
   import classes.scenes.Camp;
   import classes.scenes.places.TelAdre;
   import flash.Boot;
   
   public class Maddie extends TelAdreAbstractContent
   {
      
      public function Maddie()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
      }
      
      public function waitForSlutCake() : void
      {
         spriteSelect(SpriteDb.get_s_maddie());
         clearOutput();
         outputText("你走回面包店大堂，感觉有点");
         if(get_player().cor < 33)
         {
            outputText("坐立不安");
         }
         else if(get_player().cor < 66)
         {
            outputText("对这整件事感到紧张");
         }
         else
         {
            outputText("对这整件事感到好奇");
         }
         outputText("。其中一位女服务员给你端来一杯牛奶，然后");
         if(get_player().cor < 50)
         {
            outputText("闻起来很正常，所以你直接喝了一口");
         }
         else
         {
            outputText("你一边喝一边等");
         }
         outputText("。感觉过了几个世纪那么久，你等得不耐烦了，推开门走进面包店的后屋，想看看是什么耽搁了。那个牛头人不在他平常的工作台前，而且看起来已经有很长一段时间没在那里了。[pg]");
         outputText("他能去哪儿呢？你原路返回，穿过烤箱，沿着小路寻找，在迷宫般的储藏室里搜寻。就在你快要放弃的时候，你听到隔壁房间传来一阵轻快、飘飘然的咯咯笑声。你探头往拐角处看去，震惊得倒吸了一口凉气。牛头人被钉在墙上，手腕被看起来像硬化的白色糖霜的东西固定在原地。在他上面的是你见过的最奇怪的——不，是唯一的，纸杯蛋糕女人。[pg]");
         outputText("她比被囚禁的牛头人还要高，也更宽。这个糕点女孩的皮肤略带多孔，呈浅巧克力色，在昏暗的光线下闪闪发光，没有被闪亮的蓝色糖霜“衣服”覆盖的地方更是如此。她的头发像鲜奶油一样白，用一个肉桂卷扎在脑后。她曲线优美的身体转了过来，当她用绿色的软糖眼睛打量你时，身体微微颤动，露出了她的鲜奶油胸罩。那个新奇的纸杯蛋糕模具平衡地顶在她的头上，戴着就像一顶相对较小的土耳其毡帽。[pg]");
         outputText("牛头人厨师还戴着他那顶蓬松的厨师帽，但他被这个烘焙出来的庞然大物完全且不可挽回地压在身下，任由她在自己抽搐的阴茎上弹跳和摩擦。在你的注视下，他的睾丸变得越来越小，将积蓄已久的滚烫精液直接排入纸杯蛋糕柔软、有弹性的中心。由于突然吸入了新鲜的精液，她变得更大了，咯咯地笑着，榨干了她创造者的每一滴精华。[say: 嘻嘻！嗯，你好像，很美味之类的，创造——创……爸爸！这么黏糊糊的，真好吃，就像我一样！] 这个毛茸茸的荡妇蛋糕惊呼道。[pg]");
         outputText("极度震惊和虚脱的牛头人厨师翻起了白眼。他虚弱地瘫倒在自己的造物之下，而她又弹跳了最后几下，徒劳地试图从那根软绵绵的牛头人肉棒中榨出更多的精液。纸杯蛋糕女孩终于站了起来，不是因为酵母发酵，而是因为找到了新的目标。她那反光的、异形的眼睛锁定了你的腹股沟，迈着沉重的步伐一步步向你逼近。她那巨大、海绵般的乳房在你面前危险地晃动着，那美丽而不自然的曲线几乎让你着迷。[pg]");
         outputText("逃跑似乎是个非常好的主意。谁知道她打算对你做什么？");
         menu();
         addButton(0,"逃跑",runAwayFromMaddiiiieee);
         addButton(1,"尝试交谈",talkToMaddie);
      }
      
      public function talkToMaddie() : void
      {
         var _loc1_:int = 0;
         spriteSelect(SpriteDb.get_s_maddie());
         clearOutput();
         outputText("面对一个巨大的、摇晃着的性爱糕点，你尽量平静地说话，但她无视了你“等等”、“听我说”或“停下”的要求。海绵蛋糕般柔软的拳头包裹住你的手臂，将你从地上举起，按在几个面粉袋上。纸杯蛋糕女孩鲜奶油胸罩上的樱桃掉了下来，被两个水瓶大小的糖果粉色乳头挤开。它们同时喷射出浓稠粘腻的糖霜，溅满了你裸露的手臂。在相对凉爽的空气中，糖霜几乎瞬间变硬，当她对你的[legs]施加同样的待遇，让你完全无法动弹时，你除了扭动之外无能为力。[pg]");
         outputText("这个痴迷鸡巴的甜点低头看着你，点了点头，闪闪发光的淡蓝色嘴唇上绽放出一个满意的微笑。她气喘吁吁地惊呼道：[saystart]我的造物——造……爸爸");
         if(get_player().hasCock())
         {
            outputText("好像，糖霜粉全用光了！所以我要向你借几杯，好吗？");
         }
         else
         {
            outputText("给了我好多糖霜，而且你，就像，涂上一些香草——香……美味的糖霜会好看得多！");
         }
         outputText("[sayend] 她……什么！？[pg]");
         if(get_player().hasCock())
         {
            _loc1_ = get_player().cockThatFits(60);
            if(_loc1_ < 0)
            {
               _loc1_ = 0;
            }
            outputText("[say: 爸爸说我的名字叫玛德琳，但那太没意思了。叫我麦迪就好。你像爸爸一样有很多糖霜，对吧？我——我……需要更多糖霜。这是我的配方里要用的，]麦迪说道。这个烘焙出来的娘们脱掉了你的[armor]，露出了你的[cocks]。她兴奋地咕哝着，检查着你");
            if(get_player().get_lust100() >= 75)
            {
               outputText("坚硬如石的");
            }
            else
            {
               outputText("变硬");
            }
            outputText("肉棒");
            if(get_player().cockTotal() > 1)
            {
               outputText("");
            }
            outputText("，用海绵般柔软的手抚摸着你的爱欲之肌。你扭动臀部，试图挣脱。麦迪笑着，气喘吁吁地咯咯笑着，她丰满的双乳滑到你两侧，将你压在墙上。[pg]");
            outputText("[say:所以，这就是喷出糖霜的地方，对吧？]这位糖果小可爱问道，轻轻地捏着你。[say:啊，真可怜——你的卡住了，就像爸爸的一样！我得捏捏揉揉，直到它喷出糖霜。][pg]");
            if(get_player().cor < 33)
            {
               outputText("你在这种尴尬的境地中尽可能地拿出威严，向麦迪解释从那里出来的绝对不是糖霜。");
            }
            else if(get_player().cor < 66)
            {
               outputText("你漫不经心地提到，你其实并不会制造糖霜。");
            }
            else
            {
               outputText("你得意地笑了笑，提到你喷出来的东西可不是什么糖霜。");
            }
            outputText("[say:骗人！如果那不是糖霜，那爸爸为什么要把他的糖霜放进那些闪电泡芙和我里面？] 巨乳纸杯蛋糕反驳道，接着又说，[say:我知道了，我可以把它吸出来！] 她撅起果冻般的嘴唇，猛地向前扑去，将整整 " + Utils.num2Text(Math.floor(get_player().cocks[_loc1_].cockLength)) + " 英寸都吸进了她那如烤箱般温暖的食道里。你的抗议被紧紧挤压着你 " + get_player().cockDescript(_loc1_) + " 的紧致感打断了。它以波纹状的动作榨取着你，像黄油一样滑润，饥渴地跳动着。[pg]");
            outputText("一条半融化的舌头");
            if(!get_player().hasSheath())
            {
               outputText("环绕着根部");
            }
            else
            {
               outputText("在你的包皮里戳来戳去");
            }
            outputText("，在你的" + get_player().cockDescript(_loc1_) + "上留下一道糖浆般的残留物。你呻吟着，瘫软在糖浆的悬浮液中。你的四肢完全失去了力量，被这糕点吞噬肉棒的巨口夺走。当她意识到你已经完全屈服于她的服侍时，她闪亮的眼睛向上看，露出幸灾乐祸的神情。很快，她像蛋糕一样柔软的手抓住并挤压你的" + get_player().cockDescript(_loc1_) + "，将其塞进她海绵般乳房的巨大隆起中。当你被这充满母性的双峰和麦迪散发出的熟悉的甜美气味取悦时，你的脸上露出了微笑。[pg]");
            outputText("吸吮开始了，纸杯蛋糕女孩毛绒绒的脸颊凹陷下去，形成一个吸吮肉棒的凹面。对你" + get_player().cockDescript(_loc1_) + "的不断挤压加上吸吮，让你在麦迪的食道里肿胀得更大，同时她亲吻着你的腹股沟。这个甜点的口交魅力丝毫没有停止的迹象，她吵闹地吸吮着她的美食，她枕头般的乳房是如此海绵般柔软和令人平静，你很乐意让她品尝你的“糖霜”，只要这意味着你能有这种感觉。你的[hips]向后推入那婴儿蓝色的嘴唇，抽插和挺进，因为你操弄和繁殖的本能接管了你，让你的" + get_player().cockDescript(_loc1_) + "在糕点皱起的嘴里进进出出。[pg]");
            outputText("麦迪进一步向前推，她的胸部将你压在墙上，固定住你的臀部，同时她吸得越来越用力。你的肉棒因为吸力而膨胀，在她的脖子里变粗，并开始因为不可抗拒的口交快感而抽搐。高潮在你的[balls]中酝酿");
            if(get_player().balls > 0)
            {
               outputText("，充满精液的球体在你抽搐的阴囊中跳动，准备爆炸");
            }
            outputText("。麦迪将她皱起的吸精小嘴紧紧挤压在肿胀的肉棒周围，同时她融化的舌头在它周围打圈。你的高潮就像锤子敲击太阳穴一样袭来，把你的思绪从脑海中敲掉，同时你将一波又一波的“糖霜”泵入纸杯蛋糕紧握肉棒的脖子洞里。当你用你的种子填满这个贪婪的糕点，并让你的头无力地沉入她海绵蛋糕般柔软的乳房垫子时，吸力放松了。[pg]");
            outputText("麦迪似乎榨了你很久");
            if(get_player().cockTotal() == 1)
            {
               outputText("，你的" + get_player().cockDescript(_loc1_) + "把每一滴精液都排进了这个烘焙精液罐里。");
            }
            else
            {
               outputText("同时她的皮肤吸收了你另一根肉棒慷慨的捐赠");
               if(get_player().cockTotal() > 2)
               {
                  outputText("");
               }
               outputText("。");
            }
            outputText("当这个吞精糕点女孩终于退开，释放你空虚的肉棒时，它从上到下都涂满了黏糊糊的蓝色果冻，尽管有些地方染上了白色。被榨干的肉棒慢慢变软");
            if(get_player().cockTotal() > 1)
            {
               if(get_player().cockTotal() == 2)
               {
                  outputText("连同你的另一根阴茎一起");
               }
               else
               {
                  outputText("连同你的其他阴茎一起");
               }
            }
            outputText("。满足之后，你的身体变得瘫软，靠在墙上，而你的脸则倚在纸杯蛋糕女孩渐渐离开的乳房上。[pg]");
            outputText("这个充满奶油的造物向后靠去，在绑着你的带子上又喷了一些糖霜，但它并没有加固束缚，而是腐蚀了变硬的糖果，将你释放到她等待的怀抱中。她用柔软的胸部接住你，抚摸着你的头发，用唱歌般的声音说道：[say:谢谢你提供所有的糖霜，[mister]！我想我现在已经足够了。我想我该去看看我爸爸什么的。也许他想在食谱里加点糖霜？][pg]");
            outputText("当你被轻轻放在地板上，旁边是你丢弃的装备时，烤箱加热过的瓷砖亲吻着你暴露的[ass]。你既疲惫又满足，双眼渐渐闭上，进入了梦乡。[pg]");
            outputText("<b>稍后...</b>[pg]");
            outputText("你被一只毛茸茸的手捏住肩膀，猛烈地摇晃着醒来。在这样粗暴的对待下，你立刻完全清醒了。牛头人厨师正微笑着低头看着你，这个表情在他那野兽般的口鼻上显得相当奇怪，他说道：[say:抱歉。实验适得其反。很高兴你给了她需要的东西。现在平静多了。会成为很棒的助手。][pg]");
            outputText("等这个兽人说完，你才注意到那个纸杯蛋糕女孩，玛德琳，正站在他身后。她那蓝色糖霜做的“衣服”已经被重做了，塑造成了一件紧身围裙，凸显出她那巨大、超凡脱俗的曲线。牛头人厨师说道：[say:我们现在走了。穿好衣服。也许什么时候可以来拜访麦迪。] 麦迪拍着手，兴奋地蹦蹦跳跳，身上的肉也跟着晃动，随后他们俩留你一个人在那里穿衣服。");
         }
         else
         {
            outputText("[say:爸爸说我的名字叫玛德琳，但那一点也不好玩。叫我麦迪就好啦！] 这个没头脑的糕点大声说道。你短暂地想知道是不是酵母导致了她现在的状态，但你强忍住了随着这个杂念升起的下意识的咯咯笑。现在可不是胡思乱想的时候！你带着恐惧和愤怒大喊，要求她立刻把你身上的糖霜束缚解开。她用那充满困惑的异形眼睛看着你，似乎完全听不懂你在说什么。[pg]");
            outputText("一个乳头被强行塞进你仍在抗议的嘴唇之间，在你进一步抱怨之前堵住了你的发声孔。麦迪兴高采烈地欢呼道：[say:这就对了……现在我们只需要给你弄点魔法糖霜，这样你就会感觉很好吃，而且，很放松！] 哦，不——你不知道她说的魔法糖霜是什么意思，但不管是什么，肯定不是什么好东西。首先，你试图把那海绵状的乳晕吐出来。但它带着持续不断的压力顶了回来，立刻让你的嘴里充满了蛋糕般的甜味。你试图咬下去。也许疼痛会让她退缩？这没有用，如果说有什么作用的话，那就是它开始流出糖霜了。[pg]");
            outputText("这味道太美味了——奶油般浓郁，黏糊糊的，甜得发腻，同时又像母乳一样顺滑。你本能地咽下了第一口，然后才想起你原本是想避免这种命运的。浓稠的糖霜包裹着你的食道，那是纸杯蛋糕温暖的分泌物。它在你体内散发出烤箱般柔和的热量，让你的头脑变得混沌，视线也因这朦胧的温暖而变得模糊。你无力地靠在甜蜜的束缚上，开始不由自主地喝了起来。[pg]");
            outputText("[say: 嘘，嘘……真是个好[boy]。我的糖霜是不是最棒的？]她滔滔不绝地说着，就像你齿间的乳头一样。[saystart]喝吧");
            if(get_player().thickness < 60)
            {
               outputText("，你看起来太瘦了");
            }
            else if(get_player().tone >= 70)
            {
               outputText("，你看起来就像石头雕刻的一样。多一点柔软对你有好处");
            }
            else
            {
               outputText("，你看起来最好多吃点，以保持你那迷人的身材");
            }
            outputText("。嗯，别让它洒出来什么的！我把这糖霜做得特别美味，这样你就会感觉超级好，不再挣扎了。[sayend] 她的声音就像你正在大口吞咽的乳汁一样甜美。小后屋的空气中充满了杂乱的吸吮声和响亮的吞咽声。[pg]");
            outputText("沉甸甸的乳房和海绵状的乳头退缩了，从你探寻的嘴唇中弹出。你因为美味的突然消失而失望地发出微弱的呜咽声，舔舐着并将白色的奶油涂抹在你已经沾满糖霜的嘴上。麦迪用双手抓住她的另一个乳房，与那摇晃的肉团搏斗，同时将她未使用的乳头对准你。乳晕起伏着，像一个过度充气的气球一样凸出。乳头在压力下在原地扭动，向两侧伸展，直到看起来快要破裂。奶油状的甜点在尖端凝结，慢慢形成一滴肥大、粘稠的水珠，悬挂下来，威胁着要掉到地板上。在它掉落之前，乳头最后一次脉动，打开了糖霜的流动。这就像看着大坝决堤——在最初的几秒钟里令人敬畏，直到液体的洪流开始淹没你。[pg]");
            outputText("当喷涌而出的水流冲击你的太阳神经丛时，你向后摇晃，将冰冷的白色物质溅成雨雾。黏液在四周下雨并爆炸，麦迪只是咯咯地笑和呻吟，同时引导水流流过你身体的每一寸，让你沉浸在糖浆般的甜蜜中。你吞下的几乎和你吐出的一样多。过了一会儿，你只是张大嘴巴叹了口气，希望她能把它含在你的嘴里，并用足够的力量把它泵入你咕噜作响的肠道。[pg]");
            outputText("[say: 哦，你看起来好吃极了！] 麦迪惊呼道。与此同时，你的束缚在温暖、含糖的打击下慢慢液化。它们越拉越低，让你沉入柔软、半融化的糖霜堆中。最后，基于糖霜的束缚断裂了，让你沉入甜美的物质中，仿佛它是一个巨大的垫子。麦迪叹了口气，给出了最后几次反复无常的喷射，溅在你的头发上，然后她的流动完全停止了。[pg]");
            outputText("[say: 哦，看看你！你浑身都是黏糊糊的甜蜜和柔软！天哪，我敢打赌所有好色的男孩和女孩都会喜欢把你舔干净的！] 兴奋的纸杯蛋糕女孩惊呼道。她从她丰满的手指上舔掉一滴迷路的糖霜，然后用充满担忧的声音说道，[say: 我的糖霜用完了。如- 如果我没有糖霜，没有人会喜欢我的！谢谢你的配合，但我最好去爸爸那里拿些奶油馅。你乖乖待着，在你吃完所有的糖霜之前哪里也别去，好吗？][pg]");
            outputText("那个胖乎乎的糕点女孩蹦蹦跳跳地离开了，留下你在她留下的一堆糖浆奶油中打滚。她那下了药的糖霜让你感到如此平静和放松，以至于你不假思索地服从了，大把大把地往嘴里塞。一把接一把，你吞噬着堆积在你周围的奶油状、下了药的配料。不知何故，它并没有因为其庞大的体积而撑破你的肚子，但它确实让你的肚子咕咕作响，并微微凸起");
            if(get_player().thickness < 60 || get_player().tone >= 50)
            {
               outputText("向前");
            }
            else
            {
               outputText("比平时更向前");
            }
            outputText("。过了一会儿，你被它淹没了，陷入了断断续续的沉睡。[pg]");
            outputText("<b>稍后...</b>[pg]");
            outputText("你被一只毛茸茸的手捏住肩膀，剧烈地摇晃着叫醒。在这样粗暴的对待下，你立刻完全清醒过来。牛头人厨师正低头冲你微笑，这个表情在他那野兽般的口鼻上显得相当奇怪，他说道：[say:抱歉。实验搞砸了。很高兴你没事。给她加了更多馅料，现在都平静下来了。会成为很棒的助手。][pg]");
            outputText("等这个兽人说完，你才注意到那个纸杯蛋糕女孩，玛德琳，正站在他身后。她那蓝色糖霜做的“衣服”已经被重做了，塑造成了一件紧身围裙，凸显出她那巨大、超凡脱俗的曲线。牛头人厨师说道：[say:我们现在走了。穿好衣服。也许什么时候可以来拜访麦迪。] 麦迪拍着手，兴奋地蹦蹦跳跳，身上的肉也跟着晃动，随后他们俩留你一个人在那里穿衣服。");
            outputText(get_player().modThickness(100,10));
            outputText(get_player().modTone(0,10));
         }
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,242,3);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function sneakAwayFromMaddie() : void
      {
         clearOutput();
         outputText("赶在他再次找到你之前，你赶紧溜了出去。不管他在做什么，你都不想尝一口。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,242,-2);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function runAwayMaddieFollowup() : void
      {
         spriteSelect(SpriteDb.get_s_maddie());
         clearOutput();
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,242,-2);
         outputText("你回来时看到了非常奇怪的一幕。" + (get_urtaDisabled() ? "埃德琳和卫兵队长" : "乌尔塔和埃德琳") + "正带领着三十多名城市卫兵，松散地围成一圈，押送着那个纸杯蛋糕女孩。她那相对较小的锡箔毡帽不见了，大部分蓝色糖霜“盔甲”也消失了。她看起来虚弱、可怜、狼狈不堪，被长矛戳着赶出了城市，再也无法回来了。香草味的眼泪在身后的路面上留下了污迹，一路延伸回面包店。[pg]");
         doNext(get_telAdre().telAdreMenu);
      }
      
      public function runAwayFromMaddiiiieee() : void
      {
         spriteSelect(SpriteDb.get_s_maddie());
         clearOutput();
         outputText("你转身就跑，赶在那场烹饪灾难对你为所欲为之前逃离了房间。当你逃跑时，身后传来纸杯蛋糕女孩尖锐的哭喊声：[say: 不……回来！我为你做了好多馅料！] 听到这话，你跑得更快了，以破纪录的速度逃离了这座城市。[pg]");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,242,-1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function procMaddieOneIntro() : void
      {
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,240) == 0)
         {
            outputText("你走进面包店，品味着糖和烘焙食品的甜美香气。一个魁梧多毛的身影走到你身边，一只强有力的手搭在你的肩膀上。陌生人用沙哑的声音说道：[say:你不是本地人。来。我需要你的帮助。给你看点东西。]你转过头去，惊讶地看到一张长着角的牛头人面孔");
            if(get_player().get_tallness() < 72)
            {
               outputText("正低头看着");
            }
            else if(get_player().get_tallness() < 100)
            {
               outputText("正平视着");
            }
            else
            {
               outputText("正抬头怒视着");
            }
            outputText("你。它松开你的肩膀，开始走向一扇写着“仅限员工”的门。你要跟上去吗？[pg]");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,240,1);
         }
         else
         {
            outputText("你走进面包店，一只毛茸茸的粗壮手臂抓住了你的肩膀。一个熟悉的牛头怪声音吼道：[say:你。你能帮忙。过来。]你转过身，但他已经走向一扇写着“仅限员工”的门了。你要跟上去吗？");
         }
         menu();
         addButton(0,"跟上",followMinotaurIntoBackroom);
         addButton(1,"拒绝",get_telAdre().bakeryScene.bakeryuuuuuu);
      }
      
      public function nopeAintGotNoneODemSpeculIngredimathings() : void
      {
         clearOutput();
         outputText("厨师叹了口气，一拳砸在柜台上，力道之大足以在金属上砸出一个凹痕，并把装满面团的碗震飞到几英寸高的空中。一些空的闪电泡芙到处乱弹乱滚。牛头人回头看着你，哼了一声，[say:你最好走吧。没有材料就别来。][pg]");
         outputText("好吧，没必要");
         if(get_player().cor > 50)
         {
            outputText("在特尔阿德雷里面挑起战斗");
         }
         else
         {
            outputText("在这里赖着不走");
         }
         outputText("——你离开了。");
         doNext(get_telAdre().bakeryScene.bakeryuuuuuu);
      }
      
      public function handOverIngredientsItBeBakingTimeYo() : void
      {
         clearOutput();
         get_player().consumeItem(get_consumables().BEEHONY);
         get_player().consumeItem(get_consumables().L_DRAFT);
         outputText("你将催情剂和瓶装蜂蜜递给牛头人，看着他工作，并尽力无视他散发出的强效催情信息素。他抓起一直在揉的面团，倒入催情剂，当冒泡的药物气味钻进他牛一般的鼻孔时，他粗暴地喷着响鼻。接着，这位公牛般的厨师伸手拿过一个标有“P.S.M.”的瓶子，拔开塞子，动作熟练地倒了进去。白色的液体一接触到粉红色的催情剂就危险地起泡，一秒钟后，蜂蜜也加了进去。最后，他掀起遮阴布，伸手去拿飞机杯。[pg]");
         outputText("性玩具滴着润滑液，在牛头人的手中扭动，这表明它经过了魔法强化或是地精制造。他插了进去，叹了口气，四个篮球大小的睾丸紧贴着他的身体，抽搐着。快速抽插两下后，他嚎叫起来，臀部抽搐着，白色的液体从飞机杯喷射到碗里。他以惊人的克制力，在加入了一杯精液后停了下来，尽管他的蛋蛋依然巨大且颤抖着。");
         if(get_player().hasPerk(PerkLib.MinotaurCumAddict))
         {
            outputText("你不由自主地向前倾，渴望得到他剩下的精液，但他把你推到墙上，咕哝着，[say:不行，]语气不容置疑。这实际上让你从上瘾的迷雾中清醒过来。");
         }
         outputText("[pg]");
         outputText("牛头人抓起打蛋器，开始用力搅拌充满性液的面团，用力搅拌着变稠的混合物，使他的二头肌泛起涟漪。片刻之后，他单手举起碗，从柜台上拿出一个巨大的新奇纸杯蛋糕模具。填满模具后，厨师把它扔到粗壮的肩膀上，抓起一袋真正的糖霜。他简短地咕哝着指示道，[say:在桌边等着。做好了你可以尝尝。]");
         if(get_player().hasPerk(PerkLib.MinotaurCumAddict))
         {
            outputText("一想到这，你的嘴里就分泌出唾液。");
         }
         else
         {
            outputText("你不确定自己是否想这么做。");
         }
         outputText("[pg]");
         menu();
         addButton(0,"等待",waitForSlutCake);
         if(!get_player().hasPerk(PerkLib.MinotaurCumAddict))
         {
            addButton(1,"溜走",sneakAwayFromMaddie);
         }
         else
         {
            addButtonDisabled(1,"溜走","你绝对不能错过它！");
         }
      }
      
      public function followMinotaurIntoBackroom() : void
      {
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,241) == 0)
         {
            outputText("你跟着这头粗壮的野兽穿过门，在他带领你穿过酷热的烤箱时转了好几次弯。当你们到达目的地时，牛头怪已经大汗淋漓，而你也一样。随着他身上散发出的浓烈麝香，你发现自己开始怀疑他是否只是设下了一个精心设计的圈套，想引诱你进入某种性爱场景。他抓起一顶毛茸茸的白帽子戴在头上，用尽可能简短的话试图解释，从而坚决地打消了你的这个念头：[say:我是厨师。我做很棒的闪电泡芙，但现在在做杰作。需要特殊原料。你可以离开城市。给我带催情剂和蜂蜜来。不要纯的，太强了。去吧。][pg]");
            outputText("你有机会仔细观察他的工作台，注意到许多碗面糊、数百个巨大的闪电泡芙，以及你见过的最大的名器。");
            if(get_player().hasPerk(PerkLib.MinotaurCumAddict))
            {
               outputText("当你意识到你正在面对那些“特制”闪电泡芙的源头时，你舔了舔嘴唇。");
            }
            else
            {
               outputText("当你意识到他一定是用什么来做奶油馅时，你脸红了。");
            }
            if(get_player().hasItem(get_consumables().BEEHONY) && get_player().hasItem(get_consumables().L_DRAFT))
            {
               addButton(0,"交出材料",handOverIngredientsItBeBakingTimeYo);
               addButton(14,"离开",nopeAintGotNoneODemSpeculIngredimathings);
            }
            else
            {
               doNext(get_telAdre().bakeryScene.bakeryuuuuuu);
            }
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,241,1);
         }
         else
         {
            outputText("你跟着这位粗壮的厨师穿过门，在熟悉的烤箱间穿梭。当你们到达他的工作区时，你们俩都出了一层细汗，你发现自己不知不觉地对牛头人的麝香产生了反应。这位奇怪的厨师转过身来问道，[say: 你现在有特殊食材了，对吧？]");
            menu();
            addButtonDisabled(0,"有");
            addButton(1,"没有",nopeAintGotNoneODemSpeculIngredimathings);
            if(get_player().hasItem(get_consumables().BEEHONY) && get_player().hasItem(get_consumables().L_DRAFT))
            {
               addButton(0,"有",handOverIngredientsItBeBakingTimeYo);
               addButton(1,"撒谎 - 没有",nopeAintGotNoneODemSpeculIngredimathings);
            }
         }
      }
      
      public function bakeryEpilogue() : void
      {
         clearOutput();
         outputText("你一走进面包店，其中一个女服务员就把你拉到一边。她满面笑容地递给你一张纸条，说道：[say:我们的一位厨师想让我把这个交给你。我都不知道他还会写字！我的意思是，一个牛头人去哪学的拿笔？] 你撇了撇嘴，挥手让她离开，然后打开了牛头人的纸条。[pg]");
         outputText("[saystart]谢谢。在麦迪的帮助下，我弄清楚了哪里出了问题。做出了杰作。有空买个巨型纸杯蛋糕吧。很美味！保证安全且不会上瘾。不过很贵。原料很稀有。[pg]");
         outputText("-X[sayend]");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,242,4);
         doNext(get_telAdre().bakeryScene.bakeryuuuuuu);
      }
   }
}

