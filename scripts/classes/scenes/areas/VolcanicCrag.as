package classes.scenes.areas
{
   import classes.BaseContent;
   import classes.CoC;
   import classes.ImageManager;
   import classes.Player;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.internals.GuiOutput;
   import classes.internals.Utils;
   import classes.internals._OneOf.OneOf_Impl_;
   import classes.items.ConsumableLib;
   import classes.items.Jewelry;
   import classes.items.JewelryLib;
   import classes.items.UseableLib;
   import classes.scenes.Camp;
   import classes.scenes.CommonEncounters;
   import classes.scenes.Inventory;
   import classes.scenes.api.Encounter;
   import classes.scenes.api.EncounterDef;
   import classes.scenes.api.Encounters;
   import classes.scenes.api.IExplorable;
   import classes.scenes.api._Encounters.EncounterChance_Impl_;
   import classes.scenes.api._Encounters.EncounterOrDef_Impl_;
   import classes.scenes.areas.volcanicCrag.CorruptedCoven;
   import classes.scenes.areas.volcanicCrag.CorruptedWitchScene;
   import classes.scenes.areas.volcanicCrag.GiltScene;
   import classes.scenes.areas.volcanicCrag.HellmouthScene;
   import classes.scenes.areas.volcanicCrag.VolcanicGolemScene;
   import flash.Boot;
   import haxe.IMap;
   import haxe.ds.Either;
   
   public class VolcanicCrag extends BaseContent implements IExplorable
   {
      
      public var volcanicGolemScene:VolcanicGolemScene;
      
      public var hellmouthScene:HellmouthScene;
      
      public var giltScene:GiltScene;
      
      public var coven:CorruptedCoven;
      
      public var corruptedWitchScene:CorruptedWitchScene;
      
      public var _explorationEncounter:Encounter;
      
      public function VolcanicCrag(param1:GuiOutput = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         _explorationEncounter = null;
         coven = new CorruptedCoven();
         giltScene = new GiltScene();
         hellmouthScene = new HellmouthScene();
         volcanicGolemScene = new VolcanicGolemScene();
         super();
         corruptedWitchScene = new CorruptedWitchScene(param1);
      }
      
      public function walk() : void
      {
         clearOutput();
         get_images().showImage("area-volcaniccrag");
         outputText("你花了一个小时探索这片地狱般的风景，但没有发现任何有趣的东西。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function lootObsidianShard() : void
      {
         clearOutput();
         get_images().showImage("item-dHeart");
         outputText("当你管自己的事时，一些闪亮的东西暂时让你发晕，你转过头去寻找那个闪亮的物体。你走过去，把它捡起来仔细看。它是深紫色的，摸起来很光滑，移动你的手指证实了这一点。");
         if(get_player().get_inte() <= Utils.rand(80))
         {
            outputText("不幸的是，你被锋利的边缘割伤了手指。你痛苦地迅速缩回手，看着手指上渗出鲜血的小伤口。哎哟！");
            get_player().takeDamage(Math.max(5,get_player().maxHP() / 50),false);
         }
         outputText("你知道黑曜石碎片非常锋利，也许有人能用它来制造致命的武器？");
         get_inventory().takeItem(get_useables().OBSHARD,get_camp().returnToCampUseOneHour);
      }
      
      public function lootDrakHrt() : void
      {
         clearOutput();
         get_images().showImage("item-dHeart");
         outputText("在探索岩壁时，你偶然发现一朵孤零零的花从地缝中绽放。你对在如此恶劣的环境中茁壮成长所需的纯粹韧性感到好奇，你[walk]过去把它捡起来，发现摸起来出奇地温暖。当你闻到它时，你会产生一种奇怪的印象，它的气味，它的本质是火热的，几乎……像龙一样。");
         get_inventory().takeItem(get_consumables().DRAKHRT,get_camp().returnToCampUseOneHour);
      }
      
      public function isDiscovered() : Boolean
      {
         return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2060) > 0;
      }
      
      public function get_explorationEncounter() : Encounter
      {
         var _gthis:VolcanicCrag = this;
         if(_explorationEncounter != null)
         {
            return _explorationEncounter;
         }
         var _loc1_:CommonEncounters = get_game().commonEncounters;
         var _loc2_:Either = OneOf_Impl_.fromA(get_game().exploration.mermaidWalk);
         var _loc3_:Object = EncounterChance_Impl_.fromBoolFun(function():Boolean
         {
            if(!_gthis.get_game().exploration.doneMermaidWalk && _gthis.get_player().isFullMermaid())
            {
               return _gthis.get_player().get_jewelry().get_id() != _gthis.get_jewelries().AQUARING.get_id();
            }
            return false;
         });
         var _loc4_:Encounter = EncounterOrDef_Impl_.fromDef(new EncounterDef("mermaidExplore",EncounterChance_Impl_.fromFloatConst(Encounters.ALWAYS),_loc3_,_loc2_,null));
         var _loc5_:Object = EncounterChance_Impl_.fromBoolFun(function():Boolean
         {
            if(_gthis.isAprilFools())
            {
               return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2210) == 0;
            }
            return false;
         });
         var _loc6_:Encounter = EncounterOrDef_Impl_.fromDef(new EncounterDef("aprilfools",EncounterChance_Impl_.fromFloatConst(Encounters.ALWAYS),_loc5_,OneOf_Impl_.fromA(cragAprilFools),null));
         var _loc7_:Encounter = EncounterOrDef_Impl_.fromDef(new EncounterDef("drakesheart",null,null,OneOf_Impl_.fromA(lootDrakHrt),null));
         var _loc8_:Encounter = EncounterOrDef_Impl_.fromDef(new EncounterDef("golem",null,EncounterChance_Impl_.fromBoolFun(function():Boolean
         {
            return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2649) != 1;
         }),OneOf_Impl_.fromA(volcanicGolemScene.volcanicGolemIntro),null));
         var _loc9_:Encounter = EncounterOrDef_Impl_.fromDef(new EncounterDef("witch",null,null,OneOf_Impl_.fromA(corruptedWitchScene.corrWitchIntro),null));
         var _loc10_:Encounter = EncounterOrDef_Impl_.fromDef(new EncounterDef("walk",null,null,OneOf_Impl_.fromA(walk),null));
         var _loc11_:Either = OneOf_Impl_.fromA(get_game().dungeons.wizardTower.enterDungeon);
         var _loc12_:Encounter = EncounterOrDef_Impl_.fromDef(new EncounterDef("encounterTower",function():Number
         {
            if(_gthis.get_player().hasKeyItem("Poorly done map to Volcanic Crag"))
            {
               return 2;
            }
            return 0.2;
         },EncounterChance_Impl_.fromBoolFun(function():Boolean
         {
            return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2682) != 1;
         }),_loc11_,null));
         var _loc13_:Either = OneOf_Impl_.fromA(coven.encounterCirceCave);
         var _loc14_:Object = EncounterChance_Impl_.fromBoolFun(function():Boolean
         {
            if(!_gthis.coven.circeEnabled())
            {
               return _gthis.coven.circeUnlockable();
            }
            return true;
         });
         _explorationEncounter = Encounters.group("volcaniccrag",_loc1_,_loc4_,_loc6_,_loc7_,_loc8_,_loc9_,_loc10_,_loc12_,EncounterOrDef_Impl_.fromDef(new EncounterDef("circe",EncounterChance_Impl_.fromFloatConst(1),_loc14_,_loc13_,null)),EncounterOrDef_Impl_.fromDef(new EncounterDef("hellmouth",EncounterChance_Impl_.fromFloatConst(1),null,OneOf_Impl_.fromA(hellmouthScene.encounterHellmouth),null)),EncounterOrDef_Impl_.fromDef(new EncounterDef("hellmouthAmbush",EncounterChance_Impl_.fromFloatConst(0.3),EncounterChance_Impl_.fromBoolFun(function():Boolean
         {
            if(!_gthis.hellmouthScene.saveContent.ambushed)
            {
               return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2712) > 0;
            }
            return false;
         }),OneOf_Impl_.fromA(hellmouthScene.hellmouthAmbush),null)),EncounterOrDef_Impl_.fromDef(new EncounterDef("gilt",EncounterChance_Impl_.fromFloatConst(1),null,OneOf_Impl_.fromA(giltScene.encounterGilt),null)));
         return _explorationEncounter;
      }
      
      public function explore() : void
      {
         clearOutput();
         get_player().location = "火山岩山";
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,2060,FlagDict_Impl_.arrayReadInt(_loc1_,2060) + 1);
         doNext(playerMenu);
         get_explorationEncounter().execEncounter();
      }
      
      public function discover() : void
      {
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,2060,1);
         get_images().showImage("area-volcaniccrag");
         outputText("你走了一段时间，在玛瑞斯恶魔界坚硬且带粉红色的土地上漫游。随着你的前进，你能感觉到空气变得温暖。随着你的前进，它变得越来越热，直到你最终偶然发现了一片焦黑的风景。你用无尽的火山景观来奖励自己。岩壁点缀着这片风景。[pg]");
         outputText("<b>你发现了火山岩！</b>");
         doNext(get_camp().returnToCampUseTwoHours);
      }
      
      public function cragAprilFools() : void
      {
         get_images().showImage("event-dlc");
         get_game().aprilFools.DLCPrompt("极限区域 DLC","获取极限区域 DLC，即可访问冰川裂谷和火山岩，并探索其中的领域！","$4.99");
      }
   }
}

