package classes
{
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.globalFlags.KGAMECLASS;
   import classes.internals.GuiInput;
   import classes.internals.Utils;
   import classes.items.ArmorLib;
   import classes.items.ConsumableLib;
   import classes.items.JewelryLib;
   import classes.items.Mutations;
   import classes.items.ShieldLib;
   import classes.items.UndergarmentLib;
   import classes.items.UseableLib;
   import classes.items.WeaponLib;
   import classes.parser.Parser;
   import classes.scenes.Camp;
   import classes.scenes.CommonEncounters;
   import classes.scenes.Dreams;
   import classes.scenes.Exploration;
   import classes.scenes.FollowerInteractions;
   import classes.scenes.Inventory;
   import classes.scenes.Masturbation;
   import classes.scenes.areas.Bog;
   import classes.scenes.areas.DeepWoods;
   import classes.scenes.areas.Desert;
   import classes.scenes.areas.Forest;
   import classes.scenes.areas.GlacialRift;
   import classes.scenes.areas.HighMountains;
   import classes.scenes.areas.Lake;
   import classes.scenes.areas.Mountain;
   import classes.scenes.areas.Plains;
   import classes.scenes.areas.Swamp;
   import classes.scenes.areas.VolcanicCrag;
   import classes.scenes.camp.BeautifulSwordScene;
   import classes.scenes.combat.Combat;
   import classes.scenes.combat.CombatRangeData;
   import classes.scenes.dungeons.DungeonCore;
   import classes.scenes.dungeons.DungeonMap;
   import classes.scenes.dungeons.LiddelliumEventDungeon;
   import classes.scenes.dungeons.helDungeon.BrigidScene;
   import classes.scenes.dungeons.lethicesKeep.LethicesKeep;
   import classes.scenes.explore.Gargoyle;
   import classes.scenes.explore.Giacomo;
   import classes.scenes.explore.Lumi;
   import classes.scenes.monsters.AliceScene;
   import classes.scenes.monsters.GoblinAssassinScene;
   import classes.scenes.monsters.GoblinScene;
   import classes.scenes.monsters.GoblinShamanScene;
   import classes.scenes.monsters.GoblinSharpshooterScene;
   import classes.scenes.monsters.GoblinWarriorScene;
   import classes.scenes.monsters.ImpScene;
   import classes.scenes.monsters.IvorySuccubusScene;
   import classes.scenes.monsters.MimicScene;
   import classes.scenes.monsters.PlagueRatScene;
   import classes.scenes.monsters.PriscillaScene;
   import classes.scenes.monsters.SuccubusScene;
   import classes.scenes.monsters.pregnancies.PlayerBunnyPregnancy;
   import classes.scenes.monsters.pregnancies.PlayerCentaurPregnancy;
   import classes.scenes.npcs.AmilyScene;
   import classes.scenes.npcs.AnemoneScene;
   import classes.scenes.npcs.ArianScene;
   import classes.scenes.npcs.CeraphFollowerScene;
   import classes.scenes.npcs.CeraphScene;
   import classes.scenes.npcs.EmberScene;
   import classes.scenes.npcs.Exgartuan;
   import classes.scenes.npcs.HelFollower;
   import classes.scenes.npcs.HelScene;
   import classes.scenes.npcs.HelSpawnScene;
   import classes.scenes.npcs.HolliScene;
   import classes.scenes.npcs.IsabellaFollowerScene;
   import classes.scenes.npcs.IsabellaScene;
   import classes.scenes.npcs.IzmaScene;
   import classes.scenes.npcs.JojoScene;
   import classes.scenes.npcs.KihaFollowerScene;
   import classes.scenes.npcs.KihaScene;
   import classes.scenes.npcs.LatexGirl;
   import classes.scenes.npcs.MarblePurification;
   import classes.scenes.npcs.MarbleScene;
   import classes.scenes.npcs.MilkWaifu;
   import classes.scenes.npcs.NephilaCovenFollowerScene;
   import classes.scenes.npcs.NephilaCovenScene;
   import classes.scenes.npcs.Raphael;
   import classes.scenes.npcs.Rathazul;
   import classes.scenes.npcs.SheilaScene;
   import classes.scenes.npcs.ShouldraFollower;
   import classes.scenes.npcs.ShouldraScene;
   import classes.scenes.npcs.SophieBimbo;
   import classes.scenes.npcs.SophieFollowerScene;
   import classes.scenes.npcs.SophieScene;
   import classes.scenes.npcs.SylviaScene;
   import classes.scenes.npcs.UrtaHeatRut;
   import classes.scenes.npcs.UrtaPregs;
   import classes.scenes.npcs.UrtaScene;
   import classes.scenes.npcs.Valeria;
   import classes.scenes.npcs.Vapula;
   import classes.scenes.npcs.pets.Akky;
   import classes.scenes.npcs.pregnancies.PlayerBenoitPregnancy;
   import classes.scenes.npcs.pregnancies.PlayerOviElixirPregnancy;
   import classes.scenes.places.Bazaar;
   import classes.scenes.places.Boat;
   import classes.scenes.places.Cabin;
   import classes.scenes.places.Farm;
   import classes.scenes.places.MothCave;
   import classes.scenes.places.Owca;
   import classes.scenes.places.Swim;
   import classes.scenes.places.TelAdre;
   import classes.scenes.places.TownRuins;
   import classes.scenes.quests.UrtaQuest;
   import classes.scenes.seasonal.AprilFools;
   import classes.scenes.seasonal.Fera;
   import classes.scenes.seasonal.Seasons;
   import classes.scenes.seasonal.Thanksgiving;
   import classes.scenes.seasonal.Valentines;
   import classes.scenes.seasonal.XmasBase;
   import coc.view.CoCButton;
   import coc.view.MainView;
   import flash.Boot;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.display.Stage;
   import flash.events.Event;
   import haxe.IMap;
   import haxe.ds.IntMap;
   
   public class CoC extends Sprite implements GuiInput
   {
      
      public static var init__:Boolean;
      
      public static var ___init:*;
      
      public static var saveVersion:String = "hgg 1.7.0";
      
      public static var _saveAwareClassList:Array = [];
      
      public var xmas:XmasBase;
      
      public var weapons:WeaponLib;
      
      public var volcanicCrag:VolcanicCrag;
      
      public var versionID:uint;
      
      public var version:String;
      
      public var ver:String;
      
      public var vapula:Vapula;
      
      public var valeria:Valeria;
      
      public var valentines:Valentines;
      
      public var useables:UseableLib;
      
      public var urtaQuest:UrtaQuest;
      
      public var urtaPregs:UrtaPregs;
      
      public var urtaHeatRut:UrtaHeatRut;
      
      public var urta:UrtaScene;
      
      public var undergarments:UndergarmentLib;
      
      public var townRuins:TownRuins;
      
      public var timeQ:Number;
      
      public var time:Time;
      
      public var thanksgiving:Thanksgiving;
      
      public var telAdre:TelAdre;
      
      public var sylviaScene:SylviaScene;
      
      public var swim:Swim;
      
      public var swamp:Swamp;
      
      public var succubusScene:SuccubusScene;
      
      public var sophieScene:SophieScene;
      
      public var sophieFollowerScene:SophieFollowerScene;
      
      public var sophieBimbo:SophieBimbo;
      
      public var shouldraScene:ShouldraScene;
      
      public var shouldraFollower:ShouldraFollower;
      
      public var shields:ShieldLib;
      
      public var sheilaScene:SheilaScene;
      
      public var secondaryParser:Parser;
      
      public var seasons:Seasons;
      
      public var saves:Saves;
      
      public var rathazul:Rathazul;
      
      public var raphael:Raphael;
      
      public var playerInfo:PlayerInfo;
      
      public var playerEvent:PlayerEvents;
      
      public var playerAppearance:PlayerAppearance;
      
      public var player2:Player;
      
      public var player:Player;
      
      public var plains:Plains;
      
      public var plagueRatScene:PlagueRatScene;
      
      public var permObjVersionID:uint;
      
      public var perkTree:PerkTree;
      
      public var parser:Parser;
      
      public var owca:Owca;
      
      public var output:Output;
      
      public var oldStats:StatStore;
      
      public var nephilaCovenScene:NephilaCovenScene;
      
      public var nephilaCovenFollowerScene:NephilaCovenFollowerScene;
      
      public var mutations:Mutations;
      
      public var mountain:Mountain;
      
      public var mothCave:MothCave;
      
      public var monsterArray:Array;
      
      public var monsterAbilities:MonsterAbilities;
      
      public var monster:Monster;
      
      public var modSaveVersion:int;
      
      public var mimicScene:MimicScene;
      
      public var milkWaifu:MilkWaifu;
      
      public var masturbation:Masturbation;
      
      public var marbleScene:MarbleScene;
      
      public var marblePurification:MarblePurification;
      
      public var mainViewManager:MainViewManager;
      
      public var mainView:MainView;
      
      public var mainMenu:MainMenu;
      
      public var lumi:Lumi;
      
      public var liddelliumEventDungeon:LiddelliumEventDungeon;
      
      public var levelCap:Number;
      
      public var lethicesKeep:LethicesKeep;
      
      public var latexGirl:LatexGirl;
      
      public var lake:Lake;
      
      public var kihaScene:KihaScene;
      
      public var kihaFollowerScene:KihaFollowerScene;
      
      public var jojoScene:JojoScene;
      
      public var jewelries:JewelryLib;
      
      public var izmaScene:IzmaScene;
      
      public var ivorySuccubusScene:IvorySuccubusScene;
      
      public var isabellaScene:IsabellaScene;
      
      public var isabellaFollowerScene:IsabellaFollowerScene;
      
      public var inventory:Inventory;
      
      public var inputManager:InputManager;
      
      public var inRoomedDungeonResume:Function;
      
      public var inRoomedDungeonName:String;
      
      public var inRoomedDungeon:Boolean;
      
      public var inDungeon:Boolean;
      
      public var impScene:ImpScene;
      
      public var images:ImageManager;
      
      public var holliScene:HolliScene;
      
      public var highMountains:HighMountains;
      
      public var helSpawnScene:HelSpawnScene;
      
      public var helScene:HelScene;
      
      public var helFollower:HelFollower;
      
      public var goblinWarriorScene:GoblinWarriorScene;
      
      public var goblinSharpshooterScene:GoblinSharpshooterScene;
      
      public var goblinShamanScene:GoblinShamanScene;
      
      public var goblinScene:GoblinScene;
      
      public var goblinElderScene:PriscillaScene;
      
      public var goblinAssassinScene:GoblinAssassinScene;
      
      public var glacialRift:GlacialRift;
      
      public var giacomoShop:Giacomo;
      
      public var gargoyle:Gargoyle;
      
      public var gameSettings:GameSettings;
      
      public var forest:Forest;
      
      public var followerInteractions:FollowerInteractions;
      
      public var fera:Fera;
      
      public var farm:Farm;
      
      public var exploration:Exploration;
      
      public var exgartuan:Exgartuan;
      
      public var emberScene:EmberScene;
      
      public var dungeons:DungeonCore;
      
      public var dungeonLoc:int;
      
      public var dreams:Dreams;
      
      public var desert:Desert;
      
      public var deepWoods:DeepWoods;
      
      public var debugMenu:DebugMenu;
      
      public var debug:Boolean;
      
      public var date:Date;
      
      public var consumables:ConsumableLib;
      
      public var commonEncounters:CommonEncounters;
      
      public var combatRangeData:CombatRangeData;
      
      public var combat:Combat;
      
      public var charCreation:CharCreation;
      
      public var ceraphScene:CeraphScene;
      
      public var ceraphFollowerScene:CeraphFollowerScene;
      
      public var campQ:Boolean;
      
      public var camp:Camp;
      
      public var cabin:Cabin;
      
      public var brigidScene:BrigidScene;
      
      public var bog:Bog;
      
      public var boat:Boat;
      
      public var bindings:Bindings;
      
      public var beautifulSwordScene:BeautifulSwordScene;
      
      public var bazaar:Bazaar;
      
      public var armors:ArmorLib;
      
      public var arianScene:ArianScene;
      
      public var aprilFools:AprilFools;
      
      public var anemoneScene:AnemoneScene;
      
      public var amilyScene:AmilyScene;
      
      public var aliceScene:AliceScene;
      
      public var akky:Akky;
      
      public var achievements:IMap;
      
      public var achievementList:Achievements;
      
      public var _statusEffects:StatusEffects;
      
      public var _perkLib:PerkLib;
      
      public var _masteryLib:MasteryLib;
      
      public var _gameState:int;
      
      public function CoC(param1:Stage = undefined)
      {
         var _loc2_:* = null as Stage;
         if(Boot.skip_constructor)
         {
            return;
         }
         campQ = false;
         timeQ = 0;
         inRoomedDungeonName = "";
         inRoomedDungeonResume = null;
         inRoomedDungeon = false;
         dungeonLoc = 0;
         inDungeon = false;
         levelCap = 120;
         modSaveVersion = 15;
         date = Date.now();
         _gameState = 0;
         achievements = new IntMap();
         monsterArray = [];
         permObjVersionID = 0;
         versionID = 0;
         debug = false;
         output = Output.init();
         bindings = new Bindings();
         mainViewManager = new MainViewManager();
         debugMenu = new DebugMenu();
         gameSettings = new GameSettings();
         mainMenu = new MainMenu();
         urtaQuest = new UrtaQuest();
         xmas = new XmasBase();
         valentines = new Valentines();
         thanksgiving = new Thanksgiving();
         fera = new Fera();
         aprilFools = new AprilFools();
         seasons = new Seasons();
         townRuins = new TownRuins();
         mothCave = new MothCave();
         owca = new Owca();
         farm = new Farm();
         swim = new Swim();
         boat = new Boat();
         bazaar = new Bazaar();
         cabin = new Cabin();
         akky = new Akky();
         vapula = new Vapula();
         valeria = new Valeria();
         urtaHeatRut = new UrtaHeatRut();
         urta = new UrtaScene();
         sylviaScene = new SylviaScene();
         sophieScene = new SophieScene();
         sophieFollowerScene = new SophieFollowerScene();
         sophieBimbo = new SophieBimbo();
         shouldraScene = new ShouldraScene();
         shouldraFollower = new ShouldraFollower();
         sheilaScene = new SheilaScene();
         rathazul = new Rathazul();
         raphael = new Raphael();
         nephilaCovenFollowerScene = new NephilaCovenFollowerScene();
         nephilaCovenScene = new NephilaCovenScene();
         milkWaifu = new MilkWaifu();
         marblePurification = new MarblePurification();
         latexGirl = new LatexGirl();
         kihaScene = new KihaScene();
         kihaFollowerScene = new KihaFollowerScene();
         isabellaFollowerScene = new IsabellaFollowerScene();
         isabellaScene = new IsabellaScene();
         holliScene = new HolliScene();
         helSpawnScene = new HelSpawnScene();
         helScene = new HelScene();
         helFollower = new HelFollower();
         exgartuan = new Exgartuan();
         ceraphFollowerScene = new CeraphFollowerScene();
         ceraphScene = new CeraphScene();
         arianScene = new ArianScene();
         aliceScene = new AliceScene();
         beautifulSwordScene = new BeautifulSwordScene();
         succubusScene = new SuccubusScene();
         ivorySuccubusScene = new IvorySuccubusScene();
         plagueRatScene = new PlagueRatScene();
         mimicScene = new MimicScene();
         goblinElderScene = new PriscillaScene();
         goblinShamanScene = new GoblinShamanScene();
         goblinWarriorScene = new GoblinWarriorScene();
         goblinSharpshooterScene = new GoblinSharpshooterScene();
         goblinAssassinScene = new GoblinAssassinScene();
         goblinScene = new GoblinScene();
         giacomoShop = new Giacomo();
         lumi = new Lumi();
         gargoyle = new Gargoyle();
         liddelliumEventDungeon = new LiddelliumEventDungeon();
         lethicesKeep = new LethicesKeep();
         brigidScene = new BrigidScene();
         combatRangeData = new CombatRangeData();
         combat = new Combat();
         exploration = new Exploration();
         glacialRift = new GlacialRift();
         commonEncounters = new CommonEncounters();
         masturbation = new Masturbation();
         followerInteractions = new FollowerInteractions();
         dreams = new Dreams();
         camp = new Camp();
         achievementList = new Achievements();
         shields = new ShieldLib();
         jewelries = new JewelryLib();
         undergarments = new UndergarmentLib();
         armors = new ArmorLib();
         weapons = new WeaponLib();
         consumables = new ConsumableLib();
         mutations = Mutations.init();
         monsterAbilities = new MonsterAbilities();
         perkTree = new PerkTree();
         playerInfo = new PlayerInfo();
         playerAppearance = new PlayerAppearance();
         charCreation = new CharCreation();
         _masteryLib = new MasteryLib();
         _statusEffects = new StatusEffects();
         _perkLib = new PerkLib();
         version = "/hgg/模组 " + "v1.1汉化测试版" + "（空洞之心，空洞之颅，万圣节）";
         super();
         saves = new Saves(gameStateDirectGet,gameStateDirectSet);
         inventory = new Inventory();
         if(param1 != null)
         {
            _loc2_ = param1;
            doInit();
         }
         else if(stage != null)
         {
            _loc2_ = stage;
            doInit();
         }
         else
         {
            addEventListener(Event.ADDED_TO_STAGE,doInit);
         }
      }
      
      public static function timeAwareClassAdd(param1:TimeAwareInterface) : void
      {
         EventParser.timeAwareClassAdd(param1);
      }
      
      public static function timeAwareClassRemove(param1:TimeAwareInterface) : Number
      {
         return EventParser.timeAwareClassRemove(param1);
      }
      
      public static function saveAllAwareClasses(param1:CoC) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < int(CoC._saveAwareClassList.length))
         {
            CoC._saveAwareClassList[_loc2_].updateBeforeSave(param1);
            _loc2_++;
         }
      }
      
      public static function loadAllAwareClasses(param1:CoC) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < int(CoC._saveAwareClassList.length))
         {
            CoC._saveAwareClassList[_loc2_].updateAfterLoad(param1);
            _loc2_++;
         }
      }
      
      public static function saveAwareClassAdd(param1:SaveAwareInterface) : void
      {
         CoC._saveAwareClassList.push(param1);
      }
      
      public static function setUpLogging() : void
      {
      }
      
      public static function createImage(param1:Class, param2:Function) : void
      {
         param2(Type.createInstance(param1,[0,0]));
      }
      
      public function spriteSelect(param1:Class = undefined) : void
      {
         if(param1 == null || !get_spritesEnabled())
         {
            mainViewManager.hideSprite();
            return;
         }
         mainView.minimapView.hide();
         CoC.createImage(param1,mainViewManager.showSpriteBitmap);
      }
      
      public function softLevelMin(param1:int, param2:int = 6) : Boolean
      {
         if(player.level < param1)
         {
            return time.days >= param1 * param2;
         }
         return true;
      }
      
      public function set_inCombat(param1:Boolean) : Boolean
      {
         _gameState = param1 ? 1 : 0;
         return param1;
      }
      
      public function set_hermUnlocked(param1:Boolean) : Boolean
      {
         get_miscSettings().hermUnlocked = param1;
         return param1;
      }
      
      public function setSexLeaveButton(param1:Object = undefined, param2:String = undefined, param3:int = 14, param4:int = -1, param5:int = 0) : void
      {
         var _g:Combat;
         if(param2 == null)
         {
            param2 = "离开";
         }
         if(param1 == null)
         {
            _g = combat;
            param1 = function():void
            {
               _g.cleanupAfterCombat();
            };
         }
         if(param4 == -1)
         {
            param4 = monster.get_gender();
         }
         if(player.playerResistSex(param4,param5))
         {
            addButton(param3,param2,param1);
         }
         else
         {
            output.addButtonDisabled(param3,param2,"你无法抗拒性爱的诱惑！");
         }
      }
      
      public function setInput(param1:String = undefined) : void
      {
         if(param1 == null)
         {
            param1 = "";
         }
         mainView.nameBox.text = param1;
         mainView.nameBox.dispatchEvent(new Event(Event.CHANGE));
      }
      
      public function run() : void
      {
         mainView.eventTestInput.x = -10207.5;
         mainView.eventTestInput.y = -1055.1;
         saves.loadPermObject();
         mainViewManager.applyTheme();
         mainView.setTextBackground(get_textBackground());
         mainMenu.mainMenu();
         gameSettings.readyForTheme = true;
         gameSettings.lastTheme();
      }
      
      public function resetParsers(param1:Boolean = false) : void
      {
         parser.resetParser(param1);
         secondaryParser.resetParser(param1);
      }
      
      public function resetInput() : String
      {
         var _loc1_:String = mainView.nameBox.text;
         mainView.resetNameBox();
         return _loc1_;
      }
      
      public function registerTag(param1:String, param2:Function) : void
      {
         parser.registerTag(param1,param2);
         secondaryParser.registerTag(param1,param2);
      }
      
      public function rawOutputText(param1:String) : void
      {
         output.raw(param1);
      }
      
      public function rand(param1:int) : int
      {
         return Utils.rand(param1);
      }
      
      public function promptInput(param1:Object) : void
      {
         mainView.promptInput(param1);
      }
      
      public function playerMenu() : void
      {
         EventParser.playerMenu();
      }
      
      public function outputText(param1:String) : void
      {
         output.text(param1);
      }
      
      public function onInputChanged(param1:Function) : void
      {
         mainView.nameBox.addEventListener(Event.CHANGE,param1);
      }
      
      public function newPlayer() : Player
      {
         player.removeStatuses(false);
         player = new Player();
         return player;
      }
      
      public function menu(param1:Boolean = true) : void
      {
         output.menu(param1);
      }
      
      public function imageSelect(param1:Class = undefined, param2:int = 0, param3:int = 0) : void
      {
         var y1:int;
         var x1:int;
         var _g:MainViewManager;
         if(param1 == null || !get_spritesEnabled())
         {
            mainViewManager.hideImage();
            return;
         }
         mainView.minimapView.hide();
         _g = mainViewManager;
         x1 = param2;
         y1 = param3;
         CoC.createImage(param1,function(param1:BitmapData):void
         {
            _g.showImageBitmap(param1,x1,y1);
         });
      }
      
      public function hideInput() : String
      {
         mainView.nameBox.visible = false;
         return mainView.nameBox.text;
      }
      
      public function goNext(param1:Number, param2:Boolean) : Boolean
      {
         return EventParser.goNext(param1,param2);
      }
      
      public function get_watersportsEnabled() : Boolean
      {
         return get_fetishSettings().watersports;
      }
      
      public function get_urtaDisabled() : Boolean
      {
         if(get_npcSettings().urtaDisabled && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,12) <= 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,11) <= 0)
         {
            return FlagDict_Impl_.arrayReadFloat(KFLAGS.flags,711) == 0;
         }
         return false;
      }
      
      public function get_textBackground() : int
      {
         return get_displaySettings().textBackground;
      }
      
      public function get_survival() : Boolean
      {
         return get_modeSettings().survival;
      }
      
      public function get_spritesEnabled() : Boolean
      {
         return get_displaySettings().sprites > 0;
      }
      
      public function get_silly() : Boolean
      {
         return get_modeSettings().silly;
      }
      
      public function get_realistic() : Boolean
      {
         return get_modeSettings().realistic;
      }
      
      public function get_parasitesHigh() : Boolean
      {
         return get_fetishSettings().parasites > 1;
      }
      
      public function get_parasiteRating() : int
      {
         return get_fetishSettings().parasites;
      }
      
      public function get_oldSprites() : Boolean
      {
         return get_displaySettings().sprites == 1;
      }
      
      public function get_oldAscension() : Boolean
      {
         return get_modeSettings().oldAscension;
      }
      
      public function get_npcSettings() : SettingsNPC
      {
         return gameSettings.get_npc();
      }
      
      public function get_noFur() : Boolean
      {
         return !get_fetishSettings().furry;
      }
      
      public function get_nephilaEnabled() : Boolean
      {
         return get_fetishSettings().nephila;
      }
      
      public function get_modeSettings() : SettingsModes
      {
         return gameSettings.get_modes();
      }
      
      public function get_miscSettings() : SettingsGlobalMisc
      {
         return gameSettings.get_misc();
      }
      
      public function get_metric() : Boolean
      {
         return get_displaySettings().metric;
      }
      
      public function get_lowStandards() : Boolean
      {
         return get_npcSettings().lowStandards;
      }
      
      public function get_inCombat() : Boolean
      {
         return _gameState == 1;
      }
      
      public function get_hyper() : Boolean
      {
         return get_modeSettings().hyper;
      }
      
      public function get_hermUnlocked() : Boolean
      {
         return get_miscSettings().hermUnlocked;
      }
      
      public function get_hardcoreSlot() : String
      {
         return get_modeSettings().hardcoreSlot;
      }
      
      public function get_hardcore() : Boolean
      {
         return get_modeSettings().hardcore;
      }
      
      public function get_goreEnabled() : Boolean
      {
         return get_fetishSettings().gore;
      }
      
      public function get_gameplaySettings() : SettingsGlobalGameplay
      {
         return gameSettings.get_gameplay();
      }
      
      public function get_gameState() : int
      {
         return _gameState;
      }
      
      public function get_filthEnabled() : Boolean
      {
         return get_fetishSettings().filth;
      }
      
      public function get_fetishSettings() : SettingsGlobalFetishes
      {
         return gameSettings.get_fetish();
      }
      
      public function get_easyMode() : Boolean
      {
         return get_difficulty() < 0;
      }
      
      public function get_displaySettings() : SettingsGlobalDisplay
      {
         return gameSettings.get_display();
      }
      
      public function get_difficulty() : int
      {
         var _loc1_:Object = get_modeSettings().difficulty;
         if(_loc1_ != null)
         {
            return _loc1_;
         }
         return 0;
      }
      
      public function get_creepingTaint() : Boolean
      {
         return get_modeSettings().taint;
      }
      
      public function get_animateStatBars() : Boolean
      {
         return get_displaySettings().animateStatBars;
      }
      
      public function get_allowChild() : Boolean
      {
         return get_fetishSettings().underage >= 1;
      }
      
      public function get_allowBaby() : Boolean
      {
         return get_fetishSettings().underage >= 2;
      }
      
      public function get_addictionEnabled() : Boolean
      {
         return get_fetishSettings().addiction;
      }
      
      public function getInput() : String
      {
         return mainView.nameBox.text;
      }
      
      public function genericNamePrompt(param1:String = undefined) : void
      {
         if(param1 == null)
         {
            param1 = "";
         }
         output.flush();
         mainView.promptName(param1);
      }
      
      public function gameStateDirectSet(param1:int) : void
      {
         _gameState = param1;
      }
      
      public function gameStateDirectGet() : int
      {
         return _gameState;
      }
      
      public function gameOver(param1:Boolean = false) : void
      {
         EventParser.gameOver(param1);
      }
      
      public function formatHeader(param1:String) : String
      {
         return output.formatHeader(param1);
      }
      
      public function dynStats(... rest) : Object
      {
         if(int(rest.length) == 0)
         {
            return player.dynStats();
         }
         else if(int(rest.length) == 1)
         {
            return player.dynStats(rest[0]);
         }
         else if(int(rest.length) == 2)
         {
            return player.dynStats(rest[0],rest[1]);
         }
         else if(int(rest.length) == 3)
         {
            return player.dynStats(rest[0],rest[1],rest[2]);
         }
         else if(int(rest.length) == 4)
         {
            return player.dynStats(rest[0],rest[1],rest[2],rest[3]);
         }
         else if(int(rest.length) == 5)
         {
            return player.dynStats(rest[0],rest[1],rest[2],rest[3],rest[4]);
         }
         else if(int(rest.length) == 6)
         {
            return player.dynStats(rest[0],rest[1],rest[2],rest[3],rest[4],rest[5]);
         }
         else if(int(rest.length) == 7)
         {
            return player.dynStats(rest[0],rest[1],rest[2],rest[3],rest[4],rest[5],rest[6]);
         }
         else if(int(rest.length) == 8)
         {
            return player.dynStats(rest[0],rest[1],rest[2],rest[3],rest[4],rest[5],rest[6],rest[7]);
         }
         else if(int(rest.length) == 9)
         {
            return player.dynStats(rest[0],rest[1],rest[2],rest[3],rest[4],rest[5],rest[6],rest[7],rest[8]);
         }
         else if(int(rest.length) == 10)
         {
            return player.dynStats(rest[0],rest[1],rest[2],rest[3],rest[4],rest[5],rest[6],rest[7],rest[8],rest[9]);
         }
         else if(int(rest.length) == 11)
         {
            return player.dynStats(rest[0],rest[1],rest[2],rest[3],rest[4],rest[5],rest[6],rest[7],rest[8],rest[9],rest[10]);
         }
         else if(int(rest.length) == 12)
         {
            return player.dynStats(rest[0],rest[1],rest[2],rest[3],rest[4],rest[5],rest[6],rest[7],rest[8],rest[9],rest[10],rest[11]);
         }
         else if(int(rest.length) == 13)
         {
            return player.dynStats(rest[0],rest[1],rest[2],rest[3],rest[4],rest[5],rest[6],rest[7],rest[8],rest[9],rest[10],rest[11],rest[12]);
         }
         else if(int(rest.length) == 14)
         {
            return player.dynStats(rest[0],rest[1],rest[2],rest[3],rest[4],rest[5],rest[6],rest[7],rest[8],rest[9],rest[10],rest[11],rest[12],rest[13]);
         }
         else if(int(rest.length) == 15)
         {
            return player.dynStats(rest[0],rest[1],rest[2],rest[3],rest[4],rest[5],rest[6],rest[7],rest[8],rest[9],rest[10],rest[11],rest[12],rest[13],rest[14]);
         }
         else if(int(rest.length) == 16)
         {
            return player.dynStats(rest[0],rest[1],rest[2],rest[3],rest[4],rest[5],rest[6],rest[7],rest[8],rest[9],rest[10],rest[11],rest[12],rest[13],rest[14],rest[15]);
         }
         else if(int(rest.length) == 17)
         {
            return player.dynStats(rest[0],rest[1],rest[2],rest[3],rest[4],rest[5],rest[6],rest[7],rest[8],rest[9],rest[10],rest[11],rest[12],rest[13],rest[14],rest[15],rest[16]);
         }
         else if(int(rest.length) == 18)
         {
            return player.dynStats(rest[0],rest[1],rest[2],rest[3],rest[4],rest[5],rest[6],rest[7],rest[8],rest[9],rest[10],rest[11],rest[12],rest[13],rest[14],rest[15],rest[16],rest[17]);
         }
         else if(int(rest.length) == 19)
         {
            return player.dynStats(rest[0],rest[1],rest[2],rest[3],rest[4],rest[5],rest[6],rest[7],rest[8],rest[9],rest[10],rest[11],rest[12],rest[13],rest[14],rest[15],rest[16],rest[17],rest[18]);
         }
         else
         {
            if(int(rest.length) != 20)
            {
               throw "Too many rest arguments";
            }
            return player.dynStats(rest[0],rest[1],rest[2],rest[3],rest[4],rest[5],rest[6],rest[7],rest[8],rest[9],rest[10],rest[11],rest[12],rest[13],rest[14],rest[15],rest[16],rest[17],rest[18],rest[19]);
         }
      }
      
      public function doNothing() : void
      {
      }
      
      public function doInit(param1:Event = undefined) : void
      {
         var _loc2_:Stage = stage;
         removeEventListener(Event.ADDED_TO_STAGE,doInit);
         KGAMECLASS.kGAMECLASS = this;
         createScenes();
         useables = new UseableLib();
         parser = new Parser();
         secondaryParser = new Parser();
         mainView = new MainView();
         mainView.name = "mainView";
         mainView.addEventListener(Event.ADDED_TO_STAGE,_postInit);
         _loc2_.addChild(mainView);
      }
      
      public function displayHeader(param1:String) : void
      {
         output.text(output.formatHeader(param1));
      }
      
      public function createScenes() : void
      {
         dungeons = new DungeonCore();
         bog = new Bog(output);
         mountain = new Mountain(output);
         highMountains = new HighMountains(output);
         volcanicCrag = new VolcanicCrag(output);
         swamp = new Swamp(output);
         plains = new Plains(output);
         forest = new Forest(output);
         deepWoods = new DeepWoods(forest);
         desert = new Desert(output);
         telAdre = new TelAdre();
         impScene = new ImpScene(output);
         anemoneScene = new AnemoneScene(output);
         marbleScene = new MarbleScene(output);
         jojoScene = new JojoScene(output);
         amilyScene = new AmilyScene(output);
         izmaScene = new IzmaScene(output);
         lake = new Lake(output);
         new PlayerCentaurPregnancy(output);
         new PlayerBunnyPregnancy(output,mutations);
         new PlayerBenoitPregnancy(output);
         new PlayerOviElixirPregnancy(output);
         emberScene = new EmberScene();
         urtaPregs = new UrtaPregs();
      }
      
      public function clearOutput() : void
      {
         output.clear(true);
      }
      
      public function clearInput() : void
      {
         mainView.nameBox.text = "";
         mainView.nameBox.dispatchEvent(new Event(Event.CHANGE));
      }
      
      public function cheatTime(param1:Number, param2:Boolean = false) : void
      {
         EventParser.cheatTime(param1,param2);
      }
      
      public function awardAchievement(param1:String, param2:int, param3:Boolean = true, param4:Boolean = false, param5:Boolean = true) : void
      {
         EngineCore.awardAchievement(param1,param2,param3,param4,param5);
      }
      
      public function addButton(param1:int, param2:String = undefined, param3:Function = undefined) : CoCButton
      {
         if(param2 == null)
         {
            param2 = "";
         }
         return output.addButton(param1,param2,param3);
      }
      
      public function _postInit(param1:Event) : void
      {
         var _loc2_:Stage = stage;
         mainView.set_onNewGameClick(charCreation.newGameGo);
         mainView.set_onAppearanceClick(playerAppearance.appearance);
         mainView.set_onDataClick(saves.saveLoad);
         mainView.set_onLevelClick(playerInfo.levelUpGo);
         mainView.set_onPerksClick(playerInfo.displayPerks);
         mainView.set_onStatsClick(playerInfo.displayStats);
         var _loc3_:MainView = mainView;
         debug = false;
         images = new ImageManager();
         inputManager = new InputManager(_loc2_.stage,_loc3_);
         new ControlBindings(inputManager);
         player = new Player();
         player2 = new Player();
         playerEvent = new PlayerEvents();
         monster = new Monster();
         _gameState = 0;
         time = new Time();
         mainViewManager.registerShiftKeys();
         lethicesKeep.configureRooms();
         dungeons.map = new DungeonMap();
         oldStats = new StatStore(0,0,0,0,0,0,0,0,0,0,0);
         _loc3_.hideSprite();
         _loc3_.hideImage();
         _loc3_.statsView.hideUpDown();
         run();
      }
   }
}

