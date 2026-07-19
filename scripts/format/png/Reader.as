package format.png
{
   import flash.Boot;
   import flash.utils.ByteArray;
   import haxe.Exception;
   import haxe.ds.List;
   import haxe.io.Bytes;
   import haxe.io.BytesInput;
   import haxe.io.Input;
   
   public class Reader
   {
      
      public var i:Input;
      
      public var checkCRC:Boolean;
      
      public function Reader(param1:Input = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         i = param1;
         param1.set_bigEndian(true);
         checkCRC = true;
      }
      
      public function readHeader(param1:Input) : Object
      {
         var _loc6_:* = null as Color;
         param1.set_bigEndian(true);
         var _loc2_:int = param1.readInt32();
         var _loc3_:int = param1.readInt32();
         var _loc4_:int = param1.readByte();
         var _loc5_:int = param1.readByte();
         switch(_loc5_)
         {
            case 0:
               _loc6_ = Color.ColGrey(false);
               break;
            case 2:
               _loc6_ = Color.ColTrue(false);
               break;
            case 3:
               _loc6_ = Color.ColIndexed;
               break;
            case 4:
               _loc6_ = Color.ColGrey(true);
               break;
            case 6:
               _loc6_ = Color.ColTrue(true);
               break;
            default:
               throw Exception.thrown("Unknown color model " + _loc5_ + ":" + _loc4_);
         }
         var _loc7_:int = param1.readByte();
         var _loc8_:int = param1.readByte();
         if(_loc7_ != 0 || _loc8_ != 0)
         {
            throw Exception.thrown("Invalid header");
         }
         var _loc9_:int = param1.readByte();
         if(_loc9_ != 0 && _loc9_ != 1)
         {
            throw Exception.thrown("Invalid header");
         }
         return {
            "width":_loc2_,
            "height":_loc3_,
            "colbits":_loc4_,
            "color":_loc6_,
            "interlaced":_loc9_ == 1
         };
      }
      
      public function readChunk() : Chunk
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:* = null as ByteArray;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc1_:int = i.readInt32();
         var _loc2_:String = i.readString(4);
         var _loc3_:Bytes = i.read(_loc1_);
         var _loc4_:int = i.readInt32();
         if(checkCRC)
         {
            _loc5_ = -1;
            _loc6_ = (_loc5_ ^ int(_loc2_.charCodeAt(0))) & 0xFF;
            _loc6_ = _loc6_ >>> 1 ^ -(_loc6_ & 1) & -306674912;
            _loc6_ = _loc6_ >>> 1 ^ -(_loc6_ & 1) & -306674912;
            _loc6_ = _loc6_ >>> 1 ^ -(_loc6_ & 1) & -306674912;
            _loc6_ = _loc6_ >>> 1 ^ -(_loc6_ & 1) & -306674912;
            _loc6_ = _loc6_ >>> 1 ^ -(_loc6_ & 1) & -306674912;
            _loc6_ = _loc6_ >>> 1 ^ -(_loc6_ & 1) & -306674912;
            _loc6_ = _loc6_ >>> 1 ^ -(_loc6_ & 1) & -306674912;
            _loc6_ = _loc6_ >>> 1 ^ -(_loc6_ & 1) & -306674912;
            _loc5_ = _loc5_ >>> 8 ^ _loc6_;
            _loc6_ = (_loc5_ ^ int(_loc2_.charCodeAt(1))) & 0xFF;
            _loc6_ = _loc6_ >>> 1 ^ -(_loc6_ & 1) & -306674912;
            _loc6_ = _loc6_ >>> 1 ^ -(_loc6_ & 1) & -306674912;
            _loc6_ = _loc6_ >>> 1 ^ -(_loc6_ & 1) & -306674912;
            _loc6_ = _loc6_ >>> 1 ^ -(_loc6_ & 1) & -306674912;
            _loc6_ = _loc6_ >>> 1 ^ -(_loc6_ & 1) & -306674912;
            _loc6_ = _loc6_ >>> 1 ^ -(_loc6_ & 1) & -306674912;
            _loc6_ = _loc6_ >>> 1 ^ -(_loc6_ & 1) & -306674912;
            _loc6_ = _loc6_ >>> 1 ^ -(_loc6_ & 1) & -306674912;
            _loc5_ = _loc5_ >>> 8 ^ _loc6_;
            _loc6_ = (_loc5_ ^ int(_loc2_.charCodeAt(2))) & 0xFF;
            _loc6_ = _loc6_ >>> 1 ^ -(_loc6_ & 1) & -306674912;
            _loc6_ = _loc6_ >>> 1 ^ -(_loc6_ & 1) & -306674912;
            _loc6_ = _loc6_ >>> 1 ^ -(_loc6_ & 1) & -306674912;
            _loc6_ = _loc6_ >>> 1 ^ -(_loc6_ & 1) & -306674912;
            _loc6_ = _loc6_ >>> 1 ^ -(_loc6_ & 1) & -306674912;
            _loc6_ = _loc6_ >>> 1 ^ -(_loc6_ & 1) & -306674912;
            _loc6_ = _loc6_ >>> 1 ^ -(_loc6_ & 1) & -306674912;
            _loc6_ = _loc6_ >>> 1 ^ -(_loc6_ & 1) & -306674912;
            _loc5_ = _loc5_ >>> 8 ^ _loc6_;
            _loc6_ = (_loc5_ ^ int(_loc2_.charCodeAt(3))) & 0xFF;
            _loc6_ = _loc6_ >>> 1 ^ -(_loc6_ & 1) & -306674912;
            _loc6_ = _loc6_ >>> 1 ^ -(_loc6_ & 1) & -306674912;
            _loc6_ = _loc6_ >>> 1 ^ -(_loc6_ & 1) & -306674912;
            _loc6_ = _loc6_ >>> 1 ^ -(_loc6_ & 1) & -306674912;
            _loc6_ = _loc6_ >>> 1 ^ -(_loc6_ & 1) & -306674912;
            _loc6_ = _loc6_ >>> 1 ^ -(_loc6_ & 1) & -306674912;
            _loc6_ = _loc6_ >>> 1 ^ -(_loc6_ & 1) & -306674912;
            _loc6_ = _loc6_ >>> 1 ^ -(_loc6_ & 1) & -306674912;
            _loc5_ = _loc5_ >>> 8 ^ _loc6_;
            _loc7_ = _loc3_.b;
            _loc6_ = 0;
            _loc8_ = _loc3_.length;
            while(_loc6_ < _loc8_)
            {
               _loc9_ = _loc6_++;
               _loc10_ = (_loc5_ ^ int(_loc7_[_loc9_])) & 0xFF;
               _loc10_ = _loc10_ >>> 1 ^ -(_loc10_ & 1) & -306674912;
               _loc10_ = _loc10_ >>> 1 ^ -(_loc10_ & 1) & -306674912;
               _loc10_ = _loc10_ >>> 1 ^ -(_loc10_ & 1) & -306674912;
               _loc10_ = _loc10_ >>> 1 ^ -(_loc10_ & 1) & -306674912;
               _loc10_ = _loc10_ >>> 1 ^ -(_loc10_ & 1) & -306674912;
               _loc10_ = _loc10_ >>> 1 ^ -(_loc10_ & 1) & -306674912;
               _loc10_ = _loc10_ >>> 1 ^ -(_loc10_ & 1) & -306674912;
               _loc10_ = _loc10_ >>> 1 ^ -(_loc10_ & 1) & -306674912;
               _loc5_ = _loc5_ >>> 8 ^ _loc10_;
            }
            if((_loc5_ ^ -1) != _loc4_)
            {
               throw Exception.thrown("CRC check failure");
            }
         }
         var _loc11_:String = _loc2_;
         if(_loc11_ == "IDAT")
         {
            return Chunk.CData(_loc3_);
         }
         if(_loc11_ == "IEND")
         {
            return Chunk.CEnd;
         }
         if(_loc11_ == "IHDR")
         {
            return Chunk.CHeader(readHeader(new BytesInput(_loc3_)));
         }
         if(_loc11_ == "PLTE")
         {
            return Chunk.CPalette(_loc3_);
         }
         return Chunk.CUnknown(_loc2_,_loc3_);
      }
      
      public function read() : List
      {
         var _loc3_:* = null as Chunk;
         var _loc1_:int = 137;
         if(i.readByte() != _loc1_)
         {
            throw Exception.thrown("Invalid header");
         }
         _loc1_ = 80;
         if(i.readByte() != _loc1_)
         {
            throw Exception.thrown("Invalid header");
         }
         _loc1_ = 78;
         if(i.readByte() != _loc1_)
         {
            throw Exception.thrown("Invalid header");
         }
         _loc1_ = 71;
         if(i.readByte() != _loc1_)
         {
            throw Exception.thrown("Invalid header");
         }
         _loc1_ = 13;
         if(i.readByte() != _loc1_)
         {
            throw Exception.thrown("Invalid header");
         }
         _loc1_ = 10;
         if(i.readByte() != _loc1_)
         {
            throw Exception.thrown("Invalid header");
         }
         _loc1_ = 26;
         if(i.readByte() != _loc1_)
         {
            throw Exception.thrown("Invalid header");
         }
         _loc1_ = 10;
         if(i.readByte() != _loc1_)
         {
            throw Exception.thrown("Invalid header");
         }
         var _loc2_:List = new List();
         while(true)
         {
            _loc3_ = readChunk();
            _loc2_.add(_loc3_);
            if(_loc3_ == Chunk.CEnd)
            {
               break;
            }
         }
         return _loc2_;
      }
   }
}

