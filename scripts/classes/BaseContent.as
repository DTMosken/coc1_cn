package classes
{
   import classes.globalFlags.KFLAGS;
   import classes.globalFlags.KGAMECLASS;
   import classes.internals.Utils;
   import classes.items.ArmorLib;
   import classes.items.ConsumableLib;
   import classes.items.JewelryLib;
   import classes.items.Mutations;
   import classes.items.ShieldLib;
   import classes.items.UndergarmentLib;
   import classes.items.UseableLib;
   import classes.items.WeaponLib;
   import classes.scenes.Camp;
   import classes.scenes.Inventory;
   import classes.scenes.combat.Combat;
   import classes.scenes.combat.CombatRangeData;
   import classes.scenes.dungeons.lethicesKeep.LethicesKeep;
   import classes.scenes.places.Cabin;
   import coc.view.ButtonDataList;
   import coc.view.CoCButton;
   import coc.view.MainView;
   import flash.Lib;
   import flash.net.URLRequest;
   import haxe.IMap;
   
   public class BaseContent
   {
      
      public static var ANYGENDER:int = -1;
      
      public static var NOGENDER:int = 0;
      
      public static var MALE:int = 1;
      
      public static var FEMALE:int = 2;
      
      public static var HERM:int = 3;
      
      public function BaseContent()
      {
      }
      
      public function unlockCodexEntry(param1:int, param2:Boolean = true, param3:Boolean = false) : void
      {
         EngineCore.unlockCodexEntry(param1,param2,param3);
      }
      
      public function statScreenRefresh() : void
      {
         get_output().statScreenRefresh();
      }
      
      public function startCombatMultiple(param1:Monster, param2:Monster, param3:Monster, param4:Monster, param5:Function, param6:Function, param7:Function, param8:Function, param9:String = undefined, param10:Boolean = false, param11:Boolean = true) : void
      {
         if(param9 == null)
         {
            param9 = "";
         }
         var _loc12_:Array = [];
         if(param1 != null)
         {
            _loc12_.push(param1);
         }
         if(param2 != null)
         {
            _loc12_.push(param2);
         }
         if(param3 != null)
         {
            _loc12_.push(param3);
         }
         if(param4 != null)
         {
            _loc12_.push(param4);
         }
         get_game().combat.beginCombatMultiple(_loc12_,param5,param6,param7,param8,param9,param10,param11);
      }
      
      public function startCombatImmediate(param1:Monster, param2:Boolean = false) : void
      {
         get_game().combat.beginCombat(param1,param2,false);
      }
      
      public function startCombat(param1:Monster, param2:Boolean = false, param3:Boolean = true) : void
      {
         get_game().combat.beginCombat(param1,param2,param3);
      }
      
      public function spriteSelect(param1:Class = undefined) : void
      {
         get_game().spriteSelect(param1);
      }
      
      public function softLevelMin(param1:int, param2:int = 6) : Boolean
      {
         return get_game().softLevelMin(param1,param2);
      }
      
      public function showStats() : void
      {
         get_output().showStats();
      }
      
      public function showStatUp(param1:String) : void
      {
         get_game().mainView.statsView.showStatUp(param1);
      }
      
      public function showStatDown(param1:String) : void
      {
         get_game().mainView.statsView.showStatDown(param1);
      }
      
      public function set_time(param1:Time) : Time
      {
         return get_game().time = param1;
      }
      
      public function set_player2(param1:Player) : Player
      {
         return get_game().player2 = param1;
      }
      
      public function set_player(param1:Player) : Player
      {
         return get_game().player = param1;
      }
      
      public function set_monsterArray(param1:Array) : Array
      {
         get_game().monsterArray = param1.slice(0);
         return param1;
      }
      
      public function set_monster(param1:Monster) : Monster
      {
         return get_game().monster = param1;
      }
      
      public function set_inRoomedDungeonResume(param1:Function) : Function
      {
         return get_game().inRoomedDungeonResume = param1;
      }
      
      public function set_inRoomedDungeonName(param1:String) : String
      {
         return get_game().inRoomedDungeonName = param1;
      }
      
      public function set_inRoomedDungeon(param1:Boolean) : Boolean
      {
         return get_game().inRoomedDungeon = param1;
      }
      
      public function set_inDungeon(param1:Boolean) : Boolean
      {
         return get_game().inDungeon = param1;
      }
      
      public function set_images(param1:ImageManager) : ImageManager
      {
         return get_game().images = param1;
      }
      
      public function set_hermUnlocked(param1:Boolean) : Boolean
      {
         return get_game().set_hermUnlocked(param1);
      }
      
      public function set_debug(param1:Boolean) : Boolean
      {
         return get_game().debug = param1;
      }
      
      public function set_buttons(param1:ButtonDataList) : ButtonDataList
      {
         return get_output().buttons = param1;
      }
      
      public function setSexLeaveButton(param1:Object = undefined, param2:String = undefined, param3:int = 14, param4:int = -1, param5:int = 0) : void
      {
         if(param2 == null)
         {
            param2 = "离开";
         }
         get_game().setSexLeaveButton(param1,param2,param3,param4,param5);
      }
      
      public function setInput(param1:String = undefined) : void
      {
         if(param1 == null)
         {
            param1 = "";
         }
         get_game().setInput(param1);
      }
      
      public function setExitButton(param1:String = undefined, param2:Object = undefined, param3:int = 14, param4:Boolean = false, param5:int = 0) : CoCButton
      {
         if(param1 == null)
         {
            param1 = "离开";
         }
         return get_output().setExitButton(param1,param2,param3,param4,param5);
      }
      
      public function resetParsers(param1:Boolean = false) : void
      {
         get_game().resetParsers(param1);
      }
      
      public function resetInput() : String
      {
         return get_game().resetInput();
      }
      
      public function removeButton(param1:Object = undefined, param2:String = undefined) : CoCButton
      {
         if(param1 == null)
         {
            param1 = -1;
         }
         return get_output().removeButton(param1,param2);
      }
      
      public function registerTag(param1:String, param2:Function) : void
      {
         get_game().registerTag(param1,param2);
      }
      
      public function rawOutputText(param1:String) : void
      {
         get_output().raw(param1);
      }
      
      public function promptInput(param1:Object) : void
      {
         get_game().promptInput(param1);
      }
      
      public function playerMenu() : void
      {
         get_game().mainMenu.hideMainMenu();
         get_game().playerMenu();
      }
      
      public function outputText(param1:String) : void
      {
         get_output().text(param1);
      }
      
      public function openURL(param1:String) : void
      {
         Lib.getURL(new URLRequest(param1),"_blank");
      }
      
      public function onInputChanged(param1:Function) : void
      {
         get_game().onInputChanged(param1);
      }
      
      public function menu(param1:Boolean = true) : void
      {
         get_output().menu(param1);
      }
      
      public function isWinter(param1:Boolean = false) : Boolean
      {
         return get_game().seasons.isItWinter(param1);
      }
      
      public function isValentine(param1:Boolean = false) : Boolean
      {
         return get_game().seasons.isItValentine(param1);
      }
      
      public function isThanksgiving(param1:Boolean = false) : Boolean
      {
         return get_game().seasons.isItThanksgiving(param1);
      }
      
      public function isSummer(param1:Boolean = false) : Boolean
      {
         return get_game().seasons.isItSummer(param1);
      }
      
      public function isSpring(param1:Boolean = false) : Boolean
      {
         return get_game().seasons.isItSpring(param1);
      }
      
      public function isSaturnalia(param1:Boolean = false) : Boolean
      {
         return get_game().seasons.isItSaturnalia(param1);
      }
      
      public function isHalloween(param1:Boolean = false) : Boolean
      {
         return get_game().seasons.isItHalloween(param1);
      }
      
      public function isEaster(param1:Boolean = false) : Boolean
      {
         return get_game().seasons.isItEaster(param1);
      }
      
      public function isAutumn(param1:Boolean = false) : Boolean
      {
         return get_game().seasons.isItAutumn(param1);
      }
      
      public function isAprilFools() : Boolean
      {
         return get_game().seasons.isItAprilFools();
      }
      
      public function imageSelect(param1:Class = undefined, param2:int = 0, param3:int = 0) : void
      {
         get_game().imageSelect(param1,param2,param3);
      }
      
      public function hideUpDown() : void
      {
         get_output().hideUpDown();
      }
      
      public function hideStats() : void
      {
         get_output().hideStats();
      }
      
      public function hideMenus() : void
      {
         get_output().hideMenus();
      }
      
      public function hideInput() : String
      {
         return get_game().hideInput();
      }
      
      public function goNext(param1:Number, param2:Boolean) : Boolean
      {
         return get_game().goNext(param1,param2);
      }
      
      public function get_weapons() : WeaponLib
      {
         return get_game().weapons;
      }
      
      public function get_watersportsEnabled() : Boolean
      {
         return get_game().get_watersportsEnabled();
      }
      
      public function get_useables() : UseableLib
      {
         return get_game().useables;
      }
      
      public function get_urtaDisabled() : Boolean
      {
         return get_game().get_urtaDisabled();
      }
      
      public function get_undergarments() : UndergarmentLib
      {
         return get_game().undergarments;
      }
      
      public function get_timeQ() : Number
      {
         return get_game().timeQ;
      }
      
      public function get_time() : Time
      {
         return get_game().time;
      }
      
      public function get_textBackground() : int
      {
         return get_game().get_textBackground();
      }
      
      public function get_survival() : Boolean
      {
         return get_game().get_survival();
      }
      
      public function get_spritesEnabled() : Boolean
      {
         return get_game().get_spritesEnabled();
      }
      
      public function get_silly() : Boolean
      {
         return get_game().get_silly();
      }
      
      public function get_shields() : ShieldLib
      {
         return get_game().shields;
      }
      
      public function get_realistic() : Boolean
      {
         return get_game().get_realistic();
      }
      
      public function get_player2() : Player
      {
         return get_game().player2;
      }
      
      public function get_player() : Player
      {
         return get_game().player;
      }
      
      public function get_pc() : Player
      {
         return get_game().player;
      }
      
      public function get_parasitesHigh() : Boolean
      {
         return get_game().get_parasitesHigh();
      }
      
      public function get_parasiteRating() : int
      {
         return get_game().get_parasiteRating();
      }
      
      public function get_output() : Output
      {
         return get_game().output;
      }
      
      public function get_oldSprites() : Boolean
      {
         return get_game().get_oldSprites();
      }
      
      public function get_oldAscension() : Boolean
      {
         return get_game().get_oldAscension();
      }
      
      public function get_npcSettings() : SettingsNPC
      {
         return get_game().get_npcSettings();
      }
      
      public function get_noFur() : Boolean
      {
         return get_game().get_noFur();
      }
      
      public function get_nephilaEnabled() : Boolean
      {
         return get_game().get_nephilaEnabled();
      }
      
      public function get_mutations() : Mutations
      {
         return get_game().mutations;
      }
      
      public function get_monsterArray() : Array
      {
         return get_game().monsterArray;
      }
      
      public function get_monster() : Monster
      {
         return get_game().monster;
      }
      
      public function get_modeSettings() : SettingsModes
      {
         return get_game().get_modeSettings();
      }
      
      public function get_miscSettings() : SettingsGlobalMisc
      {
         return get_game().get_miscSettings();
      }
      
      public function get_metric() : Boolean
      {
         return get_game().get_metric();
      }
      
      public function get_mainViewManager() : MainViewManager
      {
         return get_game().mainViewManager;
      }
      
      public function get_mainView() : MainView
      {
         return get_game().mainView;
      }
      
      public function get_lowStandards() : Boolean
      {
         return get_game().get_lowStandards();
      }
      
      public function get_lethicesKeep() : LethicesKeep
      {
         return get_game().lethicesKeep;
      }
      
      public function get_jewelries() : JewelryLib
      {
         return get_game().jewelries;
      }
      
      public function get_inventory() : Inventory
      {
         return get_game().inventory;
      }
      
      public function get_inRoomedDungeonResume() : Function
      {
         return get_game().inRoomedDungeonResume;
      }
      
      public function get_inRoomedDungeonName() : String
      {
         return get_game().inRoomedDungeonName;
      }
      
      public function get_inRoomedDungeon() : Boolean
      {
         return get_game().inRoomedDungeon;
      }
      
      public function get_inDungeon() : Boolean
      {
         return get_game().inDungeon;
      }
      
      public function get_images() : ImageManager
      {
         return get_game().images;
      }
      
      public function get_hyper() : Boolean
      {
         return get_game().get_hyper();
      }
      
      public function get_hermUnlocked() : Boolean
      {
         return get_game().get_hermUnlocked();
      }
      
      public function get_hardcoreSlot() : String
      {
         return get_game().get_hardcoreSlot();
      }
      
      public function get_hardcore() : Boolean
      {
         return get_game().get_hardcore();
      }
      
      public function get_goreEnabled() : Boolean
      {
         return get_game().get_goreEnabled();
      }
      
      public function get_gameplaySettings() : SettingsGlobalGameplay
      {
         return get_game().get_gameplaySettings();
      }
      
      public function get_game() : CoC
      {
         return KGAMECLASS.kGAMECLASS;
      }
      
      public function get_flags() : IMap
      {
         return KFLAGS.flags;
      }
      
      public function get_filthEnabled() : Boolean
      {
         return get_game().get_filthEnabled();
      }
      
      public function get_fetishSettings() : SettingsGlobalFetishes
      {
         return get_game().get_fetishSettings();
      }
      
      public function get_enemy() : Monster
      {
         return get_game().monster;
      }
      
      public function get_easyMode() : Boolean
      {
         return get_game().get_easyMode();
      }
      
      public function get_displaySettings() : SettingsGlobalDisplay
      {
         return get_game().get_displaySettings();
      }
      
      public function get_difficulty() : int
      {
         return get_game().get_difficulty();
      }
      
      public function get_debug() : Boolean
      {
         return get_game().debug;
      }
      
      public function get_date() : Date
      {
         return get_game().date;
      }
      
      public function get_creepingTaint() : Boolean
      {
         return get_game().get_creepingTaint();
      }
      
      public function get_consumables() : ConsumableLib
      {
         return get_game().consumables;
      }
      
      public function get_combatRangeData() : CombatRangeData
      {
         return get_game().combatRangeData;
      }
      
      public function get_combat() : Combat
      {
         return get_game().combat;
      }
      
      public function get_camp() : Camp
      {
         return get_game().camp;
      }
      
      public function get_cabin() : Cabin
      {
         return get_game().cabin;
      }
      
      public function get_buttons() : ButtonDataList
      {
         return get_output().buttons;
      }
      
      public function get_armors() : ArmorLib
      {
         return get_game().armors;
      }
      
      public function get_animateStatBars() : Boolean
      {
         return get_game().get_animateStatBars();
      }
      
      public function get_allowChild() : Boolean
      {
         return get_game().get_allowChild();
      }
      
      public function get_allowBaby() : Boolean
      {
         return get_game().get_allowBaby();
      }
      
      public function get_addictionEnabled() : Boolean
      {
         return get_game().get_addictionEnabled();
      }
      
      public function get_achievements() : IMap
      {
         return get_game().achievements;
      }
      
      public function getInput() : String
      {
         return get_game().getInput();
      }
      
      public function genericNamePrompt(param1:String = undefined) : void
      {
         if(param1 == null)
         {
            param1 = "";
         }
         get_game().genericNamePrompt(param1);
      }
      
      public function dynStats(... rest) : Object
      {
         if(int(rest.length) == 0)
         {
            return get_player().dynStats();
         }
         else if(int(rest.length) == 1)
         {
            return get_player().dynStats(rest[0]);
         }
         else if(int(rest.length) == 2)
         {
            return get_player().dynStats(rest[0],rest[1]);
         }
         else if(int(rest.length) == 3)
         {
            return get_player().dynStats(rest[0],rest[1],rest[2]);
         }
         else if(int(rest.length) == 4)
         {
            return get_player().dynStats(rest[0],rest[1],rest[2],rest[3]);
         }
         else if(int(rest.length) == 5)
         {
            return get_player().dynStats(rest[0],rest[1],rest[2],rest[3],rest[4]);
         }
         else if(int(rest.length) == 6)
         {
            return get_player().dynStats(rest[0],rest[1],rest[2],rest[3],rest[4],rest[5]);
         }
         else if(int(rest.length) == 7)
         {
            return get_player().dynStats(rest[0],rest[1],rest[2],rest[3],rest[4],rest[5],rest[6]);
         }
         else if(int(rest.length) == 8)
         {
            return get_player().dynStats(rest[0],rest[1],rest[2],rest[3],rest[4],rest[5],rest[6],rest[7]);
         }
         else if(int(rest.length) == 9)
         {
            return get_player().dynStats(rest[0],rest[1],rest[2],rest[3],rest[4],rest[5],rest[6],rest[7],rest[8]);
         }
         else if(int(rest.length) == 10)
         {
            return get_player().dynStats(rest[0],rest[1],rest[2],rest[3],rest[4],rest[5],rest[6],rest[7],rest[8],rest[9]);
         }
         else if(int(rest.length) == 11)
         {
            return get_player().dynStats(rest[0],rest[1],rest[2],rest[3],rest[4],rest[5],rest[6],rest[7],rest[8],rest[9],rest[10]);
         }
         else if(int(rest.length) == 12)
         {
            return get_player().dynStats(rest[0],rest[1],rest[2],rest[3],rest[4],rest[5],rest[6],rest[7],rest[8],rest[9],rest[10],rest[11]);
         }
         else if(int(rest.length) == 13)
         {
            return get_player().dynStats(rest[0],rest[1],rest[2],rest[3],rest[4],rest[5],rest[6],rest[7],rest[8],rest[9],rest[10],rest[11],rest[12]);
         }
         else if(int(rest.length) == 14)
         {
            return get_player().dynStats(rest[0],rest[1],rest[2],rest[3],rest[4],rest[5],rest[6],rest[7],rest[8],rest[9],rest[10],rest[11],rest[12],rest[13]);
         }
         else if(int(rest.length) == 15)
         {
            return get_player().dynStats(rest[0],rest[1],rest[2],rest[3],rest[4],rest[5],rest[6],rest[7],rest[8],rest[9],rest[10],rest[11],rest[12],rest[13],rest[14]);
         }
         else if(int(rest.length) == 16)
         {
            return get_player().dynStats(rest[0],rest[1],rest[2],rest[3],rest[4],rest[5],rest[6],rest[7],rest[8],rest[9],rest[10],rest[11],rest[12],rest[13],rest[14],rest[15]);
         }
         else if(int(rest.length) == 17)
         {
            return get_player().dynStats(rest[0],rest[1],rest[2],rest[3],rest[4],rest[5],rest[6],rest[7],rest[8],rest[9],rest[10],rest[11],rest[12],rest[13],rest[14],rest[15],rest[16]);
         }
         else if(int(rest.length) == 18)
         {
            return get_player().dynStats(rest[0],rest[1],rest[2],rest[3],rest[4],rest[5],rest[6],rest[7],rest[8],rest[9],rest[10],rest[11],rest[12],rest[13],rest[14],rest[15],rest[16],rest[17]);
         }
         else if(int(rest.length) == 19)
         {
            return get_player().dynStats(rest[0],rest[1],rest[2],rest[3],rest[4],rest[5],rest[6],rest[7],rest[8],rest[9],rest[10],rest[11],rest[12],rest[13],rest[14],rest[15],rest[16],rest[17],rest[18]);
         }
         else
         {
            if(int(rest.length) != 20)
            {
               throw "Too many rest arguments";
            }
            return get_player().dynStats(rest[0],rest[1],rest[2],rest[3],rest[4],rest[5],rest[6],rest[7],rest[8],rest[9],rest[10],rest[11],rest[12],rest[13],rest[14],rest[15],rest[16],rest[17],rest[18],rest[19]);
         }
      }
      
      public function doYesNo(param1:Function, param2:Function) : void
      {
         get_output().doYesNo(param1,param2);
      }
      
      public function doNext(param1:Function) : void
      {
         get_output().doNext(param1);
      }
      
      public function displayHeader(param1:String) : void
      {
         get_output().header(param1);
      }
      
      public function disableButton(param1:Object = undefined, param2:String = undefined) : CoCButton
      {
         if(param1 == null)
         {
            param1 = -1;
         }
         return get_output().disableButton(param1,param2);
      }
      
      public function clearOutput(param1:Boolean = true) : void
      {
         if(param1)
         {
            get_output().clear();
         }
         else
         {
            get_output().clearText();
         }
      }
      
      public function clearInput() : void
      {
         get_game().clearInput();
      }
      
      public function cheatTime(param1:Number, param2:Boolean = false) : void
      {
         get_game().cheatTime(param1,param2);
      }
      
      public function button(param1:Object = undefined, param2:String = undefined) : CoCButton
      {
         if(param1 == null)
         {
            param1 = -1;
         }
         return get_output().button(param1,param2);
      }
      
      public function awardAchievement(param1:String, param2:int, param3:Boolean = true, param4:Boolean = false, param5:Boolean = true) : void
      {
         EngineCore.awardAchievement(param1,param2,param3,param4,param5);
      }
      
      public function addRowButtonDisabled(param1:int, param2:String = undefined, param3:String = undefined, param4:String = undefined) : CoCButton
      {
         if(param2 == null)
         {
            param2 = "";
         }
         if(param3 == null)
         {
            param3 = "";
         }
         if(param4 == null)
         {
            param4 = "";
         }
         return get_output().addRowButtonDisabled(param1,param2,param3,param4);
      }
      
      public function addRowButton(param1:int, param2:String = undefined, param3:Function = undefined) : CoCButton
      {
         if(param2 == null)
         {
            param2 = "";
         }
         return get_output().addRowButton(param1,param2,param3);
      }
      
      public function addNextButtonDisabled(param1:String = undefined, param2:String = undefined, param3:String = undefined) : CoCButton
      {
         if(param1 == null)
         {
            param1 = "";
         }
         if(param2 == null)
         {
            param2 = "";
         }
         if(param3 == null)
         {
            param3 = "";
         }
         return get_output().addNextButtonDisabled(Utils.cnName(param1),Utils.cnName(param2),Utils.cnName(param3));
      }
      
      public function addNextButton(param1:String = undefined, param2:Function = undefined) : CoCButton
      {
         if(param1 == null)
         {
            param1 = "";
         }
         return get_output().addNextButton(Utils.cnName(param1),param2);
      }
      
      public function addLimitedButtonDisabled(param1:Array, param2:String = undefined, param3:String = undefined, param4:String = undefined) : CoCButton
      {
         if(param2 == null)
         {
            param2 = "";
         }
         if(param3 == null)
         {
            param3 = "";
         }
         if(param4 == null)
         {
            param4 = "";
         }
         return get_output().addLimitedButtonDisabled(param1,param2,param3,param4);
      }
      
      public function addLimitedButton(param1:Array, param2:String = undefined, param3:Function = undefined) : CoCButton
      {
         if(param2 == null)
         {
            param2 = "";
         }
         return get_output().addLimitedButton(param1,param2,param3);
      }
      
      public function addColButtonDisabled(param1:int, param2:String = undefined, param3:String = undefined, param4:String = undefined) : CoCButton
      {
         if(param2 == null)
         {
            param2 = "";
         }
         if(param3 == null)
         {
            param3 = "";
         }
         if(param4 == null)
         {
            param4 = "";
         }
         return get_output().addColButtonDisabled(param1,param2,param3,param4);
      }
      
      public function addColButton(param1:int, param2:String = undefined, param3:Function = undefined) : CoCButton
      {
         if(param2 == null)
         {
            param2 = "";
         }
         return get_output().addColButton(param1,param2,param3);
      }
      
      public function addButtonDisabled(param1:int, param2:String = undefined, param3:String = undefined, param4:String = undefined) : CoCButton
      {
         if(param2 == null)
         {
            param2 = "";
         }
         if(param3 == null)
         {
            param3 = "";
         }
         if(param4 == null)
         {
            param4 = "";
         }
         return get_output().addButtonDisabled(param1,Utils.cnName(param2),Utils.cnName(param3),Utils.cnName(param4));
      }
      
      public function addButton(param1:int, param2:String = undefined, param3:Function = undefined) : CoCButton
      {
         if(param2 == null)
         {
            param2 = "";
         }
         return get_output().addButton(param1,Utils.cnName(param2),param3);
      }
   }
}

