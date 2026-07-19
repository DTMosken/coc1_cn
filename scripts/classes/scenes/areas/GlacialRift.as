package classes.scenes.areas
{
   import classes.BaseContent;
   import classes.CoC;
   import classes.DynStat;
   import classes.ImageManager;
   import classes.Player;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.display.SpriteDb;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.internals._OneOf.OneOf_Impl_;
   import classes.items.Armor;
   import classes.items.ArmorLib;
   import classes.items.ConsumableLib;
   import classes.items.Weapon;
   import classes.scenes.Camp;
   import classes.scenes.CommonEncounters;
   import classes.scenes.Inventory;
   import classes.scenes.api.Encounter;
   import classes.scenes.api.EncounterDef;
   import classes.scenes.api.Encounters;
   import classes.scenes.api.IExplorable;
   import classes.scenes.api._Encounters.EncounterChance_Impl_;
   import classes.scenes.api._Encounters.EncounterOrDef_Impl_;
   import classes.scenes.areas.glacialRift.Amarok;
   import classes.scenes.areas.glacialRift.AmarokScene;
   import classes.scenes.areas.glacialRift.FrostGiant;
   import classes.scenes.areas.glacialRift.FrostGiantScene;
   import classes.scenes.areas.glacialRift.MoraScene;
   import classes.scenes.areas.glacialRift.RiftCabinScene;
   import classes.scenes.areas.glacialRift.Valkyrie;
   import classes.scenes.areas.glacialRift.ValkyrieScene;
   import classes.scenes.areas.glacialRift.Yeti;
   import classes.scenes.areas.glacialRift.YetiScene;
   import classes.scenes.npcs.GooArmor;
   import classes.scenes.npcs.Valeria;
   import flash.Boot;
   import haxe.IMap;
   import haxe.ds.Either;
   
   public class GlacialRift extends BaseContent implements IExplorable
   {
      
      public var yetiScene:YetiScene;
      
      public var valkyrieScene:ValkyrieScene;
      
      public var riftCabinScene:RiftCabinScene;
      
      public var moraScene:MoraScene;
      
      public var giantScene:FrostGiantScene;
      
      public var amarokScene:AmarokScene;
      
      public var _explorationEncounter:Encounter;
      
      public function GlacialRift()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         _explorationEncounter = null;
         moraScene = new MoraScene();
         riftCabinScene = new RiftCabinScene();
         amarokScene = new AmarokScene();
         giantScene = new FrostGiantScene();
         yetiScene = new YetiScene();
         valkyrieScene = new ValkyrieScene();
         super();
      }
      
      public function yetiEncounter() : void
      {
         clearOutput();
         get_images().showImage("encounter-yeti");
         outputText("你在脚下坚硬的积雪中跋涉，渐渐感到疲惫。你用一只手臂遮住脸，狂风抽打着你，减缓了你的步伐。风的呼啸声在你耳边回荡，只有脚下积雪被压实的沉闷嘎吱声才能将其打破。你忍不住后悔闯入这场风暴，渴望能有避风港和温暖。听到一声响亮的断裂声，你的身体僵住了，你转过头去寻找声音的来源，却发现为时已晚，你的下半身正在陷入雪地中。当你的身体被移动的雪卷入地下时，你胡乱挥舞着四肢，感觉自己正沿着某种竖井向下滑落：四周太黑了，看不清要去哪里。伴随着“砰”的一声，你停了下来。[pg]");
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2061) <= 0)
         {
            outputText("你迅速拍掉身上的雪，打量着周围的环境。头顶上有火把提供着光亮和些许温暖，让这个冰洞看起来几乎有些美丽，光线在光滑的冰墙、天花板和巨大的冰柱上反射闪烁。这里有许多像你刚才掉出来的那个一样的洞口，就像一个滑道网络，全都通向你所在的位置。你惊讶地发现身下垫着东西，一大堆白色的毛皮缓冲了你的坠落。不过，当你发现冰洞两侧排列着大量骨头时，你感到有些不安，它们都像雪一样白，被清理得闪闪发光。综合这一切，很明显你是在某人或某种生物的住所里。");
            if(get_silly())
            {
               outputText("你注意到附近墙上挂着几具奇怪的、两足行走的马形生物的尸体，它们全身覆盖着厚厚的白毛；在其中一具尸体下面，放着一个奇怪的金属圆柱体，看起来有点像剑柄，散发着一种奇特而柔和的热量。");
            }
            outputText("你拍掉身上的雪站了起来，转过头时注意到了一条通道。[pg]");
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2061,1);
         }
         else
         {
            outputText("环顾四周熟悉的景象，你意识到自己肯定又从那些滑道掉下来了。你开始纳闷这些滑道究竟是给雪人用的，还是专门用来把毫无防备的旅行者送进来的。难道是它们用有限的冰雪魔法搞出来的外卖配送服务？你抖落身上的雪，站起身来。看向通道，果然，伴随着传入耳中的沉重脚步声，墙壁上舞动着阴影。[pg]");
         }
         outputText("听到一声雷鸣般的咆哮，你做好了战斗的准备");
         if(!get_player().get_weapon().isUnarmed())
         {
            outputText("，紧握你的[weapon]严阵以待");
         }
         outputText("。一个庞大笨重的生物从拐角处冲了出来，死死盯住了你。当你与这头野兽对峙时，它长满利爪的手脚轻松地带着它庞大的身躯跃过冰冷的洞穴。一团白色的模糊身影——一只冰雪人向你发起了攻击！");
         startCombat(new Yeti());
      }
      
      public function walk() : void
      {
         clearOutput();
         get_images().showImage("area-glacialrift");
         outputText("你花了一个小时在荒凉刺骨的冰川中跋涉，但什么有趣的东西也没找到。");
         dynStats(DynStat.Tou(-0.5),DynStat.Lust(-0.5));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function valkyrieEncounter() : void
      {
         clearOutput();
         get_images().showImage("encounter-valkyrie");
         outputText("走在裂谷坚硬的冰面上，你惊讶地看到头顶厚厚的灰色云层散开了。你看到一位美丽的女人从高处降落，她背后雪白的翅膀正有力地拍打着。她手持长矛和盾牌，身穿青铜胸甲，头戴带翼头盔，看起来完全就是一名强大的战士。[pg]");
         outputText("她在你面前几英尺处轻轻降落，举起盾牌和长矛。[say:流浪者，你似乎是个值得我测试身手的对手。准备好了！]她大喊着向你逼近。她看起来不打算退缩——你准备好你的[weapon]准备战斗！");
         startCombat(new Valkyrie());
      }
      
      public function valeriaAtRift() : void
      {
         var offCamp:Boolean;
         var _g:Valeria;
         clearOutput();
         spriteSelect(SpriteDb.get_s_valeria());
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2062,1);
         get_images().showImage("monster-gooarmor");
         outputText("当你在裂谷的冰冷边缘穿行时，你听到一阵金属的“哐当哐当”声穿过阵阵飞雪逼近。你转过身，及时看到一套板甲朝你冲来，它的头盔和四肢里充满了亮蓝色的粘液。它在几码外滑行停下，一把大剑从它手上的粘液中成型。一张美丽、女性化的脸出现在盔甲的面罩下，正对着你咧嘴笑。你突然认出了她的脸！[pg]");
         outputText("[say:这是我的地盘！]她喊道，举起了她的双手剑。[say:你要么把你的体液给我，要么我就自己来取。]");
         addButton(0,"战斗",fightValeria);
         _g = get_game().valeria;
         offCamp = true;
         addButton(1,"屈服",function():void
         {
            _g.pcWinsValeriaSparDefeat(offCamp);
         });
      }
      
      public function riftAprilFools() : void
      {
         get_images().showImage("event-dlc");
         get_game().aprilFools.DLCPrompt("极限区域 DLC","获取极限区域 DLC，即可访问冰川裂谷和火山岩，并探索其中的领域！","$4.99");
      }
      
      public function lootIcicle() : void
      {
         clearOutput();
         get_images().showImage("item-icicle");
         outputText("当你穿过构成裂谷主体的浮冰层时，你的目光被白色背景中闪烁的亮光所吸引。当你急切地靠近那道光芒时，你发现一根微小的冰柱从周围的雪地中突出。你轻轻地把它从地上拔出来，快速地瞥了一眼，确信它不会试图杀死你后，把它扔进了你的包里。");
         get_inventory().takeItem(get_consumables().ICICLE_,get_camp().returnToCampUseOneHour);
      }
      
      public function lootGodmead() : void
      {
         clearOutput();
         get_images().showImage("item-gMead");
         outputText("当你在冰原上穿行时，你注意到一个用软木塞塞住的象牙小角杯半埋在雪下，里面装满了看起来很甜的浓稠液体。你停下来把它挖出来，好奇地闻了闻里面的液体。这气味让你想起了玛瑞斯的蜂娘分泌的蜂蜜，不过带有一丝酒精和……其他东西的味道。你把这杯蜂蜜酒放进包里，继续上路。");
         get_inventory().takeItem(get_consumables().GODMEAD,get_camp().returnToCampUseOneHour);
      }
      
      public function isDiscovered() : Boolean
      {
         return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2059) > 0;
      }
      
      public function get_explorationEncounter() : Encounter
      {
         var _gthis:GlacialRift = this;
         if(_explorationEncounter != null)
         {
            return _explorationEncounter;
         }
         var _loc1_:CommonEncounters = get_game().commonEncounters;
         var _loc2_:Object = EncounterChance_Impl_.fromBoolFun(function():Boolean
         {
            if(_gthis.isAprilFools())
            {
               return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2210) == 0;
            }
            return false;
         });
         _explorationEncounter = Encounters.group("glacialrift",_loc1_,EncounterOrDef_Impl_.fromDef(new EncounterDef("愚人节",EncounterChance_Impl_.fromFloatConst(Encounters.ALWAYS),_loc2_,OneOf_Impl_.fromA(riftAprilFools),null)),EncounterOrDef_Impl_.fromDef(new EncounterDef("女武神",EncounterChance_Impl_.fromFloatConst(1),null,OneOf_Impl_.fromA(valkyrieEncounter),null)),EncounterOrDef_Impl_.fromDef(new EncounterDef("雪人",EncounterChance_Impl_.fromFloatConst(1),null,OneOf_Impl_.fromA(yetiEncounter),null)),EncounterOrDef_Impl_.fromDef(new EncounterDef("阿玛洛克",EncounterChance_Impl_.fromFloatConst(1),null,OneOf_Impl_.fromA(amarokEncounter),null)),EncounterOrDef_Impl_.fromDef(new EncounterDef("霜巨人",EncounterChance_Impl_.fromFloatConst(1),null,OneOf_Impl_.fromA(frostGiantEncounter),null)),EncounterOrDef_Impl_.fromDef(new EncounterDef("mora",EncounterChance_Impl_.fromFloatConst(1),null,OneOf_Impl_.fromA(moraScene.moraEncounter),null)),EncounterOrDef_Impl_.fromDef(new EncounterDef("valeria",null,EncounterChance_Impl_
         .fromBoolFun(function():Boolean
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,498) == 0 && _gthis.get_player().get_armor() != _gthis.get_armors().GOOARMR)
            {
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,494) == 0)
               {
                  return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,483) > 0;
               }
               return true;
            }
            return false;
         }),OneOf_Impl_.fromA(valeriaAtRift),null)),EncounterOrDef_Impl_.fromDef(new EncounterDef(null,EncounterChance_Impl_.fromFloatConst(0.3),null,OneOf_Impl_.fromB(Encounters.group("loot",EncounterOrDef_Impl_.fromDef(new EncounterDef(null,null,null,OneOf_Impl_.fromA(lootIcicle),null)),EncounterOrDef_Impl_.fromDef(new EncounterDef(null,null,null,OneOf_Impl_.fromA(lootGodmead),null)))),null)),EncounterOrDef_Impl_.fromDef(new EncounterDef("ornatechest",EncounterChance_Impl_.fromFloatConst(0.1),EncounterChance_Impl_.fromBoolFun(function():Boolean
         {
            return !_gthis.get_player().hasKeyItem("Camp - Ornate Chest");
         }),OneOf_Impl_.fromA(findChest),null)),riftCabinScene,EncounterOrDef_Impl_.fromDef(new EncounterDef("walk",null,null,OneOf_Impl_.fromA(walk),null)));
         return _explorationEncounter;
      }
      
      public function frostGiantEncounter() : void
      {
         clearOutput();
         get_images().showImage("area-glacialrift");
         outputText("你在裂谷的冰冻地貌中漫步，冰冻的岩石、结霜的丘陵和长满树木的山脉是你唯一的路标。当你越过一座树木稀疏的巨大山丘的顶峰时，你与一个霜巨人打了个照面！他凶狠地对你咆哮，你滚下了山丘。当你回过神来时，他几乎已经跨过了山丘。你迅速拔出你的[weapon]，从山丘上撤退，准备战斗。[pg]");
         startCombat(new FrostGiant());
      }
      
      public function findChest() : void
      {
         get_images().showImage("item-chest");
         var _loc1_:int = 400 + Utils.rand(400);
         outputText("在似乎无边无际的白雪中跋涉时，一阵风卷起了一个显眼的雪包，你注意到了一些有趣的东西。");
         outputText("[pg]当你靠近那个物体时，你辨认出那是一个装饰华丽的箱子，一半埋在雪和底层的冰中。在凿开永久冻土后，你把箱子挖了出来，并敲碎了铰链上的冰以打开它。在里面你发现了几个装满宝石的袋子，总共有可观的 " + ("" + _loc1_) + " 颗。");
         outputText("[pg]你觉得除了宝石，这个箱子也能派上用场，");
         if(get_player().get_str() < 50)
         {
            outputText("你开始在令人疲惫的雪地里拖着箱子——费了比你自尊心愿意承认的还要大的力气——回到你的营地。");
            get_player().changeFatigue(80);
            doNext(get_camp().returnToCampUseEightHours);
         }
         else if(get_player().get_str() > 50 && get_player().get_str() < 80)
         {
            outputText("你费了些力气，拖着箱子开始往回走。");
            get_player().changeFatigue(40);
            doNext(get_camp().returnToCampUseFourHours);
         }
         else
         {
            outputText("你毫不费力地开始把箱子拖回家。");
            get_player().changeFatigue(20);
            doNext(get_camp().returnToCampUseTwoHours);
         }
         get_player().createKeyItem("Camp - Ornate Chest",0,0,0,0);
         var _loc2_:Player = get_player();
         _loc2_.set_gems(_loc2_.get_gems() + _loc1_);
         statScreenRefresh();
         outputText("[pg]<b>你现在在营地有 " + Utils.num2Text(get_inventory().itemStorageSize()) + " 个物品存储槽。</b>");
      }
      
      public function fightValeria() : void
      {
         clearOutput();
         outputText("你准备好你的[weapon]准备战斗！");
         startCombat(new GooArmor());
      }
      
      public function explore() : void
      {
         clearOutput();
         get_player().location = "冰川裂谷";
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,2059,FlagDict_Impl_.arrayReadInt(_loc1_,2059) + 1);
         doNext(playerMenu);
         get_explorationEncounter().execEncounter();
      }
      
      public function discover() : void
      {
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2059,1);
         get_images().showImage("area-glacialrift");
         outputText("你走了一段时间，漫步在玛瑞斯恶魔界坚硬且略带粉色的土地上。随着你的前进，一阵凉风突然拂过你的脸颊，风力不断增强，直到你的衣服在狂风中疯狂地拍打着你的身体。每一阵风似乎都在夺走你的一部分力量，凉爽的微风已经变成了名副其实的北极狂风。你紧紧地抱住自己，尽管你不想这样，但还是剧烈地颤抖着，因为坚硬的粉色泥土慢慢变成了白色；很快，你踩在真正的雪地上，雪厚得让你每走一步都会踉跄。你突然停了下来，因为你面前的地面让位给了一片广阔的海洋，海洋的许多部分冻结成了比任何城市都大的巨大水晶岛屿。[pg]");
         outputText("<b>你发现了冰川裂谷！</b>");
         doNext(get_camp().returnToCampUseTwoHours);
      }
      
      public function amarokEncounter() : void
      {
         spriteSelect(SpriteDb.get_s_amarok());
         clearOutput();
         get_images().showImage("encounter-amarok");
         outputText("当你的双脚穿过贫瘠的苔原时，你无法摆脱被监视的感觉。你的偏执占了上风，你停下来倾听附近是否有动静。你什么也没听到。为了确定，你转过身，什么也没看到。你嘲笑自己的愚蠢，继续走着，现在一只手放在你的" + get_player().get_weaponName() + "上。仿佛是约定好的一样，你听到身后传来一声咆哮。你猛地转过身，用你的[weapon]攻击，勉强阻止了一只巨大的狼将你扑倒。在它黑色的皮毛和金色的眼睛之间，你不太确定你是怎么错过它的。不过这无关紧要——这只狼，绝对是一只阿玛洛克，已经恢复过来，正在准备下一次攻击。是时候战斗了！");
         startCombat(new Amarok());
      }
   }
}

