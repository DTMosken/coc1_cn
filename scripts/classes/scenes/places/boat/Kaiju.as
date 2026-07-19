package classes.scenes.places.boat
{
   import classes.CoC;
   import classes.DynStat;
   import classes.ImageManager;
   import classes.PerkLib;
   import classes.Player;
   import classes.StatusEffects;
   import classes.Time;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.display.SpriteDb;
   import classes.globalFlags.KFLAGS;
   import classes.items.ConsumableLib;
   import classes.scenes.Camp;
   import classes.scenes.api.Encounter;
   import classes.scenes.areas.lake.AbstractLakeContent;
   import flash.Boot;
   import haxe.IMap;
   
   public class Kaiju extends AbstractLakeContent implements Encounter
   {
      
      public function Kaiju()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
      }
      
      public function yesTurnKaijuFuta() : void
      {
         clearOutput();
         get_images().showImage("kaiju-cocked");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,913,1);
         kaijuSprite();
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,914,FlagDict_Impl_.arrayReadInt(_loc1_,914) + 2);
         var _loc2_:int = 10;
         while(_loc2_ > 0)
         {
            _loc2_--;
            if(get_player().hasItem(get_consumables().P_DRAFT))
            {
               get_player().consumeItem(get_consumables().P_DRAFT);
            }
            else if(get_player().hasItem(get_consumables().INCUBID))
            {
               get_player().consumeItem(get_consumables().INCUBID);
            }
         }
         outputText("如果你不想看到一根巨大的绿色扶他肉棒在她双腿间晃荡，你一开始就不会提出这个建议。你的表态似乎让她的脸红得像甜菜一样，但她眼中那充满情欲的眼神却出卖了她的渴望。");
         outputText("[pg]因为她的手太大，无法摆弄那些小容器，她让你站在她的下唇上，而她则躺下，你将一瓶又一瓶的药剂倒进她张开的嘴里。当第十瓶药剂被倒空时，这个绿色的女孩几乎无法保持静止，在性快感和兴奋中扭动着。她用一只手将你抓起，同时张开双腿坐了起来，另一只手紧紧捂住她粉红色的下体，手掌疯狂地揉搓着她的阴蒂。[say:哦，我的女神，感觉太棒了！我要高潮了，我要高潮了，]她大喊着，她的手被她不断膨胀的阴蒂从胯部推开，那个粉红色的小肉球变成了绿色，形状也变得更加像阴茎。当她的阴蒂肉棒膨胀并发生变化时，她用手抓住了它，在变化完成之前狠狠地撸了两下，然后她用她那根全新的绿色水龟双性人肉棒射出了第一次！");
         outputText("[pg][say:哦，天上的众神啊，这就是男人的感觉吗？我还要更多！]她惊呼道，满怀期待地看着你。[say:好吧，给我一根肉棒是你的主意，所以你不会介意帮我用它，对吧？]");
         outputText("[pg]你挑起一侧眉毛看着她。怎么用？");
         outputText("[pg][say:哦，别看起来那么担心，我知道它塞不进你里面。好吧，除非我用一些强力的腐化魔法，而且你也疯狂地愿意，不过我们以后可以再讨论这个。但是来点尿道play怎么样？我以前见过一个牛头人把小拇指塞进他的肉棒里，我觉得你刚好能塞进去。]");
         outputText("[pg]等等，她想让你进她的老二里？她到底在偷窥什么样的牛头人啊？");
         outputText("[pg]还没等你评论、抗议，甚至质疑她计划的逻辑，她就已经剥去了你的[armor]，把你放在她的胯部前面，与她的精液裂口面对面。一大团先列腺液已经在她的龟头上形成，她新长出的肉棒显然有点像漏水的龙头。[say:杰罗尼莫！]她大喊一声，把你头朝下推入她那滴着粘液的顶端，你的头出人意料地轻松滑入她的老二，不过你的肩膀似乎就没那么容易了。她推挤着你，扭动着你，轻轻施加压力，直到你终于“啵”的一声整个人滑进去，一直没到腰部。她的肉棒里出奇地滑，被汗水和先列腺液润滑着，尽管她的通道很紧，你还是相对轻松地滑得更深，直到没过脚踝，双臂被紧紧压在身体两侧。你在她的老二外面稍微扭动了一下脚，然后这个变态的巨人用你的脚把你拉出来大半，接着再次把你塞进去。从你的视角，你几乎能一直看到她的蛋蛋里，令你恐惧的是，你看到一大团新的先列腺液正朝你涌来！你试图大喊或移动来引起这个绿色双性人的注意，但你的声音被闷住了，身体也被周围紧绷的肉棒肌肉束缚着。你深吸一口气，憋住呼吸，紧接着就被喷了一脸麝香味的甜腻先列腺液，鼻子里的气味让你想起了咸咸的……西瓜？你还没来得及辨认出气味，就被从她的肉棒里拽了出来，终于能呼吸了，她的先列腺液从你脸上滴落下来。");
         outputText("[pg][say:抱歉，我才想到那可能会是个问题。但我有个更好的主意，这样我就能看到你可爱的脸了！]她说道，看着你滴满先列腺液的脸，高兴得涨红了脸。[say:天上的众神啊，[name]，你看起来就像个婊子！玛莱作证，你让我欲火焚身！]");
         outputText("[pg]她很快再次把你摆在她的肉棒前，这次是脚朝下，这样她就能让你的头露在外面。你可以看到你的腿慢慢滑进她绿色的肉棒里，她的精液裂口将你吞没到[hips]。你能感觉到她龟头的内壁从四面八方挤压着你，紧紧夹住你的[butt]");
         if(get_player().hasCock())
         {
            outputText("和你的[cocks]");
         }
         outputText("。[say:哇，你待在我的肉棒里看起来真是太漂亮了！]女巨人高兴地说着，眼中闪烁着变态的欲望。她将你进一步推入，直到你的[chest]，她那颤抖、紧缩的肉棒似乎在给你做着近乎放松的按摩。你简直不敢相信，这个不自然的女巨人对她尿道壁的控制力，竟然和最淫荡的魅魔对她小穴的控制力一样强！只有你的手臂和头露在她的肉棒外面，她那不寻常的器官开始在你全身挤压、起伏。看来她的新鸡巴想给你一个快乐的结局。");
         outputText("[pg]从那充满情欲的娇喘声来判断，这个快乐的绿色女孩快到极限了，她空出的那只手像蛇一样滑下去，轻轻抚摸着她巨大的肉棒。[say:要射了，我要射了，要射了！]她大喊着，在你之前达到了高潮。突然，她的老二根部变宽了，她的第二发精液朝你涌来！由于你的身体紧紧地堵在路上，那些腐化的水龟精液无处可去，只能往里钻，你的[butt]瞬间被填满，肠道里灌满了精液！");
         if(get_player().hasCock())
         {
            outputText("太多的精液灌满了你的屁股，不可避免地压迫着你的前列腺，让[eachCock]随着不断增长的欲望而变得僵硬。");
         }
         if(get_player().hasVagina())
         {
            outputText("你的屁股并不是唯一感觉到被淹没的地方，你的[vagina]和子宫也被这个双性人的精液塞满了。");
         }
         outputText("[pg]在压力最终把你像红酒软木塞一样从她的肉棒里弹出来之前，你勉强达到了自己的高潮。你在湖面上方的某个地方失去了意识。");
         outputText("[pg]大约一个小时后你醒了过来，穿戴整齐地躺在你的船里，船已经停靠在岸边。绿巨人维纳斯就在那里，坐在附近凝视着湖面，直到你的动作引起了她的注意。[say:嘿，偷窥狂，]她高兴地说道，比你在她肉棒里时平静多了，但眼中依然带着挥之不去的情欲迷雾。[say:听着，我只是想谢谢你。没多少人能接受我，毕竟我的体型和那些可能会让魅魔晕倒的变态嗜好，别装作你不知道。但你一直很酷，即使我把你塞进那些整个人都不该进去的性爱洞里。而且，你给了我一根肉棒。甚至在我开始像海绵一样吸收腐化液体之前，我就想要一根老二了，现在多亏了你，我有了。所以……谢谢你，宝贝，]她说完，转身涉水走回湖中。真是个奇怪又充满感激的女孩。");
         get_player().orgasm("Generic");
         dynStats(DynStat.Cor(1));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function yesKaijuGimmePeepShowsMoar() : void
      {
         clearOutput();
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,914,FlagDict_Impl_.arrayReadInt(_loc1_,914) + 1);
         get_images().showImage("kaiju-geyser");
         outputText("你表达了对她表演的赞赏，并表示希望她继续下去。她对你的建议报以微笑，非常乐意再来一次安可表演。她把手伸向颤抖的肉棒，一根手指慢慢地顺着阴茎的长度向上划过，然后用一只手抓住它，另一只手的手掌开始摩擦龟头。她的手仍然沾满了自己的淫液，在肉棒上顺滑地滑动着。");
         outputText("[pg]她又开始呻吟起来，甚至比上次还要淫荡。她的臀部开始挺动，几乎是在操自己的手。一滴滴先列腺液开始从她的龟头上冒出来，她迅速地用空着的手掌擦掉，然后把手掌凑到脸前，舔掉手掌上的污迹，她的身体因为喝下自己的先列腺液而高兴得颤抖起来。");
         outputText("[pg][say:哦，太棒了！]她喘息着，把手放下来，开始用双手抚摸她那根跳动的肉棒。[say:求求你，求求你看着我高潮！]这位女巨人大声恳求你，她火力全开，把剩下的所有精力都倾注在肉棒上。没过多久，她就像间歇泉一样喷发了，把双性人龟女的精液喷向高空，然后又像雨点一样落回这个绿皮肤女孩身上。她的双手开始在躯干上滑动，轻轻地将精液按摩进皮肤里。");
         dynStats(DynStat.Lib(1),DynStat.Lust(33));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function yesBurnDatClit() : void
      {
         clearOutput();
         get_images().showImage("kaiju-get-off");
         get_player().changeFatigue(30,1);
         outputText("你眯起眼睛，集中精神，带着致命的意图。你打了个响指，绿皮女孩的手指就被一团白色的火焰包围了！她大叫一声，把你扔回船里，把手伸进湖水里。[say: 哎哟！太坏了！]她说着，把烧焦的手指放进嘴里吸吮。没过多久，她对疼痛的自然反射就被她不自然的欲望所掩盖，她开始色情地吸吮手指，另一只手伸向她的阴茎和阴户。她似乎对你失去了兴趣，试图让自己高潮。你趁机悄悄溜走。");
         dynStats(DynStat.Lust(15));
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,911,1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function urethraFuckDatGiantCock() : void
      {
         clearOutput();
         get_images().showImage("kaiju-cocked");
         outputText("你用探询的目光看着她。你对她那根巨大的绿色肉棒很感兴趣，但你要怎么使用这么巨大的工具呢？");
         outputText("[pg]维纳斯想了一会儿，随后她那充满欲望的眼睛亮了起来，显然是想到了一个令人愉悦又变态的主意。[say:来点尿道play怎么样？我以前见过一个牛头怪把小拇指插进他的鸡巴里，我想你应该能塞进去。]");
         outputText("[pg]等等，她想让你进她的老二里？她到底在偷窥什么样的牛头人啊？");
         outputText("[pg]还没等你评论、抗议，甚至质疑她计划的逻辑，她就已经剥去了你的[armor]，把你放在她的胯部前，面对面地对着她的精液缝。她那粗大的肉棒显然有点像漏水的龙头，龟头上已经形成了一大团先列腺液。[say:杰罗尼莫！]她大喊一声，把你脸朝下推入她那滴着粘液的顶端，你的头出乎意料地轻松滑入她的鸡巴，不过你的肩膀似乎就没那么容易了。她推挤、扭动着你，轻轻施加压力，直到你终于完全滑入，直达腰部。她的鸡巴里出乎意料地滑溜，被汗水和先列腺液润滑着，尽管通道很紧，你还是相对轻松地滑得更深，直到没入脚踝，双臂被紧紧压在身体两侧。你在她的鸡巴外面稍微扭动了一下脚，然后这个变态的巨人就抓住你的脚把你拉出来大半，接着再次把你塞进去。从你的视角，你几乎能一直看到她的睾丸里，令你恐惧的是，你看到一大团新的先列腺液正朝你涌来！你试图大喊或移动来引起这个绿色双性人的注意，但你的声音被闷住了，身体也被周围紧绷的肉棒肌肉束缚着。你深吸一口气，憋住呼吸，紧接着就被喷了一脸充满麝香甜味的先列腺液，那气味让你想起了咸咸的……西瓜？你还没来得及分辨那气味，就被从她的鸡巴里拽了出来，终于能呼吸了，她的先列腺液从你脸上滴落下来。");
         outputText("[pg][say:抱歉，我才想到那可能会是个问题。但我有个更好的主意，这样我就能看到你可爱的脸了！]她说道，看着你滴着先列腺液的脸，高兴得脸红了。");
         outputText("[pg][say:天上的神明啊，[name]，你看起来就像个婊子！玛莱作证，你真让我兴奋！]");
         outputText("[pg]她很快再次把你摆在她的肉棒前，这次是脚朝下，这样她就能让你的头露在外面。你可以看到你的腿慢慢滑进她绿色的肉棒里，她的精液裂口将你吞没到[hips]。你能感觉到她龟头的内壁从四面八方挤压着你，紧紧夹住你的[butt]");
         if(get_player().hasCock())
         {
            outputText("和你的[cocks]");
         }
         outputText("。[say:哇，你在我的鸡巴里看起来绝对华丽！]女巨人高兴地说着，眼中闪烁着变态的欲望，她把你进一步推入，直到你的[chest]，她那颤抖、挤压的肉棒似乎在给你做一种几乎令人放松的按摩。你简直不敢相信，但这个不自然的女巨人对她尿道壁的控制力，简直和最淫荡的魅魔对她小穴的控制力一样强！只有你的手臂和头露在她的肉棒外面，她那不同寻常的器官开始沿着你的身体挤压和起伏。看来她的鸡巴想给你一个快乐的结局。");
         outputText("[pg]从那充满欲望的娇喘声来看，这个快乐的绿色女孩快到极限了，她空出的手蜿蜒而下，轻轻抚摸着她巨大的肉棒。[say:要去了，我要去了，要去了！]她大喊着，在你之前达到了高潮。突然，她的鸡巴根部变宽，她的精液朝你射来！由于你的身体紧紧地堵在通道里，被腐化的水龟精液无处可去，只能向内涌入，你的[asshole]突然被填满，肠道被精液淹没！");
         if(get_player().hasCock())
         {
            outputText("太多的精液灌满了你的屁股，不可避免地压迫着你的前列腺，让[eachCock]随着不断增长的欲望而变得僵硬。");
         }
         if(get_player().hasVagina())
         {
            outputText("你的屁股并不是唯一感觉到被淹没的地方，你的[vagina]和子宫也被这个双性人的精液塞满了。");
         }
         outputText("你设法达到了自己的高潮，就在压力最终把你像软木塞从酒瓶里一样从她的鸡巴里弹出来之前。你在湖面上方的某个地方失去了知觉。");
         outputText("[pg]大约一个小时后你醒来，穿戴整齐地躺在你的船里，船已经停靠在岸边。绿巨人维纳斯一定接住了你。");
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,914,FlagDict_Impl_.arrayReadInt(_loc1_,914) + 1);
         get_player().orgasm("Generic");
         dynStats(DynStat.Cor(1));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function talkToKaiju() : void
      {
         clearOutput();
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,912,FlagDict_Impl_.arrayReadInt(_loc1_,912) + 1);
         var _loc2_:int = 914;
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,_loc2_,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,_loc2_) - 1);
         outputText("[say:哦？你想聊聊？]她有些惊讶地说，[say:聊什么？]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,912) == 1)
         {
            outputText("[pg]你让她谈谈她自己，以及她是谁。");
            outputText("[pg][say:嗯，我不太确定该说什么。恶魔第一次接管这里后不久，我作为家里最小的孩子出生了。母亲曾经是我们部落的萨满，一个美丽的女人，以能呼风唤雨或预测未来片段的舞蹈而闻名。我从未见过我的父亲，但母亲声称他是个恶魔。至于他到底是不是，还是她只是因为他没有留下来抚养孩子而侮辱他，我就不知道了。我同父异母的姐姐们都走上了成为女祭司的道路，而我的哥哥成了一名战士。最终他去和恶魔战斗了，我再也没见过他，]她说道，声音中透出一丝悲伤。");
            outputText("[pg][say:我在沼泽里快乐地长大。我会和同龄的女孩以及姐姐们一起玩，偶尔我们甚至会去湖边和鲨鱼女孩们玩，尽管那时她们已经深陷腐化，总是取笑我们。有一两次，从山上或森林里下来的小恶魔试图强暴我，但我只是像学过的那样缩进壳里，他们就碰不到我了。那之后，在哥哥离开前，我向他学了一些格斗技巧。我现在可能体型巨大，掌控一切，但即使在我小的时候，我的左勾拳也很厉害！]维纳斯似乎很高兴回忆起这段生活，一抹愉快的微笑在她的唇边停留了片刻，她的眼睛似乎也温暖地变得迷离。但这并没有持续多久。");
            outputText("[pg][say:那之后似乎没发生什么事。随着土地变得越来越腐败，我的家人和朋友开始慢慢疏远，我大多时候都是一个人。不久之后，腐化蔓延到了湖里，我慢慢地对恶魔开始从管道和软管里喷入水中的东西上瘾了，我开始生长……生长……不断生长。现在，周围仅有的几个人似乎都很怕我。甚至连恶魔都避开我这么大体型的人。]");
            outputText("[pg]讲完故事后，她似乎变得沉默寡言，退缩到了自己的世界里。她感谢你的倾听，然后送你上路。");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,912) == 2)
         {
            outputText("[pg]你决定问她一个困扰你很久的敏感问题。她是怎么变成这么大的巨人的？");
            outputText("[pg][say: 我就知道你迟早会问的，]这个绿皮肤的大个子女孩说道，手指在下唇上敲了几秒钟，思考着该怎么回答。[say: 嗯，这一切都要从恶魔占领这片土地之后说起。从我记事起，我就经常在湖泊和沼泽之间来回穿梭。有一天，我独自一人在湖里洗澡，突然……湖水变了。当时我也说不上来是怎么回事，但越洗越觉得脏。我很快就离开了，决定暂时远离这里……但那天晚上我做了非常强烈的梦，和我以前做过的任何梦都不一样。我满脑子都是赤裸的身体在我的身体上摩擦，各种形状和大小的巨大肉棒挑逗着我的小穴或丰满的臀部，在我的阴唇或臀瓣之间滑动。在那之后，我似乎就控制不住自己了，我必须回到湖里再泡一次，一次又一次。随着湖水变得越来越腐化，我的梦境也越来越强烈，我必须找到我快感的源泉。于是我开始探索湖泊的每一寸角落，直到我最终来到了湖泊与山脉交汇的地方。]");
            outputText("[pg]她继续说着，身体似乎因为愉悦而颤抖。[saystart]我不知道他们为什么要污染湖水，也不知道他们用的是什么，但我找到了腐化流入湖泊且最强烈的地方。我每天都去那里吸收那些化学物质的温暖和美味的腐化。它增加了我的欲望，随着时间的推移，也增加了我的体型。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2024) == 1)
            {
               outputText("但美味液体的流动似乎已经停止了。");
            }
            else if(kaijuCock())
            {
               outputText("但不知为何，液体的倾泻停止了，但在那之前，有一股最后、巨大的腐化液体喷发。它太强烈了，让我进一步改变，让我长出了这个，[sayend]她说着，从湖水中升起，露出一根巨大的绿色肉棒。");
            }
            outputText("[pg]你向这位女巨人道谢，感谢她的解释，然后划船离开。");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,912) == 3)
         {
            outputText("[pg]你决定问问还有没有其他的龟人。");
            outputText("[pg][say: 哦，有的，很多，]她说道，[say: 虽然我们现在都分散在各地，很难找到。实际上我们分为两群。淡水龟更像爬行动物，光头没有耳朵，也没有乳头，虽然她们还是有乳房。我承认我花了很多时间在湖里游泳，但我是一只陆龟。有头发、耳朵、还有可以拉扯把玩的挺拔乳头……]她说着，拉扯着一个巨大的粉色肉突来演示。[say: 水龟总是嘲笑我们，说我们看起来更像背着壳的地精而不是乌龟，但我认为她们只是嫉妒。]");
            outputText("[pg][say: 龟类社会美好而简单。大祭司和她的祭司女儿们负责村庄的生活，男人们是战士或农民，我们通常过着不受干扰的生活。一旦我们缩进壳里，就没有人能惹我们，至少在恶魔带着他们的催情魔法到来之前是这样。当你高潮的时候，是没法躲在壳里的。]");
            outputText("[pg]她叹了口气，谈话似乎结束了。");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,912,0);
         }
         doNext(get_camp().returnToCampUseOneHour);
         if(get_player().get_inte100() < 50)
         {
            dynStats(DynStat.Inte(1));
         }
         if(get_player().lib > 50)
         {
            dynStats(DynStat.Lib(-1));
         }
      }
      
      public function stopItPlease() : void
      {
         clearOutput();
         get_images().showImage("kaiju-get-off");
         outputText("你大叫一声，挥手赶走那只好奇的手。你告诉她你没有冒犯的意思，但在如此悬殊的体型和力量差距下，你害怕这样一个女人的抓握会意外地造成什么后果。她似乎对此有些伤心，但没有再试图抓你。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function repeatKaijuEncounter() : void
      {
         clearOutput();
         kaijuSprite();
         get_images().showImage("kaiju-encounter");
         outputText("当你在湖中划船时，你遇到了一个熟悉的景象，一个像岛屿一样大的巨型龟壳。当你划近它时，水龟女巨人维纳斯从被腐化的湖水中浮现出来。一只巨大的绿手玩弄着她巨大的乳房，另一只手留在水里玩弄着她看不见的私处。过了好一会儿她才注意到你。[say: 噢天哪，又是你，我最喜欢的偷窥狂！你是回来偷看的，还是想找点真正的乐子？]");
         menu();
         addButton(0,"偷窥",peekAtSomePhatAssKaijuButt);
         addButton(1,"抱胸",kaijuRepeatBoobHug);
         addButton(2,"操她",fuckThisGiantYouDumbCunt);
         if(kaijuCock())
         {
            addButton(3,"尿道交",urethraFuckDatGiantCock);
         }
         else if(get_player().itemCount(get_consumables().INCUBID) + get_player().itemCount(get_consumables().P_DRAFT) >= 10)
         {
            outputText("[pg]你突然想到，你身上的男魅魔药剂足够多，甚至能影响到这个体型庞大的龟女。也许你可以给她长根鸡巴？");
            addButton(3,"给她鸡巴",yesTurnKaijuFuta);
         }
         else
         {
            addButtonDisabled(3,"赠予阳具","也许用十瓶梦魔精华就能让她蜕变？");
         }
         addButton(4,"交谈",talkToKaiju);
         addButton(14,"离开",leaveRepeatKaiju);
      }
      
      public function peekAtSomePhatAssKaijuButt() : void
      {
         clearOutput();
         get_images().showImage("kaiju-peek");
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,914,FlagDict_Impl_.arrayReadInt(_loc1_,914) + 1);
         outputText("[say: 哦，你真是个调皮鬼，]这位绿色的女泰坦说道，脸上浮现出诱惑的笑容。[say: 所以你想看我一次又一次地把自己弄到淫荡的高潮？你运气真好，我最喜欢有人看着了，]她解释道，似乎是个十足的暴露狂。她用一只手把你的船举起来，带你到一个长满草的小岛上。把船放在岸边后，她带你来到一个大山丘，这样当她仰卧时，你就能有一个完美的视野，她巨大的龟壳几乎压平了一整片蓝色的小花。[say: 现在好好欣赏表演吧，]她轻笑着说，然后双手伸向她最私密的地方，左手蜿蜒而下，摸向她流着淫液的小穴，右手开始捏住一颗挺拔的乳白色的乳头。");
         outputText("[pg]她开始探索她松弛的肉洞，中指轻松地滑过她的阴唇");
         if(!kaijuCock())
         {
            outputText("同时她的拇指开始揉搓她的阴蒂");
         }
         else
         {
            outputText("同时她的拇指开始上下揉搓她慢慢变硬的肉棒");
         }
         outputText("。她的另一只手正忙着用食指和拇指捏住她巨大的乳头，以惊人的力度拉扯着她的乳房。她开始呻吟，慢慢喘息，汗水开始在她的身体上形成。她迅速将另一根手指滑入她大张的阴户，然后又是一根。她的右手在乳房之间飞舞，捏着乳头或揉捏着乳房，爱抚着她巨大的双峰。随着她的速度和无耻的堕落程度不断增加，她似乎倾尽了全力。很快，她用四根手指撑开了她的小穴，然后她的拇指和指关节也紧随其后，开始用拳头操弄自己。[say: 哦，是的，哦，以玛莱的名义，是的！]她尖叫着，在狂喜中呻吟，她的女性体液浸透了她巨大的手。[say: 求你了，看着我，]她说着，把注意力转向你。当她的手在她湿透的、被撑开的小穴里进进出出时，你根本不想移开视线。");
         if(!kaijuCock())
         {
            outputText("[pg]她的另一只手离开乳房，向下移动去刺激她的阴蒂");
         }
         else
         {
            outputText("[pg]她的另一只手从乳房飞快地移到她现在跳动着的肉棒上，慢慢地抚摸着它，紧紧地挤压着它");
         }
         outputText("。她狂热地抽插着紧握的拳头，尽可能深地探入自己的身体，速度越来越快，很快就达到了高潮，她的淫液从拳头周围喷射而出，浸透了她的小臂。她伴随着一声清晰的“扑通”声慢慢抽出手，将双手放回乳房，按摩着她巨大的肉垫，直到两股浓稠的乳汁开始从她的乳头流出，顺着乳房流下。");
         dynStats(DynStat.Lust(10 + get_player().lib / 3));
         if(kaijuCock())
         {
            outputText("[pg]虽然她似乎要结束表演了，但你知道你可以鼓励她做得更过火。你要怂恿她吗？");
            menu();
            addButton(0,"是",yesKaijuGimmePeepShowsMoar);
            addButton(1,"否",noKaijuPeepShows);
         }
         else
         {
            menu();
            addButton(0,"继续",noKaijuPeepShows);
         }
      }
      
      public function noMeetingKaijus(param1:Boolean = false) : void
      {
         clearOutput();
         get_images().showImage("kaiju-get-off");
         outputText("你继续划船，远离了那座多山的岛屿。");
         if(param1)
         {
            outputText("以后最好也避开它。");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,911,1);
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function noKaijuPeepShows() : void
      {
         clearOutput();
         get_images().showImage("kaiju-get-off");
         outputText("[say:天哪，有观众看着感觉好多了！]她气喘吁吁地说。你感谢她的表演，她把你放回船上，推了你一把。你划船离开，考虑着也许可以再回来看一场表演。");
         dynStats(DynStat.Lib(1));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function mockDatTurtleGirl() : void
      {
         clearOutput();
         get_images().showImage("kaiju-mocking");
         outputText("你嘲笑这个巨人，问她什么样的女孩会长肉棒。一阵狂怒席卷了她，她的蓝眼睛突然闪烁着明亮的红光，她用一只巨大的手紧紧地抓住你，把你的手臂紧紧地按在身体两侧，让你动弹不得。[say:你竟敢！]她对你说，两只恶魔的角从她的红发中伸出来。工厂的污染显然给了她比一根巨大的男性器官更多的东西。[say:你只要说不就行了，没必要这么粗鲁！也许这能教你一点礼貌，]她说着，张开手，让她那根绿色的新肉棒落到你身上，然后再次握紧手，紧紧地抓住你和她勃起的器官。你只能看到她那根抽搐的绿色肉棒。[say:我想看看这东西是不是功能齐全，所以抓紧了！]");
         outputText("[pg]她开始前后移动她的手，慢慢地让你在她的绿色肉棒底部滑动。虽然压在你身上的巨大阴茎很重，你也被紧紧地挤压着，但当她从上到下抚摸她那巨大的双性人肉柱时，你似乎没有被压碎的危险。你甚至能闻到她龟头处形成的咸味先列腺液的味道。");
         if(get_player().balls > 0 && get_player().ballSize >= 6)
         {
            outputText("你的[balls]靠在双性人的手上，随着她为了让自己高潮而使用的速度和力量，每一次雷鸣般的抚摸都发出响亮的碰撞声。");
         }
         if(get_player().hasCock())
         {
            outputText("你能感觉到你的[armor]变得越来越紧，因为[eachCock]在衣服下开始变硬，这是因为肉棒不断挤压你的阴茎造成的。");
         }
         if(get_player().hasVagina())
         {
            outputText("你开始感觉到双腿之间有一股湿意，你的小穴开始漏出淫液，因为双性人的阴茎对你全身的剧烈摩擦让你的性欲飙升。");
         }
         if(get_player().get_gender() == 0)
         {
            outputText("这般剧烈的摩擦让你兴奋得双颊泛红。");
         }
         if(get_player().cor < 33)
         {
            outputText("你简直不敢相信自己居然会被这种事挑起性欲。你不是应该是个勇者吗？");
         }
         else if(get_player().cor < 66)
         {
            outputText("哇，这还真让你兴奋起来了。你甚至开始怀疑自己到底是不是个勇者。");
         }
         else
         {
            outputText("你现在只想发泄出来。");
         }
         outputText("[pg][say: 看到了吗？你真是个完美的小肉棒玩具，]女巨人一边娇嗔，一边加快了套弄的速度。[say: 你让我的鸡巴爽翻了！]");
         outputText("[pg]你伸长脖子，看到更多的先列腺液从她的龟头涌出，散发出一股强烈的性爱气味。她的先列腺液里难道含有信息素吗？这个念头很快就被你抛到了脑后，因为你被迫在她巨大的肉棒上更快、更紧地滑动。她那根肉棒散发出的热量让你紧绷的肌肉暂时放松下来，但随后又再次僵硬，而这一次，是因为高潮的阵痛");
         if(get_player().hasCock())
         {
            outputText("当你射在你的[armor]里时");
         }
         outputText("。你能感觉到女巨人的肉棒在痉挛，随着一股精液冲过肉棒，你感觉到她肉棒传来的压力在增加，就像火山喷发一样，白色的岩浆从她的龟头喷涌而出。[say: 哇哦，这量可真够大的，]她说道，似乎对自己相当自豪。她把你放回船上，粗暴地把船推向湖心。[say: 学点规矩吧，你这个坏家伙！]她大喊道。");
         get_player().orgasm("Generic");
         dynStats(DynStat.Cor(1));
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,911,1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function meetDatKaijuYo() : void
      {
         clearOutput();
         get_images().showImage("kaiju-encounter");
         kaijuSprite();
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,910,1);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2024) == 2)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,913,1);
         }
         outputText("你踏上山丘，慢慢向山顶走去。这块岩石似乎对称得有些不自然，更像是一个巨大的倒置椭圆形。在周围走动，似乎没有什么值得探索的地方。你决定返回船上，突然岛屿晃动了一下，你差点被掀翻在地。你环顾四周，想知道是地震还是袭击，突然岛屿开始剧烈摇晃。你跑向船，几乎是摔进去的，因为你差点失去平衡。岛屿似乎正在迅速升出水面，直到一个巨大的水龟女孩耸立在你面前！你误以为是岛屿的东西，其实是一个巨大的龟壳！");
         outputText("[pg]她猛吸了一大口气，然后伸了个懒腰，在龟壳允许的范围内尽量拱起背部，绿色的双手在她那巨大的胸部附近挥舞。你打量着这位绿色女巨人，从她湿漉漉却卷曲的红色卷发，到她深绿色的皮肤，几乎黑色的嘴唇，她目前正淫荡地抚摸着的巨大乳房，再到坚硬的龟壳，龟壳的前部覆盖着她的肚子，却像某种变态的硬质紧身胸衣一样支撑着她暴露的乳房。她捏住一颗挺拔的乳头，舒服地娇喘着，最后睁开眼睛，注意到了你。");
         outputText("[pg][say: 哎呀，有客人？还是只是个偷偷摸摸的偷窥狂？]她一边问，一边托着乳房大笑。[say: 你真是个小东西。或者也许是因为我长了这么多可怕的肉。在恶魔开始把那些美味的液体泵入湖中之前，我的身材要娇小得多。恐怕我有点贪吃，长了几磅。你觉得呢？小维纳斯是不是做得太过分了？]");
         outputText("[pg]无论她长了多少肉，似乎都长在了上面。尽管有绿色的皮肤和龟壳，但除了巨大的体型和比例外，她看起来完全是人形。她似乎跪在湖里，很难估计她的确切身高。虽然她的乳房比比例稍大，但其余部分与她这种极端身高的人的健美身材相匹配。除了体型之外，从她一边拉扯着自己匀称的乳房，一边死死盯着你的样子来看，倒入湖中的腐化液体似乎也增强了她的欲望。看来她期待一个回答。你该怎么做？");
         menu();
         addButton(0,"赞美",complimentKaiju);
         if(!get_player().isGenderless())
         {
            addButton(1,"调情",flirtWithKaiju);
         }
         addButton(2,"侮辱",insultTheKaijuFirstMeeting);
      }
      
      public function letKaijuHaveWayWithYou() : void
      {
         clearOutput();
         outputText("当那只手坚定而温柔地把你抱起来，带向她丰满的胸部时，你没有动弹。她把你紧紧地抱在一个乳房上，几乎要用乳肉让你窒息。她挺拔的乳头近看似乎很大，当她开始在她的巨大乳房上上下摩擦你时，它几乎从你的头上弹开");
         if(get_player().hasCock())
         {
            outputText("，[eachCock]在你的[armor]里因为刺激而变得坚挺，你的整个身体都被用来进行这场越来越像是一场巨大的乳交的活动");
         }
         outputText("。");
         if(get_player().hasVagina())
         {
            outputText("你的[vagina]因为身体不断增长的性欲而变得湿润。");
         }
         outputText("[pg][say: 哎呀，看来有人很享受我特别的拥抱呢，] 这位巨大的美人注意到了你不断高涨的性欲，说道。这位充满欲望的巨人脱掉了你[armor]的下半部分，露出了你的");
         if(get_player().get_gender() == 3)
         {
            outputText("[cocks]和[vagina]");
         }
         else if(get_player().get_gender() == 1)
         {
            outputText(get_player().multiCockDescriptLight());
         }
         else if(get_player().get_gender() == 2)
         {
            outputText("[vagina]");
         }
         else
         {
            outputText("赤裸的下体");
         }
         outputText("。[say:我们来找点乐子吧！]");
         if(get_player().hasCock())
         {
            get_images().showImage("kaiju-cocked");
            outputText("[pg]她把你举到她的乳头前，让你那根跳动着的肉棒");
            if(get_player().cockTotal() > 1)
            {
               outputText("");
            }
            if(get_player().balls > 0)
            {
               outputText("和[balls]");
            }
            outputText("靠在她那挺拔粉嫩的敏感部位上。当她的手慢慢地沿着她坚挺的乳头摩擦你的私处时，她高兴地咕咕叫着。她开始微微弹跳，以她的体型来说，这意味着一座名副其实的乳房山开始重重地拍打你的下半身。[say: 哦，是的，]她说着，在狂喜中呻吟，[say: 操我的奶子！]你似乎没有选择的余地，因为她加快了速度，几乎是粗暴地把你撞向她光滑的绿色皮肤和坚硬的粉色乳头。尽管她的乳房相对柔软，但那仍然是数百磅重的乳肉。仿佛不满足于仅仅用乳房闷住你，她伸出一根绿色的小指，开始打你的屁股，她可能认为这种方式很轻柔，但打在你的[butt]上却很重。几下拍打让你的屁股又红又麻，每一次拍打都把你的[cocks]进一步推入柔软的乳房和坚挺的乳头中。[say: 求你了，射在我身上！]她命令道，你的身体几乎像是在配合她一样服从了，精液飞溅，用你身体能产生的尽可能多的精液涂满了她的乳房。");
            if(get_player().balls > 0)
            {
               outputText("当你慢慢地将精液排空在绿色的肉体上时，你的[balls]开始隐隐作痛。");
            }
            get_player().orgasm("Dick");
         }
         else if(get_player().hasVagina())
         {
            get_images().showImage("kaiju-boobjob");
            outputText("[pg]她张开你的双腿，慢慢地将你粉嫩的阴唇对准位置，你的[vagina]就在她那巨大的、像鸡巴一样的乳头正前方徘徊！伴随着一声欢愉的尖叫，她将乳头顶端推入你的小穴，她的眼睛几乎翻白，慢慢地、平稳地将她的乳头一寸一寸地塞进你被撑开的[vagina]里。");
            get_player().cuntChange(14,true,true,false);
            outputText("有什么湿润的东西开始从塞满你小穴的坚硬女性器官中漏出，你震惊地意识到她一定是在分泌乳汁！女巨人的乳汁润滑了你的通道，让她能更轻松地将她那跳动着的坚硬塞进你的体内，直到最后她的乳头触底，你的阴唇亲吻着粉红色的乳晕。你的[vagina]紧紧夹住她，捏住她的乳头，将她推向更深处，这很快就变成了狂喜的高潮。她分泌乳汁的乳房突然喷发，将几加仑的堕落乳汁倾泻进你的子宫，迅速撑大了你的肚子，直到你看起来胖乎乎的，然后就像怀了三胞胎一样！");
            outputText("[pg]她的乳头弹了出来，乳汁喷了你一身，让你浑身浸透在光滑的白色中。你希望这对你的皮肤有好处。");
            get_player().orgasm("Vaginal");
         }
         else
         {
            outputText("[pg]巨女开始呻吟，她将你在她的乳头周围摩擦，将你的身体紧紧地压在她的乳房上。她把你移到她的另一个乳房，用你的身体来挑逗她另一个变硬的乳头。[say:你介意舔一下吗？求你了？]她问道，把你的脸压在她的乳头上。你张开嘴想伸出舌头，突然她把它推到你的嘴上，很快就把最初几英寸的粉色乳头塞过了你的嘴唇。你的嘴里塞满了乳头肉，你的舌头被推到了嘴底。她慢慢地将更多的自己塞进你体内，她的乳头滑进你的喉咙。当你突然感觉到液体喷射进你的肠胃时，她的呻吟声变得更大了。她开始分泌乳汁，给你灌满了被污染的海龟奶！你很快就被灌满了，你的胃因为几加仑的白色液体而膨胀，直到你咕噜咕噜地喝着奶，这些东西从你嘴里的乳头周围漏出来。当你觉得你快要爆炸的时候，她把乳头弹了出来，用她的乳汁覆盖了你。");
            get_player().changeFatigue(-50);
         }
         outputText("[pg][say:天哪，那真是一个巨大的拥抱。我想我需要再睡一觉。有空再来看我，]她说着，慢慢地把你放回船上。当这个快乐的绿色巨女咯咯地笑着慢慢涉水离开时，你慢慢地划走了。");
         dynStats(DynStat.Cor(1));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function leaveRepeatKaiju() : void
      {
         clearOutput();
         get_images().showImage("kaiju-get-off");
         outputText("你礼貌地拒绝了任何选项，向绿色女孩道别，然后划船离开。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function kaijuSprite() : void
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,913) == 0)
         {
            spriteSelect(SpriteDb.get_s_venus());
         }
         else
         {
            spriteSelect(SpriteDb.get_s_venus_herm());
         }
      }
      
      public function kaijuRepeatBoobHug() : void
      {
         clearOutput();
         get_images().showImage("kaiju-boobjob");
         outputText("你决定和她那巨大的乳房玩一会儿，这应该会很有趣。");
         outputText("[pg][say: 哦，看来你喜欢我的胸部，对吧？] 她说着，脸上浮现出笑容。[say: 我一直想要像山一样大的胸部，既然现在有了，为什么不拿它们找点乐子呢？我们来“抱抱”吧！] 她继续说着，伸手把你抓了起来。");
         outputText("[pg]你没有反抗，任由那只手坚定而温柔地将你抓起，带向她丰满的胸部。她将你紧紧按在一个乳房上，你几乎要窒息在乳肉里了。她那挺拔的乳头近看显得无比巨大，几乎要在你头上弹跳起来。她开始用你那巨大的乳房上下摩擦着你");
         if(get_player().hasCock())
         {
            outputText("，[eachCock]在你的[armor]里因为刺激而变得坚挺，你的整个身体都被用来进行这场越来越像是一场巨大的乳交的活动");
         }
         outputText("。");
         if(get_player().hasVagina())
         {
            outputText("你的[vagina]因为身体不断增长的性欲而变得湿润。");
         }
         outputText("[pg][say: 哎呀，看来有人很享受我特别的拥抱呢，] 这位巨大的美人注意到了你不断高涨的性欲，说道。这位充满欲望的巨人脱掉了你[armor]的下半部分，露出了你的");
         if(get_player().hasCock())
         {
            outputText(get_player().multiCockDescriptLight());
         }
         if(get_player().isHerm())
         {
            outputText("和");
         }
         if(get_player().hasVagina())
         {
            outputText("[vagina]");
         }
         if(get_player().isGenderless())
         {
            outputText("赤裸的下体");
         }
         outputText("。[say:我们来找点乐子吧！]");
         if(get_player().hasCock())
         {
            outputText("[pg]她把你举到她的乳头处，让你那跳动着的勃起");
            if(get_player().cockTotal() > 1)
            {
               outputText("");
            }
            if(get_player().balls > 0)
            {
               outputText("和[balls]");
            }
            outputText("贴在她那挺拔粉嫩的敏感部位上。当她的手慢慢地将你的私处沿着她坚挺的乳头摩擦时，她高兴地咕哝着。她开始微微弹跳，以她的体型来说，这意味着一座名副其实的乳房山开始重重地拍打你的下半身。[say:哦，是的，]她呻吟着，沉浸在狂喜中，[say:操我的乳房！]你似乎别无选择，因为她加快了速度，几乎是粗暴地将你撞向她光滑的绿色皮肤和坚挺的粉色乳头。尽管她的乳房相对柔软，但那仍然是数百磅重的肉团。似乎不满足于仅仅用乳房闷住你，她伸出一根绿色的粉色小指，开始打你的屁股，她可能认为这很轻柔，但落在你的[butt]上却很重。几下拍打让你的屁股又红又麻，每一次击打都将你的[cocks]进一步推入她柔软的乳房和坚挺的乳头。[say:求你了，射在我身上！]她命令道，你的身体几乎像是听到了提示一样服从了，精液飞溅，用你身体能产生的尽可能多的精液覆盖了她的乳房。");
            if(get_player().balls > 0)
            {
               outputText("当你慢慢地将精液排空在绿色的肉体上时，你的[balls]开始隐隐作痛。");
            }
            get_player().orgasm("Dick");
         }
         if(get_player().hasVagina())
         {
            clearOutput();
            outputText("[pg]她张开你的双腿，慢慢地将你粉嫩的阴唇就位，你的[vagina]正好悬停在她那巨大的、像鸡巴一样的乳头前！伴随着一声喜悦的尖叫，她将乳头尖推入你的小穴，她的眼睛几乎翻到了脑后，她缓慢而稳定地将乳头一寸一寸地塞进你被撑开的洞里。");
            get_player().cuntChange(14,true,true,false);
            outputText("有什么湿润的东西开始从你被塞满的洞里那根坚挺的女性器官中漏出，你震惊地意识到她一定是在分泌乳汁！巨女的乳汁润滑了你的通道，让她能将更多跳动着的坚挺塞进你体内，直到最后她的乳头触底，你的阴唇亲吻着粉色的乳晕。你的[vagina]紧紧夹住她，捏住她的乳头，将她推向更深处，这很快就变成了一场狂喜的高潮。她分泌乳汁的乳房突然爆发，将几加仑的堕落乳汁倾注到你的子宫里，迅速撑大了你的肚子，直到你看起来胖乎乎的，然后就像怀了三胞胎一样！");
            outputText("[pg]她的乳头弹了出来，乳汁喷了你一身，让你浑身浸透在光滑的白色中。你希望这对你的皮肤有好处。");
            get_player().orgasm("Vaginal");
         }
         if(get_player().isGenderless())
         {
            outputText("[pg]巨女开始呻吟，她将你在她的乳头周围摩擦，将你的身体紧紧地压在她的乳房上。她把你移到她的另一个乳房，用你的身体来挑逗她另一个变硬的乳头。[say:你介意舔一下吗？求你了？]她问道，把你的脸压在她的乳头上。你张开嘴想伸出舌头，突然她把它推到你的嘴上，很快就把最初几英寸的粉色乳头塞过了你的嘴唇。你的嘴里塞满了乳头肉，你的舌头被推到了嘴底。她慢慢地将更多的自己塞进你体内，她的乳头滑进你的喉咙。当你突然感觉到液体喷射进你的肠胃时，她的呻吟声变得更大了。她开始分泌乳汁，给你灌满了被污染的海龟奶！你很快就被灌满了，你的胃因为几加仑的白色液体而膨胀，直到你咕噜咕噜地喝着奶，这些东西从你嘴里的乳头周围漏出来。当你觉得你快要爆炸的时候，她把乳头弹了出来，用她的乳汁覆盖了你。");
         }
         outputText("[pg][say:天哪，那真是一个巨大的拥抱。我想我需要再睡一觉。有空再来看我，]她说着，慢慢地把你放回船上。当这个快乐的绿色巨女咯咯地笑着慢慢涉水离开时，你慢慢地划走了。");
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,914,FlagDict_Impl_.arrayReadInt(_loc1_,914) + 1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function kaijuGrowsWangus() : void
      {
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,913,1);
         clearOutput();
         get_images().showImage("kaiju-cocked");
         kaijuSprite();
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,914,FlagDict_Impl_.arrayReadInt(_loc1_,914) + 1);
         outputText("在划过湖面时，你看到一张熟悉的绿色面孔从被污染的湖水中浮现。是维纳斯，之前那个巨大的龟女。她用充满欲望的眼睛发现了你，向你招手，并开始说话：[say:你绝对想不到我身上发生了什么！太奇怪了，我当时正在污染液体最初流入湖中的地方洗澡，突然听到一声巨响，然后“呼”的一声！一股惊人的污染液体涌入湖中。我从来没见过这种景象！]你理解地点点头，向这个绿皮肤女孩解释了你最近在恶魔工厂的活动。");
         outputText("[pg][say:哇，是你干的？真了不起，]她说着，用眼睛打量着你，平时眼中的欲望被一种不同的好奇心所取代，即使只有片刻，然后又回到了欲望的迷雾中。[say:好吧，既然你是罪魁祸首，也许你愿意帮我个忙？]她一边问，一边慢慢地从湖中升起，她那飘逸的红发湿漉漉地贴在头上和脖子后面，几缕红色的卷发垂下来，贴在她那丰满的大乳房上，她那挺拔的粉红色乳头因为冷水而变得坚硬。她继续上升，水滴顺着她躯干上光滑的绿色皮肤滑落，直到她的身体升出湖面，露出腰部，然后进一步上升，露出她修剪整齐的阴毛，红色的地毯显然与窗帘很相配。最后，她的下体从湖中浮现，滴着水和淫液，你可以清楚地看到，她原本只有女性正常的（尽管是巨大的）性器官，现在在她的阴道口上方，也就是她粉红色阴蒂原本所在的位置，长出了一根淫荡、跳动的肉棒。[say:你觉得怎么样？是不是很棒？我真不敢相信它就长在那里了。一定是释放出来的那些多余的污染造成的。它让我欲火焚身，连路都走不直了！嘿，想帮我试试我全新的肉棒吗？]她急切地问你，她的新器官开始随着她因欲望而颤抖而微微跳动。");
         outputText("[pg]你从未想过你在工厂的行动会产生如此变态的影响。你要帮她发泄吗？");
         menu();
         addButton(1,"否",dontGetFutaTurtlesOffToday);
         addButton(0,"是",helpNewFutaKaijuGetOff);
         addButton(2,"嘲笑",mockDatTurtleGirl);
      }
      
      public function kaijuCock() : Boolean
      {
         return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,913) == 1;
      }
      
      public function kaijuBadEndToyBOOSH() : void
      {
         clearOutput();
         get_images().showImage("kaiju-cocked");
         kaijuSprite();
         outputText("当你在湖中划船时，你再次偶然遇到了快乐的绿巨人维纳斯，她似乎正沉浸在快感中，在浅水区疯狂地自慰，揉搓着她那巨大的");
         if(!kaijuCock())
         {
            outputText("阴蒂");
         }
         else
         {
            outputText("肉棒");
         }
         outputText("用手掌揉搓着，她的小穴如潮水般涌出堕落的淫液。她的另一只手正拼命地拉扯、捏弄着自己的一个乳头，乳汁从巨大的粉红色乳头上喷涌而出，她的呻吟声足以让妓女都感到羞愧。看着这色情的画面，你能感觉到自己的脸颊也红了起来。你最近经常取悦这个巨人女孩，也许你已经把她本就高涨的性欲推到了崩溃的边缘？随着她似乎接近高潮，她的喘息声变得越来越沉重，一连串下流的脏话从她淫荡的嘴里流出，她在快感中摇摆着，大部分话都听不清楚，但你发誓你听到她呻吟出了你的名字。不管她在想象什么，她似乎还没有注意到你，直到她终于达到了一个响亮而湿润的高潮。");
         outputText("[pg]你正犹豫着是该开口说话还是溜走，这时她的一只眼睛慵懒地睁开，发现了满脸通红坐在那里的你。[say:哦，我那偷偷摸摸的偷窥狂是来玩的吗？]她带着性感的呻吟问道，用双手将她那巨大的乳房挤在一起，向你倾斜，摆出挑逗的姿势。[say:我正希望你能出现呢，小可爱，]她说着，突然一股迷路的乳汁从她那被过度蹂躏的乳房中喷射而出，浇了你一身，美味的白色液体几乎淹没了你的船。[say:哦，天哪，]她继续说道，举起一只手捂住嘴，看着你突然变成乳白色的样子咯咯地笑了起来。她伸手把你的船从水里捞出来，眼中闪烁着情欲的光芒。你有一种不祥的预感，她今天会比过去更加贪得无厌，而对于这个性欲超强的淫荡巨人来说，这可不是闹着玩的！");
         if(get_player().canFly())
         {
            outputText("[pg]如果你选择的话，现在飞向安全地带还为时不晚。你要试一试吗？");
            menu();
            addButton(0,"是",flyAwayFromBadEnd);
            addButton(1,"否",badEndPartTwo);
         }
         else
         {
            menu();
            addButton(0,"继续",badEndPartTwo);
         }
      }
      
      public function insultTheKaijuFirstMeeting() : void
      {
         clearOutput();
         if(kaijuCock())
         {
            get_images().showImage("kaiju-angry");
            outputText("也许这不是你最聪明的想法，你决定取笑面前的绿色女巨人，嘲笑她对自己身材的明显不自信。“胖”这个词刚一出口，她的脸就气得通红，你意识到自己犯了个错误。");
            outputText("[pg][say: 你太粗鲁了，]她气呼呼地说。[say: 但我知道怎么修理你！]她开始站起来，站到她那高耸入云的全部高度。虽然她的大部分腿还在水下，但她的生殖器却完全暴露在外。她女性私处的阴唇湿润着，滴落着湖水和她自己大量的体液。与她身体其他部分几乎呈橄榄绿的颜色相比，它们呈现出令人惊讶的粉红色。但最令人震惊的是，本该是阴蒂的地方，却长着一根巨大无比的绿色肉棒！");
            outputText("[pg][say: 不如把你那张刻薄的嘴派上点用场，]她对你说，同时用两根粗大的手指粗暴地把你捏起来，带到她那正在变硬的肉棒前。");
            if(get_player().hasStatusEffect(StatusEffects.KnowsWhitefire) && (!get_player().hasPerk(PerkLib.BloodMage) && get_player().get_fatigue() + get_player().spellCost(30) > 100))
            {
               outputText("[pg]感觉到她的欲望，你试图快速思考如何避免取悦女巨人那根巨大的肉棒。你突然想到可以使用白焰法术攻击她。你要施放它吗？");
               menu();
               addButton(0,"是的",yesBurnDatClit);
               addButton(1,"否",corruptKaijuInsertion);
            }
            else
            {
               menu();
               addButton(0,"下一个",corruptKaijuInsertion);
            }
         }
         else
         {
            get_images().showImage("kaiju-get-off");
            outputText("对这样一个巨人做这种事也许不是最明智的，但你决定嘲笑她对身材明显的不自信。“胖”这个字刚从你嘴里说出来，她就气得鼓起嘴唇吹了一口气，把你和你的船吹得飞快地穿过湖面，消失在视线中。过了一会儿，船又撞回了岸边，你的头发和神经都被这趟快速的旅程吹得有些凌乱。");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,911,1);
            doNext(get_camp().returnToCampUseOneHour);
         }
      }
      
      public function incubiDraftsDatKaiju() : void
      {
         clearOutput();
         get_images().showImage("kaiju-encounter");
         outputText("你问这个绿色的荡妇是否愿意在双腿之间长出一个新玩具来玩。");
         outputText("[pg]听到这个建议，她惊讶地睁大了眼睛，脸颊上泛起深红色的红晕。[say:我承认，我确实想过。想要一根又长又硬的东西来撸，但我真的不知道，]她说道，显然对这个想法既兴奋又尴尬。[say:你真的不介意吗？]");
         addButton(0,"同意",yesTurnKaijuFuta);
         addButton(1,"拒绝",repeatKaijuEncounter);
      }
      
      public function helpNewFutaKaijuGetOff() : void
      {
         clearOutput();
         get_images().showImage("kaiju-cocked");
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,914,FlagDict_Impl_.arrayReadInt(_loc1_,914) + 1);
         outputText("你抬头对着绿色的双性人微笑，说你很乐意帮她测试一下她新长出来的肉棒。维纳斯拍着手，高兴地尖叫起来，显然对你的决定和第一次用男性器官发泄的期待感到非常开心。你跟着她来到湖中附近的一个岛屿，把船靠岸，找了一大块平坦的土地让她舒服地坐下，然后脱下了你的[armor]。她一屁股坐在她那圆润结实的屁股上，张开双腿，用一只手轻轻地把你拿起来。[say: 谢谢你，]她轻声说道，然后小心翼翼地把你放在她已经开始跳动的肉棒根部。与这个女孩的其他部位相比，这根肉棒其实相当小，你想象按比例来说，在正常体型的人身上大概只有七英寸左右。不过，它还是比你想象中这个世界上见过的任何其他肉棒都要大得多，上面蜿蜒的深色静脉有你的前臂那么粗。");
         outputText("[pg]结束了观察，决定开始干活，你跪下来，开始用手在她肉棒根部轻轻地画圈揉搓。尽管体型巨大，维纳斯似乎相当敏感，没过多久她就开始舒服地娇喘起来。你开始更用力地揉搓那根绿色的肉棒，用手揉捏着肉棒上的肉，慢慢地开始向双性人的肉棒上方移动。[say: 哦……我不知道这会这么舒服，]巨人呻吟着，一只手拉扯着乳房，另一只手像蛇一样越过你伸向她湿润的阴户，一根手指探入她小穴的深处，留下你继续在她勃起的肉棒上工作。你用手按摩着跳动的肉棒，随着绿皮女孩的呻吟和娇喘的节奏抚摸和揉捏它。当你爬到她肉棒更高的地方时，你站起身，趴在那根抽搐的巨兽上，腾出双腿，以便更好地用整个身体抚摸她。");
         if(get_player().hasCock())
         {
            outputText("[EachCock]现在在巨人粗大的肉棒上摩擦，很快就硬了起来。");
         }
         if(get_player().hasVagina())
         {
            outputText("巨大的肉棒散发出的温暖热量似乎渗入了你的下体，让你的[vagina]渗出汁液，滴在巨大的肉棒上。");
         }
         outputText("她在你的抚摸下扭动着，仰面倒下，几乎无法控制地扭动着。你对自己能控制这样一个庞然大物感到相当惊讶。");
         outputText("[pg]你终于到达了她巨大肉棒深绿色的龟头，用你温柔的服侍对待它。先列腺液从顶端冒出泡泡，散发着强烈的性爱和情欲的气味。你确信它含有信息素和催情剂。");
         if(get_player().cor < 50 && get_player().lib < 75)
         {
            outputText("你用手揉捏着龟头，快速而粗暴地按摩着它，同时你在巨大的肉棒上摩擦，前后摇晃。一些先列腺液滴落下来，你开始把它当成粘稠的按摩油，揉进肉棒里。随着你的每一个动作，女巨人发出的娇喘和充满情欲的呻吟声越来越强烈。");
         }
         else
         {
            outputText("你爬到龟头顶端，然后俯身喝了一大口乳白色的液体。它的味道又咸又甜，令人惊讶的是，它尝起来非常像西瓜。你又喝了一口，用舌头舔舐，在嘴里漱了漱，然后咽下喉咙。令人放松的温暖传遍你的全身，让你的性欲像箭一样飙升。你开始按摩和吸吮，进入一种稳定而强烈的来回运动，女巨人的呻吟声几乎随着你的每一个动作而增大。");
         }
         if(get_player().lactationQ() >= 200)
         {
            outputText("奶水开始从你的[nipples]滴落，让龟头变得光滑，让你能更顺畅地在上面扭动身体。");
         }
         outputText("[say: 哦，玛莱啊！我要射了！]她大喊一声，随后一股浓稠的精液像海啸一样喷射而出，险些击中你的脸。巨大的白色精液团升到树梢之上，然后像粘稠的雨一样落回地面。她继续毫不畏惧地射精，你开始在她的龟头上用力摩擦自己，直到你达到了自己较小的高潮。");
         outputText("[pg]最终，白色的精液洪流平息了，留下你们俩都浸泡在双性人的精液中。[say: 哇……真是太棒了，]维纳斯说道，似乎对她的绿色肉棒很满意。[say: 想想我以前竟然错过了这种感觉！]");
         outputText("[pg]你清理干净自己，穿好衣服，挥手告别，然后离开了女巨人，她仍然沉浸在强烈高潮的幸福中。");
         get_player().orgasm("Generic");
         dynStats(DynStat.Cor(1));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function fuckThisGiantYouDumbCuntt() : void
      {
         clearOutput();
         outputText("就在你以为自己能看到她的子宫时，她的手又把你拉回了她湿滑的通道，然后再次把你推上去。她的手指推着你在她颤抖的小穴里进进出出，她湿润而灵巧的肌肉帮助你加快速度，而她也稳步地加快了节奏。她似乎越接近高潮，她的阴道壁就越是颤抖和挤压，她的爱液就聚集得越多，她把你送上这趟令人眼花缭乱的女性性爱过山车的速度也就越快。");
         if(get_player().sens >= 50)
         {
            outputText("[pg]巨人的极品小穴带来的快感让你达到了高潮。");
            if(get_player().hasCock())
            {
               outputText("[EachCock]痉挛着，你将精液射在她的阴道壁上，你的贡献让它们变得更加湿滑。");
            }
            if(get_player().hasVagina())
            {
               outputText("你自己的小穴也释放出女性的爱液，让你的大腿更加湿润。");
            }
            get_player().orgasm("Generic");
         }
         else
         {
            outputText("[pg]当她终于高潮时，她的阴道肌肉紧紧地夹住了你，强烈的压力和湿润感让你向下飞去，你从她湿滑的小穴里滑了出来，滑过她粉嫩的阴唇，撞进了她等待着的手中。");
            if(kaijuCock())
            {
               get_images().showImage("kaiju-blowjob");
               outputText("[pg][say: 哦天哪，太爽了！但我们还没完呢，亲爱的，]这位性感的绿色双性人宣布道，她轻轻地把你放在她巨大的肉棒上。[say: 我积攒了这么多的欲望，一次高潮可解决不了问题。所以……介意帮我一把吗？]她问道，示意她希望你给她打飞机。最好不要和欲火焚身的巨人争论。你身上还沾着她的阴道分泌物，欲火焚身，你开始用身体摩擦她巨大的肉棒，用手揉捏，用腿摩擦。[pg]");
               if(get_player().get_gender() > 0)
               {
                  outputText("你把自己的私处在她的肉棒上摩擦，决心让自己也高潮。");
               }
               if(get_player().biggestTitSize() >= 1)
               {
                  outputText("你把你的[fullChest]也压在她的肉棒上，给她的阴茎做了一个乳交，尽管对于这样一个巨大的肉棒来说，这已经是极限了。");
               }
               if(get_player().lactationQ() >= 200)
               {
                  outputText("乳汁从你的[nipples]喷涌而出，让你的乳房变得湿滑发亮，帮助你更容易地在跳动的肉棒上滑动。");
               }
               outputText("[pg][say: 玛莱啊，你真擅长这个！]呻吟的女巨人说道，她的肉棒开始期待地跳动。它几乎把你从摇摇欲坠的栖息处颠下来！[say: 我……我要射了！]她喊道，你加倍努力。片刻之后，她兑现了她的话，喷出了一股巨大的精液。");
               if(get_player().get_gender() > 0)
               {
                  outputText("你没有被吓倒，继续在喷射的肉棒上摩擦，直到你自己也达到了规模更小、远没有那么令人印象深刻的高潮，释放出你自己的");
                  if(get_player().hasVagina())
                  {
                     outputText("女性爱液");
                  }
                  if(get_player().get_gender() == 3)
                  {
                     outputText("和");
                  }
                  if(get_player().hasCock())
                  {
                     outputText("浓稠的精液");
                  }
                  outputText("。");
                  get_player().orgasm("Vaginal");
               }
               outputText("你向湖面望去，发现大部分湖水都变成了明显的乳白色。即使对于一个巨人来说，她释放的精液量也太惊人了！");
            }
         }
         outputText("[pg]巨人的膝盖似乎支撑不住了，她一屁股坐在了她那匀称而巨大的屁股上。[say: 哇，]她说着，把你和你的衣服放回船上。由于过度劳累，她绿色的脸颊竟然变红了。[say: 这比我自己弄好多了。有空再来看我，好吗？]她问道。");
         outputText("[pg]你开始划船离开，向这位绿色的女巨人挥手告别。");
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,914,FlagDict_Impl_.arrayReadInt(_loc1_,914) + 1);
         dynStats(DynStat.Cor(1));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function fuckThisGiantYouDumbCunt() : void
      {
         clearOutput();
         outputText("你决定操这个巨女会很有趣，即使以她的体型，你真的更像是一个活生生的假阳具，而不是一匹发情的种马。如果她脸上蔓延的愉悦表情能说明什么的话，她似乎对这个想法很满意。");
         outputText("[pg][say:好吧，你难道不是最勇敢的小勇者吗？你知道我这些天没收到多少邀请。其他人似乎都……被我吓到了。他们让我孤单又沮丧，]曲线优美的乌龟慢慢地完全从水中浮现出来时说道。[pg]");
         if(kaijuCock())
         {
            outputText("你惊讶地发现，在阴蒂本该在的地方，她有一根巨大的鸡巴。它已经因为性唤起而变得坚挺并跳动着，被污染的湖水从上面滴落。");
         }
         outputText("她湿润的小穴又大又粉，一股稳定的女性粘液从里面流出，浸湿了她绿色的的大腿。[say:但你并没有被这一切吓倒，是吗？]她继续说道，用她巨大的手轻轻地把你抱起来。虽然你想象这么大的手指很难灵活地处理正常尺寸衣服的搭扣和带子，但她很快就把你脱光了。[say:现在让我们做爱吧！]");
         outputText("[pg]她张开双腿，开始把你推向她那巨大的裂缝。[say:现在不用担心安全措施，没有正常的精子能指望突破我卵子那高于平均水平的细胞壁。所以你就放松享受做爱吧，]她告诉你，然后把你头朝下扑通一声扔进她那巨大的、光滑温暖的阴道壁里。你有一点时间来检查你的周围环境。起初，幽闭恐惧症带来了一丝恐惧，但很快就过去了，你开始吸入她的气味，她性器官的温暖液体渗入你的[skinfurscales]。显然，她堕落的阴道汁液兼作春药。开始感到好色，你注意到她的阴道肌肉在你周围收紧，轻轻地挤压和释放你，就好像你在接受全身按摩一样。这里面其实相当舒服，尽管很奇怪。[pg]");
         dynStats(DynStat.Lust(33));
         get_images().showImage("kaiju-fuck");
         outputText("她仍然用两根手指轻轻地夹住你的[leg]，她开始稳稳地把你推入她湿润的蜜壶深处，用更多诱发欲望的湿润液体慷慨地涂抹你。[say:哦，就是这样，宝贝，稳扎稳打才能赢，]她呻吟着，从你所在的地方听起来，她的声音有些沉闷。她的阴道壁继续对你的身体进行有节奏的按摩，放松你自己的肌肉，因为你冒险的紧张感似乎蒸发了。");
         if(get_player().biggestTitSize() >= 1)
         {
            outputText("[pg]你的[chest]滑过她那令人惊讶地灵巧的阴道里光滑而坚实的肉体，你的[nipples]因为不断的挑逗按摩而变硬。");
         }
         if(get_player().hasCock())
         {
            outputText("[pg]你坚硬的鸡巴");
            if(get_player().totalCocks() > 1)
            {
               outputText("是");
            }
            else
            {
               outputText("是");
            }
            outputText("在她的催情爱液和紧致肉壁的刺激下，你的肉棒开始跳动，龟头渗出了先列腺液");
            if(get_player().totalCocks() > 1)
            {
               outputText("");
            }
            outputText("。");
         }
         doNext(fuckThisGiantYouDumbCuntt);
      }
      
      public function flyAwayFromBadEnd() : void
      {
         clearOutput();
         get_images().showImage("kaiju-fly-away");
         outputText("你以最快的速度拍打翅膀，仓皇撤退！");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function flirtWithKaiju() : void
      {
         clearOutput();
         outputText("你决定试着和女巨人调情。你告诉她，她的身材完美得像雕塑一样，她的曲线非常迷人。如果她脸上蔓延开来的愉悦表情能说明什么的话，这似乎奏效了。");
         outputText("[pg][say: 哎呀，你是不是太甜了？你知道我这些天没有多少仰慕者。每个人似乎都……被我吓到了。他们让我一个人呆着，很沮丧，]曲线优美的海龟说着，慢慢地完全从水里浮现出来。[pg]");
         if(kaijuCock())
         {
            outputText("你惊讶地发现，在阴蒂本该在的地方，她有一根巨大的鸡巴。它已经因为性唤起而变得坚挺并跳动着，被污染的湖水从上面滴落。");
         }
         outputText("她湿润的小穴又大又粉嫩，一股稳定的女性粘液从里面流出，浸湿了她绿色的的大腿。[say: 当一个可爱的" + get_player().mf("小帅哥","小美女") + "对你感兴趣时，感觉真好，你不觉得吗？]她继续说道，用她那巨大的手轻轻地把你抱起来。虽然你想象这么大的手指很难灵活地处理正常尺寸衣服的搭扣和带子，但她很快就让你一丝不挂了。[say: 现在，可能已经有一段时间了，但我知道调情是为了什么。而且你太可爱了，不适合玩“欲擒故纵”……]");
         outputText("[pg]她张开双腿，开始把你推向她那巨大的裂缝。[say: 现在不用担心保护措施，没有正常的精子能指望突破我卵子那高于平均水平的壁。所以你只要放松，享受这场性爱，]她告诉你，然后把你头朝下扑通一声扔过阴唇，进入她那巨大的、光滑温暖的阴道壁。你有一会儿时间来检查你的周围环境。起初，你产生了一点幽闭恐惧症的恐惧，但很快就过去了，你开始吸入她的气味，她温暖的性液渗入你的[skinfurscales]。显然，她那堕落的阴道汁液兼作催情剂。开始感到性欲旺盛，你注意到她的阴道肌肉在你周围收紧，轻轻地挤压和释放你，就像你在接受全身按摩一样。虽然很奇怪，但这里面其实相当舒服。");
         dynStats(DynStat.Lust(33));
         get_images().showImage("kaiju-fuck");
         outputText("[pg]她仍然用两根手指轻轻地夹着你的[leg]，她开始稳稳地把你推入她湿润的蜜罐深处，用更多诱发性欲的湿润液体慷慨地涂抹你。[say: 哦，就是这样，宝贝，稳扎稳打才能赢，]她呻吟着，从你所在的地方听起来，她的声音显得有些沉闷。她的阴道壁继续有节奏地按摩你的身体，放松你自己的肌肉，因为你冒险的紧张感似乎蒸发了。");
         if(get_player().biggestTitSize() >= 1)
         {
            outputText("你的[fullChest]滑过她那令人惊讶的灵巧小穴光滑而坚实的阴道肉，你的[nipples]因为不断的挑逗按摩而变硬。");
         }
         if(get_player().hasCock())
         {
            outputText("[EachCock]");
            if(get_player().cockTotal() > 1)
            {
               outputText("是");
            }
            else
            {
               outputText("是");
            }
            outputText("在她的催情爱液和紧致肉壁的刺激下，你的肉棒开始跳动，龟头渗出了先列腺液");
            if(get_player().cockTotal() > 1)
            {
               outputText("");
            }
            outputText("。");
         }
         outputText("[pg]就在你以为自己能看到她的子宫时，她的手又把你沿着湿滑的通道拉了下来，然后再把你推上去。她的手指推着你在她颤抖的小穴里进进出出，她湿润而灵巧的肌肉随着她稳步加快的节奏帮助你加速。她似乎越接近高潮，她的肉壁就颤抖和推挤得越厉害，她的汁液聚集得越多，她带着你在她的女性器官中进行令人眼花缭乱的过山车之旅的速度就越快。");
         if(get_player().sens < 50)
         {
            outputText("[pg]巨人的极品小穴带来的快感让你达到了高潮。");
            if(get_player().hasCock())
            {
               outputText("[EachCock]痉挛着，你将精液射在她的阴道壁上，你的贡献让它们变得更加湿滑。");
            }
            if(get_player().hasVagina())
            {
               outputText("你自己的小穴也释放出女性的爱液，让你的大腿更加湿润。");
            }
            get_player().orgasm("Generic");
         }
         outputText("[pg]当她终于高潮时，她的阴道肌肉紧紧地夹住了你，强烈的压力和湿润感让你向下飞去，你从她湿滑的小穴里滑了出来，滑过她粉嫩的阴唇，撞进了她等待着的手中。");
         if(kaijuCock())
         {
            clearOutput();
            get_images().showImage("kaiju-blowjob");
            outputText("[pg][say: 噢天哪，那太爽了！但我们还没完呢，亲爱的，]这位性感的绿色双性人宣布道，她轻轻地把你放在她巨大的肉棒上。[say: 我积攒了那么多欲望需要发泄，一次高潮可不够。所以……介意帮我一把吗？]她问道，暗示她希望你给她手淫。最好不要和一个欲火焚身的巨人争论。你身上还沾着她阴道分泌的汁液，而且欲火焚身，你开始用你的身体摩擦她巨大的肉棒，用手揉捏，用腿摩擦。");
            if(get_player().get_gender() > 0)
            {
               outputText("[pg]你将私处在她的肉棒上摩擦，决心让自己也高潮。");
               if(get_player().biggestTitSize() >= 1)
               {
                  outputText("你也将你的[chest]压在她的肉棒上，尽可能地给这个庞然大物进行乳交。");
               }
               if(get_player().lactationQ() >= 200)
               {
                  outputText("乳汁从你的[nipples]喷涌而出，让你的乳房变得湿滑发亮，帮助你更容易地在跳动的肉棒上滑动。");
               }
            }
            outputText("[pg][say: 玛莱啊，你真擅长这个！]呻吟的女巨人说道，她的肉棒开始期待地跳动。它几乎把你从摇摇欲坠的栖息处颠下来！[say: 我……我要射了！]她喊道，你加倍努力。片刻之后，她兑现了她的话，喷出了一股巨大的精液。");
            if(get_player().get_gender() > 0)
            {
               outputText("你没有被吓倒，继续在喷射的肉棒上摩擦，直到你自己也达到了规模更小、远没有那么令人印象深刻的高潮，释放出你自己的");
               if(get_player().hasVagina())
               {
                  outputText("女性爱液");
               }
               if(get_player().get_gender() == 3)
               {
                  outputText("和");
               }
               if(get_player().hasCock())
               {
                  outputText("浓稠的精液");
               }
               outputText("。你向湖面望去，发现湖水大部分已经变成了明显的乳白色。即使对于一个巨人来说，她释放的精液量也太惊人了！");
               get_player().orgasm("Vaginal");
            }
         }
         outputText("[pg]巨人的膝盖似乎支撑不住了，她一屁股坐在了她那匀称却巨大的屁股上。[say: 哇，]她说着，把你和你的衣服放回船上。由于过度劳累，她绿色的脸颊竟然变红了。[say: 这比我自己弄好多了。有空再来看我，好吗？]她问道。");
         outputText("[pg]你开始划船离开，向这位绿色的女巨人挥手告别。");
         dynStats(DynStat.Cor(1));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function execEncounter() : void
      {
         var never:Boolean;
         var _g1:Kaiju;
         var _g:Kaiju;
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,910) == 0)
         {
            get_images().showImage("event-island");
            outputText("你的探索将你带到了一个以前从未见过的小岛。它看起来像是一座突出水面的巨大、光滑的岩石山丘。你要去探索它吗？");
            menu();
            addButton(0,"是的",meetDatKaijuYo);
            _g = this;
            addButton(1,"否",function():void
            {
               _g.noMeetingKaijus();
            });
            _g1 = this;
            never = true;
            addButton(2,"绝不",function():void
            {
               _g1.noMeetingKaijus(never);
            });
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2024) == 2 && !kaijuCock())
         {
            kaijuGrowsWangus();
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,914) >= 5)
         {
            kaijuBadEndToyBOOSH();
         }
         else
         {
            repeatKaijuEncounter();
         }
      }
      
      public function encounterName() : String
      {
         return "kaiju";
      }
      
      public function encounterChance() : Number
      {
         if(softLevelMin(5) && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,911) == 0 && get_time().hours >= 17 && get_player().hasStatusEffect(StatusEffects.BoatDiscovery))
         {
            return 1;
         }
         return 0;
      }
      
      public function dontGetFutaTurtlesOffToday() : void
      {
         clearOutput();
         get_images().showImage("kaiju-get-off");
         outputText("你摇摇头，礼貌地回答说你现在不想帮她发泄。[say:哦，好吧。我明白，]女巨人说道，看起来有些沮丧。你划船离开，暂时留下她和她的新器官独处。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function corruptKaijuInsertion() : void
      {
         clearOutput();
         get_images().showImage("kaiju-cocked");
         outputText("她几乎把你的脸推到她深绿色的龟头上，你的鼻子紧贴着那条长长的缝隙。它散发着湖水性堕落的气味，恶魔精液和被污染的催情剂的味道。[say: 好了，继续，]她说，[say: 舔它！]");
         outputText("[pg]面对这种体型的女人，你根本无法反抗。你伸出舌头，沿着她阴茎顶端的缝隙舔舐。它尝起来有性的味道，还有一种奇怪的甜西瓜味。她开始把你的脸在她的龟头周围摩擦，让你在她的性器官的每一寸上摩擦。当她把你的脸按在她的阴茎上时，她开始用另一只手抚摸她的肉棒。没过多久，她的绿色肉棒就完全勃起并跳动着，一滴巨大的先列腺液从顶端冒了出来。[say: 喝吧，喝吧，]她嘲笑道，把你的脸深深地埋进粘稠的液体中。你试图屏住呼吸，但你的折磨者似乎不打算放过你，直到你表演完喝下她的先列腺液。你开始大口吞咽浓稠的液体，直到肺部几乎要爆炸，她才把你拉出来喘口气。你大口呼吸着空气，然后又被推回粘稠的液体中。喝下然后呼吸的过程又重复了四次，你才吞下了那批先列腺液。");
         outputText("[pg][say: 嗯，你很擅长这个，]绿色的水龟女孩说，[say: 我自己的小精液吞噬者。我突然有一种冲动。渴了吗？]她问，然后把你的头完全塞进缝隙里，放开你，让你悬挂在她肿胀的阴茎上，头卡在她宽大的龟头里。她开始用双手抽插她的肉棒，加快速度，越来越快，直到突然她爆发了，你飞向空中，被一团巨大的精液包裹着。你因为突如其来的眩晕而晕了过去。");
         outputText("[pg]将近一个小时后你才醒来，不确定自己是如何在这样的空中旅行中幸存下来的。也许她把你从空中抓了下来？你发现自己回到了岸边的船上，头发乱蓬蓬的，沾满了精液。");
         dynStats(DynStat.Lust(50),DynStat.Cor(1));
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,911,1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function complimentKaiju() : void
      {
         clearOutput();
         get_images().showImage("kaiju-encounter");
         outputText("你决定赞美她的身材，说它比例匀称，非常迷人。");
         outputText("[pg][say: 噢，你这么说真是太贴心了！]她说着，脸上露出了笑容。[say: 你真是太小太可爱了，我想把你抱起来，给你一个大大的拥抱，]她继续说着，伸手去抱你。");
         menu();
         addButton(0,"随她去",letKaijuHaveWayWithYou);
         addButton(1,"停下",stopItPlease);
      }
      
      public function badEndPartTwo() : void
      {
         clearOutput();
         outputText("这位饥渴的女巨人三下五除二就剥掉了你的[armor]，很快这个绿皮大妞就把你按在她撅起的嘴唇上，尽管体型悬殊，她还是尽力给了你一个热情的吻。她把你拉到与她视线平齐的位置，声音里充满了欲望的低吼，[say: 玛莱啊，你真是让我欲火焚身。我们最近做了太多次了，我满脑子都是你！你这个调皮、美妙、光荣、变态的[boy]！我觉得我再也离不开你了！] 她没有再多说什么，直接把你放在她那巨大的绿色产奶机上，把你的脸按在一个粉红色的巨大乳头上。[say: 喝吧。] 很明显，她想喂你喝她那堕落的乳汁，而且现在看来你也没有什么选择的余地了。她的乳头甚至比你在这片土地上见过的最巨大的鸡巴还要大，但你还是设法用嘴含住了它的最前端，开始毫不留情地吸吮这个充满乳汁的乳头，同时你举起双手，抚摸并捏弄这个过度敏感的巨大肉突的底部。[say: 哦，女神啊！] 这个巨大的荡妇在你上方呻吟着。");
         if(get_player().tongue.type == 1)
         {
            outputText("你那分叉的蛇信开始四处抽打，在你嘴里的乳头尖上弹动，同时摩擦着它的下侧，催促这个娇嫩的地方挤出一滴天堂般的白色液体。");
         }
         else if(get_player().tongue.type > 0)
         {
            outputText("你嘴里长长的舌头慢慢地绕着你唇间紧咬的乳头尖端爬行，包裹住那饱满的乳头并挤压，催促着一团乳汁流出。");
            outputText("[pg]然而，当你开始用舌头上下舔弄你勉强含在嘴里的那一小截乳头时，粉红色的尖端却拒绝流出一滴乳汁。不满足的舌头拉扯着娇嫩的乳头，随着你的头进一步压在呻吟女孩那笨重的粉色肉突上，更多的乳头被塞进你的口交洞里。在你坚定的舌头的帮助下，你成功地让它又深入了几英寸。然而，在乳头滑入你的喉咙之前，一个邪恶的念头涌上心头。你将那被诅咒的舌头从好色女孩的乳头上解开，瞄准你口腔肌肉的尖端，将其猛地顶在嘴里那饱满器官的头部，你的舌头慢慢地挤进乳头，一寸一寸，直到完全探到底，女巨人突然发出一声狂喜的尖叫。");
            outputText("[pg]凭借坚定的力量，你开始将更多的乳头含入嘴里，最终将其带到喉咙口，然后滑入食道。你有多久没深喉过乳头了？你开始哼唱，尽力让乳头在嘴里震动，同时你的舌头在绿色的乳房中起伏扭动，舌尖品尝着她乳汁的液体黄金。你放在她乳头底部的手开始带着被激发的狂怒用力揉捏那饱满的乳头，按摩着备受蹂躏的乳晕，直到绿皮肤女孩开始短促而充满情欲地喘息。[say: 我的天啊！]她呻吟着，乳汁突然推挤着你的舌尖，试图绕过它流进你的嘴里。[say: 拔出来拔出来拔出来我得释放了！]她尖叫着，绝望地需要释放积压的乳汁，而你恶魔般的舌头就像某种乳头塞。带着微笑——或者说你的嘴在包裹着胀满乳汁的乳头时所能做出的最大微笑——你将舌头从她的乳头上抽离，这是一个相当迅速的过程，因为她乳汁的压力迫使你那堕落的舌头向后退去。");
            outputText("[pg]想起她的乳头末端还在你喉咙深处，为了不让舌头被射进自己的肚子里，你开始尽可能快地把乳头拔出来。幸运的是，在最后几英寸，她的乳汁成功地绕过了你的舌头，用富含钙质的白色液体覆盖了每一个味蕾，倾泻进你那不堪重负的喉咙，将它涂成白色，乳汁在你的肚子里晃荡，几加仑的液体把你填得满满的，直到你看起来像怀了三胞胎九个月的孕妇。你终于成功地将乳头从嘴里拔了出来，舌头也终于弹了出来，而你再次被绿皮肤女孩乳白色的乳汁从头到脚溅了一身。你的舌头就那样挂在嘴外，你的牛奶浴慢慢地减弱成淋浴，然后是毛毛雨，最后变成轻微的滴落，直到完全停止。");
         }
         if(get_player().tongue.type <= 1)
         {
            outputText("[pg]你吸吮着那巨大的乳头，将它越来越多地挑逗进你的体内，直到你用喉咙按摩着它的大部分长度。当你服侍着缓慢渗漏的乳头时，粉红色的肉体因绿色荡妇的快感而变硬，你舔舐着底部，同时双手按摩着肿胀的乳晕。当你在这个滴着乳汁的喷嘴上努力时，女巨人高兴地扭动着，然后她举起另一只手去挑逗你没有含住的那个乳头。[say: 哦，别停，宝贝，]她对你说，同时你从她那巨大的乳房里挤出一大滴又一大滴喷涌的乳汁。在你喝饱了乳汁之后，你慢慢地将乳头从喉咙里抽出来，直到它伴随着“啵”的一声从你嘴里掉出来。[pg]决定进一步挑逗这个好色的女孩，你继续用舌头在喷涌的乳头上弹动，让那清爽的味道直接从你的舌尖滚落。你开始用双手挤压乳头，看着乳汁喷泉不断地越过你的头顶，与下方的湖水混合，使女巨人膝盖周围的区域变成浑浊的白色。你有节奏地挤压和舔舐，决心把她的奶子吸干。呻吟的龟女在你的摆弄下摇摇晃晃，几乎站立不稳。[say: 太爽了！]她喘息着说，开始用拇指摩擦你的背以示鼓励。花了一段时间，但最终她那巨大的奶子终于被排空了。");
         }
         outputText("[pg][say: 哦，宝贝，你真的很懂怎么玩弄奶子，不是吗？]好色的女巨人说着，把你移向她的胯部。[say: 幸好你喝了那么多奶，我可不想你在接下来的任务中脱水。]看来她高涨的欲望还没有减退！[pg]");
         if(kaijuCock())
         {
            outputText("你发现自己正面对着她巨大的绿色肉棒，在她的兴奋中，肉棒已经渗出了大量的先列腺液。[say: 你知道，在村子里长大，大家都期望我能继承我母亲的祭司衣钵，但我真的没有那份克制力。你知道他们是怎么说大祭司的女子的吧？但我确实学到了一点神圣法术。好吧，有了这具堕落的身体，你将看到一些绝对不神圣的法术，]她说着，用空闲的手抚摸着她的肉棒，巨大的肉棒膨胀到最大尺寸，同时她开始低声嘟囔着奇怪而语无伦次的话语。突然，她冒泡的先列腺液呈现出明显的粉红色，似乎某种魔法生效了，明亮的粉红色先列腺液在你眼前发出微弱的光芒。");
            outputText("[pg][say: 好了，小甜心，喝吧喝吧，]她说着，把你的头深深地按进冒泡的粘液中。她把你留在那里，要么喝要么淹死，所以你只能喝，直到你的肚子快要撑破，肺部隐隐作痛。然后她给了你一个喘息的机会，接着把你按在她的龟头上摩擦，让你沐浴在粉红色的精液中，直到你全身的皮肤都闪闪发光。你突然感到全身皮肤和肚子里一阵刺痛，然后刺痛慢慢蔓延，仿佛你的身体正在将其吸收到每一个部位。");
            outputText("[pg][say: 你感觉到它起作用了吗？你能猜到它做了什么吗？我给你个提示，]女巨人说着，她看着你赤裸无助的身体，眼中闪烁着疯狂的欲望。看来你认识的那个龟女已经不在了，完全被她的性欲所控制。她把你转过身来，你突然感觉到她巨大的龟头抵在你的[butt]上。她为什么要用肉棒摩擦你的屁股，她知道这进不去的，对吧？它比你整个身体还要大还要宽！");
            outputText("[pg]就在这时，你感受到了不可思议的事情。你的后庭扩张开来，温柔地为后门那庞然大物让路，你感觉到你的臀部被分开，向两边拉伸。她那神奇的粉色精液把你变成了这片土地上最有弹性的性玩具！哦，这简直太不对劲了。[pg]");
            get_player().buttChange(500,true,true,false);
            get_images().showImage("badend-kaiju-corrupt");
            outputText("突然，她整个龟头都进入了你的屁股，把你的后庭撑得不成样子。你瞬间高潮了。在正常情况下，你可能更能承受肛交，但接受这么巨大的东西绝对不正常。");
            if(get_player().hasCock())
            {
               outputText("你的前列腺像按钮一样被按下，而且根本停不下来！");
            }
            if(get_player().hasVagina())
            {
               outputText("即使你的小穴是空的，那里也没有留下任何空隙，你的阴道壁像胶水一样被迫粘在一起。");
            }
            outputText("[pg]尽管这个不可思议的入侵者把你身体的每一个部分都撑成了一个有手有脚的龟头形状的避孕套，但你的皮肤甚至还没有感觉到紧绷。你到底有多大的弹性？当绿皮女孩的手顺着她阴茎的整个长度往下摸时，你开始发现了这一点，你的下半身每一寸都在往下走，而你的中间部分像橡皮筋一样被拉伸。[say:哦，天哪，[name]！你感觉太棒了！你太紧了！]维纳斯说道，她那被欲望冲昏了头脑的心智甚至忘记了她对你施加的法术，所有非必要的想法和记忆都被她那火热的性爱需求挤了出去。[say:操，操，操，操操操操操！]她继续说道，语言成了下一个牺牲品，她用手越来越快地抽插着她的阴茎，把你当成一个全天然的弹性飞机杯！如果你能形成连贯的思想，你会惊讶于这种体验是多么的无痛，但你体内那根大鸡巴已经驱逐了所有理性的思想，你的大脑比那个性感的巨人还要沉浸在极乐和性爱中！");
            outputText("[pg][say:射了！射射射射！射射！射了！]巨人扶他大喊道，她的话落在你昏暗的脑海中，带着一种牵引般的熟悉感。你觉得你似乎应该因为某种原因而感到害怕……当你身体突然进一步膨胀，像一个不可能的精液气球一样胀大时，理解突然向你袭来。你甚至因为被精液撑大的肚子而看不到地面。精子像瀑布一样从你嘴里流出，她那巨大的射精终于找到了出路。");
            outputText("[pg]过了几分钟，她终于把你从她的鸡巴上拿了下来。当你缩小并恢复到原来的大小时，一条名副其实的精液河从你的后端流出。好吧，几乎是你原来的大小，你看起来仍然像怀了牛头人三胞胎，你的屁股被撑得无法修复。[pg]");
         }
         doNext(badEndPartThree);
      }
      
      public function badEndPartThree() : void
      {
         clearOutput();
         get_images().showImage("badend-kaiju");
         outputText("没有进一步的评论，好色的水龟女孩把你塞进了她的小穴，当她的爱液把你全身浸透时，她的阴道壁向你挤压过来。[say:没错，宝贝，]传来她闷闷的声音，[say:你碰到了所有正确的地方。]");
         outputText("[pg]你被水龟女孩的爱液浸透了，她几乎立刻就从快感中高潮了，但你知道这还远未结束，因为她不断地把你上下抽插，进出她巨大的小穴。[say:哦，天哪！太爽了！]她呻吟着，从你在她体内的有利位置听来，她的声音柔和而沉闷。[say:我需要更多！我需要更多在我体内！]好吧，考虑到你已经完全进去了，这有点困难，没有更多的东西可以塞进去了……等等，你下面是什么？绿色的树叶在你下面展开，她把一棵树塞进了她巨大的小穴！即使以她惊人的体型，你也能看出这对女巨人来说几乎太多了，因为它撑开了她的小穴。但还有更多的东西，在她性器官黑暗、粉红色的深处几乎很难看清的东西，但你设法辨认出长长的、滑动的触手从树上向你滑来。她正在用一棵来自腐化林地的触手树操自己！当树上长长的藤蔓鸡巴带着色情的意图开始爬上你的腿时，你完全无法从腐化的树叶中走开。不管你愿不愿意，你都要在这个小穴里被操了。");
         outputText("[pg]第一根植物鸡巴像鞭子一样打在你的屁股上，打你的[butt]，直到你的脸颊变红，然后尖端依偎在你皱缩的括约肌上。它疯狂地扭动着，在狂喜的期待中兴奋起来，或者至少是植物版的期待，滴落的藤蔓先列腺液润滑了你的洞，然后用尽全力向前推，在压力和液体混合物让它进入你的[butt]之前，只遇到了一点点阻力。");
         get_player().buttChange(30,true,true,false);
         outputText("它在你体内痉挛时，一次滑入几英寸，试图击中你屁股可能有的每一个敏感点，因为它慢慢地试图把你撑开。[pg]");
         if(get_player().hasCock())
         {
            outputText("当树的触手推压你的前列腺时，[EachCock]变硬了，迫使一团浓稠的先列腺液顺着你的肉棒流下。");
         }
         if(get_player().hasVagina())
         {
            outputText("当第一根藤蔓鸡巴在你的直肠里向上移动时，第二根已经找到了通往你小穴的路！植物状的头部几乎充满爱意地、温柔地摩擦着你的阴唇，然后头部开始探过你粉红色的嘴唇，顶着你的小穴，部分肉棒抬起摩擦你的阴蒂，让冲击波传遍你的全身，而藤蔓鸡巴选择在这个时刻插入你的[vagina]。现在你有两根鸡巴撞击你的洞，压在你的肉壁上，仿佛要通过你感觉到彼此。你小穴里的植物鸡巴在你的阴唇中上下滑动，每一次抽出都非常缓慢，然后全速撞击回来，每次滑入更多的英寸，直到头部撞击你的子宫颈，泄漏的先列腺液慢慢填满你的小穴，从你的大腿之间漏出。");
         }
         outputText("下一根蜿蜒的鸡巴穿过你的双腿，顺着你的肚子，越过你的胸部，轻轻地戳你的嘴唇。你张开嘴想大喊，这时你[asshole]里的鸡巴击中了一个敏感点，你嘴里的鸡巴直接滑了进去，把精液滴进你的嘴里，你的舌头突然被一种咸咸的，但令人愉快的甜味淹没。");
         if(get_player().biggestTitSize() >= 1)
         {
            outputText("另一根触手蜿蜒爬上你的腹部，依偎在你的[chest]之间，当它在你的乳房之间滑动时，用先列腺液润滑你的乳丘，用你的乳房给自己来了一次乳交！");
         }
         outputText("[pg]更多的触手蠕动上来，以捆绑的方式缠绕在你的四肢上，而其他的触手则在淫荡的按摩中摩擦和揉捏你，同时巨人的小穴肉在你周围扭动，浸泡你，按摩你和触手，而绿皮女孩像一个在经历她一生中最棒的性爱阵痛中的妓女一样尖叫。");
         if(get_player().hasCock())
         {
            outputText("更多的触手到来，开始缠绕在你的[cocks]上，慢慢地按照你屁股和嘴里鸡巴设定的节奏给你打飞机，让你享受进一步的快感。");
         }
         outputText("所有这些强烈的快感对你来说都太多了，你达到了你一生中最强烈、最混乱的高潮之一，顺便说一下，绿巨人的小穴收紧了，让你进一步浸泡在她的体液中，你知道她也达到了另一个高潮，然而她并没有停止把那棵树插进拔出她被虐待的水龟小穴，带着你进一步兜风，因为你被腐败的树叶拉着，被不知疲倦的藤蔓附着。");
         outputText("[pg]几个小时后，压力和快感甚至让这个荡妇巨人都无法承受，但她并没有结束它，而是把她的性变态降低了一个档次，暂时把树从她湿透的小穴里拿出来，但仍然用你来让自己达到较小的高潮。当她把你当成一个活生生的假阳具时，你无能为力，把你尽可能深地推入她滴水的小穴，不断地打在你的G点上，让自己一次又一次地高潮。她按摩的肉壁和好奇的手指让你几乎同样高潮。即使在欲望的阴霾中，她仍然足够关心让你高潮。但这似乎并没有阻止她把你抽插进她的小穴几个小时，只是把你拿出来喂你更多的奶来让你继续下去。最后，她的手臂累了，甚至她不可思议的性欲也减退了。希望你能很快离开她并回到营地……或者你是这么想的。");
         outputText("[pg]无论是通过魔法还是只有神知道的方法，她似乎把一块巨石变成了一个光滑、宽阔、球状但很短（相对而言）的阴道塞，她用它来堵住她的洞，而你仍然被困在里面。看来你现在要把她的阴道称为家了，一个活生生的性玩具，只有在被喂奶和以各种方式取悦她时才会被拿出来。");
         get_player().orgasm("Generic");
         get_player().orgasm("Anal",false);
         dynStats(DynStat.Lib(5),DynStat.Sens(30),DynStat.Cor(4));
         get_game().gameOver();
      }
   }
}

