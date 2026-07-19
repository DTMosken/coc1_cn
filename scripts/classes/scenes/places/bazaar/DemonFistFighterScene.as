package classes.scenes.places.bazaar
{
   import classes.BaseContent;
   import classes.CoC;
   import classes.Player;
   import classes.StatusEffects;
   import classes.Time;
   import classes.TimeAwareInterface;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.items.Shield;
   import classes.items.ShieldLib;
   import classes.items.Weapon;
   import classes.items.WeaponLib;
   import classes.saves.SelfSaver;
   import classes.saves.SelfSaving;
   import classes.scenes.Camp;
   import classes.scenes.combat.Combat;
   import classes.scenes.monsters.PlaceholderDodgyMonster;
   import classes.scenes.places.Bazaar;
   import classes.scenes.places.bazaar._DemonFistFighterScene.SaveContent;
   import coc.view.CoCButton;
   import flash.Boot;
   
   public class DemonFistFighterScene extends BaseContent implements TimeAwareInterface, SelfSaving
   {
      
      public var saveVersion:int;
      
      public var saveName:String;
      
      public var saveContent:SaveContent;
      
      public var globalSave:Boolean;
      
      public function DemonFistFighterScene()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         globalSave = false;
         saveVersion = 1;
         saveName = "demonfistFighter";
         saveContent = new SaveContent(null,null,null,null,null,null,null,null,null,null,null);
         super();
         SelfSaver.register(this);
      }
      
      public function whatNext() : void
      {
         clearOutput();
         outputText("你问他，既然他已经不再是自己竞技场的勇者了，他打算做些什么。");
         outputText("[pg]他喝了一半的酒停了下来，表情严肃。令你惊讶的是，他很快又露出了热情的微笑。[say: 你真的认为失败会让任何一个称职的战士失去动力吗？不。恰恰相反。我等像你这样的人已经等了很久了。]");
         outputText("[pg]他用力将麦酒杯砸在桌子上，力道之大让你惊讶杯子竟然没有碎成十几片。[say: 事实是，轻而易举地击败这么多挑战者让我变得软弱。既然平庸就足够了，为什么还要费心去提高呢？一个优秀的战士需要挑战自己。需要亲吻擂台，品尝自己裂开的嘴唇，感受自己的瘀伤和断骨。这就是你进步的方式。那么我现在打算做什么？嗯……]");
         outputText("[pg]他用手指抹了一滴从杯子里溅出来落在桌子上的麦酒，然后舔了舔。他轻笑了一声，眯起了眼睛。[say: 我要出去看看我忘记了多少，又能学到多少关于战斗的知识。然后我会再给你一次机会。当然，如果你愿意的话。但我怀疑你不会拒绝的。]");
         outputText("[pg]你不置可否地点了点头，问他要是真打算\"出去闯荡\"磨练身手，这帐篷该怎么办。");
         outputText("[pg]他耸了耸肩。[say: 那个胖犀牛人会搞定这里的管理。我以前就跟他说过想做类似的事情。他可能会把它变成一场大乱斗，而且，在我不在的时候，我敢打赌会出现一些像样的战士，他们以前太害羞了，不敢亲自挑战老恶魔之拳。不过现在你打败了我？一切皆有可能。]");
         outputText("[pg]你心想。既然人们意识到胜利是可能的，他们自然会想要夺取你的王座，这很合理。");
         outputText("[pg]恶魔之拳再次微笑，试图解读你的表情。[say: 我希望你能致力于向这些篡位者展示擂台的地板有多么苦涩。希望在我回来踢你屁股之前，你自己也能学到几招。]");
         outputText("[pg]他声音中的热情显而易见。看来他真的有点动力了。");
      }
      
      public function timesFoughtDemonfist() : Number
      {
         return saveContent.timesLost + saveContent.timesWon;
      }
      
      public function timeChangeLarge() : Boolean
      {
         return false;
      }
      
      public function timeChange() : Boolean
      {
         var _loc1_:int = int(Math.max(0,saveContent.demonfistTimeAway - 1));
         saveContent.demonfistTimeAway = _loc1_;
         return false;
      }
      
      public function tentDescriptionDemonfistOut() : void
      {
         if(saveContent.newRulesExplained)
         {
            outputText("你回到了恶魔之拳的竞技场。队伍还是像以前一样拥挤，但这次你听到了观众和潜在挑战者的窃窃私语和八卦。[say: 恶魔之拳走了！]一个圆滚滚的恶魔大声喊道。[say: 被那个叫[ringname]的家伙打得屁滚尿流，现在都没脸在这里露面了！]他双手交叉在胸前，确信自己的推测是正确的。");
            outputText("[pg][say: 闭上你的臭嘴，]一个衣衫褴褛的猫人说道，用长着利爪的手指指着那个恶魔，[say: 他会回来的！他只是迟到了！花太多时间训练了！]");
            outputText("[pg]恶魔哼了一声，嘲弄地拍开了猫人的手指。这很快演变成了推搡，没过多久，队伍就变成了一团糟，尖叫声、推搡声，甚至更糟的情况接连发生。你被夹在中间，很明显，你必须诉诸暴力才能全身而退。");
            outputText("[pg]突然，你听到一个极其低沉、洪亮的声音。[say: 都他妈给我冷静点，不然我保证这里没一个人能再[i: 站]在队伍里！]人群安静了片刻，你转头看向声音的来源。在主帐篷的入口处，你看到了那个负责管理恶魔之拳钱财的犀牛人。[say: 很好。把你们的力气留到擂台上，你们这些白痴——]");
            outputText("[pg]他眯起眼睛，微微抬起头，朝你的方向看去。片刻之后，他睁大眼睛，大步向你走来，像拨开丛林里的灌木丛一样轻松地拨开人群。[say: 喂，你！你他妈在队伍里干什么？过来！]");
            outputText("[pg]他走到你面前，朝帐篷入口点了点头，一条清晰的通道已经为你让开。你们俩平静地朝入口走去，没人敢挑战这座肌肉山，也没人敢挑战那个打败了恶魔之拳的人。他开口前挠了挠下巴，那里的皮肤太厚了，听起来就像石头在互相摩擦。[say: 好了，[ringname]，事情是这样的。]");
            doNext(rhinoExplanation);
         }
         else
         {
            outputText("你回到了恶魔之拳的竞技场。排队的人依然多得吓人，但队伍里的人让你插队，让你快速且几乎毫无阻碍地进入了帐篷，这都归功于你的特权地位。闷热的空气、打斗声和欢呼声现在对你来说却出奇地令人振奋；你感觉自己的四肢都在渴望一场战斗。");
         }
      }
      
      public function tentDescriptionDemonfistIn() : void
      {
         var name7:String;
         var _g8:DemonFistFighterScene;
         var name6:String;
         var _g7:DemonFistFighterScene;
         var name5:String;
         var _g6:DemonFistFighterScene;
         var name4:String;
         var _g5:DemonFistFighterScene;
         var name3:String;
         var _g4:DemonFistFighterScene;
         var name2:String;
         var _g3:DemonFistFighterScene;
         var name1:String;
         var _g2:DemonFistFighterScene;
         var name:String;
         var _g1:DemonFistFighterScene;
         var _g:DemonFistFighterScene;
         var _loc1_:Array = ["一个巨大的牛头人","一个粗壮的小恶魔","一个健壮的男魅魔","一个面露凶光的鼠人","一个肌肉异常发达的魅魔"];
         outputText("你回到了恶魔之拳的竞技场。队伍依然拥挤，观众也像你第一次看他比赛时一样充满活力。这次米菲克斯不见踪影，让等待变得有些乏味。不过，为了能挑战勇者，你可以忍受。");
         outputText("[pg]几分钟后，你终于挤进了帐篷，里面的高温和气味依然让人很不舒服。你尽可能地靠近擂台，渴望在恶魔之拳解决掉他现在的对手时喊出你的名字。没过多久，这事就发生了，一记位置精准、速度极快的上勾拳将" + _loc1_[Utils.rand(int(_loc1_.length))] + "打晕，观众们惊叹不已。");
         outputText("[pg]勇者像往常一样进行了短暂的休息仪式，然后再次从凳子上站起来，指着观众，呼唤另一个疯狂到敢于挑战他的战士。");
         menu();
         if(get_player().get_gems() >= 500)
         {
            if(saveContent.playerName == "")
            {
               outputText("这是你的机会！你可以大喊你的名字然后跳上擂台，尽管这可能不是个好主意。");
               _g = this;
               addButton(0,"自定义名字",function():void
               {
                  _g.nameYourself();
               }).hint("融入氛围，为自己起一个新的战士名字。");
               _g1 = this;
               name = get_player().get_short();
               addButton(1,"你的名字",function():void
               {
                  _g1.nameYourself(name);
               }).hint("用你的名字就行。");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,128) != 0)
               {
                  _g2 = this;
                  name1 = "泽塔兹的末日";
                  addNextButton("泽塔兹的末日",function():void
                  {
                     _g2.nameYourself(name1);
                  }).hint("打败泽塔兹很了不起，对吧？");
               }
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1039) > 2)
               {
                  _g3 = this;
                  name2 = "鬼族终结者";
                  addNextButton("鬼族终结者",function():void
                  {
                     _g3.nameYourself(name2);
                  }).hint("你遇到过一个庞大的巨人，并让它屈服了。");
               }
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2302) > 5)
               {
                  _g4 = this;
                  name3 = "火蜥蜴践踏者";
                  addNextButton("火蜥蜴践踏者",function():void
                  {
                     _g4.nameYourself(name3);
                  }).hint("即使是狂暴的火蜥蜴也无法阻止你！");
               }
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2668) > 3 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,352) > 3)
               {
                  _g5 = this;
                  name4 = "送葬者";
                  addNextButton("送葬者",function():void
                  {
                     _g5.nameYourself(name4);
                  }).hint("你与不死生物战斗过……并且活下来讲述了这个故事。");
               }
               if(get_player().isReligious() && get_player().cor < 40)
               {
                  _g6 = this;
                  name5 = "天使之拳";
                  addNextButton("天使之拳",function():void
                  {
                     _g6.nameYourself(name5);
                  }).hint("众神亲自选择了你来完成这项任务！");
               }
               else
               {
                  _g7 = this;
                  name6 = "堕落十字军";
                  addNextButton("堕落十字军",function():void
                  {
                     _g7.nameYourself(name6);
                  }).hint("你已经背弃了众神。区区恶魔吓不到你！");
               }
               if(get_player().get_weapon() == get_weapons().LRAVENG)
               {
                  _g8 = this;
                  name7 = "完美风暴";
                  addNextButton("完美风暴",function():void
                  {
                     _g8.nameYourself(name7);
                  }).hint("有机会与这样的对手较量……现在你有点动力了。");
               }
            }
            else
            {
               outputText("这是你再次上擂台较量的机会。");
               addButton(0,"挑战",challengeBegins).hint("再次挑战恶魔之拳。");
            }
         }
         else
         {
            outputText("不幸的是，你没有足够的宝石来挑战勇者。也许这样最好，你心想。");
         }
         addButton(14,"只是观看",justWatchFight).hint("转念一想，你今天只看比赛就好了。");
      }
      
      public function saveToObject() : Object
      {
         return saveContent;
      }
      
      public function rhinoExplanation() : void
      {
         clearOutput();
         outputText("[say: 恶魔之拳告诉我他现在必须离开集市。去训练，举巨石，给霜巨人来个过肩摔，你知道他们这种人是什么样的。他意识到自己一直在懈怠，而你就是他的警钟。不管怎样，现在这都不重要了。在他回来之前，这个场子由我来管，我要稍微改一下规则。]");
         outputText("[pg]他拉开帐篷入口的门帘，示意你进去。令人不适的炎热以及血汗交织的气味再次扑面而来，依然和上次一样让人难受，但你还是走了进去。你的目光立刻被擂台吸引，一个头发灰白的犬娘似乎正在戏弄她的对手，那是一个肌肉发达、面目狰狞、且已经筋疲力尽的深红色恶魔。[say: 你现在是勇者了，但你不用去和每一个口袋里有几块宝石、喝尿长大的小恶魔打。现在是自由混战，每天最强的斗士才能获得挑战你的资格。只要你愿意付钱，你可以无限次地卫冕你的头衔。这对你来说够好了吧？]");
         outputText("[pg]你张开嘴想回答，但他打断了你。[say: 很好。进来吧，我想我们已经有一个不错的人选了。]");
         outputText("[pg]犀牛兽人拨开人群，为你开辟出一条直通擂台的道路。他指着一张沾满血迹、饱经风霜的凳子——那是恶魔之拳以前常坐的——示意你坐下休息。[if (!isBiped) { 他很快意识到你其实没法像那样坐着，但他耸了耸肩，示意你随便找个舒服的姿势就行。}]");
         outputText("[pg]他和几个观众聊了几句，收了几颗宝石，笑了笑，然后又朝你走来，目光依然停留在比赛上。[say: 我想那家伙就是你的对手了。那只癞皮狗——那混蛋把这里的人都揍趴下了。看来恶魔之拳的落败给了他碰碰运气的动力。我觉得你自己也需要点运气。]");
         outputText("[pg]他话音刚落，那只黑色的犬娘就狠狠地踢中了恶魔的肋骨，把他打得晕头转向。当他拔出匕首扑向恶魔时，人群爆发出阵阵欢呼；他在最后一刻停了下来，没有刺或砍，只是在恶魔的下巴上轻轻打了一拳，就把他击倒了。[say: 嘿，干得漂亮，不是吗？]犀牛兽人看着你，饶有兴致地说。[say: 好吧，如果你想和他打，就告诉我。顺便说一句，我叫奥兹，那只狗叫<DOG_NAME>。]");
         outputText("你告诉他你会考虑的，他点了点头，然后走进擂台宣布获胜者，并把筋疲力尽的失败者拉了出来。那只饱经风霜的犬娘收起匕首，深吸一口气，平静地走出擂台，融入了人群中。");
         saveContent.newRulesExplained = true;
         menu();
         addNextButton("卫冕",defendTitle).hint("卫冕你的头衔。作为现任勇者，你不需要支付入场费。");
      }
      
      public function returnToTent() : void
      {
         clearOutput();
         if(saveContent.beatDemonfist)
         {
            tentDescriptionDemonfistOut();
         }
         else
         {
            tentDescriptionDemonfistIn();
         }
      }
      
      public function reset() : void
      {
         saveContent.timesLost = 0;
         saveContent.timesWon = 0;
         saveContent.timesBrokenRules = 0;
         saveContent.playerName = "";
         saveContent.beatDemonfist = false;
         saveContent.learnedOfDemonFist = false;
         saveContent.consecutiveLosses = 0;
         saveContent.demonfistTimeAway = 0;
         saveContent.newRulesExplained = true;
         saveContent.timesFoughtDog = 0;
         saveContent.shookDogHand = false;
      }
      
      public function regularPlayerLoss() : void
      {
         outputText("你踉跄着后退，大口喘着粗气，[legs]几乎要瘫软。恶魔之拳催促着你，示意你向他冲锋。[say: 来吧，[Ringname]，你肯定还有力气再战！来吧，也许下一次攻击就能让你获胜！]");
         outputText("[pg]人群的欢呼声迅速从嘲笑与喝彩参半变成了全力支持，恶魔之拳的话激励了他们，让他们来激励你。他可能是对的。下一步也许就能让你获得胜利！");
         outputText("[pg]你深吸一口气，闷哼一声站了起来。");
         outputText("[pg]你准备好你的[weapon]，将目光集中在对手身上。");
         outputText("[pg]然后你瘫倒在地，筋疲力尽。");
         outputText("[pg]人群的反应夹杂着失望和释然，一些观众期待着胜利，而另一些人则为自己赌赢了而高兴。恶魔之拳自己也深吸了一口气，抹去额头上的汗水，然后伸出手拉你起来。");
         var _loc1_:Number = get_game().monster.HPRatio();
         var _loc2_:Number = get_game().monster.LustRatio();
         outputText("[pg-][say: 起来吧]——他一边拉你起来一边说道——");
         if(_loc1_ < 0.25 || _loc2_ > 0.75)
         {
            outputText("[say: 你给他们献上了一场精彩的表演，也让我觉得我的宝石花得值。照顾好那些瘀伤，我会等着重赛的。我有预感，下一场对我来说不会那么轻松了。]");
         }
         else if(_loc1_ < 0.5 || _loc2_ > 0.5)
         {
            outputText("[say: 你快成功了，[Ringname]。去训练一下，做好准备。我看得出来这不是你的最佳状态，而那才是我想要看到的。]");
         }
         else
         {
            outputText("[say: 在踏入擂台之前，你应该多训练一下，[Ringname]。你很有潜力，但如果你太急于证明自己，就无法让它开花结果。我哪儿也不会去。]");
         }
         outputText("[pg]他用力拍了拍你的后背，带你走向出口。你向他点点头，虽然疲惫不堪，但却有了进步和再次尝试的动力。");
         cheatTime(0.2);
         get_combat().cleanupAfterCombat(get_game().bazaar.enterTheBazaar);
      }
      
      public function questionTheBazaar() : void
      {
         clearOutput();
         outputText("你环顾黑鸡酒馆，注意到这里形形色色的顾客。不同物种的人形生物、魅魔、梦魔、糟糕的吟游诗人、一个来自英格纳姆的迷路者，以及一个来自恶魔军队的退役老兵。即使只是匆匆一瞥，你也能注意到恶魔和其他居民之间那种不言而喻的紧张气氛。酒吧女侍小心翼翼地靠近他们，其他顾客也明显地与他们保持距离。尽管如此，这与你对几年前引发末日战争的种族的预期还是有所不同。");
         outputText("[pg]这种共存。怎么可能？");
         outputText("[pg]你眯起眼睛，试图理解是什么让集市成为可能。坐在你面前的无忧无虑的恶魔很快注意到了你表情的变化，他把马克杯放在桌子上，准备迎接问题。你看着他，不知为何，感觉他知道你要问他什么类型的问题。");
         outputText("[pg-]你整理了一下思绪，问他是否知道集市是如何建立的，以及最重要的是，当它的大部分居民都是字面意义上没有灵魂的恶魔时，它是如何不分崩离析的。");
         outputText("[pg]他皱起眉头。他准备好了回答这个问题，但不一定准备好给出一个恰当的答案。他的回答带着令人惊讶的愤怒，仿佛他过去也被问过这个问题。");
         outputText("[pg][say: 你期望什么？每一个非恶魔都被杀死或奴役？山脉以南的一切都被烧成灰烬？]");
         outputText("[pg]你很快指出，这确实是玛瑞斯许多城镇和村庄的命运。");
         outputText("[pg]他呻吟了一声，但还是让步了。部分让步。");
         outputText("[pg][say: 一开始就是这样的]，他说着，在椅子上调整了一下姿势，向前倾身靠近你，[say: 当莉希丝的狂热达到顶峰时，推而广之，我们的狂热也是如此。我们准备好并愿意运用我们的力量去获取我们能得到的一切，而玛瑞斯已经成熟，任人采摘。没有什么能阻止我们，我们也不打算阻止自己。她命令我们拿走一切能拿走的，摧毁一切不能拿走的。我们很乐意效劳。]");
         outputText("[pg]你问他，随着时间的推移，她的\"狂热\"怎么样了。他表情缓和下来，目光显得有些遥远，回忆着过去。");
         outputText("[pg][say: 它就这么消失了。我们给她带来了宝石、奴隶、各种各样的神器和数量惊人的恶魔水晶。然而，随着时间的推移，她对自己开始的事情变得漠不关心。有一天，很明显她不在乎了。她继续下达命令，对我们的掠夺物征税，仅仅是为了强加她的权威。没有结束战争的计划，但它突然就来了。那么，该怎么办呢？]");
         outputText("[pg]你恍然大悟；他以前没有被问过这个问题：他曾问过自己这个问题。");
         outputText("[pg][say: 我们并没有厌倦掠夺、强奸和行使权力的感觉。但什么都没有剩下，而且，尽管发生了一切，我们仍然是活着的生物。我们必须活下去，而你不能指望恶魔自己来恢复文明。我相信，集市就是由此诞生的。]");
         outputText("[pg]你[i: 相信]？当你向他重复那个词时，他叹了口气。[say: 是的，它开始的时候我不在场。真的说不清是谁在场。恶魔不喜欢保存历史，而其他人，嗯，他们只是想活下去。当你和摧毁你世界的人生活在一起时，没有时间去关心这些细节。]");
         outputText("[pg]你思考了片刻他的话。集市是文明的脆弱碎片，诞生于恶魔发动的末日战争之后。这是恶魔和玛瑞斯人之间更和平共处的世界的一个例子吗？你向他解释了你的想法，他悲伤地笑了。");
         outputText("[pg][say: 绝不可能，[name]。就算集市真能壮大到被称作\"文明\"的地步，恶魔也用不了一周就能把它夷为平地。我们可抵挡不住那种诱惑。反正我肯定做不到。]");
         outputText("[pg]你皱起眉头，深深地凝视着他的眼睛。他没有退缩，只是挑了挑眉。他是认真的，绝对是。");
         outputText("[pg]也许和平共处终究是不可能的。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function playerWins(param1:Boolean) : void
      {
         var _g:Combat;
         outputText("人群保持着沉默，帐篷里只能听到偶尔的窃窃私语。");
         outputText("[pg]终于，一个男魅魔打破了沉默。[say: [He]作弊！[He]肯定用了魔法，不然[he]不可能动得这么快！不仅如此，而——]");
         outputText("[pg][say: 给我闭嘴，你这白痴]——恶魔之拳大吼一声，瞬间让那个男魅魔安静了下来——[say: 这里的[Ringname]是光明正大打败我的。也许我今天打得太多了，又或者我因为几百场胜利而变得自满，但事实就是我被打败了。]");
         outputText("[pg]恶魔之拳站起身向你走来，带着疲惫的微笑抓住了你的手腕。[say: 这个破帐篷是我的，所以我想我现在有权宣布。这位[ringname]就是新任勇者！]他举起你的手臂，人群开始为你欢呼，狂热而钦佩地高喊着你的名字。你忍不住笑了，举起另一只手臂，摆出胜利的姿势。今天，你就是玛瑞斯的" + get_player().mf("国王","女王") + "！或者说是集市某个小角落的" + get_player().mf("国王","女王") + "。不管怎样，这种感觉真好。");
         var _loc2_:Boolean = get_player().get_weapon().isFist() && get_player().get_shield() == ShieldLib.NOTHING;
         saveContent.beatDemonfist = true;
         _g = get_game().combat;
         doNext(function():void
         {
            _g.cleanupAfterCombat();
         });
      }
      
      public function onAscend(param1:Boolean) : void
      {
         reset();
      }
      
      public function nameYourself(param1:String = undefined) : void
      {
         var _g:DemonFistFighterScene;
         if(param1 == null)
         {
            param1 = "";
         }
         var _loc2_:String = getInput();
         if(param1 == "" && _loc2_ == "")
         {
            clearOutput();
            outputText("<b>你必须给自己起个名字。</b>");
            menu();
            genericNamePrompt();
            _g = this;
            addButton(0,"继续",function():void
            {
               _g.nameYourself();
            });
            return;
         }
         if(_loc2_ != "")
         {
            param1 = _loc2_;
         }
         saveContent.playerName = param1;
         clearOutput();
         challengeBegins();
      }
      
      public function miffixFight2() : void
      {
         clearOutput();
         outputText("人群沉默了片刻，随后开始为他们未尝败绩的勇者欢呼。恶魔之拳揉了几下被撞伤的肋骨，然后向犀牛人挥了挥手，犀牛人迅速履行职责，把米菲克斯带走了。");
         outputText("[pg][say: 不错，很聪明！如果那一拳再重一点，我可能就会被打晕，让他有机会解决我。虽然还不够好，但为这个勇敢的小混蛋喝彩！]");
         outputText("[pg]人群也跟着为昏迷的小恶魔欢呼。恶魔之拳用旁边的毛巾擦了擦汗，告诉大家今天的比赛到此结束。人群很快散去，空气中弥漫着对今天比赛的零星评论，其中也夹杂着一些对那长得离谱的连胜纪录的抱怨。你跟着人群一起离开，心里琢磨着以后要不要自己也去挑战一下恶魔之拳。");
         doNext(get_camp().returnToCampUseTwoHours);
      }
      
      public function miffixFight() : void
      {
         clearOutput();
         outputText("你看着米菲克斯。他显然很害怕，但很坚决；很明显他不会在这场战斗中退缩。");
         outputText("[pg][say: 好了，米菲克斯，带宝石了吗？] 恶魔之拳问道，一边跳跃着对着空气挥拳，保持着热身状态。小恶魔点点头，从腰布上解下一个沉甸甸的宝石袋。他把它扔向恶魔之拳，恶魔之拳迅速接住并把它扔出擂台。之前的那个犀牛兽人接住了它，位置站得恰到好处，稳稳接住了这笔数量惊人的宝石。[say: 很好！非常好！我们随时可以开始！记住，我能应付下三滥的招式、刀刃武器、毒牙，或者你准备的任何东西，但这是一场<b>肉搏</b>战！我的擂台上不准用那些蹩脚的魔法！明白了吗？]");
         outputText("[pg]米菲克斯咽了口唾沫，试图让自己平静下来。[say: 是……是的。我带了。]");
         outputText("[pg]恶魔之拳微笑着。[say: 那就这样定了！你打出第一拳后，战斗就算开始。来吧！]他厚着脸皮挑衅小恶魔，挥手做出一个\"过来啊\"的动作。");
         outputText("[pg]小恶魔鼓起勇气，把指关节捏得咔咔作响，深吸一口气，然后突然冲向那个靛蓝色的恶魔，速度之快远超你的想象。人群也惊讶地倒吸了一口凉气，小恶魔敢于应战这一事实本身就已经超出了他们的预期。");
         outputText("[pg]恶魔之拳一进入攻击范围，米菲克斯就试图快速打出一记刺拳，但这位勇者迅速向右闪避。接着，恶魔试图用一记勾拳反击，但令你惊讶的是，他打空了，小恶魔成功地向后移动，险险避开了这势大力沉的一击。米菲克斯察觉到恶魔之拳失去平衡的破绽，试图用一记上勾拳直接结束战斗，他借助翅膀跳了起来，直击恶魔的下巴。恶魔之拳反应极快，向后仰头避开了攻击，但这也让他的视线离开了对手。");
         outputText("[pg]小恶魔从半空中落下，扭动身体，试图用手肘攻击对手的肋骨。令观众大为惊叹的是，这一招竟然成功命中了，恶魔痛苦地扭动着身体，低下了头，刚好到了小恶魔不用跳就能打到的高度。");
         outputText("[pg]米菲克斯没有浪费时间，直接一拳打向恶魔之拳的脸，想把他彻底击倒。然而，就在眨眼之间，靛蓝色的恶魔恢复了过来，他绕过米菲克斯伸直的手臂，滑到了这个过于自信的小恶魔身后。在动作的最后，恶魔用手肘狠狠地击中了米菲克斯的后脑勺，将他向前击飞并打晕了过去。");
         outputText("[pg]小恶魔没有再站起来。");
         doNext(miffixFight2);
      }
      
      public function lustKO(param1:Boolean) : void
      {
         var angry1:Boolean;
         var _g:DemonFistFighterScene;
         outputText("恶魔充满活力的动作慢了下来，你注意到他开始对战斗失去注意力。");
         outputText("[pg][say: 莉希丝的奶子啊，你能不能认真点打？]");
         outputText("[pg]你娇羞地问他那是什么意思，猛地向前挺动你那汗津津的身体，这明显让他愣住了。");
         outputText("[pg]他停止了动作，沮丧地开始抱怨。[say: 妈的，你知道我在说什么！所有这些挑逗、摩擦、呻吟什么的！现在就给我停下那该死的——]");
         outputText("[pg]发现他防御上的破绽，你迅速一记上勾拳，正中他的下巴，汗水从他身上爆开，他的头在明显的痛苦冲击下向后猛甩。他像个布娃娃一样倒在地上，沉默了几秒钟后，痛苦地呻吟起来。");
         outputText("[pg][say: 这就是你的策略，是吧？]他捂着下巴，痛苦地皱了皱眉，试图站起来。[say: 你赢了，你赢了。这是个击倒，我不打了。]");
         _g = this;
         angry1 = param1;
         doNext(function():void
         {
            _g.playerWins(angry1);
         });
      }
      
      public function load(param1:int, param2:*) : void
      {
         Utils.extend(saveContent,param2);
      }
      
      public function leaveTent() : void
      {
         clearOutput();
         outputText("你现在不太想在擂台上打架。你告诉奥兹你要走了，他耸了耸肩。[say: 好吧，随你的便。我还能多赚点钱。]");
         outputText("[pg]你朝他点了点头，走向帐篷的出口，这需要你在拥挤的人群中推推搡搡才能挤出去。");
         doNext(backToBazaar);
      }
      
      public function justWatchFight() : void
      {
         var _g:Bazaar;
         clearOutput();
         var _loc1_:String = Utils.rand(2) != 0 ? "他" : "她";
         var _loc2_:String = _loc1_ == "he" ? "his" : "her";
         var _loc3_:String = _loc1_ == "he" ? "him" : "her";
         outputText("你决定现在还是继续观战比较好。[pg]没过多久，就又有人把帽子——和宝石——扔进了擂台。");
         switch(Utils.rand(3))
         {
            case 0:
               outputText("[pg]那个进入擂台的可怜虫几秒钟就被狠狠地击倒了。恶魔之拳脸上的失望显而易见，但他还是耸了耸肩，祝贺了失败者的努力。你忍不住想，体育精神并不能弥补瘀伤和宝石的损失。");
               break;
            case 1:
               outputText("[pg]恶魔之拳的新对手表现得还算不错，但从一开始结果就很明显了。" + _loc1_ + "在亲吻擂台地板之前，只对勇者造成了几次皮外伤。总的来说，还算是不错的娱乐。");
               break;
            case 2:
               outputText("[pg]一位新的挑战者步入擂台，很快就清楚地表明" + _loc1_ + "不是在开玩笑。当攻击被格挡、躲闪和反击时，人群中爆发出阵阵惊呼和欢呼，随着每一次成功的击中，勇者可能最终会倒下的想法在观众中蔓延，也包括你。");
               outputText("[pg]当恶魔之拳的对手发动决定性攻击时，人群震惊地安静下来。接下来的时刻似乎在慢动作播放，恶魔之拳险险避开了那致命的一击，并在挑战者举起防御之前迅速反击，将" + _loc3_ + "击倒在地，" + _loc1_ + "就那样倒在那里。");
               outputText("[pg]当勇者举起拳头庆祝时，人群爆发出欢呼声。恶魔之拳又一次获得了胜利，但这场表演无疑激发了许多潜在挑战者的勇气。");
         }
         outputText("[pg]几分钟后，你决定你已经看够了比赛，至少在观众席上是这样，于是你离开了帐篷。");
         _g = get_game().bazaar;
         doNext(function():void
         {
            _g.enterTheBazaarAndMenu();
         });
      }
      
      public function introDogFight(param1:Boolean, param2:Boolean = false) : void
      {
         clearOutput();
         if(param2)
         {
            saveContent.shookDogHand = param1;
            if(param1)
            {
               outputText("你握住了他的手，他露出了微笑。[say: 嗯，观众更喜欢看点戏剧性的场面，不过普通的比赛也行，]奥兹说。[say: 那就上擂台吧。][pg]");
            }
            else
            {
               outputText("你拒绝和他握手。他眯起眼睛，打量着你，试图弄明白为什么。奥兹大笑一声打破了紧张的气氛。[say: 漂亮！观众就喜欢这种充满火药味的比赛。把怒火积攒起来，然后在擂台上发泄出来吧！][pg]");
            }
         }
         outputText("奥兹带着你们俩走向擂台。当你们走上擂台时，人群变得兴高采烈、充满活力，不少人异口同声地高呼你的名字。你情不自禁地感到充满活力和动力，即使你的名气还仅限于集市里的这个临时擂台。");
         outputText("[pg][say: 女士们，先生们，]奥兹对着人群说。[say: 恶魔之拳消失了，但好戏还在后头！站在这一边的，是[ringname]，现任勇者，那个最终击败了恶魔之拳的人！]奥兹等观众反应过来才继续说下去，观众的反应很快，爆发出更加热烈的欢呼声，赞颂着你的名字。[say: 而站在另一边的，是一位突然出现的挑战者，他已经通过击败许多经验丰富的战士证明了自己的实力！<DOG_NAME>！]犬娘慵懒地举起手回应他的名字被呼唤，人群对他也很友好，赞扬他的勇气。");
         outputText("[pg][say: 好了，别再磨蹭了！你们想要战斗，那就给你们战斗！]奥兹说着，看了看你，又看了看<DOG_NAME>，确认你们俩是否准备好了。你们俩都点了点头，表示确认。犀牛兽人举起右臂。[say: 准备好了吗？开始！]他大喊一声，然后挥下手臂。战斗开始了！");
         startCombat(new PlaceholderDodgyMonster());
      }
      
      public function followTheLine() : void
      {
         clearOutput();
         outputText("你顺着显眼的恶魔队伍找到了它的源头，一个相当不起眼的帐篷，在集市的其他商店中并不显眼。然而，当你靠近时，你注意到的一件事是，有不少恶魔和其他生物正在离开帐篷，其中大多数都青肿流血。低头看去，你注意到地上有几块令人不安的血迹和汗迹。无论那个帐篷里发生了什么，都很暴力。");
         menu();
         addNextButton("加入排队",enterTheLine).hint("不管是要看热闹还是亲自上场干一架，你都兴趣十足。");
         addNextButton("溜之大吉",backToBazaar).hint("你的血还是待在血管里比较好，至少现在是这样。");
      }
      
      public function enterTheLine2() : void
      {
         clearOutput();
         outputText("你们俩熬过了漫长的等待，时不时能听到人群惊叹的声音，紧接着总会有一个被打得破破烂烂的恶魔离开帐篷。每一分钟的流逝都让你怀疑这等待是否值得，但你还是坚持了下来，安慰自己已经浪费了太多时间，现在回去太不划算了。又过了几分钟，你终于进入了帐篷。");
         outputText("[pg]帐篷里的空气很闷，充斥着汗水和鲜血的味道，高温几乎让人无法忍受。在中央，你看到一个临时搭建的拳击台，显然是匆忙建成的。你看到一个身材魁梧的靛蓝色恶魔在里面，还有一个明显瘦弱得多的深红色皮肤的恶魔。靛蓝色恶魔正用上勾拳击中深红色恶魔的下巴，这一招的速度和力量足以让全场观众感同身受地倒吸一口凉气。");
         outputText("[pg]深红色恶魔像石头一样倒在临时拳击台的地板上，观众们焦急的沉默瞬间化作欢呼。你尽力挤到一个视野不错、相对舒适的位置，却在过程中跟丢了矮小的米菲克斯。");
         outputText("[pg]靛蓝色恶魔挥了挥手，示意一个犀牛兽人跳进擂台，把那个仍然昏迷不醒的恶魔拖走。他从擂台的一个角落拿出一个水袋，喝了一点，然后把剩下的倒在头上。他从擂台外拉过一张凳子，放在地板上坐下，放松地瘫倒在上面。");
         outputText("[pg][say: 打得不错，] 靛蓝色恶魔气喘吁吁地说。[say: 速度快，脑子聪明，但下巴绝对是个弱点。今天这是第几个了？]");
         outputText("[pg]观众们齐声高喊着\"七\"，让这头恶魔露出了笑容。[say:好了，好了。我想今天我还能再打一场。]他站起身来，令观众们惊叹不已，他伸展着肩膀，揉了揉缠满绷带的指节，绷带布料早已被先前那些斗士的鲜血浸成了深褐色。[say:观众席里有谁]——他自信地笑着指向人群——[say:有胆子来跟恶魔之拳过两招吗？]念完自己的名号后，他翻了翻白眼，或许连他自己都觉得这称号听着挺蠢的。");
         outputText("[pg]观众沉默了片刻。你脑海中闪过亲自跳上擂台的念头，但还没等你有所行动，就有人喊出了自己的名字——\"米菲克斯\"，那个声音喊道。");
         outputText("[pg][say: 米菲克斯，是吗？我看不见你！到擂台上来，让我们看看你有什么本事，] 恶魔之拳大喊道。拥挤的人群中让出了一个空地，露出了瘦骨嶙峋的米菲克斯，这立刻引起了观众的笑声，有些是压抑的，有些则毫不掩饰。[say: 好了伙计们，不要低估任何一个对手！] 恶魔之拳说着，向小恶魔挥手示意他爬上擂台。[say: 这又不是我第一次和看起来比实际更强或更快的人打架了。如果他是个傻瓜，嗯，在我看来……]");
         outputText("[pg]米菲克斯在人群中穿梭，有些艰难地进入了擂台。");
         outputText("[pg][say: 当傻瓜也比当懦夫强。]");
         doNext(miffixFight);
      }
      
      public function enterTheLine() : void
      {
         clearOutput();
         saveContent.learnedOfDemonFist = true;
         outputText("出于好奇，你决定加入这长长的队伍。你拍了拍前面一个烦躁的小恶魔的肩膀，他转过身来，满脸狐疑地看着你。你问他这队伍是干什么的。他用尖锐的嗓音抱怨了一声，但还是回答了你。");
         outputText("[pg][say: 你傻啊？这是恶魔之拳的竞技场！你要么免费看他打架，要么下注亲自上场找乐子。]");
         outputText("[pg]你点点头，问他打算选哪一个。他环顾四周，显得有些紧张，然后凑到你耳边低声说道。");
         outputText("[pg][say: 我要去碰碰运气，我一定要去。我已经攒够了宝石]——他沉默了片刻，瞪大了难以置信的双眼，用口型比划出\"五百\"——[say: 够付和他打一场的钱了，而且我看了足够多的比赛，早就摸清了他所有的招式。我能赢的！]");
         outputText("[pg]你问他为什么要在一场战斗上冒这么大的风险，毕竟他自己看起来并不怎么强壮，而且那些离开帐篷的鼻青脸肿的恶魔中，有些可是相当肌肉发达的。他显然被冒犯了，尖尖的耳朵耷拉下来，咬着嘴唇。");
         outputText("[pg][say: 我——我能行！我经常被这里的其他恶魔嘲笑，但只要小恶魔米菲克斯击败恶魔之拳的消息传开，他们都会尊敬我的！魅魔们会对我投怀送抱，其他小恶魔会害怕我，我敢打赌莉希丝甚至会雇佣我做她军队里的队长，让我成为自泽塔兹以来最受尊敬的小恶魔！]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,128) != 0)
         {
            outputText("[pg]你点点头，告诉他莉希丝的军队里可能真的有空缺，毕竟你亲手杀了泽塔兹。小恶魔紧张地笑了起来。[say: 呵——呵呵，你当然杀了。你甚至和那个勇者的描述一模——] 他的眼睛睁得大大的，沉默了片刻，然后迅速转过身去面对队伍。");
         }
         else
         {
            outputText("[pg]你点点头，祝他在这个疯狂的赌博中好运。他再次转过身去面对队伍。");
         }
         doNext(enterTheLine2);
      }
      
      public function demonFistTentDescription() : void
      {
         if(get_time().hours <= 18)
         {
            if(!saveContent.learnedOfDemonFist)
            {
               outputText("[pg]几个恶魔似乎正径直走向一个你从站立的地方看不清的位置。从它们的数量来看，似乎值得一去。");
            }
            else
            {
               outputText("[pg]恶魔们不断涌向一个视线之外的帐篷，这让你想起了恶魔之拳的竞技场。显然，它的受欢迎程度从未降低。");
            }
         }
      }
      
      public function defendTitle() : void
      {
         var skip:Boolean;
         var shake2:Boolean;
         var _g2:DemonFistFighterScene;
         var shake1:Boolean;
         var _g1:DemonFistFighterScene;
         var shake:Boolean;
         var _g:DemonFistFighterScene;
         clearOutput();
         menu();
         outputText("你告诉奥兹你想打一场。他脸上露出了贪婪的笑容。[say: 太棒了。有勇者出战，今天的上座率应该会提高不少。]");
         if(saveContent.timesWon == 1)
         {
            outputText("[pg]他撅起粗糙的嘴唇，向人群吹了声口哨，只见一对黑色的耳朵从人海中探出，转向犀牛。<DOG_NAME>过了一会儿从人群中挤了出来，看起来很自信，但又不过分张扬。奥兹把手搭在你们俩的肩膀上，用力地摇晃着，伴随着低沉的笑声。这让你有点烦躁，你也能看出那只饱经风霜的犬娘也很烦。");
            if(saveContent.timesFoughtDog == 0)
            {
               outputText("[pg][say: [Ringname]，这位是<DOG_NAME>。我想现任勇者就不需要介绍了吧？]");
               outputText("[pg][say: 没错，]犬娘说着，露出了充满竞争意味的笑容。[say: 听说恶魔之拳被干掉的消息时，我挺惊讶的。几个月前他打掉了我几颗牙，所以我得来看看这位新勇者到底有什么本事。希望不是凭运气。]");
               outputText("[pg]你向他保证绝对不是运气。他点了点头，伸出手要和你握手。");
               _g = this;
               shake = true;
               addNextButton("握手",function():void
               {
                  _g.introDogFight(shake);
               }).hint("当然，和他握手。");
               _g1 = this;
               shake1 = false;
               addNextButton("不握手",function():void
               {
                  _g1.introDogFight(shake1);
               }).hint("不和他握手。");
            }
            else
            {
               outputText("[pg][say: 好吧，你们已经互相认识了，没必要浪费时间。继续战斗吧，这才是观众想看的，也是我们赚钱的门道。");
               _g2 = this;
               shake2 = true;
               skip = true;
               addNextButton("战斗",function():void
               {
                  _g2.introDogFight(shake2,skip);
               });
            }
         }
      }
      
      public function chatOriginsAnswer(param1:int) : void
      {
         clearOutput();
         switch(param1)
         {
            case 0:
               outputText("你告诉他你的故事与他无关。他开怀大笑。[say:哇，刚问完我的故事就来这套。你真是个混蛋，下次我们打架的时候，我会为了这个多揍你一拳的。]");
               outputText("[pg]女服务员来到你们桌前，递给他另一个马克杯，然后收走空杯子离开。他浅尝了一口，再次转向你。[say: 还有什么要问的吗？我希望这次谈话不要那么单向。]");
               break;
            case 1:
               outputText("你深吸一口气，直视他的眼睛，这让他挑起了一侧眉毛。思考了片刻后，你开始讲述你的整个故事。你描述了英格纳姆、长老们、他们选择祭品的过程、伊尔加斯特山的传送门、你穿过传送门的准备工作、泽塔兹、营地，所有的一切，甚至细致到了最微小的细节。");
               outputText("[pg]当你说完时，你注意到他的另一杯麦酒已经喝了四分之一，他正看着一个随机的方向享受着他的饮料。当他注意到你说完时，他猛地回过神来。[say:该死，这非常有趣。关于它的一切都很酷。是的。]");
               outputText("[pg]情况本来可能会更糟。");
               break;
            case 2:
               outputText("你告诉他，你的过去真的没什么有趣的。几乎不值得在喝麦酒的时候分享。");
               outputText("[pg]他耸耸肩。[say:那随你便吧。我本来希望这次谈话不会那么单方面，但我不能要求你为了显得更有趣而撒谎。]");
               outputText("[pg]女服务员来到你们桌前，递给他另一个马克杯，然后收走空杯子离开。他浅尝了一口，再次转向你。[say: 还有什么要问的吗？我希望这次谈话不要那么单向。]");
               break;
            case 3:
               outputText("你并不打算告诉他你的真实故事。你思考了片刻，向他讲述了你能想到的最宏大、最疯狂的故事，回忆起在英格纳姆听过的每一个传说，并加入了一些玛瑞斯的元素。恶魔之拳出人意料地被它吸引了，尽管从他的表情来看，他更感兴趣的是你的创造力，而不是其他什么。");
               outputText("[pg][say: 呵，太神奇了。我从来不知道莉希丝暗中听从你的命令，也不知道那些古老的先知，不管他们是谁，在5000年前就预言了你从星空降临。另外，我很确定如果有人把火山打得喷发了，全玛瑞斯的人都会注意到，但也许那天我只是没注意。]");
               outputText("[pg]女服务员来到你们的桌旁，又递给他一杯酒，收走空杯后便离开了。他小抿一口，才重新转向你。[say: 你这人挺有意思的，[name]。没错，\"有意思\"这个词再合适不过了]");
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function chatOrigins() : void
      {
         var answer3:int;
         var _g3:DemonFistFighterScene;
         var answer2:int;
         var _g2:DemonFistFighterScene;
         var answer1:int;
         var _g1:DemonFistFighterScene;
         var answer:int;
         var _g:DemonFistFighterScene;
         clearOutput();
         outputText("你问这个恶魔他的身世。是什么让像他这样的恶魔在集市里开了一个角斗场？");
         outputText("[pg]他嗤笑一声，身子向后靠在椅子上。[say: 这个问题有点无聊，不是吗？]");
         outputText("[pg]你表示同意，但也指出这确实是个不错的开场话题。他挠了挠下巴，思索片刻后点了点头。[say: 行吧，好吧，虽说也没什么特别的。我从哪儿说起呢？][pg]他捂住嘴打了个嗝——对于他这副粗犷模样的人来说，这礼仪倒是讲究得出人意料。接着他用手指轻敲桌面，开始讲述他的故事。[say: 我这辈子大多平淡无奇、不值一提，所以你想听的估计是那些更有意思的、 \"恶魔\"相关的勾当吧。不过话说回来，带一帮劫掠者混饭吃，也算不上什么恶魔专属的买卖就是了。]");
         outputText("[pg]你让他继续说下去，询问关于他帮派的细节。");
         outputText("[pg]他轻轻地呻吟了一声。[say: 妈的，不知道该说什么。我们四处游荡，掠夺，杀戮，强奸。最后我厌倦了，就在这里安顿下来了。]");
         outputText("[pg]就这样？你继续向他打探消息，问他最初是怎么统治一群恶魔的。是莉希丝把这群恶魔赐给他的吗？");
         outputText("[pg]他轻笑了一声。[say:哈，莉希丝，说得好。我顶多在两百英尺外瞥见过一眼莉希丝的乳沟，而且我不信她会在乎我干了什么。不，我可不是靠那个起家的。在那个年代，基本上就是一场混战。你能抢到什么就是什么。我能抢到的比大多数人都多，其他恶魔自然就跟着我了。]");
         outputText("[pg]你点点头，问他为什么会厌倦管理他的帮派。他大口喝了一口杯里的酒，擦了擦嘴，叹了口气。");
         outputText("[pg][say:一开始很棒，别误会。我们洗劫的每个村庄都有一些有本事的战士，他们愿意为了保护自己而拼死抵抗。那些日子里我也有过几次与死神擦肩而过的经历。]他笑了起来，可能是想起了其中的某次遭遇。[say:不过过了一阵子，很明显我们赢了，再也没有人能真正挑战我们——或者说挑战我了。偶尔有恶魔想取代我的位置，这还能让我稍微热血沸腾一下，但当我的杀敌数变得太高时，连这种事也没了。]");
         outputText("[pg]你指出，他似乎是为了战斗而参与其中，而不是为了性或财富。");
         outputText("[pg]他微微一笑。[say: 算是吧，没错。于是有一天我解散了帮派，用剩下的那点战利品建了你们口中的那个格斗场。对一个打腻了弱鸡的\"老手\"来说，这可算是个不错的养老地。]");
         outputText("[pg]他又喝了一大口，突然停了下来，因为他发现杯子空了。他把杯子放在桌上，目光转向你，同时举起手臂要了另一杯。");
         outputText("[pg][say:那你呢，[name]？你有什么故事？]他问道，不过无论你的回答是什么，他似乎都不是特别好奇。");
         outputText("[pg]你不确定告诉他你的真实来历是不是个好主意。");
         menu();
         _g = this;
         answer = 0;
         addNextButton("关你屁事",function():void
         {
            _g.chatOriginsAnswer(answer);
         }).hint("这不关他的事。");
         _g1 = this;
         answer1 = 1;
         addNextButton("英格纳姆",function():void
         {
            _g1.chatOriginsAnswer(answer1);
         }).hint("用真相打击他。他不太可能会相信的。对吧？");
         _g2 = this;
         answer2 = 2;
         addNextButton("流浪者",function():void
         {
            _g2.chatOriginsAnswer(answer2);
         }).hint("只是一个没有惊人故事的流浪者。");
         _g3 = this;
         answer3 = 3;
         addNextButton("撒谎",function():void
         {
            _g3.chatOriginsAnswer(answer3);
         }).hint("编造一个你能想到的最疯狂的谎言。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function challengeBegins() : void
      {
         var _loc1_:Player = get_player();
         _loc1_.set_gems(_loc1_.get_gems() - 500);
         outputText("你举起一只手，自信地喊出你的擂台名。人群转身看着你，而恶魔之拳则饶有兴趣地看着你，手指抚摸着下巴，微笑着。[say: 很好，[ringname]。拿出你的筹码，爬上擂台。让我们看看你有什么本事！]");
         outputText("[pg]你从装备中拿出一个宝石袋，人群在你面前分开，给你让出一条通往擂台的清晰道路。你绷紧肌肉爬上擂台，一进去就迅速把袋子扔给恶魔之拳。像往常一样，他立刻把它扔给了那个犀牛人。你低头盯着勇者，他也同样盯着你。[say: 如果你不知道规则，很简单，]他一边说，一边把指关节捏得咔咔作响。[say: 你可以对我使用任何武器和下三滥的手段。随便你。我唯一的规则是不能使用魔法。如果我看到你施法，那这就不会是一场有趣的切磋了。我很确定这里的观众也不会买账的。所以，明白了吗？]");
         outputText("[pg]你点点头表示接受。他笑了。[say: 很好。那么，用你所有的本事来打我吧！当你攻击我时，战斗就开始了。来吧！给我一个挑战，给观众一场表演！]");
         outputText("[pg]恶魔之拳向你伸出一只手臂，示意你攻击他。人群为你们俩欢呼，你准备好出击。<b>战斗开始了！</b>");
         var _loc2_:DemonFistFighter = new DemonFistFighter();
         _loc2_.createStatusEffect(StatusEffects.GenericRunDisabled,0,0,0,0);
         get_combat().beginCombat(_loc2_);
      }
      
      public function backToBazaar() : void
      {
         var _g:Bazaar;
         clearOutput();
         outputText("你眯起眼睛，摇了摇头，然后转身离开了帐篷。你现在真的不喜欢无端的暴力，尤其是当你可能成为暴力的承受者时。");
         _g = get_game().bazaar;
         doNext(function():void
         {
            _g.enterTheBazaarAndMenu();
         });
      }
      
      public function angryDemonfistPlayerLoss2() : void
      {
         clearOutput();
         cheatTime(2);
         outputText("体液和腐烂食物的混合气味刺痛了你的鼻腔，意识再次粗暴地侵入你的大脑。你的四肢和肌肉一个接一个地向你宣告它们的存在，主要是通过酸痛感。");
         outputText("[pg]你睁开眼睛，发现自己被扔进了一条臭水沟里，这地方很可能是集市居民倒垃圾的地方。你呻吟着爬起来，检查了一下自己的装备，令人惊讶的是，它们都还在原处。你拍掉身上一些不可名状的液体，望向集市的边缘。");
         outputText("[pg]也许以后再说吧，你心想。");
         get_combat().cleanupAfterCombat();
      }
      
      public function angryDemonfistPlayerLoss() : void
      {
         _temp_1.timesBrokenRules += 1;
         outputText("你踉跄着后退，几乎站立不稳。你的视线变得模糊，努力想要将注意力集中在对手身上。恶魔之拳摇了摇头，眼中流露出明显的轻蔑。[pg]");
         if(timesFoughtDemonfist() > 1 && saveContent.timesBrokenRules == 1)
         {
            outputText("[say: 怎么回事，\"[Ringname]\"？是不是我的一拳把你脑子打成了浆糊？你明明知道规矩，该死的！]");
            outputText("[pg]他看向人群，戏谑地耸了耸肩，仿佛在表示是你逼他出手的。观众的反应分为欢呼和嘲笑，恶魔之拳自己也忍不住笑了起来。[say: 很好，你们都知道作弊者该有什么下场！]他一边说着，一边握紧了右拳。");
         }
         else if(timesFoughtDemonfist() == 0)
         {
            outputText("[say: 这一切有什么意义？你是蠢到不懂遵守简单的规则，还是战斗开始后吓破了胆？废物。]他望向人群，微笑着。[say: [he]会得到[he]应得的，不是吗？]");
         }
         else if(saveContent.timesBrokenRules > 1)
         {
            outputText("[say: [Ringname]，我得告诉你。你要么是脑子进水了，要么就是觉得耍阴招迟早能赢。不可能的。这种事只会不断发生，一遍又一遍。而且每一次……]");
         }
         outputText("[pg]人群爆发出狂热的欢呼声，震耳欲聋的声浪加剧了你的困惑。接下来的几秒钟仿佛变成了慢动作：恶魔之拳挥舞着准备好的拳头向你冲来，你深吸一口气，试图抬起双臂防御，他的拳头却像炮弹一样砸在了你的下巴上。");
         outputText("[pg]当你倒在擂台地板上时，你几乎感觉不到周围世界的变移。很快，世界陷入了黑暗。");
         doNext(angryDemonfistPlayerLoss2);
      }
   }
}

