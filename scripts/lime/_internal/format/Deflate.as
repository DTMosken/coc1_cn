package lime._internal.format
{
   import flash.utils.ByteArray;
   import haxe.io.Bytes;
   
   public class Deflate
   {
      
      public function Deflate()
      {
      }
      
      public static function compress(param1:Bytes) : Bytes
      {
         var _loc2_:ByteArray = param1.b;
         var _loc3_:ByteArray = new ByteArray();
         _loc3_.writeBytes(_loc2_);
         _loc3_.deflate();
         return Bytes.ofData(_loc3_);
      }
      
      public static function decompress(param1:Bytes) : Bytes
      {
         var _loc2_:ByteArray = param1.b;
         var _loc3_:ByteArray = new ByteArray();
         _loc3_.writeBytes(_loc2_);
         _loc3_.inflate();
         return Bytes.ofData(_loc3_);
      }
   }
}

