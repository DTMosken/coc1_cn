package haxe.zip
{
   import flash.Boot;
   import haxe.Exception;
   import haxe.ds.List;
   import haxe.io.Bytes;
   import haxe.io.BytesBuffer;
   import haxe.io.Error;
   import haxe.io.Input;
   
   public class Reader
   {
      
      public var i:Input;
      
      public function Reader(param1:Input = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         i = param1;
      }
      
      public static function readZip(param1:Input) : List
      {
         var _loc2_:Reader = new Reader(param1);
         return _loc2_.read();
      }
      
      public function readZipDate() : Date
      {
         var _loc1_:int = i.readUInt16();
         var _loc2_:int = _loc1_ >> 11 & 0x1F;
         var _loc3_:int = _loc1_ >> 5 & 0x3F;
         var _loc4_:int = _loc1_ & 0x1F;
         var _loc5_:int = i.readUInt16();
         var _loc6_:int = _loc5_ >> 9;
         var _loc7_:int = _loc5_ >> 5 & 0x0F;
         var _loc8_:int = _loc5_ & 0x1F;
         return new Date(_loc6_ + 1980,_loc7_ - 1,_loc8_,_loc2_,_loc3_,_loc4_ << 1);
      }
      
      public function readExtraFields(param1:int) : List
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:* = null as BytesBuffer;
         var _loc7_:* = null as Bytes;
         var _loc8_:int = 0;
         var _loc9_:* = null as String;
         var _loc2_:List = new List();
         while(param1 > 0)
         {
            if(param1 < 4)
            {
               throw Exception.thrown("Invalid extra fields data");
            }
            _loc3_ = i.readUInt16();
            _loc4_ = i.readUInt16();
            if(param1 < _loc4_)
            {
               throw Exception.thrown("Invalid extra fields data");
            }
            if(_loc3_ == 28789)
            {
               _loc5_ = i.readByte();
               if(_loc5_ != 1)
               {
                  _loc6_ = new BytesBuffer();
                  _loc6_.b.writeByte(_loc5_);
                  _loc7_ = i.read(_loc4_ - 1);
                  _loc6_.b.writeBytes(_loc7_.b);
                  _loc2_.add(ExtraField.FUnknown(_loc3_,_loc6_.getBytes()));
               }
               else
               {
                  _loc8_ = i.readInt32();
                  _loc9_ = i.read(_loc4_ - 5).toString();
                  _loc2_.add(ExtraField.FInfoZipUnicodePath(_loc9_,_loc8_));
               }
            }
            else
            {
               _loc2_.add(ExtraField.FUnknown(_loc3_,i.read(_loc4_)));
            }
            param1 -= 4 + _loc4_;
         }
         return _loc2_;
      }
      
      public function readEntryHeader() : Object
      {
         var _loc1_:Input = i;
         var _loc2_:int = _loc1_.readInt32();
         if(_loc2_ == 33639248 || _loc2_ == 101010256)
         {
            return null;
         }
         if(_loc2_ != 67324752)
         {
            throw Exception.thrown("Invalid Zip Data");
         }
         var _loc3_:int = _loc1_.readUInt16();
         var _loc4_:int = _loc1_.readUInt16();
         var _loc5_:Boolean = (_loc4_ & 0x0800) != 0;
         if((_loc4_ & 0xF7F1) != 0)
         {
            throw Exception.thrown("Unsupported flags " + _loc4_);
         }
         var _loc6_:int = _loc1_.readUInt16();
         var _loc7_:Boolean = _loc6_ != 0;
         if(_loc7_ && _loc6_ != 8)
         {
            throw Exception.thrown("Unsupported compression " + _loc6_);
         }
         var _loc8_:Date = readZipDate();
         var _loc9_:Object = _loc1_.readInt32();
         var _loc10_:int = _loc1_.readInt32();
         var _loc11_:int = _loc1_.readInt32();
         var _loc12_:int = _loc1_.readInt16();
         var _loc13_:int = _loc1_.readInt16();
         var _loc14_:String = _loc1_.readString(_loc12_);
         var _loc15_:List = readExtraFields(_loc13_);
         if(_loc5_)
         {
            _loc15_.push(ExtraField.FUtf8);
         }
         var _loc16_:Bytes = null;
         if((_loc4_ & 8) != 0)
         {
            _loc9_ = null;
         }
         return {
            "fileName":_loc14_,
            "fileSize":_loc11_,
            "fileTime":_loc8_,
            "compressed":_loc7_,
            "dataSize":_loc10_,
            "data":_loc16_,
            "crc32":_loc9_,
            "extraFields":_loc15_
         };
      }
      
      public function read() : List
      {
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc6_:* = null as BytesBuffer;
         var _loc7_:* = null as InflateImpl;
         var _loc8_:int = 0;
         var _loc1_:List = new List();
         var _loc2_:Object = null;
         var _loc3_:Bytes = null;
         while(true)
         {
            _loc4_ = readEntryHeader();
            if(_loc4_ == null)
            {
               break;
            }
            if(_loc4_.crc32 == null)
            {
               if(Boolean(_loc4_.compressed))
               {
                  _loc5_ = 65536;
                  if(_loc3_ == null)
                  {
                     _loc3_ = Bytes.alloc(_loc5_);
                  }
                  _loc6_ = new BytesBuffer();
                  _loc7_ = new InflateImpl(i,false,false);
                  while(true)
                  {
                     _loc8_ = _loc7_.readBytes(_loc3_,0,_loc5_);
                     if(_loc8_ < 0 || _loc8_ > _loc3_.length)
                     {
                        throw Exception.thrown(haxe.io.Error.OutsideBounds);
                     }
                     if(_loc8_ > 0)
                     {
                        _loc6_.b.writeBytes(_loc3_.b,0,_loc8_);
                     }
                     if(_loc8_ < _loc5_)
                     {
                        break;
                     }
                  }
                  _loc4_.data = _loc6_.getBytes();
               }
               else
               {
                  _loc4_.data = i.read(int(_loc4_.dataSize));
               }
               _loc4_.crc32 = i.readInt32();
               if(_loc4_.crc32 == 134695760)
               {
                  _loc4_.crc32 = i.readInt32();
               }
               _loc4_.dataSize = i.readInt32();
               _loc4_.fileSize = i.readInt32();
               _loc4_.dataSize = int(_loc4_.fileSize);
               _loc4_.compressed = false;
            }
            else
            {
               _loc4_.data = i.read(int(_loc4_.dataSize));
            }
            _loc1_.add(_loc4_);
         }
         return _loc1_;
      }
   }
}

