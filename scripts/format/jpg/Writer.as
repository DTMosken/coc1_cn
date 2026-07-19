package format.jpg
{
   import flash.Boot;
   import format.jpg._Writer.BitString;
   import haxe.IMap;
   import haxe.ds.IntMap;
   import haxe.io.Bytes;
   import haxe.io.BytesBuffer;
   import haxe.io.Output;
   
   public class Writer
   {
      
      public var std_dc_luminance_values:Bytes;
      
      public var std_dc_luminance_nrcodes:Array;
      
      public var std_dc_chrominance_values:Bytes;
      
      public var std_dc_chrominance_nrcodes:Array;
      
      public var std_ac_luminance_values:Bytes;
      
      public var std_ac_luminance_nrcodes:Array;
      
      public var std_ac_chrominance_values:Bytes;
      
      public var std_ac_chrominance_nrcodes:Array;
      
      public var fdtbl_Y:Array;
      
      public var fdtbl_UV:Array;
      
      public var category:IMap;
      
      public var bytepos:int;
      
      public var byteout:Output;
      
      public var bytenew:int;
      
      public var bitcode:IMap;
      
      public var ZigZag:Array;
      
      public var YTable:Array;
      
      public var YDU:Array;
      
      public var YDC_HT:IMap;
      
      public var YAC_HT:IMap;
      
      public var VDU:Array;
      
      public var UVTable:Array;
      
      public var UVDC_HT:IMap;
      
      public var UVAC_HT:IMap;
      
      public var UDU:Array;
      
      public var DU:Array;
      
      public function Writer(param1:Output = undefined)
      {
         var _loc3_:int = 0;
         if(Boot.skip_constructor)
         {
            return;
         }
         YTable = [];
         UVTable = [];
         fdtbl_Y = [];
         fdtbl_UV = [];
         var _loc2_:int = 0;
         while(_loc2_ < 64)
         {
            _loc3_ = _loc2_++;
            YTable.push(0);
            UVTable.push(0);
            fdtbl_Y.push(0);
            fdtbl_UV.push(0);
         }
         bitcode = new IntMap();
         category = new IntMap();
         byteout = param1;
         bytenew = 0;
         bytepos = 7;
         YDC_HT = new IntMap();
         UVDC_HT = new IntMap();
         YAC_HT = new IntMap();
         UVAC_HT = new IntMap();
         YDU = [];
         UDU = [];
         VDU = [];
         DU = [];
         _loc2_ = 0;
         while(_loc2_ < 64)
         {
            _loc3_ = _loc2_++;
            YDU.push(0);
            UDU.push(0);
            VDU.push(0);
            DU.push(0);
         }
         initZigZag();
         initLuminance();
         initChrominance();
         initHuffmanTbl();
         initCategoryNumber();
      }
      
      public function writeWord(param1:int) : void
      {
         byteout.writeByte(param1 >> 8 & 0xFF);
         byteout.writeByte(param1 & 0xFF);
      }
      
      public function writeSOS() : void
      {
         byteout.writeByte(255);
         byteout.writeByte(218);
         byteout.writeByte(0);
         byteout.writeByte(12);
         byteout.writeByte(3);
         byteout.writeByte(1);
         byteout.writeByte(0);
         byteout.writeByte(2);
         byteout.writeByte(17);
         byteout.writeByte(3);
         byteout.writeByte(17);
         byteout.writeByte(0);
         byteout.writeByte(63);
         byteout.writeByte(0);
      }
      
      public function writeSOF0(param1:int, param2:int) : void
      {
         byteout.writeByte(255);
         byteout.writeByte(192);
         byteout.writeByte(0);
         byteout.writeByte(17);
         byteout.writeByte(8);
         byteout.writeByte(param2 >> 8 & 0xFF);
         byteout.writeByte(param2 & 0xFF);
         byteout.writeByte(param1 >> 8 & 0xFF);
         byteout.writeByte(param1 & 0xFF);
         byteout.writeByte(3);
         byteout.writeByte(1);
         byteout.writeByte(17);
         byteout.writeByte(0);
         byteout.writeByte(2);
         byteout.writeByte(17);
         byteout.writeByte(1);
         byteout.writeByte(3);
         byteout.writeByte(17);
         byteout.writeByte(1);
      }
      
      public function writeDQT() : void
      {
         var _loc2_:int = 0;
         byteout.writeByte(255);
         byteout.writeByte(219);
         byteout.writeByte(0);
         byteout.writeByte(132);
         byteout.writeByte(0);
         var _loc1_:int = 0;
         while(_loc1_ < 64)
         {
            _loc2_ = _loc1_++;
            byteout.writeByte(int(YTable[_loc2_]));
         }
         byteout.writeByte(1);
         _loc1_ = 0;
         while(_loc1_ < 64)
         {
            _loc2_ = _loc1_++;
            byteout.writeByte(int(UVTable[_loc2_]));
         }
      }
      
      public function writeDHT() : void
      {
         byteout.writeByte(255);
         byteout.writeByte(196);
         byteout.writeByte(1);
         byteout.writeByte(162);
         byteout.writeByte(0);
         byteout.writeByte(int(std_dc_luminance_nrcodes[1]));
         byteout.writeByte(int(std_dc_luminance_nrcodes[2]));
         byteout.writeByte(int(std_dc_luminance_nrcodes[3]));
         byteout.writeByte(int(std_dc_luminance_nrcodes[4]));
         byteout.writeByte(int(std_dc_luminance_nrcodes[5]));
         byteout.writeByte(int(std_dc_luminance_nrcodes[6]));
         byteout.writeByte(int(std_dc_luminance_nrcodes[7]));
         byteout.writeByte(int(std_dc_luminance_nrcodes[8]));
         byteout.writeByte(int(std_dc_luminance_nrcodes[9]));
         byteout.writeByte(int(std_dc_luminance_nrcodes[10]));
         byteout.writeByte(int(std_dc_luminance_nrcodes[11]));
         byteout.writeByte(int(std_dc_luminance_nrcodes[12]));
         byteout.writeByte(int(std_dc_luminance_nrcodes[13]));
         byteout.writeByte(int(std_dc_luminance_nrcodes[14]));
         byteout.writeByte(int(std_dc_luminance_nrcodes[15]));
         byteout.writeByte(int(std_dc_luminance_nrcodes[16]));
         byteout.write(std_dc_luminance_values);
         byteout.writeByte(16);
         byteout.writeByte(int(std_ac_luminance_nrcodes[1]));
         byteout.writeByte(int(std_ac_luminance_nrcodes[2]));
         byteout.writeByte(int(std_ac_luminance_nrcodes[3]));
         byteout.writeByte(int(std_ac_luminance_nrcodes[4]));
         byteout.writeByte(int(std_ac_luminance_nrcodes[5]));
         byteout.writeByte(int(std_ac_luminance_nrcodes[6]));
         byteout.writeByte(int(std_ac_luminance_nrcodes[7]));
         byteout.writeByte(int(std_ac_luminance_nrcodes[8]));
         byteout.writeByte(int(std_ac_luminance_nrcodes[9]));
         byteout.writeByte(int(std_ac_luminance_nrcodes[10]));
         byteout.writeByte(int(std_ac_luminance_nrcodes[11]));
         byteout.writeByte(int(std_ac_luminance_nrcodes[12]));
         byteout.writeByte(int(std_ac_luminance_nrcodes[13]));
         byteout.writeByte(int(std_ac_luminance_nrcodes[14]));
         byteout.writeByte(int(std_ac_luminance_nrcodes[15]));
         byteout.writeByte(int(std_ac_luminance_nrcodes[16]));
         byteout.write(std_ac_luminance_values);
         byteout.writeByte(1);
         byteout.writeByte(int(std_dc_chrominance_nrcodes[1]));
         byteout.writeByte(int(std_dc_chrominance_nrcodes[2]));
         byteout.writeByte(int(std_dc_chrominance_nrcodes[3]));
         byteout.writeByte(int(std_dc_chrominance_nrcodes[4]));
         byteout.writeByte(int(std_dc_chrominance_nrcodes[5]));
         byteout.writeByte(int(std_dc_chrominance_nrcodes[6]));
         byteout.writeByte(int(std_dc_chrominance_nrcodes[7]));
         byteout.writeByte(int(std_dc_chrominance_nrcodes[8]));
         byteout.writeByte(int(std_dc_chrominance_nrcodes[9]));
         byteout.writeByte(int(std_dc_chrominance_nrcodes[10]));
         byteout.writeByte(int(std_dc_chrominance_nrcodes[11]));
         byteout.writeByte(int(std_dc_chrominance_nrcodes[12]));
         byteout.writeByte(int(std_dc_chrominance_nrcodes[13]));
         byteout.writeByte(int(std_dc_chrominance_nrcodes[14]));
         byteout.writeByte(int(std_dc_chrominance_nrcodes[15]));
         byteout.writeByte(int(std_dc_chrominance_nrcodes[16]));
         byteout.write(std_dc_chrominance_values);
         byteout.writeByte(17);
         byteout.writeByte(int(std_ac_chrominance_nrcodes[1]));
         byteout.writeByte(int(std_ac_chrominance_nrcodes[2]));
         byteout.writeByte(int(std_ac_chrominance_nrcodes[3]));
         byteout.writeByte(int(std_ac_chrominance_nrcodes[4]));
         byteout.writeByte(int(std_ac_chrominance_nrcodes[5]));
         byteout.writeByte(int(std_ac_chrominance_nrcodes[6]));
         byteout.writeByte(int(std_ac_chrominance_nrcodes[7]));
         byteout.writeByte(int(std_ac_chrominance_nrcodes[8]));
         byteout.writeByte(int(std_ac_chrominance_nrcodes[9]));
         byteout.writeByte(int(std_ac_chrominance_nrcodes[10]));
         byteout.writeByte(int(std_ac_chrominance_nrcodes[11]));
         byteout.writeByte(int(std_ac_chrominance_nrcodes[12]));
         byteout.writeByte(int(std_ac_chrominance_nrcodes[13]));
         byteout.writeByte(int(std_ac_chrominance_nrcodes[14]));
         byteout.writeByte(int(std_ac_chrominance_nrcodes[15]));
         byteout.writeByte(int(std_ac_chrominance_nrcodes[16]));
         byteout.write(std_ac_chrominance_values);
      }
      
      public function writeBits(param1:BitString) : void
      {
         var _loc2_:int = param1.val;
         var _loc3_:int = param1.len - 1;
         while(_loc3_ >= 0)
         {
            if((_loc2_ & 1 << _loc3_) != 0)
            {
               bytenew |= 1 << bytepos;
            }
            _loc3_--;
            --bytepos;
            if(bytepos < 0)
            {
               if(bytenew == 255)
               {
                  byteout.writeByte(255);
                  byteout.writeByte(0);
               }
               else
               {
                  byteout.writeByte(bytenew);
               }
               bytepos = 7;
               bytenew = 0;
            }
         }
      }
      
      public function writeAPP0() : void
      {
         byteout.writeByte(255);
         byteout.writeByte(224);
         byteout.writeByte(0);
         byteout.writeByte(16);
         byteout.writeByte(74);
         byteout.writeByte(70);
         byteout.writeByte(73);
         byteout.writeByte(70);
         byteout.writeByte(0);
         byteout.writeByte(1);
         byteout.writeByte(1);
         byteout.writeByte(0);
         byteout.writeByte(0);
         byteout.writeByte(1);
         byteout.writeByte(0);
         byteout.writeByte(1);
         byteout.writeByte(0);
         byteout.writeByte(0);
      }
      
      public function write(param1:Object) : void
      {
         var _loc10_:int = 0;
         var _loc11_:* = null as BitString;
         var _loc2_:Number = Number(param1.quality);
         if(_loc2_ <= 0)
         {
            _loc2_ = 1;
         }
         if(_loc2_ > 100)
         {
            _loc2_ = 100;
         }
         var _loc3_:int = _loc2_ < 50 ? int(5000 / _loc2_) : int(200 - _loc2_ * 2);
         initQuantTables(_loc3_);
         bytenew = 0;
         bytepos = 7;
         var _loc4_:int = int(param1.width);
         var _loc5_:int = int(param1.height);
         writeWord(65496);
         writeAPP0();
         writeDQT();
         writeSOF0(_loc4_,_loc5_);
         writeDHT();
         writeSOS();
         var _loc6_:Number = 0;
         var _loc7_:Number = 0;
         var _loc8_:Number = 0;
         bytenew = 0;
         bytepos = 7;
         var _loc9_:int = 0;
         while(_loc9_ < _loc5_)
         {
            _loc10_ = 0;
            while(_loc10_ < _loc4_)
            {
               RGB2YUV(param1.pixels,_loc4_,_loc10_,_loc9_);
               _loc6_ = processDU(YDU,fdtbl_Y,_loc6_,YDC_HT,YAC_HT);
               _loc7_ = processDU(UDU,fdtbl_UV,_loc7_,UVDC_HT,UVAC_HT);
               _loc8_ = processDU(VDU,fdtbl_UV,_loc8_,UVDC_HT,UVAC_HT);
               _loc10_ += 8;
            }
            _loc9_ += 8;
         }
         if(bytepos >= 0)
         {
            _loc11_ = new BitString(bytepos + 1,(1 << bytepos + 1) - 1);
            writeBits(_loc11_);
         }
         writeWord(65497);
      }
      
      public function strIntsToBytes(param1:String) : Bytes
      {
         var _loc8_:int = 0;
         var _loc2_:int = param1.length;
         var _loc3_:BytesBuffer = new BytesBuffer();
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = _loc2_;
         while(_loc6_ < _loc7_)
         {
            _loc8_ = _loc6_++;
            if(param1.charAt(_loc8_) == ",")
            {
               _loc4_ = int(Std.parseInt(param1.substr(_loc5_,_loc8_ - _loc5_)));
               _loc3_.b.writeByte(_loc4_);
               _loc5_ = _loc8_ + 1;
            }
         }
         if(_loc5_ < _loc2_)
         {
            _loc4_ = int(Std.parseInt(param1.substr(_loc5_)));
            _loc3_.b.writeByte(_loc4_);
         }
         return _loc3_.getBytes();
      }
      
      public function processDU(param1:Array, param2:Array, param3:Number, param4:IMap, param5:IMap) : Number
      {
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc15_:int = 0;
         var _loc16_:int = 0;
         var _loc17_:int = 0;
         var _loc6_:BitString = param5.h[0];
         var _loc7_:BitString = param5.h[240];
         var _loc8_:Array = fDCTQuant(param1,param2);
         _loc9_ = 0;
         while(_loc9_ < 64)
         {
            _loc10_ = _loc9_++;
            DU[int(ZigZag[_loc10_])] = Number(_loc8_[_loc10_]);
         }
         _loc10_ = int(Number(DU[0]) - param3);
         param3 = Number(DU[0]);
         if(_loc10_ == 0)
         {
            writeBits(param4.h[0]);
         }
         else
         {
            _loc9_ = 32767 + _loc10_;
            writeBits(param4.h[int(category.h[_loc9_])]);
            writeBits(bitcode.h[_loc9_]);
         }
         var _loc11_:int = 63;
         while(_loc11_ > 0 && Number(DU[_loc11_]) == 0)
         {
            _loc11_--;
         }
         if(_loc11_ == 0)
         {
            writeBits(_loc6_);
            return param3;
         }
         var _loc12_:int = 1;
         while(_loc12_ <= _loc11_)
         {
            _loc13_ = _loc12_;
            while(Number(DU[_loc12_]) == 0 && _loc12_ <= _loc11_)
            {
               _loc12_++;
            }
            _loc14_ = _loc12_ - _loc13_;
            if(_loc14_ >= 16)
            {
               _loc15_ = 0;
               _loc16_ = _loc14_ >> 4;
               while(_loc15_ < _loc16_)
               {
                  _loc17_ = _loc15_++;
                  writeBits(_loc7_);
               }
               _loc14_ &= 15;
            }
            _loc9_ = 32767 + int(Number(DU[_loc12_]));
            writeBits(param5.h[int(_loc14_ * 16 + category.h[_loc9_])]);
            writeBits(bitcode.h[_loc9_]);
            _loc12_++;
         }
         if(_loc11_ != 63)
         {
            writeBits(_loc6_);
         }
         return param3;
      }
      
      public function initZigZag() : void
      {
         ZigZag = [0,1,5,6,14,15,27,28,2,4,7,13,16,26,29,42,3,8,12,17,25,30,41,43,9,11,18,24,31,40,44,53,10,19,23,32,39,45,52,54,20,22,33,38,46,51,55,60,21,34,37,47,50,56,59,61,35,36,48,49,57,58,62,63];
      }
      
      public function initQuantTables(param1:int) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc2_:Array = [16,11,10,16,24,40,51,61,12,12,14,19,26,58,60,55,14,13,16,24,40,57,69,56,14,17,22,29,51,87,80,62,18,22,37,56,68,109,103,77,24,35,55,64,81,104,113,92,49,64,78,87,103,121,120,101,72,92,95,98,112,100,103,99];
         var _loc3_:int = 0;
         while(_loc3_ < 64)
         {
            _loc4_ = _loc3_++;
            _loc5_ = int(Math.floor((int(_loc2_[_loc4_]) * param1 + 50) / 100));
            if(_loc5_ < 1)
            {
               _loc5_ = 1;
            }
            else if(_loc5_ > 255)
            {
               _loc5_ = 255;
            }
            YTable[int(ZigZag[_loc4_])] = _loc5_;
         }
         var _loc6_:Array = [17,18,24,47,99,99,99,99,18,21,26,66,99,99,99,99,24,26,56,99,99,99,99,99,47,66,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99];
         _loc3_ = 0;
         while(_loc3_ < 64)
         {
            _loc4_ = _loc3_++;
            _loc5_ = int(Math.floor((int(_loc6_[_loc4_]) * param1 + 50) / 100));
            if(_loc5_ < 1)
            {
               _loc5_ = 1;
            }
            else if(_loc5_ > 255)
            {
               _loc5_ = 255;
            }
            UVTable[int(ZigZag[_loc4_])] = _loc5_;
         }
         var _loc7_:Array = [1,1.387039845,1.306562965,1.175875602,1,0.785694958,0.5411961,0.275899379];
         _loc3_ = 0;
         _loc4_ = 0;
         while(_loc4_ < 8)
         {
            _loc5_ = _loc4_++;
            _loc8_ = 0;
            while(_loc8_ < 8)
            {
               _loc9_ = _loc8_++;
               fdtbl_Y[_loc3_] = 1 / (int(YTable[int(ZigZag[_loc3_])]) * Number(_loc7_[_loc5_]) * Number(_loc7_[_loc9_]) * 8);
               fdtbl_UV[_loc3_] = 1 / (int(UVTable[int(ZigZag[_loc3_])]) * Number(_loc7_[_loc5_]) * Number(_loc7_[_loc9_]) * 8);
               _loc3_++;
            }
         }
      }
      
      public function initLuminance() : void
      {
         std_dc_luminance_nrcodes = [0,0,1,5,1,1,1,1,1,1,0,0,0,0,0,0,0];
         std_dc_luminance_values = strIntsToBytes("0,1,2,3,4,5,6,7,8,9,10,11");
         std_ac_luminance_nrcodes = [0,0,2,1,3,3,2,4,3,5,5,4,4,0,0,1,125];
         std_ac_luminance_values = strIntsToBytes("0x01,0x02,0x03,0x00,0x04,0x11,0x05,0x12," + "0x21,0x31,0x41,0x06,0x13,0x51,0x61,0x07," + "0x22,0x71,0x14,0x32,0x81,0x91,0xa1,0x08," + "0x23,0x42,0xb1,0xc1,0x15,0x52,0xd1,0xf0," + "0x24,0x33,0x62,0x72,0x82,0x09,0x0a,0x16," + "0x17,0x18,0x19,0x1a,0x25,0x26,0x27,0x28," + "0x29,0x2a,0x34,0x35,0x36,0x37,0x38,0x39," + "0x3a,0x43,0x44,0x45,0x46,0x47,0x48,0x49," + "0x4a,0x53,0x54,0x55,0x56,0x57,0x58,0x59," + "0x5a,0x63,0x64,0x65,0x66,0x67,0x68,0x69," + "0x6a,0x73,0x74,0x75,0x76,0x77,0x78,0x79," + "0x7a,0x83,0x84,0x85,0x86,0x87,0x88,0x89," + "0x8a,0x92,0x93,0x94,0x95,0x96,0x97,0x98," + "0x99,0x9a,0xa2,0xa3,0xa4,0xa5,0xa6,0xa7," + "0xa8,0xa9,0xaa,0xb2,0xb3,0xb4,0xb5,0xb6," + "0xb7,0xb8,0xb9,0xba,0xc2,0xc3,0xc4,0xc5," + "0xc6,0xc7,0xc8,0xc9,0xca,0xd2,0xd3,0xd4," + "0xd5,0xd6,0xd7,0xd8,0xd9,0xda,0xe1,0xe2," + "0xe3,0xe4,0xe5,0xe6,0xe7,0xe8,0xe9,0xea," + "0xf1,0xf2,0xf3,0xf4,0xf5,0xf6,0xf7,0xf8," + "0xf9,0xfa");
      }
      
      public function initHuffmanTbl() : void
      {
         YDC_HT = computeHuffmanTbl(std_dc_luminance_nrcodes,std_dc_luminance_values);
         UVDC_HT = computeHuffmanTbl(std_dc_chrominance_nrcodes,std_dc_chrominance_values);
         YAC_HT = computeHuffmanTbl(std_ac_luminance_nrcodes,std_ac_luminance_values);
         UVAC_HT = computeHuffmanTbl(std_ac_chrominance_nrcodes,std_ac_chrominance_values);
      }
      
      public function initChrominance() : void
      {
         std_dc_chrominance_nrcodes = [0,0,3,1,1,1,1,1,1,1,1,1,0,0,0,0,0];
         std_dc_chrominance_values = strIntsToBytes("0,1,2,3,4,5,6,7,8,9,10,11");
         std_ac_chrominance_nrcodes = [0,0,2,1,2,4,4,3,4,7,5,4,4,0,1,2,119];
         std_ac_chrominance_values = strIntsToBytes("0x00,0x01,0x02,0x03,0x11,0x04,0x05,0x21," + "0x31,0x06,0x12,0x41,0x51,0x07,0x61,0x71," + "0x13,0x22,0x32,0x81,0x08,0x14,0x42,0x91," + "0xa1,0xb1,0xc1,0x09,0x23,0x33,0x52,0xf0," + "0x15,0x62,0x72,0xd1,0x0a,0x16,0x24,0x34," + "0xe1,0x25,0xf1,0x17,0x18,0x19,0x1a,0x26," + "0x27,0x28,0x29,0x2a,0x35,0x36,0x37,0x38," + "0x39,0x3a,0x43,0x44,0x45,0x46,0x47,0x48," + "0x49,0x4a,0x53,0x54,0x55,0x56,0x57,0x58," + "0x59,0x5a,0x63,0x64,0x65,0x66,0x67,0x68," + "0x69,0x6a,0x73,0x74,0x75,0x76,0x77,0x78," + "0x79,0x7a,0x82,0x83,0x84,0x85,0x86,0x87," + "0x88,0x89,0x8a,0x92,0x93,0x94,0x95,0x96," + "0x97,0x98,0x99,0x9a,0xa2,0xa3,0xa4,0xa5," + "0xa6,0xa7,0xa8,0xa9,0xaa,0xb2,0xb3,0xb4," + "0xb5,0xb6,0xb7,0xb8,0xb9,0xba,0xc2,0xc3," + "0xc4,0xc5,0xc6,0xc7,0xc8,0xc9,0xca,0xd2," + "0xd3,0xd4,0xd5,0xd6,0xd7,0xd8,0xd9,0xda," + "0xe2,0xe3,0xe4,0xe5,0xe6,0xe7,0xe8,0xe9," + "0xea,0xf2,0xf3,0xf4,0xf5,0xf6,0xf7,0xf8," + "0xf9,0xfa");
      }
      
      public function initCategoryNumber() : void
      {
         var _loc3_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:* = null as IMap;
         var _loc10_:* = null as BitString;
         var _loc1_:int = 1;
         var _loc2_:int = 2;
         var _loc4_:int = 1;
         while(_loc4_ < 16)
         {
            _loc5_ = _loc4_++;
            _loc6_ = _loc1_;
            _loc7_ = _loc2_;
            while(_loc6_ < _loc7_)
            {
               _loc8_ = _loc6_++;
               _loc3_ = 32767 + _loc8_;
               category.h[_loc3_] = _loc5_;
               _loc9_ = bitcode;
               _loc10_ = new BitString(_loc5_,_loc8_);
               _loc9_.h[_loc3_] = _loc10_;
            }
            _loc6_ = -(_loc2_ - 1);
            while(_loc6_ <= -_loc1_)
            {
               _loc3_ = 32767 + _loc6_;
               category.h[_loc3_] = _loc5_;
               _loc9_ = bitcode;
               _loc10_ = new BitString(_loc5_,_loc2_ - 1 + _loc6_);
               _loc9_.h[_loc3_] = _loc10_;
               _loc6_++;
            }
            _loc1_ <<= 1;
            _loc2_ <<= 1;
         }
      }
      
      public function fDCTQuant(param1:Array, param2:Array) : Array
      {
         var _loc5_:int = 0;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc14_:Number = NaN;
         var _loc15_:Number = NaN;
         var _loc16_:Number = NaN;
         var _loc17_:Number = NaN;
         var _loc18_:Number = NaN;
         var _loc19_:Number = NaN;
         var _loc20_:Number = NaN;
         var _loc21_:Number = NaN;
         var _loc22_:Number = NaN;
         var _loc23_:Number = NaN;
         var _loc24_:Number = NaN;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         while(_loc4_ < 8)
         {
            _loc5_ = _loc4_++;
            _loc6_ = Number(param1[_loc3_]) + Number(param1[_loc3_ + 7]);
            _loc7_ = Number(param1[_loc3_]) - Number(param1[_loc3_ + 7]);
            _loc8_ = Number(param1[_loc3_ + 1]) + Number(param1[_loc3_ + 6]);
            _loc9_ = Number(param1[_loc3_ + 1]) - Number(param1[_loc3_ + 6]);
            _loc10_ = Number(param1[_loc3_ + 2]) + Number(param1[_loc3_ + 5]);
            _loc11_ = Number(param1[_loc3_ + 2]) - Number(param1[_loc3_ + 5]);
            _loc12_ = Number(param1[_loc3_ + 3]) + Number(param1[_loc3_ + 4]);
            _loc13_ = Number(param1[_loc3_ + 3]) - Number(param1[_loc3_ + 4]);
            _loc14_ = _loc6_ + _loc12_;
            _loc15_ = _loc6_ - _loc12_;
            _loc16_ = _loc8_ + _loc10_;
            _loc17_ = _loc8_ - _loc10_;
            param1[_loc3_] = _loc14_ + _loc16_;
            param1[_loc3_ + 4] = _loc14_ - _loc16_;
            _loc18_ = (_loc17_ + _loc15_) * 0.707106781;
            param1[_loc3_ + 2] = _loc15_ + _loc18_;
            param1[_loc3_ + 6] = _loc15_ - _loc18_;
            _loc14_ = _loc13_ + _loc11_;
            _loc16_ = _loc11_ + _loc9_;
            _loc17_ = _loc9_ + _loc7_;
            _loc19_ = (_loc14_ - _loc17_) * 0.382683433;
            _loc20_ = 0.5411961 * _loc14_ + _loc19_;
            _loc21_ = 1.306562965 * _loc17_ + _loc19_;
            _loc22_ = _loc16_ * 0.707106781;
            _loc23_ = _loc7_ + _loc22_;
            _loc24_ = _loc7_ - _loc22_;
            param1[_loc3_ + 5] = _loc24_ + _loc20_;
            param1[_loc3_ + 3] = _loc24_ - _loc20_;
            param1[_loc3_ + 1] = _loc23_ + _loc21_;
            param1[_loc3_ + 7] = _loc23_ - _loc21_;
            _loc3_ += 8;
         }
         _loc3_ = 0;
         _loc4_ = 0;
         while(_loc4_ < 8)
         {
            _loc5_ = _loc4_++;
            _loc6_ = Number(param1[_loc3_]) + Number(param1[_loc3_ + 56]);
            _loc7_ = Number(param1[_loc3_]) - Number(param1[_loc3_ + 56]);
            _loc8_ = Number(param1[_loc3_ + 8]) + Number(param1[_loc3_ + 48]);
            _loc9_ = Number(param1[_loc3_ + 8]) - Number(param1[_loc3_ + 48]);
            _loc10_ = Number(param1[_loc3_ + 16]) + Number(param1[_loc3_ + 40]);
            _loc11_ = Number(param1[_loc3_ + 16]) - Number(param1[_loc3_ + 40]);
            _loc12_ = Number(param1[_loc3_ + 24]) + Number(param1[_loc3_ + 32]);
            _loc13_ = Number(param1[_loc3_ + 24]) - Number(param1[_loc3_ + 32]);
            _loc14_ = _loc6_ + _loc12_;
            _loc15_ = _loc6_ - _loc12_;
            _loc16_ = _loc8_ + _loc10_;
            _loc17_ = _loc8_ - _loc10_;
            param1[_loc3_] = _loc14_ + _loc16_;
            param1[_loc3_ + 32] = _loc14_ - _loc16_;
            _loc18_ = (_loc17_ + _loc15_) * 0.707106781;
            param1[_loc3_ + 16] = _loc15_ + _loc18_;
            param1[_loc3_ + 48] = _loc15_ - _loc18_;
            _loc14_ = _loc13_ + _loc11_;
            _loc16_ = _loc11_ + _loc9_;
            _loc17_ = _loc9_ + _loc7_;
            _loc19_ = (_loc14_ - _loc17_) * 0.382683433;
            _loc20_ = 0.5411961 * _loc14_ + _loc19_;
            _loc21_ = 1.306562965 * _loc17_ + _loc19_;
            _loc22_ = _loc16_ * 0.707106781;
            _loc23_ = _loc7_ + _loc22_;
            _loc24_ = _loc7_ - _loc22_;
            param1[_loc3_ + 40] = _loc24_ + _loc20_;
            param1[_loc3_ + 24] = _loc24_ - _loc20_;
            param1[_loc3_ + 8] = _loc23_ + _loc21_;
            param1[_loc3_ + 56] = _loc23_ - _loc21_;
            _loc3_++;
         }
         _loc4_ = 0;
         while(_loc4_ < 64)
         {
            _loc5_ = _loc4_++;
            param1[_loc5_] = int(Math.round(Number(param1[_loc5_]) * Number(param2[_loc5_])));
         }
         return param1;
      }
      
      public function computeHuffmanTbl(param1:Array, param2:Bytes) : IMap
      {
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:* = null as BitString;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:IMap = new IntMap();
         var _loc6_:int = 1;
         while(_loc6_ < 17)
         {
            _loc7_ = _loc6_++;
            _loc8_ = int(param1[_loc7_]);
            _loc9_ = 0;
            _loc10_ = _loc8_;
            while(_loc9_ < _loc10_)
            {
               _loc11_ = _loc9_++;
               _loc12_ = int(param2.b[_loc4_]);
               _loc13_ = new BitString(_loc7_,_loc3_);
               _loc5_.h[_loc12_] = _loc13_;
               _loc4_++;
               _loc3_++;
            }
            _loc3_ *= 2;
         }
         return _loc5_;
      }
      
      public function b(param1:int) : void
      {
         byteout.writeByte(param1);
      }
      
      public function RGB2YUV(param1:Bytes, param2:int, param3:int, param4:int) : void
      {
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         while(_loc6_ < 8)
         {
            _loc7_ = _loc6_++;
            _loc8_ = (_loc7_ + param4) * param2 + param3 << 2;
            _loc9_ = 0;
            while(_loc9_ < 8)
            {
               _loc10_ = _loc9_++;
               _loc8_++;
               _loc11_ = int(param1.b[_loc8_++]);
               _loc12_ = int(param1.b[_loc8_++]);
               _loc13_ = int(param1.b[_loc8_++]);
               YDU[_loc5_] = 0.299 * _loc11_ + 0.587 * _loc12_ + 0.114 * _loc13_ - 128;
               UDU[_loc5_] = -0.16874 * _loc11_ + -0.33126 * _loc12_ + 0.5 * _loc13_;
               VDU[_loc5_] = 0.5 * _loc11_ + -0.41869 * _loc12_ + -0.08131 * _loc13_;
               _loc5_++;
            }
         }
      }
   }
}

