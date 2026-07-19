package classes
{
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.internals.Utils;
   import classes.saves.SelfSaver;
   import classes.saves.SelfSaving;
   import flash.Boot;
   
   public class GameSettingsPlayer extends BaseContent implements SelfSaving
   {
      
      public var settingsLocal:SettingsLocal;
      
      public var saveVersion:int;
      
      public var saveName:String;
      
      public var globalSave:Boolean;
      
      public function GameSettingsPlayer()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         globalSave = false;
         saveVersion = 2;
         saveName = "playersettings";
         settingsLocal = new SettingsLocal(null,null,null);
         super();
         SelfSaver.register(this);
      }
      
      public function saveToObject() : Object
      {
         settingsLocal.globalRef = Utils.copy(get_gameSettings().settingsGlobal);
         return settingsLocal;
      }
      
      public function reset() : void
      {
         if(!isOverridden(3))
         {
            settingsLocal.modes = new SettingsModes(null,null,null,null,null,null,null,null,null,null,null,null,null,null);
         }
         if(!isOverridden(4))
         {
            settingsLocal.npc = new SettingsNPC(null,null,null,null,null,null);
         }
      }
      
      public function onAscend(param1:Boolean) : void
      {
      }
      
      public function load(param1:int, param2:*) : void
      {
         var _loc3_:* = null;
         if(param1 < 2)
         {
            if(Reflect.hasField(param2,"npcSettings"))
            {
               _loc3_ = Reflect.field(param2,"npcSettings");
               param2["npc"] = _loc3_;
            }
            convertOldSettings();
         }
         if(isOverridden(3))
         {
            Reflect.deleteField(param2,"modes");
         }
         if(isOverridden(4))
         {
            Reflect.deleteField(param2,"npc");
         }
         get_gameSettings().overridePanes = [];
         Reflect.deleteField(param2,"globalRef");
         Utils.recursiveLoad(param2,settingsLocal);
      }
      
      public function isOverridden(param1:int) : Boolean
      {
         if(get_game() == null)
         {
            return false;
         }
         return get_gameSettings().overridePanes.indexOf(param1) >= 0;
      }
      
      public function get_gameSettings() : GameSettings
      {
         return get_game().gameSettings;
      }
      
      public function convertOldSettings() : void
      {
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc15_:int = 0;
         var _loc16_:int = 0;
         var _loc17_:int = 0;
         var _loc18_:int = 0;
         var _loc19_:int = 0;
         var _loc20_:int = 0;
         var _loc21_:int = 0;
         §§push(99);
         if(!(99 is Number))
         {
            throw "Class cast error";
         }
         var _loc1_:int = int(§§pop());
         §§push(305);
         if(!(305 is Number))
         {
            throw "Class cast error";
         }
         var _loc2_:int = int(§§pop());
         §§push(2643);
         if(!(2643 is Number))
         {
            throw "Class cast error";
         }
         var _loc3_:int = int(§§pop());
         §§push(2663);
         if(!(2663 is Number))
         {
            throw "Class cast error";
         }
         var _loc4_:int = int(§§pop());
         §§push(2990);
         if(!(2990 is Number))
         {
            throw "Class cast error";
         }
         var _loc5_:int = int(§§pop());
         §§push(2991);
         if(!(2991 is Number))
         {
            throw "Class cast error";
         }
         var _loc6_:int = int(§§pop());
         §§push(2992);
         if(!(2992 is Number))
         {
            throw "Class cast error";
         }
         var _loc7_:int = int(§§pop());
         §§push(2993);
         if(!(2993 is Number))
         {
            throw "Class cast error";
         }
         var _loc8_:int = int(§§pop());
         §§push(2997);
         if(!(2997 is Number))
         {
            throw "Class cast error";
         }
         var _loc9_:int = int(§§pop());
         §§push(2998);
         if(!(2998 is Number))
         {
            throw "Class cast error";
         }
         var _loc10_:int = int(§§pop());
         if(!isOverridden(3))
         {
            _loc11_ = FlagDict_Impl_.arrayReadInt(KFLAGS.flags,_loc1_) > 0 ? -2 : FlagDict_Impl_.arrayReadInt(KFLAGS.flags,_loc5_);
            settingsLocal.modes.difficulty = _loc11_;
            _loc12_ = FlagDict_Impl_.arrayReadInt(KFLAGS.flags,_loc2_);
            settingsLocal.modes.silly = _loc12_ > 1;
            _loc13_ = FlagDict_Impl_.arrayReadInt(KFLAGS.flags,_loc10_);
            settingsLocal.modes.hyper = _loc13_ > 1;
            _loc14_ = FlagDict_Impl_.arrayReadInt(KFLAGS.flags,_loc4_) & 1;
            settingsLocal.modes.temptation = _loc14_ > 0;
            _loc15_ = FlagDict_Impl_.arrayReadInt(KFLAGS.flags,_loc4_) & 2;
            settingsLocal.modes.taint = _loc15_ > 0;
            _loc16_ = FlagDict_Impl_.arrayReadInt(KFLAGS.flags,_loc4_) & 4;
            settingsLocal.modes.cooldowns = _loc16_ > 0;
            _loc17_ = FlagDict_Impl_.arrayReadInt(KFLAGS.flags,_loc4_) & 8;
            settingsLocal.modes.scaling = _loc17_ > 0;
            _loc18_ = FlagDict_Impl_.arrayReadInt(KFLAGS.flags,_loc4_) & 0x10;
            settingsLocal.modes.longHaul = _loc18_ > 0;
            _loc19_ = FlagDict_Impl_.arrayReadInt(KFLAGS.flags,_loc8_);
            settingsLocal.modes.survival = _loc19_ > 0;
            _loc20_ = FlagDict_Impl_.arrayReadInt(KFLAGS.flags,_loc8_);
            settingsLocal.modes.realistic = _loc20_ >= 1;
            _loc21_ = FlagDict_Impl_.arrayReadInt(KFLAGS.flags,_loc6_);
            settingsLocal.modes.hardcore = _loc21_ > 0;
            settingsLocal.modes.hardcoreSlot = FlagDict_Impl_.arrayReadString(KFLAGS.flags,_loc7_);
         }
         if(!isOverridden(4))
         {
            _loc11_ = FlagDict_Impl_.arrayReadInt(KFLAGS.flags,_loc9_);
            settingsLocal.npc.lowStandards = _loc11_ > 0;
         }
      }
   }
}

