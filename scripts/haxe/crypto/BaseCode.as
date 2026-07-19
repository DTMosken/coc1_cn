package haxe.crypto
{
   import flash.Boot;
   import haxe.Exception;
   import haxe.io.Bytes;
   
   public class BaseCode
   {
      
      public var tbl:Array;
      
      public var nbits:int;
      
      public var base:Bytes;
      
      public function BaseCode(param1:Bytes = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         var _loc2_:int = param1.length;
         var _loc3_:int = 1;
         while(_loc2_ > 1 << _loc3_)
         {
            _loc3_++;
         }
         if(_loc3_ > 8 || _loc2_ != 1 << _loc3_)
         {
            throw Exception.thrown("BaseCode : base length must be a power of two.");
         }
         base = param1;
         nbits = _loc3_;
      }
      
      public function initTable() : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc1_:Array = [];
         var _loc2_:int = 0;
         while(_loc2_ < 256)
         {
            _loc3_ = _loc2_++;
            _loc1_[_loc3_] = -1;
         }
         _loc2_ = 0;
         _loc3_ = base.length;
         while(_loc2_ < _loc3_)
         {
            _loc4_ = _loc2_++;
            _loc1_[int(base.b[_loc4_])] = _loc4_;
         }
         tbl = _loc1_;
      }
      
      public function decodeBytes(param1:Bytes) : Bytes
      {
         var _loc11_:int = 0;
         var _loc2_:int = nbits;
         var _loc3_:Bytes = base;
         if(tbl == null)
         {
            initTable();
         }
         var _loc4_:Array = tbl;
         var _loc5_:int = param1.length * _loc2_ >> 3;
         var _loc6_:Bytes = Bytes.alloc(_loc5_);
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         while(_loc10_ < _loc5_)
         {
            while(_loc8_ < 8)
            {
               _loc8_ += _loc2_;
               _loc7_ <<= _loc2_;
               _loc11_ = int(_loc4_[int(param1.b[_loc9_++])]);
               if(_loc11_ == -1)
               {
                  throw Exception.thrown("BaseCode : invalid encoded char");
               }
               _loc7_ |= _loc11_;
            }
            _loc8_ -= 8;
            _loc6_.b[_loc10_++] = _loc7_ >> _loc8_ & 0xFF;
         }
         return _loc6_;
      }
   }
}

