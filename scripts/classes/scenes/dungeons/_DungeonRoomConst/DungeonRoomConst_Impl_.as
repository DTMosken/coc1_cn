package classes.scenes.dungeons._DungeonRoomConst
{
   public final class DungeonRoomConst_Impl_
   {
      
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
      
      public static var WALKABLE:Array = [0,3,4,5,7];
      
      public static var CONNECTABLE:Array = [0,3,4,5,7,2];
      
      public function DungeonRoomConst_Impl_()
      {
      }
      
      public static function _new(param1:uint) : uint
      {
         return param1;
      }
      
      public static function fromStr(param1:String) : uint
      {
         var _loc6_:int = 0;
         var _loc7_:* = null as String;
         var _loc8_:* = null as String;
         var _loc2_:int = 0;
         var _loc3_:String = "";
         var _loc4_:int = 0;
         var _loc5_:int = param1.length;
         while(_loc4_ < _loc5_)
         {
            _loc6_ = _loc4_++;
            _loc7_ = param1.charAt(_loc6_).toUpperCase();
            if(_loc3_ == "L")
            {
               _loc8_ = _loc7_;
               if(_loc8_ == "E")
               {
                  _loc2_ |= 64;
                  _loc3_ = "";
               }
               else if(_loc8_ == "L")
               {
                  _loc3_ = "L";
               }
               else if(_loc8_ == "N")
               {
                  _loc2_ |= 16;
                  _loc3_ = "";
               }
               else if(_loc8_ == "S")
               {
                  _loc2_ |= 32;
                  _loc3_ = "";
               }
               else
               {
                  if(_loc8_ != "W")
                  {
                     return uint(-1);
                  }
                  _loc2_ |= 128;
                  _loc3_ = "";
               }
            }
            else
            {
               _loc8_ = _loc7_;
               if(_loc8_ == "E")
               {
                  _loc2_ |= 4;
                  _loc3_ = "";
               }
               else if(_loc8_ == "L")
               {
                  _loc3_ = "L";
               }
               else if(_loc8_ == "N")
               {
                  _loc2_ |= 1;
                  _loc3_ = "";
               }
               else if(_loc8_ == "S")
               {
                  _loc2_ |= 2;
                  _loc3_ = "";
               }
               else
               {
                  if(_loc8_ != "W")
                  {
                     return uint(-1);
                  }
                  _loc2_ |= 8;
                  _loc3_ = "";
               }
            }
         }
         return uint(_loc2_);
      }
   }
}

