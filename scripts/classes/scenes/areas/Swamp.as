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
   import classes.internals.GuiOutput;
   import classes.internals.Utils;
   import classes.internals._OneOf.OneOf_Impl_;
   import classes.scenes.Camp;
   import classes.scenes.CommonEncounters;
   import classes.scenes.api.Encounter;
   import classes.scenes.api.EncounterDef;
   import classes.scenes.api.Encounters;
   import classes.scenes.api.FnHelpers;
   import classes.scenes.api.IExplorable;
   import classes.scenes.api._Encounters.EncounterChance_Impl_;
   import classes.scenes.api._Encounters.EncounterOrDef_Impl_;
   import classes.scenes.areas.swamp.AlrauneScene;
   import classes.scenes.areas.swamp.CorruptedDriderScene;
   import classes.scenes.areas.swamp.FemaleSpiderMorphScene;
   import classes.scenes.areas.swamp.MaleSpiderMorphScene;
   import classes.scenes.areas.swamp.Rogar;
   import flash.Boot;
   import haxe.IMap;
   import haxe.ds.Either;
   
   public class Swamp extends BaseContent implements IExplorable
   {
      
      public var rogar:Rogar;
      
      public var maleSpiderMorphScene:MaleSpiderMorphScene;
      
      public var femaleSpiderMorphScene:FemaleSpiderMorphScene;
      
      public var corruptedDriderScene:CorruptedDriderScene;
      
      public var alrauneScene:AlrauneScene;
      
      public var _explorationEncounter:Encounter;
      
      public function Swamp(param1:GuiOutput = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         _explorationEncounter = null;
         alrauneScene = new AlrauneScene();
         rogar = new Rogar();
         femaleSpiderMorphScene = new FemaleSpiderMorphScene();
         super();
         maleSpiderMorphScene = new MaleSpiderMorphScene(param1);
         corruptedDriderScene = new CorruptedDriderScene(param1);
      }
      
      public function walkingSwampStatBoost() : void
      {
         clearOutput();
         get_images().showImage("area-swamp");
         outputText("你在沼泽地里[walk]了一个小时，什么也没发现。[pg]");
         if(Utils.rand(2) == 0)
         {
            if(Utils.rand(2) == 0 && get_player().get_spe100() < 50)
            {
               outputText("在不平坦的地面上挣扎前行的努力让你变得更敏捷了。");
               dynStats(DynStat.Spe(0.5));
            }
            else if(get_player().get_tou100() < 50)
            {
               outputText("在不平坦的地面上挣扎前行的努力让你变得更强壮了。");
               dynStats(DynStat.Tou(0.5));
            }
         }
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function isDiscovered() : Boolean
      {
         return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,272) > 0;
      }
      
      public function get_explorationEncounter() : Encounter
      {
         var _gthis:Swamp;
         var _loc2_:* = null as CommonEncounters;
         var _loc3_:* = null as Encounter;
         var _loc4_:* = null as Encounter;
         var _loc5_:* = null as Object;
         var _loc6_:* = null as Encounter;
         var _loc7_:* = null as Either;
         var _loc8_:* = null as Object;
         _gthis = this;
         var _loc1_:FnHelpers = Encounters.fn;
         if(_explorationEncounter == null)
         {
            _loc2_ = get_game().commonEncounters;
            _loc3_ = EncounterOrDef_Impl_.fromDef(new EncounterDef("bog",null,EncounterChance_Impl_.fromBoolFun(function():Boolean
            {
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,272) >= 25)
               {
                  return !_gthis.get_game().bog.isDiscovered();
               }
               return false;
            }),OneOf_Impl_.fromA(get_game().bog.discover),null));
            _loc4_ = EncounterOrDef_Impl_.fromDef(new EncounterDef("kihaxhel",null,EncounterChance_Impl_.fromBoolFun(function():Boolean
            {
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2658) == 0 && !_gthis.get_game().kihaFollowerScene.followerKiha() && _gthis.get_player().cor < 60 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,421) >= 1 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,393) > 0 && _gthis.get_player().hasCock())
               {
                  return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,425) == 0;
               }
               return false;
            }),OneOf_Impl_.fromA(get_game().kihaFollowerScene.kihaXSalamander),null));
            _loc5_ = EncounterChance_Impl_.fromBoolFun(function():Boolean
            {
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,536) == 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,537) == 0)
               {
                  return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,272) > 0;
               }
               return false;
            });
            _loc6_ = EncounterOrDef_Impl_.fromDef(new EncounterDef("ember",EncounterChance_Impl_.fromFloatConst(0.1),_loc5_,OneOf_Impl_.fromA(get_game().emberScene.findEmbersEgg),null));
            _loc7_ = OneOf_Impl_.fromA(get_game().goblinSharpshooterScene.meetGoblinSharpshooter);
            _loc8_ = EncounterChance_Impl_.fromBoolFun(get_game().goblinSharpshooterScene.encounterWhen);
            _explorationEncounter = Encounters.group("swamp",_loc2_,_loc3_,_loc4_,_loc6_,EncounterOrDef_Impl_.fromDef(new EncounterDef("goblinSharpshooter",get_game().goblinSharpshooterScene.encounterChance,_loc8_,_loc7_,null)),EncounterOrDef_Impl_.fromDef(new EncounterDef("rogar",null,EncounterChance_Impl_.fromBoolFun(function():Boolean
            {
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,410) == 0)
               {
                  return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,407) < 3;
               }
               return false;
            }),OneOf_Impl_.fromA(rogar.encounterRogarSwamp),null)),EncounterOrDef_Impl_.fromDef(new EncounterDef("mspider",null,null,OneOf_Impl_.fromA(maleSpiderMorphScene.greetMaleSpiderMorph),null)),EncounterOrDef_Impl_.fromDef(new EncounterDef("fspider",null,null,OneOf_Impl_.fromA(femaleSpiderMorphScene.fSpiderMorphGreeting),null)),EncounterOrDef_Impl_.fromDef(new EncounterDef("drider",null,null,OneOf_Impl_.fromA(corruptedDriderScene.driderEncounter),null)),EncounterOrDef_Impl_.fromDef(new EncounterDef("kiha",null,null,OneOf_Impl_.fromA(function():void
            {
               if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2658) != 0 || _gthis.get_game().kihaFollowerScene.followerKiha() || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,342) > 1)
               {
                  _gthis.get_game().kihaScene.kihaExplore();
               }
               else
               {
                  _gthis.get_game().kihaScene.encounterKiha();
               }
            }),null)),EncounterOrDef_Impl_.fromDef(new EncounterDef("alraune",null,null,OneOf_Impl_.fromA(alrauneScene.alrauneEncounter),null)),EncounterOrDef_Impl_.fromDef(new EncounterDef("walk",null,null,OneOf_Impl_.fromA(walkingSwampStatBoost),null)));
         }
         return _explorationEncounter;
      }
      
      public function explore() : void
      {
         clearOutput();
         get_player().location = "沼泽";
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,272,FlagDict_Impl_.arrayReadInt(_loc1_,272) + 1);
         if(get_player().isFullMermaid())
         {
            get_player().createStatusEffect(StatusEffects.MermaidWatered);
         }
         get_explorationEncounter().execEncounter();
      }
      
      public function discover() : void
      {
         FlagDict_Impl_.arrayWriteInt(KFLAGS.flags,272,1);
         get_images().showImage("area-swamp");
         outputText("综合考虑后，你决定换个环境也不错。收拾好行囊，你开始了一段进入废土的旅程。旅程开始时你兴致勃勃，吹着小曲打发时间。然而，漫无目的地走了一个小时后，你的漫游欲开始消退。又过了半个小时。你对这毫无结果的探索感到厌烦，正准备返回营地时，一道微弱的光芒掠过你的视线。你吓了一跳，转过身去，看到三个发光的鬼火，正异想天开地互相盘旋。就在你注视的时候，这三个幽灵般的光芒开始飘远，虽然你脑海中闪过这可能是陷阱的念头，但你还是决定跟上去。[pg]");
         outputText("没过多久，你开始察觉到环境发生变化的痕迹。最直接的区别是越来越闷热。几分钟后，鬼火冲进了一片黑暗、浑浊、停滞的沼泽的边界；深吸一口气后，你跟着它们进入了泥沼。然而，一旦进入其中，这些气态的球体就向不同的方向飘去，让你失去了它们的踪迹。你无奈地叹了口气，原路返回，对你的发现感到满意。进一步的探索可以等等。现在，你的营地在等着你。[pg]");
         outputText("<b>你发现了沼泽！</b>");
         doNext(get_camp().returnToCampUseTwoHours);
      }
   }
}

