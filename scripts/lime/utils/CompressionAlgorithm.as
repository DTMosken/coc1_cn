package lime.utils
{
   import flash.Boot;
   
   public final class CompressionAlgorithm
   {
      
      public static const __isenum:Boolean = true;
      
      public static var DEFLATE:CompressionAlgorithm = new CompressionAlgorithm("DEFLATE",0,null);
      
      public static var GZIP:CompressionAlgorithm = new CompressionAlgorithm("GZIP",1,null);
      
      public static var LZMA:CompressionAlgorithm = new CompressionAlgorithm("LZMA",2,null);
      
      public static var ZLIB:CompressionAlgorithm = new CompressionAlgorithm("ZLIB",3,null);
      
      public static var __constructs__:Array = ["DEFLATE","GZIP","LZMA","ZLIB"];
      
      public var tag:String;
      
      public var index:int;
      
      public var params:Array;
      
      public const __enum__:Boolean = true;
      
      public function CompressionAlgorithm(param1:String, param2:int, param3:Array)
      {
         tag = param1;
         index = param2;
         params = param3;
      }
      
      final public function toString() : String
      {
         return Boot.enum_to_string(this);
      }
   }
}

