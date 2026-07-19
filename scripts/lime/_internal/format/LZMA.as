package lime._internal.format
{
   import flash.utils.ByteArray;
   import haxe.io.Bytes;
   
   public class LZMA
   {
      
      public function LZMA()
      {
      }
      
      public static function compress(param1:Bytes) : Bytes
      {
         var _loc2_:ByteArray = param1.b;
         var _loc3_:ByteArray = new ByteArray();
         _loc3_.writeBytes(_loc2_);
         _loc3_.compress("lzma");
         return Bytes.ofData(_loc3_);
      }
      
      public static function decompress(param1:Bytes) : Bytes
      {
         var _loc2_:ByteArray = param1.b;
         var _loc3_:ByteArray = new ByteArray();
         _loc3_.writeBytes(_loc2_);
         _loc3_.uncompress("lzma");
         return Bytes.ofData(_loc3_);
      }
   }
}

