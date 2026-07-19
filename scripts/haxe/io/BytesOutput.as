package haxe.io
{
   import flash.Boot;
   import flash.utils.ByteArray;
   import haxe.Exception;
   
   public class BytesOutput extends Output
   {
      
      public var b:ByteArray;
      
      public function BytesOutput()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         b = new ByteArray();
         b.endian = "littleEndian";
      }
      
      override public function writeString(param1:String, param2:Encoding = undefined) : void
      {
         if(param2 == Encoding.RawNative)
         {
            b.writeMultiByte(param1,"unicode");
         }
         else
         {
            b.writeUTFBytes(param1);
         }
      }
      
      override public function writeInt32(param1:int) : void
      {
         b.writeInt(param1);
      }
      
      override public function writeBytes(param1:Bytes, param2:int, param3:int) : int
      {
         if(param2 < 0 || param3 < 0 || param2 + param3 > param1.length)
         {
            throw Exception.thrown(haxe.io.Error.OutsideBounds);
         }
         b.writeBytes(param1.b,param2,param3);
         return param3;
      }
      
      override public function writeByte(param1:int) : void
      {
         b.writeByte(param1);
      }
      
      override public function set_bigEndian(param1:Boolean) : Boolean
      {
         bigEndian = param1;
         b.endian = param1 ? "bigEndian" : "littleEndian";
         return param1;
      }
      
      public function getBytes() : Bytes
      {
         var _loc1_:ByteArray = b;
         b = null;
         return new Bytes(_loc1_.length,_loc1_);
      }
   }
}

