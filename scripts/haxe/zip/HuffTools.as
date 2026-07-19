package haxe.zip
{
   import haxe.Exception;
   import haxe.ds.IntMap;
   
   public class HuffTools
   {
      
      public function HuffTools()
      {
      }
      
      public function treeWalk(param1:Array, param2:int, param3:int, param4:int, param5:Huffman) : void
      {
         var _loc6_:* = null as Huffman;
         var _loc7_:* = null as Huffman;
         if(param5.index == 1)
         {
            _loc6_ = param5.params[0];
            _loc7_ = param5.params[1];
            if(param4 > 0)
            {
               treeWalk(param1,param2,param3 + 1,param4 - 1,_loc6_);
               treeWalk(param1,param2 | 1 << param3,param3 + 1,param4 - 1,_loc7_);
            }
            else
            {
               param1[param2] = treeCompress(param5);
            }
         }
         else
         {
            param1[param2] = treeCompress(param5);
         }
      }
      
      public function treeMake(param1:IntMap, param2:int, param3:int, param4:int) : Huffman
      {
         if(param4 > param2)
         {
            throw Exception.thrown("Invalid huffman");
         }
         var _loc5_:int = param3 << 5 | param4;
         if(_loc5_ in param1.h)
         {
            return Huffman.Found(param1.h[_loc5_]);
         }
         param3 <<= 1;
         param4++;
         return Huffman.NeedBit(treeMake(param1,param2,param3,param4),treeMake(param1,param2,param3 | 1,param4));
      }
      
      public function treeDepth(param1:Huffman) : int
      {
         var _loc2_:int = 0;
         var _loc3_:* = null as Huffman;
         var _loc4_:* = null as Huffman;
         var _loc5_:int = 0;
         var _loc6_:* = null as Array;
         switch(param1.index)
         {
            case 0:
               _loc2_ = int(param1.params[0]);
               return 0;
            case 1:
               _loc3_ = param1.params[0];
               _loc4_ = param1.params[1];
               _loc2_ = treeDepth(_loc3_);
               _loc5_ = treeDepth(_loc4_);
               return 1 + (_loc2_ < _loc5_ ? _loc2_ : _loc5_);
            case 2:
               _loc2_ = int(param1.params[0]);
               _loc6_ = param1.params[1];
               throw Exception.thrown("assert");
            default:
               return;
         }
      }
      
      public function treeCompress(param1:Huffman) : Huffman
      {
         var _loc3_:* = null as Huffman;
         var _loc4_:* = null as Huffman;
         var _loc9_:int = 0;
         var _loc2_:int = treeDepth(param1);
         if(_loc2_ == 0)
         {
            return param1;
         }
         if(_loc2_ == 1)
         {
            if(param1.index == 1)
            {
               _loc3_ = param1.params[0];
               _loc4_ = param1.params[1];
               return Huffman.NeedBit(treeCompress(_loc3_),treeCompress(_loc4_));
            }
            throw Exception.thrown("assert");
         }
         var _loc5_:int = 1 << _loc2_;
         var _loc6_:Array = [];
         var _loc7_:int = 0;
         var _loc8_:int = _loc5_;
         while(_loc7_ < _loc8_)
         {
            _loc9_ = _loc7_++;
            _loc6_.push(Huffman.Found(-1));
         }
         treeWalk(_loc6_,0,0,_loc2_,param1);
         return Huffman.NeedBits(_loc2_,_loc6_);
      }
      
      public function make(param1:Array, param2:int, param3:int, param4:int) : Huffman
      {
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         if(param3 == 1)
         {
            return Huffman.NeedBit(Huffman.Found(0),Huffman.Found(0));
         }
         var _loc5_:Array = [];
         var _loc6_:Array = [];
         if(param4 > 32)
         {
            throw Exception.thrown("Invalid huffman");
         }
         var _loc7_:int = 0;
         var _loc8_:int = param4;
         while(_loc7_ < _loc8_)
         {
            _loc9_ = _loc7_++;
            _loc5_.push(0);
            _loc6_.push(0);
         }
         _loc7_ = 0;
         _loc8_ = param3;
         while(_loc7_ < _loc8_)
         {
            _loc9_ = _loc7_++;
            _loc10_ = int(param1[_loc9_ + param2]);
            if(_loc10_ >= param4)
            {
               throw Exception.thrown("Invalid huffman");
            }
            ++_loc5_[_loc10_];
         }
         _loc7_ = 0;
         _loc8_ = 1;
         _loc9_ = param4 - 1;
         while(_loc8_ < _loc9_)
         {
            _loc10_ = _loc8_++;
            _loc7_ = _loc7_ + int(_loc5_[_loc10_]) << 1;
            _loc6_[_loc10_] = _loc7_;
         }
         var _loc11_:IntMap = new IntMap();
         _loc8_ = 0;
         _loc9_ = param3;
         while(_loc8_ < _loc9_)
         {
            _loc10_ = _loc8_++;
            _loc12_ = int(param1[_loc10_ + param2]);
            if(_loc12_ != 0)
            {
               _loc13_ = int(_loc6_[_loc12_ - 1]);
               _loc6_[_loc12_ - 1] = _loc13_ + 1;
               _loc11_.h[_loc13_ << 5 | _loc12_] = _loc10_;
            }
         }
         return treeCompress(Huffman.NeedBit(treeMake(_loc11_,param4,0,1),treeMake(_loc11_,param4,1,1)));
      }
   }
}

