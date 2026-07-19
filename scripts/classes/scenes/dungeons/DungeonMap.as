package classes.scenes.dungeons
{
   import classes.BaseContent;
   import classes.CoC;
   import classes.Player;
   import classes._FlagDict.FlagDict_Impl_;
   import classes.display.GameViewData;
   import classes.display.MapData;
   import classes.display.ScreenType;
   import classes.globalFlags.KFLAGS;
   import classes.internals._OneOf.OneOf_Impl_;
   import classes.scenes.dungeons._DungeonRoomConst.DungeonRoomConst_Impl_;
   import coc.view.Block;
   import coc.view.DungeonTileView;
   import coc.view.MainView;
   import flash.Boot;
   import flash.display.DisplayObject;
   import haxe.ds.Either;
   
   public class DungeonMap extends BaseContent
   {
      
      public static var TILE_WIDTH:int = 40;
      
      public var walkedLayout:Array;
      
      public var py:Number;
      
      public var px:Number;
      
      public var mapStrongholdP2:classes.scenes.dungeons.MapData;
      
      public var mapStrongholdP1:classes.scenes.dungeons.MapData;
      
      public var mapPhoenixtowerF3:classes.scenes.dungeons.MapData;
      
      public var mapPhoenixtowerF2:classes.scenes.dungeons.MapData;
      
      public var mapPhoenixtowerF1:classes.scenes.dungeons.MapData;
      
      public var mapPhoenixtowerB1:classes.scenes.dungeons.MapData;
      
      public var mapFactoryF2:classes.scenes.dungeons.MapData;
      
      public var mapFactoryF1:classes.scenes.dungeons.MapData;
      
      public var mapDesertcave:classes.scenes.dungeons.MapData;
      
      public var mapDeepcave:classes.scenes.dungeons.MapData;
      
      public var mapAnzupalaceF4:classes.scenes.dungeons.MapData;
      
      public var mapAnzupalaceF3:classes.scenes.dungeons.MapData;
      
      public var mapAnzupalaceF2:classes.scenes.dungeons.MapData;
      
      public var mapAnzupalaceF1:classes.scenes.dungeons.MapData;
      
      public var mapAnzupalaceB1:classes.scenes.dungeons.MapData;
      
      public function DungeonMap()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         py = 0;
         px = 0;
         walkedLayout = [];
         super();
      }
      
      public function updateMap() : void
      {
         mapFactoryF1 = new classes.scenes.dungeons.MapData("工厂，1层",[[OneOf_Impl_.fromA(-1),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(4),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(-1)],[OneOf_Impl_.fromA(-1),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(-3),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(-1)],[OneOf_Impl_.fromA(5),OneOf_Impl_.fromA(-4),OneOf_Impl_.fromA(2),OneOf_Impl_.fromA(-4),OneOf_Impl_.fromA(3)],[OneOf_Impl_.fromA(-1),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(get_d1()),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(-1)],[OneOf_Impl_.fromA(9),OneOf_Impl_.fromA(-4),OneOf_Impl_.fromA(0),OneOf_Impl_.fromA(-4),OneOf_Impl_.fromA(1)],[OneOf_Impl_.fromA(-1),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(-3),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(-1)]]);
         mapFactoryF2 = new classes.scenes.dungeons.MapData("工厂，2层",[[OneOf_Impl_.fromA(6),OneOf_Impl_.fromA(-4),OneOf_Impl_.fromA(7)],[OneOf_Impl_.fromA(get_d2()),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(-1)],[OneOf_Impl_.fromA(8),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(-1)]]);
         mapDeepcave = new classes.scenes.dungeons.MapData("泽塔兹的巢穴",[[OneOf_Impl_.fromA(-1),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(16),OneOf_Impl_.fromA(-4),OneOf_Impl_.fromA(15)],[OneOf_Impl_.fromA(-1),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(get_d3()),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(-3)],[OneOf_Impl_.fromA(13),OneOf_Impl_.fromA(-4),OneOf_Impl_.fromA(12),OneOf_Impl_.fromA(-4),OneOf_Impl_.fromA(14)],[OneOf_Impl_.fromA(-1),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(-3),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(-1)],[OneOf_Impl_.fromA(-1),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(11),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(-1)],[OneOf_Impl_.fromA(-1),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(-3),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(-1)],[OneOf_Impl_.fromA(-1),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(10),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(-1)],[OneOf_Impl_.fromA(-1),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(-3),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(-1)]]);
         mapStrongholdP1 = new classes.scenes.dungeons.MapData("蛇怪洞穴",[[OneOf_Impl_.fromA(-1),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromB("tunnel2"),OneOf_Impl_.fromA(-4),OneOf_Impl_.fromA(-1)],[OneOf_Impl_.fromA(-1),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(-3),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(-1)],[OneOf_Impl_.fromA(-1),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromB("magpiehalls"),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(-1)],[OneOf_Impl_.fromA(-1),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(-3),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(-1)],[OneOf_Impl_.fromA(-1),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromB("antechamber"),OneOf_Impl_.fromA(-4),OneOf_Impl_.fromB("roomofmirrors")],[OneOf_Impl_.fromA(-1),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(-3),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(-1)],[OneOf_Impl_.fromB("entrance"),OneOf_Impl_.fromA(-4),OneOf_Impl_.fromB("tunnel"),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(-1)],[OneOf_Impl_.fromA(-3),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(-1),OneOf_Impl_.fromA(-2),OneOf_Impl_
         .fromA(-1)]]);
         mapStrongholdP2 = new classes.scenes.dungeons.MapData("莉希丝的要塞",[[OneOf_Impl_.fromA(-1),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(-1),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromB("throneroom"),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(-1),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(-1)],[OneOf_Impl_.fromA(-1),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(-1),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(get_d5()),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(-1),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(-1)],[OneOf_Impl_.fromA(-1),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromB("northwestcourtyard"),OneOf_Impl_.fromA(-4),OneOf_Impl_.fromB("northcourtyard"),OneOf_Impl_.fromA(-4),OneOf_Impl_.fromB("northeastcourtyard"),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(-1)],[OneOf_Impl_.fromA(-1),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(-3),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(-1),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(-3),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(-1)],[OneOf_Impl_.fromA(-1),OneOf_Impl_.fromA(-4),OneOf_Impl_.fromB("northwestwalk")
         ,OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(-1),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromB("northeastwalk"),OneOf_Impl_.fromA(-4),OneOf_Impl_.fromA(-1)],[OneOf_Impl_.fromA(-1),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(-3),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(-1),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(-3),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(-1)],[OneOf_Impl_.fromA(-1),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromB("westwalk"),OneOf_Impl_.fromA(-4),OneOf_Impl_.fromB("courtyardsquare"),OneOf_Impl_.fromA(-4),OneOf_Impl_.fromB("eastwalk"),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(-1)],[OneOf_Impl_.fromA(-1),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(-3),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(-1),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(-3),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(-1)],[OneOf_Impl_.fromA(-1),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromB("southwestwalk"),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(-1),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromB("southeastwalk"),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(-1)]
         ,[OneOf_Impl_.fromA(-1),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(-3),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(-1),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(-3),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(-1)],[OneOf_Impl_.fromA(-1),OneOf_Impl_.fromA(-4),OneOf_Impl_.fromB("southwestcourtyard"),OneOf_Impl_.fromA(-4),OneOf_Impl_.fromB("southcourtyard"),OneOf_Impl_.fromA(-4),OneOf_Impl_.fromB("southeastcourtyard"),OneOf_Impl_.fromA(-4),OneOf_Impl_.fromA(-1)],[OneOf_Impl_.fromA(-1),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(-1),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(-3),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(-3),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(-1)],[OneOf_Impl_.fromA(-1),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(-1),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromB("northentry"),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromB("greatlift"),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(-1)],[OneOf_Impl_.fromA(-1),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(-1),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(-3),OneOf_Impl_.fromA(-2)
         ,OneOf_Impl_.fromA(-1),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(-1)],[OneOf_Impl_.fromA(-1),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(-1),OneOf_Impl_.fromA(-4),OneOf_Impl_.fromB("edgeofkeep"),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(-1),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(-1)]]);
         mapDesertcave = new classes.scenes.dungeons.MapData("沙漠女巫的洞穴",[[OneOf_Impl_.fromA(-1),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(-1),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(38),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(-1),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(-1)],[OneOf_Impl_.fromA(-1),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(-1),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(-3),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(-1),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(-1)],[OneOf_Impl_.fromA(29),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(26),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(37),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(32),OneOf_Impl_.fromA(-4),OneOf_Impl_.fromA(33)],[OneOf_Impl_.fromA(-3),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(-3),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(-3),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(-3),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(-2)],[OneOf_Impl_.fromA(28),OneOf_Impl_.fromA(-4),OneOf_Impl_.fromA(25),OneOf_Impl_.fromA(-4),OneOf_Impl_.fromA(24),OneOf_Impl_.fromA(-4),OneOf_Impl_
         .fromA(31),OneOf_Impl_.fromA(-4),OneOf_Impl_.fromA(34)],[OneOf_Impl_.fromA(-3),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(-3),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(-3),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(-1),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(-3)],[OneOf_Impl_.fromA(30),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(27),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(23),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(36),OneOf_Impl_.fromA(-4),OneOf_Impl_.fromA(35)],[OneOf_Impl_.fromA(-1),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(-1),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(-3),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(-1),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(-1)]]);
         mapPhoenixtowerB1 = new classes.scenes.dungeons.MapData("不死鸟之塔，地下室",[[OneOf_Impl_.fromA(-1),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(20)],[OneOf_Impl_.fromA(-1),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(-1)],[OneOf_Impl_.fromA(-1),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(18)]]);
         mapPhoenixtowerF1 = new classes.scenes.dungeons.MapData("不死鸟之塔，一层",[[OneOf_Impl_.fromA(-1),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(19)],[OneOf_Impl_.fromA(-1),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(-3)],[OneOf_Impl_.fromA(-1),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(17)],[OneOf_Impl_.fromA(-1),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(-3)]]);
         mapPhoenixtowerF2 = new classes.scenes.dungeons.MapData("不死鸟之塔，二层",[[OneOf_Impl_.fromA(-1),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(21)],[OneOf_Impl_.fromA(-1),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(-1)],[OneOf_Impl_.fromA(-1),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(-1)]]);
         mapPhoenixtowerF3 = new classes.scenes.dungeons.MapData("不死鸟之塔，三层",[[OneOf_Impl_.fromA(-1),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(22)],[OneOf_Impl_.fromA(-1),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(-1)],[OneOf_Impl_.fromA(-1),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(-1)]]);
         mapAnzupalaceB1 = new classes.scenes.dungeons.MapData("安祖的宫殿，地下室",[[OneOf_Impl_.fromA(-1),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(-1),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(-1)],[OneOf_Impl_.fromA(-1),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(-1),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(-1)],[OneOf_Impl_.fromA(54),OneOf_Impl_.fromA(-4),OneOf_Impl_.fromA(53),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(-1)]]);
         mapAnzupalaceF1 = new classes.scenes.dungeons.MapData("安祖的宫殿，一层",[[OneOf_Impl_.fromA(42),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(-1),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(44)],[OneOf_Impl_.fromA(-3),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(-1),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(-3)],[OneOf_Impl_.fromA(41),OneOf_Impl_.fromA(-4),OneOf_Impl_.fromA(40),OneOf_Impl_.fromA(-4),OneOf_Impl_.fromA(43)],[OneOf_Impl_.fromA(-1),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(-3),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(-1)],[OneOf_Impl_.fromA(-1),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(39),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(-1)],[OneOf_Impl_.fromA(-1),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(-3),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(-1)]]);
         mapAnzupalaceF2 = new classes.scenes.dungeons.MapData("安祖的宫殿，2层",[[OneOf_Impl_.fromA(-1),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(48),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(-1)],[OneOf_Impl_.fromA(-1),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(-3),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(-1)],[OneOf_Impl_.fromA(46),OneOf_Impl_.fromA(-4),OneOf_Impl_.fromA(45),OneOf_Impl_.fromA(-4),OneOf_Impl_.fromA(47)]]);
         mapAnzupalaceF3 = new classes.scenes.dungeons.MapData("安祖的宫殿，3层",[[OneOf_Impl_.fromA(-1),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(-1),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(-1)],[OneOf_Impl_.fromA(-1),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(-1),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(-1)],[OneOf_Impl_.fromA(50),OneOf_Impl_.fromA(-4),OneOf_Impl_.fromA(49),OneOf_Impl_.fromA(-4),OneOf_Impl_.fromA(51)]]);
         mapAnzupalaceF4 = new classes.scenes.dungeons.MapData("安祖的宫殿，屋顶",[[OneOf_Impl_.fromA(-1),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(-1),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(-1)],[OneOf_Impl_.fromA(-1),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(-1),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(-1)],[OneOf_Impl_.fromA(-1),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(52),OneOf_Impl_.fromA(-2),OneOf_Impl_.fromA(-1)]]);
      }
      
      public function redraw(param1:Block) : void
      {
         var _loc2_:DisplayObject = param1.getElementByName(Std.string(get_game().dungeons.prevLoc));
         var _loc3_:DungeonTileView = _loc2_ as DungeonTileView;
         if(_loc3_ != null)
         {
            _loc3_.setNotPlayerLoc();
         }
         var _loc4_:DisplayObject = param1.getElementByName(Std.string(get_game().dungeons.get_playerLoc()));
         var _loc5_:DungeonTileView = _loc4_ as DungeonTileView;
         if(_loc5_ != null)
         {
            _loc5_.setPlayerLoc();
            px = _loc5_.x;
            py = _loc5_.y;
         }
      }
      
      public function mapStrFromInt(param1:int) : String
      {
         if(param1 == get_game().dungeonLoc)
         {
            return "[<u>@</u>]";
         }
         var _loc2_:int = param1;
         if(_loc2_ == -6)
         {
            return "L";
         }
         if(_loc2_ == -5)
         {
            return " L ";
         }
         if(_loc2_ == -4)
         {
            return "--";
         }
         if(_loc2_ == -3)
         {
            return " | ";
         }
         if(_loc2_ == -2)
         {
            return " ";
         }
         if(_loc2_ == -1)
         {
            return "   ";
         }
         if(_loc2_ != 19)
         {
            if(_loc2_ != 21)
            {
               if(_loc2_ != 40)
               {
                  if(_loc2_ != 45)
                  {
                     if(_loc2_ != 49)
                     {
                        if(_loc2_ != 6)
                        {
                           if(_loc2_ != 17)
                           {
                              if(_loc2_ != 22)
                              {
                                 if(_loc2_ != 52)
                                 {
                                    if(_loc2_ != 5)
                                    {
                                       if(_loc2_ != 18)
                                       {
                                          if(_loc2_ != 20)
                                          {
                                             if(_loc2_ != 53)
                                             {
                                                return "[<u> </u>]";
                                             }
                                          }
                                       }
                                    }
                                    return "[<u>^</u>]";
                                 }
                              }
                           }
                        }
                        return "[<u>v</u>]";
                     }
                  }
               }
            }
         }
         return "[<u>S</u>]";
      }
      
      public function isTileVisible(param1:int) : Boolean
      {
         return true;
      }
      
      public function get_mapModulus() : int
      {
         return get_game().dungeons.get_mapModulus();
      }
      
      public function get_mapLayout() : Array
      {
         return get_game().dungeons.currDungeon.get_dungeonMap();
      }
      
      public function get_d5() : int
      {
         if(get_game().lethicesKeep.unlockedThroneRoom())
         {
            return -3;
         }
         return -5;
      }
      
      public function get_d4() : int
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,837) > 0)
         {
            return -3;
         }
         return -5;
      }
      
      public function get_d3() : int
      {
         if(FlagDict_Impl_.arrayReadInt(KFLAGS.flags,115) > 0)
         {
            return -3;
         }
         return -5;
      }
      
      public function get_d2() : int
      {
         if(get_player().hasKeyItem("Supervisor\'s Key"))
         {
            return -3;
         }
         return -5;
      }
      
      public function get_d1() : int
      {
         if(get_player().hasKeyItem("Iron Key"))
         {
            return -3;
         }
         return -5;
      }
      
      public function get_connectivity() : Array
      {
         return get_game().dungeons.currDungeon.get_connectivity();
      }
      
      public function generateMap(param1:Block) : void
      {
         var _loc7_:int = 0;
         var _loc8_:* = null as DungeonTileView;
         var _loc2_:Number = 0;
         var _loc3_:Number = 0;
         var _loc4_:Number = Number(Math.POSITIVE_INFINITY);
         var _loc5_:Number = Number(Math.POSITIVE_INFINITY);
         param1.removeElements();
         var _loc6_:int = 0;
         while(_loc6_ < get_mapModulus())
         {
            _loc7_ = 0;
            while(_loc7_ < get_mapModulus())
            {
               if(int(get_mapLayout()[_loc7_ + _loc6_ * get_mapModulus()]) == -1)
               {
                  _loc7_++;
               }
               else
               {
                  if(!(int(get_mapLayout()[_loc7_ + _loc6_ * get_mapModulus()]) == 1 || !isTileVisible(_loc7_ + _loc6_ * get_mapModulus())))
                  {
                     if(DungeonRoomConst_Impl_.CONNECTABLE.indexOf(int(get_mapLayout()[_loc7_ + _loc6_ * get_mapModulus()])) != -1)
                     {
                        _loc5_ = Math.min(_loc2_,_loc5_);
                        _loc4_ = Math.min(_loc3_,_loc4_);
                        _loc8_ = new DungeonTileView(int(_loc2_),int(_loc3_),_loc7_ + _loc6_ * get_mapModulus());
                        if(_loc7_ + _loc6_ * get_mapModulus() == get_game().dungeons.currDungeon.initLoc && get_game().dungeons.currDungeon.floor == 1)
                        {
                           _loc8_.setInitLoc();
                        }
                        param1.addElement(_loc8_);
                     }
                     if(_loc7_ + _loc6_ * get_mapModulus() == get_game().dungeons.get_playerLoc())
                     {
                        px = _loc2_;
                        py = _loc3_;
                     }
                  }
                  _loc2_ += 40;
                  _loc7_++;
               }
            }
            _loc2_ = 0;
            _loc3_ += 40;
            _loc6_++;
         }
         param1.x = MainView.DUNGEONMAP_X - _loc5_;
         param1.y = MainView.DUNGEONMAP_Y - _loc4_;
      }
      
      public function generateIconMinimap() : String
      {
         generateMap(get_mainView().minimapView.minidungeonMap);
         get_mainView().minimapView.minidungeonMap.visible = true;
         return "";
      }
      
      public function displayMap() : void
      {
         var _loc1_:* = null as String;
         var _loc2_:* = null as String;
         clearOutput();
         if(get_game().dungeons.usingAlternative)
         {
            outputText("<b><u>" + get_game().dungeons.dungeonName + "</u></b>");
            get_mainView().dungeonMap.visible = true;
            GameViewData.mapData = classes.display.MapData.Alternative(get_mapModulus(),get_mapLayout(),get_connectivity(),get_game().dungeons.get_playerLoc());
         }
         else
         {
            _loc1_ = chooseRoomToDisplay();
            _loc2_ = "[pg]<b><u>图例</u></b>" + "\n<font face=\"Consolas, _typewriter\">@</font> -- 玩家位置" + "\n<font face=\"Consolas, _typewriter\">L</font> -- 锁住的门" + "\n<font face=\"Consolas, _typewriter\">^v↕</font> -- 楼梯";
            rawOutputText(_loc1_);
            outputText(_loc2_);
            GameViewData.mapData = classes.display.MapData.Legacy(_loc1_,_loc2_);
         }
         GameViewData.screenType = ScreenType.DungeonMap;
         menu();
         addButton(0,"关闭地图",closeMap);
      }
      
      public function closeMap() : void
      {
         GameViewData.screenType = ScreenType.Default;
         GameViewData.mapData = null;
         get_mainView().dungeonMap.visible = false;
         playerMenu();
      }
      
      public function chooseRoomToDisplay() : String
      {
         updateMap();
         var _loc1_:String = "";
         if(get_game().dungeons.usingAlternative)
         {
            return get_game().dungeons.dungeonName;
         }
         if(get_game().inRoomedDungeon)
         {
            if(get_game().inRoomedDungeonName == "BasiliskCave")
            {
               _loc1_ = buildMapDisplay(mapStrongholdP1);
            }
            if(get_game().inRoomedDungeonName == "LethicesKeep")
            {
               _loc1_ = buildMapDisplay(mapStrongholdP2);
            }
         }
         else if(get_game().dungeonLoc >= 17 && get_game().dungeonLoc < 23)
         {
            switch(get_game().dungeonLoc)
            {
               case 17:
               case 19:
                  _loc1_ = buildMapDisplay(mapPhoenixtowerF1);
                  break;
               case 18:
               case 20:
                  _loc1_ = buildMapDisplay(mapPhoenixtowerB1);
                  break;
               case 21:
                  _loc1_ = buildMapDisplay(mapPhoenixtowerF2);
                  break;
               case 22:
                  _loc1_ = buildMapDisplay(mapPhoenixtowerF3);
                  break;
               default:
                  _loc1_ = buildMapDisplay(mapPhoenixtowerF1);
            }
         }
         else if(get_game().dungeonLoc >= 23 && get_game().dungeonLoc < 39)
         {
            _loc1_ = buildMapDisplay(mapDesertcave);
         }
         else if(get_game().dungeonLoc >= 39 && get_game().dungeonLoc < 55)
         {
            if(get_game().dungeonLoc >= 39 && get_game().dungeonLoc <= 44)
            {
               _loc1_ = buildMapDisplay(mapAnzupalaceF1);
            }
            if(get_game().dungeonLoc >= 45 && get_game().dungeonLoc <= 48)
            {
               _loc1_ = buildMapDisplay(mapAnzupalaceF2);
            }
            if(get_game().dungeonLoc >= 49 && get_game().dungeonLoc <= 51)
            {
               _loc1_ = buildMapDisplay(mapAnzupalaceF3);
            }
            if(get_game().dungeonLoc == 52)
            {
               _loc1_ = buildMapDisplay(mapAnzupalaceF4);
            }
            if(get_game().dungeonLoc == 53 || get_game().dungeonLoc == 54)
            {
               _loc1_ = buildMapDisplay(mapAnzupalaceB1);
            }
         }
         return _loc1_ + "</font></b>";
      }
      
      public function buildMapDisplay(param1:classes.scenes.dungeons.MapData) : String
      {
         var _loc5_:* = null as Array;
         var _loc6_:int = 0;
         var _loc7_:* = null as Either;
         var _loc8_:int = 0;
         var _loc9_:* = null as String;
         var _loc2_:String = "" + param1.name + "\n<font face=\"Consolas, _typewriter\">";
         var _loc3_:int = 0;
         var _loc4_:Array = param1.map;
         while(_loc3_ < int(_loc4_.length))
         {
            _loc5_ = _loc4_[_loc3_];
            _loc3_++;
            _loc6_ = 0;
            while(_loc6_ < int(_loc5_.length))
            {
               _loc7_ = _loc5_[_loc6_];
               _loc6_++;
               switch(_loc7_.index)
               {
                  case 0:
                     _loc8_ = _loc7_.params[0];
                     _loc2_ += mapStrFromInt(_loc8_);
                     break;
                  case 1:
                     _loc9_ = _loc7_.params[0];
                     if(get_game().dungeons._currentRoom == _loc9_)
                     {
                        _loc2_ += "[<u>@</u>]";
                     }
                     else
                     {
                        _loc2_ += "[<u> </u>]";
                     }
               }
            }
            _loc2_ += "\n";
         }
         return _loc2_ + "</font>";
      }
   }
}

