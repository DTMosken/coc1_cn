package classes.scenes
{
   import classes.CoC;
   import classes.DynStat;
   import classes.PerkLib;
   import classes.Player;
   import classes.StatusEffects;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.items.Armor;
   import classes.items.ArmorLib;
   import classes.items.ConsumableLib;
   import classes.scenes.npcs.AmilyScene;
   import classes.scenes.npcs.JojoScene;
   import classes.scenes.npcs.NPCAwareContent;
   import flash.Boot;
   import haxe.IMap;
   
   public class FollowerInteractions extends NPCAwareContent
   {
      
      public function FollowerInteractions()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
      }
      
      public function whyWouldDoThis() : void
      {
         get_jojoScene().jojoSprite();
         clearOutput();
         outputText("你不忍直视这可怕的行径，移开了视线。她割断了这位曾经虔诚的武僧的喉咙，一切都结束了。你们俩在老鼠的尸体上堆起了一个石堆，这是你们能为他提供的最合适的葬礼了。");
         dynStats(DynStat.Lust(-99));
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,80,2);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function tellRathazulYouOwnJojo() : void
      {
         get_jojoScene().jojoSprite();
         clearOutput();
         outputText("你告诉拉萨祖尔，[say: 哦，那只是乔乔。他被腐化了，但他并不邪恶，他之所以在附近转悠，是因为他知道我喜欢和他睡觉。][pg]");
         outputText("拉萨祖尔困惑地挠了挠头，结结巴巴地说，[say: 你，呃，操、操那个怪物？好吧，嗯……好吧。我想我不用担心了……][pg]");
         outputText("他脸红了，踉踉跄跄地走回他的实验室，嘴里嘟囔着疯狂的年轻人。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function tellRathazulYouCanHandleIt() : void
      {
         get_jojoScene().jojoSprite();
         clearOutput();
         outputText("你告诉拉萨祖尔，[say: 别担心。我走遍了树林，以前也和那只老鼠打过。他很容易对付，如果他试图偷偷靠近我们中的任何一个，我会处理好的。][pg]");
         outputText("拉萨祖尔打量了你一番，问道：[say: 你为什么不杀了它？这个世界充满了腐化，我们最好把这些东西扼杀在摇篮里。][pg]");
         outputText("你回答道：[say: 我看起来像恶魔吗？如果可以的话，我不会杀我的敌人。相信我，我们很安全。][pg]");
         outputText("这只老鼠似乎对你的回答很满意，并恭敬地点了点头。他蹒跚着走回他的实验室，担忧地绞着他那长满爪子的手。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function tellAmilyToFuckOffRuinedJojo() : void
      {
         get_jojoScene().jojoSprite();
         clearOutput();
         outputText("你轻笑一声，[say: 他现在这样干起来比你以前爽多了。你为什么不滚开，别来烦我们？][pg]");
         outputText("她散发出的悲伤显而易见，但她的眼神变得像冰一样冷酷，她回答道：[say: 好吧。反正我也不想和恶魔有任何瓜葛。] 她转过身，慢跑着离开了，在消失之前，她回头看了你一眼，眼里闪烁着泪光。[pg]");
         outputText("毫无疑问，她跑回了废墟。也许你可以收集一些合适的药物来教训她一下？");
         if(get_player().get_inte() >= 45)
         {
            outputText("地精麦酒和催情药剂应该能派上用场。");
         }
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,43,0);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,168,1);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,36,0);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,44,1);
         dynStats(DynStat.Cor(10));
         doNext(playerMenu);
      }
      
      public function stopJojoDeathInTheNameOfLove() : void
      {
         get_jojoScene().jojoSprite();
         clearOutput();
         outputText("你抓住她的肩膀说道，");
         if(get_player().get_inte() < 40)
         {
            outputText("[say: 停下，想想看。我们不能这么做，对吧？] 她回答：[say: 我们必须做我们该做的，] 然后拔出了匕首。你不忍直视这可怕的行径，移开了视线。她割断了这位曾经虔诚的武僧的喉咙，一切都结束了。你们俩在老鼠的尸体上堆起了一个石堆，这是你们能为他提供的最合适的葬礼了。");
            dynStats(DynStat.Lust(-99));
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,80,2);
         }
         else
         {
            outputText("[say: 艾米莉，这不对。他可能被腐化了，但我们不需要杀死无助的无辜者，不管他们有多饥渴。是的，他已经腐化到无可救药的地步，但他的身心并不倾向于传播这种腐化。这只老鼠对任何人都没有威胁。][pg]");
            outputText("她慢慢地点了点头，把手从匕首上移开。艾米莉回答：[say: 你总是对的。我会放过他，但如果你再做类似的事，我就走。][pg]");
            dynStats(DynStat.Inte(1));
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function srslyPimpinGuyz() : void
      {
         clearOutput();
         outputText("[say:是的，我是认真的。怎么，你们觉得我搞不定你们俩吗？]你一边双手叉腰扭动着身体一边说道。她们俩几乎同时尖叫着向你扑来。瞬间，你被艾米莉的飞镖击中，身体动弹不得，紧接着玛布尔将她的锤子高高举起，重重地砸在你的头上，随后一切都陷入了黑暗。[pg]");
         get_player().takeDamage(get_player().get_HP() - 1);
         outputText("几个小时后你醒来，发现两个女孩都不在了，你的营地一片狼藉，大部分装备也不翼而飞。在营地周围查看了一番后，你意识到你所有的消耗品、宝石，甚至你的武器和盔甲都被拿走了。");
         if(get_player().get_armorName() != "goo armor")
         {
            outputText("剩下的只有一套舒适的衣服，你把它穿上了。");
         }
         else
         {
            outputText("[say:你没事吧？]盔甲史莱姆问道。你向她坚持说你头痛得厉害。");
         }
         outputText("你还发现了一张字迹潦草的纸条，上面写着：<i>这就是你当混蛋的下场。</i>这群该死的婊子。");
         var _loc1_:Player = get_player();
         _loc1_.set_gems(_loc1_.get_gems() * 0);
         get_inventory().emptySlots();
         if(get_player().get_armor().get_id() != get_armors().VINARMR.get_id())
         {
            get_player().setArmor(ArmorLib.NOTHING);
         }
         get_player().setUnarmed();
         get_player().removeStatusEffect(StatusEffects.CampMarble);
         outputText("[pg]毫无疑问，艾米莉跑回了废墟。也许你可以收集一些合适的药物来教训她一顿？");
         if(get_player().get_inte() >= 45)
         {
            outputText("地精麦酒和催情药剂应该能派上用场。");
         }
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,43,0);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,168,1);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,36,0);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,44,1);
         get_player().sleeping = true;
         doNext(get_camp().returnToCampUseEightHours);
      }
      
      public function smileAndNodToAmilyXUrta() : void
      {
         clearOutput();
         outputText("你咧嘴一笑，告诉她你并不惊讶她和乌尔塔相处得这么好。当你告诉她那个场景其实挺火辣的，而且你不会因此怪罪她时，她恢复了不安的平静……不过你暗示，如果她们俩以后还想再来一次，你希望能在一旁看着。[pg]");
         outputText("听到最后那句话，艾米莉羞得满脸通红。[say: 好-好吧……我会记住的。但是，我能回去睡觉了吗，拜托？我的头疼死了。][pg]");
         outputText("你点点头，让她继续睡觉。");
         outputText("[pg](<b>乌尔塔现在已在艾米莉的性爱菜单中解锁。</b>)");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,346,4);
         doNext(playerMenu);
      }
      
      public function rathazulFreaksOverJojo() : void
      {
         clearOutput();
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,83,FlagDict_Impl_.arrayReadInt(_loc1_,83) + 1);
         outputText("拉萨祖尔带着严肃、担忧的表情走到你面前。你问他怎么了，他解释说，[say: 树林里有一只怪物。我多次瞥见它，我相信它是一只被恶魔污染的老鼠。我们必须处理它，以免它在我们毫无防备时发动攻击！][pg]");
         outputText("你努力保持着严肃的表情。这个“怪物”显然是你的性奴，乔乔。你该怎么告诉这只老老鼠？");
         outputText("（他是我的，我能处理，或者他没有恶意？）");
         menu();
         addButton(0,"我的",tellRathazulYouOwnJojo);
         addButton(1,"我能处理",tellRathazulYouCanHandleIt);
         addButton(2,"无害",TellRathazulJojoIsHarmless);
      }
      
      public function pureJojoAndAmilySpar() : void
      {
         clearOutput();
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,75,FlagDict_Impl_.arrayReadInt(_loc1_,75) + 1);
         outputText("艾米莉和乔乔似乎在切磋。艾米莉手里拿着一对匕首，乔乔拿着一根法杖。两个模糊的" + (get_noFur() ? "身影" : "毛茸茸的身影") + "在疯狂的动作中旋转着。乔乔挡开了这只母老鼠的大部分攻击，甚至偶尔还能用法杖反击。他解开了长袍的顶部，汗水从他的" + (get_noFur() ? "皮肤" : "皮毛") + "上流下来。很明显，他比这只母老鼠更努力。这场比赛势均力敌，但他们看到了你，于是结束了这场激烈的切磋。乔乔向你恭敬地点点头，然后离开了，一边把长袍拉回原位，一边大口喝着水袋里的水。[pg]");
         doNext(get_amilyScene().amilyFollowerEncounter);
      }
      
      public function marbleVsAmilyFreakout() : void
      {
         get_game().amilyScene.amilySprite();
         clearOutput();
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,86,FlagDict_Impl_.arrayReadInt(_loc1_,86) + 1);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,85) <= 1)
         {
            outputText("当你把艾米莉带进你的营地时，你看到玛布尔微笑着看了你一会儿，然后笑容变成了皱眉。你意识到这可能不是一个好主意……[pg]");
         }
         else
         {
            outputText("当你把玛布尔带回你的营地时，你看到艾米莉坐在那里，玛布尔皱着眉头问道：[say: 亲爱的，那是谁？] 糟糕，这可能会变得很糟糕。[pg]");
         }
         outputText("不一会儿，玛布尔走到艾米莉面前，脸上带着勉强的笑容，问道：[say: 请问你是谁？][pg]艾米莉还没意识到发生了什么，就高兴地回答道。[say: 我是艾米莉，[name]的爱人。你是谁？] 她向玛布尔伸出手。就在这时，你听到玛布尔发出一声低吼，她转过身来面对你，气得脸色发青。[say: 你！你为什么没告诉我这个女孩的事？！我那么信任你！]");
         outputText("[pg]你该如何回应？");
         menu();
         addButton(0,"保持沉默",marbleIsPissyAndYourTooDumbToTalk);
         addButton(1,"皮条客",beAPimpMarbleLovesIt);
         addButton(2,"解释",LucyYouGotSomeSplainingToDo);
      }
      
      public function marbleIsPissyAndYourTooDumbToTalk() : void
      {
         clearOutput();
         outputText("此时你完全想不出该对她说什么，只能呆呆地看着。玛布尔随后转向艾米莉大喊道：[say:我也是[his]情人。[He]没跟你提过我，对吧？]艾米莉看了玛布尔一会儿，然后眼含泪水地回头看着你。她说道：[say:我知道这是个怎样的世界，但我以为你至少会告诉我关于她的事。难道我们共同的孩子对你来说毫无意义吗？]此时，玛布尔的锤子已经握在手中准备就绪。她几乎是尖叫着喊道：[say:你们居然有孩子了?!?!]她手中的锤子已经蓄势待发。[pg]");
         if(get_player().hasPerk(PerkLib.MarblesMilk))
         {
            outputText("玛布尔保护性地走到你面前，转向艾米莉。[say: 这个[race]是我的！[He]需要我才能生存，我会尽一切努力保护[him]，] 玛布尔宣布道。然后，她用一种危险而温柔的声音说：[say: 现在离开，否则我就杀了你。] 艾米莉试图透过充满泪水的眼睛看着你，但玛布尔轻声耳语道：[say: [name]，抱紧我。] 虽然声音很轻，但她的话语中没有任何请求的意味，而是一种命令。你犹豫了片刻，但考虑到生气的玛布尔可能会取消你的牛奶特权，你决定你绝对不能惹她生气。你深吸一口气，用双臂抱住玛布尔。艾米莉最后痛苦地看了你一眼，然后转身去收拾她的东西。当她匆匆离开她以前的床铺时，你怀疑你再也见不到她了。[pg]");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,43,0);
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,36,1);
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,8) > 0)
         {
            outputText("玛布尔突然也哭了起来，在抽泣中大喊：[say:为什么，[name]？难道我们的孩子对你来说毫无意义吗？]她沮丧地将锤子砸向地面，引发的震动差点把你和艾米莉震倒在地。然而，此时她们俩都已经崩溃了，跪在地上痛哭流涕。你不知道现在该说什么，也不知道该做什么。几分钟后，她们俩依次悲伤地看了你一眼，然后收拾好各自的东西（玛布尔还带上了她的孩子们）离开了营地。你怀疑你再也见不到她们中的任何一个了。");
            get_player().removeStatusEffect(StatusEffects.CampMarble);
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,43,0);
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,36,1);
         }
         else
         {
            outputText("玛布尔举起锤子转过身来面对你，对你说：[say:所以我想我对你来说不过是个泄欲工具，对吧，亲爱的？！我牺牲了那么多帮你戒掉毒瘾，就是为了让你能和别人在一起？！]她挥起锤子砸向你，你勉强及时躲开，回头看着愤怒的牛娘。[say:" + get_player().get_short() + "！]艾米莉一边擦着眼泪冲到你身边，一边大声呼唤你。[say:好！]玛布尔冲你们俩大喊。[say:你们俩就在一起吧，想生多少孩子就生多少！我要走了，[name]，别来找我，]她宣布完，便收拾好东西离开了营地。你怀疑你再也见不到她了。");
            get_player().removeStatusEffect(StatusEffects.CampMarble);
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function letTheSlootsFuck() : void
      {
         clearOutput();
         outputText("你轻笑一声，告诉她们你理解，不过她们以后最好把你算上。当你对她们眨眨眼走出去时，她们脸上露出了醉醺醺的如释重负的表情。很快，你就听到了做爱的水声和咯咯的笑声，谈论着她们的情人有多棒。");
         dynStats(DynStat.Lust(75));
         doNext(get_camp().returnToCampUseOneHour);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,346,4);
      }
      
      public function jokeAboutPimpularness() : void
      {
         clearOutput();
         outputText("你向她们保证，你以为开个玩笑能帮她们冷静下来。她们俩似乎并不认同你的想法，但还是等着你再说些什么。");
         menu();
         addButton(0,"保持沉默",marbleIsPissyAndYourTooDumbToTalk);
         addButton(1,"解释",LucyYouGotSomeSplainingToDo);
      }
      
      public function jojoOffersRathazulMeditation() : void
      {
         clearOutput();
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,84,FlagDict_Impl_.arrayReadInt(_loc1_,84) + 1);
         outputText("乔乔在拉萨祖尔的实验室里。这只较小的白老鼠正在问这位年长的啮齿动物是否愿意冥想。拉萨祖尔考虑了片刻，同意了：[say: 等我有时间的时候，我得试试。稍微反思一下对我的老灵魂有好处。但是我们现在不行；[name]需要我。][pg]");
         outputText("乔乔转向你，快速鞠了一躬，然后离开了。");
         doNext(get_game().rathazul.returnToRathazulMenu);
      }
      
      public function fixJojoOOOOHYEEEEAHSNAPINTOASLIMJIM() : void
      {
         clearOutput();
         outputText("[say: 你带来了！太好了！]艾米莉欢呼道。她把手伸进你的袋子里，拿出那瓶纯净蜂蜜，然后向树林跑去。你只好追上去，等你赶上时，她已经用麻醉飞镖击中了乔乔。这只被腐化的老鼠即使在昏迷中，依然坚挺并滴着精液。艾米莉呻吟道：[say: 可怜的孩子……来，喝下去。这会让你好起来的。][pg]");
         get_player().consumeItem(get_consumables().PURHONY);
         outputText("她只让他喝了几口，然后转过身对你说：[say: 这需要我花几个小时。他醒来时你最好不在场。我怀疑他醒来后还会想和你有任何瓜葛。我会给他指路去找我们的孩子。我相信他们能帮他完全康复。][pg]");
         outputText("你点点头，离开了，");
         if(get_player().cor > 66)
         {
            outputText("已经开始后悔你的选择了");
         }
         else if(get_player().cor > 33)
         {
            outputText("对整个情况感到有些困惑");
         }
         else
         {
            outputText("很高兴你对乔乔造成的伤害不是永久性的");
         }
         outputText("。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,80,1);
         dynStats(DynStat.Cor(-5));
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,78,4);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,77,0);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,79,1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function findJojosNote() : void
      {
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,79,2);
         clearOutput();
         outputText("你的铺盖卷上留着一张纸条。你捡起来拆开——是乔乔写的！[pg]");
         outputText("[say: 在我们之间发生了这些事情之后，我觉得我应该为我们生命中的这一章画上句号。你对我所做的事是不可原谅的。这是对我过去和现在一切的亵渎。但是，尽管我没能帮你驯服内心的腐化，我很高兴艾米莉能代替我做到这一点。虽然由于你对我身体和性欲的改变，我再也无法回到过去作为纯洁僧侣的生活，但艾米莉能够繁衍我们的族群，这让我感到些许安慰。也许我甚至会结婚；我变得有多“大”是无法隐藏的，女孩们似乎都想看看我长袍下藏着什么。无论如何，再见了，“勇者”。]");
         doNext(playerMenu);
      }
      
      public function endThisMadness() : void
      {
         clearOutput();
         outputText("你一拳砸在墙上，对着这两个出轨的婊子大发雷霆。她们真的以为你不会注意到她们背着你乱搞吗？你告诉她们，不，这不会让事情变得更好，你怒视着艾米莉，告诉她她的借口糟透了。你转向乌尔塔，大喊她需要思考，不要再让她的鸡巴牵着她走了。他妈的，她简直和野外的怪物一样糟糕！[pg]");
         if(Utils.rand(2) == 0)
         {
            outputText("[say: [name]，我这么做是为了你！我太爱你了，所以我努力去了解你喜欢乌尔塔什么！]艾米莉哭喊道。她的脸红了，不是因为羞愧，而是因为愤怒，她的脾气爆发了。她居然说：[say: 一切，这一切，都是因为我希望事情对你来说是完美的！为了我们！你……你……混蛋！][pg]");
            outputText("老鼠从你身边跑过，消失在夜色中。不知为何，你知道你再也见不到她了。[pg]");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,43,0);
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,168,1);
         }
         else
         {
            outputText("乌尔塔怒视着你，挺直了身子，明显清醒了许多，她的眼睛里似乎燃起了愤怒的翠绿色火焰。狐狸嘀咕道：[say: 你用甜言蜜语和感情诱惑了我们俩，现在我们在一起了，意识到我们也可以相爱，你居然有脸指责我们出轨？你这个白痴！这都是为了你！这是我们在学习像爱你一样爱彼此，这样我们就能让我们三个人都幸福。][pg]");
            outputText("愤怒的狐狸娘从墙上的挂钩上抓起她的衣服，溜出门外，气得根本不在乎自己正光着身子。[say: 我不会再给你添麻烦了。离我远点。][pg]");
            urtaLove(-100);
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,30,-1);
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,12,-1);
         }
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,346,3);
         outputText("你耸了耸肩。好吧，这件事算是告一段落了。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function cheatingSloots() : void
      {
         clearOutput();
         outputText("你一脚踢开门，咆哮道：[say: 这他妈的是怎么回事！？]艾米莉和乌尔塔都转过头来，用困惑的表情看着你，然后情况的严重性才渗入她们被酒精麻痹的意识中。几乎同时，她们大喊：[say: [name]！]然后醉醺醺地跌跌撞撞地分开，把彼此的粘液漏得满地都是。乌尔塔含糊不清地说：[say: 我们不是故意的……它只是……发生了……][pg]");
         outputText("你咆哮着转向艾米莉，她小声地吱吱叫着：[say: 我以为……我以为如果我更了解她*嗝*我就能找到一种方法来挽救我们所拥有的……*打嗝*我真的喝醉了，但我以为……你知道，如果我也愿意和她上床，我们就能一起幸福了。][pg]");
         outputText("好吧，这只老鼠可能说得有道理。你可以让她们互相了解，也许以后还能发展成三人行，或者你现在就坚决制止。如果你现在就制止，很有可能会惹恼她们中的一个。");
         menu();
         addButton(0,"顺其自然",letTheSlootsFuck);
         addButton(1,"结束这一切",endThisMadness);
      }
      
      public function catchRathazulNapping() : void
      {
         clearOutput();
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,84,FlagDict_Impl_.arrayReadInt(_loc1_,84) + 1);
         outputText("拉萨祖尔和乔乔看起来正在进行某种深度的冥想，所以你退后了。这两只啮齿动物闭着眼睛盘腿坐在两块平坦的岩石上，正在反思着什么。空气中静得可怕，直到一声响亮的鼾声从这只老鼠" + (get_noFur() ? "" : "的口鼻处") + "传出。他睡着了！乔乔睁开一只眼睛，叹了口气：[say: 老人家总是会睡着。][pg]");
         outputText("这只老鼠静静地站起身，走到离熟睡的老鼠相当远的地方，让他的长辈休息。他示意你跟上，让拉萨祖尔安静地待着。");
         doNext(get_jojoScene().jojoCamp);
      }
      
      public function blameAmilysDumbMouseCunt() : void
      {
         clearOutput();
         outputText("你转向艾米莉，直截了当地告诉她，错的人是她。她声称自己是一个纯洁的人，没有受到这个世界上任何腐化的影响，并乞求你的帮助，但相反，她欺骗了你，引诱你对你的爱人玛布尔不忠，并把你变成了她的种马和玩物——然后她居然还有脸试图声称你和她之间有什么联系，而这不过是她的欺骗和谎言。听到这番长篇大论，艾米莉先是看起来很受伤，然后是愤怒，接着是暴怒；只有当玛布尔默默地、挑衅地站在你身边，拿着她的锤子准备冲锋时，这个雌性鼠人才把手从她的刀柄上移开。她强忍着泪水，开始尽可能快地在营地里跑来跑去，收拾起她所有为数不多的财物，然后尽可能快地向营地边缘跑去。她在边缘停了下来，转过身来面对你们两个，开始尖叫着说出一连串她能想到的最恶毒的脏话，用关于你的性癖、习惯和技巧、你的血统、你的个人卫生和你的天赋的诅咒来折磨你们的耳朵，然后消失在灌木丛中，而你们俩都被这一连串的脏话惊呆了，试图理解她所说的一些事情。特别是关于油腻的蛆虫、半人马种马、糖苹果和柱塞的那个。很明显，她再也不会回来了。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,43,0);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,36,1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function beAPimpMarbleLovesIt() : void
      {
         clearOutput();
         outputText("你依次看着她们俩的眼睛，然后回答道：[say:拜托，女孩们，我一个人就足够满足你们俩了！]");
         if(get_player().hasPerk(PerkLib.MarblesMilk))
         {
            outputText("玛布尔眨了眨眼，然后说道：[say:[name]，再给你一次机会，我知道你不会这么混蛋的。]你也眨了眨眼作为回应，心里纳闷自己到底是中了什么邪才会说出那种话。[pg]");
            menu();
            addButton(0,"保持沉默",marbleIsPissyAndYourTooDumbToTalk);
            addButton(1,"解释",LucyYouGotSomeSplainingToDo);
         }
         else
         {
            outputText("她们俩只是盯着你看了好几分钟，对你的话感到难以置信，似乎谁也没想到你会这么说。最后艾米莉结结巴巴地说：[say:我……什么，怎么会？这和我们在我村子里的表现完全不一样。]你给了她一个迷人的微笑，说道：[say:嘿，宝贝，我说的每一个字都是认真的，看看我！像你们这样的两个女孩，我轻松就能搞定。]玛布尔用极其怪异的眼神看着你，然后说道：[say:看来你是活腻了，]接着她举起了锤子准备攻击。艾米莉也同样举起了她的吹箭筒。[pg]老鼠恳求道：[say:[name]，请告诉我你只是在开一个恶劣的玩笑。][pg]");
            menu();
            addButton(0,"认真的",srslyPimpinGuyz);
            addButton(1,"开玩笑",jokeAboutPimpularness);
         }
      }
      
      public function beADickToAmily() : void
      {
         clearOutput();
         outputText("你带着邪恶、欠揍的笑容，嘲笑艾米莉掉进了她自己设下的陷阱。她的表情变得僵硬，每次你大笑时，宿醉的头痛都会让她皱起眉头。[pg]");
         outputText("[say: 去-去你的，[name]，]她终于反击道。[say: 你也干了同样该死的事。][pg]");
         outputText("你告诉她这<b>正是</b>你笑的原因；她可能表现得纯洁专一，像个完美的小妻子，但当面对乌尔塔那样坚硬准备就绪的肉棒时，她的双腿就像其他婊子一样张开了。[pg]");
         outputText("[say: 简直是放屁！]她气呼呼地说，一手捂着头跳了起来。[say: 我没必要受你这气，混蛋！你有没有停下来想过，我爱上乌尔塔是因为她谦逊善良，并且试图理解我的感受？当我因为这件事去找她时，她对我只有耐心，即使我冲她发火！她甚至原谅了<b>你</b>把我当成秘密，玛莱知道<b>你</b>是个什么垃圾！你知道吗？我很高兴我做了这一切。因为现在我知道我还有别的地方可以去，去见另一个体面的人。我要离开你。][pg]");
         outputText("说完，艾米莉抓起手边最近的装备，用她能做出的最潇洒的姿态从你身边挤过去，向沙漠走去。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,346,3);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,43,0);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,168,1);
         doNext(playerMenu);
      }
      
      public function askAboutAmilyPt2() : void
      {
         clearOutput();
         outputText("艾米莉结束了亲吻，给了乌尔塔一个醉醺醺的深情微笑，温柔地抚摸着她的脸颊。[say: 嗯……我希望[name]能早点介绍我们认识……我觉得我们会成为好朋友的，]她含糊不清地说。乌尔塔只是点点头，给了她一个傻乎乎的笑容，但显然心不在焉。老鼠立刻打了个哈欠，把现在空了的瓶子扔到地板上，闭上眼睛依偎在乌尔塔身上，乌尔塔紧紧地抱着她，也睡着了。[pg]");
         outputText("伴随着一声轻叹，你关上门，让她们睡个好觉。虽然你无法预测她们醒来后是否会对此事如此宽宏大量，但现在看来，她们似乎都不打算为了你而宣战。");
         dynStats(DynStat.Lust(75));
         doNext(get_camp().returnToCampUseOneHour);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,346,2);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,350,1);
      }
      
      public function askAboutAmily() : void
      {
         clearOutput();
         if(get_game().time.hours > 14)
         {
            outputText("你问聚集在酒吧里的顾客，有没有人看到一个奇怪的鼠女或乌尔塔在附近，但没有得到太多回应。一个在吧台喝酒的猫娘男孩吞吞吐吐地建议说，他可能在今天早些时候注意到过类似的人，但那是在乌尔塔上班之前。你感谢他提供的信息。");
            doNext(get_game().telAdre.barTelAdre);
            return;
         }
         outputText("你问聚集在酒吧里的顾客，有没有人看到一个奇怪的鼠女或乌尔塔在附近。稀疏的早晨人群几乎一致地指向后面的房间。当你靠近时，你听到其中一个房间里传来砰砰砰的撞击声……[pg]");
         outputText("在困惑和松了一口气的复杂情绪中，你意识到那不是暴力的声音。[pg]");
         outputText("[say: 嗯……是的，你*打嗝*太棒了！] 你听到乌尔塔吃力地呻吟着。[pg]");
         outputText("伴随着这声音的是一阵叽叽喳喳的尖叫，你清楚地认出那是艾米莉的声音。[say: 哦哦哦……我明白为什么[name]——是的，把你的全部都给我！——会爱上你了！][pg]");
         outputText("出于好奇，你轻轻推开门。在里面，你看到乌尔塔和艾米莉都一丝不挂，坐在靠墙的一张软垫沙发上。好吧，是乌尔塔坐在那里；艾米莉跨坐在她的腿上，乌尔塔粗壮的肉棒清晰可见地塞进了她的花穴里，伴随着");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) > 0)
         {
            outputText("她的" + get_amilyScene().amilyCock() + "半勃起着，流着先列腺液，而且");
         }
         outputText("她的肚子被狐狸兽人惊人的精液量撑得鼓鼓的，看起来");
         if(get_amilyScene().pregnancy.get_event() >= 3)
         {
            outputText("几乎像是有");
         }
         outputText("双倍的孕肚。这只老鼠手里拿着半瓶你觉得是朗姆酒的东西，一边在乌尔塔的腿上上下颠簸，一边热情地在空中挥舞着酒瓶，试图从这个明显被榨干的双性人身上再哄出最后一次高潮。她高兴地咯咯笑着，从瓶子里豪饮了一口，把一些酒洒在了她的" + get_amilyScene().amilyTits() + "上，然后转过身，草率地吻了乌尔塔，试图把嘴里的东西喂给狐狸，但有一半都顺着她的脖子流了下来。[pg]");
         outputText("你是要让她们互相了解（并且将来可能会有三人行的机会），还是闯进去阻止这两个出轨的荡妇？");
         menu();
         addButton(0,"随她们去",askAboutAmilyPt2);
         addButton(1,"打断",cheatingSloots);
      }
      
      public function amilyUrtaSexWatch() : void
      {
         clearOutput();
         outputText("你告诉她们，这次你只想在旁边看着。你走到沙发的一端坐下，向后靠着，等待她们开始。[pg]");
         outputText("乌尔塔深吸了一口气，然后慢慢呼出。[say: 我不太习惯在有观众的情况下做这种事……但尝试一下也许会很有趣，]她宣称道。你可以看到，面对这个前景，她的勃起并没有缩小。[pg]");
         outputText("[say: 我……不太确定我们要怎么做，]艾米莉说道，尽管她的下唇已经聚集了湿润的液体，但她还是有些犹豫。[pg]");
         outputText("你只是微笑着向她们保证，她们会做得很好的；你告诉她们，就当你不在这房间里，顺其自然就好。[pg]");
         outputText("乌尔塔对这老套的建议翻了个白眼，但还是转过身面对艾米莉。[say: 好吧，好吧……来吧，小老鼠……我相信你知道什么东西该放进哪里。]她微笑着说，并给了这只老鼠一个友好的眨眼。[pg]");
         outputText("艾米莉回以微笑，走近乌尔塔，在她的嘴唇上轻轻啄了一下，并温柔地抚摸着她的肉棒。[pg]");
         outputText("乌尔塔呻吟着，忍不住摸索着艾米莉的" + get_amilyScene().amilyTits() + "。[say: 让我先坐下，小老鼠；我从来不喜欢站着做爱。]她慢慢地坐到地上，然后把艾米莉拉到她的腿上，漫不经心地用她的母马肉棒在艾米莉的躯干上摩擦");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) > 0)
         {
            outputText("，顺着她阴茎的底部向上，");
         }
         outputText("并在她的" + get_amilyScene().amilyTits() + "之间摩擦。[pg]");
         outputText("艾米莉将她的乳沟顺着乌尔塔的长度滑下，温柔地舔了一下她膨大的龟头，然后起身");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) > 0)
         {
            outputText("，一滴先列腺液拉成一条丝，连接着她们两人的肉棒");
         }
         outputText("。艾米莉跨坐在乌尔塔身上，将那根粗大的马屌对准自己湿润的小穴，调戏道：[say: 准备好了吗，小狐狸？] 她的目光飞快地瞥了你一眼。[pg]");
         outputText("你只是温柔地微笑着，注视着乌尔塔。她艰难地咽了口唾沫，舌头因期待而伸了出来，随后才回过神来。[say: 随时奉陪，小老鼠；如果你能吃得下的话。] 她显然在努力表现得大胆些——也许你的存在比你想象的更让她感到不安。[pg]");
         outputText("艾米莉又飞快地瞥了你一眼，然后顺着重力，将自己穿刺在乌尔塔的马屌上；突如其来的侵入让她发出了夹杂着痛苦与欢愉的尖叫。乌尔塔发出一声愉悦的轻哼，所有的注意力都从你身上转移，集中在紧紧包裹着她肉棒的女性褶皱上。[say: 你没事吧？] 她问道，担忧的神色掩盖了任何愉悦的表现。[pg]");
         outputText("[say: 没、没事，给我点时间适应一下，] 艾米莉回答道，她弯下腰，双手撑在地上支撑着自己，气喘吁吁的嘴唇危险地靠近了乌尔塔的嘴唇。显然太近了，当她这样做时，乌尔塔忍不住吻了她的鼠娘恋人。艾米莉回吻着她，在她们开始亲热时，双乳互相摩擦；艾米莉的臀部开始在乌尔塔的肉棒上缓慢地上下移动，进入了一种缓慢的节奏。没过多久，房间里就充满了压抑的尖叫和呻吟声，以及肉棒和小穴湿润摩擦的声音。[pg]");
         outputText("乌尔塔喘息着、低吼着，很容易就进入了状态，她将那根又长又粗的肉棒挺进鼠娘那令人惊讶地具有弹性的阴户中。好吧，如果她代表了她们种族承受巨大插入物的能力，你现在很清楚为什么恶魔想要奴役她的人民了……[pg]");
         outputText("艾米莉结束了亲吻，向天花板伸出手，在迎合乌尔塔的每一次抽插时，大声表达着她的愉悦。她的目光转向你，用纯粹、不加掩饰的欲望看着你；为你表演的想法将她带入了一个全新的愉悦境界；这个鼠娘显然有暴露癖！乌尔塔的舌头伸了出来，开始哼唧和喘息。你能看出来，她很快就要高潮了……[pg]");
         outputText("艾米莉尖叫着、呻吟着，当她完全将自己穿刺在乌尔塔入侵的肉棒上时，她被撑开的小穴紧紧地夹住。乌尔塔再也受不了了；当她苹果大小的蛋蛋肉眼可见地收缩时，她竟然高兴地叫出了声，将一股精液爆炸般地射入你鼠娘恋人等待着的子宫里。[pg]");
         outputText("艾米莉尽其所能地榨取乌尔塔的每一滴精华，甚至当她的肚子因为母狐狸精液的体积而膨胀时也是如此。作为回报，乌尔塔试图将她拥有的一切都给艾米莉，她的双手紧紧抓住艾米莉膨胀的肚子，像抱着怀了孤独长屌母狐狸孩子的孕肚一样抚摸着它。但是，即使是乌尔塔也有她的极限，很快，最后一股精液喷溅进艾米莉的深处，乌尔塔的肉棒疲软下来，将她的情欲倾泻在恋人身上。[pg]");
         outputText("伴随着一声叹息和一个微笑，艾米莉瘫倒在乌尔塔身上，心满意足。在拥抱喘息的母狐狸休息并享受余韵之前，她的目光最后一次瞥向你。[pg]");
         outputText("此时，你确实感到非常兴奋，但你不忍心打扰她们。相反，你只是再次咧嘴一笑，留下她们恢复体力。");
         dynStats(DynStat.Lust(50));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function amilyUrtaSex() : void
      {
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,350,2);
         clearOutput();
         outputText("你带着会意的坏笑，问艾米莉去见乌尔塔，也许和她找点乐子感觉怎么样。鼠娘羞得满脸通红，但你能从她的肢体语言中看出渴望。[say: 好吧，当然；我有点喜欢去城里……而且，你我之间？我觉得乌尔塔需要她能得到的所有朋友……从没想过我会同情一个双性人。]最后这部分是她自言自语，但你还是能听到。");
         if(!get_player().isPureEnough(50) && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,45) > 0)
         {
            outputText("私下里，你觉得这是放屁；她除了自怜<b>什么都不是</b>。");
         }
         outputText("[pg]");
         outputText("你打了个手势，你们俩出发了。一穿过城门，你们就直奔湿身婊酒馆。果然，乌尔塔在她常坐的桌子旁，看到你她高兴地笑了。[say: [name]，艾米莉，你们好！]你们在同一张桌子旁坐下，而她");
         if(!urtaLove())
         {
            outputText("因为勃起的肉棒撞到桌子发出沉闷的响声而微微脸红");
         }
         else
         {
            outputText("侧过身子，让她的裙子像帐篷一样撑起，以免撞到桌子");
         }
         outputText(".[pg]");
         outputText("艾米莉羞涩地对狐狸笑了笑，但显然无法开口说出你来这里的目的。于是，你决定自己来处理。你心领神会地笑了笑，把手伸到桌子底下，抚摸着乌尔塔兴奋勃起的阴茎。[say: 我在想我们可以骑这匹小马兜兜风。你觉得呢？]你调皮地问道。[pg]");
         outputText("乌尔塔的脸上闪烁着饥渴的喜悦，她立刻站起身，匆匆走向后面的一个房间。艾米莉也站了起来，满脸羞红，迅速跟了上去，而你则走在最后。[pg]");
         outputText("当你们三个来到一个空房间时，你锁上了身后的门。乌尔塔和艾米莉都脱光了衣服，用同样的注意力打量着彼此和你。[say: 那么……你要加入吗？还是只看着？]艾米莉犹豫地问道。");
         menu();
         if(get_player().hasCock())
         {
            addButton(0,"用肉棒",get_amilyScene().threesomeAmilUrtaCAWKS);
         }
         else
         {
            addButtonDisabled(0,"用肉棒","这个场景需要你有一根肉棒。");
         }
         if(get_player().hasVagina())
         {
            addButton(1,"用小穴",get_amilyScene().urtaXAmilyCuntPussyVagSQUICK);
         }
         else
         {
            addButtonDisabled(1,"用小穴","这个场景需要你有一个小穴。");
         }
         addButton(3,"观看",amilyUrtaSexWatch);
      }
      
      public function amilyUrtaReaction() : void
      {
         clearOutput();
         outputText("当你快要回到营地时，艾米莉从一块岩石后面突然出现，给了你一个惊喜，她双臂交叉在胸前。[say: 嘿，还记得你跟我说过沙漠里的那座城市吗？我决定去看看。] 你不记得了，但你太忙于消化这些话的含义，以至于无法回答。[say: 你绝对猜不到我听到了什么！似乎有人看到一个和你一模一样的人和他们的一位知名市民在一起，] 她继续说道。[say: 我不能说我没预料到会发生这种事。我的意思是……她不是什么恶魔，对吧？不过……我以为我们之间有些特别的东西，[name]。] 当你试图组织语言回答时，她抓住自己的尾巴，若有所思地在手里扭动着，已经决定了她的下一步行动。[say: 我-我必须见见她……看看你到底看上了她哪一点。][pg]");
         outputText("艾米莉在你反应过来之前就跳出了营地，抽泣着消失在远方。由于这片被诅咒的土地的特性，她几乎立刻就从视线中消失了。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,346,1);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,347,0);
         doNext(playerMenu);
      }
      
      public function amilyUrtaMorningAfter() : void
      {
         outputText("[pg]当你离开床铺时，你看到一只看起来相当憔悴的老鼠在她的窝里不安地摊开四肢。艾米莉回来了，显然正遭受着严重宿醉的折磨。你同情地拿来一个水袋，举在她的上方，好让她能接过去。她睁开一只惺忪的眼睛，茫然地盯着你看了一会儿，然后视线聚焦，一把抓过水袋，大口大口地喝水，更多的水洒在了她明显疼痛的头上。你问她还好吗。[pg]");
         outputText("[say: 呃……我还死不了，]她呻吟着，让最后一点水流到自己身上。[say: 哇……哦……对了。关于乌尔塔的事。我还是希望你能早点告诉我，不过……没关系。][pg]");
         outputText("你等她放松下来，然后故作漫不经心地补充说，看起来她们俩已经很友好地解决了问题。听到这话，艾米莉显得惊慌失措，恐惧和尴尬在她的脸上交织。[say: ……你看到了？]她勉强脱口而出。[say: 呃……呃……对不起，]艾米莉嘟囔着，惊慌依然明显。[say: 我的意思是……]鼠娘的声音渐渐变小，看着你寻求安慰。你该怎么做？");
         menu();
         addButton(0,"友善",smileAndNodToAmilyXUrta);
         addButton(1,"混蛋",beADickToAmily);
      }
      
      public function amilyMeetsPureJojo() : void
      {
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,74,FlagDict_Impl_.arrayReadInt(_loc1_,74) + 1);
         clearOutput();
         outputText("艾米莉似乎找到了乔乔，他们俩居然抱在了一起！这只母老鼠在哭，乔乔看起来也有些眼泪汪汪。当你走近时，他们分开了；突然，艾米莉一记右勾拳打在乔乔脸上！他踉跄着后退，揉着下巴，而她大喊道：[say: 这是为了你没有回村子找我！哦，当然，你可以在森林里和恶魔战斗好几年，但玛莱保佑你别回来找幸存者！][pg]");
         outputText("乔乔脸红了，比你见过的任何时候都要红。他试图解释，[say: 对不起……恶魔太多了，在他们离开之前我不敢回去。如果他们抓住我——] 但他停了下来，因为难以抑制的恐惧而颤抖着。[pg]");
         outputText("艾米莉叹了口气，再次抱住他，[say: 你真是个胆小鬼。你知道吗，乔乔？但我很高兴[name]让我们重聚，这样我们就能再次相见了。][pg]");
         outputText("乔乔回答道，[say: 我也是，] 然后他注意到了你，咳嗽了一声。艾米莉退后一步，对你露出一个灿烂的、露出龅牙的笑容。她冲进你的怀里，给了你一个吻，然后跑开了。乔乔看起来有些尴尬，挠了挠耳朵，努力让自己平静下来。[pg]");
         dynStats(DynStat.Lust(5));
         doNext(get_jojoScene().jojoCamp);
      }
      
      public function amilyIsPissedAtYouForRuiningJojo() : void
      {
         clearOutput();
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,76,FlagDict_Impl_.arrayReadInt(_loc1_,76) + 1);
         outputText("你呼唤你的私人性奴来满足你的需求，但他没有回答。你再次呼唤，这只老鼠依然没有出现。你有些恼火，站起身走向树林。在树林边缘，你找到了乔乔。他昏迷不醒，正在地上抽搐，屁股上插着一根飞镖。你从他" + (get_noFur() ? "" : "毛茸茸的") + "脸颊上拔下那根带有麻醉剂的飞镖，仔细检查。这是艾米莉的！[pg]");
         outputText("[say: 你对他做了什么！？]她尖叫道。她就在你身后！你转过身，祈祷这只愤怒的老鼠不要用同样的飞镖击中你，你看到艾米莉半藏在一块岩石后面。她颤抖的手里紧紧抓着吹箭筒，悲痛地抽泣着。看来她发现了……[pg]");
         outputText("艾米莉尖叫道，[say: 别想撒谎！在你对他做这些之前我见过他，他在昏迷前告诉我就是你干的！我们……我们必须治好他。我不知道你为什么要这么做，但他——他崩溃了。彻底崩溃了。求求你。找些纯净的蜂蜜，我们就能治好他！][pg]");
         outputText("（你站在十字路口。你可以帮助艾米莉净化乔乔，但这只老鼠可能再也不会给你机会腐化他了。或者，你可以让这个婊子滚蛋，保留你最喜欢的性奴。）");
         menu();
         addButton(0,"治好他",agreeToHelpAmilyFixJojo);
         addButton(1,"滚蛋",tellAmilyToFuckOffRuinedJojo);
      }
      
      public function amilyIngredientDelivery() : void
      {
         clearOutput();
         outputText("当你前往拉萨祖尔的实验室时，一个");
         if(!get_amilyScene().amilyFurry())
         {
            outputText("大耳朵的模糊身影从你身边呼啸而过");
         }
         else
         {
            outputText("毛茸茸的模糊身影从你身边呼啸而过");
         }
         outputText("。艾米莉抱着满满一怀的花草和其他材料冲进了老鼠的实验室。拉萨祖尔说，[say: 谢谢你，孩子——这些会帮大忙的。幸好你知道去哪里找这些东西。购买它们既困难又昂贵。][pg]");
         outputText("艾米莉高兴地点点头，拉萨祖尔把手伸进长袍里说，[say: 这是答应给你的报酬，]然后递给她一本古老的炼金术书籍。她高兴地尖叫着从你身边跑过，她的尾巴在你的腰上卷了一下，然后就消失了。[pg]");
         dynStats(DynStat.Lust(4));
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,82,FlagDict_Impl_.arrayReadInt(_loc1_,82) + 1);
         doNext(get_game().rathazul.returnToRathazulMenu);
      }
      
      public function amilyDiscoversJojoWithTentaclesAndShitOhBoy() : void
      {
         clearOutput();
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,81,FlagDict_Impl_.arrayReadInt(_loc1_,81) + 1);
         outputText("你安顿下来，准备和你的触手老鼠好好干一炮，但你的宠物没有回应你的呼唤。你烦躁地咆哮着，向树林走去，寻找你那被腐化的性玩具。没过多久。乔乔的身体脸朝下趴在泥土里，昏迷不醒。你可以看到他的臀部微弱地抽动着，他那渗着精液的触手互相交媾着。他的脖子上插着一支飞镖，你怀着极大的恐惧，从这只恐怖的啮齿动物身上拔出了这件带针尖的武器。这是艾米莉的！[pg]");
         outputText("[say: 你对他做了什么！？]她尖叫道。她就在你身后！你转过身，祈祷这只愤怒的老鼠不要用同样的飞镖击中你，你看到艾米莉半藏在一块岩石后面。她颤抖的手里紧紧抓着吹箭筒，悲痛地抽泣着。看来她发现了……[pg]");
         outputText("艾米莉尖叫道：[say: 别想撒谎！在你对他做这种事之前我就见过他了，而且他在昏迷前告诉我就是你干的！你是个怪物！你怎么能在背着我扭曲我的同类的同时，还假装帮我完成任务！？你是不是也打算对我做同样的事？“只要等艾米莉放松警惕，就把她和她所有的孩子都变成长着触手的小穴，让你操。”去你的！][pg]");
         if(!get_player().isPureEnough(66))
         {
            outputText("你对她竖起了中指。反正她也是个烂货。艾米莉的眼里涌出了泪水，但她的表情却因愤怒而变得僵硬。老鼠大喊：[say: 好像我愿意和你这种恶魔待在一起似的！] 她转过身，向远处跑去。就在你快要看不见她的时候，艾米莉停了下来，回头看了看，眼里含着泪水。你彻底伤透了她的心。她又开始跑起来，永远地从你的生活中消失了。与此同时，乔乔开始动弹了。看来他很快就能为你服务了……[pg]");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,43,0);
            outputText("毫无疑问，她跑回了废墟。也许你可以收集一些合适的药物来教训她一下？");
            if(get_player().get_inte() >= 45)
            {
               outputText("地精麦酒和催情药剂应该能派上用场。");
            }
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,43,0);
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,168,1);
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,36,0);
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,44,1);
            dynStats(DynStat.Cor(5));
            doNext(playerMenu);
         }
         else
         {
            outputText("这下糟了。你可以试着解释乔乔的遭遇只是你在克服腐化前的一时软弱，但从她的眼神来看，她宁愿杀了乔乔，也不愿让他继续以这种可悲的状态活下去。或者，你可以坚持你腐化乔乔的选择，但你必须让艾米莉离开，这样她就不能伤害乔乔了。对她竖中指也许能起作用。");
            menu();
            addButton(0,"解释",aerisDies);
            addButton(1,"竖中指",AmilyLeavesBirdJojoTentacles);
         }
      }
      
      public function amilyAsksAboutRathazulsVillage() : void
      {
         clearOutput();
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,82,FlagDict_Impl_.arrayReadInt(_loc1_,82) + 1);
         outputText("艾米莉再次来到拉萨祖尔的实验室。她刚刚问完他的村庄发生了什么事。拉萨祖尔一想到这件事，脸上就布满了愤怒的阴云。他缓慢而谨慎地解释道，[say: 我们被出卖了。我们的长老知道我们无法通过武力取胜，他们没有加入其他人，而是出卖了我们，以换取议会的安全。恶魔给了长老们腐化的药剂，让他们掺入村庄的井里，我的人民在一夜之间就成了恶魔的猎物。长老们得到了奖赏，被“提升”为完全的恶魔。我活了下来，因为我当时在湖边。那场狂欢的声音足以警告我躲起来。我忍不住想，如果掌权的老鼠不那么自私，事情可能会有所不同。][pg]");
         outputText("拉萨祖尔叹了口气，不自在地挪动着脚步，总结道，[say: “如果”对我们没有任何帮助。我们的村庄已经没了，我们必须展望未来，孩子。][pg]");
         outputText("艾米莉庄重地点点头，道了别。当你经过她身边时，她看起来有些眼泪汪汪，你安慰地捏了捏她的肩膀。老鼠给了你一个勉强的微笑，继续走开了，留下你和老鼠单独在一起。");
         doNext(get_game().rathazul.returnToRathazulMenu);
      }
      
      public function agreeToHelpAmilyFixJojo() : void
      {
         get_jojoScene().jojoSprite();
         clearOutput();
         outputText("你点点头，");
         if(get_player().cor < 33)
         {
            outputText("对自己的所作所为感到由衷的抱歉。");
         }
         else if(get_player().cor < 66)
         {
            outputText("不确定自己的选择是否正确。");
         }
         else
         {
            outputText("心想这会不会只是为了安抚这只愤怒的母老鼠而许下的空头支票。");
         }
         outputText("你说道：[say: 好吧，等我找到纯净蜂蜜，我就带给你，我们一起治好他，好吗？我不知道自己怎么了；这个地方的腐化……影响了我。我们一起治好他。][pg]");
         outputText("她流着泪点点头，并承诺道：[say: 在这件事情解决之前，别指望我为你做任何事。][pg]");
         dynStats(DynStat.Cor(-5));
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,77,1);
         doNext(playerMenu);
      }
      
      public function aerisDies() : void
      {
         clearOutput();
         outputText("艾米莉起初面无表情地听着，但随着你解释情况，她开始有点理解你了。她走到你身边，在你的脸颊上亲了一下，解释道：[say: 没办法治好他了。已经发生的事，任何魔法或物品都无法挽回。我必须让他解脱，阻止他腐化其他东西。][pg]");
         outputText("(艾米莉要杀了乔乔。你该怎么办？)");
         menu();
         addButton(0,"阻止她！",stopJojoDeathInTheNameOfLove);
         addButton(1,"随她去",whyWouldDoThis);
      }
      
      public function TellRathazulJojoIsHarmless() : void
      {
         get_jojoScene().jojoSprite();
         clearOutput();
         outputText("你向拉萨祖尔解释道：[say: 那只是乔乔。他被搞得很惨，希望我能让他操我。那只小老鼠很好对付，没什么好担心的。][pg]");
         outputText("拉萨祖尔对你的声明感到有些难以置信，他问道：[say: 我们能拿他怎么办吗？他很令人毛骨悚然。][pg]");
         outputText("你不屑地哼了一声，回答道：[say: 没关系。他对你不感兴趣——他想要的是我，除非我决定让他得逞，否则他休想从我这里得到任何东西。][pg]");
         outputText("谈话结束后，拉萨祖尔走开了，嘴里嘟囔着：[say: 哦，天哪，不……]");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function LucyYouGotSomeSplainingToDo() : void
      {
         clearOutput();
         outputText("你花了一些时间试图向她们两个解释，为什么你从未告诉过她们彼此的存在。");
         if(get_player().get_inte() > 50)
         {
            outputText("你立刻意识到，这种情况并不是你随便说几句就能糊弄过去的。你开始告诉她们两个，你为什么喜欢她们，为什么和她们在一起。你告诉玛布尔，艾米莉渴望繁衍她的族人；你告诉艾米莉，玛布尔渴望找到一个伴侣，以及她的种族带来的困难。在你的谈话结束时，她们两个只是互相看着对方。过了一会儿，艾米莉说，[say: 所以，你被腐化了，是吗？我觉得你看起来还挺不错的……] 玛布尔回答说，[say: 你自己也很可爱，小老鼠，而且你确实需要一个人，理由也很充分。真正的问题是，[name] 之前没有让我们两个互相谈谈。] 然后她们两个转过身来，用恶狠狠的眼神看着你。看起来在接下来的一段时间里，你的日子不会太好过，但至少她们似乎并不讨厌对方。");
            FlagDict_Impl_.arrayWriteFloat(KFLAGS.flags,3,-100);
            doNext(get_camp().returnToCampUseOneHour);
            return;
         }
         outputText("过了一会儿，你和其他人都很明显地感觉到，你根本不知道自己在说什么。玛布尔然后对你说，[say: 好了，你还有什么要说的吗？] 在这个时候，可能已经无法说出让她们两个都高兴的话了，你是要保持沉默，还是背叛其中一个来试图留住另一个？[pg]");
         menu();
         addButton(0,"保持沉默",marbleIsPissyAndYourTooDumbToTalk);
         if(get_player().hasPerk(PerkLib.MarblesMilk))
         {
            addButtonDisabled(1,"责怪玛布尔","因为你需要玛布尔的奶水才能活下去，所以你不可能责怪她。这无异于自杀。");
         }
         else
         {
            addButton(1,"责怪玛布尔",BlameMarblezSweetVagoozle);
         }
         addButton(2,"责怪艾米莉",blameAmilysDumbMouseCunt);
      }
      
      public function BlameMarblezSweetVagoozle() : void
      {
         clearOutput();
         outputText("你转向玛布尔，直截了当地告诉她，你对艾米莉不忠是她的错。你开始大声抱怨玛布尔的奶水是如何影响你的，以及你是如何因为上瘾而失去意志力的。你继续说她是如何利用它来得到她想要的东西，以及她是如何没有警告你喝了它会发生什么。听到这里，艾米莉跑到你身边，看着你的眼睛看了一会儿，然后转过身对玛布尔说，[say: 这是真的吗？] 玛布尔看着你，看了一会儿，好像要爆炸了一样，然后说，[say: 你真的是这么看我的吗？你怎么能一直对我撒谎到现在？！] 然后她转过身，几乎是机械地收拾她的东西");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,8) == 1)
         {
            outputText("和孩子");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,8) > 1)
         {
            outputText("和她的孩子们");
         }
         outputText("然后慢慢地走出了营地，没有回头看一眼。[say: 我要回农场了，我想我们以后还会见面的。][pg]");
         get_player().removeStatusEffect(StatusEffects.CampMarble);
         get_player().removeStatusEffect(StatusEffects.NoMoreMarble);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function AmilyLeavesBirdJojoTentacles() : void
      {
         clearOutput();
         outputText("你对她竖起了中指。反正她也是个烂货。艾米莉的眼里涌出了泪水，但她的表情却因愤怒而变得僵硬。老鼠大喊：[say: 好像我愿意和你这种恶魔待在一起似的！] 她转过身，向远处跑去。就在你快要看不见她的时候，艾米莉停了下来，回头看了看，眼里含着泪水。你彻底伤透了她的心。她又开始跑起来，永远地从你的生活中消失了。与此同时，乔乔开始动弹了。看来他很快就能为你服务了……[pg]");
         outputText("毫无疑问，她跑回了废墟。也许你可以收集一些合适的药物来教训她一下？");
         if(get_player().get_inte() >= 45)
         {
            outputText("地精麦酒和催情药剂应该能派上用场。");
         }
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,43,0);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,168,1);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,36,0);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,44,1);
         dynStats(DynStat.Cor(5));
         doNext(playerMenu);
      }
      
      public function AmilyIntroducesSelfToRathazul() : void
      {
         clearOutput();
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,82,FlagDict_Impl_.arrayReadInt(_loc1_,82) + 1);
         outputText("艾米莉正和那位年迈的啮齿动物炼金术士在一起，进行着相当深入的交谈。他们还没有注意到你，两人目前正在讨论玛瑞斯各种草药和材料的药用特性。当老鼠结束他关于小恶魔草功效的讲座时，艾米莉全神贯注地听着。她感谢他：[say: 我真的很感激，拉萨祖尔。我知道我们的部落从来没有意见一致过，但你做了很多。我父亲和你一样是个炼金术士，我知道他会很高兴知道有你这样的人继续教我这门手艺。][pg]");
         outputText("这位睿智的老鼠一边听着，一边抚摸着他那凌乱的胡须，显然对年轻啮齿动物的话感到高兴。[say: 这是我的荣幸。我很少能找到这么全神贯注、专心致志的听众，] 他回答道。[pg]");
         outputText("艾米莉给了他一个友好的拥抱，转身准备离开。当她看到你时，惊讶地吱吱叫了一声，然后气冲冲地走过来质问：[say: 你在那儿待了多久了？][pg]");
         outputText("你结巴了一下，直到她吻了你的嘴唇并笑道，[say: 没关系，我们刚刚结束了课程。去吧，我相信你和拉萨祖尔有重要的事情要办！][pg]");
         outputText("艾米莉离开了，留下你和炼金术士单独在一起。");
         dynStats(DynStat.Lust(5));
         doNext(get_game().rathazul.returnToRathazulMenu);
      }
   }
}

