package classes.scenes.dungeons
{
   import classes.BaseContent;
   import classes.CoC;
   import classes.Player;
   import classes.Room;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.globalFlags.KFLAGS;
   import classes.scenes.Camp;
   import classes.scenes.Inventory;
   import classes.scenes.dungeons._DungeonRoomConst.DungeonRoomConst_Impl_;
   import coc.view.CoCButton;
   import coc.view.MainView;
   import coc.view.Theme;
   import coc.view.ThemeObserver;
   import flash.Boot;
   import haxe.IMap;
   import haxe.ds.StringMap;
   
   public class DungeonCore extends BaseContent implements ThemeObserver
   {
      
      public static var DUNGEON_FACTORY:int = 0;
      
      public static var DUNGEON_CAVE:int = 10;
      
      public static var DUNGEON_HEL_GUARD_HALL:int = 17;
      
      public static var DUNGEON_HEL_WINE_CELLAR:int = 18;
      
      public static var DUNGEON_HEL_STAIR_WELL:int = 19;
      
      public static var DUNGEON_HEL_DUNGEON:int = 20;
      
      public static var DUNGEON_HEL_MEZZANINE:int = 21;
      
      public static var DUNGEON_HEL_THRONE_ROOM:int = 22;
      
      public static var DUNGEON_DESERT_CAVE:int = 23;
      
      public static var DUNGEON_ANZU_OUTSIDE:int = 39;
      
      public static var DUNGEON_ANZU_HALL_FLOOR1:int = 40;
      
      public static var DUNGEON_ANZU_LIVING_ROOM:int = 41;
      
      public static var DUNGEON_ANZU_BATHROOM:int = 42;
      
      public static var DUNGEON_ANZU_DINING_ROOM:int = 43;
      
      public static var DUNGEON_ANZU_KITCHEN:int = 44;
      
      public static var DUNGEON_ANZU_HALL_FLOOR2:int = 45;
      
      public static var DUNGEON_ANZU_BEDROOM:int = 46;
      
      public static var DUNGEON_ANZU_LIBRARY:int = 47;
      
      public static var DUNGEON_ANZU_MULTIUSE_ROOM:int = 48;
      
      public static var DUNGEON_ANZU_HALL_FLOOR3:int = 49;
      
      public static var DUNGEON_ANZU_PALACE_VAULTS:int = 50;
      
      public static var DUNGEON_ANZU_ALCHEMY_ROOM:int = 51;
      
      public static var DUNGEON_ANZU_ROOF:int = 52;
      
      public static var DUNGEON_ANZU_BASEMENT:int = 53;
      
      public static var DUNGEON_ANZU_ARMORY:int = 54;
      
      public static var DUNGEON_MANOR:int = 55;
      
      public static var DUNGEON_WIZARDTOWER:int = 80;
      
      public static var N:int = 1;
      
      public static var S:int = 2;
      
      public static var E:int = 4;
      
      public static var W:int = 8;
      
      public static var O:int = 0;
      
      public var wizardTower:WizardTower;
      
      public var usingAlternative:Boolean;
      
      public var rooms:IMap;
      
      public var randomDungeon:RandomDungeon;
      
      public var prevLoc:int;
      
      public var map:DungeonMap;
      
      public var manor:Manor;
      
      public var heltower:HelDungeon;
      
      public var factory:Factory;
      
      public var dungeonName:String;
      
      public var desertcave:DesertCave;
      
      public var deepcave:DeepCave;
      
      public var currDungeon:DungeonAbstractContent;
      
      public var _playerLoc:int;
      
      public var _currentRoom:String;
      
      public function DungeonCore()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         dungeonName = "";
         usingAlternative = false;
         _playerLoc = 0;
         prevLoc = 0;
         randomDungeon = new RandomDungeon();
         wizardTower = new WizardTower();
         manor = new Manor();
         heltower = new HelDungeon();
         deepcave = new DeepCave();
         factory = new Factory();
         rooms = new StringMap();
         super();
         desertcave = new DesertCave();
         Theme.subscribe(this);
      }
      
      public function update(param1:String) : void
      {
         if(get_inDungeon() && usingAlternative)
         {
            remakeMaps();
         }
      }
      
      public function startAlternative(param1:DungeonAbstractContent, param2:int, param3:String = undefined) : void
      {
         if(param3 == null)
         {
            param3 = "";
         }
         clearOutput();
         set_playerLoc(param2);
         param1.initLoc = param2;
         dungeonName = param3;
         currDungeon = param1;
         currDungeon.initMap();
         currDungeon.initRooms();
         usingAlternative = true;
         get_game().dungeons.map.generateMap(get_mainView().dungeonMap);
         get_game().dungeons.map.generateIconMinimap();
         get_game().inDungeon = true;
      }
      
      public function set_playerLoc(param1:int) : int
      {
         prevLoc = get_playerLoc();
         return _playerLoc = param1;
      }
      
      public function setTopButtons() : void
      {
         get_mainView().setMenuButton("newGame","主菜单",get_game().mainMenu.mainMenu);
         get_mainView().showMenuButton("appearance");
         get_mainView().showMenuButton("perks");
         get_mainView().showMenuButton("stats");
         get_mainView().hideMenuButton("data");
         get_mainView().hideMenuButton("newGame");
         get_camp().setLevelButton();
      }
      
      public function setDungeonButtons(param1:Object = undefined, param2:Object = undefined, param3:Object = undefined, param4:Object = undefined) : void
      {
         var room3:Function;
         var _g7:DungeonCore;
         var room2:Function;
         var _g6:DungeonCore;
         var room1:Function;
         var _g5:DungeonCore;
         var room:Function;
         var _g4:DungeonCore;
         var direction3:int;
         var _g3:DungeonCore;
         var direction2:int;
         var _g2:DungeonCore;
         var direction1:int;
         var _g1:DungeonCore;
         var direction:int;
         var _g:DungeonCore;
         hideUpDown();
         spriteSelect(null);
         imageSelect(null);
         statScreenRefresh();
         menu();
         if(usingAlternative && (param1 == null && param2 == null && param3 == null && param4 == null))
         {
            _g = this;
            direction = 0;
            addButton(6,"向北",function():void
            {
               _g.moveAlternative(direction);
            }).disableIf(!canMove(get_playerLoc(),get_playerLoc() - get_mapModulus(),1));
            _g1 = this;
            direction1 = 1;
            addButton(11,"向南",function():void
            {
               _g1.moveAlternative(direction1);
            }).disableIf(!canMove(get_playerLoc(),get_playerLoc() + get_mapModulus(),2));
            _g2 = this;
            direction2 = 2;
            addButton(10,"向西",function():void
            {
               _g2.moveAlternative(direction2);
            }).disableIf(!canMove(get_playerLoc(),get_playerLoc() - 1,8));
            _g3 = this;
            direction3 = 3;
            addButton(12,"向东",function():void
            {
               _g3.moveAlternative(direction3);
            }).disableIf(!canMove(get_playerLoc(),get_playerLoc() + 1,4));
         }
         else
         {
            _g4 = this;
            room = param1;
            addButton(6,"向北",function():void
            {
               _g4.navigateToRoom(room);
            }).disableIf(param1 == null);
            _g5 = this;
            room1 = param2;
            addButton(11,"向南",function():void
            {
               _g5.navigateToRoom(room1);
            }).disableIf(param2 == null);
            _g6 = this;
            room2 = param3;
            addButton(10,"向西",function():void
            {
               _g6.navigateToRoom(room2);
            }).disableIf(param3 == null);
            _g7 = this;
            room3 = param4;
            addButton(12,"东",function():void
            {
               _g7.navigateToRoom(room3);
            }).disableIf(param4 == null);
         }
         addButton(13,"物品栏",get_inventory().inventoryMenu).hint("物品栏可以让你查看或使用你的物品。");
         addButton(14,"地图",map.displayMap).hint("查看这个地牢的地图。");
         setTopButtons();
      }
      
      public function resumeFromFight() : void
      {
         move(_currentRoom);
      }
      
      public function remakeMaps() : void
      {
         get_game().dungeons.map.generateMap(get_mainView().dungeonMap);
         get_game().dungeons.map.generateIconMinimap();
         get_game().mainViewManager.refreshStats();
      }
      
      public function navigateToRoom(param1:Function, param2:Number = 0.08333333333333333) : void
      {
         cheatTime(param2);
         param1();
      }
      
      public function moveAlternative(param1:int) : void
      {
         if(int(currDungeon.get_dungeonMap()[get_playerLoc()]) < 0)
         {
            currDungeon.get_dungeonMap()[get_playerLoc()] = 3;
         }
         switch(param1)
         {
            case 0:
               set_playerLoc(get_playerLoc() - get_mapModulus());
               break;
            case 1:
               set_playerLoc(get_playerLoc() + get_mapModulus());
               break;
            case 2:
               set_playerLoc(get_playerLoc() - 1);
               break;
            case 3:
               set_playerLoc(get_playerLoc() + 1);
         }
         cheatTime(0.08333333333333333);
         currDungeon.runFunc();
      }
      
      public function move(param1:String, param2:Number = 0) : void
      {
         cheatTime(param2);
         clearOutput();
         var _loc3_:StringMap = rooms;
         if(!(param1 in StringMap.reserved ? _loc3_.existsReserved(param1) : param1 in _loc3_.h))
         {
            clearOutput();
            outputText("错误：找不到索引为以下内容的房间：" + param1);
            menu();
            return;
         }
         var _loc4_:StringMap = rooms;
         var _loc5_:Room = param1 in StringMap.reserved ? _loc4_.getReserved(param1) : _loc4_.h[param1];
         if(_loc5_.RoomFunction == null)
         {
            outputText("错误：索引为\'" + param1 + "\'的房间的进入函数未设置。");
            return;
         }
         menu();
         _currentRoom = param1;
         if(!Boolean(_loc5_.RoomFunction()))
         {
            generateRoomMenu(_loc5_);
         }
      }
      
      public function get_playerLoc() : int
      {
         return _playerLoc;
      }
      
      public function get_mapModulus() : int
      {
         return int(Math.sqrt(int(currDungeon.get_dungeonMap().length)));
      }
      
      public function get_dungeonMap() : Array
      {
         return currDungeon.get_dungeonMap();
      }
      
      public function get_connectivity() : Array
      {
         return currDungeon.get_connectivity();
      }
      
      public function generateRoomMenu(param1:Room) : void
      {
         var timeToPass3:Number;
         var roomName3:String;
         var _g3:DungeonCore;
         var timeToPass2:Number;
         var roomName2:String;
         var _g2:DungeonCore;
         var timeToPass1:Number;
         var roomName1:String;
         var _g1:DungeonCore;
         var timeToPass:Number;
         var roomName:String;
         var _g:DungeonCore;
         statScreenRefresh();
         hideUpDown();
         spriteSelect(null);
         imageSelect(null);
         setTopButtons();
         if(!button(6).visible)
         {
            _g = this;
            roomName = param1.NorthExit;
            timeToPass = 0.08333333333333333;
            addButton(6,"向北",function():void
            {
               _g.move(roomName,timeToPass);
            }).disableIf(param1.NorthExit == null || param1.NorthExit.length == 0 || param1.NorthExitCondition != null && !Boolean(param1.NorthExitCondition()));
         }
         if(!button(12).visible)
         {
            _g1 = this;
            roomName1 = param1.EastExit;
            timeToPass1 = 0.08333333333333333;
            addButton(12,"向东",function():void
            {
               _g1.move(roomName1,timeToPass1);
            }).disableIf(param1.EastExit == null || param1.EastExit.length == 0 || param1.EastExitCondition != null && !Boolean(param1.EastExitCondition()));
         }
         if(!button(11).visible)
         {
            _g2 = this;
            roomName2 = param1.SouthExit;
            timeToPass2 = 0.08333333333333333;
            addButton(11,"向南",function():void
            {
               _g2.move(roomName2,timeToPass2);
            }).disableIf(param1.SouthExit == null || param1.SouthExit.length == 0 || param1.SouthExitCondition != null && !Boolean(param1.SouthExitCondition()));
         }
         if(!button(10).visible)
         {
            _g3 = this;
            roomName3 = param1.WestExit;
            timeToPass3 = 0.08333333333333333;
            addButton(10,"向西",function():void
            {
               _g3.move(roomName3,timeToPass3);
            }).disableIf(param1.WestExit == null || param1.WestExit.length == 0 || param1.WestExitCondition != null && !Boolean(param1.WestExitCondition()));
         }
         addButton(13,"物品栏",get_inventory().inventoryMenu);
         addButton(14,"地图",get_game().dungeons.map.displayMap);
         if(get_inRoomedDungeon())
         {
            get_game().masturbation.setMasturbateButton(true);
         }
      }
      
      public function enterFactory() : void
      {
         factory.enterDungeon();
      }
      
      public function enterDeepCave() : void
      {
         deepcave.enterDungeon();
      }
      
      public function checkTowerDeceptionClear() : Boolean
      {
         return (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2683) & 0x0100) > 0;
      }
      
      public function checkSandCaveClear() : Boolean
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,863) > 0 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,772) == 0)
         {
            if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,838) <= 0)
            {
               return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,849) > 0;
            }
            return true;
         }
         return false;
      }
      
      public function checkRoom() : void
      {
         switch(get_game().dungeonLoc)
         {
            case 0:
               factory.runFunc();
               break;
            case 10:
               deepcave.runFunc();
               break;
            case 17:
               heltower.roomGuardHall();
               break;
            case 18:
               heltower.roomCellar();
               break;
            case 19:
               heltower.roomStairwell();
               break;
            case 20:
               heltower.roomDungeon();
               break;
            case 21:
               heltower.roomMezzanine();
               break;
            case 22:
               heltower.roomThroneRoom();
               break;
            case 23:
               desertcave.runFunc();
               break;
            case 55:
               manor.runFunc();
               break;
            case 80:
               wizardTower.runFunc();
               break;
            case 81:
               randomDungeon.runFunc();
         }
      }
      
      public function checkPhoenixTowerClear() : Boolean
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,494) != 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,485) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,492) > 0)
         {
            return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,487) > 0;
         }
         return false;
      }
      
      public function checkManorClear() : Boolean
      {
         return (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2671) & 0x80) > 0;
      }
      
      public function checkLethiceStrongholdClear() : Boolean
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1242) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1243) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1249) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1251) > 0)
         {
            return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1272) > 0;
         }
         return false;
      }
      
      public function checkFactoryClear() : Boolean
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2024) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2021) > 0 && (FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2022) > 0 || FlagDict_Impl_.arrayReadInt(KFLAGS.flags,1239) > 0))
         {
            return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2023) > 0;
         }
         return false;
      }
      
      public function checkDeepCaveClear() : Boolean
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,116) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,117) > 0 && FlagDict_Impl_.arrayReadInt(KFLAGS.flags,119) == 1)
         {
            return get_player().hasKeyItem("Zetaz\'s Map");
         }
         return false;
      }
      
      public function canMove(param1:int, param2:int, param3:uint) : Boolean
      {
         if(param2 < 0 || param2 >= int(currDungeon.get_dungeonMap().length))
         {
            return false;
         }
         var _loc4_:Boolean = (param3 & uint(currDungeon.get_connectivity()[param1])) != 0;
         var _loc5_:Boolean = (uint(param3 << 4) & uint(currDungeon.get_connectivity()[param1])) == 0;
         var _loc6_:Boolean = Boolean(DungeonRoomConst_Impl_.WALKABLE.contains(int(currDungeon.get_dungeonMap()[param2])));
         if(_loc4_ && _loc5_)
         {
            return _loc6_;
         }
         return false;
      }
      
      public function canFindDeepCave() : Boolean
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,113) == 0)
         {
            return FlagDict_Impl_.arrayReadInt(KFLAGS.flags,2024) > 0;
         }
         return false;
      }
   }
}

