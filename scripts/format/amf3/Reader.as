package format.amf3
{
   import flash.Boot;
   import haxe.Exception;
   import haxe.IMap;
   import haxe.Log;
   import haxe.ds.EnumValueMap;
   import haxe.ds.StringMap;
   import haxe.io.Bytes;
   import haxe.io.Encoding;
   import haxe.io.Input;
   
   public class Reader
   {
      
      public var stringTable:Array;
      
      public var objectTraitsTable:Array;
      
      public var i:Input;
      
      public var complexObjectsTable:Array;
      
      public function Reader(param1:Input = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         complexObjectsTable = [];
         objectTraitsTable = [];
         stringTable = [];
         i = param1;
         param1.set_bigEndian(true);
      }
      
      public function readXml() : Value
      {
         var _loc1_:int = readInt();
         if((_loc1_ & 1) == 0)
         {
            return complexObjectsTable[_loc1_ >> 1];
         }
         _loc1_ >>= 1;
         var _loc2_:Xml = Xml.parse(Tools.decode(readStringNoHeader(_loc1_)));
         var _loc3_:Value = Value.AXml(_loc2_);
         complexObjectsTable.push(_loc3_);
         return _loc3_;
      }
      
      public function readWithCode(param1:int) : Value
      {
         var _loc2_:Input = i;
         switch(param1)
         {
            case 0:
               return Value.AUndefined;
            case 1:
               return Value.ANull;
            case 2:
               return Value.ABool(false);
            case 3:
               return Value.ABool(true);
            case 4:
               return Value.AInt(readInt(true));
            case 5:
               return Value.ANumber(_loc2_.readDouble());
            case 6:
               return readString();
            case 7:
               throw Exception.thrown("XMLDocument unsupported");
            case 8:
               return readDate();
            case 9:
               return readArray();
            case 10:
               return readObject();
            case 11:
               return readXml();
            case 12:
               return readBytes();
            case 13:
            case 14:
               return readIntVector();
            case 15:
               return readDoubleVector();
            case 16:
               return readObjectVector();
            case 17:
               return readMap();
            default:
               throw Exception.thrown("Unknown AMF " + param1);
         }
      }
      
      public function readStringNoHeader(param1:int) : Value
      {
         if(param1 == 0)
         {
            return Value.AString("");
         }
         var _loc2_:Value = Value.AString(i.readString(param1,Encoding.UTF8));
         stringTable.push(_loc2_);
         return _loc2_;
      }
      
      public function readString() : Value
      {
         var _loc2_:int = 0;
         var _loc1_:int = readInt();
         if((_loc1_ & 1) == 0)
         {
            _loc2_ = _loc1_ >> 1;
            return stringTable[_loc2_];
         }
         _loc2_ = _loc1_ >> 1;
         return readStringNoHeader(_loc2_);
      }
      
      public function readObjectVector() : Value
      {
         var _loc6_:* = null;
         var _loc7_:* = null as Value;
         var _loc10_:int = 0;
         var _loc1_:int = readInt();
         if((_loc1_ & 1) == 0)
         {
            return complexObjectsTable[_loc1_ >> 1];
         }
         var _loc2_:int = _loc1_ >> 1;
         var _loc3_:Boolean = i.readByte() != 0;
         var _loc4_:String = Tools.decode(readString());
         Log.trace("readObjectVector name:" + _loc4_,{
            "fileName":"format/amf3/Reader.hx",
            "lineNumber":259,
            "className":"format.amf3.Reader",
            "methodName":"readObjectVector"
         });
         var _loc5_:Class = Type.resolveClass(_loc4_);
         Log.trace("VC:" + Std.string(_loc5_),{
            "fileName":"format/amf3/Reader.hx",
            "lineNumber":261,
            "className":"format.amf3.Reader",
            "methodName":"readObjectVector"
         });
         if(_loc3_)
         {
            _loc6_ = new Vector.<Value>(_loc2_,true);
            _loc7_ = Value.AVector(_loc6_,_loc4_);
         }
         else
         {
            _loc6_ = [];
            _loc7_ = Value.AArray(_loc6_);
         }
         complexObjectsTable.push(_loc7_);
         var _loc8_:int = 0;
         var _loc9_:int = _loc2_;
         while(_loc8_ < _loc9_)
         {
            _loc10_ = _loc8_++;
            _loc6_[_loc10_] = read();
         }
         return _loc7_;
      }
      
      public function readObject() : Value
      {
         var _loc6_:* = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc12_:* = null as Value;
         var _loc13_:* = null as String;
         var _loc1_:Boolean = false;
         var _loc2_:Boolean = false;
         var _loc3_:Value = null;
         var _loc4_:Array = [];
         var _loc5_:int = readInt();
         if((_loc5_ & 1) == 0)
         {
            return complexObjectsTable[_loc5_ >> 1];
         }
         if((_loc5_ & 3) == 1)
         {
            _loc5_ >>= 2;
            _loc6_ = objectTraitsTable[_loc5_];
            _loc1_ = Boolean(_loc6_.isDynamic);
            _loc2_ = Boolean(_loc6_.isExternalizable);
            _loc3_ = _loc6_.className;
            _loc4_ = _loc6_.sealedMemberNames;
         }
         else if((_loc5_ & 7) == 3)
         {
            _loc1_ = (_loc5_ >> 3 & 1) == 1;
            _loc5_ >>= 4;
            _loc3_ = readString();
            _loc7_ = 0;
            _loc8_ = _loc5_;
            while(_loc7_ < _loc8_)
            {
               _loc9_ = _loc7_++;
               _loc4_.push(Tools.decode(readString()));
            }
            objectTraitsTable.push({
               "isExternalizable":_loc2_,
               "isDynamic":_loc1_,
               "className":_loc3_,
               "sealedMemberNames":_loc4_
            });
         }
         else
         {
            if((_loc5_ & 7) != 7)
            {
               throw Exception.thrown("Invalid object traits");
            }
            _loc2_ = true;
            _loc3_ = readString();
            Log.trace(Tools.decode(_loc3_),{
               "fileName":"format/amf3/Reader.hx",
               "lineNumber":108,
               "className":"format.amf3.Reader",
               "methodName":"readObject"
            });
         }
         var _loc10_:IMap = new StringMap();
         var _loc11_:Value = Value.AObject(_loc10_,null,_loc3_ != null ? Tools.decode(_loc3_) : null);
         complexObjectsTable.push(_loc11_);
         if(!_loc2_)
         {
            _loc7_ = 0;
            _loc8_ = int(_loc4_.length);
            while(_loc7_ < _loc8_)
            {
               _loc9_ = _loc7_++;
               _loc12_ = read();
               _loc13_ = _loc4_[_loc9_];
               if(_loc13_ in StringMap.reserved)
               {
                  _loc10_.setReserved(_loc13_,_loc12_);
               }
               else
               {
                  _loc10_.h[_loc13_] = _loc12_;
               }
            }
            if(_loc1_)
            {
               while(true)
               {
                  _loc13_ = Tools.decode(readString());
                  if(_loc13_ == "")
                  {
                     break;
                  }
                  _loc12_ = read();
                  if(_loc13_ in StringMap.reserved)
                  {
                     _loc10_.setReserved(_loc13_,_loc12_);
                  }
                  else
                  {
                     _loc10_.h[_loc13_] = _loc12_;
                  }
               }
            }
            return _loc11_;
         }
         throw Exception.thrown("Externalizable not supported");
      }
      
      public function readMap() : Value
      {
         var _loc6_:int = 0;
         var _loc1_:int = readInt();
         if((_loc1_ & 1) == 0)
         {
            return complexObjectsTable[_loc1_ >> 1];
         }
         _loc1_ >>= 1;
         var _loc2_:IMap = new EnumValueMap();
         var _loc3_:Value = Value.AMap(_loc2_);
         complexObjectsTable.push(_loc3_);
         i.readByte();
         var _loc4_:int = 0;
         var _loc5_:int = _loc1_;
         while(_loc4_ < _loc5_)
         {
            _loc6_ = _loc4_++;
            _loc2_.set(read(),read());
         }
         return _loc3_;
      }
      
      public function readIntVector() : Value
      {
         var _loc4_:* = null;
         var _loc7_:int = 0;
         var _loc1_:int = readInt();
         if((_loc1_ & 1) == 0)
         {
            return complexObjectsTable[_loc1_ >> 1];
         }
         var _loc2_:int = _loc1_ >> 1;
         var _loc3_:Boolean = i.readByte() != 0;
         if(_loc3_)
         {
            _loc4_ = new Vector.<Value>(_loc2_,true);
         }
         else
         {
            _loc4_ = [];
         }
         var _loc5_:int = 0;
         var _loc6_:int = _loc2_;
         while(_loc5_ < _loc6_)
         {
            _loc7_ = _loc5_++;
            _loc4_[_loc7_] = Value.AInt(i.readInt32());
         }
         var _loc8_:Value = _loc3_ ? Value.AVector(_loc4_,"Int") : Value.AArray(_loc4_);
         complexObjectsTable.push(_loc8_);
         return _loc8_;
      }
      
      public function readInt(param1:Boolean = false, param2:int = 0) : int
      {
         var _loc3_:int = i.readByte() & 0xFF;
         if(_loc3_ < 128)
         {
            return _loc3_ >> param2;
         }
         var _loc4_:int = (_loc3_ & 0x7F) << 7;
         _loc3_ = i.readByte() & 0xFF;
         if(_loc3_ < 128)
         {
            return (_loc4_ | _loc3_) >> param2;
         }
         _loc4_ |= _loc3_ & 0x7F;
         _loc4_ <<= 7;
         _loc3_ = i.readByte() & 0xFF;
         if(_loc3_ < 128)
         {
            return (_loc4_ | _loc3_) >> param2;
         }
         _loc4_ |= _loc3_ & 0x7F;
         _loc4_ <<= 8;
         _loc3_ = i.readByte() & 0xFF;
         _loc4_ |= _loc3_;
         if(param1 && (_loc4_ & 0x10000000) != 0)
         {
            _loc4_ |= -536870912;
         }
         return _loc4_ >> param2;
      }
      
      public function readDoubleVector() : Value
      {
         var _loc4_:* = null;
         var _loc7_:int = 0;
         var _loc1_:int = readInt();
         if((_loc1_ & 1) == 0)
         {
            return complexObjectsTable[_loc1_ >> 1];
         }
         var _loc2_:int = _loc1_ >> 1;
         var _loc3_:Boolean = i.readByte() != 0;
         if(_loc3_)
         {
            _loc4_ = new Vector.<Value>(_loc2_,true);
         }
         else
         {
            _loc4_ = [];
         }
         var _loc5_:int = 0;
         var _loc6_:int = _loc2_;
         while(_loc5_ < _loc6_)
         {
            _loc7_ = _loc5_++;
            _loc4_[_loc7_] = Value.ANumber(i.readDouble());
         }
         var _loc8_:Value = _loc3_ ? Value.AVector(_loc4_,"Number") : Value.AArray(_loc4_);
         complexObjectsTable.push(_loc8_);
         return _loc8_;
      }
      
      public function readDate() : Value
      {
         var _loc1_:int = readInt();
         if((_loc1_ & 1) == 0)
         {
            return complexObjectsTable[_loc1_ >> 1];
         }
         var _loc2_:Date = Date.fromTime(i.readDouble());
         var _loc3_:Value = Value.ADate(_loc2_);
         complexObjectsTable.push(_loc3_);
         return _loc3_;
      }
      
      public function readBytes() : Value
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc1_:int = readInt();
         if((_loc1_ & 1) == 0)
         {
            return complexObjectsTable[_loc1_ >> 1];
         }
         _loc1_ >>= 1;
         var _loc2_:Bytes = Bytes.alloc(_loc1_);
         var _loc3_:int = 0;
         var _loc4_:int = _loc1_;
         while(_loc3_ < _loc4_)
         {
            _loc5_ = _loc3_++;
            _loc6_ = i.readByte();
            _loc2_.b[_loc5_] = _loc6_;
         }
         var _loc7_:Value = Value.ABytes(_loc2_);
         complexObjectsTable.push(_loc7_);
         return _loc7_;
      }
      
      public function readArray() : Value
      {
         var _loc6_:* = null as Value;
         var _loc9_:int = 0;
         var _loc1_:int = readInt();
         if((_loc1_ & 1) == 0)
         {
            return complexObjectsTable[_loc1_ >> 1];
         }
         _loc1_ >>= 1;
         var _loc2_:Array = [];
         var _loc3_:IMap = new StringMap();
         var _loc4_:Value = Value.AArray(_loc2_,_loc3_);
         complexObjectsTable.push(_loc4_);
         var _loc5_:String = Tools.decode(readString());
         while(_loc5_.length != 0)
         {
            _loc6_ = read();
            if(_loc5_ in StringMap.reserved)
            {
               _loc3_.setReserved(_loc5_,_loc6_);
            }
            else
            {
               _loc3_.h[_loc5_] = _loc6_;
            }
            _loc5_ = Tools.decode(readString());
         }
         var _loc7_:int = 0;
         var _loc8_:int = _loc1_;
         while(_loc7_ < _loc8_)
         {
            _loc9_ = _loc7_++;
            _loc2_.push(read());
         }
         return _loc4_;
      }
      
      public function read() : Value
      {
         return readWithCode(i.readByte());
      }
   }
}

