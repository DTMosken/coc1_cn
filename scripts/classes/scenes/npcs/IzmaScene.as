package classes.scenes.npcs
{
   import classes.Appearance;
   import classes.CoC;
   import classes.Cock;
   import classes.CockTypesEnum;
   import classes.DebugMenu;
   import classes.DynStat;
   import classes.Monster;
   import classes.PerkLib;
   import classes.Player;
   import classes.PregnancyStore;
   import classes.SelfDebug;
   import classes.StatusEffects;
   import classes.Time;
   import classes.TimeAwareInterface;
   import classes.Vagina;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.display.SpriteDb;
   import classes.globalFlags.KFLAGS;
   import classes.internals.GuiOutput;
   import classes.internals.Utils;
   import classes.items.Armor;
   import classes.items.ArmorLib;
   import classes.items.ConsumableLib;
   import classes.items.Undergarment;
   import classes.items.UndergarmentLib;
   import classes.items.WeaponLib;
   import classes.parser._Parser.TagFun_Impl_;
   import classes.saves.SelfSaver;
   import classes.saves.SelfSaving;
   import classes.scenes.Camp;
   import classes.scenes.Inventory;
   import classes.scenes.api.Encounter;
   import classes.scenes.combat.Combat;
   import classes.scenes.npcs._IzmaScene.SaveContent;
   import classes.scenes.npcs.pets.Akky;
   import classes.scenes.npcs.pregnancies.PlayerIzmaPregnancy;
   import coc.view.CoCButton;
   import flash.Boot;
   import haxe.IMap;
   
   public class IzmaScene extends NPCAwareContent implements Encounter, SelfDebug, SelfSaving, TimeAwareInterface
   {
      
      public var saveVersion:int;
      
      public var saveName:String;
      
      public var saveContent:SaveContent;
      
      public var pregnancy:PregnancyStore;
      
      public var nightmareParent:String;
      
      public var nightmareDaughterType:int;
      
      public var gooJobbed:Boolean;
      
      public var globalSave:Boolean;
      
      public var checkedIzmaSophie:int;
      
      public var checkedIzmaLatexy:int;
      
      public function IzmaScene(param1:GuiOutput = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         nightmareDaughterType = 0;
         gooJobbed = false;
         checkedIzmaSophie = 0;
         checkedIzmaLatexy = 0;
         globalSave = false;
         saveVersion = 1;
         saveName = "伊兹玛";
         saveContent = new SaveContent(null,null,null,null,null,null,null,null,null,null,null,null);
         super();
         pregnancy = new PregnancyStore(1207,250);
         pregnancy.addPregnancyEventSet(25,[250,200,150,100,50]);
         CoC.timeAwareClassAdd(this);
         SelfSaver.register(this);
         DebugMenu.register(this);
         new PlayerIzmaPregnancy(param1);
      }
      
      public function winSpar() : void
      {
         clearOutput();
         outputText("伊兹玛只往后退了一步，便彻底倒了下去，已经" + (get_monster().get_HP() < 1 ? "疲惫" : "兴奋") + "得无法继续。然而，你在她眼中看到的只有纯粹的献身之情，你对她的胜利似乎进一步加深了她对你的爱意。");
         outputText("[pg][say:求你了，阿尔法，我需要……]");
         outputText("[pg]她没有把话说完，但你明白。唯一的问题是，你会不会给她……");
         get_combat().cleanupAfterCombat();
         izmaSexMenu();
         setExitButton();
      }
      
      public function wheresItGoing(param1:Boolean = false) : void
      {
         spriteSelect(SpriteDb.get_s_izma());
         outputText("[pg]伊兹玛继续大声呻吟，开始将自己的胯部用力迎向你，试图让你的 " + Appearance.cockNoun(get_player().cocks[0].get_cockType()) + " 尽可能多地深入她体内，哪怕多一[if (metric) {厘米|英寸}]也好。随着她");
         if(!param1)
         {
            outputText("撸动");
         }
         else
         {
            outputText("猛烈地呻吟");
         }
         outputText("你能看见一长串前液从她红色的肉棒上滴落下来，也很清楚她已经快到极限了。她的肉棒高高挺立，随时准备朝你的方向释放黏稠的精液。");
         outputText("[pg]看来伊兹玛已经撑不了多久了……你要让她朝哪里射出来？");
         menu();
         addButton(0,"你的脸",facialWhereItGoesRadarIzmaXpack);
         addButton(1,"你的胸口",RadarIzmaCumInYourChest);
         addButton(2,"她的脸",IzmaSelfFacialWheeRadar);
      }
      
      public function wakeTogether() : void
      {
         clearOutput();
         outputText("你醒来时，发现伊兹玛正凝视着你。[say:早上好，]她向你问候道，[say:我现在要去晨泳了。谢谢你让我好好休息了一晚，我的阿尔法。]她看起来很高兴能和你同床共枕，然后脚步轻快地离开，去溪流里享受游泳了。");
         saveContent.izmaMorning = false;
         doNext(playerMenu);
      }
      
      public function victorzChoice() : void
      {
         var _g:IzmaScene;
         outputText("伊兹玛看着你，还因刚才的做爱而喘息着。[say: 所、所以……刚才很舒服……现在想要你的奖励吗？]她问道，同时把虎鲨牙递向你。你盯着它，思索起来。你是想再要一颗这种牙，还是想要别的东西？");
         menu();
         addButton(0,"牙齿",chooseIzmaTooth);
         _g = this;
         addButton(1,"护手",function():void
         {
            _g.chooseIzmaGloves();
         });
      }
      
      public function victoryPenisIzma() : void
      {
         saveContent.previousVictoryTeased = false;
         clearOutput();
         var _loc1_:int = get_player().cockThatFits(get_monster().vaginalCapacity());
         if(_loc1_ < 0)
         {
            _loc1_ = 0;
         }
         outputText("你紧盯着被击败的虎鲨人，脸上浮现出笑容。你把手按在她的额头上，几乎没费什么力气就把她推倒在地，顺手脱下她的衣服。她并不是没有力气阻止你，但她很清楚这场战斗的条件是什么，所以她不会食言。你脱下自己的[armor]，将伊兹玛的双腿大大分开，[eachcock]几乎硬得发疼；你托起她那四颗睾丸，看向她湿亮的女性私处。[pg]");
         outputText("你不想把时间浪费在前戏上，于是尽可能深地把你的" + get_player().cockDescript(_loc1_) + "插进伊兹玛的裂缝里，令伊兹玛猛地倒吸一口气，在你身下扭动起来。你轻笑一声，开始在她体内抽插；她小穴里那些奇异的小触须挑逗着、按摩着你的肉棒。穴壁本身又紧又滑，她的阴道像手套一样贴合着你。那感觉简直像是伊兹玛的肉穴天生就是为你准备的。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,231) >= 3)
         {
            outputText("见鬼，说不定它真是为你准备的，毕竟每次伊兹玛看到你时都显得那么迫不及待。就好像她是故意输给你一样。");
         }
         outputText("[pg]");
         outputText("你开始加快速度，用胯部一次次撞上伊兹玛的身体；这位漂亮的虎鲨人发出阵阵呻吟，而且每一次挺进都让她叫得更响。伊兹玛很快也开始回应你，每次都抬起胯部迎合你的抽插。也正是在这时，你注意到她那根硬得脉动不已的肉棒正在晃来晃去。[pg]");
         outputText("你觉得不这么做有点失礼，也想看看自己究竟能让伊兹玛呻吟得多大声，于是你一边挺进她体内，一边握住她怒胀勃起的肉棒，开始为她套弄。这个举动似乎让伊兹玛吃了一惊，她随即发出快感的呻吟和尖叫。你带来的双重刺激很快就把伊兹玛推过极限，她开始向空中射出一股股浓稠的精液，随后洒落在她的脸和乳房上。高潮也席卷了她的女性器官，她的阴道内壁几乎带着痛感地夹紧你的" + Appearance.cockNoun(get_player().cocks[_loc1_].get_cockType()) + "。[pg]");
         outputText("在这场强烈的释放之后，伊兹玛开始喘息着大口吸气，但当她意识到你还没结束时，立刻又发出呻吟。你咯咯一笑，放开她正在软下去的勃起物，把双手按在她的大腿上，开始加倍用力地干她。每一次挺身，你都把伊兹玛更深地压进沙地里；尽管已经筋疲力尽，伊兹玛还是发出了几声柔软而愉悦的呻吟。[pg]");
         if(get_player().get_gender() == 1)
         {
            outputText("经过一场漫长的交合后，你大声闷哼，你的" + get_player().cockDescript(_loc1_) + "胀大起来，将一股股精液射进伊兹玛的子宫");
            if(get_player().cockTotal() > 1)
            {
               outputText("，也溅到她的腹股沟上");
            }
            outputText("，让伊兹玛大声叫了出来。");
            if(get_player().cumQ() >= 500)
            {
               outputText("随着你把那惊人的量尽数灌进她体内，她的肚子也鼓了起来");
               if(get_player().cumQ() >= 1500)
               {
                  outputText("。到最后，她再也胀不下了，每一次新的喷射都会把精液从她被灌满的小穴里挤出来，顺着她的肛门流下");
               }
               outputText("。");
            }
            outputText("你满足地叹了口气，从她身上退开，虚弱地重新站上你的[feet]，穿好衣服。伊兹玛慌忙爬到她的箱子旁，拿出某种叶子，然后吃了下去。[pg]");
         }
         else
         {
            outputText("经过一场漫长的交合后，你大声闷哼，你的" + get_player().cockDescript(_loc1_) + "胀大起来，将一股股精液射进伊兹玛的子宫");
            if(get_player().cockTotal() > 1)
            {
               outputText("，也溅到她的腹股沟上");
            }
            outputText("，让伊兹玛大声叫了出来。");
            if(get_player().cumQ() >= 500)
            {
               outputText("随着你把那惊人的量尽数灌进她体内，她的肚子也鼓了起来");
               if(get_player().cumQ() >= 1500)
               {
                  outputText("，直到再也容纳不下，每一次新的喷射都会把精液从她被塞满的小穴里挤出来，顺着她的肛门旁淌下");
               }
               outputText("。");
            }
            outputText("你满足地叹了口气，从她身上退开，虚弱地站到自己的[feet]上。不过你还没结束，还没完全结束。[pg]");
            outputText("伊兹玛又喘了一声，因为你把" + get_player().vaginaDescript(0) + "压到她脸上，在她棱角分明的面庞上磨蹭起来；她顺从的舌头钻过你的唇瓣，让你大声呻吟。你真觉得自己会迷上这种感觉。你又骑在她脸上享受了几分钟，直到一次高潮席卷你的女性部位，将淫液溅在伊兹玛脸上。你满足地叹了口气，虚弱地站起身，[if (isnaked) {整理好自己|重新穿好衣服}]。你看见伊兹玛正从她的储物箱里翻出什么东西——像是某种植物——然后嚼了下去。[pg]");
         }
         get_player().orgasm("Dick");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,231) <= 4 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,235) > 0)
         {
            outputText("你向漂亮的虎鲨人道别，等她把那枚牙齿形状的奖励交给你后便离开了。");
            FlagDict_Impl_.arrayWriteString(KFLAGS.flags,234,get_consumables().TSTOOTH.get_id());
            get_combat().cleanupAfterCombat();
         }
         else
         {
            victorzChoice();
         }
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,231,FlagDict_Impl_.arrayReadInt(_loc2_,231) + 1);
      }
      
      public function useVagooOnIzmaWin() : void
      {
         saveContent.previousVictoryTeased = false;
         clearOutput();
         outputText("你紧紧盯着战败的虎鲨人，脸上浮现出一抹笑意。你把一只手按在她额头上，轻而易举地将她推倒在地，顺手脱下她的衣服。她已经没有力气阻止你，但她很清楚这场战斗的条件是什么，所以不会食言。你脱下自己的[armor]，把伊兹玛的双腿大大分开，看着她跳动着勃起的肉棒和结实粗壮的大腿肌肉，不禁舔了舔嘴唇。你试探性地套弄了几下伊兹玛那根巨大的肉棒，引得这位虎鲨人发出几声愉悦的呻吟。[pg]");
         outputText("觉得前戏已经够了，你跨坐到她身上，顺着她的肉棒坐了下去。");
         get_player().cuntChange(get_monster().cockArea(0),true,true,false);
         outputText("你开始在她身上研磨扭动，");
         if(get_player().isTaur())
         {
            outputText("用你的体重把她压在沙地上，不让她夺回主动权。");
         }
         else if(get_player().get_tallness() > 48)
         {
            outputText("并把她的双手按在头顶上方，免得她试图改变姿势。你以这个姿势骑着她，她起伏的乳房不断摩擦着你的" + get_player().allBreastsDescript() + "。毕竟，她得知道这里到底是谁说了算。");
         }
         else
         {
            outputText("但你身形太小，根本拦不住她：她伸手抓住你的[ass]，接着像把你当成地精肉棒套一样上下颠弄。");
         }
         outputText("[pg]");
         outputText("伊兹玛似乎已经尽力了，尽可能地抬起并抽动自己的肉棒，惹得你发出阵阵快感的喘息。");
         if(!get_player().isTaur())
         {
            outputText("为了奖励你这位卖力的伴侣，你伸出一只空着的手往后探去，揉按又抓弄她的睾丸。伊兹玛咬住嘴唇，开始大声低吼，尽可能把臀部向上挺起，急切地想为你射出来。你决定回敬她这份热情，于是越来越快地把小穴往下压去。");
         }
         outputText("[pg]");
         outputText("又激烈交合了几分钟后，伊兹玛发出野兽般的闷哼与咆哮，迎来了高潮，一股股带着麝香味的热精液喷入你体内深处。你愉悦地叫出声来，内壁紧紧夹住她的肉棒，把她能射出的每一滴精液都榨了出来。过了一会儿，你总算缓过来，踉跄着[if (singleleg) {直起身|靠[feet]站了起来}]。[say:嘿，等一下，]你刚要离开，伊兹玛便虚弱地说道。她走到自己的储物箱前，取出一片皱巴巴的叶子，然后微笑着递给你。[say:给，拿着吧。这是一种避孕草药。]你要收下吗？");
         get_player().slimeFeed();
         get_player().orgasm("Vaginal");
         doYesNo(eatIzmasLeafAfterRapinHer,dontEatIzamsLeafAfterRape);
      }
      
      public function tradeWithFuckingSharkBitches() : void
      {
         spriteSelect(SpriteDb.get_s_izma());
         clearOutput();
         outputText("伊兹玛打开她的木箱，摆出几本旧书给你看。种类倒是有趣又丰富，只是数量不多；从卷起的书角和磨旧的书页来看，它们显然已经被人翻过不少次。当然，书本身还是好东西。[pg]");
         sharkBookMenus();
      }
      
      public function totalIzmaChildren() : int
      {
         return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,251) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,252);
      }
      
      public function timeChangeLarge() : Boolean
      {
         §§push(false);
         §§push(false);
         §§push(false);
         §§push(false);
         §§push(false);
         var _loc1_:int;
         checkedIzmaSophie = (_loc1_ = checkedIzmaSophie) + 1;
         if(_loc1_ == 0)
         {
            §§pop();
            §§push(get_sophieBimbo().bimboSophieAtCamp());
         }
         if(§§pop())
         {
            §§pop();
            §§push(izmaFollower());
         }
         if(§§pop())
         {
            §§pop();
            §§push(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1082) == 0);
         }
         if(§§pop())
         {
            §§pop();
            §§push(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,439) == 0);
         }
         if(§§pop())
         {
            §§pop();
            §§push(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,780) == 0 && Utils.rand(10) == 0 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,781) == 1);
         }
         if(§§pop())
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,781,0);
            get_sophieBimbo().sophieAndIzmaPlay();
            return true;
         }
         §§push(false);
         §§push(false);
         §§push(false);
         §§push(false);
         §§push(false);
         §§push(false);
         checkedIzmaLatexy = (_loc1_ = checkedIzmaLatexy) + 1;
         if(_loc1_ == 0)
         {
            §§pop();
            §§push(izmaFollower());
         }
         if(§§pop())
         {
            §§pop();
            §§push(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1082) == 0);
         }
         if(§§pop())
         {
            §§pop();
            §§push(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,439) == 0);
         }
         if(§§pop())
         {
            §§pop();
            §§push(get_latexGirl().latexGooAtCamp());
         }
         if(§§pop())
         {
            §§pop();
            §§push(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,785) == 0);
         }
         if(§§pop())
         {
            §§pop();
            §§push(get_debug() || Utils.rand(10) == 0);
         }
         if(§§pop())
         {
            izmaDomsLatexy();
            return true;
         }
         return false;
      }
      
      public function timeChange() : Boolean
      {
         var _loc1_:int = 0;
         _temp_1.daysSinceAneFight += 1;
         checkedIzmaLatexy = 0;
         checkedIzmaSophie = 0;
         pregnancy.pregnancyAdvance();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,253) > 0)
         {
            _loc1_ = 253;
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,_loc1_,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,_loc1_) - 1);
         }
         if(izmaFollower() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,439) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,785) > 0 && get_latexGirl().latexGooFollower() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,784) == 0)
         {
            FlagDict_Impl_.arrayWriteFloat(KFLAGS.flags,664,100);
         }
         if(izmaFollower() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,439) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2201) == 1 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,498) > 0)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2200,100);
         }
         if(get_game().time.hours > 23 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,246) > 0)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,246,0);
         }
         return false;
      }
      
      public function tigerRelent() : void
      {
         clearOutput();
         outputText("你向她道歉，说自己不太清楚规则。你的女儿只是咕哝了一声作为回应，又滑回去[if (kids == 1) {独自玩耍|和她的姐妹[if (kids > 1) {们}]一起玩}]，你也明白这是该离开河里的信号。你回到自己营地时，浑身湿漉漉的，心里既失望，又拿不准自己刚才处理得对不对。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function tigerLesson() : void
      {
         clearOutput();
         outputText("你没有放那个小鲨鱼女孩离开，而是立刻把她连同自己一起从水里拉了出来，让她懊恼地倒吸一口气。还没等她抱怨，你就让她坐到一块岩石上，用尽可能坚定的语气告诉她：她必须听你说。她看起来还有点不服气，但或许是刚刚的落败让她气势弱了下去，她什么也没说。");
         outputText("[pg]你开始解释，认清自己什么时候输了很重要——不管她怎么想，不管能想到什么借口，只要有人就是比她更快、更强、[i:更优秀]，那就是事实。你的女儿这时显得有些沮丧，但你接着说，这并不是世界末日；如果只会认输后闹别扭，她这辈子都会是个失败者。相反，她应该接受自己的角色，并努力下次做得更好；至于前者，你知道该怎么帮她。");
         outputText("[pg]此时，她看起来有些好奇，但当你[if (isnaked) {指着你的[genitals]|开始脱下你的[armor]}]时，她恍然大悟。这只虎鲨人变得比平时更红了，但并没有移开视线，似乎把你的话记在心里了，于是你牵起她的手，带她到一个舒适的地方。");
         if(get_player().hasCock())
         {
            outputText("[pg]你开始觉得很难忍耐了，但你还是尽力克制着，温柔地引导这个年轻女孩跪下，然后绕到她身后。这样一来，她那根小小的肉棒就可怜巴巴地悬在双腿之间，你告诉她今天不会碰它。她的身体因为不确定而微微颤抖，但当你摆好姿势，将你的[cock]抵在她娇嫩的唇瓣上时，她并没有躲开。");
            outputText("[pg]在滑入之前，你夸奖她是个听话的好女孩。");
            outputText("[pg]随着臀部轻松地一挺，你进入了她。你用缓慢而稳定的动作插入你的女儿，确保从这第一下抽插中榨取尽可能多的快感。她轻声咕哝着，移动双手以获得一个更稳定的姿势，但你几乎没给她足够的时间就发动了攻势，你的[hands]滑上她的腰间，紧紧捏住，开始像打桩机一样在她体内抽插。");
            outputText("[pg]她侧腹柔软的肌肤提供了极佳的抓握感，世界开始在极乐中摇晃，你的手指反射性地蜷缩，头微微向后仰去。你能感觉到自己正以惊人的速度接近高潮；你的女儿真的太适合做这种事了。不过，你暂时忍住了，并在动作中施加了更大的压力。由此产生的肉体拍击声可能盖过了河水的声音，但你不在乎，而是将所有的注意力都集中在身下的女孩身上。");
            outputText("[pg]每一次挺进都让你离高潮更近一步。你能感觉到自己的肉棒在她体内抽动，释放的欲望几乎强烈到难以忍受，但你还是尽可能地拖长这一刻，承担起让这女孩见识真正支配的职责。直到你再也无法忍耐时，你才在女儿体内爆发，[if (cumnormal) {把你稀薄的精液射进她深处|喷洒出你[if (cumhighleast) {巨量的}]精液，用种子涂满她的内壁}]。你仿佛体内有什么东西断开了一样，脑子里只剩下一个念头：尽可能把她灌满。而你的身体也顺从了这股冲动，让这个鲨鱼女孩尖叫起来，把脸埋进自己的手臂里。");
            outputText("[pg][if (cumnormal) {很快|终于}]，你已经再也射不出什么了，但你的[cock]仍徒劳地最后跳动了几下。你毫不客气地抽身而出，任由女儿筋疲力尽地瘫倒在地。");
         }
         else
         {
            outputText("[pg]有那么一会儿，你们只是站在那里，打量着彼此赤裸的身体。你看见她的小肉棒微微硬了起来，于是特意告诉她，今天她还没真正赢得使用它的权利。她唯一的反应只是困惑；看来你得说得更直接一点。");
            outputText("[pg]你把这个虎鲨人抱进怀里，让她仰面躺下，然后沿着她的身体挪上去，直到几乎跨坐在她脖子上。她仍有足够的活动空间抬头看你，所以你向前顶了顶腰，直到你的入口正好停在她鼻子前方，解决了这个问题。");
            outputText("[pg]你只稍微引导了一下，她便伸出了舌头。于是你猛地坐下去，将她整张脸都吞没，迫使她好好用上自己的嘴。你告诉这个年轻的虎鲨人，她乖乖接受自己在你身下的位置，真是个好女孩，并用一次腰部的碾动给这句话加上了重音。");
            outputText("[pg]一开始，你用缓慢慵懒的动作骑在她脸上，但这很快就显得不够，于是你加快了节奏，还催促她更热情一点。你的双手落到她头上借力，整个人更深地压向她，渴望尽可能多的接触。这样一来，她可爱的纽扣小鼻子正好顶在你的[clit]上，突如其来的感觉几乎让你下意识地往后跳开。");
            outputText("[pg]但你反而选择压得更深。你的手指缠进她银白色的短发里，随着腰部前后摆动，你闭上眼睛，更专注地感受从下方传来的巨大快感。将女儿完全闷在身下的感觉淹没了你的感官，而她热切的舌头也在你身上发挥着惊人的作用。看来你的小女儿的确全心全意地想取悦你，让你得到极大的满足，而你也索取着她所能给予的一切，甚至更多。");
            outputText("[pg]没过多久，你就发现自己已经徘徊在边缘。你的[legs]不安地扭动，全身越来越紧绷，呼吸一滞，[claws]也陷进她的头皮里。虎鲨人自始至终都没有停下，她毫不动摇的投入终于将你推过了极限。你的声音脱口而出，抓握也在放松与收紧之间交替。你的淫液[if (vaginalwetness > 2) {涌出|滴落}]，洒满她的脸。你的视线变得模糊。短短一瞬间，你忘记了一切。");
         }
         outputText("[pg]高潮逐渐退去后，你瘫软下来，滚到一旁，沉重地喘着气。你花了片刻漫无目的地望着前方，只是轻轻抚弄着自己，沉浸在身为阿尔法的温热满足感中。");
         outputText("[pg]当你的目光懒洋洋地重新滑向女儿时，你首先注意到她看起来比你还要疲惫，其次则是她颤抖的双腿之间有一摊黏稠的白色液体。看来她确实听进了你的建议，接受了自己作为贝塔的角色。");
         outputText("[pg]好吧，你觉得她应该是学到了一课，尽管她脸上的表情让你不太确定这份教训能留下多少。无论如何，你觉得下次她大概会更快明白，于是你收拾好东西离开了。");
         if(Utils.randomChance(1 - saveContent.tigersharksDeflowered / FlagDict_Impl_.arrayReadInt(KFLAGS.flags,252)))
         {
            _temp_1.tigersharksDeflowered += 1;
         }
         get_player().orgasm("DickVaginal");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function tigerExplain() : void
      {
         clearOutput();
         outputText("她撅着嘴的表情清楚表明，至少她自己是真心这么认为的。但你告诉她，说到底，关键还是速度。你更快、更强，这才是让你成为阿尔法的原因。她与其心怀怨气，不如从这次教训中学到点什么。如果她能以你为榜样，说不定有一天也能成为阿尔法。");
         outputText("[pg]你说着说着，她的表情从不高兴变得斗志满满，最后甚至跟着点起头来。[say:谢谢，[Dad]，我会让她们瞧瞧的！]她说完，便转身冲回水里，[if (kids == 1) {也不知道在追什么|去追另一条鲨鱼[if (kids > 2) {们}]}]。");
         outputText("[pg]你从水里爬上岸，心满意足地觉得自己给女儿上了重要的一课。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function talkWivIzma() : void
      {
         var _loc1_:* = null as IMap;
         spriteSelect(SpriteDb.get_s_izma());
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,239) == 0)
         {
            outputText("你在岩石上伊兹玛身旁坐下，温和地对她微笑。她也回以微笑，尽管对这份亲昵似乎有些慌乱和困惑。[say: 你在想什么？] 她看着你问道。你耸耸肩，请她稍微讲讲自己的事。[pg]");
            outputText("[say: 我……嗯，这很难说。湖水对我的头脑产生了一些影响。所以我才这么努力地通过阅读来保持脑细胞活跃。不过说远了……我出生在恶魔入侵之前。那时候我还是个孩子，住在湖畔的一个渔村里，] 她解释道。她一边思索，一边揉了揉太阳穴。[say: 后来……哦，对了，大概在我7岁的时候，村里的长老们开始尝试魔法，让人们变成两栖的掠食者，身体外形上近似如今的鲨族。][pg]");
            outputText("[say: 全面的恶魔入侵发生时，我应该已经十几岁了。我们退入水中以躲避侦察；有那么一段时间，一切都还算安稳……然后在我18岁那年，发生了某件事。一种奇怪的紫色淤泥出现在我们族人迁徙地附近的水域中。离它最近的人变化最为剧烈，最终形成了虎鲨人。那些液体逐渐扩散，污染了族人的心智和身体，把他们几乎全都变成了被欲望支配的野兽。][pg]");
            outputText("她沉沉叹了口气，你把一只手放到她肩上，让她脸上泛起一丝淡淡的红晕。[say: 谢谢，不过我不介意。真的。] 她飞快地吻了你一下。[say: 谢谢你愿意听我说。][pg]");
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,239,FlagDict_Impl_.arrayReadInt(_loc1_,239) + 1);
            doNext(get_camp().returnToCampUseOneHour);
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,239) == 1)
         {
            outputText("你在岩石上挨着伊兹玛坐下，朝她温暖地笑了笑。她也回以微笑，不过面对这份亲昵，她似乎有点慌乱，也有些困惑。[say: 你在想什么？]她看着你问道。你耸耸肩，请她随便聊一会儿。[pg]");
            outputText("你停顿片刻，琢磨着该聊些什么，随后忽然想到一个问题。你问伊兹玛，她平时在湖里都会遇见些什么；你只能坐船在湖面上航行，可她大部分时间都在水下游泳。她肯定知道不少你至今还没见过的奇怪生物。[pg]");
            outputText("伊兹玛抿起嘴唇，思索着回忆起自己过去在湖中的经历。[say: 啊，嗯，让我想想……我们在湖里最常见到的生物是海葵。我对她们了解不多……我是说，那些东西不会说话。就我看来，她们整个种族都是扶他，]她解释道。你追问她还有没有别的信息。[pg]");
            outputText("她若有所思地挠了挠头。[say: 嗯，她们有点像……植物一样的生物……我觉得？她们似乎从来不上岸。不像我的族人，她们看起来没有敌意，只是很淫荡。她们天生会产生一些很麻烦的毒素和毒液，既会刺激生殖器，又会让人觉得迟钝无力、反应不过来。啊，抱歉，帮不上更多忙——那些东西出现得比较晚，而且从不跟我们说话，也不跟我们交涉。不过话说回来，有我的族人在附近，也怪不得她们。][pg]");
            outputText("你理解地点点头，又问她在湖里有没有见过其他奇怪的生物。她认真地想了想。[say: 啊……嗯，湖里有些奇怪的黏液生物。不知道它们是从哪儿来的，但我觉得它们和湖水污染的源头有关。按我自己的遭遇来看，它们似乎只是些没脑子的生物，满脑子都是性和体液。它们想进水就进水，想上岸就上岸，通常会埋伏袭击别人。][pg]");
            outputText("出于好奇，你问伊兹玛有没有和这两个种族打过交道。[pg]");
            outputText("她似乎微微红了脸。[say: 啊……我以前和一个海葵有过一次。我那时只是游着游着碰上了她，那是我见到的第一个，我根本不知道她是什么。我当时已经有点发情了，等她开始抚摸我……嗯，这么说吧，我把我那四根都射空了……最后我把她打倒了。她的触手缠住我，然后本能就接管了一切，呃，我试着反击并压倒她……][pg]");
            outputText("你试着在脑海里想象那一幕……那画面意外地令人兴奋。你甩甩头把它赶走，又问湖里到底还有没有什么正常的东西。她皱起眉。[say: 还有一些普通的鱼，它们的肉有股怪怪的刺鼻味，不过能吃。抱歉，湖很大，就连我也没把每个地方都探索过。谁知道那附近还藏着什么呢？][pg]");
            outputText("你感谢伊兹玛愿意和你聊天，随后礼貌地告辞，让她继续独自思考。");
            dynStats(DynStat.Lust(5));
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,239,FlagDict_Impl_.arrayReadInt(_loc1_,239) + 1);
            doNext(get_camp().returnToCampUseOneHour);
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,239) == 2)
         {
            outputText("当伊兹玛对你微笑时，你注意到——而且这已经不是第一次了——她牙龈里那一排排相当惊人、也相当吓人的鲨鱼牙。你不禁好奇伊兹玛平时到底吃些什么；虽然你努力告诉自己伊兹玛绝不会伤害你，可脑中还是忍不住浮现出一些相当阴暗的猜测。伊兹玛似乎注意到了你的异样，听你说话时歪了歪头。[say: 嗯？怎么了？][pg]");
            outputText("你吓了一跳，但随即在心里责备自己；这样反应实在太荒唐了。你心想，如果这真的那么让你在意，那就直接问她好了。意识到她还在等你回答，你道了歉，但告诉她自己只是好奇她到底吃些什么。她耸耸肩。[say: 嗯，以前的话，我就是湖里有什么就吃什么。小东西之类的，你懂的，]她回答道。你忍不住注意到她说的是“以前”。那么她现在到底吃什么？[pg]");
            outputText("[say: 呃……嗯，当然是你营地里有什么食物就吃什么。或者任何逆流游上来的东西，]她答道。伊兹玛这种闪烁其词的回答让你心里有点烦躁。你换了个问法，问她是不是只吃鱼，还是也吃别的肉？[pg]");
            outputText("[say: 我其实不怎么挑食。]她懒洋洋地耸了耸肩。[say: 这只是本能——你抓到食物，就得在别的东西过来从你手里抢走之前把它吃掉……你还好吗？为什么问这么奇怪的问题？]你深吸一口气，又慢慢吐出来；然后问道：她有没有吃过人？[pg]");
            outputText("[say: 那要看你说的“人”是指什么，]她回答道。随后她意识到自己刚说了什么，眼睛顿时睁大。[say: 当、当然不是那种意思！我绝不会吃掉你，或者你的任何朋友之类的！想都不会想！我只吃过小恶魔和牛头人那样的东西！而且它们都是先死了的，我发誓！]你紧张地笑了笑，感谢伊兹玛没有生气。你倒没想过她会故意攻击你，只是一直在琢磨那些牙齿，以及她对它们的控制力。不过，她确实吃过一些当地种族这一点还是让你有些意外；你从没想过她还有这样的一面。[pg]");
            outputText("[say: 啊……我猜我们的名声确实不太好，]她误解了你的表情，抿着嘴笑了笑。你很快亲了她一下……亲在脸颊上。一股病态的好奇心还是逼出了那个悬在空气中的问题：它们到底是什么味道？[pg]");
            outputText("[say: 嗯……牛头人尝起来像牛肉，这倒不意外，但小恶魔的味道就像啃了一英里长的烤焦屁股。]你笑着问她有没有吃过地精——还是说她更喜欢把那些家伙干一顿再扔回去？她脸红了。[say: 她们确实挺可爱的……可爱的东西很难下口。不过我倒是可以把她们舔个爽……]你听了笑起来，又拿“下次让你旁观”这事调侃她一番，然后让她继续待着。[pg]");
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,239,FlagDict_Impl_.arrayReadInt(_loc1_,239) + 1);
            doNext(get_camp().returnToCampUseOneHour);
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,239) == 3)
         {
            outputText("你问伊兹玛介不介意回答一个私人问题。漂亮的虎鲨人朝你露出温暖的微笑作为回应。[say: 怎么突然这么害羞？都到这个地步了，我可不觉得我们之间还有什么好藏着掖着的，]她打趣道。你告诉她，你对她的家人有些好奇；她还记得他们吗？他们还在附近吗——她有没有兄弟姐妹？又或者，她是不是还有几个孩子没告诉过你？[pg]");
            outputText("[say: 嗯，让我想想，]虎鲨人开口道，[say: 我父母还在，不过我们不怎么联系，因为他们真的彻底屈从于本能了。而且我爸现在也变成了和我一样的虎鲨人，所以待在……“他”身边会有点怪。]一提到孩子，她轻笑了一声。[say: 哦，不。我当然有过很多伴侣，但我每次都会确保给他们避孕。生孩子这种事，我想留给……某个特别的人。]她看着你，温暖地笑着。听到最后那句话，你也对她回以微笑，但随即前一句话的含义钻进脑海，你惊讶地眨了眨眼；那是不是说她爸爸生过孩子？她脸一红，结结巴巴地说：[say: 没、没有……当然没有。至少我……我觉得没有。][pg]");
            outputText("你感谢她愿意告诉你这么私人的事。不过，当你准备离开时，又停下脚步，转身看向她。她提到过想和“某个特别的人”要孩子。出于好奇，你问她自己想要什么样的家庭。[pg]");
            outputText("[say: 我猜要看生孩子到底是什么感觉，]她眨了眨眼回答道。[say: 不过我可绝不打算当什么地精繁殖工具。]说着，她朝你吐了吐舌头。你笑了起来，问她是不是在说，她并不反对由自己来怀孕。她歪了歪头，仿佛压根没觉得这个想法有什么奇怪之处。你解释说，你是在问伊兹玛会不会介意自己亲自怀孩子，既然");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,439) == 1)
            {
               outputText("她以前有一套");
            }
            else
            {
               outputText("她现在有一套");
            }
            outputText("功能完全正常的男性生殖器。[pg]");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,439) == 0)
            {
               outputText("[say: 哦，不会。噗，说得好像那是什么难事一样，]她说道。看着伊兹玛作为一名[if (!izmaherm){曾经的}]双性人，在最基本的性别角色问题上如何看待自己，还挺有意思的。她若有所思地挠了挠下巴。[say: 嗯，性方面的话，我更习惯用我的阴茎，毕竟用它更容易占据主导，而且湖里的生物似乎也特别在意它。不过为了你，你想要哪边我就用哪边。][pg]");
            }
            else
            {
               outputText("[say: 哦，不会。噗，说得好像那是什么难事一样，]她说道。看着伊兹玛作为一名双性人，在最基本的性别角色问题上如何看待自己，还挺有意思的。她若有所思地挠了挠下巴。[say: 嗯，性方面的话，我以前一直更习惯用我的阴茎，毕竟用它更容易占据主导，而且湖里的生物似乎也特别在意它。不过为了你，我会听从你的命令，我的阿尔法。][pg]");
            }
            outputText("你可以就此打住，也可以试着调戏一下伊兹玛——不过如果你真那么做，结果可能会超出你的预期。你要怎么做？");
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,239,FlagDict_Impl_.arrayReadInt(_loc1_,239) + 1);
            menu();
            addButton(0,"调情",chooseToFlirtWithIzma);
            addButton(14,"离开",chooseNotToFlirtWithIzma);
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,239) == 4)
         {
            outputText("你不由得注意到，伊兹玛身边还放着另一本书。事实上，她是你记忆中见过最热衷阅读的人——你甚至不确定自己村里有没有人像她这么爱读书，更别说这个满脑子都是性欲的世界里的其他人了。这和你在遇见伊兹玛之前碰到的那些鲨鱼女孩形成了如此鲜明的反差……你忍不住想知道，她为什么表现得这么不一样。原因不可能只是因为她是扶他；她已经证明了，只要被挑起情欲，她和那些鲨鱼女孩一样好色，甚至还更容易被点燃。那么，为什么她就能控制住自己，至少保持礼貌，而她的女性同族却做不到呢？[pg]");
            outputText("当你意识到伊兹玛正盯着你，耐心地等着你开口时，你还是忍不住问她，为什么她和其他鲨鱼女孩相比会这么……嗯，这么安分。[pg]");
            outputText("她若有所思地挠了挠下巴，[say: 我……唔，说实话我也不知道。我记得刚变化之后不久，我一直在干鲨鱼女孩，好解决自己的欲望……可我总是很烦躁，因为我知道过不了多久自己又会发情，]她解释道。[say: 可后来，我走着走着，找到了我的箱子。那是我以前放在旧村子外面的，用来存放书本，也给自己一个能安静读书的地方……然后我搬走的时候，就开始带着它到处走，好让我随时都能读书。][pg]");
            outputText("[say: 那些书就像是……把我的注意力从欲望上移开了，帮我冷静下来。我的意思是，现在我几乎一直都在读书，这样在人前至少还能表现得半正常一点。不过，那股欲望始终都在，就像脑子和胯间一直有嗡嗡声一样，]她解释道。你告诉她，她确实幸运得多；你见过其他鲨鱼女孩，她们看起来除了性和暴力，什么都不在乎。[pg]");
            outputText("她脸涨得通红，紧紧贴到你身上抱住你。[say: 你对我真好，我的阿尔法……]你也搂住她，享受着她温柔的拥抱。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,439) == 0)
            {
               outputText("……同时耐心地无视她的阴茎正顶着你的大腿渐渐变硬这一事实。");
            }
            outputText("你松开她，尽量避免让她过度兴奋。你感谢她愿意和你聊这些，随后离开，而她又重新埋头回到书本之中。");
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,239,FlagDict_Impl_.arrayReadInt(_loc1_,239) + 1);
            doNext(get_camp().returnToCampUseOneHour);
         }
         else
         {
            outputText("你告诉伊兹玛你有些好奇；你以前见过鲨鱼女孩，但从没见过像她这样的。像她这样的鲨鱼扶他还有很多吗？[pg]");
            outputText("伊兹玛歪了歪头，[say: 哦，没有……所有鲨鱼扶他都叫虎鲨人，]她说道。[say: 这个外号是因为身上的条纹……不过，从一些本地人偷笑的样子来看，我觉得这个名字里大概还藏着点荤段子。我们算是鲨鱼中的一个小亚种，一整个扶他群体。当污染刚开始时，离化学物质爆发点最近的那些人都发生了变化，就像我一样。]你带着探究的语气问她，这种变化是不是因为他们原本是男孩或男人？还是说单纯因为化学物质浓度太高，所以有些女人长出了阴茎，也有些男人变成了半个女人？[pg]");
            outputText("[say: 呃……]伊兹玛一边揉着太阳穴，一边努力回想当时究竟发生了什么。[say: 我在那里的时候……对，确实有一些男人和一些女人都发生了变化。我们当时都很震惊，不过……嗯，那些新长出来的东西确实挺讨人喜欢的。][pg]");
            outputText("也就是说，两个性别都变成了扶他。一个显而易见的问题横在你们之间：伊兹玛原本是男孩？还是女孩？[pg]");
            outputText("她咯咯一笑，向你凑过来。[say: 怎么？不管是哪种都会让你介意吗？]你轻轻拍了下她的鼻子作为回应。不过你还是忍不住评价道，只有那些被高浓度毒素直接击中的男人保留了一部分男性特征，而其他人全都彻底变成了女孩，这实在有些奇怪。照理来说，应该是高浓度的东西让他们完全转变性别，而稀释后的东西只让他们部分女性化，把他们变成扶他才更说得通。[pg]");
            outputText("[say: 我对那些化学药剂的性质也不是特别确定，但我觉得它们本来就是专门用来把人变成扶他的，]她回答道。[say: 稀释得更厉害的药剂只影响了人们的心智和生殖器。][pg]");
            outputText("你有些困惑地问她：那为什么扶他看起来这么少见？除了伊兹玛本人之外，你还没见过其他扶他的鲨族；你遇到的其他鲨族全都是女孩。那岂不是说明，大多数男人都变成了鲨鱼女孩？[pg]");
            outputText("伊兹玛咬了咬嘴唇。[say: 男性大多都……被锁起来了，]她解释道。[say: 没人知道为什么，但污秽降临的时候，所有男性不光变得更高大、更强壮，还变得[b:极其]暴躁，整天都陷在持续不断的发情状态里。他们的生育力强得吓人，可一旦开始就绝对粗暴得很……你见过的那些雌性鲨族跟他们比起来，简直就像一群闹肚子的地精。][pg]");
            outputText("你难以置信地摇了摇头；她叹了口气，继续说下去时声音微微发颤。[say: 可是……最糟糕的是，所有鲨族都已经堕落得太深了，似乎没人真的知道自己锁起来的是谁，也不知道锁住自己的人又是谁……不知道那些人[b:曾经]是谁。]她叹了口气，摘下眼镜，用手背擦了擦眼睛。[pg]");
            outputText("一个沉重的念头在你心中成形，于是你问，伊兹玛和她的族人是否被迫把自己的男孩也和村里那些曾经的男人一起锁起来。[say: 鲨鱼男人似乎不会自然诞生，]她回答道，[say: 自从我们全都被转化以来，不管是鲨鱼女孩还是虎鲨人，都再也没有生下过男孩。有些特殊的鲨鱼药片可以把人变成鲨鱼男人，可是……嗯，那样的命运我不希望任何人遭遇。][pg]");
            outputText("你有些迟疑地问，像伊兹玛这样的虎鲨人能不能繁殖——如果可以的话，她们的状态会遗传吗？还是说她们只能让别人怀上或自己生下更多鲨鱼女孩？她点点头。[say: 嗯，我们可以繁殖——既可以自己生育，也可以让别人怀上后代，也包括你说的那种遗传。我们不像鲨鱼男人那样有超强的生育力，但我们确实可以——也确实会——完成这件事，而且我们既能做父亲，也能生下更多虎鲨人。说实话，第二代、第三代虎鲨人比第一代还要多。她们出生的频率比普通女孩低一些，但也没低到特别夸张——大概十个里有四个，不是什么十个里一个，或者一百个里一个。][pg]");
            outputText("你感谢伊兹玛愿意和你谈这些，[if (cor < 33) {并坚持说，追问这些痛苦的回忆并非有意伤害她|[if (cor < 66) {也无意继续追问这些痛苦的回忆|尽管触及这些痛苦的回忆让她不适，你的好奇心已得到满足}]}]。她温柔地朝你笑了笑，紧紧抱住你。[say: 没关系。能……能把这些事告诉别人，感觉挺好的，]她说道，一边重新戴上眼镜，一边轻轻吻了你一下。");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,239,0);
            saveContent.sharkManTalk = true;
            doNext(get_camp().returnToCampUseOneHour);
         }
      }
      
      public function talkToASharkCoochie() : void
      {
         spriteSelect(SpriteDb.get_s_izma());
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,232) == 0)
         {
            outputText("你在伊兹玛身旁的岩石上坐下，和她交换了一些闲话与消息。随后，伊兹玛给你讲了个奇怪的故事：她曾在湖面地平线上看见一座神秘的岛屿，过去还在附近的山上见过一个会喷吐烟雾的奇怪轮廓。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2024) <= 0)
            {
               outputText("你若有所思地挠了挠下巴，觉得这件事值得进一步调查。");
            }
            else
            {
               outputText("你笑了笑，详细告诉她那座工厂究竟是什么，以及你后来在那座工厂里做了些什么。");
            }
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,232,1);
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2024) <= 0)
         {
            outputText("你和伊兹玛坐在一起又聊了一会儿；很自然地，你们的话题转向了山上翻滚的粉色烟雾。据她所说，最近几天那股烟的量可疑地增加了不少。她哀叹自己水栖的天性让她无法进一步探索；你尽力表示理解与同情，然后便告辞离开。");
         }
         else
         {
            outputText("山上的工厂已经关闭，不再喷吐显眼的粉色烟雾，于是你们的谈话转向了更深奥的话题。你们讨论了恶魔爆发所带来的一些影响，也推测未来可能会变成什么样。她有理有据地阐述自己的观点，既不退让，也不跑题；而你在组织并提出自己论点时，也算让脑子好好活动了一番。");
            dynStats(DynStat.Inte(1));
         }
         outputText("[pg]最后，你们决定各自离开，而你则返回营地。");
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,230,FlagDict_Impl_.arrayReadInt(_loc1_,230) + 1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function takeItInZeButtVictoryLikeFromIzma() : void
      {
         saveContent.previousVictoryTeased = false;
         clearOutput();
         get_player().slimeFeed();
         outputText("你看着伊兹玛瘫倒下去，再也无法反抗你，不由得露出一抹得意的笑。[pg]");
         outputText("你把她推倒在地，让她仰面躺下，看见她那根非人的肉棒从裙子里弹了出来。看来刚才的战斗把这条小鲨鱼撩拨起来了。不过，说她“小”显然不适合用来形容她的任何一部分，尤其是当她身上还挺着一根[if (metric) {38厘米|15英寸}]长、硬得像石头一样的勃起时。那东西在她身上晃动，竟让你脸上浮现出傻乎乎的笑容。既然这是你赢来的奖励，那你就不妨收下吧。[pg]");
         outputText("你俯下身，开始舔弄并吮吸她那根怪物般肉棒的顶端，吞下她滚烫的前液，把她怒胀勃起的龟头润湿。她在你的触碰下呻吟着抽动，身体扭来扭去，沉醉于被压制的感觉之中。把她掌控在手中的感觉，也让你脸上浮现出笑意。[pg]");
         outputText("渐渐地，你开始把她的肉棒越含越深，[if (metric) {一厘米又一厘米|一英寸又一英寸}]地滑进你的喉咙。直到终于含到她的根部时，你轻轻干呕了一下，随后才把它抽出来。她虚弱地呜咽着，可怜巴巴地看着你，不明白你为什么要这样挑逗她。你脱下自己的[armor]，转过身向她展示你的[ass]。当她意识到你打算做什么时，她棱角分明的脸上露出一丝小小的笑容。你把双手放到臀后，掰开臀瓣，然后开始坐上她那根已经被充分润滑的肉棒。[pg]");
         outputText("随着你一点点坐下去，她发出低吼和粗重的喘息；即便有各种体液润滑着那根硬如钢铁的肉棒，你也依然感到一阵胀痛。但渐渐地，疼痛化为快感，你们都大声呻吟着，呼喊着彼此的名字，在她身上起伏骑乘。");
         get_player().buttChange(get_monster().cockArea(0),true,true,false);
         outputText("[pg]");
         outputText("这条鲨鱼咬紧牙关，发出一声吼叫，随着高潮把一大股滚烫的精液直直射进你的[asshole]深处。她把四颗睾丸里的东西全都灌进你体内，让你的腹部微微鼓胀起来。你的肌肉抽搐、收缩，在她射精的瞬间，你几乎觉得眼前都冒出了星星。你花了好一会儿才缓过气来，慢慢从她逐渐软下来的肉柱上滑下，爬到沙地上。[pg]");
         get_player().orgasm("Anal");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,231) <= 4 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,235) > 0)
         {
            outputText("你向漂亮的虎鲨人道别，等她把那枚牙齿形状的奖励交给你后便离开了。");
            FlagDict_Impl_.arrayWriteString(KFLAGS.flags,234,get_consumables().TSTOOTH.get_id());
            get_combat().cleanupAfterCombat();
         }
         else
         {
            victorzChoice();
         }
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,231,FlagDict_Impl_.arrayReadInt(_loc1_,231) + 1);
      }
      
      public function submitToLakeIzma() : void
      {
         var _loc1_:int = 0;
         spriteSelect(SpriteDb.get_s_izma());
         clearOutput();
         outputText("你对伊兹玛露出微笑，开始缓慢而撩人地脱下你的[armor]，一件件散落在周围的沙地上。在这名虎鲨人的注视下，你摆了几个姿势，然后俯身跪到手脚着地，屁股朝向她。你扭过头，从肩后看向她，");
         if(get_player().hasLongTail())
         {
            outputText("你的尾巴诱人地摇摆着，");
         }
         outputText("然后你撩人地扭了扭" + get_player().assDescript() + "。你告诉她，你觉得该轮到她来玩了。[pg]");
         outputText("伊兹玛明显屏住了呼吸，她的肉棒胀痛地勃起，因欲望而跳动。她甚至懒得脱下比基尼，就朝你逼近，每一个动作都暴露出她的意图。几秒之内，她便来到你身后，双手牢牢抓住你的[ass]。你突然感觉到一股滚烫的液体淌进臀缝之间，不由得惊叫一声——那几乎就像有人把滚烫的岩浆倒在你的屁股上。伊兹玛的精液热得惊人，你甚至惊讶自己没有看见蒸汽从身后飘上来。[pg]");
         if(get_player().get_gender() <= 1)
         {
            if(get_player().analCapacity() < 26)
            {
               outputText("你忍不住因那突如其来的感觉而痛叫出声——某个巨大得离谱的东西正硬生生挤进你的[asshole]。");
               get_player().buttChange(30,true,true,false);
               outputText("[pg]");
               outputText("[say: 天哪——！我最好还是对这玩意儿悠着点……]你听见伊兹玛喊道。[say: 主要是为了我自己的安全！]她的动作变得温柔了些。她依旧强行挤进你的身体，[if (metric) {每一厘米都折磨人|一英寸一英寸地折磨人}]，但速度放慢了，节奏也更平稳，让你的后穴有时间适应她带来的猛烈撑胀，并用她滚烫的先走液当作润滑。[pg]");
            }
            else if(get_player().analCapacity() < 26)
            {
               outputText("她的肉棒稳稳没入你的肛门时，你能感觉到每一[if (metric) {厘米|英寸}]，它像涨潮般不可阻挡地在你的肠道里鼓胀开来。[pg]");
               outputText("[say: 啊啊啊……这可真是个不错的小洞！你是故意输的吗？]她问道，你能从她的声音里听出笑意。[pg]");
            }
            else
            {
               outputText("伊兹玛的肉棒或许相当惊人，但你过去也承受过更大的，而这点显而易见；伊兹玛第一次试探性的抽插就整根没入你的肠道，你在再次被填满的快感中呻吟起来，同时她的四颗睾丸拍打着你的[ass]。[pg]");
               outputText("[say: 搞什么！？你到底遇到过些什么怪物？]她忍不住出声嘀咕。[pg]");
            }
            outputText("完全埋入后，她紧紧抓住你的" + get_player().assDescript() + "，接着抽出一部分，又凶狠地顶了回去。[say: 以为自己很聪明，是吧？想试试鲨族的做法，对吗？好啊，在鲨族里，只有两种人——强者和弱者。而这就是弱者的下场，]她凶狠地低吼道。[pg]");
            outputText("她越顶越狠、越顶越快，节奏不断加速，随着她前后冲撞，睾丸清脆地拍打着你的[ass]。你能感觉到她巨大的雄性器官在你深处，摩擦着你的前列腺，撑开你的内壁，她滚烫的勃起抵着你灼热的身体。你因快感而呻吟；你根本无法不享受这一切");
            if(get_player().hasCock())
            {
               outputText("，而你自己的雄性器官也在刺激下变得坚硬，阵阵悸动");
            }
            outputText("。[pg]");
            outputText("[say: 哦，有人喜欢这样，是吧？别担心，既然你想试试自己的运气，那我可不会手下留情！你会得到完整体验的，亲爱的！]伊兹玛低吼道。她的双手突然从揉捏你的臀部转为抓住你的后背，伊兹玛猛地咬住你时，你在痛苦与快感交织中嚎叫起来——力道足够让你清楚感受到，却还不至于咬出血，尤其是她的鲨齿已经收了回去。她其他的牙齿咬住你的侧身，一边与你交合，你也忍不住向后迎合她的冲撞。如果这就是鲨族的做法，你还真可能会习惯上……[pg]");
            outputText("[say: 就是这样，弱者，为我呻吟吧；让这更爽一点！要是你赢了，我也会呻吟的，所以你至少该给我同样的礼貌——这样才公平！]她含糊地说道。[say: 哦，对，对，对！真是个好用的小骚货，真棒！我……我要……来……了！]她咆哮着，松开抓住你肩膀的手，朝天空吼出狂喜；在她强壮的睾丸中翻涌冲撞已久的高潮，终于从她体内爆发出来。[pg]");
            outputText("你也呻吟起来，");
            if(get_player().hasCock())
            {
               outputText("[eachcock]喷出");
               if(get_player().cumQ() < 25)
               {
                  outputText("一小股");
               }
               else if(get_player().cumQ() < 150)
               {
                  outputText("几股");
               }
               else
               {
                  outputText("一股持续不断的");
               }
               outputText("精液，洒到你身下的沙地上，但与你肠道里涌入的洪流相比，这根本微不足道。滚烫而滑腻的精液在你体内奔涌流淌，一次又一次泵入你的深处。");
            }
            else
            {
               outputText("你自己的肌肉因巨大的快感而痉挛。");
            }
            outputText("虎鲨人的精液巨浪涌到你的胃里，并把它彻底灌满，你的腹部随之鼓起，随后又开始进一步撑大。你的四肢不听使唤，在快感中脸朝下倒在沙地上，完全被感觉吞没，甚至没注意到自己的肚子正变得又硬又胀，紧紧顶在地面上。[pg]");
            outputText("最后，伊兹玛停了下来，大口喘着气；随着她的肉棒软下去并从你被撑开的肛门里抽出，一股滚烫的精液也随之不断流出。她恢复过来时，你也缓了过来，翻过身让自己能看见她；你的腹部因为她灌入的精液而胀成了一个不大却无可否认的小肚子。她看着你，显然对眼前所见十分满意。她俯下身，在你唇上轻轻一吻，然后在你身旁瘫坐下来。她伸手把你拉过去，让你把头枕在她枕头般的DD罩杯乳房上。等你恢复后，她扶你站了起来。[say: 你对自己的下位者也太好了，[name]……不过这也正是我这么喜欢你的原因。]她坏笑着，给了你一个绝对称不上纯洁的吻，又在你屁股上拍了一下，然后你穿好衣服，返回营地。[pg]");
         }
         else if(get_player().get_gender() == 2)
         {
            if(get_player().vaginalCapacity() < 26)
            {
               outputText("有什么如此巨大的东西突然硬生生挤进你的" + get_player().vaginaDescript(0) + "里，你忍不住痛得叫出声来。[pg]");
               outputText("[saystart]哇哦——！");
               if(get_player().vaginas[0].virgin)
               {
                  outputText("第一次，是吧？");
               }
               else
               {
                  outputText("可真紧啊！");
               }
               outputText("别担心，小家伙；我会温柔点的……至少前几下会。[sayend]出乎意料的是，她说的是真话，动作也确实变得轻柔了一些。她仍然在往你体内挤进来，[if (metric) {每一厘米都让你疼得难熬|一寸一寸都让你疼得难熬}]，但她的节奏放慢了，也更平稳，让你的小穴有时间适应她带来的猛烈扩张，同时把她滚烫的前列腺液当作润滑。你发现自己甚至开始向后迎去，想让这个过程快一点，渴望伊兹玛再次将你填满。");
            }
            else if(get_player().vaginalCapacity() < 60)
            {
               outputText("你能清楚感觉到她肉棒的每一[if (metric) {厘米|英寸}]，正稳稳沉入你的" + get_player().vaginaDescript(0) + "里，像上涨的潮水一样不可阻挡地填满你湿润的褶缝。[pg]");
               outputText("[say: 啊啊啊~这才像个舒服的小洞嘛！你是故意输的吧？]她问道，而你能从她的声音里听出那抹笑意。你发现自己也忍不住开始这么想……");
            }
            else
            {
               outputText("伊兹玛的肉棒或许相当惊人，但你也不是没承受过更大的，这一点很快就显露出来；伊兹玛第一次试探性的挺动，就让她直没至根地沉入你的胯间，而当她的四颗卵蛋拍打在你的会阴上时，你也因再次被填满的快感而呻吟出声。[pg]");
               outputText("[say: 搞什么！？你到底都遇上过些什么怪物？]她忍不住出声嘀咕道。");
            }
            get_player().cuntChange(30,true,true,false);
            outputText("[pg]");
            outputText("彻底埋入后，她紧紧抓住你的[ass]，然后开始抽出，再狠狠挺身刺回。[say: 还以为自己挺聪明，是吧？想试试看鲨族的做法，对吧？好啊，在鲨族之中，只有两种人——强者和弱者。而这就是弱者该得到的下场，]她凶狠地低吼道。[pg]");
            outputText("她挺动得越来越重、越来越快，逐渐带出愈发急促的节奏；她前后冲撞时，卵蛋清晰地拍打在你的屁股上。你能感觉到她巨大的雄性器官深入你的体内，摩擦着你子宫的内壁，将你一点点撑开；那滚烫的勃起紧贴着你灼热的内里。你呻吟着；你根本无法不享受这一切，你的阴户也在强烈快感中不断淌出淫液。[pg]");
            outputText("[say: 哦，有人很喜欢嘛，是吧？别担心，既然你想试试自己的运气，那我可不会手下留情！你会把整套体验都尝个遍的，甜心！]伊兹玛低吼道。她的双手突然从你的臀部移开，转而抓住你的[chest]，接着猛地用力一扯你的[nipples]，让你在痛楚与快感交织中嚎叫出声。[say: 乳头都硬了？你果然很想要这个吧……]伊兹玛调笑着，舔上你的脖颈，惹得你因快感而呻吟。[pg]");
            outputText("[say: 就是这样，弱者，为我叫出来；让这更痛快点！要是赢的是你，我也会叫的，所以你至少该回敬我同样的礼数——这才公平！]她低声说道。[say: 哦，对，对，对！乖乖挨操，真乖！我……我快……要……来了！]她咆哮着，松开了对你饱受折磨的乳房的钳制，向天空吼出胜利般的狂喜；那在她强健卵蛋中翻腾冲撞已久的高潮，终于从她体内爆发而出。[pg]");
            outputText("你也发出呻吟，自己的高潮把身下的沙地涂满了女性的体液，而伊兹玛的精液则滚烫地灌进你的子宫。热而滑腻的液体涌动着流入你体内，一波又一波地泵进你的深处。随着那股虎鲨人的精液巨浪抵达你的胃部并将其彻底填满，你的肚子开始鼓胀，随后又继续向外撑开。你的四肢再也支撑不住，在快感中脸朝下跌倒在沙地上，被感官吞没到甚至没注意到自己的腹部正硬邦邦地鼓起，顶在地面上。[pg]");
            outputText("终于，伊兹玛停了下来，剧烈地喘着气；随着她的肉棒软下来并从你被撑开的肛门里抽出，一股稳定的热精也随之淌了出来。她慢慢恢复过来，而你也是如此，翻过身去看她；她灌进你体内的精液让你的腹部肿胀起来，形成一个虽小却无法否认的肚腩。她看着你，显然对眼前的景象十分满意。她俯下身，在你唇上轻轻一吻，然后瘫倒在你身旁。她伸手把你拉过去，让你把头靠在她枕头般的DD罩杯乳房上。等你恢复过来后，她扶你起身。[say: 你对自己的下位者太好了，[name]……但这也正是我这么爱你的原因。]她露出坏笑，给了你一个明显不怎么纯洁的吻，又在你屁股上拍了一下，随后打开了她的储物柜。[pg]");
            if(get_player().get_pregnancyIncubation() == 0)
            {
               outputText("她拖出一株植物，小心翼翼地摘下一片叶子递给你。[say: 能请你把这个吃了吗？这是避孕草药。总有一天，我会很乐意和你生孩子……但在那之前，我想先赢得你作为伴侣的认可。]看着她那有些老派的样子，你不禁微微一笑，从她手中接过叶子吃了下去。");
            }
         }
         else
         {
            outputText("[say: 真是个下流的小妖精，是吧？你想要这个，对不对……]伊兹玛调笑着，将两根手指插入你湿润的下唇之间，先试探一下情况。你饥渴的小穴被侵入，让你忍不住轻轻呜咽起来，几乎是在恳求被填满。");
            if(get_player().vaginalCapacity() < 26)
            {
               outputText("[say: 哎呀呀，你后面这个小缝还挺紧的嘛。不过也紧不了多久了……]伊兹玛说道，手指在你的阴户里游走。");
            }
            else if(get_player().vaginalCapacity() < 60)
            {
               outputText("伊兹玛因为能如此轻易地在你湿润的褶缝间进出而轻轻笑了起来。[say: 好吧，我想这多少会让你轻松一点。]");
            }
            else
            {
               outputText("伊兹玛瞪大了眼睛，她整只手似乎都滑进了你宽阔的阴道里。[say: 我操……这里面之前到底塞过什么？]她喃喃道，惊讶得有些紧张地笑了起来。");
            }
            outputText("伊兹玛把手指抽出来，迅速将你赤裸的身体翻了个面，让你仰躺着抬头看着她。伊兹玛双手叉腰，似乎正自豪地挺起自己丰满的胸膛。她那根[if (metric) {三分之一米长的|一英尺长的}]肉棒已经完全勃起，滚烫的前列腺液不时滴落在沙地上。她花了点时间打量你的肉棒，咧嘴露出獠牙笑了起来。[say: 让我看看你有什么本事，弱者。][pg]");
            _loc1_ = get_player().biggestCockIndex();
            if(get_player().cocks[_loc1_].cockLength <= 10)
            {
               outputText("伊兹玛看见你的肉棒，勉强忍住没笑出声来。[say: 呃……哇哦？它真是……呵，巨大啊……]");
            }
            else if(get_player().cocks[_loc1_].cockLength <= 19)
            {
               outputText("[say: 不错，我还真有点佩服了，]伊兹玛说道，略微点头表示认可。");
            }
            else
            {
               outputText("伊兹玛看着你的[cock]，低低地吹了声口哨。[say: 这才叫肉棒。看起来你下面像是多长了一条腿！]");
            }
            outputText("[pg]");
            outputText("伊兹玛似乎已经评估完了你，她粗暴地抓住你的[feet]，把你的臀部向上拉起，迫使你的重量压到脊背上，让你因这个难受的姿势而叫出声来。她没有把时间浪费在前戏上，只是决定慢慢把肉棒埋进你体内，[if (metric) {一厘米一厘米地艰难推进|一英寸一英寸地艰难推进}]，直到顶住你子宫的入口。");
            get_player().cuntChange(30,true,true,false);
            outputText("[pg]");
            outputText("她开始在你体内进出抽送，并逐渐加快速度、加重力道。她滚烫的前列腺液和你的淫液混在一起，像润滑剂一样让一切变得更加顺畅。[say: 啊~你真是个可爱的肉棒套子……你喜欢被这样对待，对吧，弱者？]伊兹玛嘲弄着，在你的" + get_player().vaginaDescript(0) + "里狠狠进出。你甚至已经不太羞于承认事实确实如此了。[pg]");
            outputText("每一次顶弄都把你更深地压进沙地里，最后你发现自己正主动抬起腰臀迎合伊兹玛，渴望取悦她，也取悦自己。伊兹玛似乎注意到了这一点，放声大笑起来。[say: 哦？你真的喜欢被支配？哈，我就知道。]她一边继续嘲弄你，一边猛烈地干着你，每一下她的睾丸都会拍打在你身上。你的脑子已经被情欲搅得一片混沌，她说的话你连一半都听不进去。现在你在乎的只有高潮。[pg]");
            outputText("几分钟后，伊兹玛最后一次用力挺进，发出响亮的吼声，精液灌入你的子宫，又喷溅到沙地上。" + get_player().SMultiCockDesc() + "抽动着、搏动着，随时都要喷发。伊兹玛迅速握住");
            if(get_player().cockTotal() == 1)
            {
               outputText("它");
            }
            else
            {
               outputText("它们");
            }
            outputText("，对准你的脸，套弄着你直到高潮。你自己的精液一股股喷溅在脸上和身上，你扭动着身体抗议起来。[say: 啧，你还真以为我会让你射在我身上？要是你真能打败我，也许我会给你这个荣幸，]伊兹玛说道，伴随着响亮的*啵咕*声抽身而出。她");
            if(get_player().get_pregnancyIncubation() == 0)
            {
               outputText("松开你的[feet]，让你的[ass]扑通一声落到沙地上，然后在你一动不动地躺着时开始重新穿衣。她手里拿着一株避孕草药回来，接着把一片叶子送进自己嘴里。你还没来得及想她为什么这么做，她就俯下身狠狠吻住你，用舌头把那片叶子推过你的嘴唇，送进你的喉咙。");
               outputText("[say: 我很乐意和你生几个孩子……但得等到你接受我当伴侣<b>之后</b>。]她得意地笑了笑，又给了你一个显然很不纯洁的吻，然后扶你起身。你穿好衣服，带着极大的满足感回到了营地。");
            }
            else
            {
               outputText("给了你一个显然很不纯洁的吻，然后扶你起身。你穿好衣服，带着极大的满足感回到了营地。");
            }
         }
         get_player().orgasm("VaginalAnal");
         dynStats(DynStat.Sens(2));
         get_player().slimeFeed();
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function stopTheFight() : void
      {
         clearOutput();
         outputText("你安抚好你的鲨鱼爱人，起身赶过去制止这场暴力。两个年轻女孩还在互相掐架，见状都停了下来，震惊地盯着你。你解释道，不管她们的天性如何，无论愿不愿意，她们都是姐妹。小A羞愧地低下头，一言不发，而虎鲨人则趁机使出全力，把海葵推开。");
         outputText("[pg][say: 是她先动手的！]女孩喊道。你可没被骗，从一开始你就一直看着呢。鲨鱼女孩发现自己没法靠撒谎脱身，顿时睁大了眼睛。[say: 哦……]");
         outputText("[pg]你[walk]过去把小A扶起来，很快又让她们两个面对面站好。她们都需要抱一抱、和好如初；家人必须学会彼此原谅。虎鲨人移开视线，害羞地揉了揉自己的胳膊。");
         outputText("[pg][say: ……我不该攻击你，]她承认道，[say: 对不起。]");
         outputText("[pg]小A笑了起来，抱住鲨鱼女孩，大声喊道：[say: 一家人！]");
         outputText("[pg]伊兹玛现在冷静多了，她被这甜蜜的结局打动，满怀爱意地把手按在胸口。她握住你的手，称赞你的育儿方式。[say: 你真是个了不起的[father]，我的阿尔法。]");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function stopIzmaLatexy() : void
      {
         clearOutput();
         outputText("在事态继续发展之前，你走进她们中间制止了这一切。[latexyname]是你的，伊兹玛也不该装成女主人来摆弄你的宠物。");
         outputText("[pg]虎鲨女孩显然被训住了，温顺地退开，低声说道：[say:是，阿尔法。]就这么一下，她已经跑开了，多半是去撸那根因为玩弄黏液女而胀起来的巨型硬棒了。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,784,1);
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,785,FlagDict_Impl_.arrayReadInt(_loc1_,785) + 1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function stephenHawkingPorn() : void
      {
         spriteSelect(SpriteDb.get_s_izma());
         clearOutput();
         outputText("你脸上闪过一丝邪恶的坏笑，指了指伊兹玛箱子里的一小捆色情画册。伊兹玛看起来很紧张，拿出一叠插图。[say: 啊哈……真的吗？]她问道，脸上满是尴尬的表情。你点点头作为回应，在一块石头上坐下，示意伊兹玛加入你。她脸上有些红晕，虽然你还不够了解她的生理结构，无法判断这比平时是多还是少。她坐下来开始和你一起看色情画册，在调整姿势时，她的腿碰到了你的腿");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,439) == 0)
         {
            outputText("还不断地压着裙子里的那头野兽，不让它翘起来。[pg]");
         }
         else
         {
            outputText("她紧张地克制着，努力不让它被弄湿。[pg]");
         }
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,253,11);
         outputText("等你们读完时，伊兹玛显然已经被撩拨起来了。她试图掩饰，还端端正正地坐着——");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,439) == 0)
         {
            outputText("但对于一个刚有超过[if (metric) {三十厘米|一英尺}]长的肉棒从大腿间滑出来、直挺挺戳向空中的人来说，这显然不太可能。你毫不掩饰地笑出声，轻轻扯了扯伊兹玛的银发，然后起身告诉她你还有别的事要办。伊兹玛只是沉默地点点头作为回应，目光却始终盯着面前那些淫秽的图像。等你觉得自己已经走出她听力范围时，又忍不住笑出了声。");
         }
         else
         {
            outputText("但对于一个不停扭动、让腰下发出下流湿响的人来说，这显然不太可能。你毫不掩饰地笑出声，轻轻扯了扯伊兹玛的银发，然后起身告诉她你还有别的事要办。伊兹玛只是沉默地点点头作为回应，目光却始终盯着面前那些淫秽的图像。等你觉得自己已经走出她听力范围时，又忍不住笑出了声。");
         }
         dynStats(DynStat.Lib(1),DynStat.Lust(5));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function sharkgirlPronz() : void
      {
         spriteSelect(SpriteDb.get_s_izma());
         clearOutput();
         outputText("当你从一堆书底下翻出这本书时，伊兹玛显得窘迫极了。这似乎是一系列在这片土地上创作的色情图像，描绘了各种性别的不同生物卷入性爱场面的情景。你向她挑起眉毛，露出询问的神情。[say: 啊，那个……那算是不错的素材吧，我、我想，]她结结巴巴地说着，试图掩饰自己把它错放在其他书里的尴尬。[say: 呃……如果你想看的话，20颗宝石？]");
         if(get_player().get_gems() < 20)
         {
            outputText("[pg]<b>你没有那么多。</b>");
            doNext(tradeWithFuckingSharkBitches);
         }
         else
         {
            doYesNo(readSharkgirlPornzYouFuckingPervertAsshole,tradeWithFuckingSharkBitches);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2003) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2014) > 0 && !get_player().hasKeyItem("Izma\'s Book - Porn"))
         {
            addButton(2,"购买",buyBookPorn);
         }
      }
      
      public function sharkEdgingGuideLOL() : void
      {
         spriteSelect(SpriteDb.get_s_izma());
         clearOutput();
         outputText("你从书堆里拿起一本名为《礼仪指南》的书，副标题写着“现代淑女或绅士社交手册”。这标题有点俗气，不过你想，学学如何让自己保持贞洁与得体，也许某天会派上用场。[say:读起来还不错。不过，对像我这样的鲨鱼女来说，基本没什么用，]伊兹玛评价道，随后向你伸出手。[say:想再找到很难，所以……如果你想借的话，25枚宝石。]");
         if(get_player().get_gems() < 25)
         {
            outputText("[pg]<b>你没有那么多。</b>");
            doNext(tradeWithFuckingSharkBitches);
         }
         else
         {
            doYesNo(readSharkEdgingGuideLOL,tradeWithFuckingSharkBitches);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2003) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2014) > 0 && !get_player().hasKeyItem("Izma\'s Book - Etiquette Guide"))
         {
            addButton(2,"购买",buyBookEtiquetteGuide);
         }
      }
      
      public function sharkBookMenus(param1:Boolean = false) : void
      {
         menu();
         if(param1)
         {
            addButton(0,"战斗手册",campCuntManual).hint("这本书会教你一些战斗技巧，应该能提升你的战斗能力。[pg]伊兹玛现在会免费让你读一本书。");
            addButton(1,"熵指南",entropyGuideByStephenHawking).hint("这本书会教你如何成为一个更好的人，应该能降低你的性欲和腐化。[pg]伊兹玛现在会免费让你读一本书。");
            addButton(2,"色情书",stephenHawkingPorn).hint("顾名思义。给变态看的，当然。这绝对会让你欲火上身。[pg]伊兹玛现在会免费让你读一本书。");
         }
         else
         {
            addButton(0,"战斗手册",readSharkCuntManual).hint("这本书会教你一些战斗技巧，应该能提升你的战斗能力。");
            addButton(1,"熵指南",sharkEdgingGuideLOL).hint("这本书会教你如何成为一个更好的人，应该能降低你的性欲和腐化。");
            addButton(2,"色情书",sharkgirlPronz).hint("顾名思义。给变态看的，当然。这绝对会让你欲火上身。");
         }
         addButton(14,"返回",FlagDict_Impl_.arrayReadInt(KFLAGS.flags,238) <= 0 ? execEncounter : izmaFollowerMenu);
      }
      
      public function sendToFarm() : void
      {
         clearOutput();
         izmaSprite();
         outputText("你告诉你的贝塔，她要前往湖边，找到一座农场，向在那里工作的女士报到，并照她说的做。伊兹玛听完后皱起眉头。");
         outputText("[pg][say:既然你这么说，阿尔法。能再次靠近湖边倒是不错，可是……我做错什么了吗？]");
         outputText("[pg][say:完全没有，]你回答道。[say:我只是需要一个能信任的人去那边帮忙。不过我会经常去看你的，别担心。]这似乎让这条虎鲨放下心来。她收拾好自己的箱子，向你挥了挥手，然后开始拖着它朝湖边的方向走去。");
         outputText("[pg]你心想，伊兹玛或许很强壮，但她完全不习惯体力劳动，也不习惯听命于你之外的任何人；你怀疑她帮不上惠特尼多少忙。另一方面，毫无疑问，你刚刚给农场派去了一位强大的守护者。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1082,1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function saveToObject() : Object
      {
         return saveContent;
      }
      
      public function reset() : void
      {
         saveContent.sharkgirlsDeflowered = 0;
         saveContent.tigersharksDeflowered = 0;
         saveContent.daysSinceAneFight = 0;
         saveContent.tonguedButt = false;
         saveContent.kidDick = false;
         saveContent.lezDemonstration = false;
         saveContent.sparred = false;
         saveContent.previousVictoryTeased = false;
         saveContent.lastNightmare = 0;
         saveContent.izmaMorning = false;
         saveContent.gaveBooks = false;
         saveContent.sharkManTalk = false;
      }
      
      public function removeIzmasPenis(param1:Boolean = false) : void
      {
         var forced:Boolean;
         var _g:IzmaScene;
         clearOutput();
         if(param1)
         {
            outputText("当你向前逼近时，伊兹玛后退了半步。你以一种早已多次证明过的、毫不费力的权威感侵入她的私人空间。你直视着你的贝塔，提醒她鲨族到底是怎么行事的。强者统治。强者发号施令。弱者必须服从强者，而伊兹玛……她就是弱者。她垂下眼睛，避开你威严的目光，结结巴巴地说：[say: 是……是的，我的阿尔法，]语气中带着恰如其分的受训意味。");
            outputText("[pg]在你的权威不容置疑之后，你再次提起移除她肉棒的问题，以及最好该怎么做。伊兹玛噘起嘴，但还是顺从地回答道：[say: 嗯，自从我们变异之后，大多数变身物品都会让我们病得很厉害。不知怎么的，这种变化似乎会抵抗几乎所有其他变化。我猜这和恶魔污秽有关。如果有什么东西能对像我这样的虎鲨人起作用，那大概就是恶魔类物品了。不过你可能得用上很多。玛瑞斯人不像你们这种异界人那样容易发生变化。]");
            outputText("[pg]你思索了一下，问她五瓶魅魔乳液是否足够去掉她的肉棒。伊兹玛扶了扶眼镜，叹了口气：[say: 嗯……大概够吧，但我不想要！有肉棒的生活有趣多了！]");
            outputText("[pg]你手掌平放，迅速做了个横向手势，打断了她的抱怨。你才是发号施令的人，她不是。");
         }
         else
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,440) == 0)
            {
               outputText("你问伊兹玛，是否愿意为了你——她的阿尔法——去掉她的肉棒。她一听便往后一缩，棱角分明的脸上露出傲慢的神情。[say: 啧，我为什么要丢掉我的骄傲和快乐？我的肉棒感觉那么舒服……我绝对不想失去它，]伊兹玛回答道，语气里带着一丝反抗。");
               outputText("[pg]她对这个想法并不高兴，但如果你愿意，你可以以阿尔法的身份压过她的抗拒。");
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,440,1);
               menu();
               addButton(0,"好的",izmaFollowerMenu);
               _g = this;
               forced = true;
               addButton(1,"强迫她",function():void
               {
                  _g.removeIzmasPenis(forced);
               });
               return;
            }
            outputText("你再次提起要去掉她阴茎的想法，伊兹玛只是叹了口气：[say:为什么？为什么你就不能……喜欢现在这样的我呢？我不想变成又一个普通的鲨鱼女孩！]");
            outputText("[pg]你迅速抓住她，把她拉进怀里，低声而坚定地说：[say:你是我的贝塔，你会变成我想要的样子。相信我，我会让一切都和以前一样好，甚至更好。]");
            outputText("[pg]伊兹玛轻轻哼了一声，说道：[say:随便吧……只是……要么就做，要么就别做。我不想再谈这个了。你到底有没有五瓶魅魔乳液？]");
         }
         if(get_player().itemCount(get_consumables().SUCMILK) + get_player().itemCount(get_consumables().P_S_MLK) < 5)
         {
            outputText("[pg]现在，如果你能找到足够的魅魔乳液，就能除掉那根麻烦的东西了。");
            doNext(izmaFollowerMenu);
         }
         else
         {
            outputText("[pg]你已经有足够的魅魔乳液了。<b>你想去掉伊兹玛的阴茎吗？</b>");
            menu();
            addButton(0,"去掉肉棒",izmaDickToggle);
            addButton(14,"返回",izmaFollowerMenu);
         }
      }
      
      public function readSharkgirlPornzYouFuckingPervertAsshole() : void
      {
         spriteSelect(SpriteDb.get_s_izma());
         var _loc1_:Player = get_player();
         _loc1_.set_gems(_loc1_.get_gems() - 20);
         statScreenRefresh();
         clearOutput();
         outputText("你夸张地掏出她要求的宝石并递给伊兹玛，她的脸一下子红得厉害，但还是尽责地把那本装订好的插画集交给你。趁她手忙脚乱地收起宝石时，你往旁边挪了[if (metric) {一小段距离|几英尺远}]，开始查看这些色情素材。[pg]");
         outputText("你舔了舔嘴唇，翻看着书页，欣赏着里面那些相当……细致的插图。一个蜂女和触手怪亲热，一个牛头人被一对地精口交……这画师的脑子可真够下流的。你一页页翻过去，注意到周围的空气似乎热了几分；你本以为是天气的缘故，直到你看完合上书……才发现伊兹玛不知什么时候已经站在你身后，越过你的肩膀“读”了好一阵。");
         dynStats(DynStat.Lib(2),DynStat.Lust(20 + get_player().lib / 10));
         if(get_player().cor < 33)
         {
            outputText("你吓了一跳。[say: 对、对不起，]她说道。你一时不知该说什么，只好把色情画册还给她，然后匆匆退走");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,238) != 1)
            {
               outputText("返回你的营地");
            }
            outputText("。");
         }
         else if(get_player().cor < 66)
         {
            outputText("你对她微微一笑，把书递了过去，眼神慵懒地打趣说，这书读起来倒也不差，不过真刀真枪可比书里写的有意思多了。她微微脸红，双膝并拢夹紧。谢过伊兹玛借书给你看后，");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,238) != 1)
            {
               outputText("你便返回营地。");
            }
            else
            {
               outputText("你转身回到营地中央。");
            }
         }
         else
         {
            outputText("你若无其事地瞥了伊兹玛一眼，说这书其实也比不上你自己的幻想和经历。说着，你把合上的书递过去，利落地塞进她胸前的乳沟里！你的手仍按在书上，冲她挑了挑眉；她浑身一颤，脸一下子红透了，转过身去，一把从你手里夺过那本书。[say:你……变态，]她也调侃回来。[say:那你怎么不自己写一本书呢？]你正要离开时，注意到她的草裙挪到了前面，紧绷地贴着臀部的轮廓。太诱人了！你抬起手掌，在上面啪地拍了一巴掌，然后在她的喊声中拔腿就跑。");
         }
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,230,FlagDict_Impl_.arrayReadInt(_loc2_,230) + 1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function readSharkEdgingGuideLOL() : void
      {
         spriteSelect(SpriteDb.get_s_izma());
         var _loc1_:Player = get_player();
         _loc1_.set_gems(_loc1_.get_gems() - 25);
         statScreenRefresh();
         clearOutput();
         outputText("你把伊兹玛要的宝石交给她，然后拿起一本。伊兹玛花了点时间清点宝石，而你则在她旁边坐了下来。[pg]");
         outputText("你翻阅着这本奇怪的书，试图让自己的举止更得体些，尽管书中描绘的那些刻板印象几乎让你有点冒犯。不过，面对下流的挑逗时，该如何保持贞洁与体面，这本书倒确实提出了一些不错的主意。[pg]");
         dynStats(DynStat.Lib(-2),DynStat.Cor(-2));
         outputText("读完这本花里胡哨的书后，你把它还给伊兹玛，她小心翼翼地把书放回箱子里。你向她道别，然后");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,238) != 1)
         {
            outputText("返回了你的营地。");
         }
         else
         {
            outputText("留下这位鲨鱼女孩继续与她的书作伴。");
         }
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,230,FlagDict_Impl_.arrayReadInt(_loc2_,230) + 1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function readSharkCuntManual2() : void
      {
         spriteSelect(SpriteDb.get_s_izma());
         clearOutput();
         outputText("你把伊兹玛要的宝石交给她，然后从那一大堆《战斗手册》的不同刊本中拿起一本。伊兹玛花了点时间清点并收好你给她的宝石，而你则走到附近一块岩石旁，快速翻阅起这本书。[pg]");
         var _loc1_:Player = get_player();
         _loc1_.set_gems(_loc1_.get_gems() - 20);
         statScreenRefresh();
         var _loc2_:Number = Utils.rand(3);
         if(_loc2_ == 0)
         {
            outputText("你学会了几种新的防御架势，看起来相当有前途。");
            dynStats(DynStat.Tou(2));
         }
         else if(_loc2_ == 1)
         {
            outputText("快速浏览之后，你读完了这本书。你没有学到新的战斗招式，但对战斗整体机制、节奏和策略的回顾还是帮上了忙。");
            dynStats(DynStat.Inte(2));
         }
         else
         {
            outputText("读完这本手册后，你对如何在出手时更好地利用自身重量、同时又不暴露破绽有了新的理解。非常实用。");
            dynStats(DynStat.Str(2));
         }
         outputText("[pg]从这本破旧小册子里学完能学的一切后，你把它还给伊兹玛，她高兴地把书放回自己的收藏里。你向她道别，然后");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,238) != 1)
         {
            outputText("返回了你的营地。");
         }
         else
         {
            outputText("留下这位鲨鱼女孩继续与她的书作伴。");
         }
         var _loc3_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc3_,230,FlagDict_Impl_.arrayReadInt(_loc3_,230) + 1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function readSharkCuntManual() : void
      {
         spriteSelect(SpriteDb.get_s_izma());
         clearOutput();
         outputText("你指向一摞书，最上面放着一张便条，写明这些都是战斗手册。你觉得在这片土地上，任何战斗技巧都弥足珍贵。[say:那些？]鲨鱼女问道。[say:还行吧，我觉得。大多是给新手看的，不过每本里面都有几个值得一学的小窍门。借一本20枚宝石。]");
         if(get_player().get_gems() < 20)
         {
            outputText("[pg]<b>你没有那么多。</b>");
            doNext(tradeWithFuckingSharkBitches);
         }
         else
         {
            doYesNo(readSharkCuntManual2,tradeWithFuckingSharkBitches);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2003) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2014) > 0 && !get_player().hasKeyItem("Izma\'s Book - Combat Manual"))
         {
            addButton(2,"购买",buyBookCombatManual);
         }
      }
      
      public function radarIzmaXpackDenyHer() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_izma());
         outputText("你认定她必须明白：你的欲望要先于她自己的得到满足，于是迅速抓住她的手腕，强硬地推过她头顶，将它们牢牢按在地上。伊兹玛可怜地呜咽着，她想要刺激自己肉棒的努力被她的阿尔法彻底剥夺；当你压在她躺倒的身体上时，她的肉棒饥渴地抵在你的腹部抽动。她用恳求的眼神，一句话也不说地求你让她照顾自己的分身；可她无声的求欢被你压上去的强硬一吻堵住，你仍将她的双臂按在地上，同时在她湿润的小穴里挺动。快感与焦躁交织，她在你口中发出一连串呻吟，最终顺从于你热烈的支配。");
         wheresItGoing(true);
      }
      
      public function radarIzmaXPackLetHer() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_izma());
         outputText("你伸手抚摸揉弄她的乳房，轻轻拉扯、摩擦她硬挺的乳头，偶尔还温柔地捏上一下。漂亮的虎鲨人对你的动作反应很好，因快感而呻吟、喘息。她咬住嘴唇——幸好是用她的人类牙齿——同时加快了套弄肉棒的速度。[pg]");
         outputText("见她动作越来越快，你也加快了自己的抽送，试图跟上她的节奏。她阴道里的触须扭动、收缩，带来一种你从未体验过的感觉——你觉得除了魅魔之外，恐怕没有任何生物能给你这样的快感！");
         wheresItGoing();
      }
      
      public function radarIzmaSpanking(param1:Boolean = true) : void
      {
         if(param1)
         {
            clearOutput();
            outputText("现在");
         }
         outputText("正承受着双重插入和强有力的顶撞，");
         radarIzmaGasm();
      }
      
      public function radarIzmaLeaveHerInTheDirtAfterAnalDom() : void
      {
         clearOutput();
         outputText("你笑着告诉伊兹玛，她得好好练练体力了，这会儿只能在草地里慢慢恢复。她虚弱地接受了你的决定，说对累坏的贝塔就该这么做。你停下脚步，强硬地告诉她，她表现得很好；只是还需要多练练耐力。她颤巍巍地点点头，微笑着睡了过去。为了确保她安全，你在附近守着，让她安稳地小睡。谢天谢地，半小时后她醒了过来，风情万种地从你身边走过，一边前往湖边清洗，一边感谢她的阿尔法干了她，还守在她身边。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function radarIzmaGasm() : void
      {
         outputText("伊兹玛彻底沉浸在这一刻，爪子抓挠着树桩，发出一连串充满激情的哀叫。你满意地哼了一声，重重拍在她丰润的屁股上，手掌与臀肉相撞的响亮啪声盖过了她满足又恍惚的叫声。很快，你感觉自己的高潮快来了，但在听见伊兹玛开口乞求你的种子之前，你还不想射出来。");
         outputText("[pg][say:来啊，婊子，求我射出来！]你大吼道。伊兹玛拼命想找出词句来表达她渴望被你的精液填满，可她只能发出呻吟和含混不清的胡言乱语。你猛地停下腰部的摆动，对伊兹玛发出不满的低吼和闷哼；她转过头来瞪着你，满脸惊恐与难以置信，似乎不敢相信你会在快要高潮时停下。[say:我说了，求我！]你用命令的口吻对这个听不清话的贝塔重复道。[say:我、我想要你！射在我里面，求你了！]这名惊恐的鲨鱼变形人立刻结结巴巴地说道。可惜，这并不是你真正想听的。[say:差不多了，]你轻声哄道，重新以较慢的速度摆动起来，试图引导她说出你真正想从她口中听到的话。[say:操我！用你的种、种子塞满我！蹂、蹂躏我的小穴！]伊兹玛提高了声音回答道。就差一点了，你一边想着，一边加快了抽插。[say:来啊！让所有人都知道你想让我给你播种！用你最大的声音！]你吼道。伊兹玛在你身下颤抖着，听见你咆哮出的命令后，她咬紧牙关，深深吸了一口紊乱的气。");
         outputText("[pg][say:射在我里面！给我播种，把我肚子搞大，我全都想要！]她终于放声嚎叫出来。[say:好女孩！继续！]你兴奋地大喊，给了她足够的鼓励，同时凶猛地操着她的小穴。[say:占有我，唔嗯——支配我——咿啊啊！射进我——啊啊——我的小穴里！]她几乎在不停的呻吟间勉强尖叫出来。她紧窄小穴里的触须以一种你从未想过的猛烈劲头，狂乱地抽打着你的肉棒，把你推过了无法回头的临界点；你感觉释放的浪潮正从腰间汹涌而来。你野性地大吼一声，向附近所有人宣告自己的高潮降临，");
         if(get_player().cumQ() <= 750)
         {
            outputText("将滚烫的精液射进伊兹玛被操开的肉穴里，用你的种子包裹住她小穴的内壁。");
         }
         else
         {
            outputText("将一股股热腾腾的精液喷涌进伊兹玛被狠狠操过的穴里。你的量实在太多，短短几秒内就让精液从她体内倒涌而出。");
         }
         if(gooJobbed)
         {
            gooJobbed = false;
            outputText("被爱人的种子注入体内的感觉，终于也给了伊兹玛的肉棒足够的刺激，让它猛然爆发，将一股股浓稠滚烫的精液射进你身体中央的团块里；你的黏液形态似乎很享受这份馈赠，本能地把她的精液揉进你透明的腹部。");
         }
         outputText("[pg]你筋疲力尽的伴侣一阵恍惚，双手抱住她那");
         if(get_player().cumQ() > 750)
         {
            outputText("鼓胀的");
         }
         outputText("肚子，双腿夹紧");
         if(get_player().cumQ() <= 750)
         {
            outputText("试图");
         }
         else
         {
            outputText("却终究只是徒劳地试图");
         }
         outputText("把你所有的种汁都留在她体内。最后叹息一声后，你从她体内抽离，掠过她的肩头，给了她一个缠绵的吻。伊兹玛虚弱地回应着，片刻后停下来，对你低声说道：[say:诸神啊……那真是……太不一样了。我没想到自己能……射得那么厉害。]你轻笑一声，告诉伊兹玛，只要你的贝塔满足她的阿尔法的欲望，她就永远会射得很爽；然后你让她去清理一下自己。她感激地呻吟着，嘟囔着也许可以去服侍她的");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,439) == 0)
         {
            outputText("肉棒");
         }
         else
         {
            outputText("自己");
         }
         outputText("去河边……但看她累成那样，你怀疑短时间内是不可能了。");
         get_player().orgasm("Dick");
         dynStats(DynStat.Sens(-1));
         izmaPreg();
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function radarIzmaAnalDominant() : void
      {
         clearOutput();
         outputText("你脸上挂着坏笑，命令伊兹玛陪你到营地边缘附近的一段树干旁，避开任何陌生人窥探的目光。伊兹玛没有半点犹豫，顺从了她的阿尔法的命令，走路时宽大的臀部性感地摇摆着；她那根充血、滴着液体的鸡巴在裙摆间来回晃动，像蛇在草丛中穿行。至少她想对了方向；你确实会玩弄她的那根家伙，但大概不是她期待的方式。");
         outputText("[pg]终于来到那棵大树的树干旁，你命令伊兹玛脱掉她那条少得可怜的小裙子，让她的家伙骄傲地垂在那里，给她的阿尔法看个清楚。你的虎鲨人贝塔邪邪一笑，一把把自己从那点微不足道的衣物里解放出来；她那根尺寸可观的鸡巴随之向上一弹，仿佛真的挣脱了某种看不见的枷锁。你按捺不住，傻笑着摸了摸下巴，欣赏着她的身体急切想要取悦爱人的模样。[say:我知道你喜欢你看到的东西，[name]，只要你开口，你的贝塔就会按你想要的任何方式干你，]她挑逗道，说到“任何方式”时还特意加重了语气，挑起眉毛。");
         if(get_player().hasVagina())
         {
            outputText("你的[clit]因");
         }
         else if(get_player().hasCock())
         {
            outputText("[EachCock]因");
         }
         else
         {
            outputText("你因");
         }
         outputText("她的话语激起了你的好奇心，让你迫不及待地想要将那根粗大、变态的肉棒吞入体内。你只需轻轻一扭，将双臂撑在树桩上，然后把你的[ass]向你的爱人撅起，扭动臀部的力度恰到好处，就像一只毫无防备的老鼠在伊兹玛的“巨蟒”面前轻轻摇摆。还没等你抬手招呼她过来，伊兹玛就如闪电般冲了过来，瞬间拉近了距离。她将沾满前列腺液的肉棒贴近你的[butt]，几乎无法抑制自己的欲望，在你耳边低语道，[say:那么……你想让我在哪里，阿尔法？今天轮到我做主了吗？]她问道。");
         outputText("[pg]你回头越过肩膀看着她，告诉她，她……不会占据主导；事实上，她甚至连碰都不能碰你。伊兹玛原本热切又充满期待的表情，因你的话变成了困惑；而你很快就用行动让她明白——你握住她修长的鸡巴，用你的 " + get_player().assholeDescript() + " 抚弄它，让她的龟头顺着你的 " + get_player().assholeDescript() + " 与[ass]的轮廓，从顶端到根部都被粗鲁地磨蹭。这样毫不客气地对待她的鸡巴，让伊兹玛浑身一颤，快感仿佛沿着她的肉棒电流般窜遍全身。你调侃伊兹玛，说从这个角度看她还挺可爱，语气里满是玩味却居高临下的掌控；这名虎鲨人能做的只有涨红了脸，发出呜咽，似乎既渴望更亲密的接触，又被感官刺激压得喘不过气。你近乎刻薄地无视了她需要先热身的需求，开始强行把她那根异常巨大的家伙塞进你的[asshole]，");
         if(get_player().analCapacity() < 35)
         {
            outputText("痛苦地把你紧致的肛门撑裂般撕开，让你们两人都因疼痛呻吟起来，而你也将她越来越多的鸡巴吞入体内。伊兹玛猛地顶进你体内，发出一声巨大的喘息，脸上满是狂喜，闭着眼仰望天空。");
         }
         else
         {
            outputText("滑过你肛门那肉质的“门扉”，几乎不需要拉伸或准备你的[asshole]。你开始担心，伊兹玛进入得如此轻易，事情也许不会按你想要的方式发展；但那根闯入的肉棒越钻越深，在你屁股里一阵狂乱而不规则的抽动，似乎打消了这个念头。");
         }
         get_player().buttChange(42,true,true,false);
         outputText("[pg]你故作冷静却仍有些发颤地吸了口气，告诉伊兹玛，你会用自己的屁股");
         if(get_player().isGoo())
         {
            outputText("和黏液");
         }
         outputText("来榨弄她的鸡巴；她不许碰你，不许抽身离开，还得像个乖女孩一样站好。你短暂停下，用肛门里的肌肉沿着她的肉棒收缩，继续“折磨”她，然后补充完指令：只要她能撑得足够久，就会得到奖励。伊兹玛甚至还没来得及吐出一个音节，你就用滚烫的内壁沿着这名虎鲨人硬得像石头的鸡巴研磨；这似乎差点把可怜的女人逼到崩溃边缘。你几乎带着恶意的笑容对伊兹玛说道，也许她这么早就要射的话，根本就不想要奖励，还不如接下来几天都只能靠自己的手解决。[say:不——呜呃呃呃，]饱受折磨的贝塔颤抖着回答，[say:不——呜啊啊噢噢。]看着她屈服的模样，你满足地咯咯笑起来，告诉她忍住，在你允许之前都把她的种子憋好，同时把一只手伸向你的");
         if(get_player().hasVagina())
         {
            outputText(get_player().clitDescript());
         }
         else if(get_player().hasCock())
         {
            outputText(get_player().cockDescript(0));
         }
         else
         {
            outputText("被侵犯过的肛门");
         }
         outputText("上自慰，同时继续这样做。");
         outputText("[pg]尽管伊兹玛差点被吓得射出来，她还是在你对她那根红色巨屌残酷而“痛苦”的刺激下硬撑着");
         if(get_player().isGoo())
         {
            outputText("；你用湿滑的身体掌控住她结实的臀部，开始强迫伊兹玛贴着你扭动，把这名鲨鱼变形人折磨得快要被快感逼疯");
         }
         outputText("。你套弄着自己的");
         if(get_player().hasVagina())
         {
            outputText(get_player().clitDescript());
         }
         else if(get_player().hasCock())
         {
            outputText(get_player().cockDescript(0));
         }
         else
         {
            outputText("肛门");
         }
         outputText("的动作愈发凶猛，你将自己的[ass]狠狠撞向她的腿间，她那四颗睾丸拍打在你的");
         if(get_player().hasVagina())
         {
            outputText("急切的双手上，而你正用手指猛干自己的[vagina]。");
         }
         else if(get_player().balls > 0)
         {
            outputText("那随着你每次扭胯而晃动的[balls]上。");
         }
         else
         {
            outputText("大腿上，每一次沉重的撞击都把它们狠狠“捶打”了一番。");
         }
         outputText("[pg]伊兹玛的呼吸变得极其紊乱，膝盖也开始在身下打颤。你饶有兴致地看着她试图用手撑住自己，把双手按在大腿上支撑体重……但那显然注定徒劳。[say:我……我……我不行了……啊啊！……要……嗯唔……要射了！]她尖叫起来，再也撑不住了，而你也同样逼近了高潮。你毫无保留地喊着，要伊兹玛把你紧紧压在她身上，用精液填满她的阿尔法……后半句话你几乎是勉强挤出来的，随即一声因极致满足而爆发出的狂野快意嚎叫便从你上方响起。她完全服从阿尔法的命令，将你紧紧抱在怀里，在你体内顶到最深处，剧烈地抽搐、呻吟，用她浓稠黏滑的精液彻底灌满了你的括约肌。");
         if(get_player().get_gender() > 0)
         {
            outputText("[pg]等她刚好把精液全灌进你体内，你便从她身上抽离，急忙命令她趴到地上，");
            if(get_player().hasVagina())
            {
               outputText("一心想把你的[clit]埋到她脸上，让她替你收尾。伊兹玛拼尽全力想取悦你，但她依旧沉浸在快感的余韵中，根本帮不上什么忙……不过，你还是靠着在她恍惚的脸上摩擦找到了刺激，最终高潮，并用自己的爱液淋湿了她的脸；与此同时，她虚弱地抚弄着自己的肉棒，将剩余的精液挤出来。");
            }
            else if(get_player().hasCock())
            {
               outputText("一边沿着你的[cock]疯狂套弄，为这场激情交合迎来爆炸般的收尾。伊兹玛仍沉浸在高潮满足的另一个世界里，完全没注意到即将糊到脸上的射精。她过了几瞬才反应过来，但当精液的气味钻入鼻腔时，她便爱怜地轻哼起来，终于意识到你已经把滚热的精液全射在了她脸上。");
            }
            outputText("你一屁股坐回自己的[ass]上，松了口气，既感谢自己的高潮终于到来，又有些惋惜它已经结束。尽管你还能站起来四处走动，伊兹玛可就不是这么回事了。");
            outputText("[pg]你可以把她抱回铺盖旁，替她安顿好……也可以干脆让她自己睡过去。");
            menu();
            addButton(0,"安顿入睡",radarIzmaAnalDomResultTuckIn);
            addButton(1,"留在原地",radarIzmaLeaveHerInTheDirtAfterAnalDom);
         }
         else
         {
            outputText("[pg]心满意足的你顺着先前靠着的树干右侧滑到地上，趴伏下去，而你的虎鲨人情人也轻轻落在你身上。你们谁都没有力气爬起来，但你可不会让哪个碰巧路过的人看见这一幕，就以为你才是这段关系里的母狗。趁她还留在你体内，你把自己和伊兹玛一起翻到侧躺，让她继续待在你里面，而你则渐渐睡去。她的双臂抚过你的身体，带着感激将你拥住，而你也任由自己沉入睡眠。");
            outputText("[pg]半小时后，你醒了过来；伊兹玛仍以恋人般的拥抱抱着你，安静地酣睡着。你轻轻从她怀里抽身，重新穿上你的[armor]。当你把最后一件装备穿戴好时，伊兹玛也醒来站起身，在她的阿尔法颈侧印下一个温柔的吻，为你送行。不过在你离开前，伊兹玛轻声问道：[say:所以……我的礼物呢？]她坏笑着看你转身回应。你重重拍了一下她的屁股，告诉她，能和她的阿尔法做到最后就是礼物。她有些不好意思地笑着目送你离开，而你则去处理其他事情。");
            doNext(get_camp().returnToCampUseOneHour);
         }
         get_player().orgasm("Generic");
         dynStats(DynStat.Sens(2));
      }
      
      public function radarIzmaAnalDomResultTuckIn() : void
      {
         clearOutput();
         if(get_player().get_str() < 70)
         {
            outputText("尽管你本意不错，但你没法把伊兹玛从地上抱起来太久，很快就不得不把她放回去。伊兹玛低声说你还是让她休息吧；这让你立刻叫她别顶嘴。你时而在草地里拖着她，时而遇到石头就把她“抱”过去，");
            if(get_player().get_fatigue() < 70)
            {
               outputText("你终于把她带回了她的铺盖旁。你把她放到寝具上，让她睡一觉从你们激情的折腾中缓过来，她有些腼腆地笑了笑。她倒是舒服了，但你可累得够呛。");
               dynStats(DynStat.Cor(-2));
               get_player().changeFatigue(30);
            }
            else
            {
               outputText("你试着把她带回她的睡铺，可你实在太累了。伊兹玛让你别担心她，自己去休息就好；她躺在草地里也没事。你昏昏沉沉地点头答应，把她放下，同时告诉她，要是你还想要，她最好准备好再来一轮；她哼哼着表示赞同，随后便沉沉睡去。");
            }
         }
         else
         {
            outputText("你使出一股蛮力，从腿弯和后背托住伊兹玛，将她抱离地面，朝她的睡铺走去。没过多久，你就到了她的铺盖旁，轻轻把她放下。转身时，你提醒伊兹玛最好好好休息；你大概很快又会有一处需要她来挠的“痒处”。你刚迈步离开，她沙哑的声音便从身后传来：[say: 说好了？] 你微微转头，用左眼瞥向她，对这名鲨鱼变形人露出狡黠的笑容，然后继续离去。");
            dynStats(DynStat.Cor(-2));
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function pcPopsOutASharkTot() : void
      {
         var _loc1_:* = null as IMap;
         var _loc2_:Number = NaN;
         outputText("[pg]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,238) != 1)
         {
            if(int(get_player().vaginas.length) == 0)
            {
               outputText("你感到胯间传来可怕的压力……紧接着是伴随血肉撕裂的剧痛。你低头一看，发现那里出现了一个阴道。");
               get_player().createVagina();
            }
            outputText("你突然瘫倒在地；强烈的疼痛和压力仿佛要碾碎你腹中的神经。你猛地瞪大眼睛，低头看见自己的肚子鼓胀得离谱。你能感觉到皮肤下有东西在动，也能看见肚皮上的鼓包和起伏，映出另一个生命正在你体内独自活动。你本能地张开双腿，感觉那生物向外顶来，撑开你的子宫颈，让一大股水涌了出来——水量远比你以为自己体内能容纳的还要多。[pg]");
            outputText("第一阵撕扯般的产痛真正袭来时，你忍不住叫出声，本能地盼着有人能来帮你。可令你绝望的是，根本没人出现，只剩你独自把孩子生下来。你加倍集中精神，配合着她自己疯狂想要逃出来的动作往外推。一次又一次地用力挤压，你试图在疼痛夺走你的意识前把孩子逼出来；幸运的是，她似乎也很配合，又推了几次后便双腿先行地从你体内滑了出来。鲨鱼般粗糙的皮肤刮擦着你红肿的小穴，她断断续续挤过你的阴唇时，你不由得发出一阵阵惊愕的抽气声。");
            get_player().cuntChange(100,true,true,false);
            outputText("[pg]");
            outputText("终于，她出来了；你虚弱地颤抖着，看着她爬到你身边。你费尽全力掀起你的[armor]，把你的[nipples]露给她。她贪婪地吮吸着，笼罩你视野的迷雾也开始散去。你第一次真正看清了你新生女儿的清晰特征；她是个");
            if(Utils.rand(100) <= 59)
            {
               outputText("鲨鱼女孩");
               _loc1_ = KFLAGS.flags;
               FlagDict_Impl_.arrayWriteInt(_loc1_,412,FlagDict_Impl_.arrayReadInt(_loc1_,412) + 1);
            }
            else
            {
               outputText("虎鲨人");
            }
            outputText("，随着她喝下乳汁，她迅速成长，身体也变得丰盈起来。等她吃完时，看上去已经很像个青春期前的孩子了。她紧张地环顾四周，羊水正飞快蒸发，而随着越来越多的皮肤直接暴露在干燥空气中，她也心不在焉地挠着自己的鳃。[pg]");
            outputText("当她用惊恐的眼神望向你时，一丝理解如闪电般穿透了疼痛的迷雾。你环顾四周，确认自己在营地里的方位，然后用一条无力的手臂指向溪流的方向。她的脸上顿时亮起了理解与感激的神情，随后她俯下身，把头贴在你的心口上，最后一次聆听你的心跳。你放下手臂，将它搭在她身上，想让这片刻的爱与温情尽可能延续得久一些，赶在她被丢进鲨鱼女孩社会那片炼狱之前。你们就这样相拥了将近五分钟，直到她轻轻咳了一声。她小心翼翼地抬起你的手臂，亲了亲你的脸颊，便朝那条维系生命的水道奔去。[pg]");
            outputText("你默默为自己的孩子许下一个愿望，然后陷入了浅眠。[pg]");
         }
         else
         {
            spriteSelect(SpriteDb.get_s_izma());
            outputText("你猛然醒来，腹中传来强烈的疼痛与压迫感。你双眼骤然睁大，低头看见自己的肚子胀得荒唐，鼓得不成样子。");
            if(int(get_player().vaginas.length) == 0)
            {
               outputText("你感到胯间传来可怕的压力……紧接着是伴随血肉撕裂的剧痛。你低头一看，发现那里出现了一个阴道。");
               get_player().createVagina();
            }
            outputText("你能感觉到皮肤下有什么在动，并看着腹部隆起、位移，仿佛另一个生命正在你体内独立活动。你本能地张开双腿，感觉那东西向外顶出，撑开你的宫颈，让一大股水喷涌而出——远比你以为自己体内容纳的水还要多。[pg]");
            outputText("第一阵撕扯般的产痛真正袭来时，你忍不住叫出声，本能地盼着有人能来帮你。令你松了口气的是，伊兹玛从昏暗中朝你跑了过来。[say: [name]！你要生了？]她问道；这问题多少有点蠢，但她显然也和你一样措手不及。[pg]");
            outputText("[say: 你觉得自己还能走吗？能到溪边去吗？]她问道。[pg]");
            outputText("你狠狠瞪了她一眼，并且相当明确地表示，以这些宫缩的强度来看，你觉得自己连站都站不起来，更别说一路走过去了。[pg]");
            outputText("[say: 好吧，抱歉。]至少，她还算识趣地露出了惭愧的神情。[pg]");
            outputText("她毫不犹豫地上前，在你面前跪下，一只手伸过去抚摸你那肿胀如球的肚子，另一只手则沿着你的" + get_player().vaginaDescript(0) + "边缘游走，那动作既带着挑逗，又显得专业。[say: 别担心，[name]；我会帮你撑过去的。]这名虎鲨人向你保证道。[pg]");
            outputText("你指出这本来就是她最起码该做的，毕竟一开始就是她把这东西弄进你体内的。随后，你又把全部注意力转回到把你的后代带到这个世界上的任务上。[pg]");
            outputText("时间悄然流逝；子宫收缩带来的痛楚，以及伊兹玛照料你的[vagina]时带来的快感，让你应接不暇");
            if(get_player().hasCock())
            {
               outputText("和[cocks]");
            }
            outputText("，这让产痛不再那么痛苦，反而变得更像一阵阵高潮。你迷失在这片朦胧之中，甚至在分娩终于结束时都几乎没有意识到；你只感觉到体内涌起一股巨大的压力，一种无法抗拒的用力冲动，接着，当你回过神来，随着你的肚子瘪下去，解脱感也席卷了全身。");
            get_player().cuntChange(100,true,true,false);
            outputText("[pg]");
            outputText("[say: 我们接住她了，[name]！哇——别动，你这个滑溜溜的小姑娘！别扭来扭去啦，你已经出来了，是我呀，你爸爸！]伊兹玛喊道。当你恢复力气、视线也逐渐清晰时，映入眼帘的是伊兹玛正拼命想抱稳一个扭个不停的鲨鱼变形婴儿；从她的");
            _loc2_ = 0;
            if(Utils.rand(100) <= 59)
            {
               outputText("灰色");
               _loc2_ = 0;
               _loc1_ = KFLAGS.flags;
               FlagDict_Impl_.arrayWriteInt(_loc1_,251,FlagDict_Impl_.arrayReadInt(_loc1_,251) + 1);
            }
            else
            {
               outputText("带黑色条纹的红色");
               _loc2_ = 1;
               _loc1_ = KFLAGS.flags;
               FlagDict_Impl_.arrayWriteInt(_loc1_,252,FlagDict_Impl_.arrayReadInt(_loc1_,252) + 1);
            }
            outputText("皮肤来看，很明显她是个小小的");
            if(_loc2_ == 0)
            {
               outputText("鲨鱼女孩");
            }
            else
            {
               outputText("虎鲨人");
            }
            outputText("。最后，她终于在“爸爸”的怀里安静下来，以一个新生儿来说，她环顾四周的反应敏捷得惊人。她看见你，便伸出双臂，发出奇怪的咿呀声；就你所见，她嘴里一颗牙也没有。伊兹玛走到你身边，骄傲地微笑着，让你抱住你的新生女儿；她在你怀里蹭了蹭，随即立刻把注意力转向你涨满乳汁的乳房。[pg]");
            outputText("她含住[nipple]，拼命吮吸起来，性爱般的快感与母性的满足一波波涌上来，让你沉浸在幸福之中。你对周遭的一切浑然不觉，只是把她搂在胸前，任她满足那惊人的胃口。她把你这一只乳房吸得一滴不剩，随后又立刻含住下一只。");
            if(int(get_player().breastRows.length) > 1)
            {
               outputText("接着她开始吸你的第三只乳房，到了第四只时速度慢了下来，但还是把它吸干了。");
            }
            if(int(get_player().breastRows.length) > 2)
            {
               outputText("她似乎几乎是在勉强喝完你的第三对乳房，但最终还是把你的六只乳房全都吸干了。");
            }
            outputText("等她喝完，她伴着湿润的啵声松开嘴，接着喘了几口气，然后打了一个对这么个小家伙来说出奇响亮又低沉的嗝。[pg]");
            outputText("……好吧，也许她没那么小了。此前，她还只有人类婴儿大小。现在，你怀里抱着的已经是一个已经长大不少的年幼");
            if(_loc2_ == 0)
            {
               outputText("鲨鱼女孩");
            }
            else
            {
               outputText("虎鲨人");
            }
            outputText("；从身体上看，你不得不说她大概已有十到十三岁。她冲你咧嘴一笑，露出上下两排牙齿，然后吻上你的嘴唇。[say: 妈妈，]她清楚而满足地说道，随后明显放松下来，窝在你怀里蹭了蹭，闭上眼睛，显然打算就这样睡过去。[pg]");
            outputText("你抬头看向身为她父亲的那位虎鲨人，希望得到支持，但她只是笑了笑，也在你身旁坐倒下来。你轻轻叹了口气，干脆躺回去，享受这个奇妙的新家庭陪在你身边。等你早上醒来，伊兹玛会把你们的女儿带去溪边和她同住；年幼的鲨族必须一直保持湿润，这很重要。[pg]");
            get_player().orgasm("Vaginal");
            dynStats(DynStat.Lib(1),DynStat.Sens(1));
         }
         get_player().boostLactation(0.01);
      }
      
      public function onAscend(param1:Boolean) : void
      {
         reset();
      }
      
      public function nonFightIzmaSmexPAINUS() : void
      {
         spriteSelect(SpriteDb.get_s_izma());
         clearOutput();
         outputText("听到自己的提议被接受，伊兹玛露出灿烂的笑容，脱下身上那点少得可怜的衣物。黑色比基尼的上半部分最先被解开；她那对DD罩杯的乳房随着动作晃动起来，摆脱束缚衣物后，她愉快地叹了口气。接着她开始解开那条做工精巧的草裙，并尽可能轻柔地把它放到自己的橡木箱上，以免弄坏。她那根怪物般的鸡巴沉甸甸地垂在双膝之间，因即将获得甜美释放的期待而缓缓硬起。综合来看，她确实是个相当出色的个体，而你也发现自己正盯着她结实匀称的身体上每一道曲线出神。[pg]");
         outputText("你也以同样的方式回应，脱下自己的衣物，而她抿起嘴唇，目光在你身上来回游移。");
         if(get_player().cockTotal() == 1 && get_player().cocks[0].get_cockType().get_Index() < 9)
         {
            if(get_player().cocks[0].get_cockType() == CockTypesEnum.HUMAN)
            {
               outputText("伊兹玛看到你的性器和她的差不多，似乎有些惊讶。[say: 咦。我还以为每个陆地居民到了这附近，通常都会稀里糊涂地撞上一次长出鸡巴的变异呢。]");
            }
            else if(get_player().cocks[0].get_cockType() == CockTypesEnum.HORSE)
            {
               outputText("看到你的[cock]，伊兹玛慢慢舔了舔嘴唇。[say: 嗯……马化药剂还挺受欢迎的，不是吗？]");
            }
            else if(get_player().hasKnot(0))
            {
               outputText("伊兹玛专注地盯着你的[cock]，像是在拿不定主意。[say: 嗯，看起来还挺可爱的。只是小心点那个肉结，好吗？]");
            }
            else if(get_player().cocks[0].get_cockType() == CockTypesEnum.TENTACLE)
            {
               outputText("伊兹玛盯着你的[cock]，脸上掠过一丝困惑。[say: 哇……我读过很多关于腐化植物的资料。没想到人也会变成那样。]");
            }
            else if(get_player().cocks[0].get_cockType() == CockTypesEnum.DEMON)
            {
               outputText("伊兹玛看到你那根异常的肉棒时显得很震惊，显然她以前从没见过类似的东西。[say: 呃……那看起来……怪别扭的。就像两腿之间夹着一根警棍一样。]");
            }
            else if(get_player().cocks[0].get_cockType() == CockTypesEnum.CAT)
            {
               outputText("她瞥了一眼你那根带倒刺的肉棒，皱了皱脸。[say: 你吃了这附近的果子，对吧？我有个朋友也吃过。]");
            }
            else if(get_player().cocks[0].get_cockType() == CockTypesEnum.LIZARD)
            {
               outputText("她一看到你那根紫色球茎状的肉棒，眼睛都瞪圆了。[say: 哇哦。你还有绿色的吗？]");
            }
            else if(get_player().cocks[0].get_cockType() == CockTypesEnum.ANEMONE)
            {
               outputText("她看着你亮出一根[cock]，脸上露出嫌恶的表情。[say: 天啊，别又是这种。你射完之后反倒会比开始摸它之前还要饥渴。]");
            }
            else if(get_player().cocks[0].get_cockType() == CockTypesEnum.KANGAROO)
            {
               outputText("她面无表情地看着你露出肉鞘，随后在你套弄几下后，你的[cock]从中滑了出来，把她吓了一跳。[say: 哇……它好……又细又尖。]");
            }
         }
         else
         {
            outputText("她一看到[eachcock]，眼睛都瞪得凸了出来。[say: 哇，天哪，快看那根……噢老天，还有那根……靠。]");
         }
         outputText("[pg]");
         if(get_player().mf("m","f") == "m" && get_player().biggestTitSize() >= 2)
         {
            outputText("你长着乳房这件事似乎也让伊兹玛相当困惑，她歪了歪头。[say: 你是个男人……却长着奶子。你真觉得它们有必要吗，还是只是想有点东西拿来玩？]");
            if(get_player().biggestLactation() >= 2)
            {
               outputText("看到你的乳头渗出些许乳汁，伊兹玛不由得稍稍后退了一步。[say: 你还在泌乳？！天啊，你身上奇怪的地方也太多了……]不过，看着她胯间那根怒挺的勃起物，你怀疑伊兹玛并不像她表现得那么没兴致。");
            }
            outputText("[pg]");
         }
         outputText("等你们互相打量完彼此后，你问伊兹玛她到底想怎么做。伊兹玛若有所思地挠了挠后颈，然后提出了一个主意。[say: 要不你仰面躺下，我给你口交，你也给我口交？]这个提议让你有点不自在，伊兹玛于是抱起双臂。[say: 公平就是公平。你光盯着看我可射不出来，而且我们当然也没法同时肛交对方。][pg]");
         if(get_player().cocks[0].get_cockType() == CockTypesEnum.TENTACLE)
         {
            outputText("[say: 呃，其实……]你一边开口，一边弯动自己的肉棒触手。她一个瞪眼就打断了你。");
         }
         else
         {
            outputText("你还想继续抗议，但她一瞪你，你就停了下来。");
         }
         outputText("不过你已经欲火焚身，没法临阵退缩了。你烦躁地叹了口气，仰面倒在沙地上，示意伊兹玛过来。伊兹玛点点头，露出微笑，朝你走来时还左右摆动着臀部，像是在进一步挑逗你。随后她把头凑到你的胯间，同时用自己的胯部蹭上你的脸。[say: 好了，开始吧，]伊兹玛直截了当地说道，随即毫不拖延地吞含住你的" + Appearance.cockNoun(get_player().cocks[0].get_cockType()) + "，用舌头缠住它，熟练得像个行家一样吮弄起来。她高超的技巧让你轻轻倒吸一口气，你也觉得，要是这场交易能换来这种快感，之前那些抗议根本毫无意义。[pg]");
         outputText("你用嘴唇含住伊兹玛那根巨大的勃起物，吮吸着她那根[if (metric) {三分之一米长的|超过一英尺长的}]肉棒，时不时被顶得作呕，而她的腰胯则不住地抽动扭摆。她含混的呻吟似乎在告诉你，你做得很不错；作为回应，伊兹玛也加快了脑袋上下套弄的速度。她那四颗睾丸反复撞在你的额头和鼻梁上，多少遮挡了你的视线，但这反而更让你兴奋。[pg]");
         outputText("为了让你的虎鲨人伴侣更加愉悦，你偶尔会伸手抚弄她胀大的阴囊，并用手指插弄她紧致湿润的小穴。你带给她的快感让伊兹玛猛地喘息，浑身发颤。仿佛是在奖励你的努力，伊兹玛吮吸得更快了，用唾液浸透你[cock]的每一[if (metric) {厘米|英寸}]；而你也如此渴望她那神奇的舌头，开始向上挺动腰胯，想尽可能深入她的口中。[pg]");
         outputText("最终，你们两人同时迎来了一场强烈的高潮。伊兹玛滚烫的精液射进你渴求的喉咙，而你自己也一股股地射在伊兹玛的脸颊上");
         if(get_player().cockTotal() > 1)
         {
            outputText("和头发上");
         }
         outputText("。");
         if(get_player().cumQ() >= 500)
         {
            outputText("即便她的嘴里早已被灌满并抽身退开，你仍然一波接一波地继续喷射。[say: 看在玛莱的份上，[name]，我可吞不下那么多！]");
         }
         outputText("你们两个从彼此身边滚开。你一边喘着气，一边惊讶于伊兹玛精液那浓烈的味道。你觉得，要是再让那美妙的精液灌进你的肚子里，你大概也不会介意……[pg]");
         outputText("[say: 谢谢你刚才那样……]伊兹玛低声说道，摇摇晃晃地站起身，取回自己的衣物。[say: 想再来一次的话，随时可以回来……或者如果你愿意，我们也可以玩点更激烈的。]她脸上露出一个腼腆的微笑。因为她的肤色，这有点难看出来，但你几乎能看见她在脸红。你对伊兹玛笑了笑，点点头，然后收拾起自己的装备，动身返回营地；你的舌头还不时在口腔里探来探去，寻找着伊兹玛精液的任何残留。[pg]");
         get_player().slimeFeed();
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,230,FlagDict_Impl_.arrayReadInt(_loc1_,230) + 1);
         get_player().orgasm("Dick");
         get_inventory().takeItem(get_consumables().TSTOOTH,get_camp().returnToCampUseOneHour);
      }
      
      public function nonFightIzmaSmexCUNTPUSSYSNATCHQUIM() : void
      {
         spriteSelect(SpriteDb.get_s_izma());
         clearOutput();
         outputText("伊兹玛咧嘴一笑，双手伸到背后，解开黑色比基尼上衣的系带。她把那件衣物甩到岩石上，露出自己丰满多汁的乳房。像是存心要挑逗你似的，她转过身，抓住裙摆，慢慢往下拉，让你好好欣赏她紧实的屁股。随后她又缓缓转回面对你，那根巨大的[if (metric) {38厘米|15英寸}]肉棒和卵蛋也随之晃动。你甚至没意识到自己从头到尾都在下意识地抚摸自己，这让伊兹玛发出一声很不像她的咯咯轻笑。[pg]");
         outputText("[say: 现在轮到你了。公平才公平，]她半眯着充满诱惑的眼睛看着你说道。[pg]");
         outputText("你点点头，脱下你的[armor]，动作可没有伊兹玛本人那么会卖弄。你让自己的" + get_player().allBreastsDescript() + "暴露在空气中；你的[nipples]在微风中变硬。你下半身的衣物也被脱下，露出你的" + get_player().vaginaDescript(0));
         if(get_player().hasCock())
         {
            outputText("和[cocks]");
         }
         outputText("给那只开心的虎鲨人看。[say: 不错嘛，不介意我这么说的话，]伊兹玛评价道，一边朝你走来，把一只手放在你的肩上。[say: 好了，所以我们接下来要这么做……]她开口说道，火热勃起的肉棒已经兴奋地顶上你的胯间。[say: 我们不会按通常那种方式交合，只是用嘴帮彼此爽出来，]她解释着，还特意让你看清她的尖牙已经收了回去，好让你安心。[pg]");
         outputText("你点头表示同意，看着伊兹玛躺到沙地上，然后把自己的胯部移到她脸上方，同时将嘴凑到她挺硬的肉棒上。伊兹玛毫不耽搁，抬起脸埋进你的小穴里，舌头探入你的深处。突如其来的侵入让你大声喘息，但正如伊兹玛所说，“公平才公平”，于是你也张嘴含住了她的龟头。[pg]");
         outputText("你开始舔弄并吮吸顶端，每当你抬起头换气时，都会有一缕缕唾液把你的嘴和那根火热的肉棒连在一起。伊兹玛把舔舐的速度加快了一倍，双手紧紧抓住你的[ass]，惹得你倒抽一口气。看来伊兹玛想把刺激再往上推一点。[pg]");
         outputText("你决定顺着她的意思，开始把她的肉棒深深吞入喉咙，整整[if (metric) {三十八厘米|十五英寸}]都滑进你的喉管，将那里撑开，引得伊兹玛发出含混的呻吟。你也开始揉弄、按摩她那四颗厚实的卵蛋，几乎是在渴求她的精液。如果之前她咸涩前列腺液的味道能作为参考，那等伊兹玛真正射出来时，你可有得好好品尝了。伊兹玛也决定回应你的努力，用熟练的手指揉搓并掐弄你的阴蒂。看来伊兹玛对女性伴侣并不陌生，不过考虑到普通鲨鱼女孩的样子，这倒也不奇怪。[pg]");
         outputText("伊兹玛发出一声闷闷的愉悦呻吟，她的精液喷进你的喉咙；你抬起嘴时，那些白浆还灌满了你的脸颊。没过多久，你也在高潮中叫出声来，阴液溅到这只虎鲨人的脸上");
         if(get_player().hasCock())
         {
            outputText("，而[eachcock]也朝她胸口射出一股微弱的精液");
         }
         outputText("。你从她身上滚开，努力喘匀气息，同时咽下残留的精液。你不得不承认，那味道简直棒极了……究竟是什么让它这么好吃，还真说不清。难道是伊兹玛游泳的水里有什么东西？[pg]");
         get_player().slimeFeed();
         outputText("你没能思考太久，便和伊兹玛一起坐起身来。[say: 呼……你还真是不一般。我们改天还得再来一次，]伊兹玛舔了舔嘴唇，把答应好的报酬递给你。你笑了起来，对接受她这个提议更是兴奋不已。随后你站起身穿好衣服，心满意足地动身返回营地。[pg]");
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,230,FlagDict_Impl_.arrayReadInt(_loc1_,230) + 1);
         get_player().orgasm("Generic");
         get_inventory().takeItem(get_consumables().TSTOOTH,get_camp().returnToCampUseOneHour);
      }
      
      public function nonFightIzmaSmexASS() : void
      {
         spriteSelect(SpriteDb.get_s_izma());
         clearOutput();
         outputText("当你脱下衣服，在伊兹玛面前露出赤裸的身体时，她抿起嘴唇，若有所思。[say: 呃，这可有点麻烦……]她绕着你踱步，你挑了挑眉。[say: 这、呃……我们要怎么做？我是说……我可不会把嘴放到那里去，你趁早把那些念头从脑子里赶出去！]她愤愤地说道；你微微皱起眉，因为自己这奇怪的状况而有些沮丧。[pg]");
         outputText("伊兹玛叹了口气，把一只手放到你的肩上。[say: 抱歉……我刚才说得太冲了。听着，这……除非我们有一个人在上面，不然这事真做不成。要不……我也不知道……你去灌点梦魇药剂或者魅魔乳液再回来。或者来挑战我。]你点点头，重新穿好衣服，决定先行离开。[pg]");
         if(get_player().get_inte() >= 50)
         {
            outputText("你忽然意识到一件事，于是停了下来。[say: 如果是我在上面，你不也一样会很舒服吗？]你问道。[pg]");
            outputText("伊兹玛翻了个白眼。[say: 我以前也试过用我的洞来主导。只要骑得够狠，对方就爽不了多少。现在，滚吧。][pg]");
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function noWankingForIzmaRadarSaysSo() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_izma());
         outputText("你没有选择给她的肉棒手淫，而是继续在这名虎鲨人的小穴上扭动，把自己的龟头粗暴地撞向她阴道里的触须，像暴风中的树枝一样把它们撞得东倒西歪。伊兹玛感觉到你不会给她的肉棒它“应得”的关注，便伸下一只手握住自己的肉棒，急躁地套弄起来，努力在你的抽插间隙让自己得到快感。你挑起眉毛，思索着她是否该被允许不经许可就开始自慰……");
         menu();
         addButton(0,"阻止她",noWankingForIzma);
         addButton(1,"任她自慰",letIzmaWankLikeABitch);
      }
      
      public function noWankingForIzma() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_izma());
         outputText("你不满地哼了一声，拍开她握着肉棒的手，让你的伴侣在快感的呻吟间发出一声惊讶的抽气；她抬头恳求地望着你，想让你准许她把自己弄射。你平静地告诉伊兹玛，她没有请求许可，所以已经失去了那项“特权”。说着，你抓住她的双手，将它们牢牢按在地上，把她困在爱人的拥抱之中。伊兹玛因挫败和渴望被原谅而可怜地呻吟着，但你知道，她必须因为未经允许就自慰而受到“惩罚”。彻底支配与掌控的感觉涌遍全身，你也随之重新燃起精力，凶狠地抽插伊兹玛湿润的小穴，猛烈地拍打着她，简直像是在用你的[if (balls > 0) {[balls]|大腿}]抽打她；你的每一次顶入，都让她的呻吟随着冲击忽高忽低地回响。你自信地凑到伊兹玛耳边低语，说如果她够幸运，就算没人碰她，她也会射出那黏稠的精液。这个念头让她的肉棒像追逐猎物、在地上蹦跳的乌鸦一样弹动起来。很明显她已经近得不可思议，于是你给了她最后一点鼓励，告诉她要做她的阿尔法的好女孩，然后[b:射出来]。[pg]");
         izmaCumsAfterRadarStuffHere(true);
      }
      
      public function noCuddle() : void
      {
         clearOutput();
         outputText("你觉得一个人睡一张床也挺不错，所以暂时就不和伊兹玛一起睡了。虎鲨人对此并无怨言，还在你今晚上床休息时祝你做个好梦。");
         FlagDict_Impl_.arrayWriteString(KFLAGS.flags,701,"");
         doNext(izmaFollowerMenu);
      }
      
      public function nightmareFollowupTime() : Boolean
      {
         return saveContent.lastNightmare == get_time().days;
      }
      
      public function nightmareCheck() : Boolean
      {
         if(izmaFollower() && totalIzmaChildren() > 0 && get_time().days - saveContent.lastNightmare > 14 && FlagDict_Impl_.arrayReadString(KFLAGS.flags,701) == "")
         {
            return Utils.randomChance(5);
         }
         return false;
      }
      
      public function newMarbleMeetsIzma() : void
      {
         spriteSelect(SpriteDb.get_s_izma());
         clearOutput();
         outputText("你和玛布尔一路聊着回到营地，大多只是些打发时间的闲话。玛布尔倒也同样享受这段交谈，可当她看见伊兹玛坐在你的营地里时，便停下了脚步。[say: 啊……那是谁，亲爱的？]她问道。[pg]");
         outputText("伊兹玛温暖地一笑，伸出手来。[say: 嘿，亲爱的，你好啊，陌生人。我是伊兹玛，[name]的贝塔。很高兴认识你，]她开心地说道。看来她对你还有另一个情人并没有什么意见，不过你不确定玛布尔是不是也会有同样的感受。[say: 贝塔？]牛娘问道，尽管脸上仍带着轻蔑，语气里却透着好奇。[pg]");
         outputText("你叹了口气，解释自己是怎么遇见伊兹玛的，你们之前的谈话，以及后来的一次次切磋。在几次败在你手下之后，伊兹玛宣布你是她的阿尔法，并表示她愿意为你做任何事。你觉得让营地里多一名熟练的战士和学者是件好事，于是允许她搬了进来。[pg]");
         outputText("玛布尔点了点头，似乎勉强挤出一个笑容。[say: 给我们一点时间，]她对伊兹玛说道，然后牵起你的手，颇为强硬地把你拉到了营地的另一边。[pg]");
         outputText("[say: 亲爱的，你到底在搞什么？！]等你们离开伊兹玛的听力范围后，她压低声音怒道。[say: 你至少也该提前警告我一下吧，而不是把我带回家，结果营地里突然多了个陌生人！而且她还是那些……从湖里来的腐化怪物！]她说道。可以肯定的是，她看起来比你过去见过的任何时候都要愤怒。你叹了口气，试着解释，告诉她尽管伊兹玛外表如此，但她比任何从那个湖里出来的生物都要好得多。她一直友善、体贴，最重要的是，在涉及性爱时，她总会给你选择的余地。这可比你能从某个“腐化怪物”身上期待到的多得多。[pg]");
         outputText("玛布尔咬紧牙关，摇了摇头。[say: 我不喜欢这样，亲爱的。我不喜欢，而且我当然也不支持。管好她，让她离我远点，然后我们再看情况，]牛娘说完，便气冲冲地踏着蹄子走开了。[pg]");
         outputText("等你回到伊兹玛身边时，她好奇地看着你。[say: 所以，你和她又是什么故事？]她问。你叹了口气，告诉伊兹玛你是如何在惠特尼的农场遇见玛布尔，又是如何随着时间推移逐渐和她建立起关系的。接着你说起令人遗憾的事：你甚至还没意识到她的牛奶具有腐化性，就已经对它上了瘾。");
         if(get_player().hasPerk(PerkLib.MarblesMilk))
         {
            outputText("你无法戒掉这份瘾，而现在如果没有她稳定供应的牛奶，你就会死。");
         }
         else
         {
            outputText("不过谢天谢地，你最终摆脱了她牛奶的控制，并意识到尽管你们之间发生了这一切，你依然爱着玛布尔，于是让她搬来和你同住。");
         }
         outputText("[pg]");
         outputText("伊兹玛听你讲完后咬紧牙关，从齿缝间吸了口气。[say: 那头……该死的母牛……]她低吼着，那几乎压不住的怒火让你咽了口唾沫。[saystart]她夺走了你，我完美的阿尔法，还");
         if(get_player().hasPerk(PerkLib.MarblesMilk))
         {
            outputText("把你变成了一个软弱的瘾君子");
         }
         else
         {
            outputText("给你下药，把你拖进了一段扭曲的关系");
         }
         outputText("。[sayend]你紧张地干笑一声，向她保证事情并不是那样，但伊兹玛根本不想听。[say: 我现在会保持沉默，但要是那头母牛敢越界……]她没有继续说下去，尖牙却弹了出来。随后她走去把自己的铺盖和箱子安置在你的床边。看来她想离你的床近一些，好保护你。至少，这是你的理解。你叹了口气，摇了摇头。看来这两人恐怕永远也不会真正亲近起来。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,237,-1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function newAmilyMeetsIzma() : void
      {
         spriteSelect(SpriteDb.get_s_izma());
         clearOutput();
         outputText("回去的路上，你和艾米莉似乎一直聊个不停，都对即将一起生活这件事感到兴奋。然后，当她看见伊兹玛坐在自己的箱子上时，才意识到你并不是一个人，脸上露出困惑的神情。[say: [Name]……你的营地里有个鲨鱼娘！]她低声嘶道，看起来随时准备视情况战斗或逃跑。[pg]");
         outputText("伊兹玛一看见你，便露出满是尖牙的笑容走了过来，丝毫没有被艾米莉的存在所困扰。不过她确实歪了歪头，又扶正眼镜，好更仔细地打量艾米莉。[say: 欢迎回家，亲爱的，]她招呼道。接着她转向艾米莉，做起自我介绍。[say: 我是伊兹玛，[name]的贝塔。你是谁？哦！你是那些鼠族之一，对吧？]她问道。[pg]");
         outputText("艾米莉只是疑惑地看着她。[say: 是的，我是只老鼠。]她的语气里满是那种“这还不明显吗？”的意味。[say: 你刚才说你是[name]的贝塔，是怎么回事？贝塔是什么？]你紧张地干笑一声，尽力解释你和伊兹玛之间的过去：她是什么、你们之间的多次切磋，以及她如何在几次败给你之后彻底臣服于你，宣称你是她的阿尔法。[pg]");
         outputText("之后，你转向伊兹玛，向她解释你和艾米莉的过去，讲述她那被毁村庄的故事，讲述你是如何爱上她，又如何与她生下许多孩子，以此重新建立未受污染的鼠人人口。伊兹玛吸了一口气，听得入了迷。[say: 这太不可思议了；你们两个都高尚得惊人。][pg]");
         outputText("[say: 我——你真的这么想吗？]艾米莉问道，看起来既震惊又高兴，还因为这份称赞而害羞地脸红。随后她摇了摇头。[say: 啊，好吧……我想这也不算太出乎意料。至少她看起来脑子里确实有点东西，不像某些地精或是喝精液的妖精……不过，你至少也该告诉我你已经有另一个女人了吧？]她抱怨道。接着她露出若有所思的神情。[say: 嘿，说起来，如果你是鲨鱼娘——抱歉，虎鲨人——那你要怎么在这里活下去？你不是每天大概要有三分之二的时间待在水下才能活吗？][pg]");
         outputText("[say: 啊，没事，湖离这里也不算太远，]伊兹玛反驳道。[say: 而且这上面还有条小溪。只要我定期往身上弄点水，就没问题。再说，能用上更干净点的水也挺不错！好了，我还有些书要补着看，就不打扰你们了，]漂亮的虎鲨人说道。[pg]");
         outputText("艾米莉看着虎鲨人回到自己的铺盖旁，随后快得像闪电一样窜到你身边，在你耳边压低声音怒道：[say: 别以为我不生气，你居然事先都没想过跟我谈谈这事！我只是还没蠢到去挑衅那么危险的家伙——我亲眼见过鲨鱼女孩放倒来湖边喝水的牛头人，然后把他们吃掉！]她狠狠掐了你一下，以表达自己的不满。[pg]");
         outputText("你向她道歉，但告诉她你现在不会就这么把伊兹玛赶出去。她已经住下了，鼠人最好接受这一点——打起来对谁都没有好处。[pg]");
         outputText("[say: 我会对她客气的，这点你不用担心……但你真的确定我们能信任她吗？从那个湖里出来的东西或人，我都很难放心接受，]艾米莉问你，同时看着伊兹玛好奇地开始翻看你们共有的物品。[pg]");
         outputText("你轻声指出，你当初是在湖边的废弃村庄里遇见艾米莉的，又问她以前是用什么洗澡的。她瞪着你，但你没有退让，表示自己信任伊兹玛，并指出她和大多数被恶魔腐化的生物不同。她本可以一见面就袭击你、试图强奸你——可她从头到尾都很礼貌，愿意交谈，也懂得克制。就算话题谈到了性爱，她也是先和你商量，并明确告诉你选择权在你，拒绝也不会有什么后果。这个世界上还有多少其他存在不会先强奸再说，甚至根本不问呢？[pg]");
         outputText("[say: 这点你说得没错……]艾米莉嘟囔着，带着明显的好奇盯着伊兹玛。[say: 嗯……好吧，我还是得盯着她点，不过我想她已经赢得了被暂且信任的资格。营地里能有另一个能说话的人，也许也不错……]她的声音渐渐低下去，一边嘟囔一边去收拾东西了。[pg]");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,236,-1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function loseToIzma() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,231) <= -5)
         {
            finalIzmaSubmission();
            return;
         }
         if(get_player().get_gender() <= 2)
         {
            if(get_player().get_HP() < 1)
            {
               outputText("伊兹玛一只覆着金属的拳头重重砸在你的肚子上，把你打得摔倒在沙地上——你并没有受重伤，但已经虚弱得无法继续战斗，而伊兹玛也知道这一点。[pg]");
               outputText("她冲你咧嘴一笑；考虑到她还露着鲨鱼般的利齿，那表情显得相当凶狠，但她的语气倒还算温和。[say:哈！看来这一回是我赢了，小家伙！那么，我想你还欠我点东西，而我打算现在就拿走……][pg]");
            }
            else
            {
               outputText("你的双腿一软，脑子也因欲火而变得昏沉；你已经兴奋得无法继续战斗，像散了架一样瘫倒成一团，浑身发颤。[pg]");
               outputText("伊兹玛摇了摇头，苦笑着咧嘴道。[say:看来某人在尝试性爱较量之前，还得先多练练自制力。][pg]");
            }
            outputText("[say: 好了，该你履行约定了，]她说道。你昏沉的脑子没听出这话里的双关。她的语气像是在闲聊，笑容却坏得很；她正尽可能迅速地脱下草裙，只是为了不弄坏它，动作不得不小心些。毕竟，要做出一条能轻易藏住她那根硬如钢铁、长达[if (metric) {三十八厘米|一又四分之一英尺}]的勃起肉棒的裙子，可是相当需要手艺的，尤其还得同时藏住两对棒球大小的卵蛋——它们因精液而肿胀沉重到你倒在地上都觉得能听见里面轻轻晃荡的声音。[saystart]我们说好了要用鲨鱼的方式来做；你输了，所以现在我说了算。脱掉衣服，把你那可爱的小");
            if(get_player().hasVagina())
            {
               outputText("小穴");
            }
            else
            {
               outputText("屁眼");
            }
            outputText("露给我看看！[sayend]");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,231) >= -2)
            {
               outputText("你有些不情愿，但还是被承诺驱使着，一件件脱下你的[armor]，直到赤裸地站在饥渴打量着你的虎鲨人面前。");
            }
            else
            {
               outputText("伊兹玛话还没说完，你就已经脱光了。虎鲨人显然有些惊讶，说实话，你自己心里也有一部分感到惊讶……但这种感觉很快就被把自己交给伊兹玛欲望的冲动淹没了。");
            }
            outputText("[pg]");
            outputText("你那“可爱的小");
            if(get_player().hasVagina())
            {
               outputText("小穴");
            }
            else
            {
               outputText("屁眼");
            }
            outputText("”因");
            if(get_player().get_HP() < 1)
            {
               outputText("恐惧");
            }
            else
            {
               outputText("期待");
            }
            outputText("一想到那么巨大的东西要硬挤进那里……但你确实答应过，而且你");
            if(get_player().get_HP() < 1)
            {
               outputText("虚弱得无力反抗");
            }
            else
            {
               outputText("欲火焚身");
            }
            outputText("，所以你照做了。你脱下身上最后几件[armor]，趴到地上，让你的[ass]朝向伊兹玛。你能听见她踩着沙地向你走来，但当她那双已经卸下金属护手的手落在你的" + get_player().assDescript() + "上时，还是让你的脊背一阵发麻。[pg]");
            outputText("[say:哦，从这个角度看还真不错。我会很享受这样占有你的……毕竟，如果你想在上面，那就得靠本事争来。][pg]");
            outputText("你忽然感觉到一股滚烫的液体淌在臀缝间，惊得你尖叫一声——那感觉简直像有人把滚烫的岩浆倒在了你的屁股上。可当你回头看去时，有限的视野证实了那种感觉：一个又大又圆钝、前端略窄的东西正抵在你的屁眼上；那里别无他物，只有伊兹玛那根巨大的、滴着前液的阴茎。[pg]");
         }
         if(get_player().get_gender() <= 1)
         {
            if(get_player().analCapacity() < 26)
            {
               outputText("你忍不住因那突如其来的感觉而痛叫出声——某个巨大得离谱的东西正硬生生挤进你的[asshole]。");
               outputText("[pg][say:我靠——！看来我最好悠着点……]你听见伊兹玛喊道。[say:主要还是为了我自己的安全！]她的动作变得温和了些。她依旧强行进入你的身体，[if (metric) {一点一点地|一英寸一英寸地}]深入，只是节奏更慢、更稳定，让你的屁眼有时间适应她带来的猛烈扩张，同时把她滚烫的前液当作润滑液。");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,231) <= -4)
               {
                  outputText("你发现自己反而向后迎去，想让这个过程更快些，迫不及待地想让伊兹玛再次填满你。");
               }
               get_player().buttChange(get_monster().cockArea(0),true,true,false);
            }
            else if(get_player().analCapacity() < 60)
            {
               outputText("她的肉棒稳稳没入你的肛门时，你能感觉到每一[if (metric) {厘米|英寸}]，它像涨潮般不可阻挡地在你的肠道里鼓胀开来。[pg]");
               outputText("[say:啊……这小洞可真不错！你是故意输的吗？]她问道，你能听出她声音里的笑意。");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,231) <= -4)
               {
                  outputText("你发现自己也在想着这个问题……");
               }
               get_player().buttChange(get_monster().cockArea(0),true,true,false);
            }
            else
            {
               outputText("伊兹玛的肉棒或许相当惊人，但你过去也承受过更大的，而这点显而易见；伊兹玛第一次试探性的抽插就整根没入你的肠道，你在再次被填满的快感中呻吟起来，同时她的四颗睾丸拍打着你的[ass]。[pg]");
               outputText("[say: 搞什么！？你到底都遇上过些什么怪物？]她忍不住出声嘀咕道。");
            }
            outputText("[pg]完全埋入之后，她紧紧抓住你的" + get_player().assDescript() + "，先抽出一截，然后又狠狠顶了回去。[say:还以为自己很聪明，是吧？想试试像鲨族那样做，是吗？好啊，在鲨族里，只有两种人——强者和弱者。而这就是弱者的下场，]她凶狠地低吼道。[pg]");
            outputText("她越顶越狠、越顶越快，节奏不断加速，随着她前后冲撞，睾丸清脆地拍打着你的[ass]。你能感觉到她巨大的雄性器官在你深处，摩擦着你的前列腺，撑开你的内壁，她滚烫的勃起抵着你灼热的身体。你因快感而呻吟；你根本无法不享受这一切");
            if(get_player().hasCock())
            {
               outputText("，而你自己的雄性器官也在刺激下变得坚硬，阵阵悸动");
            }
            outputText("。[pg]");
            outputText("[say:哦，有人很喜欢嘛，是吧？别担心，既然你想试试运气，那我可不会手下留情！你会得到全套体验的，亲爱的！]伊兹玛低吼道。她的手突然从揉捏你的屁股转而按住你的背，伊兹玛猛地咬住你，你在痛楚与快感交织中嚎叫起来——那力道足以让你清楚感觉到，却又不至于咬出血，尤其是她的鲨齿已经收了回去。她其余的牙齿也咬住你的侧腹，一边发狠地顶弄着你，而你忍不住主动向后迎合她。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,231) <= -4)
            {
               outputText("如果这就是鲨族的做法，你觉得自己还真能习惯……");
            }
            outputText("[pg]");
            outputText("[say: 就是这样，弱者，为我呻吟吧；让这更爽一点！要是你赢了，我也会呻吟的，所以你至少该给我同样的礼貌——这样才公平！]她含糊地说道。[say: 哦，对，对，对！真是个好用的小骚货，真棒！我……我要……来……了！]她咆哮着，松开抓住你肩膀的手，朝天空吼出狂喜；在她强壮的睾丸中翻涌冲撞已久的高潮，终于从她体内爆发出来。[pg]");
            outputText("你也呻吟起来，");
            if(get_player().hasCock())
            {
               outputText("[eachcock]喷出");
               if(get_player().cumQ() < 25)
               {
                  outputText("一小股");
               }
               else if(get_player().cumQ() <= 150)
               {
                  outputText("几股");
               }
               else
               {
                  outputText("一股持续不断的");
               }
               outputText("精液，洒到你身下的沙地上，但与你肠道里涌入的洪流相比，这根本微不足道。滚烫而滑腻的精液在你体内奔涌流淌，一次又一次泵入你的深处。");
            }
            else
            {
               outputText("你自己的肌肉因巨大的快感而痉挛。");
            }
            outputText("虎鲨人的精液巨浪涌到你的胃里，并把它彻底灌满，你的腹部随之鼓起，随后又开始进一步撑大。你的四肢不听使唤，在快感中脸朝下倒在沙地上，完全被感觉吞没，甚至没注意到自己的肚子正变得又硬又胀，紧紧顶在地面上。[pg]");
            outputText("最后，伊兹玛停了下来，剧烈地喘着气。她的肉棒渐渐软下，从你被撑开的肛门里抽出，随之还有一股滚烫的精液不断淌出。她恢复过来的同时，你也慢慢缓过劲，翻过身来，好让自己能看见她；你的腹部因为她灌进去的那些精液，已经肿成了一只不大却无法忽视的小肚子。她看着你，显然对眼前的景象十分满意。[pg]");
            outputText("[say: 这就是鲨族做爱的方式，]她告诉你。[say: 当然，如果赢的是你，那又会不一样……不过要是你想知道那是什么感觉，就得再回来一次，然后打败我。]她收拾起自己的衣服，把那颗牙齿丢到你腿上，接着俯身在你唇上轻轻一吻，便再次潜回水中，多半是去把自己洗干净了。[pg]");
            outputText("你仍留在原地，等待力气重新回到四肢里，也等那过量的性爱液体从你被灌满的肠胃中流出一些，然后才穿好衣服离开。你从没想过伊兹玛竟能用如此凶猛的方式占据主导……可与此同时，你发现自己居然还挺喜欢这样。你心里有一部分不禁想着，是否还能再见到那样的她……");
            _loc1_ = 231;
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,_loc1_,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,_loc1_) - 1);
         }
         else if(get_player().get_gender() == 2)
         {
            if(get_player().vaginalCapacity() < 26)
            {
               outputText("有什么如此巨大的东西突然硬生生挤进你的" + get_player().vaginaDescript(0) + "里，你忍不住痛得叫出声来。[pg]");
               outputText("[saystart]哇哦——！");
               if(get_player().vaginas[0].virgin)
               {
                  outputText("第一次，是吧？");
               }
               else
               {
                  outputText("可真紧啊！");
               }
               outputText("别担心，小家伙；我会对你温柔点的……至少前几下是这样。[sayend]出乎意料的是，她说的是真话，动作也变得更轻柔了。她仍旧强行挤进你体内，[if (metric) {一点一点地|一寸一寸地}]深入，但速度放得更慢、更稳，让你的小穴有时间适应她带来的猛烈扩张，并把她滚烫的前液当作润滑。");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,231) <= -4)
               {
                  outputText("你发现自己反而向后迎去，想让这个过程更快些，迫不及待地想让伊兹玛再次填满你。");
               }
               get_player().cuntChange(get_monster().cockArea(0),true,true,false);
            }
            else if(get_player().vaginalCapacity() < 60)
            {
               outputText("你能清楚感觉到她肉棒的每一[if (metric) {厘米|英寸}]，正稳稳沉入你的" + get_player().vaginaDescript(0) + "里，像上涨的潮水一样不可阻挡地填满你湿润的褶缝。[pg]");
               outputText("[say:啊啊啊~ 这小穴可真不错！你是故意输的吗？]她问道，而你能听出她声音里的笑意。");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,231) <= -4)
               {
                  outputText("你发现自己也在想着这个问题……");
               }
               get_player().cuntChange(get_monster().cockArea(0),true,true,false);
            }
            else
            {
               outputText("伊兹玛的肉棒或许相当惊人，但你也不是没承受过更大的，这一点很快就显露出来；伊兹玛第一次试探性的挺动，就让她直没至根地沉入你的胯间，而当她的四颗卵蛋拍打在你的会阴上时，你也因再次被填满的快感而呻吟出声。[pg]");
               outputText("[say: 搞什么！？你到底都遇上过些什么怪物？]她忍不住出声嘀咕道。");
            }
            outputText("[pg]整根埋入之后，她紧紧抓住你的[ass]，先向后抽出，接着又凶狠地挺身插回。[say:觉得自己很聪明，是吧？想试试鲨族的做法，是吗？好啊，在鲨族里，只有两种人——强者和弱者。而这，就是弱者的下场，]她凶狠地低吼道。[pg]");
            outputText("她挺动得越来越重、越来越快，逐渐带出愈发急促的节奏；她前后冲撞时，卵蛋清晰地拍打在你的屁股上。你能感觉到她巨大的雄性器官深入你的体内，摩擦着你子宫的内壁，将你一点点撑开；那滚烫的勃起紧贴着你灼热的内里。你呻吟着；你根本无法不享受这一切，你的阴户也在强烈快感中不断淌出淫液。[pg]");
            outputText("[say:哦，有人很喜欢嘛，是吧？好啊，别担心，是你自己想赌一把的，所以我可不会手下留情！你会完整体验到这一切的，亲爱的！]伊兹玛低吼道。她的手突然从你的臀部移开，转而抓住你的[chest]。伊兹玛猛地用力扯住你的[nipples]，让你在疼痛与快感交织中叫出声来。[say:乳头都硬了？你可真是想要这个啊……]伊兹玛调笑着，舔舐你的脖颈，惹得你舒服地呻吟起来。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,231) <= -4)
            {
               outputText("如果这就是鲨族的做法，你觉得自己还真能习惯……");
            }
            outputText("[pg]");
            outputText("[say: 就是这样，弱者，为我叫出来；让这更痛快点！要是赢的是你，我也会叫的，所以你至少该回敬我同样的礼数——这才公平！]她低声说道。[say: 哦，对，对，对！乖乖挨操，真乖！我……我快……要……来了！]她咆哮着，松开了对你饱受折磨的乳房的钳制，向天空吼出胜利般的狂喜；那在她强健卵蛋中翻腾冲撞已久的高潮，终于从她体内爆发而出。[pg]");
            outputText("你也发出呻吟，自己的高潮把身下的沙地涂满了女性的体液，而伊兹玛的精液则滚烫地灌进你的子宫。热而滑腻的液体涌动着流入你体内，一波又一波地泵进你的深处。随着那股虎鲨人的精液巨浪抵达你的胃部并将其彻底填满，你的肚子开始鼓胀，随后又继续向外撑开。你的四肢再也支撑不住，在快感中脸朝下跌倒在沙地上，被感官吞没到甚至没注意到自己的腹部正硬邦邦地鼓起，顶在地面上。[pg]");
            outputText("终于，伊兹玛停了下来，剧烈地喘着气。她的肉棒逐渐软下，从你被蹂躏过的小穴中拔出，随之流出一股持续不断的滚烫精液。她恢复过来时，你也慢慢缓过劲来，翻过身好看着她；因为她灌入你体内的所有精液，你的腹部已经胀成一个不大却清晰可见的小肚子。她看着你，显然对眼前的景象十分满意。[pg]");
            outputText("[say:这就是鲨族做爱的方式，]她告诉你。[say:当然，如果赢的是你，那就又不一样了……不过你要是想见识那是什么样，就得再回来一次，然后打赢我。]她俯下身，在你唇上轻轻一吻，随后把那颗虎鲨牙丢在你身旁。");
            if(get_player().get_pregnancyIncubation() == 0 || get_player().get_pregnancyIncubation() > 180)
            {
               outputText("她从自己的橡木箱里取出一片奇怪的叶子，塞进你的嘴里。[say:避孕草药。我可没打算给不是我伴侣的人生孩子，]伊兹玛说道，并确认你把那株植物咽下去后，才潜入水中，多半是去清洗自己了。[pg]");
            }
            outputText("你留在原地，等待力量重新流入四肢，也等着那些过量的性液从你的" + get_player().vaginaDescript(0) + "里流出一些，然后才穿好衣服离开。你从没想过伊兹玛竟能以如此强势的方式掌控局面……但与此同时，你发现自己其实还挺喜欢的。你心里有一部分甚至在想，是否还能再次见到她那副模样……");
            _loc1_ = 231;
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,_loc1_,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,_loc1_) - 1);
         }
         else
         {
            if(get_player().get_HP() < 1)
            {
               outputText("伊兹玛一只覆着金属的拳头重重砸在你的肚子上，把你打得摔倒在沙地上——你并没有受重伤，但已经虚弱得无法继续战斗，而伊兹玛也知道这一点。[pg]");
               outputText("她冲你咧嘴一笑；考虑到她还露着鲨鱼般的利齿，那表情显得相当凶狠，但她的语气倒还算温和。[say:哈！看来这一回是我赢了，小家伙！那么，我想你还欠我点东西，而我打算现在就拿走……][pg]");
            }
            else
            {
               outputText("你的双腿一软，脑海也被欲望搅得一片迷蒙；你已经兴奋得无法继续战斗，整个人像没了骨头般瘫倒成一团欲火难耐的模样。[pg]");
               outputText("伊兹玛摇了摇头，苦笑着咧嘴道。[say:看来某人在尝试性爱较量之前，还得先多练练自制力。][pg]");
            }
            outputText("当你败倒在地时，你意识到那位美丽的虎鲨人正一边脱下衣物，一边在你身旁踱步。她一把抓住你的[armor]，几乎没费什么力气就把你剥了个精光，露出你的");
            if(get_player().get_lust100() < 40)
            {
               outputText("疲软的肉棒和几乎没怎么充血的小穴");
            }
            else if(get_player().get_lust100() < 70)
            {
               outputText("硬挺的勃起和湿润的小穴");
            }
            else
            {
               outputText("跳动的勃起和淫液淋漓的小穴。");
            }
            outputText("[pg]");
            outputText("[say: 真是个下流的小妖精，是吧？你想要这个，对不对……]伊兹玛调笑着，将两根手指插入你湿润的下唇之间，先试探一下情况。你饥渴的小穴被侵入，让你忍不住轻轻呜咽起来，几乎是在恳求被填满。");
            if(get_player().vaginalCapacity() < 26)
            {
               outputText("[say: 哎呀呀，你后面这个小缝还挺紧的嘛。不过也紧不了多久了……]伊兹玛说道，手指在你的阴户里游走。");
            }
            else if(get_player().vaginalCapacity() < 60)
            {
               outputText("伊兹玛发现自己的手指在你湿润的肉褶间移动得如此轻松，不禁轻轻笑了起来。[say: 嗯，我想这会让你稍微好受一点吧。]");
            }
            else
            {
               outputText("伊兹玛瞪大了眼睛，她整只手似乎都滑进了你宽阔的阴道里。[say: 我操……这里面之前到底塞过什么？]她喃喃道，惊讶得有些紧张地笑了起来。");
            }
            outputText("[pg]");
            outputText("伊兹玛抽出手指，迅速将你赤裸的身体翻了过来，让你仰面躺着，只能抬头看着她。伊兹玛双手叉腰，似乎骄傲地挺起了丰满的胸膛。她那根[if (metric) {三分之一米|一英尺}]长的肉棒已经完全勃起，炽热的前液不时滴落在沙地上。她花了点时间打量你的肉棒，露出尖牙咧嘴一笑。[say: 让我看看你有什么本事，弱鸡。]");
            _loc1_ = get_player().biggestCockIndex();
            if(get_player().cocks[_loc1_].cockLength <= 10)
            {
               outputText("伊兹玛看见你的肉棒，勉强忍住没笑出声来。[say: 呃……哇哦？它真是……呵，巨大啊……]");
            }
            else if(get_player().cocks[_loc1_].cockLength <= 19)
            {
               outputText("[say: 不错，我还真有点佩服了，]伊兹玛说道，略微点头表示认可。");
            }
            else
            {
               outputText("伊兹玛看着你的" + get_player().cockDescript(_loc1_) + "，低低吹了声口哨。[say: 这才叫肉棒。看起来你下面简直多了条腿啊！]");
            }
            outputText("[pg]伊兹玛似乎已经评价完你了，便粗暴地抓住你的[feet]，将你的下半身往上拉，让你的重量压在脊背上，难受的姿势使你叫出声来。她没有把时间浪费在前戏上，而是直接决定将肉棒慢慢埋进你体内，[if (metric) {一点一点地|一寸一寸地}]推进，直到顶住你的子宫口。");
            get_player().cuntChange(get_monster().cockArea(0),true,true,false);
            outputText("[pg]");
            outputText("她开始在你体内进出，并逐渐加快速度、加重力道；她炽热的前液和你的淫液混在一起，成了让动作更加顺畅的润滑。[say:啊哈~你可真是个可爱的肉棒套……你喜欢被这样对待，对吧，小弱鸡？]伊兹玛一边嘲弄着，一边在你的" + get_player().vaginaDescript(0) + "里猛烈抽插。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,231) <= -4)
            {
               outputText("你现在甚至已经不怎么羞于承认这点了。");
            }
            outputText("[pg]");
            outputText("每一次顶弄都把你更深地压进沙地里，最后你发现自己正主动抬起腰臀迎合伊兹玛，渴望取悦她，也取悦自己。伊兹玛似乎注意到了这一点，放声大笑起来。[say: 哦？你真的喜欢被支配？哈，我就知道。]她一边继续嘲弄你，一边猛烈地干着你，每一下她的睾丸都会拍打在你身上。你的脑子已经被情欲搅得一片混沌，她说的话你连一半都听不进去。现在你在乎的只有高潮。[pg]");
            outputText("几分钟后，伊兹玛最后一次用力挺进，发出响亮的吼声，精液灌入你的子宫，又喷溅到沙地上。" + get_player().SMultiCockDesc() + "抽动着、搏动着，随时都要喷发。伊兹玛迅速握住");
            if(get_player().cockTotal() == 1)
            {
               outputText("它");
            }
            else
            {
               outputText("它们");
            }
            outputText("，对准你的脸，套弄着直到你也迎来高潮。你自己的精液一股股溅到脸上和身上，你一边扭动一边抗议。[say: 啧，你真以为我会让你射在我身上？要是你真能打赢我，也许我还能给你这个荣幸，]伊兹玛说道，伴随着响亮的*噗嗤*声从你体内抽了出来。她松开你的[feet]，让你的[ass]啪嗒一声落到沙地上，然后在你仍躺着不动时开始重新穿衣。");
            if(get_player().get_pregnancyIncubation() == 0 || get_player().get_pregnancyIncubation() > 150)
            {
               outputText("她走到自己的橡木箱旁，拿着一片奇怪的叶子回来，将它塞进你的唇间。[pg]");
               outputText("[say: 避孕草药。总不能让不是我伴侣的人怀上我的一窝崽子吧？]伊兹玛解释道，走向岸边。");
            }
            else
            {
               outputText("[pg]");
            }
            outputText("她朝你眨眨眼，把答应给你的牙齿扔到你的[feet]边，随后潜入水中，大概是去清洗身体了。几分钟后，你也洗了洗，忍着浑身酸痛踉跄回到营地。这一番折腾下来你才知道，伊兹玛想粗暴的时候还真够狠的。你心里有一部分不禁想着，自己是否还能再见到她那副样子……");
            _loc2_ = 231;
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,_loc2_,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,_loc2_) - 1);
         }
         get_player().orgasm("VaginalAnal");
         dynStats(DynStat.Sens(2));
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,231) >= -1)
         {
            outputText("你意识到自己在想什么，不由得打了个寒战，强行压下那些带着臣服意味的欲望。它们到底是从哪儿冒出来的？");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,231) >= -2)
         {
            outputText("虽然你设法把它们压了下去，但臣服于伊兹玛的梦境正开始纠缠你，那份力量与诱人的吸引力也在不断增长。不过，你仍然能控制它们。");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,231) >= -3)
         {
            outputText("你漫不经心地哼着小调，享受了一会儿脑中的幻象，然后才有些不情愿地将它们推开。不过你很确定，只要你想享受它们，随时都能再把它们唤出来。");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,231) >= -4)
         {
            outputText("你隐约觉得，也许自己不该用那种方式去想伊兹玛，但沉浸在被一个性感火辣的雌雄同体鲨鱼女孩彻底支配的感觉里，实在太过诱人了。毕竟，这么做又不会有什么坏处，不是吗？");
         }
         else
         {
            outputText("你彻底拥抱那些梦境，拼命想尽可能久地抓住它们。你越来越难再在乎自己过去的使命了；既然可以放弃一切，把自己交给伊兹玛，为什么还要去和恶魔战斗？没错……她是如此强大、有力、配得上你的首领；你只需要伊兹玛。就让她掌控你的人生，不好吗？");
         }
         FlagDict_Impl_.arrayWriteString(KFLAGS.flags,234,get_consumables().TSTOOTH.get_id());
         get_player().slimeFeed();
         get_combat().cleanupAfterCombat();
      }
      
      public function loseSpar(param1:Boolean) : void
      {
         clearOutput();
         if(param1)
         {
            outputText("你踉跄着向后退去，上一击的力道震得你头晕目眩。然而，当你意识到自己仍在战斗之中并抬头看去时，却看见伊兹玛双臂松垂在身体两侧，脸上满是真切的担忧。");
            outputText("[pg][say:啊，阿尔法，你累了吗？]她问道。[say:这样忽视自己的状态可不好。我知道你很强，但没必要冒险。]");
            outputText("[pg]看来她只是担心你的身体而已，不过要是刚才再继续一秒，你也不知道会发生[i:什么]……");
            get_combat().cleanupAfterCombat(get_camp().returnToCampUseOneHour,false);
         }
         else
         {
            outputText("你的脸热得厉害。你看着眼前的贝塔，脑海里只剩下激情。虎鲨人似乎注意到了你表情的变化，脸上也泛起了与你一样的红晕。");
            outputText("[pg][say:阿、阿尔法……]她说着，随后低下头。[say:真的很抱歉，阿尔法。你本来想认真战斗，我不该那样诱惑你的。求你，让我补偿你吧。]");
            outputText("[pg]这听起来正合你意……");
            get_combat().cleanupAfterCombat(get_camp().returnToCampUseOneHour,false);
            izmaSexMenu();
            button(14).hide();
         }
      }
      
      public function load(param1:int, param2:*) : void
      {
         Utils.extend(saveContent,param2);
      }
      
      public function letIzmaWankLikeABitch() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_izma());
         outputText("看着她突然急切地想要让肉棒释放，你咧嘴一笑，凑上去给了她一个亲密的吻，进一步点燃她的欲火。她一边回应你，一边加快套弄的速度，发出一连串满足的呻吟。[pg]");
         izmaCumsAfterRadarStuffHere(false);
      }
      
      public function letItBe() : void
      {
         clearOutput();
         outputText("你向你的爱人解释，孩子们应该学会在没有父母介入的情况下处理这种冲突。伊兹玛看起来有些不安，但她毫无异议地服从了自己的阿尔法。");
         outputText("[pg]小A跨坐在你那有条纹的女儿身上，带着得意的坏笑低头看着她。[say: 贝塔。]");
         outputText("[pg]鲨鱼女孩震惊地睁大了眼睛。她咬紧牙关，又试着反抗，但面对更强的斗士，她的努力全都白费了。当海葵把自己的肉棒对准小鲨鱼的小穴时，你那有条纹的女儿接受了自己的命运，为胜者张开双腿。");
         outputText("[pg]小A的肉棒慢慢滑进鲨鱼女孩的阴道，与这名运动型泳者肌肉的紧缩力量相抗衡。起初，虎鲨人皱起脸来试图抵抗，但海葵刺的催情效果强迫她产生了强烈反应。她尖叫着仰起头，身体的紧绷随之松开，让小A得以一路挺进到底。" + (saveContent.tigersharksDeflowered < FlagDict_Impl_.arrayReadInt(KFLAGS.flags,252) ? "海葵抽出时，她的肉棒上沾着少量血迹。<b>鲨鱼女孩的手指深深陷进草地里，紧紧抓住，破处的刺痛与触须的刺痛交织在一起</b>" : "海葵在抽出肉棒时幸福地叹了口气，回味着操弄这条无礼鲨鱼的感觉") + "。");
         outputText("[pg]小A用她尖细的小嗓音大声呻吟着，随着她挺动腰身，整个人都沉溺在快感之中；你的小鲨鱼女孩只勉强克制了片刻，就抱住海葵彻底屈服了。两个小女孩在这场交合中热烈亲吻，也许甚至忘了最初究竟是什么导致了这一切。你转头看向伊兹玛，想判断她对眼前场面的感受，却发现她正睁大眼睛盯着，" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,439) == 0 ? "一根跳动的勃起物从裙子底下顶了出来" : "脸上泛起深深的红晕，几乎红到了极点") + "。看起来她很难忍住不对着这一幕自慰，但不知是出于道德观，还是因为没有阿尔法的允许就不能取悦自己的冲动，她还是稳住了自己。");
         outputText("[pg]极乐的尖叫再次吸引了你的注意，你回头看去，只见小A把自己的肉棒彻底埋进鲨鱼女孩体内。那名有条纹的女孩肉棒抽搐起来，在她们相互拥抱时射得满肚子都是。小A深深吻住她，仍在高潮中的虎鲨人体内不断抽送。被占据优势的姐妹彻底压倒，你的女儿完全任由小A摆布。对鲨鱼女孩来说幸运的是，海葵很快也喘息着喊出了自己幸福的高潮，喷出大量体液后，终于把肉棒从疲惫女孩的深处抽了出来。" + (saveContent.tigersharksDeflowered < FlagDict_Impl_.arrayReadInt(KFLAGS.flags,252) ? "混着血色的精液" : "精液") + "立刻从她被蹂躏的小穴里喷涌而出，黏稠的精液沾满了她的大腿。小A又露出得意的神情，胜利般地说道：[say: 贝塔]，随后继续在溪边给自己的水壶装水。");
         outputText("[pg]你对你的爱人露出坏笑；有其母必有其女，不是吗？伊兹玛尴尬地结巴起来，试图为刚刚发生的场面找个说法。[say: 这、这个嘛，我想，任何没有继承我贝塔基因的你的女儿，都会更优秀吧……]");
         outputText("[pg]你拍了拍虎鲨人的背，向她保证，她们不可能<i>全都</i>是阿尔法。这本来就迟早会发生，她不该为此难过。");
         outputText("[pg]这件事让你充分兴奋了起来，于是你伸展了一下四肢，回到营地里。");
         dynStats(DynStat.Lust(15));
         if(saveContent.tigersharksDeflowered < FlagDict_Impl_.arrayReadInt(KFLAGS.flags,252))
         {
            _temp_1.tigersharksDeflowered += 1;
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function leaveSumSharkPussyOnTheBeach() : void
      {
         spriteSelect(SpriteDb.get_s_izma());
         clearOutput();
         outputText("暂时和伊兹玛没什么事要办，你便动身返回自己的营地。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function leaveIzmaVictoryTease2() : void
      {
         outputText("[pg]你站在那里，思索了片刻，而她则漫不经心地抚弄着自己。[say: 我准备好了，你知道的……我们可以开始……随时都可以？]见你仍然没有动作，她小心翼翼地开口。");
         if(saveContent.previousVictoryTeased)
         {
            outputText("[say: 拜托，这次可以吗？我已经尽力了……]");
         }
         outputText("[pg]不，你已经决定了。至少现在，你不会用自己的身体去奖励一个输家。也许等她下次能赢的时候，她就可以随心所欲地享用你。但既然现在你才是胜者，那就由你说了算。她甚至不该被允许独自取悦自己。她凝视着你，手停在自己的肉棒上，努力消化你最后的决定。你再次表明态度，命令她松开手，伊兹玛便温顺地把手垂落到沙地上。她急切地把脸凑上前，暗示如果这样屈辱的表演能取悦你，她可以给自己口交，但你仍然坚持要剥夺她的满足。还有什么比完全不给她任何快感，更能炫耀你的“alpha”地位呢？她只能忍到自己能赢为止，或者等你改变主意。");
         outputText("[pg][say: 可是……]她刚开口，就被你打断了。你提醒她，在这里她才是贝塔。她点点头，把你的奖品交给了你。看来她的等级本能相当容易接受这种服从形式。你挥手离开这名虎鲨人，她那根巨大的勃起物依旧明晃晃地挺立着，还在一跳一跳地抽动，仿佛在抗议自己没能得到关注。");
         saveContent.previousVictoryTeased = true;
         FlagDict_Impl_.arrayWriteString(KFLAGS.flags,234,get_consumables().TSTOOTH.get_id());
         get_combat().cleanupAfterCombat();
      }
      
      public function leaveIzmaVictoryTease() : void
      {
         var sexed:Boolean;
         var _g:IzmaScene;
         clearOutput();
         outputText("伊兹玛瘫倒在沙地上，向后倚着。[say: 啊……你赢了。来拿你的奖品吧，]她一边说着，一边开始脱衣服。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,231) <= 4 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,235) > 0)
         {
            leaveIzmaVictoryTease2();
         }
         else
         {
            outputText("[pg]也许这一次，你[i:会]索取你的奖励。不过不是性，不——在这个时候，比起她的身体，她的手套似乎更值得当作战利品。但你真的残忍到要夺走她唯一的胜机吗？");
            menu();
            _g = this;
            sexed = false;
            addNextButton("手套",function():void
            {
               _g.chooseIzmaGloves(sexed);
            });
            addNextButton("算了",leaveIzmaVictoryTease2);
         }
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,231,FlagDict_Impl_.arrayReadInt(_loc1_,231) + 1);
      }
      
      public function kidDickTeaseYes() : void
      {
         clearOutput();
         outputText("这还用说吗？她意志薄弱、缺乏安全感，在性方面更是可悲。你的女儿是基因上的死胡同，不会在基因库中留下任何痕迹，不像她的兄弟姐妹" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,252) > 2 ? "们" : "") + "。毫无疑问，这个虎鲨人往好了说是浪费空间，往坏了说是对你血统的侮辱。");
         outputText("[pg]这个小鸡鸡的鲨鱼开始嚎啕大哭，彻底被悲伤击垮了。你向她保证，现在哭也无济于事，因为你很清楚，她只是家里的侏儒，你的其他后代至少可以拿她练习如何做主导。小女孩跑回溪边，泡在水里平复心情，直到她最终再次开始被欺负。至少你知道，" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,252) > 2 ? "不管哪个" : "你的") + "欺负她的其他虎鲨人，都是未来的阿尔法。");
         doNext(playerMenu);
      }
      
      public function kidDickTeaseNo() : void
      {
         clearOutput();
         outputText("这条鲨鱼可能很可悲，但她终究是<i>你的</i>小女孩。尽管你可能会嘲笑她，但你爱她。每个家庭都难免会有个侏儒，她仍然可以成为一个非常可爱的顺从者。");
         outputText("[pg]她抽泣着，强忍着绝望。[say:真的吗？]");
         outputText("[pg]如果没有贝塔，阿尔法就真的失去了意义。与其害怕她那根小小的肉棒，她不如把它看作是她生来就是要顺从和侍奉比自己更伟大的存在的物理证据。当然，成为一个好贝塔的第一步就是接受自己是个贝塔。");
         outputText("[pg]你的女儿紧张地摆弄着大拇指，对这个想法仍然有些动摇。然而，经过一番深思熟虑，她还是服从了。[say:我、我是个贝塔。]");
         outputText("[pg]确实，她是，但她明白是什么让她成为贝塔的吗？你哄她进一步解释。");
         outputText("[pg]她深吸一口气，脱口而出：[say:我是一条软弱的小贝塔鲨鱼，长着一根小阴茎！]");
         outputText("[pg]真是个乖贝塔。你亲昵地拍了拍她的头，很快就打发她回溪流去了，你估计她在那儿又会被人取笑。不过至少现在她可能会学着享受这种感觉，而且还能成为你其他子嗣练习当阿尔法的好素材。");
         doNext(playerMenu);
      }
      
      public function kidDickTease() : void
      {
         clearOutput();
         outputText("不管是不是虎鲨人，她终究是个小女孩，你还能指望什么呢？你示意她展示一下阴茎，这样你才能给出确切的答案。");
         outputText("[pg]你的女儿红着脸低下头，颤抖着举起双手照做。[say:很、很小吗？]");
         outputText("[pg]在她的阴道上方，悬挂着一根紧张抽搐的小肉棒和稚嫩的小睾丸，看起来就像是伊兹玛" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,439) > 0 ? "以前那根" : "") + "的超迷你版。你的表情说明了一切，但你的话语更伤人，因为你忍不住指出了它在长度和粗度上令人尴尬的不足。她可是个虎鲨人，你真的期望能更好些。即使是人类的青春期前儿童，也有很大可能比你女儿的尺寸更大。你惊叹于这根可怜的肉棒，好奇地用手指弹了一下，看着它因为接触而稍微变硬了一点。");
         outputText("[pg]这个长着条纹的小女孩浑身发抖，强忍着哭声。[say:对不起，]她心碎地说道，试图接受这个现实。[say:我永远也成不了阿尔法了，对吗？]");
         outputText("[pg]如果她真能做到，那才叫奇迹。在鲨鱼中，即使是[if (metric) {17厘米|7英寸}]也算短的，看样子，这个小女孩到成年时甚至都长不到<i>那么</i>大。尽管你有阿尔法的实力，伊兹玛也有天赋异禀，但这孩子只遗传了" + (get_player().longestCockLength() < 5 ? "<i>你的</i>尺寸和" : "") + "伊兹玛的贝塔性格。这基因彩票中得怎么样？");
         outputText("[pg]眼泪顺着她的脸颊流下，你的女儿问道：[say:我是个废物吗？]");
         menu();
         addNextButton("是",kidDickTeaseYes).hint();
         addNextButton("否",kidDickTeaseNo).hint();
      }
      
      public function kidDickDeflect() : void
      {
         clearOutput();
         outputText("这真的不是，也不应该是你该讨论的领域。伊兹玛是个虎鲨人，她毫无疑问是在那些想当阿尔法的人的取笑中长大的；因此，她绝对有能力处理这件事。你向你的女儿解释说，虽然你爱她，但这种时候，去找她的另一个家长才是更好的选择。");
         outputText("[pg][say:好、好的。对不起，谢谢你，[Dad]，]她说道，显然为自己说出这么难为情的话而感到羞愧。你再一次努力表现出父母的关怀来安慰她，但还是得把她带去找伊兹玛谈这件事。");
         doNext(playerMenu);
      }
      
      public function kidDickComfort() : void
      {
         clearOutput();
         outputText("对于她这个年纪来说，她的肉棒一点也不小，没什么好担心的。孩子们互相嘲笑是不对的，但这很正常。" + (get_player().longestCockLength() < 6 ? "况且，你自己也没多大，但你可是和湖里最强壮、最聪明的鲨鱼之一交配的阿尔法。" : "") + "你的女儿们还小，生长速度肯定会有所不同。就算其中一个的阴茎比另一个大，也不代表会一直这样。最重要的是，无论她尺寸如何，她都能成为一个很棒的人。你和伊兹玛都爱她，性器官的大小与此毫无关系。");
         outputText("[pg]虎鲨人顿时喜笑颜开。[say:谢谢，[Dad]。我爱你。]虽然明显还有些不自信，但她现在至少开心多了。她紧紧抱住你，当你回抱她时，她放松了许多。");
         doNext(playerMenu);
      }
      
      public function kidDickBullying() : void
      {
         clearOutput();
         outputText("你突然被你的一个虎鲨人女儿拉住了胳膊。");
         outputText("[pg][say: [Dad]……]她说道，情绪低落，垂头丧气。她的手从你胳膊上放下，和另一只手一起在身前握住。你的女儿紧张地望向你。你很好奇她心里到底有什么烦恼，便让这条有条纹的小鲨鱼告诉你怎么了。她深吸一口气，解释道：[say: 我刚才在和我的姐妹" + (totalIzmaChildren() > 2 ? "们" : "") + "玩，然后……]");
         outputText("[pg]你像一位父母所能做到的那样耐心，试着鼓励她继续说下去。[say: 我、我的鸡鸡是不是很小？]她问道，因真切的不安而发着抖。");
         saveContent.kidDick = true;
         menu();
         addNextButton("安慰",kidDickComfort).hint("这很正常，而且无论如何她都不该担心这种事，尤其是在她这个年纪。");
         if(get_allowChild())
         {
            addNextButton("取笑",kidDickTease).hint("她的鸡鸡当然很小。");
         }
         addNextButton("转移",kidDickDeflect).hint("伊兹玛是虎鲨人，她更懂这类问题。你的女儿应该去找她谈谈。");
      }
      
      public function izmaValeriaToggle() : void
      {
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2201) == 1)
         {
            outputText("你告诉伊兹玛，你不希望她再喂养瓦莱丽娅了。");
            outputText("[pg][say: 哎呀，真可惜。她还挺好玩的，]伊兹玛兴奋地说。[say: 不过，你才是阿尔法。我想我可以管住自己的手。]");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2201,0);
         }
         else
         {
            outputText("你告诉伊兹玛，她应该去喂养瓦莱丽娅。鲨鱼女孩抱住你，脸上咧开掠食者般的笑容。[say: 我已经等不及了。]");
            if(get_player().get_armor() == get_armors().GOOARMR)
            {
               outputText("[pg]黏液从你的护甲里涌出来，说道：[say: 谢谢你决定让伊兹玛喂养我。]");
            }
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2201,1);
         }
         menu();
         addButton(14,"返回",izmaValeriaSubmenu);
      }
      
      public function izmaValeriaSubmenu() : void
      {
         clearOutput();
         outputText("[say: 哦，你可以问我要不要喂那个蓝色史莱姆娘，[name]，]伊兹玛说着，尾巴来回甩动。");
         menu();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2201) == 0)
         {
            addButton(0,"继续喂养",izmaValeriaToggle);
         }
         else
         {
            addButton(0,"禁止喂养",izmaValeriaToggle);
         }
         addButton(14,"返回",izmaSexMenu);
      }
      
      public function izmaTalkMenu() : void
      {
         menu();
         addNextButton("随便聊聊",talkWivIzma);
         addNextButton(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,249) == 1 ? "先别生" : "要孩子？",childToggle).hint(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,249) == 1 ? "告诉伊兹玛，她应该开始服用草药避孕药。" : "告诉伊兹玛停止服用避孕药，以便能够生育。",FlagDict_Impl_.arrayReadInt(KFLAGS.flags,249) == 1 ? "暂时不要孩子" : "要孩子吗？");
         setExitButton("返回",izmaFollowerMenu);
      }
      
      public function izmaSprite() : void
      {
         spriteSelect(SpriteDb.get_s_izma());
      }
      
      public function izmaSpar() : void
      {
         clearOutput();
         outputText("你告诉你的鲨鱼姑娘恋人，你想来一场快速的战斗，只是活动一下，让[if (isgoo) {你提起精神|你的血液流动起来}]。");
         if(!saveContent.sparred)
         {
            outputText("[pg]不过，她却露出疑惑的神情作为回应。[say:可是阿尔法，你是，呃，是我的阿尔法。你已经证明过自己的支配地位了，所以向你挑战会有点……]");
            outputText("[pg]你向她保证这没问题。只是一场短暂而友好的切磋，而且无论如何，偶尔让她重新记起你的力量也很重要。虎鲨人点头回应，而你已经能看见她脸上逐渐浮现的兴奋。");
            outputText("[pg][say:好吧，阿尔法，如果你确定的话。不过，啊，要是真的打起来，我不确定自己能不能收得住手……]");
            outputText("[pg]这正合你意，因为你也不会收手。你朝她招了招手，但她没有立刻过来，而是猛地转身，开始在自己的箱子里翻找。片刻之后，她取出" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,235) != 0 ? "一副磨损又凹瘪的" : "她那副熟悉的") + "臂铠。");
            outputText("[pg]" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,235) != 0 ? "[say:既然我把我的给了你，阿尔法，]她说，[say:那就只能用这些凑合了。] " : "") + "她不再耽搁，摆出了战斗姿态，眼中带着某种近似饥渴的神色。");
            saveContent.sparred = true;
         }
         else
         {
            outputText("[pg]她咧嘴一笑，露出满口尖牙，说道：[say:当然，阿尔法。我一直希望你还会再想来一次……]伊兹玛迫不及待地沉下腰，摆出战斗架势，显然已经跃跃欲试了。");
         }
         set_monster(new Izma());
         startCombat(get_monster());
      }
      
      public function izmaSexMenu() : void
      {
         var _g:IzmaScene;
         spriteSelect(SpriteDb.get_s_izma());
         menu();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,439) == 0)
         {
            addNextButton("肛交“承受”",followerIzmaTakesItInPooper).hint("这次轮到伊兹玛当阿尔法了！让她用阴茎支配你的屁股。");
            addNextButton("用屁股支配",radarIzmaAnalDominant).hint("强势一点，用肛门接纳她的阴茎。","用屁股支配");
         }
         if(get_player().hasCock())
         {
            if(get_player().hasCockThatFits(65))
            {
               addButton(2,"支配阴道",fuckIzmasPussyDominate).hint("支配伊兹玛，狠狠干她的小穴！","支配阴道");
            }
            _g = this;
            addNextButton("让她骑上来",function():void
            {
               _g.followerIzmaMountsPC();
            }).hint("命令伊兹玛用她的小穴骑上你的阴茎。");
            addNextButton("伊兹玛的小穴",followerIzmaTakesItInVagoo).hint("和这位虎鲨人的小穴玩一玩，再干她一场。");
            addNextButton("肛交",izmAnal).hint("进入她的后门。");
         }
         if(get_player().hasVagina() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,439) == 0)
         {
            addNextButton("骑伊兹玛鸡巴",inCampRideIzmasDickDongTheWitchIsDead).hint("用阴道骑上伊兹玛的肉棒。","骑伊兹玛的鸡巴");
         }
         if(get_player().get_gender() > 0)
         {
            addNextButton("六九式",followerIzmaTakesIt69);
         }
         addNextButton("舔阴",izmaCunnilingus).hint("舔弄你的鲨鱼爱人的小穴。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,785) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,439) == 0 && get_latexGirl().latexGooAtCamp())
         {
            addNextButton(get_latexGirl().gooName(),izmaLatexySubmenu);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,439) == 0 && get_valeria().valeriaFollower() && get_valeria().valeriaFluidsEnabled())
         {
            addNextButton("瓦莱丽娅",izmaValeriaSubmenu);
         }
         addButton(14,"返回",izmaFollowerMenu);
      }
      
      public function izmaPreg() : void
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,249) != 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1082) == 0 && pregnancy.knockUpChance())
         {
            pregnancy.knockUp(25,300);
         }
      }
      
      public function izmaPlayWithKids() : void
      {
         var _loc3_:* = null as Array;
         spriteSelect(SpriteDb.get_s_izma());
         registerTag("kids",TagFun_Impl_.fromInt(totalIzmaChildren()));
         clearOutput();
         var _loc1_:Array = [1,2];
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,454) > 0)
         {
            _loc1_.push(3);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,251) > saveContent.sharkgirlsDeflowered)
         {
            _loc1_.push(4);
         }
         if((saveContent.sharkgirlsDeflowered != 0 || saveContent.tigersharksDeflowered != 0) && get_player().hasCock() && get_player().get_lust() >= 50 || !get_allowChild())
         {
            _loc1_.push(5);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,252) != 0)
         {
            _loc1_.push(6);
         }
         var _loc2_:Array = _loc1_;
         switch(int(_loc2_[Utils.rand(int(_loc2_.length))]))
         {
            case 1:
               outputText("你决定去溪边陪你的鲨鱼女儿" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,252) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,251) > 1 ? "们" : "") + "待一会儿。你走近水边时，女儿" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,252) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,251) > 1 ? "们" : "") + "很快注意到了你，立刻兴奋地朝你连连挥手。" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,252) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,251) > 1 ? "其中一个" : "她") + "从水里冲了出来。");
               outputText("[pg][say: 嘿，[Dad]！想游泳吗！？]她兴奋地喊着，双手高高举起并握成拳。鲨鱼女孩在这个年纪总是精力旺盛。你也被她的兴奋劲带动，告诉她你当然想。");
               outputText("[pg]她兴致勃勃地笑着喊道：[say: 好耶！]随后转身又跳回水里。你也跟着下水，花了好一阵子，尽全力在游泳运动和比赛中跟上" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,252) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,251) > 1 ? "一群鲨鱼" : "一条鲨鱼") + "。这运动量可一点都不小。");
               dynStats(DynStat.Str(1),DynStat.Spe(1));
               get_player().changeFatigue(20);
               get_player().hasGottenWashed();
               break;
            case 2:
               outputText("你来到溪边陪你的女儿" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,252) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,251) > 1 ? "们" : "") + "，享受一段亲子时光。见到你后，" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,252) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,251) > 1 ? "其中一个" : "她") + "开心地提议来一场拔河。身为家长，你本以为自己该是更强的那个，但鲨鱼女孩的力气有时大得出奇" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,252) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,251) > 5 ? "，人数一多就更是如此" : "") + "。");
               outputText("[pg][say: 来嘛——]小鲨鱼拖着长音央求道。她可没耐心等你慢慢考虑。你答应下来，她立刻跑去拿绳子。" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,252) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,251) > 5 ? "其他孩子等着的时候，商量着分成两队，这样你就不用一个人对抗你这一大家子了。" : "") + "没过多久，你的女儿便飞奔回来。");
               outputText("[pg][say: 接住，[Dad]！]她一边喊着，一边把绳子的一端扔给你。");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,252) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,251) > 5)
               {
                  outputText("你的女儿们显然已经分好了队，其中一小部分来到你这边，抓住了绳子的这一端。能和自己的[dad]站在一队，她们每个都显得兴奋不已；不过剩下那些要和你较量的孩子，看起来也一点不逊色。[pg]她们聚到一起，举起各自那端的绳子");
               }
               else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,252) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,251) > 1)
               {
                  outputText("[pg]你的女儿们握紧了绳子");
               }
               else
               {
                  outputText("[pg]她握紧了绳子");
               }
               outputText("，你也照做。拔河开始了，");
               if(get_player().get_str() < 25)
               {
                  outputText("但很快就看得出来，你的力气远远比不上一条鲨鱼" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,252) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,251) > 1 ? "，更别提一整窝了" : "") + "。然而她们完全不给你喘息的余地，你一下子就被拽着在地上滑出[if (metric) {一米|好几英尺}]。" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,252) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,251) > 5 ? "站在你这边的那几个，面对人数更多的对手也没能撑得更久。" : "") + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,252) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,251) > 1 ? "提议玩这个游戏的那个女儿" : "被自己的力气吓了一跳，你的女儿") + "赶忙跑来扶你起来，满脸担心又有些慌乱。[say: 对、对不起，[Dad]，我以为你能撑得住。你需要冰敷一下吗？]她看起来很内疚，觉得是自己害你遭了这罪，但你向她保证你没事。不过，你确实需要休息一下。");
               }
               else if(get_player().get_str() < 50)
               {
                  outputText("而你一开始表现得相当不错。要较上劲儿对你的肌肉是个不小的负担，但对你的女儿" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,252) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,251) > 1 ? "们" : "") + "来说也同样吃力。尽管如此，你还是渐渐落了下风。你拼尽全力把[feet]死死抵进泥地里" + (get_player().isGoo() ? "，哀叹自己怎么会变成史莱姆，却" : "，然而") + "还是被绳子另一端更强的力量压倒。你踉跄着向前，手里的绳子彻底脱手" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,252) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,251) > 5 ? "，你队里的女儿们也很快跟着败下阵来" : "") + "。对手骄傲地站着，宣告了" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,252) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,251) > 1 ? "她们" : "她") + "的优越。");
               }
               else
               {
                  outputText("把绳子和鲨鱼" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,252) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,251) > 1 ? "们" : "") + "都绷得紧紧的，可她" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,252) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,251) > 1 ? "们" : "") + "似乎连[if (metric) {一丝一毫|一英寸}]都没法让你挪动。不过也得承认" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,252) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,251) > 1 ? "她们" : "她") + "很厉害，想让你保持原位可不是件容易事。随着你对自己的力量越来越有信心，你开始往后退。你的女儿" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,252) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,251) > 1 ? "们" : "") + "睁大了眼睛，意识到你正在占上风。" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,252) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,251) > 5 ? " 与此同时，你队里的鲨鱼们阴险地咯咯笑着，帮她们的[father]击败大多数兄弟姐妹。" : "") + " 当" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,252) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,251) > 1 ? "队伍最前方的人" : "她") + "触到边界时，恐慌顿时爆发。她的双脚在泥地上拖磨着，你猛地一拽，彻底结束了比赛。" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,252) + FlagDict_Impl_.arrayReadInt(KFLAGS
                  .flags,251) > 1 ? "那一大群人" : "她") + "踉跄着摔倒，胜利就此牢牢归于[Dad]队！[pg]你的女儿揉着酸痛的身体，抬头看着你，露出灿烂的笑容。[say: 真好玩！谢谢你陪" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,252) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,251) > 1 ? "我们" : "我") + "玩！]");
               }
               outputText("[pg]这可真是一场要命的锻炼。");
               dynStats(DynStat.Str(1),DynStat.Tou(1));
               get_player().changeFatigue(20);
               break;
            case 3:
               outputText("[Walk]到溪边，你看见你的女儿" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,252) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,251) > 1 ? "们" : "") + "正在水里开心地玩耍。" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,252) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,251) > 1 ? "其中一个" : "她") + "一看见你，就招手叫你过去。");
               outputText("[pg][say: [Dad]！过来，和" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,252) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,251) > 1 ? "我们" : "我") + "一起游泳！]她在河里精神十足地喊道。你本来正打算这么做，于是欣然跳进水里。刚入水时，寒意让你浑身一激灵，但和你的鲨鱼女儿" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,252) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,251) > 1 ? "们" : "") + "游了短短几分钟后，你就适应得很舒服了。你眼角余光瞥见小A正试探着碰了碰水，同时看向你。");
               outputText("[pg]你游回岸边去和海葵打招呼，问她要不要也和自己同父异母的姐妹" + (totalIzmaChildren() > 1 ? "们" : "") + "一起玩。蓝色的小女孩把这个提议琢磨了一会儿。");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,756) < 40)
               {
                  outputText("这份沉默被" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,252) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,251) > 1 ? "其中一个鲨鱼女儿" : "你的另一个女儿") + "打破了，她正喊你回去继续玩。小A一想到可能要面对这种场面就慌了神，逃回了营地；她现在还是太害羞，没法参加多人游戏。尽管你有些失望，还是从岸边离开，重新回到你的鲨鱼女儿" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,252) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,251) > 1 ? "们" : "") + "身边。");
               }
               else
               {
                  outputText("[say:……玩！]她攥起双手，兴奋地接受了你的提议。小A跳进你身旁的水里，牵着你的手，让你带她过去。");
                  outputText("[pg]虽然玩的时候她一直紧贴着你，但她和你以及她同父异母的姐妹" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,252) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,251) > 1 ? "们" : "") + "一起泼水嬉戏时，脸上那灿烂的笑容从来没有消失过。在自然界里，鲨鱼和海葵似乎并不合拍，但良好的家人羁绊终究能跨过这一点。");
               }
               outputText("[pg]不知不觉间，你已经游了整整一个小时。不得不说，这段时间花得很值。");
               dynStats(DynStat.Str(1),DynStat.Spe(1));
               get_player().changeFatigue(20);
               get_player().hasGottenWashed();
               break;
            case 4:
               outputText("你涉水走进河里，想和你的鲨鱼女儿[if (kids > 1) {们}]玩一会儿，可你还没来得及开始，[if (kids > 1) {她们中的一个|她}]就以惊人的速度游到你面前，哗啦一声从水里冒了出来。短暂的咯咯笑和一阵嬉闹之后，她突然认真起来，示意你靠近些。");
               outputText("[pg][say:呃，[Dad]？]她问道。你回应了她。[say:我一直在想……关于大人的事。妈妈跟我说过一点，但她说你才是真正的专家。]她真的这么说了吗？她可能是在开玩笑，但你还是让这个快到青春期的女孩继续说下去。[say:嗯，我觉得我已经够大了]——她扭动着臀部和尾巴以示强调——[say:我想知道！关于，嗯，性-性爱。]");
               outputText("[pg]你该怎么回答她？");
               menu();
               if(get_allowChild())
               {
                  addNextButton("亲身体验",izmaDaughterFirsthand).hint("用你所知道的最好方式教导你的女儿。").sexButton(1);
               }
               addNextButton(get_allowChild() ? "间接经验" : "解释",izmaDaughterSecondhand).hint("和她谈谈你自己的一些经历。");
               addNextButton("逃开",izmaDaughterEscape).hint("找个借口离开这里。");
               return;
            case 5:
               _loc3_ = [saveContent.tigersharksDeflowered > 1,false];
               registerTag("tigershark",TagFun_Impl_.fromBool(Boolean(_loc3_[Utils.rand(int(_loc3_.length))])));
               outputText("能和你的孩子[if (kids > 1) {们}]多待一会儿，这样的机会实在难得。你觉得自己有时间，便跳进水里，准备好好玩一场！[if (kids > 1) {你的一个女儿|你的女儿}]立刻破水朝你冲来，那股劲头几乎要把你撞到水下。[say: 嗨，[Dad]！]她兴奋地喊道。[say: 想[if (kids > 1) {一起}]赛一场吗！？]鲨鱼竞速可是对游泳能力的真正考验，不过你当然乐意展示一下自己的本事。她兴奋得眉开眼笑，催着你到[if (kids > 2) {其他人那边|[if (kids > 1) {她的姐妹那边|起点}]}]去，准备开始比赛。");
               outputText("[pg]不用说，鲨鱼在水里速度极快，而你的女儿[if (kids > 1) {们}]也不例外。[if (spe < 50) {尽管你拼尽全力想要较量一番，却还是[if (silly) {讽刺地成了一条彻底离了水的鱼|跟不上节奏}]。这场艰苦的水动力学考验在比赛过程中让你的肌肉一路燃烧，等到结束时，你已经筋疲力尽。当然，这依然很有趣，而且你的女儿[if (kids > 1) {们}]显然也玩得很开心。|当然，伊兹玛并不是[if (kids > 1) {她们|她}]唯一继承到这份天赋的人。[if (spe > 70) {你以优雅而精湛的身姿在水中滑行，几乎毫不费力，将实力展现得淋漓尽致，不过你还是稍稍收着点，让局面看起来像是你未必会赢。|你展现出足以一较高下的技巧，逼得你的女儿[if (kids > 1) {们}]不断加速。也许是因为[if (kids > 1) {她们还年轻，她们|她还年轻，她}]始终没能从你手中抢走领先。}]最后，你还是拔得头筹，但[if (kids > 1) {她们眼中的火光表明，她们会|她眼中的火光表明，她会}]认真练习、不断进步，打算下次击败你。}]在这里的锻炼已经足够充分，你平静地游向河湾一角，在陡峭的岸边歇下。你的下半身安静地垂在水中。");
               dynStats(DynStat.Spe(1),DynStat.Tou(1));
               get_player().hasGottenWashed();
               if(get_allowChild())
               {
                  outputText("[pg]没有别的东西分散注意力，你略感不适地挪动着[legs]，因为自己硬挺的性器实在难以忽视。 " + (get_player().lib > 50 || get_player().minLust() > 40 ? "不管你怎么努力，也只能勉强适应这样的性欲。 " : "") + "在这种安静的时刻，若不处理自己的需求，实在很难继续若无其事。仿佛哪位神明注意到了你的困境，你突然感觉有双柔软的手握住了你的[if (isnaked) {勃起|胯间隆起}]。[if (silly) {你承认，神明亲自干预你的鸡巴也不是完全不可能，但为了保险起见，你还是低头望向水中，想看看发生了什么|虽然直接享受也很诱人，但你还是顺着冲动查看水下}]。抬头望着你的，是你的[if (kids > 1) {一个}]鲨鱼女儿[if (kids > 1) {}]。她那张[if (tigershark) {带着条纹的}]脸有些害羞地慢慢浮出水面。");
                  outputText("[pg][say:嗯，嘿，[Dad]。我们赛跑的时候，我看到了你的……需要我帮忙吗？]她问道。看她满脸通红的样子，你猜她盯着你的下体看绝对不是偶然。你有一个饥渴的女儿，想要帮你缓解压力，但让她这么做是一个[father]该做的事吗？");
                  doYesNo(daughterBlowjob,daughterNojob);
                  return;
               }
               break;
            case 6:
               outputText("当你涉水走进河里时，你的女儿[if (kids > 1) {们}]立刻把你拉进了某种类似捉人的游戏里。[if (kids == 1) {她|其中一个}]试着向你解释规则，可她兴奋得口齿都有些含糊，还没等你完全弄明白就冲出去玩了。不管怎样，基本思路你还是懂的——去抓人，同时别被抓到。");
               outputText("[pg]然而才过了一会儿，[if (kids > 2) {你的另一个女孩|[if (kids > 1) {另一个|她}]}]就飞快地从旁掠过，拍了拍你的肩膀，又转眼消失在你身后。看来现在轮到你当“鬼”了，要是不想输，就得赶紧行动。你的女儿[if (kids > 1) {们}]似乎都非常认真，而且[if (kids == 1) {她有|她们都有}]出色完成这游戏所需的本能和身体条件。你用力一划，向前冲去。");
               if(get_player().get_spe() + get_player().get_tou() < 100)
               {
                  outputText("[pg]可无论你怎么努力，都始终抓不到[if (kids == 1) {她|她们中的任何一个}]。你的[hands]总是差那么一点，前方的鲨鱼鳍遥不可及，而你的肺也快跟不上你的雄心了。几分钟后，你已经上气不接下气，可你的女儿[if (kids == 1) {看起来|们看起来}]还是玩得很开心。");
                  outputText("[pg]你把[if (kids == 1) {她|她们}]叫回身边，告诉[if (kids == 1) {她|她们}]这次算[if (kids == 1) {她|她们}]赢了，引来一阵得意的咯咯笑。令你松了口气的是，[if (kids == 1) {她似乎|她们似乎}]很快就把你的落败抛在脑后，转而投入下一项水中活动，把你留在岸边，让你自己费力爬回去。");
                  dynStats(DynStat.Tou(1));
                  get_player().changeFatigue(20);
                  doNext(get_camp().returnToCampUseOneHour);
                  break;
               }
               outputText("[pg]胜利带来的兴奋让你一把抱住[if (kids > 1) {离你最近的}]女儿，几乎是在河中央把她扑倒。你们俩在水流里翻滚了一阵，才总算稳住身形；你抓住一块石头保持平衡，同时仍紧紧搂着她灵活的身体。");
               outputText("[pg][say:嘿，]你的女儿终于不再呛水后喊道，[say:那样违反规则！]");
               outputText("[pg]她看起来有点不高兴；你得决定该怎么回应。");
               if(get_player().get_tou() < 80)
               {
                  dynStats(DynStat.Tou(0.5));
               }
               menu();
               addNextButton("解释",tigerExplain).hint("告诉她为什么是她输了。");
               addNextButton("让步",tigerRelent).hint("也许她说得确实没错。");
               if(get_allowChild())
               {
                  addNextButton("教训",tigerLesson).hint("向她展示一个失败者应该如何服侍她的上级。").sexButton(-1);
               }
               return;
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function izmaPearance() : void
      {
         spriteSelect(SpriteDb.get_s_izma());
         clearOutput();
         outputText("伊兹玛是一名身高[if (metric) {188厘米|6英尺2英寸}]的虎鲨人，身材健美而结实；她的肌肉覆盖着粗糙的红色鲨鱼皮，身上遍布黑色条纹。她现在穿着一件比基尼上衣和一条草裙");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,235) == 0)
         {
            outputText("，并把铁拳套当作武器挥舞。");
         }
         else
         {
            outputText("。");
         }
         outputText("她的脸棱角分明，五官隐约让人联想到鲨鱼。她嘴里在普通的钝齿前方，还有第二排可收回的刀刃般尖牙。尽管轮廓硬朗，她的脸依然带着女性气质。她有一头银白色长发，垂过肩头。她的臀部线条少女感十足，却并不过宽，屁股也很紧实。她有一条长长的鲨鱼尾，一直垂到脚踝，上面也带着和身体其他部位一样的虎纹。她有两条普通的人类腿，末端是普通的人类双脚。[pg]");
         outputText("她有一对DD罩杯的乳房，每只乳房上都有一颗[if (metric) {1厘米|0.5英寸}]长的乳头。[pg]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,439) == 0)
         {
            outputText("就在她的小穴上方，伊兹玛长着一根长得过分的人形阴茎，几乎总是从草裙里探出来。它大约[if (metric) {38厘米长、4厘米|15英寸长、1.5英寸}]粗。颜色和伊兹玛其余皮肤一样是暗红色，不过上面没有虎纹。四颗棒球大小的睾丸沉甸甸地垂在她的阴茎下方。[pg]");
            outputText("她两腿之间有一个看起来随时可供交合的肉穴，还有一颗[if (metric) {半厘米|0.2英寸}]长的阴蒂。偶尔，她的肉穴上会渗出一颗颗润滑液，阴唇微微张开。[pg]");
         }
         else
         {
            outputText("在胯间，伊兹玛有着一个鼓胀而湿得惊人的小穴，时常滴下润滑液——多到如果她不留心，就会弄脏她的草裙。她的阴唇是暗红色的，兴奋起来时常常会分开，露出肿胀的爱钮。虽然看起来并不松弛，但那里的肉质显得柔软而顺从，足以张开到相当宽。[pg]");
         }
         outputText("她紧实的臀瓣之间有一个紧窄的屁眼，正长在它该在的位置上。");
         doNext(izmaFollowerMenu);
      }
      
      public function izmaLatexyToggle() : void
      {
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,784) == 0)
         {
            outputText("你告诉伊兹玛，你不希望她再喂养[latexyname]了。");
            outputText("[pg][say: 哎呀，真可惜。作为一袋滑溜溜的乳胶来说，她还挺好玩的，]伊兹玛兴奋地说。[say: 不过，你才是阿尔法。我想我可以管住自己的手。]");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,784,1);
         }
         else
         {
            outputText("你告诉伊兹玛你改变主意了，她可以继续让[latexyname]的体液保持充足。鲨鱼女孩抱住你，脸上咧开掠食者般的笑容。[say: 我已经等不及了。]");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,784,0);
         }
         menu();
         addButton(14,"返回",izmaLatexySubmenu);
      }
      
      public function izmaLatexySubmenu() : void
      {
         clearOutput();
         outputText("[say: 哦，我倒是不担心她，[name]，]伊兹玛说着，尾巴来回甩动。");
         menu();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,784) == 1)
         {
            addButton(0,"继续喂养",izmaLatexyToggle);
         }
         else
         {
            addButton(0,"禁止喂养",izmaLatexyToggle);
            addButton(1,"观看她们",izmaDomsLatexy);
         }
         addButton(14,"返回",izmaSexMenu);
      }
      
      public function izmaLakeTurnedDownCampSex() : void
      {
         spriteSelect(SpriteDb.get_s_izma());
         clearOutput();
         outputText("你冲伊兹玛坏笑一下，告诉她，要是她有兴致，你正好需要一点“释放”。[pg]");
         outputText("虎鲨人也冲你咧嘴一笑，小心解开她的裙子，让她那根惊人且迅速胀大的肉棒弹了出来。[say: 我很乐意，亲爱的。那么，你现在想怎么玩？平等地来一场？还是彰显你作为阿尔法的地位？]她露出十分邪恶的笑容。[say: 又或者……你想让你的贝塔对你为所欲为，嗯？]光是想到这里，她便欲火中烧地低吼起来。");
         menu();
         addButton(0,"平等",izmaLakeSexAsEquals);
         addButton(1,"支配",izmaLakeDominate);
         addButton(2,"臣服",submitToLakeIzma);
         addButton(14,"返回",execEncounter);
      }
      
      public function izmaLakeSexAsEquals() : void
      {
         spriteSelect(SpriteDb.get_s_izma());
         clearOutput();
         outputText("你告诉伊兹玛，你想和她以平等的身份做爱。她微笑着问你想用哪个部位。[pg]");
         if(get_player().get_gender() == 0)
         {
            outputText("伊兹玛上下打量了你一番，然后难过地摇了摇头。[say: 对不起，[name]，可是……你现在还是没什么能让我玩弄的东西。如果想平等地做，你得先长出一根肉棒或一个小穴。不如改成让我们其中一个来主导，怎么样？][pg]");
            doNext(execEncounter);
         }
         else
         {
            chooseYourIzmaWeapon();
         }
      }
      
      public function izmaLakeDominateContinueVanilla(param1:Boolean = true) : void
      {
         spriteSelect(SpriteDb.get_s_izma());
         var _loc2_:int = get_player().cockThatFits(65);
         if(_loc2_ < 0)
         {
            _loc2_ = 0;
         }
         if(param1)
         {
            clearOutput();
            outputText("你觉得不这么做有点失礼，也想看看自己究竟能让伊兹玛呻吟得多大声，于是你一边挺进她体内，一边握住她怒胀勃起的肉棒，开始为她套弄。这个举动似乎让伊兹玛吃了一惊，她随即发出快感的呻吟和尖叫。你带来的双重刺激很快就把伊兹玛推过极限，她开始向空中射出一股股浓稠的精液，随后洒落在她的脸和乳房上。高潮也席卷了她的女性器官，她的阴道内壁几乎带着痛感地夹紧你的" + Appearance.cockNoun(get_player().cocks[_loc2_].get_cockType()) + "。[pg]");
         }
         outputText("在这场强烈的释放之后，伊兹玛开始喘息着大口吸气，但当她意识到你还没结束时，立刻又发出呻吟。你咯咯一笑，放开她正在软下去的勃起物，把双手按在她的大腿上，开始加倍用力地干她。每一次挺身，你都把伊兹玛更深地压进沙地里；尽管已经筋疲力尽，伊兹玛还是发出了几声柔软而愉悦的呻吟。[pg]");
         if(get_player().get_gender() == 1)
         {
            outputText("经过一场漫长的交合后，你大声闷哼，你的" + get_player().cockDescript(_loc2_) + "胀大起来，将一股股精液射进伊兹玛的子宫");
            if(get_player().cockTotal() > 1)
            {
               outputText("，也溅到她的腹股沟上");
            }
            outputText("，让伊兹玛大声叫了出来。");
            if(get_player().cumQ() >= 500)
            {
               outputText("她的肚子随着你把惊人的精液尽数灌进她体内而鼓胀起来。");
            }
            if(get_player().cumQ() >= 1500)
            {
               outputText("最后她的肚子再也胀不下，之后每一次喷射都会把精液从她被塞满的小穴里挤出来，顺着她的肛门淌下去。");
            }
            outputText("你满足地叹了口气，从她身上退开，虚弱地站到你的[feet]上，重新穿好衣服。伊兹玛匆忙爬到自己的箱子旁，取出某种叶子，然后吃了下去。");
         }
         else
         {
            outputText("经过一场漫长的交合后，你大声闷哼，你的" + get_player().cockDescript(_loc2_) + "胀大起来，将一股股精液射进伊兹玛的子宫");
            if(get_player().cockTotal() > 1)
            {
               outputText("，也溅到她的腹股沟上");
            }
            outputText("，让伊兹玛大声叫了出来。");
            if(get_player().cumQ() >= 500)
            {
               outputText("她的肚子随着你把惊人的精液尽数灌进她体内而鼓胀起来。");
            }
            if(get_player().cumQ() >= 1500)
            {
               outputText("最后她的肚子再也胀不下，之后每一次喷射都会把精液从她被塞满的小穴里挤出来，顺着她的肛门淌下去。");
            }
            outputText("你满足地叹了口气，从她身上退开，虚弱地站到自己的[feet]上。不过你还没结束，还没完全结束。[pg]");
            outputText("当你把" + get_player().vaginaDescript(0) + "压到伊兹玛脸上时，她又喘了一声。你在她棱角分明的面庞上研磨着，随着她顺从的舌头探过你的唇瓣，你也大声呻吟起来。你真的会爱上这种感觉。你又骑在她脸上摩擦了几分钟，直到一次高潮震颤过你的女性部位，把淫液溅到伊兹玛脸上。你满足地叹了口气，虚弱地站起身来，[if (isnaked) {整理好自己|重新穿好衣服}]。你看见伊兹玛正从她的储物箱里翻出什么东西——某种植物——然后嚼了下去。");
         }
         get_player().orgasm("Dick");
         dynStats(DynStat.Sens(-1));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function izmaLakeDominate() : void
      {
         var _g:IzmaScene;
         spriteSelect(SpriteDb.get_s_izma());
         clearOutput();
         outputText("听到这个提议，伊兹玛顿时满脸通红，脸上浮现出淫荡的笑容。[say: 好、好吧，]她说着，脱下比基尼上衣，又轻轻解开草裙，让她的乳房和怪物般的肉棒弹了出来。她坐下后对你微笑道：[say: 你先请……][pg]");
         var _loc1_:int = get_player().cockThatFits(65);
         if(_loc1_ < 0)
         {
            _loc1_ = 0;
         }
         if(get_player().hasCock() && (get_player().get_gender() == 1 || Utils.rand(2) == 0))
         {
            outputText("你脱下[armor]，将伊兹玛的双腿大大分开，[eachcock]硬得几乎发疼；你托起她四颗睾丸，看向她湿亮的女穴。[pg]");
            outputText("你不想把时间浪费在前戏上，于是将你的" + get_player().cockDescript(_loc1_) + "尽可能深地插进伊兹玛的小穴，惹得她猛地倒吸一口气，在你身下扭动起来。你窃笑着开始在她体内抽插，她小穴里那些古怪的小触须挑逗并按摩着你的肉棒。穴壁本身又紧又滑，像手套一样贴合着你。那感觉简直就像伊兹玛的小穴是专门为你而生的。[pg]");
            outputText("你开始加快速度，用胯部一次次撞上伊兹玛的身体；这位漂亮的虎鲨人发出阵阵呻吟，而且每一次挺进都让她叫得更响。伊兹玛很快也开始回应你，每次都抬起胯部迎合你的抽插。也正是在这时，你注意到她那根硬得脉动不已的肉棒正在晃来晃去。[pg]");
            outputText("你要照顾一下她的肉棒吗？");
            _g = this;
            doYesNo(function():void
            {
               _g.izmaLakeDominateContinueVanilla();
            },noWankingForIzmaRadarSaysSo);
            return;
         }
         if(get_player().hasVagina())
         {
            outputText("你脱下[armor]，将伊兹玛的双腿大大分开，看着她那根跳动的勃起肉棒和四颗肥大的睾丸，不由舔了舔嘴唇。你试着撸动了几下伊兹玛巨大的肉棒，惹得这位虎鲨人发出几声舒服的低吟。[pg]");
            outputText("觉得前戏已经够了，你跨坐到她身上，顺着她的肉棒坐了下去。");
            get_player().cuntChange(30,true,true,false);
            outputText("你开始在她身上研磨扭动，");
            if(get_player().isTaur())
            {
               outputText("用你的体重把她压在沙地上，不让她夺回主动权。");
            }
            else if(get_player().get_tallness() > 48)
            {
               outputText("并把她的双手按过头顶，免得她试图换个姿势。你以这个姿势骑着她，她起伏的乳房摩擦着你的[chest]。毕竟，她得知道这里到底是谁说了算。");
            }
            else
            {
               outputText("但你身形太小，根本拦不住她：她伸手抓住你的[ass]，接着像把你当成地精肉棒套一样上下颠弄。");
            }
            outputText("[pg]");
            outputText("伊兹玛似乎已经尽力了，尽可能地抬起并抽动自己的肉棒，惹得你发出阵阵快感的喘息。");
            if(!get_player().isTaur())
            {
               outputText("为了奖励你这位卖力的伴侣，你伸出一只空着的手往后探去，揉按又抓弄她的睾丸。伊兹玛咬住嘴唇，开始大声低吼，尽可能把臀部向上挺起，急切地想为你射出来。你决定回敬她这份热情，于是越来越快地把小穴往下压去。");
            }
            outputText("[pg]");
            outputText("又激烈地交合了几分钟后，伊兹玛发出野兽般的闷哼和咆哮，迎来了高潮，一股股滚烫、带着麝香气味的精液射进你的深处。你快感地叫出声来，内壁紧紧夹住她的肉棒，把她能射出的每一滴精液都榨了出来。过了一会儿，你总算缓过劲来，踉跄着[if (singleleg) {直起身来|站到你的[feet]上}]。[say:嘿，等一下，]你刚要离开，伊兹玛便虚弱地说道。你回头看向她时，她正站在自己的箱子旁边。[pg]");
            outputText("[say:不来个告别吻吗？]她问道，努力装出可怜的语气，但听起来其实满是期待。你高兴地让她抱住你，可就在你们热烈亲吻的时候，她忽然从嘴里把什么东西顶进你口中，又用舌头把它推下你的喉咙，迫使你咽了下去。你从她怀里挣开，咳了几声，问她那是什么。[pg]");
            outputText("[say:避孕药，]她解释道。你有气无力地在她脸上拍了一巴掌，叫她别这么放肆，但从她脸上的笑意你看得出来，她很得意自己抢先占了你的便宜。");
            get_player().slimeFeed();
         }
         else
         {
            outputText("你把她推倒在地，看见她那根非人的阳具从裙子里弹了出来。看来被支配的念头让这条小鲨鱼兴奋起来了。不过，“小”这个词几乎不适合用来形容她身上的任何部位，尤其是当她那根[if (metric) {38厘米|15英寸}]长、硬得发胀的勃起物在身前晃动的时候。它甚至让你脸上露出傻乎乎的笑容。好吧，这是你应得的奖励，那就收下好了。[pg]");
            outputText("你俯下身，开始舔弄并吮吸她那根怪物般肉棒的顶端，吞下她滚烫的前液，把她怒胀勃起的龟头润湿。她在你的触碰下呻吟着抽动，身体扭来扭去，沉醉于被压制的感觉之中。把她掌控在手中的感觉，也让你脸上浮现出笑意。[pg]");
            outputText("渐渐地，你开始把她的肉棒越含越深，[if (metric) {一厘米又一厘米|一英寸又一英寸}]地滑进你的喉咙。直到终于含到她的根部时，你轻轻干呕了一下，随后才把它抽出来。她虚弱地呜咽着，可怜巴巴地看着你，不明白你为什么要这样挑逗她。你脱下自己的[armor]，转过身向她展示你的[ass]。当她意识到你打算做什么时，她棱角分明的脸上露出一丝小小的笑容。你把双手放到臀后，掰开臀瓣，然后开始坐上她那根已经被充分润滑的肉棒。[pg]");
            outputText("你往下坐去时，她发出一声声闷哼和粗喘；即使有各种体液润滑着她铁硬的肉棒，你也依然感到一阵撑胀。但渐渐地，疼痛转为快感，你们一边骑乘交合，一边大声呻吟，呼喊着彼此的名字。");
            get_player().buttChange(30,true,true,false);
            outputText("[pg]");
            outputText("这条鲨鱼咬紧牙关，咆哮着射了出来，把一大股滚烫的精液直直灌进你的[asshole]，让你被撑得微微鼓起。她将体内的精液全数倾泻在你体内时，你的肌肉一阵抽搐收缩，你甚至觉得眼前都冒出了星星。你花了好一会儿才喘过气来，从她逐渐软下去的肉柱上滑下，爬到沙地上。");
            outputText("过了一会儿，你们俩都穿好衣服，随便聊了几句，然后你便返回营地。");
            get_player().slimeFeed();
         }
         get_player().orgasm("VaginalAnal");
         dynStats(DynStat.Sens(-1));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function izmaKidsPlaytime() : void
      {
         var _loc4_:Number = NaN;
         spriteSelect(SpriteDb.get_s_izma());
         clearOutput();
         var _loc1_:Array = [];
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,252) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,251) == 1)
         {
            _loc1_[int(_loc1_.length)] = 16;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,252) > 0)
         {
            if(get_allowChild())
            {
               _loc1_[int(_loc1_.length)] = 1;
            }
            if(get_allowChild())
            {
               _loc1_[int(_loc1_.length)] = 2;
            }
            _loc1_[int(_loc1_.length)] = 10;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,252) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,251) >= 2)
         {
            _loc1_[int(_loc1_.length)] = 3;
            _loc1_[int(_loc1_.length)] = 9;
            _loc1_[int(_loc1_.length)] = 11;
            _loc1_[int(_loc1_.length)] = 14;
            _loc1_[int(_loc1_.length)] = 15;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,251) > 1)
         {
            _loc1_[int(_loc1_.length)] = 6;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,251) >= 1 && get_allowChild())
         {
            _loc1_[int(_loc1_.length)] = 21;
         }
         _loc1_[int(_loc1_.length)] = 4;
         _loc1_[int(_loc1_.length)] = 5;
         if(get_allowChild())
         {
            _loc1_[int(_loc1_.length)] = 7;
         }
         _loc1_[int(_loc1_.length)] = 8;
         if(get_silly() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,179) > 0)
         {
            _loc1_[int(_loc1_.length)] = 13;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,251) >= 1 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,252) >= 1)
         {
            _loc1_[int(_loc1_.length)] = 12;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,252) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,251) >= 10)
         {
            _loc1_[int(_loc1_.length)] = 17;
         }
         if(get_inventory().hasItemInStorage(get_armors().BONSTRP))
         {
            _loc1_[int(_loc1_.length)] = 18;
         }
         if(get_player().hasKeyItem("All-Natural Onahole") && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,252) > 0)
         {
            _loc1_[int(_loc1_.length)] = 19;
         }
         var _loc2_:Number = int(_loc1_[Utils.rand(int(_loc1_.length))]);
         if(get_game().time.hours < 10 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,454) > 0 && Utils.rand(2) == 0)
         {
            get_anemoneScene().kidAWatchesSharks();
            return;
         }
         var _loc3_:Number = _loc2_;
         if(_loc3_ == 1)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,252) == 1)
            {
               outputText("你的那个虎鲨人女儿独自待在一边，正试探性地抚摸、爱抚自己已经相当可观的肉棒。看起来她很快就要射了；她的脸已经因为新奇的快感而微微扭起，随着那些感觉轻轻喘息着。");
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,252) >= 2)
            {
               outputText("你的虎鲨人女儿们坐在一起，每个人都试探性地抚弄着自己尺寸不小的勃起。看起来她们是在比赛谁会先射出来。");
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,252) > 0)
            {
               outputText("你的虎鲨人女儿们坐在一起，有的试探性地给自己打手枪，有的则在抚弄姐妹的肉棒。有人看起来是在比谁能先把自己弄射，另一些则显然是在较量谁的手活更好。");
            }
            outputText("你移开了视线。");
            outputText("[pg]伊兹玛红着脸解释说，你们的孩子性欲很强，所以像这样进行尝试也很自然。她向你保证，她们不会真的伤害家人。");
         }
         else if(_loc3_ == 2)
         {
            outputText("你看见你的女儿抓住了一个设法找到这个角落的地精。不过看起来她们俩都不介意；她正粗暴却又热切地把自己塞进那个尖叫着的绿皮荡妇的小穴里，让那地精爽得不行。她看见你，朝你淫荡地眨了眨眼。[say: 你这女儿可真带劲；别担心，我会给你生上一大堆孙辈的，]她嘲弄道，随后在你的女儿终于到达极限、射进她体内时发出一声充满欲望的呻吟，用精液胀起了地精的肚子。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,252) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,251) > 2)
            {
               outputText("你的其他孩子围在旁边，带着几分好笑和一点羡慕，看着你的一个虎鲨人后代耕弄一个兴奋的地精。[say: 哦，对，宝贝儿，现在你们总算知道该怎么享受生活了！]她欢呼道。");
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,252) > 2)
            {
               outputText("[say: 别担心；你们也会有机会把漂亮的大肉棒用在我身上的——只要排队等着就行！]她看着周围一圈人笑道。你的其他女儿看起来已经迫不及待了。");
            }
            outputText("[pg]你看向伊兹玛，她耸了耸肩，显然并不在意。[say: 孩子有时候就是得被允许自己犯点错。我好像在哪儿读到过这句话。][pg]");
         }
         else if(_loc3_ == 3)
         {
            outputText("你的女儿们都睡着了，在湖边湿漉漉地挤成一团。她们轻轻打着鼾，偶尔伸伸胳膊腿，或是摆摆尾巴，随即又安静下来，和姐妹们紧紧依偎在一起。伊兹玛带着骄傲看着她们。[say:她们知道彼此是一家人。在恶魔赐给我们的这个世界里，这已经很了不起了。]她示意你让她们睡吧，你点点头，悄悄回到营地，把孩子们留在那里休息。[pg]");
         }
         else if(_loc3_ == 4)
         {
            outputText("你环顾四周时，湖面突然爆发出一阵猛烈的水花。你做好战斗准备，却发现那原来是");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,252) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,251) == 1)
            {
               outputText("你的女儿");
            }
            else
            {
               outputText("你的一个女儿");
            }
            outputText("，她显然正和什么东西较劲。她终于设法把自己扑上岸来，一边爆出一连串咒骂，让你不由得看向你那一脸心虚的虎鲨人爱侣，一边把某个东西也拖上了岸。那是一条巨大的鲶鱼，几乎和她本人一样长。她看向你，露出鲨鱼般的利齿，咧开一个凶狠又骄傲到极点的笑容。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,252) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,251) == 1)
            {
               outputText("她立刻就要把獠牙扎进那条还在扑腾的鱼的头骨里，但伊兹玛意有所指地咳了一声。你的女儿顿时显得受了教训，坐到附近一块岩石上，等猎物死透、不再动弹后，才小心地拔掉锋利的鱼鳍，然后开始进食。");
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,252) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,251) == 2)
            {
               outputText("你的另一个孩子跑到她身边，得胜归来的捕鱼者立刻低吼着警告她退后。对方有些不情愿，但还是照做了，直到那条鱼咽气、不再挣扎。等这条鱼的主人检查完猎物，拔掉鱼鳍，并先把最好的几块肉挑给自己之后，她才分享剩下仍是生的鱼肉；女孩们为此龇牙争抢、互相推挤，看起来比实际情况要凶得多。");
            }
            else
            {
               outputText("你的其他孩子都跑过去围住她，得胜归来的捕鱼者立刻低吼着警告她们退后。她们有些不情愿，但还是照做了，直到那条鱼咽气、不再挣扎。等这条鱼的主人检查完猎物，拔掉鱼鳍，并先把最好的几块肉挑给自己之后，她才分享剩下仍是生的鱼肉；女孩们为此龇牙争抢、互相推挤，看起来比实际情况要凶得多。");
            }
         }
         else if(_loc3_ == 5)
         {
            outputText("你的");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,252) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,251) == 1)
            {
               outputText("孩子一看到伊兹玛就精神一振，跑到她身边，一头扑进她怀里");
            }
            else
            {
               outputText("孩子们一看到伊兹玛就精神一振，跑到她身边，一头扑进她怀里");
            }
            outputText("。她开心地笑起来，在岸边坐下，伸手去拿身旁袋子里的一本书。你的孩子");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,252) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,251) == 1)
            {
               outputText("一想到要听故事，就高兴地叫出声来，迫不及待地在她面前坐好，听她开始朗读。");
            }
            else
            {
               outputText("一想到要听故事，就高兴地叫出声来，迫不及待地在她面前坐好，听她开始朗读。");
            }
            outputText("你在那里待了一会儿，听她读书，但最后还是想起了自己作为勇者的职责，只得向她们告别离开。");
         }
         else if(_loc3_ == 6)
         {
            outputText("你看到你的两个鲨鱼女孩正抱在一起，乍看之下似乎只是亲人间的拥抱。然而等你走近些，才发现这并不怎么像姐妹之间该有的样子；她们都在抚摸揉捏对方的乳房，试探着玩弄自己姐妹的胸部，想看看怎样才能让对方因快感而喘息呻吟。她们的脸贴在一起，正进行着一个很不纯洁的吻。伊兹玛脸红起来，连忙解释说你的孩子们性欲很强，所以像这样互相探索也是很自然的。她向你保证，她们不会真的和彼此做什么太过色情的事——而且，就算真做了，女孩子之间这点无伤大雅的亲热也不会闹出什么结果，对吧？");
            if(get_allowChild())
            {
               menu();
               addButton(0,"观看",izmaKidsLesbianWatch);
               addButton(1,"离开",izmaKidsLesbianLeave);
               addNextButton("示范",izmaKidsLesbianDemonstrate).hint("让她们看看该怎么做。").sexButton(2);
            }
         }
         else if(_loc3_ == 7)
         {
            outputText("你环顾四周时，湖面突然爆发出一阵猛烈的水花。你做好战斗准备，却发现那原来是" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,252) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,251) == 1 ? "你的女儿" : "你的一个女儿") + "，她显然正和什么东西较劲。她终于设法把自己扑上岸来，一边爆出一连串咒骂，让你不由得看向你那一脸心虚的虎鲨人爱侣，一边把某个东西也拖上了岸。");
            if(Utils.rand(2) == 0)
            {
               outputText("[pg]那原来是一条巨大的鲶鱼，长度几乎和她的身高差不多。她看向你，露出鲨鱼般的利齿，咧出一个凶悍又骄傲的笑容。");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,252) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,251) == 1)
               {
                  outputText("她立刻把尖牙咬进那条仍在扑腾的生物头骨里，让它彻底不动了，然后便狼吞虎咽地大口撕吃起来。");
               }
               else
               {
                  outputText((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,252) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,251) == 1 ? "你的另一个孩子" : "你的其他孩子们") + "跑过去围住她，这让这位凯旋而归的捕鱼者冲他们低吼，叫他们退后。他们有些不情愿，但还是照做了，直到她咬下第一口。随后他们便挤上前去，开始啃食那条生鱼，一边吃一边互相咬合推搡；看起来比实际情况凶得多。");
               }
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,252) > 0 && get_allowChild())
            {
               outputText("[pg]这只虎鲨人的痛苦显而易见；一个海葵女孩把嘴贴在这只扶他鲨鱼女孩已经相当可观的阴茎上，拼命地吸吮着，她那许多带刺的触手让你那长着肉棒的女儿虚弱又发情，无法反抗。" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,252) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,251) == 1 ? "你的另一个孩子" : "你的其他孩子") + "急忙跑过来试图帮忙，但挥舞的触手让他们沮丧地退了回来。[pg]伊兹玛绝望地看着你。[say:我们该怎么办？]她问道。还没等你回答，这只虎鲨人就发出了一声狂喜的尖叫，挺起臀部，将她四个蛋里的精液射进了饥渴的扶他嘴里。海葵喝下了所有的东西，然后肚子微微鼓起，放开她滑入了水中。你急忙跑过去查看你的孩子；幸运的是，她没有受伤，除非你把她这么快就射精对自尊心的打击也算作伤害。");
            }
            else
            {
               outputText("[pg]一只个头极大、外壳粗糙、看起来怒气冲冲的小龙虾正死死夹在她的尾巴上。不管这条年幼的鲨鱼怎么挣扎，它都只是随着尾巴甩来甩去，死活不肯松钳，还拼了命地越夹越紧。伊兹玛赶紧跑过去帮忙，把它们撬开后扔回水里，然后把眼泪汪汪的女儿一把抱进怀里。[say: 好了好了，我的宝贝，没事了。]她轻声哄道。[say: 不过下次，你会对小龙虾洞多加小心的，对吧？]她对女儿说。鲨鱼女孩吸了吸鼻子，答应以后一定会的。");
            }
         }
         else if(_loc3_ == 8)
         {
            outputText("你来看望" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,252) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,251) == 1 ? "女儿时，她正忙着" : "女儿们时，她们正忙着") + "；" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,252) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,251) == 1 ? "她拿来了" : "她们拿来了") + "几本伊兹玛的旧书，正努力自学识字。伊兹玛在一旁看着" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,252) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,251) == 1 ? "她" : "她们") + "，骄傲得几乎要绷不住了；每当" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,252) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,251) == 1 ? "她读错" : "她们读错") + "某个词时，她就会温柔地纠正一下。");
         }
         else if(_loc3_ == 9)
         {
            outputText((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,252) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,251) == 2 ? "你的两个" : "你的几个") + "女儿正在真刀真枪地打成一团，牙爪并用，激烈地互相猛揍。临时育儿室里响彻着响亮的喊叫，不过就你听来，那些并不像什么“正经”的战吼——她们喊得最狠的也不过是“我比你厉害”。伊兹玛有些不好意思地看着你。[say: 这对她们来说其实很正常——所有鲨鱼都需要测试自己的力量，弄清自己处在什么位置。]你有点怀疑，但不得不承认，她们看起来并不是真的生气——就算扭打在一起或挥拳相向，她们" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,252) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,251) == 2 ? "两个" : "个个") + "也都笑得合不拢嘴。最后，打架的孩子们全都摊倒在地，疯狂地大笑起来。");
            outputText("[pg]其中一个女孩突然发出尖锐的哭喊，伊兹玛的态度也一下子变了。打闹立刻停了下来，只见一个鲨鱼女孩正疼得抽泣，眼泪顺着脸颊流下，手臂上一道浅浅的咬痕渗出血来。另一个鲨鱼女孩看起来非常心虚，" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,252) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,251) > 2 ? "而你的其他女儿们都惊恐地盯着她" : "") + "与此同时，哭泣的鲨鱼女孩已经扑进了母亲怀里。伊兹玛一把抱起她，轻声哄着她止住哭声，同时狠狠瞪着那个心虚的鲨鱼女孩。[say:不许咬你的姐妹！]她厉声说道，大步走过去，重重捏住她的鼻尖。心虚的那个疼得呜咽起来，发誓那只是个意外，并保证再也不会这样做。处理完这边后，伊兹玛转向自己的女儿，温柔地舔舐她的伤口，直到血止住。[say:这样好多了……现在别哭了，好吗，亲爱的？你们像鲨鱼一样打闹，那偶尔被咬一下也是难免的。你不该去咬姐妹，但也不该为了这么点小咬伤就哭成这样。明白吗？]受伤的鲨鱼女孩抽了抽鼻子，但保证以后会努力变得更勇敢。[pg][say:这才是我的好姑娘。]伊兹玛笑了笑，亲了亲她的脸颊，然后让她跑回去和她的" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,252) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,251) == 2 ? "姐妹" : "姐妹们") + "继续玩——只不过这次明显温柔多了。");
         }
         else if(_loc3_ == 10)
         {
            outputText("[say: 好了，我的乖宝贝" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,252) > 1 ? "们" : "") + "，该吃药了，]伊兹玛喊道。你的虎鲨人女儿" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,252) > 1 ? "们" : "") + "发出一声哀叹，伊兹玛摆出严厉的表情。[say: 好了好了，你" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,252) > 1 ? "们" : "") + "知道的，要是那些地精以为你" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,252) > 1 ? "们" : "") + "能给他们生孩子，他们只会给你" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,252) > 1 ? "们" : "") + "惹麻烦。你" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,252) > 1 ? "们" : "") + "得吃下这种抗精草药，不然我们就要被那些下流的小贱货烦死了。还是说，你" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,252) > 1 ? "们" : "") + "以为我不知道他们占你" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,252) > 1 ? "们" : "") + "便宜的事？]她坏笑着，挑起一边眉毛加强语气。");
            outputText("[pg]你那讪讪的女儿" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,252) > 1 ? "们" : "") + "立刻走上前，张开" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,252) > 1 ? "她们的" : "她的") + "嘴，让伊兹玛把一片小叶子放到" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,252) > 1 ? "她们" : "她") + "的舌头上，然后很不情愿地咽了下去。");
         }
         else if(_loc3_ == 11)
         {
            outputText((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,252) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,251) == 2 ? "你的两个女儿" : "你所有的女儿") + "看见你们俩走来，顿时高兴地叫出声，突然从原地冲出来，直奔你而来。[pg]你那背信弃义的虎鲨人爱人敏捷地闪到一旁，任由她们一拥而上扑倒你，把你从[feet]上撞翻，仰面倒在一团又笑又闹、满脸开心的鲨鱼姑娘中间。她们为成功打了你个措手不及而欢呼，还故意赖在你身上不起来，逼得你只能从她们底下扭着身子钻出去。你打趣说她们精力太旺盛，揉了揉她们的头发，又告诉她们，看到她们长得这么高大强壮真好。确认她们身体健康、心情也不错后，你便让她们回去继续玩了。");
         }
         else if(_loc3_ == 12)
         {
            outputText("当你来到育婴室时，伊兹玛突然停下脚步，龇牙低吼，喉间发出清晰的咆哮，露出锋利的牙齿，双眼眯成细缝。你环顾四周寻找危险，几乎立刻就发现了：在那棵破旧的老树附近，你的鲨鱼女孩" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,251) == 1 ? "女儿正" : "女儿们正") + "和一个小恶魔说话。那家伙穿着一件破旧的大衣，戴着一顶肮脏的软呢帽。他敞开一边外套，露出里面一排排瓶子，脸上挂着虚伪的笑，露出扭曲发黄的牙齿。");
            outputText("[pg][say: 我向你们保证，这东西能让你长出一根让你" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,251) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,252) == 2 ? "姐妹" : "姐妹们") + "都羡慕的鸡巴……] 他对她们说道；紧接着，伊兹玛突然冲上前来，他尖叫一声向后跳去，却还是被她粗暴地挤开自己的女儿们，一把揪住衣领拎得站直，对着他的脸咆哮。");
            outputText("[pg][say: 你现在立刻从这里滚远点，把你找到过这地方的事忘得一干二净，不然我发誓我会吃了你！] 她啐道。");
            if(!get_silly())
            {
               outputText("[pg]小恶魔疯狂点头。下一秒，你那怒不可遏的虎鲨人女友一记飞踢，把他直接踹过了小溪。这个恶魔崽子重重摔在对岸，刚一爬起来就赶紧手脚并用地逃离了视线。");
            }
            else
            {
               outputText("[pg]令你难以置信的是，小恶魔只是回头冲她邪笑。[say: 是吗？说得好像你真有那个胆子似的……][pg]他在最后一刻意识到自己犯了错，却已经来不及惨叫。你转过头去，却还是挡不住骨头被嚼碎的声音。[say: 嗝！要我说，我现在肚子里可有的是胆。]伊兹玛嘲弄道，戳了戳自己鼓起来的肚子；一顶空荡荡的软呢帽和一件大衣被丢在她脚边的地上。");
            }
            outputText("[pg]伊兹玛不赞同地看着垂头丧气的" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,251) == 1 ? "女儿" : "女儿们") + "。[say: 现在，我真是对" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,251) == 1 ? "你" : "你们") + "太失望了。我说过多少次了，小恶魔是什么样的？你们绝对不能相信他们！他们卑鄙！爱撒谎！邪恶！唯一的好小恶魔就是死掉的小恶魔，给我记住了。]");
            outputText("[pg][say: " + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,251) == 1 ? "我" : "我们") + "知道错了，妈妈，]传来这样的回答。");
            outputText("[pg]听到这话，伊兹玛的神色缓和下来。[say: 我知道，" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,251) == 1 ? "宝贝" : "宝贝们") + "。我知道你想变得像你的" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,252) == 1 ? "姐姐" : "姐姐们") + "一样，但是，说真的，做个彻彻底底的女孩也没什么不好，好吗？你现在这样就很漂亮，永远别忘了。]她一把将孩子搂进怀里。");
         }
         else if(_loc3_ == 13)
         {
            outputText("你看到你的" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,252) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,251) == 1 ? "女儿" : "女儿们") + "正忙着举铁，这景象让你不由得打了个寒战。你的小" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,252) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,251) == 1 ? "姑娘" : "姑娘们") + "真的会长成那个方块似的鲨鱼男那样吗？你绝不会让这种事发生！你下定决心，一有机会就找伊兹玛谈谈这件事……");
         }
         else if(_loc3_ == 14)
         {
            outputText("你到那儿时，你的女儿们正沿着岸边排成一排，弯腰伸展着放松肌肉，接着又弯下身，把一排光溜溜的屁股展示给你看。[say:各就各位……预备……跑！]其中一个喊道，下一瞬间，她们便纷纷跃入水中，开始比赛。你和伊兹玛相视一笑，找了个舒服的位置坐下，为她们加油。");
            outputText("[pg]你的一个女儿从一块巨石上跳进水里，蜷成一团砸进溪流，伴随着欢快的叫声，水花四溅。她从水里探出头，吐出一小股水，看见你和伊兹玛后，便高兴地朝你们挥手，然后游回岸边，迫不及待地爬回岩石上，准备再来一次。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,252) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,251) > 2)
            {
               outputText("[pg]其中一个正忙着玩她自己搭的简陋秋千——一根绑在树枝上的绳子。她欢叫一声冲上前去抓住绳子，荡到河面上方，然后松手，扑通一声落进水里。");
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,252) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,251) > 3)
            {
               outputText("[pg]最后，她们都在水里嬉闹起来，扑腾着、尖叫着，活像一群再普通不过的孩子。这让你想起了在你原本的世界里，英格纳姆附近那条河中游泳的日子。");
            }
            outputText("[pg]" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,252) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,251) == 2 ? "你的一个孩子拉住伊兹玛的手，另一个拉住你的手" : "你的一个孩子拉住伊兹玛的双手，另外两个拉住你的手，剩下的孩子则围到你们俩身边") + "。[say:来和我们一起游泳嘛！]" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,252) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,251) == 2 ? "她央求道" : "她们央求道") + "。伊兹玛向你投来恳求的目光，你则对她笑了笑，脱下衣服，只剩" + (get_player().hasUndergarments() ? "内衣" : "赤裸的[skindesc]") + "。伴随着一阵欢呼，你的孩子们拉着你们俩走进水里。");
            _loc4_ = Utils.rand(4);
            if(_loc4_ == 4)
            {
               outputText("[pg]你们这" + Utils.num2Text(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,252) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,251) + 2) + "个人嬉戏泼水、在水中畅游，而你发现自己玩得格外尽兴；你已经想不起上次和村里的年轻人一起玩是什么时候了，这让你有种回到家乡的感觉。");
            }
            if(_loc4_ == 3)
            {
               outputText("[pg]你们正互相泼水时，你的一下水花把伊兹玛浇了个透，她笑着甩了甩头发。[say:这种事可不只有你会！]她咯咯一笑，随即也朝你泼回一把水。你试着还击，但当你的女儿站到伊兹玛那边时，局势开始对你不利。" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,252) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,251) > 2 ? "不过随后你的另一个女儿也站到了你这边，最后演变成了一场声势浩大的混战式泼水大战。" : "") + "等到结束时，你们全都湿透了，笑得停不下来。");
            }
            if(_loc4_ == 2)
            {
               outputText("[pg]一次潜下水后你浮出水面，却发现到处都看不到伊兹玛的身影——只有" + Utils.num2Text(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,252) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,251)) + "个咯咯直笑的女儿。突然，你感觉有什么粗糙又结实的东西擦过你的[legs]！你猛地伸手想抓住它，但它已经游开了。你在水里转过身，试图弄清那到底是什么，忽然有什么东西从你身后的水面冲出，用纤细却有力的双臂一把抱住了你。[say:抓到你了，亲爱的！]伊兹玛得意地欢呼着，而你才刚从惊吓中回过神来。[say:嗯……和鲨鱼一起游泳可得小心……我们有时候可是会咬人的……]她在你耳边柔声低语，同时让你感觉到她逐渐硬起的勃起抵在你的[ass]上。");
               outputText("[pg]她放开你，游远了，离开时还朝你眨了眨眼。不知为什么，你成了最后一个离开水里的人……");
               dynStats(DynStat.Lust(15));
            }
            if(_loc4_ == 1)
            {
               outputText("[pg]一次潜下水后你浮出水面，却发现你的女儿们都不见了。你看向伊兹玛，她只是心照不宣地坏笑。突然，你从眼角余光里看到" + Utils.num2Text(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,252) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,251)) + "个熟悉的鳍正朝你游来。可当你转身面对她们时，她们却一转方向游开了。你也露出一抹笑容，试着追踪她们的动向，应对她们对你的靠近。[pg]这变成了一场技巧考验：你能否在这些潜在水下的鲨鱼碰到你之前发现她们？你做得相当不错，不过，当一双双小手拍上你的屁股、滑过你的臀侧，或碰到你的[legs]时，你还是不止几次感觉到了她们的触碰");
            }
            if(_loc4_ == 0)
            {
               outputText("[pg]伊兹玛突然吹了声口哨，打断了她们的玩耍。[say:好了，亲爱的们；该让我们看看你们像鲨鱼一样游泳练得怎么样了！]她一边说，一边拍了拍手。这" + Utils.num2Text(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,252) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,251)) + "个鲨鱼女孩立刻在你面前排成一列，等母亲发出信号后，便一头扎进水里，开始在水面下滑行。她们把手臂和双腿贴拢身体，让身形更流线，同时摆动着臀部和尾巴。你满怀赞赏地看着她们游过去；虽然还有进步空间，但你觉得，她们的游泳本事放回英格纳姆，几乎已经能赢过绝大多数人了。");
            }
            get_player().hasGottenWashed();
         }
         else if(_loc3_ == 15)
         {
            outputText("你的 " + Utils.num2Text(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,252) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,251)) + " 个女儿正坐在浅水里，互相冲洗身体；你也分不清她们是真的想洗干净，还是只是在滋润自己相对娇嫩的皮肤。她们轻声咯咯笑着，你看得出来，她们正借着这个机会，用既玩闹又带点挑逗的方式触碰彼此。");
         }
         else if(_loc3_ == 16)
         {
            outputText("你唯一的女儿见到你显得很高兴，还抱住了伊兹玛。[say: 爸爸？妈妈？你们什么时候给我生个小妹妹？这里好孤单啊，]她可怜巴巴地问道。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,249) == 0)
            {
               outputText("[pg]伊兹玛看起来有点难过，但还是耐心地说：[say: 对不起，小家伙，可现在还不是我们要更多孩子的时候。]她这样告诉她，这显然让" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,252) == 1 ? "那名虎鲨人" : "那名鲨鱼女孩") + "大失所望。");
               if(pregnancy.get_isPregnant() || get_player().get_pregnancyType() == 12)
               {
                  outputText("随后她笑了笑。[say: 不过，我想很快这里就会有更多小鲨鱼跑来跑去了。]这让你的女儿欢呼起来，并开心地抱");
                  if(pregnancy.get_isPregnant() && get_player().get_pregnancyType() == 12)
                  {
                     outputText("依次抱住你们俩的肚子。");
                  }
                  else
                  {
                     if(pregnancy.get_isPregnant())
                     {
                        outputText("伊兹玛隆起的孕肚。");
                     }
                     if(get_player().get_pregnancyType() == 12)
                     {
                        outputText("你的孕肚。");
                     }
                  }
               }
            }
            else
            {
               outputText("[pg]伊兹玛宠溺地对她的宝宝笑了笑。[say:别担心，你很快就要当姐姐了。]");
               if(pregnancy.get_isPregnant() || get_player().get_pregnancyType() == 12)
               {
                  outputText("她得意地一笑，摸了摸");
                  if(pregnancy.get_isPregnant() && get_player().get_pregnancyType() == 12)
                  {
                     outputText("你们两人的肚子");
                  }
                  else
                  {
                     if(pregnancy.get_isPregnant())
                     {
                        outputText("她的肚子");
                     }
                     if(get_player().get_pregnancyType() == 12)
                     {
                        outputText("你的肚子");
                     }
                  }
               }
               outputText("[say:事实上，我觉得真的很快就要到了……] 听到这番话，你的女儿高兴地欢呼起来。");
            }
         }
         else if(_loc3_ == 17)
         {
            outputText("你惊叹于你和伊兹玛繁育出的鲨鱼数量之多，看着她们和年长的虎鲨人开心地玩耍；你想知道英格纳姆的人们会怎么看待你这庞大的子嗣群。当一个" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,252) > 0 ? "虎鲨人" : "鲨鱼女孩") + "突然抱住伊兹玛的腰，对她说，[say:等我长大了，我也要像你一样抓一个可爱的伴侣，然后生好多好多的女儿，就像你一样，妈妈。]时，你不知道自己是该感到好笑、高兴、恶心还是担忧。");
         }
         else if(_loc3_ == 18)
         {
            outputText("一股想要陪陪鲨鱼家人的念头涌上心头，你于是动身前往溪边，去那处安置着你水生子嗣的临时育儿处。然而路上，你听见营地里散落的巨石与岩块后方传来挣扎的声音；直到又听见一声轻轻的求救，你才急忙赶过去查看。");
            outputText("[pg]眼前的景象完全出乎你的意料；如果不是牵扯到你自己的女儿之一，甚至还会显得有点滑稽。");
            outputText("[pg]你看到一个鲨鱼女孩不知怎么把自己的手脚都缠进了你收起来的捆绑带里。她大概是急着躲开旁人的目光把这套东西穿上，结果只把自己缠成了一团无意间（又或者是有意？）形成的束缚，根本没法自行脱身。");
            if(get_player().cor > 50)
            {
               outputText("你露出一抹坏笑，俯身慢慢解开搭扣，取下束缚着她的带子，还特意用一种足以撩拨这个刚刚萌生捆绑癖的可怜女孩的方式来做。");
               outputText("等她终于被解开、重新站起身时，她呼吸急促，脸周围的灰色皮肤也因羞耻与兴奋而涨得通红。");
               outputText("你把刚取下的一条皮带在掌心啪地一抽，训斥她，提醒她拿别人的东西可能会招来严厉的惩罚。你故意拖长最后几个字，还用色眯眯的眼神看着她。她望着你，脸上混杂着害怕和兴奋；但还没等她开口，你就让她回溪边去了。");
               outputText("[pg]她离开时回头看了你一眼，就在那时，你又把皮带在掌心重重一抽，吓得她小声发出一声\"呀\"，随即转身逃走，消失在几块岩石后面。");
               outputText("你咧嘴一笑，心满意足地返回营地，觉得这段\"家庭时光\"过得很值。");
            }
            else
            {
               outputText("你不想让这个可怜的女孩更加难堪，便迅速而轻柔地解开带子，取下束缚住她的皮条。没过多久，她就重新站了起来，因羞耻和害怕即将挨训而低垂着头。");
               outputText("你确实简短而严厉地训了她一顿，告诉她不能未经允许就拿别人的东西。不过很明显，这女孩正在对捆绑产生某种癖好，而你也实在没什么立场去评判别人的特殊喜好。你认真告诉她，这没什么好羞耻的，但她真的应该等到自己再长大一些，而且身边有人能帮她摆脱——或者进入——这种状况时再说，比如男朋友或女朋友之类的？听到你最后这句鼓励，她顿时精神一振，飞快地抱了你一下，在你耳边低声道谢，然后便匆匆跑回溪边，和她的姐妹们会合去了。");
               outputText("[pg]你微笑着回到营地，知道这美好的家庭时光没有白费。");
            }
         }
         else if(_loc3_ == 19)
         {
            outputText("你动身前往溪流去看望你的孩子们，但才走到一半，就被伊兹玛和" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,252) > 1 ? "你的一个虎鲨人孩子" : "你的虎鲨人孩子") + "拦住了。直到她们走近，你才注意到伊兹玛皱着眉头，正揪着一只看起来非常懊悔的虎鲨人的耳朵往前拖。");
            outputText("[pg][say:太好了，正是我要找的[manboy]！]她把女儿推到身前，说道：[say:她一直在翻弄你的，呃，玩具，然后……好吧，就变成这样了！]你的女儿扭动着身子，用手捂住胯部。[say:给[him]看看！如果你还想把那东西弄下来的话！]伊兹玛命令道，你的女儿不情愿地照做了，她把手放回身体两侧，羞涩地转过头去，避免与你眼神接触。");
            outputText("[pg]你立刻就看出了问题所在，你女儿从你的收藏中“借走”的玩具是你的纯天然飞机杯！你凭经验知道这东西有自己的意识，需要持续供应液体才能保持“存活”，而它目前正试图从你女儿那尺寸可观的勃起物中吸取液体。[say:她跑来找我帮忙时，我试着把它撬下来，但这东西纹丝不动，我也不想弄伤她，]她担忧地看了你女儿一眼说道。[say:既然是你的东西，我就来看看你有没有什么办法能把它弄下来。]事实上，确实有办法，这是你在保养和使用它时学到的。");
            if(get_player().cor > 50)
            {
               outputText("虽然让这女孩受点罪也是她活该，但一想到这儿，你还是忍不住笑了，直到被伊兹玛眯起的眼睛打断。");
            }
            outputText("[pg]你把手伸进口袋，拿出商人卖给你这东西时给你的那瓶液体，用力捏住这生物的末端，让它的开口变大。然后，你把相当一部分液体倒进你女儿的阴茎和它的嘴之间的小缝隙里。它立刻肿胀起来，伴随着湿润的*吧唧*声，从你那如释重负、精疲力竭的孩子身上脱落下来。伊兹玛轻轻叹了口气，示意你的孩子回到溪边等她。你的女儿很乐意照做，一边离开一边揉着她酸痛的器官。");
            outputText("[pg]伊兹玛弯下腰捡起那个纯天然的飞机杯，好奇地检查着这个在消化食物时扭动、蠕动的肉块。她带着不安的表情把它还给你，转身跟上她的孩子，一边走一边摇着头，嘴里嘟囔着关于变态的事情。");
            outputText("当你回到营地时，你确保把这东西放在你那些好奇又好色的孩子们够不到的安全地方。");
         }
         else if(_loc3_ == 21)
         {
            outputText("你的" + (totalIzmaChildren() == 1 ? "女儿似乎" : "女儿们似乎") + "遇上了一只地精，并且随后把她揍到服服帖帖。" + (totalIzmaChildren() == 1 ? "她" : "其中一个") + "得意地踩在可怜地精酸痛的身体上，你亲眼看着这一幕，不禁为自己的后代感到骄傲。面对这个原本想袭击她们的家伙，" + (totalIzmaChildren() == 1 ? "小鲨鱼托着下巴陷入沉思" : "鲨鱼姐妹们开始彼此商量") + "，直到不久后，地精开口打破了沉默。");
            outputText("[pg][say:拜托，放我一马，成不？只要你们让我走，我就不会再来烦你们了……]");
            outputText("[pg]虽然她现在显然已经对任何人都构不成威胁，但你很清楚，这绝不会是她们最后一次被地精骚扰。伊兹玛也抱起双臂，看起来毫无同情。你可以教你的女儿" + (totalIzmaChildren() == 1 ? "" : "们") + "好好羞辱这些任性的小强盗，这也许能震慑其他人，免得他们以后再来烦你的孩子。");
            menu();
            addNextButton("支配",izmaKidsLolidom).hint("让那只地精明白她到底有多卑微。");
            addNextButton("算了",izmaKidsNoDom).hint("直接放她走。");
         }
         if((_loc2_ != 6 || !get_allowChild()) && _loc2_ != 21)
         {
            doNext(get_camp().returnToCampUseOneHour);
         }
      }
      
      public function izmaKidsNoDom() : void
      {
         outputText("[pg]你琢磨了一下这个主意，意识到其实没什么好处可图。还是把这个绿色祸害赶走吧，希望她会告诉自己的朋友，来这地方捣乱根本没意义。");
         outputText("[pg]你的女儿" + (totalIzmaChildren() == 1 ? "" : "们") + "也得出了同样的结论。很快，那个地精便踉踉跄跄地从哪儿来回哪儿去了。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function izmaKidsMenu() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_izma());
         outputText("伊兹玛带你来到溪流上一处偏僻的河湾；这里就是你的" + (totalIzmaChildren() == 1 ? "孩子选择" : "孩子们选择") + "安顿下来的地方。虽然他们已经拥有接近青春期前儿童的体格和心智，但距离他们完全长大、准备好离开你和伊兹玛，还需要好几年。");
         if(totalIzmaChildren() == 1)
         {
            outputText("有");
         }
         else
         {
            outputText("有");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,251) > 0)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,251) == 1)
            {
               outputText("一名鲨鱼女孩");
            }
            else
            {
               outputText(Utils.num2Text(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,251)) + "名鲨鱼女孩");
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,252) > 0)
            {
               outputText("和");
            }
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,252) > 0)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,252) == 1)
            {
               outputText("一名虎鲨人");
            }
            else
            {
               outputText(Utils.num2Text(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,252)) + "名虎鲨人");
            }
         }
         outputText("住在这里，是你与伊兹玛爱情的结晶" + (totalIzmaChildren() > 1 ? "" : "") + "。[pg]");
         menu();
         addNextButton("旁观",izmaKidsPlaytime).hint("和伊兹玛一起看孩子们玩一会儿。");
         addNextButton("玩耍",izmaPlayWithKids).hint("陪你的鲨鱼女儿" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,252) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,251) > 1 ? "们" : "") + "玩一会儿。").disableIf(get_player().fatigueLeft() < 20,"你太累了，没法陪你的女儿" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,252) + FlagDict_Impl_.arrayReadInt(KFLAGS.flags,251) > 1 ? "们" : "") + "玩。");
         addButton(14,"返回",izmaFollowerMenu);
      }
      
      public function izmaKidsLolidom() : void
      {
         clearOutput();
         outputText("你走上前，把手放在女儿的肩膀上，让她把注意力转向你。你向她" + (totalIzmaChildren() == 1 ? "" : (totalIzmaChildren() > 2 ? "和她的兄弟姐妹们" : "和她的姐妹")) + "解释说，如果想要保护自己的领地，就必须给这种捣蛋鬼一个狠狠的教训。仅仅是口头警告是远远不够的。");
         outputText("[pg][say:我们要怎么做，[Dad]？]小蓝鲨问道，脚依然紧紧踩在地精身上。你解释说，想想鲨鱼的天性是什么。小女孩好奇地揉了揉自己的胯部，得出了一个显而易见的结论。你点点头向她确认；这只地精需要明白什么是阿尔法！");
         outputText("[pg]受到你话语的鼓舞，你的女儿狡黠地笑了" + (totalIzmaChildren() == 1 ? "" : (totalIzmaChildren() > 2 ? "，而她的姐妹们则在一旁兴奋地看着" : "，而她的妹妹则在一旁兴奋地看着")) + "。地精注意到了你们的意图，并对这种情况表示抗议。[say: 等等，我对女孩没兴趣，更别说是小女孩了！]");
         outputText("[pg]鲨鱼女孩跪倒在地，将她的小穴紧紧压在受害者的嘴上，让地精闭上了嘴。你的女儿带着得意洋洋的笑容，一边扭动臀部，一边开始对她进行贬低。[say: 认清你的位置，<b>贝塔！</b>]");
         outputText("[pg]伊兹玛在一旁看着，看到女儿展现出阿尔法的一面，她兴奋不已。当然，从她" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,439) == 0 ? "坚挺的勃起" : "绯红的脸颊") + "来看，其中也夹杂着相当程度的兴奋。你女儿口中发出的每一声呻吟都会让伊兹玛" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,439) == 0 ? "的肉棒明显地跳动，使她" : "") + "焦躁不安地在原地挪动。" + (totalIzmaChildren() == 1 ? "" : "你的其他女儿" + (totalIzmaChildren() > 2 ? "们似乎" : "似乎") + "也有同感，渴望成为跨坐在入侵者身上的那个人。") + "地精尽其所能地前后摇晃，试图挣脱，但这种努力只会让她的嘴更用力地摩擦你女儿的小穴。");
         outputText("[pg]意识到这种无意的刺激，鲨鱼女孩戏弄她，[say: 对，就像个乖巧的小贝塔一样，把你的嘴伸进去！]看来她玩得很开心；鲨鱼以热爱支配而闻名。她更加用力地研磨，脸颊泛红，用无数贬低性的侮辱来攻击地精。接近极限时，你的女儿条件反射地抓住地精的头，将指甲深深地掐进那个绿皮婊子的头皮里。那看起来很痛。鲨鱼女孩仰起头，在性高潮的极乐中尖叫和欢呼，强烈的体验让她的眼睛湿润了。");
         if(get_watersportsEnabled())
         {
            outputText("[pg][say:我……我现在有点想尿尿了……]她说着，仍然喘不过气来。你在她起身之前拦住她，告诉她就待在原地放出来。她一时有些扭捏，拿不定主意。你说，这对她的贝塔来说会很羞辱，并解释这正是支配对方的真正象征。[say:嗯……你说得对，[Dad]！]你的女儿喊道，如今对这个主意更加热衷了。地精在恐慌中又挤出一股力气，试图把疲惫的鲨鱼甩下去，却毫无作用。年轻的鲨鱼深深叹了口气，释放出所有紧绷。液体灌满了不停抗议的地精的嘴，迫使她不得不吞咽，以免被呛死。");
         }
         outputText("[pg]你兴高采烈的小姑娘咯咯笑着，对她的“贝塔”说：[say:现在你知道谁才是阿尔法了吧。]她撑起身子，让地精逃走，随后伸了个懒腰，骄傲地站了起来。");
         if(totalIzmaChildren() > 1)
         {
            outputText("[pg]" + (totalIzmaChildren() > 1 ? "其他鲨鱼女孩都被刚才那一幕刺激得过于兴奋，一个接一个地嚷着：[say:下次，<b>我</b>要亲自把她们揍趴下！]最后演变成了谁最厉害的争吵。没过多久，你的女儿们就在草地上滚作一团，互相摔跤。孩子嘛，总归是孩子。" : "她的姐妹被刚才那一幕刺激得过于兴奋，嚷道：[say:下次，<b>我</b gonna be the one to beat them up!]而她的手足立刻反驳：[say:那你得先打赢<b>我</b>！]说完便走过去当面对峙。很快，这对姐妹就在一场热烈的摔跤里滚作一团。孩子嘛，总归是孩子。"));
         }
         outputText("[pg]伊兹玛把一只手搭在你的肩上，眼中满是骄傲与喜悦。[say:你是我能找到的最好的伴侣，我的阿尔法。]");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function izmaKidsLesbianWatch() : void
      {
         outputText("[pg]你告诉伊兹玛，她听起来有点犹豫。显然，如果你们想做称职的父母，就必须盯着她们以防万一。伊兹玛听出了你话里的暗示，脸红得更厉害了，但还是点了点头。你们俩找了个还算舒服的地方坐下，看着你们的女儿们继续她们的“实验”。");
         outputText("[pg]更仔细地观察这场青春期前的女同性恋表演，小鲨鱼女孩们似乎完全沉浸其中。她们用手抚摸着彼此身上每一个敏感的地方，当发现一个新的能让对方喘息或呻吟的地方时，就会兴奋不已。两个中稍微大一点的那个主动采取了进一步行动，开始在另一个的胸前到处亲吻。较小的女孩因此紧张起来，发出一声微小而充满愉悦和眩晕的尖叫。她的脸上泛着欲望的红晕。");
         outputText("[pg]然而，很少有鲨鱼会如此温顺，较小的那个很快就还以颜色；她把另一个拉回自己面前，再次深情拥吻，同时将腿在姐姐的胯部摩擦。随着这从玩耍越来越演变成彻底的性爱，她们的呻吟声也越来越淫荡……你转头看向伊兹玛，想看看她的反应。");
         outputText("[pg]伊兹玛全神贯注地盯着你们的女儿，" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,439) == 0 ? "甚至没有注意到自己坚挺的勃起，" : "") + "脸红得不能再红了。说好的“她们不会做任何真正与性有关的事”呢。至少她似乎和你一样享受这场表演。");
         outputText("[pg]姐妹俩现在紧紧相拥，以达到最大程度的肌肤接触，双腿在彼此的大腿间兴奋地摩擦着。" + (get_player().isFemale() && get_player().sexOrientation < 40 ? "目睹眼前的这一幕，让你产生了一种想要和你的爱人做同样事情的焦躁渴望。" : "") + "尽管个头较大的那个一开始看起来很自信，但她的呼吸比她妹妹要沉重得多，你怀疑她撑不了多久了。当她的欲望攀升至顶峰时，她紧紧抱住对方，尽可能用力地摩擦，希望自己不会输掉。不过，这得到了回报，她们的身体颤抖着，在半断半续的亲吻中齐声娇呼。你们的女儿在性爱后的余韵中喘息着躺下。你深吸了一口气，看着女儿们做爱的变态感席卷全身。如果有时间，也许你也应该发泄一下。");
         dynStats(DynStat.Lib(2),DynStat.Lust(20));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function izmaKidsLesbianLeave() : void
      {
         outputText("[pg]你接受了这是鲨鱼女孩的自然玩耍方式，决定随她们去。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function izmaKidsLesbianDemonstrate() : void
      {
         clearOutput();
         outputText("话虽如此，但如果你让女儿们自己玩，谁知道她们会做出什么事来。确保安全又有趣——对所有人来说，你特意指出，你的手在她的裙叶下飞快地滑过——的唯一方法，就是像只有" + get_player().mf("她们的父母","两位母亲") + "才能做到的那样去引导她们。她只花了一会儿就明白了，但你可以清楚地看到红晕爬上伊兹玛的脸颊[if (izmaherm){——以及她顶着裙子的勃起——}]，她默默地看着你们女儿越来越不单纯的玩耍。");
         outputText("[pg]" + (saveContent.lezDemonstration ? "你的每一次呼吸都让你更加担忧。刚才是不是太过火了？虽然她确实说过这无伤大雅……[pg]在感觉过了好几个小时之后" : "在你甚至还没察觉到她的动作之前") + "，伊兹玛的手滑进了你的手里，你牵着她走向你们的两个女儿。在父母突然出现时，她们俩都发出了惊讶的尖叫，立刻松开彼此并慌忙躲开，尽管她们涨红、喘息的脸庞让她们很难假装无辜。当你呼唤她们时，她们不情愿地走过来，嘴里已经嘟囔着道歉，同时[if (tallness < 60){避开你的目光|[if (singleleg) {站在你面前|在你[feet]排好队]}]。");
         outputText("[pg]当伊兹玛摸她的头时，你较小的女儿困惑地抬起头。[say:好奇心没什么好羞耻的，]她解释道，犹豫地看了你一眼[if (izmaherm){——尽管她那紧绷的肉棒清楚地表明了她脑子里真正在想什么}]。[say:而且我们，呃，希望你们能有最好的体验。]");
         outputText("[pg]带着这个想法，你[if (cor > 50){派了你的一个女儿去拿毯子，而另一个则紧张地看着。|回到你的[cabin]拿毯子，留下你困惑的女儿们和她们的母亲单独在一起。}]当[if (cor > 50){她回来|你回来}]时，两个鲨鱼女孩在彼此之间窃窃私语，偶尔偷看伊兹玛和你，尽管一旦[if (isnaked){伊兹玛脱下她的上衣和裙子|你们俩都脱掉衣服}]，她们很快就安静下来。四只饥渴的眼睛看着你铺开毯子并帮助伊兹玛躺下，你的女儿们在她们认为没人在看的时候，小心翼翼地靠近了一点。");
         outputText("[pg]看来你的小女儿们终究还是随了" + (get_player().cor > 50 || get_player().lib > 50 ? "你" : "伊兹玛") + "。");
         outputText("[pg]她们俩都安静地坐着，被你的嘴唇在她们母亲肩膀肌肉上游走的画面迷住了，只有当你拂过她的脖子时，她们才靠得更近，伊兹玛[if (izmaherm){的肉棒跳动着，}]高兴地颤抖着。当你的手指在她背部的肌肉线条上游走，轻轻挑逗她的尾巴，然后滑过她的肋骨时，她最初的任何犹豫都烟消云散了。当你继续向下，呼吸的温热短暂地拂过她的乳房时，她发出了满足——还是失望？——的呻吟，直到你的嘴唇停在她肌肉发达的腹部才停下来。");
         outputText("[pg]沉重的喘息声之后传来一声闷响，促使你飞快地瞥了一眼你的女孩们，结果发现她们已经用更亲身的方式投入了这堂课，彼此模仿着你的动作。或者……至少你是这么推测她们为什么会倒在地上的——两只鲨鱼都扭动着身体，试图够到对方的腹部。");
         var _loc1_:Array = ["体型较小的","体型较大的"];
         outputText("[pg]你的女儿们发现你在看后，脸变得更红了，但在你向她们招手时还是乖乖靠了过来，爬到颇为惊讶的伊兹玛身上，眼中毫不掩饰地流露着欲望。" + (saveContent.lezDemonstration ? "这是她们第一次有这种感觉吗？这" : "她们学得真好，这") + "让你为能亲自教导她们而感到骄傲。那只" + _loc1_[Utils.rand(int(_loc1_.length))] + "鲨鱼好奇地感受着你的" + (get_player().skin.tone == "rough gray" ? "熟悉的粗糙皮肤" : "[skindesc]") + "。当你的嘴唇拂过她的脸颊时，她羞涩地笑了笑；她的姐妹见状咯咯笑了起来——直到伊兹玛的手顺着她的大腿向上抚去，让她因欲望而扭动起来。");
         outputText("[pg]看来你们两个在该如何教导她们这件事上意见并不一致。");
         outputText("[pg]但这里你才是首领，所以你拂开伊兹玛的手指，把另一个女儿拉得更近。你不断给予她们爱抚，沿着她们的脸颊一路亲吻，又在她们唇上轻轻咬了一下才退开；她们脸红着，彼此不敢对视。不能再让她们继续了：现在轮到她们了。");
         outputText("[pg]你的女儿们向彼此伸出手，紧张得微微发抖。即便伊兹玛温柔地抚摸着她们的背，也没能让她们平静下来——直到她们的唇贴在一起，两只鲨鱼女孩沉进这个吻里，她们才忘了整个世界。忘了一切，只剩身旁的女孩——而当伊兹玛的双臂环住你，她的湿意清楚地贴上你的背时，你也发现自己很容易做到同样的事。");
         outputText("[pg]她的尾巴抽在你的[ass]上，发出一声脆响，立刻吸引了你女儿们的注意。她们眼中的炽热[if (cor < 30){有些令人不安，不过伊兹玛绕到你面前时，你很快就顾不上这些了|令人兴奋，不过伊兹玛绕到你面前时，你很难再把注意力集中在她们身上}]。下一秒，她便俯下身[if (!singleleg) {，在你分开双腿时稍稍停住，}]直到悬在你的入口附近，仿佛正等着你的命令。你的女儿们急忙来到她身旁，脸上满是惊奇；伊兹玛的指尖拂过你最敏感的肌肤，你的身体也随之颤抖。");
         var _loc2_:Array = ["大","小"];
         outputText("[pg]你点点头，伊兹玛热切地回应，埋首于你的幽谷，用舌头挑开你的阴唇，然后滑入其中。当她寻找你最敏感的部位时，你紧紧抓住[if (singleleg){她的头发|毯子}]，她温柔地拂过那些地方，但随后她那老练的动作变得有些不稳。你正纳闷[if (cor > 40){是什么让她停了下来|是不是出了什么问题}]，低头一看，却发现你" + _loc2_[Utils.rand(int(_loc2_.length))] + "女儿把她母亲挤到了一边，她的嘴唇在你的穴口周围游走，清理着你的淫液，她尽情吸吮着，那份热情完全弥补了她经验的不足。");
         outputText("[pg]当她擦过你的[clit]时，一股电流瞬间传遍全身，你的小女儿担忧地抬起头。[say:对不起，[Dad]，]她嘟囔着，你甚至担心她会哭出来。[say:我不是故意碰到它的。]");
         outputText("[pg]当你把她抱起来时，她的担忧烟消云散了。这只小鲨鱼在你的怀里放松下来，听你解释那其实感觉很好。虽然她一开始似乎并不完全相信，但当你的手指轻轻触碰她自己的阴蒂时，她发出了一声小小的呜咽，你猜她明白了。尤其是当你把她放下，她[if (!singleleg){又潜回你的大腿之间|又急忙回到她之前的位置}]，将你酸痛的阴蒂含入她温暖的口中，直到你在女儿的唇下扭动才停下来。单是她的热情就几乎足以让你达到高潮——而那几根犹豫着滑入你体内的小手指更是如此，当她的眼睛因惊讶而睁大时，你的身体紧紧地夹住了她的手。");
         outputText("[pg]也许你应该为你的女儿[if (cor > 50) {这么快}]就让你高潮而感到羞耻，但低头看着她那被你的汗水和爱液浸湿的可爱脸庞，你唯一想做的就是把她紧紧抱在怀里。她的温暖紧贴着你，当你抚摸她的尾巴时，小鲨鱼满足地叹了口气——至少在你的手指滑到她那早已湿透的穴口，而她迎合着你的手蹭动之前是这样，她很快就明白了如何获得快感。");
         outputText("[pg]但是……你的另一个女儿呢？她不见踪影，但就在你开始感到有些[if (cor > 50){恼火|担心}]的时候，你看到她的尾巴从满脸通红的伊兹玛双腿间露了出来。你猜，这下[i:真相大白]了。几秒钟后，你听到伊兹玛低声惊呼，紧接着，一个浑身湿漉漉的鲨鱼女孩从她母亲的身体上方探出头来。她迅速跑过去和她的姐妹会合，两人兴奋地窃窃私语着，跑到了你的[cabin]后面。");
         outputText("[pg]你怀疑她们俩今晚都睡不了多少觉了。");
         outputText("[pg][say:" + (saveContent.lezDemonstration ? "那真是……我不知道为什么我会怀疑你，阿尔法，" : "那真是……她们每次都在进步，") + "] 伊兹玛颤抖着叹了口气说道。[say:也许有一天我们可以" + (totalIzmaChildren() > 2 ? "教教其他的孩子" : "再生几个") + "？]");
         outputText("[pg]你只是给了她一个不置可否的微笑，[if (!isnaked){穿好衣服，}]留下这位慌乱的虎鲨人独处。");
         get_player().orgasm("Vaginal");
         saveContent.lezDemonstration = true;
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function izmaFollowerMenu() : void
      {
         var _g1:Camp;
         var _g:IzmaScene;
         spriteSelect(SpriteDb.get_s_izma());
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1082) == 0)
         {
            if(pregnancy.get_isPregnant() && pregnancy.get_incubation() == 0)
            {
               IzmaPoopsBabies();
               pregnancy.knockUpForce();
               return;
            }
            outputText("你呼唤伊兹玛，她走上前来问道：[say: 我的阿尔法，有什么吩咐？][pg]");
            switch(pregnancy.get_event())
            {
               case 2:
                  outputText("你不禁注意到，伊兹玛今天早上似乎非常恶心不适；她的脸色简直难看得发青。不过当你上前查看时，她却挥手让你别管，坚持说自己没事，只是有点肠胃不舒服。");
                  break;
               case 3:
                  outputText("伊兹玛走到你面前，看起来有些担忧。[say: [name]，你觉得我是不是长胖了？]她问道。你看着她，尤其是她双手捂着的腹部，不得不承认那里已经开始明显隆起，成了一个小肚子。看到她失落的表情，你提议说，也许她是怀孕了。听到这话，她顿时露出欣喜的神色。[say: 你真的这么觉得？]她满怀希望地问。你向她保证自己很确定；毕竟，她一直很会控制体重。伊兹玛高兴地吻了你一下，然后便去游泳了。");
                  break;
               case 4:
                  outputText("现在已经毫无疑问了：伊兹玛怀孕了。她显怀的速度比你记忆中村里任何一位准妈妈都要快，但她似乎也承受着同样的酸痛和不适。她变得倦怠又易怒，还抱怨自己再也穿不下以前的衣服。不过即便如此，她看起来还是很开心；她总是带着显而易见的骄傲抚摸自己的肚子。你还觉得，自己似乎注意到她比以前更频繁地向你投来\"过来嘛\"的眼神。");
                  break;
               case 5:
                  outputText("伊兹玛现在已经开始完全赤裸着到处走了。她坚称自己已经大到穿不下衣服，可你对此多少有点怀疑；她的体型确实和你村里那些快临盆的女人差不多大，但她们也都还能穿上衣服，而且她们的衣服可比比基尼加草裙这种组合要束缚得多。不过，你也不打算反对这番景色，而她显然也很享受这一点；在来到这个世界之前，你可从没想过鲨鱼尾巴也能在匀称的臀瓣上方摇得这么诱人……");
                  break;
               case 6:
                  outputText("伊兹玛确信孩子很快就要出生了。你也倾向于相信她；她现在已经大得惊人。她依旧不穿衣服，不过这确实有实际原因");
                  if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,439) == 0)
                  {
                     outputText("——你觉得她的裙子恐怕应付不了她现在如此频繁的勃起，她那根巨大的肉棒摩擦着");
                  }
                  else
                  {
                     outputText("，她的淫液沾湿了");
                  }
                  outputText("她隆起腹部的下侧……伊兹玛现在大部分时间都待在水里；她说这是为了舒缓皮肤。考虑到你见过她因为");
                  if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,439) == 0)
                  {
                     outputText("肉棒与腹部隆起之间的摩擦而喷得到处都是，你觉得这更像是为了避免一整天都被性液溅得满身都是。");
                     break;
                  }
                  outputText("大腿在移动时的摩擦而喷得到处都是，你觉得这更像是为了避免一整天都被性液溅得满身都是。");
            }
         }
         else
         {
            outputText("看到你走近，伊兹玛微笑着把书收了起来。");
            outputText("[pg][say: 有什么我能为你做的吗，阿尔法？]");
         }
         unlockCodexEntry(2054);
         get_akky().locationDesc("伊兹玛");
         menu();
         addButton(0,"外貌",izmaPearance).hint("查看这位虎鲨人的外貌。");
         addButton(1,"交谈",izmaTalkMenu).hint("和伊兹玛聊些事情。");
         if(get_player().get_lust() >= 33)
         {
            addButton(2,"性爱",izmaSexMenu).hint("和这位虎鲨人来一场欢爱！");
         }
         else
         {
            addButtonDisabled(2,"性爱","你还没有饥渴到会考虑那种事。");
         }
         addButton(3,"切磋",izmaSpar).hint("和你的鲨鱼恋人比试一下。").disableIf(pregnancy.get_isPregnant(),"她怀孕的时候切磋大概不是个好主意。");
         if(totalIzmaChildren() > 0)
         {
            addButton(5,"孩子",izmaKidsMenu).disableIf(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1082) != 0,"这只能在你的营地进行。");
         }
         addRowButton(1,"牙齿",gatASharkTooth).hint("向伊兹玛索要虎鲨牙。");
         addRowButton(1,"书籍",IzmaCampBooks).hint("和伊兹玛一起读书。").disableIf(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1082) != 0,"这只能在你的营地进行。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,439) == 0)
         {
            _g = this;
            addRowButton(1,"去掉阴茎",function():void
            {
               _g.removeIzmasPenis();
            }).hint("让伊兹玛为你去掉她的肉棒。" + (get_silly() ? "你为什么要这么做？因为你是神一般的[manboy]，就是这样。" : ""));
         }
         else
         {
            addRowButton(1,"变回扶她",izmaDickPrompt).hint("让伊兹玛重新长出她的肉棒。如果你选择这么做，她会相当感激你的。");
         }
         if(FlagDict_Impl_.arrayReadString(KFLAGS.flags,701) == "Izma")
         {
            addButton(9,"独自睡觉",noCuddle);
         }
         else
         {
            addButton(9,"依偎",izmaCuddle).hint("阿尔法也有温柔的时候。只是彼此相拥，就这样睡去一晚。").disableIf(get_time().hours < 19,"现在还太早，不适合依偎入睡。");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1077) == 1)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1082) == 0 && !pregnancy.get_isPregnant())
            {
               addButton(10,"农场工作",sendToFarm);
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1082) != 0)
            {
               addButton(10,"回营地",backToCamp);
            }
         }
         if(get_player().get_upperGarment() == get_undergarments().SEA_SHIRT && get_undergarments().SEA_SHIRT.knownBound() && !get_undergarments().SEA_SHIRT.saveContent.izmaAsked)
         {
            addRowButton(2,"诅咒衬衫",askIzmaAboutNobleShirt).hint("你是在湖边发现它的，也许她知道些什么。");
         }
         if(get_player().hasKeyItem("Old Manor Books"))
         {
            addRowButton(2,"赠送书籍",giveManorBooks).hint("把你在旧庄园找到的那些书转交给她。");
         }
         _g1 = get_camp();
         addButton(14,"返回",function():void
         {
            _g1.campLoversMenu();
         });
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1082) == 1)
         {
            addButton(14,"返回",get_game().farm.farmCorruption.rootScene);
         }
      }
      
      override public function izmaFollower() : Boolean
      {
         return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,238) == 1;
      }
      
      public function izmaDomsLatexyPartI() : void
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,785) == 0)
         {
            clearOutput();
         }
         else
         {
            outputText("[pg]");
         }
         outputText("伊兹玛一边撸动自己勃起的肉棒，一边低吼道：[say: 对，就是这样，你喜欢吧，墨液荡妇？]");
         outputText("[pg][latexyname]咬着下唇，");
         if(get_latexGirl().gooObedience() > 50)
         {
            outputText("急切地");
         }
         else
         {
            outputText("羞怯地");
         }
         outputText("点了点头，随着这份承认，她手腕周围又涌出几滴新鲜的湿液。");
         outputText("[pg][say: 哦，真的吗？]伊兹玛调笑道，[say: 我早该知道的。]虎鲨女孩皱了皱鼻子，继续说道：[say: 你身上的贝塔味儿简直都能闻出来。我敢打赌，你以前还是个史莱姆娘的时候，肯定幻想过自己被困在瓶子里，供扶他和男人随便操，对吧？]伊兹玛用脚趾拨了拨你那黏液荡妇鼓胀的黑色");
         if(FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,667) > 0)
         {
            outputText("肉棒");
         }
         else
         {
            outputText("阴蒂");
         }
         outputText("，惹得这个顺从的女人愉悦地倒抽一口气。");
         outputText("[pg][latexyname]一边浑身发颤，一边把手在自己体内进进出出。她整条前臂都滴着乌黑的湿液，那阵阵黏腻的水声从你观看的位置也能听得一清二楚。[say: 是的……我是个淫荡又顺从的女孩……能把你的精液给我吗，伊兹玛女主人？求你了？我表演得这么卖力呢！]");
         if(get_latexGirl().gooObedience() < 50)
         {
            outputText("她刚一说出口，脸上就闪过一丝懊恼，仿佛她其实并不想把这话说得这么坦率。");
         }
         else if(get_latexGirl().gooObedience() <= 80)
         {
            outputText("话一脱口而出，她脸上立刻闪过一丝矛盾的神情，但已经收不回来了。");
         }
         else
         {
            outputText("话音刚落，她眼中便闪过饥渴的神色，还贪婪地舔了舔嘴唇。");
         }
         outputText("一次格外用力的深入让[latexyname]呜咽起来，她的眼睑颤抖着合上，叫道：[say:噢，[name]！]");
         outputText("[pg]看着你的贝塔和你顺从的前黏液女一起满足彼此的需求，你满意地笑了。面对[if (metric) {将近四十厘米|十五英寸}]的条纹肉棒，[latexyname]依旧在幻想着你，这让你颇为自豪。");
         outputText("[pg][say:够好了，骚货，]伊兹玛在粗重的喘息间低声哼道。她把自己肿胀的鲨鱼肉棒拍在黑肤女人饥渴的脸上。[latexyname]惊讶地喘了一声，那震惊的表情已经说明了一切，直到那根赤红的勃起物猛地插进她毫不抵抗的嘴唇。液态的、" + FlagDict_Impl_.arrayReadString(KFLAGS.flags,658) + "眼睛惊讶地向上望去，随后又满足地颤动着合上。伊兹玛的手抚过一缕滑腻的乳胶发丝，迫使自己更深地进入这个湿润的前黏液女喉中。墨黑的湿液从肉棒边缘滚落，把她那长着四颗睾丸的囊袋染成黑色，随后在其表面冷却、硬化。");
         outputText("[pg][latexyname]伸出双手摸向那滑溜、被鞘膜包裹的四颗睾丸，一边努力榨取它，一边含着那撑开喉咙的鼓胀发出低哼，轻柔地轮流挤压每一座精液工厂。伊兹玛将一条腿勾到[latexyname]肩上，开始粗暴地操弄这位黑玉般的美人。她以粗野的抽插将自己的肉棒一路顶到底，把整整[if (metric) {三十八厘米|十五英寸}]全都捣进史莱姆娘的深处；唯一的声音，只有被半堵住的愉悦哼声，以及伊兹玛的胯部顶到伴侣贪婪嘴唇上时发出的炽热水声。");
         outputText("[pg][say:噢，操，别吸得这么狠，]伊兹玛试图命令她，可听起来更像是在哀求。");
         if(get_latexGirl().gooObedience() / 5 + get_latexGirl().gooFluid() / 5 + Utils.rand(20) < 10)
         {
            outputText("[Latexyname]变得更加贪婪，吸得更用力，双颊因吮吸的饥渴而深深凹陷。你能看见它们随着有节奏的脉动被撑开，又变得更加内陷，紧紧真空般裹住那根红橙色的肉棒。伊兹玛呻吟着想要抽出来，可她才勉强抽出[if (metric) {几厘米|一英寸}]，整根又被响亮地吸了回去。鲨鱼女孩一次又一次试图把这个饥渴淫荡的小黏液女从自己身上撬开，但每一次，她最终都只是再次被感官十足地吞噬。[latexyname]又欣赏般捏了捏她的四颗睾丸，伊兹玛的眼睛顿时翻了上去，面对这饥渴骚货惊人的口技，她再度无力抵抗。");
            outputText("[pg][say:要、要、要射了！噢噢，诸神在上，爽！嗯啊！]伊兹玛叫道，她的臀部开始无力地向那黑玉般的牢笼顶动，把[latexyname]的嘴唇压进自己结实的腹部。包裹在她囊袋外的光滑乳胶鞘颤抖起来，随着伊兹玛的睾丸紧紧收缩而皱起；接着，[latexyname]便发出响亮的咕噜声，揉弄着那四座精液工厂，让它们把货物直接灌进她喉咙里，喂给她渴望的温热浓稠精液。她们就这样锁在一起足有一分钟以上，伊兹玛偶尔想说话，但多半只是被榨干每一滴时满足地含糊呢喃。");
            outputText("[pg]突然，这个有条纹的双性人瘫靠在一块岩石上，她被榨空的肉棒从[latexyname]喉咙收紧的束缚中滑出，发出湿润的啵声。那根猩红的肉棒被一层正在硬化的乳胶外壳包裹着，你不得不承认，这样很适合她。伊兹玛叹了口气：[say:你这不听话的骚货……]随后摇摇晃晃地站起身。她指了指自己光亮的黑色肉棒，评论道：[say:看来这模样确实挺适合我。]");
            outputText("[pg][latexyname]开心地咧嘴笑了，仰躺下来晒着太阳，开始消化她的“餐点”。");
         }
         else
         {
            outputText("[latexyname]顺从地放松下来，让这个双性人更有效地掌控局面。[say:好姑娘，]伊兹玛一边说道，一边从那饥渴吮吸的口洞中抽出自己，她的肉棒覆着一层新鲜湿润的乳胶鞘，闪闪发亮。[say:屁股抬起来，骚货。今天要用栓剂的方式喂你！]");
            outputText("[pg][latexyname]一秒钟就摆好了姿势，开始把屁股来回摇晃。光线映在那两团黑玉般的圆臀上，你完全能理解为什么伊兹玛立刻就像活塞一样直直插进那朵乳胶菊蕾——那确实是一幕迷人到足以催眠肉棒的景象。她刚一顶到底就闷哼出声，随后绷紧身体，硬是从那真空般紧锁的肛门密封中拔了出来，喘着气。[say:你那里也会吸？！]伊兹玛惊奇地低吼，但她很快又把自己推了进去。[say:我操你的时候就给我好好吸。用不了多久，我就要在你屁股里射一大泡，肉棒奴隶。]");
            outputText("[pg]伊兹玛一次又一次把臀部拍向[latexyname]紧窄的后门。每当她抽出来，身上都会裹上更多液态乳胶，有些溅在她的臀上，有些在她肉棒上成形。就连环绕她睾丸的墨黑湿液也逐渐变厚，形成更实在的一层包覆。很快，她每次顶到底都会发出闷哼；从她那因快感而张开的嘴里垂出的舌头来看，她肉棒所承受的感觉必定超乎想象。伊兹玛突然发出一声含混的咕噜，将自己整根插到底，喘息着喊道：[say:嗯啊，就……就要来了！接住！接住它，骚货！]");
            outputText("[pg]包裹着她睾丸的鞘膜轻微皱缩，随着收缩，把只能称作洪流的咸腥鲨鱼精液直接泵进黏液妞宽敞的后穴。两个女孩都在狂喜中呻吟。你这才后知后觉地意识到，从她抬起屁股开始，[latexyname]的手臂就一直插到自己小穴里，深到手肘，一边让自己高潮，甚至可能是在自己体内给谁打手枪。黑曜石般的淫液不受控制地沿着她的手肘淌下，滴落到地上，这个黑肤女人高潮了。与此同时，伊兹玛仍紧紧贴在她诱人的臀瓣上，眼睛在眼眶里半翻着，彻底沉溺于那份正在打磨她肉棒的极乐之中。");
            outputText("[pg]突然，这个有条纹的双性人瘫靠在一块岩石上，她被榨空的肉棒从[latexyname]屁股里收紧的束缚中滑出，发出湿润的啵声。那根条纹肉棒被一层正在硬化的乳胶外壳包裹着，你不得不承认，这样很适合她。伊兹玛叹了口气：[say:好姑娘……]随后摇摇晃晃地站起身。她指了指自己光亮的黑色肉棒，评论道：[say:看来这模样确实挺适合我。]");
            outputText("[pg][latexyname]开心地咧嘴笑了，仰躺下来晒着太阳，开始消化她的“餐点”。");
         }
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,785,FlagDict_Impl_.arrayReadInt(_loc1_,785) + 1);
         FlagDict_Impl_.arrayWriteFloat(KFLAGS.flags,664,100);
         dynStats(DynStat.Lust(20 + get_player().lib / 10));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function izmaDomsLatexy() : void
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,785) == 0)
         {
            outputText("[pg]营地边缘传来熟悉而淫荡的喘息声，你有些不情愿地走过去查看。沉重的喘息中夹杂着几声愉悦的呻吟，一声比一声尖细；等你绕过一块岩石，映入眼帘的是赤裸的伊兹玛，她手里攥着一根绳子，而绳子正套在[latexyname]身上。那个史莱姆娘一只手插进自己湿滑的小穴里，正忙着为鲨鱼女孩的取乐而拳交自己。");
            menu();
            addButton(0,"阻止",stopIzmaLatexy);
            addButton(1,"观看",izmaDomsLatexyPartI);
         }
         else
         {
            clearOutput();
            outputText("当你让伊兹玛去喂饱[latexyname]时，鲨鱼女孩顿时欣喜若狂，她那根[if (metric) {三十八厘米|十五英寸}]的肉棒立刻从裙叶间挺刺出来，硬得无以复加。她匆匆吻了你一下，随即小跑着赶往[latexyname]所在的营地。她的尾巴一路愉快地摇摆着，你注意到她已经开始解开裙子，准备去迎接那个与你同住营地、皮肤漆黑的奇特女人。你跟了上去，欣赏着爱人那条纹分明、肌肉紧实的屁股来回摇晃。伊兹玛的大腿早已因兴奋而湿润，没过多久，她便绕过一块岩石，来到了[latexyname]面前。");
            outputText("[pg]你加快脚步，急着跟上去看这场好戏；等你绕过岩石时，已经看见伊兹玛用绳索套住了史莱姆娘的脖子，把她牵得服服帖帖。");
            outputText("[pg][say: 继续，你得让我想用你才行！]伊兹玛一边说，一边缓缓抚摸着自己的肉棒。她毫不掩饰地俯视着那个皮肤乌黑发亮的荡妇，可怜的项圈女人不情不愿地分开自己光亮的肉缝，将拳头一点一点、一节指节一节指节地送进自己那容量惊人的下体里。等她的手腕也消失进去后，没过多久她便又将手抽出，因意外的快感而喘息起来。一缕缕漆黑的润滑液在她的手指与被撑开的穴口之间摇摇欲坠，眼看就要断开，直到[latexyname]的手再次没入那漆黑的蜜壶中。");
            izmaDomsLatexyPartI();
         }
      }
      
      public function izmaDickToggle() : void
      {
         var _loc1_:int = 0;
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,439) == 0)
         {
            outputText("你潇洒地拿出五瓶乳白黏稠的恶魔乳液，玻璃瓶在微风中愉快地叮当作响。伊兹玛皱起眉头，但还是从草裙里迈了出来，嘟囔道：[say:如果我非得失去它，至少也想好好跟它道个别。]草裙湿乎乎地堆在地上，你把第一瓶递给伊兹玛。她做了个鬼脸，但还是拔开了瓶塞。她仰头大口吞下液体，喉咙上下滚动，瓶子很快就空了。");
            outputText("[pg][say:啊啊，]伊兹玛带着满足的语气说道，随即又反应过来。她刚才是喜欢上那个味道了吗？虎鲨女孩颤抖起来，开口问道：[say:是不是有点热……？哦……只是我自己觉得热，对吧？]");
            outputText("[pg]你点点头，悄悄注意到一缕湿意正顺着女孩橙红色的大腿流下，迅速滴向地面。第二瓶并没有像第一瓶那样招来抗议；倒不如说，伊兹玛似乎很急切地想从你手里接过去。转眼间，瓶塞被拔掉，瓶口贴上了她的双唇。伊兹玛又深又快地喝着，远比上一剂更快地喝完了这瓶乳液。她把空瓶往肩后一扔，淫靡地呻吟起来，双手捧住自己的乳房，而下方则有[if (metric) {厘米|英寸}]的长度消失不见。细小的白浊液滴从逐渐缩小的肉棒上渗出，同时，被睾丸撑胀的阴囊下方也流下一道道透明的液体。");
            outputText("[pg]等她平静下来时，你发现伊兹玛已经汗流浃背。你把剩下的瓶子递过去，她一把从你手中抢走一瓶。鲨鱼女孩低吼道：[say:你可没说过这东西会这么好喝！]然后便仰头猛灌。她几秒钟就喝完了，立刻又从你手里抢走下一剂。她的肉棒正在缩小，乳头正在变硬，还在向泥土里射出几股无力的精液，但这丝毫没有减缓她的吞咽。倒不如说，伊兹玛似乎更加渴求这些饮品。第四瓶在几秒内消失，而伊兹玛全身都明显颤抖起来，仿佛陷在高潮之中。");
            outputText("[pg]空玻璃瓶从你的贝塔无力的指尖滑落，在地上摔得粉碎；她也随之倒下，开始轻轻扭动。她的阴茎如今只剩下[if (metric) {十厘米|四英寸}]左右，变成了一根可悲的小东西，只配在彻底臣服的景象中，把白浊滴得到处都是，沾满她不断收缩的阴囊。透明的女性淫液溅在她的大腿上，伊兹玛发狂似的揉弄着自己的乳房，摇晃的乳肉似乎比变化前稍微大了一些。她喘息着：[say:嗯嗯……还要……还要……快完成它……求你。]");
            outputText("[pg]你温柔地用手托住伊兹玛的头，把最后一份变形液体倒进她嘴里。她吞咽着，肉眼可见地颤抖起来；刚一喝完，她就喊道：[say:操——太爽了！]她的阴茎连同睾丸和阴囊一起缩回体内。你第一次得以清楚完整地看见她微微鼓起的小穴和硬挺的阴蒂。她剧烈高潮，爆发般喷出的女性淫液从[foot]一路溅到你的脸上。你叹了口气，把脸擦干净。");
            outputText("[pg]淫液一波接一波地喷涌而出，如今她的转变已经完成，曲线丰满的女性身下很快扩开一大滩淫液。她在高潮中语无伦次地胡言乱语，巨大的乳房随着每一阵席卷全身的高潮波动上下弹跳。她的乳头似乎更大了一些；你注视着她时，她的阴蒂也鼓胀起来，大小或许翻了一倍，不过仍然只有[if (metric) {不到两厘米|远不到一英寸}]长。她过了好几分钟才从高潮中缓过来，随后便昏了过去。");
            outputText("[pg]你把她抱到溪边，让她保持湿润，并照看了她半个小时，直到她醒来。伊兹玛睁开眼睛后说道：[say:啧，其实也没那么糟。要是“纯粹”的女人都是这种感觉，也许我能习惯。]伊兹玛的尾巴调皮地来回摇摆，溅起大片水花，同时提议道：[say:如果哪天我又被允许拥有阴茎了，记得告诉我，好吗？]你叹了口气，答应下来。<b>伊兹玛现在已经完全变成女性了！</b>");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,439,1);
            _loc1_ = 0;
            while(get_player().hasItem(get_consumables().P_S_MLK) && _loc1_ < 5)
            {
               get_player().consumeItem(get_consumables().P_S_MLK);
               _loc1_++;
            }
            while(get_player().hasItem(get_consumables().SUCMILK) && _loc1_ < 5)
            {
               get_player().consumeItem(get_consumables().SUCMILK);
               _loc1_++;
               dynStats(DynStat.Cor(1));
            }
            statScreenRefresh();
         }
         else
         {
            outputText("你朝伊兹玛露出微笑，告诉她可以重新长出阴茎。她欢呼得太激烈，眼镜都差点飞出去：[say:太好了！]这个身带黑色条纹的女孩翻进自己的箱子，拿出一片奇怪的药片，在你改变主意之前就塞进嘴里。她用力咀嚼，几秒钟就吞了下去。伊兹玛捧住自己流着淫液的小穴，发出呻吟；一根鲜红的雄性肉棒慢慢把她的手掌从身体上顶开。它每一秒都在变大，很快超过[if (metric) {十五厘米，接着二十厘米，再到二十五厘米|六英寸，接着八英寸，再到十英寸}]，直到恢复到过去的大小才停下。一秒后，一个球形突起垂落下来，把一片新长出的皮肤撑满。啪嗒！另一个也跟着落下。最后，又有两颗圆球从她体内落进新生的阴囊里。<b>伊兹玛又变回双性了！</b>");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,439,0);
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function izmaDickPrompt() : void
      {
         clearOutput();
         outputText("你确定要让伊兹玛重新长出肉棒吗？");
         doYesNo(izmaDickToggle,izmaFollowerMenu);
      }
      
      public function izmaDaughterSecondhand() : void
      {
         clearOutput();
         outputText("你领着女儿来到一块适合倚靠的岩石旁，然后尽力把你能想到的解释都讲给她听。小女孩全神贯注地听着你细说那些[if (ischild) {长辈给你的|你童年时得到的}]建议、你后来学到的事，甚至还有一些你自己的经历。");
         outputText("[pg]你尽力让她明白，你所说的这些有多重要。玛瑞斯是一片对性高度痴迷的土地，而她[if (cor < 30) {应该尽力警惕潜在的危险|[if (cor < 60) {如果想保护好自己，就需要尽可能多地了解这些|有权知道自己将要面对什么}]}]。小鲨鱼女孩听你说这些时连连点头，她眼中的神情让你相信她确实把这些话放在了心上。又过了几分钟，你才把想说的都说完；到最后，你竟然也觉得有点累了。");
         outputText("[pg]你的女儿向你道谢，挥了挥手，然后一头扎回水里，[if (kids > 1) {朝她的姐妹们游去|转眼间就游远了}]。看着她似乎成长得很不错，你忍不住露出一个[paternal]的微笑。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function izmaDaughterFirsthand2() : void
      {
         clearOutput();
         outputText("你把这个青春期前的小女孩带到一块大而平坦的岩石旁，这块石头看起来被太阳晒得足够温暖舒适，然后你让她躺下。她潮红的皮肤和沉重的呼吸清楚地表明了她有多么情愿，但你还是花了一点时间来欣赏她——她纤细的手臂、平坦的胸部和娇小的身躯。她看起来既天真又诱人，这种混合的气质很快让你恢复了完全的准备状态。");
         outputText("[pg][say:来吧，[Dad]，]她呻吟着，你不会拒绝这样的邀请。你加入她，以最快的速度将你的[cock]抵在她的入口处。你之前服侍的残留物与她新的性奋混合在一起，让你更容易将龟头压在她的阴唇上并推入。伴随着一声轻柔的痛呼和少量的血液流出，你停了下来，只是抚摸着她的脸颊，直到她的呼吸再次变得平稳。");
         outputText("[pg]最终，她对你点了点头，你在她体内湿滑的帮助下继续。你的阴茎立刻遇到了她种族特有的蠕动触手，但与你之前的经历不同，它们似乎有些不协调。然而，它们用活力弥补了经验的不足。它们对你[skinshort]充满活力、几乎是杂乱无章的攻击让你几乎忘记了移动，但你希望这对你们俩来说都尽可能地美好。");
         outputText("[pg]考虑到这一点，你将一只手伸向她的阴蒂，另一只手覆上她的乳房。对于前者，你小心翼翼地避免过度刺激，但对后者，你则肆意挑逗，随心所欲地揉捏、抚摸和轻掐。几乎在同一瞬间，你感觉到她的下体一阵紧缩，她发出一声短促的娇呼，背部弓起，差点咬到自己的舌头。");
         outputText("[pg]但尽管她显然已经高潮了，她还是很快与你四目相对，那无声的恳求清楚地表明她仍然希望你继续。你不需要任何鼓励，随着身体的升温和思绪变得越来越单一，你的臀部开始动得越来越快。你娇小美丽的女儿躺在你面前，微笑着接纳你的全部，你能感觉到自己已经非常接近顶峰了。");
         outputText("[pg]她一定感觉到了你在她体内跳动，因为她伸出双臂想要你的拥抱，而你欣然接受。她粗糙的肌肤和滚烫的体温足以将你推过临界点，而释放出来则是世界上最美妙的感觉。你能感觉到全身都在脉动，你开始将精液注入她体内，同时亲吻着她的耳朵。从她肉壁的紧致挤压中，你能感觉到她也高潮了。");
         outputText("[pg]你将女儿紧紧抱在胸前，尽量不弄疼她，同时在下面继续抽插。你能感受到她的爱，不仅体现在她欣然接受你的精液，还体现在她的触手不断抚摸着你。你尽力回报她，将她填满，甚至更多，直到你能感觉到精液从你们结合的地方滴落。你几乎在想你是不是要抱孙女了，尽管她还太小。无论如何，你的担忧很快就被高潮后的迷离感所吞噬，你瘫倒在女儿身上。");
         outputText("[pg][say:" + get_player().mf("爸……爸爸","妈……妈妈") + "，你好重，]她说道，尽管她的双臂依然环抱着你。你们俩就这样依偎着休息，直到你恢复了力气，她也没有再抱怨。即使你已经能动了，你还是和她多待了一会儿，在她耳边轻声诉说着你有多爱她。这个小鲨鱼女孩似乎对这番话比你们之前做的任何事都要感到害羞，但她还是克服了脸红，说道：[say:我也爱你，[Dad]。]");
         outputText("[pg]随后，你再次起身，开始寻找你的[armor]。你的女儿在潜回水中向上游游去之前，最后向你挥了挥手。你忍不住注意到她的鳍在水流中微微颤抖，这是你专业手法的余韵。");
         get_player().orgasm("Dick");
         _temp_1.sharkgirlsDeflowered += 1;
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function izmaDaughterFirsthand() : void
      {
         clearOutput();
         outputText("你告诉你的女儿，你很乐意向她展示任何她想看的东西。");
         outputText("[pg][say:展-展示？]她问道，看起来既不确定又兴奋。你再次肯定了你的话，牵起她的手，享受着她的小手指与你的手指交织在一起的感觉。当你把她带到河岸边一个诱人的地方时，她非常温顺，尽管她尾巴的抽动让你知道她的真实感受。");
         outputText("[pg]到了那里，她看起来很不确定该做什么，所以你坐下来拍了拍你的大腿，欢迎她加入你。她照做了，你用你的[arms]环抱住她，立刻引出了一声轻笑，随着你开始施展你的魔力，这笑声变成了一半的呻吟。");
         outputText("[pg]她的皮肤看起来很光滑，但摸起来却出奇的粗糙，你花了几分钟时间只是用手在上面抚摸。尽管有轻微的摩擦感，但这种质感令人着迷，你发现自己完全沉浸在抚摸中。你的女儿似乎也一点都不介意，随着你探索她的身体，她开始发出高亢的轻声呻吟，她的皮肤摸起来越来越烫。");
         outputText("[pg]她看起来[i:非常]准备好了，但你还是想把这件事做好。你让你的手慢慢向下滑动，如此不露痕迹地向目标移动，以至于她甚至没有注意到，直到为时已晚，你的手指已经拂过她的阴唇。即使是最轻微的接触也足以让她因为你给了她多少前戏而颤抖，所以你确保慢慢来，只有当你确定她准备好接受你的爱时才继续你的动作。");
         outputText("[pg]当你深入其中时，你发现她是一个非常愿意回应的人。你手指的每一次抽动，每一个微小的动作都会让她全身颤抖，你非常享受看到用不同的技巧能对她产生什么样的影响。然而，她的经验不足证明了这一点，没过多久，一阵明显的颤抖就标志着她达到了高潮。你小心翼翼地继续抚摸她，给你的女儿你能给的最好的高潮。");
         outputText("[pg]从她的表情来看，你认为这感觉相当不错，尽管她可能没有太多可以比较的经验。尽管如此，你还是为这个年轻的鲨鱼女孩脸上完全幸福的表情感到自豪，紧紧地抱着她，直到她看起来稍微恢复了意识。");
         outputText("[pg][say:哦-哦，]她说，[say:嗯，谢-谢谢你，[Dad]……但是……]她花了几分钟时间只是呼吸。[say:我们能再多做一点吗？]她问道，脸红得厉害。你对她的主动感到惊讶，也对她已经准备好进行下一轮感到惊讶，但你认为这只是她作为鲨鱼的活力。");
         outputText("[pg]当你感觉到一只手放在你的[chest]上时，你开始把你的臀部靠得更近。抬起头，你看到她的脸红得更厉害了，但在那之下是一种正在建立的决心。[say:你能教我怎么，呃，回报你吗？]她问道，眼中燃烧着热情的火焰，让你为成为她的[father]而感到自豪。");
         outputText("[pg]嗯，你对此当然没有任何抱怨，所以你向后退去，向你的女儿露出你的胯部。她翻身跪下，爬了上来，脸上带着惊奇的表情检查着你的[cock]。" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,252) != 0 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,439) == 0 ? "她以前一定见过她" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,252) != 0 ? "姐姐" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,252) > 1 ? "们的" : "的") : "妈妈的") + "，但即便如此，" : "你不确定她以前是否见过，所以") + "她的期待是显而易见的。");
         outputText("[pg][if (cocklength < 5) {尽管你的长度并不惊人，但她|她}]的小嘴看起来不够大，无法进行适当的口交，而且你不确定她是否准备好了。一想到一个经验不足的女孩有那么锋利的牙齿，你就不禁打了个寒颤，但你把这个想法抛在脑后，指示鲨鱼女孩先用手握住它。");
         outputText("[pg][say:像这样吗？]她问道，兴致勃勃地开始了这个任务。她的小手滑过你的根部，你很高兴地发现它们比她身体其他部分的皮肤柔软得多——几乎像天鹅绒一样。在你的指导下，她非常缓慢地开始抚摸你的男子气概，她的手指在你的皮肤上游走，让你的脊背一阵阵发麻，感觉奇妙极了。尽管如此，你还是忍不住渴望更多。在她看起来完全适应之后，你告诉她，如果她愿意，她甚至可以用嘴。");
         outputText("[pg]她默默地凑上前，伸出舌头，在你的长度上长长地、缓慢地舔舐着。这时，你忍不住呻吟起来，你的女儿似乎很高兴能从你那里得到可以听到的反应。她继续她的动作直到完成，她在你龟头顶端发现的那滴预精液对她来说就像水中的血一样，她开始在你的肉棒上疯狂地舔舐。她的舌头在你的[skinshort]上起伏跳跃，让你在心跳间濒临高潮。");
         outputText("[pg]在你阻止她之前，她设法把整个[cockhead]含在嘴里，紧闭双眼，双手尽力让你射出来。事实证明，你根本不需要太多刺激，当她的舌头在你的龟头周围游走时，你的第一股精液就开始喷射到她的嘴里。当你射精时，小鲨鱼紧紧地贴着你，高兴地接受你所能给她的一切。你对她屏住呼吸的能力有了新的认识，她吸吮着你，直到最后一次抽动，你的高潮终于结束。");
         outputText("[pg]当她的嘴离开你的肉棒时，她咳嗽了一下，吐在手里。看来吞咽对她来说还是有点困难，但对于她这个年纪的人来说这很正常。你引起了她的注意，并表达了你的感激之情，作为回应，你得到了一个灿烂的笑容。");
         outputText("[pg][say:谢谢，[Dad]！其实还挺好玩的……但我们能再做点别的吗？]");
         outputText("[pg]你突然意识到，你可能很难跟上这个鲨鱼女孩的体力，但在这种时候你可不是会退缩的人，你把她带到了一个更合适的地方。");
         get_player().orgasm("Dick");
         doNext(izmaDaughterFirsthand2);
      }
      
      public function izmaDaughterEscape() : void
      {
         clearOutput();
         outputText("你迅速解释说，她年纪还太小，她母亲可以告诉她更多，而你现在确实还有别的地方要去。她脸上短暂地露出困惑的神情，但在你立刻离开河水、匆忙把自己擦干时，她似乎还是接受了这个说法。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function izmaCunnilingus() : void
      {
         clearOutput();
         outputText("虽然你是她的阿尔法，但这并不代表你不能时不时给你的鲨鱼恋人一点疼爱。考虑到她最近一直这么乖，你觉得她值得一份奖励。幸运的是，你心里正好有个完美的奖励——一种能让赠予者几乎和接受者一样愉悦的东西。");
         outputText("[pg]你用坚定的语气命令她脱掉裙子，然后仰面躺下。她的脸上有一瞬间掠过困惑，但她压下了这股冲动，只是简单地回应道：[say:是，我的阿尔法，]随后照你说的做了。她修长柔韧的双腿向前伸展，展露出她辛苦锻炼出的、属于游泳者的紧实肌肉。");
         outputText("[pg]面对这样的景象，你忍不住俯身而下，将她揽进怀里，抚摸着她粗糙的皮肤。那触感或许并不算最令人愉快，但一想到这一切都属于你，就已经足够让人满足。你开始动作时，伊兹玛用一只手臂撑起身子看着你。你轻柔地按摩着她，她唇边逸出一声低低的呢喃；从她半阖的眼神中你看得出来，根本不需要劝说——她已经准备好任你摆布了。");
         outputText("[pg]你同样迫不及待，于是把一只手按在她结实的腹肌上，将她推回地面，[if (singleleg) {压在|跨坐在}]她的尾巴上。她刚想问你什么，但你根本没在听，你的目光早已锁定在即将据为己有的奖赏上。你猛地分开她的双腿，打断了她的话，引出一声惊慌的[say:呀]，这声音完全不像一个骄傲的虎鲨人该发出的。");
         outputText("[pg][say:阿、阿尔法……你要做什——]");
         outputText("[pg]你的舌头替你回答了她，在她入口正上方[if (izmaherm) {、肉棒下方}]缓缓舔过，用近在咫尺的距离挑逗着她。她的膝盖几乎立刻夹向你，但你抵住了那股力道；这里的节奏要由你来决定。伊兹玛扭动着身体，身下的尾巴也竭力想要挣脱，但你把这只柔弱的小鲨鱼女孩牢牢抱在怀里，直到她平静到足以让你继续为止。");
         outputText("[pg]而你继续得相当热切。你渴得厉害，第一下就干脆用舌头刺入她深处，尽情吮饮。她带着些许咸味，令人想起大海，而你怎么也尝不够。你将她纳入灼热的口中，虎鲨人发出一声低沉而绵长的呻吟，她的淫液不断涌出，滋润着你干渴的喉咙。但这还远远不够，于是在最后一声啜吸后，你抽出舌头，开始在她的唇瓣上落下密集的亲吻，缓缓向上推进。");
         outputText("[pg]当你抵达目标时，她终于发出了你一直等待的那声呼喊。你在她的阴蒂上停留片刻，只施加了最轻微的吸力，然后又向下移去。即使贴着她最敏感的部位，你也能感觉到她的身体随着沉重的呼吸而起伏；尽管灼烧般的欲望不断催促你，你仍不想进展得太快。反正，还有许多有趣的事可以做。");
         outputText("[pg]接下来的几分钟里，你不断探索和试验，竭力找出最值得专注的地方。是深入进去，用舌头探到她最深处？还是向上卷起，寻找她的弱点？又或者，她更喜欢你专注于入口处？最终，你从她频繁的呻吟中察觉到，她对你的每一种努力都同样享受，于是你选择了纯粹的热情，全力以赴地试图淹没她的感官。");
         outputText("[pg]你像一头狂乱的鲨鱼般舔舐着她，她发情的气味充满你的脑海，将所有理智驱散殆尽。剩下的只有彻底吞食她、将她完全占有的感觉。她的一切都任你索取，而你的饥渴要求你这么做。你已经咬住了，就绝不会松口。");
         outputText("[pg]不过，伊兹玛也确实让你费了不少劲。她的双腿在你的[ears]旁挥动、挣扎，但你不会被甩开，欲望让你稳稳撑住，承受着她激情的风暴。你相当确信她正在高潮，但从你开始以来她就一直紧紧收缩，实在很难判断；况且不管怎样，你也没打算很快停下。");
         outputText("[pg]不过，这并不代表你不能稍微仁慈一点。你放慢动作，只是亲吻她的阴阜，手指抚过她的大腿，直到听起来她终于能重新喘气。但你给她的也仅此而已；下一瞬，你轻轻咬了咬她的阴唇，让她惊叫出声，随后又一次在你的挑弄下呻吟起来。");
         outputText("[pg]你的舌头滑回她的阴蒂，她整个骨盆都猛地向后一缩，但你随即前移补上距离。你围着那颗小芽快速打转，节奏稳定而强势；没过多久，她便又一次被推回边缘，像个贝塔该有的样子那样扭动喘息。你持续不停，直到她再次喊出声来，她的双手在你头边悬着。尽管她几乎忘了自己的位置，但还是勉强没有抓住你，而是猛地伸向身体两侧，试图找到什么可以支撑自己的东西。");
         outputText("[pg]但她什么也没抓到，只能在极乐中扭动，肌肉看似毫无规律地绷紧、抽搐，而你仍用舌头不断鞭挞着她。[if (izmaherm) {背上传来一阵冰凉的泼溅，让你短暂一惊，但你随即意识到，她失控的不只是下身那处器官|她丰沛的淫液沿着你的脸颊和下巴淌下，证明着你的本事}]。");
         outputText("[pg]等你终于停下动作时，伊兹玛已经成了一团颤抖的乱象。你用一只手臂撑起身子，看到她的脸已不只是恍惚——她看起来几乎像是失了神。你很清楚鲨鱼女孩有多么充满欲望，所以能把她带到这样的高度令你十分自豪；而你想，她大概也不会有什么怨言。");
         outputText("[pg]你[if (cor < 50) {尽力|象征性地}]帮她清理干净，然后擦了擦自己的[face]。接着你继续做别的事，虽然你忍不住想到，自己其实还完全没有得到满足……");
         dynStats(DynStat.Lust(15));
         get_player().slimeFeed();
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function izmaCumsAfterRadarStuffHere(param1:Boolean) : void
      {
         var _loc2_:int = get_player().cockThatFits(65);
         if(_loc2_ < 0)
         {
            _loc2_ = 0;
         }
         if(!param1)
         {
            outputText("双重刺激很快就把伊兹玛推过了极限，她开始向空中射出一道道浓稠的精液，随后洒落在自己的脸和乳房上。与此同时，高潮也席卷了她的女性生殖器，她的阴道壁几乎疼痛地紧紧夹住你的" + Appearance.cockNoun(get_player().cocks[_loc2_].get_cockType()) + "。[pg]");
         }
         else
         {
            outputText("伊兹玛再也没有说话，也不再受到片刻折磨般的阻碍，她带着压抑不住的狂热嚎叫起来，把滚烫黏稠的精液射向空中，又落到自己的额头上。终于射出来的她因彻底的狂喜而抽搐，阴道壁也与她的触须一同用力收紧，英勇得近乎徒劳地试图把你推向顶点。不过，很不幸（至少对伊兹玛来说），她身体下意识的努力没能让你释放。你评论伊兹玛射得这么快，又俯身对她柔声说道，你很满意她能如此迅速地听从你的命令。[pg]");
         }
         izmaLakeDominateContinueVanilla(false);
      }
      
      public function izmaCuddle() : void
      {
         var _g:Camp;
         clearOutput();
         outputText("今晚你打算让伊兹玛陪你上床——并不是她大概期待的那种通常意义。夜已经深了，孤零零的床也睡不踏实，于是你朝[if (builtcabin) {小屋|你的铺盖}]示意。你的鲨鱼恋人很快明白了你的意思，看上去很高兴，但随后又稍稍退缩了一点。");
         outputText("[pg][say:我很想和你一起上床，我的阿尔法，但我的皮肤刚游完泳还湿着。对我们这种族来说，干着身子睡会很不舒服……]她用失望的语气解释道。不过，对你来说这并不是问题，" + ([3,11,10,6].indexOf(get_player().skin.type) > 0 ? "你的[skindesc]对床上这点水同样适应得很" : "你也能忍受床上有点水") + "。没必要再继续讨论这个话题，你抓住伊兹玛的手腕，把她拉了过去。");
         outputText("[pg]片刻之后，你们已经一同倒进床里，这位矫健的游泳者也随你一起躺下。床单上的潮意很快被抛到脑后，你收紧双臂抱住她，也立刻得到了同样的拥抱。伊兹玛亲昵地依偎着你，短暂蹭了蹭之后望进你的眼睛。[say:睡个好觉，我的阿尔法。]");
         FlagDict_Impl_.arrayWriteString(KFLAGS.flags,701,"Izma");
         _g = get_camp();
         doNext(function():void
         {
            _g.doSleep();
         });
      }
      
      public function izmaAtCamp() : Boolean
      {
         if(izmaFollower())
         {
            return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1082) == 0;
         }
         return false;
      }
      
      public function izmAnalLick() : void
      {
         clearOutput();
         outputText("一个乖巧顺从的贝塔理应得到些照顾——你是这么想的。你握住她结实却不失女人味的臀瓣，俯下脸，对着她柔嫩的白色肛门缓缓舔了一下，动作充满挑逗。");
         outputText("[pg][say: 啊啊啊" + (!saveContent.tonguedButt ? "，这、这种对待还真是不习惯" : "") + "，] 她发出低低的咕噜声，在你的口舌动作下放松下来。她的" + (hasCock() ? "肉棒抽动起来" : "阴蒂轻颤起来") + "，你用[tongue]绕着边缘打转；每当你无意识地对着那里吐出一口气，她的肛穴都会随之一颤。");
         outputText("[pg]伊兹玛的呼吸变得更沉，她的肛门也显然放松了不少，变得更柔软、更容易进入。");
         saveContent.tonguedButt = true;
         doNext(izmAnalFuck);
      }
      
      public function izmAnalFuck() : void
      {
         clearOutput();
         outputText("[if (hasarmor) { 你脱去身上的遮蔽之物，将你的[genitals]暴露出来。}]你觉得已经没必要再多作铺垫，便迅速用顶端抵住她的臀穴，惹得她惊讶地一颤。");
         outputText("[pg]伊兹玛看向你，吸了口气，然后分开自己的臀瓣。[say: 我准备好了，阿尔法。]");
         outputText("[pg]你向前压去，逐渐沉入她体内。这个洞里面同样滚烫而舒服，但显然不像另一处那样经验丰富。她的臀穴入口像铁环一样紧紧箍住你，而更深处则柔软湿滑地包裹揉弄着你；你下定决心，要好好弥补她这方面的经验不足。你完全没入她体内，双手滑过她紧致的腰胯，在她健美的身躯上活动手指，帮助她放松下来。");
         outputText("[pg]终于，你开始向外抽出，引得这名鲨族女子浑身颤抖、低声呻吟。伊兹玛最好真的喜欢粗暴一点，因为缓慢又安抚的部分已经结束了。你确认自己牢牢扣住她的腰后，猛地挺胯撞了进去。[say: 啊！] 你的鲨族爱人呻吟出声。你没有半点停顿，立刻抽出又再次挺入，听见她发出更多带着喘息的短促叫声。");
         outputText("[pg][say: 操我，用我，我是你的，] 伊兹玛吐着气说道。[say: 我喜欢你变得强势，阿尔法。]");
         outputText("[pg]她会得到自己想要的。你向前俯身，开始更加用力地冲刺，持续抽插着她的臀穴。[if (hasballs) {你的[balls]拍打在她湿漉漉的小穴上，实实在在地证明她刚才的话并不夸张。}]你抓住这名虎鲨人，将她的身体拉起来抱在怀里，双手扣在她肌肉分明的腹部上。没了地面的支撑，她的颤抖变得更加明显；在这个姿势下，你快速的抽插让她的乳房剧烈摇晃。" + (hasCock() ? "伊兹玛沉甸甸的肉棒上下甩动，接连喷出数股精液，方向凌乱地四处飞溅。" : "") + "雌性的淫液喷洒在你爱人的大腿上，也溅到你自己身上；一波波高潮冲击着她的身体。你牢牢抱住她，更加用力地挺动，直冲自己的顶峰。");
         outputText("[pg][say: 操、操！我要你的精液射进我屁股里，] 她尖叫道。[say: 我想感觉你的热流灌进肚子深处。把我标记成你的贝塔！]");
         outputText("[pg]你的腹肌绷紧，尽可能深地撞入她体内，终于越过了无法回头的临界点。你忍不住发出低吼，精液开始溅进伊兹玛的肠道里。你吐出一口粗气，抽出你的[cock]，同时将这名鲨族女子放下。");
         outputText("[pg]你绕到她面前，把自己的家伙推到她嘴边，她很快就明白了你的意思。[say: 当然，阿尔法，] 她用疲惫的声音说道。她舔舐又吮吸，将你清理干净，热切地舔走所有没被她臀穴榨干的残余精液。");
         outputText("[pg]满足之后，你整理好自己，前往营地中央喘口气。");
         get_player().orgasm("Dick");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function izmAnal() : void
      {
         clearOutput();
         outputText("直说吧，你想做爱，而不需要多费口舌就能让伊兹玛为你弯下腰；不过这一次，你想换个方式。");
         outputText("[pg]伊兹玛红着脸问道：[say:我的阿尔法今天想要什么？]");
         outputText("[pg]你拉近两人之间那点距离，一把按住她的屁股。你打算从后面干她。当你的意图已经明白无误地传达给她时，这位虎鲨人有些结巴起来。[say:我、我还有另一个洞，天生就会润滑，也正是为这种事准备的，" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,249) < 1 ? "我服用的草药能确保你根本不用担心孩子的事" : "而从那边来我也不会怀孕。如果你不想要更多孩子，我可以再服用那些草药") + "。]");
         outputText("[pg]她这不是想拒绝她的阿尔法吧？胆子不小，而且未必是什么好事。");
         outputText("[pg][say:哦、不，当然不是，]她低声说道，一边转过身撩起裙子，把自己呈现在你面前。[say:你永远都可以用任何你想要的方式占有我，我的阿尔法。]");
         menu();
         addNextButton("舔舐",izmAnalLick).hint("像慷慨的阿尔法那样先帮她准备好。");
         addNextButton("开干",izmAnalFuck).hint("直接顶进去。");
      }
      
      public function inCampRideIzmasDickDongTheWitchIsDead() : void
      {
         spriteSelect(SpriteDb.get_s_izma());
         clearOutput();
         outputText("你面色潮红地看向伊兹玛，意味深长地揉着你的");
         if(get_player().wetness() > 3)
         {
            outputText("湿漉漉的");
         }
         outputText("肉穴，叫她躺下，让你来好好试试她那[if (metric) {三十八厘米|十五英寸}]的大家伙和四颗睾丸。[pg]");
         outputText("伊兹玛开心地尖叫了一声，随即又脸红起来，清了清嗓子。[say:啊哈……当然，我的阿尔法，]她简短地答道。她躺到地上，巨根立刻笔直挺起，等待着你的[vagina]。[pg]");
         outputText("你缓慢而挑逗地脱下你的[armor]，享受着伊兹玛贪婪地打量你每[if (metric) {一处|一寸}]裸露出来的[skinfurscales]的样子。她的目光吞食着你的" + get_player().allBreastsDescript() + "，随后又急切地滑向你的胯间，贪婪地享用");
         if(get_player().hasCock())
         {
            outputText("[eachcock]");
            if(get_player().balls > 0)
            {
               outputText("和[ballsfull]");
            }
            outputText("，然后才转向真正的重头戏：");
         }
         outputText("你的小穴。你款款走向仰躺着的虎鲨人，你的[hips]摇曳得让她看得入迷。等你来到她身边时，她的肉棒已经能清楚看到前液从尿道口冒出，顺着流到她那四颗肿胀的睾丸上；睾丸下方，雌性的爱液正积成一滩，并不断扩大。你饥渴地笑着，轻轻抚摸她那根修长、深红色的肉棒，玩笑似地问这么一个小姑娘拿着这么又大又硬的东西想做什么。[pg]");
         outputText("伊兹玛喘息着咯咯笑了起来，舔了舔嘴唇，欣赏着你为她摆出的这场小小表演。[say:大？我？哈哈……]当你摩擦她的龟头时，她抽了口气，发出呻吟。[say:那片湖水里可有大得多的鱼呢……]她喘着气，对你眨了眨眼。你不知道她到底是不是在开玩笑。[pg]");
         outputText("你若有所思地抿起嘴唇，假装认真考虑也许该把这条小鱼放回去……随后你摇摇头，咧嘴一笑。不了，你宣布道，这个大小对你来说已经完全够用了。[pg]");
         outputText("[say:哦，谢谢你……要是再等下去，我感觉自己会疯掉的，]伊兹玛低声呢喃着，把双手垫到脑后，挺起胸膛来诱惑你。[pg]");
         outputText("你微笑着俯下身，饥渴地亲吻、吮吸她那对傲人的乳房，并用力揉捏，惹得这名虎鲨人发出愉悦的尖叫。");
         if(get_player().hasCock())
         {
            outputText("你的" + Appearance.cockNoun(get_player().cocks[0].get_cockType()) + "蹭过她的肉棒，激起一阵阵美妙的电流在你体内奔涌。");
         }
         outputText("前戏玩腻了，你沿着她的身体滑上去，跨坐到她身上，让她的鲨鱼肉棒只往下顶进一点点，刚好让龟头挑逗般探入你的" + get_player().vaginaDescript(0) + "，却还不算真正插进来。");
         if(get_player().wetness() >= 5)
         {
            outputText("不过这可挡不住你的阴唇把润滑液淌得伊兹玛胯间到处都是。");
         }
         outputText("[pg]");
         outputText("伊兹玛在你身下似乎绷紧了身体，期待得连呼吸都卡在喉咙里。她咬着嘴唇，等着你坐上她的肉棒，但没有你的允许，她不敢擅自乱动。[pg]");
         outputText("终于觉得");
         if(get_player().cor < 66)
         {
            outputText("你已经把她挑逗够了");
         }
         else
         {
            outputText("你已经压抑自己的快感够久了");
         }
         outputText("，你沉身坐了下去；当她填满你的深处时，你强忍住一声惊叫。");
         if(get_player().vaginalCapacity() < 20 || get_player().vaginas[0].virgin)
         {
            outputText("天啊，这疼得要命！简直像是在往小穴里塞一根法棍！");
         }
         else if(get_player().vaginalCapacity() < 50)
         {
            outputText("你呻吟着，身体微微发颤，顺着那根足有[if (metric) {38厘米|15英寸}]的肉棒一路滑下；那点疼痛很快就被被填满到极限的充实感淹没了。");
         }
         else
         {
            outputText("你颤抖着舔了舔嘴唇。伊兹玛确实很大，但你也不是没吃过更大的；她的肉棒和你契合得像戴上手套一样。");
         }
         get_player().cuntChange(30,true,true,false);
         outputText("等你一路坐到伊兹玛肉棒的根部，你停顿片刻，让自己适应一下；随后收紧小穴里的肌肉，开始前后摇动。你的身体先向上滑起，再重重坐下，随着不断挺动，速度和力道也越来越强。你的双手伸向伊兹玛的乳房，肆意揉弄");
         if(get_player().hasCock())
         {
            outputText("，你勃起的肉棒");
            if(get_player().cockTotal() > 1)
            {
               outputText("");
            }
            outputText("在她腹部上弹跳着，发出清脆的拍打声");
         }
         outputText("。[pg]");
         outputText("伊兹玛在你身下呻吟着、颤抖着；你继续揉弄她的乳房时，她还低低咆哮了几声。她咧嘴一笑，开始顺时针转动腰胯，想让你更加舒服。你愉悦地张着嘴，喘息着命令她再快一点，随后以更充沛的劲头骑乘起来，向身下的虎鲨人展现你的支配地位。[pg]");
         outputText("伊兹玛的肉棒抽动了一下，她把双手按在你的臀侧。[say:啊……我要……]她闷哼着咬住嘴唇，努力把这一刻再多撑一会儿。[pg]");
         outputText("你愉快地笑出声，夸伊兹玛真是个乖贝塔；毕竟，阿尔法当然要先高潮。");
         if(get_player().cor < 33)
         {
            outputText("你大发慈悲地告诉她，你快到了……再稍微坚持一下。");
         }
         outputText("终于，那一直悬在临界点撩拨着你的高潮彻底释放；你愉悦地喊叫起来，淫液");
         if(get_player().wetness() < 4)
         {
            outputText("飞溅");
         }
         else if(get_player().wetness() < 5)
         {
            outputText("涌出");
         }
         else
         {
            outputText("喷涌而出");
         }
         outputText("到你身下的虎鲨人身上");
         if(get_player().hasCock())
         {
            outputText("；[eachcock]喷得她的肚子、乳房和脸上到处都是");
         }
         outputText("。伊兹玛感觉到你的" + get_player().vaginaDescript(0) + "在抽搐，终于发出一声响亮的咆哮，在你体内迎来高潮，将鲨鱼般的精液灌满你的子宫，分量多到让你的肚子都鼓胀起来。[pg]");
         outputText("你坐在伊兹玛身上待了几分钟，沉浸在事后的余韵中，感受着她那仍然半硬的阴茎还埋在你体内，一只手轻拍着自己被精液撑起的肚子。你称赞伊兹玛的精量……随后，你露出一个坏笑，故意打趣地问她，为什么她在你体内还是这么硬。她真的还这么饥渴吗？好吧，既然你是个称职的主导者，那就继续下去，直到把她彻底榨干为止……[pg]");
         outputText("伊兹玛在你身下虚弱地呻吟着，努力想让眼睛保持睁开。[say: 如果，呃……如果这是你想要的。][pg]");
         outputText("你只是对她露出最坏心眼的笑容，身体已经开始进入上下起伏的节奏……[pg]");
         get_player().orgasm("Vaginal");
         dynStats(DynStat.Sens(-2));
         outputText("<b>过了一段时间……</b>[pg]");
         outputText("终于，你累到不行，性欲也得到了充分满足，于是告诉伊兹玛你已经尽兴了。虎鲨人只是呻吟了一声，你不得不扶她进溪流里，好让她恢复力气。不过，一个小时内七次高潮确实相当了不起，你离开前还拍了拍她线条优美的屁股，并回头喊道，以后还会再来的。[pg]");
         outputText("你准备离开时，伊兹玛朝你挥了挥手，脸上还带着坏笑。你不禁怀疑，伊兹玛刚才是不是只是装得无力，好让自己多爽几次……");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,249) > 0)
         {
            get_player().knockUp(12,300);
         }
         get_player().slimeFeed();
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function hasCock() : Boolean
      {
         return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,439) == 0;
      }
      
      public function gooJob() : void
      {
         gooJobbed = true;
         clearOutput();
         outputText("你集中精神，将自己的身体向前移动，成功包裹住伊兹玛整个背侧。你一点一点让黏液在伊兹玛硬得像石头一样的肉棒周围凝固起来，然后兴致勃勃地开始套弄她的阳具。既然她已经被你手淫起来，而她又");
         radarIzmaSpanking(false);
      }
      
      public function giveManorBooks() : void
      {
         var _g:Camp;
         clearOutput();
         outputText("末世以来，你的贝塔已经攒下了相当一批书。作为她宽厚的阿尔法，你觉得帮她进一步扩充藏书也算是个不错的表示。你领着她来到她的储物箱前，发现箱子现在锁得严严实实；在你的示意下，她便把锁打开了。");
         outputText("[pg]伊兹玛站在自己收集来的物品前，目光在箱中那些更大胆的东西上停留了片刻，身上的橙色条纹仿佛也因兴奋而微微颤动。[say:我的阿尔法，你想让我做什么？]她问道，眼中闪着光，显然心里已经有了偏好的答案。不过，你却掏出了一本书。");
         outputText("[pg]她困惑了几秒，但你向她解释说，这些书是你在旅途中找到的；与其让它们待在积灰的书架上，你觉得它们更适合交给她。[say:嗯。它们看起来不像我平常喜欢的类型，不过外表有时也会骗人。谢谢你，我的阿尔法。我一定会好好享受你的礼物。]她冲你露出一个露齿的笑容。[say:那么，你不想也享受一下我的礼物吗？]");
         outputText("[pg]如果你有心满足她的欲望，她这番扭动腰臀的暗示已经相当强烈了。");
         saveContent.gaveBooks = true;
         get_player().removeKeyItem("Old Manor Books");
         menu();
         addNextButton("接受",izmaSexMenu);
         _g = get_camp();
         addNextButton("离开",function():void
         {
            _g.campLoversMenu();
         });
      }
      
      public function get_debugName() : String
      {
         return "伊兹玛";
      }
      
      public function get_debugHint() : String
      {
         return "";
      }
      
      public function gatASharkTooth() : void
      {
         var _loc1_:* = null as IMap;
         spriteSelect(SpriteDb.get_s_izma());
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,246) > 1)
         {
            outputText("伊兹玛带着歉意笑了笑，说道：[say: 抱歉，不过这种东西我得等到明天才能再弄到一个。]");
            doNext(izmaFollowerMenu);
         }
         else
         {
            outputText("伊兹玛微笑着从胸口拔下一颗牙。她带着愉快的表情把它递给你。[say: 为了你，我什么都愿意，我的阿尔法。]");
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,246,FlagDict_Impl_.arrayReadInt(_loc1_,246) + 1);
            get_inventory().takeItem(get_consumables().TSTOOTH,izmaFollowerMenu);
         }
      }
      
      public function fuckIzmasPussyDominate() : void
      {
         var _g:IzmaScene;
         clearOutput();
         spriteSelect(SpriteDb.get_s_izma());
         var _loc1_:int = get_player().cockThatFits(65);
         if(_loc1_ < 0)
         {
            _loc1_ = 0;
         }
         var _loc2_:int = _loc1_ + 1;
         outputText("目光紧盯着伊兹玛的");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,439) == 0)
         {
            outputText("肉棒");
         }
         else
         {
            outputText("小穴");
         }
         outputText("就像飞蛾扑向明火，你带着一副滑稽的咧嘴笑容朝她走去；一想到要把自己插进她紧致的小穴里，这念头就占据了你的脑海，把你推入狂乱的欲火之中。现在，她的裙子被随意丢在地上，她裸露的性器");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,439) == 0)
         {
            outputText("es");
         }
         outputText("此刻");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,439) == 1)
         {
            outputText("");
         }
         outputText("暴露在凉爽的空气中，滴着");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,439) == 0)
         {
            outputText("它们的淫液");
         }
         else
         {
            outputText("它的淫液");
         }
         outputText("，仿佛急切地预感着接下来会发生什么。[say: 那么，[name]，我的阿尔法今天想怎么干我呢？]伊兹玛娇声说道，试图用支配她的诱惑来蛊惑你；而此时，这已经让你的裤裆高高鼓了起来。[say: 你正说到我心里去了，亲爱的，]你回应道，目光锁定在她湿润的阴蒂上，[eachCock]也因渴望操弄她那枚爱钮而上下跳动。伊兹玛身后的树桩吸引了你的目光；一想到把伊兹玛压在上面，让她求着你给她播种，一阵兴奋便涌遍全身，你决定就用这种方式来支配伊兹玛。");
         outputText("[pg]你用威严的口吻提高声音，命令伊兹玛把全部注意力都放在你身上；这位鲨鱼变形人几乎立刻就听从了，猛地站直身子。你朝树桩一指，命令伊兹玛走过去，等待她的阿尔法下达下一步指示。那位胸部丰满的");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,439) == 1)
         {
            outputText("鲨鱼女孩");
         }
         else
         {
            outputText("双性人");
         }
         outputText("转过身，向你投来一个挑逗的微笑。她服从你的命令，走到树桩旁停下，等着你展示自己的打算；那副神态像是已经猜到了你想要什么。伊兹玛微微歪过头，转向你，让你看见她开口说话。[say: 所以……你是不是要我躺到树桩上？]伊兹玛问道，[say: 然后你用你的——]伊兹玛没能把话说完，因为你");
         if(pregnancy.get_event() <= 1)
         {
            outputText("猛地把她按倒在枯萎的树桩上。她腹部朝下摔了上去，木桩承住了冲击，让她发出一声响亮的[say: 唔]。她只花了片刻便回过神来，但这点时间已经足够你抓住她的尾巴并把它挪开，让你得以用你的[cock " + _loc2_ + "]插入她的小穴。");
         }
         else
         {
            outputText("用力把她压到树桩上，同时小心不伤到你们尚未出生的孩子。这位虎鲨人放荡地翘起尾巴，给了你一个绝佳的角度，好用你的[cock " + _loc2_ + "]插入她湿得一塌糊涂的小穴。");
         }
         outputText("[pg]这位虎鲨人从肩头回望着你，屏息等待你用肉枪支配她的阴道。");
         if(get_player().isTaur() || get_player().isGoo() || get_player().hasTailInsteadOfLegs())
         {
            outputText("现在她的尾巴抵在你的肩胛旁，高高翘在空中，通往她交合穴的道路已经畅通无阻。");
         }
         else
         {
            outputText("你把右腿跨过她的臀部，占据了蹂躏她小穴所需的优势位置。");
         }
         outputText("伴着一声雄浑的咆哮，你毫不留情地挺进伊兹玛的蜜道，她小穴里的触须还来不及承受冲击，就被你粗暴地拨到一旁。小穴被这样野蛮撑开，令伊兹玛因突如其来的侵入而痛得惊叫出声。你带着几分嘲弄说，还以为鲨鱼女孩都喜欢粗暴一点呢，一边奚落着在你身下无力扭动的伊兹玛。你抓住她的肩膀，借着她的身体稳住自己，准备让腰胯狠狠撞上她的臀部。你缓缓抽出，让她有机会适应你的" + get_player().cockDescript(_loc1_) + "；她小穴里的触须显然很感激这一点，令她发出赞许的呻吟。");
         outputText("[pg]你一开始动作放得很慢，给她刚好足够的时间适应你，随后便加快节奏，不断提速，让你的[if (hasBalls) {[balls]|大腿}]拍打在她的臀瓣上。你们激情的声响汇成一段情色的和声，在营地中回荡；你的爱人则为这曲欲望交响乐献上“人声”，在极乐中呻吟、喘息、倒抽着气。没过多久，你便用大腿猛烈撞击着她的臀部，把肉棒深深顶进她温热潮湿的小穴里，撞得伊兹玛的身体沿着树桩前后晃动。");
         if(get_player().countCocksOfType(CockTypesEnum.TENTACLE) > 1 || get_player().countCocksOfType(CockTypesEnum.TENTACLE) == 1 && get_player().cocks[_loc1_].get_cockType() != CockTypesEnum.TENTACLE)
         {
            outputText("[pg]你打断了她作为高潮歌剧女高音的首次献唱，把你的触手肉棒沿着伊兹玛的身体送上去，熟练地将肉棒猛然捅进她喉咙，立刻而有效地堵住了她的声音。她短暂的“歌唱”生涯或许已经落幕，但她现在有了更重要的职责：从你的[if (hasBalls) {[balls]|长得过分又柔韧的肉棒}]里榨出精液。");
         }
         if(get_player().isGoo() && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,439) == 0)
         {
            outputText("[pg]为了给这场戏加点花样，你决定把一部分黏稠的身体滑进伊兹玛的肛门里。稍稍集中精神后，你开始塑造自己黏液的硬度，直到形成一根临时假阳具，专门贴合她紧窄的小屁眼。随着你身体那团逐渐变硬的部分填满她的后穴，她发出呻吟。你低头看向你的鲨鱼变形人，注意到她的肉棒无人照料；它可怜巴巴地抵在你给伊兹玛播种的树桩上，看起来颇为凄凉。");
            outputText("你要照顾一下她的肉棒吗？");
            menu();
            addButton(0,"黏液手活",gooJob);
            _g = this;
            addButton(1,"不管它",function():void
            {
               _g.radarIzmaSpanking();
            });
         }
         outputText("[pg]");
         radarIzmaGasm();
      }
      
      public function followerIzmaTakesItInVagoo() : void
      {
         spriteSelect(SpriteDb.get_s_izma());
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,439) == 0)
         {
            get_player().slimeFeed();
         }
         clearOutput();
         outputText("欣赏着这名虎鲨人装饰过的胯部，你褪下[armor]的下装，露出[cocks]的根部，这立刻吸引了伊兹玛的目光。你问她，希望自己的阿尔法怎样照顾她那总被冷落的小穴。伊兹玛急切地笑了笑，张开双腿");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,439) == 0)
         {
            outputText("，轻轻抬起她厚实的大腿，好让");
         }
         else
         {
            outputText("，轻轻分开她结实的大腿，好让");
         }
         outputText("你能更清楚地看见她湿润的下身阴唇。[say:好吧，爱人……如果有谁知道怎么让我那里舒服，那一定是你。][pg]");
         outputText("你回给她一个淫荡的笑容，朝她逼近过去，看着她慢慢坐到自己的铺盖上，为你仰躺下来；一只手玩弄着自己的乳房，");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,439) == 0)
         {
            outputText("另一只手把她的雄性器官拨到一旁，用拇指挑逗自己的肉棒，同时弯动手指，让四颗睾丸在掌心里滚动。");
         }
         else
         {
            outputText("另一只手慢慢分开自己的阴唇，用拇指挑逗阴蒂，同时收缩体内的肌肉，让那道粉色的入口朝你一开一合。");
         }
         outputText("你也脱下自己的[armor]，在她面前摆出姿势。伊兹玛盯着你看了几秒，随后低吼道：[say:哦，别再逗我了，快来操我！]她倒吸一口气，捂住嘴。[say:啊、抱歉……我不该这样跟我的阿尔法说话！][pg]");
         outputText("你悠然走过去，在她面前用手肘和膝盖撑住身体。你伸出一只手，开始抚弄她的小穴，感受那灼热的温度，让她的淫液在你的指间黏腻作响、缓缓渗出。你漫不经心地告诉伊兹玛，她刚才那样跟你说话确实越界了，并暗示说，如果她现在是这种态度，也许你就不该把任何东西放进她体内。[pg]");
         outputText("伊兹玛在你的揉弄下呻吟着，身体微微扭动。[say:不、不要嘛，]她呜咽着，用可怜巴巴的眼神看着你。[say:求你了，我需要你……]你欣赏了一会儿她的挣扎，然后露出最坏心眼的笑容。好吧，既然她都这么想了……你猛地向前挺身，来到她双腿之间，直到你们的骨盆位置正好相对。你把[cock]抵在她的阴唇上，随即一路滑入深处，让它被她滚烫湿润的体内紧紧包裹。她大声呻吟，浑身瘫软下来，在快感中急促地喘息着。她小穴里那些奇异的卷须立刻开始按摩并挑逗你的肉棒");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,439) == 0)
         {
            outputText("，而伊兹玛自己则伸手去套弄自己的肉棒。[pg]");
         }
         else
         {
            outputText("，而伊兹玛自己则抬手揉捏起沉甸甸的乳房。[pg]");
         }
         outputText("你有那么一瞬间在想，也许阻止她取悦自己会显得更有支配感");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,439) == 0)
         {
            outputText("。");
            menu();
            addButton(0,"随她",radarIzmaXPackLetHer);
            addButton(1,"不准她",radarIzmaXpackDenyHer);
            return;
         }
         outputText("，但你还是觉得，让她有点“亲手参与”大概更好。于是，你转而伸手抚摸、揉弄她的乳房，轻轻拉扯并摩挲她挺硬的乳头，偶尔还温柔地捏上一下。漂亮的虎鲨人对你的动作反应很好，因快感而呻吟、喘息。她咬住嘴唇，好在用的是她那口人类的牙齿");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,439) == 0)
         {
            outputText("，同时套弄自己那根肉棒的速度也越来越快");
         }
         outputText("。[pg]");
         outputText("见她动作越来越快，你也加快了");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,439) == 0)
         {
            outputText("自己");
         }
         outputText("的抽插，试图跟上她的节奏。她阴道里的触须扭动、绷紧，带来一种你从未体验过的感觉——你觉得除了魅魔之外，恐怕没有任何生物能给你这样的快感！[pg]");
         outputText("伊兹玛继续大声呻吟低吼，并开始用自己的胯部用力迎向你，想把你的" + Appearance.cockNoun(get_player().cocks[0].get_cockType()) + "尽可能多地纳入体内，哪怕只多一[if (metric) {厘米|英寸}]也好。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,439) == 0)
         {
            outputText("她套弄自己的同时，你能看见一缕缕前液顺着她红色的肉棒淌下，也很清楚她已经快到极限了。尽管你也感到那股熟悉的压力，预示着自己的高潮即将来临，你还是忍不住俯向伊兹玛的肉棒，在她尿道口下方的龟头上印下一个漫长而湿热的吻。[pg]");
         }
         else
         {
            outputText("她与你交合时，你能看见一缕缕女性淫液从她的小穴里淌出，也很清楚她已经快到极限了。尽管你也感到那股熟悉的压力，预示着自己的高潮即将来临，你还是忍不住抬身，在伊兹玛一枚坚挺的乳头上落下一吻，随后立刻轻柔地短暂吮吸起来。[pg]");
         }
         outputText("这让伊兹玛浑身一颤。她在高潮中放声叫了出来");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,439) == 0)
         {
            outputText("，一股滚烫的精液直直射进你嘴里，随后又有几发打在你的嘴唇和脸上。");
         }
         else
         {
            outputText("，一小股雌性精液溅在你的肚子上，随后几道液流又沿着你的大腿淌下。");
         }
         outputText("她的小穴紧紧夹住你的[cock]，穴内的触须榨取着你的全部，让你忍不住闷哼出声。伊兹玛炽热的");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,439) == 1)
         {
            outputText("女孩-");
         }
         outputText("精液气味灌满你的鼻腔，而她那饥渴的触须不断榨弄的感觉更是让你承受不住。你喉间发出低沉的呻吟，将自己的一切尽数射进伊兹玛的小穴深处。");
         if(get_player().cumQ() < 750)
         {
            outputText("你直直射进她的子宫，分量多到当你抽出时，仍有一缕精液从她刚被用过的小穴里淌出来。");
         }
         else
         {
            outputText("你的精液量实在太多，撑得她的小腹鼓胀起来，那感觉几乎让她再次高潮。");
         }
         outputText("[pg]");
         outputText("你们两个翻身分开，喘息着大口呼吸。[say:嗯，太棒了，]伊兹玛说道，给了你一个漫长而缠绵的吻，并");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,439) == 0)
         {
            outputText("舔去你脸上的一些她自己的精液。[say:需要的时候，就来把我填满吧。]你朝伊兹玛咧嘴一笑，命令她把每一滴都吃干净。[pg]");
         }
         else
         {
            outputText("亲昵地舔着你的脸。[say:需要的时候随时来把我填满。]你也心照不宣地朝伊兹玛一笑。[pg]");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,439) == 0)
         {
            outputText("她咯咯笑着，用舌头舔过自己弄出的狼藉；她的舌尖在你的唇上停留了片刻，然后又给了你一个长吻，才放开你。");
         }
         else
         {
            outputText("她咯咯笑着，用舌头舔过你的嘴唇，在上面停留了片刻，随后又给了你一个绵长的吻，这才放开你。");
         }
         izmaPreg();
         get_player().orgasm("Vaginal");
         dynStats(DynStat.Sens(-2));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function followerIzmaTakesItInPooper() : void
      {
         spriteSelect(SpriteDb.get_s_izma());
         get_player().slimeFeed();
         clearOutput();
         outputText("当你告诉伊兹玛这次想让她来干你时，她惊呼道：[say:哦！这次轮到我当阿尔法了！] 她脸上放肆又快活的神情一瞬间化作亲昵的红晕，她抱住你，在你耳边低声说道：[say:你也愿意让我来主导，这真的很好。谢谢你想到这点。][pg]");
         outputText("你正要回答，她却一把抓住你的手腕，将它们扣在你背后，");
         if(get_player().get_tallness() > 72 || get_player().isTaur())
         {
            outputText("把你拉低，狠狠吻住你");
         }
         else if(get_player().get_tallness() < 54)
         {
            outputText("用熊抱把你从地上抱起来，狠狠吻住你");
         }
         else
         {
            outputText("把你拉进怀里，狠狠吻住你");
         }
         outputText("。她让自己的鲨鱼利齿擦过你的嘴唇，你尝到了血味。[pg]");
         outputText("你开始回吻她，但她仍然掌控着局面，似乎铁了心要用舌头侵犯你的嘴。你感觉到她逐渐硬挺起来的家伙");
         if(get_player().isBiped() || get_player().isTaur())
         {
            outputText("抵在你的双腿之间");
         }
         else
         {
            outputText("贴着你的下身");
         }
         outputText("，于是放弃了挣扎。每当她的舌头刺入你的口中，你都会试着轻轻吸吮，或用自己的舌尖去拨弄。[pg]");
         outputText("当伊兹玛感觉你放松地倚进她丰满的胸脯时，她发出愉快的呻吟；等你开始吮弄她的舌头，她又满足地轻笑起来。她从你气喘吁吁的嘴边退开，把你推倒在地，将她的肉棒展示在你面前。[pg]");
         outputText("[say:既然你这么急，就先把它弄得又湿又滑吧。][pg]");
         outputText("你开始沿着她那[if (metric) {三十八厘米|十五英寸}]长的肉棒一路亲吻，但伊兹玛可没那么多耐心；她抓住你的[hair]，把你拉回顶端。她光滑的龟头抵在你的唇边，你抬头望向她。她咧嘴一笑，露出满口牙齿，然后开始把你的头往下按。[pg]");
         outputText("当她的肉棒滑过你的嘴唇、深入你的喉咙时，你费了好大劲才忍住没作呕；但当她先移开视线，仰起头愉悦地闷哼着，整根都没入你口中，睾丸轻轻拍在你下巴上时，你还是感到一阵骄傲和开心。[pg]");
         outputText("那只持续了几秒，但当她终于从你的喉咙里抽出来时，你还是呛得咳嗽起来。[say:吞不下这么多？]她半是嘲弄、半是怜爱地问道，接着又把你的头拉回去，认真地操弄起你的喉咙，至少连续顶了十几下，完全不给你喘息的机会。等她结束后，她任由你仰面倒下、大口喘气，而伊兹玛则俯身压到你身上。[pg]");
         if(get_player().hasCock())
         {
            outputText("你以为她向前一挺时会直接插进你体内，但她只是让肉棒沿着你的肛门表面摩擦");
            if(get_player().balls > 0)
            {
               outputText("和[sack]");
            }
            outputText("直到她暗红色的肉棒与你的[cocks]对齐。[pg]");
            outputText("她握住你的[cock]，将它按在自己的肉棒上，一只手把两根一起握住，轻轻摩擦。她另一只手伸向下方，揉弄自己那两对睾丸");
            if(get_player().balls > 0)
            {
               outputText("，让它们抵着你自己的[balls]");
            }
            else if(get_player().hasVagina())
            {
               outputText("，让它们抵着你已经湿淋淋的" + get_player().vaginaDescript(0));
            }
            else
            {
               outputText("，让它们抵着你的会阴");
            }
            outputText("，与其说是在刺激你，不如说更像是在羞辱你。[pg]");
            if(get_player().cocks[0].cockLength < 14)
            {
               outputText("[say:嗯……]她叹了口气，看着自己的龟头越过了你的肉棒顶端。[say:知道谁才是主导，感觉真不错。]");
            }
            else if(get_player().cocks[0].cockLength < 16)
            {
               outputText("[say:我们在这儿能保持公平，感觉真不错，]伊兹玛低声说道，对着你们尺寸相近的肉棒微微一笑。");
            }
            else
            {
               outputText("[say:操，]她说道，看到你的肉棒远远超过她的那根，眼中充满欲望。她向前倾身，用自己肉棒的根部用力抵着你的" + Appearance.cockNoun(get_player().cocks[0].get_cockType()) + "根部摩擦，同时帮你们两个一起撸动。她停下时，你无力地呻吟起来；她叹道：[say:能在你这样强大的肉棒面前当阿尔法，感觉真是太棒了。]");
            }
            outputText("[pg]");
         }
         outputText("她慢慢挪开臀部，把你的屁股抬离地面，让她的龟头沿着你的身体滑行，直到落到你肛门的位置。");
         if(get_player().ass.analLooseness == 0)
         {
            outputText("当她开始用巨大的肉棒顶住你紧紧收缩的肛门时，你痛得倒抽一口气；你的括约肌终于让开时，你忍不住呜咽一声，伴随着啵的一下，她的龟头已经嵌进了你体内。伊兹玛一脸困惑地看着你，随后似乎意识到刚才发生了什么。[pg]");
            outputText("[say:你……让我成为第一个占有你的人？你比我想的还要甜啊！]她以出乎意料的温柔抚摸着你的身体，同时将剩下的部分慢慢送入你体内。每一[if (metric) {厘米|英寸}]都比上一下更容易，而等推进到[if (metric) {三十八厘米|十五英寸}]时，你已经扭动着身体，渴望更多了。");
         }
         else if(get_player().analCapacity() <= 26)
         {
            outputText("当伊兹玛的龟头挤过你紧绷的括约肌时，你呻吟起来。[say:就是这样，你这个贝塔荡货，]她一边把剩下的肉棒滑进你体内，一边说道。[say:为你的阿尔法呻吟吧。]");
         }
         else
         {
            outputText("伊兹玛开始向前顶，面对你早已调教好的屁股毫无阻力，她满意地低吼一声，猛地将臀部撞上你的臀部。[pg]");
         }
         get_player().buttChange(30,true,true,false);
         outputText("[pg]");
         outputText("她的胯部牢牢抵着你，俯身抓住你的手腕按在地上，手肘勾住");
         if(get_player().isBiped())
         {
            outputText("你的膝弯后方，把你固定得动弹不得");
         }
         else
         {
            outputText("你的[legs]，把你固定得动弹不得");
         }
         outputText("，屁股翘在空中。她的肉棒在你体内温热发烫，你甚至觉得她是在故意让它跳动，只为了感受你随之抽颤。[pg]");
         outputText("她开始有条不紊地操干你，每次都几乎退到最外面，再以熟练的技巧重新顶入。你完全沉溺在被如此粗暴使用的快感里，根本顾不上她到底操了你多久。");
         if(get_player().hasCock())
         {
            outputText("你试着伸手摸向自己的肉棒来发泄，可她的双手把你的手腕牢牢按在地上。");
         }
         outputText("[pg]");
         outputText("她的抽插变得更短、更快，也更狂野。你看见她喘着气，神情专注。你向前凑过嘴，含住她垂下的一颗乳头，开始吮吸、轻咬。她半眯着的眼睛猛地睁开，带着震惊的表情狠狠顶进你体内。[pg]");
         outputText("你咬住她的乳头时，她大叫出声，随即伊兹玛的四颗睾丸在你体内倾泻，滚烫的精液一股股灌满你的腹中。");
         if(!get_player().hasCock())
         {
            outputText("她的肉棒在你体内跳动的感觉终于把你推过了临界点，你也高潮了，紧致的肛口帮她榨出最后的精液，全数灌进你体内。[pg]");
         }
         else
         {
            outputText("她精疲力尽地倒在你身上，你闭上眼，尽情享受她滚烫的肉棒在你屁股里脉动，以及她温热的小腹贴着你[cock]的感觉。等她重新坐起身，她一边松开你的手腕，一边严厉地看了你一眼，明明白白地让你知道双手最好留在原处别动。你哀求地看着她，而她的手指沿着你的" + Appearance.cockNoun(get_player().cocks[0].get_cockType()) + "轻轻划过。[pg]");
            if(get_player().cocks[0].cockLength < 14)
            {
               outputText("伊兹玛握住你的[cock]");
               if(get_player().cockTotal() > 1)
               {
                  outputText("，接着又握住你的另一根" + get_player().cockDescript(1) + "，让动作保持同步");
               }
               outputText("，开始给你撸动。那感觉爽得难以置信，而当她说道，[say:你一直是个乖贝塔，但现在我想看你射出来，]你根本无法不服从；你乱糟糟地射在自己的[chest]上");
               if(get_player().cumQ() >= 1500)
               {
                  outputText("一遍又一遍，直到你浑身黏腻，躺在自己精液汇成的水洼里。");
               }
               else if(get_player().cumQ() >= 500)
               {
                  outputText("直到精液从你身上淌下，在地上积成一摊。");
               }
               else
               {
                  outputText("。");
               }
               outputText("[pg]");
            }
            else if(get_player().cocks[0].cockLength < 16)
            {
               outputText("当伊兹玛把[eachcock]引到她的双乳之间时，你一开始甚至说不清那是什么感觉；朝一个方向滑动时柔滑，朝另一个方向摩擦时又粗糙。她用双乳紧紧夹住你的[cocks]，开始上下套弄。这种截然不同的触感很快把你推上巅峰，让你射得她满脸、满胸都是，");
               if(get_player().cumQ() < 300)
               {
                  outputText("让她看起来被溅得一片狼藉，却又心满意足");
               }
               else if(get_player().cumQ() < 500)
               {
                  outputText("让她看起来湿漉漉的，却又大受触动");
               }
               else
               {
                  outputText("把她淋得满身都是精液，多到她俯下身去舔掉乳房上的那些");
               }
               outputText("。[pg]");
            }
            else
            {
               outputText("你松了一口气，可当你感觉到伊兹玛把你的" + Appearance.cockNoun(get_player().cocks[0].get_cockType()) + "的头部含进嘴里时，这声叹息很快就变成了愉悦的呻吟。尽管她那一圈锋利的牙齿就藏在里面，你感受到的却只有极乐；她吮吸着你，而她自己的肉棒仍深深埋在你体内。她把你的[cock]夹在自己的双乳之间，开始用上半身沿着你的肉棒上下移动。你惊讶地发现，她的乳房在一个方向上十分光滑，在另一个方向上却带着粗糙感，这种交替的刺激很快就让你招架不住。你勉强发出一声颤抖的喊叫来提醒伊兹玛，随后便开始把精液射进她嘴里");
               if(get_player().cockTotal() > 1)
               {
                  outputText("，也射到你们交叠的身体上");
               }
               outputText("。[pg]");
               if(get_player().cumQ() < 1000)
               {
                  outputText("她尽责地吞咽着，等你的肉棒终于停止在她双乳之间抽动后，她才松开嘴，舔了舔嘴唇，露出一个微笑。那一口密密麻麻的牙齿让你的肉棒比平常更快地软了下去。[pg]");
               }
               else if(get_player().cumQ() < 3000)
               {
                  outputText("一开始她还尽责地吞咽着，可当你持续不断地把精液射进她嘴里时，她终于放弃了吞咽。她改为抓住你的腰，俯下身同时把你往上拉，让你的肉棒直接顶进她的喉咙，好让你把种子送到更深处。那样子看起来很费劲，感觉却棒极了；等你射完、她把头退开时，她看起来对自己相当得意。[pg]");
               }
               else
               {
                  outputText("当你第一股巨量精液冲进她嘴里时，她呛了一下，有些精液漏了出来，但伊兹玛绝不肯认输。她改为抓住你的腰，俯下身同时把你往上拉，让你的肉棒直接顶进她的喉咙，好让你把种子送到更深处。那样子看起来很费劲，感觉却棒极了；你也乐意继续灌满她，直到她脸上浮现出一丝轻微的惊慌。她的肚子正在鼓起，而且她需要呼吸。最后，她终于喘着气退开，带着敬佩的神情往后一仰，让你把剩下的全都射在她的乳房上，偶尔又把嘴凑回前端，品尝一股精液。等你射完，她向后一倒，瘫进你制造出的精液池里。[pg]");
               }
            }
         }
         if(!get_player().hasCock())
         {
            outputText("几分钟后，她把逐渐软下去的肉棒从你体内抽出，给了你一个深吻。[say:谢谢你，]她说，[say:……我的阿尔法。]她小跑着去河边清洗。过了一会儿，你也跟了上去，任由她的精液从你被充分使用过的肛门里滴落出来。");
         }
         get_player().orgasm("Anal");
         dynStats(DynStat.Sens(-1));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function followerIzmaTakesIt69() : void
      {
         spriteSelect(SpriteDb.get_s_izma());
         get_player().slimeFeed();
         clearOutput();
         outputText("伊兹玛微笑着点点头，一边左右摆动着臀部，一边朝你走来，像是在进一步挑逗你。她把头凑到你的胯间，同时用自己的胯部摩擦你的脑袋。[say: 好吧，开始吧，]伊兹玛开心地说道，随即毫不耽搁地");
         if(get_player().hasCock())
         {
            outputText("贪婪吞含住你的[cock]，舌头缠绕其上，像抚弄珠宝一样爱抚着它");
            if(get_player().hasVagina())
            {
               outputText("，同时将两根手指插进你的 " + get_player().vaginaDescript(0));
            }
         }
         else if(get_player().hasVagina())
         {
            outputText("舔舐并品尝着你，格外关照你的[clit]");
         }
         outputText("。[pg]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,439) == 0)
         {
            outputText("你用双唇含住伊兹玛那根巨大的勃起，吮吸着[if (metric) {超过一英尺长的|她那将近四十厘米长的}]肉棒，被顶得阵阵作呕，而她则扭动着臀部来回摆弄。她含混的呻吟似乎是在肯定你做得很棒，伊兹玛也以更快的吞吐速度作为回应。你的视线被伊兹玛那四颗睾丸反复撞上额头和鼻梁，稍稍遮挡住了；但真要说的话，这反而让你更加兴奋。[pg]");
         }
         else
         {
            outputText("你用双唇贴住伊兹玛那肿胀而非人的下唇，吮吸并吞咽着她芬芳的雌液，而她则扭动着臀部来回摆弄。她含混的呻吟似乎是在肯定你做得很棒，伊兹玛也以更快的吞吐速度作为回应。你的视线被伊兹玛那条蜿蜒的尾巴稍稍遮挡住了；但真要说的话，这反而让你更加兴奋。[pg]");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,439) == 0)
         {
            outputText("为了让你的虎鲨人伴侣获得更多快感，你偶尔伸手抚弄她肿胀的阴囊，并用手指插弄她紧致湿润的小穴。伊兹玛猛地倒抽一口气，因你带给她的快感而颤抖。像是要奖赏你的努力一般，伊兹玛加快了吮吸的速度，用唾液浸湿你的每一[if (metric) {处|寸}]");
         }
         else
         {
            outputText("为了让你的虎鲨人伴侣获得更多快感，你偶尔伸手抚摸她红橙色的臀部，并将一根手指滑入她紧致湿润的小穴。伊兹玛猛地倒抽一口气，因你带给她的快感而颤抖。像是要奖赏你的努力一般，伊兹玛加快了吮吸的速度，用唾液浸湿你的每一[if (metric) {处|寸}]");
         }
         if(get_player().hasCock())
         {
            outputText(get_player().cockDescript(0));
         }
         else
         {
            outputText(get_player().vaginaDescript());
         }
         outputText("；你如此渴望她那魔法般的舌头，以至于开始向上挺动臀部");
         if(get_player().hasCock())
         {
            outputText("去够到");
         }
         else
         {
            outputText("把你的[clit]推");
         }
         outputText("尽可能深地送进她嘴里。[pg]");
         if(get_player().hasCock())
         {
            outputText("最后，你们终于让彼此同时迎来强烈的高潮。伊兹玛滚烫的精液射进你急切的喉咙，而你");
         }
         else
         {
            outputText("最后，你们终于让彼此同时迎来强烈的高潮。伊兹玛湿滑的精液淋满你的脸，而你");
         }
         if(get_player().hasCock())
         {
            outputText("一股股射在伊兹玛的脸颊上");
            if(get_player().totalCocks() > 1)
            {
               outputText("和头发上");
            }
            outputText("。");
            if(get_player().cumQ() >= 750)
            {
               outputText("即便她的嘴已经被填满、不得不退开之后，你仍一发接一发地射个不停。[say:看在玛莱的份上，[name]，我吞不下那么多！]");
            }
         }
         else if(get_player().hasVagina())
         {
            outputText("口水黏糊糊地淌满伊兹玛的脸颊，弄得一团糟。");
         }
         outputText("你们两个从彼此身边滚开。在你喘息着恢复过来时，伊兹玛精液那强烈的味道让你有些意外。你觉得自己并不介意再让那美妙的");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,439) == 1)
         {
            outputText("小姐——");
         }
         outputText("精液进到你肚子里一次……[pg]");
         outputText("[say:谢谢你刚才……]伊兹玛低声说道，踉跄着站起身去捡回自己的衣服。[say:想要更多的话，随时可以回来……或者下次我们可以做点更刺激的事。]因为她的肤色，你有点难看清，但几乎能看见她脸上泛起了红晕。你对伊兹玛笑了笑，点点头，然后离开去清洗一下。[pg]");
         get_player().orgasm("Generic");
         dynStats(DynStat.Sens(-2));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function followerIzmaMountsPC(param1:Boolean = false) : void
      {
         var lastHalf1:Boolean;
         var _g:IzmaScene;
         spriteSelect(SpriteDb.get_s_izma());
         clearOutput();
         var _loc2_:int = get_player().cockThatFits(65);
         if(_loc2_ < 0)
         {
            _loc2_ = 0;
         }
         if(!param1)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,439) == 0)
            {
               get_player().slimeFeed();
            }
            outputText("你露出坏笑，故意慢慢脱下你的[armor]，仰面躺好，[eachcock]兴奋地指向空中。你向伊兹玛投去一个俏皮的眼神，告诉她这次你打算让她掌控局面……如果她觉得自己能用小穴来支配你的话");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,439) == 0)
            {
               outputText("而不是用她的肉棒");
            }
            outputText("。伊兹玛热切地看着你，舔了舔嘴唇。[say:我想这可以安排，]她低声说道，跨坐到你身上，然后慢慢沉下去，坐进你勃起的肉棒。她小穴里的细小卷须始终在挑逗、按摩着你的肉棒。[pg]");
            outputText("你呻吟一声，重新躺回去，把自己交给你这位水生女友的侍弄；你不知道为什么她小穴里会有这些淘气的小触手，但你当然不会抱怨。你能感觉到它们爱抚、摩挲着你的" + get_player().cockDescript(_loc2_) + "，急切地把它一点点拉进她温暖、湿润又诱人的深处。[pg]");
            outputText("刚完全进入她的小穴，她便看着你露出坏笑，唇间逸出一声低沉而野性的吼声。随着她的腰臀开始加快速度，她俯下身咬住你的锁骨——幸好是用她那排人类牙齿。你惊叫一声，吃惊地看向她。她在你耳边轻哼，腰臀扭动和摆动得更快了。[pg]");
            outputText("这种感觉确实很舒服，于是你又放松地躺回去，一只手小心地抬起，轻抚爱人留下的咬痕。[say:嘿嘿，别担心；你没流血什么的。只是给你打上属于我的标记，]她低声说着，随后发出一声响亮的呻吟。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,439) == 0)
            {
               outputText("你的腹部开始变得湿漉漉的，低头一看，才发现她的前液正开始浸进你的[skinfurscales]里。[pg]");
            }
            else
            {
               outputText("你的腹部开始变得湿漉漉的，低头一看，才发现她的爱液正开始浸进你的[skinfurscales]里。[pg]");
            }
            outputText("你在想自己是不是该更主动地配合她的抽插扭动腰臀，但话说回来，这次本来就是要让她掌控局面。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,439) == 0)
            {
               outputText("不过，看着她那根淌着前液的肉棒拍打在你肚子上，那景象和触感让你有了个主意。");
               outputText("你可以伸手抓住她那根厚实的肉棒，替她撸动……也可以就这样享受交合。你要怎么做？");
               menu();
               _g = this;
               lastHalf1 = true;
               addButton(0,"帮她撸",function():void
               {
                  _g.followerIzmaMountsPC(lastHalf1);
               });
               addButton(1,"算了",RadarIzmaLeaveHerWangUnWingWanged);
               return;
            }
            outputText("不过，看着她那曲线饱满的乳沟上下弹跳，你有了个主意。你伸手托住这位强壮爱人硬挺的胸乳，欣赏着她微微上翘的乳头指向天空的模样。她骑在你身上时，你轻轻拨弄着它们，时不时还带着鼓励意味地揉捏、拉扯。[pg]");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,439) == 0)
         {
            if(param1)
            {
               clearOutput();
            }
            outputText("你把手从她留下的咬痕上移开，转而直接按上她的肉棒，手指环住它那粗达[if (metric) {five-centimeter|two-inch}]的棒身。[pg]");
            outputText("你揉搓她硬如岩石的肉棒时，伊兹玛大声呻吟起来。[say:真乖，母狗，]她低声嘟囔着，语气却撩人得恰到好处。你把立刻涌上心头的反驳咽了回去；这本来就是乐趣的一部分。不过，提醒一下伊兹玛她不可能事事都如愿也没什么坏处。你的手开始沿着她的肉棒上下滑动，抚到顶端收集她的前液，再顺着棒身涂抹下去——只要稍微伸长一点，你甚至能把一些液体揉进她晃动的睾丸里。你把平时伺候自己肉棒时积累的所有知识和技巧都用上，尽可能让这场手活对你的双性人爱人变得折磨般销魂。你挑逗地爱抚、揉搓着她，时快时慢，时重时轻。[pg]");
         }
         else
         {
            outputText("你揉搓她硬挺的乳头时，伊兹玛大声呻吟起来。[say:真乖，母狗，]她低声嘟囔着。你把立刻涌上心头的反驳咽了回去；这本来就是乐趣的一部分。不过，提醒一下伊兹玛她不可能事事都如愿也没什么坏处……你的双手开始掐捏、拉扯，在鲨鱼人的快感中掺入些许疼痛，每当她的小穴在你肉棒上起伏时，你就配合着用力一拽。你狠狠摆弄着那些敏感的小乳尖，用尽所有知识和技巧，让你的伴侣始终徘徊在高潮边缘。有时你甚至会托住她的乳房，温柔地爱抚几下，但每次都只持续片刻。[pg]");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,439) == 0)
         {
            outputText("伊兹玛咬住嘴唇作为回应，显然还想在上位多享受一会儿。可那一声声狂喜的低吼与呻吟清楚表明，这名虎鲨人已经撑不了多久了。她的阴道壁紧紧夹住你的肉棒。她尖叫起来，浓稠的精液一股股飞溅到空中，甚至有几道弧线越过了你的头顶。不过，大部分都打在你的脸和" + get_player().allBreastsDescript() + "上，在她清空四颗睾丸时，把你上半身糊满了精液。[pg]");
         }
         else
         {
            outputText("伊兹玛咬住嘴唇作为回应，显然还想再多享受一会儿骑在上面的感觉。但那一声声沉醉的低吼与呻吟清楚地表明，这个虎鲨人已经撑不了多久了。她的小穴内壁紧紧夹住你的肉棒。她大声尖叫，细细的淫液从你的腹部淌下，她小穴里蠕动的纤毛疯狂地缠弄着你的阴茎。她的爱液流得又快又畅，把你的大半个腹部、[hips]、[butt]和[legs]都浸湿了。[pg]");
         }
         outputText("就算你并不觉得伊兹玛这场即兴精液浴有多刺激，你");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,439) == 0)
         {
            outputText("自己");
         }
         outputText("肉棒也同样被挑逗折磨得够呛——而当她的内壁收紧，触须也竭尽全力地勒挤时，你终于撑不住了。你也喊出声来，将精液灌满她的体内");
         if(get_player().hasVagina())
         {
            outputText("，你的小穴也");
            if(get_player().vaginas[0].vaginalWetness <= 3)
            {
               outputText("滴着");
            }
            else if(get_player().vaginas[0].vaginalWetness <= 4)
            {
               outputText("喷涌着");
            }
            else
            {
               outputText("倾泻而下");
            }
            outputText("的雌性体液洒落在你们身下黏腻的地面上");
         }
         outputText("；你和她一样迫不及待地想要释放出来。[pg]");
         izmaPreg();
         if(get_player().cumQ() < 500)
         {
            outputText("你能感觉到伊兹玛的子宫被你的精液填满，她因这纯粹的快感而颤抖。");
         }
         else
         {
            outputText("你在伊兹玛体内射精时，她发出响亮的尖叫；你那非人的精液量把她的肚子撑得鼓胀隆起，几乎让她又一次高潮。");
         }
         outputText("完事后，伊兹玛从你身上滚下来，仍旧大口喘着气。[say:太棒了……我的阿尔法。][pg]");
         outputText("你一开始忙着喘气，根本没法回答。但随后，你微微一笑，撑起身子，在她脸颊上轻轻一吻。让你意外的是，这个总是欲火难耐的鲨鱼女孩竟然因为这个举动欣喜地红了脸。你们俩悠闲地穿好衣服，然后各自离开；你回到营地，伊兹玛则回到溪流里浸泡休息。");
         get_player().orgasm("Generic");
         dynStats(DynStat.Sens(-2));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function firstTimeDeclineIzmasKdiddlezlijfhdjkfhslkfbsjkhfbs() : void
      {
         spriteSelect(SpriteDb.get_s_izma());
         clearOutput();
         outputText("你摇了摇头，告诉伊兹玛你还没准备好当父母。虎鲨人看起来有些失望，但她轻轻叹了口气，理解地点了点头。[say:你说了算。那么，你想做什么？]她问道。[pg]");
         doNext(izmaFollowerMenu);
      }
      
      public function findLostIzmaKidsII() : void
      {
         clearOutput();
         outputText("你抱住自己的女儿，你们俩伏在彼此肩头，又笑又哭。过了片刻，你稍稍退开，急切地问起她的近况和精神状态。她也反过来询问你，还有她的\"父亲\"。[pg]");
         outputText("这让你脑中涌起一连串快乐的念头。你告诉这位离家的女儿，伊兹玛如今正和你住在一起——而且营地里也还有另一个人的位置。听到这个消息，她开心地尖叫了一声，并告诉你她会去营地见你。她在你脸颊上轻轻亲了一下，然后跑进浅水区，消失不见。想到营地里将会出现一张新面孔，你满面笑容地离开了。");
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,251,FlagDict_Impl_.arrayReadInt(_loc1_,251) + 1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function findLostIzmaKids() : void
      {
         clearOutput();
         outputText("当你划着船穿过湖面时，你瞥见一片鲨鱼鳍正朝你这边游来。你担心它会撞坏这艘小船，便急忙划回岸边，跳下船去。那条鲨鱼完全没有减速的迹象，鱼鳍在即将靠岸前消失不见。紧接着，一道灰色的影子破水而出，落在离你[if (metric) {一米|几英尺}]远的地面上。[pg]");
         outputText("那是个年轻女人——一个受到奇特腐化的女人，拥有光亮的灰色皮肤、银色头发，肩胛骨之间还长着一片鳍。她比一般的鲨女要小得多，也纤细得多。她穿着一身相当暴露的黑色泳装。女孩抬头看向你，咧嘴露出灿烂的笑，显出一排排刀刃般的牙齿。[say: 想玩吗？不过先说好，我……]她的笑容动摇了，沉默在空气中悬了片刻。[pg]");
         outputText("[say: ……妈妈？]");
         doNext(findLostIzmaKidsII);
         var _loc1_:int = 412;
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,_loc1_,FlagDict_Impl_.arrayReadInt(KFLAGS.flags,_loc1_) - 1);
      }
      
      public function finalIzmaSubmission() : void
      {
         clearOutput();
         outputText("你双手双膝撑地倒了下去，再一次败给了伊兹玛。不过你感觉自己也许并没有尽全力战斗，内心深处反而渴望着伊兹玛再次支配你。[pg]");
         outputText("伊兹玛窃笑着向你逼近，乐于满足你的欲望。她把自己的衣物随手扔到岩石上，又漫不经心地解开你的[armor]。[say: 哎呀，就这点本事？说真的……]她嘲弄道，绕到你身后，[say: 你还真是条小母狗，对吧？你就是喜欢臣服于伊兹玛，是不是？]你轻轻呜咽一声，点头回应。伊兹玛俯身贴上你的后背，她硬得像石头的乳头和肉棒压在你的");
         if(!get_player().isTaur())
         {
            outputText("脊背");
         }
         else
         {
            outputText("侧腹");
         }
         outputText("。[pg]");
         outputText("伊兹玛滚烫的前液从她身上滴落到你的背上，一路流向你的" + get_player().assDescript() + "。这让你眼睛都翻了上去；你只能想象她那咸涩的前液顺着你喉咙流下去会是什么滋味。伊兹玛知道你已经被她牢牢掌控，便嗤笑一声，随后收紧了怀抱。");
         if(get_player().hasCock() || get_player().hasVagina())
         {
            outputText("这紧紧的拥抱让");
            if(get_player().hasCock())
            {
               outputText("[eachcock]勃硬起来");
               if(get_player().hasVagina())
               {
                  outputText("和");
               }
            }
            if(get_player().hasVagina())
            {
               outputText("你的" + get_player().vaginaDescript(0) + "变得格外湿润");
            }
         }
         outputText("。[pg]");
         outputText("[say: 求我，]她命令道，一边舔着你的脖子和锁骨，一边发出几声低吼与满足的呼噜。你满心期待，迷迷糊糊地回了一句。[say: 你听见我说什么了，]她严厉地回答，把那根如今已经勃起、长度足有[if (metric) {三分之一米|一英尺}]多的悸动肉棒抵在你背上研磨。任由自己的支配本能释放，似乎让她变得比你以往感受过的任何时候都更硬。那感觉让你大声呻吟起来。[say: 请操我！求你了，伊兹玛，女主人，我需要你的肉棒！]你哭喊道，根本不在乎附近会不会有什么东西听见。伊兹玛轻笑一声，将你拉近，粗暴地吻住你，长长的舌头缠上你的舌。她继续用舌头侵犯你的口腔，直到你几乎喘不过气来；你甚至觉得，光是这样伊兹玛就能让你高潮。[pg]");
         outputText("她把你牢牢按在原地，将龟头抵上你的[asshole]。没有任何预警，她猛地把肉棒强行顶进你体内，熟悉的灼热感让你愉悦地尖叫起来。");
         get_player().buttChange(get_monster().cockArea(0),true,false,true);
         outputText("她继续往你的后穴里推进，[if (metric) {一厘米接一厘米|一英寸接一英寸}]地深入；她进入得越深，你在伊兹玛面前就越发无力。最终，她将整根肉棒都埋进你的菊口里，粗壮的大腿贴上你的[ass]，让她满足地叹息出声。[pg]");
         outputText("她抽身退出，有那么一瞬间，肉棒离开带来的空虚让你有些不安；可下一刻她又深深插进你的后穴，直抵到底，你随即叫出声来。她继续在你体内抽插、研磨，发出几声野兽般愉悦的低吼。你勉强回头瞥了一眼，却发现这个书虫已经彻底变成了某种骄傲的野性女人。这很适合她；毕竟她已经证明了自己比你强大得多。如此强壮，如此掌控一切，如此有力量……被伊兹玛压在身下，让她在你身上宣示自己的地位，感觉是如此理所当然。[pg]");
         outputText("仿佛感受到了你的彻底臣服，伊兹玛的双手滑向你的[breasts]，粗暴地揉捏、抓弄着，还以近乎疼痛的力道拨弄你的[nipples]。可这反而只让你更加兴奋，你在强烈的快感中呻吟、扭动。伊兹玛先让你迎来了高潮，你的肌肉抽搐痉挛，短暂地失去了对身体的控制");
         if(get_player().hasVagina() || get_player().hasCock())
         {
            outputText("；");
            if(get_player().hasCock())
            {
               outputText("[eachcock]开始把精液喷得到处都是，洒满沙滩");
               if(get_player().hasVagina())
               {
                  outputText("和");
               }
            }
            if(get_player().hasVagina())
            {
               outputText("你的" + get_player().vaginaDescript(0) + "也开始肆意喷出液体");
            }
         }
         outputText("。[pg]");
         outputText("然而，你渴望再次被她的种子填满——她是如此完美的存在。于是你又开始用力把屁股往伊兹玛的肉棒上顶。[say: 啊，真是条乖母狗！让我射出来，你就能赢得我的宠爱！]伊兹玛嘶声说道，在抽插中粗暴地撑开你的肛门。没过多久，伊兹玛便迎来了高潮；她发出野兽般的咆哮，在你体内射精，用浓稠的精液轰然灌满你的深处。她松开抓住你的手，让你跌倒在沙滩上，自己也开始喘息，汗水从她身上滴落。最终，她的肉棒滑了出来，你能感觉到她滚烫而充满力量的精液正从体内流出。[pg]");
         outputText("你们两个一动不动地待了片刻。她先站起身，朝你扔来一枚虎鲨牙。[say: 这是你的奖励，荡妇……不过，作为条母狗，光有我的种子就该足够让你开心了。]你跪起身来，跟在她身后，看着她走去穿回衣服。[say: 你现在可以走了，知道吗，]伊兹玛直截了当地说，让你不由得轻轻倒吸一口气。你解释说自己不想离开这位美丽的虎鲨人；有这样强大的存在守护着你，你感到无比安心。你恳求她、哀求她允许你留下，说只要能待在她身边，你什么都愿意做。伊兹玛惊讶地眨了几下眼，随后柔和地笑了笑，捧住你的脸颊。[say: 什么都愿意，嗯？好吧……如果你喜欢的话，我可以当你的头领。]你用力点头表示赞同；不管那意味着什么，只要能让伊兹玛留在你身边，你都愿意。[say: 毕竟你操起来确实挺不错的，]她继续说道。");
         if(get_player().get_race() != "shark-morph")
         {
            outputText("[say: 不过，我们当然得先对你的身体做些改造……]");
         }
         outputText("[pg]");
         get_player().slimeFeed();
         get_player().orgasm("VaginalAnal");
         doNext(IzmaBadEnd);
      }
      
      public function fightSharkCunt() : void
      {
         clearOutput();
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,230,FlagDict_Impl_.arrayReadInt(_loc1_,230) + 1);
         outputText("伊兹玛咧嘴一笑，从箱子里取出一副带钩的金属护手，戴上之后握了几次拳。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,231) == 0)
         {
            outputText("[say:好吧，让我看看勇者到底有多少本事！]她说着，摆出了战斗架势。");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,231) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,231) <= 2)
         {
            outputText("伊兹玛眯起眼睛盯着你，摆出了战斗架势。[say: 这次你可没那么走运了。]");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,231) > 2)
         {
            outputText("伊兹玛准备战斗时显得有些没底。[say: 这次对我手下留情一点……好吗？]");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,231) < 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,231) >= -2)
         {
            outputText("[say: 嗯，真的？好吧，说不定这次你会走运呢，]她嘲弄道，示意你先出手。");
         }
         else
         {
            outputText("伊兹玛轻笑一声，摇了摇头。[say: 既然你坚持的话。至少这次认真点，行不？]");
         }
         startCombat(new Izma());
         spriteSelect(SpriteDb.get_s_izma());
      }
      
      public function facialWhereItGoesRadarIzmaXpack() : void
      {
         spriteSelect(SpriteDb.get_s_izma());
         clearOutput();
         outputText("这让伊兹玛浑身一颤。她在高潮中放声叫了出来");
         outputText("，一股滚烫的精液直直射进你嘴里，随后又有几发打在你的嘴唇和脸上。");
         outputText("她的小穴紧紧夹住你的[cock]，穴内的触须榨取着你的全部，让你忍不住闷哼出声。伊兹玛炽热的");
         outputText("精液气味灌满你的鼻腔，而她那饥渴的触须不断榨弄的感觉更是让你承受不住。你喉间发出低沉的呻吟，将自己的一切尽数射进伊兹玛的小穴深处。");
         if(get_player().cumQ() < 750)
         {
            outputText("你直直射进她的子宫，分量多到当你抽出时，仍有一缕精液从她刚被用过的小穴里淌出来。");
         }
         else
         {
            outputText("你的精液量实在太多，撑得她的小腹鼓胀起来，那感觉几乎让她再次高潮。");
         }
         outputText("[pg]");
         outputText("你们两个翻身分开，喘息着大口呼吸。[say:嗯，太棒了，]伊兹玛说道，给了你一个漫长而缠绵的吻，并");
         outputText("舔去你脸上的一些她自己的精液。[say:需要的时候，就来把我填满吧。]你朝伊兹玛咧嘴一笑，命令她把每一滴都吃干净。[pg]");
         outputText("她咯咯笑着，用舌头舔过自己弄出的狼藉；她的舌尖在你的唇上停留了片刻，然后又给了你一个长吻，才放开你。");
         izmaPreg();
         get_player().orgasm("Generic");
         dynStats(DynStat.Sens(-2));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function execEncounter() : void
      {
         var _loc1_:* = null as IMap;
         spriteSelect(SpriteDb.get_s_izma());
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,233) == 1)
         {
            outputText("伊兹玛远远就看见你过来，便拿起她的储物箱，朝水边走去。[say: 嘿……]你靠近时，她谨慎地说道。[say: 你身上已经没有虫子的味道了……你把它们清掉了吗？]你点点头，多少带着点歉意。她看起来松了口气。[say: 那就好。说实话，我还有点想念你的陪伴。那么，你想聊聊天，或者看看我的书吗？还是说……你想做另一件事？我几乎随时都有那个兴致，]伊兹玛说着，向你眨了眨眼。");
            unlockCodexEntry(2054);
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,230,5);
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,233,0);
         }
         else
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,230) == 1)
            {
               outputText("你在湖边散步时，地平线上出现的一个身影让你猛地停下脚步。有什么东西，或者说某个人，就坐在一块岩石上。你小心翼翼地朝那身影走去，悄无声息地从陌生人身后靠近。随着距离拉近，你发现她和湖里的鲨鱼女孩有些相似，但也有几处显著不同。她大约有6英尺高；皮肤是鲜艳的红橙色，上面有几道黑色条纹。半亮泽的白发垂过肩头，发间还悬着几滴水珠。她穿着黑色比基尼上衣，身上是一条做工精致、一直垂到膝盖的草裙。她正忙着读书，还没注意到你的存在；她身旁的岩石上放着一个小箱子。现在你仔细看清了她，也注意到她鼻梁上架着一副可爱的小眼镜。[pg]");
               outputText("你犹豫了片刻，才开口说道：[say: 呃……你好？][pg]");
               outputText("陌生人吓了一跳，手里的书掉在地上，差点就扑到你身上，用她锋利的牙齿狠狠咬了个空；幸好你及时向后一跳躲开了。[say: 你是谁？]她质问道。[say: 你在这里干什么？]你连忙向她道了几声歉，声明自己绝无恶意。过了片刻，她冷静下来，不过脸上的恼火神情并没有完全消失。她重新坐回岩石上，捡起书，扶了扶眼镜，然后问道：[say: 所以，你是谁？来这附近有什么事？][pg]");
               outputText("你告诉她，你只是在探索，看到她才感到好奇；像她这样的族类会出现在湖滩上，只是悠闲地放松读书，这实在很少见。[say: 我想我确实有点不一样……]她承认道，[say: 总之，我只是在补补阅读；性爱和游泳——我们族人出了名的消遣——当然都很好，但我也喜欢让脑子保持灵光。][pg]");
               outputText("这下你更好奇了；冷静下来之后，她看起来没那么有压迫感，也显得更有书卷气了——好吧，至少脖子以上如此。她身上的打扮依旧像是随时准备参加夏威夷宴会。你介绍了自己，然后意味明显地看向她。[pg]");
               outputText("[say: 我叫伊兹玛，是个虎鲨人，]她回答道。[pg]");
               outputText("[say: 虎鲨人？]你问道。");
               unlockCodexEntry(2054);
               outputText("[pg][say: 这是我们鲨鱼人中会出现的一种变异。我们更强壮、更坚韧、更快……而且我们还有一些……呃，我们姐妹所没有的“特质”，]她解释道，同时递来一个眼神，微妙地暗示你别再追问下去了。于是你转而问她那些书是哪儿来的。[say: 这些？在附近搜罗的。这地方想找到点有文字记载的东西太难了，就连这些玩意儿也有不少保存得不怎么样……你懂吧？]你表示认同；箱子里那可怜巴巴的一小堆书，已经是你见过最像样的藏书了——");
               if(get_player().statusEffectv1(StatusEffects.TelAdre) >= 1)
               {
                  outputText("除了安全的特尔阿德雷之外");
               }
               else
               {
                  outputText("自从你来到这里以来");
               }
               outputText("。也许是把你想成了同好，她继续说道：[say: 我可以借你几本……只收一点使用费。当然，你得待在我看得见的地方。]你装出一副受伤的样子。[say: 不是针对你啦，只是我想扩充我的藏书，而不是让它变少，]她补充道。不过……这提议确实很诱人。你正需要尽可能多地获取知识。[pg]");
               outputText("你点头同意，伊兹玛也因此露出笑容。你们又闲聊了一小会儿，随后便分道扬镳，你返回了自己的营地。");
               _loc1_ = KFLAGS.flags;
               FlagDict_Impl_.arrayWriteInt(_loc1_,230,FlagDict_Impl_.arrayReadInt(_loc1_,230) + 1);
               doNext(get_camp().returnToCampUseOneHour);
               return;
            }
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,230) < 4)
            {
               outputText("你沿着湖岸探索，又一次来到了伊兹玛的营地。虎鲨人见到你很高兴，但你忍不住觉得她似乎正被什么事分心；她一直摆弄着自己的草裙，还磨着獠牙。[pg]");
               outputText("[say: 那么，你今天对什么感兴趣？]她问道。[pg]");
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,230) == 4)
            {
               outputText("你沿着湖岸探索，又一次来到了伊兹玛的小营地。你们像往常一样打了招呼，但你还是注意到，伊兹玛似乎比平时更加心不在焉。[say: 嘿，呃……我们算是朋友，对吧？]伊兹玛最后开口问道，你点头回应。这个虎鲨人确实给了你不少愉快的陪伴，而在这个世界里，这可不多见。[say: 好，好。我，呃，有个“问题”，需要一个朋友帮我解决一下。]起初你推测她指的是某种离湖太远、她一个人不好完成的差事，但当她拉开自己的草裙时，你立刻完全明白了她所谓的“问题”是什么。");
               unlockCodexEntry(2054);
               outputText("[pg]一根[if (metric) {三十八厘米|十五英寸}]长、半勃起的肉棒从伊兹玛的裙子里弹了出来，下面还晃着四颗棒球大小的睾丸。它的外形大致像人类的，但红色的皮肤让它显得格外不同。你实在想不通伊兹玛之前是怎么把那东西藏起来的。等它完全勃起时会有多粗，你也只能想象了……[pg]");
               outputText("[say: 别误会，我不会扑上来强迫你什么的，只是提个选择。我是说，如果我愿意的话，随便再抓个鲨鱼女孩" + (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2024) > 0 ? "或者邪教徒" : "") + "也很容易。只是……给你个提议，就这样，]伊兹玛说着，抬头望向天空，避开你的目光。[pg]");
               outputText("你在脑中琢磨了几秒，随后问她这对你有什么好处。伊兹玛笑了起来，显然很高兴你至少在认真考虑这个提议。[say: 我可以付你报酬，]她自豪地说道，惹得你挑起眉毛。伊兹玛在她的橡木箱里翻找了一阵，拿出一样看起来像鲨鱼牙的东西。真正吸引你注意的是，它正散发着奇异的紫色光芒。[pg]");
               outputText("[say: 只要剂量够，它能让你变成像我这样的虎鲨人……]伊兹玛解释道，把那颗牙在指节间来回拨动。[say: 我是说，如果你觉得自己会喜欢的话。它能给你像我这样的皮肤、鳍、鲨鱼尾巴、獠牙……还有这个。]伊兹玛捧起自己的乳房，又把胯部连同那沉甸甸的家伙向前顶了顶，像是在引诱你。她这充满暗示的姿势确实让你微微兴奋起来。[pg]");
               dynStats(DynStat.Lust(5));
               outputText("[say: 我们可以用两种方式来做。我的意思是，性爱，]伊兹玛直起身说道。这让你扬起眉毛，不明白她究竟是什么意思。[say: 我们可以来点口交……或者如果你想把它插进去，我们也可以按鲨鱼人的规矩来：为支配权打一架。选择权在你，真的，]伊兹玛一边说，一边靠近你。[say: 所以……今天我能拿什么来诱惑你？]");
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,238) == -1)
            {
               outputText("你沿着湖边漫步，发现自己遇到了一只看起来很眼熟的海箱。看来你是撞上了你的虎鲨人情人伊兹玛，而果不其然，她很快便浑身滴着水从湖中冒了出来。看到你，她惊喜地笑了起来。");
               unlockCodexEntry(2054);
               outputText("[pg][say: [name]！见到你真高兴！]她打着招呼，你们俩很快拥抱了一下。她坐到箱子旁的一块岩石上，笑得合不拢嘴。[say: 那么，今天你想做什么？你有想过把你的贝塔也带来吗？][pg]");
            }
            else
            {
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,231) >= 6 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,238) == 0)
               {
                  outputText("你沿着湖岸前行，希望能再次遇见那个淫荡的鲨鱼人伊兹玛，而没过多久，你就看到了她那处临时营地。从你这里看去，她正望着湖面，仿佛在沉思。等你走近些，才发现她的双手一直在膝上不安地摆弄着，明显是紧张的表现。究竟是什么事让她这么心神不宁？[pg]");
                  outputText("你往前走时踩到一枚脆弱的贝壳，它在你的[feet]下发出响亮的碎裂声，吸引了伊兹玛的注意。她看向你，心情似乎瞬间明朗了起来，不过双手仍在紧张地摆弄着。你咧嘴一笑，举起一只手向她打招呼，并问她怎么了。[pg]");
                  outputText("[say: 嗯，呃……]她有些笨拙地开口。[say: 最近我们打了很多次，而你一次又一次证明你比我更强。我以前还有点不好意思，可现在……]她说到一半，又转头望向湖面。[say: 现在我知道，你确实比我优越，是更优秀的个体……是阿尔法。]说完，她看向你，双手握在一起。[pg]");
                  outputText("[say: 而且……如果——如果你想要一个伴侣……呃，我可以跟你走……如果你不介意的话？]她盯着沙地，脸红了起来。[say: 不、不然的话，我就继续待在这里……不会打扰你。]看来现在有个选择摆在你面前：你可以接受伊兹玛作为伴侣，也可以拒绝她，让她继续留在湖边。你要怎么做？[pg]");
                  menu();
                  addButton(0,"接受",acceptIzmaAsYourBitch);
                  addButton(1,"留下",IzmaStayAtTheLakeBitch);
                  return;
               }
               outputText("伊兹玛远远就看见你来了，向你招手让你过去。[say: 嘿，[name]！是来聊天的，还是想借本书？或者……你是想帮我解决一下我的“问题”？恐怕它最近有点成了老毛病了，]她一边笑着说，一边放开交叠的双腿，裙子前摆随之被一处隆起顶了起来。[pg]");
            }
         }
         menu();
         addButton(0,"借书",tradeWithFuckingSharkBitches).hint("从伊兹玛那里借一本你想看的书。");
         addButton(1,"交谈",talkToASharkCoochie).hint("和伊兹玛聊聊，看看有什么事。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,230) >= 4)
         {
            addButton(2,"做爱",FlagDict_Impl_.arrayReadInt(KFLAGS.flags,238) == -1 ? izmaLakeTurnedDownCampSex : chooseYourIzmaWeapon).hint("和这位虎鲨人开始亲热。");
            addButton(3,"战斗",fightSharkCunt).hint("和伊兹玛打一场，看看谁能当支配者！");
         }
         addButton(14,"离开",leaveSumSharkPussyOnTheBeach);
      }
      
      public function entropyGuideByStephenHawking() : void
      {
         spriteSelect(SpriteDb.get_s_izma());
         clearOutput();
         outputText("你指了指伊兹玛那一大堆《礼仪指南》系列，问她愿不愿意读其中一本。伊兹玛耸了耸肩，拿起其中一期。[say: 好吧，我想可以。你确实该学学怎么有礼貌，]她一边打趣，一边翻开目录。你稍微想了想这是不是意味着她很虚伪，但很快放弃了这个念头，开始和她一起阅读。再想下去只会让人发疯。[pg]");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,253,11);
         outputText("你翻阅着这本奇怪的书，试图让自己的举止更得体些，尽管书中描绘的那些刻板印象几乎让你有点冒犯。不过，面对下流的挑逗时，该如何保持贞洁与体面，这本书倒确实提出了一些不错的主意。[pg]");
         dynStats(DynStat.Lib(-2),DynStat.Cor(-2));
         outputText("随着时间过去，你意识到自己确实还有别的事要做。你感谢伊兹玛陪你一起看书，然后起身准备离开。[say: 好吧，谢谢你陪我坐着，[name]。你先去忙吧，我还想再多看一会儿这个，]她回答道，甚至没有从书页上抬起头来。[pg]");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function encounterName() : String
      {
         return "伊兹玛";
      }
      
      public function encounterChance() : Number
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,230) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2301) >= 10 && (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,233) == 0 || !get_player().hasStatusEffect(StatusEffects.Infested)) && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,238) <= 0)
         {
            return 1;
         }
         return 0;
      }
      
      public function eatIzmasLeafAfterRapinHer() : void
      {
         clearOutput();
         outputText("你小心翼翼地接过叶子，把它吃了下去。伊兹玛露出微笑。");
         FlagDict_Impl_.arrayWriteString(KFLAGS.flags,234,get_consumables().TSTOOTH.get_id());
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,231) <= 4 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,235) > 0)
         {
            outputText("你向漂亮的虎鲨人道别，等她把那枚牙齿形状的奖励交给你后便离开了。");
            get_combat().cleanupAfterCombat();
         }
         else
         {
            victorzChoice();
         }
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,231,FlagDict_Impl_.arrayReadInt(_loc1_,231) + 1);
      }
      
      public function dontEatIzamsLeafAfterRape() : void
      {
         clearOutput();
         outputText("你对她递来的草药感到不悦，傲慢地瞪了她一眼。[say: 你也配来教我怎么做？教我这个已经证明比你更强的人？][pg]");
         outputText("伊兹玛畏缩了一下。[say: 对不起！我只是不想跟不是我伴侣的人生孩子！求你了，求你收下吧！][pg]");
         outputText("你一巴掌把她手里的叶子拍飞。[say: 等你变得更强了，再来把你的决定强加给别人吧！]你厉声说道。[say: 我要不要生你的孩子，跟你一点关系都没有；能有机会和比你更强的人生下孩子，你应该感恩才对！]她打了个哆嗦，温顺地点点头，而你转身小心地踏上返回营地的路。[pg]");
         get_player().knockUp(12,300);
         get_combat().cleanupAfterCombat();
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,231,FlagDict_Impl_.arrayReadInt(_loc1_,231) + 1);
      }
      
      public function defeatIzma() : void
      {
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,231) <= 0)
         {
            outputText("伊兹玛仰倒在沙地上，她的");
            if(get_monster().get_HP() < 1)
            {
               outputText("伤势");
            }
            else
            {
               outputText("欲火");
            }
            outputText("让她无法继续战斗。她恼火地冲你低吼道：[say: 好吧。你赢了……这次算你赢。][pg]");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,231) > 0)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,231) < 3)
            {
               outputText("你凭借");
               if(get_monster().get_HP() < 1)
               {
                  outputText("武力");
               }
               else
               {
                  outputText("性技");
               }
               outputText("制服了伊兹玛，站在被击败的虎鲨人面前。[say: 好啦，好啦！你赢了！真是的……赶紧开始吧，我感觉自己都快疯了。]她开始脱下衣服。[pg]");
            }
            else
            {
               outputText("伊兹玛以夸张的姿势倒进沙地里。[say: 哦不！我好像输了！请不要再蹂躏我了！]她一边大声嚷嚷，一边脱下衣服，那拙劣的演技差点让你笑出声来。[pg]");
            }
         }
         outputText("你要用身体的哪个部位占有她？");
         menu();
         if(get_player().hasCock())
         {
            addButton(0,"使用阴茎",victoryPenisIzma);
         }
         else
         {
            addButtonDisabled(0,"使用阴茎");
         }
         if(get_player().hasVagina())
         {
            addButton(1,"使用小穴",useVagooOnIzmaWin);
         }
         else
         {
            addButtonDisabled(1,"使用小穴");
         }
         addButton(2,"使用屁股",takeItInZeButtVictoryLikeFromIzma);
         addButton(14,"离开",leaveIzmaVictoryTease);
      }
      
      public function debugMenu(param1:Boolean = true) : void
      {
         get_game().debugMenu.debugCompEdit(saveContent,new SaveContent(null,null,null,null,null,null,null,null,null,null,null,null));
      }
      
      public function daughterWakeup() : void
      {
         _temp_1.lastNightmare += 0.5;
         registerTag("tigershark",TagFun_Impl_.fromBool(nightmareDaughterType == 1));
         registerTag("randomdaddy",TagFun_Impl_.fromString(nightmareParent));
         clearOutput();
         outputText("你醒来时，发现你的[If (tigershark) {虎鲨人|鲨鱼人}]女儿仍在你怀里。你轻轻把她叫醒，她打了个大大的哈欠。[say:早上好，[Dad]，]她睡眼惺忪地嘟囔着，从你的[bed]里爬了出去。她开始往外走，大概是去找" + (totalIzmaChildren() == 1 ? "伊兹玛" : "她的" + Utils.pluralize(totalIzmaChildren() - 1,"姐妹")) + "吃早餐，但随后又转过身来抱了你一下。[say:我爱你，[Randomdaddy]。谢谢你昨晚让我和你一起睡！]她开心地说道。你也抱了抱她，然后她便蹦蹦跳跳地跑去吃东西了。");
         doNext(playerMenu);
      }
      
      public function daughterNojob() : void
      {
         clearOutput();
         outputText("你爱她，也很喜欢她想让[dad]开心的心意，但这并不是她的责任。她不应该为你的需求操心。从她脸上的表情来看，这确实让她感到失望。[say:好吧，]她接受了。她咳嗽了一声，把情绪抛在一边，振作起来。[say:谢谢你陪我比赛！我爱你，[Dad]。]没有多说什么，她双臂环抱着你，在你的脸颊上亲了一下，然后游走继续玩耍了。");
         dynStats(DynStat.Lust(10));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function daughterNightmare() : void
      {
         saveContent.lastNightmare = get_time().days;
         var _loc1_:Array = [get_player().mf("爸爸","妈妈"),get_player().mf("爹地","妈咪")];
         if(Utils.randomChance(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,252) / totalIzmaChildren()))
         {
            nightmareDaughterType = 1;
         }
         else
         {
            nightmareDaughterType = 0;
         }
         var _loc2_:int = int([FlagDict_Impl_.arrayReadInt(KFLAGS.flags,251),FlagDict_Impl_.arrayReadInt(KFLAGS.flags,252)][nightmareDaughterType]);
         if(int(_loc1_.length) > _loc2_)
         {
            _loc1_.resize(_loc2_);
         }
         var _loc3_:Array = _loc1_;
         nightmareParent = _loc3_[Utils.rand(int(_loc3_.length))];
         registerTag("tigershark",TagFun_Impl_.fromBool(nightmareDaughterType == 1));
         registerTag("multiple",TagFun_Impl_.fromBool(_loc2_ > 1));
         registerTag("randomdaddy",TagFun_Impl_.fromString(nightmareParent));
         outputText("夜里某个时候，[if (builtcabin) {一阵敲响小屋门的声音将你吵醒，于是你迷迷糊糊地下床去看看是谁|有人拉扯你的睡袋，将你弄醒，于是你转头去看是谁}]。结果发现[if (tigershark) {[if (multiple) {你的一个虎鲨人女儿|你的虎鲨人女儿}]|[if (multiple) {你的一个鲨鱼女儿|你的鲨鱼女儿}]}][if (builtcabin) {站在门口。|坐在你的睡袋旁。}]");
         outputText("[pg][say: [Randomdaddy]，我做了个噩梦，今晚可以跟你一起睡吗？]她怯生生地问道。虽然你有点惊讶她来找的是你而不是伊兹玛，但你当然很乐意让可爱的女儿和你一起睡。[if (builtcabin) {你把她带回你的[bed]，她爬上床躺到你身边，|她钻进你的睡袋，}]尽可能贴近你蜷在一起。你伸出一只手臂搂住她，问起她的噩梦。");
         outputText("[pg][say: 那不是吓人的梦，只是很难过。你出去冒险，可是没有回来……我们一直等，一直等你回家，可你再也没有回来，]她回答道，小小的手指紧紧抓着你。你把你的[If (tigershark) {虎鲨人|鲨鱼}]女儿搂得更紧，告诉她你每次出去冒险都会回来的。她依偎到你的[if (hasbreasts) {乳房|胸膛}]上，你则轻轻抚摸着她的头发。她安静地窝在你怀里时，你给她唱起一首在英格纳姆时记住的摇篮曲。她很快就在你怀中睡着了，一动不动，只有平稳呼吸带来细微起伏。没过多久，你也再次睡了过去。");
         doNext(playerMenu);
      }
      
      public function daughterBlowjob() : void
      {
         clearOutput();
         outputText("拒绝这样的请求对你和她都没有好处。你依然用一只手臂撑在岸边，腾出另一只手，充满爱意地抚摸着女孩的头。你向她表明，你很欣赏她的主动，也很乐意接受她的帮助。因为这充满性暗示的举动而感到兴奋，这只小[if (tigershark) {虎}]鲨再次潜入水下，继续她之前的抚弄。[if (!isnaked) {她毫不耽搁地迅速解开你的衣物，当你那跳动的肉棒重获自由弹出来时，轻轻地拍打到了她。}]");
         outputText("[pg]你的女儿动作轻柔，用她的[if (cocklength < 6) {手指|双手}]在你的[cock]上前后套弄。渐渐地，你能感觉到一点先头汁液开始到达顶端，在让哪怕一滴滑落到水中之前，鲨鱼女孩就低下了头。她的舌头快速地在周围移动，你发现她的嘴比你刚才得到的用手套弄要温暖和享受得多。对这个进展感到满意，你发出一声满足的叹息。你的女儿抬头看着你，似乎对你的认可同样感到高兴。她的目光转回到手头的事情上[if (silly) {——或者说，嘴上的事情}]。");
         outputText("[pg]尽管她可能很享受用舌头在龟头周围打转，但这个孩子还是决定吞下你更多的长度。[if (cockLength < 4) {[if (cockThickness > cockLength) {虽然她嘴里还有空余，但她似乎对如何最好地为你那奶酪轮状的阴茎口交感到困惑|她毫不费力地将它吞没至根部，能够完全吞下如此微小的阴茎}]。|她下定决心，尽可能多地吞下你的阴茎，尽管在最初的[if (metric) {几厘米|几英寸}]之后她就显得有些吃力了。她可能太年轻了，无法处理更多。}] 她的吸吮表现出明显的狂热，但她漫无目的地摆动舌头仍然暴露了她孩子气的不成熟；然而，当那条湿热的触手滑过你的[cock]时，你并不想抱怨。你再次用双臂靠在岸边，让自己放松下来，任由你的女儿为你服务。");
         outputText("[pg]小鲨鱼的双手紧紧抓住你的[if (cockLength < 4) {[hips]|多余的长度}]，她的头前后摆动着。她嘴巴的方向也随之左右旋转，也许是为了在水中更顺畅地移动，但这同样让你感到非常舒服。你发出一声愉悦的呻吟，沉浸在这一刻。她抓住你的一只手松开了，在向下移动时短暂地擦过你的[leg]。不用看，你也能猜到她已经因为性欲高涨而无法抑制自己的需求了。吸吮力变得更强，催促你更快地达到高潮。");
         outputText("[pg]为了尽早让她下面休息一下，你不再克制，任由你的臀部迎合着她起伏的动作，几乎是在操这只年轻[if (tigershark) {虎}]鲨的脸。你下腹部的颤抖几乎像是高潮，尽管被周围流动的凉水稍微减弱了一些。这种感觉驱使你采取更加主动的姿态，太渴望释放了。你把手伸回女儿的头上，固定住她，现在你的动作更加粗暴了。女孩发现不需要抓握，便借此机会专注于自己的下体。水花四溅的声音对附近的人来说已经相当明显，但这并没有让你放慢速度。");
         outputText("[pg]在阵阵快感中，你的大腿和腹肌紧绷起来，你的[cock]跳动着，终于开始射精。所有积聚的紧张感都顺着女儿的喉咙流走。随着每一次喷射，你肉棒的顶端在她柔软、火热的口腔内壁抽动，在高潮的极度敏感中强烈地刺激着你。一旦最初的几波高潮过去，出于对她在下面待了多久的担忧，你把她拉了起来。");
         outputText("[pg]孩子冲出水面，气喘吁吁，但明显很高兴。[say:我做得好吗？]她问道。你当然会这么说，她带着骄傲的表情接受了你的认可。这个[if (tigershark) {有条纹的}]鲨鱼女孩拥抱了你。[say:我爱你，[Dad]。]你回抱了她，表达了同样的感情，拍了拍她，然后她就跑去继续玩耍了[if (kids > 1) {，和她的姐妹[if (kids > 2) {们}]一起}]。");
         get_player().orgasm("Dick");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function confirmBuyPorn() : void
      {
         clearOutput();
         outputText("你告诉她，你肯定会买下这本书。你交出400颗宝石，她则把书给了你。");
         outputText("[pg]<b>获得关键物品：伊兹玛的书 - 色情画册！</b>");
         get_player().createKeyItem("Izma\'s Book - Porn",0,0,0,0);
         var _loc1_:Player = get_player();
         _loc1_.set_gems(_loc1_.get_gems() - 400);
         statScreenRefresh();
         doNext(tradeWithFuckingSharkBitches);
      }
      
      public function confirmBuyEtiquetteGuide() : void
      {
         clearOutput();
         outputText("你告诉她，你绝对会把这本书买下来。你交出500颗宝石，她便把书递给了你。");
         outputText("[pg]<b>获得关键物品：伊兹玛的书 - 礼仪指南！</b>");
         get_player().createKeyItem("Izma\'s Book - Etiquette Guide",0,0,0,0);
         var _loc1_:Player = get_player();
         _loc1_.set_gems(_loc1_.get_gems() - 500);
         statScreenRefresh();
         doNext(tradeWithFuckingSharkBitches);
      }
      
      public function confirmBuyCombatManual() : void
      {
         clearOutput();
         outputText("你告诉她，你肯定会买下这本书。你交出400颗宝石，她则把书给了你。");
         outputText("[pg]<b>获得关键物品：伊兹玛的书 - 战斗手册！</b>");
         get_player().createKeyItem("Izma\'s Book - Combat Manual",0,0,0,0);
         var _loc1_:Player = get_player();
         _loc1_.set_gems(_loc1_.get_gems() - 400);
         statScreenRefresh();
         doNext(tradeWithFuckingSharkBitches);
      }
      
      public function chooseYourIzmaWeapon() : void
      {
         clearOutput();
         if(get_player().get_gender() == 0)
         {
            nonFightIzmaSmexASS();
         }
         else if(get_player().get_gender() == 1)
         {
            nonFightIzmaSmexPAINUS();
         }
         else if(get_player().get_gender() == 2)
         {
            nonFightIzmaSmexCUNTPUSSYSNATCHQUIM();
         }
         else
         {
            outputText("你要把注意力集中在哪一种性器上？");
            menu();
            addButton(0,"男性",nonFightIzmaSmexPAINUS);
            addButton(1,"女性",nonFightIzmaSmexCUNTPUSSYSNATCHQUIM);
         }
      }
      
      public function chooseToFlirtWithIzma() : void
      {
         spriteSelect(SpriteDb.get_s_izma());
         clearOutput();
         outputText("你对伊兹玛笑了笑，告诉她你很感谢这个提议，而且你觉得无论她是当妈妈还是当爸爸，都会很美。事实上，光是想象她挺着沉甸甸的孕肚，");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,439) == 0)
         {
            outputText("她那根巨大的肉棒几乎只能勉强从塞满宝宝的肚子前探出来，");
         }
         outputText("DD罩杯的乳房里满是乳汁，看着她在营地里摇摇晃晃地走来走去，这画面就已经很诱人了。她朝你坏笑。[say: 你可真是个变态。]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,439) == 0)
         {
            outputText("但她低头看向两腿之间，看见自己巨大的肉棒正从裙子里探出来。");
         }
         else
         {
            outputText("但她低头看去，只见自己硬挺的乳头正高高翘起。");
         }
         outputText("[say: 不过，你用话描绘出来的画面还真挺生动的……][pg]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,439) == 0)
         {
            outputText("你也回以一笑，问她脑海中有没有想象过你怀上她孩子的样子。[say: 呃……]她的话音渐渐停住。");
            if(get_player().get_gender() <= 1)
            {
               outputText("[say: 那有点怪啊，老兄……我不确定掌管这个世界的神会不会允许那种事发生。感觉太胡闹了。]");
               doNext(get_camp().returnToCampUseOneHour);
               return;
            }
            outputText("[say: 哦……你会变得那么丰腴、那么有曲线，性感极了，]她低声说道。你朝她走近。你俯身凑过去，提到你愿意就在此时此地试着造个孩子。[say: 我……哦，哇。我们当然可以试试，]她回答道，一把搂住你的脖子，把你拉过去吻住。");
         }
         izmaSexMenu();
      }
      
      public function chooseNotToFlirtWithIzma() : void
      {
         spriteSelect(SpriteDb.get_s_izma());
         clearOutput();
         outputText("你感谢伊兹玛陪你进行了这场有趣的谈话，尽管话题最后有点跑偏。随后你转身离开，把她留给自己的思绪。[pg]");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function chooseIzmaTooth() : void
      {
         clearOutput();
         outputText("你礼貌地道了声谢，接过她递来的牙齿。");
         FlagDict_Impl_.arrayWriteString(KFLAGS.flags,234,get_consumables().TSTOOTH.get_id());
         get_combat().cleanupAfterCombat();
      }
      
      public function chooseIzmaGloves(param1:Boolean = true) : void
      {
         clearOutput();
         outputText("你直视着她的眼睛，告诉她你想要她的护手。[pg]");
         outputText("[say: 什、什么？]她茫然地问道。你指向那副钩爪护手；在" + (param1 ? "做爱" : "战斗") + "之后，它们正被丢在海滩上。[say: 可那是我的武器！我还需要它来——][pg]");
         outputText("你漫不经心地一挥手，打断了她。你再次重申自己的要求，提醒她现在是谁说了算，随后又补上一句：有人已经证明自己比她强得多，却还看上了她正在使用的武器，她应该感到受宠若惊才对。[pg]");
         outputText("她琢磨了一会儿你的话，然后温顺地从地上捡起那副护手，放进你的手里。");
         FlagDict_Impl_.arrayWriteString(KFLAGS.flags,234,get_weapons().H_GAUNT.get_id());
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,235,FlagDict_Impl_.arrayReadInt(_loc2_,235) + 1);
         get_combat().cleanupAfterCombat();
      }
      
      public function childToggle() : void
      {
         var _loc1_:* = null as IMap;
         spriteSelect(SpriteDb.get_s_izma());
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,248) == 0)
         {
            outputText("你问伊兹玛，她有没有想过你们两个一起生孩子的事。[pg]");
            outputText("伊兹玛显得有点不好意思，但随后她的表情变得坚定起来。[say: 有，我想过。我想和你组建一个家庭，但如果你觉得自己还没准备好，我会继续服用我的草药。][pg]");
            outputText("你要让她停止服用避孕药吗？");
            doYesNo(childToggle,firstTimeDeclineIzmasKdiddlezlijfhdjkfhslkfbsjkhfbs);
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,248,FlagDict_Impl_.arrayReadInt(_loc1_,248) + 1);
            return;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,249) == 1)
         {
            outputText("你告诉伊兹玛，你想了一阵，觉得你们俩应该先把生孩子的事暂时放一放，至少先缓一段时间。伊兹玛看起来有些难过，但她还是点了点头。[say:遵照您的命令，阿尔法，]她对你说道。她慢慢地从你身边走开，腰臀左右摇曳，姿态诱人得很；你觉得她大概是在试图诱惑你改变主意。不过，见你没有开口，她便伸手探进自己的箱子里翻找出一株避孕草药，转向你，特意让你看见她把它服下。[pg]");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,249,0);
         }
         else
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,249,1);
            if(totalIzmaChildren() > 0)
            {
               outputText("你告诉伊兹玛，你已经准备好再次尝试要孩子了。她欣喜地咧嘴一笑，突然朝你扑了过来，给了你一个让你几乎喘不过气的吻。然后，趁你还在回过神的时候，她飞快跑开，一口灌下了那瓶药水——你猜那一定是某种用来抵消她体内避孕药效的“解药”。看着她眼中闪烁的光芒，以及她朝你逼近时的姿态，她似乎打算现在就开始造孩子……[pg]");
            }
            else
            {
               outputText("你用心照不宣的眼神看向伊兹玛，告诉她你已经准备好开始要孩子了——如果她也准备好了的话。[pg]");
               outputText("她呆呆地盯着你看了一会儿，随后双眼亮了起来，脸上绽开了最灿烂的笑容，还露出一口鲨鱼般的利齿，更添几分震慑力。她几乎是蹦跳着来到自己的箱子前，一把掀开箱盖，差点整个人都钻了进去；她那欢快摇摆的尾巴也让你把她线条优美的臀部看了个清楚。她带着胜利般的欢呼钻出来，手指间捏着一个小药水瓶。她拔开软木塞，一口把药水灌了下去，接着将瓶子在手中捏碎，转身面向你，脸上带着坏坏的愉快表情，摇曳着朝你走来。[say:那么……我们开始吧，好吗？]她柔声说道。[pg]");
            }
         }
         doNext(izmaFollowerMenu);
      }
      
      public function campCuntManual() : void
      {
         spriteSelect(SpriteDb.get_s_izma());
         clearOutput();
         outputText("你问伊兹玛愿不愿意和你一起读《战斗手册》众多期刊中的一本。她窃笑一声，随手抓起一期。[say: 当然。不过说真的，我从没想过像你这么厉害的人还需要更多战斗技巧，]她打趣道，一边在岩石上找了个舒服的姿势。你坐到她身边一起阅读，并回敬说，如果要说的话，你只是趁这个机会教她一些战斗技巧。伊兹玛闻言半真半假地瞪了你一眼，不过你觉得她知道你只是在逗她。[pg]");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,253,11);
         var _loc1_:Number = Utils.rand(3);
         if(_loc1_ == 0)
         {
            outputText("你学会了几种新的防御架势，看起来相当有前途。");
            dynStats(DynStat.Tou(2));
         }
         else if(_loc1_ == 1)
         {
            outputText("快速浏览之后，你读完了这本书。你没有学到新的战斗招式，但对战斗整体机制、节奏和策略的回顾还是帮上了忙。");
            dynStats(DynStat.Inte(2));
         }
         else
         {
            outputText("读完这本手册后，你对如何在出手时更好地利用自身重量、同时又不暴露破绽有了新的理解。非常实用。");
            dynStats(DynStat.Str(2));
         }
         outputText("[pg]大约一个小时后，你打了个哈欠，伸了伸懒腰，告诉伊兹玛你要去处理别的事了。她听到你的话后懒懒地点了点头，却没有从那本旧书上抬起眼。[say: 没问题，[name]，我还要再读一会儿这个，]伊兹玛说道。你也向她点点头，然后转身离开。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function buyBookPorn() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_izma());
         outputText("你问伊兹玛愿不愿意把这本书让给你，这样你的书架上就能多添一本书。[say:我不确定。这种书可是相当不错的类型，我通常不会把它让出去。不过，这类书我确实有好几本。如果你出400颗宝石，我倒是愿意让一本给你。]");
         if(get_player().get_gems() >= 400)
         {
            outputText("[pg]你要买吗？");
            doYesNo(confirmBuyPorn,tradeWithFuckingSharkBitches);
         }
         else
         {
            outputText("[pg]很遗憾，你没有足够的宝石。");
            doNext(tradeWithFuckingSharkBitches);
         }
      }
      
      public function buyBookEtiquetteGuide() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_izma());
         outputText("你问伊兹玛愿不愿意把这本书让给你，这样你的书架上就能多一本书了。[say: 我也说不好。这些书可不好弄到。不过，这种书我确实有好几本。要是你愿意出500颗宝石，我可以让给你。]");
         if(get_player().get_gems() >= 500)
         {
            outputText("[pg]你要买吗？");
            doYesNo(confirmBuyEtiquetteGuide,tradeWithFuckingSharkBitches);
         }
         else
         {
            outputText("[pg]很遗憾，你没有足够的宝石。");
            doNext(tradeWithFuckingSharkBitches);
         }
      }
      
      public function buyBookCombatManual() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_izma());
         outputText("你问伊兹玛是否愿意把这本书让给你，好让你的书架上多一本书。[say:我不确定。这些书很稀有。不过，这类书我确实有好几本。要我放手的话，400枚宝石。]");
         if(get_player().get_gems() >= 400)
         {
            outputText("[pg]你要买吗？");
            doYesNo(confirmBuyCombatManual,tradeWithFuckingSharkBitches);
         }
         else
         {
            outputText("[pg]很遗憾，你没有足够的宝石。");
            doNext(tradeWithFuckingSharkBitches);
         }
      }
      
      public function backToCamp() : void
      {
         clearOutput();
         izmaSprite();
         outputText("你让她回营地去；在那里，她对她的阿尔法会更有用。");
         outputText("[pg][say: 你说了算。]她咧嘴一笑，皱了皱鼻子。[say: 能再次待在湖边感觉不错，不过我也挺高兴能离开这里：农活可算不上多有意思。]你让伊兹玛收拾好自己的东西，然后离开。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1082,0);
         doNext(get_game().farm.farmCorruption.rootScene);
      }
      
      public function askIzmaAboutNobleShirt() : void
      {
         clearOutput();
         registerTag("shirtStage",TagFun_Impl_.fromInt(get_undergarments().SEA_SHIRT.saveContent.armorStage));
         outputText("你从一个狂热信徒那里顺手偷来了一件看起来挺不错的衬衫，结果现在它脱不下来了。[if (shirtStage > 2) {更糟的是，它还在变化|毫无疑问，这可不是什么好兆头}]。伊兹玛皱起眉，揉了揉太阳穴。[say:这……其实有点熟悉。]");
         outputText("[pg]听她这么说，你不禁有些惊喜。也许她能帮你摆脱眼下的困境，至少也能说明更多情况。");
         outputText("[pg][say: 这事说来复杂……我小时候，村里的长老们在研究魔法。他们想让那片养育了我们族人世世代代的湖，变得和岸上一样适宜居住。] 她努力回想更多细节，表情有些痛苦。[say: 当时有很多衣物和仪式用具。我那时才7岁，所以知道得不多。我只知道，我没有经历你现在这种情况，不过也许长老们也造出了那东西？]");
         outputText("[pg]魔法并不是她的强项，所以你也不指望她能给出更深入的见解。这想法有些牵强，但你还是问她，知不知道那些长老现在在哪里。");
         outputText("[pg]伊兹玛困惑地眨了眨眼。[say: 我觉得就算他们还在，我也认不出他们；而且我不认为他们的心智在腐化后还能保留下足够多，足以帮上什么忙。]");
         get_undergarments().SEA_SHIRT.saveContent.izmaAsked = true;
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function anemoneWrasslin() : void
      {
         clearOutput();
         outputText("你在营地里大步走着，看到小A正晃悠悠地走向溪边取更多水。你已经能看见" + (totalIzmaChildren() > 1 ? "你的一个鲨鱼女儿" : "你的鲨鱼女儿") + "游向岸边去见她。你知道鲨鱼人和海葵并不总是那么合得来，于是以防万一，便在附近留意着。伊兹玛一向警觉地看顾自己的子嗣，很快也加入了你。");
         outputText("[pg]小A刚靠近水边，那个虎鲨人就猛地冲出来，把她扑倒在地。你本能地想冲过去，但小A既没有尖叫，也没有试图逃开。");
         outputText("[pg][say: 来啊，你这蓝皮贱货，该为<b>我的</b>水交过路费了！]那个有条纹的女孩命令道。看来霸凌这种事，真是能跨越文化和物种。小A只是瞪着袭击她的人。[say: 不说话，是吧？你得学会尊重这里的阿尔法，]虎鲨人狡黠地笑着说道。她开始用肉棒蹭上海葵时，小A立刻反击，抓住那条鲨鱼，扭身把她摔到地上。两人在草地上扭打起来，翻滚着陷入激烈的搏斗。不过，多亏你一直以来给她的训练，小A最终成了胜者。伊兹玛愤怒地朝她低吼，显然急着维护自己的后代。");
         saveContent.daysSinceAneFight = 0;
         menu();
         addButton(0,"阻止打斗",stopTheFight);
         addButton(1,"放任不管",letItBe);
      }
      
      public function acceptIzmaAsYourBitch() : void
      {
         spriteSelect(SpriteDb.get_s_izma());
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,236) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,43) == 1)
         {
            outputText("你温柔地笑了笑，双手搭上她的肩膀，将她拉近，深深地吻住了她。她几乎在你的触碰下融化，口中贴着你的嘴发出呻吟，同时用双臂和尾巴缠住你的腰。[pg]");
            outputText("等你们从这个吻中分开时，两人都在喘息。几缕唾液仍将你们连在一起。你把她银色的头发拨到耳后，告诉她你非常乐意让她住进你的营地。她发出一声欢喜的声音，紧紧抱住你，然后冲向自己那点简陋的物资，开始收拾起来。[pg]");
            outputText("你领着她回营地时，看着她这么急切地想和你住在一起，忍不住笑了出来。她一路上嘴巴就没停过，不停说着以后会有多好玩、你们俩能做多少爱。不过，当她看见艾米莉正在你的营地里窜来窜去时，她一下子完全安静下来，还歪了歪头。[pg]");
            outputText("你抵达时，这名鼠人正从你的补给里拿东西吃；她一发现你回来了，就心虚地转过身，把东西藏到背后。[say:啊，[name]，很高兴看到你回来！]她急急忙忙地吱声说道；她的高兴是真心的，但显然也有点尴尬。然后她意识到你不是一个人回来的。[say:啊……你知道有个什么鲨鱼女孩跟在你后面，对吧？]她看上去很警惕，随时准备在情况不对时战斗或逃跑。[pg]");
            outputText("伊兹玛歪了歪头，扶正眼镜，好把艾米莉看得更清楚些。[say:嗯，其实我是虎鲨人，]她平淡地说道。[say:我还是[name]的贝塔。你是谁？哦！你是那种鼠人，对吧？][pg]");
            outputText("艾米莉只是疑惑地看着她。[say:是的，我是老鼠。]她的语气里满是“这不是明摆着吗？”的意味。[say:抱歉，我以前见过一些有条纹的鲨鱼女孩，但我不知道你们还有专门的叫法……等等，你刚才说你是[name]的贝塔是怎么回事？贝塔是什么？][pg]");
            outputText("伊兹玛皱起眉，用赤脚蹭了蹭地面。你尴尬地干笑一声，尽力向她解释你是怎么遇见伊兹玛的、你们之间的几次切磋，以及在你几次获胜后，她最终如何彻底向你臣服，并宣称你是她的阿尔法。[pg]");
            outputText("之后，你转向伊兹玛，向她解释你和艾米莉的过去，讲述她那被毁村庄的故事，讲述你是如何爱上她，又如何与她生下许多孩子，以此重新建立未受污染的鼠人人口。伊兹玛吸了一口气，听得入了迷。[say: 这太不可思议了；你们两个都高尚得惊人。][pg]");
            outputText("[say:我——你真的这么想？]艾米莉问道，看起来既震惊又高兴，还因为这句夸奖而害羞地红了脸。接着她摇了摇头。[say:啊，嗯……我想这也不算意外。至少她看起来脑子确实正常，不像某些地精或者喝精液的妖精……不过，你在外面和另一个女人鬼混之前，至少也该先问问我吧？]她抱怨道。[pg]");
            outputText("随后她露出若有所思的神情。[say:嘿，说起来，如果你是鲨鱼女孩——抱歉，虎鲨人——那你要怎么在这里活下去？你们不是一天里大约有三分之二的时间都得待在水下才能生存吗？]艾米莉困惑地问道。[pg]");
            outputText("[say:啊，嗯……湖离这里不算太远。而且我觉得我们一路过来时好像看见了一条小溪，]她解释道。[say:只要我定期让身体沾点水，就没问题。再说，能用上更干净些的水也挺不错。]她嘟囔着，又调整了一下怀里抱着的箱子。[say:抱歉，这东西快把我烦死了，我得把它放下。]她从旁边走过去放下自己的箱子，但同时露出一个真诚的笑容。[say:很高兴认识你，艾米莉；我真希望我们以后能更了解彼此，]她说道。[pg]");
            outputText("艾米莉看着这名虎鲨人去探索营地，随后闪电般窜到你身边，在你耳边低声嘶道。[say:别以为我不生气，你事先根本没跟我商量！我只是还没蠢到去挑战那么危险的家伙——我亲眼见过鲨鱼女孩把来湖边喝水的牛头人放倒然后吃掉！]她狠狠掐了你一下，以表达自己的不满。[pg]");
            outputText("你向她道歉，但告诉她你现在不会就这么把伊兹玛赶出去。她已经住下了，鼠人最好接受这一点——打起来对谁都没有好处。[pg]");
            outputText("[say: 我会对她客气的，这点你不用担心……但你真的确定我们能信任她吗？从那个湖里出来的东西或人，我都很难放心接受，]艾米莉问你，同时看着伊兹玛好奇地开始翻看你们共有的物品。[pg]");
            outputText("你轻声指出，你当初是在湖边的废弃村庄里遇见艾米莉的，又问她以前是用什么洗澡的。她瞪着你，但你没有退让，表示自己信任伊兹玛，并指出她和大多数被恶魔腐化的生物不同。她本可以一见面就袭击你、试图强奸你——可她从头到尾都很礼貌，愿意交谈，也懂得克制。就算话题谈到了性爱，她也是先和你商量，并明确告诉你选择权在你，拒绝也不会有什么后果。这个世界上还有多少其他存在不会先强奸再说，甚至根本不问呢？[pg]");
            outputText("[say:这点你说得倒也没错……]艾米莉嘟囔着，带着明显的好奇盯着伊兹玛。[say:嗯……好吧，我还是得盯着她点，但我想她至少赢得了被暂且信任的资格。营地里能多一个说话的人，也许也不错……]她的声音渐渐低下去，含糊地嘟囔着；这时伊兹玛终于收拾好了自己的位置，回到你身边。[pg]");
            outputText("让你好奇的是，她竟然把自己的床铺放在离你床铺有段距离的地方。你朝她挥了挥手，告诉她睡在你附近没关系。她则疑惑地看着你。[say:嗯……]她结结巴巴地说，[say:我以为我的阿尔法会希望我睡得远一些，]她说道。你连忙安抚她，坚持让她把床铺挪近些。她急于服从，便把铺盖拖到你的旁边，然后羞涩地对你笑了笑。");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,236,-1);
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,237) == 0 && get_marbleScene().marbleAtCamp())
         {
            outputText("你温柔地笑了笑，双手搭上她的肩膀，将她拉近，深深地吻住了她。她几乎在你的触碰下融化，口中贴着你的嘴发出呻吟，同时用双臂和尾巴缠住你的腰。[pg]");
            outputText("等你们从这个吻中分开时，两人都在喘息。几缕唾液仍将你们连在一起。你把她银色的头发拨到耳后，告诉她你非常乐意让她住进你的营地。她发出一声欢喜的声音，紧紧抱住你，然后冲向自己那点简陋的物资，开始收拾起来。[pg]");
            outputText("你领着她回营地时，看着她这么急切地想和你住在一起，忍不住轻笑起来。她一路上嘴巴就没停过，不停说着以后会有多好玩、你们俩能做多少爱。不过，当她看见玛布尔正在你的营地周围巡逻时，她一下子完全安静下来，还歪了歪头。[pg]");
            outputText("她一看到你就笑容满面，小跑着迎了上来。[say:亲爱的，真高兴你……]这名牛娘注意到你身后的伊兹玛后，话音渐渐停住，表情似乎阴沉了下来。[say:这是谁，亲爱的？]她问道。伊兹玛温暖地笑着伸出手。[say:我是伊兹玛，[name]的贝塔，]她高兴地说道。看来她并不介意你有另一个爱人，不过你不确定玛布尔是否也有同样的感受。[say:贝塔？]这名牛娘问道，显然有些好奇，但脸上仍带着轻蔑。[pg]");
            outputText("你叹了口气，解释了你是怎么遇见伊兹玛的、她究竟是什么、你们之前的谈话，以及后来你们之间的切磋。在几次败在你手下之后，伊兹玛宣称你是她的阿尔法，并表示她愿意为你做任何事。考虑到营地里多一名娴熟的战士和学者会很有帮助，你便允许她搬进来。[pg]");
            outputText("玛布尔点点头，似乎勉强挤出一个笑容。[say: 给我们一点时间，]她对伊兹玛说道，然后拉起你的手，颇为强硬地把你拽到营地的另一边。噢，太好了，又要来那种谈话了。[pg]");
            outputText("[say: 亲爱的，你到底在搞什么？！]等你们俩走到伊兹玛听不见的地方后，她压低声音嘶声说道。[say: 你至少也该先跟我商量一下，而不是直接把某个陌生人带进营地！而且她还是湖里那些……腐化怪物之一！]她说道。可以肯定的是，她看起来比你过去见过的任何时候都要愤怒。你叹了口气，试着解释，告诉她尽管伊兹玛外表如此，但她比任何来自那片湖的生物都要好得多。她友善、体贴，最重要的是，在涉及性事时，她总是给你选择的余地。这可比你能从某个“腐化怪物”身上期待的要多得多。[pg]");
            outputText("玛布尔咬紧牙关，摇了摇头。[say: 我不喜欢这样，亲爱的。我不喜欢，也绝对不会支持。你只要把她管好，让她离我远点，之后再说吧，]牛娘说完，便气冲冲地踩着蹄子走开了。[pg]");
            outputText("等你回到伊兹玛身边时，她好奇地看着你。[say: 所以，你和她又是什么故事？]她问。你叹了口气，告诉伊兹玛你是如何在惠特尼的农场遇见玛布尔，又是如何随着时间推移逐渐和她建立起关系的。接着你说起令人遗憾的事：你甚至还没意识到她的牛奶具有腐化性，就已经对它上了瘾。");
            if(get_player().hasPerk(PerkLib.MarblesMilk))
            {
               outputText("你无法戒掉这份瘾，而现在如果没有她稳定供应的牛奶，你就会死。");
            }
            else
            {
               outputText("不过值得庆幸的是，你最终摆脱了她牛奶的控制，也意识到尽管你们之间发生过那么多事，你依然爱着玛布尔，于是让她搬来和你一起住。");
            }
            outputText("[pg]");
            outputText("伊兹玛听你讲完后咬紧牙关，从齿缝间吸了口气。[say: 那头……该死的母牛……]她低吼着，那几乎压不住的怒火让你咽了口唾沫。[saystart]她夺走了你，我完美的阿尔法，还");
            if(get_player().hasPerk(PerkLib.MarblesMilk))
            {
               outputText("把你变成了一个软弱的瘾君子");
            }
            else
            {
               outputText("给你下药，把你拖进了一段扭曲的关系");
            }
            outputText("。[sayend]你紧张地干笑一声，向她保证事情并不是那样，但伊兹玛根本不想听。[say: 我现在会保持沉默，但要是那头母牛敢越界……]她没有继续说下去，尖牙却弹了出来。随后她走去把自己的铺盖和箱子安置在你的床边。看来她想离你的床近一些，好保护你。至少，这是你的理解。你叹了口气，摇了摇头。看来这两人恐怕永远也不会真正亲近起来。");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,237,-1);
         }
         else
         {
            outputText("你温柔地笑了笑，双手搭上她的肩膀，将她拉近，深深地吻住了她。她几乎在你的触碰下融化，口中贴着你的嘴发出呻吟，同时用双臂和尾巴缠住你的腰。[pg]");
            outputText("等你们从这个吻中分开时，两人都在喘息。几缕唾液仍将你们连在一起。你把她银色的头发拨到耳后，告诉她你非常乐意让她住进你的营地。她发出一声欢喜的声音，紧紧抱住你，然后冲向自己那点简陋的物资，开始收拾起来。[pg]");
            outputText("你带着她前往营地时，看着她如此迫不及待地想和你一起生活，忍不住轻笑起来。而她一路上似乎完全停不下来，不停说着那会有多有趣，还有你们俩能尽情做爱多少次。虎鲨人一点也不耽搁，把自己的箱子安置在营地里离你最远的边缘，然后铺好了她的铺盖。[pg]");
            outputText("让你好奇的是，她似乎决定让自己的床铺离你的床远一些。你朝她招了招手，告诉她睡在你附近没关系。她疑惑地看着你。[say: 呃……]她结结巴巴地说，[say: 我以为我的阿尔法会希望我睡得远一点，]她说道。你连忙安抚她，坚持让她把床铺放近些。她急于服从，便把铺盖拖到你的铺盖旁边，然后害羞地朝你笑了笑。[pg]");
         }
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,238,1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function RadarIzmaLeaveHerWangUnWingWanged() : void
      {
         spriteSelect(SpriteDb.get_s_izma());
         clearOutput();
         outputText("虽说你觉得伊兹玛应该会喜欢手交，但你现在并不太想去刺激她的那根家伙。伊兹玛注意到你一瞬间盯着她那根相当粗大的肉棒，便对你露出狡黠的笑容。[say:来吧，贱货！好好取悦你的“阿尔法”；你明明也想这么做！]她轻快地说道。你回望着她，温和地告诉她，她的阿尔法并不想那么做；理由你自己清楚，但你就是不想做。她自信的坏笑几乎立刻消失了。[say:哦……抱歉。我刚才有点太投入了。如果你不介意的话，我就一边支配我的阿尔法，一边自己撸我的肉棒，]她低声说道。你也对她笑了笑，点点头，拍了一下她的屁股，示意她动起来。你的虎鲨人情人毫无顾忌地咯咯笑着，在你腿上上下颠动，用小穴里的触须粗暴地玩弄你的肉棒。你满足地呻吟着，双手迅速摸向她的臀部，将其牢牢握住。在快感和性本能的驱使下，伊兹玛猛烈地套弄着自己的家伙，一边幸福地呻吟，紧闭的眼皮也因小穴被你的肉棒肆意侵犯、手里又撸着自己阴茎的双重快感而抽动。她拼命想压住那股性快感的冲击，但她咬紧牙关，张开嘴想发出一声有力的呻吟时，表情终究暴露了她愈发高涨的情欲；在短短几个瞬间里，她大张的嘴里什么声音都没发出来，随后才爆发出一连串拖长而凌乱的哀叫。");
         outputText("[pg]伊兹玛咬住嘴唇作为回应，显然还想再多享受一会儿骑在上面的感觉。但那一声声沉醉的低吼与呻吟清楚地表明，这个虎鲨人已经撑不了多久了。她的小穴内壁紧紧夹住你的肉棒。她大声尖叫，浓稠的精液从她的肉棒里一股股射出，她双手捧住龟头，免得精液喷到你的脸上或身上。");
         outputText("[pg]你自己的肉棒也同样被挑逗折磨得够呛——而当她的内壁收紧，触须也竭尽全力地勒挤时，你终于撑不住了。你也喊出声来，将精液灌满她的体内");
         if(get_player().hasVagina())
         {
            outputText("，你的小穴也");
            if(get_player().vaginas[0].vaginalWetness <= 3)
            {
               outputText("滴着");
            }
            else if(get_player().vaginas[0].vaginalWetness <= 4)
            {
               outputText("喷涌着");
            }
            else
            {
               outputText("倾泻而下");
            }
            outputText("的雌性体液洒落在你们身下黏腻的地面上");
         }
         outputText("；你和她一样迫不及待地想要释放出来。[pg]");
         izmaPreg();
         if(get_player().cumQ() < 500)
         {
            outputText("你能感觉到伊兹玛的子宫被你的精液填满，她因这纯粹的快感而颤抖。");
         }
         else
         {
            outputText("你在伊兹玛体内射精时，她发出响亮的尖叫；你那非人的精液量把她的肚子撑得鼓胀隆起，几乎让她又一次高潮。");
         }
         outputText("完事后，伊兹玛从你身上滚下来，仍旧大口喘着气。[say:太棒了……我的阿尔法。][pg]");
         outputText("你一开始忙着喘气，根本没法回答。但随后，你微微一笑，撑起身子，在她脸颊上轻轻一吻。让你意外的是，这个总是欲火难耐的鲨鱼女孩竟然因为这个举动欣喜地红了脸。你们俩悠闲地穿好衣服，然后各自离开；你回到营地，伊兹玛则回到溪流里浸泡休息。");
         get_player().orgasm("Generic");
         dynStats(DynStat.Sens(-2));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function RadarIzmaCumInYourChest() : void
      {
         spriteSelect(SpriteDb.get_s_izma());
         clearOutput();
         outputText("你牢牢握住她，将她那根修长的肉棒对准自己的胸口，然后闭上眼，期待着她高潮时的释放。她没有让你失望，甜腻又咸涩的精液气味涌入你的鼻腔，仿佛在示意你的身体迎接她滚烫的精液。你还没来得及真正沉浸在爱人的气味中，她的精液便猛烈地");
         if(get_player().biggestTitSize() >= 1)
         {
            outputText("打在你的[chest]之间，并涂满");
         }
         outputText("你的胸口");
         if(get_player().biggestTitSize() < 1)
         {
            outputText("，将那里");
         }
         outputText("厚厚地糊满。爱人的精液香气让你难以承受，你发出一声充满满足、毫不减弱的长嚎，最后一次挺身深深插入她体内，执意要把自己的肉棒牢牢埋进她的子宫，无意识地给你的种子争取受精你顺从伴侣所需的机会。伴随着巨大的力道，你的精液喷涌而出，冲进她小穴深处，");
         if(get_player().cumQ() < 750)
         {
            outputText("用滚烫的精液充分润滑着她被干弄的小穴，让你的贝塔在幸福的快感中叫出声来。");
         }
         else
         {
            outputText("用大量精液灌满她的爱道，以至于她的小穴里响起一连串湿滑黏腻的声音。伊兹玛的表情流露出彻底难以置信的神色，你把自己的精液塞满她体内；随着你肉棒肌肉一次次收缩，更多精液射入她身体，她体内的精液也开始稳定地向外流出。");
         }
         outputText("[pg]直到你的高潮感终于传递到她身上，伊兹玛用双腿缠住你，双手的爪子划过你的后背，拼命想把你抱在怀里，而你则将骨盆紧紧抵在她身上。她的尾巴也随着高潮的抽搐作出回应，在你们身下剧烈甩动。被你滚烫的精液塞得满满当当，对这可怜的虎鲨人来说似乎太过强烈；当你");
         if(get_player().cumQ() < 750)
         {
            outputText("瘫靠在她身上，为了给她的小穴授精而耗尽力气，不住喘息时，她的眼睛因极度满足而向上翻去。");
         }
         else
         {
            outputText("用你的肉棒搅动她子宫里涌动的精液，将大量湿热的浓液撞上她的宫颈，并强行灌进她体内深处。你肿胀肉棒中喷出的精液最终渐渐止息，持续的插入与精液渗流也随之结束。你满足地叹了口气，从伊兹玛体内抽出，带出一大缕精液，也让她的小穴缓缓流出情欲的湿痕。");
         }
         outputText("[pg]你们两人翻身分开，喘息着大口呼吸。她咯咯笑着，用舌头舔过自己弄出的那片狼藉；舌尖在[oneCock]上流连。[say: 嗯，真是太棒了，]伊兹玛说道，[say: 只要你想，就随时来把我填满吧。]你冲伊兹玛咧嘴一笑，命令她把每一滴都舔干净。");
         outputText("[pg]当她把自己的阿尔法清理干净后，她又花了片刻向你表达对这场交配的感激，亲吻着你的胸膛，一路吻上你的脖颈。");
         izmaPreg();
         get_player().orgasm("Tits");
         dynStats(DynStat.Sens(-2));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function IzmaWins() : void
      {
         saveContent.previousVictoryTeased = false;
         clearOutput();
         if(get_player().hasStatusEffect(StatusEffects.Infested))
         {
            get_game().mountain.wormsScene.infestOrgasm();
            outputText("[pg]你把那一团蠕虫般的东西推到伊兹玛脚边的沙地上，她惊恐地看着这一幕，直到几只寄生虫开始顺着她的脚踝往上爬，目标直指她的肉棒，她才从发愣中回过神来。她尖叫一声跳开，然后把脚在沙地里用力拖蹭，把那些扭动的害虫甩掉或碾碎。[say: [name]，太恶心了！走开！走开，别再跟我说话！呕！] 她抓起自己的书箱就跑，沿着海滩逃走时还踢起一片沙子。");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,233,1);
            get_player().orgasm("Generic");
            get_combat().cleanupAfterCombat();
         }
         else
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,231) >= 0)
            {
               outputText("伊兹玛围着你战败倒地的身体踱步，轻轻笑了几声。[say: 嗯，就这地方的水平来说，你还算打得不错。不过嘛，还是赢不了我。]");
            }
            else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,231) >= -2)
            {
               outputText("[say: 你知道吧，就算我们是朋友，也不代表你得放水……你刚才是在放水，对吧？] 伊兹玛双手叉腰问道。");
            }
            else
            {
               outputText("伊兹玛叹了口气，对你摇摇头，把一只脚踩在你的肚子上。[say: 你是故意的，对吧？嗯，行吧。既然你这么喜欢我的肉棒，我觉得你倒是挺适合当我的伴侣……]");
            }
            doNext(loseToIzma);
         }
      }
      
      public function IzmaStayAtTheLakeBitch() : void
      {
         spriteSelect(SpriteDb.get_s_izma());
         clearOutput();
         outputText("你温暖地笑了笑，紧紧握住她的双手。你告诉她，她当然是个值得尊敬的对手，也是个合格的伴侣，但现在还不是让她搬来和你同住的合适时机。她皱起眉，看起来很失望，但似乎把许多情绪都压了下去。[say: 好吧，那我暂时就待在这里……不过我永远都愿意加入你。只要你需要我，随时都可以，]她回答道。[pg]");
         outputText("你在她唇上轻轻一吻，然后动身返回营地。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,238,-1);
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function IzmaSelfFacialWheeRadar() : void
      {
         spriteSelect(SpriteDb.get_s_izma());
         clearOutput();
         outputText("你决定让她即将到来的高潮彻底避开你，于是拍开伊兹玛的双手，抓住她的肉棒，将它对准她的脸。伴随着最后一次狂野的挺入，你将肉棒深深贯入她的爱穴，把凶猛的精液洪流释放进她的子宫里，这让这名虎鲨人在自己的高潮中尖叫起来。她的精液一道道猛烈射向空中，迅速落在她沉醉的脸上；其中一些在她热烈的呻吟与愉悦的叫喊间落进了她嘴里。");
         outputText("[pg]你自己的种子");
         if(get_player().cumQ() < 750)
         {
            outputText("用滚烫的精液肆意润滑着她的交合口，让你那丰腴的贝塔在幸福的快感中叫出声来。");
         }
         else
         {
            outputText("用多到惊人的精液淹没了她的爱穴，让她的小穴里响起一连串湿滑而黏腻的声响。伊兹玛的表情流露出彻底难以置信的神色；你将她体内塞满你的精液，其中一些已经稳定地从她身体里流淌出来，而你的肉棒肌肉每一次收缩，都又向她体内射入更多。");
         }
         outputText("[pg]你们两人翻身分开，喘息着大口呼吸。她咯咯笑着，用舌头舔过自己弄出的那片狼藉；她的舌尖在[oneCock]上流连。[say: 嗯，真是太棒了，]伊兹玛说道，[say: 只要你想，就随时来把我填满吧。]你冲伊兹玛咧嘴一笑，命令她把每一滴都舔干净。[pg]");
         outputText("当她把自己的阿尔法清理干净后，她又花了片刻向你表达对这场交配的感激，亲吻着你的胸膛，一路吻上你的脖颈。");
         izmaPreg();
         get_player().orgasm("Dick");
         dynStats(DynStat.Sens(-2));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function IzmaPoopsBabies() : void
      {
         var _loc1_:* = null as IMap;
         spriteSelect(SpriteDb.get_s_izma());
         clearOutput();
         outputText("你听见溪流那边传来水花声和咒骂声——伊兹玛出于必要，把她的私人小营地安在了那里。你立刻拔腿跑去。等你急匆匆地冲到那里时，发现伊兹玛正站在溪水里，水已经没到她腰上。她一边扶着鼓胀的孕肚，一边咒骂着，身后的尾巴恼火地在水中甩来甩去。看见来的是你，她还是勉强露出了笑容。无需多言，你直接冲进水里，来到她身边。[pg]");
         outputText("[say:开始了，是吧？]她试着笑了笑。这就是伊兹玛；无论何时都想逞强。[pg]");
         outputText("你站到她身后稍偏一侧的位置。为了尽可能安抚她，你开始按摩她绷紧的腹部；你能感觉到肌肉正在收缩，努力把孩子推向外面的世界，而她体内的孩子则像上钩的鱼一样扭动挣扎着……好吧，这个比喻不太合适。[pg]");
         outputText("[say:摸摸我，]伊兹玛突然说道。你惊讶地看向她，她朝自己胯下的方向含糊地点了点头。[saystart]拜托，开始");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,439) == 0)
         {
            outputText("给我撸动，或者");
         }
         outputText("玩弄我的小穴；很久以前我们就知道，这能缓解分娩的疼痛。[sayend][pg]");
         outputText("你点点头，伸出一只手绕到她身前。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,439) == 0)
         {
            outputText("在她在你怀里使劲时，你得在她怒胀的勃起、四颗颇有分量的睾丸，以及正在扩张的小穴之间分配时间，这实在有些别扭，但你还是坚持了下来；当伊兹玛不再因疼痛而嘶声抽气，转而开始轻轻呻吟时，这一切似乎都值得了。[pg]");
         }
         else
         {
            outputText("在她在你怀里使劲时，你得在她正在扩张的小穴和肿胀的阴蒂之间分配时间，这实在有些别扭，但你还是坚持了下来。当伊兹玛不再因疼痛而嘶声抽气，转而开始轻轻呻吟时，这一切似乎都值得了。[pg]");
         }
         outputText("你也不清楚自己陪她折腾了多久，直到她忽然发出一声格外响亮的喘息，溪水被鲜血和羊水染得浑浊。随着水流将它们冲散，你能看见你们的女儿那带蹼的双手，以及试探着探出的头，正从她母亲体内露出来。那景象令人震惊；那些阴森的乡村接生婆故事在你脑中一闪而过。你努力对伊兹玛露出一个自认为能让她安心的微笑，暗自希望一切很快就能结束。[pg]");
         outputText("随后，伊兹玛皱紧了脸，仰头朝天，从喉咙深处爆发出一声尖叫。那声音仿佛硬生生从她紧咬的牙关和一贯的坚忍中撕扯出来。终于，婴儿的下半身也被推出体外；一旦脱离束缚，本能便立刻接管了一切。她游向水面，探出水面，吸入了第一口真正的空气。[pg]");
         outputText("你很快抓住她的手，等伊兹玛恢复些力气后，又帮她把孩子抱进怀里。你们现在成了一个小");
         if(Utils.rand(100) <= 59)
         {
            outputText("鲨鱼女孩");
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,251,FlagDict_Impl_.arrayReadInt(_loc1_,251) + 1);
         }
         else
         {
            outputText("虎鲨人");
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,252,FlagDict_Impl_.arrayReadInt(_loc1_,252) + 1);
         }
         outputText("的骄傲父母。她亲昵地蹭了蹭母亲，随后含住她的奶头，开始吮吸。随着她喝下乳汁，她也在成长；等她喝空伊兹玛第一边乳房时，已经差不多有五岁孩子那么大了。等她吃饱后心满意足地大声打了个嗝，她已经长到了十来岁的大小。伊兹玛对她的飞速成长泰然接受，母女俩开心地拥抱在一起。[pg]");
         outputText("你帮伊兹玛带着你们的新生儿爬回岸上，然后让她们俩躺下休息。等她们舒服地安顿好、依偎在一起后，你转身返回营地，打算把自己弄干，再抓紧时间小睡一会儿。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function IzmaCampBooks() : void
      {
         spriteSelect(SpriteDb.get_s_izma());
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,253) > 0)
         {
            outputText("你告诉伊兹玛，你想再和她一起读本书，她却摆出一副闹别扭的表情。[say: 真的？我是说，我是喜欢书没错，可就连我也会读腻的。我本来打算稍微收拾一下之后去做点别的事。嗯——我现在不太想再读书了，不过……如果你按我们平常的约定付我钱，我倒是可以借你一本看一阵子。你知道我信任你，但就算再怎么小心保管，书也是会磨损的，而且我也有几本新书想买。]你要付钱让伊兹玛借你一本书吗？");
            sharkBookMenus();
            return;
         }
         outputText("你告诉伊兹玛你想读点书，她便懒洋洋地在自己的箱子里翻找起读物。她抬头说道：[say: 之后得把这些整理一下……那么，你想和我一起读什么？][pg]");
         sharkBookMenus(true);
      }
      
      public function IzmaBadEnd() : void
      {
         clearOutput();
         outputText("<b>一年后……</b>[pg]");
         outputText("你幸福地叹了口气，依偎在沙滩上的伊兹玛身边，一点也不想离开你的首领。伊兹玛抚摸着你的手，但她似乎更在意自己手里那袋宝石。[say: 哼，今天清理那座牛头人洞穴可真是大有收获。啊，我能买好多好多书了，]她说道，一想到这事就咧嘴笑了起来。[say: 也许我该弄块房产？我是说，我已经有点厌倦住在湖边那个小营地了……或许惠特尼那儿有空房子？自从我们帮她把辣椒地里的那些史莱姆清掉之后，她可一直欠着我们人情呢，]她补充道，站直身子，沿着海滩走去。[pg]");
         outputText("你迫不及待地起身，像只坠入爱河的小狗一样跟在她身后。今天的冒险让你的肌肉确实酸痛不已，但伊兹玛会在战斗中让你帮她，而不是只把你当成性玩具");
         if(get_player().get_gender() >= 2)
         {
            outputText("和能受孕的子宫");
         }
         outputText("，这感觉真是太棒了。能以这样的方式侍奉你的首领，让你真正有了目标感。[pg]");
         outputText("[say: 哎，好吧，那些事以后再说。来吧，亲爱的，]伊兹玛说道，转过身掀开裙子，露出那根你熟悉的、正突突跳动的阴茎。你咧嘴一笑，弯下身趴在附近的一块岩石上，抬起自己的条纹鲨尾。她低吼一声，把粗大的肉棒埋进你的肛门里，让你大声倒抽一口气；快感涌上来，你开始呻吟，并主动向后迎合她。[pg]");
         outputText("伊兹玛似乎停顿了一下，被什么东西分了神；你不满地轻轻哼叫起来。[say: 闭嘴一会儿，]她命令道。你转过头，眯起眼试图看清伊兹玛在看什么，最后终于辨认出一个身影正沿着沙滩走近。从你看到的样子来看，那是个人类女孩。这个景象唤起了你一些过去的记忆——在遇见你的首领之前，那段更加迷茫的日子。伊兹玛看见她后咧嘴一笑，舔了舔嘴唇。[say: 哎呀，瞧瞧这是谁。嗯……我想我也可以弄个后宫……]");
         get_game().gameOver();
      }
   }
}

