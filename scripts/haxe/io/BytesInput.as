package haxe.io
{
   import flash.Boot;
   import flash.utils.ByteArray;
   import haxe.Exception;
   
   public class BytesInput extends Input
   {
      
      public var b:ByteArray;
      
      public function BytesInput(param1:Bytes = undefined, param2:Object = undefined, param3:Object = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         if(param2 == null)
         {
            param2 = 0;
         }
         if(param3 == null)
         {
            param3 = param1.length - param2;
         }
         if(param2 < 0 || param3 < 0 || int(param2 + param3) > param1.length)
         {
            throw Exception.thrown(haxe.io.Error.OutsideBounds);
         }
         var _loc4_:ByteArray = param1.b;
         _loc4_.position = param2;
         if(param3 != _loc4_.bytesAvailable)
         {
            b = new ByteArray();
            _loc4_.readBytes(b,0,param3);
         }
         else
         {
            b = _loc4_;
         }
         b.endian = "littleEndian";
      }
      
      override public function set_bigEndian(param1:Boolean) : Boolean
      {
         bigEndian = param1;
         b.endian = param1 ? "bigEndian" : "littleEndian";
         return param1;
      }
      
      override public function readUInt16() : int
      {
         var _loc2_:* = null;
         return b.readUnsignedShort();
      }
      
      override public function readString(param1:int, param2:Encoding = undefined) : String
      {
         var _loc4_:* = null;
         if(param2 == Encoding.RawNative)
         {
            return b.readMultiByte(param1,"unicode");
         }
         return b.readUTFBytes(param1);
      }
      
      override public function readInt32() : int
      {
         var _loc2_:* = null;
         return b.readInt();
      }
      
      override public function readInt16() : int
      {
         var _loc2_:* = null;
         return b.readShort();
      }
      
      override public function readDouble() : Number
      {
         var _loc2_:* = null;
         return b.readDouble();
      }
      
      override public function readBytes(param1:Bytes, param2:int, param3:int) : int
      {
         var _loc6_:* = null;
         if(param2 < 0 || param3 < 0 || param2 + param3 > param1.length)
         {
            throw Exception.thrown(haxe.io.Error.OutsideBounds);
         }
         var _loc5_:int = int(b.bytesAvailable);
         if(param3 > _loc5_ && _loc5_ > 0)
         {
            param3 = _loc5_;
         }
         b.readBytes(param1.b,param2,param3);
      }
      
      override public function readByte() : int
      {
         var _loc2_:* = null;
         return b.readUnsignedByte();
      }
   }
}

