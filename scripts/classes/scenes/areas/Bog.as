package classes.scenes.areas
{
   import classes.BaseContent;
   import classes.CoC;
   import classes.ImageManager;
   import classes.Player;
   import classes.StatusEffects;
   import classes.Time;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.internals.GuiOutput;
   import classes.internals.Utils;
   import classes.internals._OneOf.OneOf_Impl_;
   import classes.scenes.Camp;
   import classes.scenes.Inventory;
   import classes.scenes.api.Encounter;
   import classes.scenes.api.EncounterDef;
   import classes.scenes.api.Encounters;
   import classes.scenes.api.IExplorable;
   import classes.scenes.api._Encounters.EncounterChance_Impl_;
   import classes.scenes.api._Encounters.EncounterOrDef_Impl_;
   import classes.scenes.areas.bog.AnneMarieScene;
   import classes.scenes.areas.bog.BogTemple;
   import classes.scenes.areas.bog.ChameleonGirlScene;
   import classes.scenes.areas.bog.FrogGirlScene;
   import classes.scenes.areas.bog.InfestedChameleonGirlScene;
   import classes.scenes.areas.bog.Marielle;
   import classes.scenes.areas.bog.ParasiteScene;
   import classes.scenes.areas.bog.PhoukaScene;
   import flash.Boot;
   import haxe.IMap;
   import haxe.ds.Either;
   
   public class Bog extends BaseContent implements IExplorable
   {
      
      public var phoukaScene:PhoukaScene;
      
      public var parasiteScene:ParasiteScene;
      
      public var marielle:Marielle;
      
      public var infestedChameleonGirlScene:InfestedChameleonGirlScene;
      
      public var frogGirlScene:FrogGirlScene;
      
      public var chameleonGirlScene:ChameleonGirlScene;
      
      public var bogTemple:BogTemple;
      
      public var anneMarieScene:AnneMarieScene;
      
      public var _explorationEncounter:Encounter;
      
      public function Bog(param1:GuiOutput = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         _explorationEncounter = null;
         marielle = new Marielle();
         bogTemple = new BogTemple();
         anneMarieScene = new AnneMarieScene();
         infestedChameleonGirlScene = new InfestedChameleonGirlScene();
         parasiteScene = new ParasiteScene();
         chameleonGirlScene = new ChameleonGirlScene();
         super();
         phoukaScene = new PhoukaScene();
         frogGirlScene = new FrogGirlScene(param1);
      }
      
      public function walk() : void
      {
         clearOutput();
         get_images().showImage("area-bog");
         outputText("你在潮湿的泥浆中四处游荡，但没有遇到任何有趣的东西。");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function isDiscovered() : Boolean
      {
         return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1016) > 0;
      }
      
      public function get_explorationEncounter() : Encounter
      {
         var _gthis:Bog = this;
         if(_explorationEncounter == null)
         {
            _explorationEncounter = Encounters.group("bog",get_game().commonEncounters,EncounterOrDef_Impl_.fromDef(new EncounterDef("phoukahalloween",null,EncounterChance_Impl_.fromBoolFun(function():Boolean
            {
               if(_gthis.isHalloween() && int(_gthis.get_date().getFullYear()) > FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1175))
               {
                  return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1173) > 0;
               }
               return false;
            }),OneOf_Impl_.fromA(phoukaScene.phoukaHalloween),null)),EncounterOrDef_Impl_.fromDef(new EncounterDef("chest",EncounterChance_Impl_.fromFloatConst(0.1),EncounterChance_Impl_.fromBoolFun(function():Boolean
            {
               return !_gthis.get_player().hasKeyItem("Camp - Murky Chest");
            }),OneOf_Impl_.fromA(findMurkyChest),null)),frogGirlScene,EncounterOrDef_Impl_.fromDef(new EncounterDef("phouka",null,null,OneOf_Impl_.fromA(phoukaScene.phoukaEncounter),null)),EncounterOrDef_Impl_.fromDef(new EncounterDef("chameleon",null,null,OneOf_Impl_.fromA(chameleonGirlScene.encounterChameleon),null)),EncounterOrDef_Impl_.fromDef(new EncounterDef("parasite",function():Number
            {
               return _gthis.get_parasiteRating() / 2;
            },EncounterChance_Impl_.fromBoolFun(function():Boolean
            {
               if(_gthis.get_parasiteRating() != 0)
               {
                  return !_gthis.get_player().hasStatusEffect(StatusEffects.ParasiteSlugMet);
               }
               return false;
            }),OneOf_Impl_.fromA(parasiteScene.findParasite),null)),EncounterOrDef_Impl_.fromDef(new EncounterDef("inf_chameleon",function():Number
            {
               return _gthis.get_parasiteRating() / 2;
            },EncounterChance_Impl_.fromBoolFun(function():Boolean
            {
               if(_gthis.get_parasiteRating() != 0)
               {
                  return !_gthis.get_player().hasStatusEffect(StatusEffects.ParasiteEel);
               }
               return false;
            }),OneOf_Impl_.fromA(infestedChameleonGirlScene.encounterChameleon),null)),get_game().sylviaScene,EncounterOrDef_Impl_.fromDef(new EncounterDef("bogtemple",null,EncounterChance_Impl_.fromBoolFun(function():Boolean
            {
               return _gthis.bogTemple.saveContent.excludeExplore < _gthis.get_time().get_totalTime();
            }),OneOf_Impl_.fromA(bogTemple.templeEncounter),null)),EncounterOrDef_Impl_.fromDef(new EncounterDef("walk",EncounterChance_Impl_.fromFloatConst(0.2),null,OneOf_Impl_.fromA(walk),null)));
         }
         return _explorationEncounter;
      }
      
      public function findMurkyChest() : void
      {
         var _loc1_:int = 200 + Utils.rand(300);
         get_images().showImage("item-chest");
         outputText("当你正忙着自己的事情时，你发现了一个浸水的箱子。你在浑浊的水中跋涉，直到终于够到了箱子。当你打开箱子时，你发现里面有 " + ("" + _loc1_) + " 颗宝石！你把宝石装进口袋，把箱子拖回家。一旦你清理干净箱子内部，它就会成为一个很好的储物箱。");
         get_player().createKeyItem("Camp - Murky Chest",0,0,0,0);
         var _loc2_:Player = get_player();
         _loc2_.set_gems(_loc2_.get_gems() + _loc1_);
         statScreenRefresh();
         outputText("[pg]<b>你现在在营地有 " + Utils.num2Text(get_inventory().itemStorageSize()) + " 个储物槽。</b>");
         doNext(get_camp().returnToCampUseOneHour);
      }
      
      public function explore() : void
      {
         clearOutput();
         get_player().location = "沼泽";
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,1016,FlagDict_Impl_.arrayReadInt(_loc1_,1016) + 1);
         if(get_player().isFullMermaid())
         {
            get_player().createStatusEffect(StatusEffects.MermaidWatered);
         }
         get_explorationEncounter().execEncounter();
      }
      
      public function discover() : void
      {
         clearOutput();
         get_images().showImage("area-bog");
         outputText("在探索沼泽时，你发现自己进入了这个原本就恶臭的生物群落中一个特别黑暗、潮湿的区域。你判断，如果你愿意的话，将来你可以很容易地找到回这里的路。带着你新发现的记忆，你回到了营地。");
         outputText("[pg](<b>泥沼探索地点已解锁！</b>)");
         var _loc1_:IMap = KFLAGS.flags;
         FlagDict_Impl_.arrayWriteInt(_loc1_,1016,FlagDict_Impl_.arrayReadInt(_loc1_,1016) + 1);
         doNext(get_camp().returnToCampUseOneHour);
      }
   }
}

