package classes.scenes.npcs
{
   import classes.CoC;
   import classes.DynStat;
   import classes.Player;
   import classes.StatusEffects;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.display.SpriteDb;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.items.ConsumableLib;
   import classes.items.Weapon;
   import classes.scenes.Camp;
   import flash.Boot;
   import haxe.IMap;
   import haxe.ds.IntMap;
   
   public class MarblePurification extends NPCAwareContent
   {
      
      public function MarblePurification()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
      }
      
      public function voluntarilyChooseCowCuntBadEndYouBad() : void
      {
         var combat1:Boolean;
         var _g:MarblePurification;
         clearOutput();
         outputText("屈服于你的瘾所赋予你的欲望，你回到了克拉拉的乳房前，这让年轻的牛娘发出了愉悦的呻吟和叹息。[say: 啊，是的，真是个好[boy]，]她在你耳边低语。");
         menu();
         _g = this;
         combat1 = false;
         addButton(0,"继续",function():void
         {
            _g.loseToClara(combat1);
         });
      }
      
      public function visitRathazulToPurifyMarbleAfterLaBovaStopsWorkin() : void
      {
         clearOutput();
         if(!get_game().rathazul.followerRathazul())
         {
            outputText("你再次在湖边看到了那位年迈炼金术士的营地。[pg]");
         }
         outputText("当你走近这位鼠人炼金术士时，你想起了玛布尔的问题，决定问问他是否能帮上忙。等他向你打完招呼，你礼貌地回礼，并问他是否愿意就你的一个问题提供一些意见。");
         outputText("[pg][say: 一个问题？好吧，我现在不过是个疲惫的熬药老头，但我会尽力的，] 年迈的鼠人回答道。");
         outputText("[pg]你向他解释了玛布尔以及她和你的关系，讲述了你因为她那令人上瘾的乳汁而遇到的问题，以及她为了治愈自己所做的努力。拉萨祖尔露出沉思的表情，抚摸着他" + (get_noFur() ? "" : "长满毛发的") + "下巴。[say: 你说你试过用我为你净化的那些拉波娃？] 你给出了肯定的回答。[say: 嗯……我或许能做点什么来完成这项工作……但我需要先研究一下牛娘的乳汁。]");
         outputText("[pg]你微笑着感谢他提供的信息，然后转身回去找玛布尔，承诺会尽快带着她的一些奶回来。");
         if(!get_game().rathazul.followerRathazul())
         {
            outputText("[pg][say: 哇哦，等一下，[boy]，]拉斯叫住了你，[say: 听到你寻求净化的事，让我的心多年来第一次感到温暖。作为帮助你完成这项任务的交换，请允许我留在你的营地。我相信你会很乐意省去为了每一件小事来回奔波的麻烦。]");
            outputText("[pg]考虑到他在净化玛布尔方面提供的帮助有多么重要，你怀疑如果没有他的帮助，你是否还能取得进一步的进展，于是你同意让他留在你的营地。");
            outputText("[pg][say: 那让我收拾一下东西，然后你就可以带我去你的营地了。]这花不了多少时间，很快你们俩就到了你的营地。[say: 我来布置我的东西，你去和你的伴侣谈谈吧。]");
            get_game().rathazul.saveContent.campFollower = true;
         }
         menu();
         addButton(0,"下一步",pageTwoOfVisitingTheRatForMurblesPurification);
      }
      
      public function theFormulaIsDone() : void
      {
         clearOutput();
         get_marbleScene().marbleSprite();
         outputText("拉萨祖尔告诉你配方已经准备好了，于是你去找玛布尔告诉她这个消息。");
         outputText("[pg]你发现她坐在营地边缘一堵破败的矮石墙上，依然陷入沉思。你花了几秒钟才爬到她身边，在离她不远的地方坐下。她重重地叹了口气，摆弄了一下棕色的头发，然后继续她漫长的思考。直到你拍了拍她的肩膀，叫了她的名字，她才带着惊吓的表情转过头来。[say: 亲、亲爱的！]她惊讶地叫出声，抬头看着你，眼皮上还带着干涸的泪痕。你问她是否介意你坐在她旁边，她心不在焉地答应了。你们俩在沉默中坐了几分钟，她才鼓起勇气对你开口。");
         outputText("[pg][say: 那、那个，亲爱的，你的情况怎么样，你还好吗？]你向她保证你没事，这都是你以前处理过的情况。[say: 哦，那太好了，我一直很担心这个。]她看着你，勉强挤出一个微笑。[say: 我想拉萨祖尔现在已经完成药剂了吧？你是来接我的吗？]玛布尔正要起身，但你拦住了她，并抓住了她的手，因为你发现她的手抖得厉害，既是因为紧张，也是因为担忧。从她的脸上你可以看出，这位可怜的牛娘在强颜欢笑，掩饰着内心的痛苦，同时尽量不让你担心。");
         outputText("[pg]你平静地告诉玛布尔，你很确定如果她只是担心你的情况，她就不会一个人在这里想这么久。还有别的事情在困扰着她，一些她不想让你担心的事情。你在这里陪着她，就像她陪着你一样。你让她直接告诉你到底怎么了。");
         outputText("[pg]玛布尔勉强的笑容消失了，她的表情恢复了之前的沮丧，思考着该对你说些什么。眼看无法回避这个话题，她说道：[say: 说实话，亲爱的，你说得对，我一点也不好。]她犹豫了片刻，然后继续说道：[say: 哦，[name]，在这么短的时间里发生了这么多事，我满脑子都是这些。在克拉拉说了那些话之后，我真的不知道该怎么办了。]");
         outputText("[pg]你回想起克拉拉透露的一切，问玛布尔是不是关于她父母和她种族的事。[say: 是的，听到我父亲的瘾是什么样的，我母亲是如何利用它来操纵他的，我种族寻找伴侣的方法，最后想到我自己的本能和欲望，这一切就都说得通了。]");
         outputText("[pg]当她这么说时，你感到一种恐惧，但你告诉她继续说下去。[say: 嗯，首先，我真的不想相信爸爸训练我只是因为妈妈强迫他这么做。我一直以为爸爸想训练我是因为他担心我有一天会独自面对危险，尤其是随着这些年来腐化的蔓延。当我离开家时，我觉得他为我的能力感到骄傲。他训练我只是因为我妈妈强迫他，因为他需要她的奶水才能生存，这个想法直到今天我都不敢相信。]");
         outputText("[pg]你告诉她，即使那是真的，她父亲教她也是出于爱和关心。她不能否认她有一些关于她爸爸教她如何挥舞锤子的美好回忆。");
         outputText("[pg][say: 但是亲爱的，问题就在这里。你知道一个小女孩在巨锤击中东西后，要把它拿在手里有多难吗？无论我搞砸了多少次，爸爸对我有无限的耐心。我们训练时，妈妈总是在那里看着。有时当我在重击中掉下练习锤时，爸爸会紧张地回头看，舔舔嘴唇，深吸一口气，然后告诉我继续努力。]");
         outputText("[pg]她又吸了一口气，深深地叹了口气，然后用严厉的目光看着你。[say: 亲爱的，我想让你知道，我不同意克拉拉说的每一件事，但有些事情我无法否认。我看到了你沉迷于我时的样子，我知道那会产生什么样的影响。想想多年的这种沉迷会对一个人造成什么影响，这并不夸张。现在最让我困扰的是，我从来没有真正了解过我真正的爸爸。没有人能成为那么完美的父母。我所知道的只是我母亲通过她的奶水把他变成了什么样。]");
         outputText("[pg][say: 遇见你的那天，我觉得你是我见过的最可爱的人之一。在你帮我处理了乳房的问题后，我立刻就喜欢上了你。你花时间陪我，和我说话，和我一起工作，每天我对你的感情都变得更强烈。起初我没觉得那是爱，但我每天都期待着你的来访。] 听到她这么说，你露出了温暖的微笑，很高兴知道随着你们关系的发展，你们的感情是相互的。[say: 当你同意直接从我的乳房喝奶时，我太高兴了。能再次这样哺乳别人，并回想起我从中感受到的绝对幸福，让我非常开心。]");
         outputText("[pg][saystart]不幸的是，那段时间并没有持续多久，在我意识到之前，我已经让你上瘾了。");
         if(get_game().marbleScene.get_knowAddiction() == 1)
         {
            outputText("当你说你想依赖我的奶水时，感觉就像你给了我整个世界。然后，我突然掌握的对你的力量让我的本能发挥了作用，我开始变成像我妈妈一样的人。当你反抗时，感觉就像是一种背叛，但我对你的爱证明比那更强大。你阻止我永远离开的那天，当你向我表露你的感情，说你更在乎我而不是我的奶水时，我感觉棒极了，我对你的爱在那天完全绽放了。");
         }
         else
         {
            outputText("当你说你为什么不能依赖我的奶水时，所有我让其直接从我乳房喝奶的人的记忆一下子涌上心头，我不知道该怎么想。拯救我的是你的爱。它超越了给予奶水的幸福，我认为这就是我真正需要的一切。你阻止我永远逃跑的那天，当你向我表露你的感情，说你更在乎我而不是我的奶水时，我感觉棒极了，我对你的爱在那天完全绽放了。");
         }
         outputText("当然，你知道接下来发生了什么，[sayend]她叹了口气。");
         outputText("[pg]你记得；这就是最初净化她的整个努力是如何开始的。这也是克拉拉来到你营地的原因。");
         outputText("[pg]玛布尔笑了，[say: 我勉强坚持了几天……你知道当我不能像其他泌乳牛娘那样哺乳你时，我有多烦恼吗？正如克拉拉所说，我确实想让你对我的奶水上瘾，并完全把你标记为我的。我想确保我是唯一一个和你同床共枕的女人，把你完全据为己有。每天，我都要与我的本能作斗争，不把你推倒，强行把我的奶水灌进你的喉咙。挤奶器帮助减轻了一些负担，但它们能为我做的也就这么多了。]");
         outputText("[pg][say: 这一切中最令人不安的部分是，我想到我妈妈对我爸爸做了什么，我也会对你做同样的事情。如果你对我上瘾了，我甚至都不会意识到我在这么做。你会被慢慢扭曲成我完美的伴侣，虽然听起来很病态，但我真的想要那样。我身上的几乎每一个部分都非常渴望那样。从我还是个小女孩的时候起，我就梦想着有一个像爸爸一样的伴侣……]");
         outputText("[pg]玛布尔再次看着你，有些被动。你发誓她的表情就像一个等待处决的人。[say: 所以，[name]，现在你知道真正的我了。你还能爱我吗？] 你伸出手抚摸你爱人的脸颊。然后她抓住你的手，紧紧地贴在她的脸上。瞬间，她的坚忍破碎了，眼泪似乎又要顺着她的脸颊流下来。你告诉她一切都会好起来的；只需要一步一步来。");
         outputText("[pg][say: 可-可是亲爱的……！] 你向她保证，即使克拉拉说的话有一些道理，即使她说你和玛布尔的关系只是一厢情愿的浪漫，这也改变不了你全心全意爱她的事实。即使她真的让你对她的奶水上瘾，你也会留在她身边继续爱她。你再次告诉她，你爱的是她，而不是她能给你的东西，没有什么能改变这个事实。");
         outputText("[pg]玛布尔突然大哭起来，把你拉进一个几乎要折断你背的拥抱中，呼唤着你的名字，并在继续拥抱你时宣布她对你的爱。她给了你一个深吻，你也全心全意地回应了她。当她终于放开你时，她从墙上跳下来，给了你一个令人愉快的、美丽的微笑。[say: 你对我真的太好了，[name]。我现在感觉好多了。]");
         outputText("[pg]你也跳了下来，微笑着回应，然后笑着提醒玛布尔，她需要记住，很快，她所有的本能都会被洗去，她将能够按照她认为正确的方式生活，而不是克拉拉认为正确的方式，不是她母亲认为正确的方式，也不是她种族认为正确的方式。玛布尔将按照玛布尔认为正确的方式过玛布尔的生活。另外，也许你会和她一起创造一个纯种牛娘的种族？听到这里，玛布尔脸上的笑容更大了。");
         outputText("[pg]就在你离开之前，你看到玛布尔的表情再次变暗。[say: 我知道我想改变我的种族，但是外面其他的泌乳牛娘怎么办？] 她们不能也净化自己吗？[say: 嗯，她们中的一些人可以，但是任何已经有人对她们上瘾的人都不行。她们会杀死她们的伴侣，因为他们需要喝那种让人上瘾的东西才能生存。而且我不认为她们所有人都想要净化。] 你想如果她们警告人们，并且只让愿意的人上瘾，那应该没问题。你们俩开始穿过营地往回走。");
         outputText("[pg]玛布尔哼了一声，[say: 然后我们有像克拉拉这样的人。她把我种族的邪恶提升到了一个全新的水平。我们该拿她怎么办？我不想把她当囚犯，但如果我们放她走，她只会找别人上瘾。]");
         outputText("[pg]我们可以剪掉怪物的爪子，你建议道。");
         outputText("[pg][say: 你是说，净化她？这主意太棒了！女神作证，如果有人应该被净化，那一定是她。我们不必把她关起来就能确保她的安全，而且她以后也得找点比抓奴隶更有意义的事情做！]");
         menu();
         addButton(0,"继续",purifyMarbleComplete);
      }
      
      public function stickUnpurifiedClaraInACage() : void
      {
         clearOutput();
         outputText("你说你要把克拉拉关在营地里。她罪有应得，这样她就不会再对任何人构成威胁了。玛布尔向你点点头，说她相信你的判断。");
         outputText("[pg][say: 就这样了？你打算把我关在笼子里？你不能这么做！我可是克拉拉，哈娜的女儿！你不能就把我扔进该死的笼子里！] 尽管她抗议，但被绑着的她无法做出任何实质性的抵抗。");
         outputText("[pg]多亏了玛布尔出色的木工技术，你和她花了一个小时左右的时间用森林里的原木做了一个笼子。然后你解开克拉拉的束缚，把她放进她的新家。她要在那里待上一段时间，但至少你知道她那样就不会伤害任何人了。不幸的是，这些栏杆并不能隔绝她嘲笑和要求的声音。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1053,1);
         menu();
         addButton(0,"继续",purificationQuestFinal);
      }
      
      public function stayHereAndDontGoGetYerSisterShesABitch() : void
      {
         clearOutput();
         outputText("你摇了摇头，告诉玛布尔营地里还需要她；等你能抽出空来的时候，你会告诉她的。");
         outputText("[pg]玛布尔轻轻叹了口气，点了点头。[say: 好吧，亲爱的，如果你是这么想的话。但请不要拖太久，好吗？我们离……] 她犹豫了一下才说完，[say: 彻底治好我已经那么近了。]");
         outputText("[pg]说完，你们三个吃完了饭。拉萨祖尔步履蹒跚地去补觉了。玛布尔准备开始她的晨练，而你则准备在玛瑞斯度过新的一天。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function startCombatWithMarbleSister(param1:Boolean = true) : void
      {
         startCombat(new Clara());
         get_player().createStatusEffect(StatusEffects.NoFlee,0,0,0,0);
         if(param1 && !get_player().hasStatusEffect(StatusEffects.ClaraFoughtInCamp))
         {
            get_player().createStatusEffect(StatusEffects.ClaraFoughtInCamp,0,0,0,0);
         }
      }
      
      public function rathazulsMurbelReport() : void
      {
         clearOutput();
         get_marbleScene().marbleSprite();
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1058,0);
         outputText("当你醒来并加入玛布尔");
         if(get_game().camp.companionsCount() > 2)
         {
            outputText("和你的其他追随者");
         }
         outputText("今天早上吃早餐时，你发现睡眼惺忪的拉萨祖尔在营火旁等着。玛布尔咂了咂嘴，给了他一杯烈酒，他感激地接过，大声地喝了一口。他坐下来，盯着他的杯子，然后轻轻地叹了口气。");
         outputText("[pg][say: 恐怕我有一些坏消息……虽然你给我的那个样本非常有用，而且我已经完成了一个原型配方，但我不完全确定玛布尔喝它是否安全。我想要一些来自另一头牛的奶，最好是没有像你一样被净化过的，这样我就可以完成我的工作，]他告诉玛布尔，玛布尔看起来若有所思。");
         outputText("[pg][say: 嗯……我有两个姐妹；她们其中一个的奶可以吗？]她问道。");
         outputText("[pg][say: 亲戚的奶可能是最好的。]拉萨祖尔热情地说。");
         outputText("[pg][say: 那这就是解决办法！]玛布尔充满欢呼地宣布。但随后她的脸沉了下来。[say: 但是从这里到家需要几天时间，然后再回来需要更多时间。[name]，如果你需要我的帮助，我不想把你一个人留在这里，]她坚持说。");
         outputText("[pg]你是告诉她没关系，还是告诉她你还没准备好让她走？");
         menu();
         addButton(0,"去吧",murbleShouldGoRunAlongAndGetHerCuntySisterSoTheyCanBeCuntsTogether);
         addButton(1,"留下",stayHereAndDontGoGetYerSisterShesABitch);
      }
      
      public function rathazulFinishingMarblesPotion() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_rathazul());
         outputText("今天早上发生的这些相当精彩的事件，似乎并没有引起这位年迈鼠人的注意。他一反常态地全神贯注于面前冒着白泡的配方，以至于你和玛布尔走到他身边时他都没发觉。你们俩都很惊讶他完全没有理会你们的到来。过了好一会儿，你才清了清嗓子，宣布你们的存在。营地的炼金术士吓了一跳，转过身来，困惑地眨了眨眼，然后对你们说：[say: 啊，[name]，玛布尔。好消息，你们俩！这药剂可能会非常强效，只需极小的剂量就能净化牛娘。甚至对那些还没有服用过纯化拉波娃的人也有效。不过，它可能对与你们没有血缘关系的人无效。]");
         outputText("[pg][say: 那是不是说已经准备好了？]你的伴侣问道。");
         outputText("[pg][saystart]不，还没完全好。这个过程大概还需要半个小时。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,8) > 0)
         {
            outputText("然后我们就可以准备净化你和你的孩子");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,8) > 1)
            {
               outputText("们");
            }
            outputText("。");
         }
         outputText("所以稍晚点再来吧。[sayend]这只啮齿动物又回到了他的化学反应中。");
         outputText("[pg]你转向你的牛娘恋人，问她这段时间想做点什么。她犹豫了一下，明显被什么事情困扰着。[say: 事实上，我想我需要一点时间独处，好好想想我妹妹说的话。等配方完成了你再来找我，好吗？]你点点头，她便朝营地边缘走去。");
         outputText("[pg]你猜你现在有点时间要打发了。有什么你想做的事吗？");
         menu();
         addButton(0,"继续",theFormulaIsDone);
      }
      
      public function purifyMurblesSister() : void
      {
         clearOutput();
         outputText("你向玛布尔要了拉萨祖尔的配方瓶。她点点头，递给你并说道，[say: 是的，我也认为这是最好的选择。]");
         outputText("[pg]你走近被绑着的克拉拉，告诉她你准备给她松绑。她只需要喝几滴你手里的瓶子里的东西。");
         outputText("[pg]她看了看瓶子，然后撇了撇嘴。[say: 怎么，你那里有什么东西能破坏我的心智吗？某种腐化果汁？随便吧，反正我也没多少选择，]她讽刺地回答道。尽管如此，她还是毫无怨言地喝了几滴。");
         outputText("[pg]过了一会儿，你平静地告诉克拉拉，她刚才喝的液体是用来净化玛布尔的。既然它部分是由她的奶水制成的，对她应该很有效。一种绝对恐惧的神情慢慢在她脸上蔓延开来，她惊慌失措，拼尽全力挣扎着，绝望地想要阻止即将发生的事情。");
         outputText("[pg]显然，净化的拉波娃确实让玛布尔度过了最糟糕的净化过程。大量的奶水开始从被绑着的牛娘的乳房里涌出，淹没了她周围的地面。与此同时，她发出了一声巨大的[say: 不——！]，因为腐化连同她奶水珍贵的成瘾性一起被驱逐出了她的身体。[say: 你不能这样对我！这就是我！你无权夺走它！]");
         outputText("[pg]鉴于她刚刚试图夺走别人的生命，她可能已经失去了选择自己生活的任何权利。这将给她充足的时间来反思自己的所作所为，而且可能比任何形式的性惩罚都有效得多。你毫不犹豫地告诉了她这一点。");
         outputText("[pg]当过程结束时，克拉拉异常安静，不再对她的束缚进行任何抵抗。现在的问题是怎么处置她。");
         outputText("[pg]你觉得如果你真的想亲自盯着她，你也可以在营地里建个笼子。那样她就会成为另一张要吃饭的嘴，而且你每天都得听她抱怨。不过，俗话说得好，\"把敌人留在身边。\"");
         outputText("[pg]如果你觉得特别宽宏大量，你也可以直接放她走，只要她保证永远不再回来，或者不再试图绑架你。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1054,1);
         menu();
         addButton(0,"关笼子",cageDatCowCunt);
         addButton(1,"放走",letGoOfMarblesCowCuntSister);
      }
      
      public function purifyMarbleComplete() : void
      {
         clearOutput();
         outputText("你们俩来到拉萨祖尔的工作室，发现主人正在等你们，手里拿着一瓶带有金色条纹的乳白色液体。[say: 这就是配方吗？]玛布尔看着瓶子问道。");
         outputText("[pg][say: 是的，只需一剂，你就能摆脱身体里的腐化。连我都对它的效果感到惊讶。]");
         outputText("[pg]玛布尔伸出手，示意拉萨祖尔拿个空杯子倒一点液体进去。她从他手里接过杯子，闻了闻这种奇怪的液体，然后准备喝下去。你拦住她，建议她把上衣脱掉，免得再出现奶水喷涌的问题。玛布尔点点头，感谢你的提醒，并把杯子递给你。然后她脱下朴素的上衣，露出巨大的乳房。");
         outputText("[pg]事实上，现在你仔细观察她的乳房，发现它们似乎比以前小了一点。也许这是净化过程的副作用？好吧，不用太担心，在这个世界里，改变身体的方法多得是。");
         outputText("[pg]脱掉上衣后，你把杯子还给玛布尔，她再次准备喝下。她盯着杯子看了一会儿，你建议她越是犹豫，就越难下咽。[say: 是啊，谢谢你，亲爱的，]她心不在焉地回答，然后叹了口气，举起杯子，一饮而尽。");
         outputText("[pg]你的牛娘情人对这味道皱了皱眉，把杯子还给拉萨祖尔。她的嘴唇左右蠕动，眉头因不确定而紧锁，药水的效果开始显现。不出所料，首先发生的是一股奶水从她的乳房喷涌而出，虽然不如净化过的拉波娃那么猛烈。这次的喷涌时间更短，也更柔和。然而，你可以明显看到她的乳房随着奶水的流出而缩小。");
         outputText("[pg]然后她惊讶地抓住自己的乳房，似乎在掂量它们，感受着变化。[say: 我可不怎么喜欢这样……]她嘟囔着。接着她猛吸了一口气，眼睛睁得大大的。她的身体开始摇晃，然后倒下。幸好你轻松接住了她，轻轻把她放在地上。检查她时，发现她依然睁大双眼，眼神涣散。");
         outputText("[pg]你焦急地呼唤她，求她醒过来。过了一会儿，她的眼神重新聚焦，你听到她犹豫地呼唤：[say: [name]？]你松了一口气，问她感觉如何。[say: 我感觉……不一样了。就像我第一次看到这个世界一样。]你扶她站起来。[say: 我想这说得通，我生来就是腐化的，所以被净化是我从未体验过的感觉。我还需要一段时间才能真正告诉你这是什么感觉。我能说的是，我的大脑感觉……很干净，很自由。]");
         outputText("[pg]好吧，有一种方法可以确定，你提议尝尝她的纯净奶水。[say: 啊，你不知道这个提议让我多开心，亲爱的，来吧！]不用说第二遍，你立刻扑向她的乳房。你的嘴唇含住她甜美的乳头后，有一瞬间，你的舌头什么也没尝到。你担心玛布尔可能干涸了，接着，一丝味道抚摸着你的舌头。一种新的奶水流了出来，不同于你熟悉的旧的带药味的奶水。毫无疑问；它是纯净、安全、美味的。你退后一步，对玛布尔微笑，并告诉她这个发现。玛布尔笑了，[say: 抱歉我现在能给的不多，但只要给我一点时间，我会给你一顿美味的纯净泌乳牛娘母乳大餐。]");
         outputText("[pg][say: 那真是个好消息！实验成功了！]拉萨祖尔突然大喊，打断了你们的交心。好吧，反正也没什么好说的了。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,8) > 0)
         {
            outputText("[pg][saystart]既然我们知道它有效，我们就应该马上净化你的孩子");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,8) > 1)
            {
               outputText("们");
            }
            outputText("。给");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,8) == 1)
            {
               outputText("她");
            }
            else
            {
               outputText("每个");
            }
            outputText("两滴的剂量，[sayend]炼金术士指示你，并把他的配方瓶递给你。");
            outputText("[pg]你和玛布尔毫不耽搁地前往育婴室，喂给");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,8) > 1)
            {
               outputText("每一个");
            }
            outputText("你的孩子");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,8) > 1)
            {
               outputText("们");
            }
            outputText("两滴配方药水。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,8) > 1)
            {
               outputText("他们");
            }
            else
            {
               outputText("她");
            }
            outputText("喝下");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,8) == 1)
            {
               outputText("");
            }
            outputText("了它，虽然表面上没有什么变化，");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,8) == 1)
            {
               outputText("你的");
            }
            else
            {
               outputText("每个");
            }
            outputText("孩子都说感觉");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,8) > 1)
            {
               outputText("他们");
            }
            else
            {
               outputText("她");
            }
            outputText("脑海里有什么东西被移除了。");
            outputText("[pg]你和你孩子们的父亲带着非常轻松的心情回去报告配方药水的结果。[say: 太好了！我一定会密切关注他们，确保没有残留的影响，但你和你的家人现在很可能是玛瑞斯很长一段时间以来第一批纯种牛头人了。]");
         }
         menu();
         addButton(0,"继续",dealingWithCowCuntPostPurification);
      }
      
      public function purifiedSuccubusMilkForPureMarbles() : void
      {
         clearOutput();
         outputText("你想让玛布尔把她的乳房变大吗？");
         menu();
         addButton(0,"是",actuallyGrowPureMarblesTittiesForFunzies);
         addButton(1,"否",get_marbleScene().giveItem);
      }
      
      public function purificationQuestFinal() : void
      {
         clearOutput();
         get_marbleScene().marbleSprite();
         outputText("[say: 这是一个相当漫长的早晨，不是吗，亲爱的？] 确实如此，但至少现在，你的爱人终于彻底摆脱了她的腐化。");
         outputText("[pg]你帮助玛布尔获得纯洁，获得了500经验值。");
         var _temp_1:* = get_player();
         _temp_1.XP = _temp_1.XP + 500;
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1059,5);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1051,1);
         get_player().changeStatusValue(StatusEffects.Marble,4,10);
         get_game().set_inCombat(false);
         get_player().clearStatuses();
         doNext(get_camp().returnToCampUseFourHours);
      }
      
      public function pureMurbleUsesReducto() : void
      {
         clearOutput();
         outputText("你想让玛布尔把她的胸部变小吗？");
         menu();
         addButton(0,"是",pureMurblePCChoosesYesToShrinkeyTits);
         addButton(1,"否",get_marbleScene().giveItem);
      }
      
      public function pureMurblePCChoosesYesToShrinkeyTits() : void
      {
         var _loc1_:int = 0;
         var _loc2_:* = null as IMap;
         clearOutput();
         outputText("你递给玛布尔一罐缩胸膏，并告诉她你希望她能把胸部缩小一点。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1056) > 0)
         {
            outputText("[pg][say: 好吧，既然你这么说。] 玛布尔打开缩胸膏的罐子，掀起上衣，将绿色凝胶涂抹在她的乳房上。随着药效发作，她发出一声轻柔的叹息，她那巨大的 " + get_game().marbleScene.marbleBreastSize() + " 乳房慢慢缩小，变成了一对更为适中的");
            _loc1_ = 1056;
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,_loc1_,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,_loc1_) - 1);
            outputText(get_game().marbleScene.marbleBreastSize() + " 大小的乳房。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1056) == 0)
            {
               outputText("[pg]你的伴侣抓住她那对依然可观的DD罩杯乳房，夸张地叹了口气。[say: 这真是太小了。记住，我这么做只是因为我在乎你，亲爱的。我不会再让它们变小了。]");
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1056) == 1)
            {
               outputText("[pg]你的伴侣试探性地颠了颠她现在变小的胸部，[say: 嗯，我想这也不算太糟，你喜欢现在的我吗，亲爱的？]");
            }
            else
            {
               outputText("[pg]你的伴侣转了转肩膀，然后伸展了一下背部。[say: 哦，真是松了一口气！] 她带着灿烂的笑容对你说，[say: 太谢谢你了，亲爱的，这个尺寸对我来说刚刚好。]");
            }
            get_player().consumeItem(get_consumables().REDUCTO);
            _loc2_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteFloat(_loc2_,3,FlagDict_Impl_.arrayReadFloat(_loc2_,3) - 5);
            if(FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,3) < 0)
            {
               FlagDict_Impl_.arrayWriteFloat(KFLAGS.flags,3,0);
            }
         }
         else
         {
            outputText("[pg][say: 什么？亲爱的，我已经这么小了，恐怕我无法让自己变得更小了。抱歉。] 她把缩胸膏递还给你。");
         }
         doNext(get_marbleScene().giveItem);
      }
      
      public function pureMarbleDecidesToBeLessOfABitch() : void
      {
         clearOutput();
         outputText("当你检查陷阱确保它们还在运作时，你听到营地外传来一个声音，[say: 亲爱的！] 你抬起头，看到了玛布尔微笑的脸庞");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,8) > 0)
         {
            outputText("以及你孩子的脸");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,8) > 1)
         {
            outputText("们");
         }
         outputText("就在营地外。她一定是通过某种方式得知了你被净化的消息。");
         outputText("[pg]她兴奋地跑到你面前，给了你一个大大的拥抱，紧紧地把你抱在胸前。拥抱了片刻后，玛布尔在你耳边轻声说道，[say: 我很高兴你能从最糟糕的腐化中解脱出来。] 她松开你，问你是否介意她搬回营地。你怎么能拒绝她呢？");
         get_player().createStatusEffect(StatusEffects.CampMarble,0,0,0,0);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1063,0);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1062,0);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1091,0);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function pcAndMurbleDoubleTeamCowButt() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_clara());
         var _loc1_:int = get_player().cockThatFits(20);
         outputText("你走上前，向玛布尔建议你们两个应该一起惩罚克拉拉。她点点头，问你有什么想法。嗯，你觉得你们俩一起进行性惩罚会很合适。");
         outputText("[pg][say: 什么？我不想和我姐姐玩三人行！只有[name]才能碰我！]");
         outputText("[pg]妹妹的爆发似乎足以说服你的爱人同意这个提议。如果不是因为她现在的心情，你怀疑她根本不会同意。");
         outputText("[pg]你们俩脱光了自己和被绑着的罪犯的衣服。然后，你们俩看着赤裸被绑的女孩，决定该怎么做。");
         if(get_player().hasCock() && _loc1_ >= 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,4) > 0)
         {
            outputText("最终，你把她拉起来，把她夹在你们俩的身体中间。玛布尔表示反感走后门，所以你负责后面，她负责前面。[say: 嘿，你不能这样对我！我不想把我的初夜给我姐姐！] 克拉拉愤愤不平地喊道。");
            outputText("[pg][say: 那么，你是说你吸取教训了吗？你要为试图把我的小甜心从我身边夺走而道歉吗？]");
            outputText("[pg][say: 什么？操，不，你的</i>小甜心<i>应该是我的。]");
            outputText("[pg]玛布尔看着妹妹的侧脸，对你庄重地点了点头。你把这当作开始侵犯的邀请，紧紧抓住了克拉拉宽阔的屁股。然后你用你的" + get_player().cockDescript(_loc1_) + "顶住她肛门的入口，引得即将被你插入的女人倒吸一口凉气并恳求你停下来。她姐姐没有理会她的乞求，你也没有。");
            outputText("[pg]当你推入克拉拉的屁股，而玛布尔进入她的阴道时，你面前的女孩们发出了一声尖锐的喘息。[say: 不，] 你面前传来一声介于呜咽和呻吟之间的声音，[say: 事情不应该是这样的……] 你无视了这些，开始在年轻牛娘的后庭里抽插，同时享受着玛布尔的肉棒在另一个洞里进出，隔着肉壁摩擦你的感觉。你很少有机会像这样双飞别人。");
            outputText("[pg]你擦去脸上的一滴汗水，继续沉浸在填满牛娘宽大屁股的感觉中，享受着她收缩挤压你的肉棒，以及另一根肉棒如此之近，以至于你能感觉到它隔着牛娘在你身上滑动的双重刺激。同时，你能听到两个女孩发出响亮的呻吟声。玛布尔发出熟悉的、质朴的“啊”声和压抑的牛叫声，而她的妹妹则发出尖锐的喘息声、“哦”声和长长响亮的牛叫声。克拉拉已经有一段时间没有抗议这种状况了，双重插入显然超出了她处女心智的承受能力。");
            outputText("[pg]突然，克拉拉的肛门紧紧地夹住了你的" + get_player().cockDescript(_loc1_) + "，她发出一声长长的[say: 哞！]的高潮声。她在这方面确实来得很快；你甚至还没开始积累自己的快感。你绕过她，看到玛布尔似乎也对此感到相当惊讶。[say: 我们还要继续吗？] 她有些不确定地问，然后皱着眉头再次打量她的妹妹。你耸耸肩，建议再来一会儿正是你们俩都需要的，而且完全在合理惩罚的范围内。你的伴侣同意了，操弄继续进行。");
            outputText("[pg]这一次，克拉拉的肛门放松了许多，也更适应你的侵犯了。当你向前推进时，它似乎在邀请你进入，而当你向后抽动时，它又试图挽留你。也许这场轮奸激发了她肛交的天赋？很难说，但这绝对是一种享受。快速瞥一眼姐姐的脸，可以看出她显然也很享受，但从妹妹那里传来的声音表明她才是最享受的。不过话又说回来，很难分辨那胡言乱语是因为快感，还是因为精神彻底崩溃了。");
            outputText("[pg]没过多久，你和玛布尔就一起冲上了顶峰，填满了牛娘的洞穴。当你们俩抽身时，克拉拉似乎差一点就高潮了，她似乎突然恢复了镇定。[say:等等，什么？不！你们不能就这么，呃……我在说什么？！] 看起来她正陷入两难的境地，不知道自己是想高潮，还是对刚才发生的事情感到太过困扰。");
            outputText("[pg][say:该死，为什么[name]不能在前面？现在我永远无法和完美的伴侣体验第一次了！你太邪恶了，姐姐。] 听到这句话，玛布尔看起来又要发作了……");
         }
         else if(get_player().hasCock() && _loc1_ >= 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,4) == 0)
         {
            outputText("[pg]最后，你把她按倒，让她四肢着地。你站在她身后，而玛布尔站在她妹妹的脸前。[say:等等，你真的以为我会服侍你吗？] 克拉拉愤愤不平地问道。");
            outputText("[pg][say:如果你不想让我拧你的耳朵，你就会的，] 传来了这样的回答。你用你的" + get_player().cockDescript(_loc1_) + "顶住她紧致的屁眼，暗示如果她不配合惩罚，你可能会换个入口。[say:当然，如果你为你试图对[name]做的事感到抱歉的话……] 玛布尔建议道。");
            outputText("[pg][say:什么？我到底为什么要为那件事感到抱歉？哞！] 你的长度进入了她处女的小穴。[say:嘿！你——唔，] 她的脸被强行按进玛布尔的私处，声音戛然而止。你给她一点时间适应这种感觉，然后开始认真地在她的开口处抽插。与此同时，玛布尔稍微拧了一下她妹妹的耳朵，提醒她该怎么做，当克拉拉显然顺从时，她发出了一声愉悦的叹息。");
            outputText("[pg]毫无疑问，你是第一个占有这位女士最私密之处的人。她非常紧致，肌肉本能地、毫无方向地收缩和痉挛，以对抗你的入侵。每一次抽插都会遇到全新的收缩、放松和生疏的疯狂体验。当然，很明显克拉拉尽管之前抗议过，但她很享受这一切。她的小穴已经湿透了。");
            outputText("[pg]在继续品味克拉拉体内不可预测性的同时，你把注意力转向了你的惩罚三人行伴侣是如何享受这种体验的。不幸的是，妹妹在舔穴方面缺乏经验暴露无遗。玛布尔的表情混合着享受和恼怒。为了给你的伴侣带来更多前者，你抓住那条在丰满臀部周围甩动的牛尾巴——你正通过占据她小穴的肉棒连接着这个臀部——然后拉了一下。你告诉克拉拉，她需要做得更好来取悦你的爱人。她需要运用那条牛舌，深入其中，并特别注意……这里。伴随着最后一个词，你轻轻揉了揉她的阴蒂。");
            outputText("[pg]玛布尔的表情瞬间改变，她发出了一声长长的低吟。作为奖励，你从快速抽插变成了在她入口处缓慢摩擦。这确实是一个很好的奖励，因为你感觉到克拉拉的汁液从挑逗她内壁的" + get_player().cockDescript(_loc1_) + "周围溢出，流到了你的腹股沟上。然而，你还没有结束。你开始混合着在她的私处抽插，并在她的体内扭动你的长度。");
            outputText("[pg]一阵沉闷但响亮的呻吟和哞哞声开始从你面前升起，在某种程度上补充了你更熟悉的、来自你伴侣的较安静的叹息和喘息声。整个情况极其淫荡，你享受着每一秒。你很少有机会让三具汗流浃背的身体互相拍打和流口水。如果她不是这么明显地乐在其中，其中一个被绑起来的事实可能会让你有点困扰。");
            outputText("[pg]事实上，她太享受了，以至于在你或玛布尔达到顶峰之前，她就高潮了第二次。尽管如此，你和玛布尔还是在那之后设法达到了顶点，并一起度过了余韵。克拉拉跌跌撞撞地倒在地上，因为玛布尔高潮的证据而咳嗽和语无伦次，而你的则从她下面的洞里溢出。");
            outputText("[pg][say:呃，姐姐，你的奶水尝起来和你小穴的汁液一样糟糕吗？难怪[name]不想要你！] 玛布尔的脸上又闪过一丝愤怒。她会试图对她妹妹施加更多的惩罚吗？");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,4) > 0)
         {
            outputText("[pg]最后，你把她按倒，让她四肢着地。你站在她面前，而玛布尔站在她妹妹的背后。[say:嘿，你不能这样对我！我不想把我的第一次给我的姐姐！] 克拉拉愤愤不平地大叫。");
            outputText("[pg]你抓住她的耳朵，轻轻拉了一下。她最好乖乖接受惩罚，否则你会让她头上多受点苦。[say:当然，如果你为你试图对[name]做的事感到抱歉的话……] 玛布尔建议道。");
            outputText("[pg][say:什么？我到底为什么要为那件事感到抱歉？哞！] 伴随着一声低沉的吸溜声，你的伴侣将她新获得的七英寸肉棒深深推入她妹妹的私处。[say:嘿！你——唔，] 你用你的[vagina]让她安静下来，粗暴地把它强压在她的脸上。你轻轻拧了一下这只年轻母牛的耳朵，提醒她应该做什么，她的舌头立刻伸了出来，开始对你进行试探性的舔舐。");
            outputText("[pg]你叹了口气，看看玛布尔做得怎么样。这位年长的牛娘显然很享受。她很少这么投入到涉及她肉棒的性爱中，但她抽插的紧迫感、脸上幸福的表情，以及快乐的低声呻吟和喘息，无疑表明她非常享受。");
            outputText("[pg]至于你自己的性体验，到目前为止你觉得相当平淡。这个罪魁祸首的口交技巧显然还有待提高。她只是轻轻舔舐边缘，几乎没有挑逗你。感觉到你没有玩得开心，玛布尔抓住她妹妹的尾巴，用力拉了一下。[say:嘿，“妹妹”，我看你在上面做得不好。你最好把那条舌头深入[him]的体内，否则我就把你的尾巴当皮带用。让那长度发挥作用！] 那个小小的举动显然传达了信息，因为真正的表演现在开始了。");
            outputText("[pg]现在你感受到了牛娘的舌头给女性部位带来快感的自然力量。她的舔穴器至少是正常人类的两倍长，能够轻松探索你的褶皱并深入你的内部。[say:好女孩，一定要特别注意这个小按钮，] 传来了进一步的指示，伴随着玛布尔伸手到她妹妹的腿下，用手指抚摸那个准小偷的阴蒂。你确信她刚才摸的就是那里，因为这引发了克拉拉身体的一阵颤抖，并在你的阴阜上发出了一声响亮的高潮叫喊。");
            outputText("[pg]你向玛布尔表达了对她妹妹未完成表演的失望，所以操弄继续进行。值得庆幸的是，这只坏母牛似乎确实明白了，开始挑逗和吸吮你的[clit]，同时继续挑逗你的褶皱和深处。如果她不是像现在这样明显地享受，你几乎会为你们俩对她做的事感到内疚。被绑在你和你的爱人之间的女孩不断在你的[vagina]里发出沉闷但响亮的喘息和哞哞声。她呼在你私处上的气息只会让你感觉更好。");
            outputText("[pg]她太享受了，以至于在你或玛布尔达到顶峰之前，她就高潮了第二次。尽管如此，你和玛布尔还是在那之后设法达到了顶点，并一起度过了余韵。克拉拉跌跌撞撞地倒在地上，因为你高潮的证据而咳嗽和语无伦次，而玛布尔的则从她下面的洞里溢出。");
            outputText("[pg][say: 该死，你为什么要这么做？现在我永远无法和我的完美伴侣体验第一次了！你太邪恶了，姐姐。] 玛布尔听到这句话，看起来又要发火了……");
         }
         else
         {
            outputText("[pg]最终你把她翻转过来，让她平躺着。然后玛布尔坐在她妹妹的脸上，而你把嘴凑到克拉拉的私处，并把你的[ass]翘到半空中，这样你的伴侣就能碰到你的[vagina]了。");
            outputText("[pg]这个小小的三角形阵型差不多就是你能想到的全部了，毕竟如果其中一个女孩被绑着，三个女孩能对彼此做的事情并不多，前提是你想让每个人都能从这次体验中获得快感。[say: 好了，这到底是什么鬼？你真的以为我会去服侍——唔！] 这个调皮的女孩话还没说完，就被她姐姐用牛娘的小穴捂住了脸。");
            outputText("[pg][say: 如果你不能好好取悦我……那我就在你脸上狠狠地磨蹭，] 你的伴侣回应道。你提议说，如果克拉拉做得不好，你也不会让她达到高潮。为了表明你的立场，你轻轻舔了一下这个罪魁祸首的花丘边缘，并向她保证，你会把她逼到边缘，但绝不让她越界。");
            outputText("[pg]玛布尔稍微从她妹妹的脸上抬起一点，建议道：[say: 你知道的，只要你承认自己做错了并道歉，你就可以摆脱这一切……]");
            outputText("[pg][say: 我不是已经告诉过你我做的是对的吗？我为什么要——唔！] 她再次被另一个女孩的私处堵住了嘴。看来惩罚开始了，你开始毫不留情地挑逗面前的牛娘花丘。在你的服侍下，她立刻开始扭动，拼命想让你真正插入她，或者触摸她那探出头的阴蒂。你没有给她这种仁慈，至少现在还没有。");
            outputText("[pg]现在你体验到了玛布尔用她那牛舌挑逗你[vagina]的快感。它的长度很容易就达到人类的两倍，而且非常擅长取悦女性的通道。你的伴侣显然很乐意把它用在这方面，用它深深地探入你的深处，同时熟练地探索和取悦你的[clit]。");
            outputText("[pg]与此同时，在你身下的年轻牛娘继续扭动着，挣扎得越来越剧烈。你稍微停顿了一下，向她建议，如果她想解脱，她只需要好好取悦玛布尔就行了。最后，你听到你的伴侣发出一声赞许的呻吟，你把这当作信号，深深地潜入克拉拉那饥渴的下体。几乎立刻，一声沉闷但清晰可闻的欢愉呻吟从这个女人嘴里传出。");
            outputText("[pg]你也发出了一声欢愉的呻吟，年长牛娘对你下唇的服侍已经把你逼近了高潮的边缘。她非常清楚如何使用她那舔穴的舌头，准确地知道该挑逗什么地方，以及什么时候该换到什么部位。然后她吸吮着你的阴蒂，把你推向了高潮。");
            outputText("[pg]大约在同一时间，你身下的女孩透过玛布尔的私处发出了一声长长而响亮的牛叫，标志着她向你的嘴唇投降。你退后一步，看到你的伴侣失望地看着她的妹妹，你戳了戳这个被绑着的坏女孩的肚子，告诉她完成工作。她喘着粗气，继续舔舐牛娘的小穴，直到你的伴侣发出一声好听的低吟和牛叫。");
            outputText("[pg]你们火热而汗津津的身体分开了，每个人的脸上都沾着彼此高潮的体液。克拉拉咳嗽着，语无伦次地说：[say: 呃，姐姐，你的奶水是不是和你的淫水一样难喝？难怪[name]不要你！] 玛布尔的脸上再次闪过一丝愤怒。她是不是想对她妹妹施加更多的惩罚？");
         }
         get_player().orgasm("Dick");
         menu();
         addButton(0,"继续",calmMurblesFatAssDown);
      }
      
      public function partTwoOfLowIntelligencePCsFallingForTheIncrediblyObviousCowCuntsTrap() : void
      {
         get_player().set_fatigue(40);
         get_player().set_HP(get_player().maxHP());
         get_player().set_lust(50);
         clearOutput();
         outputText("你感觉到一种令人愉悦的温暖感传遍全身，脑海中回荡着一首悦耳曲调的轻柔回声。感觉就像你站在世界之巅，没有什么比这更美好了。一切似乎都很对劲。有一段时间，你只是漂浮在幸福和愉悦的海洋上。你满脑子都在想这种感觉有多好，以及它让你想起了什么。要弄清楚并不容易，因为那首曲子不断地将思绪从你的脑海中拂去，但你并不介意；你只是在那种欣快感中放松，让你的思绪随波逐流。");
         outputText("[pg]最后，你想起了玛布尔的脸，然后是她的胸部，并意识到这种感觉很像你以前吸吮她乳汁的时候。不知为何，这让你感到焦虑和担忧。困惑中，你强迫自己集中注意力，试图摆脱这种担忧。然而，这只会让你感到越来越担心，直到你猛地睁开眼睛，映入眼帘的是一个巨大的牛娘胸部。你盯着的不是你想象中的那头母牛的胸部，而是一个最近才认识的人的。");
         outputText("[pg]注意到你睁开眼睛，克拉拉低头看着你，微笑着，停止了她正在哼唱的曲子。[say: 我们醒了吗？没关系，反正你也快完事了，] 她邪恶地轻笑着。你试图问她是什么意思，却发现你的嘴里充满了从紧紧贴着的乳头上收集来的奶水。你有些惊慌，推开玛布尔的妹妹，评估自己的处境。这头小母牛没有预料到这种反应，还没来得及反应，你已经挣脱了她的怀抱。");
         outputText("[pg]你发现自己在一个地下酒窖里，克拉拉正带着病态的笑容看着你。视线内没有其他人。你把手放在脸上，试图弄清楚到底发生了什么。你记得遇到了玛布尔的妹妹，然后喝了茶，然后……克拉拉对玛布尔说了什么？你微微呻吟，身体感觉到一种奇怪的、久违的渴望。");
         outputText("[pg][say: 想知道发生了什么吗？别让你那漂亮的小脑袋操心了。你只是在准备成为我余生的伴侣和奴隶。回到我的胸前吧，亲爱的。我很快就会让你彻底上瘾的，] 你的绑架者用越来越疯狂的表情说道。");
         outputText("[pg]你的身体拼命地想要按照她说的去做；你能感觉到。你不知道你喝了她的奶多久了，但你肯定已经快要完全依赖克拉拉了。由于你目前的位置，不经过克拉拉是不可能逃脱的，考虑到你目前的状况，这将会非常困难。每过一刻，你想要屈服于她的欲望就会变得更强烈。不过，如果你想逃离这个疯狂的牛娘，你就必须和她战斗。至少");
         if(!get_player().get_weapon().isAttached())
         {
            outputText("你的[weapon]就在附近，而且");
         }
         outputText("你还穿着你的[armor]。");
         menu();
         addButton(0,"战斗",fightCowCuntAfterBeingTotesMcGoatsDrugged);
         addButton(1,"屈服",voluntarilyChooseCowCuntBadEndYouBad);
      }
      
      public function partTwoOfClaraShowingUpAndBeingACunt() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_clara());
         outputText("你回到营地，继续你的早晨日常。当你准备出发时，女孩们已经从农场回来了，带着一瓶克拉拉的奶。这头斑点牛娘的坏心情似乎也好了很多。");
         outputText("[pg][say: 嘿，迷人的家伙！]克拉拉高兴地说，[say: 我很惊讶用那些挤奶器感觉那么好，你看到玛布尔在那里的设备了吗？我想奥菲莉娅会为了那样一套设备杀人的。玛布尔，你能把那瓶奶给那只老鼠吗？]玛布尔看了妹妹一眼，然后拿着瓶子走向营地里炼金术士的角落。");
         outputText("[pg]你的新熟人走到你面前，把手放在你的肩膀上，[say: 现在你哪儿也别去。我想为你，还有营地里的其他人，泡点茶来开始新的一天。我泡茶很厉害的，你不会后悔的！]她笑着随口告诉你，然后走向营火，从她带来的包里拿出一些用品。你觉得在离开之前等一会儿也无妨，你也有机会听听拉斯对新样本的初步想法。");
         outputText("[pg]过了一会儿，玛布尔回来了，问你克拉拉在干什么。你告诉她大家马上就能喝到早茶了，玛布尔听了很高兴。你问她为什么心情变好了，玛布尔告诉你，她在老家的时候有机会尝过克拉拉泡的茶，味道相当不错。");
         var _loc1_:int = 0;
         if(get_game().camp.companionsCount() >= 3)
         {
            outputText("[pg]玛布尔建议你趁克拉拉还在泡茶的时候把其他人召集起来，应该不会花太长时间。你点点头，然后离开，留下克拉拉和玛布尔在营火旁。");
            if(get_amilyScene().amilyFollowerPure())
            {
               outputText("[pg]当你去找艾米莉，问她要不要和克拉拉一起喝茶时，她灿烂地笑了。[say: 我已经好久没有享受过这样的事情了……这让我想起了过去的日子。]她的声音渐渐变小，看起来有些伤感，但随后又振作起来。[say: 当然，我加入。]");
               _loc1_++;
            }
            if(bimboSophie())
            {
               outputText("[pg]你不知道自己为什么要费这个劲，但你还是找到了正在做自己事情的索菲，问她想不想喝点茶。[say: 当然，听起来很有趣，]她咯咯地笑着。好吧，你觉得这并不完全是你预期的回答，但你还是告诉了她去哪里，然后继续走。");
               _loc1_++;
            }
            if(followerHel())
            {
               outputText("[pg]你走到营地边缘赫尔的吊床旁，问这位火爆的狂战士是否愿意和你一起喝杯茶。她挑了挑眉毛，[say: 你没有更，呃，烈一点的东西吗？]不过，在稍微劝说之后，她还是同意去营火旁。");
               _loc1_++;
            }
            if(isabellaFollower())
            {
               outputText("[pg]你走向伊莎贝拉声称属于她的那个营地角落，问这位牛娘女战士是否愿意和大家一起分享一些茶。");
               if(isabellaAccent())
               {
                  outputText("伊莎贝拉从椅子上跳了起来，[say: 茶？哦，ja！我听说茶和奶是sehr gut的组合，ja？]好吧，至少她看起来相当热情。");
               }
               else
               {
                  outputText("伊莎贝拉从椅子上跳了起来，[say: 茶？哦，是的！我听说茶和奶是非常好的组合，是吧？不过我还没机会尝试过……]好吧，至少她看起来相当热情。");
               }
               _loc1_++;
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,238) == 1)
            {
               outputText("[pg]你走了一小段路，来到伊兹玛喜欢洗澡的小溪边，把她叫了过来。她问你怎么了，你告诉她克拉拉在煮茶。虎鲨人哼了一声。[say: 不，谢谢；我不相信任何可能含有那些该死的牛的奶的东西，]她厉声说道，露出牙齿，表现出一种掠食者般的轻蔑。你试图争辩说她对玛布尔的妹妹太无礼、太不信任了，但虎鲨人不听，而是故意推开岸边，潜入小溪的深处——如果那也算深处的话。");
               outputText("[pg]你等了几分钟，但她没有浮出水面；你觉得再问下去也没意义，就留她在河床上生闷气。");
            }
            if(jojoFollower())
            {
               outputText("[pg]当你来到乔乔的冥想地点，问他是否有兴趣来营火旁喝茶时，这位鼠人武僧看起来很惊讶，但还是点了点头。[say: 喝茶会很令人愉快的，谢谢你。我已经很久没有享受过这样文明的活动了。]");
               _loc1_++;
            }
            if(followerKiha())
            {
               outputText("[pg]奇哈翻了个白眼。[say: 喝茶，笨蛋？接下来你是不是还要一边和我讨论经济学，一边请我吃松饼和司康饼？我们难道不应该准备去和莉希丝战斗吗？] 看到你脸上失望的表情，她妥协了。[say: 哦，好吧，我会去的，但只是因为我有点渴了。]");
               _loc1_++;
            }
            outputText("[pg]最后，你前往拉萨祖尔的工作区，问这只年迈的老鼠是否对克拉拉的茶感兴趣。");
         }
         else
         {
            outputText("[pg]玛布尔建议你趁克拉拉还在泡茶的时候，去问问拉萨祖尔要不要喝茶，这应该花不了多少时间。你点点头，动身离开，留下克拉拉和玛布尔在营火旁。");
            outputText("[pg]你前往拉萨祖尔的工作区，问这只年迈的老鼠是否对克拉拉的茶感兴趣。");
         }
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1060,_loc1_);
         outputText("[pg]拉萨祖尔惊讶地看了你一会儿，然后摇了摇头。[say: 谢谢你的好意，但我那边已经有一些了。] 他指了指那个散发着恶臭的杯子（那是茶？！），然后转过身继续研究克拉拉的奶。好吧。既然玛布尔还在营火旁，你猜大家都在了。");
         menu();
         addButton(0,"继续",dumbshitCowCuntsTryToDrugYouBecauseTheyreCunts);
      }
      
      public function pageTwoOfVisitingTheRatForMurblesPurification() : void
      {
         clearOutput();
         outputText("幸运的是，玛布尔在你的营地，而不是在惠特尼那里，当你走近时，你的牛情人满怀希望地看着你。[say: 他说他能帮忙吗？]她兴奋地问道。");
         outputText("[pg]你点点头作为回应，告诉她他需要她的奶样才能做任何事情。你正准备开始找东西装一些，这时她得意地笑了笑，拿出一个瓶子。[say: 我刚挤完奶回来；这个可以吗，亲爱的？]她戏弄你。");
         outputText("[pg]你接过瓶子并感谢她；她抓住这个机会，在你跑去找拉萨祖尔之前，在你的脸颊上啄了一下。");
         outputText("[pg]当你滑行着在他面前停下时，老鼠抬起头，带着淡淡的微笑，然后平静地接过你给他的瓶子。[say: 我至少需要一天的时间来完成测试；我会让你知道我的发现，]他告诉你。");
         outputText("[pg]你感谢他的帮助，告诉他玛布尔也会很感激，然后平静地回到营地。在你身后，拉萨祖尔开始忙碌于他用来工作的奇怪设备。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1059,3);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1058,24);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function nursingFromPureMarble() : void
      {
         var _loc1_:* = null as IMap;
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1055) < 4)
         {
            outputText("你觉得有点渴，于是问玛布尔是否能给你一些奶水。她给了你一个悲伤的眼神，告诉你不行，她还没有积攒足够的奶水给你喝。净化她之后，她产奶需要更长的时间了。");
            doNext(get_marbleScene().interactWithMarbleAtCamp);
         }
         else
         {
            outputText("你觉得有点渴，于是问玛布尔是否能给你一些奶水。她对你笑了笑，告诉你她还担心你永远不会问呢，然后带你来到了营地周围岩石中一个熟悉的、隐蔽的地方。");
            outputText("[pg]到达后，你的爱人隔着上衣抓住她那" + get_game().marbleScene.marbleBreastSize() + "的乳房把玩了一会儿，稍微逗弄了你一下。充满弹性的软肉在她手中以一种非常诱人的方式揉动着，一想到里面藏着的美味乳汁，你就不禁流下了口水。");
            outputText("[pg]玛布尔给了你一个性感的微笑，用拇指勾住衬衫，将其拉到胸部上方，让她那母牛般的硕大双乳弹了出来。没过多久，她就邀请你品尝她那令人恢复活力的浓郁乳汁，而你也没有浪费时间，立刻照做了。");
            if(get_player().get_tallness() < 65)
            {
               outputText("高大的牛女在岩石上坐下，你跳到她的大腿上，");
            }
            else if(get_player().get_tallness() < 84)
            {
               outputText("你向前倾身，并且");
            }
            else
            {
               outputText("你把牛女抱起来以便够得着，");
            }
            outputText("几秒钟内，你的嘴唇就包住了她的乳头，她那美妙的乳汁喷涌而出。");
            outputText("[pg]虽然她纯净的乳汁不再像以前那样令人上瘾，但你必须承认它依然极其美味。浓郁的液体涌出，用令人陶醉的甜美填满了你的口腔。这一次，乳汁流出的速度远没有那么难以控制，所以你以平稳的节奏吸吮，而不是狂野地吞咽。贪婪地大口吞下这白色的黄金，它抚慰了你干燥的喉咙和饥渴的胃。多亏了相对温和的水流，你甚至能够细细品味嘴唇紧紧含着的乳头带来的愉悦触感。");
            outputText("[pg]在品尝美味的同时，你觉得应该特别关照一下嘴里那肉嘟嘟的凸起，于是让舌头在乳尖上游走。轻舔几下，然后小心翼翼地画圈，换来了一声非常愉悦的呻吟。与此同时，玛布尔的双手抚摸着你的脸庞和头部，嘴里轻声呢喃着鼓励与感激的话语。");
            outputText("[pg]随着你的吸吮，你感到一天的疲惫和酸痛被洗刷一空，新的能量充满了你的身体。虽然强化效果随着腐化的消退而消失了，治疗效果也变弱了，但它们依然存在。乳汁的流速开始变缓，你以此为信号换到了另一边的乳房。伴随着这一动作，传来一声满足的愉悦叹息，温柔的牛女轻轻抱住你的头，抚摸着你的后脑勺。");
            get_player().refillHunger(30);
            outputText("[pg]最后，你与伴侣的温存时刻结束了，她最后的乳汁流进了你的喉咙。你们分开，你忍不住打了个小嗝。玛布尔见状咯咯笑了起来，告诉你只要觉得渴了随时可以再来找她。她大概四个小时后就能再次为你哺乳了。");
            get_player().HPChange(Math.round(get_player().maxHP() * 0.2),false);
            get_player().changeFatigue(-30);
            dynStats(DynStat.Lust(15));
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteFloat(_loc1_,3,FlagDict_Impl_.arrayReadFloat(_loc1_,3) + 10);
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1055,0);
            if(FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,3) > 0)
            {
               FlagDict_Impl_.arrayWriteFloat(KFLAGS.flags,3,100);
            }
            doNext(get_camp().returnToCampUseOneHour);
         }
      }
      
      public function murbleSpanksCowCunt() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_clara());
         outputText("玛布尔似乎已经想好怎么惩罚克拉拉了，所以你只需坐下来看好戏。");
         outputText("[pg]姐姐把妹妹按在膝盖上，高高举起手。[say: 呃，姐姐，你想干什么？]手落了下来，发出一声沉闷的啪嗒声。[say: 哎哟！]手再次举起，伴随着另一声沉闷的啪嗒声落下。[say: 哎哟！快停下！]");
         outputText("[pg][say: 除非你明白你对我做的事有多伤人，否则我不会停的。]");
         outputText("[pg][say: 什么？！哎哟！]");
         outputText("[pg]你平静地向玛布尔建议，如果打在光屁股上，效果可能会更好。她对你的建议点了点头，然后迅速卷起克拉拉的裙子。[say: 嘿？你在干什么？！]你的伴侣无视了这个问题，脱下了她妹妹的……等等，那是，<i>黑色蕾丝内裤</i>？好吧，看来穿不穿内衣是这对姐妹之间的又一个区别。");
         outputText("[pg]白发牛娘苍白光洁的屁股高高撅起，玛布尔粗声粗气地命令道：[say: 现在，为你试图绑架[name]道歉。]");
         outputText("[pg][say: 不！我只是……] 啪的一声脆响，玛布尔的手重重地落在了妹妹毫无防备的屁股上，留下了一道愤怒的红印。[say: 哎哟！哎哟，哎哟，哎哟。] 克拉拉呜咽着，痛苦的泪水开始顺着脸颊流下。");
         outputText("[pg][say: 说对不起，] 命令再次传来，这次是咬牙切齿的声音。");
         outputText("[pg][say: 这不公平！你不能就这么……] 又是一声清脆的巴掌声，强大的战士手掌再次拍打在娇嫩的屁股上，在第一道红印上又留下了一道红印。年轻的牛娘哭喊道：[say: 停下，求你了！]");
         outputText("[pg]年长的牛娘再次举起手臂，大喊道：[say: 那就说对不起！] 她甚至没等对方回答，就降下了比以往更严厉的惩罚。这一击力道极大，犯错者直接从审判者的腿上飞了出去，落在不远处的泥地上，脸朝下，一路上像个小孩子一样尖叫抽泣。");
         outputText("[pg]此时，克拉拉甚至懒得再试图和姐姐讲理了。相反，她开始拼命挣扎，试图挣脱紧紧捆绑她的绳索，绝望地想要逃离玛布尔的制裁。行刑者暂时无视了这徒劳的举动，而是在营地里环顾了一会儿。最终，她找到了她想要的东西，从你的一个补给袋上扯下了一条长长的皮带。棕发姐姐在手上轻轻拍了几下，似乎很满意，然后将愤怒的目光转回了罪犯身上。");
         outputText("[pg]你提醒地上的女孩，她应该看看她姐姐找到了什么。那双充满泪水的眼睛在看到那东西时，惊恐地睁大了。[say: 你，哈，你疯了！] 她在抽泣中勉强喘息着说出这句话。就像这个可怜女孩之前的大多数评论一样，这句话被无视了。严厉的法律女主人已经到来，而这位女主人要把这个坏牛娘的屁股打得青一块紫一块。");
         outputText("[pg]玛布尔把妹妹从地上拉起来，粗暴地把她扔到火坑旁的一根圆木上。克拉拉继续抽泣着，乞求停止虐待，但这都是徒劳的。玛布尔在她身后微微蹲下，抡起胳膊，狠狠地打下了第一下。你的伴侣没有停止惩罚，直到克拉拉那可恶的屁股上每一寸都布满了青紫色的鞭痕。到了这个时候，这个想当绑架犯和奴隶主的人已经变成了一个流着口水、语无伦次的废物。");
         menu();
         addButton(0,"继续",calmMurblesFatAssDown);
      }
      
      public function murbleShouldGoRunAlongAndGetHerCuntySisterSoTheyCanBeCuntsTogether() : void
      {
         clearOutput();
         outputText("你告诉玛布尔，如果她需要请假回家处理这件事，你完全同意。");
         outputText("[pg]牛娘的脸上绽放出喜悦的笑容，她立刻用尽全力紧紧抱住了你。[say: 谢谢你！我会尽快回来的，好吗？别担心，亲爱的，我认识回家的路，也知道怎么照顾自己。] 她立刻放开你，开始在营地里忙碌起来，一边收拾东西，一边自言自语地计划着如何回家弄到她需要的珍贵牛娘奶。");
         outputText("[pg]你帮了她一把，很快她就收拾好了一个旅行包，准备出发了：首先去惠特尼那里解释她接下来的几天会在哪里，然后翻过山脉回家。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1059,4);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1061,240);
         FlagDict_Impl_.arrayWriteString(KFLAGS.flags,701,"");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function mediumIntelligencesSubmitCowCunts() : void
      {
         var combat1:Boolean;
         var _g:MarblePurification;
         clearOutput();
         outputText("你叹了口气，从牛娘手中接过杯子，一饮而尽。片刻之后，你的视线变得模糊，倒在了她柔软的怀里。就在一切陷入黑暗之前，你听到一个声音说：[say: 来吧，我们一起私奔。我保证在你下次醒来之前让你上瘾。]");
         menu();
         _g = this;
         combat1 = false;
         addButton(0,"继续",function():void
         {
            _g.loseToClara(combat1);
         });
      }
      
      public function mediumIntelligencesFightCowCunts() : void
      {
         clearOutput();
         outputText("你准备好战斗，克拉拉拔出一把看起来很凶险的重型狼牙棒，说道：[say: 好吧，那我们就用硬的。]");
         startCombatWithMarbleSister(true);
      }
      
      public function mediumIntelligenceReactsToDrugging() : void
      {
         clearOutput();
         outputText("当克拉拉分发杯子时，你忍不住觉得这一切都感觉很奇怪。你无法确切指出哪里不对劲，但你也无法将这种不安的感觉抛诸脑后。");
         outputText("[pg]当每个人都有一个杯子时，克拉拉对你们所有人微笑，举起她自己的杯子到嘴边说，[say: 敬玛布尔的净化和结识新朋友。]你仔细考虑着你自己的杯子；你觉得也许你不应该喝这个……");
         outputText("[pg]你还是要喝茶吗？");
         menu();
         addButton(0,"喝茶",lowIntelligenceGetsDruggedByCowSluts);
         addButton(1,"不喝",mediumIntelligenceDoesntDrinkCowCuntsTea);
      }
      
      public function mediumIntelligenceDoesntDrinkCowCuntsTea() : void
      {
         clearOutput();
         outputText("你无法摆脱这茶有问题的感觉，只是考虑了片刻。[say: 呃，你不打算喝你的茶吗，迷人的家伙？它真的很好喝，]你的服务员慢慢地说，脸上带着紧张的表情看着你。你刚想说什么，却被玛布尔突然的喘息和叫喊声打断了，[say: 克拉拉，你到底在这东西里放了什么？]然后她又喘了几口气，倒了下去。");
         if(get_game().camp.companionsCount() > 1)
         {
            outputText("[pg]你冲向倒下的同伴");
         }
         else
         {
            outputText("[pg]你冲向其中一个倒下的同伴");
         }
         outputText("想看看发生了什么，却发现她已经昏过去了。再次注意到茶杯，你转过身去面对准备它的人。克拉拉站在你身后，脸上带着令人不安的微笑。你像玛布尔之前那样，要求知道茶里有什么。");
         outputText("[pg][say: 你真是个聪明的[boy]，]女孩无视了你的问题，说道，[say: 我早该知道你没那么容易上当。]你再次向她提出要求。[say: 别担心她们，亲爱的。她们大概一小时后就会醒来，但到那时我们早就远走高飞了。]");
         outputText("[pg]远走高飞？你心想，为什么要远走高飞？[say: 这还不明显吗？这是我们一起私奔的机会，不用再担心过去的感情包袱！]她带着疯狂的笑容喊道，[say: 你是我完美的产奶伴侣，我绝不会让你从我指尖溜走。如果我必须强迫你跟我走，让你对我的奶上瘾，我会这么做的。所以别给自己找麻烦。哦，如果你敢跑，我就杀了玛布尔，那只老鼠，还有你营地里的任何人。现在，喝，你的，茶。]她拉开衬衫，然后向你举起另一个杯子，眼神越来越疯狂。");
         outputText("[pg]看来你要么屈服于她的欲望，要么和她战斗。没有别的选择，而且在茶的插曲之后，这将是一场一对一的战斗。");
         menu();
         addButton(0,"战斗",mediumIntelligencesFightCowCunts);
         addButton(1,"屈服",mediumIntelligencesSubmitCowCunts);
      }
      
      public function marbleWarnsPCAboutCorruption() : void
      {
         clearOutput();
         outputText("玛布尔走到你面前，脸上带着担忧的神色。[say: 呃，亲爱的？我开始为你担心了。你为了帮我摆脱腐化付出了这么多努力，但你自己似乎却在逐渐堕落……] 她看着地面，搓了几次手，拼命想把话说出来。[say: 如果你继续这样堕落下去，我想我无法再待在你身边了。请想办法清除控制你的腐化吧！]");
         outputText("[pg]她跑开了，没有回头。你感觉她其实很不情愿说出刚才那些话，而且她正拼命试图不让你身上的变化影响到她。不过，你真的在乎吗？");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1062,1);
         doNext(playerMenu);
      }
      
      public function marbleLeavesThePCOverCorruption() : void
      {
         clearOutput();
         outputText("玛布尔带着忧郁的表情走近你，她的东西都绑在背后的包里");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,8) > 1)
         {
            outputText("，身后还跟着她的孩子们");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,8) == 1)
         {
            outputText("，手里还牵着她的孩子");
         }
         outputText(". [say: 对不起，亲爱的。我试过警告你，但是——]她停顿了一下，深吸了一口气来平复情绪。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,8) > 0)
         {
            outputText("[say: 妈妈，怎么了？]牵着玛布尔手的孩子紧张地问道。[say: 嘘，小家伙。我们得离开一阵子，]这位牛母回答道，然后转头看向你。");
         }
         outputText("[say: 你已经变得太腐化了，我不能再和你待在一起了。请想办法清除你体内的污秽，这样我才能回来。再见。]");
         outputText("[pg]就这样，这位你曾帮助她逃离腐化魔爪的女人，离你而去了。正是因为你堕入了当初你将她从中解救出来的那股力量，才将她逼走。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1063,1);
         if(FlagDict_Impl_.arrayReadString(KFLAGS.flags,701) == "Marble")
         {
            KFLAGS.flags.remove(701);
         }
         get_player().removeStatusEffect(StatusEffects.CampMarble);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function lowIntelligenceGetsDruggedByCowSluts() : void
      {
         clearOutput();
         outputText("当每个人都拿到杯子后，克拉拉对你们所有人微笑，将自己的杯子举到嘴边说道：[say: 敬玛布尔的净化，也敬结识新朋友。]");
         outputText("[pg]你像周围的其他人一样，抿了一口分给你的茶。味道相当令人愉悦和放松，有点苦，但这只会增加效果。你放下杯子，对克拉拉微笑，告诉她茶的味道有多棒。克拉拉得意地笑了笑，用沙哑的声音说道：[say: 我很高兴你喜欢，亲爱的……] 等等，什么？");
         outputText("[pg]玛布尔把手放在额头上，然后质问道：[say: 什么，你在干什么，克拉拉？！] 克拉拉转向姐姐，带着得意的笑容告诉她：[say: 我在收回你愚蠢地决定扔掉的猎物。] 玛布尔倒在地上，而你感觉自己因为被下了药的茶开始失去意识。就在你昏过去之前，一个年轻漂亮的女人的脸庞占据了你的视线，她说道：[say: 来吧，让我们一起私奔吧。]");
         menu();
         addButton(0,"继续",partTwoOfLowIntelligencePCsFallingForTheIncrediblyObviousCowCuntsTrap);
      }
      
      public function losingToCowCuntsPageII() : void
      {
         clearOutput();
         outputText("就在这时，你震惊地意识到，一股熟悉的冲动正在你体内涌起。不，这比你记忆中的还要强烈得多。你想要母乳。你<i>需要</i>母乳，如果你得不到它，你就会死。更糟糕的是，你也知道那是谁的母乳。玛布尔的妹妹克拉拉，已经让你对她的乳汁产生了致命的成瘾。");
         outputText("[pg]几乎就像是排练好的一样，你感觉到她的存在离你越来越近，然后你的俘获者走进了房间。[say: 啊，你醒了？]她轻声说道，[say: 希望你现在想喝点奶了？]你控制不住自己，你需要那乳汁，所以你点了点头。[say: 很好，看来让你睡一会儿是个正确的选择。]她放声大笑。");
         outputText("[pg][say: 现在，我的奶奴，你不打算过来喝奶吗？哦，对了，没有我的允许你做不到，不是吗？]她再次嘲笑你，而你继续盯着她。");
         if(get_game().marbleScene.get_knowAddiction() == 1)
         {
            outputText("[say: 哦？想知道我是怎么知道的？玛布尔在解释你摆脱成瘾的时候告诉我的。和她不一样，我会确保你乖乖听话。]");
         }
         else
         {
            outputText("[say: 困惑吗？那是玛布尔在研究她成瘾的本质时发现的事情之一。她说她不想用这些知识来烦你，但我看不出有什么理由不告诉你。]");
         }
         outputText("这个女人和她姐姐完全不同，她喜欢她对你拥有的权力，并且喜欢向你展示她拥有多少权力。");
         outputText("[pg]克拉拉俯下身，把脸凑到你面前。[say: 我觉得如果你想喝我的奶，就得为我做点事情。</i> 她的声音很轻柔，但态度却无比强硬。[saystart]从现在起，没有我的允许，你哪里也不准去，而且你只能爱我一个人。无论是精神上还是肉体上。明白吗？] 你打了个寒颤，想起了");
         if(get_game().camp.loversCount() == 1)
         {
            outputText("玛布尔");
         }
         else
         {
            outputText("其他人");
         }
         outputText("。然后你的目光落到了克拉拉的胸前，你想起了你的渴望。");
         outputText("[pg]这感觉就像是你下令杀死了你曾经关心过的所有人，但你还是点了点头。[say: 这还不够好，" + get_player().mf("小情郎","小情人") + "。我想听你说，“我爱你，我只爱你，我将永远只爱你。”如果你不说，那你就别想喝奶了。]她脸上露出了夸张的悲伤表情，听起来就像是在责备一个不听话的孩子。");
         outputText("[pg]你犹豫了一下，作为回应，这个白发牛娘扇了你一巴掌。[say: 说！]她尖叫着，脸上写满了疯狂。");
         outputText("[pg]你用几乎听不见的耳语说道，[say: 我爱你，我只爱你，我将永远只爱你。]");
         outputText("[pg][say: 大声点！]克拉拉大喊，嘴角掠过一丝不易察觉的微笑。");
         outputText("[pg][say: 我爱你，我只爱你，我将永远只爱你。]");
         outputText("[pg][say: 大声点！]克拉拉喊得更大声了，脸上挂着灿烂的笑容。");
         outputText("[pg][say: 我爱你，我只爱你，我将永远只爱你！]");
         outputText("[pg][say: 对！！！]这个疯女人尖叫着，眼神涣散，露出绝对幸福的神情。她喘息了一会儿，然后再次看着你，轻声说道，[say: 你现在是我的了，全都是我的。]");
         menu();
         addButton(0,"继续",cowCuntBadEndPartIII);
      }
      
      public function loseToClara(param1:Boolean = true) : void
      {
         clearOutput();
         if(param1)
         {
            if(get_player().get_HP() < 1)
            {
               outputText("你的身体因过度劳累而崩溃，你倒在了地上。在你昏过去之前听到的最后一件事，是克拉拉胜利的笑声。");
            }
            else
            {
               outputText("你再也无法抗拒了，绝望地开始在克拉拉面前自慰。克拉拉得意地笑着，走到你面前，强行把一粒药丸塞进你嘴里。片刻之后，你昏了过去。");
            }
            outputText("[pg]");
         }
         outputText("你梦见了一些奇怪的事情，扭曲的图像，你向它们呼救。然后你被拖走了。你不断看到更多感觉熟悉且重要的形状，但你无法集中注意力在它们身上。你一次又一次地呼喊，却又被其他东西拖走。最终，你呼救的声音变得微弱而敷衍；你知道接下来会发生什么，那又何必呢？突然，你意识到是一个牛娘在拖着你走；她的脸一开始看起来像玛布尔，然后裂开一个巨大、邪恶的笑容，你惊慌失措。");
         outputText("[pg]你费了很大的劲才睁开眼睛。你感到无比虚弱，想回去睡觉的欲望几乎无法抗拒。你的头转得像个陀螺，这更让你难受，但刚才噩梦带来的肾上腺素飙升让你能够强行压下昏睡感，把自己从地上拖起来，打量周围的环境。");
         outputText("[pg]看起来你是在一个有石墙的封闭建筑里，类似于地窖。考虑到墙壁周围的灰尘量，这个地方已经很久没有被使用过了。房间里有一个入口。那是一条走廊，在房间外面转了个弯，超出了你的视线。你躺在一个铺盖卷上，");
         if(get_player().get_tallness() < 70)
         {
            outputText("对你来说太大了。");
         }
         else if(get_player().get_tallness() <= 82)
         {
            outputText("正好适合你的尺寸。");
         }
         else
         {
            outputText("对你的身材来说太小了。");
         }
         outputText("你还发现你没有穿你的[armor]，而且你的[weapon]也不见踪影。");
         if(get_player().hasCock() && get_player().smallestCockArea() <= 40 && get_player().biggestTitSize() <= 25 && !get_player().isTaur() && !get_player().hasTailInsteadOfLegs() && !get_player().isGoo() && !get_player().isDrider())
         {
            outputText("取而代之的是，你身上穿着一件朴素但相当修身的两件套衣服。不管是谁给你穿上这身衣服，绝对是想让任何看着你的人都能完全看到你的身体资产。");
         }
         else
         {
            outputText("你一丝不挂。");
         }
         menu();
         addButton(0,"继续",losingToCowCuntsPageII);
      }
      
      public function letGoOfMarblesCowCuntSister() : void
      {
         clearOutput();
         outputText("你说既然克拉拉不再对任何人构成危险，她就可以自由离开了，只要她保证永远不再打扰你或你的追随者。玛布尔对此点点头，说她同意你的决定。");
         outputText("[pg]你和玛布尔解开了克拉拉的束缚，把她的东西还给她，并护送她出了营地。她甚至看都没看你们一眼，直到她走到营地边缘，你告诉她离开，永远不要再回来。她看了你一眼，那是一种纯粹的愤怒和仇恨的眼神，就像一个发誓要复仇的人，但这种眼神转瞬即逝。她走出营地，传送离开了。");
         menu();
         addButton(0,"继续",purificationQuestFinal);
      }
      
      public function letCorruptCowCuntGo() : void
      {
         clearOutput();
         outputText("你说你要放克拉拉走，但她必须保证永远不再回来，不再打扰你或你营地里的任何人。玛布尔震惊地看着你，问你是否绝对确定要这么做。当你给出肯定的答复时，她叹了口气，说她会相信你的判断。");
         outputText("[pg][say: 真的吗？在经历了这一切之后，你就打算放我走？好吧。我保证永远不再回来，也不再打扰你们任何人。]");
         outputText("[pg]你解开她的束缚，把她的东西还给她，并护送她出营地。她给了你一个邪恶的微笑，然后走出营地，传送离开了。你希望那不是一个错误。");
         menu();
         addButton(0,"继续",purificationQuestFinal);
      }
      
      public function lactaidForPureMurble() : void
      {
         clearOutput();
         outputText("你递给玛布尔一瓶催乳剂，并让她喝下去。她向你点点头，将瓶子举到唇边。[say: 味道还不赖。哦！] 她惊讶地叫出声来，接着发出一声性感的呻吟，开始隔着上衣抚摸和把玩她那如母牛般的乳房。她捏了捏乳头，认真地挤压着乳肉，然后发出一声长长的叹息，听起来几乎像是一声牛叫。[say: 我刚才好像经历了一次小小的乳房高潮……] 她摇了摇头，重新把注意力集中在你身上。[say: 亲爱的，我想那东西刚才让我的乳房充满了奶水。我现在有很多奶水，如果你感兴趣的话……]");
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,1055,FlagDict_Impl_.arrayReadInt(_loc1_,1055) + 10);
         _loc1_ = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteFloat(_loc1_,3,FlagDict_Impl_.arrayReadFloat(_loc1_,3) + 20);
         if(FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,3) < 0)
         {
            FlagDict_Impl_.arrayWriteFloat(KFLAGS.flags,3,0);
         }
         get_player().consumeItem(get_consumables().LACTAID);
         doNext(get_marbleScene().giveItem);
      }
      
      public function highIntelligenceOutcomesVsCowCuntDrugs(param1:int = 0) : void
      {
         clearOutput();
         outputText("很明显，克拉拉在搞什么鬼；每次她和你说话时，举止都很古怪，而这次分享茶似乎更古怪。你仔细观察她数着杯子，开始倒茶，然后分发。你还注意到她的配料中包含了一些茶具之外的东西。");
         outputText("[pg]决定时间：你打算当着");
         if(param1 <= 1)
         {
            outputText("玛布尔");
         }
         else
         {
            outputText("你的追随者");
         }
         outputText("的面揭穿她的古怪行为，还是自己不喝茶，或者不管怎样都喝下去？");
         menu();
         addButton(0,"喝茶",lowIntelligenceGetsDruggedByCowSluts);
         addButton(1,"不喝",mediumIntelligenceDoesntDrinkCowCuntsTea);
         addButton(2,"揭穿她",highIntelligenceCallClaraOut);
      }
      
      public function highIntelligenceCallClaraOut() : void
      {
         var cheated:Boolean;
         var _g:MarblePurification;
         clearOutput();
         outputText("当克拉拉准备递给玛布尔一杯茶时，你拦住了她，平静地问她为什么不给自己也倒一杯？[say: 哦，我，呃，]她结结巴巴地说道。你继续逼问她，问她刚泡完茶后加进壶里的那瓶额外液体是什么。[say: 呃，只是一些特殊的调味料！]她紧张地惊呼道。");
         outputText("[pg]此时，克拉拉似乎明显动摇了，只是在困惑和怀疑的目光中来回扫视。[say: 该死！]她尖叫着，把玛布尔的杯子掉在地上。这位好茶的接受者也惊讶地叫了一声，然后试图接住掉落的杯子。克拉拉看到了这个机会，决定拔出一把看起来很重的狼牙棒。她挥舞着那把钝器，狠狠地砸在了你牛娘情人的头上，在玛布尔有机会回应你的警告之前。");
         outputText("[pg]玛布尔倒在地上，随后的几秒钟里，一片死寂。肇事者转过头来，用疯狂的眼神看着你，然后大喊：[say: 事情本来不必变成这样！如果你乖乖喝了茶跟我走，就不会有人受伤，但不，你就是太聪明了，聪明反被聪明误。]");
         if(get_camp().companionsCount() >= 3)
         {
            outputText("[pg]克拉拉拿着狼牙棒向你逼近，眼中充满愤怒，但当她意识到茶会的其他客人也站了起来，并准备好武器时，她犹豫了。");
            if(get_amilyScene().amilyFollower())
            {
               outputText("[pg]艾米莉那通常温顺的脸上露出了令人惊讶的凶狠表情，她咆哮着，迅速掏出她熟悉的吹箭筒，从身上的某个地方装上一支飞镖，然后向后退去，以确保自己处于安全的射击距离。");
            }
            if(followerHel())
            {
               outputText("[pg][say: 你这婊子，你会为此付出代价的，] 赫尔咆哮着，从腰间拔出弯刀，直指那个女人，发出挑衅的挑战。");
            }
            if(isabellaFollower())
            {
               outputText("[pg][say: 小婊子！] 牛娘咆哮着，站直了她那令人印象深刻的高大身躯。[say: 我会教训你，让你不敢再尝试这种事。] 伊莎贝拉抓起她的盾牌，显眼地挥舞着，准备用它来防御和重击。");
            }
            if(jojoFollower())
            {
               outputText("[pg][say: 如果我是你，我就不会这么做，] 乔乔说着，从地上站起来，拿回了他的法杖。他摆出战斗姿势，脸上的表情扭曲成一种几乎不符合他性格的愤怒，直指你面前的女人。");
            }
            if(followerKiha())
            {
               outputText("[pg]龙女奇哈毫不迟疑；她毫不客气地喷出火焰，挥舞着斧头，带着致命的残忍意图，即使在等待发动攻击的时刻，也散发着威胁。");
            }
            outputText("[pg]你也站了起来，准备好你的[weapon]，因为即使面对这样的反抗，这个疯狂的牛娘似乎仍然打算和你战斗。几分钟和几处瘀伤之后，她被打败的身体证明了这在某种程度上是她的一个错误。");
            menu();
            _g = this;
            cheated = true;
            addButton(0,"继续",function():void
            {
               _g.defeatClaraCuntInAFight(cheated);
            });
         }
         else
         {
            outputText("[pg]克拉拉撕开她的衬衫，开始向你逼近，她拿出狼牙棒，眼中充满愤怒。你自己也站了起来，准备战斗。");
            outputText("[pg]随着玛布尔倒下，看来这场战斗你只能靠自己了。");
            startCombatWithMarbleSister(true);
         }
      }
      
      public function giveMarblePureQuestLabova() : void
      {
         clearOutput();
         get_player().consumeItem(get_consumables().P_LBOVA);
         outputText("你告诉玛布尔，你设法通过炼金术净化了一些拉波娃，你想让她喝一些。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1057) == 0)
         {
            get_player().addStatusValue(StatusEffects.Marble,4,-4);
            outputText("[pg]你的牛娘爱人平静地注视着你的眼睛，点了点头，伸出手向你要药瓶，你把药瓶递给了她。她打开这瓶乳白色的液体，毫不犹豫地一饮而尽。");
            outputText("[pg]她立刻把空瓶子扔在地上，瓶子摔得粉碎。她的双手捂住肚子，用力按压着。她痛苦地皱起眉头，肚子发出清晰的咕噜声，似乎在抗拒她强行喝下的异样液体。她弓起背，发出一声痛苦的呻吟，她的");
            if(get_player().statusEffectv2(StatusEffects.MarbleSpecials) == 4)
            {
               outputText("八个");
            }
            else
            {
               outputText("两个");
            }
            outputText("乳头突然喷射出乳汁，浸透了她的衬衫，甚至能看到乳汁穿透布料喷出弧线。几分钟过去了，乳汁四处喷洒，但随后又像开始时那样突然停止了。玛布尔松了一口气，拍了拍肚子。[say: 感觉真不好受……希望我不用经常经历这种事。] 然后她意识到自己的衬衫已经湿透了。[say: 哎呀，不，我的衬衫！我从小姑娘时期起就没自己挤过奶了，] 她抱怨着，脱下被乳汁浸透的衣服，伤心地看着它。[say: 我得把它晾干，换件备用的……] 她嘟囔着，而你则礼貌地离开，让她自己处理。");
         }
         else if(get_player().statusEffectv4(StatusEffects.MarbleSpecials) <= 30)
         {
            outputText("[pg]你毫不客气地把那瓶净化过的拉波娃递给玛布尔，她一饮而尽。你等待着通常的反应，但令你惊讶的是，什么也没发生。你问牛娘她感觉还好吗。");
            outputText("[pg][say: 我……一点也没觉得有什么不同，亲爱的，] 玛布尔回答道，看起来和你一样困惑。[say: 我猜这东西已经不起作用了——我肯定需要比这更强效的东西才能完全净化自己，] 她若有所思地说。");
            outputText("[pg]你问她有没有什么办法能完成净化。");
            outputText("[pg][say: 嗯……我不太确定；我的意思是，腐化不是像旧油渍那样洗洗就能掉的。如果那么容易就能消除，恶魔们就不会把世界逼到悬崖边上了。] 牛娘告诉你。她若有所思地揉了揉下唇。[say: ……我建议你去和拉萨祖尔谈谈；他可能有办法。] 玛布尔说完耸了耸肩。你消化了这些信息，答应会去调查，然后转身离开，留下她独自沉思。");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1059,2);
         }
         else
         {
            get_player().addStatusValue(StatusEffects.Marble,4,-4);
            outputText("[pg]你的牛娘爱人平静地注视着你的眼睛，点了点头，伸出手向你要药瓶，你把药瓶递给了她。她打开这瓶乳白色的液体，毫不犹豫地一饮而尽。");
            outputText("[pg]她赶紧脱下衬衫，以免再次弄脏，让她那巨大、沉重的");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,465) > 1)
            {
               outputText("、长满毛发的");
            }
            outputText("乳房自由地垂下。她坚忍地忍受着痛苦，肚子发出巨大的咕噜声和呻吟声，她骄傲地托起乳房，她的");
            if(get_player().statusEffectv2(StatusEffects.MarbleSpecials) == 4)
            {
               outputText("八个");
            }
            else
            {
               outputText("两个");
            }
            outputText("乳头开始四处喷洒乳汁——你不得不后退一步，以免被喷到。终于，玛布尔的乳房停止了喷射，留下你们俩站在一个乳白色的泥坑里。牛娘把衬衫重新穿在身上。[say: 那东西尝起来还是很恶心，但我想这是值得的。我只希望它能快点起效，] 她告诉你。你向她保证，你相信她有能力度过难关，然后回到了营地的主要区域。");
         }
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,1057,FlagDict_Impl_.arrayReadInt(_loc1_,1057) + 1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function futaMarbleIsAHugeCowToCowCuntAndStuffsCowCuntsCuntFullOfCowCock() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_clara());
         outputText("你向玛布尔喊话，建议她用她的新“器官”来惩罚克拉拉。她犹豫了片刻，然后点了点头。你怀疑如果她不是像现在这样情绪激动，你根本不可能让她做这种事。");
         outputText("[pg][say: 什么新器官？]克拉拉忐忑不安地问道，脸上写满了恐惧。玛布尔掀起裙子，露出了她正在勃起的阴茎。[say: 搞什么鬼？！]这是对这一景象的反应。在正常情况下，你的伴侣在使用她那七英寸长的肉棒时总是充满恐惧。但现在，当她把克拉拉推倒仰面躺下，并将妹妹的双腿压在自己躯干上时，她只表现出了渴望。[say: 不，不，不，我才不要把我的初夜交给我的姐姐，我才不要把我的初夜交给我的姐姐。该死，玛布尔，停下！]");
         outputText("[pg]姐姐犹豫了片刻，[say: 你对试图从我身边抢走[name]感到抱歉吗？]");
         outputText("[pg][say: 什么？不，我为什么要抱歉？]");
         outputText("[pg]玛布尔蹲在她妹妹那未经人事的小穴前。");
         outputText("[pg][say: 嘿，你不能这样！我是在帮你！啊啊啊啊！] 扶他肉棒抵上了一个从未被入侵过的入口。克拉拉震惊地喘息着，她的姐姐给了她片刻的喘息时间。然后，她的姐姐开始在被玷污的入口处抽插起来。");
         outputText("[pg][say: 哇，嘛，不，求你了！] 显然，她的愿望不会实现，尽管她再次拼命挣扎着想要挣脱束缚。只要妹妹拒绝改变态度，她的惩罚就会继续下去，而这种态度似乎很难改变。即便如此，听起来她的身体真的很享受这种待遇，这让她非常沮丧。每一次对克拉拉小穴的强力抽插都让她舒服得呻吟出声，同时，她又继续为这一切的羞耻而哭泣。");
         outputText("[pg]至于玛布尔，她似乎在好几个层面上都很享受这一切。她显然很渴望惩罚自己的妹妹，同时，用肉棒在小穴里摩擦滑动的陌生快感，也让她发出了销魂的呻吟。你努力在一旁观看，确保惩罚执行到位——至少你是这么告诉自己的。你并没有把全部注意力都放在她们的性爱上，但随着她们的每一个动作，那两对巨大乳房的摇晃与弹跳实在是令人着迷。");
         outputText("[pg]你的伴侣原本节奏平稳的抽插变得越来越疯狂，让年轻的牛娘发出了越来越响亮的呻吟。[say: 玛，什么，哦，哈。] 她甚至连抗议的声音都发不出来了。初尝禁果的她完全被性爱的快感冲昏了头脑。她仍在挣扎着想要挣脱束缚，但你觉得她更像是在试图把玩自己那剧烈晃动的双乳。响亮的肉体拍打声伴随着两个汗流浃背的女孩发出的淫声浪语，一个被绑着，另一个在抽插。此时两人发出的声音很相似，但也不难区分。妹妹的声音中带有更强烈的牛叫声，而玛布尔的声音则要轻得多。");
         outputText("[pg]一声响亮的[say: 哞——！]突然从克拉拉那杂乱无章的呻吟、喘息和语无伦次的胡言乱语中爆发出来。然而，她的姐姐并没有因为那次高潮而停下，而是继续猛烈地抽插，让这个语无伦次的废人又持续了几秒钟。接着，玛布尔自己也迎来了高潮，伴随着她标志性的喘息和悠长低沉的呻吟。那是一声比妹妹要柔和得多的牛叫。");
         outputText("[pg]这场交欢中的扶他喘息了片刻，然后问道：[say: 你……哈……现在吸取教训了吗？]当回答只是一声含糊不清的呻吟时，看起来玛布尔似乎准备开始第二回合了！");
         dynStats(DynStat.Lust(20));
         menu();
         addButton(0,"继续",calmMurblesFatAssDown);
      }
      
      public function finalBadEndWithCowCunt() : void
      {
         clearOutput();
         outputText("几年后……");
         outputText("[pg]你走在一条林间小路上，肩膀上扛着你陷阱里最新的猎物。今天是个好日子。应该有足够的肉让蒂姆为你们所有人做一顿美餐，加上剩菜至少能吃好几天。毫无疑问，萨姆看到你抓到了他最喜欢的野火鸡会特别高兴。这些天随着腐化程度的增加，越来越难找到好的猎物了。这并不是说森林里曾经没有腐化，但自从你结束任务以来，情况肯定变得更糟了。");
         outputText("[pg]你来到了目的地：树林中的一块空地。透过树叶，一座两层小屋的熟悉结构映入眼帘，那是多年前你、蒂姆和萨姆为你深爱的妻子建造的。请注意，从那以后，这座建筑进行了一些升级。它最初没有第二层，但“城堡”的女主人没有要求任何更多的改变，所以它目前的状态已经持续了一年多。你有足够的时间来适应现在的外观。萨姆对此也很高兴，因为翻新通常意味着花园必须搬迁……又一次。");
         outputText("[pg]说到那只友好的狐狸，他现在就在那里；正在摘一些草莓和土豆准备晚餐。你向他打招呼，走过去进行更私人的交谈。[say:嘿，[name]，下午好！]伴随着这句话的是一个灿烂的笑容，他总是那么友好。萨姆站起来，拍掉一天的灰尘，然后看了一眼今晚的主菜。[say:好家伙！你那是火鸡吗？]看到你点头，他笑得嘴都快咧到耳根了。[say:好吧，我不耽误你了。赶紧把那只鸟给蒂姆送去！]你再次向你的同伴点头，继续前进。");
         outputText("[pg][say: 萨姆，是你吗？[name]带什么东西回来了吗？]当你推开小屋的门时，一个胆怯的声音呼唤道。你回答说让他自己来看看。一个矮小苗条的猫科男性跑进房间。当他看到你带回来的东西时，脸上露出了惊讶的表情。[say: 哇哦，这可是大丰收！很高兴看到你这次弄到了好东西，女孩们一直吵着要吃蔬菜以外的东西……]你和他一起走进厨房，这时两个兴奋的牛娘哒哒哒地跑了出来。如果情况真的很糟，你就不得不开始收获被污染的肉了。蒂姆做了个鬼脸，[say: 我可不期待那个，我还是比较喜欢孩子们现在保持小孩子的样子。]");
         outputText("[pg]你摸了摸这个小猫人的头。他现在不用太担心，我们今天的状况其实很好。那张可爱的脸庞亮了起来，[say: 你说得对，[name]。我相信你总能想出办法的，这就是为什么你是第一任丈夫。]这确实是真的。你绝不可能让你的爱人们失望，尤其是你的女主人。你洗漱完毕，然后上楼。她会在晚饭前想见你。她总是这样。");
         outputText("[pg]二楼除了楼梯顶部的一个小平台和女主人卧室的门之外，没有太多东西。当你举起手敲门并报上名字时，一阵轻微的寒意顺着你的脊背流下。[say: 回来了？进来吧，第一任丈夫。我想在你身上满足一下。]你对此感到害怕。<i>不，你没有，你喜欢满足你的女主人！</i>");
         outputText("[pg]尽管你脑海中仍在挣扎是该感到恐惧还是喜悦，你还是条件反射般地打开门，走进了<i>她</i>的卧室。这是一个很大的房间，墙边散落着几个衣柜和珠宝盒。一面墙被一个带有三面镜子的巨大梳妆台占据，尽管除了戴项链和耳环外，它很少被使用。当然，房间的主要特色是靠后墙摆放的那张大床。它足足有十英尺乘十英尺那么大，而你那白发苍苍、眼神残酷（<i>美丽</i>）的主人正慵懒地躺在上面；忙着欣赏她那些华服和首饰的各个切面。");
         outputText("[pg]自从克拉拉拥有你以来，经过多次怀孕和又多了两个奴隶，她在这几年里成长了许多。她的乳房现在轻松达到了I罩杯，臀部也变宽了许多。随着她获得新的力量，虚荣心也随之膨胀。没有改变的，是她疯狂的目光和邪恶的笑容。<i>关于她的一切都变得更加美丽和奇妙，随着她变得更加迷人，你只想更加奉献自己！</i>");
         outputText("[pg][say: 过来，产奶奴隶。乞求你的食物，也许我会满足你，]她挥了挥手，轻蔑地说。你带着不情愿（<i>崇敬</i>）在她面前跪下，<i>承认你的上级感觉是对的</i>。在你摆出姿势几分钟后，上方那个虚荣而丰满的女人再次出声，[say: 很好，现在说话，[name]。]你抬起头，带着极大的犹豫（<i>渴望！</i>）背诵着过去几年里你每天都会说的那些贬低自己的话。");
         outputText("[pg][say: 我的女主人，我的女神。我为侍奉您而存在。我的生命是您的，您的乳汁是我的生命。只要您下令，我将把自己贬低到最底层，或战胜最强大的敌人。请怜悯这个不配的人，赐予我生命之血。]");
         outputText("[pg]最后，克拉拉转过头来看你。她满怀满足地解开衣服，命令你吸吮她的乳房。满足你的需求和每天一样。<i>奶水，甜美可口的奶水，需要，需要，需要。必须侍奉女主人。</i>你真的无法控制自己，你<i>需要！侍奉，我做得对吗？我会取悦你</i>该死的奴隶主。<i>最美妙的女士！请原谅我无礼的想法。需要，需要，需要！</i>");
         outputText("[pg]一旦你喝完，女主人指示你躺在她的床上。她想用你来取悦自己。像往常一样，你很乐意顺从。就像很久以来的情况一样，她骑上了为你定制的装备：一根9乘1.6英寸的猫咪肉棒。你很高兴能如此出色地充当她的性玩具。看着世界上最美丽的女人在你身上弹跳，穿着那件精致的裙子，胸部仍然暴露在外，在你上方翻滚，这让你充满了喜悦。");
         outputText("[pg]这就是你现在的生活。沦为一个对乳汁上瘾的泌乳牛娘的奴隶，你放弃了你的任务，余生只为侍奉和被使用。");
         get_game().gameOver();
      }
      
      public function fightCowCuntAfterBeingTotesMcGoatsDrugged() : void
      {
         clearOutput();
         outputText("你下定决心，");
         if(get_player().get_weapon().isUnarmed())
         {
            outputText("举起你的[weapon]");
         }
         else
         {
            outputText("抓起你的[weapon]");
         }
         outputText("并准备战斗，以使自己从这个疯狂挤奶女工的乳房中解脱出来。意识到你的意图，克拉拉的脸从疯狂的笑容变成了愤怒的瞪视。她带着几乎无法抑制的愤怒向你尖叫，[say: 哦，别担心，亲爱的，我会<b>让</b>你爱上喝我的奶的！]然后站起来，举起一把看起来很恶心的重型狼牙棒，向你冲来。");
         startCombatWithMarbleSister(false);
      }
      
      public function dumbshitCowCuntsTryToDrugYouBecauseTheyreCunts() : void
      {
         var _g:MarblePurification;
         clearOutput();
         outputText("回到营地中心，你发现玛布尔坐在一旁，看起来相当恼火，而克拉拉正忙着从包里拿出许多杯子。你对发生的事情感到好奇，便坐在玛布尔旁边，看着克拉拉检查壶的温度。过了一会儿，你问你的牛娘情人为什么她只是看着。[say: 我生好火后，克拉拉坚持说如果我帮忙，只会碍事并毁了这壶茶，] 她恼怒地抱怨道。");
         outputText("[pg]片刻之后，克拉拉放在火上的水壶开始发出尖锐的哨声，她一边将水壶拿开，一边惊呼道：[say: 准备好了！] 妹妹站起身环顾四周，然后转向你，问大家是不是都到了。当你点头确认后，她微笑着开始倒茶并分发给大家。");
         if(get_player().get_inte() >= 60)
         {
            _g = this;
            addButton(0,"继续",function():void
            {
               _g.highIntelligenceOutcomesVsCowCuntDrugs();
            });
         }
         else if(get_player().get_inte() >= 30)
         {
            addButton(0,"继续",mediumIntelligenceReactsToDrugging);
         }
         else
         {
            addButton(0,"继续",lowIntelligenceGetsDruggedByCowSluts);
         }
      }
      
      public function dontPurifyClara() : void
      {
         clearOutput();
         outputText("不，你会仁慈地让她保留她那宝贵的腐化。玛布尔告诉你她会尊重你的决定。现在的问题是该怎么处理她。");
         outputText("[pg]你觉得如果你真的想亲自盯着她，你也可以在营地里建个笼子。那样她就会成为另一张要吃饭的嘴，而且你每天都得听她抱怨。不过，俗话说得好，\"把敌人留在身边。\"");
         outputText("[pg]如果你觉得特别宽宏大量，你也可以直接放她走，只要她保证永远不再回来，或者不再试图绑架你。");
         menu();
         addButton(0,"关进笼子",stickUnpurifiedClaraInACage);
         addButton(1,"放走",letCorruptCowCuntGo);
      }
      
      public function defeatClaraCuntInAFight(param1:Boolean = false) : void
      {
         get_marbleScene().marbleSprite();
         if(param1)
         {
            clearOutput();
         }
         else
         {
            if(get_player().statusEffectv1(StatusEffects.ClaraCombatRounds) >= 10 && get_player().hasStatusEffect(StatusEffects.ClaraFoughtInCamp))
            {
               clearOutput();
               outputText("随着玛布尔用她的锤子击中克拉拉的后脑勺，空气中回荡着一声巨响，还了之前把她打倒的那一击。你的袭击者瞬间倒地，战斗就此结束。你考虑过问问这只年轻的牛娘是否安好，但考虑到玛布尔似乎很快就自己站了起来，这应该不是问题。相反，你问你的伴侣她感觉如何。除了头上起了个包，玛布尔告诉你她没事。随着克拉拉在地上动弹，牛类的坚韧再次被证明是强大的。不到一分钟，你和玛布尔就站在了你爱人妹妹那被打败但仍有意识的身体旁。");
            }
            else if(!get_player().hasStatusEffect(StatusEffects.ClaraFoughtInCamp))
            {
               outputText("担心其他人的安危，你走出地窖，把克拉拉和她的东西一起拖了出来。多亏了这个世界奇怪的旅行方式，你没花多少时间就找到了回营地的路。你刚好在你的追随者们出发去找你之前赶上了他们，并把你的绑架未遂者扔在了他们面前。玛布尔走到你身边，低头看着她的妹妹。");
            }
            else if(get_game().camp.companionsCount() <= 2)
            {
               outputText("由于克拉拉暂时失去了行动能力，你去检查玛布尔的情况，确保她没事。谢天谢地，她似乎很好。你不打算在不久的将来再次低估牛娘的坚韧。既然她的妹妹暂时跑不了，你就等了一会儿让她恢复。这并没有花太长时间，很快你和你的爱人就站在了这只年轻牛娘被打败的身体旁。");
            }
            else
            {
               outputText("由于克拉拉暂时失去了行动能力，你去检查你的追随者，确保他们没事。谢天谢地，他们似乎只是睡着了。一时兴起，你翻查了这只精于算计的母牛的背包，看看她是否有任何东西可以抵消她药物的影响。幸运的是，她确实有一个贴着方便标签的草药袋，正是为了这个目的。既然这只年轻的牛娘暂时跑不了，你就把唤醒草药给你的营地成员服下。这没花多长时间，很快你和玛布尔就站在了你爱人妹妹被打败的身体旁。");
            }
            outputText("[pg]");
         }
         outputText("[say: 克拉拉，你到底想干什么？]玛布尔质问她的妹妹，她的手因愤怒而颤抖。");
         outputText("[pg][say: 找个伴侣，你以为呢？我打算把这里的" + get_player().mf("情郎","情妇") + "带走和我一起生活，]传来了令人难以置信的回答。");
         outputText("[pg][say: 找个……从我的心肝宝贝这里？！我们已经是伴侣了，你凭什么认为你可以直接进来把[him]偷走？]");
         outputText("[pg][say: 不，姐姐，你已经有过机会了。[name]并没有对你上瘾，这意味着[he]是自由的。这就是我们种族的规矩。]");
         outputText("[pg][say: 什么？这不可能……]玛布尔颤抖得更厉害了。");
         outputText("[pg][say: 呃，是的，爸爸对妈妈上瘾了，还记得她是怎么确保他做我们想要的任何事的吗？]");
         outputText("[pg][say: 爸爸？不，他是个很好的人，他不是……]");
         outputText("[pg][say: 他就是！你是不是傻啊，姐姐？我真不敢相信你连爸妈那次大吵一架都不记得了，就因为你求他教你战斗。“战场不是女人该去的地方，”爸爸喋喋不休地说，“他绝不会训练一个女孩。”结果呢，几个小时的戒断反应就让他闭嘴了。你训练的时候妈妈甚至还在旁边盯着他，确保他没有偷工减料或者真的伤到你。]");
         outputText("[pg]玛布尔惊恐地看着自己的双手，你勉强能听到她用近乎耳语的声音说：[say: 他的手在发抖，就像[name]一样……]");
         outputText("[pg][say: 你终于明白了。该死，姐姐，我真不敢相信你花了这么长时间才意识到。妈妈一直用威胁的手段让爸爸对她言听计从。我是说真的，难道你没有一种强烈的冲动去哺乳别人吗？找一个好伴侣，然后让他们对你上瘾？]克拉拉倾身向前，[say: 告诉我，你有没有考虑过和一个不喝你奶的人谈恋爱？]");
         outputText("[pg]玛布尔握紧双拳，怒视着克拉拉。[say: 我，我……]");
         outputText("[pg][say: 承认吧，你觉得这个“" + get_player().mf("小情郎","小情人") + "”根本不在乎你。如果他们不喝你的奶，他们怎么可能在乎你？你是个泌乳牛娘，给出你的奶对你来说是世界上最重要的事情。这不是爱。如果" + get_player().mf("他","她") + "没有真正对你上瘾，那就只是一厢情愿的迷恋。我把[him]从你身边带走是在帮你。]");
         outputText("[pg]你的牛娘同伴继续因为愤怒而颤抖，但也夹杂着恐惧和沮丧。[saystart]我，我，是的！我想让[name]对我的奶上瘾！我非常想！我很害怕[he]不会留在我身边，但我也觉得很压抑。");
         if(get_game().camp.loversCount() > 1)
         {
            outputText("我甚至不是[name]唯一的伴侣。[He]能满足他们的需求，却不能满足我的？");
         }
         outputText("不能哺乳的沮丧感，无论是谁，特别是我的伴侣，这种感觉快把我撕裂了！[sayend] 玛布尔停止了尖叫，低下了头。现在她只能发出沉重的呼吸声。");
         outputText("[pg][say: 瞧，你看到了吗？现在我敢肯定你明白为什么我和[name]是天生一对了。我不会否认事物的正确秩序，我会确保[he]作为我的奶奴过上充实的生活。[He]甚至会是我的第一任丈夫！]");
         outputText("[pg]你试探性地问克拉拉第一任丈夫是什么意思？");
         outputText("[pg]克拉拉对你的问题大笑起来，[say: 当然！我配得上比普通泌乳牛娘更好的。你要帮我再找至少两个丈夫，给我建一个完美的家，照顾我的孩子，满足我的一切需求。你应该感到荣幸。]");
         outputText("[pg]玛布尔小声嘟囔了一句。");
         outputText("[pg][say: 你说什么，姐姐？]");
         outputText("[pg]玛布尔深吸了一口气，然后说：[say: 那不是爱。]");
         outputText("[pg]年轻的牛娘嗤之以鼻，[say: 你没在听我说话吗，姐姐？[He]会对上瘾的。这。就是。爱。不然你还能怎么表达你有多在乎？]");
         outputText("[pg][say: 不，那是我们堕落的本能在作祟，]你关心的泌乳牛娘平静地开口。[say: 爱是关心某人，并得到对方的关心。这意味着你愿意为了你爱的人而改变。]她的声音变得坚定，[say: 把你认为完美的伴侣强加给别人不是爱。那是奴役。那是邪恶。]");
         outputText("[pg][say: 真的吗？你不是说你净化自己的原因是为了让[he]再次喝你的奶吗？在你说了那么多为了你“爱”的人做事之后，这听起来相当自私。]");
         outputText("[pg][say: 嗯，也许是这样，但事情远不止如此，]玛布尔的脸上掠过一丝阴霾，然后她轻声说，[say: 即使这会伤害我。]");
         outputText("[pg][say: 那如果[name]那么爱你，为什么[he]不能为了你而改变？为什么他们不能通过上瘾来证明他们有多爱你？]");
         outputText("[pg]玛布尔咽了口唾沫，然后说道：[say: 你知道[name]想要做什么吗？[He]想要击败恶魔！彻底阻止腐化！]");
         outputText("[pg]听到这话，克拉拉大笑起来：[say: 哦，我猜是拯救世界？就凭这个[race]？别开玩笑了。]");
         outputText("[pg]玛布尔再次气得浑身发抖。");
         outputText("[pg][say: 说真的，像 " + get_player().get_short() + " 这么可悲的家伙绝对不可能做到那种事，]她一边挣扎着站起来一边继续说道。[say: 你得是个二十英尺高的巨人、勇者战士、魔法之神，才能完成消灭恶魔这种壮举。[name]根本不是那块料。你真的认为有能力做到的人会在乎你这种低贱的泌乳牛娘吗？]克拉拉用手指戳了戳玛布尔的胸口。[say: 我想我们同类中的那句俗话是对的，“长女的奶最酸”。]");
         outputText("[pg]你不禁暗想，牛娘的耐力绝对不容小觑。她们的力量虽然算不上顶尖，但也比普通人类强出不少。激怒一个相当强壮的人通常是个坏主意。尤其是当那个人在农场里干了将近一年的活，举着越来越重的东西，还用一把巨大的锤子训练的时候。");
         outputText("[pg]克拉拉毫无胜算。没过多久，她就再次被按倒在地，被粗绳紧紧捆住。[say: 是时候给你点教训了！]玛布尔大喊，眼中满是怒火。");
         outputText("[pg]你应该怎么惩罚克拉拉？你可以让玛布尔打克拉拉的屁股，");
         if(get_player().hasCockThatFits(20) || get_player().hasVagina())
         {
            outputText("利用玛布尔不稳定的精神状态，让她和克拉拉强行来一场三人行，");
         }
         if(get_player().hasCockThatFits(get_marbleScene().marbleCuntCapacity()) || get_player().hasVagina())
         {
            outputText("在克拉拉面前做爱，让她看看你们的爱究竟是什么样的，");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,4) > 0)
         {
            outputText("怂恿玛布尔用她的肉棒侵犯克拉拉，");
         }
         outputText("或者试着让玛布尔冷静下来，这样她就不会对她妹妹做什么了。");
         menu();
         addButton(0,"打屁股",murbleSpanksCowCunt);
         if(get_player().hasCockThatFits(20) || get_player().hasVagina())
         {
            addButton(1,"三人行",pcAndMurbleDoubleTeamCowButt);
         }
         if(get_player().hasCockThatFits(get_marbleScene().marbleCuntCapacity()) || get_player().hasVagina())
         {
            addButton(2,"NTR",NTRIsClearlyTheWorstFetishWhyWouldYouWriteThisOMG);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,4) > 0)
         {
            addButton(3,"玛布尔肉棒",futaMarbleIsAHugeCowToCowCuntAndStuffsCowCuntsCuntFullOfCowCock);
         }
         addButton(4,"冷静",calmMurblesFatAssDown);
      }
      
      public function dealingWithCowCuntPostPurification() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_clara());
         outputText("现在，在净化玛布尔的整个努力中，只剩下一个未解决的问题：她的妹妹。");
         outputText("[pg]她仍然躺在地上，被绑在火坑旁。恰好，几个废弃的杯子躺在她旁边，她的茶壶在她脚边翻倒。你们的归来并没有被忽视。[say: 终于想起我了，是吗？你们这些该死的恶人，你们知道我是什么样的人吗？]");
         outputText("[pg][say: 那种因为小时候父母的极度溺爱，就认为自己理应得到全世界的人，]玛布尔回答道。[say: 然而，你确实应得一件事。谢谢你，妹妹，给了我你的奶。我现在已经被净化了，我的奶任何人喝都是安全的。]");
         outputText("[pg][say: 恭喜！你不再是泌乳牛娘了。我并不是想阻止你这么做，但现在你绝对不配再拥有伴侣了。你甚至不能声称拥有一个。]克拉拉把注意力转向你，[say: 你听到了吗，" + get_player().mf("情郎","情妇") + "？你不配拥有像她这样的伪泌乳牛娘。我可以给你真正想要的。]");
         outputText("[pg][say: 我真不敢相信，克拉拉，事到如今你还在费什么劲？]");
         outputText("[pg][say: 滚开，变种人，]她立刻打断了她妹妹的话。[say: 我要告诉我命中注定的伴侣，[he]错过了什么样的生活！我知道你仍然渴望真正的泌乳牛娘的奶水。一旦你尝过，你就会知道你永远都想要它。跟我走吧，做我的奴隶，你会再次获得真正的幸福！]一个病态的笑容浮现在她的脸上，她的疯狂显露无疑。");
         outputText("[pg]玛布尔叹了口气，然后再次开口，[say: 我觉得在你决定怎么处置你之前，你至少应该知道这些，姐姐。]她转向你，[say: 那么，[name]，你是她试图绑架和奴役的人。你觉得我们该怎么处置她？]");
         outputText("[pg]正如你和玛布尔之前讨论的那样，净化克拉拉对她来说是一个非常合适的惩罚。这将永远阻止她让任何人对她上瘾，你也不需要担心放她出去。当然，她肯定一点也不喜欢这样。");
         menu();
         addButton(0,"净化",purifyMurblesSister);
         addButton(1,"不净化",dontPurifyClara);
      }
      
      public function cowCuntBadEndPartIV() : void
      {
         clearOutput();
         outputText("现在你有机会看到克拉拉温柔的一面了。这位牛娘轻轻捧起你的头，引导你含住另一侧乳头。在你温柔地开始吸吮时，她依然用一只手臂搂着你。另一只手则抚摸着你。她从你的头部开始，慢慢地梳理你的[hair]。然后，你的饲主轻轻捏了捏你的脸颊，你听到她说：[say: 你真是一个该死的性感尤物。]");
         outputText("[pg]她的手顺着你的身体向下移动，停在了你的[chest]上。她把玩了一会儿你的乳头，对你的反应咯咯直笑，然后又移到你的肚子上戳了戳。你的反应只引来了更多的笑声。你猜她想*感受*一下她的新玩具，当她抓住你的腿，继续在你身上寻找适合挠痒痒的地方时，你的想法得到了证实。");
         outputText("[pg]最终，戳弄和试探渐渐平息，年轻的牛娘现在对你的私密部位更感兴趣了。");
         if(get_player().hasCock() && !get_player().hasVagina())
         {
            outputText("此时你的[cocks]已经硬得像石头一样，克拉拉抚弄了几下。不过她似乎很快就失去了兴趣。");
         }
         else if(get_player().hasVagina() && !get_player().hasCock())
         {
            outputText("此时你已经变得相当湿润，克拉拉揉弄了几下你的[vagina]，然后扯了一下你的[clit]。");
         }
         else if(get_player().hasCock() && get_player().hasVagina())
         {
            outputText("此时你的性唤起在你的整个生殖器上表现得相当明显。克拉拉抚摸了你几下，但似乎并不怎么感兴趣。");
         }
         else
         {
            outputText("或者更确切地说，是你缺乏性器官。克拉拉似乎并不太在意；玛布尔肯定也告诉过她你这方面的情况。");
         }
         outputText("[pg]然后，克拉拉现在真正想玩什么变得相当明显了，你感觉到她的手指滑下并绕过你的身体。她抓了一把你的[ass]，然后将手指滑入你的股沟。那根手指一直没有停下，直到它推入你的[asshole]，引发了让你颤抖的反应，这让克拉拉高兴地笑了起来。受到鼓舞，这个牛娘将另一根手指插入你的后庭，开始在里面扭动。");
         outputText("[pg]现在你因为吸奶而过度兴奋，她玩弄你的屁股让你当场高潮。你一直吸吮的乳头从你嘴里滑落，抱着你的女人微笑着把你放回地上。显然，你的高潮并没有逃过她的眼睛。[say: 在这之后，我肯定得找些新花样来玩弄你，]她说道，那疯狂的笑容又回到了她的脸上，[say: 但现在，我想是时候做爱了。]");
         menu();
         if(!get_player().hasCock())
         {
            addButton(0,"继续",cocklessPCsGetAbusedByCowCunts);
         }
         else if(get_player().cockThatFits(20) < 0)
         {
            addButton(0,"继续",cockTooBigForCowCuntageBadEndage);
         }
         else
         {
            addButton(0,"继续",badEndDickThatFitsClara);
         }
      }
      
      public function cowCuntBadEndPartIII() : void
      {
         clearOutput();
         outputText("退一万步讲，她的眼神也绝对算不上友善。[say: 噢，别害怕，]她轻声安抚着你的情绪。[say: 你已经赢得了喝我奶水的权利。你应该感到高兴才对！]她依然微笑着，伸手解开了衬衫。那对丰满的乳房映入眼帘，瞬间将你的渴望推向了顶峰，恐惧被抛到了九霄云外。你忍不住舔了舔嘴唇。[say: 噢，我喜欢你这副表情。以后你得多让我看看。现在，过来喝个够吧。]");
         outputText("[pg]仿佛闸门被打开了一般，你猛地扑上前，一口含住她的一侧乳头，这举动让你们俩都吃了一惊。不过克拉拉很快就回过神来，将你紧紧拥入怀中。然而，你根本不在乎这些。此刻对你来说，唯一重要的就是那流淌过嘴唇、滑入喉咙的甜美甘霖。世界上再也没有比你现在正在狂饮的这剂毒药更美妙的东西了。就连玛布尔的奶水也无法与之相比。");
         outputText("[pg][say: 真是热情啊！]一个遥远的声音从你上方传来，[say: 就连奥菲莉亚谈论“强力牛牛”和“牛娘”最新冒险时的样子，也比不上你现在的狂热！]你感觉到手指穿过");
         if(get_player().hair.length > 0)
         {
            outputText("你的[hair]");
         }
         else
         {
            outputText("你的头皮");
         }
         outputText("，然后猛地抓紧。[say: 让我看看你能不能加快速度。喝快点，我的爱奴！]你按照声音的要求做了，随之而来的是响亮的欢愉呻吟。");
         outputText("[pg]你拼尽全力地吸吮着：你必须这么做！除了满足自己的渴望，你根本无法顾及其他任何事情，而且你想以最好的方式来取悦你所爱的人。你不知道这持续了多久，但最终你被猛地从流淌着神仙甘露的源泉处拉开。你注意到你的[leg]湿了。你低头一看，发现克拉拉裙子的下半部分，就在她私处正前方，已经湿透了。[say: 该换个乳头了，" + get_player().mf("小情郎","小情妇") + "，]克拉拉气喘吁吁地说着，将你的视线重新拉回上方。[say: 这一次，我们要试着慢一点。]");
         menu();
         addButton(0,"继续",cowCuntBadEndPartIV);
      }
      
      public function cocklessPCsGetAbusedByCowCunts() : void
      {
         clearOutput();
         outputText("克拉拉双腿跨在你的头上，低头看着你。[say: 现在你要舔我，直到我满意为止。还有，没有我的命令，你敢乱动试试，听懂了吗？] 她没有等你的回答。[say: 很好，现在我们开始吧。] 这位牛娘迅速把她的小穴压在了你的脸上。");
         if(get_player().tongue.type > 0)
         {
            outputText("[pg][say: 舔我的小穴，深深地插进去！] 克拉拉命令道。你试探性地将你的[tongue]推入粗暴地压在你脸上的那道裂缝的入口。你很快找到了目标，开始用你那异于常人的长舌填满她。克拉拉惊讶地喘着气，急忙惊呼道：[say: 你在干嘛？！那是什么？停下！] 你按照要求，将你的器官从她的深处抽了出来。牛娘喘息了片刻，然后再次开口：[say: 好吧，一开始就这么猛有点受不了。呃，我没想到你的舌头会那么长！现在，我们再试一次。只用你的舌尖，舔我。]");
            outputText("[pg]你再次开始，只用舌尖舔舐上方女人阴唇的褶皱，引得她发出一声鼓励的欢愉呻吟。[say:对，继续。]克拉拉一边叹息一边指示。浓稠的润滑液开始填满你舌头正在探索的褶皱，你舔舐着她的花蜜，继续探索你能找到的阴唇的每一个部分。");
            outputText("[pg][say:嗯，呼，啊，再往上点！]你顺从地向上移动到克拉拉的阴蒂和周围的包皮。她已经严重充血，当你的[tongue]触碰到牛娘勃起的爱之按钮的瞬间，她发出了一声低沉的欢愉尖叫！[say:哇！哇，嘛，哞！]她大叫着，一股液体从她的私处喷涌而出，浸湿了你的脸。考虑到她如此迅速且出人意料的高潮，克拉拉毫无疑问是个缺乏经验的处女。她花了好一会儿才喘过气来。");
            outputText("[pg]终于，她平静下来并对你说：[say:好了，我还需要更多。用你那奇怪的舌头。填满我！]你照做了，伸出你那非人舔穴器的全部长度。几秒钟内，当你填满她的深处并品尝到大量她的润滑液时，克拉拉开始喘息并发出欢愉的尖叫。为了让克拉拉尽可能地享受，你将舌根抵在她的阴蒂上，同时在她的深处抽插。");
            outputText("[pg]有一段时间，你只能听到你的舔舐器在她私处发出响亮的吧唧声，以及上方年轻牛娘的欢愉叫声。然后你突然什么都听不到了，因为她的手紧紧捂住了你的耳朵。克拉拉突然在你给她口交的过程中扮演了更主动的角色，开始粗暴地骑乘你的脸。作为回应，你加强了舌头的挑逗，并在她的内部旋转你的长度。");
            outputText("[pg]突然，一股巨大的液体从你一直取悦的洞口倾泻而下。令你沮丧的是，这股液体实际上把你的[tongue]从她的通道里挤了出来，然后你差点被女孩的精液淹没。你咳嗽并喷溅了几秒钟，直到空气终于回到你的肺里。你之前拥有的精力现在已经消失殆尽。");
            outputText("[pg]克拉拉终于松开了对你头部的死亡之握，让你能再次活动。[say:哇，" + get_player().mf("情郎","情妇") + "。我从没想过你能做到那个！我猜我得到的奴隶有一个意想不到的功能。我还是会改变你，给我另一种快感，但是该死！看看你让我做了什么！]她指着地板上那一大滩阴道分泌物。你醒来时躺着的铺盖卷已经完全毁了。");
            outputText("[pg][say:我想你现在需要新的睡觉安排了，]年轻的牛娘评论道，[say:不过，我认为你在我的床上赢得了一席之地。]她弯下腰，抱起你疲惫的身体，把你带出房间。就在你在她怀里晕过去之前，你听到她在你耳边低语，[say:我永远不会让你离开我，你永远永远都是我的……]你不确定自己是否应该对这个前景感到高兴。");
         }
         else
         {
            outputText("[pg][say:舔我的洞！]克拉拉命令道。你试探性地照做了，用舌头在她的阴阜周围舔了一会儿。她之前高潮的味道还在那里。她发出一声赞许的呻吟，[say:嗯，很好，继续。]你重复了几次这个动作，引来更多的呻吟，并品尝到新鲜的牛娘润滑液流入你的嘴里。[say:对，现在，呃……舔深一点？]");
            outputText("[pg]听起来你上方的女人并不太确定她想让你做什么；不过，你最好还是照她说的做。你在她的褶皱周围挖得更深，把舌头推入她阴道的入口。不管她之前的犹豫，克拉拉似乎确实喜欢你正在做的事。[say:啊，嗯，再往上点！]她命令道，你把全部注意力集中在她的阴蒂上。你用舌头绕着那个充血的小按钮转圈，并深深地挖进包皮里。[say:嘛，哈，哞！]牛娘大叫着，一股液体从她的私处涌出，弄湿了你的下巴和脖子。");
            outputText("[pg]刚刚被你舔到第二次高潮的女孩在你上方喘息了一会儿，享受着余韵。然后她向后拉开身子，让你能看到她的脸。她正低头对你微笑，带着和之前一样令人不安的光芒。[say:我们还没完呢，差得远呢，]她漫不经心地通知你，然后移回你的脸上。接着她迅速而用力地把自己压在你的嘴上，开始在你的脸上摩擦，同时命令你再舔她一次。");
            if(get_player().hasMuzzle())
            {
               outputText("[pg]你试图做你之前对她做过的事，但克拉拉的动作让这变得相当困难。你的面部结构在这方面帮不上什么忙，特别是当牛娘决定她宁愿把你的口鼻当作活体假具时。她甚至懒得再给你任何命令，只是开始在你的脸上上下弹跳，用它来插入自己。欢愉的叫声充满你的耳朵，伴随着你的嘴和鼻子被困在她私处时发出的响亮吧唧声。[say:哦，哈，对，还要！]你不确定她为什么要费心，反正她甚至不让你做任何事。");
               outputText("[pg]没过多久她就结束了，你的脸被她高潮的证据浸透了。这似乎还不够，克拉拉又开始弹跳，进行第三回合。当牛娘停下来时，由于你的嘴和鼻子在阴道里呼吸困难，你已经几乎失去了意识。");
            }
            else
            {
               outputText("[pg]你继续舔舐牛娘的私处，但以她目前骑乘你的方式，这相当尴尬。最终你确实设法跟上了克拉拉粗暴摩擦的节奏。她显然很享受你的努力，因为她开始大声呻吟，然后第二次在你的脸上喷射。你的脸再次被她高潮的证据淹没。[say:对，对，还要！]她大叫着，然后开始比以前更用力、更快地骑乘你的脸。");
               outputText("[pg]就是这样，克拉拉对你来说太快太猛了。在不断摩擦你脸部的阴阜周围，你几乎无法呼吸，而且牛娘甚至懒得再下命令了。幸运的是，克拉拉没有持续太久，就把你从她的拱门下释放了出来。此时你已经几乎失去了意识。");
            }
            outputText("[pg]你设法恢复了足够长的时间，注意到克拉拉似乎有点失望。[say:你知道，口交真的没有我想象的那么好，]她评论道。[say:我肯定会寻找另一种方法让你能取悦我。反正你也没有任何立场抱怨或阻止我；你现在是我的了。]你晕过去之前看到的最后一件事是她那病态的笑容，听到的最后一件事是那些充满你耳朵的令人担忧的话语。[say:永远，永远……]");
         }
         menu();
         addButton(0,"继续",finalBadEndWithCowCunt);
      }
      
      public function cockTooBigForCowCuntageBadEndage() : void
      {
         clearOutput();
         outputText("[saystart]现在，我们确实有一个问题。");
         if(get_player().cockTotal() > 1)
         {
            outputText("你所有的阴茎都");
         }
         else
         {
            outputText("你的阴茎");
         }
         outputText("太大了，像我这样的处女根本塞不进去！我到底该怎么把它弄进我身体里？[sayend]克拉拉站起来，开始在房间里气得直跺脚。");
         if(get_player().hasCockThatFits(get_marbleScene().marbleCuntCapacity()))
         {
            outputText("[say: “这不是缺陷，这是特色，”她说，“这就是为什么我们要训练自己去承受巨大的天赋，”她说！去你的玛布尔！我才不要把那个又蠢又大的东西塞进我身体里。]");
         }
         else
         {
            outputText("[pg][say: 现在看来，玛布尔的烦恼也成了我的烦恼。“哦，他真是个很棒的人！”她说，“我绝不能强迫他为了我改变自己的身体，”她说！去你的玛布尔！如果连操都不能操，那要情人有什么用！]");
         }
         outputText("她继续抱怨了几分钟，然后转向你。[say: 你！在你开始滥用变身药剂之前，难道就没停下来考虑过像我这样娇小女孩的需求吗？] 她叹了口气，显然是没力气了。[say: 谁知道这个计划会这么难？]");
         outputText("[pg][say: 好吧，我确实没法操你，但我想我能从你身上得到点别的东西。记住，我们要解决的第一个问题就是你的尺寸问题，明白了吗？]");
         menu();
         addButton(0,"继续",cocklessPCsGetAbusedByCowCunts);
      }
      
      public function claraShowsUpInCampBECAUSESHESACUNT() : void
      {
         clearOutput();
         get_marbleScene().marbleSprite();
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1061,0);
         outputText("你刚起床，就听到两个快乐的女人在愉快地聊天；你听出其中一个是玛布尔，但另一个对你来说是个陌生人。不管她们是谁，显然相处得非常好，听起来都很兴奋。[say: 早上好，亲爱的！] 玛布尔看到你从[cabin]里出来，兴奋地喊道。[say: 让我给你介绍一下我的妹妹，克拉拉。]");
         outputText("[pg]另一个女人，你猜就是克拉拉，看起来确实和玛布尔有血缘关系。她显然也是个牛娘，有着许多和");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,465) <= 1)
         {
            outputText("你伴侣一样的特征");
         }
         else
         {
            outputText("你伴侣曾经有过的特征");
         }
         outputText("：牛腿、牛耳、牛角和巨大的乳房。然而，她没有玛布尔那样的棕色皮毛，而是腿上和耳朵上长着黑白相间的斑块，头顶上有一头白发。她穿着一件厚厚的连体布裙，上面装饰着大量精美的刺绣。你还估计她比玛布尔要娇小一些，无论是胸部还是身高。");
         outputText("[pg]克拉拉似乎很清楚你在想什么，她带着讽刺的口吻插话道：[say: 觉得你可能选错女孩了，魅力男孩？] 她等了一会儿，给了你一个严肃的眼神，然后突然大笑起来说：[say: 不，我只是在逗你。玛布尔把你们俩的事都告诉我了，我就是想见见你。] 玛布尔显然并不介意这个玩笑，事实上似乎还很享受。");
         outputText("[pg]你忍不住注意到克拉拉有时会拉长“o”的音，听起来几乎像牛叫，你想知道她为什么要这么做；毕竟玛布尔就不会。也许是语言障碍。你决定礼貌地忽略这一点，向克拉拉自我介绍，并告诉她很高兴见到玛布尔的家人……不过你不得不说，当你转向玛布尔，带着会意的微笑和她对视时，你本来以为她会带回一瓶奶，而不是一整个牛娘。");
         outputText("[pg][say: 就像我说的，在玛布尔告诉我你们为了避免对她上瘾而经历的挣扎之后，我就必须见见你，] 她愉快地说，看着你的眼睛");
         if(get_player().get_inte() >= 60)
         {
            outputText("脸上带着古怪的笑容");
         }
         outputText("。 [say: 玛布尔尊重你不沉迷于早晨牛奶的决定，这说明了她很多优点。只是别告诉别人，你可能会引发一场牛-运动！] 玛布尔听到这里大笑起来，你也忍不住轻笑了一声。[say: 那么，需要牛奶的炼金术天才在哪里？] 她说着，装模作样地站了起来。");
         outputText("[pg]你告诉她你会把她介绍给他，然后立刻带着玛布尔的妹妹走向营地里拉萨祖尔放睡袋和所有设备的地方。这位年迈的鼠人已经醒了，正用本生灯煮着一杯气味浓烈的东西。他越过你看着克拉拉，挑了挑眉毛。[say: 我猜，是玛布尔的妹妹？] 他问道。");
         outputText("[pg][say: 呃，是的，] 克拉拉慢吞吞地说，显然被这位年迈鼠人的外表吓了一跳。你猜她原本期待的是别的东西。[say: 很好，那你能给我一瓶你的奶吗？我需要它来配制配方，] 拉萨祖尔告诉她。她犹豫了一下，然后眼睛一亮，转向你说，[say: 你愿意赏光帮我挤出我们这位朋友需要的奶吗？只是别吸得太用力！我们可不想你走上另一条上瘾的捷径，对吧？] 她轻笑着");
         if(get_player().get_inte() >= 60)
         {
            outputText("笑得有些不自然");
         }
         outputText("。");
         outputText("[pg]还没等你回答，玛布尔走上前，把手放在克拉拉的肩膀上，有些生硬地对她妹妹说：[say: 附近有个农场，那里有挤奶器，我们可以用它来弄到我们朋友需要的奶。]");
         outputText("[pg]克拉拉看着她姐姐，脸上露出恼怒的表情，让你想起了以前在英格纳姆经常看到的兄弟姐妹之间的争吵。[say: 哎呀，别这样嘛姐姐，这样出来透透气也没什么不好的……而且，这样会快得多，也更有趣。]她转向你，把最后一句悄悄地在你耳边说，然后对你眨了眨眼。");
         outputText("[pg]这时拉萨祖尔突然插话道。[say: 如果[name]通过吸吮你的乳房来获取乳汁，[he]可能会用[his]唾液污染它，使其变得毫无用处。我需要它尽可能纯净；如果可以的话，最好是手工挤奶，但如果你们必须使用惠特尼农场的挤奶机，那也行。]");
         outputText("[pg]克拉拉听到这话，狠狠地瞪了炼金术士一眼。然后玛布尔摇了摇头，告诉大家：[say: 抱歉，我们产奶牛娘不太适合手工挤奶，挤奶器效果最好。别担心，应该不会花太长时间。]她再次拉了拉妹妹的肩膀，克拉拉又跺了一下蹄子，然后跟着姐姐走出了营地。");
         outputText("[pg]你转头看向拉萨祖尔，注意到他似乎对某件事感到异常担忧。他低声嘟囔了一句什么，然后转头继续喝杯子里的东西。你只听到了一句[say: 没安好心。]");
         menu();
         addButton(0,"继续",partTwoOfClaraShowingUpAndBeingACunt);
      }
      
      public function claraCampAddition() : void
      {
         var _loc1_:* = null as Array;
         var _loc2_:* = null as Array;
         var _loc3_:int = 0;
         outputText("传送门附近放着一个用来关押玛布尔妹妹克拉拉的大木笼。它的高度足以让她站立，长度也足以让她完全躺下。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1054) > 0)
         {
            _loc1_ = ["你发现克拉拉盯着你看了一会儿，然后她的目光再次回到了远处的某个山顶。她还没有适应被净化的事实。","像往常一样，克拉拉坐在里面，茫然地盯着远方。她还没有适应被净化的事实。"];
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,8) > 0)
            {
               _loc1_.push("克拉拉渴望地盯着远方，无视了就在她面前试图引起她注意的孩子们。");
            }
            _loc2_ = _loc1_;
            outputText(_loc2_[Utils.rand(int(_loc2_.length))]);
         }
         else if(get_game().time.hours <= 7 || get_game().time.hours >= 20)
         {
            outputText("克拉拉四仰八叉地躺在笼子的地上，大声打着呼噜。");
         }
         else
         {
            _loc3_ = Utils.rand(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,8) > 0 ? 5 : 4);
            switch(_loc3_)
            {
               case 0:
                  outputText("克拉拉目前正在摆弄她的衣服，看起来像是在做一些修补或刺绣。这是你从她那里得到的为数不多的安静时刻之一。");
                  break;
               case 1:
                  outputText("克拉拉现在正在对你的追随者进行质问和侮辱。这非常烦人，但每个人都无视了她。");
                  break;
               case 2:
                  outputText("克拉拉目前正试图诱惑你把她从笼子里放出来，并让你对她上瘾。这和她之前所有的尝试都差不多……");
                  break;
               case 3:
                  outputText("克拉拉目前正在向任何愿意倾听的人大声抱怨她被监禁的条件，但根本没有人理她。");
                  break;
               case 4:
                  outputText("克拉拉正忙着咒骂你的孩子们。然而，她的言论并没有伤害到他们。事实上，看到他们的[say: 阿姨]愤怒地尖叫，他们看起来很开心。");
            }
         }
         outputText("");
      }
      
      public function calmMurblesFatAssDown() : void
      {
         clearOutput();
         get_marbleScene().marbleSprite();
         outputText("够了。你把手放在玛布尔的肩膀上，她惊讶地转向你。她的身体仍然因为勉强控制的愤怒而颤抖，眼中交织着痛苦和愤怒，泪水几乎要夺眶而出。你紧紧地抱住她的身体，告诉她冷静下来，深呼吸。她的身体瞬间僵住了几秒钟，然后她突然大哭起来，并");
         if(get_player().get_tallness() >= 80 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,465) < 2 || get_player().get_tallness() >= 86 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,465) >= 2)
         {
            outputText("紧紧地抱住你。你温柔地抚摸着她的头发，很高兴能成为她哭泣时可以依靠的肩膀，这既是因为你对这个温柔女孩的喜爱，也是因为你知道自己能让她感觉好点。");
         }
         else if(get_player().get_tallness() >= 60)
         {
            outputText("回抱了你。你们紧紧相拥，互相依偎。你很高兴能陪在她身边，这既是因为你对这位可爱女士的喜爱，也是因为与如此在乎的人亲密接触带来的温暖感觉。");
         }
         else
         {
            outputText("一把将你抱起，紧紧搂在胸前。被夹在她巨大的双峰之间，你很乐意充当她临时的安抚娃娃，这既是因为你对这头大母牛的喜爱，也是因为她那丰满的乳房实在令人舒适。");
         }
         outputText("[pg]最终你们分开了，你又有机会看到玛布尔的脸。虽然她的眼睛又红又肿，还挂着泪痕，但眼中闪烁着喜悦的光芒，与她唇边灿烂的笑容相得益彰。[say: 谢谢你，亲爱的。如果没有你，我可能会变得更像……她，]她指了指她的妹妹，眉头再次微微皱起。");
         outputText("[pg]你建议现在最好去看看拉萨祖尔的情况，然后再决定怎么处置克拉拉。[say: 好主意，这能给我点时间理清思绪。]你们把被绑起来的母牛留在原地，朝营地里那位老炼金术士的方向走去。");
         menu();
         addButton(0,"继续",rathazulFinishingMarblesPotion);
      }
      
      public function cageDatCowCunt() : void
      {
         clearOutput();
         outputText("你说你要把克拉拉当囚犯关在营地里。她应该被监禁，这样她就不再对任何人构成威胁了。玛布尔不确定地看着你，问你是否确定她现在已经被净化了还需要被关起来。你说你很确定，你的伴侣向你点点头，说她在这个问题上相信你的判断。");
         outputText("[pg]多亏了玛布尔出色的木工技能，你和她花了大约一个小时用森林里的原木做了一个笼子。然后你给克拉拉松绑，把她放进她的新家。她会在那里待上一段时间，但至少你知道她那样就不会伤害任何人了。被净化的牛娘在这段时间里没有进行任何抵抗，一旦进了牢房就出奇地安静。你偶尔会看到她愤怒地盯着你。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1053,1);
         menu();
         addButton(0,"继续",purificationQuestFinal);
      }
      
      public function badEndDickThatFitsClara() : void
      {
         clearOutput();
         var _loc1_:int = get_player().cockThatFits(20);
         if(_loc1_ < 0)
         {
            _loc1_ = get_player().smallestCockIndex();
         }
         if(get_player().hasCock() && get_player().smallestCockArea() <= 40 && get_player().biggestTitSize() <= 25 && !get_player().isTaur() && !get_player().hasTailInsteadOfLegs() && !get_player().isGoo() && !get_player().isDrider())
         {
            outputText("几秒钟内，她就帮你脱下了你醒来时穿着的紧身衣。");
         }
         outputText("你因为吸吮克拉拉的乳汁而产生的兴奋感依然让你保持着勃起。年轻的牛娘跨坐在你的小腿上，用手指轻轻弹了一下你的" + get_player().cockDescript(_loc1_) + "，继续对你灿烂地笑着。[say:我之前真的很担心你的阴茎会大到我根本吃不下。谢天谢地，情况并非如此，这根漂亮的肉棒正好适合我的尺寸！]她拨开自己女性私处的阴唇，继续说道：[say:这可是我第一次把东西放进这里，好好记着你对我来说是个多么特别的奴隶吧！]");
         outputText("[pg]好吧，她显然没有浪费任何时间，因为下一秒她就把张开的阴唇压在了你" + get_player().cockDescript(_loc1_) + "的龟头上。多亏了她之前的高潮，通道里已经湿润光滑了。立刻，这位牛娘的脸上闪过一丝痛苦与快乐交织的表情，她开始喘息。你举起双手，但克拉拉严厉地命令你，在她享受她想要的性爱时，你什么都不许做。你除了躺下承受之外，别无他法。");
         outputText("[pg]这个把你当成性玩具的女人动作慢得几乎让人痛苦。有那么一段时间，她只把龟头放进去，用手指在入口处搅动，同时在陌生的快感中喘息。毫无疑问，她确实是个处女；她显然不知道自己在做什么。当然，任何试图帮助她的举动只会换来她冰冷的瞪视，你只好继续等待她接下来的动作。");
         outputText("[pg]最后，克拉拉停止了对你的挑逗，俯下身来。她发出几声可爱的喘息和长长的呻吟，直到你的整根肉棒都进入了她的体内，这时她立刻高潮了，大叫道：[say:哞！]她的高潮非常湿润，把你的腰部和胯部都弄得湿淋淋的。");
         outputText("[pg]你原本还担心自己会欲求不满，但这种顾虑很快就烟消云散了。当这位曾经的处女完成她的第二次高潮时，她开始猛烈地起伏身体。这种突如其来的做爱方式的改变让你猝不及防，几乎瞬间就让你爽上了天。克拉拉的情况也好不到哪里去，此时她嘴里发出的全都是充满快感的无意识呢喃。");
         outputText("[pg]这场性爱几乎变成了一团模糊的快感、充满情欲的胡言乱语、两具肉体碰撞发出的湿润啪嗒声，以及两团巨大乳房的晃动。值得注意的是，克拉拉在这期间的性技巧确实有了相当大的提升。当你们这场疯狂的交欢接近尾声时，她在拼命起伏的同时，还加上了臀部的旋转、骨盆的挺动以及摩擦。");
         outputText("[pg]到那时，你们俩都已经精疲力尽，克拉拉瘫倒在你身上。她紧紧抓住你的手臂，然后把你紧紧抱在她的胸前。[say:我永远不会让你离开我，你永远永远都是我的……]她在你耳边低语，然后沉沉睡去。你不确定面对这样的未来，自己到底是该高兴还是该发愁。");
         menu();
         addButton(0,"继续",finalBadEndWithCowCunt);
      }
      
      public function actuallyGrowPureMarblesTittiesForFunzies() : void
      {
         var _loc1_:* = null as IMap;
         clearOutput();
         outputText("你递给玛布尔一瓶纯净魅魔奶，并告诉她你希望她的胸部能变得更大些。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1056) < 3)
         {
            outputText("[pg][say: 好吧，既然你这么说。] 玛布尔将瓶子举到嘴边，把里面的液体一饮而尽。她发出一声轻柔的叹息，开始揉捏起自己那对随着膨胀而变得富有弹性的乳房。透过她的衬衫，你可以看到她那 " + get_game().marbleScene.marbleBreastSize() + " 的乳房像气球一样膨胀成了");
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,1056,FlagDict_Impl_.arrayReadInt(_loc1_,1056) + 1);
            outputText(get_game().marbleScene.marbleBreastSize() + " 般大小的肉球！");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1056) == 1)
            {
               outputText("[pg]你的伴侣打量着她现在变得更大的胸部，并感受了一下。[say: 嗯，虽然不太习惯，但总比我以前那对小东西好多了。谢谢你，亲爱的！]");
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1056) == 2)
            {
               outputText("[pg]你的伴侣晃了晃她的胸部，然后开心地笑了。[say: 太谢谢你了，亲爱的！现在感觉好多了，平衡感很好，重量也不错，想想我能用这对宝贝对你做些什么吧。]");
            }
            else
            {
               outputText("[pg]你的伴侣试探性地抓住了她那巨大的乳房。[say: 哇，亲爱的，这会不会有点太大了？我想我不会再让它们变大了。] 她稍微伸展了一下肩膀。[say: 哎哟，希望我肩膀的酸痛不会持续太久……]");
            }
            get_player().consumeItem(get_consumables().P_S_MLK);
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteFloat(_loc1_,3,FlagDict_Impl_.arrayReadFloat(_loc1_,3) + 5);
            if(FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,3) > 100)
            {
               FlagDict_Impl_.arrayWriteFloat(KFLAGS.flags,3,100);
            }
         }
         else
         {
            outputText("[pg][say: 抱歉，亲爱的，] 她说着把瓶子递还给你，[say: 我觉得我的胸部已经够大了。]");
         }
         doNext(get_marbleScene().giveItem);
      }
      
      public function NTRIsClearlyTheWorstFetishWhyWouldYouWriteThisOMG() : void
      {
         clearOutput();
         get_marbleScene().marbleSprite(true);
         outputText("你");
         outputText("走上前去，告诉玛布尔，既然克拉拉认为你们对彼此的爱不是真的，那不如你们俩向她展示一下这到底有多真？[say: 好主意，[name]，] 你的爱人透过她那依然愤怒的脸庞简短地回答，并走上前去。瞬间，你被强行拉入一个热烈而充满激情的吻中，人类般的嘴唇紧紧贴在一起，而一条明显长得不像人类的舌头侵入了你的嘴里。[say: 等等，你们俩难道要在我的面前做爱吗？] 一个难以置信的声音从你正在亲吻的女人的身后传来。你们俩都没有理会，继续品尝、吞噬并向对方的嘴倾注爱意。你正在向其展示什么是爱的女人再次发出一声愤怒的咕哝，伴随着挣扎的声音。");
         outputText("[pg]真正的做爱不会止步于亲吻。你必须确保向一个潜在的小偷展示整个过程。你的伴侣已经在努力解决这个问题了，她正试图把你的身体从束缚它的[armor]中解放出来。你不甘示弱，开始脱下那件经常束缚着牛娘乳房的熟悉上衣。玛布尔的乳房一获得自由，她立刻把你的头按进她双乳形成的巨大肉谷中。");
         outputText("[pg]从那里开始，你决定让你的伴侣主导一会儿。她很乐意把她那巨大的乳房在你的脸上滚来滚去，而你则依偎在那奇妙光滑的皮肤上。突然，你感觉到那个将你困在乳房里的女人转过身来。[say: 这他妈的是什么，姐姐？] 那个声音现在气得直吐唾沫。你能听到它就在你身后，显然有人想确保观众能清楚地看到你们的性爱表演。");
         outputText("[pg]在又进行了一会儿乳交之后，玛布尔决定是时候进入正题了。她一反常态地粗暴地把你按成坐姿，并撕下了你剩下的衣服。你甚至还没来得及脱下她的裙子，");
         var _loc1_:int = get_player().cockThatFits(get_marbleScene().marbleCuntCapacity());
         if(get_player().hasCock() && _loc1_ >= 0)
         {
            outputText("她就一屁股坐到了你的" + get_player().cockDescript(_loc1_) + "上。由于你的牛娘伴侣没有穿任何形式内衣的习惯，她的裙子并没有对插入造成什么阻碍。伴随着这个动作的是一声惊恐的尖叫。");
            outputText("[pg]在你被骑上之后，没有任何犹豫。瞬间，你被玛布尔体内觉醒的野兽粗暴地骑乘着，没有任何东西能阻止它。随着她臀部的每一次落下，空气中都回荡着响亮的啪啪声，然后它们再次抬起，再次落下。现在在你的腿上运行的基本上是一个空心的手提钻，而操作员的手紧紧地抓住你的肩膀，以确保你待在原地。");
         }
         else if(get_player().hasVagina() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,4) > 0)
         {
            outputText("她一屁股坐在你旁边的地上。突然，她把你举起来，把你的私处落到你给她的肉棒上。由于你的牛娘伴侣没有穿任何形式内衣的习惯，她的裙子并没有对插入造成什么阻碍。伴随着这个动作的是一声惊恐的尖叫。");
            outputText("[pg]被侵犯后，你没有丝毫犹豫，瞬间就被玛布尔体内觉醒的野兽粗暴地举起又放下，没有什么能阻止她。随着你臀部的每一次落下，空气中都会响起响亮的拍打声，然后又被举起并再次落下。你的[hips]现在基本上变成了一个手提钻，而操作它的人丝毫没有让你离开她大腿的迹象。");
         }
         else if(get_player().hasVagina())
         {
            outputText("她把自己摔在你的腿上，并抓住其中一条。瞬间，你们两人的阴部被以极大的力量和紧迫感相互摩擦。由于你的牛娘伴侣没有穿任何形式内衣的习惯，她的裙子并没有对磨豆腐造成什么阻碍。伴随着这一动作的是一声惊恐的尖叫。");
            outputText("[pg]玛布尔体内觉醒了一只野兽，没有什么能阻止它。当她粗暴地与你磨豆腐时，可以听到你们结合的阴部发出响亮的吧唧声。现在你的[legs]上似乎运行着一个高速振动棒，而操作它的手紧紧地抓住你的腿，以确保你留在原地。");
         }
         outputText("[pg]粗暴的性爱往往短暂而充满变数。在这方面，这次特别的艳遇也不例外。与众不同的是，一位极其嫉妒的牛娘不断发出愤怒的叫喊和侮辱。不到一分钟，一阵强烈的性高潮就穿过了你们的身体，几乎在瞬间，一切就结束了。你们汗流浃背的身体分开了，你又有机会看到玛布尔的脸了。她在哭。");
         outputText("[pg]这种悲伤的原因很可能是由于一个气得满脸通红的女人对她进行了极端的言语虐待。[say:你他妈的怎么回事！？当着我的面，趁我被绑着的时候，和我的伴侣那样做爱！你活该被关起来，</i>姐姐<i>。]最后一个词基本上是吐出来的。显然，克拉拉不喜欢这种展示，玛布尔也不太在乎她的反应。姐姐站起身来，走向她的妹妹，愤怒地握紧了拳头。");
         get_player().orgasm("Generic");
         menu();
         addButton(0,"继续",calmMurblesFatAssDown);
      }
      
      public function BLUHBLUH() : void
      {
         clearOutput();
         get_marbleScene().marbleSprite();
         outputText("当你回到营地时，你发现玛布尔坐在营火旁，忧郁地盯着灰烬。出于好奇，你走近你的牛情人，问她怎么了。她抬起头看着你，她的");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,465) <= 1)
         {
            outputText("人类");
         }
         else
         {
            outputText("牛娘");
         }
         outputText("双手依然捂着脸，大声叹了口气。[say: 对不起，亲爱的，我只是……我试着去忽略它，但我在这里就是觉得不舒服。]");
         outputText("[pg]你问她怎么了；难道她不喜欢和你在一起吗？");
         if(get_amilyScene().amilyFollowerPure() || followerKiha() || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,238) == 1)
         {
            outputText("……她是不是和");
            if(get_amilyScene().amilyFollowerPure())
            {
               outputText("艾米莉");
            }
            else if(followerKiha())
            {
               outputText("奇哈");
            }
            else
            {
               outputText("伊兹玛");
            }
            outputText("?");
         }
         outputText("[pg][say: 不，不，不是那样的。我确实喜欢和你在一起……而问题就在这里，] 闷闷不乐的牛娘回答道。看到你明显的困惑，她开始解释。[say: 你还记得那次关于我的奶水和它那令人上瘾的副作用的事吗？] 她问道。看到你点头，她继续说道，[say: 嗯，从那以后我一直试着为了你坚强起来——我爱你是因为你就是你，我不想让你对我上瘾；不想让你为了每天的生存而依赖我……那不是爱——但这太难了。亲爱的，我从来没有像你喝我的奶时感觉那么好过；我<b>需要</b>给出我的奶水，而让一个活生生的人喝下去，比挤奶器要……嗯，满足得多。] 她转头看向地面，显然是太羞愧了，不敢看你。[say: 当我们做爱时，我很难忍住不把我的乳房拿出来，强行把乳头塞进你嘴里，让你喝我产的奶，真正感觉到你爱我……]");
         outputText("[pg]你告诉她，你很欣赏她的坚强，并问是否有任何方法可以帮助她克服这个问题。");
         outputText("[pg]玛布尔犹豫地抬头看着你，眉头紧锁，陷入沉思。[say: 嗯，首先是腐化让我的奶水令人上瘾，所以我们需要找到一种方法来净化我。我身上最腐化的部分是我的奶水，所以我们应该从那里开始，] 她建议道，一边思考一边揉着下巴。");
         outputText("[pg]你思考着各种可能性，并提出了一些可以减少她腐化的建议。");
         if(get_player().hasItem(get_consumables().PURHONY))
         {
            outputText("然后你回想起蜂女给你的那瓶蜂蜜，问也许它会起作用？");
         }
         if(jojoFollower())
         {
            outputText("你记得乔乔是如何帮助你变得纯洁的，并建议也许他的冥想可以帮助玛布尔？");
         }
         outputText("[pg]玛布尔摇了摇头，然后继续说道，[say: 不，我认为我们应该专注于与我的种族有关的东西。也许我们可以用我母亲教我的拉波娃，如果我变成了别的东西，就喝它。它在原始形态下可能是腐化的，但也许有某种方法可以净化它以对抗腐化效果？不过，我想你需要一个炼金术士来净化它……] 她的声音渐渐变小，思考着这种可能性。");
         outputText("[pg]你指出拉波娃非常罕见，并问你该如何获得足够的拉波娃来帮助玛布尔。");
         outputText("[pg][say: 亲爱的，你不用担心那个。] 她坚定地回答。[say: 拉波娃是由经过化学处理的牛娘奶制成的，] 她抖动着丰满的胸部以示强调，[say: 我认识一个人，如果我给他们奶水和补给，他们就能给我制作我需要的东西……等等，你是说你想帮我吗？] 她怯生生地问你。");
         outputText("[pg]你宣称你就是这个意思；毕竟，伴侣是用来做什么的？对于这样一个笨重的女孩来说，玛布尔以惊人的速度从座位上弹起，将你扫入怀中，热情地将你闷在她巨大的乳房里。她充满激情地挤压着你，喜悦的泪水从她的眼睛里流下来，然后放开你，给了你一个快速的吻，然后走开了，在和你谈话后，她明显开心多了。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1059,1);
         doNext(get_camp().returnToCampUseOneHour);
      }
   }
}

