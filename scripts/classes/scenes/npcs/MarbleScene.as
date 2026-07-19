package classes.scenes.npcs
{
   import classes.CoC;
   import classes.Cock;
   import classes.CockTypesEnum;
   import classes.DynStat;
   import classes.ImageManager;
   import classes.ItemType;
   import classes.Monster;
   import classes.PerkLib;
   import classes.Player;
   import classes.PregnancyStore;
   import classes.StatusEffects;
   import classes.Time;
   import classes.TimeAwareInterface;
   import classes.Vagina;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.display.SpriteDb;
   import classes.globalFlags.KFLAGS;
   import classes.internals.GuiOutput;
   import classes.internals.Utils;
   import classes.items.ArmorLib;
   import classes.items.Consumable;
   import classes.items.ConsumableLib;
   import classes.parser._Parser.TagFun_Impl_;
   import classes.scenes.Camp;
   import classes.scenes.Inventory;
   import classes.scenes.combat.Combat;
   import classes.scenes.npcs.pets.Akky;
   import classes.scenes.npcs.pregnancies.PlayerMarblePregnancy;
   import coc.view.CoCButton;
   import flash.Boot;
   import haxe.IMap;
   
   public class MarbleScene extends NPCAwareContent implements TimeAwareInterface
   {
      
      public var pregnancy:PregnancyStore;
      
      public var highLibidoTryst:Boolean;
      
      public var checkedMarbleMilk:int;
      
      public function MarbleScene(param1:GuiOutput = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         checkedMarbleMilk = 0;
         highLibidoTryst = false;
         super();
         pregnancy = new PregnancyStore(2,1);
         pregnancy.addPregnancyEventSet(25,[648,528,432,288,144]);
         CoC.timeAwareClassAdd(this);
         new PlayerMarblePregnancy(param1);
      }
      
      public function withdrawalDelay() : void
      {
         if(get_player().hasStatusEffect(StatusEffects.BottledMilk))
         {
            get_player().addStatusValue(StatusEffects.BottledMilk,1,1 + Utils.rand(6));
         }
         else
         {
            get_player().createStatusEffect(StatusEffects.BottledMilk,3,0,0,0);
         }
         if(get_player().hasStatusEffect(StatusEffects.MarbleWithdrawl))
         {
            get_player().removeStatusEffect(StatusEffects.MarbleWithdrawl);
            dynStats(DynStat.Tou(5),DynStat.Inte(5));
         }
      }
      
      public function wantMarbleAddiction() : void
      {
         clearOutput();
         outputText("你微笑着告诉她，她的奶是你喝过最美味的东西。你会一直想喝，而且不在乎它是否会上瘾。她微微一笑，然后轻声说道，[say:你确定吗，亲爱的？]你急切地点点头，试图继续喝……但你发现自己做不到。你真的很想喝，但你的身体似乎不允许你这么做。");
         outputText("[pg][say:怎么了，亲爱的？]她困惑地看着你的犹豫，问道，[say:我以为你想喝我的奶？]你向她解释说你正在尝试，但就是做不到。[say:我没拦着你啊，亲爱的，喝吧。]就像打开了闸门一样，你猛地扑上前，再次开始大口吞咽她的母乳。");
         outputText("[pg]喝完后，你退了回来，抬头看着玛布尔。她想了一会儿，然后慢慢地说，[say:所以没有我的允许你就不能喝？]她低头对你微笑着，但你还是忍不住对她这种显然能控制你的力量感到有些不舒服。你决定找个借口起身离开。当你走到门口时，玛布尔叫住了你，[say:亲爱的，渴了随时回来找我哦？我很期待看到你的表现。]当你走出门时，她轻声咯咯地笑着，留下你一个人在想自己是不是犯了个大错。");
         set_marbleAffection(get_marbleAffection() + 5);
         set_knowAddiction(1);
         dynStats(DynStat.Cor(5));
         applyMarblesMilk();
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function turnOffMarbleForever() : void
      {
         clearOutput();
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,463,1);
         outputText("考虑到这位牛娘充满爱意地捧着她那沉甸甸的双乳，仿佛它们是世界上唯一的东西，你决定现在还是不要和她扯上关系。你礼貌地告诉她，惠特尼一定是弄错了——你想不出有什么能帮上忙的。[say: 噢，] 她惊讶地说……当她看到你对她肿胀的双乳的反应时，也感到有些不知所措。[say: 真奇怪，不过好吧。我想我还是躺下吧，你自己出去吧。]");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function turnDownMarbleSexRepeat() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_marble());
         outputText("她对你的拒绝感到失望，但很快又振作起来说：[say:好吧亲爱的，那下次吧。]说完，你向这位漂亮的牛娘告别，回到了你的营地。");
         dynStats(DynStat.Inte(1));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function turnDownMarbleSexFirstTime() : void
      {
         spriteSelect(SpriteDb.get_s_marble());
         clearOutput();
         outputText("当她意识到你拒绝了她时，她盯着你看了好一会儿。[say:所以你对我的感觉并不一样……对不起，我不会再问你了，]她伤心地说。[say:也许我们以后再见。]她把你送出门外。你意识到拒绝她将永久影响你们的关系。");
         set_marbleAffection(50);
         dynStats(DynStat.Inte(4));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function tooManyCows() : void
      {
         outputText("[pg]你庞大的家庭规模让她哑口无言。她无法接受你生了这么多孩子，还把他们都带到街上的荒谬事实，于是她转过身，去湿身婊酒馆喝一杯了。你的孩子们困惑地看着你，但在你离开特尔阿德雷之前，你告诉他们一切都好。");
         marbleKidsAtTelAdreEnding();
      }
      
      public function timeChangeLarge() : Boolean
      {
         if(pregnancy.get_isPregnant() && pregnancy.get_incubation() == 0 && marbleAtCamp())
         {
            marblePoopsBaybees();
            pregnancy.knockUpForce();
            return true;
         }
         if(get_knowAddiction() > 0 && get_marbleAddiction() >= 100 && !get_player().hasPerk(PerkLib.MarblesMilk) && !get_player().hasPerk(PerkLib.MarbleResistant) && get_game().time.hours == 6)
         {
            marbleSprite();
            outputText("[pg]你醒来时感觉有些东西改变了。带着一丝令人不寒而栗的清醒，你意识到你终于完全、彻底地依赖上了玛布尔的乳汁；你必须每天喝她的乳汁，否则你就会死。事已至此，已经没有任何办法可以改变了。你赶紧跑向农场；你必须喝玛布尔的乳汁，立刻，马上。[pg]");
            outputText("你在玛布尔的房间里找到了她。当你走进去时，她抬起头看着你，深深地笑了。[say: 怎么了？] 她问道，[say: 你身上有些东西感觉好美妙，好合适。] 你向她解释说，你终于完全依赖上了她的乳汁。[pg]");
            get_player().createPerk(PerkLib.MarblesMilk,0,0,0,0);
            if(get_player().hasStatusEffect(StatusEffects.MarbleWithdrawl))
            {
               get_player().removeStatusEffect(StatusEffects.MarbleWithdrawl);
               dynStats(DynStat.Tou(5),DynStat.Inte(5));
            }
            if(get_player().hasStatusEffect(StatusEffects.MarblesMilk))
            {
               get_player().removeStatusEffect(StatusEffects.MarblesMilk);
            }
            else
            {
               dynStats(DynStat.Str(5),DynStat.Tou(10));
            }
            if(get_knowAddiction() == 1)
            {
               if(get_marbleAffection() < 49)
               {
                  outputText("玛布尔抓住你，把你的头拉进她的胸口。[say:嗯，如果你这么需要我，那我想让你搬来农场和我一起住，]她在你上方开心地说。[say:这样，我就可以照顾你，你也可以帮我，我们都会很开心的。]你有点慌了；虽然你当然很乐意能随时喝到她美味的乳汁，但离开传送门无人看守意味着恶魔们又可以自由地在那里安营扎寨了！玛布尔感觉到你的挣扎，收紧了手臂，说道：[say:啊，啊，记住，亲爱的；你需要我的乳汁，而我控制着你能不能喝。我很乐意分享，但既然我这么慷慨，我觉得你至少应该让我轻松一点。我不觉得住在这里帮我干农活是个过分的要求，你觉得呢？]她的脸扭曲成一个张开嘴的笑容，眼睛闪闪发光。你在她的胸口叹了口气，她是对的，你现在对此无能为力……");
                  doNext(marbleBadEndFollowup);
                  return true;
               }
               if(get_marbleAffection() >= 50 && get_marbleAffection() < 79)
               {
                  outputText("[pg]玛布尔的脸上闪过一个大大的笑容，[say:我很高兴听到你这么说，亲爱的，]她对你说，[say:你已经渴了吗？]你急切地点点头，她脱下上衣，把你的嘴推向她的一个乳头。你喝饱后，玛布尔叹了口气，对你笑了笑。[say:我本来在想，也许你以后应该和我住在一起，但我觉得我太喜欢看你这样来拜访了。看到你来总是让我很开心，所以我们为什么不保持现状呢？]你同意了她的说法，她说[say:明天你再渴的时候我再见你。]你再次点头，回到了你的营地。[pg]");
               }
               if(get_marbleAffection() >= 80)
               {
                  outputText("[pg]玛布尔的脸上闪过一个大大的笑容，[say:我很高兴听到你这么说，亲爱的，]她对你说，[say:你已经渴了吗？]你急切地点点头，她脱下上衣，把你的嘴推向她的一个乳头。你喝饱后，你注意到玛布尔正紧紧地盯着你。[say:亲爱的，你喜欢我不仅仅是因为我的乳汁吗？]你被这个问题吓了一跳，为什么不呢？[say:我想知道你喜欢我是因为我是我，而不是因为你喜欢我的乳汁。你能用一种特别的方式向我证明吗？]她充满暗示地问你。你毫不犹豫地同意了。[pg]");
                  marbleAddictionSex(false);
                  outputText("[pg]");
                  get_player().createStatusEffect(StatusEffects.CampMarble,0,0,0,0);
                  FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1091,0);
                  if(get_game().isabellaFollowerScene.isabellaAtCamp())
                  {
                     FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,381,1);
                  }
                  get_player().createStatusEffect(StatusEffects.NoMoreMarble,0,0,0,0);
                  if(amilyFollower())
                  {
                     FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,85,2);
                  }
                  else
                  {
                     FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,85,1);
                  }
                  if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,238) == 1 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1082) == 0)
                  {
                     FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,237,1);
                  }
               }
            }
            else
            {
               if(get_marbleAffection() < 30)
               {
                  outputText("玛布尔抓住你，把你的头拉进她的胸口。[say:我很抱歉，亲爱的，我从来没想过会发生这种事，]她在你上方抽泣着。[say:我会弥补的，我会确保再也没有什么能伤害你，即使我必须让你留在这里陪我。]你脑海中警铃大作；这样你还怎么完成你的任务？玛布尔感觉到你的挣扎，再次开口。[say:对不起，[name]，但如果你需要我的乳汁，这真的是最好的方法……对我们俩都是。]");
                  doNext(marbleBadEndFollowup);
                  return true;
               }
               if(get_marbleAffection() < 80)
               {
                  outputText("听到你的话，玛布尔的脸沉了下来。[say:我很抱歉；都怪我无法拒绝你。]你摇摇头，告诉她这不是你们任何一个人能阻止的。不管你之前说了什么，发生的事已经发生了。不管怎样，你们俩都必须找到继续下去的方法。她点点头，伸出双臂。你高兴地走上前，接受了她的乳汁。你喝完后，玛布尔看着你说：[say:我想明天你再渴的时候我再见你。]你点点头，回到了你的营地。[pg]");
               }
               else
               {
                  outputText("听到你的话，玛布尔的脸沉了下来。[say:我很抱歉；都怪我无法拒绝你。]你摇摇头，告诉她这不是你们任何一个人能阻止的。不管你之前说了什么，发生的事已经发生了。你太在乎她了，不能让她为此感到难过，你告诉她，你原谅了她在让你对她的乳汁上瘾这件事上所扮演的角色。她突然哭了起来，紧紧地把你抱在胸前，然后让你喝早晨的乳汁。之后她专注地看着你。[say:我们能做点特别的事吗？]她充满暗示地问你。你毫不犹豫地同意了。[pg]");
                  marbleAddictionSex(false);
                  outputText("[pg]");
                  setMarbleMovedToCamp();
               }
            }
            outputText("[pg](你获得了<b>玛布尔的乳汁</b>特质。它提升了你的力量和体质，但要求你每天都喝玛布尔的乳汁。)[pg]");
            doNext(playerMenu);
            return true;
         }
         if(get_player().hasStatusEffect(StatusEffects.Marble) && get_time().hours == 6)
         {
            set_marbleAddiction(get_marbleAddiction() - 1);
         }
         if(get_knowAddiction() > 0 && get_marbleAddiction() < 25 && !get_player().hasPerk(PerkLib.MarblesMilk) && !get_player().hasPerk(PerkLib.MarbleResistant) && get_game().time.hours == 6)
         {
            marbleSprite();
            outputText("[pg]你醒来时感到一种奇怪的轻松，睡得比很长一段时间以来都要好。过了一会儿，你意识到你不再需要喝玛布尔的乳汁了！你摆脱了你的瘾。你赶紧跑去农场把这个消息告诉她。[pg]");
            outputText("你在玛布尔的房间里找到了她。你进去时，她抬起头看着你，吓了一跳。[say:怎么了？]她问，[say:你身上有些东西和以前完全不一样了……]你向她解释说，你已经克服了你的瘾，不再渴望她的乳汁了。[pg]");
            dynStats(DynStat.Cor(-5));
            get_player().createPerk(PerkLib.MarbleResistant,0,0,0,0);
            if(get_knowAddiction() == 1)
            {
               if(get_marbleAffection() < 30)
               {
                  outputText("[pg]玛布尔听到你的话，看起来很惊恐，大声说道：[say:你告诉过我你会一直想要我的乳汁！你怎么能这样对我？]你试图向她解释，但她根本听不进去。[say:够了，我要走了，别来找我。]她气冲冲地摔门而出。既然没有理由再留在这里，你也离开了。[pg]");
                  get_player().createStatusEffect(StatusEffects.NoMoreMarble,0,0,0,0);
               }
               if(get_marbleAffection() >= 30 && get_marbleAffection() < 90)
               {
                  outputText("[pg]玛布尔听到你的话，看起来很惊恐，大声说道：[say:你告诉过我你会一直想要我的乳汁！你怎么能这样对我？]你试图向她解释，告诉她你的任务有多重要，大家都在指望着你。随着你的诉说，她的表情慢慢柔和下来，最终平静了下来。[say:好吧，]她说，[say:我想我不该这么担心我的乳汁。也许大家不喝它才是最好的。]你同意了她的说法，她对你笑了笑。[say:我想现在一切都恢复正常了。]你们俩都笑了起来。[pg]");
               }
               if(get_marbleAffection() >= 90)
               {
                  outputText("[pg]玛布尔听到你的话，看起来很惊恐，大声说道：[say:你告诉过我你会一直想要我的乳汁！你怎么能这样对我？]你试图向她解释，告诉她你的任务有多重要，大家都在指望着你。随着你的诉说，她的表情慢慢柔和下来，最终平静了下来。[say:好吧，]她说，[say:我想我不该这么担心我的乳汁。也许大家不喝它才是最好的。]你同意了她的说法，她笑了笑，突然低下头。[say:如果没有像你这样的人，我想事情不会变成这样。我……]她犹豫了一下，[say:从现在起我要和你一起留在营地！][pg]");
                  outputText("[b:(玛布尔已被添加到恋人菜单中！)]");
                  get_player().createStatusEffect(StatusEffects.CampMarble,0,0,0,0);
                  FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1091,0);
                  if(get_game().isabellaFollowerScene.isabellaAtCamp())
                  {
                     FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,381,1);
                  }
                  if(amilyFollower())
                  {
                     FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,85,2);
                  }
                  else
                  {
                     FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,85,1);
                  }
                  if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,238) == 1 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1082) == 0)
                  {
                     FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,237,1);
                  }
                  get_player().createStatusEffect(StatusEffects.NoMoreMarble,0,0,0,0);
               }
            }
            else
            {
               if(get_marbleAffection() < 30)
               {
                  outputText("[pg]听到你不再上瘾的消息，玛布尔似乎无动于衷。她的眼神变得冰冷，昔日的激情荡然无存。[say:很好，]她简单地陈述道，并指着她房间桌子上的一张纸。[say:那是给你的。再见。]说完，她转身走出了房间。因为你不确定该作何反应，你决定看看那张纸。[pg]");
                  outputText("那张纸看起来像是从书上撕下来的一页。它看起来像是一本百科全书之类的条目，上面用正式的字体写着：[pg]");
                  get_camp().codex.codexEntryLaBovines();
                  outputText("[pg]在条目下方有一行字，字迹粗糙且颤抖：<i>再也不会有人喝我的乳汁了。对不起，亲爱的。</i>");
                  unlockCodexEntry(2045);
                  get_player().createStatusEffect(StatusEffects.NoMoreMarble,0,0,0,0);
               }
               if(get_marbleAffection() >= 30 && get_marbleAffection() < 70)
               {
                  outputText("[pg]玛布尔看起来松了一口气，就像卸下了肩上的重担。[say:我很高兴你不再需要我了，]她说，脸沉了下来，[say:现在，如果我消失了，也没人会介意。]你惊讶地看着她，问她为什么这么说。她解释说，确保再也没有人喝她的乳汁的唯一方法就是她永远消失。你告诉她不要这么想，农场里的人仍然很感激她帮忙做家务和尽责，并坚持说他们都会为她的离去感到难过。此外，既然你们俩都知道她的乳汁会让人上瘾，那么与第一次发生的事情相比，你们俩就有很大的优势。[say:而且，我们挺过来了，不是吗？]你微笑着说。听到这话，她的脸亮了起来，[say:你说得对！谢谢你做我这么好的朋友，亲爱的。]她也对你笑了笑。[say:我想现在一切都恢复正常了。]你们俩都笑了起来。[pg]");
               }
               if(get_marbleAffection() >= 70)
               {
                  outputText("[pg]玛布尔看起来松了一口气，仿佛卸下了肩上的重担。[say: 既然你不再需要我了，我很高兴，] 她说着，脸色沉了下来，[say: 现在，如果我消失了，也不会有人介意。] 你惊讶地看着她，迅速抓住她的手臂。你毫不含糊地告诉她，如果她消失了，你会永远想念她。你不在乎她的奶水，那不重要；对你来说，重要的是她这个人。如果你不在乎她，你就不会做那些事，也不会花那么多时间在一起。她突然大哭起来，紧紧地把你抱在她的胸前。[pg]");
                  marbleAddictionSex(false);
                  outputText("[pg]");
                  get_player().createStatusEffect(StatusEffects.CampMarble,0,0,0,0);
                  FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1091,0);
                  if(get_game().isabellaFollowerScene.isabellaAtCamp())
                  {
                     FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,381,1);
                  }
                  if(amilyFollower())
                  {
                     FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,85,2);
                  }
                  else
                  {
                     FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,85,1);
                  }
                  if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,238) == 1 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1082) == 0)
                  {
                     FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,237,1);
                  }
                  get_player().createStatusEffect(StatusEffects.NoMoreMarble,0,0,0,0);
               }
            }
            outputText("[pg]<b>你获得了特质：玛布尔抗性</b> (你知道如何避免她乳汁的成瘾性！)[pg]");
            doNext(playerMenu);
            return true;
         }
         if(!get_addictionEnabled() && false)
         {
            setMarbleMovedToCamp();
         }
         §§push(false);
         §§push(false);
         var _loc1_:int;
         checkedMarbleMilk = (_loc1_ = checkedMarbleMilk) + 1;
         if(_loc1_ == 0)
         {
            §§pop();
            §§push(get_game().time.hours == 6);
         }
         if(§§pop())
         {
            §§pop();
            §§push(get_player().hasPerk(PerkLib.MarblesMilk));
         }
         if(§§pop())
         {
            if(marbleAtCamp())
            {
               postAddictionCampMornings(false);
            }
            else if(!get_player().hasStatusEffect(StatusEffects.NoMoreMarble))
            {
               postAddictionFarmMornings();
               var _temp_2:* = get_game();
               _temp_2.timeQ = _temp_2.timeQ + 1;
            }
            doNext(playerMenu);
            return true;
         }
         return false;
      }
      
      public function timeChange() : Boolean
      {
         var _loc2_:int = 0;
         var _loc3_:* = null as IMap;
         var _loc1_:Boolean = false;
         checkedMarbleMilk = 0;
         pregnancy.pregnancyAdvance();
         if(marbleFollower())
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1058) > 0)
            {
               _loc2_ = 1058;
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,_loc2_,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,_loc2_) - 1);
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1058) <= 1)
               {
                  FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1058,1);
               }
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1059) == 0)
            {
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1064) < 200)
               {
                  _loc3_ = KFLAGS.flags;
                  FlagDict_Impl_.arrayWriteInt(_loc3_,1064,FlagDict_Impl_.arrayReadInt(_loc3_,1064) + 1);
               }
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1061) > 0)
            {
               _loc2_ = 1061;
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,_loc2_,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,_loc2_) - 1);
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1061) <= 1)
               {
                  FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1061,1);
               }
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1059) >= 5)
            {
               _loc3_ = KFLAGS.flags;
               FlagDict_Impl_.arrayWriteInt(_loc3_,1055,FlagDict_Impl_.arrayReadInt(_loc3_,1055) + 1);
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1055) > 1000)
               {
                  FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1055,1000);
               }
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1062) == 1 && get_player().isPureEnough(50))
            {
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1062,0);
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1055) < 100)
            {
               _loc3_ = KFLAGS.flags;
               FlagDict_Impl_.arrayWriteInt(_loc3_,1055,FlagDict_Impl_.arrayReadInt(_loc3_,1055) + 1);
            }
            if(FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,3) < -100)
            {
               FlagDict_Impl_.arrayWriteFloat(KFLAGS.flags,3,-100);
            }
            if(Utils.rand(2) == 0)
            {
               _loc3_ = KFLAGS.flags;
               FlagDict_Impl_.arrayWriteFloat(_loc3_,3,FlagDict_Impl_.arrayReadFloat(_loc3_,3) + 1);
            }
            if(get_player().statusEffectv4(StatusEffects.Marble) > 50)
            {
               _loc3_ = KFLAGS.flags;
               FlagDict_Impl_.arrayWriteFloat(_loc3_,3,FlagDict_Impl_.arrayReadFloat(_loc3_,3) + 0.3);
            }
            if(get_player().statusEffectv4(StatusEffects.Marble) > 70)
            {
               _loc3_ = KFLAGS.flags;
               FlagDict_Impl_.arrayWriteFloat(_loc3_,3,FlagDict_Impl_.arrayReadFloat(_loc3_,3) + 0.3);
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,9) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,9) < 100 && get_marbleScene().marbleAtCamp())
            {
               _loc3_ = KFLAGS.flags;
               FlagDict_Impl_.arrayWriteInt(_loc3_,9,FlagDict_Impl_.arrayReadInt(_loc3_,9) + 1);
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,9) >= 100)
               {
                  marbleSprite();
                  outputText("[pg]<b>玛布尔告诉你，她已经为你即将出生的后代建好了一个相当安全的育婴室。</b>[pg]");
                  _loc1_ = true;
                  FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,9,100);
               }
            }
            else if(!get_player().hasStatusEffect(StatusEffects.MarbleHasItem) && get_marbleScene().marbleAtCamp())
            {
               if(!get_player().hasStatusEffect(StatusEffects.MarbleItemCooldown))
               {
                  if(Utils.rand(10) == 0)
                  {
                     marbleSprite();
                     outputText("[pg]<b>你回到营地时发现了一张玛布尔留下的便条，告诉你她有东西要给你！</b>[pg]");
                     get_player().createStatusEffect(StatusEffects.MarbleItemCooldown,24 + Utils.rand(24),0,0,0);
                     get_player().createStatusEffect(StatusEffects.MarbleHasItem,Utils.rand(10),0,0,0);
                     _loc1_ = true;
                  }
               }
            }
         }
         if(get_player().hasStatusEffect(StatusEffects.MarbleItemCooldown))
         {
            get_player().addStatusValue(StatusEffects.MarbleItemCooldown,1,-1);
            if(get_player().statusEffectv1(StatusEffects.MarbleItemCooldown) < 1)
            {
               get_player().removeStatusEffect(StatusEffects.MarbleItemCooldown);
            }
         }
         if(!get_player().hasStatusEffect(StatusEffects.Infested))
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,64,0);
         }
         if(get_player().hasStatusEffect(StatusEffects.MarblesMilk) && !get_player().hasPerk(PerkLib.MarblesMilk))
         {
            get_player().addStatusValue(StatusEffects.MarblesMilk,1,-1);
            if(get_player().statusEffectv1(StatusEffects.MarblesMilk) <= 0)
            {
               _loc1_ = true;
               dynStats(DynStat.Str(-1 * get_player().statusEffectv2(StatusEffects.MarblesMilk)),DynStat.Tou(-1 * get_player().statusEffectv3(StatusEffects.MarblesMilk)));
               get_player().removeStatusEffect(StatusEffects.MarblesMilk);
               if(get_marbleAddiction() <= 10)
               {
                  outputText("[pg]你感觉到饮用玛布尔的乳汁带来的快感正在消退。直到现在它消失了，你才注意到它实际上让你变得更强壮了。[pg]");
               }
               else if(get_marbleAddiction() <= 30)
               {
                  outputText("[pg]随着玛布尔乳汁带来的快感消退，你感到一丝失落。你有点想喝更多，但这种渴望并不强烈。[pg]");
               }
               else if(get_marbleAddiction() <= 50)
               {
                  outputText("[pg]随着玛布尔乳汁带来的快感消退，你微微发抖。你真的很想再次吸吮她的乳房。[pg]");
               }
               if(get_knowAddiction() > 0)
               {
                  if(get_player().hasStatusEffect(StatusEffects.BottledMilk))
                  {
                     outputText("[pg]随着玛布尔新鲜乳汁的效果消退，你的双手开始微微颤抖。多亏了你喝下的瓶装奶，你才没有立刻出现戒断反应。[pg]");
                  }
                  else
                  {
                     if(get_marbleAddiction() <= 90)
                     {
                        outputText("[pg]当你失去了唯一能真正缓解渴望的东西时，你的双手开始颤抖。你拼命地想再去见玛布尔，尤其是如果这意味着有机会喝到她美妙的乳汁的话。[pg]");
                     }
                     else
                     {
                        outputText("[pg]玛布尔乳汁带来的快感已经消退，你需要更多的乳汁。你几乎无法控制自己不直接跑回她身边，乞求她让你再次吸吮她的乳房。[pg]");
                     }
                     get_player().createStatusEffect(StatusEffects.MarbleWithdrawl,0,0,0,0);
                     dynStats(DynStat.Tou(-5),DynStat.Inte(-5));
                  }
               }
            }
         }
         if(get_knowAddiction() > 0 && !get_player().hasPerk(PerkLib.MarbleResistant) && !get_player().hasPerk(PerkLib.MarblesMilk) && get_marbleAddiction() > 25 && get_addictionEnabled())
         {
            if(!get_player().hasStatusEffect(StatusEffects.MarblesMilk) && !get_player().hasStatusEffect(StatusEffects.BottledMilk))
            {
               if(!get_player().hasStatusEffect(StatusEffects.MarbleWithdrawl))
               {
                  outputText("[pg]你被想要更多玛布尔乳汁的渴望淹没了。[pg]");
                  _loc1_ = true;
                  get_player().createStatusEffect(StatusEffects.MarbleWithdrawl,0,0,0,0);
                  dynStats(DynStat.Tou(-5),DynStat.Inte(-5));
               }
            }
         }
         if(get_knowAddiction() <= 0)
         {
            if(get_marbleAddiction() > 60)
            {
               set_marbleAddiction(60);
            }
         }
         if(get_player().hasStatusEffect(StatusEffects.MarbleWithdrawl))
         {
            if(get_marbleAddiction() <= 25)
            {
               get_player().removeStatusEffect(StatusEffects.MarbleWithdrawl);
               dynStats(DynStat.Tou(5),DynStat.Inte(5));
               outputText("[pg]你不再感到戒断症状。[pg]");
               _loc1_ = true;
            }
            else if(get_player().hasStatusEffect(StatusEffects.BottledMilk))
            {
               outputText("[pg]你不再感到戒断症状。[pg]");
               _loc1_ = true;
               get_player().removeStatusEffect(StatusEffects.MarbleWithdrawl);
               dynStats(DynStat.Tou(5),DynStat.Inte(5));
            }
         }
         if(get_player().hasStatusEffect(StatusEffects.BottledMilk))
         {
            get_player().addStatusValue(StatusEffects.BottledMilk,1,-1);
            if(get_player().statusEffectv1(StatusEffects.BottledMilk) <= 0)
            {
               get_player().removeStatusEffect(StatusEffects.BottledMilk);
            }
         }
         if(get_game().time.hours > 23)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,460,0);
         }
         return _loc1_;
      }
      
      public function talkWithMarbleAtCamp() : void
      {
         clearOutput();
         if(!get_player().hasStatusEffect(StatusEffects.MarbleSpecials))
         {
            get_player().createStatusEffect(StatusEffects.MarbleSpecials,0,0,0,0);
         }
         doNext(playerMenu);
         outputText("你把玛布尔叫过来，你们俩坐在几块石头上聊天。稍微想了想，你整理了一下在这片陌生土地上发生的一切，试图给你的牛娘朋友讲个新故事。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2015) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,461) < 1)
         {
            outputText("你告诉玛布尔你拜访了女神玛莱。玛布尔对这个故事很感兴趣，仔细聆听你的每一句话。[say:没想到这个世界上还有纯洁的女神……]她听完后惊叹道，[say:但发生在她身上的事太可悲了。如果可以的话，我们一定要帮帮她。]");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,461,1);
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2020) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,461) < 2)
         {
            outputText("你告诉玛布尔你发现了一个恶魔工厂，并讲述了你所知道的一切。[say:在里面要小心，]玛布尔对你说，[say:我敢肯定，如果你没有准备好，那个地方会把你吞噬的。]");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,461,2);
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2024) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,461) < 3)
         {
            outputText("你告诉玛布尔你在工厂里发现了什么。她对其他勇者所遭受的折磨感到恐惧，并向你保证，没有人应该<i>属于</i>那样的地方。你继续讲述了监工和她的命运。玛布尔惊讶地回应，");
            if(get_player().hasPerk(PerkLib.OmnibusGift))
            {
               outputText("并希望你已经吸取了接受恶魔<i>礼物</i>的教训。");
            }
            else
            {
               outputText("但她得出结论，你所做的可能是最好的选择。至少你没有中她的诡计。");
            }
            outputText("最后，你告诉她你是如何关闭工厂的，以及那些被俘虏的勇者发生了什么。玛布尔对有些人留下来感到震惊，但她说，如果他们已经上瘾了，你们俩也帮不了他们什么。[say:你现在可能只能随他们去了。]");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,461,3);
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2018) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2024) == 1 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,461) < 4)
         {
            outputText("听到你帮助了玛莱，玛布尔非常高兴。随着工厂被解决，玛莱的腐化也被推迟了一段时间，你们俩今晚大概都能睡个好觉了。");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,461,4);
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2018) >= 1 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2024) == 2 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,461) < 4)
         {
            outputText("你关于玛莱遭遇的故事似乎让玛布尔有些动摇。不过，你注意到，随着你的讲述，她似乎变得越来越兴奋了。");
            if(get_player().hasPerk(PerkLib.MaraesGiftFertility))
            {
               outputText("你继续告诉她你试图获取玛莱的莱希石的结果。玛布尔不敢相信你竟然尝试了那个，但当她听到接下来发生的事情时，她瞪大了眼睛，竟然开始在你面前自慰起来。然而，在你的故事结束时，玛布尔看起来与其说是兴奋，不如说是担忧。她希望你不会因为怀孕而遇到太多麻烦。这似乎也破坏了她的兴致。");
            }
            else if(get_player().hasPerk(PerkLib.MaraesGiftStud))
            {
               outputText("你继续告诉她你试图获取玛莱的莱希石的结果。玛布尔不敢相信你竟然尝试了那个，但当她听到接下来发生的事情时，她瞪大了眼睛，竟然开始在你面前自慰起来。在你的故事结束时，玛布尔有些紧张地看着你，问道：[say:所以亲爱的，那意味着你要和我配种吗？]嗯，这也许不是个坏主意。");
            }
            if(get_player().get_lust100() < 50)
            {
               dynStats(DynStat.Lust(35));
            }
            if(!get_player().hasPerk(PerkLib.MaraesGiftFertility) && !get_player().hasPerk(PerkLib.MaraesGiftStud))
            {
               outputText("你以讲述你是如何逃跑的来结束你的故事。她不太确定该如何回应你的决定，但玛布尔确实感谢你没有抛下她去加入玛莱。");
            }
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,461,4);
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,113) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,461) < 5)
         {
            outputText("你向玛布尔讲述了你在森林深处发现的洞穴。出于某种原因，这似乎让玛布尔感到不安，但当你问她怎么了时，她声称这只是一种感觉，并告诉你不要担心。也许你应该在回去之前确保自己已经准备好了？");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,461,5);
         }
         else if(get_game().telAdre.isAllowedInto() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,462) == 0)
         {
            outputText("这次你有一个相当精彩的故事要讲给玛布尔听：世界上最后一座自由之城，特尔阿德雷。她对这座城市里许多建筑和居民的故事非常着迷，他们多亏了高塔里的法师才得以躲避恶魔。但当你告诉她这座城市大部分地方有多么空旷时，她显得有些伤心，并且对你在入口处遇到的守卫感到莫名困惑。最后，她似乎决定自己去看看，尽管她没有公开这么说。");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,462,1);
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,114) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,461) < 6)
         {
            outputText("你告诉玛布尔你在森林洞穴里遇到了一个老对手。她起初很紧张，但看到你安然无恙地逃了出来，她就放松了。玛布尔承认，不知为何，她觉得你处于极大的危险之中，但却不明白为什么会有这种感觉。[say: 不管怎样，我很高兴你成功解决了你的老对头……那张地图听起来也很有意思。你觉得它真的通向恶魔领主的巢穴吗？亲爱的，一想到你可能真的会打败恶魔领主，我就觉得有点不可思议！我心里有一部分想求你别去，但我知道你有多么执着，我不会阻止你去完成你的使命。只要答应我，在跟着那张地图走之前，你一定要确保自己已经完全准备好了，好吗？]");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,461,6);
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1239) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,461) < 7)
         {
            outputText("你告诉玛布尔你找到了莉希丝可能居住的据点。她一脸担忧地看着你。玛布尔承认，不知为何，她觉得你处于极大的危险之中，但却不明白为什么会有这种感觉。[say: 小心点，亲爱的。那里看起来可能非常危险。谁知道如果你遇害了会发生什么？所有的希望都会破灭的。]");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,461,7);
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1272) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,461) < 8)
         {
            outputText("你告诉玛布尔你是如何战斗并击败恶魔女王莉希丝的。她看着你，微笑着。[say: 你做得很好，亲爱的。你成功阻止了腐化。]");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,461,8);
         }
         else
         {
            outputText("你没有新的故事可以和玛布尔分享，所以你们聊了一会儿无关紧要的事情。");
         }
         outputText("[pg]");
         outputText("话题转到了你的任务上，你问玛布尔她认为你接下来应该做什么。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2015) <= 0)
         {
            outputText("[say: 嗯，亲爱的，我想你应该先从更好地了解这个地方开始。你为什么不去农场外面的湖边多看看呢？我觉得那是开始探索最安全的地方。]");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2015) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2020) <= 0)
         {
            if(get_player().level < 3)
            {
               outputText("[say: 我觉得我们应该帮助玛莱，关闭她提到的那个在山里的工厂，但我认为你现在还没准备好进山。那里可能非常残酷——多练习一下，并确保你有一把好武器。]");
            }
            else
            {
               outputText("[say: 我觉得我们应该帮助玛莱，关闭她提到的那个在山里的工厂。不过我不知道里面会发生什么，所以在你去之前，一定要尽可能做好准备。][pg]");
            }
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2020) >= 1 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2024) <= 0)
         {
            outputText("[say: 你还没关闭那个工厂，对吧？] 你摇了摇头。[say: 那就快去吧！]");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2024) >= 1 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2018) <= 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2016) <= 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2002) <= 0)
         {
            outputText("[say: 你还没回去找玛莱，对吧？] 你摇了摇头。[say: 那就去见她吧！我相信她一定很想感谢你。]");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,113) == 0 || !get_game().telAdre.isAllowedInto())
         {
            outputText("[say: 嗯，亲爱的，也许你应该多探索一下这个世界？根据我从路过农场的半人马那里听到的消息，我相信你能在森林深处，或者沙漠里找到一些有趣的东西，] 她建议道。");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,113) == 0 && get_game().telAdre.isAllowedInto())
         {
            outputText("[say: 我在想，森林深处可能还隐藏着你不知道的秘密，亲爱的……我去过那里几次，我注意到有大量的小恶魔在搬运物资。你觉得这其中会有什么蹊跷吗？] 她问道。");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,113) > 0 && !get_game().telAdre.isAllowedInto())
         {
            outputText("[say: 嗯……我以前在营地周围见过巡逻队。他们都穿着同样的制服，所以也许外面有某种城市或武装力量？回想起来，有一次我发现他们离开时站的地方有一些沙子——我敢打赌他们躲在沙漠的某个地方！] 她确信地说。");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,113) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,114) == 0)
         {
            outputText("[say: 嗯，你还没探索完森林里的那个洞穴，对吧？你为什么不去那里看看呢？] 她提议道。她似乎仍然对某件事感到有些不安，但没有说出来。");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,114) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1239) == 0)
         {
            outputText("[say: 嗯，你试过探索高山吗？地图看起来可能通向那里，但要小心，那里可能会有危险的东西，] 她恳求道。");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1239) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1272) == 0)
         {
            outputText("[say: 嗯，亲爱的，就是这样了。你的任务是阻止恶魔，莉希丝是她们的首领。一旦你准备好了，你需要去她们的高山巢穴，把她们打倒。在面对莉希丝之前，一定要确保你已经完成了所有你想做的事情，你不会有第二次机会的。]");
         }
         else
         {
            outputText("[say: 亲爱的，你已经完成了游戏的主线剧情！] 她对你眨了眨眼说道。[say: 为什么不去探索一下呢？这里有很多不属于主线剧情的内容。你也可以尝试改变你的形态，看看这会如何改变每次遭遇。只要别被抓住或者失去理智就行，好吗，亲爱的？]");
         }
         doNext(interactWithMarbleAtCamp);
      }
      
      public function suckleMarble() : void
      {
         clearOutput();
         outputText("你建议你可以温柔地吸吮她的乳房，让她感觉好点。[say: 听起来太棒了！]她高兴地惊呼，把手放在她丰满的乳房下。[say: 没有什么比给活物喂奶更让我喜欢的了。]");
         if(get_player().get_tallness() < 60)
         {
            outputText("意识到你可能够不到她的乳房，你从桌子旁拉了一把椅子过来。");
         }
         outputText("你走到她身边，俯身含住她的乳头吮吸起来。很快，一股温热甘美的液体便充盈了你的口腔，你迫不及待地大口吞咽下去。喝着喝着，你能听到玛布尔在你上方轻轻叹息。[say: 谢谢你，小甜心。你能也含一含另一边吗？] 几分钟后她说道。你急切地照做了，和刚才一样，那液体再度填满了你的嘴。她的乳汁绝对是你喝过最美味的东西，不仅如此，从她乳房里直接啜饮的感觉就是莫名地对味。你又听到玛布尔叹了口气，但这次叹息化作了一声呻吟。等你终于喝够了，才慢慢往后撤开。这一顿喝得你心满意足，而你看得出玛布尔也相当餍足。她朝你微微一笑，说道[say: 真是太美了。你随时都可以过来。] 说完，你们俩便各自道别。当你从谷仓走远时，一股奇异的愉悦感涌上心头。");
         get_player().refillHunger(30);
         set_marbleAffection(get_marbleAffection() + 15);
         set_marbleAddiction(get_marbleAddiction() + 10);
         applyMarblesMilk();
         dynStats(DynStat.Lust(25));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function stayForFights() : void
      {
         clearOutput();
         outputText("你双臂交叉抱在胸前，皱着眉头看着玛布尔扛着一把巨大的锤子从田野里步履蹒跚地走回来。你心里有一部分觉得用暴力解决争端实在太幼稚了——但另一部分却在为有机会教训一下这头专横的母牛而欢呼。");
         startCombat(new Marble(),true);
      }
      
      public function standardSex(param1:Boolean = true) : void
      {
         var genders1:int;
         var _g1:MarbleScene;
         var genders:int;
         var _g:MarbleScene;
         spriteSelect(SpriteDb.get_s_marble());
         if(param1)
         {
            clearOutput();
         }
         if(get_player().get_gender() == 0)
         {
            marbleGenderlessNoFuck();
            doNext(get_camp().returnToCampUseOneHour);
            return;
         }
         if(get_player().get_gender() > 0)
         {
            outputText("玛布尔对你笑了笑，把你领到她的床边。她让你坐在床尾，自己则挪到床头。坐下后，她开始慢慢脱去衣服：首先她脱掉上衣，让你饱览她的双乳，她揉捏抚摸着它们，然后一只手顺势滑到裙子上，将其褪下。她把尾巴拉到双乳之间，对你露出娇羞的微笑，同时解开了上面的丝带。现在她已经一丝不挂了。[say:现在轮到你了，]她微笑着对你说。[pg]");
            if(get_player().get_armorName() == "bondage patient clothes" || get_player().get_armorName() == "crotch-revealing clothes" || get_player().get_armorName() == "cute servant\'s clothes" || get_player().get_armorName() == "maid\'s clothes" || get_player().get_armorName() == "servant\'s clothes")
            {
               outputText("你对她坏笑了一下，向她展示穿着这身衣服要碰到你的下体有多么容易。但你决定不让她失望，故意装模作样地脱下你的[armor]，假装有些羞涩地展示出你的");
               if(get_player().totalCocks() > 0)
               {
                  outputText(get_player().multiCockDescriptLight());
                  if(int(get_player().vaginas.length) > 0)
                  {
                     outputText("和你的");
                  }
               }
               if(int(get_player().vaginas.length) > 0)
               {
                  outputText(get_player().vaginaDescript(0));
               }
               outputText("。你也确保身上没有任何多余的衣物，就像她刚才为你做的那样。[pg]");
            }
            else
            {
               outputText("你回以微笑，开始脱下身上的[armor]。你先慢慢褪去上衣，露出你的" + get_player().allBreastsDescript() + "，");
               if(get_player().biggestTitSize() >= 2)
               {
                  outputText("用一只手顺着它们抚摸而下，然后继续动作。");
               }
               else
               {
                  outputText("用一只手在上面抚摸了一番，然后继续动作。");
               }
               outputText("你解开下半身的衣服，露出你的");
               if(get_player().totalCocks() > 0)
               {
                  outputText(get_player().multiCockDescriptLight());
                  if(int(get_player().vaginas.length) > 0)
                  {
                     outputText("和你的");
                  }
               }
               if(int(get_player().vaginas.length) > 0)
               {
                  outputText(get_player().vaginaDescript(0));
               }
               outputText("。然后你脱下其他衣物，让身体赤裸。[pg]");
            }
            if(get_player().get_gender() == 3)
            {
               outputText("当你展示你的装备时，玛布尔睁大了眼睛。[say:你两样都有？]她敬畏地说。[say:我不确定我能不能同时满足你的两部分……你想用哪个？]");
               outputText("[pg]你想用哪个生殖器做爱？");
               menu();
               _g = this;
               genders = -1;
               addButton(0,"男性",function():void
               {
                  _g.marbleSex2Continued(genders);
               });
               _g1 = this;
               genders1 = -2;
               addButton(1,"女性",function():void
               {
                  _g1.marbleSex2Continued(genders1);
               });
            }
            if(get_player().get_gender() == 1)
            {
               marbleSex2Continued(1);
            }
            if(get_player().get_gender() == 2)
            {
               marbleSex2Continued(2);
            }
         }
      }
      
      public function set_marbleAffection(param1:int) : int
      {
         if(!get_player().hasStatusEffect(StatusEffects.Marble))
         {
            get_player().createStatusEffect(StatusEffects.Marble,0,0,0,40);
         }
         get_player().changeStatusValue(StatusEffects.Marble,1,Utils.boundInt(0,param1,100));
         return param1;
      }
      
      public function set_marbleAddiction(param1:int) : int
      {
         get_player().changeStatusValue(StatusEffects.Marble,2,Utils.boundInt(0,param1,100));
         return param1;
      }
      
      public function set_knowAddiction(param1:int) : int
      {
         get_player().changeStatusValue(StatusEffects.Marble,3,param1);
         return param1;
      }
      
      public function setMarbleMovedToCamp() : void
      {
         get_player().createStatusEffect(StatusEffects.CampMarble,0,0,0,0);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1091,0);
         if(get_game().isabellaFollowerScene.isabellaAtCamp())
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,381,1);
         }
         get_player().createStatusEffect(StatusEffects.NoMoreMarble,0,0,0,0);
         if(amilyFollower())
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,85,2);
         }
         else
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,85,1);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,238) == 1 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1082) == 0)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,237,1);
         }
      }
      
      public function resistMarbleInitially() : void
      {
         clearOutput();
         outputText("她对你的抵抗感到惊讶，退了回去并为自己的冒昧道歉。");
         outputText("[say: 我叫玛布尔，你叫什么名字？]她问你。你做了自我介绍，寒暄了几句后，她问能帮你什么忙。你告诉她，你其实是来帮她的，并解释说惠特尼说她需要温柔的抚摸。[say: 哦，那太好了，]她说，[say: 连着挤奶机过夜是个错误，现在我需要一些温柔的对待。]你打算怎么帮她？");
         menu();
         addButton(0,"抚摸",caressMarble).hint("给她一个温柔的按摩。");
         addButton(1,"吸吮",suckleMarble).hint("喝点奶减轻她的负担。");
         addButton(2,"强暴",rapeDAHMARBLEZ).hint("从她那里拿走你想要的。");
         addButton(14,"离开",turnOffMarbleForever);
      }
      
      public function resistAddiction() : void
      {
         clearOutput();
         outputText("你在这个艰难的考验中苦苦挣扎，但当玛布尔终于停止抚摸自己时，你成功地坚持住了。她微笑着给了你一个大大的拥抱以示庆祝，却没有意识到她在这个过程中几乎把你推向了边缘，并递给你一小杯乳汁。[say: 缓解一下紧张情绪，给你一点安慰，]她对你说。这确实平静了你的神经，但仍然让你感到完全不满足。");
         set_marbleAddiction(get_marbleAddiction() - 5);
         dynStats(DynStat.Str(-1),DynStat.Tou(-1));
         if(get_player().hasStatusEffect(StatusEffects.BottledMilk))
         {
            get_player().addStatusValue(StatusEffects.BottledMilk,1,1 + Utils.rand(6));
         }
         else
         {
            get_player().createStatusEffect(StatusEffects.BottledMilk,3,0,0,0);
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function refuseMarblesMilkAddiction() : void
      {
         clearOutput();
         outputText("你看着玛布尔，拒绝按照她说的做。她惊讶地看着你，问为什么。你告诉她你无法忍受那样谈论她，而且如果为了克服这种渴望而必须让她感到难过，那是不值得的。玛布尔花了片刻消化你的话后，她冲向你，然后");
         if(get_player().get_tallness() < 60)
         {
            outputText("把你紧紧抱在怀里，");
         }
         else
         {
            outputText("给了你一个大大的拥抱，");
         }
         outputText("嘴里还不停地说着你有多棒。在拥抱的过程中，瓶子还是被扔到了地上，但你们俩直到事后才注意到。不过，这已经不重要了；至少在短时间内你会没事的。现在，你只想享受玛布尔那温暖的身体紧紧包裹着你的感觉。");
         set_marbleAffection(get_marbleAffection() + 5);
         if(get_player().hasStatusEffect(StatusEffects.BottledMilk))
         {
            get_player().addStatusValue(StatusEffects.BottledMilk,1,1 + Utils.rand(6));
         }
         else
         {
            get_player().createStatusEffect(StatusEffects.BottledMilk,3,0,0,0);
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function rapeMarbleInHerRoom() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_marble());
         outputText("你不打算放弃这个机会，但你也不想有观众。于是你把玛布尔和她的锤子拖回她的房间，把她扔到床上，抓住并扭捏她的乳头，让她在痛苦与快感中大叫出声。");
         outputText("你突然抓住她的乳房粗暴地揉捏，这时她尖叫起来，并且");
         outputText("试图扇你耳光。你轻松地躲过她的手，开始扭动她的乳头。她尖叫起来，在你痛苦的折磨下开始变得软弱无力。你把她转过身，强迫她跪下，把她的脸按在床上。你一只手放在她的乳头上，拉下她的裙子，露出她美丽的女性私处和屁眼。[pg]");
         if(int(get_player().cocks.length) > 0)
         {
            outputText("你暗自轻笑，从[armor]中释放出你的[cocks]。你花了一点时间问那个无助的牛娘是否准备好了，她唯一的回答是一声呜咽，然后");
            if(get_player().cocks[0].cockThickness < 3)
            {
               if(get_player().cocks[0].cockLength <= 8)
               {
                  outputText("你尽力把你的[cock]塞进去。");
               }
               else
               {
                  outputText("你把你的[cock]深深地插了进去。");
               }
               outputText("伴随着愉悦的咕哝声，你开始抽插，同时粗暴地揉捏她敏感的乳房。她痛苦的哭喊和尖叫只会让你更兴奋，让这种体验对你来说更加愉快。你嘲笑自己以她的痛苦为代价获得的快乐。你拍打着她的屁股，惊叹于它的晃动，加快了在她体内抽插的速度。玛布尔因为速度的加快而喘息，在快乐和痛苦的语调之间交替。[pg]");
               if(get_player().cor >= 33)
               {
                  marbleRapeCorruptFantasy();
               }
               outputText("你再次嘲弄她，然后感觉自己的身体被高潮折磨，你把精液射进了她的体内。");
               get_player().orgasm("Dick");
            }
            else
            {
               outputText("试图把你的" + get_player().cockDescript(0) + "推入她的体内。当然，你[cock]的粗细让这成为一个相当困难的操作，几分钟后就很明显它根本塞不进去。相反，你满足于在她丰满的臀瓣之间摩擦自己，偶尔骄傲地抚摸你的[cocks]。[pg]");
               if(get_player().cor >= 33)
               {
                  marbleRapeCorruptFantasy();
               }
               outputText("你再次嘲弄她，然后感觉自己的身体被高潮折磨，你把精液射到了她的屁股上。");
               get_player().orgasm("Dick");
            }
         }
         else if(int(get_player().vaginas.length) > 0)
         {
            outputText("你快速环顾四周，看看是否能找到一些让这更愉快的东西，并注意到茶几上放着一个双头假阳具。你抓起那个工具，把它推入玛布尔的女性私处，引起她一声小小的愉悦喘息，当你扭动她的一个乳头时，喘息变成了痛苦的喘息。[pg]");
            outputText("你把玛布尔固定在原地，准备好你的" + get_player().vaginaDescript(0) + "来接纳假阳具的另一端，然后兴致勃勃地这样做。让玛布尔非常不舒服的是，你以提高自己快乐的方式操纵假阳具，但给玛布尔带来不太愉快的体验。你问她是否喜欢，她回答了一声呜咽，并试图移动到一个更舒服的位置。你收紧了对她的抓握，她再次僵住了。[pg]");
            if(get_player().cor >= 33)
            {
               marbleRapeCorruptFantasy();
            }
            outputText("你再次嘲弄她，然后感觉自己的身体被使用玛布尔自己的玩具对付她而带来的令人满意的高潮所折磨。");
            get_player().orgasm("Vaginal");
         }
         else
         {
            outputText("你缺乏生殖器，这使得你很难真正强暴玛布尔，但你还可以做其他事情。你用空闲的手，把一根手指推入她的女性私处，当你开始扭动它时，玛布尔尖叫起来。当然，这只是个开始，很快里面就有两根手指，然后是三根。每进去一根，玛布尔就会喘息一次。当你的第四根手指进去时，你捏住她的乳头，引出了一声相当有趣的痛苦和快乐交织的喘息。[pg]");
            if(get_player().isCorruptEnough(33))
            {
               marbleRapeCorruptFantasy();
            }
            outputText("只剩下一件事要做了，你嘲笑玛布尔，然后把你的整个拳头塞进她体内。这个动作导致了那种熟悉的痛苦和快乐交织的喘息。和她玩耍确实很令人满意。");
            dynStats(DynStat.Lust(-20));
         }
         outputText("心满意足后，你从牛娘颤抖的身体上退开，从地上捡起她的锤子，告诉她你要把这个拿走，作为她给你惹麻烦的补偿。穿好衣服后，你走出了谷仓。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1077) == 0)
         {
            outputText("[pg]惠特尼正怒气冲冲地盯着你。[say: 看来我看错你了，[name]。你他妈对玛布尔做了什么？] 似乎是个反问句；她已经知道了，而且她的反应全写在脸上了。[say: 你他妈再敢来这里试试。这个地方是躲避你们这种人的圣所，为了保护它，我会杀人的。] 你哼了一声，带着玛布尔的锤子离开了农场。反正你也不喜欢这个地方。");
         }
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,464,1);
         get_combat().cleanupAfterCombat();
      }
      
      public function rapeDAHMARBLEZ() : void
      {
         var _loc1_:Boolean = false;
         clearOutput();
         spriteSelect(SpriteDb.get_s_marble());
         outputText("你决定不帮她，而是粗暴地蹂躏她的乳房，强暴她。你突然抓住她的乳房，粗暴地揉捏，她尖叫着");
         if(get_player().hasPerk(PerkLib.Evade))
         {
            outputText("试图扇你耳光。你轻松地躲过她的手，开始扭动她的乳头。她尖叫起来，在你痛苦的折磨下开始变得软弱无力。你把她转过身，强迫她跪下，把她的脸按在床上。你一只手放在她的乳头上，拉下她的裙子，露出她美丽的女性私处和屁眼。[pg]");
            _loc1_ = true;
         }
         else if(get_player().get_str() >= 80)
         {
            outputText("扇了你一巴掌。你并没有被这一击吓倒，而是把她推回床沿，这让她很沮丧。你强行把她翻过来，让她趴在地上，她的膝盖着地。你一只手放在她的背上，阻止她站起来，另一只手拉下她的裙子，露出她美丽的女性私处和屁眼。[pg]");
            _loc1_ = true;
         }
         if(!_loc1_)
         {
            outputText("扇了你一巴掌。当你还在从这一击中恢复过来时，她用惊人的力量把你推出了门外。她砰的一声关上门，隔着门大喊：[say:你再也别回来了！]你走开时，听到她开始哭泣。她似乎比看起来要强壮得多。");
            outputText("[pg]你心想，如果再见到她，你不会再犯低估她的错误了。当你沉浸在自己的思绪中时，你绊了一下，不小心摔倒了。<i>也许等你不再眼冒金星的时候，你会教训她一顿。</i>当你试图站起来时，你又绊向另一个方向，再次摔倒。<i>不过话又说回来，这可能不值得麻烦。</i>");
         }
         if(_loc1_)
         {
            if(int(get_player().cocks.length) > 0)
            {
               outputText("你暗自轻笑，从[armor]中释放出你的[cocks]。你花了一点时间问那个无助的牛娘是否准备好了，她唯一的回答是一声呜咽，然后");
               if(get_player().cocks[0].cockThickness < 3)
               {
                  if(get_player().cocks[0].cockLength <= 8)
                  {
                     outputText("你尽力把你的[cock]塞进去。");
                  }
                  else
                  {
                     outputText("你把你的[cock]深深地插了进去。");
                  }
                  outputText("伴随着愉悦的咕哝声，你开始抽插，同时粗暴地揉捏她敏感的乳房。她痛苦的哭喊和尖叫只会让你更兴奋，让这种体验对你来说更加愉快。你嘲笑自己以她的痛苦为代价获得的快乐。你拍打着她的屁股，惊叹于它的晃动，加快了在她体内抽插的速度。玛布尔因为速度的加快而喘息，在快乐和痛苦的语调之间交替。[pg]");
                  if(get_player().cor >= 33)
                  {
                     marbleRapeCorruptFantasy();
                  }
                  outputText("你再次嘲弄她，然后感觉自己的身体被高潮折磨，你把精液射进了她的体内。");
                  get_player().orgasm("Dick");
               }
               else
               {
                  outputText("试图把你的" + get_player().cockDescript(0) + "推入她的体内。当然，你[cock]的粗细让这成为一个相当困难的操作，几分钟后就很明显它根本塞不进去。相反，你满足于在她丰满的臀瓣之间摩擦自己，偶尔骄傲地抚摸你的[cocks]。[pg]");
                  if(get_player().cor >= 33)
                  {
                     marbleRapeCorruptFantasy();
                  }
                  outputText("你再次嘲弄她，然后感觉自己的身体被高潮折磨，你把精液射到了她的屁股上。");
                  get_player().orgasm("Dick");
               }
            }
            else if(int(get_player().vaginas.length) > 0)
            {
               outputText("你快速环顾四周，看看是否能找到一些让这更愉快的东西，并注意到茶几上放着一个双头假阳具。你抓起那个工具，把它推入玛布尔的女性私处，引起她一声小小的愉悦喘息，当你扭动她的一个乳头时，喘息变成了痛苦的喘息。[pg]");
               outputText("你把玛布尔固定在原地，准备好你的" + get_player().vaginaDescript(0) + "来接纳假阳具的另一端，然后兴致勃勃地这样做。让玛布尔非常不舒服的是，你以提高自己快乐的方式操纵假阳具，但给玛布尔带来不太愉快的体验。你问她是否喜欢，她回答了一声呜咽，并试图移动到一个更舒服的位置。你收紧了对她的抓握，她再次僵住了。[pg]");
               if(get_player().cor >= 33)
               {
                  marbleRapeCorruptFantasy();
               }
               outputText("你再次嘲弄她，然后感觉自己的身体被使用玛布尔自己的玩具对付她而带来的令人满意的高潮所折磨。");
               get_player().orgasm("Vaginal");
            }
            else
            {
               outputText("你缺乏生殖器，这使得你很难真正强暴玛布尔，但你还可以做其他事情。你用空闲的手，把一根手指推入她的女性私处，当你开始扭动它时，玛布尔尖叫起来。当然，这只是个开始，很快里面就有两根手指，然后是三根。每进去一根，玛布尔就会喘息一次。当你的第四根手指进去时，你捏住她的乳头，引出了一声相当有趣的痛苦和快乐交织的喘息。[pg]");
               if(get_player().isCorruptEnough(33))
               {
                  marbleRapeCorruptFantasy();
               }
               outputText("只剩下一件事要做了，你嘲笑玛布尔，然后把你的整个拳头塞进她体内。这个动作导致了那种熟悉的痛苦和快乐交织的喘息。和她玩耍确实很令人满意。");
               dynStats(DynStat.Lust(-20));
            }
            outputText("你闭上眼睛，陶醉在这一刻，然后感觉玛布尔翻了个身，抓住了你的一只手。你睁开眼睛，正好看到一个大锤头朝你的脸飞来……");
            get_player().takeDamage(9001);
            get_player().set_HP(1);
            outputText("[pg]几个小时后，你醒来躺在地上，感觉头好像被夹在老虎钳里。费了一番力气，你设法坐起来，环顾四周。看起来你正躺在谷仓外面。惠特尼站在附近。她那张动物般的脸上挂着类似微笑的表情，她告诉你：[say:好吧，亲爱的，看来你已经让玛布尔相当生气了。我估计你从现在起应该离她远点，因为我确信你已经吃到了苦头，她是个难对付的家伙。]你疼痛的头告诉你这可能是个好主意；但话又说回来，也许你应该先教训一下那个牛娘，让她尝尝痛苦的滋味。");
         }
         doNext(get_camp().returnToCampUseFourHours);
         get_player().createStatusEffect(StatusEffects.MarbleRapeAttempted,0,0,0,0);
      }
      
      public function postAddictionFarmMornings() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_marble());
         outputText("你匆忙赶到农场去获取你每天所需的玛布尔的乳汁。这花去了你一天中的一个小时，但你的身体得到了满足。");
         get_player().refillHunger(20);
         get_player().slimeFeed();
         if(get_player().cor < 40)
         {
            if(get_player().cor < 30)
            {
               dynStats(DynStat.Cor(1));
            }
            dynStats(DynStat.Cor(1));
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function postAddictionFarmHelpings() : void
      {
         spriteSelect(SpriteDb.get_s_marble());
         clearOutput();
         outputText("惠特尼微笑着建议你去帮玛布尔做些家务。你欣然同意，走出去和她碰面。之后，玛布尔递给你一瓶她的奶。");
         if(get_player().hasPerk(PerkLib.MarbleResistant))
         {
            outputText("她向你保证，只要你不直接从她的乳房喝奶，就不会再次上瘾。");
         }
         dynStats(DynStat.Str(Utils.rand(2)),DynStat.Spe(Utils.rand(2)));
         get_inventory().takeItem(get_consumables().M__MILK,get_camp().returnToCampUseOneHour);
      }
      
      public function postAddictionFarmExplorings() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_marble());
         outputText("你决定去玛布尔的房间拜访她。");
         if(get_player().get_tallness() < 60)
         {
            outputText("你刚踏进她的房间，她就迫不及待地冲过来，把你一把搂进她饱满柔软的胸怀里。[say: 你还是那么可爱，甜心！]");
         }
         outputText("她很高兴见到你，请你吃了一顿便饭，你们愉快地聊了天。");
         get_player().refillHunger(20,false);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,458) < 7)
         {
            extendedMurbelFarmTalkz();
            doNext(get_camp().returnToCampUseOneHour);
            return;
         }
         outputText("虽然你们谈论的大多是无关紧要的事情，但也讨论了一些关于这个世界和其中的危险。");
         outputText("[pg]整个过程中，你都");
         if(get_player().hasPerk(PerkLib.MarbleResistant))
         {
            outputText("不舒服地");
         }
         outputText("意识到玛布尔乳汁的气味。");
         dynStats(DynStat.Inte(1));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function postAddictionCampMornings(param1:Boolean = true) : void
      {
         spriteSelect(SpriteDb.get_s_marble());
         outputText("[pg]你刚一醒来，就闻到了一股新鲜乳汁的香味。你微笑着，任由玛布尔抬起你的头靠近她的乳房，喂你喝下早晨的奶水。[pg]");
         if(get_player().cor < 40)
         {
            if(get_player().cor < 30)
            {
               dynStats(DynStat.Cor(1));
            }
            dynStats(DynStat.Cor(1));
         }
         if(get_player().get_lib100() < 40)
         {
            dynStats(DynStat.Lib(0.1));
         }
         get_player().refillHunger(20);
         get_player().slimeFeed();
         if(!param1)
         {
            return;
         }
         if(!get_player().hasItem(get_consumables().M__MILK,5))
         {
            outputText("[pg]就在你准备离开时，玛布尔递给你一瓶她的奶。");
            if(get_player().hasPerk(PerkLib.MarbleResistant))
            {
               outputText("她向你保证，只要你不直接从她的乳房喝，就不会有事的。");
            }
            get_inventory().takeItem(get_consumables().M__MILK,get_camp().returnToCampUseOneHour);
         }
      }
      
      public function playerRefusesToDrinkBottledMilk() : void
      {
         clearOutput();
         outputText("你决定不喝奶，强迫自己把它还给玛布尔。她看了你一会儿，然后脸色沉了下来。[say:你甚至都不试着喝一下！]作为回应，你说你更喜欢直接吸吮她的乳房。她轻叹一声，闭上眼睛，然后摇了摇头，告诉你既然你拒绝了她的请求，那你就只能等到以后了。她回到谷仓里，留下你一个人回营地。不知为何，你的颤抖似乎稍微平息了一些，但你感觉有些酸痛。");
         set_marbleAffection(get_marbleAffection() - 5);
         set_marbleAddiction(get_marbleAddiction() - 5);
         dynStats(DynStat.Str(-1),DynStat.Tou(-1));
         if(get_player().hasStatusEffect(StatusEffects.BottledMilk))
         {
            get_player().addStatusValue(StatusEffects.BottledMilk,1,1 + Utils.rand(6));
         }
         else
         {
            get_player().createStatusEffect(StatusEffects.BottledMilk,3,0,0,0);
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function playerRefusesMarbleMilk() : void
      {
         clearOutput();
         outputText("她对你的拒绝感到惊讶，恼怒地哼了一声，然后继续朝谷仓走去。你摇摇头，继续你的探索。");
         set_marbleAffection(get_marbleAffection() - 5);
         set_marbleAddiction(get_marbleAddiction() - 5);
         dynStats(DynStat.Lust(-10));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function playerDrinksMarbleMilk() : void
      {
         clearOutput();
         outputText("你急切地走上前，玛布尔让你坐在她的大腿上。她把你的头抬到她的乳房前片刻，然后对你说：[say:喝吧，亲爱的。]你急切地开始大口吞咽她的奶水；那美妙的味道让你的身体充满了力量，并平静了你紧张的肌肉。当你坐在那里喝着玛布尔的奶水，而她前后摇晃时，世界上的一切似乎都变得美好了。直到她的乳头干涸，她才让你把头移开，但随后她又把你移到另一个乳房上，过程重新开始。你毫不费力地喝光了她能给你的所有奶水，最终站起来时感到完全满足。");
         set_marbleAffection(get_marbleAffection() + 5);
         set_marbleAddiction(get_marbleAddiction() + 10);
         dynStats(DynStat.Lib(1),DynStat.Lust(20),DynStat.Cor(1));
         if(get_player().get_lust100() >= 60)
         {
            outputText("[pg]");
            marbleMilkSex(false);
         }
         else
         {
            outputText("[pg]玛布尔在你的额头上吻了一下，然后送你离开。");
         }
         applyMarblesMilk();
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function playerDeclinesToDrinkMarbleMilk() : void
      {
         clearOutput();
         outputText("你勉强控制住自己，跑出了房间，无视了玛布尔的抗议。如果你留下来，你是不可能不喝她的奶的。当你在农场边缘喘息时，你的身体感觉就像是因为拒绝了玛布尔的奶水而要撕裂开来一样。幸运的是，你的戒断症状似乎暂时缓解了。");
         set_marbleAffection(get_marbleAffection() - 5);
         set_marbleAddiction(get_marbleAddiction() - 5);
         dynStats(DynStat.Str(-1),DynStat.Tou(-1));
         if(get_player().hasStatusEffect(StatusEffects.BottledMilk))
         {
            get_player().addStatusValue(StatusEffects.BottledMilk,1,1 + Utils.rand(6));
         }
         else
         {
            get_player().createStatusEffect(StatusEffects.BottledMilk,3,0,0,0);
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function playerAgreesToDrinkMarbleMilkBottled() : void
      {
         clearOutput();
         outputText("你轻松地将奶水一饮而尽，感觉颤抖平息了下来。玛布尔看起来有些失望，说道：[say:你没有得到我的允许就喝了，对吧？]你不这么认为，片刻之后你才意识到她在测试什么。你需要她的允许才能直接从她的乳房喝奶，但你可以不需要任何允许就喝瓶子里的奶。玛布尔轻叹一声，让你在口渴的时候告诉她并过来找她。[say:我会等你的，]她对你眨了眨眼说道。然后你回到营地，试着在需要再次回去之前做点工作。");
         set_marbleAddiction(get_marbleAddiction() + 5);
         if(get_player().hasStatusEffect(StatusEffects.BottledMilk))
         {
            get_player().addStatusValue(StatusEffects.BottledMilk,1,3 + Utils.rand(6));
         }
         else
         {
            get_player().createStatusEffect(StatusEffects.BottledMilk,8,0,0,0);
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function pickAFight() : void
      {
         clearOutput();
         outputText("你对她对待你的态度表示了不满。[say: 所以现在是我有问题了，是吗？真好笑，我清楚地记得你才是那个混蛋。你让我燃起希望，然后就这么走了？] 哦，你几乎受够了这个自恋的恋乳癖，并把这些话说了出来。[say: 你叫我什么？！] 她震惊而愤怒地尖叫道。你当着她的面又说了一遍，然后她转过身，怒气冲冲地快步走向谷仓。[say: 就在那儿等着，我的锤子有话要对你说。]");
         menu();
         addButton(0,"留下",stayForFights);
         addButton(1,"去他妈的",getOutOfDodge);
      }
      
      public function pcPregWithMarblesKids() : Boolean
      {
         if(get_player().get_pregnancyType() == 8)
         {
            return get_player().get_pregnancyIncubation() <= 280;
         }
         return false;
      }
      
      public function milkMarbleTakeHerDick() : void
      {
         clearOutput();
         outputText("你问她是否想在使用那台挤奶机的时候插入你。");
         outputText("[pg]她若有所思地看了一会儿，手指敲打着嘴唇，尾巴来回甩动。管子从她的乳头上垂下来，看起来其实相当滑稽。");
         outputText("[pg]注意到你的眼神，她对你皱起了眉头，[say: 哦，你觉得这很傻，是吗，[name]？我得让你知道，我正在认真地想办法让这行得通。]她指了指自己与这个房间，以及它所提供的家具之间相当物理的联系。");
         outputText("[pg]你稍微想了想，然后建议你可以靠在栏杆上，让她从后面干你。");
         outputText("[pg][say: 从后面来，嗯？我其实更喜欢在做爱的时候看着你的眼睛，但这里好像没有太多选择，不是吗？]");
         outputText("[pg]为了让她停止抱怨，你迅速脱下衣服");
         if(get_player().get_tallness() < 56)
         {
            outputText("，抓起一个箱子，");
         }
         outputText("靠在栏杆上，然后朝她的方向摇晃你的[ass]，将你因兴奋而湿润的阴道完全展示出来。你回头看着她，想看看是否达到了预期的效果。");
         outputText("[pg]玛布尔舔着嘴唇，脸上带着紧张的神情，手里抓着自己的尾巴，手指在尾巴的毛发中穿梭。[say: 你的提议很有说服力，亲爱的。而且，如果你那样看着我，我想我真的没什么好抱怨的了，对吧？]");
         outputText("[pg]她脱下短裙，在你身后站定，双手放在你的臀部，勃起的阴茎紧贴着你的入口。你低头看向双腿之间，看到她的尾巴垂在腿间，只有最轻微的动作。[say: 好了，亲爱的，你准备好迎接我了吗？]");
         outputText("[pg]你反驳说，如果你没准备好，一开始就不会提出这个建议。");
         outputText("[pg][say: 呵呵，说得好。好吧，我来了……] 她慢慢地进入你，一寸一寸地。");
         if(get_player().vaginalCapacity() < FlagDict_Impl_.arrayReadInt(KFLAGS.flags,5) * FlagDict_Impl_.arrayReadInt(KFLAGS.flags,6))
         {
            outputText("每插入一点，她都会等一会儿让你适应她的尺寸，让你扩张以容纳她。");
         }
         outputText("当她最后一点也进入你体内时，她的尾巴突然笔直地竖起，离开了你的视线，她发出一声长长而夸张的愉悦叹息，而她上方的挤奶机仍在旋转。");
         get_player().cuntChange(8,true,true,false);
         outputText("[pg][say: 哦，亲爱的，你感觉太棒了。我现在感觉有点奇怪，好像我想……] 她开始充满激情地在你的入口处抽插，引得你发出一声惊讶的喘息；玛布尔在做爱时通常不会这么精力充沛！被挤奶可能让她比平时更具攻击性，不过考虑到她让你感觉有多好，你真的没什么好抱怨的。");
         outputText("[pg]她开始用手玩弄你的后背，按摩你");
         if(get_player().butt.rating <= 4 && !get_player().isGoo())
         {
            outputText("紧绷的");
         }
         else
         {
            outputText("摇晃的");
         }
         outputText("肉体，而她 " + Utils.num2Text(Math.round(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,5))) + " 英寸长的阴茎继续在你的女性私处里进进出出。在她的热情的鼓舞下，你自己也开始在做爱中投入一些努力，每次她向前推进时，你都将后背紧紧贴住她，每次她拔出时，你都前后摇晃。");
         outputText("[pg]这种刺激让玛布尔陷入疯狂，很快她就用她双性人的精液淹没了你。然而，她并没有减速，而是继续充满爱意地蹂躏你的后背和欢愉的丘阜。你再次低头看向双腿之间，看到她的尾巴开始随着身体纵向摆动，她身体和思想的每一寸都专注于与你交配，这让你在自己高潮时发出了胜利的笑声。");
         outputText("[pg]将近一个小时后，玛布尔终于平静下来，低头看着她对你做的好事。[say: 哦，天哪！亲爱的，对不起，我不知道我怎么了……] 当她看到你幸福的表情时，她愣住了，你告诉她你很喜欢看到她的那一面。你们两个以后还得再来一次。");
         get_player().orgasm("Vaginal");
         get_player().orgasm("Vaginal");
         get_player().orgasm("Vaginal");
         FlagDict_Impl_.arrayWriteFloat(KFLAGS.flags,3,10);
         dynStats(DynStat.Lib(0.5));
         get_player().knockUp(8,368,150);
         doNext(get_camp().returnToCampUseTwoHours);
      }
      
      public function milkMarbleOnTheBar() : void
      {
         clearOutput();
         outputText("你建议说，你很有兴趣在她趴在房间一侧的吧台上时和她玩。");
         outputText("[pg]她眯起眼睛看着你，考虑着这个提议。[say: 我不知道，亲爱的，听起来不太像我会喜欢的事情。我希望能在一个不仅仅是承受的位置上……]");
         outputText("[pg]你向她保证，你会做得足够好，让她觉得把控制权完全交给你是值得的。");
         outputText("[pg]又思考了片刻，玛布尔非常严肃地看着你，[say: 你不能完全控制，这里由我来发号施令，哦，你最好干得漂亮点。] 突然她笑了，[say: 否则，我就只好反客为主了！]");
         outputText("[pg]你寻思着，当她双手撑在吧台上，然后趴在上面，乳房在下面晃荡时，你是不是希望她反客为主。她转过头看着你，把装饰着丝带的尾巴来回甩了几下。既然她真的答应了你的请求，你最好别让她久等，于是你脱下衣服，走到她身后。");
         outputText("[pg][say: 好了亲爱的，是时候让我准备好了。让我看看你的本事。] 她转过头，只是等着你开始，而她上方的挤奶机继续发出嗡嗡声。");
         outputText("[pg]你首先掀起她的裙子，让她的圆臀和下方女性的嘴唇暴露在空气中。当然，在它正上方还有她尾巴的根部，它继续在她的开口上方有些愤愤不平地来回甩动。接着，你抓起一把她丰满的臀肉，在手中揉捏着柔软有弹性的肉体。虽然绝不像她的胸部那样宽广，但玛布尔的背面无疑相当迷人。");
         outputText("[pg][say: 嗯，] 你面前的牛娘发出一声愉悦的呻吟，随着她的女性部位周围形成最初的湿润和兴奋的迹象，她的尾巴微微翘起。");
         outputText("[pg]接着，你用一根手指划过她的入口，轻轻地挑逗她。一阵微小的电流穿过她的身体，她的尾巴笔直地竖了起来。");
         outputText("[pg][say: 啊，这是一个好的开始，亲爱的，现在，把一根手指放进我里面。]");
         outputText("[pg]话音刚落，你就把食指推入她的下唇。当它滑入时，发出一声低沉的吧唧声，当你在里面转了几圈时，这种声音又开始了。这导致玛布尔的尾巴卷住你的手，试图把你的手指拔出来。拔出一点后，她的尾巴又试图把你的手塞回她等待着的私处。");
         outputText("[pg][say: 也许你终究需要我的帮助。想让我的尾巴来指导你吗，亲爱的？让我向你展示我喜欢被怎样插入。不过，接下来感受一下你的舌头可能也不错……]");
         if(get_player().cockThatFits(marbleCuntCapacity()) > 0)
         {
            outputText("[pg]你漫不经心地考虑着抓住并拉扯她的尾巴，这样你就有机会占据主导地位，尽管在这种情况下，玛布尔肯定会试图夺回控制权……");
         }
         menu();
         addButton(0,"跟随尾巴",milkMarbleBarFollowTail);
         addButton(1,"舔阴",milkMarbleBarCunnilingling);
         if(get_player().hasCockThatFits(marbleCuntCapacity()))
         {
            addButton(2,"拉扯尾巴",milkMarbleBarPullTail);
         }
         addButton(3,"离开",milkMarbleLeaveAfterBar);
      }
      
      public function milkMarbleNoMilking() : void
      {
         clearOutput();
         outputText("你摇摇头，说你觉得你没事。");
         outputText("[pg][say: 哦，那好吧亲爱的，回头见。] 她在房间中间的椅子上坐下，拿起书继续看。你借故离开，回到了营地。");
         doNext(get_camp().returnToCampUseTwoHours);
      }
      
      public function milkMarbleLeaveAfterBar() : void
      {
         clearOutput();
         outputText("你没有回答玛布尔，而是继续用手指抠弄她的女性私处，直到她高潮迭起地叫出声来。你告诉她，只要她想找人陪她挤奶，你很乐意再次帮助她。");
         outputText("[pg]她对你在把她弄到吧台上之后没有更进一步感到有点失望，但对你的离开并没有意见。她确实告诉你，她期待着下次再让你进入她的挤奶机。");
         var _loc1_:int = int(5 + get_player().lib / 20);
         dynStats(DynStat.Lust(_loc1_));
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteFloat(_loc2_,3,FlagDict_Impl_.arrayReadFloat(_loc2_,3) + 5);
         doNext(get_camp().returnToCampUseTwoHours);
      }
      
      public function milkMarbleFuckDatCowPussy() : void
      {
         var _loc1_:int = get_player().cockThatFits(marbleCuntCapacity());
         clearOutput();
         outputText("你大声问她是否有兴趣来点性爱活动。你已经完全准备好满足她了。");
         outputText("[pg][say: 嗯，好吧，你的提议很诱人，但在我做出最终决定之前，我得先看看有什么可用的。]");
         outputText("[pg]你动作夸张地脱下你的[armor]，在你的" + get_player().cockDescript(_loc1_) + "上轻轻扫过，问她是否一切都符合她的需求。");
         if((get_player().hasPerk(PerkLib.BulgeArmor) || get_player().get_modArmorName() == "backless female teacher\'s clothes" || get_player().get_modArmorName() == "bridle bit and saddle set" || get_player().get_modArmorName() == "headdress, necklaces, and many body-chains" || get_player().get_modArmorName() == "bondage patient clothes" || get_player().get_modArmorName() == "crotch-revealing clothes" || get_player().get_modArmorName() == "cute servant\'s clothes" || get_player().get_modArmorName() == "maid\'s clothes" || get_player().get_modArmorName() == "servant\'s clothes") && get_player().hasCock())
         {
            outputText("[pg][say: 我很欣赏这个小表演，但我已经看得很清楚了。靠近点，让我看得更清楚些。]");
         }
         else
         {
            outputText("[pg][say: 嗯，是的，我想这应该行得通。靠近点，让我做个更彻底的检查。]");
         }
         outputText("[pg]你走上前，让你的爱人“熟悉”一下你的货物。");
         outputText("[pg]她蹲下来，装模作样地仔细打量着你，一路上还哼着小曲。她的呼吸轻轻拂过你的皮肤，让你迅速完全勃起。她用一根手指在你的龟头上敲了几下，然后顺着龟头滑过。最后，她用手握住你的阴茎，试探性地套弄了几下，结束了对你男子气概的检查。");
         outputText("[pg]她站起身，一脸严肃地看着你。[say: 你的阴茎符合我的期望，我相信我会把它放进我的阴道里。请躺在那边的长椅上，我们可以开——哈哈哈哈哈！] 她的脸终于绷不住了，为你们俩玩的这个小游戏大笑起来。");
         if(get_player().get_tallness() < 68)
         {
            outputText("[pg][say: 哦，亲爱的。] 她把你紧紧抱在胸前。[say: 太过分了！哈，哈哈哈哈哈！不开玩笑了。我现在就需要你在我里面。] 她小心翼翼地把你抱到长椅上，让你平躺下来，然后跨坐在你" + get_player().cockDescript(_loc1_) + "上方的长椅上。[say: 你准备好迎接我了吗？] 她用低沉沙哑的声音喊道，胸部起伏，尾巴摇摆，而她上方的挤奶机一直在嗡嗡作响。");
         }
         else
         {
            outputText("[pg]当她继续歇斯底里地大笑时，你把她拉进一个深深的拥抱，并温柔地抚摸她的头发。你向她保证，如果游戏太过火，你可以直接跳到正题。");
            outputText("[pg]过了一会儿，她平静下来，回抱了你。[say: 嗯嗯，是的。不开玩笑了。我现在就需要你在我里面。]");
            outputText("[pg]你从她怀里挣脱出来，漫不经心地走到长椅旁躺下。玛布尔紧跟在你身后，你还没完全躺下，她就已经站在你上方，脸上带着饥渴的表情，胸部起伏，尾巴摇摆。");
            outputText("[pg][say: 你准备好迎接我了吗？] 她用低沉沙哑的声音问道。");
         }
         outputText("[pg]你咧嘴一笑，告诉她你随时都准备好了。");
         outputText("[pg]你的话音刚落，玛布尔就沉下腰，吞没了你的" + get_player().cockDescript(_loc1_) + "，一个动作就把它吞到了根部。[say: 哦哦哦哦哦，是的！] 玛布尔高兴地用一只手揉着肚子，另一只手托着乳房。她左右摇晃了几下臀部，品味着你的阴茎在她体内来回摩擦的感觉。");
         outputText("[pg]然后她双手按在你的肚子上，开始在你的阴茎上快速前后摇摆，让你每一寸长度都深深地埋在她体内，在她的通道里旋转，同时她开始发出低沉快乐的呻吟。你抬头看着你的爱人，清楚地看到了她脸上幸福的表情，但也有机会看到奶水从她胸前流出。");
         outputText("[pg]随着每一次对你阴茎的推拉，都会有一股奶水快速喷出，挤奶机勉强能跟上。过了一会儿，你意识到它其实跟不上，她的奶水流出得太快了，挤奶机根本来不及！你试图警告你的牛情人，但为时已晚。伴随着“砰”的一声，吸盘从玛布尔的乳房上飞了出去，奶水喷得到处都是，机器也发出一声巨响，停止了工作。");
         outputText("[pg][say: 噢，不！该死，现在怎么办？]玛布尔停止了动作，担忧地环顾四周。");
         if(get_player().hasPerk(PerkLib.MarblesMilk))
         {
            outputText("[pg]你迅速坐起身，主动接替了挤奶机的工作。你的举动让她惊讶地喘了口气，随后发出一声满足的叹息，玛布尔也恢复了臀部的动作。她乳房分泌的仙露再次增加，感觉就像是被泵入你的口中。你很高兴能迎接这个挑战，在玛布尔继续骑乘你的身体时，将它们全部喝光。");
            outputText("[pg]机器无法处理玛布尔增加的产量，而你却成功地吸干了一切。见鬼，当你自己在玛布尔的通道里弹跳，而她则推挤着你来回弹跳时，这种感觉只会让你比平时更加兴奋。你一只手放在她的肩膀上借力，另一只手按摩她的乳房，诱哄出更多的乳汁，贪婪地吞噬着你最喜欢的药物。");
            outputText("[pg]将近一个小时后，玛布尔双乳的乳汁流速已经减缓成涓涓细流，你们俩在性爱和化学快感的交织中至少高潮了三次。玛布尔满足地叹了口气，告诉你她现在想睡个午觉，并想知道考虑到之后发生的事情，她是否应该养成弄坏挤奶机的习惯。");
            get_player().orgasm("Generic");
            get_player().orgasm("Generic");
            dynStats(DynStat.Lust(20));
            FlagDict_Impl_.arrayWriteFloat(KFLAGS.flags,3,15);
            dynStats(DynStat.Lib(0.3));
            if(get_player().cor < get_player().statusEffectv4(StatusEffects.Marble))
            {
               dynStats(DynStat.Cor(1));
            }
            dynStats(DynStat.Tou(0.1));
            dynStats(DynStat.Str(0.1));
         }
         else if(get_player().statusEffectv4(StatusEffects.Marble) > 30)
         {
            outputText("[pg]玛布尔受污染体液散发出的雾气在你脑海深处唤起了一种熟悉的渴望，但你将其压下，伸手抚摸她的乳房并捏住她的乳头。玛布尔紧张了片刻，困惑地低头看着你。你告诉她，在等待惠特尼修理机器的时候，你会尽量让她开心。");
            outputText("[pg]她再次开始说话，但当你拉扯她的乳头并尽力用手给她挤奶时，她安静了下来，就像家乡给奶牛挤奶一样。虽然你的抚摸并没有让她的乳房流出任何东西，但她发出了赞赏的呻吟，并恢复了在你胯部的摇摆。");
            outputText("[pg]在摩擦了一会儿后，你长度上的刺激对你来说已经不够了，你开始尝试向上挺进你爱人的通道。玛布尔似乎同意她的需求，她的动作从轻柔的摇摆变成了用她自己的抽插来迎接你的每一次挺进，试图榨干你的男子气概，而你则试图吸干她的乳房。");
            outputText("[pg]最后，你们俩在性高潮的快感中一起大叫，你将你的种子喷洒在她的通道里，与她自己的体液混合成泥浆状的性爱汁液，在你的" + get_player().cockDescript(_loc1_) + "周围晃荡。你们俩平静下来，玛布尔满足地趴在你身上待了一会儿。");
            outputText("[pg]突然，一个带着南方口音的声音从你们上方传来，[say: 你们这些孩子在下面玩得很开心吗？]");
            outputText("[pg]你们俩惊讶地盯着对方，紧张起来。");
            outputText("[pg][say: 下次，如果你不介意的话，请尽量对设备温柔一点。我可不想每次你们俩亲热的时候都要修理它。]随着金属撞击金属的砰砰声，惠特尼完成了对坏掉的挤奶机的修理，它又恢复了生机。");
            outputText("[pg]你和玛布尔看着对方的眼睛，突然大笑起来。然后你帮她重新连接上吸盘，并找借口离开了。就在你离开的时候，玛布尔给了你一个飞吻，并说道：[say: 我们以后一定要再来一次。不过先让惠特尼休息一下吧。]");
            FlagDict_Impl_.arrayWriteFloat(KFLAGS.flags,3,5);
         }
         else
         {
            outputText("[pg]你向玛布尔保证一切都会好起来的，并拿起长凳下的一个水桶，提出继续用手给她挤奶。她看起来似乎想反对，但片刻后还是点了点头。你帮她转过身，同时让你的男子气概牢牢地埋在她的体内。她把水桶放在长凳的尽头，你伸出双手环抱住她，抓住她巨大的乳房。");
            outputText("[pg]你将柔软顺滑的肉团在手中揉捏了几下，引来了它们主人的赞赏呻吟。然后你开始捏拉她的" + marbleNips() + "，让她的身体一阵颤栗，尾巴笔直地竖了起来。几乎就在那之后，她又开始在你的男子气概上摩擦，让它再次扫过她的体内，而她形状优美的臀部则在你的腰间滑动。");
            outputText("[pg]你也发出一声快感的喘息，尽力像家乡的奶牛一样，正确地挤压她的乳头，尽管你的被挤奶者现在操得有多粗暴。如果说有什么不同的话，那就是被挤奶让她变得更具攻击性，她的尾巴疯狂地甩动着。");
            outputText("[pg]这花了你几分钟的努力，但当你发现自己终于接近高潮的顶峰时，伴随着一声喷射和一声轻响。你终于成功地让一些乳汁从玛布尔的乳房中流出，就在这时，她发出了愉悦的尖叫，并比以前更用力地将自己推回你体内。她的尾巴再次笔直地竖起，抽搐了两次，你也随之被推向了边缘。");
            outputText("[pg]在接下来的一个小时左右，你们俩至少一起高潮了三次，虽然你手工挤奶的效率肯定不如惠特尼的机器，但它足以满足你的牛情人。当你去告诉农夫她的设备发生了什么事时，她对你们俩如此漫不经心和愉快的态度感到相当惊讶。正如她所说：[say: 大多数人在弄坏别人的东西时通常会感到内疚。]不过，你确信她知道你们在干什么。");
            FlagDict_Impl_.arrayWriteFloat(KFLAGS.flags,3,10);
         }
         get_player().orgasm("Generic");
         dynStats(DynStat.Sens(-2));
         marblePreggoChance();
         doNext(get_camp().returnToCampUseTwoHours);
      }
      
      public function milkMarbleCunnilingling() : void
      {
         clearOutput();
         outputText("你建议也许她会喜欢你在她被挤奶时舔她的阴道。");
         outputText("[pg]一个灿烂的笑容在她的脸上蔓延开来，[say: 哦，亲爱的，听起来太棒了！你是最好的，你知道吗？]");
         outputText("[pg]她在房间中间的椅子边缘坐下，双腿大张。她的裙子滑上了她的");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,465) < 1)
         {
            outputText("半人");
         }
         else
         {
            outputText("非人");
         }
         outputText("腿，让你清楚地看到她等待着的女性特征。她带着娇羞的侧目，扭动手指邀请你为她口交。");
         outputText("[pg]为了让好戏开场，你");
         if(get_player().isBiped())
         {
            outputText("跪下，慢慢向前爬行");
         }
         else
         {
            outputText("压低身体贴近地面，慢慢向前挪动");
         }
         outputText("就像一只发现了猎物的野兽。当你靠近她时，你的爱人用手指在自己的大腿内侧滑动，她的尾巴则悄悄绕过腰间，垂在你的战利品上。");
         outputText("[pg]来到一只坚硬的棕色蹄子前，你用手臂环住她长满粗毛的腿，将头靠在这兽性的肢体上。你抚摸着她的毛发，手指在其中穿梭，上方传来她轻柔的笑声，而机器仍在继续抽吸和旋转。你又挑逗了她一会儿，然后一点点抬起身体，直到视线与她被尾巴遮住的穴口齐平。一小撮装饰着粉色蝴蝶结的毛发是你目标唯一的遮掩。不，这是一份礼物，为你精心包装的礼物。");
         outputText("[pg]你抓住蝴蝶结的两根带子，告诉玛布尔她不该送你这么好的礼物。");
         outputText("[pg][say: 噢，一点也不，亲爱的。你值得拥有！]");
         outputText("[pg]你解开蝴蝶结，拆开你的礼物，把她的尾巴拨到一边，露出她湿润诱人的穴口，并惊呼这正是你一直想要的！");
         outputText("[pg][say: 噢，我很高兴你喜欢。你为什么不现在就试试呢？]");
         outputText("[pg]她不需要再说第二遍。你立刻扑了上去，将[tongue]深深探入她的深处，品尝着她牛娘的甘露。她的褶皱轻易地接纳了你，上方的女人发出一声渴望的呻吟。她的手指在你的[hair]间穿梭，而你从最初的突击中撤出，以便更好地探索入口。");
         outputText("[pg]作为对你拉扯和玩弄她外部阴唇的回应，玛布尔的臀部微微向前挺动，你看到她的爱之豆脉动着充血肿胀。她发出一声快乐的呻吟，尾巴不自觉地甩到了你的脸上。你拍开这烦人的包装，继续努力将你的伴侣推向快乐的顶峰。下一个目标：她的阴蒂。");
         outputText("[pg]当你把[tongue]贴上她女性快乐的源泉时，她发出了一声长长的、充满喜悦的叫喊。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,4) > 0)
         {
            outputText("随着第一下舔过那粉红色的嫩肉，玛布尔一把抓住了她的" + marbleCock() + "，紧紧地捏住，手慢慢地顺着它往下捋。");
         }
         else
         {
            outputText("随着第一下舔过那粉红色的嫩肉，玛布尔紧紧抓住了椅子的扶手。");
         }
         outputText("你忍不住笑了起来，问她你的招待是不是太过了，建议也许应该把剩下的留到以后再玩。");
         outputText("[pg][say: 别再逗我了，[name]，现在就咬我！]");
         outputText("[pg]你怎么能拒绝这样的请求呢？");
         outputText("[pg][say: 啊啊啊哦哦哦！] 当你的牙齿轻轻咬住她充血肿胀的肉核时，这位美妙的牛娘发出了充满感激的欢愉叫声，一股液体喷射而出，溅在了你的下巴上。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,4) > 0)
         {
            outputText("当然，也有一股白色的液体喷洒在她的腿上和你的头上。");
         }
         outputText("显然，虽然挤奶器通常不会让她兴奋，但它们确实能极大地放大她所获得的任何快感。");
         outputText("[pg]你问你的爱人感觉好不好。");
         outputText("[pg][say: 太棒了。谢谢你给了我一个最棒的挤奶开端，亲爱的。] 她注意到你身上都湿了，[say: 噢，来，让我帮你擦擦。] 她笑着擦去了你[face]上的液体。");
         outputText("[pg]然后你把她尾巴上的蝴蝶结重新系好，说剩下的留到以后再喝。");
         outputText("[pg][say: 哦，我会期待的。回头见，亲爱的！] 她隔着挤奶管在你脸颊上留下一个略显笨拙的吻，让你陷入了幸福的恍惚中。");
         FlagDict_Impl_.arrayWriteFloat(KFLAGS.flags,3,10);
         var _loc1_:int = int(20 + (get_player().lib + get_player().cor) / 10);
         dynStats(DynStat.Lust(_loc1_));
         dynStats(DynStat.Sens(1));
         doNext(get_camp().returnToCampUseTwoHours);
      }
      
      public function milkMarbleBarPullTail() : void
      {
         var _loc1_:int = get_player().cockThatFits(marbleCuntCapacity());
         clearOutput();
         outputText("也许是违背了你更好的判断，你决定掌握主动权，抓住玛布尔的尾巴，粗暴地把它从你身上解开并向上猛拉。");
         outputText("[pg][say: 哎哟！搞什么鬼，亲爱的？！]");
         outputText("[pg]你无视了她的抗议，在她的屁股上拍了一下，然后粗暴地用你的" + get_player().cockDescript(_loc1_) + "插入她，同时大喊着让她接受。");
         outputText("[pg]玛布尔愤怒地在地上跺着蹄子，发出一声响亮的“哒”声。她气呼呼地撑在吧台上，双腿向后猛踢，将你踢飞，让你仰面摔倒，肺里的空气都被撞了出来。你喘息了几下，然后抬起头，看到玛布尔正居高临下地看着你，脸上带着邪恶的笑容。");
         outputText("[pg][say: 我警告过你，如果你不规矩点，我就会接管一切，不是吗，[name]？]她坐在你的肚子上，把手压在你的[chest]上，捏得你有些疼。[say: 现在你要受罚了！]看着她的表情，你觉得也许她其实是希望你不规矩的！");
         outputText("[pg]你那好斗的伴侣向前移动，跨坐在你的脸上，在你的头顶上方来回晃动了几下她的私处。几滴她的润滑液滴落在你身上，紧接着，你刚才抓过的尾巴在你的鼻子上弹了一下。与此同时，你沐浴在她发情私处散发出的浓烈气味中。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,4) > 0)
         {
            outputText("她抓住她勃起的阴茎，在你的脸颊上摩擦了几下，涂抹了一些她的预精液。");
         }
         outputText("[pg][say: 你喜欢我来主导，对吧？哼哼，没错……]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,4) == 0)
         {
            outputText("[pg]她压下臀部，粗暴地将她的女性私处压在你的脸上，切断了你的呼吸。突如其来的窒息让你在她身下挣扎喘息，不过几秒钟后她就放开了你。");
            outputText("[pg][say: 哎呀，是不是太粗暴了？别担心。我会温柔一点的。]");
            outputText("[pg]玛布尔随后稍微温柔地坐了下来，这次给了你充足的呼吸空间，同时让你的嘴紧紧贴着她湿滑的通道。");
            outputText("[pg][say: 好了，让你那条粗鲁的舌头干点更有用的活吧。舔我。]");
            outputText("[pg]你照做了，换来了她赞许的微笑。你向她体内探得更深，感受着她的肉褶，直捣她的深处。");
            if(get_player().tongue.type > 0)
            {
               outputText("你充分利用你那非人般修长的舌头填满她，扫过她的通道，一路舔到子宫口，然后再回到她下方的阴唇。");
            }
            else
            {
               outputText("你将舌头尽可能深地探入她的通道，在她的阴唇周围蠕动，尽你所能地取悦你这位强势的牛娘情人。");
            }
         }
         else
         {
            outputText("[pg]她强行掰开你的嘴，挺起臀部向前，粗暴地将她" + Utils.num2Text(Math.round(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,5))) + "英寸长的肉棒塞进你倒霉的嘴里，直插喉咙。突如其来的窒息让你惊愕地干呕挣扎，但几秒钟后她就拔了出来。");
            outputText("[pg][say: 哎呀，是不是太粗暴了？别担心，我会温柔一点的。]");
            outputText("[pg]玛布尔随后温柔得多地向前挺动，给了你充足的时间来适应她那根东西在你嘴里的感觉。她也确保自己没有插进你的喉咙里。");
            outputText("[pg][say: 好了，让你那张粗鲁的嘴干点更有用的活吧。给我吸。]");
            outputText("[pg]你照做了，换来了她赞许的微笑。你用嘴唇紧紧包裹住她，舌头在她肉棒底部上下滑动，同时挑逗着尿道口。她在你嘴里抽插了几下，让你尝到了她的一些先兆液。");
         }
         outputText("[pg]过了一会儿，玛布尔抬起臀部，简短地点了点头。[say: 现在，你得照顾一下我的尾巴。被你那样拽过之后它还在疼，我要你向它道歉，亲亲它让它好受点。]然后她转过身，让你清楚地看到那条尾巴，它似乎正漫不经心地来回摆动着。");
         outputText("[pg]乖，乖，你对着你伴侣身体上被你弄疼的部位说着，轻轻抚摸着那条长着短毛的附肢。然后你倾身向前，不断地亲吻它，从尖端浓密的毛丛，一路吻到脊椎与她圆润臀部交界的根部。当你吻到根部时，玛布尔的身体猛地一颤，她突然抓住你，把她的尾巴塞进你的嘴里。你惊讶地喘了口气，疑惑地抬头看着你的情人。");
         outputText("[pg][say: 嗯，抱歉亲爱的，我只是想尝试一下。感觉和我想象的不太一样，但我真的很喜欢你嘴里含着我尾巴的样子。如果你能吸一会儿，我或许就能原谅你之前拽它的事了。]");
         outputText("[pg]你的舌头绕着沾满汗水的皮毛舔舐，换来了你牛娘情人赞许的目光。然后你来回晃动了几下下巴，慢慢让她的尾毛从你嘴里滑出。当最后一丝毛发滑出时，你在尖端轻轻吻了一下。");
         outputText("[pg][saystart]你喜欢那样吗，亲爱的？");
         if(get_silly())
         {
            outputText("下次想用我的尾巴刷牙吗？");
         }
         outputText("[sayend] 她点点头，打量了你一会儿。[say: 嗯，我觉得我现在好多了。我想我可以原谅你做的事了。事实上，你做得这么好，我觉得我该给你个奖励！]");
         outputText("[pg]你微笑着问她为你准备了什么计划。");
         outputText("[pg]她重新调整姿势，跨坐在你的腰上，目光落在你的男性器官上。[say: 显然这东西需要一些治疗，既然你之前那么急于想用它来主导。] 她俯下身，让她的女性花瓣接触到你肉棒的前端，并在上面摩擦了几下。[say: 看看你有多硬。你真的很想让我把你吞进去，对吧？你非常想把你那根又长又硬的肉棒完全交给我，让我随心所欲地使用。]");
         outputText("[pg]她没有给你回答的机会。她已经决定了接下来要发生什么，那就是让你进入她体内，任由她摆布。她用一根手指抚摸着你的" + get_player().cockDescript(_loc1_) + "，然后将它推入她那等待着的阴户。你轻松地滑入她那润滑极佳的通道，当它紧紧夹住你时，你忍不住呻吟出声。你肉棒的每一部分都被她阴道肌肉的圆环紧紧包裹着，你无法控制地发出愉悦的呻吟。");
         outputText("[pg]她左右摇晃了几下臀部，让你的肉棒在她的体内旋转，然后停下来打量着你。[say: 你知道吗，我在想，也许我给你的奖励太多了，或者也许还不够？] 当她第一次把你扑倒时那种邪恶的眼神再次闪过她的眼睛。[say: 让我们尝试一些新东西……] 她转过身去，把手伸到身后某个你视线之外的地方。");
         outputText("[pg]过了一会儿，你突然感觉到有什么东西顶住了你的[vagOrAss]入口！你试图问玛布尔有什么计划，但那股压力强行将一个毛茸茸的东西塞进了你的洞里。她竟然把她的尾巴插进了你的[vagOrAss]里！");
         outputText("[pg][say: 那么亲爱的，你觉得怎么样？] 随着玛布尔恢复摇晃她宽大的女性臀部，它颤抖了几下。[say: 没关系，如果你不喜欢，好吧，你可以试着尽快结束这一切。如果你喜欢，那么我想……] 她向前倾身，从摇摆的动作变成了在你的" + get_player().cockDescript(_loc1_) + "上弹跳，她那毛茸茸的尾巴开始向更深处推进，多亏了你留在上面的唾液，它滑入得非常轻松。[say: 你只能尽可能久地忍受它了！]");
         outputText("[pg]你以前从未见过玛布尔如此具有攻击性，但原因很明显：目前连接在她乳房上的那台嗡嗡作响的挤奶机。显然，产奶触发了某种支配本能，而且这极其性感！");
         outputText("[pg]你的爱人放声大笑，继续用力而快速地骑乘着你，同样用力而快速地唤起你下半身的快感。不管你是否想要，你都能感觉到高潮在你体内迅速积聚，你的骑乘者很容易就能从你加快的喘息和愉悦的叫声中察觉到。就她而言，玛布尔也正在迅速接近她的顶峰，伴随着熟练的节奏，你们俩同时达到了高潮，你爱人的尾巴也从你的[vagOrAss]里弹了出来。");
         outputText("[pg]这位牛女在你上方疲惫地喘息了几下，她巨大的乳房随着每一次呼吸而起伏。然后她伸出手，把你的头拉起来抱在胸前，非常开心地笑着。[say: 那么亲爱的，如果你以后还想让我玩得粗暴一点，你知道该怎么做。我很期待我们俩在卧室里还能有其他的冒险，你呢？]");
         outputText("[pg]你依偎在她的胸前，心里想着非常相似的事情。可以肯定的是，当你在玛布尔的挤奶隔间里时，事情绝对不会无聊。");
         get_player().orgasm("Dick");
         dynStats(DynStat.Lust(20));
         FlagDict_Impl_.arrayWriteFloat(KFLAGS.flags,3,15);
         dynStats(DynStat.Sens(-2));
         marblePreggoChance();
         doNext(get_camp().returnToCampUseTwoHours);
      }
      
      public function milkMarbleBarFollowTail() : void
      {
         var _loc3_:int = 0;
         var _loc1_:int = get_player().cockThatFits(marbleCuntCapacity());
         var _loc2_:int = int(get_player().cockThatFits2(marbleCuntCapacity()));
         clearOutput();
         outputText("你问玛布尔她的尾巴会把你引向何方。");
         outputText("[pg]她低声轻笑，[say: 你为什么不等等看呢？]");
         if(_loc1_ >= 0)
         {
            outputText("[pg]她那装饰着丝带的牛尾巴慢慢从你的手腕上解开，转而在你的胯部周围寻找其他东西。最终，那簇毛接触到了你的" + get_player().cockDescript(_loc1_) + "，用它的毛发在你的长度上充满爱意地抚摸了几次，然后卷住你的根部，把你拉向玛布尔等待着的女性部位。");
            outputText("[pg][say: 呵呵呵，找到了！]");
            outputText("[pg]很明显，你无法躲避她太久。");
            outputText("[pg][say:哦，我知道的，亲爱的，但看看总是很有趣的。]");
            outputText("[pg]滑入她体内的过程缓慢而令人愉悦。每深入一寸，你都想立刻将自己完全送入，但你还是耐心等待玛布尔的尾巴为你指引方向。终于，你完全进入了她的身体，她发出一声长长而轻柔的欢愉呻吟，随后左右摇晃了几下臀部。");
            if(_loc2_ >= 0)
            {
               outputText("你发现你的" + get_player().cockDescript(_loc2_) + "舒适地滑入她的双丘之间，你稍微挤压它们，为它提供一个紧致柔软的肉谷穿行。");
            }
            outputText("[pg]你的向导绳随着你爱人欢愉的呼喊声结束而稍微收紧了一点。[say:嗯，我的，全是我的。]你勉强听到玛布尔低声呢喃，然后她的尾巴稍微放松了一点，向后推着你的腰。你明白了她的意思，将你的肉棒从它的“主人”家里拔了出来。但你还没走多远，她就再次夹紧了你，你意识到你应该再次改变方向。你再次将注意力集中在为你指路的绒毛上。");
            outputText("[pg]一切都集中在三件事上：被唤醒的阴户包裹着你肉棒的感觉，随着每一次缓慢的抽插和深入而产生的涟漪和水声；你手下柔软有弹性的臀部和臀部曲线，在你的手下感觉如此美妙；当然，还有玛布尔的尾巴卷在你" + get_player().cockDescript(_loc1_) + "的根部。她那细长的附肢，虽然被汗水浸透但依然柔软多毛，随着你们两具身体的运动不断颤抖和抽动，吸引了你全部的注意力。");
         }
         else
         {
            outputText("[pg]她那装饰着丝带的牛尾慢慢地将你的手从她湿润的裂缝中拉出来，并引导你顺着她的臀部向上，直到你在她的口袋里发现了一些隐藏的东西。她的尾巴在那个又长又硬的形状上摩擦了几次，然后你抓住并从你爱人的裙子里拉出一个长长的黑色橡胶物体：她的双头假阳具。");
            outputText("[pg]你问玛布尔，你有没有可能找到了她想要的东西？");
            outputText("[pg][say: 为什么这么问，亲爱的？是什么让你看出来的？]");
            outputText("[pg]只是一种直觉。");
            outputText("[pg]你调整了一下握着她私人玩具的姿势，将其中一端抵在她早已准备好的女性私处上。正当你准备问她是否准备好时，她的尾巴突然向前一抽，将玩具滑入她的体内。当这根假阳具迅速滑入她的深处直到中间部分时，她喘息了一声，然后当你试图把它拔出来时，她咯咯地笑了起来。不幸的是，你发现她紧紧地夹住了它。");
            outputText("[pg][say: 怎么了，亲爱的？你该不会是被卡住了吧？来，让我帮你一把……]");
            outputText("[pg]突然，她的尾巴反向施压，让你能把她的玩具从套子里拔出来——至少拔出了一点。然后，你自己也改变了方向，把它推回了根部。你可爱的爱人猛地吸了一口气，你轻轻拍了一下她的屁股。作为回应，她紧紧抓住了你的手腕，听起来她似乎要对你生气了。但相反，她轻笑了一声。");
            outputText("[pg][say: 好了，不逗你了。毕竟你可不仅仅是个玩物。我得让你做点什么。]");
            outputText("[pg]最后，她允许你自由地为她带来快感，挑逗她的身体。你可以专注于让她达到极乐的性高潮，把玩她那美妙丰满的臀部，用她的假阳具扭动和抽插，伴随着淫荡的吧唧声，这声音在挤奶机的嗡嗡声和玛布尔愉悦的呻吟声中隐约可闻，最后，还有她尾巴的颤抖。这条尾巴就像是你爱人隧道的微妙指南。");
         }
         outputText("[pg]你太投入了，几乎没注意到你的牛娘伴侣发出了一声长长低沉的狂喜呼唤。那声呼唤介于牛叫和长叹之间，你已经非常熟悉了。与此同时，她设法把软管从乳房上弄了下来，她的奶水溅在隔间的地板上，然后逐渐减慢成涓涓细流，最后只剩下几滴。");
         if(_loc1_ > 0)
         {
            outputText("[pg]终于，对你根部的紧握放松了，你终于能在她体内爆发。她的尾巴慢慢从你身上滑落，软绵绵地落在你们身体连接处的旁边。你喘息着呻吟了几声，问玛布尔她是否满意。");
         }
         else
         {
            outputText("[pg]她紧紧地抓住了你的手，你别无选择，只能松开她的假阳具，拼命地挣扎着把被勒紧的手臂从她的尾巴里抽出来。当你终于挣脱出来时，你开始揉搓你发麻的手指，并问玛布尔，把你的手弄麻是不是她满足的标志。");
         }
         outputText("[pg]你的爱人直起身子，转过身来面对你。她用严厉的目光注视了你一会儿，然后把你拉进一个深深的法式热吻中。[say:好吧，如果你总是那么擅长听从指示，我不知道我怎么会不满足。]");
         FlagDict_Impl_.arrayWriteFloat(KFLAGS.flags,3,10);
         if(_loc1_ >= 0)
         {
            get_player().orgasm("Generic");
            marblePreggoChance();
         }
         else
         {
            _loc3_ = int(10 + get_player().lib / 10);
            dynStats(DynStat.Lust(_loc3_));
         }
         doNext(get_camp().returnToCampUseTwoHours);
      }
      
      public function milkMarbleBarCunnilingling() : void
      {
         clearOutput();
         outputText("你让玛布尔松开你的手腕，这样你就能找到一个更好的姿势来照顾她。你感到一阵渴望，想要去采集她其他的女性体液。");
         outputText("[pg][say:当然了，亲爱的，我下面感觉很湿。我绝对认为我需要你来处理一下。]");
         outputText("[pg]她松开了你，让你跪在她身后，好好闻闻她浓郁的女人味。这让你的大脑陷入了几秒钟的迷茫，然后一阵风把你拉回现实，她的尾巴在她的入口上方左右摇摆，尾根急切地抬起。你把头靠在她的入口一侧，靠在她的屁股和大腿交界处，同时让一只手在她的另一条腿上游走。");
         outputText("[pg]爬了一会儿后，你发现你的手指正绕着她臀部那条野兽般的尾巴根部。你突然有了一个主意，于是你评论说，在开始收获之前，你需要先给她刷一刷。");
         outputText("[pg][say:哦？你这是什么意思？]她有些困惑地回应道。");
         outputText("[pg]你没有回答，而是用拇指和食指圈成一个小环，让她的尾巴在里面穿过，任由它甩动摇摆。当你摸到尾巴末端浓密的毛发时，你收紧了握力，将这把“刷子”引向了她女性私处的入口。");
         outputText("[pg][say:哦！哦哦哦哦哦……]");
         outputText("[pg]这里小心地轻点一下，那里再深入地扫一扫，你觉得她已经准备好被收获了。你从“刷子”上沾了一滴她的淫液，尝了尝味道。你对玛布尔淫液的质量简短地表示了赞赏，然后一头扎进了她的小穴。当你大口吞咽她的淫液，舔舐她的褶皱，品尝她所能提供的一切时，她那深沉的泥土气息充满了你的脑海。你听到她发出轻柔的愉悦呻吟，似乎在认可你的努力，这声音在上方挤奶机的嗡嗡声中勉强可以听见。");
         outputText("[pg]现在可以随心所欲了，你发现玛布尔的尾巴卷住了你的后脑勺，正拼尽全力把你往她的后庭里推。与此同时，你爱人的臀部左右摇摆着，让你的脸在她的裂缝上摩擦，把她的淫液涂满你的[face]。为了稳住自己，你抓住了她那宽大臀部的两把软肉，稍微低下了头。这个动作让她的爱之豆对准了你的嘴，而她的通道则对准了你的鼻子。你再次被这气味所淹没，毫无理智地舔舐着她的淫液和肿胀的阴蒂。");
         outputText("[pg][say: 哦，是的，是的！太棒了啊啊啊啊啊！] 玛布尔又大叫了几声，因为你为了采集她而付出的努力，她迎来了高潮。你的奖励是完全被你一直采集的甜美花蜜浸透，你用嘴和[tongue]接住的每一滴都在瞬间被吞下。最后，当她的淫液流干时，你实际上还有点失望。");
         outputText("[pg]你再次在她柔软的屁股上蹭了蹭，并调皮地拍打了她的尾巴一会儿。");
         outputText("[pg][say: 嗯，我得说，你让这样站着变得很值得，[name]。我想，如果你能保持这种水平的表现，我可能愿意再来一次。]");
         outputText("[pg]你笑着向玛布尔保证，只要是关于她的事，你总是会全力以赴。就在你离开之前，一个恶作剧的念头在你的脑海中闪过，你把她尾巴上的毛刷滑到玛布尔的入口处，并把它往里推了一小段。玛布尔被这突如其来的感觉吓了一跳，你解释说你只是在清理一些可能还藏在里面的散落的淫液。");
         outputText("[pg]过了一会儿，她的尾巴从通道里抽了出来，她对你摇了摇头。[say: 谢谢你的好意，亲爱的，但请不要现在又让我兴奋起来，除非你打算再伺候我一次。]");
         outputText("[pg]好吧，你暂时停止了戏弄。");
         FlagDict_Impl_.arrayWriteFloat(KFLAGS.flags,3,15);
         var _loc1_:int = int(10 + get_player().lib / 10);
         dynStats(DynStat.Lust(_loc1_));
         dynStats(DynStat.Sens(1));
         var _temp_1:* = get_game().time;
         _temp_1.hours = _temp_1.hours + 1;
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function milkMarble() : void
      {
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1168) < 1)
         {
            outputText("玛布尔的眼中闪烁着异样明亮的光芒，她走到你面前问道：[say: 嘿，亲爱的，我正准备去挤奶，突然意识到你还从来没有陪我一起去过。你想不想参观一下惠特尼为我准备的设备？] 接着，她脸上闪过一丝调皮的神色，[say: 也许我们还能做点……亲密的事？]");
            outputText("[pg]至少去看看她的隔间也没什么坏处。你同意和她一起去。");
            outputText("[pg]你们俩手牵手，迅速传送到了惠特尼的农场。玛布尔向农场主挥了挥手，然后护送你去了谷仓。这里的气味还是那么熟悉，但这次的行程感觉有些不同寻常，因为你要去参观一个你从未去过的房间。");
            outputText("[pg]你的爱人向你展示了写有她名字的隔间，并把你迎了进去。这个房间相当舒适，中央有一把带软垫的大椅子和一张小桌子，一侧是齐腰高的栏杆，另一侧是一条长凳。挤奶机挂在天花板的轨道上，可以在房间的任何地方使用。");
            outputText("[pg]你那多情的向导生动地向你介绍着她这些家具的用途：那把椅子是她平时看书时坐的，如果腿酸了就靠着栏杆，要是实在累坏了就躺在长椅上。等她说完，你注意到桌子上正放着一本书，便问玛布尔在看什么。她一反常态地有些紧张，咬了咬大拇指，低声说那是你对她上瘾时，她为了做研究而看的那本书。");
            outputText("[pg]你现在非常好奇，问她书写得怎么样，还有多久能看完。[say:有点不好意思，亲爱的，其实我才刚开始看。不像我妹妹，我以前从来不看书，直到挤奶时需要找点事做才开始看，而且我真的很不擅长阅读。就算我每天花好几个小时看书，看完一本也要花上好几个月……]");
            outputText("[pg]你为提起这件事道了歉，并建议也许你们该开始挤奶了？");
            outputText("[pg]她立刻精神起来，拉下了");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,465) < 1)
            {
               outputText("两个");
            }
            else
            {
               outputText("八个");
            }
            outputText("吸盘从挤奶机上取下，小心翼翼地贴在她的乳头上，然后拨动开关，机器开始运转。瞬间，乳汁开始从她的" + marbleNips() + "流出，进入吸盘，然后顺着透明的管子流入机器。她发出一声放松的叹息，然后把目光转回你身上。");
            outputText("[pg][say: 那么亲爱的，你有什么想做的事吗？]");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1168,1);
         }
         else
         {
            outputText("感觉到玛布尔似乎很快就要被挤奶了，你主动提出亲自护送她去她的隔间。");
            outputText("[pg]像往常一样，玛布尔对这个提议感到很高兴，立刻答应了，然后你们俩一起前往她在惠特尼农场里那个舒适的小空间。");
            outputText("[pg]一旦玛布尔安顿好并连接好机器，她转向你，问你是否有什么想法。");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1059) >= 5)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1055,0);
         }
         menu();
         addButton(0,"舔阴",milkMarbleCunnilingling);
         if(get_player().hasCockThatFits(marbleCuntCapacity()) && (get_player().isBiped() || get_player().hasTailInsteadOfLegs() || get_player().isGoo()))
         {
            addButton(1,"操她",milkMarbleFuckDatCowPussy);
         }
         if(get_player().hasVagina() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,4) > 0 && (get_player().isBiped() || get_player().isGoo()))
         {
            addButton(2,"被她操",milkMarbleTakeHerDick);
         }
         addButton(3,"她在吧台",milkMarbleOnTheBar);
         setExitButton("离开",milkMarbleNoMilking);
      }
      
      public function marbleWarningStateMeeting() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_marble());
         outputText("走过农场的一块田地时，你注意到牛娘玛布尔正从前面的谷仓里出来。当她看到你时，她露出了一丝恼怒的表情，然后换上假笑说道：[say: 怎么了？有什么我可以帮忙的吗？还是你又要走了？] 嗯……这可不太友好。你们俩之前的开局并不算好，但也许你想纠正一下？另一方面，如果你道歉，她可能会让你吸吮她的乳房；也许现在最好还是避开她——或者干脆永远避开？不过话说回来，你也可以因为她对你的态度而挑起一场争斗。");
         menu();
         addButton(0,"道歉",apologizeToWalkingTitsIMEANMARBLE);
         addButton(1,"挑衅",pickAFight);
         addButton(2,"永远离开",leaveNonFriendsMarble4EVERRRR);
         addButton(14,"离开",leaveNonFriendsMarble);
      }
      
      public function marbleSprite(param1:Boolean = false) : void
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,465) < 2)
         {
            spriteSelect(SpriteDb.get_s_marble());
         }
         else
         {
            spriteSelect(SpriteDb.get_s_marble_cow());
         }
      }
      
      public function marbleSleepToggle() : void
      {
         clearOutput();
         if(FlagDict_Impl_.arrayReadString(KFLAGS.flags,701) != "Marble")
         {
            outputText("玛布尔说道，[say: 听起来真不错，亲爱的。]");
            FlagDict_Impl_.arrayWriteString(KFLAGS.flags,701,"Marble");
         }
         else
         {
            outputText("玛布尔双臂抱在丰满的胸前，叹了口气，[say: 既然你这么说，亲爱的。]");
            FlagDict_Impl_.arrayWriteString(KFLAGS.flags,701,"");
         }
         menu();
         addButton(0,"继续",interactWithMarbleAtCamp);
      }
      
      public function marbleSexMenu() : void
      {
         menu();
         addNextButton("发泄",marbleSexExpanded).hint("和玛布尔抱在一起，快速地做个爱。").disableIf(get_player().get_lust() < 33,"你还不够饥渴，没法做爱。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1059) < 5 && FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,3) >= 20 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1059) >= 5 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1055) >= 4)
         {
            outputText("[pg]<b>玛布尔不舒服地扭动着身子，也许她需要挤奶了？</b>");
            addNextButton("挤奶",milkMarble);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1059) >= 5)
         {
            addNextButton("吃奶",get_marblePurification().nursingFromPureMarble).hint("让玛布尔直接从“源头”给你喂奶。可以这么说。");
         }
         setExitButton("返回",interactWithMarbleAtCamp);
      }
      
      public function marbleSexFinish() : void
      {
         var _g:Camp;
         outputText("[pg]你滚到一边，你们俩很快就睡熟了。你打算明天早上再清理自己。");
         get_player().orgasm("Generic");
         dynStats(DynStat.Sens(-1));
         _g = get_camp();
         doNext(function():void
         {
            _g.doSleep();
         });
      }
      
      public function marbleSexExpanded() : void
      {
         marbleCampFuckFUCKFUCKFUCK();
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function marbleSex2Continued(param1:int) : void
      {
         if(param1 < 0)
         {
            param1 = -param1;
            clearOutput();
         }
         if(param1 == 1)
         {
            outputText("玛布尔向后靠，邀请你过来。带着腼腆的笑容，你慢慢爬向她，每一个动作都让你们靠得更近，直到你趴在她的身上。她用双手环抱住你，完全躺下。你小心翼翼地对准你的[cock]，挺进她温暖的阴道。");
            if(get_player().cocks[0].cockLength < 8)
            {
               outputText("你轻松地滑入她的深处，然后开始饥渴地抽插。");
            }
            else
            {
               outputText("她无法完全容纳你，但你并没有气馁，开始饥渴地抽插。");
            }
            outputText("她微微喘息，双臂紧紧抱住你，");
            if(get_player().get_tallness() < 60 && get_player().get_tallness() >= 48)
            {
               outputText("把你的头紧紧锁在她的双乳之间。");
            }
            else
            {
               outputText("把你的身体紧紧锁在她的身上。");
            }
            outputText("她紧紧的拥抱并没有减缓你的抽插，反而帮助你们越来越接近甜蜜的释放。最后，你尽力挺进她的体内");
            if(get_player().cocks[0].cockLength < 8 && get_player().hasKnot(0))
            {
               outputText("，伴随着“啵”的一声，你的肉结滑入她的体内");
            }
            outputText("。在她的深处，你的" + get_player().cockDescript(0) + "爆发了。片刻之后，玛布尔也感受到了高潮，她的拥抱变得极其紧密。你听到她发出一声听起来几乎像牛叫的叹息，然后她的拥抱放松了。你们俩躺在那里喘着粗气，你的[cock]仍然在她的体内。[pg]");
         }
         else
         {
            outputText("玛布尔对你咧嘴一笑，伸手进床边迷你梳妆台的抽屉里，拿出一根长长的双头假阳具。她将一头滑入自己的穴中，然后邀请你过去。你带着娇羞的笑容，慢慢向她爬去，每一个动作都让你们靠得更近，直到你将你的" + get_player().vaginaDescript(0) + "套在假阳具的另一头。玛布尔叹了口气，躺在你身下，开始前后摇摆。作为回应，你也加入了你自己的动作。很快，你们俩就互相贴着喘息呻吟，假阳具在你们之间滑动。突然，她紧紧地用双臂抱住你，并且");
            if(get_player().get_tallness() < 60 && get_player().get_tallness() >= 48)
            {
               outputText("把你的头挤进她的双乳之间。");
            }
            else
            {
               outputText("把你紧紧拉向她。");
            }
            outputText("玛布尔因快感而颤抖，更加卖力地抽插着假阳具，很快也将你推向了高潮");
            if(get_player().totalCocks() > 0)
            {
               outputText("。你的[cocks]在你们紧贴的身体间爆发了");
            }
            outputText("。她的动作渐渐缓和下来，你们俩躺在那里喘息着，假阳具依然连接着你们。你能听到玛布尔小声嘀咕：[say: 这比我自己弄要爽多了……][pg]");
            get_player().cuntChange(8,true);
         }
         if(!get_player().hasStatusEffect(StatusEffects.FuckedMarble))
         {
            outputText("几分钟后，玛布尔打破了沉默。[say: 亲爱的，那真是太棒了。你对我来说真的很特别，你知道吗？请记住这一点。]你也知道你们的关系很特别；你不会很快忘记玛布尔的。");
            get_player().createStatusEffect(StatusEffects.FuckedMarble,0,0,0,0);
         }
         else
         {
            outputText("玛布尔叹了口气，给了你一个大大的微笑。[say: 亲爱的，和你在一起还是那么美妙。我总是期待着我们在一起的时光，]她对你说。你很赞同她的话。");
         }
         get_player().orgasm("Generic");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function marbleRapeCorruptFantasy() : void
      {
         outputText("玛布尔在你占据优势的猛攻下毫无还手之力，你发现把人这样压在身下真是无比享受。你开始幻想，如果每个人在你面前都变成这样会是什么感觉。你想象着一片屁股和小穴的海洋，全都高高翘起，任你随意蹂躏，而这些主人却无能为力。[pg]");
         if(get_player().cor >= 66)
         {
            outputText("你摇了摇头，将这离奇的幻想抛之脑后，重新投入到眼前的享受中。[pg]");
         }
         else
         {
            outputText("你暗自微笑，心想，[say:总有一天，]然后重新投入到眼前的享受中。[pg]");
         }
      }
      
      public function marblePreggoChance() : void
      {
         if(pregnancy.knockUpChance() && (get_player().hasPerk(PerkLib.MarblesMilk) || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1059) >= 5))
         {
            pregnancy.knockUp(25,720);
         }
      }
      
      public function marblePregWithPCKids() : Boolean
      {
         if(pregnancy.get_type() == 25)
         {
            return pregnancy.get_incubation() <= 280;
         }
         return false;
      }
      
      public function marblePoopsBaybees() : void
      {
         var _g:Camp;
         var _loc1_:* = null as IMap;
         var _loc2_:int = 0;
         var _loc3_:* = null as ItemType;
         var _loc4_:* = null as Inventory;
         if(pregnancy.get_type() == 25)
         {
            outputText("[pg]玛布尔一脸关切地冲向你。[say: 亲爱的，时间到了！我们的孩子要降生了！]她蹲下来，让你跪在她身边，把你的手放在她现在大张的女性私处。你能感觉到有什么东西正开始从洞口出来，你开始鼓励玛布尔，她继续大口喘气，偶尔因为用力把孩子推出来而发出咕哝声。[pg]");
            outputText("当头从她的洞里出来时，你可以看到它有小小的像角一样的突起和可爱的小牛耳。你对玛布尔喊道，你能看到头了，而且它已经开始长得像她了。你听到玛布尔在呼吸间发出一声幸福的笑声，她继续用力把孩子推出来。你注意到玛布尔周围的气味现在有点不同，虽然你无法准确判断区别在哪里。[pg]");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1051) > 0 && Utils.rand(2) == 0)
            {
               outputText("仅仅几分钟后，孩子就被玛布尔完全推了出来，她满意地叹了口气。你看着孩子开始大哭，看到这确实是你们俩带到这个世界上的一个小牛男孩。你已经可以看出他拥有他母亲所有的牛类特征，除了性别。小男孩的脸真的很可爱；你确信他长大后会成为一个强壮英俊的男人。");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1052) == 0)
               {
                  outputText("[pg]当你把男孩递给玛布尔时，她惊讶地看了男孩一会儿，然后把哭泣的孩子抱在胸前。小男孩立刻停止了哭泣，开始急切地吞咽玛布尔的乳汁[pg]");
                  outputText("你问她刚才为什么犹豫。[say:哦？]她抬起头看着你，[say:抱歉，亲爱的，我只是没想过我会生个男孩。我从来没想过。]然后她的表情变了。");
               }
               else
               {
                  outputText("[pg]你把孩子递给玛布尔，她把哭泣的孩子抱在胸前。小男孩立刻停止了哭泣，开始急切地大口吸吮玛布尔的乳汁。");
               }
               outputText("[pg][say:天哪，]玛布尔对你说，[say:这感觉就像我的奶水还让人上瘾时，你吸吮我一样美妙；我都快忘了这种感觉了。]");
               outputText("[pg]玛布尔看了一会儿她的另一边乳房，然后看着你说：[say:不过，我想另一边也需要你。]你顺从地吸吮她的另一边乳房。");
               outputText("[pg]当你们两个都吃饱喝足后，玛布尔把孩子放进了育婴室。小男孩看起来已经有几岁大了，正迈着小蹄子到处跑。玛布尔转头看着你说：[say:嗯，亲爱的，我现在想不出什么好名字，我明天再想吧。]");
               _loc1_ = KFLAGS.flags;
               FlagDict_Impl_.arrayWriteInt(_loc1_,1052,FlagDict_Impl_.arrayReadInt(_loc1_,1052) + 1);
            }
            else
            {
               outputText("短短几分钟后，玛布尔就将孩子完全生了出来，她满意地叹了口气。你看着开始大哭的孩子，发现你们带到这个世界上的确实是一个小牛娘。你已经能看出来，她拥有玛布尔所有的牛类特征");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,4) > 0)
               {
                  outputText("，但你注意到她没有任何形式的阴茎。看来这个特征并没有遗传下来");
               }
               outputText("。小女孩的脸蛋非常漂亮；你确信她长大后会像她妈妈一样。你把孩子递给玛布尔，她把哭泣的孩子抱在胸前。小女孩立刻停止了哭泣，开始急切地大口吞咽着玛布尔的乳汁。[pg]");
               if(get_player().hasPerk(PerkLib.MarblesMilk))
               {
                  outputText("[say: 别担心，亲爱的，] 玛布尔对你说，[say: 不知怎么的，我知道她不会上瘾的。]");
               }
               else
               {
                  outputText("[say: 哎呀，] 玛布尔对你说，[say: 这感觉就像我的奶水还会让人上瘾时，你吸吮我一样美妙；我都快忘了这种感觉了。]");
               }
               outputText("玛布尔看了看她的另一边乳房，然后看着你说道：[say:不过，我想我另一边也需要你。]你顺从地吸吮起她的另一边乳房。[pg]");
               outputText("当你们两个都心满意足后，玛布尔把孩子放进了育儿室。小女孩看起来已经有几岁大了，并且已经在用她的小蹄子到处小跑了。玛布尔转头看着你，问道：[saystart]好吧，我给她起名叫");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,8) == 0)
               {
                  _loc2_ = Utils.rand(10);
                  switch(_loc2_)
                  {
                     case 0:
                        outputText("奥拉");
                        break;
                     case 1:
                        outputText("米兰");
                        break;
                     case 2:
                        outputText("林");
                        break;
                     case 3:
                        outputText("玛丽");
                        break;
                     case 4:
                        outputText("贝丝");
                        break;
                     case 5:
                        outputText("蒂娜");
                        break;
                     case 6:
                        outputText("瑞尔");
                        break;
                     case 7:
                        outputText("温蒂");
                        break;
                     case 8:
                        outputText("蕾妮");
                        break;
                     case 9:
                        outputText("妮基");
                        break;
                     default:
                        outputText("格丽奇");
                  }
                  outputText("，嗯，这个名字很适合她。[sayend]");
               }
               else
               {
                  outputText("……嗯，亲爱的，我现在想不出什么好名字，我明天再想一个。[sayend]");
               }
            }
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,8,FlagDict_Impl_.arrayReadInt(_loc1_,8) + 1);
            doNext(playerMenu);
         }
         else if(pregnancy.get_type() == 5)
         {
            outputText("[pg]你听到岩石隐蔽处传来呻吟声，便走过去查看。你发现玛布尔蹲在地上，身旁有一小堆");
            if(Utils.rand(2) == 0)
            {
               outputText("蛋。你问她发生了什么事，但玛布尔打断了你，微微咕哝了一声，然后排出了最后一颗蛋并站了起来。[say: 亲爱的，我已经把那瓶药剂产生的蛋都生完了，]她对你说，然后深吸了几口气继续说道，[say: 我本来以为它们会更大一点，不过这也没关系。你可以拿走其中一颗，但只能拿一颗，好吗？][pg]");
            }
            else if(Utils.rand(2) == 0)
            {
               outputText("一大堆蛋。看起来有一颗类似的蛋正从她的下体中排出；它很快掉到地上，玛布尔把它和其他蛋推到了一起。看起来她已经这样持续了一段时间了。你把手放在她的肩膀上，问她发生了什么事。她转过身对你说，[say: 啊，亲爱的，只是在生那瓶药剂产生的蛋。我想还有一颗。]她咕哝着排出了最后一颗蛋，然后把它和其他蛋放在一起。[say: 你可以拿走其中一颗，但只能拿一颗，好吗？][pg]");
            }
            else
            {
               outputText("一大堆蛋。随着一颗又一颗蛋扑通扑通地掉下来，她不停地喘息和呻吟。你简直不敢相信自己的眼睛，竟然有这么多蛋排出来，而且玛布尔似乎很享受这个过程。一分钟后，蛋停止了排出，但玛布尔仍然蹲在那里咕哝着。你走到她身边，抓住她的肩膀，强迫她看着你的眼睛，告诉她已经没有了。她茫然地看了你一会儿，然后摇了摇头，把手放在肚子上。[say: 哦，亲爱的，看来我已经把那瓶药剂产生的蛋都生完了。比我预想的要多得多，我想我走神了。感觉太棒了……]她的眼睛又开始变得呆滞，你摇了摇她。[say: 哦！抱歉，呃，去拿一颗蛋吧，但请只拿一颗，好吗？][pg]");
            }
            outputText("玛布尔站起来，伸展了一下双腿，然后哒哒地走开了。你耸了耸肩，看着那堆蛋，然后抓起了一颗看起来最漂亮的。[pg]");
            if(Utils.rand(3) == 1)
            {
               _loc3_ = get_consumables().LARGE_EGGS[Utils.rand(int(get_consumables().LARGE_EGGS.length))];
            }
            else
            {
               _loc3_ = get_consumables().SMALL_EGGS[Utils.rand(int(get_consumables().SMALL_EGGS.length))];
            }
            if(get_timeQ() > 0)
            {
               _loc4_ = get_inventory();
               _g = get_camp();
               _loc4_.takeItem(_loc3_,function():void
               {
                  _g.doSleep();
               });
            }
            else
            {
               get_inventory().takeItem(_loc3_,playerMenu);
            }
         }
      }
      
      public function marblePicksYouUpInitially() : void
      {
         clearOutput();
         outputText("她温柔地把你抱起来，带到她的床上。把你放在她的腿上，她抬起你的头凑近她的一个乳头，把你的嘴唇按在上面。她微笑着紧紧抱住你，你感觉到一股温暖美味的液体开始充满你的口腔。一旦尝到了她的乳汁，你就情不自禁地开始大口吞咽。过了一会儿，你听到玛布尔叹了口气，[say: 哦，亲爱的，这正是我需要的。我知道停下来一会儿很烦人，但你能把另一个乳头也吸一下吗？]她收回手，把你翻了个身，然后把你抬到她的另一个乳头前。这次你不需要任何鼓励，毫不犹豫地开始贪婪地吸吮起来。[say: 尽情喝吧，亲爱的，我知道我们都很享受这个。][pg]");
         get_player().refillHunger(30);
         outputText("等你喝够了，就把嘴从她的乳尖上移开，靠在她胸前。玛布尔双手环住你，然后——");
         if(get_player().ears.type > 0)
         {
            outputText("温柔地挠着你的耳后。");
         }
         else
         {
            outputText("轻轻地抚摸你的头。");
         }
         outputText("[say: 谢谢你温柔的小嘴，亲爱的，]她说道，[say: 你能告诉我你的名字吗？我叫玛布尔。]你轻叹一声，告诉她你是谁以及来访的原因。她咯咯地笑了起来，[say: 别担心，亲爱的，多亏了你，我现在感觉好多了。我真的很高兴能以这么愉快的方式认识你。]你觉得现在差不多该离开了，于是向这位牛娘道别。[say: 随时欢迎你再来看我；我期待着很快能再次见到你！]她对你笑容满面地说道。说完，你离开了农场，感到一种奇怪的愉悦感传遍全身。");
         set_marbleAffection(get_marbleAffection() + 30);
         set_marbleAddiction(get_marbleAddiction() + 10);
         applyMarblesMilk();
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function marbleOvulatesLikeMadDawg() : void
      {
         var _loc1_:int = 0;
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,9) < 100 && pregnancy.get_type() == 25)
         {
            outputText("玛布尔拒绝服用加速怀孕的药水，直到她建好育儿室。");
            doNext(get_camp().returnToCampUseOneHour);
            return;
         }
         if(pregnancy.get_isPregnant())
         {
            outputText("服下药水后，玛布尔的肚子微微咕噜作响。你们都能看出她的孕期提前了。");
            _loc1_ = pregnancy.get_incubation() - (40 + Utils.rand(30));
            if(_loc1_ <= 0)
            {
               _loc1_ = 1;
            }
            pregnancy.knockUpForce(pregnancy.get_type(),_loc1_);
         }
         else
         {
            outputText("服下药水后，玛布尔告诉你她觉得肚子很胀。听起来她很快就要产卵了。");
            pregnancy.knockUpForce(5,96);
         }
         get_player().consumeItem(get_consumables().OVIELIX);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function marbleNomNoms() : void
      {
         clearOutput();
         marbleSprite(true);
         FlagDict_Impl_.arrayWriteFloat(KFLAGS.flags,3,0);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,4) > 0)
         {
            get_player().slimeFeed();
            if(get_player().cor < 30)
            {
               outputText("你对做这种事并不是很自在，但你实在无法拒绝玛布尔。尤其是在你给了她那根" + marbleCock() + "之后。[pg]");
            }
            else
            {
               outputText("吸吮她看起来很美味的" + marbleCock() + "听起来会很有趣，你毫不犹豫地答应了。[pg]");
            }
            outputText("玛布尔掀起裙子，让你好好看看她那根非常勃起的" + marbleCock() + "。你在她上方摆好姿势，深吸了一口气，闻着她的气味。");
            if(get_player().hasStatusEffect(StatusEffects.SlimeCraving) || get_player().lib + get_player().cor - get_player().get_inte() > 35)
            {
               outputText("不知为何，你的头脑开始因为那野兽般的气味而感到有些模糊，有一瞬间你甚至忘了自己在做什么。但你很快就回过神来，因为一根多汁的" + marbleCock() + "就在你面前。它散发出如此好闻的气味；尝起来可能也很不错。你张开嘴，凑近它，将它含入嘴里。[pg]");
               outputText("你听到上方传来一声轻柔的叹息和呻吟，[say: 噢，亲爱的，]当你感觉到有什么东西放在你的后脑勺上，推着你向前时，它愉悦地说。那令人陶醉的香气如此浓烈，以至于你只能用舌头舔过这根美妙的" + marbleCock() + "的每一个部位，任由那只手引导你的动作，同时听着上方传来的快乐声音。那些声音和话语听起来很快乐，所以它们也让你感到快乐。[pg]");
               outputText("最后，你听到那只手的主人倒吸了一口气，一股咸咸的液体开始填满你的嘴。你本能地咽了下去，享受着它的味道。大约一分钟后，你终于能够集中思绪，意识到自己刚才有一瞬间失去了控制。从玛布尔脸上满足的表情来看，她似乎并没有察觉到。");
               dynStats(DynStat.Inte(-0.2),DynStat.Lib(-0.2));
            }
            else
            {
               outputText("野兽般的气味让你有些难以思考，但你还是勉强集中了精神。你稳住身子，低下头，伸出舌头舔了舔顶端。玛布尔发出赞许的呻吟，轻轻按住你的后脑勺，试图把你往下压。你没有反抗，张大嘴巴，将她肿胀的" + marbleCock() + "含入口中。[pg]");
               outputText("[say: 哦，亲爱的，请继续，这感觉太棒了！]你花了一会儿才意识到刚才和你说话的是玛布尔。她" + marbleCock() + "在你嘴里的味道和她的气味有着相似的效果，你需要集中相当大的注意力才能保持专注。尽管如此，你还是开始用嘴套弄她，引得上方传来非常兴奋的声音。没过多久，玛布尔就被快感淹没，将精液射进了你的嘴里。你转过头把精液吐了出来，玛布尔则花了一点时间平复呼吸。");
            }
         }
         else
         {
            outputText("玛布尔掀起裙子，让你清楚地看到她湿润的私处。你低下头，深吸了一口她野兽般的气味。这让你感到有些头晕目眩，一阵情欲席卷全身。你轻轻舔舐她湿润小穴的内壁，听到玛布尔发出一声赞许的叹息，然后你才真正开始动作。[pg]");
            outputText("她的味道几乎像蜂蜜一样，这迅速激励着你尽力舔舐她内壁的每一个角落。玛布尔把手放在你的后脑勺上，开始引导你去她想要的地方。你把舌头伸得越来越深，探索着你能触及的每一个部位。不过现在看来，玛布尔想让你进入正题；你很快就开始用舌头安抚和玩弄她的阴蒂，引得上方传来一阵阵兴奋的声音。最后，你听到她发出一声欢呼，她的私处喷出了汁液。[pg]");
         }
         outputText("[say: 太感谢你了，亲爱的。下次如果你有心情，也许我们可以一起找点乐子，]玛布尔说道。");
         dynStats(DynStat.Lust(Utils.rand(10) + get_player().lib / 10));
         doNext(playerMenu);
      }
      
      public function marbleNips() : String
      {
         if(!get_player().hasStatusEffect(StatusEffects.MarbleSpecials))
         {
            get_player().createStatusEffect(StatusEffects.MarbleSpecials,0,1,0,0);
         }
         if(get_player().statusEffectv2(StatusEffects.MarbleSpecials) == 0)
         {
            get_player().changeStatusValue(StatusEffects.MarbleSpecials,2,1);
         }
         if(get_player().statusEffectv2(StatusEffects.MarbleSpecials) == 1)
         {
            return "乳头";
         }
         if(get_player().statusEffectv2(StatusEffects.MarbleSpecials) == 4)
         {
            return "四乳头";
         }
         return "乳头(玛布尔乳头错误)";
      }
      
      public function marbleNip() : String
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,465) > 0)
         {
            return "四个乳头";
         }
         return "乳头";
      }
      
      public function marbleNightSleepFlavor() : Boolean
      {
         var _g:MarbleScene;
         var _loc1_:* = null as IMap;
         marbleSprite();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,9) == 0 && get_player().get_pregnancyType() == 8 && get_player().get_pregnancyIncubation() <= 128)
         {
            outputText("<b>玛布尔指着你怀孕的肚子告诉你，她很快就会开始为你即将出生的牛宝宝建造一个育婴室。</b>[pg]");
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,9,FlagDict_Impl_.arrayReadInt(_loc1_,9) + 1);
         }
         switch(pregnancy.eventTriggered())
         {
            case 2:
               outputText("<b>你注意到玛布尔似乎变胖了一些。</b>[pg]");
               break;
            case 3:
               outputText("<b>玛布尔的肚子变大了很多；她可能怀孕了。</b>[pg]");
               break;
            case 4:
               outputText("<b>玛布尔的肚子变大了；她显然怀孕了。");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,9) == 0 && pregnancy.get_type() != 5)
               {
                  _loc1_ = KFLAGS.flags;
                  FlagDict_Impl_.arrayWriteInt(_loc1_,9,FlagDict_Impl_.arrayReadInt(_loc1_,9) + 1);
                  outputText("她告诉你，她将有一段时间忙于为她的孩子建造育婴室。");
               }
               outputText("</b>[pg]");
               break;
            case 5:
               outputText("<b>玛布尔的孕期进一步发展，尽管她的身体结构使她没有因此而行动迟缓。</b>[pg]");
               break;
            case 6:
               outputText("<b>玛布尔可能快要生产了，因为她的肚子变得非常大。</b>[pg]");
         }
         if(get_player().hasStatusEffect(StatusEffects.Infested))
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,64) != 1)
            {
               outputText("当你准备躺下过夜时，你发现玛布尔已经先你一步躺下了。你躺在她旁边，但你忍不住希望你们俩能做爱。突然，你感觉到玛布尔的手抓住了你的[cock]。当其中一条虫子开始在你的肉棒里蠕动时，她发出了一声尖叫。她拉开毯子，仔细看了你的肉棒一会儿，然后卷起她的铺盖卷，搬到了营地的另一个地方，说道，[say: [name]，你要么把那些东西弄走，要么我就不和你睡在一起，也不和你做爱。][pg]");
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,64,1);
            }
            return false;
         }
         if(get_player().get_gender() == 0)
         {
            outputText("当你和玛布尔躺下准备过夜时，她在你耳边低语：[say: 亲爱的，如果不太麻烦的话，我真的很希望你能为我长出一根阴茎。如果你做不到，那至少能长个阴道吗？如果太麻烦我也能理解，我只是想把心里话说出来……] 在稍微调整姿势舒服些后，你们俩就睡着了。[pg]");
            return false;
         }
         if(FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,3) < 50 || get_player().get_gender() == 0)
         {
            outputText("当您准备躺下过夜时，您发现玛布尔已经先到了。");
            if(FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,3) < 0)
            {
               outputText("当您钻进铺盖卷时，她特意转过身背对着您。看来她还在生您的气。");
            }
            else if(FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,3) < 20)
            {
               outputText("当您钻进铺盖卷时，她心满意足地躺在您身边。");
            }
            else if(FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,3) < 30)
            {
               outputText("当您钻进铺盖卷时，玛布尔轻轻叹了口气。");
            }
            else if(FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,3) < 40)
            {
               outputText("当您钻进铺盖卷时，玛布尔有些焦躁不安地动来动去。");
            }
            else
            {
               outputText("当您钻进铺盖卷时，玛布尔似乎相当兴奋。");
            }
            if(get_player().get_lust() < 33 && FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,3) < 20)
            {
               outputText("在稍微调整姿势舒服些后，你渐渐进入了梦乡。");
            }
            else
            {
               if(get_player().get_lust() >= 33)
               {
                  outputText("您要问玛布尔是否想做爱吗？");
                  menu();
                  addButton(0,"询问",atNightAskMarbleForSomeSexMaybe);
                  addButton(1,"不问",playerMenu);
                  return true;
               }
               outputText("您想了一会儿，玛布尔是不是想从您这里得到更多。");
               if(Utils.rand(2) == 0)
               {
                  marbleCuddlin();
               }
               else
               {
                  outputText("然而，您并没有足够的性欲去考虑做爱。");
               }
            }
            outputText("");
            return false;
         }
         if(get_player().get_lust() < 33)
         {
            outputText("您躺下后注意到玛布尔还没睡。您决定不去多想，直到您听到玛布尔在外面哒哒哒地走过来。[say: 亲爱的？] 她一边爬到您身边一边呼唤您。[saystart]亲爱的，我感觉真的很饥渴，我知道你现在没心情，但你能帮帮我吗？[sayend] 您坐起来问她怎么了。她有些尴尬地看着您，然后问道：[saystart]你能");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,4) > 0)
            {
               outputText("吸我的" + marbleCock() + "吗？我真的，真的很需要。[sayend]");
            }
            else
            {
               outputText("舔我的小穴吗？我真的很想感受你的舌头让我高潮……[sayend]");
            }
            outputText("[pg]您要用口为玛布尔带来快感吗？");
            menu();
            addButton(0,"好",marbleNomNoms);
            addButton(1,"否",playerMenu);
            if(get_player().hasTailInsteadOfLegs() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,5) > 0)
            {
               addButton(2,"尾交",giveMarbleTailjobRelease);
            }
            else
            {
               addButtonDisabled(2,"尾交","这个场景需要你有一条娜迦尾巴。玛布尔应该有阴茎。");
            }
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1059) < 5)
         {
            outputText("你躺下后，发现玛布尔还没睡。你决定先不管它，直到你听到玛布尔在外面走动的声音。[say:亲爱的？]她一边爬到你身边一边喊你。[saystart]亲爱的，我感觉好饥渴。我能看出来你也想要，所以我们能做爱吗？[sayend]你坐起来，考虑她的请求。你要和玛布尔做爱吗？如果不，你也可以提出给她口交。");
            menu();
            _g = this;
            addButton(0,"是",function():void
            {
               _g.marbleNightSexIntro();
            });
            addButton(1,"否",playerMenu);
            addButton(2,"口交",marbleNomNoms);
         }
         else
         {
            clearOutput();
            outputText("就在你准备睡觉的时候，你注意到你的伴侣脸上的某种表情。毫无疑问，玛布尔今晚想找点乐子。");
            outputText("[pg][say:嘿，[if (!isfeminine) {帅哥|美女}]，是来护送我上床的，还是……？]她用手肘轻轻推了推你。");
            menu();
            addButton(0,"做爱",marbleNightLovemaking).hint("开始吧。");
            addButton(1,"睡觉",marbleNightRefusal).hint("今晚不行。");
         }
         return true;
      }
      
      public function marbleNightSexIntro(param1:Boolean = true) : void
      {
         if(param1)
         {
            clearOutput();
         }
         else
         {
            outputText("[pg]");
         }
         marbleSprite(true);
         var _loc2_:int = get_player().cockThatFits(marbleCuntCapacity());
         if(_loc2_ < 0)
         {
            _loc2_ = 0;
         }
         else if(get_player().get_gender() == 1 && get_player().cockArea(_loc2_) > marbleCuntCapacity())
         {
            outputText("你躺在她的身边，但你还是忍不住希望你们俩能做爱。突然，你感觉到玛布尔的手抓住了你的" + get_player().cockDescript(_loc2_) + "。她叹了口气说，[say:亲爱的，恐怕你进不去我里面。你觉得你能为了我变小一点吗？]在舒服地躺了一会儿后，你们俩就睡着了。");
            doNext(playerMenu);
         }
         outputText("就在那一刻，你感觉到玛布尔在你的耳边呼吸，[say:我知道你想要这个，不是吗，亲爱的？][pg]");
         if(get_player().get_tallness() < 60)
         {
            outputText("玛布尔把你翻转过来，让你仰面躺着，把你的头拉到她丰满的乳沟上。[say:我也想要。放松点，让我来处理。]玛布尔把你的头锁在她的乳沟里，用另一只手慢慢地脱掉你们俩的衣服。[pg]");
            outputText("整个过程中，你的头舒服地靠在玛布尔的乳房之间，她温暖的呼吸轻柔地吹在你的头发上。你感到几乎完全放松，但同时又被难以置信地激起了性欲。出于某种原因，躺在那里呼吸着她的气味，享受着她强迫你放松的奇妙的爱之枕，感觉就是对的。她的手顺着你的" + get_player().biggestBreastSizeDescript() + "滑下，温柔地对你咕哝着。她的手滑到你的");
            if(get_player().cockTotal() > 0)
            {
               outputText(get_player().multiCockDescriptLight());
               if(get_player().hasVagina())
               {
                  outputText("和你的");
               }
            }
            if(get_player().hasVagina())
            {
               outputText(get_player().vaginaDescript());
            }
            outputText("并温柔地抚摸你。她在你耳边低语，[say:很快，亲爱的，很快我们都会得到我们想要的。][pg]");
            outputText("帮你和她自己脱完衣服后，玛布尔松开了抓着你脑袋的手，把你的身体翻了过来。[pg]");
         }
         else
         {
            outputText("她伸出手放在你的腰上，轻轻地把手伸进你的内衣里，抚摸你的");
            if(get_player().cockTotal() > 0)
            {
               outputText(get_player().multiCockDescriptLight());
               if(get_player().hasVagina())
               {
                  outputText("和你的");
               }
            }
            if(get_player().hasVagina())
            {
               outputText(get_player().vaginaDescript(0));
            }
            outputText("同时你把手伸进她的衣服里，并且");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,4) > 0)
            {
               outputText("轻轻地揉搓她的" + marbleCock() + "。过了一会儿，你把手往下移，并且");
            }
            outputText("手指滑过她湿润的私处。你们在彼此的抚慰下颤抖着。两人都迅速地脱掉衣服，对接下来要发生的事越来越兴奋。脱掉衣服后，你翻身压在玛布尔身上。[pg]");
         }
         if(get_player().get_gender() == 3)
         {
            if(get_player().cockArea(_loc2_) <= marbleCuntCapacity())
            {
               outputText("[say:那么亲爱的，你今天打算用哪个部位？]她问你。");
               menu();
               addButton(0,"阴茎",marbleNightSexDudes);
               addButton(1,"阴道",marbleNightSexChicks);
            }
            else
            {
               outputText("玛布尔说，[say:好吧亲爱的，既然你那" + get_player().cockDescript(_loc2_) + "太大了，塞不进我里面，那我们就用你那" + get_player().vaginaDescript(0) + "吧。][pg]");
               doNext(marbleNightSexChicks);
            }
         }
         else if(get_player().get_gender() == 1)
         {
            doNext(marbleNightSexDudes);
         }
         else
         {
            doNext(marbleNightSexChicks);
         }
      }
      
      public function marbleNightSexDudes() : void
      {
         var _loc1_:int = get_player().cockThatFits(marbleCuntCapacity());
         if(_loc1_ < 0)
         {
            _loc1_ = 0;
         }
         FlagDict_Impl_.arrayWriteFloat(KFLAGS.flags,3,0);
         clearOutput();
         outputText("你轻轻地撑起身体，将你" + get_player().cockDescript(_loc1_) + "的顶端滑入她等待的洞口。你极其缓慢地将自己越推越深。每深入一英寸，玛布尔都会发出轻柔的呻吟和咕哝声，鼓励你继续前进。");
         if(get_player().cocks[_loc1_].cockLength > 8)
         {
            outputText("只有一件事能阻止你的前进：当你到达尽头时。[say:继续，亲爱的，还有空间。一定要把我完全填满。]伴随着一声呻吟，你的" + get_player().cockDescript(_loc1_) + "顶到了玛布尔的最深处，你再也无法前进了。[pg]");
         }
         else
         {
            outputText("没有什么能阻止你的前进；你的肉棒将完全被玛布尔的身体包裹。[say:没错，亲爱的……啊，让我完全包裹住你。]伴随着满足的叹息，你们的身体完全结合在了一起。[pg]");
         }
         outputText("你看着玛布尔的眼睛，你们俩都沉浸在这一刻；你们是两个恋人，以最令人愉悦的方式连接在一起。");
         if(get_player().cor + get_player().lib < get_player().statusEffectv4(StatusEffects.Marble) + 10)
         {
            outputText("你太沉浸在这一刻了，以至于玛布尔掌握了主动权。[say:好了，好了，让我等可不好，亲爱的，]她说着，抬起你的臀部，以相当快的速度不断地将你插入她的体内。你猝不及防，向前倒去，");
            if(get_player().get_tallness() < 66)
            {
               outputText("直接倒进了她丰满的胸膛。玛布尔对你的窘境咯咯直笑，但并没有停止移动你的臀部。你决定不再做任何反抗，就让玛布尔享受她的乐趣吧。毕竟，你也不是不喜欢这种情况。你已经能感觉到自己快要释放了，从玛布尔的呼吸声来看，她也是。[pg]");
            }
            else if(get_player().get_tallness() < 84)
            {
               outputText("你的" + get_player().biggestBreastSizeDescript() + "压在她可爱的双峰上。玛布尔微微一笑，然后在你的嘴唇上吻了一下。她一直不停地移动着你的臀部。当然，当你开始接近顶点时，你恢复了控制，开始自己主动地在她的体内抽插。你可以听到玛布尔的呼吸开始变得急促，她把手放在你的背上。她紧紧地抱住你，又给了你一个吻。[pg]");
            }
            else if(get_player().biggestTitSize() >= 4)
            {
               outputText("你的" + get_player().biggestBreastSizeDescript() + "直接砸在了玛布尔的脸上！你听到身下传来玛布尔沉闷的叫声，她把手从你的臀部拿开，把你从她身上抬了起来。");
            }
            else
            {
               outputText("重重地压在玛布尔身上，你的体型把她的乳房压得扁扁的。[say:嘿！]她大叫一声，松开你的臀部，把你的身体从她身上抬起来。");
            }
            outputText("你低头看着她恼怒的表情，然后对她咧嘴一笑，开始自己刺穿她那湿润而美妙的小穴。片刻之后，她的表情从撅嘴变成了狂喜。你们俩现在都接近顶点了。[pg]");
         }
         else
         {
            outputText("不过，这不足以让你退缩太久，很快你就在她的体内以你们俩都觉得舒服的节奏深深地抽插着。你对她微笑，她也对你微笑，你开始抚摸和把玩玛布尔可爱的双峰。她开始用手指抚摸自己的阴蒂，当你继续将你的" + get_player().cockDescript(_loc1_) + "在她的体内抽插时，她快乐地叫了出来。[pg]");
            if(get_player().biggestTitSize() >= 2)
            {
               outputText("你把手收回来，开始在你的" + get_player().biggestBreastSizeDescript() + "上游走，把玩和挑逗着你的乳头，而你的" + get_player().cockDescript(_loc1_) + "继续在玛布尔的体内猛烈地抽插。玛布尔很快就把手放在了你空出来的乳房上，显然她和你一样享受着挑逗自己的乐趣。你们俩都因为这种刺激而快乐地叫了出来；你能感觉到你的高潮正在快速逼近。[pg]");
            }
            else
            {
               outputText("这种感觉很快就让你受不了了，你什么也做不了，只能专注于你的" + get_player().cockDescript(_loc1_) + "在她美妙的体内抽插的感觉。玛布尔对你的困境咧嘴一笑，并挑逗道，[say:我是不是让你太受不了了，亲爱的？啊！]她喘着粗气；看来你也让她太受不了了。[pg]");
            }
         }
         outputText("当你感觉到你的内脏在翻腾，玛布尔的肉壁紧紧地收缩着压在你身上时，你喘着粗气。再一次，你们几乎在同一时间把彼此带到了极乐的高潮。");
         if(get_player().cumQ() < 250)
         {
            outputText("当你的" + get_player().cockDescript(_loc1_) + "在她的体内释放出它的精华时，玛布尔快乐地叫了出来。");
         }
         else
         {
            outputText("当你把她的体内填得几乎要爆炸，大量的精液从她的缝隙周围溢出时，玛布尔在快乐和痛苦中喘息着。");
         }
         if(get_player().totalCocks() > 1)
         {
            outputText("当然，");
            if(get_player().totalCocks() > 2)
            {
               outputText("你剩下的[cocks]");
            }
            else
            {
               outputText("你的另一个工具");
            }
            outputText("释放出它自己的精华，慷慨地覆盖了你们俩。");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,4) > 0)
         {
            outputText("被夹在你们的身体之间，玛布尔的" + marbleCock() + "痉挛着，喷洒在你们俩身上。");
         }
         marblePreggoChance();
         marbleSexFinish();
      }
      
      public function marbleNightSexChicks() : void
      {
         FlagDict_Impl_.arrayWriteFloat(KFLAGS.flags,3,0);
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,4) == 0)
         {
            outputText("你轻轻抬起身子，玛布尔拿出了她的双头假阳具，将一端滑入她的阴道。你对她微笑着，慢慢放低身体，将你的" + get_player().vaginaDescript(0) + "刺入那根人造肉棒。");
            get_player().cuntChange(14,true);
            outputText("在适应了体内那根肉棒的感觉后，你无法否认这样连接在一起的感觉是多么美妙。");
            if(get_player().cor + get_player().lib < get_player().statusEffectv4(StatusEffects.Marble) + 10)
            {
               outputText("玛布尔对你咧嘴一笑，开始上下抬动你的臀部，同时她自己的臀部也跟着弹跳。这样的结合导致你的" + get_player().vaginaDescript(0) + "和玛布尔的阴道都被她的双头假阳具像活塞一样抽插着。你们俩因为这压倒性的快感开始齐声呻吟，让你除了任由她像一辆颠簸的马车一样将你抛来抛去之外什么也做不了，而你享受着这每一秒。[pg]");
               outputText("[say: 哦，亲爱的，我弄得太快了吗？来，让我给你个喘息的机会。]她一边说着，一边放慢了快速的动作，让你的思绪重新安定下来。[pg]");
               if(get_player().biggestTitSize() >= 4)
               {
                  outputText("玛布尔把手从你的臀部移开，让你按照自己的节奏在她身上起伏。当你下降时，她依然会迎合你；当你上升时，她也会随之下降，配合着你的节奏。但她的双手有了更紧迫的任务：你的" + get_player().biggestBreastSizeDescript() + "。玛布尔开始熟练地用手挑逗和把玩你的" + get_player().biggestBreastSizeDescript() + "。她似乎知道所有正确的指法，显然对自己的胸部有着丰富的经验，你忍不住在她的抚摸下呻吟起来。她自己也愉悦地咯咯笑着喘息；看来她可能和你一样享受这场游戏！[pg]");
               }
               else
               {
                  outputText("玛布尔觉得现在是开始把玩你的" + get_player().biggestBreastSizeDescript() + "的好时机，于是用一只手开始挑逗你的[nipple]，另一只手继续温柔地托着你起伏。你在她的服侍下轻声呻吟，她微笑着对你说：[say: 你知道吗，亲爱的，也许你那可爱的小乳房可以再大一点。我敢肯定，到那时我能对你做些很棒的事。]她脸上依然挂着笑容，喘息着，你们俩都感觉到高潮即将来临。[pg]");
               }
            }
            else
            {
               outputText("你发出一声发情的呻吟，开始在她的假阳具上上下弹跳，享受着它在你体内的感觉。玛布尔因为这突如其来的快速刺激而喘息，开始在你身下的地上无助地扭动。你低头对她咧嘴一笑，继续着你起伏和摇摆的动作。你放慢了片刻速度，以便能好好抓住她丰满的乳房。[pg]");
               outputText("[say: 亲爱的！]当你开始把玩她的乳房时，玛布尔喘息着说。");
               if(get_player().biggestTitSize() >= 4)
               {
                  outputText("她伸出手，开始把玩你的" + get_player().biggestBreastSizeDescript() + "，以你把玩她乳房的同样节奏弹拨和戏弄着它们。你们俩开始了一场友好的小比赛，看谁能更好地刺激对方的胸部；与此同时，你继续在她上方起伏。[pg]");
               }
               else
               {
                  outputText("玛布尔伸出手抓住你的手，将它们紧紧地拉向她的胸部。她让你轮流把玩她的每一个" + marbleNips() + "，确保你以恰到好处的方式弹拨和挑逗它们，让她一次又一次地在狂喜中叫喊出声。[pg]");
               }
               outputText("不一会儿，你在假阳具上快速的活塞运动将你们俩推得越来越接近边缘。");
            }
            outputText("当你的" + get_player().vaginaDescript(0) + "紧紧夹住她假阳具的一端，而她的阴道紧紧夹住另一端时，你们俩在高潮中大叫出声。");
            if(get_player().totalCocks() > 0)
            {
               outputText("与此同时，你的[cocks]将自己的精液喷洒在玛布尔的胸部和肚子上。");
            }
            outputText("在美妙的刺激下，你们俩又颤抖了一下，然后瘫倒在彼此身上。");
         }
         else
         {
            get_player().slimeFeed();
            outputText("你轻轻地将自己抬到半空中，引导你的" + get_player().vaginaDescript(0) + "对准她那等待着的" + marbleCock() + "的顶端。你慢慢地将你的" + get_player().vaginaDescript(0) + "降到她颤抖的" + marbleCock() + "上，一寸一寸地深入");
            if(get_player().vaginalCapacity() > FlagDict_Impl_.arrayReadInt(KFLAGS.flags,5) * FlagDict_Impl_.arrayReadInt(KFLAGS.flags,6))
            {
               outputText("直到她完全进入你的体内。你们俩舒服地颤抖着，玛布尔说：[say: 哦，亲爱的，你全吃进去了。像这样进入另一个女人的身体是我永远也无法真正习惯的事情，但我无法否认这感觉有多好。][pg]");
            }
            else
            {
               outputText("直到你到底了，再也吃不下她更多了。[say: 进不去了？]玛布尔有点伤心地问你，[say: 你确定不能再多吃一点吗？]她一边补充，一边开始将你往下按向她的" + marbleCock() + "。你被迫扩张以容纳更多的她，你因为拉扯而微微颤抖。");
               outputText("玛布尔对你咧嘴一笑，说：[say: 看到了吗？我就知道你能再多吃一点。][pg]");
            }
            outputText("在适应了她在你体内的感觉后，你无法否认这样连接在一起的感觉是多么美妙。");
            if(get_player().cor + get_player().lib < get_player().statusEffectv4(StatusEffects.Marble) + 10)
            {
               outputText("玛布尔对你咧嘴一笑，开始上下抬动你的臀部，同时她自己的臀部也跟着弹跳。这样的结合导致你的" + get_player().vaginaDescript(0) + "被她的" + marbleCock() + "像活塞一样抽插着。你们俩因为这压倒性的快感开始齐声呻吟，让你除了任由她像一辆颠簸的马车一样将你抛来抛去之外什么也做不了，而你享受着这每一秒。[pg]");
               outputText("[say: 噢，亲爱的，我是不是太快了？来，让我给你个喘息的机会。]她说着放慢了快速的动作，让你的思绪重新稳定下来。");
               if(get_player().biggestTitSize() >= 4)
               {
                  outputText("玛布尔把手从你的臀部移开，让你按照自己的节奏在她身上起伏。当你下降时，她依然会迎合你；当你上升时，她也会随之下降，配合着你的节奏。但她的双手有了更紧迫的任务：你的" + get_player().biggestBreastSizeDescript() + "。玛布尔开始熟练地用手挑逗和把玩你的" + get_player().biggestBreastSizeDescript() + "。她似乎知道所有正确的指法，显然对自己的胸部有着丰富的经验，你忍不住在她的抚摸下呻吟起来。她自己也愉悦地咯咯笑着喘息；看来她可能和你一样享受这场游戏！[pg]");
               }
               else
               {
                  outputText("玛布尔觉得现在是开始把玩你的" + get_player().biggestBreastSizeDescript() + "的好时机，于是用一只手开始挑逗你的[nipple]，另一只手继续温柔地托着你起伏。你在她的服侍下轻声呻吟，她微笑着对你说：[say: 你知道吗，亲爱的，也许你那可爱的小乳房可以再大一点。我敢肯定，到那时我能对你做些很棒的事。]她脸上依然挂着笑容，喘息着，你们俩都感觉到高潮即将来临。[pg]");
               }
            }
            else
            {
               outputText("你发出一声发情的呻吟，开始骑乘她的" + marbleCock() + "，在她身上上下弹跳，享受着她在你体内的感觉。玛布尔对这突如其来的快速刺激倒吸了一口气，开始在你身下无助地扭动。你低头对她咧嘴一笑，继续着起伏的动作。你放慢了一会儿速度，以便能好好抓住她丰满的乳房。[pg]");
               outputText("[say: 亲爱的！]当你开始把玩她的乳房时，玛布尔喘息着说。");
               if(get_player().biggestTitSize() >= 4)
               {
                  outputText("她伸出手，开始把玩你的" + get_player().biggestBreastSizeDescript() + "，以你把玩她乳房的同样节奏弹拨和戏弄着它们。你们俩开始了一场友好的小比赛，看谁能更好地刺激对方的胸部；与此同时，你继续在她上方起伏。[pg]");
               }
               else
               {
                  outputText("玛布尔伸出手抓住你的手，将它们紧紧地拉向她的胸部。她让你轮流把玩她的每一个" + marbleNips() + "，确保你以恰到好处的方式弹拨和挑逗它们，让她一次又一次地在狂喜中叫喊出声。[pg]");
               }
               outputText("很快，你在她" + marbleCock() + "上快速的活塞运动将你们俩推向了高潮的边缘。");
            }
            outputText("当你的" + get_player().vaginaDescript(0) + "紧紧夹住她的" + marbleCock() + "，而它用精液填满你时，你们俩都在高潮中叫喊出声。");
            if(get_player().totalCocks() > 0)
            {
               outputText("与此同时，");
               if(get_player().totalCocks() > 1)
               {
                  outputText("你的每一根");
               }
               outputText("[cocks]都将自己的精液喷洒在玛布尔的胸部和肚子上。");
            }
            outputText("在美妙的刺激下，你们俩又颤抖了一下，然后瘫倒在彼此身上。");
            get_player().knockUp(8,368,150);
            get_player().cuntChange(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,6) * FlagDict_Impl_.arrayReadInt(KFLAGS.flags,5),true);
         }
         marbleSexFinish();
      }
      
      public function marbleNightRidingCont() : void
      {
         clearOutput();
         outputText("慢慢地，玛布尔又开始移动她的臀部，这次温柔得多，让你敏感的器官有机会适应重新开始的刺激。她懒洋洋地转动着宽阔的侧腹，慢慢唤醒连接在一起的顽皮部位。当她加快速度时，你微微呻吟以示抗议，但当她把一个乳头推到你唇边时，你沉默了。她肉嘟嘟的乳头挤了进来，让你的嘴里充满了甜美的甘露。");
         outputText("[pg]这突如其来的举动让你措手不及，但你本能地轻松吞下了它。你从爱人那里喝奶已经很久了，甚至在睡梦中都能做到。她对你热情地吞噬她提供的款待发出赞赏的呻吟，让第二轮性爱进入了高潮。你顺从地继续让她控制节奏，并从她乳白色的乳头上吸吮。");
         outputText("[pg][say:嗯，感觉太棒了。我一直很喜欢你吃奶的样子，亲爱的。当]——她快速摇晃了一下臀部——[say:我们像这样在一起时，感觉更好了。]");
         outputText("[pg]你稍微回应了一下，考虑到目前的状况，听起来像是一声沉闷的\"唔！\"");
         outputText("[pg]玛布尔幸福地叹了口气，温柔地抚摸了你一会儿。[say:而且你喝我的奶时太可爱了，[if (height < 60) {比平时还要可爱！|这与你白天的样子形成了鲜明的对比。}]英勇的勇者，在这里打败恶魔保护他的家园，像个勇者一样吸吮我的乳头！]她沉默了一会儿，眼神有些迷离。她再次与你目光交汇。[say:能拥有你我真是太幸运了。]");
         outputText("[pg]当你已经被使用过的[cockfit " + marbleCuntCapacity() + "]在玛布尔湿透的阴道里抽插时，空气中充满了响亮的吧唧声。随着每一次抽插，你都能感觉到又一股精液漏出来，顺着你的[legs]流下，与她的体液混合在一起。虽然舞蹈和以前相似，但感觉却有了全新的味道。在吞咽她美味的乳汁之间，你忍不住在玛布尔起伏的胸膛上大口喘气，发出快乐的呻吟。");
         outputText("[pg]你的伴侣在你长度上的动作简直是神圣的。她早些时候在打桩机般的动作中投入的一些活力已经燃烧殆尽，但这只给了她一个机会来改变花样。现在她的臀部在你被吞没的阴茎周围滚动扭曲，同时刺激你的每一寸肌肤。同时，它让你触摸到她通道的每一部分，引出和你一样多的快乐叹息。");
         outputText("[pg]当你嘴里的乳头突然被你腿上一次特别猛烈的弹跳拉出来时，你喘了口气。当她看到你的表情时，她笑了起来，把另一只乳房给了你。伴随着一声感激的吸溜声，你转而吸住了它。" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,465) > 0 ? "你爱人猛烈的动作让她的另外三个乳头在你喝奶时拂过你的脸。" : "") + "这次你肯定不会让它跑掉了。");
         outputText("[pg]你尽可能深地吸吮着伴侣的乳头，将" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,465) > 0 ? "她所有的四个乳头，加上" : "") + "整个乳晕以及后面的一些柔软的肉都吸进了嘴里。这突如其来的刺激让你下身迎来了第二次高潮。玛布尔似乎也和你一样接近了临界点，当你轻轻咬住她的乳房时，她也随你一同进入了极乐。");
         outputText("[pg]她喘息着，呻吟着，在体内翻腾的强烈快感中摇晃着脑袋，然后向前倒在你俯卧的身体上，将她那极其丰满的胸部从你黑洞般的嘴里猛地抽了出来。你大口喘着气，完全上气不接下气，被刚刚经历的奇妙性爱彻底震撼了。");
         outputText("[pg][if (cumquantity > 1000) {你的阴茎痉挛着、跳动着，将大量的精液泵入你爱人的子宫。有些精液成功进入了里面，但大部分都从她的阴道壁膨胀出来，挤过你的肉棒，掉落到你身下的地板上，汇入了你上次射精留下的大滩精液中。感觉过了一个世纪，你的高潮终于结束了。整个过程中，你仍然设法让你的阴茎牢牢地留在你爱人的通道里。|[if (cumquantity > 100) {你的[hips]摇晃着、颤抖着，又一股惊人的精液冲出你的身体，浸透了你爱人的内部。大部分精液被挤出入口，你用越来越多的精液涂抹着她。尽管你的前列腺尽了最大努力，但压力始终无法克服你身体上方的重量，因此你仍然牢牢地扎根在玛布尔体内。|[if (cumquantity > 20) {自从你来到这个世界后，你射精的能力显著增强，但你已经给了她一发，剩下的第二发只能像普通人类一样射出那么多。但这并不能阻止你爱人的阴道壁开心地榨取你所能提供的一切，将其加入你之前留在在那里的浓稠白色精液中。它们还确保你牢牢地留在你爱人的阴道内。|你之前已经射过一次了，所以你只能勉强向你爱人贪婪的通道里喷射几下。她的阴道壁在你周围回荡，从你那被充分使用的肉棒中榨取最后一股精液。你几乎觉得它们在抚摸你，因为你干得好，这给了你一种奇怪的自豪感。当然，你并没有被释放，仍然牢牢地留在你爱人的阴道内。}]}]}]");
         get_player().orgasm("Dick");
         FlagDict_Impl_.arrayWriteFloat(KFLAGS.flags,3,0);
         highLibidoTryst = true;
         doNext(playerMenu);
      }
      
      public function marbleNightRiding() : void
      {
         clearOutput();
         outputText("[if (!isnaked) {[say:好吧，我亲爱的[race]，你为什么不表演一下脱衣服呢？][pg]当[if (!isfeminine) {你撕下每一件衣服并表达你对爱人的兴趣时|你尽可能性感地小心脱下每一件衣服并强调你身体的资本时}]，}][if (isnaked) {你}]问玛布尔今晚是不是打算让你包揽所有的活儿。");
         outputText("[pg]她笑了。[say:哦，我向你保证，[name]，[if (!isnaked) {一旦你脱完，}]你什么都不用做。相信我。]");
         outputText("[pg]她显然没有撒谎[if (!isnaked) {，在你最后一件衣服落地之前，|——}]你的伴侣就扑向了你。你被她沉重的胸部压在地上，同时被她强有力的熊抱紧紧抱住。当你倒地不起时，玛布尔站起身来，检查你珍贵的货物。发现一切正常后，她紧紧抓住你勃起的阴茎，直接对准她的私处。伴随着一声响亮的啪嗒声，她重重地压在了你身上。");
         outputText("[pg]你在痛苦和快乐中喘息。当你深吸一口气时，你的背部弓起，而你的爱人开始在你的[cockfit " + marbleCuntCapacity() + "]上猛烈地摩擦自己。[say:就像我说的，你现在什么都不用做，只要躺在那里接受我的爱……]玛布尔低语着，用手指抚摸着她的肚子。[if (cocklength > 8) {你甚至能感觉到她隔着皮肤摩擦你深埋的阴茎。}]你开始稍微抬起身体，但一只坚定的手放在你的[chest]上，把你推了回去。看来不管你喜不喜欢，今晚你都将成为玛布尔的王座，而你的女王将统治它的每一秒。");
         outputText("[pg]她的摩擦稍微慢了下来，让你们俩有机会回味下体结合的感觉。她的通道非常湿滑，但强有力的肌肉因期待而紧张抽搐，偶尔紧紧抓住你，仿佛在确保你不会试图逃跑。她臀部稳定的舞蹈让你的肉棒在她的内部旋转，确保每一部分都被以各种方式适当地挑逗。你伴侣的呼吸平稳而满足，脸上带着温柔的微笑。");
         outputText("[pg]在整个过程中，你仍然能感觉到她的手压在肚脐上的压力。在她侧腹的每一次旋转中，它都提供了一个奇特的压力点。突然，稳定的旋转停止了；她在你深埋的阴茎上摩擦了几下手指，期待着即将到来的事情。你只有片刻的准备时间，她就再次让整个身体动了起来。");
         outputText("[pg]你的爱人弓起背，大口喘气，然后疯狂地上下弹跳。她托住一只乳房，让另一只乳房随着臀部的动作起伏弹跳。你被这个令人难以置信的性感牛娘骑在你身上自慰的场景迷住了。然后你们的目光交汇，在那一瞬间你明白，你伴侣身上所有显而易见的激情都来自于她对你强烈的爱。");
         outputText("[pg]玛布尔身子前倾，紧紧抓住你的肩膀，继续专注地盯着你的[eyes]。你的目光完全被她棕色的眼眸困住了，而她则以惊人的凶猛在你的[cockfit " + marbleCuntCapacity() + "]上疯狂地上下抽插。同时，她继续试图用她私处的每一寸来挤压你的长度。用强烈来形容这种快感甚至都不够准确。这绝对是令人震撼的！");
         outputText("[pg]最后，她重重地坐了下来，把她所能容纳的一切都塞进她的小穴里，发出一声长长低沉的快乐喘息——介于牛叫和呻吟之间。这是她非常满足的高潮的惯用信号。同时，你也忙着度过你自己的高潮。当甜蜜的余韵吞没你们闪闪发光的身体时，液体从你们两个身体连接的地方喷涌而出。");
         outputText("[pg][if (height < 60) {你们的身体仍然连接在一起，玛布尔闭上眼睛，伸出手，把你拉进一个紧贴她胸膛的拥抱中。她的皮肤因汗水而湿滑，混合着她平常的泥土味和独特的性爱气味。一声满足的叹息从你唇间溢出，你依偎在她丰满的资本中。你的伴侣轻笑着抚摸你的头。[pg][say:哦，亲爱的]——她捏了捏你的脸颊，又咯咯地笑了起来——[say:你真是太可爱了，我太爱你了！]当她用乳房紧紧挤压你时，你感觉你的脸被挤成了一个滑稽的表情。你的伴侣又笑了。[say:我永远也不会厌倦和你玩……]|[if (height <= 84){[pg]你们的身体仍然连接在一起，玛布尔闭上眼睛，伸出手，把你拉起来，又是一个深吻。同时，她把丰满的资本紧紧压在你的[chest]上。她慢慢地从吻中抽离，再次看着你。当她抚摸你的头时，一个灿烂的笑容穿过她的脸庞。[pg][say:哦，亲爱的]——她把头靠在你的肩膀上，依偎着你——[say:你真是太[if (!isfeminine) {英俊|美丽}]了，我太爱你了！]你们俩笑着钻进彼此的肩膀。[say:我永远也不会厌倦你……]|你们的身体仍然连接在一起，玛布尔闭上眼睛，躺在你的[chest]上，依偎在你宽大的身躯里。你微笑着低头看着牛娘，轻轻抚摸她棕色的秀发。作为回应，她发出一声满足的叹息，深吸了一口气，享受着空气中混合着汗水和性爱的你的气味。[pg][say:哦，亲爱的]——她睁开眼睛抬头看着你的眼睛——[say:你几乎毫不退缩地接受我抛给你的任何东西，我太爱你了！]你伸出一只手，轻轻托住她的脸颊，当她用自己的手抚摸它时，你笑了。[say:我永远也不会厌倦你……]}]}]");
         get_player().orgasm("Dick");
         marblePreggoChance();
         FlagDict_Impl_.arrayWriteFloat(KFLAGS.flags,3,10);
         dynStats(DynStat.Sens(-1));
         if(get_player().lib >= 50)
         {
            doNext(marbleNightRidingCont);
         }
         else
         {
            doNext(marbleNightEnd);
         }
      }
      
      public function marbleNightRefusal() : void
      {
         outputText("[pg]你向玛布尔道歉，告诉她你今晚没兴趣。她显然很失望，但什么也没说。");
         outputText("[pg]你们俩挨着躺下准备过夜。过了一会儿，玛布尔伸出手，握住了你的手。然后你们俩就睡着了。");
         doNext(playerMenu);
      }
      
      public function marbleNightMassageEnd() : void
      {
         clearOutput();
         outputText("玛布尔突然翻过身，拉着你深情拥吻。她那非人的舌头尽可能多地品尝着你的口腔，然后退出来，调皮地轻咬你的嘴唇。你回敬了她刚才的假装抱怨，这惹得她发出一阵低沉的轻笑，再次强行吻上你的嘴。她一只手紧紧抱住你们的头，另一只手滑下去，用力捏住你的[ass]。你忙于唇舌交锋，此时根本无暇提出任何异议。现在你无法逃脱她的掌控，直到她完全满足之前，你都是她的。");
         outputText("[pg]当她的手指移到你的下体时，你开始在她的掌控中扭动。[if (hasCock) {她摸到了你的[cock]，紧紧握住。你的爱人一边把玩着你的阴茎，一边在你嘴里大声呻吟，同时继续对你的脸庞倾注热情。你之前在前戏中就已经勃起了，现在更是硬如磐石。玛布尔完全清楚这一点，似乎从不断套弄你中获得了一点施虐的快感。你试图忍住，试图控制住来自阴茎和脸庞的强烈快感和刺激，但这太过了。当你在她手上射精时[if (!isnaked) {，虽然你还穿着[armor]}]，玛布尔得意地笑了。|她的手指滑入[if (!isNakedLower) {你的[armor]和}]你的阴唇之间，[if (vaginalWetness == 0) {努力让它变得湿润|因为你的兴奋变得[if (vaginalWetness > 3) {湿透|湿滑}]}]。你的爱人一边探索你的花穴，一边在你嘴里大声呻吟，同时继续对你的脸庞倾注热情。你之前在前戏中就已经被唤起了——现在你下面已经是一片泥泞。玛布尔完全清楚这一点，一刻也没有停歇。你试图忍住她亲吻和剧烈动作带来的热量和快感，但这太过了。当你在她手中颤抖着达到高潮时，玛布尔得意地咯咯笑了起来。}]");
         outputText("[pg]最后，玛布尔把你从她[i: loving]的束缚中释放出来，让你有机会喘口气。她站起身，邪恶地笑着。[say:这只是还你的人情，]她告诉你，然后展示了她湿润的私处" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,4) > 0 ? "以及她阴茎上的一些白斑" : "") + "。[say:你已经让我爽过了。]");
         dynStats(DynStat.Lib(-1),DynStat.Sens(2));
         get_player().orgasm("Generic");
         FlagDict_Impl_.arrayWriteFloat(KFLAGS.flags,3,10);
         doNext(playerMenu);
      }
      
      public function marbleNightMassage() : void
      {
         clearOutput();
         outputText("你看着玛布尔在[bed]上坐了一会儿，然后凑过去轻轻把她推倒，握住她的一只手。你把她的手贴在脸颊上摩擦，感受着她手上的老茧和有力的手指。翻过手来，展现出的是更柔软娇嫩的肌肤，你顺势在上面落下连串的吻。接着，你顺着她的手臂探索。虽然光滑美丽，但你很容易就能感觉到隐藏在表面下强健的肌肉。这些肌肉有些僵硬，某些地方无疑还很酸痛。");
         outputText("[pg]你对着爱人微笑，决定帮她在一天辛劳后放松一下，揉捏按摩那些僵硬的地方。玛布尔对你的努力发出赞许的呻吟，当你照顾她另一只手臂时更是如此。当然，真正的问题区域是她的肩膀和背部，所以你让她翻过身，好把她肌肉里的酸痛按摩出来。");
         outputText("[pg]你脱下她的上衣，欣赏她背部的线条和形状。你很少有机会从背后看她，所以偶尔欣赏一下，在她那略显宽阔的肩膀和光滑的腰部印下亲吻，感觉很不错。顺着她的身形往下，又变宽成了她丰满的臀部，加上她那慷慨的屁股，给了她一个美丽的丰满身段。从她臀部上方探出的尾巴增添了一丝非人的元素，只让她显得更加诱人。");
         outputText("[pg][say:嗯，嘿亲爱的，我以为这是按摩，不是全身亲吻，]玛布尔说道，几乎掩饰不住笑意。作为回应，你暂时停止了挑逗，调皮地轻咬了一下她柔软的臀瓣。[say:哦！这可不太好！]她假装抱怨，这次没能忍住咯咯笑了起来。你继续脱下她的裙子，同时在她的屁股和腿上又印下几个吻，然后回到她的肩膀，给它们好好揉捏一番。");
         outputText("[pg]令人惊讶的是，牛娘的身体在一层脂肪下能隐藏这么多东西，但这只会让你觉得她更加美丽。任何看到你这番操作的人都会说这更像是身体崇拜，而不是按摩。玛布尔在你按摩时显然没有变得更放松——随着时间的推移，她的尾巴甩动得越来越剧烈。");
         doNext(marbleNightMassageEnd);
      }
      
      public function marbleNightLustEnd() : void
      {
         highLibidoTryst = false;
         clearOutput();
         outputText("你醒来时感觉有点酸痛，但很满足。你和玛布尔在夜里稍微分开了一些，但仍然躺在彼此身边。你深吸了几口气，伸展了一下手臂。这些动作引起了你爱人的注意，她睁开了眼睛。");
         outputText("[pg][say:嗯，早上好，亲爱的。]她俯下身，将嘴唇贴在你的嘴唇上。她的吻慵懒地顺着你的下巴滑下，疲惫依然明显，但她祝你今天过得愉快。");
         doNext(playerMenu);
      }
      
      public function marbleNightLovemaking() : void
      {
         var _g:MarbleScene;
         outputText("你确信你们俩脑子里想的不仅仅是睡觉。");
         if(marblePregWithPCKids())
         {
            outputText("[pg][say:哦，是的，妈妈也有一些需要解决的生理需求。这]——她拍了拍自己隆起的肚子——[say:一点也没变。]");
            outputText("[pg]你微笑着，也将手放在她的肚子上，感受着里面正在成长的孩子。你同意如果母亲最终感到沮丧和压抑，对孩子是不好的。");
         }
         else
         {
            outputText("[pg][say:亲爱的，我现在可能很纯洁，但我仍然有需要解决的生理需求。]");
            outputText("[pg]你向你的爱人保证，不会让她感到压抑和沮丧的。");
         }
         outputText("[pg]这时你们俩已经到了你的[cabin]。你把你的伴侣领进去，然后跟着她，让[if (builtcabin) {door swing|flap fall}]回到原位，最后看了一眼传送门周围荒芜的风景。");
         var _loc1_:String = get_player().hasCock() && get_player().cockThatFits(marbleCuntCapacity()) < 0 ? "fitting " : "";
         addButton(0,"按摩",marbleNightMassage).hint("通过揉捏和亲吻帮助这头母牛放松并达到高潮。");
         addButton(1,"玛布尔骑乘",marbleNightRiding).hint("让她占据主导地位，而你则享受其中。").disableIf(!get_player().hasCock() || _loc1_ != "","需要一根" + _loc1_ + "肉棒。");
         _g = this;
         addButton(2,"做爱",function():void
         {
            _g.marbleNightSexIntro();
         });
      }
      
      public function marbleNightEnd() : void
      {
         clearOutput();
         if(!marblePregWithPCKids() && !pcPregWithMarblesKids())
         {
            outputText("你们俩只是躺在那里休息了一会儿，试图恢复体力。最终玛布尔轻笑了一声，用手肘撑起身体，微笑着，用她闪亮的棕色眼睛看着你。[say:好吧，我想我之后可能动不了了，你呢？]");
            outputText("[pg]你点头表示同意，但没有提到如果玛布尔一直这样压在你身上，你也哪儿都去不了。");
            outputText("[pg][say:好吧，既然这样，我们最好睡一觉，对吧，亲爱的？]她对你眨了眨眼。");
            outputText("[pg]这对你来说听起来是个好建议，你们俩拉过一些枕头和毯子，蜷缩在一起。");
            outputText("[pg]没过多久，你就搂着心满意足的牛娘睡着了，你那变软的[cockfit " + marbleCuntCapacity() + "]仍然留在她那充满精液的阴道里。");
         }
         else if(marblePregWithPCKids())
         {
            outputText("你们俩只是躺在那里休息了一会儿，试图恢复体力。最终玛布尔抽出身来，切断了你们身体之间的连接，并在你身边坐下。她心满意足地漫不经心地抚摸着她肿胀的肚子。[say:我相信这个小家伙不会介意我们这样享受彼此的。]");
            outputText("[pg]你指出，考虑到这让孩子的母亲多么高兴，他们不可能不高兴。");
            outputText("[pg]她笑了。[say:好吧，亲爱的，你为什么不检查一下我们的小牛犊以确定呢？]她又拍了拍肚子。你点点头，移到她身边，把头靠在她隆起的子宫上。你可以听到孩子快速跳动的脉搏慢下来，变成稳定的节奏，并保持在那里，显然很满足，正在睡觉。你把这些告诉了她。");
            outputText("[pg][say:那么]——你的伴侣拉起一些枕头和毯子——[say:也许我们也该睡一觉了？]你表示同意，重新靠在玛布尔圆润的肚子上，在孩子心跳的声音中进入了梦乡。");
         }
         else
         {
            outputText("你们俩只是躺在那里休息了一会儿，试图恢复体力。最终玛布尔抽出身来，切断了你们身体之间的连接，把头靠在你肿胀的肚子上。她漫不经心地用手指在你放松的身体上弹奏，同时倾听着里面婴儿的声音。");
            outputText("[pg]你问她听到了什么，孩子是否感觉像你现在一样好。");
            outputText("[pg]她轻笑了一声，[say:考虑到那颗心现在有多放松，我想你不需要担心，亲爱的。我们的小家伙现在睡得很香。当然，如果你不介意的话，我想我可能整晚都要听着他们的动静。]她对你眨了眨眼。");
            outputText("[pg]你摇了摇头，拉起几条毯子和枕头让自己舒服些。几分钟后，你睡着了，玛布尔的头轻轻地贴在你怀孕隆起的肚子上。");
         }
         doNext(playerMenu);
      }
      
      public function marbleMilkSex(param1:Boolean = true) : void
      {
         var _loc2_:int = 0;
         spriteSelect(SpriteDb.get_s_marble());
         if(param1)
         {
            clearOutput();
            doNext(get_camp().returnToCampUseOneHour);
         }
         if(get_player().get_gender() == 0)
         {
            marbleGenderlessNoFuck();
            return;
         }
         outputText("喝下她的奶水让你充满了强烈的渴望，你也能在玛布尔的眼中看到同样的渴望。你别无选择；你要和她做爱。[pg]");
         if(get_player().get_armorName() == "bondage patient clothes" || get_player().get_armorName() == "crotch-revealing clothes" || get_player().get_armorName() == "cute servant\'s clothes" || get_player().get_armorName() == "maid\'s clothes" || get_player().get_armorName() == "servant\'s clothes")
         {
            outputText("她先挪了挪身子，好把你的那里看个清楚。");
         }
         else
         {
            outputText("她先挪了挪身子，拉开你的[armor]，好把你的那里看个清楚。");
         }
         if(get_player().cockTotal() > 0)
         {
            if(get_player().cockTotal() == get_player().countCocksOfType(CockTypesEnum.HORSE) + get_player().dogCocks() + get_player().countCocksOfType(CockTypesEnum.HUMAN))
            {
               outputText("玛布尔看着你的" + get_player().multiCockDescriptLight() + "，脸上露出愉悦的神色，一把将你推倒在她的床上。她褪下自己的裙子，在尾巴那里停顿了一下，轻笑着用那条系着丝带的尾巴扫过你的[cocks]，随后爬上你的身子，双腿滑到你身侧。[pg]");
            }
            else
            {
               outputText("玛布尔久久地注视着，然后指着你的");
               _loc2_ = int(get_player().cocks.length);
               while(_loc2_ > 0)
               {
                  _loc2_--;
                  if(get_player().cocks[_loc2_].get_cockType().get_Index() > 2)
                  {
                     outputText(get_player().cockDescript(_loc2_));
                     _loc2_ = -1;
                  }
               }
               outputText("。[say: 甜心，那到底是什么玩意儿？]她的语气里带着些迟疑。你冲她一笑，让她摸摸看。犹豫片刻后，玛布尔伸出手，触碰到那质地和硬度之后，整个人明显放松了下来。她把你推倒在自己床上，三两下褪去衣衫，爬上了你的身子，嘴角挂着一丝狡黠的笑，双腿夹在你身侧。[pg]");
            }
            if(get_player().cockTotal() > 1)
            {
               outputText("[say: 那么，你最喜欢哪一根？]玛布尔一边打量着你的[cocks]一边问你。还没等你回答，玛布尔就抓住了你中间的[cock]说：[say: 我打赌是这根。]");
            }
            outputText("玛布尔毫不犹豫地撑起身子，将她湿润的嘴唇套在你的[cock]上。当你的肉棒没入她的体内时，你们俩都喘息起来。你感觉到每一寸都在慢慢地滑入她的身体，直到");
            if(get_player().cocks[0].cockLength < 8)
            {
               outputText("你的[cock]完全深入其中。");
            }
            else
            {
               outputText("玛布尔在八英寸处到底了，你无法再深入了。");
            }
            outputText("玛布尔愉悦地一阵轻颤，开始在你身上上下起伏，动作越来越急促，渐渐失了章法。你想让她慢一点，但此时她根本听不进任何话，嘴里只吐出一声比一声高亢、一声比一声失控的欢愉呻吟。比你预想的要快得多，你就在她体内爆发了。就在那一刻，玛布尔发出了最后一声呻吟，那声音几乎和母牛的哞叫一模一样。她慢了下来，看样子已经攀上了巅峰。[pg]");
            outputText("你能看得出来，经过这番挤奶加交合的连番伺候，玛布尔心满意足、通体舒泰。她从你身上翻下来，滚到床上，转眼就睡着了。你花了好一会儿清理身体，仍有些恍惚，刚才那场疯狂的欢爱让你还没回过神来。临走时，你最后瞥了玛布尔一眼，她依然歪歪斜斜地瘫在床上，睡得很沉。");
         }
         else if(int(get_player().vaginas.length) > 0)
         {
            if(get_player().biggestTitSize() > 2)
            {
               outputText("玛布尔用手指在你" + get_player().vaginaDescript(0) + "上流连片刻，随后一只手覆上了你" + get_player().biggestBreastSizeDescript() + "。她对你一笑，说：[say: 我觉得咱们可以在这儿玩玩。你既然那么喜欢我的，那我想我也会喜欢你的。]她帮你褪去衣衫，让你躺倒在床上，自己迅速占了上位。她吐出舌尖，凑到你一侧[nipples]上，温柔地舔舐了起来。玛布尔抿了抿嘴唇，随即开始用手和脸蛋在你每一处" + get_player().allBreastsDescript() + "上来回揉捏、抚摸、舔弄，轮番照料，始终轻柔，始终爱意满满。玛布尔对这些手法似乎相当熟稔，大概早就在自己身上练习过无数次了。[pg]");
            }
            else
            {
               outputText("她用指尖在你" + get_player().vaginaDescript(0) + "上撩拨了一会儿，然后把手放到了你" + get_player().biggestBreastSizeDescript() + "上。[say: 这么小的乳头我还真不知道该怎么弄，不过我尽量。只是有点替你难过，甜心。]你张嘴正想反驳，玛布尔却伸出根手指按在你唇上，示意你噤声。她定定地凝视着你，直截了当地告诉你，既然你那么享受她的乳房，那让她也享用一下你的" + get_player().allBreastsDescript() + "才算公平。然后她冲你吐了吐舌头，低头含住你的[nipple]，又舔又揉，还把这份关照延伸到了");
               if(get_player().totalNipples() > 2)
               {
                  outputText("另一个");
               }
               else
               {
                  outputText("剩下的");
               }
               outputText("。[pg]");
            }
            outputText("在结束了");
            if(get_player().totalBreasts() > 2)
            {
               outputText("伴随着你的每一个" + get_player().allBreastsDescript());
            }
            else
            {
               outputText("对你每个[breasts]的爱抚后");
            }
            outputText("，玛布尔抬头看着你，再次吐出舌头。[say:现在是主菜时间了！]她低声说着，然后低下头，含住你的一个[nipples]。她很快开始吸吮你的乳头。[pg]");
            if(get_player().hasFuckableNipples())
            {
               outputText("当玛布尔的舌头摩擦你的" + get_player().nippleDescript(0) + "时，它滑了进去，这让她非常惊讶。她退后了一会儿，困惑地看着你。你告诉她没问题；这只会让你更快乐。玛布尔明白了，迅速恢复了动作。她灵巧的舌头认真地操弄着你的[nipple]。");
               if(get_player().biggestLactation() > 1)
               {
                  outputText("在整个过程中，玛布尔不断地大口吞咽着你的乳汁。");
               }
            }
            else if(get_player().biggestLactation() > 1)
            {
               outputText("她的吸吮很快让一股乳汁流到她的唇边，她急切地吞咽下去。你满足地叹了口气，但很快又从陶醉中回过神来，因为她的吸吮变得更加刺激和强烈。");
            }
            if(get_player().biggestLactation() <= 1 && !get_player().hasFuckableNipples())
            {
               outputText("当然，因为你没有泌乳，所以除了你的[nipple]之外，什么也没有碰到她的嘴唇。玛布尔似乎并没有因此而扫兴，仍然给了你一次非常愉快的体验。");
            }
            outputText("[pg]");
            outputText("过了一会儿，玛布尔从你的[nipple]上退开，对你说：[say:亲爱的，我知道只有一个乳头被照顾有多烦人，所以我一定会完成这项工作。]她直接扑向你的");
            if(get_player().totalNipples() > 2)
            {
               outputText("下一个");
            }
            else
            {
               outputText("另一个");
            }
            outputText("[nipple]，重新开始体验。到最后，她的努力成功地让你达到了高潮。稍微清理了一下后，玛布尔兴高采烈地送你离开。");
         }
         get_player().orgasm("Generic");
      }
      
      public function marbleKidsPlaytime() : void
      {
         registerTag("marbleMultiKids",TagFun_Impl_.fromBool(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,8) > 1));
         registerTag("marbleSoleBoy",TagFun_Impl_.fromBool(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1052) == 1));
         clearOutput();
         var _loc1_:Array = [1];
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,8) > 1)
         {
            _loc1_[int(_loc1_.length)] = 2;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,8) > 1)
         {
            _loc1_[int(_loc1_.length)] = 3;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,8) > 1)
         {
            _loc1_[int(_loc1_.length)] = 4;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,8) > 1)
         {
            _loc1_[int(_loc1_.length)] = 5;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,757) == 2 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,454) > 0)
         {
            _loc1_.push(6);
         }
         if(followerRathazul())
         {
            _loc1_.push(7);
         }
         _loc1_.push(8);
         var _loc2_:int = int(_loc1_[Utils.rand(int(_loc1_.length))]);
         if(_loc2_ == 1)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,8) == 1 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1052) == 1)
            {
               outputText("你的儿子立刻哒哒哒地跑到你身边，跳进你的怀里。[say: " + get_player().mf("爸爸，爸爸","妈妈，妈妈") + "！陪我玩！]你看着怀里的男孩笑了起来，他那么小，却又充满活力。接着，他拉着你开始了一场大冒险，你扮演寻找英雄拯救营地的人，扮演必须被阻止的怪物，还要扮演需要被拯救的怪物人质，而他则是执行这项伟大任务的伟大牛牛救世主。");
               outputText("[pg]游戏最终以牛牛救世主战胜成群的贪婪怪物而告终——在游戏过程中的某个时刻，她觉得人质不好玩，单挑也不够震撼，于是你耗尽了你的表演技巧，提供了一系列令人满意的可怕表情和咆哮——这片土地上的人民（你）欢呼雀跃。之后你觉得有点累，但你绝对不后悔和你的孩子一起玩。");
            }
            else
            {
               outputText("你的女儿立刻哒哒哒地跑到你身边，跳进你的怀里。[say: " + get_player().mf("爸爸，爸爸","妈妈，妈妈") + "！陪我玩！]你看着怀里的女孩笑了起来，她那么小，却又充满活力。接着，她拉着你开始了一场大冒险，你扮演寻找英雄拯救营地的人，扮演必须被阻止的怪物，还要扮演需要被拯救的怪物人质，而她则是执行这项伟大任务的伟大牛牛救世主。");
               outputText("[pg]游戏最终以牛牛救世主战胜成群的贪婪怪物而告终——在游戏过程中的某个时刻，她觉得人质不好玩，单挑也不够震撼，于是你耗尽了你的表演技巧，提供了一系列令人满意的可怕表情和咆哮——这片土地上的人民（你）欢呼雀跃。之后你觉得有点累，但你绝对不后悔和你的孩子一起玩。");
            }
            get_player().changeFatigue(10);
         }
         if(_loc2_ == 2)
         {
            outputText("当你靠近育儿室时，孩子们的脸立刻亮了起来，齐声喊道：[say: " + get_player().mf("爸爸","妈妈") + "！给我们讲个故事吧！]他们围着你，对听到你的冒险经历感到兴奋。看来，这一次，又是孩子们决定你们在一起的时光要发生什么了。");
            outputText("[pg]你开始讲述你的另一段冒险经历（可能真的发生过，也可能没有），小家伙们听得津津有味。当你谈论你的成功时，他们全神贯注地听着，脸上带着微笑；当你听起来可能处于危险之中时，他们露出担忧的神色；当你安然无恙地脱险时，他们大声欢呼。");
            if(get_player().cor < 66)
            {
               outputText("你确实确保跳过了那些更露骨的内容。");
            }
            outputText("最终你的故事讲完了，你和孩子们道别。");
            get_player().changeFatigue(10);
         }
         if(_loc2_ == 3)
         {
            outputText("玛布尔把你叫过来，让你带孩子们去拜访惠特尼——她想趁他们不在的时候在营地里做点事。你点点头，转身对孩子们说，是时候去拜访惠特尼阿姨了。[say: 耶！]他们大喊着，全都围了过来。你告诉玛布尔你一个小时后回来，然后带着孩子们前往农场，最小的孩子害羞地牵着你的手。");
            outputText("[pg]多亏了这片土地上奇特的旅行方式，你没花多少时间就到达了惠特尼在恶魔枯萎病中那座宁静岛屿的边缘。没过多久，女孩们就开始往前跑，热切地期待着拜访这位南方佳丽。当你到达惠特尼的家时，她已经让小玛布尔们进去了，正在客厅里招待她们。当她拿出她最新自制的玩具给她们看时，传来一阵兴奋的叫声。");
            outputText("[pg]你和孩子们一起加入她，在她们和阿姨以及阿姨给她们做的玩具玩耍时，帮忙控制她们。尽管这对这位犬娘农夫来说很累，但你能看出她喜欢和这些孩子在一起，喜欢听她们兴奋地叫她<i>阿姨</i>。");
            outputText("[pg]当一个小时快到的时候，你告诉你的孩子们是时候放松一下准备离开了。有一些抗议，但当惠特尼承诺在她们离开时给她们每人一份奖励时，抗议并没有持续多久。她短暂地去了厨房，当你让女孩们都准备好离开时，她端着一盘松饼重新出现，每个孩子一个。你的孩子们带着满脸烘焙美食的笑容回到了营地。");
            get_player().changeFatigue(10);
         }
         if(_loc2_ == 4)
         {
            outputText("你注意到玛布尔正和你的孩子们坐在一些木头上。出于好奇，你决定去看看究竟发生了什么。");
            outputText("[pg][say: 妈妈，它又坏了！]");
            outputText("[pg]显然，玛布尔正试图教你的孩子们如何正确地建造木制结构，从用几块木头建造小“房子”和小玩具开始。看起来");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,8) == 2)
            {
               outputText("两个");
            }
            else
            {
               outputText("大约一半的孩子");
            }
            outputText("至少对此有一些诀窍。");
            outputText("[pg]玛布尔以无限的母性耐心坐在你的孩子们旁边，再次向他们展示如何制作基本支撑。你微笑着离开了，继续你的其他工作。");
         }
         if(_loc2_ == 5)
         {
            outputText("当你靠近时，玛布尔抬起头，给了你一个疲惫的微笑。[say: 你好，亲爱的。]");
            outputText("[pg]你也回以微笑，告诉她，她看起来太累了，今天剩下的时间不适合再照顾孩子们，并问她你能不能帮上什么忙。");
            outputText("[pg][say: 亲……亲爱的，我能处理好的。我知道你忙着做其他重要的……]");
            outputText("[pg]你打断了她，温和地解释说，孩子们不仅是她的，也是你的，因此你也应该分担一些责任；而且，你实在不忍心看她总是因为孩子们太多而疲惫不堪。她再次露出了微笑。");
            outputText("[pg][say: 谢谢你。你真是太棒了。嗯，我确实需要休息一下……而且我们还得为晚餐准备点东西，所以如果你能带他们去采些香草当香料，既能给他们找点事做，也能帮大忙。]");
            outputText("[pg]你点点头，把你的孩子们叫过来，宣布你们所有人都要为玛布尔妈妈采集一些重要的植物。孩子们蜂拥在你周围，光是走到森林边缘的这段路，就足以让你意识到应付他们有多累人。");
            outputText("[pg][say: " + get_player().mf("爸爸","妈妈") + "！是这个吗？是这个吗？]");
            outputText("[pg]他们确实精力充沛，但往往只是随便抓起东西，然后问你是不是好东西，而不是乖乖按照你的指示去采集。你发誓有个孩子采了一株看起来几乎像你家乡毒蕈的东西，还有一个给你拿来了一个须果。你温柔地收下它们，把孩子们打发回去，然后悄悄地把所有危险物品处理掉。这种情况持续了一段时间，但最终你的篮子还是装满了。");
            if(get_player().get_inte() < 30)
            {
               outputText("[pg]收集了看起来像是玛布尔可能需要的东西后，你回到了营地。");
            }
            else if(get_player().get_inte() < 70)
            {
               outputText("[pg]你很清楚玛布尔通常用哪些香草做香料，并且主要采集这些，不过你也采集了一些你认为安全的香草，想知道她能不能用它们做点什么。");
            }
            else
            {
               outputText("[pg]你对玛布尔的[say: 香料]了如指掌，也很清楚这里哪些东西可以用来做香料。你和孩子们一起采集了所有这些东西，满载而归地回到了营地。");
            }
            outputText("[pg]你的孩子们因为干了这么多活而有点累了，看来他们今天不会再怎么缠着玛布尔了。其中一个甚至抓住你抱怨道：[say: " + get_player().mf("爸爸","妈妈") + "，我困了！]你摸摸她的头，微笑着告诉她很快就到家了。");
            outputText("[pg]走近营地时，玛布尔已经在等你了，看起来放松和休息得好多了。她从你手里接过装满香草的篮子，对你绽放出一个美丽的微笑，然后");
            if(get_player().get_tallness() < 60)
            {
               outputText("一把抓住你，立刻把你举到她的胸前，给了你一个大大的拥抱。");
            }
            else
            {
               outputText("紧紧地拥抱你，将她温暖的身体贴在你的身上。");
            }
            outputText("[pg][say: 谢谢你，亲爱的。我爱你。][pg]");
            get_player().changeFatigue(15);
            get_inventory().takeItem(get_consumables().W_FRUIT,get_camp().returnToCampUseOneHour);
            return;
         }
         if(_loc2_ == 6)
         {
            get_anemoneScene().repeatCowSitting();
         }
         if(_loc2_ == 7)
         {
            kidsHaveRatPlaytime();
         }
         if(_loc2_ == 8)
         {
            kidsPlayingFarmers();
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,460) > 0)
         {
            dynStats(DynStat.Lust(-10));
         }
         else
         {
            dynStats(DynStat.Lib(-1),DynStat.Lust(-10),DynStat.Cor(-1));
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function marbleKidsMeetEdrynFuckbuddy() : void
      {
         outputText("当你告诉她时，她的眼睛睁得大大的");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,8) > 1)
         {
            outputText("他们是你的孩子。[say: 他们是你的……真的吗？]她难以置信地盯着他们，但当她听到他们谈论你和他们的");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1052) == 0)
         {
            outputText("她是你的女儿。[say: 你-你的女儿？]她很难相信你的话，但当你的女孩提到你和她的");
         }
         else
         {
            outputText("他是你的儿子。[say: 你-你有个儿子？]她难以置信地问道。当男孩确认了这一点并提到他的");
         }
         outputText("[if (isfeminine){ 另一个}]妈妈，玛布尔。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,8) > 999 && get_silly())
         {
            tooManyCows();
         }
         outputText("[pg][say: 那-那真是……恭喜你成为[father]！]她脱口而出，试图听起来很平静。之后她迅速转移了话题，直接对你的孩子[if (marbleMultiKids){们}]说话。");
         outputText("[say: 你的[if (isfeminine){父母|爸爸妈妈}]有好好照顾你吗？]当她得到响亮的[say: 有]作为回答时，埃德琳松了一口气，但她很难直视他们。她转过身来对你说，[say: 我知道特尔阿德雷并不完美，但如果你们搬到这里，你的家人不是会更安全吗？]");
         outputText("[pg]你拒绝了她的提议，并解释说你的营地对你的家人来说足够安全");
         if(get_player().hasPerk(PerkLib.HistoryDEUSVULT))
         {
            outputText("，而且你没有兴趣把他们带到一个连自己街道上的腐化污秽都无法控制的城镇。埃德琳吃了一惊，但还是礼貌地点了点头。");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,8) > 39)
         {
            outputText("，而且一次性让这么多孩子搬到这里生活会对城镇造成负担。埃德琳理解你的理由，尽管她坚持她的立场。");
         }
         else
         {
            outputText("。");
         }
         outputText("[pg][say: 如果你改变主意，不要犹豫，带着你的家人来这里，]然后她靠近你，低声说，[say: 你的爱人知道我们……]她没有问出那个显而易见的问题，并借故离开，继续她守卫城市的职责。");
         outputText("[pg]天色已晚，所以你们也离开了。");
         marbleKidsAtTelAdreEnding();
      }
      
      public function marbleKidsMeetEdryn() : void
      {
         if(get_player().isChild())
         {
            outputText("当你告诉她时，她简直不敢相信自己的耳朵");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,8) > 1)
            {
               outputText("他们是你的孩子。[saystart]他们");
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1052) == 0)
            {
               outputText("她是你的女儿。[saystart]她");
            }
            else
            {
               outputText("他是你的儿子。[saystart]他");
            }
            outputText("是你的？你这么年轻就已经当[father]了？[sayend][pg]");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,8) == 1)
            {
               outputText("埃德琳凑近看了看你的[if (marbleSoleBoy){儿子|女儿}]。");
               if(get_player().cowScore() < 5)
               {
                  outputText("虽然你们不是同一个物种，但你");
               }
               else
               {
                  outputText("你");
               }
               outputText("们俩之间有着她能注意到的家族相似性。");
            }
            else
            {
               outputText("埃德琳凑近看了看这些牛头人小孩。");
               if(get_player().cowScore() < 5)
               {
                  outputText("虽然他们是不同的物种，但他");
               }
               else
               {
                  outputText("他");
               }
               outputText("们和他们的[father]之间有着她能注意到的家族相似性。");
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,8) > 999 && get_silly())
            {
               tooManyCows();
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,8) > 39)
            {
               outputText("她惊讶地瞪大了眼睛。尽管你年纪轻轻，但你繁衍的后代已经足以填满一个村庄了，而且很可能还会有更多。[say: 哇……这真是……你的生育能力到底有多强啊？]");
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,8) > 9)
            {
               outputText("她沉默地注视了一会儿，对你能生下这么多孩子感到惊叹。");
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,8) > 3)
            {
               outputText("[say: 你已经建立了一个大家庭了……]");
            }
            outputText("[pg]她又看了你一眼。[say: [Name]，你该不会是一个人在照顾他们吧？]");
            outputText("[pg]你向她简要讲述了你是如何遇见玛布尔的，以及你们在一起的生活，最后还提到了你来这里的原因。你的孩");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,8) > 1)
            {
               outputText("子们对她和你也有很多话要说，尽管大部分都是热情的赞美");
            }
            else
            {
               outputText("子对你和你的爱人也有很多话要说，大部分都是赞美");
            }
            outputText("。当你讲完后，埃德琳似乎松了一口气，但很快就转移了话题，提出要护送你回大门。[pg]");
            outputText("就像你第一次来到镇上那样，你");
         }
         else
         {
            outputText("你向她介绍了你的孩子[if (marbleMultiKids){们}]");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,8) > 999 && get_silly())
            {
               tooManyCows();
            }
            outputText("，在从对你庞大家族的震惊中缓过神来后，她恭喜你成为了[father]");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,8) > 39)
            {
               outputText("。你的家族大到足以填满一个村庄，而且很可能还会继续壮大。");
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,8) > 9)
            {
               outputText("，同时也对你庞大的家族表示惊讶。");
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,8) > 3)
            {
               outputText("。[say: 你还挺忙的，]她看着你这相当庞大的家庭说道。");
            }
            outputText("[pg]你的");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,8) > 1)
            {
               outputText("孩子们充满活力和喜悦地向她打招呼[if (isTaur){，看到另一个像他们[dad]一样的半人马，他们兴奋不已}]");
            }
            else
            {
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1052) == 0)
               {
                  outputText("女儿像往常一样，充满活力和喜悦地向她打招呼");
               }
               else
               {
                  outputText("儿子像往常一样，充满活力和喜悦地向她打招呼");
               }
               if(get_player().isTaur())
               {
                  outputText("，看到另一个像[Daddy]一样的半人马，兴奋不已");
               }
            }
            outputText("。埃德琳也微笑着回应，然后问你来这里做什么。当你简单解释了一下，并告诉她你打算很快离开时，她主动提出护送你到城门。[pg]你");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,8) == 1)
         {
            outputText("的[if (!marbleSoleBoy){女儿|儿子}]在回去的路上骑在埃德琳背上。");
         }
         else
         {
            outputText("的孩子们在回去的路上骑在埃德琳背上。");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,8) > 4)
         {
            outputText("不过，因为人太多，不能同时骑在她背上，所以他们需要轮流。");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,8) < 9 && get_player().isTaur())
         {
            outputText("没骑在她背上的孩子就骑在你背上，没有一个孩子在地上走。");
         }
         outputText("你们一边走，一边和埃德琳聊着镇上的事。她建议你带着家人搬到特尔阿德雷，指着那些你们可以住的空房子，");
         if(get_player().hasPerk(PerkLib.HistoryDEUSVULT))
         {
            outputText("但你告诉她，如果守卫不能处理街上那些堕落的事情，你拒绝和家人住在这里。埃德琳被你的话弄得措手不及，没有反驳。");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,8) > 39)
         {
            outputText("但你拒绝了。一次带这么多人来住，会对镇子造成负担。");
         }
         else
         {
            outputText("但你告诉她，你们在营地里很安全。");
         }
         outputText("[pg][say: 没关系，如果你改变主意，这里随时欢迎你和你的家人，]她道别后，继续去做守卫的工作。当你回家时，你的孩子[if (marbleMultiKids){们也挥手|也挥手}]告别。");
      }
      
      public function marbleKidsAtTelAdreEnding() : void
      {
         outputText("[pg]从城市返回营地的速度和去的时候一样快。当你到达时，你第一眼看到的就是玛布尔在");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2179) > 0)
         {
            outputText("大门处张开双臂等着你。");
         }
         else
         {
            outputText("营地边缘张开双臂等着你。}]");
         }
         if(get_player().get_tallness() < 60)
         {
            outputText("她把你举到半空中，拥抱着你，你们分享了一个充满爱意的吻");
         }
         else
         {
            outputText("她跑向你，紧紧地拥抱你，然后给了你一个吻");
         }
         outputText("，然后你的[if (marbleMultiKids){孩子们也加入了| [if (marbleSoleBoy){儿子|女儿}]也加入了}]拥抱，紧紧抱住你的腿");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,8) > 4)
         {
            outputText("而那些挤不进去的孩子则拥抱他们的兄弟姐妹，或者试图从他们中间挤过去找你");
         }
         outputText("。你们像这样又待了一会儿，然后你的孩子[if (marbleMultiKids){们回到了|回到了}]育儿室");
      }
      
      public function marbleKidsAtTelAdre() : void
      {
         outputText("就在你和孩子[if (marbleMultiKids){们}]热烈讨论苹果的时候，玛布尔走过来找你。[say: 亲爱的，我明天的晚餐还缺些食材。你能帮我去买一下吗？]你答应了她，她给了你一张食材清单。这些东西在森林里找不到，但对你来说也不难收集。你应该能在特尔阿德雷买齐所有的东西。[say: 谢谢你。我本来想和你一起去的，但我手头上的事情实在太多了。]");
         outputText("[pg]你向她保证没问题，而且不到一个小时就能搞定。你告诉你的");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,8) == 1)
         {
            outputText("[if (marbleSoleBoy){儿子|女儿}]在你出门的时候乖乖和妈妈待在一起，但这孩子却有不同的想法。[say: 我想和你一起去，[Daddy]，求求你了！]");
         }
         else
         {
            outputText("孩子们在你回来之前自己乖乖玩耍，但他们根本不听。[say: [Daddy]，带我们一起去吧！求求你了，[Daddy]！]");
         }
         outputText("[pg]起初你还有些犹豫，但最终还是被他们坚持不懈的恳求说服了。城市并不比森林更危险；只要有你在那里保护他们免受罪犯的伤害，街道应该是安全的。此外，这也有利于你的");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,8) > 1)
         {
            outputText("孩子们趁着还小，习惯一下外面的世界");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1052) == 1)
         {
            outputText("儿子趁着还小，习惯一下外面的世界");
         }
         else
         {
            outputText("女儿趁着还小，习惯一下外面的世界");
         }
         outputText("，你只需要确保别走到镇上那些比较变态的区域就行了。");
         outputText("[pg]以玛瑞斯的旅行方式，你没花多少时间就到了特尔阿德雷。当守卫们注意到你这次不是一个人来时，他们打量了你一番，但水晶证明了你的[if (marbleMultiKids){孩子们是|[if (marbleSoleBoy){儿子|女儿}]是}]纯洁的，你们被允许进入。");
         outputText("[pg]当你们走在街道上时，你的小家伙[if (marbleMultiKids){们似乎|似乎}]对一切都感到好奇，吵着要进去看看路上遇到的每一家商店");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,8) > 1)
         {
            outputText("。他们兴奋得根本停不下来，但也没有跑得离你太远");
         }
         else
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1052) == 0)
            {
               outputText("，她在街上到处乱跑，体力仿佛永远用不完");
            }
            else
            {
               outputText("，他到处乱跑，似乎永远不知疲倦");
            }
            outputText("，但绝不会跑出你允许的范围");
         }
         outputText("。[pg]当你买齐了要买的食材后，因为比预期的要快，你决定为了你的");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,8) > 1)
         {
            outputText("孩子们多花点时间逛逛街。你本以为不可能，但当你真的走进他们要求去的商店时，他们不知怎么地变得更加活泼了，而且只会变得更加兴奋");
         }
         else
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1052) == 0)
            {
               outputText("小女孩多花点时间逛逛街。当你走进一家她要求去的商店时，她笑得合不拢嘴");
            }
            else
            {
               outputText("小男孩多花点时间逛逛街。当你走进一家他要求去的商店时，他抑制不住内心的喜悦");
            }
            outputText("，并且变得越来越兴奋");
         }
         outputText("随着你们之后去的每一个地方。[pg]你的孩子[if (marbleMultiKids){们}]的热情让几个市民转头看向你，最终守卫们也过来查看骚动的源头。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,69) > 0)
         {
            outputText("你花了一些时间才澄清了误会，但他们没有抱怨就放你们走了，你们也能在预期的时间内回到营地。");
            marbleKidsAtTelAdreEnding();
         }
         outputText("在他们之中，你认出了埃德琳。她注意到你时笑了笑，但看到你这次不是一个人时，她感到很惊讶。");
         outputText("[pg]她凑近看了看，问道：[say: 你带来的[if (!marbleMultiKids){这个孩子|这些孩子}]是谁？]");
         if(get_player().statusEffectv1(StatusEffects.Edryn) > 0)
         {
            marbleKidsMeetEdrynFuckbuddy();
         }
         else
         {
            marbleKidsMeetEdryn();
         }
      }
      
      public function marbleGenderlessNoFuck() : void
      {
         outputText("就在你们俩开始之前，你记起你没有生殖器。当你告诉玛布尔这件事时，她明显有些恼火。[say:好吧，我想我不能让你爽了，但我猜你还是能让我爽的。]你同意了，因为你不想在已经同意做爱之后让玛布尔扫兴。[pg]");
         outputText("玛布尔坐在床头，脱下她的裙子和内衣。她张开双腿，让你能清楚地看到她湿润的下唇。她对你微笑着，慢慢地向你招手。你爬上床的另一端，带着腼腆的笑容，慢慢地向她爬去。每一次移动都让你们俩靠得更近，直到你的头悬在她饥渴的裂口上方。她把双手放在你的后脑勺上，把你拉向她等待着的阴户。她身上散发着强烈的动物性气味，你靠得越近，就越让你兴奋。最后，你急不可耐的舌头伸出嘴外，抵住她湿润的嘴唇，然后深深地探入她的体内。[pg]");
         outputText("你听到玛布尔发出一声满足的叹息，但她抓着你的手一点也没有放松。此时此刻，即使你想退缩也是不可能的。你的舌头在她的体内游走，探入每一个能找到的缝隙，品尝着每一寸肌肤。你很乐意这样做，直到玛布尔的双手把你的头推到她阴户的顶部，她气喘吁吁地对你说：[say:吸。]你照做了。玛布尔很快发出一声轻柔的叹息，听起来几乎像牛叫，然后终于放开了你的头。[say:太感谢你了，亲爱的，那太棒了。]");
         dynStats(DynStat.Lust(40));
      }
      
      public function marbleGathered() : void
      {
         clearOutput();
         outputText("你问玛布尔有没有找到什么物资。她微笑着把她最近找到的东西递给了你。[pg]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1059) != 1 && get_player().statusEffectv1(StatusEffects.MarbleHasItem) <= 4)
         {
            get_inventory().takeItem(get_consumables().VITAL_T,interactWithMarbleAtCamp);
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1059) != 1 && get_player().statusEffectv1(StatusEffects.MarbleHasItem) <= 7)
         {
            get_inventory().takeItem(get_armors().LEATHRA,interactWithMarbleAtCamp);
         }
         else
         {
            get_inventory().takeItem(get_consumables().LABOVA_,interactWithMarbleAtCamp);
         }
         get_player().removeStatusEffect(StatusEffects.MarbleHasItem);
      }
      
      override public function marbleFollower() : Boolean
      {
         return get_player().hasStatusEffect(StatusEffects.CampMarble);
      }
      
      public function marbleFightWin() : void
      {
         var _g:Combat;
         spriteSelect(SpriteDb.get_s_marble());
         clearOutput();
         if(get_monster().get_HP() < 1)
         {
            outputText("玛布尔被击败，倒在地上；她无助地抬头看着你，不知道你接下来要做什么。");
         }
         else
         {
            outputText("玛布尔瘫倒在地，渴望地看着你，撩起裙子，眼中满是绝望的神色。");
         }
         outputText("由于这头母牛巨大的蹄子和锤子发出的叮当声，你周围现在聚集了一些围观者。强暴玛布尔可能不是个好主意……为了避免被打扰，你必须把她拖到她的房间里，而且惠特尼很可能会发现并感到生气。你该怎么做？");
         menu();
         if(get_player().hasPerk(PerkLib.Feeder) || get_player().lactationQ() > 200)
         {
            addButton(0,"喂她",forceFeedMarble);
         }
         else
         {
            addButtonDisabled(0,"喂她","这个场景需要你有很高的产奶量。");
         }
         addButton(1,"回房强暴",rapeMarbleInHerRoom);
         _g = get_combat();
         addButton(14,"离开",function():void
         {
            _g.cleanupAfterCombat();
         });
      }
      
      public function marbleFightLose() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_marble());
         if(get_player().get_HP() < 1)
         {
            outputText("在头部挨了太多下重击之后，你栽倒在地上。");
         }
         else
         {
            outputText("被欲望冲昏头脑的你跪倒在地，开始疯狂地自慰。玛布尔对你感到厌恶，再次猛击你的头部，将你打倒在地。");
         }
         outputText("她凑近你的头，低声说道：[say:永远别再靠近我，否则我就用这把锤子砸碎你的脑袋。]她站起身走开了，而你则因为头部受伤昏了过去。");
         get_combat().cleanupAfterCombat();
      }
      
      public function marbleEncounterAddictedNonWithdrawlAshamed() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_marble());
         outputText("你决定去拜访玛布尔，因为在你没有戒断症状的时候和她共度时光会很不错。你在她的房间里找到了她，她");
         if(get_marbleAffection() >= 30)
         {
            outputText("担忧地");
         }
         outputText("看了你一会儿，然后才意识到你并没有发抖。[pg]");
         if(get_marbleAffection() >= 30)
         {
            outputText("[saystart]亲爱的，你");
         }
         else
         {
            outputText("[saystart]你");
         }
         outputText("既然不需要我的奶，为什么还要来这里？[sayend]你解释说你只是想和以前一样享受她的陪伴。她露出了一个真诚的微笑，这笑容可能已经很久没有出现在她的脸上了，然后你们俩在她的房间里一起吃了一顿饭。");
         get_player().refillHunger(30,false);
         outputText("[pg]");
         if(get_marbleAffection() >= 80)
         {
            outputText("吃饭的时候，玛布尔深深地看着你的眼睛片刻，你以为她要说什么，但她摇了摇头，在接下来的时间里似乎变得更加沉默寡言。[pg]");
         }
         outputText("吃完后，她感谢你这样想着她，即使你正在经历那些痛苦。你回到了营地，知道你可能很快就会因为一些不太愉快的事情再次见到她。");
         set_marbleAffection(get_marbleAffection() + 10);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function marbleEncounterAddictedNonWithdrawl() : void
      {
         spriteSelect(SpriteDb.get_s_marble());
         clearOutput();
         outputText("你决定去看看玛布尔，不犯瘾的时候跟她待一会儿也挺好。你发现她正在自己房间里看书。她抬头看向你，一脸惊讶地说，[say:你现在看起来不像是来要喝奶的。怎么了，亲爱的？] 你告诉她你只是想一起待会儿，不用老惦记着喝奶的事。她笑着对你说，[say: 亲爱的，你这辈子都忘不掉我的奶的；不过陪你装一会儿也无妨。] 你们两个在她房间里一起吃了顿饭。");
         get_player().refillHunger(30);
         outputText("[pg]");
         if(get_marbleAffection() >= 80)
         {
            outputText("当你吃东西时，她深深地看了你的眼睛一会儿。你以为她要说什么，但她摇了摇头，在你们在一起的剩余时间里避开了你关于这个问题的提问。[pg]");
         }
         outputText("你吃完后，她感谢你的陪伴，并让你很快再来。你回到营地，知道你可能很快就会因为一些不太愉快的事情再次见到她。");
         set_marbleAffection(get_marbleAffection() + 10);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function marbleCuntCapacity() : Number
      {
         var _loc1_:Number = 36;
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,465) >= 1)
         {
            _loc1_ += 10;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,465) >= 2)
         {
            _loc1_ += 20;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,8) > 0)
         {
            _loc1_ += 14;
         }
         return _loc1_;
      }
      
      public function marbleCuddlin() : void
      {
         outputText("没过多久，玛布尔就伸出手，");
         if(!pcPregWithMarblesKids() && !marblePregWithPCKids())
         {
            if(get_player().get_tallness() <= 78)
            {
               outputText("把你的头拉到她的胸前。她漫不经心地抚摸着你的[hair]，说道：[say:亲爱的，今晚我给你当枕头怎么样？]你高兴地答应了，很快，你躺在她丰满的双乳之间，伴随着她平稳的呼吸声进入了梦乡。");
            }
            else
            {
               outputText("用双臂环抱住你，轻轻地将你拉向她。[say:亲爱的，你介意我们这样待一会儿吗？]你根本无法拒绝，没过多久，你们俩就在彼此的怀抱中睡着了。");
            }
         }
         else if(marblePregWithPCKids() && !pcPregWithMarblesKids())
         {
            outputText("轻轻地把你的头拉到她肿胀的肚子上。[say:听着，亲爱的，]她低声说，[say:像这样安静的时候，你能听到我们孩子的心跳……]你听到一声轻柔的砰砰声，伴随着玛布尔自己强有力的心跳，以及你们的孩子在玛布尔体内偶尔的蠕动。你叹了口气，依偎在玛布尔的胸前，用手抚摸着她的肚子，然后进入了梦乡。");
         }
         else if(pcPregWithMarblesKids())
         {
            outputText("轻轻地抚摸着你肿胀的肚子。[say:亲爱的，]她低声说，[say:我能感觉到我们的孩子。]她把毛茸茸的耳朵贴在你越来越大的肚子上，一直轻轻地抚摸着。过了一会儿，她依偎在你的身上，你们俩进入了梦乡。");
         }
         else
         {
            outputText("把你的手拉到她的肚子上，然后把她的手放在你的肚子上。[say:两个相爱的人怀着彼此孩子的奇迹，]她说。这绝对不是你曾经期望发生的事情，但这并没有让它变得不那么美妙。你们俩把手放在彼此身上，一起进入了梦乡。");
         }
      }
      
      public function marbleCock() : String
      {
         var _loc1_:String = "";
         if(int(Math.random() * 3) == 0)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,5) < 3)
            {
               _loc1_ = "粗短的";
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,5) >= 3 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,5) < 5)
            {
               _loc1_ = "短小的";
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,5) >= 5 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,5) < 7)
            {
               _loc1_ = "普通的";
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,5) >= 7 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,5) < 9)
            {
               _loc1_ = "长长的";
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,5) >= 10 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,5) < 13)
            {
               _loc1_ = "巨大的";
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,5) >= 13 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,5) < 18)
            {
               _loc1_ = "粗大的";
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,5) >= 18 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,5) < 30)
            {
               _loc1_ = "庞大的";
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,5) >= 30)
            {
               _loc1_ = "高耸的";
            }
         }
         if(int(Math.random() * 3) == 0)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,6) <= 0.75)
            {
               _loc1_ += "细长的";
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,6) > 1 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,6) <= 1.4)
            {
               _loc1_ += "粗壮的";
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,6) > 1.4 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,6) <= 2)
            {
               _loc1_ += "宽大的";
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,6) > 2 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,6) <= 3.5)
            {
               _loc1_ += "肥大的";
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,6) > 3.5)
            {
               _loc1_ += "肿胀的";
            }
         }
         var _loc2_:Number = int(Math.random() * 10);
         if(_loc2_ >= 0 && _loc2_ <= 4)
         {
            _loc1_ += "肉棒";
         }
         if(_loc2_ == 5 || _loc2_ == 6)
         {
            _loc1_ += "鸡巴";
         }
         if(_loc2_ == 7)
         {
            _loc1_ += "老二";
         }
         if(_loc2_ > 7)
         {
            _loc1_ += "肉棒";
         }
         return _loc1_;
      }
      
      public function marbleChoreRefusal() : void
      {
         clearOutput();
         outputText("你生气地告诉她你不会为了她的奶水而工作，然后转身离开，留下她明显很沮丧。你的身体似乎也对你的拒绝感到不安，全身疼痛。幸运的是，你也感觉到戒断症状得到了暂时的缓解。");
         dynStats(DynStat.Str(-1),DynStat.Tou(-1));
         set_marbleAffection(get_marbleAffection() - 5);
         set_marbleAddiction(get_marbleAddiction() - 5);
         if(get_player().hasStatusEffect(StatusEffects.BottledMilk))
         {
            get_player().addStatusValue(StatusEffects.BottledMilk,1,1 + Utils.rand(6));
         }
         else
         {
            get_player().createStatusEffect(StatusEffects.BottledMilk,3,0,0,0);
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function marbleChoreHelpChooseMilk() : void
      {
         clearOutput();
         outputText("一想到有可能得到一些缓解，你便急切地开始工作，尽你所能帮助玛布尔。这是一项艰苦的工作，但得到奶水的想法似乎给了你你没有意识到的力量。");
         outputText("[pg]之后，玛布尔对你的努力印象深刻，给了你一大瓶她的奶水。当你离开时，你意识到你不必马上喝掉它；仅仅是为之工作就已经稍微缓解了你的戒断症状。[pg]");
         get_inventory().takeItem(get_consumables().M__MILK,get_camp().returnToCampUseOneHour);
         set_marbleAffection(get_marbleAffection() - 5);
         if(get_player().hasStatusEffect(StatusEffects.BottledMilk))
         {
            get_player().addStatusValue(StatusEffects.BottledMilk,1,1 + Utils.rand(6));
         }
         else
         {
            get_player().createStatusEffect(StatusEffects.BottledMilk,3,0,0,0);
         }
      }
      
      public function marbleChoreHelpChooseMarble() : void
      {
         clearOutput();
         outputText("你同意帮助玛布尔，但不是为了奶水。她似乎困惑了片刻，你告诉她你想帮助她只是为了帮助她，而不仅仅是因为你会得到奶水。听到这话，她给了你一个真诚的微笑，在接下来的几个小时里，你们俩合作得很好。");
         outputText("[pg]最后，玛布尔感谢你的帮助，并递给你她承诺的那瓶奶水，即使你并不完全是为了它而工作。当你离开时，你意识到你不必马上喝掉它；仅仅是为之工作就已经稍微缓解了你的戒断症状。[pg]");
         get_inventory().takeItem(get_consumables().M__MILK,get_camp().returnToCampUseOneHour);
         set_marbleAffection(get_marbleAffection() + 5);
         if(get_player().hasStatusEffect(StatusEffects.BottledMilk))
         {
            get_player().addStatusValue(StatusEffects.BottledMilk,1,1 + Utils.rand(6));
         }
         else
         {
            get_player().createStatusEffect(StatusEffects.BottledMilk,3,0,0,0);
         }
      }
      
      public function marbleCampSexNew() : void
      {
         var _loc1_:* = null as IMap;
         marbleSprite(true);
         if(get_player().hasStatusEffect(StatusEffects.Infested))
         {
            outputText("你把玛布尔叫过来，问她能不能帮你发泄一下。她对你笑了笑，用一只手轻轻握住你的[cock]，然后惊恐地缩了回去。[say: 呃，亲爱的，你为什么不先解决你肉棒里的问题呢？然后我再帮你发泄。] 看来玛布尔不愿意在你肉棒感染寄生虫的时候帮你发泄。");
            return;
         }
         if(FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,3) < 0)
         {
            outputText("你把玛布尔叫过来，看看她能不能帮你发泄一下。她酸溜溜地看着你，然后说道：[say: 我现在没心情，不过你可以随便用我包里的玩具自己解决。] 好吧，那可真慷慨……呃，等等，她刚才是不是叫你自己去操自己？");
            return;
         }
         FlagDict_Impl_.arrayWriteFloat(KFLAGS.flags,3,0);
         if(!get_player().hasTailInsteadOfLegs())
         {
            if(get_player().hasPerk(PerkLib.MarblesMilk) && get_player().get_gender() > 0 && Utils.rand(2) == 0)
            {
               clearOutput();
               outputText("你告诉玛布尔你有点发情了，想知道她是否愿意私下为你做点特别的事。听到你低声说出你的想法，她咯咯地笑了起来，抚摸着你的[face]。");
               outputText("[pg][say: 真可爱，亲爱的！我当然可以为你这么做。]");
               outputText("她牵着你的手，带你坐到一个更舒服的地方。");
               outputText("[pg]你脱下[armor]的下半部分，准备躺下，正好靠在她的腿上，把头放在她的");
               if(get_player().get_tallness() < 66)
               {
                  outputText("右乳房下。");
               }
               else
               {
                  outputText("左乳房下。");
               }
               if(get_player().get_tallness() > 90)
               {
                  outputText("你确实需要弯下腰才能碰到她的乳房，同时也方便她碰到你的腹股沟，虽然有点不舒服，但你的计划是值得的。");
               }
               outputText("[pg]与此同时，玛布尔的右手正顺着你的腹部慢慢向下滑动，在你的[hips]上方稍作停留，等待着你的“回答”。你用双手轻轻抓住玛布尔的乳房，慢慢地将" + marbleNip() + "引导到你干渴的嘴唇边。");
               outputText("[pg][say: 喝吧，亲爱的，] 玛布尔说道，[say: 喝我的奶吧。]");
               outputText("[pg]你将乳头含入嘴里，开始吸吮。没过多久，玛布尔的乳汁就开始流淌，当乳汁流出时，她的手向下移去。");
               if(get_player().hasCock())
               {
                  outputText("当她的手碰到你的[cocks]时，她轻声笑了。[say: 看来你已经准备好，并且很渴望些什么了，亲爱的。]");
               }
               else
               {
                  outputText("她轻笑着，手伸向了你的" + get_player().vaginaDescript(0) + "。");
                  if(get_player().wetness() < 2)
                  {
                     outputText("[say: 噢，亲爱的，这可不行！你看起来好像一点都不期待这个！]");
                  }
                  else if(get_player().wetness() < 4)
                  {
                     outputText("[say: 看来你下面很需要些什么呢，亲爱的……]");
                  }
                  else if(get_player().wetness() < 5)
                  {
                     outputText("[say: 哎呀，亲爱的；这里好湿啊……你确定我们还要继续刺激它吗？]");
                  }
                  else
                  {
                     outputText("[say: 哎呀，亲爱的；看来你需要用毛巾擦一擦了……]");
                  }
               }
               outputText("[pg]她没有再多说什么，脸上带着灿烂的笑容，开始移动她的手来刺激你。作为回应，你稍微加大了吸吮她乳房的力度，而你的回报则是更强劲的乳汁流入你的口中。");
               if(get_player().hasCock())
               {
                  outputText("[pg]她的手继续抚摸着你的[cock]，起初非常轻柔，但一旦你加强了吸吮，她就会微微喘息，并赞赏地捏一下你的阴茎，增加力度。你微微挺起臀部，但她只是抚摸你的[hair]，仿佛在安抚你。");
                  outputText("[pg][say: 不疼吧？我想让你舒服，亲爱的……如果你继续吸我，我会让你感觉非常、非常舒服的。]");
                  outputText("[pg]你对着她的乳房轻声呻吟作为回应，这让她在把玩你[cock]的顶端时咯咯笑了起来。她恢复了套弄的动作并加快了节奏，就在这时你觉得你需要抓点什么——而手边最令人愉悦的东西就是她的乳房。当你一边吸吮一边揉捏她的乳房时，玛布尔惊讶地喘息并呻吟起来，作为回应，她开始更快地为你手淫。");
                  if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,5) == 0)
                  {
                     outputText("她的双腿似乎在摩擦，你躺着的地方感觉有点湿，所以你猜测不只是你越来越兴奋。");
                  }
                  else
                  {
                     outputText("她的双腿在你身下轻轻摩擦，你感觉到有什么硬硬的东西戳着你的背。你含着她的乳头笑了。");
                  }
                  if(get_player().balls > 0)
                  {
                     outputText("当她的手摸到你阴茎的根部时，她停止了抚摸，花了一点时间用手指轻轻揉捏你的[balls]。[say: 这些是不是很快就要为我射出来了，亲爱的？]");
                  }
                  if(get_player().hasVagina())
                  {
                     outputText("她的手从你阴茎的根部继续往下移，轻轻揉捏着你的[clit]。[say: 看来这里也需要一些关照……也许等会儿吧，亲爱的，如果你吃奶吃得好的话。但现在，我想看你射出来，]她说着，手又移回了你的[cocks]。");
                  }
                  outputText("[pg]她开始拉扯并抚摸你的[cock]，渴望让你现在就高潮。你再次挺起臀部，这次她的回应更加猛烈，用她的乳房将你压回去，因为她的触摸开始变得令人难以忍受。[say: 你快到了，对吧，亲爱的？没关系，我想看你射。]");
                  outputText("[pg]说完，她的抚摸变得毫不留情，你决定干脆屈服于这种快感。她的手在你的肉棒上不断上下套弄，挑逗着龟头并刺激着整个柱身，这种反复的感觉让你浑身颤抖，很快你就感到脊椎底部传来一阵酥麻。她的乳汁源源不断地流入你的口中，那令人舒适的味道让你完全放松下来，让你无法不沉浸在这份快感之中。");
                  outputText("[pg]片刻之后，玛布尔快速的套弄让你射精了。[say: 射出来了！你做得很好，亲爱的！]你的臀部颤抖着，导致你的阴茎在她的紧握中上下跳动，她将你越来越多的精液挤到她黏糊糊的手上。突如其来的快感让你更用力地抓住她的乳房，惹得她惊叫并呻吟起来。");
                  if(get_player().cumQ() < 500)
                  {
                     outputText("当她继续为你手淫时，你覆盖住她的手，在你射精结束后挤出微小的精液水滴。");
                  }
                  else if(get_player().cumQ() < 1000)
                  {
                     outputText("你的射精量一如既往地大，一股股精液飞向空中，覆盖了她的手臂和你的腹部……你发誓甚至有一股精液落在了她的右乳房上。[say: 就是这样，亲爱的，把你所有的都射出来。]");
                  }
                  else
                  {
                     outputText("你那巨大的白色精液几乎覆盖了你自己、玛布尔以及周围的地面。她似乎被你惊人的射精量惊呆了。[say: 呃……亲爱的……]");
                  }
                  outputText("[pg][say: 嗯……真有趣。] 玛布尔慢慢地将你从她的乳房上拉开");
                  if(get_player().cumQ() >= 1000)
                  {
                     outputText("，然后在另一个乳房上把乳头擦干净");
                  }
                  outputText("。 [say: 现在，亲爱的，如果你愿意吸另一个的话……]");
               }
               else
               {
                  outputText("[pg]她的手移到了你的快乐按钮上，开始轻轻揉搓你的[clit]，同时她的乳汁流进你的嘴里。当你加紧吸吮时，她微微喘息，将一根手指滑入你的" + get_player().vaginaDescript(0) + "，在她的手掌肆意玩弄你的[clit]时，手指在里面抽插。你微微挺动臀部，但她只是抚摸你的[hair]，似乎在安抚你。");
                  outputText("[pg][say: 感觉很好，不是吗，亲爱的？你应该多吸吸我的乳房，我会非常感激的。]");
                  outputText("[pg]你对着她的乳头轻轻呻吟作为回应，这让她在玩弄你[clit]的尖端时咯咯地笑了起来。");
                  if(get_player().getClitLength() < 3)
                  {
                     outputText("[pg]她小心翼翼但又非常用力地揉搓着它，给你带来一种刺痛而压倒性的快感。");
                  }
                  else
                  {
                     outputText("[pg]她抓住你的阴蒂撸动了几下，然后咧嘴大笑。[say: 这有点变态，亲爱的。这真的是你的女性部位之一吗？]");
                  }
                  outputText("她继续用手指在你的小穴里抽插，就在她加快速度时，你决定你需要抓住点什么——而手边最令人愉悦的东西就是她的乳房。玛布尔惊讶地喘息着，在你一边吸吮一边揉搓她的乳房时呻吟起来，作为回应，她开始更快地抠弄你。");
                  if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,5) == 0)
                  {
                     outputText("她的双腿似乎在摩擦，你躺着的地方感觉有点湿，所以你猜测不只是你越来越兴奋。");
                  }
                  else
                  {
                     outputText("她的双腿在你身下轻轻摩擦，你感觉到有什么硬硬的东西戳着你的背。你含着她的乳头笑了。");
                  }
                  outputText("[pg]你已经到了边缘，对你" + get_player().vaginaDescript(0) + "的抠弄以及对你[clit]的摩擦很快就让你高潮了。在玛布尔的怀抱中挣扎着，你将女性的汁液喷洒在她的手上。");
                  if(get_player().wetness() >= 4)
                  {
                     outputText("尽管弄得很脏，玛布尔却从未停下，想要让高潮尽可能地强烈。");
                  }
                  if(get_player().wetness() > 4)
                  {
                     outputText("很快，你把你的爱液喷满了她的手臂，她看着你那强烈而明显的高潮咯咯地笑了起来。");
                  }
                  outputText("[pg][say: 真有趣，] 玛布尔说着，慢慢地将你从她的乳房上拉开。[say: 现在，亲爱的，如果你愿意吸另一个的话……]");
               }
               outputText("[pg]你顺从地站起来坐在她旁边，把她的另一个乳房拉向你的嘴，同时赞赏地捏了捏。当你开始吸吮她时，玛布尔咧嘴大笑并抚摸着你的头；温暖、甜美的乳汁源源不断地流进你的嘴里。她似乎对这样取悦你感到满意，当你吸完时，她用温暖的目光看着你。");
               outputText("[pg]过了一会儿，乳汁的流量有所减少，你的爱人说话了。[say: 够了，亲爱的。谢谢你。] 你离开她的乳房，但她把你拉过去给了你一个吻。[say: 很有趣；我们随时可以再试一次。]");
               get_player().slimeFeed();
               _loc1_ = KFLAGS.flags;
               FlagDict_Impl_.arrayWriteFloat(_loc1_,3,FlagDict_Impl_.arrayReadFloat(_loc1_,3) + 20);
            }
            else if(Utils.rand(2) == 0 && get_player().get_gender() > 0)
            {
               clearOutput();
               outputText("你走向你那大胸的爱人，眼中带着狂热的神情。[say: 嗯……看来你需要释放一些压力，不是吗，亲爱的？] 你赞同地点点头，");
               if(get_player().hasCock())
               {
                  outputText("你的[armor]里顶起了一个小帐篷");
               }
               else if(get_player().hasVagina())
               {
                  outputText("你的[armor]下泛起一阵湿润");
               }
               outputText("，你凝视着她温柔的双眼；你本能地知道她会小心翼翼地对待你的下体。");
               outputText("[pg]你们互相帮助脱下衣服，一边抚摸亲吻，一边急不可耐地褪去阻碍彼此欲望的最后一道防线。终于，你们都一丝不挂了，而且");
               if(get_player().hasCock())
               {
                  outputText("[eachCock]跳动着");
               }
               else
               {
                  outputText("你的[clit]因兴奋而颤抖");
               }
               outputText("。[pg]");
               outputText("玛布尔给了你一个充满情欲的眼神，柔声说道：[say:喜欢你看到的吗？因为我可是很喜欢我眼前的风景呢。]她的手伸向你的胯部，挑逗地揉捏着，直到你在她温柔的抚摸下只能发出呻吟。她对你微笑着，很高兴看到自己的努力对你产生的效果。[say:放松，亲爱的……我觉得你还需要更多的爱……]当她开始俯下身子为你口交时，你兴奋地颤抖起来。");
               outputText("[pg]她双手的触感被一种甜蜜的温暖所取代。玛布尔毫不费力地舔舐着你的腹股沟，");
               if(get_player().hasVagina() && !get_player().hasCock())
               {
                  outputText("将舌头探入你的" + get_player().vaginaDescript(0) + "，舔舐着你最敏感的部位");
               }
               else
               {
                  outputText("用舌头包裹住你的肉棒，挤压并吸吮出渗出柱身的点点淫液");
               }
               outputText("。她的技巧棒极了，你在她令人窒息的舌头攻势下疯狂地扭动着身体。");
               outputText("玛布尔继续");
               if(get_player().hasVagina() && !get_player().hasCock())
               {
                  outputText("坚持不懈地探索着你的小穴，吸出[if (vaginalwetness > 2) {源源不断的淫液|尽可能多的淫液}]，这种感觉让你的[legs]紧绷起来。");
               }
               else
               {
                  outputText("吸吮着你尿道里的汁液，毫不客气地将从你下体顶端喷出的淫液一滴不剩地吞下。");
               }
               if(get_player().cockTotal() > 1)
               {
                  outputText("她交替着吸吮和套弄你的每一根肉棒，确保没有一根肉柱被冷落。");
               }
               if(get_player().balls > 0)
               {
                  outputText("她的双手轻柔地揉搓着你的[balls]，让它们在纯粹的兴奋中翻腾肿胀。");
               }
               outputText("[pg]当她的手和舌头继续在你的胯下耕耘时，你销魂地呻吟着；你冲动地抓住她的头，把她进一步按向你的腹股沟，让她顺势");
               if(get_player().get_gender() == 2)
               {
                  outputText("用舌头操弄");
               }
               else
               {
                  outputText("深喉");
               }
               outputText("你。你的臀部前后挺动，享受着她的舌头在你湿润、沾满唾液的生殖器上灵活游走的触感。");
               if(get_player().hasCock())
               {
                  outputText("她的双唇紧紧包裹着你的[cock]");
                  if(get_player().cockTotal() > 1)
                  {
                     outputText("同时她抚摸着另一根");
                  }
                  outputText("，就像一个有机的阴茎环。当你看着她的嘴唇在你喷射精液的[cock]反复跳动下起伏时，她抬头看着你。这些吸精者正在用最令人抓狂的方式挑逗你，你野蛮地将更多的肉棒塞进她的喉咙，撑开她的下巴，让她发出愉悦的呻吟，尽管她欢愉的叫声被塞满她嘴的肉棒捂住了。");
               }
               else
               {
                  outputText("她灵活而坚定的舌头感觉真的像一根肉棒，它不断地用长时间的挖掘来挑逗你。伴随着一次有力的挺进，你将她推向你的[vagina]，迫使她整个口腔肌肉进入其中。");
               }
               outputText("[pg]她服侍的甜美激情最终证明对你受虐的生殖器来说太过强烈，伴随着最后一次凶猛的挺进，你将你的汁液卸在玛布尔等待的嘴里。");
               if(get_player().hasCock())
               {
                  outputText("[pg]你的[cock]悸动着，龟头在玛布尔的喉咙处不由自主地抽搐，释放出你乳白色的精华。玛布尔急切地吞咽着，贪婪地喝着，这让你想起了你");
                  if(get_player().hasPerk(PerkLib.MarblesMilk))
                  {
                     outputText("通常");
                  }
                  else
                  {
                     outputText("过去");
                  }
                  outputText("吸吮她乳房的样子。");
                  if(get_player().cumQ() >= 500)
                  {
                     outputText("你的[cock]不断地在她体内喷出更多的种子，有效地撑大了她的肚子");
                  }
                  if(get_player().cumQ() > 1500)
                  {
                     outputText("直到她看起来快要生了。");
                  }
                  outputText("她的嘴唇紧紧贴着你的精管，仿佛她的生命都依赖于它；她恶毒地吸吮着，榨干你下体每一滴精液。");
               }
               else
               {
                  outputText("[pg]你的" + get_player().vaginaDescript(0) + "颤抖着，震动着，然后释放出一股强烈的女性精液，溅在玛布尔的嘴唇和嘴巴上；她带着贪得无厌的渴求喝下了你所有的汁液。她的舌头探索着你的内部，似乎在确保没有留下任何女孩的精液可以吸收。");
               }
               outputText("[pg]即使在你高潮之后，玛布尔仍然继续吸吮和舔舐你的下体，以确保没有浪费一滴，在你高潮后的眩晕中，你让她玩弄你的生殖器直到她满足；只有当你的胯下完全没有精液时，她才会停下来。");
               outputText("[pg]她最终站起来，给了你最后一个疲惫的吻，[say:希望我这次能帮上忙，亲爱的……]你们清理干净，迅速穿好衣服，然后分道扬镳。");
            }
            else
            {
               outputText("[say:你觉得焦躁不安吗，亲爱的？]当你走向玛布尔时，她问道。[say:别担心；我准备好了，也能帮忙。]");
               if(get_player().cor + get_player().statusEffectv4(StatusEffects.Marble) < 66)
               {
                  outputText("你们俩在营地里找了个僻静的地方，脱下了衣服。[pg]");
               }
               else if(get_player().cor + get_player().statusEffectv4(StatusEffects.Marble) < 132)
               {
                  outputText("你们俩就在营地中央脱光了衣服。[pg]");
               }
               else
               {
                  outputText("你们俩环顾四周，寻找另一个成员加入。没有人跳出来接受提议，所以你们俩脱光了衣服。[pg]");
               }
               outputText("玛布尔对你微笑，调皮地将她丰满的乳房挤在一起几次，然后");
               if(get_player().biggestTitSize() > 3)
               {
                  outputText("将它们压在你自己的" + get_player().biggestBreastSizeDescript() + "上。她轻笑着，将你的一只乳房夹在她的双峰之间，上下摩擦着，用她自己的" + marbleNips() + "挑逗着你的[nipple]，一丝乳汁漏出，滴在你们紧贴的胸膛上。");
               }
               else
               {
                  outputText("将它们压在你的胸膛上。她一边移动，一边用它们在你身上上下摩擦，确保你上半身的每个部位都至少被摩擦了三次。她特别喜欢把你的头夹在她的乳房之间揉弄。");
               }
               if(int(get_player().cocks.length) > 0)
               {
                  outputText("[pg]她向下移动到你的胯部，将你的" + get_player().cockDescript(0) + "滑入她的双峰之间。她对你笑了笑，说道：[say: 这就是你想要的，对吧？]然后紧紧地挤压它们，将你的[cock]推入抽出。当玛布尔在她的乳房之间套弄你时，你舒服地叹了口气，低头对她微笑。但玛布尔似乎并不满足于此；她加快了速度，开始让她的两只乳房交替上下移动。");
                  if(int(get_player().cocks.length) > 1)
                  {
                     outputText("但仍不满足的玛布尔，用她丰满的双峰吞没并摩擦着你剩下的[cocks]。");
                  }
               }
               if(int(get_player().vaginas.length) > 0)
               {
                  outputText("[pg]她顺着你的身体向下滑动，用她的乳房摩擦和爱抚你的" + get_player().vaginaDescript(0) + "，有时还会将她的一个" + marbleNips() + "推入你的" + get_player().vaginaDescript(0) + "中，引得你发出一声轻喘。");
                  if(get_player().getClitLength() < 2)
                  {
                     outputText("玛布尔用她的乳房在你的双腿上各摩擦了一次，然后出乎意料地将两根手指插入了你的" + get_player().vaginaDescript(0) + "。");
                  }
                  else
                  {
                     outputText("接着，玛布尔将你的[clit]拉到她的双峰之间，尽力像套弄阴茎一样去刺激它。");
                  }
               }
               if(get_player().get_gender() == 0)
               {
                  outputText("然后她带着狡黠的表情说道：[say: 我想我找到让你高潮的方法了，亲爱的。]她从你的上半身向下移动，开始摩擦和爱抚你的下半身。这极具挑逗性，但似乎还不足以将你推向顶峰。玛布尔站起身，吻了你一下，用一根手指在你腹股沟光滑的皮肤上摩擦。你离高潮只有一步之遥。接着，她的一根手指抵住了你的[asshole]，新的刺激让你浑身僵硬。");
               }
               outputText("[pg]快感淹没了你，你的身体被强烈的性高潮所席卷，这比你自己弄出来的要强烈得多。");
               if(int(get_player().cocks.length) > 0)
               {
                  if(get_player().cumQ() < 25)
                  {
                     outputText("顷刻间，少量精液覆盖了玛布尔的乳房。");
                  }
                  else if(get_player().cumQ() < 250)
                  {
                     outputText("片刻之后，相当多的精液覆盖了玛布尔的乳房和脸庞。");
                  }
                  else if(get_player().cumQ() < 500)
                  {
                     outputText("你不断地射精，直到最后玛布尔完全被你的精液浸透。");
                  }
                  else
                  {
                     outputText("你那似乎永无止境的高潮最终导致你们俩，以及周围一大片地面，都完全被你的精液浸透了。");
                  }
               }
               if(int(get_player().vaginas.length) > 0)
               {
                  if(get_player().vaginas[0].vaginalWetness < 2)
                  {
                     outputText("当你恢复过来时，你看到少量的淫液漏到了玛布尔的乳房上。");
                  }
                  else if(get_player().vaginas[0].vaginalWetness <= 3)
                  {
                     outputText("当你恢复过来时，你看到玛布尔身上被相当多地覆盖了你的淫液。");
                  }
                  else if(get_player().vaginas[0].vaginalWetness < 5)
                  {
                     outputText("当你恢复过来时，你看到玛布尔被你的淫液浸透了。");
                  }
                  else
                  {
                     outputText("你花了一分钟才恢复过来，但恢复后，你红着脸，意识到自己已经被淫液浸透到了什么程度。");
                  }
               }
               if(get_player().get_gender() == 0)
               {
                  outputText("这和你拥有生殖器时不太一样，但不可否认，这是一次高潮。虽然这本质上是一次毫无意义的高潮，但在某种程度上它也几乎是纯粹的。你体内除了快感的爆发，别无他感。");
               }
               outputText("[pg]玛布尔对自己的努力终于感到满意，她站起身来，你们俩在附近找了一条河把自己清洗干净。");
            }
         }
         else
         {
            clearOutput();
            outputText("你走到玛布尔面前，问她能不能帮你发泄一下性欲。玛布尔对你笑了笑，说道：[say: 嗯，我滑溜溜的亲爱的，我想我可以。]她示意你仰卧，在温暖、干裂的土地上伸展你长长的身体。然后她走到你尾巴的根部，在地上坐了下来。");
            outputText("[pg][say: 去你那特别的地方还有很长一段路呢，亲爱的；希望你能享受这段旅程，] 她一边说着，一边用手指顺着你的尾巴滑下，轻轻地把玩着尾端。[say: 看看这颗可爱的小糖果，只属于我。] 她把你的尾巴举到嘴边，然后伸出那长得不似人类的舌头，开始在尾尖周围舔舐。那种感觉让你的脊背一阵酥麻。[say: 哎呀，我是不是让你舒服得发抖了，亲爱的？] 玛布尔调戏着，然后把你的尾巴放了回去。");
            outputText("[pg][say: 那么亲爱的，来个舒服的尾巴按摩怎么样？] 她说着，把手放在你尾巴暴露的下侧，开始摩擦柔软的鳞片。当她顺着你的身体轻轻向上移动，用浅浅的向下的动作按摩你的尾巴时，你轻声叹息。[say: 享受吗？让我让你更舒服点，] 当她靠近你的腹股沟时，她温柔地低语。她脱下上衣，将她丰满的乳房压在你蛇形的身体上。玛布尔对你咧嘴一笑，然后转过身，将乳房压在你的尾巴上，开始顺着你的身体向后滑行，让你看到了她诱人的臀部。与此同时，她的手指继续在她柔软的身体前方把玩你尾巴敏感的下侧。");
            if(get_player().lib >= 50)
            {
               outputText("你悄悄地伸出手，将手指勾住她衣服的下摆，让她在下一次移动时将衣服扯下一半，露出她的小穴");
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,5) > 0)
            {
               outputText("和 " + marbleCock());
            }
            outputText("。 [say: 哎呀，你这个不知羞耻的 " + get_player().mf("色鬼","荡妇") + "！] 牛娘假装生气地说，并对你眨了眨眼。");
            outputText("[pg]当她回到你的尾巴时，她再次转过身，向你的上半身爬去，同时手指再次在你的尾巴上游走。");
            if(get_player().get_gender() > 0)
            {
               outputText("[pg]当她到达你的生殖裂时，你已经舒服得喘着粗气，并露出了你准备好的");
               if(get_player().hasCock())
               {
                  outputText(get_player().multiCockDescriptLight());
                  if(get_player().hasVagina())
                  {
                     outputText("和");
                  }
               }
               if(get_player().hasVagina())
               {
                  outputText(get_player().vaginaDescript());
               }
               outputText("。 [say: 好了，亲爱的，看来我不需要去挖宝了；它已经在这里等我了，] 她对你耳语。她用一只手");
               if(get_player().hasCock())
               {
                  outputText("抓住你的肉棒");
               }
               else
               {
                  outputText("插入你的小穴");
               }
               outputText("，同时用她长长的舌头舔舐");
               if(get_player().hasCock())
               {
                  outputText("龟头");
               }
               else
               {
                  outputText("阴蒂");
               }
               outputText("。你舒服得大叫起来，开始用你长长的尾巴缠绕玛布尔匀称的身体。你坚持不了多久，很快就达到了高潮的极乐，同时紧紧地依偎着你的牛娘情人。");
               if(get_player().hasCock())
               {
                  outputText("[EachCock] 释放出一股精液，直接射进她的嘴里，她满脸通红，肆无忌惮地吞咽着。");
               }
               if(get_player().hasVagina())
               {
                  outputText("你的[pussy]在你呻吟时流出并喷射出淫液，将你的汁液滴入玛布尔乳房压在你鳞片上的小山谷中。");
               }
            }
            else
            {
               outputText("[pg]当她到达你生殖器所在的位置——如果你有的话——你已经舒服得喘着粗气。玛布尔对你笑了笑，低声说，[say: 别担心亲爱的，我知道怎么让你高潮。] 然后她紧紧地抱住你的身体，伸出手臂挤压和拍打你的[butt]，同时将一根手指滑入你的[asshole]。你惊讶地喘着气，但很快就喘得更厉害了。她一边挑逗你，一边还在你的腹部摩擦她的乳房，这让你更加兴奋，你忍不住将下半身缠绕在玛布尔身上，用身体的每一个部位摩擦她。片刻之后，当你不同寻常的肛门高潮席卷全身时，你在极乐中大叫起来。");
            }
            outputText("[pg]几分钟后，你松开了玛布尔的身体，用尾巴帮她站了起来。她向你伸出一只手，说道：[say: 很高兴你玩得开心，亲爱的；我们来帮你清理一下，好吗？]");
         }
         get_player().orgasm("Generic");
         dynStats(DynStat.Sens(-3));
      }
      
      public function marbleCampFuckFUCKFUCKFUCK() : void
      {
         marbleSprite(true);
         marbleCampSexNew();
      }
      
      public function marbleBreastSize() : String
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1051) > 0)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1056) == 0)
            {
               return "DD罩杯";
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1056) == 1)
            {
               return "G罩杯";
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1056) == 2)
            {
               return "HH罩杯";
            }
            return "J罩杯";
         }
         if(get_player().statusEffectv4(StatusEffects.Marble) > 30)
         {
            return "HH罩杯";
         }
         return "G罩杯";
      }
      
      public function marbleBadEndFollowup() : void
      {
         clearOutput();
         var _loc1_:String = get_player().get_race();
         var _loc2_:String = "";
         if(get_player().get_tallness() < 54)
         {
            _loc2_ = "极矮";
         }
         else if(get_player().get_tallness() < 66)
         {
            _loc2_ = "矮";
         }
         else if(get_player().get_tallness() < 72)
         {
            _loc2_ = "中等";
         }
         else if(get_player().get_tallness() < 84)
         {
            _loc2_ = "高";
         }
         else
         {
            _loc2_ = "very tall";
         }
         outputText("随着时间的推移，你们俩学会了和睦相处，并接受了事情的发展。不久之后，你们俩成了亲密的朋友，甚至成了恋人。同时，你也学会了农场的生活方式，并成功地适应了你的新生活。几个月过去了，日子一天天过去，情况依然如故。直到将近一年后……[pg]");
         outputText("年轻的勇者快步走向谷仓；他真的很期待见到那个狗女孩所说的“他可能认识的人”。也许是另一个勇者！他一边赶路一边想。[pg]");
         if(_loc1_ == "human")
         {
            outputText("当他看到一个非常迷人的");
            if(_loc2_ != "average height")
            {
               outputText(_loc2_ + "");
            }
            outputText(get_player().mf("男性","女性") + "人类正靠在一扇谷仓门上，穿着农场帮工的衣服。看起来[he]正在休息。年轻的勇者脸上带着灿烂的笑容，大步走到[him]面前说道，[say:你好啊，在这个世界里很少能见到人类。]对方抬头看了他一会儿，然后露出认出他的笑容说道，[say:所以他们选了你来找我，是吗？]年轻的勇者盯着这个" + get_player().manWoman() + "看了一会儿，无法回答，这比他希望的还要好！他看着去年的勇者，[name]！[pg]");
            outputText("[saystart]在这个世界里能找到像你这样的朋友，我真是太高兴了，[name]。");
         }
         else
         {
            outputText("然而，他很惊讶地看到一个" + get_player().mf("男性","女性") + "" + _loc1_ + "靠在入口旁边的谷仓墙上。年轻的勇者带着些许不安走近这个" + _loc1_ + "，并对他们喊道：[say:你好，呃，惠特尼说我可能认识你。]这个" + _loc1_ + "抬头看了他一会儿，然后露出认出他的笑容说道，[say:所以他们接下来选了你，是吗？]年轻的勇者对这个声明感到吃惊。[say:你怎么知道我是谁？]他愤愤不平地质问，[say:你对我的家乡了解多少？]对方轻笑了一声说道，[say:我是[name]，尽管我的外表变了，但我还是同一个人。能够改变是这个乱七八糟的世界的乐趣之一。]年轻的勇者不确定地看着他们一会儿，然后意识到这个" + _loc1_ + "说的是实话！[pg]");
            outputText("[saystart]你真的是[name]！我不敢相信你抛弃了你的人性，但我很高兴在这个世界上找到了一个朋友。");
         }
         if(_loc2_ == "very short" || _loc2_ == "short")
         {
            outputText("虽然我发现你比我上次见你时变矮了一点。");
         }
         else if(_loc2_ == "tall" || _loc2_ == "very tall")
         {
            outputText("自从我上次见你以来，你变得更高大了。");
         }
         outputText("你能加入我的营地吗？[sayend]年轻的勇者问道，[say:你的经验会给我很大的帮助，而且我也很乐意能有另一位战士站在我这边。]年长的勇者摇了摇头，回答道：[say:很抱歉，但我早就不做任务了。这里有比那更重要的事情。]年轻的勇者惊恐地看着[him]，问道：[say:还有什么能比我们的任务更重要？][pg]");
         outputText("就在这时，谷仓里传来一个朴实的女性声音。[say:亲爱的，是你认识的人吗？]年长的勇者微笑着回答那个声音：[say:是的，玛布尔。你应该出来见见他。][say:好的，]那个声音回答道。");
         if(get_player().get_gender() == 1 || get_player().get_gender() == 3)
         {
            outputText("随后，一位高挑的牛娘从谷仓入口走了出来。年轻的勇者注意到她非常漂亮，虽然有点气势逼人，但他很快也注意到她显然怀孕了。[pg]");
            outputText("[say:玛布尔，]年长的勇者对她说，[say:这是我的朋友，他其实来自我的村庄。这是玛布尔，她就是我放弃任务的原因。我太在乎她了，而且她怀了我的孩子。]");
            if(get_player().get_gender() == 3 && get_player().mf("m","f") == "f" && get_player().biggestCockArea() < 15)
            {
               outputText("[say:等等，你的孩子？！怎么会？]年轻的勇者结结巴巴地说。年长的勇者对他咧嘴一笑，说道：[say:所以我是你遇到的第一个？那么……]说着，[he]脱下裤子，向他展示了[his][cocks]和[his]" + get_player().vaginaDescript(0) + "。年轻的勇者惊得下巴都掉下来了，只是呆呆地盯着[him]看了一会儿，期间[he]咯咯地笑着对他说：[say:它们的功能也很齐全哦。你想看看它们的实际表现吗？]年轻的勇者发现自己只能结结巴巴地给出一个语无伦次的回答。[say:我想我就当这是“想”了。别担心，会很有趣的。]年长的勇者说着，带着年轻的勇者和玛布尔一起回到了谷仓里。[say:之后，也许我可以给你一些在这个世界生存的建议。]");
            }
            else
            {
               outputText("[say: 真的吗？那我想我应该祝贺你有了新家庭，]年轻的勇者有些不确定地说。[say: 哦，这其实不算是一个新家庭，]另一个勇者回答道，这时两个看起来很像小玛布尔的小女孩从谷仓里跑了出来，一个追着另一个。[say: 哇哦，你找到了一个不错的家庭加入，]年轻的勇者看着女孩们跑向农舍说道。[say: 她们是双胞胎吗？] [say: 不是，]年长的勇者回答，[say: 米莉比奥拉大几个星期，但她们都是我的孩子。]年轻的勇者难以置信地盯着他，结结巴巴地说：[say: 但是怎么可能？她们至少有几岁了！]年长的勇者把手臂搭在年轻勇者的肩膀上，带着他和玛布尔走进谷仓，告诉他：[say: 如果你想在这个世界活下去，你还有很多东西要学。]");
            }
         }
         else
         {
            outputText("接着，一个高大的女性牛娘走出了谷仓的入口。年轻的勇者注意到她有多么漂亮，虽然有点气势逼人。[pg]");
            outputText("[say: 玛布尔，]年长的勇者对她说，[say: 这是新来的勇者，他其实是和我同一个村子的。这是玛布尔，她是我放弃任务的原因。我太在乎她了。]年轻的勇者困惑地看着另一个人。[say: 你这话是什么意思？]他问[him]。玛布尔咯咯地笑了起来，邀请年长的勇者吸吮她的乳头，他们急切地开始这么做。[say: 我——什么？啊？！]年轻的勇者看着这一幕结结巴巴地说，不敢相信自己的眼睛。[say: 就像我的小甜心说的那样，我们有一种特殊的关系，]她微笑着告诉他，很容易就认出了他看到这一幕时被唤起的明显迹象。[say: 你们的关系还包括，嗯，其他事情吗？]他有些紧张地问。年长的勇者从玛布尔的乳房前转过身，走到年轻勇者身边，把[his]手臂搭在年轻勇者的肩膀上。年长勇者的嘴里还滴着一点奶水，带着年轻勇者和玛布尔走进谷仓，说道：[say: 是的，你想加入我们吗？]");
         }
         if(get_knowAddiction() == 1)
         {
            outputText("过了一会儿，[say: 顺便问一下，]从里面传来了玛布尔的声音，[say: 你喜欢牛奶吗？]");
         }
         outputText("[pg]");
         outputText("由于玛布尔的乳汁对你产生的影响，你无法拒绝她，从而放弃了你的任务。不过，你也许有机会帮助下一个人完成他的任务，也许没有。就目前而言，你的故事到此结束了。");
         get_game().gameOver();
      }
      
      public function marbleAtCamp() : Boolean
      {
         if(marbleFollower() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1061) <= 0)
         {
            return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1091) == 0;
         }
         return false;
      }
      
      public function marbleAppearance() : void
      {
         clearOutput();
         get_images().showImage("monster-marble");
         outputText("玛布尔是一个");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,465) == 0)
         {
            outputText("[if (metric) {193|6英尺4英寸}]");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,465) == 1)
         {
            outputText("[if (metric) {203|6英尺8英寸}]");
         }
         else
         {
            outputText("[if (metric) {218|7英尺4英寸}]");
         }
         outputText("[if (metric) {厘米|英寸}] 高的牛娘，虽然她不是很敏捷，但她的肌肉非常强壮；尽管在她的脂肪层下很难发现。<b>她目前穿着农场工人的衣服，使用一把巨大的双手锤作为武器。</b>");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,465) <= 1)
         {
            outputText("她有一张相当正常、柔软的人类脸庞，皮肤颜色较浅。");
         }
         else
         {
            outputText("她有一张柔软的脸，混合了牛和人类的特征，身上覆盖着厚厚的棕色皮毛。");
         }
         outputText("她齐肩的棕色头发被一对从头部两侧伸出的圆形牛耳分开。");
         if(get_player().statusEffectv4(StatusEffects.Marble) <= 20)
         {
            outputText("她的额头上长着两只小角，大小和外观与年轻母牛的角相似。");
         }
         else if(get_player().statusEffectv4(StatusEffects.Marble) <= 50)
         {
            outputText("她的额头上长着两只中等大小的角，大小和外观与母牛的角相似。");
         }
         else
         {
            outputText("她的额头上长着两只相当大的角，外观与母牛的角相似。");
         }
         outputText("她有着宽阔而充满女人味的大腿，吸引着周围人的目光，她丰满的臀部将衣服撑得恰到好处。一条长长的、末端蓬松的牛尾巴在她双腿间来回甩动，仿佛在驱赶苍蝇。她的尾巴上系着一个漂亮的蝴蝶结。两条腿从她的腰部向下生长");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,465) <= 1)
         {
            outputText("，直到大腿中段都还是人类的模样。她小腿的下半部分覆盖着浓密的深棕色皮毛，末端是一对野兽般的蹄子。[pg]");
         }
         else
         {
            outputText("，关节奇特，末端是一对野兽般的蹄子。[pg]");
         }
         if(get_player().statusEffectv4(StatusEffects.Marble) <= 15)
         {
            outputText("她有两团柔软如枕头的乳房，每边都顶着一颗0.4英寸长、正在分泌乳汁的" + marbleNip() + "。她可以轻松撑满一件" + marbleBreastSize() + "罩杯的胸罩。[pg]");
         }
         else if(get_player().statusEffectv4(StatusEffects.Marble) <= 25)
         {
            outputText("她有两团硕大的乳房，每边都顶着一颗0.6英寸长、正在分泌乳汁的" + marbleNip() + "。她可以轻松撑满一件" + marbleBreastSize() + "罩杯的胸罩。[pg]");
         }
         else if(get_player().statusEffectv4(StatusEffects.Marble) <= 35)
         {
            outputText("她有两团篮球大小的乳房，每边都顶着一颗0.8英寸长、渗着乳汁的" + marbleNip() + "。她可以轻松撑满一件" + marbleBreastSize() + "罩杯的胸罩。[pg]");
         }
         else
         {
            outputText("她有两团篮球大小的乳房，每边都顶着一颗1英寸长、渗着乳汁的" + marbleNip() + "。她可以轻松撑满一件" + marbleBreastSize() + "罩杯的胸罩。[pg]");
         }
         switch(pregnancy.get_event())
         {
            case 2:
               outputText("看起来自从来到你的营地后，她长胖了一些。[pg]");
               break;
            case 3:
               outputText("她的肚子微微隆起；她可能怀孕了。[pg]");
               break;
            case 4:
               outputText("她的肚子明显隆起；她几乎可以肯定是怀孕了。[pg]");
               break;
            case 5:
               outputText("她的肚子高高隆起；她显然已经怀孕很久了。[pg]");
               break;
            case 6:
               outputText("她的肚子极度膨胀，当她怀着的东西在里面活动时，肚子偶尔会颤动。[pg]");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1059) < 5 && FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,3) >= 20 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1059) >= 5 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1055) >= 4)
         {
            outputText("<b>玛布尔不安地扭动着身体，也许她需要被挤奶了？</b>[pg]");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,4) > 0)
         {
            outputText("自从你把她带到营地后，她长出了一根" + marbleCock() + "。它有" + Utils.num2Text(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,5)) + "英寸长，" + Utils.num2Text(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,6)) + "英寸粗。[pg]");
         }
         if(get_player().statusEffectv4(StatusEffects.Marble) <= 50)
         {
            outputText("她有一个小穴，阴蒂长0.5英寸。[pg]");
         }
         else if(get_player().statusEffectv4(StatusEffects.Marble) <= 75)
         {
            outputText("她有一个小穴，阴蒂长0.6英寸。你可以看到上面闪烁着湿润的光泽。[pg]");
         }
         else
         {
            outputText("她有一个肉洞，阴蒂长0.7英寸。她的小穴里闪烁着湿润的光泽，阴唇微微张开。[pg]");
         }
         if(get_player().statusEffectv1(StatusEffects.MarbleSpecials) == 0)
         {
            outputText("她有一个未经人事的后庭，位于她那柔软好捏的臀瓣之间，你猜它本来就该长在那儿。");
         }
         else
         {
            outputText("她有一个后庭，位于她那柔软好捏的臀瓣之间，你猜它本来就该长在那儿。");
         }
         doNext(interactWithMarbleAtCamp);
      }
      
      public function marbleAfterRapeYes() : void
      {
         outputText("决定去解决她后，你向谷仓走去。然而，玛布尔在半路上发现了你，并迅速消失在里面。就在你到达入口时，她手里拿着一把巨大的双手锤重新出现了。[say:马上离开，否则这把锤子就会砸进你的脑袋，]她眼神愤怒地对你说，并摆出了战斗姿态。你要和她战斗吗？");
         doYesNo(marbleAfterRapeStartFight,marbleAfterRapeNo);
      }
      
      public function marbleAfterRapeStartFight() : void
      {
         outputText("你也摆出了战斗姿态；是时候报上次的仇了。");
         startCombat(new Marble(),true);
      }
      
      public function marbleAfterRapeNo() : void
      {
         outputText("你摇了摇头。为了这头母牛惹上一身麻烦实在不值得。你转过身离开；你再也不会见到她了。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function marbleAfterRapeBattle() : void
      {
         outputText("在农场探索时，你注意到之前打你的那个牛娘玛布尔正从谷仓里出来。如果你想的话，可以试着去和她对峙，或者从现在起就避开她。");
         doYesNo(marbleAfterRapeYes,marbleAfterRapeNo);
      }
      
      public function marbleAddictionStart(param1:Boolean) : void
      {
         if(param1)
         {
            clearOutput();
         }
         outputText("你靠在她的胸前，呼吸着她的气味。你感到一种莫名的平静，然后就睡着了，脸还埋在她的胸部里。过了一会儿你醒来，发现你们俩现在正躺在她的床上，玛布尔正心不在焉地抚摸着你的头。她注意到你醒了，咯咯地笑了起来，[say:早上好，瞌睡虫。这还是第一次有人喝着我的特制牛奶睡着呢。你喜欢吗？]");
         outputText("[pg]一提到她的奶，你突然觉得你还想要更多。事实上，你非常想要。你转过身时开始发抖，被对奶的渴望所淹没，乞求玛布尔让你再喝一点。她对你的渴望感到惊讶，但还是同意让你喝。当她的奶涌入你的嘴里时，你感到身体平静下来，那种欣快感再次传遍全身。一个令人不安的念头闪过你的脑海，你瞪大了眼睛。你听到玛布尔在你上方倒吸了一口凉气，她显然也意识到了你刚刚意识到的事情。[pg]");
         outputText("<b>玛布尔的奶会让人上瘾，而你现在已经上瘾了。</b>[pg]");
         outputText("你从她身上退开，抬头看着她的眼睛。[say:亲爱的，你感觉怎么样？你喜欢喝我的奶吗？你想一直喝我的奶吗？]她有些不确定地对你说。你该怎么回答？");
         doYesNo(wantMarbleAddiction,doNotWantMarbleAddiction);
      }
      
      public function marbleAddictionSex(param1:Boolean = true) : void
      {
         spriteSelect(SpriteDb.get_s_marble());
         if(param1)
         {
            clearOutput();
            doNext(get_camp().returnToCampUseOneHour);
         }
         if(get_player().get_gender() == 0)
         {
            marbleGenderlessNoFuck();
            return;
         }
         outputText("你们互相摩擦着，你的手忙着脱去玛布尔的衣服，而她的手也在脱你的衣服。当你们各自的衣服掉落在地板上时，");
         if(get_player().get_tallness() < 66)
         {
            outputText("玛布尔弯下腰，深深地吻了你的嘴唇，你也热切地回应了这个吻。她把你举到半空中，嘴唇依然紧贴着你的嘴唇，把你紧紧地抱在怀里。整整过了一分钟，她才把你放下来，让你们的身体结合在一起。[pg]");
         }
         else if(get_player().get_tallness() < 78)
         {
            outputText("玛布尔低下头，双唇紧紧锁住你的双唇，展现出你热切回应的激情。你们俩就这样保持了一会儿，时间仿佛静止了。然后玛布尔结束了亲吻，深深地看着你的眼睛，脸上浮现出狡黠的笑容。[pg]");
         }
         else
         {
            outputText("玛布尔捧起你的脸，将你的嘴唇拉向她，献上一个热烈的吻。你迫不及待地迎合着她。即使她没有紧紧抓住你的头，你也觉得根本无法离开她那美妙的嘴唇。但最终你还是退后了一点，深情地凝视着她的眼睛。[pg]");
         }
         if(get_player().totalCocks() > 0)
         {
            outputText("你们俩都能清晰地感觉到彼此的渴望，当那一刻到来时，谁也没有犹豫。你和玛布尔紧紧贴在一起，将你的[cock]深深地推入玛布尔柔软的阴户中。你们俩颤抖着，沉浸在结合的美妙感觉中，然后开始温柔地在彼此身上摇摆。现在对你来说，除了你双臂紧紧环抱的这具温暖、充满爱意的身体，其他什么都不重要了");
            if(get_player().get_tallness() >= 48 && get_player().get_tallness() <= 60)
            {
               outputText("，你的头被夹在她的双乳之间，");
            }
            outputText("以及你的[cock]深埋的温暖褶皱。你忍不住想，玛布尔是一个多么好的人，你打赌玛布尔对你也有同样的感觉。[say:我爱你，亲爱的。]玛布尔温柔地对你说。你向她保证你有同样的感觉，在这一刻，其他什么都不重要了。[pg]");
         }
         else if(int(get_player().vaginas.length) > 0)
         {
            outputText("你们俩都能清晰地感觉到彼此的渴望。玛布尔咯咯地笑着，伸手到身后拿了什么东西。她向你展示了一根长长的双头假阳具，并解释说它将把你们俩连接起来。她把假阳具的一端推入你的" + get_player().vaginaDescript(0) + "，另一端推入她自己阴户的褶皱中。");
            get_player().cuntChange(8,true);
            outputText("你们俩颤抖着，沉浸在结合的美妙感觉中，然后开始温柔地在彼此身上摇摆。现在对你来说，除了你双臂紧紧环抱的这具温暖、充满爱意的身体，其他什么都不重要了");
            if(get_player().get_tallness() >= 48 && get_player().get_tallness() <= 60)
            {
               outputText("以及你的头被夹在她的双乳之间");
            }
            outputText("。你忍不住想，玛布尔是一个多么好的人，你打赌玛布尔对你也有同样的感觉。[say:我爱你，亲爱的。]玛布尔温柔地对你说。你向她保证你有同样的感觉，在这一刻，其他什么都不重要了。");
            outputText("[pg]");
         }
         outputText("在你们俩做爱结束很久之后，你们仍然继续拥抱着彼此。最终玛布尔");
         if(get_player().get_tallness() < 66)
         {
            outputText("把你放下来，然后");
         }
         outputText("把你推到一臂的距离，问你：[say:如果你不介意的话，我们可以住在一起吗？]你犹豫了一下，然后解释说你觉得这不是个好主意。你解释说你不是这个世界的人，你为什么来这里，以及你来到这里后发现了什么。玛布尔看着你，过了一会儿，她放开你，走到她的床边。她毫不费力地把床从地上举起来，转向你。[say:我能尽我的一份力，所以你别以为我帮不了你做这么重要的事情，勇者，]她说着，把床放回原处。当她说出“勇者”这个词时，她几乎无法保持严肃的表情。你微笑着，想知道你怎么可能拒绝这么好的人。[say:好吧，我想那就这么定了，]她高兴地说，[say:我马上搬进去。]");
         get_player().orgasm("Generic");
         if(get_player().hasCock())
         {
            marblePreggoChance();
         }
      }
      
      public function leaveNonFriendsMarble4EVERRRR() : void
      {
         clearOutput();
         get_player().createStatusEffect(StatusEffects.NoMoreMarble,0,0,0,0);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,463,2);
         outputText("你面无表情地回应了这位牛娘，摇了摇头转身离开，决定从今往后避开玛布尔。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function leaveNonFriendsMarble() : void
      {
         clearOutput();
         outputText("你礼貌地微笑着，和玛布尔一样虚情假意，请求她的原谅并借故离开。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function kidsPlayingFarmers() : void
      {
         outputText("你一踏进育婴室，你的[if (marbleMultiKids){孩子们就跑|[if (marbleSoleBoy){儿子|女儿}]就跑}]向你，兴奋地喊道：[say:[Daddy]，[Daddy]！]在接下来的半个小时里，你们在外面一起玩农夫游戏，");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,8) > 1)
         {
            outputText("尽管你的孩子们决定不了谁是");
         }
         else
         {
            outputText("和你的小[if(marbleSoleBoy){男孩|女孩}]作为");
         }
         outputText("农场的主人。[pg]");
         if(get_game().telAdre.isAllowedInto() && Utils.trueOnceInN(3))
         {
            marbleKidsAtTelAdre();
         }
         outputText("最后，玛布尔过来看你们在做什么，也被拉进了角色扮演中。她在假想农场的工作与她在惠特尼那里的工作非常相似，尽管她扮演了不同的角色。你的[if (marbleMultiKids){孩子们觉得|[if (marbleSoleBoy){儿子|女儿}]觉得}]她模仿惠特尼的口音很搞笑，尽管不如你模仿玛布尔那么像。");
         outputText("[pg]你又陪着玩了一会儿，直到你的孩子[if (marbleMultiKids){们玩累了，回到|玩累了，回到}]育儿室。");
      }
      
      public function kidsHaveRatPlaytime() : void
      {
         outputText("你和[if (marbleMultiKids){孩子们|[if (marbleSoleBoy){你的儿子|你的女儿}]}]度过了一些闲暇时光。");
         outputText("你们在营地周围玩耍，直到遇到了拉萨祖尔；他正在调配另一种药剂，炼金设备上冒出阵阵青烟。出于好奇，你的[if(marbleMultiKids){孩子们跑向|[if (marbleSoleBoy){儿子|女儿}]跑向}]他，想近距离看看他的工作，并问他在做什么。");
         outputText("[pg]他没有把视线从设备上移开，解释说他正在试验一种新药水，这只会让你的");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,8) > 1)
         {
            outputText("孩子们更加好奇。他们问他");
         }
         else
         {
            outputText("[if (marbleSoleBoy){儿子更加好奇。他|女儿更加好奇。她}]问他");
         }
         outputText("他的炼金术是如何运作的，老鼠[if (nofur){人|兽人}]抬起头，感到又惊又喜。");
         outputText("[pg]拉萨祖尔多年的经验从他谈论炼金术基础知识的方式中显露无疑，他在继续制作药水的同时，用简化的方式解释了整个过程，并说明了他是如何应用这些知识的。[if (inte <= 30){和你一样，你|你}]的");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,8) > 1)
         {
            outputText("孩子们对他说的内容一窍不通，但在整个解释过程中他们一直很感兴趣。");
         }
         else
         {
            outputText("[if (marbleSoleBoy){儿子|女儿}]对他说的内容一窍不通，但在他解释的过程中一直对一切都很感兴趣。");
         }
         outputText("拉萨祖尔的课程结束后，你的[if (marbleMultiKids){孩子们向|[if (marbleSoleBoy){儿子|女儿}]向}]他道别，然后你们回到了育儿室。");
      }
      
      public function interactWithMarbleAtCamp() : void
      {
         var _g:Camp;
         clearOutput();
         marbleSprite();
         var _loc1_:Function = null;
         get_akky().locationDesc("玛布尔");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1059) != 2)
         {
            outputText("你要如何与玛布尔互动？");
         }
         else
         {
            outputText("[say:你好，亲爱的；你有机会和那个炼金术士谈谈了吗？我终于快要变得纯洁了，但如果我要跨过这最后一道坎，我需要他的帮助。]");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,8) > 0)
         {
            _loc1_ = marbleKidsPlaytime;
         }
         menu();
         addButton(0,"外貌",marbleAppearance).hint("仔细看看这个牛女孩。");
         addButton(1,"交谈",talkWithMarbleAtCamp).hint("和玛布尔谈论各种话题。");
         addButton(2,"做爱",marbleSexMenu).hint("向牛娘求欢。");
         addButton(5,"孩子",_loc1_).hint("花点时间陪陪你和玛布尔的孩子。");
         addRowButton(1,"给予物品",giveItem).hint("把物品栏里的东西给玛布尔。").disableIf(!canGiveItem(),"你没有什么可以给她的。");
         addRowButton(1,"收取礼物",marbleGathered).hint("收下玛布尔为你找到的东西。她给你准备了礼物，是不是很贴心？").disableIf(!get_player().hasStatusEffect(StatusEffects.MarbleHasItem),"玛布尔以后可能会再为你找到些什么。");
         addRowButton(1,"要奶",gotMilk).hint("向玛布尔要一瓶她的奶。").disableIf(get_player().itemCount(get_consumables().M__MILK) >= 5,"玛布尔现在不能给你更多的奶了。");
         if(FlagDict_Impl_.arrayReadString(KFLAGS.flags,701) != "Marble")
         {
            addButton(9,"共眠",marbleSleepToggle);
         }
         else
         {
            addButton(9,"独眠",marbleSleepToggle);
         }
         addButton(10,"分手",breakUpWithMarble).hint("把玛布尔永远赶出你的营地。你确定要这么做吗？");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1059) == 3 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1058) == 0)
         {
            addRowButton(2,"出发",get_marblePurification().murbleShouldGoRunAlongAndGetHerCuntySisterSoTheyCanBeCuntsTogether).hint("派玛布尔出去找她的家人，以便制作治疗她腐化的解药。");
         }
         _g = get_camp();
         addButton(14,"返回",function():void
         {
            _g.campLoversMenu();
         });
      }
      
      public function helpMarble2() : void
      {
         spriteSelect(SpriteDb.get_s_marble());
         outputText("你在农场碰到了惠特尼，问她有没有什么你可以帮忙的。[pg]");
         outputText("[say:我想到了；你可以帮玛布尔除草。她现在就在那边的田里，]惠特尼指着附近的一个牧场说。你向她点点头，出发去帮这位漂亮的牛娘干活。你花了一段时间才找到她，但你最终发现玛布尔弯着腰，屁股撅在空中。当你走近时，你意识到她正在咀嚼一根杂草。[say:哦！]她惊呼道，注意到了你。她急忙直起身子，有点尴尬地环顾四周。[say:嗨，亲爱的，你在这里做什么？]你解释说惠特尼建议你可以帮她除草。[say:哦！]她又惊呼了一声，[say:我想那会很好，但我吃东西的时候别老盯着我的屁股看，好吗？]你同意了，开始工作。[pg]");
         if(get_player().get_spe() < 20)
         {
            outputText("尽管玛布尔经常停下来嚼杂草，但她拔的草还是比你多。别看她体型大，动作却出奇地快。不管怎样，她很享受你陪她一起干活，而你也很享受这番美景。[pg]");
         }
         if(get_player().get_spe() >= 20 && get_player().get_spe() < 50)
         {
            outputText("你很努力地清理杂草，而玛布尔在发现看起来很好吃的杂草时，也经常让你大饱眼福，好好欣赏她的翘臀。[pg]");
         }
         if(get_player().get_spe() >= 50 && get_player().get_spe() < 80)
         {
            outputText("你在田野里快速穿梭，速度之快让玛布尔大吃一惊，她开玩笑地撅起嘴，抱怨你把好吃的杂草都抢光了。不过，你还是看到了几次她那迷人的屁股。[pg]");
         }
         if(get_player().get_spe() >= 80)
         {
            outputText("除草对你来说简直是小菜一碟，你的速度快到把杂草送到玛布尔面前的速度比她吃的还快。最后，几乎所有的活都是你一个人干的。为了奖励你的努力，她让你好好欣赏了一番美景。[pg]");
         }
         dynStats(DynStat.Spe(1.5));
         set_marbleAffection(get_marbleAffection() + int(Math.round(get_player().get_spe() / 10)));
         dynStats(DynStat.Lust(10));
         if(afterMarbleHelp())
         {
            return;
         }
         outputText("当你们俩干完活准备离开时，玛布尔叫住了你，[say:等一下，我给你点东西！]你转过身，看着她朝你跑来。牛娘灿烂地笑着，递给你一瓶温热的牛奶，[say:这是给你的谢礼，新鲜出炉的哦，]她拍了拍自己丰满的胸部说道。[pg]");
         get_inventory().takeItem(get_consumables().M__MILK,get_camp().returnToCampUseOneHour);
      }
      
      public function helpMarble1() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_marble());
         outputText("[say:你知道，玛布尔现在正在搬运一些农产品。你去帮帮她怎么样？]惠特尼建议道。你同意帮助这位丰满的牛娘，惠特尼指引你去了储藏室。你到达时发现玛布尔正忙着把成堆的板条箱搬进谷仓。她看到你时对你笑了笑，喊道：[say:嘿，亲爱的！很高兴见到你。]当你告诉她你是来帮忙的时，她的笑容更灿烂了。[say:哦，我很乐意有人帮忙。如果你能帮我一把，我就能少跑几趟了，]她高兴地说，然后换上一副严肃的表情继续说，[say:但别勉强自己，亲爱的，这些很重。我不想你受伤。]说完，你和她一起开始工作。[pg]");
         if(get_player().get_str() < 20)
         {
            outputText("不幸的是，板条箱很重，你只能搬小一点的，才能跟上玛布尔的步伐。她似乎并不介意，只是享受在工作时有人陪她聊天，即使这并不能让她少跑几趟。[pg]");
         }
         if(get_player().get_str() >= 20 && get_player().get_str() < 50)
         {
            outputText("你尽力了，但你每搬一个板条箱，玛布尔就能搬三个。不过她并不介意，因为你最终能帮她省下四分之一的行程。[pg]");
         }
         if(get_player().get_str() >= 50 && get_player().get_str() < 80)
         {
            outputText("你全力以赴，设法在努力程度上与玛布尔相匹配。她对你的力量印象深刻，你们一起可以将所需的行程减半。[pg]");
         }
         if(get_player().get_str() >= 80)
         {
            outputText("玛布尔可能很强壮，但你更强壮。当你一次能搬比她更多的板条箱时，她感到很惊讶，你只受限于你能平衡的数量。多亏了你的努力，这项杂务只花了平时三分之一的行程。[pg]");
         }
         outputText("过了一会儿，你注意到玛布尔在搬运板条箱时，臀部摇摆得几乎令人着迷；你很难把目光从她身上移开。");
         if(afterMarbleHelp())
         {
            return;
         }
         outputText("当你们俩干完活准备离开时，玛布尔叫住了你，[say:等一下，我给你点东西！]你转过身，看着她朝你跑来。牛娘灿烂地笑着，递给你一瓶温热的牛奶，[say:这是给你的谢礼，新鲜出炉的哦，]她拍了拍自己丰满的胸部说道。[pg]");
         dynStats(DynStat.Str(1));
         set_marbleAffection(get_marbleAffection() + int(Math.round(get_player().get_str() / 10)));
         dynStats(DynStat.Lust(10));
         get_inventory().takeItem(get_consumables().M__MILK,get_camp().returnToCampUseOneHour);
      }
      
      public function gotMilk() : void
      {
         clearOutput();
         outputText("你向玛布尔要了一瓶她的奶，她高兴地递给了你。");
         get_inventory().takeItem(get_consumables().M__MILK,interactWithMarbleAtCamp);
      }
      
      public function giveMurbleProBova() : void
      {
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,465) == 0)
         {
            outputText("你把ProBova的瓶子递给玛布尔。她考虑了一会儿，然后看着你说道：[say: 从标签上看，这可能会让我变得比现在更像牛，亲爱的。我并不反对这个想法，但这将是永久性的。你确定要我喝吗？]");
            doYesNo(giveMarbleTheProBovas4Sho,giveItem);
         }
         else
         {
            outputText("你递给玛布尔另一瓶ProBova。她认真地盯着你的脸看了一会儿，然后说道：[say: 那么，你绝对确定要我喝下这个吗？记住，无论发生什么，都可能是永久性的。]");
            doYesNo(giveMarbleTheProBovas4Sho,giveItem);
         }
      }
      
      public function giveMarbleTheProBovas4Sho() : void
      {
         clearOutput();
         get_player().consumeItem(get_consumables().PROBOVA);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,465) == 0)
         {
            outputText("玛布尔点点头，将里面的液体一饮而尽。起初什么也没发生……然后她喘着粗气，捂住胸口，微微向前踉跄。这位牛娘直起身子，松开手，拉开上衣看着自己的乳房。<b>现在每个乳房上都长着四个乳头，就像母牛的乳头一样。以营地为背景来看，她的身高也增加了大约4英寸。</b>");
            outputText("[pg]玛布尔花了几分钟测试她的新乳头，轻轻挤压它们，当乳汁不是一滴而是四滴地装饰着她的乳晕时，她叹了口气，然后看着你说：[say: 这其实也没那么糟。实际上，感觉还不错。如果你能找到另一剂，我愿意喝下它——当然，只是为了看看会发生什么。]");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,465,1);
            set_marbleAffection(get_marbleAffection() + 4);
            set_marbleAddiction(get_marbleAddiction() + 4);
         }
         else
         {
            outputText("玛布尔深吸了一口气，说道：[say: 我这样做是因为我太爱你了。记住这一点，好吗，亲爱的？] 女人轻松地喝下瓶里的液体，准备迎接即将到来的变化。她做的第一个动作是心不在焉地抓挠手臂，但这很快引发了全身发痒的连锁反应，<b>她的皮肤开始长出一簇簇棕色的毛发，最终完全覆盖了她</b>。");
            outputText("[pg]她全神贯注地抓挠着不习惯发痒的皮毛，没有注意到自己长高了；<b>在你的眼里，她看起来长高了大约8英寸。</b>");
            outputText("[pg]女人痛苦地叫了一声，双手捂住脸，然后尴尬地转过身去，动作中微微踉跄。你本能地向她伸出手，但她很快转过身来，揭示了原因；<b>她的脸变长了，重新塑造成了像牛一样的口鼻！</b>");
            outputText("[pg]外表的变化似乎到此为止，但玛布尔又喘了几口粗气，然后看着你。你回望着她；她不再是一个牛娘，而是一个完全的牛形态。她给了你一个犹豫的微笑，问道：[say: 那么，我看起来怎么样？] 你没什么好说的，因为她是应你的要求改变的，所以你给了她一个令人安心的拥抱，告诉她她看起来一样美丽。");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,465,2);
            marbleSprite();
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function giveMarbleTailjobRelease() : void
      {
         clearOutput();
         marbleSprite(true);
         outputText("你告诉玛布尔，虽然你今天没心情给她口交，但你也不会就这么放着她不管，并请求她的允许来尝试一种奇特的替代方案。她缓慢地点了点头，显然不太确定你的意思，也不知道自己是否应该同意。");
         outputText("[pg]你对她咧嘴一笑，慢慢地将你蛇一般的尾巴移向她的腿，然后顺着她牛一样的小腿向上，移向她的大腿。她的身体因为这种感觉而颤抖，当她低下头时，她终于明白了你的意图，并对你温柔地笑了笑。");
         outputText("[pg]你将蛇尾滑入她的双腿之间，决定先从她原本的生殖器开始。尾尖缓缓滑过她已经有些湿润的阴唇，然后轻轻探入。这突如其来的触感让她几乎惊跳起来，丰满的双乳随之诱人地晃动。你在入口处轻轻挑逗，随后突然将尾巴更深地探入并在里面扭动。她的臀部开始摇摆，嘴里发出呻吟，下体也愈发湿润。扭动了一会儿后，你收缩尾巴的肌肉，在她的阴道内抽插了几下，惹得她柔软的臀部一阵颤动，又发出一声娇喘。");
         outputText("[pg]感觉尾巴上的润滑和她的兴奋度都已足够，你将尾巴从她的阴道中抽出，向上滑向了那个“罪魁祸首”——玛布尔那根长达" + Utils.num2Text(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,5)) + "英寸、完全勃起的肉棒。你提醒她如果勒得太紧就告诉你，然后用尾尖轻轻戳弄，坚持不懈地顶着她肉棒的根部。慢慢地，你顺着肉棒向上滑动，直到尾尖抚弄着她敏感的龟头；接着，你将沾满淫液的鳞片性感地缠绕在她粗壮的阴茎上，轻轻挤压并包裹住它。你用湿润的尾巴慢慢覆盖住她整个男性象征，然后猛地收紧，惹得她惊叫出声。随后，你开始上下套弄缠绕的尾巴，从头到尾地为她手淫。");
         outputText("[pg]玛布尔显然不满足于只是站在那里任由你套弄她的肉棒；她的一只手温柔地抚摸着你的尾尖，另一只手则揉捏着自己的乳房，把玩着乳头。看到她如此享受，你也很高兴，于是再次调整尾巴，用尾尖摩擦她敏感的阴蒂，同时用靠近尾尖的部分继续套弄她的男性生殖器。玛布尔大声呻吟起来，双手也不再游移，一只手紧紧攥住你的尾巴，另一只手则有些粗暴地抓揉着自己柔软的乳房。看来，同时刺激她的两个部位，很快就能让她高潮了……你决定进入正戏。");
         outputText("[pg]你调整了缠绕在她勃起肉棒上的尾巴，让你的动作能更有效地刺激她。尾尖垂下，摩擦着她的阴蒂，同时你将尾巴推进她的体内。伴随着强烈而又小心的抽插和套弄，她兴奋地喘息着，身体几乎要扭曲起来。[say:亲……亲爱的，你同时挑逗的地方太多了……]她半推半就地低语道。你不得不承认，感受她敏感的部位，并能用尾巴彻底探索她柔软的身体，这也让你感到十分兴奋。");
         outputText("[pg]没过多久，她就高潮了。在她的阴道壁上又抽插了几下后，她发出了一声如牛叫般的呻吟。你感觉到她正有节奏地收缩着，紧紧夹住你的尾巴，同时她的肉棒也在抽搐，将黏稠的液体直接射在了你缠绕的尾巴上。");
         outputText("[pg]玛布尔很快停止了呻吟，温柔地看着你，充满爱意地再次抚摸你的尾巴。");
         if(get_player().isCorruptEnough(70))
         {
            outputText("[pg]你当然不介意这种证明你能力的印记留在你的下半身，但你能想到更好的处理方式。事实上，你正慢慢地将尾巴移向你的嘴唇。");
            if(get_player().tongue.type == 1 || get_player().hasLongTongue())
            {
               outputText("你的舌头沿着尾巴末端舔舐，品尝着玛布尔的女性分泌物和她的精液。当你舔舐她的汁液时，她向你投来炽热的目光。你对她咧嘴一笑。");
            }
            if(get_player().hasLongTongue())
            {
               outputText("你决定为玛布尔表演一番，你摆动着尾巴，伸出你那非人般长长的舌头，色情地舔舐着她的分泌物，同时盯着她看。在你的注视下，她很快就脸红了。");
            }
            outputText("[pg][say: 亲爱的，你该不会是想让我再次发情吧？]");
            outputText("[pg][say: 嗯……当然，当你没心情的时候，重复这样做会很不错。不过，我希望下次我们能一起玩得开心……谢谢你，亲爱的。]");
            get_player().slimeFeed();
         }
         dynStats(DynStat.Lust(20));
         FlagDict_Impl_.arrayWriteFloat(KFLAGS.flags,3,0);
         doNext(playerMenu);
      }
      
      public function giveMarbleLactaid() : void
      {
         clearOutput();
         get_player().consumeItem(get_consumables().LACTAID);
         outputText("你向玛布尔展示了你找到的那瓶催乳剂，问她能不能喝。她给了你一个会意的微笑。[say: 所以你想要一份特别的款待？好的，亲爱的，把它给我。] 她从你手中接过瓶子，轻松地喝下了液体。没过多久，她喘着粗气，然后");
         if(get_player().get_tallness() < 60)
         {
            outputText("把你举到她的胸前，然后气喘吁吁地说：[say: 现在喝吧！] 你毫不犹豫地照做了。[pg]");
         }
         else if(get_player().get_tallness() > 72)
         {
            outputText("气喘吁吁地说：[say: 现在喝吧！] 你毫不犹豫地扑向她的乳房。[pg]");
         }
         else
         {
            outputText("气喘吁吁地说：[say: 现在喝吧！] 你迅速凑上前去喝了起来。[pg]");
         }
         outputText("碰到你嘴唇的东西让你感到惊讶；它尝起来更美味、更健康，简直比平时好太多了。你费了一番功夫，终于吸空了她的乳房，尽管里面似乎装了比平时更多的奶水。你感觉比平时更有力量，整个世界似乎也变得更清晰了。然而，玛布尔似乎有点失望；看来催乳剂对她的影响只是暂时的。[pg]");
         dynStats(DynStat.Str(1),DynStat.Tou(1),DynStat.Inte(1));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function giveItem() : void
      {
         clearOutput();
         outputText("你想给玛布尔什么物品？");
         menu();
         addButton(1,get_consumables().OVIELIX.get_shortName(),marbleOvulatesLikeMadDawg).disableIf(!get_player().hasItem(get_consumables().OVIELIX,1));
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,4) == 0)
         {
            addButton(2,get_consumables().P_DRAFT.get_shortName(),MarbleDigsDraftsYo).disableIf(!get_player().hasItem(get_consumables().P_DRAFT,1));
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,4) > 0)
         {
            addButton(3,get_consumables().PINKEGG.get_shortName(),MarblepinkEgg).disableIf(!get_player().hasItem(get_consumables().PINKEGG,1));
            addButton(4,get_consumables().L_PNKEG.get_shortName(),MarbleLPinkEgg).disableIf(!get_player().hasItem(get_consumables().L_PNKEG,1));
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,465) < 2)
         {
            addButton(5,get_consumables().PROBOVA.get_shortName(),giveMurbleProBova).disableIf(!get_player().hasItem(get_consumables().PROBOVA,1));
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1059) == 1)
         {
            addButton(6,get_consumables().P_LBOVA.get_shortName(),get_marblePurification().giveMarblePureQuestLabova).disableIf(!get_player().hasItem(get_consumables().P_LBOVA,1));
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1059) >= 5)
         {
            addButton(7,get_consumables().P_S_MLK.get_shortName(),get_marblePurification().purifiedSuccubusMilkForPureMarbles).disableIf(!get_player().hasItem(get_consumables().P_S_MLK,1));
            addButton(8,get_consumables().REDUCTO.get_shortName(),get_marblePurification().pureMurbleUsesReducto).disableIf(!get_player().hasItem(get_consumables().REDUCTO,1));
            addButton(0,get_consumables().LACTAID.get_shortName(),get_marblePurification().lactaidForPureMurble).disableIf(!get_player().hasItem(get_consumables().LACTAID,1));
         }
         else if(get_player().hasPerk(PerkLib.MarblesMilk))
         {
            addButton(0,get_consumables().LACTAID.get_shortName(),giveMarbleLactaid).disableIf(!get_player().hasItem(get_consumables().LACTAID));
         }
         else
         {
            addButtonDisabled(0,get_consumables().LACTAID.get_shortName());
         }
         addButton(14,"返回",interactWithMarbleAtCamp);
      }
      
      public function get_marbleAffection() : int
      {
         return int(get_player().statusEffectv1(StatusEffects.Marble));
      }
      
      public function get_marbleAddiction() : int
      {
         return int(get_player().statusEffectv2(StatusEffects.Marble));
      }
      
      public function get_knowAddiction() : int
      {
         return int(get_player().statusEffectv3(StatusEffects.Marble));
      }
      
      public function getOutOfDodge() : void
      {
         clearOutput();
         outputText("去你的吧……不管出现多少把会说话的锤子，事实就是事实。发泄完毕后，你离开了农场，把那些牛抛在脑后。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,463,3);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function forceFeedMarble() : void
      {
         clearOutput();
         if(get_player().hasPerk(PerkLib.Feeder))
         {
            outputText("你敢打赌，这个牛娘肯定和你一样喜欢被挤奶和吸吮，但她有多经常能尝到牛奶那奶油般的甜味呢？让她吸吮你自己漏奶的乳头，算是帮了她一个忙，对吧？你走近被击败的牛娘；她的眼睛仍然死死盯着你，想知道你接下来要做什么。好吧，在这么多人看着你的情况下，你也做不了什么……[pg]");
         }
         outputText("直到现在你才真正注意到这个农场里住了多少人。他们可能都以为你要强暴她——从你得到的眼神来看，并不是所有人都接受这个想法。管他呢，反正你也可以在这些旁观者的注视下继续你的事……你99%确定喂一头牛不会惹上麻烦。");
         outputText("[pg]你脱下上半身的[armor]，向所有人展示你的[chest]；旁观者中传来几声嘘声和口哨声。你尽力无视他们……现在你的世界里只有你和玛布尔。你在牛娘身边跪下，让她坐起来，把她的头抬到你的胸前。");
         if(get_player().biggestTitSize() <= 2)
         {
            outputText("[pg]你把她柔软的嘴唇按在你的乳头上");
         }
         else
         {
            outputText("[pg]你把乳头抬到她嘴边，按在她柔软的嘴唇上");
         }
         outputText("，但她紧闭双唇，拒绝喝你甜美的乳汁。");
         outputText("[pg][say: 来吧，亲爱的；不喝牛奶是长不高、长不壮的，] 你戏谑道。");
         outputText("[pg]你对她自尊心的打击让她发出一声愤怒的声音，她嘴唇的这道微小缝隙让你得以将满是乳汁的乳头滑进她嘴里，并挤了几股进去。她没有吞下乳汁，而是让温热的液体积聚起来，她的脸颊也随之鼓起。");
         outputText("[pg][say: 别像个小孩子一样，玛布尔，] 你说。[say: 喝！你的！牛奶！]");
         outputText("[pg]说到最后一个字时，你残忍地抓住并挤压了她自己的一个乳房，导致她喘着气咽下了你的乳汁，同时她自己的乳汁也弄湿了她的衬衫。");
         outputText("[pg][say: 哎呀，看看你弄得一团糟。来，让我帮你一把。]");
         outputText("[pg]你伸手探进玛布尔的衬衫，把她那对闪闪发光、湿漉漉的HH罩杯乳房完全掏了出来，暴露在众人面前。人群中又爆发出一阵起哄和口哨声。");
         outputText("[pg][say: 好了，现在我可以随心所欲地揉捏你这对大奶子，而且不会弄得那么脏了。]");
         outputText("[pg]你心里清楚，不管玛布尔是穿得严严实实还是光着屁股，场面肯定还是会弄得一团糟。但不给观众展示这对美味的大奶子，那可就太不敬业了，对吧？至于你自己的需求嘛，又有几股你的乳汁汇聚在了玛布尔的嘴里。你再次用力挤压她，迫使她的乳汁顺着你的指缝流下，浸湿了你的手和整条手臂，但她紧闭双眼，坚定地忍受着这些侵犯。看来粗暴的揉捏是行不通了，于是你停止挤压她那装满乳汁的奶子，转而开始玩弄那敏感肿胀的乳头。她猛地睁开眼睛，惊讶之情溢于言表。");
         outputText("[pg][say: 我知道被挤奶是什么感觉，玛布尔，所以我打算停下来……直到你像个乖女孩一样开始吃奶。毕竟，这样才显得公平。]你又调皮地拉扯扭动她的小乳头，惹得她对着你的乳房呻吟起来。");
         outputText("[pg]看来你成功地把玛布尔逼到了绝境，让她体验了一把牛娘版的“欲求不满”。她四下张望，试图寻找任何能帮她决定下一步该怎么做的线索。终于，她发出一声闷哼，闭上眼睛，咽下了自己的骄傲——连同你的乳汁一起。她吸吮的动作缓慢、舒缓，甚至带着一丝愉悦。这头母牛绝对掌握了吸吮乳头的技巧。她的嘴唇紧紧裹住乳头，舌头在上面舔舐环绕，引得你温暖的乳汁源源不断地流进她的喉咙。她原本坚定的脸庞已经变得像熟睡者一样柔和，当你把一个乳头拔出来换成另一个时，她完全顺从，仿佛心智退化到了婴儿状态。");
         outputText("[pg]既然她遵守了约定，你也不妨给她那对奶子来一次彻底的手工挤奶。你抓住她柔软的乳头，开始挤压拉扯，迫使她发出阵阵闷哼和呻吟，同时强劲的乳汁从她的胸前喷射而出——这给了你一个灵感。当你熟练地瞄准地面喷射时，人群中一些看懂你意图的人发出了几声赞叹。你把玛布尔的乳汁挤在干燥坚实的泥土上，乳汁交汇融合……用不规则、流淌的字母拼出了[say: [name]]。你继续粗暴地挤奶，添加着涂鸦和装饰，直到她的母乳快要耗尽，乳房至少缩小了两个罩杯。如果她现在站起来，那滑稽的不对称模样绝对会让人忍俊不禁。这主意真是绝了。");
         outputText("[pg]当她感觉到拉扯停止时，嘴巴放松了下来，意识也逐渐恢复。[say: 什——嘿！你还得弄另一边乳房！]");
         outputText("[pg][say: 抱歉，]你托着自己还有一半乳汁的乳房说道，[say: 但不把奶喝完的坏女孩是应该受到惩罚的。]当你抽身离开时，她只能瞪大眼睛，气得浑身发抖地看着你——然而，就连她的颤抖都很滑稽，一边乳房剧烈地晃动，另一边却几乎纹丝不动。");
         outputText("[pg]聚集在周围的人群慢慢散去，对事态的发展和这个疯狂的牛娘心存顾虑，很快就只剩下那些明显“兴奋”的旁观者了。她试图站起来时，乳房又晃动了一下，然后开始膨胀。那只被吸干的乳房像气球一样鼓了起来，随着她牛类身体重新补充乳汁储备，又恢复到了原来的大小；而另一只则只是微微晃动和肿胀，长到了一个小小的HHH罩杯，乳头开始滴奶，实在装不下更多的液体了。当她揉着被严重拉扯和粗暴对待的乳房时，你捡起玛布尔的锤子离开了；也许如果以后还能见到她……而且她能在战斗中打败你的话，你会把它还给她。你怀疑这两件事都不会发生。当你提着牛娘的武器走开时，惠特尼捕捉到了你的目光，给了你一个不赞同、愤怒、甚至有些强硬的瞪视，让你感觉就像刚挨了一巴掌。算了吧……只要你不提醒她，这事儿大概就会过去，对吧？");
         get_player().createStatusEffect(StatusEffects.NoMoreMarble,0,0,0,0);
         get_player().addStatusValue(StatusEffects.Feeder,1,1);
         get_player().changeStatusValue(StatusEffects.Feeder,2,0);
         get_combat().cleanupAfterCombat();
      }
      
      public function extendedMurbelFarmTalkz() : void
      {
         switch(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,458))
         {
            case 0:
               outputText("在你们交谈时，玛布尔问你是从哪里来的。");
               if(get_player().get_race() == "human")
               {
                  outputText("[say: 我见过的唯一一个人类就是那个四处游荡的商人贾科莫，]她告诉你，[say: 但他很少谈论自己。也许你可以给我讲讲人类的事？我很好奇他们住在哪里，都是些什么样的人。]");
                  if(get_player().get_tallness() < 60)
                  {
                     outputText("她的眼睛亮了起来。[say: 他们都像你一样可爱吗？]");
                  }
                  else if(get_player().get_tallness() > 78)
                  {
                     outputText("[say: 你们大多数人都这么高吗？]");
                  }
               }
               else if(get_player().get_race() == "cow-morph" || get_player().get_race() == "cow-boy")
               {
                  outputText("[say: 很高兴能见到同类，]她对你说，[say: 自从我离家后就再没见过同类了。你从哪里来？]");
               }
               else if(get_player().get_race() == "dog-morph")
               {
                  outputText("[say: 我以前见过很多犬变种，你是从巴克斯维尔来的吗？]");
               }
               else if(get_player().isTaur())
               {
                  outputText("[say: 我以前见过几个半人马，但他们似乎没有固定的家。他们是游牧民族，在平原上游荡。你也是这样吗？]");
               }
               else
               {
                  outputText("[say: 我们这里很少见到[race]。你是这附近的人吗？]");
               }
               outputText("[pg]你叹了口气，回想了一会儿才回答她。");
               if(get_player().get_race() != "human")
               {
                  outputText("[pg]你开口向她解释，你并非生来就是现在这副模样——你曾经是个人类。玛布尔听了很惊讶，但当你正要解释自己是怎么变成如今这个样子的时候，她拦住了你。[say: 你不用告诉我这世上有些东西的威力有多大。我妈咪教过我，要是我哪天丢失了身上的牛性，该去哪儿找拉波娃，]她说着冲你眨了眨眼。[say: 不过，我可不知道有什么东西能给你人性，所以你要是想变回去的话……我怕是帮不上忙。]你告诉她没关系，如果有需要的话你会自己去寻找办法。[say: 那好吧，你那个人类的家在哪儿呢？]她问道。");
               }
               outputText("[pg]你告诉她，你并不是这个世界的人，你是穿过一道传送门才来到这里的，并向她讲述了你的家乡和你的家人。不过，你刻意避开了关于你的任务，以及你们村庄传统的任何话题。玛布尔全程听得聚精会神，似乎真的很享受你的故事。讲完之后，她停下来想了想刚才听到的一切。[say: 听起来真是个很棒的地方；不知道我有没有机会去转转？好啦甜心，你跟我说了你的家人，想不想听听我的？]你礼貌地说，很乐意听她讲讲。");
               outputText("[pg]她微笑着告诉你，她是一个叫哈娜的牛娘和一个叫罗兰的犬族混血的长女。她很爱自己的母亲，也非常感激哈娜教给她的许多东西，但她一直跟罗兰更亲近。他从来都对她很好，从不向她索取任何东西，总是帮助她做她想做的事，无论她做什么他都毫无怨言地接受。正是他教会了她如何生存，如何战斗。她接着说到，在离家之前，她还有两个妹妹，也都是牛娘。");
               outputText("[pg]接下来的用餐时间里，没有再聊什么特别的话题。两人一起吃完饭后，站起身来，玛布尔送你走出了她的房间。临别时，玛布尔脸上挂着笑容，说她很享受你们之间的这场谈话，希望很快能再和你一起用餐。");
               break;
            case 1:
               outputText("在你们聊了几分钟无关紧要的事情后，玛布尔问你：[say: 亲爱的，你有没有想过家？你有没有希望过能回到父母身边？]");
               if(get_player().cor < 33)
               {
                  outputText("[pg]你叹了口气，想了一会儿该怎么回答，然后告诉她你几乎每天都在想他们；正是对家和家人的思念支撑着你继续前进。");
               }
               else if(get_player().cor < 66)
               {
                  outputText("[pg]你停顿了一下，然后告诉她你以前总是想着他们，但后来你试着把他们从脑海中赶走，这样你就可以专注于你来到这个世界的原因。");
               }
               else
               {
                  outputText("你轻笑一声，说你现在有那么多有趣的事情要考虑，几乎想不起他们了。然后你停顿了一下，说正是那些你想起他们的时刻，让你不至于忘记自己曾经是谁。");
               }
               outputText("[pg][say: 嗯，听你这么在乎你的家人，真让人欣慰。至于我嘛，我也常常想起他们，尤其是我爹爹。别误会，我也爱妈咪，但她总在爹爹面前摆出一副颐指气使的样子，老是对他发号施令……可他却对每个人都有无限的耐心。我小时候学挥锤子，就算试了几百次都挥不直，他也从不曾对我失去过耐心。]她迟疑了一下。[say: 不对，等等……有那么一次，他跟妈咪大吵了一架，之后他整个人紧张得发抖，还冲我发了火。他训我的时候我哭得好惨，但第二天他就恢复常态了——甚至比平时还要更温柔一点。]她眼眶一时泛起了雾气。[say: 我还记得他教我做第一把锤子的那天。他说的话我这辈子都忘不了。\'这是武器，也就是说它是用来伤人的。永远不要对不是敌人的人举起你的锤子，而当你举起它的时候，绝不要手下留情，也别给对方反过来伤害你的机会。你要是想活下去，就得把这话记在心里。\']");
               outputText("[pg]玛布尔猛地回过神，意识到自己刚才一直呆呆地望着空中出神，然后她又愣了一下，转头看向窗外。[say: 对不起啊甜心，我忘了惠特尼还有个活儿交给我，我得去帮她。我们改天再聊完好不好？]她看起来急着要走，于是你向这位友善的牛娘道别，返回了自己的营地。");
               break;
            case 2:
               outputText("你问玛布尔上次那个活儿有没有出什么麻烦。她有些不好意思地看着你，承认那已经不是她第一次干活迟到了，而且那也不算多大的事。不过，她不喜欢让惠特尼干等着。[say: 反正，我们刚才说到哪儿啦？]这位牛娘问道。[say: 啊，对。]玛布尔点点头，继续说起她家里其他成员的事。[say: 甜心，我是三个孩子里最大的那个。至少，是我离家那会儿家里的三个孩子里最大的！我也是唯一一个继承了爹爹毛色的孩子；我那两个妹妹都是黑白花的。]她停顿了一下。[say: 奥菲莉娅是紧跟着我之后出生的；她平时话很少，安安静静的，可她一旦聊起自己读过的那些故事，那张嘴就谁都拦不住了！]她说到这里笑了起来。[say: 那时候我其实不太懂她为什么那么爱读书，但现在我可找不出比这更好的消遣了——每当我在自己的隔间里挂上挤奶器的时候，读书就是我打发时间的最好方式。惠特尼给我装的那套设备真的很贴心：一把舒服的椅子、一盏灯，还有一张带真空吸力调节旋钮的小边桌。]");
               outputText("[pg]她皱起了眉头。[say: 但最小的那个嘛……这么说吧，她跟妈咪可真是亲得要命。]你问她这话什么意思；玛布尔做了个表情才回答。[say: 嗯，妈咪向来习惯了要什么有什么、叫别人做什么别人就得照办；克拉拉跟她简直一个模子刻出来的。成天对别人呼来喝去，什么都得顺着她的意思来。]她又顿了顿，表情柔和下来。[say: 即便如此，她总能逗得我们哈哈大笑，不管当时气氛有多糟。我想，我对她的想念，跟想念其他人是一样的。]她叹了口气，然后轻声笑了出来。[say: 要是让当年那个刚离家的我听到这话，打死她也不会相信自己现在居然会想念克拉拉——但我确实想。]");
               outputText("[pg]你们又闲聊了几分钟，然后结束了今天的谈话。");
               break;
            case 3:
               outputText("玛布尔打量了你一会儿，然后说道：[say: 你已经提过好几次这个“任务”了；我想这就是你离家的原因吧？]你点点头。[say: 履行职责，是吗？我的故事和你的不太一样，而且肯定没那么高尚！]她笑了起来。");
               if(get_player().get_tallness() < 60)
               {
                  outputText("[say: 抱歉，抱歉，只是你太可爱了！我实在无法想象你是一个为了任务而抛弃家庭和故乡的伟大英雄。]她擦去脸上的几滴眼泪。");
               }
               else if(get_player().get_tallness() > 84)
               {
                  outputText("[say: 我相信像你这样的巨人绝对是执行这个任务的完美人选。]");
               }
               outputText("[pg][say: 就像我说的，我离开并不是出于什么高尚的理由。我离开是因为我觉得是时候继续前进了，去寻找属于我自己的伴侣。]她停顿了一下，认真地直视着你。");
               if(get_marbleAffection() >= 60)
               {
                  outputText("[say: 尽管旅程的开始并不顺利，但我想我已经找到了我一直在寻找的东西。]");
               }
               outputText("[pg]过了一会儿，你听到敲门声，然后传来惠特尼的声音：[say: 玛布尔亲爱的？你能帮我把牛赶出去吗？]玛布尔看着你，似乎在问你是否可以稍后再继续。你点点头，她大声回答：[say: 没问题，惠特尼，等我一下。]");
               break;
            case 4:
               outputText("你跟玛布尔聊了聊自己在这片天地间的见闻，玛布尔便主动说起她自己的旅程。[say: 我家人其实就住在南边那座山的另一头。] 她顿了顿，轻笑起来。[say: 还是该说北边来着？你也知道，跑那么远的路之后，方向这东西有多难说清楚，对吧？] 你点点头；虽说在老家你从来不分不清东南西北，但你完全能想象，这个领域的魔法会让人彻底丧失分辨方向的需要。");
               outputText("[pg]她接着讲起自己在山间探险的经历，轻轻松松就收拾掉了那些想对她图谋不轨的恶魔崽子。在山里晃荡了几周之后，总算出了点更有意思的事。[say: 就是在那时候，我遇到了第一个想跟他谈情说爱的男人。那是个又高又壮的牛头怪，身上的味道闻起来简直让人受不了……可他就是个烂人。] 她摇摇头。[say: 他尝了一次我的奶，我也尝了他的精液。结果第二天，他就想把他那根大得吓人的鸡巴塞进我下面，明明一看就知道插不进我这种小姑娘的身子。我跟他说不行，他不乐意，然后我的锤子就落下来了。起初我心里还挺过意不去的……] 她又摇了摇头。[say: 结果等他醒过来，居然又想对我用强！那之后我就把他剁了吃了，跟他彻底断了。] 她说这话时脸上的笑容着实叫人心里发毛。她告诉你，跟那头牛头怪在一起的那段日子，她唯一刻骨铭心记得的，就是人生第一次喂奶那份美妙。");
               outputText("[pg][say: 在那之后没过多久我就离开了山区。那时候我想，我得找个块头小点的，不会给我添那么多麻烦。又过了几年，我碰巧遇上一个长相挺好看的哈士奇狗崽，叫安斯加尔。我们俩其实处得特别好，他特别喜欢吸我的奶。可是，差不多过了一周，他突然走到我面前，说他没法再吸我的奶了。我气炸了，冲着他就吼了回去，骂他凭什么不要了。闹到最后，他双手直哆嗦，转身就跑了。] 说到这里她停了下来，黯然道：[say: 我再也没见过他。]");
               if(get_knowAddiction() == 2 || get_player().hasPerk(PerkLib.MarbleResistant))
               {
                  outputText("[pg][say: 我想现在很明显他为什么说必须停止了；他意识到自己上瘾了。我只是希望他当时能告诉我，这样我就知道了……]她叹了口气。");
               }
               else if(get_knowAddiction() == 1 || get_player().hasPerk(PerkLib.MarblesMilk))
               {
                  outputText("[pg][say: 我想现在很明显他为什么说必须停止了；他意识到自己上瘾了。可惜他不知道这有多美妙，不是吗？]她对你眨了眨眼。");
               }
               outputText("[pg]她的表情变了，总结道，[say: 不过，关于过去和旧日遗憾的话题，现在就说到这里吧。]");
               outputText("[pg]玛布尔试图把话题岔开，聊起了天气，可这话题实在无聊透顶，毕竟你们这儿除了大晴天还是大晴天。不过很快话头一转，她倒说起了惠特尼用来浇灌花草的那套灌溉装置，还算有点意思。最后你们两人就此别过，因为眼下也实在没什么特别想聊的了。");
               break;
            case 5:
               outputText("这一次轮到你来大谈特谈自己在老家那边的感情生活——或者说，感情生活的匮乏，有时候你自己都是这么觉得的。说完之后，你注意到玛布尔正把目光瞥向一旁。她转回来看着你，感谢你的分享。你问她介不介意接着上次的话题继续往下聊。[saystart]");
               if(get_player().hasPerk(PerkLib.HistoryWhore) || get_player().hasPerk(PerkLib.HistorySlut))
               {
                  outputText("好吧，你的描述确实挺让人兴奋的。我想我也可以分享一些作为回报。");
               }
               else if(get_player().cor < 33)
               {
                  outputText("亲爱的，既然你给我讲了这么好听的故事，我当然愿意分享我的啦。");
               }
               else if(get_player().cor < 66)
               {
                  outputText("亲爱的，我能看出来你对发生的事情非常在意，哪怕你试图掩饰。我当然愿意分享。");
               }
               else
               {
                  outputText("好吧，你的描述确实挺让人兴奋的。我想我也可以分享一些作为回报。");
               }
               outputText("和安斯加尔闹翻之后，我发现我最想念的，竟然就是喂他奶这件事，别的什么都比不上。[sayend] 她顿了一下，摇了摇头。[say: 这么说也不全对。应该说，我需要不停地喂奶；要是没东西可喂，我就觉得浑身上下哪儿都不对劲。]");
               outputText("[pg][say: 那种感觉太糟糕了，糟糕到我不得不抓住任何能喂的东西来喂，哪怕得硬来。其中最值得一提的，大概是一只可爱得要命的小恶魔，个头还不到我一半高。我当时想，我的奶水能把这么可爱的小东西调教成任何我想要的模样。我逮住了他，逼着他嘬了我一整晚的奶。一旦他那颗脑子从他那条巨根上挪开之后，他简直就是这世上最讨人喜欢的小宝贝了。] 她摇了摇头。[say: 可小恶魔身上有恶魔的污秽，所以你也知道这事最后会变成什么样了吧？第二天，我那位“特殊”的朋友出门把他那帮狐朋狗友全找来了，他们一致认定，我会是个绝妙的性玩具。] 她笑了笑。[say: 那一天可真是够劲……虽说可能跟他们预想的那种劲爆不太一样。我把他们揍得满地找牙，我估摸着他们这辈子都不敢不在夜色的掩护下就搞什么轮奸了。说到这个，亲爱的，你最好也别让那些恶心玩意儿知道你住哪儿，明白吗？]");
               if(get_player().hasStatusEffect(StatusEffects.ImpGangBang))
               {
                  outputText("[pg]你对这迟来的建议轻笑了一声；要是早点知道就好了。");
               }
               else
               {
                  outputText("[pg]你点点头，感谢玛布尔的建议；但只要你还得留在这里，保护传送门的这一侧不被占领，你很确定这建议没什么实际意义。");
               }
               outputText("[pg]你们俩决定暂时到此为止；聊了那么多喂奶的话题，玛布尔似乎有些坐立不安，趁她以为你没注意的时候，她总是不自觉地去揉弄自己那对敏感的乳房。她大概已经迫不及待想回去用挤奶器了。");
               break;
            default:
               outputText("[say: 话说，甜心，你是怎么来到惠特尼的农场的？]你告诉她你只是无意间路过几次，后来混熟了，想什么时候来就什么时候来。她点点头，说道，[say: 嗯，我也差不多。大概是去年的事了。那天惠特尼可真是吓得不轻——一个十一岁的奶牛娘大摇大摆晃进她的农场，一把把她拎起来，硬逼着她喝奶！她可一点都不乐意！后来她总算把我弄到谷仓那边，说服我试试挤奶器。]玛布尔微微一笑。[saystart]从那天起，我这股劲儿总算能压住了。虽然比不上真真切切喂别人喝奶那么满足，但至少能把那股难熬的燥劲消下去不少。待了大概一个月，惠特尼就让我搬进谷仓了。打那以后我就一直住在这儿，帮她干干农活，也帮忙抵挡外头的袭击。惠特尼尤其感激我帮她搬重物，因为我是她这辈子见过力气最大的人。");
               if(get_player().get_str() < 90)
               {
                  outputText("事实上，我不认为外面有谁比我更强壮。");
               }
               else
               {
                  outputText("你可能是我见过的唯一一个比我更强壮的人。");
               }
               outputText("[sayend]");
               outputText("[pg]玛布尔抬起头冲你咧嘴一笑，这才注意到你一脸傻愣愣的表情。[say: 呃，甜心，怎么了？]你反复确认自己没听错——她刚才说去年她才十一岁。她点点头，反问你这有什么好奇怪的。你只能摇摇头，告诉她人类要长到十八到二十五岁才算完全成熟。她听了哈哈大笑，说她六岁就完全长成现在这样了；她们整个种族都是如此——至少她遇到的那些都是。好吧，对此你也没什么可说的了。");
               outputText("[pg][saystart]嗯，这基本上就是我的人生故事了。我想我现在已经了解了关于你的一切");
               if(!marbleFollower())
               {
                  outputText("，除了你那个对你来说非常重要的任务");
               }
               outputText("。[sayend]");
               outputText("[pg]你决定问问她，离家之后她有没有什么变化。[say: 嗯，我想我比以前沉稳多了，要是有人不肯喝我的奶，我也能更好地管住自己。虽然心里还是会气得要命，但我都硬憋着。]她顿了一下。[saystart]我藏情绪的本事也挺到家了。");
               if(!marbleFollower())
               {
                  outputText("我可能没有表现出来，但我内心其实非常孤独。");
                  if(get_knowAddiction() == 2)
                  {
                     outputText("我真的只是想要一个爱我、喜欢喝我奶的人。我不知道那会对你造成什么影响。");
                  }
                  else if(get_knowAddiction() == 1)
                  {
                     outputText("但我想我已经找到了能改变这一切的人。对吧，亲爱的？");
                  }
                  else
                  {
                     outputText("不过，我还没放弃希望。");
                  }
                  outputText("[sayend]");
               }
               else
               {
                  outputText("在遇到你之前，我的内心其实非常孤独。[sayend]");
               }
               outputText("[pg]你感谢玛布尔对你敞开心扉，说了这么多。她点点头，说道，[say: 这是我的荣幸，甜心。你是头一个对我这么上心的人，能跟你说这些，我真的很开心。随时回来找我吧，能有个人这么聊聊天，真好。]");
         }
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,458,FlagDict_Impl_.arrayReadInt(_loc1_,458) + 1);
      }
      
      public function encounterMarbleInitially() : void
      {
         spriteSelect(SpriteDb.get_s_marble());
         get_player().createStatusEffect(StatusEffects.Marble,0,0,0,40);
         outputText("在惠特尼的农场探索时，你几乎立刻就遇到了这位" + (get_noFur() ? "" : "毛茸茸的") + "南方佳丽。她看起来好像有活儿要交给你。[pg]");
         outputText("惠特尼告诉你，她谷仓里的一个住客，名叫玛布尔的牛娘，因为过度使用挤奶机而感到酸痛。她请你去给这位牛娘一些来自活物的温柔抚慰。[pg]");
         outputText("你走进惠特尼的谷仓，朝牛娘们住的那排小房间走去。你找到了玛布尔的房间，敲了敲门。一个带着泥土气息的友善女声回应了你，邀请你进去。屋里是一间相当舒适的小房间。墙上挂着几个架子，角落里摆着一张小茶几，配了两把椅子。房间的大部分空间被一张大床占据，而床的主人几乎塞满了整张床。最后，你注意到床边还有一个小梳妆柜。房间的主人朝你望过来，开口说道，[say: 哦，我还从来没没见过你呢。][pg]她起身的时候，你终于有机会好好打量她一番。她身高超过六英尺，一头棕色长发间伸出两只牛角，本该是人类耳朵的位置取而代之的是一对牛耳。在那张还算寻常的面孔上，点缀着一双深邃的棕色眼眸。她身上只穿了一条素色短裙，所以你毫无遮挡地看到了她胸前那对HH罩杯的奶子。此刻它们看起来相当胀痛，鼓胀的乳头周围印着一大片红红的痕迹。她的双手和手臂基本与人类无异，只是指甲看起来格外厚实。一声轻柔的“嗒”响让你的目光向下移去，只见她腿上覆盖着浓密的深金色毛发，从" + (get_noFur() ? "膝盖稍上方" : "至少大腿中段") + "一直延伸到人类脚本该在的地方，而那里取而代之的是一对蹄子。一条系着蝴蝶结的牛尾巴在她双腿之间轻轻摇曳。[pg]");
         unlockCodexEntry(2045,false,true);
         if(get_player().get_tallness() < 60)
         {
            outputText("她低头笑盈盈地看着你，说道[say: 哎呀，你好可爱呀！是来喝我的奶吗？我一直都很乐意分享的啦，不过我现在有点胀痛，你得温柔一点哦。好不好呀，小家伙？]她朝你挪了过来，想把你抱起来。");
            menu();
            addButton(0,"让她抱",marblePicksYouUpInitially);
            addButton(1,"拒绝",resistMarbleInitially);
            return;
         }
         outputText("[say: 我叫玛布尔，你叫什么名字？] 她问你。你做了自我介绍，寒暄了几句后，她问能帮你什么忙。你告诉她，你其实是来帮她的，并解释说惠特尼说她需要一些温柔的抚慰。[say: 噢，那太好了，] 她说。[say: 连着挤奶机过夜是个错误，现在我需要一些温柔的对待。] 你打算怎么帮她？");
         menu();
         addButton(0,"爱抚",caressMarble);
         addButton(1,"吸吮",suckleMarble);
         addButton(2,"强暴",rapeDAHMARBLEZ);
         addButton(14,"离开",turnOffMarbleForever);
      }
      
      public function encounterMarbleExploring2() : void
      {
         spriteSelect(SpriteDb.get_s_marble());
         clearOutput();
         outputText("你决定去玛布尔的房间拜访她。");
         if(get_player().get_tallness() < 60)
         {
            outputText("你刚踏进她的房间，她就迫不及待地冲过来，把你一把搂进她饱满柔软的胸怀里。[say: 你还是那么可爱，甜心！]");
         }
         outputText("她很高兴见到你，请你吃了一顿便饭，你们愉快地聊了天。");
         get_player().refillHunger(20,false);
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,458) < 7 && Utils.rand(3) > 0)
         {
            extendedMurbelFarmTalkz();
            doNext(get_camp().returnToCampUseOneHour);
            return;
         }
         outputText("虽然你们谈论的大多是无关紧要的事情，但也讨论了一些关于这个世界和其中的危险。");
         if(get_marbleAddiction() > 30)
         {
            outputText("[pg]在你们交谈的整个过程中，你发现自己莫名地被玛布尔的气味所吸引，尤其是当你闻到她身上那股奇特的奶香味时。");
            dynStats(DynStat.Lust(10));
         }
         if(get_marbleAffection() < 60)
         {
            outputText("[pg]在这段愉快的插曲之后，你向这位漂亮的牛娘告别，回到了你的营地。");
            set_marbleAffection(get_marbleAffection() + 3);
            if(get_player().get_inte() < 30)
            {
               dynStats(DynStat.Inte(4));
            }
            else if(get_player().get_inte() < 40)
            {
               dynStats(DynStat.Inte(2));
            }
            else if(get_player().get_inte() < 60)
            {
               dynStats(DynStat.Inte(1));
            }
            doNext(get_camp().returnToCampUseOneHour);
         }
         else if(!get_player().hasStatusEffect(StatusEffects.FuckedMarble))
         {
            outputText("[pg]当你们聊完后，玛布尔深情地看着你。[say:你知道我真的很喜欢你吧，亲爱的？如果能和你做些特别的事，我会很高兴的，]她犹豫了一下，[say:你愿意来我的床上吗？]");
            outputText("[pg]你接受她的邀请吗？");
            dynStats(DynStat.Lust(10));
            doYesNo(AcceptMarblesSexualAdvances,turnDownMarbleSexFirstTime);
         }
         else
         {
            outputText("[pg]在你们聊完后，玛布尔又深情地看了你一眼。[say:亲爱的，你愿意再来我的床上吗？]一想到要再次和她做爱，你的下体就感到一阵刺痛。");
            outputText("[pg]你接受她的邀请吗？");
            dynStats(DynStat.Lust(10));
            doYesNo(AcceptMarblesSexualAdvances,turnDownMarbleSexRepeat);
         }
      }
      
      public function encounterMarbleExploring() : void
      {
         spriteSelect(SpriteDb.get_s_marble());
         clearOutput();
         outputText("在农场里闲逛时，你遇到了正朝谷仓走去的牛娘玛布尔。");
         if(get_player().get_tallness() < 60)
         {
            outputText("玛布尔用她习惯的问候方式将你拥入怀中，然后告诉你她要去谷仓挤奶。");
         }
         else
         {
            outputText("你们简单地打了个招呼，然后玛布尔告诉你她要去谷仓挤奶。");
         }
         if(get_marbleAffection() < 30)
         {
            outputText("[pg]看来她很期待，不想为了聊天而推迟。她匆匆离去，留下你继续四处看看。");
            outputText("[pg][b:也许如果你在农场里做些工作，让她更喜欢你一点？]");
            doNext(get_camp().returnToCampUseOneHour);
         }
         else
         {
            outputText("[pg][say: 不过，既然你来了，也许你可以自己来吸我的奶？]她微笑着问道。[pg]");
            if(get_marbleAddiction() < 40)
            {
               outputText("你要喝她的奶吗？");
               doYesNo(drinkMarbleMilk,playerRefusesMarbleMilk);
            }
            else
            {
               outputText("你真的很想喝点那乳汁，于是急切地答应了。[pg]");
               doNext(drinkMarbleMilk);
            }
         }
      }
      
      public function encounterMarbleAshamedAddiction(param1:Boolean = true) : void
      {
         if(param1)
         {
            clearOutput();
         }
         spriteSelect(SpriteDb.get_s_marble());
         if(!get_player().hasStatusEffect(StatusEffects.MalonVisitedPostAddiction))
         {
            outputText("你发现玛布尔正走出谷仓，怀里抱着一个罐子。你决定跟着她走到谷仓后面。当你转过拐角时，你看到她把罐子里的东西倒在地上。你问她在做什么，[say:我在处理这些被腐化的奶水，]她厌恶地说道。当你走近她时，你认出了她奶水的味道，不自觉地舔了舔嘴唇。[say:我每天产这么多，我是个怪物，]她冷冷地说道，[say:而且我让你需要它。]当最后一点奶水溅到地上时，玛布尔看向你。令人惊讶的是，她的脸似乎变得冷酷无情。你是责怪她对你所做的事，还是安慰她？");
            menu();
            addButton(0,"安慰",AshamedAddictionComfort);
            addButton(1,"责怪",AshamedAddictionBlame);
            get_player().createStatusEffect(StatusEffects.MalonVisitedPostAddiction,0,0,0,0);
            return;
         }
         if(Utils.rand(2) == 0)
         {
            outputText("你发现玛布尔正在她的房间里看书。你走进去时，她告诉你她一直在继续研究成瘾的影响。她站起身来，走到你面前，开始玩弄自己的乳房。你很快感觉到对她乳汁的渴望在加剧。[say: 试着克制你的渴望，]她一边继续揉搓着胸部一边对你说。你顺从了她，尽力去克制，但这是一种你并不享受的挣扎，因为你的身体感觉就像被这种压力撕裂了一样。你要克制你的渴望吗？");
            menu();
            addButton(0,"抵抗",resistAddiction);
            addButton(1,"屈服",addictionGiveIn);
         }
         else
         {
            outputText("你发现玛布尔正从谷仓里走出来，手里拿着一瓶她的乳汁。她看着你，递出瓶子。[say: 拿着这个，]她对你说，[say: 然后说这是多么可怕的东西。说你希望自己以前从未尝过它。说它根本不该存在。然后把那垃圾倒在泥土上。]当她说完最后一部分时，她的眼睛开始流泪。你可以按照她说的做，以帮助克服你的成瘾，或者拒绝，因为你觉得说这样的话会伤害她。或者你也可以只是求她不要那样浪费乳汁。你该怎么做？");
            menu();
            addButton(0,"倒掉",dumpMarblesMilk);
            addButton(1,"拒绝",refuseMarblesMilkAddiction);
            addButton(2,"乞求",ashamedAddictionBegForIt);
         }
      }
      
      public function dumpMarblesMilk() : void
      {
         clearOutput();
         outputText("你手里拿着瓶子，一字不差地重复着她的话。随着每一次声明，她的脸色越来越沉。最后，在你身体极度痛苦的情况下，你把瓶子倒过来，把里面的东西倒在地上。当最后一滴溅到泥土上时，你感到戒断症状得到了一点缓解。当你再次抬起头时，你发现玛布尔已经消失了。看到玛布尔那样受苦，你的身心都很痛，但至少要过一段时间你才需要再次做那样的事。");
         set_marbleAffection(get_marbleAffection() - 5);
         set_marbleAddiction(get_marbleAddiction() - 5);
         dynStats(DynStat.Str(-1),DynStat.Tou(-1));
         if(get_player().hasStatusEffect(StatusEffects.BottledMilk))
         {
            get_player().addStatusValue(StatusEffects.BottledMilk,1,1 + Utils.rand(6));
         }
         else
         {
            get_player().createStatusEffect(StatusEffects.BottledMilk,3,0,0,0);
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function drinkMarbleMilk() : void
      {
         clearOutput();
         outputText("玛布尔笑容满面地带你回到她的房间，在床上坐下。她邀请你坐在她腿上，让你开始吸吮她的一个乳头。当那美妙的味道触及你的舌头时，你开始不顾一切地大口吞咽乳汁。作为回应，她愉悦地叹息着。玛布尔不时让你换个乳头，同时温柔地抚摸着你的头");
         if(get_player().ears.type > 0)
         {
            outputText("偶尔还会挠挠你的耳后");
         }
         outputText("。");
         outputText("一旦你喝饱了，你退了回来，你们俩相视一笑。[say: 这对你来说真的很不错，不是吗，亲爱的？对我来说也不错，能有像你这样的人好好吸一吸我发痒的乳头。][pg]");
         set_marbleAddiction(get_marbleAddiction() + 10);
         if(get_marbleAddiction() >= 50 && get_addictionEnabled())
         {
            marbleAddictionStart(false);
            set_marbleAffection(get_marbleAffection() + 5);
            applyMarblesMilk();
            return;
         }
         set_marbleAffection(get_marbleAffection() + 5);
         applyMarblesMilk();
         get_player().HPChange(10,false);
         get_player().refillHunger(20);
         get_player().changeFatigue(-20);
         dynStats(DynStat.Lib(1),DynStat.Lust(20));
         if(get_player().get_lust100() > 60)
         {
            marbleMilkSex(false);
            doNext(get_camp().returnToCampUseOneHour);
            return;
         }
         if(get_marbleAddiction() < 50)
         {
            outputText("喝了玛布尔的奶后，一种愉悦的感觉传遍全身，你兴高采烈地离开了农场。");
         }
         applyMarblesMilk();
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function doNotWantMarbleAddiction() : void
      {
         clearOutput();
         outputText("你告诉她，你意识到她的奶会上瘾，你不能依赖它。她的眼眶里涌出了泪水，然后崩溃了。[say:对不起，我不知道！]她抽泣着说，[say:我想我只是这个世界上另一个可悲的生物。我以为我很特别，但看来我也被腐化了……]她突然伸出手，把你的头紧紧抱在胸前，前后摇晃着。几分钟后，她放开你，看着你的眼睛。[say:请原谅我！]她说完便跳下床，跑出了门。你花了一些时间在农场里寻找玛布尔，但没找到她。你把发生的事情告诉了惠特尼，她答应只要一有玛布尔的消息，就会第一时间通知你。");
         set_marbleAffection(get_marbleAffection() + 5);
         set_knowAddiction(2);
         dynStats(DynStat.Cor(5));
         applyMarblesMilk();
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function definitelyBreakUpWithWithMarble() : void
      {
         clearOutput();
         outputText("你走到玛布尔面前，告诉她你需要一点空间，想和她分开一段时间。她听到你的话僵住了，让你再说一遍。你照做了，她点点头，脸上几乎没有什么表情。[saystart]我想我会回农场去。");
         if(get_player().hasPerk(PerkLib.MarblesMilk))
         {
            outputText("当你需要我的奶水时，我们就在那里见，好吗？");
         }
         else
         {
            outputText("那我们回头见。");
         }
         outputText("[sayend] 玛布尔收拾好她的东西");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,8) == 1)
         {
            outputText("和她的孩子");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,8) > 1)
         {
            outputText("和她的孩子们");
         }
         outputText("，离开了营地。");
         doNext(playerMenu);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,459,1);
         get_player().removeStatusEffect(StatusEffects.CampMarble);
         get_player().removeStatusEffect(StatusEffects.NoMoreMarble);
      }
      
      public function caressMarble() : void
      {
         clearOutput();
         outputText("你提议可以温柔地揉捏她的乳房，并说这应该比挤奶机的吸吮要少很多痛苦。[say: 哦，不，]她反驳道，[say: 没有什么比被吸吮更美妙的了，不过现在我想我可以休息一下，好好揉一揉。]你走到她身后，把手伸到她的腋下，紧紧抓住她的乳房。起初她猛地喘了口气，但随着你开始温柔地按摩和抚摸，她叹了口气，开始深呼吸。当你揉捏她时，你开始感觉到有乳汁漏到你的手上。[say: 这感觉不错，]她说道，[say: 虽然不如被吸吮那么好，但也不错。]温柔地按摩了几分钟她的乳房后，她把你的手拉开，转向你。[say: 谢谢，]她说道，[say: 我还是有点酸痛，但谢谢你的抚摸，亲爱的。随时欢迎你再来；我随时都很乐意和你聊天。]就在你离开之前，你注意到玛布尔正像你刚才那样揉捏着自己的乳房，脸上带着一丝微笑。");
         dynStats(DynStat.Lust(15));
         set_marbleAffection(get_marbleAffection() + 5);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function canGiveItem() : Boolean
      {
         if(get_player().hasItem(get_consumables().OVIELIX,1))
         {
            return true;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,4) == 0)
         {
            if(get_player().hasItem(get_consumables().P_DRAFT,1))
            {
               return true;
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,4) > 0)
            {
               if(get_player().hasItem(get_consumables().PINKEGG,1))
               {
                  return true;
               }
               if(get_player().hasItem(get_consumables().L_PNKEG,1))
               {
                  return true;
               }
            }
         }
         if(get_player().hasItem(get_consumables().PROBOVA,1) && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,465) < 2)
         {
            return true;
         }
         if(get_player().hasItem(get_consumables().P_LBOVA,1) && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1059) == 1)
         {
            return true;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1059) >= 5)
         {
            if(get_player().hasItem(get_consumables().P_S_MLK,1))
            {
               return true;
            }
            if(get_player().hasItem(get_consumables().REDUCTO,1))
            {
               return true;
            }
            if(get_player().hasItem(get_consumables().LACTAID,1))
            {
               return true;
            }
         }
         return false;
      }
      
      public function breakUpWithMarble() : void
      {
         clearOutput();
         outputText("你确定要和玛布尔分手吗？如果你这样做，你将无法再让她回来。");
         doYesNo(definitelyBreakUpWithWithMarble,interactWithMarbleAtCamp);
      }
      
      public function atNightAskMarbleForSomeSexMaybe() : void
      {
         clearOutput();
         outputText("你转过身面对玛布尔，并且");
         if(FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,3) < 0)
         {
            outputText("看到她烦躁的后脑勺。哦，对了，她现在可能没心情做这个。你明天得找其他方法来满足你的需求了。");
         }
         else
         {
            if(FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,3) >= 20)
            {
               outputText("温柔地问她想不想亲热一下。过了一会儿，你听到她呼出一口气，用淫荡的声音说：[say:我还担心你永远不会问呢，亲爱的……]");
               marbleNightSexIntro(false);
               return;
            }
            outputText("温柔地问她想不想亲热一下。过了一会儿，你听到她呼出一口气，她说：[say:抱歉亲爱的，我现在没心情。]");
            marbleCuddlin();
         }
         doNext(playerMenu);
      }
      
      public function ashamedAddictionBegForIt() : void
      {
         clearOutput();
         outputText("你惊恐地看着她，不敢相信她竟然建议这样浪费她美味的乳汁。你一把抢过奶瓶，紧紧抱在胸前。你恳求她不要那样说，也不要轻易把她的乳汁扔掉。你的宣言似乎让她更加难过，她抓住了你的双手。玛布尔注视着你的眼睛片刻，告诉你总有改变的希望，然后就跑开了。你留下了奶瓶，但你觉得可以等会儿再喝。做出那个大胆的宣言感觉是对的，而且似乎让你感觉好多了，哪怕只是暂时的。");
         get_inventory().takeItem(get_consumables().M__MILK,get_camp().returnToCampUseOneHour);
         if(get_player().hasStatusEffect(StatusEffects.BottledMilk))
         {
            get_player().addStatusValue(StatusEffects.BottledMilk,1,1 + Utils.rand(6));
         }
         else
         {
            get_player().createStatusEffect(StatusEffects.BottledMilk,3,0,0,0);
         }
      }
      
      public function applyMarblesMilk() : void
      {
         get_player().slimeFeed();
         var _loc1_:Number = get_player().get_str();
         var _loc2_:Number = get_player().get_tou();
         if(!get_player().hasStatusEffect(StatusEffects.MarblesMilk))
         {
            get_player().createStatusEffect(StatusEffects.MarblesMilk,12,0,0,0);
            dynStats(DynStat.Str(5),DynStat.Tou(10));
            get_player().changeStatusValue(StatusEffects.MarblesMilk,2,get_player().get_str() - _loc1_);
            get_player().changeStatusValue(StatusEffects.MarblesMilk,3,get_player().get_tou() - _loc2_);
         }
         else
         {
            get_player().addStatusValue(StatusEffects.MarblesMilk,1,12);
         }
         if(get_player().statusEffectv1(StatusEffects.MarblesMilk) > 36)
         {
            get_player().changeStatusValue(StatusEffects.MarblesMilk,1,36);
         }
         if(get_player().hasStatusEffect(StatusEffects.MarbleWithdrawl))
         {
            get_player().removeStatusEffect(StatusEffects.MarbleWithdrawl);
            dynStats(DynStat.Tou(5),DynStat.Inte(5));
         }
      }
      
      public function apologizeToWalkingTitsIMEANMARBLE() : void
      {
         clearOutput();
         outputText("为了弥补之前的过失，你为自己的行为道歉，并问玛布尔是否有办法补偿她。她对你的回答感到惊喜，沉思片刻后说道：[say:好吧，那行。我的乳房还有点酸痛——毕竟我每天都得挤奶——所以你觉得你能亲自帮我揉揉吗？] 你就知道她会提出这种要求……真是个一根筋的家伙。");
         outputText("[pg]玛布尔环顾四周，然后钻进了旁边高高的谷物丛中。过了一会儿，你也跟着她走进了在微风中摇曳的庄稼地。她在植物丛中留下的痕迹并不难追踪，但从前方传来的咯咯笑声来看，这已经变成了一场游戏。");
         outputText("你追逐着这位牛女，在众多植物间徘徊，寻找着逃跑的她。她不断的咯咯笑声确保你知道自己走的方向是对的，但有时她喜欢折返或制造假痕迹，让游戏变得更有趣。");
         if(get_player().get_inte() < 15)
         {
            outputText("最终你发现玛布尔停了下来，举起双手看着你说，[say:你抓到我了！过来。]她示意你靠近她的胸部，而你也没有让她久等。");
         }
         else if(get_player().get_inte() < 40)
         {
            outputText("最终你发现玛布尔停下来等着你。她举起双手说，[say:你抓到我了！]很明显她是故意投降的，但当她把双手交叉在胸前，将双乳挤在一起，然后叫你过去时，你并没有抱怨。");
         }
         else
         {
            outputText("不难发现玛布尔并没有真的在努力逃跑，你在她一次折返时轻易地抓住了她。直到你从她旁边的秸秆间探出头来，伸手抓了一把她的臀部，她才注意到你。[say:聪明的[boy]……]她说。");
         }
         outputText("[pg]玛布尔把你拉倒在地，你跌进了这位可爱女士的怀里。你还没来得及开口，玛布尔就把一根手指放在你的嘴唇上，示意你安静。她拉起上衣，停顿了一下，在露出下乳时对你眨了眨眼，然后让她的乳头滑了出来。");
         outputText("[pg][say: 想尝尝我丰满的乳房吗，小甜心？]她说道，热切地微笑着，向你展示她那半英寸长的微红乳头。你注意到每个乳头周围都有一圈看起来很痛的肿胀红晕，这可能就是玛布尔感到不适的原因。");
         outputText("[pg]你早就知道她会来这一套，所以你觉得还不如早点完事。毕竟，她的乳房确实很不错……你把[face]凑近她的乳头，轻轻地用嘴唇含住。当你这么做时，玛布尔满足地叹了口气，随着第一口乳汁从她的乳头溢出，她开始因快感而微微呻吟。你绝对无法抗拒这甜美浓郁的味道，开始津津有味地吞咽这美味的液体。玛布尔似乎一点也不介意；事实上，她欢愉的声音反而更大了。");
         outputText("[pg]几分钟后，玛布尔把手放在你的额头上，温柔地请你照顾她的另一侧乳房。你没有让她失望，用和之前一样的活力，深深地吸吮着另一个乳头。");
         get_player().refillHunger(20);
         outputText("[pg]又过了几分钟，你终于喝饱了，从玛布尔身上退开，她用亲切而满意的表情低头看着你。[say: 真是太谢谢你了，亲爱的。在那之后，我怎么可能拒绝你的道歉呢。欢迎你随时来农场看我。]这位牛娘在你的脸颊上啄了一下，重新穿好衣服遮住她丰满的胸部——你心里有一小部分还挺舍不得它们被遮住的。她扶你站起来，陪你走回主谷仓，然后回去继续干活了。");
         set_marbleAffection(5);
         set_marbleAddiction(get_marbleAddiction() + 10);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,463,0);
         applyMarblesMilk();
         dynStats(DynStat.Lib(0.2),DynStat.Lust(5 + get_player().lib / 10));
         get_player().HPChange(100,false);
         get_player().changeFatigue(-50);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function afterMarbleHelp() : Boolean
      {
         if(get_marbleAddiction() >= 40)
         {
            if(get_player().get_inte() < 40 && Utils.rand(2) == 0)
            {
               outputText("你发现，和玛布尔待在一起的时间越长，你就越渴望喝她的奶。终于，在你们快干完活的时候，你再也忍不住了，乞求玛布尔让你喝她的奶。过了一会儿，她才反应过来，脸涨得通红。[say:好吧，亲爱的，既然你帮了我，那我们回我房间吧。]你再次走进了她那舒适的房间。她邀请你坐在她腿上，让你开始吸吮她的一个乳头。当那美妙的味道触碰到你的舌头时，你开始毫无顾忌地大口吞咽起来。她舒服地叹了口气。玛布尔时不时地让你换个乳头吸，同时温柔地抚摸你的头，偶尔还会挠挠你的耳后。[pg]");
               outputText("当你喝饱后，你退了回来，你们俩相视一笑。[say:感觉很棒吧，亲爱的？对我来说也很棒，能有你这样的人好好吸吮我敏感的乳头。][pg]");
               set_marbleAddiction(get_marbleAddiction() + 10);
               marbleAddictionStart(false);
               return true;
            }
            outputText("在干活的时候，你脑子里一直盘旋着想喝玛布尔奶的念头，但你还是努力克制住了，继续正常工作。[pg]");
         }
         return false;
      }
      
      public function addictionGiveIn() : void
      {
         clearOutput();
         outputText("你无法忍受看到她在你面前晃动，却无法喝到那些看起来很美味的乳房里的乳汁。你崩溃了，乞求玛布尔让你喝她的乳汁。她无法忍受看到你这样，眼中带着悲伤的神情同意了。你毫不犹豫地大口喝下她的乳汁，感觉它让你充满了新的力量。当你喝完时，你抬头看着她，脸上还滴着一些乳汁。当她擦去你脸上的乳汁时，你看到了一个悲伤的微笑。");
         set_marbleAffection(get_marbleAffection() + 3);
         set_marbleAddiction(get_marbleAddiction() + 10);
         dynStats(DynStat.Cor(1));
         applyMarblesMilk();
         dynStats(DynStat.Lib(1),DynStat.Lust(20));
         if(get_player().get_lust100() >= 60)
         {
            outputText("[pg]");
            marbleMilkSex(false);
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function addictedEncounterHappy(param1:Boolean = true) : void
      {
         if(param1)
         {
            clearOutput();
         }
         spriteSelect(SpriteDb.get_s_marble());
         if(!get_player().hasStatusEffect(StatusEffects.MalonVisitedPostAddiction))
         {
            outputText("你发现玛布尔从谷仓里出来，手里拿着一瓶她的奶。当她看到你时，她赶紧走过来把瓶子递给你。[say:我想弄清楚一件事。你能喝这瓶奶吗？]她问道。你要喝吗？");
            doYesNo(playerAgreesToDrinkMarbleMilkBottled,playerRefusesToDrinkBottledMilk);
            get_player().createStatusEffect(StatusEffects.MalonVisitedPostAddiction,0,0,0,0);
         }
         else if(Utils.rand(2) == 0)
         {
            outputText("你发现玛布尔在她的房间里，一边轻声哼着歌，一边在床上看书。你走到她面前，她没有把视线从书上移开，说道，[say:我能闻到你的渴望，亲爱的。准备好喝奶了吗？]她放下书，转向你，双手托着乳房，身子向前倾。[pg]");
            if(get_player().get_inte() >= 40)
            {
               outputText("你要喝她的奶吗？");
               doYesNo(playerDrinksMarbleMilk,playerDeclinesToDrinkMarbleMilk);
            }
            else
            {
               playerDrinksMarbleMilk();
            }
         }
         else
         {
            outputText("你发现玛布尔正在干活。她对你笑了笑，说如果你帮她干活，她就会给你一瓶牛奶来安抚你的神经。你是为了牛奶、为了玛布尔而做，还是拒绝？");
            menu();
            addButton(0,"玛布尔",marbleChoreHelpChooseMarble);
            addButton(1,"奶水",marbleChoreHelpChooseMilk);
            addButton(2,"拒绝",marbleChoreRefusal);
         }
      }
      
      public function MarblepinkEgg() : void
      {
         get_player().consumeItem(get_consumables().PINKEGG);
         MarblePEggEffects();
      }
      
      public function MarblePEggEffects() : void
      {
         clearOutput();
         outputText("你把粉红色的蛋递给玛布尔。她若有所思地看了一会儿，然后眼睛一亮，认出了它。[saystart]这是用那些蛋药水制成的魔法蛋之一。如果我没记错的话，这个可以消除吃下它的人的男性特征。");
         if(get_player().statusEffectv4(StatusEffects.Marble) > 50)
         {
            outputText("所以，我的小甜心，厌倦了我的鸡巴？那如果我喜欢它呢？你真的想让我把它弄掉吗？[sayend]你向她保证，是的，你确实想让她把它弄掉。她恼火地皱起眉头，但最终还是同意吃下这颗蛋。[say: 总有一天你会想要它回来的，我敢肯定，]她在吃下蛋之前说道。[pg]");
         }
         else
         {
            outputText("所以这意味着你不想让我再有鸡巴了，亲爱的？[sayend]你向她保证，是的，你不想让她再有了。她似乎松了一口气，承认道：[say: 谢谢你，亲爱的，我想我真的不喜欢有它，]然后吃下了蛋。[pg]");
         }
         outputText("她掀起裙子，你们俩看着她的" + marbleCock() + "被吸回体内。<b>玛布尔现在完全是女性了。</b>");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,4,0);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,5,0);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,6,0);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function MarbleLPinkEgg() : void
      {
         get_player().consumeItem(get_consumables().L_PNKEG);
         MarblePEggEffects();
      }
      
      public function MarbleDigsDraftsYo() : void
      {
         clearOutput();
         get_player().consumeItem(get_consumables().P_DRAFT);
         outputText("你把瓶子递给玛布尔。她看了一会儿，然后");
         if(get_player().statusEffectv4(StatusEffects.Marble) > 60)
         {
            outputText("对你笑了笑，说道：[say: 所以你想让我沾染腐化，长出一根漂亮的大鸡巴来插我的小甜心？]你告诉她瓶子已经被净化过了，所以不会带来腐化，但除此之外，你希望它能给她带来<i>额外</i>的效果。她对你咧嘴一笑，喝下了瓶子里的东西。[pg]");
         }
         else
         {
            outputText("不确定地看着你，说道：[say: 呃，亲爱的，我不想喝这种恶魔的东西。它会扭曲我的身体，而且我觉得这会让我长出鸡巴……]你向她保证药水已经被净化过了，所以不会扭曲她的身体或腐化她……除了她提到的最后一个效果，但这正是你希望她得到的。她叹了口气，妥协道：[say: 好吧，亲爱的，如果你真的想让我长一根，那我就为你喝了它。]她深吸了一口气，喝下了瓶子里的东西，并因为味道而皱起了眉头。[pg]");
         }
         outputText("玛布尔扔下药水，捂住自己的胯部。她转过身去，发出一声兴奋的叫喊，那声音混合了牛叫和呻吟，身体也微微抽搐着。过了一会儿，她转过身来，向你展示了她新长出的7英寸长、2英寸宽的人类阴茎。她给了你一个");
         if(get_player().statusEffectv4(StatusEffects.Marble) > 50)
         {
            outputText("大大的");
         }
         else
         {
            outputText("紧张的");
         }
         outputText("微笑。<b>玛布尔现在是个双性人了。</b>");
         doNext(get_camp().returnToCampUseOneHour);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,4,1);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,5,7);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,6,2);
      }
      
      public function AshamedAddictionComfort() : void
      {
         clearOutput();
         outputText("你径直走向她，双臂环抱住她。她只是呆呆地站在那里片刻，然后回抱了你。");
         if(get_player().get_tallness() < 60)
         {
            outputText("她把你拉进她的怀里，看到你认识的那个玛布尔还在那里，你感到很欣慰。你感觉到温暖的水滴落在你的头上，抬头一看，发现玛布尔流下了新的眼泪，但这次她的脸上带着灿烂的笑容。[pg]");
         }
         else
         {
            outputText("你听到她的呼吸开始变得急促，看着她的脸，发现玛布尔流下了新的眼泪，但这次她的脸上带着灿烂的笑容。[pg]");
         }
         outputText("[say: 谢谢你，亲爱的，]她轻声低语，声音小到你几乎听不见。不幸的是，离她这么近开始提醒你你极度需要什么。当你试图控制自己的颤抖却失败时，这一刻感觉有些被破坏了。她退后一步，直视着你的眼睛。[say: 别担心，亲爱的，我们会一起找到办法让这一切好起来的，]她紧紧地把你抱在怀里说。你能看出她在强颜欢笑，你觉得她其实根本不知道该怎么做。[say: 当你再次感觉到需要我的乳汁时就回来，]她看着你离开时对你说，话语中伴随着轻微的打嗝声，[say: 我们会度过难关的。]");
         set_marbleAffection(get_marbleAffection() + 10);
         withdrawalDelay();
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function AshamedAddictionBlame() : void
      {
         clearOutput();
         outputText("你决定把对现状的愤怒发泄在玛布尔身上，开始对她大喊大叫。当你从咆哮中平静下来时，你可以看到她的手在发抖。她的声音略微沙哑，说道：[say: 你是对的……我必须为我对你做的事负责，并弥补它。当你需要我的乳汁时来找我，我会帮你戒掉瘾。然后我会确保再也没有人上瘾。]玛布尔的脸依然冷漠，她转过身走开了。在对她发泄之后，你感到了一丝解脱，但你知道不久之后你就会非常想再次喝她的乳汁。像那样对她大喊大叫后，你感到酸痛，这也无济于事。");
         set_marbleAffection(0);
         set_marbleAddiction(get_marbleAddiction() - 15);
         dynStats(DynStat.Str(-1),DynStat.Tou(-1));
         if(get_player().hasStatusEffect(StatusEffects.BottledMilk))
         {
            get_player().addStatusValue(StatusEffects.BottledMilk,1,1 + Utils.rand(6));
         }
         else
         {
            get_player().createStatusEffect(StatusEffects.BottledMilk,3,0,0,0);
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function AcceptMarblesSexualAdvances() : void
      {
         spriteSelect(SpriteDb.get_s_marble());
         standardSex(true);
         if(!get_player().hasStatusEffect(StatusEffects.FuckedMarble))
         {
            get_player().createStatusEffect(StatusEffects.FuckedMarble,0,0,0,0);
         }
         set_marbleAffection(get_marbleAffection() + 10);
         dynStats(DynStat.Inte(1));
      }
   }
}

