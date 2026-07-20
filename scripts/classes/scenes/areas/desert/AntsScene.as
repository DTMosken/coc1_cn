package classes.scenes.areas.desert
{
   import classes.BaseContent;
   import classes.CoC;
   import classes.Cock;
   import classes.CockTypesEnum;
   import classes.DynStat;
   import classes.DynStatOp;
   import classes.ImageManager;
   import classes.Monster;
   import classes.Player;
   import classes.PregnancyStore;
   import classes.StatusEffects;
   import classes.TimeAwareInterface;
   import classes.Vagina;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.display.SpriteDb;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.scenes.Camp;
   import classes.scenes.areas.forest.TentacleBeast;
   import classes.scenes.areas.mountain.Minotaur;
   import classes.scenes.areas.plains.Gnoll;
   import classes.scenes.combat.Combat;
   import coc.view.CoCButton;
   import flash.Boot;
   import haxe.IMap;
   
   public class AntsScene extends BaseContent implements TimeAwareInterface
   {
      
      public var pregnancy:PregnancyStore;
      
      public var playingHero:Boolean;
      
      public function AntsScene()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         playingHero = false;
         super();
         pregnancy = new PregnancyStore(1198,891);
         CoC.timeAwareClassAdd(this);
      }
      
      public function waifuQuestOver() : void
      {
         clearOutput();
         outputText("你醒了，但不确定自己睡了多久；几个小时或者可能是一天，在这个地方很难说。试图站起来是个错误……你感觉你的大脑刚刚和一个牛头人进行了三回合的拳击。当你摇摇晃晃地试图保持平衡时，世界在旋转。不管菲拉对你做了什么，似乎都在消退，这让你的大脑感到空虚。");
         outputText("[pg]你转头看向菲拉，注意到她完全以一种非常可爱的胎儿姿势昏睡过去。你可以看到你站起来之前在她旁边留下的凹痕。这很奇怪，但你仍然能感觉到你们俩分享的那个“链接”；她的想法和情绪就像你周围风的低语。仅仅看着她睡觉似乎就能让你的烦恼烟消云散。你不在床上导致她翻身醒来，她揉着眼睛，努力让自己完全清醒过来。从她的肢体语言中你可以看出，她正在经历和你一样的戒断反应。当你开始收拾东西时，你昏昏欲睡的爱人睡眼惺忪地说，[say: 如果你愿意，我可以去你的营地找你，我不占什么地方。在地上！我是说，我会在地下，我是说，我不会打扰任何人的。我-我会乖乖的……]");
         menu();
         addButton(0,"来营地",getAntWaifuYoShit);
         addButton(1,"留在这里",tellPhyllaToStayTheFuckAtHomeThatCunt);
      }
      
      public function timeChangeLarge() : Boolean
      {
         return false;
      }
      
      public function timeChange() : Boolean
      {
         var _loc1_:* = null as IMap;
         pregnancy.pregnancyAdvance();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,879) > 0 && Utils.rand(5) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,874) < 5000)
         {
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,874,FlagDict_Impl_.arrayReadInt(_loc1_,874) + 1);
         }
         if(get_game().time.hours > 23)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,879) > 0)
            {
               _loc1_ = KFLAGS.flags;
               FlagDict_Impl_.arrayWriteInt(_loc1_,887,FlagDict_Impl_.arrayReadInt(_loc1_,887) + 1);
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,893) > 0)
            {
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,893,0);
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2276) > 0)
            {
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2276,0);
            }
            if(phyllaWaifu())
            {
               _loc1_ = KFLAGS.flags;
               FlagDict_Impl_.arrayWriteInt(_loc1_,878,FlagDict_Impl_.arrayReadInt(_loc1_,878) + 1);
            }
         }
         return false;
      }
      
      public function tellPhyllaToStayTheFuckAtHomeThatCunt() : void
      {
         clearOutput();
         outputText("告诉菲拉你的营地对她来说并不是最安全的地方，即使她在地下，似乎也不能让她接受你把她留在这里的事实，这让她更加伤心。你告诉她，你宁愿她现在留在这里，知道她是安全的，直到你能为她把营地“准备好”。她看起来有点悲伤，但她同意了。");
         outputText("[pg]当你转身离开时，她迅速说道，[say: 如果你觉得你的营地足够安全，可以让我加入你，请-请来接我。如果你愿意的话。我是说，我哪儿也不去……反正有我母亲看着，我也去不了……]");
         outputText("[pg]你点点头，一言不发地回到了营地。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,876,1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function talkAboutAntMatingAndRituals() : void
      {
         clearOutput();
         outputText("你一直很好奇菲拉是如何将她生活中的想法和画面投射到你脑海中的。看她现在不忙，你便问起了这件事。她歪着头，试图想出一个解释的方法。你可以看出这需要一些思考，因为她沉默了将近一分钟。");
         outputText("[pg][say: 这就是我们所说的传承知识。毫无疑问，当你从恶魔手中救下我时，你感觉到了。我、我用它把你“标记”为我潜在的伴侣。]她脸红了。[say: 我的意思是！不是那样的。]她疯狂地挥动着四只手。[say: 我的意思是，我们公主必须用这种方式选择伴侣！你、你是我的第一个；我自己也不知道会发生什么。]");
         outputText("[pg]你把手托在脸上，微笑着听她继续说，觉得她结巴的样子很可爱。她给了你一个“哦对了！”的表情，然后继续说道。[say: 这就是我们能够将想法传递给和我们不一样的人的方式。这也不是我们能控制的，至少在连接其他人时是这样。在非常亲密的情况下，或者在极度压力下，每个人的大脑都是最脆弱的。在正常情况下，我们的大脑无法连接，但如果你的大脑是开放的，我的大脑就可以侵入你的大脑。我的意思是，我不想听起来像是在攻击你！我的意思是，我绝不会……]");
         outputText("[pg]你很清楚这一点，你做了一个调皮的鬼脸，向她表明你知道。她深深地脸红了，脸颊变得通红，双手开始不安地摆弄。[say: 在交配……我、我是说做、做爱的时候，是连接最强的时候。那时双方的大脑都是开放的。这也是为什么我们能……控制彼此的冲动。]一提到做爱，菲拉似乎还是很害羞。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,874) > 0)
         {
            outputText("[pg][say: 和试图连接你不同，我可以自由地和我所有的孩子分享知识。我们甚至不需要身体接触。同样，他们也可以和我分享。]");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,886) > 0)
         {
            outputText("[pg][say: 当然，这不包括我们非蚂蚁的孩子。比如我们可爱的蛛化精灵后代。]");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,874) > 0)
         {
            outputText("[pg]你有点惊讶；你问她现在是否能感觉到她所有的孩子。[say: 不是那样的。我的意思是……一直感受他们的每一个想法，可能会要了我的命。]她停顿了一下，试图在脑海中想出一个绝妙的比喻之前，清除掉这个可怕的想法。你评论说你不确定那是否会发生，但不可避免的头痛肯定会让人虚弱。或者把她逼疯。");
         }
         outputText("[pg][say: 这就像试图同时思考1到100之间的每一个数字。我可以挑出数字，但同时思考它们就太多了。如果他们中有人遇到麻烦，或者向我发送特定的感觉，我也能感觉到。恐惧、胜利，或者是各种岩石或泥土……]");
         outputText("[pg]听到最后一个，你咯咯地笑了起来，打断了她。虽然菲拉显然不明白你为什么笑，她给了你一个奇怪的眼神。你试图解释说，通常人们不关心岩石或泥土的种类。她撅起嘴，交叉着四只手臂，说这些东西对蚂蚁来说非常重要。你们俩停顿了一会儿，然后同时大笑起来。");
         outputText("[pg]试图完全理解传承知识是如何运作的似乎很困难。至少你现在有了基本的了解。");
         if(get_player().cor < 60)
         {
            outputText("[pg]你走到她面前，给了她一个深情的吻。什么也没发生，所以你看了她一眼，讽刺地说你还以为会发生什么事呢。");
            outputText("[pg]她撅起嘴，然后再次重申，她无法控制它。");
            outputText("[pg]你感谢她告诉你这一切，尽管当你转身离开时，你发誓她正在偷偷地抚摸自己，试图说服你采取更激情的行动。");
            outputText("[pg]你咧嘴一笑，回到营地，想着你应该很快再来看她。");
         }
         else
         {
            outputText("[pg]对她来说，不断描述她的性器官，甚至做爱，似乎几乎是一种折磨。你产生了一个非常邪恶的想法——你确信她不会察觉到的想法。");
            outputText("[pg]你假装无辜，让她给你展示她身体的所有不同部位。这换来的是震惊的表情，就好像你刚刚让她在一屋子陌生人面前脱光衣服一样。她环顾空荡荡的房间，似乎在确认除了你没有人在看，然后才继续。");
            outputText("[pg]她非常小声地说，[say: 这些是我的……]");
            outputText("[pg]你凑近告诉她，她说话声音太小了，你听不见。");
            outputText("[pg]她稍微大声一点重新开始。");
            outputText("[pg][say: 这些是我的乳房；它们不是很引人注目……]");
            if(get_player().biggestTitSize() >= 4)
            {
               outputText("[pg][say: 至少不像你的……我是说，你的更好看！]");
            }
            outputText("[pg]她用两只较大的手托住双乳。");
            outputText("[pg]然后呢？[say: ……还有我的乳头。]她的乳头立刻变硬了。要么是因为她的手在揉搓它们，要么是因为她在谈论它们，你不太确定。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,879) == 0)
            {
               outputText("[pg][say: 除非我在产卵，否则它们不会产奶，但是……它们非常敏感。我是说，你已经知道了。]看着她这样挣扎，在性方面非常令人兴奋。你问她它们到底有多敏感。[say: 我不……我是说……]当你盯着她看时，她把目光移开。你告诉她玩弄它们。你想看看它们有多敏感。她照做了，张开嘴发出一声惊讶兴奋的喘息。");
            }
            else
            {
               outputText("[pg][say: 现、现在它们大得多，因为……我、我在为我们的孩子产奶。]你可以看出她最近没有被吸吮过，因为她的乳房比平时大得多。你要求看看她的奶水。她震惊地转过头去，但还是照做了。她两只较大的手托住乳房底部，用力挤压。你听到她呻吟着呼气，白色的乳汁从她的乳头喷射而出。她甚至不用你吩咐就又做了一次——又一声更响亮的呻吟从她口中逸出。[say: 我告、告诉过你它们非常敏感……]菲拉在深呼吸间说道。");
            }
            outputText("[pg]你打趣说下次你们俩做爱时你会记住这一点的。她迅速用手捂住胸部，向内缩回。[say: 我不想……我是说……我想，但是……我很尴尬……求、求求你……]");
            if(get_player().cor >= 80)
            {
               outputText("[pg]她忐忑不安地继续，把上面两只手从乳房上移开，但下面两只手仍然捂着乳头。");
               outputText("[pg][say: 这……这是……我的……阴、阴……]");
               outputText("[pg][say: 你的……？]你试图哄她说出来。");
               outputText("[pg][say: 我的阴道，]她说得那么小声，简直就像根本没发出任何声音一样。");
               outputText("[pg]你说你没听见，问她又是什么。[say: 你知道这是什么……我是说，你……我、我们……]她试图恳求，寻找任何摆脱这种局面的方法。看着这一切真是太棒了！你以前从未见过有人因为一个词而如此激动。");
               outputText("[pg][say: 是我的阴道。]她终于声明道。");
               outputText("[pg][say: 你的小穴。]你迅速纠正她。");
               outputText("[pg][say: 我的……小……小穴，]她用一种挫败的语气说道。");
               outputText("[pg]你告诉她，你能看到她的阴蒂从阴唇间伸出来。她迅速低头确认了你的话。她迅速将四只手都捂在小穴上，露出了仍然坚挺的");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,879) > 0)
               {
                  outputText("滴着奶水的");
               }
               outputText("乳头。你告诉她你想看看里面，并让她解释为什么她不从那里生孩子。到这个时候，你可以看出你已经开始让她发情了，她的羞耻心正在慢慢融化。她用较大的手臂为你分开阴唇，然后开始用下面的一只手指着她长长的阴蒂。");
               outputText("[pg][say: 这是我的……我、我的……]她咽了一口口水，鼓起勇气继续说道。[say: 我的阴蒂。它非常敏感，只要碰一下就会让我……]她的声音渐渐变小。[say: 让你……？]你面带微笑地探寻答案，知道反正她也没在看你。[say: 高潮，]她茫然地说。从她改变的语气和态度，你可以看出她的欲望一定吞噬了她所有的想法。你要求她示范一下，这让她扭过头来，给了你一个长长、死死的凝视。你已经抹去了脸上的邪恶笑容，取而代之的是一个天真无邪的询问表情；一个肩膀上是真正的欺骗大师，另一个肩膀上是伪装的恶魔。");
               outputText("[pg]她上面两只手仍然撑开小穴让你看，没有放在阴蒂上的那只下手开始在她迅速湿润的小穴入口上下滑动。她移动较小的右手，从阴蒂尖端开始，慢慢地让所有手指顺着它滑下。每次到达阴蒂根部，她都会大声呻吟。她的肩膀紧绷，身体颤抖，几乎瞬间就达到了高潮。正如你所知，随之而来的高潮非常泥泞。她用较小的左手将两根手指插入体内，你看着她深深地呻吟，开始更快地自慰她的阴蒂。两只较大的手不再撑开阴唇，开始捏她的乳头");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,879) > 0)
               {
                  outputText("，将乳汁喷射到地板上");
               }
               outputText("。伴随着一声响亮的呻吟，她高潮了，浓稠、散发着甜味的少女淫液覆盖了她较小的两只前臂、大腿内侧以及她身下的地板。");
               outputText("[pg]她将较小的双手从湿透的阴部移开，看着它们。上面完全沾满了她的汁液。在对你面前做出的举动感到惊讶后，她茫然地看着你，寻求指导。然后你问她能高潮多少次。");
               outputText("[pg]菲拉呆滞的眼睛向上翻白了一会儿，然后再次伸手探向双腿之间。");
               outputText("[pg]<b>时间流逝……</b>");
               outputText("[pg]虽然在这么长时间观看她自慰的过程中你试图计数，但在大约15次左右时你就数不清了。");
               outputText("[pg]她试过几次停下来，向你恳求说这太多了，但你只是强迫她继续。在你猜测大概看了几个小时她一次又一次高潮，展现出近乎英雄般的毅力后，她崩溃了。菲拉倒在地上，彻底精疲力竭。她瘫倒在你面前，从头到脚全身都沾满了她自己的汁液。");
               outputText("[pg]当她躺在自己分泌物的池子里，空洞的眼睛凝视着虚无时，你一言不发。也许你把她玩坏了，只有时间能证明，她需要先恢复。你动身返回营地，心里很清楚她现在只是你的另一个玩物。");
               var _temp_1:* = get_game().time;
               _temp_1.hours = _temp_1.hours + 1;
               dynStats(DynStat.Lust(25));
            }
            else
            {
               outputText("[pg]你已经玩够了，而菲拉还被蒙在鼓里。你向她眨眨眼，感谢她的表演。这句话显然让她摸不着头脑，当你动身返回营地时，她还在琢磨你的意思。");
               dynStats(DynStat.Lust(15));
            }
         }
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,900,1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function talkAboutAntHistory() : void
      {
         clearOutput();
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,881,1);
         outputText("你在众多可用的枕头中挑了一个放松下来，然后向菲拉询问她种族的历史。她拉过一个枕头放在你旁边，依偎着你。[say: 这不是一个非常快乐的故事，你确定你想听吗？]你点点头，把手移过去握住她的一只手。");
         outputText("[pg]她低头看着通向她房间的黑暗隧道，似乎有一瞬间的超脱。[say: 曾经有一段时间，我们的人民在玛瑞斯非常普遍。我们被不同的部落称为密尔米人。虽然我们从来没有真正互动过，我是说……我们有时会在地表觅食，但我们大多独来独往。我们唯一真正与地表互动的时候，是当一位新公主出去寻找……寻找……追求者……如果她不能在自己的殖民地中找到一个的话。]当她继续说下去时，一阵红晕掠过她的脸庞。");
         outputText("[pg][say: 有时殖民地会变得如此之大，以至于它们会在地下相互连接。因此，有些殖民地永远不需要再去地表了。]");
         outputText("[pg]你试图想象这些超级殖民地会是什么样子，但这个想法让你的大脑感到困惑。");
         outputText("[pg][say: 那是一个更好的时代，在恶魔出现之前……]她的声音似乎渐渐变弱了。");
         outputText("[pg]你询问恶魔来临后发生了什么。[say: 很艰难；我们几乎被逼到了灭绝的边缘。整个殖民地都被腐化了，而且因为我们的种族只产下少量的雌性卵，大多数殖民地很快就变成了巨大的……]她的声音中断了，好像她不想说出下一个词。");
         outputText("[pg]你试图恳求她继续说下去，理解她长时间停顿的含义。");
         outputText("[pg][say: 巨大的……群交派对……]她低着头端庄地说。[say: 工蚁和兵蚁的性欲都被腐化了，它们会和几乎任何移动的东西发生性关系。很快，地表部落一看到我们就会杀了我们，因为害怕我们的人民在夜里把他们拖走。我们的夜视能力特别好。]她试图改变话题，但你继续追问她的历史。");
         outputText("[pg][say: 女王们很快就停止了生育雌性，因为她们的欲望驱使她们渴望任何雄性……甚至是她们自己的后代。这些女王产下的任何卵都和女王本身一样腐化。所以这个循环永远无法打破。我们中少数像我母亲一样，仍然可以繁殖未腐化孩子的人，不得不逃到越来越深、越来越恶劣的环境中，以躲避地表、其他殖民地，最后是恶魔本身。]");
         outputText("[pg]菲拉看起来快要哭了，但她紧紧握住你的手，鼓起勇气继续她的故事。[say: 我的母亲……她……对她自己的人民进行了种族灭绝……甚至是她自己的后代。只是为了把她的殖民地从连接所有主要殖民地的巨大地下网络中移除。深入沙漠，远离一切……和所有人。那就是我们生活了很长时间的地方。孤独，而且害怕。]");
         outputText("[pg]眼泪开始顺着她的脸颊流下。然后令你惊讶的是，一个微笑照亮了她的脸。她转向你，用她的另外三只手擦去眼泪和鼻涕。[say: 那是……直到我遇见了你。从我们相遇的那一天起，我就知道你是特别的。我们将一起为我的人民写下新的篇章。一个有着……]");
         if(get_player().cor < 70)
         {
            outputText("[pg]在她说完之前，你把她拉向你，深深地吻了她。");
            outputText("[pg]你的脑海中突然浮现出你第一次见到菲拉时的画面。你看着自己从藏身处冲出来，英勇地击败了绿洲恶魔。只是这次是从她的视角来看的。被按倒在地和被轮奸的令人窒息的恐惧，被眼前的人会把她从那些被污染的生物手中拯救出来的希望之光所取代。接下来，你看到自己在试炼中，击退了他们派来对付你的每一个恐怖怪物；当你躲避和穿梭在牛头人等怪物之间时，她之前感受到的那种希望充满了她的身体。这种感觉是，这个奇怪但勇敢的人与那些怪物决斗，将是那个迎接挑战成为她伴侣的人。当菲拉结束这个吻时，你感到一种压倒性的爱和同情。");
            outputText("[pg][say: ……只是快乐的回忆，]她说完。");
            outputText("[pg]你试图站起来，却差点摔倒；你以为这种心灵连接会随着时间的推移变得更容易——你显然错了。菲拉用她的手臂接住你，帮助你走到殖民地的出口。像个醉汉一样摇摇晃晃地走回营地，你感觉到脑海中的重量随着每一步而减轻，当你到达时，你感觉好多了。");
         }
         else if(get_player().cor < 80)
         {
            outputText("[pg]你站起来打断了她充满爱意的演讲，让她暂时感到困惑。然后你评论说，你从一开始就对她人民的历史不感兴趣。你真正想要的只是暂时远离地表。[say: 什-什么？]她温顺地说。你打了个小哈欠，开始在她面前伸懒腰，心里叹了口气，因为现在你必须解释一下了。");
            outputText("[pg]你告诉她，你有比坐在这里听她半是胡言乱语、半是哭泣地谈论她母亲和恶魔更好的事情要做。毕竟你是个勇者；如果你想听人们喋喋不休地谈论历史，你早就去当学者了。此时对这个话题的任何兴趣都早已荡然无存。");
            outputText("[pg][say: 我不是故意的，我是说，是你问的！我不想让你觉得无聊，我-我只是以为……]她胆怯地说，试图挽回谈话。");
            outputText("[pg]你打断了她的话和她试图站起来的动作，说她想错了。也许她应该停止想那么多，只听你的。而且，如果她没有一直哭，这个故事会容易听得多。");
            outputText("[pg]你现在没有时间处理这件事；你收拾好东西，回到营地，留下菲拉一个人在她的房间里，带着她悲伤的回忆。");
         }
         else
         {
            outputText("[pg]你厌恶地嗤笑了一声，突然站起身来，打断了菲拉的话，把她推倒在没有垫子的石板地上。你低头看着她，她也震惊地抬头看着你。");
            outputText("[pg]你对她的感受毫无同情心，你痛斥她的族人是多么软弱可悲；他们明明有足够的人数和力量来阻止恶魔如此迅速地蔓延。见鬼，如果她的族人能和地表种族合作，他们本可以完全阻止这场入侵。但是没有！他们选择像懦夫一样躲在地下，眼睁睁看着地表的其他地方被恶魔和腐化系统性地摧毁！");
            outputText("[pg]面对这种羞辱，她看着你的眼睛，仿佛你刚刚在她的心上捅了一刀。她开始发抖，泪水顺着脸颊两侧流下。");
            outputText("[pg][say: 我当时甚至还没出生……你怎么能说……]");
            outputText("[pg]虽然你自己也“利用”了腐化，但在口头上对菲拉宣示你的统治地位，还是让你有点兴奋。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2024) <= 0)
            {
               outputText("[pg]年复一年！年复一年，你的族人勇敢地派出一名同胞穿过那个地狱般的传送门来到这里，希望能平息甚至阻止腐化的蔓延。现在你才了解到，如果菲拉的种族不是一群没胆量的懦夫，这一切本可以减缓甚至完全停止！");
            }
            else
            {
               outputText("[pg]确切地知道那些在你之前到来的人遭遇了什么，让你接下来要说的话变得更加甜美。你告诉菲拉，在你之前还有其他人，你生动详细地向她描述了那个工厂：你的族人是如何被当作祭品送去的，以及如果菲拉的族人哪怕有一丁点勇气和智慧去阻止他们，他们本可以阻止这一切。");
            }
            outputText("[pg]菲拉看起来很震惊，竟然会有这样的地方存在。你继续告诉她，如果她不开始振作起来，她很可能会[say: 亲眼看到]那个工厂。虽然你的话本质上是开玩笑，你并不是真的想把她送到那里当奴隶（至少现在还不是），但她似乎不明白，恳求你停下来。");
            outputText("[pg][say: 我会变好的，你想要我做什么我都做！求、求求你……别把我送走！]");
            outputText("[pg]真是自作多情。你告诉她别想太多，她最好听从你的指示和命令，以免成为这个世界的猎物——一旦它勾住你，直到你完全适应黑暗和它的需求，它才会放手。");
            outputText("[pg]转身准备回营地时，你听到菲拉在哭泣。也许让她一个人静静，有助于她明白你在这里试图完成什么。");
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function swallowDatJismPhylla() : void
      {
         clearOutput();
         outputText("你双手叉腰，坏笑着告诉菲拉，真正的女王从不吐精。菲拉向你抛了个淫荡的眼神，贪婪地吞下了你的精液，花了一点时间品味着它顺着喉咙流下时的温暖和质感。她大声地“啊”了一声，揉着肚子，随着那滚烫的精液将热量扩散到腹部，她舒服地哼哼着。[say:谢谢你，[name]。真是太满足了。]");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function surePhyllaLetsFuck() : void
      {
         clearOutput();
         var _loc1_:int = get_player().smallestCockIndex();
         outputText("[say: 我们得……接吻……我是说，我嘴里……还能尝到你的味道……我可以去洗洗，或者……啊~！]你把她的嘴拉向自己，打断了她的话。");
         outputText("[pg]像潮水一样，她的快感和情感与你的融为一体，你能感觉到她渴望你的" + get_player().cockDescript(_loc1_) + "在她的舌头上摩擦。你感觉到她的思想已经屈服于你阴茎的质感、气味和味道。这几乎就像她不想停下来一样——当她想要一点前列腺液时，她觉得刺激你阴茎上的那个小区域有多可爱，或者她想从你身上哄出越来越多的前列腺液，直到你在她嘴里爆发。你感觉到她想尝试更多你之前提到的“高级技巧”，想试着把你的阴茎塞进她的喉咙，用你能挤出的所有精液淹没她的食道。各种想法和画面交织成一首交响乐，淹没了你的思绪，用单一的合唱声压倒了你。菲拉的声音脱颖而出：[say: 射。射！射！<b>求求你，我需要它！射！</b>]");
         outputText("[pg]你睁开眼睛，发现菲拉正抬头看着你；你甚至没有感觉到她停止了接吻。她从未移开渴望的目光，再次用嘴包住你的阴茎，开始上下套弄。她的眼睛继续锁定着你，看起来像一只乞讨的狗。你感觉到你的阴茎干和龟头在她的嘴唇上摩擦，就好像你在给自己口交一样。");
         if(get_player().canAutoFellate())
         {
            outputText("[pg]这对你来说并不是什么新鲜的体验，但这次不同，因为你感觉到菲拉的思想被对你花蜜的渴望所占据。");
         }
         outputText("[pg]她恳求你的身心达到高潮，用你的种子填满她的嘴和胃。");
         pureBJEnding(true);
      }
      
      public function spitItOutYouCunt() : void
      {
         clearOutput();
         outputText("你双臂交叉，让菲拉把精液吐出来。当你重新穿上[armor]时，你听到菲拉在地上疯狂地挖洞。她调皮地弯下腰，把咸腥的精液吐了进去。完事后她轻哼了一声，然后迅速把洞重新填好。[say:谢谢你，[name]。我保证下次会做得更好。]");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function scissorContinue(param1:Boolean) : void
      {
         if(param1)
         {
            clearOutput();
         }
         else
         {
            outputText("[pg]");
         }
         outputText("你加快了速度并加大了力度，将你的私处与她的私处摩擦，你的臀部迎来了菲拉，她尽力保持在原位并给予最大的抵抗。一种外来的高潮感进入你的体内，这标志着菲拉即将迎来另一次身体抽搐的释放；同时，你感觉到自己也在酝酿着属于自己的高潮。你们同时挑逗着对方，直到你们都处于边缘。你们的臀部以极快的速度运动，在性爱的狂热中互相抚摸着你们的小穴，你们都不让对方射精，只是享受着你们在精神上分享的快感，直到菲拉再也受不了了，释放了对你的控制。你达到高潮的障碍消失了，你的大脑被淹没，释放了对她自己释放的控制，用你欣喜若狂的喜悦淹没了她的大脑。你们俩同时高潮，沉浸在惊天动地的幸福中。菲拉抛弃了所有胆怯的念头，在极度的幸福中尖叫，像喷泉一样把她的爱液喷洒在你的小穴上，你也同样回报了她；虽然数量远不及她。");
         outputText("[pg]当你的身体试图从快感中恢复时，你几乎瘫倒在她身上。你发现自己把双臂撑在菲拉脸的两侧，悬在她上方。她伸出手，用所有的手臂环抱住你，把你拉下来躺在她身边。这个害羞的蚂蚁变形者转过头，最后吻了你一次，然后你们都在彼此的怀抱中昏睡过去。");
         get_player().orgasm("Vaginal");
         menu();
         addButton(0,"继续",waifuQuestOver);
      }
      
      public function rejectAntSex() : void
      {
         clearOutput();
         outputText("你的大脑终于清醒过来；她不值得你花时间。你迅速冲向门口，留下心碎的菲拉。");
         outputText("[pg][say: 你在做什么？我的意思是……你不愿意吗？]她低下头，眼泪从眼眶里流了出来。");
         outputText("[pg]你有一种感觉，你再也见不到她了。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,467,1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function purePhyllaBJOver() : void
      {
         clearOutput();
         get_images().showImage("ant-camp-give-pure-bj-cum");
         var _loc1_:int = get_player().smallestCockIndex();
         outputText("你轻声细语地告诉她冷静下来，不必担心；你非常乐意教她怎么做，就像如果情况反过来，她也一定会帮你一样。听到换位思考，她高兴地点了点头。");
         outputText("[pg][say: 你……知道我愿意为你做任何事……我会学好的，我保证！]");
         outputText("[pg]得知你愿意包容她经验不足，菲拉感到既高兴又安心，她重新俯下身，凑到你的" + get_player().cockDescript(_loc1_) + "前，温柔地舔舐着你的龟头，将你积攒的先头液吸吮殆尽。你决定用更直接的方式帮助她；你把手伸到她的下巴，抬起她的头，让她的目光与你交汇。菲拉的下巴紧绷着，你告诉她，她想得太多，也太用力了：放松就好。你用拇指滑过她的嘴唇，微微分开她的嘴。随着你的指令，她平静了下来。");
         outputText("[pg]你温和地告诉她，把嘴稍微张开一点，让你的" + get_player().cockDescript(_loc1_) + "滑进她嘴里，提醒她注意别让牙齿刮到。等她含住之后，你告诉她可以先从用舌头和嘴唇按摩你的龟头开始。慢慢地，她就可以试着用口腔内部来探索了。等到她熟练了，还能试着把你吞进喉咙——不过那就是更\"高级的技巧\"了。");
         outputText("按照你的指示，菲拉用她湿润的舌头顶住你的龟头，悠闲地拨弄着，然后用嘴唇将其包裹住。");
         if(get_player().cockTotal() > 1)
         {
            outputText("[pg]你喘息了片刻，要求菲拉照顾");
            if(get_player().cockTotal() == 2)
            {
               outputText("你的另一根阴茎");
            }
            else
            {
               outputText("你剩下的阴茎");
            }
            outputText("；如果她[say: 愿意的话。] 带着极大的热情，她的四只手伸了上来，将你的");
            if(get_player().cockTotal() == 2)
            {
               outputText("肉棒紧紧握住");
            }
            else
            {
               outputText("肉棒紧紧握住");
            }
            outputText("。菲拉嘟囔着什么，但心不在焉地意识到你的肉棒还在她嘴里，于是放弃了她想说的话。");
         }
         if(get_player().hasVagina())
         {
            outputText("[pg]你问菲拉能不能顺便照顾一下你的女性特征。菲拉把她的一只小手臂伸到你的双腿之间，摩擦着你的[clit]。她用手指抚摸你的阴唇，然后插入你的体内。菲拉开始勤奋地转动手腕，同时头部上下摆动。");
         }
         outputText("[pg]你将她凌乱的棕色短发拨到耳后，捧起她的头，温柔地引导她的嘴唇滑过你肉棒上所有的敏感点。在她动作的同时，你给她一些关于如何更好地调整[say: 技巧]的建议。你发现她学得很快，她利用你的建议，以惊人的精确度击中了你的敏感点……对于一个新手来说。");
         outputText("[pg]几分钟飞逝而过，你[say: 教导]菲拉如何进行正确的口交，期间伴随着你性感的呻吟声……以及在菲拉吸得太忘我或者你感觉到牙齿时的一些纠正。不过，对于第一次来说，她做得相当不错。");
         outputText("[pg]过了一会儿，你觉得菲拉不再需要指导了，你开始放松下来。然而，就在渐入佳境的时候，菲拉把你的肉棒从嘴里拿了出来。");
         outputText("[pg][say: 这……对我没用……我是说……我现在发情了……我们能结合吗……这样我也能感觉到？] 她看起来似乎根本不想说出来，但她日益增长的性欲似乎正在克服她的胆怯。");
         menu();
         addButton(0,"当然",surePhyllaLetsFuck);
         addButton(1,"拒绝",nopeNotOnMouthOrWhateverFuckThisNoise);
      }
      
      public function pureBJEnding(param1:Boolean = true) : void
      {
         get_images().showImage("ant-camp-give-pure-bj-cum");
         outputText("[pg]令你惊讶的是，菲拉已经完全接受了你帮助“教”她的这项新天赋");
         if(!param1)
         {
            outputText("。");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,882) == 0)
         {
            outputText("，");
            outputText("导致你通过链接开玩笑，叫她该死的作弊者。");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,882) > 0)
         {
            outputText("你能感觉到她每次都越来越少地依赖链接；你毫不怀疑，她很快就不会再用[say: 作弊]的方式让你高潮了。");
         }
         var _loc2_:int = get_player().smallestCockIndex();
         outputText("[pg]她在你的肉棒上前后套弄时，抬头对你咯咯地笑，用嘴感受着你即将高潮的明显迹象。当你感觉到高潮的时刻终于到来时，你用手抓住了她的后脑勺。她被这突如其来的感觉吓了一跳，但还没等她反应过来，你咆哮着，向前挺动臀部。菲拉像个行家一样，配合着你的释放节奏，从你的肉棒中吸出源源不断的精液。随着你阴茎的每一次痉挛，你都把精液射进她的嘴里。她毫不松口，直到含了满满一口，才从你的" + get_player().cockDescript(_loc2_) + "上松开，同时");
         if(get_player().cumQ() < 250)
         {
            outputText("细细的");
         }
         else if(get_player().cumQ() > 1000)
         {
            outputText("浓稠的");
         }
         outputText("精液丝在她的嘴唇和你的阴茎之间狂野地悬挂着。");
         if(get_player().cumQ() > 1000)
         {
            outputText("虽然她可能含了满满一口，但你还没有结束！你继续把剩下的滚烫精液卸在她的乳房和肚子上。");
         }
         if(get_player().cockTotal() > 1)
         {
            outputText("你的另一根肉棒");
            if(get_player().cockTotal() > 2)
            {
               outputText("喷洒出");
            }
            else
            {
               outputText("喷洒出");
            }
            outputText("白色的浓精，淋在她的双手和身体上，而她继续套弄着");
            if(get_player().cockTotal() == 2)
            {
               outputText("每一根");
            }
            outputText("，动作充满爱意。");
         }
         outputText("[pg]伴随着一声沉重的叹息，以及明显变轻的");
         if(get_player().balls > 0)
         {
            outputText("蛋蛋");
         }
         else
         {
            outputText("骨盆");
         }
         outputText("，你调皮地揉了揉菲拉的头发");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,880) != 1)
         {
            outputText("。");
         }
         else
         {
            outputText("，并祝贺她的第一次。");
         }
         outputText("[pg]她笑了笑，但你注意到她的脸颊鼓鼓的；你疑惑地转过头，问菲拉在干什么。她尴尬地红了脸，张开嘴巴。你射出的精液全都挂在她的舌头和牙齿上。她没法说话，但你能看出来她在寻求你的指示。");
         get_player().orgasm("Dick");
         menu();
         addButton(0,"吞下去",swallowDatJismPhylla);
         addButton(1,"吐出来",spitItOutYouCunt);
      }
      
      public function postFirstIntro() : void
      {
         clearOutput();
         outputText("[say: 谢谢。有时候我只是不好意思谈论那样的事情，我是说。我只是很高兴在这里看到你。你想做什么？]");
         phyllaCampMenu();
      }
      
      public function playHero() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_oasis_demons());
         outputText("当恶魔们向蚁女逼近时，你从藏身处冲出来，将你的[weapon]举向空中，发出令人印象深刻的战吼。如果你有发言权，任何人，无论是蚂蚁还是其他人，都不会被强暴！");
         outputText("[pg]你现在正在与恶魔战斗！");
         var _loc1_:DemonPack = new DemonPack();
         _loc1_.onDefeated = demonPackDefeated;
         playingHero = true;
         startCombat(_loc1_);
      }
      
      public function phyllasLifePastAndFuture() : void
      {
         clearOutput();
         if(get_game().izmaScene.izmaFollower() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,901) == 0)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,901,1);
            outputText("当你坐下来交谈时，菲拉今天似乎有些疏远。你向她指出了这一点，她小心翼翼地问起了伊兹玛。");
            outputText("[pg][say: 我知、知道你的营地里还有其他人。我的意思是……我不想假装我是你唯一会交配的人，但这个很特别。我是说，我能在这里感觉到。] 她用右边的两只手臂指着你的头，用左边的两只手臂指着她的头。看到你没有否认，菲拉的眼睛湿润了，她试图忍住眼泪。[say: 我不、不知道你为什么不告诉我你还有其他人离你更近……]");
            outputText("[pg]她似乎非常痛苦，而你思考如何回应时的犹豫只会加剧这种痛苦。[say: 我想知道你对她有什么感觉。我看到你们俩……我是说，我不是故意的，我只是听到了呻吟声，我当时正在挖出蚁群的隧道，瞥了一眼你的营地。我不是故意要看的，但是……]");
            if(get_player().cor < 40)
            {
               outputText("[pg]你尽力解释伊兹玛的情况。主要集中在她不像其他鲨鱼变形者这一事实上。她通过阅读抵御了腐化，而且她天生就比几乎任何可能腐化她的东西都要更快、更强。");
               outputText("[pg]菲拉看起来并不是特别高兴，似乎对你的解释不满意。她抽泣着，交叉着四只手臂等待进一步的解释。真的没什么好说的了，除非……你开始解释你和伊兹玛是如何多次交手的。菲拉看起来很震惊；你竟然会攻击一个和你处于“恋爱关系”中的人，这显然超出了她的理解。");
               outputText("[pg][say: 你、你们打架了？为、为什么……？]");
               outputText("[pg]你试图挽回，说这最初是伊兹玛的主意，并继续谈论你们的阿尔法-贝塔关系。一旦你解释完毕，菲拉似乎比以前少了一些压力，但她仍然有疑问。");
               outputText("[pg][say: 你和她在一起的唯、唯一原因是因为你比她强？] 菲拉用一种害羞但充满希望的语气说道。你告诉她情况并非完全如此。在某些方面，伊兹玛对你来说意义重大。你试图解释你和伊兹玛的关系很复杂，很难用语言来解释。");
               outputText("[pg]菲拉听到这话，精神一振。");
               outputText("[pg][say: 如果……你知道的……我们……我是说……] 你挑了挑眉，向她投去询问的目光。[say: 我们可以连接……] 她又指了指她的头，然后指了指你的头。");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,900) == 1)
               {
                  outputText("[pg]你评论说你以为她无法控制那个。[say: 我不能……我是说不能直接控制……我只是最近压力太大了……自从我看到你们两个……我想我可以……我是说！我只是想……如果你想试试的话……]");
               }
               outputText("[pg]你觉得不妨一试；菲拉似乎对此非常激动，你想尽你所能帮助她缓解压力。");
               outputText("[pg]你点点头，她向你走来。她的四只手臂都环绕着你。她似乎在等你掌控局面，不想自己主动。你把食指放在她的下巴上，抬起她的头，让你们的嘴唇相遇。起初你什么感觉都没有；以为没有起作用，你把舌头滑过她的嘴唇，伸进她的嘴里。她把你抱得更紧了，但还是什么都没发生。你以为这行不通，开始从她身边退开，你感觉到她绝望地紧紧抓住你，她用上面的两只手臂抓住你的后脑勺，强迫你的舌头更深地伸进她的嘴里。然后，就像三杯威士忌直接灌进大脑一样，你的大脑变得迷失方向，脑海中浮现出菲拉在她的房间里踱步的画面，她告诉自己她没有看到你和伊兹玛在一起，这一切都只是她的想象。");
               outputText("[pg]画面一闪，她哭泣着，拼命地试图安慰自己，因为你竟然会让一个腐化的鲨鱼变形者对你为所欲为。在这之后，心灵链接出现了一段平静……你觉得是时候向菲拉展示伊兹玛的情况，以获得她的理解了。回想起你和伊兹玛第一次见面的情景，她很善良，甚至让你读她的书。你回想起她关于她的族人如何处理彼此关系的对话。唤起你和伊兹玛为了争夺统治地位而进行激烈战斗的记忆，你感觉到菲拉对这些特定的记忆感到害怕，但你强迫自己回忆起你收敛了一些更残酷的攻击，所以伊兹玛没有受到任何真正的伤害。");
               outputText("[pg]虽然仍然令人不快，但这似乎让菲拉平静了一点。你回忆起的最后一个记忆是伊兹玛向你屈服的那个。在你们的一次“战斗”结束时，伊兹玛承认你是她的阿尔法，如果允许的话，她很乐意在你的营地度过一生。");
               outputText("[pg]你感觉到菲拉对你的抓握放松了，然后松开了。你慢慢地结束了亲吻，看着菲拉的眼睛。你的头脑仍然隐隐作痛，就像每次做完这些事情后一样。");
               outputText("[pg][say: 我不知道该说什么……我错了……关于她……我是说，关于你……我真的很抱歉。]");
               outputText("[pg]你告诉她这是可以理解的，但有时在掌握所有事实之前做出假设可能是灾难性的。[say: 我知道。我再也不会怀疑你……或者伊兹-伊兹玛了。] 你问菲拉是否想有一天见见伊兹玛。她害羞地说，[say: 只有当你认为那是个好主意的时候。她似乎非常……有攻击性。我是说那不是坏事……我只是不认为……我也很强壮，但我不喜欢像她那样战斗。]");
               outputText("[pg]你轻笑了一声，在菲拉的甲壳盔甲上重重地拍了一下，似乎是想让她安心。只要她和你在一起，她就会没事的。毕竟你是这段关系中的阿尔法。");
               outputText("[pg]这似乎让菲拉很受用，她笑得很开心。[say: 谢谢你……为了这一切，] 她说，她的声音终于恢复了正常的端庄语气。");
               outputText("[pg]你回到你的营地。当你到达那里时，你看到伊兹玛在溪流中游泳后正在擦干身体。你给了她一个狡黠的眼神和一个非常灿烂的微笑。她环顾四周，以确保你真的是在对她微笑。[say: 怎么了？] 她问道。你告诉她现在没什么需要她担心的。");
            }
            else
            {
               outputText("[pg]你刚想反驳，菲拉就猛烈地吻了你。她用她的四只手抓住你的头和脖子，所以你无法真正挣脱这个吻，直到她从你那里得到她想要的东西。");
               outputText("[pg]显然，压力驱使她的心灵融合发挥了作用。她积极地探测你的大脑，寻找关于伊兹玛的想法或记忆。这根本不是一种愉快的感觉；就好像你的大脑被切开并逐个分类。最后，你第一次见到伊兹玛的画面闪过，以及她如何向你展示她收藏的书籍。接下来你看到的是你和伊兹玛坐在海滩上一起看书，闲聊伊兹玛是如何通过阅读来抵御腐化的。那个画面突然消失了，你看到自己和伊兹玛在进行一场肉搏战，在你们疏远的关系中争夺统治地位。最终你看到自己支配了伊兹玛，以至于她问你是否允许她和你一起回到营地。");
               if(get_player().cor >= 80)
               {
                  outputText("[pg]她怎么敢！");
                  outputText("[pg]当菲拉试图在你的脑海中唤起另一个记忆时，你用尽全身力气把她推开。感觉到她放在你脸颊两侧的手开始滑动，伴随着最后一声咕哝，你把她打得踉踉跄跄地穿过房间。用手背擦去嘴上的唾液，你把剩下的吐在地板上。她惊愕地看着你。显然她没想到你能逃脱。");
                  outputText("[pg][say: 我-我没有……我是说……她……！] 她试图坦白，拼命寻找词语来让你不那么生气。");
                  outputText("[pg]你强迫自己冷静下来，但这并不容易——你的头砰砰直跳，就像一个在经历了狂饮和糟糕决定的夜晚后的早晨。一旦你头脑清醒，你看到菲拉坐在角落里哭泣，但这并没有阻止你对她进行言语攻击。你把她骂了个狗血淋头，给她来了一段众所周知的“你他妈的到底想干什么？！”的演讲。");
                  outputText("[pg]每一句脏话，每一次侮辱，似乎都让她在角落里缩得更紧了。你继续责骂她，她绝对、绝对没有权利利用你自己的记忆和情感作为武器来对付你！你接着告诉她，她一直都是对的，她不是你唯一要[say: 交配]的人。");
                  outputText("[pg]看到最后那句侮辱似乎让她痛苦地退缩了，你继续顺着这个思路说下去。你告诉她，你们俩从来都不是专属的，你也从来没说过你想这样。你开始训斥她，告诉她你对她不知感恩的真实想法。你费了那么大劲救她，为她战斗，让她在你的营地建立她的领地，而[i: 这]就是她报答你的方式？");
                  outputText("[pg]你可以扇她耳光，把她按在地上，让她乞求被你配种；她现在根本没有反抗的能力。但在一个纯粹的天才瞬间，你想到了一个更好的答案。你走到她面前，看到她如此脆弱，你觉得你有一个完美的想法。你举起手，当你这样做时，她抬起头并退缩了，以为你要打她。");
                  outputText("[pg]相反，你只是抓住她的头发，强行把她的头向后拉，让她看着你。她在哭，但说真的，她什么时候不哭呢，这个愚蠢的婊子！");
                  outputText("[pg]你紧紧抓住她的脖子，冲上前去吻她，把她固定在原地，让她无法逃脱。当你的舌头进入她的嘴里时，你能感觉到她惊讶地跳了起来，但你稳稳地抓住了她。她的四只手臂抓挠着你的胸部和背部，但不足以真正伤害你。当你们的思想同步时，你能感觉到她的思想，以及她有多害怕——这是多么不受欢迎。所以！她现在的感觉一定和你被她这样对待时的感觉一样。对她来说不幸的是，你对她的思想也会像她对你一样粗暴。");
                  outputText("[pg]你开始在脑海中浮现出你做过或见过的所有堕落和恶心的行为。尤其是刚开始和伊兹玛打交道的时候。你们的战斗，你的性冒险，甚至你内心深处想对伊兹玛做的最堕落的事情。当你把和伊兹玛有关的想法发送给她后，你继续发送地精、牛头人、触手怪等等。你发送给她的每一个记忆似乎都比上一个更糟糕，生动的画面让她浑身发抖。当你发送到绿洲恶魔时，她已经完全停止了挣扎；相反，她现在似乎很享受。她的思想对你完全敞开。事实上，你有一种感觉，她开始欢迎这些记忆，就像她从一开始就应该成为的那个破烂荡妇一样。");
                  outputText("[pg]你能感觉到她开始在你的脑海中探索你还没有展示给她的东西。你知道这可能不会持续太久，而且在这一点上你也不在乎。当你终于打破强吻时，菲拉从你的怀里掉下来，伴随着轻微的飞溅声摔在岩石地板上。你低头一看，发现在你压倒她的思想的整个过程中，她几乎一直在高潮。");
                  outputText("[pg]你当着她的面大笑，然后离开回到你的营地。你应该把你的新玩具介绍给伊兹玛。也许，如果你允许的话，伊兹玛可以拥有她自己的贝塔。");
               }
               else
               {
                  outputText("[pg]你决心不让这件事在没有抗议的情况下过去，所以你尽最大努力去探查菲拉的思想；你试图寻找任何东西，但你感觉到的只有她深深的孤独感和被背叛感。接下来你开始看到自己带着诱惑的眼神走向营地里的伊兹玛。在下一个记忆浮现之前，菲拉打破了吻并从你身边退开，眼泪已经开始在她的眼眶里打转。");
                  outputText("[pg]两人之间出现了漫长而尴尬的停顿，你们都在寻找能让这一切变得更好的词语。终于，在仿佛过了一个世纪之后，菲拉打破了沉默。[say: 对不起。我以为……我是说……她是个……我以为也许她对你做了什么……让你成了她的奴隶或者更糟！我说不上来，但你就是有些不一样。我只是……他们那种人并不以……]菲拉开始大声抽泣。");
                  outputText("[pg][say: 我大错特错了；她只是另一个努力对抗腐化的人。我不知道我在想什么……我只是太嫉妒和紧张了……只是别恨我，求、求你了。我真的很抱歉。]");
                  outputText("[pg]菲拉转过身去，开始在她的四只手里哭泣。你的思想被这样入侵是你从未想过菲拉会做的事。你走到这只受惊的蚂蚁面前，抓住她的肩膀，把她转过来面对你。你抱着头，就像宿醉一样，你责骂菲拉，告诉她未经你的允许，她绝不应该对你这样做。");
                  outputText("[pg]你告诉她伊兹玛对你意义重大，这似乎伤了她的心，因为她恐惧地睁大了眼睛。你叹了口气，尽力向她解释你和伊兹玛之间的阿尔法-贝塔关系，但菲拉听到你并没有完全忘记她时，稍微精神了一点。[say: 所以……她只是……你的玩具？]她在抽泣中勉强说道。");
                  outputText("[pg]你继续用责备的语气告诉她，伊兹玛不是你的“玩具”，也永远不会是。她是你的朋友，也是你的爱人之一。最后那句话对菲拉的打击就像你真的打了她一拳一样。她向后踉跄了一下，更多的眼泪顺着她的脸颊流下，她继续大声抽泣。虽然在目前的情况下，把她留在这里是合适的，但你决定最后努力一次，把事情弄对才是正确的做法。");
                  outputText("[pg]你向她解释说，她和伊兹玛对你来说都很重要。你和她们每个人的关系都不同，但这并不意味着更好或更坏。");
                  outputText("[pg]令你惊讶的是，菲拉擦了擦眼睛，试图平息她的抽泣。");
                  outputText("[pg][say: 你……你真的是这个意思吗？]");
                  outputText("[pg]你点点头。");
                  outputText("[pg]你们俩之间有很长一段时间的沉默，她尽力停止哭泣。[say: 谢谢你。我是说，我应该相信你的……我会做得更好。]你觉得菲拉终于理解了你们之间这种奇怪的三角恋，但谁知道呢。当你们俩在一起时，伊兹玛并不以隐蔽著称；菲拉看到你和伊兹玛在一起，你真的不感到惊讶。你留下她还在半抽泣着，心里想着她需要一些时间来思考你说的话。在走回营地的路上，你考虑有一天把她们介绍给彼此——这可能会打破紧张的气氛。");
               }
            }
         }
         else
         {
            outputText("你在她房间里众多毛绒绒的垫子上坐下，她接着依偎过来，把头靠在你的胸前，用她的腹部缠绕着你。然后她抬头看着你，问你在想什么。");
            outputText("[pg]你告诉她你想知道她的过去是什么样的，以及她对未来的计划。");
            outputText("[pg]她背靠在你的胸膛上，似乎放松了下来，开始向你讲述她的过去。");
            outputText("[pg][say: 嗯，我的意思是……我是我母亲生下的第一个雌性……我是说……毫无疑问，她现在肯定已经有了另一位公主了。我母亲对我保护得非常严密，我在持续的监视下长大，我绝对……我讨厌那样。我是说，我现在很感激，但当时那让人窒息。我什么都做不了！我是说……除了吃和睡……在那之后，我就被关在房间里了……] 她打了个寒颤，然后继续说道。[say: 在一些被腐化的蚂蚁试图强暴我之后。我的……我的护卫确保没有人能碰我一下。那是……嗯……直到我有了这些冲动……] 说完最后一句，她的脸红了。");
            outputText("[pg][say: 每位年轻的公主都必须寻找一个……嗯，你知道的，伴侣。我是说……配偶——当她们成年的时候。我在蚁群里寻找过，甚至有一些战士以我的名义尝试过试炼，但他们中没有一个……没有一个能通过测试。所以我母亲决定，如果我在蚁群里找不到配偶，我就必须在外面找一个。我们都知道那之后发生了什么……我找到了你，而你是我遇到过的最美好的事情。保护我安全的伟大勇者……我再高兴不过了。]");
            outputText("[pg]她调皮地捏了捏你手臂上的肌肉。[say: 至于未来，那真的取决于你。我们现在结合在一起了，无论是思想还是命运。]");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,874) == 0)
            {
               outputText("[pg][say: 就像我之前说过的，我可以给我们一个不断壮大的蚁群，有成百上千的孩子，或者我也可以就留在这里陪你。] 她停顿了一下，犹豫着要不要继续说下去。[say: 虽然如果我们有一个庞大的蚁群，那就意味着我们可以重新繁衍我的族人……] 你清楚地感觉到菲拉真的很想和你生孩子。");
            }
            else
            {
               outputText("[pg]你看到菲拉环顾四周，你的孩子们正从她房间的门口跑过。[say: 我想不出还有什么是我更想要的了。只要你能来看我，就像做梦一样。虽然我们总是可以做……其他事情，我是说！不一定非得是现在，只是你知道……我-我有时候会觉得孤单。]");
            }
            outputText("[pg]你在脑海中反复思考着这件事，你一定想得很入神。当你起身准备离开时，你发现菲拉已经在你的腿上完全睡着了。你趁机轻轻地从她身上抽身，然后回到了营地。");
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function phyllasKidsChildren() : void
      {
         clearOutput();
         outputText("菲拉似乎很惊讶你竟会对自己的骨肉感兴趣。[say: 通常我们这类一旦找了伴侣，就再也不会回到自己的族群了。我是说！我不是不想让你回来，我……我喜欢你到下面来。只是……通常不是这样的。] 你向她保证自己并不介意，有时离开地表来看看自己的后代也挺好的。当你暗示它们是\"你的孩子\"时，她的脸一下子亮了起来。");
         outputText("[pg][say: 他们很棒；我的意思是……看看他们来自谁。]她胆怯地推了一下，继续说道。[say: 他们照顾我，我们已经开始向地下挖得更深了。]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,887) < 10)
         {
            outputText("[pg][say: 我们没有取得太大进展，因为我们的许多孩子还很小，不能完全为我服务。我是说我们！]她迅速纠正自己。[say: 进展很慢，但有他们在身边很好。当你不在的时候，他们是你的小提醒。]她笑得很灿烂。");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,887) < 40)
         {
            outputText("[pg][say: 毫无疑问，我们取得了相当大的进展。我们的大多数孩子完全有能力挖掘自己的隧道，而且我们有这么多孩子，进展非常快。他们中的一些人甚至用了你的名字。我的意思是，我希望你不介意。我在第一百个卵左右开始用光名字了。]");
         }
         else
         {
            outputText("[pg][say: 这个殖民地和我希望的一样大，一样美好。我现在已经减少了产卵，以保持我们的殖民地在一个可持续的水平。这个殖民地甚至可以和我母亲的相媲美——事实上，我认为它稍微大一点。]你听到她声音中非常自豪的语气。虽然她似乎很激动，但菲拉可以看出你并没有同样的感受；她母亲的殖民地非常大，你考虑你可能让这件事进行得太久了。");
         }
         outputText("[pg]显然她看出你不安，并试图让你放心。[say: 我们没有像我母亲那样的竞技场；我没有理由要那种东西。我的意思是，除非这会让你在这里感觉更舒服……]那是最后一件会让你舒服的事情；你可能会死在那个竞技场里，如果你再看到一个，你会被诅咒的。[say: 嗯，你的孩子们很开心。他们在和平与繁荣中度过他们的一生。这都要感谢你。]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,886) > 0)
         {
            outputText("[pg]你询问了你所有的孩子，知道菲拉之前只是在谈论你的蚂蚁后代。菲拉迅速瞥了一眼地面，显然很尴尬她忘记了而你记得。[pg][say: 他们……比我预期的要大得多，而且我……不能像和我的……同类那样和他们交流……但他们帮忙挖掘，我的意思是……他们有能力挖掘……他们只是比我预期的更调皮、更有攻击性和喧闹。但他们的体型使他们成为其他孩子出色的守卫和看护者。我不习惯，但我像爱我自己的孩子一样爱他们。]");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,886) > 10)
         {
            outputText("[pg]她凄凉地叹了口气，但继续说道。[say: 我们的一些蛛化精灵后代甚至主动离开殖民地，去世界上冒险。我并不介意；只是有时看到他们离开很难过。我知道我们把他们抚养得很好，我希望他们把我们教给他们的教训铭记在心，希望他们永远不要忘记家在哪里……]");
         }
         outputText("[pg]你对此感觉很好。站起来调查殖民地，你可以看到菲拉也非常满足。你感谢她和你说话，然后回到地面，向营地走去。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function phyllaWaifu() : Boolean
      {
         return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,875) > 0;
      }
      
      public function phyllaTentaclePCLoss(param1:Boolean, param2:Boolean = false) : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_antguards());
         if(param1)
         {
            outputText("伤痛难忍，你转身做最后一次绝望的逃跑尝试……[pg]");
            outputText("……并成功逃进了附近的隧道。");
         }
         else
         {
            outputText("你放弃了抵抗，欲火焚身，再也无法抗拒。你耸了耸肩，走进了那团蠕动的肉块中……[pg]");
            outputText("……但一个坚持的声音将你从昏迷中唤醒。你设法跑进了附近的隧道。");
         }
         outputText("在竞技场战败后，你动身离开，却被拦住了。菲拉公主和一群全副武装的守卫站在出口处，手里拿着一小瓶透明液体。她看起来并不想把它给你，但还是把它递给了你。");
         outputText("[pg][say: 你输了……所以你必须喝下这个。我是说……对不起。]");
         outputText("[pg]你疑惑地看着小瓶，但战士们看起来不打算让步，直到你喝下液体。你拔开瓶塞，像喝烈酒一样一口气喝光了。奇怪的是，它没有任何味道。这种透明液体比水稍微粘稠一点，但在质地上并没有什么特别之处。虽然你以为会有什么可怕的事情发生在你身上，但你甚至没有任何异样的感觉。当你把空瓶子递回去时，守卫们让开了一条路让你离开。虽然奇怪的是，你发现自己并不真的想离开，但你还是摇了摇头，回到了营地。");
         var _loc3_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc3_,473,FlagDict_Impl_.arrayReadInt(_loc3_,473) + 1);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,473) > 3)
         {
            antastrophyBadEnd();
            return;
         }
         get_combat().cleanupAfterCombat();
      }
      
      public function phyllaTentacleDefeat(param1:Boolean) : void
      {
         var _loc2_:* = null as IMap;
         clearOutput();
         spriteSelect(SpriteDb.get_s_antguards());
         if(param1)
         {
            outputText("这只怪物在倒下时发出了刺耳的尖叫声。随着生命的流逝，它绿色的皮肤很快褪成了棕色，留下了胜利的你。");
            _loc2_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc2_,2374,FlagDict_Impl_.arrayReadInt(_loc2_,2374) + 1);
         }
         else
         {
            outputText("触手怪的身体开始颤抖并发出叹息，触手相互缠绕，狂热地互相抚摸着。看来这只野兽已经放弃了战斗。");
         }
         outputText("[pg]当你离开竞技场时，你遇到了菲拉公主和一大群蚂蚁战士；公主低着头，摆弄着她下面那对拇指。当你清了清嗓子宣布你的到来时，她吓了一跳，发出了一种奇怪的声音，听起来像是咔哒声和“咿！”的混合体。她红着脸，再次看着地面，寻找着要说的话。");
         outputText("[pg][say: 我很高兴你赢了，]她终于挤出了一句话，与其说是对你说的，不如说是对着岩石地面说的。[say: 让我帮你恢复吧，我是说，如果你愿意的话……]");
         outputText("[pg]你对她点点头，她便开始工作。她紧张地用一些奇怪的糊状物和布条包扎你的伤口。你试图和她闲聊，但在重兵把守下觉得很尴尬。显然你在这里仍然不受欢迎。菲拉完成后，除了一个守卫外，其他守卫都和她一起消失在隧道里。");
         outputText("[pg]你认出剩下的那个守卫是你第一次来这里的向导。至少，你是这么认为的——唯一能区分他的就是他手里那把生锈的旧刀。他耐心地等你重新穿好衣服，然后带你离开了蚁群。");
         get_player().changeFatigue(10);
         _loc2_ = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,472,FlagDict_Impl_.arrayReadInt(_loc2_,472) + 1);
         get_combat().cleanupAfterCombat();
      }
      
      public function phyllaTalkChoices() : void
      {
         var _g:AntsScene;
         menu();
         addButton(0,"历史",talkAboutAntHistory);
         addButton(1,"交配",talkAboutAntMatingAndRituals);
         addButton(2,"她的生活",phyllasLifePastAndFuture);
         _g = this;
         addButton(14,"返回",function():void
         {
            _g.introductionToPhyllaFollower();
         });
      }
      
      public function phyllaStones() : void
      {
         var _loc2_:int = 0;
         var _loc3_:* = null as IMap;
         clearOutput();
         var _loc1_:int = 0;
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,874) > 10)
         {
            _loc1_++;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,874) > 50)
         {
            _loc1_++;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,874) > 150)
         {
            _loc1_++;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,874) > 300)
         {
            _loc1_++;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,874) > 600)
         {
            _loc1_++;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,874) > 1000)
         {
            _loc1_++;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,874) > 2000)
         {
            _loc1_++;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2276) == 0)
         {
            _loc2_ = 2 + Utils.rand(10) + _loc1_ * 2;
            _loc3_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc3_,2267,FlagDict_Impl_.arrayReadInt(_loc3_,2267) + _loc2_);
            _loc3_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc3_,2269,FlagDict_Impl_.arrayReadInt(_loc3_,2269) + _loc2_);
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2269) >= 200)
            {
               awardAchievement("蚂蚁工坊",171);
            }
            statScreenRefresh();
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,879) == 0)
            {
               outputText("你问菲拉挖掘时有没有多余的石头可以给你。她高兴地点点头，跑到一小堆石头前翻找起来。过了一会儿，她跑回你身边，举起她的四只手。");
               outputText("[pg][say: 我希望……这些足够了，我是说……" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,874) < 1 ? "我" : "我们") + "几乎一直在挖掘，所以很快就会有更多的。]你用手揉乱了她的头发，笑着告诉她这已经足够了，并建议她保留一些，而不是扔到外面。当你从她手中接过石头时，她调皮地向你敬了个礼。");
               outputText("[pg]你获得了 " + _loc2_ + " 块石头。");
               outputText("[pg][say: 你在这里还有什么想做的吗？]她兴奋地问道。");
            }
            else
            {
               outputText("你问菲拉是否允许你拿走她和她的孩子们在挖掘时收集的一些石头。她高兴地点点头，闭上眼睛，头微微向后仰。过了一会儿，你的一个孩子跑了进来。他跑到菲拉房间角落里的一堆石头前，收集了一会儿，走到你面前，给了你几块石头。你收下了它们。");
               if(get_player().cor < 50 || _loc2_ >= 10)
               {
                  outputText("[pg]你拍了拍他的头，表扬他干得好，然后他向巢穴深处走去，留下你和菲拉单独在一起。");
               }
               else
               {
                  outputText("[pg]你数了数那些宝石，对那个雄蚁和菲拉都露出了失望的表情。你重重叹了口气，果断地指向出口，你的孩子羞愧地低下头，垂头丧气地走回隧道深处。菲拉看起来同样沮丧，只是怔怔地盯着地面——由于\"怀孕\"的缘故，她几乎无法动弹。");
               }
               outputText("[pg][say: 你在这里还有什么想做的吗？]");
               outputText("[pg]你获得了 " + _loc2_ + " 块石头。");
            }
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2276,1);
         }
         else
         {
            outputText("你问菲拉挖掘时有没有多余的石头可以给你。她伤心地摇摇头，说道：[say: 对不起，这就是你今天能得到的所有石头了。你明天再来吧。]");
            outputText("[pg][say: 你在这里还有什么想做的吗？]");
         }
         introductionToPhyllaFollower(false);
      }
      
      public function phyllaSprite(param1:Boolean = false) : void
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,879) == 0)
         {
            if(param1)
            {
               spriteSelect(SpriteDb.get_s_phylla_nude());
            }
            else
            {
               spriteSelect(SpriteDb.get_s_phylla());
            }
         }
         else
         {
            spriteSelect(SpriteDb.get_s_phylla_preg());
         }
      }
      
      public function phyllaSexMenu() : void
      {
         var _g:AntsScene;
         menu();
         phyllaSprite(true);
         addButtonDisabled(0,"接受口交","这个场景需要你有一根肉棒。");
         addButtonDisabled(1,"操她","这个场景需要你有一根肉棒。");
         addButtonDisabled(2,"女女性爱","这个场景需要你有一个阴道。");
         addButtonDisabled(3,"群交 (男)","这个场景需要你有一根肉棒。还需要至少10个蚂蚁孩子和足够的腐化度。");
         addButtonDisabled(4,"群交 (女)","这个场景需要你有一个阴道。还需要至少10个蚂蚁孩子和足够的腐化度。");
         addButtonDisabled(5,"产卵","这个场景需要你有一个蜘蛛产卵管。");
         if(get_player().hasCock())
         {
            addButton(0,"接受口交",phyllaBeeeJays);
            addButton(1,"操她",dickPhylla);
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,879) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,874) >= 10)
            {
               addButton(1,"操她",dudesFuckEggLayingBitches);
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,874) > 10 && get_player().isCorruptEnough(75))
            {
               addButton(3,"群交 (男)",orgyWithDatColonyCorruptDudes);
            }
         }
         if(get_player().hasVagina())
         {
            addButton(2,"女女性爱",lesbianFisting);
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,879) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,874) >= 10)
            {
               addButton(2,"女女性爱",birfingSexWithAntsForDasLadies);
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,874) > 10 && get_player().isCorruptEnough(75))
            {
               addButton(4,"群交 (女)",antColonyOrgy4Ladies);
            }
         }
         if(get_player().canOvipositSpider())
         {
            addButton(5,"产卵",eggDatBitch);
         }
         _g = this;
         addButton(14,"返回",function():void
         {
            _g.introductionToPhyllaFollower();
         });
      }
      
      public function phyllaPearance() : void
      {
         var _g:AntsScene;
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,879) == 0)
         {
            outputText("菲拉是一个5英尺8英寸高的蚂蚁形态，有着非常小巧、女性化的骨架，覆盖着高度清晰的肌肉。她有四只手臂，两只连接在肩膀上，两只稍小一点的连接在肚子上的前锯肌上。她的两组手臂和类似人类的腿都覆盖着半反光的棕色甲壳素盔甲板。她互锁的关节让你想起昆虫的关节是如何相互连接的。她的腹部大约有4英尺长，覆盖着大块互锁的皮肤颜色的外骨骼板。尽管她必须承受腹部的重量，但她的臀部非常少女。她那健美的屁股很少被看到，因为她的腹部大部分时间都覆盖着它。她有一张轮廓分明、略带女性化的脸，还有一双没有瞳孔或虹膜的大杏仁状翠绿色眼睛。考虑到她的嘴唇有多薄，她的嘴大得惊人。当她对你微笑时，你会看到一排类似人类的牙齿，带有典型的人类犬齿。她短短的棕色头发通常是乱蓬蓬的，沾满了泥土，尽管在极少数情况下，她会把它做成两个长刘海框住她的脸，让其余的头发在脖子周围飘动。");
            outputText("[pg]她有一对B罩杯的乳房，每个乳房上有一个0.5英寸的乳头。");
            outputText("[pg]她的双腿之间有一个非常紧的小穴，有一个2.0英寸的阴蒂。");
            outputText("[pg]她的健美臀部之间有一个屁眼，就在它该在的地方。");
            outputText("[pg]她的腹部下方尖端有一个产卵缝，她的卵就是从那里生出来的。");
         }
         else
         {
            outputText("菲拉是一个5英尺8英寸高的蚂蚁形态，有着非常小巧、女性化的骨架，覆盖着高度清晰的肌肉。她有四只手臂，两只连接在肩膀上，两只稍小一点的连接在肚子上的前锯肌上。她的两组手臂和类似人类的腿都覆盖着半反光的棕色甲壳素盔甲板。她互锁的关节让你想起昆虫的关节是如何相互连接的。她的腹部目前充满了卵，大约有7英尺长！它覆盖着大块互锁的皮肤颜色的外骨骼板，每隔一两分钟你就会看到菲拉在收缩和放松时呻吟，弹出另一个卵。尽管她必须承受腹部的重量，但她的臀部非常少女。她那健美的屁股很少被看到，因为她的腹部大部分时间都覆盖着它。她有一张轮廓分明、略带女性化的脸，还有一双没有瞳孔或虹膜的大杏仁状翠绿色眼睛。考虑到她的嘴唇有多薄，她的嘴大得惊人。当她对你微笑时，你会看到一排类似人类的牙齿，带有典型的人类犬齿。她短短的棕色头发通常是乱蓬蓬的，沾满了泥土，尽管在极少数情况下，她会把它做成两个长刘海框住她的脸，让其余的头发在脖子周围飘动。");
            outputText("[pg]她有一对DD罩杯的乳房，每个乳房上有一个0.5英寸的乳头。随着她的宫缩，乳汁偶尔会从她肿胀的乳晕中喷出。");
            outputText("[pg]她的双腿之间有一个非常紧的小穴，有一个2.0英寸的阴蒂。一小股润滑液不断顺着她的腿流下，她的嘴唇微微张开。");
            outputText("[pg]她的健美臀部之间有一个屁眼，就在它该在的地方。");
            outputText("[pg]她的腹部底端有一个产卵口，随着每一次收缩，都会喷出一滩产卵润滑液，让卵顺着滑落到地板上。");
         }
         menu();
         _g = this;
         addButton(0,"继续",function():void
         {
            _g.introductionToPhyllaFollower();
         });
      }
      
      public function phyllaPCLostToMino(param1:Boolean, param2:Boolean = false) : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_antguards());
         outputText("在竞技场惨败并随后遭到羞辱后，当你试图离开时，两名守卫走近你。其中一个递给你一个小瓶子。菲拉公主在房间的角落里哭泣，你试图靠近她，但其中一个守卫挡在了你面前。[say: 喝！]他命令道，拔开了小瓶的塞子。");
         outputText("[pg]很奇怪……你并不在乎被一只蚂蚁命令，但当你闻到液体的味道时，你发现自己无动于衷。你一口气喝光了它；它没有味道或质地，之后你也没有任何异样的感觉。守卫们再次叫你离开，虽然你并不真的想走。环顾四周，你心想，如果可以的话，你会完全满足于在这里的地下待上一段时间……也许永远！然而，其中一名守卫把你推向出口，导致你踉跄了一下，直到你稳住自己。在你离开之前，你瞥了一眼菲拉公主看着你的地方，但她已经被其他尽职的守卫带走了。你沿着小路回到地面，然后从那里回到营地。");
         var _loc3_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc3_,473,FlagDict_Impl_.arrayReadInt(_loc3_,473) + 1);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,473) > 3)
         {
            antastrophyBadEnd();
            return;
         }
         get_combat().cleanupAfterCombat();
      }
      
      public function phyllaPCBeatsGnoll(param1:Boolean) : void
      {
         var _loc2_:* = null as IMap;
         clearOutput();
         spriteSelect(SpriteDb.get_s_antguards());
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,474) == 0)
         {
            outputText("当你站在被击败的对手面前，战斗的红色迷雾褪去时，你终于意识到了人群的存在。每个人都在欢呼，有些人甚至把宝石扔进竞技场，落在你的脚边。你骄傲地将你的[weapon]举向天空，只引得他们爆发出更大的咆哮和口哨声。当你走出去时，菲拉迎接了你，对你的每一处割伤和擦伤都嘘寒问暖，一如既往地像母亲一样。你微笑着任由她摆布。通常的守卫似乎不在周围，但你猜他们就潜伏在视线之外。");
            outputText("[pg][say:你是我见过的最了不起的勇者，]女孩说道。[say:我的意思是，虽然我没见过多少；你其实是第一个。呃，我第一个交谈的……]她似乎有些语无伦次——你不确定她只是害羞还是不习惯说话；也许两者都有。显然她很少有机会和外人交谈。");
            outputText("[pg]你小心翼翼地举起一根手指放在她的唇上，示意她安静，然后冲她眨了眨眼，露出一个微笑。她微微脸红，回以微笑。没有时间做更多的事了，因为两名守卫到了；一个来带走她，另一个——你那挥舞着生锈武器的向导——来护送你出去。");
            _loc2_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc2_,474,FlagDict_Impl_.arrayReadInt(_loc2_,474) + 1);
         }
         else
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,472) - FlagDict_Impl_.arrayReadInt(KFLAGS.flags,473) >= 2 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,472) >= 3 && get_player().get_gender() > 0)
            {
               get_game().set_inCombat(false);
               _loc2_ = KFLAGS.flags;
               FlagDict_Impl_.arrayWriteInt(_loc2_,472,FlagDict_Impl_.arrayReadInt(_loc2_,472) + 1);
               get_combat().cleanupAfterCombat(antGirlGoodEnd);
               return;
            }
            outputText("这已经不是你第一次做到这种事了，但它仍然让观众们兴奋地站了起来。你只是站在竞技场中央，享受着这一切。菲拉向你走来，脸颊泛红，因为喧闹的观众跟随着她，发出嘘声，并要求她给她的勇者一个吻。她像往常一样照顾你，当她完成后，她握住你的手，满怀期待地看着你。你对她微笑，用另一只手拨开她脸上的头发；在接触的瞬间，她的脸红透了。这时，两名守卫出现，将你们俩带走。既然没有理由再留下来，你便让你的向导带你回到地表。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,472) - FlagDict_Impl_.arrayReadInt(KFLAGS.flags,473) >= 2 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,472) >= 3)
            {
               outputText("[pg]一旦你回到外面，你意识到你在竞技场上的许多壮举现在应该已经为你赢得了蚂蚁们的青睐。");
               outputText("[pg]也许他们还在犹豫，因为你没有生殖器，因此无法创造或孕育后代？");
            }
         }
         _loc2_ = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,472,FlagDict_Impl_.arrayReadInt(_loc2_,472) + 1);
         get_combat().cleanupAfterCombat();
      }
      
      public function phyllaLaysSomeDriderEggs() : void
      {
         clearOutput();
         phyllaSprite();
         pregnancy.knockUpForce();
         get_images().showImage("ant-desert-lay-drideregg");
         outputText("当你靠近菲拉的卧室时，你能听到一声充满惊讶和担忧的“咿！”。以为她可能遇到了麻烦，你冲进了房间。环顾四周寻找任何直接的危险，你只看到菲拉的阴道流出绿色的粘液。她抱着非常大的孕肚，双腿在床罩上摊开的样子表明你最近播下的种准备孵化了。[say: [name]，是时候了！呃！我……无法用语言表达这感觉有多奇怪！]菲拉大喊道，对从她体内流出的绿色软泥怪感到有些害怕。");
         if(get_player().cor < 75)
         {
            outputText("[pg]你迅速跪在她的床边，用你的手握住她较大的一只手，告诉她你们的孩子准备好来到这个世界了。他们需要他们的母亲集中注意力并用力推。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,879) > 0)
            {
               outputText("[pg][say: 它——啊！]当一阵宫缩穿过她的腹部时，菲拉在你的肩膀上呻吟。[say: 我不知道我能不能同时做这两件事！]菲拉哭喊道。你用令人安心的语气告诉菲拉，她只需要同时用力推。");
            }
            outputText("[pg][say: 我——啊！]当你看到她全身收缩时，她的话语再次被夺走。");
            outputText("[pg][say: 哦，天哪，我能感觉到你的孩子滑出来了！]她半是惊呼，半是呻吟。菲拉的身体在快乐和痛苦的混合中扭动，因为她只专注于用力。在似乎过了一个世纪之后，当许多卵中的第一个从她体内挤出时，她长长地松了一口气。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,879) > 0)
            {
               outputText("[pg]在你的卵掉到地板上的同时，你看到菲拉的一个卵在她产生的浓稠凝胶的帮助下从她腹部的尖端滑出。");
            }
            outputText("[pg]知道");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,879) > 0)
            {
               outputText("两个卵自己都没问题");
            }
            else
            {
               outputText("这个卵自己没问题");
            }
            outputText("后，你重新将注意力集中在帮助菲拉分娩上。随后每一个找到自由的卵都让菲拉曾经充满痛苦的尖叫变成了令人陶醉的愉悦呻吟，因为她的小穴被你每一个挤出的卵的刺激所淹没。终于，最后一个卵从她的阴道滑出，轻轻地落在床上。她的磨难结束了，菲拉长长地松了一口气。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,886) == 0)
            {
               outputText("[pg][say: 我-我以前从来没有这样生过孩子。]她一边喘着气，一边揉着现在恢复正常大小的肚子。[pg][say: 我的意思是！我想这样，只是这不一样，通常我……用我的……]她害羞地指了指自己的腹部。[say: 找个时间你还得再对我做一次。]你感觉到一种母性的温暖从菲拉身上散发出来。你很清楚她只是喜欢做母亲；她的孩子长什么样对她来说并不重要。");
            }
            else
            {
               outputText("[pg]揉着现在空荡荡的肚子，菲拉谈论着她有多喜欢通过她的“另一个洞”生孩子，以及你应该更经常地用这种方式让她怀孕。你再次感觉到母性的温暖从菲拉身上散发出来。");
            }
            outputText("[pg]你和她亲密的时刻被蛋壳破裂和孵化的声音打断了，因为你的孩子们吵闹着要自由。看到他们的母亲，他们爬上床罩，并建立了一个啄食顺序，决定谁将第一个去吸吮菲拉充满乳汁的乳房。分娩完成后，你亲吻了菲拉的嘴唇，并感谢她孕育了你的孩子。[say: 谢谢你帮我实现了我的人生目标。我知道你还有其他事情要做，但只要知道……我爱你。]她虚弱地回答。你对她眨了眨眼，点了点头，然后回到地面。");
            doNext(get_camp().returnToCampUseOneHour);
         }
         else
         {
            outputText("[pg]很好，你可以看着你那腐化的幼崽从这个天真到屈服于你欲望的生物体内诞生。菲拉痛苦的尖叫声很快变成了幸福的呻吟，因为她对性愉悦的本能迟钝了令人烦躁的痛苦，并接管了她的思想。你几乎没有注意到这些，因为你的思绪转向了未来将菲拉按在床上的情景——在你插入她并在她体内种下尽可能多的卵之前，她的屁股将如何在空中诱人地摇晃，她将如何乞求被你的孩子填满，并像一个堕落的荡妇一样嚎叫，因为你的货物用你腐化的孩子填满了她。");
            outputText("[pg]第一个卵从菲拉的小穴里挤出来，她发出明显的性愉悦的哼声。看到这一幕，你舔了舔嘴唇；你几乎无法抑制现在就骑上她并让她怀上更多你未来孩子的冲动，想象着你这样做时她脸上满足的被侵犯的表情。但你设法克制住了自己，选择看着一个接一个的卵蠕动出来。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,879) > 0)
            {
               outputText("[pg]好像你自己腐化的孩子对她来说还不够，她还必须同时应对生下自己的后代。");
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,886) == 0)
            {
               outputText("[pg]嗯……这是你不知道她能做到的事情，也是你将来会牢记在心的事情。你看着她努力协调腹部和阴道的不同收缩，但最终失败了。很快就很清楚，她不再知道哪个卵从哪个洞里出来，只是随着她全身的起伏和收缩的脉动，在激情的呻吟中尖叫。");
            }
            outputText("[pg]随着最后一次用力，最后一个卵从菲拉的小穴中排出。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,879) > 0)
            {
               outputText("[pg]虽然从她腹部的大小来看，你确定她还有几个没生出来。她自己的卵似乎没有你的卵给她带来那么多“麻烦”。菲拉疲惫地瘫倒在床上，完全筋疲力尽。");
            }
            dynStats(DynStat.Lust(45));
            if(get_player().canOvipositSpider())
            {
               outputText("[pg]该死！你太想让她怀孕了！你作为蛛化精灵想要骑上她的冲动有压倒你并把你变成一个无脑的生育机器的危险……也许这毕竟不是那么糟糕，但你需要在被欲望吞噬之前做出决定！");
               menu();
               addButton(0,"让她恢复",letPhyllaRecover);
               addButton(1,"骑乘",driderDoublePhllaMount);
            }
            else
            {
               menu();
               addButton(0,"继续",letPhyllaRecover);
            }
         }
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,886,FlagDict_Impl_.arrayReadInt(_loc1_,886) + 1);
         _loc1_ = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,894,FlagDict_Impl_.arrayReadInt(_loc1_,894) + (5 + Utils.rand(4)));
      }
      
      public function phyllaLaysEggsToggle() : void
      {
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,879) == 0)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,879,1);
            outputText("当你深情地凝视着菲拉的眼睛时，她似乎对你的想法感到困惑。你用双手握住她的四只手，告诉她你想要孩子。不只是一两个；你想要她能生多少就生多少。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,881) > 0)
            {
               outputText("你告诉她，你想要一个像她在腐化之前的时代所说的那样的蚁群。");
            }
            outputText("[pg]起初她震惊地睁大了眼睛，但随后你看到了你预料中的反应；她的脸上绽放出如此灿烂的笑容，你甚至会发誓你刚刚在房间里点燃了一大堆火。她看起来很兴奋；事实上，她似乎失去了思路，只是站在那里消化你说的话……这有点奇怪。然后她突然转过身，四肢着地趴下。她的腹部隆起，向你展示了她的全部。她的尴尬显然被她想和你繁衍后代的渴望所掩盖。她从自己的双腿间看着你，脸红得像个西红柿。她用两只上臂指着自己的腹部，下臂支撑着自己四肢着地弯腰的姿势。在她的腹部末端有一个小开口，看起来几乎像第二个阴道。一层透明的液体已经开始从开口处渗出，并开始顺着她的腹部流下。");
            outputText("[pg][say: 我只是……需要你舔它。我的意思是，这是一种方法……还有其他方法，我的意思是，但这最快；我想在天黑前开始产卵。求你了……我需要这个……]");
            menu();
            addButton(0,"舔那个",lickThatAntButt);
            addButton(1,"不舔",dontLickAntButt);
         }
         else
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,879,0);
            outputText("你暗自叹了口气；你从来没有真正想要进行这次谈话，但你知道这总有一天会发生。你板起脸，用一种坚定的父亲般的语气说话。菲拉立刻感觉到你是认真的，你吸引了她的全部注意力。你尽量温和地告诉她，你认为她继续生孩子是不安全的。");
            outputText("[pg]令你几乎惊讶的是，她犹豫地同意了你的看法；不知何故，你原本以为她会和你争论，或者恳求给这个世界带来更多的生命。[say: 如果你觉得我再要孩子不安全，我就不要了。我的意思是，你既是我的伴侣，也是我蚁群的保护者。我不想因为人口过剩或腐化的机会而危及我的孩子们。]");
            outputText("[pg]她停顿了一下，做了一个奇怪的表情，她的腹部脉动着，另一个卵从尖端冒了出来。她深深地脸红了。[say: 这是最后一个！我的意思是，我必须把它弄出来，它已经……]");
            outputText("[pg]你打断了她，问她的腹部什么时候能恢复到正常大小——既因为你很好奇，也因为你真的不想让她说完那句话。[say: 应该不会花很长时间。我已经能感觉到它在变化了。]");
            outputText("[pg]你微笑着感谢她答应了你所有的要求。你离开了蚁群，回到营地。");
            doNext(get_camp().returnToCampUseOneHour);
         }
      }
      
      public function phyllaGnollBeatsPC(param1:Boolean, param2:Boolean = false) : void
      {
         var _loc3_:* = null as IMap;
         clearOutput();
         spriteSelect(SpriteDb.get_s_antguards());
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,475) == 0)
         {
            _loc3_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc3_,475,FlagDict_Impl_.arrayReadInt(_loc3_,475) + 1);
            outputText("你躺在竞技场的地板上，听着人群对你发出嘘声，为豺狼人欢呼。在有足够的时间恢复自己之后，你站起来开始向出口走去。四名守卫挡住了去路，其中一名向你递上一瓶神秘的透明液体，示意你喝下去。他们似乎不打算让你不喝就离开，当你低头看着未塞木塞的瓶子时，你脑后传来一阵奇怪的刺痛，告诉你不要担心。你一口气喝了下去，守卫们让你离开。当你漫步走过菲拉时，你完全没有注意到她正在暗自哭泣。");
         }
         else
         {
            outputText("当你离开竞技场时，人群大声地对你发出嘘声。就在你这样做的时候，四名守卫挡住了你的去路；其中一名向你递上一瓶神秘的无味液体。[say:喝！]他冲你吼道。");
            outputText("[pg]你迅速抓起瓶子喝下里面的东西，对被蚂蚁们挤在一起感到恼火。然而，喝下它之后，这种感觉稍微减轻了一些。你心不在焉地看着瓶子，然后摇了摇头。守卫们让开，你从他们身边走过；你四处找了一下菲拉，但没有看到她。既然没有理由留下来，你便回到了地表。");
         }
         _loc3_ = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc3_,473,FlagDict_Impl_.arrayReadInt(_loc3_,473) + 1);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,473) > 3)
         {
            antastrophyBadEnd();
            return;
         }
         get_combat().cleanupAfterCombat();
      }
      
      public function phyllaFirstTimePureBabiesFuckEnding() : void
      {
         clearOutput();
         if(!get_player().canOvipositSpider())
         {
            get_images().showImage("ant-desert-male-first-pure-vagsex");
         }
         var _loc1_:int = get_player().cockThatFits(phyllaCapacity());
         if(_loc1_ < 0)
         {
            _loc1_ = get_player().smallestCockIndex();
         }
         outputText("有一段时间，你让菲拉慢慢适应你在她体内的存在以及她阴道壁的扩张；她对此报以愉悦的轻柔呻吟。她表现出被你的" + get_player().cockDescript(_loc1_) + "强行撑开的明显不适，但你看到她几乎无法抱怨，因为她的身体包裹着你，试图让你留在原处。一旦你觉得她舒服了，你就开始慢慢地抽插，逐渐建立起你自己的节奏。");
         outputText("[pg]你感觉到她较小的那双手移到了你的[legs]之间，开始抚摸你的");
         if(get_player().balls > 0)
         {
            outputText("[balls]");
         }
         else
         {
            outputText("敏感的会阴");
         }
         outputText("。从她唇间溢出的呻吟声在音量和强度上都逐渐攀升，她心知肚明地鼓励着你那充满欲望的努力。她的臀部配合着你的抽插，证明她已经准备好承受你的全部力量，这给了你明确的信号，让你将她按倒，将你的性侵略性释放在她紧致的小爱穴上；你将肉棒猛烈地撞入她的体内，加快了每一次抽插的力度和节奏。");
         outputText("[pg]菲拉自己那断断续续的呻吟开始模仿你的动作，随着每一次用力的抽插而同步增强。这只蚁人形态的许多柔软娇嫩的手紧紧抓住床铺，随着每一次旋转而收紧，意图在你们双方都达到共同的满足之前绝不松手。");
         outputText("[pg]菲拉突然用另一个猛烈的吻将她的嘴唇贴上你的，她的舌头在你的嘴里飞舞，与你的舌头交缠，以令人惊讶的凶猛拍打着，你们的唾液交融在一起。你的肉体欢愉突然开始与某种……其他东西混合交织。你恍然大悟，菲拉再次启动了她的“链接”；你和你爱人的欢愉，在你们两人之间瞬间共享。将你的" + get_player().cockDescript(_loc1_) + "更深地引导入她体内的原始需求，从她的脑海传递到你的脑海。有了这种新的共享感知，你感觉到她阴道的内壁向你的肉棒发送着脉冲，让你沐浴在快感的浪潮中。她长长的阴蒂沿着你肉棒的根部摩擦，使她一次又一次地弓起背。你的抽插变成了一连串快速的断奏，你的臀部和她的臀部在共享的和谐中协同工作。然而，你能感觉到她抓住了并理解了你的发情；你需要沿着她的深处恰到好处地运作你的肉棒。你需要尽可能用力地穿透她，因为你们都在酝酿着高潮。你感觉到一种无法控制的、原始的冲动，想要在她的爱之通道里播种，让她怀上你的孩子。你在不知不觉中发出一声低吼，咬紧牙关，在她的身上猛烈地冲刺，完全被动物般的欲望吞噬而没有注意到。");
         outputText("[pg]在这种节奏下，没过多久，你的脑海突然被陌生的警告轰炸。那是是与非、前进与停止、快乐与痛苦的混合体；而你陶醉于它所接收到的东西。值得庆幸的是，来自菲拉的混合信息在几秒钟内就被理解了，因为她突然用全身紧紧夹住，并为即将到来的事情做好了准备。伴随着一声少女般的嚎叫，菲拉再也无法抗拒，达到了高潮。你能感觉到她那散发着甜美气味、非常湿润的女性体液释放在你的生殖器上。接近你自己的高潮时，你开始以恰到好处的角度抽插，她的阴道似乎在乞求你在她体内释放。当你的" + get_player().cockDescript(_loc1_) + "在她体内最深处时，她的阴道壁传来一阵肉体的颤动。仿佛这还不够；你感觉到脑海中有一种低语，召唤你用你的精液淹没她。你感觉到对你的意识有一种明显的拉扯；仿佛让她怀孕就能满足她的每一个需求，她成为母亲的宿命。这种情感的高潮太强烈了；你无法忽视它，无法控制它，也无法再忍受它。你弓起背，给出最后一次碎石般的抽插，你的" + get_player().cockDescript(_loc1_) + "到达了她体内最深处。你猛烈地咕哝着，射在她的体内，将你的");
         if(get_player().cumQ() < 50)
         {
            outputText("细细的");
         }
         else if(get_player().cumQ() < 500)
         {
            outputText("沉甸甸的");
         }
         else
         {
            outputText("浓稠的");
         }
         outputText("精液远远地射入她的子宫。菲拉也做出了回应，她扭动着臀部，用双腿以一种几乎像挤奶一样的方式挤压着你的身体，试图尽可能多地将精液吸入她的子宫。");
         outputText("[pg]用尽最后的力气，你从菲拉体内拔出，看着几乎没有精液从她体内流出。");
         if(get_player().cumQ() >= 100 && get_player().cumQ() < 1000)
         {
            outputText("考虑到你通常的射精量，这真是太神奇了。你觉得你看到她的肚子上有一个以前没有的小凸起。");
         }
         else if(get_player().cumQ() >= 1000)
         {
            outputText("当你低头看她的下体时，你的大脑努力去理解她怎么能……然后顺着她的身体往上看，你明白了。她的肚子被你的精液撑得鼓鼓的，几乎到了看起来已经怀孕的地步。");
         }
         outputText("[pg]精疲力竭的你把头垂在菲拉的旁边，气喘吁吁，呼吸沉重，你让自己休息一下。链接的碎片依然存在，你能感觉到菲拉的满足感。她充满爱意地抚摸着你的头，拍了拍她的肚子。显然，她的心思都放在你刚刚留在她体内的包裹上。随着同步的迅速消退，你最后一次探测了她的思想。你几乎能感觉到你那滚烫、粘稠的精液紧紧附着在她阴道壁上的感觉。一种温暖的感觉流遍你的全身，因为你想到你第一次尝试就让她怀孕了，终于让她成为了母亲……或者至少菲拉似乎是这么希望的。最后，你终于感觉到了她觉得此时此刻与你分享的亲密无间的纽带。一种不想放手的感觉，想要刚刚过去的繁殖永远继续下去。她渴望生下尽可能多的孩子，只要她的身体允许，以满足她繁殖的需求。");
         if(get_player().canOvipositSpider())
         {
            outputText("[pg]这种压倒性的母性感觉带来了一个有趣的主意！你转向菲拉，告诉她你可以帮助她实现愿望。她有点惊讶地看着你，好像你已经做的还不够似的。");
            outputText("[pg]你继续解释，告诉她你的身体里充满了卵子，它们正急切地等待着一个愿意孕育它们的宿主。如果她想生尽可能多的孩子，你们的结合可以满足她的愿望；尽管如此，她将同时生下蚂蚁和蜘蛛的孩子。");
            if(get_player().get_inte() / 20 + Utils.rand(20) + 1 < 16)
            {
               outputText("[pg]菲拉沉思了片刻，摇了摇头。[saystart]对不起，[name]，我现在还不太适应这个。");
               if(pregnancy.get_isPregnant())
               {
                  outputText("我只是不能在体内再装任何东西了。对不起！请不要生气……我是说我会的！就在……这一批之后……");
               }
               outputText("[pg]也许以后吧……[sayend]");
            }
            else
            {
               outputText("[pg]带着一些犹豫和考虑，菲拉思考了一会儿关于在多个方面成为育母的想法。带着羞涩的微笑，菲拉勉强同意容纳你们两人的孩子。[say: 我-我们该怎么做？我是说，我从来没有见过或听说过任何东西和蛛化精灵交配……我-我的卵是从我的腹部出来的……]她询问道。");
               outputText("[pg]你举起一根手指放在她的唇边，告诉她躺在床上放松。你完全知道她的卵是从哪里出来的。菲拉同时从阴道和腹部产卵的画面让你更加渴望这一切。");
               if(get_player().cor >= 75)
               {
                  outputText("可怜的菲拉不知道，你只是打算把她当作一个生育机器，来缓解你自己卵囊的紧张感。");
               }
               outputText("[pg]在不确定的期待中，菲拉听从了你的指示躺下，背靠在床上，腹部朝天。你帮她摆好正确的姿势；当你爬上床时，将她的小穴对准你。你停在菲拉的上方，用双手捧起她柔软的脸庞吻了她，紧紧地将她抱在怀里，同时将你的产卵管对准她的阴道。");
               outputText("[pg]当你进入她体内并开始释放润滑液时，她用双臂紧紧抱住你。分泌物刺激着她的快感中心，菲拉在你的嘴里呻吟着。通过链接，你告诉她做好准备，因为你感觉到第一批卵正顺着你的产卵管进入她的小穴。");
               outputText("[pg]她眯起眼睛，准备迎接不可避免的卵强行进入她体内，当椭圆形的肿块最终接触并进入她体内时，她喘着粗气。你能感觉到卵进入菲拉体内，撑开她的小穴以容纳未来的沉积物，领头的卵撞击她的子宫颈，并设法进入内部。");
               outputText("[pg][say: 呃！有点……疼……感觉好奇怪——我是说很舒服！]她大声喊道。");
               outputText("[pg]你安慰她，同时告诉她还有几个在路上；这让菲拉一想到自己充满了这么多新生命，最终将生下它们，就自豪地容光焕发。一个接一个的卵滑入菲拉体内，随着你塞入更多，她的肚子被你的后代撑得越来越大。最后，最后一颗卵产在菲拉体内，伴随着一声响亮的“啵”声，你从她的爱穴中抽出了产卵管；你知道它会及时恢复的。菲拉抚摸着她的肚子，闪烁着喜悦的光芒，充满了她爱人未来的孩子，这将帮助蚁群变得强大。");
               get_player().dumpEggs();
               pregnancy.knockUp(15,192);
            }
         }
         outputText("[pg]在你们俩都平静下来后不久，链接就消失了，菲拉充满爱意地亲吻你的脖子，哼着表示赞同。你微笑着回应，但从未想过一个人的母性本能会有多强。听到不属于你自己的原始驱动力几乎震耳欲聋。然而，你情不自禁地对向你展示的这种理解感到感激。");
         if(get_camp().loversCount() > 1)
         {
            outputText("[pg]所以这就是你其他爱人的感受。");
         }
         outputText("[pg]没过多久你就睡着了，而菲拉则表达了她对你们刚刚分享的亲密的感激之情，在你打瞌睡时亲吻你的身体并性感地抚摸你。");
         get_player().orgasm("Generic");
         menu();
         addButton(0,"继续",waifuQuestOver);
      }
      
      public function phyllaDigsForGems() : void
      {
         var _loc2_:int = 0;
         var _loc3_:* = null as Player;
         clearOutput();
         var _loc1_:int = 0;
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,874) > 10)
         {
            _loc1_++;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,874) > 50)
         {
            _loc1_++;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,874) > 150)
         {
            _loc1_++;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,874) > 300)
         {
            _loc1_++;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,874) > 600)
         {
            _loc1_++;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,874) > 1000)
         {
            _loc1_++;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,874) > 2000)
         {
            _loc1_++;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,893) == 0 && Utils.rand(20) + _loc1_ > 10)
         {
            _loc2_ = 0;
            _loc2_ = 10 + Utils.rand(10) + _loc1_ * 2;
            _loc3_ = get_player();
            _loc3_.set_gems(_loc3_.get_gems() + _loc2_);
            statScreenRefresh();
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,879) == 0)
            {
               outputText("你问菲拉在挖掘巢穴时有没有发现什么宝石。她高兴地点点头，跑到一个小石箱前翻找起来。过了一会儿，她跑回你身边，举起她的四只手。");
               outputText("[pg][say: 我希望……这些足够了，我是说……它们很稀有，即使在这里也是。]你用手揉乱了她的头发，笑着告诉她这已经足够了，并建议她继续寻找。当你把宝石放进小袋子时，她调皮地向你敬了个礼。");
               outputText("[pg]你获得了 " + _loc2_ + " 颗宝石。");
               outputText("[pg][say: 你在这里还有什么想做的吗？]她兴奋地问道。");
            }
            else
            {
               outputText("你问菲拉她或她的孩子们在挖掘时有没有发现什么宝石。她高兴地点点头，闭上眼睛，头微微向后仰。过了一会儿，你的一个孩子跑了进来。他跑到菲拉房间角落里的一个小石箱前，翻找了一会儿，找到了他想要的东西。他走到你面前，展示他的发现。你收下了他找回的宝石。");
               if(get_player().cor < 50)
               {
                  outputText("[pg]你拍了拍他的头，表扬他干得好，然后他向巢穴深处走去，留下你和菲拉单独在一起。");
               }
               else
               {
                  outputText("[pg]你数了数宝石，然后失望地看了他和菲拉一眼。你重重地叹了口气，断然指向出口，你的孩子羞愧地低下头，走回隧道中。菲拉看起来同样沮丧，只是盯着地面，由于\'怀孕\'而无法真正动弹。");
               }
               outputText("[pg][say: 你在这里还有什么想做的吗？]");
               outputText("[pg]你获得了 " + _loc2_ + " 颗宝石。");
            }
         }
         else
         {
            outputText("你问菲拉在挖掘时有没有发现更多的宝石。[say: 没有，对不起。我没有。自从你上次问过之后就没有了。我会做得更好的！我是说，我知道你喜欢它们。它们很稀有……即使在这里也是。我会做得更好的……]");
            if(get_player().cor < 50)
            {
               outputText("[pg]你告诉她没关系，你以后再来看看。");
            }
            else
            {
               outputText("[pg]你叹了口气，有些失望，但还是轻轻拍了拍她的头。");
            }
            outputText("[pg][say: 你在这里还有什么想做的吗？]她兴奋地询问道。");
         }
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,893,1);
         introductionToPhyllaFollower(false);
      }
      
      public function phyllaCorruptMascEnding() : void
      {
         clearOutput();
         get_images().showImage("ant-desert-male-first-corrupt-vagsex");
         outputText("又过了几秒钟，你用力地在她的臀部上抽插，试图“驯服”你的新性玩具。一旦你确信她能够应付即将发生的事情，你就抓住她的头发，沿着她的肉洞滑动自己。她腹部的背面摩擦着你的");
         if(get_player().get_tallness() >= 72)
         {
            outputText("胸部");
         }
         else
         {
            outputText("肚子");
         }
         outputText("，但这只会对你有所帮助。你需要一个支撑来完成你即将要做的事情，而她僵硬的腹部正好合适。菲拉发出困惑的声音，回头看了一眼，脸上越来越担忧。");
         outputText("[pg][say: 你-你在干什么？]她紧张地问。[say: 这不是我想象的——]");
         var _loc1_:int = get_player().cockThatFits(phyllaCapacity());
         if(_loc1_ < 0)
         {
            _loc1_ = get_player().smallestCockIndex();
         }
         outputText("[pg]没等她说完，你就把你的" + get_player().cockDescript(_loc1_) + "插入她体内，让她在极度的惊讶和不适中大叫起来。[say: 这就是<b>我</b>交配的方式！]你告诉她，并说她永远不会忘记和你的第一次。她的嘴微微张开，随后你的旋转结束了她要说出的任何话。你像个疯狂的小丑一样对菲拉现在的姿势坏笑，开始从后面支配她，扭动你的臀部。你听到你的");
         if(get_player().balls == 0)
         {
            outputText("大腿");
         }
         else
         {
            outputText(get_player().ballsDescriptLight());
         }
         outputText("随着每一次对她阴蒂的猛烈抽插，在她的臀部上发出响亮的拍打声。她对你显然打算缺乏亲密感而沮丧地哀嚎。然而，混杂在她可怜的抗议中的呻吟表明，这个天真的小女人正在从被如此粗暴地对待中获得快感；在她的屁股上狠狠地拍了一巴掌证实了这一点，因为她在恼怒的快感中发出呜咽。你感觉到她的小穴越来越湿，温度越来越高，你继续对她的腹部施加压力，用它来支撑你对她阴道的粗暴操弄。");
         if(get_player().isGoo())
         {
            outputText("也许这个可怜的宝贝需要一些温柔的关注，你暗自思忖。降低你身体的硬度，你将她的腹部深深地压入你粘稠、黏糊糊的身体里，一旦她牢牢地在里面，你就重新变硬，把手伸向她的乳头，在你继续抽插她的臀部时狠狠地捏它们。");
         }
         outputText("[pg]可怜的菲拉只能抓住她的垫子，努力保持舒适。对她小穴的野蛮钻探迫使她将臀部抬得越来越高，形成一个锐角。尽管她努力尝试，但她的努力根本无法与你野蛮的战术相抗衡，因为你把她的爱穴捣得粉碎。她所有保持舒适姿势的尝试都迅速化为泡影，她只能听任自己从后面被粗暴地占有。你看着她把头埋在垫子里，以掩盖她痛苦而狂喜的嚎叫。");
         var _loc2_:int = get_player().cockThatFits2(phyllaCapacity());
         if(get_player().cockTotal() < 2)
         {
            _loc2_ = -1;
         }
         if(_loc2_ >= 0)
         {
            outputText("[pg]为了增加你自己的快感，你决定用");
            if(get_player().cockTotal() > 2)
            {
               outputText("你空闲的肉棒之一");
            }
            else
            {
               outputText("你空闲的肉棒");
            }
            outputText("摩擦她紧致的屁股。感觉到这个新的入侵者，她转过头来看你。");
            outputText("[pg][say: 不……求-求你了，你不能……我是说……]当你的肉棒随着每一次抽插越来越深时，她设法在狂喜的呻吟和痛苦的哭喊中抗议。你对她的恳求嗤之以鼻，将你的另一根肉棒引导入她的肛门。你告诉她，这从来都不是她能做出的选择。你感觉到她肌肉发达的臀部紧紧地挤压着你的肉棒——虽然没有她的小穴那么紧，但也足够了！你继续挺动臀部，让你的肉棒填满她的两个洞。当你沿着她的肛门猛烈抽插时，你听到了更多沉闷、痛苦的呻吟。");
            outputText("[pg]<b>你夺走了菲拉的肛门处女！而且你享受着每一秒。</b>");
            if(get_player().biggestCockArea() > phyllaCapacity())
            {
               outputText("[pg]既然她的手没在忙，而且她显然也没有用那张嘴做任何有用的事情；你伸出手，引导你的一根肉棒，让它压在她朝下的肚子上。你告诉她把它夹在乳房之间，开始吸吮龟头。但这并没有阻止你继续猛烈地抽插她的背面。她迅速用她较小的手抓住你[cock biggest]，引导它在乳房之间找到一个更好的位置。她用上面的手把乳房挤在一起。你立刻感觉到了她B罩杯的效果，随着每一次抽插，它们温暖着你长长肉棒的根部。");
            }
         }
         outputText("[pg]你保持着对她腹部老虎钳般的压力，继续向前推进，迫使你的阴茎");
         if(_loc2_ >= 0)
         {
            outputText("");
         }
         outputText("深入她体内。你进一步加强了对菲拉的力量和控制，似乎在向菲拉传达让她释放一切，不要退缩，让她完全顺从于你。这个无意识的举动让菲拉释放出一连串充满欲望的胡言乱语。你感觉到她的身体屈服于你的意志，她抛弃了羞怯和克制，将臀部贴在你身上，意图和你一起发情，就像两只在野蛮交配中交织在一起的原始动物。你看不见，但你能尝到她渴望被播种的饥渴；你能感觉到并想象出她那迷人、涨红的小脸带着激情咬紧牙关，你的本能和意识完全接管了她，命令她挺动并操你的肉棒，直到她得到她的小穴渴望的东西。");
         outputText("[pg]接下来的几分钟，你们俩都很难准确回忆起来。你们的身体在相互摩擦时流出的汗水。你们交配的气味弥漫在空气中……菲拉像个收了金条的廉价妓女一样呻吟着……当你的骨盆撞击她的小穴时，肉体碰撞的声音越来越响亮。在最终释放之前，这一切都只是激烈、野蛮欲望的模糊印记。当你接近高潮时，你能听到脑海里有某种声音……某种外来的声音……某种警告菲拉你会导致她堕落的声音。恳求她远离你腐败的污点……随着菲拉接近高潮，那瞬间阻碍交配的关切声音很快被一连串响亮的、毫无掩饰的嚎叫和呻吟所淹没。你无视了那些奇怪的恳求，但你不确定她是否听到了，或者那是她自己的想法。干扰消失后，你继续对她进行狂野的抽插。");
         outputText("[pg]伴随着一声连神明都会注意到的咆哮，你在她体内爆发了。你的肉棒");
         if(get_player().cockTotal() > 1)
         {
            outputText("抽搐着，");
         }
         else
         {
            outputText("抽搐着，");
         }
         outputText("将你堕落的种子注入她的子宫");
         if(_loc2_ >= 0)
         {
            outputText("和她的屁股里。");
         }
         else
         {
            outputText("，并流到了下面的床罩上。");
         }
         outputText("当她跳动的小穴努力吸吮着你");
         if(get_player().balls > 0)
         {
            outputText("蛋蛋");
         }
         else
         {
            outputText("肉棒");
         }
         outputText("里的精液时，菲拉也以自己的高潮作为回敬，用她黏糊糊的淫液淹没了你的腹股沟。你低头看了看你们结合的下半身，发现大量的菲拉的淫液已经积聚在你的膝盖周围，而且似乎每秒钟都在流出更多。很明显，她是个潮吹体质。");
         outputText("[pg]当菲拉把脸重新埋进枕头时，她的哀号声再次变得沉闷。深吸一口气，你清除了脑海中的高潮快感。你设法平静下来，伴随着一声响亮的“啵”声，你从她身上下来。谢天谢地，你们两人之间的任何联系现在都断开了。躺下后，你思考着你感觉到的“警告”，而菲拉则蜷缩在你身边。你思考着如果菲拉继续和你交配会发生什么？她会变成一个只为你肉欲存在的无脑荡妇吗？她会允许你的腐化生根发芽并控制她的生活吗？或者也许你应该好好看看自己，看看你正在变成的样子是否真的是你想要的。");
         if(get_silly())
         {
            outputText("[pg]你记得一句老话：[say: 操怪物的人注定要操怪物。] 不，不对。[say: 是怪物的人注定要操怪物？] 不，也不是那个。好吧。你确信这和什么东西操什么东西有关。这很好地比喻了你在玛瑞斯的时光。");
         }
         outputText("[pg]也许腐化她是最好的路线；看看你变成了什么样！你可以接受的……！咯咯笑着，你对菲拉母亲的想法感到得意；她一直以来对你的看法都是对的。你能对菲拉施加什么样的腐化的想法充满了你的脑海，直到你终于睡着，把你毫无防备的受害者抱在怀里。");
         get_player().orgasm("Dick");
         dynStats(DynStat.Cor(1));
         menu();
         addButton(0,"继续",waifuQuestOver);
      }
      
      public function phyllaCapacity() : Number
      {
         return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,873);
      }
      
      public function phyllaCampMenu() : void
      {
         var _g:Camp;
         menu();
         addButton(0,"外貌",phyllaPearance).hint("更仔细地看看你那昆虫形的爱人。");
         addButton(1,"交谈",phyllaTalkChoices).hint("和菲拉谈论各种话题。");
         if(get_player().get_lust() >= 33)
         {
            addButton(2,"性爱",phyllaSexMenu).hint("与你的昆虫情人分享一些亲密时光。");
         }
         else
         {
            addButtonDisabled(2,"性爱","你还不够兴奋。");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,879) == 0)
         {
            addButton(3,"产卵",phyllaLaysEggsToggle).hint("给菲拉开绿灯，让她开始产卵。");
         }
         else
         {
            addButton(3,"不产卵",phyllaLaysEggsToggle).hint("要求菲拉停止产卵。至少暂时停止。");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,874) > 0)
         {
            addButton(5,"孩子",phyllasKidsChildren).hint("和菲拉谈谈你们的孩子。");
         }
         addRowButton(1,"寻找宝石",phyllaDigsForGems).hint("问问菲拉在挖掘工作中是否发现了任何宝石。反正蚂蚁也用不上它们。");
         addRowButton(1,"寻找石头",phyllaStones).hint("问问菲拉在挖掘工作中是否发现了任何适合建筑工作的石头。");
         _g = get_camp();
         addButton(14,"返回",function():void
         {
            _g.campLoversMenu();
         }).hint("向菲拉道别，然后返回营地。");
      }
      
      public function phyllaBeeeJays() : void
      {
         clearOutput();
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,880,FlagDict_Impl_.arrayReadInt(_loc1_,880) + 1);
         get_images().showImage("ant-camp-give-bj");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,880) == 1)
         {
            outputText("转向菲拉，你忍不住微笑着向她抛去一个诱惑的眼神，确保她全神贯注地看着你，然后瞥了一眼你裤子里的凸起。菲拉带着迷人的好奇心将一只手举到嘴边，咯咯地笑着，回敬了你一个恶魔般的眼神。转向床边，菲拉自以为是地开始脱衣服……很接近了！但这不是你想要的。");
            outputText("[pg]你双臂交叉，大声咳嗽了一声，以便将这只困惑的蚂蚁变形者的注意力重新吸引到你身上。她慢慢地转过身来，显然不确定你打算怎么亲热。");
            outputText("[pg][say: 我以为……我是说……那个眼神……] 她努力地想解释为什么她要在你面前脱衣服。你挑起一根眉毛，带着下流而诱人的笑容，示意她回到你身边。渴望、兴奋，还有一点紧张，菲拉跌跌撞撞地向你走来，尽力为你展现出她最诱人的步伐，尽管她的经验不足显露无疑。当她把一条腿迈到另一条腿前面，臀部和腹部摇摆时，她差点绊倒自己。看起来有点尴尬。尽管如此，当她走完这一小段路时，你还是忍不住兴奋起来。她翠绿色的眼睛凝视着你的眼睛，带着渴望和不耐烦的期待，等待着你的下一个指示。");
            outputText("[pg]你把手臂举到她的身体两侧，把她拉近，开始把手滑上她的肚子。你戏弄地抚摸着她的乳房，双手滑向她的肩膀。当你的手停在她甲壳状的肩膀上时，你对她微笑着想：好戏现在才开始。你按下她的肩膀，向她展示接下来会发生什么。感觉到她的肩膀僵硬了一会儿，停留的时间刚好够她恍然大悟。你继续引导她，直到她跪下。听到她甲壳状的膝盖在石头地板上发出咔嗒声，你的脸上露出了微笑。她惊讶地咯咯笑着，隔着裤子摩擦着你包裹的轮廓。");
            outputText("[pg][say: 你-你想让我……我是说……我从来没有……] 她在日益增长的性冲动和努力保持皇家风范之间羞涩地摇摆不定。她的眼睛死死盯着你越来越大的包裹，摩擦着你裤子里的凸起，陷入了如何做这件事的沉思。她慢慢闭上眼睛，深吸了一口气，仿佛在为你给她安排的任务做准备。她慢慢睁开眼睛，跪着挪到你凸起向下突出的那一侧。她一边娇喘着，一边试图给你一个她脸部的好角度；你从她的眉毛后面捕捉到了她充满欲望和调情的目光。");
            outputText("[pg][say: 我-我想我可以试一试……我是说……] 她结结巴巴地说，决定放弃接下来的话，直接进入正题。");
         }
         else
         {
            outputText("走近菲拉，你双臂交叉，靠在她卧室的墙上，同时裤子里撑起了一个明显的帐篷。菲拉低头盯着你的凸起，立刻明白了你的意图。");
            outputText("[pg][saystart]你-你是打算好好求我，还是让你的肉棒");
            if(get_player().cockTotal() > 1)
            {
               outputText("es");
            }
            outputText("来做所有的说服工作？[sayend] 她戏弄道。你耸了耸肩，告诉她只要她觉得行，你就觉得行。");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,879) == 0)
         {
            outputText("[pg]菲拉忍不住咧嘴笑了，她向你走来，在靠近时目光锁定了你的胯部。");
         }
         else
         {
            outputText("[pg]菲拉在试图移动她因产卵而变大的腹部时，看起来有点卡住了。[say: 对-对不起，我不能……] 她说着，看起来快要哭了。你心领神会地走到她身边，爬上床，让你的包裹和她的嘴在同一水平线上。她的眼睛立刻锁定了你……");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,880) == 1)
         {
            outputText("[pg][say: 哦！大餐送上门了。你-你真……好。]");
         }
         else
         {
            outputText("[pg][say: 床上早餐？你、你太客气了。]她调皮地娇嗔道。");
         }
         var _loc2_:int = get_player().smallestCockIndex();
         if(get_player().cockArea(_loc2_) < 60)
         {
            outputText("[pg]甚至不需要你开口，菲拉就直接凑了上来，开始把你的[cocks]从");
            if(get_player().cockTotal() == 1)
            {
               outputText("它那");
            }
            else
            {
               outputText("它们那");
            }
            outputText("压抑的束缚中解放出来。你能感觉到她解开了你衣服的绑带，然后注视着内裤布料后那明显变大的凸起。[say: 你这东西到底包了多少层啊？]菲拉开玩笑地打趣道，在她和你调情时，你能听出她本性中的羞涩与紧张。");
            outputText("[pg]菲拉将两只手的手指都插进你内衣的松紧带里，向下一拉，释放出你的[cocks]，");
            if(get_player().cockTotal() > 1)
            {
               outputText("全都");
            }
            outputText("上下摆动");
            if(get_player().cocks[_loc2_].cockLength < 5)
            {
               outputText("“高大”而骄傲，坚硬如铁，蓄势待发。");
            }
            else
            {
               outputText("高大而骄傲，坚硬如铁，蓄势待发。");
            }
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,880) == 1)
         {
            outputText("[pg]菲拉凑上前来，想要把你的肉棒");
            if(get_player().cockTotal() > 1)
            {
               outputText("");
            }
            outputText("从裤子里扯出来，但显然她并没有意识到");
            if(get_player().cockTotal() == 1)
            {
               outputText("这根");
            }
            else
            {
               outputText("这些");
            }
            outputText("攻城锤");
            if(get_player().cockTotal() > 1)
            {
               outputText("");
            }
            outputText("能有多大。你对她的无知轻笑出声，告诉菲拉她最好退后一点。菲拉翻了个白眼抬头看你，给了你一个不爽的眼神。");
            outputText("[pg][say: 它、它不可能有那么大，[name]……]她嗔怪道，让你兴致勃勃地挑起眉毛。你知道她还没准备好迎接你即将向她释放的挑战。");
            outputText("[pg]你动手把自己从衣服里解放出来。一旦你完全赤裸，你看着菲拉惊恐地睁大了眼睛。你微笑着，开始套弄你的[cocks]，让");
            if(get_player().cockTotal() == 1)
            {
               outputText("它");
            }
            else
            {
               outputText("它们");
            }
            outputText("完全勃起，瞬间达到了你[say:准备就绪]的最高状态。");
            outputText("[pg]菲拉目瞪口呆，敬畏地盯着你的[cocks]究竟能变得多大；你能看到她脸上完全被吓到的表情，但这又能怪她呢？你见过连舰炮在你的男根面前都相形见绌。");
            if(get_player().cockTotal() > 1)
            {
               outputText("[pg]她正盯着一排巨大而充满威胁的肉矛。");
            }
            outputText("[pg][say:我不知道我能不能……哇……]她结结巴巴地说。你大笑出声，低头对她咧嘴一笑，告诉她，在这种情况下，她的一知半解反而是件好事。你抽动[cocks]的肌肉，让它在她面前晃动了一下，让她知道你已经接受了挑战；现在是时候让她[say:履行]她那部分的交易了：也就是鸡巴那部分。");
         }
         else
         {
            outputText("[pg][saystart]好吧，你得小心点，这样我们就不会重演");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,880) == 2)
            {
               outputText("上次");
            }
            else
            {
               outputText("我们第一次");
            }
            outputText("的情况了。我会帮忙释放");
            if(get_player().cockTotal() == 1)
            {
               outputText("那个怪物");
            }
            else
            {
               outputText("那些怪物");
            }
            outputText("，但请、请小心我的贵重物品。[sayend]菲拉紧张地要求道。");
            outputText("[pg]你告诉她，只要她帮忙，就不应该有任何[say:意外。]在你们的同步努力下，你那庞大的[cocks]");
            if(get_player().cockTotal() == 1)
            {
               outputText("被");
            }
            else
            {
               outputText("被");
            }
            outputText("再次释放出来，蓄势待发，渴望与菲拉“重新认识”。菲拉心领神会，靠近并用舌头抵住你肉棒的");
            if(get_player().cocks[_loc2_].cockLength < 16)
            {
               outputText("根部");
            }
            else
            {
               outputText("中段");
            }
            outputText("。你听到她发出一阵夹杂着咯咯笑和轻哼的声音，同时她将舌头滑向你" + get_player().cockDescript(_loc2_) + "的龟头。菲拉在到达顶端时挑逗着你的肉棒，并吸吮着你的尿道口。你感觉到她尽可能多地吸出你的前列腺液，像渴极了一样舔舐着。她持续了一会儿，直到很明显她要么不太确定接下来该做什么，要么她从未听说过如何正确地给人吹箫。");
            outputText("[pg]你轻笑一声，将你的" + get_player().cockDescript(_loc2_) + "从她嘴里拔出来，让她抬头看着你。显然，她为你发现她的技术生疏而感到尴尬，她开始微微颤抖。[say:对、对不起！我是说，我从来没做过这个！这种行为在我们的人民中并不常见。这种事情不适合女王去……被教导，或者学习。]她道着歉，用她的肢体语言和神态乞求你的原谅。");
         }
         menu();
         if(get_player().cor < 75)
         {
            addButton(0,"继续",purePhyllaBJOver);
         }
         else
         {
            addButton(0,"继续",corruptPhyllaEndings);
         }
      }
      
      public function phyllaBeatAMino(param1:Boolean) : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_antguards());
         outputText("当你离开竞技场时，在人群的欢呼和咆哮声中，你遇到了菲拉公主，守卫比上次少了一些。她看到你走过来，脸上容光焕发，然后跑到你身边，开始对你嘘寒问暖。你微笑着任由她摆布。她完成后，深深地看着你的眼睛。");
         outputText("[pg][say: 我……我……我在想……我是说……]她抬起头看着你，就在你以为她要吻你的时候，其中一个守卫大声咕哝了一声，打断了这一刻。然后他示意她跟着他走进隧道。");
         outputText("[pg]你听到身后有人清了清嗓子，转过身看到你的向导，他那把生锈的刀还在他身边。他只是把你带到竞技场的出口，然后转身走开了。显然他很信任你，让你自己出去？你沿着灯光照亮的隧道回到了地面。");
         get_player().changeFatigue(10);
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,472,FlagDict_Impl_.arrayReadInt(_loc2_,472) + 1);
         get_combat().cleanupAfterCombat();
      }
      
      public function orgyWithDatColonyCorruptDudes() : void
      {
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,884,FlagDict_Impl_.arrayReadInt(_loc1_,884) + 1);
         clearOutput();
         get_images().showImage("ant-camp-mle-orgy");
         outputText("你让菲拉把她最强壮、最有活力的\'孩子们\'叫来接受\'检阅\'。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,884) == 1)
         {
            outputText("[pg]她一开始看起来很困惑，并试图问为什么。[say: 我不认为……他们都能挤进这个房间。我们有很多战士……]");
            outputText("[pg]环顾四周，虽然她的房间大约和你在地表的营地一样大，但她可能是对的。叹了口气，你只是告诉菲拉尽力而为。她闭上眼睛，然后向后仰起头。经过一两分钟的这种“冥想”后，她猛地睁开眼睛。[say: 他们应该很快就到了。]她的声音非常欢快。你想知道当你告诉她你到底准备了什么时，它会多快改变。如果你甚至直接告诉她——欺骗她可能是得到你想要的东西的更好方法。");
         }
         else
         {
            outputText("[pg]她温顺地点了点头，知道“检查”意味着什么。");
         }
         outputText("[pg]过了一会儿，你的五个\'孩子\'现身了。菲拉显然听取了你的建议，从她族群中精心挑选了最优秀的个体，带到你面前供你\'检阅\'。");
         outputText("[pg]当你像军官一样走到他们面前时，他们沿着墙排成一排。他们轮廓分明的身体和巨大的骨架看起来就像大师雕刻的雕像。你停在他们中最大的一个面前，把手放在他的胸膛上，当你的手滑过他的胸肌时抚摸着他的皮肤。当你碰到他小小的乳头时，他全身都绷紧了，但他没有采取任何行动来阻止你。");
         outputText("[pg]你退后一步，上下打量着这排蚂蚁；他们甚至没有全裸。这可不行。你带着邪恶的笑容，告诉菲拉让他们脱掉遮羞布。你的几个儿子互相看了一眼，不安地动了动。而菲拉则显得有些害怕，对你的要求犹豫不决。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,884) == 1)
         {
            outputText("[pg][say: 为什么……你想……看……？] 菲拉似乎很困惑。你告诉她，你需要看到一切才能做出正确的评估。除非菲拉认为她这个女王当得很差，需要向你隐瞒事实。");
         }
         else
         {
            outputText("[pg]虽然你能看出菲拉并不情愿，但她还是屈服了。你随口说了一句，也许她的孩子们自你上次检查以来“缩水”了。");
         }
         outputText("[pg][say: 不！我做得很好！我保证！]为了证明你错了，她进入了恍惚状态。你面前的战士们开始脱衣服。当他们五个人全部脱光后，菲拉猛地回过神来。");
         outputText("[pg]为她的孩子们感到尴尬，菲拉把头转了过去，而你的目光则立刻锁定了他们的生殖器。[say: 嗯……我是说，他们……都……天赋异禀……就像你-你要求的那样，]菲拉说道，与其说是对你说的，不如说是对着地板说的。他们确实是，你心里暗想，一边用目光尽情享用着他们的肉棒！他们全都勃起了，有几个甚至还有几滴预先分泌的淫液顺着他们略微尖锐、看起来像人类的阴茎流下。你估计他们都有大约10到15英寸长、坚硬的男根。两颗睾丸在他们长长的肉棒下摇晃。他们的蛋蛋大小不一，但与他们的肉棒相比，比例大多像人类。你走到其中一个面前，手顺着他的阴茎滑下，想看看他会有什么反应。他紧咬着牙关，尽力无视你的手，但还是发出了一声低沉压抑的呻吟。");
         outputText("[pg]当你用指尖抚摸他长长的肉棒时，你转头看向菲拉。她仍然转过头去，不想相信你正在做的事情。这只蚂蚁的淫液正慢慢弄湿你的手。你从轻轻抚摸他的肉棒变成了慢慢地给他打飞机；你可以感觉到他紧实的臀部收紧了，他的阴茎在你的抚摸下跳动着。");
         outputText("[pg]你看着队伍中另外四只蚂蚁尴尬地挪动着身体，看着你给他们的兄弟打飞机，渴望着自己也能得到关注。");
         outputText("[pg]当菲拉瞥见时，你戏弄她，问她是否感觉不到她孩子们的欲望。当她看到你在做什么时，她震惊地倒吸了一口凉气，用她的四只手捂住了嘴和眼睛。");
         outputText("[pg]你看着另外四个人，指示他们开始，但要确保他们知道她的阴户只属于你一个人。听从你的命令，另外四只兵蚁扑向菲拉，把她的手从脸上拉开。你听到菲拉压抑的抗议声，但当其中一只兵蚁深深地吻了她，并引导她的一只手去摸他的肉棒时，抗议声很快就停止了。另一只兵蚁开始吸吮她的乳房，并移动她的另一只手去按摩他自己的阴茎。第三只兵蚁抓住菲拉较小的两只手，强迫她托住他的蛋蛋并抚摸他的肉棒，同时他站在他的兄弟们中间。第四个男人似乎被冷落了，但他随后想到了一个主意，走到了菲拉的身后。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,879) > 0)
         {
            outputText("[pg]看到自己无法举起她巨大的腹部，他躺了下来，几乎完全消失在腹部下面。当他用四只手顺着她腹部的下侧抚摸时，菲拉大声呻吟着，一阵收缩席卷了她的身体。她腹部末端的产卵裂口变宽了，一颗卵从她体内被推了出来，伴随着透明的产卵凝胶溅到了她孩子的胸前。蚁人利用他下面两只手臂轻轻地将卵放在一边，同时他那双大手分开了她的产道。他顺着她长长的腹部舔了下去，开始舔舐继续从她产卵裂口渗出的液体。他疯狂地喝着、吸吮着，开始用他较小的手给自己打飞机。");
         }
         else
         {
            outputText("[pg]那只大蚂蚁抬起菲拉的腹部，将其弯曲，使腹部尖端停在他的脸前。被这突如其来的刺激吓了一跳，菲拉“咿！”了一声。她身后的男人嗅了嗅她腹部的尖端，试探性地舔了舔，仿佛在试水。菲拉在亲吻她的蚂蚁变形者的嘴里呻吟着。看到自己的努力得到了回报，她腹部的那只蚂蚁将头埋进她腹部的尖端，舔舐并用手指抠弄着她的产卵孔。");
         }
         outputText("[pg]你可以看到菲拉的欲望在上升，她开始忘乎所以，开始享受发生在她身体上的触摸和气味。她开心地开始更加卖力地给她的孩子们打飞机。她甚至会交换谁在亲吻她，谁在吸吮她，谁在吸吮她的产卵口，以及谁在享受手淫——确保她的四个孩子都能平等地分享她的身体。");
         outputText("[pg]你感觉到你正在给他打飞机的蚂蚁呻吟着，开始把他的肉棒挺进你的手里。你几乎忘了你在做什么——看着菲拉几乎被无休止的肉棒淹没，让你的头脑变得模糊。你松开了握住他肉棒的手，留下他给你一个非常困惑和渴望的眼神。");
         outputText("[pg]你拍了拍他的屁股，给了他一些鼓励。");
         outputText("[pg]他几乎是冲向他的母亲，欲望的渴求在他的血管里燃烧。看到他向他们冲来，他的兄弟们把菲拉拉倒在床上。很快她就摆好了姿势；她的肩膀靠在床沿上，头向后仰看着她的孩子们。一旦他到了他母亲身边，那只冲锋的蚁人就把他的肉棒甩在她的乳房之间，让他的蛋蛋悬在她的嘴上方。菲拉用她较小的那双手把她的乳房挤在一起，夹住他长长的阴茎。他开始在她的");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,879) > 0)
         {
            outputText("巨大的、分泌乳汁的");
         }
         else
         {
            outputText("小");
         }
         outputText("球体之间抽插。");
         outputText("[pg]随着他的每一次抽插，他的蛋蛋都会拍打在她的脸上，菲拉主动开始吸吮他的睾丸，用她流出的口水覆盖它们。");
         outputText("[pg]被夺走了吻，那只正在亲吻菲拉的蚂蚁抓住了离他最近的兄弟，把舌头伸进了他的嘴里。那两只正在被他们母亲较小的手打飞机的蚂蚁现在发现自己被冷落了，因为她正在用它们来取悦他们的兄弟，而他正在她的乳房之间抽插。由于他们自己也有需求，两人中较大的那个躺了下来，这样他的兄弟就可以反向躺在他身上；他们立刻开始以六九式互相口交。");
         outputText("[pg]就在这时，你意识到你还穿着衣服！你真是太不体贴了。你迅速脱下你的[armor]。发现你自己的肉棒");
         if(get_player().cockTotal() > 1)
         {
            outputText("");
         }
         outputText("坚硬无比，渴望融入这场狂欢，你只需要找到一个切入点。走到菲拉身边，你拍了拍正在享受乳交的蚂蚁的肩膀。他毫不犹豫地为你让开，让他的蛋蛋伴随着清晰的“啵”声从菲拉的嘴里滑落。你低头对着菲拉咧嘴一笑，看到她现在已经完全迷失了，只是在享受自己。就在这一刻，你感觉到身后有阴影逼近。还没等你反应过来，几只手就伸了下来，开始充满爱意地抚摸[oneCock]。");
         if(get_player().cockTotal() > 1 && get_player().cockTotal() <= 3)
         {
            outputText("[pg]你很快发现你的每一根肉棒都得到了照顾。你几乎分不清是谁在摸或吸什么。低头看去，你看到菲拉正在吸吮你最长肉棒的龟头，同时有人的手顺着阴茎滑下。你的另一根阴茎");
            if(get_player().cockTotal() == 2)
            {
               outputText("正在");
            }
            else
            {
               outputText("正在");
            }
            outputText("被你的两个孩子吸吮，而他们自己也正在被吸吮。");
         }
         if(get_player().cockTotal() >= 4 && get_player().cockTotal() <= 6)
         {
            outputText("[pg]即使你有这么多肉棒，这也不会是个问题。你只是站在菲拉上方，低头看着手、嘴和菲拉的乳房轮流尽力取悦你的每一根肉棒。");
         }
         if(get_silly())
         {
            outputText("[pg]低头看着你的孩子们，可以在他们的眼中看到恐惧。你决定发表一段发自肺腑的演讲。");
            outputText("[pg][say: 儿子们，后代们，我的孩子们！我在你们的眼中看到了同样会占据我内心的恐惧！也许有一天，这些肉棒的精液会枯竭，当它们变得疲软，再也无法勃起……但不是今天！也许会有一个悲伤和难过的时刻，这些肉棒停止射精……但不是今天！今天你们要战斗！为了你们在这个美好的殖民地所珍视的一切，我命令你们吸！吸干所有的肉棒！]");
         }
         outputText("[pg]堆叠在一起的四肢和肉棒太多了，你开始很难分辨谁是谁。不过你也不在乎；你有你自己的需求，而菲拉已经在照顾了。");
         outputText("[pg]她的嘴张着，仿佛在乞求被[oneCock]填满。你来这里不是为了享受口交的——你想要她的阴户。你想要你堕落的阴茎进入她体内。你想要让她不得不乞求释放。");
         outputText("[pg]她的四只手都欢迎你的肉棒，她的手指在你的长阴茎上上下滑动，引导它来到她流着淫液的阴户边缘。低头看去，你看到她长长的阴蒂从她的内褶中探出。菲拉像发情的母狗一样大口喘着气；你甚至能看到她嘴里冒出的热气。你抓住她的头发，把你的脸凑向她的脸。当你的舌头穿透她的嘴时，你感觉到了你们思想交融时那种熟悉的刺痛感。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,884) == 1)
         {
            outputText("[pg]你感觉到了这种联系，但它似乎很紧张，就像涂在太多吐司上的黄油。你很快就意识到了原因：你感觉到房间里的其他五个人和菲拉一起出现在你的脑海中。他们正在积聚力量准备释放，但菲拉一直阻止他们达到高潮。好吧，至少你把她训练得很好。");
         }
         else
         {
            outputText("[pg]你知道这一刻会到来，并且你在心理上已经做好了准备。感觉到你的思想与房间里的每个人联系在一起，一开始仍然让人不知所措，但随着你的思想找到平衡，你很快就克服了它。");
         }
         var _loc2_:int = get_player().cockThatFits(phyllaCapacity());
         if(_loc2_ < 0)
         {
            _loc2_ = get_player().smallestCockIndex();
         }
         outputText("[pg]当你感觉到你的思想与房间里的其他人完全同步时，就像沉醉在性快感中一样。你几乎在其中迷失了片刻，但集中精神，你猛地睁开眼睛。你看到面前的菲拉看起来像个被下药的荡妇；她用四只手抚摸着你那位于她泛滥阴户入口处的" + get_player().cockDescript(_loc2_) + "，而她的孩子们则在玩弄她的乳头并互相口交。你粗暴地抓住她的手臂把她按倒，同时把你的肉棒猛地插进她体内。");
         outputText("[pg]你感觉到房间里的每个人的思想都因痛苦而退缩，然后当你的肉棒猛烈撞击菲拉阴户的最深处时，又被快感所淹没。");
         outputText("[pg]当她在你身下挣扎着寻找一个舒服的姿势时，她阴道的跳动顺着你肉棒的长度上下起伏。在孩子们的帮助下，她终于找到了一个好姿势，而你在她身上越插越用力。菲拉盲目地伸出手，她的每只手都在寻找她的后代。你最大的孩子在菲拉的脸部上方就位——她欢迎他长长的阴茎进入她的嘴里。当其他人意识到菲拉在寻找他们的肉棒时，他们从彼此身上解开，渴望地爬向他们的母亲。菲拉开始用她的四只手在他们的肉棒上抽动，同时有两只手抓住了她的乳房。");
         outputText("[pg]你的一个子嗣俯下身，开始狂热地舔舐菲拉阴蒂的根部，与此同时，你的肉棒在她的体内进进出出。他温暖的唾液加上菲拉天然的润滑液温暖了你的肉棒，让更多的快感传遍你的" + get_player().cockDescript(_loc2_) + "。");
         if(get_player().cockTotal() > 2)
         {
            outputText("[pg]在你猛烈抽插她的时候，只有一根肉棒得到满足是不够的。你通过精神链接命令你的孩子们，让你的其他阴茎也得到释放。他们迅速照做，用他们的手和嘴确保没有一根肉棒被冷落。");
         }
         else if(get_player().cockTotal() == 2)
         {
            outputText("[pg]在你猛烈抽插她的时候，只有一根肉棒得到满足是不够的。你通过精神链接命令你的孩子们，让你的其他阴茎也得到释放。他们迅速照做，用他们的手和嘴确保没有一根肉棒被冷落。");
         }
         outputText("[pg]一切都开始迅速模糊在一起。你的乳头被捏住了，但你分不清是谁干的。你的大脑努力去理解哪条肢体在哪里，谁的肉棒是谁的。你只想让这种感觉永远持续下去，迷失在快感的海洋中。当与你相连的六个思想接近他们的高潮时，你从过度刺激的精神状态中清醒过来。");
         outputText("[pg]在这一瞬间，你感觉到了你们同步的释放。你感觉到另外五名男性的蛋蛋被清空");
         if(get_player().balls > 0)
         {
            outputText("连同你自己的");
         }
         outputText("当他们把精液涂满菲拉的里里外外。她小穴的内壁跳动着，将你的精液吸向她的子宫。她吞下了射进她嘴里的孩子的精液，让那种温暖的感觉顺着她的喉咙蔓延到她的肚子里。另外四名男性把精液射在他们母亲的肚子和乳房上，用精液覆盖了她棕褐色的皮肤。你看着菲拉用她的四只手把精液涂满全身，仿佛想要在里面沐浴。");
         outputText("[pg][say: 我……需要……更多……我们……需要……]菲拉坐了起来，但她没有看你。相反，她舔了舔嘴唇，凝视着她房间的入口。你转过身，顺着她的目光看去。站在门口的是另外五六个战士，完全勃起并准备就绪。你挑了挑眉，带着灿烂的笑容看向菲拉。");
         outputText("[pg]你在接下来的几个小时里度过了一场盛大的狂欢，让你的肉棒");
         if(get_player().cockTotal() > 1)
         {
            outputText("");
         }
         outputText("被吸吮、抚摸、插入，最后高潮了无数次，以至于你都记不清了。几个小时过去了，你最终在菲拉的王座上昏睡过去，看着面前扭动的人群。");
         outputText("[pg]一段时间后你醒来，身体因疲惫而酸痛。瞥了一眼菲拉，想看看她在经历了这么多的消耗后情况如何，你看到她瘫倒在垫子上，周围是心满意足的战士，她的皮肤和甲壳上覆盖着厚厚的一层精液。你心里琢磨着是否应该邀请她去溪边洗个澡。");
         outputText("[pg][say: 没关系……他们会……把我舔……干净的……]你在脑海中听到了菲拉虚弱的声音，尽管她看起来仍然没有意识。");
         outputText("[pg]你也许想留下来看一看，但你在这里待得太久了。你收拾好东西，在返回营地的路上，尽量不踩到地板上那二十多只昏倒的蚂蚁。");
         get_player().orgasm("Dick");
         dynStats(DynStat.Sens(-2));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function nopeNotOnMouthOrWhateverFuckThisNoise() : void
      {
         clearOutput();
         outputText("你拒绝了她的提议，不想知道那种感觉");
         if(!get_player().canAutoFellate())
         {
            outputText("或任何类似的感觉会是什么样。");
         }
         else
         {
            outputText("在菲拉的思想与你相连时是什么感觉。");
         }
         outputText("[pg]她调皮地抱怨着，但尊重了你的意愿。回到正题，她没有退缩。表现得好像这是她的日常工作一样，当她想要一点前列腺液时，她再次刺激你阴茎上的那个小区域。你能感觉到她想从你身上哄出越来越多的前列腺液，直到你在她嘴里爆发，她想让你把阴茎塞进她的喉咙，用你能挤出的所有精液淹没她的食道。");
         outputText("[pg]你睁开眼睛，发现菲拉正抬头看着你，她从未移开渴望的目光，她那乞求的眼神，恳求你高潮，屈服于她对你种子的渴望。");
         pureBJEnding(false);
      }
      
      public function malePhyllaContinuation(param1:int) : void
      {
         clearOutput();
         get_images().showImage("ant-desert-first-male-vagsex");
         outputText("菲拉低头盯着你的[cocks]，开始紧张地搓着手。[say: 这是我第一次……我是说，我希望这不会让你感觉很糟……] 她说着，声音渐渐变小；对自己的性能力感到不自信。");
         if(get_player().isPureEnough(75))
         {
            outputText("[pg]你安慰她，告诉她不需要为第一次这么担心。");
         }
         else
         {
            outputText("[pg]你心想，她的小穴最好紧致又舒服。你可不是为了一个“皇家”次品而冒生命危险的。");
         }
         outputText("[pg]你拉扯着");
         if(get_player().cor < 75)
         {
            outputText("开玩笑地");
         }
         else
         {
            outputText("用力地");
         }
         outputText("她的皇家礼服，邪恶地评论着这衣服必须脱掉。你把手勾进她衣服的褶皱里，开始慢慢向上拉，让丝绸般的皇家礼服轻松地从她身上滑落。你以前从来没有给有四只手臂的生物脱过衣服，但你还是做到了。当你脱下她的胸罩时，你的手顺着她乳房的边缘滑过，惹得公主发出一声轻柔的呻吟；她没有阻止你，而是任由你继续努力，将她的性欲推向沸点。你灵巧的双手顺着她紧致的小腹向下摸索，但在你触及她双腿之间之前，她阻止了你。");
         outputText("[pg][say: 我想……我是说……就这样……] 菲拉把衣服扔到一边，引导你绕到她身后。[say: 这，就是……我是说……我的同类是如何交配的。]");
         outputText("[pg]一旦你到了她身后，菲拉就弯下腰，试图向你展示自己。她的腹部让这姿势有点尴尬，但你还是找到了一个舒服的位置。你俯身在菲拉上方，把嘴凑到她的脖子上，让你沉重的呼吸温暖她柔软的肌肤。菲拉下意识地把头偏向一边，给了你一个更好的角度，让你精华的热量席卷她。你开始轻咬她的脖子，双手滑过她的骨盆和胸部，滑近她B罩杯的乳房，然后又滑开。你的探索努力在轻咬她的耳垂时找到了一个敏感点，惹得菲拉弓起背，轻柔地哼着表示赞许。在用嘴挑逗她的同时，你的一只手向下摸索到她的阴蒂");
         if(get_player().isGoo())
         {
            outputText("，在她的身体上留下你黏滑的欲望痕迹，让你分离出的部分物质点燃她的欲火");
         }
         outputText("。");
         outputText("[pg]当你触及她阴道的顶端时，你感觉到她紧绷起来，她内心的不安全感如水般流入你的脑海。你在她耳边轻声说了些甜言蜜语来缓解她的不安，这些话语让她浑身一颤，在幸福中颤抖，因为你的激情点燃了她对你肉体关注的渴望。又一声微弱而断断续续的呻吟从她嘴里逸出，你能听到她对你的低语。");
         outputText("[pg][say: 挑逗够了，] 她在呻吟间勉强说道。");
         outputText("[pg][say: 我……觉得……不，我准备好了……求你……]");
         if(get_player().cor >= 75)
         {
            outputText("[pg]好吧，你想要她像暴雨中干旱的庄稼一样湿润而渴望；现在是时候“收获”你的努力了。");
         }
         outputText("[pg]菲拉躺在她用各种垫子做成的床上，热切地回头看着你；她生涩的性举止和兴奋感像黑暗中的光一样穿透她。她似乎对此有所察觉，但不如以前那么强烈；她的身心完全被欲望吞噬，她只渴望你的声音、你的触摸，以及你不可避免地插入她颤抖的身体。");
         outputText("[pg]微微颤抖着，她滴水的");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,879) > 0)
         {
            outputText("乳头和");
         }
         outputText("湿润的阴道暴露了她的胆怯。你顺着床铺向上移动，用你的[skindesc]摩擦她娇嫩的肌肤。最后，你停在了一个完美的插入位置，菲拉转过头，用渴望的眼神和热切的嘴唇看着你。当你的舌头滑入她的嘴里时，你感觉到她对这种陌生的感觉抽搐了一下。菲拉闭上眼睛，当你的舌头自发地找到她的舌头时，她立刻像黄油一样融化了；这对你来说显然是个好转。菲拉终于放松了双腿并把它们分开；来自她生殖器的陌生湿热感温暖了你的下体。");
         outputText("[pg]仅仅是把你的" + get_player().cockDescript(param1) + "在湿润的小穴入口处拖动，就让她在你身下呻吟和扭动。用你的龟头分开她粉嫩的小阴唇，你终于找到了插入的甜蜜点。伴随着");
         if(get_player().cor < 75)
         {
            outputText("适度的力量，");
         }
         else
         {
            outputText("一种毫不留情、粗暴的力量，");
         }
         outputText("你推开了菲拉紧致的褶皱。你听到菲拉猛吸了一口气，因为她被撑开以适应你的宽度。在似乎很长的一段时间后，你终于成功地把你的" + get_player().cockDescript(param1) + "的头部缓缓插入她体内。这个动作变得响亮而痛苦，菲拉在明显的不适中呻吟和扭动。你感觉到她的阴道壁紧紧地挤压着你的阴茎，她相当大的力量几乎切断了血液流动。片刻之后，菲拉意识到她施加了多大的压力，她的身体放松下来，意识到可能会伤到她的伴侣。她重重地叹了口气，把臀部往下移，以接纳更多的你。当你滑得更深时，她的眼睛闪过一丝痛苦，她咬住嘴唇，很明显，菲拉体内有什么东西被突破了。");
         outputText("[pg]<b>你夺走了菲拉的贞操！</b>");
         if(get_player().cor < 75)
         {
            outputText("[pg]你保持不动，低头看着菲拉，询问她是否还好。");
         }
         else
         {
            outputText("[pg]你不为所动，继续挺进，深入她的深处，几乎没有给她任何时间来准备迎接即将到来的猛烈抽插。失去处女之身和纯真目前并不在你的关心范围之内。");
         }
         outputText("[pg][say: 我没事——呃！不，真-真的我很好！] 她半眯着眼睛结结巴巴地说。你能看出她试图忽略明显的疼痛，渴望品味这个最终转瞬即逝的“第一次”的每一刻。你继续抚摸她所有最敏感的部位，试图用更柔和的快感来取代你造成的疼痛。");
         menu();
         if(get_player().cor < 75)
         {
            addButton(0,"继续",phyllaFirstTimePureBabiesFuckEnding);
         }
         else
         {
            addButton(0,"继续",phyllaCorruptMascEnding);
         }
      }
      
      public function lickThatAntButt() : void
      {
         var _loc1_:* = null as IMap;
         clearOutput();
         phyllaSprite();
         get_images().showImage("ant-camp-lay-egg-licked");
         outputText("你微微歪了歪头。你以为她说过，在你们第一次做爱之后的任何时候，她都可以开始产卵。");
         outputText("[pg][say: 如果你帮忙的话……启动它……会更快……求你了……]");
         outputText("[pg]听到菲拉这样乞求在某种程度上让你兴奋起来，但没有时间了！在她向你解释你需要做什么的几秒钟里，那一小股液体现在似乎在脉动中喷涌而出，就像你想象中孕妇的宫缩一样。");
         outputText("[pg][say: 现在！求你了！我等不及了！] 菲拉乞求的呻吟迫使你采取行动。");
         outputText("[pg]你用双手抓住她腹部的两侧，把脸埋进她的产道。几乎在你的舌头进入她那如河流般的裂口的瞬间，她就颤抖起来，一阵强烈的性高潮席卷了她。她双腿间的阴道将淫液喷洒在地板上，有些甚至喷得足够远，溅到了你的脚上。");
         outputText("[pg]面对这种情况，你甚至没有尝试停止或减慢速度。你用舌头蹂躏着她的产道，就好像它欠你钱一样。她又高潮了，几分钟后又高潮了一次——此时你唯一能判断的方法就是当她温暖的汁液喷射出来并溅到你的脚上时。此时，她只是不断地呻吟和颤抖。如果你不是一直抱着她的腹部，她早就在几次高潮前倒下了。");
         outputText("[pg]这样持续了大约一个小时后，你把脸从她的湿润处移开，松开了紧抓着她腹部的手。");
         outputText("[pg]当她瘫倒在你面前时，你震惊地睁大了眼睛。你刚才忙着取悦她，甚至没有注意到，她的腹部已经变大了近四倍！现在它足有六英尺长，而且似乎你每次眨眼它都会变得更大一点。你走向菲拉的身体——现在几乎被她肿胀的腹部挡住了——你听到了一声清晰的飞溅声。低头一看，你惊讶地发现地板上几乎完全覆盖着一层厚厚的女孩精液和分娩润滑液的混合物。老实说，根本无法分辨哪种液体更多。混合液体的气味闻起来就像小雨过后的泥土平原。当你走向菲拉时，你看到她的乳房也变大了，现在很容易就有DD罩杯了。她用四只手臂精疲力竭地抓住你，眼睛仍然微微向上翻着。你忘了即使在她现在的状态下，她也惊人地强壮，伴随着轻微的飞溅声，她把你拉倒在她旁边。她的四只手臂充满爱意地缠绕着你。");
         outputText("[pg]大约一两分钟后，她突然睁大眼睛，身体收缩。伴随着突然的脉动，你可以看到一阵收缩顺着菲拉的腹部向下蔓延。一个大约有你前臂那么长的小圆柱形卵从你过去一个小时里一直舔舐的产道中弹了出来。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,888) == 0)
         {
            outputText("[pg]这东西很奇怪，和你以前见过的任何卵都不一样。它没有外壳，是透明的。里面的液体似乎在闪闪发光，就像有成千上万的微小金箔在里面一样。在正中央有一个黑色的球体，当你看着它时，它展开成了一只幼虫。菲拉迅速抓起它，把它抱在你们俩中间。");
            outputText("[pg][say: 这是我全新生活的开始……我是说，我们的。我会永远记住这一刻的，[name]！]菲拉哭着说，把卵紧紧抱在怀里，为成为一名母亲而感到自豪。[say: 我……我爱你。]");
            outputText("[pg]你正要回敬她的赞美，她的身体又收缩了一下，又有一枚卵从她的腹部弹了出来。");
            outputText("[pg][say: 这么快？]你问她，显然对她的繁殖速度感到惊讶。");
            outputText("[pg]等她恢复过来后，她在阵痛的间隙喘着粗气回答。");
            outputText("[pg][say: 通常不会……这么快。只是……你……做得太好了……]她在较小的阵痛间隙喘息着说。");
         }
         else
         {
            outputText("[pg]你知道该怎么做。你从菲拉身上解开自己，走过去舀起那枚圆柱形的卵。拿到后，你把它带回给她。尽管你一这么做，她就依偎着它。");
         }
         outputText("[pg]仅仅过了一两分钟，一阵剧烈的收缩穿过她的身体，又有一枚卵从她腹部的顶端渗出。你可以看出她在接下来的几个小时，甚至几天里都会非常忙碌；你不太确定，而且很明显，即使你问她，她也没有状态回答。你吻了她一下，然后回到营地，对你刚刚完成的工作感到满意。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,889,12);
         _loc1_ = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,888,FlagDict_Impl_.arrayReadInt(_loc1_,888) + 1);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,874) < 5000)
         {
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,874,FlagDict_Impl_.arrayReadInt(_loc1_,874) + 5);
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function letPhyllaRecover() : void
      {
         clearOutput();
         outputText("鼓起你所有的自制力，你决定菲拉可以休息一下。你离开时对菲拉眨了眨眼，告诉她你很快就会回来把她操得神魂颠倒……一旦她喂饱了你的孩子。她只能鼓起力量微笑，嘟囔着关于母性的话，但你已经走到门口了。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function lesbianFisting() : void
      {
         clearOutput();
         get_images().showImage("ant-camp-female-fisting");
         outputText("你开始脱下盔甲，给了菲拉一个诱惑的微笑；你来这里确实是为了某件事，但你爱人脸上惊讶的表情表明她还没完全明白过来。她的目光在看着你脱衣服和困惑地盯着石地之间来回游移，似乎在羞怯和欲望之间挣扎。你调情地把内衣扔在菲拉目光似乎锁定的地面上。她惊讶地抬起头；你不确定她在期待什么，但显然看到你一丝不挂并不在其中。你向她走去，迈着你所能模仿出的最棒的魅魔摇曳步态。走到菲拉面前后，你在她凸起的石床边缘坐下，慢慢地交叉起双腿。");
         outputText("[pg]你让菲拉看着你。当她照做时，你诱人地松开交叉的双腿，将它们张开，好让菲拉能瞥见你暴露的身体。你甚至决定更进一步，抓住自己的一侧乳房，调皮地抚摸着乳头。");
         outputText("[pg][say:你……想让我……我是说，你知道的……]她红着脸害羞地说。");
         outputText("[pg]你一言不发，伸出手，用勾起的手指招呼她过来。你诱惑地挑起眉毛，向她清楚地表明了你的意图。她迅速从床上爬下来，跪在你的[hips]之间。她上面的一双手将你的双腿分开，放在你的膝盖内侧。她较小的一双手开始轻轻按摩你[legs]内侧，就在你阴唇的两侧，快感传遍你的大腿。没过多久，润滑液的珠子就开始从你迅速湿润的阴唇中流出，当菲拉的舌头开始舔舐你流出的润滑液时，你唇间溢出一丝性奋的呻吟，她只短暂地停顿了一下，像品尝美酒一样在嘴里品尝你的汁液。当她的嘴找到你的阴蒂时，你向前倒去，双手环绕住她的头，鼓励她继续。你的双腿试图缠绕住她的头，但她上臂巨大的力量阻止了它们，让你[say:无可奈何地]向她的攻势敞开。她下面的手停止了按摩，让你一时好奇下面发生了什么。就在你准备问她为什么停下来时，她的嘴色情地挑逗着你的阴蒂，她的一只小手将你完全掰开。");
         if(get_player().hasCock())
         {
            outputText("[pg]不想剥夺你身体痛苦渴望的东西，菲拉抓住[oneCock]开始抽插，同时用她的嘴在你的女性解剖结构上创造奇迹。");
         }
         outputText("[pg]你大声呻吟着，泥土、汗水和性爱的气味充满了你的鼻腔。完全暴露在她面前让你不禁感到有些尴尬，但这种感觉很快就消失了，因为她的一根手指滑过你的阴唇，擦过你[vagina]的开口。在你那总是渴望的小穴的湿润引导下，她坚硬的指尖向前滑入你的身体。你因为这缓慢的插入再次呻吟。受到鼓励，菲拉在你的阴道壁上上下摩擦，起初很悠闲，但随着力度的增加，她开始寻找你的G点。");
         outputText("[pg]听到你更大声、更深沉的呻吟，她的手指在深入你体内时显得非常灵巧。你的双腿再次痉挛，试图夹住菲拉的头，但她坚定地支撑着，拒绝了你下半身渴望与这个如此完美地插入你小穴的爱人亲密接触的请求。你开始剧烈喘息，每次她的手指深入你体内时都会发出轻柔的呻吟。她深情地轻咬着你的快乐按钮，又将一根手指插入你体内。你弓起背，在强烈的快感中大叫，本能地将臀部推向她的脸，迫使它在你的阴户上摩擦。");
         outputText("[pg]她的嘴离开了你的阴蒂，手指也从你体内滑出，让你的脊背感到一阵愉悦的颤栗。你看着双腿之间，菲拉饥渴地抬头看着你，她的嘴上沾满了你的汁液。她用舌头舔过上下嘴唇，然后开始优雅地吸吮她插入你体内的每根手指上的花蜜，确保没有遗漏任何一滴。");
         outputText("[pg]一旦她清理完毕，她就开始亲吻你的身体，一边稳步向上爬，一边发出微弱但可爱的声音。她用四只手抚摸你最敏感的肌肤，细碎的吻从你湿润的阴户一路向上，经过你的肚子，在你的双乳之间，沿着你的脖子一侧，轻咬你的耳垂，最后停留在你的嘴唇上。当她用大手托住你的乳房，用小手捏住你的乳头时，你们的嘴唇紧紧锁在一起。你开始呻吟，但菲拉的舌头进入了你的嘴，打断了你试图表达的狂喜，似乎想让你向她展示你的快乐。");
         outputText("[pg]你们的意识瞬间同步。一阵突如其来的温暖，几乎让人感到不适的热量从菲拉的双腿间传来。随着舌头交缠，你将手伸向菲拉的双腿间，感受着她小穴上方那股欲望的[say: 火焰]。菲拉的意识向你延伸，乞求你的抚摸，请求你取悦她，与她做爱。知道她可能已经湿透了，你伸手去触摸她双腿间那条湿滑的裂缝，并高兴地发现你猜得完全正确。感觉到她那长长硬挺的阴蒂在你的手掌上摩擦，她喘息着，一股意想不到的快感涌遍全身。知道连接已经建立，你停止了亲吻，咧嘴一笑。");
         outputText("[pg]她的整个身体开始在你身上缓慢地抽插，坚挺的乳头摩擦着你的乳头，她前后摇晃着，让她的阴蒂在你的手上摩擦。突然，在她向后旋转的时候，你将两根手指弯曲着环绕住她。她大声呻吟着，上半身瘫倒在你的胸前，不知不觉中迫使你的两根手指进入了她体内。她的臀部开始在你的手指上快速扭动，同时在你的乳房上发出狂喜的叹息。随着每一次抽插，你的手指开始熟练地越来越深地进入她体内。她直挺挺地坐在你身上，她的阴道悬停在你现在湿透的手上方。在你的脑海中感觉到她……她正调皮地向你隐瞒着什么，但你无法发现那是什么，因为你迷失在共享的快感中。菲拉的眼睛与你相遇，用几乎恳求的语气哀求道，[say: 我需要你，这样做，我想要这个……求你了~]");
         outputText("[pg]在你的脑海中，你看到你的手指做出了长矛般的形状，你立刻明白了菲拉想要什么。你邪恶地微笑着，听从了她的愿望，让你的手像长矛的尖端一样，完全知道接下来会发生什么，就在那一刻，菲拉放低了她的臀部。你感受到了她的兴奋，因为四根手指以惊人的速度和力量进入了她体内，将她小穴的内壁撑得大大的，纯粹是运气好碰到了她的G点。这种连接，分享着它所有的复杂性和感觉，让这个害羞的小女人所拥有的狂野满足感淹没了你的身体，你在狂喜的快感中尖叫起来。菲拉的一只大手");
         if(get_player().hasVirginVagina() || get_player().vaginalCapacity() <= 10)
         {
            outputText("试图进入你体内，但只成功地将手指插入了你的小穴。尽管遇到了[say: 挫折，]菲拉");
         }
         outputText("还是同时插进了你的小穴。你感觉到她击中了正确的位置，随着你们的意识在共同的高潮中结合在一起，狂喜的爆炸淹没了你们的身体。她将温暖的淫液喷洒在你身上，将你肚子上涂满了散发着甜味的液体。作为回报，你也在她的手上高潮，释放出你所能释放的淫液，但这远不及菲拉产生的那么多。你们慢慢地将彼此的手从各自的阴道中移开，瘫倒在彼此的怀抱中。");
         outputText("[pg]大约一小时后你醒了过来，身上依然散发着做爱的气味，沾满了彼此的体液。[say:你应该多下来看看的。我是说……我有时会想你……]当她慢慢从你们让彼此陷入的短暂性昏迷中恢复过来时，她的羞涩又回来了。");
         outputText("[pg]你一边穿衣服准备回营地，一边对她眨了眨眼，说你会考虑的，留下她热切地期盼着你下次再来占有她。");
         get_player().orgasm("Vaginal");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function leaveAntColony() : void
      {
         clearOutput();
         outputText("决定先更好地准备自己，你通知瘦弱的比赛经理你稍后会回来。你离开蚁群，回到营地。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function keepHidden() : void
      {
         var _loc1_:int = 0;
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,468,1);
         clearOutput();
         spriteSelect(SpriteDb.get_s_oasis_demons());
         if(get_player().get_lib100() < 41 && get_player().get_lust100() < 50 || !get_player().isCorruptEnough(66) || get_player().get_gender() == 0)
         {
            outputText("在看到一大群恶魔后，你决定最好不要采取行动。你自己也没有条件帮助这个可怜的生物，而且你非常清楚恶魔“制服”猎物后会发生什么，你也不想留下来。你瞥了一眼，意识到小规模冲突已经开始了。你对自己说，现在真正帮助她已经太晚了，而且她浑身都是肌肉。");
            outputText("[pg]向自己保证她会没事的，你趁恶魔分心的时候逃跑，回到营地。留下蚂蚁女孩听天由命。");
            doNext(get_camp().returnToCampUseOneHour);
            return;
         }
         if(get_player().hasCock())
         {
            get_images().showImage("ants-desert-male-firstencounter");
            outputText("你完全知道一旦恶魔“制服”了他们的猎物会发生什么。你下体不断增长的跳动乞求释放，你迅速而安静地脱下你的[armor]，确保恶魔没有注意到你。你还不如看戏，因为反正恶魔完事之前你是不可能不被注意地离开的。");
            outputText("[pg]从你躲藏的地方看着，你开始抚摸你的[cock]。");
            _loc1_ = get_player().biggestCockIndex();
            if(get_player().cocks[_loc1_].cockLength >= 20)
            {
               outputText("舔舐着你[cock " + (_loc1_ + 1) + "]的头部，期待着即将发生的事情，这只会增加你不断增长的欲望。");
            }
            else if(get_player().cockArea(_loc1_) < 6)
            {
               outputText("虽然你的肉棒不是最令人印象深刻的，但它“在关键时刻很管用”，你打算充分利用它。你充满爱意地挑逗自己，直到完全勃起；手指顺着冠状沟滑下，让你的龟头上形成了一滴前列腺液。");
            }
            else if(get_player().cockArea(_loc1_) < 12)
            {
               outputText("你像握剑柄一样握住你的肉棒，开始慢慢地抽插你的肉棒。你的呼吸变得越来越沉重和费力，因为你带着越来越强烈的激情抚摸自己。");
            }
            else if(get_player().cockArea(_loc1_) < 30)
            {
               outputText("害怕自己的阴茎暴露位置的恐惧在你的脑海中一闪而过，但现在已经太迟了。唯一的出路就是射精，所以你还不如享受它。你紧紧握住你的阴茎，开始自慰，希望能早点结束。");
            }
            else
            {
               outputText("从你胯下突出的高耸肉柱暴露了你的“藏身”之处，但恶魔们似乎并不介意，因为他们正忙着玩弄他们的新玩具。你怀疑即使他们介意，他们中是否有任何人能够满足你。你用双臂环抱住你完全勃起的阴茎，开始抽插，希望能尽快释放你的精液。");
            }
            outputText("[pg]这只蚂蚁看起来像是在试图抵抗，疯狂地挥舞着她的四只手臂，把她能拿到的任何东西扔向恶魔。经过一场短暂的、一边倒的冲突，恶魔们制服了她。");
            outputText("[pg]一个极其英俊且天赋异禀的恶魔站在她面前，将他的阴茎压在她薄薄的嘴唇上。蚂蚁惊讶地向后缩了缩头，看起来很困惑。显然她以前从未吸过鸡巴——这个想法让你感到一阵小小的兴奋，你短暂地希望那是你自己的阴茎指着她端庄的嘴。");
            outputText("[pg]一旦恶魔意识到她不明白他的意思，他抓住她的头发，把他的鸡巴推到她的脸上，用他的前列腺液涂抹她的嘴唇和脸颊。由于女孩仍然拒绝欢迎他的阴茎，他接下来抓住她的脖子，掐住她，直到她喘不过气来。抓住这个机会，他把他的鸡巴深深地塞进她的喉咙。");
            outputText("[pg]你确信如果蚂蚁的嘴和喉咙没有被恶魔的鸡巴塞满，她一定会尖叫。你可以看到恶魔呼气时脸上的愉悦表情。挣扎的蚂蚁女孩仍然没有放弃逃跑的希望。她再次试图扭动着挣脱，但另外两个抓住她的恶魔拿出他们的阴茎，分别放在她的一只上手上，强迫她开始用他们自己的手抚摸。另外两只手臂成了两个女恶魔的玩物，她们把她较小的手塞进她们的阴道里。抽插了几次后，她开始明白是怎么回事了；虽然你可以看出她显然没有经验，但她尽力同时取悦五个恶魔。其余的人群在场边观看，取悦着他们自己的生殖器。");
            outputText("[pg]接受口交的恶魔发出愉悦的咆哮，然后从她嘴里拔出他的阴茎；蚂蚁咳出少量恶魔冒泡的精液，滴在她的下巴和乳房上。");
            outputText("[pg]半心半意地抱怨他应该先射精是多么“不公平”，她上手中的男恶魔决定自己解决，放弃技巧，像活塞一样在他们的肉棒上上下抽动她的手，然后把他们滚烫的精液洒在蚂蚁的乳房和脸上，与第一个恶魔的精液混合在一起。女恶魔们看到洒出的精液，开始互相草率地亲热，把手指伸进去，然后伸到彼此的大腿之间。当蚂蚁的手在她们体内抽插让她们不知所措时，她们揉搓着她们的阴蒂和阴唇，伴随着大声的呻吟，她们齐声高潮。五个人都退后一步，让其余一直在等待的恶魔轮流上阵。");
            outputText("[pg]从隐藏你的岩石露头处观看，你带着越来越强烈的兴奋抚摸着[eachCock]，在肉棒上上下滑动你的手，看着恶魔们一个接一个地射精，速度越来越快。看到这个女孩被当作精液储存器使用，比你想象的要性感得多。");
            outputText("[pg]就在你快要射精的时候，你目睹其中一个恶魔把她翻了个底朝天。她迅速像蜘蛛一样蜷缩起来，把所有的四肢向内拉，把腹部蜷缩到胸前，徒劳地试图保护她的女性特征。恶魔对他的朋友们说了些你听不太清楚的话；一些完成的参与者跳起来服从的方式给了你第一个线索，这里站着这群人的首领。下属们帮助受惊的蚂蚁“打开”，把她的腹部从胃部拉开，把她的双腿分开；然后，主要恶魔把他巨大的肉枪放在她阴道的嘴唇上。你可以看到她的身体，被麝香的精液和性待遇唤醒，已经给出了独立于她意志的答案；[sun]光在她双腿之间的湿润处闪烁。");
            outputText("[pg]首领沿着她的裂缝上下拖动他恶魔般的头，等待她的性欲压倒她对这个想法的抵抗。你听到一连串非常奇怪的咔哒声，听起来像是这个可怜的强奸受害者最后的恳求。她可能是个处女吗？伴随着一声清晰的嘲笑，恶魔把他恶魔般的阴茎塞了进去。");
            outputText("[pg]女孩扭动着身体，但其他恶魔紧紧抓住她，嘲笑她的不适。现在你对她的处女身份毫不怀疑，你的抽插速度加快了。你全神贯注地看着第一个恶魔在她体内射精，眼睛翻白。几乎立刻，他被另一个人取代，自尊心得到了满足，女孩现在被玷污的阴道向所有人敞开。其中一个女恶魔看到她溅满精液的嘴不再使用，就把自己放在蚂蚁女孩的脸上。同样，蚂蚁未能立即开始取悦她的俘虏，要么是被目前在她体内的恶魔过度刺激，要么是完全被失去童贞所击败，听天由命地被当作玩具使用。女恶魔抓住受害者粘稠的棕色和现在白色的头发，把蚂蚁的脸塞进她的阴道，然后发出咕咕声，对新的感觉感到满意，并用一条铲形的尾巴缠住女孩的脖子，把她的脸锁在那里。女恶魔伸出手，找到蚂蚁较小的一双手，引导它们到她巨大、肿胀的阴蒂上，开始刺激自己。");
            outputText("[pg]当你几乎准备好射精时，一个双性人恶魔走上前来，他那根至少有20英寸长的阴茎很容易就能看出来。");
            outputText("[pg]双性人努力把自己塞进蚂蚁女孩体内，最终成功了。随着每一次扭曲胃部的抽插，你都能听到蚂蚁从女恶魔双腿之间发出的痛苦和狂喜的沉闷呻吟。双性人加快了他的抽插速度，反过来，你也保持着速度。以近乎精确的时间，你和恶魔一起射精。[player.SMultiCockDesc()]跳动着，一阵欣快感席卷了你。在愉悦的呻吟中，你释放了你");
            if(get_player().cumQ() < 100)
            {
               outputText("相当大的");
            }
            else if(get_player().cumQ() < 1000)
            {
               outputText("巨大的");
            }
            else if(get_player().cumQ() < 10000)
            {
               outputText("巨大的");
            }
            else
            {
               outputText("泰坦般的");
            }
            outputText("精液。一旦你能重新集中注意力，你看到双性人拔出阴茎，当它拔出时，一阵精液从蚂蚁变形者的阴道喷出，她的胃部稍微瘪了下去。她被灌满了太多腐化的精液，以至于她的肚子被撑大到了类似于妊娠晚期的程度。");
            outputText("[pg]你的身体得到了满足，你渐渐睡去。当你很久以后醒来时，恶魔和蚂蚁似乎已经离开了，谢天谢地，他们没有注意到你。你穿上盔甲，回到营地。");
            get_player().orgasm("Dick");
            dynStats(DynStat.Sens(-1),DynStat.Cor(3));
         }
         else
         {
            get_images().showImage("ants-desert-female-firstencounter");
            outputText("你在隐蔽处观察着，想象着接下来会发生什么，立刻感觉到你的小穴湿润了。你熟练的双手灵巧地动作着，滑入你的[armor]中。");
            outputText("[pg]隔着[armor]感受到自己的体温，你迅速而安静地脱下衣服，时不时低头确认自己没有被发现。当你完全赤身裸体时，你找到了一个绝佳的有利位置来观看即将发生的强暴。当你准备好时，你发现恶魔们已经开始了。");
            outputText("[pg]你的双手抚摸着乳房，捏住[nipple]发出轻柔的咕哝声，小心翼翼地压低声音。唉，你身体的反应开始压倒你的理智，你慢慢开始忘记自己甚至是在试图躲藏。");
            if(get_player().lactationQ() > 100)
            {
               outputText("你感觉到温暖的乳汁从变硬的乳晕中流出，你的身体乞求着释放它甜美的花蜜。");
            }
            if(get_player().hasCock())
            {
               outputText("感觉到[eachCock]在双腿间跳动，你的一只手顺着胸膛滑下，开始充满爱意地抚摸。");
            }
            outputText("[pg]血液仍然集中在你的胯部，你将手指放在阴道上方，轻轻地停留在[clit]上，然后揉搓着阴唇，直到汁液开始顺着你的腿流下。你开始缓慢地打圈按摩阴蒂，同时注视着眼前展开的场景。");
            outputText("[pg]其中一个恶魔正强行将他巨大的肉棒塞进无助的蚁女喉咙里，而另外两个恶魔则开始用她上面的手作为自慰辅助工具来打飞机，还有一对，这次是雌性，强迫蚂蚁用手指抠她们。即使在你的藏身处，你也能清楚地分辨出他们的呻吟和咕哝声。希望暴徒们不会在已经发出的声音中听到你的声音，你将一根手指滑入自己体内，将你的呻吟加入到他们的呻吟中。");
            outputText("[pg]恶魔们强迫他们的新精液垃圾桶摆出后入式的姿势，嘲笑她的不适。在众多双性恶魔中，有一个恶魔脱颖而出，他勃起了，这得益于一个顺从的恶魔，他一直并且仍在试图吸吮他令人印象深刻的恶魔肉棒；这个恶魔漫步走到蚁人面前，舔了舔嘴唇。双性人抬起蚂蚁甲壳状的腹部，露出她的阴户；蚁人几乎放弃了挣扎以求自由，当她的女性特征暴露出来时，突然又开始扭动起来。");
            outputText("[pg]恶魔短暂地露出惊讶的表情，然后当突然意识到什么时，露出了恶魔般的微笑。恶魔用一只手按摩着他下垂的乳房，开始用他的恶魔肉棒戏弄蚂蚁的小穴，这是一个至少20英寸长的巨大器官，在女孩的入口处上下拖动着巨大的龟头。蚂蚁惊恐地开始发出一系列咔哒声和疯狂的挥舞来抗议，但当在场边等待的一名雌性恶魔看到张开的嘴巴时，她走上前，将她的阴户滑过蚂蚁的脸，让她安静下来。受到女恶魔的暗示，这个戏弄人的双性人突然将他的恶魔肉棒，连根拔起，塞进蚂蚁湿润的小穴里。当恶魔开始抽插时，你可以看到蚂蚁的胃部扭曲，两个恶魔击掌相庆，显然对自己很满意。双性人很快屈服于快感，咬紧牙关快速地捣鼓着，当你想象他的肉棒是什么感觉时，你将几根手指滑入自己体内。");
            outputText("[pg]双性恶魔抽插得越来越快，准备释放。伴随着连你都能听到的呻吟声，他做了一个华丽的弓背冲刺，将他的种子释放到蚁女的子宫里。伴随着沉重的满足叹息，双性人的肉棒从蚂蚁体内滑落，伴随着滴落的精液和一点血迹。");
            outputText("[pg]直到现在你才意识到，蚂蚁一定是在努力保护她的童贞！有点嫉妒蚂蚁有这么一根巨大的肉棒作为她的第一次，你越来越不小心地自慰；你快要达到自己的高潮了，但尽力坚持到恶魔群体轮流完成。然而，当第三个恶魔在蚁人体内射精，并且从她用过的洞里滴落的精液增加成小溪时，你已经无法忍受了。你开始用一只手揉搓你的阴蒂，而你的另一只手则在你流口水的小穴里寻找你的G点。");
            outputText("[pg]当下一个恶魔将他的肉棒对准蚂蚁的阴道时，你将手指深深滑入自己体内。看着恶魔抽插，起初很慢，但随着激情的增加，你模仿他的节奏，想象他在你体内。你另一只手经验丰富的手指在你的阴蒂上快速移动。当你的思想集中在自己的幻想上时，你看到恶魔仰起头，做出了最后一次有力的冲刺。作为回应，你将自己的手指深深地捣入你的小穴，纯粹凭运气击中了你的G点。你和恶魔在幸福的呻吟中一起达到了高潮。他把位置让给下一个，而你则在性满足的光芒中失去了意识，睡着了。");
            outputText("[pg]当你从令人耳目一新的小睡中醒来时，你坐起来，从你的藏身处向外看。你一定昏迷了比你想象的更长的时间，因为恶魔们似乎已经离开了。剩下的只有蚁人，躺在并且仍然渗出一滩被污染的精液，处女膜和可能的心智被恶魔的狂欢所破坏。你迅速穿好衣服，回到营地。");
            get_player().orgasm("Vaginal");
            dynStats(DynStat.Sens(-1),DynStat.Cor(3));
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function introductionToPhyllaFollower(param1:Boolean = true) : void
      {
         var _loc2_:* = null as IMap;
         if(param1)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,873) < 50)
            {
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,873,50);
            }
            clearOutput();
            get_images().showImage("ant-camp-follower-intro");
            phyllaSprite();
            if(pregnancy.get_isPregnant() && pregnancy.get_incubation() == 0)
            {
               phyllaLaysSomeDriderEggs();
               return;
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,877) == 0)
            {
               _loc2_ = KFLAGS.flags;
               FlagDict_Impl_.arrayWriteInt(_loc2_,877,FlagDict_Impl_.arrayReadInt(_loc2_,877) + 1);
               outputText("凝视远方，你看到一个小土丘，你只能假设那是菲拉蚁群的开端。时不时地，你会看到菲拉的剪影从洞里探出来，然后立刻又潜回去。当你沿着陌生的路径走向不断扩大的蚁丘时，你暗自微笑。沿着这条路走没多久，你就来到了她蚁群入口的底部。考虑到菲拉是独自一人且是“皇室成员”，她在这么短的时间内搬运了这么多泥土，这相当令人印象深刻。不过话又说回来，她有四只手臂。你小心翼翼地穿过蚁群入口的门槛往下走。当你走下隧道时，你忍不住看到了这条单一隧道和她母亲那庞大、令人眼花缭乱的蚁群之间的对比。");
               outputText("[pg]你来到隧道的尽头，发现菲拉四仰八叉地躺在她的枕头上打盹，一丝不挂。她似乎为自己挖出了一个临时房间。房间里的一切都是用石头雕刻而成的。然后你意识到了一件事；这个房间几乎是你地表营地的翻版！它甚至配有铺盖卷和火坑，两者完全由石头制成，这让它们变得毫无用处。显然，菲拉这样做是为了让你更舒服，但以一种非常可爱的方式失败了。她打了个疲惫的哈欠醒来，伸展了她所有的六条肢体并弯曲了她的腹部。她睡眼惺忪地睁开眼睛，当她注意到你站在她的门口时，她惊讶地跳了起来。显然是被吓到了，菲拉疯狂地抓起她的枕头来遮盖她的裸体。");
               outputText("[pg][say: 哦！你来了！我太高兴了！我是说，我有一瞬间以为你可能不会来了……我是说……]");
               outputText("[pg]她的声音渐渐变小，注意到你环顾房间，欣赏着熟悉的风景。她犹豫地承认，她的新蚁群都是因为你。");
               outputText("[pg][say: 我-我正在努力……你喜欢吗？我是说，它很小，我知道它不如地表好，但我喜欢它。我是说，你舒服吗？有什么我可以……]");
               outputText("[pg]你用一种滑稽的表情打断了她。她深吸了一口气，试图平静下来。");
               outputText("[pg][say: 有件事我一直想告诉你。我是说，如果你想听的话。]");
               outputText("[pg]你点了点头。听听她要说什么也没坏处——");
               outputText("[pg][say: 我怀孕了。]");
               outputText("[pg]你的思绪戛然而止，脸上露出震惊的表情。仅仅是听到这个令人震惊的事实，你的胃就立刻感觉像是在里面打结了。");
               outputText("[pg]看到你的反应，她疯狂地挥舞着她所有的四只手臂，继续说道。");
               outputText("[pg][say: 不！不是那样的！我是说，我可以选择生孩子——我是说，我也可以不怀孕！]");
               outputText("[pg]你脸上的表情痛苦地表明你不明白她在说什么。");
               outputText("[pg][say: 我-我们只需要做一次爱，我是说！我想和你做更多次爱！]在她的脑子跟上她嘴里刚刚脱口而出的话后，她迅速捂住嘴，脸涨得通红。她把手臂向内收拢在身体周围，尴尬地弯下腰，但还是继续说道。");
               outputText("[pg][say: 自从我第一次和你在一起后，我就怀孕了。我可以选择生孩子或不生。我-我是说……我的同类，产卵。它们长得很快……或者说和你们这样的人相比很快。所以如果你愿意，我可以为我们建立一个充满我们后代的蚁群，或者我也可以一个人待在这里。只要我和你在一起，我不在乎。选择权在你。我是说，如果你不介意的话。你也不必现在就做出这个选择；我是说，我一直都在这里。]");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,925) == 1 && get_player().hasCock())
               {
                  outputText("[pg]你挑起眉毛，问她如果你从来没有插进去，她怎么会怀孕。");
                  outputText("[pg]她深吸了一口气，继续说道。");
                  outputText("[pg][say: 我不需要精液来生孩子；我只需要某些体液。]她再次脸红，用枕头半遮住脸。她看起来好像不打算继续说下去了，直到她低头看向你的双腿之间。[say: 你有点漏出来了……]她所能做出的全部反应就是更深的脸红……");
               }
               else if(!get_player().hasCock())
               {
                  outputText("[pg]你挑起眉毛，问她如果你们俩都没有阴茎，她怎么会怀孕。");
                  outputText("[pg]她深吸了一口气，继续说道。");
                  outputText("[pg][say: 我不需要精液来生孩子；我只需要某些体液。]她再次脸红，用枕头半遮住脸。她看起来好像不打算继续说下去了，直到她低头看向你的双腿之间。[say: 你知道我说的体液是哪种……我是说，它们很甜，而且我们分享了它们……它们来自我们的……我是说，你的……]她所能做的就是指着你阴道所在的位置……");
               }
               outputText("[pg]你给了她一个心领神会的眼神，她继续说道，声音比以前自信了一点。");
               doNext(postFirstIntro);
               return;
            }
            outputText("沿着熟悉的路径离开你的营地，没过多久你就到达了不断扩大的蚁丘，那是菲拉营地附近的蚁群。你爬上不断增高的蚁丘的顶部，进入通往地下洞穴的通道。一旦你到了菲拉的房间，你看到她正在墙上雕刻什么东西。一半看起来像是你画的艺术品的复制品，另一半看起来像是她蚁群的地图，上面有所有相连的洞穴。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,878) < 10)
            {
               outputText("[pg]到目前为止，洞穴的地图看起来并不令人印象深刻。");
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,878) < 30)
            {
               outputText("[pg]洞穴网络的地图开始看起来相当令人印象深刻了。如果你不知道自己要去哪里，你可能会迷失很长一段时间。");
            }
            else
            {
               outputText("[pg]光是看着这些雕刻就让你头晕目眩。几乎可以肯定的是，如果你不知道自己要去哪里，你很容易就会永远迷失在里面。");
            }
            outputText("[pg]当你的目光锁定在她背上的那一秒，你感觉到脑海中有什么东西抽搐了一下。你看到她也发生了同样的事情，她的整个身体都在抽搐。她迅速转过身，向你跑来。");
            outputText("[pg][say: 你回来了！我是说……我希望你喜欢它。我是说欢迎……你想谈些什么？]");
         }
         phyllaCampMenu();
      }
      
      public function girlFiller() : void
      {
         var clear:Boolean;
         var _g:AntsScene;
         clearOutput();
         get_images().showImage("ant-desert-female-first-scissoring");
         outputText("一想到终于可以用舌头在她身上大干一场，你就忍不住发出咕咕的叫声，但就在你考虑该怎么做的时候，你感觉到有什么东西进入了你的身体，让你发出一声惊讶的呻吟。你低下头，以为她的嘴还紧紧地贴在你的阴蒂上；相反，你爱人那甲壳状的手指已经开始插入你的小穴。");
         outputText("[pg]你的身体开始不由自主地扭动，你在快感中挣扎，菲拉继续对你的下体进行充满爱意、无休止的攻击。在片刻的清醒中，你的思绪突然集中起来。该你出招了！");
         outputText("[pg]现在你的爱人已经完全被迷住并兴奋起来，你摸到她坚硬的阴蒂，猜测它差不多有两英寸长。当你开始吸吮它时，你能感觉到快感的浪潮冲击着菲拉的大脑，并听到一声听起来像是呻吟和“咿！”混合的巨大叫声。她暂时停止了对你的动作，只是开始大声呻吟。你移动手指，把她掰开，就像她对你做的那样。轻轻地，目前放在她私处上的食指越过她嘴唇的门槛，上下滑动，同时你继续吸吮她长长的阴蒂。你爱人想要插入她的精神指令在你的脑海中注册，你很高兴地照办了。你迅速而熟练地沿着她爱之通道敏感的内壁移动手指，在你的脑海中感受到不断增长的快感充满了她。");
         outputText("[pg]当你继续吸吮她柔软的阴蒂时，你的舌头在上面上下翻飞。当你充满爱意地咬住她的阴蒂，把手指深深地插入她体内时，那种灵魂出窍的感觉几乎控制了你片刻，你意识到菲拉对你自己的行动施加了短暂的控制。明白了大概的意思，你开始把手指插得越来越深，同时越来越用力地吸吮她的阴蒂。你能感觉到她帮助你的手指寻找她的G点。");
         outputText("[pg]然后，一个突然的画面和震惊的感觉射入你的脑海；她的整个身体似乎都绷紧了，伴随着臀部研磨的脉动，她高潮了，呻吟声如此之大，似乎在墙壁上回荡。健美的双腿紧紧地夹住你的头，然后伴随着一声由衷的呻吟放松下来，她把她的爱液喷了你一身。你的手和脸完全被她温暖的爱液浸透了，你试图尽可能多地喝下去……但是实在太多了！");
         outputText("[pg]在快速停顿清理完脸部后，你向菲拉抱怨她没有你先高潮是不公平的。她惊恐地睁大了眼睛，但在她说话之前，你向她的脑海中发射了一个画面。是时候由你来控制局面了。你慢慢地从菲拉的四肢中解脱出来，停在她的身上。你慢慢地分开她的双腿，把你的大腿滑进她的双腿之间。");
         outputText("[say: 我-我……从来没有，]她结结巴巴地说，但你只想让她在破坏气氛之前体验一下。");
         outputText("[pg]摇晃着你的臀部，你看到了你预料中的反应，菲拉在空中呻吟着，弓起背，本能地将她的臀部迎向你。");
         menu();
         _g = this;
         clear = true;
         addButton(0,"继续",function():void
         {
            _g.scissorContinue(clear);
         });
      }
      
      public function gigititigitigitigitigityAntGirl() : void
      {
         var x1:int;
         var _g:AntsScene;
         clearOutput();
         outputText("你顶起了一个显而易见的帐篷，你的身体背叛了它对性满足的渴望，这让菲拉感兴趣地笑了起来。[say: 我——我没想到我有能力……去……我的意思是我不像你，所以我以为……]她开始说道，但当她看到你那粗糙、模糊的凸起形状时，声音渐渐小了下去。");
         var _loc1_:int = get_player().cockThatFits(phyllaCapacity());
         if(_loc1_ < 0)
         {
            _loc1_ = get_player().smallestCockIndex();
         }
         if(get_player().cockArea(_loc1_) < 36)
         {
            outputText("[pg]她精致的脸上露出了极度好奇的表情。她似乎对你的轮廓很感兴趣，但不确定该怎么做。就好像她从来没有……然后你想起她说过这是她的第一次；她是个处女！");
            if(get_player().cockTotal() > 1)
            {
               outputText("[pg]她可能连一根都应付不了，更别提你所有的[cocks]了！");
            }
         }
         else if(get_player().cockArea(_loc1_) < 72)
         {
            outputText("[pg]你的[cocks]不断地跳动和抽搐，显然对她来说还不够明显，你的裤子并不是为了适应你下体的大小而设计的。你痛苦地皱起眉头，因为你的裤子布料[if (silly) {以及这位作者假设每个人都穿裤子的事实变得|变得}]痛苦地紧绷和僵硬。从她缺乏经验的沉思中回过神来，蚁人看到了你明显的困境。");
            outputText("[pg]为了让你的下半身重获自由，她冲了过来，四只手都在狂热地工作，试图帮你解脱。经过一阵快速的动作，你的[cocks]从裤子里弹了出来；这尺寸显然吓到了蚁人，她的眼睛睁得大大的。[say: 这-这- 我怎么……哇……]");
            if(get_player().cockTotal() > 1)
            {
               outputText("[pg]她可能连一根都应付不了，更别提你所有的[cocks]了！");
            }
         }
         else
         {
            outputText("[pg]你裤子的布料实在无法再容纳你的[cocks]了，你疯狂地拉扯着扣子，试图在伤到自己或毁掉一条好裤子之前把你的下体释放出来。菲拉的走神戛然而止，她看到你因为拼命想要挣脱而涨红的脸和愤怒的神情。");
            outputText("[pg][say: 我-我从来没……那是……你的……我是说……] 你继续摆弄着裤子，给了她一个快速而严肃的眼神。[say: 呀！让我帮你！]");
         }
         if(get_player().cockArea(_loc1_) >= 72)
         {
            outputText("[pg]尽管有预警，[eachCock]还是猛地弹了出来，撞到了她的肩胛骨上。[say: 啊~疼！] 她发出一声轻呼，更多的是惊讶而不是疼痛。她揉着被撞疼的肩膀，对有人能拥有那种能力感到有些震惊。[say: 哎呀，] 你开玩笑地道歉。菲拉看起来完全惊呆了，似乎没听到你的话，她的大眼睛死死地盯着你巨大的阴茎");
            if(get_player().cockTotal() > 1)
            {
               outputText("");
            }
            outputText("。");
            if(get_player().cockTotal() > 1)
            {
               outputText("[pg]仅仅看到你的一根阴茎，菲拉就已经不知所措了，当她看到你所有的装备时，可以说她完全呆滞了。她可能连一根都应付不了，更别提你所有的[cocks]了！");
            }
            if(get_player().countCocksOfType(CockTypesEnum.TENTACLE) > 0)
            {
               outputText("[pg]随着你的心意，你命令你的触手阴茎");
               if(get_player().countCocksOfType(CockTypesEnum.TENTACLE) > 1)
               {
                  outputText("");
               }
               outputText("向前伸出，紧紧地缠绕住菲拉，拉着她的手把她拉近。");
            }
            outputText("[pg]你决定逗逗她，于是松开了缠绕着她的阴茎");
            if(get_player().cockTotal() > 1)
            {
               outputText("");
            }
            outputText("，把它悬在她面前，脸上挂着恶作剧的笑容，而菲拉则盯着");
            if(get_player().cockTotal() == 1)
            {
               outputText("它");
            }
            else
            {
               outputText("它们");
            }
            outputText("，显得有些害怕。");
            outputText("[pg][say: 那-那是什么？我-我是说……别告诉我你真的有那么大！总得有什么东西让你……“放”进我里面吧？……] 你看到她绕过你的阴茎");
            if(get_player().cockTotal() > 1)
            {
               outputText("");
            }
            outputText("寻找更合适尺寸的东西。你能看出菲拉更害怕她自己会发生什么，而不是你。");
         }
         menu();
         if(get_player().cockArea(_loc1_) <= phyllaCapacity())
         {
            _g = this;
            x1 = _loc1_;
            addButton(0,"继续",function():void
            {
               _g.malePhyllaContinuation(x1);
            });
         }
         else
         {
            addButton(0,"继续",cuntmuffinLingusPhyllaDickBig);
         }
      }
      
      public function getAntWaifuYoShit() : void
      {
         clearOutput();
         outputText("你对她微笑，告诉她你很乐意让她来你的营地。她的脸像太阳一样亮了起来，她迅速收拾了她拥有的极少财产——主要是衣服、枕头和一些珠宝。你们一起迅速离开了蚁群，回到了营地。");
         outputText("[pg]<b>(菲拉已添加到恋人菜单中！)</b>");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,875,1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function firstAntColonyEncounter() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_phylla());
         outputText("在穿越这片沙漠荒地中一个陌生的地方时，");
         if(get_player().cor > 75 && get_player().get_lust100() > 50)
         {
            outputText("寻找能满足你无法抑制的欲望的东西，");
         }
         outputText("你偶然发现了一辆废弃的商人手推车。手推车看起来凌乱得可怕，大部分物品散落在沙子上。无论是什么人或什么东西遗弃了这个东西，都是匆忙中做出的，而且似乎没有任何理由。出于好奇，你决定检查一下里面有没有什么有价值的东西。");
         outputText("[pg]突然，手推车里传来一声巨响。出于本能，你潜入一些大石头后面，迅速重新评估手推车的废弃情况。撞击声之后是一阵叮当声，好像有人在里面跌跌撞撞。");
         outputText("[pg]你看着一个生物笨拙地从木头堆的后面爬出来。因为你以前从未见过像她这样的生物，所以你保持原位，决定在评估潜在威胁之前先观察一下。你悄悄地、隐蔽地改变位置，以便更好地观察这个洗劫者。");
         outputText("[pg]当你意识到她有四只手臂时，你睁大了眼睛，张大了嘴巴！她的两条主臂长在肩膀上，正如你所料，但较小的一组手臂长在你认为是她胸腔的两侧，就在腋窝下方。她所有的手臂和腿都覆盖着闪亮的黑色甲壳；她身体的关节似乎相互咬合，让她看起来非常像昆虫。");
         outputText("[pg]她的骨架极其瘦削且肌肉发达，尽管臀部宽大，像个女孩。她躯干上的肌肉清晰可见，尽管她附肢上的覆盖物让人无法评估其下方的身体。然而，你觉得可以安全地假设她相当强壮——从她轻松地掀翻手推车看下面的情况就可以判断出来！她有一张略显女性化的脸，嘴唇很薄，还有两只完全翠绿色的眼睛。你看着她举起小饰品和小摆设；起初好奇地检查它们，然后漠不关心地丢弃它们。");
         outputText("[pg]当她在破损的手推车里翻找时，她的腹部似乎随着臀部弯曲和摆动。她时不时地从臀部的便携袋里拿出一个粗糙的日晷，费力地在平坦的表面上检查，好像她在赶什么截止日期。");
         outputText("[pg]她的第二组手臂挡住了你，让你无法完全看到她的胸部，无法确定她的罩杯大小。不过，当她洗劫手推车时，你确实看到了几个令人愉悦的局部视图……从她对自己的裸体如此开放来看，几乎不穿衣服对她来说可能并不罕见。当阳光在她的黑色甲壳板上闪烁时，她棕褐色的皮肤看起来很光滑。一块小小的缠腰布尽力遮盖她的生殖器，但在阵阵沙漠风中，这件小衣服几乎毫无用处。她阴道的嘴唇看起来和她身体其他部位的皮肤一样光滑，没有毛发的迹象——考虑到她像昆虫一样的外表，这并不奇怪。");
         outputText("[pg]她那沙褐色的短发似乎乱蓬蓬的，纠结在一起，尽管一顶带有悬垂宝石的失去光泽的金色头饰在[sun]光下闪闪发光，给头发增添了一些风格。你想知道她是在搜查手推车时找到的头饰，还是她以前就有的。");
         outputText("[pg]当你考虑你的选择时，一群恶魔出现在你正对面的沙丘上。和你一样，他们看到这个奇怪的女孩似乎也同样困惑。与你不同的是，他们没有试图隐藏。一旦他们看到蚂蚁女孩是独自一人，他们迅速降落在手推车上；可怜的女孩完全措手不及。显然她以前从未面对过这么大一群恶魔。当恐惧刻在她的脸上时，她手里拿着的破裂的花瓶明显在颤抖。");
         outputText("[pg]你可以从你躲藏的地方观看，或者你可以扮演英雄并介入。");
         menu();
         addButton(0,"扮演英雄",playHero);
         addButton(1,"保持隐藏",keepHidden);
      }
      
      public function femalePhyllaFirstTimePlusCock() : void
      {
         clearOutput();
         if(get_player().smallestCockArea() > phyllaCapacity())
         {
            get_images().showImage("ant-desert-female-first-scissoring-with-bigcock");
         }
         else
         {
            get_images().showImage("ant-desert-female-first-scissoring-with-cock");
         }
         outputText("一想到终于可以用舌头在她身上大干一场，你就忍不住发出咕咕的叫声，但就在你考虑该怎么做的时候，你感觉到有什么东西进入了你的身体，让你发出一声惊讶的呻吟。你低下头，以为她的嘴还紧紧地贴在你的阴蒂上；相反，这位甲壳状爱人的手指已经开始插入你的小穴，而她另一只空闲的手臂");
         outputText("抓住了");
         if(get_player().cockTotal() == 1)
         {
            outputText("你的[cock]。");
         }
         else
         {
            outputText("你的[cock]，让这个幸运的成员沐浴在充满爱意的荣耀中，而你其余的男子气概则在哀叹被冷落。[say: 别担心，我有四只手……]菲拉一边抚弄你的肉棒一边柔声说道。");
         }
         outputText("[pg]你的身体不由自主地扭动着，你在快感中挣扎，菲拉继续对你的下体进行充满爱意、无休止的攻击。在片刻的清醒中，你的思绪突然集中起来。该你出招了！");
         outputText("[pg]你把头埋在她的双腿间，撅起嘴唇，含住了她的阴蒂。你估计它差不多有两三英寸长。当你开始吸吮时，你能感觉到一阵快感冲击着菲拉的意识，她发出一声响亮的叫喊，听起来像是呻吟和“咿！”的混合体。她暂时停止了对你的动作，只是开始大声呻吟。你移动手指，将她分开，就像她对你做的那样。轻轻地，你放在她私处上的食指越过她阴唇的边缘，上下滑动，同时你继续吸吮她长长的阴蒂。你脑海中接收到了来自爱人想要被插入的精神指令，你欣然从命。你迅速而熟练地将手指沿着她爱之通道敏感的内壁移动，在脑海中感受着不断攀升的快感填满她。");
         outputText("[pg]你的舌头在她娇嫩的阴蒂上上下下、四处游走，同时你继续吸吮着它。当你深情地咬住她的阴蒂，将手指深深插入她体内时，那种灵魂出窍的感觉几乎控制了你片刻，你意识到菲拉对你的行动施加了短暂的控制。明白了她的意图，你开始将手指越插越深，同时更用力地吸吮她的阴蒂，你的双手以惊人的速度移动，用手指抚慰着你的新情人。");
         outputText("[pg]接着，一个突如其来的画面和震惊的感觉射入你的脑海；她的整个身体似乎都紧绷起来，伴随着突然的磨胯脉动，她高潮了；呻吟声如此之大，似乎在墙壁上回荡。她健美的双腿紧紧夹住你的头，然后伴随着一声由衷的呻吟放松下来，她的爱液喷了你一身。你的手和脸完全被她温暖的爱液浸透了，你试图尽可能地喝掉……但实在太多了！");
         outputText("[pg]她从你身上滚下来，处于一种绝对的狂喜状态。你用手肘撑起上半身，与她对视了片刻，她看着自己滑稽的杰作，忍不住咯咯笑了起来。当然，这个曾经害羞的蚁人现在正盯着你流着淫液的小穴。她看起来好像要继续刺激你，但你突然有了一个更好的主意。是时候让你来掌控局面了。");
         if(get_player().smallestCockArea() > phyllaCapacity())
         {
            outputText("[pg]尽管你尽了最大努力试图找到一个舒适的姿势来磨豆腐，但你那硬得发疼的" + get_player().multiCockDescriptLight() + "让你无法如愿，因为它们现在正抵着天花板。虽然在你的" + get_player().multiCockDescriptLight() + "上观看彩虹的展示很漂亮，但那种压碎般的疼痛和你的[cocks]不屈不挠的本性实在让人难以忍受。");
            if(get_player().isTaur())
            {
               outputText("看到你即将面临的困境，菲拉迅速用她的四只手臂手忙脚乱地收集了一堆垫子。她把它们堆成一个临时的“休息处”，并帮助你摆出一个舒适的姿势，因为你的肉棒开始不受控制地生长。");
            }
            else if(get_player().isDrider())
            {
               outputText("菲拉立刻意识到了这一点，她把你翻转过来，让你用头和脖子支撑着身体，她躲过你的[cocks]，停在你的蜘蛛甲壳和柔软阴蒂的交界处。");
            }
            else if(get_player().isGoo())
            {
               outputText("菲拉立刻意识到了这一点，她把你翻转过来，让你用头和脖子支撑着身体，她穿过你黏糊糊的身体，毫不费力地将她的阴蒂与你的阴蒂连接在一起。[say:这有点奇怪……但我喜欢……]她调情道。你稍微硬化了你的身体，将菲拉紧紧地固定在你的身体上，告诉她事情“可能”会变得很粗暴。");
            }
            else
            {
               outputText("菲拉立刻意识到了这一点，她把你翻转过来，让你用头和脖子支撑着身体，并将你的[legs]卷向她。");
            }
            outputText("你的[cocks]现在舒适地放在开阔的房间外，菲拉调整好姿势，准备和你的小穴磨豆腐。");
            outputText("[pg][say:你、你刚才让我担心了一下。我是说，我从来没见过……这么<b>大</b>的东西！]她调侃道。");
         }
         else
         {
            outputText("[pg]你将自己置于她上方，让你的小穴和她的小穴紧紧贴在一起。你抓住她的一条腿，将它抬起，迫使她的阴唇分开。");
         }
         if(get_player().smallestCockArea() > phyllaCapacity())
         {
            outputText("[pg]你开始摇晃臀部，你们的小穴亲吻着，体液和谐地混合在一起，快感传遍你们全身。随着每一次推挤，她的阴蒂似乎越来越深地插入你的阴蒂，虽然不足以完全进入你，但内部的感觉让你们俩都体验到了一波又一波的狂喜。");
         }
         else
         {
            outputText("[pg][EachCock]渴望得到关注，因为当你转变为磨豆腐的姿势时，菲拉放开了它们。你伸手下去准备自己解决；菲拉突然打断了你。[say:哦，对不起！我是说……我忘了……只是感觉……太爽了，]她在狂喜的呻吟中娇喘道。过了一会儿，随着快感的浪潮席卷她，她似乎又忘了。你调皮地清了清嗓子，指了指你的[cocks]。菲拉迅速回过神来，抓住了");
            if(get_player().countCocksOfType(CockTypesEnum.TENTACLE) > 0)
            {
               outputText("你的触手肉棒");
               if(get_player().countCocksOfType(CockTypesEnum.TENTACLE) > 1)
               {
                  outputText("");
               }
               outputText("。很明显，她以前从未见过这样的东西，因为她不知道该怎么办。你笑着告诉菲拉，她什么都不用做，只要保持不动就行了。你让你的触手肉棒像蛇一样");
               if(get_player().countCocksOfType(CockTypesEnum.TENTACLE) > 1)
               {
                  outputText("");
               }
               outputText("爬上她的身体，确保在途中抚摸她最娇嫩的地方。她震惊地大声尖叫，当她低头看时才意识到发生了什么。[say:天哪，你吓死我了！]她大喊道，为自己被你的肉棒吓得半死而感到尴尬");
               if(get_player().countCocksOfType(CockTypesEnum.TENTACLE) > 1)
               {
                  outputText("");
               }
               outputText("。你嘲笑她的表现，指着你的肉棒");
               if(get_player().countCocksOfType(CockTypesEnum.TENTACLE) > 1)
               {
                  outputText("并扭动它们");
               }
               else
               {
                  outputText("并扭动它");
               }
               outputText("在她面前，就像鸟儿面前的虫子一样。[say: 噢，有人需要关注吗？] 菲拉调侃着，握住");
               if(get_player().countCocksOfType(CockTypesEnum.TENTACLE) == 1)
               {
                  outputText("你的肉棒插进她的嘴里，同时她继续将臀部贴向你。");
               }
               else if(get_player().countCocksOfType(CockTypesEnum.TENTACLE) == 2)
               {
                  outputText("你的肉棒插进她的嘴里，夹在她的双乳之间，同时她继续将臀部贴向你。");
               }
               else
               {
                  outputText("你的肉棒插进她的嘴里，夹在她的双乳之间，并沿着她的身体摩擦。她身上的肉棒紧紧缠绕着她昆虫般的关节，利用她肌肉发达的曲线让你高潮。");
               }
            }
            else if(get_player().cockTotal() == 2 && get_player().cockArea(get_player().smallestCockIndex2()) + get_player().cockArea(get_player().smallestCockIndex()) <= phyllaCapacity())
            {
               outputText("你的两根[cocks]，一边和你磨豆腐，一边歉意地抚摸着它们。你感觉到她对你身体的各个部位都有着几乎无法满足的胃口。你感觉到菲拉的心智正慢慢迷失在快感中。");
            }
            else if(get_player().cocks[get_player().smallestCockIndex()].cockLength < 4)
            {
               outputText("你的" + get_player().cockDescript(get_player().smallestCockIndex()) + "，一边和你磨豆腐，一边歉意地抚摸着它。你感觉到她对你身体的各个部位都有着几乎无法满足的胃口。你感觉到菲拉的心智正慢慢迷失在快感中。");
            }
            else
            {
               outputText("你的" + get_player().cockDescript(get_player().smallestCockIndex()) + "，但她根本没法用任何数量的手环绕你整个龟头；于是她便转而爱抚你那" + get_player().cockDescript(get_player().biggestCockIndex()) + "的头部。");
            }
         }
         scissorContinue(false);
      }
      
      public function femalePhyllaFirstFuckGooooo() : void
      {
         clearOutput();
         get_images().showImage("ant-desert-female-first-boobsucking");
         outputText("渴望享受一些传统的老式乐趣，你将意念传达给菲拉，告诉她“脱掉衣服”。在她脱下所有皇家服饰后，她靠近你，用赤裸的身体摩擦着你。她的手指流畅地移动，慢慢地沿着你的胸膛和背部的脊梁勾勒出她越来越硬的乳头，让你的脊背感受到一阵阵性感的战栗。你的[nipples]作为回应变硬了，她以惊人的速度将身体向下移动，用嘴锁住你的乳头，用力吸吮着你坚硬的乳晕。");
         if(get_player().lactationQ() > 250)
         {
            outputText("[pg]你能感觉到她从你的乳房吸出了一些乳汁，在缓解她微弱口渴的同时，她也因为从爱人的[breasts]“哺乳”的感觉而变得极度兴奋。奇怪的是……你能尝到你花蜜的营养温暖，因为它流下她的喉咙进入她的胃里。喝下并品尝自己的母乳绝对会让人觉得奇怪，但这种行为的陌生感对你来说却是一种奇怪的刺激，你让她继续吸吮。");
         }
         outputText("[pg]她的舌头熟练地移动，在你的乳头上飞舞，同时她将一只手移到另一边，用她柔软的舌头轻轻抚摸和挑逗你敏感的肌肤。被捏乳头的想法在你的脑海中疯狂蔓延，在你意识到自己做了什么之前，你的爱人正是这么做的。你发出一声惊讶的欢愉呻吟，她似乎明白了你的意思，开始用嘴里的乳头摩擦牙齿，甚至咬下恰到好处的力度，在痛苦与快乐之间找到平衡。当她终于松开你的乳头时，她抬起头，带着最邪恶的微笑看着你。她咧嘴笑着，舔去嘴唇上的乳汁，深深地凝视着你的眼睛。");
         if(get_player().isGoo())
         {
            outputText("[pg][say: 我怎么没在奶水里尝到史莱姆的味道？]她打破了凝视，问道。[say: 我还以为史莱姆会让你的奶水变难喝，但是……它反而让我更想要了……抱歉，我走神了。]她一边道歉，一边再次凝视着你的眼睛。");
         }
         outputText("[pg]你突然感觉到一个想法……不，是一个建议，在你的脑海深处发痒。不知怎么的，你觉得张开双腿平躺是个好主意。你不确定这个外来的想法是从哪里来的，但它似乎在“要求”你躺下，准备迎接一场肉欲之欢；当你听从它的指示躺在床上时，有什么东西在诱惑着你的[clit]。当你向上看，准备迎接她充满爱意的攻势时，你看到碗里的液体在天花板上反射出变幻的彩虹。你还意识到，当你仰卧时，菲拉对你所做的一切都是双向的，因为你猛然意识到是她让你仰卧的。她把臀部移到你的脸上，这样她那湿润诱人的阴道就微微悬在你的嘴上；她腹部的其余部分刚好延伸过你的头顶。她的气味充满了你的鼻腔，用它那令人陶醉的魅力淹没了你的身体。欲望占据了你的大脑，你无法克制自己想要把脸埋进她那柔软的洞里的冲动。不！你想做的不仅仅是这些；你想用嘴像狗啃新玩具一样蹂躏她那湿润的阴户，但有什么东西阻止了你。就像你的身体被你的思想束缚住了，但你觉得阻止你的不是“你”的思想。");
         outputText("[pg]你顺着自己的身体往下看，看到她从你的双腿之间仰视着你，从你的角度看是倒立的。她调皮地对你笑了笑，然后把脸凑到你的[clit]上。你能感觉到她潮湿的呼吸喷洒在你的女性部位上，它也随之变硬。她从你的膝盖开始，用下面两只手顺着你的大腿内侧滑下，非常轻柔，最后在你现在肿胀的[clit]上方做圆周运动，同时用另外两只手把你张得大大的，让她的嘴落在你的阴蒂上，她的舌头就像一群母狮攻击瞪羚一样野蛮地攻击着它。你再次弓起背，呻吟着；你不想这只是单方面的馈赠，于是你伸出手抓住她的乳头，轻轻地捏了一下，逗弄着菲拉。你那迷恋你的爱人颤抖着，大声呻吟着，但声音被她嘴里的[clit]闷住了。");
         outputText("[pg]你已经受够了她不让你碰她的阴部，于是集中精力强迫她降到你身上。考虑到你目前的处境，这可不是件容易的事。就在你想放弃尝试，只想享受她对你的狂轰滥炸时，你感觉到她的思想向你屈服，她那曾经遥不可及的嘴唇降了下来。她太湿了，你可以看到她情欲的溪流顺着她甲壳状的双腿两侧流下。你集中注意力，盯着她的阴蒂，它比你想象的要长得多，远远伸出她肉洞的褶皱。");
         menu();
         if(!get_player().hasCock())
         {
            addButton(0,"继续",girlFiller);
         }
         else
         {
            addButton(0,"继续",femalePhyllaFirstTimePlusCock);
         }
      }
      
      public function enterTheColony() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_antguards());
         get_images().showImage("ant-desert-colony");
         outputText("带着你那奇怪的、过目不忘的新记忆在沙漠中漫步，没过多久你就遇到了那座大蚁丘。如果不是那些投射到你脑海中的幻象，你绝对猜不到在如此恶劣的环境中会隐藏着这样的东西。当你靠近蚁丘时，你产生了一种熟悉的被监视的感觉。");
         outputText("[pg]靠近山顶时，你吃了一惊，三只巨大的蚂蚁通过一个巧妙隐藏的活板门从沙子里冲了出来。它们比你救下的那个女孩大得多，但看起来同样肌肉发达，除了它们那双杏仁状的大眼睛和较小的鼻子外，看起来大致像人类。它们有狭窄的下颌线和更尖锐的脸颊结构，使得脸部看起来非常男性化。雌性的腹部是肤色的，似乎有巨大的角质板，而这些蚂蚁的腹部则是完全光滑的黑色。其中两只的四只手里拿着带有黑曜石尖端的简易长矛，而另一只则使用一把非常旧且非常钝的短剑。这两只迅速包围了你，用长矛指着你。拿着短剑的那只走上前，几乎把脸贴到你的脸上，嗅了嗅你。越过他的肩膀，你面前拿着长矛的蚂蚁对其他蚂蚁发出了一连串的咔哒声。它们看起来很恼火，但放下了武器。三只蚂蚁都走到活板门前，两只拿着长矛的蚂蚁把它举了起来。拿着短剑的那只示意你跟着他下去。");
         outputText("[pg]当你跟着你的护卫爬下进入昏暗的洞穴系统时，唯一的光线似乎是由覆盖在墙壁上的一种生物发光真菌发出的。你进入这个庞大洞穴和扭曲隧道的旅程让你非常迷失方向。幸运的是，你的向导似乎确切地知道他要去哪里；当你转过一个急弯时，你进入了一个巨大的挖掘洞穴。你在里面看到的是一个几乎通向四面八方的复杂隧道网络，各种形状和大小的蚂蚁正在进行它们的日常工作。你猜这大概是这个蚁群的中心枢纽。");
         outputText("[pg]在这个巨大枢纽的中间，坐在某种“王座”上的，是你在玛瑞斯见过的唯一另一只雌性蚁人。你突然被一种似曾相识的感觉所克服，就好像你以前来过这里……就好像你以前在这里<b>生活</b>过。你的大脑坚持认为她是“女王”，她比任何其他蚂蚁都要大得多；最重要的是，她的腹部几乎是她自己身体的两倍大！当你的向导带领你去见她时，她拱起背，所有的肌肉都绷紧了，但当她放松下来时，你的不确定感很快就烟消云散了；一股清澈的凝胶和一个小圆柱形的卵从她腹部末端的孔中涌出。这个卵很快被另一只从众多隧道中出来的蚂蚁收集起来，并同样迅速地被带回隧道中。拿着剑的士兵向你示意了一下那只巨大的雌性，然后消失在洞穴中。她打量着你，上下扫视着。");
         outputText("[pg][say: 我是奇拉女王。你明白吗？女——王。我最近才学会了你们这种可悲的被称为语言的东西。] 她的语气就像一个被迫向农民讲话的君主。显然她对你或你的智商评价不高。");
         if(get_player().isPureEnough(40))
         {
            outputText("[saystart]“勇者”，你被派到这片土地上来抵抗恶魔，你到目前为止的努力，虽然微不足道，但并没有逃过我的眼睛。");
         }
         else
         {
            outputText("[saystart]尽管你身上有明显的腐化，但你似乎保留了你自称的“勇者”的勇气，而不是变成一头只知道发情的野兽。这确实值得钦佩。");
         }
         outputText("在救了我的女儿，菲拉之后……[sayend] 她停顿了一下，做了个手势，你从恶魔群中救出的那个四臂女孩缓慢而害羞地从附近的一条隧道里走出来，站在她母亲旁边。“菲拉”看起来非常尴尬，脸红得很厉害，在奇拉女王继续她枯燥的独白时，她看着地面，避免与你们俩有眼神接触。[say: ……你被选中成为她潜在的……“配偶”；这让我非常沮丧。] 等等，配偶？[say: 我的女儿向我展示了你是如何从居住在这片土地上的恶魔手中救出她的。也许你只是运气好，趁她背对着他们的时候，抓住了他们手里正握着自己老二的破绽？]");
         outputText("[pg]女王暂时停顿了一下，用恶狠狠的目光盯着她的女儿。然后奇拉的目光转向你，看起来好像她掌握了第一手资料，而她的问题只是修辞手法。菲拉似乎缩得更小了，继续盯着地板，不敢激起她母亲的怒火。");
         outputText("[pg]女王的讲话停顿的时间刚好够你注意到另一个卵从她的腹部溢出。她深吸了一口气，继续说道，就好像什么都没发生过一样。[say: 虽然我不指望你真正理解你所获得的机会，但我现在将解释我女儿的招亲试炼将如何进行。]");
         outputText("[pg]奇拉直起身子，你看到她的肌肉紧绷着，以举起她巨大的腹部。令人惊讶的是，她轻松超过了10英尺高，即使带着她那肿胀的后部，也是一个令人印象深刻且非常具有王者风范的身影——尽管你怀疑她并不敏捷。");
         outputText("[pg][say: 我们捕获了这片土地上一些最凶猛的生物；主要是为了研究，但它们也可以作为挑战中的战斗人员。我建造了一个竞技场，算是吧。你必须在那里在单挑中击败这些野兽。我现在警告你，我自己的许多战士都尝试过这些试炼，但没有一个成功；有些甚至丧命了。]");
         outputText("[pg]她停顿了一下，让这句话沉淀下来，似乎希望这能阻止你。");
         outputText("[pg][say: 当你准备好了，就去竞技场吧。祝你好运；我相信你会需要它的。]");
         outputText("[pg]蚁后用她的一只大手臂向你挥了挥手，让你有理由认为她的善意绝非如此。当你转身离开时，你的目光捕捉到了菲拉，她害羞地对你笑了笑。她的母亲看到了这一点，并给出了最后的、神秘的警告。[say:在你离开之前还有最后一件事，“勇者”。如果你失败了，对你来说，后果将是……可怕的。]");
         outputText("[pg]当你仔细思考这个不祥的信息时，你的向导重新出现，并带领你穿过迷宫般的隧道，回到蚁群的出口。你把蚁丘抛在脑后，前往营地，考虑你最好的行动方案。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,469,1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function eggDatBitch() : void
      {
         var _loc1_:* = null as IMap;
         clearOutput();
         if(get_player().canOvipositSpider())
         {
            get_images().showImage("ant-camp-ant-mounted-by-drider");
            outputText("虽然菲拉似乎在性方面得到了满足，但你蜘蛛腹部的沉重感却渴望得到释放。[pg]");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,890) == 0)
         {
            outputText("转向菲拉，你告诉她你可以帮助她实现成为育母的愿望。她有些惊讶地看着你，仿佛你已经做的事情还不够多似的。");
            outputText("[pg]你继续解释，告诉她你的身体里充满了卵，正急切地等待着一个愿意孕育它们的宿主。如果她想尽可能多地生孩子，你们的结合可以满足她的愿望；尽管她将同时生下蚂蚁和蜘蛛的孩子。");
         }
         else
         {
            outputText("你给了菲拉一个会意的眼神，然后回头看了看你肿胀的蜘蛛腹部。你调皮地向她挺了挺你的产卵管。菲拉咯咯地笑了起来，知道你想对她做什么。");
         }
         if(Utils.rand(20) + 1 + get_player().get_inte() / 20 < 10)
         {
            outputText("[pg]菲拉沉思了片刻，摇了摇头。[say: 对不起，[name]，我现在对这个不太适应。]");
            if(pregnancy.get_isPregnant())
            {
               outputText("[pg][say: 我只是不能在体内装下任何其他东西了。对不起！请不要生气……我是说，我会的！只是在……这批之后。]");
            }
            else
            {
               outputText("[pg][say: 我是说……我只是，现在对这个不太适应。也许以后吧。]");
            }
            doNext(get_camp().returnToCampUseOneHour);
         }
         else
         {
            outputText("[pg]带着一些犹豫和考虑，菲拉思考了一会儿以多种方式成为育母的想法。带着羞涩的微笑，菲拉勉强同意孕育你们俩的孩子。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,890) == 0)
            {
               outputText("[pg][say: 我-我们要怎么做？]她询问道。[say: 我是说，我以前从来没有见过或听说过有什么东西和蛛化精灵交配……我-我的卵是从我的腹——]");
               outputText("[pg]你把一根手指放在她的嘴唇上，告诉她躺在床上放松。你完全知道她的卵是从哪里出来的。菲拉同时从她的阴道和腹部产卵的画面让你更加渴望这一切。通过链接，你把这个画面传达给了她，并感觉到她充满了母性的骄傲。在不确定的期待中，菲拉听从了你的指示，躺了下来，背靠在床上，腹部蜷缩在空中。");
            }
            else
            {
               outputText("[pg]菲拉迅速就位，尽管起初她看起来不确定自己做的是否正确。");
               if(get_player().cor > 75)
               {
                  outputText("可怜的菲拉不知道，你只是打算把她当作一个生育机器，来缓解你自己卵囊的紧张感。");
               }
            }
            outputText("[pg]你帮她摆好正确的姿势；当你爬上床时，让她的阴户对着你。最后停在菲拉的身上，你用双手捧着她柔软的脸庞，亲吻了她。你把她的身体紧紧地压在你的身下，同时用你的产卵管摩擦她的阴道。");
            outputText("[pg]当菲拉用双臂抱紧你时，她的舌头探入你的嘴里寻找你的舌头。知道她准备好了，你进入了她，开始释放你的润滑液。当分泌物刺激她的快感中心时，菲拉在你的嘴里呻吟着。通过链接，你告诉她做好准备；产卵管深入她的子宫，感觉到第一批卵顺着你那变态的器官滑落。");
            outputText("[pg]她眯起眼睛，准备迎接不可避免的卵强行进入她的体内。她打断了你们的长吻；当椭圆形的肿块最终接触并进入她体内时，她喘着粗气。你能感觉到你未出生的孩子的外壳进入菲拉体内，撑开她的阴户以容纳未来的沉积物。当领头的卵碰到她的子宫颈时，她发出一声轻微的不适呻吟。");
            outputText("[pg][say: 呃！有点……痛……感觉好奇怪……我是说，很好！给我更多！求你了！]她大声喊道，她的母性本能被唤醒，因为她渴望孕育许多后代的欲望压倒了她。你安慰她，告诉她还有一些在路上；这让菲拉翻了个白眼。你感觉到，被这么多新生命填满，最终将生下它们的想法淹没了她的感官。");
            outputText("[pg]一个接一个的卵滑入菲拉体内，随着每一个卵的进入，她的呻吟声越来越大。当你把更多的卵塞进她体内时，她的肚子很快就开始因为你的后代而变得越来越大。");
            if(get_player().cor >= 75)
            {
               outputText("[pg]你能感觉到她通过链接要求你停下来，因为她的身体开始远离你，说她已经很饱了，再多就会伤害她。还没完呢！你知道她至少还能装下三四个！你知道她能安全地容纳它们，她只需要[say: 勇敢一点。]你用你众多的腿和手臂把菲拉按在地上。完全阻止她离开。菲拉在快感或痛苦中尖叫，你不太确定，但你继续把你的卵产入她体内。");
            }
            outputText("[pg]最后，最后一颗卵产在菲拉体内，你从她的爱洞中抽出你的产卵管；它会随着时间的推移而恢复的。菲拉抚摸着她的肚子，高兴地闪闪发光，里面充满了她爱人未来的孩子，这些孩子将帮助巢穴变得强大。");
            pregnancy.knockUp(15,192);
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,890,FlagDict_Impl_.arrayReadInt(_loc1_,890) + 1);
            get_player().orgasm("Ovi");
            get_player().dumpEggs();
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function dudesFuckEggLayingBitches() : void
      {
         clearOutput();
         get_images().showImage("ant-desert-male-preg-vagsex");
         outputText("当你提出想和她做爱时，菲拉显得完全惊呆了。显然她对自己现在的样子感到很不自在，她向后靠在座位上，用四只手遮住了自己胀大的乳房。");
         outputText("[pg][say:你确定吗……我的意思是，我可以改变一下……变小一点。这不会花很长时间的……]她瞥了一眼身后肿胀的腹部。[say:嗯……是的，不会花很——啊！]");
         outputText("[pg]一阵宫缩传遍她的全身，她的话说到一半就停住了；你看着她全身紧绷起来。接着，伴随着一声近乎性感的呻吟，她浑身一颤，所有的肌肉都放松下来，宫缩将一枚圆柱形的卵从她腹部末端的产道口推了出来。");
         outputText("[pg]仿佛是得到了信号一般，你众多孩子中的一个迅速从阴影中跑出来，抱起那枚卵，把它带到了蚁群更深处的地方。显然，这里正在运作着某种更庞大的系统。");
         outputText("[pg]菲拉慢慢恢复过来，回头看着你，试图回想你为什么会来这里。然后，你带着邪恶的微笑，看着她因为想起来而睁大了眼睛。");
         outputText("[pg][say:我不能——只是不能像这样……你看不出来吗……]她语无伦次地试图说服你，但你");
         if(get_player().cor < 50)
         {
            outputText("根本不在乎她现在看起来怎么样。此外，这附近的一些生物很欣赏一点肉体上的欢愉；这有助于分娩过程。");
         }
         else
         {
            outputText("对她试图掩盖怀孕身姿的可怜举动毫不在意；你现在欲火焚身，不管她有多么不安，她都得乖乖就范。");
         }
         outputText("[pg]你走到她身边，");
         if(get_player().cor < 50)
         {
            outputText("充满爱意地");
         }
         else
         {
            outputText("冷漠地");
         }
         outputText("把她的手从乳房上拉开。她一开始还在反抗，但一旦看到无法阻止你，她就羞涩地顺从了你。");
         outputText("[pg]你看到她的乳房增大了一倍，还渗出了乳汁——毫无疑问，这是她怀孕的结果。");
         outputText("[pg]你调皮地用力捏了其中一个。菲拉呻吟了一声，一股白色的乳汁喷射而出。");
         outputText("[pg]你评论说，这么胀对她的背可不好。");
         outputText("[pg][say:我的……我是说，我们的……他们不……这——这很复——]");
         outputText("[pg]你打断了她，再次用力捏了捏她的乳房，导致乳汁喷射到地上，菲拉也再次发出了轻柔的呻吟。");
         outputText("[pg]你告诉她你会解决这个[say:问题，]然后像眼镜蛇袭击猎物一样用嘴含住，在她反驳之前紧紧捏住另一个乳房。这些动作让你的嘴里尝到了温暖的乳汁，手上也沾满了她渗出的母性精华。你对流出的量感到惊讶，尽可能多地吞咽着，停下来吧唧着嘴，品味着她母乳那甜美如花蜜般的味道——你可能得让她保持这个样子，就为了享受这乳汁带来的简单快乐。");
         outputText("[pg]菲拉的下臂抓住了你的后脑勺，让你觉得她是在为孩子们保留这些储备。然而，她并没有试图把你拉开，而是猛烈地把你的脸压在她的乳房上。你的脸贴在她的乳房上，增加的压力导致更多的乳汁流入你的嘴里，你听到菲拉比以前更清晰的愉悦叹息声——天哪，这些东西里到底有多少？你耸耸肩，继续喝了一会儿，只在她的另一只小手引导你到另一侧乳房时才稍微停顿一下，因为你正在吸吮的那一侧已经被吸干了。");
         outputText("[pg]一旦你从菲拉的乳房上离开，你就能看出她已经不在乎自己怀孕多久了；她想要你，她需要你。你咕咕叫的肚子大声抗议；做爱时抽筋可不是闹着玩的，但你的下半身不可避免地战胜了你的肠胃。不管抽不抽筋，是时候[say: 玩玩了。]");
         if(get_silly())
         {
            outputText("[pg]你大声打了个嗝，希望能消除肚子里的咕噜声。菲拉接着也打了一个像狮子一样的嗝。声音在整个蚁群中回荡，你觉得你甚至感觉到房间的墙壁都在震动。你敬畏地张大了下巴，在震惊的沉默中看着菲拉。[say: 怎么了？就因为我是女王，并不意味着我必须表现得像个女王。如果你觉得这很棒，你应该听听我打嗝。]");
            outputText("[pg]快速检查一下你的性欲，你会发现尽管刚刚发生了什么，你仍然有心情。");
         }
         outputText("[pg]把你的手移到她坐着的双腿之间，它就像一位尊贵的客人一样受到欢迎。你感觉到她已经完全湿透了——几缕细细的液体甚至已经停留在她的双腿之间——你的手很容易就找到了她长长的阴蒂，在戏弄了她一会儿之后，你的手指插入了她。");
         outputText("[pg][say: 哦，不——嗯嗯嗯！]她试图警告你的声音戛然而止，但已经太迟了。");
         outputText("[pg]你感觉到她的阴道几乎要夹碎你的手指，一阵老虎钳般的收缩让她全身紧绷。这感觉简直就像被摔跤手锁住了一样；你痛苦地皱起眉头，原本以为会很舒服的事情变成了折磨。没过多久，收缩就平息了，菲拉大声呻吟着，她的阴道松开了你的手指，同时涌出一小股润滑液。");
         outputText("[pg]你迅速瞥了一眼她腹部的末端，只见一颗覆盖着糖浆般分娩粘液的卵慢慢撑开她的褶皱，轻轻滑落到地上。当你把手指从她泥泞不堪的小穴中抽出时，你抬起头看向菲拉的脸。还没等你思考下一步该怎么做，菲拉就猛地凑过来，在你的嘴唇上印下了一个坚定的吻。");
         if(get_player().cor > 50)
         {
            outputText("[pg](哦，太棒了，又来了……)");
         }
         outputText("[pg]突然，就像两块磁铁将相反的磁极锁在一起一样，你们的心智连接在了一起。起初这对你来说非常不舒服，与之前几次不同。体验那种持续分娩的感觉迅速占据了你脑海的最前沿。");
         outputText("[pg]你甚至能感觉到菲拉的卵处于什么阶段，以及大约什么时候会引起最后、也是最强烈的一次宫缩。这种行为的强度几乎让人无法忍受，但你能感觉到菲拉的心智在帮助你应对这些新的感觉，支持你并将你的注意力转移到与怀孕女王做爱更……令人愉悦的方面。");
         outputText("[pg]在你的心智稳定下来后，你感觉到菲拉的四只手臂迅速地将你脱光。一旦你赤身裸体，她看着你就像一只把一只特别肥胖的老鼠逼到角落的猫，带着饥渴的意图向你抛媚眼。她的三只手臂抓住你，把你拉近，同时她的臀部移动到座位的边缘。当她拥抱你时，她的第四只手引导你的阴茎进入她的阴道。");
         outputText("[pg]当[oneCock]进入她时，她坚硬的阴蒂几乎在它的顶部拖拽。一旦进入她的肉洞，微小的收缩感传遍她的全身，在她的阴道上下涌动，结果让你的阴茎感受到阵阵快感。你开始将臀部挺进她体内，每次都尽力深入，以便脉动的收缩感传遍你整个男根。很快就达到了狂热的速度，你的阴茎在她的体内进进出出，每一次粗暴的抽插都让她的阴蒂在你的肉棒顶部上下滑动。这种感觉简直太强烈了，但她介入并克制了你的身体释放高潮。");
         outputText("[pg]这不公平！你感觉到她的分娩宫缩即将来临，并断定你们可以互相玩这个游戏。尽管对此毫无经验，你还是设法忍住了她喘息的时刻。你能尝到她恼怒的挫败感，但你选择用你彻底的幸福感来代替这种感觉，你用双手抓住她肿胀的双乳，用力挤压，让乳汁喷射到你的胸前，你用嘴接住了一些落下的水滴。你的臀部仍然像疯子一样抽插，捣碎她的骨盆，因为她阴道里的脉动开始与你的抽插同步。");
         outputText("[pg]与心智的结合类似，你们的身体似乎也在共享信息。然后你感觉到了，就像菲拉一样突然。这种宫缩再也无法抑制了，一开始抑制它可能是一个错误。菲拉的整个身体紧紧地缠绕着你，她的四只手都在拉扯，把你压在她的胸前，导致你的阴茎深入到");
         if(get_player().balls > 0)
         {
            outputText("你的蛋蛋拍打着她光滑的骨盆。");
         }
         else
         {
            outputText("你的膝盖在她临时王座的边缘摩擦。");
         }
         outputText("[pg]通过连接，你能感觉到分娩的忙碌工作开始从菲拉的脑海中向下蔓延到她的身体。随着强度的增加，她的指甲无意识地掐进你的背部。菲拉用她下面的一双手臂抓住你的臀部，将你完全推入她的体内，让你的阴茎在完美的时机随着她的收缩撞击她小穴的最深处。");
         if(get_player().get_tallness() < 60)
         {
            outputText("[pg]这个动作实际上让你双脚离地，但以菲拉惊人的力量，你确信她能把你举起来。");
         }
         outputText("[pg]她小穴的内壁紧紧地包裹着你，让你能感觉到她体内的每一个细节。她的阴蒂变得如此坚硬，如果你们没有连接在一起，你可能会以为是一个小而钝的肉质夹子在挤压你的阴茎根部。随着收缩的过去，你们相连的心智分享着即将到来的高潮的双重快感。时间仿佛在你们和菲拉高潮前的这一刻凝固了。在渴望和满足的门槛上，你感觉你们俩已经变成了一个单一的意识；你们一起在那里停留了片刻，仿佛屏住了呼吸。当你们单一的心智似乎呼出一口长气时，你们的连接断开了，让你们俩都猛然回到了各自的身体和独立的意识中。");
         outputText("[pg]肉棒在她体内颤抖，她的小穴发出最后一次脉动，乞求你射在里面，重新开始整个怀孕的过程。当你把精液释放在她深处时，殖民地的走廊里回荡着你们同时发出的响亮呻吟；她的阴道随着你每次努力授精而急切地收缩，意图将你的精液吸入深处，为你所有的精子提供受精的机会。当她完成自己的高潮时，大量的液体从她的乳房、小穴和腹部溢出。");
         outputText("[pg]你感觉到收缩迅速穿过她腹部的各个阶段，就像连发弩一样，三枚卵突然从她的末端掉落。");
         outputText("[pg][say:我……我……]她喘息着，试图平复呼吸。还没等她说完，她就倒在了你的怀里，仍然坐在王座上，而你还在她体内。");
         if(get_player().cor < 75)
         {
            if(get_player().get_str() >= 70)
            {
               outputText("[pg]你鼓起最后的力气把她抱到床上，努力克服交配的消耗和她腹部的重量。终于到了她的床上，你把她放下，在她进入梦乡时轻轻吻了吻她的嘴唇。你悄悄地收拾好东西，回到了营地。");
            }
            else
            {
               outputText("[pg]可怜的女孩一定累坏了。你机智地从她体内抽出，尽最大努力试图把菲拉从王座上拖下来放到床上。即使你用尽全力，她现在的状态也太重了。你的一个孩子刚好路过，看到了你的困境。他发出一连串的咔哒声，在隧道里回荡。过了一会儿，一群你的孩子出现了，你们一起设法把菲拉弄到了床上。你摸了摸孩子们的头以示感谢，然后悄悄地收拾好东西，回到了营地。");
            }
         }
         else
         {
            outputText("[pg]你叹了口气，对她敢在你身上晕过去感到无奈。你从她体内抽出，将她扶起。精液顺着她的大腿滴落，她摇摇晃晃地站稳了脚跟。");
            outputText("[pg]你命令她向前走，确保像对待一个生育母狗一样羞辱她。");
            outputText("[pg]在摇摇晃晃地走了一会儿后，你大发慈悲地允许菲拉瘫倒在坚硬的床上。你停顿了片刻，打量着你怀孕的小婊子。你快速地提醒她最好准备好迎接下一轮，然后把她留在你制造的烂摊子里，自己回营地去了。");
         }
         get_player().orgasm("Generic");
         get_player().refillHunger(20);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function driderDoublePhllaMount() : void
      {
         clearOutput();
         get_images().showImage("ant-camp-ant-mounted-by-drider");
         outputText("你再也无法控制自己，撕下你的[armor]冲向菲拉的床，当她抬头看你时，你让她大吃一惊。带着诱人的微笑，你把她按倒，把你的产卵管涂抹在她的肉洞上。");
         outputText("[pg]你的声音穿透她的身体，点燃了她的性欲，你告诉她，你觉得她体内有更多的卵会对她有好处。弯曲她的臀部，让你有完美的角度，菲拉在无法控制的期待中呜咽。");
         outputText("[pg]作为一个不让“女王”等待的人，你向前猛冲，把你充满卵的附肢塞进她仍然湿润的阴道，越来越深，在她的体内释放你润滑的粘液，直到你无法再深入。现在紧紧地在她的深处，你的产卵管在性高潮中抽搐，因为你的有效载荷进入了她的身体，让你在性狂怒中尖叫，因为你再次让菲拉怀上了你的卵。");
         outputText("[pg][say: 哦，天哪！我-我需要更多！填满我！用你的孩子填满我！呱啊啊啊啊啊啊！]她狂怒地嚎叫。你咧嘴一笑，对你把菲拉逼到什么程度感到满意，把她变成了一个渴望卵的荡妇。她的眼睛变得呆滞，翻白眼，脸上带着感官毁灭的表情。");
         outputText("[pg]最后，你的卵供应耗尽了，你从蚂蚁形态中挣脱出来，小心翼翼地走过破碎和即将破碎的蛋壳，因为你的孩子们跑到他们母亲营养丰富的乳房前。菲拉只是在抱着肚子时发出深深满足的咕咕声，几乎没有注意到那些为了谁先吸奶而争吵的小蜘蛛。");
         get_player().orgasm("Ovi");
         get_player().dumpEggs();
         pregnancy.knockUp(15,192);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function dontLickAntButt() : void
      {
         clearOutput();
         phyllaSprite();
         get_images().showImage("ant-camp-lay-egg-not-licked");
         outputText("你犹豫地告诉菲拉，你不太习惯舔她的私处……尤其是在它们还在渗出分娩液的时候。不过你反应很快，向你的爱人保证，并告诉她你愿意按摩她的私密部位。一个温暖的微笑在她的脸上蔓延开来；她很高兴尽管你有所保留，但你愿意以一种对你们俩都有效的方式帮助她。");
         outputText("[pg][say: 谢、谢谢你……]她低语道，当你走到她身后时，她呼吸中夹杂着期待和需求。当你触摸她的缝隙时，她喘息着，你柔软的触摸让她不寒而栗。分娩的阵痛不久后就开始了，不再受菲拉意志的控制。[say: 还要……哦，天哪，还要……]她呜咽着，随着肌肉的每一次抽搐而呻吟。你用拇指开始以打圈的方式按摩外侧开口，尽你所能温柔地帮助菲拉将你们的孩子带到这个世界上。");
         outputText("[pg]刺激的过程持续了漫长而充满呻吟的几分钟，直到伴随着一声发自内心的哭喊，装着你们新生儿的球体从菲拉的腹部滑出。你的蚁人爱人喘着粗气，松了一口气，感谢你，但提醒你，她还有一大窝卵需要产下。你微笑着，在她的孔口处重新开始努力，伴随着菲拉深情的喘息……");
         outputText("[pg]大半个小时后，你们俩在深情的拥抱中躺在菲拉的床上；你把疲惫的蚁人紧紧抱在怀里，她享受着你手指穿过她头发的温柔感觉。");
         outputText("[pg][say: 谢谢你。你在这里对我来说意义重大。]她倾诉道。你告诉她这根本不麻烦；你不会错过这个欢乐的时刻。菲拉偷偷在你脖子上印下一个轻柔的吻，并用双臂紧紧抱住你。[saystart]我现在应该可以自己应付了");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,874) > 1)
         {
            outputText("；孩子们可以照顾那些卵，而我真的需要休息一下");
         }
         outputText("。你应该回去履行你的职责了……不-不过如果你晚点再来，我也不会介意的……[sayend]");
         outputText("[pg]你对菲拉说你也许会接受她的提议，并在离开你精疲力竭的爱人去休养时眨了眨眼" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,874) > 2 ? "，经过你的几个孩子时，他们正把挤在地板上的一堆卵舀起来" : "") + "。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,889,6);
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,874,FlagDict_Impl_.arrayReadInt(_loc1_,874) + 1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function dickPhylla() : void
      {
         var _loc1_:int = get_player().biggestCockIndex();
         clearOutput();
         get_images().showImage("ant-camp-vagsex");
         outputText("你给了菲拉一个狡黠的眼神，表明你来这里不仅仅是为了聊天。当你开始脱下你的[armor]时，她看起来有些惊讶，也为你感到尴尬。注意到她在看，你脱下每件衣服的动作都慢了一点，让她的欲望逐渐累积。你诱惑地扔掉你的盔甲，将自己完全暴露在她面前。你可以看到她的眼睛睁得大大的，明显在贪婪地注视着你的身体特征。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,880) == 0)
         {
            outputText("[pg]你看到她突然意识到你已经一丝不挂了。菲拉迅速转过头去，但你看到她的眼睛仍然紧紧盯着你的命根子");
            if(get_player().cockTotal() > 1)
            {
               outputText("");
            }
            outputText("。");
            outputText("[pg][say:我……你想让我……？]");
            outputText("[pg]你打断了她，轻轻地把手放在她的后脑勺上，同时[eachcock]变得更加坚硬。你稍微用力，强迫菲拉的头低下，靠近[oneCock]的龟头。这时她明白了你的意思。");
         }
         else
         {
            outputText("[pg]抛开所有的矜持，她跑过来，迅速跪下，将你迅速变硬的肉棒含入嘴里，抵在她的舌头上。你感觉到她的嘴唇包裹住你的龟头，她开始上下摆动头部，尽最大努力将你尽可能多地吞入嘴里。");
         }
         outputText("[pg]一旦她让你足够坚硬，她就用她巨大的力量把你推倒仰卧——很明显她想先在上面。她用上面两只手抓住你的肩膀，用下面两只手引导你的肉棒对准她滴水的阴户。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,879) == 0)
         {
            outputText("[pg]菲拉弯曲她的腹部，让其下端沿着你肉棒的脊部滑下，在你的私处留下一层非常温暖透明的液体，让你感到一阵刺痛，舒服得呻吟起来。");
         }
         outputText("[pg]她下面的一只手开始慢慢套弄你的阴茎，同时另一只手开始抚摸她长长的阴蒂。即使你被压制着，你也能看到她的阴蒂开始变大，并从她的嘴唇间伸出来。[say:我能……我是说……我能把你……放进我里面吗？]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,883) >= 3)
         {
            outputText("她调皮地问道，完全知道你来这里就是为了这个。");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,883) == 0)
         {
            outputText("你迅速点了点头。");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,883) > 0)
         {
            outputText("[pg][say:这还用问吗？]你坏笑着问她；这让她也对你报以微笑。");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,883) >= 3)
         {
            outputText("[pg]她似乎正在失去一些羞涩，或者至少在你身边感到足够舒服，能够展现出更多的个性。");
         }
         outputText("[pg]你看着她为你张开双腿，引导你的肉棒进入她体内。当你的龟头进入她时，她发出一声微弱的呻吟。然后，为了让她高潮——因为你知道这很容易——你猛地向上挺动臀部，尽可能深地插入她体内。");
         outputText("[pg]当你的" + get_player().cockDescript(_loc1_) + "填满她时，她惊讶地睁大了眼睛。她发出一声幸福的尖叫，流出她的淫液，包裹着你的肉棒");
         if(get_player().balls > 0)
         {
            outputText("和蛋蛋");
         }
         outputText("沾满了她的爱液。");
         outputText("[pg]她毫不迟疑地开始在你身上扭动，骑乘着你的肉棒。你感觉到她小穴的肉壁正随着脉搏的跳动挤压着你的阴茎。每次你的肉棒深深插入她体内时，她都会以完美的角度摇摆臀部，让你体验到她阴道深处那充满节奏的紧致包裹。随着她臀部的起伏，菲拉的速度越来越快。她原本微弱的呻吟变成了毫不掩饰的尖叫，每一次抽插都让你们俩被快感的浪潮所淹没。");
         outputText("[pg][say: 我……这感觉……天哪！还要！] 你听到菲拉在狂喜的喘息和呻吟之间，徒劳地试图拼凑出一句完整的话。她向后仰起头，弓起背，将上面的手从你的肩膀移到你的腿上，开始像骑着一匹偷来的种马一样骑乘你。你瞥向双腿之间，看到她的阴蒂在肉褶间若隐若现，她的身体在你身上不断起伏。");
         outputText("[pg]你伸出手，轻轻捏住她那逐渐变硬的爱之豆。这让你的爱人发出愉悦的吼声，并暂时停止了对你的抽插。[say: 再用力点！求你了！] 她一边加快速度，一边恳求你。");
         if(get_player().cockTotal() >= 2 && get_player().cockTotal() <= 5)
         {
            if(get_player().hasVagina())
            {
               outputText("[pg]当菲拉取悦你的肉棒时，她用另一只手确保你的女性部位也得到了照顾。");
            }
            else
            {
               outputText("[pg]你看着菲拉，对她耸了耸肩，告诉她你不确定是否能做到，因为你有一些……“成员”感觉被冷落了。你的爱人带着一种调情又有些恼怒的表情，伸出手抓住了你那些未被爱抚的[cocks]。她一边轻声娇喘，一边开始套弄");
               if(get_player().cockTotal() == 2)
               {
                  outputText("它");
               }
               else
               {
                  outputText("它们");
               }
               outputText("慢慢地。");
            }
         }
         if(get_player().cockTotal() > 5)
         {
            if(get_player().hasVagina())
            {
               outputText("[pg]尽管她试图用所有的手去取悦尽可能多的肉棒，但即使在它们之间切换，对这个蚂蚁变形者来说也太难了。[say: 太多了；我照顾不过来！] 你指了指你的[vagina]，似乎在告诉她，她至少可以照顾你的三根肉棒和你湿润的小穴。");
            }
            else
            {
               outputText("[pg]尽管她试图用所有的手去取悦尽可能多的肉棒，但即使在它们之间切换，这项任务也显得过于艰巨。[say: 太多了；我只有这么多手！我能照顾四根，但剩下的现在只能先放着了。] 你叹了口气，但你知道这可能会是个问题，所以你告诉菲拉尽力而为。");
            }
         }
         if(get_player().hasVagina())
         {
            outputText("[pg][say: 看看你喜不喜欢这样！] 菲拉带着顽皮的攻击性低语道。她用一只空闲的手伸下去，捏住了你的[clit]。立刻，一阵强烈的快感席卷了你，你作为回应，也捏了捏她长长的阴蒂。你们俩异口同声地呻吟起来，然后看着对方，轻声笑着，大口喘着粗气。");
         }
         if(get_player().get_gender() >= 3)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,883) == 0)
            {
               outputText("[pg][say: 天哪，我得在这方面做得更好，竟然冷落了爱人的私处……让、让我来弥补。] 她在愉悦的呻吟中吐出这些话，对自己忘记了爱人其他的生殖器感到有些尴尬。为了弥补她的[say: 错误，] 菲拉毫不耽搁，尽其所能地取悦你身体的每一个部位。");
            }
            else
            {
               outputText("[pg][say: 你、你真的要这么做吗？把你所有的生殖器都用上？] 她在狂喜的呻吟中愉快地逗弄着你。你坏笑着，只是说有时她会忘记你所有的其他“朋友”。");
            }
         }
         outputText("[pg]你满意地用拇指和食指再次用力捏住她的爱之豆。[say: 哦，求你了，别停——！] 她试图说话，但呼吸被夺走——只有一声吃力的呻吟逃出唇间，你感觉到她的体内紧紧缠绕着你的肉棒。她身体的温暖让快感涌上你的阴茎。[say: 我需要……我需要更多……] 她喘着气说。你可以看到她的眼睛蒙上了一层奇怪的釉色。[say: 我需要你。在我的脑海里。现在。] 她绝望地说着，不顾一切地扑向你的脸，将她的嘴唇与你的贴在一起。");
         outputText("[pg]当她的舌头进入你的嘴里时，你感觉到你们的思想立刻同步了。你的眼睛翻白了片刻，然后又回到了现实，感受着她的需求，她的渴望，就像她感受着你的一样。你看到了你第一次骑乘她时的画面，你清楚地感觉到她想再来一次。你感觉到她体验着每一个细节，你肉棒在她体内的每一个轮廓。野蛮、原始的情感占据了你所有的感官，你的大脑试图处理这源源不断的陌生感觉、感官和想法。很难说在这一刻，到底是谁，真正地，在享受这场性爱。");
         outputText("[pg]菲拉的臀部放慢了速度，最终停止了在你身上的摇摆。想要改变姿势的陌生渴望迅速进入了你的脑海。菲拉咬着嘴唇，抬起臀部，发出一声轻柔的呻吟，你的龟头在退出她流着爱液的小穴时，摩擦着她的阴蒂。");
         outputText("[pg]菲拉转过身，背对着你，四肢着地……或者对她来说，是六肢着地。她把屁股翘到半空中，仿佛在恳求你骑上她；她与你连接的余味让你稍微了解了她渴望被你支配，被你操到喷射出生命之种的欲望。她的姿势是你唯一需要的动力，你移动臀部，从后面插入她。她的腹部向上抬起，她用其中一对较小的手臂为你将自己完全敞开。她转过头看着你，你在脑海中感觉到她，呼唤着你占有她，让你完全控制这一切。");
         outputText("[pg]领会了她的[say: 暗示，] 你将肉棒猛地插进她的小穴，确保尽可能深地进入。你最初的抽插发出了非常响亮的、黏糊糊的声音，你的肉棒进入了她湿透的通道。你们俩作为共享的意识，几乎因为这纯粹的感官超载而晕厥，无法同时承受她和你自己的快感。菲拉的头埋进了双手，发出了一连串结结巴巴的呻吟。她的臀部因狂喜而微微抽搐，开始慢慢地上下移动，她的身体绝望地乞求着更多的肉棒。");
         if(get_player().countCocksOfType(CockTypesEnum.TENTACLE) == 2)
         {
            outputText("[pg]菲拉对自己的努力感到满意，她的身体吸吮着你长长的肉棒，而你的另一根肉棒则深深地插在她的体内。当你撞击到她体内的敏感点，让她呻吟出声时，你能感觉到她温暖的呼吸从她包裹着你龟头的嘴唇间溢出。");
         }
         else if(get_player().countCocksOfType(CockTypesEnum.TENTACLE) > 2)
         {
            outputText("[pg]你不满足于仅仅一点口交的服侍，你让你的其他触手肉棒滑到她的手上，用力地拍打了一下，引得菲拉发出一声惊讶的轻哼。看到爱人的触手阴茎附肢抚摸着她的手背，她意识到自己还有一些[say: 余力]来服侍你。菲拉用枕头垫高身体，用手肘支撑着自己，开始抚摸和挑逗你的肉棒，在这个过程中诱出了一小股前列腺液。");
         }
         outputText("[pg]你满足了她身体的渴望，开始抽插她；你用她的腹部作为支撑，随着你的抽插，节奏变得非常短促有力，她把四只手臂都伸到身前以稳住自己。几乎每抽插一次，你都能感觉到她的身心都在向高潮攀升，你的脑海中也充满了想要射精的念头。她的小穴似乎在呼唤你填满它，随着你肉棒的每一次深入，它都夹得更紧。");
         outputText("[pg]再也忍不住了，你最后一次用力撞向她，尽可能深地插进去，将[oneCock]钉在菲拉体内，释放出滚烫的生命之种。当你紧紧抱住她的腹部时，你听到她发出一声满足的欢呼。颤抖的肉棒也让她达到了高潮，她温暖香甜的淫液洗刷着你的下半身。你感觉到她传达出体内吞咽你精液的感觉，她小穴的痉挛开始平息。");
         outputText("[pg]你们俩瘫倒在一起，浑身发热、流汗……而且黏糊糊的，打了一会儿瞌睡，直到一个小时后才醒来，因为精神共享而有些宿醉，也因为这场翻云覆雨而身体疲惫。");
         outputText("[pg]菲拉在你身边翻了个身，迷迷糊糊地说：[say:你应该多来看看我。我是说……我有时候挺想你的……]随着她慢慢从你们给彼此带来的短暂性高潮昏迷中恢复过来，她的羞涩又回来了。你说你会考虑的，并在穿衣服准备回营地时对她眨了眨眼，留下她热切地期盼着你下次再来占有她。");
         get_player().orgasm("Dick");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function demonPackDefeated(param1:Boolean) : void
      {
         playingHero = false;
         clearOutput();
         if(param1)
         {
            outputText("你出击了，最后一个恶魔砰的一声倒在地上。你在那里站了一秒钟，被死去的或失去知觉的恶魔包围着，感觉自己像个战神。然后你意识到，如果战神确实存在，他会生活在像这样恶魔般的位面上，所以为了避免侮辱他，你在开始搜查尸体之前，把你的手从臀部拿开，把你的[legs]从恶魔首领的头上拿开。");
            if(int([DynStat.Lust(1)].length) == 0)
            {
               get_game().player.dynStats();
            }
            else if(int([DynStat.Lust(1)].length) == 1)
            {
               get_game().player.dynStats([DynStat.Lust(1)][0]);
            }
            else if(int([DynStat.Lust(1)].length) == 2)
            {
               get_game().player.dynStats([DynStat.Lust(1)][0],[DynStat.Lust(1)][1]);
            }
            else if(int([DynStat.Lust(1)].length) == 3)
            {
               get_game().player.dynStats([DynStat.Lust(1)][0],[DynStat.Lust(1)][1],[DynStat.Lust(1)][2]);
            }
            else if(int([DynStat.Lust(1)].length) == 4)
            {
               get_game().player.dynStats([DynStat.Lust(1)][0],[DynStat.Lust(1)][1],[DynStat.Lust(1)][2],[DynStat.Lust(1)][3]);
            }
            else if(int([DynStat.Lust(1)].length) == 5)
            {
               get_game().player.dynStats([DynStat.Lust(1)][0],[DynStat.Lust(1)][1],[DynStat.Lust(1)][2],[DynStat.Lust(1)][3],[DynStat.Lust(1)][4]);
            }
            else if(int([DynStat.Lust(1)].length) == 6)
            {
               get_game().player.dynStats([DynStat.Lust(1)][0],[DynStat.Lust(1)][1],[DynStat.Lust(1)][2],[DynStat.Lust(1)][3],[DynStat.Lust(1)][4],[DynStat.Lust(1)][5]);
            }
            else if(int([DynStat.Lust(1)].length) == 7)
            {
               get_game().player.dynStats([DynStat.Lust(1)][0],[DynStat.Lust(1)][1],[DynStat.Lust(1)][2],[DynStat.Lust(1)][3],[DynStat.Lust(1)][4],[DynStat.Lust(1)][5],[DynStat.Lust(1)][6]);
            }
            else if(int([DynStat.Lust(1)].length) == 8)
            {
               get_game().player.dynStats([DynStat.Lust(1)][0],[DynStat.Lust(1)][1],[DynStat.Lust(1)][2],[DynStat.Lust(1)][3],[DynStat.Lust(1)][4],[DynStat.Lust(1)][5],[DynStat.Lust(1)][6],[DynStat.Lust(1)][7]);
            }
            else if(int([DynStat.Lust(1)].length) == 9)
            {
               get_game().player.dynStats([DynStat.Lust(1)][0],[DynStat.Lust(1)][1],[DynStat.Lust(1)][2],[DynStat.Lust(1)][3],[DynStat.Lust(1)][4],[DynStat.Lust(1)][5],[DynStat.Lust(1)][6],[DynStat.Lust(1)][7],[DynStat.Lust(1)][8]);
            }
            else if(int([DynStat.Lust(1)].length) == 10)
            {
               get_game().player.dynStats([DynStat.Lust(1)][0],[DynStat.Lust(1)][1],[DynStat.Lust(1)][2],[DynStat.Lust(1)][3],[DynStat.Lust(1)][4],[DynStat.Lust(1)][5],[DynStat.Lust(1)][6],[DynStat.Lust(1)][7],[DynStat.Lust(1)][8],[DynStat.Lust(1)][9]);
            }
            else if(int([DynStat.Lust(1)].length) == 11)
            {
               get_game().player.dynStats([DynStat.Lust(1)][0],[DynStat.Lust(1)][1],[DynStat.Lust(1)][2],[DynStat.Lust(1)][3],[DynStat.Lust(1)][4],[DynStat.Lust(1)][5],[DynStat.Lust(1)][6],[DynStat.Lust(1)][7],[DynStat.Lust(1)][8],[DynStat.Lust(1)][9],[DynStat.Lust(1)][10]);
            }
            else if(int([DynStat.Lust(1)].length) == 12)
            {
               get_game().player.dynStats([DynStat.Lust(1)][0],[DynStat.Lust(1)][1],[DynStat.Lust(1)][2],[DynStat.Lust(1)][3],[DynStat.Lust(1)][4],[DynStat.Lust(1)][5],[DynStat.Lust(1)][6],[DynStat.Lust(1)][7],[DynStat.Lust(1)][8],[DynStat.Lust(1)][9],[DynStat.Lust(1)][10],[DynStat.Lust(1)][11]);
            }
            else if(int([DynStat.Lust(1)].length) == 13)
            {
               get_game().player.dynStats([DynStat.Lust(1)][0],[DynStat.Lust(1)][1],[DynStat.Lust(1)][2],[DynStat.Lust(1)][3],[DynStat.Lust(1)][4],[DynStat.Lust(1)][5],[DynStat.Lust(1)][6],[DynStat.Lust(1)][7],[DynStat.Lust(1)][8],[DynStat.Lust(1)][9],[DynStat.Lust(1)][10],[DynStat.Lust(1)][11],[DynStat.Lust(1)][12]);
            }
            else if(int([DynStat.Lust(1)].length) == 14)
            {
               get_game().player.dynStats([DynStat.Lust(1)][0],[DynStat.Lust(1)][1],[DynStat.Lust(1)][2],[DynStat.Lust(1)][3],[DynStat.Lust(1)][4],[DynStat.Lust(1)][5],[DynStat.Lust(1)][6],[DynStat.Lust(1)][7],[DynStat.Lust(1)][8],[DynStat.Lust(1)][9],[DynStat.Lust(1)][10],[DynStat.Lust(1)][11],[DynStat.Lust(1)][12],[DynStat.Lust(1)][13]);
            }
            else if(int([DynStat.Lust(1)].length) == 15)
            {
               get_game().player.dynStats([DynStat.Lust(1)][0],[DynStat.Lust(1)][1],[DynStat.Lust(1)][2],[DynStat.Lust(1)][3],[DynStat.Lust(1)][4],[DynStat.Lust(1)][5],[DynStat.Lust(1)][6],[DynStat.Lust(1)][7],[DynStat.Lust(1)][8],[DynStat.Lust(1)][9],[DynStat.Lust(1)][10],[DynStat.Lust(1)][11],[DynStat.Lust(1)][12],[DynStat.Lust(1)][13],[DynStat.Lust(1)][14]);
            }
            else if(int([DynStat.Lust(1)].length) == 16)
            {
               get_game().player.dynStats([DynStat.Lust(1)][0],[DynStat.Lust(1)][1],[DynStat.Lust(1)][2],[DynStat.Lust(1)][3],[DynStat.Lust(1)][4],[DynStat.Lust(1)][5],[DynStat.Lust(1)][6],[DynStat.Lust(1)][7],[DynStat.Lust(1)][8],[DynStat.Lust(1)][9],[DynStat.Lust(1)][10],[DynStat.Lust(1)][11],[DynStat.Lust(1)][12],[DynStat.Lust(1)][13],[DynStat.Lust(1)][14],[DynStat.Lust(1)][15]);
            }
            else if(int([DynStat.Lust(1)].length) == 17)
            {
               get_game().player.dynStats([DynStat.Lust(1)][0],[DynStat.Lust(1)][1],[DynStat.Lust(1)][2],[DynStat.Lust(1)][3],[DynStat.Lust(1)][4],[DynStat.Lust(1)][5],[DynStat.Lust(1)][6],[DynStat.Lust(1)][7],[DynStat.Lust(1)][8],[DynStat.Lust(1)][9],[DynStat.Lust(1)][10],[DynStat.Lust(1)][11],[DynStat.Lust(1)][12],[DynStat.Lust(1)][13],[DynStat.Lust(1)][14],[DynStat.Lust(1)][15],[DynStat.Lust(1)][16]);
            }
            else if(int([DynStat.Lust(1)].length) == 18)
            {
               get_game().player.dynStats([DynStat.Lust(1)][0],[DynStat.Lust(1)][1],[DynStat.Lust(1)][2],[DynStat.Lust(1)][3],[DynStat.Lust(1)][4],[DynStat.Lust(1)][5],[DynStat.Lust(1)][6],[DynStat.Lust(1)][7],[DynStat.Lust(1)][8],[DynStat.Lust(1)][9],[DynStat.Lust(1)][10],[DynStat.Lust(1)][11],[DynStat.Lust(1)][12],[DynStat.Lust(1)][13],[DynStat.Lust(1)][14],[DynStat.Lust(1)][15],[DynStat.Lust(1)][16],[DynStat.Lust(1)][17]);
            }
            else if(int([DynStat.Lust(1)].length) == 19)
            {
               get_game().player.dynStats([DynStat.Lust(1)][0],[DynStat.Lust(1)][1],[DynStat.Lust(1)][2],[DynStat.Lust(1)][3],[DynStat.Lust(1)][4],[DynStat.Lust(1)][5],[DynStat.Lust(1)][6],[DynStat.Lust(1)][7],[DynStat.Lust(1)][8],[DynStat.Lust(1)][9],[DynStat.Lust(1)][10],[DynStat.Lust(1)][11],[DynStat.Lust(1)][12],[DynStat.Lust(1)][13],[DynStat.Lust(1)][14],[DynStat.Lust(1)][15],[DynStat.Lust(1)][16],[DynStat.Lust(1)][17],[DynStat.Lust(1)][18]);
            }
            else
            {
               if(int([DynStat.Lust(1)].length) != 20)
               {
                  throw "Too many rest arguments";
               }
               get_game().player.dynStats([DynStat.Lust(1)][0],[DynStat.Lust(1)][1],[DynStat.Lust(1)][2],[DynStat.Lust(1)][3],[DynStat.Lust(1)][4],[DynStat.Lust(1)][5],[DynStat.Lust(1)][6],[DynStat.Lust(1)][7],[DynStat.Lust(1)][8],[DynStat.Lust(1)][9],[DynStat.Lust(1)][10],[DynStat.Lust(1)][11],[DynStat.Lust(1)][12],[DynStat.Lust(1)][13],[DynStat.Lust(1)][14],[DynStat.Lust(1)][15],[DynStat.Lust(1)][16],[DynStat.Lust(1)][17],[DynStat.Lust(1)][18],[DynStat.Lust(1)][19]);
            }
         }
         else
         {
            outputText("恶魔们停止了攻击，伸出手来触摸你的身体。有些人已经在自慰了，就像这是世界上唯一的事情一样，你知道现在，如果你愿意，你可以让这里的每一个人都操你。");
         }
         doNext(consolePhylla);
      }
      
      public function declineAntSexForNow() : void
      {
         clearOutput();
         outputText("你的大脑终于清醒过来，摇了摇头。你只是告诉她今天不是个好日子。");
         outputText("[pg][say: 我……我明白。]她低下头，沉默了一会儿，然后又看向你，紧张地笑着，继续说道，[say: 请随时再来。]");
         outputText("[pg]你安慰地告诉她，在她的嘴唇上印下一个吻，然后穿好衣服，启程返回你的营地。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,893,1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function cuntmuffinLingusPhyllaDickBig() : void
      {
         clearOutput();
         get_images().showImage("ant-desert-male-first-cunning");
         outputText("可悲的是，当你低头看着你的[cocks]时，你意识到试图用你那大得畸形的肉棒插入菲拉");
         if(get_player().cockTotal() > 1)
         {
            outputText("");
         }
         outputText("是行不通的。菲拉的眼睛开始流泪，因为她也意识到她的第一次还没开始就结束了。");
         outputText("[pg]不想让她的初夜泡汤，你开玩笑地把她推倒在铺着垫子的地板上，让她屁股着地。当她努力理解你打算做什么时，困惑席卷了她；当你躺在她身边时，这种困惑进一步加剧了。你尴尬地翻身仰面躺下，尽力不撞倒任何家具。");
         outputText("[pg][say: 你、你在干什么？]她问道，因为她无法得到传统的初次性爱而有些沮丧。你挺起你的[cocks]，你");
         if(get_player().longestCockLength() < 69)
         {
            outputText("调整你的臀部，让");
            if(get_player().cockTotal() == 1)
            {
               outputText("它指向");
            }
            else
            {
               outputText("它们指向");
            }
            outputText("天花板，把它们移开，为你接下来的计划腾出空间。");
         }
         else
         {
            outputText("调整你的臀部，让");
            if(get_player().cockTotal() == 1)
            {
               outputText("它");
            }
            else
            {
               outputText("它们");
            }
            outputText("对准门口。");
         }
         outputText("你坏笑着勾了勾手指，示意菲拉过来。菲拉疑惑地看了你一会儿，然后恍然大悟。她睁大眼睛，娇嗔着向你爬来。");
         outputText("[pg]菲拉如释重负地咯咯笑了起来，既是因为她缺乏经验，也是因为她没能领会你的暗示而感到尴尬。她一边走向你一边脱下衣服，臀部和腹部性感地摇曳着，你可以看到她长长的阴蒂从阴户的褶皱中伸出来。透明的爱液从她的双腿间闪烁着光芒。当她绕着你走动时，你看到她下面那对手臂消失在双腿之间。然后，菲拉出现在你的头顶上方。她的臀部移动，停在你的上方，面向外侧，她湿润小穴的温暖席卷了你，你清楚地看到她那长长诱人的阴蒂，乞求你舔舐她的敏感点。你伸出手，抓住她甲壳状的腿。你慢慢地把她的臀部拉下来，把嘴贴在她阴唇光滑的褶皱上。她令人陶醉的香气充满了你的鼻腔，让你舒服得翻起了白眼。");
         outputText("[pg]她低下头，把较大的一双手放在你的肩膀上，调皮地把你推倒在床上。菲拉带着歉意，用她的一只小手伸向你的脸，似乎想给你看什么东西。她的小手上沾满了似乎是她自己的爱液。她把你按在原地，轻轻地把手放在你的脸颊上，慢慢地用沾满爱液的手指滑过你的下巴，留下一道散发着甜美香气的痕迹。");
         if(get_silly())
         {
            outputText("[pg]你听到她低语着“辛巴”，同时用手指抚摸你的额头。你询问这是什么意思；因为它尴尬地打破了你正在营造的紧张气氛。她告诉你，在她的母语中，这是“傻瓜”的意思。你挑起一根眉毛，表示疑问。");
         }
         outputText("[pg]菲拉叹了口气，指着你巨大的肉棒。很明显，她仍然因为你无法正常插入她而感到沮丧。");
         outputText("[pg]为了结束她的挑逗，她的手指顺着你的鼻梁滑下，停在你的嘴唇上。她体液的香气和温暖再次让你发狂。你感觉到你原本就坚硬的肉棒变得更加僵硬，当你吸入她的甜美时，你的身体陷入了发情状态。你那大得不似人类的肉棒");
         if(get_player().cockTotal() == 1)
         {
            outputText("抽动着，上下摆动");
         }
         else
         {
            outputText("抽动着，上下摆动");
         }
         outputText("，大声地摩擦着");
         if(get_player().longestCockLength() < 69)
         {
            outputText("天花板");
         }
         else
         {
            outputText("走廊的墙壁");
         }
         outputText("。");
         outputText("[pg][say: 我没想到……那会管用……] 菲拉在你耳边甜甜地低语，笑得像个傻瓜。");
         outputText("[pg]菲拉将手从你的肩膀上移开，对你微微点头并露出微笑，示意你可以占有她的小穴了。你毫不迟疑，迅速凑上前，用嘴唇含住她的一部分阴唇。在你上方，菲拉在你接触她的瞬间发出了一声少女般的娇喘。当你舔舐她时，她的两只手抚摸着你的头发，另外两只手则固定住你的头部。你咧嘴笑着，嘴里依然含着她的阴唇，将舌头探入她的体内，在里面释放出一连串快速的弹拨。她体内的味道让你更加沉浸在发情中。就在这时，当你的舌头在菲拉体内越探越深时，你感觉到一个非常钝的物体戳到了你的鼻子。你意识到她的阴蒂已经伸出包皮将近2英寸，那根长长的粉色肉棒正乞求着你的关注。你伸出手，用手指用力捏住它。作为直接的回应，菲拉大声呻吟，并用双腿夹紧了你的头。");
         if(get_player().isGoo())
         {
            outputText("[pg]一个念头闪过你的脑海，你的脑海中充满了她疯狂地在你的脸上摩擦的画面。意识到她可能会喜欢一个稳固的“底座”，你将自己的一部分质量向上移动到她的腿部，并将她的下半身包裹进你稍微变薄和变形的身体中。菲拉惊讶地低头看着你的举动，但当她明白你的意图后，她赞许地哼了一声。");
         }
         outputText("[pg]菲拉闭上眼睛享受你的努力，发出一声可怜的呻吟，同时调整姿势，让自己更好地贴合你的脸。一旦她找到了最佳位置，你发现你的脸被夹在她的阴户和柔软的地板之间，这位焦躁的公主完全打算把你留在那儿，直到你完成你的职责。");
         outputText("[pg]得到她的暗示后，你将舌头从她体内抽出，用手掰开她的阴唇，然后开始用舌尖挑逗她长长的阴蒂，让你柔软但带有颗粒感的舌头沿着她爱之按钮的整个长度滑动。");
         if(get_player().tongue.type == 1)
         {
            outputText("你用分叉的舌头肌肉从她阴蒂的顶端一直滑到根部。随着你那带有纹理的触手向下移动，你像蟒蛇一样缠绕住她长长的阴蒂的其余部分。当你的分叉到达她阴蒂的包皮时，你快速地卷起并弹拨舌尖。她拉扯着你的头发，在咬牙切齿的呻吟中大口喘息着。");
         }
         outputText("[pg]当你舔过她阴蒂包皮附近的一个特定位置时，你的爱人嘴里发出了一声惊讶、压抑的呻吟。出于好奇，你“原路返回”再次舔过那个位置。菲拉再次发出不受控制的狂喜呻吟，这表明你找到了一个敏感点。你对着她的阴道半哼半叹，心里很清楚在这个区域进一步“调查”会让菲拉像一只被困在蜘蛛网里的虫子一样。当菲拉发现你找到了她的弱点时，她紧张了起来。你听到她恳求你把注意力集中在她整个僵硬的肉核上。显然，她不知道这会有多强烈，也不太想知道。但你不能放过这个机会！伴随着一声俏皮的战吼，你开始攻击她的敏感点。你立刻开始舔舐并用舌头猛烈地撞击它，仿佛没有明天一样。");
         outputText("[pg]你听到她试图说些什么，但她的身体已经接管了她的思想。她沉浸在呻吟和呜咽中，将大腿抵在你的肩膀和头上，猛烈地前后摇晃你被困住的头，同时将臀部压在你的脸上摩擦。你不顾她其他的欲望，贪婪地攻击她的阴蒂；她会克服她的疑虑，并看到你的“技巧”绰绰有余。抬头望去，你看到她的脸上写满了狂喜。");
         outputText("[pg]菲拉很快开始更用力、更快地将她的阴蒂在你的嘴上摩擦。用更多的爱液浸透你已经湿透的脸。她疯狂地扭动臀部以获得更多的快感。");
         outputText("[pg]照这个速度，她很快就会达到高潮，所以你最好让这个结局令人难忘。你用手指抵住她的阴蒂，挑逗着她的阴唇，开始以闪电般的速度揉搓。菲拉几乎瞬间失去了平衡，向后跌倒在你的[cocks]上");
         if(get_player().isGoo())
         {
            outputText("，当她挣脱时，从你的身体中翻滚出来");
         }
         outputText("。她伸出一只手，试图喘口气。你不顾她的反应，继续你无情的攻势，她的双腿在你的头顶上不受控制地抽搐，就像一只被抚摸肚子的狗。菲拉尖叫着，似乎语无伦次地嘟囔着什么，直到她用大腿像老虎钳一样夹住你的头。感觉到她的阴道肌肉在你的舌头上痉挛和收紧，你注意到了高潮的信号。伴随着最后一次身体收缩的脉动，菲拉弓起背，在性高潮的极乐中咆哮。当她的高潮席卷你时，你满怀期待地张开嘴。她的爱液似乎永无止境，一阵接一阵地喷射出来。你至少吞下了两口，然后转过头，却感觉到更多的液体溅在你的脸颊上。你的蚁人爱人依然紧紧地把你夹在她的双腿之间，继续摩擦并将汁液喷洒在你的[face]上。");
         outputText("[pg]菲拉显然是个潮吹高手，无论是量还是力度。你决定最好在心里记下这一点，留待下次使用。精疲力竭的菲拉瘫倒在你的肉棒上");
         if(get_player().cockTotal() > 1)
         {
            outputText("");
         }
         outputText("大口喘着粗气，仿佛刚刚经历了一场高潮铁人三项。当你叹气时，你能听到她发出似乎难以置信的咯咯笑声。[say: 呵呵……我没想到我能做到……那个，]她娇嗔道，调皮地抬头看着你。[saystart]只是……你能缩小");
         if(get_player().cockTotal() == 1)
         {
            outputText("这个怪物");
         }
         else
         {
            outputText("这些怪物");
         }
         outputText("吗？我的意思是，我不是在抱怨！但我……只是……我是说……你……在我里面，[sayend]她害羞地说道，显然想要一些更……传统的东西。");
         dynStats(DynStat.Lust(get_player().maxLust(),DynStatOp.Eq));
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,925,1);
         menu();
         addButton(0,"继续",waifuQuestOver);
      }
      
      public function corruptPhyllaEndings() : void
      {
         clearOutput();
         var _loc1_:int = get_player().smallestCockIndex();
         get_images().showImage("ant-camp-give-corrupt-bj-cum");
         outputText("[say:一个连鸡巴都不会吸的骚货……还能有比这更糟的吗？]你揉着鼻梁暗自思忖。你告诉这只天真的小蚂蚁，她必须学会怎么好好吸鸡巴，哪怕这会要了她的命。事已至此，你已经深陷其中——不如把她调教成个可用之才。你命令她集中注意力，抬起她的脸，将你的" + get_player().cockDescript(_loc1_) + "悬在她的唇边，用你的前列腺液涂满她的嘴唇。她试图转头躲开，但你抢先一步做出了反应。你固定住她的头，告诉她这正是你想要的。");
         outputText("[pg][say:张大嘴！]你强硬地命令她。看到你用了“严肃的语气”，菲拉立刻照做。你将肉棒滑入，重重地抵在她的舌头上。你坏笑着，指示你的性玩具闭上嘴，紧紧包住你的肉棒；你可不想操一个像地精母体小穴一样的洞。菲拉顺从了，但又退开了一点，犹豫地问她是否");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,880) == 1)
         {
            outputText("达到了你想要的效果。");
         }
         else
         {
            outputText("比上次有进步。");
         }
         outputText("[pg]你粗暴地抓住她的后脑勺，把她重新按回你的阴茎上，以此来确认她的进步。你用冷漠的语气讥讽地告诉她，这就是她每次面对你时应有的反应。");
         outputText("[pg]菲拉对这种粗暴的对待发出一声呻吟，她显然不习惯被如此粗鲁地对待。你的" + get_player().cockDescript(_loc1_) + "在她的嘴里前后猛冲，摩擦着她的脸颊和舌头。你的阴茎似乎有自己的意识，你不知怎么地设法让她的舌头缠绕在你的阴茎上，你很清楚菲拉自己缺乏这种技巧。这位小女王即将迎来一场关于如何取悦主人的粗暴觉醒。");
         outputText("[pg]随着你继续无情地操弄她娇嫩的小脸，菲拉的嘴里传出一阵阵沉闷的呻吟。你的小荡妇正尽力跟上你的抽插，但最终还是失败了。也许她需要一点动力？你抽出你的" + get_player().cockDescript(_loc1_) + "，告诉她如果她不用手指抠她紧致的小穴，她就再也不能吸你的老二了。为了满足你的欲望，她绝望地迅速把手伸向自己的小穴，像拼了命一样用手指抠弄那个小骚穴。几秒钟内，你就看到她长长的阴蒂凸起，乞求着被触摸。");
         if(get_player().cockTotal() > 1)
         {
            outputText("[pg]你喘息了片刻，要求菲拉照顾");
            if(get_player().cockTotal() == 2)
            {
               outputText("你的另一根阴茎");
            }
            else
            {
               outputText("你剩下的阴茎");
            }
            outputText("如果她愿意[say:行行好]的话。她热情地伸出四只手，紧紧握住你的阴茎。菲拉嘟囔着什么，但心不在焉地意识到你的阴茎还在她嘴里，于是放弃了她想说的话。");
         }
         if(get_player().hasVagina())
         {
            outputText("[pg]你问菲拉能不能顺便照顾一下你的女性特征。菲拉把她的一只小手臂伸到你的双腿之间，摩擦着你的[clit]。她用手指抚摸你的阴唇，然后插入你的体内。菲拉开始勤奋地转动手腕，同时头部上下摆动。");
         }
         outputText("[pg]你祝贺她迅速听从了你的意愿，然后把你的" + get_player().cockDescript(_loc1_) + "猛地塞回她的嘴里，再次继续操她的脸。菲拉开始努力，她的头部和舌头与你的臀部配合。很快她就把你逼到了高潮的边缘。你下达了最后一道指令，问菲拉是否准备好接受你的种子。不过，由于你继续粗暴地操她的嘴，她没有机会回答。");
         outputText("[pg][say:怎么？！]你厚颜无耻地大喊，确保你的喊声在墙壁上回荡。菲拉用呆滞的眼神抬头看着你，在你的阴茎后面发出一声轻柔的、感激的呻吟。你装聋作哑，决定再问她一次，告诉她你听不太[say:清楚]。菲拉塞满的嘴里传出另一声呻吟，比上一次大得多。她的舌头快速地工作着，仿佛在乞求你用精液淹没她的嘴，用你咸咸的惊喜淹没她的味蕾。");
         outputText("[pg][say:这就对了，]你心里想着，把另一只手臂放下，按住她的后脑勺，像打水一样抽插着她。你下体的压力再也无法抑制；你身体渴望的高潮今天不会被拒绝！你的阴茎弯曲着，一阵狂喜席卷了你。你如释重负地咕哝着，释放出来，你的精液冲进她的嘴里，第一发就用你咸咸的精液填满了她渴望的喉咙。她的扁桃体承受了第二发的冲击，接着是喉咙深处的第三发。你拔出来，把你痉挛的欲望之矛指向菲拉的脸，给了她一个");
         if(get_player().cumQ() < 10)
         {
            outputText("微小的");
         }
         else if(get_player().cumQ() < 100)
         {
            outputText("可观的");
         }
         else
         {
            outputText("巨大的");
         }
         outputText("颜射，用精液覆盖了她娇小的五官。");
         if(get_silly())
         {
            outputText("[pg]然而，你不断的喷射并没有停止。情况变得更糟了——糟透了！精液的流动根本无法控制，你的下体将怒火释放到菲拉的脸上。[say:哦，天哪！我停不下来了！哦，操！]你嚎叫着。");
            outputText("[pg]不过菲拉当然不介意，当你继续痛苦而折磨人的射精时，她让自己的身体沐浴在你的精液洪流中。疼痛让你疯狂的嚎叫变得更深沉、更持久，在整个殖民地回荡，你的身体像挤大豆包装一样挤压着你的下体，把你的精液全部倒在你饥渴的荡妇身上，直到你的");
            if(get_player().balls > 0)
            {
               outputText("[balls]");
            }
            else
            {
               outputText(get_player().cockDescript(_loc1_));
            }
            outputText("。不知为何，你成功通过了强韧检定，即使在极度疲惫中瘫倒在地，也依然保持着清醒没有晕过去。你和菲拉情不自禁地在你们的精液池中慢慢睡去，梦见你们两人沉迷其中的奇异快感。");
         }
         if(!get_silly())
         {
            outputText("[pg]在你射精的整个过程中，菲拉一直在套弄你的" + get_player().cockDescript(_loc1_) + "，仿佛在祈求你能再多射出一点。你抓住她的手，示意你已经射够了。从高潮中平复下来后，你感谢这个荡妇为你口交，然后坐在床上开始收拾散落的衣物。");
            outputText("[pg]然而，你意识到菲拉还没玩够她的阴蒂。你几乎忘了你一开始还让她自己玩弄自己。她背靠着你认为是[say:床头板]的垫子坐下，双腿大张，让你将她一览无余。你漫不经心地告诉她自己解决，带着骄傲和愉悦看着你的荡妇最终让自己达到高潮。她猛地弓起背，强迫自己跪起来，疯狂地揉搓着自己的小穴。她的淫液似乎肆意流淌，在身下汇聚成一滩。她高潮的呻吟声在你的脑海中回荡，她能听从并服从主人的命令，这给你带来了极大的喜悦。一旦你确定她已经结束了，你对她产生的淫液量感到惊讶，因为在她自己高潮很久之后，液体似乎还在从她的双腿之间喷射出来。你决定扶菲拉站起来；你可不能让你的爱人受伤或被冷落，不是吗？");
         }
         else
         {
            outputText("[pg]当你从临时的沉睡中醒来时，你感到背部传来一阵阵不适。当你累得要死的时候，睡在地板上听起来是个好主意，但当你从梦乡中醒来时，你总是会后悔。站起身来，你注意到你对菲拉房间造成的影响；她肯定要忙着清理这个地方了。你天真的爱人发出幸福的低吟，有那么一瞬间，你考虑把她留在地板上，自己去忙一天的正事。不过，当你的下半身再次涌起需求时，你能承受冷落爱人的代价吗？");
         }
         outputText("[pg]……你能吗？你再次沉思，思考着这个问题。在花了几分钟把菲拉扶到她称之为床的那堆现在已经湿透的垫子上后，你穿好你的[armor]，回到了地面。");
         get_player().orgasm("Generic");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function consolePhylla() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_phylla());
         get_images().showImage("ant-desesrt-console-phylla");
         outputText("当恶魔们逃过沙丘时，你整理思绪，审视着混乱的场景。你救下的女人在毁坏的推车下避难，试图隐藏自己。至少，她的上半身“隐藏”在里面，但她巨大的腹部和黑色的腿向外突出，暴露了她拙劣的隐身尝试。");
         if(get_player().lib >= 50)
         {
            outputText("在饱览了她光滑诱人的小穴后，由于她那不合身的缠腰布，她现在的姿势暴露无遗，你");
         }
         else
         {
            outputText("你");
         }
         outputText("你走过去，轻轻敲了敲她颤抖的腹部。令你惊讶的是，你原以为是皮肤的地方，实际上是一层层肤色的装甲板；非常坚硬，而且比真正的皮肤粗糙得多。这只蚁女在你的触碰下瑟缩了一下，猛地抬起头，惊恐地四处张望。你看着她那双杏仁状的大眼睛骨碌碌地转着，似乎在确认从藏身处出来是否绝对安全。");
         outputText("[pg]她慢慢地从推车后面爬出来，站在你面前。你估计她大概有五英尺半高，现在你能看清她那对极其坚挺的B罩杯乳房。奇怪的是，她的乳头很硬，至少突出了半英寸。你打量她时流露出的兴趣一定写在了脸上，因为她脸红了，迅速用两只较大的手臂遮住乳房——同时用较小的手臂按住她的遮阴布。");
         outputText("[pg]不想显得更无礼，你试图做个自我介绍，但这只蚁人只是歪着头，一脸茫然。你开始用夸张的肢体动作来表达你是谁以及你为什么在这里，在看起来像个傻瓜一样比划了一分多钟后，你突然看到这只蚁人的脑子里似乎有什么东西“咔哒”一声连上了。以惊人的速度，她扑向你，还没等你反应过来，她就在你的嘴唇上印下了一个结实的吻。你的抗议还没说出口，一股突如其来的画面就涌入了你的意识。");
         outputText("[pg]就好像你的大脑正受到不属于你自己的记忆的冲击。你看到沙漠深处有一座大山丘，以及一个庞大而黑暗的洞穴网络。在你的脑海中，白天瞬间变成黑夜，你看到一个个剪影从山丘中出现，其中一个悄悄地走向荒野。当这些最后的画面从你的脑海中褪去时，你感觉到你的意识被拉扯了一下，就好像你正在非常努力地回忆一段你早已忘记的记忆。这种拉扯很快变成了一种牵引，几秒钟内，你感觉到你自己的记忆被唤起了。你生命中最重要的时刻被带到了你脑海的最前方：你的家、朋友和家人的画面；你的任务和进入这片土地的经历；你简陋的营地和你打败过的各种怪物；每一个都依次从你的脑海中被拉出来。这种突如其来的信息转移几乎让你无法承受，就在你快要晕倒的时候，蚁女结束了这个吻。");
         outputText("[pg]你向后踉跄了几步，几乎完全摔倒，但蚁女设法接住了你。虽然她自己很瘦，但她的四只手臂却出奇地有力；即便如此，它们对缓解你的迷失感也起不了多大作用。当你努力摆脱眩晕感时，世界在天旋地转，女孩把你放到了地上。当你的思绪恢复到至少可以不用人扶就能坐起来时，你发现你的新朋友正站在你面前，脸上带着灿烂的笑容。你从她身上感觉到一种奇怪的亲切感，就好像你认识她一辈子了。这不可能；你再次摇摇头，试图理清思绪。这只雌性……蚁人突然转身，背对着你和推车冲刺离开，你都没来得及问她刚才发生了什么。你本想追上去，但她速度非常快，而你现在还很难站直。她把你留在这片荒芜的沙漠里，周围散落着无用的破烂，你对刚才发生的事情感到完全震惊。不过，环顾四周，你觉得自己对在这片沙漠中的位置有了更好的了解——你甚至可能知道如何找到蚁人吻你时你看到的那座大蚁丘。当你脑海中浮现出那个场景时，你不自觉地低声念出了一个名字：[say: 菲拉……]");
         outputText("[pg]你长长地叹了一口气。即使在你经历了这么多之后，这片土地仍然充满了惊喜。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,470,1);
         get_combat().cleanupAfterCombat();
      }
      
      public function bumpIntoTheAntColonyAfterStayHomePhylla() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_phylla());
         outputText("你沿着一条出奇熟悉的路径往下走，这条路通向菲拉的房间。一看到你出现在门口的影子，她立刻转过头来。");
         outputText("[pg][say: 咿！]她发出咔哒声——显然你把她从某个白日梦中吓了一跳。");
         outputText("[pg][say: 哦！[name]你回来了！我是说，我就知道你会回来找我的！我是说……你准备好让我去你的营地了吗？]菲拉急切地问道。环顾四周，你可以看出她已经把她所有的东西都打包好了，为她的“大搬迁”做准备。你不确定她是真的那么想加入你，还是只是想逃离她的母亲。一旦她注意到你在环顾四周，她继续说道。");
         outputText("[pg][say: 我不会占什么地方。在地上！我是说，我会在地下，我-我不会打扰任何人的。我-我会乖乖的……]");
         outputText("[pg]你考虑了一下。");
         menu();
         addButton(0,"来营地",getAntWaifuYoShit);
         addButton(1,"留在这里",tellPhyllaToStayTheFuckAtHomeThatCunt);
      }
      
      public function birfingSexWithAntsForDasLadies() : void
      {
         clearOutput();
         get_images().showImage("ant-camp-female-preg-");
         outputText("当你提出想和她做爱时，菲拉看起来完全惊呆了。你可以看出她对现在的样子感到很不自在，因为她向后靠在座位上时，用四只手遮住了肿胀的乳房。");
         outputText("[pg][say:我……听着，我们可以等到我生完孩子……你不想那样吗？] 她回头瞥了一眼自己肿胀的腹部。[say:我……不会太——啊！]");
         outputText("[pg]她话说到一半停了下来，一阵宫缩传遍全身，让她整个人都紧绷起来。接着，伴随着近乎性感的呻吟，她浑身颤抖，所有的肌肉都放松下来，宫缩将一枚圆柱形的卵从她腹部末端的产道口推了出来。就像排练好的一样，你的众多孩子中的一个迅速从阴影中跑出来，抱起卵，把它带到蚁群更深处的地方。显然，这里正在运作着某种更庞大的系统。");
         outputText("[pg]当你走回她面前时，你开始脱衣服，把你的盔甲和内衣散落在身后。");
         if(get_player().hasTailInsteadOfLegs())
         {
            outputText("你以一种缓慢、有节奏的扭动，近乎放荡地滑行着，");
         }
         else
         {
            outputText("你以一种缓慢、性感的步态，近乎放荡地走着，");
         }
         outputText("让她看到你的[ass]从左到右，再从右到左性感地扭动，你明显在引诱菲拉产生淫荡的想法。当你再次面对菲拉时，你看到她下面的两只手仍然捂着乳房，上面的两只手紧紧抓着她坐着的石椅。");
         outputText("[pg][say:我不是那个意思……我只是觉得……]");
         if(get_player().cor < 75)
         {
            outputText("[pg]你将一根手指按在她的唇上让她安静下来，然后在她耳边轻声低语着甜言蜜语。这种分散注意力的方法正是你所需要的。你的手从她的嘴唇滑下，指甲在她的脖子上轻轻划过，点燃了菲拉的欲火。最终，你的手停在她的手上。你调皮地用一根手指勾住她遮挡乳房的一只手，慢慢地将菲拉的手拉开，露出她坚挺的乳头。");
         }
         else
         {
            outputText("[pg]你告诉菲拉，你想看看她那对奶子，自由又骄傲地露出来。她害羞地照做了。你如饿狼般盯着她的乳房。它们比\'正常\'尺寸大得多；你猜想这一定是\'怀孕\'的缘故。");
         }
         outputText("[pg]乳汁已经开始从她的两个乳头渗出。这让你不禁好奇，她为什么会分泌乳汁。");
         outputText("[pg][say:你、你什么意思？我需要喂养我的……我们的……孩子。]");
         outputText("[pg]显然她没明白你的问题更多是开玩笑而不是认真的，你轻轻捏了一下她的乳房打断了她。当一道白色的奶柱像炮弹一样从她的乳房喷射而出，落在几英尺外的地板上时，你们俩都明显吃了一惊。");
         outputText("[pg]毫无预兆地，你像毒蛇一样扑向她的乳晕，咬住她的乳房，调皮地啃咬着。你的努力得到了回报，你的嘴里瞬间充满了温暖甘甜的液体。你满意地哼了一声，尽力吞咽着似乎从她肿胀的乳房中源源不断涌出的大量乳汁，但这实在太多了。你松开她，舔了舔嘴唇，叹了口气，因为你的饥饿感已经完全满足了——至少对奶水是这样。");
         outputText("[pg]你的手在她的双腿间游走，当你分开她的双腿时，菲拉发出了一声呻吟。你看到她湿润的小穴已经浸湿了她的大腿内侧，像这样分开它们，你可以一览无余。她的小穴似乎在肉眼可见地跳动着，每一次微小的收缩都会喷出少量的爱液。");
         outputText("[pg]当你温柔地抚摸她时，你想知道她的里面会是什么感觉；你的手指甚至还没完全到达她的入口，她的阴道就已经散发出巨大的热量。你挑逗着菲拉，评论着她是如何为你准备好的，同时你开始用手指挑逗她湿润的肉洞和长长的阴蒂，看着她闪闪发光的小穴几乎在乞求被插入，同时把爱液喷得满地都是。");
         outputText("[pg][say: 唔啊啊~] 菲拉的身体紧绷着，她呻吟着，肯定又有一颗卵要出来了。[say: 我不能……再承受……更多了。] 她在呻吟和喘息之间挣扎着说道。[say: 我……]");
         outputText("[pg]她的双手捧起你的脸，她那呆滞的眼睛茫然地盯着你；如果她甚至没有专注地凝视你的眼睛，那她一定非常渴望建立连接。");
         if(get_player().cor < 75)
         {
            outputText("[pg]你微笑着，用手搂住她的后脑勺，将她拉入一个深吻。");
            outputText("[pg]几乎立刻就感觉到了连接，它像挥舞着战斧的牛头人一样重重地击中了你。情感的烟花在你身上绽放；很明显，你的大脑完全没有准备好迎接这阵情感的洪流。");
            if(get_player().get_pregnancyIncubation() > 0)
            {
               outputText("[pg]你们怀孕的感觉瞬间在你和菲拉之间传递；你感觉到她未出生的孩子在你体内的温暖和能量，你也能感觉到她体验着你体内仍在孕育的生命的温暖。在这一刻，你们俩完全理解了对方怀孕的感觉；这是一种非常……有启发性的体验……让你从手头的任务中分心了。");
            }
            else if(get_player().statusEffectv1(StatusEffects.Birthed) > 0)
            {
               outputText("[pg]你以前也怀过孕，但这次……这次完全不同。你感觉到了菲拉腹中每一颗卵所处的每一个阶段。你感觉到了你人生的唯一目标、唯一愿望就是交配并在余生中生孩子是什么感觉。这对你来说是一种惊人的刺激——你感觉到一股暖流开始在你的双腿间蔓延。");
            }
            else
            {
               outputText("[pg]这是你感受过的最有趣的感觉之一；你同时感觉到了怀孕的每一个阶段——菲拉不断产卵的腹中每一颗卵的每一个阶段。这让你想要体验怀孕的乐趣，因为母性的想法如潮水般涌入你的脑海。虽然你也记住了它的缺点——你不想做得太过火。你感觉到了你人生的唯一目标就是不断繁殖是什么感觉。这对你来说是一种惊人的刺激，你感觉到一股暖流开始在你的双腿间蔓延。");
            }
         }
         else
         {
            outputText("[pg]你只想在余生中尽情做爱，但你知道这在短期内是不会发生的。该死的愚蠢任务和你的人民毁了一件好事。");
            outputText("[pg]看来你需要教教菲拉，生活充满了失望。你假装没看到她眼中的需求；天知道你不需要另一个头痛的问题。毕竟你还有堕落的幻想需要实现！");
         }
         outputText("[pg]你");
         if(get_player().cor < 75)
         {
            outputText("充满爱意地");
         }
         else
         {
            outputText("轻蔑地");
         }
         outputText("继续用手指抠弄她，迫使她的身体在你的手指上扭动，乞求更多……而你非常乐意满足她。当她的两只手臂将你的肩膀往下压时，另外两只手臂则对你的头顶施加压力，鼓励你的头消失在她的双腿之间。下巴靠在你爱人坐着的完全湿透的枕头上，你吸入菲拉的性爱气息，让它蔓延到你的全身，鼓励你从她身上哄出更多那种令人陶醉的阴户花蜜，以供享受和取乐。");
         outputText("[pg]泥土的气味混合着她的性爱气息，以及你嘴唇上她奶水的味道，实在太强烈了。你像一只发情的野兽一样扑向她。把脸埋在她的爱豆上，你把她的外阴唇压在你的嘴唇上，然后把她娇嫩的阴蒂含在嘴里，用舌头裹住它，用力吸吮。她的下臂紧紧抓住你的[hair]，引导着你的脸，打算让你尽早深入地吃她。得到暗示后，你把舌头从她的阴蒂上移开，伸进她的体内，让舌头凹凸不平的纹理挑逗和抚摸她火热的肉洞。");
         outputText("[pg]作为对你舌头新位置的奖励，你听到她发出一声长长的赞赏的呻吟，因为她在小穴里体验到了这种异样的感觉。当她的小穴包裹并释放你探索的舌头时，你能感觉到每一次收缩。偶尔停下来，你吸溜着她的爱液，但不断受到她相当紧致、湿润和美味的小穴的攻击。你的舌头在她的体内嘎嘎作响，就像一只被卷入风暴的蚂蚁。拔出舌头，你充满爱意地沿着她的阴蒂舔舐，让她深吸一口气，同时更用力地抓住你的头发。菲拉像个小女孩一样咕哝着，同时用双腿紧紧夹住你的头。她轻轻一推，用巨大的力量把你的脸重新按回她的小穴里——显然她还没完。");
         outputText("[pg]考虑到她的力量，你决定顺其自然；情况总可能更糟。");
         if(get_player().cor > 50)
         {
            outputText("[pg]你会记住这件事，以后让她付出代价。");
         }
         outputText("[pg]你第二次进入她小穴带来的感觉，让她咬着下唇，发出一阵混合着呻吟和呜咽的声音；被狂喜淹没的感觉一定很好。");
         if(get_player().cor <= 50)
         {
            outputText("[pg]你在脑海中听到她的声音：继续。很快就轮到你了……求你了，再……再来一点。");
         }
         outputText("[pg]现在，她正以一种既狂暴又爱抚的方式猛烈地抓着你的头，你每一毫秒的努力都会引起爱人即时的反应。[say: 嗯嗯嗯——！]她紧闭着嘴呻吟着，然后勉强挤出一句，[say: 噢，天哪！就是那样！就在那里！别——嗯，停下！]");
         outputText("[pg]她还没准备好高潮……是吗？");
         if(get_player().cor <= 50)
         {
            outputText("你探查了她的心思，差点被吓了一跳。[say: 不！求你继续！]你听到她的声音在你的脑海中响起。");
         }
         outputText("[pg][say: 求你，舔我……就在……那里！]她在狂喜中呻吟着，迅速用那双没有抓着你头发的手捂住嘴，试图掩盖她那愉悦的声音。");
         if(get_player().cor <= 50)
         {
            outputText("[pg]虽然你心里有一部分想让她向整个蚁群呻吟出她的愉悦，但你觉得还是让她别打扰蚁群了。");
            outputText("[pg]你继续对她的小穴发起攻势，她拼命地试图抑制住愉悦的呻吟，随着你的舌头在她的阴道里滑进滑出，卧室里回荡着沉闷的回音。她一定快要高潮了，你心想，然后意识到自己已经沉浸在这一刻中；你的[vagina]被冷落了……也许该轮到她来伺候你了？仿佛你大声说出来了一样，菲拉松开了抓着你头发的手，把腿从你的脑后解开，平复了一下情绪，然后站了起来。");
            outputText("[pg][say: 你想……让我……怎么做？]当你调皮地把她向后推倒在床上时，菲拉在断断续续的呼吸中勉强呻吟出这句话。你等她把巨大的腹部摆好位置，在她仰卧时将你们俩卷在其中。你把臀部悬停在她的脸正上方，让她闻到你的气味，感受到你的体温，希望她能明白你的意思，从这里接手。");
         }
         else
         {
            outputText("[pg]这样可不行，你心想，从她的抓握中挣脱出来，脸稍微偏离她的小穴。凝视着她深邃的祖母绿眼睛，一个狡猾的念头在你的脑海中蔓延。你猛地把她的手从嘴边扯开。同时，你再次埋首于她的阴户，轻咬她的阴蒂。一声响亮而恰到好处的呻吟脱口而出，在墙壁上回荡。你暗自微笑，告诉菲拉她现在的矜持很扫兴；你想听到她毫无保留的呻吟。不要掩饰，不要克制：只要呻吟……为你，她的“王”。想多大声就多大声。");
            outputText("[pg]把那双碍事的手挪开后，你再次俯下身去，用舌头粗暴地摆弄她的阴蒂，这让她爆发出一连串响亮的呻吟和粗重的喘息，她任由自己承受这股狂喜的全面冲击。菲拉屈服于本能，任由它吞噬自己，她猛地向后倒在床上，充满乳汁的乳房在空中摇晃，她痉挛着，用身体允许的最大音量尖叫着。她的腿甚至开始在你的肩膀上抽搐，从你施加给她的极度敏感中汲取快感……不，是属于你的那个肉洞。");
            outputText("[pg]感觉到她快要高潮了，你抽身后退，从她的双腿间挣脱出来。终于自由了，你看到她四仰八叉地躺在床上，巨大的腹部垂在一边。你跨坐在她身上，将你的[clit]沿着她的鼻子滑动，意图让你的气味深深烙印在她的身体里，想让她渴望你的小穴，当她深吸一口气，像发情的荡妇一样呻吟时，你的目的达到了。");
            if(get_player().vaginas[0].vaginalLooseness >= 3)
            {
               outputText("[pg]当你悬停在菲拉上方时，你松弛的阴唇让你的汁液滴落在她的脸上，让她沐浴在你情欲的湿润中。");
            }
            outputText("[pg][say: 我觉得你需要舔一会儿我的小穴，我的女王，]你对她说，心想你可不想让她在满足你的需求之前就高潮。你调皮地低头对她微笑。");
         }
         outputText("[pg]像一只饥饿的野兽，菲拉流着口水，抓住你的大腿，把你的双腿分开。你抓住她的头发，把她的头按在你的双腿之间，撞击着你的[clit]，让你发出一声轻微的呻吟。她现在肯定不害羞了，你心想，因为她的舌头开始在你的体内游走。你能[say: 听到]菲拉在回应中咯咯地笑。把你的小穴在她的嘴和脸上摩擦的念头涌上心头，本能接管了你，你的臀部开始摇摆，回应着菲拉急切的攻势。你的手穿过她的头发，把菲拉漂亮的脸蛋更用力、更深地按进你湿透的[vagina]里。这只可怜的蚂蚁只能以猛烈的呻吟来回应，她急切地吸吮和亲吻着你的阴蒂，完全被占据她的欲望所淹没。");
         if(get_player().cockTotal() > 0 && get_player().hasCockThatFits(42))
         {
            outputText("[pg][EachCock]乞求着你的抚摸，你毫不犹豫地抓住了");
            if(get_player().cockTotal() > 1)
            {
               outputText("它们");
            }
            else
            {
               outputText("它");
            }
            outputText("，抚摸着");
            if(get_player().cockTotal() == 1)
            {
               outputText("它");
            }
            else if(get_player().cockTotal() == 2)
            {
               outputText("它们");
            }
            else
            {
               outputText("尽可能多地");
            }
            outputText("尽你身体所能地猛烈。");
         }
         outputText("[pg]当你感觉到你坚挺的[clit]在她的嘴唇上滑动时，你开始尝到她对你近乎原始的饥渴。同时，你也感觉到她腹部不断增强的收缩变得越来越快，越来越强烈。");
         if(get_player().cor < 50)
         {
            outputText("[pg]你得快点完事才行；总不能让孩子们一直等着取她的蛋，而你俩却还在[say:忙活]吧。");
         }
         else
         {
            outputText("[pg]如果她在你完事之前就把蛋生下来，你不仅会暴怒，还得把孩子们赶走。" + get_player().mf("Daddy","Momma") + "得先[his]爽完，可不能让那些烦人的小家伙碍事。");
         }
         outputText("[pg]她的舌头和手指施展着魔法，直到你几乎达到了高潮的状态。");
         outputText("[pg]决定结束这一切，你把臀部从菲拉急切的舌头上移开，俯下身，在她的耳边低语；你铁了心要在一次光荣的性满足中同时高潮，想知道她是否也有类似的想法。听到你的建议，她咯咯地笑了起来，你们俩迅速改变姿势，变成了历史悠久的六九式。她的阴道现在正好在你的脸的正上方，而她的脸则在你的双腿之间，她巨大的腹部在你们俩上方投下了一道若隐若现的阴影，因为它卷曲在你的头顶，温暖的液体顺着你的脊椎滴落。你感觉到她渴望产卵，但你压制了她的欲望。[say: 还没，]你想——直到你们都高潮了。");
         outputText("[pg]你的[clit]再次停留在她的嘴唇上，她的头开始在她自己强壮的双腿之间上下摆动。作为回应，你冲进她的双腿之间，舌头先上。你用力地舔着她那尝起来甜甜的小穴。菲拉呻吟着，你的意图非常明显，因为她用力地压在你的小穴上，专心致志地为你带来性释放。她用下面那双手臂伸上来，紧紧地捏住你的两个[nipples]，那种扭曲的感觉简直妙不可言。虽然听不清你们闷闷的幸福呻吟，但在你们共同的心智状态中，你们能听到彼此在尖叫着鼓励和指导的话语。");
         if(get_player().cockTotal() > 0 && get_player().hasCockThatFits(42))
         {
            outputText("[pg]毫无预兆地，菲拉开始交替地口交你的[clit]和吸吮你的[cocks]；当她像恶魔一样挑逗你的性器官时，双重刺激让你不知所措。");
         }
         outputText("[pg]你回想起当你把手伸过头顶时，她腹部的尖端特别敏感。你的手臂几乎够不到它，但仿佛她知道你想做什么，菲拉把她的腹部卷曲得恰到好处，这样你就可以开始抚摸她的产道了。在你的爱抚下，菲拉浑身发抖，深深地呼气到你的阴户里，让你的脊背一阵发凉。就这样继续下去，你们俩很快就达到了高潮。");
         outputText("[pg]你们俩高兴地嚎叫着，当高潮的纯粹幸福占据你们的身体时，你们抽搐着、扭动着，流着口水，把女性的体液喷在彼此的脸上。");
         if(get_player().cockTotal() > 0 && get_player().hasCockThatFits(42))
         {
            outputText("[pg]菲拉野蛮地呻吟着，把");
            if(get_player().cockThatFits2(42) >= 0)
            {
               outputText("你的两根");
            }
            outputText("[cocks]塞进嘴里，把");
            if(get_player().cockThatFits2(42) >= 0)
            {
               outputText("它们");
            }
            else
            {
               outputText("它");
            }
            outputText("压在她的喉咙后部。你无法抑制这种快感，嚎叫着把滚烫的精液射进她的喉咙里。");
         }
         else if(get_player().hasCock())
         {
            outputText("[pg]感觉到你自己的[cocks]即将爆发，你迅速从你的爱人身上滚下来。时间刚刚好——你把精液射向天花板，在你们俩咸咸的精液落回你们身上之前，把它涂得很好。");
         }
         if(get_player().biggestCockArea() >= 500)
         {
            outputText("[pg]你的[cocks]随着高潮的释放而抽搐，当你的精液穿过尿道时，它胀大了起来");
            if(get_player().cockTotal() > 1)
            {
               outputText("");
            }
            outputText("。伴随着沉重的喘息，你感觉到滚烫黏稠的精液从你的阴茎喷射而出，打在室内的装饰上；你到底射到了什么，你也说不准……但你出去的时候很可能会被自己弄出的一团糟绊倒。");
         }
         outputText("[pg]你有一瞬间感到呼吸困难，因为大量的温热女性精液似乎从菲拉的阴道涌出，完全覆盖了你的脸，浸透了你的大部分[hair]。当你喘口气时，你可以听到菲拉吵闹地吸吮着你的体液，然后将她的脸压在你的[clit]上，急切地想让她的脸在你的汁液中多浸泡一会儿。满足感和实现的欲望——不仅是你自己的，还有菲拉的——像野火一样在你的大脑中蔓延。你暗自窃笑，对你在这次交欢中对菲拉产生的影响感到满意。");
         outputText("[pg]不幸的是，大自然不得不破坏这一刻，因为菲拉的肌肉突然僵硬，她的腹部开始剧烈收缩。");
         if(get_player().cor < 75)
         {
            outputText("[pg]肾上腺素在你的血管中泵送，你迅速将菲拉翻转过来，让她四肢着地。当她痛苦地呻吟时，你握住她的手和头，为她提供支撑，向她保证你会在这里陪着她。感觉到她可能会从连接中受益更多，你迅速在她的嘴唇上印下一个吻，并将她紧紧抱在怀里，她对此的反应是用双臂抱住你，尽管在这一点上似乎更多的是为了支撑而不是激情。尽管如此，你能感觉到她很感激你在这里。伴随着最后一声吃力的呻吟，她将即将产出的卵从腹部排出，并长长地松了一口气，然后热情地回吻了你。");
            outputText("[pg][say: 谢-谢谢你……你对我太好了，]她在亲吻的间隙低语。");
            outputText("[pg]在走廊上，你可以听到轻柔的脚步声；你众多孩子中的一个一定是来取卵的。你迅速行动，抓起你的[armor]并将其放置好，以遮挡你们赤裸的身体。");
            if(get_player().getBonusStat("挑逗几率") <= 0 && get_player().getBonusStat("挑逗伤害") <= 0)
            {
               outputText("[pg]走进来[say: 孩子]注意到你们俩都在大口喘气，并迅速意识到你们需要隐私。菲拉舀起卵，尴尬地递给他。他尽力避开视线，迅速跑过去取卵并离开。");
            }
            else
            {
               outputText("[pg]你试图保持端庄的尝试最终失败了，因为你们结合的后代跌跌撞撞地走进来，看到这一幕捂住了眼睛。他迅速摸索着走向卵并离开，不敢回头看他赤身裸体的父母。");
            }
            outputText("[pg]你们俩轻声笑着，在菲拉的床上渐渐睡去。不知怎么的，你知道你醒来时背会很痛。");
         }
         else
         {
            outputText("[pg]在这一点上，你一点也不在乎菲拉正在经历什么样的混乱，而是选择在你收缩的爱人旁边打瞌睡。她试图摇醒你，并沮丧地抱怨，因为她被留下来独自将她的孩子带到这个世界上。你尽力假装睡着了，但她发出的噪音太大了。菲拉显然相信了你的欺骗，因为过了一会儿，她停止了试图引起你的注意，而是更专注于手头的任务。");
            outputText("[pg]几分钟后，你听到了不可避免的如释重负的呻吟声，并感觉到了分娩时渗出的液体。你咧嘴一笑，假装睡着了，因为你又给殖民地增加了一个……奴隶而感到满足。也就是说，直到你的一个孩子试图进入卧室拿走菲拉的卵。你猛地睁开眼睛，站起来表现出愤怒和烦恼，以至于你的后代紧张地后退；他必须等到你们俩都睡着了才能拿到卵。菲拉看起来很困惑，因为她以为你一直都在睡觉。");
            outputText("[pg][say: 我-我以为……你……]菲拉开始说，但你用一个眼神打断了她，表明你没有心情听她说话。");
            outputText("[pg]既然菲拉安静下来了，你告诉她你要去睡一会儿；如果她要生另一个孩子，她需要要么保持安静，要么离开去另一个房间。当你安顿下来准备小睡时，她沮丧地点了点头。你发誓在入睡前你又听到她开始分娩了。");
         }
         get_player().orgasm("Vaginal");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function antastrophyBadEnd() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_antguards());
         outputText("当你准备离开竞技场时，蚁后奇拉和四名保镖向你走来。");
         outputText("[pg][say:跟我来，是时候加入我们的蚁群了。]奇拉轻蔑地说道。你想离开，但同时，在地下帮助蚁群成长的想法是你从未考虑过的选择。");
         outputText("[pg]蚁后用她干巴巴的语气继续说道。[say:正如我所料，你已经证明了自己不足以在地表世界生存，更不用说成为我女儿合适的追求者了。你在这个世界上生存的唯一方法，就是和我们在一起。来吧。]");
         outputText("[pg]考虑到是杀出一条血路还是自愿加入，你选择了后者。");
         outputText("[pg]你在武装的肌肉战士和奇拉的护送下，半拖半推地深入了你从未去过的蚁群深处。最终，你来到了一个看起来比牢房好一点的房间。");
         outputText("[pg][say:欢迎来到你的新家，[name]。你的饭菜每4小时送一次。你要吃掉，每一口。听明白了吗？]");
         outputText("[pg]你还没来得及回答，她就继续说道。");
         outputText("[pg][say:任何未经我明确许可试图离开这个房间的企图都将导致你的死亡。当我选择允许你出去时，你不准和我的女儿说话。事实上，我禁止你以任何方式与她接触……再见，“勇者”。]奇拉转身离开，把你留在房间里。一旦你听到脚步声完全消失，你迈出一步准备离开，因为没有栏杆或障碍物阻止你。当你走到“门框”时，你突然想起你不适合地表。蚁后是对的，你沉思着。也许这对你来说是最好的，至少你在这里会很安全。看着你的新房间，你有一种奇怪的感觉，你终于到家了。你一直在旅行和寻找，终于找到了你想要的东西。凝视着门外，你意识到即使你想离开，你也会完全迷失在蚁群迷宫般的结构中。你暗自轻笑，自己想逃跑的想法是多么愚蠢。");
         outputText("[pg]在幻想了几个小时奇拉可能会交给你什么任务之后，一只小蚂蚁给你带来了一个小陶杯，里面装满了小瓶子里的那种透明液体。他一言不发地把它递给你。接过杯子，你拍了拍他的头向他道谢，他便跑开了。大口喝下，液体滑过你的喉咙。当液体到达你的胃部时，一种突然的安全感和温暖感笼罩着你。当你完全喝完杯子里的东西后，你对你所得到的一切感到一种奇怪的感激，即使它只是一个小房间。这是你拥有过的最好的房间，你永远不想离开它。");
         outputText("[pg]日子在同样的日常中过去。一只蚂蚁走过来，给你一个杯子，有时还有一些食物，然后消失在隧道里……");
         outputText("[pg]<b>尾声</b>[pg]");
         outputText("你在幸福的无知中度过余生，尽你所能帮助蚁群。大多数时候，你被用作实验性的性玩具。他们强迫你喝下无数种不同的药水和灵药。最终，当你的身心渴望那些性爱液体时，你开始乞求更多。通常，奇拉甚至会把你放在竞技场上，有时是为了在整个蚁群面前自慰，或者要求你同时服务尽可能多的雄性。有时你是男性，有时你是女性，有时两者都是。你的心思完全被尽你所能取悦蚁群所占据。你再也没有机会看到外面的世界或菲拉，但你不在乎。你忙于取悦放在你面前的每一根肉棒。只要你是在帮助蚁群成长和变强，其他一切对你来说都不重要。");
         get_game().gameOver();
      }
      
      public function antGirlGoodEnd() : void
      {
         clearOutput();
         get_images().showImage("ant-desert-kissing");
         spriteSelect(SpriteDb.get_s_phylla());
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,873,50);
         outputText("当你转身准备离开时，感觉有些不对劲；人群似乎异常安静。菲拉迅速从座位上爬下来，跳进竞技场。你警惕地瞥了一眼豺狼人，但它已经被拖出去了。菲拉跑到你身边，给了你一个大大的拥抱，四只手臂紧紧地环绕着你，用尽全力挤压。她如此公开地表达爱意让你有些震惊，毕竟你身上的骨头都在嘎吱作响。她与你十指紧扣，转身将你的双手高高举起，向蚁群中的每一只蚂蚁宣告你的胜利。充满敬畏的人群突然爆发出欢呼声，整个竞技场都回荡着为你胜利而欢呼的声音。她转身走向出口，拉了拉你的袖子。");
         outputText("[pg]菲拉拉着你在无数漆黑的隧道中盲目穿梭，直到你们到达女王的房间，奇拉似乎正在那里等你。不过，和上次见到她时有些不同；她穿得和菲拉一样华丽，但看起来更……正式。");
         outputText("[pg][say: 菲拉对你的看法似乎是对的。你既聪明又强壮。虽然我曾有过怀疑，但你确实与众不同。如果你愿意，我祝福你和菲拉建立自己的蚁群。]奇拉转向她的女儿，点了点头，似乎在传递某种无声的信息。你不确定蚁后是否真的对你产生了好感，还是她只是因为作为女王的职责而这么说，把巨大的荣誉赐予一个她讨厌的人。不管原因是什么，菲拉似乎对接下来要发生的事情感到欣喜若狂。");
         outputText("[pg]菲拉把你拉到一个私人房间。与贯穿蚁群的通道不同，这条通道实际上是有照明的，让你可以在菲拉身后跟着她进入她的房间。从布局来看，你猜测这是公主的房间；有一张小石床，上面整齐地叠着一些床单，地板上散落着几个五颜六色的丝绸枕头。房间中央有两个大垫子，中间放着一个金碗。看起来她的房间已经为某种仪式布置好了。");
         outputText("[pg]当菲拉看到你已经把这一切都看在眼里时，她让你坐在其中一个大垫子上，自己则坐在你对面的垫子上。她拿出一小瓶透明液体，倒进你们之间地板上的金碗里。液体一接触到碗，颜色就发生了变化，像棱镜一样折射出光芒。随着彩虹般的光芒散开，花朵的甜美香气也从金碗中散发出来。");
         outputText("[pg][say: 我很高兴你能和我在一起，为了这个。我的意思是，你确实想和我在一起，对吧？]你点了点头，虽然你并不完全确定“这个”是什么。");
         outputText("[pg]菲拉的脸上露出了灿烂的笑容。");
         outputText("[pg][say: 一开始，这会让你感觉很奇怪。我的意思是，之后也会……但在进行中不会……我的意思是——]她害羞地把目光从你身上移开。[say: 对我来说也会很奇怪。这是我的第一次，所以我也不太确定会发生什么，我的意思是，我只是……]紧张的公主结结巴巴地说着。");
         outputText("[pg]在这种情况下，你不太确定该做什么或说什么，但你很快就明白了。似乎菲拉想占据主动，她爬过熏香，把身体贴在你的身上。你深吸了一口气，她身上泥土的气息与花朵的甜美香气混合在一起。你们的身体开始在性本能的驱使下移动，你在耳边听到了新情人沉重的呼吸声。你的嘴唇轻轻地贴在她的脖子上，手臂环绕着她。你的指甲在她的背上轻轻划过，试图试探一下。菲拉在你的怀里颤抖着，嘴里发出一声小小的呻吟作为回应。当你的细碎的吻顺着她的脖子向上移动，穿过她的脸颊时，你的嘴唇与她的嘴唇相遇，她的舌头推入你的嘴里，你们的爱抚开始加深，你感觉到一阵情感的波涛席卷了你。");
         outputText("[pg]当你看着她的眼睛，你们的嘴唇锁在一起时，你感觉你们仿佛是一个单一的思想。这是最奇怪的感觉之一；你能感觉到……她的感受。当你的手在她的身体上游走时，你能感觉到自己的动作，就好像你是接受者一样。这在某种程度上几乎令人兴奋，确切地知道你的触摸在别人身上是什么感觉。当你把她放在垫着枕头的垫子上时，你邪恶地笑了。");
         menu();
         if(get_player().hasCock())
         {
            addButton(0,"使用阴茎",gigititigitigitigitigityAntGirl);
         }
         if(get_player().hasVagina())
         {
            addButton(1,"使用阴道",femalePhyllaFirstFuckGooooo);
         }
         addButton(3,"现在不行",declineAntSexForNow);
         addButton(4,"拒绝",rejectAntSex);
      }
      
      public function antColonyOrgy4Ladies() : void
      {
         clearOutput();
         get_images().showImage("ant-camp=female-orgy");
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,885,FlagDict_Impl_.arrayReadInt(_loc1_,885) + 1);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,885) == 1)
         {
            outputText("她困惑地看了你一眼，但还是照做了。她仰起头，闭上眼睛，你看着她默默地与她的孩子们“交流”。");
            outputText("[pg][say: 我按你说的做了。我的——我是说我们……最优秀的五名战士正在来这里的路上。]");
            outputText("[pg]你对她点了点头，希望“最优秀的战士”也能有最优秀的肉棒。你的思绪很快就飘到了有五根阴茎任你摆布会是什么感觉。当你的思绪把你引向那条熟悉的道路时，你能感觉到你的[vagina]湿润了");
            if(get_player().hasCock())
            {
               outputText("并且[eachCock]硬了起来");
            }
            outputText("充满期待。五个雄性像老兵一样昂首阔步地走进房间，将你从白日梦中唤醒。");
         }
         else
         {
            outputText("她虚弱地点点头，现在她很清楚“检查”意味着什么。她低头看着地板，闭上眼睛集中注意力。过了一会儿，你听到熟悉的脚步声冲向她的房间。你猜想孩子们一定和你一样对这件事感到兴奋。当他们进入房间时，你可以看到你的假设确实是正确的。所有五个肌肉发达的雄性都已经完全赤裸，他们10-14英寸的肉棒正充满期待地勃起着。");
         }
         outputText("[pg]菲拉显然从她的群落中挑选了最好的标本来向你炫耀。他们迅速排成一排，将他们红褐色的小腹部贴在墙上。你在他们面前走过，就像一个视察部队的军官。他们轮廓分明的身体和高大阳刚的骨架看起来就像他们一辈子都在矿井里工作一样。你停在他们中最大的一个面前，手在他的身体上游走，脑海中隐约浮现出邪恶的意图。当你的手在他雕塑般的身体上上下移动时，你抚摸着他粗糙的皮肤。当你用指甲划过他的脖子时，他的胸肌惊讶地绷紧了；但像个好孩子一样，他没有试图阻止你。");
         if(get_player().get_femininity() >= 80)
         {
            outputText("[pg]看着你的样子，他们五个都勃起了也就不足为奇了。或者也许是菲拉在努力试图给你留下深刻印象；你很快就会知道了。");
         }
         outputText("[pg]你继续用指甲划过他的胸膛，一直到他肉棒的根部，留下了鲜红的印记。当你引导你的手掌顺着他长而坚硬的阴茎向上直到龟头时，他不舒服地扭动着。当你把手顺着他的肉棒滑下并开始缓慢套弄时，他发出一声充满男子气概的咕哝声。");
         outputText("[pg]你上下打量着这排男人，看看他们坚持得怎么样。他们都在专注地看着你，希望你接下来会走向他们。其中两个人伸出手开始抚摸自己的肉棒，但你发出了很大的声音，好像在清嗓子。当你摇头表示不允许他们碰自己时，他们都惊讶地跳了起来。");
         outputText("[pg]从他们肉棒上滴下的前列腺液的数量来看，你会认为他们的蛋蛋几乎要胀破了。");
         outputText("[pg]你转过身面对菲拉，继续挑逗着，并提到她的孩子们需要不时地“释放”。作为唯一的雌性和女王，她照顾他们是理所当然的。这是为了更伟大的利益。");
         if(get_silly())
         {
            outputText("[pg][say: 为了更伟大的利益。]你听到你的孩子们无意识地附和着。");
         }
         outputText("[pg][say: 但是……我……不——]菲拉说着，尽量不盯着你或她的孩子们看。");
         outputText("[pg][say: 这不是关于你想要什么！这是关于什么是公平的！]你责骂她。[say: 你们四个！]你向你没有服务的其他雄性做手势。[say: 去得到一些“释放”。]");
         outputText("[pg]当她的四个后代手里拿着肉棒向她扑来时，菲拉看起来几乎吓坏了。你停止抚摸唯一剩下的雄性的肉棒，并要求他脱下你的盔甲。他迅速用他强壮的四只手臂脱下你的[armor]。一旦你完全赤裸，你就把他推倒跪下。");
         if(get_player().isBiped())
         {
            outputText("将一只脚放在他的肩膀上，你向他展示你的[vagina]。");
         }
         else
         {
            outputText("现在在完美的高度，你向他展示你的[vagina]。");
         }
         outputText("他非常清楚你想要什么，把脸埋进你准备好的小穴里，开始舔弄你。你闭上眼睛向后靠，让他舔舐的激情吞噬你的思绪。你听到一声响亮的呻吟，把你从狂欢中唤醒。你转头看向菲拉。她的孩子们强迫她跪下。菲拉用她的四只手和嘴来取悦她的孩子们。你看到她草率地吸吮着一根肉棒，然后跳去吸吮另一根，在服务她面前的每一根肉棒时，她的嘴和手交替使用。你瞥了一眼她的双腿之间，看到她的淫液顺着她甲壳质的腿流下，在她的膝盖周围汇聚成水洼。");
         outputText("[pg]仅仅是通过下体传来的口交快感就让你接近高潮，你把蚂蚁的头");
         if(get_player().isBiped())
         {
            outputText("从你的双腿之间拉开。");
         }
         else
         {
            outputText("从你的小穴里拉开。");
         }
         outputText("你示意他跟着你，你大摇大摆地走到菲拉所在的地方。");
         outputText("[pg]菲拉呆滞的眼神和茫然的表情以一种非常扭曲的方式看起来非常可爱。当新鲜的精液从她张开的嘴里滴落时，她抬起头凝视着你。");
         outputText("[pg][say: 我……]她试图在你打断她之前说话。");
         outputText("[pg][say: 吞下去！我不会让我们孩子们的任何种子白白浪费，]你命令道。");
         outputText("[pg]菲拉闭上嘴，微笑着，咽了下去。你看着她小小的喉结随着吞咽而上下移动。一旦她完成了，她张开嘴向你展示她没有浪费一滴。");
         outputText("[pg][say: 求求你……我……我们……需要……]");
         outputText("[pg]你吻了她，知道这就是这个荡妇一直想要的。");
         outputText("[pg]你感觉到你的思想和情感与菲拉的同步了。起初这有点势不可挡。你从菲拉那里能感觉到的只有她与一切交配的狂野需求，雄性，雌性，两者皆可，对她来说都无所谓。她只是想要……不，是需要……繁殖。");
         outputText("[pg]这种结合的感觉让你们俩的下体都燃烧起来。");
         outputText("[pg]你伸出手，调皮地摸了摸她的小穴。这突如其来的触碰导致她的花蜜喷涌而出，轻轻地溅在你的手上。你把双腿移到她的双腿之间，这样你们的小穴就贴在了一起。感觉到她长而坚硬的阴蒂在你的[vagina]的褶皱上，只会让你更想要它，但房间里还有其他人，他们也需要关注。当你把臀部摇向菲拉时，雄性们在你们俩周围围成一圈。为了保持平衡，你抓住菲拉的腹部，抓住你面前最近的肉棒，开始疯狂地吸吮它。当菲拉也把一根肉棒含在嘴里时，你可以听到咕哝声和呻吟声。你感觉到一根肉棒抚摸着你空闲的手背。你不假思索地抓住它，开始套弄。");
         outputText("[pg]当一个雄性在你们俩之间扭动，把他14英寸的肉棒插在你们俩的小穴之间时，你和菲拉几乎要分开了。你听到菲拉对这个突然的入侵者发出咕咕声。");
         outputText("[pg]你们俩把他的肉棒夹在你们的小穴之间，同时你们俩都沿着他的肉棒旋转臀部。你双腿之间的肉棒在你们紧密结合的小穴之间滑进滑出时跳动着。");
         outputText("[pg]通过菲拉的思想感受到你孩子们的渴望，给了你一个主意。虽然通常你不想放弃控制权，但目前的情况和你对填满你[vagina]的东西的渴望让你命令你的男宠们停下来。你从菲拉身上解开自己，留下那个呻吟的荡妇乞求并抓住你重新加入她。你站在她上方，她几乎在你的脚下卑躬屈膝，恳求你。你提到你有一个更好的主意。");
         outputText("[pg]你用声音和思想中带有命令的语气告诉菲拉摆出背对你的后入式姿势。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,879) > 0)
         {
            outputText("[pg]你确信她也会的，如果不是因为她那装满卵的巨大腹部。她能做到的最好就是侧躺着，一条腿悬在空中。不过，你认为这对于你心中的计划来说是可行的。");
         }
         else
         {
            outputText("[pg]很快，菲拉爬到了位置上。她用两只较大的手向后伸，抬起她的腹部，这样你就可以完全看到她匀称的屁股和多汁的小穴。她开始在空中轻轻地挺动她的屁股。");
         }
         outputText("[pg]一旦她就位，你就在她旁边摆出同样的姿势，把你的[butt]高高地抬到空中，就像菲拉一样。她用震惊的表情看着你。她看起来好像要说什么，但她的注意力很快又被她的后代吸引了。其中两个雄性把他们的肉棒送到你们的嘴边。前列腺液和唾液的诱人香气几乎在乞求你把它们含进嘴里。瞥了一眼，你可以看到菲拉也同样难以阻止自己吞下她面前的肉棒，但这不仅仅是那个时候。你发出一个精神信号，又有两个人走到你们俩身后。当她性器官散发出的热量被侵入时，你听到菲拉“咿！”了一声。你身后的两个人把他们的肉棒在你们阴道的褶皱上上下拖动。第五个站在他兄弟的后面，他兄弟在菲拉的后面。不想让任何洞白白浪费，对吧？");
         outputText("[pg]你和菲拉的屁股都像发情的狗一样悬在空中，你感觉到你们对接下来要发生的事情的共同兴奋。你能感觉到你们小穴散发出的热量温暖了你们身后肉棒的顶端。你闻到了空气中令人陶醉的性爱香气。雄性和雌性体液的结合，泥土的气味，房间里每个人沉重的呼吸声。这一切结合在一起吞噬了你的感官。");
         if(get_player().hasCock())
         {
            outputText("你感觉到手在你的肉棒上上下游走");
            if(get_player().cockTotal() > 1)
            {
               outputText("");
            }
            outputText("，导致你把前列腺液喷得满地都是。");
         }
         outputText("[pg]菲拉的思想尖叫着渴望被插入。你自己的思想和身体也无法再承受这种期待了。");
         outputText("[pg]在精神上你向你的孩子们发出了“继续”的信号，你觉得他们一直在等待这个！所有五个雄性齐声向前挺动他们的肉棒。");
         get_player().cuntChange(20,true);
         outputText("你不确定哪个感觉更好；是你的嘴和[vagina]现在充满了你自己孩子们的生殖器，还是菲拉过度刺激以至于甚至无法完全理解她身上发生了什么。当你的舌头缠绕着你儿子的肉棒时，你尽力喝下他一直在积累的前列腺液。你身后的蚂蚁以惊人的速度挺动，让激情的冲击波穿过你的身体。你通过她塞在嘴里的肉棒听到了菲拉快乐的呻吟声。你孩子胜利的咆哮几乎盖过了她的呻吟，因为他挺进他的兄弟；他兄弟反过来又深深地挺进菲拉。你想看过去，你想欣赏菲拉像烤串一样被肉棒刺穿的景象。不幸的是，你前面和后面的儿子用他们长而跳动的男根让你身心都完全被占据了。");
         outputText("[pg]当你能鼓起足够的勇气和注意力睁开眼睛，而不让它们翻白眼时，你看到的只有你深喉你儿子时的肉棒。后面那只蚂蚁插入你[vagina]越深越用力，前面那只的肉棒就越深地挺进你的喉咙。并不是你在抱怨，这两种感觉都让压倒性的欣快感穿过你的身心。");
         if(get_player().hasCock())
         {
            outputText("没忘记你还有“其他需求”，骑着你的蚂蚁用他较大的手臂向下伸，抓住[eachCock]。他较小的手臂放在你的臀部上，以在每次挺动时保持稳定，他用力地套弄你的肉棒");
            if(get_player().cockTotal() > 1)
            {
               outputText("");
            }
            outputText("。");
         }
         outputText("[pg]你感觉到你儿子挺进你小穴深处的动作变慢了，但力量更大了，向你发出信号，你们乱伦狂欢的必然结局即将到来。不想让他太早射精，你在精神上探向菲拉的思想，看看她——");
         outputText("[pg]在你完成搜索之前，菲拉的思想和快感像波浪一样撞击着你的思想。她已经高潮了两次，但她又快到了，你所有的5个孩子也都在高潮的边缘摇摇欲坠。");
         outputText("[pg]这场性爱嬉戏的声音和速度达到了高潮，你尽力收紧你屁股和小穴的肌肉，呼唤骑着你的儿子全力以赴。你感觉到并听到菲拉跟随你的引导，当你的儿子们齐声在你们俩身上挺动时，她支撑着自己。你们俩的嘴都在里面的肉棒上形成了紧密的密封，因为你们俩都从后面被猛烈地操弄。");
         outputText("[pg]在最后一次引发高潮的挺动中，你所有的五个孩子、菲拉和你分享了你经历过的最充满狂喜的高潮之一。");
         outputText("[pg]你自己的高潮震撼了你的全身，你尽力不因为你们共享的思想正在经历的巨大快感而晕厥。");
         if(get_player().wetness() >= 4)
         {
            outputText("[pg]你发出高潮的咆哮，感觉你已经湿透的小穴释放出它的狂怒，将你的汁液喷洒在骑着你的蚂蚁身上。");
         }
         if(get_player().cockTotal() > 0)
         {
            outputText("[pg]虽然你希望有人能在你身下接住你从阴茎喷出的精液");
            if(get_player().cockTotal() > 1)
            {
               outputText("");
            }
            outputText("。你感觉到你的精液");
            if(get_player().cockTotal() > 1)
            {
               outputText("");
            }
            outputText("溅到了你的[chest]和胸部，随着");
            if(get_player().cockTotal() == 1)
            {
               outputText("它");
            }
            else
            {
               outputText("它们");
            }
            outputText("卸下。");
         }
         outputText("[pg]你感觉到一股暖流充满了你的子宫，身后的战士将他肿胀的睾丸里的精液射入你的体内。这种激情的爆发让你充满了母性的骄傲，你确信这种感觉主要是菲拉投射到你脑海中的，因为你感觉到她的肚子也充满了同样的温暖。你嘴里的蚂蚁肉棒在跳动；你迅速伸手抓住他的睾丸，乞求他给你一切，而他也没有让你失望。");
         outputText("[pg]你感觉到他咸咸的精液从他的尿道中喷涌而出，涂满了你的喉咙后部，涌入你的嘴里；让你稍微鼓起了脸颊。你急忙将它全部吞下，感觉到温暖的精液顺着你的食道滑入你的胃里。");
         outputText("[pg]完事后，你转头看向菲拉，看到她也刚刚吃完她的“饭”。看着她的头在儿子的肉棒上上下下，她脖子上的肌肉努力吞咽着咸咸的零食，这画面非常性感。");
         outputText("[pg]现在你的头脑清醒了，你看到你已经完全榨干了你的五个孩子，他们瘫倒成一堆。菲拉半爬半拖地来到你身边，精液和她自己的汁液从她的双腿间渗出，在她身后留下一条小小的痕迹。");
         outputText("[pg][say: 我-我还需要更多……还没……结束……]");
         outputText("[pg]然后你意识到菲拉根本不是向你爬来，而是向门口爬去。看着门口，你看到至少还有四个雄性，完全勃起，准备就绪。");
         outputText("[pg]你暗自轻笑；菲拉变成了一个多么好的荡妇。你还不如加入她——不想让她一个人独享所有的乐趣。");
         outputText("[pg]过了一段时间你醒了过来，身体因疲惫而酸痛。你转头看向菲拉，看看她在狂欢后情况如何。她四仰八叉地躺在垫子上，周围围着心满意足的战士。她的皮肤和甲壳装甲上覆盖着一层厚厚的精液。你暗自思忖是否应该邀请她去洗个澡。");
         outputText("[pg][say: 没关系……他们会……把我舔……干净的……哦，别担心会怀孕；除非我允许，否则他们都是不育的。] 你在脑海中听到了菲拉微弱的声音，尽管她看起来仍然没有意识。");
         outputText("[pg]你也许想留下来看一看，但你在这里待得太久了。你收拾好东西，在返回营地的路上，尽量不踩到地板上那二十多只昏倒的蚂蚁。");
         get_player().orgasm("Vaginal");
         dynStats(DynStat.Sens(-1));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function antColonyEncounter() : void
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,472) - FlagDict_Impl_.arrayReadInt(KFLAGS.flags,473) >= 2 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,472) >= 4 && get_player().get_gender() > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,893) == 0)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,876) > 0)
            {
               bumpIntoTheAntColonyAfterStayHomePhylla();
            }
            else
            {
               antGirlGoodEnd();
            }
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,469) == 1)
         {
            antColonyChallenge();
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,470) == 1)
         {
            enterTheColony();
         }
         else
         {
            firstAntColonyEncounter();
         }
      }
      
      public function antColonyChallenge() : void
      {
         var _loc1_:* = null as IMap;
         clearOutput();
         spriteSelect(SpriteDb.get_s_antguards());
         get_images().showImage("ant-desert-colony");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,471) == 0)
         {
            outputText("你的双脚不由自主地把你带回了之前的蚁丘；当你到达时，一名士兵从活板门下偷看你，然后把它完全打开，并示意你下去。当你进入蚁群时，你发现只有一条路径被生物发光真菌照亮，引导你沿着预定的路线前进。即使在光线昏暗的情况下，仍然很难看清你要去哪里，你发现自己像个盲人一样伸出双手，以确保自己不会撞到墙上。当你深入蚁群时，你可以听到从黑暗的走廊里回荡着匆忙的脚步声和难以理解的喋喋不休声。就在你确信自己走错了路并考虑转身时，你偶然发现了一条急转弯的路径。明亮的光线从它后面发出。");
            outputText("[pg]你护住眼睛，转过拐角。当你的瞳孔适应后，你意识到你已经走进了另一个被蚂蚁挖空的大洞穴。整个天花板都被一大片真菌覆盖，使它几乎和正午一样明亮。当你看到一个地下礼堂时，你的眼睛睁大了！虽然它似乎是最近才被改造成斗兽场的，但椭圆形竞技场的固定装置似乎是从沙漠的基岩中雕刻出来的。抬头看去，可以看到一系列蜂窝状的看台和隧道，越走越高。这个斗兽场可以轻松容纳数百人，甚至数千人。当你步入洞穴时，一个瘦弱的男性蚁人迎接了你，他双手拿着一个剪贴板，另一只手拿着黑色的木炭棍。低头看剪贴板，你看到了很多字——大概是名字——而且它们似乎都被划掉了。其中两个旁边甚至有粗糙的头骨！名单上的最后一个名字恰好是你的。他注意到你试图阅读他名单上的其他名字，他把剪贴板拉到胸前。");
            outputText("[pg][say:你介意吗？！真想象不出公主看上了你哪一点，]他嘟囔着，与其说是对你说，不如说是自言自语。他停下来上下打量你。以貌取人似乎是这个种族的通病。");
            if(get_silly())
            {
               outputText("[pg][say:哦，对不起；你不在名单上。]你告诉他，如果你的名字没有很快出现在名单上，他会发现自己流落街头，除了卖屁股什么都没有，才能回到这里。");
            }
            else if(get_player().get_str() > 50)
            {
               outputText("[pg][say:嗯，你看起来确实很像。但你需要的不只是蛮力才能在这里获胜。]");
            }
            else if(get_player().get_inte() > 50)
            {
               outputText("[pg]你机智地打趣说，他可能也会对一个把他从一群巨大的恶魔肉棒中拯救出来的人抛媚眼，但他并不接受。");
            }
            outputText("过了一会儿，他低下头，在他的图表上潦草地写了些什么。");
            outputText("[pg][say:那么，你准备好我们就可以开始了。]");
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,471,FlagDict_Impl_.arrayReadInt(_loc1_,471) + 1);
         }
         else
         {
            outputText("你的双脚把你带回了蚁群，守卫再次示意你沿着唯一被照亮的隧道走下去。你进入斗兽场，当你步入洞穴时，你再次受到一个拿着剪贴板的瘦弱男性蚁人的迎接。他抬头看着你。");
            outputText("[pg][say:哦，太好了，你来了。我开始以为你是个懦夫。]还没等你回应他的侮辱，他就打断了你。[say:你准备好我们就可以开始了。希望你能比上一个人活得长。]");
         }
         menu();
         addButton(0,"战斗",antColiseumFight);
         addButton(14,"离开",leaveAntColony);
      }
      
      public function antColiseumFight() : void
      {
         var _loc1_:* = null as TentacleBeast;
         var _loc2_:* = null as Minotaur;
         var _loc3_:* = null as IMap;
         var _loc4_:* = null as Gnoll;
         clearOutput();
         get_images().showImage("ant-desert-coliseum");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,472) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,473) == 0)
         {
            spriteSelect(SpriteDb.get_s_tentacleMonster());
            outputText("你告诉比赛经理你准备好了。他点点头，带你进入竞技场的两个集结区之一。你透过栏杆看着体育场很快被填满。虽然几乎每张蚂蚁的脸在你看来都一模一样，但那些明显是战士的体型较大的蚂蚁与那些肯定是工蚁的体型较小的蚂蚁形成了鲜明的对比——或者也许他们只是更年轻；你分辨不出来。看着他们为即将到来的战斗聚集在一起，你证实了你第一次看到蚁后房间时形成的怀疑：除了公主和蚁后，每个蚁人都是男性的！凝视着人群，你发现两位皇室成员坐在一个似乎是为他们保留的特殊区域。害羞的公主的目光紧张地飘向你的房间，有那么一瞬间，你们的目光相遇了。");
            outputText("[pg]当你举起手准备挥手时，竞技场对面传来的蹒跚脚步声和撞击声打断了你。一个巨大的野兽剪影被戳着赶进了你对面的准备区。你眯起眼睛，试图看清对手的模样。就在这时，准备区的闸门落下，一只暴怒的触手怪冲到了竞技场中央。");
            outputText("[pg]你要和触手怪战斗了！");
            _loc1_ = new TentacleBeast();
            _loc1_.onDefeated = phyllaTentacleDefeat;
            _loc1_.onWon = phyllaTentaclePCLoss;
            startCombat(_loc1_);
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,472) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,473) == 1)
         {
            spriteSelect(SpriteDb.get_s_minotaur());
            outputText("当你到达角斗场时，你告诉角斗经理你准备好了；他点点头，把你领进竞技场的两个准备区之一。你透过栅栏看着看台几乎座无虚席，心里仍然难以接受这么多蚂蚁生活在沙子下面的事实；这里肯定有几百只。你凝视着欢呼的人群，发现王室成员坐在他们的专属区域。公主兴奋地用她的两只手臂向你挥手，但她的母亲抓住了它们并按了下去。奇拉本人看起来一如既往地威严和矜持。你看到蚁后在对你微笑，但那笑容背后似乎隐藏着某种邪恶。还没等你细想那可能是什么，角斗场两侧的闸门升起，你被推了出去。");
            outputText("[pg]你现在要和一只牛头人战斗，而且它还挥舞着一把巨斧！你立刻反应过来，意识到奇拉给你设了套，给牛头人装备了武器！当这只兽人狂野地咆哮着向你冲来时，你做好了准备。");
            _loc2_ = new Minotaur(true);
            _loc2_.onDefeated = phyllaBeatAMino;
            _loc2_.onWon = phyllaPCLostToMino;
            startCombat(_loc2_);
         }
         else
         {
            spriteSelect(SpriteDb.get_s_club_gnoll());
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,476) == 0)
            {
               outputText("在举行了适当的仪式后，经理带你来到竞技场的一个准备区。你透过栅栏看着看台，发现观众人数远远超过了容量。这里肯定有一千只蚂蚁……甚至可能是整个蚁群。你凝视着人群，找到了王室的座位，菲拉公主就坐在那里。公主的穿着比你平时看到的要华丽得多——她的胸部被一件精致的红蓝相间的裙子遮住，头发也梳理过，很好地衬托出她的脸庞。她的母亲不见踪影，你可以看出菲拉正在充分利用这个机会。她像人群一样向你挥手欢呼，也许是在她的指挥下，你听到人群开始高呼你的名字。看到菲拉和他们一起高呼，你感到精神振奋。当闸门升起时，你冲向竞技场中央，发出你最响亮的战吼；你的对手有些吃惊，但很快下定决心，准备迎接你的冲锋。");
            }
            else
            {
               outputText("你穿过隧道和洞穴网络，再次来到角斗场。活动经理迎接了你，并把你领到竞技场的一个准备区。随着角斗场挤满了观众，喧闹声越来越大；菲拉本人在她的包厢里向你挥手。你望向竞技场地板的另一边，那里的豺狼人似乎和你一样对战斗感到兴奋。闸门打开，你们向彼此冲去！");
            }
            outputText("[pg]你正在和一只豺狼人战斗！");
            _loc3_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc3_,476,FlagDict_Impl_.arrayReadInt(_loc3_,476) + 1);
            _loc4_ = new Gnoll();
            _loc4_.onDefeated = phyllaPCBeatsGnoll;
            _loc4_.onWon = phyllaGnollBeatsPC;
            startCombat(_loc4_);
         }
         get_monster().createStatusEffect(StatusEffects.NoLoot,0,0,0,0);
      }
   }
}

