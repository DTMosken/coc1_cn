package lime.utils._Bytes
{
   import flash.utils.ByteArray;
   import haxe.io.Bytes;
   import lime._internal.format.Deflate;
   import lime._internal.format.GZip;
   import lime._internal.format.LZMA;
   import lime._internal.format.Zlib;
   import lime.app.Future;
   import lime.net._HTTPRequest_lime_utils_Bytes;
   import lime.utils.CompressionAlgorithm;
   
   public final class Bytes_Impl_
   {
      
      public function Bytes_Impl_()
      {
      }
      
      public static function _new(param1:int, param2:ByteArray) : Bytes
      {
         return new Bytes(param1,param2);
      }
      
      public static function alloc(param1:int) : Bytes
      {
         return Bytes.alloc(param1);
      }
      
      public static function compress(param1:Bytes, param2:CompressionAlgorithm) : Bytes
      {
         switch(param2.index)
         {
            case 0:
               return Deflate.compress(param1);
            case 1:
               return GZip.compress(param1);
            case 2:
               return LZMA.compress(param1);
            case 3:
               return Zlib.compress(param1);
            default:
               return;
         }
      }
      
      public static function decompress(param1:Bytes, param2:CompressionAlgorithm) : Bytes
      {
         switch(param2.index)
         {
            case 0:
               return Deflate.decompress(param1);
            case 1:
               return GZip.decompress(param1);
            case 2:
               return LZMA.decompress(param1);
            case 3:
               return Zlib.decompress(param1);
            default:
               return;
         }
      }
      
      public static function fastGet(param1:ByteArray, param2:int) : int
      {
         return int(param1[param2]);
      }
      
      public static function fromBytes(param1:Bytes) : Bytes
      {
         if(param1 == null)
         {
            return null;
         }
         return Bytes_Impl_._new(param1.length,param1.b);
      }
      
      public static function fromFile(param1:String) : Bytes
      {
         return null;
      }
      
      public static function loadFromBytes(param1:Bytes) : Future
      {
         return Future.withValue(Bytes_Impl_.fromBytes(param1));
      }
      
      public static function loadFromFile(param1:String) : Future
      {
         var _loc2_:_HTTPRequest_lime_utils_Bytes = new _HTTPRequest_lime_utils_Bytes();
         return _loc2_.load(param1);
      }
      
      public static function ofData(param1:ByteArray) : Bytes
      {
         var _loc2_:Bytes = Bytes.ofData(param1);
         return Bytes_Impl_._new(_loc2_.length,_loc2_.b);
      }
      
      public static function ofString(param1:String) : Bytes
      {
         var _loc2_:Bytes = Bytes.ofString(param1);
         return Bytes_Impl_._new(_loc2_.length,_loc2_.b);
      }
   }
}

