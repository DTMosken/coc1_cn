package classes.scenes.dungeons
{
   import classes.CoC;
   import classes.DynStat;
   import classes.Monster;
   import classes.Output;
   import classes.Player;
   import classes.StatusEffects;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.display.SpriteDb;
   import classes.globalFlags.KFLAGS;
   import classes.items.JewelryLib;
   import classes.items.ShieldLib;
   import classes.items.WeaponLib;
   import classes.scenes.Camp;
   import classes.scenes.Inventory;
   import classes.scenes.areas.volcanicCrag.CorruptedCoven;
   import classes.scenes.combat.Combat;
   import classes.scenes.dungeons.wizardTower.ArchInquisitorVilkus;
   import classes.scenes.dungeons.wizardTower.ArchitectJeremiah;
   import classes.scenes.dungeons.wizardTower.AspectOfLaurentius;
   import classes.scenes.dungeons.wizardTower.ImpStatue;
   import classes.scenes.dungeons.wizardTower.IncubusStatue;
   import classes.scenes.dungeons.wizardTower.SentinelOfApostasy;
   import classes.scenes.dungeons.wizardTower.SentinelOfBlasphemy;
   import classes.scenes.dungeons.wizardTower.SentinelOfHeresy;
   import classes.scenes.dungeons.wizardTower.SuccubusStatue;
   import coc.view.CoCButton;
   import flash.Boot;
   import haxe.IMap;
   import haxe.ds.IntMap;
   
   public class WizardTower extends DungeonAbstractContent
   {
      
      public static var DUNGEON_DEFEATED_SENTINELS:int = 1;
      
      public static var DUNGEON_SOLVED_GATEPUZZLE:int = 2;
      
      public static var DUNGEON_SOLVED_MIRRORPUZZLE:int = 4;
      
      public static var DUNGEON_MET_JEREMIAH:int = 8;
      
      public static var DUNGEON_DESTROYED_JEREMIAH:int = 16;
      
      public static var DUNGEON_FOUND_LOCKEDDOOR:int = 32;
      
      public static var DUNGEON_ALLOWED_EXIT:int = 64;
      
      public static var DUNGEON_LEARNED_KEY:int = 128;
      
      public static var DUNGEON_DEFEATED_VILKUS:int = 256;
      
      public static var DUNGEON_JEREMIAH_REFORMED:int = 512;
      
      public static var DUNGEON_LAURENTIUS_FOUND:int = 1024;
      
      public static var DUNGEON_LAURENTIUS_DEFEATED:int = 2048;
      
      public static var DUNGEON_TOWER_AWOKEN:int = 4096;
      
      public var puzzleplayerLoc:int;
      
      public var puzzleLayout:Array;
      
      public var onPillar:Boolean;
      
      public var mirrorLoc:int;
      
      public var mirrorLayout:Array;
      
      public function WizardTower()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         onPillar = false;
         mirrorLoc = 41;
         puzzleplayerLoc = 41;
         mirrorLayout = [];
         puzzleLayout = [];
         super();
         puzzleLayout.resize(81);
         mirrorLayout.resize(81);
      }
      
      public function vilkusGameOver() : void
      {
         clearOutput();
         outputText("在你的生命从身体中消逝后，维尔库斯用强大的魔法火焰将你的尸体烧成灰烬。");
         outputText("[pg]一阵风穿过天花板上的洞进入房间，吹到地板上。你的骨灰被带出塔外，散布在整片土地上。这是对任何敢于跨越被遗忘已久的异端审判庭的敌人的警告。");
         outputText("[pg]维尔库斯再次坐在他饱经风霜的王座上，等待着一个可能永远不会到来的启示。");
         get_game().gameOver();
      }
      
      public function victoryAgainstSentinels() : void
      {
         var _g:WizardTower;
         clearOutput();
         outputText("随着决定性的一击，最后一座活雕像倒下了。");
         outputText("[pg]你再次向大门走去，走过裂成两半的裸男，以及法师，她剩下的一只手紧紧抓着她的石书。你触摸大门光滑的表面，寻找打开它的开关。");
         outputText("[pg]你再次听到了石头的声音，当你转过身时，你准备好了你的[weapon]。令你惊讶的是，战士又站了起来，单手拿着他的长矛。他向你的方向冲刺，并猛烈地向你投掷他的武器！");
         outputText("[pg]幸运的是，他虚弱的身体影响了他的瞄准，长矛撞在塔上，在塔的表面留下了一道小划痕，同时武器也碎成了几块。战士倒在地上，粉碎了，彻底结束了战斗。");
         outputText("[pg]你不明白是什么魔法让这些雕像着了魔，也不明白它们为什么在这里站岗，但你知道答案一定在里面。");
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,2683,FlagDict_Impl_.arrayReadInt(_loc1_,2683) + 1);
         get_combat().cleanupAfterCombat();
         _g = this;
         addButton(0,"继续",function():void
         {
            _g.toGatePuzzle();
         }).hint("向大门前进，并试图找到打开它的方法。");
      }
      
      public function upperCorridor() : void
      {
         var _loc1_:* = null as IMap;
         outputText("你现在位于塔楼上层的一条走廊里。它比通向带有柱子的巨大房间的那条走廊要窄得多，但在其他方面很相似，由抛光的黑曜石制成，装饰着发光的符文。与其他房间不同的是，这里没有战斗的痕迹、雕像或尸体。");
         if((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2683) & 0x20) == 0)
         {
            outputText("[pg]你没走多远就发现了另一个阻碍你的东西。这一次，是一扇石门，被某种能量场密封并保护着。粗略检查一下这扇门，你会发现它非常坚固，除非有一支由巫师、牛头人或两者兼有的军队，否则没有任何机会摧毁它。你必须找到一把钥匙。");
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,2683,FlagDict_Impl_.arrayReadInt(_loc1_,2683) + 32);
         }
      }
      
      public function toGatePuzzle(param1:Boolean = false) : void
      {
         var answer2:int;
         var _g2:WizardTower;
         var answer1:int;
         var _g1:WizardTower;
         var answer:int;
         var _g:WizardTower;
         clearOutput();
         if(!param1)
         {
            outputText("你再次触摸塔的表面，试图找到打开大门的方法。");
            outputText("[pg]经过几分钟令人沮丧的搜寻，你发现在大门每扇门之间的缝隙处，蚀刻着一个小小的魔法阵。把手放在那里几秒钟后，大门表面浮现出几个发光的字，仿佛有一只无形的手正拿着烧红的笔在书写。[pg]");
         }
         outputText("[say: 三位巫师齐聚一堂，建造了这座塔。阿尔萨诺斯、劳伦提斯、加兰。其中一人是第一人。][pg][say: 阿尔萨诺斯声称他是第一人。][pg][say: 劳伦提斯声称加兰不是第一人。][pg][say: 加兰声称他不是第一人。][pg][say: 他们中至少有一人在说真话。至少有一人在说谎。谁是第一人？]");
         menu();
         _g = this;
         answer = 0;
         addButton(0,"阿尔萨诺斯",function():void
         {
            _g.answerPuzzle(answer);
         }).hint("阿尔萨诺斯是第一位。");
         _g1 = this;
         answer1 = 1;
         addButton(1,"劳伦提斯",function():void
         {
            _g1.answerPuzzle(answer1);
         }).hint("劳伦提斯是第一位。");
         _g2 = this;
         answer2 = 2;
         addButton(2,"加兰",function():void
         {
            _g2.answerPuzzle(answer2);
         }).hint("加兰是第一位。");
         addButton(14,"离开",leave).hint("离开大门和谜题。");
      }
      
      public function theChamber() : void
      {
         if((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2683) & 0x0100) == 0)
         {
            encounterVilkus();
         }
         else
         {
            outputText("维尔库斯居住的房间现在寂静无声，莱希石晶体变成了灰色，失去了力量。维尔库斯的骨灰被风吹散，散布在玛瑞斯各地；也许这是他预期的离开生命的方式。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2685) + 2 <= get_game().time.days && (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2683) & 0x0400) == 0)
            {
               outputText("[pg]一根光柱矗立在房间的中心，显然是魔法来源。");
               addButton(0,"光芒",meetLaurentius).hint("走进光芒。你内心的某种东西告诉你，你<b>应该为任何事情做好准备。</b>");
            }
         }
      }
      
      public function studyRoom() : void
      {
         var _loc1_:* = null as IMap;
         clearOutput();
         outputText("楼梯通向一个看起来像书房的地方，规模与塔的其他部分成比例。几块雕像碎片散落在各处，许多书架被毁，上面的书被烧得无法阅读。炼金台也被毁了，上面的液体干涸并粘在地板上。各种武器，从剑到长矛再到马鞭，也都散落在地板上，被毁坏了。");
         outputText("[pg]房间后面的一个拱门通向另一条走廊。");
         if((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2675) & CorruptedCoven.TALKED_JEREMIAH_WEAPONS) != 0 && (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2675) & CorruptedCoven.BROUGHT_JEREMIAH_BACK) == 0)
         {
            outputText("[pg]你有些惊讶地看到喀耳刻坐在一张椅子上，正和耶利米一边喝着葡萄酒一边聊天。事实上，是两杯葡萄酒，尽管耶利米很难从他的杯子里喝到酒，因为高脚杯离他有两英尺多远。他看着你，以他一贯的善良但困惑的方式微笑着。");
            outputText("[pg][say: 哎呀，你好，[name]。这位老太太刚才出现在这里，开始用几个奇怪又难懂的词跟我说话。你也可以加入！]");
            outputText("[pg]你看着喀耳刻。她微微低头向你打招呼，脸上明显因为被称为老太太而感到愤怒。[say: 是的，[name]，加入我们吧。你可以喝耶利米的酒，我相信这老头不会介意的。]");
            outputText("[pg]你拿起高脚杯，坐在一块大理石上。你问他们在聊什么。");
            outputText("[pg][say: 我们在聊耶利米脑子里闪过的任何事情。那里有很多在其他地方找不到的东西，尤其是现在维尔库斯把一切都烧成了灰烬。不过，他……有时候很难理解。]");
            outputText("[pg]耶利米似乎对她的话无动于衷。[say: 老太太向我请教关于制造魔像的知识，以及审判官的奥术锻造技术。说是为了“玛瑞斯的利益”、“魔法的未来”、“获得新的视角”以及其他一些自作聪明的陈词滥调。哦天哪，她确实是个巫师。]");
            outputText("[pg]喀耳刻向雕像抬起手，仿佛在说 [say: 看吧？]");
            outputText("[pg]你问耶利米为什么不愿意分享他的知识。他抚摸着他的石头胡须。");
            outputText("[pg][say: 嗯，如果说我在这里生活了几十年学到了一件事，那就是任何人都永远不应该信任一个独居的巫师，除非稍微钻进他们的脑子里看看。他们经常发疯，并且拥有超乎想象的力量！这是一个危险的组合。]");
            outputText("[pg]你指出，无论从哪个角度来看，<i>他</i>也是一个独居的巫师。");
            outputText("[pg][say: 哦，我怎么会不知道呢！] 他咯咯地笑着说。[say: 而且我还试图杀你两次！]");
            outputText("[pg]喀耳刻叹了口气。");
            outputText("[pg][say: 所以，耶利米决定先考验一下我的资质，不过他大部分时间都在絮叨他的过去。我能看出来他非常睿智，但在这里待了这么久，他的脑子肯定出了点问题。]");
            outputText("[pg]你告诉她，考虑到这里发生的一切，这是肯定的，但他也可能只是在考验她的耐心。");
            outputText("[pg][say: 确实有这种可能。好吧，既然如此……] 喀耳刻从椅子上站起来，一大口喝光了杯里的酒。");
            outputText("[pg][say: 我们要去个更舒服的地方继续讨论。]");
            outputText("[pg]她挥了挥手，在自己和耶利米周围创造了一个纯粹由能量构成的圆环。你看着他，他反复挑动着眉毛，大概是把她的话理解成了完全不同的意思。");
            outputText("[pg][say: 别见外，[name]，] 喀耳刻说着，握紧了拳头。");
            outputText("[pg]耶利米对你笑了笑，然后，在一道闪光中，两人都消失了。");
            outputText("[pg]看来喀耳刻和耶利米都不再是孤单的巫师了。");
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,2675,FlagDict_Impl_.arrayReadInt(_loc1_,2675) + CorruptedCoven.BROUGHT_JEREMIAH_BACK);
            return;
         }
         if((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2675) & CorruptedCoven.BROUGHT_JEREMIAH_BACK) != 0)
         {
            outputText("你看到房间另一端的地板上有一块方形区域，那里特别干净，没有灰尘和灰烬。正是耶利米以前休息的地方。");
            return;
         }
         if((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2683) & 8) == 0)
         {
            outputText("[pg]房间的另一端放着一件奇特的半成品。那是一块巨大的大理石板，大约有12英尺高。一个留着胡子的秃顶老人从石板中雕刻出了一半；他的上半身雕刻得和其他雕像一样精美，但下半身却只是未雕刻的大理石。");
            addButton(0,"靠近雕像",meetJeremiah).hint("靠近那座半成品的雕像。");
         }
         else if((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2683) & 0x10) != 0 && (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2683) & 0x0100) == 0)
         {
            outputText("[pg]耶利米的遗骸立在房间的尽头。");
         }
         else if((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2683) & 0x0200) == 0 && (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2683) & 0x0100) != 0)
         {
            clearOutput();
            menu();
            outputText("你再次来到书房，当你望向房间尽头时，你的眼睛睁大了。耶利米在那里，完全重塑了！");
            outputText("[pg]你挥舞着你的[weapon]，充满威胁地看着他，等待着看他会有什么反应。");
            outputText("[pg]他盯着你。[say: 你好，[name]。那是你的名字，对吧？姿势不错。]");
            outputText("[pg]你眯起眼睛，看着他大理石般的脸庞。他似乎和以前一样毫无察觉。");
            outputText("[pg][say: 啊，是因为“把我打成碎片”那件事，对吧？我好多了。没关系。事实上，我感觉比以前更好了！我的头脑……多年来第一次如此清晰！]");
            outputText("[pg]你放下了武器。毕竟，他看起来很诚实。");
            outputText("[pg]<b>耶利米现在可能对某些问题有更好的答案了。</b>");
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,2683,FlagDict_Impl_.arrayReadInt(_loc1_,2683) + 512);
            doNext(runFunc);
         }
         else
         {
            outputText("[pg]耶利米像往常一样站在房间的尽头。");
            addButton(0,"耶利米",meetJeremiah).hint("靠近那座奇怪的雕像。");
         }
      }
      
      public function statueBadEnd() : void
      {
         clearOutput();
         outputText("玛瑞斯并没有发生什么改变，尽管勇者的熟人们总是想知道[he]是在哪里迎来了终结。");
         outputText("[pg]在火山岩探险的幸运冒险家最终可能会发现一座巨大的黑曜石塔，它被时间和记忆所遗忘，是恶魔瘟疫爆发前巫师们无尽力量的颂歌。");
         outputText("[pg]然而，如果他想有机会探索其中的秘密，他就必须技艺高超；因为那里有一名哨兵在默默守望，一个大理石守卫在永远保护着它的大门，不受酷热和沙尘暴的影响。穿着[his][armor]，挥舞着[his][weapon]。直到永远。");
         get_game().gameOver();
         get_combat().cleanupAfterCombat();
      }
      
      public function start() : void
      {
         clearOutput();
         puzzleplayerLoc = 41;
         mirrorLoc = 41;
         puzzleLayout = [0,0,0,0,0,0,0,0,0,0,1,1,0,1,0,1,0,0,0,1,0,0,0,0,1,0,0,0,1,1,0,1,0,1,1,1,0,0,1,1,0,0,0,0,0,0,1,1,1,1,1,0,0,0,0,0,0,1,0,0,0,1,0,0,1,1,0,0,0,1,0,0,0,0,0,0,1,1,0,0,0];
         mirrorLayout = [1,1,0,0,2,1,0,0,0,1,0,0,1,0,1,1,1,0,0,0,1,1,1,0,0,0,0,0,0,0,0,1,0,0,1,0,0,1,0,1,0,1,0,0,0,0,0,1,0,0,0,0,1,0,0,0,0,0,0,1,0,1,0,0,1,1,1,1,1,0,1,0,0,0,0,0,1,0,0,0,0];
         puzzleLayout[puzzleplayerLoc] = 3;
         mirrorLayout[mirrorLoc] = 3;
         redraw();
      }
      
      public function staircase() : void
      {
         outputText("走到柱子宽度的尽头，你爬上了楼梯。更多的雕像停留在台阶上，有些破碎，有些完好。");
         outputText("[pg]台阶多得令人难以置信。你回头看去，发现自己比刚开始攀爬时想象的要高得多；看来这座塔再次打破了空间法则。");
         outputText("[pg]无论如何，你似乎正在取得进展，并且没有落入另一个陷阱。你看到了前方楼梯的尽头。你想，来得正是时候。你的[legs]因为爬了这么久而火辣辣地疼。");
      }
      
      public function runFuncPillar() : void
      {
         clearOutput();
         get_dungeons().setDungeonButtons();
         switch(get_dungeons().get_playerLoc())
         {
            case 10:
               outputText("欢迎，[name]。");
               get_dungeons().currDungeon.get_dungeonMap()[12] = 1;
               get_dungeons().setDungeonButtons();
               menu();
               doNext(meetLaurentius2);
               break;
            case 18:
               outputText("如何忘记自我，让灵魂升华。");
               get_dungeons().currDungeon.get_dungeonMap()[26] = 1;
               get_dungeons().setDungeonButtons();
               break;
            case 26:
               outputText("有一课，你的身体尚未承受。");
               get_dungeons().currDungeon.get_dungeonMap()[34] = 1;
               get_dungeons().setDungeonButtons();
               break;
            case 34:
               outputText("你经历了许多，才来到这里。你的身体所承受的，你的灵魂会学习。而灵魂所学习的，它能将其化为实质。");
               get_dungeons().currDungeon.get_dungeonMap()[42] = 1;
               get_dungeons().setDungeonButtons();
               break;
            case 42:
               outputText("我们都只是更伟大存在的愿望，是星尘化作的意志与形态。但正如他们使我们飞升，我们也能使自己飞升。");
               get_dungeons().currDungeon.get_dungeonMap()[50] = 1;
               get_dungeons().setDungeonButtons();
               break;
            case 50:
               outputText("穿过光柱升起。虽然你的头脑无法理解，但你的灵魂知晓。");
               get_dungeons().currDungeon.get_dungeonMap()[58] = 1;
               get_dungeons().setDungeonButtons();
               break;
            case 58:
               outputText("你是光。纯粹的能量。");
               get_dungeons().setDungeonButtons();
         }
         get_output().flush();
      }
      
      override public function runFunc() : void
      {
         clearOutput();
         if(onPillar)
         {
            runFuncPillar();
            return;
         }
         get_dungeons().setDungeonButtons();
         if(get_game().dungeons.map.walkedLayout.indexOf(get_dungeons().get_playerLoc()) == -1)
         {
            get_game().dungeons.map.walkedLayout.push(get_dungeons().get_playerLoc());
         }
         var _loc1_:IMap = dungeonRooms;
         var _loc2_:int = get_dungeons().get_playerLoc();
         _loc1_.h[_loc2_]();
         get_output().flush();
      }
      
      public function roomEntrance2() : void
      {
         outputText("尽管有无源的光线让你能够前进，但走廊的这一部分仍然让你感到紧张。墙壁和地板上布满了大量的血迹和烧焦的痕迹。几具木乃伊般的尸体散落在地板上，其中一些被烧焦了。看来这种无菌环境阻止了任何腐烂的发生。");
         if(get_player().get_inte() > 85)
         {
            outputText("[pg]粗略检查一下，你敢打赌这些尸体有十年历史了，也许更久。");
         }
         else
         {
            outputText("[pg]你不太确定这些尸体有多老了。这里到底发生了什么？");
         }
      }
      
      public function roomEntrance() : void
      {
         clearOutput();
         outputText("你站在一条极其宽敞的走廊里，完全由某种黑曜石制成，抛光得像镜子一样闪亮。墙壁和天花板的大部分都装饰着魔法符文。每隔一段时间，就会有一道光脉冲伴随着可听见的嗡嗡声在走廊里爬行，就像高音玻璃竖琴一样，使符文强烈发光片刻。");
         if((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2683) & 0x40) != 0)
         {
            setExitButton("离开",leave,11).hint("离开塔。");
         }
         else
         {
            addButtonDisabled(11,"离开","某种魔法正在扭曲你身后的空间，阻碍了你的逃跑！");
         }
      }
      
      public function redraw() : void
      {
         var direction4:int;
         var _g5:WizardTower;
         var direction3:int;
         var _g4:WizardTower;
         var direction2:int;
         var _g3:WizardTower;
         var direction1:int;
         var _g2:WizardTower;
         var direction:int;
         var _g1:WizardTower;
         var solved:Boolean;
         var _g:WizardTower;
         var _loc1_:* = null as String;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         clearOutput();
         if(mirrorLoc == 4)
         {
            menu();
            outputText("你的克隆体到达了出口。");
            _g = this;
            solved = true;
            doNext(function():void
            {
               _g.endPuzzle(solved);
            });
            return;
         }
         outputText("<b><font face=\"_typewriter\">");
         _loc1_ = "";
         _loc2_ = 0;
         while(_loc2_ < int(puzzleLayout.length))
         {
            if(int(puzzleLayout[_loc2_]) == 0)
            {
               _loc1_ += "[ ]";
            }
            if(int(puzzleLayout[_loc2_]) == 1)
            {
               _loc1_ += "   ";
            }
            if(int(puzzleLayout[_loc2_]) == 3)
            {
               _loc1_ += "[P]";
            }
            if(int((_loc2_ + 1) % 9) == 0)
            {
               _loc1_ += "\n";
            }
            _loc2_++;
         }
         _loc1_ += "\n\n";
         _loc3_ = 0;
         while(_loc3_ < int(mirrorLayout.length))
         {
            if(int(mirrorLayout[_loc3_]) == 0)
            {
               _loc1_ += "[ ]";
            }
            if(int(mirrorLayout[_loc3_]) == 1)
            {
               _loc1_ += "   ";
            }
            if(int(mirrorLayout[_loc3_]) == 2)
            {
               _loc1_ += "[X]";
            }
            if(int(mirrorLayout[_loc3_]) == 3)
            {
               _loc1_ += "[P]";
            }
            if(int((_loc3_ + 1) % 9) == 0)
            {
               _loc1_ += "\n";
            }
            _loc3_++;
         }
         rawOutputText(_loc1_);
         outputText("</font></b>");
         menu();
         if(int(puzzleLayout[puzzleplayerLoc - 9]) != 1 && puzzleplayerLoc - 8 > 0)
         {
            _g1 = this;
            direction = 0;
            addButton(6,"向北",function():void
            {
               _g1.move(direction);
            }).hint("");
         }
         if(int(puzzleLayout[puzzleplayerLoc + 9]) != 1 && puzzleplayerLoc + 9 < 81)
         {
            _g2 = this;
            direction1 = 1;
            addButton(11,"向南",function():void
            {
               _g2.move(direction1);
            }).hint("");
         }
         if(int(puzzleLayout[puzzleplayerLoc - 1]) != 1 && int(puzzleplayerLoc % 9) != 0 && puzzleplayerLoc != 0)
         {
            _g3 = this;
            direction2 = 2;
            addButton(10,"向西",function():void
            {
               _g3.move(direction2);
            }).hint("");
         }
         if(int(puzzleLayout[puzzleplayerLoc + 1]) != 1 && int((puzzleplayerLoc + 1) % 9) != 0)
         {
            _g4 = this;
            direction3 = 3;
            addButton(12,"向东",function():void
            {
               _g4.move(direction3);
            }).hint("");
         }
         _g5 = this;
         direction4 = 99;
         addButton(0,"重置",function():void
         {
            _g5.move(direction4);
         }).hint("重置位置并重新开始谜题。");
      }
      
      public function pillar2() : void
      {
         outputText("虽然你在走廊里看到了很多尸体，但你在这里看到的却没那么可怕，反而让你想起了守卫塔入口的哨兵。几座雕像——以及雕像的碎片——散落在整个区域。它们都描绘了恶魔：梦魔、魅魔、双性恶魔和小恶魔。");
         outputText("[pg]它们的姿势各不相同；有些在恐惧中畏缩，有些在狂笑，还有些显然正与其他恶魔处于高潮之中。工艺精湛，大理石看起来真的像血肉一样，每一块肌肉和肌腱都雕刻到了你无法想象的水平。");
         outputText("[pg]前方是一段巨大而陡峭的楼梯，蜿蜒通向巨大柱子后面的更高层。");
      }
      
      public function pillar() : void
      {
         outputText("绕过巨大的柱子，你更加明显地感觉到这座塔并不符合常规的空间法则。它在外面看起来很大，但你周围环境和柱子的规模打破了常理。这是一个工程学上的奇迹，无论是魔法还是其他什么。");
      }
      
      public function notAcquired() : void
      {
         clearOutput();
         outputText("你告诉耶利米你现在实在拿不了这东西。");
         outputText("[pg][say: 你就不能想想办法吗？]");
         outputText("[pg]绝对不行。");
         outputText("[pg][say: 好吧。那等你真正能拿走的时候再来吧。]");
         doNext(meetJeremiah);
      }
      
      public function move(param1:int) : void
      {
         puzzleLayout[puzzleplayerLoc] = 0;
         if(param1 == 0)
         {
            if(int(mirrorLayout[mirrorLoc - 9]) != 1 && mirrorLoc - 8 >= 0)
            {
               mirrorLayout[mirrorLoc] = 0;
               mirrorLoc -= 9;
               mirrorLayout[mirrorLoc] = 3;
            }
            puzzleplayerLoc -= 9;
         }
         if(param1 == 1)
         {
            if(int(mirrorLayout[mirrorLoc + 9]) != 1 && mirrorLoc + 9 < 81)
            {
               mirrorLayout[mirrorLoc] = 0;
               mirrorLoc += 9;
               mirrorLayout[mirrorLoc] = 3;
            }
            puzzleplayerLoc += 9;
         }
         if(param1 == 2)
         {
            if(int(mirrorLayout[mirrorLoc - 1]) != 1 && int(mirrorLoc % 9) != 0 && mirrorLoc != 0)
            {
               mirrorLayout[mirrorLoc] = 0;
               mirrorLoc -= 1;
               mirrorLayout[mirrorLoc] = 3;
            }
            puzzleplayerLoc -= 1;
         }
         if(param1 == 3)
         {
            if(int(mirrorLayout[mirrorLoc + 1]) != 1 && int((mirrorLoc + 1) % 9) != 0)
            {
               mirrorLayout[mirrorLoc] = 0;
               mirrorLoc += 1;
               mirrorLayout[mirrorLoc] = 3;
            }
            puzzleplayerLoc += 1;
         }
         if(param1 == 99)
         {
            mirrorLayout[mirrorLoc] = 0;
            puzzleplayerLoc = 41;
            mirrorLoc = 41;
         }
         puzzleLayout[puzzleplayerLoc] = 3;
         mirrorLayout[mirrorLoc] = 3;
         redraw();
      }
      
      public function mirrorPuzzle3() : void
      {
         clearOutput();
         outputText("你在一个完全不同的地方醒来，尖叫着。你检查了一下周围的环境，发现自己身处某种玻璃迷宫中。你上下打量，当你意识到这个房间似乎漂浮在太空中时，你的心沉了下去。你所看的每一个方向都点缀着星星，似乎没有任何办法可以逃脱。");
         outputText("[pg]突然，在玻璃迷宫下方，有什么东西凭空出现，以与你遭遇的相反方式展开。当它向外延伸时，你意识到那是另一个玻璃迷宫，里面也关着一个囚犯。");
         outputText("[pg]你蹲下来想仔细看看那个可怜虫，眼前的景象却让你的大脑一阵扭曲；那个人竟然是你自己……也蹲着往下看！你惊讶地站起身，你的另一个自己也做了同样的动作。你向前走，它也跟着走。");
         outputText("[pg]经过简短的分析，你注意到你克隆体的迷宫结构与你的不同，特别是有一点：它有一个出口！<b>你必须想办法引导你的克隆体走向出口。也许到那时你也会重获自由？</b>");
         doNext(start);
      }
      
      public function mirrorPuzzle2() : void
      {
         clearOutput();
         outputText("一个苍老、颤抖且尖锐的声音在房间里回荡。");
         outputText("[pg][say: 入侵者？这么多年过去了？这可真是个麻烦。]");
         outputText("[pg]你环顾四周，试图寻找声音的来源，但一无所获。");
         outputText("[pg][say: 罢了，无所谓。我们还有时间，是的。总是有更多的时间。]");
         outputText("[pg]你又向前迈出一步，但高塔的魔法依然让你无法如愿。");
         outputText("[pg][say: 我忘了我现在该做什么了……啊，对了！迷宫。很高兴认识你，呃——不管你是谁，入侵者。]");
         outputText("[pg]不管那是什么，肯定不是什么好事。你开始向走廊冲刺，但尽管你拼尽全力，依然无法改变自己的位置。接着你注意到地板正在远离你的双脚，墙壁也在远处消失。");
         outputText("[pg][say: 绝妙的陷阱。劳伦提斯知道他在做什么！唯一不好的是他加了一个出口。不过，好吧，我已经把它修好了！]");
         outputText("[pg]眨眼之间，你消失了，你的身体向内折叠，凭空消失。");
         doNext(mirrorPuzzle3);
      }
      
      public function mirrorPuzzle() : void
      {
         clearOutput();
         outputText("你离开尸体，向着未知的前方迈进。");
         outputText("[pg]走廊通向一个更加开阔的区域，两侧和天花板都豁然开朗，展现出一个巨大的圆形房间，让你显得无比渺小。当你仰望天空时，根本看不到天花板。一根由同样光滑的黑曜石制成的巨大柱子矗立在房间中央，直插云霄。光脉冲继续从走廊涌出，攀上柱子，点亮了沿途成千上万的符文。");
         outputText("[pg]你在这个巨大的房间里迈出了一步。然而，你并没有向前移动。");
         outputText("[pg]你又迈出了一步，却发现自己后退了四步。你开始奔跑，但每跑一步，你都在向后、向侧面、向上或向下移动。你气喘吁吁地停下来，发现自己其实寸步未移。");
         doNext(mirrorPuzzle2);
      }
      
      public function meetLaurentius3() : void
      {
         var _loc1_:* = null as IMap;
         clearOutput();
         menu();
         if((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2683) & 0x0400) == 0)
         {
            outputText("你走向那个穿长袍的人，保持着在这个地方应有的警惕。");
            outputText("[pg][say: 真是个奇迹，不是吗？我是说这座塔。我看出你很谨慎。别担心，我对你没有恶意。]");
            outputText("[pg]你出声赞同，放下戒备向他走去。他慈祥地看着你，当你面对他时，他露出了微笑。");
            outputText("[pg][say: 古代的巫师，他们拥有强大的力量。那力量超出了他们的掌控，也超出了他们的需求。他们都像是在玩火的孩子，是他们那一脉中最早发掘凡人生物真正潜能的人。也是最早挑战古神本身的人。]");
            outputText("[pg]你默默地注视着他，微微点了点头。他笑了起来。");
            outputText("[pg][say: 也许他们害怕自己，害怕自己所掌握的力量。也许他们发现释放全部潜能的唯一方法，就是摧毁任何能给他们带来良知的东西]——男人把手放在胸前，握住一条小项链，里面镶嵌着一颗莱希石水晶——[say: 这样他们就能看到自己的影响力能在多大程度上改变现实的结构。]");
            outputText("[pg]他叹了口气，带着些许忧郁。");
            outputText("[pg][say: 又或者，他们根本就没有良知，他们只是想证实这一点。]");
            outputText("[pg]你打破了沉默，问他在这里做什么，以及他是谁。他深吸了一口气，陷入了沉思。");
            outputText("[pg][say: 是你给维尔库斯带来了安宁。我为此感谢你。对于像他这样的人来说，玛瑞斯改变得太多了。即使他设法找到了拯救他的审判官同伴的方法，他很快也会发现，他所居住的世界已经不再是他离开时的那个世界，不再是他为之受尽苦难的那个世界了。]");
            outputText("[pg]你点点头，但指出他还没有回答你的问题。");
            outputText("[pg][say: 事实上，我已经回答了。[name]，所有的世界都在改变。它们都会生长、枯萎和死亡，就像其中的任何生物一样终有一死。玛瑞斯证明了，即使是我们都仰望的神明，也会失败、陨落和消失。我在这里的原因是……玛瑞斯正在死去，[name]。]");
            outputText("[pg]最后那句话引起了你的注意。你看着这片被摧毁的峭壁，问他那到底是什么意思。");
            outputText("[pg][say: 就像一位深爱的祖父，感染了一场严重的瘟疫。我们可以付出巨大的努力尝试治疗，但时间永远在向前推移，它的结局我们都心知肚明。如果我们想让他不朽，我们必须保留他的遗产，而不是他的存在。]");
            outputText("[pg]你问他是否打算重塑这个世界。他笑了。");
            outputText("[pg][say: 是的。这就是我在这里的原因。也是这座塔在这里的原因。为了看看这个世界是否能被重新锻造，它的遗产是否能被保留，过去的错误是否能仅仅成为记忆，从而不再重演。]");
            outputText("[pg]你问对于凡人来说，无论多么强大，这样的事情是否真的可能。");
            outputText("[pg][say: 也许不可能。但这是一个值得最强大的巫师去追求的目标。一个可以让人专注，不至于误入歧途的目标。我们不知道自己真正的极限在哪里，我相信为了这样一个崇高的目标，我们尝试超越极限是正当的。]");
            outputText("[pg]你花了一点时间来理解他的话，然后问他，那么他的目标是不是成为一个拥有如此力量的巫师。");
            outputText("[pg][say: 不是我的，不。我尝试过，发现自己能力不足，]他说。如果他对自己的失败有任何愤怒或失望，他掩饰得非常完美。");
            outputText("[pg]他停顿了一下，抬头向上看去。");
            outputText("[pg][say: 我的计划是找到那个能做到的人，并向他挑战，以获得神性之权。]");
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,2683,FlagDict_Impl_.arrayReadInt(_loc1_,2683) + 1024);
            doNext(meetLaurentius3);
         }
         else
         {
            outputText("你走近那位神秘的巫师。他点点头向你问好。");
            addButton(0,"神性",laurentiusChallenge).hint("挑战巫师。<b>这将是一场极其艰难的战斗。</b>");
            addButton(14,"离开",leaveLaurentius).hint("让他把你传送回去。");
         }
      }
      
      public function meetLaurentius2() : void
      {
         clearOutput();
         menu();
         outputText("你苏醒过来，对刚才灵魂出窍般的体验感到惊奇，但并没有受到任何伤害。");
         outputText("[pg]你环顾四周。不知怎么的，你竟然来到了塔顶！这里很平坦，由与建筑其他部分相似的材料制成。刻在石头上的两个同心圆上装饰着符文，它们不知为何沿着圆周旋转着，仿佛漂浮在薄薄的水面上。");
         outputText("[pg]在这个高度，巨大的风暴和火山灰阵风肆虐得更加猛烈，但不知为何，你丝毫没有受到它们的影响。一定是有某种保护力场。");
         outputText("[pg]在这片区域的中心站着一个高大的中年男子，留着齐肩的赤褐色头发。他穿着黑金相间的长袍，手里拿着一根华丽的钢制法杖，法杖顶端镶嵌着一颗鲜红的宝石。他背对着你，一只手在背后握成拳头。");
         addButton(0,"靠近",meetLaurentius3).hint("靠近那个穿长袍的人。");
      }
      
      public function meetLaurentius() : void
      {
         clearOutput();
         outputText("你走进了光柱。当魔法的光辉笼罩你时，你的身体感到一阵刺痛和轻微的震颤，很快你就被这光芒刺得睁不开眼。");
         outputText("[pg]一旦你到达中心，发光的脉冲就会变得越来越强。还没等你反应过来，你已经被一股未知的力量举了起来。你挣扎着，但只是在自己的轴心上转动，完全失去了重力。脉冲的嗡嗡声和光芒变得震耳欲聋。");
         outputText("[pg]最后一次脉冲袭来，你和光柱一起消失了。");
         doNext(enterPillar);
      }
      
      public function meetJeremiah() : void
      {
         var question8:int;
         var _g8:WizardTower;
         var question7:int;
         var _g7:WizardTower;
         var question6:int;
         var _g6:WizardTower;
         var question5:int;
         var _g5:WizardTower;
         var question4:int;
         var _g4:WizardTower;
         var question3:int;
         var _g3:WizardTower;
         var question2:int;
         var _g2:WizardTower;
         var question1:int;
         var _g1:WizardTower;
         var question:int;
         var _g:WizardTower;
         var _loc1_:* = null as IMap;
         clearOutput();
         menu();
         if((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2683) & 8) == 0)
         {
            outputText("你小心翼翼地靠近雕像，警惕着是否还有更多异次元陷阱。");
            outputText("[pg]大理石雕刻得非常精美；老人的脸庞和胡须都雕刻得完美无瑕。他的上半身穿着华丽的连帽长袍，上面印着的剑形纹章也很优雅。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,415) > 0 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2341) > 0 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2342) > 0)
            {
               outputText("你以前见过它；这是审判官的纹章！");
            }
            outputText("[pg]你退后一步，分析整座雕塑。工艺精湛，但并没有什么特别之处。");
            outputText("[pg]直到它转过头开始说话。");
            outputText("[pg][say: 哎呀，你好啊。你似乎对我挺感兴趣的！没关系，我也对你很感兴趣，呵呵——呃，不是你想的那种感兴趣。你是真实的，对吧？]");
            outputText("[pg]在最初的退缩之后，你微微转过头，回答说，是的，你是真实的。");
            outputText("[pg][say: 幻觉就是这么说的！或者幻觉想让我以为它们会这么说，这样我就不会去注意真实的人了。好吧，我只能凭信仰了。这这这就是我们的做法。]");
            outputText("[pg]这个声音里有些熟悉的东西。你思索了片刻，恍然大悟；这和你被送到迷宫时听到的声音一模一样！");
            outputText("[pg]你用这个信息质问他。");
            outputText("[pg][say: 我确实把你送进迷宫了，是吧？是吗？我真的不知道。我现在记性不太好……当我开始记起什么的时候，它又变得一片空白！]");
            outputText("[pg]你再次提出你的问题。");
            outputText("[pg][say: 哦，呵呵，抱歉。好吧，如果我把你送进迷宫，那是因为你是个入侵者。你知道，这是我的工作之一。把任何进入这座塔的东西送到那个异次元迷宫，这样他们就不会打扰维尔库斯了。哈，陷阱制造者的技艺真是奇妙，不是吗？它的效用是不被自己的眼睛所见证的。]");
            outputText("[pg]你挑了挑眉。");
            outputText("[pg][say: 或者我想，在这种情况下，无效性是被我的眼睛见证了。不过很高兴看到你还活着。如果你还活着的话。维尔库斯没有告诉我杀死任何离开迷宫的东西，所以我想我不会。我我我是耶利米，过去做过一件事的人。很高兴认识你。]");
            outputText("[pg]雕像对你微笑。它似乎完全不知道你几分钟前的处境有多么危险。你告诉他你的名字，并思考接下来该怎么做。");
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,2683,FlagDict_Impl_.arrayReadInt(_loc1_,2683) + 8);
         }
         else
         {
            outputText("你走近那个半雕刻的审判官。它立刻把脸转向你，带着那种迷茫但快乐的惯常目光。");
            outputText("[pg][say: 嘿——，我以前见过的人。很高兴再次见到你。]");
         }
         _g = this;
         question = 0;
         addButton(0,"过去",function():void
         {
            _g.askQuestion(question);
         }).hint("询问关于他的过去。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,415) > 0 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2341) > 0 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2342) > 0)
         {
            _g1 = this;
            question1 = 1;
            addButton(1,"纹章",function():void
            {
               _g1.askQuestion(question1);
            }).hint("询问他身上雕刻的审判官纹章。");
         }
         else
         {
            addButtonDisabled(1,"纹章","如果你认得他身上的纹章，你就可以和他谈谈。");
         }
         if((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2683) & 0x40) == 0)
         {
            _g2 = this;
            question2 = 2;
            addButton(2,"离开高塔",function():void
            {
               _g2.askQuestion(question2);
            }).hint("问他是否知道如何离开高塔。");
         }
         else
         {
            addButtonDisabled(2,"离开高塔","你已经有能力离开高塔了。");
         }
         _g3 = this;
         question3 = 3;
         addButton(3,"维尔库斯",function():void
         {
            _g3.askQuestion(question3);
         }).hint("问他维尔库斯是谁。");
         _g4 = this;
         question4 = 4;
         addButton(4,"高塔",function():void
         {
            _g4.askQuestion(question4);
         }).hint("向他询问关于高塔的事。");
         _g5 = this;
         question5 = 5;
         addButton(5,"哨兵",function():void
         {
            _g5.askQuestion(question5);
         }).hint("向他询问关于石像的事。");
         if((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2683) & 0x20) != 0 && (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2683) & 0x10) == 0)
         {
            _g6 = this;
            question6 = 6;
            addButton(6,"锁住的房间",function():void
            {
               _g6.askQuestion(question6);
            }).hint("问他是否知道打开附近走廊里那个锁住的房间的方法。");
         }
         else if(get_player().hasKeyItem("Talisman of the Flame"))
         {
            _g7 = this;
            question7 = 7;
            addButton(6,"护身符",function():void
            {
               _g7.askQuestion(question7);
            }).hint("向他询问你在维尔库斯尸体上找到的护身符。");
         }
         if((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2683) & 0x0200) != 0)
         {
            _g8 = this;
            question8 = 8;
            addButton(8,"迷宫",function():void
            {
               _g8.askQuestion(question8);
            }).hint("向他询问他试图将你放逐到的那个奇异迷宫。");
         }
         if((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2683) & 0x80) != 0 && (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2683) & 0x10) == 0)
         {
            addButton(7,"攻击",attackJeremiah).hint("攻击耶利米。");
         }
         addButton(14,"离开",runFunc).hint("离开雕像，回到房间。");
      }
      
      public function loseToLaurentius() : void
      {
         clearOutput();
         outputText("你倒下了，无力再继续这场决斗。劳伦提斯停止了悬浮，慢慢向你走来。");
         outputText("[pg]随着他的法杖轻轻一触，你感觉恢复了足够的精力站起来。他用法杖敲击着抽象的地面，你们俩又回到了塔顶。");
         outputText("[pg][say: 你还没有准备好。没关系。我会留在这里，等你磨练好自己。]");
         outputText("[pg]你点点头，疲惫地喘着粗气。");
         outputText("[pg][say: 当你想再试一次的时候，就回到这里。记住，[name]，烈火才能淬炼出好剑。我不指望你能不经历痛苦就获得成功。]");
         outputText("[pg]他转身面向火山岩。随着他一挥手，一道巨大的光束从天而降，将你从地上托起。很快，你消失了。");
         set_inDungeon(false);
         get_dungeons().usingAlternative = false;
         get_combat().cleanupAfterCombat();
         menu();
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function leaveLaurentius() : void
      {
         clearOutput();
         outputText("你问他是否知道有什么办法能把你送下去。");
         outputText("[pg][say: 是的，[name]。我能做到。不过，我的邀请依然有效。如果你觉得你灵魂的熔炉足够强大……就回到这里。你知道路的。]");
         outputText("他一挥手，你被一层发光的蓝色屏障包裹。你漂浮起来。随着他再次挥手，你消失了。");
         outputText("[pg]<b>现在可以在营地行动菜单中遇到劳伦提斯了。</b>");
         set_inDungeon(false);
         get_dungeons().usingAlternative = false;
         menu();
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function laurentiusChallenge2() : void
      {
         clearOutput();
         outputText("你告诉他你确实想挑战他。他露出了微笑。");
         outputText("[pg][say: 很好，我正希望你这么说。那么好吧，勇者，向我展示你的力量，让你灵魂的熔炉像太阳一样燃烧吧！]");
         outputText("[pg]巫师用他的法杖敲击地面，塔顶周围的区域被能量包裹。随着他再次敲击，你周围的环境像玻璃一样碎裂，将你们两人抛入无尽的宇宙中！");
         outputText("[pg][say: 让我看看你意志的力量，勇者！向我证明你配得上将现实扛在肩上！]");
         outputText("[pg]巫师升到空中，浑身发光，猛烈地挥舞了一下法杖，示意你开战。你准备好你的[weapon]，严阵以待！");
         outputText("[pg]<b>你正在与劳伦提斯的化身战斗！</b>");
         startCombatMultiple(new AspectOfLaurentius(),null,null,null,defeatLaurentius,loseToLaurentius,defeatLaurentius,loseToLaurentius,"站在你面前的是一位古老的巫师，以近乎全能而闻名。他漂浮在空中，闪耀着令人敬畏的力量，空间本身似乎都在他周围弯曲。虽然他掌握的力量令人恐惧，但他并不想将你从玛瑞斯抹除；他只是想测试你的潜力。\n\n他附近闪烁的光芒证明了他用魔法屏障包围了自己，这<b>将削弱大多数物理攻击。</b>");
      }
      
      public function laurentiusChallenge() : void
      {
         clearOutput();
         outputText("[say: 你要面对我？我想知道，你这么做是出于勇气，还是愚蠢？我想这并不重要。不过，我最后再问你一次。你真的想面对我吗？]");
         menu();
         addButton(0,"是的！",laurentiusChallenge2).hint("是的！与巫师战斗。");
         addButton(1,"不。",meetLaurentius3).hint("你最好不要。");
      }
      
      override public function initRooms() : void
      {
         var _loc1_:IMap = new IntMap();
         _loc1_.h[58] = roomEntrance;
         _loc1_.h[50] = roomEntrance2;
         _loc1_.h[42] = corridor;
         _loc1_.h[41] = pillar;
         _loc1_.h[43] = pillar;
         _loc1_.h[33] = pillar2;
         _loc1_.h[35] = pillar2;
         _loc1_.h[25] = staircase;
         _loc1_.h[27] = staircase;
         _loc1_.h[26] = studyRoom;
         _loc1_.h[18] = upperCorridor;
         _loc1_.h[10] = finalDoor;
         _loc1_.h[2] = theChamber;
         dungeonRooms = _loc1_;
         var _loc2_:int = 0;
         while(_loc2_ < int(get_dungeonMap().length))
         {
            get_connectivity()[_loc2_] = 15;
            _loc2_++;
         }
      }
      
      override public function initMap() : void
      {
         if(!onPillar)
         {
            dungeonMap = [1,1,0,1,1,-1,-1,-1,1,1,2,1,1,-1,-1,-1,1,1,0,1,1,-1,-1,-1,1,0,0,0,1,-1,-1,-1,1,0,1,0,1,-1,-1,-1,1,0,0,0,1,-1,-1,-1,1,1,0,1,1,-1,-1,-1,1,1,0,1,1,-1,-1,-1];
            if((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2683) & 0x10) != 0)
            {
               get_dungeonMap()[10] = 0;
            }
         }
         else
         {
            dungeonMap = [1,1,1,1,1,-1,-1,-1,1,1,0,1,1,-1,-1,-1,1,1,0,1,1,-1,-1,-1,1,1,0,1,1,-1,-1,-1,1,1,0,1,1,-1,-1,-1,1,1,0,1,1,-1,-1,-1,1,1,0,1,1,-1,-1,-1,1,1,0,1,1,-1,-1,-1];
         }
      }
      
      public function get_playerLoc() : int
      {
         return get_game().dungeons.get_playerLoc();
      }
      
      public function get_map() : DungeonMap
      {
         return get_game().dungeons.map;
      }
      
      public function finalDoor() : void
      {
         outputText("随着耶利米的封印被解除，曾经阻挡这条走廊的门现在解锁了，尽管由于它本身的重量，仍然很难推开。");
         outputText("[pg]在北边，还有另一段楼梯，长度与通向书房的那段相似。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2685) + 2 <= get_game().time.days && (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2683) & 0x0100) != 0)
         {
            outputText("[pg]虽然塔的这一部分以前是寂静的，但现在它像建筑物的其他部分一样，发出嗡嗡声并闪烁着光芒。光脉冲向上移动，召唤你再次拜访维尔库斯的坟墓。");
         }
         else
         {
            outputText("[pg]这里的寂静震耳欲聋，你再也听不到塔内其他地方存在的魔法脉冲的嗡嗡声。");
            if((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2683) & 0x0100) == 0)
            {
               outputText("当你看着上方的黑暗时，有一种明显的不祥预感。<b>你应该为一场漫长而艰苦的战斗做好准备。</b>");
            }
         }
      }
      
      public function exitDungeon() : void
      {
         clearOutput();
         outputText("你转身背对塔，向营地走去。");
         get_game().inDungeon = false;
         get_dungeons().usingAlternative = false;
         doNext(get_camp().returnToCampUseTwoHours);
      }
      
      public function enterTowerDimensionalShift() : void
      {
         clearOutput();
         outputText("你走进黑曜石塔，进入一条漆黑的走廊，武器已经准备好应对任何伏击。身后风景中闷热的高温很快被相当明显的凉爽所取代。你缓慢地向前移动，随着外部自然光线的变暗，你的脚步越来越小心。");
         outputText("[pg]走了几分钟后，你看到的只有漆黑一片。走廊长得不自然；你确信你现在已经走过了塔的宽度。你转过身，但连外面的一丝光亮都没有。当你意识到自己可能被诱入陷阱时，你的心沉了下去。");
         outputText("[pg]突然，你脚下的地板上散发出一阵光脉冲，几条发光的线条从你所在的位置冲出，向着黑暗移动，在抛光如镜的黑曜石板缝隙间爬行。光线在远处汇聚成一点，几乎远得看不见。");
         outputText("[pg]刹那间，整个走廊亮了起来，你被一股无形的力量抛到了地上。你晕乎乎地站起来，感觉自己仿佛同时被推向四面八方，走廊在旋转、翻滚、坠落、升起。走廊本身也在随机地拉伸、变宽、变高、变短，你差点当场吐出来。你看着自己的双手，惊恐地发现它们也开始变形，在不可能的维度中弯曲！");
         doNext(dimensionalShift2);
      }
      
      public function enterTower(param1:Number = 58) : void
      {
         get_game().dungeonLoc = 80;
         menu();
         onPillar = false;
         get_game().dungeons.startAlternative(this,int(param1),"Tower of Deception");
         get_game().dungeons.setDungeonButtons();
         runFunc();
      }
      
      public function enterPillar() : void
      {
         onPillar = true;
         get_game().dungeons.startAlternative(this,58,"Pillar of Apotheosis");
         get_game().dungeons.setDungeonButtons();
         runFuncPillar();
      }
      
      public function enterForReal() : void
      {
         var _g:WizardTower;
         var _loc1_:* = null as String;
         menu();
         clearOutput();
         if((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2683) & 1) == 0)
         {
            outputText("你走向大门，无视了雕像。");
            outputText("[pg]当你触摸大门光滑的表面时，即使在火山灰风暴的呼啸声中，你也能听到身后传来隆隆声和石头摩擦的声音。");
            outputText("[pg]你转过身，再次注视着这三座雕像。它们已经从静止的场景中移动了位置，现在都盯着你，它们毫无感情的目光向你发出危险的警告。");
            outputText("[pg]战士是第一个再次移动的，他挑衅地用长矛指着你。法师紧随其后，挥舞着她的法杖，而裸男则虚弱地举起了他的盾牌。");
            outputText("[pg]你有一场硬仗要打！");
            _loc1_ = "你正在与三个被某种未知力量施了魔法的活雕像战斗。其中一座雕像描绘了一个战士，身穿精美的板甲，挥舞着士兵的长矛，永远凝视着愤怒和狂暴。第二座雕像描绘了一个法师，身穿长袍，一手拿着书，另一手拿着法杖。她的脸上带着忧郁，仿佛是一个几乎无法抑制痛苦的人。第三座是一个裸男，蜷缩在他沉重的圆形盾牌后面。它们都制作精美，尽管时间的流逝和火山岩无情的风暴已经磨损了它们的一些工艺之美。";
            startCombatMultiple(new SentinelOfApostasy(),new SentinelOfBlasphemy(),new SentinelOfHeresy(),null,victoryAgainstSentinels,defeatedBySentinels,victoryAgainstSentinels,defeatedBySentinels,_loc1_);
         }
         else
         {
            outputText("你站在黑曜石塔的大门前。雕像已经被摧毁并失去了活力，现在沙尘暴已经将它们掩埋，几乎看不见了。令人不适的高温和撕裂的风迫使你做出决定：你是要进入这座神秘的塔，还是离开？");
            if((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2683) & 2) == 0)
            {
               _g = this;
               addButton(0,"进入高塔",function():void
               {
                  _g.toGatePuzzle();
               }).hint("向大门前进，并试图找到打开它的方法。");
            }
            else
            {
               addButton(0,"进入高塔",enterTowerDimensionalShift).hint("进入高塔内部。");
            }
            addButton(14,"离开",exitDungeon).hint("离开并返回营地。");
         }
      }
      
      public function enterDungeonpt2(param1:Boolean = true) : void
      {
         clearOutput();
         if(param1)
         {
            cheatTime(0.16);
         }
         else
         {
            cheatTime(1);
         }
         outputText(param1 ? "十分钟过去了" : "当你到达塔底时，已经过去了一个小时。它的大门与建筑的其余部分相称：63英尺高，36英尺宽，非常巨大，尽管几乎不引人注意，它的存在仅由塔底的细长切口标示。");
         if((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2683) & 1) == 0)
         {
            outputText("[pg]站在大门前的是三尊石像。一尊描绘了一个战士，穿着精美的板甲，挥舞着长矛。第二尊描绘了一个巫师，穿着长袍，一手拿着书，另一手拿着法杖。第三尊是一个裸体男人，挥舞着盾牌。它们展示了一个奇特的场景；战士将长矛指向裸体男人，他的目光明显充满了愤怒。巫师将法杖高举向天空，闭着眼睛，书紧紧抱在胸前。裸体男人蜷缩着，以胎儿的姿势站立，用盾牌保护自己。[pg]雕像开裂并覆盖着火山灰。它与周围的景观截然不同。你不确定它代表什么。");
         }
         outputText("[pg]你是进入塔内还是离开？");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2682) < 1)
         {
            outputText("[pg]<b>欺骗之塔现在可以从“地点”菜单内的“地牢”子菜单进入。</b>");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2682,1);
         }
         menu();
         addButton(0,"进入",enterForReal).hint("进入欺骗之塔。");
         addButton(14,"离开",exitDungeon);
      }
      
      public function enterDungeon() : void
      {
         var _g:WizardTower;
         clearOutput();
         get_game().inDungeon = true;
         get_game().dungeonLoc = 80;
         outputText("你在火山岩的艰苦旅行终于结出了果实。你到达了悬崖的顶部，被眼前的景象惊呆了；在地平线上，在一片开裂和烧焦的平原中间，矗立着一座巨大的、半倒塌的塔。");
         outputText("[pg]它至少有600英尺高。即使在能穿透该地区火山灰的稀少光线下，其黑曜石表面也闪闪发光。沿着其梯形的长度，几处裂缝和缺失的碎片在塔原本如镜面般光滑的表面留下了伤痕。你注意到塔顶有一个巨大的浮雕圆圈，尽管从你所在的距离无法看清细节。");
         outputText("[pg]你向前走，小心翼翼地爬下崎岖的悬崖。在火山岩中旅行总是一项复杂的任务，但这里的岩石特别危险，山丘陡峭得令人发指。");
         outputText("[pg]经过几分钟艰难的跋涉，你来到了悬崖底部，塔的巨大规模对你来说变得更加明显。即使在它破败的状态下，这也是你在玛瑞斯见过的最令人印象深刻的事物之一。你继续靠近。");
         outputText("[pg]随着你的靠近，炽热的风变得更强，卷起巨大的火山灰浪，让人难以视物和呼吸。你下意识地眯起眼睛，继续前进。");
         _g = this;
         doNext(function():void
         {
            _g.enterDungeonpt2();
         });
      }
      
      public function endPuzzle(param1:Boolean = false) : void
      {
         clearOutput();
         get_dungeons().setDungeonButtons();
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,2683,FlagDict_Impl_.arrayReadInt(_loc2_,2683) + 4);
         if(param1)
         {
            outputText("当你的镜像到达出口时，迷宫开始消失。墙壁、天花板和地板的碎片一块接一块地以荒谬的速度飞向无尽的虚空。很快，唯一剩下的就是你脚下的那块。");
            outputText("[pg]片刻之后，它也被发射到了太空中。你开始坠入以太，但在你尖叫出声之前，那种难以名状的、身体向内折叠的不适感再次袭来。");
            outputText("[pg]你凭空消失了。");
         }
         else
         {
            outputText("你分析着你的环境，以及周围的情况。你的克隆体，迷宫，无尽的太空。这是一个幻觉。一定是！你闭上眼睛集中注意力，用你的魔法打破目前折磨你的任何法术。");
            outputText("[pg]就像一个陷入清醒梦的人一样，你试图回到真实的自我。这个法术非常顽固，但凭借你卓越的智力，你慢慢地再次感知到了现实。走廊的寒冷。光芒的脉动。嗡嗡作响的符文。苍老的声音。你的感官一个接一个地帮助你打破了强加于你的幻觉。然后你睁开眼睛，眨眼间消失了。");
         }
         doNext(runFunc);
      }
      
      public function encounterVilkus() : void
      {
         var _gthis:WizardTower = this;
         clearOutput();
         spriteSelect(SpriteDb.get_s_vilkus_sleep());
         outputText("你顺着楼梯向上走，缓慢而小心。当你到达一个巨大的圆顶房间时，掩盖你上升的黑暗被昏暗的光线所取代。圆顶的顶部有一个洞，环境光从洞中倾泻而下，照亮了灰尘颗粒和一种永远萦绕在地板上的奇怪雾气。");
         outputText("[pg]十六块大小不一的莱希石水晶装饰着放置在房间边缘壁龛里的哥特式基座。它们脉动着，充满了邪恶的力量。");
         outputText("[pg]房间的中央是一个穿着破烂红色长袍、戴着面具的蒙面人，他坐在一把古老的木制华丽椅子上，虚弱地握着一把刺剑。");
         outputText("[pg][say: 所以……耶利米背叛了我。或者也许你摧毁了他。不管怎样，这都证明了他信仰的软弱。]蒙面人从椅子上站起来，颤抖着，用他的刺剑支撑着身体。破烂的长袍露出了他的一点皮肤。苍老、布满疤痕、瘦弱且饱经风霜。");
         outputText("[pg][say: 我不会让你带走它们的，恶魔！玛莱指引着我，她很快就会向我揭示道路。我知道……我有信仰。]");
         outputText("[pg]你告诉老人你不是恶魔" + (get_player().cor >= 60 ? "，尽管你已经堕落了" : "") + "。");
         outputText("[pg]他咯咯地笑了起来，咳嗽着。[say: 是吗？这种谎言是最罪恶的，可怜的生物。你将为此付出双倍的代价。]");
         outputText("[pg]他尽力挥舞着他的刺剑。[say: 等了这么多年，玛莱给了我最后一次考验我决心的机会。很好。在今天，异端审判庭将重新进行净化。]");
         outputText("[pg]他身上微弱地闪烁着能量，用刺剑指着你。<b>你正在与大审判官维尔库斯战斗！</b>");
         doNext(function():void
         {
            _gthis.startCombat(new ArchInquisitorVilkus(),false,false);
            _gthis.spriteSelect(SpriteDb.get_s_vilkus());
            _gthis.playerMenu();
         });
      }
      
      public function dimensionalShift2() : void
      {
         var _g:WizardTower;
         clearOutput();
         outputText("一切结束得就像开始时一样突然，你发现自己身处一个光线充足的房间里。你急促地呼吸着，站起身来，开始分析周围的环境。");
         _g = this;
         doNext(function():void
         {
            _g.enterTower();
         });
      }
      
      public function defeatedByVilkus() : void
      {
         clearOutput();
         outputText("你倒下了，无法继续战斗。");
         outputText("[pg][say: 玛莱，我不怀疑你的智慧。我一次又一次地证明了我的信仰。我会留在这里，保护我倒下的同志，等待你的祝福，你的启示。][pg]他转动着刺剑，向你走来。[pg][say: 无论何时，只要恶魔找到进入这个圣所的路……][pg]他将刺剑刺入你的胸膛，让你咳血呻吟。[pg][say: 它们都将被净化，就像异端审判庭曾经做过的那样。][pg]他扭动刀刃，摧毁了你的心脏，迅速抹去了你的生命。[pg][say: 仁慈的玛莱，感谢你给我这个再次证明自己的机会。]");
         doNext(vilkusGameOver);
      }
      
      public function defeatedBySentinels() : void
      {
         clearOutput();
         outputText("你倒下了，被敌人压倒了。战士和裸男走近你以确认他们的胜利，而法师则跪下祈祷。你盯着他们，他们大理石般的眼睛刺穿了你，让你对自己的命运充满恐惧。");
         outputText("[pg]伴随着最后一次抽搐，你试图进行一次半心半意的攻击，这让裸男惊恐地跑了回去。战士站立不动，你的攻击在施了魔法的石头上无害地弹开了。他举起长矛，将其向下指向你的心脏。你退缩了，准备迎接即将到来的攻击。");
         outputText("[pg]他猛地刺下武器，轻易地刺穿了你的[armor]和皮肤，伤到了你的心脏。你感到疼痛，尝到了血的味道，然后是寒冷。绝对的寒冷。");
         outputText("[pg]确认胜利后，战士回到了另外两座雕像旁，它们很快又恢复了之前不朽的场景。");
         get_game().gameOver();
         get_combat().cleanupAfterCombat();
      }
      
      public function defeatedByJeremiah() : void
      {
         clearOutput();
         if(get_player().get_lust() >= get_player().maxLust())
         {
            outputText("你倒下了，被欲望所吞噬。");
            outputText("[pg][say: 玛莱啊，居然被一尊大理石雕像挑逗得屈服了。不过也不能怪你。我知道如果我能走动的话，我也会试着做<b>那件事</b>的。][pg]你试图站起来再次攻击这座喋喋不休的雕像，但魅魔雕像抱住了你，开始性感地抚摸你的身体。你呻吟着，你的大脑失去了所有的攻击意图。][pg][say: 好吧，尽管你罪孽深重，我确实认为你能走到这一步还是相当有能力的。我想如果我为未来的入侵者增加一层防御，维尔库斯会同意的。][pg]他用那只空闲的手臂开始编织某种法术。不过，魅魔的抚慰让你无法长时间专注于威胁；你很快又被她的动作催眠了。[pg][say: 别担心，变成大理石也没那么糟！好吧，我当然会这么说，但这是真的。]");
            outputText("[pg]他对你施放了法术，你失去了意识。");
         }
         else
         {
            outputText("你倒下了，伤势过重。");
            outputText("[pg][say: 傀儡可是相当危险的，不是吗？没有思想，没有感情，强大的魔法让它们几乎不可战胜。哎呀，我可不想现在处在你的位置上！][pg]你试图站起来再次攻击这个喋喋不休的雕像，但男魅魔雕像迅速朝你的肚子踢了一脚，让你喘不过气来。[pg][say: 好吧，尽管你罪孽深重，但我确实认为你能走到这一步还是相当有本事的。如果我为未来的入侵者再增加一层防御，我想维尔库斯会同意的。][pg]他用唯一空闲的手臂开始编织某种法术。男魅魔将你按倒在地，让你无法起身。[pg][say: 别担心，变成大理石也没那么糟！好吧，我当然会这么说，但这是事实。]");
            outputText("[pg]他对你施放了法术，你失去了意识。");
         }
         doNext(statueBadEnd);
      }
      
      public function defeatVilkus() : void
      {
         clearOutput();
         outputText("维尔库斯倒下了，颤抖着，流着血。");
         outputText("[pg][say: 玛莱……你要抛弃我吗？难道我们不配吗？我们失去了那么多人，这片土地被玷污得如此严重……这还不够吗？为什么……为什么？！]");
         outputText("[pg]你走向那个被腐化的审判官，准备给予他最后一击。");
         outputText("[pg][say: 那么，我们都注定要毁灭了。当恶魔伏击我们时，希望就彻底破灭了。而现在……]");
         outputText("[pg]他抬起一只手，准备施展一个白焰法术。他还有余力战斗！");
         outputText("[pg][say: 而现在……信仰也随之死去了。]");
         outputText("[pg]他将手放在胸前，对自己施展了最后一个法术。他立刻爆发出火焰，大声惨叫着，短短几秒钟内就被完全烧焦，化为焦炭。");
         outputText("[pg]看着他的身体化为灰烬，你终于放松下来。虽然他是一个凶猛的对手，但你还是不禁对他的命运感到一丝悲哀。");
         outputText("[pg]有一件物品在审判官的自焚中幸存了下来：一枚带有永不熄灭火焰图案的小巧圆形徽章。你把它捡了起来，想知道它是否有什么用处。");
         get_player().createKeyItem("Talisman of the Flame",0,0,0,0);
         outputText("[pg]获得关键物品：<b>火焰护符！</b>[pg]");
         awardAchievement("我们即是火焰",280);
         get_player().upgradeBeautifulSword();
         get_combat().cleanupAfterCombat();
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2685,get_game().time.days);
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,2683,FlagDict_Impl_.arrayReadInt(_loc1_,2683) + 256);
         doNext(runFunc);
      }
      
      public function defeatLaurentius() : void
      {
         clearOutput();
         outputText("你击中了巫师，这是他第一次退缩并倒下，感受到了真正的痛苦。");
         outputText("[pg]你走上前去，渴望以你的胜利结束这场决斗。然而，还没等你出手，他就消失了。");
         outputText("[pg]渐渐地，你周围抽象的景象重新凝聚，你发现自己又回到了塔顶。劳伦提斯站在中央，面对着你。");
         outputText("[pg][say: 精彩！真是精彩绝伦。我这一生与无数强敌交过手，[name]，但你……你让我感到了压力。像你这样身手的人拥有真正的潜力，我只希望有一天你能完全掌控它。]");
         outputText("[pg]你疲惫地喘着粗气，露出了微笑。他的表情变得严肃起来。他转过身，面向火山岩。");
         outputText("[pg][say: 谢谢你，[name]。感谢你为我、为玛瑞斯以及所有生灵带来了希望。也许有一天，这个世界会枯萎消亡。到那时，我希望你还在这里，像你重新点燃我的灵魂一样，重新点燃它的灵魂，重塑它，将它从过去的错误中拯救出来。]");
         outputText("[pg]你告诉他，你真的不知道该如何拯救玛瑞斯。至少不是用那种方式。");
         outputText("[pg][say: 我不在乎，这也不重要。一切存在皆可被认知。我挑战你，不是为了考验你的知识。我挑战你，是为了看看你学习的意愿。]");
         outputText("[pg]劳伦提斯用他的法杖敲击地面。一道巨大的光束从天而降，将他笼罩其中。");
         outputText("[pg][say: 记住，[name]。肉体终会消亡。而你的灵魂将永存。]");
         outputText("突然，光束消失了，老巫师也随之不见了。[pg]");
         get_combat().cleanupAfterCombat();
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,2683,FlagDict_Impl_.arrayReadInt(_loc1_,2683) + 2048);
         awardAchievement("思想交汇",281,true);
         outputText("[pg]<b>获得新能力：灵魂爆发！</b>");
         get_player().createStatusEffect(StatusEffects.KnowsSoulburst,0,0,0,0);
         set_inDungeon(false);
         get_dungeons().usingAlternative = false;
         menu();
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function defeatJeremiah() : void
      {
         clearOutput();
         outputText("伴随着最后一击，你终于成功击碎了耶利米的魔法护甲，撕下了他“身体”的一大块。");
         outputText("[pg][say: 原来这就是死亡的感觉。我想把它记录下来，但我认为我没有时间了。]");
         outputText("[pg]在雕像还能说更多话之前，你再次击打它，将其击碎成上百块碎片。他终于安静了。");
         outputText("[pg]你听到附近走廊深处传来微弱的隆隆声和噼啪声。正如他那疯狂的话语所说，通往前方深处的门现在打开了。");
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,2683,FlagDict_Impl_.arrayReadInt(_loc1_,2683) + 16);
         get_dungeons().currDungeon.get_dungeonMap()[10] = 0;
         get_combat().cleanupAfterCombat();
         doNext(runFunc);
      }
      
      public function craftWeapon(param1:int) : void
      {
         clearOutput();
         switch(param1)
         {
            case 0:
               outputText("你把护身符交给他，告诉他你想要炎心长矛。");
               outputText("[pg][say: 太棒了，太棒了。现在，让我开始工作吧。]");
               outputText("[pg]耶利米用他仅有的一只手握住圆形的护身符。当他念出充满力量的咒语时，护身符发出了光芒，在你的眼前，它变成了一把美丽的黑金长矛，即使在完全没有光线的情况下，它似乎也闪耀着光芒。这真是一把绝妙的武器，配得上最受尊敬的审判官。");
               outputText("[pg][say: 我真的很怀念做这种事。给你，好好享受吧。我本想告诉你只杀恶魔和堕落的敌人，但我猜这么多年过去了，纯洁的生物已经所剩无几了。]");
               get_inventory().takeItem(get_weapons().FLMHRTSPEAR,confirmAcquired,notAcquired);
               break;
            case 1:
               outputText("你把护身符交给他，告诉他你想要炎毅盾牌。");
               outputText("[pg][say: 太棒了，太棒了。现在，让我开始工作吧。]");
               outputText("[pg]耶利米用他仅有的一只手握住圆形的护身符。当他念出充满力量的咒语时，护身符发出了光芒，在你的眼前，它变成了一面精美的黑金盾牌，即使在完全没有光线的情况下，它似乎也闪耀着光芒。这真是一面绝妙的盾牌，配得上最受尊敬的审判官。");
               outputText("[pg][say: 我真的很怀念做这种事。给你，好好享受吧。我本想告诉你只杀恶魔和堕落的敌人，但我猜这么多年过去了，纯洁的生物已经所剩无几了。]");
               get_inventory().takeItem(get_shields().FLMGRIT_SH,confirmAcquired,notAcquired);
               break;
            case 2:
               outputText("你把护身符交给他，告诉他你想要炎灵戒指。");
               outputText("[pg][say: 太棒了，太棒了。现在，让我开始工作吧。]");
               outputText("[pg]耶利米用他仅有的一只手握住圆形的护身符。当他念出充满力量的咒语时，护身符发出了光芒，在你的眼前，它变成了一枚精美的黑金戒指，即使在完全没有光线的情况下，它似乎也闪耀着光芒。这真是一件绝妙的珠宝，配得上最受尊敬的审判官。");
               outputText("[pg][say: 我真的很怀念做这种事。给你，好好享受吧。我本想告诉你只杀恶魔和堕落的敌人，但我猜这么多年过去了，纯洁的生物已经所剩无几了。]");
               get_inventory().takeItem(get_jewelries().FLMSPRTRNG,confirmAcquired,notAcquired);
         }
      }
      
      public function corridor() : void
      {
         if((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2683) & 4) == 0)
         {
            mirrorPuzzle();
         }
         else
         {
            outputText("走廊通向一个更加开阔的区域，两侧和顶部都敞开着，露出一个巨大的圆形房间，让你显得无比渺小。当你抬头仰望时，根本看不到天花板。一根同样由光滑黑曜石制成的巨大柱子矗立在中心，直插云霄。光脉冲继续从走廊涌出，沿着柱子攀升，点亮了柱身上数千个符文。");
            outputText("[pg]现在你已经从迷宫中解脱出来，可以继续前进了。");
         }
      }
      
      public function confirmAcquired() : void
      {
         clearOutput();
         outputText("你拿走了你的奖励。仅仅是触摸它就让你充满了力量和决心。你感谢耶利米给了你这件物品。");
         outputText("[pg][say: 别客气。说真的，别提了。我可不想再有恶魔来埋伏这个地方了。]");
         get_player().removeKeyItem("Talisman of the Flame");
         doNext(meetJeremiah);
      }
      
      public function attackJeremiah() : void
      {
         clearOutput();
         outputText("你准备好你的[weapon]，摆好架势，打算摧毁这座大理石雕像并打开那扇锁着的门。");
         outputText("[pg][say: 噢，如果我是你，我可不会这么做。但如果我是你，我就不是我了，所以就算你成功了我也不会死。所以也许我会这么做！]");
         outputText("[pg]你叹了口气，用尽全力击打雕像。令你惊讶的是，你几乎没在大理石上留下任何痕迹！");
         outputText("[pg][say: 魔法！总是这么好用。好吧，既然你打算摧毁我，我想我试着摧毁你也是很公平的。准备好了！]");
         outputText("[pg]这个构造体举起它那只雕刻出来的手臂，附近雕像的碎片开始自行移动，重新组装起来！");
         outputText("[pg]你正在与<b>建筑师耶利米</b>战斗！");
         var _loc1_:String = "建筑师耶利米是一块半雕刻的大理石板，经过魔法强化，几乎坚不可摧。他本身基本上是无害的，一只手臂与粗糙的大理石融合在一起，另一只手臂伸展不到两英尺。在附近，三座雕像正在不断地自我重组。根据你之前的遭遇，你确信，当它们完成时，它们将不仅仅是美丽的雕塑。";
         startCombatMultiple(new ArchitectJeremiah(),new IncubusStatue(),new SuccubusStatue(),new ImpStatue(),defeatJeremiah,defeatedByJeremiah,defeatJeremiah,defeatedByJeremiah,_loc1_);
         get_game().monsterArray[1].set_HP(0);
         get_game().monsterArray[2].set_HP(0);
         get_game().monsterArray[3].set_HP(0);
      }
      
      public function askQuestion(param1:int) : void
      {
         var which2:int;
         var _g2:WizardTower;
         var which1:int;
         var _g1:WizardTower;
         var which:int;
         var _g:WizardTower;
         var _loc2_:* = null as IMap;
         clearOutput();
         switch(param1)
         {
            case 0:
               outputText("你问他过去作为“做过某事的人”的经历。他扭动了一会儿，显然对现在的姿势感到不舒服，然后才回答。");
               if((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2683) & 0x0200) != 0)
               {
                  outputText("[pg][say: 我曾是一名审判官，在那个教团还存在的时候。所有在这里避难的人都是。审判庭是一个由战士和巫师组成的团体，他们联合起来对抗腐化，无论腐化的源头是什么，也无论它有多么势不可挡。]");
                  outputText("[pg][say: 我们取得了一部分成功，但事实证明他们太强大了，数量太多，无法通过常规手段进行反击。我们在这里避难。我们遭到了伏击，在这里我们迎来了过早的终结，我们中的大多数人都变成了我们试图对抗的东西的本质：魔晶。]");
               }
               else
               {
                  outputText("[pg][say: 嗯，是的。我确实记得我过去做过一件事。这对世界的命运非常重要，我也非常重要。不过我现在想不起来了。除了我必须保护维尔库斯以便他能继续他的工作之外，我记不起太多了。]");
                  outputText("[pg]你挠了挠头。这座雕像看起来确实已经神志不清了。");
               }
               break;
            case 1:
               outputText("你问他身上的纹章，或者说雕刻的纹章。这和你从审判官衣服上找到的纹章是一样的。");
               if((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2683) & 0x0200) != 0)
               {
                  outputText("[pg][say: 你认得它？那是不是意味着……审判庭还在玛瑞斯活动？]");
                  outputText("[pg]你摇了摇头，告诉他你是在一座古墓里找到这些衣服的。");
                  outputText("[pg][say: 哦，]他明显有些失望，[say: 那真是太遗憾了。是的，我们这里曾经都是审判官。我们中的一些人更喜欢实用的盔甲，但许多人还是非常自豪地穿着带有纹章的衣服。虽然现在这已经没什么意义了。哦，好吧。]");
                  outputText("[pg]好吧，这没什么好说的了。");
               }
               else
               {
                  outputText("[pg][say: 哦？]雕像笨拙地转过身，尽可能地面对自己的胸口。[say: 审判官……这勾起了我的回忆。][pg]他扬起石头的眉毛。[pg][say: 哦！呵呵，不，没了。真有趣。]");
                  outputText("[pg]好吧，值得一试。");
               }
               break;
            case 2:
               outputText("你问他是否知道怎么离开这座塔。");
               outputText("[pg][say: 是的，我想如果你不会传送的话，那确实很难。嗯哼。维尔库斯告诉我，允许任何人进来是【被禁止的】。所以我想，允许你离开是我能做的最【不被禁止】的事情了！]");
               outputText("[pg]你耸了耸肩。");
               outputText("[pg][say: 啊，耸肩，同意别人的最好方式。很好，我会用我的一些魔法打破封印入口的咒语。只是要小心，别让火山灰飘进塔里。那会把它弄得很脏的。]");
               _loc2_ = KFLAGS.flags;
               FlagDict_Impl_.arrayWriteInt(_loc2_,2683,FlagDict_Impl_.arrayReadInt(_loc2_,2683) + 64);
               break;
            case 3:
               outputText("你问他维尔库斯是谁。他稍微动了动，显然对这个话题感到不舒服。");
               if((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2683) & 0x0200) != 0)
               {
                  outputText("[pg][say: 维尔库斯是大审判官，是我们中被授予的最高军衔。我们都追随他，无论情况多么危急，或者我们的前景多么无望。他是审判官应该是什么样子的，以及应该如何对抗恶魔威胁的最好榜样。]");
                  outputText("[pg]你叹了口气，告诉他当维尔库斯攻击你时，你别无选择，只能杀了他。");
                  outputText("[pg][say: 我理解。在这里待了几年后……维尔库斯变了。也许在这么多莱希石附近生活最终腐蚀了他的灵魂，侵蚀了他的理智。又或者他的信仰最终遇到了对手，他对亲爱的老玛莱的沉默感到绝望。无论如何，他早该休息了。]");
                  outputText("[pg]你理解地点了点头。");
               }
               else
               {
                  outputText("[pg][say: 维尔库斯是制定规则的人。他告诉我不要让任何人进来，这样他的工作就不会被打扰。打扰他的工作是非常被禁止的。我想，我发过誓不这么做。]");
                  outputText("[pg]你问他在做什么工作。");
                  outputText("[pg][say: 我不知道。我想我曾经知道。但那段记忆离我太遥远了，就像任何离我超过两英尺的东西一样。我本来想让你亲自去问他，但那是被禁止的。]");
                  outputText("[pg]他笑了，确信他已经告诉了你需要知道的一切。这离真相还差得远，但很难从他嘴里套出什么话来。");
               }
               break;
            case 4:
               outputText("你问他是否知道谁建造了这座塔，或者它的目的是什么。");
               if((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2683) & 0x0200) != 0)
               {
                  outputText("[say: “劳伦提斯是第一人”。这座塔的故事已经消失在时间的长河中，甚至在文明还没有被恶魔的威胁摧毁的时候。我想现在关于它的信息更难找到了，因为恶魔并不擅长保存知识。]");
                  outputText("[pg][say: 根据我们学者的发现，劳伦提斯是一位异常强大的巫师。他与同时代的其他巫师不同，他不想回到自己的家乡世界。他想重塑这个世界，以符合他的理想。多么狂妄自大啊！]");
                  outputText("[pg]你点点头。挺有意思的。");
                  outputText("[pg][say: 是的，嗯，从残存的历史碎片来看，似乎是他建造了这座塔，过着孤独的研究和追求知识的生活。他非常喜欢制作魔像和活体雕像——给没有生命的东西赋予生命。在维尔库斯决定把它们全部烧成灰烬之前，我从他留在这里的著作中学到了很多。恐怕现在一切都失传了。]");
                  outputText("[pg]真遗憾。你感谢他提供的信息。");
               }
               else
               {
                  outputText("[pg][say: 嗯，外面的小谜题说劳伦提斯是第一人，所以我假设是他建的。我本来想把那个谜题改得更难一点，但你会惊讶于制作一个好谜题有多难。肯定比解开一个难多了！]");
                  outputText("[pg]你叹了口气，让他集中注意力回答问题。");
                  outputText("[pg][say: 是的，是的，集中注意力。至于这座塔的用途，我真的说不上来。它看起来不像是普通的巫师塔。那些塔通常有各种设施、图书馆、厨房、性爱地牢之类的。哦，多么罪恶啊。那些魔法符文可能意味着什么，但我不知道。我最后的猜测是：这座塔被建造出来，是因为它能被建造出来。有时候这就是你做某件事所需要的全部理由！]");
                  outputText("[pg]这大概就是你能从他那里得到的全部信息了。");
               }
               break;
            case 5:
               outputText("你问他是谁制作了这些活体和非活体雕像。");
               if((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2683) & 0x0200) != 0)
               {
                  outputText("[pg][say: 嗯。是我。我曾经是，或者说过去是，异端审判庭的首席建筑师。我建造了很多东西。盔甲、武器、珠宝，而且我掌握了将某人的本质转移到无生命物体中的知识，赋予它生命并让它听从我的命令。]");
                  outputText("[pg]你问他关于哨兵的事，还有他自己。");
                  outputText("[pg][say: 外面的哨兵是……老朋友，如果你愿意的话，也可以说是搭档。在恶魔伏击了这座塔之后，维尔库斯对我们教团仅存的几名成员越来越不信任，他认为这次袭击是我们中间的一个叛徒引来的。在维尔库斯的命令下，我把他们一个接一个地变成了仆人雕像。]");
                  outputText("[pg][say: 他们中的一些人接受了这个光荣地为异端审判庭服务的机会。另一些人……就不那么情愿了。]");
                  outputText("[pg]你问他为什么把自己变成雕像，而且还是个半成品。");
                  outputText("[pg][say: 哼。当不可避免的时刻到来，维尔库斯命令我把自己变成一个永恒的哨兵时，我接受了这个任务，既是为了证明我的忠诚，也是为了永远保护他。然而，在这个过程进行到一半时，他破坏了它，并施放了一个法术来扭曲我的心智，只给我灌输了几个基本的指令。]");
                  outputText("[pg]你猜测这是否是为了防止任何人打扰他。");
                  outputText("[pg][say: 是的，完全正确。也许他认为如果我完全控制自己，我就不会永远服侍他。我想知道是什么让他产生了这种怀疑。无论如何，随着时间的推移，我制作了更多的雕像，用我们碰巧抓来审问的任何囚犯作为材料。有时我也会摧毁它们，因为我也把它们视为入侵者。而且因为这很有趣。]");
                  outputText("[pg]你接着问他，既然他现在恢复了理智，为什么不完成这项工作或者解除法术。");
                  outputText("[pg][say: 这个过程相当，呃，单向。虽然看起来不像，但法术确实完全生效了；只是，当我尝试它的时候，我真的认为这种形态对我来说已经足够好了。所以我想我会永远留在这里。也许会重新建造一些雕像，命令它们解开这座塔的秘密。至少这是个爱好。]");
                  outputText("[pg]耶利米叹了口气，这是你遇见他以来他第一次露出悲伤的表情。现在最好还是别管他了。");
               }
               else
               {
                  outputText("[pg][say: 嘿嘿，我不喜欢吹牛，但我确实做到了。对一个虚弱的目标施点魔法，然后噗，大理石！或者也许我先做雕像，然后用魔法转移它的灵魂。或者也许这些都不是。谁知道呢，真的？]");
                  outputText("[pg]有意思。你追问下去，问他这些雕像的用途。");
                  outputText("[pg][say: 随你便！外面的三座雕像是为了防御而设置的，是防止维尔库斯被打扰的另一层措施。不过既然你在这里，我猜它们现在已经被毁得差不多了。]");
                  outputText("[pg]你点点头，确认了他的猜测。");
                  outputText("[pg][say: 哦，真麻烦。没有多少材料可以用来做雕像了，无论是大理石还是灵魂。除非你想帮忙？]");
                  outputText("[pg]你眯起了眼睛。");
                  outputText("[pg][say: 嘿，我只是问问而已。]");
               }
               break;
            case 6:
               outputText("你问他附近走廊里那扇锁着的门。");
               outputText("[pg][say: 是的，它锁得很严实。怎么了？]");
               outputText("[pg]你问他有没有钥匙，或者知不知道钥匙可能是什么。");
               outputText("[pg][say: 嗯，我就是钥匙。我用我的精华，或者灵魂，或者一些类似的魔法废话来为那扇门的锁提供能量。我可以让你进去，但我不会。这是我能想象到的最被禁止的事情！你最好别管这件事了。" + ((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2683) & 0x40) == 0 ? " 来，我给你打开地牢的入口，这样你就可以离开了。" : "") + "]");
               outputText("[pg]看来你打不开那扇门了。至少不能用友好的方式。");
               if((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2683) & 0x40) == 0)
               {
                  _loc2_ = KFLAGS.flags;
                  FlagDict_Impl_.arrayWriteInt(_loc2_,2683,FlagDict_Impl_.arrayReadInt(_loc2_,2683) + 64);
                  get_dungeons().currDungeon.get_dungeonMap()[10] = 0;
               }
               if((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2683) & 0x80) == 0)
               {
                  _loc2_ = KFLAGS.flags;
                  FlagDict_Impl_.arrayWriteInt(_loc2_,2683,FlagDict_Impl_.arrayReadInt(_loc2_,2683) + 128);
               }
               break;
            case 7:
               outputText("你问他在维尔库斯身上找到的护身符。");
               outputText("[pg][say: 哦，有意思。我以为这些早就失传了。这些护身符是信任的象征，赐予那些展现出力量和信仰的受尊敬的审判官。它们蕴含着巨大的魔法潜能，我忍不住想知道为什么维尔库斯没有使用它。也许他觉得自己不配？嗯，值得思考。]");
               outputText("[pg]你问他你能不能用它做点什么。");
               outputText("[pg][say: 你？什么也做不了。我？我可以把那个护身符塑造成一件拥有可怕力量的物品！它本来只应该给审判官，但考虑到现在的情况，我就破例一次。现在，你在想什么？]");
               menu();
               _g = this;
               which = 0;
               addButton(0,"长矛",function():void
               {
                  _g.craftWeapon(which);
               }).hint("制作炎心长矛，它具有很高的护甲穿透力，并且使用者的生命值越低，造成的伤害就越高。");
               _g1 = this;
               which1 = 1;
               addButton(1,"盾牌",function():void
               {
                  _g1.craftWeapon(which1);
               }).hint("制作炎毅盾牌，它具有很高的防御等级，并根据爱人和同伴的数量恢复使用者的生命值。");
               _g2 = this;
               which2 = 2;
               addButton(2,"戒指",function():void
               {
                  _g2.craftWeapon(which2);
               }).hint("制作炎灵戒指，它能大幅提升法术的威力，但也会增加法术消耗。");
               addButton(14,"不用了",meetJeremiah).hint("现在什么都不做。");
               return;
            case 8:
               outputText("你问他把你放逐到的那个异次元迷宫。");
               outputText("[pg][say: 真是个奇妙的东西，不是吗？我真希望我能说这是我的，但可惜不是。那是劳伦提斯的杰作。我只是发现了它并重置了陷阱，就像一个不洗澡的巫师从书本上学习法术一样。]");
               outputText("[pg]你瞪着他。");
               outputText("[pg][say: *咳咳* 呃，让我惊讶的是你居然成功离开了那里。我可是非常小心地、不顾一切地破坏了走廊周围尽可能多的魔法矩阵，把一个有趣的谜题变成了一个必死无疑的噩梦领域。你是怎么做到的？]");
               outputText("[pg]你告诉他，在你的迷宫下方又出现了一个迷宫，里面有一个你的克隆体和一个出口。");
               outputText("[pg][say: 真的吗？] 雕像试图抚摸它那石头做的胡子。[say: 这就有意思了。既然我把法术搞得那么糟，剩下的唯一可能就是有人帮了你，就像守护天使一样。或者有人喜欢看着你在各个地方跌跌撞撞。那可能相当有趣！]");
               outputText("[pg]真是个谜。你点点头，思考着他说的话。");
         }
         doNext(meetJeremiah);
      }
      
      public function answerPuzzle(param1:int) : void
      {
         var _g1:WizardTower;
         var retry:Boolean;
         var _g:WizardTower;
         var _loc2_:* = null as IMap;
         clearOutput();
         menu();
         if(param1 != 1)
         {
            outputText("字迹消失了，不久之后，大门上又写下了一句新话。");
            outputText("[pg][say: 这里不欢迎你。为你的无知付出代价，并为神化提供燃料吧。]");
            outputText("[pg]魔法阵亮了起来，符文沿着中心轴旋转。突然，一道强光从中射出，让你瞬间失明！");
            outputText("[pg]还没等你逃跑或做出反应，你就真切地感觉到自己被魔法击中了。你浑身颤抖，感到精疲力竭，你的精神和肉体都在枯萎腐烂！");
            dynStats(DynStat.Str(-5),DynStat.Tou(-5),DynStat.Spe(-5),DynStat.Inte(-5));
            outputText("<b> (所有战斗属性 -5！)</b>");
            outputText("[pg]你想再试一次吗？");
            _g = this;
            retry = true;
            addButton(0,"再试一次",function():void
            {
               _g.toGatePuzzle(retry);
            }).hint("尝试其他答案。");
         }
         else
         {
            outputText("字迹消失了，不久之后，大门上又写下了一句新话。[say: 欢迎，巫师。愿神化早日降临我们所有人。]");
            outputText("[pg]勾勒大门的线条发出光芒，在你眼前，巨大的黑曜石石板消失了，露出了入口！");
            outputText("[pg]不管里面有什么，可能都不会对你的闯入感到高兴。最好做好准备。<b>你之后可能无法立即返回营地。</b>");
            _loc2_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc2_,2683,FlagDict_Impl_.arrayReadInt(_loc2_,2683) + 2);
            _g1 = this;
            addButton(0,"进入高塔",function():void
            {
               _g1.enterTower();
            }).hint("正式进入高塔。");
         }
         addButton(14,"离开",leave).hint("离开大门和谜题。");
      }
   }
}

