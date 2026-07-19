package classes.scenes.npcs
{
   import classes.CoC;
   import classes.Cock;
   import classes.CockTypesEnum;
   import classes.DebugMenu;
   import classes.DynStat;
   import classes.ImageManager;
   import classes.MasteryLib;
   import classes.Monster;
   import classes.Player;
   import classes.SelfDebug;
   import classes.StatusEffects;
   import classes.Time;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.globalFlags.KGAMECLASS;
   import classes.internals.Utils;
   import classes.items.ConsumableLib;
   import classes.items.UseableLib;
   import classes.items.Weapon;
   import classes.parser._Parser.TagFun_Impl_;
   import classes.saves.SelfSaver;
   import classes.saves.SelfSaving;
   import classes.scenes.Camp;
   import classes.scenes.combat.Combat;
   import classes.scenes.npcs._HelSpawnScene.SaveContent;
   import classes.scenes.npcs.pets.Akky;
   import coc.view.CoCButton;
   import flash.Boot;
   import haxe.IMap;
   
   public class HelSpawnScene extends NPCAwareContent implements SelfDebug, SelfSaving
   {
      
      public var saveVersion:int;
      
      public var saveName:String;
      
      public var saveContent:SaveContent;
      
      public var helspawnMaleSurpriseLastChoice:int;
      
      public var globalSave:Boolean;
      
      public function HelSpawnScene()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         helspawnMaleSurpriseLastChoice = 0;
         globalSave = false;
         saveVersion = 1;
         saveName = "helspawn";
         saveContent = new SaveContent(null,null,null,null,null,null,null);
         super();
         SelfSaver.register(this);
         DebugMenu.register(this);
      }
      
      public function youWantAGirl() : void
      {
         clearOutput();
         spriteChooser();
         outputText("[saystart]是啊，有个女孩会很棒的。");
         if(get_player().hasCock() && !get_player().hasVagina())
         {
            outputText("我不知道你从小有没有姐妹，[name]，但我得警告你：一个小女孩，尤其是一个小蝾螈女孩，绝对是个大麻烦。但我能想象出她长大后的样子，你拿着一把大剑，威胁每一个想打她主意的男孩：“对她好点，不然你就得面对勇者了。嗷呜。”");
         }
         else
         {
            outputText("不过用不了多久，我们就会变成一群叽叽喳喳的女孩了。蝾螈长得很快，[name]……我只希望她不要变成我这样，你知道吗？我不知道我能不能忍受看到我的小女孩变成像她妈妈一样的荡妇。毕竟，我可能会嫉妒的……");
         }
         outputText("我们的女儿绝对会是个大美人，记住我的话。她还在襁褓里的时候，就能让魅魔看起来像只癞蛤蟆。[sayend]");
         outputText("[pg]你和你的爱人相视一笑，然后给了她一个吻，最后拍了拍她的肚子——感受着你的孩子对你的反应，轻轻地踢了一下。");
         doNext(playerMenu);
      }
      
      public function youWantABoy() : void
      {
         clearOutput();
         spriteChooser();
         outputText("[saystart]是吗？嗯，我能想象得出来。");
         if(get_player().hasCock() && !get_player().hasVagina())
         {
            outputText("如果我是个男人，我也想要个强壮的儿子一起玩。带他去钓鱼，教他像你一样战斗……你会是个好爸爸的，亲爱的。我确信你会的。");
         }
         else
         {
            outputText("你知道吗，这儿有个男人挺好的。我想念在家乡和男孩们混在一起的日子，看着他们像孔雀一样在每个路过的女孩面前炫耀。");
         }
         outputText("而且我的儿子绝对会是个真正的少女杀手，记住我的话。用不了多久，我们就得击退成群结队的地精荡妇，她们都想从我们英俊的小男孩身上分一杯羹。[sayend]");
         outputText("[pg]你和你的爱人相视一笑，然后给了她一个吻，最后拍了拍她的肚子——感受着你的孩子对你的反应，轻轻地踢了一下。");
         doNext(playerMenu);
      }
      
      public function yesHeliaILoveYourButtHoleReaming() : void
      {
         clearOutput();
         spriteChooser();
         outputText("你微笑着答应了她。这只蝾螈高兴地欢呼起来，扑进你的怀里亲吻你，把你抱得紧紧的，以至于当她结束亲吻，胸口起伏着退后一步时，你感觉自己都快要晕过去了。");
         outputText("[pg][say: 那、那你之前为什么不告诉我？]她问道，把脸颊在你的[chest]上蹭了蹭。[say: 本来可以省去我这么多麻烦的。]");
         outputText("[pg]你耸了耸肩，说你直到现在才觉得有机会……而且她结结巴巴地表白时要可爱得多。赫莉娅轻轻捶了一下你的肩膀，但随后又在你的[chest]和脖子上落下了一连串的吻，紧紧地抱着你，你们俩沉浸在刚刚吐露的爱意中。不过几分钟后，赫尔退后一步说道，[saystart]我全心全意地爱你，[name]。如果你愿意接受我，你就是我想共度余生的人。但我还是得告诉你出了什么问题。我之所以提起这些，是因为：");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,962,1);
         heliaLoveFollowup();
      }
      
      public function umYum() : void
      {
         clearOutput();
         outputText("嗯，好吃？");
         if(get_player().hunger > 25)
         {
            outputText("[pg]你畏缩着，把递过来的碗放回原处，尖声说这很好吃，非常感谢，但你现在有事要处理；也许你以后可以多吃点。奇哈翻了个白眼，把你赶走，然后她和[helspawn]用勺子舀出她们的午餐。");
            outputText("[pg]当你游荡着寻找可以呕吐的地方时，");
            get_player().refillHunger(5);
         }
         else
         {
            outputText("[pg]你畏缩着，正要把递过来的碗放回原处，但你咕咕叫的肚子提醒了你。你别无选择，只能捂住鼻子，把炖菜里的东西咽下去。");
            get_player().refillHunger(25);
            outputText("[pg]你觉得有点恶心。那炖菜确实很奇怪。");
            if(Utils.rand(3) == 0)
            {
               outputText("[pg]倒吸一口凉气！你觉得你要吐了。你站起来，冲到灌木丛后面。你突然弯下腰，把胃里的东西从嘴里吐到地上。过了一会儿，你终于恢复过来，站了起来。");
               get_player().takeDamage(get_player().maxHP() / 4);
               get_player().damageHunger(Utils.rand(10) + 15);
               dynStats(DynStat.Lib(-10));
               dynStats(DynStat.Lust(-100),DynStat.NoScale);
            }
            outputText("你放下做好的碗，然后");
         }
         outputText("听到两个长着鳞片的女士发出标志性的呻吟和干呕声，她们刚刚意识到自己做出了什么样的怪物。");
         outputText("[pg]也许你应该开始在这里做饭了……");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function talkToHelspawnJustTalk() : void
      {
         outputText("[pg][helspawn]不应该遭受舒尔德拉的恶作剧。你无视了幽灵，专注于对话，享受着你女儿对战斗的热情拥抱，然后，最终，继续你的[day]。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function talkToHelspawn() : void
      {
         var _loc2_:* = null as IMap;
         clearOutput();
         var _loc1_:int = Utils.rand(6);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,969) == 0)
         {
            _loc2_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc2_,969,FlagDict_Impl_.arrayReadInt(_loc2_,969) + 1);
            outputText("你和[helspawn]坐下来，告诉她你需要谈谈；具体来说，是关于她夜间的冒险经历。她咽了口唾沫，在原地不安地挪动着，" + (FlagDict_Impl_.arrayReadBool(KFLAGS.flags,3000) ? " 回想起发生的事情，" : "") + "但你用安慰的手和令人安心的话语缓解了她的紧张。[Helspawn]已经是一个成年女性了，尽管这对她和[if (isfeminine) {Helia|她母亲}]来说可能很可怕——更不用说[i:你]自己对此的想法了。尽管如此，她在身体能力和性冲动方面都像成年人一样，但生活经验却远不如[if (isunderage) {甚至}]你。担心是有道理的。");
            outputText("[pg]你的女儿尴尬地笑了笑。[say: 抱歉未经邀请就把我的朋友带回家。我只是……不想让你不高兴。我爱你，[dad]，]她说着，把头靠在[if (height < 75) {你的头上|你的肩膀上}]，并用尾巴环绕着你。你回应了这种情感，紧紧抱住这只年轻的蝾螈。[if (!helspawnchaste) {即使她想变得像[if (isfeminine) {Helia|妈妈}]一样，她也不应该开始操所有会动的东西。外面的许多怪物都很危险，而她还不是她父母那样的战士。|她应该知道不要把怪物从荒野里带出来打一炮。她不是[if (isfeminine) {Helia|她母亲}]，欲望不必主宰她的生活。}]");
            outputText("[pg]也许你可以更多地了解她的这个蜘蛛男孩。他实际上有名字，而且似乎相当有礼貌[if (allowchild) { 对于一个孩子来说}]。对她来说是件幸运的事。话又说回来，你可以告诉她要保护好自己，完全停止尝试和东西做爱。");
            outputText("[pg]在接近她之前，你有时间考虑这件事。在她可能带回家的所有东西中，那只蜘蛛[if (cor > 33) {相当可爱|[if (allowchild) {只是个小男孩|从表面上看相对没有威胁}]}]，这可能是她第一次涉足约会的一个足够健康的尝试。[if (cor > 66) {如果心情好的话，你会感谢自己手边有这个像女孩一样的男孩可以玩耍。 }]另一方面，她几乎没有体验过这个世界，现在停止这一切可能是最健康的。[if (!helspawnvirgin or cor > 66 or lust+libido>75) {不用说|现在的世界}]，你当然是满足她性需求的最安全的选择……");
            menu();
            addButton(0,"停止做爱",dontFuckAlex).hint("她需要时间先学习并成长为一个独立的人。");
            addButton(1,"她的男友",helSpawnBoyfriend).hint("了解更多关于这个男孩的信息，也许有时会看到他。");
            addButton(2,"乱伦",incestWithHelspawn).hint("目前她唯一应该在一起的人就是你。");
         }
         else if(_loc1_ <= 0 && followerKiha())
         {
            outputText("[say: 噢，嘿，" + championRef() + "！你得来看看我在做什么！]");
            outputText("[pg]她抓住你的[armor]，把你拉回她刚才站的地方，靠近营地中心。一个大铸铁锅放在你的火坑上，里面装满了正在冒泡的深绿色物质。你那暗黑色的龙女情人奇哈正坐在锅边，显然对滚烫的温度免疫，她灵巧的爪子间握着一把长木勺。当你和你的女儿走过去时，她抬头对你咧嘴一笑。[say: 嘿，笨蛋，来早点尝尝吗？]");
            outputText("[pg][say: 来吧，" + championRef() + "，尝尝看！] [helspawn] 开心地补充道。[say: 这可是奇哈阿姨最拿手的食谱。]");
            outputText("[pg][say: 等着瞧吧，小笨蛋，这也会成为你最喜欢的，] 龙女笑着说，她的脚绕着锅边又缓慢而平稳地转了一圈，搅拌着里面的食材。奇哈对你咧嘴一笑，举起勺子，让你从她的脚趾间接过去。当你把它凑到嘴边时，那股强烈的恶臭几乎让你窒息，差点让你站不稳。玛莱啊，奇哈到底在里面<i>放了</i>什么？生屁股吗？");
            if(get_kihaFollowerScene().saveContent.badCookingTasted == 0)
            {
               get_kihaFollowerScene().saveContent.badCookingTasted = 1;
            }
            menu();
            addButton(0,"天哪好恶心",ohGodEwKihaAndHelspawnSuckAtCooking);
            addButton(1,"嗯，好吃？",umYum);
         }
         else if(_loc1_ <= 1 && get_rathazul().followerRathazul())
         {
            outputText("[say: [helspawn]！] 你听到一个沙哑苍老的声音喊道，[say: 马上给我回来！我还没检查完呢！]");
            outputText("[pg][say: 来了！] [helspawn] 回应道，这时拉萨祖尔拖着步子走了过来，手里挥舞着一把看起来像小锤子的东西。[helspawn] 凑近你小声说：[say: 你能陪我一起去吗，" + championRef() + "？拉萨祖尔让我觉得怪怪的。]");
            outputText("[pg]你轻笑着点点头，跟着 [helspawn] 回到拉斯的临时实验室，看她在其中一张桌子上坐下。老鼠一边嘟囔着关于孩子的话，一边用他的小锤子敲打她的膝盖——差点被她一脚踢在脸上——然后让她屏住呼吸，听她的心跳。她憋得脸都快发紫了，他才满意地点点头，告诉她可以走了。[helspawn] 跑开了，很高兴能逃离这里。拉斯转向你，摇了摇头。");
            outputText("[pg][saystart]只是给她做个检查，[name]。她惊人的生长速度有些令人担忧——而且，如果我能找出原因，或者能大规模复制的话，这在科学上也会很有研究价值。");
            if(get_amilyScene().amilyFollowerPure())
            {
               outputText("小艾米莉的药剂充其量只是个权宜之计，而且那些孩子我也研究不到。不过。");
            }
            outputText("想象一下，如果能用和地精一样短的时间培育出一整支军队。只要数量能和恶魔抗衡，我们或许就有了一战之力。[sayend]");
            outputText("[pg][say: 但我想这目前还遥不可及，[name]。她已经停止生长了，而且也找不到合成这种化合物所需的关键化学物质。我会继续关注她的健康状况，也许有一天我能找到让加速生长变得安全且普及的方法。一个老头子总能抱点希望，不是吗？]");
            doNext(get_camp().returnToCampUseOneHour);
         }
         else if(_loc1_ <= 2 && milkSlave() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,870) > 0)
         {
            outputText("[say: 嘿，" + championRef() + "，你看到 [bathgirlname] 了吗？] [helspawn] 环顾营地问道。[say: 妈妈让我去挤她的奶，但我到处都找不到她。她不会跑了吧？]");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,870) == 1)
            {
               outputText("[pg]你告诉她，她顶多是摇摇晃晃地走开，不过");
            }
            else
            {
               outputText("[pg]你怀疑她不会这么做；[bathgirlname] 似乎对你有点意思，不过");
            }
            outputText("到处找找也没坏处。她确实时不时会误入营地周围的陷阱。你向 [helspawn] 伸出手，开始在营地里寻找失踪的挤奶女仆。你们俩绕着营地转了一圈，检查了陷阱，找遍了各种岩石和坑洼，但一无所获。最后，正当你开始为这个黑皮肤的女仆感到担忧时，你碰巧看了一眼她营地那边的钢制水池。果然，你发现 [bathgirlname] 蜷缩在水池底部，裹着一条破旧的毯子在打盹。");
            outputText("[pg][say: 噢，] [helspawn] 咧嘴一笑，低头看着正在打盹的 [bathgirlname]。[say: 看来我只能晚点再挤了。]");
            menu();
            addButton(0,"晚点再挤",helSpawnSureMilkHerLater);
            addButton(1,"现在就挤",helSpawnMilkHerNow);
         }
         else if(_loc1_ <= 3 && isabellaFollower())
         {
            outputText("[say: 嘿，" + championRef() + "！] [helspawn] 突然咧嘴一笑，说道：[say: 妈妈在镇上给我买了一把新吉他。想来听听吗？]");
            outputText("[pg]你无法拒绝，只是暗自纳闷她那巨大的爪子要怎么弹吉他。她把你带回她和赫莉娅的营地，很快就拿出一把破旧的吉他。看来赫尔去过当铺了，不过嘿，[helspawn] 似乎并不介意。她跳到附近的一块石头上，试着拨弄了几下琴弦，停下来调了调音，又修好了一根容易断的弦。准备了一会儿后，她准备好了。");
            outputText("[pg]随着[helspawn]灵巧的手指在琴格上舞动，一首柔和悦耳的曲调开始响起。她拨弄琴弦时还有些许犹豫，显然是个初学者，但弹得相当不错。这首简单的曲子很甜美，她弹奏得越来越熟练，慢慢地融入了曲子的节奏中。你可以闭上眼睛放松下来，让她的琴声抚慰你，带走你的烦恼。你几乎没有注意到，一个高亢柔和的声音加入了吉他声中，那是一个轻快而萦绕心头的女高音。随着年轻蝾螈的弹奏变得激烈，歌声的力量也慢慢增强，逐渐走向高潮。她确实在唱歌，但歌词是陌生而不可知的；你有一瞬间觉得，也许那是赫莉娅的母语。但当第二个充满力量、宛如歌剧般的声音加入[helspawn]的歌声时，你就知道是谁在教她了。");
            outputText("[pg]当伊莎贝拉走近时，你睁开了一只眼睛。她用那种奇怪的语言高唱着一首令人热泪盈眶的诗句，你几乎能感受到她的思乡之情，以及她与一生挚友和亲人分离的痛苦。当她的双臂交叉在巨大的乳房下时，你忍不住想起了她所经历的变异");
            if(get_player().get_race() != "human")
            {
               outputText("，而你自己也同样遭受了苦难");
            }
            outputText("。你微笑着看着伊莎贝拉在[helspawn]身边坐下，两人的声音汇合在一起，唱出最后的合唱。当[helspawn]弹奏出最后那绝望的音符，在激情中几乎要抓破琴弦时，她们俩都颤抖起来。");
            outputText("[pg][saystart]");
            if(!isabellaAccent())
            {
               outputText("Sehr gut");
            }
            else
            {
               outputText("非常好");
            }
            outputText("，小[helspawn]，[sayend]伊莎贝拉说着，给了年轻的蝾螈一个大大的拥抱，差点把她闷在牛娘巨大的胸脯之间。你咧嘴笑着，祝贺[helspawn]的表演，对你的女儿大加赞赏，然后离开，把她留给伊莎贝拉指导。当你走开时，你忍不住注意到赫莉娅站在不远处，揉着眼睛。");
            outputText("[pg]当你走近时，你的爱人对你微笑着说：[say: 我小时候一直想成为一名吟游诗人。我……我很高兴[helspawn]至少得到了这个机会。]");
            doNext(get_camp().returnToCampUseOneHour);
         }
         else if(_loc1_ <= 4)
         {
            outputText("在回忆你在英格纳姆的日子时，你想起了父母把孩子背在背上，他们如何欢笑和增进感情的时光。你提议背[helspawn]一程。");
            outputText("[pg][say: 诶？我是个成年人了，[dad]，" + (get_player().get_tallness() < 78 ? " 而且我比你还大！" : "") + "]她回答道。在你的家乡，一个人至少要活过十几年，甚至二十几年才算成年！不管她觉得自己有多大，对你来说她<i>仍然</i>是个孩子，你<i>必须</i>和她增进感情！");
            outputText("[pg]你无视了她的抗议，转过身去，把她背了起来。[say: [Dad]！这太荒谬了！]你的女儿惊呼道，尽管她一直在笑。[say: 你<b>没必要</b>这样做，我很乐意像个正常人一样和你增进感情。]");
            outputText("[pg]她在胡说八道，这<i>很</i>正常。仅仅因为她有[if (metric) {将近两米|六英尺多}]高而且肌肉发达，并不意味着她可以免于被背着。你背着[helspawn]在营地里转悠，她把脸埋在手里，又笑又咯咯地叫，直到她平静下来。很快，你发现了她的" + get_player().mf("","另一个") + "妈妈。");
            outputText("[pg]赫莉娅看到你们俩[walking]过来，笑了起来。[say: 哇，玩得开心吗？]");
            outputText("[pg][say: 妈——妈，告诉[dad]我是个成年人了，[he]说[he]不接受，][helspawn]抱怨道。");
            if(get_player().isTaur())
            {
               outputText("[pg]赫莉娅咧嘴笑着说：[say: 见鬼，不！我也要加入你们。]当狂战士跳上你另一个乘客的后面时，你的女儿叹了口气，皱了皱眉。安顿好后，赫莉娅宣布：[say: 前进，强大的骏马！一家人骑马出征！]");
               outputText("[pg]这一次，你开始真正地飞奔起来，向蝾螈们展示你真正的力量。为了不掉下去，[helspawn]紧紧抱住你的躯干，赫莉娅也为了好玩而紧紧抱住她。");
            }
            else
            {
               outputText("[pg]赫莉娅咧嘴笑着说：[say: 永远不会因为太大而不能被背着，[helspawn]！事实上，你们俩都不算大！]蝾螈转过身抓住你，把你和[helspawn]同时举了起来。看来永远不要怀疑狂战士的力量。");
               outputText("[pg]你的女儿呻吟道：[say: 这变得更蠢了。]");
               outputText("[pg]不可否认，这对你来说是个非常尴尬的姿势。尽管如此，当这位火爆的战士继续前进时，你还是靠在了她身上。");
            }
            doNext(helSpawnPiggyback);
         }
         else if(_loc1_ <= 5 && followerShouldra())
         {
            outputText("这位身材健美的爬行动物兴奋地谈论着她上次和赫莉娅的切磋有多顺利，与此同时，你脑海深处的一个声音打断了你试图进行的对话。在[helspawn]不知情的情况下，你能听到某个幽灵居民在对你说话。");
            outputText("[pg][say: 勇者，我有个主意！] 舒尔德拉宣布道。然而，你不能说你知道她在指什么。[say: 一个绝妙的恶作剧，就是这个！]");
            outputText("[pg]你的蝾螈女儿喋喋不休地说着，尽管她的表情表明她察觉到了你表情的变化。无论舒尔德拉想建议什么，都已经让你分心了，但你还是顺着她，听她把话说完。");
            outputText("[pg][say: 我们会给这小妞展示一场真正的切磋挑战，相信我。和她打一场！]");
            outputText("[pg]讽刺的是，“相信我”反而让你更难相信她。");
            menu();
            addNextButton("切磋",helspawnSparPrank).hint("上吧，小幽灵。");
            addNextButton("只是聊天",talkToHelspawnJustTalk);
         }
         else
         {
            outputText("不幸的是，目前似乎没有什么特别的话题可聊。你们俩在友好的宁静中度过了一段时间，闲聊着。");
            doNext(get_camp().returnToCampUseOneHour);
         }
      }
      
      public function swordAndBoardmander() : void
      {
         clearOutput();
         spriteChooser();
         FlagDict_Impl_.arrayWriteString(KFLAGS.flags,959,"scimitar and shield");
         outputText("你告诉赫尔休息一下：这里交给你了。你从补给中抓起一些引火物和绳子，几分钟后，你就拼凑出了一对小巧的、隐约像剑一样的练习武器。你把其中一把扔给年轻的蝾螈，告诉她过来拿。");
         outputText("[pg][helspawn]挥舞了几下剑刃作为练习，然后双手握住木剑向你冲来。你摆出防御姿势，接住她第一记过顶劈砍并将其拨开，差点把女孩绊倒。她顺势翻滚，转出你的防御范围，试图从侧面发动攻击。你格挡住它，抓住一个破绽，在她的肩膀上狠狠地敲了一下。如果是真刀，她的手臂差点就被砍断了，但[helspawn]只是踉跄着后退，痛得大叫。");
         outputText("[pg]你告诉她再来一次，摆出你的战斗姿势。");
         outputText("[pg]她大喊着战吼向你扑来，挥剑直取你的咽喉。你敏捷地闪向一旁，让她从你刚才站立的地方摔了过去，并在她飞过时顺手拍了一下她的屁股。她重重地摔在地上，吃了一嘴泥，揉着屁股。");
         outputText("[pg][say: 哎哟。不公平。站着别动，" + championRef() + "！]");
         outputText("[pg]你叹了口气。再来。");
         outputText("[pg][helspawn]爬起来，紧紧握住她的剑。这次她谨慎多了，慢慢靠近，在刚好够不到的地方停下。你掩饰住笑意，举起自己的剑，剑尖几乎碰在一起。你告诉她，她走在正确的道路上——没必要鲁莽，一有机会就冲上去很可能会让她送命。");
         outputText("[pg][say: 揍" + get_player().mf("他","她") + "，[helspawn]！] 赫尔在场边喊道，一边喝着马克杯里的东西。[say: 给[him]看看蝾螈的厉害！]");
         outputText("[pg]你的女儿稳住身形，在发动攻击前一秒深吸了一口气，暴露了她的意图。你格挡了三次快速的攻击，在[helspawn]跃起进行另一次过顶打击时后退。你闪避开来，从攻击中旋身而出，在光裸的肚子上划了一刀。");
         outputText("[pg][say: 呃！] 她叫道，踉跄着跪倒在地。[say: 我-我不行了……]");
         outputText("[pg]你把[helspawn]拉起来，揉了揉她的头发。你安慰她，告诉她不要放弃，从你的装备里拿出一个餐盘和一些皮带。不一会儿，你就拼凑出了一个简易的盾牌。你把它套在小蝾螈空闲的手臂上，并给了她一些关于站姿的指导。她紧张地举起临时盾牌对着你，在盾牌的重量下显得有些局促不安，你缓慢而轻松地挥舞了几下，让她习惯格挡。你稳步加快节奏，挥舞训练剑的速度越来越快，力度越来越大，迫使[helspawn]招架和格挡，在你的猛攻下节节败退。你坚持了整整一分钟才放慢速度，让孩子掌握主动权。她向你挥剑，随着你的每一次格挡顺势翻滚，劈出另一剑，用她的盾牌挡开你的反击，并迫使你后退。");
         outputText("[pg]当[helspawn]设法划伤你时，你痛苦地皱了皱眉，她用盾牌挡开了你的一次攻击，并从你防守留下的空隙中击中你。你笑着揉了揉肩膀，告诉她她似乎已经掌握了使用那个盾牌的诀窍。");
         outputText("[pg][say: 谢谢，" + championRef() + "！] 小蝾螈咧嘴一笑，抱住了你。");
         outputText("[pg][say: 好了，好了，] 赫尔说着，从你手中夺过假剑。[say: 现在是时候和一个真正的战士战斗了，[helspawn]。放马过来吧！]");
         outputText("[pg]过了好几个小时，你们三个才停下来：花时间训练[helspawn]的站姿和格挡，每隔几个回合就和赫莉娅交换，让你的女儿保持警惕。不过她学得很快，很快她几乎不需要提醒就能保持盾牌举起，并稳住身形抵御赫莉娅压倒性的攻击。");
         outputText("[pg]每天晚上像这样训练几个小时，你的女儿就会成为一个配得上她父母的战士。");
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,957,FlagDict_Impl_.arrayReadInt(_loc1_,957) - 10);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function sureHelGimmeSpidahBoyDetails() : void
      {
         clearOutput();
         spriteChooser();
         outputText("赫尔轻笑了一声，摇了摇头。[saystart]所以我去了沼泽，直接大喊“谁想把孩子操进这个肥沃的子宫里，你们这些长着甲壳的混蛋”，果然，我得到了很多志愿者的回应。一大群令人毛骨悚然的爬虫从木头里钻了出来，但我看到了他们眼中的神情：全都被腐化了。我可不想我的孩子还没出生就有一半的灵魂被射出来，你懂吗？所以我进入了狂战士状态，把他们打跑了。我觉得沼泽每个月都变得越来越危险。也许是水里有什么东西，谁知道呢。总之，在我解决掉那些疯子之后，我继续深入了一点");
         if(followerKiha())
         {
            outputText("，朝着那个长着热辣翅膀的家伙以前住的地方走去");
         }
         outputText("。花了一点时间，但最终我偶然遇到了两个蜘蛛女孩，可爱极了。她们小心翼翼地走到我面前，问我是不是真的想要个孩子。所以我说，“是啊，当然”，然后她们俩都露出了那种大大的、傻乎乎的笑容。[sayend]");
         outputText("[pg][say: 她们告诉我她们是姐妹，还有一个小弟弟正在寻找他的第一个伴侣。但他很害怕直接扑上去强暴别人（有点老派，但嘿，你能怎么办呢？），而且女孩们也害怕他会被什么恶魔蛛化精灵之类的东西拖走强暴致死。所以女孩们说，如果我想繁衍后代，她们有个计划：让我假装很无助，然后她们会让她们的弟弟来攻击我；他能体验到作为强大掠食者的感觉，而我则能被精液灌满。双赢。所以她们把我带到一片空地，让我在那儿等着。几分钟后，这个小小的蜘蛛男孩从丛林里走了出来——我的意思是，他妈妈肯定是个地精，因为他就是个矮小的小屁孩，身上裹着一件长及膝盖的丝绸衬衫，而他的姐妹们却把奶子露在外面吹风。可怜的小家伙害羞极了，但他还是结结巴巴地说着要把我绑起来，对我为所欲为之类的话，你知道的。所以我假装晕倒，扔掉剑，表现得非常戏剧化，求他不要伤害我。]");
         outputText("[pg][saystart]我发誓他大概花了半个小时才真正把我绑好。他的吐丝器像小鸡巴一样到处喷丝，他不停地道歉，全身都在发抖，直到我不得不帮这个可怜的孩子把我绑好并塞住嘴。但是接下来——这才是最精彩的——他扭动着脱下了衬衫，哦，我的天哪，这孩子简直就是个该死的三脚架。我的意思是，他让牛头人都自愧不如，而且是怎么做到的。这个害羞的孩子，以前从来没有过女人，下面却藏着一个该死的怪物");
         if(get_player().biggestCockArea() >= 20)
         {
            outputText("，虽然还是比不上你，我的爱人");
         }
         outputText("。所以他现在硬得像石头一样，兴奋得发抖；他把我的双腿分得很开，一边抚摸着自己，一边对准……哎呀，进错洞了。那真是个惊喜，我告诉你。虽然不是一个</i>令人不快<i>的惊喜，但还是。他用这个巨大的东西差点把我撕成两半，一直滑到根部，然后就停了下来，好像不知道该怎么办。他只是有点呻吟，扭动了一下臀部，紧紧地抱着我，把头埋在我的胸前。[sayend]");
         outputText("[pg][say: 那么，一个女孩该怎么做呢？我很容易就挣脱了双手，用手指穿过他的头发，告诉他一切都好，他做得很好。可怜的孩子用那双巨大的小狗般的眼睛看着我，问，“真-真的吗？”好像他很震惊。该死，他真可爱。所以我给了他一个小小的吻，帮他拔出来，对准真正的目标。哦，你真应该看看他滑进去时的表情：舌头伸了出来，斗鸡眼。他差点就直接射了，但我紧紧地夹住，告诉他必须努力才能得到。我把他拉近，把他的脸埋在我的奶子里，引导他的臀部，让他慢慢地动起来。但是那个男孩，只要给他一点鼓励，他就是个天才……大约五分钟后，他就让我四肢着地，疯狂地抽插，把这个该死的怪物插进来，直到我尖叫着高潮，他也一样。哦，我们俩弄得一团糟。]");
         outputText("[pg][say: 所以最后他从我身上滚下来，瘫倒在地上，他那根巨大的鸡巴几乎快碰到他的下巴了。嗯，到那时我有点喜欢他了，所以我蜷缩在他身边，抱了抱他，告诉他他是个多么优秀的种马，是个多么棒的标本，等等。但是后来这个小混蛋张开嘴，非常小声地问我们能不能再来一次——以及我能不能在他骑我的同时用尾巴操他。哦，好吧，我怎么能拒绝呢？好吧，也许他没有</i>用那么多词问<i>，但那就是他</i>想要<i>的，我告诉你。而且他确实得到了。一次又一次，直到我把他骑得神志不清。]");
         outputText("[pg][say: 然后他的姐妹们觉得无聊，也加入了进来。]");
         menu();
         addButton(0,"继续",dontTellMeAboutSpiderboy);
      }
      
      public function sureHelGimmeMaiDetails() : void
      {
         clearOutput();
         spriteChooser();
         outputText("[say: 你知道，我在特尔阿德雷到处走动可不容易。我大半辈子都住在鸟不拉屎的荒郊野外，广阔的平原上。但这里是一座废墟城市，挤满了废弃的建筑和成千上万的人。我花了半个晚上的时间才找到米可和舞的住处，那是在城墙附近的一个小木屋。我大概迷路了三四次，差点被一群猫人轮奸……天哪，去他妈的城市。不过不管怎样，我很幸运是舞来开的门；我猜她当时正准备睡觉。米可不在，跟某个新交的女朋友出去了。或者可能正在被猫人轮奸，因为显然那里经常发生这种事。谁知道呢。]");
         outputText("[pg][say: 哎，跟好朋友说“嘿，我想怀你的孩子。把你的鸡巴掏出来，荡妇！”这种话还是挺尴尬的。同时，如果她不知道怎么回事，就直接扒了她的裤子骑她到天亮，也不太公平。而且，除非我穿着斗篷操她，否则白色的尾巴绝对会暴露。所以，我把舞带到她们的厨房，倒了点酒，问她最近怎么样，闲聊了一会儿。这当然让她起了疑心，最后我只好说，“所以，还记得过去几周我们一起玩的时候，你一直说你有多想生孩子，但找不到好男人或好女人，而且你也不想在城里抚养你的孩子吗？是啊，所以，我也有点想生孩子，这真的很突然，但你觉得怎么样，小情人？你和我，我们生个孩子吧！”]");
         outputText("[pg][say: 我不是外交官也不是吟游诗人，但最后我还是说服了她。等我把她的睡衣扯下来时，她已经紧张得不行了，问了一堆不着边际的问题。“我能去看看吗？我们给她起什么名字？蝾螈和狐狸的混血儿会是什么样子？你想要男孩还是女孩，还是……”我笑着让她闭嘴，然后操我。好吧，等我脱下她的内裤时，那根小狗鸡巴已经肿胀得厉害，鲜红色的，带着粗大的肉结，准备把我撑开。]赫尔停下来舔了舔嘴唇，凝视着远方。[say: 她急不可耐，但我打算慢慢来，给她一个难忘的夜晚。我俯身在她双腿间，手指滑过她柔软的肌肤，舔弄她紧致的小穴，直到她的口水滴在我的舌头上。我的尾巴悄悄绕过去，开始它的工作，轻轻挑逗着她皮肤和尾巴绒毛交界处那个敏感的小地方，一路向下直到她的小菊花。天哪，当我进入她体内时，她发出了最可爱的喘息声，我的尾巴钻进她的屁股，直到找到她前列腺的凸起，开始挤奶。现在她的鸡巴已经立正敬礼了，我爬上床和她躺在一起，亲吻抚摸她那对挺拔的大乳房，直到我能感觉到她快要爆发了。我慢慢地压在她身上，向后靠在我的后腿上，直到我能感觉到她的龟头正抵在我的小穴上；哦，那时她已经在呜咽和呻吟了，抓住我的臀部试图把我拉下来，求我狠狠地操她，让她肿胀的小肉结把精液深深地射进我体内。]");
         outputText("[pg][say: 最后，连我也受不了了，我像上帝之手一样压在她身上，一口气吞下了她的肉结和所有东西。她就在那一刻高潮了，尖叫声大得足以吵醒邻居——她的手指深深地掐进我的肉里，在我的屁股上留下了抓痕。但她用精液淹没了我，直到精液从她的肉结周围流出来。我们被锁在一起了，我告诉你。但这只是再来一次的借口，我的尾巴正好抵在她的前列腺上，半分钟后她又精神抖擞了，当我开始在她的鸡巴上弹跳时，她呻吟着，就像一只……我不知道，一只性爱兔子。我们就这样持续了一个又一个小时，直到舞几乎晕过去，我们俩都沾满了汗水、精液和她留在那里的劣质润滑油。妈的，直到米可回来我们还在干，突然我又多了一个肉结撕裂我的屁眼，还有另一双手玩弄我的乳房，而我则撑着舞，把她的头埋在我的乳沟里。]");
         outputText("[pg][say: 到了日出时分，我们三个都脏兮兮的：这对双胞胎看起来就像是用精液做成的，而我每个洞都在往外喷精液。最后我设法告诉了米可她撞见了什么，她坚持要给我们做一顿庆祝早餐。她对要当阿姨感到非常兴奋，但我离开时舞已经快晕过去了——她只剩下一点力气把我拉下来，给了我一个告别吻，然后把头靠在我的肚子上，对着她花了一整夜射进我体内的宝宝低声说着可爱的甜言蜜语。]");
         menu();
         addButton(0,"继续",dontTellMeAboutMai);
      }
      
      public function spriteChooser() : void
      {
         get_helScene().spriteChooser();
      }
      
      public function spiderboyWouldBeBestDad() : void
      {
         clearOutput();
         spriteChooser();
         outputText("你告诉赫莉娅去找个蜘蛛男孩骑。她对你灿烂一笑，蹦蹦跳跳地朝沼泽跑去，一边跑一边回头喊道：[say: 谢谢你，谢谢你，谢谢你，[name]！]你猜下次见到她时，赫尔可能已经怀上了你要帮忙抚养的孩子。");
         get_game().helScene.pregnancy.knockUpForce(25,336);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,965,1);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,958,1);
         doNext(playerMenu);
      }
      
      public function spiderBrosGift() : void
      {
         clearOutput();
         spriteChooser();
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,974,1);
         outputText("当你准备出门开始新的一天时，你注意到[helspawn]在营地里蹦蹦跳跳，脖子上围着一条长长的、颜色鲜艳的围巾，与她午夜黑色的鳞片和苍白的皮肤形成了鲜明的对比。");
         outputText("[pg]你[walk]向那只显然非常高兴的蝾螈，询问她似乎新获得的配饰。");
         outputText("[pg]她咧嘴笑着，把围巾紧紧抱在怀里。[saystart]我不知道，我醒来时它就在那里，就在我旁边。我想是妈妈给我买的");
         if(isabellaFollower())
         {
            outputText("，或者伊莎贝拉阿姨可能给我织了一条新的，我不知道");
         }
         outputText("。[sayend]");
         outputText("[pg]你耸了耸肩，但当她转过身去时，你抓住了围巾的一角摸了摸。如果你摸过的话，那绝对是蜘蛛丝。当你意识到是谁做了这个时，你的脸上露出了笑容。");
         outputText("[pg]然后你意识到有人刚刚走进了你的营地，并且可能把你们都杀了。你可能应该解决这个问题。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function sparHelspawn() : void
      {
         clearOutput();
         outputText("你问[helspawn]是否准备好进行一些战斗练习，她急切地点了点头，抓起了她的武器。");
         if(helspawnSlutty())
         {
            outputText("[pg][say: 准备好被揍出屎来了吗，[if (isUnderage) {小鬼|老" + get_player().mf("头","太婆") + "}]？]她咧嘴一笑，拔出了武器。");
         }
         else
         {
            outputText("[pg][say: 对我温柔点，好吗？我还是个新手……]她说着，一边后退一边拔出武器。");
         }
         startCombat(new Helspawn());
      }
      
      public function snipermanders() : void
      {
         clearOutput();
         spriteChooser();
         FlagDict_Impl_.arrayWriteString(KFLAGS.flags,959,"bow");
         outputText("你告诉赫尔休息一下：这里交给你了。你从肩上取下弓和箭袋，递给满眼期待的女儿。[helspawn]以令人惊讶的崇敬之情接过来，像拿玻璃一样小心翼翼。你咧嘴一笑，拍了拍她的肩膀，告诉她怎么背箭袋，并纠正她的射击姿势。她花了一会儿时间才摆好姿势" + (get_noFur() ? "" : "：她那长满鳞片的爬行动物双腿，并不能自然地摆出你所采用的射击姿势") + "");
         if(get_player().lowerBody.type == 10 && !get_noFur())
         {
            outputText("，即使你也有蜥蜴腿");
         }
         outputText("，你发现自己不得不纠正了好几次她握弓柄的姿势。不过，最终你还是让她准备好射击了。");
         outputText("[pg]你滑到[helspawn]身后，把手臂搭在她的手臂上，引导她搭箭，头靠在她的拳头上，伸出一根手指指向那个干瘪的假人。");
         outputText("[pg]年轻的蝾螈喘着粗气，拉开弓弦，瞄准目标。她咬着下唇，眯起眼睛，全神贯注，想要让这第一箭命中——让你感到骄傲。她松开箭，看着它带着致命的力量飞射而出……然后飞过营地，远远偏离了目标，她倒吸了一口凉气。");
         if(get_rathazul().followerRathazul())
         {
            outputText("随着玻璃破碎的声音在营地中回荡，你听到你的老炼金术士朋友突然大吵大闹起来。[helspawn]紧张地抬头看着你，但你揉了揉她火红的头发，告诉她再试一次。拉斯可能没事。");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,498) == 1)
         {
            outputText("你听到营地对面突然传来一声痛苦的尖叫。瓦莱丽娅滑行到你面前，她黏糊糊的脸上带着恼怒的神情，用指责的手指着插在她乳房上的一支箭。[say: 该死，[name]，我是个黏液女孩，不是针垫！]你挥手打发她走，并告诉[helspawn]再试一次。");
         }
         else if(get_latexGirl().latexGooAtCamp())
         {
            outputText("你听到营地对面突然传来一声痛苦的尖叫。[latexyname]滑行到你面前，她黏糊糊的脸上带着恼怒的神情，用指责的手指着插在她乳房上的一支箭。[say: 该死，[name]，我是个黏液女孩，不是针垫！]你挥手打发她走，并告诉[helspawn]再试一次。");
         }
         outputText("[pg][say: 我——我不知道，" + championRef() + "，][helspawn]抱怨道，咬着嘴唇，眼睛追踪着箭的轨迹。[say: 也许妈妈是对的。我应该只用剑。那很简单……]");
         outputText("[pg]你叹了口气，告诉她再试一次。毕竟，她不能指望第一次尝试就完美无缺。花了一点时间说服，但很快你就让[helspawn]恢复了状态，并搭上了一支箭。你把手放在她的手上，帮助年轻的蝾螈瞄准，拉弓对准她那个塞满稻草的目标。在[helspawn]紧张的呼吸声中，你几乎听不见地低语道，[say: 放轻松。放松……很好。瞄准……现在呼气。呼气，然后松手。]");
         outputText("[pg][helspawn]再次射出一箭——这次正中目标。你看着那支箭飞过营地，带着致命的力量猛烈地击中训练假人的胯部。它摇晃着，弯曲着，然后碎成碎片。");
         outputText("[pg][say: 哎哟，]赫尔在你身后喝着酒壶里的酒，笑着说。[say: 那个可怜的假人到底对你做了什么？]");
         outputText("[pg][say: 我做到了！][helspawn]大喊着，在空中挥舞着拳头。她的母亲伸手揉了揉她火红的头发，你们俩都向她表示祝贺。");
         outputText("[pg]不过，在她得意忘形之前，你把弓推回她手里。[say: 第二课，孩子：一箭永远不够。]");
         outputText("[pg]当[helspawn]恢复射击姿势时，她的母亲已经把假人重新立了起来，准备进行第二轮。你们三个过了好几个小时才停下来：花时间训练[helspawn]的姿势和瞄准，甚至用一对匕首和她打了一回合，提醒她如果不小心，敌人最终会逼近。不过，她学得很快，很快她就几乎不需要你的帮助就能把箭射进目标的胸膛了。");
         outputText("[pg]每天晚上像这样训练几个小时，你的女儿就会成为一个配得上她父母的战士。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function slutspawnDreaming() : void
      {
         clearOutput();
         outputText("[if (builtcabin) {你的小屋门关上|你的帐篷里有什么东西在动}]的声音把你惊醒，你本能地[if (isunarmed) {握紧拳头|伸手去拿你的[weapon]}]，准备抵御伏击。");
         if(get_game().camp.saveContent.hasBeenImpSleepRaped)
         {
            outputText("是小恶魔，你知道是的。一想到他们出汗、肮脏的手掌把你按倒，他们互相咯咯笑着，他们可怕的肉棒把你撕裂，[if (corruption > 74) {让你怀疑自己为什么还要抵抗。|让你充满恐惧。你不能输。不能再输了。}]");
         }
         else if(KGAMECLASS.kGAMECLASS.camp.campGuarded())
         {
            outputText("即使你在" + KGAMECLASS.kGAMECLASS.camp.campGuardRandom() + "的监视下，最好还是不要冒险。");
         }
         else
         {
            outputText("即使你到目前为止没有遇到任何麻烦，玛瑞斯也不是一个可以放松警惕的地方。");
         }
         outputText("[pg]你费了些力气，但你还是看清了入侵者的" + (helspawnScales() == "black" ? "漆黑伪装" : "鲜红鳞片") + "，他们蹒跚着[if (builtcabin) {走进你的卧室|进入视野}]，用他们[helspawneyes]的眼睛看着你。");
         outputText("[pg][say: [Dad]，]他们低语，那个声音——是[helspawn]，不是吗？[say: 你快折磨死我了。" + (saveContent.slutspawnLastTimeSex != 0 ? "我想我们在一起，做爱。" : "我无法停止思考你说的话。我们在一起，做爱。") + "]");
         outputText("[pg]她扑通一声倒在你身边，把手臂搭在你的身上，似乎没有意识到或不在乎你醒着。当她依偎在你身边，在你的温暖中叹息时，你能闻到她呼吸中的酒味和她手上的情欲。[say: 你甚至有完美的地方。你知道，你可以在这里要我。]");
         menu();
         addButton(0,"假装",slutspawnDreamPretend).hint("保持安静，假装睡着了。");
         addButton(1,"揭穿",slutspawnDreamReveal).hint("让她知道你醒了。");
      }
      
      public function slutspawnDreamRevealYes() : void
      {
         clearOutput();
         outputText("[pg]你女儿的声音就像海妖的歌声，在你耳边乞求着、渴望着。黏糊糊的甜蜜液体包裹着你的手，每一次抚摸都让她发出愉悦的呜咽。她拥抱的温暖令人安心，你完全被[helspawn]包围了——此时，此刻，她需要你，需要她[father]的关爱。当你顺着她的阴唇向下滑动，她只为她的[daddy]呻吟时，你只能纳闷自己为什么等了这么久。");
         outputText("[pg]当你把手指缓缓插入时，她紧紧抓住你的背，咬紧牙关忍住叫声，这让你怀疑自己是否还能停下来。她那滚烫、如丝绸般的肉壁已经为你收缩，拼命想把你尽可能多地吸进去，而你毫不费力地满足了她，一次推入就直达指根。她尾巴的抽动告诉你你需要知道的一切，所以你毫不犹豫地开始在她体内抽插，确保每次都能击中让她屏住呼吸、用爪子抓挠你[skinshort]的敏感点。");
         outputText("[pg]当你再次探入时，[Helspawn]不知羞耻地揉弄着自己，[if (corruption < 21) {很难相信|简直像做梦一样}]，这就是你那只甜美的小火蜥蜴，现在正颤抖着在她[daddy]的手上磨蹭。仅仅一秒钟后，她就大叫出声，紧紧绞着你，试图榨取你[if (hascock) {还未|永远不会}]射出的精液，但你没有停下，享受着你填满女儿时她每一次粗重的呼吸。");
         outputText("[pg][say: 我爱你，[Daddy]，]当你从她深处抽出时，她终于说出了口，身体还在微微颤抖。[say: 想到你也同样爱我……]");
         outputText("[pg]她依偎在你温暖的怀里，靠着你放松下来，沿着你的[skindesc]留下一串吻，轻轻地[if (hascock) {抚摸着你的[cock]|在你的[clit]周围打圈}]。[say: 我永远不会忘记你，[Dad]。]");
         outputText("[pg][if (builtbed) {当她起身时，床发出抱怨的嘎吱声|虽然空间不大，但她还是设法}]掀开被子跨坐在你身上，她那双[helspawneyes]眼睛在月光下闪烁着光芒，与你四目相对。[say: 让我来服侍你。]");
         if(get_player().hasCock())
         {
            outputText("[pg]她俯下身，你的女儿离你的肉棒越来越近，直到你在她的呼吸下颤抖才停下来。正当你以为她可能在犹豫时，她的嘴唇微微张开，温暖而柔软地亲吻着龟头，用舌头在你的肉棒上挑逗。她继续向下，一直到[if (hasballs) {你的[balls]|根部}]，全心全意地侍弄着你。当她一路向上舔舐时，你只能更紧地抓住床单，你的肉棒滚烫而悸动，这是她第一次将它含入嘴里。");
            outputText("[pg]想想看，这就是你一直错过的东西，当你深深地插入时，你女儿火蜥蜴般的体温缠绕着你的肉棒，带来奇妙的触感，你毫不减速，直到[if (cocklength >= 6) {顶到她的喉咙|消失在她的唇间}]。看着你的[cock][if (cocklength >= 6) {被你的小女孩努力吞下|将你的小女孩填满}]，一阵酥麻感传遍了你的[if (isgoo) {全身|脊背}]，而她看向你的那[if (cocklength >= 6) {坚定的|骄傲的}]眼神，已经让你在期待中抽搐起来。");
            outputText("[pg][say: 为我忍住，[Daddy]。] 她的每一个字都逗弄着你的龟头，让你更难听从她的命令，但她似乎并不在意。相反，她抬头看了你一眼，眼中满是情欲的暗色，再次在你的肉棒上滑动，你女儿灵巧的舌头让你的[cock]涌起阵阵快感，让你头晕目眩。当她套弄你时，周围的一切似乎都褪去了，你的脑海中只剩下她嘴唇的温暖和手上的压力，两者都在尽力榨出你的精液。");
            outputText("[pg]这招很管用，尽管你拼命忍耐，但精液还是在体内翻腾。甚至现在你的肉棒已经在抽搐，渴望着释放。[Helspawn]抬起头，目光在你的眼睛上停留，同时慢慢地吞下[if (cocklength > 7) {她所能容纳的极限|你剩下的长度}]。埋在她的嘴里，你的小女孩无声地乞求着你的精液——你再也忍不住了，身体颤抖着，将自己清空在她的喉咙里。");
            outputText("[pg]面对你射出的精液，她[if (cumhighleast) {有一阵子}]甚至连眼睛都没眨一下，急切地将它们全部吞下，[if (cumextreme) {直到溢出嘴唇的精液突然将她从你的肉棒上推开。她咳出精液，但热情丝毫不减，她蹭着你的侧面，继续哄诱出更多的精液，而你则用喷涌而出的粘稠爱液浸透了她的脸颊、耳朵和火红的头发|并且仍在试图哄诱出更多}]。甚至当你终于被榨干时，她的手指还在你敏感的肉棒上轻抚，随后她[if (cumextreme) {抬起头在龟头上留下一个告别的吻|滑开身子[if (cumhighleast) {，大口喘着气|并亲吻了龟头}]}]。");
            outputText("[pg][say: 谢谢你，[Daddy]，] 她说着，已经爬到了你的身边。[say: 我爱你。]");
            outputText("[pg]说完，她依偎进你的怀里，用她令人愉悦的温暖包裹着你，渐渐进入梦乡。有女儿在身边，你也没过多久就跟着睡着了。");
            get_player().orgasm("Dick");
         }
         else
         {
            outputText("[pg]她的手指顺着你的大腿抚摸，在第一次触碰时微微停留，仿佛在惊叹[if (hasscales) {你鳞片的柔韧|你[skindesc]的柔软}]。她最轻微的触碰都让你颤抖，你女儿的眼睛紧紧盯着你，她的手悄然向上游走，用一种强烈的激情欣赏着你的身体，让你对她接下来的举动感到[if (corruption < 11) {脸红|热切期待}]。");
            outputText("[pg][if (ischild) {[say: 你……]她停顿了一下，呼出一口气，才勉强继续说道。[say: 你……你让我情不自禁，[Dad]。]|[say: 你知道我有多想亲手抚摸你吗，[Dad]？]}]");
            outputText("[pg]还没等你回应，她就俯下身，在你的胯部轻轻印下一吻。[say: [if (ischild) {你|我}]一直都是这样，好吗？]接着又在你的肚子上亲了一下，你的[skinshort]在她的触碰下微微发麻。[say: 让我感受[Daddy]的每一个部位。]");
            outputText("[pg]你的女儿继续向下，她灼热的呼吸喷洒在你身上，顺着你的身体用最轻柔的吻留下一串痕迹。再往下，她的手抚摸着[if (tailLeg) {你的尾巴|[if (isgoo) {你黏糊糊的下半身|你的双腿[if (hastail) {，同时挑逗地抚过你[tail]的根部}]}]}]，你忍不住用[if (singleleg) {它|它们}]把她缠得更紧。当你紧紧抱住她时，她脸上闪过的笑容并没有逃过你的眼睛，但这足以让你分心，让你只能凝视着她那双[helspawneyes]眼睛，看着她饥渴地悬停在你酸胀的[clit]上方。");
            outputText("[pg]它们缓慢的下降足以让你因期待而[if (isgoo) {核心悸动|心跳加速}]，你用尽了所有的克制力才没有挺起臀部去迎合她。无论如何，她将你按住，毫不犹豫地张开双唇，当她的舌头包裹住你，品尝着她[father]的味道时，你还能记得呼吸简直是个奇迹。也许你[if (corruption < 31) {本没打算让这种事发生|暗自期盼着这种事发生}]，但你的女儿[if (singleleg) {跨坐在你身上|在你双腿之间}]那[if (corruption < 31) {美丽的|罪恶而堕落的}]景象，足以让你不想改变这一切。");
            outputText("[pg]当她抽离时，一阵战栗穿透了你，她眼中沸腾的欲望在月光下熠熠生辉，那时你便知道她说的确实是实话。对她来说，你早已不仅仅是一个[father][if (allowchild) {，甚至在她自己意识到这些感情之前就已经如此|，自从[if (ischild) {[boy]们|[men]}]开始吸引她的目光起便是如此}]，而今晚的一切，早在很久以前就已注定。");
            outputText("[pg]柔软的手指拨开你的阴唇，随着她埋下头去，那里已经因你的情欲而变得湿滑，当她舌头那令人沉醉的灼热滑入其中时，你只能[if (singleleg) {扭动|蠕动}]。你女儿的欲望此刻沉浸在她所渴望的事物中，这是毋庸置疑的，但她并没有吞噬你——不，她在[i:探索]你，温柔而细致地描绘着你的肉壁，以至于[if (libido < 41) {你害怕她比你更了解你自己|连你都惊讶于她夺走了你的呼吸}]。");
            outputText("[pg]贪图更多的快感，你伸手去摸自己跳动的阴蒂，但[helspawn]拂开了你的手，将它据为己有。她的动作[if (libido < 34) {比你习惯的要激烈得多，但你无法否认它们的效果，很快|正是你喜欢的样子，没过多久}]一股热流就在你的小腹涌动，在女儿的抚摸下，你的身体感觉就像被煮[if (isgoo) {化了|沸了}]一样。当她改变动作，手指带着过分的温柔探入你的深处，而嘴唇含住你的敏感豆时，你再也忍不住了，随着高潮席卷全身，你将头向后仰倒在[bed]上。当你围绕着[helspawn]颤抖时，你身上的每一寸肌肤似乎都在嗡嗡作响、阵阵发麻，随着她的抽插慢下来，你的[if (tailLeg) {盘绕|[if (isgoo) {黏滑的拥抱|双腿}]}]将她夹得更紧了。");
            outputText("[pg]当她擦过你敏感的[clit]时，又一阵颤抖掠过你的全身，当她等你喘过气来时，你们俩几乎都在发光。在你的大腿上最后一次轻抚后，她爬到你身边，将你拥入怀中，在你恢复的时候抚摸着你的[if (hashair) {[hair]|[skindesc]}]。");
            outputText("[pg][say: 我爱你，[Daddy]。] 在女儿的怀抱中，你感到前所未有的安心，伴随着耳边那声轻柔的[say: 晚安，[Dad]]，你终于沉沉睡去。");
            get_player().orgasm("Vaginal");
         }
         saveContent.slutspawnLastTimeSex = get_game().time.days;
         doNext(playerMenu);
      }
      
      public function slutspawnDreamRevealNo() : void
      {
         clearOutput();
         outputText("[pg]当她靠过来时，你用尽了所有的意志力才忍住没有动作。她带着酒气的呼吸拂过你的耳畔，轻声低语道：[say: 怕你忘了，[Dad]，那可是[if (hascock) {你的肉棒插在我里面|塞满了我能承受的那么多根手指}]。]");
         outputText("[pg]她叹了口气，那双[helspawneyes]眼睛对上了你的视线，因为酒精——或者是欲望——而半眯着。[say: 我还是会想起你第一次问我们能不能做爱的时候。] [Helspawn] 贴着你扭动身子，用你的手指在她的阴蒂上揉搓，你只希望她没有注意到[if (hascock) {你的[cock]顶到了她|你开始玩弄起自己来}]。[say: 但我们还没做过呢，[Daddy]。你把我忘了吗？]");
         outputText("[pg][if (corruption > 44) {也许你真的忘了|你刚想向她保证你没有}]，但她没有给你回答的时间。[say: 我打赌你的[if (hascock) {肉棒|身体}]肯定没忘。你觉得呢？]");
         outputText("[pg]当她松开你的手指，[if (hascock) {隔着毯子握住你的肉棒，缓慢而有节奏地套弄着|顺着你的大腿向上抚摸，直到碰触到你的另一只手，并给了你一个心照不宣的微笑}]时，你原本想说的话全都卡在了喉咙里。[say: 你知道去哪找我的，[Dad]。]");
         outputText("[pg]说完，她停下动作，退开几步，在[if (builtcabin) {门前|出去之前}]停顿了一下，确保你正在看着她。[say: 晚安，[Daddy]，] 她一边低语，一边[if (builtcabin) {关上门|溜了出去}]，而你心里很清楚，今晚注定是个不眠之夜。");
         outputText("[pg]当你终于入睡时，似乎还能感觉到她的手指停留在你的[if (hascock) {[cock]|[clit]}]上。");
         dynStats(DynStat.Lust(20));
         doNext(playerMenu);
      }
      
      public function slutspawnDreamReveal() : void
      {
         clearOutput();
         outputText("当你用手指穿过[Helspawn]的头发时，她瞬间僵硬了一下，但没过多久她就在你身边放松下来，即使隔着毯子，你也能明显感觉到她的温暖——以及她的情欲。[say:我整晚都在想你的抚摸。]她的手找到了你的手，引导你顺着她的曲线一路向下，直到她湿滑的幽谷。[say:光是想象你的[if (hascock) {肉棒|手指}]插进我里面，就让我变成了这样，[Daddy]。]");
         outputText("[pg]她让你的指尖拂过她的阴蒂，在接触的瞬间颤抖起来。[say:你不给你小女儿她需要的东西吗？]");
         doYesNo(slutspawnDreamRevealYes,slutspawnDreamRevealNo);
      }
      
      public function slutspawnDreamPretend() : void
      {
         clearOutput();
         var _loc1_:Array = get_game().camp.malePartnersAtCampList();
         if(get_silly() && int(_loc1_.length) == 0 && get_akky().isOwned())
         {
            _loc1_ = [get_akky().get_name()];
         }
         var _loc2_:Array = get_game().camp.femalePartnersAtCampList();
         _loc2_.remove(get_helspawnName());
         var _loc3_:Array = _loc1_.concat(_loc2_);
         var _loc4_:Boolean = get_player().sexOrientation > 60;
         var _loc5_:Boolean = get_player().sexOrientation < 40;
         var _loc6_:Boolean = !_loc4_ && !_loc5_;
         var _loc7_:String = "their";
         outputText("你平稳呼吸，一动不动，当然对她在目前状态下可能会对你说的醉醺醺的、乱伦的胡言乱语很感兴趣，正如[if (hascock) {你不断勃起的阴茎|你大腿间的湿润}]所证明的那样。");
         outputText("[pg][say: 你为什么不做？我日日夜夜都在想你，[Dad]。我不知道我还能忍受多久。]她靠着你移动，有什么湿漉漉的东西擦过你的[if (singleleg) {身体|腿}]。[say: 你感觉到了吗？那是因为你。每天晚上我都必须抚摸自己，因为[Daddy]不肯。]");
         outputText("[pg]她颤抖地吸了一口气，她的腿滑过你的[if (tailLeg) {尾巴|[if (isgoo) {身体|腿}]}]。[say: 我不明白。你说我们可以做爱，但我们没有。]一声呜咽从你女儿的嘴唇间逸出，她在毯子上滑动，布料太薄了，她简直就像在触摸你的[skindesc]，你[if (hascock) {担心你坚硬的[cock]可能会暴露你其实并没有睡着|希望你也能这样做，你自己的[vagina]在她的身下空虚而被忽视}]。");
         outputText("[pg][say: 已经过了好久了，[Daddy]，我不知道还能做些什么。] 她的手轻轻拂过你的身体，随着她加快动作，你的女儿几乎无法抑制自己的声音。[pg][saystart]");
         if(_loc6_ && int(_loc2_.length) > 0 && int(_loc1_.length) > 0)
         {
            outputText("是因为你其他的那些骚货，对吧？请不要忘了你的女儿，[Daddy]。]");
         }
         else if(_loc4_)
         {
            switch(int(_loc1_.length))
            {
               case 0:
                  outputText("在你找到[if (!isfeminine) {另一个}]男人之前，尽情使用我吧，我不介意。但当你找到的时候，[Daddy]，别忘了你的女儿，好吗？");
                  _loc7_ = "";
                  break;
               case 1:
                  outputText("是因为" + _loc1_[0] + "，对吧？你知道的，你可以同时拥有我们两个。你只需要开口就行。");
                  _loc7_ = "他的";
                  break;
               default:
                  outputText("是因为那些[if (!isfeminine) { 其他}]男人，对吧？你本可以拥有一切的，[Daddy]。你只需要开口。");
            }
         }
         else if(int(_loc2_.length) == 1 && _loc2_[0] == "Helia")
         {
            outputText("是因为妈妈，对吧？让[Daddy]忙得没空陪[his]女儿了？");
            _loc7_ = "her";
         }
         else if(int(_loc2_.length) > 1)
         {
            outputText("是因为那些其他女孩，对吧？让[Daddy]忙得没空陪[his]女儿了？");
         }
         else
         {
            outputText("这是一个[b:错误]，不是吗？[Daddy]会报告它吗？");
            _loc7_ = "一个出bug的";
         }
         if(_loc7_ != "")
         {
            outputText("即使你来找我时，你的[if (hascock) {肉棒|嘴唇}]上带着" + _loc7_ + "的味道，我也不会介意的，");
         }
         outputText("[sayend]她说道，呼吸沉重地从你的[if (tailLeg) {尾巴|[if (isgoo) {身体|腿}]}]上起身，在你的脸颊上轻轻吻了一下。[say:谢谢你听我倾诉，[Dad]。]");
         outputText("[pg]她的脚步声渐渐远去，直到[if (builtcabin) {你的木屋门关上|你的营地彻底安静下来}]，你才敢睁开眼睛。她真的是[if (corruption > 59) {你的|赫莉娅的}]女儿，不是吗？");
         outputText("[pg]感觉过了好几个小时你才终于再次入睡，你的脑海里还在回放着[helspawn]在你身上摩擦的感觉。");
         dynStats(DynStat.Lust(20));
         doNext(playerMenu);
      }
      
      public function sleepWithHelspawn() : void
      {
         clearOutput();
         if(FlagDict_Impl_.arrayReadString(KFLAGS.flags,701) == "Helia")
         {
            outputText("虽然你晚上已经和赫莉娅共用你的[bed]了，但如果你们三个能睡在一起可能会很不错。毕竟你们是一家人。你向[helspawn]建议，如果你们三个都能待在你的[cabin]里，可能会很愉快，她[if (!helspawnchaste) {赞许地咧嘴笑了。|开心地笑了。}]");
            outputText("[pg][say: [if (!helspawnchaste) {真的吗，[Dad]？你想让我们都睡在一起？嗯……好吧，那可能会很不错。[if (helspawnincest) { 尤其是如果事情变得有点火热的话。}]|和你们俩一起睡？听起来会是一段非常美好的时光。我非常享受我们作为一家人在一起的时光。我很乐意，[Daddy]。}]] [if (!helspawnchaste) {[if (helspawnincest) {她用她那火热的尾巴在你的屁股上快速拍了一下，然后凑过来吻你。[say: 我今晚会去的，[Dad]，]她眨着眼睛说。|她给了你一个短暂的拥抱，并对你露出了微笑。[say: 期待今晚，[Dad]。]}]|[if (helspawnincest) {她紧紧地拥抱你，并在你的嘴唇上深深地吻了一下。[say: 期待今晚，[Dad]。]|她紧紧地拥抱你并微笑着。[say: 我等不及了，[Daddy]。]}]}]");
            outputText("[pg]看来从现在起，你的[cabin]里会有双倍的蝾螈了。这肯定是在晚上保暖的好方法。[if (helspawnincest) {尤其是考虑到这两个人可能会怎样。}]");
            FlagDict_Impl_.arrayWriteString(KFLAGS.flags,701,"salamanders");
         }
         else if(FlagDict_Impl_.arrayReadString(KFLAGS.flags,701) == "Helspawn" || FlagDict_Impl_.arrayReadString(KFLAGS.flags,701) == "salamanders")
         {
            outputText("你告诉[helspawn]，你现在更想分开睡。[if (helspawnchaste) {她用悲伤的眼神看着你，然后移开了视线。[say: 那好吧。我希望这不是因为我做错了什么。如果你随时想让我回来，就告诉我，好吗？]她再次看着你，你充满爱意地拥抱了她。她紧紧地回抱了你，然后你们俩再次分开。|她带着有点困惑的表情看着你。[say: 真的吗？真遗憾，我和你一起睡的时候睡得更好，[Dad]。啊，好吧，如果你随时想让我回到你的[bed]上，就告诉我。]}]");
            FlagDict_Impl_.arrayWriteString(KFLAGS.flags,701,FlagDict_Impl_.arrayReadString(KFLAGS.flags,701) == "salamanders" ? "Helia" : "");
         }
         else
         {
            outputText("你问[helspawn]是否愿意晚上开始在你的[cabin]里和你一起睡。[if (helspawnchaste) {她精神一振，微笑着看着你。[say: 真的吗，[Dad]？当然，我很乐意。]|她挑起一根眉毛，对你微微一笑。[say: 当然，[Dad]。听起来这可能是个度过夜晚的更好方式。]}]");
            outputText("[pg][if (helspawnchaste) {你的女儿咧嘴笑着，紧紧地拥抱你，显然很高兴你想和她一起度过夜晚，而不是和其他任何人。你回抱她，只是提醒她你对她的爱。[say: 我也爱你，[Dad]。]她带着灿烂的笑容与你分开，等待着你接下来要说的话。|你的女儿走近你，把手放在你的臀部，脸上带着调皮的神情。[say: 如果我有时想做的不仅仅是和你睡觉，尽量不要介意。]你告诉她，你不会指望她无聊到只会睡觉，毕竟是你帮忙把她养大的。[helspawn]只是轻声笑了笑，与你分开，等着听你还有什么要说的。}]");
            FlagDict_Impl_.arrayWriteString(KFLAGS.flags,701,"Helspawn");
         }
         doNext(helspawnsMainMenu);
      }
      
      public function sexRidingHelspawn(param1:Boolean) : void
      {
         clearOutput();
         if(param1)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2638) != 1)
            {
               outputText("当[eachCock]沾满了你的精液，你依然把你的小女孩紧紧抱在怀里。紧紧地抱着她，你享受着她身上散发出的温柔暖意。她闪闪发光的鳞片和柔软的肌肤是如此迷人。你们俩在沉默中慢慢平复呼吸，享受着这一刻简单的亲密。当你们都调整好呼吸后，她退后一步，好好地看了看你。[pg]");
               outputText("[say:哇，[Daddy]，] [helspawn]咧嘴笑着说，[say:我只是……哇。我们应该多花点时间在一起。我是说看看我，我都在发抖！][pg]");
               outputText("这让你轻笑出声，因为不知为何，[helspawn]以为你们俩已经结束了。你被挑逗得如此兴奋，以至于尽管你刚刚高潮过，[eachCock]依然直挺挺地立着。你咧嘴笑着告诉[helspawn]，你们的美好时光还没结束，然后看着一个充满纯粹喜悦的灿烂笑容像苍白的黎明一样在她的脸上绽放。[pg]");
            }
            else
            {
               outputText("当[eachCock]沾满了你自己的精液，你依然紧紧地抱着你珍贵的[helspawn]。把她抱在怀里，你陶醉在她散发的温暖中。她是一个如此美丽的女人，有着闪闪发光的鳞片和被汗水浸透的肌肤。当你们俩都平复了呼吸，她抬头对你微笑，知道接下来会发生什么。[pg]");
               outputText("你亲吻她微笑的嘴唇，当她坐在你腿上时，让[eachCock]在她身上摩擦。当她回吻你时，她向下摩擦着你，她火热的舌头钻进你的嘴里，按摩着你的舌头。当她把自己压向你时，一声呻吟在你的唇间震动。她完全信任你，为什么不呢？毕竟，你是她的[Daddy]，而她是你的小[helspawn]。[pg]");
            }
         }
         else
         {
            outputText("你向后伸手，把[helspawn]的尾巴尖从你的[ass]拉开。当你告诉她今天不会有任何后庭运动时，她像个好脾气的人一样微笑着。[pg]");
            outputText("[say:哦，好吧，]她眼中满是调皮地说，用她湿透的阴道壁最后一次挤压你的" + get_player().cockDescript() + "，然后向后伸手，极其缓慢地把你滑出来。她转过身，她赤裸的身体依然像以前一样迷人，把你推回去坐在附近的一块石头上。很明显她有B计划，因为她跨坐在你身上，正好坐在你的胯部上方，用她长满鳞片的腿缠住你的腰。[say:……也许下次吧，]她用唱歌般的声音结束了这句话。[pg]");
            outputText("当你的" + get_player().cockDescript() + "依偎在她的臀瓣之间，它的上侧压在她的阴户上时，她咯咯地笑了起来。[helspawn]把你拉进一个深吻，同时开始用她火热、湿润的欲望摩擦你的" + get_player().cockDescript() + "。有一会儿，你只是享受着在她身上摩擦的感觉，但没过多久，再次进入她体内的渴望就变得难以忍受。[pg]");
         }
         if(get_player().totalCocks() == 1)
         {
            outputText("你伸手向下，抓住你的" + get_player().cockDescript() + "，把它放回[helspawn]流着口水的性器中。[pg]");
            if(get_player().longestCockLength() <= 8)
            {
               outputText("当你的" + get_player().cockDescript() + "推过她高潮后的下体嘴唇时，[helspawn]喘息着。她坐在那里，你就在她体内，挤压着你嵌入的工具，脸上带着极度幸福的表情。她发出一声轻柔的呻吟，陶醉在你的" + get_player().cockDescript() + "如此深入她体内的感觉中。当她睁开眼睛时，她的嘴唇上挂着微笑，用世界上所有的爱慕低头看着你。你在她的嘴唇上轻轻啄了一下，作为她看起来如此可爱的温柔奖励。[pg]");
               outputText("[say:嗯……] [helspawn]一边在你坚硬的肉棒周围摩擦一边说，[say:……我喜欢你在我体内，[Daddy]；感觉太好了。][pg]");
               outputText("你又给了她一个吻，这个无声的姿势意味着你同意。她就是缠绕在你" + get_player().cockDescript() + "上的幸福，她的声音对你的耳朵来说就像性爱一样。她美得让人心痛。[pg]");
               outputText("她咬住嘴唇，开始在你坚硬的" + get_player().cockDescript() + "上下弹跳。你们的身体在湿润的拍打声中交汇。她美丽的乳房开始一圈圈地起伏，一次又一次地吞没你的" + get_player().cockDescript() + "。你惊叹于她美丽的身体，当她尖叫和呻吟时，闪闪发光的汗水亲吻着她。你情不自禁地开始向上挺进她饥渴的小穴，把她推向高潮，直到她的爱液喷洒在你的肚子上，流下你的[legs]。[pg]");
            }
            else if(get_player().longestCockLength() > 8 && get_player().longestCockLength() <= 12)
            {
               outputText("当你的" + get_player().cockDescript() + "推过她的阴唇时，[helspawn]呻吟着。她慢慢下降，喘息着扭动身体，直到你的" + get_player().cockDescript() + "再次深深地进入她体内，挤压着你嵌入的肉棒，同时低头看着你的眼睛。她默默地陶醉在你的" + get_player().cockDescript() + "如此深入她体内所带来的兴奋中。你们之前做爱留下的汗水依然在她的皮肤和鳞片上闪闪发光。她是如此性感，你忍不住用你的嘴唇填满她的嘴唇，当你把她的舌头吸进嘴里时，你唇间的一声呻吟震动了她的舌头。[pg]");
               outputText("当你放开她时，她用性感的嗓音说，[say:[Daddy]，]同时用你依然留在她流着口水的阴道肉套里的坚硬肉棒摩擦着，[say:我太爱你了，[Daddy]。我喜欢你这么深地进入我体内。][pg]");
               outputText("你用另一个吻回应，同时在躺下享受你的小[helspawn]之前，把你的工具在她体内摩擦。[pg]");
               outputText("她以中等速度开始，伴随着急促的喘息和低沉的呻吟骑乘着你。她的小穴在你的" + get_player().cockDescript() + "上下吸吮。慢慢地，她开始加快节奏，直到她骑得如此用力，以至于你的身体在你们坐着的石头上滑动。很快，你们身体交汇时湿润的拍打声在营地中回荡，伴随着你低沉的呻吟和她高亢的尖叫。你情不自禁地开始向上挺进她奇妙的小穴。当你开始移动时，她发出一声尖锐的叫喊，她的小穴开始喷涌出爱液，溅在你的肚子上，浸透了[eachCock]，流下你的腿。[pg]");
            }
            else if(get_player().longestCockLength() > 12)
            {
               outputText("当你的" + get_player().cockDescript() + "推过她的阴唇时，[helspawn]咕哝着。尽管你之前已经进入过，但她依然很紧。所以你必须慢慢来，让她重新张开。当你抓住她的大腿，开始把你的" + get_player().cockDescript() + "摇进她颤抖的小穴时，她试图保持不动。当你温柔地把它撑开时，你能感觉到每一个褶皱。[pg]");
               outputText("[say:啊！]当你尽可能多地把你的" + get_player().cockDescript() + "塞进她体内时，她喘息着。她转动着臀部，唱着无字的轻柔快乐宣言，同时把你留在她体内。她低头看着你，当她转动臀部时，她性感的眼睛里充满了欲望。你深深地进入了她体内，她在微笑。她准备好了。[pg]");
               outputText("她开始慢慢地骑乘你，深呼吸着，因为她的小穴被你的" + get_player().cockDescript() + "撑得大大的。当她开始加快速度时，没过多久她就像个勇者一样骑着你的" + get_player().cockDescript() + "。她的脸皱在一起，汗水在她的额头上闪闪发光。她的乳房在空中画着圈，她的小穴在你的" + get_player().cockDescript() + "上下吸吮。然后她突然颤抖起来，她的小穴在你嵌入的肉棒周围喷洒出爱液。你向上挺进她喷涌的阴道，陶醉在它到处喷洒她散发着甜味的精液的方式中。它在你的肚子上，它滑下你的[ass]，它甚至流下你的[legs]。[pg]");
            }
            outputText("当你开始拉着她在你的" + get_player().cockDescript() + "上起伏时，她尖叫起来。你用力地操她，将勃起的肉棒钻进她那汁水四溢的阴道壁。她高潮了一次，两次，又一次，再来一次。当你抓住她柔软的屁股，像没有明天一样猛烈地抽插时，她不断地高潮。她颤抖着，尖叫着，呼唤着上天，因为你用难以忍受的快感浪潮摧毁了她。[pg]");
            outputText("淫液像瀑布一样顺着你的身体流下，你紧紧贴着[helspawn]。当精液在你的肉棒里沸腾时，你用双臂环抱住她，依然在操出她的汁水。然后你的" + get_player().cockDescript() + "开始射入她体内。你将喷射的肉棒研磨着她那汁水四溢的阴户。你们的声音交织在一起，在共同高潮时和谐共鸣。[pg]");
            if(400 <= get_player().cumQ() && get_player().cumQ() < 800)
            {
               outputText("你高潮的量对[helspawn]的子宫来说实在太多了，当你射精时，她的肚子鼓了起来。你颤抖着紧紧抱住她，你的" + get_player().cockDescript() + "继续在她体内射出一股又一股的精液，甚至在精液开始溢出并滴落到地上，形成一滩闪闪发光的精液水坑之后也是如此。[pg]");
            }
            else if(get_player().cumQ() >= 800)
            {
               outputText("你高潮的绝对量远远超出了[helspawn]子宫的容纳能力。她的肚子鼓了起来，双眼翻白，你的" + get_player().cockDescript() + "在她体内喷射出巨大的滚烫精液柱。你的精液很快开始溢出，溅到地上，形成了一个滚烫精液的小湖，你紧紧抱住她，随着每一次喷射而颤抖。[pg]");
            }
         }
         else if(get_player().totalCocks() > 1)
         {
            outputText("你双手向下伸去，举起你那沾满精液的[cock 1]和滴着精液的[cock 2]。[pg]");
            outputText("由于之前你的精液和她的淫液已经充分润滑，她同时滑到了两根肉棒上，当她的阴唇和肛门同时吞没你时，你爽得浑身发抖。她开始缓慢地骑乘你，在前后扭动时扭动着腹肌。她每次向你靠近，她的屁股就会挤压你的[cock 1]，而每次后退，她那流着口水的小穴就会按摩你的[cock 2]。她继续这样抽插了几下，然后调整了她那长满鳞片的脚。接着，她用充满欲望的眼睛低头看着你，开始上下弹跳。[pg]");
            outputText("一开始很慢，因为双重感觉对她来说太强烈了。她颤抖着，试图让你射出来，但又太兴奋了，无法像她想要的那样骑乘你。所以你帮了她一把，紧紧抓住她柔软的屁股瓣，用手加快她的速度。[pg]");
            outputText("这就足够了。毫无预兆地，她尖叫起来，她的小穴将淫液猛烈地喷射到你的下半身。淫液顺着你的[ass]和[legs]流下，用她充满欲望的分泌物浸湿了地面。单是这景象就足以让你射出来，但你坚持住了，想看看你的两根肉棒能让[helspawn]高潮多少次。[pg]");
            outputText("在整个过程中，她在痛苦的快感中尖叫。大部分都听不清，但你能分辨出的是爱的宣言，这只会让你想坚持得更久，给她带来更多的快感。当你让她用力骑乘时，她那美丽的、布满汗水的乳房在空中打转。她的身体颤抖着，声音也变了：她又要高潮了。[pg]");
            outputText("当你加快速度时，她呜咽起来。你尽一切努力坚持住，一次又一次地让她达到高潮，把每一次淫液的喷发都看作是一次胜利。每次她达到高潮时，你都几乎要崩溃，但凭借纯粹的意志力，你一次又一次地坚持下来，直到她像女妖一样尖叫，你的座位被浸透了，你感觉自己都要滑下来了。[pg]");
            outputText("于是你放开了，咆哮着，每一股精液都狂暴地撕裂[eachCock]，并在你亲爱的[helspawn]体内爆炸。[pg]");
            if(400 <= get_player().cumQ() && get_player().cumQ() < 800)
            {
               outputText("当你那巨大的、滚烫的精液从[eachCock]射出时，[helspawn]的肚子开始鼓起来。当她被填满时，她呻吟着，用充满欲望的眼睛抚摸着她那圆润的肚子。你能感觉到自己的精液顺着你的腿流下来，因为她那被操透的洞已经无法容纳你那巨大的精液量了。很快她看起来就像怀孕了一样。[pg]");
            }
            else if(get_player().cumQ() >= 800)
            {
               outputText("当你那大量的、滚烫的精液喷射进她的两个洞里时，[helspawn]的肚子膨胀起来。由于无法容纳你那巨大的精液量，精液从她那被蹂躏的小穴和屁股里溢出，溅到你们之间的地上，形成了一个不断扩大的水坑。然而，你向她体内泵入精液的速度比她身体排出的速度还要快。很快[helspawn]看起来就像危险地怀孕了一样。[pg]");
            }
         }
         if(get_player().cumQ() >= 400)
         {
            outputText("当你的高潮开始减弱时，[helspawn]站了起来，一股滚烫的精液倾泻而出，汇入你[feet]周围已经巨大的精液池中，她那塞满精液的肚子也瘪了下去。");
         }
         else
         {
            outputText("当你的高潮开始减弱时，[helspawn]站了起来，你的精液和她的汁液混合而成的滚烫液体顺着她长满鳞片的大腿流下，形成了一条条小溪。");
         }
         get_player().orgasm("Dick");
         doNext(postSexHelspawn);
      }
      
      public function sexOralHelspawn() : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         clearOutput();
         var _loc1_:int = get_player().biggestCockIndex();
         if(get_player().hasVagina())
         {
            outputText("[helspawn]开始将你的大腿往上推，并把它们分开。她看了一眼你的[vagina]，舔了舔嘴唇，然后凑近，在你湿润的私处旁边轻轻地挑逗着舔舐。她似乎挑逗了你很久，舔着你的[skinfurscales]，让你颤抖着呻吟。[pg]");
            outputText("当你开始乞求时，她对着你闪闪发光的阴唇平滑地舔了一下。当她的舌头滑过你女性的开口时，你的身体开始发热。她吸吮着你的[clit]，带着美丽的微笑，把脸埋在你的阴唇里摩擦。[pg]");
         }
         if(get_player().balls > 0)
         {
            outputText("[helspawn]向前伸出手，把[eachCock]移开。她用空出的手托起你的");
            if(get_player().balls == 1)
            {
               outputText("蛋蛋，把它往上拉，同时在你的球体上印下一个湿润的吻。她把脸埋在你的阴囊里，沐浴在你男性生殖器的气味中。柔软湿润的嘴唇轻轻地拉扯着你的蛋蛋，让你的精液工厂在她的嘴里打转，让你把阴囊磨蹭在她的嘴唇上。");
            }
            else
            {
               outputText("蛋蛋，把它们往上拉，同时在每个球体上印下一个湿润的吻。她把脸埋在你的阴囊里，沐浴在你男性生殖器的气味中。柔软湿润的嘴唇轻轻地拉扯着你的蛋蛋，让你的精液工厂在她的嘴里打转，让你把阴囊磨蹭在她的嘴唇上。[pg]");
            }
            outputText("[say: 哦……积攒了这么多精液，][helspawn]发出一声轻柔的呻吟，[say: 这些都是给我的吗，[Daddy]？]你点点头回答她，[face]上绽放出亲切的微笑。对你的回答感到满意，她灿烂地笑了笑，然后凑近，用她那火热、灵巧的舌头按摩你的");
            if(get_player().balls == 1)
            {
               outputText("蛋蛋");
            }
            else
            {
               outputText("蛋蛋");
            }
            outputText("。[eachCock]跳动了一下，因为她轻轻地将一个敏感的球体拉进她火热湿润的嘴里。她依次用嘴爱抚每一个，直到你的身体在她的嘴唇上蜷缩，才放开你充满精液的蛋蛋。然后她抬头看着你，她的");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,958) == 0)
            {
               outputText("金色的");
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,958) == 2)
            {
               outputText("亮绿色的");
            }
            else
            {
               outputText("深红色的");
            }
            outputText("眼睛带着微笑锁定着你，她的嘴停在[eachCock]上方。[pg]");
         }
         if(get_player().totalCocks() == 1)
         {
            outputText("嘴唇张得大大的，[helspawn]用夸张的缓慢动作，将舌头拖过你" + get_player().cockDescript() + "的腹部。然后她的舌头舔舐着你的" + get_player().cockDescript() + "，下一秒，柔软的双手将你的肉棒向下拉，以便她能用那奇妙的舌头挠你的马眼。她把你的" + get_player().cockDescript() + "在脸上摩擦，高兴地将你渗出的前列腺液涂抹在她的五官上。她充满狂喜的眼睛在工作时贪婪地注视着你赤裸的身体。她渴望取悦你，让你感觉好到在她的嘴里爆发。[pg]");
            outputText("[say: 好女孩。]你叹了口气，抓住你的" + get_player().cockDescript() + "，在伸出的舌头上摩擦。湿润的表面加上她火热光环的温度升高，导致你的" + get_player().cockDescript() + "在她吸吮你的" + get_player().cockDescript() + "时，在撅起的嘴唇上跳动。她火热的呼吸沐浴着你的下体，开始亲吻你的肉棒，每一次亲吻都以响亮的吸吮声结束。当她到达你的[cockHead]时，她花了一点时间吸吮马眼，喝着你的前列腺液，仿佛那是宇宙中最美味的一餐。[pg]");
         }
         else if(get_player().totalCocks() == 2)
         {
            _loc2_ = get_player().biggestCockIndex2();
            outputText("[helspawn]笑着抓住[eachCock]。她专注地听着你呻吟，同时把你的两根肉棒压在一起。她按摩着你的双胞胎肉棒，你不得不承认这感觉像在天堂一样，[eachCock]在被她柔软温暖的手掌包裹时摩擦在一起。当你对这种感觉做出反应时，她把舌头拖过由" + get_player().cockDescript(_loc1_) + "和" + get_player().cockDescript(_loc2_) + "形成的缝隙，她确保它们保持稳定，即使你的身体不是。当她柔软、火热、完美的拇指将前列腺液涂抹在你" + get_player().cockDescript(_loc1_) + "的龟头上，同时用舌头品尝你的" + get_player().cockDescript(_loc2_) + "时，你几乎要失控了。[pg]");
            outputText("相反，你呻吟着。[say: 好女孩。]同时将[eachCock]推向她的嘴。她的握力收紧，连同她的嘴唇，她开始在你的肉棒上下套弄，形成一个既陌生又完美的三壁孔口。你又开始颤抖，因为她的嘴唇在你两根肉棒的腹部涂抹着加热的唾液，而她的手将它们压在一起，这三种感觉导致你的身体像在操一个柔软的肉三角一样挺动。在让你自由发挥之后，她退后，从嘴唇上舔掉你美味的前列腺液。[pg]");
         }
         else if(get_player().totalCocks() >= 3)
         {
            _loc2_ = get_player().biggestCockIndex2();
            _loc3_ = get_player().biggestCockIndex3();
            outputText("[helspawn]向前伸出手，把你的" + get_player().cockDescript(_loc1_) + "拉进嘴唇，吸吮着[cockhead " + (_loc1_ + 1) + "]。然后她的手包裹住你的" + get_player().cockDescript(_loc2_) + "和你的" + get_player().cockDescript(_loc3_) + "。看到她取悦[eachCock]中的3根，加上柔软的双手、紧紧的握力和湿润的舌头的感觉，让你在她身上挺动。她在你的" + get_player().cockDescript() + "上哼哼了一秒钟，然后双臂环绕住[eachCock]的底部，把它们拉在一起，把柔软的脸在它们上面摩擦。你陶醉在她滴水的舌头、火热的喘息和颤动的嘴唇中，她哼哼着，一次亲吻你一根肉棒。你大声呼喊，声音嘶哑，因为你被一波又一波的欣快感击中，几乎让你失去控制。她放松下来，让你从边缘回来，同时用明亮的眼睛抬头看着你。[pg]");
         }
         outputText("[say: 哦，[Daddy]，]她笑着说，同时把你的" + get_player().cockDescript(_loc1_) + "拿在手里，[say: 我太爱你了。]你也回了一句，字字真心。在你还没来得及详细说明你有多爱[helspawn]之前，她张开嘴，如此迅速地把你吸进去，如果你不是早就知道的话，你发誓她妈妈是一台榨精机。[pg]");
         if(get_player().cockArea(_loc1_) <= 27)
         {
            outputText("当她毫不犹豫地将你整个" + get_player().cockDescript(_loc1_) + "滑入嘴里时，你开始嚎叫。她上下套弄了一会儿，你的" + get_player().cockDescript(_loc1_) + "闪烁着她的唾液，她一次又一次地吞没你。然后她把你的" + get_player().cockDescript(_loc1_) + "滑到她神圣的嘴唇前面，开始用舌头在你敏感的" + get_player().cockHead(_loc1_) + "周围打转，然后再次潜下去。她重复着这种折磨人的做法，一次又一次地将你的" + get_player().cockDescript(_loc1_) + "包裹在她火热湿润的孔口里。[pg]");
         }
         else if(get_player().cockArea(_loc1_) < 36 && get_player().cockArea(_loc1_) > 27)
         {
            outputText("当[helspawn]将你含入口中时，你的[hips]猛地挺动。当你的" + get_player().cockHead(_loc1_) + "触及她的喉咙深处时，她咽了一下，伴随着湿润的吸吮声和吞咽声将你吸入口中。当她上下吞吐你的阴茎时，你需要用尽每一丝意志力才没有直接操她的脸。吸溜，咕噜，吸溜，咕噜，伴随着每一次吞咽，你的身体都会随着她那灵巧的喉咙收缩而颤抖，那喉咙将你紧紧包裹，并把你的肉棒往里吸。她甚至把脸埋在你的腹股沟里，在将你的" + get_player().cockDescript(_loc1_) + "整个吞下时，深深吸入你的气味。[pg]");
         }
         else if(get_player().cockArea(_loc1_) >= 36)
         {
            outputText("然而，她刚含过你的" + get_player().cockHead(_loc1_) + "就开始感到吃力了。看着她试图将你整根肉棒塞进嘴里的样子，让你兴奋得发狂。你抓住她火红的头发，轻轻将她拉开，无声地命令她慢下来，慢慢来。在你将她的嘴唇速度放慢到她觉得舒服的程度后，她继续不慌不忙地为你服务。你那巨大的" + get_player().cockDescript(_loc1_) + "无法完全塞进她的嘴里，但这并不重要，当你欣赏她口交技巧的精湛时，她依然让你因渴望而颤抖。[pg]");
         }
         if(get_player().hasKnot(_loc1_))
         {
            outputText("她把你的" + get_player().cockDescript(_loc1_) + "拉起来，在你的肉结上印下温柔的一吻。这个吻很快演变成了响亮的吸吮，让你浑身颤抖。她玩弄着你的肉结，用火热的舌头舔舐它敏感的表面，用湿润的嘴唇轻咬它。她火热的呼吸、温暖的双手和湿润的舌头交织在一起，让你处于爆发的边缘。[pg]");
         }
         else if(get_player().cocks[_loc1_].get_cockType() == CockTypesEnum.CAT)
         {
            outputText("她咯咯笑着，在手里转动着你猫咪肉棒上的倒刺。然后她用那无比火热的舌头在表面舔舐，接着反方向用舌头绕着每一根倒刺打转。她轻轻捏住顶端，从你的尿道口挤出前列腺液，并从你那流着口水、被唾液弄得亮晶晶的" + get_player().cockDescript(_loc1_) + "上舔掉那丰富的液体。她火热的呼吸、温暖的双手和湿润的舌头交织在一起，让你处于爆发的边缘。[pg]");
         }
         else if(get_player().cocks[_loc1_].get_cockType() == CockTypesEnum.HORSE)
         {
            outputText("她的手滑过你" + get_player().cockDescript(_loc1_) + "的各个分节。每次她这么做，那种奇特的感觉都会迫使你的臀部猛地挺动。然后她开始轻咬它们，在你的" + get_player().cockDescript(_loc1_) + "表面流下口水，然后又大声地吸回去。她亲吻你的马眼，哼着歌，用饥渴的嘴唇吸出更多的前列腺液。她火热的呼吸、温暖的双手和湿润的舌头交织在一起，让你处于爆发的边缘。[pg]");
         }
         else if(get_player().cocks[_loc1_].get_cockType() == CockTypesEnum.TENTACLE)
         {
            outputText("[helspawn]在为你那活生生的肉棒服务时发出呻吟。她像对待猎物一样困住它，用舌头舔舐它那扭动的腹部。它用汁液回报她，她舔舐着，并从" + get_player().cockHead(_loc1_) + "吸吮。当它在她的嘴唇里戳来戳去时，她发出低吼，当她的舌头与你兴奋的" + get_player().cockDescript(_loc1_) + "缠斗时，她的嘴巴也在震动。她火热的呼吸、温暖的双手和湿润的舌头交织在一起，让你处于爆发的边缘。[pg]");
         }
         else
         {
            outputText("她花了一点时间进一步探索你的" + get_player().cockDescript(_loc1_) + "。她那令人痉挛的嘴唇在你的" + get_player().cockDescript(_loc1_) + "上流下口水，然后大声地吸吮。她用甜蜜的亲吻擦亮你的龟头，每一个温柔的吻都伴随着一声深沉的声音，震动着你的[chest]。她光滑的嘴唇开始在你的肉棒表面滑动，不放过任何一个角落，也不遗漏任何一个缝隙。然后她湿润的舌头一遍又一遍地舔舐你那颤抖的" + get_player().cockDescript(_loc1_) + "的腹部。她火热的呼吸、温暖的双手和湿润的舌头交织在一起，让你处于爆发的边缘。[pg]");
         }
         outputText("她让你在一段时间内保持在接近高潮的状态，放松下来给你一个短暂的喘息机会，然后又猛地向前，把你推回边缘。她像音乐家演奏最喜欢的乐器一样玩弄你的" + get_player().cockDescript() + "。你那颤抖的肉棒每一次被拨动，都会释放出一个温柔的狂喜音符，每一次呼吸都以音乐结束。她是一位技艺精湛的演奏家，她的每一个动作都以你紧绷的声音的形式创造出艺术。[pg]");
         outputText("很快就很明显，[helspawn]并不介意像这样和你待在这里。你很想让她继续，她这样在你的" + get_player().cockDescript() + "上上下滑动，让你的整个身心都充满了性爱的愉悦。你必须集中所有剩余的精神力量把她拉开，这样你才不会无意中射满她的嘴。[pg]");
         outputText("在你颤抖的双手把她从[eachCock]拉开后，她依然跪着。她耐心地看着你深呼吸以平复心情。一旦你控制住了自己那颤抖的性欲，你便降低身子到[helspawn]的高度，给了她一个深吻。当你把舌头伸进她的嘴里时，你把她推倒仰面躺下。[pg]");
         outputText("[say: 是的，[Daddy]，]当你用鼻子蹭她的脖子，吸吮那娇嫩的肌肤，让她在你的身体上摩擦时，她呻吟着。你一路留下湿润的吻，直到她那挺拔的乳房。你在那里停留了一会儿，把她勃起的乳头吸进嘴里，同时你的双手按摩着她的腰。当你挠她痒痒、逗弄她时，她缩了缩身子，像个女学生一样咯咯笑着，乞求着你的" + get_player().cockDescript(_loc1_) + "。[pg]");
         outputText("但你心里有别的打算。此外，你知道在刚才那次口交之后，你需要几分钟来平复一下。为了尽可能长地享受你们的美好时光，你开始在她的内侧大腿上留下第二串甜蜜的吻。当她弄明白你打算做什么时，她紧张了起来。[pg]");
         outputText("当你的舌头滑过她的内侧大腿时，[helspawn]浑身一颤。你亲吻那个地方，她沮丧地呻吟着。你用轻微的呼吸逗弄她，让她那闪闪发光的女性私处颤抖发痒。你伸出舌头，在她的内侧大腿上滑动，陶醉于那颤抖的肌肤摩擦你舌头的感觉。你不断地危险地靠近她那女性的果实，然后又飘然离去，用你的舌头在她的内侧大腿和柔软的小肚子上描绘出复杂的图案。[pg]");
         outputText("你一直这样继续着，直到她那闪闪发光的小穴几乎要泛滥成灾，期待着你最终给它好好舔一舔的那一刻。[pg]");
         outputText("[say: [Daddy]，求你了，]当她再也受不了时，她用一种性感的嗓音哀求道。[pg]");
         outputText("于是你把她的腿往后压，进一步分开她那闪闪发光的阴唇。她的阴蒂像一颗坚硬的珍珠，渴望着你的嘴唇，所以你舔了它一下。[helspawn]的整个身体因为这短暂的接触而猛地抽搐。你平躺在地上，用嘴唇包裹住那颗坚硬的珍珠并吸吮它。[helspawn]的身体痉挛颤抖着，你坚持着，转动着脖子，享受着在她大腿上的旅程。[pg]");
         outputText("你把嘴唇压进她湿润的私处，用你的嘴唇按摩她的阴唇。你对着它低吼，震动着她那泛滥的小穴。你关注着[helspawn]在你为她服务时发出的每一次喘息、呻吟和令人兴奋的尖叫。然后她的双腿突然夹住你的脖子，把你困在这个姿势，同时她伸出手把你的头按进她的小穴里，显然已经沉浸在狂喜之中。[pg]");
         outputText("如果她想这么玩……你奉陪到底。[pg]");
         outputText("你加倍努力，像一个渴死的人一样，以凶猛的姿态从她那刺痛的裂口中吸吮着滚烫的爱液。你轻咬她的阴蒂，你法式深吻她的阴唇，突然她喷涌出一股苍白的液体，味道像糖果一样甜美。[pg]");
         outputText("在你上方，[helspawn]像个被附身的女人一样尖叫着，她的身体像癫痫发作一样旋转着。她用铁钳般的力气把你按在她那喷水的小穴上。你的[face]紧贴着她火热的私处，沐浴在她甜美的潮吹中。一旦那甜蜜的喷泉平息下来，她松开了你，你站了起来。她的脸上洋溢着纯粹的狂喜的柔和光芒，她带着慵懒的微笑一遍又一遍地感谢你。[pg]");
         outputText("你低头对她咧嘴一笑，说道：[say:但是[helspawn]……我还没完呢。][pg]");
         outputText("说完，你抓住她的双腿，将她转了过来。她翻了个身，在你的命令下跪了起来。你将你的[face]埋进她那柔软圆润、肉感十足的臀瓣中。[pg]");
         outputText("[say:感觉好……奇怪，][helspawn]咯咯笑着说，尽管她正将饥渴的屁股贴向你不断抽插的舌头。你特意大声地吸吮她暴露在外的后庭，沉醉于那紧致入口的完美状态。你用双手掰开她丰满的臀瓣，以获得更好的角度。这足以让一声饱受折磨又令人兴奋的尖叫划破空气。[helspawn]闷哼呻吟着，在你让她屁股感觉“奇怪”时浑身颤抖。你的手啪的一声拍在她的屁股上，看着那团肉带着肉欲的愉悦颤动。你已经迫不及待了，[eachCock]坚硬如石，在你的双腿间晃荡，你正在为进入她紧致的后庭做准备。随着你的口舌侍奉将她逼向高潮，她开始在你的唇边颤抖。[pg]");
         outputText("你开始交替进行，贪婪地将舌头从她依然湿润的小穴拖过肿胀的会阴，去亲吻她饥渴的菊穴。当你终于从她滴水的小穴和紧缩的菊穴前起身时，她回头看着你，仿佛透过性欲的迷雾在注视着你。");
         doNext(sexDoggyHelspawn);
      }
      
      public function sexHelspawn() : void
      {
         clearOutput();
         outputText("你决定是你和[helspawn]共度美好时光的时候了。仿佛感觉到了你的意图，她给了你一个诱人的微笑，你感觉自己的[face]上也映出了同样的微笑。[pg]");
         if(get_player().get_tallness() < 72)
         {
            outputText("你伸出手，将[helspawn]的脸颊捧在手中。你手指温柔的抚摸让她因渴望而颤抖。年轻的女人站在你面前，她的");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,958) == 0)
            {
               outputText("金色的");
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,958) == 2)
            {
               outputText("亮绿色的");
            }
            else
            {
               outputText("深红色的");
            }
            outputText("眼睛像星星一样亮了起来。她用世界上所有的爱慕凝视着你的眼睛，凑过来亲吻你的嘴唇。");
         }
         else if(get_player().get_tallness() >= 72 && get_player().get_tallness() < 96)
         {
            outputText("你和[helspawn]四目相对，双手捧着她的脸。她抬起手，将一缕散落的头发从脸上拨开，就在你将嘴唇贴上她的嘴唇之前。你紧紧地抱着她亲吻，她融化在你的怀里，发出一声轻柔的呻吟。");
         }
         else if(get_player().get_tallness() >= 96)
         {
            outputText("你俯下身，将小[helspawn]拥入怀中。当你们紧紧相拥时，她靠在你的[chest]上轻声呻吟。然后，她踮起脚尖，用如星辰般明亮的双眼仰望着你的[face]，吻上了你的双唇。");
         }
         outputText("一吻结束，你问她是否想和你共度一段美好时光。[pg]");
         outputText("[helspawn]微笑着，用一句简单的[say:我想，[Daddy]。]回答了你。[pg]");
         outputText("这位年轻的女士注视着你宽衣解带。你尽可能性感地脱下[armor]，展示着你的身姿，伴随着只有你能听到的音乐舞动。你甚至还加入了一些在英格纳姆看到别人跳过的性感舞步。你充满异国情调的展示让[helspawn]心跳加速，她因渴望而颤抖。当你终于一丝不挂时，[helspawn]的目光充满饥渴地贪婪地注视着你赤裸的身体。你骄傲地向她展示你的" + get_player().cockDescript() + "和[ass]。然后你挺起[chest]，向她展示你的二头肌。她拍手赞赏你的表演，随着欲望的占据而扭动着身体。[pg]");
         outputText("现在轮到她脱衣服了，她骄傲地站直身子，开始脱下自己的衣服。[pg]");
         if(helspawnSlutty())
         {
            outputText("[helspawn] 将手伸到背后，挺起胸膛，解开了她鳞片比基尼上装的搭扣。随着她任由上装滑落，她露出双峰，并诱惑地轻轻晃动了一下。你情不自禁地伸手揽住她的腰，将一颗乳头含进嘴里。你吮吸轻咬着她的乳房，片刻后她咯咯笑着转过身去。她诱惑地向前弯腰，缓缓抬起尾巴，开始慢慢地将鳞片比基尼下装从她那诱人的翘臀上褪下。柔软而美妙的臀瓣随着衣物滑过肌肤微微变形，待衣物褪去，软肉又恢复原状。紧致的尾穴花蕾先被展露，紧接着她那闪着水光的私处也显露出来。这一切距离你的脸只有[if (metric) {一掌宽|几英寸}]之遥。你那小丫头动情的气味萦绕在你周围，那股甜香令你垂涎欲滴。[pg]");
            outputText("[say: 操，太爽了，[Daddy]，]当你花时间揉捏和挑逗她的穴口时，她呻吟着，这两个洞都急需一场持久的猛操。");
         }
         else
         {
            outputText("[helspawn] 花了一点时间解开她天蓝色衬衫的纽扣，然后充满诱惑地将它脱下，嘴角挂着一丝腼腆的微笑。衬衫滑落，露出里面一件精致的白色蕾丝胸罩。她将手伸到背后，轻巧地解开了搭扣。她拎着胸罩，缓缓向下褪去，露出胸前柔美的曲线。你伸出手，揽住她的腰，品尝她挺拔的乳头，用湿润的嘴唇又拉又吮，直到她红着脸转过身去。她稍作停顿，解开裙子。衣物落下，露出她每日安坐的那柔软娇嫩的臀肉。她一边扭动着腰肢，一边褪下柔软的白色蕾丝内裤，将她的后庭和柔嫩水润的花穴展现在你眼前，供你欣赏。你的小丫头动情的气息萦绕在你身旁，那甜美的味道让你垂涎欲滴。[pg]");
            outputText("[say:是的，[Daddy]，]她喘息着。你顺势按摩起她赤裸的臀部，揉捏着那柔软的肉体，将其掰开，露出她那两个等待着的入口。");
         }
         outputText("你凑上前去，满心想要品尝她的味道，但她却退开了一步，显然没有察觉到你的渴望。不过，看来英雄所见略同；她转过身面对你，跪在你面前，仿佛你是一位高贵的国王，而她是你卑微的仆人。[pg]");
         doNext(sexOralHelspawn);
      }
      
      public function sexDoggyHelspawn() : void
      {
         var cameBeforeRiding1:Boolean;
         var _g:HelSpawnScene;
         clearOutput();
         var _loc1_:Boolean = false;
         outputText("你跪在地上，将[eachCock]放在[helspawn]柔软有弹性的臀瓣之间。你缓慢地抽插，沉醉于在柔软臀瓣间缓慢摩擦带来的温热感。她在你身下呻吟，并弓起背，发出明显的邀请。你向前伸出手，抚摸她滴水的私处，收集她的汁液，让其滴落在[eachCock]上。[pg]");
         if(get_player().totalCocks() == 1)
         {
            outputText("当你的" + get_player().cockDescript() + "沾满了[helspawn]甜美的甘露而闪闪发光时，你将它渗出液体的头部对准了她湿透的阴唇，伴随着一声呻吟进入了她。[pg]");
            if(get_player().longestCockLength() <= 8)
            {
               outputText("当你滑入她敏感的女性入口时，[helspawn]兴奋得晕头转向，你轻松地推进了她湿润的小穴。她回头对你咧嘴一笑，同时将她布满鳞片的尾巴卷在你的腰上，你确信这是一个积极的姿态。她的入口湿透了，之前高潮留下的滑腻淫液让你在她跳动的通道中滑行变得更加愉悦。每一次抽插都让你的身体感到一阵酥麻，因为她紧紧地夹住你，在内部挤压你的肉棒，同时迎合着你缓慢而深入的抽插。[pg]");
               outputText("[say:哦，[Daddy]！]她回头看着你，咧嘴笑着说，[say:好好操我。][pg]");
               outputText("你不是一个会让你的小女孩失望的人，你俯身向前，将嘴唇贴在她的嘴唇上。当她的舌头如蛇般钻进你的嘴里时，你加快了速度。很快，你的抽插声就让空气中充满了快速交媾的啪啪声。当感觉变得过于强烈时，她中断了亲吻，开始将她的小穴向后迎合你用力的抽插。在你身下，[helspawn]像坐过山车一样欢呼雀跃。很快，她欢快的叫声中带上了一丝熟悉的边缘感，你知道她快到了。你加倍努力，狠狠地操她，直到她尖叫起来，她的小穴在你仍在抽插的" + get_player().cockDescript() + "周围喷涌而出。[pg]");
            }
            else if(get_player().longestCockLength() > 8 && get_player().longestCockLength() <= 12)
            {
               outputText("当你压入她敏感的女性入口时，[helspawn]呻吟着，你的" + get_player().cockHead() + "撑开了她的下体嘴唇，深深地钻进了她的阴道套中。当你将肉棒浸入她颤抖的性器官紧紧的拥抱中时，她的小穴已经湿透了。你坐在那里片刻，让[helspawn]体会你" + get_player().cockDescript() + "的全部长度。就在你开始在她湿透的小穴中进进出出时，她的尾巴缠绕在你的腰上。[helspawn]的声音慢慢变大，因为她很快就迷失在你缓慢而深入的抽插的感觉中。[pg]");
               outputText("[say:是的，[Daddy]，]她带着一丝飘飘欲仙的狂喜说道，[say:哦……好好操我。][pg]");
               outputText("你不是那种会让你的小女孩失望的人，你倾身向前，将你的嘴唇贴在她的嘴唇上。当你把舌头伸进她的嘴里时，你加快了速度。每一次抽插都伴随着一声清脆的拍打声，这声音以闪电般的速度在她的身体里回荡，直到从她的嘴里发出一声令人灵魂颤抖的呻吟，震动着你的舌头。她在你的唇间呻吟喘息，在你把她操得神魂颠倒时，努力维持着口唇的交缠。很快，她的嘴唇离开了你的嘴唇，发出了一声令人兴奋的音符。从她女性私处的颤抖中，你可以看出她快到了。她的声音变成了飘忽不定的呻吟和深沉的喘息。你加倍努力，更用力地操她，直到她尖叫起来，她的阴道在你仍在抽插的" + get_player().cockDescript() + "周围喷涌而出。[pg]");
            }
            else if(get_player().longestCockLength() > 12 && get_player().longestCockLength() <= 18)
            {
               outputText("当你压入她敏感的女性入口时，[helspawn]发出了咕哝声。你必须用轻柔的摇晃动作将你的" + get_player().cockHead() + "挤进她的体内。这是一项缓慢的工作，但非常有回报，因为她的阴道在你的" + get_player().cockDescript() + "周围颤抖，同时它按摩着她的内壁，直到它们允许它前进。一旦你将整个" + get_player().cockDescript() + "埋入她的阴道壁，[helspawn]就开始唱起一首由颤抖的呻吟和战栗的喘息组成的轻柔歌曲。她的尾巴缠绕在你的腰上，你确信这是为了帮助她控制你抽插的节奏。于是你开始移动，她的声音开始响起，随着你缓慢、全长的抽插而起伏。[pg]");
               outputText("[say:哦……[Daddy]……我……操我！]她对着空气尖叫道。[pg]");
               outputText("你不是那种会让你的小女孩失望的人，你倾身向前，将你的嘴唇贴在她的嘴唇上。她带着奴隶般的饥渴接受了你温柔的吻，但在你开始更用力抽插的那一刻，她放弃了亲吻，在你把她操得剧烈抽搐时，她无法维持这种温柔的姿态。当每一次用力的抽插深入她的女性通道并强行撑开她时，她尖叫起来。从她尖叫声中的急促，你可以看出她快到了。果然，很快她尖锐的声音响起，她的阴道在你仍在抽插的" + get_player().cockDescript() + "周围喷涌而出。[pg]");
            }
            else if(get_player().longestCockLength() > 18)
            {
               outputText("当你的" + get_player().cockDescript() + "钻进她敏感的阴道时，[helspawn]绷紧了身体。从她的小穴在你的" + get_player().cockHead() + "周围被撑开的样子可以明显看出，你正在把她推向极限。你尽可能耐心地开始缓慢的工作，将你的" + get_player().cockDescript() + "按摩进她紧致阴道那颤抖的褶皱中。她阴道壁挤压你肉棒的方式，足以弥补为了撑开她所花费的时间。一旦你成功地将可接受长度的" + get_player().cockDescript() + "埋入她的小穴，你就停下来，让她适应被填满的感觉。[pg]");
               outputText("当你等待她适应你的尺寸时，她的尾巴在你的腰间犹豫着，可能是为了在你开始抽插时帮助她控制你的速度。你告诉她做缓慢的深呼吸，一旦你觉得她可以继续了，你就开始将你的" + get_player().cockDescript() + "在她的阴道里进进出出，缓慢而全长的抽插让她整个身体都在快感中抽搐。[pg]");
               outputText("[say:啊……操……操我，[Daddy]！]她几乎是尖叫着说。[pg]");
               outputText("你不是一个会让你的小女孩失望的人，你向前倾身，将你的嘴唇贴在她的嘴唇上。她热情地吻着你，随着你慢慢加快速度，你们的嘴唇交织在一起。一旦你达到一个合适的速度，她就从吻中抽离，她的身体随着每一次向下的抽插而抽搐。你的根部永远碰不到她的大腿，因为尽管她湿润的小穴已经湿透了，你还是太大了。你很快就把她操得快速抽搐，她的声音不断提醒着你让她感觉有多好。当她的身体开始不受控制地颤抖时，你可以看出她快到了。果然，片刻之后，她的小穴收紧并颤抖着，在你仍在抽插的" + get_player().cockDescript() + "周围喷涌而出。[pg]");
            }
            outputText("一旦她的高潮平息下来，她就向后伸手，把你的[face]拉向她，热情地吻着你。[pg]");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2638) == 0)
            {
               outputText("此时你的好奇心达到了顶峰，她把屁股蹭向你，湿透的阴道紧紧夹着你插入的" + get_player().cockDescript() + "。如果能滑进她的另一个洞里，感受它紧紧包裹着你的肉棒，同时你的小[helspawn]紧缩着呻吟，那该多好啊？如果她像她母亲一样，她肯定会喜欢的。当你提出你的建议时，你感觉到她的尾巴尖滑下你的背部，探入你的[ass]缝隙中。[pg]");
               outputText("[say:好的，[Daddy]，]她说道，因为你刚才的努力仍然气喘吁吁，[say:你可以玩我的，但我也想玩你的，]她咧嘴笑着说，同时把尾巴尖压在你的[asshole]上。你忍不住口头指出了你的" + get_player().cockDescript() + "和她的尾巴之间明显的区别。对此她回答说，[say:你可以设定节奏……我跟着你的引导。你插多深我就插多深，你有多快我就有多快。]");
            }
            else
            {
               outputText("此时你脑海中闪过一个念头。你和[helspawn]第一次共度美好时光时，也是在这个时候你们俩提出了各自的建议。[helspawn]肯定也有类似的想法，因为还没等你反应过来或提出任何建议，你就感觉到她的尾巴滑进了你的[ass]缝隙，就像上次一样。[pg]");
               outputText("[say:你知道我想要什么，[Daddy]，]她狡黠地笑着说。");
            }
            outputText("[pg]<i>（你可以让[helspawn]用她的尾巴操你，同时你操她的屁股，或者放弃肛交的想法，让她骑你。）</i>");
         }
         else if(get_player().totalCocks() > 1)
         {
            outputText("你花了一点时间把她滴落的淫液涂在[eachCock]上，特别是你的" + get_player().cockDescript() + "和" + get_player().cockDescript() + "，让它们充分润滑，为你计划好的事情做好准备。当然，口交可能已经足够了，但一个好家长对自己的小女孩是不会吝啬的。从情况来看，她紧致的后庭比她湿润的阴道经历过更多的实战，这可能是因为她在自慰时用尾巴操自己。当你给肉棒润滑完毕时，你只能摇摇头，感叹她有多像她的母亲。[pg]");
            outputText("你手里拿着" + get_player().cockDescript() + "，把" + get_player().cockHead() + "抵在[helspawn]的后庭入口。当你把光滑的肉棒在她纯洁的后门摩擦时，她兴奋得晕了过去，你的胸膛因为她良好的卫生习惯而充满自豪。然后你握紧肉棒，慢慢地进入她。[pg]");
            if(get_player().longestCockLength() <= 10)
            {
               outputText("当你推入她的后庭通道时，[helspawn]的脸上露出了一个性感的大大笑容。把你的" + get_player().cockDescript() + "滑进她欢迎的尾巴洞里，就像推入一个紧致的手套，它颤抖着，恰到好处地按摩着你。闷热的温度只会让你的" + get_player().cockDescript() + "更加肿胀，让你变得更硬，更渴望以她喜欢的各种方式操她。你试探性地抽插了几下，确保她习惯了你的" + get_player().cockDescript() + "在她渴望的尾巴洞里。[pg]");
            }
            else if(get_player().longestCockLength() > 10 && get_player().longestCockLength() <= 18)
            {
               outputText("当你的" + get_player().cockDescript() + "开始钻入她的后庭通道时，[helspawn]喘息着。这需要一点耐心和一点努力，但多亏了你的坚持，以及你涂满坚硬肉棒的唾液和淫液的混合物，你进展顺利。你摇晃着臀部，越插越深，直到你的根部轻轻地压在她翘起的柔软脸颊上。当你把自己保持在她完美的肛门套紧致闷热的拥抱中时，她呻吟着。她的通道在你周围颤抖，随着她适应你的尺寸，完美地按摩着你深深插入的" + get_player().cockDescript() + "。[pg]");
            }
            else if(get_player().longestCockLength() > 18)
            {
               outputText("当你的" + get_player().cockHead() + "侵入她不适应的尾巴洞时，[helspawn]咕哝着。你听到空气从她嘴里发出一声长长的叹息，让你知道她被填满了。你只把" + get_player().cockHead() + "埋在她颤抖的肛门套里，保持稳定，等待她适应。一旦她习惯了这种感觉，你就开始前后摇晃臀部，轻轻地把肉棒插得更深，进入[helspawn]美丽的屁股那紧致闷热的隧道。一旦你设法把尽可能多的" + get_player().cockDescript() + "插入她体内，她就喘息起来。你只是把自己保持在她危险的紧致洞穴里，耐心地等待她的内部适应。当她适应后，你试探性地抽插了几下，陶醉在她明显的性唤起的狂热中，因为她随着你的每一个动作发出狂野的愉悦咆哮声。[pg]");
            }
            outputText("你很想就这样操她，但你却伸手抓住了你的" + get_player().cockDescript() + "，特别是因为你有更好的计划。[pg]");
            outputText("手里拿着润滑过的" + get_player().cockDescript() + "，你花了一秒钟欣赏这风景。你的" + get_player().cockDescript() + "深深地插在[helspawn]张开的臀瓣里，肉感的垫子漂亮地分开。她回头看着你，与你目光交汇，舔了舔嘴唇，仿佛她完全知道你计划了什么。随着她的尾巴洞被你的" + get_player().cockDescript() + "塞满，你拉起你的" + get_player().cockDescript() + "，将它对准她滴水的阴道口。[pg]");
            if(get_player().longestCockLength() <= 8)
            {
               outputText("你向前推，穿透[helspawn]的阴道口，同时你的" + get_player().cockDescript() + "更深地推入她的肛管。她用内部肌肉挤压你插入的两根肉棒，回头看着你，眼睛里闪烁着欲望的光芒。她太想要你了，当你毫不费力地沉入她湿润的小穴时，她的嘴唇颤抖着。");
            }
            else if(get_player().longestCockLength() > 8 && get_player().longestCockLength() <= 12)
            {
               outputText("你向前推，穿透[helspawn]的阴道壁，同时你更深地推入她的肛管。她喘息着，回头看着你，[helspawneyes]的眼睛里充满了情欲，当你沉入她滴水的小穴时。[pg]");
            }
            else if(get_player().longestCockLength() > 12)
            {
               outputText("你向前推，用你的" + get_player().cockDescript() + "撑开[helspawn]的阴道壁。当你的" + get_player().cockDescript() + "钻入她体内时，她颤抖着。她扭动着屁股，你肉棒的尺寸加上双重感觉让她抽搐。你只是把自己保持在她体内，直到你觉得她能够承受你即将给她的猛烈撞击。[pg]");
            }
            outputText("随着你的肉棒深深地插入[helspawn]的两个洞里，你开始滑进滑出。这简直是天堂。你的" + get_player().cockDescript() + "在一个充满热量的紧致通道里，当它在欢迎的拥抱中进出时，通道按摩着它。同时，你的" + get_player().cockDescript() + "被她滴水的裂缝拥抱着。[pg]");
            outputText("你开始得很慢，陶醉在双重插入带来的令人震撼的感觉中，你带着灿烂的笑容在[helspawn]体内滑进滑出。她的身体紧贴着你颤抖，结合她性感的声音告诉你这正是她想要的。你抓住她的臀部，拉扯着，慢慢地用一记长长的抽插把你的" + get_player().cockDescript() + "和" + get_player().cockDescript() + "塞满她。[pg]");
            outputText("[say:操。]当你开始加快节奏时，[helspawn]轻声喘息，每一次抽插都比上一次更用力地撞击她。起初她只是紧张，然后她开始深呼吸，之后她的声音开始刺破天空。然后，一旦你达到最高速度，她就开始高潮。你忍不住为她能够承受你毫无节制的激情而感到自豪，你知道你很快就会在她的两个洞里灌满证据，证明她做得有多好。[pg]");
            outputText("当双重感觉让她一次又一次地达到高潮时，[helspawn]剧烈地颤抖着。在无数个瞬间，你保持着压力，让她连续释放，她抓挠着地面，乞求怜悯。她美丽的颤抖、汗水覆盖的身体的景象，只有她的阴道和肛门壁紧紧抓住你的" + get_player().cockDescript() + "和" + get_player().cockDescript() + "，同时用她散发着甜味的淫液淹没你的根部时的感觉才能超越。[pg]");
            outputText("当即将射精的冲动席卷你时，你向后仰起头。你的抽插突然变得更用力，你的肌肉紧绷，你的整个身体都在颤抖，随着[eachCock]爆发，用你壮观的精液填满了[helspawn]的两个洞。[pg]");
            outputText("“[Daddy]！”[helspawn]大叫着，你的精液开始注入她的体内。");
            if(get_player().cumQ() < 800)
            {
               outputText("随着你高潮的持续，[helspawn]在快感中抽搐，不经意间让你的肉棒滑了出来。[eachCock]继续喷射，将浓稠的精液溅到地上，洒在[helspawn]布满鳞片的腿上。很快，从[eachCock]喷出的洪流变成了滴落，在[helspawn]的膝盖周围留下了一大滩迅速冷却的滚烫精液。[pg]");
            }
            else if(get_player().cumQ() >= 800)
            {
               outputText("随着你高潮的持续，[helspawn]在快感中抽搐，不经意间让你的肉棒滑了出来。[eachCock]继续射出大量的滚烫精液。像波浪一样，每一股滚烫的精液都拍打在[helspawn]柔软的屁股和布满鳞片的腿上。感觉过了好几天，你的高潮才开始减弱，在[helspawn]沾满精液的身体周围留下了一小片迅速冷却的滚烫精液湖。[pg]");
            }
            outputText("你大口喘着气，仿佛刚跑完一英里，你后退了几步，在附近的一块石头上坐下。当你努力平复呼吸时，[helspawn]站起身，带着幸福的笑容跟着你。她坐在你的腿上，用她布满鳞片的腿缠住你的腰，将你自己的精液涂抹在你的胯部和大腿上，她坐在那里，将你的肉棒夹在她柔软但泥泞的臀缝中。她只是拥抱着你，头靠在你的肩膀上，听着你的呼吸声。");
            _loc1_ = true;
         }
         menu();
         addButton(0,"肛交",sexAnalHelspawn);
         _g = this;
         cameBeforeRiding1 = _loc1_;
         addButton(1,"骑乘",function():void
         {
            _g.sexRidingHelspawn(cameBeforeRiding1);
         });
      }
      
      public function sexAnalHelspawn() : void
      {
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2638) == 0)
         {
            outputText("你觉得这个主意很有趣。你告诉[helspawn]你会很享受的，同时你伸手下去开始抚摸你的" + get_player().cockDescript() + "。她的尾洞仍然闪烁着你之前留下的唾液，这将使看起来很紧的肛门环更容易穿透。你瞄准目标，将你的[cockHead]浸入她抬起并等待着的尾洞中。就在你进入她的那一刻，她强壮的尾巴也进入了你。[pg]");
         }
         else
         {
            outputText("你用行动回答了[helspawn]的提议，你只是张开双腿，身体前倾，将你的" + get_player().cockDescript() + "推入她仍然被唾液润滑的尾洞中。就在你进入她的那一刻，她强壮的尾巴也进入了你。[pg]");
         }
         if(get_player().longestCockLength() <= 10)
         {
            outputText("当你顺畅地推入[helspawn]紧致的肛门环时，她的尾巴也滑入你体内大约相同的长度。[pg]");
            if(get_player().ass.analLooseness <= 2)
            {
               outputText("由于对接受肛门插入有些陌生，你慢慢地开始操[helspawn]。她的尾巴穿过你，让你退缩并收紧，将尾巴困在你紧致的肛门环那老虎钳般的抓握中。[pg]");
               outputText("[say: 呃，[Daddy]……][helspawn]回头看着你说，[say: 你不常做这个，对吧？]你点头确认，[say: 好吧，那我就得给你一点小帮助了。][pg]");
               outputText("说完，她向你的" + get_player().assholeDescript() + "推得更深。她的尾巴滑入你的[asshole]的感觉是一种不适和压力的奇怪组合。在你决定是否喜欢这种感觉之前，[helspawn]开始前后摇晃，迫使你接受她的尾巴，同时她榨取你的" + get_player().cockDescript() + "。这种奇怪的双重感觉是一种令人麻木的快感和轻微不适的奇妙色情组合。你的" + get_player().cockDescript() + "沉浸在紧致、被唾液润滑的洞穴中，享受着它用来操自己的荣耀。同时，你的[asshole]颤抖着，似乎无法决定它所感觉到的感觉是否令人愉悦。然后[helspawn]撞到了你体内的某个东西，你的臀部猛地一挺。[pg]");
               outputText("[say: 找到了！]她得意地说。她开始用尾巴操你的[ass]，并兴致勃勃地操自己。无论她撞击到你体内的什么地方，都让你全身乞求释放，特别是当她的柔软丰满的屁股一次又一次地吞没你的" + get_player().cockDescript() + "时，你们的身体拍打在一起。你不确定自己还能坚持多久。[pg]");
            }
            else if(4 > get_player().ass.analLooseness && get_player().ass.analLooseness > 2)
            {
               outputText("你既不是接受肛门插入的新手，也不是大师，你以中等的速度操着[helspawn]。正如她承诺的那样，她开始将尾巴滑入你的[asshole]，与你的节奏保持一致。一旦你感觉到你的后庭可以承受更多，你悠闲的抽插就开始慢慢加速。她紧致的肛门收缩并榨取你的" + get_player().cockDescript() + "，同时她的尾巴刺激你的前列腺。一旦你达到最高速度，你们俩的声音就开始随着你的抽插而起伏。你充满尾巴的肛门和充满肛门的" + get_player().cockDescript() + "正在将你推向边缘。你没有减慢速度来延长这一刻，而是加快了速度，用草率的抽插朝着你的高潮努力，同时她的尾巴猛击你的[ass]。[pg]");
            }
            else if(get_player().ass.analLooseness >= 4)
            {
               outputText("作为接受肛门插入的专家，你开始尽可能用力地操[helspawn]。正如她所说，她的尾巴开始将你的" + get_player().assholeDescript() + "撑得大大的。她那极其紧致的洞穴榨取你的" + get_player().cockDescript() + "，以及她粗糙的尾巴将你的[asshole]撑得大大的，这两种感觉开始让你受不了。你把谨慎抛在脑后，更用力地操她，用草率的抽插朝着你的高潮努力，同时她的尾巴猛击你的后庭。[pg]");
            }
         }
         if(get_player().longestCockLength() > 10 && get_player().longestCockLength() <= 18)
         {
            outputText("当你推入[helspawn]紧致的肛门环时，她的尾巴也滑入你体内大约相同的长度。她将尾巴保持在你将" + get_player().cockDescript() + "留在她体内的相同角度和深度。你的身体因紧致的洞穴包裹着你的" + get_player().cockDescript() + "，同时你自己也被插入的双重感觉而颤抖。[pg]");
            if(get_player().ass.analLooseness <= 2)
            {
               outputText("你对被插得这么深的感觉发出咕哝声，但[helspawn]似乎没有问题。她的肛门套很温暖，紧紧地贴着你的" + get_player().cockDescript() + "的表面。[pg]");
               outputText("当你没有移动时，她笑了，[say: 你在这方面没有很多经验，对吧，[Daddy]？][pg]");
               outputText("你摇摇头，问她是什么出卖了你。[pg]");
               outputText("她回过头对你笑了笑，[say: 尽量放松，记得呼吸，]她一本正经地说，然后又补充道，[say: ……尽量别动，交给我吧。][pg]");
               outputText("说完，她开始慢慢向后推，将你的" + get_player().cockDescript() + "吞没，同时将她的尾巴更深地推入你的[ass]。你的身体猛地抽搐了一下，你纳闷为什么会有人想把这么大的东西塞进他们的" + get_player().assholeDescript() + "里。仿佛看穿了你的心思，[helspawn]呻吟了一声，你的" + get_player().cockDescript() + "远不及她用来操自己的尾巴长，所以难怪她很享受。你的" + get_player().cockDescript() + "感觉就像在操一条满是唾液的极乐隧道，而你的[asshole]则感觉像被强行入侵了。当她用你的肉棒操自己，同时填满你的后庭时，你尽力保持不动。很快，这种异样的感觉被一种不适和压力的奇怪组合所取代。你无法否认，她的尾巴在你体内滑动的感觉得确有些舒服。然后，她的尾巴碰到了什么东西，让你的" + get_player().cockDescript() + "在她体内跳动了一下。[pg]");
               outputText("[say: 找到了！] [helspawn]惊呼道，她开始用你的" + get_player().cockDescript() + "粗暴地操自己，同时用尾巴操你。每一次深入，她都会击中你体内那个让你颤抖的绝妙部位。你忍不住扭动臀部，向下操进[helspawn]柔软的屁股里，即使她也在粗暴地捣着你的屁股。你用力挺进，在她迷人的屁股上激起阵阵涟漪，这景象令人叹为观止。再加上双重感官刺激，你忍不住觉得这一切很快就会结束。[pg]");
            }
            else if(4 > get_player().ass.analLooseness && get_player().ass.analLooseness > 2)
            {
               outputText("你对后庭插入既不是老手也不是新手，所以你以缓慢的节奏操她。她配合你尺寸的方式让你放慢了速度，但一旦你习惯了她插入你" + get_player().assholeDescript() + "的深度，你决定是时候加速了。你一次次地加快抽插速度，直到达到全速。操人和被操的双重感觉让你的身体在抽插间不断颤抖。在你身下，[helspawn]正处于极度幸福的状态。她那紧致、满是唾液的尾洞榨取着你的" + get_player().cockDescript() + "，同时她的尾巴摆弄着你的[asshole]，这让你危险地接近了高潮的边缘。[pg]");
            }
            else if(get_player().ass.analLooseness >= 4)
            {
               outputText("你对后庭插入并不陌生，开始尽可能用力地操[helspawn]。[helspawn]兑现了她的诺言，开始将她的尾巴在你的[asshole]里抽插。你们的声音交织在一起，两人都沉浸在快速交媾带来的令人头脑发麻的狂喜中。你抛开一切顾虑，用力地操她，陶醉在她的尾巴摆弄你前列腺的感觉中，同时她的屁股榨取着你的" + get_player().cockDescript() + "。你知道很快就要结束了，你带着野兽般的狂怒，向着自己的高潮冲刺。[pg]");
            }
         }
         if(get_player().longestCockLength() > 18)
         {
            outputText("当你推入[helspawn]紧致的肛门环时，她的尾巴也滑入你体内大约相同的长度。当你们被进入时，都发出了闷哼声。你的" + get_player().cockDescript() + "可不是闹着玩的，所以你让她花点时间适应它的长度和粗度。与此同时，你的身体因为双重感觉而颤抖：一个紧致的洞穴包裹着你的" + get_player().cockDescript() + "，而你自己也被插入了。[pg]");
            if(get_player().ass.analLooseness <= 2)
            {
               outputText("[helspawn]的尾巴插得太深了，你开始打退堂鼓。她试图推得更深，以匹配你插入她的深度，这让你在她尾巴的每一次移动中都忍不住退缩。[pg]");
               outputText("[say: 你得放松，[Daddy]……] [helspawn]微微皱着眉头说道。当你没能听从她的建议时，她弓起背，[say: 既然你不常做这种事，我来帮你。往后靠，试着放松，好吗？][pg]");
               outputText("还没等你回答，她的尾巴就让你的身体再次涌起一阵电流。她开始把圆润的屁股向后推，同时把尾巴推入你的[asshole]。她动作缓慢，让你熟悉这种感觉，以便你能放松并享受它。你尽力放松，很快她觉得你状态够好了，便开始加速。你的呼吸变得急促而粗重，脑海中充满了双重感觉。一种是她迷人的屁股用其火热、紧致的拥抱和满是唾液的入口榨取你的肉棒。另一种是她的尾巴带来的一种混合着不适和快感的感觉。然后她碰到了你体内的某个东西，让你忍不住叫出声来。[pg]");
               outputText("[say: 找到了！] [helspawn]惊呼道。她开始在你的" + get_player().cockDescript() + "上操自己，同时粗暴地用尾巴操你的[asshole]。节奏的突然改变让你叫出声来，你受到了难以忍受的快感和不可否认的充实感的双重冲击。她熟练地用每一次尾巴的抽插摆弄你的前列腺，而她渴望的屁眼则榨取着你的" + get_player().cockDescript() + "。很快，你尽可能用力地操她，而她，尽管抓挠着地面并在狂喜中尖叫，却设法用她的尾巴同样用力地操你。当你们把彼此的后庭弄得一团糟时，你知道自己坚持不了多久了。[pg]");
            }
            else if(4 > get_player().ass.analLooseness && get_player().ass.analLooseness > 2)
            {
               outputText("你既不是老手也不是新手，所以你开始慢慢来。在你身下，[helspawn]松了一口气，你猜你们俩在这方面的经验水平差不多。被尾巴操的同时，她迷人的屁股吞没了你" + get_player().cockDescript() + "的全部长度，这种双重感觉很快就像两股狂喜的潮水一样向你袭来。现在你已经习惯了塞进你后门的尾巴长度，你开始加速。你一次次地越操越快，直到达到最高速度。她的尾巴摆弄你前列腺的美妙压力与她性感屁股带来的令人头脑发麻的狂喜结合在一起。很快你就开始颤抖了。你不知道自己还能坚持多久。[pg]");
            }
            else if(get_player().ass.analLooseness >= 4)
            {
               outputText("你陶醉在身下肛门肉套的充实感中，而[helspawn]则在颤抖。当你开始用尽全长用力操她时，她勉强能跟上你的节奏。当她的尾巴在你的[asshole]里进进出出时，你张开双腿，让它插得更深，并更用力地操她。双重感觉简直是极乐。单是她紧致的屁眼榨取你" + get_player().cockDescript() + "的方式就足以让你射精。当结合她的尾巴从你的[ass]里摆弄你肿胀的前列腺的方式时，简直让你爽得快要流泪了。当你继续捣着她，同时也被她捣着时，你感觉到自己的高潮正在迅速逼近。[pg]");
            }
         }
         var _loc1_:int = get_player().longestCock();
         if(get_player().hasKnot(_loc1_))
         {
            outputText("即使你沉浸在激情中，你也很小心，不把你的" + get_player().cockDescript(_loc1_) + "塞进肉结里。仅仅是把那团敏感的肉撞击她的直肠入口就足够了……目前来说。[pg]");
         }
         if(get_player().cumQ() < 200)
         {
            outputText("伴随着一声呻吟，你将你的" + get_player().cockDescript() + "直没至柄，开始释放。[eachCock]开始喷射，你紧贴着她颤抖。[helspawn]挤压着你的" + get_player().cockDescript() + "，同时按压你的前列腺，延长了你的高潮。当你完事后，你不得不推开她那根渴望的尾巴。当你把你的" + get_player().cockDescript() + "从她现在大张的洞里拔出来时，你忍不住欣赏着顺着她长满鳞片的屁股流下并汇聚在湿润小穴里的精液。[pg]");
            outputText("当你努力喘息时，[helspawn]用她长满鳞片的双腿缠住你的腰，紧紧抱住你，将你的" + get_player().cockDescript() + "夹在她柔软的臀沟里，把头靠在你的肩膀上，听着你的呼吸声。[pg]");
         }
         else if(200 <= get_player().cumQ() && get_player().cumQ() < 400)
         {
            outputText("你像野兽一样咆哮着，将你的" + get_player().cockDescript() + "直没至柄，就在这时，[eachCock]爆发了。你能感觉到[helspawn]用发达的直肠肌肉挤压着你的" + get_player().cockDescript() + "，同时她的尾巴继续撞击着你的前列腺。这一切只会延长你高潮的狂喜。当你紧贴着她颤抖时，你能感觉到自己滚烫的精液从她的洞里流出，顺着你的腿流下。当你的高潮消退后，她的尾巴从你的后庭滑落。当你把你的" + get_player().cockDescript() + "从她现在大张的洞里拔出来时，你看到你的精液弄出了一片美丽的狼藉。到处都是：你的腿上、她迷人的屁股上、她长满鳞片的腿上。精液的拉丝甚至连接着她的大腿，从她闪闪发光的小穴里滴落。[pg]");
            outputText("当你试图喘息时，[helspawn]转过身来，用她长满鳞片的双腿缠住你的腰，将你的" + get_player().cockDescript() + "夹在她柔软但黏糊糊的臀沟里。她紧紧抱住你，头靠在你的肩膀上，听着你的呼吸声。[pg]");
         }
         else if(400 <= get_player().cumQ() && get_player().cumQ() < 800)
         {
            outputText("伴随着胸腔震动的嚎叫，你直没至柄地插入，就在这时，[eachCock]爆发了。她榨取着你痉挛的" + get_player().cockDescript() + "，同时继续捣着你的前列腺，让你像沙锤一样颤抖，因为她延长了流遍你全身的高潮快感。你能感觉到自己的精液从她的屁眼里流出，滚烫浓稠的精液浸透了你的[skinfurscales]，顺着你的[legs]滑落到你的[feet]。你仍在颤抖，把你的" + get_player().cockDescript() + "从她体内拔出，看着你被困住的精液顺着她的身体倾泻而下，因为你不再堵住她的屁股了。从她尾洞上方几英寸到她的大腿内侧，到处都覆盖着你乳白色的精液。当她跪在一个令人印象深刻的水坑里时，精液的拉丝连接着她的大腿，但仍有更多的精液从她快乐的屁眼里漏出。[pg]");
            outputText("当你努力喘息时，[helspawn]站起身来，用她长满鳞片的双腿缠住你的腰，把你的精液涂抹在你的胯部和大腿上，她就坐在那里，把你的肉棒夹在她柔软但一团糟的臀沟里。她只是拥抱着你，头靠在你的肩膀上，听着你的呼吸声。[pg]");
         }
         else if(get_player().cumQ() >= 800)
         {
            outputText("当[eachCock]爆发时，你的胸腔回荡着野兽般的咆哮。你的精液如此猛烈地喷射进[helspawn]的肛管，以至于她惊讶地跳了起来，将你的" + get_player().cockDescript() + "从她紧致的洞里释放出来，导致你把精液射满了她的大腿和屁股。与此同时，她的尾巴留在你体内，当你紧贴着她颤抖时，仍在推压着你的前列腺。你的高潮持续了漫长的极乐时光，很快你就站在了一小滩自己的精液中，而且，不知何故，你还在射精。伴随着一声轻笑，[helspawn]从[eachCock]仍在喷发的巨大洪流中站起身来，吻了你。当你因巨大的高潮而抽搐时，她的嘴按摩着你的嘴唇。她的整个下半身闪烁着白光，滴着精液，仿佛她刚洗了个精液浴。[pg]");
            outputText("她用双腿缠住你的腰，紧紧抱住你，把你的精液滴落并涂抹在你的胯部和大腿上，她就坐在那里，将你的" + get_player().cockDescript() + "夹在她柔软但被精液浸透的臀沟里，此时你巨大高潮的最后一点残渣从[eachCock]中溢出。一旦你开始试图喘息，她只是把头靠在你的肩膀上，听着你疲惫的呼吸声。[pg]");
         }
         get_player().orgasm("Anal");
         get_player().orgasm("Dick");
         doNext(postSexHelspawn);
      }
      
      public function set_helspawnName(param1:String) : String
      {
         FlagDict_Impl_.arrayWriteString(KFLAGS.flags,956,param1);
         return param1;
      }
      
      public function scoldHelSpawn() : void
      {
         clearOutput();
         outputText("你双臂交叉在胸前，问你的小蝾螈她到底在干什么。");
         outputText("[pg][say: 呃，我……呃……]她刚开口，你就揪住她的后颈把她拎了起来，把她从蒸馏器旁拉开。她在你手中醉醺醺地扭动挣扎，但在这种状态下无法逃脱。[say: 放、放我下来，" + championRef() + "！]她尖叫着，但你只是啧啧舌头，把她拖走，扔在你的铺盖卷上，远离了那些酒。");
         outputText("[pg]你生气地再次问她在干什么。");
         outputText("[pg][say: 我，呃，只是喝了一杯。妈妈走之前喝的肯定比我多两倍……]");
         outputText("[pg]就因为她妈妈做了某件事，她也应该做吗？");
         outputText("[pg][say: 啥……]");
         outputText("[pg]你坐在[helspawn]身边，抓起一个水袋，告诉她改喝这个——这能缓解之后的宿醉。在你的注视下，她乖乖地服从了，小口喝着水袋里的水。你开始向她解释，当个酒鬼没有任何好处：这会损害她的判断力，让她的头脑变得迟钝；就像她现在这样，灌下几加仑酒后连正常思考都做不到。她喝了那么多居然没死，真是命大，尤其是她还没有她母亲可能花了好几年才建立起来的酒量。");
         outputText("[pg][say: 可是我只是……]她委屈地抬头看着你，小声抱怨道。你叹了口气，搂住她的肩膀，告诉她没关系。她只是需要少碰点酒……她还太小了，不适合喝酒。");
         outputText("[pg]你告诉她，以后她有的是时间做这种事，但现在，她应该离她妈妈的酿酒器远点。");
         outputText("[pg][say: 好的，" + championRef() + "，][helspawn]说道，蜷缩在你身边，头靠在你的[chest]上。");
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,957,FlagDict_Impl_.arrayReadInt(_loc1_,957) - 10);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function saveToObject() : Object
      {
         return saveContent;
      }
      
      public function reset() : void
      {
         saveContent.footjob = false;
         saveContent.sippedAnemone = false;
         saveContent.wakeUp = false;
         saveContent.surprised = false;
         saveContent.fishing = false;
         saveContent.timeTalkedIncest = 0;
         saveContent.slutspawnLastTimeSex = 0;
      }
      
      public function postSexHelspawn() : void
      {
         clearOutput();
         if(get_player().cumQ() >= 400)
         {
            outputText("你们俩都浑身是汗、精液和淫液，瘫倒在地上，完全不顾你们正躺在彼此体液形成的池子里。你们俩的呼吸都像刚跑完马拉松一样。");
         }
         else
         {
            outputText("你们俩都瘫倒在地上，呼吸得像刚跑完马拉松一样。");
         }
         outputText("即便如此，你还是忍不住伸出手，把[helspawn]拉到你的[face]前。坐起身来，你用双臂将她环抱，一次又一次地亲吻她性感的嘴唇。一具因运动和射精而变得湿滑的迷人躯体在你身上摩擦，沾满精液的生殖器带着充满激情的渴望紧紧贴着沾满精液的生殖器。当你伸手去抓她那性感的屁股时，你的手毫不费力地滑过她被汗水浸透的肌肤。与此同时，她的手也在你的[chest]和背部滑动。[pg]");
         outputText("在令人窒息的互相抚摸了几分钟后，你打破了亲吻，但只是为了能亲吻她的其他地方。她带着微笑向后靠去，她那挺拔的乳房闪烁着汗水，你把脸埋在她的脖子里。当你把她放倒在你们俩共同制造的精液堆里时，你听到了她的尖叫声。[pg]");
         outputText("你用嘴唇在她火热的身体上留下了一串轻柔的吻，每一个都是湿润的爱的宣言。你从她完美无瑕的脖子开始，一边给她挠痒痒，一边留下浅棕色的吻痕，这些吻痕在她苍白的皮肤上显得格外显眼。然后你向下移动到她那挺拔的乳头，你的[tongue]在每一个坚硬的凸起周围打转，温柔地提醒她，她依然处于兴奋状态。你品尝着她布满汗水的身体，亲吻着她平坦的小腹和柔软的大腿。你吸吮、舔舐、亲吻她的双腿和大腿，直到你把她的膝盖分开，露出她那沾满精液的阴道。[pg]");
         outputText("你咧嘴笑着抬头看她的脸，她也微笑着低头看你，眼中闪烁着光芒。她张开双腿，尾巴将身体撑起，向你展示她那被淫液浸透的阴道口。你只是静静地欣赏了一会儿这幅美景，看着珍珠般的液体顺着她的身体滴落，与你们身下的淫液汇合。[pg]");
         outputText("你的肚子咕咕叫了起来，眼前的“大餐”让你饥肠辘辘，于是你埋头大快朵颐。你品尝着自己那充满阳刚之气的精液，其中还混合着她甜美的爱液。这绝妙的组合简直是人间美味，你忍不住让它在你的[tongue]上流连忘返。当你的舌头滑过她的阴唇和闪闪发光的阴蒂时，她再次尖叫起来。[pg]");
         outputText("她咯咯笑着推开你，说道：[say: 别闹了，[Daddy]。][pg]");
         outputText("你微笑着问她是不是你做错了什么，你当然知道自己并没有。[pg]");
         outputText("[say: 我全身都软绵绵的，]她害羞地揉着肚子说道。[say: 太敏感了。][pg]");
         outputText("你点点头，答应了她的请求，最后把她小穴里那美味得令人发指的混合物吸溜得一干二净。那味道简直让人欲罢不能，你忍不住在嘴里回味着这浓郁的滋味。然后你注意到[helspawn]正带着好笑的表情看着你，似乎准备拿你开玩笑。为了让她在开口前闭嘴，你直接吻了上去。[pg]");
         outputText("当你与她分享这顿“美餐”时，她发出一声呻吟，急切地将你拉入怀中，用她的温暖包裹着你。她似乎和你一样享受这味道，吸干了你舌头上的每一滴液体，然后给了你一个漫长而热烈的深吻。[pg]");
         outputText("渐渐感到疲倦的你们打了个哈欠，躺了下来。[helspawn]依偎着你，把头靠在你的[chest]上。[pg]");
         outputText("[say: 我爱你，[Daddy]，]你亲爱的[helspawn]在快要睡着时说道。[pg]");
         outputText("你打了个哈欠，亲吻了她的额头，告诉她你也爱她。[pg]");
         outputText("你们俩静静地打了个盹，在沉默中享受着彼此的陪伴。当她依偎在你的胸膛上时，你回想起让你们走到一起的种种往事。你回想起赫莉娅如何在半夜把你叫醒。你低头看着[helspawn]安静熟睡的模样，知道对于这个叫你“[Daddy]”的美丽小女孩，你没有任何遗憾。[pg]");
         outputText("凝视了她美丽的脸庞片刻后，你轻轻地从她熟睡的臂弯中挣脱出来。当你重获自由时，她发出一声轻柔的呻吟，翻了个身。你把[helspawn]抱在怀里，把她抱到你的铺盖卷上，把她放进被窝里。她睁开眼睛，对你笑了笑，然后又闭上了眼睛。[pg]");
         outputText("回到你们刚刚交媾后满地狼藉的地方，你找到你的" + Utils.cnName(get_player().get_armorName()) + "并穿上。你作为勇者的职责在召唤。穿上[armor]，手握[weapon]，你在[helspawn]熟睡的额头上轻轻一吻，然后起身离开，让她安稳地睡去。[pg]");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2638,1);
         saveContent.slutspawnLastTimeSex = get_game().time.days;
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function playWithYourKid() : void
      {
         var _g1:HelFollower;
         var _g:HelSpawnScene;
         clearOutput();
         outputText("你告诉赫尔你想花些高质量的时间和[helspawn]在一起，她立刻高兴起来。");
         outputText("[pg][say: 当然，那太好了！如果你能帮我照顾她一会儿，我会很高兴的。]她低头看了看那只小蝾螈，她正用一根棍子戳着你看不清的东西。[say: 她真是个麻烦精……]");
         outputText("[pg]赫莉娅弯下腰向你的女儿解释了情况，女儿随后急切地跑到你面前，笑容中充满了活力。你打算怎么打发时间？");
         menu();
         addNextButton("玩耍",helspawnPlay).hint("好好享受一段快乐时光。");
         addNextButton("接球",helspawnCatch).hint("和你的女儿玩接球游戏。").disableIf(!get_player().hasItem(get_useables().RBRBALL),"你手上没有可以玩接球的东西。");
         addNextButton("洗澡",helspawnBathe).hint("给你的女儿洗个澡。");
         addNextButton("篝火",helspawnCampfire).hint("和家人围坐在篝火旁。").disableIf(!get_time().isTimeBetween(18,22),"现在生篝火太" + (get_time().hours < 18 ? "早" : "晚") + "了。");
         _g = this;
         addNextButton("读书",function():Boolean
         {
            return _g.helspawnRead();
         }).hint("尝试一些更有教育意义的事。").disableIf(!helspawnRead(false),"你没有书可以给她读。");
         _g1 = get_helFollower();
         addButton(14,"返回",function():void
         {
            _g1.heliaFollowerMenu();
         });
      }
      
      public function onAscend(param1:Boolean) : void
      {
         reset();
      }
      
      public function ohGodEwKihaAndHelspawnSuckAtCooking() : void
      {
         clearOutput();
         outputText("你把炖菜吐在地上，抓起附近的水袋，试图冲掉嘴里的味道。奇哈和[helspawn]惊恐地看着你擦干嘴巴，开始语无伦次地解释你刚才吃进嘴里的那……那玩意儿……到底有多难吃。还没等你把这对长着鳞片的红发母女训斥完，她们的震惊就变成了愤怒。奇哈怒视着你，一把夺过你手里的勺子。");
         outputText("[pg][say: 噢，你懂个屁啊，你个大笨蛋！这明明很好吃，对吧，[helspawn]？]她咆哮着，还没等你阻止，就舀了一大口塞进嘴里。咽下去的一瞬间，奇哈浑身僵硬；她的眼睛瞪得像铜铃一样大，泪水在眼眶里打转。她向后倒去，重重地摔在地上，发出一声沉闷的<i>砰</i>声。");
         outputText("[pg][say: 奇-奇哈？][helspawn]尖叫着，看着母龙瘫倒成一堆软绵绵的鳞片和皮革。[say: 你没事吧？她没事吧，" + championRef() + "？]");
         outputText("[pg]看着明显已经昏迷的母龙，你端起大锅，把里面的东西倒在干裂的土地上，看着荒地吞噬了这可怕的混合物——尽管连大地似乎都不愿意吃奇哈做的饭，因为地上的裂缝里充满了麝香味的液体，只是缓慢地渗入泥土中。");
         outputText("[pg]你立刻开始清洗大锅，并告诉[helspawn]你会向她展示真正的厨艺。");
         outputText("[pg]你和[helspawn]很快就忙活起来，用你的口粮和她与奇哈第一次尝试时收集的香料，搅拌出你们自己的特制混合物。一旦你把基本材料放进去，你就退后一步，把勺子递给她，告诉这只年轻的蝾螈尽情发挥。她像个孩子一样咧嘴笑着，开始工作，混合了各种乱七八糟的食材。等她做完的时候，大锅已经快要溢出来了。她刚舀出第一碗，奇哈就坐了起来，呻吟着。");
         outputText("[pg][say: 到底发生了什么？]母龙嘶嘶地说着，揉着太阳穴。[say: 感觉像被锤子砸了一下。]");
         outputText("[pg][say: 你，呃，从边缘摔下来了，奇哈阿姨。把炖菜都弄洒了。给，我们为你重新做了一份！][helspawn]撒谎道，端给“奇哈阿姨”一碗香气扑鼻的棕色糊状物，里面漂浮着胡萝卜和香料，就像平静湖面上的小船。至少闻起来好多了。");
         outputText("[pg][say: 嗯？]奇哈说着，一把夺过碗。[say: 你没在这上面动什么手脚吧，笨蛋？]她问道，用责备的眼神看着你。");
         outputText("[pg]你告诉她你当然没有，同时在背后交叉着两根手指。");
         outputText("[pg]奇哈用怀疑的眼神看着你，但还是试探性地抿了一口。当她喝下第二口、第三口时，她的眼睛亮了起来，很快就贪婪地大口吃了起来。[say: 早就告诉过你了，笨蛋！]她得意洋洋地说着，放下空碗。[say: 没有什么比奇哈阿姨的独家秘方更棒的了！]");
         outputText("[pg]你只是摇摇头，拿了一个碗，和这两位长着鳞片的女士坐在一起享受午餐，试图无视[helspawn]一直挂在脸上的那种欠揍的笑容。");
         get_player().refillHunger(25);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function noYouDontLoveHeliaYouMonster() : void
      {
         clearOutput();
         spriteChooser();
         outputText("尽管你很享受性爱，尽管你很喜欢赫尔，但你不能说你对她有那种感觉。你抓住她的肩膀，尽可能温柔地告诉她你的感受。当你说话时，她慢慢地点头，等你讲完时，她揉了揉眼睛。");
         outputText("[pg][saystart]好吧，谢谢你的坦诚，[name]。我……我真的很感激。但是，也许你还能帮我解决我的问题。如果不行我也能理解，但我还是得问：");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,962,-1);
         heliaLoveFollowup();
      }
      
      public function noKidsHel() : void
      {
         clearOutput();
         spriteChooser();
         outputText("你摇摇头说不，你不想生孩子。至少现在不想。");
         if(get_player().hasCockThatFits(get_helFollower().heliaCapacity()))
         {
            outputText("就算你想也不行——你太大了，进不去。");
         }
         outputText("话音刚落，你看到赫尔的肩膀垮了下来，脸上满是沮丧。[say: 你——你确定吗？求你了，[name]，我真的、真的很想要个孩子。想让</i>我们<i>有一个。]");
         outputText("[pg]你告诉她不，至少现在你没兴趣。她苦苦哀求了好几分钟，但你坚持己见。最后，她妥协了。[say: 好吧，[name]。我……我想我会尊重你的决定。爸爸给了我一些草药，说只要我吃了，我就会恢复正常。如果你想这样，我就开始吃。只要告诉我如果你——什么时候——准备好了，[name]。我会准备好的。]");
         outputText("[pg]她凑上来在你的脸颊上亲了一下，然后走回营地，留你一个人在黑暗中面对你的选择。最终，你设法重新入睡……");
         doNext(playerMenu);
      }
      
      public function noHuntingBitches() : void
      {
         clearOutput();
         spriteChooser();
         outputText("你决定不去，蝾螈们耸了耸肩。");
         outputText("[pg][say:好吧，也许下次你会改变主意的。到处都是邪恶的毛球！]赫尔笑着说。[say:来吧，我们去找点东西给大伙吃，好吗？]");
         outputText("[pg]事情解决后，你坐了下来，赫尔分发了一些对她的家人来说应该算是晚餐的东西——主要是酒和口粮——很快你就和这个吵闹的家庭一起享受了一顿饭，听着赫尔的荤段子或哈康的老战役故事大笑。");
         get_player().refillHunger(30,false);
         outputText("最终，哈康和奇里离开了，挥手告别，直到他们下次能来拜访。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function nameDatHelspawn() : void
      {
         clearOutput();
         spriteChooser();
         outputText("你和赫莉娅相视一笑，低头看着正在吸吮的小女儿。然而，在几分钟幸福、快乐的时光之后，赫尔转向你，问了一个问题：");
         outputText("[pg][say: 那么……我们给她起什么名字呢，亲爱的？老实说，我没怎么想过女孩的名字。我猜，我有点期待是个男孩，但是……由你决定，[name]。你觉得呢？]");
         menu();
         addButton(0,"继续",applyHelspawnName);
         genericNamePrompt();
      }
      
      public function maiWouldBeTheBestInseminator() : void
      {
         clearOutput();
         spriteChooser();
         outputText("你告诉赫尔，你觉得舞会是个好父亲。赫莉娅点头同意，说道：[say: 是啊，我同意。她是个美人，我相信我们的孩子一定会很漂亮……你不介意她来看孩子吧？我是说，你和我一起抚养我们的孩子——他肯定会是我们的——但我相信舞至少会想来看看她的孩子。]");
         outputText("[pg]你点点头，说没关系。赫尔对你灿烂一笑，在你的脸颊上亲了一下，然后跑回营地，说她要尽快去找那对狐狸姐妹。你猜下次见到她时，赫尔可能已经怀上了你要帮忙抚养的孩子。");
         get_game().helScene.pregnancy.knockUpForce(25,336);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,965,1);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,958,2);
         doNext(playerMenu);
      }
      
      public function maiVisitsHerKids() : void
      {
         clearOutput();
         spriteChooser();
         outputText("当你回到营地时，你注意到赫尔和[helspawn]正坐在营地中央的炊火旁，你的女儿摇摇晃晃地坐在她的亲生父亲，狐狸女孩舞的腿上。");
         outputText("[pg][say:嘿，我的爱人，看看谁来了！]赫尔喊道，向你招手，直到你在她身边坐下，一条温暖、粗糙的尾巴迅速缠绕在你的腰上。");
         outputText("[pg][say:嗨，[name]，]舞带着端庄的微笑说道，双臂环绕着[helspawn]的肚子，试图抱住这个比她高将近[if (metric) {三十厘米|一英尺}]的女儿。最后，她笑着放开了年轻的蝾螈。[helspawn]坐下来，坐在她父母的身边，很快就有一只光滑的手和一只长满鳞片的手抚摸着她的头发。");
         if(helspawnChaste())
         {
            outputText("[pg][helspawn]高兴地把头靠在舞的腿上，接受着这份爱意，尾巴在身后欢快地摇摆着，狐狸耳朵在舞抚摸它们时抽动着。");
         }
         else
         {
            outputText("[pg][helspawn]向后靠去，拿出一个水壶，深深地喝了一大口，然后递给她的父亲，后者带着会心的微笑接过，像个勇者一样一饮而尽。");
         }
         outputText("[pg][say:那么你觉得怎么样，舞？]赫尔说着，向她的女儿点了点头。");
         outputText("[pg][say:是啊，我们干得不错，赫尔，]她说着，倾身给了蝾螈一个快速的吻。[say:她真是个美人……而且了解你，她总有一天会成为一个出色的战士。你应该找个时间带她去特尔阿德雷。我们需要像她这样的守卫。]");
         outputText("[pg][say:一个蝾螈守卫？那可真是太阳打西边出来了！]赫尔大笑道，[say:他们勉强才让老爹和奇里进去。不，如果你想看你的小女孩，你就得自己走过来。]");
         outputText("[pg]舞假装叹了口气。[say:好吧，我们总可以再要一个。一个给你，一个给我！]她说道，这次稍微认真了一点——而且声音中带着毫不掩饰的欲望。");
         outputText("[pg][say:哦，不，]赫尔大笑着，调皮地推了她的爱人一下，[say:这一个就够难对付的了，不是吗？]");
         outputText("[pg][say:嘿——，][helspawn]抱怨着，气呼呼地交叉着双臂。");
         outputText("[pg]她的父母大笑起来，舞单膝跪在她身边，把手伸进口袋里拿出一个小盒子。[say:我知道这不算什么，但既然我不能经常来这里……]舞说着，打开盒子，拿出一条饰有小宝石扣的金项链。");
         outputText("[pg]当舞把金链子戴在女儿脖子上时，[helspawn]的眼睛亮了起来。[say: 当我不在身边时，留个念想，]她眨了眨眼说道，让她的孩子蹦蹦跳跳地去找镜子。");
         outputText("[pg][say: 还有你，[name]，]她转向你说道，[say: 谢谢你照顾[helspawn]。我-我的意思是，我知道我本来就是为了你和赫尔才生下她的，但是……她是个好孩子，我还是很爱她。保护好她，好吗？]");
         outputText("[pg]你保证你会的，舞快速点了点头，跑去追[helspawn]，准备道别。当她离开时，赫莉娅咧嘴笑了，紧紧地抱住你。[say: 她是个好女孩，[name]。不可能为我们的女儿找到比这更好的父亲了。]");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function loseSparringToDaughter() : void
      {
         if(helspawnSlutty())
         {
            outputText("当你踉跄后退时，");
            if(get_player().get_lust() >= get_player().maxLust())
            {
               outputText("屈服于你自己的欲望");
            }
            else
            {
               outputText("无法抵挡她无休止的攻击");
            }
            outputText("，[helspawn]迅速扫倒你的[legs]，让你一屁股摔在地上。你闷哼一声倒下，");
            if(!get_player().get_weapon().isAttached())
            {
               outputText("武器脱手掉落");
            }
            else
            {
               outputText("甚至连握紧拳头的力气都没有了");
            }
            outputText("，片刻之后，[helspawn]就骑到了你身上，用她有力的双腿跨坐在你身上，将你按倒在泥土里。");
            outputText("[pg][say:现在，我该拿你怎么办呢，嗯？]她戏谑道，舔了舔嘴唇，打量着她的战利品。[say:母亲大人常说，只把人揍一顿就放走是不礼貌的……]");
            outputText("[pg]她话还没说完，你们俩就忍不住笑了起来。她粗鲁地捶了一下你的肩膀，然后翻身滚开，仰面躺在你身边。[say:真好玩，" + championRef() + "。谢谢你陪我玩。没生气吧？]");
            outputText("[pg]你轻笑一声，踉跄着站起[feet]，停下来揉了揉她的头发，收拾好你的装备。");
            outputText("[pg]该死，他们长得真快。");
         }
         else
         {
            outputText("当你踉跄后退时，");
            if(get_player().get_lust() >= get_player().maxLust())
            {
               outputText("屈服于你自己的欲望");
            }
            else
            {
               outputText("无法抵挡她无休止的攻击");
            }
            outputText("，[helspawn]抓住了你的手臂，在你摔倒前接住了你。[say:小心点，" + championRef() + "，我抓到你了，]她说着，把你拉进一个短暂的拥抱。");
            outputText("[pg][say:你没有对我手下留情，对吧？]当你恢复平衡时，她问道。当你摇头时，她喜笑颜开，笑得合不拢嘴。她蹦蹦跳跳地躲开你的触碰，开心地跳起了一支小舞，为战胜强大的勇者而沾沾自喜。你摇摇头，揉了揉她的头发，提醒她不要太得意忘形。");
            outputText("[pg][say:我才不会呢，" + championRef() + "！]她咧嘴一笑，在你的脸颊上飞快地亲了一下，然后你出发去");
            if(get_player().get_HP() < 1)
            {
               outputText("从那顿胖揍中恢复过来");
            }
            else
            {
               outputText("把头浸入水中");
            }
            outputText("。");
         }
         get_combat().cleanupAfterCombat();
      }
      
      public function load(param1:int, param2:*) : void
      {
         Utils.extend(saveContent,param2);
      }
      
      public function incestWithHelspawn() : void
      {
         clearOutput();
         outputText("你捧起[helspawn]的脸颊，让她转向你。最知道如何引导她的人是你，她的[father]。[if (chastespawn) {深深的红晕染红了她的脸。[if (!helspawnvirgin) {[say: 我-我想你是对的……]|[say: 但-但是你是我的……[dad]。]}] 她移开视线，紧张地摇着尾巴。[father]对[his]女儿的爱是深沉的，当她有更多时间了解世界和性时，她将更适合应对外面的危险，而在此时此地，她可以按照自己的节奏，在安全的环境中探索这一切。[Helspawn]抬头望着天空。[say: 在内心深处，我真的是一个……[daddy]的乖女儿，] 她说着，转过身来吻了你的嘴唇。|红晕爬上了她的脸庞，很快变成了性感的凝视。[if (!helspawnvirgin) {[say: [Daddy]最懂了。]|[say: 我不知道还有这个选项。]}] 沉浸在这一刻中，你的女儿将自己推向你，将她的舌头与你的舌头交织在一起。当她进一步拥抱你时，她身体的温暖似乎变得更加强烈。很快，她的四肢都缠绕在你身上，她移开嘴唇说话。[say: 让我们让[if (isfeminine) {我的另一个}]妈妈嫉妒我有多么为你着迷吧……] 在她再次吻你之前，她发出了一声短促的咯咯笑声。[say: 我很幸运能有像你这样的人来抚养我……并爱我。我爱你，[daddy]。]}]");
         outputText("[pg]向她传达了你的爱意后，你感到性欲在体内翻涌。但那只头晕目眩、满脸通红的蝾螈跳了起来，四处游荡，也许是被这突如其来的进展弄得不知所措，再也坐不住了。只要你想，你随时都能轻易找到她。");
         outputText("[pg][b:([Helspawn]已被移至恋人菜单！)]");
         dynStats(DynStat.Lust(get_player().sens / 10 + 5),DynStat.NoScale);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,970,1);
         saveContent.timeTalkedIncest = get_game().time.days;
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function hugHelspawn() : void
      {
         clearOutput();
         if(get_player().get_tallness() <= 72)
         {
            outputText("你伸出手，将[helspawn]拉下来与你平齐，双臂紧紧环绕着她纤细的肩膀。这个高大的女孩咧嘴笑着，也紧紧地回抱你，她强健的肌肉几乎要压碎你较小的身体。她的尾巴滑过你的[hips]，当她依偎着你时，温暖的皮革将你与你心爱的女儿绑在一起。");
            outputText("[pg][say: 我也爱你，" + championRef() + "，]她笑着，在放开你之前，在你的脸颊上飞快地吻了一下。");
         }
         else
         {
            outputText("你抓住[helspawn]，将她拉进一个紧紧的拥抱。当她倒在你的怀里并紧紧回抱你时，她发出了少女般的咯咯笑声。她强壮的手臂几乎要压碎你较大的身体，用爱意将你淹没。她的尾巴滑过你的[leg]，当她依偎在你的[chest]时，温暖的皮革将你与你心爱的女儿绑在一起。");
            outputText("[pg][say: 我也爱你，" + championRef() + "，]她笑着，在放开你之前，在你的脸颊上飞快地吻了一下。");
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function helspawnsMainMenu() : void
      {
         var _g1:Camp;
         var _g:Camp;
         var _loc1_:* = null as Function;
         clearOutput();
         outputText("你把[helspawn]叫过来，她跑了过来，");
         if(get_player().get_tallness() <= 72)
         {
            outputText("把你从[feet]上抓起来，紧紧地抱住你");
         }
         else
         {
            outputText("伸出双臂紧紧地抱住你");
         }
         outputText("。你忍不住笑了起来，揉了揉她火红的头发，问她有没有时间。");
         outputText("[pg][say: 当然，" + championRef() + "！怎么了？]");
         menu();
         addButton(0,"外貌",helSpawnsAppearanceScreen).hint("仔细看看[helspawn]，欣赏你女儿的美丽。");
         addButton(1,"交谈",talkToHelspawn).hint("花点时间和[helspawn]聊聊。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,970) == 1)
         {
            addButton(2,"做爱",helSpawnSexMenu).disableIf(get_player().get_lust() < 33,"你还不够兴奋，无法做爱");
            addButton(6,"亲吻",helspawnSmooch).hint("浪漫地亲吻你的女儿。");
         }
         addRowButton(0,"切磋",sparHelspawn).hint("和[helspawn]进行一场切磋。");
         addButton(5,"拥抱",hugHelspawn).hint("和你的女儿深情相拥。你确信她会喜欢的，毕竟她是赫尔的女儿。");
         addRowButton(1,"摸头",helspawnHeadpats).hint("乖女儿就该被摸摸头。");
         addButton(9,"睡觉" + (FlagDict_Impl_.arrayReadString(KFLAGS.flags,701) == "Helspawn" ? "(独自)" : (FlagDict_Impl_.arrayReadString(KFLAGS.flags,701) == "salamanders" ? "(不陪)" : "(陪同)")),sleepWithHelspawn);
         if((FlagDict_Impl_.arrayReadString(KFLAGS.flags,701) != "Helia" || FlagDict_Impl_.arrayReadString(KFLAGS.flags,701) != "salamanders") && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,970) == 0)
         {
            addButtonDisabled(9,"同床共枕","你们的关系需要变得更加亲密，然后你才能和她同床共枕。");
         }
         addRowButton(2,"钓鱼",helspawnFishing).hint("带[helspawn]出去钓鱼。").disableIf(FlagDict_Impl_.arrayReadString(KFLAGS.flags,959) != "bow" && (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2005) == 0 || get_player().keyItemv1("Carpenter\'s Toolbox") == 0),"你没有任何东西可以用来制作鱼竿。").hideIf(saveContent.fishing);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,970) == 1)
         {
            _g = get_camp();
            _loc1_ = function():void
            {
               _g.campLoversMenu();
            };
         }
         else
         {
            _g1 = get_camp();
            _loc1_ = function():void
            {
               _g1.campFollowers();
            };
         }
         addButton(14,"返回",_loc1_);
      }
      
      public function helspawnsCampLines() : void
      {
         if(get_camp().isForceSleepTime())
         {
            if(FlagDict_Impl_.arrayReadString(KFLAGS.flags,701) == "Helspawn")
            {
               outputText("[Helspawn]在你的[cabin]外打发时间，等着你上床睡觉。当她看到你时，睡眼惺忪地向你露出充满爱意的微笑。");
            }
            outputText("[helspawn]睡在离她母亲不远的地方，[if (!helspawnchaste){同样处于醉酒状态|看起来比赫莉娅整洁得多}].[pg]");
         }
         else
         {
            outputText("你的女儿[helspawn]在离她母亲不远的地方铺好了自己的铺盖卷。她自己目前正忙着在营地里四处嗅探。");
         }
         outputText("[pg]");
      }
      
      public function helspawnWakeUp() : void
      {
         clearOutput();
         switch(Utils.rand(3))
         {
            case 0:
               outputText("当清晨的阳光照进[cabin]时，你睁开眼睛，注意到空气中弥漫着一种泥土的气息。当你开始动弹时，已经醒来的[helspawn]端着两杯似乎是香气来源的东西冲向你。她坐在你身边，递给你其中一杯。");
               outputText("[pg][say: [if (helspawnchaste) {早上好！给你，我为我们泡了一些花草茶。我最近到处收集草药，就是我听说人们经常用来泡茶的那种。我觉得我这里的东西味道也相当不错。|嘿，很高兴看到你醒了。我为我们泡了一点花草茶。我研究了人们用来泡茶的草药，收集了一些我觉得我们会喜欢的。这其实不是我的风格，但我加了一点特别的东西来让我们清醒一下。}]] 不妨试试。你喝了一口，[if (helspawnchaste) {尝起来有泥土味。非常浓的泥土味。但即使如此，味道也相当不错。无论她在里面放了什么，作为晨饮都足够好了。你称赞了她的茶，她高兴地笑着，自己也喝了一口。|立刻就能尝出她在里面掺了一点她的酒。但即使如此，她使用的草药绝对不差。事实上，这是一种相当美味的饮料。而且你可以肯定里面的酒精绝对不足以对你产生任何影响。总的来说，这是一种不错的小饮料。你称赞了她的茶，她只是给了你一个会意的微笑，然后开始喝她自己的那杯。}]");
               outputText("[pg]你喝完饮料，然后轻轻拍了拍[helspawn]的头，然后起身准备开始新的一天。");
               break;
            case 1:
               outputText("清晨的阳光照进[cabin]，促使你慢慢睁开沉重的眼皮。你看到的第一件事是[helspawn]用困倦但充满爱意的眼神看着你。");
               outputText("[pg][say: [if (helspawnchaste) {嘿。我自己也没醒多久。你睡觉的样子太迷人了，我忍不住在这里多待了一会儿。毕竟，我非常爱你。|嘿，[Dad]。很高兴看到你终于醒了。你睡觉的脸就是有一种让人着迷的魔力，你知道吗？}]] [Helspawn]给了你一个[if (helspawnchaste) {缓慢而充满爱意的|快速但强烈的}]吻，然后开始起身。毕竟现在是早上了。你也起身[if (isnaked) {准备开始你的一天|穿好衣服准备开始你的一天}]，同时告诉你的女儿你和她一起睡觉的感受。完成后，你感觉到[helspawn]靠近，从背后紧紧地抱住你。你们俩站在一起待了一会儿，然后她默默地放开你，开始你的一天。");
               break;
            case 2:
               outputText("当阳光唤醒你时，你注意到一些有点奇怪的事情。不知怎么的，在睡觉的时候，[Helspawn]设法用手臂完全环抱住你的躯干，用腿紧紧地缠住你的[if (haslegs) {legs|lower body}]。做个小勺子没什么不好的，但你肯定不记得自己是在这样的抓握中入睡的。不过这真的很舒服。她柔软的皮肤紧紧贴在你的背上，她光滑的鳞片手臂和腿紧紧地缠绕着你，她身体的温暖如此自由地分享着。如果能一整天都这样躺着，那真是太容易了。但你不能，你还有事情要做。你尽可能小心地操纵你女儿长满鳞片的四肢，使它们不再缠绕着你，然后慢慢起身。");
               outputText("[pg]成功逃脱了女儿充满爱意的拥抱，你起身开始[if (!isnaked) {穿好衣服并}]准备开始你的一天，看着[helspawn]在你做这些的时候睡得很香。她可以多休息一会儿，她在你的[bed]上看起来那么可爱和舒服。于是，你尽可能安静地走出[cabin]，开始你的一天。");
         }
         saveContent.wakeUp = false;
         doNext(playerMenu);
      }
      
      public function helspawnSurpriseEnd(param1:int) : void
      {
         outputText("[pg][say: 我爱你，[Daddy]。]当你用手指穿过她那被汗水浸湿、凌乱的头发时，她发出一声满足的叹息，她那[helspawneyes]眼睛闪烁着明亮的光芒，注视着你的眼睛。[say: 感觉怎么样？]她终于结结巴巴地问出这句话[if (!helspawnchaste) {，这大概是你最没想过会从她嘴里听到的话}]。");
         outputText("[pg]" + (param1 == 0 ? "毕竟这是你要求的，而且这也是你想要的一切" : (param1 == 1 ? "[if (!helspawnchaste) {你对你的小女孩的期望不过如此|你从没想过她会这么做，但这绝对是值得的}]" : "这就是你想要的一切")) + "，你告诉她，她的笑容变得更加灿烂。你几乎以为她要说些什么来回应，但她却把你抱得更紧，依偎在你的胸前，满足于与你分享她的温暖。但你还得开始新的一天，所以在和她休息了一会儿后，你轻轻地抚摸她的脸颊，直到她醒来。");
         outputText("[pg][say: [if (!helspawnchaste) {嗯？好吧，今天尽量不要[i:太]想我哦|抱歉让你久等了}]]。[Helspawn]不情愿地站起身来，当你站在她身边时，她的尾巴在你的[skinshort]上蹭来蹭去。[if (isnaked) {[if (!helspawnchaste) {你们俩对视了一秒钟，然后她耸了耸肩，|你等着你的女儿穿好衣服，然后她}]|你们俩迅速穿好衣服，然后她}]牵起你的手，和她的[father]一起走出了你的[cabin]。");
         outputText("[pg][say: [if (helspawnsleep) {今晚见|别让我久等}]，[Daddy]。]");
         saveContent.slutspawnLastTimeSex = get_game().time.days;
      }
      
      public function helspawnSurprise() : void
      {
         saveContent.surprised = true;
         registerTag("helspawnsleep",TagFun_Impl_.fromBool(FlagDict_Impl_.arrayReadString(KFLAGS.flags,701) == "Helspawn"));
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,970) == 0 || get_player().isGenderless())
         {
            helspawnSFWSurprise();
         }
         else if(get_player().hasCock())
         {
            if(get_player().hasVagina() && Utils.rand(2) == 0)
            {
               helspawnFemaleSurprise();
            }
            else
            {
               helspawnMaleSurprise();
            }
         }
         else
         {
            helspawnFemaleSurprise();
         }
      }
      
      public function helspawnSparPrank2() : void
      {
         clearOutput();
         outputText("令你惊讶的是，原本只是一个恶作剧，最后却变成了将近一个小时的战斗演习，主要围绕着教导[helspawn]适应迷失方向的效果。无论是什么改变了她的平衡中心，比如她站在摇晃的地面上或船的甲板上，或者改变了她的平衡感，比如头部受到打击或药物的影响，多亏了舒尔德拉的法术，她对这些都有了更强的掌握。");
         outputText("[pg]战斗终于结束了，舒尔德拉经常对你的想法感到好奇，她谈到了你的惊讶。[say: 勇者，这让我笑得很开心，但我看到了做父母的机会，我就抓住了。]");
         outputText("[pg]当你把你的想法传达给幽灵时，你的女儿插话打断了你的注意力。");
         outputText("[pg][say: 嘿，[dad]，]她说道，呼唤你的注意。你把目光转向她，想看看她在说什么。[say: 谢谢。]");
         outputText("[pg]蝾螈站起来，坐得更近了。[say: 不仅仅是为了教我，而且……]她停顿了一下，微笑着。[say: 谢谢你成为我生活的一部分，我爱你，[dad]。]");
         outputText("[pg]你的[paternal]本能占据了上风，让你毫不犹豫地拥抱了她。你回应了她的感情，就像她回应了你的拥抱一样。在你的脑海深处，可以听到一声充满爱意的[say: 哇哦]。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function helspawnSparPrank() : void
      {
         clearOutput();
         outputText("配合着这个" + (get_shouldraScene().ghostLoli() ? "小" : "") + "幽灵，你向[helspawn]解释说，你能教给她的战斗知识比赫莉娅多得多。毕竟，赫莉娅是个疯狂的狂战士，狂野且容易被利用，而你对战斗战术的理解更加细致入微。");
         outputText("[pg][say:哈！让我看看你有多“细致入微”，[Dad]，][helspawn]说着，摆出了战斗姿势。");
         outputText("[pg]你予以回击，像赫莉娅那样率先出招，打算用她以为是连击的佯攻来绊倒[helspawn]。然而，舒尔德拉却另有打算。当[helspawn]被你的逼近分散注意力时，远处传来的施法感伴随着她尾巴的视觉变形。你注意到了这一点，并继续进攻。当你的女儿试图躲闪时，她现在变长的尾巴使她的平衡发生了意想不到的偏移，她彻底摔倒了。");
         outputText("[pg]这只蝾螈晕头转向地爬起来，检查自己看看是中了什么诡计，但她的尾巴已经恢复了正常。[say: 再——再来！]她命令道，为自己的失误感到慌乱。");
         outputText("[pg]这一次她带头冲锋，明显是在准备擒拿。你向左闪避，她向你扑来，但她再次变长的尾巴将她的冲力变成了一个彻底的旋转。可怜的战士像个喝醉的芭蕾舞演员一样旋转着，任由她[if (metric) {3.5米|12英尺}]长的附肢产生的扭矩摆布。头晕目眩的[helspawn]揉着脑袋瞪着你。现在已经无法掩饰有人在搞鬼了。");
         outputText("[pg][say: [Dad]！这不公平，你这是在耍我！]她指责道。你正考虑如何解释这个恶作剧，但一阵头痛却袭来。");
         outputText("[pg]你的眼睛闪烁着金色的光芒，舒尔德拉挤到了最前面。[say: 拜托，孩子，真正的战斗比这不可预测得多！就算我用了一点魔法来耍你又怎样，我又不是唯一能做到这一点的人，]幽灵解释道。[say: 如果使用者的脑细胞超过半个，黑魔法就能把大脑的化学反应搞得一团糟，更别提狐狸魔法了。]");
         outputText("[pg][helspawn]眨了眨眼，消化着这些信息。[say: 你说得对！我想这就是细微差别吧，哈。]她又思考了一会儿。[say: 我想让你多训练我，[dad]。教我细微差别！]");
         doNext(helspawnSparPrank2);
      }
      
      public function helspawnSmooch() : void
      {
         clearOutput();
         outputText(get_player().get_tallness() < 72 ? "你伸出手，把[helspawn]的脸拉近你。" : "你把手放在[helspawn]的脸颊上，把她的脸拉近你。");
         outputText("[pg][if (helspawnpersonality < 50) {[say:[if (isfeminine) {妈——妈妈|爸——爸爸}]？]你女儿的语气有些紧张，脸涨得通红。[say: 你有什么事吗？]|[say: 嗨，[daddy]。]你那荡妇般的女儿自信地对你咧嘴一笑，把手放在你的臀部。[say: 你想从我这里得到什么吗？]}]");
         outputText("[pg]你对她轻笑了一下，告诉她只有一件小事。带着诱惑的微笑，你将嘴唇贴在她的唇上，然后紧紧地抱住她。" + (helspawnChaste() ? "[Helspawn]发出一声惊讶的尖叫，但很快就回应了你的吻，并" : "[Helspawn]发出一声发情的娇笑，") + "用她强壮的手臂拥抱你的身体。你热情地用[tongue]撬开你孩子的嘴唇，很快就感觉到她急切地回应着。她把你紧紧地拉向她，她挺拔的双乳开始挤压着" + (get_player().biggestTitSize() > 1 ? "你自己的[breasts]" : "你平坦的胸部") + "。你的舌头与她的舌头交缠，身体尽可能地贴近她，你的手向下滑动，揉捏着她柔软丰满的屁股。");
         outputText("[pg]你们俩继续亲吻、拥抱、互相抚摸了几分钟，然后你才把脸从她脸上移开。你把头在她肩膀上蹭了一会儿，低声诉说着" + (helspawnChaste() ? "你对她禁忌之爱的程度" : "你有多想操") + "你自己的女儿。");
         if(helspawnChaste())
         {
            outputText("[pg][say: 你是最棒的，[dad]。你是我唯一需要的爱人。]带着满足的微笑，她在你脸颊上印下了一个大大的、湿漉漉的吻，然后你们俩结束了拥抱。");
         }
         else
         {
            outputText("[pg][say: 感觉真好，[dad]，但下次一定要给我更多。被你养大的人，有些需求只有你才能真正满足。]她带着诱惑的笑容，在你的" + (!get_player().isGenderless() ? "胯部" : "[ass]") + "摸索了一会儿，停留了片刻，然后你们才结束了这个拥抱。");
         }
         dynStats(DynStat.Lust(10));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function helspawnSlutty() : Boolean
      {
         return !helspawnChaste();
      }
      
      public function helspawnSlutsexYuri2() : void
      {
         var _g:HelSpawnScene;
         clearOutput();
         outputText("你放在她头上的手就是她需要的所有答案，你女儿的指尖滑过你的身体两侧，随着她向下移动，直到她跪在[if (singleleg) {你面前|你的双腿之间}]才停下来。她的嘴唇在你的肚子上轻轻扫过，然后继续向下，在你的[skinshort]上犹豫而挑逗地停了下来，当她抬头看着你的眼睛时，她的眼睛" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,958) == 0 ? "闪烁着调皮的光芒" : (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,958) == 2 ? "充满生机" : "燃烧着激情")) + "。");
         outputText("[pg]但这只持续了一秒钟，随后她便俯下身，呼吸拂过你的肌肤。你的手指穿过她的发丝，而她的手则顺着你的大腿向上游走。你的整个身体都在渴望着女儿的触碰，变得滚烫、潮红，当她的嘴唇拂过你的[clit]并印下一个温柔的吻时，你已经完全兴奋得悸动起来。当她的舌头在你的阴唇周围游走，舔舐着你[if (vaginalwetness > 2) {丰富的}]爱液时，她将[if (singleleg) {你|你的双腿}]抱得更紧了。");
         outputText("[pg][if (helspawnvirgin) {意识到真的是|看到}]你自己的女儿在你的双腿之间，这感觉就像是一场荒诞的梦，但低头看着[if (cor > 66) {她那奴隶般的奉献，让你心中涌起一股[paternal]的自豪感|她那温柔的爱意，让你觉得这一切都是理所当然的}]。");
         outputText("[pg]你抓得更紧了一些，她立刻心领神会。当她微微抬起身子，将你含入唇间时，你的身体不禁颤抖起来。她口中那炽热的温度夺走了你的呼吸，你几乎没有察觉到她双手的动作，直到你的肉褶在她的指尖下分开，[if (lust > 66) {急切地|[if (vaginalwetness > 2) {毫不费力地}]}]探入你的深处。也许作为一个[father]，在[his]宝贝女儿的抚摸下如此轻易地把持不住有些不成体统，但除了体内的充实感，以及她的舌头在你饥渴的阴蒂上舔弄的感觉之外，你现在根本无暇顾及其他。");
         outputText("[pg]她刚好擦过那个绝妙的位置，你呻吟出声，紧紧地抱住她，甚至感觉地面仿佛要塌陷。她一定察觉到你快到了，她的抽插变得越来越快，同时又塞进了第二根——还是第三根？——手指。它们填满了你，这就是现在唯一重要的事情，她将你推向了高潮的边缘。每一次触摸和舔舐都让世界进一步缩小成雾蒙蒙的极乐，你停不下来——她也没有停下——快感彻底淹没了你。");
         outputText("[pg]你的身体颤抖着，汗流浃背地紧紧绞着你女儿的手，在你小女孩的嘴里跳动着，你绝不愿用这一切去换取任何东西。尤其是当她放慢速度，每一次慵懒地吸吮你的[clit]都会让一阵酥麻感[if (isgoo) {传遍全身|窜上脊背}]，当她抬头看着你时，她那双[helspawneyes]眼睛绝对是光芒四射的。那闪烁着爱意与崇拜的目光[if (helspawnvirgin) {让你如释重负，因为你知道[helspawn]和你有同样的感觉|就像你第一次看到它时一样令人惊艳，让你为你有一个如此出色的女儿而感到[if (cor < 25) {感激|自豪}]}]。");
         outputText("[pg]在最后抚摸了你一次之后，她抽出手指，在你的阴蒂上印下最后一吻，然后站起身来。尽管才过去了几秒钟，你已经[if (lib > 50) {渴望|想念}]她的触碰了。");
         outputText("[pg][say:我爱你，[Dad]。]她的声音轻如呢喃，嘴唇近得几乎可以品尝到。");
         get_player().orgasm("Vaginal");
         menu();
         addNextButton("亲吻",helspawnSlutsexKiss).hint("回应她的爱意。");
         addNextButton("再来",helspawnSlutsexMore).hint("你可以再来一回合[if (lib < 25) {为了她}]。");
         _g = this;
         addNextButton("结束",function():void
         {
            _g.helspawnSlutsexFinish();
         }).hint("够了。");
      }
      
      public function helspawnSlutsexYuri() : void
      {
         clearOutput();
         outputText("猝不及防之下，你进一步陷入了女儿的魔力之中，你的身体被她嘴唇的甜美和尾巴的俏皮触碰所困。她的双手按在你的[if (tallness < 78) {肩膀|腰侧}]上，让你在她的舌头找到你的舌头时，保持着[if (cor < 25) {慌乱|天堂般}]的感觉，每一个吻都充满了你小女孩的爱。你紧紧地抱住她，品味着[if (hasplainskin) {你的皮肤贴着她的皮肤|你的[skindesc]贴着她的皮肤}]的温暖，让她火蜥蜴般的热度像午后的微风一样轻柔地抚摸你的全身。");
         outputText("[pg]当她退开时，她的嘴唇在你的脸颊上轻轻掠过，作了一个简短的告别，然后她[if (tallness < 78) {低头|[if (tallness > 74) {平视|抬头}]}]看着你，她的眼睛" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,958) == 0 ? "闪烁着熔金般的光芒" : (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,958) == 2 ? "充满了一种翠绿的平静，掩盖了她急促的呼吸" : "充满了内在的火焰")) + "。它们在呼唤你，当你顺着她的腰侧向上抚摸时，你的女儿已经在你的指尖下颤抖，当你的手最终停在她的肋骨上时，她艰难地咽了一口唾沫。甚至她的尾巴也静止了，当你向内移动，顺着她乳房柔和的曲线时，它在你的[if (tailLeg) {[if (isNaga) {蛇形|[if (isMer) {海洋|较长}]}]下半身|[if (isgoo) {史莱姆身体|大腿}]}]上痒痒的。仅仅是轻轻拂过她的乳头就让她扭动起来，很明显，[helspawn]需要她[daddy]温柔的呵护。");
         outputText("[pg]所以你答应了，在凑过去之前最后看了一眼她的眼睛，你的嘴唇一碰到她的脖子，你的女儿就满足地叹了口气。[if (hasfangs) {当你用尖牙轻轻刮擦她敏感的皮肤，然后将它含入|当你将她敏感的皮肤含入}]嘴里时，她浑身一颤，每一个火热的吻都让她把你抱得更紧，直到她的爪子[if (isgoo) {陷入|刺痛}]你的背才停下来。自从[if (helspawnvirgin) {她[if (allowchild) {还是个小女孩|步入成年}]|上次}]以来，你一直梦想着这一刻，现在，被她拥抱在怀里，你的每一种感官都完全被她占据，这真的和你[if (helspawnvirgin) {想象|记忆}]中的一样奇妙。");
         outputText("[pg]当你稍稍退开，刚好能看到她潮红的脸庞时，她灼热的呼吸扑面而来。[helspawn]如此渴望她的[daddy]，以至于她已经向你倾身，双唇轻轻擦过你的嘴唇。它们是如此柔软，如此贴近，只要你愿意，毫不费力就能再次品尝和享受它们。");
         outputText("[pg]只需最轻微的移动，你就能再次感受到她的温暖，而你欣然抓住了这个机会。和你的女儿在一起感觉是如此正确，[if (cor < 25) {无论|谁在乎}]别人怎么想。你们俩分享着一种" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,958) == 0 ? "超越" : "等同于") + "血缘的羁绊，当她的双唇本能地为你微启时，这种联系在你的血管中跳动。这一次没有任何纯真，只有你小女孩全部的激情，她以一种你[if (helspawnvirgin) {几乎不敢相信|永远无法忘记}]的狂热品尝着你。");
         outputText("[pg]然而她的欲望似乎只增不减，特别是当她[if (biggesttitsize < 1) {把手放在你的胸膛上，用手指挑逗着你的一颗乳头|托起你的一侧乳房，用手指挑逗着乳头}]，你的身体因她的触碰而颤抖时。[if (cor < 25) {这有点令人尴尬|你毫不羞于向她展示}]她对你的影响有多大，哪怕是最轻微的抚摸都让你想让她探索你的每一[if (metric) {寸|寸}]肌肤，直到她像了解自己一样了解你。当她结束亲吻，沿着你的[skindesc]向下游走，直到与你的[chest]齐平时，期待在你心中激荡，她的每一次呼气都热得令人沉醉。");
         outputText("[pg]她舌尖的第一次触碰让你屏住了呼吸，她的唾液在你敏感的乳头上冷却，带来阵阵酥麻。片刻之后，你滑入她温暖的口腔，你的女儿温柔地吮吸着，[if (islactating) {你的乳汁开始流淌[if (ischild) {，这让她大吃一惊}]|尽管你并没有什么可以给她}]。[if (allowchild) {像这样，就好像你还抱着你可爱的小火蜥蜴女孩，当她尽情吸吮时，你的手指穿过她的头发。}][helspawn]的一个动作[if (allowchild) {将你拉回现实|引起了你的注意}]，你情不自禁地注意到她的动作变得更加激烈，[if (islactating) {当她喝下第一滴时|仿佛单凭意志就能让它流出来一样}]。");
         outputText("[pg][if (islactating) {[say: 真美味。] }]她满意地哼了一声，手指按摩着你的另一侧乳房，想要分享她的爱意。[say: 但是[Daddy]还有[if (islactating) {更多|其他部位}]我想品尝。]");
         outputText("[pg]她的尾巴再次拂过你的入口，随着你因刺激而颤抖，[helspawn]的笑容变得更加灿烂。[say: 拜托了，[Daddy]。]");
         doNext(helspawnSlutsexYuri2);
      }
      
      public function helspawnSlutsexResist() : void
      {
         clearOutput();
         outputText("但她必须等待，即使她不愿意。你的小女孩值得拥有最好的一切，而这一切从你的嘴唇贴上她的脖子开始，当你把你的[cockplural]抽离时，你能感受到她渴望的呜咽声带来的每一次震颤。然后你的嘴唇继续向下，当她发出的声音变成呻吟时，你在她最喜欢的地方吸吮着，稍作停顿。一只手顺着她的前臂滑下，指尖从光滑的鳞片拂过线条分明的肌肉，来到你女儿胸前甜美的隆起，她的乳头在你的触摸下已经变硬。你心想，她想她的[father]想了多久了，你用手指揉捏着那敏感的凸起，直到她带着喘息的叹息声充满你的耳朵。");
         outputText("[pg]但你离结束还早得很，尤其是当你的手缓慢而刻意地顺着她腹部的每一寸起伏向下滑动时，[helspawn]主动将她的胯部迎向你的手。即使是现在，你女儿的欲火也清晰可感，在她的脉搏中跳动，弥漫在空气中。就好像你需要证明她对你的爱有多深一样——不，当你的嘴唇轻轻掠过她的乳头时她扭动的样子，以及当你的手指找到她跳动的阴蒂时她的颤抖，就已经说明了一切。");
         outputText("[pg]你继续向下，直到双手放在她长满鳞片的大腿上，当它们分开时，已经开始微微颤抖。她一言不发，也没有发出任何声音，只是当你俯身品尝她，惊叹于女儿的味道时，她的双手[if (hairlength > 0) {抓着你的头发|按着你的头}]。[Helspawn]在你舔舐她的阴唇，用舌头轻轻分开它们时扭动着身体——当你快速舔舐她的阴蒂，将它含入唇间时，她的镇定终于瓦解了。当她把你拉近时，她的爪子[if (hairlength > 0) {卷入你的头发|抠进你的头皮}]，在你的手指拂过她入口的那一刻，她的呼吸变得沉重起来。");
         outputText("[pg]在她如此动情的情况下，你的手指毫不费力地没入了她湿滑的深处，她的肉壁紧紧夹住并榨取着你，就好像在里面的是你的[cock]一样。她的身体乞求着你用永远不会到来的精液填满她，当你摸索着她最敏感的部位时，她的尾巴剧烈地拍打着，直到她紧紧绞住你。她的阴蒂在你的嘴里跳动，而你毫不松懈，同时你自己的[cockplural]在听到她欢愉的声音时，也因渴求而难以自控地[if (cocks > 1) {滴下|滴下}]淫液。");
         outputText("[pg]当她终于平静下来时，你抬头看着你的女儿，一抹宁静的微笑浮现在她的唇边，随后你起身吻住了那双唇。");
         outputText("[pg][say: 你是最棒的，[Dad]，]她说道，她的手已经顺着你敏感的[skindesc]滑下，当它握住你的[cockplural][if (cocks > 1) {的其中一根}]时，你只能咬紧牙关。[say: 但别以为我会忘了你。]");
         outputText("[pg]正如她所说，她转过身，双手撑在[if (builtcabin || builtwall) {墙壁|岩石}]上，将她的身体完全展露出来。你的[cock]在她阴唇的灼热中跳动，每一次摩擦都沾满了她的淫液，没过多久你就轻松地滑了进去。[if (cocks > 1) {为了不让另一根受冷落，你的[cock 2]没入了她的屁股，她的肌肉顺应着你的长度，让你填满了她的两个洞。}]蝾螈特有的温暖席卷了你，将你的[cockplural]沐浴在令人窒息的湿热之中。");
         outputText("[pg]见你有些犹豫，她向后顶去，将你" + (get_player().cocks[0].cockLength > 10 ? "尽可能深地吞入" : "完全吞没") + "——而这，正是自从她[if (allowchild) {还是个小女孩|刚开始发育}]起，你就一直渴望的时刻。现在，你的双手扶着她的臀部，你们的心以一种旁人只能嫉妒的方式相连，随着你的第一次抽插让她浑身颤抖，她更紧地抓住了[if (builtcabin || builtwall) {木头|石头}]。即使是这样——满身是汗，沾满了她的淫液，[if (cocks > 1) {被你的肉棒完全填满|屁股翘在半空中}]，你的小女孩依然像以前一样美丽，当你开始向后抽动时，她的喘息声在你耳边显得如此甜美。");
         outputText("[pg]她丝滑滚烫的肉壁紧紧夹住你，拼命不让你离开，展现出她有多么需要你，有多么渴望感受到精液[if (hasballs) {在你的[balls]里|在你体内}]翻滚。她稳住身子，尾巴缠绕在你的背上让你无法离开，尽管你根本就不会离开。[say: 全都给我，[Daddy]。]");
         outputText("[pg]你女儿的声音，慌乱而气喘吁吁地乞求着你的精液，让你的[if (cocks > 1) {肉棒|[cock]}]抽动起来，激励着你加快速度。随着你深入她的身体，她的身体随着每一次抽插而泛起涟漪，你将自己完全交给了对你小女孩的强烈激情。她就是一切——得到了一切——当你" + (get_player().cocks[0].cockLength > 10 ? "插到底" : "的臀部贴上她的") + "时，你腹部的压力绽放成沸腾的热量。");
         outputText("[pg]她大叫着，尾巴把你缠得更紧了，身体颤抖着，内壁紧紧夹住你，那温暖湿润的触感让你的[if (hasballs) {balls|[cockplural]}]隐隐作痛，她拼命地想榨出你的精液。你的双手掐进她的肉里，用力挺动，在射进你女儿体内之前，最后一次深深埋入。你的第一股精液射出时，她大喊了一声[say: 是的！]，同时向后迎合着你，试图尽可能多地榨取你的精液。");
         outputText("[pg][if (cumhigh) {这似乎永无止境，你的身体没有丝毫停歇的迹象，你的精液甚至从她的[if (cocks > 1) {小穴里}]冒出泡泡，滴落在地上。}]终于，[if (cumhigh) {连}]你也达到了极限，你的动作变得越来越浅，直到你只是停留在她的温暖中，你们两人都大口喘着气，沉浸在余韵中。她首先动了动，转过身，直到她那[helspawneyes]的眼睛对上你的视线。[say: 我爱你，[Dad]。]");
         outputText("[pg]当你拔出并扶她起来时，她浑身一颤，随即趁机偷吻了你一下，似乎并不在意尝到自己的味道。[say:我会等你[if (hours < 19) {今晚|明天}]来的，[Daddy]。]");
         outputText("[pg][Helspawn][if (!isnaked) {看着你穿衣服的一举一动，并且}]在你揉乱她头发时撅起了嘴，不过这只会让她在向你道[if (hours < 19) {别|晚安}]时显得更加可爱。");
         get_player().orgasm("Dick");
         saveContent.slutspawnLastTimeSex = get_game().time.days;
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2638,1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function helspawnSlutsexMore() : void
      {
         clearOutput();
         outputText("[if (lib > 50) {但你还需要更多，所以你拉起她的手，把她拉到你身上，完全不在乎硌着你背的地面。|但她值得更多，所以你拉起她的手，把她带到你的[cabin]，当你躺在[bed]上时，把她拉到你身上。}]");
         outputText("[pg][if (lib > 50) {[say: 你只要开口就行了，[Daddy]，]|[say: 你不用这么担心我，[Daddy]，]}] 她说着，漫不经心地用手指揉捏着你的乳头。[say: [if (lib < 25) {但}]我随时为你准备着。]");
         outputText("[pg][if (lib > 50) {你也是，特别是|很难不这样}] 当你的女儿离你这么近，你的[skindesc]沾满了她的汗水，空气中弥漫着她发情的味道。不过，这些都不够——现在，你渴望品尝她的味道，充满了一种冲动，想把舌头滑进她的阴唇之间，吸吮每一[if (metric) {寸|寸}]。");
         outputText("[pg]当你要求她转过身时，她满足的微笑变得好奇起来，但当你抓住她的臀部，让她顺着你的身体向上滑，直到你能感觉到她脸上的热度时，她似乎很快就明白了。她已经为你闪闪发光，当她向后压迫，渴望你的嘴唇时，你的呼吸拂过她的阴唇。看到你的小女孩为她的[daddy]如此兴奋，只会[if (cor < 25) {让她更美丽|让你更兴奋}]，你几乎没有犹豫，就伸手去占有它们。");
         outputText("[pg][if (helspawnvirgin) {你第一次品尝女儿的味道简直不可思议|每一次品尝都比上一次更好}]，你很快发现自己正在挑逗她的嘴唇，急切地吸出更多她的味道。[Helspawn]立刻做出了反应，当你的舌头滑入时，她的大腿紧紧夹住你，就在你以为她已经忘记你的时候，她呼吸的温暖在你的[clit]上颤抖。接着是轻轻的一舔，让你猛地向上挺进她体内，当她的咯咯笑声拂过你的[skindesc]时，你很难不跟着笑起来。");
         outputText("[pg][say:对不起，[Dad]，]这是她好不容易才挤出来的话，但你真心希望她不是认真的。你觉得你无法原谅她——不，如果她现在停下来，你觉得你甚至都[i:[if (singleleg) {起不来|站不起来}]]了。");
         outputText("[pg]但她没有停下，你也没有，[father]与女儿在亲情之爱中紧紧相拥，当你的嘴唇拂过她的阴蒂，她的手指抚摸着你敏感的[skinshort]时，你们都在颤抖。她发出一声呜咽，你压得更深了，她身体的每一次扭动和肌肉的每一次紧绷都让你充满满足感。你可爱的小[helspawn][if (cor < 25) {值得|赢得了}]这一切，当你的舌头在她的阴蒂周围打转时，你能感觉到她的呼吸变得急促，这让你的[if (isgoo) {背脊|脊椎}]一阵发麻。");
         outputText("[pg]她自己的动作变得更加不规律，当你把她含在唇间时，她的双手更紧地抓住[if (singleleg) {你|你的大腿}]，直到她很快只能靠着你喘息。她在你怀里颤抖时，在你的嘴里变得滚烫而悸动，仅仅片刻之后，她的身体紧绷起来，大声呼喊着你的名字，让" + (get_camp().getCampPopulation() == 2 ? "她的" + get_player().mf("","另一个") + "母亲" : "你营地里的所有人") + "都能听到。");
         outputText("[pg][if (cor < 25) {一丝尴尬|一阵自豪的暖意}]瞬间涌上心头，但当你孝顺的女儿将注意力转回你身上时，这感觉很快就被抛到了脑后。仅仅是她急促呼吸的热度就让你颤抖，当她的一根手指滑入你的体内，并以[if (helspawnvirgin) {记忆犹新|熟悉}]的关怀找到你最喜欢的地方时，你用尽了所有的克制力才没有在她的深处叫出声来。尽管如此，你还是坚持着，在清理女儿的同时品尝着她的味道，并喜欢当你拂过她敏感的阴蒂时她颤抖的样子。");
         outputText("[pg]她似乎下定决心要让你释放，她的双腿将你固定在原地，同时她更深地刺入你，即使她自己的身体随着你舌头的每一次爱抚而摇晃。热量在你体内盘旋，聚集在你的腹部，而她颤抖着吸吮你的[clit]，但你咬紧牙关继续。她的颤抖和闷闷的呻吟让你继续下去，你在她的入口周围画圈，然后沉入其中，喝干她的每一滴。然而，火焰再也无法被控制，在你体内肆虐，当你紧紧抓住你小女孩的手时，点燃了你的每一个[if (isgoo) {[if (metric) {方面|英寸}]|神经}]。[Helspawn]在你的嘴唇上颤抖，然后她的双腿失去了力量，让你们俩陷入了一个汗流浃背、满脸通红的拥抱中，一起越过了边缘。");
         outputText("[pg]你深吸了一口气，不确定自己还能不能做点别的。不过话又说回来，你怀疑你找不到比现在更好的地方了，你的女儿趴在你身上，她轻柔的呼吸拂过你的[skindesc]。她心满意足地任由你抚摸她柔软的肌肤，你们俩静静地恢复着体力，她的尾巴软绵绵地搭在你的头上。");
         outputText("[pg]最终她设法滚到了——或者说瘫倒，你猜——你的身边，带着蝾螈的温暖依偎在你的背上。[say: 谢谢，[Daddy]。]");
         outputText("[pg]尽管你很想一整[day]都待在这里，但你仍然[if (hours < 19) {有事情要做|需要睡一觉}]，所以你极不情愿地扶她起来，然后回去继续你的职责。");
         get_player().orgasm("Vaginal");
         helspawnSlutsexFinish(false);
      }
      
      public function helspawnSlutsexKiss() : void
      {
         clearOutput();
         outputText("你毫不费力地凑上前去，在双唇再次相触前的短暂瞬间，她的呼吸变得急促起来。她的唇依然如往常般柔软，你女儿熟悉的味道如今与你自己的味道交织在一起，成为了你们相爱的证明。");
         outputText("[pg][say:我可以品尝你一整天，]她说着，每一个字都轻轻拂过你的[skindesc]，让你的思绪开始浮想联翩。[say:只要你愿意。]");
         outputText("[pg][if (lib > 50) {你也许真的会。|她眼中的渴望让你觉得你可能没有太多选择。}]");
         helspawnSlutsexFinish(false);
      }
      
      public function helspawnSlutsexFuck() : void
      {
         clearOutput();
         outputText("你再也等不及了。[if (cor < 25) {无论你多么努力地控制自己，你和她一样渴望着这一切。|自从[helspawn][if (allowchild) {还是个小女孩|刚成熟}]起，[if (helspawnvirgin) {你就一直幻想这一刻|你的目光就无法从她身上移开}]。}]");
         outputText("[pg]她气喘吁吁地结束了亲吻，那双[helspawneyes]的眼睛闪烁着光芒注视着你。[say:求你了，[Daddy]。]");
         outputText("[pg]听到女儿的乞求，想要感受你全部的[father]爱，你心中残存的疑虑瞬间烟消云散。你非常乐意满足她，紧紧抓住她，用力挺进，将她拉向你，更深地沉浸在她的温暖中。她的爪子[if (isgoo) {撕扯着你的史莱姆身体|在你的背上抓挠}]，紧紧地依附着你，你的感官几乎无法察觉到除了那柔软、舒缓的热度之外的任何东西，那热度似乎包裹了从你的[cock]到你心灵的一切。");
         outputText("[pg]现在，你深深地埋入她体内，与你的女儿在少数[father]才拥有的爱中真正结合，她一如既往地美丽，无论内在还是外在。随着你的每一次抽插，她带着喘息的呜咽声萦绕在你的耳畔，她那原始的欢愉声给了你支撑她身体的力量，即使你的双臂已经酸痛发热。当你拔出时——轻柔地，挑逗地，仿佛你可以就此停下，让她欲求不满——她的尾巴拂过你的[skindesc]，那无痛的火焰[if (hours > 18) {将你们俩沐浴在昏暗的光芒中|在你的视野边缘闪烁}]。");
         outputText("[pg]当你再次进入她时，你的女儿无法抑制她的声音，随着你滑入她丝绸般的深处，她的尾巴扫过你的[if (singleleg) {身体|双腿}]，直到" + (get_player().cocks[0].cockLength > 10 ? "你顶到底" : "她的臀部贴上你的") + "才停下。[say: [Daddy]...]");
         outputText("[pg]肌肉的酸痛提醒着[if (iselder) {你已经不再年轻|你不可能永远坚持下去}]，但你咬紧牙关，无视了那份灼热感，无视了[if (hasballs) {[balls]|[cockplural]}]中不断积聚的压力，无视了一切，除了你女儿甜美的呻吟声和你开始抽插时她肉壁的湿滑。随着每一次挺进，不断攀升的快感占据了你的脑海，一想到要用你的精液填满你的小女孩，你的身体就变得潮红而狂热。");
         outputText("[pg]光是想象一下就让你的[cockplural]抽搐起来，当她的双腿缠绕着你，把你拉得" + (get_player().cocks[0].cockLength > 10 ? "尽可能近" : "比以往任何时候都近") + "时，你很难克制自己。汗水顺着她的皮肤流下，在她的鳞片上闪闪发光，当你在她体内移动时，她的抓握有些颤抖，双手紧紧地挤压着，整个身体都紧绷着，紧紧地包裹着你，渴望你填满她。当她榨取你时，你的[if (hasballs) {蛋蛋|[if (cocks > 1) { 肉棒|肉棒}]}]抽动着，她急促的呼吸和越来越紧致的触感交织在一起，足以让你在[cock]在你女儿体内跳动时达到高潮。");
         outputText("[pg][say: 把一切都给我，[Daddy]！]她说道，你永远无法拒绝你的小女孩，在最后一次挺进后，你释放了自己，用你的精液[if (cumhigh) {的第一波}]填满了她。[if (cocks > 1){你的其他[if (cocks > 2){肉棒也紧随其后|肉棒也紧随其后}]，用你的种子[if (cumhigh){涂满|溅满}]了她的皮肤。}] [say: 没错！]她微笑着，将臀部在你的手中摩擦，似乎打算确保她能尽可能多地榨出你的精液。");
         outputText("[pg][if (cumhigh) {你还有很多可以给她的，你[if (hasballs) {满溢的[balls]|储存的精液}]还远没有耗尽。这甚至超出了她能容纳的极限，她的大腿拼命地夹紧你，因为你那惊人的高潮射出的精液从她体内滴落，溅在地上。}]就在你感觉自己被彻底榨干的时候，一阵战栗传遍[if (isgoo) {你的全身|你的脊背}]，你的[cock]再次向她深处喷射出一股精液。伴随着这股精液，你的力量开始衰退，你的手臂抽筋并燃烧着，你依依不舍地从你女儿体内拔出。当你把[Helspawn]放在地上时，她的双腿颤抖得[if (!singleleg) {几乎和你一样厉害}]，她靠向你，[helspawneyes]的眼睛里闪烁着爱慕的光芒。[say: 我爱你，[Dad]。]");
         outputText("[pg]轻轻吻了一下她的[if (tallness < 78) {脸颊|额头}]，她脸红了，依偎[if (tallness < 72) {着把你抱进她的怀里|进你的怀里}]。[say: 没有人能让我如此幸福。]");
         outputText("[pg][Helspawn][if (!isnaked) {看着你穿衣服的一举一动，并且}]在你揉乱她头发时撅起了嘴，不过这只会让她在向你道[if (hours < 19) {别|晚安}]时显得更加可爱。");
         get_player().orgasm("Dick");
         saveContent.slutspawnLastTimeSex = get_game().time.days;
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2638,1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function helspawnSlutsexFinish(param1:Boolean = true) : void
      {
         if(param1)
         {
            clearOutput();
         }
         else
         {
            outputText("[pg]");
         }
         outputText("[Helspawn]在你[if (singleleg) {挪开|走开}]之前用双臂抱住了你。");
         outputText("[pg][say: " + (FlagDict_Impl_.arrayReadString(KFLAGS.flags,701) != "helspawn" && FlagDict_Impl_.arrayReadString(KFLAGS.flags,701) != "salamanders" ? "希望" : "") + "我们[if (hours < 19) {今晚|明天}]还能再见，[Daddy]。] 她的嘴唇拂过你的脸颊，[if (isnaked) {并在你耳边低语，|随后将你的[armor]递给你。}][say: 我会等你的……]");
         outputText("[pg]正当你满脑子都是这个念头时，她将锁子甲比基尼搭在肩上，转身离开，留下你[if (!isnaked) {穿好衣服，}]去忙你[day]的事情。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2638,1);
         saveContent.slutspawnLastTimeSex = get_game().time.days;
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function helspawnSlutsex() : void
      {
         clearOutput();
         outputText("离你那[if (tallness < 78) {不那么}]娇小的蝾螈这么近，你忍不住欣赏起你女儿长成的女人。[if (ischild && silly) {她现在甚至比你还老了，去他的因果律。|[if (lib > 50) {她完全融入了你的家，几乎和她的父母一样享受玛瑞斯的乐趣。|她有着无与伦比的激情——以至于不可能不[if (cor > 50) {想要|爱}]她。}]}]也许她靠过来时注意到了你的注视，当她等待[if (cor > 50) {你|看看你是否会}]迈出第一步时，她那[helspawneyes]眼睛闪烁着[if (cor > 50) {欲望|愉悦}]的光芒。");
         outputText("[pg][say: 怎么了，[Daddy]？] 她问道，如果不是[if (isnaked) {当她把你拉近时，她锁链比基尼冰冷的金属压在你的[if (hascock) {[cock]|[skindesc]}]上。|她的手顺着你的背慢慢地、轻轻地滑下，直到她抓住你的[ass]。}]，这几乎可以说是天真无邪了。");
         outputText("[pg]你们的[paternal]纽带超越了言语，你一凑过去索取，她的双唇便温柔地微微张开。它们柔软而热情，就像你教她的那样，初尝你女儿的滋味让你渴望更多，她的味道如此诱人，以至于你几乎没有注意到她的手在移动，直到[if (!isnaked) {它滑进你的[armor]里，并且|[if (hascock) {它}]}] [if (hascock) {包裹住你的肉棒|她的手指在你的入口处飞舞}]。她的嘴唇仍然紧贴着你的，即使你[if (hascock) {在她的握持中抽插|在她的身上摩擦}]，也让你保持沉默。");
         outputText("[pg]当你把[Helspawn]拉得更紧时，你沐浴在她火热的温度中，当她的舌头刷过你的舌头时，你没有提供任何抵抗。被别人看到你和女儿这样在一起的想法在你的脑海中掠过，[if (cor > 50) {这绝对令人兴奋，尤其是|但你所有的犹豫都消失了}]当她[if (hascock) {开始抚摸你，她的拇指挑逗着龟头|滑进一根手指，她的拇指挑逗着你的阴蒂}]，每次你颤抖时都会流连忘返。[if (isnaked) {这毫无掩饰|她的动作几乎没有留下任何想象空间}]，你[if (cor > 50) {陶醉在她的触摸中，不在乎|燃烧着兴奋和尴尬的混合情绪，发现很难去在乎}]世界是否看到了你对你出色女儿的激情。");
         outputText("[pg]她的嘴唇离开你的，轻轻地拉开，慢到让你有一瞬间觉得你可以靠过去再次吻住它们。[if (isnaked) {[say: 我想你想要的不仅仅是一个吻，[Daddy]。] [Helspawn]在让她的手滑上你的[skindesc]之前，给了你最后一次[if (hascock) {摩擦|抽插}]，当你在她的触摸下颤抖时微笑着。|[say: 你看起来有点不舒服，[Daddy]。] [Helspawn]在滑下你的[armor]之前，给了你最后一次[if (hascock) {摩擦|抽插}]，当她看着你裸露的身体时，呼吸沉重。[say: 这样不是更好吗？]}]");
         outputText("[pg]她是对的，你告诉她。她总是对的——你美丽、聪明的小女孩，确切地知道她的[father]需要什么。你的女儿在赞美声中安静下来，慵懒地用手指[if (biggesttitsize < 1) {顺着你的胸膛滑下|在你的一个[breasts]周围画圈}]，尽管即使是她的自信也无法掩盖她脸颊上的红晕。[say: 谢谢你，[Daddy]，]她说道，当她的眼睛与你相遇时，她的笑容变得更加灿烂。");
         outputText("[pg][if (hasscales) {当你的手刷过她的手臂时，她的[helspawnscales]鳞片" + (helspawnScales() == get_player().skin.tone ? "似乎与你的融为一体" : "与你的形成鲜明对比") + "。|无论你触摸它们多少次，她[helspawnscales]鳞片的光滑总是令人惊讶。}]然而更好的是她皮肤的柔软——你的嘴唇在她的脖子上，当你手指滑入她比基尼的肩带下并沿着她的锁骨描绘时，汲取着蝾螈特有的热量。[Helspawn]在你的怀里颤抖，她发出的每一个声音、每一次吞咽都流入你体内，让她无法隐藏她的欲望。");
         outputText("[pg]尤其是当她轻轻地把你推开时，她的眼睛像她的尾巴一样火热，同时她用流畅、明显训练有素的动作脱下了她的衣服。考虑到所有情况，这相当令人印象深刻[if (cor < 25) {也有点令人担忧}]，但你的女儿只是微笑着回应。[if (isnaked) { [say: 你知道，我们不是所有人都光着身子到处跑的。]| [say: 感兴趣吗，[Daddy]？我们稍后可以上些课……]}]");
         outputText("[pg]当你靠近时，她身上烟熏般的气味扑面而来，当你把她压在[if (builtcabin) {小屋的墙上|[if (builtwall) {营地周围的墙上|附近的一块岩石上}]}]时，你的手指拂过皮肤和鳞片交界的敏感地带。你还没来得及反应，她的嘴唇再次找到了你的，充满了疯狂、渴望的激情，你[if (cor > 50) {一直希望|从未想过}]能从自己的女儿身上看到这种激情。多亏了她的嘴唇贴着你的，你才没有出声，当[if (hascock) {你的[if (cocks > 1) {肉棒滑过|肉棒滑过}]她的入口，温暖、湿润、诱人。|她的尾巴拂过[if (singleleg) {你|你的大腿}]，那天堂般的温暖夺走了你的呼吸，尾尖在你的[clit]上闪烁。}]");
         if(get_player().hasCock())
         {
            outputText("[pg]就在[i:那里]，她的兴奋随着每一次折磨人的抽插覆盖着你的[if (cocks > 1) {肉棒|肉棒}]。最微小的移动都会让你的[cock]毫不费力地滑入，沉入你女儿的深处。再高一点，她的嘴唇就会在龟头周围轻轻张开，当你只是停留在那里，品味着她的温暖时，你的胸膛因期待而紧绷。她在你的掌控中扭动，她的身体如此接近她所需要的快感。");
            if(get_player().get_str() >= 50)
            {
               menu();
               addNextButton("操她",helspawnSlutsexFuck).hint("把她抱起来，就在这里要了她。");
               addNextButton("忍耐",helspawnSlutsexResist).hint("再多享受一会儿你的女儿。");
            }
            else
            {
               doNext(helspawnSlutsexResist);
            }
         }
         else
         {
            doNext(helspawnSlutsexYuri);
         }
      }
      
      public function helspawnSleep() : void
      {
         switch(Utils.rand(4))
         {
            case 0:
               outputText("你走进[cabin]，发现[helspawn]已经先你一步上床了。[if (helspawnchaste) {她仰面躺着，似乎在等你上床。看到你时，她露出了微笑，在你准备就寝时，她稍微放松了一些。你爬[if (builtcabin) {into|onto the}] [bed]，依偎在她身边，在她用手臂环抱你时，你在她的鼻子上亲了一下。你们俩紧紧相拥，直到你终于进入梦乡，她身体贴着你的舒适感让你很容易就睡着了。|她侧身躺着，眼睛盯着入口，似乎在等你上床。看到你时，她露出了微笑，示意你躺在她身边。在短暂的准备之后，你照做了。一旦你[if (builtcabin) {in|on the}] [bed]，她立刻将赤裸的身体贴向你，在嘴唇上亲吻你，然后用手臂环抱你。没过多久，她就睡着了，手臂依然松松地搭在你的身上。至少，这很舒服。没过多久，你也发现自己进入了梦乡。}]");
               break;
            case 1:
               outputText("你紧跟着[helspawn]走进[cabin]，你们俩同时爬[if (builtcabin) {into|onto the}] [bed]。她背对着你，你轻轻地蜷缩在她身边。[if (helspawnchaste) {[say: 晚安，[Dad]。爱你。] 在回复了同样的情感后，你倾身向前亲吻她的脖子。你紧紧地依偎着她，没过多久，你们俩就都睡着了。|[say: 爱你，[Dad]。睡个好觉。] 你回复了同样的情感，她[if (haslegs) {移动尾巴，放在你的双腿之间。感觉就像在它们之间放了一个枕头。|将尾巴搭在你的下半身上。}] 你用一只手臂环抱她，在依偎得更近时，将一只[hand]直接放在她赤裸的乳房上。她咯咯地笑着，用尾巴尖在你的臀部上戏弄地拍了一下，然后你们俩放松下来，很快就一起睡着了。}]");
               break;
            case 2:
               outputText("你走进[cabin]，看到[helspawn]正[if (builtcabin) {in|on the}] [bed] [if (helspawnchaste) {在昏暗的灯光下看书。你准备好躺在她身边，看着她的书，想知道她在看什么。似乎没有什么特别的，但你很高兴她喜欢这样一个好爱好。当她继续看书时，你依偎在她赤裸的身体上，你的眼睛很快变得沉重，然后你进入了梦乡。|疯狂地自慰。在你还没来得及对这一幕做出任何反应之前，你听到她脚趾蜷缩、身体颤抖时发出的轻声呻吟。看来你来得正是时候，正好抓住了她的现行。你准备上床睡觉，她睁大眼睛，红着脸看着你。[say: 你进来之前可以警告我一下的！我的意思是，我知道是你，但被撞见还是挺尴尬的！] 你躺在她身边，揉了揉她的头发，只是告诉她你很享受这场表演。她脸红得更厉害了，滚到了一边。你对这一幕感到好笑，用一只手臂环抱她，很快就睡着了。}]");
               break;
            case 3:
               outputText("你走进空荡荡的[cabin]，慢慢地准备就寝，等了女儿几分钟后，决定独自躺在[bed]上。过了一小会儿，你感觉眼皮开始发沉。然而，就在你快要睡着的时候，你听到有人走进了[cabin]。你听到他们发出一点轻微的沙沙声，很快他们就和你一起躺在了[bed]上。正如人们所料，你感觉到[helspawn]将身体贴向你，用她那长满鳞片的手臂环抱你，紧紧地挤压着你。[say: [if (helspawnchaste) {晚安，爱你。|晚安，[Daddy]。明天见。}]] 她亲吻你的脖子，用头蹭你，而你很快就睡着了。");
         }
         saveContent.wakeUp = true;
         outputText("[pg]");
      }
      
      public function helspawnScales() : String
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,958) == 1)
         {
            return "黑色的";
         }
         return "红色的";
      }
      
      public function helspawnSFWSurprise() : void
      {
         clearOutput();
         outputText("一阵美味的香气将你从睡梦中唤醒，你睁开眼睛，看到一个托盘，正端在一双长满[helspawnscales]鳞片的手上。当[helspawn]刚注意到你醒来时，托盘危险地摇晃了一下，但谢天谢地，她成功地在它砸到你脸上之前稳住了它。");
         outputText("[pg]不过，如果单凭这香味来判断的话，那可能也没那么糟。");
         outputText("[pg][say:早上好，[Dad]，]她说道，你很难不注意到女儿眼中的兴奋。尽管你绞尽脑汁，也想不出有什么值得庆祝的场合——不过你并不介意。");
         outputText("[pg][say:没什么特别的。][Helspawn]继续说着，脸稍微红了一下。[say:只是给" + get_player().mf("世界上最好的爸爸","世界上最好的妈妈之一") + "的一个惊喜。]");
         outputText("[pg]听到这话，你忍不住感到一阵自豪，但你的肚子却有不同的想法。它已经开始咕噜作响，迫不及待地想尝尝她带来的东西，而她也很体贴地把托盘放在了你的[bed]边。六块隐约呈心形的肉正等着你，还在冒着热气，当[helspawn]注意到你的目光时，她[if (!helspawnchaste) {猛地红了脸|笑得更灿烂了}]。");
         outputText("[pg][if (!helspawnchaste) {[say:我……觉得这样可能挺可爱的，]她勉强嘟囔着，你一把将慌乱的女儿拉进怀里。|[say:请享用，[Daddy]！]她说着，已经蹦蹦跳跳地过来给了你一个拥抱。}]虽然你试图感谢她为你做早餐，但她坚持[if (!helspawnchaste) {说没必要，尽管她无法掩饰脸上越来越大的笑容|让你先尝尝}]。[if (helspawnchaste) {这倒不是问题，因为你|你}]觉得自己也无法再抵挡诱惑了[if (!helspawnchaste) {，当你伸手去拿一块时，发现她正偷偷看你，你对此一点也不感到惊讶}]。");
         outputText("[pg][say:" + (followerKiha() ? "我不得不请奇哈阿姨帮忙" : "我其实不知道自己在做什么") + "，]她承认道，而" + (get_kihaFollowerScene().saveContent.badCookingTasted > 1 ? "你立刻庆幸自己花时间指导了那条母龙" : (get_kihaFollowerScene().saveContent.badCookingTasted != 0 ? "你的肠胃立刻颤抖起来，已经开始害怕要把这东西咽下去了" : "你告诉她，如果它尝起来和看起来一样好，你怀疑自己以后再也不想吃别的东西了")) + "。");
         outputText("[pg]你" + (get_kihaFollowerScene().saveContent.badCookingTasted == 1 ? "忐忑不安地" : "迫不及待地") + "将一块食物送入嘴中，" + (get_kihaFollowerScene().saveContent.badCookingTasted == 1 ? "尽量不去品尝她到底做了什么。深吸一口气，你将其整个吞下，令你惊讶的是，它居然可以吃。不，甚至可以说[i:很美味]。你迫不及待地咬了第二口，微笑着看向正注视着你的[Helspawn]。" : "细细品味着你小女儿的礼物。它如你预期的那样美味，当你咬下第二口时，[helspawn]兴奋地看着你。"));
         outputText("[pg][say: 味道怎么样？]你告诉她这是你吃过最好吃的东西" + (get_kihaFollowerScene().saveContent.badCookingTasted == 1 ? "，努力掩饰声音里的惊讶" : "") + "，而她[if (!helspawnchaste) {移开了视线|咯咯笑了起来}]作为回应。[say: 谢谢，[Daddy]。]");
         outputText("[pg][if (!helspawnchaste) {似乎对你的认可感到十分害羞|似乎对你的认可感到满意}]，[helspawn]祝你[day]愉快，然后走出了你的[cabin]，留下你继续享用早餐。[say: [if (helspawnsleep) {待会儿见|回见}]，[Dad]。]");
         outputText("[pg]没过多久你就把剩下的全吃光了，让你在开始新的一天时感到饱腹且愉悦的温暖。[if (!helspawnchaste) {当你拿起托盘时，你发现了一瓶赫莉娅最好的酒，上面系着熟悉的粉色丝带。也许她只是想让你享受这顿饭，不管味道如何？}]");
         doNext(playerMenu);
      }
      
      public function helspawnReadSpells() : void
      {
         outputText("[pg]你把魔法书摊在面前，看到那些深奥的仪式和无法发音的胡言乱语，你的大脑一片空白。至少它有图片——而且你的女儿似乎很喜欢它，当她试图发出那些奇怪的词时，她的手臂疯狂地挥舞着。");
         outputText("[pg]你认为每个女巫都必须从某个地方开始——而且她还没有放火烧你的[cabin]——所以你满足于在[helspawn]不可避免地结巴时为她加油。");
      }
      
      public function helspawnRead2(param1:int) : void
      {
         clearOutput();
         outputText("在" + (get_game().cabin.get_hasBookshelf() ? "搜索了你临时搭建的图书馆" : "翻遍了你" + (get_camp().get_builtCabin() ? "卧室" : "帐篷") + "的角落") + "之后，你终于找到了你的");
         switch(param1)
         {
            case 1:
               outputText("木工指南");
               break;
            case 2:
               outputText("[i: 危险植物]副本");
               break;
            case 3:
               outputText("战斗手册");
               break;
            case 4:
               outputText("礼仪指南");
               break;
            case 5:
               outputText("色情文学");
               break;
            case 6:
            case 7:
            case 8:
               outputText("法术书");
         }
         outputText("。当你把[Helspawn]放在[if (isbiped) {你的腿上|你的面前}]时，她伸手去抓书页，显然已经迫不及待地想开始了。");
         switch(param1)
         {
            case 1:
               outputText("[pg]虽然这可能不是最吸引人的书，但" + (get_camp().get_builtCabin() ? "自从来到玛瑞斯后，木工已经成为她[father]生活的重要组成部分，你尽力让小蝾螈对你的爱好产生兴趣。没过多久，" : "你觉得你可以利用这段时间自学木工的基础知识。当然，内容本身不如听到她[father]的声音重要，当") + "她依偎在你怀里，呼吸变得越来越轻柔，渐渐进入了梦乡。");
               break;
            case 2:
               outputText("[pg]你翻开封面，你的女儿指着玛瑞斯野生动物的每一幅插图咯咯地笑，但当你的荆棘触手和有毒藤蔓开始挠她的腰并把她抱在怀里时，笑声很快变成了尖叫。感觉没过多久，你们就把整本书都看完了，但[helspawn][say: 再来一次，[Daddy]！]的叫喊声让你又回到了开头。");
               outputText("[pg]当她安静下来，靠在你身上渐渐入睡时，这一定是你第四次——还是第五次？——循环了。");
               break;
            case 3:
               outputText("[pg][Helspawn]立刻对这本书产生了兴趣，当你教她如何战斗时，她蹦蹦跳跳，挥舞着手臂。伴随着[if (isnaga) {一声邪恶的嘶嘶声|你最可怕的咆哮}]，你和小蝾螈摆开架势，当她击退可怕的野兽时，她的笑声充满了整个" + (get_camp().get_builtCabin() ? "房间" : "空气") + "。当一次偏离的旋转[if (isgoo) {重重地|在肚子上}]击中你时，你女儿的笑容很快就消失了，你抱了她好几次才让她相信你没事。");
               break;
            case 4:
               outputText("[pg]如果你不想让[helspawn]变得像她的[if (cor < 40) {母亲|" + get_player().mf("父母","母亲们") + "}]那样，也许最好早点开始。考虑到这一点，你试图教导你的女儿贞洁的重要性，但小蝾螈似乎根本不想听，不耐烦地扭动着，直到她挣脱出来。");
               outputText("[pg]剩下的阅读时间你都在追着她跑，但当你看到她玩得有多开心时，你很难感到失望。");
               break;
            case 5:
               outputText("[pg]这有什么坏处呢？她又不是大到能听懂的年纪。而且这书[i: 是]有插图的，正如你女儿很快意识到的那样，她粗短的手指在书页上的……形状上划过。没过多久，她就翻完了整本书，当一页又一页的性爱画面翻过时，她的眼睛里闪烁着你从未见过的强烈光芒。");
               outputText("[pg]你只能希望她没有从那里面学到什么词汇。");
               break;
            case 6:
               if(!get_player().hasStatusEffect(StatusEffects.KnowsBlind))
               {
                  helspawnReadSpells();
               }
               else
               {
                  outputText("[pg]在你打开法术书之前，一个脏兮兮的蝾螈指纹弄脏了崭新的封面，但一道耀眼的闪光分散了你女儿的注意力，让你有足够的时间把它从她手里拿出来。她紧紧地贴着你，显然是被你的魔法吓到了，但没过多久，她就不耐烦地等着她[father]的下一个法术，睁大眼睛惊奇地看着你指尖上变出的火花和微小的火焰。");
               }
               break;
            case 7:
               if(!get_player().hasStatusEffect(StatusEffects.KnowsArouse))
               {
                  helspawnReadSpells();
               }
               else
               {
                  outputText("[pg]你示意女儿坐好，然后翻阅法术书，虽然她一开始似乎没有合作的兴趣，但当你把手放在她腿上的抓痕上时，小蝾螈安静了下来。念完咒语后，伤口在她眼前愈合，很快就消失得无影无踪。");
                  outputText("[pg][say: 谢谢，[Daddy]，]她嘟囔着，手指在刚愈合的鳞片上摩擦。");
               }
               break;
            case 8:
               if(!get_player().hasStatusEffect(StatusEffects.KnowsTKBlast))
               {
                  helspawnReadSpells();
                  break;
               }
               outputText("[pg]虽然她从来没有拿到过，但书就在她够不到的地方盘旋。你的女儿并没有被吓倒，她开始跳着去抓它，你无辜地把目光移开，因为它似乎随着她起伏。");
               outputText("[pg][say: 把它放下来，]她说，当书轻轻地落在她头上时，她惊讶地尖叫起来。[say: 拜托了，[Daddy]。]");
               outputText("[pg]你心软了，觉得任何能让蝾螈记住礼貌的东西都足以作为今天的教训。");
         }
         outputText("[pg]没过多久，赫莉娅探头进来看看你，" + (param1 == 5 ? "你松了一口气，因为你及时把书拿走了" : (param1 < 3 ? "看到你熟睡的女儿时笑了" : "显然对你女儿玩得这么开心感到惊讶")) + "。[say: 谢谢，[name]，]她说着，抱起小蝾螈。[say: 你让她对一些我从来做不到的事情产生了兴趣。]");
         outputText("[pg]" + (param1 < 3 ? "说完，她溜走了，小心翼翼地不吵醒她的女儿。" : "[say: 读书！][helspawn]欢呼着，当她母亲把她抱走时，她的笑容很有感染力。"));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function helspawnRead(param1:Boolean = true) : Boolean
      {
         var choice7:int;
         var _g7:HelSpawnScene;
         var choice6:int;
         var _g6:HelSpawnScene;
         var choice5:int;
         var _g5:HelSpawnScene;
         var choice4:int;
         var _g4:HelSpawnScene;
         var choice3:int;
         var _g3:HelSpawnScene;
         var choice2:int;
         var _g2:HelSpawnScene;
         var choice1:int;
         var _g1:HelSpawnScene;
         var choice:int;
         var _g:HelSpawnScene;
         var _loc2_:int = 0;
         if(param1)
         {
            menu();
         }
         if(get_player().hasKeyItem("Carpenter\'s Toolbox"))
         {
            if(param1)
            {
               _g = this;
               choice = 1;
               addNextButton("木匠指南",function():void
               {
                  _g.helspawnRead2(choice);
               });
            }
            _loc2_++;
         }
         if(get_player().hasKeyItem("Dangerous Plants"))
         {
            if(param1)
            {
               _g1 = this;
               choice1 = 2;
               addNextButton("危险植物",function():void
               {
                  _g1.helspawnRead2(choice1);
               });
            }
            _loc2_++;
         }
         if(get_player().hasKeyItem("Izma\'s Book - Combat Manual"))
         {
            if(param1)
            {
               _g2 = this;
               choice2 = 3;
               addNextButton("战斗手册",function():void
               {
                  _g2.helspawnRead2(choice2);
               });
            }
            _loc2_++;
         }
         if(get_player().hasKeyItem("Izma\'s Book - Etiquette Guide"))
         {
            if(param1)
            {
               _g3 = this;
               choice3 = 4;
               addNextButton("礼仪指南",function():void
               {
                  _g3.helspawnRead2(choice3);
               });
            }
            _loc2_++;
         }
         if(get_player().hasKeyItem("Hentai Comic") || get_player().hasKeyItem("Izma\'s Book - Porn"))
         {
            if(param1)
            {
               _g4 = this;
               choice4 = 5;
               addNextButton("色情书",function():void
               {
                  _g4.helspawnRead2(choice4);
               });
            }
            _loc2_++;
         }
         if(get_player().hasItem(get_consumables().B__BOOK))
         {
            if(param1)
            {
               _g5 = this;
               choice5 = 6;
               addNextButton("黑之书",function():void
               {
                  _g5.helspawnRead2(choice5);
               });
            }
            _loc2_++;
         }
         if(get_player().hasItem(get_consumables().W__BOOK))
         {
            if(param1)
            {
               _g6 = this;
               choice6 = 7;
               addNextButton("白之书",function():void
               {
                  _g6.helspawnRead2(choice6);
               });
            }
            _loc2_++;
         }
         if(get_player().hasItem(get_consumables().G__BOOK))
         {
            if(param1)
            {
               _g7 = this;
               choice7 = 8;
               addNextButton("灰之书",function():void
               {
                  _g7.helspawnRead2(choice7);
               });
            }
            _loc2_++;
         }
         if(param1)
         {
            clearOutput();
            outputText("虽然这可能不是[helspawn]所期望的玩耍时间，但你确实有" + (_loc2_ == 1 ? "一本书" : "一些书") + "可以读给你的女儿听。");
            outputText("[pg][say: 祝你好运。]赫莉娅指着那个围着你们俩跑圈、嘴里还咿咿呀呀的小蝾螈。[say: 她从起床起就没消停过。]");
            outputText("[pg]值得一试。你觉得她甚至可能会喜欢。");
            outputText("[pg][say: 是吗？]赫莉娅从背后抱住你，笑着说道。" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,958) < 1 ? "那肯定是随你了。" : "那肯定没随我。"));
            outputText("[pg]为了证明自己是对的，你一把抱起咯咯笑的小蝾螈，当你问她想不想听故事时，她那双[helspawneyes]眼睛睁得大大的。[say: [Daddy]！]她尖叫着，你就当这是同意了。当你抱着女儿走进你的[cabin]并把她放在[bed]上时，她的母亲挥手告别，你趁机" + (_loc2_ == 1 ? "找你的书" : "翻看你的藏书") + "。");
            if(_loc2_ > 1)
            {
               outputText("[pg]你要给她读哪一本？");
            }
         }
         return _loc2_ > 0;
      }
      
      public function helspawnPlay() : void
      {
         clearOutput();
         spriteChooser();
         outputText("你把[helspawn]从地上抱起来，转着圈逗这个咯咯笑的小女孩，听着女儿惊喜又开心的叫声，你也忍不住笑了起来。很快，你把她抛向空中，然后在地上和她一起爬来爬去，玩躲猫猫和十几个其他的游戏，你和[helspawn]笑着拥抱在一起。不知不觉中，赫莉娅也滑下来和你们一起，紧紧抱着她的女儿，试图和她交流，一次教这个不断长大的女孩几个词。");
         outputText("[pg][say: 妈妈！] [helspawn]终于叫了一声，轻轻拍了拍她母亲的鼻子。赫尔笑了，但当她的女儿伸手去摆弄她的上衣，显然是饿了的时候，笑声变成了叹息。");
         outputText("[pg][say: 我们得在这个小家伙把我的奶头咬掉之前给她断奶，] 赫尔抱怨着，因为[helspawn]已经咬住开始吸吮了。[say: 这些牙长得真快……]");
         outputText("[pg]你笑着揉了揉[helspawn]火红的头发，让这对母女完成这顿饭。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function helspawnMaleSurpriseVaginal() : void
      {
         clearOutput();
         helspawnMaleSurpriseTransitions(helspawnMaleSurpriseLastChoice,2);
         outputText("[pg]你不确定你能想到什么比看到你自己的女儿慢慢沉下去，直到她的嘴唇刷过你的[cock]的头部更好的事情了，但当她的淫液顺着你的肉棒流下时，冲刷着你的湿热热浪可能就是其中之一。当她滑得更低时，她的褶皱轻轻分开，不断地亲吻你，因为她[if (!helspawnchaste) {对你微笑，显然很喜欢你每次接触时的扭动。就在你准备自己把她拉下来的时候，当她把自己的身体猛地压在你的长度上时，你的呼吸在胸口停止了。|准备好了，显然对[if (cocklength > 10) {你的尺寸|她自己}]有些不确定。当她终于鼓起勇气时，她让你慢慢进入，当你完全填满她时，她无法抑制自己的呻吟。}]");
         outputText("[pg]一旦你埋在她的体内，你们俩都花点时间喘口气。[Helspawn]闪烁着汗水，当她靠着你时，她的手掌在你的[chest]上滑动，你没有错过再次占有她嘴唇的机会。你的舌头第一次刷过她的舌头让她不寒而栗，但没过多久她就[if (!helspawnchaste) {设定了节奏|能够跟上}]。每一个吻都是坚定而渴望的，当你的女儿深深地饮着你的嘴唇时，当她坐在你的[cock]上时，她内心似乎有什么东西[if (!helspawnchaste) {断裂了|觉醒了}]。");
         outputText("[pg]而这个新的[helspawn]，以足以[if (builtcabin) {让床嘎吱作响|唤醒你的营地}]的力量在你身上疯狂地向下推，很快就让你高兴地喘着粗气。每一个动作都让你不寒而栗，她丝滑的肉壁不断地摩擦和抓住你的[cock]，而她像[if (!helspawnchaste) {一个被附身的狂战士|她已经等了几年了}]一样骑着你。她自己的哭声——小声的呜咽、喘息声，以及一个刚好击中正确位置的蝾螈喉咙里的呻吟声——在你的[cabin]里回荡，在你的耳边甜美。");
         outputText("[pg]但如果你想的话，你不可能再安静了，当她再次用你的[cock]刺穿自己时，她的尾巴抽打着你的[if (singleleg) {[skindesc]|腿}]。她的内壁紧紧地夹住你，尽最大努力索取你的精液，就在她的身体放弃并瘫倒在你的胸前，大口喘气之前。当你拿起缰绳，抓住她的臀部并把她拉到你的长度上时，她的兴奋悬在空中，滴在你的[bed]上。她颤抖的褶皱仍然在挤奶，用一种光滑的拥抱挤压你，威胁要从[if (hasballs) {你的[balls]|你}]身上吸出精液。");
         outputText("[pg]仍然有机会拔出来，但你不确定你还有多少时间……");
         dynStats(DynStat.Lust(20));
         addButtonDisabled(1,"小穴","你已经做过这个了。");
      }
      
      public function helspawnMaleSurpriseTransitions(param1:int, param2:int) : void
      {
         var _loc3_:Array = [];
         switch(param1)
         {
            case 0:
               _loc3_ = ["[say: [if (!helspawnchaste) {我整个早上都在等着品尝你。|我想我能做到。}]] 当她顺着你的身体爬下时，她湿滑的褶皱诱人地摩擦着你，停在[if (tailLeg) {你的尾巴上|[if (isgoo) {你黏糊糊的底部|你的双腿之间}]}]。","[say: [if (!helspawnchaste) {这才是我想听到的。|啊……}]] [if (!helspawnchaste) {她毫不犹豫地跳起来，在你的上方摆好姿势，迫不及待地想要开始。|尽管她的回答有些不确定，但她显然和你一样兴奋，她[helspawnscales]鳞片上闪烁的性奋就是最好的证明。}]","[if (!helspawnchaste) {[say: 我很乐意试试。] 说完，她站起身，在坐到你的[cock]上之前，对着你渴望的目标扭动了一下。[say: 别让我等太久，[Daddy]。]|当你告诉她你想要什么时，你女儿的眼睛惊讶地睁大了，但她似乎并不反对。她顺着你的身体走下时臀部的轻轻摇摆似乎就是最好的证明——当她在你的[cock]旁蹲下时，她无法否认涂抹在你[skindesc]上的性奋。[say: 温柔点，好吗？]}]","[if (!helspawnchaste) {[say: 我不知道你喜欢这个，[Daddy]。] 她的尾巴在你的[bed]上发出不祥的鞭打声，让你赶紧澄清你[i:到底]是什么意思。[say: 噢……]|[say: 我-我的尾巴？] [Helspawn]一开始似乎有些困惑，但当你把她火热的尾巴滑过你的[cock]时，她很快就明白了。[say: 我会让你舒服的，[Daddy]。]}]"];
               outputText(_loc3_[param2 - 1]);
               break;
            case 1:
               outputText("你不想这么快就结束，于是抚摸她的脸颊以引起她的注意。[Helspawn]抬起头，[if (!helspawnchaste) {她半闭的眼睛显然还在梦想着你的[cock]|明显有些困惑}]。[say: [if (!helspawnchaste) {嗯……怎么了？|有什么不对吗，[Dad]？}]]");
               outputText("[pg]你告诉她你的渴望，她[if (!helspawnchaste) {笑了|点了点头}]。[if (!helspawnchaste) {[say: 那我们还在等什么？]|[say: 我会尽力的。]}]");
               outputText("[pg]当她站起来并" + (param2 == 4 ? "坐在你的胸口" : "将自己降到你的肉棒上方") + "时，你很难抑制住自己的兴奋。");
               break;
            case 2:
               _loc3_ = ["并引导她向下，直到她的嘴唇贴在你的肉棒上，[helspawn]显然非常渴望品尝自己。","","并将其与她的另一个入口对齐，[helspawn]已经因期待而颤抖。","并把她拉直，让她火热的尾巴垂在你的肉棒周围。[if (!helspawnchaste) {[say: 哦？]她扭动着臀部，用她能装出的最虚假的无辜感在你的肉棒上摩擦，你确信她完全知道你想要什么。|她似乎有些不确定，但当你告诉她你希望她做什么时，她点了点头。}]"];
               outputText("当你将肉棒从她丝滑的褶皱中滑出时，你的女儿在你耳边呜咽");
               outputText(_loc3_[param2 - 1]);
               break;
            case 3:
               _loc3_ = ["帮她下来，直到她的嘴唇刷过你抽动的[cock]。","将自己与她闪闪发光的嘴唇对齐。","","让她的尾巴拍打在你的[cock]上。[if (!helspawnchaste) {[say: 哦？]她扭动着臀部，让它刷过你，你确信她完全知道你想要什么。|她似乎有些不确定，但当你告诉她你希望她做什么时，她点了点头。}]"];
               outputText("当你慢慢从她的深处退出来时，你的女儿释放出一丝颤抖的呼吸，并且");
               outputText(_loc3_[param2 - 1]);
               break;
            case 4:
               outputText("你还有更多想做的事，所以你吸引了女儿的注意力，试图在她的尾巴慢慢从你身上解开时让自己平静下来。不到一秒钟，她站起来并" + (param2 == 1 ? "坐在你的大腿之间" : "在你的肉棒上方放低身子") + "[if (!helspawnchaste) {。[say: 我希望你准备好了，[Dad]。]|，因几乎无法抑制的兴奋而颤抖。}]");
         }
         helspawnMaleSurpriseLastChoice = param2;
         button(4).enable();
      }
      
      public function helspawnMaleSurpriseTail() : void
      {
         clearOutput();
         helspawnMaleSurpriseTransitions(helspawnMaleSurpriseLastChoice,4);
         outputText("[pg]随着她的尾巴越来越热，令人沉醉的热浪席卷了你，虽然看到火焰不断逼近你的[cock]一开始有点吓人，但你知道你的女儿绝不会伤害你[if (!helspawnchaste) {——除非你要求}]。");
         outputText("[pg][say: [if (!helspawnchaste) {你觉得怎么样？|感觉如何？}]]");
         outputText("[pg]你试图回答，但她尾巴尖拂过你的[if (hasballs) {[balls]|龟头}]，很快就让你发出了满足的呻吟。似乎对你的回答很满意，[helspawn]将尾巴缠绕在你的[cock]根部，用惊人的热度轻轻挤压你。[if (hastail) {正如你所知|有些令人惊讶的是}]，它几乎和她的手一样灵巧，在你的肉棒下方轻轻挠痒，刚好让你扭动起来。");
         outputText("[pg]而她真正的手已经[if (isflat) {在你的胸膛上游走|托起你的乳房}]，你的女儿靠了过来，她那双[helspawneyes]的眼睛注视着你的每一次颤抖。你确信她注意到了当她的尾巴缠绕你的肉棒时你急促的呼吸，她的脸上掠过一丝淡淡的微笑，然后开始认真地移动它，每一次抚摸都像她自己的手指一样温柔。动作缓慢而轻柔，几乎像是在挑逗，你现在只想自己动手，用臀部迎合她。");
         outputText("[pg]不过你还是让步了，任由[helspawn]随心所欲，用她的尾巴慵懒地描摹你的[cock]。在龟头周围轻轻一捏引起了你的注意，她清理掉你兴奋的痕迹，然后又滑回根部，用她火热的温度包围着你。每当你以为你已经摸清了她的技巧时，她就会改变花样，握得更紧、更热，或者更快，但你的女儿总是会回到那些最让你颤抖的动作上。");
         outputText("[pg]她如此专注地研究你，让你有点不好意思，但你非常愿意把这抛在脑后，因为她很快就学会了你的[cock]需要什么。尽管她几乎没有碰到你，你的[skinshort]已经因为兴奋而刺痛，随着时间的推移，你[if (hasballs) {睾丸|肉棒}]里的压力似乎在增加，你的身体渴望释放。[if (hasballs) {它们|它}]在她收紧时跳动，当她盘绕的尾巴用她内壁所有的热度和饥渴榨取你时，火焰充满了你的[if (isgoo) {核心|血管}]。");
         outputText("[pg]如果你现在不阻止她，你不确定自己还能承受多少……");
         dynStats(DynStat.Lust(20));
         addButtonDisabled(3,"尾巴","你已经做过这个了。");
      }
      
      public function helspawnMaleSurpriseOral() : void
      {
         clearOutput();
         helspawnMaleSurpriseTransitions(helspawnMaleSurpriseLastChoice,1);
         outputText("[pg]在你大腿上飘忽不定的呼吸暗示了她有多么渴望，但你仍然没有完全准备好迎接[if (hasballs) {她温暖湿润的嘴唇包裹住你的[balls]|第一次长长的舔舐在你的[cock]根部盘旋。}]在每一次温柔的抚摸下都隐藏着一种[if (!helspawnchaste) {你无法想象的|你从未见过的}]饥渴，当她用一个湿漉漉的、充满爱意的吻从你敏感的[skinshort]上离开时，你毫不怀疑她[if (!helspawnchaste) {终究是[if (libido > 50) {你的|Hel的}]小女孩|已经等这一刻很久了}]。在你甚至没有时间恢复之前，她的嘴唇就顺着你肉棒的底部向上移动，但她的舌头第一次接触到你的龟头时，就让你扭动着想要更多。");
         outputText("[pg][if (!helspawnchaste) {你确信她注意到了，但|如果她注意到了，}]她并不在乎，满足于在龟头周围旋转，直到你闪烁着她的唾液。只有你第一滴兴奋的汁液才能让她停下来，你的女儿急切地[if (!helspawnchaste) {吸吮它|品尝它}]，然后再回到根部。到了那里，[helspawn]抬头看着你，[if (!helspawnchaste) {确保你在看|无声地请求赞美}]，她抬起头，直到她的舌头在你的缝隙上飘动。");
         outputText("[pg]这种期待几乎让人无法忍受，但谢天谢地，你的女儿[if (!helspawnchaste) {也不是一个会退缩的人，她急切地|让步了，}]微微张开嘴唇，刚好包裹住你的[cock]的头部。一只手包裹住你的根部，稳住你[if (cocklength > 10) {惊人的尺寸|抽动的肉棒}]，被她天堂般的温暖包围着，你很快就变成了一个[if (isgoo) {黏糊糊的|汗流浃背的}]、颤抖的废物。当她的舌头按摩你最敏感的部位时，你的[if (isgoo) {整个身体都在抽动|血液在耳边跳动}]，慢慢地[if (metric) {拖拽着|一点点}]向下，直到你的整个长度都消失在她的嘴唇之间。[if (cocklength > 10) {你不确定她是怎么做到的，但当她的喉咙在你的龟头上发痒时，你并不在乎。}]");
         outputText("[pg]她的舌头卷住你，湿润而坚持的压力威胁着要打破你的决心。像这样埋在她的嘴里，你感觉到自己在抽动，你的身体本能地想要更深入并填满她——但[helspawn]先屈服了，从你身边拉开，大口喘气。清晨空气在你光滑的肉棒上留下的冰冷吻痕让你不寒而栗，但你细心的女儿很快就注意到了，她用温暖的呼吸覆盖着你，让你感到一阵阵热浪。");
         outputText("[pg]她的嘴再次张开，虽然你不确定你还能坚持多久……");
         dynStats(DynStat.Lust(20));
         addButtonDisabled(0,"口","你已经做过这个了。");
      }
      
      public function helspawnMaleSurpriseCum() : void
      {
         clearOutput();
         switch(helspawnMaleSurpriseLastChoice)
         {
            case 0:
               outputText("还没等你做出决定，她的大腿就夹紧了你，开始在你的肉棒上滑动。她的柔软加上蝾螈的体温在你的[skinshort]上感觉棒极了，当你被她紧紧握住而抽搐时，你很快就意识到这感觉有[i:多]棒，你已经接近了边缘，无法回头。这——你的女儿——太刺激了，当释放的快感席卷而来时，你的头倒在枕头上。你所能做的就是抱紧你的小女孩，你的[if (balls) {[balls]|cock}]最后一次颤抖，将你的精液喷洒在她的腿上[if (cumhighleast) {和[bed]上}]。");
               outputText("[pg][Helspawn]困惑地回头看，但当她发现刚才发生了什么时，她的表情很快变成了[if (!helspawnchaste) {觉得好笑|同情}]。[say: [if (!helspawnchaste) {我不知道你这么喜欢我，[Daddy]。|没关系，[Dad]。}]]");
               outputText("[pg]因为释放——以及相当多的羞耻——你涨红了脸，避开了女儿的目光，[if (!helspawnchaste) {尽管你脑海中还能看到她的坏笑|尽管她试图安慰你}]。[if (!helspawnchaste) {显然对她已经充分挑逗了你感到满意|领会了你的暗示}]，她站起身，[if (!helspawnchaste) {穿上比基尼|收拾好衣服}]，留下你一个人沉浸在尴尬之中。");
               if(FlagDict_Impl_.arrayReadString(KFLAGS.flags,701) == "Helspawn")
               {
                  outputText("[pg]今晚会很尴尬。");
               }
               break;
            case 1:
               outputText("……但你哪儿也不想去，当她将你的肉棒含入柔软的双唇间时，你已经幸福地叹息出声。你挺动臀部，更深地陷入她口中，但她似乎并不介意。相反，她温柔地[if (hasballs) {抚摸你的[balls]|抚摸你}]，她的双手拼命地想让你交出你的精液。随着她指尖的每一次触碰，你的视线都在颤抖，当她慢慢俯下身，用她舒缓的热度包裹你整个身体时，你所能做的只有紧紧抓住[bed]。");
               outputText("[pg]你感觉到高潮即将来临，便不再克制，伸手将她按到你的[cock]根部。当你直抵最深处时，[if (!helspawnchaste) {她的尾巴兴奋地甩动着|她惊讶地叫了一声，但并没有反抗}]，你那跳动的肉棒是她唯一的预警。没过多久，你就屈服于欲望，将第一股精液射进她的喉咙，但当你将越来越多的精液射入她等待的嘴里时，你的女儿[if (!helspawnchaste) {纹丝不动|努力坚持着}]。当你结束时，精液[if (cumhighleast) {积聚在你的身上|从她嘴里漏出，滴在你的身上}]，你瘫倒在枕头里，因筋疲力尽而颤抖。");
               outputText("[pg]为了[if (!helspawnchaste) {不浪费一滴精液|不让她的[Daddy]弄脏}]，[helspawn]从你还在抽搐的肉棒上滑开，[if (!helspawnchaste) {急切地|尽责地}]舔舐着你所有溢出的精液。");
               outputText("[pg][if (!helspawnchaste) {[say: 没有什么比[Dad]的精液更适合当早餐了。]|[say: 这是你想要的吗，[Daddy]？]}] 你的女儿最后亲吻了一下龟头，然后你把她拉到你身上，在她令人安心的温暖中放松下来。");
               break;
            case 2:
               outputText("……不过你并不在乎。这就是你的归宿，埋在女儿的深处，因渴求而跳动，不愿也无法克制。当你把她的身体当成玩具一样使用时，她在你的掌控中颤抖着，伴随着你因快感而燃烧，她撞击着你的[skindesc]。你迷失在小女孩天堂般的火热中，尽可能深地挺进，直到最终在她体内爆发。当你的精液飞溅在她的肉壁上时，你的头向后仰去，随着高潮的持续，感觉就像[if (builtcabin) {床|地板}]塌陷了一样，你的[if (hasballs) {囊袋|[cock]}]继续将[if (hasballs) {它们|它}]排空到她体内，直到你全身酸痛。你们俩齐声高潮尖叫，然后你向后靠去，筋疲力尽。");
               outputText("[pg]失去了你的支撑，[helspawn]向前瘫倒，不太优雅地趴在你的[chest]上，并在你敏感的[skinshort]上不停地颤抖。有那么一瞬间，她茫然地抬头看着你，但当你抚摸她的头发时，一个[if (!helspawnchaste) {灿烂的|害羞的}]笑容爬上了她的脸庞。");
               outputText("[pg][if (!helspawnchaste) {[say: 操，[Dad]。我们绝对还要再来一次。] 你希望不是现在——但她只是|当你的女儿迎上你的目光时，她变得" + (helspawnScales() == "red" ? "和她的鳞片一样红" : "通红") + "，但只是默默地}]蹭进你的胸膛，双臂环抱着你，你们俩一起沐浴在余韵之中。");
               break;
            case 3:
               outputText("……但是你为什么要停下来呢？你女儿的屁股像天鹅绒手套一样紧紧包裹着你，每一次深入她的深处，都让你越来越迷失在她内壁那令人沉醉的火热之中。当她再次沉下身子时，它们爱抚着你的[cock]头部，当你把她的臀部拉向[if (cocklength > 10) {它们能达到的最深处|你自己}]时，你已经因为渴望而悸动不已，再也无法克制。当你在她的肠道深处射出第一股精液时，你们俩紧贴着彼此颤抖，让你对女儿的爱淹没你。[Helspawn]的每一次抽搐似乎都能从你体内榨出更多，直到她[if (cumveryhigh) {无法容纳你所有的精液。|[if (cumhigh) {被你的种子填满|装满了你的种子}]}]。");
               outputText("[pg]当你的高潮接近尾声时，你的最后一发只剩下几滴，你的整个身体都感到刺痛和温暖，你的女儿向前瘫倒在你的[chest]上。当她得到应有的休息时，你忍不住为你的小女孩感到骄傲，将她拥入怀中。");
               break;
            case 4:
               outputText("渴望体验这种不同寻常的感觉，你保持沉默，将自己交由女儿的尾巴摆布。仿佛读懂了你的欲望，它立刻缠绕住你的整个长度，因你自己的兴奋而变得温暖湿滑。期待像一团滚烫沉重的云笼罩着你，当[helspawn]深深地看着你的眼睛时，你很难克制自己。");
               outputText("[pg][say: 让我看看你高潮的样子，[Daddy]。]");
               outputText("[pg]你对此毫无选择，除了在她的紧握中无助地跳动外什么也做不了，而她的尾巴开始慢慢移动。起初只是稍微快了一点，但你的女儿很快就用一种天堂般的火热包裹住了你，让[if (singleleg) {你浑身发抖|你的双腿发软}]。她越来越快，直到她的套弄达到了一种狂热的速度，让你气喘吁吁，拼命地接近高潮的边缘。[Helspawn]连眼睛都没眨一下，看着你的[cock]在她的尾巴里抽搐，然后伴随着最后一次挤压，你释放了。");
               outputText("[pg]你的臀部颤抖着，挺进她的紧握中，将你的精液喷洒在她的鳞片上，而你的女儿则继续尽可能多地榨取。她值得拥有这一切，所以你把一切都给了她，将[if (hasballs) {你的[balls]|你自己}]排空在她黏糊糊的尾巴上，直到你精疲力竭地躺下。然而她仍在套弄你，榨取你敏感的肉棒，直到另一阵电流穿过你的身体，你最后的一股精液飞溅在她的身上，然后你瘫倒在枕头上，彻底被榨干了。");
               outputText("[pg][Helspawn]花了一点时间[if (!helspawnchaste) {把自己舔干净|把自己清理干净}]，然后靠在你的[chest]上，双臂环抱着你。");
         }
         if(helspawnMaleSurpriseLastChoice > 0)
         {
            helspawnSurpriseEnd(2);
         }
         cheatTime(2);
         doNext(playerMenu);
      }
      
      public function helspawnMaleSurpriseAnal() : void
      {
         clearOutput();
         helspawnMaleSurpriseTransitions(helspawnMaleSurpriseLastChoice,3);
         outputText("[pg]你试着放慢速度，只将顶端抵着她，[if (!helspawnchaste) {用即将插入的暗示挑逗她|在继续之前确保她已经放松下来}]。再深入一点，你遇到了阻力，于是你抚摸着[helspawn]的大腿，轻声安抚你的小女孩，只滑入一点点，好让她适应你的肉棒。虽然她还是有点[if (!helspawnchaste) {急不可耐|紧张}]，但你的话语让她平静了下来，足以让你小心翼翼地探入她的深处。");
         outputText("[pg]当你的[cock]慢慢没入她的体内时，她舒服得[if (!helspawnchaste) {仰起头|浑身发抖}]。她肉壁火热的紧握感包裹着你，你拼尽全力才忍住没有开始真正地抽插，而是满足于你的肉棒被她那令人舒缓的蝾螈体温按摩的感觉。尽管被她包裹的感觉不可思议，你还是得控制节奏，所以你趁机查看了一下女儿的情况。");
         outputText("[pg][if (!helspawnchaste) {这显然是多余的，因为你话音未落，她就紧贴着你摩擦，让你喘不过气来。|[say: 我……喜欢，]她终于在欢愉的喘息间挤出这句话。}]把这当作鼓励，你[if (cocklength > 10) {尽可能深地埋入她体内|直没至柄}]，当她的手指找到自己的阴蒂时，你女儿的[if (!helspawnchaste) {呻吟声|甜美声音}]在空气中回荡。她的爱液溅落在你的[skindesc]上，你的双手扶住她的臀部，帮她温柔地骑乘着你，你缓慢、颤抖的动作很快变成了全力的抽插。");
         outputText("[pg]她紧致得不可思议，每一次颠簸都像是在榨取你，你的[if (hasballs) {[balls]|cock}]已经因为积蓄的精液而跳动。[Helspawn]似乎也快到了，当你猛烈地撞击她时，她[if (!helspawnchaste) {用力地操着自己|疯狂地揉搓着自己的阴蒂}]，[if (hasplainskin) {肉体|[skindesc]}]碰撞的湿滑声淹没了她的娇喘。你担心她猛地坐到你的[cock]上[if (cocklength > 10) {直到完全填满|直到根部}]时会[if (builtcabin) {把床弄塌|伤到自己}]，但当她的肉壁紧紧绞住你时，你的担忧很快就被抛到九霄云外，那湿滑的热度几乎让你无法忍受。");
         outputText("[pg][Helspawn]没有停下，依然在你身上摩擦，即使她的身体在你的肉棒周围颤抖。你的视线变得模糊，你不确定自己还能坚持多久……");
         dynStats(DynStat.Lust(20));
         addButtonDisabled(2,"肛交","你已经做过这个了。");
      }
      
      public function helspawnMaleSurprise() : void
      {
         clearOutput();
         outputText("你的女儿又出现在了你的梦中，[if (helspawnsleep) {因为即使她就在你身边，睡眠也无法将你的思绪从你的小女儿身上移开。|而这只会让你的[bed]显得更加冰冷，因为你知道你实际上是独自一人。}]尽管如此，她那[if (!helspawnchaste) {诱人的|最天真的}]微笑，那个只有当她[if (!helspawnchaste) {用手抚摸|害羞地握住}]你的[cock]时才会向你展现的微笑，占据了你的整个脑海，而现在这就足够了。她[if (!helspawnchaste) {熟练的|柔软的}]手指轻轻一捏，就让你在她的紧握中硬了起来，你的整个身体都放松下来，沉浸在更深的幻想中。");
         outputText("[pg][Helspawn]抬起头看着你，她的[helspawneyes]眼睛里充满了[if (!helspawnchaste) {欲望|好奇}]。她顺着你的身体滑下，带着[if (!helspawnchaste) {会心|担忧}]的微笑注视着你每一次抽动。当她终于到达目的地时，一根孤独的指尖在你的龟头周围画圈，轻轻拂过顶端，抹去了第一滴兴奋的液体。当然，她尝了尝，[if (helspawnchaste) {当你的味道在她的舌尖上萦绕时，她的脸上短暂地闪过一丝犹豫，随后}]她几乎无法克制自己凑上前去，直接从源头吸吮。");
         outputText("[pg]她的[if (!helspawnchaste) {笑声似乎|紧张的咯咯笑声似乎}]在你的耳边回荡，你从睡梦中醒来，清晨的阳光带来的温暖根本无法与你[skinshort]下涌动的热量相比。你叹了口气，伸了个懒腰，推开毯子。梦境总是在最精彩的部分结束，不是吗？");
         outputText("[pg]一阵战栗传遍全身，你确信刚才大腿上划过的柔软触感绝不是幻觉。");
         outputText("[pg][say: 早上好，[Daddy]。]");
         outputText("[pg]听到女儿的声音，你睁开了眼睛。令你惊讶的是，她[if (helspawnsleep) {不在你的[bed]里，而是|在你的[bed]旁边，}] [if (builtcabin) {站|跪}]在你半勃起的[cock]旁，显得[if (!helspawnchaste) {没那么}]天真。然而，你那睡意朦胧的大脑还没来得及思考目前的状况，她就已经爬到了你的身上，在你的[chest]上留下了一串火热的吻。尽管她的嘴唇在你的[skindesc]上感觉如天堂般美妙，但真正引起你注意的是她的尾巴在你敏感的肉棒上轻轻拂过。你甚至不确定她是不是故意的[if (!helspawnchaste) {——算了，你绝对确定——|，}]但缠绕在你肉棒上的热度很快就让你[if (hasplainskin) {面红耳赤|浑身酥麻}]，准备好大干一场了。");
         outputText("[pg]当[Helspawn]向后滑去并碰到某个令人愉悦的硬物时，她[if (!helspawnchaste) {笑了|假装惊讶地喘了口气}]。[say: [if (!helspawnchaste) {你就这么渴望我吗，[Daddy]？|好温暖啊，[Daddy]。}]]");
         outputText("[pg]她是对的，但你没有告诉她。相反，你轻轻抬起她的下巴，吻住了女儿的嘴唇，让她熟悉的味道将你淹没。当她热切地回应时，她的温暖用她内心的火焰填满了你，加深了这个吻，让她的舌头滑过你的舌头。她的[if (!helspawnchaste) {热情|柔软}]并不令人意外，如果不是因为肌肤相亲的微妙触感和她的大腿滑过你[cock]时带来的天堂般的压力，你很容易就会迷失在她的嘴唇中。轻轻一捏就让你喘不过气来，你的肉棒已经在她丝滑的握持下变得滚烫而悸动。她嘴唇的每一次抚摸都转瞬即逝，你的大脑完全集中在[if (singleleg) {包围你腹股沟|你双腿之间}]有节奏的快感上。");
         outputText("[pg]你几乎没有注意到她退开，直到她那双明亮的[helspawneyes]眼睛对上了你的视线。[say: [if (!helspawnchaste) {我们从哪里开始，[Dad]？|告诉我你想要什么，好吗？}]]");
         helspawnMaleSurpriseLastChoice = 0;
         menu();
         addNextButton("口交",helspawnMaleSurpriseOral);
         addNextButton("阴道交",helspawnMaleSurpriseVaginal);
         addNextButton("肛交",helspawnMaleSurpriseAnal);
         addNextButton("尾交",helspawnMaleSurpriseTail);
         addNextButton("射精",helspawnMaleSurpriseCum).disableIf(!get_silly());
      }
      
      public function helspawnLover() : Boolean
      {
         if(helspawnFollower())
         {
            return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,970) > 0;
         }
         return false;
      }
      
      public function helspawnLovemaking4() : void
      {
         clearOutput();
         outputText("你和女儿躺在一起休息了一会儿。她绯红色的头发因为刚才的剧烈运动变得乱蓬蓬的，但当她对你甜甜地微笑时，看起来依然很宁静。等你们都休息够了，你们就会继续一天的生活。");
         saveContent.slutspawnLastTimeSex = get_game().time.days;
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function helspawnLovemaking3() : void
      {
         clearOutput();
         outputText("你爬回女儿面前，温柔地亲吻她的嘴唇。如果她要高潮，那也得和你一起。你一边调整姿势，一边抚摸着你的[if (hascock) {[cock]|[clit]}]。[Helspawn]饥渴地盯着你，在等待[if (hascock) {插入|接触}]时，她已经说不出话来了。");
         outputText("[pg]" + (get_player().hasCock() ? "当你向前推进时，你女儿的小穴紧紧地抗拒着你，然后逐渐接纳你进入。当你的肉棒深深埋入她体内时，她闭上眼睛，幸福地叹息着。" : "当你向前推进，将你的阴蒂与她摩擦时，你女儿勃起的阴蒂饥渴地跳动着。当你们的私处激情地摩擦在一起时，她闭上眼睛，幸福地叹息着。"));
         if(get_player().sens > 90)
         {
            outputText("由于你身体的高度敏感，你[if (hascock) {瞬间射精|瞬间高潮，颤抖着，慢了下来，并伴随着强烈的呻吟}]。[Helspawn]一时有些困惑，[if (hascock) {慢慢退开。她悄悄地把你留在原地，你的精液还在顺着她的腿往下滴|轻笑着说，[say: 哇哦，被自己的女儿迷得神魂颠倒，直接就高潮了？我想我这辈子都不会让你忘了这事儿的。]她又发出一阵爽朗而愉悦的笑声。你羞得满脸通红，继续在她身上摩擦，注意到你已经把女儿的大腿涂满了淫液}]。");
            if(get_player().hasCock())
            {
               get_player().orgasm("Dick");
               doNext(get_camp().returnToCampUseOneHour);
               return;
            }
            get_player().orgasm("Vaginal");
         }
         outputText("你抓住她的臀部，手指滑过她光滑的" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,958) == 1 ? "黑色" : "红色") + "鳞片，慢慢地[if (hascock) {抽插着你的阴茎|在她身上来回挺动}]。[Helspawn]伸出手抓住你，热烈地亲吻你。");
         outputText("[pg][say: 我想要你抱着我，[Dad]。在你把[if (hascock) { 每一滴|一切}]都给我之前，不许松手。]");
         outputText("[pg]在你发情的女儿的话语刺激下，你抱住她，与她唇齿相依，同时挺动着你的臀部。她那双[helspawneyes]的眼睛在距离你几[if (metric) {厘米|英寸}]的地方闪烁着光芒，充满了对这个她允许[if (hascock) {进入她体内|完全占有她}]的[manboy]的爱意。随着你的动作，她抬起双腿，邀请你尽情地、更用力地操她。[if (hascock) {她阴道湿滑的肉壁拼命地紧紧吸附着你的[cock]，似乎永远都不愿意让你离开，就像它们渴望你进入一样。你|你偶尔会感觉到你的[clit]擦过她丝滑柔软的阴道口，感受到她变得多么火热和湿润。即使如此，你}]感觉到体内的热量在不断攀升；你的下腹部正积聚着一股张力。");
         outputText("[pg]偶尔中断亲吻以释放她的呻吟，[helspawn]把脸贴在你身上，任由自己沉浸在快感中。她喘息着，尾巴甩过来缠住了你。");
         outputText("[pg]你的蝾螈女儿在高潮时皱起眉头尖叫起来，[say: 我爱你，[Dad]！]");
         outputText("[pg]你也崩溃了，[if (hascock) {在最后一次向前挺动臀部时释放出每一滴精液|你的阴蒂跳动着，小穴痉挛着，将大量的女性体液倾泻在她的胯部和大腿上}]。[Helspawn]的双腿在你身后交叉[if (hascock) {，把你锁在原地，将每一股精液牢牢地锁在她体内|。被锁在原地，你只能继续在她身上挺动，直到你感觉到最后一丝快感消退}]。");
         get_player().orgasm(get_player().hasCock() ? "Dick" : "Vaginal");
         doNext(helspawnLovemaking4);
      }
      
      public function helspawnLovemaking2() : void
      {
         clearOutput();
         outputText("你把脸凑向她，热情地吻着她。你的女儿值得一些适当的前戏。你顺着她的身体往下，在她的下巴、脖子和胸部印下更多的吻。吸吮着她挺拔的双峰，你调皮地轻咬她的乳头。她对这意想不到的强烈刺激发出呜咽，她远不如她的母亲赫莉娅那样习惯任何程度的粗暴玩法。然而，还没到目的地，你离开她的胸部，用你的[tongue]尖在紧实的肚子上划过。[Helspawn]强忍着笑，因为这种感觉有点痒。");
         outputText("[pg]终于到了令人感兴趣的地方，你在她的阴蒂上印下一吻，让你年轻的蝾螈发出一声触电般的惊叫。还没等你对她的敏感露出坏笑，她就抓住你的" + (get_player().hasHorns() ? "角" : "头") + "，把你按在她的胯部，一刻也不愿意让你停下来。");
         outputText("[pg][say: 你竟敢戏弄我，[Dad]。既然你开始了，那就给我做到底，]她要求道，向你展示了赫莉娅的基因到底遗传到了哪里。");
         outputText("[pg]你伸出舌头，撬开她的阴唇。她尝起来火辣又美味，而且下面已经泛滥成灾，让你不禁怀疑是否还有必要为她服务。[Helspawn]的尾巴开心地扭动着，你的舌头探索着她宝贵的幽谷，她的呻吟声在空气中回荡，充分回答了你刚才一闪而过的念头。");
         outputText("[pg]你再次撅起嘴唇含住她的阴蒂，吸吮着那颗小小的肉核，引得她阵阵颤栗，本能地用大腿摩擦着你的脸。你鼓起力气，把头从这只蝾螈急切的抓握中挣脱出来。");
         outputText("[pg]她立刻向你抱怨，[say: 等等，我差一点就到了！]");
         outputText("[pg]这正是你停下来的原因。在正戏开始前，可不能就这么结束了。");
         doNext(helspawnLovemaking3);
      }
      
      public function helspawnLovemaking() : void
      {
         clearOutput();
         outputText("你把蝾螈拉进怀里，深情地吻了她。");
         outputText("[pg][Helspawn]脸红着笑了。[say: " + get_player().mf("爸……爸爸","妈……妈妈") + "……]");
         outputText("[pg]虽然有些惊讶，但她并不反感。[Helspawn]凑上前回应你的吻，将她那爬行动物的舌头滑过你的舌头。你的手顺着她苗条的身体滑下，拉扯着她上衣的腰部。她阻止了你，说道：[say: 别在这里，[Dad]！我们是不是应该找个更……私密的地方？]");
         outputText("[pg]她说得有道理，你也不想这次在营地中央强迫你的女儿做爱。" + (get_player().get_str() > 50 ? "你把[helspawn]“公主抱”起来，带她去一个合适的地方。" + (get_player().get_tallness() < 55 ? "她极力忍住笑。[say: 我的体型可是你的两倍大，[Dad]，这太荒谬了。]" : "她对突然被抱起感到惊讶，微笑着带着一丝淡淡的尴尬。") : "") + "你把蝾螈带到你的[cabin]，匆忙地把她放下，远离可能偷窥的目光。这应该足够私密了。准备就绪后，你解开她的衣物，尽情欣赏她赤裸、白皙的身体。");
         outputText("[pg][helspawn]羞涩地说：[say: 好了，[dad]，我是你的了，]她那泛红的脸颊暴露了她的兴奋。你[if (isnaked) {扑向她，让你那[genitalsdetail]在不断增长的欲望下集中注意力|解开你的[armor]，向你的女儿展示你的" + (get_player().hasCock() ? "[cock]" : "[breasts]和越来越湿润的生殖器") + "}]。" + (get_player().longestCockLength() < 6 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,958) > 0 ? "她一看到就咯咯笑了起来，评论道：[say: 我明白为什么妈妈要找别人帮忙生我了。]她发出一声满足的叹息，补充道：[say: 但我不介意。不管怎样，我还是你的女儿。]" : (get_player().getClitLength() >= 6 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,958) > 0 ? "她看着你的胯部，发现了你那过大的阴蒂，立刻咯咯笑了起来，评论道：[say: 哇哦，我很惊讶你没有试着用那个来生我！]她发出一声满足的叹息，补充道：[say: 但我不介意。不管怎样，我还是你的女儿。]" : "她咬着嘴唇打量着它，强忍着欲望等你采取下一步行动。")));
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2638,1);
         doNext(helspawnLovemaking2);
      }
      
      public function helspawnJustDaughter() : Boolean
      {
         if(helspawnFollower())
         {
            return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,970) == 0;
         }
         return false;
      }
      
      public function helspawnJoin() : void
      {
         clearOutput();
         spriteChooser();
         outputText("[if (cor >= 50) {也许，那么，你不应该夺走她的战利品。她是你的女儿，你应该把[i:她]从[i:他]身边带走|你的指导仍然有价值；你不会让一些无知的[if (allowchild) {孩子|男孩}]浪费她的时间}]。当你抓住他的肩膀时，男孩猛地一跳，发出一声惊呼，[helspawn]扭头看发生了什么事，脸上满是震惊。");
         outputText("[pg][say: [if (!isfeminine) {爸——爸爸|妈——妈妈}]？我以为你睡着了！] 当她后退时，你也松开了那个[if (allowchild) {小}]蜘蛛男孩，让[if (allowchild) {这个孩子|他}]平复一下情绪。");
         outputText("[pg]咽下紧张的情绪，他很快用和他本人一样像女孩的声音开口了。[say: “[if (!isfeminine) {爸——爸爸|妈——妈妈}]”？呃——嗯——对不起，我——] 你打断了他的结巴，并明确表示你不会攻击他或做任何类似的事情。然而，不能让他让你女儿失望。他脸上露出羞怯和困惑的表情，回答道：[say: 失望……？] 你问他有多擅长取悦女人。[say: 我……我不知道，我——] 你问他是不是处男，停顿了很长时间后，他移开视线，把黑发从脸上拨开。[say: 是的，[sir]。]");
         outputText("[pg]在[helspawn]插话之前，你宣布你的女儿值得更好的，因为你会向他展示。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,957) >= 40)
         {
            outputText("[pg][say: 我本来可以教他的，] 你的女儿插嘴道，但当你靠近并亲吻她时，她改变了态度。当你退开时，她凝视着她的男朋友并妥协道：[say: 不过话又说回来，我的[daddy][b:确实]让我那性欲狂暴的狂战士妈妈成为了[hers]。也许这不是个坏主意。] 男孩羞红了脸，忐忑不安地盯着地面。[Helspawn]带着焦虑的欲望回头看着你。[say: 亚历克斯没有阻止我们，所以我认为他同意了。]");
            outputText("[pg]听她说话的节奏，你几乎会怀疑她喜欢这种事情。");
         }
         else
         {
            outputText("[pg][say: 你——你？] 你的女儿紧张地说。[say: 但你是我的[dad]，这不奇怪吗？] 你知道你在做什么——好到足以让一个性欲狂暴的狂战士安定下来，在一个被欲望支配的世界里和你一起抚养一个孩子。你明显的性能力让她的脸颊变红。[if (!helspawnvirgin) {[say: 这并不意味着我想让亚历克斯知道，]|[say: 不过，你比他更擅长这事并不是重点，]}] 她低声说，声音大到足以让蜘蛛男孩因为这个暗示而脸红。[if (helspawnvirgin) { [say: 尽管如此，亚历克斯并不是唯一一个处男。] 这更是你介入的理由。他们彼此之间的尴尬只会破坏体验，而你只有一次“第一次”。}]");
         }
         outputText("[pg]不再浪费时间在言语上，你在女儿的嘴唇上印下了一个渴望的吻，并让你的[hands]慢慢滑下她的身体。说话只会进一步加剧紧张气氛，这是给他们俩的另一课。行动将打破抑制和紧张，并很快让位于解脱。首先，你让蝾螈躺下并调整自己的角度，以免阻挡你的蜘蛛偷窥者的视线。[Helspawn]的身体苗条而强壮，在你的抚摸下你能感觉到她的肌肉线条，还有一种清新干净的气味，只是暗示着她和男朋友一起走过的草地和树木。她可能在出去接他之前洗漱过，以期待这件事。当你的[hand]到达她的腰部并滑入衣服下面时，她紧张起来。[say: 亚历克斯还没有看到我下面……]");
         outputText("[pg]你们俩瞥了他一眼，看到这个顺从的、像女孩一样的情郎正带着全神贯注的兴趣靠得更近。[if (cor > 50) {把你的手指滑入被子下面，你决定他还要等更长时间才能改变这一点。他颤抖着，把手指掐进大腿，但什么也没说。即使你具体的技巧保持模糊，他也能学到东西。|被他专注的神情逗乐了，你缓慢而刻意地拉下遮盖物，用你的手腕和手臂挡住他的视线，以挑逗他，让他觉得完全揭开面纱是值得的。当你让你的女儿在她的男朋友面前完全赤裸时，她的双腿并拢了，然而，在经历了那些痛苦的时刻之后，她的双腿才再次分开，他才终于能把目光投向这样一个私密的地方——一个已经在你的努力下变得湿滑和颤抖的裂缝。}] 你从简单的开始，用适量的压力，没有任何花哨的技巧。随着[helspawn]对你的触摸感到舒服，你的动作变得更加大胆和坚定。当她发出一声呻吟时，她的男朋友也跟着呻吟，并对着这个画面抚摸他[if (allowchild) {孩子般|适中}]大小的阴茎。[if (hascock) {[if (cocklength > 5 and cor > 33) {也许她有她[if (isfeminine) {另一个}]母亲那种喜欢假阴茎抽插的倾向，或者她只是在这个问题上比较谨慎。}]}] 你在她的嘴唇上又印下了一个吻，然后低下头舔她的乳头，用舌头绕着她的乳晕打转，吸吮着那勃起的凸起。她扭动着，呜咽着，渴望更多。");
         outputText("[pg]你滑下身子，来到女儿的双腿之间[if (cor > 50) {，抬起她的双腿，脱下她仅剩的衣物，让亚历克斯第一次看到了[helspawn]的小穴}]。你的舌头刚一接触，一声短促的喘息就传进了你的[if (hasfurryears) {毛茸茸的}]耳朵里。[say:[if (!isfeminine) {爸……爸爸|妈……妈妈}]……]你的[if (hasgooskin) {黏滑的|肉质的}]触手在她的阴蒂上蠕动，打断了她的思绪，她再次呻吟起来。虽然[if (cor > 50) {她的男朋友|亚历克斯}]无法看到你的口交动作，但这不仅仅是舌头和嘴唇的运动。你抚摸着这只沙罗曼蛇的臀部和大腿，然后将你的[hands]向上滑到她的臀部。接着她抓住了你[if (hasHorns) {的" + (get_player().horns.type == 5 ? "鹿角" : "角") + "|[if (hasHair) {的头发|的头}]}]，将她的阴道更用力地压在你的[if (hasmuzzle) {口鼻|嘴}]上，无言地乞求你更加卖力。你吸吮着她抽搐的阴蒂，然后将你的[tongue]探入她[if (helspawnpersonality < 40 and helspawnvirgin) {纯洁而}]渴望的洞穴中。不知所措的[helspawn]大声喘息和呻吟着，随着她体内的蠕动，用巨大的力量挤压着你的[if (isgoo) {凝胶状的}]头骨。");
         outputText("[pg][if (helspawnpersonality >=40) {尽管上气不接下气，她还是对她的男朋友说。[say:我希望……你学到了一些东西，亚历克斯，]她语气中带着越来越强烈的喜悦。|她喘着粗气，盯着亚历克斯，脸上带着内疚和愉悦的表情。}]顺着她的目光，你发现这个[if (allowchild) {小}]男孩将两只手臂交叉在双腿之间，黑色的头发部分遮住了他向下看的视线。从他面前的精液痕迹来看，他很喜欢他所看到的。既然他们都精疲力尽了，今晚就到此为止吧。说完，你站起身，把手放在亚历克斯的头上，感觉到他退缩了一下。他抬起头，脸涨得通红，眼神闪烁。在你的要求下，他紧张地站起身准备回家，但随后又转头看向你的女儿。[say:我……我爱你，[helspawn]。]说完，他立刻迅速地走开了。");
         FlagDict_Impl_.arrayWriteBool(KFLAGS.flags,3000,true);
         saveContent.slutspawnLastTimeSex = get_game().time.days;
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,957,FlagDict_Impl_.arrayReadInt(_loc1_,957) + 10);
         doNext(playerMenu);
      }
      
      public function helspawnIsASlut() : void
      {
         spriteChooser();
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,973,1);
         outputText("[pg]你的营地里有什么东西在动。");
         outputText("[pg]你的眼睛闪烁着睁开，一只长满鳞片的脚从你脸旁走过，压低的呼吸声几乎掩盖不住咯咯的笑声。另一只脚，这次是闪烁着蓝黑色的脚，也走了过去。你");
         if(!get_player().get_weapon().isUnarmed())
         {
            outputText("抓紧你的[weapon]");
         }
         else
         {
            outputText("[if (hasClaws) {露出你的[claws]|握紧你的拳头}]");
         }
         outputText("当入侵者经过时，你准备好保护自己和你所爱的人。在他们离开你触及范围的那一刻，你翻身站起，环顾四周寻找恶魔大规模袭击的迹象。相反，你在火光微弱的余烬中看到了[helspawn]的轮廓，她正牵着一个看起来像[if (allowchild) {小}]蜘蛛女孩的手走向她的床。");
         outputText("[pg]你悄悄靠近，试图看清你女儿在做什么。好吧，这其实不需要天才也能猜到，但你还是得确认一下。你滑到他们身边，刚好在他们的视线之外，这时[helspawn]转过身，让蜘蛛人解开她的胸罩并抓住她的乳房，揉捏着那小小的隆起，[helspawn]压抑着呻吟，向后伸手滑入蜘蛛的胯部，抓住了她——他的阴茎。");
         outputText("[pg]好吧。你觉得你应该去阻止[helspawn]把自己变成一个荡妇[if (!helspawnvirgin and helspawnpersonality > 50) {——这是你的责任}]。不过话又说回来，她现在已经长大了，可以自己犯错了[if (cor >= 50) {，如果你甚至能把抓到一个可爱的小蜘蛛陷阱称为错误的话……事实上，你考虑过加入其中，但叹了口气，觉得这是[helspawn]的猎物；她可能不喜欢你加入。|。你应该介入吗？}]");
         menu();
         addButton(0,"阻止他们",helSpawnStopFucking).hint("尽管她身体已经发育成熟，但现在进行更多的家庭教育还不算太晚。");
         addButton(1,"加入",helspawnJoin).hint("她可能在身体上已经准备好了，但你应该在那里帮助她。");
         addButton(2,"什么也不做",helspawnDoNothing).hint("她自由地去处理这件事是成长的一部分。");
      }
      
      public function helspawnHeadpats() : void
      {
         clearOutput();
         outputText("你告诉[helspawn]你想对她表达一些喜爱，她立刻精神起来[if (helspawnchaste) {，虽然她的脸上很快泛起红晕|，她[if (helspawnincest) {急切地开始拉扯她胸罩的肩带|给了你一个觉得好笑但有点下流的眼神}]}]。你急忙澄清那不是你的意思，并收到一个略带困惑的眼神作为回应，但当你招手让她靠近时，你的女儿还是过来了。");
         outputText("[pg]当你的[hand]伸出时，她脸上露出了恍然大悟的表情，当你第一次接触她时，她陷入了沉默。她的头发如丝般柔滑[if (helspawnchaste) {且整洁|但有点凌乱}]，即使隔着头皮也能明显感觉到她的体温。当你将手指稍微向右移动时，令人愉悦的温暖抚慰着你，你的女儿似乎也同样放松下来，在你开始时发出了一声轻叹。");
         outputText("[pg][if (tallness < 78) {因为她很高，所以有点困难，但你的女儿微微弯曲膝盖，以更好地适应你的抚摸|你令人印象深刻的身高让你够到她的头不成问题}]。你很快就进入了稳定的节奏，慢慢地抚摸着蝾螈的头发，偶尔低下头抚摸她的脸颊。短暂地刷过她" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,958) == 2 ? "小狗般的" : "鳍状的") + "耳朵，导致她的喉咙里发出低沉的咕哝声，所以你进行了全面的触摸，并得到了接近呻吟的回报。");
         outputText("[pg]你女儿的眼睛闭上了，因为她开始真正投入其中，她可爱的小反应是衡量哪里最适合触摸的完美标准。你短暂地迷失在抚摸中，你和你的女儿都被哄入了一种纯粹的宁静状态，因为你们一起享受着这一刻。最后，你收回手，对自己做得很好感到满意。");
         if(helspawnChaste())
         {
            outputText("[pg]她的呼吸停滞了，眼睛睁开了一条缝。[say:你……你做完了吗……？]");
            outputText("[pg]你做完了。她似乎对此反应过度，避开你的目光，拖着脚走路，所以你问她是不是不喜欢，这时她的眼睛向上看。");
            outputText("[pg][say:不，[Dad]，我喜欢！抱歉，我只是……被这样触摸感觉有点奇怪，仅此而已。]");
            outputText("[pg]你的女儿有些笨拙地伸出双臂，但你很高兴地跨过距离，将她拥入一个短暂的怀抱。蝾螈很快就失去了她的胆怯，用尽全力回抱你。");
         }
         else
         {
            outputText("[pg][Helspawn]睡眼惺忪地睁开眼睛。她眨了眨眼。[say:等等，就这样？只是摸摸头？]");
            outputText("[pg]只是摸摸头。");
            outputText("[pg][say:你-你确定吗？我还以为……]");
            outputText("[pg]你问她是不是不喜欢。");
            outputText("[pg][say:不，我喜欢，但是……算了，没关系，我爱你，[Daddy]。]");
            outputText("[pg]她冲上前来，一把将你抱住，轻轻蹭了蹭你。[if (helspawnincest) {她的手似乎马上就要开始游走了，但她显然及时克制住了自己|她的双臂紧紧地抱住你，让你一度担心会被压碎，但她很快就松开了一些，让你能够呼吸}]。");
         }
         outputText("[pg]好吧，你很高兴事情解决了。你紧紧抱住你的女儿一会儿，然后松开她。她给了你一个温暖的微笑，在你离开时向你挥手。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function helspawnFootjobPussy() : void
      {
         clearOutput();
         outputText((get_player().isHerm() ? "你告诉了她你的偏好，她点了点头。" : "") + "[helspawn]那爬行动物般的双脚靠近你越来越湿润的[vagina]，柔软的脚底正对着你。当你感觉到那坚韧的触感压在你湿滑的下体上时，她" + (helspawnSlutty() ? "坏笑" : "微笑") + "着。她脚底的柔软轻轻摩擦着你的阴唇，同时她非常小心、非常轻柔地用短爪的侧面挑逗你的[if (hascock) {[cock]|阴蒂}]。虽然有些不寻常，但这种独特而愉悦的感觉——她那光滑的爬行动物脚掌在你小穴上的触感，让你放松身体，享受这一刻。当她摩擦并在你湿润的阴户上滑动，逐渐对你施加更多力量时，兴奋的火花[if (haslegs) {在你的双腿间|在你的胯下}]刺痛着。随着[helspawn]在你双腿间施展她的魔力，你决定让事情变得更相互一些也许会很不错。");
         outputText("[pg]你向你的女儿伸出你的[if (haslegs) {双腿|下半身}]，促使她尽可能地张开大腿，而不破坏任何东西。" + (helspawnSlutty() ? "你毫不犹豫地" : "你温柔地") + "将[if (tailLeg) {你的尾巴尖|你的[foot]}]压在女儿湿润的阴户上，并以打圈的方式摩擦她的下体。她赞许地" + (helspawnSlutty() ? "咕哝" : "呻吟") + "着，鼓励你再用点力。按摩、研磨、挠痒、挑逗，甚至只是勉强戳进她紧致小穴的入口，你让你的小女孩在你的触摸下高兴地" + (helspawnSlutty() ? "挺起臀部" : "扭动") + "。[helspawn]呼吸沉重，作为回报，她对你的动作也更加猛烈，让你很难不发出偶尔不由自主的欢愉呻吟。");
         outputText("[pg]她的脚底用力地摩擦着你的小穴，柔软的脚跟压在你[vagina]的入口处，力道几乎足以进入其中。令人惊讶的是，你的[if (hascock) {[cocktype]|[clit]}]被她娇小的爪子挑逗和取悦着，她竟然能如此巧妙地控制它们，[if (silly) {以至于没有撕裂你充血的器官，也没有以你能想到的最不理想的方式之一使你残废|以至于一次都没有抓伤你}]。她那爬行动物脚掌的大小足以完全包裹住你的小穴，用精心控制的动作刺激着外部的每一个部位。[if (haslegs) {你双腿间|你胯下}]的热度不断积聚，当你充满活力地在你女儿越来越湿润、闪闪发光的小穴上动作时，你确信她也有同样的感觉。");
         outputText("[pg][helspawn]先崩溃了，她的高潮来得既突然又猛烈。她" + (helspawnSlutty() ? "发出高潮时极乐的响亮呻吟" : "不由自主地发出响亮、带着喘息的呻吟，她尽力想要忍住") + "，你感觉到她的小穴在你的[foot]上抽搐痉挛，温暖的淫液涌到你身上。当你沉浸在努力为你的伴侣提供最大刺激，而她也为你高潮时，你自己高潮的刺痛快感悄然而至。你弓起背，发出一声呻吟，感觉到你的小穴在你女儿柔软的脚底上痉挛[if (hascock) {，而[cock]在她的爪子间不受控制地抽动，不久后便将你的精液喷射到她爬行动物的脚上}]。你们俩都沉浸在强烈高潮的这一刻，只是尽可能激烈地继续在对方身上动作，在度过这阵余韵时" + (helspawnSlutty() ? "充满情欲地" : "充满爱意地") + "凝视着对方的眼睛。即使在你们俩都冷静下来之后，你们俩也继续了几分钟，只是享受着彼此的感觉。");
         get_player().orgasm("Vaginal");
         doNext(helspawnFootjobEnd);
      }
      
      public function helspawnFootjobEnd() : void
      {
         clearOutput();
         outputText("当你们俩完成了有些不寻常的性爱后，你们躺在[bed]上放松一下。[helspawn]很快加入了你，" + (helspawnSlutty() ? "带着满足的表情躺在你身边" : "依偎着你，把你拉进一个拥抱") + "。" + (saveContent.footjob ? (helspawnSlutty() ? "[say: 妈的……没想到我能用脚玩得这么开心。我想有些事情付诸行动就是比在脑子里想更好。]" : "[say: 那真是……与众不同。以一种非常好的方式，我想我以后还想再试一次。]") : (helspawnSlutty() ? "[say: 妈的，[Dad]，你绝对知道怎么用你的[feet]让女孩感觉舒服。那和以前一样棒。]" : "[say: 那真是……非常有趣。不过，和你在一起总是这样，[Dad]。]")) + "你表达了你的赞同，用一只手臂搂住她，只是抱了她一会儿。" + (helspawnSlutty() ? "[say: 和你在一起总是很开心，[Dad]。] [helspawn]回抱你，给了你一个快速的吻。" : "[say: 爱你，[Dad]。只是，和我一起躺在这里一会儿，抱抱我，求你了。] [helspawn]吻了你的嘴唇，然后把头蹭在你的脖子上。") + "你和她依偎在一起，直到你能看出她睡着了，然后小心翼翼地从[bed]上起来。准备了几分钟后，你走出你的[cabin]，继续你的[day]。");
         saveContent.footjob = true;
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2638,1);
         saveContent.slutspawnLastTimeSex = get_game().time.days;
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function helspawnFootjobCock() : void
      {
         clearOutput();
         outputText((get_player().isHerm() ? "你告诉了她你的偏好，她点了点头。" : "") + "[helspawn]那爬行动物般的双脚靠近你硬得发疼的[cock]，很快用她柔软的脚底夹住你勃起的阴茎。她" + (helspawnSlutty() ? "轻笑" : "紧张地咯咯笑") + "着，开始用爪子的侧面轻轻地上下抚摸它。挑逗、把玩、轻轻摩擦，她确保在" + (helspawnChaste() ? "道歉并" : "") + "真正开始之前，看到你稍微扭动一下。[helspawn]将她坚韧脚底的正中间贴在你的[cocktype]上，然后将它们挤压在一起，牢牢地握住它。虽然一开始有点不舒服，但一旦她开始用脚在你的肉棒上轻轻上下移动，感觉简直棒极了。她爬行动物脚底的柔软有点出乎意料，但绝对令人愉悦。[if (silly) {有人教过这个女孩要保湿。}]当她以稳定、强烈的节奏在你身上动作时，你决定让你们俩的事情变得更相互一些。");
         outputText("[pg]你向你女儿闪闪发光的阴户伸出你的[if (haslegs) {双腿|下半身}]，当她为了取悦你而张开双腿时，它完全暴露了出来。" + (helspawnSlutty() ? "你立刻用力地" : "在温柔地抚摸了她的的大腿后，你") + "将[if (tailLeg) {你的尾巴尖|你的[foot]}]压在女儿越来越湿润的小穴上，并热情地摩擦她的下体。她" + (helspawnSlutty() ? "将臀部稍微向你挺起" : "稍微扭动了一下，发出一声轻微的呻吟") + "以示赞许，鼓励你在动作中加入更多的速度和力量。摩擦、打圈、研磨、抽插，甚至只是稍微戳进她紧致小穴的入口，你让你那爬行动物女孩在你的触摸下" + (helspawnSlutty() ? "摩擦着自己" : "幸福地扭动") + "。[helspawn]呼吸沉重，作为回报，她对你的动作也更加猛烈，让你很容易发出偶尔不由自主的欢愉发声。");
         outputText("[pg]她的脚在你的阴茎上夹得更紧，并加快了速度，很快就以一种让[if (haslegs) {你双腿间|你胯下}]的极乐感急剧增加的速度移动[if (hasvagina) {，而你无人照料的[clit]则渴望地跳动着}]。就像她突然加速一样，她很快就转为在你整个肉棒上进行长而有力的上下抽插" + (get_silly() && get_player().longestCockLength() >= 48 ? "，不知怎么做到的" : "") + "，很快就开始在两种节奏之间交替。不断变化但同样令人愉悦的方法让你扭动着，你感觉到你的高潮越来越近。你越接近高潮，你就用越快的速度和力量在她越来越湿润的小穴上动作，随着你的[cock]开始不受控制地抽动，你的背很快就弓了起来。");
         outputText("[pg]你的[cocktype]在她的脚上用力跳动了几次，然后有力地喷射出你的精液，覆盖了她脚上的鳞片和她坚韧的脚底[if (hasvagina) {，同时大量的淫液浸湿了你身下的[bed]}]。沉浸在自己强烈的高潮中，你过了一会儿才注意到[helspawn]的小穴正紧紧地贴着你痉挛，将她的女性体液喷涌到你身上，同时她" + (helspawnSlutty() ? "充满情欲地" : "充满爱意地，尽力保持安静") + "叫喊着。你们俩继续在对方身上动作，被高潮的快感所俘获，都决心让对方的高潮最大化。直到几分钟后，你们俩才完全停下来，都感到非常满足。");
         get_player().orgasm("Cock");
         doNext(helspawnFootjobEnd);
      }
      
      public function helspawnFootjob() : void
      {
         clearOutput();
         outputText("你" + (helspawnSlutty() ? "粗暴地" : "深情地") + "抓住你女儿的手，告诉她" + (helspawnSlutty() ? "你想带她去你的[cabin]找点乐子。" : "你想在你的[cabin]里度过一点私人时光。") + (helspawnSlutty() ? " [say: 噢，是吗，[Daddy]？想操你的小女孩一会儿吗？那就请带路吧。] 带着被逗乐的微笑，你那淫荡的孩子紧紧握住你的手，走在你身边。" : " [say: 好吧，[Dad]。和你在一起，听起来是个打发时间的好方法。] 带着害羞的微笑和明亮的红晕，你那相当纯洁的女孩充满爱意地用手指缠绕着你的手，走在你身边。"));
         outputText("[pg]当你们俩到达你的住处时，你先带她进了[cabin]，然后你紧随其后。一进去，你就从后面抱住她" + (helspawnSlutty() ? "裸露的肚子" : "") + "，紧紧地贴着她。" + (helspawnSlutty() ? "[say: 迫不及待想尝尝我的味道了吗，[Dad]？]" : "[say: 感觉你的手臂环绕着我总是那么美好，[Daddy]。]") + " 你表示同意，并" + (helspawnSlutty() ? "把手移去脱掉她那不雅的衣服，在她的全力配合下迅速脱下并扔到一边。" : "告诉她你有多想要她，然后才把手移去脱掉她那端庄的衣服。[say: [Daddy]……你今天对我太快了。] [helspawn]咯咯地笑了一下，有些紧张地帮你脱下她那端庄的衣服，然后整齐地放在一边。") + (!get_player().isNaked() ? " 随着你女儿的肉体现在完全裸露出来，" + (helspawnSlutty() ? "她转过身来面对你，这样她就可以" : "你轻轻地把她转过来面对你，并让她") + "帮你脱衣服。" : "") + " 一旦" + (!get_player().isNaked() ? "你们俩都" : "她") + "完全赤裸，你让她坐在你的[bed]上。" + (helspawnSlutty() ? "迅速而充满欲望地，" : "缓慢而充满爱意地，") + "你加入她，把嘴唇贴在她的嘴唇上。你们俩充满激情和" + (helspawnSlutty() ? "性唤起" : "爱意") + "地亲吻着，你的[hands]很快就找到了你女儿挺拔的乳房。[helspawn]发出一声" + (helspawnSlutty() ? "响亮而急切的" : "安静而带着喘息的") + "呻吟，你开始抚摸和挤压她的乳房，同时玩弄她勃起的乳头。不满足于在你们俩亲热时仅仅被抚摸，[helspawn]" + (helspawnSlutty() ? "伸手下去轻轻摩擦你勃起的[if (hascock) {[cocktype]|[clit]}]" : "[if (haslegs) { 伸手下去" + (helspawnSlutty() ? "挑逗地" : "温柔地") + "抚摸你的大腿内侧|轻轻抚摸你的[chest]}]") + "。你小女儿几秒钟的触摸就给你性唤起的火焰火上浇油，但在你能够升级事情之前，她打破了接触并问了你一个问题。" + (helspawnSlutty() ? "[say: 嘿，[Dad]……你觉得我身上有什么性感的地方是你从来没有真正跟我谈论过的吗？]" : "[say: 说吧，[Daddy]，你觉得有什么更……不同寻常的事情你想尝试吗？]") + " 你只是说出你脑海中弹出的第一件事，告诉她你一直认为" + (helspawnSlutty() ? "她的脚很可爱，看起来很柔软。" : "尝试用她那可爱、看起来很柔软的脚做点什么会很有趣。"));
         outputText("[pg]还没等你问她为什么这么问，她就" + (helspawnSlutty() ? "调皮地坏笑起来" : "带着一丝兴奋咯咯笑了起来") + "。[say: 我想到了一个你可能会喜欢的特别玩法，[Daddy]。现在只要面对我，稍微往后靠一点。]你照她说的做了，将你的身体完全展现在她面前。有那么一会儿，她只是" + (helspawnSlutty() ? "带着坏笑欣赏着眼前的景象" : "紧张地摆弄着大拇指") + "。但没让你等太久，她摆出了和你相似的姿势，把脚伸向了你。");
         outputText("[pg][if (haslegs) {她用脚分开你的双腿，将你勃起的生殖器完全暴露出来。}]看来是时候尝试一些不那么传统的玩法了。[if (isherm){" + (helspawnSlutty() ? "[say: 好了，[Dad]。你想让我帮你弄哪个部位？]" : "[say: 那么……你更希望我把重点放在哪里？]") + "}]");
         if(get_player().isHerm())
         {
            menu();
            addNextButton("小穴",helspawnFootjobPussy).hint("让那双长满鳞片的脚沾点水。");
            addNextButton("阴茎",helspawnFootjobCock).hint("让她用那坚韧的脚底取悦你的阴茎。");
         }
         else
         {
            doNext(get_player().hasCock() ? helspawnFootjobCock : helspawnFootjobPussy);
         }
      }
      
      override public function helspawnFollower() : Boolean
      {
         return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,960) == 3;
      }
      
      public function helspawnFishing() : void
      {
         var _loc1_:* = null as IMap;
         clearOutput();
         outputText("你有一个绝妙的主意，既能作为[timeofday]的娱乐，又能解决[if (hours < 9) {早餐|[if (hours < 14) {午餐|晚餐}]}]，所以你大步走到[helspawn]面前，告诉她你的计划——也就是，你想和她一起去钓鱼。");
         outputText("[pg][say:钓鱼？我不太会……]她说着，[if (helspawnchaste) {揉了揉手臂|扭了扭臀部}]。[say: 我想……你能教我吗，[if (helspawnchaste) {[Dad]|[Daddy]}]？]她看起来有些不确定，但依然渴望和你共度时光。");
         outputText("[pg]好吧，既然她同意了，你觉得首先需要解决的是装备问题。");
         if(FlagDict_Impl_.arrayReadString(KFLAGS.flags,959) == "bow")
         {
            outputText("但就在你考虑如何制作鱼竿时，第二个好主意击中了你。你找来一根绳子，让你的女儿去拿她的弓。她看起来有些困惑，但还是照做了，你趁机去拿了一些备用的麻线。当她回来时，你招手让她过来，然后一起离开了营地。");
         }
         else
         {
            outputText("你需要制作某种鱼竿，但你觉得用手头的东西应该能做出来。你让[Helspawn]从你的储备中拿些木头，而你则开始处理一根钉子。费了一番功夫，你成功地把它弯成了一个粗糙的钩子形状，你的女儿回来时，你正好把它绑在一根备用的麻线上。");
            outputText("[pg]她挑了一块漂亮、细长的木料，你称赞了她的选择。蝾螈[if (helspawnchaste) {脸红了，嘟囔着道了声谢，然后|只是咯咯地笑，给了你一个被逗乐的眼神，所以}]你开始处理木头。没过多久，你手里就有了一根像样的鱼竿，所以你把线绑在上面，然后举起来欣赏你的作品。");
            outputText("[pg][Helspawn]似乎[if (helspawnchaste) {对做好的鱼竿感到惊讶，考虑到它有多简单|对做好的作品有些不以为然，但她还是牵起了你的手}]，然后你们俩离开了营地。在路上，你确保挖了一些蠕虫作为诱饵。");
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,2005,FlagDict_Impl_.arrayReadInt(_loc1_,2005) - 1);
            get_player().addKeyValue("Carpenter\'s Toolbox",1,-1);
         }
         outputText("[pg]你不确定附近的河流是不是最理想的地点，但对于你们的目的来说应该足够了。毕竟，这更多的是为了体验，而不是真的为了获取食物，尽管你确实希望有足够的刺激来娱乐你的女儿。[if (helspawnchaste) {然而，你意识到这可能不是问题。[helspawn]那双[helspawneyes]眼睛里闪烁的光芒清楚地表明，她和你一样渴望开始|但值得庆幸的是，你觉得事情会很顺利。尽管她早些时候态度冷淡，但你能看出来她开始对这个主意感兴趣了}]。");
         outputText("[pg]你们俩顺着河岸往下走，");
         if(FlagDict_Impl_.arrayReadString(KFLAGS.flags,959) == "bow")
         {
            outputText("接着[helspawn]转向你问道，[say:那么，你有什么打算？我不太清楚这弓是干什么用的……]");
            outputText("[pg]你只是笑了笑，让她拿出一支箭。这只蝾螈照做了，然后把它递给你，脸上写满了疑惑。然而，当她看到你拿出带来的麻绳并开始把它绑在箭上时，这种不确定很快就变成了恍然大悟。当你完成后，你实质上做出了一个微型鱼叉，然后你把它交还给你的女儿。");
            outputText("[pg][say:[if (helspawnchaste) {我想我明白你的意思了。这看起来可能有点难，但我很乐意试一试。|所以我就直接射它们？太棒了，你为什么不早点告诉我！}]] [Helspawn]冲你[if (helspawnchaste) {微微一笑|咧嘴大笑}]。[say:你准备好了我随时可以开始。]");
            outputText("[pg]你女儿的热情很有感染力，所以你赶紧带她来到河边，向她解释该怎么做。她一边听一边点头，还没等你讲完，她就已经搭上箭瞄准了。她脸上的表情非常专注，所以你决定不干涉，而是看着她稍微向右移动，屏住呼吸，然后射出了箭。");
            outputText("[pg]箭矢飞入水中，[helspawn]兴奋地拉着连着的绳子把它拽回来，结果却因为干干净净的箭头而大失所望。");
            outputText("[pg][say:我很确定刚才瞄得很准的……]她说道，显然有些沮丧。你向她解释说，这和普通的射箭有很多不同之处——鱼线的额外重量、水面的折射，以及穿过液体时的额外阻力，都会让击中目标变得困难得多。" + (get_player().masteryLevel(MasteryLib.Bow) > 2 ? " 你尽力传授你的知识，模仿着熟悉的拉弓动作" : "") + "。");
            outputText("[pg]她[if (helspawnchaste) {带着平静的决心接受了你的话|激动地点头赞同}]，你能看出她想尽快再试一次，所以你停止了说教，让她继续。接下来的几箭结果也差不多，虽然这只蝾螈有点受挫，但当你们俩一起摸索其中的门道时，周围无疑弥漫着纯粹的欢乐气氛。");
            outputText("[pg]终于，在一次又一次的失败后，[helspawn]干净利落地射中了一条鱼的侧面。一声胜利的欢呼在河岸边回荡，[if (helspawnchaste) {随后你的女儿才回过神来|你的女儿得意洋洋地举起双臂}]。你庆祝她的成功，但她很快又投入其中，眼中闪烁着火花。你一直陪在她身边，看着她一次又一次地射击，时而咯咯笑，时而嘟囔抱怨。");
         }
         else
         {
            outputText("你环顾四周，很快就发现了一块合适的石头。它宽阔平坦，离水面足够近，你应该能用得上。你向年轻的蝾螈招手，[if (singleleg) {在岩石上坐下|坐了下来}]，拍了拍你旁边的位置。[Helspawn]毫不犹豫地走了过来，她一坐下，你就把鱼竿递给了她。");
            outputText("[pg][say:哦，但我不太知道怎么用，]她举起一只手说道。");
            outputText("[pg]没关系，你很乐意教她。你把鱼竿塞进她手里，然后站起身绕到她身后。这样你就能指导你的女儿，带着她做几个练习动作。抛竿是最重要的一环，所以你花了几分钟帮她掌握正确的姿势。");
            outputText("[pg]当你确信她准备好了，你递给她一条蚯蚓，不过[if (helspawnchaste) {她似乎不太适应拿这东西|她看起来宁愿跳过这一步}]。你收回手，亲自把鱼饵挂在鱼钩上，然后告诉这只火蜥蜴可以开始了。");
            outputText("[pg]她的第一次抛竿在水面上划过一道完美的弧线，伴随着“扑通”一声轻响落入河中。就你看来，这是一次很棒的抛竿，所以你特意告诉了她。");
            outputText("[pg][say:谢谢，[Dad]。那么，呃……现在干嘛？]");
            outputText("[pg]你告诉这只火蜥蜴现在该等了。她看起来有点[if (helspawnchaste) {困惑|沮丧}]，于是你解释说鱼儿咬钩可能需要一些时间。钓鱼全靠耐心。听到这话，她[if (helspawnchaste) {坚定地点点头，把注意力转回鱼线上|差点退缩，但还是克制住了自己}]。鱼线在水里上下浮动，四周一片寂静。");
            outputText("[pg]还没等你反应过来，一股猛烈的拉力差点把鱼竿从她手里拽出去。");
            outputText("[pg][say:啊！]她大喊道。[say:我——我该怎么办？]");
            outputText("[pg]你迅速告诉她如何刺鱼，她按照你的指示猛地向后拉扯鱼竿。在你的指导下，她开始与鱼搏斗，毫不犹豫地吸收着你所有的指令。她眼中的光芒令人瞩目，当水面破开的飞溅声吸引你的注意力时，你甚至感到有些惊讶。");
            outputText("[pg][Helspawn]将鱼拉出水面，划出一道优美的弧线，差点直接拍在你脸上。幸运的是，你及时躲开了，但在你对此发表评论之前，你的女儿已经发出一声欢呼，将鱼高高举过头顶。");
            outputText("[pg][say:我抓到[if (helspawnchaste) {它了，[Dad]|你了，混蛋}]！你看到了吗？你觉得它有多大？好吃吗？]");
            outputText("[pg]你回答了她所有的问题，对她[if (!helspawnchaste) {不那么}]纯真的兴奋感到有些好笑。但是，正如你告诉她的那样，这只是第一条鱼。你敢打赌，这条河里还有很多鱼等着你去钓。年轻的蝾螈点点头，在你身边坐下，似乎下定决心要继续下去。");
            outputText("[pg]你们陷入了一种稳定、宁静的节奏。[if (helspawnchaste) {你和你的女儿都不想打破河畔的宁静|你的女儿出奇地安静，似乎很满足于静静地坐着，享受这氛围}]。你们轮流传递鱼竿，尽管即使鱼竿不在你手里，[helspawn]完全投入其中的样子也让你觉得你仍然在掌控一切。");
         }
         outputText("[pg]总而言之，你们俩成功钓到了四条看起来很适合食用的鱼。到最后，[helspawn]开始显得有些疲惫，但这很正常，因为从天色来看，你们在这里待的时间比你想象的要长。你把手放在她的肩膀上，告诉她差不多该回去了。");
         outputText("[pg]她微笑着回答，[say:[if (helspawnchaste) {谢谢你，[Dad]。|太棒了，[Daddy]！}] 我玩得比我想象的还要开心。]");
         outputText("[pg]你告诉她，你很高兴能向她展示钓鱼的乐趣，但也指出她应该尽快把这些鱼带给她的[if (isfeminine) {另一个}]母亲。你可不想让她所有的努力白费。");
         outputText("[pg]她点点头说，[say:嗯，你想加入我们吗？我们钓到的鱼绰绰有余。好吧，我可以确保妈妈给你留一些。]");
         outputText("[pg]你很想去，但你在这里待得够久了，你想回去了。而且你不确定赫莉娅做的菜到底能不能吃。[Helspawn]完全不介意，只是微笑着向你挥手，你开始向营地走去，你的[legs]有些僵硬。");
         saveContent.fishing = true;
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function helspawnFemaleSurprise2(param1:int) : void
      {
         var _loc2_:* = null as String;
         var _loc3_:* = null as Array;
         clearOutput();
         if(param1 == 2)
         {
            outputText("[say: 你确定吗？] [if (!helspawnchaste) {她的嘴顺着你的大腿向下游走，又热又湿，有那么一瞬间，你担心她会把你丢在这里。|她自己似乎也有点不确定。}] [say: 既然这样……]");
         }
         else
         {
            outputText("[say: [if (!helspawnchaste) {那是我的最爱|我会为你尽力的}]，[Daddy]。]");
         }
         outputText("[pg]似乎对" + (param1 == 2 ? "她的决定" : "你的回答") + "很满意，她凑得更近了，抓住你的大腿，将你的嘴唇含在她的嘴唇之间，让你每一次的颤抖来引导她的节奏。[if (vaginalwetness > 2) {你[if (issquirter) {源源不断|大量}]的淫液似乎并没有让[helspawn]感到困扰，你的女儿在将舌头滑入其中索取更多之前，已经尽可能多地喝了下去。|作为一直以来都很体贴的女儿，[helspawn]照顾着你身体的需要，在将舌头滑入其中之前，用她的唾液涂满你。}]每一次对你内壁的温柔抚摸都让你的胃紧缩，你很快就意识到，[if (helspawnchaste) {尽管她表面上看起来很天真，}]她已经知道你喜欢什么了。");
         outputText("[pg]但这并没有阻止她发现更多，当她缓慢、细致地探索你时，你的女儿毫不吝啬地给予你她一贯的关注。她在你最轻微的颤抖或最浅的呼吸处停留，仿佛在记住你需要的一切，一直到她的拇指在你的[clit]上轻轻按压。你发出一声略带渴求的呻吟，然后是一阵停顿，她所有的动作都停止了，即使你的[if (singleleg) {身体|双腿}]本能地夹紧，想把她留在里面。");
         outputText("[pg]火热、未被满足、绝望，你只能为你的女儿扭动身体，想要的不仅仅是她呼吸的不稳定触感。你猜想毕竟" + (param1 == 2 ? "这就是你犹豫不决所要求的结果" : "她从未承诺过[i:什么时候]") + "，但你没有太多时间去想这些，她的舌头已经在你隐隐作痛的阴蒂周围旋转，湿润、包裹的灼热点燃了你的身体。然而，[helspawn]并不满足于仅仅是这种反应，她用双手环住你的大腿，[if (builtcabin) {把你压在身下|把你抱紧}]，确保你无法逃脱她嘴唇的柔软。每一次舔舐似乎都在你的身体上跳动，即使她从未离开过你泛红的幽谷。");
         outputText("[pg]它们就在你最需要的时候消失了，只在你的[skinshort]上留下一个刺痛的吻，而你" + (param1 == 2 ? "只能听天由命，接受这无尽的挑逗，看不到任何解脱的希望" : "试图保持冷静，但收效甚微") + "。当她[if (builtcabin) {把你引导到[bed]中间，留下你一个人不被触碰，|[if (tailLeg) {从你的盘绕中挣脱出来|向后退去}]并拒绝给你她的温暖}]时，她挪动的声音让你绝望地脊背发凉。她不会真的就这样丢下你吧？");
         if(param1 == 0 || param1 == 2 && Utils.randomChance(50))
         {
            outputText("[pg]谢天谢地，她还算仁慈，又回来了。她把腿滑到[if (singleleg) {[if (tailLeg) {你的尾巴|你身下}]|你的腿下}]，凑得更近了，直到一股热气压在你的[skinshort]上。一想到" + (param1 == 2 ? "" : "") + "[if (helspawnchaste) {你可爱的小[helspawn]|她}]即将" + (param1 < 2 ? "按你说的做" : "做的事") + "，你就连呼吸都变得困难起来。她第一次挪动并没有离开多远，双手就紧紧握住了你的手，她的身体已经在你身上颤抖了。这一刻提醒着你，她仍然是你的小女孩，充满了热情，却又缺乏经验。");
            outputText("[pg]她没有试图移动，所以你也尽量保持不动，不想催促她。等她准备好后，即使是第一次试探性的挺胯，也让她发出了一声可爱的喘息。当她在你身上滑动时，你的[skindesc]感到又热又滑，你几乎不敢相信她为你做了这一切。而且她确实[i:在]做，她最初的笨拙[if (!helspawnchaste) {很快|最终}]随着她变得更加适应而消失。下一次她移动时，你还没来得及喘口气，你的女儿就[if (!helspawnchaste) {顺着你的大腿滑下，气喘吁吁地|紧张地笑着}]把你拉向她。");
            outputText("[pg]整个世界似乎都收紧了，在你的肠胃里盘旋，因为[helspawn]火热湿润的温度紧紧贴着你的身体。她还没有在你身上摩擦，还没有。甚至没有放松下来，只是稍微移动一下，用她阴唇的温暖包裹住你跳动的[clit]。相反，她只是坐在那里，栖息在你身上，仿佛她本来就属于那里——你也不希望她以其他方式存在——单是这种期待就让你喘不过气来。");
            outputText("[pg]一根指尖顺着你的肚子滑下，只往下探了一秒钟，这就足以让你的臀部不耐烦地挺起，把你的情欲涂抹在她的皮肤上。对女儿如此绝望的反应让你感到一阵尴尬，但她似乎并不介意，[if (!helspawnchaste) {立刻|小心翼翼地}]加快了速度，她每一次扭动臀部，[if (builtcabin) {房间|帐篷}]里都回荡着[helspawn]颤抖的叫声。随着你[clit]的每一次摩擦，你体内的温度越来越高，只有这些叫声能让你找到一丝依靠。");
            outputText("[pg]她完全沉浸在快感中，甚至没有注意到你用双臂环抱住她。你的手指下是她滑腻的汗水，空气中也弥漫着浓重的汗味。但你依然需要感受她，所以你把她颤抖的身体拉得更紧，让她每一次挺动带来的颤栗传遍你的全身。你一这么做，她就压得更紧了，在你身上呜咽着，因为她碰到了一个让你意识到自己离高潮有多近的地方。");
            outputText("[pg]让你松了一口气的是，她并没有停下来，她的尾巴拍打着[if (tailLeg) {你的尾巴|[if (isgoo) {你|你的双腿}]}]，同时她的手也向下摸索到了你的阴蒂。当她的手指和身体的压力似乎将你紧紧包裹成一团时，[Helspawn]令人目眩的气味在你的鼻尖萦绕，你的女儿每一步都与你同在。当你身下的肌肉紧绷时，感觉就像[if (builtcabin) {床|地面}]渐渐远去，你所能做的就是紧紧抱住[helspawn]，在她怀里颤抖，一切都变得模糊不清，只剩下她在你耳边的哭泣，她在你[skindesc]上的呼吸，以及席卷你每一[if (metric) {寸|寸}]肌肤的温柔热浪。每一次颤抖都在你们两人之间回荡，直到你最终只能抱着她，无法鼓起力气做任何其他事情。即使是现在，你几乎不敢相信你能和你的小女孩分享这一刻，当她的爪子刺入你的[skinshort]提醒你她还在那里时，你只能叹息着抚摸她的背。");
            outputText("[pg]最终你的呼吸慢了下来，她在你的怀里放松下来，当你终于放开她时，她依偎在你的胸前。你很乐意和她躺在这里，只要她喜欢，但随后发生了一些变化，当她揭开你眼睛上的面纱并滑回去时，她的嘴唇在你的嘴唇上留下了甜蜜的印记。");
            outputText("[pg]世界上没有比看到你的女儿趴在你身上，在你偷吻她时脸红微笑更让你想看的景象了。");
         }
         else
         {
            if(get_player().hasVirginVagina() != get_player().ass.virgin)
            {
               _loc2_ = get_player().hasVirginVagina() ? "[asshole]" : "[vagina]";
            }
            else
            {
               _loc3_ = ["[asshole]","[vagina]"];
               _loc2_ = _loc3_[Utils.rand(int(_loc3_.length))];
            }
            outputText("[pg]相反，她的嘴唇在你的肚子上挠痒痒，当它们慢慢向上移动到你的[chest]时，你松了一口气。当你伸出手，让你的手指滑过她的肋骨，把她拉近时，她似乎并不介意。她的温暖落在你身上，这是一种持续的、令人欣慰的压力，她把你的乳头含在嘴里，用舌头轻轻地滚动。再往下，毯子沙沙作响，你几乎没有时间用手穿过她凌乱的头发，她光滑的鳞片就压在你的入口处，让你的脊背发凉。不过，无论你多么努力地想隐藏它，她都太了解你了，当她用大腿摩擦你时，你放弃了所有伪装的克制，把她抱在怀里，而她则慵懒地用火热、湿润的吻覆盖你[if (isflat) {[if (ischild && femininity > 50) {刚刚发育的乳房|胸部}]|乳房}]的每一寸肌肤[if (isflat && ischild && femininity > 50) {，完全不在乎它们有多敏感}]。");
            outputText("[pg]在她那似乎无尽的爱意，以及她的鳞片在你[clit]上有节奏的摩擦下，你很难集中注意力，只能感受到她每一次触碰都在你的[skinshort]上掀起朦胧的快感浪潮。渴望得到更多，你将她拉得更紧，把你女儿紧紧抱在一个完全不符合[father]身份的拥抱中，寻找着那迟迟不来的释放。");
            outputText("[pg][say: 让我来，]她说道。这一次当她吻上你的嘴唇时，你能感觉到这个吻背后隐藏的饥渴，也能从她爬回你身下的动作中感受到。她用指尖抚摸着你的[skindesc]，然后[if (singleleg) {[if (tailLeg) {某种温暖滑腻的东西落在了你的尾巴上|她坐进了你的黏液中}]|分开了你的双腿}]。");
            outputText("[pg]这个[if (singleleg) {跨坐在你身上|在你双腿之间}]的女孩是[if (helspawnchaste) {你纯洁的小[helspawn]|你自己的女儿}]，[i:这个]想法让你的心跳加速，几乎和她呼在你跳动的阴蒂上的热气一样让你兴奋，她的舌头正越来越靠近你最渴望的地方。知道她和你一样渴望着彼此，让你的[skinshort]一阵酥麻。当她终于，[i:终于]不再折磨你，将你含入唇间，让她那蝾螈般的温暖包裹住你时，你感觉自己已经完全被[if (vaginalwetness > 2) {你自己的淫液|她的唾液}]覆盖了。");
            outputText("[pg]那舒缓的热度似乎抽走了你的力气，当她悠闲地用舌头绕着你的[clit]打转时，你舒服地仰起头。然而，她并不满足于你这样的反应，你很快就感觉到有什么柔软的东西压在了你的" + _loc2_ + "上，温柔地挑逗着你张开，同时她缓缓地挤了进去。");
            if(_loc2_ == "[asshole]")
            {
               get_player().buttChange(3,true);
            }
            else
            {
               get_player().cuntChange(3,true,true);
            }
            outputText("她对你肉壁的每一次爱抚都让你在她的嘴里颤抖，你的女儿尽力让你保持平静，直到她的手指完全没入你的深处。你的身体紧紧夹住这突如其来的充实感，拼命想把她拉得更深，感受她更多，但无济于事。");
            outputText("[pg]相反，她帮助着你，慢慢地滑出，直到指尖刚好擦过你的入口，然后再滑进去。她抽插时，舌头在你的阴蒂上打转，被[helspawn]如此无微不至地照顾，很快就让你面红耳赤、酸痛不已，你的双手紧紧抓着毯子，你的[if (tailLeg) {尾巴缠绕在她的腰上|[if (isgoo) {黏糊糊的身体感觉快要散架了|双腿缠绕着她]}]。她似乎没有反应，太专注于把你带到边缘，她用小心翼翼的触摸探索着你的" + _loc2_ + "，急切地寻找着那些让你在她身下颤抖的敏感点。");
            outputText("[pg]当她找到一个敏感点时，你眼前的黑暗爆发出白光，她从未停歇，一边吸吮你的[clit]，一边按摩你的内壁，将你推向高潮的边缘。即使你紧紧夹住她，在她的嘴里和手指周围抽动，当压力释放，一阵朦胧的热流席卷你全身时，她也没有停下来。即使你在女儿身下无助地痉挛，她的嘴唇也只是短暂地离开你，然后又向下移动，沿着你的褶皱描摹，舔舐你每一滴动情的汁液。尽管你很敏感，但她的每一次舔舐只会让你再次颤抖，但[helspawn]对你毫不留情，当她认为你完全干净时，她那奢华的关注就变成了缓慢、温柔的亲吻。当她把手指从你的" + _loc2_ + "里拔出来时，你更紧地抓住了[bed]，当她终于离开时，那种舒适的充实感变成了一种刺痛的空虚。");
            outputText("[pg]最终，你的呼吸慢了下来，她爬到你身上，瘫倒[if (isflat) {在你的胸膛上|在你的[breasts]里}]，你的心跳声一定在她的耳边回荡。你很乐意和她在这里躺多久就躺多久，但随后发生了一点变化，她的嘴唇在你的嘴唇上留下甜蜜的吻，她拉开你眼睛上的面纱，然后退了回去。");
            outputText("[pg]世界上没有比看到你的女儿趴在你身上，在你偷吻她时脸红微笑更让你想看的景象了。");
         }
         helspawnSurpriseEnd(param1 == 2 ? 1 : 0);
         doNext(playerMenu);
      }
      
      public function helspawnFemaleSurprise() : void
      {
         var choice2:int;
         var _g2:HelSpawnScene;
         var choice1:int;
         var _g1:HelSpawnScene;
         var choice:int;
         var _g:HelSpawnScene;
         clearOutput();
         outputText("你醒了过来，在朦胧的晨光中环顾你的[if (builtcabin) {卧室|帐篷}]。尽管太阳一直都在，但今天似乎比平时更暗，你甚至很难从你的[bed]上看清[if (builtcabin) {远处的|帐篷的}]墙壁。你不可能那么累吧？");
         outputText("[pg]你快速揉了揉眼睛——或者至少试图这么做——证实了情况并非如此。一块柔软的粉红色布料遮住了你的视线，但在你进一步思考之前，[helspawn]的声音在你耳边飘荡，带着一种低沉、[if (!helspawnchaste) {风骚|慌乱}]的语气，这种语气只能意味着你会享受她计划的任何事情。");
         outputText("[pg][say: 早上好，[Daddy]。]");
         outputText("[pg]怎么会不好呢？仅仅一秒钟后，你女儿柔软温暖的嘴唇就轻轻地印在了你的脖子上。它们向下游走，每一次触碰都像是在你敏感的[skinshort]上低语着承诺。当她描摹你的锁骨时，你只能向后仰起头，无声地乞求更多。你女儿的爱意充满了每一个吻，每一次缓慢而刻意的呼吸都饱含着她不需言语表达的深情。仿佛只要一次不经意的触碰，只要你的嘴唇轻轻擦过她的嘴唇，她就会掀开毯子，用你早已爱上的那种火蜥蜴般的[if (!helspawnchaste) {凶猛|热情}]来满足你们两人的欲望。");
         outputText("[pg]你当然不会介意，[if (!helspawnchaste) {而且你[i:知道]她也知道这一点，但是|但她以前从未像这样过，而且}]这种一反常态的、[if (!helspawnchaste) {温柔的|势不可挡的}]渴望只会让你更想要她。");
         outputText("[pg][say: [Dad]，]她终于开口了，随之而来的那声轻喘比任何言语都更能说明问题。她手掌顺着你的身体滑下时发出的微弱摩擦声也是如此，床单丝滑的触感慢慢被冷空气取代，直到她的手掌贴上你赤裸的胸膛，那渗入肌肤的热度让你的[skinshort]一阵酥麻。到了那里，她只是停顿了一下，默默地[if (isflat) {[if (ischild && femininity > 50) {描摹着你正在发育的身体那几乎看不见的隆起|感受着她指尖下你那怦怦直跳的心脏的每一次跳动}]|用手指划过你乳房[if (biggesttitsize > 8) {丰满的|柔和的}]曲线}]。");
         outputText("[pg]不过，她还是很贴心地没有让你无处安放双手，她握住你的手，引导你抚上她的胸膛。当你轻轻捏住你女儿[if (!helspawnchaste) {柔软的|赤裸的}]肌肤时，她的乳头在你的指间变硬了。[if (helspawnchaste) {她赤裸的肌肤让你感到意外，而|那}]从她口中溢出的轻声呻吟令人着迷，那甜美的声音萦绕在你的耳畔，直到她的身体移动，她呼吸的热度划过你的[skinshort]，最终落在你的嘴唇上。这突如其来的接触让你浑身颤抖，你身上的每一处都渴望品尝她，但你肌肉最轻微的收缩都被一只抵在你胸口的手给挡住了。");
         outputText("[pg][say: 还没呢。] 这两个字拂过你的嘴唇，像是对那个迟迟未落下的吻的短暂承诺。[say: [if (!helspawnchaste) {就让我来服侍你吧，[Daddy]。|今天一切都听你的，[Daddy]。}]]");
         outputText("[pg]光是想到她话里的暗示就让你把床单抓得更紧了，当她靠近，停在[if (metric) {几厘米|几英寸}]外时，你用尽了所有的意志力才保持不动。你能感觉到她的每一次呼吸都带着欲望的灼热拂过你的身体，甚至只要想象一下当她对你倾注爱意时，那份温暖在你的[skindesc]上游走，就足以让你颤抖。也许你已经对她陷得太深了，你只能这样猜测，但当她[if (hashair) {拨开你的头发|用手指划过你的脸颊}]时，所有的疑虑都烟消云散了。除了你自己的女儿，还有谁能这样爱你呢？");
         outputText("[pg]空气发生了变化，单单是这样就足以让你满怀期待地感到胃里一阵翻腾，期待着那柔软、[if (!helspawnchaste) {火热|热情}]的嘴唇慵懒地贴上你的嘴唇，用她禁忌的欲望占有你。如果英格纳姆的人们能看到你现在的样子，[if (ischild) {一个孩子躺在[his]自己孩子身下|躺在你自己女儿身下}]，仅仅是想到要品尝她全部的奉献，汗水就顺着你的身体流下，他们会怎么想？拇指拂过你乳头的触感让你根本无暇顾及这些，当她靠近时，你甚至能感觉到她的颤抖，而剩下的距离似乎依然遥不可及。");
         outputText("[pg]她的手掌更用力地压在你的胸膛上，当[helspawn]的嘴唇终于掠过你的嘴唇时，你几乎无法保持镇定。它们甜美的温柔很快就让位给了一个压抑已久的人的狂热节奏，当她的舌头毫不费力地滑入并寻找你的舌头时，她的头发在你的脸颊上扫过，痒痒的。当你移动时，她这次没有阻止你，你的手臂描绘着她背部的轮廓，将她拉得更近。毕竟，这就是你的归宿——和你的女儿纠缠在一起，沉浸在没有界限的爱中。");
         outputText("[pg]她也知道这一点，在每一个吻中，她都带着一种渴望更深地品尝你，这种渴望也点燃了你自己的渴望。在你身上，她真正地活了过来，热切地配合着你的热情，描绘着你舌头的每一个轮廓。即使她暂时分开，你的嘴唇依然因为没有她的触碰而感到刺痛，你不需要看到她，也能想象出那个温暖、满足的微笑，依然闪烁着爱的光芒。");
         outputText("[pg]又是一阵停顿，床单再次沙沙作响。这次它们滑动的速度更快了，关怀和谨慎都让位给了感受你的渴望，她的双手在你的身体上游走。当她的手指在你的身体上蜿蜒前行时，她似乎在[if (hasscales || hasfeathers) {膜拜你的每一片[if (hasscales) {鳞片|羽毛}]|抚摸你[skindesc]的每一[if (metric) {毫米|英寸}]]，她的触碰最终停在你的大腿上，就在[if (builtcabin) {床铺晃动，}]她的重量压在你身上之前，你的女儿现在湿滑地趴在你的肚子上。当[Helspawn]向前滑动时，她倒吸了一口气，当她再次找到你的脖子时，她的双手[if (isflat) {撑在你的胸前|捧着你的[breasts]}]。");
         outputText("[pg][say: [Daddy]……] 在亲吻的间隙，她几乎说不出这句话，吻痕一路向上，直到一个完全不纯洁的吻停留在你的脸颊上。[say: 我爱你。]");
         outputText("[pg]你的身体对这些话的反应是瞬间的。从胃里的翻腾，到脑海中的回声，一直到大腿间汇聚的灼热，感觉就像你被包裹在一团丝滑的甜蜜中，温暖而满足地躺在女儿的抚摸下。你几乎希望自己能一整天都待在这里，但[helspawn]似乎有别的计划，已经[if (!helspawnchaste) {摩擦着|滑行着}]向下移动到你的臀部。当她趴在你身上挪动时，她尾巴的尖端[if (isgoo) {浸入你的粘液中|在你的[if (tailLeg) {敏感的下腹部|腿}]上挠痒痒}]，但这短暂的警告丝毫没有让你对它第一次[if (helspawnchaste) {犹豫地}]拂过你[if (vaginalwetness > 2) {滴水的|火热的}]幽谷做好准备。");
         outputText("[pg]什么也没有发生。只有对她下一次触碰的令人窒息的期待依然填满你，让你渴望任何能满足你欲望的东西。甚至连她的手指在你的大腿上隐约掠过，或者她甜美的赞美在你耳边响起，都不足以安慰你，你所能做的就是向她伸出手，试图把她拉回来。");
         outputText("[pg]你几乎错过了她[if (builtcabin) {脚踩在|膝盖跪在}][if (builtcabin) {地板上|地上}]的声音，但你绝对不会错过她双手的柔软，温柔却坚定地放在你的[skinshort]上，当她[if (builtcabin) {把你滑到床边，让你的[if (tailLeg) {尾巴|[if (isgoo) {粘液团|腿}]}]悬空|[if (tailLeg) {顺着你的尾巴向上滑，直到她的呼吸拂过|停在[if (isgoo) {你的粘液拥抱中|你的双腿之间}]，她的呼吸拂过}]你的入口}]。");
         outputText("[pg][say: [if (!helspawnchaste) {告诉我你想要什么，[Dad]。|让我知道你想要什么，好吗？}]]");
         menu();
         _g = this;
         choice = 0;
         addNextButton("磨豆腐",function():void
         {
            _g.helspawnFemaleSurprise2(choice);
         });
         _g1 = this;
         choice1 = 1;
         addNextButton("舔阴",function():void
         {
            _g1.helspawnFemaleSurprise2(choice1);
         });
         _g2 = this;
         choice2 = 2;
         addNextButton("无所谓",function():void
         {
            _g2.helspawnFemaleSurprise2(choice2);
         }).hint("让她想做什么就做什么。");
      }
      
      public function helspawnFacesitting2() : void
      {
         clearOutput();
         outputText("随着你女儿湿漉漉的下体越来越靠近你的脸，她的一点爱液滴落在了你的嘴唇上。你舔掉它，评论说她看起来真的很兴奋。带着羞涩的红晕，[helspawn]立刻将自己压在你的嘴上。凭借她庞大的体型，她给你施加了惊人的重量，并粗暴地将她的外阴在你的嘴唇上摩擦。为了回应她强势的骑脸，你张开嘴，用舌头用力按摩她坚挺的阴蒂，同时她那湿润得令人愉悦的小穴在你的下巴上摩擦。当她向你挺进时，她偶尔会发出一声呻吟，你的舌头熟练地在她的快乐按钮周围滚动。");
         outputText("[pg]随着发情的火蜥蜴在你的脸上越来越快、越来越用力，你很快感觉到一种意想不到的感觉掠过你自己的胯部。[helspawn]的尾巴紧紧地压在你的外阴上，开始前后滑动，鼓励你自己开始在上面摩擦。你将你的[clit]紧紧压在她的尾巴上，并向上顶，而她则紧紧地压住它，同时为了你的快乐而抽插。随着她对你的脸和生殖器越来越粗暴，她的呻吟声越来越大，也越来越频繁，[if (singleleg) {你胯部|你双腿之间}]的热度也在稳步上升。沉浸在狂喜中，没过多久，她就在高潮的愉悦中大叫起来。受到她高潮的鼓励，你用力按摩她的阴蒂，同时快速用力地将你的小穴在她的尾巴上摩擦，直到你自己也不由自主地叫出声来，第二次高潮猛烈地击中了你。");
         outputText("[pg]你们俩继续动作，直到你们的高潮都消退，[helspawn]随后从你身上下来，躺在你旁边。她翻了个身，用一只手臂搂住你，依偎在你身边，在你的脸颊上轻轻吻了一下。[say:那真的非常非常好。爱你，[dad]。]你回吻了她的脸颊并拥抱了她，同时向她表达了你也有同感。安静地拥抱了一会儿后，你注意到你的小女孩已经在你的怀里睡着了。");
         outputText("[pg]和熟睡的女儿躺了一小会儿后，你小心翼翼地从她的怀里挣脱出来，站起身。穿好衣服，你决定让她在你的[bed]里睡到自然醒。在她的额头上轻轻吻了一下后，你离开了你的[cabin]，继续你的一天。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2638,1);
         saveContent.slutspawnLastTimeSex = get_game().time.days;
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function helspawnFacesitting() : void
      {
         clearOutput();
         outputText("你闪过一丝微笑，将你的[hands]放在[helspawn]的臀部，直视着她[helspawneyes]的眼睛。她回望着你，把手覆在你的手上，走近了一步。你" + (get_player().get_tallness() < 72 ? "踮起脚" : "凑上前") + "在她的鼻子上轻轻吻了一下，她脸红了，这促使你告诉她，你想去个更私密的地方。");
         outputText("[pg][say: 当然，[dad]。带路吧。] 她可爱地笑了笑，紧紧握住你的一只手。");
         outputText("[pg]你回握住她的手，照她说的做。你们俩手牵着手，悠闲地漫步到你的[cabin]，进入一个更私密的环境。独处后，你将女儿拉入紧紧的拥抱中，并在她的唇上印下深情的一吻。你告诉她你想要她，而且现在就要。抓住她衬衫的下摆，你向上拉起，她顺势将它从身上脱下，扔到一边。她柔软苍白的肌肤裸露在外，你的手指在她肌肉匀称的身体上游走。");
         outputText("[pg]她咯咯笑着，把你的手拨开。[say: 好痒！来吧，[dad]，让我们……" + (!get_player().isNaked() ? "让你更舒服一点。] [helspawn]主动出击，急切地脱下你的衣服，每露出一寸[skinfurscales]，她都会肉眼可见地兴奋起来。" : "开始找点乐子吧。]") + " 你的女儿对你露出诱惑的笑容，脱下靴子，向你展示她长满深色鳞片的双腿。");
         outputText("[pg][say: 喜欢你看到的吗，[daddy]？]你热情地点头，告诉她你喜欢她的每一处。[say: 真的吗？那这样呢……]她故意拖长尾音，缓慢而挑逗地将裙子褪下，向你展示她闪闪发光的小穴。你一言不发地走上前，给了她一个吻，同时将一只[hand]按在她的胯部，轻轻揉搓着[helspawn]已经变硬的阴蒂。你完全掌握了主动权，将她带到[bed]边，把她按倒在床上。[helspawn]伸出一只手臂，拉住你的手，将你拉到她身上。");
         outputText("[pg]你坐在她身上，身体向前向上移动，[if (singleleg) {将你的阴户对准|跪在}]她的脸部上方。");
         outputText("[pg][say: 哇，[dad]，你真是让我大饱眼福。]受到女儿话语的鼓励，你放低身体，将阴户紧紧贴在她的嘴上，用身体的重量将它固定在你想要的位置。不需要你吩咐，[helspawn]那爬虫般的舌头立刻缠上了你的[clit]。你发出一声呻吟，告诉她做得很好，然后开始用小穴轻轻摩擦她，你的爱液涂满了她的脸，让她的下巴和嘴唇闪闪发光。");
         outputText("[pg]" + (get_player().getClitLength() >= 3 ? "你将硕大勃起的阴蒂在她的嘴唇上摩擦，让她轻松地将其含入嘴中。当你将女性的勃起在她的唇间来回抽插时，她吸吮并舔舐着你，你[vagina]的入口紧紧地摩擦着她的下巴。随着快感的累积，你弓起背，摩擦得越来越快，越来越用力。你将身体的大部分重量压在女儿身上，她熟练地取悦着你的阴蒂，这很快就" : "她用力舔舐你的阴唇片刻，然后将舌头滑入你的[vagina]。感受到她在你体内，你弓起背，在她的嘴上摩擦，并将阴蒂在她的鼻子上摩擦。她交替着缓慢而有力地按摩你的阴道壁，在里面弹动舌头，并前后抽插。随着快感的累积，你摩擦得越来越快，当你越来越接近高潮时，你用力将体重压在她身上。[helspawn]熟练地用舌头在你体内运作，并将脸向前推，用鼻子摩擦你勃起的阴蒂，很快就") + "让你达到了强烈的高潮。");
         outputText("[pg]极乐的浪潮席卷了你，让你发出一连串愉悦的呻吟，同时一股淫液喷涌在她的脸上。在缓慢的抽插中度过高潮后，你称赞了她的表现，然后仰面躺在她身边。喘息了片刻后，你的女儿爬到你身上，在你的嘴唇上印下了一个热情的吻，她的脸上闪烁着她努力工作的证明。");
         outputText("[pg]她结束了亲吻，带着诱人的坏笑看着你的眼睛。[say:那么……你爽了吗，[dad]？如果爽了的话，也许你想回报我一下？]你对她点点头，告诉她你很乐意回报她。[helspawn]听到你的回答，眼睛一亮，爬到了你刚才所在的位置。");
         get_player().orgasm("Vaginal");
         doNext(helspawnFacesitting2);
      }
      
      public function helspawnEyes() : String
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,958) == 0)
         {
            return "金色的";
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,958) == 1)
         {
            return "深红色的";
         }
         return "亮绿色的";
      }
      
      public function helspawnDrinkKidAJuice() : void
      {
         clearOutput();
         outputText("在营地里散步时，你注意到[helspawn]正弯腰在一个水桶旁，" + (helspawnSlutty() ? "从中喝水" : "把杯子伸进去") + "。虽然一开始你没怎么在意，但一声惊讶的尖叫提醒了你那个特定的水桶现在的用途。[Helspawn]向后绊倒，摔在地上时溅了自己一身水。");
         outputText("[pg]小A从水里探出头来，看起来也有些惊魂未定。你开始[walking]过去，一边走一边听着她们的对话。[say: 抱、抱歉！我不知道你住在这里，][helspawn]结结巴巴地说。小A只是嘟囔了几句，也许是因为被抓了个措手不及而感到尴尬。");
         outputText("[pg]你一到，[helspawn]就转移了注意力。[say: 哦，嘿，[dad]！]她说着，向你的[hand]伸出手寻求帮助。[say: 我想我选错喝水的水桶了……]");
         outputText("[pg]小海葵现在因为你的出现而壮了胆，开口说道：[say: 没关系。]小A把自己从水桶里拉了出来，站在你身边，面对着高耸的" + helspawnScales() + "蝾螈。很少能一次从她嘴里听到超过一个词，真是难得。");
         outputText("[pg][Helspawn]跪下来，把一只手放在海葵那长满触手的头上。[say: 抱歉吓到你了，很高兴你这么友好，]她说着，然后把她抽搐的手指从触须中抽了出来。你简短地向她解释说，海葵有能使猎物动弹不得的毒刺，尽管小A可能不是故意的。[Helspawn]尴尬地笑了笑。[say: 没、没造成什么伤害，对吧？这很快就会消退的？]");
         outputText("[pg]小A焦急地上下摇头，向蝾螈保证这不会持续太久。虽然这次互动有点不尽如人意，但她们似乎至少理解了彼此。[Helspawn]走开去确保她把手上的毒素都洗干净了，而小A则抓住你，寻求一些安慰，确认她没有在这里搞砸。当然，你安抚了她的担忧，让她回去继续在水桶里放松。");
         saveContent.sippedAnemone = true;
         doNext(playerMenu);
      }
      
      public function helspawnDoNothing() : void
      {
         clearOutput();
         spriteChooser();
         outputText("你转过身，回到你的床上。你一钻进毯子，耳朵就被[helspawn]床上传来的微弱呻吟和愉悦的咕哝声所冲击，她和她的第一个小男朋友正在亲热。你几乎能从这里听到尾巴抽插的声音。真可爱！");
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,957,FlagDict_Impl_.arrayReadInt(_loc1_,957) + 10);
         doNext(playerMenu);
      }
      
      public function helspawnDiscoversBooze() : void
      {
         clearOutput();
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,972,1);
         outputText("当你在营地里走动时，你注意到赫尔不在她的小角落里——既然她的斗篷不见了，她可能是去探望家人了。你本来不会多看她那部分营地一眼，直到风中突然飘来一股硫磺和燃烧的酿酒厂的气味。你挑起一根眉毛，悄悄地走向赫尔的蒸馏器，安静得像");
         if(get_player().get_race() != "cat-boy" && get_player().get_race() != "cat-girl")
         {
            outputText("一只猫");
         }
         else
         {
            outputText("你这只猫一样");
         }
         outputText("，然后从蒸馏器的铁制机身旁探出头来。");
         outputText("[pg]瘫倒在地上，嘴巴正对着龙头的是[helspawn]，她用尾巴保持龙头打开，让酒流入她张开的嘴里，而她则在下面懒洋洋地躺着。当你大声清嗓子时，她慌乱地挥舞了一会儿，松开了龙头，挣扎着站起来——却又醉醺醺地一屁股摔倒在地。[say: 呃……]她呻吟着，擦去脸颊上的酒，醉醺醺地打着嗝。[say: 你好呀，" + championRef() + "。]");
         menu();
         addButton(1,"责骂她",scoldHelSpawn);
         addButton(0,"鼓励",encourageHelspawn);
      }
      
      public function helspawnChaste() : Boolean
      {
         return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,957) < 50;
      }
      
      public function helspawnCatch() : void
      {
         clearOutput();
         outputText("当你考虑如何最好地和[helspawn]玩耍时，一个主意突然出现在你的脑海里——你有一个从特莉那里买来的橡胶球，还有什么比教你女儿如何玩接球游戏更好的用途吗？你向小蝾螈提出了你关于[father]女增进感情时间的想法，她兴奋地同意了，跑到你指出的地方，你抡起胳膊，然后……");
         outputText("[pg]放手！球以缓慢、可预测的弧线向她飞去——如果你自己这么说的话，这是一个很好的投掷。可悲的是，你小女儿的手臂在球经过后才合上，球然后伴随着一声小小的“砰”声撞击在她的胸口，导致她向后摔倒在屁股上。");
         outputText("[pg]担心她可能会受伤，你赶紧冲过去，却发现[helspawn]咯咯地笑着，弯腰去捡球。");
         outputText("[pg][say: 再来，再来！] 她叫道，显然完全没有被撞倒所影响。你庆幸着，把球拿回来，继续以更可控的速度慢慢地来回传球。[Helspawn]出人意料地很快就掌握了窍门，没过多久，她就能像一个真正的勇者一样稳稳地接住球了。");
         outputText("[pg]这样过了一段时间，你开始注意到你女儿累了，于是，[walking]到她身边，你告诉她差不多该停下来了，一边说一边揉了揉她的头发。");
         outputText("[pg][say: 好的，[Daddy]，] 她在咯咯的笑声中说道。你陪她走回赫莉娅身边，赫莉娅在不远处慵懒地伸展着身体，显然很享受这段属于自己的时间。");
         outputText("[pg][say: 谢谢，[name]，] 她对你温暖地微笑着说。[say: 我已经有一段时间没有自己的时间了。]");
         outputText("[pg][say: 谢谢，[Daddy]！] 你的女儿附和道，赢得了她母亲摸摸头的奖励，你[walk]开了，感到非常满足。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function helspawnCampfire() : void
      {
         clearOutput();
         outputText("天色已晚，[helspawn]已经开始揉眼睛了，所以你不想做任何太费力的事情。相反，你认为一个美好的篝火交流会是和你女儿共度时光的最佳方式。");
         outputText("[pg]你带她和赫莉娅来到火坑旁，开始准备。原木为你们的小型家庭聚会提供了足够实用的座位，赫莉娅拿出了几条鱼，你为它们做了烤叉。给你们每个人叉上一条，你们很快就和女儿坐在熊熊燃烧的火堆旁，一边烤着饭，一边分享着故事和笑声。");
         outputText("[pg]食物做好后，你迫不及待地大吃起来，不过是在安慰了[helspawn]之后，因为她迫不及待地咬了一口仍然滚烫的鱼。烤串很快就被吃得干干净净，但夜晚还没有结束，所以你们三个继续在火堆旁聊天，你的女儿虽然没有说太多，但显然很享受你们给她的所有关注。");
         outputText("[pg]带着恶魔般的笑容，赫莉娅开始讲一个可怕的故事，利用火光的阴影将她的脸框得十分吓人。[Helspawn]一开始开始发抖，随着故事的进展，她紧紧抓住你的手臂。在故事的高潮结尾，赫莉娅突然向前倾，伸出爪子，小蝾螈吓得跳了起来，发出了一声小小的惊呼。");
         outputText("[pg]夜晚在许多其他类似的情节中继续，直到最后，[helspawn]累得连眼睛都睁不开了。她靠在你的身边，开始轻柔地呼吸，引得赫尔发出了一声轻声的“aww”。你轻轻地把她抱在怀里，带她到她的铺盖卷旁，把她放下，给她盖好被子。");
         outputText("[pg]赫莉娅凑过来，在你耳边低语，[say: 谢谢你今晚的陪伴。你是最棒的。] 你们分享了一个短暂的吻，然后她离开了。");
         doNext(get_camp().returnToCampUseTwoHours);
      }
      
      public function helspawnBathe() : void
      {
         clearOutput();
         outputText("你把你长着" + helspawnScales() + "鳞片的女儿抱在怀里，满怀爱意地小心搂紧她。小蝾螈咯咯笑着大喊：[say: [Daddy]！]");
         outputText("[pg]赫莉娅从你身后走来，也抱住了你。[say: 她需要洗个澡了，[name]。]");
         outputText("[pg]确实如此，就像任何成长中的孩子一样。赫莉娅也跟了过来，你们三个轻快地走到溪边，在浅水处停下。这位充满母爱的母亲坐在岸边，只把腿泡在水里，而你则抱着[helspawn][walk]向更深处。你的女儿一接触到水就猛地一抖，起初有些惊讶，但她[father]那令人安心的拥抱让她意识到这里没有危险。没过一会儿，她就高兴地踢着腿，溅起水花。");
         outputText("[pg]孩子习惯了水之后，赫莉娅觉得是时候好好洗洗了，于是扔给你一块毛巾。[say: 别忘了洗她耳朵后面！]她大喊着，看到你尽显父亲的慈爱，笑得十分灿烂。");
         outputText("[pg]你花了一些时间擦洗这个小女孩娇小的身体，把那些鳞片擦得闪闪发亮。赫莉娅感叹道：[say: 她适应水的速度可比我快多了。]");
         outputText("[pg]一阵清晰的咕噜声引起了你的注意，那是从小家伙的肚子里传来的。你的女儿呜咽着，[say: 妈妈！]乞求着能吸吮乳头。");
         if(!get_player().isLactating())
         {
            outputText("[pg]你叹了口气，捏了捏这个饥饿女孩的脸，最后擦了擦她的脸颊，然后[walking]走向她的母亲，把她交了过去。");
            outputText("[pg]赫莉娅咯咯笑着，接过女儿，立刻把乳头塞进她的嘴里。[say: 看着她这副总是吃不饱的样子，你肯定会以为我都没喂过她。]她的表情变成了一丝苦笑。[say: 她正在长身体呢。]");
         }
         else
         {
            outputText("[pg]所有的踢腿和戏水都让她胃口大开。[if (hasarmor){" + (get_player().get_armorName() == "goo armor" ? "无定形的盔甲滑开，露出了你的[breasts]。[say: 抱歉，让我给你腾个地儿，]瓦莱丽娅说道[if (hasuppergarment) {，同时她也拉开了你的[uppergarment]}]。" : "虽然有些尴尬，但你还是在抱着孩子的同时，设法露出了你的[breasts]。") + "}]你把这只小蝾螈拉到胸前，她立刻开始吸吮起来。[helspawn]叹了口气，看起来处于一种极度幸福的状态。看她已经洗得够干净了，你[walk]到岸边，坐在她的另一位母亲身边。");
            outputText("[pg]赫莉娅冲你咯咯笑着。[say: 看着她这副总是吃不饱的样子，你肯定会以为我都没喂过她。]她的表情变成了一丝苦笑。[say: 她正在长身体呢。]");
            get_player().milked();
         }
         outputText("[pg]她肯定很快就会长大的。在[helspawn]吃东西的时候，你和你的爱人安静地聊着天打发时间。话题转到了你在英格纳姆时关于父母和孩子的回忆。过了一会儿，孩子打起了瞌睡，你觉得最好让她安静地睡一觉。你把她留在赫莉娅的怀里打盹，然后继续你的[day]。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function helspawnAllGrownUp() : void
      {
         clearOutput();
         spriteChooser();
         outputText("第二天早上你醒来，很快发现你的目光被[helspawn]躺着的地方吸引，她离她母亲的吊床只有一臂之遥，仍然在平静地打着呼噜。你一边起床穿衣，一边惆怅地叹了口气，脑海里仍然回想着昨晚以及你女儿和蜘蛛的小小意外。天哪，她长得真快。比你想象的要快——对她母亲来说也是如此。赫莉娅也还在为她女儿快速的突变生长感到震惊。但现在对此无能为力，而且在这个奇怪的世界里，她似乎已经达到了成年的标准。她拥有女人的身体已经有一段时间了，似乎也拥有了女人的思想和欲望。");
         outputText("[pg]看到她完全长大，你心里有一部分感到悲伤，现在你知道是时候把你的女儿当成一个女人来对待了。抚养她、塑造她发展的时代已经结束了。你只能希望你做得足够好，能让她在这个地狱般的世界里保持安全；赋予她健全的判断力和在未来的岁月和冒险中保护自己所需的能力。");
         outputText("[pg]<b>([Helspawn]已加入追随者菜单！)</b>");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,960,3);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,961,0);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function helsLifestyle() : void
      {
         clearOutput();
         spriteChooser();
         outputText("你严肃了一会儿，告诉赫尔，如果她担心自己糟糕的选择会影响到她的孩子，也许她应该重新考虑一下她做过的一些事情：少当荡妇，少喝酒，在战斗中少当嗜血的疯子。赫尔慢慢地随着你的话语点头。[saystart]是的，也许……也许我应该。但我不知道我能不能改变，[name]。我不再像以前那么年轻了——或者至少，我感觉不到——而且我已经这样生活了好几年了。我不知道我能不能放弃我做的那些破事：派对和喝酒，打架和做爱。这是我的一部分，");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,962) == 1)
         {
            outputText("我希望这也是你爱我的部分原因");
         }
         else
         {
            outputText("即使我知道这可能也是你无法爱我的部分原因");
         }
         outputText("。我会尽量克制，但也许……如果你来抚养我的孩子会更好，[name]。天知道我是最没有资格做这件事的人。[sayend]");
         outputText("[pg]你刚想回答，但赫尔把手指放在你的嘴唇上，告诉你她需要一点时间思考。你点点头，回去继续你的工作。");
         doNext(playerMenu);
      }
      
      public function heliasAppearanceScreen() : void
      {
         var _g:HelFollower;
         clearOutput();
         spriteChooser();
         get_images().showImage("monster-hel");
         outputText("蝾螈赫尔身高七英尺，皮肤苍白，手臂和腿上覆盖着厚厚的鲜红色鳞片，不过她有着正常人类的躯干和脸庞。一条燃烧着的尾巴在她身后欢快地摆动，闪耀着");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,966) < 150)
         {
            outputText("明亮的橙色光芒");
         }
         else
         {
            outputText("明亮的白色光芒");
         }
         outputText("，散发出令人愉悦的热量，尽管它似乎永远不会烧伤你。赫尔穿着她的鳞片比基尼和皮丁字裤，并使用她的弯刀作为武器");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,397) >= 1)
         {
            outputText("；她的头上缠着蓝色的头巾，大部分被她火红的头发遮住了");
         }
         outputText("。她长着一张人类的脸，有着鲜红色的眼睛，温柔、女性化的五官，脸颊上点缀着一些苍白的鳞片，就像雀斑一样。赫尔有着长长的鲜红色头发，扎成马尾辫垂在背后。她有着宽阔的臀部和柔软、肉感的屁股。她的两条爬行动物的腿上明显装饰着鳞片和爪子，末端是柔软的皮革状脚底。");
         if(get_helspawnName() != "")
         {
            outputText("赫尔的大腿上留有三道深色的疤痕，那是[helspawn]小时候用爪子抓出来的。");
         }
         else
         {
            switch(get_game().helScene.pregnancy.get_event())
            {
               case 1:
                  break;
               case 2:
                  outputText("赫尔的肚子刚刚开始显露出一点怀孕的隆起。");
                  break;
               case 3:
                  outputText("赫尔的肚子开始显得相当臃肿，因为怀着孩子而隆起。");
                  break;
               case 4:
                  outputText("赫尔的肚子已经完全是孕妇的模样了，里面怀着一个小蝾螈孩子。");
                  break;
               default:
                  if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,966) >= 150)
                  {
                     outputText("赫尔长长的爬行动物尾巴目前正燃烧着白热的火焰，这标志着她的身体已经准备好做母亲了。");
                  }
            }
         }
         outputText("[pg]赫尔有一对大而柔软的E罩杯乳房，每个乳房的顶端都有一个[if (metric) {1.2厘米|0.5英寸}]的乳头。");
         outputText("[pg]她的双腿之间有一个温暖、湿润且包容的小穴。");
         outputText("[pg]赫尔的臀瓣之间有一个能榨干鸡巴的屁眼，就在它该在的地方。");
         menu();
         _g = get_helFollower();
         addButton(0,"继续",function():void
         {
            _g.heliaFollowerMenu();
         });
      }
      
      public function heliaTalkSeven() : void
      {
         clearOutput();
         spriteChooser();
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,964,1);
         outputText("你带着赫尔来到营地边缘一个僻静的地方，和她坐在一起，一边抚摸她怀孕的肚子，一边问她感觉怎么样。她依偎着你，长长的尾巴缠在你的腰上，脸颊贴在你的后颈上。[say: 这……和我预想的不一样，[name]。以前我想到当母亲的时候，总是会跳过“把小混蛋装在肚子里到处跑”的部分。我只是觉得……很饱，我想？就像我刚吃了一匹马，而这匹马一到晚上我睡觉的时候，就邀请它的朋友来开派对。呵，这个小火把晚上就喜欢踢来踢去，我跟你说。说到这个——]赫尔拉着你的手放在她的肚子上，让你感受里面微妙的动作，那是你们正在成长的孩子向外面的世界伸展。");
         outputText("[pg]你仍然抚摸着赫尔隆起的肚子，你提到你本来以为蝾螈会下蛋——即使她怀的只是个半蝾螈。赫尔轻声笑了起来，[say: 我想蝾螈早就抛弃了下蛋这回事了。我的意思是，我们是长着鳞片的蜥蜴人，但是拜托——这些可不仅仅是为了好看，你知道的，]她说着，托起她丰满的乳房，自从她怀孕后，它们似乎又大了一点。");
         outputText("[pg][say: 准备好充满乳汁了，]赫尔自豪地拍着她的胸部说道。[say: 别担心，我的爱人；我们蝾螈一出生就是个酒鬼，但我一定会给你留足份的！]");
         outputText("[pg]一阵笑声过后，赫尔补充道，[saystart]但说真的，亲爱的，谢谢你来看我。我……我一个人做不到，你知道吗？我在努力，但这很难，而且越来越难。自从这一切开始以来，我每天晚上都躺在床上想“哦天哪，如果我搞砸了怎么办？如-如果我说错了什么，或者做错了什么，扭曲了孩子的思想，把她毁了怎么办？或者她变成了一个比我更大的荡妇，”或者一百万件我无法停止思考的事情。我一直担心我会成为一个糟糕的母亲。但是你知道……有你在身边，我至少感到了一点自信。我甚至不知道我能不能给我们的孩子留下好印象，但是……我知道你会的，[name]。你是一个坚强的[manboy]；比我永远都要坚强。我只希望你能把一点点力量——也许还有你那好看的容貌——传给他。或者她。这就是我所要求的");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,958) != 0)
         {
            outputText("，即使他不是你的骨肉，我也可以抱有希望，你知道吗？如果他和你在一起的时间足够长，也许他会更像你而不是我");
         }
         outputText("。[sayend]");
         menu();
         addButton(0,"鼓励她",encouragePregalia);
         addButton(1,"Wellll...",helsLifestyle);
      }
      
      public function heliaTalkEight() : void
      {
         clearOutput();
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,971,1);
         spriteChooser();
         outputText("看着你们的小女儿爬来爬去，你和赫尔手挽手坐下，微笑着看着这个小蝾螈女孩玩弄着赫尔的装备碎片。");
         outputText("[pg][say: 她长得太快了……而且越来越快。我发誓，当我第一次把她从我胸前拉开时，她的体型已经翻了一倍。]你点点头，你自己也能清楚地看到。你的小女孩长得很快……这不仅仅是父母的骄傲。她真的长得更快，比人类女孩快很多倍。而且，听起来，比蝾螈应该长得快很多倍。你问赫尔是不是这样，她严肃地点了点头。");
         outputText("[pg][say: 我不知道这个世界是怎么回事，但它已经影响到了我……我的女儿……。她长得像个小地精，我不知道为什么。难道是我喝了什么东西？还是我操了什么东西？我不能……我不知道，[name]。这可能是我的错，但我无法想象我做错了什么。她应该需要几年时间才能长这么大，但看看她……]");
         outputText("[pg]赫尔是对的。你的小女孩看起来已经五六岁了。");
         if(get_amilyScene().amilyFollower())
         {
            outputText("[pg]你提到艾米莉是如何成功逆向工程出一种地精药水来加速她孩子生长的。赫尔做了个鬼脸，摸了摸她的肚子。[say: 该死的绿色祸害。我从来——几乎从来——没喝过他们的任何狗屎。魅魔的奶？当然，为什么不呢。蛇油，放马过来……但是地精药水？我没那么蠢，[name]。不可能是……]");
         }
         outputText("[pg]叹了口气，赫尔把头靠在你的肩膀上，用尾巴缠住你的腰。[say: 好吧，我想我们学习如何做父母的时间更少了，是吧？我想怎么发生的并不重要——重要的是我们的小女孩很快就会变成一个大女孩了。让我们趁还能享受的时候好好享受吧，嗯？]");
         outputText("[pg]你对你的爱人点点头，然后你们俩走过去，花些高质量的时间和[helspawn]一起玩。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function heliaSwollenNotice() : void
      {
         clearOutput();
         spriteChooser();
         outputText("你注意到赫尔在营地里漫无目的地闲逛，一只手捂着肚子，嘴里嘟囔着什么。你发誓她刚才还在咒骂自己现在肿胀得厉害的肚子，但突然她发出一声少女般欢快的叫声，并向你招手。");
         outputText("[pg][say: 快来摸摸，[name]，快！它在踢我！]");
         outputText("[pg]你小跑过去，把耳朵贴在赫尔大大的肚子上，双手抚摸着她紧绷的皮肤。过了一会儿，你感觉到一阵轻微的推力，是你爱人体内的小蝾螈对着你的头轻轻踢了一脚。");
         outputText("[pg][say: 有时候感觉她好像要踢破肚子出来一样，]赫尔轻笑着说。你扶她坐下，你们俩的手都在她肚皮上抚摸着，回应着她孩子微小的动作。[say: 她会是个战士的，[name]，我跟你说。]");
         outputText("[pg][say: 她？]你咧嘴笑着问。");
         outputText("[pg][say: 或者他。不管是哪个……那么，你想要哪个，我的爱人？一个强壮的大男孩，还是一个像她妈妈一样火爆的小女孩？]");
         menu();
         addButton(0,"男孩",youWantABoy);
         addButton(1,"女孩",youWantAGirl);
      }
      
      public function heliaLoveFollowup() : void
      {
         spriteChooser();
         outputText("你不是本地人，所以你可能对蝾螈不太了解。基本上，我们实际上是不育的。我每天都可以被灌满成加仑的精液，但很可能一滴都不会在我体内受孕。我一直以为我可以随心所欲地放荡，永远不用担心后果。但是……我想这并不是永远的。当一个蝾螈女孩找到了她想永远在一起的人时，");
         if(get_player().hasVagina())
         {
            outputText("似乎即使对方是另一个女人，");
         }
         outputText("我们……会发生改变。[sayend]");
         outputText("[pg]赫尔抬起手，解开了斗篷的搭扣。当斗篷滑落时，你的目光立刻被她的尾巴吸引——曾经燃烧着血红地狱火的坚韧尾巴，现在却被一层苍白的光芒环绕，闪烁着如白金般的光泽。你惊讶地睁大了眼睛，但当你试图靠近时，赫尔却退缩了。[saystart]这叫苍白之焰，[name]。就像它看起来那样。当一个火蜥蜴女孩找到了她想共度一生的人，我们的身体就会发生变化。当我变成这样时……我就像地精一样容易受孕，而且……而且我</i>想要<i>这样。我想要……我需要……一个孩子，[name]。我想被精液灌满直到肚子鼓起，生下一只小火蜥蜴，让我们一起抚养、疼爱。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,962) == -1)
         {
            outputText("就算你不爱我，你也会爱我们的孩子，对吧？你可以把我操到怀满孩子，甚至……甚至找别人来也行，我不在乎。我只是<i>需要</i>这个，[name]。比这世界上任何东西都更需要。");
         }
         else
         {
            outputText("我爱你，[name]。我好爱你。我想和你一起分享这份喜悦。");
            if(get_player().hasCock())
            {
               outputText("你会把我操到怀满孩子的，对吧？求你了？把你的精液给我，[name]。全都射给我，直到我被彻底搞大肚子，怀上你的火蜥蜴宝宝。");
            }
            else
            {
               outputText("就算你不能把我操得怀满宝宝……你也可以长根鸡巴啊！这个被神遗弃的世界里有很多东西能做到这点。或、或者如果你不想的话，我敢打赌我能找个狐狸女孩，或者牛头人什么的。你知道我能在什么地方找到鸡巴的，只要你一句话。");
            }
         }
         outputText("那么你觉得呢，[name]？我们生个孩子吧！[sayend]");
         menu();
         if(get_player().hasCockThatFits(get_helFollower().heliaCapacity()))
         {
            addButton(0,"生个孩子",haveAKid);
         }
         else if(get_player().hasCock())
         {
            outputText("<b>不幸的是，你的体型太大了，没法挤进赫莉娅体内亲自办事。你可能需要缩小一点。</b>");
         }
         addButton(1,"另一个爸爸",getAnotherDad);
         addButton(2,"不，或者以后",noKidsHel);
      }
      
      public function heliaGravidity() : void
      {
         clearOutput();
         spriteChooser();
         outputText("你忍不住注意到，赫尔最近行动越来越困难了——她越来越离不开营地，过去几天几乎没离开过。现在，她正在营地里忙活，试图单手把一些备用的圆木敲成一个婴儿床。你都不记得上次看到她走路时没有一只手撑在背上支撑着她沉重的肚子，另一只手漫不经心地揉着或戳着它，已经在和肚子里的孩子玩耍是什么时候了。");
         outputText("[pg][say: 嘿，亲爱的，]当你走过去，在她的脸颊上印下一个吻时，赫尔说道。[say: 所以，我想应该快了。我希望如此。如果我再变大，我可能会爆炸。]");
         outputText("[pg]你暗自轻笑，帮赫尔扶住木梁，帮她把最后几块拼在一起。");
         outputText("[pg][say: 谢谢，[name]。天哪，我最近觉得自己真他妈没用……你知道吗，前几天一只该死的小地精袭击了我，我居然怂了，摇摇晃晃地跑回家了。呃。我不能喝酒，有一半的时间不能做爱，而且每当我有机会战斗时，我都会害怕宝宝受伤，夹着尾巴跑回家。我真的准备好结束这一切了，]她呻吟着，双手捂着肚子尴尬地坐下。你用一只手臂搂住她的肩膀，把赫莉娅拉近；她甜美地笑了笑，把头靠在你的胸前，重重地叹了口气。");
         outputText("[pg]过了一会儿，她抬头看着你，问道：[say: 那么，你想好名字了吗？]");
         outputText("[pg][say: 嗯？]");
         outputText("[pg][say: 一个名字。给孩子的。过去几天我一直在认真思考这个问题。你觉得男孩叫凯罗斯或海拉斯怎么样？他们是我妈妈过去常给我讲的一个古老传说中的兄弟，一对蝾螈锻造大师，他们找到了伟大的巨龙佩雷萨尔，从他的宝库中偷走了世界上第一块钢铁，并把它锻造成了一把魔法剑。传说它太美了，玛莱亲自把它据为己有，把它赐给了她世世代代最伟大的勇者：甚至有一次赐给了铁匠的后代。如果我们有个女孩……我还不知道。也许叫辛或查拉。爸爸说我应该以妈妈的名字给她命名，但我觉得不太对劲。不知道为什么，但我就是不想把一个鬼魂的名字放在我活生生的女孩身上，你知道吗？]");
         outputText("[pg]你温柔地问她母亲叫什么名字。");
         outputText("[pg][say: 哦，我没告诉过你吗？她叫塔妮丝，她是世界上最美丽的女人。]");
         outputText("[pg]你给了她一点时间，但赫尔似乎暂时不想说话了，而是盯着远方。你吻了她一下，然后回去继续你的工作。");
         doNext(playerMenu);
      }
      
      public function heliaBonusPointsAward() : void
      {
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,963,1);
         spriteChooser();
         outputText("[pg]<b>那天晚上……</b>[pg]");
         outputText("你的睡眠被一阵轻轻拉扯你[armor]的动作打断了。你迷迷糊糊地拍打着那个推你的东西，抱怨着现在的时间，直到你终于睁开眼睛，认出赫莉娅正跪在你身边，眼神中充满了深深的苦恼。[say: [name]？[name]醒醒，我需要和你谈谈。求你了？]");
         outputText("[pg]你点点头，揉掉眼里的睡意，摇摇晃晃地站起[feet]。你注意到赫尔把她那件旧斗篷紧紧裹在身上，除了脸什么都看不见。你刚想问怎么了，但赫尔嘘了一声，说她需要私下和你谈谈。");
         if(get_camp().companionsCount() == 1)
         {
            outputText("你挑起一侧眉毛，说现在就只有我们俩，但她摇摇头，说她需要一个私密的地方，远离窥探的目光。");
         }
         outputText("你点头同意，让她扶你起来，带你离开营地。你跟着赫尔穿过黑暗，跌跌撞撞地跟在她身后，直到你们躲在离营地边缘一箭之遥的一堵废弃旧墙下。安全地躲在墙的阴影下，赫尔握住你的手，犹豫地说：[say: 听着，我不……这对我来说不容易，好吗？但我必须告诉你一些事，[name]。这很重要，好吗？至少对我来说。如果我自己能处理，我绝对不会提的。但我不能，而且……而且我很害怕，[name]。]");
         outputText("[pg]你紧紧握住赫莉娅的手，尽你所能地安慰她，说她什么都可以告诉你。她转过头，脸红得发烫；在她的斗篷下，她长尾巴上耀眼的火焰闪烁得更加明亮，甚至透过厚重的布料投射出苍白的光芒。你再次问她怎么了，在你的轻声哄劝下，赫尔抬起头，她那双明亮的深红色眼睛凝视着你。");
         outputText("[pg][saystart]我不只是喜欢你，[name]——我是说，我确实喜欢你。喜欢你，我的意思是。但这……这不仅仅是喜欢，你知道吗？当然，我说过这个词，但我对很多人、很多事都说过“爱”。我爱你的");
         if(get_player().hasCock())
         {
            outputText(get_player().multiCockDescriptLight());
         }
         if(get_player().hasVagina() && get_player().hasCock())
         {
            outputText("还有你的[chest]和你的[vagina]");
         }
         if(!get_player().hasCock() && get_player().hasVagina())
         {
            outputText("[vagina]和[chest]");
         }
         outputText("以及关于你的一切。但是……但这并不意味着什么。真的不意味着什么。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,705) == 1)
         {
            outputText("我以前说过我爱牛头人的鸡巴");
         }
         else
         {
            outputText("我说我爱牛头人的鸡巴");
         }
         outputText("，还有半人马，还有酒吧里那两个把我的两个洞都填满的狐狸混蛋，我爱啤酒、打架，还爱把我的尾巴塞进别人的屁眼。但那不是真正的爱，对吧？爱是——哦，天哪，我把这搞得一团糟。又来了。我总是这样；在我的脑子里，这总是进行得好得多。[sayend]");
         outputText("[pg][say: 我想我想说的是……我爱你，[name]。我真的，真的很爱你。不是那种虚假的、糟糕的、愚蠢的爱；不是我一时冲动说出来的。我已经考虑这件事有一段时间了。你对我太好了，[name]，比我应得的还要好。你救了我的家人，你给了我一个住的地方，还有比我很久以前在平原上袭击你时所能想象的更多的善意。]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,705) == 1)
         {
            outputText("[pg][say: 见鬼，自从你说你会照顾我的，你知道的，需求之后，我……我实际上没有和除了你之外的任何人在一起过，我甚至<i>不想</i>和任何人在一起。]");
         }
         outputText("[pg][say: 但那不是我想告诉你的。如果可以的话，我会把这件事藏在心里好几年，但有些事情改变了。我和我父亲谈过了，他说这很正常。他只是……只是轻笑了一下，摇了摇头，给了我一个心照不宣的眼神。但我还是很害怕，[name]。我无法独自处理这件事，但是……但是我必须知道，在我们继续之前：你也爱我吗？求你了，求你不要只是因为这是我想听的就说“是”。我保证如果你说“不”，我不会跑掉或者发脾气；我喜欢在我张开我那张愚蠢的大嘴之前我们之间的状态。那么，你怎么说，[name]？你爱我吗？]");
         menu();
         addButton(0,"是",yesHeliaILoveYourButtHoleReaming);
         addButton(1,"否",noYouDontLoveHeliaYouMonster);
      }
      
      public function heliaBirthtime() : void
      {
         clearOutput();
         spriteChooser();
         outputText("早晨像往常一样破晓，但当你穿衣服的时候，你忍不住注意到赫尔从营地边缘摇摇晃晃地走回来，双手紧紧地抓着她那绝对巨大的肚子。你走过去，正好听到她呻吟，[say: 哦，操我，叫我鹰身女妖吧，这破事真糟糕。]你用一只胳膊搂住她，稳住这个生病的蝾螈，但她几乎没有注意到你，她一屁股坐在她的蒸馏器旁边，差点抓起一个杯子，然后又停了下来。[say: 操操操，我受够了。我——哦天哪，]她弯下腰，挤压着她的肚子。[say: 哎哟哎哟哦天哪哎哟。]");
         outputText("[pg]你问赫尔她还好吗，这为你赢得了一声野兽般的咆哮和杀人的目光。片刻之后，当她再次弯下腰，被痛苦抓住时，她的目光柔和了下来。[say: 差不多是时候了，[name]。哦操，这疼得厉害。]");
         outputText("[pg]你跪在蝾螈身边，问她需要什么——你能做些什么？");
         outputText("[pg][say: 我——我不知道！] 赫尔哭喊着，向后靠在你身上，双腿张开。[say: 我他妈的不知道！只要——啊啊啊——握住我的手！]");
         outputText("[pg]你尽职尽责地握住赫莉娅的手，羊水从她双腿间涌出，预示着");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,958) == 0)
         {
            outputText("你的");
         }
         else
         {
            outputText("她的");
         }
         outputText("孩子的诞生。赫尔尖叫着、哭泣着，紧紧握住你的手，你感觉骨头都要被她铁钳般的抓握捏碎了；你试着告诉她用力，回想英格纳姆的接生婆在村里女孩分娩时会说的一切。这对尖叫的蝾螈来说似乎是个小小的安慰，但她照你说的做了，越来越用力地推，直到你能看到一个小婴儿的头顶从你爱人被撑开的阴道里挤出来。突然，伴随着一声响彻荒野的咆哮和一次大力的推挤，一个哇哇大哭的婴儿从赫尔的产道里滚落出来，落入你等待的怀抱中。");
         menu();
         addButton(0,"继续",heliaBirthEpilogue);
      }
      
      public function heliaBirthEpilogue() : void
      {
         clearOutput();
         spriteChooser();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,958) == 0)
         {
            outputText("一个健康的蝾螈宝宝咯咯笑着哭泣，你用毛巾把她裹起来，她用一双明亮的金色眼睛抬头看着你。赫尔接过你们的女儿，把你们的小宝贝抱在怀里，对着怀里的新生命咕咕叫着、笑着。[say: 哦，我的天哪，[name]，看……这是……这是我们的女儿。她有你的眼睛。我每天在你眼里看到的同样的眼神。哦，这个小家伙会长得又高又壮的。对吧？] 她笑着，揉了揉婴儿的脸颊。它发出一声高亢、欢快的小咕咕声作为回应，在赫尔的手指上蹭了蹭。");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,958) == 2)
         {
            outputText("不过，你抱在怀里的并不<b>完全</b>是一只蝾螈。你现在用毛巾裹着的小女孩看起来大部分像她的母亲，有着" + (get_noFur() ? "红色的鳞片四肢" : "全身红色的鳞片和苍白的皮肤，") + "和一条燃烧着明亮火焰的尾巴；但在她的头顶上，不是鳍状的爬行动物耳朵，而是一对活泼的、像小狗一样的耳朵。赫尔接过她的女儿，笑着挠了挠新生儿的耳后，逗得它咯咯直笑。[say: 哦，我的天哪，[name]，看……这是……这是我们的女儿。她有舞的耳朵，我的天。看看那个。哦，你长大后一定会很可爱的，对吧？] 她笑着，揉了揉婴儿的脸颊。它发出一声高亢、欢快的小咯咯笑声作为回应，在赫尔的手指上蹭了蹭。");
         }
         else
         {
            outputText("不过，你抱在怀里的并不<b>完全</b>是一只蝾螈。你用毛巾裹着的小女孩有着和她母亲一样的体型，" + (get_noFur() ? "四肢" : "身体") + "覆盖着皮革般的鳞片，还有一条燃烧着明亮火焰的尾巴……但她的鳞片是午夜般的黑色，和蜘蛛的甲壳颜色一样。小女孩用明亮的红眼睛抬头看着你，赫尔把她从你手中接过，笑着抚摸女儿黑色的鳞片。[say: 哇，这可真是一件奇妙的事，不是吗，[name]？一只黑鳞蝾螈……她真美。哦，你长大后一定会很漂亮的，对吧？] 她笑着，揉了揉婴儿的脸颊。它发出一声高亢、欢快的小咯咯笑声作为回应，在赫尔的手指上蹭了蹭。");
         }
         outputText("[pg]虽然还在为刚才的折磨喘着粗气，但当女儿试图吃她的手指时，赫尔的母性本能被激发了，她拉下鳞片状的上衣，露出她那饱满、充满乳汁的乳房。新生儿立刻含住，在吃第一顿饭时幸福地叹了口气。她的母亲也深有同感，她瘫倒在你的肩膀上，今天第一次轻松地呼吸。[say: 那真是……嘎啊。但是看……看看她。我的天，她太棒了。这么美……她很完美，[name]。而且她——哦，她咬得可真狠。哎哟。]");
         menu();
         addButton(0,"继续",nameDatHelspawn);
      }
      
      public function helSpawnsSetup() : void
      {
         var _loc1_:* = null as IMap;
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,957,50);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,958) == 2)
         {
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,957,FlagDict_Impl_.arrayReadInt(_loc1_,957) + 10);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,958) == 1)
         {
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,957,FlagDict_Impl_.arrayReadInt(_loc1_,957) - 10);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,958) == 0)
         {
            if(get_player().cor >= 66)
            {
               _loc1_ = KFLAGS.flags;
               FlagDict_Impl_.arrayWriteInt(_loc1_,957,FlagDict_Impl_.arrayReadInt(_loc1_,957) + 10);
            }
            if(get_player().cor <= 33)
            {
               _loc1_ = KFLAGS.flags;
               FlagDict_Impl_.arrayWriteInt(_loc1_,957,FlagDict_Impl_.arrayReadInt(_loc1_,957) - 10);
            }
         }
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,960,1);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,961,1);
         get_game().helScene.pregnancy.knockUpForce();
      }
      
      public function helSpawnsAppearanceScreen() : void
      {
         clearOutput();
         outputText("你的火蜥蜴女儿，[helspawn]，身高大约六英尺六英寸，皮肤苍白，有着浓密的");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,958) == 1)
         {
            outputText("甲壳黑");
         }
         else
         {
            outputText("亮红色");
         }
         outputText("鳞片，不过她有着正常人类的脸和躯干。一条长长的皮质尾巴在她身后愉快地甩动着，周围环绕着一层暗淡的火焰光环，散发着令人愉悦的热量，不过谢天谢地，摸起来并不烫，似乎无法伤害你。[helspawn]穿着");
         if(helspawnSlutty())
         {
            outputText("一件鳞片比基尼，就像她母亲的一样");
         }
         else
         {
            outputText("一条短裙，及大腿的靴子，还有一件天蓝色的衬衫，与她母亲更放荡的穿着形成鲜明对比");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,397) >= 1)
         {
            outputText("，脖子上围着一条颜色鲜艳的围巾");
         }
         outputText("。她有一张人类的脸，长着");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,958) == 0)
         {
            outputText("金色的");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,958) == 2)
         {
            outputText("亮绿色的");
         }
         else
         {
            outputText("深红色的");
         }
         outputText("眼睛，少女般的面容，脸颊上散布着一些淡红色的鳞片，就像雀斑一样。她那深红色的短发刚好剪到她的");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,958) == 2)
         {
            outputText("小狗");
         }
         else
         {
            outputText("爬行动物");
         }
         outputText("耳朵下面，上面装饰着一个漂亮的粉色蝴蝶结。她的臀部出奇的大，身后有一个又大又软的屁股。她那爬行动物的腿上覆盖着厚厚的深色鳞片，末端是短爪，下面是柔软的皮质脚底。");
         outputText("[pg][helspawn]有一对挺拔、盈盈一握的C罩杯乳房，每个乳房的顶端都有一个敏感的[if (metric) {一厘米长|半英寸长}]的乳头。");
         outputText("[pg]她的双腿之间有一个温暖、湿润、包容的小穴，与她丰满的臀瓣之间紧致的小屁眼相映成趣，一切都在它该在的地方。");
         menu();
         addButton(0,"继续",helspawnsMainMenu);
      }
      
      public function helSpawnSureMilkHerLater() : void
      {
         clearOutput();
         outputText("你轻笑一声，告诉她让可怜的女孩睡吧。以后会有很多奶的。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function helSpawnStopFucking() : void
      {
         clearOutput();
         spriteChooser();
         outputText("你叹了口气，从阴影中走出来，抓住那个女性化的小蜘蛛男孩的肩膀，把他从[helspawn]身边拽开。你[if (cor < 33) {坚定地|愤怒地}]问他们在干什么，皱着眉头");
         if(get_player().get_tallness() >= 90)
         {
            outputText("向上");
         }
         else if(get_player().get_tallness() <= 72)
         {
            outputText("向下");
         }
         outputText("看向你的女儿。[helspawn]发出一声尖锐的惊呼，从你身边滚开，试图尽可能地遮住自己；那个蜘蛛伪娘在你无情的抓握下扭动着，一双臂膀捂着他迅速萎缩的勃起，另一双臂膀则四处挥舞，试图把你从他身上弄开。想都别想。");
         outputText("[pg]你指责地指着[helspawn]，问她到底带了谁回家。");
         outputText("[pg][say: 那是，呃……亚历克斯，见见我的[dad]。" + championRef() + "，这是亚历克斯。]");
         outputText("[pg][say: 嗨、嗨。]那只蜘蛛[if (allowchild) {-小孩}]嘟囔着，他的声音又高又可爱，像个女孩子。");
         outputText("[pg]你语气坚定地告诉这个男孩，让他离你的女儿[b:远点]。");
         outputText("[pg][say: 可-可是我……]");
         outputText("[pg][say: " + championRef() + "...][helspawn]发出一声哀叹，而你一把抓住蜘蛛男孩，将他扔出了营地，像老鹰一样死死盯着他，直到他灰溜溜地逃回丛林。等他走远后，你叹了口气，走到[helspawn]身边，擦去她脸颊上的泪水。你搂住她的肩膀，语重心长地跟她讲了很久很久，告诉她不能做一个荡妇。");
         outputText("[pg][say: 可、可是妈妈……]");
         outputText("[pg]你告诉她，这就是为什么她不该带男人回家。女人也不行。其他任何东西都不行。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,962) == -1)
         {
            outputText("她不想像她母亲一样当个婊子，对吧？那个谁都能骑的女孩。");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,962) == 1)
         {
            outputText("你不会养出一个荡妇的。她母亲确实犯过错，但是……");
         }
         outputText("她没必要成为那样的人。她不应该把自己交给第一个提出要求的人——她应该把这留给真正关心她的人。你让她相信你的判断。");
         outputText("[pg]你又花了一点时间陪着这个被训斥过、希望现在变得更纯洁的蝾螈女孩，然后才让她上床睡觉。你抚摸着她的头发，溜回自己的铺位，希望她能把你所说的话铭记在心。");
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,957,FlagDict_Impl_.arrayReadInt(_loc1_,957) - 10);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function helSpawnSexMenu() : void
      {
         menu();
         if(get_silly())
         {
            addNextButton("马拉松",sexHelspawn).disableIf(!get_player().hasCock(),"这个场景需要你拥有阴茎。");
         }
         if(helspawnChaste())
         {
            addNextButton("做爱",helspawnLovemaking);
            addNextButton("骑脸",helspawnFacesitting).disableIf(!get_player().hasVagina(),"这个场景需要你拥有阴道。");
         }
         else
         {
            addNextButton("操她",helspawnSlutsex).hint("和你那不知羞耻的女儿找点乐子").sexButton(-1);
         }
         addNextButton("足交",helspawnFootjob).hint("让她用那双可爱的爬行动物的脚。").sexButton(-1);
         addButton(14,"返回",helspawnsMainMenu);
      }
      
      public function helSpawnPiggyback() : void
      {
         clearOutput();
         if(get_player().isTaur())
         {
            outputText("一起骑行了一段时间，有说有笑后，你坐下[legs]，让你的女孩们下来。赫莉娅拍了拍你的背，说道：[say:你撑起了这个家，字面意思！]");
            outputText("[pg][Helspawn]又叹了口气，走到你面前。[say:那太傻了……但让我很开心。我爱你，[dad]。]");
         }
         else
         {
            outputText("作为这座家庭塔骑行了一段时间，一路上欢声笑语，赫莉娅终于累坏了。[say:我现在筋疲力尽了！]她跪倒在地，你从这个可怜的女人身上下来，同时把[helspawn]从你身上放下来。");
            outputText("[pg]你的女儿深深地叹了口气。[say:那太蠢了……但让我很开心。我爱你们俩，]她说着，拥抱了你和赫莉娅。");
         }
         outputText("[pg]这是否意味着她以后还会想再来一次？");
         outputText("[pg][say:[Dad]，求你了，不要——]赫莉娅打断了她，插嘴道：[say:当然<b>要！</b>]");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function helSpawnMilkHerNow() : void
      {
         clearOutput();
         outputText("你告诉她，她不能[i:那么]轻易地逃避家务，并把她推向水池边缘。");
         outputText("[pg][helspawn]不服气地哼了一声，爬了下去，滑到底部，轻轻推了推[bathgirlname]。[say:来吧，小可爱，醒醒。该释放点压力了。]");
         outputText("[pg][bathgirlname]打了个大大的哈欠，跪起身来，揉了揉惺忪的睡眼");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,870) == 2)
         {
            outputText("，已经开始解开她的衬裙");
         }
         outputText("。 [say: 要吃奶吗？]她问道，将饱满的乳房转向[helspawn]。");
         if(helspawnSlutty())
         {
            outputText("[pg][say:求之不得！]蝾螈兴奋地笑着回答，靠进[bathgirlname]的怀里，用嘴唇含住她突出的乳头之一。[helspawn]像婴儿一样开始吸吮，喝下这位黑皮肤女仆似乎无穷无尽的乳汁，[bathgirlname]发出一阵愉悦的轻颤。");
         }
         else
         {
            outputText("[pg][say:抱歉，[bathgirlname]，你知道我不太喜欢那样。转过身坐好就行了，好吗？]伴随着一声叹息，[bathgirlname]按照要求做了，向后靠在[helspawn]的怀里。年轻的蝾螈开始工作，爪子轻轻抚摸着她突出的乳头，直到白色的乳汁喷涌而出，溅在她的膝盖上，黑皮肤的女仆发出一声愉悦的喘息。");
         }
         outputText("[pg]你看着她们俩，心想她们似乎相处得很好。有别人在身边帮忙控制[bathgirlname]的产奶量真好。可怜的家伙就是不停地分泌乳汁。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function helSpawnGraduation() : void
      {
         clearOutput();
         spriteChooser();
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,961,1);
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,960,FlagDict_Impl_.arrayReadInt(_loc1_,960) + 1);
         outputText("你被一声尖叫惊醒，声音尖锐而恐惧。你从床上跳起来，在铺盖卷里纠缠了一分钟，然后跌跌撞撞地走到赫尔和……[helspawn]身边？");
         outputText("[pg]当你看到那个");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,958) == 1)
         {
            outputText("黑色的");
         }
         else
         {
            outputText("红色的");
         }
         outputText("鳞片身影蜷缩在赫莉娅旁边时，你忍不住多看了一眼；赫尔自己也睁大眼睛低头看着她胸前那个昏昏欲睡的身影，她才刚刚睁开眼睛。[say: 你-你……你太大了！]赫尔喘着气说，把自己推开，远离她的女儿。");
         outputText("[pg][say: 妈妈？]女孩揉着太阳穴问道。当她坐起来时，你可以看到自从你昨晚把她放在床上后，她呈指数级增长：她将近六英尺高，头发垂成柔滑的长发，一直垂到她光秃秃的屁股上。她的身材丰满了，一对发育中的乳房和宽阔的臀部展现在她女性化的身体上。在体型和身材方面，她很容易与你家乡的任何十几岁的女孩相媲美，现在看起来大概十五六岁。");
         outputText("[pg][say: 呃，怎么了？][helspawn]呻吟着，抬头看着赫尔，然后看着你。[say: " + championRef() + "，妈妈为什么尖叫？]");
         outputText("[pg][say: 哦，我的天哪，你是个巨人！]赫尔喋喋不休地说，把膝盖蜷缩到胸前。[say: 什-什-什么……我的小女孩……怎么了？]");
         outputText("[pg]你不得不承认，这种变化是突然而剧烈的……但女孩的鳞片，她的眼睛，它们肯定是[helspawn]的。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,958) == 2)
         {
            outputText("而那双如今更像狼的幼犬耳朵，更是确凿的证据。这是她独一无二的特征。");
         }
         outputText("你在明显感到困惑的女孩身边坐下，抚摸着她的头发，告诉她没事的，她妈妈只是吓了一跳罢了。");
         outputText("[pg][say: 是我呀，妈妈，][helspawn]说着，滑坐到她母亲身边，而赫尔仍然震惊得睁大了眼睛。你的女儿试着和赫尔说了几句话，但看到这毫无结果——赫尔似乎完全失去了知觉，被震惊得瘫痪了——她转而蜷缩回母亲身边，头靠在赫莉娅的肩膀上。最终，赫尔小心翼翼地伸出一只颤抖的手，抚摸着女儿的脸颊。");
         outputText("[pg][say: 天哪，她长得太快了……我不想这么快就失去她。我想要我的宝宝回来。]");
         outputText("[pg]你捧着赫尔的脸颊，坐在她身边，紧紧抱住你的爱人。她的女儿在她身边打着瞌睡，显然是因为在你睡觉时经历了巨大的生长突增而精疲力竭。");
         outputText("[pg]看来你现在有了一个十几岁的孩子。一个睁大眼睛、容易受影响的年轻人。你只能希望在现在这个关键时刻，你在抚养她时能做出正确的选择……");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function helSpawnChoosesAFightingStyle() : void
      {
         clearOutput();
         spriteChooser();
         outputText("当你走回营地时，你开始听到前方传来战斗的声音。你准备好你的[weapon]，加快步伐，直到营地映入眼帘。你放松下来，看到只有[helspawn]和她的母亲。赫莉娅站在营地中心附近，");
         if(get_camp().companionsCount() > 3)
         {
            outputText("显然目前已经把你的其他大多数追随者都赶走了，");
         }
         outputText("她的剑在自己和一个训练假人之间摆出防御姿势。[helspawn]站在她母亲身后几英尺的地方，全神贯注地看着赫尔绕着假人踱步，大口喘着粗气。");
         outputText("[pg]突然，高大的蝾螈发出一声震耳欲聋的战吼并向前猛扑，像一头发疯的公牛一样几乎把假人撞倒，然后挥舞着她的弯刀，发出一连串粉碎性的打击，把假人的碎片打得四处飞溅。当赫尔终于停下来时，假人已经没剩下多少了，她瘫倒在倒下的假人身上，气喘吁吁，完全喘不过气来。");
         outputText("[pg][say: 好了，让我……让我去把这些，呃，碎片捡起来，然后你来试试，亲爱的，] 赫尔说着，捡起假人被砍断的手臂。");
         outputText("[pg][say: 嗨，" + championRef() + "，] 当你走过去检查这场大屠杀时，[helspawn]欢快地说。[say: 妈妈在教我怎么当一个狂战士。]");
         outputText("[pg]赫尔暗自轻笑，[say: 是的。不过可能需要一个新的假人了。它们，呃，存活率似乎很低……嘿，我的爱人，你能借我点钱吗？镇上的一个朋友找到了一把和我一样的剑，我很想让[helspawn]拥有它。不过我现在手头有点紧。老爸的地方漏水了，必须得修好。]");
         outputText("[pg]好吧。你觉得你可以借给赫尔一笔钱，让小[helspawn]像她亲爱的老妈一样，成长为一个狂暴的蝾螈狂战士。或者，如果你有时间，你也可以亲自对她进行战斗训练。你可能无法完全消除蝾螈的暴脾气，但和你一起在竞技场里待上几个小时，肯定能让她不那么肆无忌惮地鲁莽——如果赫尔愿意留下来，她也能从中受益。");
         if(get_player().masteryLevel(MasteryLib.Bow) >= 4)
         {
            outputText("[pg]话又说回来，虽然小蝾螈需要能够保护自己，但给她一种更具防御性的武器可能会更好。你村子里的守卫称弓为智者的武器，因为弓箭手坐在防线后面或高墙上，就能干掉敌人。虽然你在家乡没有接受过弓箭训练，但在这里的这段时间里，你的弓术已经变得相当不错了。也许是时候把这些技能传授给[helspawn]了。");
         }
         menu();
         if(get_player().masteryLevel(MasteryLib.Bow) >= 4)
         {
            addButton(2,"弓",snipermanders);
         }
         addButton(0,"你来训练",swordAndBoardmander);
         addButton(1,"借钱",dasBarbarimander);
      }
      
      public function helSpawnBoyfriend() : void
      {
         clearOutput();
         outputText("最大的问题是保密，所以首先，你应该更多地了解她刚刚萌芽的恋情。");
         outputText("[pg][say: 亚历克斯？] [helspawn]问道，眼睛亮了起来。[say: 我是在去特尔阿德雷的路上遇到他的。妈妈当时停下来，呃，处理几个流浪女巫，结果我就走散了……] 她说着，开始讲述她遇到那个女性化的蜘蛛男孩的故事，当时她的体型还比较接近他，以及那段最终让他们在半夜咯咯笑着回到营地的旋风般的浪漫。这是典型的青少年谈话，[if (ischild) {就像英格纳姆的任何一个青少年会说的那样|但随后，[if (iselder) {你也回想起了那些久远的岁月|你[if (isTeen) {自己也才刚过那个年纪，如果真的过了的话|现在看起来也不比她大多少，你还记得在家里你本可以做同样事情的日子}]}]}]。当她讲述他们的初吻时，你咧嘴笑了，并注意到她脸颊上明亮的红晕。[if (!helspawnchaste) { 她谈论接吻的方式比她之前那些大胆的触摸和调情要害羞得多，这很迷人。}]");
         outputText("[pg]" + (FlagDict_Impl_.arrayReadBool(KFLAGS.flags,3000) ? "[say: 他似乎也很喜欢你，即使你确实吓到他了……] " : "") + "也许她毕竟应该继续见这个男孩。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      override public function helPregnant() : Boolean
      {
         return get_game().helScene.pregnancy.get_isPregnant();
      }
      
      public function helGotKnockedUp() : void
      {
         spriteChooser();
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,965,2);
         outputText("[pg]<b>在昨晚和赫莉娅做出决定后，</b>你决定去看看你那欲火焚身的蝾螈。你发现她坐在营地她那边的石头上，双膝紧抱在胸前，似乎在沉思。她给了你一个");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,958) == 2)
         {
            outputText("温暖的");
         }
         else
         {
            outputText("苍白的");
         }
         outputText("当你走近时，她微笑着挪了挪身子，让你坐在她旁边。她似乎有些心不在焉，但还是很快用尾巴缠住你的腰，将你紧紧抱在怀里。");
         outputText("[pg]安静了几分钟后，你终于开口问道：[say: 事情进展得怎么样？]");
         outputText("[pg][say: 嗯……只能说成功了。除非你想听听细节？]她神秘兮兮地问道。");
         menu();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,958) == 2)
         {
            addButton(0,"当然",sureHelGimmeMaiDetails);
            addButton(1,"不用了",dontTellMeAboutMai);
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,958) == 1)
         {
            addButton(0,"当然",sureHelGimmeSpidahBoyDetails);
            addButton(1,"不用了",dontTellMeAboutSpiderboy);
         }
      }
      
      public function haveAKid() : void
      {
         clearOutput();
         spriteChooser();
         get_game().helScene.pregnancy.knockUpForce(25,336);
         outputText("你告诉赫尔你和她是一条心，你想给她那个她似乎非常渴望的孩子。她对你眉开眼笑，笑容满面，然后跳进你的怀里，把她的嘴唇紧紧地贴在你的嘴唇上。你回吻她，双臂环绕着她的臀部支撑着她，她有力的双腿缠绕在你的腰上；你把她推到废墟的墙上，双手在她紧绷、滚烫的肉体上摸索，直到你把她的比基尼上衣扔到一边，让她丰满的双乳重获自由。[say: 哦，天哪，是的，]她呻吟着，你的吻从她的嘴唇，顺着她的脖子，一直吻到她变硬的乳头。[say: 我太想要这个了，比什么都想。给我，[name]。不要克制！]你的手指陷入她柔软的肉体，你吸吮着她暴露的乳头，抚摸着她另一个乳房和柔软的屁股，她在你怀里呻吟扭动。赫尔的爪子笨拙地顺着你的身体刷下，剥掉你的[armor]，直到你的[cock]掉进她的腿上。她用长满鳞片的手指锁住你的男子气概，粗鲁地抚摸着你，直到你在她的抓握下硬得像钻石一样。");
         outputText("[pg]当她的手指抚摸你的" + get_player().cockDescript(0) + "时，你浑身发抖，但你这边一刻也没有放松。你用牙齿刷过并揉捏赫尔的乳头，让你的手滑向她宽阔的臀部和好摸的屁股，慢慢地剥去她的鳞片下装，把它从她的腿上拉下来。随着你的爱人赤身裸体，你滑到她的双腿之间，让她把双腿挂在你的肩膀上，让你能清楚地看到她滴水的阴户。你的舌头舔过她的阴唇，引得赫尔发出一声长长、淫荡的呻吟。她的手指穿过你的[hair]，催促你继续；伴随着她充满欲望的呻吟，你深入其中，吸吮着她突出的阴蒂，并将你的舌头钻进她的内褶之间。当赫尔长长的尾巴缠绕在你的肩膀上时，你对着她喘息，苍白的火焰在你的[skinfurscales]上令人舒缓地温暖，她皮革般的附肢顺着悬挂在你[legs]之间的[cock]向下移动。当她尾巴的尖端刷过你最敏感的肉体，挠痒痒时，你因为突然的需要而呻吟");
         if(get_player().balls > 0)
         {
            outputText("你的[balls]");
         }
         else
         {
            outputText("你的肉棒根部");
         }
         outputText("随后以蛇一般的灵巧盘绕在你的肉棒上。她的尾巴收缩挤压，在你的[cock]上起伏，直到最后从你的" + get_player().cockHead() + "上按摩出一大团浓稠的预精，滴落下来弄脏了荒地的地面。");
         outputText("[pg]突然，赫莉娅抓住你的肩膀，把你推倒。你仰面躺下，被尾巴包裹的肉棒像旗杆一样笔直地竖起，赫尔跨坐在你的[hips]上，一边用力地用手指抠弄自己，一边用尾巴将你的肉棒对准她流着淫水的私处。当你的" + get_player().cockHead() + "擦过她滚烫的汁液时，你屏住了呼吸，随着她顺着你的肉棒滑下，你的进入变得顺滑。你抓住赫尔宽阔的臀部，引导她进入，让她将你的[cock]包裹在她体内翻滚的炼狱中。当她下降时，她的尾巴从你跳动的肉棒上解开，慢得令人心痒难耐；她花了将近一分钟的时间，才让她的下体与你的舒适地结合在一起，她饥渴的小穴亲吻着你充满欲望的肉棒的根部。");
         outputText("[pg]赫尔被你完全贯穿，她的胸膛因欲望和渴求而起伏。她托起其中一个巨大的肉球，用两根深红色的手指挤压着她挺立的乳头，而她的另一只手");
         if(get_player().biggestTitSize() <= 2)
         {
            outputText("支撑着她，压在你的[chest]上");
         }
         else
         {
            outputText("抚摸着你的一侧乳房，揉捏着你柔软的胸部，你在她身下扭动，无法抑制住你愉悦的喘息");
         }
         outputText("。慢慢地，你的蝾螈恋人开始在你的[cock]上磨蹭她的臀部，随着她臀部的每一次移动，她的肌肉收缩并挤压着她体内坚硬的肉棒。你们俩都大声呻吟，半沉浸在愉悦的迷雾中。[say: 天哪，我真希望我能永远这样，]赫尔低声说道，声音小得几乎听不见。[say: 没有人比你更让我愿意在一起了，[name]。没有人比你更让我愿意给我身体渴望的孩子。]");
         outputText("[pg]赫尔声音里的一些东西让你停顿了一下，但还没等你多想，她就把手牢牢地按在你的[chest]上，开始起身，将你的肉棒[if (metric) {一厘米一厘米|一英寸一英寸}]地从她体内拔出，直到只有" + get_player().cockHead() + "还在她体内，在她阴唇上抹上浓稠的乳白色预精。然后，赫尔对你咧嘴一笑，猛地坐了回去，以一次粗暴的抽插将你吞没，让你们俩都呻吟起来；片刻之后，她骑在你的肉棒上，在坚硬的柱子上快速弹跳，以至于你们混合的汁液四处飞溅，浸透了你们周围贫瘠的土地。赫莉娅不顾一切地操着你，随着她的哭喊和呻吟，她的声音越来越高。抚摸着你的[chest]，爱抚着自己，用尾巴尖挑逗着你的[asshole]，赫尔似乎失去了所有的克制，一次又一次地吞吐着你的肉棒，退化到她最基本的性本能，像动物一样发情，直到你确信明天早上醒来时会浑身淤青。");
         outputText("[pg]你躺下来，享受了几分钟粗暴的性爱，最后抓住她的手，在她移动时紧紧握住，将你的手指与她的手指锁在一起，把她拉下来，进行了一个漫长的、充满舌头的吻。你们俩就这样待了很长时间，当你们用双臂环绕着恋人的腰时，你们的呼吸在彼此的皮肤上发烫；令你惊讶的是，赫尔从你身边倾斜开，刚好足够拉下她马尾辫上的发带，让她浓郁的红发像瀑布一样倾泻在你周围，当她再次吻你时，遮住了你们的脸。你用手指穿过她浓密的头发，呼吸着她火热的气息，品尝着她甜美的嘴唇，感受着她最深处顺应着你的播种棒。紧紧抱住赫尔，你带着你们俩翻滚，脸颊依偎在她乳沟的缝隙中。当你用舌头舔过她柔软多汁的乳房时，她喘息着，轻轻地将你的[cock]插入她体内。赫尔仰面躺下，为你张开双腿，让你滑进去，她的脚跟勾在你的[butt]后面，她的手抓进你的背部来引导你的动作。不到五次抽插，她就像发情的母狗一样呻吟，在你身下扭动。她抓你的背，让你痛得皱眉——并喷出一团预精到她渴望的洞里。");
         outputText("[pg]你咬紧牙关，开始像活塞一样在她体内抽插，加快速度，直到你的每一次抽插都让这只充满欲望的蝾螈向着天空尖叫你的名字。在赫尔狂喜的叫喊声和她对你[cock]老虎钳般的紧握的刺激下，没过多久，你就能感觉到你[balls]内不可避免的释放的压力在疯狂地增加。");
         if(get_player().ass.analLooseness > 0)
         {
            outputText("[pg]在对你恋人粗暴的抽插之间，你能感觉到她发出微弱光芒的尾巴像蛇一样缠绕在你的[legs]上，细长的尖端刷过你[butt]的脸颊。当它压入你紧闭的后门，用试探性的刺戳和在边缘的轻弹挑逗你的[asshole]时，你忍不住喘息。当你的括约肌终于放松，让最初的[if (metric) {十几厘米|几英寸}]滑入，在你的肛门通道中起伏时，赫莉娅抬头对你咧嘴一笑。[say: 我要把你最后一滴精液都榨干，]她沙哑地低语，呼吸在你脖子上发烫。你呻吟着回应，她不断变粗的附肢蠕动进你体内，随着你自己的[cock]插入你恋人小穴的节奏穿透你。突然，一阵强烈的快感爆发，威胁着要淹没你，需要你用尽每一分意志力才能忍住不当场射精。当你喘息时，赫尔鼓励地咕哝着，很高兴找到了你最敏感的地方。既然她找到了，赫尔就让她的尾巴在你的屁股里狂野起来，尖端敲打着你的前列腺，而较粗的主干在你被撑开的洞里扭动和蠕动。");
         }
         outputText("[pg]你给了赫尔最后几次抽插，尽你最大的努力把高潮憋到最后一分钟。但她从不松懈，挺起臀部，挤压你的肉棒，催促你继续前进，直到伴随着一声爆炸性的咆哮，你释放了，将你滚烫的精液射入她更热的深处。赫尔向后仰起头尖叫，[say: 天哪，是的！给我，[name]。你敢保留任何东西！]确实，你没有；你的肉棒射出一团又一团粘稠的强效种子，用精液涂满她的子宫，直到它从她被操透的小穴里流出来。伴随着最后一声疲惫的喘息，你跳动的肉棒射出最后一次喷射，最后一点咸咸的精液填满了她渴望的洞，然后你瘫倒在你的恋人身上，在她乳沟的深谷中喘息，她的手臂和腿环绕着你，紧紧抱住你，而你在她体内疲软。");
         outputText("[pg][say: 哦，[name]，]她呻吟着，吻着你，");
         if(get_player().get_pregnancyIncubation() > 0)
         {
            outputText("[say: 我们要当妈妈了！]");
         }
         else
         {
            outputText("[say: 你要当爸爸了……而我要当妈妈了！]");
         }
         outputText("你正要回答，突然被倒立过来，仰面躺下，赫莉娅趴在你身上，手指刷过埋在她双腿之间的肉棒。[say: 哦，别以为你能这么容易逃脱，我的爱人……我的爱。我必须确保你的种子生根发芽，而且……那要花上一整夜的时间。]");
         outputText("[pg]你咽了口唾沫，当赫尔开始在你饱受摧残的肉棒上移动时，你皱起了眉头——而且这不是这个不眠之夜的最后一次！");
         get_player().orgasm("Dick");
         get_helFollower().saveContent.lastTimeSex = get_game().time.days;
         menu();
         addButton(0,"继续",HaveAHellKidPartII);
         get_game().time.hours = 6;
         var _temp_1:* = get_game().time;
         _temp_1.days = _temp_1.days + 1;
      }
      
      public function hakonAndKiriComeVisit() : void
      {
         clearOutput();
         spriteChooser();
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,975,1);
         outputText("当你回到营地时，你注意到赫莉娅像无头苍蝇一样跑来跑去，对她营地里几乎所有的东西都大惊小怪");
         if(get_camp().companionsCount() > 1)
         {
            outputText("还有其他人的也是，这让他们很懊恼");
         }
         outputText("。当她偷偷摸摸地擦拭她巨大的蒸馏器，试图让那个破旧的老东西发光时，你走近并清了清嗓子。她发出一声尖锐的叫声，转过身来，但当她看到只是你时，似乎放松了下来。");
         outputText("[pg][say: 嘿-嘿，[name]，]她紧张地说。[say: 正好。我正要去找你。呃，所以……]");
         outputText("[pg]你问她发生了什么事。");
         outputText("[pg][say: 老爸和奇里要来了，而这个地方简直是个垃圾场！就像一阵他妈的龙卷风刚刚刮过一样。]");
         outputText("[pg]你指出它一直都是这个样子，指着赫尔吊床周围的碎片区域，其中大部分刚刚被推到了她的斗篷下面。");
         outputText("[pg][say: 嗯，是的，[b:我]喜欢住在垃圾堆里，但那是我爸爸和姐姐，我不想让他们认为我像发情的动物一样生活，你知道吗？]");
         outputText("[pg]你考虑反驳这一点，但很快手里就被塞了一块洗脸巾，然后赫尔冲去修理营地里的其他小瑕疵。你叹了口气，但稍微整理一下也无妨。不过，你应该用一块布对一个开放的营地做什么，你不知道。拖地吗？");
         outputText("[pg]这无关紧要，因为几分钟后，你听到营地边缘传来一声毫不掩饰的欢呼声，转头看到[helspawn]跑去迎接两个走过来的人影。当赫尔的父亲将他的孙女抱进一个大大的熊抱中，用他有力的双臂将这个混血蝾螈举离地面时，你挥了挥手。[helspawn]高兴地尖叫着，因为她几乎是被抬进营地的，直到哈康把她放下并拥抱了她的母亲，在赫尔还没来得及说完你好之前就把她拉进了一个紧紧的拥抱中。");
         outputText("[pg][say: 嗨，[name]，]奇里说着，扑腾着翅膀飞过来，在你脸颊上啄了一下。[say: 好久不见。]");
         outputText("[pg][say: 没错。握个手吧，" + get_player().mf("小伙子","姑娘") + "，]哈康说着，向你伸出一只手，咧嘴大笑，松开了他的女儿和孙女。你握住老蝾螈的手，他那强有力的握力几乎要把你的手腕捏碎，你疼得差点倒吸一口凉气，他几乎是拉着你走回了营地中心。");
         outputText("[pg]哈康转向[helspawn]，自豪地笑了。[say: 诸神与恶魔啊，丫头，你长大了！你们俩平时都给她喂什么了，嗯？]");
         outputText("[pg][say: 你应该看看她有多强壮！]赫尔咧嘴一笑。[say: 去吧，[helspawn]，给这老鳞片看看你的本事。]");
         outputText("[pg][say: 老鳞片！？我让你见识见识什么叫老，你个小兔崽子。来吧，打我！]哈康话音刚落，[helspawn]就一拳打在他胸口，直接把他打得一屁股坐在地上。他闷哼一声向后倒去，摇着头苦笑。[say: 哈！也许这些鳞片真的老了。不过，这小家伙将来绝对是个出色的战士。改天应该带她和我们一起去打猎。你觉得呢，孩子？]");
         outputText("[pg][saystart]好啊！");
         if(FlagDict_Impl_.arrayReadString(KFLAGS.flags,959) == "scimitar and shield")
         {
            outputText(championRef() + "一直在教我怎么战斗。");
         }
         else
         {
            outputText("妈妈一直在教我怎么战斗。");
         }
         outputText("我现在还不如妈妈和[dad]厉害，但我很想一起去。[sayend]");
         outputText("[pg][say: 这就对了。现在我们只要说服你奇里阿姨一起去就行了。还有[name]也是。]");
         outputText("[pg][say: 我……我不喜欢打架。尤其是“打猎”。那些可怜的豺狼人，]奇里避开父亲的目光说道。");
         outputText("[pg][say: 哎呀，你真没劲，]赫尔打趣道，轻轻捶了一下半鹰身女妖的肩膀，然后转向你。[say: 你觉得呢，我的爱人？想不想找个时间和你最喜欢的三只蝾螈一起去打猎？]");
         menu();
         addButton(0,"好啊",goHuntingBitches);
         addButton(1,"还是算了",noHuntingBitches);
      }
      
      public function growingDicks4Hel() : void
      {
         clearOutput();
         spriteChooser();
         outputText("你告诉赫尔给你一点时间，你会去找点东西长出鸡巴来满足她。");
         outputText("[pg][say: 谢谢你！太感谢你了，[name]。我真的、真的很希望这是我们的孩子。我会等的，但你要快点。我不知道我还能忍受这种……这种渴望多久！]");
         outputText("[pg]当你和赫尔谈完后，她用渴望的眼神看着你走回营地。最终，你设法重新入睡……");
         doNext(playerMenu);
      }
      
      public function goHuntingBitches() : void
      {
         clearOutput();
         spriteChooser();
         outputText("你表示同意，很快就赢得了哈康和赫莉娅赞许的点头。");
         outputText("[pg][say: 对豺狼人绝不留情！对吧，亲爱的？]赫尔大喊着，抓起一杯麦酒举在空中。");
         outputText("[pg]事情定下来后，你坐了下来，赫尔分发了一些对她家人来说应该算是晚餐的东西——主要是酒和口粮——很快你就和这吵闹的一家人一起享受了一顿美餐，听着赫尔的荤段子或哈康的陈年战争故事哈哈大笑。");
         get_player().refillHunger(30,false);
         outputText("最后，哈康和奇里离开了，但在离开前他们承诺下次去猎杀豺狼人时会来找你和你的家人。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function get_helspawnName() : String
      {
         return FlagDict_Impl_.arrayReadString(KFLAGS.flags,956);
      }
      
      public function get_debugName() : String
      {
         if(get_helspawnName() != "")
         {
            return get_helspawnName();
         }
         return "赫尔斯彭";
      }
      
      public function get_debugHint() : String
      {
         return "";
      }
      
      public function getAnotherDad() : void
      {
         clearOutput();
         spriteChooser();
         if(!get_player().hasCock())
         {
            outputText("你告诉赫莉娅你很乐意和她共同抚养一个孩子，但你没有……合适的装备来完成这项任务。[saystart]没关系！我能……我能等一会儿。我-我是说，如果你想去长一个的话。如果不去，那我们可以找个有鸡巴的人。");
            if(get_game().telAdre.isAllowedInto())
            {
               outputText("酒吧里有米可和舞。舞说过她想要个孩子，但没法照顾……她可能会愿意操我让我怀孕！如果那不行，那……让我想想。");
            }
            outputText("呃，也许不要牛头人……他们总是生出更多的牛头人，我可不想从我的小穴里钻出一头牛来。呃，也许我可以去沼泽里找个蜘蛛男孩，然后骑到</i>他的<i>鸡巴上。他们挺可爱的，对吧？不过不知道那会对孩子有什么影响。也许他会长出额外的眼睛，或者甲壳？不过，总比小恶魔或者什么鬼东西好。你觉得呢？想长根鸡巴，还是把让我怀孕的事交给别人？[sayend]");
         }
         else
         {
            outputText("[say: 什-什么？]赫尔挑起一根眉毛说道。[saystart]你确定吗，[name]？如-如果你不想当爸爸，我想我能理解。但为什么？难道我不……不，算了。我不想知道。好吧，呃，我们可以找个有鸡巴的人。");
            if(get_game().telAdre.isAllowedInto())
            {
               outputText("酒吧里有米可和舞。舞说过她想要个孩子，但没法照顾……她可能会愿意操我让我怀孕！如果那不行，那……让我想想。");
            }
            outputText("呃，也许不是牛头人……他们总是生出更多的牛头人，我可不想从我的小穴里钻出一头牛来。呃，也许我可以去沼泽里找个蜘蛛男孩，然后骑到</i>他的<i>鸡巴上。他们挺可爱的，对吧？不过不知道那会对孩子有什么影响。也许他会长出多余的眼睛，或者甲壳？不过，总比小恶魔或者其他什么鬼东西好。你觉得呢？[sayend]");
         }
         menu();
         if(get_game().telAdre.isAllowedInto())
         {
            addButton(0,"舞",maiWouldBeTheBestInseminator);
         }
         addButton(1,"蜘蛛男孩",spiderboyWouldBeBestDad);
         if(get_player().hasCockThatFits(get_helFollower().heliaCapacity()))
         {
            addButton(2,"我来",haveAKid);
         }
         else if(!get_player().hasCock())
         {
            addButton(2,"我来",growingDicks4Hel);
         }
         addButton(3,"不要/以后再说",noKidsHel);
      }
      
      public function encourageSlutspawnSexHarder() : void
      {
         clearOutput();
         if(!get_player().hasCock())
         {
            outputText("[if (!isnaked) {你笨手笨脚地急忙脱下衣服，渴望与你那醉醺醺、欲火焚身的女儿肌肤相亲[if (!hasplainskin) {——[skinfurscales]相亲？[if (hasscales) { 鳞片相亲？}]——| }]。}][Helspawn]晕乎乎的目光顺着你[if (thickness > 75) {[if (tone > 75) {魁梧有力的|[if (tone > 50) {强壮的|[if (femininity > 50) {丰满的|肥胖的}]}]}]身躯|[if (thickness > 40) {[if (tone > 75) {肌肉发达的|[if (tone > 50) {结实的}]}]体格|[if (thickness > 10) {[if (tone > 75) {健壮的|[if (tone > 50) {匀称的|苗条迷人的}]}]体格|[if (tone > 50) {极其轻盈的|[if (tone > 20) {极其瘦弱的|[if (height < 60) {娇小、}]骨瘦如柴的}]}]身躯}]}]}]往下看，当她如此近距离地看着[father]赤裸的身体时，脸上泛起了红晕。[if (!tailLeg) { [if (isgoo) {你毫无顾忌地向前挺进，闪闪发光的[skintone]凝胶以迷人的方式泛起涟漪，你穿过[helspawn]的腿，让它紧贴着你的[pussy]|你把腿跨过[helspawn]的腿，让你的重量把你的[pussy]压在她的腿上}]。}]");
            if(get_player().hasTailInsteadOfLegs())
            {
               outputText("[pg]你晕乎乎地将骨盆顶向女儿的骨盆，却怎么也找不到能让自己满足的节奏。当[helspawn]承受着你的抽插时，她脑海中灵光一闪，将你推倒，跨坐在你[if (isNaga) {蛇一般|长长}]的身体上。[say:我知道……该怎么做了，]她说道。她的身体前倾，尾巴滑入双腿之间，很快就被[father]和女儿湿滑的阴唇夹紧。现在轮到她来主导，让你们俩都获得快感，她骑在那条粗壮、坚韧的尾巴上，几乎像是在出神。也许在你没注意的时候，她学会了这样自慰。你让自己躺下享受这一切，发现你无法挑剔她的方法；她温暖的附肢那湿润而凹凸不平的质感，在你的蛇类泄殖腔那滚烫的三角区摩擦，感觉美妙极了。当[helspawn]转动臀部，抓住她的尾巴，开始在你的阴蒂之间抽插时，刺激的强度骤增。这让你感到灼热，让你整个[if (isNaga) {蛇|鱼|尾巴状}]的下半身在情欲的折磨中扭动。幸运的是，这只气喘吁吁的蝾螈并没有持续太久，她向后靠去，继续像之前那样动作。");
               outputText("[pg][say:一起做这个……感觉好不、不一样，[daddy]，]她勉强说道。然后她闭上眼睛，凑近与你接吻，双唇紧贴，而她的尾巴不由自主地在你的[if (tone > 50) {腹肌|[if (thickness > 25) {肚子|胃部}]}]上摇摆。她的臀部前后摇晃，速度越来越快，用她的鳞片将你饥渴的三角区磨得生疼。[Helspawn]坐起身，幸福地叹了口气。看着她健美、近乎成年的赤裸身体骑在你身上，你下意识地摆动长长的身体去拥抱她。她在[if (isNaga) {蛇一般的缠绕|全身的紧抓}]中发出愉悦的呻吟。感觉到她跳动的心脏贴着你的下半身，重新激发了你的性欲，突然驱使你粗暴地将她按倒。[say:啊，你在做什——]你用一个热烈的吻打断了她，你的[tongue]在探索她口腔的同时让她安静下来。她的双腿缠绕着你，对你来说，这足以作为她同意的证明。你的[hips]无法像你双足行走的女儿那样轻松自如地前后滚动，但即使[if (isNaga) {被缠绕和}]被按住，她也没有让你一个人出力；她的骨盆和尾巴都在继续移动。");
               outputText("[pg]所有的感觉和酒精带来的抑制力减退让你喘息起来。你刚才那短暂的冲动很快就变成了高潮释放中笨拙的抓挠和摩擦。你的女儿也僵硬了身体，大声叫喊。[say:[Daddy]——！]她语无伦次地喘息着[if (isNaga){，然后继续说道。[say:我喘不过气了！]}]");
               outputText("[pg][if (isNaga) {你没有意识到你在高潮时紧紧缠绕着她，当你放松下来时，[helspawn]感激地松了一口气。在更传统的拥抱中，你安慰地抱着她，并得到她安然无恙的保证。}][say:我现在知道妈妈为什么喜欢做爱和喝酒了……]你们俩终于休息了，闭上眼睛，希望无论需要多久都能醒酒。");
            }
            else
            {
               outputText("[pg]现在你们紧紧相拥，你用[if (isgoo) {大量的黏液|你自己的大腿}]抚摸她的阴户，在你拥抱她、完全交缠在一起时，听到她发出甜蜜的赞许呻吟。你的女儿用她强壮的手臂紧紧抱着你，仿佛不久前她还不是[if (ischild) {像你一样年轻[if (height<72) {和矮小}]|一个孩子}]。当然，增长的不仅仅是她的体型，她四肢和臀部焦躁不安的摩擦也证明了这一点。她的小穴[if (isgoo) {与你的黏液亲密混合，让你几乎能尝到她情欲的味道|润滑了你的[skinfurscales]}]。你们共同的性饥渴让你像抱着[if (isunderage) {女朋友|情人}]而不是女儿一样，抱着这个喝醉的青少年。");
               outputText("[pg][Helspawn]的舌头探入你的口中，湿润的双唇紧贴着你的。作为回应，你的[tongue]也探索着她的，你们似乎都醉得顾不上这笨拙的技巧了。她伴随着一声呻吟退开。看着你的眼睛，她脸上的红晕加深了。[say:我真的很喜欢[if (!helspawnvirgin) {做你的小女孩|这样}]，[Daddy]。]她的话语轻柔，当你再次吻上她时，她的眼睛缓缓闭上。皮革般的鳞片抚摸着你的背。[Helspawn]的尾巴缠绕着你[if (hastail) {的尾巴}]；紧接着，她开始在紧贴着她小穴的[if (isgoo) {凝胶状粘液|腿}]上摩擦。对于缓慢、[if (silly) {百合般的磨豆腐|温柔的性爱}]，[if (isteen) {像你这样好色的青少年|像她这样好色的青少年}]的忍耐力是有限的，你们俩都忍不住更用力、更快地扭动起来。");
               outputText("[pg]你的[clit]浸透了你们俩的体液，随着你女儿大腿的每一次摩擦而跳动。你在体内颤抖着，紧紧抱住[helspawn]，绝望地喘息着，试图让她和你同时达到高潮。她的嘴巴空了出来，展现出同样的高潮快感。[say:我要去——]她用尾巴猛拉你时差点脱口而出。尽管肌肉痉挛，但她还没有结束。[say:我要去了！]");
               outputText("[pg]同样被快感淹没的你，放开了所有的克制，呻吟到肺里的空气耗尽，将自己投入到高潮的阵痛中。你的女儿在将爱液喷涌[if (isgoo) {进你体内|到你身上}]之前，几乎要在怀里把你挤碎。她喘着粗气说，[say:我现在知道妈妈为什么喜欢做爱和喝酒了……]性欲得到释放后，你沐浴在余韵中，渐渐睡去，希望这一觉能睡到酒醒。");
            }
         }
         else
         {
            outputText("[if (!isnaked) {你[armor]里的凸起现在变得非常不舒服。你急忙解开下装，释放了自己。}][Helspawn]晕眩的目光向下游移，注意到了你悬在她胯部上方跳动的[cocks]。她那被酒精麻痹的大脑里，仅存的几个突触正在拼命处理这个情况。你压低臀部，将[if (multicock) {你的一根肉棒|你的肉棒}]放在她的阴唇上，当你感觉到她的爱液沾在你的肉棒上时，你轻轻叹了口气。");
            outputText("[pg][if (helspawnvirgin) {[say:我……从来没有做过爱，[daddy]……]|[say:……我想让它进来，[daddy]，]}]她紧张地嘟囔着。你的手抚过她[helspawnscales]的鳞片和光滑滚烫的肌肤，完全被你女儿的身体迷住了。你醉醺醺地把脸凑近她，看着[helspawn]那双半睁着、充满渴望的[helspawneyes]眼睛。不知怎么的，你竟然还能口齿清晰地问她想不想要[daddy]的肉棒，而她没有用言语回答，而是把你拉过去，又给了一个深吻。本能占据了上风，你将你的[cock]推入位置，慢慢地沉入她的小穴。");
            outputText("[pg]当你开始填满她时，[Helspawn]大声哭喊并呜咽起来[if (helspawnvirgin) {，[b:她的处女膜在你的进入下屈服，将她的童贞交给了你]}]。她的里面和外面一样紧致。很高兴看到酒精并没有让你麻木得太厉害——这种紧致感简直太美妙了，不容错过。[if (helspawnvirgin) {虽然这是她的第一次，但你被身后突然传来的压力吓了一跳，你发现那是你女儿的双腿缠绕|你感到身后突然传来一阵压力，并注意到你女儿的双腿试图缠绕}]在你的[hips]上。看到现在已经没有退路了，你采取了唯一剩下的选择，向前猛冲，深深地插入了这个发情的少女体内。她大叫着，把你抱得更紧了。");
            outputText("[pg][say:继续，[daddy]，]她喘着粗气乞求道。她不需要说第二遍。尽管她的大腿很有力，你还是设法抽出来又插进去，在你醉醺醺的嬉闹中找到了一种节奏。酒的臭味开始被汗水和性爱的气味所取代，空气中充满了[Helspawn]在每一次抽插中的喘息和呻吟声。[say:我现-现在明白为什么妈妈喜欢做爱和喝酒了。]");
            outputText("[pg]随着你的动作，黏滑的预精液不断流出，你要么快要射精了，要么快要把内脏吐出来了。无论哪种情况都会有点尴尬。你慢慢停下来，抬起头，闭上眼睛，深呼吸以坚持更长时间。与此同时，你的女儿设法喘过气来，她对你的停顿感到烦躁。");
            outputText("[pg][Helspawn]把你推倒，让你跌倒在地上。她翻身骑在你的腹股沟上。[if (helspawnvirgin) {[say:这是为了在你女儿喝醉的时候夺走她的童贞，]她含糊不清地说着，脸上带着羞愧的笑容|[say:如果你不动，我就接手！]她宣布道}]。幸运的是，在休息之后你确实感觉好多了，当她开始在你的[cock]上坐下时，你所能做的就是向后仰起头，在极乐中呻吟。[if (silly && ischild) {希望你到了那个年纪也能像她一样强壮和精力充沛！}]虽然你刚刚被撞倒在泥土上，但你喘着粗气，夺回了一些主动权，抓住[helspawn]的腰，用拇指向下按压她的阴蒂，在阴蒂包皮的底部摩擦，让她更快地达到高潮的边缘。");
            outputText("[pg]蝾螈放慢了速度，咬着嘴唇；她的颤抖表明你的策略正在奏效，她正在尽最大努力坚持——看来这次情况反过来了。你不会比她更有耐心；你抓住这个少女，把她紧紧地抱在怀里，然后极其热情地用你的臀部撞击她。她的惊讶伴随着大声而结巴的喘息。高潮来得很快，你不打算成为第一个达到高潮的人。把你女儿抱在怀里，你给了[helspawn]你所拥有的一切。");
            outputText("[pg]她捧起你的脸吻了上来。[say: 我……我要去了，[daddy]！]她尖叫着。你回吻她，堵住了她高潮的叫喊，也堵住了你自己难以自控的呻吟，你们同时达到了高潮。快感如潮水般涌遍全身，伴随着你射精的节奏跳动。在你高度敏感的状态下，女儿痉挛的肉壁实在太刺激了，诱使你[if (cumquantity < 200) {在第一发之后榨干了你能挤出的每一滴微薄的精液|[if (cumquantity < 400) {射出更多|将你惊人的产量倾泻而出，用她无法容纳的精液淹没了她[if (hasKnot) {，然而你的肉结却几乎不让任何精液流出}]}]}]。有那么一瞬间，你失去了意识。");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2638,1);
         }
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,970,1);
         saveContent.slutspawnLastTimeSex = get_game().time.days;
         menu();
         doNext(encourageSlutspawnSexEnd);
      }
      
      public function encourageSlutspawnSexEnd() : void
      {
         clearOutput();
         outputText("几秒钟后你才回过神来，依然紧紧抱着[helspawn]。[say: 嘿，搞什么鬼，]一个声音从你模糊的视线外传来。听起来有点像猫，虽然在你现在的状态下说不清为什么。[say: 你们俩把那玩意儿全喝光了！]那个声音尖锐地喊道，一个火红的身影在你面前显现。[say: 我才转过身五分钟，你们俩就把我喝得倾家荡产，直到你们俩像两个十几岁的青少年一样光着身子昏过去！]");
         outputText("[pg][if (isteen) {值得一提的是，你们[i:确实]是两个青少年|值得一提的是，[helspawn][i:确实]是个青少年}]。赫莉娅翻了个白眼。[say: 你应该比她更负责任！或者至少等我加入……]");
         outputText("[pg][say: 我给你留了点，妈妈，] [helspawn] 呻吟着，干呕起来。");
         outputText("[pg][say: 哦。哦，那可真是太棒了，[name]。干得好。]");
         outputText("[pg]你向赫莉娅解释，你只是在教女儿如何更好地控制酒量，尽管你说出的话比你预想的要含糊得多。");
         outputText("[pg][say: 我绝对不会清理这个的，] 赫尔嘟囔着，一屁股坐在你旁边，从斗篷里摸出一个酒壶。[say: 好吧，至少你们没有把[i:所有的]都喝光。]");
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,957,FlagDict_Impl_.arrayReadInt(_loc1_,957) + 20);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function encourageSlutspawnSex() : void
      {
         clearOutput();
         outputText("也许是你的大脑被酒精淹没了，但看到[helspawn]四仰八叉地躺在你面前，喝下另一杯酒时，你觉得这是一种邀请。你抓住地面以免摔倒，爬过去，把脸埋进女儿的胯下，惹得她大叫起来。");
         outputText("[pg][say: 啊！[if (!isfeminine) {爸-爸爸|妈-妈妈}]？你在……干什么……]她说着，已经语无伦次了。你[i:确实]说过你需要喝很多液体。她也不希望你醒来后宿醉，对吧？[if (silly) {你这个比喻的绝妙智慧需要时间来消化，直|直}]到你拨开她[if (helspawnvirgin) {纯洁无瑕的|早已湿润的}]小穴，她才明白你的意思。[say: 可-可你是我的[dad]！]她惊呼道。[if (!helspawnvirgin) { 这以前也没能阻止你。}]");
         outputText("[pg]你不顾她的抗议，撅起嘴唇含住[helspawn]的阴蒂，[if (silly) {开始大快朵颐|开始努力}]。随着快感的袭来，她醉醺醺的状态愉快地放下了矜持。你的[tongue]在她的阴唇间游走，沾满了她的味道，而你的女儿则在原地扭动，抓住你的[if (hashorns) {[horns]|头}]，把你紧紧地按在她的阴部。同时，她的另一只手还拿着酒龙头准备再喝一杯。你的脑海中只闪过一瞬间的念头：如果赫莉娅发现她的酒一点都不剩了，她可能会很生气，但当你的舌头滑进[helspawn]的通道时，任何顾虑都烟消云散了。她立刻绷紧身体，夹紧你入侵的舌头，对着酒龙头发出沉重的呻吟。在她的入口处转动舌头后，你也忍不住想要满足自己的需求。");
         outputText("[pg]你撑起身子向前爬去，低头看着你喝醉的女儿。她那呆滞的目光过了一会儿才注意到你的存在，然后她推开了酒龙头——当你俯身亲吻她时，她的嘴里还含着最后一口酒，你拥抱着更多酒精带来的灼烧感，同时表达着父母能给予的所有激情和爱。");
         menu();
         doNext(encourageSlutspawnSexHarder);
      }
      
      public function encouragePregalia() : void
      {
         clearOutput();
         spriteChooser();
         outputText("你捏了捏赫尔的肩膀，告诉她她会成为一个伟大的母亲，她的孩子最好能向亲爱的老妈这样美丽、强大的战士学习。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,962) == 1)
         {
            outputText("你爱赫尔");
         }
         else
         {
            outputText("赫尔是你的朋友");
         }
         outputText("，如果她的孩子能继承她的衣钵，那就更好了。你的爱人勉强笑了笑，听到你的话脸红了。她的尾巴尖拂过你的脸颊，她依偎着你，微笑着。[say: 谢谢，我的爱人。我只希望我——我们——能对得起这个孩子。仅此而已。]");
         outputText("[pg][say: 我知道，]你回答，吻了她。");
         doNext(playerMenu);
      }
      
      public function encourageHelspawnContinued() : void
      {
         clearOutput();
         outputText("[pg][say: 嘿，怎么回事，]一个声音从你模糊的视线之外传来。听起来有点像猫，但在你现在的状态下，你不知道为什么会有这种感觉。");
         outputText("[pg]你深深地呻吟了一声，瘫倒在你的[ass]上。[helspawn]紧随其后，倒在你身上，压成一堆");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,958) != 1)
         {
            outputText("红色的");
         }
         else
         {
            outputText("黑色的");
         }
         outputText("鳞片，以及一股燃烧的酿酒厂的味道。");
         outputText("[pg][say: 你们俩把这玩意儿全他妈喝光了！] 那个声音尖叫着，一个燃烧的红色身影在你面前显现出来。[say: 我才转过身五分钟，你们俩就把我喝得倾家荡产！]");
         outputText("[pg][say: 我给你留了点，妈妈，] [helspawn] 呻吟着，干呕起来。");
         outputText("[pg][say: 哦。哦，那可真是太棒了，[name]。干得好。]");
         outputText("[pg]你向赫莉娅解释说，你只是在教你们的女儿如何更好地控制酒量，尽管你说出来的话比你预想的要含糊得多。");
         outputText("[pg][say: 我绝对不会清理这个的，] 赫尔嘟囔着，一屁股坐在你旁边，从斗篷里摸出一个酒壶。[say: 好吧，至少你们没有把[i:所有的]都喝光。]");
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,957,FlagDict_Impl_.arrayReadInt(_loc1_,957) + 10);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function encourageHelspawn() : void
      {
         clearOutput();
         outputText("你让她挪过去一点，顺势滑坐到你的小蝾螈身边，再次打开酒桶的龙头。然后你教导你的女儿如何正确地控制喝酒的节奏，你猛灌了一大口，然后关上龙头，细细品味着赫尔酿造的烈酒的强劲口感。");
         outputText("[pg][say:什么……？][helspawn]刚开口，看到你喝酒后便明白了，邀请她加入你。");
         outputText("[pg]你让女儿回到酒龙头下，告诉她诀窍在于建立耐受力。她妈妈十年来一直像牛饮一样喝酒；她不能指望一上来就能像赫尔那样。她必须控制自己的节奏。");
         outputText("[pg][helspawn]慢慢地点了点头，吸了一大口啤酒，然后你再次和她交换位置。当她嘴里没有赫尔酿的酒时，你递给她一个水袋，告诉她喝的水越多，之后感觉就会越好。她急切地喝着，一次又一次地和你交换，直到你的整个世界似乎都变得模糊，你的肌肉感觉像铅块一样沉重，完全不受控制。你们俩都烂醉如泥，咯咯地笑着，跌跌撞撞地，直到你终于设法把自己从几乎空了的蒸馏器旁拉开。");
         menu();
         addButton(1,"做爱",encourageSlutspawnSex).hint("喝酒和做爱。好吧，她毕竟是赫尔的后代。").disableIf(get_player().isTaur() || get_player().isGenderless(),"你醉得太厉害了，不知道该怎么操她。");
         addButton(0,"停止饮酒",encourageHelspawnContinued).hint("你们可能喝得太多了。");
      }
      
      public function dontTellMeAboutSpiderboy() : void
      {
         clearOutput();
         spriteChooser();
         outputText("[say: 所以，只能说我从那次遭遇中带着足够装满一桶的可爱蜘蛛男孩精液回来了。如果我现在还没有怀上他的孩子，那我就没希望了。但是……你知道，我觉得我能感觉到，[name]。我不应该能感觉到的，但我能。哦，天哪，]赫尔说着，刻意避开你的目光，睁大眼睛盯着早晨的天空。");
         outputText("[pg][say: 怎么了？]");
         outputText("[pg][say: 我……我真的要当妈妈了。我能感觉到，[name]。那个蜘蛛男孩的种子在我体内生根发芽，那是新生命的曙光。我只希望……我希望这不是个错误，[name]。]");
         outputText("[pg]你搂住这位准妈妈的肩膀，说道：[say: 我以为这就是你想要的，赫尔。你之前——]");
         outputText("[pg][say: 是啊，我知道。别管它了，我没事。真的。只是这一切发生得太突然了，你知道吗？一年前我可没想过自己会变成这样。我不是在抱怨，]她补充道，转过身来吻了你一下，用尾巴紧紧缠住你。[saystart]我只是希望我准备好了。在苍白之焰燃起之前，我从未真正想过要当母亲。也从未真正想要过。但昨晚，我感觉自己像被附身了一样，无法控制自己。我只是……需要你。好吧，也许不是你的精子——我不是那个意思——但我的身体就像在尖叫“你找到了[him]，就是[he]了，这是个值得托付的人！是时候繁衍后代了！”我……我忍不住觉得这并不完全是我自己的选择，你明白吗？就像我是凭本能在行动，像个动物，而不是人。但同时，如果我犯了错，至少有你在我身边，像往常一样帮助我。我全心全意地爱着你，[name]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,962) == 1)
         {
            outputText("，我也非常、非常高兴你能爱我。");
         }
         else
         {
            outputText("，即使你无法对我说出同样的话。没关系；这不会改变我的心意，永远不会。我爱你。");
         }
         outputText("[sayend]");
         outputText("[pg]你们俩依偎了很久，满足地躺在彼此的怀抱里。[say: 我很高兴我们能共同面对这一切，我的爱人。在这期间……我会需要你的。]");
         outputText("[pg]你让她放心：你会一直陪着她，走过每一步。她微笑着");
         if(get_player().get_tallness() >= 90)
         {
            outputText("向上");
         }
         else if(get_player().get_tallness() <= 72)
         {
            outputText("向下");
         }
         outputText("看着你，紧紧抱了你很久才松开，但依然握着你的手。[say: 这对我来说都是全新的体验，[name]。我从未想象过自己会成为一位母亲，有一个伴侣和一个稳定、安全的家——或者说在这个时代尽可能稳定和安全——但只要有你在我身边，就没有我无法面对的事情。]");
         outputText("[pg]你给了你的爱人最后一个吻，然后继续你的冒险。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function dontTellMeAboutMai() : void
      {
         clearOutput();
         spriteChooser();
         outputText("[say: 所以，就这么说吧，我从那次艳遇中带走了足以装满一桶的狐狸扶他精液。如果我现在没有怀上她的孩子，那我就没救了。但是……你知道，我想我能感觉到，[name]。我本来不应该感觉到的，但我能。哦，天哪，]赫尔说着，刻意避开你的视线，睁大眼睛盯着清晨的天空。");
         outputText("[pg][say: 怎么了？]");
         outputText("[pg][say: 我……我真的要当妈妈了。我能感觉到，[name]。舞的种子在我体内扎根，那是新生命的曙光。我只希望……希望这不是个错误，[name]。]");
         outputText("[pg]你搂住这位准妈妈的肩膀，说道：[say: 我以为这就是你想要的，赫尔。你之前——]");
         outputText("[pg][say: 是啊，我知道。别管它了，我没事。真的。只是这一切发生得太突然了，你知道吗？一年前我可没想过自己会变成这样。我不是在抱怨，]她补充道，转过身来吻了你一下，用尾巴紧紧缠住你。[saystart]我只是希望我准备好了。在苍白之焰燃起之前，我从未真正想过要当母亲。也从未真正想要过。但昨晚，我感觉自己像被附身了一样，无法控制自己。我只是……需要你。好吧，也许不是你的精子——我不是那个意思——但我的身体就像在尖叫“你找到了[him]，就是[he]了，这是个值得托付的人！是时候繁衍后代了！”我……我忍不住觉得这并不完全是我自己的选择，你明白吗？就像我是凭本能在行动，像个动物，而不是人。但同时，如果我犯了错，至少有你在我身边，像往常一样帮助我。我全心全意地爱着你，[name]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,962) == 1)
         {
            outputText("，我也非常、非常高兴你能爱我。");
         }
         else
         {
            outputText("，即使你无法对我说出同样的话。没关系；这不会改变我的心意，永远不会。我爱你。");
         }
         outputText("[sayend]");
         outputText("[pg]你们俩依偎了很久，满足地躺在彼此的怀抱里。[say: 我很高兴我们能共同面对这一切，我的爱人。在这期间……我会需要你的。]");
         outputText("[pg]你让她放心：你会一直陪着她，走过每一步。她微笑着");
         if(get_player().get_tallness() >= 90)
         {
            outputText("向上");
         }
         else if(get_player().get_tallness() <= 72)
         {
            outputText("向下");
         }
         outputText("看着你，紧紧抱了你很久才松开，但依然握着你的手。[say: 这对我来说都是全新的体验，[name]。我从未想象过自己会成为一位母亲，有一个伴侣和一个稳定、安全的家——或者说在这个时代尽可能稳定和安全——但只要有你在我身边，就没有我无法面对的事情。]");
         outputText("[pg]你给了你的爱人最后一个吻，然后继续你的冒险。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function dontFuckAlex() : void
      {
         clearOutput();
         outputText("抚摸着[helspawn]的头发，你试图告诉她有更好的方法，她不必和遇到的每一个人做爱。她妈妈确实是那样，但她可以做得更好，可以用自己做更多的事情，而不是屈服于不断的欲望。");
         if(helspawnSlutty())
         {
            outputText("[pg][helspawn]嘲讽地摇了摇头。[say: 但是我[b:喜欢]妈妈的方式。我喜欢自慰，喜欢我的小穴被撑开的感觉，喜欢我的屁股被我在镇上买的大玩具撕裂的感觉。这就是我，" + championRef() + "。我像妈妈，我不认为……不，我知道我不想改变。我喜欢做爱，即使你阻止了我和亚历克斯。我想感受一群牛头人强奸我，我想跳到蛛化精灵的鸡巴上骑他。我想做我听说妈妈做过的那些事，这就是我要做的。我很抱歉。]");
            outputText("[pg]你试图说些什么，但[helspawn]退后了一步，回头喊道：[say: 我爱你，" + championRef() + "，但我不能成为你想要我成为的样子。我要像妈妈一样做个荡妇，你无法阻止我！这就是我生来和被抚养长大的样子。]");
            outputText("[pg]你可能犯了一个可怕的错误。");
         }
         else
         {
            outputText("[pg][helspawn]慢慢地点了点头，接受了你的话。[say: 我……我知道，" + championRef() + "。我很抱歉昨晚把亚历克斯带回家。这不会再发生了。我不……我爱母亲，但我不想像她一样。一个妓女。她是个伟大的女人，但她做的那些事……让我感到恶心。]");
            outputText("[pg]她回过神来，叹了口气。[say: 我不该这么说。对不起，我知道她尽力了。她爱我们，即使她表达爱的方式很奇怪。我以后会做得更好。我保证。]");
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function debugMenu(param1:Boolean = true) : void
      {
         get_game().debugMenu.debugCompEdit(saveContent,new SaveContent(null,null,null,null,null,null,null));
      }
      
      public function dasBarbarimander() : void
      {
         var _loc1_:* = null as Player;
         var _loc2_:* = null as IMap;
         clearOutput();
         spriteChooser();
         FlagDict_Impl_.arrayWriteString(KFLAGS.flags,959,"scimitar");
         if(get_player().get_gems() >= 200)
         {
            outputText("你叹了口气，掏出一把宝石。赫莉娅对你灿烂一笑，在你的脸颊上快速印下一吻，然后抓起[helspawn]和战利品。[say: 谢谢你的贷款，我的爱人。来吧，亲爱的，我们要去镇上逛逛。]");
            outputText("[pg][say: 太棒了！] 小蝾螈咧嘴一笑，跟在母亲身后。");
            _loc1_ = get_player();
            _loc1_.set_gems(_loc1_.get_gems() - 200);
         }
         else
         {
            outputText("[pg]你翻了翻口袋，告诉赫尔你和她一样身无分文。蝾螈呻吟了一声，戏剧性地把手放在额头上，假装羞愧。[say: 我真可怜，为了养活我的孩子，被迫在黑暗的巷子里卖淫！]");
            outputText("[pg]沉默了片刻。[say: 品味太差了，是吧？我想我还是去把牛头人揍出屎来吧。来吧，亲爱的，我们要去打猎了！]");
            outputText("[pg][say: 太棒了！] 小蝾螈咧嘴一笑，跟在母亲身后。");
            outputText("[pg]你无法想象这怎么会以糟糕的结局收场。");
            _loc2_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc2_,957,FlagDict_Impl_.arrayReadInt(_loc2_,957) + 10);
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function championRef() : String
      {
         return get_player().mf("爸爸","妈妈");
      }
      
      public function bulgyCampNotice() : void
      {
         clearOutput();
         spriteChooser();
         outputText("当你在营地里散步时，你的目光落在了营地边缘一块石头上晒太阳的赫莉娅身上。你可以看到她的肚子已经开始凸起，赫尔的双手保护性地放在她饱满的子宫上，心不在焉地抚摸着隆起的腹部。");
         doNext(playerMenu);
      }
      
      public function beatUpYourDaughter() : void
      {
         clearOutput();
         if(helspawnSlutty() && get_monster().get_lust() >= get_monster().maxLust())
         {
            outputText("[say:不……不要了……]这个淫荡的小火蜥蜴呻吟着，瘫倒在地上，双臂环抱着自己。[say:操，你真性感……好想要……]她呻吟着，双手滑向她湿透的比基尼泳裤。");
            outputText("[pg]你摇了摇头，轻轻推了她一下，让她仰面躺下。她只是发出一声呜咽，终于撕开了她的内裤，让她可以毫无阻碍地接触到她湿透的阴部。[say:嘿，别……别就把我这样丢下，]她哀求道，但无济于事。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,970) == 0)
            {
               outputText("你不再理会这个战败的荡妇，径直走回营地，留下她自己去解决她的欲火。");
            }
            else
            {
               outputText("你弯下腰，在你可爱、好色的女儿宽阔的臀部上拍了一下，告诉她，当她撅起屁股，乞求");
               if(!get_player().hasCock())
               {
                  outputText("做爱");
               }
               else
               {
                  outputText("你的鸡巴");
               }
               outputText("……如果她运气好的话，等你冷静下来，也许会去照顾她。");
            }
         }
         else
         {
            outputText("[helspawn]踉跄着后退，扔下武器挥舞着手臂，[say:我投降，我投降。]");
            outputText("[pg]你赞许地点点头，放下你的[weapon]，告诉她干得不错。毕竟，没几个人能在你面前坚持这么久。她微微一笑，但当你试图靠近时，她还是疼得缩了一下");
            if(get_monster().get_HP() < 1)
            {
               outputText("，揉着她身上多处的淤青");
            }
            else
            {
               outputText("，在你淫荡的展示之后，脸红得像个熟透的苹果");
            }
            outputText("。你轻笑着揉了揉她的头发，告诉她该吃饭了。");
            outputText("[pg][say:是啊，吃的，]她呻吟着，在你们俩从激烈的切磋中恢复过来时，踉踉跄跄地跟在你身后。");
         }
         get_combat().cleanupAfterCombat();
      }
      
      public function applyHelspawnName() : void
      {
         var _loc1_:String = getInput();
         spriteChooser();
         var _loc2_:Array = ["","Hellgirl","Kid","Phoenix","Savin","Helia","Mini-doofus"];
         if(_loc2_.lastIndexOf(_loc1_) >= 0)
         {
            clearOutput();
            if(_loc1_ == "")
            {
               outputText("<b>你必须设置一个名字。</b>");
            }
            else if(_loc1_ == "Hellgirl")
            {
               outputText("[say: 嘿，那是侵犯版权。大概吧。]");
            }
            else if(_loc1_ == "Kid")
            {
               outputText("[say: 哇，你几岁了，五岁吗？]");
            }
            else if(_loc1_ == "Phoenix")
            {
               outputText("[say: 噢，见鬼，不行。你不能给我的小女孩起那种……东西的名字！对不起，奇里，但还是不行！]");
            }
            else if(_loc1_ == "Savin")
            {
               outputText("[say: 那是个男孩的名字，蠢货。]");
            }
            else if(_loc1_ == "Helia")
            {
               outputText("[say: 我最喜欢的名字！不过这名字已经有人用了，亲爱的。你不想让这里变得太混乱，对吧？]");
            }
            else if(_loc1_ == "Mini-doofus")
            {
               outputText("[say: 噢，是啊，奇哈听了肯定会笑掉大牙的。你个混蛋。]");
            }
            menu();
            genericNamePrompt();
            addButton(0,"继续",applyHelspawnName);
            return;
         }
         set_helspawnName(_loc1_);
         clearOutput();
         if(get_helspawnName() == "Helspawn")
         {
            outputText("[say: 我本来也是这么打算叫她的！才怪。妈的，说真的，[name]？][pg]");
         }
         if(get_helspawnName() == "Jayne")
         {
            outputText("[say: 听起来像个英雄的名字……我喜欢。一个令人敬畏的名字！][pg]");
         }
         if(get_helspawnName() == "Hesper")
         {
            outputText("[say: 啊，长庚星。她会成为我生命中的星星，没错……][pg]");
         }
         if(get_helspawnName() == "Kiri")
         {
            outputText("[say: 噢，太棒了，亲爱的。老姐要是听到她侄女跟她同名，肯定会吓尿的！不过以后可能会有点搞混……][pg]");
         }
         if(get_helspawnName() == "Mai")
         {
            outputText("[say: 噢，太棒了，亲爱的。舞一定会感到荣幸的，我知道。而且这确实是个好名字……][pg]");
         }
         if(get_helspawnName() == "Tanis")
         {
            outputText("[say: 我不……我不知道我是否想让她叫那个名字，亲爱的。它承载了太多，但是……但是它确实给了我母亲一份荣耀。比我能给她的还要多。][pg]");
         }
         if(get_helspawnName() == "Syn")
         {
            outputText("[say: 太棒了。我就希望你能选那个，我的爱人。][pg]");
         }
         if(get_helspawnName() == "Chara")
         {
            outputText("[say: 太棒了。你果然还是喜欢我的主意！][pg]");
         }
         outputText("[say: 那么……就叫[helspawn]了。这是个好名字，我的爱人。一个坚强的名字。我们的女儿有了这个名字，一定会长得又高又壮……而且有你在身边指导她，]赫尔说着，亲吻了你的脸颊。[say: 给我一分钟喘口气，把小家伙安顿好，然后我们再谈。好吗？]");
         outputText("[pg]你点点头，扶着赫莉娅站起来，她仍然把[helspawn]抱在胸前。你的爱人对你眨了眨眼，然后迈着罗圈腿走回她营地的那一边，走向她在吊床旁搭建的小婴儿床。");
         helSpawnsSetup();
         doNext(get_camp().returnToCampUseTwoHours);
      }
      
      public function HaveAHellKidPartII() : void
      {
         clearOutput();
         spriteChooser();
         outputText("<b>几个小时后……</b>[pg]");
         outputText("用你第六次——或者是第七次？——恢复的最后一丝力气，你在赫莉娅红透的屁股上狠狠地抽了一记，然后咆哮着，另一股强劲的精液涌入她雪白的洞里，那里仍然滑溜溜地残留着你过去六次射精的痕迹。你抓住她粗壮的臀部，将你的[cock]深深地砸进她体内，最后一次射精让她的子宫更满了一点，多余的精液喷涌而出，弄湿了蝾螈膝盖下沾满精液的地面。");
         outputText("[pg]现在太阳出来了，当你们终于停下来休息时，它辐射出的光芒亲吻着你赤裸、汗水滑溜的肌肤。你向后靠了靠，刚好让疲软的肉棒从赫尔被榨干的小穴里滑出来，引出一股咸咸的精液，汇聚在她张开的双腿之间。没有了你的肉棒支撑，赫尔像个布娃娃一样瘫倒在一旁，胸膛起伏，身上还带着迷失高潮的白色痕迹。她甚至还能对你微笑，手指漫不经心地在她肿胀的洞口游走，指关节深深地插入你整晚泵入她体内的几加仑精液中。屈服于疲惫，你滑倒在你的爱人身边，把胸膛靠在她的肩膀上。她的手臂环绕着你，把你抱得紧紧的，在你的额头上印下一个温柔、充满爱意的吻。");
         outputText("[pg][say: 那真是……太棒了。天哪，我们简直是天造地设的一对。你的一举一动，你填满我、操我、抚摸我的方式。我……很高兴能遇到你，[name]。那感觉就像是上辈子的事了，就好像那时的我是另一个人。也许我确实是，但是……除了和你，我爱的人在一起，我哪里都不想去，无论是在玛瑞斯还是其他地方。哦天哪，我太爱你了，[name]。非常非常爱你，]她说着，手指穿过你的[hair]。你倾身吻她，双臂环抱着你的爱人，嘴唇贴着她的嘴唇，品尝着她甜蜜的触碰。");
         outputText("[pg][say: 哦，该死，]赫尔说着，结束了亲吻，睁大眼睛盯着清晨的天空。");
         outputText("[pg][say: 怎么了？]");
         outputText("[pg][say: 我-我真的要当妈妈了。我能感觉到，[name]。你的种子在我体内生根发芽，新生命的曙光。我只希望……我希望这不是个错误，[name]。]");
         outputText("[pg]你用手肘撑起身子，凝视着你的爱人，她火热的眼睛凝视着虚空。[say: 我以为这是你想要的，赫尔。你刚才——]");
         outputText("[pg][say: 是的，我知道。忘了它吧，我没事。真的。只是这一切发生得太突然了，你知道吗？这和我一年前对自己的设想不太一样。我不是在抱怨，]她补充道，转过身来又给了你一个吻，捏了捏你的肩膀。[saystart]我想我只是希望我已经准备好了。在苍白之焰燃起之前，我从未真正想过要当母亲。也从未真正想要过。但昨晚，我好像被附身了，好像无法控制自己。我只是……需要你。而你就在那里，像往常一样，准备好帮忙。我全心全意地爱你，[name]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,962) == 1)
         {
            outputText("，我非常非常高兴你也爱我");
         }
         else
         {
            outputText("，即使你不能说同样的话。没关系；这不会改变我的心意，永远不会。我爱你");
         }
         outputText("。[sayend]");
         outputText("[pg]你们俩依偎了很长一段时间，看着日出，满足地躺在彼此的怀抱里，让性交后的疲惫感消退。然而，在度过了幸福的永恒之后，你们俩都站了起来，收集散落的赫尔的鳞甲和你的[armor]，在重新穿衣时笑着互相打趣，偶尔交换一个吻或抚摸，直到你们俩都穿好衣服，武器也固定好。最后，赫莉娅滑入你的怀抱，在你的嘴唇上印下长长的一吻。[say: 我很高兴我们能一起面对这一切，我的爱人。在这期间，我……我需要你。]");
         outputText("[pg]你让她放心：你会一直陪着她，走过每一步。她微笑着");
         if(get_player().get_tallness() >= 90)
         {
            outputText("向上");
         }
         else if(get_player().get_tallness() <= 72)
         {
            outputText("向下");
         }
         outputText("看着你，紧紧抱了你很久才松开，但依然握着你的手。[say: 这对我来说都是全新的体验，[name]。我从未想象过自己会成为一位母亲，有一个伴侣和一个稳定、安全的家——或者说在这个时代尽可能稳定和安全——但只要有你在我身边，就没有我无法面对的事情。]");
         outputText("[pg]你给了你的爱人最后一个吻，然后带她回到营地，一路上从未让她的手从你的手中滑落。");
         doNext(get_camp().returnToCampUseOneHour);
      }
   }
}

