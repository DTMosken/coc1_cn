package lime.media.vorbis
{
   import flash.Boot;
   import haxe._Int64.___Int64;
   import haxe.io.Bytes;
   
   public class VorbisFile
   {
      
      public var handle:*;
      
      public var bitstream:int;
      
      public function VorbisFile(param1:* = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         handle = param1;
      }
      
      public static function fromBytes(param1:Bytes) : VorbisFile
      {
         return null;
      }
      
      public static function fromFile(param1:String) : VorbisFile
      {
         return null;
      }
      
      public function timeTotal(param1:int = -1) : Number
      {
         return 0;
      }
      
      public function timeTell() : Number
      {
         return 0;
      }
      
      public function timeSeekPageLap(param1:Number) : int
      {
         return 0;
      }
      
      public function timeSeekPage(param1:Number) : int
      {
         return 0;
      }
      
      public function timeSeekLap(param1:Number) : int
      {
         return 0;
      }
      
      public function timeSeek(param1:Number) : int
      {
         return 0;
      }
      
      public function streams() : int
      {
         return 0;
      }
      
      public function serialNumber(param1:int = -1) : int
      {
         return 0;
      }
      
      public function seekable() : Boolean
      {
         return false;
      }
      
      public function readFloat(param1:Bytes, param2:int) : int
      {
         return 0;
      }
      
      public function read(param1:Bytes, param2:int, param3:int = 4096, param4:Boolean = false, param5:int = 2, param6:Boolean = true) : int
      {
         return 0;
      }
      
      public function rawTotal(param1:int = -1) : ___Int64
      {
         return new ___Int64(0,0);
      }
      
      public function rawTell() : ___Int64
      {
         return new ___Int64(0,0);
      }
      
      public function rawSeekLap(param1:___Int64) : int
      {
         return 0;
      }
      
      public function rawSeek(param1:___Int64) : int
      {
         return 0;
      }
      
      public function pcmTotal(param1:int = -1) : ___Int64
      {
         return new ___Int64(0,0);
      }
      
      public function pcmTell() : ___Int64
      {
         return new ___Int64(0,0);
      }
      
      public function pcmSeekPageLap(param1:___Int64) : int
      {
         return 0;
      }
      
      public function pcmSeekPage(param1:___Int64) : int
      {
         return 0;
      }
      
      public function pcmSeekLap(param1:___Int64) : int
      {
         return 0;
      }
      
      public function pcmSeek(param1:___Int64) : int
      {
         return 0;
      }
      
      public function info(param1:int = -1) : VorbisInfo
      {
         return null;
      }
      
      public function crosslap(param1:VorbisFile) : int
      {
         return 0;
      }
      
      public function comment(param1:int = -1) : VorbisComment
      {
         return null;
      }
      
      public function clear() : void
      {
      }
      
      public function bitrateInstant() : int
      {
         return 0;
      }
      
      public function bitrate(param1:int = -1) : int
      {
         return 0;
      }
   }
}

