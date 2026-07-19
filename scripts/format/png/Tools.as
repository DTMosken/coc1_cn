package format.png
{
   import avm2.intrinsics.memory.li8;
   import avm2.intrinsics.memory.si8;
   import flash.system.ApplicationDomain;
   import flash.utils.ByteArray;
   import format.tools.Deflate;
   import format.tools.Inflate;
   import haxe.Exception;
   import haxe.ds.List;
   import haxe.ds._List.ListNode;
   import haxe.io.Bytes;
   import haxe.io.BytesBuffer;
   
   public class Tools
   {
      
      public function Tools()
      {
      }
      
      public static function getHeader(param1:List) : Object
      {
         var _loc3_:* = null as Chunk;
         var _loc4_:* = null as Chunk;
         var _loc5_:* = null;
         var _loc2_:ListNode = param1.h;
         while(_loc2_ != null)
         {
            _loc3_ = _loc2_.item;
            _loc2_ = _loc2_.next;
            _loc4_ = _loc3_;
            if(_loc4_.index == 1)
            {
               return _loc4_.params[0];
            }
         }
         throw Exception.thrown("Header not found");
      }
      
      public static function getPalette(param1:List) : Bytes
      {
         var _loc3_:* = null as Chunk;
         var _loc4_:* = null as Chunk;
         var _loc5_:* = null as Bytes;
         var _loc2_:ListNode = param1.h;
         while(_loc2_ != null)
         {
            _loc3_ = _loc2_.item;
            _loc2_ = _loc2_.next;
            _loc4_ = _loc3_;
            if(_loc4_.index == 3)
            {
               return _loc4_.params[0];
            }
         }
         return null;
      }
      
      public static function filter(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int = 4) : int
      {
         var _loc8_:int = param3 == 0 ? 0 : li8(param1 + (param6 - param4));
         var _loc9_:int = param2 == 0 || param3 == 0 ? 0 : li8(param1 + (param6 - param4 - param7));
         var _loc10_:int = param5 + _loc8_ - _loc9_;
         var _loc11_:int = _loc10_ - param5;
         if(_loc11_ < 0)
         {
            _loc11_ = -_loc11_;
         }
         var _loc12_:int = _loc10_ - _loc8_;
         if(_loc12_ < 0)
         {
            _loc12_ = -_loc12_;
         }
         var _loc13_:int = _loc10_ - _loc9_;
         if(_loc13_ < 0)
         {
            _loc13_ = -_loc13_;
         }
         if(_loc11_ <= _loc12_ && _loc11_ <= _loc13_)
         {
            return param5;
         }
         if(_loc12_ <= _loc13_)
         {
            return _loc8_;
         }
         return _loc9_;
      }
      
      public static function reverseBytes(param1:Bytes) : void
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc2_:ByteArray = param1.b;
         if(_loc2_.length < 1024)
         {
            _loc2_.length = 1024;
         }
         ApplicationDomain.currentDomain.domainMemory = _loc2_;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = param1.length >> 2;
         while(_loc4_ < _loc5_)
         {
            _loc6_ = _loc4_++;
            _loc7_ = li8(_loc3_);
            _loc8_ = li8(_loc3_ + 1);
            _loc9_ = li8(_loc3_ + 2);
            _loc10_ = li8(_loc3_ + 3);
            _loc11_ = _loc3_++;
            si8(_loc10_,_loc11_);
            _loc11_ = _loc3_++;
            si8(_loc9_,_loc11_);
            _loc11_ = _loc3_++;
            si8(_loc8_,_loc11_);
            _loc11_ = _loc3_++;
            si8(_loc7_,_loc11_);
         }
      }
      
      public static function extractGrey(param1:List) : Bytes
      {
         var _loc7_:* = null as Chunk;
         var _loc8_:* = null as Chunk;
         var _loc9_:* = null as Bytes;
         var _loc13_:Boolean = false;
         var _loc14_:int = 0;
         var _loc15_:int = 0;
         var _loc16_:* = null as ByteArray;
         var _loc17_:int = 0;
         var _loc18_:* = null as Bytes;
         var _loc19_:int = 0;
         var _loc20_:int = 0;
         var _loc21_:int = 0;
         var _loc22_:int = 0;
         var _loc23_:int = 0;
         var _loc24_:int = 0;
         var _loc25_:int = 0;
         var _loc26_:int = 0;
         var _loc27_:int = 0;
         var _loc28_:int = 0;
         var _loc29_:int = 0;
         var _loc30_:int = 0;
         var _loc31_:int = 0;
         var _loc32_:int = 0;
         var _loc33_:int = 0;
         var _loc34_:int = 0;
         var _loc35_:int = 0;
         var _loc36_:int = 0;
         var _loc37_:int = 0;
         var _loc38_:int = 0;
         var _loc39_:* = null as ByteArray;
         var _loc2_:* = Tools.getHeader(param1);
         var _loc3_:Bytes = Bytes.alloc(int(_loc2_.width) * int(_loc2_.height));
         var _loc4_:Bytes = null;
         var _loc5_:BytesBuffer = null;
         var _loc6_:ListNode = param1.h;
         while(_loc6_ != null)
         {
            _loc7_ = _loc6_.item;
            _loc6_ = _loc6_.next;
            _loc8_ = _loc7_;
            if(_loc8_.index == 2)
            {
               _loc9_ = _loc8_.params[0];
               if(_loc5_ != null)
               {
                  _loc5_.b.writeBytes(_loc9_.b);
               }
               else if(_loc4_ == null)
               {
                  _loc4_ = _loc9_;
               }
               else
               {
                  _loc5_ = new BytesBuffer();
                  _loc5_.b.writeBytes(_loc4_.b);
                  _loc5_.b.writeBytes(_loc9_.b);
                  _loc4_ = null;
               }
            }
         }
         if(_loc5_ != null)
         {
            _loc4_ = _loc5_.getBytes();
         }
         if(_loc4_ == null)
         {
            throw Exception.thrown("Data not found");
         }
         _loc4_ = Inflate.run(_loc4_);
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:Color = _loc2_.color;
         if(_loc12_.index == 0)
         {
            _loc13_ = Boolean(_loc12_.params[0]);
            if(int(_loc2_.colbits) != 8)
            {
               throw Exception.thrown("Unsupported color mode");
            }
            _loc14_ = int(_loc2_.width);
            _loc15_ = (_loc13_ ? 2 : 1) * _loc14_ + 1;
            if(_loc4_.length < int(_loc2_.height) * _loc15_)
            {
               throw Exception.thrown("Not enough data");
            }
            _loc16_ = _loc4_.b;
            _loc17_ = int(_loc2_.height) * _loc15_;
            _loc16_.length = _loc17_ + int(_loc2_.width) * int(_loc2_.height);
            if(_loc16_.length < 1024)
            {
               _loc16_.length = 1024;
            }
            ApplicationDomain.currentDomain.domainMemory = _loc16_;
            _loc9_ = _loc4_;
            _loc18_ = _loc3_;
            _loc19_ = 0;
            _loc20_ = _loc17_;
            _loc21_ = _loc13_ ? 2 : 1;
            _loc22_ = 0;
            _loc23_ = int(_loc2_.height);
            while(_loc22_ < _loc23_)
            {
               _loc24_ = _loc22_++;
               _loc25_ = _loc10_++;
               _loc26_ = li8(_loc19_ + _loc25_);
               switch(_loc26_)
               {
                  case 0:
                     _loc27_ = 0;
                     _loc28_ = _loc14_;
                     while(_loc27_ < _loc28_)
                     {
                        _loc29_ = _loc27_++;
                        _loc30_ = li8(_loc19_ + _loc10_);
                        _loc10_ += _loc21_;
                        _loc31_ = _loc11_++;
                        si8(_loc30_,_loc20_ + _loc31_);
                     }
                     break;
                  case 1:
                     _loc27_ = 0;
                     _loc28_ = 0;
                     _loc29_ = _loc14_;
                     while(_loc28_ < _loc29_)
                     {
                        _loc30_ = _loc28_++;
                        _loc27_ += li8(_loc19_ + _loc10_);
                        _loc10_ += _loc21_;
                        _loc31_ = _loc11_++;
                        si8(_loc27_,_loc20_ + _loc31_);
                     }
                     break;
                  case 2:
                     _loc27_ = _loc24_ == 0 ? 0 : _loc14_;
                     _loc28_ = 0;
                     _loc29_ = _loc14_;
                     while(_loc28_ < _loc29_)
                     {
                        _loc30_ = _loc28_++;
                        _loc31_ = li8(_loc19_ + _loc10_) + li8(_loc20_ + (_loc11_ - _loc27_));
                        _loc10_ += _loc21_;
                        _loc32_ = _loc11_++;
                        si8(_loc31_,_loc20_ + _loc32_);
                     }
                     break;
                  case 3:
                     _loc27_ = 0;
                     _loc28_ = _loc24_ == 0 ? 0 : _loc14_;
                     _loc29_ = 0;
                     _loc30_ = _loc14_;
                     while(_loc29_ < _loc30_)
                     {
                        _loc31_ = _loc29_++;
                        _loc27_ = li8(_loc19_ + _loc10_) + (_loc27_ + li8(_loc20_ + (_loc11_ - _loc28_)) >> 1) & 0xFF;
                        _loc10_ += _loc21_;
                        _loc32_ = _loc11_++;
                        si8(_loc27_,_loc20_ + _loc32_);
                     }
                     break;
                  case 4:
                     _loc27_ = _loc14_;
                     _loc28_ = 0;
                     _loc29_ = 0;
                     _loc30_ = _loc14_;
                     while(_loc29_ < _loc30_)
                     {
                        _loc31_ = _loc29_++;
                        _loc32_ = _loc24_ == 0 ? 0 : li8(_loc20_ + (_loc11_ - _loc27_));
                        _loc33_ = _loc31_ == 0 || _loc24_ == 0 ? 0 : li8(_loc20_ + (_loc11_ - _loc27_ - 1));
                        _loc34_ = _loc28_ + _loc32_ - _loc33_;
                        _loc35_ = _loc34_ - _loc28_;
                        if(_loc35_ < 0)
                        {
                           _loc35_ = -_loc35_;
                        }
                        _loc36_ = _loc34_ - _loc32_;
                        if(_loc36_ < 0)
                        {
                           _loc36_ = -_loc36_;
                        }
                        _loc37_ = _loc34_ - _loc33_;
                        if(_loc37_ < 0)
                        {
                           _loc37_ = -_loc37_;
                        }
                        _loc28_ = (_loc35_ <= _loc36_ && _loc35_ <= _loc37_ ? _loc28_ : (_loc36_ <= _loc37_ ? _loc32_ : _loc33_)) + li8(_loc19_ + _loc10_) & 0xFF;
                        _loc10_ += _loc21_;
                        _loc38_ = _loc11_++;
                        si8(_loc28_,_loc20_ + _loc38_);
                     }
                     break;
                  default:
                     throw Exception.thrown("Invalid filter " + _loc26_);
               }
            }
            _loc39_ = _loc18_.b;
            _loc39_.position = 0;
            _loc39_.writeBytes(_loc9_.b,_loc17_,int(_loc2_.width) * int(_loc2_.height));
            return _loc3_;
         }
         throw Exception.thrown("Unsupported color mode");
      }
      
      public static function extract32(param1:List, param2:Bytes = undefined, param3:Object = undefined) : Bytes
      {
         var _loc8_:* = null as ListNode;
         var _loc9_:* = null as Chunk;
         var _loc10_:* = null as Chunk;
         var _loc11_:* = null as Bytes;
         var _loc17_:Boolean = false;
         var _loc18_:int = 0;
         var _loc19_:int = 0;
         var _loc20_:int = 0;
         var _loc21_:* = null as ByteArray;
         var _loc22_:int = 0;
         var _loc23_:* = null as Bytes;
         var _loc24_:int = 0;
         var _loc25_:int = 0;
         var _loc26_:int = 0;
         var _loc27_:int = 0;
         var _loc28_:int = 0;
         var _loc29_:int = 0;
         var _loc30_:int = 0;
         var _loc31_:int = 0;
         var _loc32_:int = 0;
         var _loc33_:int = 0;
         var _loc34_:int = 0;
         var _loc35_:int = 0;
         var _loc36_:int = 0;
         var _loc37_:int = 0;
         var _loc38_:int = 0;
         var _loc39_:int = 0;
         var _loc40_:int = 0;
         var _loc41_:int = 0;
         var _loc42_:int = 0;
         var _loc43_:int = 0;
         var _loc44_:int = 0;
         var _loc45_:int = 0;
         var _loc46_:int = 0;
         var _loc47_:int = 0;
         var _loc48_:int = 0;
         var _loc49_:int = 0;
         var _loc50_:int = 0;
         var _loc51_:int = 0;
         var _loc52_:int = 0;
         var _loc53_:int = 0;
         var _loc54_:* = null as ByteArray;
         var _loc55_:* = null as Bytes;
         var _loc56_:int = 0;
         var _loc57_:int = 0;
         var _loc58_:int = 0;
         var _loc59_:int = 0;
         var _loc60_:int = 0;
         var _loc61_:int = 0;
         var _loc62_:int = 0;
         var _loc63_:int = 0;
         var _loc64_:int = 0;
         var _loc65_:int = 0;
         var _loc66_:int = 0;
         var _loc67_:int = 0;
         var _loc68_:int = 0;
         var _loc69_:int = 0;
         var _loc70_:int = 0;
         var _loc71_:int = 0;
         var _loc72_:* = null as Bytes;
         var _loc4_:* = Tools.getHeader(param1);
         var _loc5_:Bytes = param2 == null ? Bytes.alloc(int(_loc4_.width) * int(_loc4_.height) * 4) : param2;
         var _loc6_:Bytes = null;
         var _loc7_:BytesBuffer = null;
         _loc8_ = param1.h;
         while(_loc8_ != null)
         {
            _loc9_ = _loc8_.item;
            _loc8_ = _loc8_.next;
            _loc10_ = _loc9_;
            if(_loc10_.index == 2)
            {
               _loc11_ = _loc10_.params[0];
               if(_loc7_ != null)
               {
                  _loc7_.b.writeBytes(_loc11_.b);
               }
               else if(_loc6_ == null)
               {
                  _loc6_ = _loc11_;
               }
               else
               {
                  _loc7_ = new BytesBuffer();
                  _loc7_.b.writeBytes(_loc6_.b);
                  _loc7_.b.writeBytes(_loc11_.b);
                  _loc6_ = null;
               }
            }
         }
         if(_loc7_ != null)
         {
            _loc6_ = _loc7_.getBytes();
         }
         if(_loc6_ == null)
         {
            throw Exception.thrown("Data not found");
         }
         _loc6_ = Inflate.run(_loc6_);
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         if(param3)
         {
            _loc14_ = -int(_loc4_.width) * 8;
            _loc13_ = (int(_loc4_.height) - 1) * (int(_loc4_.width) * 4);
         }
         var _loc15_:int = param3 ? -1 : 1;
         var _loc16_:Color = _loc4_.color;
         switch(_loc16_.index)
         {
            case 0:
               _loc17_ = Boolean(_loc16_.params[0]);
               if(int(_loc4_.colbits) != 8)
               {
                  throw Exception.thrown("Unsupported color mode");
               }
               _loc18_ = int(_loc4_.width);
               _loc19_ = (_loc17_ ? 2 : 1) * _loc18_ + 1;
               if(_loc6_.length < int(_loc4_.height) * _loc19_)
               {
                  throw Exception.thrown("Not enough data");
               }
               _loc20_ = -1;
               if(!_loc17_)
               {
                  _loc8_ = param1.h;
                  while(_loc8_ != null)
                  {
                     _loc9_ = _loc8_.item;
                     _loc8_ = _loc8_.next;
                     _loc10_ = _loc9_;
                     if(_loc10_.index == 4)
                     {
                        if(_loc10_.params[0] == "tRNS")
                        {
                           _loc11_ = _loc10_.params[1];
                           if(_loc11_.length >= 2)
                           {
                              _loc20_ = int(_loc11_.b[1]);
                           }
                           break;
                        }
                     }
                  }
               }
               _loc21_ = _loc6_.b;
               _loc22_ = int(_loc4_.height) * _loc19_;
               _loc21_.length = _loc22_ + int(_loc4_.width) * int(_loc4_.height) * 4;
               if(_loc21_.length < 1024)
               {
                  _loc21_.length = 1024;
               }
               ApplicationDomain.currentDomain.domainMemory = _loc21_;
               _loc11_ = _loc6_;
               _loc23_ = _loc5_;
               _loc24_ = 0;
               _loc25_ = _loc22_;
               _loc26_ = 0;
               _loc27_ = int(_loc4_.height);
               while(_loc26_ < _loc27_)
               {
                  _loc28_ = _loc26_++;
                  _loc29_ = _loc12_++;
                  _loc30_ = li8(_loc24_ + _loc29_);
                  switch(_loc30_)
                  {
                     case 0:
                        if(_loc17_)
                        {
                           _loc31_ = 0;
                           _loc32_ = _loc18_;
                           while(_loc31_ < _loc32_)
                           {
                              _loc33_ = _loc31_++;
                              _loc34_ = _loc12_++;
                              _loc35_ = li8(_loc24_ + _loc34_);
                              _loc36_ = _loc13_++;
                              si8(_loc35_,_loc25_ + _loc36_);
                              _loc36_ = _loc13_++;
                              si8(_loc35_,_loc25_ + _loc36_);
                              _loc36_ = _loc13_++;
                              si8(_loc35_,_loc25_ + _loc36_);
                              _loc36_ = _loc13_++;
                              _loc37_ = _loc12_++;
                              _loc38_ = li8(_loc24_ + _loc37_);
                              si8(_loc38_,_loc25_ + _loc36_);
                           }
                        }
                        else
                        {
                           _loc31_ = 0;
                           _loc32_ = _loc18_;
                           while(_loc31_ < _loc32_)
                           {
                              _loc33_ = _loc31_++;
                              _loc34_ = _loc12_++;
                              _loc35_ = li8(_loc24_ + _loc34_);
                              _loc36_ = _loc13_++;
                              si8(_loc35_,_loc25_ + _loc36_);
                              _loc36_ = _loc13_++;
                              si8(_loc35_,_loc25_ + _loc36_);
                              _loc36_ = _loc13_++;
                              si8(_loc35_,_loc25_ + _loc36_);
                              _loc36_ = _loc13_++;
                              si8(_loc35_ == _loc20_ ? 0 : 255,_loc25_ + _loc36_);
                           }
                        }
                        break;
                     case 1:
                        _loc31_ = 0;
                        _loc32_ = 0;
                        if(_loc17_)
                        {
                           _loc33_ = 0;
                           _loc34_ = _loc18_;
                           while(_loc33_ < _loc34_)
                           {
                              _loc35_ = _loc33_++;
                              _loc36_ = _loc12_++;
                              _loc31_ += li8(_loc24_ + _loc36_);
                              _loc37_ = _loc13_++;
                              si8(_loc31_,_loc25_ + _loc37_);
                              _loc37_ = _loc13_++;
                              si8(_loc31_,_loc25_ + _loc37_);
                              _loc37_ = _loc13_++;
                              si8(_loc31_,_loc25_ + _loc37_);
                              _loc37_ = _loc12_++;
                              _loc32_ += li8(_loc24_ + _loc37_);
                              _loc38_ = _loc13_++;
                              si8(_loc32_,_loc25_ + _loc38_);
                           }
                        }
                        else
                        {
                           _loc33_ = 0;
                           _loc34_ = _loc18_;
                           while(_loc33_ < _loc34_)
                           {
                              _loc35_ = _loc33_++;
                              _loc36_ = _loc12_++;
                              _loc31_ += li8(_loc24_ + _loc36_);
                              _loc37_ = _loc13_++;
                              si8(_loc31_,_loc25_ + _loc37_);
                              _loc37_ = _loc13_++;
                              si8(_loc31_,_loc25_ + _loc37_);
                              _loc37_ = _loc13_++;
                              si8(_loc31_,_loc25_ + _loc37_);
                              _loc37_ = _loc13_++;
                              si8(_loc31_ == _loc20_ ? 0 : 255,_loc25_ + _loc37_);
                           }
                        }
                        break;
                     case 2:
                        _loc31_ = _loc28_ == 0 ? 0 : _loc18_ * 4 * _loc15_;
                        if(_loc17_)
                        {
                           _loc32_ = 0;
                           _loc33_ = _loc18_;
                           while(_loc32_ < _loc33_)
                           {
                              _loc34_ = _loc32_++;
                              _loc35_ = _loc12_++;
                              _loc36_ = li8(_loc24_ + _loc35_) + li8(_loc25_ + (_loc13_ - _loc31_));
                              _loc37_ = _loc13_++;
                              si8(_loc36_,_loc25_ + _loc37_);
                              _loc37_ = _loc13_++;
                              si8(_loc36_,_loc25_ + _loc37_);
                              _loc37_ = _loc13_++;
                              si8(_loc36_,_loc25_ + _loc37_);
                              _loc37_ = _loc12_++;
                              _loc38_ = li8(_loc24_ + _loc37_) + li8(_loc25_ + (_loc13_ - _loc31_));
                              _loc39_ = _loc13_++;
                              si8(_loc38_,_loc25_ + _loc39_);
                           }
                        }
                        else
                        {
                           _loc32_ = 0;
                           _loc33_ = _loc18_;
                           while(_loc32_ < _loc33_)
                           {
                              _loc34_ = _loc32_++;
                              _loc35_ = _loc12_++;
                              _loc36_ = li8(_loc24_ + _loc35_) + li8(_loc25_ + (_loc13_ - _loc31_));
                              _loc37_ = _loc13_++;
                              si8(_loc36_,_loc25_ + _loc37_);
                              _loc37_ = _loc13_++;
                              si8(_loc36_,_loc25_ + _loc37_);
                              _loc37_ = _loc13_++;
                              si8(_loc36_,_loc25_ + _loc37_);
                              _loc37_ = _loc13_++;
                              si8(_loc36_ == _loc20_ ? 0 : 255,_loc25_ + _loc37_);
                           }
                        }
                        break;
                     case 3:
                        _loc31_ = 0;
                        _loc32_ = 0;
                        _loc33_ = _loc28_ == 0 ? 0 : _loc18_ * 4 * _loc15_;
                        if(_loc17_)
                        {
                           _loc34_ = 0;
                           _loc35_ = _loc18_;
                           while(_loc34_ < _loc35_)
                           {
                              _loc36_ = _loc34_++;
                              _loc37_ = _loc12_++;
                              _loc31_ = li8(_loc24_ + _loc37_) + (_loc31_ + li8(_loc25_ + (_loc13_ - _loc33_)) >> 1) & 0xFF;
                              _loc38_ = _loc13_++;
                              si8(_loc31_,_loc25_ + _loc38_);
                              _loc38_ = _loc13_++;
                              si8(_loc31_,_loc25_ + _loc38_);
                              _loc38_ = _loc13_++;
                              si8(_loc31_,_loc25_ + _loc38_);
                              _loc38_ = _loc12_++;
                              _loc32_ = li8(_loc24_ + _loc38_) + (_loc32_ + li8(_loc25_ + (_loc13_ - _loc33_)) >> 1) & 0xFF;
                              _loc39_ = _loc13_++;
                              si8(_loc32_,_loc25_ + _loc39_);
                           }
                        }
                        else
                        {
                           _loc34_ = 0;
                           _loc35_ = _loc18_;
                           while(_loc34_ < _loc35_)
                           {
                              _loc36_ = _loc34_++;
                              _loc37_ = _loc12_++;
                              _loc31_ = li8(_loc24_ + _loc37_) + (_loc31_ + li8(_loc25_ + (_loc13_ - _loc33_)) >> 1) & 0xFF;
                              _loc38_ = _loc13_++;
                              si8(_loc31_,_loc25_ + _loc38_);
                              _loc38_ = _loc13_++;
                              si8(_loc31_,_loc25_ + _loc38_);
                              _loc38_ = _loc13_++;
                              si8(_loc31_,_loc25_ + _loc38_);
                              _loc38_ = _loc13_++;
                              si8(_loc31_ == _loc20_ ? 0 : 255,_loc25_ + _loc38_);
                           }
                        }
                        break;
                     case 4:
                        _loc31_ = _loc18_ * 4 * _loc15_;
                        _loc32_ = 0;
                        _loc33_ = 0;
                        if(_loc17_)
                        {
                           _loc34_ = 0;
                           _loc35_ = _loc18_;
                           while(_loc34_ < _loc35_)
                           {
                              _loc36_ = _loc34_++;
                              _loc37_ = 4;
                              _loc38_ = _loc28_ == 0 ? 0 : li8(_loc25_ + (_loc13_ - _loc31_));
                              _loc39_ = _loc36_ == 0 || _loc28_ == 0 ? 0 : li8(_loc25_ + (_loc13_ - _loc31_ - _loc37_));
                              _loc40_ = _loc32_ + _loc38_ - _loc39_;
                              _loc41_ = _loc40_ - _loc32_;
                              if(_loc41_ < 0)
                              {
                                 _loc41_ = -_loc41_;
                              }
                              _loc42_ = _loc40_ - _loc38_;
                              if(_loc42_ < 0)
                              {
                                 _loc42_ = -_loc42_;
                              }
                              _loc43_ = _loc40_ - _loc39_;
                              if(_loc43_ < 0)
                              {
                                 _loc43_ = -_loc43_;
                              }
                              _loc44_ = _loc12_++;
                              _loc32_ = (_loc41_ <= _loc42_ && _loc41_ <= _loc43_ ? _loc32_ : (_loc42_ <= _loc43_ ? _loc38_ : _loc39_)) + li8(_loc24_ + _loc44_) & 0xFF;
                              _loc45_ = _loc13_++;
                              si8(_loc32_,_loc25_ + _loc45_);
                              _loc45_ = _loc13_++;
                              si8(_loc32_,_loc25_ + _loc45_);
                              _loc45_ = _loc13_++;
                              si8(_loc32_,_loc25_ + _loc45_);
                              _loc45_ = 4;
                              _loc46_ = _loc28_ == 0 ? 0 : li8(_loc25_ + (_loc13_ - _loc31_));
                              _loc47_ = _loc36_ == 0 || _loc28_ == 0 ? 0 : li8(_loc25_ + (_loc13_ - _loc31_ - _loc45_));
                              _loc48_ = _loc33_ + _loc46_ - _loc47_;
                              _loc49_ = _loc48_ - _loc33_;
                              if(_loc49_ < 0)
                              {
                                 _loc49_ = -_loc49_;
                              }
                              _loc50_ = _loc48_ - _loc46_;
                              if(_loc50_ < 0)
                              {
                                 _loc50_ = -_loc50_;
                              }
                              _loc51_ = _loc48_ - _loc47_;
                              if(_loc51_ < 0)
                              {
                                 _loc51_ = -_loc51_;
                              }
                              _loc52_ = _loc12_++;
                              _loc33_ = (_loc49_ <= _loc50_ && _loc49_ <= _loc51_ ? _loc33_ : (_loc50_ <= _loc51_ ? _loc46_ : _loc47_)) + li8(_loc24_ + _loc52_) & 0xFF;
                              _loc53_ = _loc13_++;
                              si8(_loc33_,_loc25_ + _loc53_);
                           }
                        }
                        else
                        {
                           _loc34_ = 0;
                           _loc35_ = _loc18_;
                           while(_loc34_ < _loc35_)
                           {
                              _loc36_ = _loc34_++;
                              _loc37_ = 4;
                              _loc38_ = _loc28_ == 0 ? 0 : li8(_loc25_ + (_loc13_ - _loc31_));
                              _loc39_ = _loc36_ == 0 || _loc28_ == 0 ? 0 : li8(_loc25_ + (_loc13_ - _loc31_ - _loc37_));
                              _loc40_ = _loc32_ + _loc38_ - _loc39_;
                              _loc41_ = _loc40_ - _loc32_;
                              if(_loc41_ < 0)
                              {
                                 _loc41_ = -_loc41_;
                              }
                              _loc42_ = _loc40_ - _loc38_;
                              if(_loc42_ < 0)
                              {
                                 _loc42_ = -_loc42_;
                              }
                              _loc43_ = _loc40_ - _loc39_;
                              if(_loc43_ < 0)
                              {
                                 _loc43_ = -_loc43_;
                              }
                              _loc44_ = _loc12_++;
                              _loc32_ = (_loc41_ <= _loc42_ && _loc41_ <= _loc43_ ? _loc32_ : (_loc42_ <= _loc43_ ? _loc38_ : _loc39_)) + li8(_loc24_ + _loc44_) & 0xFF;
                              _loc45_ = _loc13_++;
                              si8(_loc32_,_loc25_ + _loc45_);
                              _loc45_ = _loc13_++;
                              si8(_loc32_,_loc25_ + _loc45_);
                              _loc45_ = _loc13_++;
                              si8(_loc32_,_loc25_ + _loc45_);
                              _loc45_ = _loc13_++;
                              si8(_loc32_ == _loc20_ ? 0 : 255,_loc25_ + _loc45_);
                           }
                        }
                        break;
                     default:
                        throw Exception.thrown("Invalid filter " + _loc30_);
                  }
                  _loc13_ += _loc14_;
               }
               _loc54_ = _loc23_.b;
               _loc54_.position = 0;
               _loc54_.writeBytes(_loc11_.b,_loc22_,int(_loc4_.width) * int(_loc4_.height) * 4);
               break;
            case 1:
               _loc17_ = Boolean(_loc16_.params[0]);
               if(int(_loc4_.colbits) != 8)
               {
                  throw Exception.thrown("Unsupported color mode");
               }
               _loc18_ = int(_loc4_.width);
               _loc19_ = (_loc17_ ? 4 : 3) * _loc18_ + 1;
               if(_loc6_.length < int(_loc4_.height) * _loc19_)
               {
                  throw Exception.thrown("Not enough data");
               }
               _loc21_ = _loc6_.b;
               _loc20_ = int(_loc4_.height) * _loc19_;
               _loc21_.length = _loc20_ + int(_loc4_.width) * int(_loc4_.height) * 4;
               if(_loc21_.length < 1024)
               {
                  _loc21_.length = 1024;
               }
               ApplicationDomain.currentDomain.domainMemory = _loc21_;
               _loc11_ = _loc6_;
               _loc23_ = _loc5_;
               _loc22_ = 0;
               _loc24_ = _loc20_;
               _loc25_ = -1;
               _loc26_ = -1;
               _loc27_ = -1;
               if(!_loc17_)
               {
                  _loc8_ = param1.h;
                  while(_loc8_ != null)
                  {
                     _loc9_ = _loc8_.item;
                     _loc8_ = _loc8_.next;
                     _loc10_ = _loc9_;
                     if(_loc10_.index == 4)
                     {
                        if(_loc10_.params[0] == "tRNS")
                        {
                           _loc55_ = _loc10_.params[1];
                           if(_loc55_.length >= 6)
                           {
                              _loc25_ = int(_loc55_.b[1]);
                              _loc26_ = int(_loc55_.b[3]);
                              _loc27_ = int(_loc55_.b[5]);
                           }
                           break;
                        }
                     }
                  }
               }
               _loc28_ = 0;
               _loc29_ = 0;
               _loc30_ = 0;
               _loc31_ = 0;
               _loc32_ = 0;
               _loc33_ = int(_loc4_.height);
               while(_loc32_ < _loc33_)
               {
                  _loc34_ = _loc32_++;
                  _loc35_ = _loc12_++;
                  _loc36_ = li8(_loc22_ + _loc35_);
                  switch(_loc36_)
                  {
                     case 0:
                        if(_loc17_)
                        {
                           _loc37_ = 0;
                           _loc38_ = _loc18_;
                           while(_loc37_ < _loc38_)
                           {
                              _loc39_ = _loc37_++;
                              _loc40_ = _loc13_++;
                              _loc41_ = li8(_loc22_ + (_loc12_ + 2));
                              si8(_loc41_,_loc24_ + _loc40_);
                              _loc40_ = _loc13_++;
                              _loc41_ = li8(_loc22_ + (_loc12_ + 1));
                              si8(_loc41_,_loc24_ + _loc40_);
                              _loc40_ = _loc13_++;
                              _loc41_ = li8(_loc22_ + _loc12_);
                              si8(_loc41_,_loc24_ + _loc40_);
                              _loc40_ = _loc13_++;
                              _loc41_ = li8(_loc22_ + (_loc12_ + 3));
                              si8(_loc41_,_loc24_ + _loc40_);
                              _loc12_ += 4;
                           }
                        }
                        else
                        {
                           _loc37_ = 0;
                           _loc38_ = _loc18_;
                           while(_loc37_ < _loc38_)
                           {
                              _loc39_ = _loc37_++;
                              _loc40_ = _loc13_++;
                              _loc30_ = li8(_loc22_ + (_loc12_ + 2));
                              _loc41_ = _loc30_;
                              si8(_loc41_,_loc24_ + _loc40_);
                              _loc40_ = _loc13_++;
                              _loc29_ = li8(_loc22_ + (_loc12_ + 1));
                              _loc41_ = _loc29_;
                              si8(_loc41_,_loc24_ + _loc40_);
                              _loc40_ = _loc13_++;
                              _loc28_ = li8(_loc22_ + _loc12_);
                              _loc41_ = _loc28_;
                              si8(_loc41_,_loc24_ + _loc40_);
                              _loc40_ = _loc13_++;
                              si8(((_loc28_ == _loc25_ ? _loc29_ == _loc26_ : false) ? _loc30_ == _loc27_ : false) ? 0 : 255,_loc24_ + _loc40_);
                              _loc12_ += 3;
                           }
                        }
                        break;
                     case 1:
                        _loc31_ = 0;
                        _loc30_ = _loc31_;
                        _loc29_ = _loc30_;
                        _loc28_ = _loc29_;
                        if(_loc17_)
                        {
                           _loc37_ = 0;
                           _loc38_ = _loc18_;
                           while(_loc37_ < _loc38_)
                           {
                              _loc39_ = _loc37_++;
                              _loc30_ += li8(_loc22_ + (_loc12_ + 2));
                              _loc40_ = _loc13_++;
                              si8(_loc30_,_loc24_ + _loc40_);
                              _loc29_ += li8(_loc22_ + (_loc12_ + 1));
                              _loc40_ = _loc13_++;
                              si8(_loc29_,_loc24_ + _loc40_);
                              _loc28_ += li8(_loc22_ + _loc12_);
                              _loc40_ = _loc13_++;
                              si8(_loc28_,_loc24_ + _loc40_);
                              _loc31_ += li8(_loc22_ + (_loc12_ + 3));
                              _loc40_ = _loc13_++;
                              si8(_loc31_,_loc24_ + _loc40_);
                              _loc12_ += 4;
                           }
                        }
                        else
                        {
                           _loc37_ = 0;
                           _loc38_ = _loc18_;
                           while(_loc37_ < _loc38_)
                           {
                              _loc39_ = _loc37_++;
                              _loc30_ += li8(_loc22_ + (_loc12_ + 2));
                              _loc40_ = _loc13_++;
                              si8(_loc30_,_loc24_ + _loc40_);
                              _loc29_ += li8(_loc22_ + (_loc12_ + 1));
                              _loc40_ = _loc13_++;
                              si8(_loc29_,_loc24_ + _loc40_);
                              _loc28_ += li8(_loc22_ + _loc12_);
                              _loc40_ = _loc13_++;
                              si8(_loc28_,_loc24_ + _loc40_);
                              _loc40_ = _loc13_++;
                              si8(((_loc28_ == _loc25_ ? _loc29_ == _loc26_ : false) ? _loc30_ == _loc27_ : false) ? 0 : 255,_loc24_ + _loc40_);
                              _loc12_ += 3;
                           }
                        }
                        break;
                     case 2:
                        _loc37_ = _loc34_ == 0 ? 0 : _loc18_ * 4 * _loc15_;
                        if(_loc17_)
                        {
                           _loc38_ = 0;
                           _loc39_ = _loc18_;
                           while(_loc38_ < _loc39_)
                           {
                              _loc40_ = _loc38_++;
                              _loc41_ = li8(_loc22_ + (_loc12_ + 2)) + li8(_loc24_ + (_loc13_ - _loc37_));
                              si8(_loc41_,_loc24_ + _loc13_);
                              _loc13_++;
                              _loc41_ = li8(_loc22_ + (_loc12_ + 1)) + li8(_loc24_ + (_loc13_ - _loc37_));
                              si8(_loc41_,_loc24_ + _loc13_);
                              _loc13_++;
                              _loc41_ = li8(_loc22_ + _loc12_) + li8(_loc24_ + (_loc13_ - _loc37_));
                              si8(_loc41_,_loc24_ + _loc13_);
                              _loc13_++;
                              _loc41_ = li8(_loc22_ + (_loc12_ + 3)) + li8(_loc24_ + (_loc13_ - _loc37_));
                              si8(_loc41_,_loc24_ + _loc13_);
                              _loc13_++;
                              _loc12_ += 4;
                           }
                        }
                        else
                        {
                           _loc38_ = 0;
                           _loc39_ = _loc18_;
                           while(_loc38_ < _loc39_)
                           {
                              _loc40_ = _loc38_++;
                              _loc30_ = li8(_loc22_ + (_loc12_ + 2)) + li8(_loc24_ + (_loc13_ - _loc37_));
                              _loc41_ = _loc30_;
                              si8(_loc41_,_loc24_ + _loc13_);
                              _loc13_++;
                              _loc29_ = li8(_loc22_ + (_loc12_ + 1)) + li8(_loc24_ + (_loc13_ - _loc37_));
                              _loc41_ = _loc29_;
                              si8(_loc41_,_loc24_ + _loc13_);
                              _loc13_++;
                              _loc28_ = li8(_loc22_ + _loc12_) + li8(_loc24_ + (_loc13_ - _loc37_));
                              _loc41_ = _loc28_;
                              si8(_loc41_,_loc24_ + _loc13_);
                              var _temp_1:* = ++_loc13_;
                              _loc13_++;
                              _loc41_ = _temp_1;
                              si8(((_loc28_ == _loc25_ ? _loc29_ == _loc26_ : false) ? _loc30_ == _loc27_ : false) ? 0 : 255,_loc24_ + _loc41_);
                              _loc12_ += 3;
                           }
                        }
                        break;
                     case 3:
                        _loc31_ = 0;
                        _loc30_ = _loc31_;
                        _loc29_ = _loc30_;
                        _loc28_ = _loc29_;
                        _loc37_ = _loc34_ == 0 ? 0 : _loc18_ * 4 * _loc15_;
                        if(_loc17_)
                        {
                           _loc38_ = 0;
                           _loc39_ = _loc18_;
                           while(_loc38_ < _loc39_)
                           {
                              _loc40_ = _loc38_++;
                              _loc30_ = li8(_loc22_ + (_loc12_ + 2)) + (_loc30_ + li8(_loc24_ + (_loc13_ - _loc37_)) >> 1) & 0xFF;
                              _loc41_ = _loc13_++;
                              si8(_loc30_,_loc24_ + _loc41_);
                              _loc29_ = li8(_loc22_ + (_loc12_ + 1)) + (_loc29_ + li8(_loc24_ + (_loc13_ - _loc37_)) >> 1) & 0xFF;
                              _loc41_ = _loc13_++;
                              si8(_loc29_,_loc24_ + _loc41_);
                              _loc28_ = li8(_loc22_ + _loc12_) + (_loc28_ + li8(_loc24_ + (_loc13_ - _loc37_)) >> 1) & 0xFF;
                              _loc41_ = _loc13_++;
                              si8(_loc28_,_loc24_ + _loc41_);
                              _loc31_ = li8(_loc22_ + (_loc12_ + 3)) + (_loc31_ + li8(_loc24_ + (_loc13_ - _loc37_)) >> 1) & 0xFF;
                              _loc41_ = _loc13_++;
                              si8(_loc31_,_loc24_ + _loc41_);
                              _loc12_ += 4;
                           }
                        }
                        else
                        {
                           _loc38_ = 0;
                           _loc39_ = _loc18_;
                           while(_loc38_ < _loc39_)
                           {
                              _loc40_ = _loc38_++;
                              _loc30_ = li8(_loc22_ + (_loc12_ + 2)) + (_loc30_ + li8(_loc24_ + (_loc13_ - _loc37_)) >> 1) & 0xFF;
                              _loc41_ = _loc13_++;
                              si8(_loc30_,_loc24_ + _loc41_);
                              _loc29_ = li8(_loc22_ + (_loc12_ + 1)) + (_loc29_ + li8(_loc24_ + (_loc13_ - _loc37_)) >> 1) & 0xFF;
                              _loc41_ = _loc13_++;
                              si8(_loc29_,_loc24_ + _loc41_);
                              _loc28_ = li8(_loc22_ + _loc12_) + (_loc28_ + li8(_loc24_ + (_loc13_ - _loc37_)) >> 1) & 0xFF;
                              _loc41_ = _loc13_++;
                              si8(_loc28_,_loc24_ + _loc41_);
                              _loc41_ = _loc13_++;
                              si8(((_loc28_ == _loc25_ ? _loc29_ == _loc26_ : false) ? _loc30_ == _loc27_ : false) ? 0 : 255,_loc24_ + _loc41_);
                              _loc12_ += 3;
                           }
                        }
                        break;
                     case 4:
                        _loc37_ = _loc18_ * 4 * _loc15_;
                        _loc31_ = 0;
                        _loc30_ = _loc31_;
                        _loc29_ = _loc30_;
                        _loc28_ = _loc29_;
                        if(_loc17_)
                        {
                           _loc38_ = 0;
                           _loc39_ = _loc18_;
                           while(_loc38_ < _loc39_)
                           {
                              _loc40_ = _loc38_++;
                              _loc41_ = 4;
                              _loc42_ = _loc34_ == 0 ? 0 : li8(_loc24_ + (_loc13_ - _loc37_));
                              _loc43_ = _loc40_ == 0 || _loc34_ == 0 ? 0 : li8(_loc24_ + (_loc13_ - _loc37_ - _loc41_));
                              _loc44_ = _loc30_ + _loc42_ - _loc43_;
                              _loc45_ = _loc44_ - _loc30_;
                              if(_loc45_ < 0)
                              {
                                 _loc45_ = -_loc45_;
                              }
                              _loc46_ = _loc44_ - _loc42_;
                              if(_loc46_ < 0)
                              {
                                 _loc46_ = -_loc46_;
                              }
                              _loc47_ = _loc44_ - _loc43_;
                              if(_loc47_ < 0)
                              {
                                 _loc47_ = -_loc47_;
                              }
                              _loc30_ = (_loc45_ <= _loc46_ && _loc45_ <= _loc47_ ? _loc30_ : (_loc46_ <= _loc47_ ? _loc42_ : _loc43_)) + li8(_loc22_ + (_loc12_ + 2)) & 0xFF;
                              _loc48_ = _loc13_++;
                              si8(_loc30_,_loc24_ + _loc48_);
                              _loc48_ = 4;
                              _loc49_ = _loc34_ == 0 ? 0 : li8(_loc24_ + (_loc13_ - _loc37_));
                              _loc50_ = _loc40_ == 0 || _loc34_ == 0 ? 0 : li8(_loc24_ + (_loc13_ - _loc37_ - _loc48_));
                              _loc51_ = _loc29_ + _loc49_ - _loc50_;
                              _loc52_ = _loc51_ - _loc29_;
                              if(_loc52_ < 0)
                              {
                                 _loc52_ = -_loc52_;
                              }
                              _loc53_ = _loc51_ - _loc49_;
                              if(_loc53_ < 0)
                              {
                                 _loc53_ = -_loc53_;
                              }
                              _loc56_ = _loc51_ - _loc50_;
                              if(_loc56_ < 0)
                              {
                                 _loc56_ = -_loc56_;
                              }
                              _loc29_ = (_loc52_ <= _loc53_ && _loc52_ <= _loc56_ ? _loc29_ : (_loc53_ <= _loc56_ ? _loc49_ : _loc50_)) + li8(_loc22_ + (_loc12_ + 1)) & 0xFF;
                              _loc57_ = _loc13_++;
                              si8(_loc29_,_loc24_ + _loc57_);
                              _loc57_ = 4;
                              _loc58_ = _loc34_ == 0 ? 0 : li8(_loc24_ + (_loc13_ - _loc37_));
                              _loc59_ = _loc40_ == 0 || _loc34_ == 0 ? 0 : li8(_loc24_ + (_loc13_ - _loc37_ - _loc57_));
                              _loc60_ = _loc28_ + _loc58_ - _loc59_;
                              _loc61_ = _loc60_ - _loc28_;
                              if(_loc61_ < 0)
                              {
                                 _loc61_ = -_loc61_;
                              }
                              _loc62_ = _loc60_ - _loc58_;
                              if(_loc62_ < 0)
                              {
                                 _loc62_ = -_loc62_;
                              }
                              _loc63_ = _loc60_ - _loc59_;
                              if(_loc63_ < 0)
                              {
                                 _loc63_ = -_loc63_;
                              }
                              _loc28_ = (_loc61_ <= _loc62_ && _loc61_ <= _loc63_ ? _loc28_ : (_loc62_ <= _loc63_ ? _loc58_ : _loc59_)) + li8(_loc22_ + _loc12_) & 0xFF;
                              _loc64_ = _loc13_++;
                              si8(_loc28_,_loc24_ + _loc64_);
                              _loc64_ = 4;
                              _loc65_ = _loc34_ == 0 ? 0 : li8(_loc24_ + (_loc13_ - _loc37_));
                              _loc66_ = _loc40_ == 0 || _loc34_ == 0 ? 0 : li8(_loc24_ + (_loc13_ - _loc37_ - _loc64_));
                              _loc67_ = _loc31_ + _loc65_ - _loc66_;
                              _loc68_ = _loc67_ - _loc31_;
                              if(_loc68_ < 0)
                              {
                                 _loc68_ = -_loc68_;
                              }
                              _loc69_ = _loc67_ - _loc65_;
                              if(_loc69_ < 0)
                              {
                                 _loc69_ = -_loc69_;
                              }
                              _loc70_ = _loc67_ - _loc66_;
                              if(_loc70_ < 0)
                              {
                                 _loc70_ = -_loc70_;
                              }
                              _loc31_ = (_loc68_ <= _loc69_ && _loc68_ <= _loc70_ ? _loc31_ : (_loc69_ <= _loc70_ ? _loc65_ : _loc66_)) + li8(_loc22_ + (_loc12_ + 3)) & 0xFF;
                              _loc71_ = _loc13_++;
                              si8(_loc31_,_loc24_ + _loc71_);
                              _loc12_ += 4;
                           }
                        }
                        else
                        {
                           _loc38_ = 0;
                           _loc39_ = _loc18_;
                           while(_loc38_ < _loc39_)
                           {
                              _loc40_ = _loc38_++;
                              _loc41_ = 4;
                              _loc42_ = _loc34_ == 0 ? 0 : li8(_loc24_ + (_loc13_ - _loc37_));
                              _loc43_ = _loc40_ == 0 || _loc34_ == 0 ? 0 : li8(_loc24_ + (_loc13_ - _loc37_ - _loc41_));
                              _loc44_ = _loc30_ + _loc42_ - _loc43_;
                              _loc45_ = _loc44_ - _loc30_;
                              if(_loc45_ < 0)
                              {
                                 _loc45_ = -_loc45_;
                              }
                              _loc46_ = _loc44_ - _loc42_;
                              if(_loc46_ < 0)
                              {
                                 _loc46_ = -_loc46_;
                              }
                              _loc47_ = _loc44_ - _loc43_;
                              if(_loc47_ < 0)
                              {
                                 _loc47_ = -_loc47_;
                              }
                              _loc30_ = (_loc45_ <= _loc46_ && _loc45_ <= _loc47_ ? _loc30_ : (_loc46_ <= _loc47_ ? _loc42_ : _loc43_)) + li8(_loc22_ + (_loc12_ + 2)) & 0xFF;
                              _loc48_ = _loc13_++;
                              si8(_loc30_,_loc24_ + _loc48_);
                              _loc48_ = 4;
                              _loc49_ = _loc34_ == 0 ? 0 : li8(_loc24_ + (_loc13_ - _loc37_));
                              _loc50_ = _loc40_ == 0 || _loc34_ == 0 ? 0 : li8(_loc24_ + (_loc13_ - _loc37_ - _loc48_));
                              _loc51_ = _loc29_ + _loc49_ - _loc50_;
                              _loc52_ = _loc51_ - _loc29_;
                              if(_loc52_ < 0)
                              {
                                 _loc52_ = -_loc52_;
                              }
                              _loc53_ = _loc51_ - _loc49_;
                              if(_loc53_ < 0)
                              {
                                 _loc53_ = -_loc53_;
                              }
                              _loc56_ = _loc51_ - _loc50_;
                              if(_loc56_ < 0)
                              {
                                 _loc56_ = -_loc56_;
                              }
                              _loc29_ = (_loc52_ <= _loc53_ && _loc52_ <= _loc56_ ? _loc29_ : (_loc53_ <= _loc56_ ? _loc49_ : _loc50_)) + li8(_loc22_ + (_loc12_ + 1)) & 0xFF;
                              _loc57_ = _loc13_++;
                              si8(_loc29_,_loc24_ + _loc57_);
                              _loc57_ = 4;
                              _loc58_ = _loc34_ == 0 ? 0 : li8(_loc24_ + (_loc13_ - _loc37_));
                              _loc59_ = _loc40_ == 0 || _loc34_ == 0 ? 0 : li8(_loc24_ + (_loc13_ - _loc37_ - _loc57_));
                              _loc60_ = _loc28_ + _loc58_ - _loc59_;
                              _loc61_ = _loc60_ - _loc28_;
                              if(_loc61_ < 0)
                              {
                                 _loc61_ = -_loc61_;
                              }
                              _loc62_ = _loc60_ - _loc58_;
                              if(_loc62_ < 0)
                              {
                                 _loc62_ = -_loc62_;
                              }
                              _loc63_ = _loc60_ - _loc59_;
                              if(_loc63_ < 0)
                              {
                                 _loc63_ = -_loc63_;
                              }
                              _loc28_ = (_loc61_ <= _loc62_ && _loc61_ <= _loc63_ ? _loc28_ : (_loc62_ <= _loc63_ ? _loc58_ : _loc59_)) + li8(_loc22_ + _loc12_) & 0xFF;
                              _loc64_ = _loc13_++;
                              si8(_loc28_,_loc24_ + _loc64_);
                              _loc64_ = _loc13_++;
                              si8(((_loc28_ == _loc25_ ? _loc29_ == _loc26_ : false) ? _loc30_ == _loc27_ : false) ? 0 : 255,_loc24_ + _loc64_);
                              _loc12_ += 3;
                           }
                        }
                        break;
                     default:
                        throw Exception.thrown("Invalid filter " + _loc36_);
                  }
                  _loc13_ += _loc14_;
               }
               _loc54_ = _loc23_.b;
               _loc54_.position = 0;
               _loc54_.writeBytes(_loc11_.b,_loc20_,int(_loc4_.width) * int(_loc4_.height) * 4);
               break;
            case 2:
               _loc11_ = Tools.getPalette(param1);
               if(_loc11_ == null)
               {
                  throw Exception.thrown("PNG Palette is missing");
               }
               _loc23_ = null;
               _loc8_ = param1.h;
               while(_loc8_ != null)
               {
                  _loc9_ = _loc8_.item;
                  _loc8_ = _loc8_.next;
                  _loc10_ = _loc9_;
                  if(_loc10_.index == 4)
                  {
                     if(_loc10_.params[0] == "tRNS")
                     {
                        _loc55_ = _loc10_.params[1];
                        _loc23_ = _loc55_;
                        break;
                     }
                  }
               }
               if(_loc23_ != null && _loc23_.length < 1 << int(_loc4_.colbits))
               {
                  _loc55_ = Bytes.alloc(1 << int(_loc4_.colbits));
                  _loc55_.blit(0,_loc23_,0,_loc23_.length);
                  _loc55_.fill(_loc23_.length,_loc55_.length - _loc23_.length,255);
                  _loc23_ = _loc55_;
               }
               _loc18_ = int(_loc4_.width);
               _loc19_ = int(Math.ceil(_loc18_ * int(_loc4_.colbits) / 8)) + 1;
               if(_loc6_.length < int(_loc4_.height) * _loc19_)
               {
                  throw Exception.thrown("Not enough data");
               }
               _loc21_ = _loc6_.b;
               _loc20_ = int(_loc4_.height) * _loc19_;
               _loc21_.length = _loc20_ + int(_loc4_.width) * int(_loc4_.height) * 4;
               if(_loc21_.length < 1024)
               {
                  _loc21_.length = 1024;
               }
               ApplicationDomain.currentDomain.domainMemory = _loc21_;
               _loc55_ = _loc6_;
               _loc72_ = _loc5_;
               _loc22_ = 0;
               _loc24_ = _loc20_;
               _loc25_ = _loc19_ - 1;
               _loc26_ = 0;
               _loc27_ = int(_loc4_.height);
               while(_loc26_ < _loc27_)
               {
                  _loc28_ = _loc26_++;
                  _loc29_ = _loc12_++;
                  _loc30_ = li8(_loc22_ + _loc29_);
                  if(_loc30_ == 0)
                  {
                     _loc12_ += _loc25_;
                     continue;
                  }
                  switch(_loc30_)
                  {
                     case 1:
                        _loc31_ = 0;
                        _loc32_ = 0;
                        _loc33_ = _loc18_;
                        while(_loc32_ < _loc33_)
                        {
                           _loc34_ = _loc32_++;
                           _loc35_ = li8(_loc22_ + _loc12_);
                           _loc31_ += _loc35_;
                           _loc36_ = _loc12_++;
                           si8(_loc31_ & 0xFF,_loc22_ + _loc36_);
                        }
                        break;
                     case 2:
                        _loc31_ = _loc28_ == 0 ? 0 : _loc25_ + 1;
                        _loc32_ = 0;
                        _loc33_ = _loc18_;
                        while(_loc32_ < _loc33_)
                        {
                           _loc34_ = _loc32_++;
                           _loc35_ = li8(_loc22_ + _loc12_);
                           _loc36_ = _loc35_ + li8(_loc22_ + (_loc12_ - _loc31_));
                           si8(_loc36_,_loc22_ + _loc12_);
                           _loc12_++;
                        }
                        break;
                     case 3:
                        _loc31_ = 0;
                        _loc32_ = _loc28_ == 0 ? 0 : _loc25_ + 1;
                        _loc33_ = 0;
                        _loc34_ = _loc18_;
                        while(_loc33_ < _loc34_)
                        {
                           _loc35_ = _loc33_++;
                           _loc36_ = li8(_loc22_ + _loc12_);
                           _loc31_ = _loc36_ + (_loc31_ + li8(_loc22_ + (_loc12_ - _loc32_)) >> 1) & 0xFF;
                           _loc37_ = _loc12_++;
                           si8(_loc31_,_loc22_ + _loc37_);
                        }
                        break;
                     case 4:
                        _loc31_ = _loc25_ + 1;
                        _loc32_ = 0;
                        _loc33_ = 0;
                        _loc34_ = _loc18_;
                        while(_loc33_ < _loc34_)
                        {
                           _loc35_ = _loc33_++;
                           _loc36_ = li8(_loc22_ + _loc12_);
                           _loc37_ = _loc28_ == 0 ? 0 : li8(_loc22_ + (_loc12_ - _loc31_));
                           _loc38_ = _loc35_ == 0 || _loc28_ == 0 ? 0 : li8(_loc22_ + (_loc12_ - _loc31_ - 1));
                           _loc39_ = _loc32_ + _loc37_ - _loc38_;
                           _loc40_ = _loc39_ - _loc32_;
                           if(_loc40_ < 0)
                           {
                              _loc40_ = -_loc40_;
                           }
                           _loc41_ = _loc39_ - _loc37_;
                           if(_loc41_ < 0)
                           {
                              _loc41_ = -_loc41_;
                           }
                           _loc42_ = _loc39_ - _loc38_;
                           if(_loc42_ < 0)
                           {
                              _loc42_ = -_loc42_;
                           }
                           _loc32_ = (_loc40_ <= _loc41_ && _loc40_ <= _loc42_ ? _loc32_ : (_loc41_ <= _loc42_ ? _loc37_ : _loc38_)) + _loc36_ & 0xFF;
                           _loc43_ = _loc12_++;
                           si8(_loc32_,_loc22_ + _loc43_);
                        }
                        break;
                     default:
                        throw Exception.thrown("Invalid filter " + _loc30_);
                  }
               }
               _loc26_ = 0;
               if(int(_loc4_.colbits) == 8)
               {
                  _loc27_ = 0;
                  _loc28_ = int(_loc4_.height);
                  while(_loc27_ < _loc28_)
                  {
                     _loc29_ = _loc27_++;
                     _loc26_++;
                     _loc30_ = 0;
                     _loc31_ = int(_loc4_.width);
                     while(_loc30_ < _loc31_)
                     {
                        _loc32_ = _loc30_++;
                        _loc33_ = _loc26_++;
                        _loc34_ = li8(_loc22_ + _loc33_);
                        _loc35_ = _loc13_++;
                        _loc36_ = int(_loc11_.b[_loc34_ * 3 + 2]);
                        si8(_loc36_,_loc24_ + _loc35_);
                        _loc35_ = _loc13_++;
                        _loc36_ = int(_loc11_.b[_loc34_ * 3 + 1]);
                        si8(_loc36_,_loc24_ + _loc35_);
                        _loc35_ = _loc13_++;
                        _loc36_ = int(_loc11_.b[_loc34_ * 3]);
                        si8(_loc36_,_loc24_ + _loc35_);
                        _loc35_ = _loc13_++;
                        _loc36_ = _loc23_ != null ? int(_loc23_.b[_loc34_]) : 255;
                        si8(_loc36_,_loc24_ + _loc35_);
                     }
                     _loc13_ += _loc14_;
                  }
               }
               else
               {
                  if(int(_loc4_.colbits) >= 8)
                  {
                     throw Exception.thrown(int(_loc4_.colbits) + " indexed bits per pixel not supported");
                  }
                  _loc27_ = int(_loc4_.colbits);
                  _loc28_ = (1 << _loc27_) - 1;
                  _loc29_ = 0;
                  _loc30_ = int(_loc4_.height);
                  while(_loc29_ < _loc30_)
                  {
                     _loc31_ = _loc29_++;
                     _loc26_++;
                     _loc32_ = 0;
                     _loc33_ = 0;
                     _loc34_ = 0;
                     _loc35_ = int(_loc4_.width);
                     while(_loc34_ < _loc35_)
                     {
                        _loc36_ = _loc34_++;
                        if(_loc33_ < _loc27_)
                        {
                           _loc37_ = _loc26_++;
                           _loc32_ = _loc32_ << 8 | li8(_loc22_ + _loc37_);
                           _loc33_ += 8;
                        }
                        _loc37_ = _loc32_ >>> _loc33_ - _loc27_ & _loc28_;
                        _loc33_ -= _loc27_;
                        _loc38_ = _loc13_++;
                        _loc39_ = int(_loc11_.b[_loc37_ * 3 + 2]);
                        si8(_loc39_,_loc24_ + _loc38_);
                        _loc38_ = _loc13_++;
                        _loc39_ = int(_loc11_.b[_loc37_ * 3 + 1]);
                        si8(_loc39_,_loc24_ + _loc38_);
                        _loc38_ = _loc13_++;
                        _loc39_ = int(_loc11_.b[_loc37_ * 3]);
                        si8(_loc39_,_loc24_ + _loc38_);
                        _loc38_ = _loc13_++;
                        _loc39_ = _loc23_ != null ? int(_loc23_.b[_loc37_]) : 255;
                        si8(_loc39_,_loc24_ + _loc38_);
                     }
                     _loc13_ += _loc14_;
                  }
               }
               _loc54_ = _loc72_.b;
               _loc54_.position = 0;
               _loc54_.writeBytes(_loc55_.b,_loc20_,int(_loc4_.width) * int(_loc4_.height) * 4);
         }
         return _loc5_;
      }
      
      public static function extract(param1:List, param2:Bytes = undefined, param3:Boolean = false) : Bytes
      {
         var _loc6_:int = 0;
         var _loc8_:Boolean = false;
         var _loc14_:* = null as Chunk;
         var _loc15_:* = null as Chunk;
         var _loc16_:* = null as Bytes;
         var _loc24_:int = 0;
         var _loc25_:int = 0;
         var _loc26_:int = 0;
         var _loc28_:int = 0;
         var _loc29_:int = 0;
         var _loc30_:int = 0;
         var _loc31_:int = 0;
         var _loc32_:int = 0;
         var _loc33_:int = 0;
         var _loc34_:int = 0;
         var _loc35_:int = 0;
         var _loc36_:int = 0;
         var _loc37_:int = 0;
         var _loc38_:int = 0;
         var _loc39_:int = 0;
         var _loc40_:int = 0;
         var _loc41_:int = 0;
         var _loc42_:int = 0;
         var _loc4_:* = Tools.getHeader(param1);
         var _loc5_:Boolean = false;
         var _loc7_:Color = _loc4_.color;
         switch(_loc7_.index)
         {
            case 0:
               _loc8_ = Boolean(_loc7_.params[0]);
               _loc5_ = _loc8_;
               _loc6_ = _loc8_ ? 2 : 1;
               break;
            case 1:
               _loc8_ = Boolean(_loc7_.params[0]);
               _loc5_ = _loc8_;
               _loc6_ = _loc8_ ? 4 : 3;
               break;
            case 2:
               throw Exception.thrown("assert");
         }
         if(param3 && _loc5_)
         {
            param3 = false;
         }
         var _loc9_:int = int(_loc4_.colbits) >> 3;
         var _loc10_:int = param3 ? _loc6_ + 1 : _loc6_;
         if(param2 == null)
         {
            param2 = Bytes.alloc(_loc10_ * _loc9_ * int(_loc4_.width) * int(_loc4_.height));
         }
         var _loc11_:Bytes = null;
         var _loc12_:BytesBuffer = null;
         var _loc13_:ListNode = param1.h;
         while(_loc13_ != null)
         {
            _loc14_ = _loc13_.item;
            _loc13_ = _loc13_.next;
            _loc15_ = _loc14_;
            if(_loc15_.index == 2)
            {
               _loc16_ = _loc15_.params[0];
               if(_loc12_ != null)
               {
                  _loc12_.b.writeBytes(_loc16_.b);
               }
               else if(_loc11_ == null)
               {
                  _loc11_ = _loc16_;
               }
               else
               {
                  _loc12_ = new BytesBuffer();
                  _loc12_.b.writeBytes(_loc11_.b);
                  _loc12_.b.writeBytes(_loc16_.b);
                  _loc11_ = null;
               }
            }
         }
         if(_loc12_ != null)
         {
            _loc11_ = _loc12_.getBytes();
         }
         if(_loc11_ == null)
         {
            throw Exception.thrown("Data not found");
         }
         _loc11_ = Inflate.run(_loc11_);
         var _loc17_:int = 0;
         var _loc18_:int = 0;
         var _loc19_:int = int(_loc4_.width);
         var _loc20_:int = _loc6_ * _loc9_;
         var _loc21_:int = _loc10_ * _loc9_ * _loc19_;
         var _loc22_:int = _loc10_ * _loc9_;
         if(_loc11_.length < int(_loc4_.height) * (_loc20_ * _loc19_ + 1))
         {
            throw Exception.thrown("Not enough data");
         }
         var _loc23_:Array = [];
         _loc24_ = 0;
         _loc25_ = _loc20_;
         while(_loc24_ < _loc25_)
         {
            _loc26_ = _loc24_++;
            _loc23_.push(0);
         }
         var _loc27_:Array = _loc23_;
         _loc24_ = 0;
         _loc25_ = int(_loc4_.height);
         while(_loc24_ < _loc25_)
         {
            _loc26_ = _loc24_++;
            _loc28_ = int(_loc11_.b[_loc17_++]);
            if(_loc28_ != 0 && _loc28_ != 2)
            {
               _loc29_ = 0;
               _loc30_ = _loc20_;
               while(_loc29_ < _loc30_)
               {
                  _loc31_ = _loc29_++;
                  _loc27_[_loc31_] = 0;
               }
            }
            switch(_loc28_)
            {
               case 0:
                  _loc29_ = 0;
                  _loc30_ = _loc19_;
                  while(_loc29_ < _loc30_)
                  {
                     _loc31_ = _loc29_++;
                     _loc32_ = 0;
                     _loc33_ = _loc20_;
                     while(_loc32_ < _loc33_)
                     {
                        _loc34_ = _loc32_++;
                        param2.b[_loc18_++] = int(_loc11_.b[_loc17_++]);
                     }
                     if(param3)
                     {
                        param2.b[_loc18_++] = 255;
                        if(_loc9_ == 2)
                        {
                           param2.b[_loc18_++] = 255;
                        }
                     }
                  }
                  break;
               case 1:
                  _loc29_ = 0;
                  _loc30_ = _loc19_;
                  while(_loc29_ < _loc30_)
                  {
                     _loc31_ = _loc29_++;
                     _loc32_ = 0;
                     _loc33_ = _loc20_;
                     while(_loc32_ < _loc33_)
                     {
                        _loc34_ = _loc32_++;
                        _loc27_[_loc34_] += int(_loc11_.b[_loc17_++]);
                        param2.b[_loc18_++] = int(_loc27_[_loc34_]);
                     }
                     if(param3)
                     {
                        param2.b[_loc18_++] = 255;
                        if(_loc9_ == 2)
                        {
                           param2.b[_loc18_++] = 255;
                        }
                     }
                  }
                  break;
               case 2:
                  _loc29_ = _loc26_ == 0 ? 0 : _loc21_;
                  _loc30_ = 0;
                  _loc31_ = _loc19_;
                  while(_loc30_ < _loc31_)
                  {
                     _loc32_ = _loc30_++;
                     _loc33_ = 0;
                     _loc34_ = _loc20_;
                     while(_loc33_ < _loc34_)
                     {
                        _loc35_ = _loc33_++;
                        _loc36_ = int(_loc11_.b[_loc17_++]) + int(param2.b[_loc18_ - _loc29_]);
                        param2.b[_loc18_++] = _loc36_;
                     }
                     if(param3)
                     {
                        param2.b[_loc18_++] = 255;
                        if(_loc9_ == 2)
                        {
                           param2.b[_loc18_++] = 255;
                        }
                     }
                  }
                  break;
               case 3:
                  _loc29_ = _loc26_ == 0 ? 0 : _loc21_;
                  _loc30_ = 0;
                  _loc31_ = _loc19_;
                  while(_loc30_ < _loc31_)
                  {
                     _loc32_ = _loc30_++;
                     _loc33_ = 0;
                     _loc34_ = _loc20_;
                     while(_loc33_ < _loc34_)
                     {
                        _loc35_ = _loc33_++;
                        _loc27_[_loc35_] = int(_loc11_.b[_loc17_++]) + (int(_loc27_[_loc35_]) + int(param2.b[_loc18_ - _loc29_]) >> 1) & 0xFF;
                        param2.b[_loc18_++] = int(_loc27_[_loc35_]);
                     }
                     if(param3)
                     {
                        param2.b[_loc18_++] = 255;
                        if(_loc9_ == 2)
                        {
                           param2.b[_loc18_++] = 255;
                        }
                     }
                  }
                  break;
               case 4:
                  _loc29_ = 0;
                  _loc30_ = _loc19_;
                  while(_loc29_ < _loc30_)
                  {
                     _loc31_ = _loc29_++;
                     _loc32_ = 0;
                     _loc33_ = _loc20_;
                     while(_loc32_ < _loc33_)
                     {
                        _loc34_ = _loc32_++;
                        _loc35_ = int(_loc27_[_loc34_]);
                        _loc36_ = _loc26_ == 0 ? 0 : int(param2.b[_loc18_ - _loc21_]);
                        _loc37_ = _loc31_ == 0 || _loc26_ == 0 ? 0 : int(param2.b[_loc18_ - _loc21_ - _loc22_]);
                        _loc38_ = _loc35_ + _loc36_ - _loc37_;
                        _loc39_ = _loc38_ - _loc35_;
                        if(_loc39_ < 0)
                        {
                           _loc39_ = -_loc39_;
                        }
                        _loc40_ = _loc38_ - _loc36_;
                        if(_loc40_ < 0)
                        {
                           _loc40_ = -_loc40_;
                        }
                        _loc41_ = _loc38_ - _loc37_;
                        if(_loc41_ < 0)
                        {
                           _loc41_ = -_loc41_;
                        }
                        _loc42_ = _loc17_++;
                        _loc27_[_loc34_] = (_loc39_ <= _loc40_ && _loc39_ <= _loc41_ ? _loc35_ : (_loc40_ <= _loc41_ ? _loc36_ : _loc37_)) + int(_loc11_.b[_loc42_]) & 0xFF;
                        param2.b[_loc18_++] = int(_loc27_[_loc34_]);
                     }
                     if(param3)
                     {
                        param2.b[_loc18_++] = 255;
                        if(_loc9_ == 2)
                        {
                           param2.b[_loc18_++] = 255;
                        }
                     }
                  }
                  break;
               default:
                  throw Exception.thrown("Invalid filter " + _loc28_);
            }
         }
         if(int(_loc4_.colbits) == 16)
         {
            _loc24_ = 0;
            _loc25_ = 0;
            _loc26_ = int(_loc4_.height) * _loc19_ * _loc10_;
            while(_loc25_ < _loc26_)
            {
               _loc28_ = _loc25_++;
               _loc29_ = int(param2.b[_loc24_]);
               _loc30_ = int(param2.b[_loc24_ + 1]);
               param2.b[_loc24_++] = _loc30_;
               param2.b[_loc24_++] = _loc29_;
            }
         }
         return param2;
      }
      
      public static function buildGrey(param1:int, param2:int, param3:Bytes, param4:Object = undefined) : List
      {
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         if(param4 == null)
         {
            param4 = 9;
         }
         var _loc5_:Bytes = Bytes.alloc(param1 * param2 + param2);
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = param2;
         while(_loc8_ < _loc9_)
         {
            _loc10_ = _loc8_++;
            _loc5_.b[_loc6_++] = 0;
            _loc11_ = 0;
            _loc12_ = param1;
            while(_loc11_ < _loc12_)
            {
               _loc13_ = _loc11_++;
               _loc5_.b[_loc6_++] = int(param3.b[_loc7_++]);
            }
         }
         var _loc14_:List = new List();
         _loc14_.add(Chunk.CHeader({
            "width":param1,
            "height":param2,
            "colbits":8,
            "color":Color.ColGrey(false),
            "interlaced":false
         }));
         _loc14_.add(Chunk.CData(Deflate.run(_loc5_,param4)));
         _loc14_.add(Chunk.CEnd);
         return _loc14_;
      }
      
      public static function buildIndexed(param1:int, param2:int, param3:Bytes, param4:Bytes, param5:Object = undefined) : List
      {
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         if(param5 == null)
         {
            param5 = 9;
         }
         var _loc6_:Bytes = Bytes.alloc(param1 * param2 + param2);
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = param2;
         while(_loc9_ < _loc10_)
         {
            _loc11_ = _loc9_++;
            _loc6_.b[_loc7_++] = 0;
            _loc12_ = 0;
            _loc13_ = param1;
            while(_loc12_ < _loc13_)
            {
               _loc14_ = _loc12_++;
               _loc6_.b[_loc7_++] = int(param3.b[_loc8_++]);
            }
         }
         var _loc15_:List = new List();
         _loc15_.add(Chunk.CHeader({
            "width":param1,
            "height":param2,
            "colbits":8,
            "color":Color.ColIndexed,
            "interlaced":false
         }));
         _loc15_.add(Chunk.CPalette(param4));
         _loc15_.add(Chunk.CData(Deflate.run(_loc6_,param5)));
         _loc15_.add(Chunk.CEnd);
         return _loc15_;
      }
      
      public static function buildRGB(param1:int, param2:int, param3:Bytes, param4:Object = undefined) : List
      {
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         if(param4 == null)
         {
            param4 = 9;
         }
         var _loc5_:Bytes = Bytes.alloc(param1 * param2 * 3 + param2);
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = param2;
         while(_loc8_ < _loc9_)
         {
            _loc10_ = _loc8_++;
            _loc5_.b[_loc6_++] = 0;
            _loc11_ = 0;
            _loc12_ = param1;
            while(_loc11_ < _loc12_)
            {
               _loc13_ = _loc11_++;
               _loc5_.b[_loc6_++] = int(param3.b[_loc7_ + 2]);
               _loc5_.b[_loc6_++] = int(param3.b[_loc7_ + 1]);
               _loc5_.b[_loc6_++] = int(param3.b[_loc7_]);
               _loc7_ += 3;
            }
         }
         var _loc14_:List = new List();
         _loc14_.add(Chunk.CHeader({
            "width":param1,
            "height":param2,
            "colbits":8,
            "color":Color.ColTrue(false),
            "interlaced":false
         }));
         _loc14_.add(Chunk.CData(Deflate.run(_loc5_,param4)));
         _loc14_.add(Chunk.CEnd);
         return _loc14_;
      }
      
      public static function build32ARGB(param1:int, param2:int, param3:Bytes, param4:Object = undefined) : List
      {
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         if(param4 == null)
         {
            param4 = 9;
         }
         var _loc5_:Bytes = Bytes.alloc(param1 * param2 * 4 + param2);
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = param2;
         while(_loc8_ < _loc9_)
         {
            _loc10_ = _loc8_++;
            _loc5_.b[_loc6_++] = 0;
            _loc11_ = 0;
            _loc12_ = param1;
            while(_loc11_ < _loc12_)
            {
               _loc13_ = _loc11_++;
               _loc5_.b[_loc6_++] = int(param3.b[_loc7_ + 1]);
               _loc5_.b[_loc6_++] = int(param3.b[_loc7_ + 2]);
               _loc5_.b[_loc6_++] = int(param3.b[_loc7_ + 3]);
               _loc5_.b[_loc6_++] = int(param3.b[_loc7_]);
               _loc7_ += 4;
            }
         }
         var _loc14_:List = new List();
         _loc14_.add(Chunk.CHeader({
            "width":param1,
            "height":param2,
            "colbits":8,
            "color":Color.ColTrue(true),
            "interlaced":false
         }));
         _loc14_.add(Chunk.CData(Deflate.run(_loc5_,param4)));
         _loc14_.add(Chunk.CEnd);
         return _loc14_;
      }
      
      public static function build32BGRA(param1:int, param2:int, param3:Bytes, param4:Object = undefined) : List
      {
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         if(param4 == null)
         {
            param4 = 9;
         }
         var _loc5_:Bytes = Bytes.alloc(param1 * param2 * 4 + param2);
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = param2;
         while(_loc8_ < _loc9_)
         {
            _loc10_ = _loc8_++;
            _loc5_.b[_loc6_++] = 0;
            _loc11_ = 0;
            _loc12_ = param1;
            while(_loc11_ < _loc12_)
            {
               _loc13_ = _loc11_++;
               _loc5_.b[_loc6_++] = int(param3.b[_loc7_ + 2]);
               _loc5_.b[_loc6_++] = int(param3.b[_loc7_ + 1]);
               _loc5_.b[_loc6_++] = int(param3.b[_loc7_]);
               _loc5_.b[_loc6_++] = int(param3.b[_loc7_ + 3]);
               _loc7_ += 4;
            }
         }
         var _loc14_:List = new List();
         _loc14_.add(Chunk.CHeader({
            "width":param1,
            "height":param2,
            "colbits":8,
            "color":Color.ColTrue(true),
            "interlaced":false
         }));
         _loc14_.add(Chunk.CData(Deflate.run(_loc5_,param4)));
         _loc14_.add(Chunk.CEnd);
         return _loc14_;
      }
   }
}

