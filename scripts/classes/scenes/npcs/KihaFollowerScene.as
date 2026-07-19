package classes.scenes.npcs
{
   import classes.CoC;
   import classes.Cock;
   import classes.CockTypesEnum;
   import classes.DebugMenu;
   import classes.DynStat;
   import classes.DynStatOp;
   import classes.ImageManager;
   import classes.Monster;
   import classes.PerkLib;
   import classes.Player;
   import classes.PregnancyStore;
   import classes.SelfDebug;
   import classes.StatusEffects;
   import classes.TimeAwareInterface;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.display.SpriteDb;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.items.Armor;
   import classes.items.ArmorLib;
   import classes.items.ConsumableLib;
   import classes.items.UndergarmentLib;
   import classes.saves.SelfSaver;
   import classes.saves.SelfSaving;
   import classes.scenes.Camp;
   import classes.scenes.areas.swamp.SpiderMorphMob;
   import classes.scenes.combat.Combat;
   import classes.scenes.npcs._KihaFollowerScene.SaveContent;
   import coc.view.CoCButton;
   import flash.Boot;
   import haxe.IMap;
   
   public class KihaFollowerScene extends NPCAwareContent implements TimeAwareInterface, SelfDebug, SelfSaving
   {
      
      public var saveVersion:int;
      
      public var saveName:String;
      
      public var saveContent:SaveContent;
      
      public var pregnancy:PregnancyStore;
      
      public var globalSave:Boolean;
      
      public function KihaFollowerScene()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         globalSave = false;
         saveVersion = 1;
         saveName = "kiha";
         saveContent = new SaveContent(null,null,null,null);
         super();
         pregnancy = new PregnancyStore(2192,2193);
         pregnancy.addPregnancyEventSet(25,[384,336,288,240,192,144,96,48]);
         CoC.timeAwareClassAdd(this);
         SelfSaver.register(this);
         DebugMenu.register(this);
      }
      
      public function winSparWithKiha() : void
      {
         clearOutput();
         if(!followerKiha())
         {
            outputText("奇哈摇晃了一会儿，然后双手麻木地放下了斧头。她一放下，武器刀刃上炽热的光芒就褪成了银色，武器伴随着沉重的“砰”声落在了泥土里。龙女跪倒在地，向后瘫倒在一棵树上，当她试图站起来时，她的四肢无力地颤抖着。[say: 你……你……还没有……打败我，] 她嘟囔着，尽管很明显你已经赢了。");
            outputText("[pg]尽管这只是一场模拟战，但你可以清楚地看到龙女把这次失败当成了个人的挫折。她又瘫倒在地，无法再站起来，并咒骂着自己。[say: 如果……如果我连你都打不过，[name]，我到底该怎么打败莉希丝？]");
            outputText("[pg]虽然你无法回答她的问题，但你可以拉她一把。不过，就她的体型和身材而言，她出奇地轻——当你把她拉起来时，她向前跌进了你的怀里。");
            outputText("[pg][say: 你、你在干什么！？]她吓了一跳，把你推开。[say: 你——你这个笨蛋！]她的脸红得像她的鳞片一样，腾空而起，飞走了。");
            outputText("[pg]你叹了口气，回到了营地。");
            kihaAffection(20);
         }
         else
         {
            outputText("奇哈来回摇晃了一会儿，然后双手麻木地丢下了斧头。斧头一落地，那炽热的刀刃光芒就褪成了银色，伴随着沉闷的“咚”声砸在泥土里。龙女双膝跪地，瘫靠在一块岩石上，她试图站起来，四肢却无力地颤抖着。[say: 你……你……还没……打败我，]她嘟囔着，尽管很明显你已经赢了。");
            outputText("[pg]尽管这只是一场模拟战，但你可以清楚地看到龙女把这次失败当成了个人的挫折。她又瘫倒在地，无法再站起来，并咒骂着自己。[say: 如果……如果我连你都打不过，[name]，我到底该怎么打败莉希丝？]");
            outputText("[pg]虽然你无法回答她的问题，但你可以拉她一把。不过，就她的体型和身材而言，她出奇地轻——当你把她拉起来时，她向前跌进了你的怀里。");
            outputText("[pg][say: 你、你在干什么！？]她吓了一跳，把你推开。[say: 你——你这个笨蛋！]她的脸红得像她的鳞片一样，气冲冲地走到营地的另一边。");
            outputText("[pg]你叹了口气，走回放东西的地方。");
            kihaAffection(20);
         }
         get_combat().cleanupAfterCombat();
      }
      
      public function warnKihaOfHerImpendingDemise() : void
      {
         clearOutput();
         outputText("[say: 奇哈！在你身后！]你大喊着，拼命指着正在靠近她的怪物群。[pg]");
         outputText("她冷笑了一声。[say: 拜托，[name]。你以为我是什么，傻瓜吗？][pg]");
         outputText("此时，两个蛛化精灵中较大的那个已经直接来到了奇哈身后，居高临下地看着她，嘴唇上挂着邪恶的笑容。你试图结结巴巴地发出另一个警告，但太迟了！她抓住奇哈拿武器的手臂，把她从地上提了起来，并把一团湿漉漉的蛛网拍进了这个愤怒女人的嘴里，让龙女几乎毫无防备，也让你得以脱身。你摔倒在地上，但现在你曾经的刽子手马上就要被扔给聚集在树丛周围的蜘蛛人了，他们都在等待着对龙女下手的机会。[pg]");
         outputText("在蛛化精灵把奇哈扔进暴徒群之前，你跳了起来，用尽全身力气刺向那个苍白蜘蛛人的太阳穴。蛛化精灵被你的攻击打得踉跄了一下，把奇哈扔在你的脚边，向后退去。然而，暴徒群的其他成员继续围绕着他们被惊呆的首领前进。[pg]");
         outputText("[say: 你！]奇哈厉声说道，撕开蛛网，抓起她的斧头，[say: 你到底为什么要这么做？][pg]");
         outputText("[say: 以后再说！]你回答道。");
         outputText("[pg]你现在正在和蜘蛛群战斗！");
         var _loc1_:SpiderMorphMob = new SpiderMorphMob();
         _loc1_.missFirstRound = true;
         startCombat(_loc1_);
         get_player().HPChange(100,false);
         get_player().changeFatigue(-30);
         dynStats(DynStat.Lust(-40));
      }
      
      public function warmLoverKihaIntro(param1:Boolean = true) : void
      {
         var _g2:KihaFollowerScene;
         var _g1:KihaFollowerScene;
         var _g:Camp;
         var _loc2_:Function = null;
         var _loc3_:Function = get_camp().returnToCampUseOneHour;
         if(param1)
         {
            clearOutput();
            kihaSprite();
            if(followerKiha())
            {
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,429) == 1)
               {
                  kihaReactsToHorseDicking();
                  return;
               }
               if(int(get_game().time.days % 15) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2199) == 0)
               {
                  kihasFirstClutch();
                  return;
               }
               outputText("当你走近你的龙女爱人时，一个温暖的微笑在她深色的面容上绽放。她调皮地在你的肩膀上捶了一拳，笑道：[say: 嘿，笨蛋。你需要什么——也许是一点龙的关爱？]她眨了眨眼补充道。");
               if(canKihaGetPregnant())
               {
                  outputText("[pg]<b>奇哈的肚子明显肿胀隆起。她的子宫里有准备受精的卵子；如果你在做爱时不小心，你可能会让她受精并成为父亲。</b>");
               }
               if(pregnancy.get_isPregnant())
               {
                  outputText("[pg]");
                  if(pregnancy.get_incubation() > 288)
                  {
                     outputText("<b>她的肚子看起来有点肿胀。</b>");
                  }
                  else if(pregnancy.get_incubation() > 240 && pregnancy.get_incubation() <= 288)
                  {
                     outputText("<b>她的肚子相当于怀孕六个月的大小。</b>");
                  }
                  else if(pregnancy.get_incubation() > 192 && pregnancy.get_incubation() <= 240)
                  {
                     outputText("<b>她的肚子相当于怀孕八个月的大小。</b>");
                  }
                  else if(pregnancy.get_incubation() > 144 && pregnancy.get_incubation() <= 192)
                  {
                     outputText("<b>她的肚子相当于怀孕九个月的大小。用不了多久，她最终就会产下一窝蛋。</b>");
                  }
                  else if(pregnancy.get_incubation() > 72 && pregnancy.get_incubation() <= 144)
                  {
                     outputText("<b>她的肚子甚至比典型人类怀孕末期的平均肚子尺寸还要大。</b>");
                  }
                  else if(pregnancy.get_incubation() <= 72)
                  {
                     outputText("<b>不可能注意不到她怀孕了。她肚子的大小已经让她不堪重负。她很快就要产下一窝蛋了。</b>");
                  }
               }
               _g = get_camp();
               _loc3_ = function():void
               {
                  _g.campLoversMenu();
               };
               menu();
               addButton(0,"外貌",kihaCampAppearance).hint("检查奇哈的外貌。");
               addButton(1,"陪伴",hangOutWithKiha).hint("与奇哈共度一段美好时光。");
               _g1 = this;
               addButton(2,"做爱",function():void
               {
                  _g1.kihaSexMenu();
               }).hint("与奇哈开始性爱。");
               addButton(3,"切磋",sparWithKiha).hint("和奇哈进行一场快速的战斗！");
               if(get_camp().isGuard("Kiha"))
               {
                  addButton(4,"停止守卫",guardMyCampKiha).hint("要求她停止守卫。");
               }
               else
               {
                  addButton(4,"守卫营地",guardMyCampKiha).hint("要求她守卫你的营地。");
               }
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2191) == 0 && (get_player().hasItem(get_undergarments().SSPANTY) || get_player().hasItem(get_undergarments().SS_LOIN)))
               {
                  addButton(5,"赠送内衣",giveKihaUndergarmentsPrompt).hint("给奇哈一些衣物来遮挡她的下体？");
               }
               addRowButton(1,"拥抱",hugFriendWarmKiha).hint("给这只母龙一个拥抱。");
               addRowButton(1,"亲吻",kiss).hint("温柔地亲吻这只火辣的母龙。");
               addButton(9,"共眠",sleepWith).hint("邀请奇哈今晚和你同床共枕。").disableIf(!get_camp().isCanSleepTime(),"现在睡觉还太早了。");
               if(saveContent.badCookingTasted == 2)
               {
                  addButton(10,"烹饪",kihaCookingLesson);
               }
               if(!saveContent.flowerGifted && get_player().hasItem(get_consumables().DRAKHRT))
               {
                  addRowButton(2,"龙心花",kihaDrakeHeart).hint("送给这只龙一朵龙心花。");
               }
               if(get_player().get_armor().get_id() == get_armors().VINARMR.get_id() && (get_game().swamp.alrauneScene.saveContent.questAsked & get_game().swamp.alrauneScene.ASKEDKH) == 0)
               {
                  addRowButton(2,"藤蔓",get_game().swamp.alrauneScene.askKiha).hint("知道怎么解决这个问题吗？");
               }
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2078) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2078) < 100)
               {
                  if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2225) == 0)
                  {
                     addRowButton(2,"摧毁林地",kihaDestroyGladesToggle).hint("请求奇哈摧毁她能找到的任何腐化林地。");
                  }
                  else
                  {
                     addRowButton(2,"停止摧毁",kihaDestroyGladesToggle).hint("请求奇哈停止摧毁腐化林地。");
                  }
               }
               addButton(14,"离开",_loc3_);
               return;
            }
            outputText("在探索沼泽时，你发现自己进入了你那龙女爱人熟悉的领地。你迈着轻快的步伐，穿过茂密的树叶，来到奇哈称之为家的那片树林。还没等你喊出她的名字，你就听到头顶高处传来一阵风声，片刻之后，奇哈本人轻盈地降落在你面前，她深色的面容上带着一抹淡淡的微笑。");
            outputText("[say: 嘿，笨蛋，]她咧嘴笑道。[say: 就是忍不住想多看我一分钟，对吧？好吧，我也不能怪你……]");
         }
         if(!followerKiha() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,427) == 1)
         {
            _loc2_ = inviteKihaForDickings;
         }
         menu();
         addButton(0,"外貌",kihaCampAppearance).hint("检查奇哈的外貌。");
         addButton(1,"陪伴",hangOutWithKiha).hint("与奇哈共度一段美好时光。");
         addButton(2,"拥抱",hugFriendWarmKiha).hint("给这只母龙一个拥抱。");
         _g2 = this;
         addButton(3,"做爱",function():void
         {
            _g2.kihaSexMenu();
         }).hint("与奇哈开始性爱。");
         addButton(4,"切磋",sparWithKiha).hint("和奇哈进行一场快速的战斗！");
         addButton(5,"邀请回营",_loc2_).hint("邀请奇哈回你的营地。");
         addButton(14,"离开",_loc3_);
      }
      
      public function totalKihaChildren() : int
      {
         return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2195) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2196) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2197);
      }
      
      public function timeChangeLarge() : Boolean
      {
         return false;
      }
      
      public function timeChange() : Boolean
      {
         var _loc2_:int = 0;
         var _loc1_:Boolean = false;
         pregnancy.pregnancyAdvance();
         if(pregnancy.get_isPregnant())
         {
            if(kihaPregUpdate())
            {
               _loc1_ = true;
            }
            if(pregnancy.get_incubation() == 0)
            {
               kihaGivesBirth();
               pregnancy.knockUpForce();
               _loc1_ = true;
            }
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2198) > 1)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2198) != 144)
            {
               _loc2_ = 2198;
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,_loc2_,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,_loc2_) - 1);
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2198) == 240)
            {
               kihaBreastfeedingTime();
               _loc1_ = true;
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2198) == 72)
            {
               kihaTrainsHerKids();
               _loc1_ = true;
            }
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2198) == 1)
         {
            kihaChildGraduationTime();
            _loc1_ = true;
         }
         return _loc1_;
      }
      
      public function talkToFriendlyKiha() : void
      {
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,344) <= 3)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,344,3);
            outputText("你问龙女是否介意聊几分钟。");
            outputText("[pg]奇哈轻蔑地交叉双臂。[say: 哦，你还是只会说！光说不练有什么用，该死！你试过和恶魔讲道理吗？那只会给他们更多时间想办法搞死你。]你叹了口气，请她就当是迁就你一下。她翻了个白眼，但没有拒绝你。至少这是个开始。");
            outputText("[pg]你靠在龙女旁边，问了她一些关于她自己的事。真的只是一些无辜的问题——她在哪里出生，关于她的父母，任何她能告诉你的事。龙女哼了一声，呼出一小团烟雾。[say: 真是个白痴。我告诉过你我不记得了，好吗？只是在恶魔带走我之前……有一些画面。]");
            outputText("[pg]你问她关于那些零碎的记忆，但她一挥手臂打断了你，她的爪子从你脸旁飞过，你都能感觉到空气的流动。[say: 闭嘴，该死！我不想谈这个！]你耸耸肩，问她想谈什么。她冷笑了一声。[say: 好吧，既然你这么想聊天，那我们就来谈谈你吧！]");
            outputText("[pg]等等，你不是已经做过这个了吗？但是，你决定迁就一下龙女，开始告诉她一些关于你长大的村庄、为了成为勇者而接受的训练，以及你最终来到玛瑞斯大陆的经历。龙女静静地听着，一动不动，只是在你说话时盯着你。当你讲完，把故事的结尾落在第一次遇见她时，奇哈只是微微点了点头。");
            outputText("[pg]你试探着问她有没有什么想说的，但她对这个想法嗤之以鼻。[say: 你以为我们是一样的，对吧？我们都过得那么艰难？好吧，你错了！就因为你帮过我一次，并不意味着我们就是好朋友，更不意味着我们是一样的。所以……所以滚开，好吗！？]她尖叫着，然后腾空而起飞走了。");
            outputText("[pg]妈的，奇哈。");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,344) == 4)
         {
            outputText("你再次试图和奇哈说话，但她抢在你前面开口了：[say: 我听够你喋喋不休地谈论你自己了，]她厉声说道，怒视着你。[say: 我现在想谈谈我，而你要闭嘴听着。明白了吗？]");
            outputText("[pg]你强忍住笑意，表示同意。她出人意料地赞许地点了点头，开始说道：[say: 我生来就是个蜥蜴人，注定要成为一名战士——一名伟大的战士。我本该在无数场战斗中厮杀，成千上万地斩杀我部落的敌人……而且我永远不会被击败。]");
            outputText("[pg]你表达了你的理解，尽管龙女飞快地瞥了你一眼，阻止了你说话。[say: 当恶魔来临时，我本该奋起反抗。我们所有人都会。但不知怎么的……不知怎么的，他们赢了。我们一定是个傻瓜。如果我们训练得更刻苦，战斗得更出色……我可能……可能还记得我是谁……]");
            outputText("[pg]她的声音渐渐弱了下去。你正要说话，但她突然向空中喷出一大团锥形火焰，火柱照亮了黑暗的沼泽。");
            outputText("[pg][say: 但看看他们把我变成了什么，]她咧嘴笑着说。[say: 恶魔想要完美的战士——下一代恶魔士兵。好吧，他们第一步做对了，]她说着，威胁地露出獠牙和利爪。[say: 既然我自由了，我只需要找到莉希丝那个婊子，把爪子塞进她的屁股里……为了我的人民。]");
            outputText("[pg]没等你回应她的宣言，龙女向你点了点头，跃入空中，消失在茂密的树叶中。");
            outputText("[pg]也许……只是也许……这是个进步？");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,344) == 5)
         {
            outputText("你再次让龙女坐下，并温柔地试图从她那里哄出更多的话。毕竟，她肯定还有更多的话要说。然而，你还没说完你的请求，龙女就咆哮着喷出一小团火焰，刚好停在你的鼻子前。");
            outputText("[pg][say: 该死，[name]！]她嘶嘶地说，挥手驱散烟雾。[say: 我他妈的说够了！你到底为什么要一直这样，嗯？说啊说啊说！你总是来这里，谈论你那宝贵的道德，表现得好像你真的在乎我一样。好吧，他妈的停下来！]");
            outputText("[pg]她朝你挥舞着长满利爪的手，逼得你连连后退，否则你的脸就没了。[say: 你一直说你是个高高在上的勇者，要阻止恶魔！那他妈的证据呢，嗯？你只会说！我们到底为什么不出去战斗！？我们应该踢开莉希丝的大门，而不是在这里磨磨蹭蹭地谈论我们他妈的感受或者其他什么狗屁！拜托，如果你真的那么强，能把我打倒在地，你和我一起应该能对这个婊子做点什么！对吧？]");
            outputText("[pg]你对龙女突然的爆发感到完全不知所措。以前，她似乎更关心保护自己——实际上是躲藏——而不是战斗。是什么导致了这种变化？");
            outputText("[pg]她像野兽一样咆哮着。[say: 哦，我他妈的就知道！我说，“嘿，我们去对付恶魔吧”，而你只想他妈的分析我的感受。你当然想！不管怎样，你有什么用？一个只会坐着聊天的勇者有什么用，嗯？这怎么能搞死莉希丝，推翻恶魔？嗯？]");
            outputText("[pg]你试图安抚她，告诉她你只是还没准备好打败恶魔女王。她疯狂地大笑，笑得太厉害，以至于嘴里喷出了一点炽热的火焰。[say: 哦，当然没有！你不会准备好的——你屁股还没坐够，是吧！好吧，既然你他妈的这么渴望，那我就告诉你一点我的感受！我受够了等待！那些恶魔毁了我的生活，我他妈的受够了等待。我要复仇，而且我现在他妈的就要！]");
            outputText("[pg]没等你回答龙女，她就从地上腾空而起，紧紧握着斧头，从树顶上飞驰而过。");
            outputText("[pg]你希望她不要给自己惹麻烦，但你现在真的无能为力……");
         }
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,344,FlagDict_Impl_.arrayReadInt(_loc1_,344) + 1);
         dynStats(DynStat.Cor(-1));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function sparWithKiha() : void
      {
         clearOutput();
         outputText("你问奇哈是否愿意和你进行一场模拟战。她对这个建议挑了挑眉，但很快就把巨斧扛在肩上，对你得意地笑了。[say: 你确定吗？我可不会手下留情——而且我绝不会被打败！]");
         outputText("[pg]你回以她得意的笑容，准备好你的[weaponName]。");
         startCombat(new Kiha());
         get_monster().createStatusEffect(StatusEffects.Spar,0,0,0,0);
      }
      
      public function sparWithFriendlyKihaLose() : void
      {
         clearOutput();
         if(!followerKiha())
         {
            outputText("你受不了了！你跌跌撞撞地想远离龙女，但只走了几英尺就摔倒了，一屁股坐在地上。你头晕目眩，只能坐在那里，看着奇哈漫不经心地走过来，把斧柄压在你的喉咙上。");
            outputText("[pg][say: 砰。你死了！]她大笑着，在你的下巴上轻轻敲了一下，然后把斧头甩回肩上。[say: 拜托，[name]！]她嘲笑道，[say: 如果你连我都打不过，你到底觉得你要怎么打败恶魔女王，嗯？]");
            outputText("[pg]她的话比你预想的还要伤人，你保持沉默。过了一会儿，奇哈哼了一声，把头转过去。[say: 听着。如果你真的想变强，我想我们可以……继续这样做。我可不是为了你才这么做的！]她补充道，双臂交叉。[say: 你是个很好的活靶子。仅此而已。]");
            outputText("[pg]哦，奇哈。");
            outputText("[pg]你拍了拍身上的灰尘，在龙女注视的目光下回到了营地。你需要花点时间恢复一下。");
         }
         else
         {
            outputText("你受不了了！你跌跌撞撞地想远离龙女，但只走了几英尺就摔倒了，一屁股坐在地上。你头晕目眩，只能坐在那里，看着奇哈漫不经心地走过来，把斧柄压在你的喉咙上。");
            outputText("[pg][say: 砰。你死了！]她大笑着，在你的下巴上轻轻敲了一下，然后把斧头甩回肩上。[say: 拜托，[name]！]她嘲笑道，[say: 如果你连我都打不过，你到底觉得你要怎么打败恶魔女王，嗯？]");
            outputText("[pg]她的话比你预想的还要伤人，你保持沉默。过了一会儿，奇哈哼了一声，把头转过去。[say: 听着。如果你真的想变强，就继续努力吧。你就是这样赢得我的心的，不是吗？]她补充道，双臂交叉，脸红了。[say: 来、来吧，我们去给你疗伤。]");
            outputText("[pg]哦，奇哈。");
            outputText("[pg]你拍了拍身上的灰尘，在龙女注视的目光下回到了营地中心。");
         }
         kihaAffection(10);
         get_combat().cleanupAfterCombat();
      }
      
      public function sleepWith() : void
      {
         var _g:Camp;
         clearOutput();
         outputText("你问奇哈今晚是否愿意和你同床共枕。");
         outputText("[pg]龙女急切地告诉你：[say: 当然！我的意思是……！如-如果你太害怕一个人睡或什么的，我不介意和你一起睡。]她移开视线，嘴角泛起一丝微笑。牵着女孩的手，你把她带到你的[cabin]，并为她打开[if (builtcabin) {door|flap}]。她急切地走进去，在你的床上舒服地躺下。奇哈盯着你，她的尾巴不耐烦地拍打着[if (builtcabin) {floor|ground}]。[say: 我们到底要不要一起睡？]");
         outputText("[pg]你点头回应，[if (!isnaked) {脱下衣服，}]躺在[bed]上，挨着她。你用一只手臂搂住奇哈，把她拉近你。她的身体僵硬了，眼睛迅速从你身上移开。你用力把女孩转过来，让她可爱的头靠在你的[chest]上。你温柔地开始用手抚摸她火红的头发，并解释说你很感激她能陪你过夜。");
         outputText("[pg]奇哈咕哝着：[say: 真的吗？我……好吧……晚安！]她用力闭上眼睛，幸福地依偎在你身边。你确信她还醒着，在你闭上眼睛自己入睡之前，你诚实地表达了你对她的感情。");
         FlagDict_Impl_.arrayWriteString(KFLAGS.flags,701,"Kiha");
         saveContent.wakeUp = true;
         _g = get_camp();
         doNext(function():void
         {
            _g.doSleep();
         });
      }
      
      public function savinTheAnalForKiha() : void
      {
         clearOutput();
         get_images().showImage("kiha-follower-sex-buttfuck");
         var _loc1_:int = get_player().cockThatFits(94);
         if(_loc1_ < 0)
         {
            _loc1_ = 0;
         }
         outputText("你对龙女微微一笑，绕过她半张开的翅膀，抓住她那又大又软的屁股。奇哈倒吸了一口凉气，转过头来怒视着你，不过你躲在她巨大的翅膀后面，轻轻捏了捏她的屁股。[say: 你、你觉得你在后面干什么，笨蛋？]你调皮地拍了她一下，转过身来，把你的[chest]贴在");
         if(get_player().get_tallness() >= 60)
         {
            outputText("她的肩膀上");
         }
         else
         {
            outputText("她的后腰上");
         }
         outputText("双手抓住她那丰满柔软的臀瓣。奇哈在你的掌控中装模作样地咆哮和扭动，但并没有反抗你的挑逗，最后甚至甩动尾巴来摩擦你的大腿和你自己的[butt]。");
         outputText("[pg][say: 呃！]龙女喘息着，她感觉到你那正在变硬的" + get_player().cockDescript(_loc1_) + "压在她的屁股上，几乎要挣脱[armorName]的束缚。[say: 噢，那么多东西你偏偏迷上这个！]她呻吟着，但令你高兴的是，奇哈在你的掌控中扭动着臀部，用她柔软的屁股摩擦着你的肉棒。你用力地打了一下她的屁股，看着奇哈深吸了一口气，夹紧了她的臀部，你忍不住笑了起来——就在这时，你释放了那头野兽，你的" + get_player().cockDescript(_loc1_) + "垂在了她的臀沟之间。");
         outputText("[pg][say: 噢，我懂了，]奇哈嘲讽道，突然向后推，直到你的肉棒被夹在你的");
         if(get_player().cocks[_loc1_].cockLength < 12)
         {
            outputText("肚子");
         }
         else
         {
            outputText("胸部");
         }
         outputText("和她的屁股之间。[saystart]你想玩点屁股游戏，是吧？你这个");
         if(get_player().get_tallness() >= 60)
         {
            outputText("大");
         }
         else
         {
            outputText("小");
         }
         outputText("变态。[sayend]尽管她嘴上不饶人，但她还是继续在你身上摩擦，现在她上下抬起屁股，顺着你肉棒的长度滑动");
         if(get_player().cocks[_loc1_].cockLength < 3)
         {
            outputText("；你把她的屁股瓣掰开，刚好够把你的肉棒滑进去，让奇哈给你来个热狗式");
         }
         outputText("。你的臀部和她的同步移动，你们俩在旁观者看来一定像是一对在跳某种变态舞蹈的情侣，互相摩擦、挑逗、摸索，直到你们俩都满脸通红，奇哈的大腿被她的淫液弄得湿滑");
         if(get_player().hasVagina())
         {
            outputText("，就像你的一样");
         }
         outputText("。");
         outputText("[pg]突然，奇哈把她的臀部向后推——你踉跄着摔倒了，你的背撞到了附近的一棵");
         if(!followerKiha())
         {
            outputText("树");
         }
         else
         {
            outputText("石头");
         }
         outputText("上。还没等你恢复过来，奇哈就跨坐在你身上，脸上带着野蛮的笑容。[say: 对于一个所谓的勇者来说，你完全是个变态……在经历了这一切之后，我打赌你想把那个插进去，]她低头看了看你僵硬的" + get_player().cockDescript(_loc1_) + "，已经流出了先兆液，[say: 插进我的屁股里，不是吗？毕竟，你对它那么着迷……]");
         outputText("[pg]你急切地点点头，你的脑海被她柔软的屁股和你的肉棒滑入她紧致、火热的通道的想法所吸引。奇哈发出了一声<i>啧</i>的声音，[say: 真是个肮脏的头脑，想着这么肮脏的地方，]你呻吟着，因为她已经摆好了姿势，可以轻松地滑下你的肉棒，站起来并后退了一步。[say: 哦，别担心，我会给你你想要的……但不是现在！]");
         outputText("[pg]奇哈吐了一口唾沫，她的唾液带着温暖、湿润的啪嗒声打在你的肉棒底部。你因为" + get_player().cockDescript(_loc1_) + "上突然的灼热而颤抖，但当奇哈用她两个长满鳞片的大脚趾夹住你的肉棒时，这变成了快乐的扭动，她的爪子威胁地挂在你的肉棒周围。她咧嘴笑了，看着你，把你的肉棒向下推到你的肚子上。她柔软、坚韧的脚底压在你的肉棒上，慢慢地顺着你的长度上下滑动，把她的唾液摩擦进你的肉棒里，把她的润滑液涂抹开来。");
         outputText("[pg]当龙女用她长满鳞片的脚在你的肉棒上摩擦时，你因为需要而呻吟，拼命地想把自己插进她温暖的洞里，甚至想挺起你的臀部，但奇哈把你按住了，她的爪子轻轻地刷过你敏感的胯部肌肉；你的皮肤在她最轻微的触摸下刺痛，因为缺乏插入而变得危险地敏感。奇哈咧嘴笑了，看着她对你产生的影响，又吐了一口唾沫，给你的肉棒增加了一点润滑液，用她柔软的脚跟长时间地摩擦它。然而，她似乎并不满足。");
         outputText("[pg]奇哈把她的脚从你的肉棒上移开，滑落到她的手和膝盖上，爬行");
         if(get_player().hasTailInsteadOfLegs())
         {
            outputText("沿着你长长的尾巴");
         }
         else
         {
            outputText("在你的[legs]之间");
         }
         outputText("。当她向你靠近时，她的动作缓慢、性感、充满挑逗。她那暗褐色的大乳房擦过地面，坚挺的乳头停在你那被蹂躏的肉棒两侧，沾染着她留在你肉棒根部的先兆液和唾液。龙女趴在你身上，用她的乳房包裹住你的肉棒，将你的" + get_player().cockDescript(_loc1_) + "包裹在温暖、柔软的乳肉中。当她将乳房沿着你肉棒的整个长度拖动，紧紧地挤压在一起，并一次又一次地向你吐口水时，你发出了一声低沉的、野兽般的呻吟。她的乳房就像湿润的小穴一样棒，不会太紧，但湿润得令人愉悦。你拼命地想射精，想用你的精液涂满她的大乳房，仅仅是这个想法就导致一股长长的先兆液从你的" + get_player().cockHead(_loc1_) + "中漏出，加入到你的爱人将你的肉棒变成的湿透的烂摊子中。奇哈恶魔般地对你咧嘴一笑，她长长的舌头伸出来品尝你的精液。");
         outputText("[pg][say: 嗯，不错。而且这么多……你一定很想把你的肉棒插进去，不是吗？你想把那个" + get_player().cockDescript(_loc1_) + "插进我体内吗，笨蛋；感受我紧致的小屁眼吞没你？我想你已经准备好了……]");
         outputText("[pg]奇哈移动了一下，跨坐在你的[hips]上，张开她的屁股瓣。她慢慢地降低自己，向下移动刚好够让你敏感的" + get_player().cockHead(_loc1_) + "刷过她紧致的菊花环。你们俩同时喘息，一道小小的快乐闪电在瞬间连接了你们。奇哈呻吟着，慢慢向下滑动，刚好够让你的龟头穿过她紧闭的括约肌，刷过她肛门通道火热、湿润的内壁。");
         outputText("[pg]不过，她停了下来，将你的肉棒悬在你们俩之间的半空中。她伸出手，顽皮地捏着你的[nipples]");
         if(get_player().biggestTitSize() >= 3)
         {
            outputText("，同时她用手掌抚摸着你的" + get_player().biggestBreastSizeDescript());
         }
         outputText("。她向前倾身，将胸部贴在你的胸前，双臂环绕着你的肩膀。她紧紧地拉着你，将你抱紧，同时恢复了对你肉棒的下降，当你撑开她肛门的内壁时，她之前专横的态度在瞬间消失了。你润滑良好的肉棒毫不费力地滑入她体内，但插入的感觉仍然几乎令人难以抗拒。奇哈的内脏火热而紧致，像一个温暖、湿润的台钳一样挤压着你的肉棒。");
         outputText("[pg]你紧紧地拥抱着奇哈，把她拉近，当她终于");
         if(get_player().cocks[_loc1_].cockLength >= 40)
         {
            outputText("在你的肉棒上触底");
         }
         else
         {
            outputText("把她的脸颊靠在你的胯部");
         }
         outputText("。你们俩都因为缓慢的下降而喘息和喘气，奇哈");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1034) >= 5)
         {
            outputText("越来越高兴");
         }
         else
         {
            outputText("不习惯肛交");
         }
         outputText("而你因为一次又一次的边缘化而变得如此敏感。奇哈慢慢地转动她的臀部，每次拉出你一英寸的肉棒，然后她紧握的屁眼又把它吞没；不过，当她移动时，她很小心，从不让你们俩分开，总是紧紧地抱在一起，因为她轻轻地骑着你的" + get_player().cockDescript(_loc1_) + "。当她终于允许你移动时，你咧嘴笑了，你的臀部向上迎合她的臀部，因为她开始进行短促、快速的弹跳，仍然紧紧地抱着你，足以咬你的耳朵并沿着你的脖子留下吻痕。");
         outputText("[pg]你们一起移动，将你的肉棒深深地压入奇哈火热的肠道，然后几乎退到顶端。一次又一次，你的" + get_player().cockDescript(_loc1_) + "滑入和滑出奇哈的屁眼，慢慢地撑开她，直到变得容易。她开始加快步伐，把你从你一直靠着的");
         if(followerKiha())
         {
            outputText("石头");
         }
         else
         {
            outputText("树");
         }
         outputText("上拉起来，把你的脸埋在她沾满先兆液的乳房之间，因为她开始真正地骑你的肉棒，一次又一次地把她的臀部砸在你跳动的肉棒上，直到你因为需要释放而疼痛。");
         outputText("[pg]奇哈咬着嘴唇，因为肛交而公开呻吟。决定不独自射精，你伸出手，将几根手指插入她湿润的小穴。当你将手像蛇一样伸进她火热、渴望的阴户时，她高兴地尖叫起来。瞬间，你的手指被她的淫液淹没，温暖、粘稠、甜美。你用手指抠了她一会儿，然后抽出手指，将它们压在奇哈微张的嘴唇上，让龙女品尝你为她创造的渴望。她吸吮着你，舔舐着她自己的淫液，同时你将另一只手转移到用手指抠她，轻松地将一个拳头滑入她准备好的小穴。");
         outputText("[pg]你巨大的插入几乎让她爆发。奇哈呻吟着，当你在她体内开始更快地抽插，在她体内创造出双重节奏时，她的牙齿在你的指关节上摩擦。你能感觉到你的肉棒穿过她的阴道壁在捶打她，反之亦然。你咧嘴笑着，试图穿过她的内脏触摸你自己，拉伸和挠痒奇哈最深处的深处——并触摸到一个非常特定的部位。");
         outputText("[pg]奇哈尖叫着高潮了，紧紧地夹住你的拳头和肉棒，因为滚烫的淫液从她的下体喷涌而出。[say: 呀——呀啊啊啊！]她哭喊着，[say: 拜托，你以为……你以为我会让你射精……就这样！？就因为让我……让我爽到我不能——啊啊啊啊！——正常思考……我就会让你也射精；把一大股滚烫的精液射进你那么着迷的屁股里？]");
         outputText("[pg][say: 嗯，你他妈说得对，笨蛋！快射吧！]");
         outputText("[pg]你爱人的高潮和哭喊的要求让你进入了你自己的高潮。终于能够释放自己，你将一股白色、滚烫的精液洪流释放到奇哈的屁眼里，将一团团精液射入她体内深处。她紧紧地抓住你的" + get_player().cockDescript(_loc1_) + "，将她的爪子刺入你的肩膀并咬你的脖子，在你痉挛的肉棒上上下抽打自己，因为你们俩一起高潮，度过了一个强大的高潮，直到你的大脑几乎因为快乐而一片空白。");
         outputText("[pg]当你恢复过来时，奇哈转过身来，现在坐在你的腿上，你沾满精液的肉棒塞进她的屁股里，你的双手环绕着她的腰。她依偎在你的胸前，向后伸手用手指梳理你的头发。[say: 不——不错，对于一个变态来说，]奇哈轻笑着，摩擦着你没有塞进她体内的一小部分肉棒。[say: 如果你幸运的话……我可能会让你再做一次。]");
         outputText("[pg]你咧嘴笑着，给了你的龙女一个长长的、充满爱意的唇吻。你们缠绵地坐了很长时间，亲吻和拥抱，直到奇哈最终从你身上离开。[say: 别整天坐在那里，笨蛋，]她戏弄道，[say: 你不是还有恶魔要打败吗？]");
         outputText("[pg]你离开时顽皮地拍了一下奇哈的屁股，笑着因为撞击导致一股你的精液漏出来并顺着她的大腿流下。[say: 哦，你这个白痴！]当你跑回你的职责时，她咆哮道。");
         get_player().orgasm("Dick");
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,1034,FlagDict_Impl_.arrayReadInt(_loc2_,1034) + 1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function saveToObject() : Object
      {
         return saveContent;
      }
      
      public function reset() : void
      {
         saveContent.badCookingTasted = 0;
         saveContent.flowerGifted = false;
         saveContent.kidFirebreathing = false;
         saveContent.wakeUp = false;
      }
      
      public function playerBeatsUpKihaPreSpiderFight() : void
      {
         clearOutput();
         outputText("龙女瘫倒在一棵树上，四肢无力地颤抖着。[pg]");
         outputText("[say: 我……我不会让你们……带走我……]她呻吟着，拼命想站起来继续战斗。然而，还没等你对目前的情况采取任何行动，你就听到身后传来了海浪拍打的声音。转过身，你看到一群大约两打的蜘蛛人正向小岛逼近。看来奇哈在沼泽里树敌不少，而你终于把龙女打得落花流水，他们现在要来报仇雪恨了。[pg]");
         outputText("你低头看着倒下的敌人，她现在正睁大眼睛看着第一批蜘蛛人爬上陆地，挥舞着爪子、毒牙和棍棒。有那么一瞬间，你确信你能从她的眼睛里看到纯粹的恐惧。[pg]");
         outputText("[say: 哦，玛莱，]当两个蛛化精灵出现在视野中时，她呜咽着，他们都邪恶地咧嘴笑着，带领着这群暴徒。[pg]");
         outputText("令你惊讶的是，奇哈低下头，低声说道：[say: 走吧，[name]。你已经打败我了，他们会惩罚我的软弱……我罪有应得。所以快走吧！][pg]");
         outputText("你可以像个面包师一样赶紧开溜，但天知道如果你这么做了，奇哈会遭遇什么。");
         menu();
         addButton(0,"帮助奇哈",helpKihaAgainstSpoidahs);
         addButton(1,"离开她",leaveKihaToSpoidahHorde);
      }
      
      public function pcWinsDomFight(param1:Boolean) : void
      {
         clearOutput();
         get_images().showImage("kiha-dom-win");
         kihaSprite(true);
         var _loc2_:int = get_player().cockThatFits(67);
         if(_loc2_ < 0)
         {
            _loc2_ = get_player().smallestCockIndex();
         }
         outputText("被击败的龙女倒在地上，她的手臂伸向冰冷、肮脏的地面以缓冲她的下降。[say: 哈……你赢了。我想我确实得做下面那个了，]她带着苦笑说道。她呜咽着，把斧头扔到一边，虚弱地张开双腿，让你随时可以对她为所欲为。你得意地笑了笑，脱下你的[armor]并");
         if(get_player().hasCock())
         {
            outputText("掏出你迅速变硬的[cocks]");
         }
         else if(get_player().hasVagina())
         {
            outputText("释放你涂满泡沫的" + get_player().vaginaDescript(0));
         }
         outputText("从你的抽屉里。你轻笑着，一边在她的双腿间动作，一边取笑奇哈怎么把这么简单的事情弄得这么复杂。你正准备插入她那润滑且流着淫液的小穴时，你感觉到她长满鳞片的肌肉紧绷起来。还没等你反应过来，你的喉咙就被似乎是奇哈尾巴的东西紧紧勒住并压缩了。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,432) > 0)
         {
            outputText("又来！");
         }
         outputText("[pg][say: 就像飞蛾扑火一样！如果某个恶魔只需要假装失败并张开双腿就能让你陷入</i>这种<i>境地，那你确实很容易成为猎物。现实世界可不会在友好的切磋后就随意翻滚并承认失败！战斗直到结束才算结束，而现在看来你已经输了。屈服吧，让我做我最擅长的事，]奇哈自信地哄骗道。你现在有麻烦了。");
         outputText("[pg]用她迷人的大腿缠住你的");
         if(get_player().hasCock())
         {
            outputText(get_player().hipDescript());
         }
         else
         {
            outputText("脸");
         }
         outputText("，龙女拉着");
         if(get_player().hasCock())
         {
            outputText("你");
         }
         else
         {
            outputText("你的舌头");
         }
         outputText("越过她的阴蒂，进入她渴望的小穴。奇哈在无情的快感中呻吟着，在你的小穴上抽插着你，并花时间嘲笑你，而你则因为柔软的小穴摩擦你的");
         if(get_player().hasCock())
         {
            outputText(get_player().cockDescript(_loc2_));
         }
         else
         {
            outputText("嘴部肌肉");
         }
         outputText("而发出咕噜声。[say: 真遗憾，你不得不把这么简单的事情变得困难得多。你不觉得傻吗，被我的尾巴缠住，无力——呃啊！就是这样！就在那里！操！就——在那里！]奇哈尖叫道。她释放出的短暂的狂喜叫声导致她的尾巴稍微松开了一点，让你有机会挣脱。");
         outputText("[pg]你迅速将双手伸进她束缚中转瞬即逝的缝隙，利用她分心的机会，从她的抓握中扭动出来。[say: 什、什么——？]她试图胡言乱语，但当你的双手粗暴地将她的身体翻转过来时，她沮丧和困惑的表情被打断了。空气中短暂地充满了你的龙女情人发出的响亮的[say: 唔]声，然后是一声惊讶的哀号，因为你");
         var _loc3_:Array = [];
         if(get_player().hasCock())
         {
            _loc3_[int(_loc3_.length)] = 0;
         }
         if(get_player().hasVagina())
         {
            _loc3_[int(_loc3_.length)] = 1;
         }
         _loc3_[int(_loc3_.length)] = 2;
         var _loc4_:Number = int(_loc3_[Utils.rand(int(_loc3_.length))]);
         if(_loc4_ == 0 || !get_player().hasVagina())
         {
            outputText("重新插入她的阴户。凭借你的蛮力和体型，你将她的身体压在地上，从后面操她。");
            if(Utils.rand(2) == 0)
            {
               outputText("[pg][say: 哈！勇者还有点战斗力嘛！有本事就把我留在这儿，窝囊废！我会把你按倒，射你一脸！你会像个乖[boy]一样把它全舔干净，直到——呃！]");
            }
            else
            {
               outputText("[pg][say: 哈！勇者[him]还有点战斗力！有本事就把我留在这里，懦夫！我会把你按倒，让你求着把你的种子种在我的子宫里！就等——哦哦哦哦……]");
            }
         }
         else
         {
            outputText("在她的双腿间动作，将你们的阴蒂结合在一起，进行着令人愉悦的旋转舞蹈。锁定在剪刀式的姿势中，当你把你们的小穴磨蹭在一起时，奇哈只能在幸福的喜悦中咯咯地笑。");
            if(get_player().hasCock() && Utils.rand(2) == 0)
            {
               outputText("[pg][say: 哈！勇者[him]还有点战斗力！有本事就把我留在这里，懦夫！我会把你按倒，让你求着把你的种子种在我的子宫里！就等——哦哦哦哦……]");
            }
            else
            {
               outputText("[pg][say: 哈！勇者还有点战斗力嘛！有本事就把我留在这儿，窝囊废！我会把你按倒，射你一脸！你会像个乖[boy]一样把它全舔干净，直到——呃！]");
            }
         }
         outputText("[pg]暂时制服了她，你继续交媾，粗暴地蹂躏着奇哈越来越湿润的小穴，这个雌性龙人因她的");
         if(_loc4_ == 0 || !get_player().hasVagina())
         {
            outputText("爱之通道");
         }
         else
         {
            outputText("阴蒂");
         }
         outputText("。 [say:来吧，白痴！如果你有种的话，就拿出你所有的本事！]");
         if(get_player().get_gender() != 2 && get_player().balls == 0)
         {
            outputText("[pg]你不确定这是一种侮辱，还是在向你发起挑战，让你加把劲。");
         }
         outputText("[pg]她想来点粗暴的？正合我意，你暗自想道。你抓住她的绯红秀发，用力地");
         if(_loc4_ == 0 || !get_player().hasVagina())
         {
            outputText("拉扯，把她的头向后拉向你，奇哈发出一声痛苦的尖叫，因为她的发根向她传达了这种行为的痛苦。[say:你就这点本事吗？！饶了我吧！]");
         }
         else
         {
            outputText("扭动手指，刺激她的阴蒂包皮，让奇哈在惊讶的痛苦和快感中尖叫起来。[say:你就这点本事吗？！饶了我吧！]");
         }
         outputText("她嘲弄地朝你大喊。眨眼间，她的右腿扫过你的肩膀，将你推向地面；她的另一条腿和身体也扭动着，试图将你击倒。你拼尽全力，试图挥动四肢和身体，抵挡奇哈将你按倒在地的企图，但无济于事。这头母龙……");
         if(_loc4_ == 0)
         {
            outputText("爬到了你的骨盆上，将你的" + get_player().cockDescript(_loc2_) + "刺入体内，像个疯子一样咧嘴笑着。[say:我早说过了！]她说道。[say:你真的就这点本事吗？就只会扯头发？]她叹了口气。[say:看来我得教教你……]她一边用臀部猛烈地撞击你的骨盆，一边俯下身来，这个冷酷傲慢的女人咬住你脖子上的[skin]，用犬齿刺穿了它，咬伤的刺痛感传遍全身，让你忍不住叫出声来。她满意地哼着歌，继续粗暴地对待你被困住的肉棒，不断地摩擦和抽插，发出越来越响亮的肉体拍打声。");
         }
         else if(_loc4_ == 1)
         {
            outputText("迅速用双腿夹住你的头，将你的身体翻转成俯卧姿势。[say:吃吧，" + get_player().mf("大男孩","你这迷人的荡妇") + "！我把你锁死了，你绝对逃不掉的！给我舔，婊子！]你暂时顺从了她，用舌头探索着她的小穴，只为了争取时间寻找脱身之法。[say:对，就是这样。好[boy]，舔你主人的小穴！]她威严地娇喘着，你每舔一下，她的大腿就紧绷起来。这龙女甚至还有闲情逸致玩弄你的头发，同时将你紧紧抱在怀里。");
         }
         else
         {
            outputText("坐在你身上，抓住你的[legs]，用坚定的力量向上拉，将你的[feet]拉到她的耳边。当这一连串的动作平息下来时，你发现自己正盯着奇哈那线条优美的臀部，湿润的女性体液顺着你的脸颊流下，奇哈则握住了你的");
            if(get_player().hasCock())
            {
               outputText(get_player().cockDescript(_loc2_));
            }
            else
            {
               outputText(get_player().clitDescript());
            }
            outputText("含在嘴里。[say: 习惯这个角度吧，[name]；这可是你最喜欢的新姿势。]她嘲弄道，然后");
            if(!get_player().hasCock())
            {
               outputText("恶毒地舔舐着你的小穴。");
            }
            else
            {
               outputText("把你的肉棒塞进她的喉咙。");
            }
         }
         outputText("[pg]这可不行！你要支配她，不管她喜不喜欢！你积攒力量，等待挣脱的最佳时机，然后");
         if(_loc4_ <= 1)
         {
            outputText("不让你的脖子被撕裂");
         }
         else
         {
            outputText("不让你的生殖器发生意外");
         }
         outputText("。终于，你重获自由的机会来了，你抓住这个机会，举起双臂，用尽全力扭动身体反抗她。这一招奏效了，奇哈从你的腿上被甩了出去，顺着你们刚才交配的斜坡滚了下去。不幸的是……或者说幸运的是，你发现自己也和她一起滚下了山坡；世界剧烈地旋转着，你滑倒并翻滚向平地。在感觉像是一段令人头晕目眩的漫长时光之后，你感觉到旋转的身体下是平坦的土地，最后停在一棵枯树的旧木桩旁。");
         outputText("[pg]你呻吟着，环顾四周，寻找那个不太配合的龙女。");
         _loc3_ = [];
         if(get_player().hasCock())
         {
            _loc3_[int(_loc3_.length)] = 0;
            _loc3_[int(_loc3_.length)] = 1;
         }
         if(get_player().hasVagina())
         {
            _loc3_[int(_loc3_.length)] = 2;
         }
         _loc3_[int(_loc3_.length)] = 2;
         _loc4_ = int(_loc3_[Utils.rand(int(_loc3_.length))]);
         if(_loc4_ == 0)
         {
            outputText("[pg]你的答案是一条尾巴缠绕在你明显肿胀的阴茎上");
            if(get_player().cockTotal() > 1)
            {
               outputText("");
            }
            outputText("，那条长满鳞片的尾巴正拉着你靠近它的主人。一进入她的触及范围，她就用双手抓住你的肩膀，将你按在附近的一个树桩上。树桩并不宽，你其实并没有被完全困住，但当奇哈扭动着身躯靠近你，并诱惑地将一条腿缠绕在你和树桩上时，这个事实就变得无关紧要了。她的另一条腿也缠了上来，她捧起你的脸，在你的嘴唇上印下一个坚定而湿润的吻；当她对着你的嘴喘息时，你几乎能尝到她呼吸中的情欲和激情。在你的[say:牢笼]中感到安全后，奇哈开始沿着你的" + get_player().cockDescript(_loc2_) + "的长度摆动她的臀部，像个放荡的婊子一样呻吟着，用你的肉棒刺激着自己。[say:哟吼——你打得不-不错！只-只要知道这一点，放松下来，让奇哈向你展示，在内心深处，你总是喜欢做我的小母狗……]");
            outputText("[pg]你拒绝就这样屈服，任由她榨干你的每一滴精液。你现在必须挣脱，否则你就会在性高潮到来时输掉这场[say:战斗]。你拼尽全力，大喊一声战吼，向前猛推，在这个过程中撞断了身后脆弱的树，而奇哈还紧紧地贴在你的身上。你撞上了正前方另一棵枯树，奇哈失去了抓握力，从你身上摔了下来，干枯的松树干在撞击的力度下折断了。在她反应过来之前，你把她翻倒在附近的一块岩石上，把她按在那里，打算在这里结束这场争夺主导权的斗争……但也许她需要一点惩罚？");
            outputText("[pg]你带着恶作剧的意图咧嘴一笑，紧紧握住你的" + get_player().cockDescript(_loc2_) + "，用" + get_player().cockHead(_loc2_) + "摩擦奇哈那湿透了的阴蒂。[say:我现在就让你开心一下，白痴！但我还是会支配你的！]她大喊道。你不这么认为，尤其是在你做完你打算做的事情之后。你没有给她明显渴望的骑乘，而是开始挑逗她的小阴蒂。恐惧传遍了奇哈的全身，她开始挣扎，现在她什么都想要，就是不想要<i>挑逗</i>。[say:嘿！嘿，你这个混蛋，这不公平！]她尖叫着，这种感觉点燃了她身体里强烈的、令人发痒的情欲。你告诉这条母龙，你不能只是把她操到屈服；你需要她乞求，然后你才会给她想要的。[say:我-我恨你！]她大喊着，当你拒绝给她身体渴望的插入时，她呜咽着。没过多久，这位曾经骄傲的女人就在岩壁上颤抖着，紧紧咬住下巴，以防自己乞求。她坚定的表情终于崩溃了，她开始胡言乱语，直到你停下来，给她片刻的喘息。");
            outputText("[pg][say:求你了！我-我需要你在我里面！]奇哈乞求着，她的挫败感太强烈了。对她的惩罚感到满意后，你决定满足她。你再次从后面进入她，带着野蛮和色情的力度在她身上旋转；这条母龙非常愿意躺在那里，接受这一切。[say:啊！操-操-操！]她尖叫着。你的释放迫在眉睫，她的抵抗不再是问题，你肆无忌惮地蹂躏着她的阴户；奇哈完全顺从你的抽插，她迎合着你，努力让你达到火热而粘稠的高潮。当释放的欲望在你的下半身沸腾时，你把脸埋在奇哈的脖子里，对着她长满鳞片的皮肤发出闷闷的高潮嚎叫，生命的温暖精华冲进了她等待的阴道。奇哈自己也在高潮的喜悦中尖叫着，疯狂地抓挠着她躺着的岩壁，坚硬的龙爪在坚硬的石头上刮擦的声音，标志着这就是你教奇哈喜欢做[say:受]的地方。你们俩在性爱的极乐中呻吟和呼喊，你的肉棒的每一次收缩都会沿着她火热小穴的轮廓射出另一股精液，随着你睾丸的最终排空而逐渐减弱。你靠在她身上休息了一会儿，喘着粗气，而她则用双手握住你的手，在你休息时亲吻你的手臂。");
            kihaKnockUpAttempt();
         }
         else if(_loc4_ == 1)
         {
            outputText("奇哈的小腿猛烈地撞击你的膝盖后部，解开了这条母龙去了哪里的谜团，让你重重地摔在肮脏的地上。你被撞得喘不过气来，直到奇哈开始在你的肉棒上展示她的存在，你才意识到接下来会发生什么");
            if(get_player().cockTotal() > 1)
            {
               outputText("");
            }
            outputText("。低头一看，你才发现那只母龙正用");
            if(get_player().cockTotal() > 1)
            {
               outputText("");
            }
            outputText("她带爪的脚抓着你的肉棒！当她刺激你阴茎柔软敏感的部位时，你因这充满快感的震惊而喘息出声");
            if(get_player().cockTotal() > 1)
            {
               outputText("");
            }
            outputText("，同时不得不抬头看着她那胜利的微笑。[say: 勇者的抵抗虽然激烈，但最终还是败在了一个简单的足交之下。你拿什么去对抗恶魔，[name]？不如让我来接替你的征战，你就乖乖做我的母狗吧！] 她傲慢地宣告着。");
            outputText("[pg]想得美，你心想。她现在就要被你征服！");
            outputText("[pg]你反应迅速，双手握拳猛击奇哈臀部的穴位，让她瞬间失去了对双腿的控制。[say: 噢，操！] 她痛苦地尖叫着，松开了你的肉棒");
            if(get_player().cockTotal() > 1)
            {
               outputText("");
            }
            outputText("从她爪子般的脚中挣脱出来。你优雅地将你的[say: 攻击]转变为一记强力的扫堂腿，将她绊倒，让她一屁股摔在地上。她痛苦地呻吟着，随后当你滑到她身上，强行将你的肉棒深深地插入她的小穴时，呻吟变成了愉悦的喘息。[say: 没错，就是这样，]你责备道。[say: 但你是个坏女孩；我想我需要好好调教你，直到你完全准备好迎接我……]");
            outputText("[pg]你将她的双臂按在冰冷的地面上，低头凑近她柔软的乳房，用舌头轻轻弹弄着她乳头的凸起。");
            if(get_player().hasLongTongue() || get_player().tongue.type == 1)
            {
               outputText("[pg]奇哈起初感到一阵兴奋，随后当你用嘴唇包裹住那逐渐变硬的凸起时，她感到一种变态的侵犯感，");
               if(get_player().hasLongTongue())
               {
                  outputText("像蟒蛇对待猎物一样对待她尖挺的乳房，你分别在每个乳头上涂满唾液。脾气火爆的龙女扭动着身体，完全任你摆布，而你则尽情享受着乐趣。");
               }
               else if(get_player().tongue.type == 1)
               {
                  outputText("用你分叉的舌头刺激着那柔软的凸起，为了效果还发出嘶嘶声。想象一下，如果你用那个小东西弄她的阴蒂，她脸上的表情会是怎样；她一定会发疯的！但她还没资格享受那个；你现在想听到的是她先求你好好操她一顿。");
               }
            }
            outputText("[pg]她的呼吸因强烈的性唤起和过度刺激而变得急促，她终于屈服了，恳求你停止玩弄她的乳房，赶紧做[say:更重要的事情。]");
            outputText("[pg]被困在传教士体位中，奇哈欲火焚身，只能用双腿和双臂紧紧缠住你，语无伦次地不断乞求你操她，用你的精液灌满她的小穴。");
            outputText("[pg][say:求你了！我——我需要你进来！啊！操——操——操！]她尖叫着。你即将释放，她的抵抗也不再是问题，你肆无忌惮地蹂躏着她的阴户；奇哈完全顺从你的抽插，迎合着你的动作，努力让你达到火热粘稠的高潮。当释放的冲动在你的下体沸腾时，你把脸埋在奇哈的脖颈处，对着她的鳞片发出沉闷的高潮吼叫，生命的温暖精华涌入她等待的阴道。奇哈自己也在高潮的愉悦中尖叫，把脸埋在你的脖颈处，将她压抑的满足感呻吟进你的身体。你们俩在性爱的极乐中呻吟和呼喊，你的肉棒每一次收缩都会射出另一股精液，沿着她火热小穴的轮廓流淌，直到你的蛋蛋最终被掏空。你靠在她身上躺了一会儿，喘着粗气，而她则感激地亲吻和依偎着你。");
            kihaKnockUpAttempt();
         }
         else
         {
            outputText("[pg]不知从哪里，你感觉到奇哈的尾巴再次缠住了你的喉咙，痛苦地把你拖向她。直到你被牢牢地按在一棵枯老的树上，她才松开手，她跨坐在你饱受摧残的身体上，用她有力的双腿把你压在粗糙的树皮上。当你设法恢复镇定时，你的头已经被困在木制头枕和她流着淫液的阴道之间，现在做什么都太迟了；她已经把你完全控制住了。奇哈得意地笑着，开始用她湿润的阴蒂在你的脸上摩擦。[say:你的意志力很强嘛，勇者！如果你对周围环境再多加注意一点，你可能就赢了。现在……现在你只能乖乖吃我的小穴了，弱者！快点！]");
            outputText("[pg]你需要一点时间来计划如何摆脱困境，所以你现在只能勉强顺从。像响尾蛇的尾巴一样，你快速地用舌尖舔舐她的小豆豆；龙女发出赞许的呻吟，抓住你的头发来帮助[say:引导]你。[say:天哪，你舔穴的技术真好！如果你打不过我，这大概就是你唯一的用处了吧？]她嘲弄地说，仿佛在挑衅你采取行动。感觉到她抓握的力度减弱，你立刻行动起来。");
            outputText("[pg]你抓住她的脚踝，猛地一拽，把它们从她身下抽出来，打破了她对你的控制，让她摔倒在泥土中。你依然抓着她，把她的双腿一直抬到她的耳边，然后把脸埋进她的私处，用恶毒而有效的方式挑逗和折磨着她那饥渴的部位。龙女只是在愉悦中呜咽和呻吟，没有进行强烈的抵抗，你让她达到了高潮，她的双腿不受控制地抽搐，一股淫水喷涌而出，溅了你一身。你花了一点时间清理自己，舔舐着奇哈如此[say:慷慨]地与你分享的体液。[say:哦……哇。我们有时间一定要再来一次！]奇哈精疲力竭、大口喘着气说道。你的脸上露出一丝坏笑，意识到自己还没有射精。[say:谁说结束了？]你笑着说，抓住她，把她按在一棵树上。她瘫倒在地上，这个姿势非常适合");
            if(get_player().hasCock() && Utils.rand(2) != 0 || !get_player().hasVagina())
            {
               outputText("颜射。");
               outputText("[pg]你告诉你的爱人待在那里不要动，你要完成最后一步，你疯狂地套弄着你的肉棒");
               if(get_player().cockTotal() > 1)
               {
                  outputText("");
               }
               outputText("距离奇哈的脸只有几英寸。当她意识到你的意图时，她的身体兴奋起来，她向后仰起头，迎接你即将到来的释放。[say:来吧……来吧……对，射吧宝贝，我太想要了……]她在情欲的喘息中呜咽着，不耐烦地渴望着你的高潮。片刻之后，你感觉到温暖的精液从你的" + get_player().cockHead(_loc2_) + "喷涌而出，一串串精液拍打在奇哈漂亮的脸庞上。当你的精液如雨般落在她身上时，她满足地喘息着，当你的精液覆盖她的脸颊和额头时，她呻吟着。你不想浪费任何一滴精液，你抓住她的后脑勺，把你的" + get_player().cockDescript(_loc2_) + "压在她的嘴唇上；奇哈顺从你的意愿张开嘴，当更多的精液流入她的喉咙和嘴巴时，她发出幸福的哼声。");
               if(get_player().cumQ() < 250)
               {
                  outputText("[pg]对她的顺从和渴望吞下你所有精液的态度感到满意，你从她的嘴里拔出肉棒，充满爱意地抚摸她的头发。吞下你奶油般的甜点，奇哈向你投来感激和满足的目光。");
               }
               else if(get_player().cumQ() < 1000)
               {
                  outputText("[pg]她在试图交替吞咽你的精液和不被呛到之间干呕了几次，但她设法把它们全吞了下去。奇哈揉着充满精液的肚子，靠在树干上，幸福地叹了口气。");
               }
               else
               {
                  outputText("[pg]你射出的量实在太多，她根本无法承受；她柔软的脸颊因为无法容纳的精液而鼓了起来。她推开你的肉棒，吐出一大股精液，整个过程都在咳嗽。然而，你的高潮并没有就此停止，你用咸咸的精液沐浴着她赤裸的身体。[say:哦，天哪，太多了！我都塞满了，你还在射？！]她担心地惊呼。作为回应，你把她的头按在树干上，把你还在喷射的肉棒重新凑到她脸上，又给了她一轮颜射。当浓稠的精液冲击她的脸庞时，这个龙人生物发出咕噜咕噜的声音和呜咽声，精液覆盖了她的整个头部，并在她猩红色的头发上留下了你的印记。为了不淹死她，你过了一会儿就拉开了距离，把剩下的精液浇在她身体的其他部位。擦干净她眼睛里的体液（或者说试图擦干净），奇哈喘着粗气，对她受到的[say:独特]惩罚咯咯地笑。高潮过后，你试图在奇哈身上找一块干爽的地方来擦掉你高潮的产物；令你沮丧的是，根本找不到。她全身都被精液浸透了！你耸耸肩，命令她张大嘴巴，这样她就能把你清理干净。几缕精液明显地从她嘴巴的位置分开，当你继续推进时，你觉得她听从了你的命令。你的肉棒带着覆盖在她嘴上的阻碍性精液丝进入她的嘴里，抵住她温暖湿润的舌头。她花了一段时间，但她设法完成了工作。");
               }
            }
            else
            {
               outputText("帮你解决。");
               outputText("[pg]奇哈无力抵抗，也许即使她能抵抗，她也不愿意抵抗，她躺下并接受你赢得了这场[say:战斗]，当你摩擦她时，她舔舐、吸吮并亲吻你的[clit]。她长长的爬行动物舌头压在并性感地滑过你的下唇和阴蒂的感觉令人难以置信地强烈和满足，没过多久，你就发出一声" + get_player().mf("充满男子气概的","小女孩般的") + "叫喊，猛烈地高潮了，你的肌肉因快感而紧绷，你用女性的淫液浸透了龙女的脸。她欣然舔舐着流淌的淫液，吞咽着你的性精华时发出呻吟。");
            }
         }
         outputText("[pg]做爱结束后，你开始考虑如何确保奇哈在未来决定谁在做爱时做攻做受，以及你们在更日常的互动中各自的角色时能够配合。你吸引她注意力的手势需要强有力，但不能太暴力。你抓住她的喉咙，把她的后脑勺按在树上，凝视着她（被精液遮挡的）眼睛。你明确地告诉她，你已经证明了你的统治地位——现在是反复证明——从现在开始，你期望她能服从你的意愿，因为你多次战胜了她，而且你在战斗中明显更强。谁输了，谁就是为了胜利者的快乐而存在的受，对吧？");
         outputText("[pg]奇哈点点头，在头被按住的情况下尽可能地配合，然后她咧嘴笑了。[say:统治地位不是你做一次就能永远拥有的，[name]。如果你想和我保持在上面，你最好用你的行动来证明。要让我成为任何人的婊子，仅仅几次失败是不够的。]好吧，这大概是你目前能从她那里得到的最好的回答了。你建议回营地；毫无疑问，有些恶魔需要被狠狠地踢屁股。奇哈回答说：[say:听起来是个好主意，[master]。]她的话语中潜藏着一丝幽默，但她才是那个在战斗中无法应付你的人。");
         get_player().orgasm("Generic");
         get_combat().cleanupAfterCombat();
      }
      
      public function pcLosesDomFight(param1:Boolean, param2:Boolean = false) : void
      {
         clearOutput();
         get_images().showImage("kiha-dom-loss");
         outputText("[say: 哈！你最好快点振作起来！如果你输给</i>我<i>，你肯定会输给恶魔！]奇哈欢呼道，战胜了你那青一块紫一块的身体。压力太大了，你最终晕了过去。");
         outputText("[pg]你在床铺上醒来，奇哈正在照顾你，她在你的瘀伤和伤口上涂抹药膏。[say: 听着，我知道那只是一场友好的切磋，但说真的：你不能像那样输给恶魔。我无法想象如果我特别的白痴变成……他们中的一员，我会怎么做。]奇哈忧郁地说。你被她的关心感动了，但你向她保证，没有恶魔能活捉你。她笑了笑，把手放在你的肩膀上，但她看你的眼神似乎在暗示你完全没有抓住她的重点。");
         get_combat().cleanupAfterCombat();
      }
      
      public function onAscend(param1:Boolean) : void
      {
         reset();
      }
      
      public function morning() : void
      {
         clearOutput();
         outputText("第二天早上醒来时，你感觉比预期的要暖和得多。你打了个哈欠，揉了揉惺忪的睡眼，发现奇哈仍然依偎在你身边，头靠在你的胸前，就像你是个枕头一样。你小心翼翼地把一缕头发从她安详熟睡的脸上拨开，欣赏着她愉快的笑容。你试图起身，却让女孩贪婪地紧紧抱住你的身体，她的尾巴生气地拍打着，直到你终于停止移动。");
         outputText("[pg]你想你可以再享受一会儿爱人的温暖。当你充满爱意地抚摸她的头时，奇哈露出温暖的微笑。你的手慢慢穿过她的红发，让这个龙族女孩微微动了一下，并发出幸福的叹息来回应你的抚摸。你甚至觉得你可能听到她可爱地嘟囔着她爱你。");
         outputText("[pg]几乎是悲剧性的，你明白你不能再这样下去了。虽然费了一番功夫，但你还是设法在不吵醒奇哈的情况下挣脱了她。你[if (!isnaked) {穿上你的[armor]，}]最后看了一眼她熟睡的身影。她脸上的笑容已经被孤独的皱眉所取代。她紧紧抓住你的被褥，寻找现在肯定已经失去的安慰。");
         saveContent.wakeUp = false;
         doNext(playerMenu);
      }
      
      public function lovingHugsGirlFuckSex() : void
      {
         clearOutput();
         outputText("奇哈轻轻地摩擦你的阴阜，戏弄道，[say: 下面湿透了，嗯？我本来以为你会稍微……不那么无耻一点。]她继续用手指划过你湿滑的缝隙，在摩擦你的[clit]时，小心翼翼地不让她的爪子勾住你。过载的感觉偷走了你嘴唇上的反驳，让你除了呻吟和抬起臀部迎合她坚持不懈的压力之外无事可做，如此渴望更多的快感，以至于你的身体似乎在自己移动。龙女咯咯地笑，[say: 这就是我打败你所需要做的一切吗？只是……把手指滑进你的小穴，把你变成软糖？]");
         outputText("[pg]扭动身体，你抓住奇哈，把她拉到你身上，突然的动作把她从你敏感的下体拉开——暂时。拉着她的腿，你让这个精力充沛的龙女的小穴正好位于你上方。当然，这意味着她的脸也正好在你的[vag]上方。奇哈在你的嘴唇上呼气，用湿润、令人兴奋的热量浸润你的下体，让你的[clit]产生阵阵愉悦的刺痛感。她戏弄道，[say: 你下面比吃了犬椒的地精还要湿！]");
         outputText("[pg]你用鼻子蹭着她突出的花蕾，让她闭嘴。当你开始用舌头舔她时，滴落在你脸上的女性粘液很容易被忽略。这很有帮助，因为大部分都流进了你的嘴里，让你的感官被她女性气质的浓郁味道和感觉所包围。奇哈颤抖着闭上了嘴。看来她已经设法坐下来，享受性爱本身了。");
         outputText("[pg]片刻之后，一阵快感击中了你的[vag]。奇哈在你的私处嗡嗡作响，饥渴地舔舐着你的汁液，作为回报。她住所的内部开始散发出性唤起和性液体的气味，充斥着足够的女性荷尔蒙，让你们俩都有些头晕。龙女深色的外阴是如此光滑，如此适合亲吻，如此完美地适合舔舐，以至于你的注意力变得越来越狂热。与你完美同步，奇哈用她长长的爬行动物舌头熟练地舔舐，照顾着你自己的欲望。");
         outputText("[pg]奇哈对着你的小穴咕哝着，[say: 要……要……]，但在她说完之前，你把你的小穴猛地压在她的脸上，在她的鼻子上摩擦，同时带她走向高潮。你的身体燃烧着欲望，一旦你在舌头上尝到女战士爆发出的女孩蜜汁，你就会呻吟着更用力地挺动你的[hips]，在她的鼻子上摩擦你的[clit]，直到快感让你抽搐，汁液");
         if(get_player().wetness() < 3)
         {
            outputText("滴落");
         }
         else if(get_player().wetness() < 4)
         {
            outputText("流淌");
         }
         else if(get_player().wetness() < 5)
         {
            outputText("泛滥");
         }
         else
         {
            outputText("爆发");
         }
         outputText("从你的[vag]流到她的脸上。当你在她身上扭动时，你坚硬的乳头深深地陷入奇哈紧绷的肚子里。龙那汗水湿透、起伏的身躯是你被高潮弄得神魂颠倒的大脑的完美伴侣，每次你设法控制住你抽搐的肌肉时，你都会确保再舔几口爬行动物的蜜汁。美味。");
         outputText("[pg]奇哈慢慢地从你身上爬下来，躺在你身边，光滑但有鳞片的身体拖到你身边，直到她与你四目相对，她灼热的气息中散发着强烈的你的汁液的味道。你吻了她，把她的下唇吸进嘴里片刻，然后她退了回去，睁着充满爱的眼睛看着你。她紧紧抱住你，低声说，[say: 那是……可以接受的……]奇哈笑了笑，闭上了眼睛。你叹了口气，在她身边小睡了一会儿。");
         outputText("[pg]<b>过了一会儿……</b>");
         outputText("[pg]奇哈带你飞回去拿你的盔甲。寻找花了一点时间，但你最终还是找回了它。她犹豫地看着你，然后给了你一个告别吻。[say: 别在外面送命了。如果没有你总是把一切都搞砸，我会很无聊的。]");
         get_player().orgasm("Vaginal");
         dynStats(DynStat.Sens(-2));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function lovingHugsForRetards() : void
      {
         clearOutput();
         outputText("奇哈粗暴地拍了拍你的屁股，让你过度兴奋的脊椎一阵颤栗。你瞪着她，而她则咯咯地笑，[say: 我打赌那个褶皱很敏感吧？]在你回答之前，奇哈已经把你拉进她的怀里，回到了一个温暖、性感的吻中。她暗色的嘴唇掩盖了你的回答，然后她长长的舌头性感地缠绕着你的舌头，抚摸着你的口腔，直到你把所有关于回答的想法都抛到九霄云外。奇哈红宝石般的发丝遮住了你们的脸，你们在亲热，你们两人的身体摩擦在一起。");
         outputText("[pg]在奇哈的尾巴穿过你的括约肌进入你的[asshole]之前的一瞬间，你臀部之间的一种痒痒的感觉把你从奇妙的亲热中惊醒。你喘着粗气");
         if(get_player().analCapacity() < 30)
         {
            outputText("在痛苦和快乐的交织中");
         }
         else
         {
            outputText("在快乐中");
         }
         outputText("因为这意想不到的入侵，虽然这并不是不受欢迎的（因为这是你唯一可以被性插入的孔），但她至少可以让你知道她要做什么！你能感觉到它在你体内蠕动，在你的屁股里扭动和蠕动。令人惊讶的是，龙女的鳞片让她的尾巴具有一种刺激的质感，抚摸着你内脏的每一个扭曲和褶皱。");
         outputText("[pg]奇哈把你滚到她上面，让你的[legs]张开并让开，让她的尾巴畅通无阻地进入你的[asshole]。她伸出手捏住你的乳头，问道，[say: 你真的从那里面得到高潮了吗？感觉我一半的尾巴都塞进去了，你脸红得比晒伤的小恶魔还要红。]");
         outputText("[pg]你让她闭嘴，把它塞得更深。奇哈露出异想天开的微笑，满足了你粗鲁的要求，将另一英寸厚的龙尾塞进你的直肠。它把你撑得那么大——");
         if(get_player().ass.analLooseness < 4)
         {
            outputText("你确信在这之后你会合不拢嘴一会儿");
         }
         else
         {
            outputText("你确信在这之后你会合不拢嘴更长一段时间");
         }
         outputText("。奇哈得意地笑了笑，微微向后退去，把你拉倒在她的腿上，然后再次向上刺入，那根滚烫、粗壮的附肢深深地钻了进去，将它那温暖的热量埋在你的体内。");
         outputText("[pg][say: 你这个白痴……喜欢屁股里插根尾巴？真恶心，]你的爱人一边评论，一边开始在你体内越插越深。你呻吟着靠向她，将她的一颗深色乳头含入嘴里吸吮。她的皮肤尝起来因为汗水而有些咸，还带着一丝你无法完全辨认的辛辣味。她呻吟着，当你在照料这位龙女那坚硬的小花蕾时，她的尾巴在你肛门里微微颤抖。你又咬又舔，手顺着她的双腿之间滑下，去感受她三角区那熔岩般的热度。她把你的手都弄湿了。");
         outputText("[pg]奇哈抓住你的头发，把你的头拉回来，看着她的眼睛。她低语道：[say: 我……我想我喜——哦哦哦，就是那里……]不管她本来想说什么……都被你指尖在她阴阜上的挑逗打断了。你退后一步，在她龙尾那震撼全身的抽插间隙问道：[say: 什么？]，但奇哈抓住你的手，把你的手指塞回她的阴部。她要求道：[say: 还要！]你用拇指揉捏她的阴蒂，将三根手指塞进她湿透的阴道，感觉到她的下体在颤抖，紧紧挤压着你的手指，仿佛能从中挤出精液一样。受到这番鼓励，你用坚定的动作抽插她的阴部，配合着她的尾巴插入你那被彻底侵犯的肛门的节奏。");
         outputText("[pg]这位爬虫女人的眼睛开始向上翻，她发出一声胜利的嘶嘶声，欢呼道：[say: 是的——]，片刻之后，她的整个身体开始剧烈扭动。她的尾巴在你体内扭动，压在一个特别敏感的位置，在你体内引发了同样强烈的快感瀑布。当你在无言中与你的爱人沉浸在性爱的极乐中时，她的乳头从你那大张着、呻吟着的嘴里滑落。你紧紧贴着她，当高潮震撼你们的身体时，你们俩拼命地抱紧彼此。");
         outputText("[pg]随着激情的消退，你那长满鳞片的伴侣慢慢地从你的[asshole]中抽出，你那被严重侵犯的通道在短暂的大张中感到一阵刺痛。她带着仍在她怀里的你滚到一边，在你的嘴唇上快速啄了一下，然后承认道：[say: 感觉还不赖……]还不赖？还不赖！？那简直太棒了！她的眼皮渐渐合上，很快就睡着了，剥夺了你回答的机会。哦，奇哈。你叹了口气，在她身边小憩了一会儿。");
         outputText("[pg]<b>过了一会儿……</b>");
         outputText("[pg]奇哈载着你飞回去拿你的[armor]。寻找花了一点时间，但你最终还是找回了它。她犹豫地看着你，然后给了你一个告别之吻。[say: 别在外面送命了。要是没有你整天把事情搞得一团糟，我会很无聊的。]");
         get_player().orgasm("Anal");
         dynStats(DynStat.Sens(-2));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function lovingHugDickings() : void
      {
         clearOutput();
         var _loc1_:int = get_player().biggestCockIndex();
         outputText("奇哈笑着说，");
         if(get_player().biggestCockArea() > 100)
         {
            outputText("[say: 你带着这玩意儿到处晃荡，见人就打，你是怎么走路的？]");
         }
         else if(get_player().biggestCockArea() > 9)
         {
            outputText("[say: 你带着这玩意儿一直翘着，你是怎么走路的，还是说这只是为了我？]");
         }
         else
         {
            outputText("[say: 这么小的东西，你怎么能享受性爱？我都不知道我能不能感觉到。]");
         }
         outputText("她直接用手捏住[onecock]，让你在最短暂的瞬间感受到她握力的强度，然后缓慢而性感地抚摸你。你呻吟着，因为所有的前戏而压抑了太久，以至于你高兴地在奇哈的手指上耸动。在经历了这么长时间的亲密接触却只有这么少的刺激之后，她的手淫感觉简直是神圣的。前列腺液很快就涂满了这位母龙的手，让空气中充满了每一次抚摸带来的淫荡的湿润的“吧唧”声。");
         outputText("[pg][say: 你真可悲，] 奇哈嘲笑着，开始更快地套弄你，让你接近不可抗拒的高潮。[saystart]你以前很强硬的，勇者。怎么了？在你的");
         if(get_player().biggestCockArea() <= 9)
         {
            outputText("小");
         }
         outputText("工具上撸几下，你就成了我手里的泥巴。[sayend] 厌倦了她的长篇大论，你鼓起力量，把她拉倒在你身边，爬到她的躯干上，把你的" + get_player().cockDescript(_loc1_) + "正正地放在她的双乳之间。你抓住她的乳头，粗暴地向内拉，让你的爱人发出一声痛苦与快乐交织的喘息。当你开始把滴着液体的肉棒滑过她乳沟那棕色的山谷时，这声喘息变成了淫荡的呻吟");
         if(get_player().cocks[get_player().biggestCockIndex()].cockLength >= 36)
         {
            outputText("，尽管你湿润的龟头不断地撞到她的鼻子");
         }
         outputText("。奇哈柔软的乳房用柔软的胸部肌肉尽可能多地包裹住你的肉棒，虽然她在那里不像这片土地上的许多女人那样丰满，但她格外温暖的体温让你的阴茎充满了足够的快感，让你射出你的精华。");
         outputText("[pg]");
         if(get_player().horseScore() > 4 || get_player().dogScore() > 4 || get_player().catScore() > 4)
         {
            outputText("咆哮着");
         }
         else
         {
            outputText("咕哝着");
         }
         outputText("，当高潮穿过你的身体时，你紧绷了一会儿，排出了");
         if(get_player().cumQ() > 400)
         {
            outputText("粗壮的");
         }
         outputText("精液喷射在奇哈的脸、脖子、");
         if(get_player().cumQ() >= 400)
         {
            outputText("头发、");
            if(get_player().cumQ() >= 800)
            {
               outputText("地板、");
            }
            if(get_player().cumQ() >= 1200)
            {
               outputText("墙壁、");
            }
         }
         outputText("和胸部。奇哈因为自己所处的顺从姿势而颤抖，脸涨得通红（好吧，比平时更红）。她用舌头舔去鼻尖上乳白色的精液。[say: 嗯……干得好，英雄。难道从来没有人告诉过你，女人应该先高潮吗？]奇哈问道。");
         outputText("[pg]你明确地提醒她，她已经高潮过了。她变得更红了，因为尴尬，她的尾巴在身后甩来甩去。奇哈皱着眉头反驳道，[say: 好吧，我还不满足，所以你最好继续。]她给了你的" + get_player().cockDescript(_loc1_) + "一记远比你从她表情中预想的要轻柔得多的拍打。龙女的怒容融化成一种性感的“过来”的表情，她慢慢地张开她线条分明的大腿，露出她下体那黑暗、无毛的入口。汁液从里面滴落，用女人的精液弄脏了她的床，但奇哈只是抚弄着她的阴蒂，对你发出咕噜声，用她身体的每一个动作召唤你来操她。");
         outputText("[pg]这景象让你的下半身再次恢复到完全、悸动的坚硬，即使[eachCock]仍在从它的精液缝中漏出丝丝精液。你看着她的眼睛，在她的嘴唇上印下了一个漫长而缓慢的吻，然后滑入她天鹅绒般柔软的深处。奇哈在你的嘴里呻吟，当她屈服于你的男子气概时，她的手臂和腿缠绕着你，她的臀部已经在渴望、痛苦的快感中摇摆。当你打破这个吻，凝视着她那奇特的、火红色的眼睛时，一缕唾液挂在你们的嘴唇之间。她喃喃地说，[say: 我……我想我爱——哦哦就在那里……]");
         outputText("[pg]你慢慢地将你的" + get_player().cockDescript(_loc1_) + "插入她体内，并在她的后颈处落下半是亲吻、半是轻咬的吻");
         if(get_player().cockTotal() > 1)
         {
            outputText("，让");
            if(get_player().cockTotal() == 2)
            {
               outputText("你的另一个");
            }
            else
            {
               outputText("你剩下的");
            }
            outputText("男子气概滴在她的肚子上");
         }
         outputText("。你问她刚才在说什么，奇哈回答说，[say: 你……哦哦……没那么糟。]不是那样的。你在喉咙深处低吼，加快了速度，以震动床铺的力量将你的骨盆撞向这头暗色的龙。当你开始啃咬和舔舐她的耳朵时，她灼热的气息拂过你的肩膀，在你用力快速地操她时，注意着她的每一个小细节。奇哈带爪的指尖深深地陷入你的背部，划出了一道道血痕，她开始越来越大声地呻吟，只有狂热的叫喊声打断了她，[say: 是的！]");
         outputText("[pg]臀部挺动，你像是在拼命一样操着奇哈，看她抓你背的样子，可能真的是这样！每次你的" + get_player().cockDescript(_loc1_) + "猛烈地撞击回里面时，她紧致、火热的小穴就会喷出小股的龙精。在一次特别用力的推挤之后，她带爪的脚在你的背后交叉，将你困在那里，");
         if(get_player().cockArea(_loc1_) < 50)
         {
            outputText("没入她湿透的爱之隧道，");
         }
         else
         {
            outputText("尽可能深入到你惊人的尺寸所允许的程度，");
         }
         outputText("你的" + get_player().cockHead(_loc1_) + "顶着她子宫的入口。奇哈转过身来咬住你的肩膀，同时她的尾巴盘旋在你们两人周围，迫使你们进入最亲密的拥抱。她的整个身体颤抖了一次，两次，然后进入了微小、有节奏的抽搐。一声低沉、愉悦的呻吟从奇哈的嘴里嘶嘶作响，当她的嘴离开你的肉体时，你可以看到她的眼睛因为这一切的强烈程度而翻白。");
         outputText("[pg]龙女湿滑的阴户一遍又一遍地从根部到冠部抚摸着你的" + get_player().cockDescript(_loc1_) + "，乞求你释放你的种子。你尽可能地弓起背，愉快地顺从了。精液从[eachcock]喷发出来，以宣称它的战利品——你那极度幸福的伴侣渴望精液的子宫。");
         if(get_player().cockTotal() > 1)
         {
            outputText("多亏了你的");
            if(get_player().cockTotal() == 2)
            {
               outputText("双重");
            }
            else
            {
               outputText("多重");
            }
            outputText("男子气概，抽搐的女人的前面和她的里面一样被涂满了。");
         }
         if(get_player().cumQ() >= 500)
         {
            outputText("一股又一股你乳白色的浓浆将爬行动物的子宫浸泡在精液中，这是你男子气概的证明。");
         }
         if(get_player().cumQ() >= 1000)
         {
            outputText("没过多久，你就淹没了这个可怜的精液容器，并滴落到床上。感觉太好了以至于不在乎，你只是继续呻吟，同时你");
            if(get_player().cumQ() <= 2000)
            {
               outputText("填满了奇哈的床");
            }
            else
            {
               outputText("把奇哈的住所变成了你的精液游泳池");
            }
            outputText("。");
         }
         outputText("即使在你平静下来之后，这个精力充沛的女人的小穴似乎还在吸吮你的阴茎，仍然迷失在它自己的快感中。");
         outputText("[pg]奇哈继续高潮了一段时间，但最终，她确实从高潮的巅峰降了下来。她那疏远、易怒的举止似乎消失了（暂时），你在她不寻常的眼睛里能看到的只有爱。龙女紧紧抱住你，低声说，[say: 可以接受……]");
         outputText("[pg]这就对了。你叹了口气，在她身边小睡了一会儿。");
         outputText("[pg]<b>过了一会儿……</b>");
         outputText("[pg]奇哈带你飞回去拿你的" + get_player().armorDescript() + "。寻找花了一点时间，但你最终还是找回了它。她犹豫地看着你，然后给了你一个告别吻。[say: 别在外面送命了。如果没有你总是把一切都搞砸，我会很无聊的。]");
         get_player().orgasm("Dick");
         dynStats(DynStat.Sens(-2));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function lovinHugKiha() : void
      {
         clearOutput();
         get_images().showImage("kiha-lovinhug");
         kihaSprite(true);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,421,2);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,422,0);
         outputText("趁奇哈还没反应过来，你凑近她，双臂环抱住她，紧紧地搂着她，同时坦白道：[say: 我来这里是因为我喜欢你。]");
         outputText("[pg]奇哈");
         if(get_player().get_tallness() >= 95)
         {
            outputText("抬头");
         }
         else if(get_player().get_tallness() <= 60)
         {
            outputText("低头");
         }
         outputText("看着你，她那爬行动物般的眼睛里闪烁着泪光。她的声音因不确定而颤抖，结结巴巴地说：[say: 你、你什么意思？]");
         outputText("[pg]你告诉她，你有多喜欢她的陪伴，她如何提醒你来这里的目的，以及她有多美（当她不对你大吼大叫的时候）。奇哈在你的怀里颤抖着，尽管这个热气腾腾的拥抱没有丝毫寒意。她用力眨了眨眼，呜咽着说：[say: 我……我从、从来没想过……我不……] 这位脾气火爆的红发女郎声音渐渐微弱，回抱住你，抱得那么紧，你都担心她会勒断你的一根肋骨。她确实把肺里的大部分空气都挤了出来。");
         outputText("[pg]过了好一会儿，奇哈才察觉到你的不适。当她意识到时，她从拥抱中挣脱出来，紧张地局促不安。你抓住她，把她拉了回来，这次你用手托起她的下巴，然后");
         if(get_player().get_tallness() >= 95)
         {
            outputText("把它拉下来");
         }
         else if(get_player().get_tallness() <= 60)
         {
            outputText("把它抬起来");
         }
         else
         {
            outputText("微微倾斜");
         }
         outputText("在她那微张的暗色嘴唇上印下一吻。她融化在你的怀里，她身体的热度让你出汗，但这一次，你一点也不介意。奇哈的尾巴高兴地摇摆着，在水里溅起水花，这位急切的母龙靠在你身上，把你们俩推向附近的一棵树。她用一条腿勾住你的大腿，把你紧紧地拉向她，让你不禁感受到她柔软的乳房挤压着你，她坚硬的乳头顶着你和你的[armor]。");
         outputText("[pg]这位女战士的斧头立在几英尺外，像一个沉默的哨兵。在激情的时刻，它被遗忘了。奇哈那惊人的、通常被压抑的性欲显露出来，她把长长的舌头强行伸进你的嘴里，缠住你的舌头，同时她那调皮的、长着爪子的手指轻轻地脱下你的[armor]，一件接一件。");
         if(get_player().hasCock())
         {
            outputText("[pg][EachCock]弹了出来，完全充血时拍打在奇哈的大腿上。她轻轻地套弄了一下，然后评论道：[say: 还算可以吧。]");
         }
         else if(get_player().hasVagina())
         {
            outputText("[pg]你的[vag]暴露在空气中，感到一阵酥麻。这位好色的龙女把一根手指伸进你的深处，然后评论道：[say: 还不错，我想。]");
         }
         else
         {
            outputText("[pg]你光滑的腹股沟和[asshole]暴露在空气中，感到一阵酥麻。奇哈轻轻地抚摸着你光滑的皮肤，一直摸到你的会阴，然后评论道：[say: 不是很理想，但我能凑合。]");
         }
         outputText("[pg]你喘着粗气，因为那个吻仍然有些上气不接下气，对她对你身体不那么热情的评价，你的脸上浮现出一丝皱眉。这个巧克力色的可爱女孩抓住你的[butt]，把你拉回她身边。这一次，你");
         if(get_player().get_tallness() >= 95)
         {
            outputText("俯下身");
         }
         else if(get_player().get_tallness() <= 60)
         {
            outputText("伸出手");
         }
         else
         {
            outputText("伸出");
         }
         outputText("向她那闪闪发光、汗水湿透的乳房。她深色的乳头似乎在向你招手，你轻轻地舔了一下，然后吞噬了那敏感的花蕾。奇哈兴奋得晕头转向，把尾巴拱起来，让它卷上你的背部为你按摩。光滑、布满鳞片的背部按摩几乎和你正在吸吮的柔软女性肌肤一样迷人，但最终，吸引你注意力的是她的乳头。你只吸吮了一会儿，但当你退开时，奇哈已经气喘吁吁，脸红得厉害。");
         outputText("[pg][say: 这……这就是你的全部本事吗？这可不够，] 当你开始吸吮她的另一个乳头时，奇哈呻吟着。你伸手探向她的私处，那里已经滴下了滚烫的渴望，你开始抚摸它，挑逗她的阴户，同时紧紧盯着她挺拔的乳房。肌肉发达的大腿颤抖了一下，然后失去了知觉，几乎把你们俩都摔进水里，然后你改变姿势，托住奇哈颤抖、无力的身体。她的翅膀无力地拍打着，浸湿了你的手，从她快速的高潮中，少量的淫液喷射到沼泽水里。这位筋疲力尽的爬行动物女士慢慢地用手臂、腿甚至翅膀缠住你，紧紧地抱着你，试图恢复体力。水分顺着你的肩膀后面滴下来——奇哈在哭吗？");
         outputText("[pg]你伸出手，抚摸着奇哈的头发，安慰着这个虚弱、脆弱的女孩。她吸了吸鼻子，低声说：[say: 你这个笨蛋……如果……如果恶魔发现了我们怎么办？] 她的身体慢慢地从你身上松开，最后断开接触的是她的尾巴，它从你的[leg]上解开。这位母龙在小臂上擦了擦脸，拿起她的斧头，嘟囔着：[say: 笨蛋。]");
         outputText("[pg]你依然赤身裸体，兴奋得无法正常思考，你又吻了她。当你退开时，奇哈叹了口气，微笑着低语：[say: 我的笨蛋。]");
         outputText("[pg]奇哈拍打着翅膀，把树叶和碎屑弄得到处都是，拍打得足够用力，把你们俩都带离了地面。");
         if(get_player().canFly())
         {
            outputText("你可以自己飞，但你现在紧紧抓住她，享受着这个拥抱。");
         }
         else
         {
            outputText("当她起飞时，你别无选择，只能拼命地抓住她。");
         }
         outputText("[pg]在树叶中找到一个缺口，这位脾气暴躁的龙女带着你飞向天空。从这里看，下面粗糙的沼泽树木显得不那么雄伟了，很快，它们就模糊地飞过。毫无预兆地，奇哈扭动身体，俯冲下去，把你带到沼泽里的一个小岛上——她的家。她带着你从屋顶的一个缺口俯冲进去，自信地在住所远处的墙上稳住自己，把你放在坚硬的泥土上。你踉跄了一下，因为突然的飞行而感到头晕目眩。");
         outputText("[pg][say: 让龙高潮真的会让你那么头晕吗？] 奇哈问道。还没等你回答，她就把你扑倒在床上。她的态度虽然依然凶猛，但比起威胁，更让你想起一只顽皮的小猫。");
         dynStats(DynStat.Lust(get_player().maxLust(),DynStatOp.Eq),DynStat.NoScale);
         if(get_player().hasCock())
         {
            doNext(lovingHugDickings);
         }
         else if(get_player().hasVagina())
         {
            doNext(lovingHugsGirlFuckSex);
         }
         else
         {
            doNext(lovingHugsForRetards);
         }
      }
      
      public function loseToSpiderMob() : void
      {
         clearOutput();
         kihaSprite(true);
         outputText("你倒下了，无法继续战斗。一只蛛化精灵得意地笑着，用她蜘蛛腿的平坦部分狠狠地敲了你的头。你脸朝下摔进泥里，几乎失去了知觉，而那群怪物从你身边经过，扑向她们真正的猎物——奇哈。你可以透过小岛上的泥土和高草看到她被数量庞大的敌人拖倒。两打蜘蛛人，其中一半准备好了坚硬如石的肉棒，扑向了她。在龙女反应过来之前，她就被一只蛛化精灵用网绑住了，而一个蜘蛛男孩则依次堵住了她的每一个洞。奇哈尖叫着挣扎，至少直到一根肉棒塞进她的嘴里，一对蜘蛛荡妇把手伸进她的小穴里。");
         outputText("[pg]你除了看着第一波蜘蛛射精，用精液把奇哈涂成白色之外，什么也做不了。然后第二组上来，把他们的肉棒塞进她仍然张开、滴着液体的洞里。这种情况发生了两次，然后是三次，直到奇哈变成了一滩浓稠、湿透、几乎失去知觉的精液池，只有她那两只恶魔般的角和坚韧的翅膀从精液浴中伸出来，证明了她的身份。最后，蜘蛛们心满意足地开始撤退，但在离开之前，她们对龙女发出了毫不掩饰的威胁。");
         outputText("[pg]当她们终于离开后，你设法爬到奇哈身边，问她是否还好。你得到的只是一个茫然的眼神。你试图让她尽可能舒服些，但在那之后你也没什么能为她做的了。一旦她稍微清理干净，你包扎好她的伤口，你就一瘸一拐地回到了营地。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,421,1);
         get_combat().cleanupAfterCombat();
      }
      
      public function loseKihaPreSpiderFight() : void
      {
         clearOutput();
         outputText("还没等你倒下，奇哈就掐住你的脖子，把你从地上提了起来。她把你的背狠狠地撞在树皮上，用她强有力的爪子捏碎了你的气管。她把脸凑到你面前，你能感觉到她灼热的呼吸喷在脸上，几乎要烫伤你的皮肤。[pg]");
         outputText("[say: 我不想杀你，]奇哈轻声说道，你很惊讶这声音竟然出自一个似乎准备结束你生命的人之口。[say: 我不想。但是……我别无选择！]她抓起斧头，准备给你致命一击。[say: 我不会被带回那里的。我不会！我会消灭恶魔女王派来的任何人！][pg]");
         outputText("当奇哈举起手臂时，你拼命挣扎试图挣脱——但在你虚弱的状态下，龙女的力量对你来说太大了。你生命中的片段开始在眼前闪现……直到你瞥见奇哈的肩膀后方。大约有两打蜘蛛人和蛛化精灵爬上了岸，正慢慢向你们这出小戏逼近。看来她在这里树敌不少，而你给了他们一个千载难逢的机会来挫挫奇哈的锐气。[pg]");
         outputText("你可以警告奇哈有暴徒靠近——或者你可以让他们扑向她，然后在混乱中溜走，让奇哈去面对等待她的任何可怕命运。你该怎么做？");
         menu();
         addButton(0,"警告奇哈",warnKihaOfHerImpendingDemise);
         addButton(1,"随他们去",letTheSpidersHaveTheirWayWithKiha);
      }
      
      public function load(param1:int, param2:*) : void
      {
         Utils.extend(saveContent,param2);
      }
      
      public function lieThere() : void
      {
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,425,1);
         clearOutput();
         kihaSprite(true);
         outputText("你决定顺其自然。你抬头看着站在你上方的剑士……");
         outputText("[pg]等等，你认得那条尾巴——还有那紧致的屁股！当你看着火蜥蜴赫莉娅那燃烧着火焰的尾巴在你上方扫过时，你咧嘴笑了，她双手紧紧握着弯刀。");
         outputText("[pg][say: 绝对不行，你这长鳞片的婊子，]赫尔咆哮着，怒视着奇哈，而那只母龙正举着斧头跳了起来。[say: 你他妈别想碰我的[name]还能全身而退。听见了吗？]");
         outputText("[pg][say: 你这婊子！]奇哈尖叫着，弹掉她那" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2191) > 0 ? "近乎" : "") + "赤裸的身体上的泥巴。[say: 你怎么敢？你怎么敢把我扔进泥里！？我他妈要教训教训你！]");
         outputText("[pg]卧槽。你赶紧低下头，一大股火焰从你头顶喷过，将赫尔完全吞没在爆炸中，差点把你烤成泥人。奇哈大笑着，在赫尔消失在龙焰爆炸留下的烟雾中时，发出了胜利的咆哮。");
         outputText("[pg]烟雾散去时，你剧烈地咳嗽着。你在脸前挥了挥手，拼命地在烤干的泥土里寻找肯定已经被烧成灰烬的赫尔的踪迹……然而她依然站立着！虽然你可以看到她的鳞片比基尼和丁字裤已经被烧毁，让她像奇哈一样赤裸，丰满的乳房自由地悬挂着，但她似乎毫发无损地活了下来。");
         outputText("[pg]火蜥蜴皱着眉头，只是将双臂交叉在丰满的胸前。[say: 说真的。说真的，你这贱人！？]赫尔厉声说道，抓住了她那燃烧着火焰的尾巴。[say: 你他妈看到这个了吗！？那种软弱的攻击对我一点用都没有，你这白痴。]");
         outputText("[pg]奇哈一时惊呆了，惊讶于她强大的火焰吐息居然没有把赫尔骨头上的肉融化。不过，她很快恢复了过来，大喊道：[saystart]滚出去！这是我的沼泽，你身后的那个");
         if(!get_player().isGoo())
         {
            outputText("肉袋");
         }
         else
         {
            outputText("黏液袋");
         }
         outputText("是我的，听懂了吗？[sayend]");
         outputText("[pg][say: 哦，[he]是你的，是吗？]");
         outputText("[pg][say: 没错，你这婊子。所以赶紧把你那长满鳞片的肥屁股挪开！]");
         outputText("[pg][say: 肥！？] 赫尔气呼呼地说，她的尾巴在身后危险地摇摆着。[say: 你只是嫉妒你没有这么好看的屁股！]");
         outputText("[pg]奇哈皱起眉头，转了半个圈，让她肌肉发达的屁股清晰可见。[say: 哈！好像我有任何值得嫉妒的地方！你才是那个应该嫉妒的人！]");
         outputText("[pg]赫尔愤怒地跺脚。[say: 哦，去你的！我的屁股比那堆拉屎的肌肉好太多了。]");
         outputText("[pg][say: 拉屎的肌肉！？！]");
         outputText("[pg][say: 拉屎的肌肉，] 赫尔冷笑着说。[say: 最重要的是……你的奶子很小。[name]到底为什么会想要那些小东西而不是这些，] 她笑着，托起她那巨大的E罩杯以示强调。");
         outputText("[pg][say: 哦，好像" + get_player().get_short() + "会多看两眼那些松垮垮的东西！] 奇哈咆哮着，防备地抓住自己的D罩杯。[say: [He]显然更喜欢小一点、挺拔一点的胸部。不是吗，[name]？]");
         outputText("[pg]你开始结结巴巴地回答，但在你意识到之前，赫尔已经把一只脚放在你的胸口，把你推得更深地陷入仍然滚烫的泥浆中。[say: 你到底怎么知道[name]喜欢什么，嗯？<i>我</i>确切地知道是什么让[him]兴奋！]");
         outputText("[pg]在你为自己辩护之前，赫尔用她带爪的脚撕下了你的[armorName]的下半部分。她对你咧嘴一笑，把脚跟放在[cock one]的底部。她短促而有力地揉搓了一下，当她的脚跟滑过你变硬的肉棒时，把它推向你的肚子。她调皮地抚摸了几下你的肉棒，但你肉棒明显变硬，很快就变成了全面的足交，赫尔用她脚跟的爪子勾住你肉棒的一侧，把脚的其余部分包裹在另一侧。她无耻地给你打飞机，抽插着你坚挺的肉棒，而奇哈则睁大眼睛盯着看。");
         outputText("[pg]奇哈发出野性的愤怒咆哮。[say: 你他妈的怎么敢！？] 她尖叫着，气冲冲地走过来。[say: 把你肮脏的脚从[name]身上拿开！]");
         outputText("[pg]奇哈用力推了赫尔一把，导致她向后踉跄，而龙女则居高临下地看着你。[say: 你到底为什么会喜欢像她这样的婊子，嗯？] 她问，[say: 那种心血来潮就开始施恩的女孩。怎么，你喜欢荡妇吗？嗯？是这样吗？]");
         outputText("[pg]该死，这些女孩根本不让你插嘴。你正要开始大喊，但令你完全震惊的是，奇哈把脚直接放在你的肉棒上。[say: 好吧，如果你这么喜欢放荡的婊子，你觉得这个怎么样！？] 她的脚沿着你肉棒的长度滑动，沿着整个长度进行缓慢而性感的抚摸，最后将她令人惊讶的娇小脚趾停在你现在肿胀的龟头上。[say: 这就是你喜欢的，不是吗？我以为你不是个性狂，但也许那个婊子是对的——你只是为了这个，不是吗？]");
         outputText("[pg]你紧张地看着奇哈用她自己的脚跟爪子沿着你肉棒的下侧滑动，从龟头到根部缓慢而轻柔地移动[if (hasBalls) {用她爪子的平坦部分轻轻拍打你的阴囊，让你在快感和恐惧中畏缩}]。");
         outputText("[pg]突然，赫尔从你身边的泥土中站起来，她的尾巴危险地燃烧着。[say: 哦，去你的！] 赫尔喊道，跺着脚回到奇哈身边。[say: 你他妈的怎么会知道[he]喜欢什么？你以为你知道？我他妈的做给你看！]");
         outputText("[pg]当奇哈的脚停在你肉棒的根部时，赫尔用她的脚摩擦你的龟头，让你在狂喜中喘息和颤抖，因为她开始用脚操你。奇哈咆哮着，在你的肉棒上快速戳了一下，用她爪子的钩子像半只手一样给你打飞机，而赫尔则用她脚的平坦部分沿着你的肉棒滑动。");
         outputText("[pg]像动物一样互相咆哮，奇哈和赫尔继续用脚操你。现在她们甚至不注意你，而是用一种甚至能让恶魔的意志枯萎的死亡凝视互相盯着对方。你在双脚的攻击下喘息和呻吟，扭动着身体，因为她们恶毒地让你越来越接近高潮。");
         outputText("[pg]当赫尔和奇哈强暴你时，你向后仰起头，发出无声的叫喊，皱着眉头，嘟囔着咒骂，等着看谁的足交能最快让你达到高潮——这是火热的鳞片女孩之间性技巧的一种测试。在这种压力下你坚持不了多久了，你拼命地把臀部顶向她们的脚。但她们拒绝放松，所以伴随着一声发自灵魂的呻吟，你射了。你颤抖着扭动身体，一股白热的精液从你的老二里射出，涂满了赫尔的脚底。她高兴地喘息着，但她狂喜的反应让你的老二挣脱出来，把另一股精液直接射到奇哈的大腿上，把她松弛的小穴附近深红色的鳞片染成了白色。龙女得意地笑着，但你的老二又跑了，把最后一股精液直接射到赫尔紧绷的屁股上，留下一缕精液顺着她的屁股蛋流下来。");
         outputText("[pg][say: 看到了吗？] 奇哈大喊着，抓住你留在她大腿上的污渍，[say: " + get_player().get_short() + "显然更喜欢我——[he]把[his]精液直接射在我的小穴旁边。[He]甚至可能想让我怀孕，不是吗，[name]？]");
         outputText("[pg][say: 哦，是这样吗？] 赫尔笑着，用力摇晃她丰满的臀部，足以甩掉你的精液，直接打在奇哈的脸上。[say: [name]把精液直接射在我的屁股蛋上——[he]给了我最后也是最脏的一发。你得到了什么？哦，对了，射在小穴上。多么独特！]");
         outputText("[pg][say: 你到底懂什么，荡妇？] 奇哈咆哮着，直接在赫尔脸上喷火。火蜥蜴只是愤愤不平地挥手驱散。");
         outputText("[pg][say: 嘿，嘿，龙婊子。你的[i: 脸上]有点东西！] 她喊道，甩动尾巴，直接打在奇哈的脸颊上。龙女退缩了，捂住她现在被打得通红的脸颊，然后猛烈反击，一拳打在赫尔的奶子上。");
         outputText("[pg]好吧，去他妈的，你心里想着，试图在两个火爆女孩开始全力互殴时抓起你破烂的衣服。你拿起你的东西，试图在重新穿衣时跌跌撞撞地离开火线，看着两个女孩互相把对方摔进泥里，开始把对方打得屁滚尿流。");
         outputText("[pg]当你终于穿好衣服准备好时，你尽你所能大喊[say: 停手！]，希望能盖过她们湿漉漉的摔跤声和飞舞的拳头声。过了一会儿，女孩们终于停止了战斗，滚到泥里坐下。");
         outputText("[pg]你拼了老命也分不清她们谁是谁——奇哈的翅膀和角在厚厚的半干泥浆下隐形了，而赫尔更丰满的资本则隐藏在两对坐着的屁股和交叉的双臂下。");
         outputText("[pg][say: 好吧！]其中一个喊道。你第一次注意到她们的声音该死的相似。[say: 告诉那个婊子你更喜欢我，也许她就能明白重点了！]");
         outputText("[pg][say: 更喜欢她！哈！拜托，[name]，你我都知道你更喜欢我。而且我给的足交最棒。]");
         outputText("[pg]好吧，该死。这可不妙。你分不清这两个女孩，现在她们又在问你更喜欢谁。你重重地叹了口气，尽可能平静地试图解释你两个都喜欢。");
         outputText("[pg][say: 什么！？]她们异口同声地喊道，然后转过身愤怒地瞪着对方。[say: 你——你不能也喜欢她！]她们再次异口同声地说。");
         outputText("[pg]是的，你他妈的当然可以！");
         outputText("[pg]令人高兴的是，奇哈终于擦掉了她黑脸上的泥，瞪着赫尔，赫尔也迅速做了同样的事。龙女愤愤不平地哼了一声。[say: 我想如果[name]觉得你没问题的话……]");
         outputText("[pg][say: 是啊，是啊，]赫尔翻了个白眼说。[say: 而且你的足交确实很棒。]");
         outputText("[pg][say: 是的。是的，我确实这么觉得。]");
         outputText("[pg]赫尔对傲慢的龙女怒目而视……然后她们俩同时大笑起来。你试图板着脸，但很快你也跟着她们笑了起来。");
         outputText("[pg][say: 好吧，]奇哈说道，露出了一个自大的笑容。[say: 如果[name]能忍受你，那我想……我想我的沼泽欢迎你。]");
         outputText("[pg][say: 还有嘿……如果你去平原的话……]");
         outputText("[pg][say: 没门，婊子！]奇哈大笑着喊道，然后冲向空中，身后洒落着泥土和壤土。");
         outputText("[pg][say: 反正去你的！]赫尔在她身后喊道，紧握着拳头。");
         outputText("[pg]我们差点就度过了一个美好的时刻。你叹了口气，擦掉赫尔脸上的泥巴，给了她一个小小的吻，然后回营地去了。");
         outputText("[pg]你的[armorName]一路上都在湿漉漉地嘎吱作响，里面装满了你的精液。");
         get_player().orgasm("Generic");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function letTheSpidersHaveTheirWayWithKiha() : void
      {
         clearOutput();
         kihaSprite(true);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,421,-1);
         outputText("你什么也没说，没有提醒这个野蛮的龙女她即将面临的厄运。直到一个蛛化精灵走到她身后，奇哈似乎才意识到有些不对劲，但那时已经太晚了。蛛化精灵抓住她拿武器的手臂把她提了起来，把一团湿漉漉的蛛网拍进她的嘴里，只抓住了惊讶的奇哈片刻，就把她扔给了暴徒，暴徒们在沉闷的尖叫声和勃起的阴茎的狂热中扑向了她。[pg]");
         outputText("[say: 谢谢你，陌生人，]蛛化精灵说道，出人意料地热情。[say: 这个婊子一段时间以来一直是沼泽居民的眼中钉。我们会给她一个她不会很快忘记的教训。][pg]");
         outputText("还没等你回答，蛛化精灵已经抓住了她自己的阴茎，挤进了现在包围着奇哈的性欲漩涡中。你笑了笑，收拾好你的东西，上路了。也许这能教训一下这个试图惹你的婊子。");
         get_combat().cleanupAfterCombat();
      }
      
      public function leaveKihaToSpoidahHorde() : void
      {
         clearOutput();
         kihaSprite(true);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,421,-1);
         outputText("去他妈的奇哈，去他妈的沼泽，去他妈的这一切。你抓起你的东西，就在蜘蛛们逼近龙女的时候拔腿就跑。你回头只看到一群蜘蛛男孩和蛛化精灵抓着他们的肉棒，蜂拥而上，准备对奇哈进行一场传统的老式轮奸。你吹着欢快的口哨，漫步走回营地，听着奇哈被捂住的尖叫声和哀求声飘过树梢，这声音真是令人满足。");
         outputText("[pg]活该，这婊子。");
         get_combat().cleanupAfterCombat();
      }
      
      public function leaveKihaAfterCorruptionBitch() : void
      {
         clearOutput();
         outputText("你垂下肩膀，决定不冒冲突的风险。当你从龙女身边退开时，她放下了斧头，悲伤地低下了头。看来这让她和你一样痛苦，但是……你还是回到了营地。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function kiss() : void
      {
         clearOutput();
         outputText("当你[walk]向奇哈时，她歪着头看着你，问道：[say: 你想要什么，小笨蛋——]你把嘴唇贴在她的嘴唇上，用一个快速的吻打断了她不耐烦的询问。");
         outputText("[pg]龙女睁大了眼睛，突然从你身边退开。[say: 你-你为什么……？]你表达了你只是想吻她，仅此而已。她的脸颊现在红扑扑的，大声咽了口唾沫，避开了你的视线。女孩嘟囔着：[say: 我不介意，但这只是因为你似乎想这样。]抓住奇哈的手让她惊讶地微微跳了一下，然后回望着你的眼睛。你再次轻轻地把嘴唇贴在她的嘴唇上，十指紧扣握住她的手。充满爱意地，你的[tongue]侵入她火热的口腔，与这个龙族女孩的舌头摩擦。她笨拙地配合着你的动作，她的舌头试图在你的舌头周围舞动。");
         outputText("[pg]你们俩分享的甜蜜舌吻似乎持续了永恒，一种令人愉悦的温暖蔓延到你的全身。然而，你遗憾地意识到你不能永远亲吻你的爱人，于是依依不舍地从她柔软的嘴唇上移开。即使在温柔的交流停止后，奇哈的嘴仍然保持着亲吻的形状。她梦幻般地盯着你，当她意识到你们俩不再唇齿相依时，她的眼睛睁大了。这个像龙一样的女孩急忙喊道：[say: 你亲完了？你至少可以提前说一声！]尽管她带着恼怒的目光和语气，但她还是紧紧地抱住你，让她丰满的胸部紧紧地贴着你。");
         outputText("[pg]奇哈喃喃自语：[say: 我爱你……小笨蛋。]她从拥抱中松开你，让你离开继续你的冒险。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function kihasFirstClutch() : void
      {
         var _g:KihaFollowerScene;
         clearOutput();
         outputText("当你走近奇哈声称属于她的那部分营地时，你听到了微弱的呻吟声和不淑女的咒骂声。担心奇哈可能受伤，你加快了脚步，但当你找到她时，就你所见，这个龙女似乎并没有受伤。然而，她正小心翼翼地捧着明显肿胀的肚子；也许她是因为吃得太多而胃痛。你大声呼唤她，问她是否还好。");
         outputText("[pg]龙女一脸困惑地看着你。[say:是的，我很好；你为什么这么问？]");
         outputText("[pg]你告诉她你听到了她的抱怨；你只是担心可能是什么重要的事情。毕竟，看起来她唯一的问题就是吃得太多了，但如果你不确保她没事，你算什么[boyfriend]呢？");
         outputText("[pg][say:" + get_player().mf("男-男朋友","女-女朋友") + "？]奇哈重复道，脸颊上泛起淡淡的红晕。然后你说的其他话才被她听进去，她看起来被冒犯了。[say:你什么意思，吃得太多？]她厉声说道。");
         outputText("[pg]你只是指了指她的肚子，她看了看，然后对你怒目而视。[say:告诉你吧，这跟食物没关系。这是女人的问题。]看到你的表情，她叹了口气。[say:我告诉过你我以前不是这样的，对吧？是恶魔把我变成了现在这个样子？]当你点头时，她继续说道。[say:嗯，我以前是一个蜥蜴人——一" + (get_noFur() ? "个蜥蜴女孩" : "个拟人化的蜥蜴") + "。当他们把我变成这个东西时，他们改变了我很多，但他们没有改变某个方面。]她拍了拍肿胀的腹部以示强调。[say:不像哺乳动物，我们蜥蜴人不会有那种讨厌的每月流血的事情。相反，到了时候，我们的肚子里会形成卵；没有发生性行为，它们第二天就会出来，然后就结束了。我们找人操我们，然后，嗯……]");
         outputText("[pg]你告诉她你明白了。那么，这种事多久发生一次呢？");
         outputText("[pg]奇哈耸耸肩。[say:正常的蜥蜴人每个月只需要忍受一次。因为恶魔，我每个月得受两次这种罪。]");
         outputText("[pg]你给了这个脾气暴躁的龙女尽可能多的同情，只要她能忍受。出于好奇，你接着问她打算怎么处理她现在怀着的卵。");
         outputText("[pg]听到这个问题，奇哈突然显得很紧张，双脚不安地交替站立，揉着手臂。[say:我——啊，我不会说我想当妈妈什么的，但是，如果你想帮我的卵受精，我想我愿意让你……]她迅速转移了话题。[say:你有什么事吗？]");
         outputText("[pg]<b>奇哈在某些日子里会怀孕。</b>");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2199,1);
         _g = this;
         doNext(function():void
         {
            _g.warmLoverKihaIntro();
         });
      }
      
      public function kihaXSalamander() : void
      {
         clearOutput();
         kihaSprite();
         outputText("你前往阴暗的沼泽。路很难走，树木间垂下的粗藤和蛛网阻碍了你的前进。尽管——或者也许正是因为——你走得很慢，但你很惊讶将近一个小时过去了，你都没有遇到任何值得注意的事情。到现在为止，你本以为会找到一点有用的丝，或者一个蜘蛛娘，或者任何东西。");
         outputText("[pg]突然，你安静的跋涉被从天而降的龙女奇哈打断了，她以震天动地的力量砸在地上，停下来时，泥土和苔藓四处飞溅。");
         outputText("[pg]她站起身，重重地倚在她的巨斧上。[say: 哎呀，哎呀，]她冷笑着，嘴角挂着一丝浅笑。[say: 来看我吗，[name]？真体贴。]");
         outputText("[pg]你试图解释你只是在探索，但你半句话还没说完，奇哈就挥起斧头摆出了战斗姿势。[say: 去他妈的，]龙女咆哮道。[say: 我现在有心情打一架，所以来吧，[name]！放马过来！]");
         outputText("[pg]你迅速准备战斗，拿起你的[weaponName]准备迎接不可避免的攻击，你刚做好准备，奇哈就向你扑来，疯狂地挥舞着她的巨斧。你勉强挡开了一击，接着又是一击，被龙女无情的攻击逼得连连后退。");
         outputText("[pg]她用如雨点般的斧击将你逼退，似乎完全不顾及你的安危，你只能勉强躲避来自四面八方的劈砍。随着她继续攻击，她开始放肆地大笑，笑声中甚至带着几分残忍，因为她离砍下你的脑袋越来越近了。");
         outputText("[pg]突然，你的背撞上了一棵树，你知道自己无路可退了——你正担心为了自保不得不伤害这只杀气腾腾的母龙时，你瞥见一个被阴影笼罩的黑影在奇哈身后移动，高举着一把弯刀。");
         outputText("[pg]你考虑过警告这只母龙，但太迟了！那个神秘的身影从灌木丛中跃出，用肩膀猛撞奇哈，把她从你身上撞飞，摔进了泥潭里。你还没来得及对你的新朋友说一句话，她就抓住你的后颈，把你扔到她身后的地上，挡在了你和奇哈之间。");
         outputText("[pg]你可以就躺在那儿，但你不确定自己能否同时对付两个强大的战士——最起码，你可能会被压制。你也可以试着在她们对你下手之前先发制人……或者，你觉得你可以趁机赶紧溜之大吉。");
         menu();
         addButton(0,"躺平",lieThere);
         addButton(1,"先发制人",jumpDaBitches);
         addButton(2,"GTFO",GTFO);
      }
      
      public function kihaUnbitchesUncorruptedFolks() : void
      {
         clearOutput();
         kihaSprite();
         outputText("你回到了奇哈的领地，现在你对自己的理智和稳定的状态更有信心了。你漫步到龙女称之为家的小岛上，呼唤着她的名字。");
         outputText("[pg]片刻之后，奇哈从天而降，高举着她的斧头。[say: [name]！]她咆哮着，摆出战斗姿态。[say: 我、我告诉过你待在……离……离我远点！]当她难以置信地盯着你时，她的叫喊变成了呜咽。[say: 你……你又变了。我、我不敢相信。你的腐化，它……正在消退。怎么做到的！？]");
         outputText("[pg]你走近龙女，推开她的斧头，解释你是如何清除自己的腐化的——她和其他人也可以这样做。当你说话时，奇哈的眼睛睁得大大的，水汪汪的，但就在你结束演讲时，龙女把她的斧头扔到一边，跳进你的怀里，把你拉进一个紧紧的、温暖的拥抱。[say: 你、你这个白痴，]她低语着，在你身上蹭来蹭去。[say: 我们已经走了这么远，而且……而且你千万别再那样做了，笨蛋。听见了吗？我不……我不想再失去我的白痴了……]");
         outputText("[pg]哦，奇哈。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,423,2);
         if(!followerKiha())
         {
            kihaFriendlyGreeting(false);
         }
         else
         {
            outputText("你们手挽手回到了营地。");
            doNext(get_camp().returnToCampUseOneHour);
         }
      }
      
      public function kihaTribbing() : void
      {
         clearOutput();
         kihaSprite();
         outputText("你迅速上前，在你那龙族情人的火热双唇上印下深深的一吻。这位充满爱意的龙女拥抱了你，将你拉近，紧紧相拥。你用双臂环住她，双手却向下移动，按在她那手感极佳的屁股上。你用力捏了捏，结束了亲吻，问她想不想找点乐子。她红着脸点了点头，你便后退一步，脱得一丝不挂。你把[armor]扔到地上，一边诱惑地扭动着[hips]一边走向奇哈。当她进入你手臂的触及范围时，你抓住她那柔软的巧克力色乳房，用力揉捏。你继续揉捏着她的乳房，将她向后推，直到她倒在地上，仰面躺着。");
         outputText("[pg][say: 你、你在干什么，[name]？]你对她露出诱惑的坏笑，俯下身子跨坐在奇哈的腰上，身体前倾，轻轻揉捏着她的乳房。你告诉这位脸红的龙女，你想看看她那惊人的体温贴着你是什么感觉。你将流着淫液的[vagina]在她身上摩擦，把臀部向后推入她张开的双腿之间，开始抽插。当你缓慢地向前挺进时，你感受到了她那滚烫的女性体液，很快你就找到了目标。你的[clit]探了出来，与她的阴蒂摩擦着，你慢慢地摩擦着它，同时低下头亲吻你的情人。她热情地回应着你的吻，抓住你的胸部，捏住你的[nipples]。");
         outputText("[pg]她结束了亲吻，看着你的眼睛。[say: 还要，再给我多一点。]为了满足这只可爱龙女的渴望，你向后滑动，再次向前挺进，直到你们的阴蒂再次相遇。");
         outputText("[pg]你很快找到了节奏，在做爱中施加了更多的压力，让你们的外阴紧紧贴在一起，你的[clit]一次又一次地在她那滚烫的快乐按钮上摩擦。随着你们的女性润滑液在生殖器之间那灼热的温度中混合，你能够更轻松地在她身上来回摩擦，速度越来越快，你们的阴户都因为强烈的性唤起而变得湿滑闪亮。每次你压在她那滚烫的按钮上时，都会发出短暂的欢愉喘息，你一边喘着粗气，一边俯下身再次热情地亲吻她，带着无法控制的快感抚摸和揉捏着她的乳房。当高潮来临时，你的身体颤抖痉挛，一波波的快感传遍全身，一股淫液从你的双腿间涌出，流到了你的情人身上。你把[tongue]深深地探入她的口中，尽可能快而猛烈地将你那跳动的阴蒂在她湿滑的生殖器上摩擦了一次又一次，直到你感觉到她的双腿紧紧地缠住了你的腿。你知道她的高潮就要来了，于是你改变了节奏，变成了短促而快速的抽插，专门针对她的阴蒂，没过多久，她就在你的亲吻中大声呻吟起来，在强烈的快感洪流中左右甩动着尾巴。");
         outputText("[pg]你逐渐放慢速度，直到感觉到她的身体开始放松，最终完全停了下来，趴在奇哈温暖的巧克力色身体上。你结束了亲吻，把头埋在她那巨大柔软的乳房之间，在她身上放松下来。她用长满鳞片的双臂环抱着你，用翅膀包裹着你的身体，慵懒地把你抱在怀里。");
         outputText("[pg][say: 还不错，[name]。]你用一根手指点了点她的鼻子，问她对你的表现就只有这点赞美吗。[say: 好吧好吧。也、也许是相当不错。或者说非常棒。]你再次把头依偎在你那害羞的情人身上，告诉她这还差不多。");
         outputText("[pg]依偎了一会儿后，你告诉奇哈你该再次出发了。你在她的脸颊上飞快地亲了一下，告诉她你很快就会回来。你穿好衣服，再次出发了。");
         get_player().orgasm("Vaginal");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function kihaTrainsHerKids() : void
      {
         var _loc1_:Array = [];
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2195) > 0)
         {
            _loc1_.push("male");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2196) > 0)
         {
            _loc1_.push("female");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2197) > 0)
         {
            _loc1_.push("herms");
         }
         var _loc2_:Array = _loc1_;
         var _loc3_:String = _loc2_[Utils.rand(int(_loc2_.length))];
         outputText("[pg]奇哈正在教她最新一批孩子她的战斗技巧。你看着其中一个年轻的龙人终于对着粗制滥造的假人喷出了" + (_loc3_ == "male" ? "他" : "她") + "的火焰吐息！那个龙人走到你面前说道，[say: 嗨，" + get_player().mf("爸爸","妈妈-爸爸") + "！我妈妈一直在教我怎么像龙一样战斗！你看到我对着假人喷火了吗？]你告诉" + (_loc3_ == "male" ? "他" : "她") + "你确实看到了这场表演，并且觉得非常精彩。你给了" + (_loc3_ == "male" ? "他" : "她") + "一个拥抱，明确地表达了你作为父母的关爱。");
         outputText("[pg]奇哈向你走来。[say: 我教了他们怎么使用我从牛头人那里缴获的大斧头。我还教了他们怎么喷火，]奇哈轻笑着说，[say: 谢谢你卷入这个烂摊子，我的小笨蛋！]年轻的龙人一脸困惑。奇哈看着龙人说道，[say: 这是我对伴侣的称呼。其他时候，我叫[him]“白痴”。]你轻笑一声，让龙人们继续训练。");
      }
      
      public function kihaTellsChildrenStory() : void
      {
         var _loc1_:int = 2198;
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,_loc1_,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,_loc1_) - 1);
         clearOutput();
         outputText("奇哈走到你身边说，[say:你能和我坐在一起吗，[name]？我想给我的" + (totalKihaChildren() == 1 ? "孩子" : "孩子们") + "讲个故事，]她说。你告诉她这是个好主意！奇哈护送你到她的巢穴。");
         outputText("[pg]你坐在粗糙的座位上，奇哈则坐在另一个座位上。");
         if(totalKihaChildren() == 1)
         {
            outputText("奇哈示意她唯一的孩子坐在她的腿上。");
         }
         else
         {
            outputText("奇哈示意她的孩子们坐在她面前，确保他们能看到你。");
         }
         outputText("[pg]奇哈说道，[say: 我来给你们讲讲我过去的故事。]你静静听着。奇哈讲述了她的过去，她原本是个蜥蜴人，如何成千上万地屠杀部落的敌人，如何因为恶魔的绑架而变成了龙人，以及她对恶魔的仇恨是如何滋生的。她非常小心，不去说那些不合适的话。");
         outputText("[pg]奇哈的孩子们似乎被深深吸引了，追问接下来发生了什么。");
         outputText("[pg]奇哈继续她的故事。她讲述了她第一次遇见你的情景，以及在你的帮助下，她是如何从一群蜘蛛人的围攻中保护自己的。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1272) > 0)
         {
            outputText("[pg]你讲述了你是如何击败莉希丝并终结恶魔威胁的。奇哈和她年幼的" + (totalKihaChildren() == 1 ? "龙人孩子" : "龙人孩子们") + "看着你，对你的胜利感到惊叹。");
         }
         else
         {
            outputText("[pg]奇哈讲述了她计划如何潜入莉希丝的要塞，并一劳永逸地击败莉希丝。");
         }
         outputText("[pg]" + (totalKihaChildren() == 1 ? "孩子" : "孩子们") + "很高兴听到这个故事。[say: 谢谢你陪着我，听我讲故事，我的小笨蛋，]奇哈说着，在你的脸颊上啄了一下。");
         dynStats(DynStat.Lib(-2),DynStat.Cor(-2),DynStat.Lust(-50),DynStat.NoScale);
         menu();
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function kihaSprite(param1:Boolean = false) : void
      {
         if(!pregnancy.get_isPregnant())
         {
            if(param1)
            {
               spriteSelect(SpriteDb.get_s_kiha_nude());
            }
            else
            {
               spriteSelect(SpriteDb.get_s_kiha());
            }
         }
         else if(param1)
         {
            spriteSelect(SpriteDb.get_s_kiha_nude_preg());
         }
         else
         {
            spriteSelect(SpriteDb.get_s_kiha_preg());
         }
      }
      
      public function kihaSpiderEventIntro() : void
      {
         clearOutput();
         get_images().showImage("kiha-spider-event");
         kihaSprite();
         outputText("你向沼泽深处走去，很快就发现自己半身浸没在散发着恶臭的泥沼中。四周环绕着高大、长满藤蔓的树木，许多树上还挂着厚厚的蛛网。你在沼泽中徘徊了仿佛一个世纪，终于偶然发现了一个小岛，这很可能就是沼泽的中心。此时，你差点就想说去他妈的然后回家了，但是……来都来了，去看看又何妨？[pg]");
         outputText("你拖着疲惫的身躯爬上小岛的岸边，快速环顾四周。这座小岛完全与周围的沼泽隔绝，四面都被你刚才涉水而过的浑浊泥水包围着。岛中央有一小片空地，被岸边的树木环绕。空地中心有一片密集的树丛。令人惊讶的是，这里没有藤蔓和蛛网，与沼泽的大部分地方截然不同。这种不协调感提醒了你，你已经有很长一段时间没有看到任何沼泽生物的踪迹了。空地周围的寂静令人毛骨悚然，有那么一瞬间，你感觉自己正被监视着。[pg]");
         outputText("你警惕地靠近中央的树丛。虽然你曾猜测它们是因为背后的黑暗而显得密集，但你惊讶地发现，这些高大的树木长得如此紧密，以至于它们的树皮形成了一道坚固的圆形墙壁，树冠则形成了一个厚厚的屋顶。你被迫绕着树丛走，找不到其他的入口——即使是树干之间最微小的缝隙也被厚厚的干泥填满了。[pg]");
         outputText("你正好奇地考虑要不要爬上树皮墙，突然听到头顶传来翅膀拍打的声音。你抬头一看，恰好看到龙女奇哈从高处俯冲而下，她的斧头在空中划出一道弧线，直奔你而来！[pg]");
         outputText("你险之又险地躲开了攻击，但肩膀上的皮肤仍能感受到她武器上灼热的金属温度。你翻滚着躲开她的攻击范围，片刻之后，奇哈喷出一股白热的火焰，在你们之间形成了一道燃烧的屏障。[pg]");
         outputText("她愤怒地尖叫道：[say: 我就知道！你真的是莉希丝的间谍，对吧？不然你为什么要一直骚扰我？你到底想干什么！？][pg]");
         outputText("搞什么鬼？");
         if(!get_player().isPureEnough(66))
         {
            outputText("你试图让龙女冷静下来，解释说你不是莉希丝的手下，你第一次告诉她的话是真的——你是来终结恶魔威胁的。但奇哈似乎并不买账……[pg]");
         }
         else
         {
            outputText("你愤怒地盯着她，用一种危险的温柔提醒她，你是来粉碎恶魔的。你的拳头紧握，不出所料，这个反复无常的女人似乎什么都没听进去。[pg]");
         }
         outputText("[say: 放屁！你就是为恶魔工作的！]她咆哮着。[say: 你先是试图让我心软，告诉我不需要战斗，然后突然又潜入我的家。好吧，到此为止了！]她的斧头挥舞着，直指着你。[say: 我以前杀过恶魔女王的特工，如果必须的话，我也会杀了你，[name]！][pg]");
         outputText("龙女冲破了她的火墙，愤怒地尖叫着，挥舞着她致命的斧头！[pg]");
         outputText("你正在和奇哈战斗！");
         startCombat(new Kiha());
         get_monster().createStatusEffect(StatusEffects.spiderfight,0,0,0,0);
      }
      
      public function kihaSexMenu(param1:Boolean = true, param2:Boolean = true) : void
      {
         kihaSprite(true);
         if(param1)
         {
            outputText("[pg]");
         }
         menu();
         if(get_player().hasCockThatFits(94))
         {
            addButton(0,"肛交",savinTheAnalForKiha);
         }
         else
         {
            addButtonDisabled(0,"肛交","这个场景需要你有一根合适的阴茎。");
         }
         if(!followerKiha())
         {
            addButtonDisabled(1,"支配","奇哈现在似乎对阴道交不感兴趣。");
         }
         else if(!get_player().isGenderless())
         {
            addButton(1,"支配",dominateKihasFaceWithStuffAndStuffOrSomethingIDunnoWhyImStillWritingThis);
         }
         else
         {
            addButtonDisabled(1,"支配","这个场景需要你有生殖器。");
         }
         if(!followerKiha())
         {
            addButtonDisabled(2,"阴道交","奇哈现在似乎对阴道交不感兴趣。");
         }
         else if(get_player().hasCockThatFits(67))
         {
            addButton(2,"阴道交",fuckKihasVagInCamp);
         }
         else
         {
            addButtonDisabled(2,"阴道交","这个场景需要你有一根合适的阴茎。");
         }
         if(get_player().biggestCockArea() >= 150)
         {
            addButton(3,"手交",kihaPlaysWithBigassCocksFemDomAhoy);
         }
         else
         {
            addButtonDisabled(3,"手交","这个场景需要你有一根过大的阴茎。");
         }
         if(get_player().hasVagina())
         {
            addButton(4,"女同69",kihaGirlGirlSex);
         }
         else
         {
            addButtonDisabled(4,"女同69","这个场景需要你有阴道。");
         }
         if(followerKiha())
         {
            addButton(5,"指交拥抱",kihaCuddleFinger).disableIf(!get_player().hasVagina(),"这个场景需要你有阴道。");
         }
         if(followerKiha())
         {
            addButton(6,"磨豆腐",kihaTribbing).disableIf(!get_player().hasVagina(),"这个场景需要你有阴道。");
         }
         if(!followerKiha())
         {
            addButtonDisabled(7,"Gro+ 丰胸","奇哈现在似乎对阴道交不感兴趣。");
         }
         else if(get_player().hasItem(get_consumables().GROPLUS))
         {
            addButton(7,"Gro+丰胸",ghostboobiesKiha).hint("你可以试着用Gro+让她的乳房变大一点。" + (get_player().hasPerk(PerkLib.Incorporeality) ? "如果她不同意，那就附身她强行注射！" : "。"));
         }
         else
         {
            addButtonDisabled(7,"Gro+ 丰胸","这个场景需要你有一剂Gro+。");
         }
         if(!followerKiha())
         {
            addButtonDisabled(8,"给男魅魔药剂","奇哈现在似乎对阴道交不感兴趣。");
         }
         else if(get_player().hasItem(get_consumables().INCUBID) || get_player().hasItem(get_consumables().P_DRAFT))
         {
            addButton(8,"给男魅魔药剂",giveKihaIncubusDraft).hint("你可以偷偷给她喝下男魅魔药剂，让她用长出来的鸡巴操你的屁股。");
         }
         else
         {
            addButtonDisabled(8,"给男魅魔药剂","这个场景需要你有一剂男魅魔药剂。");
         }
         if(!followerKiha())
         {
            addButtonDisabled(9,"淫荡抽插","奇哈现在似乎对阴道交不感兴趣。");
         }
         else if(get_player().cockThatFits(200) < 0 || get_player().cockArea(get_player().cockThatFits(200)) < 40)
         {
            addButtonDisabled(9,"淫荡抽插","这个场景需要你有一根粗大但合适的阴茎。");
         }
         else if(get_player().minLust() < 50 && get_player().lib < 80 && !get_player().hasItem(get_consumables().L_DRAFT))
         {
            addButtonDisabled(9,"淫荡抽插","这个场景需要你有永不满足的性欲或一瓶催情剂。");
         }
         else
         {
            addButton(9,"淫荡抽插",boneTheShitOutofKihaHolesWithHorsecock);
         }
         if(!followerKiha())
         {
            addButtonDisabled(10,"触手交","奇哈现在似乎对阴道交不感兴趣。");
         }
         else if(get_player().countCocksOfType(CockTypesEnum.TENTACLE) > 1)
         {
            addButton(10,"触手交",fuckKihaWithATentacle);
         }
         else
         {
            addButtonDisabled(10,"触手交","这个场景需要你至少有两根触手阴茎。");
         }
         var _loc3_:Function = param2 ? get_kihaScene().encounterKiha : get_camp().returnToCampUseOneHour;
         addButton(14,param2 ? "返回" : "离开",_loc3_);
      }
      
      public function kihaReactsToHorseDicking() : void
      {
         clearOutput();
         outputText("当你靠近时，奇哈双臂交叉抱在胸前，她的沉默让你知道她清楚地记得你们上次见面的事情。你在几英尺外停下，交叉双臂，等着看她要做什么。一眨眼的功夫，她就扑到了你身上！不是打你、踢你或咬你，而是抱着你，在你的肩膀上抽泣。她呜咽着，[say: 我……我不是故意让那种事发生的！我没有！我发誓！]");
         outputText("[pg]你把她推开，看着这位泪眼婆娑的母龙的眼睛，问她是什么意思。她回答说，[say: 你不知道？哦……好吧。嗯……恶魔对我们做的事情之一……本来是为了让我们能够控制我们的信息素，以便利用我们的敌人。我们……我们在学会如何使用它之前就逃出来了。我想……我们在做爱的时候我可能用了一点……不知怎么的……不知怎么的，我想我对我们俩都用了。你甚至可能对它产生了某种反应，我不知道。你闻起来他妈的太香了！]");
         outputText("[pg]哇！你再次拥抱她并大笑起来，很高兴在经历了这一切之后她似乎没事了。她皱着眉头，在你的肩膀上打了一拳，力道大得可能会留下淤青。");
         outputText("[pg][say: 笨蛋！我差不多是用精神控制把你变成了一头贪婪的操逼野兽，而你居然还能笑得出来？你个混蛋！]奇哈大喊道。你把她拉回怀里，向她解释说，虽然事情确实有点失控，但感觉真的非常棒。奇哈在你怀里软了下来，低声说，[say: ……比非常棒还要好，笨蛋。]");
         outputText("[pg]你问她是否觉得还能再来一次。她看着你，爬行动物般的眼睛里情绪交战，然后回答道，[say: 也许吧……我真的控制不了。如果我们再那样做……我……可能还会发生。]");
         outputText("[pg]你不确定她看起来是充满希望还是害怕。");
         outputText("[pg]你想和奇哈做点什么吗？");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,429,2);
         warmLoverKihaIntro(false);
      }
      
      public function kihaPregUpdate() : Boolean
      {
         switch(pregnancy.eventTriggered())
         {
            case 1:
               outputText("[pg]奇哈的肚子明显鼓了起来，但并不是特别突出。如果你不知情的话，你会以为她只是最近吃了一顿大餐。你几乎怀疑奇哈的怀孕是否成功了，或者她只是在排出未受精卵时比较慢……[pg]");
               return true;
            case 2:
               outputText("[pg]奇哈的肚子现在明显肿胀了，形成了一个圆形的隆起，让你相当确信她怀孕了。[pg]");
               return true;
            case 3:
               outputText("[pg]奇哈开始遭受喷火打嗝和高腐蚀性呕吐的折磨，这意味着在她的营地部分开始出现许多烧焦和腐蚀的斑块。[pg]");
               return true;
            case 4:
               outputText("[pg]奇哈长大了不少，她曾经平坦的肚子已经圆润到看起来像怀孕六个月了。她甚至连做基本的任务都有困难，但她固执的骄傲阻止了她接受你提供的任何帮助。[pg]");
               return true;
            case 5:
               outputText("[pg]随着怀孕的进展，奇哈的脾气也跟着她的肚子一起增长。她看起来像怀孕八个月了，即使是你家乡最暴躁的男人也会对她如此“娇滴滴”地分享的咒骂感到尴尬。[pg]");
               return true;
            case 6:
               outputText("[pg]你会说奇哈很快就要生了，她已经肿胀到看起来像怀孕九个月了。她开始频繁休息，任何形式的劳动都很容易让她气喘吁吁。尽管如此，她似乎经常消失，当被质问时，她用一种恼怒的语气回答：[say:我没办法，我必须找点吃的。][pg]");
               return true;
            case 7:
               outputText("[pg]看来你之前对奇哈怀孕的印象是错误的。她变得更大了，让你想知道她的子宫里到底有多少个卵？不过你没有太多时间独自思考，因为她要求你帮忙做另一项繁琐的任务。似乎最重要的是，这种依赖伤害了她的骄傲，在愤怒中，她把气撒在了你身上。[pg]");
               return true;
            case 8:
               outputText("[pg]奇哈已经长到几乎无法站立，更不用说走路了，所以她用翅膀漂浮在离地面几英寸的地方。随着怀孕的进展，她变得非常疲惫，祈求神明她的苦难能尽快结束。[pg]");
               return true;
            default:
               return false;
         }
      }
      
      public function kihaPlaysWithBigassCocksFemDomAhoy() : void
      {
         clearOutput();
         get_images().showImage("kiha-follower-sex-bigcock");
         var _loc1_:int = get_player().biggestCockIndex();
         outputText("你调皮地靠近这个火辣的小可爱，把她紧紧抱在怀里，你们的身体融为一体。奇哈");
         if(get_player().get_tallness() >= 84)
         {
            outputText("抬头");
         }
         else if(get_player().get_tallness() <= 60)
         {
            outputText("低头");
         }
         outputText("假装漠不关心地看着你，但她那垂直的瞳孔似乎比平时更湿润了。她温暖柔软的体温渗透着你，唤醒了你的下半身。就像一头沉睡已久的野兽，你的" + get_player().cockDescript(_loc1_) + "从沉睡中苏醒。它在你们的身体之间蜿蜒，轻松地从你的[armor]中挣脱出来，挤过奇哈柔软的乳沟。[cockHead biggest]探出头来，蹭着你长满鳞片的爱人的脸颊，在她脸上那些像雀斑一样的小鳞片上火热地跳动着");
         if(get_player().cocks[_loc1_].cockLength > 48)
         {
            outputText("片刻，然后爬得更高。它很快就挡住了你看着爱人的视线。");
         }
         else
         {
            outputText("片刻，然后变粗并在她身上抽动。");
         }
         outputText("这可真是个显眼的大麻烦。");
         outputText("[pg]奇哈用牙齿咬了它一下，拉扯着你厚厚的包皮以引起你的注意。[say: 有点太心急了吧？你真是没救了，笨蛋。你干了什么，把Gro+当润滑剂用了吗？]她一边把你从[armor]里剥出来一边纳闷。[say: 你知道吗，如果你学不会控制自己，你余生都会被绑在恶魔的操逼机器上。不过，长着这么大一根鸡巴，也许你就是为了这个做准备的。]奇哈叹了口气，[say: 真可悲，]然后用指尖轻柔地抚摸，用爪子像羽毛一样轻轻地抚摸你的[cockHead biggest]。");
         outputText("[pg]你微笑着告诉你那霸道的伴侣，你变成这样全是因为她。因为她那可爱、雕塑般的身躯离你如此之近。她变得通红（好吧，比平时更红了），用手掌拍打你的[cock biggest]。[say: 真……真的……我……弄成了这样？]她结结巴巴地说。你尽可能像个圣人一样点点头，带着一个");
         if(get_player().cocks[_loc1_].cockLength > 48)
         {
            outputText("比");
         }
         else
         {
            outputText("和");
         }
         outputText("你的躯干一样大的勃起。奇哈竟然咯咯地笑了起来，这是你初次见她时绝对想不到她会发出的声音，她调皮地开始给你的[cock biggest]打飞机，当它在她的手中变得稍微更大更硬时，她开心地哼着歌。");
         outputText("[pg]你向后靠在");
         if(followerKiha())
         {
            outputText("石头");
         }
         else
         {
            outputText("树");
         }
         outputText("满意地叹了口气，很高兴让奇哈照顾那头无处不在、垂在你[legs]之间的野兽。你那沉重、敏感的[cock biggest]总是让你难以移动，更糟糕的是，当它勃起时，几乎让你动弹不得。但在这样的时刻，你很高兴你有这么多敏感的鸡巴让奇哈的手去探索");
         if(get_player().cocks[_loc1_].get_cockType() == CockTypesEnum.HUMAN)
         {
            outputText("，特别是你中间的环和敏感的边缘。");
         }
         else if(get_player().cocks[_loc1_].get_cockType() == CockTypesEnum.DEMON)
         {
            outputText("，特别是环绕你阴茎的数百个恶魔结节。");
         }
         else if(get_player().cocks[_loc1_].get_cockType() == CockTypesEnum.ANEMONE)
         {
            outputText("，特别是你冠状沟下那群带有催情效果的触手。");
         }
         else if(get_player().cocks[_loc1_].get_cockType() == CockTypesEnum.TENTACLE)
         {
            outputText("，特别是你触手蘑菇状顶端的下侧。");
         }
         else if(get_player().cocks[_loc1_].get_cockType() == CockTypesEnum.CAT)
         {
            outputText("，特别是覆盖在你猫科动物阴茎上的数百根橡胶状的刺。");
         }
         else if(get_player().hasKnot(_loc1_))
         {
            outputText("，特别是你巨大、鼓胀的[cockanimalityadj " + (_loc1_ + 1) + "]肉结。");
         }
         else
         {
            outputText("。");
         }
         outputText("随着奇哈的动作将你带入越来越高的快感，整个世界似乎都在旋转，当你几乎要从休息的地方滑落时，你抓住了她的臀部来稳住自己。她");
         if(get_player().cocks[_loc1_].cockLength > 48)
         {
            outputText("把你的龟头往下拉，然后");
         }
         outputText("伸出一条异常长、类似爬行动物的舌头。它像蛇一样缠绕着你的顶端，不过它似乎并不想绞杀猎物，而是满足于试图把你的精液挤出来。");
         outputText("[pg]这猛烈的爱意耗尽了你[legs]的力量，让你瘫倒在地上。奇哈跪下来保持她的姿势。她的舌头迅速从你的[cock biggest]上解开，感觉太爽了，甚至有些刺痛，差点让你同时射出来。她亲吻了你顶端湿润的马眼，环顾着你的阴茎，她的嘴唇上沾满了前列腺液，她挑逗道：[say: 这么大、这么有男子气概的" + get_player().mf("male","specimen") + "，然而……这东西让你这么容易被打败。]");
         outputText("[pg]奇哈扭动她的尾巴");
         if(get_player().hasKnot(_loc1_))
         {
            outputText("在你的肉结下方");
         }
         else
         {
            outputText("在你的根部周围");
            if(get_player().hasSheath())
            {
               outputText("，就在包皮上方，");
            }
            else
            {
               outputText("");
            }
         }
         outputText("做成了一个临时的阴茎环。这条滚烫、布满鳞片的尾巴拉扯的力度刚好让你的[cock biggest]变得更硬，但又不会太痛。你因为[balls]里积聚的压力而发出呜咽，这是一种高亢、尖锐的愉悦声。你的龙女用爪尖顺着你尿道的隆起划下，她回答道：[say: 快了，笨蛋……快了。我-我必须……呃……训练你控制这个……这个……东西。也许如果你射得够猛，你就不会像个傻瓜一样输给一些低级的恶魔小蟾蜍了，是吧？]");
         outputText("[pg]你点点头，完全被阴茎上交响乐般的触碰所淹没。奇哈挪得更近了，然后转过身来，一半坐在你的腿上，一半坐在她的尾巴上。她热气腾腾的私处在你的身上摩擦，而她红宝石般的秀发则在你的鼻子上挠痒痒，像波浪一样倾泻在你的[chest]上。这个动作让她的尾巴又在你的[cock biggest]上缠绕了半圈，底部的环拉得更紧了，反过来让你变得更硬。奇哈用双臂环抱住你的阴茎作为支撑，抬起双腿，将她那滚烫、柔软的脚底放在你巨大的尿道隆起两侧。一大滴前列腺液在你的[cockHead biggest]上凝结，但奇哈在它逃脱之前就把它吸了下去。[say: 不能让你带着一身性爱的臭味到处跑，对吧？地精会在你不知不觉中扑向你，而像你这样的白痴可能会用这个……这个……嗯……呃，恶心的东西让她们都怀孕。]");
         outputText("[pg]奇哈十指交叉，开始快速而用力地套弄你。她的脚以同样的节奏在你的[cock biggest]两侧做圆周运动摩擦。她越过肩膀向后靠来吻你，龙女极高的体温让你出汗滴水。太热了……太热了。你能感觉到核心的温度在上升。");
         if(get_player().balls > 0)
         {
            outputText("你的睾丸随着快感的波浪收缩和放松，你");
         }
         else
         {
            outputText("你");
         }
         outputText("你的肉棒感觉快要爆炸了。奇哈被你巨大阴茎的抽动震得有些发抖，她更加激烈地与你法式热吻，然后低语道：[say:来吧，射出来。为我射出来，我的玩具。就让你的肉棒欢愉这一次，为我射出来吧。]奇哈用舌头在你的[cockHead biggest]上打转，将沾满唾液的舌头在你肿胀器官的顶端来回扫动。你大声呻吟着，身体紧绷，感觉到精液开始从你的[balls]中泵出，顺着你那胀满的尿道喷涌而出。");
         outputText("[pg]奇哈评论道：[say:这就对了，真是个好[boy]，]就在这时，第一团精液喷射到了半空中。你紧绷着身体，又向空中喷射出一股精液，而第一股精液已经如雨点般落在了奇哈身上，溅满了她的头发和脸庞");
         if(get_player().cumQ() >= 1000)
         {
            outputText("，你那惊人的射精量简直就是在给她颜射");
         }
         outputText("。有些精液甚至落在了你自己身上，但你正忙着有节奏地紧绷身体，将每一滴浓稠的白色汁液喷射到空中，落在奇哈仍在抽动的脚底上。");
         if(get_player().cumQ() >= 2000)
         {
            outputText("一波又一波的精液如雨点般落在你身上，形成了一滩夸张的水洼，将你们俩完全、彻底地弄得黏糊糊的。");
         }
         outputText("奇哈微微发抖，从眼睛上抹去几缕精液，说道：[say:笨蛋！你把我弄湿了！]");
         outputText("[pg]你带着傻笑瘫倒在地，把沾满精液的龙女也拉进怀里。奇哈恼怒地喷出一口火焰，但还是承认道：[say:你知道吗，如果我那样对你……我倒是不介意你更经常地为我发情。下、下次别弄到我头发上就行了，笨蛋！]她站起身，将尾巴从你慢慢变软的肉棒上解开，伸了个懒腰，迫使你看着她那湿透了的小穴。阴唇泛着微红，因欲望而充血，不过奇哈似乎控制得很好，她迈着轻快的步伐向一条小溪走去。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,252) > 0)
         {
            if(get_player().cor < 50)
            {
               outputText("你希望她不要被你的虎鲨孩子们袭击。");
            }
            else
            {
               outputText("你想知道如果她被你的虎鲨孩子们袭击会发生什么。");
            }
         }
         outputText("[pg]你尽可能地擦拭干净，穿上你的[armor]往回走");
         if(campCorruptJojo())
         {
            if(!get_jojoScene().tentacleJojo())
            {
               outputText("，无视了乔乔在树林里狂热自慰的声音");
            }
            else
            {
               outputText("，无视了乔乔在树林里用他所有的触手疯狂操自己的声音");
            }
         }
         outputText("。");
         if(get_sophieBimbo().bimboSophie())
         {
            outputText("索菲在你回来时向你打招呼，但当她闻到你身上的性爱气味，并意识到你已经被彻底满足时，她似乎有些沮丧。");
         }
         if(get_amilyScene().amilyCorrupt())
         {
            outputText("艾米莉恳求道：[say:下次我能为您服务吗，[master]？]");
         }
         get_player().orgasm("Dick");
         dynStats(DynStat.Sens(-1));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function kihaOffersToMoveIn() : void
      {
         clearOutput();
         kihaSprite();
         outputText("在沼泽中漫步时，你遇到了奇哈，这位经常咄咄逼人的龙女一反常态地平静地向你走来。你们以通常的调情方式互相问候，奇哈尽最大努力保持她的优越感，即使她的目光在你的身体上游移。她走近并撞了你一下，臀部贴着臀部。[say: 想我了吗？]她问道，脸上带着笑容，尽管你能看到……也许是她眼中的担忧。");
         outputText("[pg]你对她紧张的询问微笑并点头。她有时可能真的是个婊子，但你知道，在内心深处，她真的非常喜欢你。奇哈笑容满面，捶了你的肩膀一下，说道，[say: 我就知道，你这个胆小鬼！]");
         outputText("[pg]你同样用力地回敬了她一拳，反驳道：[say: 随便你怎么说，我这次可没靠近你的地盘！到底是谁想谁啊？]");
         outputText("[pg]奇哈将爪子深深陷入潮湿的沼泽地里，绞着双手，陷入了沉思。你满怀期待地等着，直到她意识到你看到了她的窘态。然后，她重重地叹了口气，[say: 好吧，好吧……我想你了，[name]。] 她用尖锐的指尖戳着你的[chest]，总结道：[say: 好了！我说出来了！我想我可能甚至……喜欢你！也许，如果你也有同样的感觉，我们可以……多花点时间在一起？]");
         outputText("[pg]你咧嘴一笑，抱住了她，安抚着这个紧张的龙女，直到她缓过神来，用尾巴出其不意地拍了一下你的屁股。还是那个熟悉的奇哈……");
         outputText("[pg]听起来，如果你开口的话，她似乎很想搬来和你一起住。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,427,1);
         warmLoverKihaIntro(false);
      }
      
      public function kihaKnockUpAttempt() : void
      {
         if(get_camp().followerKiha() && canKihaGetPregnant() && pregnancy.knockUpChance(int(10 - totalKihaChildren() / 5),50))
         {
            if(get_debug())
            {
               outputText("[pg]<b>DEBUG: 奇哈怀孕了。</b>");
            }
            pregnancy.knockUp(25,336);
         }
      }
      
      public function kihaGivesBirth() : void
      {
         var _loc9_:int = 0;
         var _loc10_:* = null as IMap;
         var _loc1_:int = (Utils.rand(5) + 1) * 2;
         _loc1_ += int(get_player().virilityQ() / 10);
         if(_loc1_ > 10)
         {
            _loc1_ = 10;
         }
         outputText("[pg]一声凄厉的嚎叫划破了夜空，把你从睡梦中惊醒。正当你想知道那到底是什么鬼东西时，声音再次回荡，毫无疑问是从奇哈的营地传来的。看来她要生了……");
         outputText("[pg][say:做点什么，笨蛋！]奇哈大喊。你抓住奇哈长着爪子的手，向她保证你会在这里帮助她。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2191) > 0)
         {
            outputText("你脱下她的蛛丝" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2191) == 1 ? "内裤" : "缠腰布") + "，露出她湿润的阴道。");
         }
         outputText("[pg]你舔了舔她的阴道，试图把受精卵哄出来。当你舔她的子宫时，奇哈脸红了，说道：[say:别停下来，[name]！]她的双腿锁住你，似乎想让你继续舔她。");
         outputText("[pg]最终，她高潮了，用她的淫液涂满了你的脸。你陶醉在她女性汁液的味道中。奇哈张开双腿，她的阴道似乎分开了，卵的表面进入了视野。多亏了她通道的湿润，卵终于毫无问题地滑了出来。[say:这只是其中一个卵，白痴！我还有更多要出来！]奇哈宣布。她继续用力，第二个卵出来了。");
         if(_loc1_ > 2)
         {
            outputText("[pg]这个过程不断重复，直到奇哈的肚子终于平坦下来。");
         }
         outputText("[pg]你数了数卵；有" + Utils.num2Text(_loc1_) + "个。");
         outputText("[pg][say:看看那个！它们真漂亮。它们很快就会孵化了。谢谢你，[name]。]奇哈微笑着，在你的嘴唇上印下一吻。");
         outputText("[pg]等等！蛋已经开始摇晃了！才过了几分钟，它们就要孵化了。");
         outputText("[pg]蛋上出现了裂缝，而且越来越大。最终，蛋壳破裂，龙的脑袋从蛋里探了出来。它们不是很可爱吗？你和奇哈花时间剥掉蛋壳，观察这些小龙人。");
         var _loc2_:int = totalKihaChildren();
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:Array = [];
         var _loc7_:int = 0;
         var _loc8_:int = _loc1_;
         while(_loc7_ < _loc8_)
         {
            _loc9_ = _loc7_++;
            if(pregnancy.allowHerm && Utils.rand(3) < 1)
            {
               _loc5_++;
            }
            else if(Utils.rand(2) == 0)
            {
               _loc3_++;
            }
            else
            {
               _loc4_++;
            }
         }
         if(_loc3_ > 0)
         {
            _loc6_.push(Utils.num2Text(_loc3_) + "" + (_loc3_ > 1 ? "个男孩" : "个男孩"));
            _loc10_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc10_,2195,FlagDict_Impl_.arrayReadInt(_loc10_,2195) + _loc3_);
         }
         if(_loc4_ > 0)
         {
            _loc6_.push(Utils.num2Text(_loc4_) + "" + (_loc4_ > 1 ? "个女孩" : "个女孩"));
            _loc10_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc10_,2196,FlagDict_Impl_.arrayReadInt(_loc10_,2196) + _loc4_);
         }
         if(_loc5_ > 0)
         {
            _loc6_.push(Utils.num2Text(_loc5_) + "" + (_loc5_ > 1 ? "个双性人" : "个双性人"));
            _loc10_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc10_,2197,FlagDict_Impl_.arrayReadInt(_loc10_,2197) + _loc5_);
         }
         outputText("[pg]这里有" + Utils.formatStringArray(_loc6_) + "。[say:等他们成年后，我要把他们训练成强大的战士。我现在必须休息了，]奇哈说。新生的龙人们轮流吸吮奇哈乳房里的奶水。");
         if(_loc2_ > 0)
         {
            outputText("[pg]年长的龙族孩子们敬畏地看着新生儿，有些表现出嫉妒和兴奋的迹象。");
         }
      }
      
      public function kihaGirlGirlSex() : void
      {
         clearOutput();
         get_images().showImage("kiha-follower-sex-sixtynine");
         outputText("你把奇哈拉进怀里，问道：[say:想玩点小游戏吗？]她脸红了，简短地微微点了点头。你微笑着，轻柔地捏住奇哈的乳头，用恰到好处的力度揉捏着龙女的双蕾，让它们在你的手中变硬。你来回揉搓着，看着奇哈的表情在恼怒、渴望和毫不掩饰的欲望之间闪烁。当你听到她的爱液滴落在地上的“滴答……滴答……滴答……”声时，你知道她准备好了。");
         outputText("[pg]奇哈站在你面前，背部弓起，向你挺出胸膛，嘴巴微张，小穴肆意地流着水。太完美了！你舔舐着她那圆润乳房的光滑曲线，当你用脸颊蹭上去时，柔软的肌肤给出了恰到好处的反馈。即使奇哈的身体有着超乎寻常的温暖，你也能感觉到她的兴奋让她变得更加火热，并能看到那标志性的红晕在她巧克力色的肌肤上蔓延。你舔舐着她的乳头，然后恋恋不舍地离开她那美味的乳房去脱衣服。你把[armor]扔到一边，向这个爬行类女人袒露你的身体，展现出你因兴奋而泛红的肌肤。");
         outputText("[pg]她那长满鳞片的尾巴突然缠住你的腰，猛地向旁边一拉，把你拽倒在地上。片刻之后，奇哈就骑在了你身上，野蛮地亲吻和啃咬着你的身体——先是你的脖子，然后是锁骨，接着是乳头。在奇哈粗鲁的爱抚下，没有什么是安全的，甚至连你的小穴也不例外。奇哈用指尖顺着你的肚脐往下滑，停在你的小穴上方。你喘息着，感觉到一阵美妙的燥热，一想到要在那里被如此粗暴地爱抚，你就变得越来越湿。");
         if(get_player().wetness() < 4)
         {
            outputText("涓涓细流");
         }
         else
         {
            outputText("小河般的汁液");
         }
         outputText("的润滑液顺着你的[legs]流下，奇哈不断地挑逗你，却总是在似乎终于要触碰到你女性花心的时候缩回手。");
         outputText("[pg]刹那间，龙女翻转身体，用湿透的阴阜捂住你的脸。[say: 舔，]她低吼着，同时用指关节分开你的阴唇。你喘息着回应，无意中吞了一大口龙穴，然后伸出舌头舔舐你爱人美味的私处。奇哈叹了口气，用手掌按摩你的外阴，在把指关节放回里面之前，先摸了摸你敏感的入口。她用拇指弹弄你的[clit]");
         if(get_player().getClitLength() >= 10)
         {
            outputText("，当它长到荒谬的大小时，她喘着粗气。");
         }
         else if(get_player().getClitLength() >= 3)
         {
            outputText("，当它长到像阴茎一样长时，她发出赞赏的哼声。");
         }
         else
         {
            outputText("，当它在她身上变硬时，她高兴地哼着。");
         }
         outputText("[pg][say: 我觉得你这样是没法让地精高潮的，]奇哈嘟囔着，[say: 让我来教教你怎么做。]当她扑向你的胯部时，她的双手移去揉捏你的[butt]。一条长而灵活的舌头消失在你的双腿之间，刺入你的阴道，像男人的阴茎一样彻底地穿透你，但要温柔得多，热得多，也湿得多。你在龙女身下扭动，将你的[hips]摇向她的脸，沉浸在你们交媾的触感、味道和清晰可闻的湿润吧唧声中。");
         outputText("[pg]奇哈嘟囔着，[say: 这样好多了，]然后继续攻击你那被唾液浸湿的甬道。你厌倦了她对你口交技巧的粗鲁嘲讽，于是扭动身体翻滚，将她压在身下。你俯下身，将她那流着淫液的阴户含入嘴里。那颗坚硬的快感珍珠在你的嘴唇上固执地跳动着，你用舌头舔舐着它，倾注着爱意，同时将两根手指插入下方那湿润的缝隙中。奇哈对你阴阜那协调的攻势停顿了一下，然后变成了毫无章法的抚摸。你用力抽插着她的阴户，随着她多汁的穴肉向你用力抽插的手屈服，你又加入了第三根手指。");
         outputText("[pg]龙女的阴蒂在你的嘴里微微肿胀，这是奇哈高潮的阴户释放出大量刺鼻的淫水前你得到的唯一警告。她的舌头在你体内疯狂地搅动，在你的阴道壁上前后猛烈地撞击，带来无意间的快感冲击，让你很难集中注意力去对付你仍在抽插的颤抖的阴户。你最后舔了一下她的阴蒂，然后屈服于快感，将你的[vagina]用力压回奇哈的嘴和鼻子上。你和你的爱人一样猛烈地高潮了，释放出");
         if(get_player().wetness() < 3)
         {
            outputText("涓涓细流");
         }
         else if(get_player().wetness() <= 3)
         {
            outputText("一小股淫水");
         }
         else if(get_player().wetness() <= 4)
         {
            outputText("如注的淫水");
         }
         else
         {
            outputText("爆发");
         }
         outputText("的淫液，弄脏了她的脸。");
         outputText("[pg]你们的嘴互相埋在对方的小穴里，你和你的爱人躺在一起，慵懒地舔舐着芳香的蜜液，而你们的身体则因高潮的余韵而颤抖。奇哈承认道，[say:好吧，你——舔——在这方面——舔——还不错。]你拍了拍她的臀部，抚摸着她快乐摇摆的尾巴，然后向她道谢。");
         get_player().orgasm("Vaginal");
         dynStats(DynStat.Sens(-1));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function kihaFriendlyGreeting(param1:Boolean = true) : void
      {
         var _loc2_:* = null as IMap;
         if(param1)
         {
            clearOutput();
         }
         kihaSprite();
         if(param1 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,421) == 1 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,344) >= 7)
         {
            kihaAdmitsSheLikesYourWang();
            return;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,421) == 2)
         {
            warmLoverKihaIntro(param1);
            return;
         }
         if(param1 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,344) == 6 && get_player().isPureEnough(50))
         {
            outputText("当你在沼泽中漫步时，你最终来到了你的朋友奇哈熟悉的领地。回想起上次你们交谈时她匆忙离去的情景，一阵担忧涌上心头。她提到要把战斗带给恶魔……她肯定没有这么做，对吧？一想到这里，你皱起眉头，加快步伐，向她的小岛走去。");
            outputText("[pg]起初让你松了一口气的是，你发现奇哈坐在她沼泽地的家外面，低着头，双手抱头。但当你走近时，你注意到她的头发被弄乱了，有些地方被撕裂了，而且她身上布满了小伤口和瘀伤。令你惊恐的是，你可以看到她大腿和一直湿润的胯部有深白色的污渍，或者涂抹在她赤裸的大乳房之间。你只能想象在你不在的时候她发生了什么。");
            outputText("[pg][say: 奇哈……你还好吗？]");
            outputText("[pg]她火红的眼睛抬头看了你一眼，但她既没有动也没有回应。你一言不发地坐在她身边，用一只手臂搂住龙女的肩膀。令你惊讶的是，她没有推开你。事实上，你感觉到她在你的触碰下微微颤抖。");
            outputText("[pg][say: 我、我搞砸了，好吗？] 在漫长的沉默之后，她终于开口了，抬起头看着你的眼睛。[say: 那……那就是你来这里想听的，不是吗？你想听我亲口说出来，不是吗！？好吧，好吧：你是对的，我错了。我不能就这么去踢开莉希丝的门。我、我甚至无法靠近。] 你试图安慰她，但奇哈只是猛地转过脸去，拒绝让你看到她发出一声可能是咆哮……或者是抽泣的声音。");
            outputText("[pg][say: 也许你是对的……也许我们赢不了。毕竟……莉希丝已经赢了。]");
            outputText("[pg]你的一部分想扇她一巴掌，猛烈地摇晃她，告诉她不，她错了。相反，你紧紧地抱住她，抬头看着天空。龙女的小岛对开阔的天空有清晰的视线，是空中掠食者起飞和降落的完美地点。但从这里，你可以清楚地看到天空中的");
            if(get_game().time.hours < 20)
            {
               outputText("云朵");
            }
            else
            {
               outputText("星星");
            }
            outputText("。你指着它们，告诉奇哈看。龙女按照你的要求做了，顺着你手指的方向看向天空。但过了一会儿，她哼了一声，皱着眉头看着你。");
            outputText("[pg][say: 我到底应该看什么？那只是天空。那又怎样？]");
            outputText("[pg]该死的奇哈。");
            outputText("[pg]你摇摇头，试图解释为什么");
            if(get_game().time.hours < 20)
            {
               outputText("云朵");
            }
            else
            {
               outputText("星星");
            }
            outputText("是美丽的。你花了几分钟指着天空中一些形状和图案，这里是一个拿着盾牌的战士，那里是一个骄傲的人马——你甚至发现了一条龙。奇哈漫不经心地听着，当你试图向她展示世界上仅存的、不可改变的美丽事物之一时，她翻了个白眼。你说，即使是恶魔也无法摧毁天空。");
            outputText("[pg][say: 呸！你看着吧，[name]。那个婊子女王可不是闲坐着；她不会休息，直到整个世界都被毁灭！恶魔们已经毁了四季，造成了无尽的干旱。谁说她们不能向天空射出一根巨大的肉棒，或者让它永远下着腐化的精液雨，直到我们都变成流着口水的怪物？有什么能阻止她们，嗯？]");
            outputText("[pg]你就是。她也是。你们所有人——任何没有屈服于腐化的人。任何有意志和力量反击的人。你告诉她你在旅途中遇到的每一个人，那些仍然抵抗莉希丝大军的少数坚定的灵魂。");
            outputText("[pg][say: 那为什么……为什么我们没有采取行动，[name]？为什么我们不能就这么……一起去？]");
            outputText("[pg]因为你还没有准备好。她也没有。但总有一天——很快——你会准备好的。");
            outputText("[pg]令你惊讶的是，奇哈也用一只手臂搂住了你的腰，第一次回应了你的感情。你笑了，抚摸着她的脸颊，当龙女把头靠在你的肩膀上时，你感到很高兴。");
            _loc2_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc2_,344,FlagDict_Impl_.arrayReadInt(_loc2_,344) + 1);
            dynStats(DynStat.Cor(-1));
            doNext(get_camp().returnToCampUseOneHour);
            return;
         }
         if(param1)
         {
            outputText("决定去拜访这位漂亮的龙女，你走进沼泽，来到奇哈称之为家的岛屿树林。令你高兴的是，奇哈似乎在泥泞上移了一根倒下的树干，在岸边和她岛屿的海岸之间建起了一座桥。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,424) == 1)
            {
               outputText("虽然当你走过去时，你可以看到几个蜘蛛人在看着你，但你上次给她们的教训似乎暂时让她们保持了距离。");
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,424,0);
            }
            outputText("你走到树环前，呼唤龙女。");
            outputText("[pg]片刻之后，她从树顶爆发出来，落在你面前，力量大得足以让地面震动。她站着，准备好火红的巨斧，但当她认出你时，她明显放松了。");
            outputText("[pg][say: 哦，呃，嘿，[name]，] 她靠在巨斧上说。[say: 很高兴……再次见到你，我想。你，呃，想要什么吗？]");
         }
         menu();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,344) < 6)
         {
            addButton(0,"交谈",talkToFriendlyKiha).hint("和奇哈交谈。她可能不喜欢，但你可能会取得一些进展。");
         }
         addButton(1,"切磋",sparWithKiha).hint("和奇哈来一场快速战斗！");
         addButton(2,"拥抱",hugFriendWarmKiha).hint("给这只母龙一个拥抱。");
         setExitButton();
      }
      
      public function kihaDrakeHeart() : void
      {
         var _g:KihaFollowerScene;
         clearOutput();
         outputText("你用[hands]握住那朵散发着香草气味的鲜艳花朵，把它递给你的爱人。");
         outputText("[pg]奇哈起初显得很震惊，明显脸红了。[say: 你-你在干什么，笨蛋？]");
         outputText("[pg]" + (get_game().emberScene.saveContent.flowerExplained ? "龙心花是送给你想追求的龙的礼物，至少你是这么听说的" : "这是一朵美丽而甜美的花，是送给美丽而甜美的龙的合适礼物") + "，毕竟奇哈<i>是</i>你的爱人。当你继续解释这个理由时，她的脸更红了。");
         outputText("[pg][say: " + (get_game().emberScene.saveContent.flowerExplained ? "我不是一条<b>真正的</b>龙，你知道的！" : "你不需要给我送礼物，我不需要被讨好，") + "]她慌乱地说。当然，你明白这一点，如果她不想要也没什么大不了的。[say: 我-我没那么说！]这位火爆的女人惊呼道，从你的[hands]中抢过花。[say: 你真是个笨蛋……谢谢你。]");
         outputText("[pg]奇哈无法掩饰，对着这份充满异国情调的礼物露出了微笑。她不想承认收到你的礼物有多兴奋，但你得是个瞎子才看不出来。");
         outputText("[pg]突然，出乎你的意料，她拥抱了你。[say: 我爱你，[name]。]奇哈将嘴唇贴在你的嘴唇上，热情地表达着她的爱意。[say: 但不是因为这个礼物我才这么说的。]");
         outputText("[pg]你回抱住她，回应着她的浪漫情意。");
         get_player().consumeItem(get_consumables().DRAKHRT);
         saveContent.flowerGifted = true;
         _g = this;
         doNext(function():void
         {
            _g.warmLoverKihaIntro();
         });
      }
      
      public function kihaDestroyGladesToggle() : void
      {
         var _g:KihaFollowerScene;
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2225) == 0)
         {
            outputText("你问奇哈是否愿意用她的火焰吐息来净化森林中那些污秽的林地。毕竟，森林是可以被净化的。");
            outputText("[pg][say:我会的，我的笨蛋，]奇哈说。她咧嘴一笑，呼出一团火焰以示强调。");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2225,1);
         }
         else
         {
            outputText("你告诉奇哈她不必摧毁森林里那些污秽的林地。");
            outputText("[pg][say:如果你坚持的话，我的笨蛋。不过它们还会回来的。如果你想让我烧掉那些林地，尽管开口，]奇哈说。");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2225,0);
         }
         _g = this;
         doNext(function():void
         {
            _g.warmLoverKihaIntro();
         });
      }
      
      public function kihaCuddleFinger() : void
      {
         clearOutput();
         kihaSprite();
         outputText("你将你的龙人爱人拥入怀中，歪着头在她火热的嘴唇上印下深情的一吻。看到她脸红了，你退后一步，抚摸着她的脸颊。[say:你、你在干什么？！]你凝视着她的眼睛，告诉她她很可爱。[say:哦，你这个白痴。你这个可爱又甜蜜的白痴。]她对你微笑着，亲吻了你的脸颊，并紧紧握住你的一只手。你回握住她的手，让她跟着你，把她带到你的铺盖卷旁。你让她躺下，当她躺下时，你慢慢脱下你穿的衣服，并确保稍微展示一下。一旦你的身体像你深色皮肤的爱人一样赤裸，你就和她一起躺在床上。");
         outputText("[pg]你在她身边躺下，双臂环绕着她无比温暖的身体。当你这样做时，她凑过来深吻你，双臂也环绕着你。你的舌头进入奇哈的嘴里，品尝着她的唾液，感受着她体内强烈的热量。");
         outputText("[pg]爱人的味道、热度以及亲密感，在你越来越湿润的[vagina]中激起了一股燃烧的欲望。你翻身仰躺，抱住她，让她趴在你身上，你们之间的亲吻从未中断。你用双腿缠住她的腿，将一只手从她的背上移开，放在她滚烫的小穴入口处。这只龙娘滴落的滚烫液体证明了她的兴奋，你用手指试探着她渴望的阴道口。当你表明意图时，她的爪子轻轻但明显地抓挠着你的背部，随后一只手离开了你的背部，你感觉到那只手出现在你自己饥渴的阴道入口处。你在她嘴里呻吟着，将她紧紧拉向你。当你将一根手指插入她体内时，她那巨大柔软的乳房挤压着你的胸膛。她对这种感觉睁大了眼睛，作为回应，她也将两根手指深深插入你体内。你惊讶于她独特而强烈的体温在你体内感觉如此之好，你用缠绕着她的双腿，在喜悦中紧紧地挤压着她。");
         outputText("[pg]受到她带给你的感觉的鼓舞，你又滑入一根手指进入她流着淫液的小穴。你的手指来回滑动，按压着她光滑柔软的肉壁，你又插入了第三根手指，并在你抽插时开始用拇指旋转摩擦她的阴蒂。当你继续与她亲热并用手指操她时，她那龙尾在你上方来回摇摆，她将手指卷曲在你体内，缓慢而有力地摩擦着你的阴道壁。在热量和她恰好击中你敏感点的压力的双重作用下，几乎没花什么时间，你的身体就不由自主地痉挛起来，一股淫液冲刷着你爱人留在你体内的手。当你度过强烈的性高潮时，你用自己的手指更深地插入奇哈燃烧的小穴。在用力摩擦她的阴蒂的同时，你在她的小穴里深深地抽插了几分钟，你感觉到她的阴道壁紧紧地收缩在你的三根手指周围，她的舌头深深地插入你的嘴里，很快，一股极其滚烫的淫液冲刷着你的手和手腕。感觉到她随着快感的浪潮冲刷而用臀部顶撞你的手，你继续刺激她，直到她停下身体。");
         outputText("[pg]当她这样做时，她终于将嘴从你嘴上移开，也将手从你身上移开。你将自己的手指从她体内滑出，翻身侧躺，带着她一起。面对着气喘吁吁的龙娘，你看着她的眼睛，问她是否玩得开心。她用翅膀包裹住你的身体，在你的嘴唇上快速地吻了一下。");
         outputText("[pg][say:我很喜欢，你这个笨蛋。我以为你能看出来，但我猜你太沉浸在我让你感觉多好之中，以至于没注意到。]");
         outputText("[pg]你冲她咯咯笑着，在她的额头上飞快地啄了一下，告诉她，正是因为她会说这种话，你才会爱上她这样一只巨大的龙族小可爱。[say: 小、小可爱？！什么鬼？你太坏了！]她局促不安地用手指戳了戳你的额头，力道刚好让你的头微微后仰，然后用小得多的声音再次开口。[say: 我也爱你，[name]。]她再次吻了吻你的嘴唇，紧紧地抱住你。在她的翅膀覆盖下，她紧紧地依偎着你，你们俩都进入了梦乡。");
         outputText("[pg]过了一小会儿，你醒了过来，小心翼翼地从奇哈的怀抱中挣脱出来，掀开盖在身上的翅膀。你穿好衣服，看着她在你的铺盖卷上安详地睡着，脸上带着微笑，然后再次出发。");
         get_player().orgasm("Vaginal");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function kihaCookingLesson4() : void
      {
         clearOutput();
         kihaSprite();
         outputText("当你的身体重新与现实连接时，你不由自主地倒吸了一口凉气。作为唯一一个真正把它咽下去的人，你似乎昏过去了，虽然只有几分钟。女孩们的嘟囔声把你从食物带来的阴暗想法中拯救了出来，奇哈正双手捂脸坐在那里，因为她意识到自己根本不会做饭。");
         outputText("[pg]奇哈转向你，眼泪顺着她的脸颊流下来。[say: 对不起！我从来没意识到我让你陷入了多大的危险。我只是——我想把事情弄得<b>特别</b>一点——因为我能做到！我应该做到！我——]她绝望地把脸趴在桌子上。");
         outputText("[pg]你把手放在她的肩膀上，安慰这位出于好意的意外毒理学家。");
         outputText("[pg]艾米莉猛地回过神来，尽管经历了濒死体验，但不知为何还是叽叽喳喳地说，[say: 没什么好担心的，奇哈！我们会一起做更小、更简单的饭菜。随着时间的推移，我们可以尝试更复杂的菜肴，我会帮你学会做你想吃的那种食物！]");
         outputText("[pg]奇哈抬头看着老鼠，仿佛她被救世主拜访过，并被告知她所有的罪孽都将被遗忘。女孩们拥抱在一起，牢牢地巩固了她们在未来许多顿饭中的羁绊。希望在奇哈下次尝试为你做饭之前，艾米莉能教她足够多的东西……");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function kihaCookingLesson3() : void
      {
         clearOutput();
         kihaSprite();
         outputText("在艾米莉展示了烹饪鱼肉的类似熟练度后，她简要地介绍了一下加热其他种类食物的方法，然后将话题转向了食谱。");
         outputText("[pg][say: 这些年来，很多组合都让我感到惊讶，但大家都知道，当选择有限或者你不知道该做什么时，那些经过时间考验的基础餐点总是没错的。老实说，我认为即使在这个相对悠闲的营地里，吃些基础餐点也是挺好的，比如简单的烤肉，配上几块用油脂煎过的陈面包。事情可以很简单高效，但也很美好，]她解释道。");
         outputText("[pg]奇哈得意地笑了笑，骄傲地反驳了这个想法。[say: 我觉得如果你有能力飞到任何你想去的地方寻找食材，并且能用你的<b>吐息</b>快速高效地烹饪，那就没必要这么简单！我可以轻松弄到任何我想扔进食谱里的东西，所以我毫不吝啬地使用它们。只有在物资充足的城市里的餐厅才会供应的那种食物，我自己就能做！]现在回想起来，这绝对解释了为什么她做的每样东西里都会有一些奇怪的味道。");
         outputText("[pg]艾米莉对这种自信感到警惕，她指了指她们拥有的众多食材。[say: 不如举个例子说明你的意思？假设你设法收集到了你在这里看到的所有东西，你会决定把什么放进饭菜里？]");
         outputText("[pg][say: 全部？]奇哈挑起眉毛说道。[say: 当-当然，分量各不相同。]");
         outputText("[pg]艾米莉疲惫地对龙女笑了笑，寻找着合适的措辞。[say: 我来做一个主要很简单的食谱，只加一些额外的东西，然后盛出一部分，你可以把你想要的所有其他额外的东西都加进去。这样如何？]");
         outputText("[pg]奇哈点点头，看着这位老鼠厨师迅速挑选了一些咸鲜的食材，还加了一点苦味的蔬菜。当煮熟并加盐后，蔬菜的苦味转变成了一种相当不错的味道，如果你有另一种咸鲜成分与之平衡，味道会更好。一个经过深思熟虑的组合被迅速准备好并放在盘子里，让奇哈可以自由地使用剩余的饭菜作为她自己杰作的基础。");
         outputText("[pg]你和艾米莉目瞪口呆地看着这个长着鳞片的女人兑现了她的诺言，把她能拿到的每一种食材都至少加了一点到同一道菜里。这种扭曲炼金术中的切碎、切丁和火焰辅助成分，似乎只是在暗示这其中包含着某种预谋，这让你们俩更加不安。难道……这种疯狂中真的有什么门道吗？");
         outputText("[pg]当奇哈骄傲地放下她的作品，小心翼翼地倒进碗里时，这种恍惚终于被打破了。春季蔬菜和柠檬草被煮熟后漂浮在原本无法辨认的糊状物中，看起来就像是从奇哈来的那片沼泽里直接舀出来的一样——这又回答了曾经萦绕在你脑海深处的另一个问题。现在你知道那不仅仅是沼泽泥了，虽然你不确定这是否能让你感觉好点。");
         outputText("[pg]艾米莉光是看到它就快要癫痫发作了，她建议两人在尝试奇哈的菜之前，先尝尝她的菜。[say: 把最好的留到最后，你懂的？]她吱吱地说道。幸运的是，奇哈接受了这个主意，你们三个人都尝了一口艾米莉做的家常菜，并都对它赞不绝口。这是一顿健康又美味的饭菜，你很高兴能回想起之前几次吃她做的饭的情景！");
         outputText("[pg]奇哈把她的碗拉了过来。[say: 现在是时候给你们展示<b>我</b>的厨艺了，]这头可怕的龙威胁道。艾米莉怯生生地举起勺子，勺子靠近碗时还在不规则地颤抖。奇哈对艾米莉的恐惧浑然不觉，她也递给你一把勺子。为了公平起见，你舀起一口放进嘴里。你那自杀式的自信误导性地安抚了艾米莉，她也跟着照做了。");
         outputText("[pg]一种恐惧刺穿了你的身体。你提醒自己，艾米莉带来的食材没有一样是有毒的，然后咽下了那可怕的炖菜。另一方面，你那像老鼠一样的烹饪导师，在任何东西还没咽下去太深之前就立刻吐了出来。你很羡慕她。你慢慢转过头，看着奇哈，她正茫然地盯着前方，勺子还含在嘴里。");
         outputText("[pg]龙把勺子拔了出来，露出烧焦的糊状物，她一定是本能地试图把它烧成灰烬，而不是咽下去。");
         outputText("[pg][say: 我犯了个错误，]她只说了这一句。");
         doNext(kihaCookingLesson4);
      }
      
      public function kihaCookingLesson2() : void
      {
         clearOutput();
         kihaSprite();
         outputText("当你走近艾米莉时，新鲜鱼肉和香草的气味，以及各种各样的食材映入眼帘。她已经摆好了相当多的一批食材，足够做很多顿饭了，显然是为了可能的反复试验做准备。");
         outputText("[pg]奇哈饶有兴趣地打量着桌上的阵仗。[say: 所以，我们是要做某种超级炖菜吗？]");
         outputText("[pg]艾米莉沉默地眨了眨眼，然后回答道。[say: 啊，不是的，这其实是为了让我们能尝试几种不同的食谱，以防我们不小心搞砸了！你好，奇哈。]如果这个开局能说明什么的话，这只老鼠可能有点贪多嚼不烂了。");
         outputText("[pg][say: 哦，对，你好，艾米莉。]奇哈带着一丝尴尬说道。这确实说明了当你忙碌时，她们俩几乎不怎么来往。[say: 如果我们要这么做的话，我来给你展示一下龙是怎么烤肉的！]她突如其来的自信提醒了你，她不是那种会在别人面前示弱的人，但用一大股火焰作为开场似乎是个糟糕的主意。");
         outputText("[pg]艾米莉可能和你想的一样，她拼命地挥舞着手臂。[say: 等等！等等——我们需要<b>一起</b>做饭，分享我们的方法，学习对方是怎么做的。试着只烤半块鱼片怎么样？]这只老鼠以惊人的速度抓起一把刀，干净利落地将一块鱼片切成两半，放在奇哈附近。一个单一的小目标应该有助于防止奇哈把整张桌子都吞没在火海中，同时也能确保她不会不小心把所有东西都烤焦。这种微观尺度的烹饪似乎是个新奇的概念，龙女看着那小块鱼肉皱起了眉头。她把它举起来，深吸一口气，然后对着它吹出一道火焰，转动着它，让火焰包裹住它的每一面。老鼠看起来对烘烤的均匀程度感到非常惊喜。她又迅速切了一刀，将其进一步分开，给自己留了一口大小的肉块，另一块则递给了奇哈。");
         outputText("[pg]艾米莉发出一声满足的轻哼。[say: 很好，你掌握的火候非常精准！另一半烤得稍微轻了一点，但那龙息用来做饭一定超级方便！]她似乎对这件事感到由衷的兴奋。");
         outputText("[pg][say: 哈！当然，我的火想多热就多热，想什么时候用就什么时候用！]奇哈得意洋洋地说道。尽管你之前有些担心，但事情进展得很顺利。");
         outputText("[pg]艾米莉在附近的火上架起一个平底锅，开始解释用传统方法掌握火候有多难。虽然奇哈也懂在普通火上做饭的基础知识，但她似乎对艾米莉能够给出的深入解释非常感兴趣。她们真的通过这件事建立起了联系。");
         doNext(kihaCookingLesson3);
      }
      
      public function kihaCookingLesson() : void
      {
         clearOutput();
         kihaSprite();
         outputText("你仔细斟酌了一下措辞，不想让她太难过。你拿出了最强的外交说服力，告诉奇哈艾米莉很喜欢做饭，而且你也很清楚奇哈也是个厨师！如果她们俩能和你一起聚在一起做点什么，那将是一次非常愉快有趣的“约会”。这对所有人来说都是一个学习更多烹饪知识的机会，还能分享各自对食谱的看法。通过差不多这样的解释，奇哈开始思考起来。");
         outputText("[pg][say: 我的厨艺只为你展现，笨蛋……不过你说得也有道理，]她移开视线，似乎对除了你之外的人品尝她的手艺感到犹豫。你灵机一动，提到艾米莉对奇哈的凶猛和强大感到相当敬畏，而这正是让她放松下来的好时机，因为你比任何人都清楚，奇哈内心是一个善良体贴的人。");
         outputText("[pg]你那龙族恋人听到赞美，脸红了。[say: 好吧……笨蛋。]");
         outputText("[pg]她调皮地敲了一下你的手臂，跟着你走到艾米莉应该正在搭建烹饪台的地方。");
         saveContent.badCookingTasted = 3;
         doNext(kihaCookingLesson2);
      }
      
      public function kihaChildren() : String
      {
         if(totalKihaChildren() > 1)
         {
            return "孩子们";
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2195) > 0)
         {
            return "儿子";
         }
         return "女儿";
      }
      
      public function kihaChildGraduationTime() : void
      {
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2198,0);
         var _loc1_:Array = [];
         var _loc2_:int = 0;
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2195) > 0)
         {
            _loc1_.push("male");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2196) > 0)
         {
            _loc1_.push("female");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2197) > 0)
         {
            _loc1_.push("herms");
         }
         var _loc3_:Array = _loc1_;
         var _loc4_:String = _loc3_[Utils.rand(int(_loc3_.length))];
         outputText("你走上前去查看你的龙族孩子们。以玛莱之名，他们都长大了！低头看去，你注意到他们大多数人都穿着部落的缠腰布，显得很端庄");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2191) > 0)
         {
            outputText("就像奇哈一样");
         }
         else
         {
            outputText("完全不像奇哈，她依然一丝不挂");
         }
         outputText("，尽管有些人还是更喜欢完全不穿衣服。");
         outputText("[pg]奇哈走到你身边说，[say: 他们现在可是相当出色的小战士了。我甚至看到他们中的几个放倒了一只牛头怪，我从未如此骄傲过。这样下去，我们也许真的有机会对抗莉希丝。我想，我们可以再多生几个……] 奇哈克服了羞涩，给了你一个热情的吻，然后飞走去忙她平时的事务了。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2198,0);
      }
      
      public function kihaChildFirebreathingWatch() : void
      {
         clearOutput();
         kihaSprite();
         outputText("你告诉她你想看看她能做什么" + (totalKihaChildren() > 5 ? "并撑起身子，小心翼翼地不伤到那些紧紧抱住你四肢的孩子们。没过多久，他们就爬上了你的肩膀，[if (isbiped) {坐在你的腿上|[if (isgoo) {依偎在你的史莱姆里|蜷缩在你那怪异的身体上}]}]，其余的则紧贴着你，观看他们母亲的表演。" : "并[if (haslegs) {坐下|放低身子趴在地上}]，" + (totalKihaChildren() > 1 ? "你的孩子们迅速爬满你全身，寻找最佳座位。" : "你的" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2195) > 0 ? "儿子" : "女儿") + "[if (isbiped) {蜷缩在你的腿上|[if (isgoo) {蜷缩在你的史莱姆里|爬上你的背}]}]观看表演。")));
         outputText("[pg]当一股火焰惊险地掠过你的头顶时，传来一声" + (totalKihaChildren() == 1 ? "微弱的" : "集体的") + "喘息声；当火焰落在你身后一个粗制滥造的靶子上时，喘息声更大了。奇哈和你的" + kihaChildren() + "自豪地笑着，那个木制生物——你觉得它应该是个小恶魔——在高温下噼啪作响，火焰舔舐着它的肚子。");
         outputText("[pg]你的" + kihaChildren() + "试图模仿她，但" + (totalKihaChildren() > 1 ? "他们" : (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2195) > 0 ? "他" : "她")) + "所能做到的只是把口水喷得" + (totalKihaChildren() > 1 ? "彼此和" : "") + "你满身都是。奇哈摇摇头，微笑着看着你擦脸，然后凑过来把你舔干净。这其实没什么帮助，但[if (cor > 66) {这就是奇哈|至少她尽力了}]。");
         outputText("[pg]只剩下你们两个了，因为" + (totalKihaChildren() > 5 ? "你所有的孩子都围在" : "你的" + kihaChildren() + "站在") + "燃烧的靶子残骸旁，用尽全力吹气，把火势煽得更高。你想，总有一天你得告诉他们，他们并不是真正的龙，但那是将来的事了。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function kihaChildFirebreathingLeave() : void
      {
         kihaSprite();
         outputText("[pg]你决定现在没时间陪他们胡闹，于是趁他们还没注意到你，转身回营地去了。");
         doNext(playerMenu);
      }
      
      public function kihaChildFirebreathingInvestigate() : void
      {
         var _g:KihaFollowerScene;
         clearOutput();
         kihaSprite();
         outputText("出于好奇——也出于对营地安全的担忧——你走过去看看发生了什么。奇哈似乎最先注意到了你，在你靠近时，她向空中喷出一团火焰，并张开双翼。你的" + (totalKihaChildren() > 5 ? "成群的孩子们互相攀爬着想看个究竟，他们的欢呼声大得几英里外都能听到" : kihaChildren() + " " + (totalKihaChildren() > 1 ? "发出" : "发出") + " 欢乐的叫声，似乎对落在" + (totalKihaChildren() > 1 ? "他们" : (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2195) > 0 ? "他" : "她")) + "身上的余烬毫不在意。") + "");
         outputText("[pg][say: 来看热闹的？] 她问道，她那" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2191) > 0 ? "几乎" : "") + "赤裸的身体在伸展时点缀着闪闪发光的汗水。[say: 我不介意。]");
         outputText("[pg]她说话的时候，" + (totalKihaChildren() > 5 ? "你所有的孩子都转过身来看着你，还没等你反应过来，这群尖叫的小家伙就把你撞倒了，[say: [Dad]！] 的叫声在你耳边回荡。" : "你的" + kihaChildren() + "转向你，显然因为" + (totalKihaChildren() > 1 ? "他们" : (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2195) > 0 ? "他" : "她")) + "的[father]来了而感到兴奋。") + "很难看清" + (totalKihaChildren() > 5 ? "在那些蠕动的身体中" : "，而且她也绝不会承认") + "，但你敢发誓奇哈刚才脸红了一下。");
         menu();
         addNextButton("观看",kihaChildFirebreathingWatch);
         _g = this;
         addNextButton("竞争",function():Boolean
         {
            return _g.kihaChildFirebreathingCompete();
         }).disableIf(!kihaChildFirebreathingCompete(false),"你没有什么可以用来竞争的。");
      }
      
      public function kihaChildFirebreathingDisplay(param1:int) : void
      {
         clearOutput();
         kihaSprite();
         outputText("你的" + kihaChildren() + "满怀期待地看着，" + (totalKihaChildren() > 1 ? "" : "") + "随着" + (int(param1 % 2) == 0 ? "你深吸一口气，腹部的热量不断积聚，直到你再也无法压抑。你瞄准目标，张开嘴，然后" : "你将力量向外引导，直到它爆发成一场"));
         switch(param1)
         {
            case 0:
               outputText("一股翡翠般的火焰喷涌而出，带着阿克巴尔的全部怒火猛烈地撞击在“恶魔”身上。");
               break;
            case 1:
               outputText("耀眼的紫色火雨");
               break;
            case 2:
               outputText("一阵龙息狂暴地喷涌而出，所过之处只留下一片焦黑的土地。");
               break;
            case 3:
               outputText("耀眼的蓝色火雨");
               break;
            case 4:
               outputText("一团翻滚的火焰云向前飘去，充满情欲的火焰沐浴着你的周围，让你的[skindesc]感到一阵刺痛。");
               break;
            case 5:
               outputText("耀眼的闪光");
         }
         if(int(param1 % 2) == 1)
         {
            outputText("。当你恢复视力时，“恶魔”正剧烈地燃烧着，你听到了你的" + kihaChildren() + "发出的" + (totalKihaChildren() == 1 ? "一声惊呼" : "一阵惊呼") + "——以及你身边传来的" + (totalKihaChildren() > 1 ? "一声" : "") + "嘲弄的冷哼。[say: 巫师，]奇哈嘟囔着，声音刚好能让你听清。");
         }
         outputText("[pg]你退到一边，让奇哈接替你的位置，你的竞争对手已经全神贯注地盯着那堆木头。你的一部分甚至觉得，如果那堆木头在她的注视下直接融化了，你也不会感到惊讶——而你的另一部分则忙着在她拍打翅膀、飞到你上方以获得更好视野时，踉跄着后退。" + (get_player().canFly() ? "也许<i>你</i>也该用这招。" : "") + "你的" + kihaChildren() + "四处乱窜，" + (totalKihaChildren() > 1 ? "" : "") + "仰起" + (totalKihaChildren() > 1 ? "他们的" : (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2195) > 0 ? "他的" : "她的")) + "头" + (totalKihaChildren() > 1 ? "" : "") + "看着" + (totalKihaChildren() > 1 ? "他们的" : (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2195) > 0 ? "他的" : "她的")) + "母亲，你甚至能看到，当一团火焰在" + (totalKihaChildren() > 1 ? "他们" : (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2195) > 0 ? "他" : "她")) + "头顶划过一道弧线，然后猛烈地撞击在目标的残骸上时，" + (totalKihaChildren() > 1 ? "他们的" : (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2195) > 0 ? "他的" : "她的")) + "眼睛都睁大了。");
         outputText("[pg]也就是说，没剩下多少了。");
         var _loc2_:String = "[pg][say: 算平局吧，]奇哈说着，降落在你身边。你的" + kihaChildren() + "毫不迟疑地冲向你们俩，";
         var _loc3_:String = totalKihaChildren() > 1 ? "" : "";
         var _loc4_:String = totalKihaChildren() > 1 ? "他们" : (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2195) > 0 ? "他" : "她");
         var _loc5_:String = totalKihaChildren() > 1 ? "他们的" : (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2195) > 0 ? "他的" : "她的");
         outputText(_loc2_ + _loc3_ + (int(param1 % 2) == 0 ? "一边吹气一边发出噗噗声" : "手舞足蹈") + "，徒劳地试图模仿你的动作。虽然没成功，但" + _loc4_ + "似乎并不介意，只要能和" + _loc5_ + "[father]待在一起就足够开心了。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function kihaChildFirebreathingCompete(param1:Boolean = true) : Boolean
      {
         var type5:int;
         var _g5:KihaFollowerScene;
         var type4:int;
         var _g4:KihaFollowerScene;
         var type3:int;
         var _g3:KihaFollowerScene;
         var type2:int;
         var _g2:KihaFollowerScene;
         var type1:int;
         var _g1:KihaFollowerScene;
         var type:int;
         var _g:KihaFollowerScene;
         var _loc3_:* = null as String;
         var _loc4_:* = null as String;
         var _loc5_:* = null as Array;
         var _loc2_:Boolean = false;
         if(param1)
         {
            clearOutput();
            kihaSprite();
            _loc3_ = "你不满足于仅仅观看，于是走到奇哈身边，确保她注意到你靠近时" + (get_player().hasPerk(PerkLib.TerrestrialFire) || get_player().hasPerk(PerkLib.Dragonfire) || get_player().hasPerk(PerkLib.Hellfire) ? "嘴唇上冒出的烟雾" : "手上闪烁的火花") + "。甚至你的" + kihaChildren() + "也认出了这个挑战，";
            if(totalKihaChildren() == 1)
            {
               _loc4_ = "犹豫地在你们俩之间看来看去，不知道该说什么。";
            }
            else
            {
               _loc5_ = ["你在这里处于劣势","你的孩子们支持你","势均力敌，难分胜负"];
               _loc4_ = "立刻选出了他们最看好的一方，并在他们之间争论起来。从你能听懂的只言片语中，" + _loc5_[Utils.rand(int(_loc5_.length))] + "。";
            }
            outputText(_loc3_ + _loc4_);
            outputText("[pg]奇哈发出一声震耳欲聋的咆哮，把他们的注意力拉了回来。她打量着你，眼中燃烧着竞争的火焰。[say: 谁打中恶魔最准谁就赢，] 她说着，用爪子指向一堆看起来像树枝叠成的东西。[say: 你先来。]");
            outputText("[pg]你要召唤哪种火焰力量？");
            menu();
         }
         if(get_player().hasPerk(PerkLib.TerrestrialFire))
         {
            if(param1)
            {
               _g = this;
               type = 0;
               addNextButton("阿克巴尔之赐",function():void
               {
                  _g.kihaChildFirebreathingDisplay(type);
               });
            }
            else
            {
               _loc2_ = true;
            }
         }
         if(get_player().hasPerk(PerkLib.CorruptedNinetails))
         {
            if(param1)
            {
               _g1 = this;
               type1 = 1;
               addNextButton("C.Foxfire",function():void
               {
                  _g1.kihaChildFirebreathingDisplay(type1);
               });
            }
            else
            {
               _loc2_ = true;
            }
         }
         if(get_player().hasPerk(PerkLib.Dragonfire))
         {
            if(param1)
            {
               _g2 = this;
               type2 = 2;
               addNextButton("龙息",function():void
               {
                  _g2.kihaChildFirebreathingDisplay(type2);
               });
            }
            else
            {
               _loc2_ = true;
            }
         }
         if(get_player().hasPerk(PerkLib.EnlightenedNinetails))
         {
            if(param1)
            {
               _g3 = this;
               type3 = 3;
               addNextButton("狐火",function():void
               {
                  _g3.kihaChildFirebreathingDisplay(type3);
               });
            }
            else
            {
               _loc2_ = true;
            }
         }
         if(get_player().hasPerk(PerkLib.Hellfire))
         {
            if(param1)
            {
               _g4 = this;
               type4 = 4;
               addNextButton("地狱火",function():void
               {
                  _g4.kihaChildFirebreathingDisplay(type4);
               });
            }
            else
            {
               _loc2_ = true;
            }
         }
         if(get_player().hasStatusEffect(StatusEffects.KnowsWhitefire))
         {
            if(param1)
            {
               _g5 = this;
               type5 = 5;
               addNextButton("白焰",function():void
               {
                  _g5.kihaChildFirebreathingDisplay(type5);
               });
            }
            else
            {
               _loc2_ = true;
            }
         }
         return _loc2_;
      }
      
      public function kihaChildFirebreathing() : void
      {
         clearOutput();
         kihaSprite();
         outputText("烟雾慵懒地飘过" + (get_camp().get_builtWall() ? "环绕你营地的围墙" : "营地边缘的半空中") + "——自从你邀请" + (followerEmber() ? "那两条龙" : "奇哈") + "和你住在一起后，这不幸成了家常便饭。远处一棵枯死已久的树在冒烟，在它旁边你可以[if (ischild) {隐约看到奇哈那令人印象深刻的身姿|看到奇哈}]，还有你的" + (totalKihaChildren() > 5 ? "名副其实的" : "") + kihaChildren() + "大军。为了" + (totalKihaChildren() > 1 ? "他们" : (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2195) > 0 ? "他" : "她")) + "好，你希望这只是奇哈的又一次喷火演示，而不是今晚的晚餐。");
         saveContent.kidFirebreathing = true;
         menu();
         addNextButton("调查",kihaChildFirebreathingInvestigate);
         addNextButton("离开",kihaChildFirebreathingLeave);
      }
      
      public function kihaCampAppearance() : void
      {
         clearOutput();
         get_images().showImage("monster-kiha");
         outputText("奇哈是一个6英尺高的龙女，有着深色的皮肤，身体大部分被血红色的鳞片覆盖。她" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2191) > 0 ? "穿着" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2191) == 1 ? "一条蜘蛛丝内裤" : "一条蜘蛛丝缠腰布") : "赤身裸体，对自己的裸体毫不羞耻，") + "并拿着一把巨大的附魔巨斧，斧头燃烧着高温。她有一张锐利的、掠食者般的脸，深红色的眼睛里带着黑色的爬行动物般的狭长瞳孔。红色的长发从她的头皮上长出来，一直垂到肩膀以下。她有着强壮的、适合生育的臀部和柔软的翘臀。她有两条长满鳞片和爪子的爬行动物般的腿，末端是柔软的、皮革般的脚底。");
         outputText("[pg]她有一对暗色的、柔软的D罩杯乳房，每个乳房上都有一个0.5英寸的乳头。");
         outputText("[pg]" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2191) > 0 ? "在她的" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2191) == 0 ? "蜘蛛丝内裤" : "蜘蛛丝缠腰布") + "下面，" : "") + "奇哈的双腿之间有一个松弛的小穴，不断滴下温暖湿润的润滑液，弄脏了她的");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2191) > 0)
         {
            outputText(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2191) == 1 ? "内裤" : "缠腰布");
         }
         else
         {
            outputText("大腿");
         }
         outputText("。");
         outputText("[pg]在她那诱人的臀瓣之间，奇哈有一个紧致的屁眼，就在它该在的地方。");
         doNext(get_kihaScene().encounterKiha);
      }
      
      public function kihaBreastfeedingTime() : void
      {
         outputText("[pg]奇哈和她的" + (totalKihaChildren() == 1 ? "孩子" : "孩子们") + "相处得很好。她似乎正在给她的" + (totalKihaChildren() == 1 ? "" : "最小的") + "孩子喂奶。");
      }
      
      public function kihaBitchesOutCorruptPCs() : void
      {
         clearOutput();
         kihaSprite();
         if(!followerKiha())
         {
            outputText("你穿过阴暗的沼泽，脑海中浮现出你的龙女");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,421) == 1)
            {
               outputText("朋友");
            }
            else
            {
               outputText("情人");
            }
            outputText("当你进入她的领地时。你那充满情欲、扭曲的思绪游荡到奇哈那深色、丰满的身体上，她那大而柔软的乳房" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2191) > 0 ? "" : "，她的小穴，淫荡地向世界展示着，总是像一台润滑良好的性爱机器一样漏着淫液。") + "。你对自己邪恶地咧嘴一笑，你的");
            if(get_player().hasCock())
            {
               outputText("[cock]");
            }
            else if(get_player().hasVagina())
            {
               outputText("[vag]");
            }
            else
            {
               outputText("情欲");
            }
            outputText("一想到要掰开她长满鳞片的双腿，狠狠地操她，直到她一次又一次地乞求释放，直到你把她榨干然后扔掉，你就感到一阵强烈的冲动。那该有多美妙啊！");
            outputText("[pg]仿佛你的思绪召唤了她，奇哈从一棵树后滑了出来，她宽阔的臀部随着她每一次充满力量、掠食者般的动作微微摇曳……她的战斧在手中闪耀，一层火红的雾气环绕着它那残酷的弧线。好吧，该死。");
            outputText("[pg][say: [name]，]她平淡地说着，将斧柄插在地上，重重地倚靠在上面。");
            outputText("[pg]你打了个招呼，紧张地环顾四周。这里有些不对劲，你的手不由自主地伸向了你的[weaponName]。");
            outputText("[pg][say: 听着，[name]，]奇哈从她的斧头后面盯着你说道。[say: 也许我们最近成了朋友，但是……你身上发生了一些变化。我能闻到你身上的腐化气息，那种情欲……我——我做不到，[name]。我不能和一个随时可能变成某种怪物的人在一起，一个像……像你这样放纵自己的人。请你走吧，[name]。]你试图抗议，试图和这位火爆的战士讲道理，但她只是举起斧头，对准了你……[say: 快——快走！]");
            menu();
            addButton(0,"战斗",get_kihaScene().meetKihaAndFight);
            setExitButton();
         }
         else
         {
            outputText("奇哈朝你走来，手里拿着她的随身物品。这位性感的龙女看起来明显很不安，没等你开口，她就打断了你，[say: 别说话，[name]。你堕落了。我隔着老远都能闻到你身上散发出的腐化气息。当你变成恶魔的时候，我可不想待在这里，我也不想和你战斗……但如果你敢来找我，我会毫不犹豫地自卫！]");
            outputText("[pg]奇哈闭上眼睛，腾空而起，只留下几滴眼泪，任由这片干涸的荒地吞噬。");
            doNext(playerMenu);
         }
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,423,1);
      }
      
      public function kihaAffection(param1:int = 0) : void
      {
         var _loc2_:* = null as IMap;
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,421) == 2)
         {
            _loc2_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc2_,422,FlagDict_Impl_.arrayReadInt(_loc2_,422) + param1);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,422) < 0)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,422,0);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,422) > 100)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,422,100);
         }
      }
      
      public function kihaAdmitsSheLikesYourWang() : void
      {
         clearOutput();
         kihaSprite();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,426) == 0)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,426,1);
            outputText("在探索沼泽时，你发现自己来到了你的龙女朋友熟悉的领地。奇哈，总是喜欢华丽的登场，从树梢上滑翔而下，她的翅膀在空地上投下可怕的阴影。她轻轻地降落，离你只有几英尺远，随意地靠在她的斧头上。龙女哼了一声，[say: 这么快就回来拜访了？好吧，我想你比其他一些可能会来找我的野兽要好。]像往常一样，她试图让你措手不及，在你回答她的暗示之前，她继续说道，[say: 你为什么总是来这里？你没有真正的朋友吗？如果我是你唯一能说话的人，那有点可悲。]");
            outputText("[pg]奇哈长满鳞片的尾巴卷到你身边，在你的臀部上顽皮地拍了一下。你惊讶地跳了起来。等一下……她脸红了吗？这是她埋藏在强硬、刻薄外表下的感情吗？表现出温柔可能会扩大她心墙上的裂缝……");
            outputText("[pg]你是拥抱她，并有可能把事情推向下一个阶段，还是你宁愿做点别的，让事情保持原样？");
         }
         else
         {
            outputText("奇哈轻轻地从你面前的树上跳下来，踢起一小片恶臭的水花，停在几英尺外。她漫不经心地把斧头扛在肩上，笑着说，[say: 你是回来挨揍的吗？你不会是第一个为了在躺在地上时能打量我而故意输掉比赛的人。]她的尾巴转过来，顽皮地打在你的[ass]上，她暗色的皮肤上泛起一丝绯红，与她闪闪发光的鳞片的红宝石色调相匹配。奇哈摆出一个比平时看起来更淫荡的战斗姿势，问道，[say: 那么，你是来打架的，还是来浪费更多时间说话的？]");
            outputText("[pg]你是要抱抱她，让关系更进一步，还是想做点别的？");
         }
         menu();
         addButton(1,"切磋",sparWithKiha).hint("和奇哈来一场快速战斗！");
         addButton(2,"拥抱",hugFriendWarmKiha).hint("给这只母龙一个拥抱。");
         addButton(3,"爱意拥抱",lovinHugKiha).hint("给这只母龙一个拥抱，让关系更上一层楼！");
         setExitButton();
      }
      
      public function jumpDaBitches() : void
      {
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,425,1);
         clearOutput();
         kihaSprite(true);
         outputText("你皱着眉头，从泥地里爬起来，擦掉[armorName]上的沙砾。你悄悄走到那个神秘剑士身后，抓住她的后颈。突然，她在你怀里大喊大叫，胡乱挥舞，一条粗壮的尾巴在你的[legs]周围抽打。你收紧了对她的抓握，把她拖到奇哈身边，此时龙女正把自己从泥地里拔出来，伸手去拿从她手里掉落的战斧。在她找到它之前，你把剑士扔向她，把奇哈撞倒，让她们俩在泥地里滚成一团。");
         outputText("[pg]剑士的斗篷在投掷中脱落了；你把它扔到一边，走上前去俯视着火蜥蜴赫尔，她苍白的脸现在正埋在奇哈那对巨大、暗色的乳房之间。[say: 放、放开我！]奇哈厉声说道，推着火蜥蜴的肩膀。");
         outputText("[pg][say: 嘿！把手拿开，婊子，]赫尔咆哮着，声音在奇哈的肉体中显得有些沉闷，她挥舞着长而锋利的爪子。她从龙女的胸前挣脱出来，正好赶上奇哈狠狠地在她脸上打了一拳！");
         outputText("[pg]赫尔从她身上滚落，捂着脸颊，而奇哈试图第二次站起来。真他妈的不可能。你");
         if(get_player().isBiped())
         {
            outputText("大步走过去");
         }
         else if(get_player().hasTailInsteadOfLegs())
         {
            outputText("滑行过去");
         }
         else
         {
            outputText("向她走去");
         }
         outputText("并把一只[foot]踩在她的胸口，把她按在地上。[say: 嘿，搞什么鬼！从我身上滚开！]");
         outputText("[pg]在她刚刚试图搞出那种事之后，你告诉她坐下闭嘴。在你身后，赫尔扭动着，直到你抓住她的手臂，把她拖过去坐在奇哈旁边。[say: [name]！我是在试图帮你！]你只是皱着眉头，抓住两个鳞片女孩的头发，把她们拖起来跪在你面前。她们在你的抓握中扭动挣扎，直到你给了她们俩一巴掌。这让她们暂时闭了嘴。");
         outputText("[pg]现在女孩们在你的掌控下相对温顺了，你把手伸进肮脏的[armorName]里，掏出了[eachCock]。似乎有一点泥水浸透了你的衣服，你那根正在变硬的肉棒上沾着几块大大的泥斑。你邪恶地对着鳞片女孩们咧嘴一笑，告诉她们，既然你的老二弄脏是她们的错，那她们就有责任把你清理干净。");
         outputText("[pg]奇哈瞪大眼睛，目瞪口呆地看着你。[say: 胡、胡说八道！我才不碰那恶心的东西。]当她张开嘴喷着她的胡言乱语时，你高兴地把你的肉棒直接插了进去，穿过她丰满的嘴唇，直到你的龟头");
         if(get_player().cocks[0].cockLength >= 8)
         {
            outputText("弯进她的喉咙");
         }
         else if(get_player().cocks[0].cockLength > 6)
         {
            outputText("顶到她的喉咙深处");
         }
         else
         {
            outputText("正好停在她的舌尖上");
         }
         outputText("。她挣扎着，干呕着；你轻轻扇了她一巴掌，让她把你的老二清理干净。");
         outputText("[pg]奇哈继续挣扎，迫使你用双手抓住她的头，开始把她的嘴当成你个人的飞机杯，让她的下巴在你的[cock]上前后摇晃。看到奇哈在你的肉棒上干呕，赫尔发出了一阵爽朗的笑声，取笑龙女目前的困境。");
         if(get_player().cockTotal() == 1)
         {
            outputText("[pg]不想让赫尔这样淫荡的嘴白白浪费，你从奇哈的嘴里拔出来，直到只有你的龟头还在她的嘴唇之间，然后抓住赫尔的下巴，把她拉到你的肉棒上，命令她舔。现在轮到赫尔在你的抓握中挣扎了，但奇哈用她的尾巴在她的屁股上狠狠地抽了一巴掌，这一击的力量把她的脸直接砸进了你的胯部。赫尔不情愿地把她细长的舌头伸出嘴外，一圈又一圈地缠绕在你的[cock]上，像蛇一样盘绕着你。");
            outputText("[pg]在这样的缠绕下，你把一只手放在每个女孩的头上，开始再次插入奇哈的嘴里，在赫尔的舌头仍然缠绕在你的肉棒上的情况下，操着她的嘴。你进入了一个美妙的节奏，操着奇哈的脸，而你臀部的每一次挺动都拖着赫尔的整个头一起运动，每次你在龙女的嘴里插到底时，她的脸颊都会拍打在奇哈的脸上。");
         }
         else
         {
            outputText("[pg]不想让赫尔这样淫荡的嘴白白浪费，你从盔甲里掏出你的[cock 2]，把它的龟头压在赫尔的嘴唇上。她开始抗议，但就像你对奇哈做的那样，她一开口抱怨，你就把你的第二根肉棒塞了进去，把它整个埋在她的脸上。她干呕着喘息，但你只是抓住两个女孩的头发，开始用她们给自己口交，把她们的脸按在你的肉棒上，直到你变成一团被口水弄得滑溜溜的烂泥，直到两个女孩变得完全顺从，只是任由你使用她们。");
         }
         outputText("[pg]厌倦了鳞片女孩们的口交服务，你把她们从你的肉棒上拉开");
         if(get_player().cockTotal() > 1)
         {
            outputText("");
         }
         outputText("，咧嘴笑着，因为浓稠的唾液和前列腺液仍然将她们张开的、被充分使用过的嘴与你连接在一起。你粗暴地把女孩们仰面扔在地上，并排躺着，而你则俯视着她们。你咧嘴笑着说，既然她们这么乖，把你的老二弄得");
         if(get_player().cockTotal() > 1)
         {
            outputText("");
         }
         outputText("干干净净、一尘不染，你会好心地让她们也爽一爽。");
         outputText("[pg]赫尔微微一笑，松了一口气，她终于能得到一些行动了；另一方面，奇哈扭动着，试图从你身边爬开。在她得逞之前，你把赫尔滚到她身上，用赫尔大得多的体重把奇哈压住。你跪在她们两腿之间，拉着她们的脚靠近你一点，让她们流着口水的小穴正好在你的[cock]的顶端。你抬起赫尔宽大的臀部，让她的屁股翘在空中。你一只手抚摸着你的[cock]，对准她湿滑的小穴；另一只手抓住奇哈长而粗的尾巴，把它的尖端压在赫尔紧致的小菊花上。");
         outputText("[pg]奇哈只是坐在那里，在赫尔身下喘着粗气，一动不动。你正准备责备她，突然，赫尔把她自己火红的尾巴缠在你的腰上，把它插进了奇哈湿滑的小穴里。当赫尔的尾巴猛地插进她毫无防备的小穴时，龙女震惊地叫了一声，果然，她的尾巴猛地甩出，插进了赫尔准备好的肛门里。当奇哈长满鳞片的尾巴在你的手的引导下滑入她体内最初的几英寸时，火蜥蜴发出了咕噜声。现在她已经半满了，你抓住你的肉棒，插进赫莉娅湿润而准备好的小穴里。");
         outputText("[pg]当你开始你那半边的双重操弄时，赫尔尖叫起来。你抓住她宽大的臀部，开始又硬又快地操她，从一开始就尽可能快地把你的[cock]在她的体内进进出出。没过多久，可怜的火蜥蜴的舌头就从嘴里耷拉下来，她的眼睛也变成了斗鸡眼，被你狂暴的攻击和在她屁眼周围蠕动的粗大尾巴带来的快感所淹没。");
         outputText("[pg]一个特别残忍的想法闪过你的脑海。你绕过赫尔，抓住奇哈的手臂。在龙女抗议之前，你把她的手臂充满爱意地缠在赫尔的腰上，把火蜥蜴失去知觉的脸推到她的大胸之间，迫使奇哈在你们俩操她的时候温柔地拥抱赫尔。愤怒的奇哈立刻试图移动她的手臂，但赫尔恰好在那个时刻迎来了剧烈的高潮，把她的尾巴狠狠地插进奇哈的小穴，完全填满了她松弛的洞。龙女大叫起来，紧紧抓住赫尔的背，用力到足以抓伤她红色的鳞片，但你几乎无法注意到她，因为包裹着你肉棒的湿滑肉洞拼命地试图通过赫尔的高潮来榨取你的肉棒，挤压和压榨着你的长度，直到你被迫拔出来，以免你也射出来。");
         outputText("[pg]你把你沾满精液的[cock]从赫尔颤抖的小穴里拔出来，把她从龙女身上滚开。你色眯眯地看着奇哈，但随着赫尔痉挛的尾巴在她的裂缝里抽打，她几乎没有注意到你——她太忙于拼命忍住她快乐的呻吟，试图维持她不情愿的伪装。利用她无助的状态，你抓住奇哈的腿，把它们搭在你的肩膀上，把她的腿和她大屁股的脸颊漂亮地分开。");
         outputText("[pg]你咧嘴笑着，挪动身体，直到你的龟头对准了龙女屁眼那紧致、暗色的圆环。你的龟头刷过她的括约肌的压力足以让奇哈从她的幻想中清醒过来，但要帮她已经太晚了。当你插进去的时候，她只能仰起头尖叫，把自己埋在");
         if(get_player().cockArea(0) < 36)
         {
            outputText("直到没柄");
         }
         else
         {
            outputText("直到她再也无法承受你的任何东西，她的肛门已经被拉伸到了极限");
         }
         outputText("。抓住她大而柔软的乳房，你开始从她体内拔出，蹂躏她的乳头，深深地陷入她敏感的乳肉中，当你把你的肉棒拔出，直到只有龟头留在她体内。");
         outputText("[pg]带着一丝坏笑，你用一次强有力的挺动猛地插回她体内。当你撞进她的屁眼时，龙女尖叫起来，残忍地操着她的屁股，直到她再也无法忍受她的哭喊和呻吟。她开始像个妓女一样呻吟，用淫荡的呻吟或捏自己的乳头来配合你的每一次挺动。她甚至抓住了仍然埋在她体内的赫尔的尾巴，开始用它自慰，当你操她的时候，她的快乐翻倍了。");
         outputText("[pg]她紧得令人愉悦，她的肛门壁紧紧地夹住你，在每一次挺动中榨取你，直到她的内脏完全被你浓稠的前列腺液浸透。当一次偏离的挺动让你的一点温暖的白色前列腺液逃脱，顺着她的屁股脸颊滴落，汇聚在她的双腿下时，奇哈喘息着。现在，随着你的每一次挺动，她开始紧紧地夹住你的[cock]，她的快乐开始淹没她。你笑着提醒她，她已经变成了一个多么荡妇，当她用陌生人的尾巴操自己，而你猛击她的屁眼直到你的精液漏出来时，她尖叫着她的快乐。");
         outputText("[pg]奇哈甚至只试图拒绝你一瞬间，然后赫尔轻笑着，把她尾巴的尖端在龙女的小穴里扭动。奇哈仰起头高潮了，尖叫着，她被塞满的洞在你的肉棒和赫尔的尾巴上剧烈收缩。你高兴地注意到，奇哈自己的尾巴仍然埋在赫尔的屁眼里，并开始疯狂地抽打。火蜥蜴在惊慌失措的快乐中大叫，不知不觉中她又高潮了，当奇哈用尾巴操她的屁股时，她用手指抠着自己。看着两个女孩一起高潮，以及奇哈对你自己的阴茎的肛门收缩，终于淹没了你。");
         outputText("[pg]伴随着一声愉悦的咕噜声，你猛地撞进奇哈体内并射精，把你的精液深深地射进龙女的肠道里");
         if(get_player().cumQ() >= 1000)
         {
            outputText("把她填得如此之满，以至于你的精液从她的屁眼里绕着你的肉棒喷了出来");
         }
         outputText("。你做了最后几次微弱的挺动，度过了你的高潮，直到奇哈和赫尔终于平静下来，你自己的[cock]只在奇哈的屁股里滴下微弱的精液。");
         outputText("[pg]你虚弱地笑着，因为你努力支配这两个火热的红发女郎而筋疲力尽，你从奇哈的直肠里拔出来，看着精液从她被拉伸的屁股里喷涌而出。你在她的腿上轻轻拍了一下，然后从龙女身上解开自己。你停下来，在赫尔和奇哈的嘴唇上都快速地吻了一下，然后抓起你的装备，摇摇晃晃地走向营地，留下女孩们在浑浊的沼泽里自己整理。");
         get_player().orgasm("Dick");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function itsGood() : void
      {
         clearOutput();
         outputText("你对奇哈眨了眨眼，告诉她这很棒。当你解释你对这块快速烹制的肉那精致的木熏质地和令人愉悦的多汁感感到高兴时，她露出了一个大大的、傻乎乎的笑容。奇哈把你的赞美记在心里，宣称：[say:当-当然好吃；就凭这是</i>我<i>做的，这就很明显了！]");
         outputText("[pg]你和这位漂亮的龙女一起大笑，她抓起一条肉狼吞虎咽地吃了起来。现在没有了拘束，你们俩开始大吃特吃，很快就吃光了奇哈的[say:家常菜。]当你们吃完时，由于没有餐具，你们俩都弄得油腻腻的，你的手指和她的爪子上沾满了肉汁和脂肪。你们互相取笑对方的模样。");
         get_player().refillHunger(60);
         outputText("[pg]你站起来，试图擦掉手指上的一点油脂，突然你被猛地推倒在奇哈的草窝上。龙女跨坐在你身上，咧嘴笑着，开始脱掉你的[armorName]。[say:别以为我会让你就这么走出去，而不感谢我这顿饭，]她充满欲望地咆哮着，滚烫的肉体紧贴着你。");
         kihaAffection(5);
         kihaSexMenu(false,false);
      }
      
      public function inviteKihaForDickings() : void
      {
         clearOutput();
         outputText("你靠在一棵树上，问这位高傲的龙女是否愿意来你的营地……也许还能住上一阵子。她停下来思考了片刻，在消化这个好消息时，双手紧张地攥紧了。她回头看向你，眼睛亮了起来，脸庞扬起，欢呼道：[say: 真的吗！？]");
         outputText("[pg]你点点头，握住她的手向她保证：[say: 真的。搬来和我一起住吧，奇哈。]");
         outputText("[pg]这个爬虫类女人紧张地咳嗽了一声，试图挽回她那所剩无几的高傲外表，说道：[say: 我……呃，我是说，我想可以吧，只要你没把那里弄得一团糟。] 她说话时，那垂直的竖瞳似乎闪烁着愉悦的光芒，虽然你能看出她不是认真的，但在提出这么重要的邀请后，你也不太想计较她的冒犯。");
         outputText("[pg]你保持着轻松的反击，但带着一丝严肃，这应该能让她乱了阵脚，从而得到一个清晰、真实的回答。[say: 你知道的，如果你不想来，也不必勉强。]");
         outputText("[pg]奇哈停了下来，深色的皮肤变得苍白，看起来就像是她过去的影子。泪水在她的眼角打转，她努力忍住不哭，但她坚硬外表上的裂痕却从内到外不断扩大。她回头看着你，眼中带着一丝愤怒和挑衅，但她无法忽视，也无法隐藏她内心的真实感受。奇哈的脸庞变得生动起来，她打破了情感的面具，泪水不受控制地顺着脸颊流下。她给了你一个令人窒息的熊抱，紧紧地抱住你，就像溺水的人抓住浮木一样。她的话语出人意料，却又发自肺腑。");
         outputText("[pg][say: 不……[name]，我……对不起。我很乐意去看看你的营地，] 她一边说，一边在你的肩膀上蹭去泪水。她停顿了一下，依然紧紧抱着你，向你低语：[say: 请不要留我一个人……我-我……我爱你。] 当她坦白自己的感情时，你温柔地抚摸着她红宝石般的头发，[say: 我本该早点告诉你的——我差点就说了。在这里要信任任何人真的太难了，太难了。我是说……我被毁了……恶魔们在很多方面都摧毁了我。我甚至都不知道自己是谁，而你……你却忍受了我的糟糕脾气。你和我拼死搏斗，但你并没有因此记恨我。你不断地回来，从不让我独自绝望。我爱你，[name]，你可别忘了这一点。]");
         outputText("[pg]奇哈轻轻地抽泣着，继续说道：[say: 我甚至有点同情莉希丝，居然有你这样的敌人。帮我个忙，当你找到她的时候，替我狠狠踢她的烂逼，好吗？] 你们俩听到这话都紧张地笑了笑，然后慢慢结束了拥抱。你轻轻擦去她的一滴眼泪，建议道：[say: 走吧，我们把你的东西搬过去，让你安顿下来。] 奇哈的尾巴高兴地摇摆着，你们俩开始收拾她的东西。");
         outputText("[pg]<b>(奇哈作为恋人加入了你的营地！)</b>");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,428,1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function hugFriendWarmKiha() : void
      {
         clearOutput();
         get_images().showImage("kiha-hug");
         outputText("你带着一丝坏笑，出其不意地紧紧抱住了奇哈！");
         outputText("[pg][say: 什……你在干什么……]她结结巴巴地说，但很快就安静下来，最后嘟囔了一句[say: 笨蛋。]");
         outputText("[pg]你对她令人安心的温暖并不感到惊讶，但当你用双臂环抱住奇哈时，她出奇地柔软。当你把龙女紧贴在自己身上时，她那光滑、部分覆盖着鳞片的皮肤很容易就陷了下去。然而，最让你震惊的是，过了好一会儿，奇哈叹了口气，也用她肌肉发达的双臂抱住了你。");
         outputText("[pg]这平静、友好的拥抱只持续了几秒钟，奇哈就突然猛烈地把你推开了。[say: 你以为你在干什么，笨蛋！]她大喊着，没等你回应就腾空而起飞走了。");
         outputText("[pg]你摇了摇头，回到了营地。");
         kihaAffection(5);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function helpKihaAgainstSpoidahs() : void
      {
         clearOutput();
         outputText("看着被击败的龙女和那群即将——往好了说——轮奸她的蜘蛛人，你弯下腰，向奇哈伸出了一只手。[pg]");
         outputText("[say: 你……你以为你在干什么，[name]？]她厉声说道，向后退缩。[say: 我叫你跑！][pg]");
         outputText("你再次招手，用尽可能严肃的眼神看着她，说道：[say: 想活命就跟我走。][pg]");
         outputText("[say: 什……什么！？]她问道，对你的坚持感到完全哑口无言。因为没有时间");
         if(get_player().cor >= 66)
         {
            outputText("把逻辑打进");
         }
         else
         {
            outputText("把逻辑说进");
         }
         outputText("她迟钝的脑袋里，你干脆把奇哈拉起来，把斧头扔给她，然后转身面对冲过来的敌人。[pg]");
         startCombat(new SpiderMorphMob());
         get_player().HPChange(100,false);
         get_player().changeFatigue(-30);
         dynStats(DynStat.Lust(-40));
      }
      
      public function hangOutWithKiha() : void
      {
         clearOutput();
         var _loc1_:Number = Utils.rand(3);
         if(_loc1_ == 0)
         {
            get_images().showImage("kiha-follower-hangout-walkabout");
            outputText("你微笑着向这位龙女伸出手臂，问她是否愿意去散散步。她对这个建议似乎相当惊讶，补充说考虑到所有情况，这相当平淡；但是，在稍微催促了一下之后，你们很快就挽着手臂走在了一起");
            if(!followerKiha())
            {
               outputText("穿过沼泽茂密的植被");
            }
            else
            {
               outputText("回到她在沼泽里的旧居");
            }
            outputText("。");
            outputText("[pg]你们一边走一边互相戏弄和玩耍，偶尔冒险去摸摸奇哈的大腿或脸颊，或者在她说了一个特别刻薄的双关语后，用尾巴抽你的[butt]时紧张起来。不过，你们俩一直都在笑——奇哈对你的理想主义或莫名其妙的冒险感到乐不可支，而你则忍不住翻白眼，对她那早已崩塌的残忍和力量的伪装轻笑。");
            outputText("[pg]然而，在愉快地走了大约二十分钟后，你们平静的漫步被上方突然传来的一阵幽灵般的咯咯笑声打断了，一只蛛化精灵从树冠上降了下来。这个蜘蛛婊子色眯眯地看着你们，一根恶魔般的肉棒和产卵管已经勃起，准备让一些容易得手的猎物怀孕。你准备好你的[weaponName]准备战斗，但还没等你行动，奇哈就从地上扑了出去。伴随着一声咆哮，你的龙女爱人喷出一团火焰，将支撑蛛化精灵的蛛网焚烧殆尽；怪物发出一声无助的尖叫，摔倒在地上，被撞晕了过去。");
            outputText("[pg]奇哈降落在你身边，重重地倚靠在她那把燃烧的巨斧上。[say: 别担心，笨蛋，]她说着，伸出手调皮地揉了揉你的头发。[say: 只要奇哈在，你什么都不用担心。]突然，她转向整个森林咆哮道：[say: 你们听到了吗，怪物们——这个是我的！我的！所以把手拿开，否则你们就得面对我，明白了吗？]");
            outputText("[pg]当她吹嘘要保护她的伴侣免受这个领域邪恶怪物的伤害时，你忍不住咧嘴笑了。你知道你本可以轻松击败那只蛛化精灵，但你让奇哈享受了这一刻——当她保护你时，她真的很可爱。不过，在她开始长篇大论之前，你抓住了这位龙女，把她拉进了一个紧紧的拥抱。她发出一声短促的喘息，但当你把嘴唇印在她的嘴唇上时，她完全融化在你的怀里。");
            outputText("[pg][saystart]你……");
            if(get_player().get_tallness() >= 72)
            {
               outputText("大");
            }
            else
            {
               outputText("小");
            }
            outputText("笨蛋，[sayend]当你终于结束这个吻时，她呜咽着说道。你温柔地抚摸着她的脸颊，感谢她[say: 保护]了你。几分钟后，");
            if(!followerKiha())
            {
               outputText("你回到了奇哈的小岛上，向飞回家的龙女挥手告别，然后你向营地走去");
            }
            else
            {
               outputText("你们又挽着手臂，一起回家了");
            }
            outputText("。");
         }
         else
         {
            if(_loc1_ == 1 && saveContent.badCookingTasted < 3)
            {
               get_images().showImage("kiha-follower-hangout-dinner");
               outputText("你在脑海中搜寻着你和奇哈可以一起做的事情，但龙女却出人意料地说道：[say:那个，呃，[name]。我正准备吃东西……如-如果你想的话，我准备了两人份的。]你微笑着告诉她那太好了，谢谢你。她尴尬地回以微笑，显然不习惯和别人一起吃饭。");
               if(!get_player().canFly())
               {
                  outputText("她用双臂环抱住你，腾空而起，穿过她巢穴的屋顶入口飞了进去");
               }
               else
               {
                  outputText("向你伸出一只手，你们俩一起飞向并穿过她巢穴的屋顶入口");
               }
               outputText("。");
               outputText("[pg]奇哈的小巢穴至少可以说是简陋的——墙壁由活树干制成，地面是硬实的泥土，一圈看起来像平原高草的东西构成了她的床。她只有一块小木板平衡在四块石头上作为桌子，上面公然放着一块生肉（也许是野猪的大腿？）。她让你坐下，挥舞着锋利的爪子，开始为你切肉，以弥补她没有餐具的不足。");
               outputText("[pg]你开始怀疑她是否期望你生吃……不管那是什么……但龙女打断了你的话，她向后仰起身子，对着那块神秘的肉喷出一团火焰，瞬间将其烤熟，并烧焦了你脸上的毛发。当你摆脱她那爆炸性火焰吐息的影响时，她发出一阵豪爽的笑声，但你不得不承认这很有效：你的晚餐现在是一堆五分熟的肉条，适合食用了。");
               outputText("[pg]奇哈对自己的手艺很满意，坐在你对面。她盯着你看了好一会儿，目光在你和面前冒烟的肉之间快速扫视。显然，她想让你吃第一口。你小心翼翼地拿起一条油腻的肉，看着奇哈期待的眼睛，把它塞进嘴里。");
               outputText("[pg][say:那-那个？很好吃……对吧？]");
               outputText("[pg]你试探性地咀嚼了几下这块有嚼劲但多汁的肉，然后给出了你的回答：");
               menu();
               addButton(0,"很好吃",itsGood).hint("肉很美味。告诉奇哈肉很棒。");
               addButton(1,"呸",blechKihaYourCooking).hint("肉太恶心了！把它扔掉，去打些野猪。");
               return;
            }
            get_images().showImage("kiha-follower-hangout-stargazing");
            if(!followerKiha())
            {
               outputText("从龙女身上抬起头看向树冠，你注意到奇哈的小岛上方有一片令人惊讶的宽敞空地——这可能就是龙女最初选择在这里安家的原因，因为这样更容易起飞和降落，而不会每次都被树枝撞到。你注意到");
               if(get_game().time.hours < 21)
               {
                  outputText("你上方是一个特别多云的日子，巨大的粉色和紫色云朵在被恶魔污染的地平线上飘荡");
               }
               else
               {
                  outputText("星星出来了，天空中有一千个小针眼");
               }
               outputText("。");
            }
            else
            {
               outputText("从你的龙女情人身上抬起头，你注意到");
               if(get_game().time.hours < 21)
               {
                  outputText("营地周围特别晴朗的白天——厚厚的粉色和紫色云朵在荒原上慵懒地翻滚，在传送门巨大的深渊后面闪烁");
               }
               else
               {
                  outputText("荒原上特别晴朗的夜晚。星星出来了，就像在玛瑞斯你所在区域的夜晚一样，天空中有一千个小针眼");
               }
               outputText("。");
            }
            outputText("[pg]有你的龙女朋友在身边，原本可能只是一个普通的");
            if(get_game().time.hours < 21)
            {
               outputText("白天");
            }
            else
            {
               outputText("夜晚");
            }
            outputText("似乎突然变得浪漫起来。你带着顽皮的笑容，用一只手臂搂住奇哈柔软的腰肢，指着天空，让她看");
            if(get_game().time.hours < 21)
            {
               outputText("云朵");
            }
            else
            {
               outputText("星星");
            }
            outputText("。龙女按照你的要求，顺着你手指的方向看向天空。");
            outputText("[pg][say:嘿，]她说着，依偎在你的怀里。[say:我记得你不久前说过的话，在我……当你和我第一次仰望天空的时候。我一直在想你说的话，笨蛋。你有时很蠢……但你没说错。]");
            outputText("[pg]奇哈对你咧嘴一笑——不知不觉中，你已经躺在地上，被龙女强壮的双臂紧紧抱住，脸贴在她柔软、暗色的双峰之间。你在她的怀抱中扭动了一下，然后安顿下来，依偎在你的情人身边，和她一起凝视着天空。奇哈紧紧抱着你，下巴靠在你的头顶上，偶尔用她长满鳞片的手指穿过你的[hair]，或者用她长而灵活的尾巴拂过你的大腿。你沐浴在她的温暖中，一种柔和的光芒传遍你的全身；你把脸颊蹭进她柔软的胸膛，目光从天空转移到抱着你的美丽女人身上。");
            outputText("[pg]奇哈似乎盯着你看了很久。当你们的目光相遇时，她对你微笑，她的手最后一次穿过你的头发。[saystart]哦，你这个");
            if(get_player().get_tallness() >= 72)
            {
               outputText("大");
            }
            else
            {
               outputText("小");
            }
            outputText("笨蛋。别就这么躺着，[sayend]她笑着说。还没等你动弹，奇哈就俯下身，把嘴唇贴在你的嘴唇上，把你拉进一个漫长而充满爱意的吻中。她长长的爬行动物舌头轻轻地压在你的嘴唇上，滑进去与你的舌头交缠。你们躺在一起很久，拥抱、亲吻、互相嬉戏。");
            outputText("[pg]在你龙族情人的怀抱中，时间似乎失去了意义，但最终你知道你必须离开——暂时。你给了她另一个长长的吻，从奇哈丰满的胸膛中起身，向她道别。");
            outputText("[pg]当你从她的怀抱中挣脱出来时，奇哈给了你一个苦笑。[say:我很快就会见到你的……笨蛋。]");
         }
         doNext(get_camp().returnToCampUseOneHour);
         kihaAffection(5);
      }
      
      public function guardMyCampKiha() : void
      {
         var _g:KihaFollowerScene;
         clearOutput();
         if(get_camp().isGuard("Kiha"))
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,982,0);
            outputText("你告诉奇哈你不想让她晚上再守卫营地了。");
            outputText("[pg][say:听着，笨蛋，如果你想醒来时发现小恶魔的肉棒插进你屁股里那么深，深到你都能尝到精液的味道，那是你的决定。如果他们中任何一个靠近我，我还是会杀了他们，]奇哈警告完便大步走开了。");
         }
         else
         {
            outputText("你问奇哈是否介意在晚上守夜。");
            outputText("[pg][say:所以你想让我把任何靠得太近的恶魔劈成两半？]奇哈问。[pg]你点点头。[pg][say:好吧，我想我可以，既然你这么客气地请求了。]她深情地揉了揉你的[hair]。");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,982,1);
         }
         menu();
         _g = this;
         addButton(0,"下一步",function():void
         {
            _g.warmLoverKihaIntro();
         });
      }
      
      public function giveKihaUndergarmentsPrompt() : void
      {
         var _g2:KihaFollowerScene;
         var type1:int;
         var _g1:KihaFollowerScene;
         var type:int;
         var _g:KihaFollowerScene;
         var _loc1_:* = null as Function;
         clearOutput();
         outputText("你问奇哈是否愿意穿点什么来遮挡她的下半身。毕竟她也需要一点端庄。");
         outputText("[pg][say:所以你想让我穿点什么，笨蛋？好吧。]");
         outputText("[pg]<b>你要给她什么？</b>");
         menu();
         if(get_player().hasItem(get_undergarments().SSPANTY))
         {
            _g = this;
            type = 1;
            _loc1_ = function():void
            {
               _g.giveKihaUndergarments(type);
            };
            addButton(0,get_undergarments().SSPANTY.get_shortName(),_loc1_);
         }
         if(get_player().hasItem(get_undergarments().SS_LOIN))
         {
            _g1 = this;
            type1 = 2;
            _loc1_ = function():void
            {
               _g1.giveKihaUndergarments(type1);
            };
            addButton(1,get_undergarments().SS_LOIN.get_shortName(),_loc1_);
         }
         _g2 = this;
         addButton(4,"算了",function():void
         {
            _g2.warmLoverKihaIntro();
         });
      }
      
      public function giveKihaUndergarments(param1:int) : void
      {
         var _g:KihaFollowerScene;
         clearOutput();
         outputText("你告诉奇哈你有东西要给她。她双臂交叉抱在胸前，一只脚在地上敲打着。");
         if(param1 == 1)
         {
            outputText("[pg]你从你的[inv]中拿出一件蛛丝内裤递给奇哈。她咆哮着说：[say:你指望我穿那个，笨蛋？]");
            outputText("[pg]你告诉奇哈她穿上会有多性感。她当然很性感，" + (get_silly() ? "但让我们把她的性感程度提升到十一级" : "但让我们让她更性感") + "！她犹豫地从你手中接过内裤，穿上了这条白色的内裤。它很好地突出了她的臀部曲线，在她的阴道处形成了一块潮湿的斑块。");
            get_player().consumeItem(get_undergarments().SSPANTY,1);
         }
         if(param1 == 2)
         {
            outputText("[pg]你从你的[inv]中拿出一件蛛丝缠腰布递给奇哈。她咆哮着说：[say:你指望我穿那个，笨蛋？]");
            outputText("[pg]你告诉奇哈她穿上会有多性感。她当然很性感，" + (get_silly() ? "但让我们把她的性感程度提升到十一级" : "但让我们让她更性感") + "！她犹豫地从你手中接过缠腰布，穿上了这条白色的缠腰布。它很好地突出了她的臀部曲线，在她的阴道处形成了一块潮湿的斑块。");
            get_player().consumeItem(get_undergarments().SS_LOIN,1);
         }
         outputText("[pg][say:我看起来怎么样？]奇哈问。你承认她非常性感，你发誓你能看到她脸上的红晕。你用双臂环抱住奇哈，在她的脸颊上印下深情的一吻，同时将你" + get_player().clothedOrNakedLower("穿着衣服的","赤裸的") + "胯部摩擦着她被丝绸覆盖的腹股沟。[say:别停下来，我的白痴！]奇哈轻笑着。你微笑着结束了拥抱和亲吻。");
         dynStats(DynStat.Lust(30));
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2191,param1);
         _g = this;
         doNext(function():void
         {
            _g.warmLoverKihaIntro();
         });
      }
      
      public function giveKihaIncubusDraft() : void
      {
         clearOutput();
         get_images().showImage("kiha-follower-sex-incubidraft");
         outputText("一个特别邪恶的想法闪过你的脑海。你微笑着靠近你的龙族情人，但装出惊恐的样子，指着她的肩膀大喊[say:嘿，那是什么！？！？]奇哈抓起她的斧头，转过身去，给了你足够的时间从你的[inv]里拿出一瓶男魅魔药剂并拔掉软木塞。当奇哈气呼呼地转过身来时，你已经准备好了。你抓住她的嘴，把药剂灌进去，捏住她的鼻子，让她别无选择，只能吞下去。");
         outputText("[pg]奇哈踉跄着后退，扔下了她的巨斧，捂着肚子，药剂在她的体内翻滚。你咧嘴一笑，一股淫水突然从她赤裸的小穴中喷涌而出，紧接着她湿透的阴部上方的一块肉突然抽搐并变移。[say:你……你给我吃了什么，[name]？你……你这个白痴！]她尖叫着，腹股沟上方的皮肤猛烈地裂开，一根又长又硬、类似人类的肉棒破茧而出，暴露在光天化日之下。奇哈发出一声愉悦的哀嚎，她新形成的肉棒成型了，已经将大团白色的精液喷射到她的大腿和双腿上。她的双腿一软，奇哈瘫倒在地，扭动着身体，她那根新的肉棒在她曾经强壮的双腿之间抽搐和痉挛着。");
         outputText("[pg]趁着龙女处于晕眩状态，你轻轻地把她推倒仰面躺下，跨坐在她身上，慢慢地脱下你的[armor]。你低头看着奇哈，咧嘴笑着问她喜不喜欢你的小礼物。她咕哝了一声，涨红了脸，转过头去……尽管她的肉棒微微抽搐了一下，导致另一团粘稠的精液从她身上滴落。你握住她的新肉棒，手掌顺着它八英寸的长度滑动，用她自己的精液涂抹她的肉棒。奇哈在你的触摸下喘息和呻吟着，她刚才的高潮让她太敏感了，甚至无法回应你的嘲笑。");
         outputText("[pg]你开始为她手淫，越来越快、越来越用力地套弄她的肉棒，将她第一次高潮的精华涂抹在她的肉体上作为润滑剂。奇哈被她新肉棒的原始敏感度所淹没，除了屈服并在你的掌控中扭动臀部之外，她无能为力，试图从你的每一次抽插中榨取更多的快感——尽管你很快就制止了这一点。");
         outputText("[pg][say:啊啊啊！你……你到底想干嘛，嗯？你在做什——么？]奇哈呜咽着，在你的掌控中扭动着。你在她的乳房上轻轻拍了一下，在她深色的皮肤上留下了一个红色的手印。不，这次由你来控制。奇哈喜欢认为她才是掌控者，但你要向她展示到底谁才是这里发号施令（射精）的人。");
         outputText("[pg]你加快了动作，给龙女手淫，直到她的前列腺液大量流到你的手中。她咕哝着，眼睛几乎要对上了，准备高潮……你把手拿开，留下她的肉棒在空气中赤裸而孤独地摇晃。奇哈呜咽着，但你阻止了她绝望地想要触摸自己的努力，直到从她新器官中漏出的前列腺液停止流淌。她以前可能很无助，但奇哈现在的眼神表明，她正在积极地乞求你给她释放。好吧，你想你可以满足她……");
         outputText("[pg]你转移到龙女的上方，蹲下来，让你[asshole]的环轻轻地吻上奇哈肉棒的顶端。你们俩都喘息着，当她润滑良好的顶端压入你体内时，你们被一阵电流般的快感连接了一秒钟。[say:来吧，[name]，]她恳求道，水汪汪的红眼睛盯着你，[say:给……给我……求你了……]你残忍地拒绝了，而是将臀部在一个宽阔、慵懒的圆圈中移动，慢慢地只让她的一英寸滑入你的");
         if(get_player().ass.analLooseness < 3)
         {
            outputText("紧致的");
         }
         else if(get_player().ass.analLooseness < 4)
         {
            outputText("热情的");
         }
         else
         {
            outputText("松弛的");
         }
         outputText("通道里。奇哈呜咽着呻吟，直到你终于心软滑落下去，将她粗壮的肉棒吞入你的后庭。");
         get_player().buttChange(14,true,true,false);
         outputText("你的爱人尖叫着，冲向高潮——直到你完全停住，让你的[butt]紧贴着她的大腿。你放松了肛门肌肉，小心翼翼地不给紧紧塞在体内的肉棒任何额外的刺激。在快感的驱使下变得过于顺从的奇哈甚至无法试图违抗你的意愿，只能躺在她的精液和爱液中，祈求着你的怜悯。");
         outputText("[pg]你宽宏大量地答应了她的请求。一旦她从高潮的边缘平静下来，你便开始在她的肉棒上起伏，慢慢地在她的龙根上弹跳。你松开她的手，咧嘴笑着看它们立刻冲向你的臀部，试图——但失败了——加快你的节奏。奇哈喘息着，将她的臀部推向你，不过你用力捏了一下她的乳头，制止了她的动作。");
         if(get_silly())
         {
            outputText("这是你的游戏，你提醒她：你控制着水平和垂直的方向。");
         }
         outputText("每次她绝望地试图移动，强迫你加快速度时，你都会完全停下来，用这种方式诱惑她屈服。");
         outputText("[pg]不过，最终，即使是你最轻微的触碰也开始让奇哈的脊背发抖。龙女在你身下扭动，咬紧牙关，一股股前列腺液自由地流入你的肠道，进一步用她的龙精涂抹你的肠壁。你对着这个被快感逼疯的龙女坏笑，终于低声说道，[say: 我想你已经受够了。射吧。]");
         outputText("[pg]她射了。");
         outputText("[pg]奇哈咆哮着，将她的肉棒向上推入你的后庭，而你则重重地压在她身上，在半路相遇，第一股巨大、滚烫的龙精射入了你的后庭。你用你的[asshole]摩擦着你爱人的爬虫类肉棒，挤出一股又一股的龙精，直到白色的精液从你的后庭自由地流出，涂满了你身下的地面。");
         outputText("[pg]当奇哈的高潮消退时，你们俩都沾满了她滚烫的白色精液，散发着性爱、汗水和精液的恶臭。你因为后庭里黏糊糊的感觉而发抖，从你爱人的身上爬下来，她的肉棒伴随着湿润的“啵”的一声从你体内拔出。低头看着她，你看到奇哈斗鸡眼，胸口起伏；她嘴里嘟囔着什么她藏起来的粉色蛋，但似乎除此之外已经失去了知觉。你最后充满爱意地拍了拍她即将消失的肉棒，然后收拾好你的[armorName]离开了。");
         dynStats(DynStat.Sens(4),DynStat.Lust(30),DynStat.Cor(0.5));
         get_player().orgasm("Anal");
         if(get_player().hasItem(get_consumables().P_DRAFT))
         {
            get_player().consumeItem(get_consumables().P_DRAFT);
         }
         else
         {
            get_player().consumeItem(get_consumables().INCUBID);
            dynStats(DynStat.Cor(2));
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function ghostboobiesKiha() : void
      {
         clearOutput();
         outputText("奇哈的目光在你伸出的手中的注射器和你急切的脸庞之间游移，她似乎在努力克制自己不一拳打在你的脸上。[say: “Gro+”？] 她难以置信地重复道，尾巴烦躁地甩动着。[say: 你到底打算用那东西干什么？]");
         outputText("[pg]你并没有被她意料之中的反应所困扰，而是尽力解释你是怎么得到这东西的。注意到她没有回应，你把话题转移到了性上，以及有了它的帮助，性爱可能会变得多么有趣。奇哈失望地摇了摇头，低吼了一声转过身去。她甚至没有拒绝你的提议就走开了，把你和你的生长血清针管留在了她的身后。");
         if(!get_player().hasPerk(PerkLib.Incorporeality))
         {
            outputText("[pg]你失望地摇了摇头，拖着步子走开了，叹了口气，把Gro+放回了你的[inv]里。也许总有一天用得上。");
            doNext(playerMenu);
            return;
         }
         outputText("[pg]然而，你并没有那么容易被打败。你深入自己的内心，调动你与生俱来的幽灵力量，你的身形迅速闪烁并变得半透明。你像耳语般轻柔地移动，飘到这位高傲的龙女身后，直接钻进了她的背部。[say: 噢，见鬼，不行，] 她尖叫着，抓挠着自己的背，徒劳地试图把你拽出来。当你完全适应了你这个全新且令人愉悦的摇晃躯体时，她还在继续暴走了一会儿。");
         outputText("[pg]即使你控制了她的四肢——主要是为了阻止她弄坏什么重要的东西——她依然在对你破口大骂，在你夺走她嘴巴的控制权后，她转而在脑海中用心电感应咒骂你。你把她推回她脑海中令人惊讶的深邃角落，瞥了一眼掉落的Gro+。当你弯腰捡起那东西时，你那恶作剧般的坏笑在她的脸上浮现。当你托起她那尺寸可观——但还远远不够大——的乳房时，她愤怒的叫喊变成了惊恐的恳求，你稳住手，犹豫了片刻。");
         outputText("[pg]针头扎了进去，冰冷的金属让奇哈的身体微微颤抖。按下推杆不到五秒钟，第一次不祥的刺痛感就传来了。你再次丢下半空的管子，满怀期待地双手抓住了奇哈的胸部。你的手指被她慢慢膨胀的乳肉强行撑开的感觉简直太棒了……但是……只有一边。你低头看着，带着一丝恐惧和着迷的混合情绪，看着她那被鳞片包围的乳房中只有一个膨胀起来，而另一个却毫无动静。[say: 停-停下！搞什么鬼！？] 奇哈在脑海中尖叫，对她突然变得不对称的尺寸完全无法做出任何反应。");
         outputText("[pg]当你把双手都集中在她那超大的F罩杯上时，奇哈的抗议很快变成了难以掩饰的愉悦喘息，这淫荡的奶子在充血状态下感觉太好了，让你激动得双膝发软。当你揉捏着这团肉，探索她新扩展的每一寸肌肤时，她那令人惊讶的柔软皮肤在纤细的手指下屈服了。你的摆弄几乎让她忘记了自己的窘境……几乎。[say: 喂喂，喂！处理一下这个！] 奇哈要求道，你的一只手颤抖着，因为她正试图用一种新奇的方式指向她另一个未改变的乳房。[say: 你不会就打算……把我留成这样吧？]");
         outputText("[pg]你沉默地坐了好一会儿，每隔几秒钟就轻轻捏一下乳房来打破沉默。[say: ……怎么说？] 她终于气呼呼地问道。又过了几秒钟，她的愤怒不断增加。[say: 把它弄好！]");
         outputText("[pg]违背着自己的意愿和所有的精神力量，奇哈缓缓地摇了摇头。你弯下腰，将注射器重新捡起，用针尖轻轻敲击着她那更为丰满的部位，以此作为明确的警告：粗鲁对她没有任何好处。[say: 你不会的，]她轻声说道，金属触碰到她的乳房，再次提醒着她目前的处境。你耸了耸肩，向她解释了对关心的人保持礼貌的价值。");
         outputText("[pg][say: ……请把我的——嗯——另一个胸变大，]她嘟囔着，在你再次把玩她那巨大的肉球时，努力地组织着语言。[say: 拜托……]你责备她这毫无诚意的请求，用小指在她的乳晕上画圈作为惩罚。[say: 我……求、求你……]");
         outputText("[pg]可怜的女孩几乎无法思考了！完美。将 Gro+ 转移到她的牙齿间咬住，留出一只手来托起那沉重的乳房，她空出的手则顺着身体滑向了她那已经泛滥成灾的下体。[say: 停、停下！不要！]她尖叫着，在你的控制下挣扎着。太迟了；她的三根手指已经探入了她的私处，随着你的深入，通道被撑开。[say: 把我的胸变大！]奇哈尖叫着，被别人控制着自慰带来的混乱快感搅乱了思绪。[say: 拜托！我想要！我喜欢大胸！操！]");
         outputText("[pg]这正是你所期待的。慢——慢地从她的小穴中抽出，甚至懒得弹掉手指上多余的淫液，你抓起 Gro+，顺畅地将剩下的血清注射进她另一个被冷落的乳房中。当那颗肉球开始膨胀时，她的狂喜几乎将你击倒，化作巨大而压倒性的情欲浪潮喷涌而出。不知不觉中，你已经仰面躺倒，你和奇哈（在不断地控制四肢和失去控制的循环中）抓挠、揉捏、摩擦着奇哈身体上任何感觉良好的部位，因为你的龙女的满足感将她的敏感度提升到了更高的水平。");
         outputText("[pg]就像拉开一张沉重的弓，奇哈的背部随着高潮的迅速逼近而弓起，她那肌肉发达的大屁股直接离开了地面。她试图表达任何想法的努力，都仅仅化作了你们俩在地上翻滚时的咕噜声和呻吟声，你们沉重的——终于一样大的——乳房在地上、在她的手臂上、在它们自己身上挤压着……天哪；要是自慰总能感觉这么好就好了！你断定，没有什么比操弄别人的心智更爽的了。");
         outputText("[pg]不知什么时候，奇哈似乎翻身趴下了，屁股翘在充满情欲的空气中，膝盖蜷缩到躯干上。她那充满弹性的臀部剧烈抽动的样子，对任何碰巧瞥见她的男人、女人或野兽来说，都是一个明确的邀请。手臂仍在她全身游走，试图同时取悦她的每一个部位，这个可怜的过度敏感的龙女似乎把她的情欲传染给了你。你愉快地将她的乳房更用力地压在地上，完全卷入了这场情欲的台风中。");
         outputText("[pg]当高潮的颤栗席卷你的全身时，她的整个身体都紧绷起来，你们俩都在咆哮着宣泄快感。当你继续抚摸着她发炎的阴唇时，半透明的淫液从她的指缝间喷涌而出。奇哈瘫倒在一侧，随着高潮的消退而颤抖着。她又躺了几分钟，享受着流经全身的近乎触电般的余韵。然而，还没等她站起来，她就已经睡着了，蜷缩着身子，把膝盖压在她那过大的胸部上。你把这当作离开的信号，将你幽灵般的精华从她的背部扭动出来，在她的身后重新凝聚成形。");
         outputText("[pg]情欲已尽，好奇心也得到了满足，你跨过奇哈走了过去。回头瞥了一眼，你注意到她的胸部已经缩小了一点点。你叹了口气，意识到你可能需要采取更极端的措施，才能对她的罩杯尺寸产生更持久的影响。算了，你心想。总有下一次的。");
         get_player().orgasm("Generic");
         dynStats(DynStat.Cor(2));
         get_player().consumeItem(get_consumables().GROPLUS);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function get_debugName() : String
      {
         return "奇哈";
      }
      
      public function get_debugHint() : String
      {
         return "";
      }
      
      public function fuckKihasVagInCamp() : void
      {
         clearOutput();
         get_images().showImage("kiha-follower-sex-vagfuck");
         outputText("你抓住奇哈的手，用手指滑过她爪子外侧的鳞片纹理，同时把她拉近。她可爱地脸红了，假笑着，[say: 离不开，是吧，[name]？]你心照不宣地微笑着，把她的手拉向你的下体。当你把她的手拉进你的[armor]底部时，一阵困惑的表情笼罩了龙女平时风暴般的目光。感觉到[oneCock]在她的手指上火热地跳动，这就是粉碎你爱人高傲举止所需要的一切。");
         if(get_silly())
         {
            outputText("她用高亢的抱怨声问道，[say: 是我做的吗？]史蒂夫·厄克尔和她比起来算不了什么！");
         }
         else
         {
            outputText("她紧张地结巴着，[say: 那是……因为我吗？]");
         }
         outputText("[pg]你有点急切地点点头，把女战士拉近，把她的手固定在原位，利用两具身体紧紧缠绕时熟悉的、收缩的压力。奇哈红宝石般的眼睛睁大了，黑色的瞳孔因为情感涌过她强大的身躯而扩张。她的尾巴滑到你的[legs]后面，深情地缠绕着它们。它拉得刚好够紧，将它的温暖传遍你全身，而不会限制或使你的动作失去平衡。你自信地吻了她，高兴地发现当拥抱松开时，她的手自己在移动。");
         outputText("[pg][say: 所——所以你想……嗯……做爱？]奇哈问道。你把一缕铜色的头发从她脸上拨开，庄严地回答你想“做爱”。在家里，他们会开玩笑说让一个黑皮肤的女孩脸红。对于奇哈来说，这似乎异常容易，特别是当她像现在这样脸红得厉害时。她的眼睑垂下，当你说话时，她整个暗褐色的面容呈现出一种烟雾缭绕、诱人的神态。奇哈的手从你的[armor]里滑出来，握住你的[hips]，但只有短暂的一瞬间。");
         outputText("[pg]奇哈以流畅、自信的动作，轻松地把你从[armor]里剥出来，让你像她一样完全暴露。你让她把你的装备扔到一边，然后你再次掌控局面，当你把她放倒在地上时，你用手摸索着她那可以挤压的、柔软的乳房之一。她允许自己被摆弄，对于一个经常专注于身体支配的人来说，她的行为出奇地温顺，你趁机利用了这一点。龙女躺在地上，她的双腿淫荡地张开，露出她永远湿润的女性特征闪闪发光的三角区，因为你点燃的性唤起而满脸通红。");
         outputText("[pg]你拉近了距离，爬到你的爱人身上，用充满欢乐和惊奇的目光迎接她沉重、低垂的目光，总是惊讶于能如此自由地进入奇哈长期封闭的心。她很美，一颗闪闪发光的红宝石，你有幸将其据为己有。奇哈发出咕噜声，[say: 来吧，</i>爱人<i>……让我看看你这……做爱。]");
         outputText("[pg]你不需要进一步的鼓励。你握住你的[cockFit 67]，在奇哈的外阴唇上摩擦，她那像火炉一样的小穴里流出的滚烫水分似乎在你的冠状沟上冒泡。龙女高兴地哼着，[say: 嗯嗯，如果这就是“爱”，我可以习惯这个……]当你逐渐增加快感时。她的裂缝虽然肌肉发达，但现在和她身体的其他部分一样柔软顺从，是一颗任你采摘的湿润果实。你直接滑入她体内。那个小穴……那个多汁、火热的小穴……用刚好够让你抽搐的压力挤压着你的[cockFit 67]，快乐的尖刺不停地穿过你的肉棒，直到它似乎在她体内弯曲，和你一样渴望最终的释放。");
         outputText("[pg]奇哈双手环绕着你的脖子，把你拉下来，给你一个湿润的、龙式的吻。作为回应，你向后伸手，熟悉地捏了捏龙的屁股，鼓励她继续保持。她用一只手的爪子顺着你的背部滑下，力度大到足以让匕首般锋利的尖端");
         if(!get_player().hasScales())
         {
            outputText("在你的背上留下长长的、红色的抓痕。");
         }
         else
         {
            outputText("从你的皮上剥落偶尔出现的旧鳞片。");
         }
         outputText("另一只手则留在原处，帮助你稳稳地锁住她的双唇，即使你正用坚如精金的龙枪刺穿她的肉褶。你用力挺进，从龙女那暗色的、撅起的嘴唇上退开，看着她的表情逐渐变得更加淫荡，在你对她下体的猛攻下被迫陷入了情欲之中。");
         outputText("[pg]奇哈呜咽着，[say:我的……再用力点，求你了……给我……我的。]她那带着喘息的呼气中充满了难以言喻的渴望，你几乎能看到空气中弥漫着这种气息。");
         outputText("你轻咬她的耳朵，低语道：[say:是的，你是我的。躺下好好享受吧。你只需要享受这一切。]");
         outputText("当你开始像打桩机一样猛干她的小穴时，这个平时严肃的龙女在你的肩膀上点了点头。汁液浸透了你的下半身，随着你每一次猛烈的撞击，奇哈的小穴里都会喷出细小的水花。越来越快，你将你的[cockFit 67]插入她湿透的肉缝中。这简直太完美了——一个热情、火热的小洞，舒适地包裹着你的阴茎，直到你再也无法忍受。熟悉的快感从你的[balls]涌起，顺着你的腰部向上蔓延，直到[eachCock]痉挛着，喷射出粘稠的白色爱液。");
         if(get_player().cockTotal() > 1)
         {
            outputText("[pg]奇哈的肚子很快就被白色的粘液覆盖，她的");
         }
         else
         {
            outputText("[pg]奇哈的");
         }
         outputText("小穴很快就被这东西填满了。她舒服地尖叫着，在你的身下缓慢地扭动着，不由自主地将爪子深深地陷入你的手臂。精液的细流从她的小穴顺着她的股沟流下，与她清澈的淫水混合在一起。");
         if(get_player().cumQ() >= 500)
         {
            outputText("这样微薄的展示仅仅是个开始。你射出一股又一股的精液，足以让龙女的肚子因为你的种子而微微隆起。");
         }
         if(get_player().cumQ() >= 1500)
         {
            outputText("精液不断地泵出，从她被填满的小穴里喷射出来的速度几乎和你注入的速度一样快，但当你结束时，你还是成功地让她看起来几乎像是怀孕了。");
         }
         if(get_player().cumQ() >= 1000)
         {
            outputText("滴落的精液在奇哈身下形成了一大滩。");
         }
         outputText("[pg]在慵懒地依偎了一会儿后，奇哈容光焕发地对你微笑。[say:那感觉……还不错，]她宣布道，随着她的情感防御重新建立，她的声音中带着一丝不确定的颤抖。你站起来，慢慢地伸展肌肉，消除僵硬。你戏弄地提醒她，这似乎比“还不错”要好一点。一条尾巴从你身下扫过你的[legs]，就在奇哈以猫一般的敏捷扑向你之前。她嘶嘶地说：[say:比还不错要好，行了吧？那感觉棒极了。你让我很开心，[name]！]");
         outputText("[pg]奇哈在从你身上爬下来之前，在你的胸口捶了一拳。[say:我没时间去想那些情绪，笨蛋……只要莉希丝还活着。]好吧，那是个美好的时刻。");
         kihaKnockUpAttempt();
         get_player().orgasm("Dick");
         dynStats(DynStat.Lib(-1),DynStat.Sens(-1));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function fuckKihaWithATentacle() : void
      {
         clearOutput();
         var _loc1_:int = -1;
         var _loc2_:int = -1;
         var _loc3_:int = -1;
         var _loc4_:int = -1;
         var _loc5_:int = get_player().cockTotal();
         while(_loc5_ > 0)
         {
            _loc5_--;
            if(get_player().cocks[_loc5_].get_cockType() == CockTypesEnum.TENTACLE)
            {
               if(_loc1_ == -1)
               {
                  _loc1_ = _loc5_;
                  _loc1_++;
               }
               else if(_loc2_ == -1)
               {
                  _loc2_ = _loc5_;
                  _loc2_++;
               }
               else if(_loc3_ == -1)
               {
                  _loc3_ = _loc5_;
                  _loc3_++;
               }
               else
               {
                  if(_loc4_ != -1)
                  {
                     break;
                  }
                  _loc4_ = _loc5_;
                  _loc4_++;
               }
            }
         }
         outputText("你温暖地微笑着，脱下自己的衣服，带着渴望和喜爱看着你火热的同伴。奇哈起初不明白；当你脱下你的[armor]时，她怀疑地站在那里：[say: 呃？你在干什么，[name]？这又是你的什么小把戏吗？]");
         if(get_silly())
         {
            outputText("你慢慢地低语，[say: 嘘……现在不要流泪。只有梦……和触手。]");
         }
         outputText("你摇摇头，依然咧嘴笑着；几秒钟后，你植物般的生殖器完全暴露出来，它那巨大而修长的触手在狭窄的衣服里被关了太久之后，品尝着冷空气，四处蠕动。奇哈似乎被你丰富而茂盛的生殖器惊呆了。[saystart]那-那是什么？你以为你要用那个做什么，[name]？我倒要看看你敢不敢带着");
         if(get_player().countCocksOfType(CockTypesEnum.TENTACLE) > 1)
         {
            outputText("那些怪物一样的东西");
         }
         else
         {
            outputText("那个怪物一样的东西");
         }
         outputText("靠近我。我他妈倒要看看你敢不敢！[sayend]");
         outputText("[pg]你失望地叹了口气，耐心地解释说你想和她分享一次“特别”的经历。你说你想用你的触手肉棒取悦她；你说你以为她会被这些多才多艺、天赋异禀的肉棒所唤醒。");
         outputText("[pg][say: 别-别以为你让我兴奋了什么的！这只是……恶心。这些蠕动的东西……这么长……这么大得离谱……还有那气味——等等，你在干什么，离我远点！]");
         outputText("[pg]趁着这位深色皮肤的爬虫族女孩赤身裸体地站在那里，你抓住机会，将你的阴茎触手伸向她，用你的[cock all]将她牢牢缠住。藤蔓在她诱人的身体上不断蠕动，环绕着她的腰部和胸部，在她的鳞片间滑行。当你用你的下体温柔地抚摸她时，你告诉她放松；你想让她感觉舒服，而且你知道你会做到的。你的肉棒不断摩擦她裸体的每一个部位，让她的每一个感官都充满肉棒的感觉。当[oneCock]滑过她的乳房时，你注意到她忍不住低下头，快速地舔了一下。你觉得很有趣，问她是不是终于开始喜欢你的肉棒服务了。");
         outputText("[pg][say: 不！停下！你要把我逼疯了，你的肉棒到处都是！它包围了我……我能闻到它的味道……我能尝到它的味道……别以为这样就能征服我，这感觉太……啊……]");
         outputText("[pg]随着你用越来越多的[cock all]缠绕她，奇哈的抱怨最终变成了缓慢而粗重的呼吸，暴露了她不断高涨的欲望。伴随着得意的笑声，你抓住奇哈的身体，将她拉近，在你们保持眼神交流时，感受着她火热的呼吸与你的呼吸交织在一起。她的目光似乎充满了挫败感和欲望，但也有信任。你不断低声说着温柔的话语，同时你的触手肉棒更加用力地摩擦着她的四肢和鳞片。然后，你紧紧地盯着她，将你的[cock " + _loc1_ + "]的顶端向上移动，直接插入她的嘴里。");
         outputText("[pg]这位长着鳞片的女人起初太惊讶了，当你把更多的尺寸强行塞进她火热的喉咙时，她的下巴张得大大的。你感觉到她温暖的舌头和唾液慢慢弄湿了你的肉棒，给你带来了最愉悦的刺痛感。随着你逐渐感觉到自己的欲望在积聚，你不断赞美你的龙族情人，告诉她她在这方面有多棒，并乞求她永远不要停下来。奇哈用戏谑的眼神和邪恶的笑容看着你——好吧，你觉得如果不是被你巨大的[cock " + _loc1_ + "]弄得变形的话，它看起来会很邪恶——看到她对你还有一些控制力，她松了一口气。你让她在你的触手肉棒上努力，享受着她滚烫的嘴巴的接触，她的舌头和嘴唇毫不费力地在你的植物肉棒塔上滑上滑下。");
         outputText("[pg]感觉好极了，但你的下体还有其他用途。带着一丝遗憾，你慢慢拔出你的[cock " + _loc1_ + "]，留下奇哈在愉悦——和痛苦的渴望中喘息。");
         outputText("[pg][say: [name]……你以为你是谁，竟敢这样玩弄我？我不是可以被随意玩弄的宠物——]");
         outputText("[pg][say: 嘘。]在她发出另一声呜咽之前，你抓住她的脖子，猛烈地亲吻她的嘴唇，你的唾液与她的唾液以及你自己的肉棒汁液混合在一起。你凶猛地拥抱这位龙族女孩，双手和触手将她紧紧抱在胸前，仿佛你想用你的爱压倒她最后的反抗。当她紧张的挣扎完全停止时，你退后一步，在她眼前晃动你的[cock " + _loc1_ + "]，让她看到即将到来的快感的原因。她用目瞪口呆的眼神盯着你的肉棒，看着它在温暖的褶皱和她柔软身体的鳞片中蠕动；你的触手绕过她结实的臀部，然后停在她的后门前，准备进行即将到来的肛门插入。她闪闪发光的眼睛现在只充满了纯粹的饥渴；她想要你，就像你想要她一样，甚至更多。");
         outputText("[pg]仍然没有移开视线，你用最甜美、最温柔的声音低语：[say: 我爱你。]伴随着充满爱意的猛烈一击，你摧毁了奇哈的内部。这位长着鳞片的女人因为这坚定而温柔的侵入而尖叫，但你可以看到她的眼睛在放大，她的嘴巴疯狂地张开；她的整个身体变得慵懒，因为她将自己交给了你的怀抱。你紧紧地抱着她，仿佛在安慰她，并开始在她放松的肛门里抽插，用她自己的唾液作为润滑剂。奇哈地狱般的深处几乎让你的[cock " + _loc1_ + "]着火，但这极其痛苦的快感只是激励你插得更深、更用力。当你从直肠蹂躏你的情人时，你可以听到她压抑的幸福哭泣；尽管她起初可能很不情愿，但很明显她很享受她的臀部待遇。从她肛门壁的灵活性和相对松弛程度可以看出，你的龙族女孩非常习惯后庭被插，而且当你的[cock " + _loc1_ + "]向前推进时，不必在某人的屁眼里面奋力开路总是让人松一口气。相反，她的肛门括约肌似乎在自行收缩，促进了结肠的插入，然后在你的[cock " + _loc1_ + "]停留在里面时无情地挤压。");
         if(_loc2_ != -1)
         {
            outputText("[pg]你盯着奇哈幸福的脸；这位强壮的龙族女人在你反复的猛攻下，痛苦和快乐交织在一起，痛苦地皱着眉头。你靠近她，温柔地低声鼓励她，警告她这只是个开始。当你说话时，你解开你的[cock " + _loc2_ + "]，将它直接放在她的阴道口，准备进行即将到来的双重插入。虽然奇哈似乎没有注意到你压低声音的话语，但当你的第二根肉棒敲击她的子宫时，你感觉到她在你怀里震颤。看到这个长着鳞片的女孩已经兴奋得忘乎所以，你没有采取太多预防措施，粗暴地将你的[cock " + _loc2_ + "]的顶端塞进她的爱之隧道，一寸一寸地填满她火热、潮湿的深处。最终，她的肉洞完全被触手肉棒填满");
            if(get_player().cockArea(_loc2_ - 1) < 24)
            {
               outputText("并且你的肉棒齐根没入她的体内");
            }
            outputText("。当你交替抽插她的前门和后门时，你能感觉到她深色鳞片的身体在你怀里扭曲：奇哈正沉溺在邪恶的快感喷泉中。她疯狂地挣扎，几乎逃脱了你的掌控；这个凶猛的女孩不是一个会被支配的人，在她忘我的激情中，她让她非人的活力充分表达出来。虽然你对她的小穴相当粗暴和不加掩饰，但它真的在滴下瀑布般的淫液；闪闪发光的液体顺着她结实的大腿流下，在浸透被诅咒的地板时释放出热气。当你在她张开的小穴里抽插时，她的一些滚烫的性精华涂抹在你的[cock " + _loc2_ + "]上。这种热液对你植物般的下体起到了催情剂的作用，让它变得更硬；你的脑海中充满了狂热的感觉，因为你们俩都在放荡中陷得更深。");
            if(_loc3_ != -1)
            {
               outputText("[pg]虽然你当然很欣赏一个火辣而强大的女孩在你身上扭动的景象，但你觉得她狂喜的脸上少了点什么，你知道那是什么：一根多汁多肉的肉棒！她张开嘴发出狂乱的呻吟当然是一幅令人愉悦的景象，但你更愿意看到那丰满的嘴唇环绕着一根肉棒。将你蠕动的[cock " + _loc3_ + "]移向奇哈的脸，你戏谑地问她是否想要更多的肉棒，并确保在说每一个字时都用力地抽插她。你的[cock " + _loc3_ + "]的顶端在她眼前因兴奋而沸腾，让她完美地看到了你奢华的下体。这位龙女太震惊了，无法给出适当的回答；她时不时地发出一个语无伦次的单音，她的话语被你的[cock " + _loc1_ + "]和你的[cock " + _loc2_ + "]每次插入她洞穴时断断续续的呻吟声所破坏：[say: 啊……等等……啊……不……哦……啊……等等……是-是的！是的！哦……是的是的是的！啊啊啊……啊……]");
               outputText("[pg]你怎么能拒绝这样的邀请？你优雅地屈服于她对肉棒的渴望，并用你的[cock " + _loc3_ + "]靠近她；然而，奇哈仍然不愿意被当作一个单纯的性玩具对待，她先采取了行动：她灵活的舌头抓住了你植物般的肉棒，她吞下了你的全部长度，凶猛地吸吮和挤压。她的嘴唇以一种近乎绝望的需要紧紧贴着你的[cock " + _loc3_ + "]；她似乎决心要得到她想要的东西，很明显，在榨干你触手肉棒的所有物质之前，她不会放手。你的肉棒被吸得太用力了，有时会很痛；她的嘴唇就像一个极其紧绷的阴茎环，困住了你的藤蔓肉棒，有效地阻止了它的移动；感觉很好，但这种感觉令人难以忍受地戏弄。你实际上可以看到巨大的预精液顺着你蜿蜒的肉棒流下，然后被渴望肉棒的龙女贪婪地吞下。");
               if(_loc4_ != -1)
               {
                  outputText("[pg]最后，奇哈完全被你的触手肉棒塞满了。既然你不能再插入她了，你决定玩弄她的身体：你剩下的下体缠绕着她身体的每一个部位。你享受着你橡胶般的肉棒肉与她结实的大腿、她柔软而紧实的臀部以及她富有弹性的乳房之间火热的接触。这些似乎在旋转，就像在邀请肉棒在它们之间滑动。你给奇哈来了一次很棒的乳交，小鳞片在你的肉棒滑过她悬垂的球体时令人愉悦地刮擦着它。她的整个身体摸起来和抚摸起来都是一种享受：她皮肤下流淌着沸腾的热量的柔软接触，以及她散落的鳞片的粗糙感觉，都以不同的方式让你着迷。你的[cock " + _loc4_ + "]的末端不知怎么地停在了奇哈的臀部附近，你能感觉到她的尾巴兴奋地左右摇摆。一个邪恶的想法闪过你的脑海：将你长长的触手肉棒缠绕在奇哈长着鳞片的附肢上，你用力挤压它，几乎到了痛苦的程度。龙女试图大叫，但她的尖叫声被你填满的[cock " + _loc3_ + "]所掩盖；她的尾巴似乎在你触手的抓握中自行振动。这个长着鳞片的女孩在纯粹的愤怒和火热的欲望中野蛮地抽搐；你们俩在激情的愤怒中挣扎、战斗和相爱。你们的身体互相摩擦，你的肌肉与龙女的肌肉紧绷。在这场疯狂的性冲突中，你显然占据主导地位，因为你蠕动的触手下体填满了她的每一个孔口，并利用她最尴尬的姿势给她带来令人眩晕的快感。尽管如此，冲动的龙族女孩不会那么容易投降，仍然进行着最强烈的抵抗。这种放荡的拥抱在暴力和强度上迅速升级，似乎只有高潮才能解决这场疯狂的战斗。");
               }
            }
         }
         outputText("[pg]这位火辣的龙族女孩的深处最终证明对你颤抖的身体来说太刺激了；你的[balls]");
         if(get_player().balls > 0)
         {
            outputText("翻腾和颤抖");
         }
         else
         {
            outputText("翻腾和颤抖");
         }
         outputText("，你能感觉到精液聚集在你的胯部底部，准备进行终极的爱之爆发。你和奇哈已经拥抱和做爱了似乎好几个小时，你们火热出汗的身体在互相摩擦时，真的散发出一种纯粹的动物欲望的光环。你抽插得更用力、更快，渴望在你自己高潮到来之前，让你的龙族情人更接近高潮。突然，它来了：你用你的精液轰炸奇哈的内部，用你滚烫、粘稠的粘液喷洒她最深处。[EachCock]释放出巨大的汁液喷泉，浸透了龙女的身体，用你的种子溅满了她皮肤的每一寸。你一边继续射精一边抽插，[eachCock]在她的内部进出时发出嘈杂的嘎吱声；同样，女孩的孔口不规则地起伏和收缩，尽最大努力榨干你拥有的一切。很快，龙女就变成了一个被精液浸透的烂摊子；她身上散落的一些鳞片实际上因为所有的精液抛光而闪闪发光。奇哈的洞穴被完全填满，你的精液以浓稠的绿白色绳索状从她体内滴落。你的体液与这位火辣女孩自己的阴道分泌物和汗水混合在一起，很快在你们组成的这对异国情侣下方出现了一滩性污垢。精液不断从[eachCock]的顶端流出，浸透你的情人，直到你感觉完全被抽干。当最后一团粘液出来时，你稍微松开拥抱，你们俩都倒下休息，[eachCock]仍然深深地埋在她的体内。当奇哈强壮的身体撞击被体液污染的地板时，发出一声巨大的扑通声。你继续抚摸和拥抱你的情人，享受着她仍然紧紧拥抱你时温暖潮湿的接触。然后，最后，她笨拙地从她的孔口中取出[eachCock]。她的洞穴张开着，塞满了荒谬数量的精液，但这似乎丝毫没有减少她的骄傲。她迅速吞下嘴唇上剩余的精液，头晕目眩地抱怨道：[say: 你这个白痴，看看你做了什么！现在我完全被你的污垢覆盖了，我得去清理一下！别以为我是你恶心肉棒的奴隶……我只是因为你太可怜了才接受的……别再这样做了！好吧，除非，你知道，你真的想。不是我喜欢，但既然你那么喜欢这样做……我-我想你……可以……好吧——我必须走了。]奇哈然后笨拙地转过身飞走了，不规则地拍打着翅膀；她仍然因为你们刚刚进行的激烈触手交而感到头晕目眩，可能会去某条河里洗澡。");
         get_player().orgasm("Dick");
         dynStats(DynStat.Lib(1),DynStat.Sens(-2));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      override public function followerKiha() : Boolean
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,423) == 1)
         {
            return false;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,428) > 0)
         {
            return true;
         }
         return false;
      }
      
      public function fightForDominanceWithDragonCunnies() : void
      {
         clearOutput();
         kihaSprite(true);
         outputText("你告诉她，你怀疑她今天能不能伤到你。带着一种近乎孩子般的快乐，你准备好你的[weapon]，走进了龙女令人生畏的面前。");
         outputText("[pg][say: 我就喜欢你这样，[name]，]她笑着说，举起斧头摆出更具战斗准备的姿态。是时候证明你的价值了！");
         var _loc1_:Kiha = new Kiha();
         _loc1_.onDefeated = pcWinsDomFight;
         _loc1_.onWon = pcLosesDomFight;
         startCombat(_loc1_);
      }
      
      public function dominateKihasFaceWithStuffAndStuffOrSomethingIDunnoWhyImStillWritingThis() : void
      {
         clearOutput();
         outputText("感觉奇哈天生喜欢支配别人的倾向已经变得有点乏味了，你提出了由你来支配她的想法。龙女瞥了你一眼，咧嘴一笑，露出牙齿，同时把指关节捏得咔咔作响。[say: 我为什么要让你支配我，笨蛋？从我记事起，我就一直在沼泽里为了保持优势而战斗。你凭什么认为我会想向我刚认识的某个可爱的[guy]屈服？]当她意识到自己刚才叫你可爱时，她稍微脸红了一下。");
         outputText("[pg]叹了口气，你双臂交叉在胸前，告诉她你不会接受拒绝。奇哈嘲弄地哼了一声，两股微小的火焰从她的鼻孔里喷出，她扭了扭脖子站了起来。她从泥土里抓起她的斧头，转身面对你。");
         outputText("[pg][say: 如果你想对我为所欲为，你需要像其他人一样去争取，]奇哈解释道。她眯起眼睛看着你，质问道：[say: 问题是，你够不够[man]去拿你想要的东西？我可不想你受伤。]");
         outputText("[pg]这似乎是一个挑战。你会接受挑战，还是会退缩？");
         menu();
         addButton(0,"退缩",beABitchDumbass);
         addButton(1,"争夺支配权",fightForDominanceWithDragonCunnies);
      }
      
      public function debugMenu(param1:Boolean = true) : void
      {
         get_game().debugMenu.debugCompEdit(saveContent,new SaveContent(null,null,null,null));
      }
      
      public function canKihaGetPregnant() : Boolean
      {
         if(int(get_game().time.days % 15) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2199) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2198) <= 0 && !pregnancy.get_isPregnant())
         {
            return true;
         }
         return false;
      }
      
      public function boneTheShitOutofKihaHolesWithHorsecock() : void
      {
         var _loc4_:int = 0;
         var _loc6_:* = null as IMap;
         clearOutput();
         get_images().showImage("kiha-follower-sex-lustyhorsecock");
         var _loc1_:Number = get_player().cumQ();
         var _loc2_:int = -1;
         var _loc3_:int = -1;
         if(get_player().countCocksOfType(CockTypesEnum.HORSE) > 0)
         {
            _loc4_ = get_player().cockTotal();
            while(_loc4_ > 0)
            {
               _loc4_--;
               if(get_player().cocks[_loc4_].get_cockType() == CockTypesEnum.HORSE && get_player().cockArea(_loc4_) >= 40)
               {
                  _loc2_ = _loc4_;
                  _loc3_ = _loc2_ + 1;
                  break;
               }
            }
         }
         if(_loc2_ == -1)
         {
            _loc2_ = get_player().cockThatFits(200);
            _loc3_ = _loc2_ + 1;
         }
         outputText("你脱下[armor]，靠近奇哈，很高兴让那");
         if(get_player().minLust() < 50)
         {
            outputText("半勃起的");
         }
         else
         {
            outputText("总是半硬的");
         }
         outputText("长度的");
         if(get_player().cocks[_loc2_].get_cockType() == CockTypesEnum.HORSE)
         {
            outputText("粗大的马鸡巴");
         }
         else
         {
            outputText(get_player().cockDescript(_loc2_));
         }
         outputText("在微风中自由晃动。高傲的龙女目光锁定在[eachCock]上，看到你那肿胀的男子气概，她骄傲的脸上浮现出一抹会意的坏笑");
         if(get_player().cockTotal() > 1)
         {
            outputText("");
         }
         if(get_player().isTaur())
         {
            outputText("在你的马身下");
         }
         outputText("。 [say: 笨蛋，你这样搞可是会被强奸的，你知道吧？]奇哈问道，用饥渴的眼神上下打量着你。你耸了耸肩，靠得更近了，尽力无视她轻蔑地哼气时从鼻孔喷出的火焰，[say: 好吧，我会帮你的，但这只是因为我想打倒莉希丝。我平时可不喜欢这种事。]");
         outputText("[pg]奇哈跪了下来");
         if(get_player().isTaur())
         {
            outputText("，爬到你的马身下");
         }
         outputText("，以便更好地仔细检查你的");
         if(get_player().cocks[_loc2_].get_cockType() == CockTypesEnum.HORSE)
         {
            outputText("野兽般的马鸡巴");
         }
         else
         {
            outputText("[cock " + _loc3_ + "]");
         }
         outputText("和它那慢慢充血的");
         if(get_player().cocks[_loc2_].get_cockType() == CockTypesEnum.HORSE)
         {
            outputText("伞状");
         }
         outputText("龟头。一滴乳白色的粘液从中间那半张开的宽大马眼里滴落到地板上，强烈地提醒着你那未被满足的欲望和强大的男子气概。这位强大的女战士试探性地嗅了嗅，闻着你粗大阳具散发出的麝香气味。她用手托住沉甸甸的肉棒，舔了舔嘴唇。它在她的抚摸下炽热地跳动着，随着你心脏的每一次跳动而震颤。她似乎被什么东西分心了，但摇了摇头让自己清醒过来。");
         outputText("[pg]你张开嘴想说话，正准备询问奇哈在想什么，至少，直到奇哈那沾满唾液的深色嘴唇压在你的尿道上，慢慢地在你的");
         if(get_player().cocks[_loc2_].get_cockType() == CockTypesEnum.HORSE)
         {
            outputText("伞状龟头");
         }
         else
         {
            outputText(get_player().cockHead(_loc2_));
         }
         outputText("上张大嘴巴。");
         if(get_player().hasSheath())
         {
            outputText("她在你的包皮上方套弄着你");
         }
         else
         {
            outputText("她用一只手套弄着你的肉棒");
         }
         outputText("，缓慢而均匀的动作刺激着每一个敏感区域。");
         if(get_player().cocks[_loc2_].get_cockType() == CockTypesEnum.HORSE)
         {
            outputText("她的另一只手抚摸着你包皮的皮肤，手指滑入折叠的外皮和你阴茎隐藏的、未被触碰的肉体之间。");
         }
         else if(get_player().balls > 0)
         {
            outputText("她的另一只手抚摸着你的[balls]，不断增加你想要释放的欲望。");
         }
         else
         {
            outputText("她的另一只手抚摸着你的会阴，不断增加你想要释放的欲望。");
         }
         outputText("感觉几乎超乎寻常的敏感。");
         if(get_player().get_inte() < 20)
         {
            outputText("一个没有思想的，");
            if(get_player().cocks[_loc2_].get_cockType() == CockTypesEnum.HORSE)
            {
               outputText("野兽般的嘶鸣");
            }
            else
            {
               outputText("呻吟");
            }
            outputText("从你的嘴唇中爆发出来，");
            if(get_player().isTaur())
            {
               outputText("蹄子踩踏着，当");
            }
            outputText("你对龙的担忧烟消云散，这多亏了快感流经你的");
            if(get_player().cocks[_loc2_].get_cockType() == CockTypesEnum.HORSE)
            {
               outputText("动物般的");
            }
            else
            {
               outputText("天赋异禀的");
            }
            outputText("身体。");
         }
         else
         {
            outputText("一声");
         }
         if(get_player().cocks[_loc2_].get_cockType() == CockTypesEnum.HORSE || get_player().isTaur())
         {
            outputText("嘶鸣");
         }
         else
         {
            outputText("呻吟");
         }
         var _loc5_:Boolean = false;
         if(get_player().cocks[_loc2_].get_cockType() == CockTypesEnum.HORSE || get_player().isTaur())
         {
            _loc5_ = true;
         }
         outputText("在你的喉咙里响起，但");
         if(_loc5_)
         {
            outputText("在你开始像动物一样嘶叫之前，你控制住了自己");
         }
         else
         {
            outputText("在它从你嘴里逃出之前，你控制住了自己");
         }
         outputText("。在你内心的尴尬和快感流经你的");
         if(_loc5_)
         {
            outputText("动物般的");
         }
         else
         {
            outputText("天赋异禀的");
         }
         outputText("身体之间，你完全忘记了对龙的担忧。");
         outputText("[pg]奇哈火红的眼眸中充满笑意，注视着你的一举一动。她的嘴唇慢慢张成一个夸张的“O”形，为了容纳你那足以撑破嘴巴的");
         if(get_player().cocks[_loc2_].get_cockType() == CockTypesEnum.HORSE)
         {
            outputText("野兽-");
         }
         outputText("肉棒的整个周长。那");
         if(get_player().cocks[_loc2_].get_cockType() == CockTypesEnum.HORSE)
         {
            outputText("粗大的龟头");
         }
         else
         {
            outputText(get_player().cockHead(_loc2_));
         }
         outputText("对你的伴侣来说是一个令人满足的挑战。她动作缓慢，下巴张得越来越大，柔软的嘴唇挤压着，将一阵阵快感推向你阴茎的根部。这令人沉醉的折磨很快就结束了，奇哈将那肿胀的");
         if(_loc5_)
         {
            outputText("动物");
         }
         outputText("肉棒吞入口中，那像龙一样的舌头如蛇缠绕猎物般轻松地卷住你的阴茎。");
         outputText("[pg]你的爬虫类情人吞吐着你的肉棒。即使她很努力，每次也只能在嘴唇边缘滑动半英寸。她有些懊恼，开始加快套弄的速度，");
         if(get_player().cocks[_loc2_].get_cockType() == CockTypesEnum.HORSE)
         {
            outputText("她空闲的手带着非人的温度，急切地抚摸着你包皮内的肉棒");
         }
         else if(get_player().balls > 0)
         {
            outputText("她的舌头带着非人的温度，尽可能多地舔舐着你的肉棒。");
         }
         else
         {
            outputText("她空闲的手带着非人的温度，急切地抚摸着你的[balls]。");
         }
         outputText("。她的眼睛似乎有些发炎，但她眼中的情欲之火远比那种微不足道的负面情绪更加明显。她像着了魔的女人一样摆弄着你的阴茎，揉搓、抚摸、舔舐、挤压，每一个动作都是为了取悦你那");
         if(get_player().cocks[_loc2_].get_cockType() == CockTypesEnum.HORSE)
         {
            outputText("粗大的、像小马一样的肉棒。");
         }
         else
         {
            outputText("[cock " + _loc3_ + "]。");
         }
         if(get_player().balls > 0)
         {
            outputText("你的[balls]在她的下巴上摩擦、颤抖，如此紧绷、火热，随时准备爆发。");
         }
         outputText("[pg]奇哈");
         if(get_player().balls > 0)
         {
            outputText("挤压着你的[sack]");
         }
         else if(get_player().hasVagina())
         {
            outputText("抚摸着你的[vag]");
         }
         else
         {
            outputText("用舌头鼓励性地扭动了一下");
         }
         outputText("，你再也无法忍受了。太热了，太紧了，而且……让她这样半插在你的肉棒上，就在你开始射精的时候，感觉太对了。你的[sack]因为排出精液的努力而收紧，熟悉的、紧绷的高潮快感淹没了你的感官。奇哈的嘴被你肿胀的");
         if(get_player().cocks[_loc2_].get_cockType() == CockTypesEnum.HORSE)
         {
            outputText("膨大的");
         }
         else
         {
            outputText(get_player().cockHead(_loc2_));
         }
         outputText("撑得更大了，她那有些困惑的脸上露出难以置信却又饥渴的神情。下一秒，她发出咕噜咕噜的吞咽声，嘴里充满了精液，你像消防水龙带一样喷射出来。");
         if(_loc1_ <= 250)
         {
            outputText("她毫不费力地把它们全吞了下去。");
         }
         else if(_loc1_ <= 1000)
         {
            outputText("她的眼睛湿润了，精液从她的鼻子里流出来，但她还是设法吞下了大部分。");
         }
         else
         {
            outputText("精液从她的鼻孔倒灌出来，她的眼睛泪如泉涌。她的喉咙努力吞咽着这一切，发出嘈杂的咕咚声，但这还不够。精液从她的嘴角喷出，把她起伏的乳房弄得一团糟，最后才慢慢减少到可以控制的程度。她的肚子甚至因为被迫吞下的所有");
            if(get_player().cocks[_loc2_].get_cockType().get_Index() > 0 && get_player().cocks[_loc2_].get_cockType().get_Index() < 10)
            {
               outputText("动物");
            }
            outputText("精子而显得有点圆滚滚的。");
         }
         outputText("[pg]奇哈退后，将你的龟头从她酸痛、沾满精液的嘴唇中释放出来。她咳嗽喘息了一会儿，不经意间把咸咸的污泥抹得满身都是。当她恢复过来时，她叹了口气，[say: 你弄得到处都是，白痴。现在我得去洗个澡了，但首先，你最好回报我一下。]");
         if(get_player().minLust() < 50 && get_player().lib < 80)
         {
            outputText("[pg][say: 没问题，]你心想，伸手去拿一瓶方便的药水，把你滞后的性欲重新激发到平流层。药水很顺滑地喝了下去，起初几乎没有任何效果。然而，过了一会儿，[eachCock]变硬并刺痛起来，渴望更多。你甚至能隐约闻到空气中一些新的、奇怪的气味。");
            get_player().consumeItem(get_consumables().L_DRAFT);
         }
         outputText("[pg]奇哈");
         if(_loc5_)
         {
            if(get_player().isTaur())
            {
               outputText("从你身下爬出来，把自己拉到附近的一块岩石上，摆好姿势让你的马身骑上她。她张开双腿，她湿滑的阴道散发出诱人的麝香，乞求着一根肉棒来填满它");
            }
         }
         else
         {
            outputText("向后靠在一块岩石上，张开双腿，向你暴露出一股诱人的、渴望被肉棒填满的气味");
         }
         outputText("。预先分泌的精液从你的龟头流出，形成粗大的绳索，在你上下摆动、充满血液的");
         if(get_player().cocks[_loc2_].get_cockType() == CockTypesEnum.HORSE)
         {
            outputText("马-");
         }
         outputText("肉棒。那股香气……那奇妙的气味。它充满了你的鼻腔，当你被荷尔蒙淹没的意识慢慢转动时，你认出了它是什么——发情的味道。你闻到了一个雌性……不，一个可以生育的雌性——一个母狗，一个");
         if(_loc5_)
         {
            outputText("母马");
         }
         else
         {
            outputText("荡妇");
         }
         outputText("……一个已经被你的精液标记过的紧致肉便器，正等着被你骑上去，怀上你的孩子。你锁定她的阴户——她的生育孔——走上前，");
         if(get_player().cocks[_loc2_].get_cockType().get_Index() > 0)
         {
            if(get_player().isTaur())
            {
               outputText("把蹄子搭在岩石上，居高临下地看着奇哈");
            }
            else
            {
               outputText("一只手抚摸着你那野兽般的工具");
            }
         }
         else
         {
            outputText("[if (isTaur) { 把蹄子搭在岩石上，居高临下地看着奇哈|一只手抚摸着你的" + get_player().cockDescript(_loc2_) + "}]");
         }
         outputText("，上下摆动的动作将你的" + get_player().cockDescript(_loc2_) + "上的前列腺液甩得到处都是。");
         if(_loc5_)
         {
            outputText("[say:操，我是在……发情吗？！]");
         }
         else
         {
            outputText("[say:操，我为什么……？！]");
         }
         outputText("你勉强思考着，但立刻又走神了，[say:嗯……是的……操……]");
         outputText("[pg]当你粗暴地分开奇哈的双腿，用你那");
         if(get_player().cocks[_loc2_].get_cockType() == CockTypesEnum.HORSE)
         {
            outputText("平坦的");
         }
         outputText("龟头撞击她毫无准备的阴户时，她给了你一个奇怪的眼神。当你越来越用力地推挤时，一声惊恐的尖叫从她唇间溜出，最终你毫不顾忌伴侣的感受，直接插了进去——你太专注于用你的");
         if(_loc5_)
         {
            outputText("马-");
         }
         outputText("精液填满她的子宫了，根本无暇顾及这些琐事。母龙");
         if(get_player().isTaur())
         {
            outputText("猛击你的腹部");
         }
         else
         {
            outputText("试图把你推开");
         }
         outputText("，大喊道，[say:你在干什么，[name]？喂？！你他妈在听我说话吗？]");
         outputText("[pg]你烦躁地低吼了一声，从这只准备好配种的");
         if(_loc5_)
         {
            outputText("母马");
         }
         else
         {
            outputText("荡妇");
         }
         outputText("的小穴里拔了出来，用你那滴着精液、沾满淫水的肉棒扇了她一巴掌。她震惊地瞪大了眼睛。她完全没料到你会这么做。尽管如此，你还是继续，把你的");
         if(_loc5_)
         {
            outputText("粗野肉棒");
         }
         else
         {
            outputText(get_player().cockDescript(_loc2_));
         }
         outputText("抹在她的脸上，强迫她好好闻闻你那强烈的鸡巴气味。她的眼神逐渐失去焦点，被那根拍打着她脸颊的粗大");
         if(get_player().cocks[_loc2_].get_cockType() == CockTypesEnum.HORSE)
         {
            outputText("马-");
         }
         outputText("肉棒吸引。很快，她就迷迷糊糊地舔了起来。空气中她发情的气味现在浓烈得多，也许是之前的两倍。觉得她准备好了，你轻轻拍了拍她的下巴，回到你之前的任务：授精。");
         outputText("[pg]奇哈语无伦次地说，[say: 发-发生什么事了……嗯……闻起来好香……操我？]你很高兴地满足了她。在第一次强行撑开她的阴唇后，再次插入就顺利多了，让你的");
         if(get_player().cocks[_loc2_].get_cockType() == CockTypesEnum.HORSE)
         {
            outputText("宽大的马眼");
         }
         else
         {
            outputText(get_player().cockHead(_loc2_) + " of your " + get_player().cockDescript(_loc2_));
         }
         outputText("刺穿了奇哈的入口，进入了她的肉穴。她发出满足的呻吟，你伴侣这无言的欢呼就是你深入所需的全部鼓励，你一寸一寸地把");
         if(get_player().cocks[_loc2_].get_cockType() == CockTypesEnum.HORSE)
         {
            outputText("润滑良好的马鸡巴");
         }
         else
         {
            outputText(get_player().cockDescript(_loc2_));
         }
         outputText("塞进奇哈完全扩张的小穴里。龙的小穴紧紧地包裹着你那粗大的");
         if(get_player().cocks[_loc2_].get_cockType() == CockTypesEnum.HORSE)
         {
            outputText("哺乳动物");
         }
         outputText("肉棒，感觉棒极了。它一寸一寸地吞咽着跳动的鸡巴，带着雌性本能冲动和欲望产生的饥渴吞噬着你的老二。");
         outputText("[pg]当你顶在她的子宫颈上时，淫水滴落到地上，立刻消失在干涸的泥土中。你拔出又挺进，用你的");
         if(get_player().cocks[_loc2_].get_cockType() == CockTypesEnum.HORSE)
         {
            outputText("平头马鸡巴");
         }
         else
         {
            outputText(get_player().cockDescript(_loc2_));
         }
         outputText("抵在她的子宫口，少许先头汁液顺着微小的开口滑入，润滑着她的子宫。每一次你顶撞那里，你都能感觉到奇哈的子宫颈又松动了一点，张开得更宽了一点。汗水顺着你的身体流下，你无情地抽插着奇哈的小穴，狠狠地操她，就像这个小");
         if(_loc5_)
         {
            outputText("母马");
         }
         else
         {
            outputText("荡妇");
         }
         outputText("应得的那样。她太热了，简直像在燃烧。当她在你身下扭动时，她的身体甚至似乎冒出了蒸汽，但她的臀部开始随着你的节奏起伏，顺从你的支配，柔顺地默许了你未曾言明的交配欲望。");
         outputText("[pg]你野蛮地低吼一声，猛地一挺，肿胀的龟头轻松地穿透了她扩张的子宫颈");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,430) == 0)
         {
            outputText("去夺走她的子宫处女");
            _loc6_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc6_,430,FlagDict_Impl_.arrayReadInt(_loc6_,430) + 1);
         }
         else
         {
            outputText("去耕耘你最爱的龙穴");
         }
         outputText("。奇哈痛苦地皱起眉头，摇了摇头，从性爱的昏迷中清醒过来，质问道：[say: 什——什么，哦，该死，你……你要把我弄坏了！] 她浑身颤抖，翻着白眼，沉浸在原始的快感中。奇哈喘息着，呻吟着，漫不经心地舔着嘴唇上的精液，含糊不清地说：[say: 为——为什么这么舒服？]");
         if(get_player().hasBalls())
         {
            outputText("抽插时，你狠狠地将你的[balls]拍打在她的屁股上，把它们涂抹在她汗湿的屁股和尾巴上。");
         }
         else
         {
            outputText("抽插时，你狠狠地拍打着她，感觉到她的尾巴在你的[butt]下拍打。");
         }
         outputText("迷失在欲望中的战士猛烈地挣扎起来，开始尖叫，不是因为痛苦，而是因为极乐。她的小穴像老虎钳一样紧紧夹住，在令人隐隐作痛的紧致高温中榨取着你的");
         if(get_player().cocks[_loc2_].get_cockType() == CockTypesEnum.HORSE)
         {
            outputText("马形");
         }
         else
         {
            outputText("粗壮的");
         }
         outputText("播种机。你咆哮着，将自己完全埋入她的体内，紧绷的热流从你的[balls]中涌出，龟头");
         if(get_player().cocks[_loc2_].get_cockType() == CockTypesEnum.HORSE)
         {
            outputText("膨胀");
         }
         else
         {
            outputText("充血");
         }
         outputText("将自己密封在你那被操坏了的爱人的子宫里。感觉像是一加仑的精液从你的肉棒里涌出。奇哈的内脏被这乳白色的洪流染成了白色");
         if(_loc1_ <= 250)
         {
            outputText("，被滚烫的精液塞满");
         }
         else if(_loc1_ <= 1500)
         {
            outputText("，她的肚子膨胀到了怀孕的程度");
         }
         else if(_loc1_ <= 3000)
         {
            outputText("，她的肚子膨胀到了母马怀孕的程度");
         }
         else
         {
            outputText("，她的肚子极度膨胀，甚至有些恶心，完全被精液填满，直到精液像白色的河流一样从她的小穴里喷射出来");
         }
         outputText("。");
         outputText("[pg]你叹了口气，从抽搐的母龙体内拔出。她被侵犯的小穴流出白色的精液，滴落下来，这是你一段时间以来制造的最混乱的内射。奇哈颤抖着伸出手，从自己身上舀起你那充满麝香味的");
         if(get_player().cocks[_loc2_].get_cockType().get_Index() > 0)
         {
            outputText("动物-");
         }
         outputText("精液，品尝它独特的味道。这一幕让你那疲软的肉棒重新振作起来，让它恢复到高耸的、马一样的尺寸");
         if(get_player().isTaur())
         {
            outputText("直到肉棒抵住你的肚子");
         }
         outputText("。你才刚刚开始给这个婊子配种！");
         outputText("[pg]奇哈的");
         if(_loc1_ > 250)
         {
            outputText("怀满精液的");
         }
         else
         {
            outputText("塞满精液的");
         }
         outputText("身体很容易移动。她似乎几乎没有意识到你的存在——她太忙于叹息和揉搓她的小穴，根本不在乎自己被怎么移动。你在她屁股沟内侧擦去肉棒上的淫水味，庆幸在靠近她那皱巴巴的尾穴的地方，鳞片褪去了，变成了皮肤。把她的尾巴拉到一边，让你看得更清楚，");
         if(get_player().isTaur())
         {
            outputText("你把她推到岩石上，让她四肢着地，然后重新骑上她，并且");
         }
         outputText("你将肉棒滑入奇哈汗湿的屁股沟之间。你的一小部分意识知道交配这个洞没有意义，但在空气中弥漫着如此浓烈的性爱气味的情况下，你真的不在乎。");
         outputText("[pg]你把你的");
         if(get_player().cocks[_loc2_].get_cockType() == CockTypesEnum.HORSE)
         {
            outputText("膨大的");
         }
         else
         {
            outputText(get_player().cockHead(_loc2_));
         }
         outputText("抵在奇哈紧致的肛门上，这突如其来的抽插让你的生育母狗发出一声惊讶的尖叫。不幸的是，它闭合得太紧了，即使你的肉棒上沾满了汁液，你也无法完全进入。你遗憾地把肉棒浸入从你的");
         if(_loc5_)
         {
            outputText("母马");
         }
         else
         {
            outputText("荡妇");
         }
         outputText("的小穴里流出的粘液河中，然后再试一次。尽管如此，你还是无法强行进入。");
         if(get_player().cocks[_loc2_].get_cockType() == CockTypesEnum.HORSE)
         {
            outputText("你龟头独特的形状让这种插入变得困难，但凭借着野兽般的固执，你坚持不懈。");
         }
         else
         {
            outputText("你龟头巨大的尺寸让这种插入变得困难，但凭借着野兽般的固执，你坚持不懈。");
         }
         outputText("撞击着她的雏菊，放松，然后用你的");
         if(get_player().cocks[_loc2_].get_cockType() == CockTypesEnum.HORSE)
         {
            outputText("膨大的");
         }
         else
         {
            outputText(get_player().cockHead(_loc2_));
         }
         outputText("在紧致的洞口周围打转，你不断地刺激她的肛门，直到它开始松动。现在用不了多久了。");
         if(get_player().isTaur())
         {
            outputText("[pg]你伸出手抓住奇哈的尾巴，提供");
         }
         else
         {
            outputText("[pg]龙那软绵绵的尾巴提供了");
         }
         outputText("一个合适的把手，帮助你把你的工具对准她黑暗的后庭。用力拉扯它，你猛地向前撞击，终于，你那沾满粘液的");
         if(get_player().cocks[_loc2_].get_cockType() == CockTypesEnum.HORSE)
         {
            outputText("马-");
         }
         outputText("肉棒穿过奇哈的括约肌，依偎在她的肠道里。她热得惊人，后门感觉比她那被操得烂熟的小穴还要紧上两倍。这绝对是绝佳的繁衍场所。");
         if(!get_player().isTaur())
         {
            outputText("你的手抚过她的臀部，只在停下来给她几下熟悉的拍打时才稍作停留，因为你");
         }
         else
         {
            outputText("你");
         }
         outputText("强行将你那粗壮的");
         if(get_player().cocks[_loc2_].get_cockType() == CockTypesEnum.HORSE)
         {
            outputText("动物-");
         }
         outputText("根塞进母龙的屁眼。她紧致的肛门环就像一个阴茎环一样套住你巨大的肉棒，让它在她体内保持极度坚挺，甚至紧紧贴着");
         if(get_player().hasSheath())
         {
            outputText("你敏感的包皮");
         }
         else
         {
            outputText("你敏感的下体");
         }
         outputText("。你意识到你太大了，这让她很不舒服，但你还是开始操她的屁股，因为你知道作为雌性，她会享受你的支配，就像她喜欢被配种一样，即使是在屁股里。");
         outputText("[pg][say: 操——操，你他妈的太大了！] 奇哈在泥土中喘息着大喊。透过她肠道薄薄的肠壁，你能感觉到她被塞满的子宫在你的身上晃动");
         if(_loc1_ < 250)
         {
            outputText("，并看到那独特的马形轮廓埋在她紧绷的肚皮里");
         }
         outputText("。你当然很大，你心想，你是阿尔法，是" + get_player().mf("种马","繁育者") + "，是掌控一切的人。你");
         if(get_player().isTaur())
         {
            outputText("俯下身");
         }
         outputText("拍打她的后臀，以赞赏你的母狗的忠诚服务，并像打桩机一样撞击她富有弹性的屁股，紧紧抓住她的尾巴，以免它因为她的快感而乱甩。");
         outputText("[pg]奇哈开始呻吟，你偶尔能感觉到她沾满精液的指尖碰到你的");
         if(get_player().balls > 0)
         {
            outputText("[balls]");
         }
         else
         {
            outputText("包皮");
         }
         outputText("。当你摧毁她的肛门时，她给你鼓励的挤压，怂恿你彻底蹂躏她。那些柔软的指尖很快又回到了母龙饥渴的小穴里，用你浓稠的精液作为润滑剂自慰。你冷笑着拍打这只母狗渴望精液的屁股，看着它在光线反射在鳞片部分时微微颤动。你不满足于依次操她身上的每一个洞，你抓住她红宝石般的发丝向后拉，强迫你的");
         if(_loc5_)
         {
            outputText("母马");
         }
         else
         {
            outputText("荡妇");
         }
         outputText("把背拱成蛇形的曲线。这景象几乎让你爆发，但你的身体还没准备好射精。你需要更多。");
         outputText("[pg]你命令道，[say: 求我，] 带着");
         if(_loc5_)
         {
            outputText("兽群首领不容置疑的权威。");
         }
         else
         {
            outputText("一种不容置疑的权威感。");
         }
         outputText("奇哈微微扭头，因为拉扯到头发而皱眉。她只能转过头让你看到她的一只爬行动物般的眼睛，但当她说话时，你可以看到口水从她暗色的嘴唇上滴落，[say: 给——给我。填——填满我的屁股。骑我！占有我！] 你闷哼一声，在她的肠道深处触底，你的");
         if(get_player().cocks[_loc2_].get_cockType() == CockTypesEnum.HORSE)
         {
            outputText("龟头");
         }
         else
         {
            outputText(get_player().cockHead(_loc2_) + "");
         }
         outputText("当你达到绝对的顶点时，它完全张开。精液涌遍你的全身，撑开你的尿道，打开你敏感的马眼，射入你荡妇的后庭。她幸福地呻吟着，翻着白眼，舌头从嘴里伸出来。奇哈此时的发声甚至算不上语言，只是像你一样发出动物般愉悦的呼噜声。你用精液淹没她的直肠，用精液填满她的臀部。你把她紧紧抱在怀里，直到你完成对她的授精，然后，在红润的脸颊上快速拍了一下，你滑了出来并松开了她的头发。");
         if(_loc1_ >= 3000)
         {
            outputText("[pg]一股精液从她被填满的屁眼和小穴中流出。看来她体内根本没有足够的空间容纳这一切，两个底部的洞里都装了超大剂量的精液，大部分都不得不流出来。即使这样，她看起来仍然像怀了孕一样，这是对你邪恶男子气概的完美致敬。");
         }
         else if(_loc1_ >= 1000)
         {
            outputText("[pg]一股精液从她被填满的屁眼和小穴中流出。即使这样，她看起来仍然像怀了孕一样，这是对你强健男子气概的完美致敬。");
         }
         else
         {
            outputText("[pg]精液从她的屁眼和被彻底蹂躏过的小穴中滴落，这是你男子气概和你对雌性支配地位的有力证明。");
         }
         outputText("奇哈侧过身，抱着肚子，两个洞都张开着，留下了你的精液痕迹。她像猫一样叫着，[say: 太……棒了，] 然后把一根手指伸回小穴，收集更多你的精液来品尝。");
         outputText("[pg]你绕着圈，在她的脸前放低身子，高度刚刚好，你把你沾满精液的肉棒放在她的脸上，" + get_player().cockHead(_loc2_) + "垂在她的头发里，把精液漏进红色的发丝里。奇哈闻了闻你的");
         if(get_player().balls > 0)
         {
            outputText("[balls]");
         }
         else if(get_player().hasSheath())
         {
            outputText("包皮");
         }
         else
         {
            outputText("肉棒");
         }
         outputText("并幸福地叹了口气。她伸手去摸它，她的手虔诚地把她的爱液和你残留的精液涂满你的肉棒和她的脸。她似乎仍然有些神志不清，但至少她对肉棒的渴望是充满热情的。你尽可能地把鸡巴上的性爱粘液擦在她的鼻子上，然后用她的头发把自己擦干。奇哈发出呼噜声，在你起身时舀了一些放进嘴里，当她开始自慰时，几乎没有注意到你的离开。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,431) == 0)
         {
            outputText("[pg]一旦你远离了她令人陶醉的气味，你才意识到你刚才做了什么。你用手捂住嘴");
            if(get_player().cor <= 33)
            {
               outputText("并皱起眉头");
            }
            outputText("，想知道到底是什么让你变得如此疯狂。");
            if(get_player().lib < 80 && get_player().minLust() < 50)
            {
               outputText("是催情剂吗？还是");
            }
            else
            {
               outputText("是");
            }
            outputText("奇哈的身体——或者你的——做了什么？你摇摇头，希望她不会因为这件事怪你。");
            if(get_player().statusEffectv1(StatusEffects.Exgartuan) == 1)
            {
               outputText("埃克斯加图安建议道，[say: 如果她和我一样开心，她可能会喜欢的。]");
            }
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,429,1);
         }
         else
         {
            outputText("[pg]又发生了！你浑身发抖，抚摸着自己，想要再来一次的明显欲望已经在你的脑海中根深蒂固。好吧，至少奇哈不太介意。");
         }
         if(get_player().minLust() < 50 && get_player().lib < 80)
         {
            outputText("[pg]<b>(你消耗了一瓶催情剂！)</b>");
         }
         _loc6_ = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc6_,431,FlagDict_Impl_.arrayReadInt(_loc6_,431) + 1);
         get_player().orgasm("Dick");
         dynStats(DynStat.Lib(-1),DynStat.Sens(-1));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function blechKihaYourCooking() : void
      {
         clearOutput();
         outputText("你作呕并吐了出来，被你刚刚试图吃下的那块恶心、烧焦的[say:肉]呛到了。奇哈目瞪口呆地看着你，直到你");
         if(get_player().canFly())
         {
            outputText("飞走。奇哈皱着眉头，也飞到空中，降落在你外面的身后");
         }
         else
         {
            outputText("要求被带到外面。奇哈勉强地走过来，抓住你的腰，把你拖到外面");
         }
         outputText("。一旦你回到地面，你从龙女手中夺过她那把沉重的巨斧，大步走进树林。");
         outputText("[pg]你的情人感到困惑，跟着你穿过沼泽中密集的树木，直到你看到一头野猪在灌木丛中觅食。瞄准那只生物，你发出一声有力的咆哮，把斧头扔向它。野猪抬起头，大声哼哼着，试图逃跑——但奇哈旋转的斧头干净利落地砍下了它的头。");
         outputText("[pg]你把尸体拖回奇哈的小屋，花了接下来一个小时剥皮，准备好一块新肉，并仔细解释如何体面地烹饪。虽然奇哈对你不喜欢她的[say:家常菜]明显感到恼火，但当你解释为你自己和他人提供食物的细节时，她还是坐下来听着。当你完成后，野猪在你匆忙搭建的烤叉上烤得很好，你递给奇哈一条腿，让她尝尝。");
         outputText("[pg]她皱着眉头，从你手中夺过肉，咬了一大口。当你看到她因为你准备的肉那压倒性的多汁和甜美而流泪时，你笑了。你觉得你可能是第一个专门为她做饭的人。不过，当你问她觉得怎么样时，奇哈还是气呼呼地回答：[say:嗯，还行吧……我想。]");
         outputText("[pg]你翻了个白眼，在接下来的几分钟里，和你的龙族情人一起享受了一顿美味、安静的饭菜。当你吃完后，你揉了揉奇哈的头发，告诉她试着更好地照顾自己——或者至少有时给自己做一顿像样的饭——然后向营地走去。当你走的时候，你几乎能听到她在你身后生闷气。");
         get_player().refillHunger(60);
         kihaAffection(-10);
         if(saveContent.badCookingTasted == 0)
         {
            saveContent.badCookingTasted = 1;
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function beatSpiderMob() : void
      {
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,421,1);
         clearOutput();
         outputText("[say: 撤退！] 两只蛛化精灵中体型较大的一只尖叫着，捂着你在她胸前留下的严重伤口。[say: 我们快离开这里！][pg]");
         outputText("蜘蛛们撤退了，潜回沼泽，夹着尾巴舔舐伤口。你和奇哈作为胜利者站在那里，周围散落着甲壳碎片和蜘蛛丝。连续两场艰苦的战斗让奇哈气喘吁吁，她靠在巨大的斧头上，看起来几乎要倒下了。你轻轻地把手放在她的肩膀上——这一次，她没有耸肩甩开。[pg]");
         outputText("[say: 为什么，[name]？] 她问道，声音微弱得几乎像是在耳语。[say: 为什么……你为什么要帮我？我试图伤害你，而你却……转过身来救了我。我不明白。][pg]");
         outputText("你再次解释说你不是莉希丝的仆人——奇哈是否与你为敌是她自己的选择。她一动不动地听着，但你可以看出，自从你第一次试图和这位强大的龙女讲道理以来，她的目光已经柔和了许多。[pg]");
         if(get_silly())
         {
            outputText("[say: 笨、笨蛋，]");
         }
         else
         {
            outputText("[say: 蠢货，]");
         }
         outputText("当你讲完时，她终于开口了。[say: 你可能会被强暴、被打，甚至被杀！但是……我……] 她突然涨红了脸，就像她的鳞片一样红。[say: 谢谢你，我想。]");
         outputText("[pg]你");
         if(get_player().cor < 50)
         {
            outputText("捏了捏她的肩膀，并");
         }
         outputText("告诉她，也许现在你们两个可以做朋友了。");
         outputText("[pg][say: 朋友……是啊，也许那也不算太糟，] 奇哈说着，给了你一个傲慢的微笑。[say: 走吧，离开这里。] 你回以微笑，开始向水边走去。");
         outputText("[pg][say: 嘿、嘿，[name]！] 奇哈突然喊道，让你在岸边停下了脚步。[say: 别、别忘了……呃，我是说……记住这个地方在哪，好吗？朋友，呃，我想有时候会互相拜访的。]");
         outputText("[pg]你给了她一个会心的小眨眼，这只让她在你开始涉水穿过沼泽时皱起了眉头。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,421,1);
         get_combat().cleanupAfterCombat();
      }
      
      public function beABitchDumbass() : void
      {
         clearOutput();
         outputText("你避开了这位凶猛龙女的目光，面对她的挑战保持沉默，不愿在此时继续纠缠这个问题。她轻蔑地哼了一声，[say: 如果你不为你想要的东西而战，人们就会不断地把它们从你身边夺走。]奇哈淫荡地张开双腿，用尾巴扫过她的外阴唇，尽可能地挑逗你。当你眼睛死死盯着她的腹股沟时，她得意地笑了笑，转身离开了。");
         outputText("[pg][say: 也许等你长出点胆子再说吧，]龙女嘲弄道，对你眨了眨眼。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function GTFO() : void
      {
         clearOutput();
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,425,-1);
         outputText("趁着奇哈和那个神秘的剑士分心，你从泥潭里爬起来，飞快地逃离了现场，跑回了营地。在你的身后，你听到了激烈的战斗声。");
         doNext(get_camp().returnToCampUseOneHour);
      }
   }
}

