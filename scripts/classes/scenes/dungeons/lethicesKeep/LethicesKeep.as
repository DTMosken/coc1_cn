package classes.scenes.dungeons.lethicesKeep
{
   import classes.BaseContent;
   import classes.CoC;
   import classes.ImageManager;
   import classes.Monster;
   import classes.Player;
   import classes.Room;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.items.Consumable;
   import classes.items.ConsumableLib;
   import classes.scenes.Camp;
   import classes.scenes.Inventory;
   import classes.scenes.dungeons.DungeonCore;
   import classes.scenes.dungeons.factory.IncubusMechanicScenes;
   import flash.Boot;
   import haxe.IMap;
   import haxe.ds.StringMap;
   
   public class LethicesKeep extends BaseContent
   {
      
      public var succubusGardener:SuccubusGardenerScenes;
      
      public var minotaurKing:MinotaurKingScenes;
      
      public var livingStatue:LivingStatueScenes;
      
      public var lethice:LethiceScenes;
      
      public var jeanClaude:JeanClaudeScenes;
      
      public var incubusMechanic:IncubusMechanicScenes;
      
      public var hermCentaur:HermCentaurScenes;
      
      public var driderIncubus:DriderIncubusScenes;
      
      public var doppelganger:DoppelgangerScenes;
      
      public var WHITE:int;
      
      public var PURPLE:int;
      
      public var PINK:int;
      
      public var BROWN:int;
      
      public var BLUE:int;
      
      public var BLACK:int;
      
      public function LethicesKeep()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         PURPLE = 32;
         BROWN = 16;
         PINK = 8;
         WHITE = 4;
         BLUE = 2;
         BLACK = 1;
         lethice = new LethiceScenes();
         minotaurKing = new MinotaurKingScenes();
         driderIncubus = new DriderIncubusScenes();
         hermCentaur = new HermCentaurScenes();
         succubusGardener = new SuccubusGardenerScenes();
         livingStatue = new LivingStatueScenes();
         incubusMechanic = new IncubusMechanicScenes();
         doppelganger = new DoppelgangerScenes();
         jeanClaude = new JeanClaudeScenes();
         super();
      }
      
      public function westwalkRoomFunc() : Boolean
      {
         get_images().showImage("stronghold-walk-West");
         outputText("<b><u>西部步道</u></b>\n");
         outputText("花粉附着在你身上，这是由该地区许多开花的灌木释放出来的。往南走，它们长得更茂密了。往东看，你可以");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1248) == 0)
         {
            outputText("看到一座拿着巨大锤子的巨大雕像");
         }
         else
         {
            outputText("一堆碎石，那是你杀死的活化雕像散落的残骸");
         }
         outputText("。脚下温暖的红砂岩砖在一个T字路口分叉，通向北、东、南三个方向。厚重的城堡墙壁阻挡了向西的去路。");
         return false;
      }
      
      public function unlockedThroneRoom() : Boolean
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1249) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1251) > 0)
         {
            return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1248) > 0;
         }
         return false;
      }
      
      public function tunnel2RoomFunc() : Boolean
      {
         set_inRoomedDungeonName("BasiliskCave");
         get_images().showImage("stronghold-tunnel-2");
         outputText("<b><u>隧道</u></b>\n");
         outputText("光线从东边透进来。在这些地下洞穴中跋涉了这么久，你一定快到山顶了。你知道，如果你想原路返回，顺着陡峭的通道下去会再次穿过蛇怪的巢穴，但再次穿过那个拥挤的大厅可能是不明智的。最好还是继续前进，走向阳光。");
         return false;
      }
      
      public function tunnel1RoomFunc() : Boolean
      {
         get_images().showImage("stronghold-tunnel-1");
         outputText("<b><u>隧道</u></b>\n");
         outputText("隧道蜿蜒曲折，从这里逐渐向西和向北呈弧形延伸，在后一个方向上坡度很陡。向上倾斜的一侧一定通向莉希丝的要塞，据说在山顶上。你在这里得小心点。你怀疑这样的入口不会完全没有守卫。事实上……你觉得你能看到北边有人工开凿石头的痕迹。你正在接近某个地方。");
         return false;
      }
      
      public function throneRoomFunc() : Boolean
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1261) == 0)
         {
            driderIncubus.encounterDriderIncbutt();
            return true;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1266) == 0)
         {
            minotaurKing.encounterMinotaurKing();
            return true;
         }
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1272) == 0)
         {
            lethice.encounterLethice();
            return true;
         }
         get_images().showImage("stronghold-Throne-room");
         outputText("<b><u>王座室</u></b>\n");
         outputText("王座室的设计错综复杂。从门口到王座的地板上铺着带有红色点缀的紫色地毯。王座似乎是用大理石雕刻而成的，上面点缀着莱希石。沿途有雕刻精美的大理石柱和精液喷泉。光是看着那些喷泉，你就脸红了。");
         return false;
      }
      
      public function takeEgg(param1:int) : void
      {
         var _loc2_:Consumable = null;
         if(param1 == BLACK)
         {
            _loc2_ = get_consumables().L_BLKEG;
         }
         if(param1 == BLUE)
         {
            _loc2_ = get_consumables().L_BLUEG;
         }
         if(param1 == WHITE)
         {
            _loc2_ = get_consumables().L_WHTEG;
         }
         if(param1 == PINK)
         {
            _loc2_ = get_consumables().L_PNKEG;
         }
         if(param1 == BROWN)
         {
            _loc2_ = get_consumables().L_BRNEG;
         }
         if(param1 == PURPLE)
         {
            _loc2_ = get_consumables().L_PRPEG;
         }
         clearOutput();
         if(param1 == BLACK)
         {
            get_images().showImage("item-egg-black");
         }
         if(param1 == BLUE)
         {
            get_images().showImage("item-egg-blue");
         }
         if(param1 == WHITE)
         {
            get_images().showImage("item-egg-white");
         }
         if(param1 == PINK)
         {
            get_images().showImage("item-egg-pink");
         }
         if(param1 == BROWN)
         {
            get_images().showImage("item-egg-brown");
         }
         if(param1 == PURPLE)
         {
            get_images().showImage("item-egg-purple");
         }
         outputText("你拔出了" + Utils.cnName(_loc2_.get_longName()) + "");
         var _loc3_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc3_,1252,FlagDict_Impl_.arrayReadInt(_loc3_,1252) + param1);
         get_inventory().takeItem(_loc2_,playerMenu);
      }
      
      public function southwestwalkRoomFunc() : Boolean
      {
         var _g1:SuccubusGardenerScenes;
         var monster1:Monster;
         var _g:LethicesKeep;
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1249) == 0)
         {
            get_images().showImage("sGardener-encounter");
         }
         else
         {
            get_images().showImage("stronghold-walk-SW");
         }
         outputText("<b><u>西南步道</u></b>\n");
         outputText("小路周围的灌木丛在这里变成了一团触手，有些触手上还装饰着周围空气中的花朵。它们扭曲蠕动，但目前似乎满足于待在原地。此外，如果你沿着步道的边缘走，你应该能避开它们。小路向北和向南延伸……如果那堵油腻腻的触手墙不来烦你的话。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1249) == 0)
         {
            outputText("[pg]前面光滑的树叶分开了，露出一条穿着绿色长筒袜的柔软大腿，上面的图案更像是叶脉的蜘蛛网，而不是任何衣物。它的主人紧随其后，身材如此完美、美妙，以至于你僵在原地，被生物本能驱使着去注意她。她宽阔的胸膛、充满女人味的臀部和柔和的曲线邀请你投入她的怀抱。她丰满而撅起的嘴唇，召唤你去品尝。她头发的光泽像鮟鱇鱼的诱饵一样闪闪发光，遥不可及，追求它又是如此愚蠢。她那如公羊般光滑扭曲的角保持着她发型的时尚，同时也将你从白日梦中惊醒。");
            outputText("[pg]你摇了摇头，重新集中注意力。这是一个恶魔，你不会这么轻易就上了她的当");
            if(get_player().get_lust() <= 75)
            {
               outputText("！");
            }
            else
            {
               outputText("...你心不在焉地抚摸着自己，思考着自己还能坚持多久才会屈服。应该不会太久了。");
            }
            outputText("[pg][say: 哎呀，你好啊，]堕落的诱惑者用一种听起来像是在摸你头的语气说道。[say: 你一定就是[name]了。你大老远跑来，就是为了加入我的花园吗？]魅魔的嘴角微微上扬，嘴唇闪烁着诱人的光泽。[say: 或者，你可以成为我的第一个非植物宠物。你愿意吗？]她弓起背，向你展示她的双乳，它们凭借自身不可思议的完美形状高高耸立，被一件暴露的下胸衣托起，这件衣服的作用仅仅是为了凸显她坚挺、翘立的乳头。它们闪烁着湿润的光泽——你猜那是乳汁。");
            outputText("[pg]她鼓励地微笑着。[say: 你选哪个？]");
            menu();
            _g = this;
            monster1 = new SuccubusGardener();
            addButton(0,"战斗",function():void
            {
               _g.startCombatImmediate(monster1);
            });
            _g1 = succubusGardener;
            addButton(1,"投降",function():void
            {
               _g1.surrenderToTheGardener();
            });
            return true;
         }
         return false;
      }
      
      public function southwestcourtyardRoomFunc() : Boolean
      {
         get_images().showImage("stronghold-courtyard-SW");
         outputText("<b><u>西南庭院</u></b>\n");
         outputText("附近的一些灌木丛正在开花，空气中弥漫着它们甜美的香气，与你以前遇到过的任何花都不同。它们的花瓣五颜六色，它们的香气虽然夹杂着腐败的气息，但却和你闻过的任何东西一样甜美宜人。你所走的小路从这里沿着厚厚的红墙向北和向东弯曲。藤蔓似乎挤满了向北的路。没有任何迹象表明有坡道或梯子可以到达城垛，但西边有一扇门，上面标着“锻造翼”。一张告示宣布它因维修而关闭。");
         return false;
      }
      
      public function southeastwalkRoomFunc() : Boolean
      {
         get_images().showImage("stronghold-walk-SE");
         outputText("<b><u>东南步道</u></b>\n");
         outputText("成群的蝴蝶聚集在开花的灌木丛上。起初，这景象看起来很美，几乎是原始的。然后，你发现了莉希丝在这些土地上传播的特有腐败。它们不仅仅是成群的蝴蝶——它们是成群交配的蝴蝶，在散发着甜味的雄花粉和拍打着翅膀的蝴蝶群中互相爬行。你最好继续前进。这条路通向北和南。");
         return false;
      }
      
      public function southeastcourtyardRoomFunc() : Boolean
      {
         get_images().showImage("stronghold-courtyard-SE");
         outputText("<b><u>东南庭院</u></b>\n");
         outputText("沿着砂岩小路走，你会看到一片异常宁静的景色。在这里，在环绕山峰的云层之上，你几乎太容易放松警惕了。莉希丝堡垒南墙上的一个小洞出现在南面。透过洞口，你可以看到悬挂在悬崖边的机械和某种升降机。那一定是恶魔们安全进出的方式。你可以继续在北面和西面的灌木丛中行走。东面的一扇铁门上写着“娱乐区”。一块小牌子解释说，由于翻修，目前禁止入内。下面的涂鸦抱怨说，某个名叫Fenoxo的承包商没有按照承诺的工作进度交工。");
         return false;
      }
      
      public function southcourtyardRoomFunc() : Boolean
      {
         get_images().showImage("stronghold-courtyard-South");
         outputText("<b><u>南庭院</u></b>\n");
         outputText("对于一个据说充满了无尽放荡和堕落的地方来说，莉希丝的庭院出奇地整洁。小路铺着相互连接的砂岩砖，反射着阳光，给这个地方带来柔和的琥珀色光芒，两旁是郁郁葱葱的绿草和修剪整齐的树篱。如果不是风中隐约传来的呻吟声，你几乎会把这个地方误认为是教堂的墓地。庭院的小路向东和向西延伸，而向外的门则在南边敞开着。");
         return false;
      }
      
      public function roomofmirrorsRoomFunc() : Boolean
      {
         get_images().showImage("stronghold-Mirrors-room");
         outputText("<b><u>镜子房</u></b>\n");
         outputText("金属门无声地打开，通向一个相当大且没有灯光的房间，因为久未使用而显得破旧灰暗。里面杂乱地堆放着大量的镜子。圆形的梳妆镜叠放在架子上，方形的壁镜靠在墙上，一面巨大的、");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1242) == 1)
         {
            outputText("现在已经破碎的，");
         }
         outputText("华丽的落地镜占据了房间的中心，后面还堆放着许多破碎、边缘参差不齐的镜子碎片。它们空洞地反射着这个地方沉闷的装饰。你猜像恶魔这样以自我为中心的种族，对这些东西的需求量一定很大。");
         if(get_player().hasKeyItem("Laybans"))
         {
            outputText("[pg]这个地方感觉空洞而令人毛骨悚然，即使你在进行了临时的驱魔之后也是如此。没有理由在这里逗留。");
         }
         else
         {
            outputText("[pg]在房间后面，靠近那堆碎镜子的地方，有一个白色的架子，上面展示着一些看起来像是深色墨镜的东西。");
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1240) == 1)
            {
               outputText("你精神一振。它们看起来很可能和蛇怪大厅里的屏幕是用同一种材料制成的。");
            }
            if(get_player().get_inte() >= 70 || get_player().sens >= 70)
            {
               outputText("一阵不安顺着你的脊背蔓延。这个地方有些不对劲。房间的角落似乎有些褪色，就好像它并不完全存在于这里。");
            }
            addButton(2,"眼镜",doppelganger.getDemGlasses);
         }
         return false;
      }
      
      public function northwestwalkRoomFunc() : Boolean
      {
         get_images().showImage("stronghold-walk-NW");
         outputText("<b><u>西北步道</u></b>\n");
         outputText("一条狭窄的小路从红砂岩大道分出，通向西边的一扇双开门。制作这扇门的木匠的精湛技艺展露无遗；门框外缘雕刻着各种性交姿势的龙的复杂图案，而中间的面板上则装饰着更普通、赏心悦目的图案。上方的一块牌子标明这个区域是图书馆。不幸的是，门被封死了。也许图书馆还没有写好。");
         outputText("[pg]你对自己的笑话嗤之以鼻。[pg]");
         outputText("庭院本身的情况与其他地方差不多。南边的灌木丛看起来比其他地方更杂乱，但北边似乎除了在这个植物天堂里愉快地散步之外，什么也没有。");
         return false;
      }
      
      public function northwestcourtyardRoomFunc() : Boolean
      {
         get_images().showImage("stronghold-courtyard-NW");
         outputText("<b><u>西北庭院</u></b>\n");
         outputText("庭院在这里戛然而止，北面被一堵高得惊人的石墙围住，这堵墙高得足以让其他三个方向的墙相形见绌。小路西面也被石墙挡住，迫使它向东和向南弯曲，绕过一丛被粗俗地修剪成肿胀阴茎形状的灌木。恶魔们甚至将象牙色的花朵修剪成沿着一侧的连续路径，看起来非常像一股树木的精液。");
         return false;
      }
      
      public function northentryRoomFunc() : Boolean
      {
         get_images().showImage("stronghold-North-entry");
         outputText("<b><u>北入口</u></b>\n");
         outputText("你现在站在莉希丝总部南入口的拱门下。这个地方建得像一座城堡。从你阴暗的位置看不清太多东西，但周围的砖块每一块都像马一样大。大门本身是用看起来至少有一个世纪历史的木头制成的，用闪闪发光的金属带加固，你怀疑它们永远不会生锈。南边可以看到贫瘠的悬崖，北边是恶魔女王的巢穴。");
         return false;
      }
      
      public function northeastwalkRoomFunc() : Boolean
      {
         get_images().showImage("stronghold-walk-NE");
         outputText("<b><u>东北步道</u></b>\n");
         outputText("这里的空气清新自由。即使是这个地方腐败的本质，也无法阻止你享受在恶魔女王花园里的这一刻。不过，这里依然弥漫着挥之不去的危险气息。花香宜人，但不知为何有些不对劲，微风时不时带来淫荡的呻吟声。东墙上的一个入口通向兵营和食堂，入口左侧有一块简单的标志牌，旁边是气势雄伟的铁门框。幸运的是，门被锁住并封死了。看来你来的时候，莉希丝的堡垒几乎是空的。你真是太幸运了。");
         return false;
      }
      
      public function northeastcourtyardRoomFunc() : Boolean
      {
         get_images().showImage("stronghold-courtyard-NE");
         outputText("<b><u>东北庭院</u></b>\n");
         outputText("庭院的这个角落感觉异常拥挤，甚至让人有些幽闭恐惧。北面是一堵高耸的石墙，让东面较矮的墙相形见绌，更糟糕的是，西南面的树篱又高又方，简直就是一堵墙。唯一可行的路线是向南或向西，沿着红砂岩砖在拐角处弯曲前行。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1251) == 0)
         {
            hermCentaur.encounterThePony();
            return true;
         }
         return false;
      }
      
      public function northcourtyardRoomFunc() : Boolean
      {
         get_images().showImage("stronghold-courtyard-North");
         outputText("<b><u>北部庭院</u></b>\n");
         outputText("你站在一个只能是莉希丝王座室入口的地方。它没有标签，但这扇巨大的门与你在这个世界或上个世界见过的任何门都不同。这扇门由某种带粉红色的金属制成，抛光得像镜子一样，倾注了一生的心血。更重要的是，复杂的锁定机制重叠在它的边缘，每一个都以一个精细制作的封印结束。幸运的是，每个封印都被留下了。在这个时候，安全对恶魔女王来说一定不是什么大问题。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1249) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1251) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1248) > 0)
         {
            outputText("封印似乎被打破了。你可以向北移动，尝试一劳永逸地击败莉希丝。或者，如果你愿意，你可以在庭院里向东和向西移动。");
         }
         else
         {
            outputText("要是门能打开就好了。不知什么原因，它仍然被封死了。如果你愿意，你仍然可以在庭院里向东和向西移动。");
         }
         return false;
      }
      
      public function magpiehallsRoomFunc() : Boolean
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1243) == 0)
         {
            get_images().showImage("stronghold-basilisks");
         }
         else
         {
            get_images().showImage("stronghold-Magpie-hall");
         }
         outputText("<b><u>喜鹊大厅</u></b>\n");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1243) == 0)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1240) == 0)
            {
               FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1240,1);
               outputText("你蹑手蹑脚地穿过拱门。这里的动静和喧闹声更近了；似乎直接来自你的正下方。前方是那个屏幕，一扇由有色玻璃制成的大窗户。你小心翼翼地透过它往外看。你进入了一个巨大的大厅，靠近它的最顶部；这似乎是某种镶嵌在石墙高处的观察室。它的设计遵循宏伟的古典传统，墙壁两侧有带凹槽的栏杆，每个栏杆的顶部都装饰着一只雕刻的飞翔的喜鹊。下面是——好吧。你眨了眨眼，试图把这一切都看清楚。[pg]");
               outputText("大厅下方几英尺处熙熙攘攘：高大、瘦削、灰绿色的爬行动物在彼此之间以及贯穿整个房间的长桌上蜿蜒滑行。下面一定有数百，不，至少一千只蛇怪，正在搬运、分析、分类桌子上堆积如山的大量垃圾。");
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,563) == 100)
               {
                  outputText("这只能是" + get_game().bazaar.benoit.benoitMF("Benoit","Benoite") + "曾经工作过的大厅。");
               }
               outputText("当你以为看到许多深不见底的灰色水池旋转着迎上你的目光时，你吓得魂飞魄散——但它们并没有把你冻结，你本能地转过身时注意到了这一点。有色玻璃一定带有某种抗石化的魔咒，而且它的另一面一定是反光的，因为下面似乎没有人意识到你站在那里。稍微放松了一点，你继续观察这个巨大的房间。在离你最远的那一端，堆起了两座巨大的山——一座是蛋，各种你能想象到的颜色和大小的蛋堆积在一起，另一座是纯粹的垃圾，大概是蛇怪在拾荒时发现并认为值得保留的所有东西。十几个崩溃文明的残骸一定都在下面，由这些长着鳞片的看守收集起来供恶魔们查阅。在你的正下方，你可以看到像你刚刚穿过的拱门一样的拱门，蛇怪们在其中穿梭。[pg]");
               outputText("当你思考时，你的心跳加快了。有一个网格状的龙门架从你所在的地方一直延伸到房间的另一边，在那里你可以看到一个匹配的观察室，大概包含另一个出口。但距离相当远，有楼梯通向地面，在防护玻璃外面，你肯定会被发现并被抓住");
               if(get_player().canFly())
               {
                  outputText("，即使你试图飞过去");
               }
               outputText("。不是吗？你无法逃脱一千只蛇怪的目光……你能吗？");
               if(get_player().hasKeyItem("Laybans"))
               {
                  outputText("你从你的[inv]中拿出雷朋眼镜，把它们举到玻璃前。正如你所希望的那样——它们是由同一种材料制成的，而且几乎可以肯定是恶魔在与蛇怪互动时戴的东西。如果你疯狂到想尝试的话，它们肯定能帮你穿过大厅。");
               }
            }
            else
            {
               outputText("你再次蹑手蹑脚地走到有色玻璃前，再次观察这个巨大的大厅，下面是正在努力工作的蛇怪大军，你再次凝视着金属龙门架，另一边的出口诱人地可见。");
               if(!get_player().hasKeyItem("Laybans"))
               {
                  outputText("你要尝试一下吗？");
               }
               else
               {
                  outputText("你从口袋里掏出雷朋眼镜，在手里转动着，陷入了沉思。你要试试这个吗？");
               }
            }
            unlockCodexEntry(1305);
            menu();
            addButton(0,"上！",jeanClaude.gogoFuckTheseBasilisks);
            addButton(1,"撤退",fallbackFromMagpieHallS);
            return true;
         }
         outputText("你回到了喜鹊大厅的南端。没有了下面忙碌的活动，这里显得空荡荡的，十分安静，唯一的声音是来自其他地方的低语。下面收集了大量的垃圾，但要从中找到任何有价值的东西，嗯，需要一支蛇怪军队。不过，你可以去看看那堆巨大的蛋。");
         if(eggsAvailable() > 0)
         {
            addButton(2,"蛋",goToEggPile);
         }
         return false;
      }
      
      public function magpiehallnRoomFunc() : Boolean
      {
         var roomName:String;
         var _g:DungeonCore;
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1243) == 0)
         {
            get_images().showImage("stronghold-Magpie-locked");
         }
         else
         {
            get_images().showImage("stronghold-Magpie-hall");
         }
         outputText("<b><u>喜鹊大厅</u></b>\n");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1243) == 0)
         {
            outputText("你发现自己回到了小隔间，锁着的门通向喜鹊大厅。就像对面的那个一样，这里也有一个变暗的屏幕，透过它你可以看到下面有数百只蛇怪在走动，整理着他们从山腰收集来的大量垃圾和蛋。在你险些逃脱后，他们似乎没有采取任何额外的预防措施——龙门架上仍然没有任何守卫，另一边的门看起来是开着的。");
            menu();
            addButton(0,"上！",jeanClaude.gogoFuckTheseBasilisksNorth);
            _g = get_game().dungeons;
            roomName = "tunnel2";
            addButton(1,"要塞",function():void
            {
               _g.move(roomName);
            });
            return true;
         }
         outputText("你回到了喜鹊大厅的北端。没有了下方忙碌的景象，这里显得空荡荡的，十分安静，唯一的声音是从别处传来的活动声。下方堆积着大量的垃圾，但要从中找出有价值的东西，恐怕需要一支蛇怪大军才行。不过，你可以去看看那一大堆蛋。");
         if(eggsAvailable() > 0)
         {
            addButton(2,"蛋",goToEggPile);
         }
         return false;
      }
      
      public function greatliftRoomFunc() : Boolean
      {
         get_images().showImage("stronghold-lift");
         outputText("<b><u>大升降机</u></b>\n");
         outputText("错综复杂的石雕支撑着这个摇摇欲坠的平台，它从莉希丝堡垒的侧面伸出，悬挂在数百英尺深的陡峭悬崖上。鹰身女妖似乎已经从正下方的区域搬走了，无论是出于自愿还是恶魔的行动，尽管你仍然可以在山腰的其他地方发现一些她们的巢穴。一台看起来很复杂的机器放在平台的一侧，连接着一个悬挂在边缘的笼子，由一根低矮的金属缆绳支撑着。这一定是一种机械升降机——一种可以随意进出的方式。");
         incubusMechanic.meetAtElevator();
         return false;
      }
      
      public function goToEggPile() : void
      {
         var eggMask5:int;
         var _g5:LethicesKeep;
         var eggMask4:int;
         var _g4:LethicesKeep;
         var eggMask3:int;
         var _g3:LethicesKeep;
         var eggMask2:int;
         var _g2:LethicesKeep;
         var eggMask1:int;
         var _g1:LethicesKeep;
         var eggMask:int;
         var _g:LethicesKeep;
         clearOutput();
         get_images().showImage("item-egg-pile");
         outputText("你走下楼梯，进入大厅，检查蛇怪们收集的那堆杂乱的蛋。它们大多是未受精的鹰身女妖卵，但你很快就挑出了几个颜色各异的变形蛋，天知道是从谁那里偷来的。");
         menu();
         var _loc1_:int = FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1252);
         if((_loc1_ & BLACK) == 0)
         {
            _g = this;
            eggMask = BLACK;
            addButton(0,"黑",function():void
            {
               _g.takeEgg(eggMask);
            });
         }
         if((_loc1_ & BLUE) == 0)
         {
            _g1 = this;
            eggMask1 = BLUE;
            addButton(1,"蓝",function():void
            {
               _g1.takeEgg(eggMask1);
            });
         }
         if((_loc1_ & WHITE) == 0)
         {
            _g2 = this;
            eggMask2 = WHITE;
            addButton(2,"白",function():void
            {
               _g2.takeEgg(eggMask2);
            });
         }
         if((_loc1_ & PINK) == 0)
         {
            _g3 = this;
            eggMask3 = PINK;
            addButton(3,"粉",function():void
            {
               _g3.takeEgg(eggMask3);
            });
         }
         if((_loc1_ & BROWN) == 0)
         {
            _g4 = this;
            eggMask4 = BROWN;
            addButton(4,"棕",function():void
            {
               _g4.takeEgg(eggMask4);
            });
         }
         if((_loc1_ & PURPLE) == 0)
         {
            _g5 = this;
            eggMask5 = PURPLE;
            addButton(5,"紫",function():void
            {
               _g5.takeEgg(eggMask5);
            });
         }
         addButton(14,"返回",get_game().dungeons.resumeFromFight);
      }
      
      public function fallbackFromMagpieHallS() : void
      {
         var roomName:String;
         var _g:DungeonCore;
         clearOutput();
         get_images().showImage("stronghold-Antechamber");
         outputText("不，一定有更好的办法。");
         if(!get_player().hasKeyItem("Laybans") && get_player().get_inte() >= 50)
         {
            outputText("恶魔本身肯定也无法免疫蛇怪的凝视——变暗的屏幕就是证明。那么，他们是如何与这些生物互动的呢？也许如果你继续四处寻找，可能会找到答案。");
         }
         outputText("[pg]你穿过拱门，回到了阴暗的前厅。");
         menu();
         _g = get_game().dungeons;
         roomName = "antechamber";
         addButton(1,"继续",function():void
         {
            _g.move(roomName);
         });
      }
      
      public function exitD3() : void
      {
         set_inRoomedDungeon(false);
         set_inRoomedDungeonResume(null);
         set_inRoomedDungeonName("");
         get_camp().returnToCampUseOneHour();
      }
      
      public function entranceRoomFunc() : Boolean
      {
         get_images().showImage("stronghold-Entrance-room");
         outputText("<b><u>入口房间</u></b>\n");
         outputText("这个洞穴内部潮湿阴暗，但有频繁使用的痕迹。你从泽塔兹那里得到的地图与这条蜿蜒通道的曲线完全吻合。毫无疑问，就是这里了，尽管他的地图在进入隧道不远处就结束了。要么他知道这是一条直线路径，要么他对这里的地形太熟悉了，觉得不值得写下来。你可以向东走，深入山中前往莉希丝的要塞，或者向西离开。");
         addButton(10,"离开",exitD3);
         return false;
      }
      
      public function enterD3() : void
      {
         get_game().dungeons.setDungeonButtons();
         menu();
         set_inRoomedDungeon(true);
         set_inRoomedDungeonResume(get_game().dungeons.resumeFromFight);
         set_inRoomedDungeonName("BasiliskCave");
         get_game().dungeons.move("entrance");
      }
      
      public function eggsAvailable() : int
      {
         var _loc1_:int = FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1252);
         var _loc2_:int = 0;
         if((_loc1_ & BLACK) == 0)
         {
            _loc2_++;
         }
         if((_loc1_ & BLUE) == 0)
         {
            _loc2_++;
         }
         if((_loc1_ & WHITE) == 0)
         {
            _loc2_++;
         }
         if((_loc1_ & PINK) == 0)
         {
            _loc2_++;
         }
         if((_loc1_ & BROWN) == 0)
         {
            _loc2_++;
         }
         if((_loc1_ & PURPLE) == 0)
         {
            _loc2_++;
         }
         return _loc2_;
      }
      
      public function edgeofkeepRoomFunc() : Boolean
      {
         set_inRoomedDungeonName("LethicesKeep");
         get_images().showImage("stronghold-Edge-of-Keep");
         outputText("<b><u>要塞边缘</u></b>\n");
         outputText("站在山顶的边缘，你可以看到方圆数英里的玛瑞斯。由于荒芜地区的不断变移和扭曲，长时间注视会让人感到相当不安，但在这些短暂的地形中，你偶尔能挑出一些稳定的岛屿。你眨了眨眼睛，将这令人作呕的景色从视线中清除，然后转身看向前方的路。莉希丝的要塞就在北边不远处，城墙高大坚固。大门敞开着。她可能没想到有人能走到这里。");
         return false;
      }
      
      public function eastwalkRoomFunc() : Boolean
      {
         get_images().showImage("stronghold-walk-East");
         outputText("<b><u>东步道</u></b>\n");
         outputText("平滑、几乎完美铺设的石头在这里分成了一个T字路口，分别通向北、南和西。围绕在小路两旁的灌木丛也同样被分开，尽管它们得到了与你在花园其他地方看到的同样的精心维护。其中一株特别有趣的灌木被修剪成了一个巨大的半身像，甚至还有勃起的乳头。你摇了摇头，向西望去，你可以看到");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1248) == 0)
         {
            outputText("一座拿着巨大锤子的巨大雕像。");
         }
         else
         {
            outputText("一堆碎石，是你杀死的那个活动雕像散落的残骸。");
         }
         return false;
      }
      
      public function discoverD3() : void
      {
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,1239,1);
         clearOutput();
         get_images().showImage("stronghold-entrance");
         outputText("在探索过程中，你偶然发现了一块看起来很眼熟的空地。事实上……你拿出泽塔兹的地图，眼睛瞪得大大的，因为你意识到你刚刚发现了什么：莉希丝的要塞。你沿着一条隐蔽的小径，穿过几个鹰身女妖的巢穴，直接来到了一个几乎看不见的洞穴入口。如果没有地图，你绝对找不到它。");
         outputText("[pg]<b>你发现了莉希丝巢穴的隐藏入口。以后可以从地牢子菜单中进入。</b>");
         outputText("[pg]你是要进去，还是等到准备更充分时再来？");
         menu();
         addButton(0,"进入",enterD3);
         addButton(1,"离开",get_camp().returnToCampUseOneHour);
      }
      
      public function courtyardsquareRoomFunc() : Boolean
      {
         get_images().showImage("stronghold-courtyard-square");
         outputText("<b><u>庭院广场</u></b>\n");
         outputText("一圈抛光的石头环绕着庭院中央的一个巨像，周围是一圈带垫子的长椅，如果不是上面沾满了各种颜色和性别的体液，坐在上面一定很舒服。你没想到会有粉红色的精液，但恶魔们无尽的性创造力似乎不受这种观念的束缚。你可以从这里向东和向西离开。");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1248) == 0)
         {
            outputText("[pg]等等……那是什么？");
            menu();
            addButton(0,"继续",livingStatue.encounter);
            return true;
         }
         outputText("两只脱离身体的大理石脚和一片废墟，就是曾经矗立在庭院中央那座骄傲雕像的全部遗迹。你解决了那个活动的怪物，但对你如此公然造成的破坏还是感到有些羞愧。许多灌木丛被两吨重的石板撕成两半，小路上到处都是碎片和砸出的凹坑，伤痕累累。如果你小心翼翼地绕过那些更尖锐的石头碎片，你可以从这里向东和向西走。");
         return false;
      }
      
      public function configureRooms() : void
      {
         var _loc1_:IMap = get_game().dungeons.rooms;
         var _loc2_:Room = new Room();
         _loc2_.RoomName = "entrance";
         _loc2_.EastExit = "tunnel1";
         _loc2_.RoomFunction = entranceRoomFunc;
         var _loc3_:String = _loc2_.RoomName;
         if(_loc3_ in StringMap.reserved)
         {
            _loc1_.setReserved(_loc3_,_loc2_);
         }
         else
         {
            _loc1_.h[_loc3_] = _loc2_;
         }
         _loc2_ = new Room();
         _loc2_.RoomName = "tunnel1";
         _loc2_.NorthExit = "antechamber";
         _loc2_.WestExit = "entrance";
         _loc2_.RoomFunction = tunnel1RoomFunc;
         _loc3_ = _loc2_.RoomName;
         if(_loc3_ in StringMap.reserved)
         {
            _loc1_.setReserved(_loc3_,_loc2_);
         }
         else
         {
            _loc1_.h[_loc3_] = _loc2_;
         }
         _loc2_ = new Room();
         _loc2_.RoomName = "antechamber";
         _loc2_.NorthExit = "magpiehalls";
         _loc2_.EastExit = "roomofmirrors";
         _loc2_.SouthExit = "tunnel1";
         _loc2_.RoomFunction = antechamberRoomFunc;
         _loc3_ = _loc2_.RoomName;
         if(_loc3_ in StringMap.reserved)
         {
            _loc1_.setReserved(_loc3_,_loc2_);
         }
         else
         {
            _loc1_.h[_loc3_] = _loc2_;
         }
         _loc2_ = new Room();
         _loc2_.RoomName = "roomofmirrors";
         _loc2_.WestExit = "antechamber";
         _loc2_.RoomFunction = roomofmirrorsRoomFunc;
         _loc3_ = _loc2_.RoomName;
         if(_loc3_ in StringMap.reserved)
         {
            _loc1_.setReserved(_loc3_,_loc2_);
         }
         else
         {
            _loc1_.h[_loc3_] = _loc2_;
         }
         _loc2_ = new Room();
         _loc2_.RoomName = "magpiehalls";
         _loc2_.NorthExit = "tunnel2";
         _loc2_.SouthExit = "antechamber";
         _loc2_.RoomFunction = magpiehallsRoomFunc;
         _loc3_ = _loc2_.RoomName;
         if(_loc3_ in StringMap.reserved)
         {
            _loc1_.setReserved(_loc3_,_loc2_);
         }
         else
         {
            _loc1_.h[_loc3_] = _loc2_;
         }
         _loc2_ = new Room();
         _loc2_.RoomName = "magpiehalln";
         _loc2_.NorthExit = "tunnel2";
         _loc2_.SouthExit = "antechamber";
         _loc2_.RoomFunction = magpiehallnRoomFunc;
         _loc3_ = _loc2_.RoomName;
         if(_loc3_ in StringMap.reserved)
         {
            _loc1_.setReserved(_loc3_,_loc2_);
         }
         else
         {
            _loc1_.h[_loc3_] = _loc2_;
         }
         _loc2_ = new Room();
         _loc2_.RoomName = "tunnel2";
         _loc2_.EastExit = "edgeofkeep";
         _loc2_.SouthExit = "magpiehalln";
         _loc2_.RoomFunction = tunnel2RoomFunc;
         _loc3_ = _loc2_.RoomName;
         if(_loc3_ in StringMap.reserved)
         {
            _loc1_.setReserved(_loc3_,_loc2_);
         }
         else
         {
            _loc1_.h[_loc3_] = _loc2_;
         }
         _loc2_ = new Room();
         _loc2_.RoomName = "edgeofkeep";
         _loc2_.NorthExit = "northentry";
         _loc2_.WestExit = "tunnel2";
         _loc2_.RoomFunction = edgeofkeepRoomFunc;
         _loc3_ = _loc2_.RoomName;
         if(_loc3_ in StringMap.reserved)
         {
            _loc1_.setReserved(_loc3_,_loc2_);
         }
         else
         {
            _loc1_.h[_loc3_] = _loc2_;
         }
         _loc2_ = new Room();
         _loc2_.RoomName = "northentry";
         _loc2_.NorthExit = "southcourtyard";
         _loc2_.SouthExit = "edgeofkeep";
         _loc2_.RoomFunction = northentryRoomFunc;
         _loc3_ = _loc2_.RoomName;
         if(_loc3_ in StringMap.reserved)
         {
            _loc1_.setReserved(_loc3_,_loc2_);
         }
         else
         {
            _loc1_.h[_loc3_] = _loc2_;
         }
         _loc2_ = new Room();
         _loc2_.RoomName = "southcourtyard";
         _loc2_.SouthExit = "northentry";
         _loc2_.EastExit = "southeastcourtyard";
         _loc2_.WestExit = "southwestcourtyard";
         _loc2_.RoomFunction = southcourtyardRoomFunc;
         _loc3_ = _loc2_.RoomName;
         if(_loc3_ in StringMap.reserved)
         {
            _loc1_.setReserved(_loc3_,_loc2_);
         }
         else
         {
            _loc1_.h[_loc3_] = _loc2_;
         }
         _loc2_ = new Room();
         _loc2_.RoomName = "southwestcourtyard";
         _loc2_.EastExit = "southcourtyard";
         _loc2_.NorthExit = "southwestwalk";
         _loc2_.RoomFunction = southwestcourtyardRoomFunc;
         _loc3_ = _loc2_.RoomName;
         if(_loc3_ in StringMap.reserved)
         {
            _loc1_.setReserved(_loc3_,_loc2_);
         }
         else
         {
            _loc1_.h[_loc3_] = _loc2_;
         }
         _loc2_ = new Room();
         _loc2_.RoomName = "southwestwalk";
         _loc2_.NorthExit = "westwalk";
         _loc2_.SouthExit = "southwestcourtyard";
         _loc2_.RoomFunction = southwestwalkRoomFunc;
         _loc3_ = _loc2_.RoomName;
         if(_loc3_ in StringMap.reserved)
         {
            _loc1_.setReserved(_loc3_,_loc2_);
         }
         else
         {
            _loc1_.h[_loc3_] = _loc2_;
         }
         _loc2_ = new Room();
         _loc2_.RoomName = "westwalk";
         _loc2_.NorthExit = "northwestwalk";
         _loc2_.EastExit = "courtyardsquare";
         _loc2_.SouthExit = "southwestwalk";
         _loc2_.RoomFunction = westwalkRoomFunc;
         _loc3_ = _loc2_.RoomName;
         if(_loc3_ in StringMap.reserved)
         {
            _loc1_.setReserved(_loc3_,_loc2_);
         }
         else
         {
            _loc1_.h[_loc3_] = _loc2_;
         }
         _loc2_ = new Room();
         _loc2_.RoomName = "northwestwalk";
         _loc2_.NorthExit = "northwestcourtyard";
         _loc2_.SouthExit = "westwalk";
         _loc2_.RoomFunction = northwestwalkRoomFunc;
         _loc3_ = _loc2_.RoomName;
         if(_loc3_ in StringMap.reserved)
         {
            _loc1_.setReserved(_loc3_,_loc2_);
         }
         else
         {
            _loc1_.h[_loc3_] = _loc2_;
         }
         _loc2_ = new Room();
         _loc2_.RoomName = "northwestcourtyard";
         _loc2_.EastExit = "northcourtyard";
         _loc2_.SouthExit = "northwestwalk";
         _loc2_.RoomFunction = northwestcourtyardRoomFunc;
         _loc3_ = _loc2_.RoomName;
         if(_loc3_ in StringMap.reserved)
         {
            _loc1_.setReserved(_loc3_,_loc2_);
         }
         else
         {
            _loc1_.h[_loc3_] = _loc2_;
         }
         _loc2_ = new Room();
         _loc2_.RoomName = "northcourtyard";
         _loc2_.EastExit = "northeastcourtyard";
         _loc2_.WestExit = "northwestcourtyard";
         _loc2_.NorthExit = "throneroom";
         _loc2_.NorthExitCondition = unlockedThroneRoom;
         _loc2_.RoomFunction = northcourtyardRoomFunc;
         _loc3_ = _loc2_.RoomName;
         if(_loc3_ in StringMap.reserved)
         {
            _loc1_.setReserved(_loc3_,_loc2_);
         }
         else
         {
            _loc1_.h[_loc3_] = _loc2_;
         }
         _loc2_ = new Room();
         _loc2_.RoomName = "northeastcourtyard";
         _loc2_.SouthExit = "northeastwalk";
         _loc2_.WestExit = "northcourtyard";
         _loc2_.RoomFunction = northeastcourtyardRoomFunc;
         _loc3_ = _loc2_.RoomName;
         if(_loc3_ in StringMap.reserved)
         {
            _loc1_.setReserved(_loc3_,_loc2_);
         }
         else
         {
            _loc1_.h[_loc3_] = _loc2_;
         }
         _loc2_ = new Room();
         _loc2_.RoomName = "northeastwalk";
         _loc2_.NorthExit = "northeastcourtyard";
         _loc2_.SouthExit = "eastwalk";
         _loc2_.RoomFunction = northeastwalkRoomFunc;
         _loc3_ = _loc2_.RoomName;
         if(_loc3_ in StringMap.reserved)
         {
            _loc1_.setReserved(_loc3_,_loc2_);
         }
         else
         {
            _loc1_.h[_loc3_] = _loc2_;
         }
         _loc2_ = new Room();
         _loc2_.RoomName = "eastwalk";
         _loc2_.NorthExit = "northeastwalk";
         _loc2_.SouthExit = "southeastwalk";
         _loc2_.WestExit = "courtyardsquare";
         _loc2_.RoomFunction = eastwalkRoomFunc;
         _loc3_ = _loc2_.RoomName;
         if(_loc3_ in StringMap.reserved)
         {
            _loc1_.setReserved(_loc3_,_loc2_);
         }
         else
         {
            _loc1_.h[_loc3_] = _loc2_;
         }
         _loc2_ = new Room();
         _loc2_.RoomName = "southeastwalk";
         _loc2_.NorthExit = "eastwalk";
         _loc2_.SouthExit = "southeastcourtyard";
         _loc2_.RoomFunction = southeastwalkRoomFunc;
         _loc3_ = _loc2_.RoomName;
         if(_loc3_ in StringMap.reserved)
         {
            _loc1_.setReserved(_loc3_,_loc2_);
         }
         else
         {
            _loc1_.h[_loc3_] = _loc2_;
         }
         _loc2_ = new Room();
         _loc2_.RoomName = "southeastcourtyard";
         _loc2_.NorthExit = "southeastwalk";
         _loc2_.SouthExit = "greatlift";
         _loc2_.WestExit = "southcourtyard";
         _loc2_.RoomFunction = southeastcourtyardRoomFunc;
         _loc3_ = _loc2_.RoomName;
         if(_loc3_ in StringMap.reserved)
         {
            _loc1_.setReserved(_loc3_,_loc2_);
         }
         else
         {
            _loc1_.h[_loc3_] = _loc2_;
         }
         _loc2_ = new Room();
         _loc2_.RoomName = "courtyardsquare";
         _loc2_.EastExit = "eastwalk";
         _loc2_.WestExit = "westwalk";
         _loc2_.RoomFunction = courtyardsquareRoomFunc;
         _loc3_ = _loc2_.RoomName;
         if(_loc3_ in StringMap.reserved)
         {
            _loc1_.setReserved(_loc3_,_loc2_);
         }
         else
         {
            _loc1_.h[_loc3_] = _loc2_;
         }
         _loc2_ = new Room();
         _loc2_.RoomName = "greatlift";
         _loc2_.NorthExit = "southeastcourtyard";
         _loc2_.RoomFunction = greatliftRoomFunc;
         _loc3_ = _loc2_.RoomName;
         if(_loc3_ in StringMap.reserved)
         {
            _loc1_.setReserved(_loc3_,_loc2_);
         }
         else
         {
            _loc1_.h[_loc3_] = _loc2_;
         }
         _loc2_ = new Room();
         _loc2_.RoomName = "throneroom";
         _loc2_.SouthExit = "northcourtyard";
         _loc2_.RoomFunction = throneRoomFunc;
         _loc3_ = _loc2_.RoomName;
         if(_loc3_ in StringMap.reserved)
         {
            _loc1_.setReserved(_loc3_,_loc2_);
         }
         else
         {
            _loc1_.h[_loc3_] = _loc2_;
         }
      }
      
      public function antechamberRoomFunc() : Boolean
      {
         get_images().showImage("stronghold-Antechamber");
         outputText("<b><u>前厅</u></b>\n");
         outputText("你站在一个宽敞阴暗的大厅里，煤气灯发出沉闷的黄色光芒。墙壁、地板和远处的拱顶都是由一种深色、陈旧的石头统一建造的，尽管空间很大，但这种石头让这个像金库一样的空间显得阴暗压抑。多年的使用使地板被磨得像暗淡的青铜一样光滑，远处传来的活动声弥漫在空气中；这里的气氛就像高峰时段挤满人的地方，但现在却像上课时的学校走廊一样空无一人。也许值得庆幸，但你得赶紧行动了。");
         outputText("[pg]前面是一个大拱门。透过它，你可以看到墙上镶嵌着某种黑色的屏幕。右边是一扇小得多的金属门，看起来像是一个储藏室。");
         return false;
      }
   }
}

