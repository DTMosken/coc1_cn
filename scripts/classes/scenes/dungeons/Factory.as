package classes.scenes.dungeons
{
   import classes.CoC;
   import classes.Cock;
   import classes.DynStat;
   import classes.ImageManager;
   import classes.Player;
   import classes.StatusEffects;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.display.SpriteDb;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.items.ConsumableLib;
   import classes.scenes.Camp;
   import classes.scenes.Inventory;
   import classes.scenes.dungeons._DungeonRoomConst.DungeonRoomConst_Impl_;
   import classes.scenes.dungeons.factory.OmnibusOverseerScene;
   import classes.scenes.dungeons.factory.SecretarialSuccubusScene;
   import coc.view.CoCButton;
   import flash.Boot;
   import haxe.IMap;
   import haxe.ds.IntMap;
   
   public class Factory extends DungeonAbstractContent
   {
      
      public var secretarialSuccubus:SecretarialSuccubusScene;
      
      public var omnibusOverseer:OmnibusOverseerScene;
      
      public function Factory()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         omnibusOverseer = new OmnibusOverseerScene();
         secretarialSuccubus = new SecretarialSuccubusScene();
         super();
      }
      
      public function takeSupervisorKey() : void
      {
         clearOutput();
         get_images().showImage("item-key-silver");
         outputText("你翻找了一下桌子，发现了一把标有\'主管\'字样的银色钥匙。");
         outputText("[pg]你拿起了<b>主管钥匙</b>，将它与其他重要物品放在一起。");
         get_player().createKeyItem("Supervisor\'s Key",0,0,0,0);
         get_dungeons().remakeMaps();
         doNext(runFunc);
      }
      
      public function takeLactaid() : void
      {
         clearOutput();
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,2026,FlagDict_Impl_.arrayReadInt(_loc1_,2026) + 1);
         get_images().showImage("item-lactaid");
         get_inventory().takeItem(get_consumables().LACTAID,runFunc);
      }
      
      public function takeIronKey() : void
      {
         clearOutput();
         get_images().showImage("item-key-iron");
         outputText("你拿走<b>铁钥匙</b>，把它和其他重要物品放在一起。");
         get_player().createKeyItem("Iron Key",0,0,0,0);
         get_dungeons().remakeMaps();
         doNext(runFunc);
      }
      
      public function takeGroPlus() : void
      {
         clearOutput();
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,2027,FlagDict_Impl_.arrayReadInt(_loc1_,2027) + 1);
         get_images().showImage("item-gro-plus");
         get_inventory().takeItem(get_consumables().GROPLUS,runFunc);
      }
      
      public function switchFloor(param1:int, param2:int) : void
      {
         floor = param1;
         if(param1 == 1)
         {
            initRoomsF1();
            get_dungeons().set_playerLoc(param2);
         }
         else
         {
            initRoomsF2();
            get_dungeons().set_playerLoc(param2);
         }
         get_dungeons().remakeMaps();
         runFunc();
      }
      
      public function startDungeon() : void
      {
         get_game().inDungeon = true;
         get_game().dungeons.startAlternative(this,7,"工厂");
         switchFloor(1,7);
         get_game().dungeons.setDungeonButtons();
         get_game().dungeonLoc = 0;
         runFunc();
      }
      
      public function roomRepairCloset() : void
      {
         clearOutput();
         get_images().showImage("factory-repair-closet");
         outputText("<b><u>维修储藏室</u></b>\n");
         outputText("当你小心翼翼地溜进房间时，你有些如释重负地发现这似乎是一个空的储藏室。房间很小，只有6乘8英尺大，几乎空无一物。储藏室里唯一的一件家具是靠在最里面墙上的一个简单的木柜。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2028) > 0)
         {
            outputText("架子上空空如也。");
         }
         else
         {
            outputText("柜子的架子上放着各种泵机零件，可能是用来修理工厂深处那些完整机器的。");
            if(get_player().get_inte() >= 40)
            {
               outputText("你意识到这里的零件足够组装一个乳房挤奶器或一个阴茎挤奶器。");
               if(get_player().hasKeyItem("Cock Milker"))
               {
                  outputText("\n你已经有一个阴茎挤奶器了。\n");
               }
               else
               {
                  addButton(1,"阴茎挤奶器",buildCockMilker);
               }
               if(get_player().hasKeyItem("Breast Milker"))
               {
                  outputText("\n你已经有一个乳房挤奶器了。\n");
               }
               else
               {
                  addButton(0,"乳房挤奶器",buildBreastMilker);
               }
            }
         }
         outputText("唯一的出口是回到南边。");
      }
      
      public function roomPumpRoom() : void
      {
         clearOutput();
         get_images().showImage("factory-pump-room");
         outputText("<u><b>泵房</b></u>\n");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2024) < 1)
         {
            outputText("当你穿过铁门时，一阵嘈杂的机械轰鸣声冲击着你的耳朵。铜管在头顶呈拱形，用铆钉固定在带刺的铁支架上，成对地扭曲着挂在天花板上。隐藏的泵和机械装置不断发出轰隆轰隆的声音，让人很难听清任何东西，但你发誓你能分辨出从房间西北侧传来的微弱的性爱欢愉声。进一步调查后，你发现房间西墙上有一扇门，似乎是那些淫荡声音的来源。所有机械的振动在东墙最强烈，表明这可能是这个地狱般地方的发电厂所在地。东墙和北墙各有一扇门。南边是一扇通向大厅的坚固铁门。");
         }
         else
         {
            outputText("当你穿过铁门时，寂静是你听到的唯一声音。铜管在头顶呈拱形，用铆钉固定在带刺的铁支架上，成对地扭曲着挂在天花板上。这个地方近乎完全的寂静让你感到不安，但也让你能分辨出从房间西北侧传来的微弱的性爱欢愉声。进一步调查后，你发现房间西墙上有一扇门，似乎是那些淫荡声音的来源。[pg]还有另外两扇门，一扇在东墙，一扇在北墙。南边是一扇通向大厅的坚固铁门。");
         }
      }
      
      public function roomPremiumStorage() : void
      {
         clearOutput();
         get_images().showImage("factory-storage");
         outputText("<b><u>高级产品</u></b>\n");
         outputText("这个储藏室里放着几个打开的板条箱，用来储存工厂里的各种物质。看起来现任监督者让物资储备不足，因为从这个微薄的储藏中得不到什么东西。\n");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2026) > 0)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2026) < 5)
            {
               outputText("有一个板条箱，里面有" + Utils.num2Text(5 - FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2026)) + "瓶叫做“催乳剂”的东西。\n");
               addButton(0,"催乳剂",takeLactaid);
            }
         }
         else
         {
            outputText("有一个未开封的板条箱，里面有五瓶叫做“催乳剂”的东西。[pg]");
            addButton(0,"催乳剂",takeLactaid);
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2027) > 0)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2027) < 5)
            {
               outputText("板条箱里装着" + Utils.num2Text(5 - FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2027)) + "瓶名为\"Gro+\"的东西。\n");
               addButton(1,"GroPlus",takeGroPlus);
            }
         }
         else
         {
            outputText("有一个未开封的板条箱，里面有五瓶叫做“Gro+”的东西。[pg]");
            addButton(1,"Gro+",takeGroPlus);
         }
      }
      
      public function roomMainChamber() : void
      {
         var newLoc:int;
         var floor1:int;
         var _g:Factory;
         clearOutput();
         get_images().showImage("factory-main-chamber");
         outputText("<b><u>主室</u></b>\n");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2024) <= 0)
         {
            outputText("这个巨大的洞穴般的房间里充满了此起彼伏的性爱呻吟声。一排排的束缚带均匀地分布在房间里，几乎所有的束缚带上都绑着神志不清的人类。每个人都拥有巨大的乳房和如大象般粗壮的阴茎。导致他们神志不清的源头从天花板上垂下来——一组组软管的末端带着针头，深深地扎进这些可怜的“女孩”的肉里，向她们体内泵入恶魔的化学物质。乳头和阴茎泵不断发出吸吮和吧唧声，让受害者保持在近乎持续的高潮状态。");
            if(get_player().cor < 50)
            {
               outputText("你希望能解救他们，但要把他们全部解救出来可能得花上大半天的时间。最好还是找到控制室，关掉这些地狱般的机器。");
            }
            else
            {
               outputText("你真希望自己也能有这样的机器。看起来太好玩了！不过，你觉得还是应该找到控制面板，关掉这些机器，把这些人放出来。");
            }
            outputText("东边有一个门口，上面标有“出口”的标志。沿着南墙有一个楼梯井，通向某种工头办公室。也许控制装置就在那里？");
         }
         else
         {
            outputText("自从你关闭了这家工厂后，这个房间就空旷多了。大约一半的女孩似乎已经离开了。剩下的人似乎正忙着在一场大规模的群交中互相操弄。几位有进取心的女士找到了皮衣，似乎在帮忙给那些沉迷于猖獗性行为的人手动注射化学混合物。看来她们中的一些人宁愿过着几乎持续高潮的生活，也不愿获得自由。东边有一扇标着“出口”的门，南墙边有一个楼梯井，通向监督员的办公室。");
            outputText("[pg]其中一位穿着皮衣的女士走过来提议道，[say:你想来一剂吗？你看起来需要缓解一下紧张情绪……]");
            addButton(0,"缓解紧张",doTensionRelease);
         }
         _g = this;
         floor1 = 2;
         newLoc = 0;
         setStairButtons(function():void
         {
            _g.switchFloor(floor1,newLoc);
         });
      }
      
      public function roomLobby() : void
      {
         clearOutput();
         get_images().showImage("factory-foyer");
         outputText("<b><u>工厂大厅</u></b>\n");
         outputText("你身后的门伴随着不祥的“吱呀”声关上了，紧接着是一声响亮的“砰”。环顾四周，你发现自己身处一个颇具格调的大厅，里面摆放着艺术品和一张接待台。仔细观察墙上的画作，很快就会发现它们堕落和恶魔般的本质：第一幅乍一看像是一个美丽微笑的女人的画像，但你注意到她裙摆周围缠绕着滴水的触手。接待台后面的第二幅画则更加露骨，公然描绘了一群小恶魔正在轮奸一个看起来有些眼熟的女人。幸运的是，无论哪个恶魔被雇佣为接待员，现在都不在。北墙的接待台后面是一扇看起来很坚固的铁门。西墙上有一扇门。门上的标志表明它通向工厂的洗手间。东墙上是一扇简单的木门，不过木头本身的颜色比你家乡的任何硬木都要深得多、红得多。你身后南边是生锈的铁制入口门。");
         setLockedDescriptions("北边的门被锁上了，你没有钥匙。");
         addButton(11,"离开",exitDungeon);
      }
      
      public function roomFurnaceRoom() : void
      {
         clearOutput();
         get_images().showImage("factory-furnace-room");
         outputText("<b><u>锅炉房</u></b>\n");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2024) <= 0)
         {
            outputText("这个房间里的空气热得足以让你[skintone]的[skindesc]上覆盖一层细密的汗水。房间的东侧与其说是墙，不如说是机器，一堆坚固的铁管上覆盖着小金属防爆门，燃料就是从那里送入的。墙上铆接了一块透明的小板，让你能看到某种粉红色的结晶燃料正在被紫白色的火焰燃烧。少数可见的控制装置和仪表似乎没有连接到任何重要的东西上，而且这些机器看起来太坚固了，你手头的东西根本无法破坏。唯一的出口是西墙上的一扇沉重的铁门。");
         }
         else
         {
            outputText("尽管机器已经关闭，这个房间里的空气仍然热得足以让你[skintone]的[skindesc]上覆盖一层细密的汗水。房间的东侧与其说是墙，不如说是机器，一堆坚固的铁管上覆盖着小金属防爆门，燃料就是从那里送入的。墙上铆接了一块透明的小板，让你能看到以前某种燃料的灰烬。少数可见的控制装置和仪表似乎没有连接到任何重要的东西上，而且这些机器看起来太坚固了，你手头的东西根本无法破坏。唯一的出口是西墙上的一扇沉重的铁门。");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2022) <= 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1239) == 0)
         {
            get_game().lethicesKeep.incubusMechanic.encounterIncubusFactory();
         }
      }
      
      public function roomForemanOffice() : void
      {
         var newLoc:int;
         var floor1:int;
         var _g:Factory;
         clearOutput();
         outputText("<b><u>工头办公室</u></b>\n");
         get_images().showImage("factory-foreman-office");
         outputText("这间办公室通过北侧的玻璃墙可以很好地俯瞰“工厂车间”。房间南侧有一张简单的书桌，后面放着一把更简单的椅子。书桌表面没有任何文件，上面只有一个小墨水瓶和一根羽毛笔。房间的角落里立着几尊男女雕像。他们都是裸体的，似乎被困在了高潮的瞬间。你不知道他们是雕像，还是某种变态的石化艺术品。北面有一扇玻璃门通向工厂。还有两扇门，都是用看起来非常坚固的金属制成的。一扇在东墙上，另一扇在南面，书桌后面。书桌后面的那扇门上标着“高级储藏室”（虽然它似乎被锁上了）。");
         _g = this;
         floor1 = 1;
         newLoc = 3;
         setStairButtons(null,function():void
         {
            _g.switchFloor(floor1,newLoc);
         });
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2023) <= 0)
         {
            omnibusOverseer.encounterOmnibus();
         }
         else if(!get_player().hasKeyItem("Supervisor\'s Key"))
         {
            addButton(0,"办公桌",takeSupervisorKey).hint("检查办公桌，看看有没有什么东西。");
         }
      }
      
      public function roomControlRoom() : void
      {
         clearOutput();
         get_images().showImage("factory-control-room");
         outputText("<b><u>水泵控制室</u></b>\n");
         outputText("这个房间实际上只比壁橱大一点。在远处的墙上，有一个制作精良的终端，上面有一套简单的机械控制装置。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2024) <= 0)
         {
            outputText("你花了一点时间查看它们，意识到你有三个选项来处理这个地方。[pg]");
            outputText("-你可以关闭储存通风阀门，使流体储存系统超载。建筑物后部的储罐将会破裂，向周围区域释放数千加仑受污染的液体，但设施的系统将遭受灾难性的故障，并永远关闭。\n");
            outputText("-你可以执行系统关闭，然后砸碎控制装置。这样可以让女孩们离开，并在短期内保持工厂关闭。然而，大部分设备将完好无损，恶魔们不需要费太大功夫就能重新开放这个地方。\n");
            outputText("-你可以让设备继续运行。毕竟，楼下的女孩们似乎很享受……\n");
         }
         else
         {
            outputText("由于你的行为造成的损坏，控制装置现在无法操作。");
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2024) <= 0)
         {
            addButton(0,"阀门",factoryOverload).hint("使阀门超载。这可能会产生意想不到的后果，但工厂将遭受灾难并永远关闭。");
            addButton(1,"关闭",factoryShutdown).hint("安全关闭工厂。这似乎是一个安全的选择，但它使工厂容易被重新开放。");
         }
      }
      
      public function roomBreakRoom() : void
      {
         clearOutput();
         get_images().showImage("factory-break-room");
         outputText("<b><u>休息室</u></b>\n");
         outputText("穿过深红色的门口，你走进了一个宽敞的休息室。桌子周围摆放着粗糙的木椅，占据了大部分地面空间。在远处的东墙边有一个小柜台，上面放着一个奇怪的乌木雕塑，雕刻着一个胸部丰满的女人，侧面印着“咖啡夫人”。雕塑下方是一壶冒着热气的咖啡，散发着令人振奋的浓郁香味。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2021) > 0)
         {
            if(!get_player().hasKeyItem("Iron Key"))
            {
               outputText("看来你的对手在逃跑时掉落了一把小铁钥匙。");
               addButton(0,"铁钥匙",takeIronKey).hint("捡起铁钥匙。它看起来也许能打开这家工厂里的门。");
            }
            addButton(1,"咖啡",drinkCoffee).hint("喝点咖啡。");
            spriteSelect(SpriteDb.get_s_mrsCoffee());
         }
         else
         {
            secretarialSuccubus.encounterSuccubus();
         }
      }
      
      public function roomBathroom() : void
      {
         clearOutput();
         get_images().showImage("factory-washroom");
         outputText("<b><u>洗手间</u></b>\n");
         outputText("这个房间相当干净。一面墙上有一排四个水槽。对面有几个洗手间隔间。三个小便池安装在其中一面墙上。你猜想即使是恶魔也需要使用洗手间。");
      }
      
      public function initRoomsF2() : void
      {
         dungeonRooms.h[0] = roomForemanOffice;
         dungeonRooms.h[1] = roomControlRoom;
         dungeonRooms.h[2] = roomPremiumStorage;
      }
      
      public function initRoomsF1() : void
      {
         dungeonRooms.h[1] = roomRepairCloset;
         dungeonRooms.h[3] = roomMainChamber;
         dungeonRooms.h[4] = roomPumpRoom;
         dungeonRooms.h[5] = roomFurnaceRoom;
         dungeonRooms.h[6] = roomBathroom;
         dungeonRooms.h[7] = roomLobby;
         dungeonRooms.h[8] = roomBreakRoom;
      }
      
      override public function initRooms() : void
      {
         dungeonRooms = new IntMap();
         initRoomsF1();
      }
      
      override public function get_dungeonMap() : Array
      {
         if(floor == 1)
         {
            return [1,0,1,3,0,0,0,0,0];
         }
         return [4,0,0,1];
      }
      
      override public function get_connectivity() : Array
      {
         if(floor == 1)
         {
            return [0,DungeonRoomConst_Impl_.fromStr("S"),0,DungeonRoomConst_Impl_.fromStr("E"),DungeonRoomConst_Impl_.fromStr("NSEW"),DungeonRoomConst_Impl_.fromStr("W"),DungeonRoomConst_Impl_.fromStr("E"),get_checkIronDoor(),DungeonRoomConst_Impl_.fromStr("W")];
         }
         return [get_checkPremiumDoor(),DungeonRoomConst_Impl_.fromStr("W"),DungeonRoomConst_Impl_.fromStr("N"),0];
      }
      
      public function get_checkPremiumDoor() : int
      {
         if(get_player().hasKeyItem("Supervisor\'s Key"))
         {
            return DungeonRoomConst_Impl_.fromStr("ES");
         }
         return DungeonRoomConst_Impl_.fromStr("LSSE");
      }
      
      public function get_checkIronDoor() : int
      {
         if(get_player().hasKeyItem("Iron Key"))
         {
            return DungeonRoomConst_Impl_.fromStr("NESW");
         }
         return DungeonRoomConst_Impl_.fromStr("LNNESW");
      }
      
      public function factoryShutdown() : void
      {
         clearOutput();
         get_images().showImage("factory-closed-shutdown");
         outputText("你决定关闭工厂，然后摧毁控制装置。你花了几分钟时间确保自己不会做出什么灾难性的事情。几次深呼吸平复了你的神经，让你能集中精力按下正确的按钮。机器持续的轰鸣声慢慢平息，紧接着是一阵失望的呻吟声。你走到窗前，看着俘虏们从药物诱导的性昏迷中苏醒过来。他们中的很大一部分人聚集起来离开了，尽管你不确定他们的目的地是哪里。有几个人似乎又聚集在设备周围，琢磨着如何操作它。也许他们喜欢待在这里……");
         outputText("[pg]你没忘记摧毁控制装置。你拿起附近的一把大扳手，反复砸向控制装置。最后，你把扳手扔向暴露在外的旋转齿轮，导致它卡住并脱落。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2024,1);
         doNext(runFunc);
      }
      
      public function factoryOverload() : void
      {
         clearOutput();
         get_images().showImage("factory-closed-overload");
         outputText("你决定通过使储罐超载来关闭工厂，使大部分设备无法运行且难以修复。你快速扭动旋钮，覆盖了储罐的压力排气孔。几分钟内，你听到了铆钉爆裂和泵拉扯的声音。你俯视工厂车间，看着许多管道破裂，将精液滴在呻吟的俘虏身上。泵短路过热，冒出阵阵浓烟。随着西边某处传来巨大的爆炸声，整栋建筑都在颤抖。随着最后一批电机尖叫着停止运转，刺耳的哀鸣声充满了整栋建筑。随着药物和人造快感的洪流停止，俘虏们慢慢开始苏醒。许多人崩溃大哭，其他人开始解开自己，探索周围的环境。你饶有兴趣地看着他们中的许多人聚集在一起，向出口走去。剩下的幸存者开始从机器上搜刮零件，并琢磨如何使用它。也许他们喜欢这里。");
         outputText("[pg]你没忘记摧毁控制装置。你拿起附近的一把大扳手，反复砸向控制装置。最后，你把扳手扔向暴露在外的旋转齿轮，导致它卡住并脱落。");
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2024,2);
         doNext(runFunc);
      }
      
      public function exitDungeon() : void
      {
         get_game().inDungeon = false;
         get_game().dungeons.usingAlternative = false;
         clearOutput();
         get_images().showImage("dungeon-entrance-factory");
         outputText("你溜出门外消失了，朝着你的营地走去，把地狱般的工厂抛在脑后。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function enterDungeon() : void
      {
         clearOutput();
         get_images().showImage("dungeon-entrance-factory");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2024) == 2)
         {
            outputText("绕过山麓的一个弯道，你偶然发现了一个巨大、生锈且死气沉沉的铁制建筑，上面有几个高大的灰色烟囱。一排排泛着绿色的铜管从建筑物的后部延伸出来，沿着陡峭的山坡向上攀升，通向山体表面一个参差不齐的洞口。这些管道大部分都沿着接缝裂开了，管道和山坡上都覆盖着粉红色的径流。");
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2024) == 1)
         {
            outputText("绕过山麓的一个弯道，你偶然发现了一个巨大、生锈且死气沉沉的铁制建筑，上面有几个高大的灰色烟囱。一排排泛着绿色的铜管从建筑物的后部延伸出来，沿着陡峭的山坡向上攀升，消失在山体表面的一个洞口里。");
         }
         else
         {
            outputText("绕过山麓的一个弯道，你偶然发现了一个巨大且生锈的铁制建筑，高大的烟囱里喷出令人作呕的粉红色烟雾。一排排泛着绿色的铜管从建筑物的后部延伸出来，沿着陡峭的山坡向上攀升，消失在山体表面的一个洞口里。这一定是个某种恶魔工厂，虽然你不知道他们能泵出什么东西。在屋顶高处，你看到一个巨大的水塔，由较小的管道供水，这些管道沿着建筑物的侧面向下延伸，通向湖泊的方向。");
         }
         outputText("[pg]这座地狱般的工厂没有窗户，前墙上只有一扇铁门。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2024) == 0)
         {
            outputText("如果你进去，毫无疑问会有很多恶魔要打，而且几乎没有逃跑的机会。如果你落入他们手中，等待你的将是死亡或更糟的下场。");
         }
         outputText("[pg]你要进入工厂还是离开？");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2020) < 1)
         {
            outputText("[pg]<b>现在可以从“地点”菜单下的“地牢”子菜单进入工厂。</b>");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2020,1);
         }
         menu();
         addButton(0,"进入",startDungeon);
         addButton(14,"离开",exitDungeon);
      }
      
      public function drinkCoffee() : void
      {
         clearOutput();
         spriteSelect(SpriteDb.get_s_mrsCoffee());
         get_images().showImage("item-coffee");
         outputText("你抿了一口浓郁香滑的咖啡，顿时觉得神清气爽。当你把咖啡壶放回原处时，那个巨乳咖啡机突然活了过来，她抓住自己粗大的暗色乳头，挤出一股滚烫的液体。你可以看到她翻着白眼，嘴巴因狂喜而张开，自动补充着缺失的咖啡，你猜她一定爽翻了。她的动作逐渐慢了下来，身体几乎难以察觉地颤抖着。当她再次变得一动不动，僵在原地时，脸上浮现出满足的微笑。你不知道这位“咖啡夫人”是被创造出来的，还是这个地方黑暗主人的受害者。");
         dynStats(DynStat.Lust(1));
         get_player().HPChange(35,false);
         get_player().refillHunger(10);
         doNext(runFunc);
      }
      
      public function doTensionRelease() : void
      {
         var _loc1_:int = 0;
         clearOutput();
         if(!get_player().hasStatusEffect(StatusEffects.TensionReleased))
         {
            if(get_player().hasVagina() && get_player().hasCock())
            {
               get_images().showImage("factory-tension-herm");
            }
            else if(get_player().hasVagina() && !get_player().hasCock())
            {
               get_images().showImage("factory-tension-female");
            }
            else
            {
               get_images().showImage("factory-tension-male");
            }
            outputText("你点点头走上前，任由她给你穿上改装过的挽具，并为你注射恶魔的混合药剂。很快，热流在你的血管中沸腾，汇聚在你的胸部和胯下。");
            if(get_player().biggestTitSize() < 10)
            {
               get_player().growTits(1,2 + Utils.rand(3),true,1);
               outputText("");
            }
            outputText("你瞥了一眼那堆闪闪发光、交织在一起、在快感中扭动着的肉体，发现自己也被吸引了进去。在接下来的四个小时里，你吸吮着被污染的母乳，操着大张的小穴，并拼尽全力从周围的扶他女孩身上榨取尽可能多的精液。最终，药物的效力从你体内消退，留下你躺在地板上恢复体力。精液、乳汁和汗水从你赤裸的身体上滴落，你试着清理干净并穿上衣服。");
            get_player().orgasm("Tits");
            dynStats(DynStat.Inte(-2),DynStat.Lib(4),DynStat.Cor(4));
            get_player().slimeFeed();
            get_player().createStatusEffect(StatusEffects.TensionReleased,0,0,0,0);
         }
         else
         {
            if(get_player().statusEffectv1(StatusEffects.TensionReleased) != 0)
            {
               doBadEndTension();
               return;
            }
            if(get_player().hasVagina() && get_player().hasCock())
            {
               get_images().showImage("factory-tension-herm");
            }
            else if(get_player().hasVagina() && !get_player().hasCock())
            {
               get_images().showImage("factory-tension-female");
            }
            else
            {
               get_images().showImage("factory-tension-male");
            }
            outputText("你急切地穿上改装过的挽具，让她们给你注射更多那种改变身体的化学物质。当她们用人造的欲望和渴求填满你时，你大声哭喊着乞求更多。她们满足了你，给了你比第一次更大的剂量。");
            if(int(get_player().cocks.length) > 0)
            {
               get_player().lengthChange(get_player().increaseCock(0,5),int(get_player().cocks.length));
               if(get_player().averageCockLength() >= 9 && get_player().averageCockThickness() < 2)
               {
                  outputText("你感觉自己也变粗了，以匹配你新的长度。");
                  _loc1_ = int(get_player().cocks.length);
                  while(_loc1_ > 0)
                  {
                     _loc1_--;
                     if(get_player().cocks[_loc1_].cockThickness < 2)
                     {
                        var _temp_1:* = get_player().cocks[_loc1_];
                        _temp_1.cockThickness = _temp_1.cockThickness + 1;
                     }
                  }
               }
               else if(get_player().averageCockLength() >= 15 && get_player().averageCockThickness() < 3)
               {
                  outputText("你感觉自己也变粗了，以匹配你新的长度。");
                  _loc1_ = int(get_player().cocks.length);
                  while(_loc1_ > 0)
                  {
                     _loc1_--;
                     if(get_player().cocks[_loc1_].cockThickness < 3)
                     {
                        var _temp_2:* = get_player().cocks[_loc1_];
                        _temp_2.cockThickness = _temp_2.cockThickness + 1;
                     }
                  }
               }
            }
            if(int(get_player().breastRows.length) == 0)
            {
               get_player().createBreastRow();
               outputText("你的胸部一阵刺痛，在你新的乳腺上长出了一对粉红色的乳头。");
            }
            get_player().growTits(1,2 + Utils.rand(3),true,1);
            outputText("");
            outputText("你的[nipples]");
            if(int(get_player().cocks.length) > 0)
            {
               outputText("和" + get_player().multiCockDescript());
            }
            outputText("变得坚硬如石，不断地渗出液体。");
            if(int(get_player().cocks.length) > 0 && int(get_player().vaginas.length) == 0)
            {
               outputText("你扫视着这片肉欲的海洋，发现自己被最近的小穴所吸引，仿佛那是世界上唯一重要的事情。你失去了时间的概念，狠狠地操着几十个大张的阴户，每一个都溢满了这场地狱狂欢中所有参与者的精液。");
            }
            if(int(get_player().vaginas.length) > 0 && int(get_player().cocks.length) == 0)
            {
               outputText("当你踏入这群被性欲冲昏头脑的人群时，你注意到好几个\"女孩\"——她们因药物而肿胀的恶魔肉棒，正被你湿润滴水的" + get_player().vaginaDescript(0) + "散发的气味吸引而来。你坐在地上，大大张开双腿，面向最近的那位，发出邀请般的淫荡呻吟；同时贪婪地抓住另一根沾满精液的肉棒——它刚刚才填满了一个淫荡大开的阴道——塞进嘴里吮吸。很快，你便被一根又一根巨大的地狱肉棒狠狠地深深插入，它们轮流在你体内射精。");
               get_player().cuntChange(150,true);
            }
            if(int(get_player().vaginas.length) > 0 && int(get_player().cocks.length) > 0)
            {
               outputText("你感觉到你的" + get_player().multiCockDescript() + "被许多湿润的洞穴榨取着，尽管你正忙于吸吮肉棒并在狂喜中呻吟，根本没注意到它们属于谁。");
            }
            outputText("接下来的八个小时，你完全沉浸在欲望中，一次又一次地高潮，感受着令人心神荡漾的快感。你在地板上恢复了一会儿，浑身浸透了乳汁、精液和爱液的混合物。由于最近的变化，穿衣服有点麻烦，但你还是设法挤回了你的[armor]里。你离开时仍然感到欲火焚身，身后女孩们的呻吟声也无济于事。也许你可以留下来再来一回合……");
            get_player().orgasm("Generic");
            dynStats(DynStat.Inte(-2),DynStat.Lib(4),DynStat.Cor(4));
            get_player().createStatusEffect(StatusEffects.TensionReleased,0,0,0,0);
            get_player().addStatusValue(StatusEffects.TensionReleased,1,1);
            get_player().slimeFeed();
         }
         doNext(runFunc);
      }
      
      public function doBadEndTension() : void
      {
         if(get_player().hasVagina() && get_player().hasCock())
         {
            get_images().showImage("factory-tension-herm");
         }
         else if(get_player().hasVagina() && !get_player().hasCock())
         {
            get_images().showImage("factory-tension-female");
         }
         else
         {
            get_images().showImage("factory-tension-male");
         }
         outputText("你渴望更多的恶魔药物，滑入现在熟悉的束缚带中，让针头刺入你的皮肤。你在欲望中喘息着，恳求他们再次增加剂量。当鸡尾酒在你的血管中涌动时，欲望在你的血管中燃烧");
         if(int(get_player().cocks.length) > 0)
         {
            outputText("，让你的[cocks]充满");
            outputText("感觉");
            if(get_player().cockTotal() == 1)
            {
               outputText("");
            }
            outputText("当");
            if(int(get_player().cocks.length) > 1)
            {
               outputText("它们");
            }
            else
            {
               outputText("它");
            }
            outputText("变得");
            if(int(get_player().cocks.length) == 1)
            {
               outputText("");
            }
            outputText("巨大而充血。");
         }
         else
         {
            outputText("。");
         }
         outputText("你的[nipples]跳动着，变得坚硬、肿胀，并开始滴奶。");
         if(int(get_player().vaginas.length) > 0)
         {
            outputText("你的小穴瞬间湿透了，空气中弥漫着性的气味。");
         }
         outputText("对更多药物的渴望与你想要操和被操的需求相互抗衡，直到你大脑中仅存的一小部分理智意识到，获得性爱比获得更多药物要容易得多。你挣脱出来，将自己投入到那堆汗流浃背的肉体中，迷失在汗水与性爱的咸味中，用双手取悦着乳头、阴蒂和肉棒，尽可能多地给予和接受快感。你简直身处天堂。你隐约意识到时间在流逝，但与再来一次让下体湿透的高潮相比，这已经是次要的了。你不断地操和吸，直到因神志不清而昏迷过去。");
         dynStats(DynStat.Inte(-25),DynStat.Lust(-75),DynStat.Cor(2));
         doNext(BadEndTension);
      }
      
      public function doBadEndGeneric() : void
      {
         clearOutput();
         outputText("你睁开睡眼惺忪的眼睛，在突然的光亮中眨着眼，试图弄清方向，回忆自己在哪儿。附近有个声音在呻吟，就像发情的母狗，或者喝醉的荡妇。想到这里，你咯咯地笑了一下，努力集中视线。你感到温暖而快乐，尤其是胸部和腹股沟。睡意以极其缓慢的速度从你的脑海中散去，但你发现很难去担心，因为你感觉如此温暖和美妙。这感觉就像有湿热的嘴巴贴在你的胯部和乳房上，以完美的节奏舔舐和吸吮。");
         if(int(get_player().cocks.length) == 0 || get_player().biggestTitSize() <= 1)
         {
            outputText("一个微弱的内心声音响起，提醒你你并没有");
            if(int(get_player().cocks.length) == 0)
            {
               outputText("腹股沟里有什么东西可以吸吮");
               if(get_player().biggestTitSize() <= 1)
               {
                  outputText("或者");
               }
            }
            if(get_player().biggestTitSize() <= 1)
            {
               outputText("胸部有什么装饰");
            }
            outputText("。那个声音逐渐消失，因为那种完美的快感和舒适感将它连同最后的睡意一起扫除了。[pg]");
         }
         else
         {
            outputText("一个微弱的内心声音试图警告你什么，却被完美的快感和舒适感所淹没，冲刷掉了你最后的睡意。[pg]");
         }
         outputText("你意识到那呻吟声是你自己的，并发现这个想法让你更加兴奋。[pg]");
         outputText("“<i>你真是个发情的荡妇！</i>”一个声音在你脑海中回荡。你想点头微笑，但被什么东西阻止了。你意识到自己被绑在某种椅子和安全带上，非常牢固，甚至无法动弹。细小而舒缓的手指按摩着你的太阳穴，揉去了几分钟前还威胁要打断你快感的恐惧。你可以看到");
         if(get_player().totalBreasts() == 2)
         {
            outputText("一对");
         }
         else
         {
            outputText("许多");
         }
         outputText("透明的软管从你那像母牛一样的胸部乳房中伸出。");
         if(get_player().biggestLactation() <= 1.5)
         {
            outputText("乳白色的奶水正源源不断地顺着管子流出，远离你的身体。");
         }
         else
         {
            outputText("管子淫秽地鼓胀着，努力承受着你产出的如洪流般乳白色的奶水。");
         }
         get_images().showImage("badend-factory");
         outputText("既然你已经知道发生了什么，你那不听话的嘴唇里爆发出更加放荡的呻吟。你不仅是个发情的荡妇。你还是个发情的母牛荡妇，正因为被抽奶而高潮。一旦你意识到这一点，你所接受的按摩感觉就太棒了。[pg]");
         outputText("一声清脆的响声在抽奶室里回荡，几乎被周围其他奶牛荡妇的呻吟声淹没。你环顾四周，意识到固定你头部的带子已经被解开了。你利用新获得的自由四处张望。那里有一排又一排的其他女孩，就像你一样。几乎所有人的乳房都更大，奶管也更饱满。此外，她们都有巨大的阴茎，如果不是因为巨大的管子包裹着每一个阴茎，它们就会拖在地上。");
         outputText("你旁边的女孩扭动着身体高潮了，在她的安全带里扭动着，一波又一波粘稠的粘液被泵入她的阴茎管，流入地板上的插座。她只是不停地射，让你想知道她怎么能制造出这么多东西。当这景象让你兴奋时，你自己胯部的快感也加倍了。多亏了你新获得的自由，你低头看到了自己被包裹着的巨大阴茎；虽然没有你邻居的那么大，但它看起来和感觉起来仍然很棒。[pg]");
         outputText("管子的内衬熟练地挤压和按摩着你被困住的阴茎，即使那双手继续在你的脑海中运作。你的一部分怀疑你的思想正在被操纵，但你正在经历的肉体快感是如此惊人，以至于你无意反抗。如果成为你性感的恶魔主人的精盆是必须的，那就这样吧。把一根巨大的恶魔阴茎塞进你的喉咙，让其他几根阴茎插进你的洞里，让你一直怀孕，成为他们丰满的双性人繁殖工具，这将是你的快乐和特权。");
         if(get_game().marbleScene.marbleFollower())
         {
            outputText("仿佛看穿了你的心思，那双手停止了按摩，它们的主人打了个响指。你看到玛布尔走到你面前，穿着一条奇怪的粉色内裤，前面伸出一个类似阴茎的突起。在你身后的人的命令下，她把内裤阴茎展示给你。你很高兴能提供服务，张开下巴，尽可能多地吞下那个巨大的类似阴茎的东西，而你身后的人则绕到后面，操进了玛布尔的屁股。你继续吸吮着粉红色的肉体，直到你感觉到它把某种邪恶的液体倒进你的胃里。你在快感中咯咯作响，开始自己高潮，同时通过服务你曾经的爱人来安抚你的恶魔主人。[pg]");
         }
         else
         {
            outputText("仿佛看穿了你的心思，那双手停止了按摩，它们的主人来到你面前，向你展示了一根肉质的、跳动的阴茎。你很高兴能提供服务，张开下巴，尽可能多地吞下那根巨大的阴茎，直到你感觉到它把邪恶的液体倒进你的胃里。你在快感中咯咯作响，开始自己高潮，同时照顾着一个或多个你的恶魔主人。[pg]");
         }
         outputText("这种待遇持续了几天，直到吸吮、操和被操成为你唯一渴望的事情。由于你的思想现在已经崩溃，不再需要注射来让你保持完美的快感状态。一个月后，他们甚至解开了你，因为你现在是他们完全的精液木偶，只渴望取悦和服从。");
         get_game().gameOver();
      }
      
      public function buildCockMilker() : void
      {
         clearOutput();
         get_images().showImage("factory-milking-cock");
         outputText("你琢磨着如何用这里的备用零件组装出一个功能完备的阴茎榨乳器，并将其拼装了起来。");
         outputText("[pg]你获得了<b>阴茎挤奶器</b>！");
         outputText("[pg]不过你需要一点帮助才能使用它。");
         get_player().createKeyItem("Cock Milker",0,0,0,0);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2028,1);
         doNext(runFunc);
      }
      
      public function buildBreastMilker() : void
      {
         clearOutput();
         get_images().showImage("factory-milking-breasts");
         outputText("你琢磨着如何用这里的备用零件组装出一个功能完备的乳房挤奶器，并将其拼装了起来。");
         outputText("[pg]你获得了<b>乳房挤奶器</b>！");
         outputText("[pg]不过你需要一点帮助才能使用它。");
         get_player().createKeyItem("Breast Milker",0,0,0,0);
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2028,1);
         doNext(runFunc);
      }
      
      public function BadEndTension() : void
      {
         clearOutput();
         get_images().showImage("badend-tension");
         outputText("过了一段时间，你醒了过来，你的身体因为过度劳累和对更多快感的渴望而隐隐作痛。一方面，你在这里有任务在身，但既然你可以沉浸在性爱中，几乎不断地高潮，为什么还要在危险和孤独中战斗和挣扎呢？你依偎在一个筋疲力尽的女孩身边，决定等待那些药物女主人让你在肉体堆中再来一次。其中一个转过身来，似乎注意到了你的想法，推着一个吸乳器走了过来。她把它连接到你仍在漏奶的乳头上，你");
         if(get_player().biggestLactation() >= 3)
         {
            outputText("发出哞哞的叫声");
         }
         else
         {
            outputText("哭喊着");
         }
         outputText("高兴地叫着，她向你保证，如果你做一头听话的母牛，就会再给你一剂药。");
         dynStats(DynStat.Inte(-75),DynStat.Lib(100),DynStat.Cor(3));
         get_game().gameOver();
      }
   }
}

