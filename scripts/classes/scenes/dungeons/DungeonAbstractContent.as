package classes.scenes.dungeons
{
   import classes.BaseContent;
   import classes.CoC;
   import classes.Output;
   import classes.scenes.Camp;
   import coc.view.CoCButton;
   import flash.Boot;
   import haxe.IMap;
   import haxe.ds.IntMap;
   
   public class DungeonAbstractContent extends BaseContent
   {
      
      public static var init__:Boolean;
      
      public static var WALKABLE:Array;
      
      public static var CONNECTABLE:Array;
      
      public static var OPEN_ROOM:int = 0;
      
      public static var EMPTY:int = 1;
      
      public static var LOCKED_ROOM:int = 2;
      
      public static var VOID:int = -1;
      
      public static var STAIRSUP:int = 3;
      
      public static var STAIRSDOWN:int = 4;
      
      public static var STAIRSUPDOWN:int = 5;
      
      public static var NPC:int = 6;
      
      public static var TRADER:int = 7;
      
      public static var N:int = 1;
      
      public static var S:int = 2;
      
      public static var E:int = 4;
      
      public static var W:int = 8;
      
      public static var LN:int = 16;
      
      public static var LS:int = 32;
      
      public static var LE:int = 64;
      
      public static var LW:int = 128;
      
      public var initLoc:int;
      
      public var floor:int;
      
      public var dungeonRooms:IMap;
      
      public var dungeonMap:Array;
      
      public var connectivity:Array;
      
      public function DungeonAbstractContent()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         initLoc = 0;
         connectivity = [];
         dungeonMap = [];
         floor = 1;
         super();
      }
      
      public function setStairButtons(param1:Object = undefined, param2:Object = undefined) : void
      {
         if(param2 != null)
         {
            addButton(5,"下楼",param2);
         }
         if(param1 != null)
         {
            addButton(param2 != null ? 0 : 5,"上楼",param1);
         }
      }
      
      public function setLockedDescriptions(param1:String = undefined, param2:String = undefined, param3:String = undefined, param4:String = undefined) : void
      {
         var _loc5_:int = get_dungeons().get_playerLoc();
         if((uint(get_connectivity()[_loc5_]) & 0x10) != 0 && param1 != null)
         {
            button(6).hint(param1);
         }
         if((uint(get_connectivity()[_loc5_]) & 0x20) != 0 && param2 != null)
         {
            button(11).hint(param2);
         }
         if((uint(get_connectivity()[_loc5_]) & 0x40) != 0 && param3 != null)
         {
            button(12).hint(param3);
         }
         if((uint(get_connectivity()[_loc5_]) & 0x80) != 0 && param4 != null)
         {
            button(10).hint(param4);
         }
      }
      
      public function runFunc() : void
      {
         clearOutput();
         get_dungeons().setDungeonButtons();
         if(get_game().dungeons.map.walkedLayout.indexOf(get_dungeons().get_playerLoc()) == -1)
         {
            get_game().dungeons.map.walkedLayout.push(get_dungeons().get_playerLoc());
         }
         var _loc1_:IMap = dungeonRooms;
         var _loc2_:int = get_dungeons().get_playerLoc();
         _loc1_.h[_loc2_]();
         get_output().flush();
      }
      
      public function leave() : void
      {
         dungeonRooms = new IntMap();
         get_game().inDungeon = false;
         get_dungeons().usingAlternative = false;
         doNext(get_camp().returnToCampUseTwoHours);
      }
      
      public function initRooms() : void
      {
      }
      
      public function initMap() : void
      {
      }
      
      public function get_dungeons() : DungeonCore
      {
         return get_game().dungeons;
      }
      
      public function get_dungeonMap() : Array
      {
         return dungeonMap;
      }
      
      public function get_connectivity() : Array
      {
         return connectivity;
      }
   }
}

