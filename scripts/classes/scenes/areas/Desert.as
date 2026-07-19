package classes.scenes.areas
{
   import classes.BaseContent;
   import classes.CoC;
   import classes.DebugMenu;
   import classes.DynStat;
   import classes.ImageManager;
   import classes.Player;
   import classes.SelfDebug;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.internals.GuiOutput;
   import classes.internals.Utils;
   import classes.internals._OneOf.OneOf_Impl_;
   import classes.items.Jewelry;
   import classes.items.JewelryLib;
   import classes.items.UndergarmentLib;
   import classes.items.WeaponLib;
   import classes.saves.SelfSaver;
   import classes.saves.SelfSaving;
   import classes.scenes.Camp;
   import classes.scenes.CommonEncounters;
   import classes.scenes.Inventory;
   import classes.scenes.api.Encounter;
   import classes.scenes.api.EncounterDef;
   import classes.scenes.api.Encounters;
   import classes.scenes.api.FnHelpers;
   import classes.scenes.api.IExplorable;
   import classes.scenes.api._Encounters.EncounterChance_Impl_;
   import classes.scenes.api._Encounters.EncounterOrDef_Impl_;
   import classes.scenes.areas._Desert.SaveContent;
   import classes.scenes.areas.desert.AntsScene;
   import classes.scenes.areas.desert.GhoulScene;
   import classes.scenes.areas.desert.NagaScene;
   import classes.scenes.areas.desert.Oasis;
   import classes.scenes.areas.desert.OasisShamanScene;
   import classes.scenes.areas.desert.SandTrapScene;
   import classes.scenes.areas.desert.SandWitchScene;
   import classes.scenes.areas.desert.ScorpionScene;
   import classes.scenes.areas.desert.Wanderer;
   import flash.Boot;
   import haxe.IMap;
   import haxe.ds.Either;
   
   public class Desert extends BaseContent implements SelfDebug, SelfSaving, IExplorable
   {
      
      public var wanderer:Wanderer;
      
      public var scorpion:ScorpionScene;
      
      public var saveVersion:int;
      
      public var saveName:String;
      
      public var saveContent:SaveContent;
      
      public var sandWitchScene:SandWitchScene;
      
      public var sandTrapScene:SandTrapScene;
      
      public var oasisShamanScene:OasisShamanScene;
      
      public var oasis:Oasis;
      
      public var nagaScene:NagaScene;
      
      public var globalSave:Boolean;
      
      public var ghoulScene:GhoulScene;
      
      public var antsScene:AntsScene;
      
      public var _desertEncounter:Encounter;
      
      public function Desert(param1:GuiOutput = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         globalSave = false;
         saveVersion = 1;
         saveName = "desert";
         saveContent = new SaveContent(null);
         _desertEncounter = null;
         scorpion = new ScorpionScene();
         wanderer = new Wanderer();
         ghoulScene = new GhoulScene();
         sandWitchScene = new SandWitchScene();
         oasisShamanScene = new OasisShamanScene();
         oasis = new Oasis();
         nagaScene = new NagaScene();
         antsScene = new AntsScene();
         super();
         sandTrapScene = new SandTrapScene(param1);
         SelfSaver.register(this);
         DebugMenu.register(this);
      }
      
      public function wstaffEncounter() : void
      {
         clearOutput();
         get_images().showImage("item-wStaff");
         outputText("在沙漠中探索时，你看到远处升起一缕青烟。你改变方向，小心翼翼地靠近那团烟雾。花了一点时间，但在翻过第四座沙丘后，你找到了源头。你压低身子，以免被发现，并爬得更近以便看个清楚。[pg]");
         outputText("一座图书馆正在燃烧，火焰直冲几十英尺的高空。看起来没有任何书能幸存下来，大部分建筑已经被贪婪的火焰吞噬。引发这场地狱之火的罪魁祸首正蜷缩在旁边。是一个娜迦！对娜迦来说她很高，如果完全站直至少有七英尺。她紫蓝色的皮肤看起来颇具异国情调，头上还戴着一朵花。这个娜迦正拿着一根末端插着土豆的棍子，试图在图书馆的火堆上烤土豆。看起来进展并不顺利，土豆很快就被高温点燃了。[pg]");
         outputText("蛇女扔掉烤焦的土豆，喊道：[say: 哎呀哎呀。] 她突然转过身，直勾勾地看着你。她的目光锐利而专注，但在你反应过来之前就消失了。她曾经存在过的唯一证明，就是沙地里那个燃烧的土豆。你的好奇心战胜了谨慎，你走近那熊熊燃烧的废墟。沙地上甚至没有留下任何痕迹，而图书馆很快就会变成一堆无法挽救的残骸。也许唯一值得考虑的物品就是那根插着燃烧土豆的棍子。它的形状非常奇特，当你伸手去触摸它时，你能感觉到一阵共鸣的刺痛。也许这是某种巫师的法杖？[pg]");
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,101,FlagDict_Impl_.arrayReadInt(_loc1_,101) + 1);
         get_inventory().takeItem(get_weapons().W_STAFF,get_camp().returnToCampUseOneHour);
      }
      
      public function walkingDesertStatBoost() : void
      {
         clearOutput();
         get_images().showImage("area-desert");
         outputText("你在流沙中[walk]了一个小时，什么也没找到。[pg]");
         if(Utils.rand(2) == 0)
         {
            if(Utils.rand(2) == 0 && get_player().get_str100() < 50)
            {
               outputText("在不稳的立足点上挣扎的努力让你变得更强壮了。");
               dynStats(DynStat.Str(0.5));
            }
            else if(get_player().get_tou100() < 50)
            {
               outputText("在不稳的立足点上挣扎的努力让你变得更坚韧了。");
               dynStats(DynStat.Tou(0.5));
            }
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function saveToObject() : Object
      {
         return saveContent;
      }
      
      public function sandWitchPregnancyEvent() : void
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,589) == 15)
         {
            sandWitchScene.sammitchBirthsDriders();
         }
         else
         {
            sandWitchScene.witchBirfsSomeBees();
         }
      }
      
      public function reset() : void
      {
         saveContent.foundMirage = false;
      }
      
      public function onAscend(param1:Boolean) : void
      {
         reset();
      }
      
      public function nailsEncounter() : void
      {
         clearOutput();
         get_images().showImage("item-nails");
         outputText("在探索沙漠时，你发现了一栋建筑的废墟。从残骸来看，这是被大火烧毁的图书馆的遗迹。[pg]");
         outputText("你绕着废墟转了好一会儿，似乎找不到任何可以打捞的东西，直到有什么闪闪发光的东西引起了你的注意。有一些暴露在外的钉子，看起来可以回收利用。[pg]");
         outputText("你从工具箱里拿出锤子，花了一些时间拔出直钉。你拔出的大部分钉子都弯曲了，但有些钉子的状况却出奇地好。你可以用这些钉子来搞建筑。[pg]");
         var _loc1_:int = 5 + Utils.rand(get_player().get_inte() / 5) + Utils.rand(get_player().get_str() / 10) + Utils.rand(get_player().get_tou() / 10) + Utils.rand(get_player().get_spe() / 20) + 5;
         var _loc2_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc2_,2103,FlagDict_Impl_.arrayReadInt(_loc2_,2103) + _loc1_);
         get_player().addKeyValue("Carpenter\'s Toolbox",1,_loc1_);
         outputText("在花了将近一个小时的搜寻后，你成功拔出了 " + _loc1_ + " 根钉子。[pg]");
         if(get_player().keyItemv1("Carpenter\'s Toolbox") > get_camp().cabinProgress.maxNailSupply())
         {
            get_player().addKeyValue("Carpenter\'s Toolbox",1,-(get_player().keyItemv1("Carpenter\'s Toolbox") - get_camp().cabinProgress.maxNailSupply()));
         }
         outputText("钉子: " + get_player().keyItemv1("Carpenter\'s Toolbox") + "/" + get_camp().cabinProgress.maxNailSupply());
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function mirageOneoff() : void
      {
         saveContent.foundMirage = true;
         clearOutput();
         outputText("你在沙漠中跋涉了一段时间，突然意识到自己离世界的其他地方有多么遥远。沙地似乎在你面前无尽地延伸，广阔的区域只被几座零星的沙丘和灌木丛打破。这里没有任何东西可以遮挡太阳无情的暴晒。");
         outputText("[pg]你的[if (istaur) {结实的身体非常适合旅行，你的[legs]一点也没有感到疲倦|[if (isnaga) {滑行的尾巴似乎特别适合在沙地中穿梭|[if (tou > 30) {耐力极大地帮助你抵御了这种环境|精神支撑着你}]}]}]，但旅程依然漫长。在干燥的酷热中，你的头隐隐作痛，你发现自己希望能够找到片刻的喘息之机，任何能让你的头凉快一下的东西都行。你模糊的思绪飘向了为什么这个地区会变成这样的原因[if (silly) {——这简直就像有人把所有的雨水都困在了遥远的地方，但你很快意识到这听起来有多荒谬|，但你没有得出任何确切的结论}]。");
         outputText("[pg]仿佛变魔术一般，你突然看到远处有一片绿色的海洋，从沙丘后面探出头来。你揉了揉眼睛，但它依然在那里，你甚至觉得能看到中间有一抹神圣的蓝色，让你干渴的喉咙不由自主地咽了口口水。你毫不犹豫地向前冲去，爬上山丘，在顶部[if (spe > 30) {稍微|完全}]失去了平衡，[if (spe > 30) {滑|滚}]下了另一边。但当你恢复方向感时，视野中却没有任何绿色。");
         outputText("[pg]你再次环顾四周，但看到的只有沙子。那是海市蜃楼吗？你一边爬起来继续前进，一边在心里默默咒骂，确信回营地的路将会非常疲惫。");
         outputText("[pg]看来这片沙漠比你想象的还要危险。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function mirageDesert() : void
      {
         clearOutput();
         get_images().showImage("dungeon-entrance-phoenixtower");
         outputText("在沙漠中探索时，你看到远处有一座闪闪发光的塔。当你冲向它时，它却完全消失了。那是海市蜃楼！你叹了口气，为浪费了时间而感到沮丧。");
         dynStats(DynStat.Lust(-15));
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function load(param1:int, param2:*) : void
      {
         Utils.extend(saveContent,param2);
      }
      
      public function isDiscovered() : Boolean
      {
         return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2299) > 0;
      }
      
      public function get_desertEncounter() : Encounter
      {
         var fn:FnHelpers;
         var _gthis:Desert;
         var _loc1_:* = null as CommonEncounters;
         var _loc2_:* = null as Either;
         var _loc3_:* = null as Object;
         var _loc4_:* = null as Encounter;
         var _loc5_:* = null as Encounter;
         var _loc6_:* = null as Encounter;
         var _loc7_:* = null as Encounter;
         var _loc8_:* = null as Encounter;
         var _loc9_:* = null as Encounter;
         var _loc10_:* = null as Encounter;
         var _loc11_:* = null as Object;
         var _loc12_:* = null as Encounter;
         var _loc13_:* = null as Object;
         var _loc14_:* = null as Encounter;
         var _loc15_:* = null as Encounter;
         var _loc16_:* = null as Encounter;
         var _loc17_:* = null as Encounter;
         var _loc18_:* = null as Encounter;
         var _loc19_:* = null as Either;
         var _loc20_:* = null as Object;
         _gthis = this;
         fn = Encounters.fn;
         if(_desertEncounter == null)
         {
            _loc1_ = get_game().commonEncounters;
            _loc2_ = OneOf_Impl_.fromA(get_game().exploration.mermaidWalk);
            _loc3_ = EncounterChance_Impl_.fromBoolFun(function():Boolean
            {
               if(!_gthis.get_game().exploration.doneMermaidWalk && _gthis.get_player().isFullMermaid())
               {
                  return _gthis.get_player().get_jewelry().get_id() != _gthis.get_jewelries().AQUARING.get_id();
               }
               return false;
            });
            _loc4_ = EncounterOrDef_Impl_.fromDef(new EncounterDef("mermaidExplore",EncounterChance_Impl_.fromFloatConst(Encounters.ALWAYS),_loc3_,_loc2_,null));
            _loc5_ = EncounterOrDef_Impl_.fromDef(new EncounterDef("naga",null,null,OneOf_Impl_.fromA(nagaScene.nagaEncounter),null));
            _loc6_ = EncounterOrDef_Impl_.fromDef(new EncounterDef("sandtrap",EncounterChance_Impl_.fromFloatConst(0.5),null,OneOf_Impl_.fromA(sandTrapScene.encounterASandTrap),null));
            _loc7_ = EncounterOrDef_Impl_.fromDef(new EncounterDef("sandwitch",null,EncounterChance_Impl_.fromBoolFun(function():Boolean
            {
               return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,854) == 0;
            }),OneOf_Impl_.fromA(sandWitchScene.encounter),null));
            _loc8_ = EncounterOrDef_Impl_.fromDef(new EncounterDef("cumwitch",null,EncounterChance_Impl_.fromBoolFun(function():Boolean
            {
               return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,853) > 0;
            }),OneOf_Impl_.fromA(get_game().dungeons.desertcave.fightCumWitch),null));
            _loc9_ = EncounterOrDef_Impl_.fromDef(new EncounterDef("wanderer",EncounterChance_Impl_.fromFloatConst(0.5),null,OneOf_Impl_.fromA(wanderer.wandererRouter),null));
            _loc10_ = EncounterOrDef_Impl_.fromDef(new EncounterDef("sw_preg",null,EncounterChance_Impl_.fromBoolFun(function():Boolean
            {
               return _gthis.sandWitchScene.pregnancy.get_event() == 2;
            }),OneOf_Impl_.fromA(sandWitchPregnancyEvent),null));
            _loc11_ = fn.not(get_game().telAdre.isAllowedInto);
            _loc12_ = EncounterOrDef_Impl_.fromDef(new EncounterDef("teladre",EncounterChance_Impl_.fromFloatConst(0.5),_loc11_,OneOf_Impl_.fromA(get_game().telAdre.discoverTelAdre),null));
            _loc13_ = EncounterChance_Impl_.fromBoolFun(function():Boolean
            {
               if(fn.ifLevelMin(5) != null && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,875) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,467) == 0)
               {
                  return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,468) == 0;
               }
               return false;
            });
            _loc14_ = EncounterOrDef_Impl_.fromDef(new EncounterDef("ants",EncounterChance_Impl_.fromFloatConst(0.25),_loc13_,OneOf_Impl_.fromA(antsScene.antColonyEncounter),null));
            _loc15_ = EncounterOrDef_Impl_.fromDef(new EncounterDef("dungeon",null,EncounterChance_Impl_.fromBoolFun(function():Boolean
            {
               if(fn.ifLevelMin(4) != null || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2299) > 45)
               {
                  return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,856) == 0;
               }
               return false;
            }),OneOf_Impl_.fromA(get_game().dungeons.desertcave.enterDungeon),null));
            _loc16_ = EncounterOrDef_Impl_.fromDef(new EncounterDef("wstaff",null,EncounterChance_Impl_.fromBoolFun(function():Boolean
            {
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,101) == 0)
               {
                  return _gthis.get_player().get_inte100() > 50;
               }
               return false;
            }),OneOf_Impl_.fromA(wstaffEncounter),null));
            _loc17_ = EncounterOrDef_Impl_.fromDef(new EncounterDef("nails",null,EncounterChance_Impl_.fromBoolFun(function():Boolean
            {
               if(_gthis.get_player().hasKeyItem("Carpenter\'s Toolbox"))
               {
                  return _gthis.get_player().keyItemv1("Carpenter\'s Toolbox") < _gthis.get_camp().cabinProgress.maxNailSupply();
               }
               return false;
            }),OneOf_Impl_.fromA(nailsEncounter),null));
            _loc18_ = EncounterOrDef_Impl_.fromDef(new EncounterDef("chest",null,EncounterChance_Impl_.fromBoolFun(function():Boolean
            {
               return !_gthis.get_player().hasKeyItem("Camp - Chest");
            }),OneOf_Impl_.fromA(chestEncounter),null));
            _loc19_ = OneOf_Impl_.fromA(get_game().goblinSharpshooterScene.meetGoblinSharpshooter);
            _loc20_ = EncounterChance_Impl_.fromBoolFun(get_game().goblinSharpshooterScene.encounterWhen);
            _desertEncounter = Encounters.group("desert",_loc1_,_loc4_,_loc5_,_loc6_,_loc7_,_loc8_,_loc9_,_loc10_,_loc12_,_loc14_,_loc15_,_loc16_,_loc17_,_loc18_,EncounterOrDef_Impl_.fromDef(new EncounterDef("goblinSharpshooter",get_game().goblinSharpshooterScene.encounterChance,_loc20_,_loc19_,null)),EncounterOrDef_Impl_.fromDef(new EncounterDef("bigjunk",get_game().commonEncounters.bigJunkChance,null,OneOf_Impl_.fromA(get_game().commonEncounters.bigJunkDesertScene),null)),EncounterOrDef_Impl_.fromDef(new EncounterDef("exgartuan",EncounterChance_Impl_.fromFloatConst(0.25),EncounterChance_Impl_.fromBoolFun(function():Boolean
            {
               return _gthis.get_silly();
            }),OneOf_Impl_.fromA(get_game().exgartuan.fountainEncounter),null)),EncounterOrDef_Impl_.fromDef(new EncounterDef("mirage",EncounterChance_Impl_.fromFloatConst(0.25),fn.ifLevelMin(2),OneOf_Impl_.fromA(mirageDesert),null)),EncounterOrDef_Impl_.fromDef(new EncounterDef("oasis",EncounterChance_Impl_.fromFloatConst(0.25),fn.ifLevelMin(2),OneOf_Impl_.fromA(oasis.oasisEncounter),null)),scorpion,EncounterOrDef_Impl_.fromDef(new EncounterDef("walk",EncounterChance_Impl_.fromFloatConst(0.1),null,OneOf_Impl_.fromA(walkingDesertStatBoost),null)),EncounterOrDef_Impl_.fromDef(new EncounterDef("mirage",EncounterChance_Impl_.fromFloatConst(0.1),EncounterChance_Impl_.fromBoolFun(function():Boolean
            {
               return !_gthis.saveContent.foundMirage;
            }),OneOf_Impl_.fromA(mirageOneoff),null)),EncounterOrDef_Impl_.fromDef(new EncounterDef("oasisShaman",null,EncounterChance_Impl_.fromBoolFun(function():Boolean
            {
               if(!_gthis.oasisShamanScene.saveContent.didEncounter && _gthis.get_player().isFullMermaid())
               {
                  return _gthis.get_undergarments().SEA_SHIRT.wearingEnchanted();
               }
               return false;
            }),OneOf_Impl_.fromA(oasisShamanScene.oasisShamanEncounter),null)));
         }
         return _desertEncounter;
      }
      
      public function get_debugName() : String
      {
         return "Desert";
      }
      
      public function get_debugHint() : String
      {
         return "";
      }
      
      public function explore() : void
      {
         clearOutput();
         get_player().location = "沙漠";
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,2299,FlagDict_Impl_.arrayReadInt(_loc1_,2299) + 1);
         get_desertEncounter().execEncounter();
      }
      
      public function discover() : void
      {
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2299,1);
         get_images().showImage("area-desert");
         outputText("脚下的地面微微晃动，让你踉跄了一下。你沮丧地呻吟着直起身子，发现了粗糙的沙子感觉");
         if(get_player().lowerBody.type == 0)
         {
            outputText("在你的鞋子里，脚趾之间");
         }
         else if(get_player().lowerBody.type == 1)
         {
            outputText("在你的蹄子里");
         }
         else if(get_player().lowerBody.type == 2)
         {
            outputText("在你的爪子里");
         }
         else if(get_player().lowerBody.type == 3)
         {
            outputText("在你的鳞片里");
         }
         outputText("。");
         outputText("[pg]<b>你发现了沙漠！</b>");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function debugMenu(param1:Boolean = true) : void
      {
         get_game().debugMenu.debugCompEdit(saveContent,new SaveContent(null));
      }
      
      public function chestEncounter() : void
      {
         clearOutput();
         get_images().showImage("item-chest");
         outputText("在沙漠无迹的沙地上漫步时，你突然被一声响亮的“咚”声打破了寂静的单调。你低头一看，发现自己正踩在一个旧箱子的盖子上，它不知怎么地完好无损地埋在沙子里。在好奇心的驱使下，你把它挖了出来，却发现里面是空的。你觉得它会是你营地的一个不错的补充，于是开始把箱子拖回去。");
         get_player().createKeyItem("Camp - Chest",0,0,0,0);
         outputText("[pg]<b>获得关键物品：箱子！</b>");
         outputText("\n<b>你现在在营地有 " + Utils.num2Text(get_inventory().fixStorage()) + " 个物品存储槽。</b>");
         doNext(get_camp().returnToCampUseOneHour);
      }
   }
}

