package classes.scenes.places.mothCave
{
   import classes.CoC;
   import classes.DebugMenu;
   import classes.DynStat;
   import classes.Monster;
   import classes.Output;
   import classes.PerkLib;
   import classes.Player;
   import classes.SelfDebug;
   import classes.StatusEffects;
   import classes.Time;
   import classes.TimeAwareInterface;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.items.JewelryLib;
   import classes.items.Weapon;
   import classes.parser._Parser.TagFun_Impl_;
   import classes.saves.SelfSaver;
   import classes.saves.SelfSaving;
   import classes.scenes.Camp;
   import classes.scenes.Inventory;
   import classes.scenes.areas.volcanicCrag.CorruptedCoven;
   import classes.scenes.combat.Combat;
   import classes.scenes.npcs.AmilyScene;
   import classes.scenes.npcs.HelSpawnScene;
   import classes.scenes.npcs.NPCAwareContent;
   import classes.scenes.npcs.SylviaScene;
   import classes.scenes.places.MothCave;
   import classes.scenes.places.mothCave._DoloresScene.SaveContent;
   import coc.view.CoCButton;
   import flash.Boot;
   
   public class DoloresScene extends NPCAwareContent implements TimeAwareInterface, SelfDebug, SelfSaving
   {
      
      public var saveVersion:int;
      
      public var saveName:String;
      
      public var saveContent:SaveContent;
      
      public var guessedName:Boolean;
      
      public var globalSave:Boolean;
      
      public var givenHint:Boolean;
      
      public var demonTalks:int;
      
      public var campScenes:Array;
      
      public var HQTELA:int;
      
      public var HQROBE:int;
      
      public var HQOUTD:int;
      
      public var HQNAME:int;
      
      public var HQMARI:int;
      
      public var HQKILL:int;
      
      public var HQFREE:int;
      
      public var HQDONE:int;
      
      public var HQCIRC:int;
      
      public var HQCAMP:int;
      
      public var HQBAZR:int;
      
      public function DoloresScene()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         demonTalks = 0;
         guessedName = false;
         givenHint = false;
         campScenes = [];
         HQKILL = 1024;
         HQNAME = 512;
         HQFREE = 256;
         HQROBE = 128;
         HQDONE = 64;
         HQOUTD = 32;
         HQCIRC = 16;
         HQTELA = 8;
         HQBAZR = 4;
         HQMARI = 2;
         HQCAMP = 1;
         globalSave = false;
         saveVersion = 1;
         saveName = "dolores";
         saveContent = new SaveContent(null,null,null,null,null,null,null,null,null,null,null);
         super();
         SelfSaver.register(this);
         DebugMenu.register(this);
         CoC.timeAwareClassAdd(this);
      }
      
      public function timeChangeLarge() : Boolean
      {
         return false;
      }
      
      public function timeChange() : Boolean
      {
         _temp_1.doloresTimeSinceEvent += 1;
         return false;
      }
      
      public function saveToObject() : Object
      {
         return saveContent;
      }
      
      public function reset() : void
      {
         saveContent.doloresProgress = 0;
         saveContent.doloresTimeSinceEvent = 0;
         saveContent.doloresDecision = 0;
         saveContent.doloresAmbitions = 0;
         saveContent.doloresFinal = 0;
         saveContent.hikkiQuest = 0;
         saveContent.doloresSex = 0;
         saveContent.doloresTimesLeft = 0;
         saveContent.doloresAngry = false;
         saveContent.doloresBlowjob = false;
         saveContent.doloresBooks = false;
      }
      
      public function onAscend(param1:Boolean) : void
      {
         reset();
      }
      
      public function load(param1:int, param2:*) : void
      {
         Utils.extend(saveContent,param2);
      }
      
      public function hikkiWinRiches() : void
      {
         clearOutput();
         outputText("你告诉那个老人，他看起来像个吝啬鬼，所以他肯定有一两件东西能满足你的金钱欲望。如果他还想继续喘气，就应该分享点什么。尽管你的要求很苛刻，但他还是咧嘴笑了，似乎对你的要求感到很满意。");
         outputText("[pg][say:是的，是的，你们凡人就是这么喜欢闪闪发光的小玩意儿。这就是为什么它们那么容易被拿走……]这个可怜虫把一只手伸进他那肮脏的束腰外衣里，在里面摸索了好一会儿，最后掏出了一个小物件，在[sun]光下闪烁着微弱的光芒。[say:我非常确定，这会平息你的任何疑虑。]");
         outputText("[pg]他伸出手臂，你一把抓住了他递过来的宝物。仔细一看，你现在可以看出那是一枚戒指。而且是一枚很精致的戒指——由闪闪发光的黄金制成，上面镶嵌着三颗大宝石，无论你在哪里卖掉它，肯定都能卖个好价钱。它的光泽是如此迷人，以至于当他的声音再次响起时，你感到了一阵轻微的震惊。");
         outputText("[pg][say:我从一个可怜的年轻傻瓜那里弄到了这个，[if (iselder) {他可能本来可以成为你的儿子|[if (ischild) {比你大几岁|其实和你差不多大}]}]。很诚实，但也很迟钝，我很好奇他一开始是从哪里弄来的。真可惜，它永远也回不到他想要的那个家了。]恶魔发出一阵让你不寒而栗的咯咯笑声，但你还是把戒指装进了口袋。");
         get_inventory().takeItem(get_jewelries().FABRING,hikkiWinReward);
      }
      
      public function hikkiWinReward() : void
      {
         outputText("[pg][say:所有的债务都已还清，]他说，让你猛地抬起头。[say:我们没有业务往来了，我要走了。我祝你在某个发臭的洞里死得痛快，这样只要我活着，就再也不用看到你那张可悲的脸了。]没等你回答，他从座位上站起来，向后倒去，开始缩小，他的身体消失在树桩后面的阴影中。");
         outputText("[pg]你冲过去查看，但那里除了几块破布什么也没留下。它们的恶臭警告你不要靠近，你怀疑他是否会留下任何有真正价值的东西，看来事情就这么结束了。");
         doNext(hikkiEnd);
      }
      
      public function hikkiWinPleasure() : void
      {
         clearOutput();
         outputText("你告诉恶魔，这一切都非常累人，你需要尽快改善你的心情。既然他是恶魔，你应该希望他知道你想要什么。当你讲述这些时，你的女儿在一旁看着，感到困惑，似乎只有在你讲完后才明白你的意思，于是她脸红了，看向一边。");
         outputText("[pg]至于恶魔，他只是全程带着嘲弄的笑容。在你讲完后，他慵懒地开始说话。[say:是的，是的，这种单调的饥渴对我来说并不陌生。你会发现我已经非常擅长满足这种性质的愿望了。]");
         outputText("[pg]你想知道他到底是什么意思。他有没有什么被束缚的仆人可以召唤来取悦你？他能强迫别人听从你的命令吗？他是恶魔，所以按理说他可以改变自己。事实上，如果你愿意，你甚至可以——");
         outputText("[pg]一声清脆的响指是你唯一的警告，随后你的所有感官都被快感完全淹没。感觉你身体里的每一根神经、每一寸肌肤、每一个突触都被你几乎无法想象的感官刺激所淹没。你的[if (singleleg) {平衡感|双腿}]在袭击下立刻崩溃，当这种奇异的现象席卷你时，你所能做的就是躺在那里。");
         outputText("[pg]快感的泛滥如此彻底，没有任何感官被遗漏。你不仅[i:感觉]到了这种欣快感——你同样可以[i:闻]到并[i:尝]到它。你的视线被一层柔和的红色薄雾所笼罩，让你想起了充血的生殖器，你满脑子想的都是在血管中流淌的纯粹欲望。你不知道自己在这个状态下迷失了多久，但最终一阵隐隐的悸动将你部分拉回了现实。你顺着它，意识慢慢恢复，你的眼睛颤动着睁开。");
         outputText("[pg]你抬起头，第一眼看到的就是那个对你做这种事的人嘲弄的目光，但旁边传来的一声清嗓子很快吸引了你的注意。你转向你的女儿，她满脸通红，头偏向一边。");
         outputText("[pg][say:你-你没事吧，[Father]？]她问道，手指轻轻敲打着手臂。");
         outputText("[pg]好问题。你把注意力转向自己的身体；你的[if (hasscales) {鳞片仍然有些刺痛|[skinshort]仍然有些发热}]，但之前占据你的那种压倒性的感觉几乎消失了。它离开你的速度确实有点奇怪，你在它之后感到几乎空虚。然而，当你四处移动时，你注意到[if (!cumhighleast || !issquirter) {下面有一种某种程度的潮湿，引起了轻微的尴尬|下面有一种大量的潮湿，绝对浸透了你的[if (isnaked) {[legs]|[armor]}]，以至于热量上升到你的脸上}]。看来你回营地后得清理一下了。");
         outputText("[pg]暂时把那放在一边，你抬起头，把你的状况告诉了你的女儿。她点了点头，没有再追问恶魔对你做了什么。");
         get_player().orgasm("Generic");
         hikkiWinReward();
      }
      
      public function hikkiWinMenu() : void
      {
         menu();
         addNextButton("财富",hikkiWinRiches).hint("不如从中捞点好处。");
         addNextButton("知识",hikkiWinKnowledge).hint("像他这么老的人肯定能给你点什么。");
         addNextButton("欢愉",hikkiWinPleasure).hint("既然他现在很顺从，你就可以尽情享受了。");
         addNextButton("他的死",hikkiWinDeath).hint("别再废话了。");
         addNextButton("多洛雷斯",hikkiWinDolores).hint("问问你女儿该怎么办。");
         setExitButton("离开",hikkiWinLeave).hint("你受够了，是时候离开了。");
      }
      
      public function hikkiWinLeave() : void
      {
         clearOutput();
         outputText("你没有理会那个卑劣的男人，牵起女儿的手开始拉着她离开。恶魔只是轻笑，但当他看到你没有回来的意思时，他有些慌了。");
         outputText("[pg][say:行了，行了，你已经向我展示了你有多坚定，但快回来，我们好把事情解决。]");
         outputText("[pg]你连多看他一眼的兴趣都没有，也不想让他提供的任何东西弄脏你的手。老恶魔听到你的回答咆哮起来，似乎比理应表现出的还要愤怒得多。");
         outputText("[pg][say:不！不，你得和我做交易！给我回来！]他咆哮着。当你[walk]进沼泽时，你听到一声巨响，回头一看，老恶魔已经从树桩上向前倒下，一只手臂伸向你，眼中充满杀意。你不知道他为什么对此如此执着。");
         outputText("[pg]然而，你没兴趣去探究，所以你只是径直离开，他的喊叫声最终在你身后渐渐消失。");
         dynStats(DynStat.Cor(-1));
         doNext(hikkiEnd);
      }
      
      public function hikkiWinKnowledge() : void
      {
         clearOutput();
         outputText("你告诉恶魔，从你收集到的信息来看，他一定经验丰富。他看起来非常衰老，你觉得他以前肯定有过很多次这样的遭遇，所以他在这么长的时间里肯定学到了一些有趣的东西。既然你打败了他，你想以这些经验的形式作为你的奖励。");
         outputText("[pg]恶魔咧嘴一笑。[say:当奉承的话从你这样令人作呕的嘴脸里说出来时，是起不到任何作用的，但你的要求确实比大多数人的更有趣。好吧，我答应你。但仔细听好了，因为我不会再说第二遍。]");
         outputText("[pg]他向你招手，你勉强走近，直到他靠得足够近，可以凑过来低语。他的话语在你的耳边听起来出奇地舒缓——甚至有些甜美——你发现自己正努力不陷入昏迷。它们的内容很简单，但你觉得它们似乎有一些你无法完全理解的意义。当他终于停止说话时，你眨了眨眼，感觉就像刚从沉睡中醒来一样。");
         outputText("[pg][say:好了。你会变得稍微不那么像个没用的蠢货，虽然这也没什么大不了的。]");
         outputText("[pg]你看着他，惊讶地发现你注意到了以前没有注意到的细节。他眉毛的轻微抽动，他不稳定的呼吸，他四肢怪异的静止——没什么大不了的，但你只是觉得你正在更密切地追踪他，就像你更了解他的动作——或者也许是恶魔本身——一点点。很奇怪，但可能非常有用。");
         get_player().createPerk(PerkLib.RiddleSight);
         hikkiWinReward();
      }
      
      public function hikkiWinDolores() : void
      {
         clearOutput();
         outputText("你转向多洛雷斯，问她觉得现在最好的做法是什么。她眨了眨眼，困惑了一会儿才终于理解了你的话。");
         outputText("[pg][say:我、我？嗯，是我……我的意思是，我不可能……]");
         outputText("[pg]你立刻打断了她，告诉她如果你不想听她的回答就不会问。她是你的女儿，没有什么能改变这一点，但除了你们的家庭纽带之外，她也是个非常聪明的年轻女孩，她的建议总是受欢迎的。");
         if((saveContent.hikkiQuest & HQNAME) != 0)
         {
            outputText("[pg]她似乎把你的话听进去了，表情从不确定变成了沉思，一只手托着下巴。她保持这个姿势了一段时间，漫无目的地看着，然后她的眼睛突然闪烁出一种安静的强烈光芒。");
            outputText("[pg][say:我们能要求的东西具体有什么限制？]她问恶魔。");
            outputText("[pg][say:好吧……我其实没有义务告诉你，但出于好心：主要是物品和服务，]他回答道，看起来甚至对和她说话都感到不悦。");
            outputText("[pg]她跺了几下脚。[say:服务？你具体是指什么？]");
            outputText("[pg]他耸了耸肩，动作间微微皱眉。[say:我可以为你做点什么。你想要什么东西？没问题。你想杀谁？只要不是“她”，我都能试一试。]他轻笑起来。");
            outputText("[pg][say:那我可以要求你反复做某件事吗？不只是一次性的行动？]她脸上开始浮现出一丝狡黠的笑容，你保持沉默，等着看她葫芦里卖的什么药。");
            outputText("[pg]恶魔微微眯起眼睛回答道，[say:可——以。曾经有个小伙子要我每个满月给他带个新鲜的处女。当然，那件事在——]");
            outputText("[pg][say:我要你对遇到的每个人说出你的名字。你的真名。]");
            outputText("[pg]他的脸扭曲成一个可怕的表情。他的眼睛瞪得快要掉出眼眶，你怀疑自己以前是否见过如此强烈的愤怒。有那么一瞬间，你以为他要向你扑过来，但他平静了下来，所有的能量似乎都离他而去。当他开始说话时，语气中带着令人不寒而栗的冷漠。[say:总有一天，我会杀了你。]");
            outputText("[pg]说完，他站起身，一瘸一拐地向森林深处走去，多洛雷斯傲慢的笑容一路紧盯着他的背影。");
            doNext(hikkiEnd);
         }
         else
         {
            outputText("[pg]她听到你的话笑了笑，微微红着脸看着自己的脚。[say:我……谢谢你，[Father]，但打败他的是你，所以你应该得到你想要的。而且，无论如何，我也不确定该向这样一个卑鄙小人要求什么。]");
            outputText("[pg]说完，她点点头，转过身去。看来你得自己选了。");
            addButtonDisabled(4,"多洛雷斯","你已经问过她了。");
         }
      }
      
      public function hikkiWinDeath() : void
      {
         clearOutput();
         outputText("你没有回答，而是举起了你的[weapon]。他只是笑了笑。");
         outputText("[pg][say:没关系，你已经证明了你想证明的任何观点。真的，没必要那样——我已经告诉过你了，我会给你任何你想要的。尽管开口吧。]");
         outputText("[pg]你想要他彻底完蛋，让他不再祸害这个世界。他又轻笑了一声，仿佛这就是他所能做的一切。");
         outputText("[pg][say:非常有趣，真的，真是个让人捧腹大笑的笑话，但你肯定想要[b:什么]。如果你剥去足够多层“美德”和“仁慈”的外衣，你们所有这些油腻的凡人都会想要的。]你走近了一步，没有放下你的[weapon]一点点。[say:现-现在，我们……啊……你真的打算……但是！是的，我可以向你保证，我——]");
         outputText("[pg]你已经拉近了距离，不管他准备好没有。你的");
         if(get_player().get_weapon().isBladed())
         {
            outputText("刀刃向他挥去");
         }
         else if(get_player().get_weapon().isFirearm() || get_player().get_weapon().isChanneling())
         {
            outputText("第一发子弹径直向他飞去");
         }
         else if(get_player().get_weapon().isBlunt())
         {
            outputText("武器划出一道致命的弧线，直逼他而去");
         }
         else
         {
            outputText("拳头直奔他的面门");
         }
         outputText("，逼得他连滚带爬地摔倒在地，这才勉强躲过一击。他惊慌失措地四下张望，但已无路可逃，只好可怜巴巴地试图躲在树桩后面。");
         outputText("[pg][say:住手，你这个彻头彻尾的蠢货！你到底[b:想要]什么！？什么都可以，什么都行，尽管开口！我的死对你来说，不可能比你最疯狂的梦想、最黑暗的幻想更有价值，所以动动脑子吧，你这只猩猩！你这个十足的野兽！野蛮人！]");
         outputText("[pg]你迅速绕过树桩，他赶紧用双手捂住脸。[say:等、等等！]");
         outputText("[pg]但你的耐心早已耗尽。");
         if(get_player().get_weapon().isBladed())
         {
            outputText("你高举武器，然后以雷霆万钧之势劈下，直接斩断了他的手、血肉和头骨。");
         }
         else if(get_player().get_weapon().isFirearm() || get_player().get_weapon().isChanneling())
         {
            outputText("你将武器直指他的头部，然后开火，子弹穿透了他的双手和后面的软组织。");
         }
         else if(get_player().get_weapon().isBlunt())
         {
            outputText("你迅速侧身一挥，抓住他的手腕，迫使他向一侧扭动，无意中露出了头骨，你毫不犹豫地将其击碎。");
         }
         else
         {
            outputText("你逼近他，一手抓住他的手腕，另一只手如雨点般砸向他那张惊恐的脸，很快就将其打成肉泥。");
         }
         outputText("尽管他已经一动不动，你还是继续攻击，直到他那可怕的面容再也认不出是人脸为止——只是为了以防万一。当你彻底停手时，你退后一步，擦了擦额头，凝视着这个曾经是人——或者连人都算不上——却威胁过你女儿的家伙。");
         outputText("[pg]当你转过身看向她时，你看到她正因为这残忍的景象而畏缩着，但当你走近时，她突然冲过来抱住了你。");
         outputText("[pg][say:我不知道……我是否能做出那样的事，但是……谢谢你，[Father]。这是必须做的。]");
         outputText("[pg]你拍了拍她的背，她紧紧抱着你，又待了一会儿。当她似乎准备好继续前进时，你们俩离开了，没有再对留下的东西浪费一丝心思。");
         dynStats(DynStat.Cor(-3));
         get_player().upgradeBeautifulSword();
         _temp_1.hikkiQuest |= HQKILL;
         doNext(hikkiEnd);
      }
      
      public function hikkiTalkRiddlesAnswer(param1:int) : void
      {
         hikkiTalk();
         clearOutput();
         switch(param1)
         {
            case 0:
               outputText("你耸了耸肩，告诉他你对华丽的辞藻不感兴趣。他点点头，冷笑着回答：[say:哼，从你那呆滞无聊的表情就看出来了，你这个俗人。] 尽管他嘴上这么说，但他那张满是皱纹的脸上得意的表情让你觉得，他可能实际上更喜欢这个回答。");
               break;
            case 1:
               outputText("你告诉这个老恶魔，不管他怎么看待凡人，你们并不全是流着口水的蠢货。尽管你当时是在为自己的灵魂而战，但你其实很享受这个过程，而且你通常也很欣赏那些巧妙的言辞。");
               outputText("[pg][say:哈！哈……好吧，我想玛瑞斯还是有些惊喜的。]他似乎萎靡了下来，这个恶魔难得地看起来就像一个疲惫的老旅行者。然而，这种错觉并没有持续多久，他很快就精神了起来，脸上带着丑陋的假笑。[say:真遗憾我没尝到你灵魂的滋味。]");
         }
         outputText("[pg]谈话中出现了一阵平静，恶魔在座位上挪动了一下，看起来陷入了沉思。[say:好吧，即使我的听众是被迫的，背诵它们感觉还是不错的。啊——]他皱起眉头。[say:我可没指望从你们这种人身上得到哪怕一丝同情，所以别胡思乱想。]");
         outputText("[pg]他移开视线，所以你觉得在这里从他身上问不出什么了。");
         addButtonDisabled(1,"谜语","你已经问过这个了。");
         if((demonTalks = int(demonTalks + 1)) == 3)
         {
            doNext(hikkiDiscover);
         }
      }
      
      public function hikkiTalkRiddles() : void
      {
         var choice1:int;
         var _g1:DoloresScene;
         var choice:int;
         var _g:DoloresScene;
         clearOutput();
         outputText("那些谜语确实很有趣。是他自己想出来的吗？还是即兴发挥的？他似乎很快就能想出来——是预先准备好的吗？");
         outputText("[pg]恶魔冷笑作为回应，花了几秒钟才找到合适的词汇。[say:[b:是的]，我自己写的。嗯，有些事情我无法控制。合同义务之类的，你知道的——一笔糟糕的交易，而且非常受限。]他咧嘴一笑。[say:但即便如此，我还是会说我干得非常出色！我的意思是，像你这样的人都能理解它们。尽管……尽管我必须……]他的声音渐渐变小，表情变得难以捉摸。");
         outputText("[pg]奇怪的是，他的表情似乎柔和了一些。[say:虽然押韵是我自己想的。那是……生活中罕见的乐趣。]在你产生他真的有灵魂的错觉之前，他很快又恢复了傲慢的表情。[say:我想这些东西对你们这群人来说几乎完全是浪费。真遗憾，凡人唯一擅长的就是发出悦耳的哀嚎，但他们中似乎没有一个人能保持像样的韵律。]");
         menu();
         _g = this;
         choice = 0;
         addNextButton("差不多",function():void
         {
            _g.hikkiTalkRiddlesAnswer(choice);
         }).hint("他没说错——你确实对那些不感兴趣。");
         _g1 = this;
         choice1 = 1;
         addNextButton("喜欢",function():void
         {
            _g1.hikkiTalkRiddlesAnswer(choice1);
         }).hint("不管他对你的印象如何，你确实很欣赏这类东西。");
      }
      
      public function hikkiTalkPurpose() : void
      {
         clearOutput();
         outputText("你问恶魔一开始为什么要这样挑战你。恶魔通常对自己的欲望要直接得多，所以这种做法克制得令人起疑。");
         outputText("[pg][say:切，真是不知好歹，一点都不知好歹，我跟你说！我找[him]玩一场友好的游戏，而不是直接把[his]内脏扯出来，结果换来的却是一通审问！] 尽管这番话说得义愤填膺，但他的表情清楚地表明他只是在开玩笑。[say:你就不能单纯地享受一下吗？[b:我]一直很喜欢在精彩的智力博弈中享受胜利的快感，而你们凡人里多的是那种没脑子的猎物。]");
         outputText("[pg]虽然他这么说，但你指出他对自己目前的处境似乎也并没有多高兴，而且在你看来，他这样行事真的没什么意义。为什么要这样限制自己呢？");
         outputText("[pg][say:是啊，好吧，我不否认我很乐意把你的眼珠子从头骨里抠出来，同时品尝一些生活中更美好的事物]——他瞥了一眼你的女儿，你考虑着要不要打破这脆弱的和平——[say:但遗憾的是，我是……]");
         outputText("[pg]他沉默了一会儿，目光游移。在这一刻，他看起来几乎……有些迷茫。突然，他的头猛地一扬，你能看到他眼中的愤怒，尽管你有一种奇怪的感觉，这愤怒并不完全是冲着你来的。[say:是啊，好吧，无论如何，这就是我必须打发这悲惨时光的方式，所以同情一下我吧，同病相怜的可怜人。]");
         outputText("[pg]他双臂交叉，开始用一只脏兮兮的靴子敲击地面。你考虑过继续追问，但你觉得他不会再透露更多你想要的信息了。");
         addButtonDisabled(0,"目的","你已经问过这个了。");
         if((demonTalks = int(demonTalks + 1)) == 3)
         {
            doNext(hikkiDiscover);
         }
      }
      
      public function hikkiTalkHimself() : void
      {
         clearOutput();
         outputText("你让恶魔讲讲他自己的事。他眨了眨眼。");
         outputText("[pg][say:我不觉得我的听力已经差到[b:那种]地步了，但听起来你好像在试着跟我闲聊。你耳朵里有耳鸣吗？有没有闻到什么不寻常的气味？]");
         outputText("[pg]你是认真的——你刚刚花了大把时间忍受他那个游戏，所以他似乎至少欠你一个小小的解释，说明他到底是谁。");
         outputText("[pg][say:哎呀，我告诉过你。]他咧嘴一笑。[say:一个同行的旅行者！仅此而已。也许曾经是别的什么，但岁月对我并不宽容，所以现在我是一个迷失的灵魂——或者，好吧，用词不当，但你明白我的意思。]");
         outputText("[pg]你不太确定该怎么从他嘴里套出更多话，但幸运的是，多洛雷斯选择在这个时候介入，她走上前问道：[say:好吧，你至少能告诉我们你的名字吗？我告诉你我的名字时就问过，我记得你当时也相当沉默寡言。]");
         outputText("[pg][say:你觉得我们已经熟到可以直呼其名了吗？]他反驳道。[say:不，我不明白我为什么要对你们客气。]奇怪的是，他看起来有点紧张，但你不知道为什么。你女儿眯起了眼睛。");
         outputText("[pg][say:但你显然是个骄傲的小个子，为什么不想让世界知道你的名字呢？有什么原因不能告诉我们吗？最坏的情况能怎样——我想象不出我们能做什么来损害你的名声之类的。]");
         outputText("[pg][say:不！]他大喊一声，然后陷入沉默，看起来闷闷不乐。好吧，看来这个话题已经聊死了，但他这么不愿意分享这个，确实很奇怪……");
         addButtonDisabled(2,"他自己","你已经问过这个了。");
         if((demonTalks = int(demonTalks + 1)) == 3)
         {
            doNext(hikkiDiscover);
         }
      }
      
      public function hikkiTalk() : void
      {
         clearOutput();
         outputText("你告诉恶魔，你现在只想和他谈谈。他冷笑着回应你。");
         outputText("[pg][say:谈谈？和一个傻笑的凡人？好吧，我想能遇到一个足够文明，不会试图和视线内的一切战斗或做爱的人，也算是件稀罕事了，所以我应该好好珍惜这些机会。好吧，谈吧。]");
         outputText("[pg]虽然这样的回答并不能让你对继续这场对话充满热情，但你确实有几个问题想问他……");
         menu();
         addNextButton("目的",hikkiTalkPurpose).hint("那个游戏的目的是什么？");
         addNextButton("谜语",hikkiTalkRiddles).hint("询问他在游戏中使用的谜语。");
         addNextButton("他自己",hikkiTalkHimself).hint("试图了解更多关于恶魔本身的信息。");
         if(demonTalks >= 3)
         {
            addNextButton("猜名字",hikkiGuessName).hint("解开这最后一个谜题。");
         }
         setExitButton("返回",hikkiRiddleWin);
      }
      
      public function hikkiStart() : void
      {
         clearOutput();
         outputText("你走向多洛雷斯，但她并没有像往常一样向你问好，而是站起身来，眼中带着坚定的神情向你走来。你不知道她为什么这么激动，但很明显，当她鼓起勇气站在你面前时，她有重要的话要说。");
         outputText("[pg][say:你能带我到处转转吗？]");
         outputText("[pg]带她到处转转？这里不就是[i:她]的家吗？");
         outputText("[pg][say:抱歉]——一抹羞涩的红晕悄悄爬上她的脸颊——[say:我是说我想和你一起旅行。就是，去这个洞穴外面。]她稍作停顿，[say:去看看这个世界，]她补充道。");
         outputText("[pg]好吧，外面的世界其实也没剩下多少了。对于像她这样毫无准备的人来说，旅行可能会非常危险。而且，她不是通常更喜欢待在室内吗？这对她来说有点反常，尤其是这么突然。你问她为什么会提出这么出人意料的请求。");
         outputText("[pg][say:嗯，作为一个成年人]——你对此不太确定，但你不知道如果纠正她会发生什么——[say:我早就该展翅高飞了]——她的翅膀微微扑腾了一下，你几乎控制不住自己的反应——[say:打个比方，就是离开巢穴。因此，我想请求你带我去一些你去过的地方。]");
         outputText("[pg][say:那么，你愿意带我去看看风景吗？]");
         saveContent.doloresProgress = 16;
         menu();
         addNextButton("接受",hikkiAccept).hint("你很乐意让你的女儿体验一下世面。");
         addNextButton("拒绝",hikkiDecline).hint("你没兴趣和她一起在玛瑞斯到处闲逛。");
         addNextButton("稍后",hikkiLater).hint("你现在还没准备好。");
      }
      
      public function hikkiSex3() : void
      {
         clearOutput();
         outputText("这片森林里很安静，所以多洛雷斯浅浅的呼吸声是你唯一能听到的声音。[sun]高高挂在天空，阳光透过树叶的遮挡，洒在林间空地上。一切都是那么温柔、宁静、安详。当你慢慢平静下来时，整个世界可能只有你和你的女儿，你们俩的身体都虚弱得无法动弹。");
         outputText("[pg]过了一段时间，你[if (hascock) {的肉棒变软了，足以滑出来|开始觉得有些僵硬}]，所以你给了蛾女最后一个拥抱，把她移到一边，然后站起来[if (!isnaked) {重新穿上你的[armor]|伸个懒腰}]。多洛雷斯恢复得有些慢，但最终，她还是设法站了起来，脸上带着[if (dolorescomforted) {隐约梦幻般的|完全空白的}]表情。");
         outputText("[pg]你问她感觉如何，她立刻回过神来，脸颊上泛起一丝红晕。[saystart]啊，[Father]……这……[if (dolorescomforted) {出乎意料地……[sayend] 她没有具体说是什么，但你确信你已经知道了|很好。[sayend] 她没有具体说明，但你能感觉到你们两人之间深厚的羁绊，所以你一点也不担心}]。");
         outputText("[pg]但无论如何，你们俩在这里已经耽搁了很长时间，所以你应该考虑继续前进了。多洛雷斯在她的裙子里不舒服地扭动着，所以在去下一个目的地的路上顺便去一趟山洞，让她清理一下，可能是一个好主意。");
         _temp_1.hikkiQuest |= HQOUTD;
         cheatTime(1);
         doNext(hikkiMenu);
      }
      
      public function hikkiSex2() : void
      {
         clearOutput();
         outputText("你从背后靠近年轻的蛾女，再次将她拥入怀中，发现她这次要[if (dolorescomforted) {放松|顺从}]得多。你凑近她的耳边，轻声诉说她有多么美丽，惹得她暗色的肌肤泛起一阵战栗。你的双唇在她的脖颈上落下密集的吻，当她微微颤抖时，你的吻停在了她的肩膀上。");
         outputText("[pg][say:" + get_player().mf("父-父亲","母-母亲") + "……]");
         outputText("[pg]她语气中的某种东西点燃了你心中的火焰，你拼尽全力才忍住没有当场蹂躏她。不，你还有计划，所以你赶紧付诸行动。你稳稳地抓住你的女儿，带着她走到你之前选好的那棵树旁。遗憾的是，你不得不放开她去[if (!isnaked) {脱衣服|准备一下}]，但你知道你不用等太久就能再次感受到她。");
         outputText("[pg]多洛雷斯看起来太尴尬了，以至于无法[if (!isnaked) {跟着脱|和你一起赤身裸体}]，但这没关系——你不想让她[i:太]超出她的舒适区，而且她已经非常勇敢了。你为你那小女孩感到骄傲，你真的很想向她展示这一点，当你欣赏她美丽的身体时，你这样想。");
         if(get_player().hasCock())
         {
            outputText("[pg]你问她是否准备好了，她微微点了点头，显然还是太害羞了，不敢看你。尊重她不想脱衣服的意愿，你开始把她的裙子拉到臀部以上，虽然她微微颤抖，但她没有阻止你。做完这些，你把手指勾进她的内裤——黑色的、蕾丝的、可爱的——慢慢地把它们拉到她的脚踝，确保一路上不会吓到她。");
            outputText("[pg]在这个[if (haslegs) {跪着|降低}]的姿势下，你的脸正好贴着她等待着的私处，所以你凑近深吸了一口气。你的呼吸让她的双腿颤抖，[if (dolorescomforted) {从她越来越湿润的下体可以看出她开始有点兴奋了|虽然她似乎没有更多的反应}]。但你已经等不及了，所以你站起来，握住你的[cock]，把它对准她的入口。");
            outputText("[pg][if (tallness > 66) {然而，你们的臀部并没有完全对齐。没关系——你轻轻地抓住她的两侧，把她举到合适的位置。这样，她的双腿悬在下面，她似乎有短暂的恐慌，但你在这里安抚她，所以蛾女很快就把自己交给了你充满爱的拥抱|你们的臀部完美对齐，让你很容易滑到她身边，把自己贴在她的背上。她的双腿似乎有些不稳——也许是紧张——但你的双手找到了她的两侧并紧紧抓住，让她的颤抖停止了}]。你花了一点时间只是停留在她的阴唇上，确保她为即将发生的事情做好了充分的准备。");
            outputText("[pg]现在已经没有任何阻碍了，你可以自由地滑入她的体内，注意不要太快。毕竟，细细品味这一切才是最好的，品味她的内壁如何爱抚你，感受她光滑的肌肤，以及你移动时她发出的轻微娇喘。你缓缓沉入，一到底部便开始后撤，这种感觉让你微微颤抖。她紧紧攀附着你，让你的每一个动作都变得稍微困难了一些，但这反而让感觉更棒了。");
            outputText("[pg]这简直是天堂般的享受，但你[if (cor < 66) {并不只想着自己的快乐|对她的反应也感到同样愉悦}]。你控制着动作的节奏，感受着她的反应，试探着什么对你的女儿最有效。几分钟后，她的呼吸变得沉重，翅膀无力地扑腾着，你觉得她离高潮不远了。作为试探，你给了她一次特别用力的挺进，这让她[if (haslegs) {的双腿}]下意识地向后蜷缩，紧紧缠绕着你。");
            outputText("[pg]看到她这样的反应，你再也无法克制了。你的臀部开始疯狂地运动，[if (dolorescomforted) {引得你的女儿发出颤抖的呻吟|尽管你的女儿没有发出任何声音}]，她[if (tallness > 66) {挂在你的臂弯里|靠在树干上支撑着自己}]。你紧紧地抱住她，年轻的蛾女充满爱意地接受着你的爱抚，当你不断抽插时，她的褶皱感觉就像柔软的天鹅绒。她放在树干上的四只手让她保持着相当的稳定，这让你能够采取一种很快就将你推向边缘的节奏。");
            outputText("[pg]你能感觉到第一股精液伴随着触电般的感觉喷涌而出，但你没有减速，甚至一点也慢不下来。一种原始的狂热占据了你的大脑，你在蛾女体内进进出出，[if (dolorescomforted) {当你享受她的身体时，她轻柔的哭泣声就像甜美的夜曲。你能感觉到她紧紧地包裹着你，她的双腿在下面无力地痉挛，而你的女儿也达到了高潮的认知|她轻柔的咕哝和呜咽声完全占据了你的大脑。你粗暴的动作让她紧紧地包裹着你，而她年轻娇小身体的感觉}]将你进一步推向了欲望驱动的极乐之中。");
            outputText("[pg]到最后，你的精液[if (cumhighleast) {已经完全淹没了她，现在正流出来|从你肉棒的缝隙中流出，滴落}]在地上。你的[cock]继续在她的体内跳动，你最后的几次挺进拍打着她柔软的肉体，直到你再也做不了什么。但你并没有拔出来，而是将她揽入怀中，转过身，背靠着树躺下，让你的女儿坐在你的腿上。");
         }
         else
         {
            outputText("[pg]你继续向前逼近，迫使她退到树干上，但这正是你想要的位置。你的小女孩在你面前是如此可爱，她的双手紧张地摆弄着裙子，脸偏向一侧。但此刻最吸引你的是她的双腿。柔韧而轻盈，又带着恰到好处的柔软——它们真的令人无法抗拒，而你现在一点也不想抗拒。");
            outputText("[pg]你在她面前跪下，她的目光移向上方的树叶，嘴里嘟囔着什么你没听清的话。没关系——你现在有更吸引你全部注意力的东西。你的双手抚上她光滑的肌肤，惹得她一阵颤栗，但尽管她的双腿如此美妙，现在吸引你注意力的却是它们之间的风光。你轻轻地撩起女儿的裙子，褪下她的内裤，露出一条已经让你垂涎欲滴的娇嫩小穴。你一秒钟也不想多耽搁，将双臂滑入她的腿下，惹得这只蛾女惊呼一声，慌乱地挥舞着手臂想要抓住什么东西。");
            outputText("[pg]她最终稳住了身子，两只手搭在你的肩膀上，另外两只手向后弯曲抓住树干，这给了她足够的稳定性，让你不用担心她会摔倒。你的鼻子现在悬停在她的入口前，但你没有立刻埋进去，而是品味着从她身上散发出的温暖和淡淡的动情气味。但你[if (dolorescomforted) {不想让她等太久|已经迫不及待了}]，所以你终于凑上前，在她的敏感肌肤上落下了一吻。");
            outputText("[pg][say:啊-啊……[Father]……这-这……有点太……]");
            outputText("[pg]尽管她这么说，[if (dolorescomforted) {她的动情是显而易见的|你觉得她已经准备好了}]，所以你慢慢地将舌头滑入她的体内，享受着她肉壁的触感，同时[if (haslongtongue) {深深探入她的体内|尽可能深地探入}]。女儿甜美的味道充满你的口腔，你开始充满激情地舔舐她，陶醉在流经你全身的令人迷醉的感觉中。就这样，你能感觉到这只蛾女的心跳，而你的心跳也很快改变了节奏与之匹配，当你温柔地亲吻她时，你们的身体也随之同频跳动。");
            outputText("[pg]当你在上面继续你那充满爱意的努力时，一只手滑到下面来解决你自己的需求。在刚才的激情中，你忽略了自己的需要，现在你的爱液[if (vaginalwetness > 2) {肆意流淌，滴落在森林的地面上|弄脏了你的大腿，证明了你的疏忽}]。最轻微的触碰都会让你的身体一阵颤栗，你对着多洛雷斯发出的呻吟引出了她可爱的反应，[if (dolorescomforted) {那是她无法抑制的|尽管她很快就忍住了}]。");
            outputText("[pg][if (dolorescomforted) {她的双腿紧紧夹住你的脖子，限制了你本就急促的呼吸，她的四只手[if (hashair) {埋进你的头发里|紧紧抓住你的头}]|尽管她的反应很微弱，但从她内壁开始有节奏地收缩的方式，你可以看出她快到极限了，她的双腿甚至出现了短暂的、不由自主的痉挛}]。感觉到你的女儿离高潮有多近，你的心在胸腔里狂跳，你颤抖的手几乎无法继续动作，但现在也不需要再做太多了。");
            outputText("[pg]最终让你爆发的是多洛雷斯自己的高潮。她大叫一声，将上面的一双手移到你的肩胛骨上，身体前倾，让你短暂地担心她会摔倒，但当你的所有神经都被点燃，你迷失在快感中时，你的担忧很快就消失了。你闭上眼睛，剩下的只有你女儿带给你的感觉。她的触感，她的声音，她的味道，所有这些都在安慰和激发着你，你的高潮蔓延到全身，直达你的四肢末端。");
            outputText("[pg]当你终于恢复意识时，你立刻注意到你的脸变得多么凌乱。抬头看了一眼多洛雷斯，确认她现在甚至没有力气感到尴尬，她的眼神看起来完全空洞。最终，你们俩都无法保持直立，所以你把小蛾女拉到你的腿上，靠在树上休息，微弱的余韵仍在你的四肢中流淌。");
         }
         get_player().orgasm("Generic");
         doNext(hikkiSex3);
      }
      
      public function hikkiSex() : void
      {
         clearOutput();
         outputText("当你带领你的女儿继续前进时，你尽最大努力确保她平静舒适。毕竟，她在这里非常不适应，你不想给她任何不必要的惊吓，更不用说这是一次专门为她准备的特别郊游。但你知道一个极好的方法，可以让这次郊游变得更加特别，自从她提起这次旅行以来，你就一直有这个想法。");
         outputText("[pg]然而，你需要一个合适的地方。你们已经走了很长一段时间，以至于你们走进了一片树林，地面比你们来时的沼泽要坚实得多，但还是感觉有些不对劲。你不想随便找个地方做这件事——你想选一个能让这件事令人难忘的地方。就在你产生这个想法的时候，你碰巧发现了它。");
         outputText("[pg]那是一个小林间空地，周围有一堵厚厚的树墙。周围的遮蔽物足够茂密，你怀疑任何偷窥的眼睛是否真的能找到你们，但空地足够大，仍然能给人一种令人兴奋的开阔感。而在你对面是一根特别宽阔、粗壮的树干，它已经给了你一些灵感。是的，这个地方再合适不过了。");
         outputText("[pg]你转向你的女儿，给了她一个眼神，这让她的脸上泛起了红晕，但如果她猜到了你的计划，她也没有表现出来。你一言不发，急忙把她带到你发现的那棵树旁，在森林中央做这种事的想法已经让你兴奋起来。");
         outputText("[pg]然而，多洛雷斯似乎并没有领会到这种气氛。[say:嗯，[Father]，] 她说，[say:你看起来有点脸红。也许我们可以休息一下，已经——]");
         outputText("[pg]你把嘴唇贴在她的嘴唇上，她惊讶得几乎没有反应。[if (dolorescomforted) {然而，当你用双臂环抱她并将她拉近时，她在你的怀抱中融化了片刻，然后突然僵住并退缩|当你用双臂环抱她时，她感觉几乎完全僵硬，当你把脸移开时，你看到她脸上有一丝皱眉}]。");
         outputText("[pg][say:" + get_player().mf("父-父亲","母-母亲") + "……[if (dolorescomforted) {我们在，啊，荒郊野外|求你了，不要——我……我我我}]……] 她没能把话说完，所以你最后吻了她一下，然后问她怎么了。她明显变得惊慌失措，以至于她的翅膀在身后愤慨地张开。");
         outputText("[pg][say:我们完全暴露在外面！要-要是有人看到了怎么办！？我-我-我不敢相信你会……我是说，这完全——！]");
         outputText("[pg]你走近一步，她的脸变得更红了。她似乎对这一切感到困惑，这没关系，但一个[father]爱[his]女儿并没有错。你不害怕隐藏你对她的感情，这里绝对没有什么好羞耻的。这次旅行是为了帮助她成长，所以你想教她为你们的家庭纽带感到自豪。");
         outputText("[pg][if (dolorescomforted) {[say:那倒是挺好的，但是这——！]她用力地比划着，但似乎找不到合适的词。过了一会儿，她垂下手臂，叹了口气|她沉默了一会儿，直到脸上闪过一丝无奈的神情，然后顺从地点了点头}]。[say:好吧。只是……我们能不能小点声？]");
         outputText("[pg]你赶紧向女儿保证，你会尽一切努力确保她享受这段时光，包括保持安静。此外，周围似乎没有人，而且你挑选的位置看起来相当隐蔽；一切都会没事的。多洛雷斯看起来仍然有些迟疑，但并没有反对。");
         outputText("[pg][say:那-那么，怎么……我是说，呃，你有没有……想好什么姿——]她猛地闭上嘴，把身体转向一侧。看来这是在暗示你主动出击，这真是太好了，因为你一秒钟都不想再忍耐了。");
         doNext(hikkiSex2);
      }
      
      public function hikkiRun() : void
      {
         clearOutput();
         outputText("她一定和你想的一样——你们应该赶紧离开这里。");
         outputText("[pg]你抓住她的胳膊，转身开始在树林中狂奔，希望他那苍老的外表不仅仅是表面现象。他那渐渐远去的笑声清楚地表明他并没有追上来，这让你看到了一丝成功的希望，但当你冲破两棵树进入一片空地，却发现那个恶魔又出现在你面前时，这种希望瞬间化为了恐惧。");
         outputText("[pg]他一边笑一边拍着膝盖，高兴得几乎弯下腰来。[say:哦-呵呵-呵呵，把自己累坏了，是吗？还是你只是在热身？没关系，这很好，我喜欢稍微有点活力的。]当你再次转身跑进树林，多洛雷斯紧随其后时，他继续轻笑着。你心里有一种不祥的预感，但你必须尝试一下。");
         outputText("[pg]当你不知不觉又回到原点时，你的绝望彻底沉入了谷底，你草率决定的唯一结果就是气喘吁吁。恶魔似乎暂时收敛了笑意，但他那得意的笑容随时可能再次爆发出一阵大笑。");
         outputText("[pg][say:真有活力，[if (iselder) {你这把年纪还挺硬朗的|我真羡慕年轻人啊}]。现在，你准备好开始了吗，还是你的慢跑还没结束？]");
         outputText("[pg]你能看出这只年轻的蛾女已经气喘吁吁了，而且你也不确定继续这样下去是不是个好主意。");
         addButtonDisabled(2,"逃跑","那行不通的。");
      }
      
      public function hikkiRiddleWin() : void
      {
         clearOutput();
         outputText("恶魔给了你一些讽刺的掌声，虽然即使是他双手拍打的声音也让人感到厌恶。[say:恭喜，哦，恭喜！啊，[if (iselder) {我看出你比你表现出来的要聪明|我想你们这些年轻人还是有一些东西可以教我这个老头子的}]。好吧，那就走吧，从我的视线中消失。]他轻蔑地挥了挥手，转过头去。");
         outputText("[pg]你提醒他，他答应过要放了你的女儿。");
         outputText("[pg][say:哦，对，对，等一下，]他嘟囔着，然后闭上眼睛，做了一个你完全看不懂的复杂手势。你的女儿倒吸一口凉气，双手捂住脖子，你赶紧冲过去，担心恶魔决定反悔。");
         outputText("[pg][say:我……没事，[Father]。]她咳嗽了一声。[say:我没事。]她虚弱地把手放在你的胸口，但看起来已经恢复得很好了。她明亮的眼睛闪烁了一下，说道，[say:你应该担心他……]");
         outputText("[pg]说得好。该怎么处置这个恶魔呢？");
         if((saveContent.hikkiQuest & HQFREE) == 0)
         {
            guessedName = false;
         }
         _temp_1.hikkiQuest |= HQFREE;
         menu();
         addNextButton("战斗",hikkiRiddleFight).hint("你还不太满意。");
         addNextButton("交谈",hikkiTalk).hint("既然危险已经过去，你就有机会和他谈谈了。").disableIf(guessedName,"他看起来不太乐意和你说话。");
         addNextButton("嘲讽",hikkiRiddleTaunt).hint("嘲笑恶魔来缓解一下紧张的气氛。");
         addNextButton("多洛雷斯",hikkiRiddleDolores).hint("既然你现在又能和女儿说话了，那就和她谈谈吧。");
         addNextButton("离开",hikkiRiddleLeave).hint("你不想再从他那里得到什么了。");
      }
      
      public function hikkiRiddleTaunt() : void
      {
         clearOutput();
         outputText("你大喊一声以引起他的注意，老恶魔疲惫地瞥了你一眼。然而，你完全知道如何应对这种居高临下的态度，所以你开始告诉他你有多抱歉。多洛雷斯困惑地看着你，但没有打断。");
         outputText("[pg][say:什么？]他带着一丝冷笑回应道。");
         outputText("[pg]嗯，显然，对于他这个年纪的人来说，输给[i:你]一定很刺痛。他不是说他已经干这行很久了吗？被证明如此彻底地不如别人一定很可耻，所以作为同路人，你至少能做的就是向他道歉，并确保一切都好。");
         outputText("[pg]他那单调苍白的皮肤开始变色。[say:你想嘲笑我？你什么都不是，也永远不会是什么。自从你妈把你拉出来后，你想出的每一个字都没有半点价值，所以随便你瞎扯吧，我一点也不在乎。]");
         outputText("[pg]那太好了——毕竟你是想帮忙。每个人都有倒霉的时候，所以他需要像你这样的人的帮助绝对不可耻。哎呀，你甚至可以帮他想出一些下次更好的谜语。事实上，流程确实有点不对劲，他为什么不——");
         outputText("[pg][say:你——！]他的脸紧绷着，露出一个令人震惊的假笑，然后他瘫倒在树桩上。[say:你是一个最高级别的粗俗之人，我全心全意地希望我再也不用听到你那粗野的声音了。]");
         outputText("[pg]当他大步走进沼泽时，他紧握手杖的发白指关节告诉你你需要知道的一切。你身后爆发出一阵咯咯的笑声，把你从自鸣得意的沉思中惊醒。");
         outputText("[pg][say:干得漂亮，[Father]。对于这件糟糕透顶的事，我想象不出还有比这更令人满意的结局了。]她微笑着低下头，双手背在身后。这里已经没什么值得你们留恋的了，所以你提议离开，她点了点头。[say:嗯，看来这是最好的选择了。]");
         doNext(hikkiEnd);
      }
      
      public function hikkiRiddleLeave() : void
      {
         clearOutput();
         outputText("事不宜迟，你示意多洛雷斯跟上，开始走出这片恶臭的空地。她很快来到你身边，看起来很高兴能远离那个恶魔。你觉得你能听到身后传来一些模糊的抱怨声，但你们俩出发时并没有理会。");
         doNext(hikkiEnd);
      }
      
      public function hikkiRiddleFight() : void
      {
         clearOutput();
         outputText("既然你已经确认女儿没事了，就没有什么能阻止你做该做的事了。当你拿着[weapon]靠近时，恶魔抬起头，大笑起来。");
         outputText("[pg][say:刚才还不够刺激吗？[if (iselder) {你可能想休息一下你的关节|你们这些年轻人总是让我惊讶于你们的精力充沛}]。好吧，我不能说我对之前的结果完全满意，所以我一点也不介意再来一回合。]");
         outputText("[pg]他从树桩上站起来，看起来相当僵硬，但在一瞬间，他冲向你，伸出黑色的爪子。但在他碰到你之前，一道白色的火焰挡住了他的去路，迫使他向旁边躲闪。");
         outputText("[pg][say:我听你的，[Father]，]你从身后听到。当你靠近时，你的女儿迅速飞上天空，准备发动双重攻击。");
         set_monster(new RiddleDemon());
         startCombat(get_monster(),true);
      }
      
      public function hikkiRiddleDolores() : void
      {
         clearOutput();
         outputText("即使她说自己没事，你还是想花点时间确认一下。你轻轻地把多洛雷斯带到离恶魔足够远的地方，以便你们能私下交谈。他看起来有些好奇，但似乎对离开树桩没什么兴趣，所以你们现在可以安心谈话了。考虑到她刚刚经历的事情，这位蛾女的精神状态看起来还算不错，但你还是问了问她的感受。");
         outputText("[pg]她对你微微一笑。[say:我很好，[Father]。我承认刚才的情况确实让人压力很大，但是……我……嗯，最后我还是觉得挺有趣的。]她看起来几乎有些不好意思。[say:并不是说我[b:喜欢]被恶魔纠缠，而是……像那样考验我的智慧很有趣，即使我不能自己回答，而且正因为能和你一起应对，才更加有趣。]");
         outputText("[pg]这似乎是她能说出的全部了，随后红晕爬上了她的脸颊，她陷入了沉默。好吧，没关系，你也以同样的方式回应，她的心情稍微轻松了一些。");
         outputText("[pg]好吧，现在唯一需要决定的就是你要怎么处理那个恶魔，他仍然耐心地坐在那里，也许对这件事也很感兴趣。你问多洛雷斯她认为最好的做法是什么。她用手托着下巴，似乎陷入了沉思，过了一会儿才抬起头来。");
         outputText("[pg][say:我觉得我们应该和他谈谈。]你有些惊讶——她居然想和他说话？你的女儿做了个鬼脸。[say:嗯，我不能说这会是一次愉快的经历，但确实有一些事情让我觉得说不通，我想知道他一开始为什么要那样攻击我们。]她似乎在内心挣扎了一会儿，然后继续说道。[say:只是……你介意来提问吗？我，啊……]");
         outputText("[pg]她不需要解释，你会把这一切都考虑进去的。多洛雷斯感激地点了点头，然后你们俩走回恶魔身边，他似乎精神了一些，显然对你们刚才的商议很感兴趣。");
         addButtonDisabled(3,"多洛雷斯","你刚刚和她谈过。");
      }
      
      public function hikkiRiddleBadEnd() : void
      {
         clearOutput();
         outputText("你正要反驳，但当你试图向前[if (singleleg) {移动|迈出一步}]时，你发现你做不到。这很奇怪——没有什么东西把你固定在原地，但你就是动不了。你想动，你拼命地想动，但就像你无法召唤出哪怕是[walk]所需的能量。恶魔对你的困境感到非常有趣。");
         outputText("[pg][say:怎么了？[if (iselder) {你的关节终于不行了吗|从这开始你是不是老了一点}]？]");
         outputText("[pg]他慢慢地从树桩上站起来，向你走来。[say:现在，我没有什么细则可以炫耀，但我真的希望你能在这个时刻给我一些可爱的绝望。]尽管你努力想举起你的[weapon]，但你根本无法让你的四肢做任何事情。恶魔继续靠近。");
         outputText("[pg][say:好吧，万物皆有终结。我的乐趣和你的生命恰好在这一点上重合了。]");
         outputText("[pg]你无法回答。当你试图说话时，你的下巴在和你作对，你终于意识到将要发生什么。你真的输了，你正在付出代价。");
         outputText("[pg][say:那么是时候了——恶魔应该得到他应得的。]");
         outputText("[pg]他的笑声在你的脑海中回荡，你的视线开始模糊。你感到一种奇怪的轻松，仿佛一切对你都不再重要，即使你感觉到一双肮脏的手指滑过你的脖子。你最后的念头是，你会想念你的女儿。");
         get_game().gameOver();
      }
      
      public function hikkiRiddle3Wrong() : void
      {
         clearOutput();
         outputText("[say:你不太懂逻辑，是吧？]当你给出你最好的猜测时，他嘲笑道。你疯狂地试图回想，找出你哪里做错了，但恶魔那乏味的声音打断了你的思绪。[say:不过，我真的得谢谢你。不是每个人都能撑到第三个，你刚才真的让我有点害怕了。对于这把老骨头来说，偶尔体验一下刺激是件好事，虽然我不确定你是否真的有机会。]");
         hikkiRiddleBadEnd();
      }
      
      public function hikkiRiddle3() : void
      {
         clearOutput();
         outputText("有点可怕，但他们把他切成了两半，你相当确定。你给出了答案，恶魔迅速耸了耸肩。早些时候那种近乎沉思的神情又回来了，如果你不知道的话，你几乎会说他很忧郁。");
         outputText("[pg]然而，过了一会儿，他似乎回过神来。[say:啊，好吧，做得好。我承认你粗鄙的凡人头脑可能不像这片土地上大多数可怜虫那样简单，但别高兴得太早。] 他吸了吸鼻子，扭了扭脖子，然后开始说最后一个谜语，拍打着大腿打着节拍。");
         outputText("[pg]\"[istart]高贵的王子无法决定该娶谁，");
         outputText("[pg-]所以与其苦思冥想该选谁，不如举办一场比赛，");
         outputText("[pg-]全世界的每个女孩都得到了一次机会——");
         outputText("[pg-]鼓起勇气，碰碰运气，赢得一场盛大的浪漫。");
         outputText("[pg-]一个有三个女儿和亲爱母亲的家庭");
         outputText("[pg-]都渴望爱情和天上的星星能给她们应得的回报。");
         outputText("[pg-]每个人都抽了签，没有人忘记只有一个人能赢，");
         outputText("[pg-]但每个人都不知道哪一个是中奖的签，所以开始交换。");
         outputText("[pg-]因为只有一张选票，只有一张，才能赋予王冠璀璨的光芒。");
         outputText("[pg-]亚麻色头发的母亲，与她那褐发大女儿交换，");
         outputText("[pg-]大女儿又与火红头发的妹妹交换——那个阴谋家；");
         outputText("[pg-]最平凡的女孩——乌黑的头发——欺骗了最小的妹妹；");
         outputText("[pg-]二女儿偷了她妈妈的，一个漂亮的小罪人。");
         outputText("[pg-]那么如果母亲抽中了赢家，谁将成为她所见一切的王后？[iend]\"");
         menu();
         addNextButton("母亲",hikkiRiddle3Wrong);
         addNextButton("大女儿",hikkiRiddleWin);
         addNextButton("二女儿",hikkiRiddle3Wrong);
         addNextButton("小女儿",hikkiRiddle3Wrong);
         addNextButton("询问多洛雷斯",hikkiAsk3);
      }
      
      public function hikkiRiddle2Wrong() : void
      {
         clearOutput();
         outputText("你开始试探性地回答，恶魔的冷笑并没有让你更有信心。当你完成时，他保持那个姿势了一会儿，脸上的笑容看起来非常虚假。最终，他开始向前倾身，说话非常慵懒。");
         outputText("[pg][say:好吧，我想这并不奇怪，但我本来希望能到第三个。] 他轻笑了一下。[say:你们这些凡人很少能达到我的期望，即使我如此慷慨地降低了标准。啊，但现在不是自怨自艾的时候。这是一场胜利！]");
         hikkiRiddleBadEnd();
      }
      
      public function hikkiRiddle2() : void
      {
         clearOutput();
         outputText("是“名字”，对吧？你想不出更合适的答案了，于是你给出了你的回答，恶魔皱起了眉头。");
         outputText("[pg][say:啊，好吧，我想该下一题了，] 他嘟囔着，承认失败时出人意料地没有多少抱怨。老恶魔似乎犹豫了一会儿，好像他接下来要做的事让他感到厌恶。但下一刻，他用一种强有力、轻快的语调开始说话，让你对最初的印象产生了一些怀疑。");
         outputText("[pg]\"[istart]哦，从前有个小伙子名叫塞拉洛");
         outputText("[pg-]他生活在一个无法无天的国度，");
         outputText("[pg-]他的话语总是奇妙地空洞，");
         outputText("[pg-]他的残忍也同样令人瞩目。");
         outputText("[pg]但有一天，年轻的塞拉洛遭遇了不幸，");
         outputText("[pg-]他得罪了一位冷酷无情的女王。");
         outputText("[pg-]他那过分的骄傲并未收敛，");
         outputText("[pg-]反而贬低了女王陛下的威望。");
         outputText("[pg]他受到了惩罚，这个傲慢的小伙塞拉洛，");
         outputText("[pg-]他的身体被不可挽回地残害。");
         outputText("[pg-]随后便是一场瓜分，");
         outputText("[pg-]他的每一部分都受到了同等的羞辱。");
         outputText("[pg]然后他在悲伤中短暂地沉沦，");
         outputText("[pg-]因为他的身体与头颅不再相连。");
         outputText("[pg-]告诉我，他们对塞拉洛做了什么，");
         outputText("[pg-]当他们带走他并将他击杀之时？[iend]\"");
         menu();
         addNextButton("绞死",hikkiRiddle2Wrong).hint("他们把他吊了起来。");
         addNextButton("刺穿",hikkiRiddle2Wrong).hint("他们把他刺穿了？");
         addNextButton("斩首",hikkiRiddle2Wrong).hint("他们砍下了他的头。");
         addNextButton("腰斩",hikkiRiddle3).hint("他们把他切成了两半。");
         addNextButton("询问多洛雷斯",hikkiAsk2).hint("向你的女儿寻求一些建议。");
      }
      
      public function hikkiRiddle1Wrong() : void
      {
         clearOutput();
         outputText("几乎在你刚说完这个词的时候，恶魔就开始大笑起来。他笑了很久，笑得很厉害，等他平静下来能再次说话时，你已经被激怒了。");
         outputText("[pg][say:哦，哦不！我以为我终于找到了一个合适的对手，但我没想到我错得这么离谱。连热身题都答错了！告诉我，你是不是只是一只特别受眷顾的猿猴，一直都在模仿人类说话？你只是运气好，看起来能听懂人话吗？] 他冷笑道。[say:好吧，我想最终也没那么幸运。]");
         hikkiRiddleBadEnd();
      }
      
      public function hikkiRiddle1() : void
      {
         clearOutput();
         outputText("你告诉恶魔你同意他定下的规则，作为回应，他发出一阵狂笑。");
         outputText("[pg][say:我就知道你是个不错的人！你们凡人大多连两分钟都撑不过去就会彻底堕落，但我从你的眼神中看到了一丝特别的光芒，我很高兴发现我对你的看法是正确的。不过听我唠叨了这么多——我们现在可是在玩游戏呢！]");
         outputText("[pg]他开始轻笑，但随后又以一种不可思议的突兀感停了下来，歪着头，似乎在思考着什么。在几秒钟的死寂之后——刚好足以让你产生一丝疑虑——他开始滔滔不绝地说出一个谜语。");
         outputText("[pg]\"[istart]属于你，却非你所挣得，");
         outputText("[pg-]因它你受赞誉，因它你遭唾弃。");
         outputText("[pg-]一瞬之间，它的价值或成或毁，");
         outputText("[pg-]但你并非生来就受制于其中一个。[iend]\"");
         outputText("[pg]停顿了一下。老恶魔在树桩上向后靠了靠，打量着你。[say:一个简单的谜语，给你热热身。你的答案是？]");
         menu();
         addNextButton("生命",hikkiRiddle1Wrong).hint("你生命本身。");
         addNextButton("名字",hikkiRiddle2).hint("你的名字。");
         addNextButton("岁月",hikkiRiddle1Wrong).hint("你的寿命。");
         addNextButton("孩子",hikkiRiddle1Wrong).hint("你的孩子们。");
         addNextButton("询问多洛雷斯",hikkiAsk1);
      }
      
      public function hikkiRest() : void
      {
         clearOutput();
         outputText("你告诉多洛雷斯，你需要一些时间才能带她去下一个目的地。毕竟，这样的旅行可能会很累，控制好节奏很重要。");
         outputText("[pg]她很好地接受了这一点，回以微笑并说道：[say:当然，[Father]。请花你需要的所有时间。我会等你下次觉得准备好的时候，所以当你适合继续时，请来找我。] 她把你拉进一个短暂的拥抱中，显然非常感激，甚至主动发起了接触。然而，她很快就退了回来，脸上带着一丝红晕。");
         outputText("[pg][say:咳咳。我们走吧？]");
         outputText("[pg]你们俩踏上回家的路，在安全地把她送回洞穴入口后分道扬镳。没有人在你身边，你回营地的路显得异常孤独。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function hikkiMenu() : void
      {
         clearOutput();
         outputText("你想带她去哪里？");
         menu();
         addButton(0,"营地",hikkiCamp).hint("带她看看你自己的家。").disableIf((saveContent.hikkiQuest & HQCAMP) > 0,"你已经做过这个了。");
         if(get_game().bog.marielle.marielleAvailable(false,false))
         {
            addButton(1,"玛瑞斯",hikkiMarielle).hint("你可以去拜访那位亡灵裁缝。").disableIf(!get_game().bog.marielle.marielleAvailable(true),"你觉得现在去不太合适。").disableIf((saveContent.hikkiQuest & HQMARI) > 0,"你已经做过这个了。");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,211) > 0)
         {
            addButton(2,"集市",hikkiBazaar).hint("还有哪里比这里更适合变得“世故”呢？").disableIf((saveContent.hikkiQuest & HQBAZR) > 0,"你已经做过这个了。");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,861) != 0)
         {
            addButton(3,"特尔阿德雷图书馆",hikkiLibrary).hint("看起来像她想去的地方。").disableIf((saveContent.hikkiQuest & HQTELA) > 0,"你已经做过这个了。");
         }
         if(get_game().volcanicCrag.coven.circeEnabled())
         {
            addButton(4,"喀耳刻",hikkiCirce).hint("她可能是你认识的知识最渊博的法师。").disableIf((saveContent.hikkiQuest & HQCIRC) > 0,"你已经做过这个了。");
         }
         if(saveContent.doloresSex > 2)
         {
            addButton(5,"野外性爱",hikkiSex).hint("这可能不是她正在寻找的确切体验类型，但你认为这会很有启发性。").disableIf((saveContent.hikkiQuest & HQOUTD) > 0,"你已经做过这个了。");
         }
         addButton(13,"完成",hikkiFinished).hint("结束这个任务并回家，不过你应该确定你已经准备好了。").disableIf(Utils.countSetBits(saveContent.hikkiQuest) < 1,"你还没带她去过任何地方。");
         if(button(0).visible)
         {
            button(0).disableIf(get_time().hours >= 21,"现在继续旅行有点晚了。");
         }
         if(button(1).visible)
         {
            button(1).disableIf(get_time().hours >= 21,"现在继续旅行有点晚了。");
         }
         if(button(2).visible)
         {
            button(2).disableIf(get_time().hours >= 21,"现在继续旅行有点晚了。");
         }
         if(button(3).visible)
         {
            button(3).disableIf(get_time().hours >= 21,"现在继续旅行有点晚了。");
         }
         if(button(4).visible)
         {
            button(4).disableIf(get_time().hours >= 21,"现在继续旅行有点晚了。");
         }
         if(button(5).visible)
         {
            button(5).disableIf(get_time().hours >= 21,"现在继续旅行有点晚了。");
         }
         if(button(6).visible)
         {
            button(6).disableIf(get_time().hours >= 21,"现在继续旅行有点晚了。");
         }
         if(button(7).visible)
         {
            button(7).disableIf(get_time().hours >= 21,"现在继续旅行有点晚了。");
         }
         if(button(8).visible)
         {
            button(8).disableIf(get_time().hours >= 21,"现在继续旅行有点晚了。");
         }
         if(button(9).visible)
         {
            button(9).disableIf(get_time().hours >= 21,"现在继续旅行有点晚了。");
         }
         if(button(10).visible)
         {
            button(10).disableIf(get_time().hours >= 21,"现在继续旅行有点晚了。");
         }
         if(button(11).visible)
         {
            button(11).disableIf(get_time().hours >= 21,"现在继续旅行有点晚了。");
         }
         if(button(12).visible)
         {
            button(12).disableIf(get_time().hours >= 21,"现在继续旅行有点晚了。");
         }
         if(button(13).visible)
         {
            button(13).disableIf(get_time().hours >= 21,"现在继续旅行有点晚了。");
         }
         setExitButton("休息",hikkiRest).hint("在继续前往下一个目的地之前休息一下。");
      }
      
      public function hikkiMarielleAnswer(param1:int) : void
      {
         clearOutput();
         switch(param1)
         {
            case 0:
               outputText("你轻声建议多洛雷斯谈谈她自己的兴趣——也就是阅读。毕竟，玛瑞斯看起来像个有教养的年轻女士，她肯定也喜欢书。");
               outputText("[pg][say:啊，是的，]你的女儿自信地说，很高兴回到了她的舒适区，[say:我简直不知道从何说起。你有什么最喜欢的书吗？哦，但我自己也很讨厌这个问题，总是很难选择。我想我最喜欢古典作品；那些老作家就是有[i:某种]你今天找不到的东西。哦，听我这样滔滔不绝。我相信你不需要我告诉你这些，你读过的书显然比我[i:多得多]。]");
               outputText("[pg][say:我……]玛瑞斯似乎有很长一段时间不知道该如何回应，她凝视着年轻的蛾女，直到最后说道：[say:我看得出，你确实是个……读书人。而且非常热忱。]然后她双手交叠，凝视着远方思考。[say:嗯，距离我上次拿起一本值得一提的书，也许已经过了太久了，但我确实对，啊，诗歌有些兴趣。不过我从未完全……被其“迷住”过。]");
               outputText("[pg][say:啊，所以，那些词……它们不是……]多洛雷斯看起来比你想象的要崩溃得多，她的眼神完全空洞了，而玛瑞斯则在一旁默默担忧地看着。不知过了多久，但令人窒息的气氛似乎没有任何改变。");
               outputText("[pg]看着你那近乎呆滞的女儿，你想知道自己到底哪里做错了。");
               break;
            case 1:
               outputText("你提起了缝纫这个话题——你至少知道玛瑞斯对这个话题很自在——希望能重新点燃对话。");
               outputText("[pg][say:嗯……]裁缝开口道，似乎对这样被当众提问感到有些不自在。[say:我，嗯……这是我的职业，但我想这也是显而易见的。而且我……确实喜欢它，是的，但如果我……嗯……自顾自地长篇大论，那就太冒昧了。我不想让你们感到厌烦。]");
               outputText("[pg][say:哦，不，一点也不麻烦！]多洛雷斯迅速回应道。[say:请讲，我一直想了解……那个……]");
               outputText("[pg][say:哦，嗯，好吧……呃……]玛瑞斯摆弄着她的许多根手指。[say:那么，你，啊……对制衣了解多少？我必须承认，我并不适合当老师。]");
               outputText("[pg][say:……不太了解，]你的女儿回答道，她的目光落在地上，双手摆弄着自己的裙子。看起来她没有什么要补充的了。");
               outputText("[pg][say:我明白了，]她说道，开始紧张地把玩起发梢。沉默持续了好一会儿，你开始不确定她还能不能找到别的话题。");
               break;
            case 2:
               outputText("当你提起死灵法术的话题时，多洛雷斯的眼睛亮了起来，但玛瑞斯似乎对这个提议不太高兴。");
               outputText("[pg][say:嗯，我，]裁缝开口道，[say:" + ((get_game().bog.marielle.saveContent.talks & get_game().bog.marielle.TALK_NECROMANCY) != 0 ? "我之前告诉过你，不是吗？" : "") + "我对那些，呃……维系我的奇术知之甚少，因此我恐怕无法帮助你，如果你想探寻这种奥秘的话。]");
               outputText("[pg]你对此无话可说，于是转向多洛雷斯。她脸上的笑容看起来有些勉强，你几乎能看到她眼底的齿轮在转动，试图理解这些话。[say:我，啊，对。]幸运的是，一股新的自信似乎支撑着她继续说下去。[say:我想不是每个人都能理解这么高深的魔法。]");
               outputText("[pg]然而，她立刻意识到了自己的失言。[say:我-我不是那个意思。只是——]她睁大了眼睛，看起来真的很惊慌。[say:……这是一个复杂的话题，]她终于说完，沮丧地低下了头。");
               outputText("[pg][say:没……没关系，我没有被冒犯到，]玛瑞斯向你的女儿保证，推了推眼镜，然后交叉起她那许多只手。[say:我无论如何也施展不了魔法。去，呃，探究它的深奥对我来说毫无益处。]");
               outputText("[pg]年轻的蛾女张开嘴想回应，但只是停顿了一会儿又闭上了。看来这场对话从一开始就注定要失败。");
               break;
            case 3:
               outputText("她们都有四只手臂；这是个共同点，对吧？这里肯定有话题可聊，于是你提起了这个话题。");
               outputText("[pg]裁缝只是困惑地看着你，但多洛雷斯却像溺水的人抓住救生圈一样，拼命地抓住了这个话题。[say:对-对！就是，嗯，我……]她犹豫了一下，但随后你几乎能看到她头顶亮起了一盏灯，眼睛向上闪烁。[say:哦，侧睡是不是很糟糕？它们总是戳到我的……或者，我是说，嗯……]多洛雷斯泄了气，闭上了嘴。");
               outputText("[pg][say:确实如此。]连玛瑞斯似乎也意识到了蛾女有多紧张，尽管这种洞察力对她帮助甚微。[say:幸好，我的……体质允许我将它们脱臼。]她张开下面那对手臂，但并没有像你们第二次见面时那样表演那个特技。多洛雷斯的眼睛睁大了一点，看起来确实很感兴趣，但她没有做出任何实质性的回应，于是，对话再次陷入了停滞。");
               outputText("[pg]也许你应该想一个更好的话题。");
               break;
            case 4:
               outputText("尴尬的沉默还在继续，但你没有做任何事去打破它。你不能替女儿去战斗；她[if (cor < 50) {需要自己学会如何进行这些交流|应该能够解决自己的问题}]。");
               outputText("[pg]但即便如此，很快这种沉默就开始变得有些令人痛苦了。每隔一会儿，两人中的一个就会瞥一眼另一个，有时甚至会张开嘴，但却没有更多的话题出现。");
               outputText("[pg]你开始觉得这从一开始可能就是个坏主意。");
         }
         outputText("[pg]然而，就在你快要失去希望的时候，你注意到玛瑞斯的目光在年轻蛾女的衣服上游移，她发出一声小小的[say:嗯]，脸上浮现出轻微的皱眉。显然是被她在那里发现的什么东西吸引了，她开始慢慢地绕到多洛雷斯身边，检查着布料，而蛾女则尴尬地僵立在原地。");
         outputText("[pg][say:这件衣服，]她对多洛雷斯说，并没有抬头看她，[say:请问，你是从哪里弄来的？]");
         outputText("[pg][saystart]啊，是的，嗯……这只是我在我们家一个旧房间里找到的。母亲大人[if (isfeminine) {[sayend]——她瞥了你一眼——[saystart][if (isnaked) {其实她们俩都是|我是说我的另一个母亲}，]}]不太喜欢穿衣服，所以我只是……自己找了点东西穿。[sayend]");
         outputText("[pg][say:我明白了。]裁缝后退了一步，交叉双臂陷入沉思。[say:请不要觉得被冒犯了，但这件衣服相当，呃……不合身。]");
         outputText("[pg]多洛雷斯精神一振，脸上的红晕消退了。[say:是这样吗？我想我从来没有想过这个问题……你怎么看出来的？]");
         outputText("[pg][say:裁缝的眼睛是很敏锐的。我可以吗？]她伸出手询问，年轻的蛾女微微点了点头。她的手指滑过你女儿衣服的布料，每一次擦过女孩肋骨的动作都让她越来越不舒服，她很快就找到了几处对她娇小身躯来说明显太宽的区域，并迅速将多余的布料聚拢起来作为示范。");
         outputText("[pg][say:我-我明白了，那个嗯……]她咽了口唾沫。[say:我完全明白你的意思了，所以……]她似乎不知道该怎么开口提出自己的要求，但玛瑞斯最终注意到了自己的手放在哪里，脸一红，猛地抽回手，好让她保留一点尊严。");
         outputText("[pg][say:哦！我，啊……抱歉，[if (silly) {我-我不是同性恋|我不是故意的]……]");
         outputText("[pg]一阵短暂的沉默，你有些担心对话又会冷场。然而，多洛雷斯还是克服了尴尬，问道：[say:那么……你能，嗯……帮我改改吗？]");
         outputText("[pg][say:当然！]玛瑞斯答应得有些太快了，声音都劈叉了。[say:我是说，当然。这不过是举手之劳。我只需要，啊……]");
         outputText("[pg][say:啊]——她意识到自己刚才做了什么，稍微结巴了一下，但还是继续说道——[say:你-你当然需要脱下裙子。嗯……你工作的时候，我能在哪里等一下吗？]");
         outputText("[pg][say:哦，你可以……]裁缝的声音渐渐小了下去，她转过身在箱子里翻找着，拿出一件和多洛雷斯身上那件非常相似的裙子。[say:嗯，这是，啊……]她没有说完，而是把衣服递给了多洛雷斯。[say:我不能让你……光着身子。]");
         outputText("[pg][say:哦，谢谢，这——]当裙子递到她手里时，她停顿了一下，惊叹不已。[say:啊，好柔软……]蛾女突然抬起头，回过神来。[say:是的，谢谢你，我会……换上的。但是，你介意转过身去吗？]她转头看向你。[say:如果可以的话，你也转过去。]");
         outputText("[pg]你们俩给了她一些私人空间，很快她就换下了旧裙子，把它递给了玛瑞斯。裁缝已经挑好了合适的线，并测量了你女儿的尺寸，这让她更加尴尬了，然后才开始工作。");
         outputText("[pg][say:马上就好。]");
         doNext(hikkiMarielle3);
      }
      
      public function hikkiMarielle3() : void
      {
         clearOutput();
         outputText("没过多久，玛瑞斯似乎就改好了裙子，把它递回给多洛雷斯，多洛雷斯再次让你们俩转过身去，好让她重新穿上。");
         outputText("[pg][say:怎么样？]你听到亡灵女孩问道，你转过身，看到多洛雷斯正用手撑开裙摆。[say:有什么不妥吗？如果有的话，请告诉我。]");
         outputText("[pg]她一言不发地松开手，快速转了个圈，展示着现在合身的裙子。[say:感觉……太棒了。比以前好多了。]她温柔地低头看着裙子，轻轻抚摸着布料。[say:我从来不知道合适的剪裁能带来这么大的改变。]她抬起头，微笑着说。[say:谢谢你，玛瑞斯。]");
         outputText("[pg]裁缝微微屈膝行礼，说道：[say:我的荣幸。一切都好吗？很好，很好……]她又仔细打量了一会儿裙子，绕着多洛雷斯走了几步，显然对自己的成果很满意。");
         outputText("[pg][say:嗯，]蛾女开口了，虽然还有些犹豫，但比之前少了几分胆怯，[say:有没有可能，啊……向你订购一件裙子？我以前没怎么关注过我的衣服，但看到这里的这一切，它……]她没有说完，而是用恳求的眼神看着玛瑞斯。");
         outputText("[pg][say:哦，当然，]玛瑞斯高兴地[if (silly) {搓着|握着}]双手说道。[say:我制作各种款式的女装，无论是定制的还是现成的，如果你有什么需要，尽管开口。]她停顿了一下。[say:不过，唉，这不会是，啊……免费的。]");
         outputText("[pg]多洛雷斯自信地回答：[say:哦，那不是问题。我母亲给了我一些宝石，我一直没机会用。]她停顿了一下，眨了眨眼。[say:那么，啊，我还能再见到你吗？]她说完，有些慌乱。你意识到这可能是她第一次问这样的问题。");
         outputText("[pg]玛瑞斯自己也花了一秒钟才回答，她看了看你，眨眼的频率有点太高了。[say:我……如果你愿意的话。你将，啊，非常受欢迎。多洛雷斯。]");
         outputText("[pg][say:太好了。[i:玛瑞斯]。]她在这里咯咯地笑了起来，知道她们终于合得来了，让你放下了许多担忧。你们三人互相道别，然后你终于带着女儿走出了神庙。");
         outputText("[pg]当你踏入温热的沼泽时，多洛雷斯转过头对你说：[say:哎呀，你早该告诉我你有一位这么敏锐的熟人。我不知道她是怎么知道那些……]她的声音渐渐小了下去，用探寻的目光凝视着远方，直到她注意到你还在看着她。[say:咳咳。好吧，那么，接下来去哪儿，[Father]？]");
         _temp_1.hikkiQuest |= HQMARI;
         cheatTime(2);
         doNext(hikkiMenu);
      }
      
      public function hikkiMarielle2() : void
      {
         var answer4:int;
         var _g4:DoloresScene;
         var answer3:int;
         var _g3:DoloresScene;
         var answer2:int;
         var _g2:DoloresScene;
         var answer1:int;
         var _g1:DoloresScene;
         var answer:int;
         var _g:DoloresScene;
         clearOutput();
         outputText("你到达了神庙的内部，看到玛瑞斯坐在她的桌子前，弓着身子看着铺在桌面上的一件衣服，显然没有注意到你们的进入，因为她正在一丝不苟地处理衣服的下摆。");
         outputText("[pg]多洛雷斯似乎对她不寻常的外表很感兴趣，但她也没有采取任何行动，所以看来你必须打破僵局。你牵着女儿的手，把她带到裁缝面前，直到你清了清嗓子，裁缝才抬起头来。");
         outputText("[pg][say:嗯？] 她猛地从工作中抬起头来，手里紧紧抓着针一秒钟，然后放松下来把它放下。[say:哦，是你啊，[name]。啊……欢迎，] 玛瑞斯带着一丝不确定说道，她的目光落在了你身边的年轻蛾女身上。");
         outputText("[pg]你迅速介绍了多洛雷斯，解释说她是你的女儿，" + (!get_player().hasKeyItem("Bundle of Moth Silk") ? "就是你曾经把她的丝带给玛瑞斯的那个" : "即使你们俩看起来不太像") + "。就多洛雷斯而言，她并没有对你的描述补充太多，你觉得你能从她身上捕捉到一丝紧张。当你讲完后，她走上前，微微低头，说道：[say: [day]好。你好，嗯……玛瑞斯？]");
         outputText("[pg]这位裁缝似乎有些困惑，但很快就想起来从凳子上跳起来，行了一个利落的屈膝礼。[say:很，嗯，荣幸……多洛雷斯。] 她重新站直，把一缕掉落的头发别在耳后。[say:所以这是你的女儿，[name]？什么风把你们吹来了？]");
         outputText("[pg]令人惊喜的是，多洛雷斯在你被迫开口之前就说话了。[say:我们，啊，正在旅行。[Father]带我四处看看，因为我觉得是时候让我变得更见多识广了。] 多洛雷斯高傲地吸了吸鼻子，扬起下巴，但玛瑞斯只是给了她一个试探性的微笑并点了点头。[say:[He]建议我们来这里。来看看你。] 她停顿了一下，显然不知道该怎么继续。[say:所以你……住在这里？]");
         outputText("[pg][say:我明白了。我，啊……确实，是的。]玛瑞斯尴尬地动了动。[say:目前这确实是我的居所。]");
         outputText("[pg][say:这样啊……那，嗯……你……喜欢这里吗？]多洛雷斯已经脸红了。也许你来之前应该先练习一下怎么闲聊。");
         outputText("[pg][say:我……想是的。是的。确实如此。这是一处……极其宁静的圣地。]");
         outputText("[pg][say:是的，一处圣地，当然……]");
         outputText("[pg]在这最后一句话之后，沉默开始蔓延，两个女孩都没有再说什么。看来你可能得介入并自己提出一个话题了。");
         menu();
         _g = this;
         answer = 0;
         addNextButton("书籍",function():void
         {
            _g.hikkiMarielleAnswer(answer);
         }).hint("也许多洛雷斯可以分享她对文学的热爱？");
         _g1 = this;
         answer1 = 1;
         addNextButton("缝纫",function():void
         {
            _g1.hikkiMarielleAnswer(answer1);
         }).hint("玛瑞斯可能会很乐意谈论她的兴趣。");
         _g2 = this;
         answer2 = 2;
         addNextButton("死灵法术",function():void
         {
            _g2.hikkiMarielleAnswer(answer2);
         }).hint("也许玛瑞斯可以告诉多洛雷斯一些导致她目前状态的过程？");
         _g3 = this;
         answer3 = 3;
         addNextButton("四只手臂",function():void
         {
            _g3.hikkiMarielleAnswer(answer3);
         }).hint("好吧，这是她们的共同点，对吧？");
         _g4 = this;
         answer4 = 4;
         addNextButton("什么也不做",function():void
         {
            _g4.hikkiMarielleAnswer(answer4);
         }).hint("你没有什么能填补这场对话的空白。");
      }
      
      public function hikkiMarielle() : void
      {
         clearOutput();
         outputText("当你们靠近沉没的神庙时，你开始向多洛雷斯简要介绍你们在那里会遇到什么——以及谁。虽然你在解释时受到了周围成群蚊子的严重干扰，但它们似乎奇怪地完全无视了蛾女。昆虫之间某种团结？");
         outputText("[pg]无论如何，你设法告诉了她关于玛瑞斯的职业和凡人身份。你的女儿在听到死灵法术时精神一振。");
         outputText("[pg][say:我不知道还有这种事。有意思……]");
         outputText("[pg]嗯，你很高兴至少有一件事引起了她的好奇心。你们俩走下通往神庙的石阶，凉爽、平静的空气已经拂过你的[skindesc]。");
         doNext(hikkiMarielle2);
      }
      
      public function hikkiLibrary() : void
      {
         clearOutput();
         outputText("穿越沙漠的旅途谢天谢地没有遇到任何伏击，虽然有点无聊，所以你开始在路上给女儿讲述特尔阿德雷的事情。没过多久，你感觉到了屏障的明显迹象，随后便穿过了它，那座隐藏的城市立刻映入眼帘。与守门卫兵快速确认多洛雷斯可以进城后，你们便进去了，准备好好欣赏这里的所有风景。");
         outputText("[pg]但你心里有特定的目的地，所以，等她最初的好奇心平息下来后，你告诉女儿镇子深处有一座图书馆，而且规模惊人。你刚说出前半句她就被吸引了，等听到后半句，无论她怎么试图掩饰，都掩盖不住那种欣喜若狂。");
         outputText("[pg]你带着这只蛾女继续前行，引导她安全地穿过拥挤的街道。她引来了许多目光，可能是因为她是个生面孔，但她完全没有注意到，似乎沉浸在自己的世界里。这个地方与世界上的其他地方截然不同，所以你也不能怪她。矗立的建筑、幸福的家庭、一个[if (silly) {(令人作呕的)|充满生机的}]社区——所有这些你觉得她以前都没见过。");
         outputText("[pg]最后，你们来到了图书馆所在的宏伟高塔前。多洛雷斯伸长脖子向上看，当她的目光到达塔顶时，还稍微踉跄了一下。她太着迷了，甚至都没有朝门口走去，直到你拉了拉她的手臂，她才跟着你走进去。但很快，你们俩就进入了特尔阿德雷的图书馆，置身于杂乱堆放的书籍和卷轴之中。");
         outputText("[pg]图书管理员奎恩一如既往地待在这里。他的头耷拉着，看起来快要睡着了，但当你的女儿走近时，他的眼睛猛地睁开，带着一丝惊讶。看到她非人的特征后，他立刻皱起了眉头[if (isfluffy) {，当他转向你时，眉头皱得更深了|，当他看到你时，表情并没有太大变化}]。");
         outputText("[pg][say:干嘛？]他说道，语气中充满了恶意。");
         outputText("[pg][say:打、打扰一下，]她开口道，先前的兴奋已经完全变成了紧张，[say:那个，嗯，我想知道，啊，图书馆是不是……]她的话音渐渐弱了下去，在他疲惫的注视下萎缩了。");
         outputText("[pg][say:所以呢？你想“仔细阅读”我的收藏？我可以向你保证，这里没有能迎合[i:你们]这种人兴趣的东西，]他反驳道。[say:而且大多数你们觉得稍微有点刺激的书……]他移开视线。[say:……书页都已经粘在一起了……]");
         outputText("[pg]蛾女只是困惑地眨了眨眼。[say:嗯，我，啊，不能评价你通常的顾客的卫生习惯，但我[i:可以]向你保证，我绝不会那样破坏一本书。]她继续说道，语气变得更加自信和真诚。[say:我能看出来，这个地方花费了大量的时间和精力；这非常值得称赞。]");
         outputText("[pg]他的表情稍微缓和了一点。[say:好吧，图书馆在可预见的未来不对公众开放。我为什么要为你破例？]");
         outputText("[pg]她的目光落到地板上。[say:我想确实没有什么真正的理由。]沉默持续了很长时间，图书管理员刻意不看你们俩的方向。最后，多洛雷斯抬起头，恋恋不舍地瞥了一眼书架。[say:只是这里比我们家里的好太多了……]");
         outputText("[pg][say:家里？]他声音中的疲惫立刻消失了，猛地抬起头。[say:你是说你有一些收藏？]");
         outputText("[pg]你的女儿有点慌乱，但还是设法回答了。[say:是的，嗯，虽然规模远不及这里，但我相信它在我的家族里已经保存了很长一段时间。我，啊，想这在现在这个时代一定很罕见……]");
         outputText("[pg][say:非常罕见，]他说道，比你见过的任何时候都要急切。[say:而且你说这些物品中有些可能来自入侵之前的很长一段时间？我非常有兴趣看看——]他突然停了下来，似乎意识到了自己的虚伪。[say:也就是说，也许我们应该，嗯……建立某种通信联系。让这个机会溜走简直是犯罪。]");
         outputText("[pg]他睿智地点了点头，从椅子上站起来，把多洛雷斯领到最近的书架旁。在接下来的半个多小时里，他概述了图书馆的总体组织和内容，期间还频繁地抱怨市民。有些内容你确实听不懂，但你的女儿全程都在全神贯注地听着。两人相处得出奇地好；在某种程度上，这几乎让人感到温暖。");
         outputText("[pg]但最终，你知道是时候离开了。你几乎不得不把多洛雷斯拖走，她和那个脾气暴躁的图书管理员都不想就此打住。你终于把她拉出了门，尽管即使只有你们两个人，她也还在兴奋地喋喋不休。");
         outputText("[pg]你们快回到城门时，她突然停下来，说道：[say:啊，[Father]，你一定要找个时间带我回来！还有很多可以讨论的，而且他提出了交换的可能性。]");
         _temp_1.hikkiQuest |= HQTELA;
         cheatTime(1);
         doNext(hikkiMenu);
      }
      
      public function hikkiLater() : void
      {
         clearOutput();
         outputText("你告诉多洛雷斯，虽然你并不反对这个想法，但现在不是合适的时候。你需要更多的时间来准备，然后才能帮助她。");
         outputText("[pg]她相当平静地接受了这一点，自信的表情没有丝毫动摇。[say:很好，当你觉得准备好承担这样的任务时，请告诉我。]");
         outputText("[pg]说完，她回到座位上，满怀期待地看着你。");
         doNext(doloresTalkMenu);
      }
      
      public function hikkiHear() : void
      {
         clearOutput();
         outputText("多洛雷斯真的想让你和他谈谈吗？好吧，你觉得你可以试试。当你告诉他你要谈谈时，他脸上的笑容足以让你后悔这个决定，但还没等你考虑其他选择，那令人作呕的声音就再次响起了。");
         outputText("[pg][say:很好，很好，太棒了。似乎现在每个人都只想要即时的满足感，但有些事情是值得细细品味的……]恶魔重新坐回树桩上，把手杖横放在膝盖上。你瞥了一眼你的女儿，但她依然一声不吭。他似乎不会犯下放走她的错误，所以你把注意力转回你的对手身上。");
         outputText("[pg]他的眼皮再次耷拉下来，但你依然能感觉到隐藏在下面的掠食意图。[say:那么，我们来玩个游戏。]游戏？[say:一个简单的游戏，猜谜游戏！来吧，你肯定听过很多次这个故事了。难道你不记得小时候躺在床上瑟瑟发抖，听你母亲讲一个迷失在森林里的小[boy]，必须想方设法逃出狡猾恶魔魔爪的故事吗？]他大笑着，你等他停下来。");
         outputText("[pg][say:啊，很好，我想我们直接进入正题吧。这是我们游戏的规则]——他伸展双臂，深吸一口气，然后叹息着呼出——[say:这样就没人能说这不公平了。首先，我只和你一个人玩。]他瞥了一眼你的女儿。[say:好吧，我已经解决了那个问题，但我只听你的答案。其次，说话要大声、清晰。我会以我听到的为准，我发誓，所以别想说你其实[b:想]说的是别的——哦，拜托，你就不能让我收回这一次吗，这真的是个无心之失，真的！]他皱起眉头。[saystart]我[b:讨厌]那种人。");
         outputText("[pg]现在，进入正题。你没有时间准备，而且书里的谜语我大多都听过了，所以我不会强迫你自己想出任何谜语。不，我真的是个善良的老家伙，所以我只负责出题。哦，你问有几个[sayend]——你没问——[say:哎呀，当然是三个。总是三个，没错，[sir]。]");
         outputText("[pg]那么，如果你猜错了一个会发生什么？恶魔起初没有回答，而是选择用肮脏的指甲剔牙。侧面传来的触感让你吓了一跳，但当你意识到那只是多洛雷斯时，你平静了下来。她用四只手臂紧紧抱住你的一只手臂，带着毫不掩饰的仇恨盯着恶魔。");
         outputText("[pg][say:嗯，你的灵魂，]他终于说道。[say:我想这并不是特别有创意，但它们实在是太美味了。通常，我们必须通过稍微更肉欲的方式来进行，但是]——他意味深长地看了你一眼——[say:通过同意和我玩这个小游戏，如果你输了，你就放弃了你的灵魂石的权利。]");
         outputText("[pg]如果你赢了呢？");
         outputText("[pg][say:你可以自由离开，]他举起双手，做出一个安抚的姿势，但那腐烂的指甲让这个动作的效果大打折扣。[say:你再也不用看到我了，你亲爱的小女儿也可以随心所欲地用她那难听的声音刺穿你的耳膜。所以，事情就是这样。你的答案是？]");
         outputText("[pg]你权衡着你的选择。多洛雷斯向你点点头，给了他一个意味深长的眼神，把手放在你的[weapon]上。");
         menu();
         addNextButton("同意",hikkiRiddle1).hint("玩他那恶心的游戏。");
         addNextButton("战斗",hikkiFight).hint("你不是那种会和恶魔讨价还价的人。");
      }
      
      public function hikkiGuessNameCheck() : void
      {
         clearOutput();
         if(guessedName)
         {
            outputText("你觉得他不会再忍受你继续猜下去了，所以你给出了你最有把握的答案。");
         }
         else
         {
            outputText("你鼓起勇气，告诉恶魔你知道他的名字。他试图装出无动于衷的样子，但你很容易就捕捉到他在听到这个声明时眉毛挑了一下。");
            outputText("[pg][say:真的吗？我表示怀疑，但告诉我，你那猿猴般的大脑又幻想出了什么？]");
            outputText("[pg]作为回答，你给出了你的猜测。");
         }
         if(getInput().toLowerCase() == "allocer")
         {
            outputText("[pg]恶魔垂下头，颓然瘫坐回树桩上，彻底被击败了。然而，你仍然心存疑虑。真的有那么容易吗？他就这样放弃了？");
            outputText("[pg][say:不，]他轻蔑地冷笑了一声，[say:我没有放弃。而且你的发音也不对。但是，规矩就是规矩。你可能觉得我会喜欢这些规矩，但实际上，我现在只想拧断你的脖子。]他几乎是在喘着粗气，你可以看到他那不自然的、鼓胀的肌肉在束腰外衣和斗篷下萎缩。[say:规矩……]");
            outputText("[pg]这到底是谁的规矩？这可不像是恶魔的正常行为。");
            outputText("[pg][say:别管那个了。那个冷酷的婊子甚至可能听到我们说话，一直传到这里。]他的眼皮开始下垂得那么低，你几乎以为他要融化了，但他的声音却没有失去任何力量。[say:现在，你[i:赢了]，]他像吐出毒液一样吐出这个词，[say:这赋予了你某些权利。只要你知道该怎么要求……]");
            _temp_1.hikkiQuest |= HQNAME;
            hikkiWinMenu();
         }
         else if(guessedName)
         {
            outputText("[pg]他做了个鬼脸，看到他的牙齿让你不由自主地打了个寒颤。[say:我早就知道你是个可怕的粗人，但你还是不知怎么地冒犯了我的敏感神经。我想我应该祝贺你。不过我可不会留下来听你祝贺。]");
            outputText("[pg]老恶魔突然向后倒去，你惊讶得来不及反应，他就倒在了树桩后面。当你冲过去看他去了哪里时，除了发现一堆肮脏的破布外，什么也没有。稍微靠近一点检查，发现那是他穿过的衣服，不过你不敢去碰它们。");
            outputText("[pg]看来除了继续前进别无他法，于是你转向你的女儿，提出了这个建议。她点点头，你们俩就离开了这个可怕的地方。");
            doNext(hikkiEnd);
         }
         else
         {
            outputText("[pg]他冷笑了一声。[say:你想对我耍什么花招？[if (iselder) {你自己应该知道，我们这个年纪的人经不起惊吓|我发誓，现在的年轻人真是不懂得尊重，这样吓唬我}]……呸！]恶魔稍微挺直了身子。[say:如果你继续这么粗鲁，我不明白我为什么要再跟你多待一秒钟。]");
            outputText("[pg]他翘起鼻子，但还没有要离开的意思……");
            menu();
            addNextButton("再猜一次",hikkiGuessName);
            setExitButton("返回",hikkiRiddleWin);
            guessedName = true;
         }
      }
      
      public function hikkiGuessName() : void
      {
         clearOutput();
         outputText("你的猜测是什么？");
         doNext(hikkiGuessNameCheck);
         genericNamePrompt();
      }
      
      public function hikkiFinished() : void
      {
         clearOutput();
         outputText("好吧，这差不多涵盖了你想带女儿去的所有地方。你转向她，告诉她你已经没有主意了。她给了你一个" + (Utils.countSetBits(saveContent.hikkiQuest) == 1 ? "温柔的" : "灿烂的") + "微笑。");
         outputText("[pg][say:" + (Utils.countSetBits(saveContent.hikkiQuest) == 1 ? "嗯，即使我们只去了一个地方，" : "你带我看了这么多，而且") + " 我真的很感激你为我做这些。看到我家外面的世界……比我预想的还要有启发性。] 她的嘴角上扬，一只手若有所思地摸着脸颊，而其他的手则在摆弄她的裙子。");
         outputText("[pg]现在没有别的事可做了，所以你们俩动身返回她的家。当周围的环境变得模糊时，一种舒适的沉默笼罩着你们。沼泽地里弯曲的树木和冒泡的淤泥从你们身边经过，但你的女儿完全占据了你的思绪。她的步态，或者她的举止，或者你也不知道到底是什么，但无论如何，她确实成长了，以某种方式。");
         outputText("[pg]当她打破沉默时，你几乎吃了一惊。[say:我只是很惊讶我有多喜欢它。嗯，我想我们可以把这归功于你的深谋远虑，[Father]。真的，我不知道没有你我该怎么活下去，而且……我想我真正想说的是谢谢你。] 她对着你微笑，这次是全心全意的，那份温暖融化了你的心。");
         outputText("[pg][say:啊，不过我会很乐意重新安顿下来的。无论这有多好，我想我已经看到了我目前需要看到的一切。在外面走走真的让我更加感激家里的舒适。]");
         outputText("[pg]嗯，你不太确定她是否已经看到了所有东西。毕竟，你甚至没有遇到一个恶——");
         outputText("[pg][say:哦，你好，旅行者！]");
         outputText("[pg]你转过头，立刻准备好你的[weapon]——却发现你面前的小路上只有一个不起眼的老人。他的皮肤看起来极其干瘪和布满皱纹，就像古树的树皮，他的脸下垂得厉害，你甚至看不出他的眼睛是否睁开。长长而浓密的胡须从他的脸上垂下，一直延伸到他穿着的单调束腰外衣上。一根手杖和旅行者的装备构成了他的全部财产，尽管他拥有的一切看起来都过了好几年的鼎盛时期。");
         outputText("[pg][say:啊，看到[if (iselder) {和我同龄的人|这么新鲜年轻的面孔}]，对我这把老骨头有好处。现在很少有人走这条路了，我已经很久没有和人聊天了。] 一只干瘪的手举起，做了一个打招呼的手势，你注意到他的指甲很脏，参差不齐，而且不修边幅。[say:你介意陪[if (iselder) {一个老伙计|一个老头子}]聊几分钟吗？]");
         outputText("[pg]他靠在一个树桩上，没有向你移动的迹象，所以紧张气氛稍微缓和了一些，但你无法摆脱那种感觉，这里有些非常不对劲。他从哪里来？他为什么要在树林中间等在这里？");
         outputText("[pg]他并没有生气，只是咧嘴笑了。他的牙齿发黄，看起来奇怪地黏糊糊的。[say:好了，好了，[if (iselder) {像我们这样的人难道不应该团结在一起吗|这是对待长辈的态度吗}]？我想现在信任是很难赢得的，但我只是想找人随便聊聊。]");
         outputText("[pg][say:你-你是恶魔吗？] 你的女儿向前迈出一步问道。她的手在身前紧张地互相搓着，但她的眼神看起来很坚定。还没等你开口，那人笑了一声，回答道。");
         outputText("[pg][say:你不知道问这种问题有多失礼吗？哎呀，现在的孩子真是不懂规矩。你叫什么名字，小丫头？]");
         outputText("[pg]你还没来得及阻止，这只年轻的蛾女就鲁莽地回答道：[say:多洛雷斯，]她的眼中充满了挑衅与骄傲。[say:那你打算报上你的名字吗？]");
         outputText("[pg]老人从树桩上缓缓站起，发出一阵悠长而空洞的轻笑。他的动作显得笨拙且僵硬，但在你眼前，他的身体某些部位开始不自然地隆起。他的身形发生了微妙的变化，现在看起来既魁梧又瘦长，四肢相对于躯干来说显得过分修长。[say:当然不！]他用油腻的手指向后梳理着稀疏的头发，当他的手收回时，你看到了一对令人不寒而栗、向后弯曲的炭黑色犄角。[say:那样就太公平了。]");
         outputText("[pg]还没等她反驳，他的眼皮以惊人的速度抬起，露出了两颗几乎要从眼眶里凸出来的恶心眼球。他打了个响指，她痛苦地叫了一声，随后便完全僵住了。你正准备冲上前去，她却突然双膝跪地，双手紧紧捂住喉咙。");
         outputText("[pg]你一把将女儿抱在怀里，带着她迅速远离那个恶魔。你完全不知道她遭遇了什么，但好在她的恐慌并没有持续太久。她眨了眨眼，揉了揉喉咙，然后把一只手放在你的胸口安抚你，示意你给她留点空间。你照做了，然后问她怎么了。她看着你，张开嘴，却发不出任何声音。她对此感到非常恼火，又试了一次，做出了尖叫的口型，但依然毫无声响。");
         outputText("[pg]真奇怪。你们俩似乎得出了同样的结论——她开始指着自己的喉咙，在空中比划出一个“x”的手势，而你则向她保证你明白发生了什么。确认了她（相对）安全后，你意识到你忽视那个恶魔的时间可能有点太长了。");
         outputText("[pg][say:你们完事了吗？很好，我最讨厌傲慢的小鬼插手大人的事情……]");
         outputText("[pg]现在你直视着他的眼睛，那双眼睛真是令人作呕。它们呈现出一种病态的黄褐色，边缘布满了血丝，瞳孔是不规则的斑块，就像墨迹一样。最糟糕的是它们似乎燃烧着一种令人不安的能量。那不是什么物理上的东西，但你能感觉到其中有一种野兽般的气息，就像你正被一只秃鹫盯着一样。");
         outputText("[pg]愤怒与厌恶交织在女儿的脸上，你也不打算再发善心了，于是你[if (hasweapon) {举起你的[weapon]|捏得指关节咔咔作响}]，带着杀意开始逼近。");
         outputText("[pg][say:啊，等一下，]他说道，声音依然带着令人毛骨悚然的安抚感。[say:现在还不需要动武。我们迟早会走到那一步的。]他笑了笑。[say:如果你愿意的话，我还是想聊聊。]");
         outputText("[pg]你现在可以冲上去揍他，也可以听听他要说什么。多洛雷斯轻轻拽了拽你的胳膊，摇了摇头。");
         menu();
         addNextButton("战斗",hikkiFight).hint("你不是那种会和恶魔讨价还价的人。");
         addNextButton("听他说",hikkiHear).hint("你在这里需要谨慎，你还不知道他有什么能耐。");
         addNextButton("逃跑",hikkiRun).hint("赶紧离开这里。");
      }
      
      public function hikkiFightWin() : void
      {
         clearOutput();
         outputText("恶魔踉跄了一下，似乎又恢复了些许力气，但随后重重地倒在他最初出现的那根树桩上。在粗重的喘息声中，他用恶毒的眼神看着你，开口说道。");
         outputText("[pg][say:好吧……我想……你赢了……胜者为王。]他冷笑着，但当他" + (get_monster().get_HP() < 1 ? "浑身是血" : "色眯眯地盯着你") + "时，他那参差不齐的牙齿就没那么吓人了。[say:你想从我这里得到什么？]");
         get_combat().cleanupAfterCombat();
         hikkiWinMenu();
      }
      
      public function hikkiFightLoss() : void
      {
         clearOutput();
         outputText("你瘫倒在地，四肢再也不听使唤。你大声呼喊，拼命命令它们动起来，但毫无反应。你只能眼睁睁地看着老恶魔长叹一声，重新在树桩上坐下。当你看到多洛雷斯也倒在你身边，完全失去行动能力时，你仅存的希望也迅速破灭了。");
         outputText("[pg][say:啊，用粗暴的方式做事总是不那么令人愉快，但我不能说活动一下筋骨感觉不好。]他咕哝着，微微发抖，闭上眼睛，似乎在沐浴着[sun]光。");
         outputText("[pg]他没有看你——这可能是你唯一的机会。如果他在休息，你也要休息。你会恢复体力，你会重新拿起你的[if (hasweapon) {weapon|standing}]，你会打败他。你不在乎要承受什么痛苦，只要你能活下来，这就——但是不，他已经站起来了。他在活动筋骨，嘴里嘟囔着，但还是太早了，你现在什么也做不了。你希望、祈求、祈祷，但他却带着轻松的微笑向你走来。");
         outputText("[pg][say:哦，别担心。[if (iselder) {你已经活了很久了|很多人都倒在了你现在的位置}]，死在这里并不丢人。而且你还养育了这么好的一个女儿。]他的目光扫过她无助的身躯，你整个人都燃烧起来。[say:我以后会为此感谢你的，你大可放心。]");
         outputText("[pg]还没等你做出任何反应，恶魔已经扑到你身上，双手死死掐住你的脖子，把你提了起来。你无法呼吸，甚至无法思考，他残忍的笑声在你耳边回荡。随着你的意识开始模糊，他的嘴巴张得更大了，歪斜的牙齿闪烁着寒光。");
         get_game().gameOver();
      }
      
      public function hikkiFight() : void
      {
         clearOutput();
         outputText("你不太确定她是不是想让你和他谈谈，但如果是这样的话，你以后得教教她不要再上这种明显的当了。");
         outputText("[pg]你捂住耳朵，硬起心肠，举起你的[weapon]向恶魔逼近。他的手慢慢垂下，眼神变得异常空洞，似乎在盯着两个不同的方向，但都不是你所在的方向。");
         outputText("[pg][say:哦？看到你脸上那副松弛粗鄙的表情，我就该知道你有多野蛮。像你这样的白痴确实该吃点苦头，但我本来还指望你能来场精彩的赌局呢。]他张大嘴巴发出一阵毫无笑意的狂笑，你能看到他那破碎腐烂的牙齿比正常的要长得多。[say:不过，我还是能从你身上找到乐子的。]");
         outputText("[pg]他把手杖扔到一边，以惊人的速度向你冲来！你举起[weapon]迎击，眼角余光瞥见多洛雷斯在你身后腾空而起。");
         set_monster(new RiddleDemon());
         startCombat(get_monster(),true);
      }
      
      public function hikkiEnd() : void
      {
         clearOutput();
         doloresReset();
         outputText("你们俩疲惫地踏上了回女儿家的路。多洛雷斯被这整件事折腾得筋疲力尽，才走了几分钟就开始摇摇晃晃，于是你转过身，示意她跳上来。年轻的蛾女对不得不这样做感到有些尴尬，但当你用手臂托住她的腿时，她并没有抱怨。");
         outputText("[pg][say:……谢谢你，[Father]，]她说道，因为疲惫，说话有些含糊不清。[say:我不能说那是一次完全愉快的经历，但……那绝对是值得的。]你们俩在回去的路上天南海北地聊着，你能感觉到你和女儿之间的羁绊正在加深。一种温暖的感觉弥漫在你的胸膛，虽然你的身体感觉有些疲惫，但你的精神却轻如鸿毛。");
         outputText("[pg]她轻声低语，声音小得你几乎听不见：[say:我……真的很爱你，[Dad]。] 你能感觉到她在你怀里开始放松，四肢抽动了几下，似乎在与睡意抗争。最后，她的头依偎在你的脖颈处，你很快就听到了她靠在你[skindesc]上平稳的呼吸声。这样就好；她理应好好休息一下。");
         outputText("[pg]接下来的几分钟路程在沉默中度过，但这并不让人觉得不舒服。当你到达洞穴时，你松了一口气，过去几个小时的重担似乎一下子全压在了你身上。但你还有工作要做，所以你打起精神走了进去。西尔维娅立刻迎了上来，似乎对你的出现感到担忧，但你把一根手指放在唇边，指了指你背上熟睡的女孩。她看起来很好奇，但一言不发，于是你指了指后面的走廊。");
         outputText("[pg]她了然地点点头，然后露出温暖的微笑，帮你把女儿抱到床上，并在你退后时为她盖好被子。你们俩又逗留了一会儿，然后退到主房间，你开始讲述你旅途中的经历。西尔维娅饶有兴趣地听着，你最终把故事讲到了深夜……");
         _temp_1.hikkiQuest |= HQDONE;
         saveContent.doloresProgress = 17;
         cheatTime(23 - get_time().hours);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function hikkiDone() : Boolean
      {
         return (saveContent.hikkiQuest & HQDONE) > 0;
      }
      
      public function hikkiDiscover() : void
      {
         clearOutput();
         outputText("你正在思考接下来要问他什么，这时你感觉到有人在拉你的胳膊。你转过头，看到多洛雷斯正坚持地盯着你。她把头偏向一边，于是你跟着她走到不远处，她开始低声说话。");
         outputText("[pg][say:有些奇怪的事情正在发生，]她说，但这对你来说也很明显。[say:嗯，正如你指出的那样，他似乎受到某些规则的约束。我不能确切地说出原因，但这不重要——很明显，他被迫以某些方式行事，我认为我们可以以某种方式利用这一点。]");
         outputText("[pg]她的想法听起来很有希望，但你问她到底打算如何付诸行动。");
         outputText("[pg][say:他的真名。他显然在试图隐藏它，所以如果我们能想办法弄清楚，我想肯定会发生一些他不乐意看到的事。]她轻哼了一声。[say:我不知道具体会发生什么，但只要能让那个垃圾不痛快，我一点也不在乎。]");
         outputText("[pg]这话说得好听，但你要怎么开始弄清楚他的名字呢？他似乎铁了心要对这件事守口如瓶。");
         outputText("[pg]你的女儿露出了罕见的调皮笑容。[say:啊，我想我已经知道该怎么做了。] 看到你的表情，她急忙澄清道，[say:不、不是答案本身，但我知道我们怎么才能找到它！我觉得那些谜语里藏着线索。我不知道为什么——也许是另一个“规则”？——但想想你问他关于谜语的事情时他是怎么说的。]");
         outputText("[pg]没错——他提到了关于“合同义务”的事情。所以，如果你理解得没错的话，他是被迫到处游荡，给人们提供这样打败他的机会？很奇怪，但你当然可以利用这一点。");
         outputText("[pg]你的女儿点点头。[say:我就是这么想的。我们只需要弄清楚线索是什么。嗯，第一个是关于名字的，所以这很明显。第二个的答案是关于把什么东西切成两半，最后一个是让你把什么东西换个位置……]");
         outputText("[pg]如果你能把这些都拼凑起来，似乎你应该就能猜出他的名字了。");
         doNext(hikkiTalk);
      }
      
      public function hikkiDecline() : void
      {
         clearOutput();
         outputText("你告诉多洛雷斯你不想做这种事。她一辈子都住在这里，没有理由去迎合这种一时兴起的念头。更不用说这种旅行会涉及的所有危险了；这根本不值得花费时间和精力。");
         outputText("[pg]虽然她自信的表情几乎没有动摇，但你可以从她的眼神中看出这伤害了多洛雷斯。[say:好吧，[Father]，我明白了。我只是……] 她的思绪渐渐飘远，随后是一阵漫长而尴尬的沉默。");
         outputText("[pg][say:我想花点时间考虑一下，] 她终于说完，声音中带着一丝颤抖。你觉得你无法再从她那里得到任何东西了，于是你回到了主房间，门关上时发出了一声沉闷的撞击声。");
         saveContent.doloresAngry = true;
         saveContent.doloresProgress = 17;
         get_game().mothCave.caveMenu();
      }
      
      public function hikkiContinue() : void
      {
         clearOutput();
         outputText("你告诉多洛雷斯你准备好继续你们的旅行了。");
         outputText("[pg][say:啊，好的，我们走吧！] 她说道，脸上带着灿烂的笑容。");
         hikkiMenu();
         setExitButton("返回",doloresTalkMenu);
      }
      
      public function hikkiCirceAnswer(param1:int) : void
      {
         clearOutput();
         switch(param1)
         {
            case 0:
               outputText("这种魔法过去确实引起过一些不可预知的问题，而且你现在对它的了解并不比当时多，所以最好不要让你的女儿走得太远。你告诉喀耳刻你一定会听从她的建议，女巫微笑了。");
               outputText("[pg][say:太好了。我就知道你能明白我话中的智慧；我只希望当时候到来时，你能准备好听从它。]");
               outputText("[pg]你们两人简短地点了点头，然后你把女儿叫了回来。");
               break;
            case 1:
               outputText("你其实并不怎么在乎这件事。毕竟，上次出现问题时，你都解决了，所以这有什么大不了的。你给了喀耳刻一个不置可否的回答，她的眼睛微微眯了起来。");
               outputText("[pg][say:我希望我能让你明白这件事的严重性。我不确定你是否知道，如果事情失控，潜在的后果会有多严重。]她哼了一声，但看到你的表情没有变化，便没有再说什么。又沉默了一会儿，女巫把你的女儿叫了回来。");
               break;
            case 2:
               outputText("你告诉她，她相当虚伪，考虑到她过去曾表示愿意超越其他现代巫师所认为的“正统”。你还特意提到了在她体内流淌的腐化。");
               outputText("[pg]她的眼睛立刻因愤怒而眯起，语气变得更具威胁性。[say:我这么说正是因为我所研究的东西。这不是虚伪，这是经验。此外，把我的实验和一个孩子在魔法上的初步尝试相提并论，如果不是愚蠢的话，那就是一种侮辱。]");
               outputText("[pg]她短暂地再次看向多洛雷斯，似乎意识到了自己对你的突然发作。女孩似乎没有注意到任何事情，或者即使她注意到了，她也隐藏得很好。喀耳刻深吸了一口气，再次面对你，她的面容现在平静了许多。");
               outputText("[pg][say:我无意挑战你作为[father]的权威，[name]，但请理解，她正在玩弄她根本无法完全理解的力量。而且就这一点而言，你也一样。]");
               outputText("[pg]你用一种尊重但探究的语气问她，她是否认为[i:她]能理解。她短暂地移开视线，然后深深地凝视着你的眼睛。");
               outputText("[pg][say:我……我不知道。但我知道在研究这些东西之前该如何保持适当的谨慎。]");
               outputText("[pg]你们两人之间的紧张气氛很快消散了，喀耳刻把你的女儿叫了回来。");
               break;
            case 3:
               outputText("你没有回答，只是面无表情地与她对视了一会儿。喀耳刻吸了吸鼻子，转过身去，你们两人就这样僵持了几个紧张的瞬间，直到你的女儿回头看向你们的方向。");
         }
         outputText("[pg]多洛雷斯飘了回来，她的眼神没有流露出任何她听到了刚才对话的迹象。[say:啊，谢谢你的推荐。我一开始还不确定是否——]");
         outputText("[pg]喀耳刻举起一只手打断了她，然后尽可能温柔地问道，[say:你到底是从哪里学到那种魔法的？]");
         outputText("[pg]蛾女眨了眨眼。[say:嗯……我，呃，在一本书里读到的。]看到喀耳刻眯起眼睛，她赶紧澄清道，[say:啊，是我在我们的藏书里找到的一本书。它是用一种我在其他地方都找不到的文字写的，所以我必须先尝试破译它。我相信我母亲说过那是[i:她]父亲的遗物之一……]");
         outputText("[pg]喀耳刻低下头，似乎在努力回忆什么。[say:难怪一个法师会把自己隐藏在偏远的地方，特别是如果他拥有这样的知识。你说你住在哪里来着？]");
         outputText("[pg][say:在、在沼泽里。一个洞穴。]");
         outputText("[pg]喀耳刻绞尽脑汁试图想起一些具体的事情，但很快就放弃了。[say:真奇怪，我不记得有任何关于法师隐居在沼泽的著作或日记。告诉我，你知道那个地区是否还有更多的书或类似的文物吗？]喀耳刻的眼中闪烁着好奇的光芒，她对更多知识的渴望显然压倒了她对这个女孩的克制。");
         outputText("[pg][say:嗯，其实也没有。或者至少，据我所知没有……] 她抬起头。[say:你还不知道吗？我还以为像你这样的人会一直在世界各地旅行……]");
         outputText("[pg]喀耳刻的表情很快变得焦虑起来。[say:嗯，这里有很多书可以读。一旦你安顿下来，就很难……离开了。现在的外面的世界可没那么舒服。]");
         outputText("[pg]你已经准备好迎接尴尬的沉默了，但令你惊讶的是，多洛雷斯很快就热切地做出了回应。[say:我完全明白你的意思。] 她瞥了你一眼。[say:我只是不明白为什么有些人可以一辈子都在外面闲逛，从不安顿下来。] 她的目光扫过装饰着女巫之家的各种书架、魔法神器和其他奇妙的物品。[say:如果我有一个这么好的地方，我绝对不会离开。而且这里也很干燥……]");
         outputText("[pg]说完这句话后，她变得有些沉默，但喀耳刻很快伸出一只手，放在了多洛雷斯的肩膀上。她犹豫了片刻，她的恐惧症仍然对她有些影响，但她鼓起足够的勇气，继续了这个动作。");
         outputText("[pg][say:嘿，魔法并不全是为了对周围的世界做些惊天动地的事情。有时候你只是……用它来让你的房间变得更好。] 喀耳刻叹了口气，意识到这听起来有多尴尬。[say:还有，不要把像你[father]这样的人说得太差。毕竟，那种人还是有用的。如果没有我们之中那些比较……古怪的人来帮我收集，我怎么能得到这么多书呢？]");
         outputText("[pg][say:对，] 多洛雷斯腼腆地笑着说。喀耳刻的表情似乎柔和了许多，虽然沉默持续了片刻，但一点也不觉得尴尬。最后，你的女儿转向你问道：[say:啊，[Father]，我们是不是该上路了？] 她的目光掠过女巫。[say:我不想太打扰……]");
         outputText("[pg]你在这里已经待了一段时间了，而且你知道喀耳刻是个比较注重隐私的人，所以这样也好。你向她道别，她甚至在挥手告别时，设法短暂地与多洛雷斯对视了一下。");
         if((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2675) & CorruptedCoven.BROUGHT_JEREMIAH_BACK) != 0)
         {
            outputText("[pg]你眼角余光注意到耶利米靠在墙边，依偎在两个书架之间。看到你的目光，他稍微精神了一点，举起一只手回应你的挥手。你的女儿对你为什么要向一个雕像挥手感到有些困惑，当她注意到雕像也向你挥手时，她就更困惑了，但你告诉她，你会在回家的路上向她解释。");
         }
         outputText("[pg]没有再多说什么，喀耳刻做了一个手势，你们俩瞬间就被传送回了峭壁。酷热直接向你袭来，让你已经开始怀念女巫飞地相对宁静的环境了。然而，多洛雷斯看起来一点也不沮丧，早些时候的笑容依然挂在她的脸上。");
         outputText("[pg][say:哦，真没想到像她那样的人还在这里……] 她转向你。[say:我只希望有一天我也能达到那种境界。]");
         outputText("[pg]她出人意料地拉着你短暂地拥抱了一下，但她的手臂很快就缩了回去，她脸上的红晕清楚地表明，不会再有进一步的讨论了。剩下的唯一一件事就是穿过这片被破坏的风景，向一个更宜人的地方跋涉。");
         cheatTime(2);
         _temp_1.hikkiQuest |= HQCIRC;
         doNext(hikkiMenu);
      }
      
      public function hikkiCirce2() : void
      {
         var answer3:int;
         var _g3:DoloresScene;
         var answer2:int;
         var _g2:DoloresScene;
         var answer1:int;
         var _g1:DoloresScene;
         var answer:int;
         var _g:DoloresScene;
         clearOutput();
         outputText("你把女儿拉进怀里短暂地拥抱了一下，然后转向喀耳刻，准备好好教训她一顿。但还没等你开口，多洛雷斯突然说话了，她的声音仍然有些颤抖。[say: 是——是你做的吗？不，当然是你做的，但是……]尽管她的脸上仍然刻着创伤，但你能看到那里燃烧着一种激情，一种让她在经历了一切之后仍然能继续前进的激情。[say: 那真是……太神奇了！天哪，我不知道我是否见过类似的东西……]");
         outputText("[pg]喀耳刻把目光从蛾女身上移开，仍然有些无法面对她的恐惧症。然后她看着你，再次叹了口气，又努力地看着多洛雷斯的眼睛。她勉强成功了。");
         outputText("[pg][say: 很有可能没有。我读到过古代巫师在传送艺术上如此熟练，以至于他们可以将自己或任何人传送到玛瑞斯的任何地方，或从任何地方传送回来。这种艺术很可能已经失传了，而我个人只能通过这个房间里的附魔符文进行有限范围的传送。]");
         outputText("[pg]她短暂地将目光从多洛雷斯身上移开。[say: 我得说，对于我自学的东西来说，这已经很不错了。]");
         outputText("[pg]你的女儿热情地回应，没有错过任何一个节拍。[say: 我完全同意。我在我读过的任何书里都没有见过类似的东西，但能掌握到这种程度，以至于你在如此大的压——啊，我是说……随心所欲地施展，是的。这令人印象深刻，]她说完，看起来有点害羞。");
         outputText("[pg][say: 是的，令人印象深刻，]喀耳刻说道，注意到了她的失言，但优雅地略过了。[say: 好吧，我知道我之前……很粗鲁，但既然我已经向你展示了我的能力，你能做同样的事吗？]你注意到喀耳刻挥了挥手施展了一个法术，动作如此微妙，几乎难以察觉。如果你要猜的话，她可能暂时移除了阻止多洛雷斯施法的结界。对于像她这样谨慎的人来说，这绝对是一个大胆的举动，这意味着她要么信任你的女儿，要么认为她作为一个法师没有能力。");
         outputText("[pg]蛾女只是红着脸回应，看向一边，似乎在考虑如何继续。她似乎想到了一个主意，双手合十，闭上眼睛集中注意力。柔和的紫色光芒环绕着她的十二根手指，尽管喀耳刻似乎不愿意看它们，但当空气开始因能量而嗡嗡作响时，她还是忍不住看了过去。");
         outputText("[pg]她巧妙地移动着双手，能量似乎在附近的一根蜡烛周围凝聚。在你的眼前，蜡烛开始缩小，蜡开始越来越快地融化，直到它枯萎成虚无。火焰熄灭了，奇怪的紫色光芒消散了，你的女儿放下了手臂，看起来因为这次努力而有些疲惫。");
         outputText("[pg][say: 啊，好吧，就是这样。我还在练习，但我已经设法创造了局部力场，在其中时间流逝的方式不同。我还没有完全弄清楚如何调节效果，而且这个过程仍然非常费力，但它看起来很有希望……]她有些试探性地说道。");
         outputText("[pg]喀耳刻眯起眼睛，脸上明显流露出担忧和好奇。[say: 是的……非常。那是一个很少有人能涉足的魔法流派。扭曲时间有巨大的灾难潜力。你意识到这一点了吗？]她短暂地看了你一眼，暗示这个问题也是针对你的，即使她只期望多洛雷斯给出实际的答案。");
         outputText("[pg][say: 是——是的！]她回答道。[say: 我，啊，确实学到了很多关于……过于粗心使用魔法的危险。我在我的……嗯，我想你可以称之为实验中一直非常小心。]她抬头看向喀耳刻，眼中燃烧着一丝希望。女巫轻轻摇了摇头。");
         outputText("[pg][say: 多洛雷斯，我可以和你[dad]私下谈谈吗？]女巫说道，她的表情有些警惕。");
         outputText("[pg]你的女儿温顺地点了点头，喀耳刻把她带到附近的一个书架旁，指出了几本有趣的书。她甚至抽出一本，但随后脸色苍白了片刻，然后转过头，把它飘向蛾女的方向。多洛雷斯取回了悬浮的书，并很好地接受了它，留下你们两个单独谈论喀耳刻想谈论的任何事情。你问她那是什么。");
         outputText("[pg][say: [name]，我不知道她是怎么学会这种魔法的，但你需要明白一件事。操纵时间是连老巫师都无法完全理解的事情。而他们所做的一点点就足以将其归类为禁忌。她能控制它真是太神奇了，但我不能说我对一个凡人玩弄它感到舒服，更不用说一个孩子了。]");
         menu();
         _g = this;
         answer = 0;
         addNextButton("同意",function():void
         {
            _g.hikkiCirceAnswer(answer);
         }).hint("这是一个合理的观点，因为你真的不知道你的女儿能做什么。");
         _g1 = this;
         answer1 = 1;
         addNextButton("不理会",function():void
         {
            _g1.hikkiCirceAnswer(answer1);
         }).hint("你一点也不担心这个。");
         _g2 = this;
         answer2 = 2;
         addNextButton("虚伪",function():void
         {
            _g2.hikkiCirceAnswer(answer2);
         }).hint("喀耳刻尝试过许多危险的事情——她有什么资格给出这种建议？");
         _g3 = this;
         answer3 = 3;
         addNextButton("保持沉默",function():void
         {
            _g3.hikkiCirceAnswer(answer3);
         }).hint("什么也不说。");
      }
      
      public function hikkiCirce() : void
      {
         clearOutput();
         outputText("在没有准备的情况下带你女儿去火山岩地带实在太危险了，所以在你们旅行的过程中，你确保她了解所有潜在的威胁，以及那里普遍恶劣的环境。你的女儿似乎把这一切都当真了，毫无怨言地听取了你的建议。");
         outputText("[pg]然而，随着周围的景色开始变得更加荒芜崎岖，气氛也变得越来越闷热，你惊讶地发现周围竟然没有什么危险。这本身几乎比恶魔直接跳出来袭击你更让人不安，但你也不想对这份意外的安宁挑三拣四。");
         outputText("[pg]这种相对的平静一直持续到那个现在已经熟悉的洞穴出现在视线中，你小心翼翼地带领你的女儿深入其中。她刚想问你什么，但你只感到胃里一阵突然的翻腾，这是你得到的唯一警告，紧接着你就完全身处另一个地方了。你以前经历过这种情况，所以你并不太担心，直到你转头去查看多洛雷斯，却发现她不在那里。");
         outputText("[pg][say: 在我的记忆中，我并没有邀请你认识的任何人，[name]。]");
         outputText("[pg]你把脸转向声音的来源。喀耳刻正在完成她妆容的最后几笔，说话时眼睛微微转向你。她停顿了一下，在镜子里打量了自己一番，然后站起身，转身面对你。她立刻注意到你因为同伴失踪而感到苦恼，这让她的目光迅速变得稍微同情了一些。");
         outputText("[pg][say: 嗯。你到底带了谁来？]");
         outputText("[pg]你向她解释说，你刚才被迫独自留在火山岩地带的那个人其实是你的女儿，你非常希望她能回到你身边。喀耳刻注意到了你的反应，在提到家人时，她的表情明显柔和了下来。");
         outputText("[pg][say: 哦，那好吧。你知道的，你应该提前警告我这些事情。]");
         outputText("[pg]你试图告诉她你真的没有机会，但还没等你把话说完，多洛雷斯就出现在你旁边，身上覆盖着一层迅速消失的蓝色薄雾。她睁大了眼睛，你能看出来她正在尽力不让自己过度换气，但一看到你，她明显放松了下来。");
         outputText("[pg][say: [Father]！我好担心，我都不知道你在哪。话说回来，我们现在在哪？]");
         outputText("[pg][say: 你在我的房间里，小飞——]");
         outputText("[pg]喀耳刻突然不说话了。短暂的沉默后，你刚想介绍多洛雷斯，却发现这位女巫已经退回了她的梳妆台前。你走近她，注意保持着距离，但她迅速移开了视线，只留给你一头火红的头发。");
         outputText("[pg][say: 我漏了一块没化好。我们可以边补妆边聊，]她说道，声音微微发颤。");
         outputText("[pg]虽然奇怪，但你还是照做了。你告诉她多洛雷斯是你的女儿，而且对魔法有着非同一般的兴趣。你说喀耳刻是你迄今为止见过的最厉害的女巫，而多洛雷斯还没有接受过任何正规训练，也许她能教她一两手。");
         outputText("[pg][say: 是的。我是个女巫。我懂……我懂很多，]她说道，话语异常简短。[say: 我也能教你很多。]");
         outputText("[pg]你听到指甲不断敲击木制梳妆台的声音。喀耳刻保持沉默，于是多洛雷斯借机开口。[say: 啊，好的，是的。我确实会很感激。但是，嗯……你能说得更具体一点吗？]她边说边向前迈了一步，你可以看到喀耳刻瑟缩了一下。");
         outputText("[pg]喀耳刻深吸了一口气，憋了几秒钟后，开始以极快的语速说道。[say: 大多数黑白魔法的标准应用，以及用于召唤的高级奥术，还有将生命力赋予无生命物体的能力，以一种在旧氏族中任何普通等级巫师看来至少是中级水平的方式操纵各种自然力量，当然，这并不是我特别引以为傲的事情，但在如今这个时代仍然很少见，所以我认为这不应该——]她突然意识到自己漫无目的的喋喋不休，停了下来。");
         outputText("[pg]年轻的蛾女眨了眨眼。[say: 啊……嗯。是的，听起来……相当了不起。]她环顾了一下洞穴的墙壁。她眯起眼睛，转头看向喀耳刻，后者现在正死死盯着自己的大腿。[say: 当然，您是一位经验丰富的法师。我确信，我这个卑微的新手无法与您相比，但您介意给我做个小小的演示吗？]");
         outputText("[pg]喀耳刻摇了摇头。[say: 我是女巫。我不会随便给任何人变戏法。]她的头一动不动。");
         outputText("[pg]多洛雷斯只是笑了笑。[say: 哦，当然，当然。我明白像您这样身份的人]——她开始走近喀耳刻，你可以看到女巫明显紧张起来——[say: 会觉得这非常不便，但如果我能稍微打扰您一下，我会非常感激的。]她现在就站在年长女人的椅子正后方。[say: 哎呀，哪怕只是一点微光。肯定——]");
         outputText("[pg]多洛雷斯在眨眼间消失了。喀耳刻紧接着又深吸了一口气，迅速从椅子上站起来，在房间里狂躁地踱步。");
         outputText("[pg][say: 新手？！一个[b: 新手]？！她根本不知道新手意味着什么！以玛莱的名义，要求“演示”？她以为她是谁？她那细长的甲壳手臂差点就碰到我了！我会给她一个演示的，我会让她见识一下白焰，强大到让她——]她停下来，陷入了沉默。又深吸了一口气后，她再次开口，声音平静了许多，但仍然明显带着苦恼。[say: 我通常不会同时接待两位客人，[name]。我以为我是一个人。]");
         outputText("[pg]你问她你女儿到底去哪了。大多数主人都不会把客人传送走，而且，她已经表现得很奇怪有一阵子了。你要求她给个解释。");
         outputText("[pg][say: 甲壳，[name]。]");
         outputText("[pg]你说这根本算不上解释。她叹了口气。");
         outputText("[pg][say: 甲壳，小薄膜，奇怪的触角，诡异的眼睛，还有那根本不是毛的怪毛。这简直太要命了。]");
         outputText("[pg]她——你见过的最强大的女巫，一个玩弄现实结构的人——难道怕虫子吗？");
         outputText("[pg]她恢复了镇定，再次转向你。[say: 我只是提醒你注意你的言辞，[name]。你女儿现在没有变成一堆灰烬的唯一原因，是因为，嗯，她是你的女儿。是的，我从来都不擅长应付虫子。我也从来没有接触过会说话的巨型虫子。这对我来说有点难熬。]");
         outputText("[pg]她在房间中央她常坐的椅子上坐下。你注意到一杯倒满酒的玻璃杯飘向她。她小心翼翼地抓住它，一口气喝光了里面的酒。她用手抹了一把脸，为自己失去的镇定叹了口气。");
         outputText("[pg][say: 你本来可以操那么多东西的，[name]。以玛莱的名义。]");
         outputText("[pg]你刚想开口让她赶紧把你女儿带回来，但话还没说完，身后就传来了一阵低沉、扭曲的声音。你转过身，看到你女儿平安无事地回来了，尽管她看起来非常糟糕。她的眼神几乎空洞，紧紧地抱着自己，牙齿还在打颤。");
         outputText("[pg][say: 我想回家，]她用几乎听不见的声音说道。[say: 我想回家，妈妈。]当你走近她时，她的眼神过了一会儿才闪烁出认出你的光芒，但当她认出你时，她的脸上恢复了血色，看起来好多了。[say: " + get_player().mf("爸——爸爸","妈——妈妈") + "？是……我回来了吗？]");
         doNext(hikkiCirce2);
      }
      
      public function hikkiCampFollower() : void
      {
         clearOutput();
         switch(int(campScenes.splice(Utils.rand(int(campScenes.length)),1)[0]))
         {
            case 0:
               outputText("你带着多洛雷斯来到你的老鼠情人身边。艾米莉似乎对你带了个陌生的女孩回来感到惊讶，甚至有些怀疑，但当你解释说她是你的女儿时，这种疑虑很快就烟消云散了。");
               outputText("[pg][say:哦，你是[name]的女儿？我想我能看出你们有点像。不管怎样，欢迎来到营地，很高兴认识你。]");
               outputText("[pg]多洛雷斯温柔地微笑着回应。[say:啊，谢谢你。如果你不介意我问的话，你是怎么认识[Father]的？我们还没怎么谈过[he]在其他地方做过的事，我很想多了解一些……]");
               outputText("[pg]她们俩亲切地聊了一会儿，你甚至看到老鼠给了她温暖、几乎像母亲一样的微笑。你想这些本能是根深蒂固的。没过多久，你们就分开了，继续深入营地。");
               break;
            case 1:
               outputText("你的虎鲨人贝塔碰巧在附近闲逛，所以你把多洛雷斯引到她身边。伊兹玛目前正忙着看书，你意识到这是她们一拍即合的绝佳机会。她抬起头看着你们走近，你迅速向她解释了情况。");
               outputText("[pg][say:多洛雷斯，是吗？嗯，我的阿尔法的任何孩子都注定是个坚强的人，我清楚地看到你就是。]");
               outputText("[pg]多洛雷斯对这突如其来的赞美有些脸红，但很快回答道：[say:哎呀，谢谢你。非常抱歉打扰你，但你在看什么书？我自己也是个藏书爱好者，而且……]");
               outputText("[pg]她还没说完，伊兹玛就轻松地咧嘴笑了。[say:我一点也不介意，我在看……]");
               outputText("[pg]她们俩谈论书的时间长得惊人，对话从一个话题无缝衔接到下一个话题，因为她们都释放出了遇到志同道合之人的热情。最终，多洛雷斯似乎意识到你们在那里耽搁了很长时间，所以她打断了谈话，在你们继续上路时，越过肩膀向虎鲨人热情地挥了挥手。");
               break;
            case 2:
               outputText("你走近那位老炼金术士，但试了几次才引起他的注意。然而，当他注意到时，他立刻对你的女儿产生了兴趣，迅速停下了他在实验室里摆弄各种小瓶子的动作。");
               outputText("[pg][say:真奇怪。我已经很多年没见过蛾女了。我原以为在恶魔入侵之后，她们不断下降的出生率就已经注定了她们的命运，但我想你就是活生生的反证。告诉我，你还知道有其他蛾女活着吗？]");
               outputText("[pg][say:啊，恐怕我不知道，]她回答道，垂下眼睛。[say:我相信我母亲和我可能是仅存的几个了。]");
               outputText("[pg][say:真遗憾，]老鼠摇着头说。[say:你们的丝简直是最不可思议的化合物。它实际上……]");
               outputText("[pg]他滔滔不绝地讲了一会儿关于各种飞蛾副产品的炼金属性，而多洛雷斯也确实听得津津有味，在拉萨祖尔终于讲完时向他道谢。然后，这个老鼠形态的人又回去继续他的混合工作，你们俩继续前进。");
               break;
            case 3:
               outputText("你寻找你的蝾螈女儿，渴望让她们俩见面。没过多久，你就在[cabin]附近找到了她，她正凝视着远方。当你们目光相遇时，她精神一振，似乎对你带来的人感到好奇。很快你就把她们俩介绍给了对方，[Helspawn]自信地加入了对话。");
               if(get_helSpawnScene().helspawnChaste())
               {
                  outputText("[pg][say:哦，很高兴认识你。]她温柔地笑了笑。[say:我不知道[Dad]还有个和我差不多大的女儿。]");
                  outputText("[pg][say:是的，[Father]以前也没怎么提过这个地方，所以能亲眼看看真是太好了。我，呃……]多洛雷斯似乎不知道该说些什么，但蝾螈似乎并不介意，她敏锐地察觉到了多洛雷斯的不自在，并试图化解这份尴尬。");
                  outputText("[pg][say:嗯……你平时喜欢做些什么？这里虽然没那么多好玩的，但如果你愿意，我们可以一起逛逛。]");
                  outputText("[pg][say:啊，嗯，听起来……不错。那我们走吧。]");
                  outputText("[pg][Helspawn]拉起多洛雷斯的手，把她拽到附近的一片空地上，兴高采烈地聊了起来。多洛雷斯起初似乎有些抗拒，但随着时间的推移，她的态度软化了，似乎真的开始享受和蝾螈在一起的时光。");
                  outputText("[pg]过了一会儿，你甚至听到了她们的笑声，看到两人相处得如此融洽，你的心里暖洋洋的。和多洛雷斯聊天有时会冷场，但看来[Helspawn]毫不费力地避开了这个问题。她们很快就道别了，蛾女再次回到你身边时，两人还互相挥手致意。");
               }
               else
               {
                  outputText("[pg][say:哦，你真是个可爱的小家伙，不是吗？]她说道，眼中闪烁着幽默的光芒。");
                  outputText("[pg][say:什、什么？]");
                  outputText("[pg][say:哦，我真不知道该拿这么宝贝的小女儿怎么办。我真想把你一口吃掉。]她轻声笑着，多洛雷斯脸红了。");
                  outputText("[pg][say:我、我不知道你这话是什么意思。我——][Helspawn]凑得很近，打断了她的话，多洛雷斯吓得往后缩了缩，闭上嘴巴，把脸转到了一边。");
                  outputText("[pg][say:我算是明白为什么[he]以前不带你来了。我知道[i:我]肯定想把你据为己有。]");
                  outputText("[pg]这种戏弄持续了一段时间，但几分钟后，多洛雷斯似乎意识到她并没有恶意。年轻的蛾女开始更大胆地回应，甚至还能反驳几句，有些话甚至可以说是尖酸刻薄。");
                  outputText("[pg]最精彩的是，[Helspawn]竟然成功地逗笑了你的另一个女儿，她随后露出的笑容中带着的骄傲，真是让人眼前一亮。两人在令人惊讶的友好气氛中道别，你继续你的旅程。");
               }
               break;
            case 4:
               outputText("你[walk]向你的海葵女儿居住的水桶，[if (silly) {为拥有一个能用的水桶而欣喜若狂|边走边呼唤她}]。她的小脑袋探了出来，但看到你带着个陌生人，她似乎有些警惕。你向她解释了多洛雷斯是谁，小A[if (kidaxp > 66) {很快精神起来|慢慢平静下来}]，她的头从水桶里抬得更高了。");
               outputText("[pg]令人惊讶的是，多洛雷斯竟然主动迈出第一步，走上前说道：[say:你、你好？]");
               outputText("[pg][say:...]");
               outputText("[pg][say:...]");
               outputText("[pg][say:...]");
               outputText("[pg]两人沉默了很久，但奇怪的是，大约一分钟后，多洛雷斯笑了。更不可思议的是，小A也回以微笑。两人互相点了点头，多洛雷斯拉着你离开了。你觉得有些事情你就是无法理解。");
               break;
            case 5:
               outputText("你脑海中闪过一个念头。阿瑞安非常精通魔法，还有谁比她更适合介绍给多洛雷斯呢？你带着她来到蜥蜴人的帐篷，自己走了进去，发现[Arian ey]正坐着悠闲地喝茶。");
               outputText("[pg][say:哦，你好啊，[name]。你带谁来了？]");
               outputText("[pg]你向阿瑞安解释了多洛雷斯的身份以及你们来此的目的，并特意提到了她对魔法的兴趣。");
               outputText("[pg][Arian Ey]转向她，亲切地微笑着。[say:嗯，我以前确实当过老师，所以我很乐意和你探讨这个。你已经熟悉哪些种类的魔法了？]");
               outputText("[pg]一谈到这个话题，多洛雷斯就两眼放光，显然这是她的强项。她开始描述过去几个月里她所熟悉的理论和实践。阿瑞安专心地听着，不时点头赞同，偶尔也会发表一些小评论或要求她澄清一些问题。");
               outputText("[pg][say:你是自学的吗？] 当你的女儿说完后，[Arian ey]终于开口了。");
               outputText("[pg][say:嗯……是的……] 她回答道，脸颊微微泛红。然而，蜥蜴人只是咧嘴一笑，打消了她所有的顾虑。");
               outputText("[pg][say:你能靠自己做到这些，真是太棒了。现在，听起来你好像……]");
               outputText("[pg]两人聊了很长一段时间，阿瑞安提供了许多指导，年轻的蛾女完全吸收了这些知识。过了好一会儿，你才设法把多洛雷斯拖走，告诉她还有其他地方要看，而且不应该占用阿瑞安太多时间。她们友好地道别，当你穿过帐篷门帘离开时，你的女儿承诺会努力学习，并研究她所学到的东西。");
               break;
            case 6:
               outputText("你带着多洛雷斯去见营地里的龙，一种不祥的预感已经在你脑海中盘旋。当你看到[Ember em]时，[Ember ey]似乎心情不错，只是靠在石头上清理[Ember eir]爪子，这是个好兆头，所以你继续进行介绍。");
               outputText("[pg]然而，你还没来得及多说一个字，烬就打断了你。[say:这又是谁？] [Ember ey]说道，[Ember eir]嘴唇上已经挂着一丝冷笑。");
               outputText("[pg]还没等你回应[i:that]，多洛雷斯就走上前去，鼻子微微上扬。[say:我是多洛雷斯，[name]的女儿。你又是哪位？]");
               outputText("[pg]烬的方向传来一阵低沉的隆隆声，你已经开始后悔了。[say:[b:我]才是住在这里的人，所以我不知道你凭什么用这种口气说话。] [if (littleember) {看着这只矮得多的龙试图威胁蛾女，有点好笑，但你还是忍不住担心|这只龙高大的身材和威胁的姿势有点令人担忧，但目前还没有直接的危险}]。你只希望事情不会演变成暴力冲突。");
               outputText("[pg]多洛雷斯哼了一声。[say:我以为蜥蜴是冷血动物呢。脾气挺暴躁的嘛？]");
               outputText("[pg]你立刻搂住她的腰，开始朝另一个方向走去。这可能是你的错觉，但当你匆忙赶往其他地方时，你觉得后颈有点发热。");
               outputText("[pg][say:嘿，放我下来！我做错什么了？]");
               outputText("[pg]你答应了她的要求，但作为交换，你要求她在下一个目的地不要惹出任何火灾。蛾女只是撅了撅嘴。");
               break;
            case 7:
               outputText("你知道营地里有一位非常特别的成员，如果不介绍给她认识，那就是你的失职了。要是你能找到他就好了。你到处寻找[akky]，但他不在任何他常去的地方，你叫他的名字他也不出现。你开始考虑放弃，而就在这时，他恰好出场了，从一块石头后面懒洋洋地溜进视线，伸展着腿，非常清楚地表明了他对你的召唤有多么在意。");
               outputText("[pg]多洛雷斯似乎被迷住了。[say:真是一只可爱的猫。我一直想知道我们能不能养只宠物……它叫什么名字？] 你告诉了她，但同时也警告了她猫科动物善变的本性，但她只是不以为然。");
               outputText("[pg]你们俩走近那只正在舔毛的懒猫，谢天谢地，他似乎并不介意。事实上，当多洛雷斯蹑手蹑脚地走近，把手伸向他好奇的鼻子，然后开始轻轻抚摸他时，他极其温顺。他甚至还发出了一点呼噜声，把头靠在她的手指上。");
               outputText("[pg]年轻的蛾女咯咯地笑了起来。[say:你真是一位乖巧的绅士。] 她转向你。[say:你是怎么找到这么好的猫的？]");
               outputText("[pg]你走过去加入他们，[akky]立刻跳了起来，对你发出嘶嘶声，然后四处寻找掩护。你看着多洛雷斯，她耸了耸肩。你继续[walk]。");
               break;
            case 8:
               outputText("你看到乔乔在不远处打坐冥想，于是你带着多洛雷斯过去介绍他们认识。在你解释你女儿的身份和来意时，他一直闭着眼睛，但当你讲完后，他睁开了眼睛，对着蛾女微笑着。");
               outputText("[pg][say:啊，你好，年轻人，]他平静地说道。");
               outputText("[pg][say:嗯，[day]好，]她回答道，看起来对某些事情感到有些不安。一阵意味深长的沉默之后。[say:请问你在做什么？]");
               outputText("[pg][say:我在冥想。你想加入我吗？我没有感觉到你体内有太多的腐化，但这有助于集中精神，]他回答道，再次闭上眼睛，抬起手臂摆出正确的姿势。");
               outputText("[pg][say:集中……精神？]");
               outputText("[pg][say:是的。]");
               outputText("[pg][say:然后你就靠，呃，坐着来做到这一点？]");
               outputText("[pg][say:嗯，不仅仅是坐着。虽然看起来不像，但这其实是一个非常复杂的过程。]");
               outputText("[pg]多洛雷斯皱了皱鼻子。[say:谢谢你的好意，但是，呃……我们正要走呢。]");
               outputText("[pg]她挽住你的胳膊轻轻拉了拉，几乎没给你时间向乔乔道别，你们就前往了下一个目的地。");
               break;
            case 9:
               outputText("你们路过[bathgirlname]身边，你本来没打算停下来，但多洛雷斯放慢了脚步，好奇地注视着她。那个皮肤黝黑的女孩也回望着她，尽管她的眼神明显更加迷离。你女儿起初只是看起来很困惑，但过了一会儿，她似乎恍然大悟，眼睛睁得大大的。");
               outputText("[pg]她严厉地看着你。[say:她到底是谁？那是[i:奴隶]吗？]");
               outputText("[pg]你引导她坐下并解释了情况，告诉她这里对她来说确实是最好的归宿，而且她来这里之前的处境并没有更好。" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,870) == 1 ? "你甚至还帮她恢复了一些心智。" : "") + "随着你的每一句话，你女儿的表情逐渐缓和下来，当你讲完时，她看起来比之前更加纠结了。");
               outputText("[pg][say:我想……关于这个世界的运作方式，我还有很多东西没有了解。]她再次看了看[bathgirlname]，但没有再说什么。最后，你扶她站起来，你们俩继续前进，多洛雷斯现在有了更多需要思考的事情。");
               break;
            case 10:
               outputText("当你们继续[walking]时，一声短促的尖叫是你得到的唯一警告，紧接着一团羽毛几乎撞到了你身上。多洛雷斯虽然离撞击点较远，但比你受到的惊吓更大，而一个年轻、叽叽喳喳的声音连珠炮似地抛出一大堆问题，更是让她不知所措。");
               outputText("[pg][say:嘿，你是谁？你什么时候来这儿的？你为什么和[Daddy]在一起？我能摸摸你的头发吗？你为什么有这么多只手？洗手要多洗一倍不觉得烦吗？]");
               outputText("[pg]蛾女勉强把鹰身女妖挡在一臂之外，但她根本无法回答任何一个问题，直到你介入并告诉你另一个女儿最重要的信息。她全神贯注地听着，当你讲完后，她又转向了多洛雷斯。");
               outputText("[pg][say:所以你会飞吗？]");
               outputText("[pg][say:你说什么？]");
               outputText("[pg][say:你背后有那么大的翅膀，你会飞吗？我们一起飞吧！]");
               outputText("[pg]你的女儿脸红了。[say:啊，嗯……理论上……我是能飞的，但是……] 她似乎不知道该怎么把话说完，但年轻的鹰身女妖并不介意，她抓住了蛾女的手，也抓住了她的注意力。");
               outputText("[pg][say:太棒了！我们走吧！]");
               outputText("[pg][say:啥？] 多洛雷斯只来得及问出这一个字，小鸟就带着她冲天而起，伴随着一声长长的尖叫。你有一瞬间的担忧，但年轻的鹰身女妖是个出人意料的飞行好手，她能让多洛雷斯稳稳地悬停在你头顶的半空中。");
               outputText("[pg]违背了她的意愿，你的女儿被慢慢地指导了一些飞行基础知识，因为她被缓慢、笨拙地引导着在你上方进行慵懒的盘旋。你着迷地看着鹰身女妖花时间让多洛雷斯至少在一定程度上跟上速度，似乎在这个过程中玩得很开心。没过多久，你甚至能看到蛾女也笑了，因为她终于设法独自完成了一个盘旋。完成这个壮举后，两人扑腾着飞下来与你汇合。");
               outputText("[pg]多洛雷斯迅速冲过来，开始兴奋地说个不停。[say:[Father]，你看到了吗？哦，太奇妙了，我感觉到了风吹过我的头发，我差点以为我会掉下来，但我做到了，而且我——] 她突然停下来，平静下来，脸上的红晕无法掩盖她的笑容。");
               outputText("[pg]你们一起向鹰身女妖道别，她再次冲向天空，准备迎接她自己的冒险，就像你和多洛雷斯即将做的那样。");
         }
         cheatTime(0.16666666666666666);
         doNext(int(campScenes.length) > 0 ? hikkiCampFollower : hikkiCampDone);
      }
      
      public function hikkiCampDone() : void
      {
         clearOutput();
         outputText("你们俩最终在一块平坦的大石头上休息，多洛雷斯让她的腿休息一下。嗯，带她参观这里所有的景点确实发生了很多事。事情似乎进展顺利，但你想知道她被带到这个地方的真实感受。你问多洛雷斯她对你的营地有什么看法。");
         outputText("[pg][say:哎呀，这真是太了不起了。我想我以前不知道你的营地是什么样子，但想到这一切都是你自己建立起来的，真是令人惊叹。] 她的这番话听起来不像是空洞的奉承，这与她有时表现出的傲慢相比，让人耳目一新。看着你的女儿带着温柔的微笑平静地舒展四肢，你感到一种莫名的自豪。");
         outputText("[pg][say:嗯，这确实令人难忘。谢谢你给我这次体验，[Father]，但我想我们是时候继续前进了。]");
         outputText("[pg]你没有异议，所以你们俩起身，开始原路返回。");
         cheatTime((60 - get_time().minutes) / 60);
         _temp_1.hikkiQuest |= HQCAMP;
         doNext(hikkiMenu);
      }
      
      public function hikkiCampBuild() : void
      {
         campScenes = [];
         if(get_amilyScene().amilyFollowerPure())
         {
            campScenes.push(0);
         }
         if(izmaFollower())
         {
            campScenes.push(1);
         }
         if(followerRathazul())
         {
            campScenes.push(2);
         }
         if(helspawnFollower())
         {
            campScenes.push(3);
         }
         if(anemoneFollower())
         {
            campScenes.push(4);
         }
         if(arianFollower())
         {
            campScenes.push(5);
         }
         if(followerEmber())
         {
            campScenes.push(6);
         }
         if(akkyOwned())
         {
            campScenes.push(7);
         }
         if(jojoFollower())
         {
            campScenes.push(8);
         }
         if(milkSlave() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,870) < 2)
         {
            campScenes.push(9);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,741) > 0)
         {
            campScenes.push(10);
         }
      }
      
      public function hikkiCamp() : void
      {
         clearOutput();
         hikkiCampBuild();
         outputText("当熟悉的营地景象映入眼帘时，你感到一种复杂的情绪。这可能是你能带女儿去的全世界最安全的地方之一，但出于某种原因，你内心深处总有一种挥之不去的担忧。她会喜欢这里吗？" + (int(campScenes.length) > 0 ? "她会和你营地的其他人相处融洽吗？" : "") + "这里和她自己的家比起来怎么样？");
         outputText("[pg]当这些想法在你脑海中盘旋时，你听到身边传来一声急促的吸气声。你转过头，看到多洛雷斯正饶有兴趣地盯着你的营地，路过时，她用手抚摸着你在石头上雕刻的一些粗糙的艺术品。");
         outputText("[pg][say:好了，我们到了。你介意带我四处看看吗？]");
         outputText("[pg]带女儿看什么最好呢？");
         if(int(campScenes.length) > 0)
         {
            outputText("你很快就想到了，你问她是否想见见营地里的其他人。");
            outputText("[pg][say:啊，如果他们是[i:你的]同伴，我相信他们都是可爱的人。]");
            outputText("[pg]你只能希望她的乐观能保持下去。");
            doNext(hikkiCampFollower);
         }
         else
         {
            outputText("虽然你的营地相当荒芜，但你仍然有一些值得注意的东西。你带她去你的[cabin]，让她看看你每天晚上休息的地方，以及营地中心的壁炉。你向她展示了你洗衣服和洗澡的小溪，以及你在营地周围设置的陷阱。你觉得这些都是平凡的事情，但这就是你的生活，而且这[i:确实]是她想看的。");
            outputText("[pg]最引人注目的就是传送门了。当你带着女儿走过去时，她的眼睛立刻亮了起来。当你开始讲述你到达这里后的各种观察结果时，她看起来几乎没在听。她慢慢地飘向那道发着光、令人不安的现实裂缝，试探性地伸出手，然后又缩了回来。");
            outputText("[pg][say:真迷人……]");
            outputText("[pg]等她看够了，你带着她转了转营地的其他地方，把可能遗漏的地方都指给她看。她相当安静，所以很难判断她的反应，但你觉得她对所见的一切并不反感。");
            if(get_silly())
            {
               outputText("[pg]最后，你们来到了你的骄傲与喜悦之源——你珍贵的水桶旁。你拍了拍它的侧面，向多洛雷斯解释它是如何在一个阳光明媚的早晨莫名其妙地出现的，以及从那以后你们是如何形影不离的。是的，这个水桶陪伴你度过了许多漫长的夜晚，在那些因为某些愚蠢原因而滴雨未下的日子里给了你慰藉。你不知道如果没有它，你会怎么活下去。");
            }
            doNext(hikkiCampDone);
         }
      }
      
      public function hikkiBazaarTelly() : void
      {
         clearOutput();
         outputText("一时兴起，你决定带她去你认识的那位爱丽丝糖果商的店里。毕竟，即使她是个正在成长的女孩，她仍然是你的女儿。当蛾女看到那辆柔和的粉红色小马车时，她的眼睛几乎难以察觉地闪烁了一下，但她很快又恢复了端庄的伪装。");
         outputText("[pg]你问她是否想进去，她思考了片刻——虽然你不确定她弯曲的眉毛和撅起的嘴唇是否只是在做样子——她点了点头，然后你们一起走了进去。这家小店里有这么多人，感觉有点拥挤，但和往常一样，老板娘正靠在柜台上望着远方，成功地让这个地方明亮了许多。");
         outputText("[pg]当她注意到你们的到来时，她精神一振，开始用她惯常的问候语打招呼。[say:欢迎回到特莉的玩具与糖果店！我是特——哦，又来了一位客人！]特莉以不可思议的速度从柜台后面冲了出来，紧紧抓住你女儿的手，用力地摇晃着。[say:我是特莉，我卖玩具和糖果！我同样爱我所有的客人，所以尽情挑选你心仪的东西吧！]");
         outputText("[pg][say:啊——啊，好的，谢谢……]多洛雷斯紧张地环顾四周，似乎拼命想把注意力从自己身上转移开。[say:我——我看到你这里有……很多有趣的……小玩意儿。告诉我，它们都只是玩具吗？]");
         outputText("[pg][say:你是什么意思，小姐？]");
         outputText("[pg][say:嗯，它们，呃，都只是摆设吗？我不认为在这个世界上，一家商店能靠卖这些轻浮的东西生存下去。]");
         outputText("[pg]特莉严厉地看着她。[say:小姐，做玩具是一项严肃的生意。我应该知道，我是一个经验丰富的生意爱丽丝。]说完，她再次微笑，回到柜台前，开始哼着歌，涂鸦着你认为是花朵的东西。");
         outputText("[pg]多洛雷斯似乎对这次交流感到尴尬，但你建议她买点东西，她很快就接受了。年轻的蛾女仔细看了一会儿提供的糖果，很快就选定了一颗用俗气包装纸包着的硬糖。她把它拿给特莉，从包里摸出一小把宝石。");
         outputText("[pg]然而，当特莉接过递来的货币时，她突然倒吸一口凉气，眼睛睁得大大的。[say:小姐，你知道这意味着什么吗？]没等回答，她继续说道，[say:你刚刚获得了我们首次顾客特别促销活动的资格！]");
         outputText("[pg]多洛雷斯看起来完全不知所措，但还没等她弄明白怎么回事，爱丽丝就已经从柜台上跳下来，冲到她面前，立刻张开双臂抱住了可怜的蛾女。你的女儿被紧紧地、彻底地拥抱着，当特莉松开她时，你不确定她是否还能站稳。");
         outputText("[pg][say:好了，第一个是免费的，但如果你还想要，就要花钱了，]小恶魔一边说着，一边慢悠悠地走回她的工作台，在凳子上坐下。然后她给了蛾女一个温暖的微笑。[say:但既然你是个这么好的客人，小姐，我真的希望你再来买一个！]");
         outputText("[pg]你谢过特莉，拉着多洛雷斯的手臂把她拉了出来，希望新鲜空气能对她有好处。一旦你们回到开阔地带，她似乎很快就控制住了自己的情绪，这让人松了一口气。当你们再次准备出发时，你注意到她偷偷地把糖果从包装纸里滑出来，塞进嘴里。");
         doNext(hikkiBazaar2);
      }
      
      public function hikkiBazaar3(param1:Boolean) : void
      {
         var _loc2_:* = null as Player;
         clearOutput();
         if(param1)
         {
            outputText("在多洛雷斯走到她拿衣服的地方之前，你冲过去抓住了她的胳膊。她一路抗议着，直到你们走到店主面前。店主是个戴着鸭舌帽的矮小年迈的蜥蜴人。看到你们过来，他抬眼瞥了一下，但当你拿出长袍时，他几乎没什么反应。不过，当你掏出所需数量的宝石递给他时，他还是咧嘴笑了笑，迅速清点完毕后对你点点头，又继续看他之前在读的书了。");
            outputText("[pg]当你把长袍交给多洛雷斯时，她看起来相当慌乱，但还是把它塞进了包里，一丝微笑勉强从她羞愧的表情中流露出来。");
            outputText("[pg][say:谢、谢谢你，[Father]，]她结结巴巴地挤出一句。你们俩很快又继续逛了起来，多洛雷斯尽力想把这段小插曲抛在脑后。");
            _loc2_ = get_player();
            _loc2_.set_gems(_loc2_.get_gems() - 30);
            _temp_1.hikkiQuest |= HQROBE;
         }
         else
         {
            outputText("多洛雷斯很快找到了她拿衣服的地方，把长袍放回原处，然后回到了你身边。脸上的一抹微红是刚才发生过事情的唯一证据，尽管她看起来也许有点失望。");
            outputText("[pg][say:我、我们走吧……]她嘟囔着，声音小得你几乎听不见。这个年轻的蛾女看起来宁愿把这件事忘得一干二净，于是你们俩继续逛了起来。");
         }
         outputText("[pg]你们在集市的游览又持续了一段时间，你女儿的好奇心现在收敛了许多。她似乎比以前更清楚市场里那些见不得人的勾当，对一些令人作呕的景象皱起了眉头。不过，情况也并非完全糟糕，因为你偶尔还是能看到她睁大眼睛，惊奇地盯着某些前所未见的宝贝，仿佛那些东西就是专门在这里等她的一样。");
         outputText("[pg]唯一值得一提的插曲是，一个穿着俗艳的妓女和一个看起来很饥渴的猫人当众上演了一出活春宫。他们干得相当粗暴，丝毫不顾及体面和廉耻。多洛雷斯赶紧捂住脸，但红晕还是蔓延到了手指遮挡不到的地方。一声响亮的呻吟宣告了这场风流韵事的结束，你赶紧护着女儿走进一条小巷，远离这不堪入目的场景。");
         if(get_silly())
         {
            outputText("[pg]然而，你还是捕捉到了他们对话的只言片语。奇怪的是，那个嫖客似乎对什么事情感到不满，他大声的抗议就是证明。[say:不，我告诉过你，我讨厌射出来！等我把这件事告诉芬恩！]你打了个寒颤，继续沿着小巷走去。");
         }
         outputText("[pg]当你们走得足够远时，你停下来让多洛雷斯喘口气。走了这么多路让她有点吃不消，所以过了好一会儿她才能不喘着粗气说话。然而，当你看着女儿慢慢平静下来时，你忍不住感到一丝满足。");
         outputText("[pg][say:啊，谢谢你，[Father]，但也许我们现在该离开了。这确实是一次……令人大开眼界的经历，但我想我已经看够了。]她微微发抖。[say:或者说，我已经看了不该看的……]");
         outputText("[pg]无论如何，你们俩迅速回到了集市大门，将那个在各种意义上都色彩斑斓的市场抛在脑后。");
         _temp_2.hikkiQuest |= HQBAZR;
         cheatTime(1);
         doNext(hikkiMenu);
      }
      
      public function hikkiBazaar2() : void
      {
         var bought1:Boolean;
         var _g1:DoloresScene;
         var bought:Boolean;
         var _g:DoloresScene;
         clearOutput();
         outputText("最后，你们经过一个服装摊。提供的衣服看起来并没有什么特别之处，但也不算太暴露，这似乎是周围比较正常的商店之一，所以你告诉多洛雷斯她应该挑一件自己喜欢的。她很快就接受了，以惊人的热情在商品中翻找。你猜想，大量新事物的涌入一定压倒了她平时的羞涩。");
         outputText("[pg]过了一会儿，你听到她那个方向传来一声倒吸凉气的声音，转过身去，看到她冲向附近的一个更衣帐篷，还没等你仔细看清她挑了什么，她就消失了。你在外面等了几分钟，但帐篷门帘的一阵晃动很快预示着她的出现。");
         outputText("[pg]你首先看到的是一块蓝色的布料从帐篷里飘出来，紧接着是你年轻的女儿。她裹在一件飘逸的蔚蓝色长袍里，上面点缀着明亮的黄色星星。这都是用一整块布做成的，对她来说似乎有点太小了——这一定是为儿童设计的。但最棒的是当她的头终于出现时，她甚至还找到了一顶高高的尖帽子来搭配。");
         outputText("[pg][say:[Father]！看这个！他说这是给真正的巫师穿的，是不是很可爱？]");
         outputText("[pg]她摆出一个她可能觉得很有巫师风范的姿势，然后再次意识到自己是在公共场合。[say:啊，嗯，我……我这就……]她迅速冲回帐篷，很快又穿着原来的衣服回来了，但新长袍仍然夹在腋下。她开始走向她拿到长袍的地方……");
         menu();
         _g = this;
         bought = true;
         addNextButton("买下它",function():void
         {
            _g.hikkiBazaar3(bought);
         }).hint("如果她喜欢，你有什么理由粉碎她的梦想呢？").disableIf(get_player().get_gems() < 30,"你没有足够的宝石。");
         _g1 = this;
         bought1 = false;
         addNextButton("随她去",function():void
         {
            _g1.hikkiBazaar3(bought1);
         }).hint("不要阻止她退还长袍。");
      }
      
      public function hikkiBazaar() : void
      {
         clearOutput();
         outputText("当你们穿过平原上无边无际的草海时，你告诉女儿要小心危险，因为在这个地方，危险往往是不期而至的。尽管这里看起来相对开阔，但它们可能隐藏着任何形式的威胁，只等你们中的任何一个放松警惕。");
         outputText("[pg]但即便是平原，也无法与你们的目的地相提并论。你确保多洛雷斯对集市里可能见到的景象做好了充分的心理准备。当你向她描述时，她脸上的一些表情让你怀疑这是否是个好主意。但她想要拓宽眼界，而那里可能就是最好的去处。");
         outputText("[pg]不知不觉间，远处已经隐约可见那些形形色色的帐篷和推车。高大的守门人在你们经过时点了点头。很快，你们就置身于[if (hours < 12) {早晨|[if (hours < 18) {中午|傍晚}]}]的喧嚣之中，各种声音、色彩和气味立刻将你们包围。");
         outputText("[pg]你的女儿惊呆了，她微张着嘴，眼睛瞪得像铜铃一样，打量着这陌生的景象。也许这对她来说确实太刺激了，但就在你开始重新考虑这个决定时，她开始向前飘去，眼神依然如梦似幻。你赶紧跟上，有些担心她的安全。你只能叹口气，意识到你之前的建议她似乎一句也没听进去。不过目前看来一切都还算顺利，所以你把抱怨咽回了肚子里。");
         outputText("[pg]至于多洛雷斯，她似乎很享受欣赏这些景象，尽管她还是有点太害羞，不敢和任何人互动。你确保不让任何不受欢迎的人靠得太近，保证你的女儿在观察这个对她来说如此陌生的异国世界时，除了惊叹什么都感觉不到。");
         doNext(get_game().bazaar.telly.get_tellyGenesis() ? hikkiBazaarTelly : hikkiBazaar2);
      }
      
      public function hikkiAskFirst() : void
      {
         if(!givenHint)
         {
            clearOutput();
            outputText("虽然她现在不能说话，但你确信像她这样早熟的女孩在这种情况下应该能帮上大忙。然而，恶魔打断了你的请求。[say:让我提醒你——我是在和[b:你]玩，而且只有你。如果别人代替你给出答案，你当场就输了。]");
            outputText("[pg]但在你反驳之前，你的女儿示意他注意，得意地笑了笑，然后在嘴唇上做了一个拉拉链的动作。没错！他说她不能回答，但现在她不能说话了，她能做的就是用动作表演出来，这似乎并没有明确违反规则。");
            outputText("[pg]恶魔深深地皱起了眉头，但在考虑了几秒钟后，似乎没有发现这个论点有什么漏洞，而是朝你的方向轻蔑地挥了挥手，转过头去。");
            givenHint = true;
         }
      }
      
      public function hikkiAsk3() : void
      {
         hikkiAskFirst();
         outputText("[pg]你的女儿蹲下来，用一根甲壳质的手指在泥土里画了一些你无法理解的图表。大约一分钟后，她再次站起来转向你。她自信地指着自己的头，微笑着。当你没有立即做出反应时，她脸红了，然后手里抓起一缕她那暗色的头发。嗯……");
         removeButton(4);
      }
      
      public function hikkiAsk2() : void
      {
         hikkiAskFirst();
         outputText("[pg]你的女儿抿起嘴唇，看向一旁；看来这对她来说也有点困难。最终，她迎上你的目光，伸直手，用手指做了一个剪刀的动作。好吧，这可能会缩小范围……");
         removeButton(4);
      }
      
      public function hikkiAsk1() : void
      {
         hikkiAskFirst();
         outputText("[pg]多洛雷斯想了一会儿，一根手指放在嘴唇上，然后似乎恍然大悟。她指着你，模仿说话的样子，又指着自己，竖起大拇指。接着她反过来重复这个过程，先指自己再指你，最后摇摇头，双臂交叉成一个“X”形。嗯……");
         removeButton(4);
      }
      
      public function hikkiAccept() : void
      {
         clearOutput();
         outputText("你告诉多洛雷斯，你很乐意带她一起去。");
         outputText("[pg]虽然你能看出她正在努力保持镇定，但听到这个消息，你的女儿还是忍不住在嘴角露出了灿烂的笑容。[say:谢谢你，[Father]。我保证不会成为你的负担。请给我一点时间收拾东西。]");
         outputText("[pg]她转过身，开始把各种旅行必需品装进一个小包里，很明显她对此已经考虑了很久。过了一会儿，一切准备就绪，蛾女转过身来看着你，脸上洋溢着兴奋的表情。");
         outputText("[pg][say:好了。我们出发吧？]");
         outputText("[pg]现在唯一需要决定的就是你们到底要去哪里。你在玛瑞斯的时候去过不少地方，但多洛雷斯想去什么样的地方呢？你问她有没有什么初步的想法。");
         outputText("[pg][say:哦，你能带我去看看你住的地方吗？我一直有点好奇……]");
         outputText("[pg]这听起来还算好办，而且你脑子里已经开始酝酿其他几个想法了。当你带领多洛雷斯走出洞口时，你开始向她简要介绍路上可能遇到的所有潜在危险，试图确保她对前方的道路有所准备。她连连点头，但你几乎能看到她眼里的星星，这让你有些担心她到底有没有把这当回事。");
         outputText("[pg]当你们穿过沼泽时，你有一种被监视的奇怪感觉，这更是雪上加霜。不过，你们在路上遇到的只有一只迅速跳开的迷路青蛙女孩，以及一根靠在树桩上的旧木拐杖。看起来似乎没有什么危险会突然跳出来，于是你把心思转向了你们的第一个目的地……");
         doNext(hikkiMenu);
      }
      
      public function goodParent() : Boolean
      {
         if(saveContent.doloresTimesLeft == 0)
         {
            return saveContent.doloresSex != 3;
         }
         return false;
      }
      
      public function giveManorBooks() : void
      {
         clearOutput();
         registerTag("child",TagFun_Impl_.fromBool(get_doloresProg() < 9));
         outputText("这个决定似乎是理所当然的；你的女儿喜欢书，而你正好有书可以给她。当你翻找[inv]时，小蛾女好奇地看着，但在你真正把书拿出来之前，她掩饰得相当好。");
         outputText("[pg][saystart]什么……[if (child) {[sayend] 她让问题飘散在空气中，但她的困惑显而易见| 这些……是给我的吗？[sayend]}] 她那双紫色的大眼睛眨了几下，目光被面前那叠布满灰尘的封面迷住了。");
         outputText("[pg]你解释说，这些是你在旅行中找到的，经过深思熟虑，你觉得世界上没有比她更适合拥有这些书的人了。");
         outputText("[pg][if (child) {她只能嘟囔着说些类似感谢的话，但她眼中的神情足以表明她有多么感激。|[say:谢谢你，[Father]，] 她回答道。" + (hikkiDone() ? " [say:这真是……我不知道我做了什么才配得上这一切。] 当你看到她脸上纯粹幸福的笑容时，你还能说什么呢。这笑容很适合她。" : "") + "}] 四只小手抱住最下面的一本书，你[if (child) {最后不得不帮她把书搬到她等候的桌子上|在看到那叠书摇摇晃晃地移向她的桌子时，有过一瞬间的担忧}]，然后她迫不及待地从书堆里抽出一本，开始阅读。");
         outputText("[pg]看来她要忙上一阵子了，所以你暂时先离开了她。");
         saveContent.doloresBooks = true;
         get_player().removeKeyItem("Old Manor Books");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function giveBook() : void
      {
         clearOutput();
         outputText("你在她离家出走时没收了这本书，但正如你所说，你已经仔细考虑过情况并得出了新的结论。虽然你可能不完全确定这种魔法的确切性质，但你足够信任你的女儿，愿意让她暂时保管这本书。然而，在你把书递给她时，你仍然敦促她要小心。你希望确保她的安全是第一位的。");
         outputText("[pg]四只甲壳质的手臂迅速伸出，紧紧抓住这本书，把它抱在胸前，几乎是在蹭它。你对她对这个无生命的物体表现出的喜爱感到有些惊讶，显然她自己也是，因为过了一会儿，她眨了眨眼，脸微微红了。");
         outputText("[pg]然而，多洛雷斯很快就恢复了过来，清了清嗓子说：[say:我不知道该怎么感谢你，[Father]。你把信任放在我身上是非常正确的，我不会让你失望的。我会用它做出很棒的事情。] 一根手指抚摸着书本陈旧的封面，小" + (get_doloresProg() < 9 ? "毛毛虫" : "蛾女") + "若有所思地望向远方。[say:能有幸研究这样的作品真是太棒了。剩下的已经不多了……]");
         outputText("[pg]她让这句话余音袅袅，脸上带着沉思的表情。好吧，如果她成熟到能这样思考，你希望她也能同样周全地考虑安全问题。就在你这样想的时候，她的眼睛里似乎燃起了一点火花，她给了你一个大大的、几乎有些傻气的笑容，这一次她看起来终于符合她的年龄了。");
         outputText("[pg][say:哦，这一定会很棒的！]");
         outputText("[pg]看到她的热情，你忍不住笑了。");
         saveContent.doloresDecision = 1;
         removeButton(null,"给书");
         get_output().flush();
      }
      
      public function get_doloresTime() : int
      {
         return saveContent.doloresTimeSinceEvent;
      }
      
      public function get_doloresProg() : int
      {
         return saveContent.doloresProgress;
      }
      
      public function get_debugName() : String
      {
         return "多洛雷斯";
      }
      
      public function get_debugHint() : String
      {
         return "";
      }
      
      public function encounterDolores() : void
      {
         if(get_doloresProg() == 5 && get_doloresTime() > 168)
         {
            doloresRunaway();
         }
         else if(get_doloresProg() == 9 && get_doloresTime() > 36)
         {
            doloresWings();
         }
         else if(get_doloresProg() == 10 && get_doloresTime() > 96)
         {
            doloresConcerns();
         }
         else if(get_doloresProg() == 11 && saveContent.doloresAmbitions == 2 && get_doloresTime() > 72)
         {
            doloresSummoning();
         }
         else if(get_doloresProg() == 14 && get_doloresTime() > 48)
         {
            doloresTapestryGifting();
         }
         else if(get_doloresProg() == 15 && get_doloresTime() > 168 && get_time().hours < 17)
         {
            hikkiStart();
         }
         else
         {
            doloresMenu();
         }
      }
      
      public function doloresWingsThatsAll() : void
      {
         outputText("[pg]你没有再说什么，过了一会儿，多洛雷斯似乎冷静了一点，允许你回到其他话题。");
         doNext(doloresTalkMenu);
      }
      
      public function doloresWingsTease() : void
      {
         clearOutput();
         outputText("你忍不住最后又逗了她一下，但话一出口，多洛雷斯的脸就红得变了颜色，你发誓你都能看到她耳朵里冒出蒸汽了。");
         outputText("[pg][say: 出。去。]");
         outputText("[pg]说完她冲过来，四只手全按在你的背上，开始把你往门外推，你一出去她就砰的一声把门关上了。");
         saveContent.doloresAngry = true;
         get_game().mothCave.caveMenu();
      }
      
      public function doloresWingsStay() : void
      {
         clearOutput();
         outputText("你正准备告诉多洛雷斯，你很乐意留下来陪她度过这个过程，但还没等你把话说完，她就打断了你。[say: 没关系的，[Father]。我不会再留你在这里了。]");
         outputText("[pg]这倒是让人有些意外，毕竟她以前似乎很希望你陪在她身边。");
         outputText("[pg][say: 我……想自己处理这件事。忍受几个小时的轻微疼痛，完全在我的能力范围之内，]她有些傲慢地说道。但她那冷漠的伪装并没有维持多久，很快就破功了，她补充道：[say: 我需要自己处理这件事。你" + (saveContent.doloresTimesLeft > 0 ? " haven\'t" : "\'ve") + "一直都在我身边，所以我需要证明……证明我自己一个人也能行。]");
         outputText("[pg]你问她是否确定。");
         outputText("[pg][say: 非常确定，]她回答道，嘴角挂着温柔的微笑。说完，你在西尔维娅的嘴唇上轻轻啄了一下，走出了洞穴。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function doloresWingsLeave() : void
      {
         clearOutput();
         outputText("你向两位蛾女挥手告别，准备离开。多洛雷斯看起来并没有因为你要走而特别伤心，她年轻的脸上带着一种" + (saveContent.doloresTimesLeft > 0 ? "听天由命的表情" : "坚忍的神情") + "，在你吻别了两位女士之后，便离开了洞穴。");
         _temp_1.doloresTimesLeft += 1;
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function doloresWingsHug() : void
      {
         clearOutput();
         outputText("你[walk]上前，双臂环抱住多洛雷斯，将她紧紧拥入怀中。她开始微弱地抗议，但很快就意识到你哪儿也不去。你就这样抱了她一会儿，小心翼翼地不去触碰她那肯定很敏感的翅膀。没过多久，多洛雷斯就在你的怀抱中融化了，然后也回抱住你，她的四只手在你的背上摩擦。在眼角的余光中，你刚好能瞥见西尔维娅正带着温暖的微笑看着你们。");
         outputText("[pg]当你最终退开时，这只年轻飞蛾的眼睛看起来有些湿润，她的下唇微微颤抖着。[say: ……谢谢你，[Father]，]她轻声说道。");
         outputText("[pg]你很快就得走了，但还是不忘问她是否还好。");
         outputText("[pg][say: 我会没事的。]");
         outputText("[pg]说完，你在西尔维娅的嘴唇上轻轻啄了一下，走出了洞穴。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function doloresWingsCompliment() : void
      {
         clearOutput();
         outputText("你给了她最后一句赞美，这让她的脸皱了起来，被矛盾的情绪折磨着。看来她不太能接受赞美，她那几乎斗鸡眼和紧闭的嘴唇就是证明。");
         outputText("[pg]她紧张的沉默开始变得令人担忧，但突然，所有的紧张感从她脸上消失了，她的眼睛变得浑浊。你在她眼前挥了挥手，她迟缓地转向你。");
         outputText("[pg][say: 怎么了，[Father]？]她带着甜美的微笑说道。");
         outputText("[pg]看来最好还是就此打住。");
         doNext(doloresTalkMenu);
      }
      
      public function doloresWingsChat() : void
      {
         clearOutput();
         outputText("既然它们已经完全长出来了，你想好好看看她的翅膀。在你的要求下，她红着脸交叉双臂。她脸上的惊愕超出了你对这样一个简单询问的预期，但最终，她似乎得出了某种结论。[say: 呃——好吧。]");
         outputText("[pg]你的女儿慢慢转过身，直到她面对着后墙，她的手臂在这样做时有点发抖。她的裙子现在有一个小开口，她的翅膀从那里伸出来，但看起来不够大，无法让她完全展开。她的目光紧紧盯着地面，慢慢地将裙子的肩带从肩膀上滑下，向你露出她光洁的背部。");
         outputText("[pg]它们太不可思议了。深浅不一的灰色波纹顺着它们的长度辐射开来，不断变化的色调相互交织，在迷人的涟漪中巧妙地融合和变形。从一种色调到另一种色调的无缝过渡，引导你在她宽阔的翅膀上踏上起伏的路径，你觉得你可以花上几个小时追踪隐藏在这里的漩涡图案而迷失方向，永远找不到出路。幸运的是，两个白色的小眼斑像灯塔一样从昏暗的海洋中突出，引导你回到安全地带。");
         outputText("[pg]你不敢相信她把它们藏在后面。");
         outputText("[pg]当你告诉她你的印象时，多洛雷斯似乎并没有感到受宠若惊，继续盯着她的脚，除了[say: 嗯。]之外没有任何回应。过了一会儿，她迅速折叠起翅膀，拉起肩带，转过身来面对你。你现在可以看到她脸颊上燃烧的红晕。");
         if(saveContent.doloresSex > 0)
         {
            outputText("[pg][say: 你还想“检查”什么吗，你这个色鬼？]");
         }
         else
         {
            outputText("[pg][say: 就这些了吗？]");
         }
         menu();
         addNextButton("赞美",doloresWingsCompliment);
         addNextButton("戏弄",doloresWingsTease);
         addNextButton("就这些",doloresWingsThatsAll);
      }
      
      public function doloresWings() : void
      {
         clearOutput();
         doloresReset();
         outputText("你走进多洛雷斯的房间，却听到一声痛苦的尖叫。你吃了一惊，但房间里似乎并没有什么直接的危险，只有你的女儿痛苦地弯着腰站在床边。");
         outputText("[pg][say:啊……该死的，好痛——]当她抬起头对上你的视线时，她突然安静下来，脸上极度烦躁的表情立刻变成了羞愧。[say:[Father]！我没听到您进来。]她清了清嗓子，红晕已经蔓延到了脸上。[say:我，那个……呃……]有什么问题吗？她皱了皱眉，你不知道是因为疼痛还是尴尬，然后说道：[say:我为我的粗口向您真诚地道歉。]");
         outputText("[pg]别管那个了，她为什么尖叫？");
         outputText("[pg][say:哦！是的，我的翅膀终于长出来了。]她转过身，多亏了那件露背裙，你可以看到她原本下垂的翅膀现在奇怪地卷曲着，半充血地挂在背后。[say:这是一个非常痛苦的过程，但母亲正在——]");
         outputText("[pg]她再次被突然的闯入打断了，这次是西尔维娅，这位疲惫不堪的蛾娘抱着一个巨大而奇怪的装置飞进了房间。她一落地就几乎把它扔在了地板上，气喘吁吁。看来她对女儿的关心超过了对肺部的关心，尽管严重喘不过气来，她还是开始说话了。");
         outputText("[pg][say:你]——*喘气*——[say:还好吗]——*喘息*——[say:亲爱的？]多洛雷斯开始安慰她的母亲，这让你有机会检查西尔维娅带进来的东西。那是一个大架子，上面有几条用途不明的带子。它看起来有点不对劲，但——你意识到，这是捆绑设备。" + (get_player().cor > 50 ? "你无法否认有一丝兴奋，但尽管如此" : "这确实出乎意料，所以") + "你向西尔维娅寻求解释。");
         outputText("[pg]还没等她回答，多洛雷斯就插嘴道：[say:这确实是个有用的装置。它能让我以更舒适的姿势休息，同时让重力完成大部分排出胎粪的工作。]");
         outputText("[pg]西尔维娅终于喘过气来，补充道：[say:是的，我母亲用过它，她的母亲也用过。]她转向多洛雷斯。[say:我记得我当时的经历有多么不愉快，但这至少应该能帮上一点忙。如果你还需要什么，尽管开口。]");
         outputText("[pg]年轻的蛾娘给了母亲一个微小但温暖的微笑。[say:谢谢您，母亲，但您已经做了这么多，我不知道我还能需要什么。]沉默了几秒钟后，她瞥了你一眼，说道：[say:那么，我很感激您能来这里，[Father]，但这可能需要相当长的时间。]");
         outputText("[pg]走之前你要做点什么吗？");
         saveContent.doloresProgress = 10;
         menu();
         addNextButton("邀请留下",doloresWingsStay);
         addNextButton("拥抱",doloresWingsHug);
         addNextButton("离开",doloresWingsLeave);
      }
      
      public function doloresTribbing2() : void
      {
         clearOutput();
         outputText("而到了这个时候，你的身体已经在叫嚣着让你行动了。你的胯部紧贴着她的胯部摩擦，让你们的入口互相厮磨。前戏提供了充足的润滑，让你能在她的阴唇上顺畅地滑动，带来极乐般的感受，你的动作也迅速加快，进入了火热的节奏。汗水的味道和女儿绯红的脸颊让你产生了一种令人陶醉的满足感，而下体传来的快感也同样令人愉悦。每隔一会儿，你们的阴蒂就会互相摩擦碰撞，让一阵触电般的快感传遍全身，暂时打断你的动作。");
         outputText("[pg]气氛越来越火热，你开始沉浸在快感之中。你的一只手放在她的后腰上，另一只手伸下去，开始在她的阴蒂和你的阴蒂之间交替抚弄，确保两边都能得到均匀的照顾。多洛雷斯只能紧紧地抱住你，任由你把她抚弄得神魂颠倒，嘴里发出细碎的呜咽和呻吟。");
         outputText("[pg]感觉到自己快要到了，你把多洛雷斯紧紧地拉向自己贴合，让她惊呼出声。你的手几乎没有活动的空间，但你疯狂的手指仍在尽力让你们俩都达到高潮。你女儿坚挺的乳头抵着你，当你向她展示这片刻的极乐时，她似乎失去了之前所有的" + (doloresComforted() ? "尴尬" : "抗拒") + "。你不断地摩擦、摇晃、挺动，直到她发出一声尖叫，达到了极限，她身体随之而来的颤抖也让你紧随其后迎来了高潮。");
         outputText("[pg]当你们从高潮中平息下来时，你们的手臂依然互相搂着。你几乎只能专注于呼吸，但你的手指仍在抚摸她的头，温柔地梳理着她凌乱的头发。当脑海中的迷雾终于散去一些时，你看向你的女儿，想看看她怎么样了，尽管之前那声极乐的尖叫已经给了你很好的暗示。");
         if(doloresComforted())
         {
            outputText("[pg]然而，当她突然瘫倒在你身上，显然无法再支撑自己时，你还是吃了一惊。你抱着她，直到她不再需要为止，只是享受着你那充满感激的女儿的温暖。最终，她设法向后靠去，尽管她看起来仍然摇摇晃晃。[pg][say:我想……我需要……休息一下，]她气喘吁吁地说。");
         }
         else
         {
            outputText("[pg]然而，当她把脸埋进你怀里时，你感觉到她轻轻打了个嗝。你试图把她拉回来，但她抗拒着，进一步钻进她[father]的怀抱。当你终于能够把她的头倾斜到足以看清她的脸时，你可以看到两行泪水从她的眼睛里流下来。[pg][say:对不起，[father]。请，我……没什么。我只是……需要一些时间休息。]");
         }
         outputText("[pg]你最终从蛾女身上松开，[if (singleleg) {站起来|站起身}]并收拾好你的[armor]。多洛雷斯平躺着，一只手臂摊开在脸上，在经历了所有这些消耗后休息。你向她做最后的告别，然后前往营地，感觉自己也相当疲惫。");
         get_player().orgasm("Vaginal");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function doloresTribbing() : void
      {
         clearOutput();
         outputText("不想再浪费一秒钟，你几乎是飞扑进女儿的怀里，立刻用一个热情的吻封住了她的双唇。多洛雷斯对此完全没有准备，你趁她发愣的时候尽情地品尝着她，回味着她那甜美年轻的唇瓣。你最终不得不退开，一丝细细的银丝仍然将你们连接在一起，但你已经在想象你能对她做的所有事情了。");
         outputText("[pg]然而，在享受快乐之前，还有一个障碍。你后退了一步，但多洛雷斯仍然闭着眼睛，微微撅着嘴唇，过了一会儿才红着脸突然反应过来。她站在你面前，害羞地摆弄着她的裙子，而这件裙子现在必须脱掉。");
         outputText("[pg]你命令女儿脱衣服。不出所料，她立刻变得慌乱起来，不敢与你对视。然而，" + (doloresComforted() ? "她花了一点时间做心理准备，坚定地握紧了双拳" : "她的眼神突然变得空洞，她转向你，虽然看起来她与其说是在看你，不如说是视线穿透了你") + "。她敷衍地把衣服从头上脱下，小心翼翼地不做出任何可能显得有一丝挑逗的动作。无论如何，你都很享受这场表演，欣赏着她那轻盈的身体慢慢展现在你饥渴的视线中。");
         outputText("[pg][if (isnaked) {既然你不需要脱衣服，你便直接凑到她身边|如果只有她一个人脱衣服就太不公平了，所以你很快也跟着脱了起来，在你扭动着脱下[armor]时，你故意向女儿展示了一番，让她羞得移开了视线}]。");
         outputText("[pg]想了一会儿，你琢磨着该如何进行，最终想出了一个能好好品鉴你那秀色可餐的女儿的绝妙主意。你向前[walk]近了些，然后顺势坐在了一块恰好铺在那里的地毯上，并示意多洛雷斯也坐下。她紧张地照做了，不过很明显她并不知道你打算做什么。");
         outputText("[pg]你不想让她悬着心太久，于是你[if (singleleg) {向后挪了挪，好让[if (isgoo) {你黏糊糊的身体|你的尾巴}]能向她伸展过去|伸展开双腿，向她那边探去}]。她似乎还是有些困惑，直到你的[legs]开始与[if (singleleg) {她的腿|她的双腿}]交缠在一起，她的脸上才闪过一丝恍然大悟的神情。将你们俩锁在一起后，你又凑近了一些，直到你们的下体几乎贴在一起。多洛雷斯沉重地喘息着，" + (doloresComforted() ? "充满期待" : "忐忑不安") + "，显然对这种淫靡的场面还是有些不太适应。");
         outputText("[pg]你觉得她需要一些前戏热身，所以在进入正题之前，你将她的身子拉近，以便双手能抚摸她那青春曼妙的娇躯。你的手指在她柔软的肢体上游走，顺着肩膀的曲线，滑过光滑的肌肤，掠过前臂的甲壳，最后停留在手腕处那簇柔软的绒毛上。你细细抚摸了片刻，从你触碰时她微微颤抖的反应来看，那里显然十分敏感。");
         outputText("[pg]继续探索着她的身体，你将注意力转移到她的乳房上，挑逗并把玩着她娇小的胸部。虽然那里不够丰满，无法让你牢牢握住，但玩弄起来的乐趣丝毫不减，你很快就沉浸其中，几乎忘了原本的目的。出乎意料的是，没过几分钟，多洛雷斯就几乎瘫软在你怀里，脑袋靠在你的[chest]上，大口大口地喘着粗气。她的肌肤触感温热，显然你已经让她兴奋到了极点，于是你准备进入正题。你挺动骨盆，让自己的胯部一点点靠近女儿的私处，直到两者紧紧贴合，一阵令人愉悦的酥麻感瞬间传遍了你的双腿。");
         outputText("[pg]此时，年轻的蛾女靠在你的肩膀上发出了一声长长而低沉的呻吟，她紧紧抓住你的腰侧以保持平衡，身体在你的怀里微微颤抖。你[paternal]地拍着她的背，轻声安抚她，直到你觉得她准备好让你继续。");
         doNext(doloresTribbing2);
      }
      
      public function doloresToysTeach() : void
      {
         clearOutput();
         outputText("你可以看出西尔维娅用玩具并没有取得任何进展，但似乎你仍然可以挽救这个局面。多洛雷斯的目光锁定在书架上一本特别厚的书上，那本书远远超出了她有限的触及范围。你脑子转得飞快，把书抽出来，发现那是一本插图百科全书。你不确定它有多新，因为它的书页已经发黄，而且你在翻阅时明显没有看到关于腐化怪物的文章，但它应该能起作用。");
         outputText("[pg]你轻轻地推了西尔维娅一下，让她困惑地抬头看着你，然后转向你的女儿。她的目光仍然没有离开那本书，嘴巴现在微微张开，你忍不住轻笑了一声，然后问她是否想看看。她用力地点头表示同意，于是你坐在小毛毛虫旁边，翻开百科全书的随机一页。");
         outputText("[pg]碰巧是一篇关于当地动物群的文章。好吧，自从这篇文章写成以来，情况肯定发生了变化，但它仍然足以娱乐你的孩子。当你开始朗读时，多洛雷斯全神贯注地听着你的每一个字，对你破译书页上爬行的神秘符号的能力感到惊讶。尽管不知道它们是什么意思，她还是伸出一只小手在那些神奇的字母上划过，另外三只手紧紧抓住书的边缘，仿佛那是一件巨大的宝藏。当你开始翻页，慢慢地读出每个单词时，你的女儿惊奇地盯着你看，她完全惊讶的表情让你怀疑她是否真的听懂了。");
         outputText("[pg]西尔维娅在多洛雷斯的另一边坐下，加入了你们。她那轻柔、舒缓的声音很快就伴随着你的声音一起朗读着书本，你的女儿似乎很高兴能被这样宠爱。你和这只蛾女找到了节奏，轮流给这个热切的孩子读书。多洛雷斯经常试图模仿你们的发音，效果各异。当她尝试了半打次后，终于成功发出“妖精”这个词的音时，你感到非常自豪。");
         outputText("[pg]过了一段时间，你的朗读突然被右边传来的一声哈欠打断了。你转头看去，发现多洛雷斯正在揉眼睛，显然是因为之前的兴奋而累坏了。你微笑着抱起女儿，把她带到她的房间。当你到了那里，你看到她已经从婴儿床换到了大床上，你立刻把她放了进去。她的头一沾枕头就睡着了，打呼噜的声音出奇地响。看来她睡着时比醒着时还要吵。你感觉到背上有一只手，转头看到西尔维娅正带着温柔的微笑看着你的女儿。你们俩悄悄地退出她的房间，你向西尔维娅简单道别后便回家了。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function doloresToysLeave() : void
      {
         clearOutput();
         outputText("好吧，看来你在这里帮不上什么忙，" + (get_player().cor > 50 ? "而且这似乎也有点无聊" : "不管你有多想帮忙") + "。你最后怜悯地看了女儿一眼，然后告诉西尔维娅你要离开了。[say:哦，]她有些沮丧地说。[say:好吧，那保重……]你也向多洛雷斯道别，然后走了出去。当你走出洞穴时，你听到，[say:对不起。我确定这里有什么东西……]");
         dynStats(DynStat.Cor(3));
         _temp_1.doloresTimesLeft += 1;
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function doloresToysHelp() : void
      {
         clearOutput();
         outputText("你为西尔维娅感到难过，因为她找不到任何能引起注意的东西而感到无助，所以你决定协助她尝试和你的女儿玩耍。你跪在她们旁边，看了看西尔维娅拿出来的各种玩具。这些闪亮的小玩意儿似乎都不能更好地吸引多洛雷斯的注意力，但就在事情开始变得真正绝望的时候，玩具堆底部的一样东西引起了你的注意。");
         outputText("[pg]你捡起你潜在的救星，并向西尔维娅询问。她回答说，[say:哦，那是我妈妈很多年前给我买的一本图画书，就在她……就在一切改变之前不久。]西尔维娅尽力让自己看起来很开心，但你可以从她眼中的痛苦看出，这勾起了一些痛苦的回忆。为了挽救气氛，你告诉多洛雷斯你给她带了点东西。她的目光慵懒地转向你，脸上带着和以前一样冷酷的表情。");
         outputText("[pg]然而，当你把书给多洛雷斯看时，她的眼睛立刻亮了起来。她跪着挪到你身边，你坐在她旁边。你俯下身，把书拿在你们中间，慢慢地读出书名，[i:魔法猎人]，同时用手指划过字母，向她展示它们的发音。当你开始翻页，慢慢地读出每个单词时，你的女儿惊奇地盯着你看，她完全惊讶的表情让你怀疑她是否真的听懂了。");
         outputText("[pg]西尔维娅在多洛雷斯的另一边坐下，加入了你们。她那轻柔、舒缓的声音很快就伴随着你的声音一起朗读着书本，你的女儿似乎很高兴能被这样宠爱。你和这只蛾女找到了节奏，轮流给这个热切的孩子读书。多洛雷斯经常试图模仿你们的发音，效果各异。当她尝试了半打次后，终于成功发出“妖精”这个词的音时，你感到非常自豪。");
         outputText("[pg]过了一段时间，你的阅读突然被右边传来的哈欠声打断了。你转过头，看到多洛雷斯正在揉眼睛，显然是因为过度兴奋而累坏了。你微笑着抱起你的女儿，带她回她的房间。当你到达那里时，你看到她已经从婴儿床换到了床上，你立刻把她放了进去。她的头一碰到枕头，就睡着了，她打呼噜的声音出奇地大。看来她睡着的时候比醒着的时候还要吵。你感觉到一双手放在你的背上，转过头看到西尔维娅正带着温柔的微笑看着你的女儿。你们俩默默地退出她的房间，在回家之前，你向西尔维娅简短地道了别。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function doloresToys() : void
      {
         clearOutput();
         doloresReset();
         outputText("你决定去看看多洛雷斯。虽然她出生没多久，但她似乎已经以惊人的速度成长，所以顺便去看看似乎是个好主意。当你到达西尔维娅的家时，洞穴里回荡着她微弱的声音。进入主房间，你发现你的女儿坐在书架旁，她的母亲蹲在她旁边。你看到多洛雷斯现在大约有蹒跚学步的孩子那么大，她身上残留的婴儿肥仍然让她看起来像个孩子。");
         outputText("[pg]西尔维娅注意到了你的到来，挥手向你打招呼，然后说道：[say:你好，[name]。我正在给多洛雷斯看一些我妈妈小时候给我买的玩具。你为什么不加入我们呢？]你有些好奇，走到蛾娘和她女儿玩耍的地方，注意到多洛雷斯对于一个正在玩耍的孩子来说出奇地安静。");
         outputText("[pg]你想仔细看看她们在做什么，于是凑近一看，发现西尔维娅手里拿着几个玩具，还有几个散落在小毛毛虫周围。[say:哦，这个套娃怎么样？我像你这么大的时候可喜欢它了……]蛾娘似乎在努力引起女儿的兴趣，但看起来并没有取得多大成功。她的四只手臂模糊地挥舞着，在毛毛虫面前展示着一堆小玩意儿，但无论是发条娃娃、陀螺还是其他任何小饰品，似乎都无法吸引她。");
         outputText("[pg]相反，她似乎在浏览旁边书架上的书。很明显她看不懂上面的文字，但当她的目光扫过那些古老书籍的书脊时，她的眼睛依然闪闪发光。多洛雷斯回头看了看她的母亲，她通常平静的脸上掠过一丝轻微的苦恼。她的嘴唇微微张开，勉强发出了一声几乎听不见的，[say:嗯。]");
         outputText("[pg]然而，西尔维娅似乎并没有注意到这一点。她继续在玩具堆里翻找，由于找不到任何新东西，她表现出了绝望的迹象。无论蛾娘多么赞美她童年的小玩意儿，多洛雷斯似乎对她曾经感兴趣的东西根本不感兴趣。你或许应该做点什么，但你打算如何解决这个问题呢？");
         saveContent.doloresProgress = 3;
         menu();
         addNextButton("帮助西尔维娅",doloresToysHelp).hint("协助西尔维娅逗你的女儿开心。");
         addNextButton("教阅读",doloresToysTeach).hint("教多洛雷斯如何阅读。");
         addNextButton("离开",doloresToysLeave).hint("你没有时间做这个。");
      }
      
      public function doloresTapestryMaking() : void
      {
         clearOutput();
         doloresReset();
         outputText("你走进黑暗的洞穴，却没有像往常一样有人来迎接你。不过，后走廊传来的微弱光芒和说话声打消了你潜在的担忧，于是你[walk]向他们走去。");
         outputText("[pg][say:啊！母亲大人，我真的必须……保持这个姿势吗？]");
         outputText("[pg][say:好了好了，做个乖女孩，听妈妈的话。]");
         if(saveContent.doloresSex > 0)
         {
            outputText("[pg]哦？");
         }
         outputText("[pg]你走进房间，看到多洛雷斯在一个坐着的西尔维娅面前摆着一个明显很不舒服的姿势，西尔维娅正在画素描，两只手把玩着铅笔，第三只手若有所思地托着下巴。与此同时，年轻的蛾娘尴尬地扭动着躯干，强忍着不让自己做鬼脸。");
         outputText("[pg][say:保持姿势对于画出尽可能准确的素描非常重要。]");
         if(saveContent.doloresSex > 0)
         {
            outputText("[pg]哦。");
         }
         outputText("[pg][say:可是母亲大人，我——]你女儿的目光转向门口的你，她顿时说不出话来。");
         outputText("[pg][say:欢迎，亲爱的。快进来，我们正在为多洛雷斯的挂毯画草图，]西尔维娅带着自豪的微笑说道。[say:哦，我的小女孩长大了！]");
         outputText("[pg]在发生那件事之后这么快就看到她们俩这样，感觉简直有些不真实。你猜她们一定适应能力很强，或者至少愿意忽略那些她们不想去想的事情，但你对此发表的任何评论都可能破坏气氛，所以目前，你只是看着她们。");
         outputText("[pg]不管怎样，年轻的蛾娘和她的母亲这样享受彼此的陪伴，感觉很不错。你可以看出，尽管多洛雷斯外表冷漠，但两人之间确实有一种羁绊。她们说话的方式，她们看着对方的眼神，那种……你觉得是尊重的感觉，这一切都如此清新温馨。多洛雷斯似乎真的在对她的母亲敞开心扉。");
         outputText("[pg][say:好了，再坚持一小会儿。]");
         outputText("[pg][say:嗯。最终的设计会是什么样子？]");
         outputText("[pg][say:哦，我不能告诉你！你得等我画完。]");
         outputText("[pg]现在，你可以轻易地看出多洛雷斯假笑背后隐藏的真诚笑容，但她没有再说什么，而是再次端正了姿势。看着她这个样子，你现在能看到一种以前没有的优雅，她的五官中有一种举止，让她看起来更加优雅，甚至可以说是精致。你不知道这具体是什么时候发生的，但你的女儿似乎成熟了，哪怕只有一点点。");
         outputText("[pg][say: 好了，完成了。]");
         outputText("[pg]多洛雷斯立刻瘫软下来，耷拉着肩膀，脸部肌肉松弛，失去了很多优雅。[say: 呃，我开始觉得我会一直保持那个姿势了……] 西尔维娅只是给了女儿一个慈母般的眼神，引得年轻的蛾子又是一声嗤笑。她的目光闪向你，停顿了一下，但还是继续说道。[say: 无论如何，我现在似乎有空了，[Father]，如果你想谈谈的话。]");
         outputText("[pg]西尔维娅显然是在你没注意的时候溜了过去，因为她已经在门口了，她说道：[say:如果你有什么需要，我会在老地方等你。]");
         saveContent.doloresProgress = 14;
         doNext(doloresMenu);
      }
      
      public function doloresTapestryGifting() : void
      {
         clearOutput();
         doloresReset();
         outputText("你在多洛雷斯的房间里找到了她，她背对着你。她站在床前，盯着床上的一些东西，她的身形挡住了你的视线，你觉得你听到了微弱的哭声。你呼唤她，她转过身来很慢，但当她转过身来时，你从她发自内心的笑容中看出，那是喜悦的泪水。");
         outputText("[pg][say: 哦，[Father]，我……我收到了最棒的礼物。]");
         outputText("[pg]她温柔地拿起床上的物品，为了让你看清楚而展开。你可以在上面看到多洛雷斯生活中的各种场景，用充满爱意的手法描绘出来，真正展现了她的本质。看着所有赋予它生命的小细节，你几乎觉得你正站在两个她旁边。一件真正令人印象深刻的艺术品。");
         outputText("[pg]从多洛雷斯湿润的眼睛和颤抖的呼吸来看，她似乎也有同感。过了一会儿，她颤抖的双手将挂毯放回床上，发出了一声惆怅的叹息。[say: 我没想到……嗯，我想我在内心深处一直都知道，但我没想到她真的理解我。得到这样的确认……嗯，无法用言语来形容。]");
         outputText("[pg]突然，她的眼睛向上看。[say: 哦，但我不想用这些浪费你的时间。请允许我去把它挂起来，我马上就回来。]");
         outputText("[pg]年轻的蛾子从你身边擦肩而过，没等多久就回来了。她的眼泪已经干了，她短暂的情绪波动似乎已经平息。然而，她轻快的步伐让你知道她真的对她的礼物很满意。");
         outputText("[pg][say: 那么，我们谈谈吧。]");
         saveContent.doloresProgress = 15;
         doNext(doloresMenu);
      }
      
      public function doloresTalkingOkay() : void
      {
         clearOutput();
         outputText("你告诉女儿，如果她不总是想说话也没关系，她永远不应该感到有压力去做她不想做的事情。你解释说，她比别人少言寡语是完全可以的，无论如何，你和西尔维娅都会爱她。飞蛾女孩点头同意，并补充了几句鼓励的话。你不确定你说的每一句话她都能听懂，但从她专注地盯着你的眼神来看，她似乎明白了你的意思。");
         outputText("[pg]当你讲完后，多洛雷斯似乎被你的话极大地安慰了，她那通常面无表情的脸上绽放出一丝微笑。她跳起来，冲过去抱住你，她那纤细的手臂" + (get_player().get_tallness() > 96 || get_player().biggestTitSize() > 10 || get_player().thickness > 75 ? "根本无法" : "不太能") + "环绕你的躯干。当她充满爱意地蹭着你时，你忍不住对她表达感情的方式微笑。");
         outputText("[pg]当你听到女儿发出微弱、压低声音的耳语时，你感到非常惊讶，尽管发生了一切。尽管她的声音被你的胸膛闷住了，你还是勉强听清了，[say:谢谢你，[Father]。]有点生硬，但还是温暖了你的心。你把她抱得更紧了，然后把手移上去摸了摸她的头。");
         outputText("[pg]当你温柔地拥抱她时，她叹了口气，你抬起头，看到西尔维娅正对着你们俩微笑。飞蛾女孩飘到你身边，从多洛雷斯身后加入了拥抱，把你的女儿夹在你们俩中间。小毛毛虫发出一声[say:呀！]但六只手臂拥抱她的温暖很快就安抚了她。");
         outputText("[pg]过了宝贵的一刻，你后退一步，把多洛雷斯从你的怀抱中松开。你很遗憾这么快就要走了，但从她涨红的脸上明显的尴尬来看，你的女儿似乎已经被抱够了。你向她和西尔维娅简单道别，西尔维娅回答说，[say:谢谢你今天的帮忙。]多洛雷斯只是挥了挥手，但她微妙的微笑告诉你你需要知道的一切。你带着一种令人陶醉的[paternal]自豪感离开了。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function doloresTalkingLeave() : void
      {
         clearOutput();
         outputText("你实在没什么好补充的了，而且" + (get_player().cor > 50 ? "这一切都有点太无聊了，提不起你的兴趣" : "反正你还有重要的事情要回去处理") + "。你站起身，走到女儿身边，弯下腰轻轻拍了拍她的头。你告诉她不要太担心这件事，然后便离开了。当多洛雷斯转头继续看书时，你忍不住注意到她脸上闪过一丝失望。");
         dynStats(DynStat.Cor(3));
         _temp_1.doloresTimesLeft += 1;
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function doloresTalkingExpress() : void
      {
         clearOutput();
         outputText("你告诉女儿，表达自己对她来说很重要。即使她不总是想说什么，让别人知道她的感受也是健康关系的重要组成部分。你解释说，你和西尔维娅想听听她要说什么，因为你们俩都关心她。你不确定你说的每一句话她都能听懂，但从她专注地盯着你的眼神来看，她似乎明白了你的意思。");
         outputText("[pg]多洛雷斯似乎把这一切都记在心里了。她曾经紧张的颤抖，现在散发出一种兴奋的气息，她年轻的身体几乎在随着能量震动。她紧握双拳，闭上眼睛，脸颊微微鼓起，似乎在积蓄力量去做……不管她打算做什么。");
         outputText("[pg]最后，伴随着一阵巨大的声音，她脱口而出，[say:我想看真正的妖精！]你对她突然的输出印象深刻，但你确实花了一点时间才弄明白她的意思。一旦你明白了，你轻声笑了笑，告诉她你会考虑的。似乎连这也足够让她满足了，她跳起来，冲过去抱住你，她那纤细的手臂" + (get_player().get_tallness() > 96 || get_player().biggestTitSize() > 10 || get_player().thickness > 75 ? "根本无法" : "不太能") + "环绕你的躯干。");
         outputText("[pg]当你温柔地拥抱她时，她叹了口气，你抬起头，看到西尔维娅正对着你们俩微笑。飞蛾女孩飘到你身边，从多洛雷斯身后加入了拥抱，把你的女儿夹在你们俩中间。小毛毛虫发出一声[say:呀！]但六只手臂拥抱她的温暖很快就安抚了她。");
         outputText("[pg]过了宝贵的一刻，你后退一步，把多洛雷斯从你的怀抱中松开。你很遗憾这么快就要走了，但从她涨红的脸上明显的尴尬来看，你的女儿似乎已经被抱够了。你向她和西尔维娅简单道别，西尔维娅回答说，[say:谢谢你今天的帮忙。]多洛雷斯只是挥了挥手，但她微妙的微笑告诉你你需要知道的一切。你带着一种令人陶醉的[paternal]自豪感离开了。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function doloresTalking() : void
      {
         clearOutput();
         doloresReset();
         outputText("你前往西尔维娅的洞穴，一路上都在想着多洛雷斯。她似乎是个好孩子，但她沉默寡言的倾向有些令人担忧。把这些想法抛在脑后，你走进了飞蛾女孩的家。");
         outputText("[pg]西尔维娅跪坐在离多洛雷斯不远的地方，多洛雷斯正试图与一本对她那双小手来说太大的满是灰尘的书搏斗。打量着你的女儿，你发现她比你上次见到她时又长大了，现在大约有七八岁那么大。[say:哦，你好，[name]，]西尔维娅说。[say:我们现在正在练习阅读。你想加入我们吗？]");
         outputText("[pg]你走过去在飞蛾女孩旁边坐下，看着你的女儿摇摇晃晃地向你们俩走来，沉重的书让她失去了平衡。当她终于走到你们面前时，她把书扔在地上，然后肚子朝下扑通一声趴在书旁边，双腿在身后张开。从封面上你可以看出这是一本奇幻小说，尽管考虑到玛瑞斯的魔法本质，你觉得它实际上可能是一部历史著作。多洛雷斯以她这个年龄令人印象深刻的速度翻阅着书页，只是偶尔停下来指着一个词让她的母亲给她解释。你问这个小毛毛虫她觉得这本书怎么样，她回答说，[say:很好。]你试图进一步引导她，但她的大部分回答仍然是单音节的。");
         outputText("[pg]西尔维娅叹了口气，转向你。[say:她学得很快，但我很难让她一次多说几个字。她似乎能听懂我的话，但说到说话……]你们俩又转头看向多洛雷斯。年轻的毛毛虫女孩看起来很纠结，她的眼睛在你和西尔维娅之间紧张地扫视。看来她正在寻求一些指导。你应该给她什么建议？");
         saveContent.doloresProgress = 4;
         menu();
         addNextButton("没关系",doloresTalkingOkay).hint("安静一点也没关系。");
         addNextButton("表达自己",doloresTalkingExpress).hint("她应该学会表达自己的感受。");
         addNextButton("离开",doloresTalkingLeave).hint("你不想留下来。");
      }
      
      public function doloresTalkMenu() : void
      {
         clearOutput();
         outputText("你想和她聊些什么？");
         menu();
         addNextButton("随便聊聊",doloresJustChat).hint("想到什么就聊什么。");
         addNextButton("西尔维娅",doloresSylviaChat).hint("问问她关于她母亲的事。");
         addNextButton("文学",doloresLitChat).hint("她喜欢读什么？");
         if(get_doloresProg() > 5)
         {
            addNextButton("家",doloresHomeChat).hint("她喜欢这个地方吗？");
         }
         if(get_doloresProg() > 8 && saveContent.doloresAmbitions < 1 || get_doloresProg() > 12)
         {
            addNextButton("魔法",doloresMagicChat).hint("问问魔法对她意味着什么。");
         }
         if(get_doloresProg() > 8)
         {
            addNextButton("性",doloresSexChat).hint("提起性知识。");
         }
         if(get_doloresProg() > 9)
         {
            addNextButton("翅膀",doloresWingsChat).hint("她喜欢她的新肢体吗？");
         }
         if(get_doloresProg() > 9 && saveContent.doloresAmbitions == 1)
         {
            addNextButton("抱负",doloresAmbitionChat).hint("和她谈谈她的未来。");
         }
         addButton(14,"返回",doloresMenu);
      }
      
      public function doloresTalkAfterYes() : void
      {
         var question4:int;
         var _g4:DoloresScene;
         var question3:int;
         var _g3:DoloresScene;
         var question2:int;
         var _g2:DoloresScene;
         var question1:int;
         var _g1:DoloresScene;
         var question:int;
         var _g:DoloresScene;
         clearOutput();
         outputText("你确实想谈谈，并把这个想法告诉了她。多洛雷斯点点头，但没有再做什么。");
         outputText("[pg]看来你得先开口了。但该问什么呢？");
         menu();
         _g = this;
         question = 0;
         addNextButton("书",function():void
         {
            _g.doloresTalkAfterAnswer(question);
         }).hint("问问她在仪式中使用的那本书。");
         if(int(saveContent.doloresFinal % 10) > 1)
         {
            _g1 = this;
            question1 = 1;
            addNextButton("怪物",function():void
            {
               _g1.doloresTalkAfterAnswer(question1);
            }).hint("问问她召唤出的那个存在。");
         }
         _g2 = this;
         question2 = 2;
         addNextButton("还会吗？",function():void
         {
            _g2.doloresTalkAfterAnswer(question2);
         }).hint("问问她以后还会不会做类似的事。");
         _g3 = this;
         question3 = 4;
         addNextButton("隐瞒",function():void
         {
            _g3.doloresTalkAfterAnswer(question3);
         }).hint("她为什么要这么偷偷摸摸地做这件事？");
         _g4 = this;
         question4 = 3;
         addNextButton("确定",function():void
         {
            _g4.doloresTalkAfterAnswer(question4);
         }).hint("你完成了所有提问。");
      }
      
      public function doloresTalkAfterNo() : void
      {
         clearOutput();
         outputText("你抬起手示意她安静，并说你不会强迫她说出任何事。你已经知道你需要知道的一切了。");
         outputText("[pg]多洛雷斯似乎很接受这一点，她低垂的脸上露出一丝微笑。[say:谢谢你，[Father]。我……很感激你的体谅。]她站起身，微微伸了个懒腰，最后转过头看着你的眼睛。[say:如果你想见我，我会在我的房间里。]");
         outputText("[pg]然而，在真正离开之前，她犹豫了片刻。她还有什么话要说吗？看来是的，因为她径直走到你面前，再次开口。");
         outputText("[pg][say:给你。]蛾娘把什么东西塞给你，你低头一看，立刻认出了那本惹出这么多麻烦的书。[say:我想把它交给你。" + (saveContent.doloresDecision == 1 ? "谢谢你之前让我留着它。" : "这次是永远交给你了。") + "]没有进一步的解释，她大步走开了，卸下心头的重担后，她显得出奇的平静。");
         get_player().createKeyItem("Old Eldritch Tome",0,0,0,0);
         get_game().mothCave.caveMenu();
      }
      
      public function doloresTalkAfterAnswer(param1:int) : void
      {
         var question:int;
         var _g4:DoloresScene;
         var question4:int;
         var _g3:DoloresScene;
         var question3:int;
         var _g2:DoloresScene;
         var question2:int;
         var _g1:DoloresScene;
         var question1:int;
         var _g:DoloresScene;
         clearOutput();
         switch(param1)
         {
            case 0:
               outputText("你询问了引起这一切的那本古书。");
               outputText("[pg][say: 啊，]她说道，[say: 那个。嗯，就像我告诉你的那样，我在一个储藏室里找到了它，它已经被遗忘很久了。从我能破译的文字来看，它似乎是一本通往我们世界之外领域的指南。]你问她为什么有人会想这么做。[say: 正如你在……那次事件中可能经历过的那样]——说到这个词时她畏缩了一下——[say: 裂缝周围会发生各种异常效应。我相信写这本书的人是想利用这些异常的力量。]");
               outputText("[pg]很有趣，但这真的有用吗？");
               outputText("[pg][say: 嗯。我也不太确定。而且我也不确定我想不想弄清楚。当我看着那本书时，我……感觉自己失去了控制。]她现在瞥了它一眼，你能看到她背上掠过一阵战栗。[say: 我讨厌那种感觉。]");
               outputText("[pg]关于这个话题，她没有别的话可说了。");
               break;
            case 1:
               outputText("你问多洛雷斯她到底带了什么东西来。她对这个问题显得相当犹豫，虽然你不知道是因为她不愿说，还是她自己也不清楚。不过，她最终似乎还是鼓起勇气，紧张地开始解释。");
               outputText("[pg][say: 在玛瑞斯之外，在所有领域之外，有一片广阔的虚无。那是一个我们完全无法理解的地方，没有任何与我们世界相同的法则。在那个黑暗的空间里……潜伏着一些生物。] 那就是其中之一吗？[say: 是的，但是……它似乎并不“完整”。我相信我只拉过来了一小部分。感谢上苍，如果整个东西都过来了……]");
               outputText("[pg]她的声音渐渐低了下去，内疚地看着地面，看来现在是换个话题的好时机。");
               break;
            case 2:
               outputText("你向多洛雷斯确认这只是一次性的事件，因为你不确定自己是否还想再经历一次。");
               outputText("[pg]听到你的询问，她脸红了，你捕捉到了一丝转瞬即逝的愤慨，随后她又变得懊悔起来。她颤抖地叹了口气，开始说话。[say: 我……相信是的。只要我还保持理智，那种“发作”就不会再发生了。我……为我的行为感到羞愧。] 她没有再说什么，目光固定在远处的墙上。你感觉到，沉湎于过去的错误对她来说是痛苦的。");
               outputText("[pg]谈论这件事似乎让她感到尴尬，所以也许是时候继续前进了。");
               break;
            case 3:
               outputText("你告诉多洛雷斯你没什么要问的了，她点了点头。她继续默默地坐在那里，不太敢直视你的眼睛，气氛刚开始变得有些尴尬，她突然主动开口了。");
               outputText("[pg][say: 最后一件事。]");
               outputText("[pg]她的两只手臂伸出来，犹豫地摸了摸那本书，仿佛它会烫伤她一样。然后，多洛雷斯紧紧抓住它，把它举起来，塞到你的胸前。[say: 我想把它交给你。" + (saveContent.doloresDecision == 1 ? "谢谢你让我一直留着它。" : "这次是永远交给你了。") + "] 她抬头看着你的眼睛，脸上流露出深深的信任。");
               outputText("[pg]她没有再说什么，而是用四只手臂紧紧抱住了你。靠得这么近，你闻到了她身上那股淡淡的陌生气味，觉得出奇地令人安心。她紧紧抱了你一会儿，温柔地蹭着你，你也放松了下来。几分钟后，她退了回去，脸上带着一丝微笑。");
               outputText("[pg][say: 保重，[Father]。]");
               outputText("[pg]就这样，你们分开了。她回到了自己的房间，西尔维娅在你回营地前也向你简短地道了别。");
               get_player().createKeyItem("Old Eldritch Tome",0,0,0,0);
               doNext(get_camp().returnToCampUseOneHour);
               return;
            case 4:
               outputText((saveContent.doloresDecision == 1 ? "上次的事情应该足以证明她可以信任你" : "即使发生了上次的事情，她也应该信任她的[father]") + "，那她为什么还要偷偷摸摸地做这些事呢？如果她一开始就来找你，事情会顺利得多。");
               outputText("[pg]多洛雷斯对此显得非常羞愧，她只是在思考如何回答时，手指互相敲击着。最终，她开始说话了，尽管从她声音中的犹豫可以看出，她很难表达自己的想法。");
               outputText("[pg][say: 我……这几乎就像一种强迫症。我绝对确信我必须做那样的事情，必须由我自己来做，没有人会理解。我现在知道我那样想是错的，但是……我几乎无法描述它。我只能说，只要我还能控制自己，这种事就绝对不会再发生了。]");
               outputText("[pg]她坚定地点了点头，看来就是这样了。你想你现在只能相信她的话了。");
         }
         menu();
         _g = this;
         question1 = 0;
         addNextButton("书籍",function():void
         {
            _g.doloresTalkAfterAnswer(question1);
         }).hint("询问她在仪式中使用的那本书。").disableIf(param1 == 0,"你刚刚问过了。");
         if(int(saveContent.doloresFinal % 10) > 1)
         {
            _g1 = this;
            question2 = 1;
            addNextButton("怪物",function():void
            {
               _g1.doloresTalkAfterAnswer(question2);
            }).hint("询问她召唤出的那个生物。").disableIf(param1 == 1,"你刚刚问过了。");
         }
         _g2 = this;
         question3 = 2;
         addNextButton("再来？",function():void
         {
            _g2.doloresTalkAfterAnswer(question3);
         }).hint("询问她是否还会做类似的事情。").disableIf(param1 == 2,"你刚刚问过了。");
         _g3 = this;
         question4 = 4;
         addNextButton("偷偷摸摸",function():void
         {
            _g3.doloresTalkAfterAnswer(question4);
         }).hint("她为什么要这么偷偷摸摸地做？").disableIf(param1 == 4,"你刚刚问过这个了。");
         _g4 = this;
         question = 3;
         addNextButton("确定",function():void
         {
            _g4.doloresTalkAfterAnswer(question);
         }).hint("你完成了所有提问。");
      }
      
      public function doloresTalkAfter() : void
      {
         clearOutput();
         doloresReset();
         outputText("你带着些许不安[walk]回洞穴，不确定到了那里会是什么情况。");
         if(saveContent.doloresFinal > 10)
         {
            outputText("[pg]但就在你踏入洞穴的那一刻，你立刻被四条柔软的手臂缠住了。手臂的主人——那只蛾娘开心地在你的胸膛上蹭了一会儿，然后才退开。");
            outputText("[pg][say: [Name]！见到你真好。]她沉默了片刻。[say: 最近发生的事……提醒了我，我是多么的珍惜你。]");
            outputText("[pg]她又想了一会儿，补充道：[say: 多么珍惜你对我的信任，]紧接着快速吻了你一下。");
         }
         else
         {
            outputText("[pg]当你[if (singleleg) {滑|走}]进洞穴时，你感到身后有一种隐约的压迫感。你猛地转过身，但那里什么也没有。一定是幻觉——");
            outputText("[pg][say: [Name]。]");
            outputText("[pg]西尔维娅站在你身边，双臂交叉，脸上带着矛盾的神情。");
            outputText("[pg][say: 我……多洛雷斯告诉我发生了什么。求你了，如果我们的女儿有危险，请告诉我。你……你信任我的，对吧？]");
         }
         outputText("[pg]西尔维娅拉起你的手，带你走进主房间。你立刻看到多洛雷斯坐在桌旁，神情忧郁。她没有看你，但从你靠近时她肩膀耷拉下来的样子，你能看出她注意到了你的到来。那本书就放在她面前的桌子上，一如既往地泛黄破旧。");
         outputText("[pg]你走过去坐在她旁边，但起初你们谁也没有开口。她的双手在身前不安地摆弄着，也许需要你来开启这场对话。然而出乎意料的是，她选择在这一刻先开口了，尽管她的声音还有些颤抖。");
         outputText("[pg][say: 嗯，我想你是想谈谈发生的事……]");
         saveContent.doloresProgress = 13;
         menu();
         addNextButton("想谈谈",doloresTalkAfterYes).hint("你[i:确实]想多了解一些。");
         addNextButton("没必要",doloresTalkAfterNo).hint("她什么都不用说。");
      }
      
      public function doloresSylviaChat() : void
      {
         clearOutput();
         outputText("你环顾四周，确认安全后，问多洛雷斯对她母亲的看法。");
         if(get_doloresProg() < 9)
         {
            outputText("[pg]她嘟囔了一句什么，你没听清，于是让她再说一遍。[say:……我说，我讨厌她！她……她……她总是那么[b:叽叽喳喳的]！这让我觉得好……呃……] 你问多洛雷斯是不是真的这么想。");
            outputText("[pg][say:哼！好吧……] 她的目光落向地面。[say:也许不是……但我真的希望她能试着多理解我一点！]");
            outputText("[pg]对于一个孩子来说，这很正常，你心想。");
         }
         else
         {
            outputText("[pg][say:有时候……和她相处确实有些困难，但我知道她爱我，我也爱她。我们只是不同的人，而且……] 年轻的蛾女羞涩地揉了揉一只手臂。[say:坦白说，我以前有点任性。] 她叹了口气。[say:我真的很感激她为我做的一切。]");
            outputText("[pg]她思考了片刻，然后继续说道。[say:" + (get_doloresProg() > 14 ? "特别是那幅挂毯。我……过去曾有过怀疑，但她确实理解我……" : "但是……我只是不确定她是否真的</i>理解<i>我。") + "]");
            outputText("[pg]她的眼睛" + (get_doloresProg() > 14 ? "变得有些湿润" : "垂下来看着自己的脚") + "。[say:如果……我说得太多了，我很抱歉。]");
         }
         doNext(doloresTalkMenu);
      }
      
      public function doloresSummoningWin() : void
      {
         var _g:DoloresScene;
         clearOutput();
         outputText("正当你想知道接下来会发生什么时，球体颤抖了一下。它所有的触须都缩回了主体，然后主体以一种奇怪的方式挤压和扭曲自己。但当你看着它时，你意识到它的体积正在稳定地减小，就好像它正在被抽干一样。随着缩小的加剧，原因变得很清楚——这东西似乎正把自己塞回它最初溢出的裂缝中。");
         outputText("[pg]你随时准备好你的[weapon]以防万一，但它似乎真的是自愿离开的。当球体的最后一部分被吸回它来的地方，裂缝伴随着巨大的冲击波猛然闭合时，你感谢今天对你微笑的任何仁慈的神。你几乎不敢相信事情这么容易就结束了。");
         _temp_1.doloresFinal += 3;
         _g = this;
         var _loc1_:Function = function():void
         {
            _g.doloresSummoningEnd();
         };
         get_combat().cleanupAfterCombat(_loc1_);
      }
      
      public function doloresSummoningUseBook() : void
      {
         var _g:DoloresScene;
         clearOutput();
         outputText("你告诉多洛雷斯，你更适合解决这个问题，并向她伸出手要那本书。她顺从地交出书，目光死死盯着地面。你和第一次拿它时一样，对它的重量感到惊讶，但现在没时间分心，所以你让多洛雷斯指给你看她用过的书页，并开始检查。");
         outputText("[pg]上面的文字对你来说完全陌生，似乎也不是你所知的任何语言的密码，但条目旁边恰好有图解，你推测这些图解就是她用来召唤这东西的仪式的说明。");
         outputText("[pg]你正全神贯注地研究一幅特别有趣的图片，突然一声巨响将你从专注中惊醒。你抬起头，看到一条扭曲的触手从那生物身上伸出，试探着周围的环境。当它接触到一棵树时，树皮被撕成破烂的条状，露出光秃秃的木头，然后木头就在你眼前开始枯萎。");
         outputText("[pg]必须阻止这东西，你不确定自己还有多少时间。不过，你确实认为自己快要取得突破了。你发现其中一页的右下角有一个小图解，如果你没看错的话，它可能可以用来逆转最初的仪式。");
         outputText("[pg]好吧，看来你别无选择，于是你开始在脚下的泥土里画出一个大致的轮廓。画完后，你开始按照指定的方式移动双手，令你惊讶的是，你不懂的词语不由自主地浮现在你的脑海中。你急忙开始吟唱它们，无论你在做什么，至少感觉[i: 对了]。");
         outputText("[pg]那颗球体停止了所有其他动作，片刻之后，你能感觉到它将注意力转向了你。那恶毒的目光抽干了你身体所有的热量，但你坚持住，继续施展这个未知的法术。而且，就在你注视的时候，它开始起作用了，那生物发出了你只能理解为痛苦的叫声，因为它被推回了裂缝中。它庞大的身躯在边缘处隆起，但你坚持不懈，那团物质被稳定地抽干，被送回了它来的地方。");
         outputText("[pg]然后，伴随着一声轻微的“砰”响和一阵几乎让你[if (singleleg) {失去平衡|摔倒}]的冲击波，裂缝在被完全吸入时闭合了。");
         _temp_1.doloresFinal += 3;
         _g = this;
         doNext(function():void
         {
            _g.doloresSummoningEnd();
         });
      }
      
      public function doloresSummoningTell() : void
      {
         clearOutput();
         outputText("尽管纸条上那么写，你还是觉得让西尔维娅知道发生了什么是正确的决定。你转过身，[walk]向她，这让她放下了丝绸，全神贯注地看着你。");
         outputText("[pg][say: 出什么事了吗，[name]？你看起来很苦恼。]");
         outputText("[pg]你直截了当地告诉了她，把多洛雷斯最近的行为以及你刚才收到的纸条都告诉了她。在听你讲述的过程中，她一直保持着平静的面容，但你能看出来她有些担心。当你把事情的来龙去脉都告诉她后，她再次开口了。");
         outputText("[pg][say: 嗯……好吧，谢谢你告诉我这些。但既然我们不知道发生了什么，也许我还是应该……啊，我知道了。我会在远处跟着，只有在有麻烦的时候才介入，]她说道。[say: 毕竟，我们也不想无缘无故地惹她不高兴，对吧？]");
         outputText("[pg]她似乎相当确信这是处理事情的最好方法，于是你们俩一前一后走出了洞穴，都对沼泽中等待你们的未知感到担忧。");
         saveContent.doloresFinal = 10;
         doNext(doloresSummoning2);
      }
      
      public function doloresSummoningTalkDown() : void
      {
         var _g:DoloresScene;
         clearOutput();
         if(goodParent() && saveContent.doloresFinal > 0)
         {
            outputText("你深吸一口气，然后开始用平静的声音说话。你告诉多洛雷斯你爱她，关心她，你希望看到她快乐。你说你对她所做的一切感到自豪，并强调考虑到她在这里的时间如此之短，能做出这样的事情是多么令人印象深刻。如果在更好的情况下，你甚至会很高兴她能向你展示这样的东西。但随后你说，这一切必须停止。");
            outputText("[pg]听到这些话，她稍微从你让她陷入的恍惚状态中清醒过来，但很明显，你的话对她来说仍然意义重大。[say: 我……我……不！这是对的！我必须这样做！我只是知道，知道……你真的看不出来吗？]");
            outputText("[pg]你正准备再试一次，西尔维娅在你身边插话了。[say: 我亲爱的女儿，我们看得很清楚。我们看到我们的小女孩，有能力做奇妙而可怕的事情。我们看到她独自一人在森林里，即将犯下一个严重的错误。求你了，现在先冷静下来。我相信无论你想向我们展示什么，只要你和我们谈谈，我们就能理解。]");
            outputText("[pg]你的心脏在胸腔里怦怦直跳。空地上唯一的声音是风吹过树枝的呼啸声。西尔维娅在你身边扭动着。但慢慢地，多洛雷斯的手臂垂了下来，直到停在身体两侧。仿佛变魔术一般，紧张的气氛消散了。随着空洞中发出的奇怪光芒恢复正常，能量似乎也蒸发了。");
            outputText("[pg]你的女儿发出了一声啜泣。她冲过去，双臂搂住西尔维娅，在母亲的怀里大哭起来。[say: 我很抱歉，妈妈。我……我……]");
            outputText("[pg]年长的蛾女嘘了她一声，拍了拍她的背。[say: 没关系。我们在这里。]");
            outputText("[pg]多洛雷斯花了一些时间才平静下来，但当她平静下来时，她退后了一步，空地上终于恢复了平静。");
            _temp_1.doloresFinal += 1;
            _g = this;
            doNext(function():void
            {
               _g.doloresSummoningEnd();
            });
         }
         else
         {
            outputText("你试图和她谈谈，向她解释在发生真正糟糕的事情之前，这一切都必须停止，但你刚说了几句话，你的女儿就打断了你。");
            outputText("[pg][say: 不！你不……你没有像我一样看到它，但一旦你看到了，你就会明白的。别想阻止我！]");
            outputText("[pg]看来你得用另一种方式解决这个问题了。");
            menu();
            addNextButton("阻止她",doloresSummoningStop).hint("试图阻止她完成仪式。");
            addNextButton("顺其自然",doloresSummoningLet).hint("什么也不做。");
         }
      }
      
      public function doloresSummoningStop() : void
      {
         var _g:DoloresScene;
         clearOutput();
         outputText("不管发生了什么，你都不能让她完成。这个仪式显然很危险，你不知道如果成功了会发生什么，所以你再次挣扎着向前走去。");
         outputText("[pg]多洛雷斯看到了你的动作，向后退缩。[say: 不！不，我会坚持到底的。如果我现在停下来，你永远都不会明白！]");
         if(get_player().get_str() > 90 && get_player().get_spe() > 90)
         {
            outputText("[pg]你费了九牛二虎之力，终于一口气向前迈出了好几步。多洛雷斯似乎对你的举动感到惊讶，但她很快又把注意力转回了她正在施展的法术上。看来你不会受到任何直接的干扰，所以你继续向年轻的蛾女靠近。前进的道路很艰难，因为空间扭曲一有机会就会袭击你，迫使你在毫无预警的情况下弯腰、跳跃并保持平衡。");
            outputText("[pg]然而，你最终还是进入了攻击距离。你的女儿几乎触手可及，你只需要向前倾身，把手放在她的手臂上。她猛地抬起头，眼神几乎不似人类。");
            outputText("[pg][say: 你不能！你……]");
            outputText("[pg]但突然间，她脸上的表情似乎发生了变化，就像阴霾散去一样，她问道，[say: [Father]？]然后跌跌撞撞地后退。当她的注意力被打断时，周围的空气突然变得紧张起来，就像有什么未释放的能量卡在那里一样。");
            _temp_1.doloresFinal += 1;
            _g = this;
            doNext(function():void
            {
               _g.doloresSummoningEnd();
            });
         }
         else
         {
            outputText("[pg]尽管你尽了最大努力，但你始终无法拉近你和女儿之间的距离。你的每一个动作都会被某种奇怪的扭曲所抵消，而你既不够强壮，也不够敏捷，无法克服它们。当你气喘吁吁地抬起头，想看看自己取得了多少进展时，你意识到你离她并没有比开始时更近。但你[i: 知道]你至少向前推进了一点点。难道这一切从一开始就是不可能的吗？");
            outputText("[pg]你没有时间再考虑这个问题了，因为多洛雷斯似乎要完成她的法术了。");
            outputText("[pg][say: 是的！终于，你可以停止这毫无意义的挣扎，见证这一切了！]");
            outputText("[pg]当你的女儿完成仪式时，你恐惧地转向她。");
            doNext(doloresSummoning4);
         }
      }
      
      public function doloresSummoningLose() : void
      {
         var consequences:Object;
         var nextFunc:Object;
         var _g1:DoloresScene;
         var _g:Combat;
         clearOutput();
         outputText("你周围的空间扭曲了，将你击倒在地，你在那里呆了一会儿，喘着粗气。你已经岌岌可危，但你还没有输，你知道你不能输。不能让这东西在世界上肆虐，除了你没人能阻止它。" + (get_player().cor > 50 ? "即使你不是英雄那种类型，如果这个地方被毁了，你也无法在这里生活。" : ""));
         outputText("[pg]你看着它。它仍然漂浮在那里，傲慢、不可触碰、矛盾。它想要什么？它明白发生了什么吗？它甚至有知觉吗？");
         outputText("[pg]但这些问题只会让你分心，所以你跳[if (singleleg) {起来|起身}]，扑过去进行另一次攻击。然而，这一次，就在你鼓起力量准备顺应冲动行动之前，一条漆黑的触须以你眨眼不及的速度从它体内射出，直击你的腹部，打得你喘不过气来。");
         outputText("[pg]在触手缠住你并将你举到半空之前，你根本没有时间对这一击做出反应。你的脑海中回荡着极度的恐惧，但当你被吸入球体，进入这超凡脱俗的黑雾中时，你无能为力。当你与玛瑞斯最后一点空气失去联系时，一种原始的恐惧抓住了你，你绝对确定你不应该在这里，你的身体不适合这个地方。");
         outputText("[pg]然而，你并没有死。没有声音，在翻滚的黑烟中你也什么都看不见，但你肯定还有意识。这与你预想的不可思议的结局相去甚远，这里甚至……有些惬意。就好像你躺在云端，它温柔的抚摸让你进入一种放松的状态。你感觉到模糊、奇怪的感觉，就像你正在被那个存在探测，但并不怎么疼。更像是你被吸了进去，被一个比你大得多的东西举起来检查。然后，就在那一瞬间，一只巨大的眼睛在你面前睁开。");
         outputText("[pg]你躺在地上，惊恐地喘着粗气，大声呼喊。但这里什么都没有，只有沼泽。那里发生了什么？你拍了拍自己，发现一切都在原位。你猛地一惊，意识到你没有看到那颗球体在它最后所在的位置，所以你转过身来，但它似乎根本不在这里了。它可能回到了它来的地方吗？还是它只是从视线中消失了？");
         outputText("[pg]你根本不知道，但除了重新站起来评估情况之外，别无他法。");
         _temp_1.doloresFinal += 4;
         _g = get_combat();
         _g1 = this;
         nextFunc = function():void
         {
            _g1.doloresSummoningEnd();
         };
         consequences = false;
         doNext(function():void
         {
            _g.cleanupAfterCombat(nextFunc,consequences);
         });
      }
      
      public function doloresSummoningLet() : void
      {
         clearOutput();
         outputText("你不确定即使你想阻止她，你是否能阻止她，所以你现在很乐意看看事情会如何发展。毕竟，也许一切真的都很好。她似乎对这会奏效充满信心，你没有理由怀疑她。你只是屏住呼吸看着你的女儿以复杂的模式挥舞着手臂，慢慢地引诱着什么东西出来。");
         outputText("[pg]没过多久，她就高兴地抬起头，说道，[say: 是的！是的，就快了！]");
         outputText("[pg]当多洛雷斯成功地举起双臂时，你的胃里有一种莫名其妙的下沉感。");
         doNext(doloresSummoning4);
      }
      
      public function doloresSummoningFight() : void
      {
         clearOutput();
         outputText("好吧，没有别的办法了，所以你准备好迎接这个东西可能向你扔来的任何东西。然而，即使你" + (get_player().get_weapon().isUnarmed() ? "赤手空拳" : "拔出") + "你的[weapon]靠近，它似乎对你的存在没有任何反应。它甚至能感觉到你吗？你不确定，但你也不确定你是否能够利用这一点，甚至是否能伤害到它。" + (saveContent.doloresFinal > 10 ? "西尔维娅似乎全神贯注于保护多洛雷斯，所以看来你只能靠自己了。" : ""));
         outputText("[pg]好吧，不管怎样，你" + (get_player().hasPerk(PerkLib.Revelation) ? "已经有一些与这种东西战斗的经验" : "必须做[i: 些什么]") + "，所以你开始进攻。");
         var _loc1_:Outsider = new Outsider();
         get_combat().beginCombat(_loc1_);
      }
      
      public function doloresSummoningEnd2(param1:int) : void
      {
         clearOutput();
         switch(param1)
         {
            case 0:
               outputText("你告诉女儿一切都没事了。没有人受伤，最后也没有发生什么特别糟糕的事情。每个人都会犯错，但人们正是从错误中学习的。只要她把这次经历当作教训，不再重蹈覆辙，你甚至可以把这看作是一件好事。");
               outputText("[pg]多洛雷斯露出了温柔的微笑，眼眶还有些湿润。[say: 谢谢你，[Father]。我不知道我现在是否值得有人来安慰我，但你依然陪在我身边。]她眼中含着泪水，脸上却挂着笑容，飞向了沼泽，小小的翅膀拍打着，洋溢着由衷的喜悦。");
               break;
            case 1:
               outputText("你告诉女儿，尽管事情出了岔子，但她显然正处于某种伟大成就的边缘。失败不应让人对成功望而却步，所有的进步都必然要付出代价。综合考虑，鉴于这种魔法看起来如此迷人而新奇，这次的代价已经算是相当轻微了。");
               outputText("[pg]当你诉说这一切时，多洛雷斯睁大了眼睛，被你那充满魔力的话语深深吸引。当你说完时，她似乎不知道该作何反应。[say: 是的。[Father]……为了你，我会做得更好。我会克服这一切的。谢谢你。]她带着明确的目标起飞了，小小的翅膀载着她飞向更光明的未来。");
               dynStats(DynStat.Cor(1));
               break;
            case 2:
               outputText("你告诉女儿，就这一次，你不会因为她的鲁莽而惩罚她。但仅此一次。她不仅不顾后果地将你置于险境，甚至可能危及整个世界。这是一个严重的错误，你不会轻易忘记，她最好确保永远不再让你陷入这种境地，否则你的反应可能就不会这么客气了。");
               outputText("[pg]多洛雷斯站在你面前，羞愧得瑟瑟发抖。[say: 是的，[Father]。我会改的。对不起。]说完，她飞向了沼泽，小小的翅膀带着她去往某个可以独自舔舐伤口的地方。");
               dynStats(DynStat.Cor(3));
         }
         if(saveContent.doloresFinal > 10)
         {
            outputText("[pg]你的蛾娘情人飘到你身边，将疲惫的双臂搭在你的肩膀上。[say: 哎呀，这可真是次难忘的经历。这一天的刺激已经够多了吧？]你表示同意。[say: 虽说我很想把你拽回去来一发缓解下压力，但我就不留你了。]她在你唇上轻啄了一下，然后朝着多洛雷斯离开的方向飞去，你猜是回她们的洞穴了。");
         }
         outputText("[pg]当空地恢复宁静时，你的双臂垂了下来，过去几个小时的劳累和压力瞬间涌上心头。你感觉自己几乎能在这里直接睡着，但你知道在那之前必须先赶回营地。带着疲惫的满足感，你出发了，尽管你依然担心多洛雷斯会如何面对这一切。");
         doNext(get_camp().returnToCampUseTwoHours);
      }
      
      public function doloresSummoningEnd(param1:Boolean = false) : void
      {
         var choice2:int;
         var _g3:DoloresScene;
         var choice1:int;
         var _g2:DoloresScene;
         var choice:int;
         var _g1:DoloresScene;
         var repeat1:Boolean;
         var _g:DoloresScene;
         clearOutput();
         if(param1)
         {
            outputText("你让多洛雷斯告诉你，当她语无伦次地说要让你“理解”某事时，她到底是什么意思。");
            outputText("[pg]听到这个问题，她微微脸红，但还是回答了。[say: 自从我第一次找到那本书，我就觉得好像……它在呼唤我。我能感觉到那里有什么东西，某种存在，它是……]她思考了片刻，显然在努力寻找合适的词语。[say: 美丽，]她说完。[say: 我感到一种冲动，想向所有人展示那种美丽。让他们以和我一样的方式看到它。]");
            outputText("[pg]然而，说到这里，她皱起了眉头。[say: 但还有更多。我感到被迫、被束缚在这个任务上，恐惧抓住了我。感觉如果我不来这里施展法术，某种严重的厄运就会降临到我身上。我想这本书毕竟可能是危险的……]");
         }
         else
         {
            outputText("一切都很正常。你有一瞬间担心事情还没有结束，因为没有看到你成功的明显迹象，但当你观察周围的环境时，你惊讶于一切又显得多么平凡。温和的热量。树枝在风中轻轻摇曳。一只迷路的蚊子嗡嗡地飞过你的鼻子，仿佛整个世界都处于和平之中。而且，正如你意识到的那样，确实如此。" + (int(saveContent.doloresFinal % 10) > 1 ? "不管那东西是什么，它现在已经走了，你松了一口气，甚至不知道自己一直屏住呼吸。" : ""));
            outputText("[pg]多洛雷斯跑向你，张开双臂紧紧抱住你，这突如其来的冲击把你从沉思中惊醒。泪水从她的眼眶里夺眶而出，她几乎泣不成声。大约过了一分钟，她才退后一步，擦干眼泪，开始说话。");
            outputText("[pg][say: [Father]，我……我不知道该怎么表达我的歉意，让你经历了这一切。我]——她低头看着地面，寻找着合适的措辞——[say: 刚才不太像我自己。我不知道我是怎么了……]");
            if(saveContent.doloresFinal > 10)
            {
               outputText("[pg]这时，年长的蛾娘插话道。[say: 哎，我也不是一直……神志清醒的，所以我懂你的感受。]");
            }
            outputText("[pg]你要对她说什么？");
         }
         menu();
         _g = this;
         repeat1 = true;
         addNextButton("要个解释",function():void
         {
            _g.doloresSummoningEnd(repeat1);
         }).hint("在做决定之前，你想知道她到底为什么要这么做。").disableIf(param1);
         _g1 = this;
         choice = 0;
         addNextButton("没关系",function():void
         {
            _g1.doloresSummoningEnd2(choice);
         }).hint("虽然这不是什么愉快的经历，但你依然爱她。");
         _g2 = this;
         choice1 = 1;
         addNextButton("再接再厉",function():void
         {
            _g2.doloresSummoningEnd2(choice1);
         }).hint("她不该让这一次的失败阻挡她的脚步。");
         _g3 = this;
         choice2 = 2;
         addNextButton("下不为例",function():void
         {
            _g3.doloresSummoningEnd2(choice2);
         }).hint("这次你就原谅她了……");
      }
      
      public function doloresSummoningDontTell() : void
      {
         clearOutput();
         outputText("纸条上明确写着不要这么做，而且你甚至不确定有什么好担心的，所以你决定不告诉她关于会面的事，或者不管这是什么。当你开始向出口[walk]时，她短暂地抬起头看了你一眼。蛾娘并没有阻止你，只是给了你一个微笑并挥了挥手。");
         outputText("[pg]也许她本可以帮你应对沼泽中等待你的任何事情，但你现在已经下定决心，所以你挥手回应，继续前进。");
         doNext(doloresSummoning2);
      }
      
      public function doloresSummoningAsk() : void
      {
         var _g:DoloresScene;
         clearOutput();
         outputText("你问多洛雷斯她是否能做些什么来扭转她所做的一切。" + (get_player().cor < 50 ? "你向她保证，任何事情，无论多么微小或看似微不足道，都可能有所帮助" : "你要求她解决这个问题，因为这本来就是她的错") + "。");
         outputText("[pg][say: 我——我——我不知道！]她几乎是尖叫着喊出来的，双眼因为恐惧和惊奇而睁得大大的。[say: 它太……美……]她有一瞬间似乎失去了焦点，但很快摇了摇头，回过神来。[say: 好像是有什么办法，但我不太确定……]");
         if(saveContent.doloresFinal > 0)
         {
            outputText("[pg]但还没等你对她说什么，你就听到右边西尔维娅清了清嗓子，你们俩都转头看向她。");
            outputText("[pg][say: 听着，我对这些东西可能一窍不通，但我了解你，多洛雷斯。我不知道那是个什么玩意儿，但我相信你。你日复一日地阅读、学习、练习，夜以继日地仰望星空，满怀惊奇，我相信这一切都是有意义的。现在，去做你该做的事吧。]");
            outputText("[pg]多洛雷斯似乎被母亲的话迷住了，但在听到最后那句命令时，她猛地清醒过来，似乎对这样真诚的赞美感到有些不好意思。[say: 是的。是的，我会的……我</i>一定会的<i>。]她将注意力转向手中的书，快速翻阅着书页，然后突然停了下来，手指戳着一个在你看来有些奇怪的图解。");
            outputText("[pg][say: 这里。这一页详细记载了召唤……异界生物的方法。虽然我还没完全破译这些文字，但我可以合理地猜测，这个]——她指着右下角画着的一个小圆圈，边缘潦草地写着一些细小的文字——[say: 应该能让我把它送回它原来的地方。]她肯定地点了点头。");
            outputText("[pg][say: 好了。]她转向西尔维娅。[say: 母亲大人，您能吸引它的……注意力吗？如果那能称之为注意力的话。以您的速度，应该能避开危险……]");
            outputText("[pg]西尔维娅报以温暖的微笑。[say: 当然，亲爱的。你只管专心做你需要做的事。]");
            outputText("[pg]她转向你。[say: 您能帮我做些准备工作吗？]");
            outputText("[pg]你立刻答应了，因为你不确定在真正糟糕的事情发生之前还有多少时间，于是你们俩毫不迟疑地开始行动。多洛雷斯用清脆自信的声音指挥着你的动作，没过多久，你就完成了她交代的各项任务。当你们都完成后，地上出现了一个圆圈，和之前在空洞里的那个很像，但在某些你无法看清的细节上又有所不同。");
            outputText("[pg][say: 好了，我现在要开始了。如果这不起作用，[Father]，请您知道……]");
            outputText("[pg]她没有说完，你告诉她现在没时间浪费了。她点点头，闭上眼睛，陷入了深深的专注之中。在你的注视下，你的女儿开始挥舞手臂，展现出惊人的灵巧，嘴里低声念叨着令人费解的音节。你没有看到像之前那样有能量聚集在她的手臂周围，你开始担心她试图做的事情没有奏效，但你听到身后传来声音，于是你转头看去。");
            outputText("[pg]那个球体正在产生反应。西尔维娅仍然在它周围飞舞，试图分散它的注意力，但你不知怎么地能感觉到，它所有的注意力都集中在你身后的年轻蛾娘身上。空气中弥漫着紧张的气氛，你感觉自己仿佛站在悬崖边缘，凝视着自己不可避免的毁灭。");
            outputText("[pg]但这种感觉消退了，那个实体向后退缩，仿佛受到了重击。多洛雷斯没有停止努力，继续吟唱着，那个墨黑色的球体扭曲收缩，变得越来越小。随着缩小的过程变得更加明显，它看起来几乎像是在什么东西的边缘凸起，就像是被强行塞回一个对它来说太小的洞里。然而，无论你女儿在做什么，力量都足够强大，那个存在最终被完全推了进去，导致裂缝伴随着一声巨响猛地闭合。");
            _temp_1.doloresFinal += 2;
            _g = this;
            doNext(function():void
            {
               _g.doloresSummoningEnd();
            });
         }
         else
         {
            outputText("[pg]她的声音渐渐低了下去，显然对自己的解决办法太不确定，但你恳求她无论如何都要试一试。");
            outputText("[pg][say: 好——好吧，我试试……我试试……]");
            outputText("[pg]多洛雷斯没有说完，但她确实再次打开了书开始阅读，她的眼睛以极快的速度扫视着书页。最终，她似乎找到了她要找的东西，颤抖着呼出一口气，放下了书。");
            outputText("[pg]她没有进一步解释自己在做什么，而是开始低沉、喉音浓重地吟唱，她的手臂有节奏地摇摆着。你能看出这和她用来把球体带到这里的法术不同，但除此之外你什么也判断不出来。过了一小会儿，她向那个存在举起所有的四只手，吐出了一个你完全听不懂的音节。");
            outputText("[pg]随着她的咒语，那些触手似乎痛苦地扭动了一会儿，然后变得更加锋利，不知怎么地，变得更加[i: 真实]了。你问她做了什么。");
            outputText("[pg][say: 嗯……那应该能把它送回去的，但是……我觉得没起作用，至少没有按照我预想的方式起作用。我不确定我还能做什么了。]");
            outputText("[pg]看来你终究还是要和这东西打一架了。");
            doNext(doloresSummoningFight);
         }
      }
      
      public function doloresSummoning4() : void
      {
         clearOutput();
         outputText("多洛雷斯双手周围的能量似乎闪烁了一下，然后再次在双手之间凝聚成一个球，就像她上一个法术一样。看来她快要完成她想做的事情了。");
         outputText("[pg][say: " + (saveContent.doloresDecision == 1 ? "这就是你把书给我的原因，你难道不明白吗？我注定要做这件事，我……能感觉到。就快了。" : "我终于可以向你展示我一直以来看到的东西了。你会明白的！当你看到它时，你就会明白！") + "]");
         outputText("[pg]你感觉自己同时被拉扯和推挤，仿佛空间本身在你周围起伏。[say: 你会感受到我的感受。]有一瞬间，你看到了完全彻底的黑暗，但在下一刻，一切都被美丽的光芒照亮，为你周围的世界带来了你从未见过的奇妙色彩，几乎让你热泪盈眶。[say: 你会看到我看到的。]在空地外发生了一些诡异的事情，就像空气本身在聚集、拉扯、撕裂。[say: 你会知道我所知道的。]");
         outputText("[pg]然后是一道闪光。在你的眼前，出现了一个针尖大小的白光，然后扩大成一条锯齿状的线。这条线裂开成一道口子，一道裂缝，从中溢出漆黑的黑暗。你感到一种强烈的想转过身去的冲动，但你的眼睛却死死地盯着这令人不安的景象。");
         outputText("[pg]在空地的中央漂浮着……你不知道该怎么称呼它。有一个……球体，你猜，大约有你女儿那么大。它只是悬停在那里，一动不动。你完全不知道这是什么东西，但多洛雷斯敬畏地盯着它。");
         outputText("[pg][say: 你现在看到了吗？我……我等了这么久，但还是没想到……]");
         outputText("[pg]球体微微移动了一下，其朦胧的轮廓不规则地振动着，然后再次稳定下来。一切都很安静。没有任何东西移动。它是如此的黑暗，以至于你不确定那里是否真的有什么东西——它看起来更像是有人在现实的结构上打了一个洞。");
         outputText("[pg]然后它突然绽放了。你感到一种黏糊糊的、令人毛骨悚然的感觉，几根长长的附肢伴随着湿润的吸溜声从中心滑出。触手四处探测了一会儿，但你注意到它们皮肤的漆黑看起来更像是画上去的，而不是真实的，当它们移动时，有些……[i: 不对劲]。它的动作既生硬又出奇地流畅，仿佛它正以你甚至无法理解的方式移动。无论是什么东西来到了这里，显然都不属于这个世界，不受相同法则的约束。");
         outputText("[pg]然而，在漫无目的地挥舞了几下之后，它的附肢缩回，再次重新形成一个球体。你等了一次呼吸，然后又是一次，然后呼气。目前看来它似乎很稳定——或者至少，如果它不稳定，你也不知道你有什么希望——所以你考虑你的选择。你可以尝试直接与它战斗，或者你可以让多洛雷斯尝试一些事情，或者如果你觉得自己有足够的能力，你甚至可以自己解决这个问题。");
         menu();
         addNextButton("战斗",doloresSummoningFight).hint("你别无选择，只能与这个……<i>东西</i>战斗。");
         addNextButton("询问多洛雷斯",doloresSummoningAsk).hint("她把它带到这里，也许她能把它送回去。");
         addNextButton("使用书",doloresSummoningUseBook).hint("从她那里拿走书，自己解决这个问题。").disableIf(get_player().get_inte() < 90,"你无法用这本书做任何事情。");
      }
      
      public function doloresSummoning3() : void
      {
         clearOutput();
         outputText("多洛雷斯正坐在树洞中央，就像几周前那样，她周围的仪式用具看起来也惊人地相似，但有一个主要区别：无论她在做什么，这次都奏效了。蜡烛的火焰闪烁弯曲，仿佛被某个看不见的点吸引。地上画着奇怪、陌生的形状，你的眼睛似乎无法完全跟上。暗淡的能量在你女儿的手周围险恶地噼啪作响，她闭着眼睛，全神贯注。而在她面前，是那本书。");
         outputText("[pg]" + (saveContent.doloresDecision == 1 ? "虽然你确实把那本书给了她，但她不应该用它做任何危险的事情，而这看起来绝对不安全。" : "但你把那本书从她那里拿走了！她又偷回去了吗？她真的对这个如此痴迷，以至于要违抗父母的意愿吗？") + "你大声呼唤她，她吓了一跳，几乎打破了她的专注。");
         outputText("[pg][say: 别担心，[Father]！我完全控制得住，]她咬紧牙关说道。[say: 再过一小会儿，一切就都结束了。]");
         outputText("[pg]你向她迈出一步，但一切突然感觉变慢了，仿佛时间本身正在减速。你猛地一惊，认出这与她演示后你感觉到的感觉相同。你不知道这到底意味着什么，只知道这个法术可能会以同样意想不到的结果结束。正当你思考这个问题时，你的动作突然加快，你的每一个冲动在你的动作中都感觉被放大了十倍。这产生的副作用是导致你摔倒在地，无法正常保持平衡。");
         if(saveContent.doloresFinal > 0)
         {
            outputText("[pg]你还没来得及呼唤她，西尔维娅就从天而降，落在你附近。看来她一直在观察情况，所以你不需要向她解释任何事情。然而，在应对从树洞中散发出的变移扭曲时，这只飞蛾的表现并不比你好，她也很快被掀翻在地。");
         }
         outputText("[pg]你抬头看着多洛雷斯，她再次完全沉浸在仪式中。看来你只有一次机会来阻止这一切了。");
         menu();
         addNextButton("阻止她",doloresSummoningStop).hint("试图阻止她完成仪式。");
         addNextButton("顺其自然",doloresSummoningLet).hint("什么也不做。");
         addNextButton("劝说",doloresSummoningTalkDown).hint("也许你能说服她停止这种疯狂的行为。");
      }
      
      public function doloresSummoning2() : void
      {
         clearOutput();
         outputText("你[if (singleleg) {滑|走}]进泥潭，却注意到这里感觉比平时凉爽不少。事实上，通常潮湿的空气感觉异常干燥，周围的植物似乎也奇怪地褪色了，仿佛这里有什么重要的东西被抽干了。这可能是你的错觉，但这一切绝对让人感觉不对劲。");
         if(saveContent.doloresFinal > 0)
         {
            outputText("[pg]西尔维娅最后看了你一眼，说道：[say: 那么，我现在就出发了。如果有任何危险或者你需要我，就叫我。我会立刻赶到你身边。]她勉强将愁容转变为令人安心的微笑，然后转身展开了翅膀。你只有片刻的时间欣赏它们的美丽，随后她便像飞镖一样射出，迅速消失在扭曲的树木后面。");
         }
         outputText("[pg]你打了个寒颤，出发了。由于你不知道自己到底要去[i: 哪里]，所以进展缓慢，但" + (saveContent.doloresTimesLeft > 0 ? "你觉得有义务做[i: 些什么]，以防她真的遇到什么危险" : "你不能让你的女儿失望，即使这意味着你必须经历地狱才能做到") + "。尽管如此，你周围的沼泽还是相当难以穿透，没有给你任何关于从哪里开始寻找的线索。");
         outputText("[pg]你继续[walking]，但沼泽依然如故。每棵树看起来都像是同样干瘪的残骸，你经过的每一个灌木丛都可能是你要找的那个。没有地图，你怎么可能找到它？你只能希望你寻找女儿的强烈愿望能指引你走向正确的方向，毕竟玛瑞斯存在空间异常。");
         outputText("[pg]但即使有这个希望，你似乎也没有取得任何进展。在泥泞中跋涉了许多分钟，你所得到的只有结在你[armor]上的污垢。你应该尝试其他方法吗？也许纸条上有更多线索，或者也许" + (saveContent.doloresFinal > 0 ? "西尔维娅的空中视角能有所帮助" : "你可以尝试爬上一棵树以获得更好的视野") + "。但无论你想出什么主意，你都开始越来越不确定自己能否找到会面地点。");
         outputText("[pg]然后你看到了它。那棵树矗立在完全相同的位置，周围环绕着同样茂密的灌木丛。然而，与你上次站在这里时相比，有些东西发生了变化——树洞内发出的光现在亮得多。以前你只能勉强从灌木丛中分辨出它，而这次它闪耀着明亮的橙色光芒，从某个未知的源头起伏脉动。你的女儿不在那里迎接你，你也没有听到里面有任何声音，但她一定在这里，所以你坚定决心，走了过去。");
         outputText("[pg]带着些许不安，你绕到树的侧面，一点点靠近那未知的一切……");
         doNext(doloresSummoning3);
      }
      
      public function doloresSummoning() : void
      {
         clearOutput();
         doloresReset();
         outputText("多洛雷斯不在她的房间里。");
         outputText("[pg]不过，她的床上有一张纸条，你把它拿了起来。上面整洁优雅的笔迹为[say: 造成了极大的不便]而道歉，接着又扯了一堆无关紧要的话，然后急切地要求你[say: 来到一切开始的地方]，尽管它并没有详细说明“一切”到底指的是什么。不过，考虑到她最近一直对那件事耿耿于怀，你猜她指的是她离家出走那晚你找到她的地方。");
         outputText("[pg]底部用明显更仓促的笔迹潦草地写着[say: 别告诉母亲，]" + get_player().mf("这似乎很奇怪","你认为这指的是西尔维娅") + "。你知道多洛雷斯处理事情的方式并不总是那么“正常”，但真的有理由保密吗？你带着一种不祥的预感把纸条揣进口袋，走出了洞穴。");
         outputText("[pg]但在离开之前，你注意到西尔维娅独自坐着，正仔细检查着一些丝绸。尽管纸条上有指示，你是否应该对她说些什么？");
         saveContent.doloresProgress = 12;
         menu();
         addNextButton("告诉她",doloresSummoningTell).hint("你可以信任她。");
         addNextButton("离开",doloresSummoningDontTell).hint("不，最好还是不要。");
      }
      
      public function doloresSexMenu() : void
      {
         clearOutput();
         outputText("你告诉女儿你想和她亲热一下。她的脸僵住了，似乎花了一些时间才消化了你的请求。[say: 好-好吧……]她最终嘟囔道。看来你必须主动出击了。");
         menu();
         if(saveContent.doloresSex == 1)
         {
            addNextButton("确认",doloresComfort).hint("确保你的女儿已经准备好做爱了。");
         }
         if(saveContent.doloresSex < 3)
         {
            addNextButton("破处",doloresDefloration).hint("夺走她的贞操。").disableIf(!get_player().hasCock(),"这个场景需要你有一根肉棒。");
         }
         if(saveContent.doloresSex < 3)
         {
            addNextButton("第一次",doloresFirstTime).hint("让她体验女性的快乐。").sexButton(2);
         }
         if(saveContent.doloresSex > 2)
         {
            addNextButton("做爱",doloresSex).disableIf(!get_player().hasCock(),"这个场景需要你有一根肉棒。");
         }
         if(saveContent.doloresSex > 2)
         {
            addNextButton("口交",doloresBlowjob).disableIf(!get_player().hasCock(),"这个场景需要你有一根肉棒。");
         }
         if(saveContent.doloresSex > 2)
         {
            addNextButton("磨豆腐",doloresTribbing).sexButton(2);
         }
         if(saveContent.doloresSex > 2)
         {
            addNextButton("坐大腿",doloresPetting).hint("让多洛雷斯坐在你的腿上，同时你抚摸她。");
         }
         addButton(14,"返回",doloresMenu);
      }
      
      public function doloresSexChat() : void
      {
         var choice2:int;
         var _g2:DoloresScene;
         var choice1:int;
         var _g1:DoloresScene;
         var choice:int;
         var _g:DoloresScene;
         clearOutput();
         outputText("你的女儿正在成长，而且" + (get_player().isChild() ? "，虽然你也没有多少经验，" : "") + "是时候让她了解一些重要的事情了。但从哪里开始呢？" + (get_player().cor < 50 ? "这些事情相当微妙，你不想冒犯她" : "她还有那么多有趣的事情要学，你被这些可能性弄得不知所措") + "。");
         outputText("[pg]当你终于提出这个话题时，多洛雷斯似乎并不觉得困扰，但她不置可否的咕哝声并没有给你太多发挥的余地。你尽你所能地开始，借鉴你自己的经验以及你对" + (get_player().isChild() ? "不久前" : "你童年时期") + "类似谈话的记忆。你尽力提供尽可能多的信息，但这只年轻的蛾女根本没有给你太多反应，所以你真的不知道她有没有听进去。");
         outputText("[pg]当你开始讲到生理结构时，多洛雷斯打断了你。[say: 没关系，[Father]，我已经读过一些关于这些主题的书了，我很清楚到时候会发生什么。]这真是出乎意料的成熟。你不太确定该如何继续，而多洛雷斯似乎也没有兴趣再补充什么了。");
         outputText("[pg]你对她有什么临别建议吗？或者你想用另一种方式表达你的爱意？");
         menu();
         _g = this;
         choice = 1;
         addNextButton("注意安全",function():void
         {
            _g.doloresSexAnswer(choice);
         });
         _g1 = this;
         choice1 = 2;
         addNextButton("和我在一起",function():void
         {
            _g1.doloresSexAnswer(choice1);
         });
         _g2 = this;
         choice2 = 3;
         addNextButton("返回",function():void
         {
            _g2.doloresSexAnswer(choice2);
         });
      }
      
      public function doloresSexAnswer(param1:int) : void
      {
         switch(param1)
         {
            case 1:
               outputText("[pg]你告诉你的女儿，你只是想确保她的安全。她看着你，过了一会儿，脸上浮现出淡淡的微笑。[say: 我会的，[Father]。你不需要为我担心。] 接着，她飘过来给了你一个温暖的拥抱，她的头在" + (get_player().get_tallness() > 60 ? "你的胸前" : "你身上") + "蹭了蹭。[say: 我爱你，[dad]。] 你拍了拍她的背，心里感到很踏实。");
               break;
            case 2:
               clearOutput();
               outputText("你告诉你的女儿你爱她，她回答说：[say: 我也爱你，[Father]。] 你继续说，你想向她展示你有多爱她。她只是盯着你，显然不明白你的暗示。你把手伸向她的脸颊，拂去一缕散乱的头发。当你的手停留在那里时，你深深地凝视着她紫色的眼睛，直到她恍然大悟，脸突然红了。[say: 呃——嗯，] 她结结巴巴地说，[say: 我……我不知道该说什么……]");
               outputText("[pg]你知道该怎么做。你告诉她她对你有多重要，然后吻上了她的嘴唇。这简直是纯粹的魔法，你感觉自己被举了起来，达到了一个你不该达到的高度。当你退后并睁开眼睛时，你看到的是她轻微的困惑。[say: 我……呃……我也爱你，[dad]。] 她没有完全迎上你的目光，但她不需要。你又给了她一个吻，然后退后，心中涌起一阵渴望的悸动。");
               if(saveContent.doloresSex < 1)
               {
                  saveContent.doloresSex = 1;
               }
               break;
            case 3:
               outputText("[pg]这对你来说已经够尴尬的了。你拍了拍多洛雷斯的背，希望能转移到不那么困难的话题上。");
         }
         doNext(doloresTalkMenu);
      }
      
      public function doloresSex2(param1:Boolean) : void
      {
         clearOutput();
         if(param1)
         {
            outputText("不，这已经足够了。她端庄的裙子足以强调她最好的特征，同时保留一些神秘感，你不确定你是否愿意等她脱掉它，因为你[b:现在]就需要她。多洛雷斯注意到了你淫荡的目光，低头看着自己的脚，焦躁不安地挪动着。");
         }
         else
         {
            outputText("你" + (doloresComforted() ? "要求" : "指示") + "多洛雷斯脱衣服，令人惊讶的是，她毫无怨言地照做了。她的小手伸下去，慢慢地——如果你不是太了解她，你会说这是在挑逗——把衣服从头上拉下来，尽管在翅膀上卡了一下。做完这些，她解开可爱的胸罩，让它掉在地上，向你展示她挺拔年轻的乳房。她的手尴尬地在身前移动，直到她把它们握在一起，想要遮掩自己的冲动显然仍然很强烈。你的女儿现在几乎赤裸地站在你面前，微微发抖，尽管你不知道是因为冷还是因为尴尬。");
         }
         outputText("[pg]在欲望的驱使下，你走上前，把她逼到墙角，双手抚摸着她的腰侧。" + (doloresComforted() ? "你问她是否准备好了" : "你告诉她你准备开始了") + "。");
         outputText("[pg][say: " + (doloresComforted() ? "我-我没事" : "好的") + "，]她说，" + (doloresComforted() ? "声音中带着紧张的颤抖" : "声音中带着死寂") + "。");
         outputText("[pg]当你抓住她的臀部把她拉近时，她退缩了，摸索了一秒钟才转过身去面对墙壁，" + (doloresComforted() ? "显然太害羞了，不敢在过程中看你" : "尽管她坚忍的脸上没有流露出任何情感") + "。你可以接受这个，你走到她身边，把手放回它们该在的位置。");
         var _loc2_:String = !get_player().isNaked() ? "自己脱掉衣服，然后掏出" : "掏出";
         outputText("[pg]在开始之前，你还需要处理最后一件事。你兴奋地微微颤抖，" + (param1 ? "把她的裙子拉到臀部以上，然后" : "") + "用拇指勾住她内裤的边缘，把它们拉到她的脚边，你的女儿顺从地跨出来，让你把它们扔掉。没有了任何障碍，你" + _loc2_ + "你的[cock]，对准她的缝隙。");
         outputText("[pg]当你挑逗她的入口时，她的手向前撑在墙上，她把臀部撅得足够高，让你不用指导就能找到一个好角度。真是个好女孩，当你刺穿她的深处，让多洛雷斯喘息时，你心想。");
         outputText("[pg]你慢慢地进入她，温柔地按摩着你女儿的背部，试图让这个过程尽可能无痛。" + (get_player().longestCockLength() > 5 ? "对她来说，你还是" + (get_player().longestCockLength() > 10 ? "太" : "有点") + "大了，当你撑开她的肉壁时，她扭动着身体" : "显然她还不习惯这种感觉，当你滑入时，她扭动着身体") + "。当你完全没入她体内时，年轻的蛾女颤抖了一下，你开始抽插。");
         var _loc3_:String = doloresComforted() ? "甚至向后靠向你一点，嘴里发出轻柔的喘息" : "保持着稳定的姿势，只有轻微的呜咽";
         outputText("[pg]多洛雷斯似乎不打算自己动，所以只能由你来主导。你的手移回她的臀部，一路上享受着" + (param1 ? "它们美妙的轮廓" : "她光滑无瑕的肌肤") + "，以及到达目的地时那奇妙的柔软。你开始前后摇摆，当她颤抖的褶皱摩擦着你，紧紧包裹着你的肉棒时，你忍不住呻吟出声。至于多洛雷斯，她似乎接受得还算不错，" + _loc3_ + "。");
         outputText("[pg]这种缓慢的节奏在一段时间内令人愉悦，但你很快发现自己想要更多。你开始真正把重量压上去，每一次抽插都重重地拍打在她的屁股上，发出响亮的啪啪声，使其在你的皮肤上变形。你的女儿在承受你这充满爱意的猛攻时，发出了压抑的" + (doloresComforted() ? "呻吟" : "闷哼") + "。粗暴的动作导致她" + (param1 ? "的裙子卷起来并在墙上摩擦，你脑海中闪过一丝可能会弄坏裙子的念头" : "裸露的乳头在墙上摩擦，引得她发出一声低声的呜咽") + "，但你已经深陷其中，无法停止了。");
         outputText("[pg]当你快要释放时，你双臂环抱住她的身前，将她拉近。这样一来，你的手就可以自由地游走，抚摸她娇小的乳房和平坦的小腹。你的头就在她的" + (get_player().get_tallness() > 50 ? "上方" : "脑后") + "，你的鼻子几乎埋进了她的头发里，那令人目眩的香气填满了你的感官。这股气味让你陷入了疯狂，情欲翻滚。也许是潜藏的费洛蒙？或者仅仅是因为她实在是太美味了。");
         outputText("[pg]无论原因是什么，在各种感官受到快感冲击的情况下，你已经所剩无几了。" + (doloresComforted() ? "多洛雷斯似乎也快到了" : "看起来多洛雷斯也承受不了更多了") + "，她的手指拼命地抓取着支撑点，双腿开始发软。你很乐意帮她一把，用尽全力撞击她，把她压在墙上，同时你的肉棒在她体内跳动。");
         outputText("[pg]一股又一股的精液填满了你的女儿，你将自己紧紧贴在她的背上，把她死死地压在墙上。当你挤压她，把脸在她丝滑的头发上摩擦时，多洛雷斯发出了" + (doloresComforted() ? "愉悦" : "不适") + "的叫声。她的气味淹没了你的大脑，诱导你射出更多，即使你已经不可能再贴得更紧了，你的臀部仍然继续压向她。最终，你的喷射平息下来，但你仍然瘫倒在她身上一段时间，从这剧烈的做爱中恢复过来。");
         outputText("[pg]你是第一个恢复过来的，所以你引导你的女儿走到床边，让这个还在发抖的蛾女坐下。她立刻瘫倒" + (doloresComforted() ? "在你身上" : "在一旁") + "，显然已经无法支撑自己了。");
         if(doloresComforted())
         {
            outputText("[pg]你对她这种恍惚的状态有些担心，问她是否喜欢。她又呆滞了一会儿，然后眨了眨眼，看着你，仿佛刚刚才意识到自己在哪里。[say:呃……什么？]你重复了这个问题。[say:啊！是的，嗯……这真是……前所未有。]这最后一个词让她的脸上泛起了一丝红晕。你就当这是赞美了。多洛雷斯看起来需要休息一下，所以你给她盖好被子，在她的额头上亲了一下，然后就离开了，你自己也有些筋疲力尽了。");
         }
         else
         {
            outputText("[pg]你把手放在她的臀部，她因为你的触碰而颤抖。她喜欢吗？她点点头。真的吗？她又点点头，这次更加热烈。很好。你凑过去，双臂环抱住她，享受着温柔的相拥。她把身体贴向你，奇怪的是，尽管你给她增加了温暖，她还是继续颤抖着。几分钟后，她的呼吸变得均匀，睡着了。你给她盖好被子，在这个休息的蛾女额头上快速亲了一下，然后就离开了。");
         }
         get_player().orgasm("Dick");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function doloresSex() : void
      {
         var dressed1:Boolean;
         var _g1:DoloresScene;
         var dressed:Boolean;
         var _g:DoloresScene;
         clearOutput();
         outputText("现在你不需要言语，所以你向前[if (singleleg) {移动|迈出}]一步，将多洛雷斯拥入怀中。");
         outputText("[pg]她" + (doloresComforted() ? "脸红了" : "没有反应") + "，但也没有推开" + (doloresComforted() ? "" : "") + "，所以你倾身在她甜美年轻的嘴唇上印下一吻。");
         outputText("[pg][say: " + get_player().mf("父-父亲","母-母亲") + "……]她喃喃自语。你告诉她她有多美，她让你感到多么兴奋。她似乎不知道该如何反应，一如既往地在性的话题上感到慌乱。如果你想继续，看来她需要你温柔的指导，但你应该怎么做呢？你可以让她脱掉裙子，或者你可以就这样开始。");
         menu();
         _g = this;
         dressed = false;
         addNextButton("脱衣",function():void
         {
            _g.doloresSex2(dressed);
         });
         _g1 = this;
         dressed1 = true;
         addNextButton("开始",function():void
         {
            _g1.doloresSex2(dressed1);
         });
      }
      
      public function doloresRunaway2(param1:int) : void
      {
         clearOutput();
         switch(param1)
         {
            case 1:
               outputText("好吧，她又不是" + (get_silly() ? "毁灭了世界什么的" : "造成了什么重大破坏") + "。虽然她学习潜在危险的魔法有点太年轻了，但你告诉多洛雷斯她暂时可以保留这本书。");
               outputText("[pg][say: [b: 真的吗！？]] 她惊呼道，带着一种你以前从未在她身上见过的孩子般的喜悦。似乎对那突然的爆发感到尴尬，她继续更加温顺地说。[say: 嗯-嗯……谢谢你，[Father]。我不会浪费你给我的这个机会的。] 她脸上灿烂的笑容温暖了你的心，几乎弥补了她今晚给你带来的所有麻烦。");
               if(get_silly())
               {
                  outputText("[pg][b:多洛雷斯会记住这一点的。]");
               }
               outputText("[pg]想至少知道你允许女儿保留了什么，你让她把书给你看看。她高兴地递了过来，似乎" + (get_player().cor > 80 ? "，也许是愚蠢地，" : "") + "确信既然你已经答应了，就不会从她那里拿走它。它非常古老，比你想象的要重得多，即使考虑到它相当多的页数。在手中翻转它，你发现书脊上的文字不是你以前见过的任何东西，但封面上的图像似乎类似于沙漏之类的东西。真奇怪。");
               break;
            case 2:
               outputText("让她去干涉自己无法控制的力量实在太危险了，尤其是在她这么小的年纪。你告诉多洛雷斯把书交出来。有那么一瞬间，你不确定她是否会服从，但最终，她还是拖着脚步走到你面前，把那本大部头塞进了你等候的双手里。很少见她这么情绪化；这一定对她意义重大。");
               outputText("[pg]即便如此，这也是负责任的做法。然而，当你这么告诉她时，她似乎并没有什么兴趣听，更不用说回应了。她只是站在你面前，双拳紧握，嘴唇颤抖。无论你多么" + (get_player().cor < 50 ? "向她保证这只是暂时的" : "向她解释，作为她的[father]，你最清楚怎么做") + "，她的表情都没有明朗半分。很遗憾，但她迟早会明白的。");
               if(get_silly())
               {
                  outputText("[pg][b:多洛雷斯会记住这一点的。]");
               }
               outputText("[pg]你想知道你刚刚阻止了女儿释放出什么东西，于是你看了看她跑出来读的那本书。它古老得令人难以置信，而且比你想象的要重得多，即使考虑到它那可观的页数。你在手中翻转着它，发现书脊上的文字是你以前从未见过的，但封面上的图案似乎类似于沙漏之类的东西。真奇怪。");
               break;
            case 3:
               outputText("你并不确定最好的做法是什么，所以你想在做出判断之前了解更多。如果只是让她玩弄这种东西，那是不负责任的，但如果你完全无视她的感受，那也没有尽到作为父母的责任。虽然她的好奇心可能会引起一些问题，但这并不是你想去打击的。如果它是安全的，那就没问题，但你需要时间来考虑清楚。");
               outputText("[pg]当你向多洛雷斯解释这一切时，她起初看起来很苦恼，但你平静的语气和合乎逻辑的推理慢慢安抚了她，直到最后只剩下一些轻微的不确定。");
               outputText("[pg][say:...好吧，[Father]。这听起来确实……很合理，]她说着，试探性地看了你一眼，同时把书递向你。你轻轻地把它接过来，考虑到它明显的年代感，你非常小心。");
               outputText("[pg]你想知道你刚刚阻止了女儿释放出什么东西，于是你看了看她跑出来读的那本书。它古老得令人难以置信，而且比你想象的要重得多，即使考虑到它那可观的页数。你在手中翻转着它，发现书脊上的文字是你以前从未见过的，但封面上的图案似乎类似于沙漏之类的东西。真奇怪。");
         }
         outputText("[pg]你的检查被打断了，有什么东西猛地冲到你身边，然后把多洛雷斯紧紧地抱在怀里。西尔维娅的眼泪顺着脸颊流下来，此时她的话几乎语无伦次，但你还是勉强听清了几句，比如[say:哦，我的宝贝，]和[say:我真是……哦哦哦……]最终，她平静下来，你终于能插上话了，而多洛雷斯从母亲令人窒息的拥抱中解脱出来，也松了一口气。");
         outputText("[pg]你向这位充满母爱的蛾子解释了情况以及你随后的决定，她只考虑了片刻，便点点头说：[say:好吧，我相信你的判断。太感谢你救了我们的女儿了，我无法想象如果……不，总之谢谢你。]她能这么坦然接受真是太好了。然后你们三个一起走回西尔维娅的家，" + (saveContent.doloresDecision == 2 ? "尽管多洛雷斯似乎仍然有些闷闷不乐，她的步伐比平时迟缓得多" : "你可以从多洛雷斯轻快的步伐中看出她有多高兴，即使她的脸上什么也没表现出来") + "。");
         outputText("[pg]到达后，你在洞穴入口处停顿了片刻，确保一切安好，然后才返回营地。");
         saveContent.doloresDecision = param1;
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function doloresRunaway() : void
      {
         var decision2:int;
         var _g2:DoloresScene;
         var decision1:int;
         var _g1:DoloresScene;
         var decision:int;
         var _g:DoloresScene;
         clearOutput();
         doloresReset();
         outputText("决定去看看你的女儿后，你环顾了一下这个昏暗的洞穴，你已经把它当成了自己的第二个家。她很可能像往常一样躲在某个角落里看书。然而，你发现多洛雷斯似乎不在她常去的任何地方。书架旁她的位置空空如也，走廊尽头她的卧室也同样无人居住。这有点不寻常，但现在还没有理由恐慌。");
         outputText("[pg]回到主房间，你发现西尔维娅坐在桌前，正在处理一些布料。你向她打招呼，她回以温暖的微笑，但当你问起多洛雷斯时，这位蛾女的表情变得担忧起来。[say: 她不在房间里吗？我还以为……] 你们俩交换了一个担忧的眼神，片刻之后，你们都猛地站起身，去寻找那只年轻的毛毛虫。");
         outputText("[pg]最终，在检查了你能想到的每一个可能的角落后，你得出结论，她肯定已经不在洞穴里了。你推断她一定是在没有引起她母亲注意的情况下离开的，但为什么呢？无论她的动机是什么，你都需要在[i: 她]遇到麻烦之前找到她。[say: 我们一起找，] 西尔维娅说，显然和你想的一样。[say: " + (get_player().canFly() ? "我飞得更好，所以" : "") + "我找高处，你找低处。] 没等反驳，这只飞蛾就化作一团模糊的影子起飞了，飞速冲出了洞口。");
         outputText("[pg]跟随西尔维娅进入沼泽后，你很快就看不到她——她冲向了天空，但现在有更紧迫的事需要你关注。你" + (get_player().cor > 50 ? "愤怒地" : "焦急地") + "冲过周围的泥沼，目光扫过扭曲的树木和冒泡的淤泥，内心越发" + (get_player().cor > 50 ? "恐慌" : "沮丧") + "。");
         outputText("[pg]这里的情况似乎对你很不利，因为多洛雷斯现在可能在任何地方。当你在痛苦的几分钟里寻找却没有任何她的踪迹时，你最坏的恐惧开始上演，没过多久，你就开始拼命寻找任何可以减轻你日益增长的恐惧的东西。然而，附近灌木丛中一棵有些隐蔽的大树突然引起了你的注意。你觉得你能看到一些微弱的光线勉强穿透树干底部的灌木丛，在这一点上，这和任何线索一样好。你小心翼翼地前进，慢慢地顺时针绕过树，以便更好地观察那不自然的光亮。");
         outputText("[pg]当树干的另一侧开始进入视线时，你开始看到它侧面一个特别宽的树洞的轮廓。这看起来太不自然了，树不可能长成这样，但没有明显的树皮被切割的迹象。这个开口形成了一个进入树内部空腔的入口，这似乎是光线的来源。你准备好你的[weapon]，" + (get_player().hasTailInsteadOfLegs() ? "滑行" : "走") + "到空腔的完全视野中。然后你看到了她。多洛雷斯独自坐在树洞里，目前还没有意识到你的存在。");
         outputText("[pg]听到树枝折断的声音，多洛雷斯抬头看着你，轻轻地倒吸了一口凉气，她平时冷漠的脸上露出了不少内疚。一本布满灰尘的旧书摊开在她面前的地上，但当你靠近时，她一把抓起它，紧紧抱在胸前。她带来了一些蜡烛，现在摆放在她面前，它们微弱的光芒用昏暗、怪异的光线照亮了树洞。你几乎会把这个场景误认为某种恶魔仪式，而这个想法并没有给你带来任何安慰。");
         outputText("[pg]你内心翻涌着复杂的情绪，你问多洛雷斯她一个人在这里做什么。" + (get_player().cor < 40 ? "她跑掉真的让你和西尔维娅很担心" : "她应该知道不该这样违抗你") + "。毛毛虫女孩叹了口气，扭动了一会儿，最后似乎终于鼓起足够的勇气回答。");
         outputText("[pg][say: 嗯……我猜测母亲可能不赞成我研究……“非正统”的文本……所以我只是溜走了，] 她说，仍然没有直视你的眼睛。她似乎不愿意给你任何更多的细节，所以你逼问她，现在问起那本书。一提到它，她的眼睛就亮了起来。[say: 没-没什么！] 她说，明显缺乏她特有的镇定。看来你找对方向了。");
         outputText("[pg]你召唤出你最严厉的目光，即使是你那泰然自若的女儿也无法承受这种对待，在你的怒视下屈服了，肩膀耷拉下来。[say: 它是……我在储藏室里发现的一本被遗弃的古籍。我相信它可能是来自另一个世界的某种遗物。] 停顿了一下。[say: 我……试图从中学到一些东西。] 多洛雷斯犹豫了一下，似乎在仔细考虑什么，然后继续说道，[say: 拜托，[Father]……我能留着它吗？]");
         outputText("[pg]你同意你的女儿玩弄超出她认知范围的力量吗？");
         saveContent.doloresProgress = 6;
         menu();
         _g = this;
         decision = 1;
         addNextButton("让她留着",function():void
         {
            _g.doloresRunaway2(decision);
         }).hint("尽管发生了这些事，你还是信任你的女儿。");
         _g1 = this;
         decision1 = 2;
         addNextButton("阻止她",function():void
         {
            _g1.doloresRunaway2(decision1);
         }).hint("让她带着它离开太危险了。");
         _g2 = this;
         decision2 = 3;
         addNextButton("暂时拿走",function():void
         {
            _g2.doloresRunaway2(decision2);
         }).hint("最好保留判断，至少目前是这样。");
      }
      
      public function doloresReset() : void
      {
         saveContent.doloresTimeSinceEvent = 0;
      }
      
      public function doloresPreCocoonYes() : void
      {
         clearOutput();
         outputText("你不会错过女儿生命中如此重要的时刻。虽然你不知道自己能帮上多大忙，但你不会因为跑开而忽视她。西尔维娅带着温柔的微笑接受了这一点，但多洛雷斯的反应更为明显。她整张脸都亮了起来，既然你同意帮助她度过这个过程，她似乎对整个过程感到更加自在了。");
         outputText("[pg][say:那么，]西尔维娅说，[say:我们应该尽快开始。[Name]，你介意帮我搬点东西吗？]你同意了，并开始协助她重新布置多洛雷斯房间里的家具，以便在中间腾出一大块空地来放置茧。然后西尔维娅借口去储藏室拿点东西，留下你和焦躁不安的毛毛虫单独在一起。");
         outputText("[pg]多洛雷斯站在你身边，在这个现在安静下来的房间里显得有些紧张。她平时那副镇定的模样出现了裂痕，不安地搓着手。你握住了她的一只手。你不知道是因为骄傲还是她一贯缺乏情感的表现，让她没有把情绪写在脸上，但从她手臂突然放松的张力，你可以清楚地感觉到这让她平静了多少。你们俩默默地站在一起，直到西尔维娅回来。");
         outputText("[pg][say: 好了，现在把你的裙子脱掉，]她说道。");
         outputText("[pg][say: 什——什么？]你女儿有些慌乱地回应。");
         outputText("[pg]蛾女双手叉腰解释道：[say: 你以为丝到底是从哪里来的？]");
         outputText("[pg]你本以为像多洛雷斯这样肤色深的人不会脸红，但玛瑞斯每天都会带来新的惊喜。你的女儿咳嗽了一声，转向你说道：[say: 谢谢你能来，[Father]，但是……我想我现在没问题了。]");
         outputText("[pg]还没等你抗议，她就把你推向了门口，她那纤细手臂里微薄的力量对于她这个年纪的人来说依然令人惊讶。当你被赶出房间时，西尔维娅给了你一个会心的微笑和眨眼，把你和多洛雷斯单独留在走廊里。她似乎在你们之间的地上寻找着什么，也许是在想合适的措辞。带着坚定的表情，多洛雷斯抬起头说道：[say: 真的，谢谢你，[Father]。你愿意在这里陪我，这对我来说意义重大。]");
         outputText("[pg]你亲吻了女儿的额头，祝她一切顺利，然后继续上路。在穿过沼泽回去的路上，你满脑子都是关于她的想法。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function doloresPreCocoonNo() : void
      {
         clearOutput();
         outputText((get_player().cor < 50 ? "遗憾的是，你不能留下来看着你的女儿完成这次蜕变" : "你还有更好的事情要做，而不是坐在这里看她们做茧。") + " 当你告诉她们你要离开时，多洛雷斯尽了最大努力掩饰她的失望，但她嘴唇最微小的颤抖还是穿透了她那坚忍的面具。");
         outputText("[pg]西尔维娅插话道：[say: 好吧，如果你还有别的地方要去，我们就不留你了。注意安全。]你告诉她" + (get_player().cor < 50 ? "你会的" : "不用担心") + "，然后走出洞穴，回到营地。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function doloresPreCocoon() : void
      {
         clearOutput();
         doloresReset();
         outputText("当你去找多洛雷斯时，你发现她在房间里弯着腰，四只手紧紧捂着肚子。你有些担心，开始快步向她[walk]去，但她用虚弱的手向你挥了挥，尽管她的脸仍然扭曲着。[say:我……没事，]她喘着气说。[say:只是觉得……有点不舒服。]");
         outputText("[pg]又痛苦地喘息了一会儿，多洛雷斯勉强挪到床边坐下，但这似乎消耗了她极大的体力。显然是听到了动静，西尔维娅飘进房间，看到女儿时倒吸了一口凉气。[say:哦天哪，你没事吧？]");
         outputText("[pg][say:我还死不了，母亲，]她回答道，[say:但这确实很不舒服。我的胃感觉就像要翻江倒海一样。]");
         outputText("[pg]听到这话，西尔维娅的眼睛亮了起来，她担忧的表情立刻变得明朗了许多。[say:哦，]她说，[say:我想我知道这是怎么回事了。这是我们成长过程中都必须经历的事情。]啊，看来这只是普通的" + (get_silly() ? "“女性烦恼”" : "生长痛") + "而已。[say:你正在经历变态发育！那种疼痛只是你的器官在液化和重组，为你成为一只成熟的蛾子做准备。]好吧，也许并不普通。");
         outputText("[pg]听到这个有些令人不安的消息，多洛雷斯显得出奇地平静。[say:我明白了，]她说。[say:这个过程需要很长时间吗？]");
         outputText("[pg]西尔维娅咯咯地笑着回答：[say:哦，不，不。你需要相对较快地开始结茧，但大约一周左右就应该全部结束了。]这只毛毛虫唯一的反应是一声深思熟虑的[say:哼，]她在消化这些信息时，目光转向了下方。");
         outputText("[pg]西尔维娅转向你问道：[say:你要留下来陪她吗？这可能需要一些时间……]多洛雷斯给了你一个不确定但充满希望的眼神。你要留下来吗？");
         saveContent.doloresProgress = 7;
         doYesNo(doloresPreCocoonYes,doloresPreCocoonNo);
      }
      
      public function doloresPostBirth() : void
      {
         clearOutput();
         outputText("你决定去看看西尔维娅和你刚出生的女儿多洛雷斯。在去她们家的路上，你好奇你的孩子会是什么样。她的母亲可能相当难对付，但你对你的孩子抱有很高的期望。当你走进洞穴时，你听到深处传来轻柔的哭声。进入主房间，你看到西尔维娅把婴儿抱在怀里，轻轻地摇晃着。她轻声低语，[say:嘘，亲爱的。妈妈在这里，]你的女儿似乎确实安静了一些。");
         outputText("[pg]当你靠近时，蛾娘抬头看了你一眼，并温暖地笑了笑。她把一根手指放在嘴唇上，然后示意你靠近。多洛雷斯在母亲的怀里睡着了，对于一个新生儿来说，她出奇地安静。西尔维娅站起身，示意你陪她一起走向洞穴深处。为了确保不吵醒你的女儿，你跟着她走进了走廊尽头的一个房间。目前房间里相当空旷，但在一个角落里放着一张木制婴儿床。西尔维娅轻轻地把婴儿放进去，然后默默地退了出去，带你回到了主房间。");
         outputText("[pg][b:(多洛雷斯已添加到蛾穴菜单中。)]");
         saveContent.doloresProgress = 2;
         get_game().mothCave.caveMenu();
      }
      
      public function doloresPetting3() : void
      {
         clearOutput();
         outputText("多洛雷斯从那精心准备的高潮中平复下来，大口喘着粗气。你把她拉过来接吻，这可能并没有改善她的状况。她" + (doloresComforted() ? "在昏沉中" : "有些迟疑地") + "回应着你，小小的余韵仍不时扫过她的身体。在你温柔的拥抱中颤抖了几分钟后，她似乎终于准备好起身了。她" + (doloresComforted() ? "慵懒地伸了个懒腰" : "默默地站起身") + "，然后转头看向你。");
         if(doloresComforted())
         {
            outputText("[pg]多洛雷斯给了你一个羞涩的微笑。[say: 哇。] 对她来说，这真是不同寻常的简单。她又变回只会说单音节词了吗？" + (get_silly() ? "你没想到自己有[i: 那么]厉害。" : "") + "她稍微挪了挪脚，然后继续说道。[say: 那真是……相当了不起。] 她还想再来一次吗？[say: 我……不会反对的。] 她的脸涨得通红，但脖子周围的绒毛中露出了一个微笑。[say: 我爱你，[Father]。]");
         }
         else
         {
            outputText("[pg]多洛雷斯给了你一个神秘的眼神，所以你问她感觉如何。[say: 感觉……我不知道该怎么形容。] 那她还想再来一次吗？她回答时声音微微颤抖，[say: 如果你希望的话。] 她停顿了一下，终于迎上你的目光，眼中闪烁着一种近乎绝望的光芒。[say: 我爱你，[Father]。] 你回应了她的爱意，她终于笑了，用惊人的力量拥抱了你。");
         }
         outputText("[pg]你在离开前，在女儿的额头上留下了最后一个吻。");
         dynStats(DynStat.Lust(20));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function doloresPetting2() : void
      {
         clearOutput();
         outputText("最后，你开始了沿着她的身体向下的漫长旅程，走向你等待的奖品。这一次，你越过了她最上面的一双手臂。它们太细了，你的手几乎完全包裹住了它们，你不得不惊叹与她的母亲相比，她显得多么娇小。你滑过她手腕上的毛发，抓住她的手，将你的手指与她的手指交织在一起。她很温暖，你想留下来。可悲的是，你确实必须继续前进，因为更好的事情在等着你。");
         outputText("[pg]最终，你的手汇聚在她那适婚的花蕾上，暂时停留在她阴阜的两侧。你小心翼翼地把她的内裤拉到一边。她颤抖着。一根迷路的" + (get_player().hasClaws() ? "爪子" : "手指") + "漂移着越来越近，越来越近，然后轻轻地擦过一片嘴唇。");
         outputText("[pg][say:啊-啊！[Father]……]");
         outputText("[pg]她的声音是如此的呼吸急促，在你的耳朵里是如此的令人愉悦。你可以直接把她吃掉，所以你这样做了，潜入并穿透了她温柔的深处。你的手指发现她的下体" + (doloresComforted() ? "湿得足以继续" : "有些冷淡，但你知道如何让她暖和起来") + "，所以你继续向内，慢慢地越来越深。");
         outputText("[pg]当你的手指终于触底时，你开始了缓慢的向后拖动过程，当你再次来到她的入口时，多洛雷斯已经气喘吁吁了。看来她终于鼓起勇气说话了，尽管她的声音非常颤抖。[say:请-请，慢一点……]你把手猛地伸了回去。");
         outputText("[pg]听到这个，她" + (doloresComforted() ? "吱吱叫着把双腿猛地夹紧" : "呜咽着紧张地开始把双腿夹紧") + "。你用空闲的手抠进她柔软的大腿，强迫她张开双腿，让你完全接触。同时，另一只手也不让她休息，无情地在她的褶皱中寻找每一个弱点。你最终找到了一个特别有效的地方，并开始将全部注意力集中在它上面，引得多洛雷斯发出一声" + (doloresComforted() ? "哀号" : "呜咽") + "。");
         outputText("[pg]当你继续你充满激情的服侍时，你开始用手掌根部摩擦她的阴蒂，仍然确保不要让你的女孩不知所措。年轻的飞蛾" + (doloresComforted() ? "明显" : "不舒服地") + "敏感，她的臀部扭曲和抽动，但你坚定的手阻止了她扭动出位置。你保持动作强劲而稳定，发动了一场无情的攻击，让她越来越接近她的极限。");
         outputText("[pg]几乎毫无预兆地，她高潮了。她的双腿绷紧，娇小的臀部在你的大腿上摩擦。你一秒钟也没有停下，继续揉弄着她的小穴，同时在她的脖子上留下细碎的吻。她在你的怀里扭动着，" + (doloresComforted() ? "发出微弱的欢愉叫声" : "但几乎完全保持沉默") + "，显然她还是太温顺了，不敢完全释放出来。没关系，从她身体紧紧夹住你手指的方式，以及在极乐的痉挛中翅膀拍打你的感觉，你已经知道了一切你需要知道的。");
         doNext(doloresPetting3);
      }
      
      public function doloresPetting() : void
      {
         clearOutput();
         outputText("你在她桌子旁的椅子上坐下，把多洛雷斯叫过来。");
         outputText("[pg]她紧张地顺从了，走上前站在你面前，等待进一步的指示。你趁机打量了她的外表。她那暗淡的脸庞在烦躁不安时带着一丝玫瑰色。她的两只手摆弄着头发，而另外两只手则在身前交叉。她那轻盈飘逸的裙子以一种诱人的方式隐藏了她的身形，给你留下了足够的印象，让你的想象力让你精疲力竭。你需要感受她。");
         outputText("[pg]在你的" + (doloresComforted() ? "指示" : "命令") + "下，年轻的飞蛾侧身走过来，坐在你的腿上，她那俏皮的屁股顶着你的胯部，让你" + (!get_player().isGenderless() ? "等待的" + (get_player().hasCock() ? "肉棒" : "小穴") + "兴奋不已，它在" + (!get_player().isNaked() ? "你的[armor]下" : "她的裙子布料上") + "因需要而跳动。但这并不是为了那个，你在这里是为了[i:她]的快乐" : "无比兴奋") + "。这样坐着，她的裙子被撩起了一点，给你提供了一个相当诱人的视野，但仍然稍微阻挡了你最想看到的东西。");
         outputText("[pg]看来她太害羞了，什么也说不出来，这让你不得不采取主动。");
         outputText("[pg]你非常小心地不急于求成，缓慢而从容地将你的[hands]沿着她的腿两侧向上移动，享受片刻她皮肤的凉爽感觉，然后停在她的的大腿上。尽管因期待而颤抖，你还是花了一点时间让自己平静下来。你需要控制自己的节奏。她很温暖，像这样，你的头靠在她的肩膀上，你的手臂环绕着她，她几乎被你吞没了。当你只是坐在那里，轻轻地抚摸着她的大腿时，她发出了一声低沉的[say:嗯——]。你呼吸着她的气味。只有一丝淡淡的香草味，与西尔维娅独特的香气截然不同。");
         outputText("[pg]从你脊椎底部开始的隐隐作痛向外蔓延，辐射到你的全身，直到你的每一个末端都在跳动，随着一种慢慢吞噬你的感觉而嗡嗡作响。这是需要，你[i:需要]她。你第一次尝试摸索是笨拙的，没有焦点的，导致她惊讶地[say:呀]了一声，但你很快纠正了这一点，并开始记录她的每一个部位。");
         outputText("[pg]首先，是她柔软的腿。你从她的大腿滑到她的膝盖，然后再滑回来，享受着她暴露在外的皮肤是多么的柔软。接下来，你向上漂移，把她的裙子拉得刚好露出她可爱的蕾丝内裤。你暂时克制住自己，经过她最珍贵的地方而没有打扰它，" + (doloresComforted() ? "引起了多洛雷斯最微弱的渴望的呻吟" : "尽管多洛雷斯似乎并不介意") + "，然后继续抚摸她柔软的肚子，它有着美味的轮廓。稍微偏离一点的是她那天堂般的臀部，刚刚开始向外张开。");
         outputText("[pg]向上移动，当你的手指沿着它们多情的路径拖动时，你可以透过她薄薄的衣服感觉到她肋骨的微弱轮廓。你在她的乳房下方犹豫了片刻，把她压在你的[chest]上，陶醉于这种亲密接触带给你的亲密感。当时机成熟时，你继续前进，终于用双手抓住了她的花蕾。");
         outputText("[pg]她对此喘着粗气，四只小手都抓住你的腿以寻求支撑。你娇气地挑逗着她的乳房，注意不要太粗暴。虽然它们很小，但玩起来同样有趣，用它们温柔的女性气质诱惑着你。然而，你无法拒绝自己捏一下她的乳头，这引起了你被俘虏的女儿颤抖的呜咽。你很快回到按摩中，暂时安抚了她。");
         outputText("[pg]当你吃饱喝足后，你的手继续移动，滑过她的锁骨，在她的肩膀上找到它们的位置。轻轻捏一下，只是为了确保她真的在那里。你几乎不敢相信——她在这里，在你的腿上，全都是你的。你转过头在她的脸颊上亲吻了一下，她脖子上的绒毛让你有点痒。");
         doNext(doloresPetting2);
      }
      
      public function doloresMenu() : void
      {
         var _g:MothCave;
         clearOutput();
         outputText("你走进多洛雷斯的房间看望她。");
         if(get_doloresProg() < 3)
         {
            outputText("[pg]你刚出生的女儿躺在婴儿床上，安然无恙。");
         }
         else if(get_doloresProg() < 7)
         {
            outputText("[pg]你年幼的女儿正坐在床上，手里拿着一本旧书。当你走进房间时，她抬起头，与你短暂地对视了一下，然后" + (get_doloresProg() > 3 ? "嘟囔了一句，[say:你好，[Father]，]然后" : "") + "将注意力转回阅读上。");
         }
         else if(get_doloresProg() < 9)
         {
            outputText("[pg]她的茧立在那里，一如既往地一动不动。");
         }
         else if(hikkiDone())
         {
            outputText("[pg]你走进多洛雷斯的房间，她立刻从书桌前站起来，冲过来给你一个拥抱。她抱了你一会儿，然后回到座位上，给了你一个平静的微笑。[say:你好，[Father]，来聊天的吗？]");
         }
         else
         {
            outputText("[pg]你正值青春期的女儿正坐在书桌前，面前摊开着一本古老的" + (saveContent.doloresDecision == 1 ? "魔法" : "历史") + "典籍。你进来时，她抬起头，对你微微一笑。[say:你好，[Father]。你有什么事吗？]");
         }
         menu();
         addButton(0,"外貌",doloresAppearance);
         if(get_doloresProg() > 4)
         {
            addButton(1,"交谈",doloresTalkMenu).disableIf(get_doloresProg() == 8,"你不能这样和她说话。");
            addButton(5,"摸头",doloresHeadpat).disableIf(get_doloresProg() == 8,"你不能这样摸她。");
         }
         if(saveContent.doloresSex > 0)
         {
            addButton(2,"做爱",doloresSexMenu).disableIf(get_doloresProg() == 8,"这是袋熊保险。").disableIf(get_player().get_lust() < 33,"你还不够兴奋，不能做爱。");
         }
         if(saveContent.doloresDecision == 3 && get_doloresProg() > 8 && get_doloresProg() < 12)
         {
            addRowButton(2,"给书",giveBook).hint("还是把书给她吧。");
         }
         if(get_player().hasKeyItem("Old Manor Books"))
         {
            addRowButton(2,"给书",giveManorBooks).hint("把你在旧庄园找到的那些书给她。");
         }
         if(get_doloresProg() == 16)
         {
            if(saveContent.hikkiQuest == 0)
            {
               addRowButton(2,"旅行",hikkiAccept).hint("开始她想去的旅行。");
            }
            else
            {
               addRowButton(2,"继续",hikkiContinue).hint("从你上次旅行中断的地方继续。");
            }
         }
         _g = get_game().mothCave;
         setExitButton("返回",function():void
         {
            _g.caveMenu();
         });
      }
      
      public function doloresMagicYes() : void
      {
         clearOutput();
         outputText("你很清楚不能让这种事情恶化成问题。当你问多洛雷斯她是否真的安分守己时，她似乎生气了。");
         outputText("[pg][say: 是的，[Father]，]她眯起眼睛说道。[say: 事实上，我能够听从简单的指示。我原以为你会知道这一点的，尽管你显然很看不起我。]她充满怨气的语气在最后有些动摇，她盯着自己的脚看了一会儿，然后以一种更加柔和的方式继续说道。");
         outputText("[pg][say: 我……对不起，[Father]，但是……我现在想一个人静静。]");
         outputText("[pg]你答应了，退出她的房间。看来这个话题比你想象的更敏感，但至少目前看来，她并没有惹上麻烦。");
         saveContent.doloresAngry = true;
         get_game().mothCave.caveMenu();
      }
      
      public function doloresMagicShow() : void
      {
         clearOutput();
         outputText("好吧，你刚好有能让她印象深刻的东西。你掰得指关节咔咔作响作为准备，然后开始有节奏地舞动手指，召唤出你的魔法。");
         var _loc1_:Number = doloresMagicDetermine();
         if(_loc1_ == 1)
         {
            outputText("你变出一团小火焰，让它在你的指尖跳跃，以一种难以捉摸的轨迹旋转飞舞。突然，这团小小的" + (get_player().hasPerk(PerkLib.CorruptedNinetails) ? "紫色" : "蓝色") + "光芒分裂成许多明亮的火花，它们在空中呼啸而过，留下的轨迹让你女儿看得入了迷，随后它们顺着你的手腕飞去，消失在视线中。");
         }
         else if(_loc1_ == 2)
         {
            outputText("你从手掌中变出一团绿色的火焰，举到她面前，但小心翼翼地不烧到她的眉毛。然后你让它瞬间变得更亮，耀眼的火光倒映在你女儿目眩神迷的眼睛里，随后你再次握紧手指，熄灭了这团翠绿的火焰。");
         }
         else if(_loc1_ == 3)
         {
            outputText("你在指尖凝聚出一团纯白的光芒，小心翼翼地控制着能量，以免像平时致盲敌人那样伤到人。尽管如此，强烈的光芒还是让你的女儿眯起眼睛，用手挡住视线。于是你弹了弹手指，驱散了耀眼的强光，只留下几秒钟微弱的余辉。");
         }
         else if(_loc1_ == 4)
         {
            outputText("邪恶的能量在你的手中涌动，你的手随之膨胀，血管几乎因为你注入的力量而跳动。你活动着这只肌肉暴突、形如怪物的手臂，引得你的女儿惊呼出声，呆呆地盯着它。你得意地笑了笑，扭动着肿胀的手指，然后解除了法术，让你的手恢复了原状。");
         }
         else if(_loc1_ == 5)
         {
            outputText("你将注意力集中在附近桌子上的一本书上，伸出手，仿佛要抓住它。你运用念动力，用一股无形的力量将书从桌子上举起。它在多洛雷斯惊讶的头顶上飘过，然后落入你等待的手中，你随之解除了法术。");
         }
         outputText("[pg]当你的展示结束后，你的女儿冲到你面前，她的眼睛在昏暗的光线下几乎闪闪发光。她看起来好像有一百万个问题，却不知道从何问起。她的嘴唇因为激动而颤抖，有那么一瞬间，你甚至觉得她可能" + (get_silly() ? "坏掉了" : "说不出话来了") + "，但突然间，堤坝决口，所有的问题像洪水一样涌了出来。[say:你是怎么做到的？你从哪里学来的？你能再做一次吗？会痛吗？你一天能做多少次？<i>我</i>能做到吗？]如此这般，直到最后你不得不" + (get_player().cor > 50 ? "叹了口气" : "微笑着") + "把手放在她的肩膀上，让她停下来。");
         outputText("[pg]她似乎意识到自己有些语无伦次，立刻安静下来，脸微微泛红。[say:抱歉，[Father]。你……你介意教我一点魔法吗？]你指了指一把椅子，你们俩坐了下来。");
         outputText("[pg]从这个角度，你突然发现西尔维娅正从后面的走廊往房间里偷看。当你们目光相遇时，她对你眨了眨眼——看来她一直都盼着这种事情发生。" + (get_player().cor < 50 ? "好吧，没关系，" : "你晚点得和她谈谈，但") + "你现在可以先和你女儿聊完。");
         outputText("[pg]当你向她解释基础知识——你力量的来源、使用它时的感觉等等——时，她全神贯注地听着。她早先的热情显然还在，但已经不足以引发另一轮连珠炮般的提问了。随着你继续讲述，你在她的眼中看到了一种由衷的惊叹，那是强烈的好奇心和孩童般的纯真交织在一起的神情，在她脸上显得无比完美。");
         doNext(doloresMagic2);
      }
      
      public function doloresMagicNo() : void
      {
         clearOutput();
         outputText("你很清楚在她已经心烦意乱的时候不要去惹她。随着时间的推移，你确信她会明白你所做的一切都是为了她好。如果她不明白，" + (get_player().cor > 50 ? "你只能再给她一个教训了" : "你依然会陪在她身边") + "。");
         outputText("[pg]过了一会儿，她似乎平静了下来，恢复了冷酷的举止。[say: 抱歉，[Father]。还有什么事吗？]");
         doNext(doloresTalkMenu);
      }
      
      public function doloresMagicLeave() : void
      {
         clearOutput();
         outputText("你告诉你的女儿，" + (get_player().cor < 50 ? "你很抱歉，但是" : "") + "你在这里帮不上忙。她的目光慢慢垂向脚边，对你的话只是点了点头。你等了一会儿，但她似乎没有别的话要说，于是你道了别，朝洞口走去。当你走开时，你觉得身后有什么动静，于是你回过头，却只看到多洛雷斯跑进后走廊的一闪而过的身影。");
         outputText("[pg]你离开洞穴，踏上回家的路。");
         _temp_1.doloresTimesLeft += 1;
         dynStats(DynStat.Cor(3));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function doloresMagicEh() : void
      {
         clearOutput();
         outputText("你耸了耸肩，告诉她你并没有那么印象深刻，因为她甚至不知道这个法术是干什么用的，更不用说它看起来并不像成功了。");
         outputText("[pg]她嗤笑一声，转过头去，用骄傲的伪装拙劣地掩饰着自己的受伤。[say: 你根本看不到其中的美。]她的肩膀微微颤抖。[say: 我……我现在想一个人静静。]");
         outputText("[pg]你答应了，退出她的房间。看来这件事对她来说比你想象的更重要，但希望她的心情会随着时间的推移而好转。");
         saveContent.doloresAngry = true;
         get_game().mothCave.caveMenu();
      }
      
      public function doloresMagicDetermine() : Number
      {
         if(get_player().hasPerk(PerkLib.CorruptedNinetails) || get_player().hasPerk(PerkLib.EnlightenedNinetails))
         {
            return 1;
         }
         if(get_player().hasPerk(PerkLib.TerrestrialFire))
         {
            return 2;
         }
         if(get_player().hasStatusEffect(StatusEffects.KnowsBlind) && get_player().cor < 40)
         {
            return 3;
         }
         if(get_player().hasStatusEffect(StatusEffects.KnowsMight) && get_player().cor > 60)
         {
            return 4;
         }
         if(get_player().hasStatusEffect(StatusEffects.KnowsTKBlast))
         {
            return 5;
         }
         if(get_player().hasStatusEffect(StatusEffects.KnowsBlind))
         {
            return 3;
         }
         if(get_player().hasStatusEffect(StatusEffects.KnowsMight))
         {
            return 4;
         }
         return -1;
      }
      
      public function doloresMagicDangerous() : void
      {
         clearOutput();
         outputText("你敢发誓刚才发生了一些奇怪的事情。你告诉多洛雷斯，你不太确定这个法术是否安全。");
         outputText("[pg]她疑惑地看着你，好像你在胡言乱语。[say: 你什么意思？我什么都没注意到。]");
         outputText("[pg]你不确定是你产生了幻觉还是真的发生了什么，但你现在只能保留你的判断。");
         outputText("[pg]她嗤笑一声。[say: 哼。你显然只是无法欣赏这种魔法的美。我会证明给你看的，它绝对无害。]");
         outputText("[pg]好吧，看起来一切似乎都没问题……");
         doNext(doloresTalkMenu);
      }
      
      public function doloresMagicChat() : void
      {
         clearOutput();
         if(get_doloresProg() < 12)
         {
            outputText("鉴于她对魔法表现出非常明确的兴趣，你想知道她是否还在研究它。");
            outputText("[pg][say: 是的，]她" + (saveContent.doloresDecision == 1 ? "兴奋地说道，[say: 这都要感谢你。]" : "有些尖锐地说道，[say: 尽管你……反对。]") + " 她稍微改变了一下站姿，将一根手指移到脸颊上。[say: 我一直在……涉猎一点，虽然我还不是特别擅长，但是……]");
            if(saveContent.doloresDecision == 1)
            {
               outputText("[pg]你的女儿没有说完，而是闭上眼睛，伸出四只手。她开始低声嘟囔着什么，房间似乎突然比以前暗了一点。你听不懂她念的任何词，但她的咒语似乎确实产生了某种效果，因为她的手指开始发出深紫色的能量光芒。");
               outputText("[pg]她将双手摆成菱形，手掌相对，张开手指，注意力从未分散。光芒开始从她的手指上剥离，形成奇怪的焦油状团块，然后聚集成一个漂浮在她指间的球体。球体在那里停留了一段时间，多洛雷斯的表情变得更加紧张，但正当你想知道她试图完成什么时，一道闪光闪过，那团物质消散了。");
               outputText("[pg]有那么几个瞬间，一切似乎都不对劲，就像你在水下一样。你试图向前[if (singleleg) {滑行|迈出一步}]，但你的[if (haslegs) {腿|身体}]移动得太慢了。动作进行到一半时，一切恢复正常，你[if (singleleg) {摇摇晃晃地向前倾|摇摇晃晃地完成了你的步伐}]。多洛雷斯睁开眼睛，似乎对刚刚发生的奇怪事件毫无察觉。那是你的错觉吗？");
               outputText("[pg][say: 令人印象深刻，对吧？]你的女儿问道，她的表情非常自鸣得意。[say: 我不知道如何长时间维持那道光，我也不确定这个法术的确切用途，但它看起来确实很可爱，你不觉得吗？]");
               menu();
               addNextButton("太棒了",doloresMagicAmazing).hint("表达你对她技能的赞赏。");
               addNextButton("没什么特别",doloresMagicEh).hint("告诉她你觉得这没什么特别的。");
               addNextButton("危险？",doloresMagicDangerous).hint("向她询问异常情况。");
            }
            else
            {
               outputText("[pg]她让这句话在空气中停留了片刻，然后继续说道：[say: 不，不，别管那个了。它肯定还没准备好。而且[i:你]已经明确表示不希望我做任何“不负责任”的事情。] 她在说最后一个词时带着明显的挑衅，让你不确定她是否明白你这么做的苦心。");
               outputText("[pg]你应该在这个问题上向她施压吗？");
               doYesNo(doloresMagicYes,doloresMagicNo);
            }
            saveContent.doloresAmbitions = 1;
         }
         else
         {
            outputText("多洛雷斯对魔法的兴趣并不总是带来最好的结果，但作为她的[father]，你觉得有义务更多地了解她生活的这一方面。而且，确保事情不再失控也没有坏处。你问多洛雷斯，在经历了这一切之后，她是否还在练习魔法。");
            outputText("[pg]听到这个问题，她的眼睛亮了一点，给了你一个神秘的、几乎是疲惫的微笑。[say: 当然，[Father]。魔法是我在这个悲惨世界中发现的唯一真正美丽的东西，而且它似乎也同样爱我。我打算追求我的热情，直到我死去的那一天。] 她看起来有一瞬间的内疚。[say: 当然，是以负责任的方式。]");
            outputText("[pg]她关于魔法是“爱”的说法提出了一个有趣的观点。为什么她[i:能]把那本书用得那么好？那似乎是一个相当复杂的仪式，但她" + (int(saveContent.doloresFinal % 10) == 1 ? " 几乎" : "") + "能够独自完成这一切。蛾女天生对魔法有亲和力吗？这一切都归结于运气和环境吗？她只是个天才吗？");
            outputText("[pg]她的笑容稍微扩大了一点，但她花了一点时间才回答，手指摆弄着裙摆。[say: 嗯……我不能确定，但对我来说，这总是感觉很自然。我想，既然那本书一开始就在我们这里，那可能有一些联系，但是……我只是把这当成我的使命。我很难向你解释，但你肯定也有同样感觉的事情吧？]");
            outputText("[pg]有意思。你想更多地了解魔法对她来说是怎样的[i:感觉]，因为她经常用如此奇怪的方式来描述它。");
            outputText("[pg][say: 它很精致，比任何世俗的美味都要好得多，]她带着有些势利的撅嘴说道。为了她好，你压抑了自己的反应。[say: 然而……没有什么能比得上那本古老典籍中魔法的感觉。一旦尝过那种滋味……我将永远不会忘记那种感觉。] 她的眼睛闪烁着光芒。[say: 总有一天……总有一天，我会按照自己的方式再次品尝它。[pg]无论如何，]她恢复了平时超然的举止，说道，[say: 随时欢迎你问这些事情。我总是很乐意谈论我的兴趣。] 一个真正温暖的微笑。[say: 也很乐意和你说话，[Father]。]");
            doNext(doloresTalkMenu);
         }
      }
      
      public function doloresMagicBook() : void
      {
         clearOutput();
         outputText((doloresMagicDetermine() > 0 ? "你不愿意" : "你无法") + "向她展示你自己的戏法，于是你决定转向西尔维娅在这里收集的大量藏书。肯定有[i:什么东西]能让你用来给女儿留下深刻印象。");
         outputText("[pg]扫视着各种书的脊背，你发现这个收藏在主题上相当不拘一格。从《谨慎烹饪》到" + (get_silly() ? "《为了乐趣和利润榨取福瑞》" : "《编年史船长传说》") + "应有尽有，但到目前为止似乎没有什么合适的。然而，正当你开始觉得可能要让多洛雷斯失望时，你终于在书架右上角，远远超出你女儿够得着的地方，看到了一本古老、被遗忘的大部头，书名是《本源与巫术：魔法基础》。");
         outputText("[pg]你把它抽出来，拍了拍上面的灰尘，然后把封面展示给多洛雷斯，问她以前有没有读过。她摇了摇头，于是你建议你们俩一起读。她对这个主意热情地点了点头，于是你让她到附近的一把椅子上坐下，然后自己也坐了下来。");
         outputText("[pg]从这个角度，你突然发现西尔维娅正从后面的走廊往房间里偷看。当你们目光相遇时，她对你眨了眨眼——看来她一直都盼着这种事情发生。" + (get_player().cor < 50 ? "好吧，没关系，" : "你晚点得和她谈谈，但") + "你现在可以先和你女儿聊完。");
         outputText("[pg]这本书似乎侧重于基础知识——即玛瑞斯魔法的主要来源。它详细说明了白魔法源于有条理的头脑的严谨性，而黑魔法则来自原始的激情和情感。你大声读给女儿听，尽管语言枯燥，但她似乎真的很喜欢，当你尽可能多地向她解释时，她不断地点头。");
         outputText("[pg]在相关的时候，你会用自己的经历来补充书中的信息。你在玛瑞斯的日子里见过一些真正不可思议的事情，因此，你发现自己能为女儿提供" + (doloresMagicDetermine() > 0 ? "" : "惊人") + "数量的额外信息。她在恰当的时候发出“哦”、“啊”和“咿”的声音，似乎真的被你的故事吸引了。");
         dynStats(DynStat.Inte(1));
         unlockCodexEntry(2047);
         doNext(doloresMagic2);
      }
      
      public function doloresMagicAmazing() : void
      {
         clearOutput();
         outputText("你告诉多洛雷斯，你对那次展示印象深刻。那可能不是最受控制的演示，但对于她这个年纪的人来说，她的魔法能力显然是非凡的。");
         outputText("[pg]她洋溢着青春的骄傲，这一次看起来确实符合她的年龄。[say: 我就知道你会喜欢的。我[i:知道]你能看到其中的美。] 她兴奋得几乎要在脚上跳起来了。[say: 谢谢你，[Father]，谢谢你的理解。]");
         outputText("[pg]你很惊讶你的回答对多洛雷斯来说竟然如此重要，但她的热情很有感染力。");
         outputText("[pg][say: 你还想谈点别的吗？]她问道，笑容依旧灿烂。");
         doNext(doloresTalkMenu);
      }
      
      public function doloresMagic2() : void
      {
         clearOutput();
         outputText("最终，当你无话可说时，谈话稍微平息了下来。你看着女儿在那里静静地坐了一会儿，然后你之前的困惑又回到了你的脑海中。虽然她可能不是个“话匣子”，但多洛雷斯仍然表现出了显著的进步，但这引出了一个问题：为什么一开始让她开口那么困难。");
         outputText("[pg]你问女儿为什么她小时候不喜欢说话。她甚至没怎么考虑这个问题就说，[say: 嗯……大多数事情都不值得说出来。]什么？她哼了一声。[say: 为什么要说多余的话？大多数时候这只是浪费口舌。</i>有些<i>人]——她瞥了一眼走廊——[say: 不知道言语的价值。]看来她也变得有些自负了。");
         outputText("[pg]你把话题转向更愉快的事情，继续和女儿聊了一会儿。然而，最终你该走了。你瞥了西尔维娅一眼，示意她正式走进房间。[say: 你好，亲爱的，]她对多洛雷斯说，[say: 你和[dad]聊得开心吗？]");
         outputText("[pg][say: 嗯。]");
         outputText("[pg][say: 你们聊了些什么？]");
         outputText("[pg][say: ……魔法。]");
         outputText("[pg][say: 哦，那一定很有趣吧，嗯？]");
         outputText("[pg]你女儿咕哝了一声。她似乎没有注意到她母亲脸上那会意的——甚至可能是得意的——微笑。");
         outputText("[pg]你开始道别并准备离开，但多洛雷斯没有回应。虽然这在不久前并不奇怪，但现在似乎有点不对劲。当你转头看她时，你注意到她正盯着地面，看起来有些闷闷不乐。");
         outputText("[pg]西尔维娅又对你眨了眨眼，双手叉腰，转向她的女儿。[say: 好了，多洛雷斯，我们谈过这个的。当别人为我们做了好事时，我们该怎么说？]");
         outputText("[pg]毛毛虫女孩翻了个白眼，但还是跑过来紧紧地拥抱了你，在你" + (get_player().get_tallness() > 72 ? "腰间" : (get_player().get_tallness() > 48 ? "胸前" : "肩膀上")) + "嘟囔了一句出人意料地真诚的，[say: 谢谢你，[Father]。]在她松开手之前，你拍了拍她的背。她稍微红了脸，看着自己的脚。");
         outputText("[pg][say: 早点回来，]西尔维娅说。[say: 我们随时欢迎你来。]多洛雷斯热情地点头表示同意，当你走出洞穴时，她们俩向你挥手告别。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function doloresMagic() : void
      {
         clearOutput();
         doloresReset();
         outputText("你来到西尔维娅的家，却发现站在门口迎接你的不是她母亲，而是多洛雷斯。自从你上次见到她以来，她似乎又长高了几英寸，现在看起来大约有十岁了。");
         outputText("[pg]你正准备向女儿打招呼，却被打断了。[say: [day]好，[Father]。很高兴见到你。]你几乎被困惑淹没了。那是完整的两句话吗？而且她真的主动开始和你说话了？她只是看着你作为回应，微微皱着眉头。你回望着她。[say: 是的，我说了，]她说道，现在完全撅起了嘴。又过了几秒钟。[say: 那……是个问题吗……？] " + (get_player().cor < 80 ? "完全不是，" : "也许吧……") + "但这确实令人惊讶。");
         outputText("[pg]就像排练好的一样，西尔维娅突然出现为你解围。然而，她立刻又回到了同一个话题。[say: 哦，这难道不棒吗？她现在简直是个小话痨了！]多洛雷斯咕哝了一声。这位蛾女灿烂地笑着，转向你说道，[say: 我真为她感到骄傲。]");
         outputText("[pg]沉默持续了足够长的时间，气氛变得有些尴尬，随后西尔维娅拍了拍两只手，转向多洛雷斯说道，[say: 那么，你为什么不和你的[father]聊聊呢？我得去处理点事情。]");
         outputText("[pg][say: 好的，]她回答道——居然是双音节的！这可能需要点时间来适应。");
         outputText("[pg]西尔维娅简短地挥了挥手，然后溜进了后面的房间。多洛雷斯还在盯着你看。你问她最近在读什么。她的嘴角微微上扬，似乎这终于让她敞开了心扉。[say: 魔法，]她说。[say: 我在书上看到，人们只用自己的双手和力量就能做到各种各样的事情，不可思议的事情。这是真的吗？]你告诉她这是真的。");
         outputText("[pg][say: 哇……]她紫色的眼睛里燃烧着好奇心，她又想了一会儿，然后转过身来看着你。");
         outputText("[pg][say: </i>你<i>懂魔法吗？]");
         saveContent.doloresProgress = 5;
         menu();
         addNextButton("展示",doloresMagicShow).hint("向多洛雷斯展示一些你自己的魔法。").disableIf(doloresMagicDetermine() < 0,"你不知道任何可以用来演示的魔法。");
         addNextButton("书？",doloresMagicBook).hint("也许西尔维娅的书架上有什么有用的东西。");
         addNextButton("离开",doloresMagicLeave).hint("你没有。");
      }
      
      public function doloresLitChat() : void
      {
         var choice3:int;
         var _g3:DoloresScene;
         var choice2:int;
         var _g2:DoloresScene;
         var choice1:int;
         var _g1:DoloresScene;
         var choice:int;
         var _g:DoloresScene;
         clearOutput();
         outputText("你问多洛雷斯对文学有什么看法。毕竟，她" + (get_doloresProg() < 9 ? "对书本产生了浓厚的兴趣" : "读了很多书") + "。");
         if(get_doloresProg() < 9)
         {
            outputText("[pg]她羞涩地左右看了看。[say:嗯……我喜欢……] 她似乎对自己的回答感到有些尴尬，所以过了好一会儿才勉强说出来，但最终，她还是说道，[say:我喜欢冒险故事。那些关于英雄和怪物、遥远的土地和不可思议的壮举的故事……]");
            outputText("[pg]虽然算不上什么高雅的东西，但对于一个孩子来说也没什么好尴尬的。不过，她这么喜欢这些故事有什么原因吗？毕竟，玛瑞斯是一个充满魔法的世界，每个角落都充满了冒险和危险。她虽然还小，但直接去外面探险不是更刺激吗？");
            outputText("[pg][say: 我，呃……这很难解释。阅读就是……当你去想象它的时候，总是会更好。]");
         }
         else
         {
            outputText("[pg]她双臂交叉，一手托着下巴，说道：[say: 嗯……我想我得说是那些经典之作。富利克雷、坦博、希奇金]——这些名字你都没听过——[say: 还有所有其他伟大的作家。那纯粹的技巧……] 这最后一句话让她的眼神变得有些惆怅，目光也随之移向了天花板。");
            outputText("[pg]这回答真是意料之中的正经。你正准备换个话题，她却又开口了。[say: 但是……我一直很喜欢……呃……] 她突然显得有些不好意思，似乎说不下去了。最后，她紧闭双眼，硬是把话挤了出来。[say: 我最喜欢的还是冒险故事。我知道这很幼稚，但是……我想我永远也不会失去那种好奇心……] 她的声音渐渐低了下去，看来这就是她要说的全部了。");
         }
         outputText("[pg]又沉默了一会儿，她转向你问道：[say: 你喜欢什么类型的书？]");
         menu();
         _g = this;
         choice = 0;
         addNextButton("冒险",function():void
         {
            _g.doloresLitAnswer(choice);
         });
         _g1 = this;
         choice1 = 1;
         addNextButton("非虚构",function():void
         {
            _g1.doloresLitAnswer(choice1);
         });
         _g2 = this;
         choice2 = 2;
         addNextButton("言情",function():void
         {
            _g2.doloresLitAnswer(choice2);
         });
         _g3 = this;
         choice3 = 3;
         addNextButton("都不喜欢",function():void
         {
            _g3.doloresLitAnswer(choice3);
         });
      }
      
      public function doloresLitAnswer(param1:int) : void
      {
         switch(param1)
         {
            case 0:
               outputText("[pg]你最喜欢那些惊险刺激、充满危险与英勇事迹的故事。");
               outputText("[pg][say: 我明白了，] 她说着，试图掩饰一个真诚的微笑，但失败了。");
               break;
            case 1:
               outputText("[pg]你最喜欢关于历史和科学等真实题材的书籍。");
               outputText("[pg][say: 我明白了，] 她说着，脸上露出了沉思的表情。");
               break;
            case 2:
               outputText("[pg]你喜欢言情小说——无论是苦命鸳鸯、命中注定的相遇，还是俗套的露水情缘。");
               outputText("[pg][say: 我明白了，] 她说着，" + (saveContent.doloresSex > 2 ? "微微脸红" : "皱了皱鼻子") + "。");
               break;
            case 3:
               outputText("[pg]你不喜欢[i: 任何]类型的书。从来都不喜欢。");
               outputText("[pg][say: 我明白了，] 她说着，看起来有些失望。");
         }
         doNext(doloresTalkMenu);
      }
      
      public function doloresJustChatProblem() : void
      {
         outputText("[pg]她有些傲慢地皱起眉头。[say:哼。我想我的好品味一定是遗传自别处。]");
         doNext(doloresTalkMenu);
      }
      
      public function doloresJustChatFine() : void
      {
         outputText("[pg]她有些得意地笑了。[say:谢谢你，[Father]。我就知道你是个通情达理的人。]");
         doNext(doloresTalkMenu);
      }
      
      public function doloresJustChat() : void
      {
         var _loc3_:* = null as Array;
         clearOutput();
         var _loc1_:Array = [1,2,3,4,7];
         if(get_doloresProg() > 9)
         {
            _loc1_.push(5);
         }
         if(hikkiDone())
         {
            _loc1_.push(6);
         }
         var _loc2_:Array = _loc1_;
         switch(int(_loc2_[Utils.rand(int(_loc2_.length))]))
         {
            case 1:
               outputText("你问多洛雷斯为什么她说话是那个样子的。");
               outputText("[pg][say: 你这话是什么意思？]");
               outputText("[pg]嗯，她有个习惯，就是有点啰嗦。她肯定能听出她和她母亲之间的区别。");
               outputText("[pg][say: 哼。我比这个被神遗弃的世界上的大多数人都要文雅一点，这不是我的错。我只是对我的言辞感到自豪，这在如今很大程度上已经被遗忘了。这难道是犯罪吗？]");
               menu();
               addNextButton("没关系",doloresJustChatFine).hint("你觉得这其实没什么大不了的。");
               addNextButton("有问题",doloresJustChatProblem).hint("她应该学学什么是尊重。");
               return;
            case 2:
               outputText("你问多洛雷斯最近有没有读到什么有趣的东西。她的眼睛立刻亮了起来，充满了热情，在你还没来得及后悔你的问题之前，她就开始滔滔不绝了。");
               outputText("[pg][say: 哎呀，是的。我刚开始读一篇关于不同种族魔法引导效率抽象原理的优秀论文，写于恶魔祸害发生前短短几年。事实证明……]");
               outputText("[pg]几分钟后，你对自己对这个话题的关心程度有了一个相当清楚的认识。");
               break;
            case 3:
               outputText("你问多洛雷斯为什么她要穿衣服。毕竟，西尔维娅就不穿。");
               outputText("[pg]她微微皱眉，说道：[say:这是问你女儿的合适问题吗？虽然母亲可能不介意别人看到她……那个样子……但我——！]她结巴了一下，脸颊微红。[say:……可没那么“自信”。]");
               if(saveContent.doloresSex > 2)
               {
                  outputText("接着她迎上你的目光。[say:再说了，又不是说……]她脸上的红晕更深了。[say:你该看的都已经看过了。]");
               }
               if((saveContent.hikkiQuest & HQMARI) != 0)
               {
                  outputText("[pg]你有一瞬间觉得她可能会试图转移话题，但随后她眼中闪过一丝光彩。[say:哦，而且我怎么能不穿呢，那位出色的裁缝对我那么好。]她轻轻抚平裙子，看起来十分高兴。");
               }
               else
               {
                  outputText("她双臂交叉，看向一旁，撅着嘴。看来你没法从她嘴里套出更多话了。");
               }
               break;
            case 4:
               outputText("多洛雷斯问你：[say:你最近有看到什么有趣的东西吗？]");
               _loc1_ = [];
               if((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2683) & 0x0800) != 0)
               {
                  _loc1_.push(1);
               }
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1272) > 0)
               {
                  _loc1_.push(2);
               }
               if((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2671) & 0x80) != 0)
               {
                  _loc1_.push(3);
               }
               _loc3_ = _loc1_;
               switch(int(_loc3_[Utils.rand(int(_loc3_.length))]))
               {
                  case 1:
                     outputText("[pg]你告诉她关于审判官之塔以及塔顶那个疯子的事。你详细描述了你与之战斗的不可思议的活雕像，以及你在那里解开的恶魔迷宫。");
                     break;
                  case 2:
                     outputText("[pg]你告诉她关于恶魔女王的要塞以及其中的重重危险。你的话语编织了一个在对抗邪恶的莉希丝时展现出伟大" + (get_player().cor < 30 ? "英雄气概" : "勇气") + "的故事。");
                     break;
                  case 3:
                     outputText("[pg]你告诉她你探索过的被诅咒的庄园。这个充满恐怖与疯狂的故事明显让房间里的气氛变得阴沉，当你讲到那个可怕的死灵法师时，多洛雷斯出乎意料地发出一声[say:呀！]。");
                     break;
                  default:
                     outputText("[pg]你告诉她你最近在玛瑞斯各地的旅行。");
               }
               outputText("[pg]年轻的" + (get_doloresProg() < 9 ? "毛毛虫" : "蛾女") + "全神贯注地听着，每当你提到在冒险中遇到的奇异魔法时，她的眼睛就会亮起来。");
               break;
            case 5:
               outputText("你问多洛雷斯现在能飞了是不是很兴奋。你[if (canfly) {深知|无法想象}]在空中翱翔的那种绝对自由。");
               outputText("[pg][say:嗯，是的，]她心不在焉地说道。她[i:看起来]确实不怎么热情。");
               outputText("[pg][say:好吧，这对我来说根本没那么有趣。当然，我可以在这片恶臭的沼泽上空飞行，看着下面那些腐烂的烂泥，但我宁愿待在家里看书。一个优秀的作家能构想出比这个可怕世界上任何事物都要壮观得多的地方。]");
               outputText("[pg]仔细想想，她似乎不像西尔维娅那样经常在洞穴里随意飞来飞去，而是更多地使用她的双腿。");
               outputText("[pg][say:我想也是，]她耸了耸肩说道。");
               break;
            case 6:
               outputText("你问多洛雷斯她是否感到过孤独。");
               outputText("[pg]她毫不犹豫地微微扬起下巴，回答道：[say:一点也不。我一个人待着非常开心。看看外面的世界是不错，但……这确实让我更加欣赏家里的乐趣。相对安静的环境，有时间独自阅读，不需要担心我是否会——]她瞥了你一眼，话说到一半停了下来，显然是觉得谈论自己出糗的事太尴尬了。");
               outputText("[pg][say:但是，是的，或者，啊，不，我不孤独。不管怎样，谢谢你的关心，[Father]。]");
               outputText("[pg]好吧，你觉得只要她自己开心就好。");
               if((saveContent.hikkiQuest & HQMARI) != 0)
               {
                  outputText("[pg]然而，就在你以为这个话题已经过去时，她又开口了。[say:不过我想，玛瑞斯的住处离这里也不算太远……] 她的脸上露出了沉思的表情，但没有再继续说下去。");
               }
               break;
            case 7:
               outputText("你好像从来没见过多洛雷斯吃东西，于是你问她喜欢吃什么。");
               outputText("[pg][say:啊，嗯，啊……我想我只是总体上不太喜欢，]她回答道，揉着自己的手臂。她说的“不太喜欢”是什么意思？");
               outputText("[pg][say:我只是不太喜欢我吃的食物。大部分都很清淡。]");
               if(get_doloresProg() < 9)
               {
                  outputText("[pg]好吧，她毕竟还是个长身体的孩子，可能还没有机会尝试足够多的东西。你确信她最喜欢的食物一定在某个地方等着她，但当你把这告诉她时，她只是嘟囔了几句。");
                  break;
               }
               outputText("[pg]那么，她是不喜欢她吃的食物，还是不喜欢吃东西本身呢？");
               outputText("[pg][say:嗯，我想这附近的选择确实不怎么样。虽然有水果之类的东西可以采摘，但谁也说不准那些东西能不能吃。至少母亲大人[if (isfeminine) {——或者，呃，你知道的——| }]通常会负责采购。但她总是唠叨着让我加入她，让我去体验那种刺激——] 她瞥了你一眼，眼睛微微睁大。");
               outputText("[pg][say:也就是说，去品尝一下，呃，“真正的食物”。是的。]多洛雷斯沉默了下来，她转过头，脚在地上轻敲着。" + (saveContent.doloresProgress >= 15 ? "但过了一会儿，她继续说道，[say:好吧，也许这不会那么令人不快。" + (hikkiDone() ? "正如你向我展示的那样，偶尔走出家门也是件好事" : "即使这意味着要走进沼泽") + "。]" : "看来她不愿意再多说什么了。"));
         }
         doNext(doloresTalkMenu);
      }
      
      public function doloresHomeChat() : void
      {
         clearOutput();
         outputText("你问多洛雷斯对她的家有什么看法。");
         outputText("[pg]她茫然地盯着你看了一会儿。[say: 家……还……好吧？] 她极快地向下瞥了一眼。[say: 嗯，我想我也没有什么可以拿来比较的。] 她似乎没有什么要补充的了，于是你试图进一步引导她，这次问她对这个地方是否真的没有什么特别喜欢或讨厌的。");
         outputText("[pg][say: 嗯……] 她用脚打着拍子，环顾四周。[say: 嗯……我确实很喜欢母亲在这里收集的所有古书之类的东西。] 还有别的吗？[say: 哦！那些挂毯。它们真的很了不起。] 看来这就是全部了，你正准备继续说下去，她却又开口了。");
         outputText("[pg][say: 但是这片沼泽……] 这位" + (get_doloresProg() > 9 ? "毛毛虫女孩" : "蛾女") + "皱起了鼻子。[say: 呃，我简直受不了。那高温、那烂泥、那些虫子！你走到外面连两步都走不了，就会被一些难以忍受的讨厌东西袭击！我不知道母亲是怎么在这里忍受这么久的，换作是我，不到一个星期就会搬走。而且还要在这里养家糊口？] 她嗤之以鼻。看来抱怨对她来说要自然得多。[say: ……但这里是家，而且……我真的无法想象住在其他任何地方。]");
         if(hikkiDone())
         {
            outputText("[pg]她又思考了几秒钟，然后继续说道：[say:嗯，你带我去的一些地方并不完全令人讨厌。" + ((saveContent.hikkiQuest & HQCAMP) != 0 ? " 你的营地非常古朴" + ((saveContent.hikkiQuest & HQMARI) != 0 ? "，并且" : "。") : "") + ((saveContent.hikkiQuest & HQMARI) != 0 ? "" + ((saveContent.hikkiQuest & HQCAMP) != 0 ? "n" : "N") + "你那不死族朋友居住的神庙是个非常放松的圣所。" : "") + " 不过，我想我还是会留在这里。]");
         }
         doNext(doloresTalkMenu);
      }
      
      public function doloresHeadpat() : void
      {
         clearOutput();
         outputText("你决定像一个好[father]那样，向多洛雷斯表达一些关爱，还有什么比摸头更好的方式呢？");
         outputText("[pg]你向着那只冷漠的" + (get_doloresProg() < 9 ? "毛毛虫" : "蛾女") + "伸出手，坚定地将一只手" + (get_player().get_tallness() > 48 ? "放" : "举") + "到她的头上，享受了片刻她柔软丝滑的头发带来的触感。多洛雷斯只是疑惑地" + (get_player().get_tallness() > 48 ? "抬" : "低") + "头看着你，" + (get_doloresProg() > 13 ? "显然对这一切的意义仍有些怀疑" : "显然不明白这一切的意义") + "。好吧，这只意味着你必须向她展示一下。");
         outputText("[pg]你慢慢开始，进入了稳定的节奏。由于她" + (get_doloresProg() > 13 ? "挥之不去的犹豫" : "明显的经验不足") + "，她可能无法承受你的全部力量，所以你小心翼翼地不让自己太粗鲁。然而，令你惊讶的是，她似乎对你熟练的抚摸完全无动于衷。无论你在摸头时倾注了多少关爱，她那空洞的目光依然死死地盯着你，直刺你的心脏。你必须做得更好才行。");
         outputText("[pg]你加倍努力地宠溺她，充满激情地抚摸着女儿的头，但她的表情依然没有一丝改变。真是个可怕的对手。如果你想让这招奏效，就必须全力以赴。你将注意力转回这场较量，尝试了所有方法——" + (get_silly() ? "同心圆式揉搓、强烈的横向抚摸，甚至是反向三重头皮按摩" : "抚摸她的头发、用力揉搓，甚至轻轻抚摸她的脸颊") + "。你拿出了前所未有的摸头技巧。");
         outputText("[pg]失败了。你不屈不挠的女儿对你所有最好的技巧都无动于衷，她那冷漠的脸庞仿佛是用大理石雕刻而成的。你的手从" + (get_doloresProg() < 9 ? "毛毛虫" : "蛾") + "女孩的头上滑落，再也没有力气继续战斗了。当你反思自己完全无法打动女儿时，绝望充满了你的心。然而，就在你觉得不能再低落的时候，你听到面前传来一声轻笑。");
         outputText("[pg]你抬起头，还不敢抱太大希望，慢慢地抬起眼睛，惊讶地看到了女儿温柔的笑容。洞穴里昏暗的光线在淡蓝色的光芒中勾勒出她那明显愉悦的面容，如释重负的感觉几乎将你击倒。多洛雷斯轻轻叹了口气，说道：[say: " + (get_doloresProg() > 13 ? "经历了这么多，我很惊讶这么简单的举动就能让我感到如此……平静。谢谢你，[Father]。]你不知道你的胸腔怎么还能容纳下你那颗充满喜悦、跳动着的心" : "我不太确定你这么做是想达到什么目的，[Father]，但知道你愿意为了我做这一切，我很高兴。]好吧，看来你并没有完全失败") + "。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function doloresHatches() : void
      {
         clearOutput();
         doloresReset();
         outputText("你轻松地来到了西尔维娅的家，这条路对你来说已经很熟悉了。看到那诱人的洞穴入口让你感到高兴，你赶紧走了进去。西尔维娅坐在床上，读着一本因年代久远而发黄的书。她没有立刻抬起头，但她脸上的笑容告诉你她已经注意到了你的到来。你站在那里过了一会儿，就在气氛开始变得尴尬时，她啪的一声合上书，跳起来迎接你。[say: 很高兴见到你，[name]。有什么原因让你——]");
         outputText("[pg]她平常的问候突然被洞穴深处传来的一声巨响打断了。你们俩只交换了一个短暂的眼神，就冲过走廊来到多洛雷斯的卧室。当你们到达那里时，你们看到之前完好无损地立在房间中央的茧已经倒在了一边，里面有什么东西在推挤着它。");
         outputText("[pg]你和西尔维娅兴奋地看着那个摇晃的袋子" + (get_player().cor < 50 ? "还有些不安" : "") + "，渴望看到你的女儿变成了什么样。它颤抖和跳动了一段时间，表面没有明显的变化，但突然，侧面裂开了一个大口子，一个湿漉漉的身影滚了出来。");
         outputText("[pg]你冲到女儿身边，她正咳嗽着清理喉咙。等她缓过劲来，她朝你挥了挥手，你退后一步，借此机会仔细打量她身体的变化。");
         outputText("[pg]首先映入眼帘的是她背上新长出的一对翅膀。虽然它们显然还没有发育成熟，在背上显得有些下垂，但依然令人印象深刻。你现在还看不清翅膀上的图案，只能隐约辨认出灰色的轮廓。接着，你注意到了几个新的“发育”，包括她微微隆起的小乳房和变宽的臀部曲线——看来她正在向一个成熟的女人蜕变，你脸上泛起的红晕就是最好的证明。最后，你发现她的手、脚踝和脖子上长出了和她头发同色的绒毛，就像她母亲一样。");
         outputText("[pg]多洛雷斯疑惑地回望着你，然后低头注意到了自己的赤身裸体，这让她羞红了脸，连忙用手遮掩。[say:如、如果您能给我一点时间，[Father]，我想先整理一下仪容。]你道了歉，退出了房间，而西尔维娅则留下来帮多洛雷斯清理身体。");
         outputText("[pg]几分钟后，年轻的蛾娘走了出来向你问好。再次看着她，这次她穿着那件已经显得太小的裙子，你被她的优雅和端庄所震撼。成熟的身体比她童年时的模样更适合她，你为她出落得如此标致而感到由衷的自豪。她之前的尴尬似乎已经烟消云散，迈着自信的步伐向你走来。");
         outputText("[pg]西尔维娅还没回来，所以你有机会和女儿单独谈谈。[say:您好，[Father]，]蛾娘开口道，但她并没有继续说下去以维持对话。你问她感觉如何，因为她之前看起来有些头晕。[say:我很好，谢谢您的关心。虽然那段经历并不怎么愉快，但我必须说，我相当享受长大的感觉。]好吧，她还有很长的路要走，但你会让她享受这一刻的。");
         outputText("[pg]你和多洛雷斯聊了一会儿各种话题，直到西尔维娅抱着一大捆东西重新走进房间。当她飞到你身边时，你意识到那是丝绸——肯定是茧的残余物。[say:给你，]西尔维娅说。[say:这是你的了，想怎么处理都行。]" + (get_game().bog.marielle.saveContent.state > 0 ? "你确实认识一个可能处理这些东西的人——沼泽里的亡灵裁缝" : "你不知道有谁能处理这些东西，但你会留意的") + "。你" + (get_player().cor < 50 ? "向她道谢，然后" : "") + "告辞，因为你该回营地了。在你离开时，多洛雷斯出人意料地给了你一个拥抱。她很少公开表达感情，所以你高兴地回抱了她。[say:我爱您，[Father]。]你回家的路途十分愉快。");
         outputText("[pg][b:获得关键物品：蛾丝束！]");
         get_player().createKeyItem("Bundle of Moth Silk",0,0,0,0);
         saveContent.doloresProgress = 9;
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function doloresFirstTime2() : void
      {
         clearOutput();
         if(saveContent.doloresSex == 1)
         {
            saveContent.doloresSex = 3;
         }
         else
         {
            saveContent.doloresSex = 4;
         }
         outputText("没有多想，你将舌头探入她的深处。多洛雷斯立刻发出一声轻呼，她的大腿条件反射般地夹紧了你的头部两侧。她现在太紧张了，你没法有太多动作，所以你慢慢按摩她的腿，直到她放松下来，你终于可以开始了。");
         outputText("[pg]除此之外别无他物。当你吸吮着女儿的淫液时，你觉得世界上没有任何东西能比得上这种甜美的味道。多洛雷斯在你上方呻吟着、扭动着，偶尔在你那肆意的舔弄让她受到过度刺激时夹紧双腿。这简直是天堂般的享受，但你感觉到她" + (doloresComforted() ? "还" : "") + "没有乐在其中，所以你退了回来，尽管这对你来说可能很痛苦，然后你上床陪在她身边。");
         outputText("[pg]你现在能看到一滴眼泪顺着她的脸颊滑落，但你迅速将其擦去，然后紧紧抱住她，给予她所需的[paternal]安慰。你的女儿在你的怀里慢慢安静下来，被你的温暖所安抚。");
         if(doloresComforted())
         {
            outputText("[pg][say:我……我没事，你可以……你可以继续。]虽然这话听起来不是很有说服力，但她随后微微一笑，于是你继续动作，手指顺着她迷人的小腹蜿蜒而下。当手指到达目标时，你惊讶地发现，除了你留下的痕迹外，那里正蔓延着一片湿润。看来尽管她充满不确定，但她自己也有些兴奋了。");
         }
         else
         {
            outputText("[pg]你很惊讶她躺在那里是如此温顺，就像个洋娃娃一样。看来她愿意让你对她做任何你想做的事，于是你高兴地继续，手指顺着她迷人的小腹蜿蜒而下。当手指到达目标时，你失望地发现她那里几乎是干的，除了你留下的一点唾液。显然，你需要再努力一点。");
         }
         outputText("[pg]你心中的渴望不断升腾，于是你挪动身体，压在她的上方。这样一来，当她的[father]把玩她的身体时，你能看到她每一个反应，她可爱脸庞的每一次抽动。你尽情地把玩着，手指沿着她初具规模的乳房、纤细的肩膀和微微隆起的臀部游走。但这些都不是你[i:真正]想触摸的地方，于是你再次向下探去。当你触碰到她时，多洛雷斯发出了一声惊呼，但随着你开始动作，她很快就发出了更淫荡的娇喘。然而，你仍然没有得到你最渴望的东西——她的抚摸。看来你需要教教她该如何做爱了。");
         outputText("[pg]你把她的手按在你等待着的下体上。她" + (doloresComforted() ? "紧张地轻笑" : "退缩了一下") + "，但还是顺从了，她生涩的手指挑逗着你准备就绪的入口。你开始给女儿指导，告诉她所有最重要的部位和技巧，同时在她自己的身体上进行示范。在这种分心的情况下，她学得有些慢，但随着你的继续，她的手指最终开始恰到好处地取悦你，没过多久，你就和她一样气喘吁吁了。");
         outputText("[pg]出乎意料的是，你的女儿在你身下绷紧了身体，眼睛睁得大大的，这很可能是她的第一次高潮。你亲吻并抚摸着她，让她感受到你全部的爱。当她意识到自己紧紧抓着你的肩膀时，她尴尬地松开了手，尽管当你凝视她的眼睛时，她并没有移开视线。在羞涩之外，你感觉到了一些" + (doloresComforted() ? "兴奋，对你向她展示的这个全新世界的惊叹" : "空虚，仿佛她又缩回了自己的世界") + "。");
         outputText("[pg]好吧，这可不是停下来的好时候，所以在" + (doloresComforted() ? "确认可以继续" : "重新摆好姿势") + "之后，你又开始了。然而，这一次你不再那么克制，自由地与你可爱的女儿分享你的激情。你热情的喘息声很快充满了房间，令人惊喜的是，多洛雷斯开始在不需要你吩咐的情况下回应你。她那几丁质的手指，光滑而冰冷，滑入你的体内，开始探索你的深处，让快感传遍你的全身。");
         outputText("[pg]" + (doloresComforted() ? "你女儿的一只空闲的手试探性地伸向你，但在到达目的地之前停住了。" : "你女儿的双手无力地垂在身侧，似乎没有想要触碰你的欲望。") + " 为了弥补这一点，你倾身贴向她，双手开始在她的身体上游走，同时搂住她的脖子。你的[breasts]紧贴着她的，多洛雷斯似乎" + (doloresComforted() ? "尴尬地对" + (get_player().biggestTitSize() > 1 ? "你更成熟的资本" : "与她如此相似的胸部") + "感兴趣" : "对此感到有些不舒服，但她没有抱怨") + "。");
         outputText("[pg]这种刺激对你来说太强烈了，你能感觉到自己快要到了。她柔软的皮肤，被汗水浸湿，贴着[if (isfluffy) {你的[skindesc]|你的肌肤}]的感觉，以及她沉重的呼吸声，都在催促着你，让你在她奇妙的手上磨蹭着臀部。多洛雷斯似乎也受到了同样的影响，所以你加倍努力，尽你最大的努力让她也达到高潮，直到伴随着一声双重娇呼，你们都达到了顶峰。");
         outputText("[pg]你浑身颤抖，视线几乎模糊，但看着你的女儿在你身下扭动呻吟，你感到一种压倒性的感激，感激你能与她分享这一切。");
         outputText("[pg]你们并排躺着，大口喘着粗气。你的双手继续抚摸着她的身体，但多洛雷斯似乎被她的第二次高潮完全淹没了，什么也没说，几乎一动不动。你问她感觉如何。");
         outputText("[pg]过了好一会儿她才回答。" + (doloresComforted() ? "[say: 我，嗯……我从没想过两个……那真是……我简直不知道该说什么。]" : "她看着你，眼睛湿润，但除了一个[say: 我……]之外，似乎什么也说不出来。") + " 没关系，她不需要说什么。你紧紧地抱着她，你们就这样待了一段时间。");
         outputText("[pg]当终于到了该起床的时候，你很舍不得离开她的温暖，但你别无选择。你听到身后传来，[say: 我爱你，[father]，]转过身看到多洛雷斯露出了一个" + (doloresComforted() ? "颤抖的" : "勉强的") + "微笑。你回以微笑，然后离开，你回营地的旅程非常愉快。");
         if(!doloresComforted())
         {
            dynStats(DynStat.Cor(5));
         }
         get_player().orgasm("Vaginal");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function doloresFirstTime() : void
      {
         clearOutput();
         outputText("看着你的女儿，你被她青春的美貌所震撼，随之而来的是将这份美丽据为己有的强烈欲望。你想在她青春的花季采摘她的花蕾，向她展示你确信她连做梦都未曾想过的快乐。多洛雷斯不确定地看着你，很明显她不知道在这种情况下该如何表现。好吧，作为她的[father]，你只能亲自示范给她看了。");
         outputText("[pg]你向她[if (singleleg) {稍微挪动了一下|迈出了一步}]，她立刻有了反应。她红着脸，看向一旁，将四只手臂交叉在胸前，显然连看你的勇气都没有。你迅速[if (isnaked) {准备好自己|开始脱衣服}]，多洛雷斯的目光变得更加专注，尽管她似乎暂时还保持着镇定。");
         if(saveContent.doloresSex == 2)
         {
            outputText("[pg]然而，当你靠近她时，她突然变得慌乱起来，不断后退，直到双腿撞到床沿。你[if (singleleg) {紧紧跟着她|步步紧逼}]，不给她留任何余地。[say: 我不太确定我……对，好吧，没问题。] 她点点头，似乎在试图说服自己什么，但你能看出这并没有什么用。");
         }
         else
         {
            outputText("[pg]多洛雷斯的眼中带着某种你无法完全辨认的情绪，她的嘴唇微微颤抖着。[say: 我不……] 她没有说完，而是顺从地低下头，两只手臂抱在胸前。你大步走到她面前，轻轻将她向后推，直到她的双腿撞到床沿，迫使她坐下。");
         }
         outputText("[pg]你居高临下地笼罩着她，迫使她向后仰倒在床上，双眼睁得大大的。但你并不想吓到她，也不想进展得太快让她感到不适，所以暂时，你只是抚摸她的侧腰，明确表达你的情欲。");
         outputText("[pg]" + (doloresComforted() ? "[say: 你怎么，呃，我们……你没有——] 你用一个热烈的吻打断了她，让她惊讶地张嘴喘息，让你趁机而入。" : "你的女儿似乎不想动弹，甚至不想说话，所以你将她拉入一个热烈的吻中，她温顺地接受了。") + " 你的舌头探入她的口中，尽管她似乎不愿回应你的爱意。当你退开时，你可以看到她的脸涨得通红，你几乎无法克制自己不去狠狠地占有她。");
         outputText("[pg]你凑近闻了闻这只年轻的蛾女。那味道几乎无法形容——像是柔和的夏日微风，还带着一丝香草的气息。你满怀期待地舔了舔嘴唇。但不行，现在还不行，你需要先照顾你那瑟瑟发抖的女儿。她显然对未知感到害怕，但你在这里是为了向她展示这有多么美妙。你温柔地抚摸她，感受着她那娇嫩的身体，手慢慢向下游走。然而，她的手阻挡了你，不让你脱下她的衣服。看来她现在还太害羞了，不过这样也行。");
         outputText("[pg]她紧紧抓着自己的裙子，你不会在这方面强迫她，[if (cor > 50) {不管你有多想，}]但她的内裤却毫无防备，所以你在她反应过来之前一把扯下，顺着她柔软的双腿拉到脚踝处。多洛雷斯倒吸一口凉气，坐了起来，但当你的[hands]滑过她光滑的肌肤停在她膝盖上时，她一动不动。然后你看到了，她那年轻、未经人事的缝隙。它隐藏在她大腿阴凉的阴影中，被裙子稍微遮挡，但你很快就解决了这个问题，把裙子撩起，足以看清她的全貌。当你弯下腰时，你感到自己是如此幸运，你的呼吸让多洛雷斯不禁颤抖起来。");
         outputText("[pg]你的嘴悬停在她那等待着的阴唇上方，在房间昏暗的光线下，它们微微闪烁着水光，你几乎无法抑制自己的饥渴。多洛雷斯没有任何阻止你的举动。你确定要继续吗？");
         doYesNo(doloresFirstTime2,doloresDeflorationNo);
      }
      
      public function doloresDeflorationYes() : void
      {
         clearOutput();
         if(saveContent.doloresSex == 1)
         {
            saveContent.doloresSex = 3;
         }
         else
         {
            saveContent.doloresSex = 4;
         }
         outputText("无法再抑制哪怕一刻的激情，你冲了进去。你的第一下抽插是疯狂的，" + (doloresComforted() ? "稍微" : "") + "有些急切，当多洛雷斯的处女膜被撕裂时，她发出了一声痛苦的叫喊。你" + (get_player().cor < 50 ? "道歉并" : "") + "放慢了速度，然后继续。她娇小的身躯让她变得极其紧致，你很难让自己进入一个稳定的节奏，但大约一分钟后，她终于似乎放松了一点，并适应了你。你现在可以毫不费力地在她体内进出，但涂抹在你阴茎上的液体的微红色以及你女儿偶尔发出的不适喘息声清楚地表明，她仍然没有享受这一切" + (doloresComforted() ? " 呢" : "") + "。");
         outputText("[pg]一滴眼泪顺着她的脸颊流下，你迅速将其擦去。你想抱住你的女儿，向她展示这有多么美好，所以你在让手向下滑动之前，最后揉了揉她的脸颊。你温柔地按摩她青春期的身体，特别关注她含苞待放的乳房。再往下探，你发现她躯干与臀部融合时的柔软曲线绝对是绝妙的，有一瞬间几乎让你忘记了移动。");
         outputText("[pg]但你没有。你继续以放松的节奏在她体内抽插——比你希望的要慢得多，但对于你女儿的第一次来说刚刚好。你所有的努力似乎最终都得到了回报，因为多洛雷斯的呼吸开始加快，她早些时候的痛苦已经减轻到足以让她" + (doloresComforted() ? "终于发出愉悦的叹息" : "不再退缩") + "，每次你将你的长度沉入她幸福的褶皱中时。");
         outputText("[pg]你需要更靠近她，需要感觉到她的身体紧贴着你，所以你俯下身，将手臂勾在她的背后，抓住她柔软的臀部。像这样，她小巧的胸部直接压迫着你，让你能够享受她的每一寸肌肤。你把嘴移向她的嘴，渴望她的味道。它和一切一样完美。" + (doloresComforted() ? "当你继续你肉欲的拥抱时，多洛雷斯的四只手臂试探性地环绕着你的背部来回报你的爱意。" : "") + "浮出水面呼吸空气，你只是让你的脸颊贴着她的脸颊，享受着她皮肤的凉爽感觉，同时你以新姿势赋予的力量在她体内耕耘。");
         outputText("[pg]想要看清你女儿全貌的渴望压倒了你，所以你抬起你的躯干来欣赏她。她涨红的脸，她小巧的身体，当你拍打她时她发出的可爱声音，这一切都太多了。也许比你应得的还要多，但你还是会接受它。你把手指深深地陷入她娇小的臀部，并[b:把]它们拉向你的臀部，" + (get_player().longestCockLength() > 10 ? "虽然你不太能够到它们" : "将她紧紧地贴在你身上") + "。你翻滚的精液从你体内喷发而出，以浓稠的绳索射入她扭动的深处，这是你[paternal]爱的证明。她紧致、处女般的内壁紧紧地依附着你，当你在她体内跳动时，按摩着你长度的每一寸。令人陶醉、天堂般的快感持续的时间比平时更长，你继续将你的骨盆磨向她，直到结束。");
         outputText("[pg]当你终于平静下来时，你的手指松开了对多洛雷斯的铁腕抓握，留下了白色的印记，作为你激情的持久印记。你向前瘫倒，在向你的女儿展示了如此多的爱意之后完全筋疲力尽。她的床" + (get_player().get_tallness() > 60 ? "对你来说有点小，但你还是设法" : "对你来说尺寸正好，所以你很容易就设法") + "依偎在多洛雷斯身边，轻轻地抚摸着她的头发，把你心爱的女儿抱在怀里。");
         outputText("[pg]你无法判断她是否也高潮了，所以你问她。作为回应，她只是稍微扭动了一下，没有与你对视。[say:" + (doloresComforted() ? "我……不确定" : "我……不这么认为") + "。]你的手滑向她漏液的下体。她发出一声颤抖的呻吟，然后说，[say:不-不，那……那挺好的。" + (doloresComforted() ? "我……也很享受，但是……这对我来说已经足够了，目前来说……" : "你……我很感激，[Father]，但你不需要做更多了。") + "]你问她是否确定。[say:我确定。]");
         outputText("[pg]你花了好几分钟才完全恢复过来，当你恢复后，你绕过多洛雷斯，从床上爬了起来。她依然躺在那里，脸上带着一种难以名状的情绪。[say: 我爱你，[Father]，]她说道，声音微微发颤。你同样回应了她，然后转身离开，胸中那份满足感让你回营地的路途都变得明快起来。");
         if(!doloresComforted())
         {
            dynStats(DynStat.Cor(5));
         }
         get_player().orgasm("Dick");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function doloresDeflorationNo() : void
      {
         clearOutput();
         outputText("看着你瑟瑟发抖的女儿，你对这一切都不再确定了。也许她还没准备好，也许你只能等待一个更好的时机，但无论如何，你都不打算继续下去了。你退了回来，从多洛雷斯的床上站起身，然后" + (!get_player().isNaked() ? "重新穿上你的[armor]" : "平复自己的情绪") + "。多洛雷斯只是看起来很困惑，还不敢动弹。你向她道歉，并说你现在要停下来了。");
         outputText("[pg]她点了点头，眼中流露出一丝宽慰，然后重新拉起内裤，换成坐姿。你在她的额头上印下一吻，并给了她一个短暂的拥抱，谢天谢地，她高兴地回抱了你。你告诉她你爱她，当她回应时，她的声音比之前少了几分颤抖，[say: 我……我也爱你，[Father]。" + (doloresComforted() ? "我们可以……下次再试。" : "") + "]你以另一个吻作为告别，这次是落在她的脸颊上，然后你转身走出了洞穴。");
         outputText("[pg]走回营地的路很长，让你有充足的时间反思自己的行为。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function doloresDefloration() : void
      {
         clearOutput();
         outputText("你的女儿纯洁、未被触碰、缺乏经验，尽管她经常表现出“成熟”。她需要有人来引导她。还有谁比她的[father]更适合成为她的第一个男人呢？你可以照顾她，可以确保没有人伤害她，而且就这一点而言，你对她的爱远超任何人的可能。你握住她颤抖的手，把她引到床边，" + (get_player().isNaked() ? "" : "脱下你的盔甲，然后") + "坐在她旁边。");
         outputText("[pg]你告诉多洛雷斯你爱她，她含糊地回应了一句，双手在腿上抓紧了裙子，眼睛死死地盯着她悬空的脚。");
         outputText("[pg]她显然不知道该怎么做，所以你必须向她展示。你试探性地拉扯着那件紫色的衣服——这是你和你的爱人之间唯一的障碍——但年轻的蛾女却躲开了你，显然对这件事还是有些尴尬。没关系，你可以按照她需要的速度慢慢来。你向多洛雷斯挪近了一些，一只手环绕着她，另一只手托起她的下巴，让她的脸转向你。");
         outputText("[pg]她睁大了眼睛，呼吸急促。你凑上前去，从她甜美、青春期的嘴唇上偷走了一个吻。但这还不够，所以你的手从她的下巴滑落，向下，再向下，越过她发育不全的乳房微微隆起的地方，穿过她平坦的腹部，最后，它停在她的腿上，距离你真正想要的地方只有几英寸的距离，这几英寸令人痛苦。你结束了亲吻，睁开眼睛，发现" + (doloresComforted() ? "多洛雷斯也在做同样的事" : "多洛雷斯根本没有闭上眼睛") + "。");
         outputText("[pg]你指示你的女儿躺在她的床上，她照做了。年轻的蛾女似乎不知道她的手该放在哪里，结果，它们不安地动来动去。看起来她对你早些时候试图脱掉她的裙子不太满意，所以你没有再尝试，而是简单地将手指滑到裙摆上，然后观察她的脸部反应。" + (doloresComforted() ? "她给了你一个微小、令人安心的点头" : "没有任何反应") + "。你继续，缓慢地，小心翼翼地把她的裙子拉到她迷人的臀部。她穿着内裤。它们很朴素，是由蕾丝制成的，虽然它们很可爱，但它们现在挡住了你的路，所以你把它们从她匀称的腿上拉了下来。");
         outputText("[pg]最后，它暴露在你面前——你女儿的缝隙。它非常整洁，上面刚刚开始长出一小撮毛发。你把手放在她丰满年轻的大腿上，把鼻子凑过去闻了闻，当你这样做的时候，你被震撼了。它令人陶醉。以至于你无法克制自己去品尝。当你的舌头接触到她时，多洛雷斯发出了一声轻柔的叫声，显然对这种陌生的感觉毫无准备。她甚至还没有这样探索过自己吗？你很可能是第一个品尝、感受、体验她身体这一部分的人。");
         outputText("[pg]你不知道你还能等多久。她不是很湿，但这对于她的第一次来说是意料之中的，所以你只能凑合着来。你确信你的激情足以让她度过一段美好的时光。在心理上为即将到来的快感做好准备后，你把手伸向你已经僵硬的阴茎。多洛雷斯紧张地瞥了一眼你的[cock]，也许是在担心" + (get_player().longestCockLength() > 12 ? "你的尺寸" : "她的经验不足") + "。你把自己置于她面前，把你的阴茎直接移到她处女的花朵上，用你的预先分泌液涂抹她年轻的嘴唇。");
         outputText("[pg]你抽动的阴茎头部停留在她的入口处，你每次的跳动都会通过你颤抖的女儿传递出一丝震颤，因为你如此轻柔地压迫着她。多洛雷斯没有做出任何阻止你的动作。你确定你要继续吗？");
         doYesNo(doloresDeflorationYes,doloresDeflorationNo);
      }
      
      public function doloresConcerns2(param1:int) : void
      {
         switch(param1)
         {
            case 0:
               outputText("[pg]你告诉女儿这没什么大不了的，她不应该再为此担心。即使是你有时也会犯错，但过于关注过去只会让事情变得更糟。");
               outputText("[pg]多洛雷斯盯着面前的地面看了很久，显然陷入了沉思。最终，她抬起头，眼中闪过一丝释然。[say: 谢谢你，[Father]。这……让我对这一切感觉好多了。]");
               break;
            case 1:
               outputText("[pg]你告诉女儿，她必须考虑个人责任。错误在所难免，但必须承认错误，并尽一切努力去弥补。这才是正确的做法。");
               outputText("[pg]多洛雷斯盯着面前的地面看了很久，显然陷入了沉思。最终，她抬起头，眼中闪烁着新的决心。[say: 是的。我会……弥补这一切的。]");
               break;
            case 2:
               outputText("[pg]你告诉女儿，把时间浪费在下位者的想法上纯粹是自找麻烦，你大可以随心所欲，管它什么后果。你从不觉得有任何理由要为你一路上留下的每一根断骨卑躬屈膝、畏首畏尾。");
               outputText("[pg]多洛雷斯盯着面前的地面看了很久，显然陷入了沉思。最终，她抬起头，眼中闪烁着新的决心。[say: 你说得对。我……不该担心那些平庸之辈对我的行为有何看法，只要我最终是正确的就行。谢谢你，[Father]。]");
               dynStats(DynStat.Cor(1));
               break;
            case 3:
               outputText("[pg]你只是耸了耸肩，因为你在这里确实没有什么明智的建议可以提供。");
               outputText("[pg]多洛雷斯盯着面前的地面看了很久，显然陷入了沉思。最终，她歪了歪头，眼中闪烁着新的决心。[say: 没错，我……需要自己去寻找这些答案。谢谢你让我明白这一点，[Father]。]");
         }
         outputText("[pg]她背上微微一颤，随后姿势恢复正常，神情也再次变得柔和。[say: 那么，我能为你做些什么？]");
         outputText("[pg]她似乎已经从困扰她的任何疑虑中恢复过来，但你忍不住注意到这个蛾女时不时紧张地瞥向" + (saveContent.doloresDecision == 1 ? "那本书" : "远墙边的一些抽屉") + "。");
         doNext(doloresMenu);
      }
      
      public function doloresConcerns() : void
      {
         var choice3:int;
         var _g3:DoloresScene;
         var choice2:int;
         var _g2:DoloresScene;
         var choice1:int;
         var _g1:DoloresScene;
         var choice:int;
         var _g:DoloresScene;
         clearOutput();
         doloresReset();
         outputText("你走近多洛雷斯，试图像往常一样和她聊天，但她似乎有些心不在焉，只是漫不经心地连连点头作为回应。她的目光一次又一次地游移到她的书桌上，" + (saveContent.doloresDecision == 1 ? "上面放着一本布满灰尘的旧书，你认出那就是她那天晚上偷走的那本" : "书桌上空空如也，平时堆放的各种书籍和纸片都被清理干净了") + "。");
         outputText("[pg]你正琢磨着怎么才能引起她的注意，终于，她似乎觉得是时候开口了，突然问道：[say: 当你犯了错误时，你应该怎么做？]");
         outputText("[pg]这话问得有些隐晦，但她看起来却异常严肃。她犯了什么错吗？");
         outputText("[pg][say: ……是的。当我逃跑的时候，我……]她说着，声音渐渐低了下去。");
         outputText("[pg]那已经是有一段时间的事了，所以现在突然感到懊悔有些奇怪，但她看起来似乎在期待你给出某种答案。你要对她说什么？");
         saveContent.doloresProgress = 11;
         menu();
         _g = this;
         choice = 0;
         addNextButton("没关系",function():void
         {
            _g.doloresConcerns2(choice);
         }).hint("谁都会犯错，没必要为此自责。");
         _g1 = this;
         choice1 = 1;
         addNextButton("道歉",function():void
         {
            _g1.doloresConcerns2(choice1);
         }).hint("承认自己的错误并尽力弥补，这很重要。");
         _g2 = this;
         choice2 = 2;
         addNextButton("何必在意",function():void
         {
            _g2.doloresConcerns2(choice2);
         }).hint("管别人怎么想呢？");
         _g3 = this;
         choice3 = 3;
         addNextButton("耸肩",function():void
         {
            _g3.doloresConcerns2(choice3);
         }).hint("你并没有所有的答案。");
      }
      
      public function doloresComforted() : Boolean
      {
         return int(saveContent.doloresSex % 2) == 0;
      }
      
      public function doloresComfort() : void
      {
         clearOutput();
         outputText("她真的准备好了吗？你不想伤害她……而且她不应该仅仅因为你想要她，就感到有压力去做这件事。她的嘴唇抽动了一下。她花了一点时间，似乎从内心深处汲取了力量，然后开始说话。[say:我……是的。我准备好了。这……我爱你，[Father]，我知道我对你有多重要。我知道你是在向我展示你的爱。这只是……有点吓人。我觉得自己完全不知所措。]她微微一笑。[say:我总是需要感觉到一切都在我的掌控之中，我需要知道我应该知道的一切，但对于这个……对我来说，它仍然是一个谜。]");
         outputText("[pg]在那段异常漫长的讲话之后——至少对她来说是这样——她再次让你感到惊讶，她出乎意料地向前倾身，在你的嘴唇上留下了一个短暂得令人心痛的吻。你的双手因渴望而抽动。她向后退去，叹了口气，再次微笑，这次笑得更灿烂了些。[say:你可以……继续了。只是请温柔一点。]");
         outputText("[pg]你会的，你再次强调，如果她感到不舒服或者不想让你做某事，她应该告诉你，作为回应，她对你轻轻地点了点头。");
         saveContent.doloresSex = 2;
         doNext(doloresSexMenu);
      }
      
      public function doloresCocoon2(param1:int) : void
      {
         var _g:SylviaScene;
         if(param1 == 0)
         {
            outputText("[pg]你告诉西尔维娅你明白她想说什么，而且你也有同感。和她一起建立这个家庭对你来说意义重大" + (get_player().hasChildren() ? "即使你已经有了一个" : "") + "，你拿什么都不换。随着你的每一句话，西尔维娅的笑容越来越大，当你说完时，她把身体紧贴着你，似乎想钻进你的身体里。");
         }
         else
         {
            outputText("[pg]这很让人受宠若惊，但你对她并没有像她对你那样痴迷。" + (get_player().hasChildren() || get_camp().loversCount() > 1 ? "毕竟，你在营地还有其他爱人等着你。" : "") + "不想冒犯这位迷恋你的飞蛾，你在这个话题上兜圈子，但始终没有对她的表白给出一个确切的答案。她似乎没有注意到你的沉默，依然像以前一样充满爱意地抱着你的手臂。");
         }
         outputText("[pg]你和她在那儿又站了一会儿，最后看了一眼茧，然后西尔维娅拉着你的手臂，带你回到主房间。你们俩坐下，她问你：[say: 那么，你在这里的时候有什么想做的事吗？]");
         _g = get_sylviaScene();
         doNext(function():void
         {
            _g.sylviaMenu();
         });
      }
      
      public function doloresCocoon() : void
      {
         var answer1:int;
         var _g1:DoloresScene;
         var answer:int;
         var _g:DoloresScene;
         clearOutput();
         doloresReset();
         outputText("你一踏进洞穴，西尔维娅就立刻扑了上来，她兴奋的喋喋不休几乎让人听不懂。[say: 哦，[name]，自从你上次来之后发生了好多事！快，快，来看看！]她拉着你的手臂穿过她的家，走进多洛雷斯的卧室。你立刻发现了她兴奋的原因——一个巨大的白色包裹占据了房间的大部分空间。仔细一看，你发现它似乎是由细细的丝线紧紧缠绕成的一个卵形团块。");
         outputText("[pg][say: 是不是很可爱？我从没想过我能帮忙做出这么美丽的东西。谢谢你和我一起创造了她。]说到最后，她依偎在你的手臂上，用她的四只手紧紧抓住。你们俩只是站在那里，盯着茧看了一会儿，消化着这一切。");
         outputText("[pg]过了一会儿，西尔维娅轻轻叹了口气，然后继续她刚才的想法。[say: 这真的很不可思议。曾经有一段时间……在我母亲去世后……我以为我可能是我们这一族中最后一个了，永远。能和你分享这个……你永远不会知道这对我来说意味着什么。]她转头看着你，紫色的眼睛燃烧着意想不到的强烈情感。[say: <b>永远。</b>]");
         saveContent.doloresProgress = 8;
         menu();
         _g = this;
         answer = 0;
         addNextButton("回应",function():void
         {
            _g.doloresCocoon2(answer);
         }).hint("告诉她你也有同感。");
         _g1 = this;
         answer1 = 1;
         addNextButton("敷衍",function():void
         {
            _g1.doloresCocoon2(answer1);
         }).hint("你对她没有那么强烈的感情。");
      }
      
      public function doloresBlowjob() : void
      {
         clearOutput();
         outputText("你[walk]过去，在开始你那下流请求的开场白之前，快速地亲了多洛雷斯一下。" + (!saveContent.doloresBlowjob ? "你不太确定她会作何反应，因为她通常是一个相当被动的伴侣，所以你" : "你") + "想确保她" + (doloresComforted() ? "乐意给" : "愿意给") + "你口交。当你说完时，你的女儿似乎感到非常尴尬。");
         if(!saveContent.doloresBlowjob)
         {
            outputText("[pg][say:我……我不知道。我从来没有……]她脸红了。[say:我想我可以试试……为了你。]");
         }
         else if(doloresComforted())
         {
            outputText("[pg][say:嗯……我想是的。只是有点……]她没有说完，而是涨红了脸。");
         }
         else
         {
            outputText("[pg][say:好吧，]她说着，眼神空洞地站起来为你服务。");
         }
         outputText("[pg]你亲了她一下，然后把她带到椅子旁" + (!get_player().isNaked() ? "并开始脱衣服。当你的[armor]慢慢脱下时，" : "。") + "多洛雷斯似乎想看任何地方，就是不看你，她的手在裙子上摸索着。" + (!get_player().isNaked() ? "现在准备好接受她的爱意了，你" : "你") + "坐下来呼唤她。这个暗褐色的蛾女紧张地挪过来，开始蹲下身子，她的眼睛一直盯着你的[cock]。");
         outputText("[pg]最后，她跪在你那跳动的肉棒前。她的脸凑近了，" + (doloresComforted() ? "带着些许不确定地仔细端详着它" : "尽管她呆滞的眼神表明她现在心不在焉") + "。你能感觉到她的呼吸在给你挠痒痒，而且" + (get_player().cor > 50 ? "你现在最想做的就是抓住她的头，把它按到你的胯部" : "这种感觉几乎让人无法忍受") + "，但你暂时克制住了自己。");
         outputText("[pg]终于，她把手移上来抓住根部，终于给了你渴望已久的接触，但没有做更多。她带着疑问的眼神抬头看着你，所以你" + (doloresComforted() ? "安抚她" : "指示她继续") + "。她咽了口唾沫，开始动作，极其轻柔地抚摸着你。看来你得忍受这个，直到她鼓起勇气继续下去。");
         outputText("[pg]最后，她那灵活的舌头刚刚探出嘴外，在你的龟头上轻轻舔舐。你因为这突如其来的接触而颤抖，但值得庆幸的是她继续了下去，开始带着些许犹豫地舔舐你的龟头。舔了几分钟后，多洛雷斯似乎终于鼓起了勇气，她漂亮的嘴唇滑过你，让你的心因为期待而怦怦直跳。");
         outputText("[pg]" + (get_player().longestCockLength() > 4 ? "她年轻的小嘴太小了，无法完全吞下你，但她尽了最大努力，努力地含住最前面的几英寸。" : "她年轻的小嘴轻松地包裹住了你小肉棒的" + (get_player().longestCockLength() > 2 ? "前几英寸" : "全部") + "。") + " 看来她无法坚持太久，很快伴随着一声湿润的“啵”声将你从她嘴里拔出，并大口喘着粗气。你轻轻揉了揉她的头，让她知道她做得很好，而她则以" + (doloresComforted() ? "慌乱的微笑" : "茫然的凝视") + "作为回应。");
         outputText("[pg]虽然缺乏经验，但年轻的蛾女似乎明白还需要做些什么，所以她开始" + (doloresComforted() ? "充满爱意地" : "机械地") + "舔你的[cock]，用她长长的舌头完全包裹住你。一旦她的唾液充分涂抹，她就再次潜入，但这一次，她的两只手开始配合着套弄你的肉棒。");
         outputText("[pg]她显然没有技巧，但她用积极的态度弥补了经验的不足，她用力地套弄着你的肉棒。" + (doloresComforted() ? "似乎她早先的羞涩都在这激情的时刻消失了" : "尽管她表现得很热情，但你注意到她脸上明显缺乏情感") + "，但你没有时间去想这些了，你女儿令人愉悦的服务需要你的全神贯注。");
         outputText("[pg]她柔软的小舌头在你的龟头上上下舔弄，让美妙的酥麻感顺着你的脊椎攀升。[if (hasballs) {她空出的一只手试探性地移向你的[balls]，起初还有些不确定地抚摸着，但随着你呻吟声的增大，她的动作变得更加自信。与此同时，她|她}]开始在充足润滑的帮助下，握着你的肉棒扭动起来。" + (!saveContent.doloresBlowjob ? "看来她是在边做边学。" : ""));
         outputText("[pg]你快要到了，但还想再享受一会儿，所以你尽量忍耐。然而，当多洛雷斯抬头看向你，她那美丽的紫罗兰色眼眸与你对视时，你所有的自控力都化为乌有，直接被推向了高潮的边缘。");
         outputText("[pg]当你的肉棒开始跳动时，她试图把龟头留在嘴里，但仅仅射了几股之后，她就呛得把头往后缩，正好退到了射程之内。多洛雷斯紧闭双眼，承受着溅在她可爱脸蛋上的" + (get_player().cumQ() > 500 ? "倾盆精雨" : "点滴精液") + "。她的两只手移过来接住溢出的精液，而另外两只手则继续陪伴着你，直到你的肉棒射出最后几发。");
         if(doloresComforted())
         {
            outputText("[pg]当她意识到你终于结束时，你的女儿神情纠结了一会儿，然后咕咚一声咽了下去。[say: 我……希望你喜欢。]你告诉她你有多享受，但这似乎并没有缓解她的尴尬。");
         }
         else
         {
            outputText("[pg]她似乎没有意识到你已经射完了，仍然在轻轻抚摸你的[cock]，甚至让你感到有些轻微的刺痛，于是你伸手阻止了她。[say: 噢。刚……刚才舒服吗？]你告诉她刚才有多棒，她点了点头。");
         }
         outputText("年轻的蛾女从地上站起身，在你面前站了一会儿，看起来有些困惑，然后说道，[say: 我……得去清理一下。]");
         outputText("[pg]你感谢她的服侍，在她头上没弄脏的地方飞快地亲了一下，然后走出了洞穴。");
         get_player().orgasm("Dick");
         saveContent.doloresBlowjob = true;
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function doloresAppearance() : void
      {
         clearOutput();
         if(get_doloresProg() == 2)
         {
            outputText("躺在你面前婴儿床里的是一只小小的毛毛虫婴儿——你的女儿，多洛雷斯。她看起来大部分像人类，唯一的主要区别是多出的一对手臂和从额头伸出的两根触角。她略带分节的身体呈深灰色，边缘发黑，但她的眼睛和她母亲一样是紫罗兰色的。她目前被包裹在浅紫色的襁褓中，大概是西尔维娅做的。当你低头看她时，她用冷漠的眼神注视着你，作为一个婴儿，她发出的声音出奇地小。" + (get_player().cor > 80 && get_silly() ? "你发现自己产生了一些特别邪恶的想法。" : ""));
         }
         else if(get_doloresProg() < 7)
         {
            outputText("你的毛毛虫女儿多洛雷斯开始长大了，现在看起来大约有" + (get_doloresProg() < 5 ? (get_metric() ? "122厘米" : "四英尺") : (get_metric() ? "140厘米" : "4英尺7英寸")) + "高。她看起来就像一个正常的人类孩子，但她的四只手臂和暗淡的肤色清楚地表明她绝非寻常。她的身体保留了出生时略带毛毛虫般的分节，尽管现在大部分被她穿的浅紫色连衣裙遮住了。她纤细的四肢和娇小的身躯赋予了她一种孩子般的气息，这与她眼中冰冷、惊人成熟的眼神完全不符，而这种眼神又被她头上垂下的黑色乱发稍微遮挡住了。");
         }
         else if(get_doloresProg() < 9)
         {
            outputText("你的女儿目前被包裹在她房间中央的一个巨大的丝质茧里。考虑到你女儿的身高，它比你想象的要高得多，但你不是鳞翅目昆虫专家。" + (get_doloresTime() < 96 ? "它毛茸茸的外表看起来非常柔软，让你几乎想抱抱它，但在她还在里面的时候对它太粗暴可能不是个好主意。" : "它以前毛茸茸的外表自从第一次形成以来已经变硬了一些。这是否意味着多洛雷斯很快就会破茧而出？") + " 无论如何，看来你还得再等一会儿才能再次见到你的女儿。");
         }
         else
         {
            outputText("你的女儿多洛雷斯身高大约 " + (get_metric() ? "150厘米" : "五英尺") + "，身材相当娇小。在浅紫色的连衣裙下，她的乳房只有轻微的隆起，但她的身材却有着迷人的女性魅力——她的臀部刚刚开始变宽，纤细的四肢仍然保留着青春的美丽。她的背后挂着两只" + (get_doloresProg() > 9 ? "闪亮的" : "有些下垂的") + "灰色翅膀，目前正折叠着。她第二大显著特征是身体两侧长出的额外一对胳膊，目前正抱着一本旧书。她留着一头黑色短发，被额头上长出的两根触角分开，脖子和关节处也有相匹配的毛茸茸的绒毛。");
         }
         doNext(doloresMenu);
      }
      
      public function doloresAmbitionChat() : void
      {
         var choice4:int;
         var _g4:DoloresScene;
         var choice3:int;
         var _g3:DoloresScene;
         var choice2:int;
         var _g2:DoloresScene;
         var choice1:int;
         var _g1:DoloresScene;
         var choice:int;
         var _g:DoloresScene;
         clearOutput();
         outputText("你问多洛雷斯她以后想做什么。毕竟，她总不能一辈子都憋在这个洞穴里看书吧？");
         outputText("[pg]她对这个问题显得有些恼火。[say: 你是在暗示我的生活方式有什么不好吗？在这个被诅咒的位面到处乱跑，难道比在这里享受安全更好吗？哼。]她交叉双臂，考虑到她有那么多只手，这个动作显得有些笨拙。");
         if(saveContent.doloresDecision == 1)
         {
            outputText("[pg][say: 我想如果你非要知道的话，我希望有一天能出版些东西。虽然现在已经没有多少机构能做这种事了，但即使在这些艰难的时期，保存和扩展知识仍然是值得的。我一直在努力破译之前的那本古籍，我相信我快要取得突破了。等我确定了……我会把一切都告诉你的。]");
         }
         else
         {
            outputText("[pg][say: 无论如何，在我看来，</i>你<i>似乎对</i>我<i>想做的事没什么兴趣。如果你真的非要知道不可，我最近一直在写一篇……我自己的专著。即使有各种阻力]——她意味深长地瞥了你一眼——[say: 知识也必须得到扩展。目前还没有什么准备好分享的，但很快了……]");
         }
         outputText("[pg]她的声音渐渐变小，脸上带着一种隐约令人不安的微笑。这只年轻的蛾女习惯性地发了一会儿呆，然后回过神来，好奇地看着你。");
         outputText("[pg][say: 那你呢，[Father]？我已经知道" + get_player().mf("mother","my other parent") + "想要什么样的生活了……]她上下打量着你，有些得意。[say: 但你所有的旅行肯定都有某种目的吧。]");
         menu();
         _g = this;
         choice = 0;
         addNextButton("恶魔",function():void
         {
            _g.doloresAmbitionAnswer(choice);
         }).hint("你想阻止恶魔。");
         _g1 = this;
         choice1 = 1;
         addNextButton("你自己",function():void
         {
            _g1.doloresAmbitionAnswer(choice1);
         }).hint("你只考虑你自己。");
         _g2 = this;
         choice2 = 2;
         addNextButton("乐趣",function():void
         {
            _g2.doloresAmbitionAnswer(choice2);
         }).hint("你只是为了冒险。");
         _g3 = this;
         choice3 = 3;
         addNextButton("爱情",function():void
         {
            _g3.doloresAmbitionAnswer(choice3);
         }).hint("你是个温柔的人。");
         _g4 = this;
         choice4 = 4;
         addNextButton("不知道",function():void
         {
            _g4.doloresAmbitionAnswer(choice4);
         }).hint("你也不太确定。");
      }
      
      public function doloresAmbitionAnswer(param1:int) : void
      {
         clearOutput();
         switch(param1)
         {
            case 0:
               outputText("答案很简单：你来这里是为了消灭困扰这片土地的恶魔祸害。直到玛瑞斯——以及所有与它相连的世界——免受腐化的威胁，你才会安心。");
               outputText("[pg]她想了一会儿才回答。[say: 非常高尚。但是……不，我想我们都应该渴望变得如此无私。]她点点头，带着一种新的敬意看着你。");
               break;
            case 1:
               outputText("这片土地似乎是个宣示主权的好地方。这里没有法律，没有束缚你的规则。只要你留在这里，你就可以随时随地做你想做的事，任何挡你路的人都不过是障碍。");
               outputText("[pg]你的女儿看起来有些不安。[say: 你真的只在乎这些吗？虽然……也许为自己争取最好的并没有错。伟大往往是要付出代价的……]");
               break;
            case 2:
               outputText("你无法抗拒外面世界的呼唤，这片土地充满了无限的可能。只有在迎接新的挑战或是奔赴下一场冒险时，你才会感到如归家般的自在。");
               outputText("[pg][say: 哎呀，多潇洒啊，]她说道，试图掩饰却还是露出了真心的笑容。[say: 你真是个十足的冒险家！简直就像从故事书里走出来的一样。]说到这里，年轻的蛾女咯咯地笑了起来。[say: 噢，我多希望能像你一样无拘无束……]");
               break;
            case 3:
               outputText("你在内心深处是个浪漫主义者——在其他方面也是。对于多情的流浪者来说，玛瑞斯是一片相当丰饶的土地，而你一直很乐于品尝所有的当地风味。");
               if(saveContent.doloresSex > 0)
               {
                  outputText("[pg]多洛雷斯羞得满脸通红。[say: 那-那是……]她不得不把脸转到一边，才勉强挤出一句回应。[say: 好吧，我想我早就知道了。]");
               }
               else
               {
                  outputText("[pg]她皱起鼻子，嗤之以鼻。[say: 呃，典型。你至少可以</i>试着<i>表现得更有分寸一点，虽然我想这年头这种品质已经很稀缺了。]");
               }
               break;
            case 4:
               outputText("你很难说清是什么驱使你去进行这些冒险，是什么让你每天早晨从床上爬起来。你只是在生活中随波逐流，走一步看一步。毕竟这个地方可不容许你奢侈地制定长远计划。");
               outputText("[pg]她思考了片刻才回答。[say: 很合理，甚至令人钦佩。保持选择的开放性，适应眼前的一切，并且有力量继续前行，即使心中没有某个更宏大的目标。是的……]");
         }
         outputText("[pg]随着她挺直脊背，她的表情慢慢恢复了平静。[say: 好吧，抛开你的动机不谈，事情显然对你很顺利，所以你一定做对了什么。我很感谢你的询问，[Father]。知道你关心我的未来，我很高兴。]");
         saveContent.doloresAmbitions = 2;
         doNext(doloresTalkMenu);
      }
      
      public function debugMenu(param1:Boolean = true) : void
      {
         get_game().debugMenu.debugCompEdit(saveContent,new SaveContent(null,null,null,null,null,null,null,null,null,null,null));
      }
   }
}

