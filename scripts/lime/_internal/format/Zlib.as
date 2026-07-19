package lime._internal.format
{
   import flash.utils.ByteArray;
   import haxe.io.Bytes;
   
   public class Zlib
   {
      
      public function Zlib()
      {
      }
      
      public static function compress(param1:Bytes) : Bytes
      {
         var _loc2_:ByteArray = param1.b;
         var _loc3_:ByteArray = new ByteArray();
         _loc3_.writeBytes(_loc2_);
         _loc3_.compress();
         return Bytes.ofData(_loc3_);
      }
      
      public static function decompress(param1:Bytes) : Bytes
      {
         var _loc2_:ByteArray = param1.b;
         var _loc3_:ByteArray = new ByteArray();
         _loc3_.writeBytes(_loc2_);
         _loc3_.uncompress();
         return Bytes.ofData(_loc3_);
      }
   }
}

