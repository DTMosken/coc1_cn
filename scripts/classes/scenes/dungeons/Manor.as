package classes.scenes.dungeons
{
   import classes.CoC;
   import classes.DebugMenu;
   import classes.DynStat;
   import classes.ItemType;
   import classes.Monster;
   import classes.Output;
   import classes.PerkLib;
   import classes.Player;
   import classes.SelfDebug;
   import classes.StatusEffects;
   import classes.Time;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.items.UseableLib;
   import classes.items.WeaponLib;
   import classes.saves.SelfSaver;
   import classes.saves.SelfSaving;
   import classes.scenes.Camp;
   import classes.scenes.Inventory;
   import classes.scenes.combat.Combat;
   import classes.scenes.dungeons._DungeonRoomConst.DungeonRoomConst_Impl_;
   import classes.scenes.dungeons._Manor.SaveContent;
   import classes.scenes.dungeons.manor.BoneCourtier;
   import classes.scenes.dungeons.manor.BoneGeneral;
   import classes.scenes.dungeons.manor.BoneJester;
   import classes.scenes.dungeons.manor.LethiciteCrystal;
   import classes.scenes.dungeons.manor.NamelessHorror;
   import classes.scenes.dungeons.manor.Necromancer;
   import classes.scenes.dungeons.manor.SkeletonHorde;
   import coc.view.CoCButton;
   import flash.Boot;
   import haxe.IMap;
   import haxe.ds.IntMap;
   
   public class Manor extends DungeonAbstractContent implements SelfDebug, SelfSaving
   {
      
      public var saveVersion:int;
      
      public var saveName:String;
      
      public var saveContent:SaveContent;
      
      public var infinityMaps:Array;
      
      public var infinityLevel:int;
      
      public var infinityFunc:Function;
      
      public var globalSave:Boolean;
      
      public var codespell:String;
      
      public var code:Number;
      
      public function Manor()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         globalSave = false;
         saveVersion = 1;
         saveName = "manor";
         saveContent = new SaveContent(null,null,null);
         codespell = "";
         code = 0;
         infinityLevel = 0;
         infinityMaps = [];
         super();
         infinityFunc = infinity1;
         SelfSaver.register(this);
         DebugMenu.register(this);
      }
      
      public function useCrystal() : Boolean
      {
         clearOutput();
         if(isInChamber() && (get_time().hours >= 19 || get_time().hours == 0))
         {
            get_inventory().callNext = runFunc;
            outputText("你举起水晶，透过它凝视着，盯着它那许多像星星一样闪烁的光点。这应该是不可能的，但水晶内部的区域比它的体积还要大。无限大。");
            outputText("[pg]当真相浮现时，你逐渐睁大了眼睛。这块水晶是一扇窗户！通向另一个维度，另一个世界，或者是这个现实，你不确定。但你的脑海中毫无疑问。你试图把目光从它身上移开，但你做不到。你完全被那无限的一瞥惊呆了。");
            outputText("[pg]原本昏暗的房间变得漆黑一片，水晶从你的手中消失了。然而，通向无限的窗户并没有消失。它不断扩大，慢慢吞噬了整个房间。你惊慌失措，试图逃跑，但为时已晚！你被宇宙的网格包围，被永恒所淹没。");
            switchFloor(3,0,false);
            return true;
         }
         outputText("你举起水晶，透过它凝视着，盯着它那许多像夜空中的星星一样闪烁的光点。它在某种程度上确实很美，但这并没有什么意义。");
         outputText("[pg]你发现很难将目光从水晶之外的无限虚空中移开。你不知怎么地想起了庄园，想起了它下面那亵渎神明的房间，以及在深夜进行的亵渎仪式。");
         return false;
      }
      
      public function tunnels5() : void
      {
         clearOutput();
         if((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2671) & 0x80) == 0)
         {
            outputText("[say: 然而，不管我的计划是否符合道德，我仍然必须成功。如果你必须前进，那就前进吧。但要知道，你这样做是在助长我的野心，并进一步推进我的目标。]");
         }
         else
         {
            outputText("尽管死灵法师已被击败，你在穿过这些隧道时仍然感到不安。");
         }
      }
      
      public function tunnels4() : void
      {
         clearOutput();
         if((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2671) & 0x80) == 0)
         {
            outputText("[say: 我变成的这个怪物，也许是对我愚蠢行为的恰当惩罚，我的好奇心变成了痴迷。我说不清不归路是在哪里。一开始，我只是一个渴望揭开祖先秘密的年轻人。最后，许多无辜者为我不可名状的违背自然之举付出了代价。[pg]那些工人，伊芙琳，以及她多年来收割的无数灵魂。]");
         }
         else
         {
            outputText("尽管死灵法师已被击败，你在穿过这些隧道时仍然感到不安。");
         }
      }
      
      public function tunnels3() : void
      {
         clearOutput();
         if((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2671) & 0x80) == 0)
         {
            outputText("[say: 我做过许多让我后悔的事。然而，如果重来一次，我还是会做。这个世界是一个幻象。我初次造访这座庄园时不断做的噩梦，起初是疯狂的征兆，但后来，却是一瞥真相。[pg]我想要解放自己。想要获得揭示宇宙真实本质的宇宙视野。没有人类拥有撕开深渊之门所需的寿命或直觉。那么，唯一的选择就是超越人类。]");
         }
         else
         {
            outputText("尽管死灵法师已被击败，你在穿过这些隧道时仍然感到不安。");
         }
      }
      
      public function tunnels2() : void
      {
         var overrideAbandon:Object;
         var nextAction:Function;
         var itype:ItemType;
         var _g:Inventory;
         var _loc1_:* = null as String;
         clearOutput();
         outputText("你缓慢地穿过隧道，在墙上昏暗火把的帮助下，一点一点地向前移动。");
         if((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2671) & 0x40) == 0)
         {
            outputText("[pg]突然，你听到了盔甲碰撞的声音。");
            outputText("[pg]骨头嘎吱作响的声音。");
            outputText("[pg]还有诡异的吟唱声。");
            outputText("[pg]你向前走了几英尺，随即立刻向侧面跳跃翻滚，一把熟悉的战锤砸碎了石地板！<b>骸骨守卫</b>不知怎么地又复活了，挡住了你的去路！");
            outputText("[pg]你准备战斗，但当你看到那个穿着盔甲的骷髅旁边出现了一个较小的身影时，你的注意力被分散了。<b>白骨巫师</b>也复活了！");
            if((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2671) & 8) != 0)
            {
               outputText("[pg]你的直觉让你检查身后，不出所料，那个亡灵小丑站在那里，手里拿着一把匕首抽搐着。<b>白骨小丑</b>也回来了！");
            }
            else
            {
               outputText("[pg]你的直觉让你检查身后，令你惊讶的是，那里站着另一个骷髅，穿着小丑的衣服，摆出战斗姿态不自然地抽搐着，双手挥舞着匕首。你正在与一只<b>白骨小丑</b>战斗！");
            }
            outputText("[pg]没有退路了。你必须同时对抗这三个庄园守卫！");
            _loc1_ = "在你面前站着一群名副其实的复活骷髅。骸骨守卫站在最前面，用它巨大的装甲身躯保护着其余的骷髅。白骨小丑在你的视线中快速穿梭，试图分散你的注意力。站在它们后面的是白骨巫师，它正在准备奥术法术来削弱你，以便它的同伴能解决你。";
            startCombatMultiple(new BoneGeneral(),new BoneJester(),new BoneCourtier(),null,defeatCourt,loseToCourt,defeatCourt,loseToCourt,_loc1_);
         }
         else if((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2671) & 8) == 0 && (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2671) & 0x10) == 0)
         {
            outputText("[pg]你看到地板上躺着一把深色的弯曲匕首。也许是那个亡灵小丑留下的？");
            _g = get_inventory();
            itype = get_weapons().CDAGGER;
            nextAction = tookDagger;
            overrideAbandon = runFunc;
            addButton(1,"拿取匕首",function():void
            {
               _g.takeItem(itype,nextAction,overrideAbandon);
            }).hint("拿走这把匕首。");
         }
      }
      
      public function tunnels1() : void
      {
         var newLoc:int;
         var floor1:int;
         var _g:Manor;
         clearOutput();
         if(get_dungeons().prevLoc == 0)
         {
            if((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2671) & 0x80) != 0)
            {
               outputText("你穿过未上锁的大门，走向庄园深处。尽管死灵法师已经覆灭，但当你走下被阴影笼罩的楼梯时，还是忍不住感到一阵恐惧。");
            }
            else
            {
               outputText("你小心翼翼地往下走，黑暗逐渐吞噬了你的视线。没过多久，你来到了楼梯的尽头，试图尽可能地看清周围的环境。");
               outputText("[pg]你站在一条长廊的起点，石墙上散布着一排昏暗的火把，借着微弱的光芒，你勉强能看清它的长度。石工的质量显然很高，地板也是如此。不管这个地方是用来做什么的，它都是被精心建造的，并且经久耐用。");
               outputText("[pg]你的[skin]感到空气有些凉意，你注意到走廊深处散发出一股淡淡的化学品气味。" + (get_player().hasPerk(PerkLib.HistoryAlchemist) ? " 你深吸了一口气，试图辨认气味的来源。防腐液，你心想。" : " 不管来源是什么，它的用途肯定很阴森。"));
            }
         }
         else
         {
            outputText("你走到了走廊的尽头，看到了通往庄园图书馆的楼梯。你感到一种强烈的冲动想要爬上去，就像你必须从深水下浮出水面呼吸新鲜空气一样。");
         }
         _g = this;
         floor1 = 1;
         newLoc = 0;
         setStairButtons(function():void
         {
            _g.switchFloor(floor1,newLoc);
         });
      }
      
      public function tookDagger() : void
      {
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,2671,FlagDict_Impl_.arrayReadInt(_loc1_,2671) | 0x10);
         runFunc();
      }
      
      public function tookCrystal() : void
      {
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,2671,FlagDict_Impl_.arrayReadInt(_loc1_,2671) | 0x0100);
         runFunc();
      }
      
      public function theChamber() : void
      {
         var _g1:Manor;
         var overrideAbandon:Object;
         var nextAction:Function;
         var itype:ItemType;
         var _g:Inventory;
         clearOutput();
         var _loc1_:String = "站在你面前的是一个高耸的怪物，一个噩梦般的存在。死灵法师披着一件红色斗篷，呼吸缓慢，对即将到来的胜利充满信心。他周围堆放着几堆骨头，骷髅正从这些骨头中组装起来攻击你。";
         if((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2671) & 0x0200) != 0)
         {
            _loc1_ += "\n\n随着忘川水晶被摧毁，他的召唤能力被削弱了。\n\n";
         }
         outputText("你走近一个巨大的房间，这里的照明比你之前的隧道好得多。尸体和骷髅堆积如山，成堆的书籍、炼金台、笼子和仪式法阵散布在这个阴森的房间里。");
         if((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2671) & 0x80) == 0)
         {
            outputText("在一个火炬形状的祭坛上，躺着一个高大的人形生物，全身披着红色斗篷。");
            outputText("[pg]它转过身来面对你。[say: 血肉反噬自身。就像肿瘤一样。你来到这里，是为了撤销我所创造的一切，试图延续束缚这个宇宙中所有生物的幻象，愚蠢地试图消除“邪恶”。我比你更清楚。我会让你看看。]");
            outputText("[pg]那个人影抬起手臂，露出一只丑陋、多肉且长满爪子的手抓着一个卷轴。它尖叫一声，在你的眼前，附近一堆骨头中的几根骨头自动组装起来，变成了另一具骷髅！你正在与一个<b>死灵法师！</b>战斗");
            startCombatMultiple(new Necromancer(),new SkeletonHorde(),null,null,defeatNecro,loseToNecro,defeatNecro,loseToNecro,_loc1_);
         }
         else
         {
            if((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2671) & 0x0100) == 0)
            {
               outputText("[pg]你看到地上有一块黑色的水晶，那是死灵法师用来结束自己生命的匕首残骸。");
               _g = get_inventory();
               itype = get_useables().A_SHARD;
               nextAction = tookCrystal;
               overrideAbandon = runFunc;
               addButton(1,"拿走水晶",function():void
               {
                  _g.takeItem(itype,nextAction,overrideAbandon);
               }).hint("拿走水晶。");
            }
            outputText("[pg]你在附近的一张桌子上看到几张散落的书页。");
            _g1 = this;
            addButton(0,"阅读书页",function():void
            {
               _g1.tablePages();
            }).hint("阅读桌子上的书页。");
         }
      }
      
      public function testResolve(param1:Boolean = false) : void
      {
         var _loc2_:Boolean = false;
         if(Utils.rand(10) + (get_game().shouldraFollower.followerShouldra() ? 1 : 0) + (get_player().hasPerk(PerkLib.Revelation) ? 1 : 0) >= 6)
         {
            _loc2_ = true;
         }
         var _loc3_:Number = Utils.rand(3);
         var _loc4_:Number = _loc3_;
         if(_loc4_ == 0)
         {
            if(_loc2_)
            {
               get_player().createStatusEffect(StatusEffects.Resolve,1,0.9,5,0);
               outputText("你将战胜所有挑战并生存下来！你感到精力充沛，对自己充满信心。你是<b>精力充沛的！</b>");
            }
            else
            {
               get_player().createStatusEffect(StatusEffects.Resolve,2,1.1,10,0);
               outputText("你记得你遭受的所有打击和攻击带来的痛苦。它们把你锻造成了一个更坚强的人，一个更好的人！你需要更多！你是<b>受虐狂！</b>");
            }
         }
         else if(_loc4_ == 1)
         {
            if(_loc2_)
            {
               get_player().createStatusEffect(StatusEffects.Resolve,3,10,20,0);
               outputText("在这个极度恐惧和艰难的时刻，你的头脑变得清晰。完美、不屈的清晰。你有一个目标，而成功只取决于你熟练的技能。那么，成功就会实现。你是<b>专注的！</b>");
            }
            else
            {
               get_player().createStatusEffect(StatusEffects.Resolve,4,10,20,0);
               outputText("你死了吗？你还记得你是谁吗？三颗星星，两个月亮，一匹马。你变得<b>毫无理智！</b>");
            }
         }
         else if(_loc4_ == 2)
         {
            if(_loc2_)
            {
               get_player().createStatusEffect(StatusEffects.Resolve,5,1.15,1.15,0);
               outputText("如此巨大的恐惧只会激励你更好地、更努力地战斗。你将站起来，不惜一切代价从毁灭的巨口中夺取胜利！你变得<b>充满力量！</b>");
            }
            else
            {
               get_player().createStatusEffect(StatusEffects.Resolve,6,0.85,0.85,0);
               outputText("你感到……虚弱。冷漠。在这里取得胜利，是为了什么？邪恶是永恒的，无止境的。你最终会失败。你变得<b>沮丧！</b>");
            }
         }
         else if(_loc4_ == 3)
         {
            if(_loc2_)
            {
               get_player().createStatusEffect(StatusEffects.Resolve,7,0.85,0,0);
               outputText("这是对你体质和意志力的又一次考验。你的生活给了你严酷的教训，但这并没有影响你。你的意志坚如磐石，你的希望不屈不挠！你变得<b>坚定！</b>");
            }
            else
            {
               get_player().createStatusEffect(StatusEffects.Resolve,8,0,0,0);
               outputText("面对这些恐惧，你得出了早该得出的黑暗结论。你无法幸存。风在低语着你的失败，你听从了它的呼唤，颤抖着。你变得<b>恐惧！</b>");
            }
         }
         if(param1)
         {
            doNext(courtierFight);
         }
      }
      
      public function takeBooks() : void
      {
         saveContent.booksTaken = true;
         clearOutput();
         outputText("你不确定它们最终会去哪里，但你确信这些书在书架上腐烂对任何人都没有好处。");
         outputText("[pg]你尽可能轻柔地收集这些大部头，谢天谢地，你成功地将它们放进了你的[inv]中，没有损坏任何一本。当你转身面对这座老化的庄园的其余部分时，重量[if (str < 40) {有点大，但你能应付|并没有[if (str < 70) {太|完全}]困扰你}]。");
         outputText("[pg][b:获得关键物品：旧庄园书籍！]");
         get_player().createKeyItem("Old Manor Books");
         doNext(runFunc);
      }
      
      public function tablePages(param1:int = -1) : void
      {
         var callback1:Function;
         var section1:int;
         var _g1:Manor;
         var callback:Function;
         var section:int;
         var _g:Manor;
         var _loc2_:* = null as IMap;
         if((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2673) & 4) == 0)
         {
            _loc2_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc2_,2673,FlagDict_Impl_.arrayReadInt(_loc2_,2673) + 4);
            outputText("[pg]<b>解锁了新的图鉴条目：庄园日记！</b>[pg]");
         }
         menu();
         _g = this;
         section = 8;
         callback = tablePages;
         addButton(0,"日记 IX",function():void
         {
            _g.journal(section,callback);
         }).hint("日记的第九部分。").disableIf(param1 == 8);
         _g1 = this;
         section1 = 9;
         callback1 = tablePages;
         addButton(1,"日记 X",function():void
         {
            _g1.journal(section1,callback1);
         }).hint("日记的第十部分。").disableIf(param1 == 9);
         addButton(14,"返回",runFunc);
      }
      
      public function switchFloor(param1:int, param2:int, param3:Boolean = true) : void
      {
         floor = param1;
         if(param1 == 1)
         {
            initRoomsF1();
         }
         else if(param1 == 2)
         {
            initRoomsF2();
         }
         else if(param1 == 0)
         {
            initRoomsF0();
            runFunc();
         }
         else if(param1 == 3)
         {
            generateInfinityMaps();
            param2 = findEntrance();
         }
         get_dungeons().set_playerLoc(param2);
         get_dungeons().remakeMaps();
         if(param3)
         {
            runFunc();
         }
      }
      
      public function study() : void
      {
         var _g:Manor;
         clearOutput();
         outputText("你在某种私人书房里。破烂的日记和书籍装饰着许多书柜和书桌。庄园后面有一个通向院子的窗户，让外面的一些光线照亮了里面的蜘蛛网和灰尘。院子里杂草丛生，远处有许多墓碑；这所房子的已故祖先。");
         outputText("[pg]尽管许多书籍和文件已经老化得无法阅读，但书桌上有一套保存得出奇完好的书页，大概是从某本日记上撕下来的。");
         _g = this;
         addButton(0,"书桌",function():void
         {
            _g.deskStudy();
         }).hint("走到书桌前阅读日记。");
         addButton(1,"书籍",readStudyBooks).hint("阅读书架上的一些杂书。");
      }
      
      public function stairsStart() : void
      {
         clearOutput();
         outputText("你正处于主大厅右侧的走廊。虽然它可能原本延伸贯穿了庄园的整个西区，但现在已经塌陷，无法通行。在废墟下，你可以看到一具紧紧抓着一把血迹斑斑的镐的骷髅，这表明这次坍塌并非自然原因造成的。");
         outputText("[pg]尽管有障碍物，你仍然可以走上通往庄园二楼的宽阔楼梯。");
      }
      
      public function stairs3() : void
      {
         clearOutput();
         outputText("你现在位于被遗忘的庄园的二楼。这里和一楼一样破败不堪。走廊的墙壁上装饰着几幅人类的肖像画，有些还掉在地上。你猜测他们是这栋房子的祖先，但很难说；这些画都被破坏了，上面都刻着“以法莲”。大部分房间都进不去，屋顶已经塌陷下来。");
      }
      
      public function stairs2() : void
      {
         clearOutput();
         if((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2671) & 2) != 0 && (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2671) & 4) == 0)
         {
            outputText("当你靠近楼梯时，你感到很奇怪。很难描述，但你感到一种紧紧抓住你的迫在眉睫的厄运感。走廊的墙壁逼近，空间本身扭曲，让你感到眩晕。许多阴影似乎在变大，噩梦般的生物从里面成形，向你逼近。随着你越来越靠近楼梯，这种感觉稳步增长。当你站在边缘时，你感到绝对的恐惧。");
            doNext(courtierEncounter);
            return;
         }
         outputText("你现在位于被遗忘的庄园的二楼。这里和一楼一样破败不堪。走廊的墙壁上装饰着几幅人类的肖像画，有些还掉在地上。你猜测他们是这栋房子的祖先，但很难说；这些画都被破坏了，上面都刻着“以法莲”。大部分房间都进不去，屋顶已经塌陷下来。");
      }
      
      public function stairs1() : void
      {
         var newLoc:int;
         var floor1:int;
         var _g:Manor;
         clearOutput();
         outputText("你现在位于被遗忘的庄园的二楼。这里和一楼一样破败不堪。走廊的墙壁上装饰着几幅人类的肖像画，有些还掉在地上。你猜测他们是这栋房子的祖先，但很难说；这些画都被破坏了，上面都刻着“以法莲”。大部分房间都进不去，屋顶已经塌陷下来。");
         _g = this;
         floor1 = 1;
         newLoc = 2;
         setStairButtons(null,function():void
         {
            _g.switchFloor(floor1,newLoc);
         });
      }
      
      public function stairs0() : void
      {
         var newLoc:int;
         var floor1:int;
         var _g:Manor;
         clearOutput();
         outputText("你正站在通往二楼的楼梯底部。");
         _g = this;
         floor1 = 2;
         newLoc = 7;
         setStairButtons(function():void
         {
            _g.switchFloor(floor1,newLoc);
         });
      }
      
      public function saveToObject() : Object
      {
         return saveContent;
      }
      
      override public function runFunc() : void
      {
         if(floor == 3)
         {
            infinityFunc();
         }
         else
         {
            super.runFunc();
         }
      }
      
      public function roomCourtyard() : void
      {
         clearOutput();
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2671) < 1)
         {
            outputText("你走近庄园那扇腐烂的门，准备用手头上的任何东西把它拆掉。破旧的木头勉强还能挂在铰链上，所以你知道这不需要费多大劲。");
            outputText("[pg]一阵震动让你在前进时短暂地失去了平衡。你继续靠近，警惕着附近任何可能的威胁。当你拉近与门的距离时，震动变得更强烈了，惊飞了附近的乌鸦。你做好了准备。");
            outputText("[pg]突然，门从里面被猛烈地破坏，碎片向你飞来！你及时躲开了，但当你看到破坏门的东西时，你的心沉了下去；一个巨大的，8英尺高的装甲骷髅，挥舞着一把巨大的狼牙棒！");
            outputText("[pg]你摆出战斗姿态。你正在与一个<b>骸骨守卫！</b>战斗");
            startCombat(new BoneGeneral());
         }
         else
         {
            outputText("你站在旧庄园破败的庭院里。植被已经占据了大部分石板路。一个喷泉和一座曾经描绘庄园家族成员的雕像被毁得面目全非。几个帐篷被毁，一些破旧的布料上沾染着血迹，仿佛这里发生过一场大战。");
            outputText("[pg]乌鸦聚集在庭院周围的枯树上，为这片废墟的阴郁气氛增添了最后一笔。");
            setExitButton("离开",exitDungeon,11);
         }
      }
      
      public function returnCamp() : void
      {
         get_game().inDungeon = false;
         get_game().dungeons.usingAlternative = false;
         get_camp().returnToCampUseOneHour();
      }
      
      public function reset() : void
      {
         saveContent.wineDrunk = 0;
         saveContent.lethiciteTaken = 0;
         saveContent.booksTaken = false;
      }
      
      public function readStudyBooks() : void
      {
         clearOutput();
         outputText("你翻阅了书架上几本书的几页，那些书还没有破旧到无法阅读。内容从简单、枯燥的仆人、财务和产品账目，到各种乏味的浪漫故事。很无聊，但一点也不可怕。");
         doNext(runFunc);
      }
      
      public function openStairs() : void
      {
         clearOutput();
         outputText("你小心翼翼地将找到的护身符按入插槽。形状完美匹配，当你完成插入时，你听到了一声令人满意的、低沉的“咔哒”声。片刻之后，墙壁里传出几声机械装置运转的声音。然后，它开始缓慢向下滑动，石头摩擦石头时微微颤抖。护身符从插槽中弹出，你迅速将它捡了回来。");
         outputText("[pg]你凝视着滑动墙壁下降时产生的缝隙，露出一条黑暗的隧道，向下延伸到地下。没有了墙壁的阻挡，跳动声变得更加强烈，让你焦虑地深呼吸。直觉告诉你，<b>在继续前进之前，你应该做好充分的准备。</b>");
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,2671,FlagDict_Impl_.arrayReadInt(_loc1_,2671) | 0x0800);
         get_dungeons().remakeMaps();
         doNext(runFunc);
      }
      
      public function onAscend(param1:Boolean) : void
      {
         reset();
      }
      
      public function northBookshelf() : void
      {
         var letter9:int;
         var _g9:Manor;
         var letter8:int;
         var _g8:Manor;
         var letter7:int;
         var _g7:Manor;
         var letter6:int;
         var _g6:Manor;
         var letter5:int;
         var _g5:Manor;
         var letter4:int;
         var _g4:Manor;
         var letter3:int;
         var _g3:Manor;
         var letter2:int;
         var _g2:Manor;
         var letter1:int;
         var _g1:Manor;
         var letter:int;
         var _g:Manor;
         var _loc1_:* = null as IMap;
         clearOutput();
         if(code == 7 && (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2671) & 0x20) == 0)
         {
            outputText("把最后一本书放回书架后，你听到“咔哒”一声，书架的一小部分伴随着低沉的隆隆声缩进了墙里。向后滑动了几英寸后，它向一侧移开，<b>露出了一条隐藏的通道！</b>[pg]");
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,2671,FlagDict_Impl_.arrayReadInt(_loc1_,2671) | 0x20);
            get_dungeons().remakeMaps();
         }
         if((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2671) & 0x20) == 0 && codespell != "")
         {
            outputText("<b>" + codespell + "</b>[pg]");
         }
         menu();
         outputText("你走近那个奇怪的书架。大多数书都磨损得无法辨认，但你仍然能从书脊上认出其中几本的名字。");
         _g = this;
         letter = 0;
         addButton(0,"升起的曙光",function():void
         {
            _g.keyword(letter);
         }).hint("从书架上取下《升起的曙光》。");
         _g1 = this;
         letter1 = 1;
         addButton(1,"厄肖碎片",function():void
         {
            _g1.keyword(letter1);
         }).hint("从书架上取下《厄肖碎片》。");
         _g2 = this;
         letter2 = 2;
         addButton(2,"加尔德拉之书",function():void
         {
            _g2.keyword(letter2);
         }).hint("从书架上取下《加尔德拉之书》。");
         _g3 = this;
         letter3 = 3;
         addButton(3,"神秘七政",function():void
         {
            _g3.keyword(letter3);
         }).hint("从书架上取下《神秘七政》。");
         _g4 = this;
         letter4 = 4;
         addButton(4,"金之切口",function():void
         {
            _g4.keyword(letter4);
         }).hint("从书架上取下《金之切口》这本书。");
         _g5 = this;
         letter5 = 5;
         addButton(5,"伊波恩之书",function():void
         {
            _g5.keyword(letter5);
         }).hint("从书架上取下《伊波恩之书》。");
         _g6 = this;
         letter6 = 6;
         addButton(6,"赫尔墨斯博物馆",function():void
         {
            _g6.keyword(letter6);
         }).hint("从书架上取下《赫尔墨斯博物馆》。");
         _g7 = this;
         letter7 = 7;
         addButton(7,"普纳科特手稿",function():void
         {
            _g7.keyword(letter7);
         }).hint("从书架上取下《普纳科特手稿》。");
         _g8 = this;
         letter8 = 8;
         addButton(8,"大卡巴拉",function():void
         {
            _g8.keyword(letter8);
         }).hint("从书架上拿走《大卡巴拉》。");
         _g9 = this;
         letter9 = 9;
         addButton(9,"格拉基启示录",function():void
         {
            _g9.keyword(letter9);
         }).hint("从书架上拿走《格拉基启示录》。");
         addButton(14,"返回",runFunc).hint("回到图书馆的中心。");
      }
      
      public function mainHall() : void
      {
         clearOutput();
         outputText("你站在庄园宽敞的主厅里。蜘蛛网覆盖了庄园的大部分角落，霉味和腐木的味道无处不在。这座豪宅似乎是活的，因为它在自身的重量下不断发出嘎吱声。照进这个房间的微弱光线照亮了漂浮的灰尘，进一步证实了这座庄园年久失修的状态。");
         outputText("[pg]房间中央铺着一张破旧的华丽地毯，上面挂着一盏破碎的吊灯，它一定是在多年前坠落到地板上的。大部分窗户都被天鹅绒窗帘遮住，其中大部分已经破损得无法修复。在你的右边，你看到一条通向楼梯的走廊。在你的正前方，有一扇宽大的木门，通向你认为是餐厅的地方。在你的左边，有一个通向图书馆的拱门。");
      }
      
      public function loseToNecro() : void
      {
         clearOutput();
         outputText("你倒下了，被死灵法师的爪牙淹没。你环顾四周，看到成堆的尸体和骷髅，为这个地方提供了一种阴森的装饰。你闭上眼睛，知道自己很快就会成为他们中的一员。");
         outputText("[pg]死灵法师默默地向你走来。突然，它那长着利爪的长手从斗篷下伸出，抓住了你的头。它锋利的手指缓慢而痛苦地刺穿了你的头骨。");
         if(get_player().get_inte() < 80)
         {
            outputText("经过片刻难以置信的痛苦，那身影松开了你的头。它深吸了一口气，显得很失望，手指上滴着血。它用另一只手露出一把长长的、沾满鲜血的弯曲匕首。你睁大了眼睛，看着他改变握姿准备刺向你，但你无能为力。他迅速将匕首刺入你的胸膛。世界再次陷入黑暗。");
            doNext(loseToCourtierSkeletonized);
         }
         else
         {
            outputText("经过片刻难以置信的痛苦，那身影松开了你的头。它低下身子直面你，当你被它那双长满利爪的手抓住头时，你恐惧地发抖。[say: 以法莲，]他用一种诅咒般的语气向你低语。这个词在你的脑海中回荡，越来越响。你试图挣脱他的束缚，绝望地挣扎。回声越来越大，吞噬了你的整个存在。[say: 以法莲。]你不知所措，晕了过去。");
            doNext(loseToCourtierEphraimd);
         }
      }
      
      public function loseToNamelessHorror() : void
      {
         clearOutput();
         outputText("你倒下了，被这可怕的怪物击败。它迅速扭曲空间，站在了你的身旁。");
         outputText("[pg]你盯着它的面柄，恐惧地蜷缩着。那怪物尖叫着指向你，你瞬间被分解了。");
         outputText("<b>在这个地狱里没有希望。一点希望也没有。</b>");
         get_combat().cleanupAfterCombat(null);
         get_game().gameOver();
      }
      
      public function loseToJesterDullahand() : void
      {
         clearOutput();
         outputText("你尖叫着醒来。你立刻注意到自己不再在餐厅里了。你试图观察周围黑暗、微弱灯光的环境，但你发现自己奇怪地难以移动或感觉到自己的身体。");
         outputText("[pg]有什么东西进入了你的视线。一个完全被红色斗篷覆盖的高大实体向你走来。它弯下腰，将一根手指伸向你的额头；那是一根长长的、干瘪的、长着爪子的附肢。");
         outputText("[pg]它嘶嘶作响了一会儿，然后开始在你的额头上雕刻什么东西。当他撕裂你的[skin]时，你痛苦地尖叫着，试图阻止他，但你的身体不听从你的任何命令。");
         outputText("当那个人影停止雕刻时，你几乎被疼痛弄瞎了。然后他念了一些你不认识的咒语。不久之后，你再次感觉到了自己的身体，就好像它之前麻木了一样。你移动了身体，但奇怪的是，你仍然在原地。");
         outputText("[pg]你试图再次移动，变得越来越绝望。当另一个东西跌跌撞撞地进入你的视线，被墙上的火把照亮时，你的心沉了下去，你屏住了呼吸；<b>你自己的身体</b>。你慢慢地、惊恐地低下头，发现自己只是一个没有身体的头颅，被放置在一个仪式圈上。");
         outputText("[pg]你短暂地克服了恐惧，尽最大努力让你的身体攻击那个披着斗篷的人影，但他立刻抓住了你的头，让你所有反抗的念头都消失了。他把爪子深深地刺入你的头骨，当你感觉到自己的记忆和自我被燃烧殆尽，成为可怕魔法的受害者时，你惊恐地睁大了眼睛。");
         outputText("[pg]很快，你就变成了一具躯壳。只有一个念头在你被蹂躏的脑海中闪过：“收集更多的灵魂”。你命令你的身体重新连接到自己身上，并且，在主人的祝福下，离开庄园，进入玛瑞斯，收集尽可能多的灵魂，为了他想要的任何目的。");
         get_game().gameOver();
      }
      
      public function loseToJester() : void
      {
         get_combat().cleanupAfterCombat();
         clearOutput();
         outputText("你倒下了，被");
         if(get_player().get_HP() < 1)
         {
            outputText("你的伤势压垮了。");
         }
         else
         {
            outputText("你体内肆虐的欲望压垮了。");
         }
         outputText("当你呻吟着，抽搐着，看着自己岌岌可危的处境时，那个狡猾的小丑跳到了餐桌上，叮当作响。你低头看了一会儿地面，当你抬起头时，骷髅不见了。你绝望地呼出一口气，四处寻找他，但你很快就发现了他，因为一把锋利的刀刃正抵在你的脖子上。");
         outputText("他以不可思议的力量割开了你的喉咙。鲜血从你嘴里涌出，这是你昏迷前感觉到的最后一件事，你几乎无法理解自己的死亡。");
         doNext(loseToJesterDullahand);
      }
      
      public function loseToGeneral() : void
      {
         get_combat().cleanupAfterCombat();
         clearOutput();
         outputText("你倒下了，虚弱得无法继续战斗。你没想到在旅途的早期就会遇到如此可怕的怪物！你唯一的希望是，打败你的怪物认为你太弱了，构不成威胁。");
         outputText("[pg]它拖着狼牙棒，蹒跚地向你走来。当它走到你面前时，它高高举起武器。它迅速地挥下，用沉重的武器砸碎了你的整个身体。");
         outputText("[pg]<b>你死了。更多的鲜血浸透了土壤，滋养了其中的邪恶。</b>");
         get_game().gameOver();
      }
      
      public function loseToCrystal2() : void
      {
         clearOutput();
         dynStats(DynStat.Lust(999),DynStat.Cor(999));
         outputText("在你昏迷期间，一个高大的身影步履蹒跚地走进房间。它走到你身边跪下，伸出一只长满利爪的肉手，从你因疯狂的快感而留下的水洼中捡起了一样东西。那是一块忘川水晶。");
         outputText("[pg]他发出嘶嘶声，站起身来，将那块小水晶嵌在了祭坛上。");
         outputText("[pg]他离开了。不久之后，一群全副武装的骷髅走进了房间。你睁开恶魔般的双眼，失望地发现它们都没有生殖器供你操弄。当你开始自慰时，它们毫不留情地处决了你，而你已经沉醉在快感中，根本不在乎自己的死活。");
         get_game().gameOver();
      }
      
      public function loseToCrystal() : void
      {
         get_combat().cleanupAfterCombat();
         clearOutput();
         outputText("你倒在地上，发情得无法继续战斗。");
         outputText("[pg]你立刻试图自慰，但忘川水晶再次脉动。当它击中你时，你开始在自发的性高潮中抽搐");
         if(get_player().hasCock())
         {
            outputText("，将浓稠的精液射向空中");
         }
         if(get_player().hasVagina())
         {
            outputText("，将惊人数量的淫液喷在地上");
         }
         outputText("。在你还没来得及好好享受性高潮之前，另一波脉动击中了你，让你在承受着疯狂快感的同时尖叫流口水。");
         outputText("[pg]尽管你的心智被水晶彻底摧残，但不知为何，你渴望更多。不知为何，你感觉自己有十几对丰满的乳房，几根肿胀的肉棒，几十个渴望被填满的小穴。你的脑海中充斥着数百次性交的画面，在每一次中，你都在乞求更多。");
         outputText("[pg]你站起来，因欲望而颤抖，冲向忘川水晶，企图尽可能多地吸收它那堕落的快感。又一波脉动击中了你，你晕了过去。");
         doNext(loseToCrystal2);
      }
      
      public function loseToCourtierSkeletonized() : void
      {
         clearOutput();
         outputText("你再次恢复了知觉，但你感到寒冷、麻木。你试图回忆自己在哪，但你记不起来了。你试图回忆自己在做什么，但你记不起来了。最后，一个决定性的问题击中了你的脑海。你是谁？你记不起来了。");
         outputText("[pg]你陷入了短暂的恐慌，但这并没有持续多久。突然，你所有的思考能力都被剥夺了。只剩下一个念头，吞噬一切，绝对的念头：“保护以法莲”。你接受了它，你腐烂的尸体站了起来，开始在庄园里巡逻。这就是你生命的终结，也是你余下永恒的开始。");
         outputText("[pg]<b>又一条生命在追求荣耀和财富中白白浪费了。</b>");
         get_game().gameOver();
      }
      
      public function loseToCourtierEphraimd() : void
      {
         clearOutput();
         outputText("你在床上醒来，出了一身冷汗。有那么一瞬间，你努力回忆前一天晚上发生的事情，或者关于你自己的任何事情。你站起来走向你的梳妆台，对自己的长相感到好奇。");
         outputText("[pg]你从各个角度端详着自己，但一切似乎都很正常。你感到有些奇怪，但还是摇了摇头，把这种感觉抛在脑后，离开了卧室。毕竟，你不能浪费时间。这座庄园里还有秘密等着你去发现，关于你那被遗忘已久的祖先，以及他是如何找到你的，以法莲。");
         outputText("[pg]以法莲。你就是以法莲。");
         get_game().gameOver();
      }
      
      public function loseToCourtier() : void
      {
         get_combat().cleanupAfterCombat();
         clearOutput();
         outputText("你倒下了，被");
         if(get_player().get_HP() < 1)
         {
            outputText("你的伤势压垮了。");
         }
         else
         {
            outputText("你体内肆虐的欲望压垮了。");
         }
         outputText("事实证明，亡灵法师对你来说是一个太大的挑战，你任由他摆布。它开始施放一个长长的咒语，尽管没有嘴唇或舌头，但不知何故却能念出可怕的咒语。你无法动弹，咒语直接击中了你，你失去了知觉。");
         outputText("[pg]你在一个宽敞、黑暗的房间冰冷的石头地面上醒来，头晕目眩，被绑着。一个完全被红色斗篷覆盖的高大生物在桌子间缓慢地穿梭，翻阅书页，做笔记。它转向你，它的脸只是一片漆黑的虚无，完全被它的斗篷覆盖。你感到一阵寒意顺着脊背流下。");
         outputText("[pg]它向你走来，沉默不语。突然，它长着爪子的手从斗篷下伸出，抓住了你的头。它锋利的手指缓慢而痛苦地穿透了你的头骨。");
         if(get_player().get_inte() < 80)
         {
            outputText("经过片刻难以置信的痛苦，那身影松开了你的头。它深吸了一口气，显得很失望，手指上滴着血。它用另一只手露出一把长长的、沾满鲜血的弯曲匕首。你睁大了眼睛，看着他改变握姿准备刺向你，但你无能为力。他迅速将匕首刺入你的胸膛。世界再次陷入黑暗。");
            doNext(loseToCourtierSkeletonized);
         }
         else
         {
            outputText("经过片刻难以置信的痛苦，那身影松开了你的头。它低下身子直面你，当你被它那双长满利爪的手抓住头时，你恐惧地发抖。[say: 以法莲，]他用一种诅咒般的语气向你低语。这个词在你的脑海中回荡，越来越响。你试图挣脱他的束缚，绝望地挣扎。回声越来越大，吞噬了你的整个存在。[say: 以法莲。]你不知所措，晕了过去。");
            doNext(loseToCourtierEphraimd);
         }
      }
      
      public function loseToCourt() : void
      {
         clearOutput();
         outputText("你因受伤而向后踉跄。你深吸一口气，试图保持平衡，但你的尝试被一把沉重的战锤粉碎了，它砸碎了你的胸膛，将你击飞到墙上。");
         outputText("[pg]你咳出鲜血，剧烈的疼痛让你动弹不得。然而，你几乎没有时间感受痛苦，因为小丑向你扑了过来。它险些失手，划破了你的皮肤，你试图反击。尽管破绽很明显，你还是打偏了；那个巫师在你攻击时对你施了妖术。");
         outputText("[pg]你脚下一滑摔倒了。你转过身面向天花板，但你看到的只是一个戴着小丑帽的骷髅那阴森的笑容。他将匕首刺入你的胸膛，刺穿了你的心脏。");
         outputText("[pg]片刻之后，你的生命离你而去。你最后看到的是一个披着斗篷的高大人形生物，正发出响亮的嘶嘶声，缓慢地向你走来。");
         outputText("[pg]<b>更多的尘土。更多的灰烬。更多的失望。</b>");
         get_game().gameOver();
         get_combat().cleanupAfterCombat();
      }
      
      public function load(param1:int, param2:*) : void
      {
         Utils.extend(saveContent,param2);
      }
      
      public function librarySecret() : void
      {
         var _g1:Manor;
         var newLoc:int;
         var floor1:int;
         var _g:Manor;
         clearOutput();
         outputText("你现在在图书馆的密室里。它是由坚固的岩石建成的，与庄园其他部分的木质装饰形成鲜明对比。房间的四面墙上装饰着雕刻，描绘了未知的触手生物在教授人类魔法艺术。你听到脚下传来低沉、缓慢的跳动声。");
         if((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2671) & 0x0800) != 0)
         {
            outputText("[pg]你看到了房间尽头通往地下室的通道。");
         }
         else
         {
            outputText("[pg]在北面的墙上，有一个圆形的、手掌大小的插槽。也许是个锁？");
         }
         outputText("[pg]你还注意到地板上散落着几页纸。");
         if((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2671) & 0x0800) != 0)
         {
            _g = this;
            floor1 = 0;
            newLoc = 35;
            setStairButtons(null,function():void
            {
               _g.switchFloor(floor1,newLoc);
            });
         }
         _g1 = this;
         addButton(0,"纸页",function():void
         {
            _g1.floorPages();
         }).hint("检查地板上的纸页。");
         addNextButton("插入护符",openStairs).hideIf(!get_player().hasKeyItem("Family Talisman") || (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2671) & 0x0800) != 0).hint("将你找到的护符插入到插槽中。");
      }
      
      public function libraryRoom() : void
      {
         clearOutput();
         outputText("你身处一个藏书相当丰富的图书馆。书架覆盖了房间的四面墙，它们高得让你相形见绌。");
         outputText("[pg]你注意到北面的书架奇特地嵌在墙里。");
         addButton(0,"北面书架",northBookshelf).hint("仔细看看北面的书架。");
         addButton(1,"拿书",takeBooks).hint("你也许能找到这些书的用处。").hideIf(saveContent.booksTaken);
      }
      
      public function lethiciteTunnel2() : void
      {
         var monster1:Monster;
         var _g:Manor;
         clearOutput();
         outputText("你进入了隧道尽头的一个房间。");
         if((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2671) & 0x0200) == 0 && (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2671) & 0x80) == 0)
         {
            outputText("[pg]房间的中央矗立着一个祭坛，上面装饰着一块巨大的、发光的忘川水晶。仔细观察，它似乎是由较小的水晶拼接而成的。");
            _g = this;
            monster1 = new LethiciteCrystal();
            addButton(0,"摧毁",function():void
            {
               _g.startCombatImmediate(monster1);
            }).hint("尝试摧毁水晶。这块忘川水晶可能在为某种法术提供能量，但用常规手段几乎不可能摧毁原始的忘川水晶。");
         }
         else
         {
            outputText("[pg]房间的中央矗立着一个祭坛，现在上面覆盖着失去能量的忘川水晶碎片。");
            if((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2671) & 0x80) != 0 && (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2671) & 0x0200) == 0)
            {
               outputText("也许它和你击败的死灵法师有什么联系？");
            }
            get_output().flush();
         }
      }
      
      public function lethiciteTunnel1() : void
      {
         clearOutput();
         if((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2671) & 0x0200) == 0)
         {
            outputText("在这条相邻隧道的尽头，你看到了一丝微弱的粉红色光芒。你感到温暖，就像你刚离开英格纳姆时一样。");
         }
         else
         {
            outputText("随着水晶被摧毁，这条隧道现在和地下部分的其他地方一样黑暗。");
         }
      }
      
      public function keyword(param1:int = 0) : void
      {
         clearOutput();
         switch(param1)
         {
            case 0:
               outputText("你打开了《升起的曙光》。大部分书页已经破损得无法阅读，但看起来像是一本关于炼金术特性的论文。" + (get_player().hasPerk(PerkLib.HistoryAlchemist) ? " 书中明显的错误多得让你直皱眉头。" : " 你几乎看不懂。") + " 你耸了耸肩，把书放了回去。");
               if(code == 4)
               {
                  code += 1;
                  codespell += " A";
                  outputText("[pg]当你再次将书推入书槽时，<b>你听到齿轮移动和咬合的声音。</b>");
               }
               else
               {
                  code = 0;
                  if(codespell.length > 0)
                  {
                     outputText("[pg]当你再次将书推入书槽时，<b>你听到齿轮快速旋转的声音，随后发出一声锁定的咔哒声。</b>");
                  }
                  codespell = "";
               }
               break;
            case 1:
               outputText("你打开了《厄肖碎片》。这是一本收集了某个古老玛瑞斯文明各种碎片的合集。从你能理解的内容来看，他们在几千年前就消失得无影无踪，留下的线索少之又少，以至于许多历史学家根本不相信他们曾经存在过。");
               if(code == 0)
               {
                  code += 1;
                  codespell += "E";
                  outputText("[pg]当你再次将书推入书槽时，<b>你听到齿轮移动和咬合的声音。</b>");
               }
               else
               {
                  code = 0;
                  if(codespell.length > 0)
                  {
                     outputText("[pg]当你再次将书推入书槽时，<b>你听到齿轮快速旋转的声音，随后发出一声锁定的咔哒声。</b>");
                  }
                  codespell = "";
               }
               break;
            case 2:
               outputText("你打开了《加尔布拉博克》。这是一份相当详细的法术和咒语清单，尽管大部分章节已经破损得无法正常阅读。");
               if(!get_player().hasStatusEffect(StatusEffects.KnowsWhitefire) && get_player().get_inte() > 60)
               {
                  outputText("不过，有一个章节确实包含有用的可读信息。你仔细阅读了该部分的内容，并异常轻松地吸收了其中的知识。<b>学会法术：白火</b>！");
                  get_player().createStatusEffect(StatusEffects.KnowsWhitefire,0,0,0,0);
               }
               if(codespell.length > 0)
               {
                  outputText("[pg]当你再次将书推入书槽时，<b>你听到齿轮快速旋转的声音，随后发出一声锁定的咔哒声。</b>");
               }
               codespell = "";
               code = 0;
               break;
            case 3:
               outputText("你打开了《神秘七政》。它保存得异常完好，包含了关于魔法艺术和法术编织的几项指导和论文。");
               if(get_player().get_inte() >= 100 && !get_player().hasPerk(PerkLib.MysticLearnings))
               {
                  outputText("尽管书中包含的教义极其复杂，但你超凡的智力让你能够阅读并理解这一切。你获得的知识非常精妙！");
                  outputText("[pg]<b>获得特质：神秘学识！</b>");
                  get_player().createPerk(PerkLib.MysticLearnings,0,0,0,0);
               }
               else if(get_player().get_inte() < 100)
               {
                  outputText("尽管你可以从中收集信息，但内容对你来说太复杂了，无法理解和利用。");
               }
               else
               {
                  outputText("你已经获得了这本书能给你的所有知识。");
               }
               if(code == 2)
               {
                  code += 1;
                  codespell += " H";
                  outputText("[pg]当你再次将书推入书槽时，<b>你听到齿轮移动和咬合的声音。</b>");
               }
               else
               {
                  if(codespell.length > 0)
                  {
                     outputText("[pg]当你再次将书推入书槽时，<b>你听到齿轮快速旋转的声音，随后发出一声锁定的咔哒声。</b>");
                  }
                  codespell = "";
                  code = 0;
               }
               break;
            case 4:
               outputText("你打开了《金之切口》。这是一篇关于魔法仪式的长篇论文，旨在召唤恶魔来帮助施法者将任何材料转化为黄金。考虑到玛瑞斯的货币，这很可能是假的，而且也没用。");
               if(code == 5)
               {
                  code += 1;
                  codespell += " I";
                  outputText("[pg]当你再次将书推入书槽时，<b>你听到齿轮移动和咬合的声音。</b>");
               }
               else
               {
                  if(codespell.length > 0)
                  {
                     outputText("[pg]当你再次将书推入书槽时，<b>你听到齿轮快速旋转的声音，随后发出一声锁定的咔哒声。</b>");
                  }
                  codespell = "";
                  code = 0;
               }
               break;
            case 5:
               outputText("你翻开《伊波恩之书》。这是一份详尽的长篇记录，讲述了作者前往几个不同世界的航行。他声称利用了遍布玛瑞斯各处的隐藏传送门。书中描绘的大多数世界与这里非常相似，而另一些则是无法居住的荒原，上面居住着畸形的生物，仅仅看一眼就会考验人的理智。这绝对是一本有趣的读物，但缺乏证据让你保持怀疑。");
               if(codespell.length > 0)
               {
                  outputText("[pg]当你再次将书推入书槽时，<b>你听到齿轮快速旋转的声音，随后发出一声锁定的咔哒声。</b>");
               }
               code = 0;
               codespell = "";
               break;
            case 6:
               outputText("你翻开《赫尔墨斯博物馆》。这是一部庞大的教义汇编，内容涉及包括人类在内的几种玛瑞斯物种的解剖学和生物学，以及一些推测性的炼金术仪式，旨在让受试者死亡几分钟后短暂重启其次要身体机能。作者提供了证明其成功的有力证据，尽管她只将其应用于小型哺乳动物。");
               if(code == 6)
               {
                  code += 1;
                  codespell += " M";
                  outputText("[pg]当你再次将书推入书槽时，<b>你听到齿轮移动和咬合的声音。</b>");
               }
               else
               {
                  if(codespell.length > 0)
                  {
                     outputText("[pg]当你再次将书推入书槽时，<b>你听到齿轮快速旋转的声音，随后发出一声锁定的咔哒声。</b>");
                  }
                  codespell = "";
                  code = 0;
               }
               break;
            case 7:
               outputText("你翻开《普纳科特手稿》。这主要是一些难以辨认的胡言乱语；大部分章节都是用不同的、未知的语言写成的。你能读懂的那些章节充满了关于自然和物理的琐碎、基础的知识，比如关于重力、昼夜和季节循环以及数学的基本描述。");
               if(code == 1)
               {
                  code += 1;
                  codespell += " P";
                  outputText("[pg]当你再次将书推入书槽时，<b>你听到齿轮移动和咬合的声音。</b>");
               }
               else
               {
                  if(codespell.length > 0)
                  {
                     outputText("[pg]当你再次将书推入书槽时，<b>你听到齿轮快速旋转的声音，随后发出一声锁定的咔哒声。</b>");
                  }
                  codespell = "";
                  code = 0;
               }
               break;
            case 8:
               outputText("你翻开《大卡巴拉》。这是一本关于玛瑞斯存在的不同邪教的记录汇编，以及他们的一些独特的仪式和信仰。你认不出其中的任何一个，这意味着这本书要么充满了谎言，要么太古老而无关紧要。");
               if(codespell.length > 0)
               {
                  outputText("[pg]当你再次将书推入书槽时，<b>你听到齿轮快速旋转的声音，随后发出一声锁定的咔哒声。</b>");
               }
               code = 0;
               codespell = "";
               break;
            case 9:
               outputText("你翻开《格拉基启示录》。这是一本杂乱无章的奥秘知识汇编，据说所有这些知识都是由一个“用无言的吟唱压倒现实”的异次元存在传授给一位学者的。随着书接近尾声，它变得越来越难以理解，尽管在书页中包含的许多长篇大论中，最终的毁灭和诅咒的主题始终如一。");
               if(code == 3)
               {
                  code += 1;
                  codespell += " R";
                  outputText("[pg]当你再次将书推入书槽时，<b>你听到齿轮移动和咬合的声音。</b>");
                  break;
               }
               if(codespell.length > 0)
               {
                  outputText("[pg]当你再次将书推入书槽时，<b>你听到齿轮快速旋转的声音，随后发出一声锁定的咔哒声。</b>");
               }
               codespell = "";
               code = 0;
         }
         doNext(northBookshelf);
      }
      
      public function journal(param1:int = 0, param2:Function = undefined) : void
      {
         clearOutput();
         switch(param1)
         {
            case 0:
               get_game().camp.codex.headerSub("<b>I</b>");
               outputText("经过一周漫长而艰苦的旅行，我抵达了庄园。尽管它已经破败不堪，而且肯定经受了时间和风雨的摧残，但它仍然骄傲地矗立着，俯瞰着下方巨大的森林山谷。我的身体渴望休息，但在进行适当的修复之前，在确定我已故祖先的遗骸和死因之前，我几乎无法休息。");
               outputText("[pg]我通常不会写这么沉重的话题，但考虑到我和我的血统周围的特殊情况，我发现自己别无选择。几周前，我收到了一封信，上面写着最令人痛心的消息；我的一位被遗忘已久的家庭成员被发现死亡，大概是他自己的抑郁和疯狂的受害者，在遗嘱中，他指名道姓地任命我接管他的祖居。可悲的是，这种精神错乱的案例在我远古的祖先中似乎很常见，而且，正如他在遗嘱中所指定的那样，恢复我受损家族名誉的责任落在了我的肩上。我很快出发，以充分了解摆在我面前的情况，并弄清楚为什么我被选中接管这所房子。");
               outputText("[pg]庄园仍然适合居住，尽管我和我的大多数随从都不愿意与许多老鼠和乌鸦共用一个房间，它们现在利用废弃的房间和黑暗的角落作为避难所。然而，他们的工作得到了丰厚的报酬，并且非常清楚这项任务中可能遇到的困难。维修工作将于明天黎明开始。我们不要拖延这项工作，因为还有很多工作要做。");
               break;
            case 1:
               get_game().camp.codex.headerSub("<b>II</b>");
               outputText("几天的辛勤工作结出了硕果。主室、厨房和一些仆人的住处已经修复并足够干净，为我们提供了更高的生活水平。大多数老鼠已经逃离，瘟疫的风险几乎消失了。我可能有一段时间不会再写了，因为除了继续我们艰巨但直截了当的任务之外，无事可做。");
               break;
            case 2:
               get_game().camp.codex.headerSub("<b>III</b>");
               outputText("庄园的大部分已经修复，但我们的工作似乎远未结束。图书馆的重建揭示了详细描述庄园下方异常复杂的隧道网络的书籍和地图。尽管我搜查了房子每个角落的文件，但仍然缺乏我祖先死亡的适当原因，我不得不继续在这些隧道中搜寻。");
               outputText("[pg]我被反复出现的噩梦所困扰。在梦中，我说着未知的语言。我走在被肉状生长物覆盖的荒凉景观上，这些生长物的形状不断变移，背叛了任何关于空间和形式的常规知识。我遇到了奇怪的外星生物，它们传授给我超出任何人类掌握的知识。它们的脸，如果可以称之为脸的话，形状就像一朵扭曲的变态花，肉质的花瓣绽放，露出中心一个长满触手的核心，其圆周上覆盖着漆黑的球体，我假设那是眼睛。它们用许多触手滑行，靠近我，并在我的脑海中说出异端邪说，召唤我按照它们的意愿行事。它们叫我以法莲，我堕落祖先的名字。我全明白了。最终，我看着自己的双手，现在变成了带肋的触手，并意识到我也是这些可怕的生物之一。我在冷汗中醒来。");
               outputText("[pg]我的梦让我非常痛苦，但我必须向其他船员隐瞒。他们已经对增加工作的前景感到不安，对目前的薪水不满意。这必须尽快结束，否则我担心我很快就会发现自己遭到我自己的助手的袭击。");
               break;
            case 3:
               get_game().camp.codex.headerSub("<b>IV</b>");
               outputText("我的脑海深处有一种持续不断的啃噬感。我感到有强烈的冲动去搜查图书馆，梳理它众多的卷宗和书籍，收集人类所能理解的尽可能多的知识——也许甚至超越人类的理解。尽管我对大多数书中描述的奥秘主题缺乏了解，但我发现自己毫不费力地理解了这一切。我对自己的知识和对神秘学的渴望感到震惊，我开始理解为什么我堕落的祖先会以那样的方式结束他的生命。这些页面中描述的卑鄙仪式——灵魂的收割和死灵法术——需要一种极其肆无忌惮的头脑，如果他参与了任何一种，我可以原谅他受损的理智和对自己生命的不关心。");
               outputText("[pg]隧道的挖掘工作进展得比我们预期的要长得多。上周，工人们罢工了。我的财务状况无法满足他们不断增加的需求，所以我决定把钱花在别处。我雇佣了一名侍卫，一位名叫伊芙琳的才华横溢的年轻女子，来保护我并在乌合之众中维持秩序和纪律。她毫无疑问地完成她的工作，并且毫不犹豫地打断几根骨头来向工人们传达信息。");
               outputText("[pg]他们继续工作，要求的报酬少得多。");
               break;
            case 4:
               get_game().camp.codex.headerSub("<b>V</b>");
               outputText("工人们在隧道的最深处发现了一个最令人不安的房间。一个巨大的房间，里面装满了生锈的铁笼、仍然可以使用的炼金台和令人毛骨悚然的召唤阵、人类器官和保存在装满未知酸性液体的桶中的老鼠。死灵法师的梦想。在充分理解了这一可怕的发现后，其中一个更叛逆的工人煽动其他乌合之众摧毁并放弃庄园。");
               outputText("[pg]被我完全揭开围绕我祖先的谜团的渴望所占据，我在深夜让伊芙琳去对付他。无法用纯粹的暴力威胁来控制这个男人，她发现自己陷入了战斗。当然，她赢了，但在过程中杀死了那个可怜的家伙。她很痛苦——更多的是因为失去工作的前景，而不是她的谋杀——但我确定她没有什么可担心的。战斗发生在远离窥探的眼睛的地方，所以把他的缺席解释为简单的逃跑没有问题。此外，他新鲜尸体的景象给了我邪恶的灵感。");
               break;
            case 5:
               get_game().camp.codex.headerSub("<b>VI</b>");
               outputText("我把尸体拖过庄园下方漆黑的大厅，把它放在血迹斑斑的地板上刻着的一个召唤阵上。在午夜时分，我运用我新获得的知识，念诵着我在亵渎的阅读和令人头脑发胀的梦中教给我的咒语和妖术。我既兴奋又无法抑制地恐惧地笑着，因为尸体像被一个未知的、隐形的木偶师拉着一样抬起自己，充满了能量和对生命的嘲弄。然而，我的成功是短暂的，因为复活的尸体在仪式结束后仅仅几分钟就恢复了自然状态。无论从哪个角度来看，这都是部分的成功，只是一个微不足道的担忧；庄园内外不乏潜在的受试者。伊芙琳一如既往地准备好并愿意执行我的意愿，她鲁莽的青春掩盖了她的道德和判断力。");
               break;
            case 6:
               get_game().camp.codex.headerSub("<b>VII</b>");
               outputText("接连的失败消磨着我的意志，因为随着每一次尝试，向其他平民解释又一个仆人突然失踪变得越来越困难。伊芙琳已经杀死了五名工人，现在她也不愿相信我为了命令他们去死而编造的越来越离谱的借口。别无他法，我决定邀请一群来自山里的法师，分享我的一些奥术知识，并希望能发现关于不死之谜及更深层次奥秘的缺失拼图。");
               outputText("[pg]他们在深夜隐秘地抵达，深知他们的出现会让那些烦人多嘴的仆人感到多么不安。几名法师，一群由十几个女性组成的“护卫”，由一个穿着重甲的巨汉和一个极其烦人的小丑守卫着，把地下隧道当成了他们的家。我尽我所能地布置了那里，他们被获得更多力量的承诺所吸引，勉强接受了他们的住处。");
               outputText("[pg]我们分享了几卷奥术知识。他们告诉我一种他们称之为“魂石”的物质，那是生物灵魂的结晶，其力量可以为任何神秘仪式或法术提供能量。我知道这就是持续复活的关键。他们收集它的方式充其量只能说是令人作呕的，但是，既然知道了它的存在，我相信我能创造出一种替代方法。在掌握了我能从这些堕落的客人那里收集到的所有知识后，我在他们熟睡时谋杀了他们。谋杀的工具是一把简单的匕首，上面附有我自己创造的一种独特而强大的咒语。他们的灵魂被困在其中，我利用它的力量让他们在我的指挥下复活。");
               outputText("[pg]这个过程取得了压倒性的成功，给我留下了一群古老的不死仆从，他们都极其擅长保护我。现在，为了在奥术、神秘学以及渗透在我们视线之外的无形维度中的未知力量的本质上取得进一步的发现，我需要一种特别有效的方法来收集灵魂，无论用什么方法。我自然想到了伊芙琳。她技艺独特，惊艳动人，又天真得令人震惊，是我继续执行计划的完美人选。");
               break;
            case 7:
               get_game().camp.codex.headerSub("<b>VIII</b>");
               outputText("我把这个无辜的女孩引诱到隧道里，请求她在一个特别复杂的问题上帮忙。她犹豫着跟了过来。当看到来访代表团那些复活的、腐烂的尸体时，她拔出军刀向我扑来，愤怒和恐惧让她尖叫哭泣。当然，对她来说已经太迟了。法师对她施了咒，注定她对我的攻击会落空。那个粗汉用他那沉重得惊人的狼牙棒把她击倒，在她还没来得及恢复平衡之前，那个身手诡异的小丑就把我那把被诅咒的匕首架在了她的脖子上，迅速地砍下了她的头。");
               outputText("[pg]利用她自己的灵魂，我把她带回了活人的世界，并特别注意尽可能地保留她那匀称的容貌。我派她和我其余的仆从去攻击剩下的工人。他们毫不犹豫地照做了。");
               outputText("[pg]利用他们的灵魂，我用我收集精华的咒语给一把镰刀附了魔，并在伊芙琳身上施了一个法术，让她能够“吸干”任何胆敢向她求爱的人。最后，我杀死了我的一匹马并将其复活，作为给她的最后一件礼物，我用于不可告人目的的工具。我派她代表我永远地在玛瑞斯的四个角落驰骋，收集尽可能多的灵魂，为我最后的仪式、最后的发现——揭开掩盖这个世界真相的面纱——提供燃料。");
               break;
            case 8:
               get_game().camp.codex.headerSub("<b>IX</b>");
               outputText("经过几年成功的收割，我已经失去了很多对伊芙琳施加力量的能力。她一定恢复了部分以前的心智，这是她那独特而复杂的复活过程的结果。进展已经放缓，时间不仅摧残着庄园，也摧残着我自己。我必须不惜一切代价熬过这段萎靡不振的时期。也许我可以用自己的灵魂与来自外层领域的存在签订契约，获得我需要的力量。我看到了深渊，那终极的启示，离我的掌控只有几英寸之遥。我现在不能停下来。");
               outputText("[pg]在我的梦里，我看到了那些折磨了我多年的生物。我在他们中间行走，仿佛我已经认识他们好几辈子了。每一个都无名无姓，却拥有无数的头衔。他们是永恒的，将他们的存在蔓延到整个时空，并孕育了宇宙中的所有其他生物。我是他们中的一员，他们的一部分，以法莲。是时候让血肉结合，再次变得完整了。迟早，一切都会成为以法莲。我的梦，这个世界，还有我自己。");
               break;
            case 9:
               get_game().camp.codex.headerSub("<b>X</b>");
               outputText("天体领域已经对齐。在这个星辰同步的时刻，我们的世界与彼岸那令人发狂的无限之间的壁垒处于最薄弱的状态，乞求着彻底的湮灭。");
               outputText("[pg]很快，这个世界就会看到面纱背后隐藏着什么。无论他们是反抗还是追随这种觉醒的信息都无关紧要，因为我们的命运在我们踏上这个世界之前就已经注定了。");
         }
         param2(param1);
      }
      
      public function isInChamber() : Boolean
      {
         if(get_dungeons().get_playerLoc() == 30)
         {
            return floor == 0;
         }
         return false;
      }
      
      public function initRoomsF2() : void
      {
         dungeonRooms.h[7] = stairs1;
         dungeonRooms.h[4] = stairs2;
         dungeonRooms.h[1] = stairs3;
         dungeonRooms.h[2] = bedroom;
         dungeonRooms.h[3] = study;
      }
      
      public function initRoomsF1() : void
      {
         dungeonRooms.h[7] = roomCourtyard;
         dungeonRooms.h[4] = mainHall;
         dungeonRooms.h[1] = diningRoom;
         dungeonRooms.h[3] = libraryRoom;
         dungeonRooms.h[5] = stairsStart;
         dungeonRooms.h[0] = librarySecret;
         dungeonRooms.h[2] = stairs0;
      }
      
      public function initRoomsF0() : void
      {
         dungeonRooms.h[35] = tunnels1;
         dungeonRooms.h[34] = tunnels2;
         dungeonRooms.h[33] = tunnels3;
         dungeonRooms.h[32] = tunnels4;
         dungeonRooms.h[31] = tunnels5;
         dungeonRooms.h[30] = theChamber;
         dungeonRooms.h[28] = lethiciteTunnel1;
         dungeonRooms.h[22] = lethiciteTunnel2;
      }
      
      override public function initRooms() : void
      {
         dungeonRooms = new IntMap();
         initRoomsF1();
      }
      
      public function infinity5() : void
      {
         clearOutput();
         infinityLevel = 4;
         infinityFunc = infinity5;
         get_dungeons().remakeMaps();
         get_dungeons().set_playerLoc(findEntrance());
         outputText("你正处于某种枢纽之中；这是这个巨大的宇宙异常的源头。它的中心有一个生物。它体型庞大，呈圆锥形，布满了漆黑的眼睛、附肢和触手。光线本身似乎都在它周围弯曲。你别无选择，只能向前靠近它。");
         outputText("[pg]那个生物转过身来面对你，尽管它似乎没有脸。几条舌头从它最顶端的肉茎中滑出，品尝着宇宙的晶格来探测你。在注意到你之后，它发出可怕的尖叫声，将你击倒并扭曲了你的心智。");
         outputText("[pg]你不知道你在哪里，或者那是什么，但你必须保护自己！你正在与一个<b>无名恐怖！</b>战斗");
         startCombat(new NamelessHorror());
      }
      
      public function infinity4() : void
      {
         var _loc1_:* = null as IMap;
         clearOutput();
         outputText("你不过是更伟大存在的一部分。");
         outputText("[pg][say: 假以时日，我们都会回归于它。然而，你现在就要这么做。向着你真正的目标飞升吧。]");
         outputText("[pg]你感觉自己仿佛正在接近一个无法回头的临界点。尽管你的发现有着可怕的暗示，但你还是忍不住想起了营地那种无知而令人欣慰的安全感。");
         infinityLevel = 3;
         infinityFunc = infinity4;
         get_dungeons().remakeMaps();
         get_dungeons().set_playerLoc(findEntrance());
         if((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2671) & 0x0400) == 0)
         {
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,2671,FlagDict_Impl_.arrayReadInt(_loc1_,2671) | 0x0400);
         }
         get_dungeons().setDungeonButtons(infinity5,infinity2,infinity2,infinity1);
         addButton(0,"营地",returnCamp).hint("返回营地以更好地准备自己。<b>你可以在晚上的营地行动菜单中返回。</b>");
      }
      
      public function infinity3() : void
      {
         clearOutput();
         outputText("你是什么东西？");
         outputText("[pg][say: 回头看看你自己。看看无限。]");
         infinityLevel = 2;
         infinityFunc = infinity3;
         get_dungeons().remakeMaps();
         get_dungeons().set_playerLoc(findEntrance());
         get_dungeons().setDungeonButtons(infinity2,infinity1,infinity2,infinity4);
      }
      
      public function infinity2() : void
      {
         clearOutput();
         outputText("你在这里待了多久了？");
         outputText("[pg][saystart]当面对这个现实时，我曾试图忽视它，逃避它。这种挣扎的徒劳是可笑的。");
         outputText("[pg]追逐落日，用幸福的无知对抗你的本性。他们是太阳。我们按照他们的意志行动，按照他们的存在生活。假以时日，他们会吞噬我们所有人。[sayend]");
         infinityLevel = 1;
         infinityFunc = infinity2;
         get_dungeons().remakeMaps();
         get_dungeons().set_playerLoc(findEntrance());
         get_dungeons().setDungeonButtons(infinity1,infinity2,infinity3,infinity1);
      }
      
      public function infinity1() : void
      {
         clearOutput();
         outputText("你身处一片黑暗的虚无之中。你看到周围到处都是星星和星尘，不断地聚集和消散。就是这里了。无限的边缘。");
         outputText("[pg][say: 深渊欢迎你，就像它曾经欢迎我一样。降临吧。接受你在宇宙中的角色。]");
         infinityLevel = 0;
         get_dungeons().remakeMaps();
         get_dungeons().setDungeonButtons(infinity1,infinity2,infinity1,infinity1);
      }
      
      override public function get_dungeonMap() : Array
      {
         var _loc1_:int = 1;
         if((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2671) & 0x20) != 0)
         {
            _loc1_ = (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2671) & 0x0800) != 0 ? 4 : 0;
         }
         switch(floor)
         {
            case 0:
               return [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,0,1,0,0,0,0,0,3];
            case 1:
               return [_loc1_,0,3,0,0,0,1,0,1];
            case 2:
               return [1,0,0,0,0,1,1,4,1];
            case 3:
               return infinityMaps[infinityLevel].dungeonMap;
            default:
               return [_loc1_,0,3,0,0,0,1,0,1];
         }
      }
      
      public function get_debugName() : String
      {
         return "Manor";
      }
      
      public function get_debugHint() : String
      {
         return "";
      }
      
      override public function get_connectivity() : Array
      {
         switch(floor)
         {
            case 0:
               return [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,DungeonRoomConst_Impl_.fromStr("S"),0,0,0,0,0,DungeonRoomConst_Impl_.fromStr("NS"),0,DungeonRoomConst_Impl_.fromStr("WE"),DungeonRoomConst_Impl_.fromStr("WE"),DungeonRoomConst_Impl_.fromStr("WE"),DungeonRoomConst_Impl_.fromStr("WE"),DungeonRoomConst_Impl_.fromStr("WEN"),DungeonRoomConst_Impl_.fromStr("W")];
            case 1:
               return [DungeonRoomConst_Impl_.fromStr("S"),DungeonRoomConst_Impl_.fromStr("S"),DungeonRoomConst_Impl_.fromStr("S"),DungeonRoomConst_Impl_.fromStr("EN"),DungeonRoomConst_Impl_.fromStr("NSEW"),DungeonRoomConst_Impl_.fromStr("WN"),0,DungeonRoomConst_Impl_.fromStr("N"),0];
            case 2:
               return [0,DungeonRoomConst_Impl_.fromStr("SE"),DungeonRoomConst_Impl_.fromStr("W"),DungeonRoomConst_Impl_.fromStr("E"),DungeonRoomConst_Impl_.fromStr("NWS"),0,0,DungeonRoomConst_Impl_.fromStr("N"),0];
            case 3:
               return infinityMaps[infinityLevel].connectivity;
            default:
               return [DungeonRoomConst_Impl_.fromStr("S"),DungeonRoomConst_Impl_.fromStr("S"),DungeonRoomConst_Impl_.fromStr("S"),DungeonRoomConst_Impl_.fromStr("EN"),DungeonRoomConst_Impl_.fromStr("NSEW"),DungeonRoomConst_Impl_.fromStr("WN"),0,DungeonRoomConst_Impl_.fromStr("N"),0];
         }
      }
      
      public function generateInfinityMaps() : void
      {
         var _loc1_:* = RandomDungeon.generateRandomMaze(10,10,3,false);
         infinityMaps.push(_loc1_);
         _loc1_ = RandomDungeon.generateRandomMaze(10,10,3,false);
         infinityMaps.push(_loc1_);
         _loc1_ = RandomDungeon.generateRandomMaze(10,10,3,false);
         infinityMaps.push(_loc1_);
         _loc1_ = RandomDungeon.generateRandomMaze(10,10,3,false);
         infinityMaps.push(_loc1_);
         _loc1_ = RandomDungeon.generateRandomMaze(10,10,3,false);
         infinityMaps.push(_loc1_);
      }
      
      public function floorPages(param1:int = -1) : void
      {
         var callback2:Function;
         var section2:int;
         var _g2:Manor;
         var callback1:Function;
         var section1:int;
         var _g1:Manor;
         var callback:Function;
         var section:int;
         var _g:Manor;
         var _loc2_:* = null as IMap;
         if((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2673) & 2) == 0)
         {
            _loc2_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc2_,2673,FlagDict_Impl_.arrayReadInt(_loc2_,2673) + 2);
            outputText("[pg]<b>解锁了新的图鉴条目：庄园日记！</b>[pg]");
         }
         menu();
         _g = this;
         section = 5;
         callback = floorPages;
         addButton(0,"日记 VI",function():void
         {
            _g.journal(section,callback);
         }).hint("日记的第六部分。").disableIf(param1 == 5);
         _g1 = this;
         section1 = 6;
         callback1 = floorPages;
         addButton(1,"日记 VII",function():void
         {
            _g1.journal(section1,callback1);
         }).hint("日记的第七部分。").disableIf(param1 == 6);
         _g2 = this;
         section2 = 7;
         callback2 = floorPages;
         addButton(2,"日记 VIII",function():void
         {
            _g2.journal(section2,callback2);
         }).hint("日记的第八部分。").disableIf(param1 == 7);
         addButton(14,"返回",runFunc);
      }
      
      public function findEntrance() : int
      {
         var _loc4_:int = 0;
         var _loc1_:Array = [];
         var _loc2_:int = int(Math.sqrt(int(get_dungeonMap().length)));
         var _loc3_:int = 0;
         while(_loc3_ < int(get_dungeonMap().length))
         {
            _loc4_ = 0;
            if(_loc3_ + 1 < int(get_dungeonMap().length) && int(get_dungeonMap()[_loc3_ + 1]) == 0)
            {
               _loc4_++;
            }
            if(_loc3_ - 1 >= 0 && int(get_dungeonMap()[_loc3_ - 1]) == 0)
            {
               _loc4_++;
            }
            if(_loc3_ + _loc2_ < int(get_dungeonMap().length) && int(get_dungeonMap()[_loc3_ + _loc2_]) == 0)
            {
               _loc4_++;
            }
            if(_loc3_ - _loc2_ < int(get_dungeonMap().length) && int(get_dungeonMap()[_loc3_ - _loc2_]) == 0)
            {
               _loc4_++;
            }
            if(int(get_dungeonMap()[_loc3_]) == 0 && (_loc4_ == 1 || _loc4_ == 4))
            {
               _loc1_.push(_loc3_);
            }
            _loc3_++;
         }
         return int(_loc1_[Utils.rand(int(_loc1_.length))]);
      }
      
      public function exitDungeon() : void
      {
         get_game().inDungeon = false;
         outputText("[pg]你离开了这座被诅咒的庄园。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function enterVoid() : void
      {
         get_game().inDungeon = true;
         get_game().dungeonLoc = 55;
         get_game().dungeons.startAlternative(this,7,"旧庄园");
         infinityLevel = 3;
         infinityFunc = infinity4;
         switchFloor(3,0);
         runFunc();
      }
      
      public function enterManor() : void
      {
         menu();
         get_game().inDungeon = true;
         get_game().dungeonLoc = 55;
         get_game().dungeons.startAlternative(this,7,"旧庄园");
         switchFloor(1,7);
         runFunc();
      }
      
      public function enterDungeon() : void
      {
         clearOutput();
         outputText("你走在通往古老庄园的破败道路上。前花园杂草丛生，中央的喷泉已经破损得无法修复。庄园本身也大部分被毁，窗户破裂，部分屋顶塌陷进墙里。你觉得这座豪宅的大部分地方都无法探索了。");
         outputText("[pg]这片区域寂静无风，除了几只乌鸦的叫声外什么也没有。前门紧闭，但从构成它的腐烂木头来看，应该很容易就能拆掉。");
         outputText("[pg]你是要进入庄园还是离开？");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2672) < 1)
         {
            outputText("[pg]<b>现在可以从“地点”菜单内的“地下城”子菜单进入庄园了。</b>");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2672,1);
         }
         menu();
         addButton(0,"进入",enterManor).hint("进入庄园。");
         addButton(1,"离开",exitDungeon);
      }
      
      public function drinkWine() : void
      {
         clearOutput();
         switch(1 + saveContent.wineDrunk)
         {
            case 1:
               outputText("你拔出酒塞，闻了闻里面的东西。至少，香味是无害的。你直接对着瓶子喝了下去。");
               outputText("[pg]味道好极了！这绝对是高品质的葡萄酒。你把酒瓶放在餐桌上。过了一会儿，你产生了一种异样的感觉；你对这杯酒感到很满意，但你也觉得你体内的某些东西已经腐烂了。");
               break;
            case 2:
               outputText("尽管你理智上知道不该喝，但那诱人的味道实在难以抗拒！你又从瓶子里喝了一大口。");
               outputText("[pg]它令人愉悦的香气和味道充满了你的脑海，融化了对世界的任何担忧。在内心深处，腐烂在溃烂，但你对这杯酒感到更加满意。" + (get_silly() ? "这是否意味着你是个酒鬼？" : ""));
               break;
            case 3:
               outputText("你把更多的酒倒进喉咙，瞬间感到一阵头晕。你体内的某些东西在痛，把所有的感觉都抽离了。");
               outputText("[pg]在片刻的清醒中，你凝视着手中的酒瓶。它有些不对劲。");
               get_player().set_lust(0);
               break;
            case 4:
               outputText("你死死盯着酒瓶。你已经感觉到那种熟悉的腐败感在你的核心蔓延。这酒……它在杀你。每一口都在腐蚀你的心智、身体和灵魂。这恶魔的琼浆对你的探索究竟有何帮助？这有什么意义？你脑海中究竟有什么邪恶的恶魔在折磨你，让你做到这种地步？你将酒瓶举到唇边，将胃能承受的最后一滴酒一饮而尽。");
               outputText("[pg]泪水在你的眼眶里打转，愤怒在你的灵魂中翻腾。角落里那个该死的东西，就在那里，躲在阴影里！它让你充满愤怒和蔑视，然后是悲伤，最后是恐惧。这些不满的幽灵萦绕着你，将每一个邪恶的记忆呈现在你的意识最前沿。每一次创伤，每一个死去的挚爱，每一个令人遗憾的罪恶，以及每一个被珍视的人。它们真的是真实的吗？这肯定不是你，这肯定不是你的历史。你被驱使去喝酒，去忘记你是谁。去忘记一切。");
               outputText("[pg]该死的可怕地方，愿它全部腐烂。");
               get_player().set_lust(0);
               break;
            default:
               outputText("酒瓶空了。[if (silly) { 就像你一样。}]");
         }
         _temp_1.wineDrunk += 1;
         if(saveContent.wineDrunk < 5)
         {
            get_player().HPChange(get_player().maxHP() / 10,false);
            dynStats(DynStat.Str(-1),DynStat.Cor(2),DynStat.Tou(-1),DynStat.Inte(-1),DynStat.Spe(-1));
         }
         doNext(runFunc);
      }
      
      public function diningRoom() : void
      {
         var overrideAbandon:Object;
         var nextAction:Function;
         var itype:ItemType;
         var _g:Inventory;
         var _loc1_:int = 0;
         clearOutput();
         outputText("你身处一个宽敞的餐厅。中央的餐桌相对完好，尽管烛台和装饰品以各种形式破损和残破。满是灰尘的盘子上还有一些食物，已经变质腐烂，任何生物都无法下咽，旁边还有空酒瓶和高脚杯。");
         if((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2671) & 8) != 0 && (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2671) & 0x10) == 0)
         {
            outputText("[pg]你看到地板上躺着一把深色的弯曲匕首。也许是那个亡灵小丑留下的？");
            _g = get_inventory();
            itype = get_weapons().CDAGGER;
            nextAction = tookDagger;
            overrideAbandon = runFunc;
            addButton(1,"拿取匕首",function():void
            {
               _g.takeItem(itype,nextAction,overrideAbandon);
            }).hint("拿走这把匕首。");
         }
         if((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2671) & 4) == 0 || (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2671) & 8) != 0 || (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2671) & 0x40) != 0)
         {
            switch(saveContent.wineDrunk)
            {
               case 0:
                  outputText("[pg]后面的酒架上有一瓶未开封的酒。");
                  break;
               case 1:
                  outputText("[pg]你之前打开的酒瓶放在餐桌上。如果你想的话，可以再喝一口。");
                  break;
               case 2:
                  outputText("[pg]你之前打开的酒瓶放在餐桌上，已经空了一半。");
                  break;
               case 3:
                  outputText("[pg]餐桌上的酒瓶快空了。[if (silly) { 它在嘲笑你。它以为它能赢这场战斗。去证明它错了！杀了它。}]");
                  break;
               case 4:
                  outputText("[pg]最后一个酒瓶现在空了。也许这样更好。");
            }
            addButton(0,"喝葡萄酒",drinkWine).hint("喝点葡萄酒。").disableIf(saveContent.wineDrunk >= 4,"瓶子是空的。");
         }
         else
         {
            outputText("[pg]你在餐厅里探索了一会儿。突然，你听到了动静。你转身面向声音的来源，却什么也没发现。");
            outputText("[pg]你再次听到了声音，是铃铛的叮当声。");
            outputText("[pg]你在房间里四处走动，试图追逐那不断在阴影中移动的声音。突然，你听到骨头断裂的声音，就在你身后！");
            if(get_player().get_spe() > 70)
            {
               outputText("你及时转过身，挡住了向你冲来的刀刃。袭击者是另一具骷髅，穿着破烂的小丑服！你把他推开，准备反击，但那个狡猾的亡灵在你出手之前就跑开了。<b>你正在与一个白骨小丑战斗！</b>");
            }
            else
            {
               outputText("你没能及时转身，一把刀深深地刺入了你的背部。你痛苦地呻吟着，转过身来，绝望地发起攻击！你打偏了，但终于看清了凶手；另一具骷髅，穿着破烂的小丑服！你" + (get_player().hasPerk(PerkLib.BleedImmune) ? "流血且" : "") + "受伤了，但在你处理伤口之前，你需要对付那个亡灵。<b>你正在与一个白骨小丑战斗！</b>");
               _loc1_ = get_player().reduceDamage(45 + Utils.rand(30),new BoneJester());
               get_player().takeDamage(_loc1_,true);
               get_player().bleed(new BoneJester());
            }
            startCombat(new BoneJester());
         }
      }
      
      public function destroyCrystal() : void
      {
         clearOutput();
         outputText("水晶开始对你的挑逗产生反应。里面蕴含的能量似乎与你注入的过剩快感产生了共鸣！");
         outputText("[pg]它开始震动，起初很轻微，但频率很快增加，直到整个房间都在震动。你失去平衡，摔倒在地。");
         outputText("[pg]当你摔倒在地时，水晶猛烈地碎裂了。粉红色的光芒褪去，碎片变成了暗灰色。<b>里面蕴含的力量将不再为死灵法师的巫术提供能量！</b>");
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,2671,FlagDict_Impl_.arrayReadInt(_loc1_,2671) | 0x0200);
         get_combat().cleanupAfterCombat();
         doNext(runFunc);
      }
      
      public function deskStudy(param1:int = -1) : void
      {
         var callback4:Function;
         var section4:int;
         var _g4:Manor;
         var callback3:Function;
         var section3:int;
         var _g3:Manor;
         var callback2:Function;
         var section2:int;
         var _g2:Manor;
         var callback1:Function;
         var section1:int;
         var _g1:Manor;
         var callback:Function;
         var section:int;
         var _g:Manor;
         var _loc2_:* = null as IMap;
         if((FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2673) & 1) == 0)
         {
            _loc2_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc2_,2673,FlagDict_Impl_.arrayReadInt(_loc2_,2673) | 1);
            outputText("[pg]<b>解锁了新的图鉴条目：庄园日记！</b>[pg]");
         }
         menu();
         _g = this;
         section = 0;
         callback = deskStudy;
         addButton(0,"日记 I",function():void
         {
            _g.journal(section,callback);
         }).hint("日记的第一部分。").disableIf(param1 == 0);
         _g1 = this;
         section1 = 1;
         callback1 = deskStudy;
         addButton(1,"日记 II",function():void
         {
            _g1.journal(section1,callback1);
         }).hint("日记的第二部分。").disableIf(param1 == 1);
         _g2 = this;
         section2 = 2;
         callback2 = deskStudy;
         addButton(2,"日记 III",function():void
         {
            _g2.journal(section2,callback2);
         }).hint("日记的第三部分。").disableIf(param1 == 2);
         _g3 = this;
         section3 = 3;
         callback3 = deskStudy;
         addButton(3,"日记 IV",function():void
         {
            _g3.journal(section3,callback3);
         }).hint("日记的第四部分。").disableIf(param1 == 3);
         _g4 = this;
         section4 = 4;
         callback4 = deskStudy;
         addButton(4,"日记 V",function():void
         {
            _g4.journal(section4,callback4);
         }).hint("日记的第五部分。").disableIf(param1 == 4);
         addButton(14,"返回",runFunc);
      }
      
      public function defeatNecro() : void
      {
         clearOutput();
         outputText("高大的死灵法师踉跄后退，因伤口发出响亮的嘶嘶声。[say: 这么多好事，都被毁了。全是为了那转瞬即逝的正义感。血肉将继续蔓延，每一次生长都比上一次更加像毒瘤，对它的真正目的毫无察觉，与它的核心分离。[pg]这终究会发生的，[name]。我们的造物主是永恒的，而他的造物却不是。他是超越时间的，而我们却屈服于时间。我们腐烂、衰败。当我们在一切结束后回归于祂时，那启示将带来千百倍的诅咒。]");
         outputText("[pg]你走上前去准备给予致命一击，但死灵法师的举动让你吃了一惊。他拔出匕首，深深地刺入自己的胸膛。黑色的脓液从伤口蔓延开来，聚集在武器上，这怪物跪倒在地，痛苦地呻吟着。");
         outputText("经过片刻的痛苦挣扎，死灵法师死去了，剩下的骷髅也散架了。他的武器变得漆黑如墨，仿佛它本身就是深渊的一部分。");
         outputText("[pg]<b>你击败了死灵法师，完成了无头骑士的遗愿。他的邪恶已被消除，无数因他的愚蠢而牺牲的受害者也得到了复仇。</b>");
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,2671,FlagDict_Impl_.arrayReadInt(_loc1_,2671) | 0x80);
         get_player().upgradeBeautifulSword();
         get_combat().cleanupAfterCombat();
         doNext(runFunc);
      }
      
      public function defeatJester() : void
      {
         clearOutput();
         outputText("意识到自己即将失败，小丑迅速跳开，试图逃跑。然而，你对他的攻击奏效了，他落地时一条腿碎裂，变成了残废。小丑继续逃跑，在布满灰尘的木地板上拖着身体，向图书馆爬去。你走近他，猛烈地进行了最后一次攻击，给了这具骷髅最后的死亡。");
         outputText("[pg]这证明你之前与之战斗的骷髅法师并不是真正的威胁。你必须继续探索这座庄园，揭开这些噩梦般恐怖的源头！");
         get_combat().cleanupAfterCombat();
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,2671,FlagDict_Impl_.arrayReadInt(_loc1_,2671) | 8);
         doNext(runFunc);
      }
      
      public function defeatGeneral() : void
      {
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,2671,FlagDict_Impl_.arrayReadInt(_loc1_,2671) | 1);
         get_combat().cleanupAfterCombat();
         clearOutput();
         outputText("随着最后一击，巨大的亡灵倒下了，产生的震动几乎让你绊倒。你不确定自己是否还能继续前进，但考虑到他盔甲上的凹痕和许多碎裂的骨头，你相信你已经给了它最后的死亡。");
         outputText("[pg]你现在可以继续深入黑暗的庄园，或者回到营地。");
         doNext(runFunc);
      }
      
      public function defeatCourtier() : void
      {
         clearOutput();
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,2671,FlagDict_Impl_.arrayReadInt(_loc1_,2671) | 4);
         outputText("虚弱的矮小骷髅试图逃跑，但在它的背上挨了最后一击后，它倒在了地上，几根骨头散落在走廊里。");
         if(get_player().statusEffectv1(StatusEffects.Resolve) % 2 == 0)
         {
            outputText("[pg]占据你思想的恐惧阴霾消退了。这个亡灵法师就是它的源头吗？");
         }
         else
         {
            outputText("[pg]由幻觉恐惧带来的巨大压力所引发的令人振奋的美德思想消退了。这个亡灵法师就是它的源头吗？");
         }
         outputText("然后你想起了你刚刚获得的护身符。你拿起来仔细检查。盯着徽章让你难以思考，并让你充满了即将到来的厄运的想法，就好像你的思想正在被扰乱和重组。你摇摇头，闭上眼睛。");
         outputText("[pg]有那么一瞬间，你想知道他是否就是无头骑士所说的那个生物。你必须继续你的搜索才能确定。");
         outputText("[pg]<b>获得新的魔法能力：考验信念！</b>");
         get_combat().cleanupAfterCombat();
         doNext(runFunc);
      }
      
      public function defeatCourt() : void
      {
         clearOutput();
         outputText("巨大的装甲骷髅踉跄着向前，试图用最后一击将你粉碎。你侧身躲开这缓慢的一击，让他破绽百出。你趁机用尽全力击打他的头部。你尖叫着给出致命一击，巨大的冲击力让这个巨人倒下，在撞击中散架。");
         outputText("[pg]击败装甲亡灵后，你将目光转向另外两个，这让他们退缩了，他们体内残存的一点点人性在恐惧中尖叫。小丑绝望地向你扑来。你躲开了，你已经熟悉了这个狡猾亡灵的动作。你抓住他的胸口，将他摔在地上。伴随着最后有力的一拳，你打碎了他的肋骨，扼杀了他残存的生命。");
         outputText("[pg]你站起来，看着那个已经累得无法再施展任何法术的魔法师。当你靠近时，他踉跄着后退。你迅速抓住他的头骨，将你全身的重量压在附近的墙上，将他瘦小的身体扔向墙壁。他的头骨在与石头撞击时完全碎裂，杀死了他。");
         outputText("[pg]你气喘吁吁，筋疲力尽，看向隧道的尽头，那里很远但清晰可见，被某种神秘的光芒照亮。赋予这些生物生命的恐怖就在那里。等待着。");
         get_combat().cleanupAfterCombat();
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,2671,FlagDict_Impl_.arrayReadInt(_loc1_,2671) | 0x40);
         doNext(runFunc);
      }
      
      public function debugMenu(param1:Boolean = true) : void
      {
         get_game().debugMenu.debugCompEdit(saveContent,new SaveContent(null,null,null));
      }
      
      public function courtierFight() : void
      {
         clearOutput();
         outputText("你再次站起来，暂时摆脱了袭击你的恐惧。你转向那个靠近你的实体；一个穿着破烂贵族衣服的骷髅，手里拿着一个铜高脚杯！乍一看它并不具有威胁性，但当你走开时，它缓慢地追踪你的动作，用它空闲的手进行着神秘的动作。它试图施放某种法术！你正在与一个<b>白骨巫师！</b>战斗");
         startCombat(new BoneCourtier());
      }
      
      public function courtierEncounter() : void
      {
         var dungeon:Boolean;
         var _g:Manor;
         clearOutput();
         outputText("英格纳姆的人民被毁灭的画面在你的脑海中闪过。恶魔们给你戴上镣铐，强迫你看着他们将这里烧成灰烬，屠杀一些人，折磨另一些人，还把一些人变成他们的奴隶。你一生中遇到的所有人，都毁于一旦，无可挽救。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,422) > 70)
         {
            outputText("[pg]你看到奇哈试图在你的帮助下解放她的同胞，却在这个过程中再次被奴役");
         }
         if(get_game().helFollower.helAffection() >= 70)
         {
            outputText("[pg]你看到赫莉娅终于在平原上遇到了对手，并被杀害。");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,38) >= 40)
         {
            outputText("[pg]你看到艾米莉和她的孩子们被一群恶魔发现并奴役。");
         }
         if(get_game().marbleScene.get_marbleAffection() >= 80)
         {
            outputText("[pg]你看到一支不可战胜的恶魔军队袭击了你的营地，并在你帮助玛布尔之前杀死了她。");
         }
         outputText("[pg]他们嘲笑你，诅咒你，乞求你的帮助。你辜负了他们，导致了数百人的死亡和痛苦！他们命运的重担压在你的身上，你被它压垮了。");
         outputText("[pg]这些画面几乎让你崩溃，你蜷缩在地上，乞求它们停下来。当你处于绝望的边缘时，你注意到一个实体正在靠近。你必须现在就面对这些恐惧，否则你将无法战斗！[pg]");
         if(get_game().shouldraFollower.followerShouldra())
         {
            outputText("舒尔德拉出现在你的脑海中。[say: 坚强点，老板！你能做到的！当你脑子里就有一个超自然怪物时，为什么还会害怕它们呢？][pg]");
         }
         _g = this;
         dungeon = true;
         addButton(0,"继续",function():void
         {
            _g.testResolve(dungeon);
         }).hint("面对你的恐惧，测试你的决心。");
      }
      
      public function checkBed() : void
      {
         var _loc1_:* = null as IMap;
         clearOutput();
         outputText("你走近床铺，更仔细地检查它。凑近一看，你注意到屋顶的洞周围沾着几滴血，中间的枕头也是。" + (get_player().get_inte() > 70 ? " 根据血迹的分布和洞口判断，你敢打赌有人朝上开了一枪……自杀？" : " 你无法弄清楚这里发生了什么。") + "");
         if(!get_player().hasKeyItem("Family Talisman"))
         {
            outputText("你在床边四处搜寻，在枕头下发现了一些东西。一个圆形的铜制护符，上面刻着一个带有向内尖刺的新月图案。你现在还不知道它有什么用，但留着它或许会有价值。[pg]");
            outputText("<b>获得关键物品：家族护符！</b>");
            get_player().createKeyItem("Family Talisman",0,0,0,0);
            outputText("[pg]当你拿起物品时，你听到走廊里有什么东西在移动。");
            _loc1_ = KFLAGS.flags;
            FlagDict_Impl_.arrayWriteInt(_loc1_,2671,FlagDict_Impl_.arrayReadInt(_loc1_,2671) | 2);
         }
         else
         {
            outputText("[pg]你觉得床上没有其他东西可找了。");
         }
         doNext(runFunc);
      }
      
      public function bedroom() : void
      {
         clearOutput();
         outputText("你现在在一个卧室里。与庄园的其他地方相比，这里保存得异常完好，尽管床发霉且有污渍，这可能是因为雨水从天花板上的一个小洞漏下来造成的，那个洞就在床的正上方。");
         outputText("[pg]地板的大部分区域画满了带有未知符文的奇怪圆圈，有些圆圈上还有干涸的血迹。窗户旁边的梳妆台被砸得粉碎。这是勃然大怒的结果。");
         addButton(0,"检查床铺",checkBed).hint("更仔细地检查床铺。");
      }
      
      public function banish(param1:Boolean = false) : void
      {
         var _g:Manor;
         clearOutput();
         if(get_player().statusEffectv2(StatusEffects.TFSupercharging) > 0 && !get_achievements().h[283])
         {
            awardAchievement("夜之阳",283);
            _g = this;
            doNext(function():void
            {
               _g.banish();
            });
            return;
         }
         outputText("那个生物大声尖叫，让你痛苦地闭上眼睛捂住耳朵。尽管你的眼睑紧闭，你仍然能看到那个可怕的生物。");
         outputText("[pg]它用一根触手指着你，你的视线被整个宇宙、时间起点的景象所淹没。你看到了许多和攻击你的生物一样的生物。它们增长到无法计算的数量，跨越了整个宇宙。");
         outputText("[pg]它们受到了来自外域的扭曲的、海葵状的漂浮生物的攻击。它们被撕成碎片，它们的残骸散布在无尽星辰的深渊中。");
         outputText("[pg]从它们其中一个存在的碎片中，生命在一个星球上蔓延开来。玛瑞斯。");
         outputText("[pg]它成长为各种形状。几千年过去了。最终，所有游荡的血肉再次聚集，那个神一般、不可名状的存在重生了。它加入了它的同类，它们一起面对宇宙的死亡——熵。你看到了<b>一切</b>。");
         outputText("[pg]宇宙放大，掠过不同的世纪、星系和宇宙。你看到了玛瑞斯。你看到了森林。你看到了被诅咒的庄园。你看到了你自己。");
         outputText("[pg]<b>获得特质：启示</b>。");
         if(!get_player().hasPerk(PerkLib.Revelation))
         {
            get_player().createPerk(PerkLib.Revelation,0,0,0,0);
         }
         if(param1)
         {
            awardAchievement("修格斯领主假说",282,true,true);
         }
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,2671,FlagDict_Impl_.arrayReadInt(_loc2_,2671) - 1024);
         get_combat().cleanupAfterCombat();
         switchFloor(1,7,false);
         doNext(runFunc);
      }
   }
}

