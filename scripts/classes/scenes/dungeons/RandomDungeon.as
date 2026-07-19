package classes.scenes.dungeons
{
   import classes.CoC;
   import classes.Output;
   import classes.internals.Utils;
   import coc.view.CoCButton;
   import flash.Boot;
   import haxe.IMap;
   import haxe.ds.IntMap;
   
   public class RandomDungeon extends DungeonAbstractContent
   {
      
      public static var N:uint = 1;
      
      public static var S:uint = 2;
      
      public static var E:uint = 4;
      
      public static var W:uint = 8;
      
      public function RandomDungeon()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
      }
      
      public static function generateRandomMaze(param1:int, param2:int, param3:int = 4, param4:Boolean = false) : Object
      {
         var _loc9_:int = 0;
         var _loc10_:* = null as Array;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc15_:* = null as Array;
         var _loc16_:* = null;
         var _loc17_:* = null;
         var _loc18_:* = null;
         var _loc19_:* = null as Array;
         var _loc20_:* = null as Array;
         var _loc21_:* = null;
         var _loc22_:* = null as Array;
         var _loc23_:* = null as Array;
         var _loc24_:int = 0;
         var _loc25_:int = 0;
         var _loc5_:int = param4 ? 2 : 1;
         var _loc6_:Array = [];
         var _loc7_:int = 0;
         var _loc8_:int = param2;
         while(_loc7_ < _loc8_)
         {
            _loc9_ = _loc7_++;
            _loc10_ = [];
            _loc11_ = 0;
            _loc12_ = param1;
            while(_loc11_ < _loc12_)
            {
               _loc13_ = _loc11_++;
               _loc10_.push({
                  "room":1,
                  "connections":0
               });
            }
            _loc6_.push(_loc10_);
         }
         _loc10_ = _loc6_;
         _loc7_ = 1 + Utils.rand(param2 - 2);
         _loc8_ = 1 + Utils.rand(param1 - 2);
         _loc10_[_loc7_][_loc8_].room = 0;
         var _loc14_:Array = [{
            "x":_loc7_ + 1,
            "y":_loc8_,
            "fromX":_loc7_,
            "fromY":_loc8_
         },{
            "x":_loc7_,
            "y":_loc8_ + 1,
            "fromX":_loc7_,
            "fromY":_loc8_
         },{
            "x":_loc7_ - 1,
            "y":_loc8_,
            "fromX":_loc7_,
            "fromY":_loc8_
         },{
            "x":_loc7_,
            "y":_loc8_ - 1,
            "fromX":_loc7_,
            "fromY":_loc8_
         }];
         while(int(_loc14_.length) > 0)
         {
            _loc15_ = _loc14_;
            _loc16_ = _loc15_[Utils.rand(int(_loc15_.length))];
            _loc14_.remove(_loc16_);
            _loc7_ = int(_loc16_.x);
            _loc8_ = int(_loc16_.y);
            _loc9_ = int(_loc16_.fromX);
            _loc11_ = int(_loc16_.fromY);
            _loc17_ = _loc10_[_loc7_][_loc8_];
            _loc18_ = _loc10_[_loc9_][_loc11_];
            if(int(_loc17_.room) == 1)
            {
               _loc17_.room = 0;
               if(_loc7_ > _loc9_)
               {
                  _loc17_.connections = 8 | int(_loc17_.connections);
                  _loc18_.connections = 4 | int(_loc18_.connections);
               }
               else if(_loc7_ < _loc9_)
               {
                  _loc17_.connections = 4 | int(_loc17_.connections);
                  _loc18_.connections = 8 | int(_loc18_.connections);
               }
               if(_loc8_ > _loc11_)
               {
                  _loc17_.connections = 1 | int(_loc17_.connections);
                  _loc18_.connections = 2 | int(_loc18_.connections);
               }
               else if(_loc8_ < _loc11_)
               {
                  _loc17_.connections = 2 | int(_loc17_.connections);
                  _loc18_.connections = 1 | int(_loc18_.connections);
               }
               _loc19_ = [];
               _loc12_ = 0;
               _loc20_ = [{
                  "x":_loc7_ + _loc5_,
                  "y":_loc8_,
                  "fromX":_loc7_,
                  "fromY":_loc8_
               },{
                  "x":_loc7_,
                  "y":_loc8_ + _loc5_,
                  "fromX":_loc7_,
                  "fromY":_loc8_
               },{
                  "x":_loc7_ - _loc5_,
                  "y":_loc8_,
                  "fromX":_loc7_,
                  "fromY":_loc8_
               },{
                  "x":_loc7_,
                  "y":_loc8_ - _loc5_,
                  "fromX":_loc7_,
                  "fromY":_loc8_
               }];
               while(_loc12_ < int(_loc20_.length))
               {
                  _loc21_ = _loc20_[_loc12_];
                  _loc12_++;
                  if(int(_loc21_.x) >= 0 && int(_loc21_.x) < param2 && int(_loc21_.y) >= 0 && int(_loc21_.y) < param1)
                  {
                     _loc19_.push(_loc21_);
                  }
               }
               _loc20_ = _loc19_;
               _loc22_ = [];
               _loc12_ = 0;
               _loc23_ = _loc20_;
               while(_loc12_ < int(_loc23_.length))
               {
                  _loc21_ = _loc23_[_loc12_];
                  _loc12_++;
                  if(int(_loc10_[int(_loc21_.x)][int(_loc21_.y)].room) != 1)
                  {
                     _loc22_.push(_loc21_);
                  }
               }
               _loc12_ = int(_loc22_.length);
               while(_loc12_ < param3 && int(_loc20_.length) > 0)
               {
                  _loc23_ = _loc20_;
                  _loc21_ = _loc23_[Utils.rand(int(_loc23_.length))];
                  _loc20_.remove(_loc21_);
                  _loc12_++;
               }
            }
         }
         _loc15_ = [];
         _loc9_ = 0;
         _loc11_ = param2;
         while(_loc9_ < _loc11_)
         {
            _loc12_ = _loc9_++;
            _loc13_ = 0;
            _loc24_ = param1;
            while(_loc13_ < _loc24_)
            {
               _loc25_ = _loc13_++;
               _loc15_.push(int(_loc10_[_loc12_][_loc25_].room));
            }
         }
         _loc19_ = _loc15_;
         _loc20_ = [];
         _loc9_ = 0;
         _loc11_ = param2;
         while(_loc9_ < _loc11_)
         {
            _loc12_ = _loc9_++;
            _loc13_ = 0;
            _loc24_ = param1;
            while(_loc13_ < _loc24_)
            {
               _loc25_ = _loc13_++;
               _loc20_.push(uint(int(_loc10_[_loc12_][_loc25_].connections)));
            }
         }
         return {
            "dungeonMap":_loc19_,
            "connectivity":_loc20_
         };
      }
      
      public function setEntrance() : void
      {
         var _gthis:RandomDungeon = this;
         var _loc1_:int = findEntrance();
         dungeonRooms.h[_loc1_] = function():void
         {
            _gthis.outputText("欢迎来到一个空的随机地牢。");
            _gthis.addButton(0,"离开",_gthis.leave).hint("离开。");
         };
         initLoc = _loc1_;
         get_game().dungeons.set_playerLoc(_loc1_);
      }
      
      override public function runFunc() : void
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
      
      override public function initRooms() : void
      {
         var txt:String;
         var _g:RandomDungeon;
         var _loc5_:int = 0;
         _g = this;
         txt = "东西！";
         var _loc1_:Function = function():void
         {
            _g.outputText(txt);
         };
         var _loc2_:IMap = new IntMap();
         var _loc3_:int = 0;
         var _loc4_:int = int(get_dungeonMap().length);
         while(_loc3_ < _loc4_)
         {
            _loc5_ = _loc3_++;
            _loc2_.h[_loc5_] = _loc1_;
         }
         dungeonRooms = _loc2_;
         setEntrance();
      }
      
      override public function initMap() : void
      {
         var _loc1_:* = RandomDungeon.generateRandomMaze(14,14);
         dungeonMap = _loc1_.dungeonMap;
         connectivity = _loc1_.connectivity;
      }
      
      public function generateRandomDungeon() : void
      {
         get_game().dungeonLoc = 81;
         menu();
         get_game().dungeons.startAlternative(this,0,"野兽之腹");
         get_game().dungeons.setDungeonButtons();
         runFunc();
      }
      
      public function findEntrance() : int
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:* = null as Array;
         var _loc14_:int = 0;
         var _loc15_:* = null as Array;
         var _loc16_:int = 0;
         var _loc1_:RandomDungeon = this;
         var _loc2_:Array = [];
         var _loc3_:int = int(Math.sqrt(int(get_dungeonMap().length)));
         var _loc4_:int = 0;
         var _loc5_:int = int(get_dungeonMap().length);
         while(_loc4_ < _loc5_)
         {
            _loc6_ = _loc4_++;
            if(int(get_dungeonMap()[_loc6_]) == 0)
            {
               _loc7_ = int(_loc6_ % _loc3_);
               _loc8_ = int(Math.floor(_loc6_ / _loc3_));
               _loc9_ = _loc7_ + (_loc8_ - 1) * _loc3_;
               _loc10_ = _loc7_ + (_loc8_ + 1) * _loc3_;
               _loc11_ = _loc7_ + 1 + _loc8_ * _loc3_;
               _loc12_ = _loc7_ - 1 + _loc8_ * _loc3_;
               _loc13_ = [];
               _loc14_ = 0;
               _loc15_ = [_loc9_,_loc10_,_loc11_,_loc12_];
               while(_loc14_ < int(_loc15_.length))
               {
                  _loc16_ = int(_loc15_[_loc14_]);
                  _loc14_++;
                  if(_loc16_ >= 0 && _loc16_ < int(_loc1_.get_dungeonMap().length) && int(_loc1_.get_dungeonMap()[_loc16_]) == 0)
                  {
                     _loc13_.push(_loc16_);
                  }
               }
               _loc14_ = int(_loc13_.length);
               if(_loc14_ == 1 || _loc14_ == 4)
               {
                  _loc2_.push(_loc6_);
               }
            }
         }
         _loc13_ = _loc2_;
         return int(_loc13_[Utils.rand(int(_loc13_.length))]);
      }
   }
}

