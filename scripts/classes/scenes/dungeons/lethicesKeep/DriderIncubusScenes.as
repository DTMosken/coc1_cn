package classes.scenes.dungeons.lethicesKeep
{
   import classes.BaseContent;
   import classes.CoC;
   import classes.DynStat;
   import classes.Monster;
   import classes.PerkLib;
   import classes.Player;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.items.Weapon;
   import classes.scenes.combat.Combat;
   import flash.Boot;
   
   public class DriderIncubusScenes extends BaseContent
   {
      
      public function DriderIncubusScenes()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
      }
      
      public function titfuckMitziSlowII() : void
      {
         var _g:DriderIncubusScenes;
         clearOutput();
         outputText("当你终于筋疲力尽时，你的[legs]瘫软了，你倒了下去，最后一次将你仍然坚挺的肉棒从那对天堂般的球体之间滑出。米兹向另一个方向从你身边倒下，大口喘着粗气，漫不经心地用你的精液作为润滑剂自慰。她尖锐的声音呻吟着，[say: 留下我，好[master]！]或者一遍又一遍地重复着类似的变体。");
         outputText("[pg]你坐起身，注意到她摆好了姿势，让她那因欲望而肿胀的阴户展现在你面前。你现在就可以再来一次，而不会有任何人眨一下眼睛。大多数恶魔仍然太专注于他们自己的操弄了。");
         outputText("[pg]但是……你还要面对一位恶魔女王。如果你想把这只地精据为己有，你只需要告诉她在外面等你……你要留下她吗？");
         menu();
         addButton(0,"招募米兹",recruitMitzi);
         _g = this;
         addButton(1,"继续",function():void
         {
            _g.driderDefeatMenu();
         });
      }
      
      public function titfuckMitziSlow() : void
      {
         clearOutput();
         outputText("快速环顾了一下聚集的恶魔，证实了你的猜想。他们正忙着看戏自慰，无暇干涉。[say: 慢慢来，拜托了。]你抓住她那头紫色的长发，把她的脸更紧地按在你的肉棒上。[say: 把每一滴都榨干。不能给这些恶魔或他们的走狗留下一滴。]");
         outputText("[pg]米兹高兴地娇呼道：[say: 噢，你现在肯定会带走米兹的！在这之后你的肉棒会爱上米兹的！]她用那丰满得像枕头一样、甚至能让你躺在上面睡个午觉的嘴唇亲吻着你的[cock biggest]。她涂着厚厚紫色唇彩的嘴唇几乎毫无阻力地上下滑动，在肉棒下方印下一个个湿润、满是口水的吻。你的[legs]发软，更别提抓着她头发的手了。当你试图保持直立时，她从你无力的手指间滑出，获得了取悦你阴茎的全部空间，你感觉到她的舌头伸展开来，在肉棒上涂满了足以稀释一个黏液女孩的口水。");
         outputText("[pg]你呻吟出声。没有必要忍耐，尤其是在这里，周围的恶魔们正在进行着如此淫荡的行为，相比之下乳交简直就像是在冥想。即使你想忍，你也怀疑自己能否抵挡住这个地方纯粹的肉欲，这里散发着性爱的恶臭，连墙壁上都镶嵌着滴水的肉缝和喷射精液的肿胀肉棒的景象与声音。");
         outputText("[pg][say: 别射，[master]，]这个绿皮荡妇恳求道，[say: 你必须慢慢射。米兹保证过。]她灵巧地用一只手握住你的根部，稳住你那颤抖的");
         if(get_player().biggestCockArea() <= 20)
         {
            outputText("、微小的");
         }
         outputText("肉柱");
         if(get_player().biggestCockArea() <= 20)
         {
            outputText("，几乎把它整个遮住了");
         }
         else if(get_player().biggestCockArea() >= 100)
         {
            outputText("，几乎无法支撑它");
         }
         outputText("。");
         if(int(get_player().cocks.length) > 1)
         {
            outputText("她保持另一个");
            if(int(get_player().cocks.length) > 2)
            {
               outputText("");
            }
            outputText("倾斜在外面，虽然她时不时地偏爱");
            if(int(get_player().cocks.length) == 2)
            {
               outputText("它");
            }
            else
            {
               outputText("它们");
            }
            outputText("用温柔、鼓励的抚摸。她的注意力一直集中在最大的那个上。");
         }
         outputText("[say: 虽然她以前从未用吻让人高潮过……] 米兹拨开眼睛上的紫发，弯下腰将嘴唇贴在你的[cockHead biggest]上。");
         outputText("[pg]这个吻缓慢而灼热，宣告了只有地精才能拥有的那种罪恶的对肉棒的渴望，这种对精液的渴望已经被恶魔魔法增强到了超越任何理智的程度。米兹的嘴唇与你的[cockHead biggest]做爱。它们崇拜它，在她反复的口交中发出湿润的吧唧声。她的舌头有时在你仍然封闭的尿道上来回滑动。其他时候，它会进行充满欲望的探索，寻找并舔舐每一根可见的静脉。");
         outputText("[pg]咯咯笑着，这只翠绿色的狐狸精用舌头收集你的先列腺液，并将其涂抹在她肿胀的紫色吸精唇上，直到它们像紫水晶一样闪闪发光，被你自己泄漏的欲望所掩盖。[say: 当然，米兹永远不会违背" + get_player().mf("master\'s","mistress\'s") + "的命令。] 她亲吻你坚持不懈的下半身上面裸露的肉体。[say: 只有最好的乳交才配得上[master]。]");
         outputText("[pg]米兹弓起背，将她那硕大的胸部拖过");
         if(get_player().balls > 0)
         {
            outputText("你的[balls]，然后");
         }
         outputText("向上滑到你[cock biggest]的两侧，用感觉软得有些不真实的肉团将其包裹。她修剪整齐的指尖从两侧按下，收紧了她的钳制，直到你感觉到她的心跳在你的勃起上跳动，将令人愉悦的感觉传遍这个过于敏感的器官。");
         if(get_player().balls > 0 && get_player().ballSize > 5)
         {
            outputText("你将更多的先列腺液滴在汗水闪烁的隆起上。尽管它们很大，但仍无法完全包裹住你的整个长度，让你能以令人毛骨悚然的细节看着这一切发生。");
         }
         else
         {
            outputText("你将更多的先列腺液滴进她那泥泞的乳沟里。你能感觉到它变得越来越滑，但无法完全看清过程。除了你的[cockHead biggest]上的感觉，你什么也感觉不到。");
         }
         outputText("[pg][say: 喜欢吗？] 一个声音在那两个宏伟的球体上方问道。");
         outputText("[pg]你的回应是一半呻吟一半美妙的叹息。你向后仰起头，将你的[hips]稍微向前推，让自己稳稳地坐在那颤抖的乳沟里。");
         outputText("[pg]米兹问道，[say: 你想慢点还是快点？] 她慢慢地迫使她的乳房以交替的摆动方式弹跳，在你流着口水的肉棒周围滑动和挤压。[say: 如果你操我的奶子，感觉就不会那么好了。我保证。] 她眨了眨眼，用拇指和食指捏住自己的乳头。");
         outputText("[pg]你慵懒地点点头，抓住附近的一根柱子作为支撑，试图忽略手指下雕刻的淫秽艺术品。这不太管用；连你都能感觉到你的手正拂过几十个小乳头和突出的乳尖。米兹的乳头看起来就像你感觉到的放大版，上面覆盖着淫秽的乳晕和坚硬的尖端，一定非常敏感。从她按摩你[cock biggest]时的呻吟声来看，她显然很享受。");
         outputText("[pg]渐渐地，袭击你的感觉让你不知所措。米兹那精致的乳房在你身上的感觉，本身就能让你在短时间内喷射，但你并不是一个人。你被各种感官享受的欢腾身影所包围：有着硕大乳房和完美脸庞的魅魔，长着棒球棒般肉棒的肌肉牛头人，英俊得连修女都会为了一个吻而放弃信仰的梦魔，还有一百多个。你看到了他们所有人。你闻到了他们的激情，在空气中弥漫，无处不在，令人鼓舞。你怎么能不射精呢？你怎么能不把米兹那狂喜的脸庞涂上一层厚厚的白色呢？");
         outputText("[pg]就这样，那挤压的温暖消失了，取而代之的是感觉有点太冷而不舒服的空气。你的[cock biggest]悬在半空中，暴露在外，抽搐着，处于爆发的边缘，但如果没有那个绿皮的帮助，却无法爆发。");
         outputText("[pg][say: 求你了，] 你喘息着，感觉那一刻开始流逝。[say: 我需要射精！]");
         outputText("[pg]米兹咬着下唇，上面还沾着一层你的体液。[say: 不行！你告诉我要慢慢来的。而且，大家都知道" + get_player().mf("masters","mistresses") + "在精虫上脑的时候说的话都做不得数！上次我让别人提前射了，结果我整整一天都没鸡巴吃！]她摇了摇头。[say: 坚持住，你会像大炮一样射出来的。我用小穴发誓。]");
         outputText("[pg]用小穴发誓？那是什么鬼？");
         outputText("[pg][say: 哦，你准备好要更多了！耶！]还没等你插上话，米兹那柔软的肉棒按摩器就又贴了上来，把你的疑问变成了一声长长的呻吟。你之前感受到的那种电流般的快感潜藏在这种新感觉之下，进一步增强了它。如果她快速地给你撸几下，她能在几秒钟内让你把她的胸部射得雪白，但她没有。她保持着缓慢的节奏，温柔地按摩着你的整根肉棒。");
         if(get_player().biggestCockArea() >= 100)
         {
            outputText("有时她甚至会在你的[cockHead biggest]或下面一点的地方多亲几下。其他时候她会像舔棒棒糖一样舔你——至少是那些没有埋在胸部里的部分。");
         }
         outputText("[pg]你感觉头晕目眩。难怪那个蛛化精灵恶魔把这个女孩留在身边！她的胸部技术太好了，简直就像注入了黑魔法一样，变成了充满情欲的坦克，火花四溅。");
         outputText("[pg]最糟糕（或最好）的部分是，她是对的。你现在感觉比在巅峰状态时还要好。高潮的欲望依然存在，在你的脑海深处抓挠，但它被更厚重的快感之墙挡住了，因为你知道她再次停下来可能会带来更多的极乐。");
         outputText("[pg]米兹一边动作，一边用她那双暗色的眼睛看着你，对你露出微笑。[say: 有人现在进入状态了，不是吗？]她加快了胸部弹跳的速度，给你带来了难以承受的刺激。[say: 是啊，你快要射了，对吧？]她把胸部压在两侧，扭动着身体，让它们横向滑过你那饱满的[cocktype biggest]，把你包围在一个漩涡中，仿佛要把你身体里的每一滴精液都榨干。[say: 差一点就要屈服了。]");
         outputText("[pg]你腹部的肌肉在抽搐。");
         if(get_player().balls > 0)
         {
            outputText("你的[balls]感觉快要爆炸了，在你的[cocks]下面紧紧地收缩着。");
         }
         outputText("边缘就在那里。你现在就可以越过去——只要用力一挺，你就能做到。");
         outputText("[pg]米兹再次在你到达顶点之前退了回去，留下你那愤怒的肉棒在空气中无力地颤抖，上面还连着她那似乎永远流不完的先列腺液拉丝。她的奶子闪闪发光，沾满了体液和汗水的混合物。她伸出一根手指，上面闪烁着汗水或淫液，或者完全是别的东西，轻轻地敲了敲你的[cock biggest]。");
         outputText("[pg][say: 不。]她又敲了一下。[say: 还没到射精的时候！]这个紫发小荡妇蹲在自己淫液的水坑里，重复道：[say: 我们俩都不能射。]她的舌头舔了舔嘴唇。[say: 不过，当我们俩都高潮的时候，感觉会很好，不是吗？]她几乎是呻吟着说出后半句，臀部在脚跟上前后摇摆。一颗严重充血的阴蒂随着每一次动作摩擦着，威胁着要在可怜的地精脑海中引爆一场极乐的爆炸。");
         outputText("[pg]渐渐地，流遍你全身的不由自主的收缩消退了，留下你依然坚挺，依然不满足，依然站在那里，把鸡巴掏出来，面对着你见过的最荡妇的地精");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1203) > 0)
         {
            outputText("自从遇到塔玛尼之后");
         }
         outputText("。甚至微风吹在你的鸡巴上都感觉很好。");
         outputText("[pg]你向那边看去，一个涂满油的魅魔正向你眨眼，她有着挺拔的C罩杯和完全张开的小穴。要上她太容易了，只要插到底，一次又一次地卸货，直到你的[balls]干涸，疲惫感战胜你。");
         outputText("[pg]米兹居然对那个堕落的荡妇呲牙咧嘴，露出她自己微型的尖牙。一条和魅魔很像的尾巴在她头顶升起，不知怎么的让这个绿色的小女孩看起来更大、更有威慑力。[say: 这是<b>我的</b>精液，]她嘶嘶地说，抓住你的[cock biggest]，毫不温柔地捏了捏。[say: <b>米兹的新[master]。</b>]");
         outputText("[pg]令人惊讶的是，那个恶魔退缩了，消失在附近一个萨特的怀抱里。");
         outputText("[pg]然后她的胸部再次压迫着你，从你的[cock biggest]中榨取出比你想象中在没有高潮的情况下能给出的更多的狂喜。你过去几乎高潮的余韵与包围着你的闷热湿滑的拥抱结合在一起，让你除了为这个微型荡妇呻吟之外什么也做不了。你的一部分在想，如果她的奶子能从你身上榨出这么多兴奋，那她的小穴会是什么感觉。难怪这块翡翠珍宝被锁在莉希丝的王座室里。");
         outputText("[pg][say: 哦，有人在发抖！]米兹高兴地宣布。[say: 在米兹妈妈的奶子里又热又粘！]她稍微加快了上下颠簸奶子的速度。你的[cockHead biggest]在它们之间膨胀，威胁着要射出来。它比平时敏感得多，硬得发疼，准备好要发射了。[say: 又在积聚了，不是吗？]");
         outputText("[pg]如果说之前还没有，那现在肯定是了。你能感觉到高潮正在这压倒性的快感迷雾中蔓延，你的身体正将你的精液推向爆发的边缘。如果米兹现在停下来，你可能还是会滴下白色的丝带。");
         outputText("[pg][say: 这次你要射了吗？] 米兹呻吟着。[say: 感觉你好像要射了。] 她的皮肤贴着你的皮肤，感觉好烫，从脚趾到发梢都泛着深红。她的眼睛明亮而充满探寻，仿佛她和你一样准备好高潮了。[say: 你觉得你还能再憋一次吗？] 她快速地套弄了你一下，然后再次退开，将你涂满先列腺液的肉棒暴露在空气中——以及她充满欲望的目光下。");
         outputText("[pg]它在有力地抽动着");
         if(int(get_player().cocks.length) > 1)
         {
            outputText("——它们");
            if(int(get_player().cocks.length) == 2)
            {
               outputText("两个");
            }
            else
            {
               outputText("全部");
            }
            outputText("都是，甚至那个");
            if(int(get_player().cocks.length) > 2)
            {
               outputText("");
            }
            outputText("没怎么得到她关注的");
         }
         else
         {
            outputText("，将一缕缕先列腺液甩在你的肚子和米兹的脸上");
         }
         outputText("。你离高潮如此之近；你能感觉到，能感觉到那滚烫的液体在你的尿道里翻腾");
         if(int(get_player().cocks.length) > 1)
         {
            outputText("");
         }
         outputText("，处于四处喷射的边缘。米兹舔着嘴唇，拉扯着她因情欲而胀大的乳头，她的下巴张开，让你能欣赏到她下唇那不可思议的丰满，以及如果涂上一层充满阳刚之气的爱液，它看起来会有多棒。");
         outputText("[pg][say: 嗯……] 这个绿色的荡妇呻吟着。她小心翼翼地将那根湿润的手指伸向你。它散发着浓烈的女性情欲气味。在某个时刻，她一定抽空在自己喷水的穴里揉弄过它。慢慢地——太慢了——她将柔软的指尖压在你[cockHead biggest]的下方。[say: 你终于准备好了。我只要对着你呼一口气，就能让你达到顶峰，对吧？]");
         outputText("[pg]天哪，她说得对。你翻着白眼点点头，一根手指贴在你跳动的肉棒上的感觉，将你带到了爆炸性高潮的摇摇欲坠的边缘。");
         outputText("[pg]米兹沙哑地说，[say: 很好。现在让米兹给你吧。] 她的指尖顺着你收缩的尿道向下滑动，越来越靠近精液在你体内翻腾的地方，在你的脑海中引发了热量和欲望的爆炸。一个打着哈欠、无限的射精和释放的深渊回望着你，你除了坠入其中别无他法。强烈的收缩折磨着你的身体，让你的欲望和快感呈指数级增长。就算你想停，你也停不下来了。");
         outputText("[pg]米兹咯咯笑着，把你直接滑回她那沾满肉棒液体的乳房里，用一只手臂环抱住它们，将你的[cockHead biggest]深深地固定在里面，埋在如此多的乳肉中，以至于你的[legs]几乎因为这奇妙的感觉而瘫软。她的另一只手短暂地向下伸去，然后转向向上抚摸一个乳头，将她流泪的缝隙在自己的脚上摩擦的感觉，足以让她在没有帮助的情况下高潮。");
         outputText("[pg]精液断断续续地从你的[cock biggest]中冒出，将那滑溜溜的乳沟变成了一个肮脏的沼泽。白色的泡沫从顶部喷出，而精液的细流则镀在那个地精的中间，汇聚在她的肚脐里。你的[hips]抽搐痉挛，迫使你本能地操她，像一个着魔的[manboy]一样在她的乳房里播种，既惊讶又决心要把它们填满到溢出。");
         if(get_player().cumQ() >= 5000)
         {
            outputText("[pg]米兹一点也不知道你是一个多么有能力的播种者。在你射完之前很久，你就在她的双乳之间填满了一片浓稠的黏液海洋。她的大腿和暗色的缝隙很快就被浸透了，涂上了一层象牙色的光泽。这个颤抖的绿皮地精在你还没射完之前，就从她自己的快感中恢复过来，困惑而狂热地盯着你产生的前所未有的精液量。她将沾满精液的乳房向下滑动，把你的[cockHead biggest]弹出来，用你最后的子孙浸透她的脸和头发，贪婪地用她过长的舌头接住芬芳的精液团。");
         }
         get_player().orgasm("Dick");
         menu();
         addButton(0,"继续",titfuckMitziSlowII);
      }
      
      public function titfuckMitziQuick() : void
      {
         var _g:DriderIncubusScenes;
         clearOutput();
         outputText("[say: 如果你真的能做到，那就快点，]你回答这个娇小的绿色荡妇。");
         outputText("[pg]米兹把你的[cock biggest]压在她的脸侧，抬头看着你，她的眼睛睁得大大的，充满了兴奋和欲望。[say: 你会喜欢这个的，[Master]。之后你一定会忍不住把米兹带回家的。]");
         outputText("[pg]自信的荡妇站起身来，拱起背，把她下垂的乳房贴在你的[cocks]上");
         if(get_player().balls > 0)
         {
            outputText("，她的乳头在你的[sack]皮肤上拖拽着");
         }
         outputText("。她理所当然地抓住自己的乳房并将它们拉开，露出一大片被她自己的汗水弄得湿滑的绿色肌肤。[EachCock]陷入了那诱人的沟壑中，一秒钟后，她把她的双峰合拢，将你包裹起来");
         if(int(get_player().cocks.length) > 1)
         {
            outputText("");
         }
         outputText("在光滑柔软的乳肉中。她的胸部感觉几乎是为你[cocks]量身定做的，旨在均匀地压迫每一个敏感的地方。你忍不住兴奋地跳动了一下。");
         outputText("[pg]敏锐的小荡妇察觉到了这一点，又向你闪过一个心照不宣的微笑，接着她跪倒在地，让[eachCock]滑过她的爱之枕，直到龟头");
         if(int(get_player().cocks.length) > 1)
         {
            outputText("们");
         }
         else
         {
            outputText("被");
         }
         outputText("暴露在她涂着紫色唇膏的嘴唇和流着口水的舌头前。她急忙吞下[oneCock]，轻松地用她沾满唾液的舌头裹住它的周长，而她的脸颊因为几乎不停的吸吮而凹陷。");
         outputText("[pg]你微微颤抖。你没想到她会这么快就让你的[cocks]硬起来，你当然也没想到她会让你的臀部颤抖并准备好冲刺。");
         outputText("[pg]当你还在试图适应她的舌头卷曲并压迫你[cockHead biggest]下方敏感部位的方式时，米兹进入了她乳交的下一个阶段。她熟练地将她的双峰向下拉，让它们在你的胯部弹跳，以便在没有一秒钟停顿的情况下将它们滑回原处。操，这个绿皮知道怎么让一个[guy]射精！");
         outputText("[pg]你已经能感觉到肠胃里开始出现快感的痉挛了，而她才碰了你的[cocks]三十秒左右！米兹调皮地迎上你的目光，加快了乳房的动作，湿漉漉地拍打着你的[hips]，形成一种有规律的节奏。当你开始抽搐和呻吟时，她丰满的乳房在你的[cocks]周围变成了一片绿色的模糊，但当你开始爆发时，她放慢了速度，以配合流经你身体的高潮悸动，榨干你的每一滴精液。");
         if(get_player().cumQ() <= 500)
         {
            outputText("[pg]她的嘴唇从未离开过你的龟头；她吞下每一滴精液，脸上带着那种只有在经历了极其满足的事情后才会有的愉悦表情。");
         }
         else
         {
            outputText("[pg]她试图让嘴唇紧贴你的龟头，喉咙发出嘈杂的吞咽声，试图吞下你喷涌而出的每一滴精液，但她就是跟不上。精液的体积将她从你的[cock biggest]上推开，只是在她的脸上喷出一条极其粗壮的绳索。她茫然地从涂着紫色唇膏的嘴唇上流下精液，而你则在她的头发和脸上涂上了一层面具。不知怎么的，她看起来极其满足。");
         }
         if(int(get_player().cocks.length) > 1)
         {
            outputText("她只有一张嘴，所以你剩下的精液洒在她跳动的乳房上，在颤抖的、挤奶的肉丘之间形成一层乳白色的泡沫。你还没射完，她的一只手就开始把它抹开。");
         }
         outputText("[pg]这个渴望鸡巴的地精也从未完全停止过，攻击着你过度敏感的阴茎");
         if(int(get_player().cocks.length) > 1)
         {
            outputText("");
         }
         outputText("带着只有地精性奴才有的那种不顾一切的放纵。你的[legs]发软，[eachCock]淫猥地鼓胀着，不知道是该软下去，还是该再射一发。");
         outputText("[pg]幸运的是，你设法在她让你再次准备好之前踉跄着退了回来。米兹眨着她");
         if(int(get_player().cocks.length) > 1 || get_player().cumQ() > 500)
         {
            outputText("沾满精液的");
         }
         outputText("睫毛看着你，把一滴散落的精液推过她肿胀的吸精唇，大声地吞咽着。");
         outputText("[pg]在继续前进之前，你可能应该决定是否要留下她。你想要一个地精奴隶在营地吗？她可以在外面等你。这很容易。[EachCock]因余震而刺痛，微妙地表示同意。");
         get_player().orgasm("Dick");
         menu();
         addButton(0,"招募米兹",recruitMitzi);
         _g = this;
         addButton(1,"继续",function():void
         {
            _g.driderDefeatMenu();
         });
      }
      
      public function titfuckMitzi() : void
      {
         clearOutput();
         outputText("你对着地精咧嘴一笑，推开你的[armor]露出你的[cocks]，解释说在你决定收她为自己的奴隶之前，你想看看她用乳房取悦你[cock biggest]的表现。毕竟，她和她的主人要为你现在这坚挺的状态负责");
         if(get_player().balls > 0 && get_player().get_lust100() >= 75)
         {
            outputText("以及涨得发疼的蛋蛋");
         }
         outputText("。她为那个无可救药的恶魔的所作所为做出补偿是理所应当的。");
         outputText("[pg]米兹毫不迟疑地跪倒在地，半爬半挪地靠了过来。每当她身体前倾得太厉害时，她那坚挺发紫的乳头就会拖在地上，使她那被汗水浸润的乳房相互碰撞、摇晃。这种刺激让她脸红得更厉害了，在身后的地板上留下了一道淫液的痕迹。当她的鼻子终于碰到[oneCock]时，她用鼻子蹭了蹭它，温柔地亲吻着上面的青筋，鼻孔兴奋地扩张着。");
         outputText("[pg][say: 噢，它真的很需要好好射一次，不是吗？]米兹在一个特别湿润的吻后发出满足的呼噜声。[say: 你想让米兹让你射得快点还是慢点？她知道你很赶时间。]这个地精用她的一双小手包住你，轻轻地抚摸着。[say: 拜托了[master]，告诉米兹该怎么做。]");
         outputText("[pg]她认为她能让你快速高潮，好让你回去执行任务，但同时也提出可以慢慢地用乳房侍奉你的[cock biggest]，直到快感逐渐将你淹没。你更喜欢哪种？");
         menu();
         addButton(0,"快速",titfuckMitziQuick);
         addButton(1,"缓慢",titfuckMitziSlow);
      }
      
      public function spooderbuttGetsANewCockSleeveVI() : void
      {
         clearOutput();
         outputText("正如[his]所说，莉希丝在同一年征服了特尔阿德雷，玛瑞斯的其余部分也很快沦陷。勇者开始明白莉希丝话语中的真相");
         if(int(get_player().vaginas.length) == 0)
         {
            outputText("，在被装上合适的生殖器后，");
         }
         else
         {
            outputText("和");
         }
         outputText("在繁殖坑中服役，无休止地交配以维持一支消耗性的小恶魔军队。");
         outputText("[pg]黑暗女王并没有忘记她最喜欢的战利品。至少每周一次，如果时间允许，她会拜访这位前勇者，并允许[him]满足她无尽的、堕落的需求。几个小时过去，除了舌头在湿滑的缝隙上摩擦之外，几乎没有其他事情，而这位前勇者从未如此快乐过。");
         get_game().gameOver();
      }
      
      public function spooderbuttGetsANewCockSleeveV() : void
      {
         clearOutput();
         outputText("当一对恶魔牛头人用毛茸茸的手臂挽住你的手肘开始把你拖走时，你才回过神来。莉希丝用她那非人的眼睛饥渴地看着你。她的裙子已经放下来了，但你努力在她身下制造的水坑却无法隐藏。你的下巴因为用力而酸痛。你到底舔了她多久？");
         outputText("[pg]在你离开房间之前，疲惫而幸福的睡眠占据了你。");
         menu();
         addButton(0,"继续",spooderbuttGetsANewCockSleeveVI);
      }
      
      public function spooderbuttGetsANewCockSleeveIV() : void
      {
         clearOutput();
         outputText("莉希丝的意志如同实质般压迫着你。");
         if(get_player().cor < 50)
         {
            outputText("无论刚才觉得给她舔阴的想法有多么令人反感，你发现自己的思绪越来越集中在她的阴部上。");
         }
         else
         {
            outputText("无论你对这个想法有什么异议，你都太饥渴了，甚至连象征性的抵抗都做不到。");
         }
         outputText("她尝起来会是什么味道？她是个恶魔；什么味道都有可能。她的小穴可能有最甜美的草莓味，或者包含你凡人的舌头几乎无法理解的味道。");
         outputText("[pg]你挣扎着爬起来，擦去嘴角的口水。这是什么时候开始的？");
         outputText("[pg][say:哦，看看你，跪在地上流口水。你真是太让我受宠若惊了，勇者，真的。]莉希丝拨开她的阴唇。淫液从中如小溪般浓稠地滴落。[say:看？你把我都弄湿了。]");
         outputText("[pg]她现在比刚才湿得多了，而且");
         if(int(get_player().vaginas.length) > 0)
         {
            outputText("从你的[armor]紧贴在胯部的样子来看，湿的不仅是她一个人。");
            if(get_silly())
            {
               outputText("你的内裤湿得大概都能淹死人了。");
            }
         }
         else if(int(get_player().cocks.length) > 0)
         {
            outputText("从先列腺液不断从你的[cocks]涌出的样子来看，湿的不仅是她一个人。");
         }
         else if(get_player().get_lust100() >= 95)
         {
            outputText("从你流口水的程度来看，湿的不仅是她一个人。");
         }
         else
         {
            outputText("从你[skin]滚烫的触感来看，欲火焚身的不仅是她一个人。");
         }
         outputText("随着每一滴淫液从她的女性裂隙中溢出，你的好奇心和本能欲望都在飙升。水滴溅落在地板上的声音，就像一道情欲的闪电击中你的大脑。");
         outputText("[pg]跪在恶魔女王滴水的阴部前，你做出了唯一能做的事。你呻吟着伸出舌头，带着贪婪的饥渴向前倾身。莉希丝的眼睛移开了，你的视线被她肿胀的阴阜和泛紫的阴唇填满。顺着她双腿流下的水滴似乎滑过了你的灵魂。那粉红色的中心召唤着你去触摸它，去品尝它。当你靠近时，你的[legs]不禁颤抖起来。");
         outputText("[pg]气味首先袭来，像苹果派一样温暖香甜，却又带着致命而压倒性的性意味。你无法真正描述它。它超出了你的理解范围，你觉得即使闻上一千次，也无法充分描述她那完美、绽放的阴户散发出的绝妙香气。它好闻得有些<i>不对劲</i>，甚至不像是人类能有的，但你还是想要更多。当你结束时，你还会想要更多。她的气味就像一条鞭子，鞭笞着你仅存的理智，直到它像一条被打败的狗一样退缩到你脑海最黑暗的角落。");
         outputText("[pg]这次你没有试图擦去下巴上的口水。你闭上眼睛，为了更好地集中注意力感受她带给你的奇妙感觉。一丝担忧的念头刚刚浮现，就被你狂暴的需求迅速锁了起来。");
         outputText("[pg]你的舌头一接触到她那如神酒般的阴户就发出嘶嘶声，味蕾仿佛被粗心的手扔进篝火的烟花一样引爆。它尝起来不像草莓，也绝对不像苹果派。那是另一种东西，湿润而粘稠，像粘在你的舌头上一样紧紧地粘在你的灵魂上。你乘着赤裸裸的恶魔欲望之翼向前冲去，决心尽可能多地把她含在嘴里，品尝每一道褶皱，细细品味每一滴汁液，吞噬你罪恶劳动的果实。");
         outputText("[pg]莉希丝像个初尝禁果的少女一样咯咯笑着，随后转变为全身心的呻吟。雷鸣般的掌声在你周围响起，尽管你内心被锁起来的那部分想要感到羞耻，但那个像奴隶一样崇拜莉希丝阴户的舔阴荡妇却为这赞美而兴奋不已。你大声地吸吮着，决心取悦你的观众，以及你应得的感官营养的来源。");
         outputText("[pg]你的脸颊、鼻子和下巴很快就闪烁着多余的润滑液。你用狂热的眼睛抬起头，意识到自己现在的样子，却无法在意。你的[tongue]在她那口香糖粉色的阴蒂周围滑动，让腐化女王在你的脸上颤抖和扭动。然后，你将你的口腔肌肉滑入她更深的裂缝中，并将你的上唇紧紧贴在她肿胀的肉核上。随之而来的呻吟声大得让你的耳朵嗡嗡作响。");
         outputText("[pg]一条蜂蜜之河涌入你的嘴里，溅在你的扁桃体上，顺着你饥渴的喉咙流下。粉红色的嘴唇在你的嘴上轻轻颤动，你加倍用力地吸吮着莉希丝的阴蒂，轻轻地吸吮着它，同时有节奏地将你的舌头刺入她颤抖的褶皱深处。你的身体和她一起颤抖；你能尝到她的狂喜，就像一种有形的东西，通过狂野刺入的舌头将她的快感吸收到你自己的体内。");
         outputText("[pg]你闻到了小穴的味道，你尝到了小穴的味道，你在感同身受的极乐中颤抖，直到狂喜的回声将你推向了忍耐的边缘。当莉希丝在你的嘴上摩擦时，你的嘴松弛下来。你的声音变成了一声尖叫的呻吟，那是她恶魔般的高潮呼唤的不完美克隆。");
         if(int(get_player().cocks.length) > 0)
         {
            outputText("你的[cocks]喷射");
            if(int(get_player().cocks.length) > 1)
            {
               outputText("");
            }
            outputText("徒劳地射在你的[armor]里。");
         }
         if(int(get_player().vaginas.length) > 0)
         {
            outputText("你的[vagina]");
            if(int(get_player().cocks.length) == 0)
            {
               outputText("浸透了你的内衣");
            }
            else
            {
               outputText("与那些废弃的精液混合在一起");
            }
            outputText("。");
         }
         outputText("[pg]你感觉自己就像一根被越调越紧的吉他弦，在越来越高的快感音调中振动，直到它即将断裂。");
         outputText("[pg]莉希丝的手突然推开你的额头，在你完全失去意识之前，即使那样，你仍然躺在地板上，伸出舌头寻找更多。");
         menu();
         addButton(0,"继续",spooderbuttGetsANewCockSleeveV);
      }
      
      public function spooderbuttGetsANewCockSleeveIII() : void
      {
         clearOutput();
         outputText("你的束缚被某种短而锋利的东西切断，尖端压得很紧，你担心它会划伤你的[skin]");
         if(!get_player().hasPlainSkin())
         {
            outputText("穿透你的[skinFurScales]");
         }
         outputText("。但并没有。莉希丝的技术太好了，不会对她视为未来财产的东西造成物理伤害。想想看，你曾以为自己能独自打败她，而现在你却躺在地板上，无法阻止她随意摆弄你仰卧的身体。");
         outputText("[pg]蛛网脱落，一只坚定的手将你翻转过来，让你第一次清楚地看到你的俘虏者。她很美。你想恨她。你希望她是一个丑陋、可怜的巫婆，但她不是。她的脸比例完美，头顶着奢华的紫色头发。卷曲的恶魔角从她的太阳穴长出，就像一顶雄伟的白色王冠的两半，而较小的、多节的突起则可爱地从她的额头突出。");
         outputText("[pg]她的眼睛将你的目光捕捉在它们漆黑的深处，阻止你探寻的目光继续向下游移。它们美丽而可怕，就像一头巨大的狩猎野兽的眼睛，黄色的，垂直裂开。当你看着它们时，很明显你看到的是一个捕食者——一个存在的全部目的就是捕食人类的东西");
         if(get_player().humanScore() < 5)
         {
            outputText("，无论多么变异");
         }
         outputText("。你沉溺在那双无限深邃的眼睛里，第一次意识到，即使是勇者也无法与不朽的灵魂吞噬者相提并论。");
         outputText("[pg]粉红皮肤的女王慵懒地摇晃着她那装满粉红水晶的酒杯，点点头。[say: 你现在看到了，不是吗？真相是……你从来没有机会对抗我。你愚蠢的十字军东征就像蚂蚁的挣扎一样微不足道，注定只会把你带向你不可避免的命运。]她露出了一个从未到达她那被墨水包裹的眼睛的微笑。[say: 既然你在这里，我可以开始你的教育了。]");
         outputText("[pg]你想否认她，拼命地想，但她是对的，不是吗？你的长辈把你出卖给了恶魔。尽管你一直在战斗和挣扎");
         if(get_player().cor >= 50)
         {
            outputText("，你还是让自己堕落了");
         }
         else
         {
            outputText("，你受到了这片土地上猖獗的堕落的严重诱惑");
         }
         outputText("。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2024) == 2)
         {
            outputText("你甚至无法拯救这个地方最后纯洁的灵魂之一，玛莱。");
         }
         outputText("特尔阿德雷的沦陷只是时间问题，");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1077) == 0)
         {
            outputText("惠特尼的农场被吞噬");
         }
         else
         {
            outputText("莉希丝感谢你准备了惠特尼的农场");
         }
         outputText("，或者更糟。你浑身瘫软，被打败了");
         if(get_player().get_lust100() >= 90)
         {
            outputText("并且欲火焚身");
         }
         outputText("，但不愿向你长期的宿敌承认这一点。");
         outputText("[pg][say:好[boy]。]莉希丝抚摸着你的头发，无视了你眼角的泪水。[say:你配得上我极少给予的奖赏。]她移开视线，让你看着她撩起黑色的长裙——这裙子简直就像修女服一样，如果修女服会在上面挖洞来展示她们坚挺、穿环的乳头的话。布料沿着她完美光滑的双腿越升越高，直到露出一条湿润粉嫩的肉缝。[say:在你进入洗脑水箱之前，我允许你以自由[manboy]的身份舔我。]");
         outputText("[pg]你震惊地抬头看她，不小心再次与她对视。这一次，你比上次更容易陷入她那令人无法自拔的眼眸中。");
         outputText("[pg][say:如果你做得好，我会吩咐他们尽可能多地保留你的个性。]莉希丝的声音充满了真实感与威严。[say:要是惹我不高兴，你就会变成一具空有躯壳的行尸走肉，只配用来繁殖。]她咯咯地笑了起来，[say:但是像你这么</i>乖的[boy]<i>，绝对不会让我失望的，对吧？]");
         menu();
         addButton(0,"继续",spooderbuttGetsANewCockSleeveIV);
      }
      
      public function spooderbuttGetsANewCockSleeveII() : void
      {
         clearOutput();
         outputText("由于你被抱着的姿势，你无法看清恶魔女王。你几乎看不到那个骑在肉棒上的地精起伏的乳房和缓慢摩擦的身体之外的任何东西，你能看到的主要是地板、一点点王座，以及涂着黑色指甲油的娇小粉色脚丫。那些脚趾开心地扭动着。主人将脚跟并拢，露出骨刺，使她的脚底像穿了高跟鞋一样拱起。");
         outputText("[pg][say: 我必须说，我很惊讶，基纳里尔。我没想到你能独自击败这样一个麻烦制造者。] 长着长指甲的手指掐住你的下巴，扭过你的头，以便看得更清楚。[say: 而且我很失望。我本希望你能成为一个像样的挑战。我已经很久没有在战斗中放开手脚了。] 她对你啧啧称奇。[say: 真遗憾。不过，你身上有种繁育者的气息。你也许还能为我服务。基纳里尔，把[him]放下。]");
         outputText("[pg][say: 如您所愿，我的女王，] 英俊的蛛化精灵鞠了一躬，低得连他的角都碰到了地板。他同时放开了你，让你重重地摔在地上。[say: 还有什么我可以为您效劳的吗，女主人？]");
         outputText("[pg]莉希丝的声音悦耳动听。[say: 不用了。我感谢你的提议和你的服务。等我处理完这个，我会给你相应的奖励。你将作为国王回到你的子民中。] 聚集的恶魔中弥漫着沉重的停顿。[say: 如果你愿意，一旦入侵结束，你可以优先挑选特尔阿德雷的奴隶。我知道你对一对狐狸女孩有想法。]");
         outputText("[pg][say: 您太仁慈了，我的女王。]");
         outputText("[pg][say: 确实如此。]柔软的手指抚摸着你的头发。[say: 你可以走了，基纳里尔。我很快就会派人传唤你。]");
         outputText("[pg]鞠躬的恶魔领主的阴影落在你身上。你看不清什么，但你发誓他在笑。三四秒后，他以惊人的速度溜走了，留下你和堕落女王莉希丝独处。");
         menu();
         addButton(0,"继续",spooderbuttGetsANewCockSleeveIII);
      }
      
      public function spooderbuttGetsANewCockSleeve(param1:Boolean, param2:Boolean = false) : void
      {
         clearOutput();
         var _loc3_:DriderIncubus = get_monster();
         outputText("莉希丝王座室的地板贴着你的");
         if(param1)
         {
            outputText("受伤的");
         }
         else
         {
            outputText("发红的");
         }
         outputText("脸颊，并没有你想象的那么冷。");
         if(param1)
         {
            outputText("你甚至不记得自己是怎么倒下的。前一刻你还在和一个八条腿的恶魔怪物战斗，下一刻你就脸朝下趴在抛光的花岗岩上，头痛欲裂。");
            outputText("[pg]基纳里尔的昆虫腿在绕着你转时发出嘈杂的咔哒声。[say: 我告诉过你这会发生的。如果你不挣扎会更好。恶魔女王不喜欢她的猎物在捕获时带有瘀伤。]他惊愕地闭上嘴巴。[say: 我想这也是没办法的事。停止挣扎，接受你的命运吧。]");
         }
         else
         {
            outputText("当你开始滑倒在抛光的花岗岩上时，你太兴奋了，根本不在乎。");
            if(!get_player().get_weapon().isAttached())
            {
               outputText("你的[weapon]在你旁边沉闷地发出咔哒声，被你那吞噬一切的欲望所遗忘。");
            }
            outputText("[pg]基纳里尔的昆虫腿在绕着你转时发出嘈杂的咔哒声。[say: 真遗憾你反抗了。我确实很后悔把你逼到这种地步。你知道，恶魔女王更喜欢自己动手。]他嘈杂地闭上嘴巴。[say: 停止扭动。如果你还想再次高潮，你需要从</i>她<i>那里赢得奖励。]");
         }
         outputText("[pg]从你上方和后方传来一声介于嘶嘶声和撕裂织物之间的声音。那些令人生畏的腿蜷缩在你倒霉的身体下面，以令人眼花缭乱的速度旋转你。你试图挣扎，但你的[legs]被什么东西钉在一起，被某种无弹性的织物绑住，那简直就像钢卷一样。你低下头，立刻希望自己没有这么做。你身体的下半部分已经被蛛化精灵的蜘蛛半身纺出的白色纤维包裹住了。随着你身体的每一次随意旋转，包裹物爬得更高。");
         outputText("[pg]不知不觉中，你被一个象牙色的网笼包围了。末端令人烦躁地粘在你的脖子上，但谢天谢地，这个恶魔蛛化精灵没有选择包裹你的头。你无法");
         if(param1)
         {
            outputText("在这么厚的覆盖物下呼吸。");
         }
         else
         {
            outputText("在这么厚的覆盖物下饥渴地喘息。");
         }
         outputText("要是你能动弹就好了！");
         outputText("[pg]基纳里尔轻松地将你交到他的人类双手上，把你塞在一个肩膀下");
         if(!get_player().isTaur() && !get_player().isDrider())
         {
            outputText("并横放在他那蜘蛛般背部的上半部分");
         }
         if(_loc3_.get_goblinFree())
         {
            outputText("同时他的地精奴隶重新骑上了他的肉棒");
         }
         outputText("。 [say: 我必须承认，我很好奇莉希丝会选择如何处置这样的战利品。她会试图把你变成一个忠诚的恶魔步兵，还是把你驯服成一头驮兽，只配满足我们的一时兴起和淫荡欲望？] 他在围观的恶魔人群中穿梭。[say: 是时候揭晓了。]");
         outputText("[pg]当你被抬到大厅尽头的王座时，聚集的腐化者和他们的奴隶陷入了死一般的寂静。一个巨大的牛头怪和他那大胸的母牛奴隶甚至为基纳里尔让路。");
         menu();
         addButton(0,"继续",spooderbuttGetsANewCockSleeveII);
      }
      
      public function rideDriderToGoblin() : void
      {
         clearOutput();
         outputText("你对着恶魔低声的乞求露出古怪的笑容，回答道：[say: 没问题，但等我干掉你老板后，你可欠我一个人情。懂了吗？]");
         outputText("[pg]基纳里尔几乎是过于热情地点了点头。真是个胆小鬼。");
         outputText("[pg]现在……关于这个地精。她再次热切地看着你，兴奋地捧着自己的乳房。[say: 让米兹给你展示一下她的本事，你绝对不会想操别人了！]");
         outputText("[pg]好大的口气。你打算拿她怎么办？");
         if(int(get_player().cocks.length) > 0)
         {
            addButton(5,"操米兹",fuckMitzi);
            addButton(6,"米兹乳交",titfuckMitzi);
         }
         if(int(get_player().vaginas.length) > 0)
         {
            addButton(7,"米兹舔阴",mitziEatsPussy);
         }
      }
      
      public function rideDrider() : void
      {
         var _g:DriderIncubusScenes;
         clearOutput();
         outputText("你把地精推到一边，然后");
         if(get_player().hasTailInsteadOfLegs())
         {
            outputText("滑行着");
         }
         else if(get_player().lowerBody.type == 1)
         {
            outputText("哒哒地走着");
         }
         else
         {
            outputText("大步流星地");
         }
         outputText("胜利地走向你的战利品，它依然坚挺突出，被地精在战斗中激烈的肏弄打磨得像镜子一样光亮。当你的目光锁定它时，珍珠般的先列腺液从顶端溢出。仅仅是看到它就足以让你的舌头尝到味道，而旁边倒下的地精妓女那饥渴的呜咽声更是驱使你向前。");
         if(get_player().cor <= 33)
         {
            outputText("你感到有些内疚，为了更好地杀死另一个恶魔而即将与一个恶魔交媾。你本应是纯洁的化身，而不是在莉希丝的王座室里把一根滚烫、跳动的恶魔肉棒塞进自己体内，但你找不到更好的方法来确保在下一次对抗前完全满足自己。");
         }
         else if(get_player().cor <= 75)
         {
            outputText("在面对那个荡妇女王之前，你只有这一次机会发泄。你得快点。");
         }
         else
         {
            outputText("这个蛛化精灵和他那根光荣的肉棒现在任你使用和蹂躏，不属于任何人。连莉希丝都能看清这个事实。");
         }
         outputText("[pg][say: 嘿，勇者，求你了……用那个地精吧。给我留点面子。我不会再反对你了，] 基纳里尔恳求道。[say: 给我留点面子。]");
         outputText("[pg]你跪在他身上，打量着他和那根绝望地跳动着的肉棒。如果你想让他欠你一个人情，你可以改变主意去用那个地精……或者你可以强迫他满足他明显对自身屈辱的癖好，在同僚和上级面前把他骑到地上。你来决定。");
         menu();
         addButton(0,"肏他",actuallyRideDriderDick);
         addButton(1,"用地精",rideDriderToGoblin);
         _g = this;
         addButton(2,"算了",function():void
         {
            _g.driderDefeatMenu();
         });
      }
      
      public function recruitMitzi() : void
      {
         clearOutput();
         outputText("米兹准备好离开后，你友好地拍了拍她，告诉她在外面等你。");
         outputText("[pg]她狂喜地笑着鞠了一躬。[say: 太感谢你了你不会后悔的！]");
         outputText("[pg]这个容易兴奋的小东西下一刻就不见了。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1263,1);
         menu();
         driderDefeatMenu();
      }
      
      public function mitziEatsPussyII() : void
      {
         var _g:DriderIncubusScenes;
         clearOutput();
         outputText("当你的视线恢复清晰时，米兹正坐在你的腿上，轻轻地按摩着你的[chest]。虽然只过了几秒钟，但附近的恶魔似乎比你记忆中更近了。你推开这个荡妇，用你的[feet]站了起来，彻底满足了。");
         outputText("[pg][say: 米兹现在该做什么，[Master]？] 这个舌头过长的荡妇舔着嘴唇问道。[say: 还想再高潮一次吗？]");
         outputText("[pg]你没有时间加入这里的淫乱，但你现在必须对这个地精做出决定。否则，当你面对莉希丝时，她可能会让你分心。你要告诉她你会留下她并把她送回营地吗？");
         menu();
         addButton(0,"招募米兹",recruitMitzi);
         _g = this;
         addButton(1,"继续",function():void
         {
            _g.driderDefeatMenu();
         });
      }
      
      public function mitziEatsPussy() : void
      {
         clearOutput();
         outputText("你耸耸肩，趁机开始脱下你的[armor]。恶魔并不以值得信赖而闻名，但她这样做是为了展示力量。靠诡计来击败一个区区凡人可能会降低下属对她的看法。如果说你从恶魔身上学到了什么可以指望的东西，那就是傲慢。");
         outputText("[pg]这个地精，像她的大多数同类一样，痴迷于肉棒");
         if(int(get_player().cocks.length) > 0)
         {
            outputText("，虽然你确实有一根能让她尽情侍奉的肉棒");
         }
         else
         {
            outputText("，虽然你可能没有那种鼓胀的器官");
         }
         outputText("，但你刚才看到的那条舌头实在是太诱人了，不容错过。你张开双腿");
         if(get_player().balls > 0)
         {
            outputText("并托起你的睾丸，然后");
         }
         else
         {
            outputText("，");
         }
         outputText("用两根手指撑开你的小穴。[say: 过来，用你那条舌头好好干活；如果你做得好，也许我会带你离开这里]");
         outputText("[pg][say: 米兹是最好的奴隶，你会看到的。] 这个小爱奴向你爬来，眼睛死死盯着你的[vagina]。她的舌头从丰满的嘴唇滑出……一直滑到她柔软的乳房上，缠绕住一颗罪恶般粗大的乳头。那根长长的器官又弹向另一颗，重复着同样的动作，然后缩回她微笑的嘴里。米兹的小手顺着你的[hips]向上滑，她凑近过来，在你的大腿内侧印下细碎的吻。她抬头看着你，被你发情的穴口迷住了，就像一个被性欲冲昏头脑的荡妇一样。");
         outputText("[pg]这个绿皮小荡妇虔诚地舔舐、亲吻着你的身体，一点点向你性欲的中心靠近。你低头对她咧嘴一笑，双手抚摸着她的头，手指穿过她紫色的头发，引导她越来越近。只差一英寸了，近到你能感觉到她的呼吸喷洒在你的[vagina]上。你满怀期待地咬住下唇，将她拉近最后一段距离，把她柔软的嘴唇按在你的下体上。");
         outputText("[pg]肌肤相亲的瞬间成了压垮这只勉强克制的地精的最后一根稻草，她的嘴唇紧紧贴着你的小穴，印下一个淫荡的吻，她的舌头伸出来，沿着你渗出淫液的入口舔舐，然后像蛇形触手一样钻了进去。突如其来的插入让你发出一声愉悦的呻吟，你的神经被美妙的欲火点燃。你紧紧抓住玩伴的头，把她拉向你的胯部。地精的嘴唇紧贴着你的小穴，她的舌头与你发情的洞穴做爱，双手紧紧抓住你的臀部。她深深地探入你的体内，扭动的舌头来回滑动，不断地摩擦着它能触及的每一个表面。");
         outputText("[pg]为了取悦你，米兹发出一声荡妇般的呻吟，她丰满的嘴唇更用力地压在你的入口处，同时将舌头探入你的身体，像发情的爱人一样抽插着那根粗大的口腔触手。舌尖挑逗着你的子宫颈，在每一次深入、狂喜的抽插顶点，轻点着你子宫的入口。你的双腿在性欲的压力下颤抖。你微微张开嘴唇，发出一声低沉的呻吟；你自己的舌头也伸出来舔了舔干渴的嘴唇，你紧紧抱住你的小情人，强迫她取悦你的女性器官。");
         outputText("[pg]米兹简直就像是一个为女同欲望而生的生物。她没有表现出任何需要呼吸或说话的迹象。仿佛她的整个世界都是由阴道、阴蒂和其中的体液组成的。她的专一反映在她那邪恶舌头的动作上，在每一个敏感的褶皱周围徘徊，按压最敏感的神经，引导你");
         if(get_player().wetness() >= 3)
         {
            outputText("丰富的");
         }
         outputText("淫水顺着这根取悦小穴的器官中间的折痕流下，汇集到她的嘴里。");
         outputText("[pg]她大声地吞咽着，确保你能听到她吞咽的声音。");
         outputText("[pg]这太刺激了。你瘫倒在地上，[legs]张开，在倒下的过程中始终没有松开这只热情地精的头发。她自己的乳房缓冲了你的跌落，而你那酥麻的阴唇也掩盖了她惊讶的声音。如果说有什么不同的话，那就是位置的改变让她舌头的动作更加坚决。她以各种方式弯曲着那根鞭子般的器官，让你爽得翻白眼，[nipples]也隐隐作痛。");
         outputText("[pg]随着快感的增加，你的手指慢慢从她的头发上滑落，找到了你未受侵犯的胸部。在那里，它们拼命地增强从你核心辐射出来的狂喜，用不那么温柔的拉扯你的[nipples]和急切的指交来补充它。你再次呻吟，像个荡妇一样向任何听得见的人宣布你对这个绿宝石荡妇的舌头的爱。她闪烁的眼睛兴奋地看着你，同时她的舌头改变了疯狂的舔舐，向上弯曲并向外环绕你的[clit]。");
         outputText("[pg]你融化在自己身体如岩浆般滚烫的感觉中，无法控制自己的动作，你意识到你的[hips]在扭动、迎合米兹的口腔攻势，但除了像一艘卷入海啸的船一样随波逐流之外，你什么也做不了。不知何故，快感继续在你体内增长，被地精舌头不断的滑动所激起，喂养着现在占据你身体的极乐野兽。你汗流浃背的身体像附近许多恶魔一样扭动着，渐渐地越来越无力，直到你只能勉强抽搐几下。");
         get_player().orgasm("Vaginal");
         menu();
         addButton(0,"继续",mitziEatsPussyII);
      }
      
      public function letDriderGo() : void
      {
         clearOutput();
         outputText("看着倒下的蛛化精灵，你没有任何想再理会他的欲望。你移开视线，虽然你不认为你的仁慈能让他免受战败带来的残酷命运，因为恶魔大军很快就抓住了他残破的身体并把他拖走了。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1262,1);
         driderDefeatMenu();
      }
      
      public function killDrider() : void
      {
         clearOutput();
         outputText("你对着莉希丝和那个地精大笑起来。[say:这就是我需要的全部奖励。]你把你的");
         if(get_player().lowerBody.type == 5)
         {
            outputText("脚跟");
         }
         else
         {
            outputText("[foot]");
         }
         outputText("踩在那个堕落蛛化精灵的脖子上，直到听见一声令人作呕的“咔嚓”声。之后他便一动不动了。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1262,1);
         driderDefeatMenu();
      }
      
      public function fuckMitzi() : void
      {
         var _g:DriderIncubusScenes;
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1264,1);
         clearOutput();
         outputText("你耸耸肩，趁着有机会开始脱下你的[armor]。恶魔可不是以守信著称的，但她这样做是为了展示力量。如果靠耍花招来打败一个凡人，可能会降低部下对她的评价。如果你学到了什么关于恶魔的道理");
         if(get_silly())
         {
            outputText("和黄文作家的道理");
         }
         outputText("，那就是傲慢。");
         outputText("[pg]米兹看到你的[cocks]弹出来，惊讶地张大了嘴巴。她的主人在一旁看着，眼神凄凉地抚摸着自己的肉棒，即使你马上就要把他的玩物据为己有，他也无法停止手淫。");
         outputText("[pg][say:喜欢吗？]你问地精，转过身把你的[cock biggest]在她鼻子底下晃了晃。");
         if(int(get_player().cocks.length) > 1)
         {
            outputText("[say:或者这个？]你抓起你的");
            if(int(get_player().cocks.length) == 2)
            {
               outputText("第二");
            }
            else
            {
               outputText("最小的");
            }
            outputText("肉棒，冲她摇了摇。");
         }
         outputText("[pg]绿皮女孩浑身发抖。你的雄性气息散发出的浓郁麝香味让她双膝不由自主地打颤");
         if(int(get_player().cocks.length) > 1)
         {
            outputText("");
         }
         outputText("。她咬着下唇，温顺地点了点头。在恶魔魔法的增强下，她的繁衍本能一定已经失控了。现在唯一阻止她扑向你肉棒的，就是她根深蒂固的服从性。她睁大眼睛，眼神中充满恳求，喉咙深处还发出高亢的呜咽声。米兹在双腿间摩擦着，手指瞬间被极其丰富的淫液浸透。[say:...是……求求你……操米兹。]");
         outputText("[pg]你抓起一缕紫色的头发，把这个精神崩溃的地精的脸拉向你的[cock biggest]，把先列腺液抹在她的脸颊上，让她的皮肤闪烁着淫靡的气息。她没有抗拒，也没有抱怨。相反，她变得越来越兴奋。她的脸涨得通红，散发着热量和欲望。她的乳头有橡皮擦那么粗，在你游移的手掌下变得坚硬。她甚至无法阻止自己的小穴疯狂流水。淫水滴落在地板上发出不规则的滴答声，对你来说简直是天籁之音。");
         outputText("[pg]米兹舔了几下涂着紫色唇膏的嘴唇，张大嘴巴，她那亮粉色的器官像飞机跑道一样，为你那渗着先列腺液的性爱引擎铺平了道路。你在野外见过一些淫荡的地精，但没有一个能像这只恶魔宠物一样看起来如此肆无忌惮地像个婊子。她的嘴看起来就是为了吸鸡巴而生的，在淫荡的唇膏下覆盖着丰满的唇弓。她的乳房巨大而匀称，没有一丝下垂。甚至她的小穴也做好了被操的准备，如此丰满柔软，当你操她时，感觉就像在亲吻你的胯部。");
         outputText("[pg]你把肉棒放在她流着口水的舌头上，但当你正欣赏着它在饥渴的地精背光下的样子时，她把它拉了进去，在你还没来得及反应之前，就用她饥渴的嘴紧紧地包裹住了你。米兹的脸颊因为狂热的吸吮而凹陷下去。她的眼睛向上看，与你的目光交汇，同时她开始轻轻地前后摆动，建立起一种温柔的、口交的节奏，很快就让你在她不断扭动的舌头上自由地滴下浓缩的期待。");
         outputText("[pg]如果你不想动，你根本不需要动。你可以让米兹给你的[cock biggest]口交几个小时");
         if(get_player().biggestCockArea() > 100)
         {
            outputText("，她的喉咙被它那邪恶的尺寸撑得鼓鼓的");
         }
         outputText("，完美地抛光你的龟头。你毫不怀疑如果她想的话，她可以让你更快射出来，但这个小性奴把这次口交当成了一次求职面试；她想让你持久。她想让你沉浸在快感中，直到快感变得如此压倒性，以至于即使她不前后摆动头部，你也会喷射出来。");
         outputText("[pg]你没有时间让她把你的肉棒当成口腔健身房，而且当真正的大餐摆在菜单上时，你当然不想只满足于口交。你抓住她的后颈，把这个喘着粗气的生物从你的[cock biggest]上拉开。你的肉棒下三分之一处明显有一个紫色的圆环，那是她那丰满的嘴唇留下的完美印记。");
         outputText("[pg][say:米兹做错什么了吗？]这只地精看起来快要哭了。这女孩一定非常、非常喜欢鸡巴。");
         outputText("[pg][say:没有，]你回答道。[say:我只是现在更想操你。]你引导她趴下，双手双膝着地。一条末端呈铲状的尾巴在她丰满的臀部上方来回甩动。她绝对喝过几瓶魅魔奶。");
         outputText("[pg]听到你的话，米兹那精灵般的耳朵立刻竖了起来，她甚至");
         if(get_player().balls > 0)
         {
            outputText("用尾巴缠住你的[sack]，急切地轻轻拉扯着。");
         }
         else
         {
            outputText("用尾巴缠住你的[leg]，急切地轻轻拉扯着。");
         }
         outputText("她不需要把你拉近——你自己就能搞定。你单手抓住她纤细的腰肢，用空出的手瞄准，将她拉向你的[cock biggest]。");
         outputText("[pg]知道一个女孩的小穴泛滥成灾是一回事；亲身体验这种湿漉漉的现实又是另一回事。她肿胀的花瓣亲吻着你的[cockHead biggest]，在你试图挤进去时慢慢让步。一条条湿润的液体顺着你[cock biggest]的底部流下，你与这个喷涌的性奴接触得越久，液体就越浓稠。她大阴唇那淫靡的柔软感实际上阻碍了你，但在施加了一定力量后，它们在你周围弯曲，让你能将最初的几英寸滑入米兹那丝滑的肉穴中。");
         outputText("[pg]从她的外表来看，介于高级应召女郎和矮小丰满的魅魔之间，你原本以为她的小穴也会同样令人愉悦。但你现在插入的这个湿滑、火热的天堂却超出了任何预期。她感觉就像是为你量身定做的，她的入口就是为了欢迎鸡巴深入其最深处而设计的。即使与其他地精和魅魔相比，米兹的小穴也是出类拔萃的。你插得越深，她丝滑的褶皱就越紧紧地挤压着你，用过度的湿滑感照料着你萌芽的快感。");
         if(get_player().biggestCockArea() > 250)
         {
            outputText("[pg]最棒的是，她似乎根本不在乎你强行塞进她体内的鸡巴有多巨大。她的肚子鼓了起来，印出了你[cock biggest]的形状，而她所做的只是叫得更大声。她那滴落着淫液的小穴肌肉不断地鼓励着你，要求你把整根都埋进去。");
         }
         outputText("[pg]");
         if(get_player().biggestCockArea() <= 250)
         {
            outputText("直捣黄龙");
         }
         else
         {
            outputText("尽可能多地填满她");
         }
         outputText("对小米兹来说太刺激了。她纤细的手臂弯曲，胸部贴在地上。她的头侧靠在地板上，那条极其修长的舌头伸在外面，流着口水。她已经不再说话了，只是随着你的每一个动作发出无意识的咕哝声。她的脑细胞要么太忙于控制小穴里颤动的肌肉，要么忙于传递快感信号，根本无法形成连贯的想法。");
         outputText("[pg]你觉得没必要给她任何警告。你双手抓住她丰满的屁股，把自己往后拉，直到她几乎完全空虚。她嘴里发出一声失望的微弱喵呜声。然后，你猛地插回去，让你青筋暴起的肉棒在湿滑的来回运动中狂欢。你的[cock biggest]在这个活体肉套里快乐地抽动着，每一次抽插都在她最深处留下几团滚烫的先列腺液。");
         outputText("[pg]附近的恶魔要么回去继续他们自己的享乐，要么开始对着你和米兹的表演自慰。基纳里尔已经不见踪影了。在你留下他的地方，只有几张废弃的网和一滩精液。你错过了彻底解决他的机会，但谁在乎呢？莉希丝离这儿不远，而你正在享受一生难忘的性爱。");
         outputText("[pg]看着这只地精的笑脸在恶魔精液的泥潭中来回摩擦，你就几乎要射了。你在快速抽插的间隙拍打着她柔软的屁股，一边感受着高潮如沉睡的野兽般苏醒，一边琢磨着要不要把她留下。");
         if(get_game().camp.companionsCount() > 0)
         {
            outputText("[pg]你的其他追随者");
            if(get_game().camp.companionsCount() > 1)
            {
               outputText("");
            }
            outputText("应该不会介意身边有个经验丰富的地精肉便器吧？你肯定不会介意的。");
         }
         else
         {
            outputText("[pg]你肯定不会介意身边有个经验丰富的地精肉便器。她太听话了，不会惹麻烦的。");
         }
         outputText("[pg]");
         if(get_player().cor <= 33)
         {
            outputText("你甚至可以试着帮她应对过度的性欲，看看她不想被鸡巴塞满时是什么样子。");
         }
         outputText("醒来时有个性感尤物榨干你[cocks]里的每一滴精液也没什么不好。那样你对恶魔的抵抗力会强得多。");
         if(get_player().cumQ() >= 15000)
         {
            outputText("你甚至都没想过，你产生精液的速度太快了，这根本无关紧要。");
         }
         outputText("也许她甚至会给你生几个女儿。你可以培养一支娇小的绿皮大军来重建这片土地。");
         outputText("[pg]一想到米兹怀着你半打的女儿，在早晨骑在你的肉棒上，你就兴奋不已。就算整个长老会都在那里斥责你，你也无法阻止自己射精。");
         if(get_game().ceraphScene.hasExhibition())
         {
            outputText("事实上，这个想法可能只会让你射得更猛。该死的，塞拉芙！");
         }
         outputText("[pg]你又一次胜利地拍在米兹的屁股上，一插到底。");
         if(get_player().balls > 0)
         {
            outputText("你的[balls]颤抖着，将你的[sack]紧绷着贴在身体上，喷吐出乳白色的释然。");
         }
         outputText("你停留在那里，对着你选中的精壶不断抽插。她的脸上洋溢着绝对的幸福。地精一定能感觉到精液溅在子宫颈上，因为你从未见过米兹如此快乐，甚至当她骑在她的蛛化精灵领主的肉棒上时也没有。");
         outputText("[pg]拔出来");
         if(get_player().hasKnot())
         {
            outputText("伴随着结实的肉结拔出时发出湿润的“啵”声");
         }
         outputText("，心满意足的你抓起你的[armor]并考虑接下来的打算。米兹仍然躺在那里");
         if(get_player().cumQ() >= 5000)
         {
            outputText("挺着装满精液的肚子");
         }
         if(get_player().cumQ() >= 1000)
         {
            outputText("，精液从她被灌满的小穴顺着大腿滴落");
         }
         outputText("。她慢慢恢复了意识，但你真的需要一个地精来分散你的注意力吗？你可以告诉她在外面等你，或者忘了她继续前进。");
         get_player().orgasm("Dick");
         menu();
         addButton(0,"招募米兹",recruitMitzi);
         _g = this;
         addButton(1,"继续",function():void
         {
            _g.driderDefeatMenu();
         });
      }
      
      public function encounterDriderIncbutt() : void
      {
         clearOutput();
         outputText("门在最轻微的触碰下自由摆动，让你轻松推开这扇精心制作的门。景色令人惊叹。一个足够容纳你整个村庄的开放式房间向远处延伸，里面充满了各种形状和种族的欢腾、闪闪发光的奴隶，他们被锁定在无休止的、淫荡的欢乐展示中。莉希丝的王座高耸于一切之上，位于房间的后端——这个位面堕落的顶峰。腐败的女王还没有注意到你，但一个八条腿的蜘蛛人注意到了，他带着残忍的快感从一个被俘虏的蜂女身边转过身来。");
         outputText("[pg][say:哇，勇者。你真的认为你可以毫无阻碍地走进莉希丝的王座室吗？]他咬着牙，几乎在叽叽喳喳。[say:我要打败你。我要绑住你。我要把你扔在她脚下，沐浴在看着她把你变成一头没有头脑的、发情的野兽的荣耀中。]他滑行得更近了，抛弃了他的俘虏，举起了长矛，眼中闪烁着恶意。");
         outputText("[pg]火光在他煤黑色的皮肤上闪烁，露出了另一个俘虏——这个俘虏被绑在他的人形半身的中间。从外表上看，她是一个典型的地精，目前被刺穿在一根扭曲的恶魔肉棒上，这根肉棒从蛛化精灵的甲壳变成皮肤的地方长出来。他似乎对她毫不在意，继续前进。[say:为什么不投降，让你的嫩肉免受我的长矛之苦呢？]");
         outputText("[pg]怎么可能。看来你得打败他了。");
         startCombat(new DriderIncubus());
      }
      
      public function driderDefeatMenu(param1:Boolean = false) : void
      {
         var _loc2_:Boolean = false;
         var _loc3_:Boolean = false;
         menu();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1262) != 1 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1265) != 1)
         {
            addButton(0,"杀蛛化精灵",killDrider);
            if(int(get_player().vaginas.length) > 0)
            {
               addButton(1,"骑蛛化精灵",rideDrider);
            }
            else
            {
               addButtonDisabled(1,"骑蛛化精灵","此场景需要你有阴道。");
            }
            if(int(get_player().cocks.length) > 0)
            {
               addButton(2,"肛蛛化精灵",buttfuckDrider);
            }
            else
            {
               addButtonDisabled(2,"肛蛛化精灵","此场景需要你有阴茎。");
            }
            addButton(3,"放走",letDriderGo);
         }
         else
         {
            _loc2_ = true;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1263) != 1)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1264) != 1)
            {
               if(int(get_player().cocks.length) > 0)
               {
                  addButton(5,"操地精",fuckMitzi);
                  addButton(6,"乳交地精",titfuckMitzi);
               }
               else
               {
                  addButtonDisabled(5,"操地精","此场景需要你有阴茎。");
                  addButtonDisabled(6,"乳交地精","此场景需要你有阴茎。");
               }
               if(int(get_player().vaginas.length) > 0)
               {
                  addButton(7,"地精舔穴",mitziEatsPussy);
               }
               else
               {
                  addButtonDisabled(7,"地精舔穴","此场景需要你有阴道。");
               }
            }
            addButton(8,"招募地精",recruitMitzi);
            if(_loc2_)
            {
               addButton(9,"离开地精",afterDriderbuttFight);
            }
         }
         else
         {
            _loc3_ = true;
         }
         if(_loc2_ && _loc3_)
         {
            afterDriderbuttFight();
         }
      }
      
      public function buttfuckDrider() : void
      {
         clearOutput();
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1265,1);
         outputText("你打量着战败的蛛化精灵，盘算着要从他身上索取什么[say: 奖励]。你的目光扫过他半人半蛛的身躯，那是人类与漆黑恶魔腐化的扭曲结合。你的手抚过他卷曲、边缘如刀刃般锋利的角，让这个战败的蜘蛛人退缩了……不是因为恐惧，而是因为别的什么。也许是期待？");
         if(get_monster().get_goblinFree())
         {
            outputText("你能看到他双腿间那根肿胀的肉棒随着你的触摸而跳动，将一股浓稠粘腻的腐化精液喷洒在光洁的大理石地板上。");
         }
         else
         {
            outputText("挂在他昆虫般腹部下方的地精发出一声尖叫，因为那根深深埋入她肉缝的肉棒抽搐着，将一股腐化的先列腺液射入了她的子宫。");
         }
         if(get_player().cor > 75)
         {
            outputText("多么壮丽的生物。你很期待看看基纳里尔能做些什么。");
         }
         outputText("[pg]你走到恶魔蛛化精灵的背后，观察着他众多吐丝器抽搐、流涎的模样。那些奇怪的昆虫孔洞抽搐着，从他肿胀的后部流出湿润的丝线，在你[feet]下的地板上形成粘稠的细流。绕到他身后，你打量着他昆虫半身光滑的黑色甲壳，以及从背部延伸到人类半身的曲线。蛛化精灵回头瞥了你一眼，皱起眉头。");
         outputText("[pg][say: 快点，]他咆哮着，目光在你和坐在王座上的莉希丝之间游移。[say: 既然女主人这么希望的话。]");
         outputText("[pg]你顺着他的目光看向王座，看向坐在那里的恶魔女王。[say: 你想看看我是什么样的情人吗？]你越过她恶魔宫廷嘈杂的声音，向她大喊。随着莉希丝手腕轻挥，那些声音平息成了低语。");
         if(get_player().cor > 75)
         {
            outputText("[say: 看好了——这也是</i>你<i>将要面临的，婊子！]");
         }
         else
         {
            outputText("[say: 好好欣赏这场表演吧——下一个就是你！]");
         }
         outputText("你大喊着，");
         if(get_player().isTaur())
         {
            outputText("猛地扑到蛛化精灵的背上，你野兽般的下半身带着你骑上他，就像骑着你的母狗一样。当你巨大的重量压在他身上时，他发出一声惊呼，蜘蛛腿都弯曲了。你的[hips]猛烈地撞击着他，让你的[cock]昂首挺立，猛击他的下盘，寻找可以操弄的洞口。");
         }
         else
         {
            outputText("爬上蛛化精灵的背，猛地扑到他身上，抓住他的人形身体。当你把他的上半身向前推，把他的脸按在墙上，并抓起他上半身的一把屁股肉时，他发出了一声惊呼。你掰开他的臀瓣，脱下你的[armor]，将你的[cock]对准他。");
         }
         outputText("随着臀部的移动，你将[cock]抵在恶魔蛛化精灵的洞口，然后挺身而入。");
         outputText("[pg][say: 就这样，一个处子之洞被破了，]莉希丝大笑着，声音在冰冷的石墙间回荡。在你插入的那一刻，所有恶魔的声音都安静了下来，被你的后庭突击所吸引。唯一的声响是莉希丝的笑声，以及你身体撞击基纳里尔身体的声音。你对着恶魔女王冷笑，抓住蛛化精灵的恶魔之角向后猛拉，让这生物的背部紧贴着你，同时你挺进他紧致火热的洞穴。");
         outputText("[pg]而且它<i>很紧</i>。没有别的词可以形容了。");
         if(get_player().biggestCockArea() >= 1200)
         {
            outputText("你觉得照这样下去，你那巨大的肉棒会把他撕裂的！蛛化精灵的嘴扭曲成一个无声的震惊圆环，当你埋入他体内时，他无法发出声音来表达他的反应。");
         }
         else if(get_player().biggestCockArea() >= 500)
         {
            outputText("你那野兽般比例的肉棒将那处子通道撑到了极限，让蛛化精灵在惊讶和意想不到的快感中咆哮起来。");
         }
         else
         {
            outputText("你的肉棒深深陷入蛛化精灵的屁股，滑入他那处子之洞。");
         }
         outputText("当你插入时，它出奇地湿润，天然润滑——当然，恶魔就是这样。经历了这么多之后，你很难再对这些事情感到惊讶了。你");
         if(get_player().isDrider())
         {
            outputText("从你骑在他身上的野兽姿势向下伸出手，然后");
         }
         outputText("拍打着蛛化精灵的屁股，将手指陷入他炭黑色的肌肤中。当你的阴茎完全没入蛛化精灵的后庭时，恶魔观众中爆发出一阵欢呼，肉体拍打的湿润声在腐化的王座室中回荡，令人作呕。");
         outputText("[pg][say: 多么充满活力！]一个恶魔哀嚎着，抓住了她那跳动着的勃起物。");
         outputText("[pg][say: 多么</i>野蛮<i>！]另一个恶魔喊道，你听到一声惊呼，聚集的恶魔们的意志力在你性爱狂欢的光芒下崩溃了。看台上的肉体起伏着，模仿着你对蛛化精灵后庭的野蛮侵犯。");
         outputText("[pg]你的双手在他的人形半身上游走，抓住乳头，拍打紧绷的肌肉。但你的手总是忍不住回到蛛化精灵的角上。它们是完美的把手，让你能在他长满甲壳的背上稳住自己。每一次抽插都让他摇摇晃晃地向前倾，紧紧贴在花岗岩墙壁上，徒劳地抓着石壁。由于找不到支撑点，他只能软绵绵地靠在墙上，被墙壁和你抽插的重量夹在中间。");
         if(get_monster().get_goblinFree())
         {
            outputText("[pg]那个原本紧紧贴在蛛化精灵阴茎上的地精奴隶被晾在一边，似乎有些不知所措，她唯一的使命被你突如其来的自由恩赐给剥夺了。她在你、她前任主人和看台上扭动的肉体之间看来看去，然后她那绿色的小手指就消失在了她的大腿之间。");
            outputText("[pg]伴随着一声闷哼，基纳里尔挣脱了你的掌控，时间刚好够他抓住那个地精荡妇染色的头发，把她推回她该待的地方。他蜘蛛般的腿抓住了她，把她移到了他身下勃起的阴茎上。");
            outputText("[pg]当地精沉闷的哭喊声变成欢愉的呻吟和满足的微弱喵喵声时，你开始觉得那可能正是她想待的地方……");
         }
         else
         {
            outputText("[pg]紧紧骑在基纳里尔阴茎上的地精发出一声尖锐、愉悦的叫声，因为她主人的阴茎正随着你肛交的节奏跳动。他的肉棒在她体内膨胀，明显撑起了这个小绿皮的肚子，直到完全勃起……然后释放。你听到地精被精液灌满时发出的湿润的吧唧声，因为你那蜘蛛般的受害者在你的[cock]锤击他那过大的、被恶魔污染的前列腺的感觉下，被诱导达到了高潮。");
         }
         outputText("[pg]你暂时让蛛化精灵享受他的乐趣——毕竟，当他在地精身上发泄时，他紧致的小穴会收缩得更紧，狠狠地挤压你的[cock]。作为回应，你加快了臀部的抽插速度");
         if(get_player().isTaur())
         {
            outputText("，这还有一个额外的好处，那就是把力量从你野兽般的后背传递到他的后背，再传递到骑在基纳里尔阴茎上的地精身上。");
         }
         outputText("那个绿色的荡妇在狂喜中发出无意识的尖叫。她的声音传遍了王座室，用狂喜的尖叫声淹没了恶魔宫廷的呻吟和呼喊。");
         outputText("[pg]几秒钟后，你跟随着那个性欲过剩的地精进入了高潮的阵痛，在狂野的尖叫声中加入了一声愉悦的咆哮。你转向莉希丝，她平静地坐在王座上，当你将自己深深地插入基纳里尔的后庭，并将你的精液释放到蛛化精灵的屁股里时，你与这位恶魔女王四目相对。");
         if(get_player().cumQ() <= 1000)
         {
            outputText("你将你的精液深深地射入蛛化精灵的后庭，用黏稠的白色精液填满了他那处女般的小穴。");
         }
         else if(get_player().cumQ() <= 5000)
         {
            outputText("你将浓稠、乳白色的精液泵入这只恶魔蜘蛛的后庭，用滚烫的精液填满了他那处女般的小穴，直到精液顺着你那锤击的肉棒流出来。");
         }
         else
         {
            outputText("你用汹涌的精液淹没了蛛化精灵的后庭，用你的精液撑起了恶魔的肚子。精液顺着你抽插的肉棒从他的屁股里喷涌而出，随着每一次动作倾泻而下。");
         }
         outputText("[pg]伴随着微弱的呻吟，被精液撑胀的恶魔向前瘫倒。你从他体内抽出，伴随着一声湿润的<i>啵</i>声在宫廷中回荡，让恶魔大军安静了下来。你与莉希丝进行眼神交流，在收集你的[armor]时注视着她。在你身后，蛛化精灵无助地呻吟着，精液从他被狠狠操过的屁股里流出。");
         if(get_player().cor >= 75)
         {
            outputText("你迫不及待地想看看恶魔女王被你的肉棒刺穿时的感觉！");
         }
         if(int([DynStat.Cor(20)].length) == 0)
         {
            get_game().player.dynStats();
         }
         else if(int([DynStat.Cor(20)].length) == 1)
         {
            get_game().player.dynStats([DynStat.Cor(20)][0]);
         }
         else if(int([DynStat.Cor(20)].length) == 2)
         {
            get_game().player.dynStats([DynStat.Cor(20)][0],[DynStat.Cor(20)][1]);
         }
         else if(int([DynStat.Cor(20)].length) == 3)
         {
            get_game().player.dynStats([DynStat.Cor(20)][0],[DynStat.Cor(20)][1],[DynStat.Cor(20)][2]);
         }
         else if(int([DynStat.Cor(20)].length) == 4)
         {
            get_game().player.dynStats([DynStat.Cor(20)][0],[DynStat.Cor(20)][1],[DynStat.Cor(20)][2],[DynStat.Cor(20)][3]);
         }
         else if(int([DynStat.Cor(20)].length) == 5)
         {
            get_game().player.dynStats([DynStat.Cor(20)][0],[DynStat.Cor(20)][1],[DynStat.Cor(20)][2],[DynStat.Cor(20)][3],[DynStat.Cor(20)][4]);
         }
         else if(int([DynStat.Cor(20)].length) == 6)
         {
            get_game().player.dynStats([DynStat.Cor(20)][0],[DynStat.Cor(20)][1],[DynStat.Cor(20)][2],[DynStat.Cor(20)][3],[DynStat.Cor(20)][4],[DynStat.Cor(20)][5]);
         }
         else if(int([DynStat.Cor(20)].length) == 7)
         {
            get_game().player.dynStats([DynStat.Cor(20)][0],[DynStat.Cor(20)][1],[DynStat.Cor(20)][2],[DynStat.Cor(20)][3],[DynStat.Cor(20)][4],[DynStat.Cor(20)][5],[DynStat.Cor(20)][6]);
         }
         else if(int([DynStat.Cor(20)].length) == 8)
         {
            get_game().player.dynStats([DynStat.Cor(20)][0],[DynStat.Cor(20)][1],[DynStat.Cor(20)][2],[DynStat.Cor(20)][3],[DynStat.Cor(20)][4],[DynStat.Cor(20)][5],[DynStat.Cor(20)][6],[DynStat.Cor(20)][7]);
         }
         else if(int([DynStat.Cor(20)].length) == 9)
         {
            get_game().player.dynStats([DynStat.Cor(20)][0],[DynStat.Cor(20)][1],[DynStat.Cor(20)][2],[DynStat.Cor(20)][3],[DynStat.Cor(20)][4],[DynStat.Cor(20)][5],[DynStat.Cor(20)][6],[DynStat.Cor(20)][7],[DynStat.Cor(20)][8]);
         }
         else if(int([DynStat.Cor(20)].length) == 10)
         {
            get_game().player.dynStats([DynStat.Cor(20)][0],[DynStat.Cor(20)][1],[DynStat.Cor(20)][2],[DynStat.Cor(20)][3],[DynStat.Cor(20)][4],[DynStat.Cor(20)][5],[DynStat.Cor(20)][6],[DynStat.Cor(20)][7],[DynStat.Cor(20)][8],[DynStat.Cor(20)][9]);
         }
         else if(int([DynStat.Cor(20)].length) == 11)
         {
            get_game().player.dynStats([DynStat.Cor(20)][0],[DynStat.Cor(20)][1],[DynStat.Cor(20)][2],[DynStat.Cor(20)][3],[DynStat.Cor(20)][4],[DynStat.Cor(20)][5],[DynStat.Cor(20)][6],[DynStat.Cor(20)][7],[DynStat.Cor(20)][8],[DynStat.Cor(20)][9],[DynStat.Cor(20)][10]);
         }
         else if(int([DynStat.Cor(20)].length) == 12)
         {
            get_game().player.dynStats([DynStat.Cor(20)][0],[DynStat.Cor(20)][1],[DynStat.Cor(20)][2],[DynStat.Cor(20)][3],[DynStat.Cor(20)][4],[DynStat.Cor(20)][5],[DynStat.Cor(20)][6],[DynStat.Cor(20)][7],[DynStat.Cor(20)][8],[DynStat.Cor(20)][9],[DynStat.Cor(20)][10],[DynStat.Cor(20)][11]);
         }
         else if(int([DynStat.Cor(20)].length) == 13)
         {
            get_game().player.dynStats([DynStat.Cor(20)][0],[DynStat.Cor(20)][1],[DynStat.Cor(20)][2],[DynStat.Cor(20)][3],[DynStat.Cor(20)][4],[DynStat.Cor(20)][5],[DynStat.Cor(20)][6],[DynStat.Cor(20)][7],[DynStat.Cor(20)][8],[DynStat.Cor(20)][9],[DynStat.Cor(20)][10],[DynStat.Cor(20)][11],[DynStat.Cor(20)][12]);
         }
         else if(int([DynStat.Cor(20)].length) == 14)
         {
            get_game().player.dynStats([DynStat.Cor(20)][0],[DynStat.Cor(20)][1],[DynStat.Cor(20)][2],[DynStat.Cor(20)][3],[DynStat.Cor(20)][4],[DynStat.Cor(20)][5],[DynStat.Cor(20)][6],[DynStat.Cor(20)][7],[DynStat.Cor(20)][8],[DynStat.Cor(20)][9],[DynStat.Cor(20)][10],[DynStat.Cor(20)][11],[DynStat.Cor(20)][12],[DynStat.Cor(20)][13]);
         }
         else if(int([DynStat.Cor(20)].length) == 15)
         {
            get_game().player.dynStats([DynStat.Cor(20)][0],[DynStat.Cor(20)][1],[DynStat.Cor(20)][2],[DynStat.Cor(20)][3],[DynStat.Cor(20)][4],[DynStat.Cor(20)][5],[DynStat.Cor(20)][6],[DynStat.Cor(20)][7],[DynStat.Cor(20)][8],[DynStat.Cor(20)][9],[DynStat.Cor(20)][10],[DynStat.Cor(20)][11],[DynStat.Cor(20)][12],[DynStat.Cor(20)][13],[DynStat.Cor(20)][14]);
         }
         else if(int([DynStat.Cor(20)].length) == 16)
         {
            get_game().player.dynStats([DynStat.Cor(20)][0],[DynStat.Cor(20)][1],[DynStat.Cor(20)][2],[DynStat.Cor(20)][3],[DynStat.Cor(20)][4],[DynStat.Cor(20)][5],[DynStat.Cor(20)][6],[DynStat.Cor(20)][7],[DynStat.Cor(20)][8],[DynStat.Cor(20)][9],[DynStat.Cor(20)][10],[DynStat.Cor(20)][11],[DynStat.Cor(20)][12],[DynStat.Cor(20)][13],[DynStat.Cor(20)][14],[DynStat.Cor(20)][15]);
         }
         else if(int([DynStat.Cor(20)].length) == 17)
         {
            get_game().player.dynStats([DynStat.Cor(20)][0],[DynStat.Cor(20)][1],[DynStat.Cor(20)][2],[DynStat.Cor(20)][3],[DynStat.Cor(20)][4],[DynStat.Cor(20)][5],[DynStat.Cor(20)][6],[DynStat.Cor(20)][7],[DynStat.Cor(20)][8],[DynStat.Cor(20)][9],[DynStat.Cor(20)][10],[DynStat.Cor(20)][11],[DynStat.Cor(20)][12],[DynStat.Cor(20)][13],[DynStat.Cor(20)][14],[DynStat.Cor(20)][15],[DynStat.Cor(20)][16]);
         }
         else if(int([DynStat.Cor(20)].length) == 18)
         {
            get_game().player.dynStats([DynStat.Cor(20)][0],[DynStat.Cor(20)][1],[DynStat.Cor(20)][2],[DynStat.Cor(20)][3],[DynStat.Cor(20)][4],[DynStat.Cor(20)][5],[DynStat.Cor(20)][6],[DynStat.Cor(20)][7],[DynStat.Cor(20)][8],[DynStat.Cor(20)][9],[DynStat.Cor(20)][10],[DynStat.Cor(20)][11],[DynStat.Cor(20)][12],[DynStat.Cor(20)][13],[DynStat.Cor(20)][14],[DynStat.Cor(20)][15],[DynStat.Cor(20)][16],[DynStat.Cor(20)][17]);
         }
         else if(int([DynStat.Cor(20)].length) == 19)
         {
            get_game().player.dynStats([DynStat.Cor(20)][0],[DynStat.Cor(20)][1],[DynStat.Cor(20)][2],[DynStat.Cor(20)][3],[DynStat.Cor(20)][4],[DynStat.Cor(20)][5],[DynStat.Cor(20)][6],[DynStat.Cor(20)][7],[DynStat.Cor(20)][8],[DynStat.Cor(20)][9],[DynStat.Cor(20)][10],[DynStat.Cor(20)][11],[DynStat.Cor(20)][12],[DynStat.Cor(20)][13],[DynStat.Cor(20)][14],[DynStat.Cor(20)][15],[DynStat.Cor(20)][16],[DynStat.Cor(20)][17],[DynStat.Cor(20)][18]);
         }
         else
         {
            if(int([DynStat.Cor(20)].length) != 20)
            {
               throw "Too many rest arguments";
            }
            get_game().player.dynStats([DynStat.Cor(20)][0],[DynStat.Cor(20)][1],[DynStat.Cor(20)][2],[DynStat.Cor(20)][3],[DynStat.Cor(20)][4],[DynStat.Cor(20)][5],[DynStat.Cor(20)][6],[DynStat.Cor(20)][7],[DynStat.Cor(20)][8],[DynStat.Cor(20)][9],[DynStat.Cor(20)][10],[DynStat.Cor(20)][11],[DynStat.Cor(20)][12],[DynStat.Cor(20)][13],[DynStat.Cor(20)][14],[DynStat.Cor(20)][15],[DynStat.Cor(20)][16],[DynStat.Cor(20)][17],[DynStat.Cor(20)][18],[DynStat.Cor(20)][19]);
         }
         get_player().orgasm("Dick");
         get_player().knockUp(1,432);
         driderDefeatMenu();
      }
      
      public function beatTheSpooderbutt(param1:Boolean) : void
      {
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1261,1);
         clearOutput();
         var _loc2_:DriderIncubus = get_monster();
         if(param1)
         {
            outputText("[say: 不！] 堕落的蛛化精灵在倒在地上之前喊道，他被打得太惨了，再也站不起来了。[say: 这不可能！凡人不可能对抗莉希丝并获胜！]");
         }
         else
         {
            outputText("[say: 不！] 堕落的蛛化精灵在倒在地上之前喊道，疯狂地扭动着。他太兴奋了，无法进行任何适当的协调");
            if(!_loc2_.get_goblinFree())
            {
               outputText("，但他还是把地精从他的鸡巴上推开了");
            }
            else
            {
               outputText("，但他还是抓住了他的鸡巴");
            }
            outputText("，疯狂地自慰。[say: 凡-凡-凡人怎么可能对抗莉希丝并获胜？怎-怎-怎么可能！？]");
         }
         outputText("[pg]一个介于雪崩和岩石滑落之间的沉闷声音回答道，笑着说，[say: 不是莉希丝，但肯定是你。你从来就不属于这里，基纳里尔。]");
         outputText("[pg]另一个声音，这个声音很高亢，同意道，[say: 说得好。]");
         outputText("[pg]在聚集的恶魔和他们的玩物上空，沉默笼罩了片刻。女性的声音——莉希丝的——补充道，[say: 去吧，[if (ischild) {年轻的}]勇者。如果你愿意，就去领取你的奖励吧。我很乐意看看你是个什么样的情人。]");
         outputText("[pg]");
         if(!_loc2_.get_goblinFree())
         {
            outputText("地精慢慢地从她倒下的主人身上分开。");
         }
         else
         {
            outputText("地精跪了下来。");
         }
         outputText("她的眼睛饱满而明亮。她十指交叉，乞求道，[say: 请不要杀米兹，勇者！她可以是你的。] 她双手双膝着地，向你爬来。一只娇小的手拉扯着你的[armor]。[say: 米兹会成为一个好奴隶的。]");
         outputText("[pg]米兹");
         if(int(get_player().cocks.length) > 0)
         {
            outputText("扭动着她的");
            if(_loc2_.get_goblinOiled())
            {
               outputText("涂满油的");
            }
            outputText("屁股对着你");
         }
         else
         {
            outputText("从她丰满的嘴唇间伸出一条三英尺长的舌头");
         }
         outputText("，眨了眨眼。[say:做米兹的[master]，米兹就会帮你！]");
         outputText("[pg]看来恶魔们打算让你发泄一下可能积攒的欲望。你面前就有一个心甘情愿的地精，不过基纳里尔或许也能派上用场……");
         driderDefeatMenu();
      }
      
      public function afterDriderbuttFight() : void
      {
         get_combat().cleanupAfterCombat(get_game().dungeons.resumeFromFight);
      }
      
      public function actuallyRideDriderDick() : void
      {
         clearOutput();
         outputText("[say: 没门，]你在蛛化恶魔耳边嘶声说道。");
         if(get_player().cor <= 33)
         {
            outputText("[say: 你活该受比这点羞辱更糟的罪，但我现在欲火焚身，只能这样了。]");
         }
         else
         {
            outputText("[say: 我会把你的鸡巴伺候得比那个地精婊子好得多。你要在你所有的同伙面前，像个婊子一样向可悲的[i: 凡人]求饶。他们再也不会尊重你了。]");
         }
         outputText("[pg]基纳里尔抬起头，脸上混合着恐惧和兴奋，突然意识到自己在恶魔阶层中的地位有多么岌岌可危。当你用他自己的丝线缠住他的手腕时，他浑身发抖，他的鸡巴流出了兴奋的液体。你把一些液体涂抹在他的鸡巴上，让他喘息着在地上抽搐，在被迫的狂喜中扭动，而他的同伴们则嘲笑、讥讽，并对着他的屈辱自慰。");
         outputText("[pg]再多的嘲弄似乎都无法减弱他抵在你掌心的阴茎的硬度。如果有的话，那也是起了反作用。在一个长着四个乳房的修女（或者说曾经是修女的怪物）发出特别下流的侮辱后，你能感觉到他的心跳让他的鸡巴变得更大更硬。他带着无法言喻的喜悦跳动着，眼睛半翻着白眼。高亢的呜咽声从他突然发声的喉咙里滑落。你紧紧握住他颤抖的勃起，给了它几下奖励性的套弄，以奖励他释放出内心的荡妇。");
         outputText("[pg][say: 真是我的好蜘蛛，]你在他耳边轻声说道，[say: 不反抗的感觉很好，不是吗——屈服吧？]当他呜咽着表示肯定时，你亲吻了他的脸颊。[say: 我会把你操得爽翻天，但你得让我知道你有多喜欢，好吗？]");
         outputText("[pg]基纳里尔颤抖着，呻吟声更大了。好孩子。");
         outputText("[pg]你从根部到顶端抚摸着他的下侧，然后松开手，调皮地看着那根短暂连接着他肿胀肉棒和你扭动手指的粘稠汁液。当它断开时，你调皮地舔干净自己，用力吸吮得脸颊都凹陷了下去。由于失去了接触，他的叫声变得哀怨而呜咽，但你将你的[vagina]外部贴在他身上，让他安静了下来。他绝不可能忽视你那湿滑的、");
         if(get_player().wetness() >= 3)
         {
            outputText("湿透的");
         }
         else
         {
            outputText("兴奋的");
         }
         outputText("嘴唇在他身上展开的感觉，你的花瓣张开，露出你内部花朵的娇嫩光滑。");
         if(get_player().getClitLength() > 3)
         {
            outputText("[pg]最棒的是你的[clit]紧紧贴在他鸡巴的上半部分，以最美味的方式摩擦着那根粗壮、青筋暴起的肉棒。当你把它在这个饥渴的恶魔身上摩擦时，你几乎无法忍受从你那超大号的阴蒂传来的如雪崩般的快感，但这不正是你想要的吗？爽到极点，让莉希丝再也没有什么可以诱惑你的了？");
            outputText("[pg]你的通道里对某种插入的渴望越来越强烈，这让你从令人惊讶的异性恋摩擦中清醒过来。你想要他进入你体内。当你一次又一次地骑在他身上时，他总是可以用他的一只手来对付你那鸡巴大小的阴蒂，用一点腐化来换取那种");
            if(get_player().get_pregnancyType() != 0)
            {
               outputText("小穴");
            }
            else
            {
               outputText("子宫");
            }
            outputText("被填满的满足感，这种感觉只有在真正的性爱中才能体会到。");
         }
         else if(int(get_player().cocks.length) > 0)
         {
            outputText("[pg]最棒的是你的[cocks]");
            if(int(get_player().cocks.length) == 1)
            {
               outputText("被");
            }
            else
            {
               outputText("被");
            }
            outputText("紧紧地压在他的肉棒上，粗壮青筋暴起的肉棒与他坚挺的长度摩擦，带来一种罪恶而美妙的快感。你几乎无法控制自己不去摩擦他的肉棒直到高潮，但这不正是你想要的吗？利用这个恶魔，直到你最原始的欲望得到完全的满足？");
            outputText("[pg]你的通道里对某种插入的渴望越来越强烈，让你从摩擦");
            if(int(get_player().cocks.length) == 1)
            {
               outputText("你的");
            }
            else
            {
               outputText("一根");
            }
            outputText("肉棒的动作中惊醒。你想要他进入你。当你一次又一次地骑乘他时，他总是可以用一只手来应付[oneCock]，用一点堕落来换取那种");
            if(get_player().get_pregnancyType() != 0)
            {
               outputText("小穴");
            }
            else
            {
               outputText("子宫");
            }
            outputText("被填满的满足感，这种感觉只有在真正的性爱中才能体会到。");
         }
         outputText("[pg]抬起你的[hips]，你将你的[vagina]一点点靠近男魅魔蛛化精灵那恶魔般的长度。你发誓你能闻到它散发出一阵阵堕落的气息，那是一种浓郁的麝香，让你感到头晕目眩，渴望它进入你的身体。它又大又粗，却又如此的邪恶。当你还在试图消化这一切时，龟头已经刺穿了你的阴唇，你的身体处于自动驾驶状态，只关心填补那压倒性的需求。");
         outputText("[pg]他滑入得如此轻松。");
         if(get_player().hasVirginVagina())
         {
            outputText("你的童贞似乎成了事后才想起来的事，在你意识到之前就被夺走了。甚至都不疼。你以前为什么不做爱呢？一个全新的做爱世界现在向你敞开，你的[vagina]大声而有害地宣称它想一次又一次地感受这种感觉。也许你可以打倒牛头人，在去找莉希丝之前也骑乘他。");
         }
         else
         {
            outputText("你几乎后悔一直和他战斗。这样一根美妙的肉棒值得被骑乘，被包裹在一对湿润而顺从的褶皱中，直到它能一次又一次地将它那强大、堕落的精液射入你最深处的凹陷中。一个女孩可能会爱上这种感觉。");
         }
         outputText("[pg]你抓住他的肩膀，猛烈地向下压，伴随着一声湿润的声响，你流畅地将他完全吞没。你和你的堕落男孩玩具一起呻吟，突然感到无比庆幸，你没有让他把你推给那个地精。你差点就错过了这一生难忘的交配。你的神经因为愉悦而欢唱，你几乎不记得要好好羞辱基纳里尔了。你弹动你的[hips]，在他的光滑、肌肉发达的脖子上摩擦，听着他愉悦的叫喊。你的[vagina]紧紧地挤压着他，让他的声音高了一个八度，像弹奏乐器一样玩弄他，尽管你发现自己越来越迷恋这个乐器。");
         outputText("[pg]你变态观众的嘲笑声现在对你来说几乎没有感觉，但你的伴侣显然仍然很清楚，从他的眼睛在女恶魔、性奴和男魅魔之间扫视的方式就可以看出来。毫无疑问，他将成为那个被勇者羞辱的人，而他的身体他妈的爱死这种感觉了。你抓住他的头发，让他看着你的眼睛，放慢你操他的速度，让你能够说出一句完整的话。");
         outputText("[pg][say: 别反抗了。你已经不再是男魅魔了，只是个会为了让任何人、所有人使用而卖弄自己鸡巴的荡妇，对吧？]你上下起伏，为了强调而紧紧夹住。[say: 甚至是一个凡人……或者一个地精。]你指了指米兹，她现在正试图钻到你下面去舔他的蛋蛋。你由着她去。[say: 放松点。为你的观众呻吟，让自己享受这一切。]你的爱液在身下汇聚成厚厚的一滩。你越来越难保持理智了。[say: 做我的荡妇吧。]");
         outputText("[pg]这就对了。他那昆虫般的腿随着紧张感的消失而大大张开，恶魔本人也仰起头，呻吟着，[say: 是的……]声音大得足以盖过喧闹声。周围传来阵阵欢笑，但你那堕落的玩具这次却沉浸其中，扭动着身体，露出了他蜘蛛部分下方那根巨大的蛛化精灵肉棒。地精米兹立刻扑了上去，放弃了吃你的残羹冷炙，转而享受真正的美味。蛛化精灵的身体因为两端同时被操而颤抖着，他的肉棒在你体内疯狂地抽插，猛烈地撞击着你的G点，仿佛它完全知道该按哪里才能让你高潮。");
         outputText("[pg]半秒钟后，黄油般滑腻的滚烫液体猛烈地撞击着你敏感的肉缝壁，这个荡妇蛛化精灵爆发了，喷射着，呻吟着，猛烈地扭动着");
         if(get_player().getClitLength() > 3 || int(get_player().cocks.length) > 0)
         {
            outputText("他的一个");
         }
         outputText("乳头");
         if(get_player().getClitLength() > 3 || int(get_player().cocks.length) > 0)
         {
            outputText("同时还在试图");
            if(get_player().getClitLength() > 3)
            {
               outputText("揉搓你的[clit]");
            }
            else
            {
               outputText("给你打飞机");
            }
         }
         outputText("。他用他那被污染的精液淹没了你，塞满了你的通道，直到每一个角落都充满了恶魔的精液，沐浴在他那生殖的堕落之中。");
         outputText("[pg]你和他一起高潮了，被这种如此恰当而有力地填满的感觉毫不掩饰地触发了，不仅是被一根美妙的、抚慰着小穴的肉棒，还有他似乎无休止地注入你体内的那罪恶般滑腻的爱液。你闭上眼睛，放任你的[hips]尽情地狂野扭动，即使剧烈的痉挛迫使如注的乳白色黏液从你颤动的阴唇间喷涌而出。这是一种");
         if(get_player().hasVirginVagina() || get_player().cor <= 33 && !get_game().ceraphScene.hasExhibition())
         {
            outputText("出乎意料的");
         }
         outputText("美妙感觉，能在这样的观众面前高潮。");
         outputText("[pg]你驾驭着狂喜的浪潮，就像你驾驭着给你带来这些浪潮的那根粗糙的、取悦小穴的肉棒一样。你现在这个汗流浃背、在性高潮中扭动的荡妇，可能离那个很久以前进入玛瑞斯的");
         if(!get_player().hasPerk(PerkLib.HistorySlut) && !get_player().hasPerk(PerkLib.HistoryWhore))
         {
            outputText("纯洁的");
         }
         else
         {
            outputText("坚定的");
         }
         outputText("勇者相去甚远，但这感觉太好了，根本停不下来，就像你的小穴着火了，唯一能扑灭它的方法就是用更多的蛛化精灵黏液来浇灌它。");
         outputText("[pg]直到你新晋的荡妇平静下来，你才跟着平静下来。他的鸡巴肯定终于干涸了，尽管在此之前他的另一根鸡巴已经成功地让米兹的肚子明显胀大。这个地精看起来和你感觉一样茫然，兴奋地揉着她的肚子，同时半心半意地试图够到她主人的鸡巴，想再亲吻几下。");
         if(get_player().cor <= 33)
         {
            outputText("[pg]你摇摇晃晃地站起来，感觉有点脏。恶魔的精液顺着你的大腿流下，形成粗粗的水流，但至少你不再发情了。你应该准备好迎接接下来发生的一切，只要你能控制住自己不去打量房间里所有其他坚挺的鸡巴。它们似乎在召唤你……");
         }
         else if(get_player().cor <= 75)
         {
            outputText("[pg]你摇摇晃晃地站起来，感觉前所未有的好。当然，有恶魔的精液顺着你的大腿流下，而且你被莉希丝的副官们包围着，但至少你得到了奇妙的、完全的满足。你所要做的就是保持镇定，直到你击败恶魔女王，然后你就可以拥有所有你想要的鸡巴。这就是你来这里的目的，对吧？你越来越难以记清了。");
         }
         else
         {
            outputText("[pg]在站起来之前，你确保给了蛛化精灵一个深深的法式热吻。他的表现超出了职责范围，把你的[vagina]填得满满的，以至于你一动就能听到里面晃荡的声音。现在你能清晰地思考了，你应该能够击倒你的下一个敌人。希望你也有机会操他们。");
         }
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1265,1);
         if(int([DynStat.Cor(20)].length) == 0)
         {
            get_game().player.dynStats();
         }
         else if(int([DynStat.Cor(20)].length) == 1)
         {
            get_game().player.dynStats([DynStat.Cor(20)][0]);
         }
         else if(int([DynStat.Cor(20)].length) == 2)
         {
            get_game().player.dynStats([DynStat.Cor(20)][0],[DynStat.Cor(20)][1]);
         }
         else if(int([DynStat.Cor(20)].length) == 3)
         {
            get_game().player.dynStats([DynStat.Cor(20)][0],[DynStat.Cor(20)][1],[DynStat.Cor(20)][2]);
         }
         else if(int([DynStat.Cor(20)].length) == 4)
         {
            get_game().player.dynStats([DynStat.Cor(20)][0],[DynStat.Cor(20)][1],[DynStat.Cor(20)][2],[DynStat.Cor(20)][3]);
         }
         else if(int([DynStat.Cor(20)].length) == 5)
         {
            get_game().player.dynStats([DynStat.Cor(20)][0],[DynStat.Cor(20)][1],[DynStat.Cor(20)][2],[DynStat.Cor(20)][3],[DynStat.Cor(20)][4]);
         }
         else if(int([DynStat.Cor(20)].length) == 6)
         {
            get_game().player.dynStats([DynStat.Cor(20)][0],[DynStat.Cor(20)][1],[DynStat.Cor(20)][2],[DynStat.Cor(20)][3],[DynStat.Cor(20)][4],[DynStat.Cor(20)][5]);
         }
         else if(int([DynStat.Cor(20)].length) == 7)
         {
            get_game().player.dynStats([DynStat.Cor(20)][0],[DynStat.Cor(20)][1],[DynStat.Cor(20)][2],[DynStat.Cor(20)][3],[DynStat.Cor(20)][4],[DynStat.Cor(20)][5],[DynStat.Cor(20)][6]);
         }
         else if(int([DynStat.Cor(20)].length) == 8)
         {
            get_game().player.dynStats([DynStat.Cor(20)][0],[DynStat.Cor(20)][1],[DynStat.Cor(20)][2],[DynStat.Cor(20)][3],[DynStat.Cor(20)][4],[DynStat.Cor(20)][5],[DynStat.Cor(20)][6],[DynStat.Cor(20)][7]);
         }
         else if(int([DynStat.Cor(20)].length) == 9)
         {
            get_game().player.dynStats([DynStat.Cor(20)][0],[DynStat.Cor(20)][1],[DynStat.Cor(20)][2],[DynStat.Cor(20)][3],[DynStat.Cor(20)][4],[DynStat.Cor(20)][5],[DynStat.Cor(20)][6],[DynStat.Cor(20)][7],[DynStat.Cor(20)][8]);
         }
         else if(int([DynStat.Cor(20)].length) == 10)
         {
            get_game().player.dynStats([DynStat.Cor(20)][0],[DynStat.Cor(20)][1],[DynStat.Cor(20)][2],[DynStat.Cor(20)][3],[DynStat.Cor(20)][4],[DynStat.Cor(20)][5],[DynStat.Cor(20)][6],[DynStat.Cor(20)][7],[DynStat.Cor(20)][8],[DynStat.Cor(20)][9]);
         }
         else if(int([DynStat.Cor(20)].length) == 11)
         {
            get_game().player.dynStats([DynStat.Cor(20)][0],[DynStat.Cor(20)][1],[DynStat.Cor(20)][2],[DynStat.Cor(20)][3],[DynStat.Cor(20)][4],[DynStat.Cor(20)][5],[DynStat.Cor(20)][6],[DynStat.Cor(20)][7],[DynStat.Cor(20)][8],[DynStat.Cor(20)][9],[DynStat.Cor(20)][10]);
         }
         else if(int([DynStat.Cor(20)].length) == 12)
         {
            get_game().player.dynStats([DynStat.Cor(20)][0],[DynStat.Cor(20)][1],[DynStat.Cor(20)][2],[DynStat.Cor(20)][3],[DynStat.Cor(20)][4],[DynStat.Cor(20)][5],[DynStat.Cor(20)][6],[DynStat.Cor(20)][7],[DynStat.Cor(20)][8],[DynStat.Cor(20)][9],[DynStat.Cor(20)][10],[DynStat.Cor(20)][11]);
         }
         else if(int([DynStat.Cor(20)].length) == 13)
         {
            get_game().player.dynStats([DynStat.Cor(20)][0],[DynStat.Cor(20)][1],[DynStat.Cor(20)][2],[DynStat.Cor(20)][3],[DynStat.Cor(20)][4],[DynStat.Cor(20)][5],[DynStat.Cor(20)][6],[DynStat.Cor(20)][7],[DynStat.Cor(20)][8],[DynStat.Cor(20)][9],[DynStat.Cor(20)][10],[DynStat.Cor(20)][11],[DynStat.Cor(20)][12]);
         }
         else if(int([DynStat.Cor(20)].length) == 14)
         {
            get_game().player.dynStats([DynStat.Cor(20)][0],[DynStat.Cor(20)][1],[DynStat.Cor(20)][2],[DynStat.Cor(20)][3],[DynStat.Cor(20)][4],[DynStat.Cor(20)][5],[DynStat.Cor(20)][6],[DynStat.Cor(20)][7],[DynStat.Cor(20)][8],[DynStat.Cor(20)][9],[DynStat.Cor(20)][10],[DynStat.Cor(20)][11],[DynStat.Cor(20)][12],[DynStat.Cor(20)][13]);
         }
         else if(int([DynStat.Cor(20)].length) == 15)
         {
            get_game().player.dynStats([DynStat.Cor(20)][0],[DynStat.Cor(20)][1],[DynStat.Cor(20)][2],[DynStat.Cor(20)][3],[DynStat.Cor(20)][4],[DynStat.Cor(20)][5],[DynStat.Cor(20)][6],[DynStat.Cor(20)][7],[DynStat.Cor(20)][8],[DynStat.Cor(20)][9],[DynStat.Cor(20)][10],[DynStat.Cor(20)][11],[DynStat.Cor(20)][12],[DynStat.Cor(20)][13],[DynStat.Cor(20)][14]);
         }
         else if(int([DynStat.Cor(20)].length) == 16)
         {
            get_game().player.dynStats([DynStat.Cor(20)][0],[DynStat.Cor(20)][1],[DynStat.Cor(20)][2],[DynStat.Cor(20)][3],[DynStat.Cor(20)][4],[DynStat.Cor(20)][5],[DynStat.Cor(20)][6],[DynStat.Cor(20)][7],[DynStat.Cor(20)][8],[DynStat.Cor(20)][9],[DynStat.Cor(20)][10],[DynStat.Cor(20)][11],[DynStat.Cor(20)][12],[DynStat.Cor(20)][13],[DynStat.Cor(20)][14],[DynStat.Cor(20)][15]);
         }
         else if(int([DynStat.Cor(20)].length) == 17)
         {
            get_game().player.dynStats([DynStat.Cor(20)][0],[DynStat.Cor(20)][1],[DynStat.Cor(20)][2],[DynStat.Cor(20)][3],[DynStat.Cor(20)][4],[DynStat.Cor(20)][5],[DynStat.Cor(20)][6],[DynStat.Cor(20)][7],[DynStat.Cor(20)][8],[DynStat.Cor(20)][9],[DynStat.Cor(20)][10],[DynStat.Cor(20)][11],[DynStat.Cor(20)][12],[DynStat.Cor(20)][13],[DynStat.Cor(20)][14],[DynStat.Cor(20)][15],[DynStat.Cor(20)][16]);
         }
         else if(int([DynStat.Cor(20)].length) == 18)
         {
            get_game().player.dynStats([DynStat.Cor(20)][0],[DynStat.Cor(20)][1],[DynStat.Cor(20)][2],[DynStat.Cor(20)][3],[DynStat.Cor(20)][4],[DynStat.Cor(20)][5],[DynStat.Cor(20)][6],[DynStat.Cor(20)][7],[DynStat.Cor(20)][8],[DynStat.Cor(20)][9],[DynStat.Cor(20)][10],[DynStat.Cor(20)][11],[DynStat.Cor(20)][12],[DynStat.Cor(20)][13],[DynStat.Cor(20)][14],[DynStat.Cor(20)][15],[DynStat.Cor(20)][16],[DynStat.Cor(20)][17]);
         }
         else if(int([DynStat.Cor(20)].length) == 19)
         {
            get_game().player.dynStats([DynStat.Cor(20)][0],[DynStat.Cor(20)][1],[DynStat.Cor(20)][2],[DynStat.Cor(20)][3],[DynStat.Cor(20)][4],[DynStat.Cor(20)][5],[DynStat.Cor(20)][6],[DynStat.Cor(20)][7],[DynStat.Cor(20)][8],[DynStat.Cor(20)][9],[DynStat.Cor(20)][10],[DynStat.Cor(20)][11],[DynStat.Cor(20)][12],[DynStat.Cor(20)][13],[DynStat.Cor(20)][14],[DynStat.Cor(20)][15],[DynStat.Cor(20)][16],[DynStat.Cor(20)][17],[DynStat.Cor(20)][18]);
         }
         else
         {
            if(int([DynStat.Cor(20)].length) != 20)
            {
               throw "Too many rest arguments";
            }
            get_game().player.dynStats([DynStat.Cor(20)][0],[DynStat.Cor(20)][1],[DynStat.Cor(20)][2],[DynStat.Cor(20)][3],[DynStat.Cor(20)][4],[DynStat.Cor(20)][5],[DynStat.Cor(20)][6],[DynStat.Cor(20)][7],[DynStat.Cor(20)][8],[DynStat.Cor(20)][9],[DynStat.Cor(20)][10],[DynStat.Cor(20)][11],[DynStat.Cor(20)][12],[DynStat.Cor(20)][13],[DynStat.Cor(20)][14],[DynStat.Cor(20)][15],[DynStat.Cor(20)][16],[DynStat.Cor(20)][17],[DynStat.Cor(20)][18],[DynStat.Cor(20)][19]);
         }
         get_player().orgasm("Vaginal");
         get_player().knockUp(1,432);
         driderDefeatMenu();
      }
   }
}

