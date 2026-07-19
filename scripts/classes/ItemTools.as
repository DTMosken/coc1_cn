package classes
{
   import classes.items.Consumable;
   
   public class ItemTools
   {
      
      public function ItemTools()
      {
      }
      
      public static function consumables(param1:Array) : Array
      {
         var _loc5_:* = null as ItemSlot;
         var _loc6_:* = null as ItemType;
         var _loc8_:* = null as Consumable;
         var _loc2_:Array = [];
         var _loc3_:int = 0;
         var _loc4_:Array = param1;
         while(_loc3_ < int(_loc4_.length))
         {
            _loc5_ = _loc4_[_loc3_];
            _loc3_++;
            _loc6_ = _loc5_.itype;
            _loc2_.push(_loc6_ as Consumable);
         }
         _loc4_ = [];
         _loc3_ = 0;
         var _loc7_:Array = _loc2_;
         while(_loc3_ < int(_loc7_.length))
         {
            _loc8_ = _loc7_[_loc3_];
            _loc3_++;
            if(_loc8_ != null)
            {
               _loc4_.push(_loc8_);
            }
         }
         return _loc4_;
      }
      
      public static function withTags(param1:Array, ... rest) : Array
      {
         var _loc7_:* = null as Consumable;
         var _loc4_:Array = [];
         var _loc5_:int = 0;
         var _loc6_:Array = param1;
         while(_loc5_ < int(_loc6_.length))
         {
            _loc7_ = _loc6_[_loc5_];
            _loc5_++;
            if(int(rest.length) == 0)
            {
               _loc7_.hasAnyTags(); //unpopped
            }
            else if(int(rest.length) == 1)
            {
               _loc7_.hasAnyTags(rest[0]); //unpopped
            }
            else if(int(rest.length) == 2)
            {
               _loc7_.hasAnyTags(rest[0],rest[1]); //unpopped
            }
            else if(int(rest.length) == 3)
            {
               _loc7_.hasAnyTags(rest[0],rest[1],rest[2]); //unpopped
            }
            else if(int(rest.length) == 4)
            {
               _loc7_.hasAnyTags(rest[0],rest[1],rest[2],rest[3]); //unpopped
            }
            else if(int(rest.length) == 5)
            {
               _loc7_.hasAnyTags(rest[0],rest[1],rest[2],rest[3],rest[4]); //unpopped
            }
            else if(int(rest.length) == 6)
            {
               _loc7_.hasAnyTags(rest[0],rest[1],rest[2],rest[3],rest[4],rest[5]); //unpopped
            }
            else if(int(rest.length) == 7)
            {
               _loc7_.hasAnyTags(rest[0],rest[1],rest[2],rest[3],rest[4],rest[5],rest[6]); //unpopped
            }
            else if(int(rest.length) == 8)
            {
               _loc7_.hasAnyTags(rest[0],rest[1],rest[2],rest[3],rest[4],rest[5],rest[6],rest[7]); //unpopped
            }
            else if(int(rest.length) == 9)
            {
               _loc7_.hasAnyTags(rest[0],rest[1],rest[2],rest[3],rest[4],rest[5],rest[6],rest[7],rest[8]); //unpopped
            }
            else if(int(rest.length) == 10)
            {
               _loc7_.hasAnyTags(rest[0],rest[1],rest[2],rest[3],rest[4],rest[5],rest[6],rest[7],rest[8],rest[9]); //unpopped
            }
            else if(int(rest.length) == 11)
            {
               _loc7_.hasAnyTags(rest[0],rest[1],rest[2],rest[3],rest[4],rest[5],rest[6],rest[7],rest[8],rest[9],rest[10]); //unpopped
            }
            else if(int(rest.length) == 12)
            {
               _loc7_.hasAnyTags(rest[0],rest[1],rest[2],rest[3],rest[4],rest[5],rest[6],rest[7],rest[8],rest[9],rest[10],rest[11]); //unpopped
            }
            else if(int(rest.length) == 13)
            {
               _loc7_.hasAnyTags(rest[0],rest[1],rest[2],rest[3],rest[4],rest[5],rest[6],rest[7],rest[8],rest[9],rest[10],rest[11],rest[12]); //unpopped
            }
            else if(int(rest.length) == 14)
            {
               _loc7_.hasAnyTags(rest[0],rest[1],rest[2],rest[3],rest[4],rest[5],rest[6],rest[7],rest[8],rest[9],rest[10],rest[11],rest[12],rest[13]); //unpopped
            }
            else if(int(rest.length) == 15)
            {
               _loc7_.hasAnyTags(rest[0],rest[1],rest[2],rest[3],rest[4],rest[5],rest[6],rest[7],rest[8],rest[9],rest[10],rest[11],rest[12],rest[13],rest[14]); //unpopped
            }
            else if(int(rest.length) == 16)
            {
               _loc7_.hasAnyTags(rest[0],rest[1],rest[2],rest[3],rest[4],rest[5],rest[6],rest[7],rest[8],rest[9],rest[10],rest[11],rest[12],rest[13],rest[14],rest[15]); //unpopped
            }
            else if(int(rest.length) == 17)
            {
               _loc7_.hasAnyTags(rest[0],rest[1],rest[2],rest[3],rest[4],rest[5],rest[6],rest[7],rest[8],rest[9],rest[10],rest[11],rest[12],rest[13],rest[14],rest[15],rest[16]); //unpopped
            }
            else if(int(rest.length) == 18)
            {
               _loc7_.hasAnyTags(rest[0],rest[1],rest[2],rest[3],rest[4],rest[5],rest[6],rest[7],rest[8],rest[9],rest[10],rest[11],rest[12],rest[13],rest[14],rest[15],rest[16],rest[17]); //unpopped
            }
            else if(int(rest.length) == 19)
            {
               _loc7_.hasAnyTags(rest[0],rest[1],rest[2],rest[3],rest[4],rest[5],rest[6],rest[7],rest[8],rest[9],rest[10],rest[11],rest[12],rest[13],rest[14],rest[15],rest[16],rest[17],rest[18]); //unpopped
            }
            else
            {
               if(int(rest.length) != 20)
               {
                  throw "Too many rest arguments";
               }
               _loc7_.hasAnyTags(rest[0],rest[1],rest[2],rest[3],rest[4],rest[5],rest[6],rest[7],rest[8],rest[9],rest[10],rest[11],rest[12],rest[13],rest[14],rest[15],rest[16],rest[17],rest[18],rest[19]); //unpopped
            }
            if(§§pop())
            {
               _loc4_.push(_loc7_);
            }
         }
         return _loc4_;
      }
      
      public static function withoutTags(param1:Array, ... rest) : Array
      {
         var _loc7_:* = null as Consumable;
         var _loc4_:Array = [];
         var _loc5_:int = 0;
         var _loc6_:Array = param1;
         while(_loc5_ < int(_loc6_.length))
         {
            _loc7_ = _loc6_[_loc5_];
            _loc5_++;
            if(int(rest.length) == 0)
            {
               _loc7_.hasAnyTags(); //unpopped
            }
            else if(int(rest.length) == 1)
            {
               _loc7_.hasAnyTags(rest[0]); //unpopped
            }
            else if(int(rest.length) == 2)
            {
               _loc7_.hasAnyTags(rest[0],rest[1]); //unpopped
            }
            else if(int(rest.length) == 3)
            {
               _loc7_.hasAnyTags(rest[0],rest[1],rest[2]); //unpopped
            }
            else if(int(rest.length) == 4)
            {
               _loc7_.hasAnyTags(rest[0],rest[1],rest[2],rest[3]); //unpopped
            }
            else if(int(rest.length) == 5)
            {
               _loc7_.hasAnyTags(rest[0],rest[1],rest[2],rest[3],rest[4]); //unpopped
            }
            else if(int(rest.length) == 6)
            {
               _loc7_.hasAnyTags(rest[0],rest[1],rest[2],rest[3],rest[4],rest[5]); //unpopped
            }
            else if(int(rest.length) == 7)
            {
               _loc7_.hasAnyTags(rest[0],rest[1],rest[2],rest[3],rest[4],rest[5],rest[6]); //unpopped
            }
            else if(int(rest.length) == 8)
            {
               _loc7_.hasAnyTags(rest[0],rest[1],rest[2],rest[3],rest[4],rest[5],rest[6],rest[7]); //unpopped
            }
            else if(int(rest.length) == 9)
            {
               _loc7_.hasAnyTags(rest[0],rest[1],rest[2],rest[3],rest[4],rest[5],rest[6],rest[7],rest[8]); //unpopped
            }
            else if(int(rest.length) == 10)
            {
               _loc7_.hasAnyTags(rest[0],rest[1],rest[2],rest[3],rest[4],rest[5],rest[6],rest[7],rest[8],rest[9]); //unpopped
            }
            else if(int(rest.length) == 11)
            {
               _loc7_.hasAnyTags(rest[0],rest[1],rest[2],rest[3],rest[4],rest[5],rest[6],rest[7],rest[8],rest[9],rest[10]); //unpopped
            }
            else if(int(rest.length) == 12)
            {
               _loc7_.hasAnyTags(rest[0],rest[1],rest[2],rest[3],rest[4],rest[5],rest[6],rest[7],rest[8],rest[9],rest[10],rest[11]); //unpopped
            }
            else if(int(rest.length) == 13)
            {
               _loc7_.hasAnyTags(rest[0],rest[1],rest[2],rest[3],rest[4],rest[5],rest[6],rest[7],rest[8],rest[9],rest[10],rest[11],rest[12]); //unpopped
            }
            else if(int(rest.length) == 14)
            {
               _loc7_.hasAnyTags(rest[0],rest[1],rest[2],rest[3],rest[4],rest[5],rest[6],rest[7],rest[8],rest[9],rest[10],rest[11],rest[12],rest[13]); //unpopped
            }
            else if(int(rest.length) == 15)
            {
               _loc7_.hasAnyTags(rest[0],rest[1],rest[2],rest[3],rest[4],rest[5],rest[6],rest[7],rest[8],rest[9],rest[10],rest[11],rest[12],rest[13],rest[14]); //unpopped
            }
            else if(int(rest.length) == 16)
            {
               _loc7_.hasAnyTags(rest[0],rest[1],rest[2],rest[3],rest[4],rest[5],rest[6],rest[7],rest[8],rest[9],rest[10],rest[11],rest[12],rest[13],rest[14],rest[15]); //unpopped
            }
            else if(int(rest.length) == 17)
            {
               _loc7_.hasAnyTags(rest[0],rest[1],rest[2],rest[3],rest[4],rest[5],rest[6],rest[7],rest[8],rest[9],rest[10],rest[11],rest[12],rest[13],rest[14],rest[15],rest[16]); //unpopped
            }
            else if(int(rest.length) == 18)
            {
               _loc7_.hasAnyTags(rest[0],rest[1],rest[2],rest[3],rest[4],rest[5],rest[6],rest[7],rest[8],rest[9],rest[10],rest[11],rest[12],rest[13],rest[14],rest[15],rest[16],rest[17]); //unpopped
            }
            else if(int(rest.length) == 19)
            {
               _loc7_.hasAnyTags(rest[0],rest[1],rest[2],rest[3],rest[4],rest[5],rest[6],rest[7],rest[8],rest[9],rest[10],rest[11],rest[12],rest[13],rest[14],rest[15],rest[16],rest[17],rest[18]); //unpopped
            }
            else
            {
               if(int(rest.length) != 20)
               {
                  throw "Too many rest arguments";
               }
               _loc7_.hasAnyTags(rest[0],rest[1],rest[2],rest[3],rest[4],rest[5],rest[6],rest[7],rest[8],rest[9],rest[10],rest[11],rest[12],rest[13],rest[14],rest[15],rest[16],rest[17],rest[18],rest[19]); //unpopped
            }
            if(!§§pop())
            {
               _loc4_.push(_loc7_);
            }
         }
         return _loc4_;
      }
   }
}

