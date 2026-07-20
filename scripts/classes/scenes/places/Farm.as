package classes.scenes.places
{
   import classes.Appearance;
   import classes.BaseContent;
   import classes.CoC;
   import classes.CockTypesEnum;
   import classes.DebugMenu;
   import classes.DynStat;
   import classes.DynStatOp;
   import classes.ImageManager;
   import classes.ItemType;
   import classes.PerkLib;
   import classes.Player;
   import classes.SelfDebug;
   import classes.StatusEffects;
   import classes.Time;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.display.SpriteDb;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.items.Consumable;
   import classes.items.ConsumableLib;
   import classes.saves.SelfSaver;
   import classes.saves.SelfSaving;
   import classes.scenes.Camp;
   import classes.scenes.Inventory;
   import classes.scenes.npcs.MarbleScene;
   import classes.scenes.places._Farm.SaveContent;
   import classes.scenes.places.farm.FarmCorruption;
   import classes.scenes.places.farm.Kelly;
   import classes.scenes.places.farm.KeltScene;
   import coc.view.CoCButton;
   import flash.Boot;
   import haxe.IMap;
   
   public class Farm extends BaseContent implements SelfDebug, SelfSaving
   {
      
      public var saveVersion:int;
      
      public var saveName:String;
      
      public var saveContent:SaveContent;
      
      public var keltScene:KeltScene;
      
      public var kelly:Kelly;
      
      public var globalSave:Boolean;
      
      public var farmCorruption:FarmCorruption;
      
      public function Farm()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         farmCorruption = new FarmCorruption();
         kelly = new Kelly();
         keltScene = new KeltScene();
         globalSave = false;
         saveVersion = 1;
         saveName = "农场";
         saveContent = new SaveContent(null,null,null);
         super();
         SelfSaver.register(this);
         DebugMenu.register(this);
      }
      
      public function workFarm() : void
      {
         var _loc2_:* = null as Player;
         var _loc5_:* = null as Array;
         var _loc1_:Number = 0;
         clearOutput();
         if(!get_player().hasStatusEffect(StatusEffects.NoMoreMarble) && get_player().hasStatusEffect(StatusEffects.MarbleWithdrawl))
         {
            if(get_game().marbleScene.get_knowAddiction() == 1)
            {
               get_marbleScene().addictedEncounterHappy();
            }
            else
            {
               get_marbleScene().encounterMarbleAshamedAddiction();
            }
            return;
         }
         if(Utils.rand(3) == 0 && !get_player().hasStatusEffect(StatusEffects.NoMoreMarble) && get_player().hasStatusEffect(StatusEffects.Marble))
         {
            if(get_player().hasStatusEffect(StatusEffects.MarbleRapeAttempted) || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,463) == 3)
            {
               get_marbleScene().marbleAfterRapeBattle();
               get_player().createStatusEffect(StatusEffects.NoMoreMarble,0,0,0,0);
               return;
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,463) == 1)
            {
               get_marbleScene().marbleWarningStateMeeting();
               return;
            }
            if(get_player().hasStatusEffect(StatusEffects.Marble))
            {
               if(get_game().marbleScene.get_knowAddiction() == 0)
               {
                  _loc1_ = Utils.rand(2);
                  if(_loc1_ == 0)
                  {
                     get_marbleScene().helpMarble1();
                  }
                  if(_loc1_ == 1)
                  {
                     get_marbleScene().helpMarble2();
                  }
                  return;
               }
               if(get_player().hasPerk(PerkLib.MarbleResistant))
               {
                  get_marbleScene().postAddictionFarmHelpings();
                  return;
               }
               if(get_game().marbleScene.get_knowAddiction() == 1)
               {
                  if(get_player().hasStatusEffect(StatusEffects.MarbleWithdrawl))
                  {
                     _loc1_ = 0;
                  }
                  else
                  {
                     _loc1_ = 1;
                  }
                  if(_loc1_ == 0)
                  {
                     get_marbleScene().addictedEncounterHappy();
                  }
                  else
                  {
                     get_marbleScene().marbleEncounterAddictedNonWithdrawl();
                  }
                  return;
               }
               if(get_player().hasStatusEffect(StatusEffects.MarbleWithdrawl))
               {
                  _loc1_ = 0;
               }
               else
               {
                  _loc1_ = 1;
               }
               if(_loc1_ == 0)
               {
                  get_marbleScene().encounterMarbleAshamedAddiction();
               }
               else
               {
                  get_marbleScene().marbleEncounterAddictedNonWithdrawlAshamed();
               }
               return;
            }
         }
         if(Utils.rand(4) == 0)
         {
            spriteSelect(SpriteDb.get_s_whitney());
            outputText("你发现惠特尼正从她的工具棚里拿出一把镰刀。[say: 你知道怎么清理马厩吗？]当你提出帮忙时，她问道。你承认你在村里长大的时候经常做这种事。递给你一把耙子、铲子和干草叉后，她带你去了挤奶棚。");
            outputText("首先扑面而来的是一股味道，那是汗水、牛奶、粪便和腐烂干草的混合气味。惠特尼的牛群里可能还有一些准备配种的母牛。[pg]");
            outputText("惠特尼打开其中一个空畜栏的门，说道：[say: 我没法像我应该做的那样经常清理它们。你能帮上任何忙都行。][pg]");
            outputText("你硬着头皮，无视你");
            if(Boolean([2,11,28,6].contains(get_player().face.type)))
            {
               outputText("敏感的");
            }
            outputText("鼻子，开始工作。");
            if(get_player().cowScore() + get_player().minoScore() > 0)
            {
               dynStats(DynStat.Lust(get_player().cowScore() + get_player().minoScore()));
            }
            outputText("[pg]一个小时后，你再也忍受不了，走出了挤奶棚。你大口呼吸着新鲜空气，把工具拖回工具棚，心里承认惠特尼比你想象的要勤奋得多，体质也强壮得多。");
            outputText("[pg][say: 剩下的我来处理。谢谢你帮我。这是你的报酬，]她说着，递给你五颗宝石。");
            outputText("[pg]你向自己保证，只要你的鼻子恢复了，你一定会再来帮她的。");
            if(get_player().get_str100() <= 25 || Utils.rand(2) == 0)
            {
               dynStats(DynStat.Str(1));
            }
            if(get_player().get_tou100() <= 25 || Utils.rand(2) == 0)
            {
               dynStats(DynStat.Tou(1));
            }
            _loc2_ = get_player();
            _loc2_.set_gems(_loc2_.get_gems() + 5);
            get_player().changeFatigue(20);
            doNext(get_camp().returnToCampUseOneHour);
            return;
         }
         spriteSelect(SpriteDb.get_s_whitney());
         outputText("你问惠特尼是否需要帮忙，她指着辣椒田说：[say: 你介意花一两个小时去摘些辣椒吗？我今晚做晚饭需要一些。我甚至可以让你留下最好的一颗！][pg]");
         outputText("你点点头，借了个篮子，朝田里走去。接下来的两个小时在汗水和辛勤劳作中模糊不清，你在植物行间穿梭，尽可能多地采摘成熟的红辣椒。完成后，你把篮子放在惠特尼的门前，当然，你没忘记拿走属于你的那颗辣椒。[pg]");
         if(get_player().get_spe100() <= 25 || Utils.rand(2) == 0)
         {
            dynStats(DynStat.Spe(1));
         }
         if(get_player().get_tou100() <= 25 || Utils.rand(2) == 0)
         {
            dynStats(DynStat.Tou(1));
         }
         get_player().changeFatigue(20);
         var _loc3_:Number = Utils.rand(4);
         var _loc4_:ItemType = null;
         if(_loc3_ <= 2)
         {
            _loc4_ = get_consumables().CANINEP;
         }
         else
         {
            _loc5_ = [get_consumables().LARGEPP,get_consumables().DBLPEPP,get_consumables().BLACKPP,get_consumables().KNOTTYP,get_consumables().BULBYPP,get_consumables().WOLF_PP];
            _loc4_ = _loc5_[Utils.rand(int(_loc5_.length))];
         }
         get_inventory().takeItem(_loc4_,get_camp().returnToCampUseTwoHours);
      }
      
      public function whitneySprite() : void
      {
         spriteSelect(SpriteDb.get_s_whitney());
      }
      
      public function whitneyMilkerRefusal() : void
      {
         spriteSelect(SpriteDb.get_s_whitney());
         clearOutput();
         outputText("惠特尼耸了耸肩，你们俩继续交谈。但天下没有不散的筵席，你们俩最终还是分道扬镳了。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function whitneyMilkerHookup(param1:Boolean = true) : void
      {
         spriteSelect(SpriteDb.get_s_whitney());
         clearOutput();
         outputText("惠特尼把设备带回了她的农场，并保证在一小时内让它运转起来。她确实给你留下了一个隐晦的警告：[say:把挤奶的事留给野兽吧，免得你自己也变成野兽。]");
         outputText("[pg]你耸了耸肩，转身回营地查看情况。");
         if(param1)
         {
            get_player().createKeyItem("Breast Milker - Installed At Whitney\'s Farm",0,0,0,0);
            get_player().removeKeyItem("Breast Milker");
         }
         else
         {
            get_player().createKeyItem("Cock Milker - Installed At Whitney\'s Farm",0,0,0,0);
            get_player().removeKeyItem("Cock Milker");
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function whitneyFightsGnoll() : void
      {
         clearOutput();
         outputText("当你漫步时，响亮的马嘶声吸引了你的注意力，你的目光立刻被远处的一辆马拉货车吸引。在冒险本能的驱使下，你迅速靠近，看看发生了什么事。");
         outputText("[pg]货车上装载着各种农产品，你在环顾四周寻找主人时很快就注意到了。一个瘦长、肮脏的豺狼人愤怒地咆哮着，当她靠近时，进一步惊吓了马。豺狼人手里拿着一根棍子，握把上方一点的地方插着一支弩箭。又一支弩箭飞来，射中了豺狼人的手臂！这个野兽般的女人尖叫着踉跄后退，打算撤退。你顺着射击的方向追溯到地面，在马附近，发现惠特尼正用她的十字弓直直地瞄准你。");
         outputText("[pg]狗女孩专注的神情放松下来，她放下了武器。[say: 啊，见鬼，[name]，我还以为这是个伏击呢！]她如释重负地喊道。惠特尼爬起来，抚摸着马，安抚它，让它安静下来。[say: 我把货物送到这么远的地方，收费很高，但我还是在想这是否值得。]");
         outputText("[pg]虽然她带着农产品穿越危险区域并不令人惊讶——有什么区域是不危险的呢？——但你确实想知道她是送货给谁的。");
         outputText("[pg][say: 附近的一些旅行商人通常不会靠近湖边，但他们特别喜欢我种的辣椒。这里还有几个其他的聚居地，]她一边检查她的动物是否受伤，一边解释道。[say: 不过，那些豺狼人更愿意轮奸我，然后把食物抢走。]");
         outputText("[pg]在这里旅行确实很危险，但惠特尼难道不能多带点护卫吗？" + (get_marbleScene().marbleFollower() ? " 诚然，你带走了玛布尔，但如果惠特尼想让玛布尔白天多陪她走一段路，你也不是不能理解。" : "") + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2030) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,725) < 4 ? " 凯尔特肯定能帮上忙，他的身高能提供良好的视野，而且他显然精通弓箭。" : ""));
         outputText("[pg][say: 我不能让农场无人看管，你知道的，而且我也没有你想象的那么脆弱。]检查完毕后，这位农夫重新爬上马背。[say: 不过，还是谢谢你的关心。在外面注意安全，[name]。]");
         outputText("[pg]说完，惠特尼再次出发，用手推车将她的农产品运往目的地。");
         saveContent.gnoll = true;
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function talkWhitney() : void
      {
         var breast:Boolean;
         var _g1:Farm;
         var _g:Farm;
         spriteSelect(SpriteDb.get_s_whitney());
         clearOutput();
         if(!get_player().hasKeyItem("Fake Mare") && get_player().isTaur())
         {
            centaurToysHoooooo();
            return;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,458) > 0 && get_player().hasStatusEffect(StatusEffects.Kelt) && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1070) == 0)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1070,1);
            outputText("你发现惠特尼像往常一样在树下，正埋头看书。当你走近时，她心不在焉地对你笑了笑。");
            outputText("[pg][say: 看来你一直在到处打听，]她说道。从她直率的语气中很难判断她是在开玩笑还是在指责你；这个犬娘有着独居多年的女人的举止。[say: 你觉得我这小地方怎么样？]你如实回答说这里非常宁静漂亮，在这片野蛮贪婪的土地上显得有些格格不入。你说这里看起来经营得很好，考虑到似乎只有她、玛布尔和……你的眉头皱了起来。惠特尼理解地笑了笑。");
            outputText("[pg][say: 他们两个都很努力，只是方式不同。如果没有他们，我恐怕很难维持这个农场。]她叹了口气。[say: 当你身处这种偏远的地方时，你必须包容那些和你凑在一起的人。要理解别人，发现每个人身上的闪光点。如果你设定了界限并坚守它们，你就能和大多数人相处得来。]她看着你的眼睛。[say: 不过，你应该注意不要随便和什么人待太久。有些人对你没安好心。还有些人自以为对你好，那才更危险。明白我的意思吗？]你不太明白，但你清楚地感觉到自己受到了某种警告。你感到有些不安，礼貌地告辞了。惠特尼点点头，又回到了她的书本中，一副平静的模样。");
            doNext(get_camp().returnToCampUseOneHour);
            return;
         }
         if(get_game().telAdre.isDiscovered() && get_game().telAdre.isAllowedInto() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1071) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1070) == 1)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1071,1);
            outputText("你发现那个犬娘坐在一张凳子上，正在手工挤牛奶。你走近时她猛地抬起头，但看到是你后，她立刻露出了微笑。");
            outputText("[pg][say: 嘿，陌生人！最近怎么样？]当你站在她旁边，看着她熟练地拉扯着牛的乳头，而那头牛则呆滞地盯着你的脸时，你感到有些奇怪。你向她描述了你最近偶然发现的沙漠中那座不可思议的城市，并问她是否去过那里。[say: 呵。我当然去过，]惠特尼头也不抬地说。[say: 以前就住在那里。" + (get_urtaDisabled() ? "" : " 乌尔塔还在吗？我和她上过同一所学校，后来她劝我和她一起加入卫队。每只狗都有责任！那是她的口头禅。]犬娘笑了起来。[say: 她只是害怕一个人睡。真是个傻瓜，但她是个好朋友。") + "]");
            outputText("[pg]你问她为什么离开。");
            outputText("[pg][say: 我有我的理由。我在乡下长大，]她顿了顿继续说道，[say: 从来都不太喜欢城市生活。尤其不喜欢炎热、尘土飞扬、拥挤又臭气熏天的城市生活。当然，农场生活也很臭，]她承认道，一边提起奶桶，开始朝谷仓走去。你提出要帮忙，但她摇了摇头。[say: 但至少这里的臭味是你自己制造的。我八年前搬到这里，从来没有后悔过。" + (get_urtaDisabled() ? "" : " 至于乌尔塔……好吧，那时候她已经在瓶底找到了更好的朋友。 ") + "]她提着牛奶消失在谷仓里，你决定不再追问。");
            doNext(get_camp().returnToCampUseOneHour);
            return;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,88) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1072) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1071) == 1)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1072,1);
            outputText("你发现惠特尼在挤奶棚外，正仔细地在长条桌上写标签，并把它们贴在大瓶牛奶上。");
            if(get_player().hasStatusEffect(StatusEffects.BreastsMilked))
            {
               outputText("你不自在地注意到其中有许多贴着“[name]”的标签，一股强烈的吸吮你[nipples]的记忆涌上心头。");
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,331) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,375) != -1)
            {
               outputText("在最远端有一小簇雪花石膏，上面标着“乔乔”。");
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,331) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,375) == -1)
            {
               outputText("在最远端有一小簇雪花石膏，上面标着“伊莎贝拉”。");
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,331) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,375) == -1)
            {
               outputText("在最远端有一簇雪花石膏标着“乔乔”，另一簇标着“伊莎贝拉”。");
            }
            outputText("你问她这些都卖给谁。");
            outputText("[pg][say: 主要是半人马和地精，]她回答道。[say: 有时候山里人也会下来交易。牛奶对鹰身女妖或蛇怪来说是稀罕物，能让她们停下发情和打斗两分钟来买点。]她叹了口气。[say: 以前你还能和她们说说话，打听点消息，但现在她们大多连这都懒得做了——只是指着她们想要的东西，扔下宝石就走。豺狼人和小恶魔也喜欢牛奶，]她用更强硬的语气继续说道，[say: 但他们更喜欢偷。玛布尔和凯尔特会处理他们。]");
            if(get_player().hasStatusEffect(StatusEffects.BreastsMilked))
            {
               outputText("[pg]她对你笑了笑。[say: 当然，你的产品我收的是最高价的宝石。人类的乳汁现在是非常稀有的商品，而且对大多数人都有强大的镇静作用。大家都喜欢买给孩子们喝。]");
            }
            if(get_player().hasStatusEffect(StatusEffects.CockPumped))
            {
               if(!get_player().hasStatusEffect(StatusEffects.BreastsMilked))
               {
                  outputText("[pg]");
               }
               outputText("你注意到桌子上有一个货箱，里面整齐地排列着许多装满乳白色液体的小瓶子。你花了一会儿才意识到那是什么。[say: 你以为我为什么要花钱买它？]惠特尼笑着说，捕捉到了你的表情。[say: 我可以留一些给我的畜群用，但卖给地精和鹰身女妖也一样容易。从我这里买，总比浪费精力去抓个萨堤尔然后把他打出精来要好得多。再说，你以为我的头发怎么保持得这么柔顺？地精理发师可是顶级的。]");
            }
            doNext(get_camp().returnToCampUseOneHour);
            return;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2024) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1073) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1072) == 1)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1073,1);
            outputText("惠特尼不在农场建筑附近。你猜测了一下，走到远处田野里的那棵树下：果然，当你走近时，你看到一个戴着遮阳帽的身影坐在树下。在农场待了相当长的一段时间后，你已经开始欣赏这里确实是农场里最好的地方；它位于一个小高地上，在巨大的橡树的树荫下，人们可以看到所有的农场建筑和湖泊，尽管后者在土地的曲线之外，在不远处闪烁着微光。当你欣赏这一切，听着风吹过树叶的声音时，惠特尼抬头看着你。");
            outputText("[pg][say: 看来你有故事要讲，[name]。怎么了？]起初你有些结巴，你描述了你对恶魔工厂的袭击，你在里面发现的性恐怖，最后是监督者幸灾乐祸地告诉你的真相：英格纳姆的长老们把你们村的年轻人卖作了扭曲的奴隶，而你又是如何险些遭遇同样的命运。当你讲完时，惠特尼的眼睛睁得圆圆的。");
            outputText("[pg][say: 这……这是一个惊人的故事，[name]。在这里，人们很容易相信这个世界上不存在这样的邪恶，但它确实存在；哦，它确实存在。而且还有像你一样勇敢的人愿意挺身而出对抗它。这有时也很难让人相信。]她转过头去，张了几次嘴，每次都停了下来，最后才用更轻的声音继续说道。");
            outputText("[pg][say: 我曾经认识一个像你一样的人。我加入特尔阿德雷卫队后不久就认识了他。他有一种傻乎乎的善良和幽默，而且很勇敢。我很喜欢他，所以嫁给了他。]她望向远处的湖面。[say: 报名参加沙漠巡逻队需要真正的勇气。那不是为了你的利益。也不是为了特尔阿德雷的利益。那只是为了寻找遇到麻烦的人，幸存者和逃亡者。恶魔知道这座城市的存在，哦，他们知道，而且他们一直在寻找进入的方法。我认为他们主要是想毒害它，就像他们对地精做的那样，但他们也喜欢告密者——俘虏。天哪，他们太喜欢俘虏了。]");
            outputText("[pg]她停顿了很久，以至于你怀疑她是否已经说完了。[say: 你——你能认出那些囚犯中的任何一个吗？那些来自你镇上的人。你说过，即使你释放了他们，有些人还是留了下来。你对此有什么看法？我经常在想——是永远不知道某人发生了什么更好，还是找到他们，却发现他们只剩下你记忆中扭曲的躯壳：一个没有灵魂的怪物，甚至喜欢别人对他们做的事？] 她停了下来，你觉得你看到她依然凝视着湖面的眼睛里闪烁着泪光。你又等了一会儿，但显然这就是你能得到的所有回答了。你把手放在她的肩膀上，然后悄悄地走开了。");
            doNext(get_camp().returnToCampUseOneHour);
            return;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1074) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1073) == 1)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1074,1);
            outputText("你发现惠特尼正在辣椒地里辛勤劳作。你小心翼翼地走近她，但当她看到你时，她热情地向你打招呼。");
            outputText("[pg][say: 嘿，[name]！恐怕我今天的工作快要完成了——这次恐怕不能让你弄脏手了！] 当她把一个装满辣椒的纸袋拖过来并重重地放在地上时，你帮她开着门。当你再次关上门时，一只手落在了你的手上。");
            outputText("[pg][say: 听着，[name]，] 惠特尼犹豫地说，[say: 我想我有时候可能会显得有点……冷淡，但你知道我很感激你总是来这里和我聊天，对吧？我非常喜欢这样。这附近没有人算得上是很好的聊天对象，能有一个只是倾听的人真好。特别是如果他们其余的时间都在拯救世界的话。] 你对她的真诚感到有些惊讶，你说这没什么大不了的；你也喜欢和她一起在农场里闲逛。她听了这话，灿烂地笑了，然后点点头，邀请你和她一起走到储藏谷仓。你尽可能委婉地问她，她离开特尔阿德雷是不是因为她丈夫发生的事。");
            outputText("[pg][say: 那个地方对我来说失去了色彩，] 她回答道。[say: 也许我本可以像" + (get_urtaDisabled() ? "其他人" : "乌尔塔") + "那样，用酒精来让自己感觉好点，但是……我不知道。我无法忍受同情，也无法忍受在他曾经待过的地方闲逛。我只想一个人待着。所以我卖掉了我所有的东西，用它来买种子和补给，然后来到了这里，我知道这里有一个废弃的农场。] 她短促地笑了一声。[say: 我当然知道。我的家人曾经住在这里，直到恶魔来了。我爸妈觉得他们能把我完好无损地送到特尔阿德雷真是太幸运了，他们觉得我再回到这里真是太疯狂了。我只是告诉他们，这是我必须做的事。] 她深情地摇了摇头，把辣椒袋的口打了个结，然后把它塞进谷仓的阴暗处。[say: 我爸有时还会来这里，试图说服我卖掉农场搬回去。卖给谁，我问他？不管怎样，我觉得我相当安全。恶魔们现在有更重要的事情要做。] 她看着你，表情中多了一些不同的东西，你花了一段时间才意识到那是什么——真正的信仰。");
            outputText("[pg]你给了她一个拥抱作为道别，带着一种奇怪的感觉离开了。");
            doNext(get_camp().returnToCampUseOneHour);
            return;
         }
         var _loc1_:int = Utils.rand(6);
         if(_loc1_ == 0)
         {
            outputText("没花多长时间就找到了这个独立的农家女孩。[pg]");
         }
         if(_loc1_ == 1)
         {
            outputText("她正拿着一把看起来很邪恶的镰刀在农场边缘巡逻。当你走近并与她并肩而行时，她向你点了点头。[pg]");
         }
         if(_loc1_ == 2)
         {
            outputText("她正弯腰在辣椒地里，左右拔着杂草。她直起身子，擦去" + (get_noFur() ? "脸上" : "皮毛和口鼻上") + "的汗水，并友好地向你挥手，鼓励你过来边工作边聊天。[pg]");
         }
         if(_loc1_ == 3)
         {
            outputText("她在谷仓后面，操作着锻造炉，修理一些损坏的农具。虽然她的注意力集中在铁砧上的金属和手中的锤子上，但惠特尼在锤击的间隙，立刻转过身来向你打招呼。[pg]");
         }
         if(_loc1_ == 4)
         {
            outputText("她正在围捕一小群看起来很普通的牛。令人惊讶的是，她选择步行来做这件事，但她的速度足够快，能跟上并把她的牲畜赶进畜栏。谢天谢地，当你终于赶上她时，她正在关上畜栏的门。当你走到她面前时，惠特尼给了你一个友好的微笑，你们俩立刻开始聊天。[pg]");
         }
         if(_loc1_ == 5)
         {
            outputText("她正靠在一棵粗壮的树上，宽檐帽低低地垂在眼睛上。你向她喊了一声，以为这个狗女睡着了，但她猛地抬起头，警觉的眼睛立刻锁定了你。也许她并没有在打瞌睡。她喊道，[say: 过来坐会儿，我太渴望有人作伴了！] 你坐下来准备聊天。[pg]");
         }
         if(Utils.rand(4) == 0 && !get_player().hasKeyItem("Breast Milker - Installed At Whitney\'s Farm"))
         {
            if(get_player().hasKeyItem("Breast Milker"))
            {
               outputText("你还没来得及说什么，惠特尼就惊呼道：[say: 我的天哪！那是恶魔的挤奶机吗？][pg]");
               outputText("你点点头，告诉她你是如何从恶魔工厂里把它解放出来的，并解释说，即使它应该功能齐全，它也需要连接到其他一些机器才能工作，而且这远远超出了任何一个人能处理的范围。[pg]");
               outputText("[say: 嗯，当然，它需要连接到泵系统、收集水库和电源。碰巧我在谷仓里为我的牛准备了所有这些设备，我想这比一个女孩闻牛头人的麝香还要容易插上，] 惠特尼解释道，[say: 如果你愿意，我可以为你把这一切都设置好，见鬼，如果你能产出足够的奶，我甚至可能会给你几颗宝石。][pg]");
               outputText("你要把挤奶机给惠特尼让她连接起来吗？");
               _g = this;
               doYesNo(function():void
               {
                  _g.whitneyMilkerHookup();
               },whitneyMilkerRefusal);
               return;
            }
            if(get_player().biggestLactation() >= 2)
            {
               outputText("当你坐下来准备聊天时，惠特尼给了你一个困惑的眼神。[pg]");
               outputText("[say: 亲爱的，你可能想去看看那个，] 她指着从你[armor]前面滴下的乳白色液体说道。[pg]");
               if(get_player().cor < 33)
               {
                  outputText("你羞愧地脸红了");
               }
               else if(get_player().cor <= 66)
               {
                  outputText("你带着一丝暴露癖的兴奋涨红了脸");
               }
               else
               {
                  outputText("你羞得满脸通红，弓起背，向犬娘公然展示你的乳汁");
               }
               outputText("，随着她的话语深入人心。在如此暴露的压力下，乳汁顺着你的" + get_player().allBreastsDescript() + "流淌下来。没过多久，你就被乳汁浸透了。[pg]");
               outputText("惠特尼开始咯咯地笑，但立刻忍住了，道歉说：[say: 抱歉，我没别的意思。我认识一些人，他们非常喜欢当一个行走的喷乳泉。如果你愿意，我或许能给你弄一套你专属的挤奶设备。这样你就能应付那些……似乎在困扰你的液体堆积了。如果你产出的量够多，我甚至还能付给你一些宝石。][pg]");
               outputText("这听起来简直好得不像是真的。农家女孩点点头，很清楚地读懂了你的表情，[say: 是的，这有个小条件。我需要250颗宝石来买零件，才能把这一切都弄好。这种设备可不便宜。你觉得呢，亲爱的？如果你不想弄，我也理解——你总是可以等奶水自己停下来的。][pg]");
               if(get_player().get_gems() >= 250)
               {
                  outputText("你要花250颗宝石从惠特尼那里买一个乳房挤奶器吗？");
                  doYesNo(breastMilkerPurchase,breastMilkerNoPurchase);
               }
               else
               {
                  outputText("你没有足够的钱买挤奶器。你道了歉，然后回到了营地，也许你以后能买一个。");
                  doNext(get_camp().returnToCampUseOneHour);
               }
               return;
            }
         }
         if(Utils.rand(4) == 0 && !get_player().hasKeyItem("Cock Milker - Installed At Whitney\'s Farm") && get_player().hasKeyItem("Cock Milker"))
         {
            outputText("你还没来得及说什么，惠特尼就惊呼道：[say: 我的天哪！那是恶魔的挤奶机吗？][pg]");
            outputText("你点点头，告诉她你是怎么得到它的，并解释说，虽然它应该功能齐全，但需要连接到其他机器才能工作，而且这远非一个人能处理的。[pg]");
            outputText("[say: 那当然，它需要连接到泵系统、收集池和电源。碰巧我在谷仓里为我的牛准备了所有这些设备，而且我估计把它插上去，比一个闻了牛头人麝香的女孩还要容易。]惠特尼解释道，[say: 如果你愿意，我可以帮你把这一切都弄好，见鬼，如果你能用它收集到足够多的量，我或许能找到一种方法用它给我的牛授精，并付钱给你。你别担心，我知道怎么让这种事情运转起来。][pg]");
            outputText("你要把阴茎挤奶器交给惠特尼让她连接吗？");
            _g1 = this;
            breast = false;
            doYesNo(function():void
            {
               _g1.whitneyMilkerHookup(breast);
            },whitneyMilkerRefusal);
            return;
         }
         outputText("你告诉她你最近的考验和磨难");
         if(get_player().cor > 50)
         {
            outputText("或者至少是你认为她想听的部分");
         }
         outputText("她专心致志地听着，在适当的时候插进机智的俏皮话和安慰。当你讲完后，她告诉你");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2024) < 2)
         {
            outputText("农场经营得有多好");
         }
         else
         {
            outputText("自从湖水被污染后，农场的经营状况有多糟糕。她必须付出三倍的努力，才能防止她的牲畜和庄稼屈服于污染，而且森林里的恶魔和怪物也比以前大胆了许多倍");
         }
         outputText("。能有机会和另一个理智的人交谈感觉很好，但没过多久惠特尼就必须回去工作了，你也应该回去看看你的营地了。");
         if(get_player().get_inte100() < 15)
         {
            dynStats(DynStat.Inte(1));
         }
         if(get_player().get_inte100() < 20)
         {
            dynStats(DynStat.Inte(1));
         }
         if(get_player().get_inte100() < 30)
         {
            dynStats(DynStat.Inte(0.5));
         }
         if(get_player().get_inte100() < 40)
         {
            dynStats(DynStat.Inte(0.5));
         }
         dynStats(DynStat.Lust(-5));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function stablesStallionThroatfuck() : void
      {
         clearOutput();
         outputText("现在最困难的部分开始了。");
         outputText("[pg]你抛弃了所有的体面，张大嘴巴，尽可能多地把公马的阴茎含进嘴里。他阴茎的龟头是最粗的部分，但你是一个[i: 勇者]。阴茎龟头慢慢滑过你的嘴唇，最后马的阴茎进去了。你茫然地盯着，头晕目眩，舌头在堵塞你[if (hasgooskin) {黏糊糊的}]嘴巴的肉块周围漫不经心地搅动。你抓住粗壮的肉棒，把它拉向你。想要把它抽插得更深的冲动占据了你；你慢慢地前后摇晃着头，每一次循环都比上一次更深一点。你在剩下的一点点空间里呻吟着，沉浸在其中。淫荡的气味和兽性的味道令人难以抗拒。很快你的喉咙就变成了一个飞机杯，接受了比你村里任何人类所能想象的更多的阴茎肉块。你食道的扩张就像一个紧致的小穴承受了超出它所能承受的范围。你抽插得越来越快，每一次点头都滑进更多的阴茎。公马嘶鸣着，咕哝着，跺着一只蹄子。你的眼睛闪烁着光芒，意识到这可能意味着什么。");
         outputText("[pg]你集中精力，用精湛的技巧口交。阴茎的龟头在你体内完全膨胀，锁在你的扁桃体之外。你没有力气去移动这样一个肿胀的器官，而是专注于抽插。抽插，抽插。压力增加，大量的马精液喷进你的喉咙。大量的农场动物精液填满了你的肚子。你几乎无法保持清醒。你的身体发热，发红，头晕目眩。");
         outputText("[pg]通过生物学的奇迹，射精后的阴茎变软缩小，直到马能够从你的嘴里拔出来。你幸福地倒在马厩的地板上。过了一段时间，虽然你不确定过了多久，直到你恢复了镇定。");
         if(get_player().get_fatigue() >= get_player().maxFatigue() * 0.75)
         {
            stablesScandal();
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1077) <= 0)
         {
            outputText("幸好惠特尼没来——你怀疑她不会欣赏你正在做的事。");
         }
         outputText("你深情地抚摸了一会儿你的种马情人，结束了在马厩里的时光，然后回家了。");
         get_player().orgasm("Lips",false);
         get_player().refillHunger(30);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function stablesStallionSodomize() : void
      {
         clearOutput();
         outputText("无论崇拜这样一个完美的标本有多么令人陶醉，你的大脑还是忍不住想，如果你是那个掌控局面的人，他会作何反应。你从那匹马的巨物上移开，直起身子，用一只[hand]顺着它的侧面摸向那肌肉发达的臀部。当你停止刺激他时，种马几乎带着疑问看着你，发出一声低沉的嘶鸣，你的触摸从毛茸茸的臀部滑向它们之间坚韧的会阴。你的[claws]戏弄和把玩着柔软的肉，看看他会有什么反应。这头野兽颤抖着，耳朵微微向后贴，尾巴紧张地甩了几下，最后垂了下来。坐在丰满的尾根下那布满皱纹、肿胀的屁眼，看起来如果包裹住你的[cock]会感觉像在天堂一样。当你用手指刷过那个圆环时，那强烈而有意的收缩巩固了你（和种马）的兴趣。");
         outputText("[pg][if (height >= 90) {你把自己定位在动物的后面，你的腹股沟处于完美的高度|[if (tailLeg and height >= 75) {你滑行到动物的后面，在精妙的平衡中伸展你庞大的身躯，当你升高时抓住毛茸茸的臀部|你环顾四周，经过短暂的寻找，找到一个板条箱站上去，让你处于合适的高度}]}]来迎接马的后背。你用[feet]稳住自己，[if (!isnaked) {没有浪费任何时间脱衣服，只是在紧张的期待中掏出你的[cockplural]|只是在紧张的期待中挥舞着你暴露的[cockplural]}]。你即将要做的事情的变态本质让你充满了[if (corruption >= 50) {一种令人兴奋的越轨感|一种羞耻和原始欲望的混合感}]。你的[hips]转动着，开始在马的臀部上摩擦，他坚韧的会阴和尾孔表面提供了恰到好处的摩擦力，让你的脊背发凉，并导致[eachcock]跳动和肿胀。种马似乎有点紧张，他的头低着，耳朵向后拉，但下面肿胀的工具沉重的摆动告诉你你需要知道的一切。他的尾孔上涂满了开始从你阴茎中渗出的先列腺液，当你继续用龟头戳它时，它看起来几乎是漆黑的。它在每一次触摸下都会抽搐和弯曲，有时会用力地眨眼，让你隐约看到肉粉色的内部。用一只[hand]抓住他的尾巴，你拉扯它，鼓励种马向你后退。不断增加的压力让那个肉环紧贴着你的[cock]，然后它终于屈服了。");
         outputText("[pg][if (cockthickness >= 3.5) {他肌肉发达的肉圈拼命地想要挤压这个过大的入侵者，显然还不习惯如此巨大的插入|他柔软的穴口有节奏地挤压着你的巨物，紧紧地包裹着它}]，当你鸡奸这匹公马时，他发出了一声低沉的喘息。他的后庭温暖得出奇，而且异常宽敞，但最引人注目的绝对是那紧紧包裹着你[cock]的痉挛肌肉环。它以一种近乎变态的脉动方式运动着，在像花朵一样绽放时几乎要把你推出去，然后又紧紧夹住并把你拉进去。就这样，它不经意间把你吞没了，公马大声地喘着粗气，[if (cocklength >= 24) {尽管即使是马庞大的身躯也不足以完全容纳你那可怕的巨物，在马肠道深处遇到了柔软的阻力，阻止了你完全插到底|迫使你用[feet]保持平衡，当你突然发现你的腹股沟被肉圈有节奏地挤压着，因为它把你的整根阴茎都吞没了}]。[if (multicock) {你的另一根[if (cocks > 2) {肉棒们|肉棒}]搭在公马的臀部上，在温暖的空气中徒劳地跳动着，并在他的皮毛上留下了一道稳定的先列腺液。}]");
         outputText("[pg]被一个野性的后庭突然包裹住，足以让你的[chest]剧烈起伏[if (hasvagina) {并且[vagina]因为不断增长的性欲而下意识地收缩和流出淫液}]，在恢复理智并开始交配之前，你的大脑被快感淹没。你把他的尾巴当把手，扭动着你的[hips]，认真地填满这匹公马，一开始笨拙地抽插着，然后才找到节奏。你的伴侣也并非完全被动，他打着响鼻，向后推挤你，再次包裹住你的[cock]。[if (hasballs) {你的[ballsfull]翻腾着，刺痛着，每一次抽插都撞击着公马的会阴，在下方发出一阵沉闷的拍打声。}]");
         outputText("[pg]每当你拔出时，看到那个丰满的肉圈贪婪地紧贴着你的[cock]，这种体验就会得到升华。被骑乘的野兽扭动着身体，用蹄子刨着地，偶尔发出嘶鸣或呜咽声，尤其是当你的抽插似乎用力戳到他的前列腺，让那根被冷落的马屌跳动着湿漉漉地拍打在他的肚子上时，声音特别大。");
         outputText("[pg]对那个敏感部位过多的戳刺足以让他开始尥蹶子[if (height >= 90) {几乎把你撞倒在地|几乎把你从你保持平衡的箱子上撞下来}]，嘶鸣着，并开始发出声音，用麝香般的马精液涂满地面。当他高潮时，他的肛门痛苦地紧紧夹住你，随着每一次喷射而痉挛。没过多久，你感觉到你自己的[cockplural]肿胀起来[if (hasballs) {并且你的[balls]紧紧地收缩}]，所以你猛拉野兽的尾巴，在不可避免的高潮到来前几秒钟将自己深深埋入。你愉悦的呻吟声加入了充满马厩的肉体交响乐中，你将你的精液射入公马体内，[if (cumveryhighleast) {迅速用你的释放物填满他的肠道，远远超过了通道的极限。无处可去的精液倒流回来，伴随着巨大的吧唧声从被撑开的肉圈周围喷射而出，把周围的臀部染成了白色|用一波又一波滚烫的精液填满它的后庭，它的肉圈紧紧包裹着你的[onecock]，防止它弄得一团糟}]。[if (multicock) {你的另一根[if (cocks > 2) {肉棒们|肉棒}]在空中狂野地喷射，精液落在公马上，在他的背部和鬃毛上涂上一层黏糊糊的、冒着热气的释放物。}]");
         outputText("[pg]当你像对待母马一样对待他时，公马扭动着身体并发出嘶鸣，他的头向下伸，徒劳地试图戳那根被冷落、迅速变软的马屌。与此同时，你沉浸在这种变态行为的极乐中，然后慢慢地从那个被充分使用的马后门中拔出。[if (cockthickness >= 3.5) {你的肉棒让原本灵活的肌肉被撑开并张着大口，原本粉红色的内壁因为覆盖着精液而变成了较浅的颜色。你看着它收缩并试图闭合，即使释放物迅速开始渗出，一直流到它皮革般的囊袋上，留下一条灰白色的痕迹|被充分使用的尾穴收缩了几次，向你闪烁着粉红色的内壁。它设法收紧了大部分，只有几滴你的释放物像晨露一样附着在布满皱纹的肉圈上}]。");
         outputText("[pg]你花了一点时间平复心情，并尽你所能清理干净，轻轻拍了拍公马的侧面。他用一种难以捉摸的表情回头看着你，羞怯地舔了舔你的[hand]，他的尾巴甩了几下。你带着交到了一个最不寻常的朋友的模糊感觉离开了。");
         get_player().orgasm("Dick");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function stablesStallionLick() : void
      {
         clearOutput();
         outputText("你尽情品味着那滋味，任由欲望主导一切。手不由自主地向下探去，饥渴难耐地揉搓着[genitals]。另一只手则牢牢攥着悬在面前那根坚硬挺翘的肉棒。马儿尿道口渗出一滴滴前液，糊满了你的嘴唇和舌头。这股子兽性的味道让人上瘾。[if (hascock) {你双腿间那根硬邦邦的[cock]也跟着一跳一跳地回应，渴求着更粗暴的刺激。你当然不会拒绝，一把扯开碍事的遮挡；转眼间你就迫不及待地套弄起来[if (hasvagina) {，时不时还换手去揉捻自己的阴蒂}]。|[if (hasvagina) { [if (tailLeg) {你[if (isNaga) {snake-}]泄殖腔里|你大腿间}]愈发湿润，渴望着被唇间含着的那根马屌填满，而愈发美味的马前液更让你兴奋不已。你的手飞快探入，拨开遮挡，用力揉搓着阴唇和阴蒂。|你变态地用手指揉搓着马阴茎的顶端，蘸满黏腻的前液。推开衣物，你用沾满润滑液的手指按摩着后穴，将那沾着马骚味的手指整根插了进去。}]}]");
         outputText("[pg]一声呻吟从你喉间逸出，一边吮着马屌一边自慰的快感让你神魂颠倒。你又一次用舌尖缠绕着那龟头，吮吸着不断渗出前液的顶端。你的嘴唇本能地一遍遍滑过龟头，恨不得把整根都吞进去。一只手满足着自己的饥渴，另一只手则撸着马屌，仿佛在比赛谁先射出来。你两腿之间已然颤抖不止，高潮的预兆隐隐逼近，可那匹公马似乎也快了；他哼哼着，四蹄不安地踏动，兴奋得发出嘶鸣。那根粗壮的马屌猛地一紧，大股大股的马精径直灌进你的喉咙。那令人窒息的浓烈味道和气息瞬间将你推过极限，盆底肌疯狂地收缩痉挛。你在极乐的高潮中不知飞了多久才回过神来，早已失了态。兽精灌满了你的嘴，多余的浊液顺着嘴角和下巴淌下。你浑身都溅满了精液。");
         outputText("[pg]过了一段时间，虽然你不确定过了多久，直到你恢复了镇定。");
         if(get_player().get_fatigue() >= get_player().maxFatigue() * 0.75)
         {
            stablesScandal();
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1077) <= 0)
         {
            outputText("幸好惠特尼没来——你怀疑她不会欣赏你正在做的事。");
         }
         outputText("你尽力把自己清理干净，虽然马交的味道挥之不去。在对你的公马情人进行了一些深情的爱抚后，你结束了在马厩的时间，回家了。");
         get_player().orgasm("Lips",false);
         get_player().refillHunger(20);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function stablesStallionBendOver() : void
      {
         clearOutput();
         outputText("你暂时停止了动作，只是惊叹于手中那根温暖的肉棒。有些东西让你的呼吸急促起来；你不确定是因为挂在你面前的巨大肉棒上闪烁的唾液，还是你通过温柔的握持感受到的强有力的心跳，亦或是舌尖上残留的令人陶醉的味道。也许是所有这些，也许都不是。尽管如此，你还是发现自己做出了一个草率的决定：在这个东西进入你体内之前，你不会离开这里。");
         outputText("[pg]你再次向前倾身，用你的[face]蹭着粗壮的肉棒，深呼吸。当你吸入发情的马匹散发出的麝香味时，热量在你的腹部聚集。你在马的马眼上印下最后一个吻，在舌头上抹上一团野兽的先列腺液，然后");
         if(get_player().hasTailInsteadOfLegs())
         {
            outputText("直起身子。");
         }
         else if(get_player().isGoo())
         {
            outputText("滑回直立状态。");
         }
         else if(get_player().isTaur())
         {
            outputText("把蹄子收在身下站起来。");
         }
         else
         {
            outputText("挣扎着站起来。");
         }
         outputText("[pg]你小心翼翼地向马厩外张望，迅速脱下你的[armor]，警惕在即将到来的堕落中被发现。尽管屈服于一头低等动物的可能性让你的内心感到不少羞耻，但这种前景丝毫没有减弱你身体的兴奋[if (haslowergarment) {，考虑到当你滑下[lowergarment]时，那些拉伸并粘附在上面的情欲之丝}]。现在你赤身裸体，就像刚出生时一样，你回头看着你未来的伴侣，如果那根在它肚子上懒洋洋地弯曲拍打的肥大肉棒能说明什么的话，它一直饶有兴趣地注视着你的举动。[if (hascock) {你自己僵硬的[cock]也随着它的马类同伴一起跳动。}]");
         outputText("[pg]虽然看到准备就绪的雄性让你的心跳加速，但伴随着期待的还有恐惧；无论从哪个意义上说，这都不是一匹小马。你回头瞥了一眼马厩的门。现在退出还为时不晚，你心里想着，同时你的手滑向你的私处，挑逗着你的阴蒂。几分钟过去了，你依然犹豫不决地僵在原地，在重新考虑你将要做什么时，无意识地玩弄着自己。马蹄声打破了你的沉思，你转过身，看到种马向你走来，没有丝毫犹豫。它知道该如何对待一匹饥渴的母马。");
         outputText("[pg]甚至在你意识到自己在做什么之前，你已经转过身，靠在马厩的侧面。你");
         if(get_player().hasTailInsteadOfLegs())
         {
            outputText("扭动身体");
         }
         else if(get_player().isTaur())
         {
            outputText("张开后腿");
         }
         else
         {
            outputText("张开双腿，弯下腰");
         }
         outputText("以便更好地展示你[if (vaginalwetness > 0) {湿润的}]私处。[if (hastail) {你的尾巴翘起，来回摆动|你的[butt]诱人地扭动着}]；考虑到你的姿势，在这一点上，这完全是多余的邀请，你暗自想着，因为种马的蹄子猛地踩在你上方的马厩顶部。如果你对自己诚实的话，可能在你进入马厩的那一刻就已经结束了。");
         outputText("[pg]你上方的野兽咕哝着，颤抖着，因为它疯狂地试图找到你的入口。你分享了马的挫败感，因为它平坦的尖端粗暴地戳着你的屁股，却徒劳无功。当巨大的肉棒在你身上狂野地滑动，在你的背上留下一道先列腺液的痕迹时，你颤抖了。一次险些命中让野兽的肉棒滑入你的双腿之间，当它擦过你的湿润时，沾满了你的体液。你试着往下看，扭过头去偷看[if (hasbreasts) {你的[breasts]之间|你的身下}]。从这个角度看，它不知怎么显得更大了，你睁大眼睛，看着尖端到达你腹部的高度。看到这一幕，恐惧在你的脑海中绽放，然后迅速被欲望扼杀，因为急切的种马退缩了，准备再次尝试你的小穴。你的内脏因渴望而紧缩和哭泣，你正要伸手向后帮助引导粗壮的肉棒就位，这时它终于找到了目标。");
         get_player().cuntChange(40,true,true);
         outputText("[pg]它一点也不温柔。");
         outputText("[pg]一声受伤的、被压抑的声音从你紧咬的牙关中冲出，当种马占有你时，这声音从你的肺部被挤出，它用一次有力的冲刺将近一半的肥大肉棒插入你体内。尽管你很兴奋，但你被塞满的[if (isNaga) {蛇穴|小穴}]抗议着它受到的粗暴对待，徒劳地试图将入侵者挤出去。野兽没有给你时间从毁灭性的攻击中恢复过来，稍微后退了一点，只是为了立即再次撞击进来，将更多的马屌沉入你的身体。它再次重复这个动作，进一步深入。然后再次。然后再次，再次，[i: 再次]。当种马宣示主权时，你只能抽泣，无情地将越来越多的自己塞进你体内，击溃你的防御，强行塑造你的内脏，以更好地容纳它巨大的阴茎。当整个马的肉棒完全消失在你的深处时，你的视线模糊了，泪水顺着你的[face]流下，柔软的包皮贴着你微张的嘴唇，一对沉重的睾丸拍打着你的臀部。");
         outputText("[pg]你的[skin]被汗水浸湿，呼吸变得急促，因为种马不知疲倦地让你成为它的母马。你的一小部分仍然注意不要惊动农场的其他居民，让他们发现马厩里正在发生的事情，所以你尽力保持安静。尽管如此，一系列低沉的呻吟还是从你的嘴唇中逸出，伴随着每次撞击你子宫口的轻柔哭泣。种马阴茎宽阔、钝圆的头部太宽，无法突破你最后的屏障。但这并不能阻止这只动物无情地一遍又一遍地捣毁你的子宫颈。");
         outputText("[pg]一次特别有力的戳刺[i: 恰好]擦过你体内的一个点，诱使你发出一声愉悦的呻吟，火花在你的视野中跳跃，而下一次冲刺则让你几乎痛得[i: 尖叫]起来。种马只是咕哝着继续与你交配，对你的快乐和不适同样漠不关心，也许比真正的恶魔还要漠不关心。矛盾的是，野兽发情的盲目性将你的欲望提升到了新的高度，知道一只愚蠢的动物可以如此轻率却又如此彻底地掠夺你的身体，让你因变态的喜悦而颤抖。女性润滑液的溪流流下");
         if(get_player().hasTailInsteadOfLegs())
         {
            outputText("你颤抖的蛇身");
         }
         else if(get_player().isGoo())
         {
            outputText("在地板上");
         }
         else
         {
            outputText("你分开的双腿内侧");
         }
         outputText("，很快痛苦就被快感淹没。");
         outputText("[pg]你喘着粗气，开始向后迎合你的种马，配合着他的每一次抽插。你只能尽力压抑自己的叫声，以免盖过做爱时不可避免的声响。你的[hips]一次又一次地与这头野兽的臀部碰撞，巨大的力量让你的四肢发软。你感到头晕目眩，闭上眼睛，任由头垂下[if (hairlength > 6) {，你的[face]被[hair]遮蔽}]。你集中精力保持直立，迎接每一次猛烈撞击你的野兽般的抽插，你知道自己离高潮不远了。");
         outputText("[pg]在某个时刻，你神志不清地开始对骑在你身上的马嘟囔着鼓励和赞美，就好像它是一个能听懂这些情感的人类情人。这头野兽竟然真的加快了速度来回应你的话，这几乎让你当场失去理智，随后你意识到，这急促的抽插很可能是因为你的伴侣即将高潮；那根正在你体内耕耘的马鸡巴明显的肿胀就是线索。尽管你不想让这种体验结束，但你对马精内射的渴望实在太强烈了，无法忽视。伴随着重新爆发的活力，你加倍努力，用力地向后迎合着刺穿你[if (isNaga) {蛇穴|小穴}]的强壮雄性，同时恳求他完成交配。伴随着一声响亮的嘶鸣和一次有力的抽插，种马将它的肉棒深深地顶入，满足了你的请求。");
         outputText("[pg]你伴侣的龟头冠状沟在你体内深处膨胀，它的生长将你撑得紧绷，并在你的子宫处形成了一个紧密的密封。野兽般的鸡巴开始向你体内泵入马精，由于膨胀的龟头阻止了精液倒流，它只有一个地方可去。在短暂地抵抗了不断增加的压力后，你最后的防线崩溃了，你接纳了这头种马浓稠的精液进入你最私密的地方，你的身体承认了这头野兽对它的占有。这一次，你放荡的呻吟无法被压抑，因为滚烫的热流渗入你深处的感觉引发了你的高潮。你的私处在伴侣的肉棒周围痉挛，紧紧地夹住并榨取着它，诱导着一股又一股新鲜的马精射入你欢迎的[if (isNaga) {蛇穴|小穴}]中。[if (hascock) {与此同时，你自己的[cock]也随着你体内的肉棒的节奏喷射，几乎在你情人填满你的同时，你自己的精液也杂乱地覆盖了地板。}]");
         outputText("[pg]你突然想知道；一匹马[i: 真的]能让你怀孕吗？常识会说，不，当然不能，你这个喋喋不休的白痴，但自从来到这个奇异且性欲旺盛的世界以来，这样的事情几乎不是你听过的最奇怪的事情。不管你的种马刚才是否真的让你受孕，仅仅是想到你的肚子会因为怀上伴侣的马驹而变圆，就让你眼冒金星，因为第二次高潮紧随第一次之后，撕裂了你。");
         outputText("[pg]伴随着一声满足的响鼻，种马突然下了马。当这个动作毫不客气地将正在变软的马鸡巴从你滴水的[if (isNaga) {蛇穴|小穴}]中拖出时，你在高潮中痛苦地呜咽。你瘫倒在地板上，缩成一团痉挛着，下半身突然的空虚让你的双手反射性地按住你大张的私处，野兽的残留物从你抽搐的指缝中漏出。");
         outputText("[pg]最终，你的颤抖平息到足以让你站起来，尽管还有些摇晃。你的新情人平静地看着你，稳如磐石，就像你进入马厩前一样冷静。任何看着这匹马的人都不会知道它刚刚支配了你，如果不是那根疲软的鸡巴，慵懒地滴着你们混合的体液，慢慢地缩回它的包皮里。另一方面，你显然刚刚被操过，满脸通红，衣衫不整，并且");
         if(get_player().hasTailInsteadOfLegs())
         {
            outputText("在颤抖的蛇身上摇摇晃晃");
         }
         else if(get_player().isGoo())
         {
            outputText("颤抖着");
         }
         else
         {
            outputText("在颤抖的双腿上摇摇晃晃");
         }
         outputText("就像你现在这样，更不用说你那被彻底播种的[if (isNaga) {蛇穴|小穴}]里黏糊糊的一团糟了。");
         outputText("[pg]过了一段时间，虽然你不确定过了多久，你终于恢复了镇定。");
         if(get_player().get_fatigue() >= get_player().maxFatigue() * 0.75)
         {
            stablesScandal();
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1077) <= 0)
         {
            outputText("幸好惠特尼没有过来——你怀疑她是否会欣赏你正在做的事情。她可能还会向你收取配种服务费。");
         }
         outputText("在重新穿上衣服之前，你尽力清理了自己，尽管空气中仍然弥漫着马交配的气味。在对你的种马情人进行了一些深情的抚摸后，你结束了在马厩里的时间，回家了。");
         get_player().orgasm("Vaginal");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function stablesStallion() : void
      {
         clearOutput();
         outputText("你的目光锁定在马厩里的一匹公马身上，贪婪地舔了舔嘴唇，心里满是变态的期待。他看起来这么温顺，说不定不会介意来点更亲密的身体接触。你谨慎地扫了一圈四周，确认没人后，便钻进了他的马厩。");
         outputText("[pg]你突然靠得这么近，公马微微一惊，但随着你的手掌开始抚摸他的身体，他很快就懒得在意了。他的皮毛又短又干净，整个身躯紧绷而健壮——当然，还有一处地方你必须亲自“检查”一下才能确认。你把手往下探，[if (tailLeg) {弯下腰|[if (isgoo) {滑下身子|跪下来}]}]，手指揉按着马茎的包皮。这匹马显然憋坏了，那根东西不出片刻就露了出来。它又粗又沉地垂在那里，尺寸大得惊人，完全符合你对一匹公马的期待。你像着了魔一样，用手顺着他的柱身上下捋动，一寸一寸地丈量着那粗壮的围度。那根肉棒很快硬挺起来，看上去足足有" + (get_metric() ? "将近半米" : "至少一英尺半") + "长。");
         outputText("[pg]你试探性地张开嘴，舔上那根硕大马屌的顶端。那股味道是肮脏的、原始的野兽气息，却让你浑身一激灵，涌起一股病态的兴奋。能享用一头野兽的肉棒，本身就多了一层禁忌的刺激。你伸出[tongue]，饥渴地顺着柱身向上拖行，把它舔到最硬、最充血的状态。接着舌尖又一路滑下，[if (haslongtongue) {缠绕|打转}]着舔过龟头，最后含住顶端用力吮吸。");
         menu();
         addButton(0,"舔",stablesStallionLick);
         addButton(1,"深喉",stablesStallionThroatfuck).hint("你竟然没有发现给公马口交是这片土地上的一项运动，这让你感到惊讶。");
         addButton(2,"弯腰",stablesStallionBendOver).hint("享受一下种马服务。").disableIf(!get_player().hasVagina(),"需要阴道。");
         addButton(3,"鸡奸",stablesStallionSodomize).hint("把那个甜甜圈填满。").sexButton(1).disableIf(get_player().isTaur(),"你需要不同数量的腿才能做到这一点。");
      }
      
      public function stablesScandal() : void
      {
         outputText("[pg]虽然对自己很满意，但你还是忍不住被疲惫感所笼罩，你在你的马匹伴侣旁边安顿下来。你背靠着马厩的墙壁，满足地叹了口气。透过百叶窗和木头缝隙照进来的[sun]光，给人一种纯粹的宁静感。");
         outputText("[pg]马厩门打开的声音打破了宁静。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1077) != 0)
         {
            if(farmCorruption.whitneyCorrupt())
            {
               outputText("[pg][say: 哦！[Master]，你没告诉我你在用我的马，]惠特尼惊讶地说。[say: 我——那我就不打扰你了，别管我。]");
               outputText("[pg]你的母狗有些慌乱地走了出去。");
            }
            else if(saveContent.pureWhitneyStables)
            {
               outputText("[pg]你瞥向惠特尼，她站在那里，眼袋很重。她静静地叹了口气，转过身去，留你一个人放松。");
            }
            else
            {
               outputText("[pg]惠特尼呻吟着，把脸埋在她的[if (nofur) {手里|爪子里}]。[say: 连动物也不放过！？]");
               outputText("[pg]为你辩护一下，马儿们很享受。");
               outputText("[pg]狗女重重地叹了口气，转过身去，离开了马厩。她真是个扫兴的人。");
               saveContent.pureWhitneyStables = true;
            }
         }
         else
         {
            outputText("[pg][say: 啊——该死，[name]，你到底在干什么？]惠特尼问道，失望地用[if (nofur) {手掌|爪子}]捂住脸。[say: 如果你想要……那种东西，你应该去找凯尔特。动物是无法同意的。]");
            outputText("[pg]你身上还有点明显的污迹，所以你不能很好地撒谎来摆脱这个局面——如果这一刻你脑子里闪过这个念头的话。在紧要关头，你能想到的最好的辩护是，你解释说这匹马似乎和你一样对这次交流感到满意。");
            outputText("[pg]惠特尼的脸因为厌恶和疲惫而皱成一团。[say: 好了，好了，我不会生气的。你走吧，请离我的马厩远点。]她眯着眼睛，似乎下定决心不看你。");
         }
         outputText("[pg]");
      }
      
      public function stablesMenu() : void
      {
         clearOutput();
         var _loc1_:Boolean = !get_player().isTaur() && get_player().hasVagina() && (get_player().hasKeyItem("Dildo") || get_player().hasKeyItem("Deluxe Dildo") || get_player().hasKeyItem("Demonic Strap-On"));
         outputText("你回到马厩，发现自己和马儿们独处。可能不是所有的马都在里面，因为你注意到了空着的隔间，但也可能是惠特尼只拥有几匹。你在马厩里漫步，看着种马和母马，对家乡的日子有一丝怀念。这些马和英格纳姆经常有的品种不同，但它们几乎没有什么区别。");
         outputText("[pg]这一刻虽然多愁善感，但很快就消退了。在这一点上，你在这里还能做什么呢……");
         menu();
         addButton(0,"种马",stablesStallion).hint("搞一匹种马。");
         addButton(1,"母马",stablesMare).hint("搞一匹母马。").disableIf(!get_player().hasCock() && !_loc1_,"需要阴茎（或合适的替代品）。");
         setExitButton("返回",stablesLeave);
      }
      
      public function stablesMare() : void
      {
         clearOutput();
         var _loc1_:Boolean = get_player().hasKeyItem("Demonic Strap-On");
         outputText("你打量着其中一个隔间里的一匹母马，漫不经心地走近。她健康年轻，充满活力，非常友好。[if (iscentaur) {她很快就会在更字面的意义上充满生命力。}]你和马一起进入隔间，小心翼翼地不惊吓到她。");
         outputText("[pg]当你抚摸她短促的皮毛让她感到更舒服时，你感觉到你的下体正在积聚一种不耐烦的压力。仿佛同样需要释放一样，你发现母马的尾巴来回甩动着，发出邀请。在玛瑞斯的生活确实在很大程度上打破了物种之间的障碍。你走到她身后，用手摩擦她的外阴，感觉到它在你的手指下颤抖。马向后退，试图强迫你的手进入。看来你挑了一匹非常荡妇的母马。如果她和你一样渴望——如果不是更渴望的话——你");
         if(get_player().hasCock())
         {
            outputText("觉得没有必要再磨蹭了。你脱下你的[armor]并就位。");
         }
         else if(_loc1_)
         {
            outputText("觉得没有必要再磨蹭了。你脱下你的[armor]，穿上你的穿戴式假阳具，并就位。");
         }
         else
         {
            outputText("只需要弄清楚最好的方法。你一边思考一边环顾四周，注意到马厩角落里有一些又长又细的绳子。你可以用这个。脱下你的[armor]后，你将绳子绑在腰部和骨盆区域，制作了一个相当实用的临时假阳具背带，最后将你的假阳具固定在阴蒂上方。觉得没有必要再磨蹭了，你就位了。");
         }
         outputText("[pg]当你的[if (hascock) {[cock]|玩具}]在她的阴部晃荡时，发情的母马散发出的麝香味开始在空气中飘荡。你在她的阴蒂上摩擦着头部，进一步挑逗她。你心想，不是每天都能遇到这么好色的动物，为什么不找点乐子呢。当她向后尥蹶子，差点把[if (hascock) {你的肉棒|假阳具}]强行塞进她体内时，你忍不住笑出声来。她可不是来玩游戏的。至少她所有不耐烦的动作都很好地把她的汁液涂抹在你的工具上。你按摩她，安抚这只焦躁不安的生物。你会给她她想要的，没必要呜咽或嘶鸣。");
         outputText("[pg]对准后，你插了进去，作为回应，你听到了一阵惊讶但非常愉悦的声音。她的内部褶皱");
         if(get_player().hasCock())
         {
            outputText("柔软、温和且富有弹性，专为容纳公马的巨大尺寸而生，但又足够受控，甚至能取悦最普通的尺寸。你再次挺动你的臀部，像一匹真正的种马一样发情。");
         }
         else
         {
            outputText("润滑良好且富有弹性，让你随心所欲地粗暴或温柔地插入她。你再次挺动你的臀部，每次都能感觉到玩具压在你肿胀的阴蒂上。");
         }
         outputText("你的母马伴侣颤抖着，向后挺动她的臀部，尽可能快地吞下每一寸。");
         outputText("[pg]你稳稳地站好位置，用力地向母马抽插。她的阴部缠绕着你的");
         if(get_player().hasCock())
         {
            outputText("[cock]，当你朝着不可避免的射精抽插时，尽其所能地榨取它。你的肌肉收缩，你发出一声长长而满足的呻吟，同时你用" + get_player().lowMedHighCum("squirts","ounces",get_player().lowMedHighCum("pints","quarts","gallons",1500,5000),100,500) + "的精液填满了马贪婪的子宫。");
         }
         else
         {
            outputText("玩具，当你抽插时，试图把它像肉棒一样榨取。你有节奏地抽插着，当你填满你饥渴的马伴侣时，让穿戴式假阳具给你的阴蒂带来巨大的快感。进进出出地抽插，没过多久，你的阴蒂就因为即将到来的高潮的狂喜而完全燃烧起来。你的肌肉收缩，你发出一声长长而满足的呻吟，同时你深深地抽插，尽可能多地用玩具填满马的阴部，当你这样做时，你自己的小穴也在你的双腿之间释放出一股洪流。");
         }
         outputText("[pg]你踉跄着后退，喘着粗气。这是一次如此自发的放纵，以至于你几乎没有考虑过惠特尼可能不");
         if(get_player().hasCock())
         {
            outputText("希望她的马被配种。幸运的是，你可能无法打破[i: 这种]程度的生殖隔离。");
         }
         else
         {
            outputText("希望你花这么多时间在她的马身上。幸运的是，你没有做任何会让她想到你在这里的事情。");
         }
         if(get_player().get_fatigue() >= get_player().maxFatigue() * 0.75)
         {
            stablesScandal();
         }
         outputText("[pg]你穿上你的[armor]，亲切地拍了拍母马，期待着以后再来一次。");
         get_player().orgasm(get_player().hasCock() ? "Dick" : "Vaginal");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function stablesLeave() : void
      {
         var _g1:Farm;
         var _g:FarmCorruption;
         clearOutput();
         outputText("当然什么都没有！如果你想骑马，你得和惠特尼谈谈，但她不在这里。你离开马厩，回到了农场。");
         if(farmCorrupt())
         {
            _g = farmCorruption;
            doNext(function():void
            {
               _g.rootScene();
            });
         }
         else
         {
            _g1 = this;
            doNext(function():void
            {
               _g1.farmMenu();
            });
         }
      }
      
      public function saveToObject() : Object
      {
         return saveContent;
      }
      
      public function reset() : void
      {
         saveContent.pureWhitneyStables = false;
         saveContent.gnoll = false;
         saveContent.firstEncounterNight = false;
      }
      
      public function onAscend(param1:Boolean) : void
      {
         reset();
      }
      
      public function nightFarmSteal() : void
      {
         var _loc1_:* = null as Inventory;
         var _loc2_:* = null as Array;
         clearOutput();
         outputText("他们在这里的几块地里种了很多植物，你非常怀疑少了一两个会不会被注意到。反正他们也不会知道是你干的。你蹲下来，缩短距离，开始在似乎是辣椒的东西周围摸索。虽然在黑暗中很难看清，但你顺着长度摸索并抓住了底部。一个抛射物穿过几片叶子，险些射中你的脖子，让你心跳漏了一拍，你踉跄着后退，把蔬菜从茎上扯了下来。你瞥了一眼地上的箭，抬头看到远处有一个骑马的弓箭手，正准备冲锋。");
         outputText("[pg]在黑暗中与一个占据机动性优势的远程战斗人员交战不是明智之举。你接受了你唯一的战利品，冲刺着逃离了农场，幸运的是没有第二箭射向你。");
         dynStats(DynStat.Cor(0.5));
         if(Utils.randomChance(50))
         {
            get_inventory().takeItem(get_consumables().CANINEP,get_camp().returnToCampUseOneHour);
         }
         else
         {
            _loc1_ = get_inventory();
            _loc2_ = [get_consumables().LARGEPP,get_consumables().DBLPEPP,get_consumables().BLACKPP,get_consumables().KNOTTYP,get_consumables().BULBYPP];
            _loc1_.takeItem(_loc2_[Utils.rand(int(_loc2_.length))],get_camp().returnToCampUseOneHour);
         }
      }
      
      public function nightFarmLeave() : void
      {
         clearOutput();
         outputText("你摇了摇头。这只是一个转瞬即逝的想法；你现在可以自己去觅食。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function milkerBadEnd1() : void
      {
         var _loc1_:Number = get_player().cumQ();
         clearOutput();
         outputText("当你翻身仰卧时，机器在你的[cocks]上再次上演了同样的戏码，甚至连高潮控制都一模一样。你被快感折磨着，但现在可以自由活动了，你发现自己试图在虚弱的抓握和疲惫的允许下，尽力去顶撞那些管子，试图克服机器的控制并获得释放。然而，吸力熟练地操纵着你的性欲，你除了忍受之外什么也做不了，因为又一大股精液涌了上来");
         if(get_player().balls > 0)
         {
            outputText("在你的[balls]里");
         }
         outputText("。和之前一样，机器断断续续地对你进行了一个小时的刺激，然后墙上的灯再次变绿，对你[cocks]的吸力也随之增强。你的臀部接管了控制权，你顶撞着机器，又射出了一");
         if(_loc1_ < 100)
         {
            outputText("滴");
         }
         else if(_loc1_ < 600)
         {
            outputText("股");
         }
         else
         {
            outputText("大股");
         }
         outputText("精液。");
         if(_loc1_ > 1000)
         {
            outputText("与之前不同的是，吸盘后部的一个肉质阀门弹开了");
            if(get_player().cockTotal() > 1)
            {
               outputText("");
            }
            outputText("，你射精的压力迫使精液随着每一次痉挛从阀门中喷出，黏糊糊的白色液体滴回你的胯部。");
         }
         outputText("高潮逐渐平息，但吸力和按摩仍在继续。[pg]");
         outputText("又是一声“叮”");
         if(_loc1_ > 100)
         {
            outputText("以及又一阵宝石的碰撞声");
         }
         outputText("传到了你的耳朵里，因为你的第二笔存款已经积累起来了，但你的注意力被一根新的管子吸引了");
         var _loc2_:Boolean = false;
         if(get_player().hasVagina() || get_player().hasFuckableNipples() || get_player().biggestLactation() > 1)
         {
            outputText("");
            _loc2_ = true;
         }
         outputText("它从墙里蜿蜒而出，向你伸来。你已经筋疲力尽，只能进行象征性的抵抗，因为");
         if(!_loc2_)
         {
            outputText("它");
         }
         else
         {
            outputText("它们中的一个");
         }
         outputText("将一根棒状的末端插入你的嘴里，开始将咸咸的液体滴入你的喉咙。");
         if(get_player().hasVagina())
         {
            outputText("另一根管子，同样带有粗大坚硬的末端，而不是吸盘，伸向你的" + get_player().vaginaDescript(0) + "并插了进去，分泌出更多的液体。");
            get_player().cuntChange(15,true);
            if(get_player().getClitLength() > 3)
            {
               outputText("随着阴道受到的刺激，你的[clit]也兴奋起来，一根较小的吸管紧紧吸附在上面。");
            }
         }
         if(get_player().biggestLactation() >= 1 && !get_player().hasFuckableNipples())
         {
            outputText("一些杯状的管子吸附在你的[nipples]上，然后开始吸吮。你感觉到乳汁向乳头涌去，然后开始滴入管子中。");
         }
         if(get_player().hasFuckableNipples())
         {
            outputText("更多的管子蜿蜒爬上你的" + get_player().biggestBreastSizeDescript() + "，并钻进你的[nipples]里。");
         }
         outputText("当你吸收这些分泌物时，" + get_player().SMultiCockDesc() + "在几秒钟内再次变得异常坚硬。你很快就推断出你尝到的是什么；恶魔设计的管子正在将你自己的精液喂回给你，里面还掺杂着某种化学物质！[pg]");
         outputText("在这种新药的作用下，[eachcock]膨胀起来，充血直到比平时大得多");
         if(get_player().balls > 0)
         {
            outputText("，并且你的[sack]被撑开，因为你的[balls]几乎增大了一倍");
         }
         outputText("。又一次高潮袭来，这次毫无阻碍，因为机器丝毫没有减缓它的运作。射出的精液量是之前的两倍多");
         if(get_player().cockTotal() > 1)
         {
            outputText("");
         }
         outputText("，这无疑要归功于那种药物");
         if(get_player().balls > 0)
         {
            outputText("以及你那巨大睾丸的新容量");
         }
         if(_loc1_ > 1000)
         {
            outputText("，从溢流阀喷射而出，覆盖了你的整个下半身");
         }
         outputText("。");
         if(get_player().hasVagina())
         {
            outputText("你的小穴在入侵者周围痉挛，榨取着这根假阳具，将它排放的受污染精液吸入子宫深处");
            if(get_player().getClitLength() > 3)
            {
               outputText("，你的阴蒂在吸盘下抽搐，快感几乎让你晕厥");
            }
            outputText("。");
         }
         if(get_player().biggestTitSize() > 1)
         {
            outputText("你的乳汁从[nipples]喷射而出");
            if(get_player().hasFuckableNipples())
            {
               outputText("并且你乳头内的管子底部升起圆环，形成密封，");
            }
            outputText("随着吸力的作用，乳汁被迅速抽走。");
         }
         outputText("在你释放一分钟后，另一个方向的水流加剧，向你体内注入了比以前更多的液体");
         if(get_player().biggestLactation() > 1)
         {
            outputText("，现在药剂尝起来混杂着奶水的味道");
         }
         outputText("。柜台处又传来一阵合唱，你听到一些宝石从盘子里滚落到地上的叮当声。[pg]");
         outputText("这种情况持续了几个小时，[eachcock]肿胀到原来大小的近两倍，随着你不断地挺动臀部，高潮一个接一个地到来，中间没有丝毫停歇。你什么都不去想，也不在乎，只顾着在这个机器情人身上发泄，并反过来被它喂食。你每次射出的量不减反增，杯子上长出了多个肉质的溢流阀，每次你射精时都在超负荷工作以排出多余的压力。");
         if(get_player().cor > 90)
         {
            outputText("在经历了字面意义上数百次的高潮后，机器再次开始小心翼翼地调节吸力，拒绝让你释放。它反复地挑逗你的[cocks]");
            if(get_player().hasVagina())
            {
               outputText("和" + get_player().vaginaDescript(0));
            }
            outputText("到高潮的边缘，然后又退缩。无论你怎么挺动似乎都无法跨越那道坎，随着时间的流逝，你的挫败感不断增加。当你徒劳地在管子里摩擦，比任何时候都渴望达到高潮时，你的[cocks]根部形成了一种比平时更尖锐的压力；墙上的绿灯坚定地拒绝亮起，嘲笑着你的尝试。从这种新的压力中，一股奇特的力量流经你身体的其余部分，增加了你的性狂热，给了你第二次呼吸，你终于设法紧紧抓住管子，几乎是在你的肉棒上前后猛烈撞击它们");
            if(get_player().cockTotal() > 1)
            {
               outputText("");
            }
            outputText("。这台该死的恶魔机器再也无法阻止你发泄了；伴随着猛烈的一推，你将[eachcock]深深埋入管口");
            if(get_player().cockTotal() > 1)
            {
               outputText("");
            }
            outputText("随着你的高潮迸发！你的[cocks]喷涌出真正堪称奇迹的大量精液，将溢出阀的盖子完全崩飞。精液射穿整个房间，你感受到那股压力的凸起沿着你的肉棒滑上、从尿道喷出；一块大粉红色水晶从敞开的阀孔中掉落，带着一声\"扑通\"落在湿漉漉的地板上。");
         }
         outputText("就在这时，惠特尼走了进来。[pg]");
         outputText("[say: 卧槽！] 农场主说道，看着你被恶魔般的管子绑在机器上，以及你在她谷仓里留下的粗大精液绳索的惊人数量，她的眼睛都快瞪出来了。");
         if(get_player().cor < 90)
         {
            outputText("你几乎没有注意到她，因为又一次爆炸性的高潮爆发了，你那肿胀得惊人的阴茎");
            if(get_player().cockTotal() > 1)
            {
               outputText("es");
            }
            outputText("将大量的精液推下管子，并以烟花的形状从释放阀中喷出。当一些精液射过谷仓并停在离她不到一英尺的地方时，惠特尼退缩了。这个犬娘尖叫的声音大得足以吵醒整个农场。[say: 该死，[name]；真是……该死！] 你甚至没有去想她，因为你期待着下一次注射被污染的化学物质，并准备好产生另一批精液。");
            dynStats(DynStat.Lib(20),DynStat.Sens(10),DynStat.Lust(80),DynStat.Cor(20));
         }
         else
         {
            outputText("你仍然充满了突然爆发的能量的残余影响，你把管子一根一根地拔下来，花点时间捡起粉色水晶，然后向她走去。看着你眼中带着欲望走近，同时");
            if(get_player().cockTotal() == 1)
            {
               outputText("一根巨大的勃起阴茎在你面前晃动，让你失去平衡");
            }
            else
            {
               outputText("多根巨大的勃起阴茎在你面前晃动，在你的双腿之间拖拽，龟头抵在地板上");
            }
            outputText("，这既可怕又滑稽的景象让她睁大了眼睛。她及时后退，从墙上拉下一把干草叉。[say: 我想我们见面时我看错你了，[name]。现在给我滚出去，永远别再回来，否则我会让你永远也走不了。] 你皱着眉头，停止了前进，向门口走去。虽然你绝对想操她，但给自己一个机会去适应你那华丽的新身体也许不是个坏主意。毕竟，不管她说什么，你总是可以回来的……同时你发誓要找点什么或什么人来强奸，或者变成你个人的阴茎榨乳器。有了像你这样惊人的");
            if(get_player().totalCocks() == 1)
            {
               outputText("肉棒");
            }
            else
            {
               outputText("一套肉棒");
            }
            outputText("，现在还担心什么呢？");
            dynStats(DynStat.Lib(20),DynStat.Sens(10),DynStat.Lust(80),DynStat.Cor(100));
         }
         get_game().gameOver();
      }
      
      public function meetMarble() : void
      {
         var _loc1_:Number = 0;
         if(get_game().marbleScene.get_knowAddiction() == 0)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,458) >= 7)
            {
               get_marbleScene().encounterMarbleExploring();
            }
            else
            {
               get_marbleScene().encounterMarbleExploring2();
            }
         }
         else
         {
            if(get_player().hasPerk(PerkLib.MarbleResistant))
            {
               get_marbleScene().postAddictionFarmExplorings();
               return;
            }
            if(get_game().marbleScene.get_knowAddiction() == 1)
            {
               if(get_player().hasStatusEffect(StatusEffects.MarbleWithdrawl))
               {
                  _loc1_ = 0;
               }
               else
               {
                  _loc1_ = 1;
               }
               if(_loc1_ == 0)
               {
                  get_marbleScene().addictedEncounterHappy();
               }
               else
               {
                  get_marbleScene().marbleEncounterAddictedNonWithdrawl();
               }
            }
            else
            {
               if(get_player().hasStatusEffect(StatusEffects.MarbleWithdrawl))
               {
                  _loc1_ = 0;
               }
               else
               {
                  _loc1_ = 1;
               }
               if(_loc1_ == 0)
               {
                  get_marbleScene().encounterMarbleAshamedAddiction();
               }
               else
               {
                  get_marbleScene().marbleEncounterAddictedNonWithdrawlAshamed();
               }
            }
         }
      }
      
      public function load(param1:int, param2:*) : void
      {
         Utils.extend(saveContent,param2);
      }
      
      public function grazingTime() : Boolean
      {
         var _loc1_:int = 6;
         var _loc2_:int = 11;
         if(get_time().hours >= _loc1_)
         {
            return get_time().hours < _loc2_;
         }
         return false;
      }
      
      public function get_marbleScene() : MarbleScene
      {
         return get_game().marbleScene;
      }
      
      public function get_debugName() : String
      {
         return "农场";
      }
      
      public function get_debugHint() : String
      {
         return "";
      }
      
      public function getMilked() : void
      {
         var _loc6_:* = null as IMap;
         var _loc7_:* = null as Player;
         clearOutput();
         outputText("当你踏入谷仓的阴影时，它高高地耸立在你面前。");
         if(!get_player().hasStatusEffect(StatusEffects.BreastsMilked))
         {
            if(get_player().cor < 50)
            {
               outputText("当你走进去时，你紧张地发抖。");
            }
            else
            {
               outputText("当你走进去时，你急切地微笑着。");
            }
            outputText("谷仓里充满了泥土、木头和油脂的泥土气息。这里大部分地方都很干净，尽管地板只是压实的泥土，而且畜栏看起来很旧，经常使用。靠墙的一排机器发出嗡嗡声和脉动声，仿佛它是一个活物。软管和电缆从十几个地方延伸出来，消失在墙壁中。西墙上甚至还有一排坚固的木门。那一定是农场里有智慧的居民居住的地方。你注意到每个畜栏上都有名牌，甚至还有一个写着[name]。那一定是给你的。[pg]");
         }
         else
         {
            outputText("你走到谷仓，热切地期待着被挤奶的机会。");
            if(get_player().hasStatusEffect(StatusEffects.LactationReduction) && get_player().totalCocks() == 0)
            {
               outputText("你的[nipples]肿胀着，准备好被照顾了。");
            }
            else if(get_player().totalCocks() > 0)
            {
               outputText("你的[cocks]勃起");
               if(get_player().totalCocks() > 1)
               {
                  outputText("");
               }
               outputText("并跳动着");
               if(get_player().totalCocks() == 1)
               {
                  outputText("");
               }
               outputText("充满欲望。");
            }
            if(get_player().hasStatusEffect(StatusEffects.LactationReduction) && get_player().cockTotal() > 0)
            {
               outputText("你的[nipples]和[cocks]变");
               outputText("坚挺并准备好");
               outputText("它们");
               outputText("自己的意志。");
            }
            outputText("门很容易就开了，你急匆匆地冲进你的隔间。[pg]");
         }
         if(!get_player().hasStatusEffect(StatusEffects.BreastsMilked))
         {
            outputText("隔间里无力地挂着一套安全带，用来固定住里面的人，直到他们被榨干最后一滴奶。你慢慢呼出一口气，强迫自己走进去。当你解开带子时，把剩下的安全带固定到位变得越来越容易。当你把最后一条带子扣好时，机器发出嗡嗡声并将其拉紧，把你从地上抬起，面朝下悬挂着。你下方的托盘上，挤奶泵在跳动和振动，当你听到机器启动时，它们微微抽搐着。[pg]");
         }
         else
         {
            outputText("你轻松地系上安全带并升到指定位置，听到机器自动启动。");
         }
         var _loc1_:Number = Utils.rand(3);
         if(get_player().nippleLength == 3 && Utils.rand(2) == 0)
         {
            _loc1_ = 3;
         }
         if(!get_player().hasStatusEffect(StatusEffects.BreastsMilked) || _loc1_ == 0)
         {
            if(!get_player().hasStatusEffect(StatusEffects.BreastsMilked))
            {
               get_player().createStatusEffect(StatusEffects.BreastsMilked,0,0,0,0);
            }
            outputText("尽管被紧紧束缚着，你还是设法抓住了吸盘，把它们拉到你的[nipples]上。它们立刻吸附上去，");
            if(get_player().nippleLength <= 1.5)
            {
               outputText("把你的每个乳头完全拉进吸管里。");
            }
            else
            {
               outputText("当你的乳头滑入吸管时，它们努力地适应着你的每个乳头。");
            }
            outputText("随着吸力迅速增强，传来一阵机械的颠簸声。你的乳头肿胀到 " + int(get_player().nippleLength * 1.5 * 10) / 10 + " 英寸长，因为拉扯而变成紫红色。你能感觉到有什么东西在你的 " + get_player().allBreastsDescript() + " 里涌动，并在向你的[nipples]移动时不断积聚。[pg]");
         }
         else if(_loc1_ == 1)
         {
            outputText("你向下伸展身体，抓住吸盘，把它们拉到你渴望的乳头上。它们吸附上去，紧紧地贴着你，真空压力将它们紧紧地密封在你的身体上。你能感觉到你的[nipples]被拉紧，在巨大的压力下几乎变大了一倍。");
            if(get_player().nippleLength >= 3)
            {
               outputText("由于它们巨大的尺寸，它们几乎撑破了用来挤奶的管子。");
            }
            outputText("你 " + get_player().allBreastsDescript() + " 敏感的肉体充满了不断膨胀的压力，这种压力集中在连接到你乳头的管子周围。[pg]");
         }
         else if(_loc1_ == 2)
         {
            outputText("尽管安全带很紧，你还是设法伸手去抓挤奶器的透明杯子。当你把它们拿起来准备挤奶时，杯子在你的手中抽搐和移动。你开始把它们贴在你的 " + get_player().nippleDescript(0) + " 上，突然一阵颠簸，吸力拉扯着你，把挤奶器的杯子紧紧地压在你的胸前，把你的[nipples]拉长到几乎是正常长度的两倍。你感觉到压力在积聚，机器无情地吸吮着你，把你的奶水吸到表面。[pg]");
         }
         if(_loc1_ == 3)
         {
            outputText("尽管安全带很紧，你还是收集了吸盘，把它们带到你巨大的乳头上，让机器以令人痛苦的缓慢速度把它们拉进紧绷的杯子里。尽管你的乳晕很大，机器还是慢慢地把你吸进去，这种紧绷感只会让你更加兴奋。吸力把乳头管的壁紧紧地拉在你的乳头上，使它们像鸡巴一样肿胀变成紫色。当你的身体让你的奶水流下时，几滴奶水从尖端漏出，让它流过你被囚禁的乳头，走向释放。[pg]");
            dynStats(DynStat.Lust(10));
         }
         var _loc2_:Number = Utils.rand(3);
         if(get_player().lactationQ() < 50)
         {
            dynStats(DynStat.Lust(15));
            if(_loc2_ == 0)
            {
               outputText("几滴奶水在你的[nipples]尖端结成花蕾，当它们滚落到管子边缘时变得更大。感觉就像");
               if(get_player().totalBreasts() == 2)
               {
                  outputText("一对");
               }
               else if(get_player().totalBreasts() == 4)
               {
                  outputText("四重");
               }
               else
               {
                  outputText("一组");
               }
               outputText("内部的闸门正在打开，细细的奶流喷发而出，喷洒到嘈杂的吸管中。奶水在积聚之前就被吸走了，让你想知道你到底能产出多少。挤奶持续了大半个小时，尽管你在结束前很久就不再产奶了。当挤奶器关闭并解开安全带时，你的乳房疼得厉害。[pg]");
            }
            else if(_loc2_ == 1)
            {
               outputText("你的每个" + get_player().nippleDescript(0) + "都喷出了一小股乳汁，随后饥渴的机器将其吞噬，吸入通向惠特尼机器的透明管道中。你下意识地呻吟出声，设备带来的脉动吸吮感让你感到相当兴奋。你喷出细小的乳汁流，将你" + get_player().allBreastsDescript() + "里的母乳排空。一小时后，你的束缚带松开了，将你放回地面，挤奶杯从你那痛得敏感的[nipple]上脱落。[pg]");
            }
            else if(_loc2_ == 2)
            {
               outputText("你的[nipples]尖端肿胀了片刻，然后释放出细小的乳汁流，进入吸盘。乳汁迅速排空，顺着管道流向收集装置。这种感觉既愉悦又强烈，但在机器完成工作之前很久，你的乳汁就干涸了。持续的脉动吸吮并没有减弱，在将近一个小时的时间里，拉扯并虐待着你可怜的乳头。尽管感到疼痛和敏感，你还是乐在其中，当束缚带最终将你放回地面时，你发现自己已经开始期待下一次了。[pg]");
            }
         }
         else if(get_player().lactationQ() < 250)
         {
            dynStats(DynStat.Lust(30));
            if(_loc2_ == 0)
            {
               outputText("当你开始向挤奶杯里泌乳时，几滴乳汁顺着杯子边缘滚落。乳汁从你的乳头喷射出连续的液流，在杯底形成一个小水坑，机器通过透明管道将其吸向储液罐。随着挤奶的进行，你火热地呻吟着，排空了你" + get_player().allBreastsDescript() + "里充满奶油的货物。在一个小时里，你的世界只剩下吸吮和释放的感觉，尽管到了最后，除了微小的乳滴，什么也挤不出来了。终于，束缚带将你放回地面，让杯子从你受虐的[nipples]上弹开。你感到有些酸痛和敏感，但这种体验让你极度兴奋。[pg]");
            }
            if(_loc2_ == 1)
            {
               outputText("一股紧实的乳汁从你的[nipples]喷发而出，倾泻到饥渴的乳头杯底部。乳汁在那里汇聚，管道努力将其吸走。它们变成了白色，机器嗡嗡作响，努力跟上你的速度。当你喷出乳汁时，吸力的拉扯和释放极具情色意味，让你在束缚带中因感官的愉悦而扭动。不幸的是，由于所有的带子，你对腹股沟的燥热无能为力。经过一个小时的挤奶，当你的产量下降到几乎只有涓涓细流时，你被慢慢放回地面，并在挤奶周期完成时被释放。[pg]");
            }
            if(_loc2_ == 2)
            {
               outputText("大滴的乳汁从你的[nipples]倾泻而出，在挤奶杯中汇聚，机器开始提取你那奶油般的母乳。随着机器切换到脉动吸力，乳汁开始从你体内喷涌而出。当你的" + get_player().allBreastsDescript() + "排空时，你愉快地呻吟着，释放了积聚的压力。这种感觉不仅在这一方面令人愉悦，你还感觉到自己变得");
               if(get_player().totalCocks() == 0)
               {
                  if(get_player().hasVagina())
                  {
                     outputText("湿润");
                  }
                  else
                  {
                     outputText("发情");
                  }
               }
               else
               {
                  if(get_player().hasVagina())
                  {
                     outputText("湿润且");
                  }
                  outputText("坚挺");
               }
               outputText("由于这种感觉。在接下来的一个小时里，你被完全榨干，直到机器的努力只换来一丝微弱的白色细流。束缚带轻轻地将你放回地面并释放了你，让你感到酸痛。[pg]");
            }
         }
         else if(get_player().lactationQ() < 750)
         {
            dynStats(DynStat.Lust(40));
            if(_loc2_ == 0)
            {
               outputText("乳汁的喷发用奶油的漩涡淹没了吸管。机器发出巨大的嘎嚓声，努力跟上液体的波浪，而你的乳头继续向容器中喷涌。当你的乳头变得红肿敏感时，你高兴地尖叫起来，但它们的产量从未减慢。在束缚带中扭动，你越来越被这个吸奶装置唤起，直到你觉得你再也无法忍受了。当你出来时，你将需要发泄一下。经过一个小时的性折磨，吸力切断，束缚带松开。乳头吸盘脱落，将你的乳汁洒在地板上，而水滴继续从你过度生产的胸部漏出。[pg]");
            }
            if(_loc2_ == 1)
            {
               outputText("你的[nipple]像小气球一样肿胀了片刻，然后释放出乳汁的洪流。乳头圆柱体瞬间被填满，挤奶机器发出巨大的嘎嚓声，试图将它们全部吸入管道，勉强跟上你的速度。你在束缚带中喘息和扭动，每一次乳汁的脉动都将一种不断增长的温暖感传到你的腹股沟，让你");
               if(get_player().totalCocks() == 0)
               {
                  if(get_player().hasVagina())
                  {
                     outputText("湿润");
                  }
                  else
                  {
                     outputText("发情");
                  }
               }
               else
               {
                  if(get_player().hasVagina())
                  {
                     outputText("湿润且");
                  }
                  outputText("坚挺");
               }
               outputText("因兴奋而。挤奶拖延了一个小时，但你的产量只稍微减慢了一点，迫使机器在整个过程中以最大容量工作。最后它结束了，束缚带将你放回地面。挤奶杯弹开，留下你漏奶的乳房在地板上形成一个水坑。[pg]");
            }
            if(_loc2_ == 2)
            {
               outputText("当你的乳房对机械化的吸吮做出反应时，乳汁淹没了挤奶器的杯子。机器发出呻吟声，因为它进入了高速运转状态，努力跟上你惊人的生产速度。你的乳头因快乐的微小快感爆发而刺痛，因为它们继续倾泻出越来越多的乳汁。兴奋涌上心头，让你的身体泛起难以掩饰的红晕。你在束缚带中扭动，大汗淋漓，试图在某物上摩擦，任何东西，只要能让你发泄就行。挤奶拖延了一个小时，但你的乳房在整个过程中不断倾泻出乳汁。当它结束时，你被放回地面并释放。挤奶管弹开，留下你躺在乳汁水坑里，而你漏奶的乳头继续滴落。[pg]");
            }
         }
         else
         {
            dynStats(DynStat.Lust(60));
            _loc2_ = Utils.rand(2);
            if(_loc2_ == 0)
            {
               outputText("你的[nipples]抽搐和脉动了片刻，然后释放出乳汁的洪流，完全填满了管道。机器摇晃着，努力跟上你淹没管道的速度。警报开始响起，乳汁开始从边缘漏出——惠特尼的机器根本跟不上！你可以听到谷仓里的脚步声，一双柔软的手将杯子按在你的胸前。机器关闭了，但另一双手开始按摩你的" + get_player().allBreastsDescript() + "，在没有机器辅助的情况下，将一波又一波的乳汁泵过管道。你几乎");
               if(get_player().hasVagina())
               {
                  outputText("高潮了");
               }
               else if(get_player().hasCock())
               {
                  outputText("射了出来");
               }
               else
               {
                  outputText("高潮了");
               }
               outputText("在挤奶继续的过程中，你神秘的帮手对你百般关照，你变得如此饥渴难耐，以至于你试图在束缚具里扭动，想要贴紧他们。经过一个小时不间断的挤压和喷射，你的挤奶结束了，那双手松开了你。吸杯掉在地上，束缚具将你放回地面。等你转过头来，你的帮手已经离开了。[pg]");
            }
            else
            {
               outputText("你的身体释放出乳汁，让奶管里充满了奶油般的美味。由于机器无法跟上释放出的乳汁量，乳汁立刻开始从边缘泄漏。警报声响起，轻柔的脚步声在谷仓里回荡，有人来帮忙了。你听到金属碰撞的叮当声，然后吸力增强，几乎翻倍，狠狠地挤压着你，抽干了你巨大的乳汁库。你的乳头因这种奇妙的快感而隐隐作痛，让你在束缚中咕哝着、挣扎着，渴望得到释放，但你就是得不到你需要的刺激。你就这样被挑逗了一个小时，乳汁被抽干，直到机器关闭，束缚具将你放回地面，当乳头吸杯弹出时，你被留在了自己制造的乳汁水坑里。[pg]");
            }
         }
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 500;
         if(get_easyMode())
         {
            _loc5_ *= 2;
         }
         if(get_debug())
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,104,0);
            _loc5_ = 9999;
         }
         _loc3_ = int(get_player().lactationQ() * (Utils.rand(10) + 90) / 100 / 1000);
         if(_loc3_ < 0)
         {
            _loc3_ = 1337;
         }
         _loc4_ = _loc3_ * 2 * 4;
         outputText("机器显示有 " + _loc3_ + " 升乳汁");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,104) >= _loc5_)
         {
            outputText("并显示警告：<b>你的产奶量超过了惠特尼能支付的上限</b>");
            _loc4_ = 0;
         }
         if(_loc4_ > 0)
         {
            if(_loc4_ + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,104) > _loc5_)
            {
               _loc4_ = _loc5_ - FlagDict_Impl_.arrayReadInt(KFLAGS.flags,104);
            }
            _loc6_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc6_,104,FlagDict_Impl_.arrayReadInt(_loc6_,104) + _loc4_);
            outputText("并自动分配了 " + Utils.num2Text(_loc4_) + " 颗宝石。惠特尼在这个装置上真是下足了血本！");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,104) >= _loc5_)
            {
               outputText("<b>机器警告你，惠特尼这周已经付不起更多钱了！</b>");
            }
            _loc7_ = get_player();
            _loc7_.set_gems(_loc7_.get_gems() + _loc4_);
         }
         else
         {
            outputText("。");
         }
         if(_loc3_ > 2)
         {
            outputText("[pg]强烈的榨乳让你感到头晕目眩，除了覆盖在你" + get_player().allBreastsDescript() + "上的残留液体外，你很难将注意力集中在其他任何事情上。");
            if(get_player().hasStatusEffect(StatusEffects.Feeder))
            {
               dynStats(DynStat.Inte(-1));
               if(_loc3_ > 5)
               {
                  dynStats(DynStat.Inte(-1));
               }
               if(_loc3_ > 10)
               {
                  dynStats(DynStat.Inte(-1));
               }
               if(_loc3_ > 20)
               {
                  dynStats(DynStat.Inte(-1));
               }
            }
            else
            {
               if(_loc3_ / 2 > 10)
               {
                  dynStats(DynStat.Inte(-10));
               }
               else
               {
                  dynStats(DynStat.Inte(-_loc3_ / 2));
               }
               if(_loc3_ > 30)
               {
                  dynStats(DynStat.Inte(-2));
               }
            }
            if(get_player().get_inte() < 10)
            {
               doNext(cowBadEnd1);
               return;
            }
            if(get_player().get_inte() < 15)
            {
               outputText("你伸了个懒腰，发出一声满足的、悠长而响亮的牛叫。太傻了！");
            }
            else if(get_player().get_inte() < 25)
            {
               outputText("你悄悄地发出一声牛叫，然后对自己奇怪的举动咯咯地笑了起来。");
            }
         }
         outputText("[pg]");
         if(get_player().get_lust100() < 75)
         {
            outputText("你感到酸痛且非常饥饿，你整理好衣服，踉踉跄跄地走回营地，无视了你经过惠特尼时她给你的那个会意的微笑。");
         }
         else
         {
            outputText("你被欲望冲昏了头脑，甚至懒得遮掩整理一下自己，直接跑出谷仓，" + get_player().allBreastsDescript() + "湿漉漉地晃动着，径直朝营地跑去。");
            if(farmCorruption.whitneyCorruption() < 90)
            {
               outputText("直到你回去，你才想起惠特尼给你的那个不赞成的眼神，但如果说有什么影响的话，那只会让你更加饥渴。");
            }
            dynStats(DynStat.Lust(get_player().maxLust(),DynStatOp.Eq));
         }
         get_player().boostLactation(0.05);
         get_player().changeStatusValue(StatusEffects.Feeder,2,0);
         if(get_player().statusEffectv1(StatusEffects.LactationEndurance) < 1.5)
         {
            get_player().addStatusValue(StatusEffects.LactationEndurance,1,0.05);
         }
         get_player().addStatusValue(StatusEffects.LactationEndurance,1,0.05);
         get_player().createStatusEffect(StatusEffects.Milked,8,0,0,0);
         get_player().orgasm("Tits",false);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function findStables() : void
      {
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2732,1);
         clearOutput();
         outputText("在农舍周围[walking]时，你发现了似乎是马厩的地方。你已经熟悉了挤奶谷仓，因此这座建筑肯定不是用来养牛的。那么惠特尼<i>确实</i>有马！你要么这么想，要么就是半人马对现场居住条件的标准非常低。你总是喜欢探索，于是你欢快地走了进去。");
         outputText("[pg]你一进去，马厩里立刻散发出一股马麝香和动物污物的气味。巧合的是，惠特尼此刻也在这里。犬娘很快注意到了你，并开口说道。[say:你好啊，[name]，" + (grazingTime() ? "只是在清理隔间。马儿们出去呼吸新鲜空气和吃草了。" : "只是在照顾马儿。给它们刷毛和清洁很重要，这也是个好机会，可以确保它们没有不知怎么弄伤自己。") + "什么风把你吹来了？]");
         outputText("[pg]你解释说你只是在闲逛，好奇地查看了马厩。在一个被恶魔征服蹂躏的世界里，马似乎是一项需要喂养和照顾的巨大投资。惠特尼耸耸肩，[say:它们可以拉一车农产品，而且在很多时候比步行要好。]");
         outputText("[pg]说得通。如果她有理由照顾和饲养马匹，它们一定值得拥有。虽然你认为，也许部分原因可能是让它们远离腐化。也许惠特尼有时可以让你骑着马到处转转？");
         outputText("[pg][say:也许吧。如果你真的感兴趣，改天告诉我，我们也许可以试一试，]她说着，把注意力转回手头的任务。你把这当作离开的暗示。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function farmMenu(param1:Boolean = true) : void
      {
         if(param1)
         {
            clearOutput();
            if(get_time().isDay())
            {
               outputText("许多种满农作物的地块环绕着这座俯瞰湖泊的简朴农舍。各种其他建筑也点缀在土地上——比如谷仓，它后面有自己的锻造炉，用于修理工具。动物的棚舍面向更开阔、未被使用的土地，方便让牲畜出去吃草。对于这样一个简朴的经营来说，惠特尼的农场出奇的大。你想做什么？");
            }
            else
            {
               outputText("虽然没有阳光，但你还是能看清大致的轮廓，足以四处走动。农场可能很大，但很容易辨认方向。");
            }
         }
         menu();
         var _loc2_:Number = 0;
         var _loc3_:Number = 0;
         var _loc4_:Number = 0;
         var _loc5_:Number = 0;
         var _loc6_:Number = 0;
         if(get_player().hasStatusEffect(StatusEffects.Kelt) && !get_player().hasStatusEffect(StatusEffects.KeltOff) && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2030) <= 0)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,725) >= 4)
            {
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,728) == 1)
               {
                  addButton(0,"凯莉",kelly.breakingKeltOptions);
               }
               else
               {
                  addButton(3,"凯莉",kelly.breakingKeltOptions);
               }
            }
            else
            {
               addButton(3,"凯尔特",kelly.breakingKeltOptions).hint("去找凯尔特。");
            }
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,728) != 1 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2031) > 0)
         {
            addButton(0,"探索",exploreFarm).hint("在广阔的农场里好好徒步一番。也许你能在这里找到什么有趣的东西。");
            addButton(1,"交谈",talkWhitney).hint("和农场主惠特尼搭话。").disableIf(get_time().isNight(),"惠特尼似乎已经回屋休息了。").disableIf(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2031) > 0,"惠特尼已经死了，你无法和她交谈。");
            addButton(2,"工作",workFarm).hint("问问惠特尼需不需要帮忙。她大概会很感激的。").disableIf(get_player().fatigueLeft() < 20,"你太累了，帮不上忙。").disableIf(get_time().isNight(),"太阳下山后没什么需要做的。").disableIf(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2031) > 0,"惠特尼已经死了，你无法提出帮忙。");
            if(get_player().hasStatusEffect(StatusEffects.Marble))
            {
               addButton(4,"玛布尔",meetMarble).hint("去拜访牛娘玛布尔。").disableIf(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,463) > 0,"你已经决定不再见玛布尔了。不过如果你想再见她，还是有希望的。").disableIf(get_player().hasStatusEffect(StatusEffects.MarbleRapeAttempted),"玛布尔对你试图强暴她的事很不满。现在最好别去找她。").disableIf(get_player().hasStatusEffect(StatusEffects.NoMoreMarble),"不幸的是，玛布尔已经离开了，你找不到她了。");
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2732) > 0)
            {
               addButton(5,"马厩",stablesMenu).hint("去看看惠特尼的马。");
            }
            if(get_player().hasKeyItem("Breast Milker - Installed At Whitney\'s Farm"))
            {
               addButton(6,"挤奶",getMilked).hint("使用挤奶器榨干你的" + get_player().breastDescript(0) + "。尽量不要太频繁地使用挤奶器。").disableIf(get_player().hasStatusEffect(StatusEffects.Milked),"你的" + get_player().nippleDescript(0) + "现在太疼了，没法挤奶。你得等一会儿。");
            }
            if(get_player().hasKeyItem("Cock Milker - Installed At Whitney\'s Farm") && get_player().cockTotal() > 0)
            {
               addButton(7,"挤精",cockPumping).hint("使用阴茎挤奶器释放你的压力。不过尽量不要过度使用挤奶器！");
            }
         }
         setExitButton();
      }
      
      public function farmExploreEncounter() : void
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1077) > 0)
         {
            farmCorruption.rootScene();
            return;
         }
         if(farmCorruption.takeoverPrompt() == true)
         {
            return;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,464) == 1 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2031) < 1)
         {
            outputText("你一靠近农场，惠特尼就大步向你走来，脸上挂着冷漠的表情。");
            outputText("[pg][say: 你他妈以为你在这里干什么，[name]？在你对玛布尔做了那些事之后，你还以为这里欢迎你吗？离开。<b>马上</b>。]");
            doNext(get_camp().returnToCampUseOneHour);
            return;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,464) == 2 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2031) < 1)
         {
            clearOutput();
            outputText("你一靠近农场，惠特尼就大步向你走来，脸上挂着冷漠的表情。");
            outputText("[pg][say: 你他妈以为你在这里干什么，[name]？在你对凯尔特做了那些事之后，你还以为这里欢迎你吗？离开。<b>马上</b>。]");
            doNext(get_camp().returnToCampUseOneHour);
            return;
         }
         clearOutput();
         get_images().showImage("location-ingnam-farm");
         if(get_player().statusEffectv1(StatusEffects.MetWhitney) < 2)
         {
            spriteSelect(SpriteDb.get_s_whitney());
            if(!get_player().hasStatusEffect(StatusEffects.MetWhitney))
            {
               if(!get_time().isDay())
               {
                  outputText("沿着湖边漫步，你发现在离水较远的地方似乎有一座房子，周围环绕着大概是农作物的田地。当你靠近农场边缘时，淡淡的植物香气引起了你的注意。环顾四周，你估计住在这里的人要么在房子里准备睡觉，要么已经睡着了。[if (hunger >= 65) {你的肚子饿得咕咕叫|你脑海中盘算着明天早上该怎么弄点吃的}]，同时你将目光转向最近的一块地。这里种了这么多东西，你怀疑他们根本不会注意到你偷了一点。");
                  menu();
                  addNextButton("偷窃",nightFarmSteal).hint("他们不会发现的。");
                  addNextButton("离开",nightFarmLeave).hint("也许白天再来？");
                  return;
               }
               get_player().createStatusEffect(StatusEffects.MetWhitney,0,0,0,0);
               outputText("你在湖的对岸发现了一个古朴的农舍[if (" + Std.string(saveContent.firstEncounterNight) + ") {，认出这是那天晚上的那个}]。农舍周围是一片片菜园，种满了美味的水果和蔬菜。你的肚子咕咕叫了起来，[if (hunger >= 65) {饿得发疼|被眼前的景象和气味诱惑着}]，你走近了住所。辣椒地里的一个人影站起来迎接你，向你挥手。");
               outputText("[pg]你[if (days<4) {尽力掩饰你的惊讶，当你意识到|上下打量着她，看到}]这位农夫是一个长着" + (get_noFur() ? "狗耳朵和毛茸茸尾巴" : "皮毛和犬类特征") + "的女人。她开心地咯咯笑着，招呼你过去。[say: 欢迎[if (isChild) {小家伙|陌生人}]，在这里看到新面孔真是太好了。我叫惠特尼，而且[if (isChild) {你能走到我这里真是太幸运了|我不用像对待大多数客人那样用干草叉叉你，真是太好了}]！]她向你介绍了湖泊和她的农场，告诉你恶魔似乎无法在这里久留，而怪物在少数几次靠近时似乎总是变弱了。惠特尼发现自己说得太多了，迅速转移了话题。[say: 我得回去工作了，不过你可以随便吃辣椒，亲爱的[if (isChild) {——我可不会让一个好孩子在外面挨饿}]！][pg]");
            }
            else
            {
               outputText("你又偶然来到了惠特尼的农场。那位" + (get_noFur() ? "长着狗耳朵的" : "拟人化犬类") + "女人友好地向你挥手，并扔给你另一个犬椒。[pg]");
               get_player().addStatusValue(StatusEffects.MetWhitney,1,1);
               if(get_player().statusEffectv1(StatusEffects.MetWhitney) == 2)
               {
                  outputText("在多次拜访这个友好的农场后，你确信自己现在可以稳定地找到去那里的路，而不需要再靠运气偶然发现了。[pg]");
                  outputText("<b>（“农场”已添加到地点菜单。）</b>[pg]");
               }
            }
            get_inventory().takeItem(get_consumables().CANINEP,get_camp().returnToCampUseOneHour);
         }
         else
         {
            clearOutput();
            get_images().showImage("location-ingnam-farm");
            spriteSelect(SpriteDb.get_s_whitney());
            get_player().addStatusValue(StatusEffects.MetWhitney,1,1);
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2030) >= 1)
            {
               outputText("你一靠近农场，惠特尼就气冲冲地迎上前来。[say: 你他妈的都干了些什么？！]");
               outputText("[pg]你举起双手，心里很清楚这个愤怒的婊子在说什么。她愤怒地说：[say: 你他妈的杀了凯尔特！他可能很粗鲁，我也不喜欢他，但不管怎样，你做的事是错的。我的农场不再欢迎你了！离开。<b>马上。</b>]");
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,464,2);
               doNext(get_camp().returnToCampUseOneHour);
               return;
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,725) >= 4 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,728) == 0)
            {
               clearOutput();
               outputText("你一前往农场，惠特尼就气冲冲地迎上前来。[say: 你到底在搞什么鬼？！]");
               outputText("[pg]你举起双手，心里很清楚这个愤怒的婊子在说什么。[say: 我没对他做任何他不会对我做的事。]");
               outputText("[pg]惠特尼怒气冲冲，[say: 在这点上你可能是对的，但区别在于凯尔特并没有一直来找你做这种事。我不太喜欢他。]惠特尼为了强调吐了口唾沫，然后继续说道，[say: 但我当时觉得他够可怜了，才让他待在身边，只要他离我和其他人都远远的就行。那男孩有……一种气场或者别的什么，而且确实，你很可能会落得像他一样的下场。]她回头瞪着农场以示强调。[say: 但那只有在你足够享受，以至于一直围着那个蠢货转的情况下才会发生。你……你只是一直缠着他……一遍又一遍地用那些恶魔体液给他下药。那个可怜的家伙现在连睡觉都在呜咽着想要你的鸡巴。]");
               outputText("[pg]惠特尼开始低吼，然后控制住自己，双臂交叉抱在胸前。[say: 我看你不需要再在我的农场周围转悠了，但既然“凯莉”似乎需要你，当你来找她时，我会让她出去见你。只要离我们其他人远点就行。]");
               outputText("[pg]她转过身，小跑着回到了她的农场，边走边拿起一把干草叉。看来你无法再进入农场了，至少在你想到办法对付惠特尼之前是这样。");
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,728,1);
               farmMenu(false);
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,728) == 1)
            {
               clearOutput();
               outputText("农场本身不欢迎你，但你可以看到凯莉在田野里小跑，正在寻找你。");
               farmMenu(false);
            }
            else
            {
               farmMenu();
            }
         }
      }
      
      public function farmEnabled() : Boolean
      {
         if(get_player().statusEffectv1(StatusEffects.MetWhitney) >= 2)
         {
            return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,464) == 0;
         }
         return false;
      }
      
      public function farmCorrupt() : Boolean
      {
         return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1077) > 0;
      }
      
      public function exploreFarm() : void
      {
         clearOutput();
         var _loc1_:Number = 0;
         var _loc2_:Number = 0;
         if(get_player().hasStatusEffect(StatusEffects.MarbleRapeAttempted) && !get_player().hasStatusEffect(StatusEffects.NoMoreMarble))
         {
            get_marbleScene().marbleAfterRapeBattle();
            get_player().createStatusEffect(StatusEffects.NoMoreMarble,0,0,0,0);
            return;
         }
         if(get_game().xmas.nieve.nieveAvailable() && get_game().xmas.nieve.get_stage() > 0 && get_game().xmas.nieve.get_stage() < 4 && !get_player().hasKeyItem("Carrot"))
         {
            get_game().xmas.nieve.findACarrot();
            return;
         }
         if(get_player().hasCock() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,707) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,375) < 0 && get_game().isabellaFollowerScene.isabellaFollower() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,380) == 0 && Utils.rand(2) == 0)
         {
            get_game().isabellaFollowerScene.findIzzyMilking();
            return;
         }
         if(!get_player().hasStatusEffect(StatusEffects.Marble) && !get_player().hasStatusEffect(StatusEffects.NoMoreMarble))
         {
            doNext(get_camp().returnToCampUseOneHour);
            get_marbleScene().encounterMarbleInitially();
            return;
         }
         if(Utils.rand(2) == 0 && !get_player().hasStatusEffect(StatusEffects.Kelt) && !get_player().hasStatusEffect(StatusEffects.KeltOff))
         {
            doNext(get_camp().returnToCampUseOneHour);
            keltScene.keltEncounter();
            return;
         }
         if(Utils.rand(3) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2732) == 0 && get_player().hasStatusEffect(StatusEffects.Kelt))
         {
            findStables();
            return;
         }
         if(!get_player().hasStatusEffect(StatusEffects.NoMoreMarble) && get_player().hasStatusEffect(StatusEffects.MarbleWithdrawl))
         {
            if(get_game().marbleScene.get_knowAddiction() == 1)
            {
               get_marbleScene().addictedEncounterHappy();
            }
            else
            {
               get_marbleScene().encounterMarbleAshamedAddiction();
            }
            return;
         }
         _loc2_ = Utils.rand(3);
         if(_loc2_ == 0)
         {
            if(get_time().isDay())
            {
               spriteSelect(SpriteDb.get_s_whitney());
               outputText("你在农场周围奔跑，留意惠特尼的财产周围是否有任何怪物或异常情况。最终，这只母狗加入了你，你们俩在挑战速度极限的过程中度过了一段愉快的时光。");
               if(get_player().get_spe100() < 30)
               {
                  dynStats(DynStat.Spe(2));
                  outputText("惠特尼轻松地超过了你，把你远远甩在后面，你每跑一圈，她就能绕农场跑两圈。");
               }
               else if(get_player().get_spe100() < 50)
               {
                  dynStats(DynStat.Spe(1));
                  outputText("惠特尼仍然比你快，并且能够领先你足够远的距离，时不时地从你的视线中消失。");
               }
               else if(get_player().get_spe100() < 70)
               {
                  dynStats(DynStat.Spe(0.75));
                  outputText("你和惠特尼势均力敌，你们俩一起跑了一会儿，每个人都更加努力地逼迫自己，试图超越对方。");
               }
               else
               {
                  dynStats(DynStat.Spe(0.5));
                  outputText("惠特尼落后了，无法跟上你在农场周围飞奔的速度。");
               }
               outputText("[pg]之后，你们俩靠在一棵树上，大口喘着粗气，互相寒暄。等你们都休息够了，她向你告别，回去继续工作，留下你踏上回营地的路。");
            }
            else
            {
               outputText("拥抱开阔的空气，你加快了[walk]的速度，变成了[if (!isbiped) {某种}]轻快的慢跑。在黑暗中快速的[if (istaur) {奔驰|游荡}]在某种程度上令人感到舒缓，远离了工作日的喧嚣。[if (" + Std.string(get_player().hasStatusEffect(StatusEffects.Kelt) && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,725) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2030) == 0) + ") { 你的平静被打破了，因为你注意到了凯尔特怒视的目光，他手里拿着准备好的弓。幸运的是，他在向你射箭之前认出了你。他继续小跑，什么也没说。}]");
               dynStats(DynStat.Spe(0.1));
            }
            doNext(get_camp().returnToCampUseOneHour);
            return;
         }
         if(_loc2_ == 1)
         {
            if(get_time().isDay())
            {
               outputText("四处游荡了一会儿后，你发现自己站在一个微微隆起的小山丘上，俯瞰着农场和远处的湖泊。尽管你知道腐化正在慢慢吞噬这片土地，但此刻站在这里让你感到如此平静，你希望这一刻能永远持续下去。");
            }
            else
            {
               outputText("四处游荡了一会儿后，你发现自己站在一个微微隆起的小山丘上，俯瞰着农场和远处微微闪烁的湖泊。安顿下来后，你让自己沉浸在风景中，不受那些如果你在这么晚的时候在大多数地方休息就会扑上来的腐化生物的干扰。");
            }
            dynStats(DynStat.Cor(-Utils.rand(3)));
            doNext(get_camp().returnToCampUseOneHour);
            return;
         }
         if(_loc2_ == 2)
         {
            if(get_time().isDay())
            {
               outputText("你的探索把你带到了牛牧场。这里没有公牛，所以母牛都在平静地吃草，为惠特尼积攒牛奶。其中一头转过身来面对你，你有一种奇怪的感觉，它似乎想告诉你什么。[pg]");
               if(get_player().countCocksOfType(CockTypesEnum.HORSE) > 0)
               {
                  outputText("一个念头不由自主地闪过你的脑海：如果用母牛的阴门包裹住你的马根，感觉一定会很爽。");
                  if(get_player().cor > 60)
                  {
                     outputText("这让你不禁微笑。");
                  }
                  if(get_player().cor < 30)
                  {
                     outputText("这让你感到恶心。");
                  }
                  else if(get_player().cor <= 60)
                  {
                     outputText("你不太确定自己对此有什么感觉。");
                  }
                  outputText("这肯定会让惠特尼拿着干草叉把你赶走。[pg]");
                  dynStats(DynStat.Lust(10));
               }
               else if(get_player().get_inHeat())
               {
                  outputText("也许它想要一头公牛？你确实想要，想要一根又长又粗的肉棒来满足你饥渴的肉洞……[pg]");
                  dynStats(DynStat.Lust(15));
               }
               else if(get_player().biggestLactation() >= 2)
               {
                  outputText("[say:也许她想被挤奶？]你想。你当然想。[pg]");
                  dynStats(DynStat.Lust(3));
               }
               outputText("你摇了摇头，理清思绪，转身离开了牧场。牛可没有你这些烦恼。");
            }
            else
            {
               outputText("你在探索时偶然发现了一些正在睡觉的牛，它们看起来都很平静，呼吸时身体微微起伏。");
            }
            doNext(get_camp().returnToCampUseOneHour);
            return;
         }
         if(_loc2_ != 3)
         {
            outputText("你四处闲逛，在这片乡村的极乐之地找不到任何有趣的东西。");
            doNext(get_camp().returnToCampUseOneHour);
         }
      }
      
      public function debugMenu(param1:Boolean = true) : void
      {
         get_game().debugMenu.debugCompEdit(saveContent,new SaveContent(null,null,null));
      }
      
      public function cowBadEnd2() : void
      {
         clearOutput();
         outputText("一天后，你拖着沉重的步伐回到了谷仓，你的乳房胀痛难忍，急需被排空。你那装满精液的肚子和乳房一起拖在地上，而你则在回味昨晚在牛头人洞穴里的时光。第一只牛头人霸占了你的[asshole]，一次又一次地蹂躏它，同时将他那巨大的精液库倾泻进你的直肠。在那只野兽那马一般的肉棒还没完全塞进你体内时，一只稍微小一点的牛头人就出现在你面前，用他那美味的先列腺液涂满了你的嘴唇。像一头好母牛一样，你为那头公牛张大了嘴，感激地接受了他那浓稠的精液，感觉那像毒品一样的精液让你失去了思考除了性以外任何事情的能力。[pg]");
         outputText("你开心地哞哞叫着，因那些强烈的美好回忆和对今晚活动的期待而颤抖。但首先你需要把你那肿胀的乳头排空！挽具的带子就挂在你面前——你要怎么操作它们来着？你开心的哞哞声变成了困惑和压力的哞哞声，但谢天谢地，在你还没来得及惊慌失措之前，惠特尼就走进了谷仓。她低头看着你，叹了口气，让你感到很困惑。你不是一头坏母牛，对吧？[pg]");
         outputText("这个" + (get_noFur() ? "" : "拟人化的") + "乡村女孩在操作带子时轻轻地拍了拍你的头，自言自语道：[say: 别担心，女孩，我没生气。我想我应该给你一个更强烈的警告的。但现在伤害已经造成了——你剩下的脑子都被那些挤奶给弄成浆糊了。别担心，亲爱的，我的牛栏里总会有你的位置的。我只需要确保你不会再和那些动物混在一起了，不是吗？][pg]");
         outputText("你开心地连连点头，下定决心要找到能像那些公牛一样把你塞得满满当当的人或东西。惠特尼打开机器时无奈地叹了口气，看着你坚定的眼神融化成一幅呆滞的解脱画面……");
         get_game().gameOver();
      }
      
      public function cowBadEnd1() : void
      {
         outputText("你高兴地哞哞叫着，在隔间里放松时抚摸着你滴着奶水的" + get_player().allBreastsDescript() + "。你知道你本来打算做什么……呃，重要的事情之类的——除了让你的乳房被挤奶之外！嗯嗯，当你在挽具里喷射奶水时，所有关于那件事的烦恼都烟消云散了……[pg]");
         outputText("你停下来，试图动用你仅存的理智，回想你本来打算做什么。让我想想，你来这里是因为你的奶子太胀了，胀得你发疼，然后你像头好母牛一样被挂起来抽奶。又一声轻柔的哞叫从你唇间溜出。现在你发情了，正在自慰你那滴着奶水的乳房。所以下一步应该是……[pg]");
         outputText("……找个人把你操得神魂颠倒，顺便吃点东西。就这么简单！你爬出隔间，感觉你那沉重的乳房在地上拖拽着晃动。一条白色的奶油痕迹清晰地标出了你走向田野的路线，最终越过惠特尼的农场边缘，进入了群山之中。");
         doNext(cowBadEnd2);
      }
      
      public function cockPumping() : void
      {
         var _loc2_:* = null as IMap;
         var _loc5_:* = null as Player;
         var _loc6_:int = 0;
         var _loc1_:Number = get_player().cumQ() * (Utils.rand(10) + 90) / 100;
         clearOutput();
         if(!get_player().hasStatusEffect(StatusEffects.CockPumped))
         {
            outputText("当你踏入谷仓的阴影时，它高高地耸立在你面前。");
            if(get_player().cor < 50)
            {
               outputText("当你走进去时，你紧张地发抖。");
            }
            else
            {
               outputText("当你走进去时，你急切地微笑着。");
            }
            outputText("谷仓里充满了泥土、木头和油脂的泥土气息。大部分地方都很干净，虽然地板只是压实的泥土，而且隔间看起来很旧，经常使用。靠墙的一排机器发出嗡嗡声和脉动声，仿佛它是一个活物。软管和电缆从十几个地方延伸出来，消失在墙壁里。西墙边甚至有一排结实的木门。那一定是农场里有智慧的居民居住的地方。你注意到每个隔间上都有名牌，甚至有一个写着[name]。那一定是给你的。[pg]");
         }
         else
         {
            outputText("你走到谷仓，热切地期待着你与“榨乳机”的互动。");
            outputText("你的[cocks]勃起");
            if(get_player().cockTotal() == 1)
            {
               outputText("");
            }
            outputText("并跳动着");
            if(get_player().cockTotal() == 1)
            {
               outputText("");
            }
            outputText("，充满了不断积聚的欲望。就好像");
            if(get_player().cockTotal() == 1)
            {
               outputText("它");
            }
            else
            {
               outputText("它们");
            }
            outputText("知道");
            if(get_player().cockTotal() == 1)
            {
               outputText("");
            }
            outputText("接下来会发生什么。门很容易就开了，你急匆匆地冲进你的隔间。[pg]");
         }
         if(!get_player().hasStatusEffect(StatusEffects.CockPumped))
         {
            outputText("<b>门上钉着一张惠特尼留下的便条：</b>");
            outputText("[pg]<i>我把你的机器都装好了，甚至还做了一些修改，让它能跟上我给公牛用的那些机器的速度。好好享受你的“榨乳”吧，别做得太过火——有些烂摊子连我这种农场女孩也**不会**去清理的。</i>[pg]");
            outputText("隔间里松松垮垮地挂着一套挽具，用来把使用者固定在原位，直到他们被榨干每一滴“乳汁”。你慢慢呼出一口气，强迫自己走进去。当你解开那些带子时，把剩下的部分固定到位变得越来越容易。你扣上最后一条带子，机器嗡嗡作响，把它们拉紧，将你从地上吊起，面朝下悬挂着。远处墙上的一个舱门滑开，露出一大堆管子、电线和机械装置。一根");
            if(get_player().cockTotal() == 1)
            {
               outputText("管子从洞里蠕动出来，在地板上扭动着。它停下来并抬起头，慢慢地瞄准你那根发情的肉棒。[pg]");
            }
            else if(get_player().cockTotal() == 2)
            {
               outputText("对管子从洞里蠕动出来，在地板上扭动着。它们停下来并抬起头，慢慢地瞄准你那些发情的肉棒。[pg]");
            }
            else
            {
               outputText("群管子从洞里蠕动出来，在地板上扭动着。它们停下来并抬起头，慢慢地瞄准你那些发情的肉棒。[pg]");
            }
            get_player().createStatusEffect(StatusEffects.CockPumped,1,0,0,0);
         }
         else
         {
            outputText("你轻松地穿上挽具，把自己吊到合适的位置，听着机器自动启动的声音。那根饥渴的");
            if(get_player().cockTotal() == 1)
            {
               outputText("管子从墙里蠕动出来，向上弯曲着伸向你的胯部。");
            }
            else
            {
               outputText("管子从墙里蠕动出来，向上弯曲着伸向你的胯部。");
            }
            get_player().addStatusValue(StatusEffects.CockPumped,1,1);
         }
         if(get_player().cockArea(0) < 20)
         {
            if(Utils.rand(2) == 0)
            {
               if(get_player().cockTotal() == 1)
               {
                  outputText("管子的“尖端”比你的阴茎长很多倍，也大约有三倍粗。“开口”处填满了一些湿润的粉红色物质。它蠕动扭曲着，看起来非常像活物。惠特尼从哪弄来这东西的？它试探性地压在你的[cock]上，湿漉漉地吸吮着，里面的物质将你吞没。这种感觉直接而强烈，就像被成百上千条急切的舌头包围，它们在你整根肉棒上一起蠕动。[pg]");
               }
               else
               {
                  outputText("管子的“尖端”比你的阴茎长很多倍，也大约有三倍粗。开口处都填满了一些湿润的粉红色物质。它们蠕动扭曲着，看起来非常像活物。惠特尼从哪弄来这东西的？它们试探性地压在你的[cocks]上，湿漉漉地吸吮着，里面的物质将你吞没。这种感觉直接而强烈，就像被成百上千条急切的舌头包围，它们同时在你所有的肉棒上一起蠕动。[pg]");
               }
            }
            else if(get_player().cockTotal() == 1)
            {
               outputText("管子的开口虽然比你的" + get_player().cockDescript(0) + "大得多，但里面塞满了一些看起来黏糊糊的粉红色血肉。它饥渴地蠕动着向上蜿蜒，吵闹地在你的龟头上流着口水。你的身体厌倦了前戏，向前挺动，让挽具前后摇晃。但这都是徒劳的，因为管子停了下来，慢慢地在你身下重新定位，必须在开始“榨乳”之前重置。你叹了口气，在它再次撞向你时保持完全静止。你的肌肉抽搐着，但你保持稳定，任由它慢慢向前滑动，毫不费力地将你的[cock]吞入其中。刺激感强烈而直接。吸力开始发挥作用，让你肿胀得比平时更大。你感觉每一寸肌肤都被无数湿润的、按摩着的小手指和舌头覆盖着。[pg]");
            }
            else
            {
               outputText("管子的开口虽然比你的[cocks]大得多，但里面塞满了一些看起来黏糊糊的粉红色血肉。它们饥渴地蠕动着向上蜿蜒，吵闹地在你的龟头上流着口水。你的身体厌倦了前戏，向前挺动，让挽具前后摇晃。但这都是徒劳的，因为管子停了下来，慢慢地在你身下重新定位，必须在开始“榨乳”之前重置。你叹了口气，在它们再次撞向你时保持完全静止。你的肌肉抽搐着，但你保持稳定，任由它们慢慢向前滑动，毫不费力地将你的" + get_player().multiCockDescript() + "吞入其中。刺激感强烈而直接。吸力开始发挥作用，让你肿胀得比平时更大。你感觉每一寸肌肤都被无数湿润的、按摩着的小手指和舌头覆盖着。[pg]");
            }
         }
         else if(get_player().cockArea(0) < 70)
         {
            if(Utils.rand(2) == 0)
            {
               if(get_player().cockTotal() == 1)
               {
                  outputText("机械蛇的插槽张开，露出里面蠕动的粉色物质和滴落的粘液。它扭动着，瞬间拉近了与你[cock]的距离。它在你的" + get_player().cockHead() + "下方停顿了一下，然后慢慢向上滑动，用滑腻的快感吞没了你。它用力吸吮着，向上滑过");
                  if(get_player().hasKnot(0))
                  {
                     outputText("你的肉结");
                  }
                  else
                  {
                     outputText("直到你的根部");
                  }
                  outputText("并用数百个润滑的内部突起按摩着你。[pg]");
               }
               else
               {
                  outputText("机械蛇的插槽张开，露出里面蠕动的粉色物质和滴落的粘液。它们扭动着，瞬间拉近了与你[cocks]的距离。它们在你的" + get_player().cockHead() + "s下方停顿了一下，然后慢慢向上滑动，用滑腻的快感吞没了你。它们用力吸吮着，向上滑过");
                  outputText("直到你的根部");
                  outputText("并用数百个润滑的内部突起按摩着你。[pg]");
               }
            }
            else if(get_player().cockTotal() == 1)
            {
               outputText("榨精机的开口看起来很适合容纳你的" + get_player().cockDescript(0) + "，对于像你这样尺寸的人来说简直是完美的匹配。当它靠近你的腹股沟时，你更清楚地看到了内部结构。它看起来……是活的。里面充满了滑腻的肉，呈粉红色，饥渴地蠕动着。惠特尼到底在这东西里面放了什么？滴着液体的开口试探性地摩擦着你，用滑腻的液体弄湿了你的[cock]。你忍住了向前挺动的冲动，因为你知道在束缚如此紧密的情况下，这样做是徒劳的。它把你的" + get_player().cockHead() + "吸了进去，让你呻吟着膨胀起来，你的男性象征慢慢地被拉进这个机械化的操洞里。吧唧吧唧的声音在谷仓里回荡，夹杂着愉悦的呻吟声。[pg]");
            }
            else
            {
               outputText("榨精机的开口看起来很适合容纳你的" + get_player().multiCockDescriptLight() + "，对于像你这样尺寸的人来说简直是完美的匹配。当它们靠近你的腹股沟时，你更清楚地看到了内部结构。它们看起来……是活的。里面充满了滑腻的肉，呈粉红色，饥渴地蠕动着。惠特尼到底在这些东西里面放了什么？滴着液体的开口试探性地摩擦着你，用滑腻的液体弄湿了你的[cocks]。你忍住了向前挺动的冲动，因为你知道在束缚如此紧密的情况下，这样做是徒劳的。它们把你的" + get_player().cockHead() + "s吸了进去，让你呻吟着膨胀起来，你众多的男性象征慢慢地被拉进这个机械化的操洞里。吧唧吧唧的声音在谷仓里回荡，夹杂着愉悦的呻吟声。[pg]");
            }
         }
         else if(Utils.rand(2) == 0)
         {
            if(get_player().cockTotal() == 1)
            {
               outputText("软管的洞口在靠近你的胯部时张得很大，露出了有机的粉红色内部。不知为何，你怀疑它是否能容纳你那巨大的阴茎，但这个人造小穴似乎打算尝试一下。它推挤着你的" + get_player().cockDescript(0) + "的" + get_player().cockHead() + "，努力撑开以适应尺寸。滑腻的肉体在你周围蠕动的感觉淹没了你的身体，让你在安全带里瘫软下来。吸力慢慢地把你拉进去，一次一英寸，而设备柔软的“肉”用它许多蠕动的“舌头”紧紧拥抱着你的[cock]。[pg]");
            }
            else
            {
               outputText("软管的洞口在靠近你的胯部时张得很大，露出了它们有机的粉红色内部。不知为何，你怀疑它们是否能容纳你那巨大的阴茎，但这些人工小穴似乎打算尝试一下。它们推挤着你[cocks]的" + get_player().cockHead() + "s，努力撑开以适应尺寸。滑腻的肉体在你周围蠕动的感觉淹没了你的身体，让你在安全带里瘫软下来。吸力慢慢地把你拉进去，一次一英寸，而设备柔软的“肉”用它许多蠕动的“舌头”紧紧拥抱着你的" + get_player().multiCockDescript() + "。[pg]");
            }
         }
         else if(get_player().cockTotal() == 1)
         {
            outputText("榨精机的开口扩张得很大，努力撑开以适应你那庞大的尺寸。它拉近了距离，像眼镜蛇一样来回摆动。它停顿了一下，试探性地用它蠕动的内部摩擦着你的" + get_player().cockHead() + "。当它的润滑剂开始涂抹你时，你扭动着身体，但尽力保持静止，以适应这个看起来像有机物的泵送机制。它开始推挤你，几乎有些痛苦，因为你肿胀的阴茎抗拒着进入管状的洞口。伴随着一声痛苦而愉悦的叹息，你被塞进了管子里，被蠕动的触手紧紧挤压着。不断增加的吸力把管子拉得越来越深。它到底了，紧紧地压在你的胯部，用非人的肉体挤压着你的整个[cock]。[pg]");
         }
         else
         {
            outputText("榨精机的开口扩张得很大，努力撑开以适应你那庞大的尺寸。它们拉近了距离，像眼镜蛇一样来回摆动。停顿了一下，它们试探性地用蠕动的内部摩擦着你的" + get_player().multiCockDescriptLight() + "。当润滑剂开始涂抹你时，你扭动着身体，但尽力保持静止，以适应这些看起来像有机物的泵送机制。它们开始推挤你，几乎有些痛苦，因为你肿胀的阴茎抗拒着进入管状的洞口。伴随着一声痛苦而愉悦的叹息，你被塞进了管子里，被蠕动的触手紧紧挤压着。不断增加的吸力把管子拉得越来越深。它们到底了，紧紧地压在你的胯部，用非人的肉体挤压着你的整个[cocks]。[pg]");
         }
         if(Utils.rand(2) == 0)
         {
            outputText("你在束缚中扭动着，毫不掩饰地呻吟着，扭动着臀部，试图进一步增强这种感觉。你所感觉到的只有周围湿热的温暖在抚摸着你，将你推向快感的新高度。天哪，你可能会迷失在其中！你不想被释放，不想高潮，甚至不想让机器慢下来。你只想要更多！随着你的先列腺液开始滴落，变成稳定的水流，你腹股沟的灼热感变得越来越强烈。当机器将你的先列腺液吸下管子时，嘈杂的吸溜声传入你的耳朵。机器立刻后退了一点，让你保持在释放的边缘，这让你既高兴又沮丧。[pg]");
         }
         else
         {
            outputText("你带着欲望呻吟着，被推向了感觉的极限，那是一种天堂与地狱的混合体。值得庆幸的是，安全带固定住了你的身体，当你在带子里扭动时，虽然完全被束缚，但本能地试图挺进你快感的源泉。榨精设备以狂热的强度吸吮和抚摸着，让你变得比以往任何时候都更大更硬。你几乎能感觉到先列腺液从你的尿道滴落，你肯定能听到它被吸下管子的声音。你感觉到释放的欲望在积聚，但机器不知怎么地感觉到了，并后退了，让你尽可能长时间地保持在高潮的边缘。[pg]");
         }
         if(get_player().hasKeyItem("Cock Milker: Anal Attachment"))
         {
            get_player().orgasm("Anal");
            if(get_player().cockTotal() == 1)
            {
               outputText("突然，一股湿润的液体溅到了你的背部，瞬间用滑腻的润滑剂浸透了你的[skindesc]。你感觉到有什么狭窄的东西触碰到了你的[asshole]，穿过紧绷的肌肉进入你的身体。如果这种侵犯没有放大沿着你阴茎辐射下来的感觉，你可能会更在意，但随后它开始发生变化。你感觉到它在里面膨胀，不知怎么地充气了。它把你撑得很大，压迫着你前列腺的肉结，挤出了一股浓稠的精液。它推得越来越紧，让你在放气之前稳定地滴落和流淌，让你受虐的身体得以放松。你叹了口气，但由于对你阴茎的狂热榨取，你依然坚硬如铁。[pg]最终探头再次充气，挤出另一股浓稠的精液，你[cock]上的软管嘈杂地把它吸了下去。你保持这种状态很长一段时间——从未感觉到真正的高潮，但被迫在屁股里不断增加的压力波中一次又一次地排出精液。你语无伦次地胡言乱语，沉醉在快感中，甚至没有注意到墙另一边的一盏绿灯亮了。你注意到的一件事是，阴茎管并没有放慢它的动作。你终于被允许高潮了！[pg]");
            }
            else
            {
               outputText("突然，一股湿润的液体溅到了你的背部，瞬间用滑腻的润滑剂浸透了你的[skindesc]。你感觉到有什么狭窄的东西触碰到了你的[asshole]，穿过紧绷的肌肉进入你的身体。如果这种侵犯没有放大沿着你阴茎辐射下来的感觉，你可能会更在意，但随后它开始发生变化。你感觉到它在里面膨胀，不知怎么地充气了。它把你撑得很大，压迫着你前列腺的肉结，挤出了一股浓稠的精液。它推得越来越紧，让你在放气之前稳定地滴落和流淌，让你受虐的身体得以放松。你叹了口气，但由于对你阴茎的狂热榨取，你依然坚硬如铁。[pg]最终探头再次充气，挤出另一股浓稠的精液，你[cocks]上的软管嘈杂地把它吸了下去。你保持这种状态很长一段时间——从未感觉到真正的高潮，但被迫在屁股里不断增加的压力波中一次又一次地排出精液。你语无伦次地胡言乱语，沉醉在快感中，甚至没有注意到墙另一边的一盏绿灯亮了。你注意到的一件事是，阴茎管不再放慢它们的动作。你终于被允许高潮了！[pg]");
            }
         }
         else if(get_player().cockTotal() == 1)
         {
            outputText("你在大半个小时里一直处于高潮的边缘。有节奏的收缩挤压着包裹着你阴茎的肉管，让它痛苦地坚硬并滴着液体，总是在你真正高潮之前后退。你在安全带里疯狂地挣扎，因需求而发狂，几乎口吐白沫。舔舐的舌头从未停止，在每一次拉扯你阴茎的机械吸力波之间滑过你。你语无伦次地胡言乱语，沉醉在快感中，甚至没有注意到墙另一边的一盏绿灯亮了。你注意到的一件事是，阴茎管并没有放慢它的动作。你终于被允许高潮了！[pg]");
         }
         else
         {
            outputText("你在大半个小时里一直处于高潮的边缘。有节奏的收缩挤压着包裹着你阴茎的肉管，让它们痛苦地坚硬并滴着液体，总是在你真正高潮之前后退。你在安全带里疯狂地挣扎，因需求而发狂，几乎口吐白沫。舔舐的舌头从未停止，在每一次拉扯你众多男性象征的机械吸力波之间舔舐着。你语无伦次地胡言乱语，沉醉在快感中，甚至没有注意到墙另一边的一盏绿灯亮了。你注意到的一件事是，阴茎管并没有放慢它们的动作。你终于被允许高潮了！[pg]");
         }
         if(get_player().cumQ() >= 50 && get_player().get_fatigue() >= get_player().maxFatigue() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,112) > 0)
         {
            if(_loc1_ < 1000)
            {
               outputText("高潮席卷了你，让你的大脑一片空白，你的身体在带子里痉挛，喷涌出");
               if(_loc1_ > 500)
               {
                  outputText("浓稠的");
               }
               outputText("喷射出精液。蠕动的纤毛在你周围抽搐，舔舐着你充血膨胀的龟头冠状沟，倾泻出精液。你高兴地呻吟尖叫，开心地胡言乱语，看着你的精液顺着透明管子被吸进墙上的机器里。快乐很快就结束了；安全带把你降到地面并松开了你，但你那恶魔机器情人的柔软内壁并没有停止对你娇嫩的" + Appearance.cockNoun(CockTypesEnum.HUMAN));
               if(get_player().cockTotal() > 1)
               {
                  outputText("");
               }
               outputText("。[pg]");
               outputText("一声响亮的“叮”声响起");
               if(_loc1_ > 100)
               {
                  outputText("，一阵宝石掉落到盘子里的声音传来");
               }
               outputText("，机器正在测量你的贡献，但你脑海深处几乎没有注意到这一点，因为你的" + get_player().multiCockDescriptLight() + "在活体管子无休止、专业的刺激下再次变硬。你试图把挤奶器从你的[cocks]上拉下来，但是");
               if(get_player().biggestCockArea() > 70)
               {
                  outputText("末端");
                  if(get_player().cockTotal() > 1)
                  {
                     outputText("");
                  }
                  outputText("紧紧地包裹着你巨大的阴茎");
                  outputText("");
                  outputText("而且");
               }
               outputText("你太累了，无法打破吸力。每次你抓紧并开始拉扯时，吸力都会让一阵快感传遍[eachcock]，夺走你的注意力和肌肉控制力。面对这些管子你几乎无能为力，你感觉到你的[cocks]变得越来越硬，漏出更多的先列腺液。[pg]");
            }
            else
            {
               outputText("精液如火山爆发般喷涌而出，伴随着响亮的水声溅入管中。你能感觉到压力的积聚，反推着你的" + get_player().multiCockDescriptLight() + "，因为机器无法跟上在里面喷发的白色液体的涌出。快感让你斗鸡眼，你开始流口水，甚至没有注意到你即将把挤奶器从你的阴茎上炸飞。机器在努力跟上时发出嘎吱嘎吱的声音，然后因为精液溢出而弹出。你甚至没有注意到，而是专注于从你的[cocks]中喷射出粘稠液体的感觉。[pg]");
               outputText("当你排出如河水般的精液时，精液溅落在你下方的地板上。几升几升的液体从你跳动的[cocks]中溢出，覆盖在弹出的吸管外部，与内部相匹配。最终你耗尽了储备，精液的流动减少到涓涓细流。快感让你变得愚钝，你没有注意到吸管");
               if(get_player().cockTotal() > 1)
               {
                  outputText("");
               }
               outputText("蠕动着回到你的[cocks]上，同时安全带将你放下，落入你制造的水坑中。只有当恶魔机器的天鹅绒内壁恢复抚摸时，你才觉得情况有些不对劲。[pg]");
               outputText("一声响亮的“叮”声响起，一阵宝石掉落到盘子里的声音传来，机器正在测量你的贡献，但你脑海深处几乎没有注意到这一点，因为[eachcock]在活体管子无休止、专业的刺激下再次变硬");
               if(get_player().cockTotal() > 1)
               {
                  outputText("");
               }
               outputText("。你试图把挤奶器从你的[cocks]上拉下来，但是管子的外部沾满了你的精液");
               if(get_player().biggestCockArea() > 70)
               {
                  outputText("，而且末端");
                  if(get_player().cockTotal() > 1)
                  {
                     outputText("");
                  }
                  outputText("紧紧地包裹着你肿胀的阴茎");
                  if(get_player().cockTotal() > 1)
                  {
                     outputText("");
                  }
               }
               outputText("。每次你抓紧并开始拉扯时，一阵快感就会传遍" + get_player().sMultiCockDesc() + "，夺走你的注意力和肌肉控制力。面对这些管子你几乎无能为力，你感觉到[eachcock]变得越来越硬，因为机器吸出了更多的先列腺液，以及你上次巨大高潮的乳白色余波。[pg]");
            }
            doNext(milkerBadEnd1);
            return;
         }
         _loc2_ = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,112,FlagDict_Impl_.arrayReadInt(_loc2_,112) + 1);
         _loc2_ = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,333,FlagDict_Impl_.arrayReadInt(_loc2_,333) + 1);
         if(_loc1_ < 10)
         {
            if(get_player().cockTotal() == 1)
            {
               outputText("高潮席卷了你，让你的大脑一片空白，你的身体在绑带中痉挛，喷出微小的精液。蠕动的纤毛在你周围抽搐，舔舐着你的" + get_player().cockHead() + "，随着它膨胀变大，充血并滴出一点精液。你高兴地呻吟尖叫，开心地胡言乱语，看着你微不足道的精液顺着透明的管子被吸入墙上的机器里。快乐很快就结束了，你的阴茎开始在它柔软的监狱里变软。安全带慢慢松开，将你降到地面并释放了你。[pg]");
            }
            else
            {
               outputText("高潮席卷了你，让你的大脑一片空白，你的身体在绑带中痉挛，喷出微小的精液。蠕动的纤毛在你周围抽搐，舔舐着你的" + get_player().cockHead() + "，当它们膨胀时，充血并滴出一点精液。你高兴地呻吟和尖叫，看着你微不足道的精液顺着透明的管子流进墙上的机器里，开心地胡言乱语。快乐很快就结束了，你的阴茎开始在它们柔软的监狱里变软。安全带慢慢松开，把你降到地上并释放了你。[pg]");
            }
            get_player().changeFatigue(5);
         }
         else if(_loc1_ < 100)
         {
            if(get_player().cockTotal() == 1)
            {
               outputText("高潮席卷了你，让你的思绪一片空白。你的身体在绑带中抽搐，喷射出浓稠的精液。蠕动的纤毛在你周围痉挛，舔舐着你那因充血而膨胀的" + get_player().cockHead() + "，不断有精液涌出。你快乐地呻吟尖叫，看着你的精液顺着透明管子被吸入墙上的机器里，嘴里发出幸福的呓语。快乐的时光总是短暂的，你的肉棒开始在它那柔软的牢笼里疲软下来。绑带慢慢松开，将你放回地面并释放了你。[pg]");
            }
            else
            {
               outputText("高潮席卷了你，让你的思绪一片空白。你的身体在绑带中抽搐，喷射出浓稠的精液。蠕动的纤毛在你周围痉挛，舔舐着你那因充血而膨胀的" + get_player().cockHead() + "，不断有精液涌出。你快乐地呻吟尖叫，看着你的精液顺着透明管子被吸入墙上的机器里，嘴里发出幸福的呓语。快乐的时光总是短暂的，你的肉棒开始在它们那柔软的牢笼里疲软下来。绑带慢慢松开，将你放回地面并释放了你。[pg]");
            }
            get_player().changeFatigue(10);
         }
         else if(_loc1_ < 333)
         {
            if(get_player().cockTotal() == 1)
            {
               outputText("高潮如海浪般向你袭来，淹没了你仅存的意识，取而代之的是一种压倒一切的情感：释放。你无法控制地向管子里喷射，沉浸在快感之中，因为你的");
               if(get_player().balls > 0)
               {
                  outputText("肿胀的[balls]终于");
               }
               else
               {
                  outputText("敏感的[cock]终于");
               }
               outputText("释放了");
               if(get_player().balls > 0)
               {
                  outputText("它们的");
               }
               else
               {
                  outputText("它的");
               }
               outputText("积蓄已久的精液。机器发出嘈杂的吸吮声，墙上的一些管子肉眼可见地变成了纯白色，机器正努力跟上你惊人的产量。最终，一切都结束了。你喷射的精液逐渐减少，你的肉棒开始在蠕动的机器里变软。作为回应，你感觉到它从你身上滑落，缩回墙里，同时绑带轻轻地将你放回地面。[pg]");
            }
            else
            {
               outputText("高潮如海浪般向你袭来，淹没了你仅存的意识，取而代之的是一种压倒一切的情感：释放。你无法控制地向管子里喷射，沉浸在快感之中，因为你的");
               if(get_player().balls > 0)
               {
                  outputText("肿胀的[balls]终于");
               }
               else
               {
                  outputText("敏感的[cocks]终于");
               }
               outputText("释放了它们积蓄已久的精液。机器发出嘈杂的吸吮声，墙上的一些管子肉眼可见地变成了纯白色，榨乳泵的马达正努力跟上你惊人的产量。最终，一切都结束了。你喷射的精液逐渐减少，你的肉棒开始在蠕动的机器里变软。作为回应，你感觉到它从你身上滑落，缩回墙里，同时绑带轻轻地将你放回地面。[pg]");
            }
            get_player().changeFatigue(15);
         }
         else if(_loc1_ < 1000)
         {
            if(get_player().cockTotal() == 1)
            {
               outputText("你高潮的力度非常强烈，你无力地挺动着腰肢，将一股浓稠的精液射入精液收集器中，身体也随之抽搐。精液从阴茎榨乳器的边缘漏出，随着你一波又一波地将精液射入机器，收集器微微溢出。湿润的内部凸起继续刺激着你，加上几个小时的边缘控制，你的高潮持续不断，将机器装得满满当当。过了一会儿，你身体里剩余的液体被抽干，然后慢慢被放回地面，当榨乳器分离并缩回墙里时，你还在虚弱地抽搐着。[pg]");
            }
            else
            {
               outputText("你高潮的力度非常强烈，你无力地挺动着腰肢，将一股浓稠的精液射入精液收集器中，身体也随之抽搐。精液从阴茎榨乳器的边缘漏出，随着你一波又一波地将精液射入机器，收集器微微溢出。湿润的内部凸起继续刺激着你，加上几个小时的边缘控制，你的高潮持续不断，将机器装得满满当当。过了一会儿，你身体里剩余的液体被抽干，然后慢慢被放回地面，当榨乳器分离并缩回墙里时，你还在虚弱地抽搐着。[pg]");
            }
            get_player().changeFatigue(20);
         }
         else
         {
            if(get_player().cockTotal() == 1)
            {
               outputText("一股精液喷涌而出，伴随着响亮的湿润声溅入管子中。你能感觉到压力的积聚，反压在你的" + get_player().cockDescript(0) + "上，因为机器无法跟上在里面喷发的白色液体。快感让你斗鸡眼，你开始流口水，甚至没有注意到你快要把榨乳器从你的阴茎上崩飞了。机器在努力跟上时发出刺耳的摩擦声，并拉响了警报。你甚至没有注意到，而是专注于将粘稠的液体注入榨乳管的感觉，把它从你的[cock]上推开了一半。[pg]");
               outputText("急促的脚步声进入谷仓，一双有力的手抓住了你跳动的[cocks]，将榨乳器拉回你的腹股沟，增加的压力让精液溅到了密封圈周围。机器的吸力完全切断了，但你根本不在乎。你只是继续射精，仅凭高潮的力量将浓稠的白色奶油泵入管子。最终，你不可思议的高潮结束了，那双手松开了你，让管子弹开。它慢慢缩回墙里，你的绑带也降了下来，把你疲惫的身体像一滩烂泥一样扔在地上。当你恢复理智时，你神秘的帮手已经不见了。[pg]");
            }
            else
            {
               outputText("一股精液喷涌而出，伴随着响亮的湿润声溅入管子中。你能感觉到压力的积聚，反压在你的" + get_player().multiCockDescriptLight() + "上，因为机器无法跟上在里面喷发的白色液体。快感让你斗鸡眼，你开始流口水，甚至没有注意到你快要把榨乳器从你的阴茎上崩飞了。机器在努力跟上时发出刺耳的摩擦声，并拉响了警报。你甚至没有注意到，而是专注于将粘稠的液体注入榨乳管的感觉，把它们从你的[cocks]上推开了一半。[pg]");
               outputText("急促的脚步声进入谷仓，一双有力的手抓住了你跳动的[cocks]，将榨乳器拉回你的腹股沟，增加的压力让精液溅到了密封圈周围。机器的吸力完全切断了，但你根本不在乎。你只是继续射精，仅凭高潮的力量将浓稠的白色奶油泵入管子。最终，你不可思议的高潮结束了，那双手松开了你，让管子弹开。它们慢慢缩回墙里，你的绑带也降了下来，把你疲惫的身体像一滩烂泥一样扔在地上。当你恢复理智时，你神秘的帮手已经不见了。[pg]");
            }
            get_player().changeFatigue(40);
         }
         outputText("有一声");
         if(get_player().cumQ() < 20)
         {
            outputText("几乎难以察觉的");
         }
         else
         {
            outputText("浓稠的");
         }
         outputText("精液痕迹沿着软管缩回墙壁的路线拖在地上，虽然机器已经重新关闭，但现在正发出嘈杂的运转声，显然在处理什么。伴随着一声响亮的“叮”，面板上显示出");
         var _loc3_:int = 0;
         var _loc4_:int = 500;
         if(get_easyMode())
         {
            _loc4_ *= 2;
         }
         if(get_debug())
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,104,0);
            _loc4_ = 9999;
         }
         _loc1_ = int(_loc1_);
         if(_loc1_ > 100)
         {
            outputText(_loc1_ / 1000 + "升。");
         }
         else
         {
            outputText(_loc1_ + "毫升。");
         }
         if(_loc1_ > 100)
         {
            _loc3_ = 2 + int(_loc1_ / 200) * 2;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,104) >= _loc4_)
         {
            _loc3_ = 0;
            outputText("它还显示了一条警告：<b>资金耗尽。</b>");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,104) + _loc3_ >= _loc4_)
         {
            _loc3_ = _loc4_ - FlagDict_Impl_.arrayReadInt(KFLAGS.flags,104);
            outputText("它还显示了一条警告：<b>宝石不足以支付全额。宝石现已耗尽。</b>");
         }
         if(_loc3_ > 0)
         {
            if(get_player().cumQ() < 1000)
            {
               get_player().modCumMultiplier(1);
            }
            if(_loc3_ == 1)
            {
               outputText(Utils.Num2Text(_loc3_) + "颗宝石滚");
            }
            else
            {
               outputText(Utils.Num2Text(_loc3_) + "颗宝石滚");
            }
            outputText("落入收集盘中。惠特尼在这上面真是下了不少功夫！");
            _loc5_ = get_player();
            _loc5_.set_gems(_loc5_.get_gems() + _loc3_);
            _loc2_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc2_,104,FlagDict_Impl_.arrayReadInt(_loc2_,104) + _loc3_);
            statScreenRefresh();
         }
         if(get_player().countCockSocks("gilded") > 0)
         {
            _loc6_ = Utils.rand(2) + get_player().countCockSocks("gilded");
            if(get_player().cumQ() > 1000)
            {
               _loc6_ *= 1.5;
            }
            if(_loc3_ > 0)
            {
               outputText("[pg]当你拿走报酬时，<b>你");
            }
            else
            {
               outputText("[pg]<b>你");
            }
            outputText("看到地上的精液痕迹里有几颗闪闪发光的宝石。你弯下腰，将这" + _loc6_ + "颗宝石全部捡起</b>，然后你");
            _loc5_ = get_player();
            _loc5_.set_gems(_loc5_.get_gems() + _loc6_);
         }
         else
         {
            outputText("[pg]你继续");
         }
         outputText("上路了，愉快地吹着口哨，感觉想睡个午觉。");
         get_player().orgasm("Dick");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function centaurToysHoooooo() : void
      {
         spriteSelect(SpriteDb.get_s_whitney());
         clearOutput();
         outputText("你发现犬娘惠特尼站在她的谷仓入口处，正苦恼地挠着头。你走上前去，问她怎么了。[pg]");
         outputText("[say:哦，嘿，[name]，]惠特尼重重地靠在她的干草叉上说道。[say:没什么，只是在想……嘿，等等！]她说着，打量着你强壮的半人马身躯。");
         if(get_player().cor < 50)
         {
            outputText("你尴尬地动了动，问她怎么了。");
         }
         else
         {
            outputText("你昂首阔步地走了一会儿，以一种微妙的下流方式展示自己。当你完成后，你问犬娘是否喜欢她所看到的。");
         }
         outputText("[pg]");
         outputText("她尴尬地清了清嗓子。[say:呃，好吧……过去几年住在这里的一对半人马好像跑了。听起来像是去结婚什么的了。所以，嘿，想帮我解决一个小问题吗？][pg]");
         outputText("你耸耸肩。当然。[pg]");
         outputText("[say:看，他们俩留下了一些相当私人的物品，]惠特尼说着，推开了谷仓的门。里面，躺在隔间中间的，看起来像是一个高大细长的图腾，上面伸出一根巨大的橡胶马鸡巴，还有一匹假母马，站在加固的木腿上，大腿之间有一个闪闪发光的马用飞机杯。哦，天哪。[say:所以，[name]，既然你看起来体型正好适合它们……它们是你的了。][pg]");
         outputText("你告诉她没问题，然后花了几分钟把它们装到你的马背上。即使你最终没有自己使用它们，你在营地里也有足够的空间放它们，不像惠特尼。装载着半人马专用的性玩具，你回到了营地。[pg]");
         outputText("(<b>获得关键物品：假母马和半人马柱</b>)");
         get_player().createKeyItem("Fake Mare",0,0,0,0);
         get_player().createKeyItem("Centaur Pole",0,0,0,0);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function breastMilkerPurchase() : void
      {
         outputText("[pg]惠特尼收下宝石离开了，并承诺在一小时内把你的设备安装好。她回头抛下一句神秘的警告：[say: 注意你像动物一样被挤奶的时间，免得你最后变成动物。]");
         doNext(get_camp().returnToCampUseOneHour);
         get_player().createKeyItem("Breast Milker - Installed At Whitney\'s Farm",0,0,0,0);
         var _loc1_:Player = get_player();
         _loc1_.set_gems(_loc1_.get_gems() - 250);
         statScreenRefresh();
      }
      
      public function breastMilkerNoPurchase() : void
      {
         doNext(get_camp().returnToCampUseOneHour);
         outputText("[pg]惠特尼耸耸肩，你们俩聊起了其他事情，只是打发时间，享受着相对正常的聊天。");
         if(get_player().get_inte100() < 15)
         {
            dynStats(DynStat.Inte(1));
         }
         if(get_player().get_inte100() < 20)
         {
            dynStats(DynStat.Inte(1));
         }
         if(get_player().get_inte100() < 30)
         {
            dynStats(DynStat.Inte(0.5));
         }
         if(get_player().get_inte100() < 40)
         {
            dynStats(DynStat.Inte(0.5));
         }
      }
   }
}

