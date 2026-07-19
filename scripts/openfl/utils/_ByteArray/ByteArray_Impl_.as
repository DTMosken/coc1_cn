package openfl.utils._ByteArray
{
   import flash.errors.EOFError;
   import flash.utils.ByteArray;
   import haxe._Int64.___Int64;
   import haxe.io.Bytes;
   import lime.app.Future;
   import lime.utils.ArrayBufferView;
   import lime.utils.BytePointerData;
   import lime.utils._BytePointer.BytePointer_Impl_;
   import lime.utils._Bytes.Bytes_Impl_;
   
   public final class ByteArray_Impl_
   {
      
      public static var init__:Boolean;
      
      public static var __bytePointer:BytePointerData;
      
      public function ByteArray_Impl_()
      {
      }
      
      public static function _new(param1:int = 0) : ByteArray
      {
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.length = param1;
         return _loc2_;
      }
      
      public static function clear(param1:ByteArray) : void
      {
         param1.clear();
      }
      
      public static function compress(param1:ByteArray, param2:String = undefined) : void
      {
         if(param2 == null)
         {
            param1.compress();
         }
         else
         {
            param1.compress(param2);
         }
      }
      
      public static function deflate(param1:ByteArray) : void
      {
         param1.deflate();
      }
      
      public static function fromArrayBuffer(param1:Bytes) : ByteArray
      {
         if(param1 == null)
         {
            return null;
         }
         return param1.b;
      }
      
      public static function fromBytes(param1:Bytes) : ByteArray
      {
         if(param1 == null)
         {
            return null;
         }
         if(param1 is ByteArray)
         {
            return param1;
         }
         return param1.b;
      }
      
      public static function fromBytesData(param1:ByteArray) : ByteArray
      {
         if(param1 == null)
         {
            return null;
         }
         return param1;
      }
      
      public static function fromFile(param1:String) : ByteArray
      {
         return ByteArray_Impl_.fromLimeBytes(Bytes_Impl_.fromFile(param1));
      }
      
      public static function fromLimeBytes(param1:Bytes) : ByteArray
      {
         return ByteArray_Impl_.fromBytes(param1);
      }
      
      public static function get(param1:ByteArray, param2:int) : int
      {
         return int(param1[param2]);
      }
      
      public static function inflate(param1:ByteArray) : void
      {
         param1.inflate();
      }
      
      public static function loadFromBytes(param1:Bytes) : Future
      {
         return Bytes_Impl_.loadFromBytes(param1).then(function(param1:Bytes):Future
         {
            var _loc2_:ByteArray = ByteArray_Impl_.fromLimeBytes(param1);
            return Future.withValue(_loc2_);
         });
      }
      
      public static function loadFromFile(param1:String) : Future
      {
         return Bytes_Impl_.loadFromFile(param1).then(function(param1:Bytes):Future
         {
            var _loc2_:ByteArray = ByteArray_Impl_.fromLimeBytes(param1);
            return Future.withValue(_loc2_);
         });
      }
      
      public static function readBoolean(param1:ByteArray) : Boolean
      {
         return param1.readBoolean();
      }
      
      public static function readByte(param1:ByteArray) : int
      {
         return param1.readByte();
      }
      
      public static function readBytes(param1:ByteArray, param2:ByteArray, param3:uint = 0, param4:uint = 0) : void
      {
         param1.readBytes(param2,param3,param4);
      }
      
      public static function readDouble(param1:ByteArray) : Number
      {
         return param1.readDouble();
      }
      
      public static function readFloat(param1:ByteArray) : Number
      {
         return param1.readFloat();
      }
      
      public static function readInt(param1:ByteArray) : int
      {
         return param1.readInt();
      }
      
      public static function readInt64(param1:ByteArray) : ___Int64
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(uint(param1.position + 8) > param1.length)
         {
            throw new EOFError();
         }
         if(param1.endian == "littleEndian")
         {
            _loc3_ = int(param1.readUnsignedInt());
            _loc2_ = int(param1.readUnsignedInt());
         }
         else
         {
            _loc2_ = int(param1.readUnsignedInt());
            _loc3_ = int(param1.readUnsignedInt());
         }
         return new ___Int64(_loc2_,_loc3_);
      }
      
      public static function readMultiByte(param1:ByteArray, param2:uint, param3:String) : String
      {
         return param1.readMultiByte(param2,param3);
      }
      
      public static function readObject(param1:ByteArray) : *
      {
         return param1.readObject();
      }
      
      public static function readShort(param1:ByteArray) : int
      {
         return param1.readShort();
      }
      
      public static function readUTF(param1:ByteArray) : String
      {
         return param1.readUTF();
      }
      
      public static function readUTFBytes(param1:ByteArray, param2:uint) : String
      {
         return param1.readUTFBytes(param2);
      }
      
      public static function readUnsignedByte(param1:ByteArray) : uint
      {
         return param1.readUnsignedByte();
      }
      
      public static function readUnsignedInt(param1:ByteArray) : uint
      {
         return param1.readUnsignedInt();
      }
      
      public static function readUnsignedShort(param1:ByteArray) : uint
      {
         return param1.readUnsignedShort();
      }
      
      public static function set(param1:ByteArray, param2:int, param3:int) : int
      {
         param1[param2] = param3;
         return param3;
      }
      
      public static function toArrayBuffer(param1:ByteArray) : Bytes
      {
         return Bytes.ofData(param1);
      }
      
      public static function toBytePointer(param1:ByteArray) : BytePointerData
      {
         BytePointer_Impl_.set(ByteArray_Impl_.__bytePointer,ByteArray_Impl_.toBytes(param1),null,null,param1.position);
         return ByteArray_Impl_.__bytePointer;
      }
      
      public static function toBytes(param1:ByteArray) : Bytes
      {
         return Bytes.ofData(param1);
      }
      
      public static function toBytesData(param1:ByteArray) : ByteArray
      {
         return param1;
      }
      
      public static function toLimeBytes(param1:ByteArray) : Bytes
      {
         return Bytes.ofData(param1);
      }
      
      public static function toString(param1:ByteArray) : String
      {
         return param1.toString();
      }
      
      public static function uncompress(param1:ByteArray, param2:String = undefined) : void
      {
         if(param2 == null)
         {
            param1.uncompress();
         }
         else
         {
            param1.uncompress(param2);
         }
      }
      
      public static function writeBoolean(param1:ByteArray, param2:Boolean) : void
      {
         param1.writeBoolean(param2);
      }
      
      public static function writeByte(param1:ByteArray, param2:int) : void
      {
         param1.writeByte(param2);
      }
      
      public static function writeBytes(param1:ByteArray, param2:ByteArray, param3:uint = 0, param4:uint = 0) : void
      {
         param1.writeBytes(param2,param3,param4);
      }
      
      public static function writeDouble(param1:ByteArray, param2:Number) : void
      {
         param1.writeDouble(param2);
      }
      
      public static function writeFloat(param1:ByteArray, param2:Number) : void
      {
         param1.writeFloat(param2);
      }
      
      public static function writeInt(param1:ByteArray, param2:int) : void
      {
         param1.writeInt(param2);
      }
      
      public static function writeInt64(param1:ByteArray, param2:___Int64) : void
      {
         if(param1.endian == "littleEndian")
         {
            param1.writeUnsignedInt(param2.low);
            param1.writeUnsignedInt(param2.high);
         }
         else
         {
            param1.writeUnsignedInt(param2.high);
            param1.writeUnsignedInt(param2.low);
         }
      }
      
      public static function writeMultiByte(param1:ByteArray, param2:String, param3:String) : void
      {
         param1.writeMultiByte(param2,param3);
      }
      
      public static function writeObject(param1:ByteArray, param2:*) : void
      {
         param1.writeObject(param2);
      }
      
      public static function writeShort(param1:ByteArray, param2:int) : void
      {
         param1.writeShort(param2);
      }
      
      public static function writeUTF(param1:ByteArray, param2:String) : void
      {
         param1.writeUTF(param2);
      }
      
      public static function writeUTFBytes(param1:ByteArray, param2:String) : void
      {
         param1.writeUTFBytes(param2);
      }
      
      public static function writeUnsignedInt(param1:ByteArray, param2:uint) : void
      {
         param1.writeUnsignedInt(param2);
      }
      
      public static function get_bytesAvailable(param1:ByteArray) : uint
      {
         return param1.bytesAvailable;
      }
      
      public static function get_defaultEndian() : String
      {
         return "bigEndian";
      }
      
      public static function set_defaultEndian(param1:String) : String
      {
         return param1;
      }
      
      public static function get_defaultObjectEncoding() : int
      {
         return ByteArray.defaultObjectEncoding;
      }
      
      public static function set_defaultObjectEncoding(param1:int) : int
      {
         return ByteArray.defaultObjectEncoding = param1;
      }
      
      public static function get_endian(param1:ByteArray) : String
      {
         return param1.endian;
      }
      
      public static function set_endian(param1:ByteArray, param2:String) : String
      {
         return param1.endian = param2;
      }
      
      public static function get_length(param1:ByteArray) : uint
      {
         if(param1 == null)
         {
            return 0;
         }
         return param1.length;
      }
      
      public static function set_length(param1:ByteArray, param2:int) : uint
      {
         param1.length = param2;
         return param2;
      }
      
      public static function get_objectEncoding(param1:ByteArray) : int
      {
         return param1.objectEncoding;
      }
      
      public static function set_objectEncoding(param1:ByteArray, param2:int) : int
      {
         return param1.objectEncoding = param2;
      }
      
      public static function get_position(param1:ByteArray) : uint
      {
         return param1.position;
      }
      
      public static function set_position(param1:ByteArray, param2:uint) : uint
      {
         return param1.position = param2;
      }
   }
}

