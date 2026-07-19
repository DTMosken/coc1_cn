package classes.scenes.areas
{
   import classes.BaseContent;
   import classes.CoC;
   import classes.DynStat;
   import classes.ImageManager;
   import classes.Player;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.internals.GuiOutput;
   import classes.internals.Utils;
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
   import classes.scenes.areas.plains.BunnyGirl;
   import classes.scenes.areas.plains.GnollScene;
   import classes.scenes.areas.plains.GnollSpearThrowerScene;
   import classes.scenes.areas.plains.SatyrScene;
   import flash.Boot;
   import haxe.IMap;
   import haxe.ds.Either;
   
   public class Plains extends BaseContent implements IExplorable
   {
      
      public var satyrScene:SatyrScene;
      
      public var gnollSpearThrowerScene:GnollSpearThrowerScene;
      
      public var gnollScene:GnollScene;
      
      public var bunnyGirl:BunnyGirl;
      
      public var _explorationEncounter:Encounter;
      
      public function Plains(param1:GuiOutput = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         _explorationEncounter = null;
         gnollSpearThrowerScene = new GnollSpearThrowerScene();
         gnollScene = new GnollScene();
         bunnyGirl = new BunnyGirl();
         super();
         satyrScene = new SatyrScene(param1);
      }
      
      public function walkingPlainsStatBoost() : void
      {
         clearOutput();
         get_images().showImage("area-plains");
         outputText("你在无尽的平原上奔跑了一个小时，什么也没找到。[pg]");
         if(Utils.rand(2) == 0)
         {
            if(Utils.rand(2) == 0 && get_player().get_tou100() < 50)
            {
               outputText("长时间的奔跑让你变得更强壮了。");
               dynStats(DynStat.Tou(0.5),DynStat.Lib(-1));
            }
            else if(get_player().get_spe100() < 50)
            {
               outputText("长时间的奔跑让你变得更敏捷了。");
               dynStats(DynStat.Spe(0.5),DynStat.Lib(-1));
            }
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function isDiscovered() : Boolean
      {
         return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,131) > 0;
      }
      
      public function helXIzzy() : void
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,397) == 0)
         {
            get_game().helScene.salamanderXIsabellaPlainsIntro();
         }
         else if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,397) == 1)
         {
            get_game().helScene.isabellaXHelThreeSomePlainsStart();
         }
      }
      
      public function get_explorationEncounter() : Encounter
      {
         var _g:SatyrScene;
         var _gthis:Plains = this;
         if(_explorationEncounter != null)
         {
            return _explorationEncounter;
         }
         var _loc1_:FnHelpers = Encounters.fn;
         var _loc2_:CommonEncounters = get_game().commonEncounters;
         var _loc3_:Encounter = EncounterOrDef_Impl_.fromDef(new EncounterDef("sheila_xp3",EncounterChance_Impl_.fromFloatConst(Encounters.ALWAYS),EncounterChance_Impl_.fromBoolFun(function():Boolean
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,764) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,761) == 3 && _gthis.get_game().time.hours == 20)
            {
               return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,858) >= 0;
            }
            return false;
         }),OneOf_Impl_.fromA(get_game().sheilaScene.sheilaXPThreeSexyTime),null));
         var _loc4_:Encounter = EncounterOrDef_Impl_.fromDef(new EncounterDef("candy_cane",null,EncounterChance_Impl_.fromBoolFun(function():Boolean
         {
            if(_gthis.isSaturnalia())
            {
               return int(_gthis.get_date().getFullYear()) > FlagDict_Impl_.arrayReadInt(KFLAGS.flags,637);
            }
            return false;
         }),OneOf_Impl_.fromA(get_game().xmas.xmasMisc.candyCaneTrapDiscovery),null));
         var _loc5_:Encounter = EncounterOrDef_Impl_.fromDef(new EncounterDef("polar_pete",null,EncounterChance_Impl_.fromBoolFun(function():Boolean
         {
            if(_gthis.isSaturnalia())
            {
               return int(_gthis.get_date().getFullYear()) > FlagDict_Impl_.arrayReadInt(KFLAGS.flags,644);
            }
            return false;
         }),OneOf_Impl_.fromA(get_game().xmas.xmasMisc.polarPete),null));
         var _loc6_:Encounter = EncounterOrDef_Impl_.fromDef(new EncounterDef("niamh",null,EncounterChance_Impl_.fromBoolFun(function():Boolean
         {
            return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,449) == 1;
         }),OneOf_Impl_.fromA(get_game().telAdre.niamh.niamhPostTelAdreMoveOut),null));
         var _loc7_:Object = EncounterChance_Impl_.fromFloatConst(0.3);
         var _loc8_:Object = EncounterChance_Impl_.fromBoolFun(function():Boolean
         {
            return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,506) == 0;
         });
         var _loc9_:Array = [_loc1_.ifLevelMin(8)];
         var _loc10_:Encounter = EncounterOrDef_Impl_.fromDef(new EncounterDef("owca",_loc7_,_loc8_,OneOf_Impl_.fromA(get_game().owca.gangbangVillageStuff),_loc9_));
         var _loc11_:Encounter = EncounterOrDef_Impl_.fromDef(new EncounterDef("bazaar",null,EncounterChance_Impl_.fromBoolFun(function():Boolean
         {
            return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,211) == 0;
         }),OneOf_Impl_.fromA(get_game().bazaar.findBazaar),null));
         var _loc12_:Encounter = EncounterOrDef_Impl_.fromDef(new EncounterDef("helXizzy",EncounterChance_Impl_.fromFloatConst(0.2),EncounterChance_Impl_.fromBoolFun(function():Boolean
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,256) != 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,257) != 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,393) == 1 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,260) == 0 && !_gthis.get_game().isabellaFollowerScene.isabellaFollower())
            {
               if(_gthis.get_player().get_tallness() > 78)
               {
                  return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,258) > 0;
               }
               return true;
            }
            return false;
         }),OneOf_Impl_.fromA(helXIzzy),null));
         var _loc13_:Either = OneOf_Impl_.fromA(findOviElix);
         var _loc14_:Encounter = EncounterOrDef_Impl_.fromDef(new EncounterDef("ovielix",EncounterChance_Impl_.fromFloatConst(0.5),null,_loc13_,null));
         var _loc15_:Either = OneOf_Impl_.fromA(findKangaFruit);
         var _loc16_:Encounter = EncounterOrDef_Impl_.fromDef(new EncounterDef("kangaft",EncounterChance_Impl_.fromFloatConst(0.5),null,_loc15_,null));
         var _loc17_:Encounter = EncounterOrDef_Impl_.fromDef(new EncounterDef("gnoll",EncounterChance_Impl_.fromFloatConst(0.5),null,OneOf_Impl_.fromA(gnollSpearThrowerScene.gnoll2Encounter),null));
         var _loc18_:Encounter = EncounterOrDef_Impl_.fromDef(new EncounterDef("gnoll2",EncounterChance_Impl_.fromFloatConst(0.5),null,OneOf_Impl_.fromA(gnollScene.gnollEncounter),null));
         var _loc19_:Encounter = EncounterOrDef_Impl_.fromDef(new EncounterDef("bunny",null,null,OneOf_Impl_.fromA(bunnyGirl.bunnbunbunMeet),null));
         var _loc20_:Encounter = EncounterOrDef_Impl_.fromDef(new EncounterDef("isabella",null,EncounterChance_Impl_.fromBoolFun(function():Boolean
         {
            return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,370) == 0;
         }),OneOf_Impl_.fromA(get_game().isabellaScene.isabellaGreeting),null));
         var _loc21_:Encounter = EncounterOrDef_Impl_.fromDef(new EncounterDef("helia",function():Number
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,483) > 0)
            {
               return 0.75;
            }
            return 1.5;
         },EncounterChance_Impl_.fromBoolFun(function():Boolean
         {
            return !_gthis.get_game().helScene.followerHel();
         }),OneOf_Impl_.fromA(get_game().helScene.encounterAJerkInThePlains),null));
         _g = satyrScene;
         _explorationEncounter = Encounters.group("plains",_loc2_,_loc3_,_loc4_,_loc5_,_loc6_,_loc10_,_loc11_,_loc12_,_loc14_,_loc16_,_loc17_,_loc18_,_loc19_,_loc20_,_loc21_,EncounterOrDef_Impl_.fromDef(new EncounterDef("satyr",null,null,OneOf_Impl_.fromA(function():void
         {
            _g.satyrEncounter();
         }),null)),EncounterOrDef_Impl_.fromDef(new EncounterDef("sheila",null,EncounterChance_Impl_.fromBoolFun(function():Boolean
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1210) == 0)
            {
               return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,858) >= 0;
            }
            return false;
         }),OneOf_Impl_.fromA(get_game().sheilaScene.sheilaEncounterRouter),null)),EncounterOrDef_Impl_.fromDef(new EncounterDef("whitney",EncounterChance_Impl_.fromFloatConst(0.1),EncounterChance_Impl_.fromBoolFun(function():Boolean
         {
            if(_gthis.get_game().farm.farmEnabled() && !_gthis.get_game().farm.farmCorrupt())
            {
               return !_gthis.get_game().farm.saveContent.gnoll;
            }
            return false;
         }),OneOf_Impl_.fromA(get_game().farm.whitneyFightsGnoll),null)));
         return _explorationEncounter;
      }
      
      public function findOviElix() : void
      {
         get_images().showImage("item-oElixir");
         outputText("在探索平原时，你差点被一个废弃的六角形瓶子绊倒。");
         get_inventory().takeItem(get_consumables().OVIELIX,get_camp().returnToCampUseOneHour);
      }
      
      public function findKangaFruit() : void
      {
         get_images().showImage("item-kFruit");
         outputText("在探索平原时，你偶然发现了一株长相奇怪的植物。当你仔细观察时，你发现上面有一些你可以摘到的果实。");
         get_inventory().takeItem(get_consumables().KANGAFT,get_camp().returnToCampUseOneHour);
      }
      
      public function explore() : void
      {
         clearOutput();
         get_player().location = "平原";
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,131,FlagDict_Impl_.arrayReadInt(_loc1_,131) + 1);
         get_explorationEncounter().execEncounter();
      }
      
      public function discover() : void
      {
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,131,1);
         get_images().showImage("area-plains");
         outputText("你发现自己站在齐膝高的草丛中，四周都是平坦的平原。虽然从这里可以看到山脉、森林和湖泊，但它们似乎都很遥远。");
         outputText("[pg]<b>你发现了平原！</b>");
         doNext(get_camp().returnToCampUseOneHour);
      }
   }
}

