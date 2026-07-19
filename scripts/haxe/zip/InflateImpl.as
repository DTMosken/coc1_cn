package haxe.zip
{
   import flash.Boot;
   import haxe.Exception;
   import haxe.crypto.Adler32;
   import haxe.io.Bytes;
   import haxe.io.Input;
   import haxe.zip._InflateImpl.State;
   import haxe.zip._InflateImpl.Window;
   
   public class InflateImpl
   {
      
      public static var LEN_EXTRA_BITS_TBL:Array = [0,0,0,0,0,0,0,0,1,1,1,1,2,2,2,2,3,3,3,3,4,4,4,4,5,5,5,5,0,-1,-1];
      
      public static var LEN_BASE_VAL_TBL:Array = [3,4,5,6,7,8,9,10,11,13,15,17,19,23,27,31,35,43,51,59,67,83,99,115,131,163,195,227,258];
      
      public static var DIST_EXTRA_BITS_TBL:Array = [0,0,0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7,8,8,9,9,10,10,11,11,12,12,13,13,-1,-1];
      
      public static var DIST_BASE_VAL_TBL:Array = [1,2,3,4,5,7,9,13,17,25,33,49,65,97,129,193,257,385,513,769,1025,1537,2049,3073,4097,6145,8193,12289,16385,24577];
      
      public static var CODE_LENGTHS_POS:Array = [16,17,18,0,8,7,9,6,10,5,11,4,12,3,13,2,14,1,15];
      
      public static var FIXED_HUFFMAN:Huffman = null;
      
      public var window:Window;
      
      public var state:State;
      
      public var output:Bytes;
      
      public var outpos:int;
      
      public var needed:int;
      
      public var nbits:int;
      
      public var lengths:Array;
      
      public var len:int;
      
      public var isFinal:Boolean;
      
      public var input:Input;
      
      public var huffman:Huffman;
      
      public var huffdist:Huffman;
      
      public var htools:HuffTools;
      
      public var dist:int;
      
      public var bits:int;
      
      public function InflateImpl(param1:Input = undefined, param2:Object = undefined, param3:Object = undefined)
      {
         if(param2 == null)
         {
            param2 = true;
         }
         if(param3 == null)
         {
            param3 = true;
         }
         if(Boot.skip_constructor)
         {
            return;
         }
         isFinal = false;
         htools = new HuffTools();
         huffman = buildFixedHuffman();
         huffdist = null;
         len = 0;
         dist = 0;
         state = param2 ? State.Head : State.Block;
         input = param1;
         bits = 0;
         nbits = 0;
         needed = 0;
         output = null;
         outpos = 0;
         lengths = [];
         lengths.push(-1);
         lengths.push(-1);
         lengths.push(-1);
         lengths.push(-1);
         lengths.push(-1);
         lengths.push(-1);
         lengths.push(-1);
         lengths.push(-1);
         lengths.push(-1);
         lengths.push(-1);
         lengths.push(-1);
         lengths.push(-1);
         lengths.push(-1);
         lengths.push(-1);
         lengths.push(-1);
         lengths.push(-1);
         lengths.push(-1);
         lengths.push(-1);
         lengths.push(-1);
         window = new Window(param3);
      }
      
      public function resetBits() : void
      {
         bits = 0;
         nbits = 0;
      }
      
      public function readBytes(param1:Bytes, param2:int, param3:int) : int
      {
         needed = param3;
         outpos = param2;
         output = param1;
         if(param3 > 0)
         {
            while(inflateLoop())
            {
            }
         }
         return param3 - needed;
      }
      
      public function inflateLoop() : Boolean
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:Boolean = false;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:* = null as Array;
         var _loc9_:* = null as Bytes;
         var _loc10_:* = null as Adler32;
         var _loc11_:* = null as Adler32;
         switch(state.index)
         {
            case 0:
               _loc1_ = input.readByte();
               _loc2_ = _loc1_ & 0x0F;
               _loc3_ = _loc1_ >> 4;
               if(_loc2_ != 8)
               {
                  throw Exception.thrown("Invalid data");
               }
               _loc4_ = input.readByte();
               _loc5_ = (_loc4_ & 0x20) != 0;
               if(int(((_loc1_ << 8) + _loc4_) % 31) != 0)
               {
                  throw Exception.thrown("Invalid data");
               }
               if(_loc5_)
               {
                  throw Exception.thrown("Unsupported dictionary");
               }
               state = State.Block;
               return true;
               break;
            case 1:
               isFinal = getBit();
               switch(getBits(2))
               {
                  case 0:
                     len = input.readUInt16();
                     _loc1_ = input.readUInt16();
                     if(_loc1_ != 65535 - len)
                     {
                        throw Exception.thrown("Invalid data");
                     }
                     state = State.Flat;
                     _loc5_ = inflateLoop();
                     resetBits();
                     return _loc5_;
                     break;
                  case 1:
                     huffman = buildFixedHuffman();
                     huffdist = null;
                     state = State.CData;
                     return true;
                  case 2:
                     _loc1_ = getBits(5) + 257;
                     _loc2_ = getBits(5) + 1;
                     _loc3_ = getBits(4) + 4;
                     _loc4_ = 0;
                     _loc6_ = _loc3_;
                     while(_loc4_ < _loc6_)
                     {
                        _loc7_ = _loc4_++;
                        lengths[int(InflateImpl.CODE_LENGTHS_POS[_loc7_])] = getBits(3);
                     }
                     _loc4_ = _loc3_;
                     _loc6_ = 19;
                     while(_loc4_ < _loc6_)
                     {
                        _loc7_ = _loc4_++;
                        lengths[int(InflateImpl.CODE_LENGTHS_POS[_loc7_])] = 0;
                     }
                     huffman = htools.make(lengths,0,19,8);
                     _loc8_ = [];
                     _loc4_ = 0;
                     _loc6_ = _loc1_ + _loc2_;
                     while(_loc4_ < _loc6_)
                     {
                        _loc7_ = _loc4_++;
                        _loc8_.push(0);
                     }
                     inflateLengths(_loc8_,_loc1_ + _loc2_);
                     huffdist = htools.make(_loc8_,_loc1_,_loc2_,16);
                     huffman = htools.make(_loc8_,0,_loc1_,16);
                     state = State.CData;
                     return true;
                  default:
                     throw Exception.thrown("Invalid data");
               }
               break;
            case 2:
               _loc1_ = applyHuffman(huffman);
               if(_loc1_ < 256)
               {
                  addByte(_loc1_);
                  return needed > 0;
               }
               if(_loc1_ == 256)
               {
                  state = isFinal ? State.Crc : State.Block;
                  return true;
               }
               _loc1_ -= 257;
               _loc2_ = int(InflateImpl.LEN_EXTRA_BITS_TBL[_loc1_]);
               if(_loc2_ == -1)
               {
                  throw Exception.thrown("Invalid data");
               }
               len = int(InflateImpl.LEN_BASE_VAL_TBL[_loc1_]) + getBits(_loc2_);
               _loc3_ = huffdist == null ? getRevBits(5) : applyHuffman(huffdist);
               _loc2_ = int(InflateImpl.DIST_EXTRA_BITS_TBL[_loc3_]);
               if(_loc2_ == -1)
               {
                  throw Exception.thrown("Invalid data");
               }
               dist = int(InflateImpl.DIST_BASE_VAL_TBL[_loc3_]) + getBits(_loc2_);
               if(dist > window.available())
               {
                  throw Exception.thrown("Invalid data");
               }
               state = dist == 1 ? State.DistOne : State.Dist;
               return true;
               break;
            case 3:
               _loc1_ = len < needed ? len : needed;
               _loc9_ = input.read(_loc1_);
               len -= _loc1_;
               addBytes(_loc9_,0,_loc1_);
               if(len == 0)
               {
                  state = isFinal ? State.Crc : State.Block;
               }
               return needed > 0;
            case 4:
               _loc10_ = window.checksum();
               if(_loc10_ == null)
               {
                  state = State.Done;
                  return true;
               }
               _loc11_ = Adler32.read(input);
               if(!_loc10_.equals(_loc11_))
               {
                  throw Exception.thrown("Invalid CRC");
               }
               state = State.Done;
               return true;
               break;
            case 5:
               while(len > 0 && needed > 0)
               {
                  _loc1_ = len < dist ? len : dist;
                  _loc2_ = needed < _loc1_ ? needed : _loc1_;
                  addDist(dist,_loc2_);
                  len -= _loc2_;
               }
               if(len == 0)
               {
                  state = State.CData;
               }
               return needed > 0;
            case 6:
               _loc1_ = len < needed ? len : needed;
               addDistOne(_loc1_);
               len -= _loc1_;
               if(len == 0)
               {
                  state = State.CData;
               }
               return needed > 0;
            case 7:
               return false;
            default:
               return;
         }
      }
      
      public function inflateLengths(param1:Array, param2:int) : void
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         while(_loc3_ < param2)
         {
            _loc5_ = applyHuffman(huffman);
            switch(_loc5_)
            {
               case 0:
               case 1:
               case 2:
               case 3:
               case 4:
               case 5:
               case 6:
               case 7:
               case 8:
               case 9:
               case 10:
               case 11:
               case 12:
               case 13:
               case 14:
               case 15:
                  _loc4_ = _loc5_;
                  param1[_loc3_] = _loc5_;
                  _loc3_++;
                  break;
               case 16:
                  _loc6_ = _loc3_ + 3 + getBits(2);
                  if(_loc6_ > param2)
                  {
                     throw Exception.thrown("Invalid data");
                  }
                  while(_loc3_ < _loc6_)
                  {
                     param1[_loc3_] = _loc4_;
                     _loc3_++;
                  }
                  break;
               case 17:
                  _loc3_ += 3 + getBits(3);
                  if(_loc3_ > param2)
                  {
                     throw Exception.thrown("Invalid data");
                  }
                  break;
               case 18:
                  _loc3_ += 11 + getBits(7);
                  if(_loc3_ > param2)
                  {
                     throw Exception.thrown("Invalid data");
                  }
                  break;
               default:
                  throw Exception.thrown("Invalid data");
            }
         }
      }
      
      public function getRevBits(param1:int) : int
      {
         if(param1 == 0)
         {
            return 0;
         }
         if(getBit())
         {
            return 1 << param1 - 1 | getRevBits(param1 - 1);
         }
         return getRevBits(param1 - 1);
      }
      
      public function getBits(param1:int) : int
      {
         while(nbits < param1)
         {
            bits |= input.readByte() << nbits;
            nbits += 8;
         }
         var _loc2_:int = bits & (1 << param1) - 1;
         nbits -= param1;
         bits >>= param1;
         return _loc2_;
      }
      
      public function getBit() : Boolean
      {
         if(nbits == 0)
         {
            nbits = 8;
            bits = input.readByte();
         }
         var _loc1_:Boolean = (bits & 1) == 1;
         --nbits;
         bits >>= 1;
         return _loc1_;
      }
      
      public function buildFixedHuffman() : Huffman
      {
         var _loc3_:int = 0;
         if(InflateImpl.FIXED_HUFFMAN != null)
         {
            return InflateImpl.FIXED_HUFFMAN;
         }
         var _loc1_:Array = [];
         var _loc2_:int = 0;
         while(_loc2_ < 288)
         {
            _loc3_ = _loc2_++;
            _loc1_.push(_loc3_ <= 143 ? 8 : (_loc3_ <= 255 ? 9 : (_loc3_ <= 279 ? 7 : 8)));
         }
         InflateImpl.FIXED_HUFFMAN = htools.make(_loc1_,0,288,10);
         return InflateImpl.FIXED_HUFFMAN;
      }
      
      public function applyHuffman(param1:Huffman) : int
      {
         var _loc2_:int = 0;
         var _loc3_:* = null as Huffman;
         var _loc4_:* = null as Huffman;
         var _loc5_:* = null as Array;
         switch(param1.index)
         {
            case 0:
               return int(param1.params[0]);
            case 1:
               _loc3_ = param1.params[0];
               _loc4_ = param1.params[1];
               return applyHuffman(getBit() ? _loc4_ : _loc3_);
            case 2:
               _loc2_ = int(param1.params[0]);
               _loc5_ = param1.params[1];
               return applyHuffman(_loc5_[getBits(_loc2_)]);
            default:
               return;
         }
      }
      
      public function addDistOne(param1:int) : void
      {
         var _loc5_:int = 0;
         var _loc2_:int = window.getLastChar();
         var _loc3_:int = 0;
         var _loc4_:int = param1;
         while(_loc3_ < _loc4_)
         {
            _loc5_ = _loc3_++;
            addByte(_loc2_);
         }
      }
      
      public function addDist(param1:int, param2:int) : void
      {
         addBytes(window.buffer,window.pos - param1,param2);
      }
      
      public function addBytes(param1:Bytes, param2:int, param3:int) : void
      {
         window.addBytes(param1,param2,param3);
         output.blit(outpos,param1,param2,param3);
         needed -= param3;
         outpos += param3;
      }
      
      public function addByte(param1:int) : void
      {
         window.addByte(param1);
         output.b[outpos] = param1;
         --needed;
         ++outpos;
      }
   }
}

