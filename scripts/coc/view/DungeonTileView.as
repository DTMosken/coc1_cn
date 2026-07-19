package coc.view
{
   import classes.globalFlags.KGAMECLASS;
   import classes.scenes.dungeons._DungeonRoomConst.DungeonRoomConst_Impl_;
   import flash.Boot;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import haxe.IMap;
   import haxe.ds.IntMap;
   
   public class DungeonTileView extends Block
   {
      
      public static var extraIcons:Array = [6,7,5,3,4,2];
      
      public static var TILE_WIDTH:int = 40;
      
      public static var TILE_GRAPHIC_WIDTH:int = 36;
      
      public static var CONNECTION_LENGTH:int = 9;
      
      public static var CONNECTION_HEIGHT:int = 4;
      
      public var index:int;
      
      public var iconEnum:IMap;
      
      public function DungeonTileView(param1:int = 0, param2:int = 0, param3:int = 0)
      {
         var _loc4_:* = null as IMap;
         var _loc5_:int = 0;
         if(Boot.skip_constructor)
         {
            return;
         }
         index = -1;
         initIconEnum();
         super();
         x = param1;
         y = param2;
         set_width(40);
         set_height(40);
         name = "" + param3;
         addElement(new BitmapDataSprite(Theme.current.get_mmBackground(),null,true,0,0,32,32,false,"tile",0,false,1,true));
         if(DungeonTileView.extraIcons.indexOf(int(get_mapLayout()[param3])) != -1)
         {
            _loc4_ = iconEnum;
            _loc5_ = int(get_mapLayout()[param3]);
            addElement(new BitmapDataSprite(_loc4_.h[_loc5_],null,true,0,0,32,32,false,"extra",0,false,1,true));
         }
         index = param3;
         addConnections(param3);
         visible = true;
      }
      
      public function show() : void
      {
         visible = true;
         alpha = 1;
      }
      
      public function setStairs() : void
      {
         getElementByName("tile").set_bitmap(Theme.current.get_mmUpDown());
      }
      
      public function setPlayerLoc() : void
      {
         getElementByName("tile").set_bitmap(Theme.current.get_mmBackgroundPlayer());
      }
      
      public function setNotPlayerLoc() : void
      {
         getElementByName("tile").set_bitmap(Theme.current.get_mmBackground());
      }
      
      public function setLockedRoom() : void
      {
         addElement(new BitmapDataSprite(Theme.current.get_mmTransition(),null,true,0,0,0,0,false,"initLoc",0,false,1,true));
      }
      
      public function setInitLoc() : void
      {
         addElement(new BitmapDataSprite(Theme.current.get_mmExit(),null,true,0,0,0,0,false,"initLoc",0,false,1,true));
      }
      
      public function isConnectable(param1:int) : Boolean
      {
         return DungeonRoomConst_Impl_.CONNECTABLE.indexOf(int(get_mapLayout()[param1])) != -1;
      }
      
      public function initIconEnum() : void
      {
         var _loc1_:IMap = new IntMap();
         var _loc2_:Bitmap = Theme.current.get_mmBackground();
         _loc1_.h[0] = _loc2_;
         _loc2_ = Theme.current.get_mmTransition();
         _loc1_.h[2] = _loc2_;
         _loc2_ = Theme.current.get_mmDown();
         _loc1_.h[4] = _loc2_;
         _loc2_ = Theme.current.get_mmUp();
         _loc1_.h[3] = _loc2_;
         _loc2_ = Theme.current.get_mmUpDown();
         _loc1_.h[5] = _loc2_;
         _loc2_ = Theme.current.get_mmNPC();
         _loc1_.h[6] = _loc2_;
         _loc2_ = Theme.current.get_mmTrader();
         _loc1_.h[7] = _loc2_;
         iconEnum = _loc1_;
      }
      
      public function hide() : void
      {
         visible = false;
      }
      
      public function get_playerLoc() : int
      {
         return KGAMECLASS.kGAMECLASS.dungeons.get_playerLoc();
      }
      
      public function get_mapModulus() : int
      {
         return KGAMECLASS.kGAMECLASS.dungeons.get_mapModulus();
      }
      
      public function get_mapLayout() : Array
      {
         return KGAMECLASS.kGAMECLASS.dungeons.map.get_mapLayout();
      }
      
      public function get_connectivity() : Array
      {
         return KGAMECLASS.kGAMECLASS.dungeons.currDungeon.get_connectivity();
      }
      
      public function get_WALKABLE() : Array
      {
         return DungeonRoomConst_Impl_.WALKABLE;
      }
      
      public function addConnections(param1:int) : void
      {
         if(param1 - get_mapModulus() >= 0 && isConnectable(param1 - get_mapModulus()) && (uint(get_connectivity()[param1]) & 1) != 0)
         {
            addElement(new BitmapDataSprite(Theme.current.get_mmConnect(),null,true,14,-9,0,0,false,"north",0,false,1,true));
         }
         if(param1 + get_mapModulus() <= int(get_mapLayout().length) && isConnectable(param1 + get_mapModulus()) && (uint(get_connectivity()[param1]) & 2) != 0 || param1 == KGAMECLASS.kGAMECLASS.dungeons.currDungeon.initLoc && KGAMECLASS.kGAMECLASS.dungeons.currDungeon.floor == 1)
         {
            addElement(new BitmapDataSprite(Theme.current.get_mmConnect(),null,true,14,32,0,0,false,"south",0,false,1,true));
         }
         if(param1 + 1 < int(get_mapLayout().length) && isConnectable(param1 + 1) && (uint(get_connectivity()[param1]) & 4) != 0)
         {
            addElement(new BitmapDataSprite(Theme.current.get_mmConnectH(),null,true,32,14,0,0,false,"east",0,false,1,true));
         }
         if(param1 - 1 >= 0 && isConnectable(param1 - 1) && (uint(get_connectivity()[param1]) & 8) != 0)
         {
            addElement(new BitmapDataSprite(Theme.current.get_mmConnectH(),null,true,-9,14,0,0,false,"west",0,false,1,true));
         }
         if(param1 - get_mapModulus() >= 0 && isConnectable(param1 - get_mapModulus()) && (uint(get_connectivity()[param1]) & 0x10) != 0)
         {
            addElement(new BitmapDataSprite(Theme.current.get_mmLocked(),null,true,0,-7,0,0,false,"north",0,false,1,true));
         }
         if(param1 + get_mapModulus() <= int(get_mapLayout().length) && isConnectable(param1 + get_mapModulus()) && (uint(get_connectivity()[param1]) & 0x20) != 0)
         {
            addElement(new BitmapDataSprite(Theme.current.get_mmLocked(),null,true,0,32,0,0,false,"south",0,false,1,true));
         }
         if(param1 + 1 < int(get_mapLayout().length) && isConnectable(param1 + 1) && (uint(get_connectivity()[param1]) & 0x40) != 0)
         {
            addElement(new BitmapDataSprite(Theme.current.get_mmLockedV(),null,false,7,0,0,0,false,"east",0,false,1,true));
         }
         if(param1 - 1 >= 0 && isConnectable(param1 - 1) && (uint(get_connectivity()[param1]) & 0x80) != 0)
         {
            addElement(new BitmapDataSprite(Theme.current.get_mmLockedV(),null,false,-7,0,0,0,false,"west",0,false,1,true));
         }
      }
   }
}

