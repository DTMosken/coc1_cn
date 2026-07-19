package classes.scenes.areas
{
   import classes.BaseContent;
   import classes.CoC;
   import classes.DynStat;
   import classes.ImageManager;
   import classes.Player;
   import classes.StatusEffects;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.internals._OneOf.OneOf_Impl_;
   import classes.scenes.Camp;
   import classes.scenes.CommonEncounters;
   import classes.scenes.api.Encounter;
   import classes.scenes.api.EncounterDef;
   import classes.scenes.api.Encounters;
   import classes.scenes.api.IExplorable;
   import classes.scenes.api._Encounters.EncounterChance_Impl_;
   import classes.scenes.api._Encounters.EncounterOrDef_Impl_;
   import classes.scenes.areas.forest.AkbalScene;
   import classes.scenes.areas.forest.CorruptedGlade;
   import classes.scenes.areas.forest.DullahanScene;
   import classes.scenes.areas.forest.ErlKingScene;
   import classes.scenes.areas.forest.Faerie;
   import classes.scenes.areas.forest.KitsuneScene;
   import classes.scenes.areas.forest.TamaniScene;
   import classes.scenes.monsters.AliceScene;
   import classes.scenes.seasonal.Fera;
   import flash.Boot;
   import haxe.ds.Either;
   
   public class DeepWoods extends BaseContent implements IExplorable
   {
      
      public var forest:Forest;
      
      public var _deepwoodsEncounter:Encounter;
      
      public function DeepWoods(param1:Forest = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         _deepwoodsEncounter = null;
         super();
         if(param1 == null)
         {
            throw "森林不能为空";
         }
         forest = param1;
      }
      
      public function tentacleBeastDeepwoodsEncounterFn() : void
      {
         if(get_player().get_gender() > 0)
         {
            FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,247,0);
         }
         if(get_player().hasKeyItem("Dangerous Plants") && get_player().get_inte() / 2 > Utils.rand(50))
         {
            clearOutput();
            get_images().showImage("item-dPlants");
            outputText("利用《危险植物》书中的知识，你断定附近有一个触手怪的巢穴，你要继续吗？如果不想，你可以返回营地。[pg]");
            menu();
            addButton(0,"继续",forest.tentacleBeastScene.encounter);
            addButton(1,"退后",get_camp().returnToCampUseOneHour);
         }
         else
         {
            forest.tentacleBeastScene.encounter();
         }
      }
      
      public function isDiscovered() : Boolean
      {
         return get_player().hasStatusEffect(StatusEffects.ExploredDeepwoods);
      }
      
      public function get_deepwoodsEncounter() : Encounter
      {
         var _loc1_:DeepWoods = this;
         if(_deepwoodsEncounter != null)
         {
            return _deepwoodsEncounter;
         }
         var _loc2_:CommonEncounters = get_game().commonEncounters;
         var _loc3_:KitsuneScene = forest.kitsuneScene;
         var _loc4_:DullahanScene = forest.dullahanScene;
         var _loc5_:AliceScene = get_game().aliceScene;
         var _loc6_:AkbalScene = forest.akbalScene;
         var _loc7_:TamaniScene = forest.tamaniScene;
         var _loc8_:Faerie = forest.faerie;
         var _loc9_:ErlKingScene = forest.erlkingScene;
         var _loc10_:Fera = get_game().fera;
         var _loc11_:Encounter = EncounterOrDef_Impl_.fromDef(new EncounterDef("lumber",null,null,OneOf_Impl_.fromB(get_game().camp.cabinProgress.get_forestEncounter()),null));
         var _loc12_:CorruptedGlade = forest.corruptedGlade;
         var _loc13_:Either = OneOf_Impl_.fromA(get_game().goblinSharpshooterScene.meetGoblinSharpshooter);
         var _loc14_:Object = EncounterChance_Impl_.fromBoolFun(get_game().goblinSharpshooterScene.encounterWhen);
         var _loc15_:Encounter = EncounterOrDef_Impl_.fromDef(new EncounterDef("goblinSharpshooter",get_game().goblinSharpshooterScene.encounterChance,_loc14_,_loc13_,null));
         var _loc16_:Either = OneOf_Impl_.fromA(tentacleBeastDeepwoodsEncounterFn);
         var _loc17_:Encounter = EncounterOrDef_Impl_.fromDef(new EncounterDef("tentabeast",null,Encounters.fn.ifLevelMin(2),_loc16_,null));
         var _loc18_:Either = OneOf_Impl_.fromA(get_game().dungeons.enterDeepCave);
         var _loc19_:Encounter = EncounterOrDef_Impl_.fromDef(new EncounterDef("dungeon",null,EncounterChance_Impl_.fromBoolFun(get_game().dungeons.canFindDeepCave),_loc18_,null));
         var _loc20_:Either = OneOf_Impl_.fromA(deepwoodsWalkFn);
         var _loc21_:Encounter = EncounterOrDef_Impl_.fromDef(new EncounterDef("walk",EncounterChance_Impl_.fromFloatConst(0.01),null,_loc20_,null));
         var _loc22_:Either = OneOf_Impl_.fromB(forest.aikoScene);
         var _loc23_:Encounter = EncounterOrDef_Impl_.fromDef(new EncounterDef("aiko",null,EncounterChance_Impl_.fromBoolFun(function():Boolean
         {
            if(Encounters.fn.ifLevelMin(16) != null && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2353) < 4)
            {
               return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2358) != 2;
            }
            return false;
         }),_loc22_,null));
         var _loc24_:Either = OneOf_Impl_.fromA(forest.faerie.gladesScene);
         var _loc25_:Object = EncounterChance_Impl_.fromBoolFun(forest.faerie.gladesEnabled);
         _deepwoodsEncounter = Encounters.group("deepwoods",_loc2_,_loc3_,_loc4_,_loc5_,_loc6_,_loc7_,_loc8_,_loc9_,_loc10_,_loc11_,_loc12_,_loc15_,_loc17_,_loc19_,_loc21_,_loc23_,EncounterOrDef_Impl_.fromDef(new EncounterDef("corrupted glade faerie",EncounterChance_Impl_.fromFloatConst(0.1),_loc25_,_loc24_,null)));
         return _deepwoodsEncounter;
      }
      
      public function explore() : void
      {
         clearOutput();
         get_player().location = "密林";
         get_player().addStatusValue(StatusEffects.ExploredDeepwoods,1,1);
         get_deepwoodsEncounter().execEncounter();
      }
      
      public function discover() : void
      {
         get_player().createStatusEffect(StatusEffects.ExploredDeepwoods,0,0,0,0);
         clearOutput();
         get_images().showImage("area-deepwoods");
         outputText("在多次探索森林之后，你决定挑战一下极限，向着树林深处不断深入。越往里走光线越暗，但你依然勇敢地继续前行。周围的植物也发生了变化，你发现了越来越多的地衣和真菌，其中许多还会发光。最后，一堵像房子一样宽的树干墙挡住了你的去路。墙的中央有一个类似树洞的开口，旁边还有一个小牌子，上面写着这里是通往“幽深森林”的入口。你暂时没有继续前进，但你已经记住了路，随时可以回来探索幽深森林。");
         outputText("[pg]<b>幽深森林探索已解锁！</b>");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function deepwoodsWalkFn() : void
      {
         clearOutput();
         get_images().showImage("area-deepwoods");
         outputText("你在幽深森林里享受着平静的散步。这让你有时间去思考最近发生的那些令人不安的事件。");
         dynStats(DynStat.Tou(0.5),DynStat.Inte(1));
         doNext(get_camp().returnToCampUseOneHour);
      }
   }
}

