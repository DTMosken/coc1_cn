package haxe.io
{
   import flash.Boot;
   import flash.utils.ByteArray;
   
   public class BytesBuffer
   {
      
      public var b:ByteArray;
      
      public function BytesBuffer()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         b = new ByteArray();
         b.endian = "littleEndian";
      }
      
      public function getBytes() : Bytes
      {
         var _loc1_:Bytes = new Bytes(b.length,b);
         b.position = 0;
         b = null;
         return _loc1_;
      }
   }
}

