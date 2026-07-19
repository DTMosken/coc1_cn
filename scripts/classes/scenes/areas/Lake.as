package classes.scenes.areas
{
   import classes.BaseContent;
   import classes.CoC;
   import classes.DynStat;
   import classes.ImageManager;
   import classes.Player;
   import classes.StatusEffect;
   import classes.StatusEffects;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.internals.GuiOutput;
   import classes.internals._OneOf.OneOf_Impl_;
   import classes.items.ConsumableLib;
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
   import classes.scenes.areas.lake.CalluScene;
   import classes.scenes.areas.lake.CultistNunScene;
   import classes.scenes.areas.lake.FetishCultistScene;
   import classes.scenes.areas.lake.FetishZealotScene;
   import classes.scenes.areas.lake.GooGirlScene;
   import classes.scenes.areas.lake.GreenSlimeScene;
   import classes.scenes.areas.lake.SwordInStone;
   import classes.scenes.npcs.IzmaScene;
   import classes.scenes.npcs.Rathazul;
   import flash.Boot;
   import haxe.IMap;
   import haxe.ds.Either;
   
   public class Lake extends BaseContent implements IExplorable
   {
      
      public var swordInStone:SwordInStone;
      
      public var greenSlimeScene:GreenSlimeScene;
      
      public var gooGirlScene:GooGirlScene;
      
      public var fetishZealotScene:FetishZealotScene;
      
      public var fetishCultistScene:FetishCultistScene;
      
      public var cultistNunScene:CultistNunScene;
      
      public var calluScene:CalluScene;
      
      public var _exploreEncounter:Encounter;
      
      public function Lake(param1:GuiOutput = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         _exploreEncounter = null;
         cultistNunScene = new CultistNunScene();
         swordInStone = new SwordInStone();
         calluScene = new CalluScene();
         greenSlimeScene = new GreenSlimeScene();
         fetishZealotScene = new FetishZealotScene();
         fetishCultistScene = new FetishCultistScene();
         super();
         gooGirlScene = new GooGirlScene(param1);
      }
      
      public function lakeWalk() : void
      {
         if(get_player().level < 2 || get_player().get_spe100() < 50)
         {
            clearOutput();
            get_images().showImage("area-lake");
            outputText("沿着湖岸快步走感觉很好。");
            if(get_player().get_spe100() < 50)
            {
               outputText("你确信下次能以更快的速度走完同样的距离。[pg]");
               dynStats(DynStat.Spe(0.75));
            }
         }
         else
         {
            clearOutput();
            get_images().showImage("area-lake");
            outputText("你在湖边的漫步让你越来越觉得无聊，思绪开始飘忽不定。");
            if(get_player().cor >= 60 || get_player().get_lust100() >= 90 || get_player().lib >= 75)
            {
               outputText("你的想象似乎越来越变成下流变态的性爱白日梦，让你的下体充满暖意。");
               dynStats(DynStat.Lust(get_player().cor / 10 + get_player().lib / 10));
            }
            else if(get_player().cor > 30 || get_player().get_lust100() > 60 || get_player().lib > 40)
            {
               outputText("你的想象似乎越来越转向关于性的念头。");
               dynStats(DynStat.Lust(5 + get_player().lib / 10));
            }
            else
            {
               dynStats(DynStat.Inte(1));
            }
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function isDiscovered() : Boolean
      {
         return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2301) > 0;
      }
      
      public function get_exploreEncounter() : Encounter
      {
         var lake:Boolean;
         var _g:CommonEncounters;
         var _loc3_:* = null as CommonEncounters;
         var _loc4_:* = null as FetishCultistScene;
         var _loc5_:* = null as GooGirlScene;
         var _loc6_:* = null as Either;
         var _loc7_:* = null as Encounter;
         var _loc8_:* = null as Either;
         var _loc9_:* = null as Encounter;
         var _loc10_:* = null as Either;
         var _loc11_:* = null as Object;
         var _loc12_:* = null as Encounter;
         var _loc13_:* = null as Either;
         var _loc14_:* = null as Encounter;
         var _loc15_:* = null as Encounter;
         var _loc16_:* = null as IzmaScene;
         var _loc17_:* = null as Rathazul;
         var _loc18_:* = null as Encounter;
         var _loc19_:* = null as Either;
         var _loc20_:* = null as Encounter;
         var _loc21_:* = null as Either;
         var _loc22_:* = null as Encounter;
         var _loc23_:* = null as Encounter;
         var _loc24_:* = null as SwordInStone;
         var _loc25_:* = null as Either;
         var _loc26_:* = null as Encounter;
         var _loc27_:* = null as Encounter;
         var _loc28_:* = null as Either;
         var _loc1_:Lake = this;
         var _loc2_:FnHelpers = Encounters.fn;
         if(_exploreEncounter == null)
         {
            _loc3_ = get_game().commonEncounters;
            _loc4_ = fetishCultistScene;
            _loc5_ = gooGirlScene;
            _loc6_ = OneOf_Impl_.fromB(get_game().commonEncounters.get_impEncounter());
            _loc7_ = EncounterOrDef_Impl_.fromDef(new EncounterDef(null,null,EncounterChance_Impl_.fromBoolFun(function():Boolean
            {
               return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2024) > 1;
            }),_loc6_,null));
            _loc8_ = OneOf_Impl_.fromB(get_game().commonEncounters.get_goblinEncounter());
            _loc9_ = EncounterOrDef_Impl_.fromDef(new EncounterDef(null,null,_loc2_.ifNGplusMin(1),_loc8_,null));
            _loc10_ = OneOf_Impl_.fromA(eggChooserMenu);
            _loc11_ = _loc2_.ifPregnantWith(5);
            _loc12_ = EncounterOrDef_Impl_.fromDef(new EncounterDef("egg",EncounterChance_Impl_.fromFloatConst(2.5),_loc11_,_loc10_,null));
            _loc13_ = OneOf_Impl_.fromB(calluScene);
            _loc14_ = EncounterOrDef_Impl_.fromDef(new EncounterDef(null,EncounterChance_Impl_.fromFloatConst(0.5),null,_loc13_,null));
            _loc15_ = get_game().latexGirl.lakeDiscovery;
            _loc16_ = get_game().izmaScene;
            _loc17_ = get_game().rathazul;
            _loc18_ = get_game().aprilFools.poniesEncounter;
            _loc19_ = OneOf_Impl_.fromA(get_game().boat.discoverBoat);
            _loc20_ = EncounterOrDef_Impl_.fromDef(new EncounterDef("boat",null,_loc2_.not(get_game().boat.isDiscovered),_loc19_,null));
            _loc21_ = OneOf_Impl_.fromA(get_game().townRuins.discoverAmilyVillage);
            _loc22_ = EncounterOrDef_Impl_.fromDef(new EncounterDef("townruins",null,_loc2_.not(get_game().townRuins.isDiscovered),_loc21_,null));
            _loc23_ = EncounterOrDef_Impl_.fromDef(new EncounterDef("cultistNun",cultistNunScene.encounterChance,null,OneOf_Impl_.fromA(cultistNunScene.execEncounter),null));
            _loc24_ = swordInStone;
            _g = get_game().commonEncounters;
            lake = true;
            _loc25_ = OneOf_Impl_.fromA(function():void
            {
               _g.bigJunkForestScene(lake);
            });
            _loc26_ = EncounterOrDef_Impl_.fromDef(new EncounterDef("bigjunk",get_game().commonEncounters.bigJunkChance,null,_loc25_,null));
            _loc27_ = Encounters.group("loot",EncounterOrDef_Impl_.fromDef(new EncounterDef("equinum",null,null,OneOf_Impl_.fromA(findEquinum),null)),EncounterOrDef_Impl_.fromDef(new EncounterDef("wfruit",null,null,OneOf_Impl_.fromA(findWFruit),null)));
            _loc28_ = OneOf_Impl_.fromA(get_game().farm.farmExploreEncounter);
            _exploreEncounter = Encounters.group("lake",_loc3_,_loc4_,_loc5_,_loc7_,_loc9_,_loc12_,_loc14_,_loc15_,_loc16_,_loc17_,_loc18_,_loc20_,_loc22_,_loc23_,_loc24_,_loc26_,_loc27_,EncounterOrDef_Impl_.fromDef(new EncounterDef("farm",null,EncounterChance_Impl_.fromBoolFun(farmEncounterAvailable),_loc28_,null)),EncounterOrDef_Impl_.fromDef(new EncounterDef("walk",null,null,OneOf_Impl_.fromA(lakeWalk),null)));
         }
         return _exploreEncounter;
      }
      
      public function findWFruit() : void
      {
         clearOutput();
         get_images().showImage("item-wFruit");
         outputText("你在湖岸边发现了一棵长着奇怪果实的树。其中一个果实掉在你面前的地上。你把它捡了起来。[pg]");
         get_inventory().takeItem(get_consumables().W_FRUIT,get_camp().returnToCampUseOneHour);
      }
      
      public function findEquinum() : void
      {
         clearOutput();
         get_images().showImage("item-equinum");
         outputText("你发现一个长长的、形状奇特的小瓶半埋在沙子里。瓶子中间的带子上写着一个词：\'马化药剂\'。[pg]");
         get_inventory().takeItem(get_consumables().EQUINUM,get_camp().returnToCampUseOneHour);
      }
      
      public function farmEncounterAvailable() : Boolean
      {
         if(get_player().hasStatusEffect(StatusEffects.MetWhitney))
         {
            return get_player().statusEffectv1(StatusEffects.MetWhitney) <= 1;
         }
         return true;
      }
      
      public function explore() : void
      {
         clearOutput();
         get_player().location = "湖泊";
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,2301,FlagDict_Impl_.arrayReadInt(_loc1_,2301) + 1);
         get_exploreEncounter().execEncounter();
      }
      
      public function eggChooserMenu() : void
      {
         var eggType5:int;
         var _g5:Lake;
         var eggType4:int;
         var _g4:Lake;
         var eggType3:int;
         var _g3:Lake;
         var eggType2:int;
         var _g2:Lake;
         var eggType1:int;
         var _g1:Lake;
         var eggType:int;
         var _g:Lake;
         clearOutput();
         get_images().showImage("event-lake-lights");
         outputText("在湖边漫步时，你瞥见水面下有美丽的彩色光芒在盘旋。你小心翼翼地探出身子，当它们从湖水中闪烁而出却没有溅起水花时，你向后跳开。彩色的光芒围着你转圈。你想知道该如何与光战斗，但它们停止了移动，悬停在你周围。有许多种颜色：蓝色、粉色、白色、黑色、紫色和棕色。它们似乎在等待着什么；也许你可以触摸其中一个？");
         menu();
         _g = this;
         eggType = 2;
         addButton(0,"蓝色",function():void
         {
            _g.eggChoose(eggType);
         });
         _g1 = this;
         eggType1 = 3;
         addButton(1,"粉色",function():void
         {
            _g1.eggChoose(eggType1);
         });
         _g2 = this;
         eggType2 = 4;
         addButton(2,"白色",function():void
         {
            _g2.eggChoose(eggType2);
         });
         _g3 = this;
         eggType3 = 5;
         addButton(3,"黑色",function():void
         {
            _g3.eggChoose(eggType3);
         });
         _g4 = this;
         eggType4 = 1;
         addButton(4,"紫色",function():void
         {
            _g4.eggChoose(eggType4);
         });
         _g5 = this;
         eggType5 = 0;
         addButton(5,"棕色",function():void
         {
            _g5.eggChoose(eggType5);
         });
         addButton(14,"逃跑",eggChooseEscape);
      }
      
      public function eggChooseEscape() : void
      {
         clearOutput();
         get_images().showImage("area-lake");
         outputText("你一个翻滚，然后跑开，把那圈光环留在身后的远处。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function eggChoose(param1:int) : void
      {
         clearOutput();
         get_images().showImage("event-lake-lights-adoption");
         outputText("你伸出手，触摸了");
         switch(param1)
         {
            case 0:
               outputText("棕色");
               break;
            case 1:
               outputText("紫色");
               break;
            case 2:
               outputText("蓝色");
               break;
            case 3:
               outputText("粉色");
               break;
            case 4:
               outputText("白色");
               break;
            default:
               outputText("黑色");
         }
         outputText("的光。它立刻流入你的皮肤，在你的手臂中发光，仿佛你的手臂是半透明的。它冲过你的肩膀和躯干，向下进入你怀孕的子宫。其他的灯光消失了。");
         get_player().statusEffectByType(StatusEffects.Eggs).value1 = param1;
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function discover() : void
      {
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2301,1);
         get_images().showImage("area-lake");
         outputText("你的漫游带你走遍了传送门周围荒芜的废土，直到湿气和淡水的气味提醒你附近有湖泊。快步走几步，你发现了一个巨大的湖泊，甚至看不到对岸。周围长满了草和几棵稀疏的树。");
         outputText("[pg]<b>你发现了湖泊！</b>");
         doNext(get_camp().returnToCampUseOneHour);
      }
   }
}

