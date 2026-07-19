package haxe.zip._InflateImpl
{
   import flash.Boot;
   import haxe.crypto.Adler32;
   import haxe.io.Bytes;
   
   public class Window
   {
      
      public var pos:int;
      
      public var crc:Adler32;
      
      public var buffer:Bytes;
      
      public function Window(param1:Boolean = false)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         buffer = Bytes.alloc(65536);
         pos = 0;
         if(param1)
         {
            crc = new Adler32();
         }
      }
      
      public function slide() : void
      {
         if(crc != null)
         {
            crc.update(buffer,0,32768);
         }
         var _loc1_:Bytes = Bytes.alloc(65536);
         pos -= 32768;
         _loc1_.blit(0,buffer,32768,pos);
         buffer = _loc1_;
      }
      
      public function getLastChar() : int
      {
         return int(buffer.b[pos - 1]);
      }
      
      public function checksum() : Adler32
      {
         if(crc != null)
         {
            crc.update(buffer,0,pos);
         }
         return crc;
      }
      
      public function available() : int
      {
         return pos;
      }
      
      public function addBytes(param1:Bytes, param2:int, param3:int) : void
      {
         if(pos + param3 > 65536)
         {
            slide();
         }
         buffer.blit(pos,param1,param2,param3);
         pos += param3;
      }
      
      public function addByte(param1:int) : void
      {
         if(pos == 65536)
         {
            slide();
         }
         buffer.b[pos] = param1;
         ++pos;
      }
   }
}

