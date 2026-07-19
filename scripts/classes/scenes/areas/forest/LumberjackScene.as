package classes.scenes.areas.forest
{
   import classes.BaseContent;
   import classes.CoC;
   import classes.DebugMenu;
   import classes.DynStat;
   import classes.Monster;
   import classes.Output;
   import classes.Player;
   import classes.SelfDebug;
   import classes.Vagina;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.items.WeaponLib;
   import classes.parser._Parser.TagFun_Impl_;
   import classes.saves.SelfSaver;
   import classes.saves.SelfSaving;
   import classes.scenes.Camp;
   import classes.scenes.Inventory;
   import classes.scenes.api.Encounter;
   import classes.scenes.areas.forest._LumberjackScene.SaveContent;
   import classes.scenes.combat.Combat;
   import coc.view.CoCButton;
   import flash.Boot;
   
   public class LumberjackScene extends BaseContent implements SelfDebug, SelfSaving, Encounter
   {
      
      public var saveVersion:int;
      
      public var saveName:String;
      
      public var saveContent:SaveContent;
      
      public var questioned:Boolean;
      
      public var globalSave:Boolean;
      
      public function LumberjackScene()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         questioned = false;
         globalSave = false;
         saveVersion = 1;
         saveName = "lumberjack";
         saveContent = new SaveContent(null,null,null,null);
         super();
         SelfSaver.register(this);
         DebugMenu.register(this);
      }
      
      public function woodwork() : void
      {
         clearOutput();
         outputText("你转移了话题，开始和他聊起木工，想听他详细说说他囤积这么多木材的目的。");
         outputText("[pg][say: 木材可是好东西，太奇妙了。坚固、多用，还很有味道！]他大声说道，说到最后一点时笑了起来。[say: 不管世界变成什么样，木材总是有用的。建筑工程还在继续，而我恰好热爱这个行业。就算没人看重它，我也会继续这种生活。我甚至知道怎么建造各种各样的建筑，我身后的那座小木屋就是我自己一个人建的，]他自豪地说。[say: 恶魔毁了我以前住的木屋。]");
         outputText("[pg]这很有意思，因为你自己也需要在营地里扩建一些生活空间。也许你应该问问他能不能借些工具来做这个项目。可能会收点费用，但他这么友善，说不定能免费借给你。");
         button(null,"木工").disable();
         addNextButton("借工具",borrowTools).hint("问问能不能借些工具来做你自己的项目。");
      }
      
      public function won3() : void
      {
         clearOutput();
         outputText("疼痛没过多久就消退了，你出人意料地很快适应了新的生活。你被喂食，被清洗，甚至在你的俘虏者心情好的时候还会受到宠爱。然而，你永远无法逃脱你存在的恐怖，[if (guro) {失去四肢的无尽疼痛|束缚着你的沉重锁链}]不断地提醒你，你现在只是一个物品，一个供主人取乐的玩具。");
         outputText("[pg]而且是一个他经常使用的玩具。有时候，他会放过你，只使用你的狱友，但更多时候，你会被拖走，被迫接受他那令人作呕的爱意。每次都很痛，但你渐渐习惯了，学会了无视心中涌起的仇恨。[if (guro) { 毕竟，以你现在的状态，你根本无法阻止他。}]");
         outputText("[pg]尽管如此，你大部分时间都在等待。整天待在这个黑暗的棚屋里，只有一只魅魔作伴。一开始你们还会交谈，但在你们这种处境下，能说的话实在有限，所以棚屋很快就陷入了死寂。而且无论如何，当她是一个恶魔，而你只希望她能代替你被使用时，很难建立起什么情谊。你开始渴望任何能分散注意力的事物，任何短暂的逃避，珍惜每一秒不去想你那悲惨命运的时光。");
         outputText("[pg]岁月流逝，或者至少你认为是这样，但季节是你唯一能感知时间流逝的标志。你慢慢开始与现实脱节，退缩到自己的世界里作为一种防御机制。一切都变得模糊不清，就像一场永远不会醒来的噩梦。随着时间的推移，你几乎学会了爱上你的俘虏者，他的探访是你原本枯燥生活中唯一的激情时刻。但大多数时候，你什么感觉都没有。");
         get_game().gameOver();
      }
      
      public function won2() : void
      {
         clearOutput();
         outputText("[pg]你的眼皮微微睁开。这个房间里很黑，然后你想起你在哪里。你能听到旁边熟睡的魅魔轻柔的呼吸声，但除此之外什么也没有。是什么吵醒了你？仿佛是为了回答你，你听到小屋的门吱呀一声开了，一缕月光洒在你身上。他在那里。");
         outputText("[pg][say: 好了，醒醒，该找点乐子了。]");
         outputText("[pg]你毫不怀疑他的意思，但你无力阻止。他大步走到你面前，开始抚摸你的脸颊，你只能尽力不让自己崩溃。恶魔收回手，迅速脱下衣服，露出一根大约一英尺长、长满倒刺的肉棒。你没有太多时间去思考，他就把你翻了过来，[if (guro) {你悲惨的状况|他惊人的力量}]让这个动作变得很容易。");
         outputText("[pg]樵夫掰开你的屁股，露出了你的[vagorass]。他似乎对你产生了一丝怜悯，并没有立刻蹂躏你的深处，而是慢慢地开始。然而，他那根东西的长度依然让你感到不适，没过多久，你就难受地喘息起来。");
         outputText("[pg]你想要反击，想要挣脱，想要逃跑，但你做不到，[if (guro) {你再也无法为自己做任何事了|这些铁链太结实了}]。你只能默默承受，任由他那根长长的恶魔肉棒在你的体内进进出出，撑开你的[vagorass]。他在干你的时候似乎非常享受，但你却无法在这种卑劣的侵犯中找到任何快感。");
         outputText("[pg]很快，恶魔开始哼哧哼哧地喘着粗气，动作也越来越快。他的臀部不断地拍打着你的屁股，每一次都让你忍不住瑟缩。[if (guro) {没有四肢来稳住身体|被这样束缚着}]，你根本无法支撑自己，所以他的每一个动作都无情地摇晃着你的身体。你发现自己竟然开始渴望他释放，渴望这一切快点结束，哪怕在这个过程中你必须承受屈辱。");
         outputText("[pg]然后，他紧紧地抓住你，他的肉棒开始在你的体内跳动。他几乎是充满爱意地在你的耳边呻吟，从后面抚摸着你的[if (biggesttitsize > 1) {乳房|屁股}]，最后几下狠狠地撞击着你。终于，他拔了出来，你能感觉到一股细流顺着你的[leg][if (guro) {残肢}]流下。");
         outputText("[pg][say: 感觉真爽，不是吗？我现在感觉好多了。]");
         outputText("[pg]你没有回应，过了一会儿，他转身离开，走出了那扇你永远也无法触及的敞开的门。");
         doNext(won3);
      }
      
      public function won() : void
      {
         clearOutput();
         outputText("你和恶魔伐木工的战斗进展不顺，但你还没输。这个恶劣地方的恶臭，以及如果你不在这里打败他会发生什么的念头，让你保持专注和动力。你[i: 会]挺过去的。你会砍倒这个怪物。你只需要找到一个破绽。");
         outputText("[pg]但你倒在了地上，你不知道是怎么回事。你还在战斗，还在坚持，但然后……然后……发生了一些你记不太清的事情。一切都那么模糊。你撞到头了吗？你听到上方传来一声如释重负的叹息，然后感觉到一只靴子踩在你的背部中央，粉碎了所有抵抗的希望。");
         outputText("[pg][say: 好了，你确实让我好好锻炼了一番。没关系，我喜欢在干草堆里翻滚前先热热身。]");
         outputText("[pg]听到这话，你心中涌起最后一次短暂的绝望，你试图挣扎着[if (hasweapon) {向你的[weapon]爬去|逃跑}]，但恶魔只是叹了口气，把你压在身下，将你死死按住。像这样脸朝下，你看不见他的表情，但你确信他看起来一定很得意。");
         outputText("[pg][say: 嗯，可不能让你再试一次了。]");
         outputText("[pg]当他抓住你的[if (singleleg) {[if (isgoo) {躯干|尾巴}]|双腿}]，开始把你拖向小屋后方时，你尖叫起来。无论你如何挣扎扭动，这个魁梧的恶魔只是轻笑着，轻松地对付着你疲惫的身体。当他走到最里面的墙边时，他把你举起扔到一张桌子上，然后开始剥去你的[armor]并把你五花大绑。绳索让你除了扭动之外什么也做不了，而且它们深深地勒进你的[skinshort]里，疼得要命。");
         outputText("[pg][say: 好了，好了，没必要挣扎。这一切很快就会结束的。]");
         if(get_goreEnabled())
         {
            outputText("[pg]你做好了最坏的打算，但他并没有做任何阴险的事，只是拍了你两下，然后走开了。你很困惑，直到你看到他去拿他的斧头，那把斧头还放在刚才战斗的地方。他悠闲地弯下腰，熟练地掂了掂斧头，然后带着轻松的笑容向你走来。");
            outputText("[pg][say: 现在这会有点疼，但我需要你像个大[boy]一样，]他用嘲讽的语调说道。");
            outputText("[pg]你无能为力。你看着一双腿慢慢靠近，那把可怕的斧头在后面微微拖动。它升出了你的视线。伴随着短暂的呼啸声，然后一切都变成了红色。你的喉咙感觉火辣辣的，但你听不到自己的尖叫声。过了一段不知多久的时间，你的视力恢复了，你意识到有滴水的声音。");
            outputText("[pg]伐木工的脸突然出现在你旁边，你本能地想推开他，但你做不到。你看了看。你的手臂不见了。它掉在桌子下面的地上，软绵绵的，毫无生气。你大口喘着粗气，勉强让自己保持清醒。他开始在你的残肢上涂抹什么东西。");
            outputText("[pg][say: 好了，这应该能让你暂时喘口气。只剩下[if (singleleg) {两|三}]个了。]");
            outputText("[pg]在接下来的几分钟无尽的地狱中，你昏过去了好几次。[b: 砰]。一声尖叫从你的喉咙里撕裂出来，在这个封闭的空间里回荡。[b: 砰]。你试图去想别的事情，任何事情，只要不是这个就好。[b: 砰]。一切都是红色的，一切都在尖叫，你只剩下神经和裸露的骨头。");
            outputText("[pg]伐木工退后一步，擦了擦额头。[say: 好了，没那么糟，对吧？]");
            outputText("[pg]你头晕目眩，几乎要吐了。休克让你感觉不到全部的疼痛，但你的身体只剩下一口气了。你的本能尖叫着让你使用你失去的肢体，你的大脑无法适应这场噩梦。当恶魔开始把同样的药膏涂抹在你其余的伤口上时，你只能无力地挣扎。这很刺痛，但也留下了一种麻木的感觉，在你现在的状态下，这是一种幸福的慰藉。");
            if(get_player().hasCock())
            {
               outputText("[pg][say: 嗯，实际上，你也不需要这个了。]");
               outputText("[pg]当他压在你身上时，你浑身发抖，试图在为时已晚之前理解他的话。他不会是想……？但你意识到他是认真的，因为他把你翻到一边，拉长了你的阴茎。");
               outputText("[pg][say: [if (cocklength < 5) {本来也没多少，我简直是在帮你|[if (cocklength > 12) {别担心，我习惯砍这种树干了|抱歉，我只是不喜欢那种玩法}]}].] 他轻笑着，你浑身发抖。");
               outputText("[pg]你勉强看到一个黑影升起然后落下，你的视线太模糊了，看不清什么，但当斧头击中目标时，你肯定感觉到了。你发出一声最后的喊叫，然后一切都变黑了。");
            }
            else
            {
               outputText("[pg][say: 抱歉弄出这么多动静，但你仍然拥有你需要的一切，]他抚摸着你的后背说道。然而，此时你已经不在乎了。一切都在消退，你发出一声最后的呻吟，然后终于放弃，接受了那令人安慰的黑色虚空。");
            }
         }
         else
         {
            outputText("[pg]你退缩了，但当他把你拖起来，带到墙边一块清理出来的空地时，你无能为力。那里有一条链子连着一个项圈，看起来很适合你。你看到那个被绑着的魅魔同情地看着你，然后有什么东西击中了你的后脑勺，一切都变黑了。");
         }
         doNext(won2);
      }
      
      public function talk3(param1:Boolean) : void
      {
         clearOutput();
         if(param1)
         {
            outputText("一口灌下。这芳香的森林液体滑入你的喉咙，像松针和烟熏般灼烧刺痛。[if (tou<25) {让你一阵剧烈咳嗽|说\"有点冲\"都算是轻描淡写了}]，然而你确实感到它奇异地赋予了你力量。这树木的味道比你想象中真的吃木头还要浓烈。感觉就像一层树脂正在包裹涂覆你的内脏，不过那萦绕不散的香气和风味，倒也为你赋予了一种户外的蓬勃活力。");
            outputText("[pg][say: 感觉很复杂，对吧？一开始是这样，但你会习惯的。] " + (questioned ? "" : "樵夫咧嘴一笑，详细解释道：[say: 这是我家族流传已久的配方。] 他拉起一袋木屑。[say: 我把精选的木材放在布袋里浸泡两三天。然后，我把它们全都拧干。加点香料，比如肉桂或者其他我能轻易弄到的东西，再倒进足量的波旁威士忌，和剩下的饮料一起放进锅里加热。] ") + "他又从自己的杯子里喝了一大口。在这样友好的气氛中，你接下来要把话题引向哪里呢？");
            get_player().changeFatigue(-10);
            dynStats(DynStat.Tou(1),DynStat.Lib(1));
         }
         else
         {
            outputText("老实说，这听起来不太舒服。目前，你不得不拒绝喝这种液体树木。男人笑了。[say: 好吧。]");
         }
         menu();
         addNextButton("生活方式",lifestyle).hint("询问他在森林里的生活。");
         addNextButton("木工",woodwork).hint("询问关于木工的事情，以及他用这些木材做什么。");
         addNextButton("性爱",askSex).hint("直奔主题，你接近这个强壮的陌生樵夫就是为了找个真正的男人干一炮。");
      }
      
      public function talk2() : void
      {
         var drank:Boolean;
         var _g:LumberjackScene;
         clearOutput();
         outputText("伐木工呻吟着叹了口气，在椅子上坐下。[say:继续，请告诉我你的故事，]他说着，打开了火上的锅。他从中拿出一个勺子，将一些半透明的棕褐色液体倒入杯子中。你坐在他对面，开始讲述你在森林里游荡的时光。相对于当地人来说，你在这个世界上有点陌生，但你已经在这里待了一段时间了。这个地方的大部分与你长大的家大不相同，但你似乎掌握了这片土地现在的样子。");
         outputText("[pg]恶魔喝着他的饮料，一直没有打破他高兴的表情。也许，你思考着，在目前的文明状态下——或者更确切地说，完全缺乏文明——他没有那么多社交活动。当你总结你的一些经历细节时，他拿起第二个杯子，倒入更多的液体。");
         outputText("[pg][say:给你，]他递出木制容器说。[say:这是我自制的香料雪松。公平警告，它有点烈。波旁威士忌是必不可少的成分。] [if (isChild) {停下来，他重新考虑了他的提议。[say:啊，你看起来有点年轻，但你的力量和独立赢得了一杯酒，我说。]}]");
         menu();
         _g = this;
         drank = true;
         addNextButton("喝下",function():void
         {
            _g.talk3(drank);
         }).hint("闻起来有股木头味。");
         addNextButton("询问",question).hint("闻起来有股木头味。这到底是什么？");
      }
      
      public function talk() : void
      {
         saveContent.encountered = true;
         clearOutput();
         outputText((saveContent.aggressive ? "你放下了你的[weapon]" : "你在这个棕红色恶魔友好的举止下放松下来") + "，以随意的态度接近他，同时环顾四周。走近后，你检查了舒适的小屋、棚子和活跃的火坑，它们彼此相对较近。几堆木材中存在大量的木材，按大小和精炼阶段区分，虽然你不能说他有这么多木材是为了什么目的。");
         outputText("[pg]恶魔微笑着走近。他的胡茬、庞大的身躯和樵夫装扮描绘了一个比人们从这样一个腐败实体中所期望的更质朴的男人的形象。他向你伸出手，既然你已经承诺尝试和平，你就握了握他的手。");
         outputText("[pg][say:希望我没有吓到你，]他笑着说。[say:我在外表上改变了很多，失去了灵魂什么的，但我致力于我的生活方式。别怕。]他收回手，擦去一点头发，从他出汗的额头上清除棕色的头发。[say:请坐，我很想听听是什么把你带到我的树林里来的。]");
         outputText("[pg]他指着火坑周围的椅子。当他走向它们时，他把斧头放在他正在劈的木柴旁边，让你稍微放松了一点。你跟在后面。");
         doNext(talk2);
      }
      
      public function spare() : void
      {
         clearOutput();
         outputText("也许你是在招惹未来的麻烦，但你对他没兴趣。你把斧头转过来，钝钝地敲在他的头上，把他打晕。他会受伤，但最坏的情况也只是用黑魔法来修复的问题。");
         end();
      }
      
      public function saveToObject() : Object
      {
         return saveContent;
      }
      
      public function reveal(param1:Boolean) : void
      {
         var monster1:Monster;
         var _g:LumberjackScene;
         clearOutput();
         outputText("走近一看，棚子显然很大，几乎有木屋的三分之一大小。它没有上漆，但木板看起来像是经过了某种处理。你抓住门把手拉开门，看到了很多你预料之中的东西，还有一张来自某种体型惊人的动物的大毛皮。毛皮从天花板上垂下来，遮住了整个后墙。");
         outputText("[pg]" + (param1 ? "你[walk]进去，开始挑选看起来需要的东西：锤子、手锯、工具箱等等。" : "你发现里面大多是工具和其他用品，而不是玩具。你脑海中闪过一个奇怪的念头：他可能会把锯子当成性爱的有趣玩具。"));
         outputText("[pg]毛皮后面传来的声音" + (param1 ? "引起了你的注意" : "打断了你的思绪") + "。你没多想，一把扯下毛皮，看到一个魅魔被锁在墙上。她浅紫色的皮肤有点脏，还有些淤青。还有一些小血迹，尤其是她的大腿内侧。她的嘴被口塞堵住了，所以除了几声呜咽外发不出任何声音。她半睁的淡褐色眼睛恳求地盯着你。");
         outputText("[pg][say: 给你带了个朋友，妹妹。]在你身后，伐木工站在门口，手里拿着一把可怕的砍伐斧。[say: 我不想打破你的幻想，朋友，但你很长一段时间都离不开这个棚子了。]");
         menu();
         _g = this;
         monster1 = new Lumberjack();
         addNextButton("战斗",function():void
         {
            _g.startCombatImmediate(monster1);
         }).hint("除了打倒他，没有别的出路。");
      }
      
      public function reset() : void
      {
         saveContent.encountered = false;
         saveContent.aggressive = false;
         saveContent.freedSucc = false;
         saveContent.executed = false;
      }
      
      public function rape(param1:int) : void
      {
         var raped:Boolean;
         var _g:LumberjackScene;
         var _loc2_:Boolean = false;
         var _loc3_:Boolean = false;
         clearOutput();
         outputText("你把斧头挥向恶魔脸旁的地面。当你能满足自己的需求时，杀了他有什么乐趣呢？作为一个男魅魔，他肯定能理解你的想法。");
         outputText("[pg]他沉思着。" + (get_player().demonScore() >= 4 && get_player().isFeminine() ? "[say: 操你，] 他啐了一口。[say: 像你这样的婊子想尝尝真正男人的滋味并不奇怪，但我宁愿死。]" : "[say: 如今我们都一样，不是吗？你只是另一个自私自利的强奸狂。] 他边说边轻笑，嘴角挂着得意的笑容。") + " 令人惊讶的是，一个色欲恶魔竟然没有抓住这个机会。也许他受不了在下面，但这种抵抗只会让你更加兴奋。不管他愿不愿意，你都会如愿以偿的。");
         switch(param1)
         {
            case 0:
            case 2:
               outputText("[pg][if (!isnaked) {脱下你的[armor]，你|你}]在男魅魔面前炫耀你的身体，诱惑着你确信潜伏在他内心的欲望。你蹲下来，抓住他的角，命令这个恶魔取悦你。他给你的只有沉默和怒视。他非得这么难搞吗？他肯定会强暴你一辈子，但他却如此固执地抵抗。你来回拉扯他的头，要求他服务，[i:然而]你得到的依然只有沉默。真是烦人透顶。");
               outputText("[pg]随他的便吧，你要把他带到一个他无法拒绝你的地方。你把他推倒仰面朝天，爬过他的身体，扯下他的裤子。他那" + (get_monster().get_lust100() >= 100 ? "早已坚挺的" : "") + "恶魔肉棒在空气中抽动着。不管他愿不愿意，他身体的这一部分都会珍视你的深处。你[if (singleleg) {将你的[if (hasvagina) {胯部|臀部}]降下|跨坐}]在他身上，将你的[if (hasvagina) {阴唇|屁股}]压在他滚烫的肉棒上。当你把他压在身下时，你能感觉到他的心跳和肉棒的轻微脉动。仅仅是这种静止的接触，你就能感觉到他变得更硬了。你知道他想要。他应该为此乞求。");
               outputText("[pg]" + (get_player().demonScore() >= 4 && get_player().isFeminine() ? "[say: 像你这样的廉价婊子不值得，我知道我比那更好，]" : "[say: 你才是那个像发情的母狗一样跳到我鸡巴上的人，]") + " 他说着，给了你一个嘲弄的坏笑。尽管他嘴上否认，但你臀部的任何轻微动作都会让他的肉棒看起来像是要爆炸了。你撑起身体，将他那球状的、带有结节环的龟头对准你的[vagorass]。他皱起眉头，愤怒地撇着嘴，显然对他在这里作为顺从者的不情愿地位感到不满。你叹了口气，沉下身子，体验着你的[if (hasvagina) {小穴|后庭}]被男魅魔的肉棒填满时突然被撑开的感觉。");
               _loc2_ = get_player().hasVagina() ? get_player().hasVirginVagina() : get_player().buttVirgin();
               if(get_player().hasVagina())
               {
                  get_player().cuntChange(18,true,true);
               }
               else
               {
                  get_player().buttChange(18,true,true);
               }
               _loc3_ = param1 == 2 && get_player().vaginas[0].vaginalLooseness >= 2;
               outputText("[pg]他肉棒上的凸起摩擦着你的内壁，莫名其妙地能够刺激到每一个最关键的角落和缝隙" + (_loc2_ ? "，即使是你那未受污染的深处。这种如梦似幻的快感令人难以置信，你的身体对[if (hasvagina) {被男魅魔破处|将初夜献给男魅魔}]的喜悦做出了强烈的反应" : "") + "。这种令人愉悦的刺痛感像火花一样在你体内产生共鸣，让你全身感到眩晕。虽然你的胯部才刚刚到达根部，但你已经被推到了边缘[if (hasCock) {，先列腺液滴到了他身上}]。" + (_loc3_ || param1 == 0 && get_player().ass.analLooseness >= 3 ? "他可能没有巨大的尺寸，但他的工具非常适合这项工作。你扭动臀部，将他的肉棒压在你柔软宽松的内壁上" : "你花了几分钟来适应。他所拥有的尺寸本身就足够了，但他这根工具经过了精细的调整，能够出色地发挥其作用") + "。男魅魔叹了口气，尽力忍住他愉悦的呻吟。他还能假装不喜欢多久呢？");
               outputText("[pg]你没有试图压抑自己的呻吟，而是高兴地呼出一声愉悦的叹息。你的身体现在已经习惯了这根恶魔肉棒，你深吸了一口气。你向上拉起，每当他经过你颤抖的入口[if (metric) {一厘米|一英寸}]时，你都会大声呻吟。你刚好停在龟头处，感觉到小结节刺激着你的环，离离开你的身体只有一步之遥。伐木工的手抽搐了一下。你坏笑着，把他的肉棒固定在原位，只让龟头享受你身体的舒适。你左右摇晃，最后男魅魔屈服了。他的手猛地抓住你的[hips]，将它们猛烈地按在他的骨盆上，让你在狂喜中尖叫。");
               outputText("[pg]他多肉的阴茎[if (hasvagina) {挤压着你的子宫颈|深深刺入你的肠道}]，引起了不适和无法抗拒的需求的混合感。你命令恶魔更用力地操你。他气呼呼的，但还是照做了，" + (get_player().thickness >= 75 || get_player().get_tallness() > 84 ? "用他惊人的力量" : "") + "把你举了起来。你嘴里漏出一声颤抖的呼吸。这根肉感十足、纹理丰富的肉棒能让你发狂，这是很少有东西能比拟的。他猛地把你摔下来，粗暴地直没至柄。你喘着粗气，[if (istaur) {跺脚|抓住}]他的肩膀，示意他停下来。你很享受这个过程，但这就是你在这个情况下能给他的最大权力了。他现在已经不可能假装自己没有沉浸在性爱的狂喜中了，所以你掌握了控制权。");
               outputText("[pg]你稳稳地站稳[legs]，开始在他的肉棒上上下套弄，加快了你抽插的节奏。不出所料，恶魔这次没能忍住他的呻吟。令人眩晕的声音在你的喉咙里涌起。微小的高潮波浪冲刷着你[if (hasCock) {，你的[cock]滴出了一点精液}]。这只会促使你移动得更快，将这根被诅咒的工具更用力地泵入你的深处。");
               outputText("[pg][say: 啊，操，]他呻吟着。伐木工开始不受控制地向上挺动臀部，每一次抽插都与你迎合。他发出一声沉重的咕哝，粗暴地将自己推[if (hasvagina) {向你的[vagina]|过你的肛门通道}]。他的力量增加了你操弄的凶猛程度，让你发出了高亢的愉悦呻吟。你的腹部和大腿紧绷起来，你紧紧抓住他，在这一系列最后、令人兴奋的冲刺中失去了理智。男魅魔发出一声巨大的愉悦咆哮，将大量邪恶的精液喷洒在你的体内。当它淹没你时，你的视线变暗，你的身体以与他相同的强度达到高潮，喝下他能给你的所有堕落的种子。");
               outputText("[pg]一切都黑了一瞬间。你睁开眼睛，在精神上重新振作起来。当你呼气时，那令人麻木的结局的威力消散了。你把自己从他黏糊糊的肉棒上拉开，从你的入口处滴下精液。[if (hasCock) {虽然你几乎没有意识到你的身体在做什么，但你似乎也用你自己的精液浸透了他。}]");
               get_player().slimeFeed();
               get_player().knockUp(1,432);
               break;
            case 1:
            case 3:
               outputText("[pg][if (!isnaked) {露出你的[cocks]|抓住你的[cocks]}]，你轻轻地将[cockem]拍打在恶魔的脸上，引来了他刺骨的怒视。你脑海中闪过一个念头，想在他的喉咙里来一发，但你觉得威胁并不能阻止他咬人。把你的胜利揉在他脸上的嘲弄对于他的这一端来说已经足够了，你重新站起来，走到他身后。");
               outputText("[pg]你抓住他的裤子，开始把它们从他的腿上拉下来，粗暴地拉扯，直到他肌肉发达的屁股很容易够到。他现在的沉默是他唯一的反抗形式吗？" + (get_monster().get_lust100() >= 100 ? "他那坚挺的恶魔肉棒背叛了他的态度" : "他那饱受摧残的身体并没有多少选择") + "。你没有费心去润滑或放松他，而是选择立即将你的[cock]塞进去。当你强行将你的工具穿过他干燥且毫无准备的括约肌时，他发出了一声沉重的呻吟。");
               outputText("[pg][say: 呃……[b:操]你，]他惊呼道，同时他那堕落的性器官在他身下抽动和脉动。在入口之外，他的内脏和任何其他生物一样柔软和柔韧。在经历了打倒这个拿着斧头的疯子的麻烦之后，将你的肉棒推拉穿过这个炎热而扭动的隧道所感受到的快感是一种甜蜜的解脱。");
               outputText("[pg]你伸手去抓他那凹凸不平的肉棒，性感地将你的[hand]滑过它。先列腺液开始涂满你的手掌。无论他口头上如何反对，他的身体都无法隐藏其真实的本性。你的[hips]与他结实的臀部碰撞，引出了男魅魔的另一声大声呻吟。你抽插的节奏开始加快。这个肌肉发达、质朴的伐木工，可能在森林里强奸流浪者已经不知道多久了，现在却像个婊子一样跪在地上喘气，被他最后一个潜在的受害者强奸。他在狂喜中大叫，将一串串精液喷洒在地上，同时他的肛门剧烈地颤抖着。");
               outputText("[pg]他真是个婊子，在被强奸时高潮了。不过，将你的[cock]滑过这样一个颤抖的环的感觉相当刺激，它促使你更用力地操他。[if (silly) {你的骨盆拍打他的声音让森林充满了正义|你的骨盆拍打他屁股的声音更大更响}]，你转向更短、更快速的动作。被高潮后的敏感所淹没，他曾经充满男子气概的呻吟被顺从的喘息和哭泣所取代，他的手指咄咄逼人地抓挠着地面。你发出了自己的呻吟和咕哝，终于感到了释放。");
               outputText("[pg]精液涌入他温暖的深处。你的感官似乎完全沉浸在将你高潮的性器官捣入他体内的这一个瞬间。每次你埋到根部，就会射出另一发，但你的臀部继续移动，向他体内排泄更多。这是一种令人眼花缭乱的幸福体验。你鼓起意志力，把自己从性爱恶魔的屁股里拔出来，将你娇嫩的肉棒暴露在空气中。");
         }
         outputText("[pg]既然你已经满足了你的欲望，你打算怎么处置他？");
         get_player().orgasm("Generic");
         dynStats(DynStat.Cor(3));
         menu();
         _g = this;
         raped = true;
         addNextButton("处决",function():void
         {
            _g.execute(raped);
         });
         addNextButton("饶恕",spare);
      }
      
      public function question() : void
      {
         var drank1:Boolean;
         var _g1:LumberjackScene;
         var drank:Boolean;
         var _g:LumberjackScene;
         clearOutput();
         outputText("在一个与你自己的世界如此不同的异星上，随意吃喝未知物质似乎是个不太明智的主意。在开始痛饮之前，你更想知道这到底是什么。");
         outputText("[pg]樵夫咧嘴一笑，解释道：[say: 这是我家族流传已久的配方，我很乐意给你讲讲。] 他拉起一袋木屑。[say: 我把精选的木材放在布袋里浸泡两三天。然后，我把它们全都拧干。加点香料，比如肉桂或者其他我能轻易弄到的东西，再倒进足量的波旁威士忌，和剩下的饮料一起放进锅里加热。]");
         outputText("[pg]据你所知，在英格纳姆，从来没有做过哪怕是稍微类似的东西。");
         questioned = true;
         menu();
         _g = this;
         drank = true;
         addNextButton("喝下",function():void
         {
            _g.talk3(drank);
         }).hint("为什么不呢？");
         _g1 = this;
         drank1 = false;
         addNextButton("拒绝",function():void
         {
            _g1.talk3(drank1);
         }).hint("听起来有点恶心。");
      }
      
      public function onAscend(param1:Boolean) : void
      {
         reset();
      }
      
      public function meet() : void
      {
         clearOutput();
         outputText("在前方，你听到了砍柴和劈柴的声音。树木和灌木丛变得稀疏，露出一个看起来很舒适的家园。当你[walk]进这个地方时，你打量着最引人注目的特征：一个小屋，一个棚子，以及一个正在用斧头劈木头的非常高大的恶魔男人。");
         outputText("[pg]虽然直觉告诉你保持低姿态并谨慎接近，但这个穿着粗犷的樵夫已经注意到了你。当他向你走来时，他举起一只手，友好地打招呼。");
         menu();
         addNextButton("交谈",talk).hint("他可能是一个友好的家伙，或者你将不得不与他战斗，但先尝试和平路线也没有坏处。");
         addNextButton("攻击",attack).hint("他看起来很友好，但他是个恶魔。杀了他。");
         addNextButton("离开",leave).hint("像那些木头一样，劈开。");
      }
      
      public function load(param1:int, param2:*) : void
      {
         Utils.extend(saveContent,param2);
      }
      
      public function lifestyle() : void
      {
         clearOutput();
         outputText("恶魔给你的印象并不像爱好和平的类型，所以你忍不住对这个男人的生活方式感到好奇。");
         outputText("[pg][say: 我们家族做木材生意有很长的历史了，] 他开始说道。[say: 这是我一直以来的生活，我没打算放弃。恶魔来了，让所有人都屈服了，但我爸可没养出一个软蛋！] 他自豪地说，并展示了一下肌肉来证明自己的观点。[say: 我拿起我爸的伐木斧，像砍柴一样砍穿了一个大块头的膝盖。]");
         outputText("[pg]恶魔大笑起来，对这段记忆感到非常满意，然后咳嗽了一声，声音渐渐小了下去。[say: 然后几秒钟后，恶魔的拳头打在我的胳膊上，骨头碎了。] 他叹了口气。[say: 我没有放弃，但我意识到我比我想象的还要弱小得多。眼泪在我的眼眶里打转，但我坚守阵地，用我那只较弱的手臂挥舞着。] 他的目光聚焦在火上，看起来有点沮丧。[say: 我没砍中。我又挥了一次，还是没砍中。我母亲和妹妹躲了起来，我父亲还没旅行回来——我独自一人在周围全是恶魔的战斗中。]");
         outputText("[pg]沉默了一会儿。樵夫又喝了一大口饮料。[say: 在打断了我几根骨头后，那个大块头问我是否想加入他。他说，意志坚强的人能走得很远，我会很容易变得和他一样强。不可否认，这诱惑了我，你可能会猜我答应了。但我没有。] 他深吸了一口气。[say: 所以他把我扔进一堆木材里，让一个魅魔来对付我。]");
         outputText("[pg]这里的语气转变并不是你通过提问所能预料到的。他似乎在回避直接说自己被强奸了[if (inte>50) {，但你无法想象一个极具男子气概的人能坦然承认这一点}]。");
         outputText("[pg]恶魔继续说道：[say: 总之我成了一个男魅魔。就像我打的那个大块头一样，我非常自然地接受了黑魔法，经过一段时间的练习后，我可以治愈我的伤口。他说我意志坚强，这一点他没说错，因为我一直坚持我的生活。我是一个该死的樵夫，字面意思上的。我砍伐，我提炼，我制作。]");
         button(null,"生活方式").disable();
         get_output().flush();
      }
      
      public function lesbFuck(param1:Boolean) : void
      {
         clearOutput();
         registerTag("pen",TagFun_Impl_.fromBool(param1));
         outputText("[if (!isnaked) {性爱恶魔的存在让你[if (haslegs) {双腿之间|胯下}]的温度升高，当你脱光衣服，将你的[genitals]暴露在空气中时，你感到很满足。}]魅魔欣赏着你明显勃起的性器官，本能地期待着扭动着。你抓住她的尾巴，[if (pen) {用铲状的尖端摩擦了一下你勃起的[clit]，然后把它滑入你体内。|把它的长度贴在你的外阴上，紧紧地压着你，在你的阴唇之间和你的[clit]上前后滑动。}]你向前倾身，将你的[chest]贴在她的胸前，你感觉到她的乳头在你的触摸下挺立起来。这种亲密接触让你的性欲高涨，你伸手去抚摸她的生殖器。当你这样做时，她发出一声愉悦的呜咽，她的身体变得火热，她的尾巴开始[if (pen) {在你体内抽插。|在你身上摩擦。}]你用空闲的[hand]伸下去抚摸她柔软的臀部，让她发出兴奋的呻吟，这反映了她作为色欲恶魔的本性。");
         outputText("[pg]她的尾巴急切地想要取悦你，确保你离开时足够满意，从而真正放她走。考虑到她是个恶魔，你觉得她可能还能做得更好。你用力将拇指按在她充血的阴蒂上开始摩擦，同时你的两根手指慢慢分开她的阴唇。魅魔高兴地颤抖着，[if (pen) {将她的尾巴插得更深|用她的尾巴施加更多的力量}]。随着她的努力变得更加令人满意，你用力按压她的阴蒂，并迅速将三根手指滑入她非常湿润的小穴。你把它们插到最深处，当开始前后滑动时，她天然的润滑液顺着你的手滴到你的手腕上。恶魔蜷缩着脚趾，在被绑住的状态下尽力用她的乳头摩擦你的乳头。如此陶醉于这种插入，性爱真的是一件让她困扰的事情吗？");
         outputText("[pg]你大声说出了你的想法，表达了你对她不喜欢被这样使用的怀疑。被俘虏的恶魔把目光从你身上移开。[say:我无法改变我的身体，]她嘟囔着。[say:是他把我变成这样的。]");
         outputText("[pg]你停顿了一下，仔细思考她的话。然而，还没等你考虑同情她，她就用阴道肌肉紧紧夹住你的手指，[if (pen) {插得足够深，以至于她尾巴的铲状尖端几乎擦到了你的子宫颈。|用她的尾巴用力按压你的阴道口，在你的阴唇之间快速抽插，同时用铲状尖端挑逗你的[clit]。}]不管是什么让她变成了这样，她都没有隐藏她身体对性爱的渴望。你继续深深地抽插你的手指，在她丝滑的肉壁上弯曲它们。她的小穴有节奏地颤抖和收紧，就像一台专门为了快感而制造的机器。");
         outputText("[pg][say: 我比喜欢我哥哥的鸡巴更喜欢这个，]她呻吟着。她艰难地吞咽着，吸气时发出尖叫。[say: 这就是我所知道的一切。你让我感觉……]她停顿了一下，闭上眼睛，试图消化她所接受的所有刺激。[say: 贪婪。]");
         outputText("[pg]魅魔的阴道肌肉紧紧收缩，不断跳动并流出淫液，同时她在极乐中尖叫。她的尾巴[if (pen) {猛烈撞击你的子宫颈，然后拔出，再次深深插入。|在你的阴唇间抽插，仿佛试图操干你的外阴褶皱，同时用力摩擦你那跳动的阴蒂。}] [if (corruption>80) {你体内一股黑暗、根深蒂固的力量强烈地驱使着|你身体的每一个细胞都在呼唤着}]你，让你尽你所能地操她，也被她操，耗尽你身体所能聚集的一切，甚至更多。你把手从她的屁股上移开，擦了擦额头，抹去几滴汗水，保持专注。你的手现在已经完全被她那恶魔般的小穴浸透了。她的尾巴用力地摆动，让你无法控制地呻吟，直到你突然感到高潮的快感席卷全身。你[if (vaginalwetness > 2) {将女性的精液喷洒在她已经湿滑的尾巴上，更多的液体滴落到地上|感到你的小穴在纯粹的极乐中跳动和紧缩}]。你的大脑仿佛一片空白，你的手进一步压入她的小穴，从几根手指变成整只手深深地操着她，而她的尾巴[if (vaginalwetness > 2) {诱哄着|尽管你明显很干，但还是试图诱哄出}]尽可能多的淫水。你感到一阵眩晕，踉跄着后退，把手从恶魔身上抽回，把她的尾巴从你身上拔出[if (vaginalwetness > 2) {，同时更多的液体喷涌到你的大腿上。|。}]");
         fuck2();
      }
      
      public function leaveSucc() : void
      {
         clearOutput();
         outputText("你拿起之前绑在她嘴上的口塞，把它放回原处。这让她非常痛苦，但她完全无能为力。");
         decision();
      }
      
      public function leave() : void
      {
         clearOutput();
         outputText("老实说，拿着斧头的恶魔伐木工并不特别让人感到安慰。既然你在他土地的边缘，你决定冲回树林，趁还能逃脱的时候逃跑。恶魔似乎没有跟上来。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function get_debugName() : String
      {
         return "伐木工";
      }
      
      public function get_debugHint() : String
      {
         return "住在树林里的恶魔伐木工。";
      }
      
      public function fuck2() : void
      {
         outputText("[pg]你喘了几口气。色欲恶魔第一次和非恶魔做爱可能会比平时更激烈一些，或者她只是太急于表达她的感谢了。无论如何，你感到非常奇妙的满足。");
         outputText("[pg][say: 你会放了我吗？] 魅魔问道，看起来和你一样对这场嬉戏感到满足。");
         get_player().orgasm("Generic");
         dynStats(DynStat.Cor(2));
         menu();
         addNextButton("释放",free).hint("你信守诺言；她可以自由离开了。");
         addNextButton("处决",executeSucc).hint("你不应该信任恶魔，恶魔也不应该信任你。");
         addNextButton("离开",leaveSucc).hint("不，你不会的。");
      }
      
      public function fuck() : void
      {
         var penetrate1:Boolean;
         var _g1:LumberjackScene;
         var penetrate:Boolean;
         var _g:LumberjackScene;
         clearOutput();
         outputText("在满足了你之后，她就可以自由离开了；毕竟，她生来就是做这种事的。");
         outputText("[pg][say:是——是的，当然，]她急切地回答。[say:你救了我，就有权支配我的身体。如果你能温柔点的话？我有点疼。]她给了你一个虚弱的微笑并耸了耸肩，知道自己没有资格讨价还价。不管怎样，你都会" + (get_player().cor > 50 || get_player().isReligious() ? "随心所欲地对待她" : "体谅她的状况") + "。");
         if(get_player().hasCock())
         {
            outputText("[pg][if (!isnaked) {性爱恶魔的存在让你的下装紧绷，当你露出你的[genitals]时，这种满足感更加强烈。}]魅魔一看到你变硬的阴茎，就开始本能地期待着，咬着嘴唇微微扭动。你把你的[cock]滑入她的大腿之间，同时开始用手抚摸她的身体。尽管——或者也许是因为——她在这里受到的待遇，她的身体立刻变得火热，乳头也变得坚挺。毫无疑问，她有着腐化、好色的本性，因为当你抚摸她丰满柔软的乳房时，她发出了呻吟。");
            outputText("[pg]虽然她的大腿很柔软，但摩擦你阴茎的干涸血液比你希望的要粗糙一点，所以你决定进入正题。希望她在里面能更配合。当你的[cocktype]尖端擦过她的阴唇时，魅魔颤抖着。你抓住她柔软的臀部，汁液从她贪婪的入口顺着你的阴茎流下。你猛地一挺，将你的[hips]撞向她，[if (cockLength<6) {瞬间|[if (cockLength<10) {轻松地|尽管你的长度很长}]}]直没入柄。恶魔呻吟着，脚趾蜷缩，陶醉在被插入的快感中。她真的想从那个伐木工手里解脱出来吗？");
            outputText("[pg]你大声说出了你的想法，表达了你对她不喜欢被这样使用的怀疑。被俘虏的恶魔把目光从你身上移开。[say:我无法改变我的身体，]她嘟囔着。[say:是他把我变成这样的。]");
            outputText("[pg]你停顿了一下，仔细思考她的话。然而，还没等你考虑同情她，她就用双腿锁住你，把你拉进她更深处的褶皱里。不管是什么让她变成了这样，她都没有隐藏她身体对性爱的渴望。你继续抽插你的臀部，让你的[cock]滑过她丝滑的隧道。她的小穴有节奏地颤抖和收紧，就像一台专门为了榨干你而制造的机器。");
            outputText("[pg][say:我喜欢你的肉棒，远胜过我哥哥的，]她呻吟着。她艰难地咽了口唾沫，吸气时发出尖叫。[say:我只知道他的。你让我感觉……]她停顿了一下，闭上眼睛，试图消化她所接受的所有刺激。[say:饥渴。]");
            outputText("[pg]魅魔的阴道肌肉紧紧夹住你，跳动着，流着口水，同时她在狂喜中尖叫。[if (cor > 50) {你内心深处一股黑暗的、根深蒂固的力量强烈地驱使|你身上的每一根纤维都在呼唤}]你用你拥有的一切填满她，倾尽你身体所能产生的一滴，甚至更多。你抬起手擦了擦额头，抹去一些汗珠，让自己保持专注。先列腺液从你的阴茎渗出。你重重地抽插着，无法控制地呻吟着，直到你突然开始射精。光滑黏腻的肉壁毫不犹豫地吸干了你的精液。你感到大脑一片空白，而她的小穴则尽可能多地从你身上榨取精液[if (cumnormal) {，远远超过了你平时的极限}]。你感到一阵眩晕，踉跄着后退，从恶魔体内抽出你湿透的阴茎，同时又喷出了几股精液。");
            fuck2();
         }
         else
         {
            menu();
            _g = this;
            penetrate = true;
            addNextButton("尾巴插入",function():void
            {
               _g.lesbFuck(penetrate);
            });
            _g1 = this;
            penetrate1 = false;
            addNextButton("尾巴摩擦",function():void
            {
               _g1.lesbFuck(penetrate1);
            });
         }
      }
      
      public function free() : void
      {
         clearOutput();
         outputText("尽管她明显被腐化了，但你不想再对她做任何事。你毫不费力地解开了她的束缚，之后她瘫倒在地，开始喘气。");
         outputText("[pg][say:对——对不起。我只是……很久没有试着站起来了，]她说道。她一路颤抖着，勉强站稳了脚跟。每向门走一步，她的步伐就变得更加坚定。[say:谢谢你……]");
         outputText("[pg]魅魔继续走着，离开了这个地方。");
         saveContent.freedSucc = true;
         decision();
      }
      
      public function fight() : void
      {
         saveContent.aggressive = true;
         startCombatImmediate(new Lumberjack());
      }
      
      public function executeSucc() : void
      {
         clearOutput();
         outputText("你根本没打算放过她。你紧握新斧头，挥向魅魔头部的侧面。轻松劈开头骨的感觉让你对这把新工具的锋利程度感到满意和自信。");
         get_player().upgradeDeusVult();
         decision();
      }
      
      public function execute(param1:Boolean) : void
      {
         clearOutput();
         outputText((param1 ? "现在已经完全满足了，" : "他已经做出了选择，所以") + "你高高举起他的斧头。他靠这把斧头为生，也将死于这把斧头。你挥下它，劈开他的头骨。他颤抖了一会儿，然后咳嗽和打喷嚏出血，直到很快他一动不动地躺着。");
         saveContent.executed = true;
         get_player().upgradeBeautifulSword();
         end();
      }
      
      public function execEncounter() : void
      {
         meet();
      }
      
      public function end() : void
      {
         var timeUsed:int;
         var _g:Camp;
         outputText("[pg]一切尘埃落定，你现在可以随意搜刮这里的东西了。你花时间整理了所有你可能需要的工具，确保你能一次性带走所有能拿的东西。当你评估那堆准备使用的切割木材时，你意识到要拿走所有有价值的东西，跑好几趟是不可避免的。在接下来的几个小时里，你收集了所有容易收集的物资……[pg]");
         if(!get_player().hasKeyItem("Carpenter\'s Toolbox"))
         {
            get_player().createKeyItem("Carpenter\'s Toolbox",0,0,0,0);
            outputText("[b:(获得关键物品：木匠工具箱)][pg-]");
         }
         get_camp().cabinProgress.incrementWoodSupply(50);
         get_camp().cabinProgress.incrementNailSupply(100);
         _g = get_camp();
         timeUsed = 3;
         doNext(function():void
         {
            _g.returnToCamp(timeUsed);
         });
      }
      
      public function encounterName() : String
      {
         return "lumberjack";
      }
      
      public function encounterChance() : Number
      {
         if(saveContent.encountered ? saveContent.encountered : FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2004) < 4)
         {
            return 0;
         }
         return 1;
      }
      
      public function defeated2() : void
      {
         if(saveContent.aggressive)
         {
            outputText("[pg][Walking]了一小段距离，你发现棚屋没有任何锁紧装置，便走了进去。进去后，你开始挑选看起来有用的东西：锤子、手锯、工具箱等等。这一切似乎都是你预料中这种建筑里会有的东西。");
            outputText("[pg]挂在棚屋后面的是一张非常大的棕色毛皮，起初并没有引起你的注意，直到你听到毛皮后面传来呜咽声。你扯下毛皮，看到一只魅魔被锁在墙上。她浅紫色的皮肤有点脏，还有点瘀伤。还有一些小血迹，特别是她的大腿内侧。她的嘴被口塞堵住了，所以除了几声呜咽外，她发不出任何声音。她半睁着淡褐色的眼睛，恳求地看着你。");
            outputText("[pg][if (cor > 50) {你把注意力转回木工用品上，设法找到了一些有用的图纸和计划。这在很大程度上有助于你建造结构坚固的房屋和家具等东西。魅魔无力地挣扎着，对着你发出更大的呜咽声。你叹了口气，|不管是不是恶魔，}]你都不能无视这个伤痕累累的女孩。至少，你要取下她的口塞，听听她怎么说。");
         }
         else
         {
            outputText("[pg]魅魔挣扎的声音更大了，打断了你对战利品的关注。你确实意识到她是个恶魔，然而，当她呜咽时，你发现这是一件你无法忽视的事情。你取下她的口塞，看看她要说什么；之后你再决定怎么处置她。");
         }
         outputText("[pg][say: 谢谢你！]她惊呼道。口塞在她脸上留下的痕迹似乎非常深，甚至留下了疤痕。[say: 我被困在这里的时间比我记得的还要长。求求你，为了感谢你，我什么都愿意做。你能放了我吗？]");
         menu();
         addNextButton("释放",free).hint("一个受尽折磨的女孩，不管是不是恶魔，都毫无疑问地赢得了自由的权利。");
         addNextButton("操她",fuck).hint("什么都愿意？让她用魅魔应有的方式来感谢你。");
         addNextButton("处决",executeSucc).hint("她是个恶魔。杀了她。");
         addNextButton("离开",leaveSucc);
      }
      
      public function defeated(param1:Boolean) : void
      {
         clearOutput();
         if(saveContent.aggressive)
         {
            outputText("樵夫倒下了，完全不是英格纳姆勇者的对手。你从他身上拿走了他的斧头，注意到它在木工方面的价值。这毫无疑问是有用的，当你仔细思考目前的处境时，你觉得可以利用他相当多的物资。既然他已经被解除了武装，并且" + (param1 ? "被打得毫无威胁" : "绝望地只顾着自己") + "，你顺着这个思路，开始搜刮他的棚屋。");
            get_combat().cleanupAfterCombat(defeated2);
         }
         else
         {
            outputText("樵夫倒下了，完全不是英格纳姆勇者的对手。你从他身上拿走了那把被污染的伐木斧，感受着它那用来砍树的刀刃的重量和它那邪恶的气息。你一碰到它就知道，这把斧头曾被恶魔使用过，而且是用在邪恶的途径上。既然他已经被解除了武装，并且" + (param1 ? "被打得毫无威胁" : "绝望地只顾着自己") + "，你开始环顾棚屋。你注意到一小堆纸，仔细一看，似乎详细记录了一些建筑图纸。看来他的专业知识并不是特别有用，只要你在遇到麻烦时有基本的遵循指示的能力就行。为了安全起见，你可以杀了他，并且仍然可以利用他的工具来进行个人项目。");
            get_combat().cleanupAfterCombat();
            get_inventory().takeItem(get_weapons().FEL_AXE,defeated2);
         }
      }
      
      public function decision() : void
      {
         var raped:Boolean;
         var _g3:LumberjackScene;
         var genitals2:int;
         var _g2:LumberjackScene;
         var genitals1:int;
         var _g1:LumberjackScene;
         var genitals:int;
         var _g:LumberjackScene;
         outputText("[pg]处理完那件事后，[if (cor < 30) {你的注意力转向了木工用品，你设法找到了一些有用的图纸和计划。这在很大程度上有助于你建造结构稳固的房屋和家具等。然而，在你开始收集战利品之前，还有另一件事你需要处理；}]你回到那个蜷缩成一团的樵夫身边，发现他仍然筋疲力尽地躺在地上。男魅魔抬头看着你，眼神闪烁，" + (get_monster().get_lust100() >= 100 ? "勃起依然明显" : "伤得太重站不起来") + "。");
         outputText("[pg]他看着你从他那里夺走的斧头，你随意地把它拿在[hand]里。[say: 我父亲可没养出一个软弱的废物。如果你要拿走我的财产，你就得杀了我。]");
         outputText("[pg]对于一个已经输了的人来说，这话可真够硬气的。如果你不处决他，他似乎打算在很长一段时间里做你的眼中钉，但如果你有这个兴致，满足你肉体需求的选择可以排在前面。");
         menu();
         _g = this;
         genitals = get_player().get_gender();
         addNextButton("强暴",function():void
         {
            _g.rape(genitals);
         });
         if(get_player().hasVagina())
         {
            _g1 = this;
            genitals1 = 2;
            addNextButton("阴道交",function():void
            {
               _g1.rape(genitals1);
            });
         }
         else if(!get_player().isGenderless())
         {
            _g2 = this;
            genitals2 = 0;
            addNextButton("肛交",function():void
            {
               _g2.rape(genitals2);
            });
         }
         _g3 = this;
         raped = false;
         addNextButton("处决",function():void
         {
            _g3.execute(raped);
         }).hint("他是个恶魔。杀了他。");
         addNextButton("饶恕",spare);
      }
      
      public function debugMenu(param1:Boolean = true) : void
      {
         get_game().debugMenu.debugCompEdit(saveContent,new SaveContent(null,null,null,null));
      }
      
      public function borrowTools() : void
      {
         var borrow:Boolean;
         var _g:LumberjackScene;
         clearOutput();
         outputText("你解释说，他关于木工的详细介绍激起了你进一步发展营地的兴趣。这个恶魔是否愿意把工具借给你，也许还能提供一些专业知识？在你的旅途中，一个更像家的地方会大有帮助。");
         outputText("[pg]伐木工笑得合不拢嘴。[say: 当然！如果你有钱，甚至可以买一些我的木材马上开工。专业知识是免费的，毕竟在这个年代，有好的陪伴本身就是一种奖励。]这是个好消息，有经验丰富的木匠帮忙，你能完成很多事情，而且获取木材或宝石也不是太不切实际。[say: 我的棚子里有一把备用的伐木斧，比较通用。里面还有一些其他基本工具，但要砍树，你需要一把砍伐斧。我木屋里还有一把多余的，你可以先去棚子里挑你想要的，我去拿那把斧头。]");
         outputText("[pg]总而言之，听起来是个简单的计划，你起身去查看那个棚子。");
         _g = this;
         borrow = true;
         doNext(function():void
         {
            _g.reveal(borrow);
         });
      }
      
      public function attack() : void
      {
         saveContent.encountered = true;
         clearOutput();
         outputText("你是来杀恶魔的，你打算杀恶魔。看到你准备好你的[weapon]，恶魔犹豫了一下，举起双手。他喊道，[say:我没有敌意，我只是想打个招呼！]");
         outputText("[pg]看着他深棕红色的皮肤、邪恶的角、翅膀和箭头状的尾巴，你毫不怀疑他是一个恶魔。你相信他吗？");
         menu();
         addNextButton("交谈",talk);
         addNextButton("战斗",fight);
      }
      
      public function askSex() : void
      {
         var borrow:Boolean;
         var _g:LumberjackScene;
         clearOutput();
         outputText("不用说，一个过着乡村伐木生活的健壮男人其实非常有吸引力。你表达了自己的感受，怀疑一个恶魔会对免费的性爱有什么抵触。不出所料，他挑起了一侧眉毛，显得很感兴趣。");
         outputText("[pg][say: 我想你能看出来，最近没多少旅行者经过。我非常乐意特别款待我的客人，]他说道，身子前倾，手肘撑在膝盖上。[say: 我相信我的棚子里有一些你会喜欢尝试的玩具，不如你去挑挑看，我先去梳洗一下？]");
         outputText("[pg]现在轮到你挑眉了，既好奇又感兴趣。你站起身，伸展了一下身体，放松肌肉，然后[walking]走向那个棚子。");
         _g = this;
         borrow = false;
         doNext(function():void
         {
            _g.reveal(borrow);
         });
      }
   }
}

