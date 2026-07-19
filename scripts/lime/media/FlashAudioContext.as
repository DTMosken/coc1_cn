package lime.media
{
   import flash.media.Sound;
   
   public class FlashAudioContext
   {
      
      public function FlashAudioContext()
      {
      }
      
      public function play(param1:AudioBuffer, param2:Number = 0, param3:int = 0, param4:* = undefined) : *
      {
         if(param1.get_src() != null)
         {
            return param1.get_src().play(param2,param3,param4);
         }
         return null;
      }
      
      public function loadPCMFromByteArray(param1:AudioBuffer, param2:*, param3:uint, param4:String = undefined, param5:Boolean = true, param6:Number = 44100) : void
      {
         if(param1.get_src() != null)
         {
            param1.get_src().loadPCMFromByteArray(param2,param3,param4,param5,param6);
         }
      }
      
      public function loadCompressedDataFromByteArray(param1:AudioBuffer, param2:*, param3:uint) : void
      {
         if(param1.get_src() != null)
         {
            param1.get_src().loadCompressedDataFromByteArray(param2,param3);
         }
      }
      
      public function load(param1:AudioBuffer, param2:*, param3:* = undefined) : void
      {
         if(param1.get_src() != null)
         {
            param1.get_src().load(param2,param3);
         }
      }
      
      public function getURL(param1:AudioBuffer) : String
      {
         if(param1.get_src() != null)
         {
            return param1.get_src().url;
         }
         return null;
      }
      
      public function getLength(param1:AudioBuffer) : Number
      {
         if(param1.get_src() != null)
         {
            return param1.get_src().length;
         }
         return 0;
      }
      
      public function getIsURLInaccessible(param1:AudioBuffer) : Boolean
      {
         if(param1.get_src() != null)
         {
            return param1.get_src().isURLInaccessible;
         }
         return false;
      }
      
      public function getIsBuffering(param1:AudioBuffer) : Boolean
      {
         if(param1.get_src() != null)
         {
            return param1.get_src().isBuffering;
         }
         return false;
      }
      
      public function getID3(param1:AudioBuffer) : *
      {
         if(param1.get_src() != null)
         {
            return param1.get_src().id3;
         }
         return null;
      }
      
      public function getBytesTotal(param1:AudioBuffer) : int
      {
         if(param1.get_src() != null)
         {
            return param1.get_src().bytesTotal;
         }
         return 0;
      }
      
      public function getBytesLoaded(param1:AudioBuffer) : uint
      {
         if(param1.get_src() != null)
         {
            return param1.get_src().bytesLoaded;
         }
         return 0;
      }
      
      public function extract(param1:AudioBuffer, param2:*, param3:Number, param4:Number = -1) : Number
      {
         if(param1.get_src() != null)
         {
            return param1.get_src().extract(param2,param3,param4);
         }
         return 0;
      }
      
      public function createBuffer(param1:* = undefined, param2:* = undefined) : AudioBuffer
      {
         var _loc3_:AudioBuffer = new AudioBuffer();
         _loc3_.set_src(new Sound(param1,param2));
         return _loc3_;
      }
      
      public function close(param1:AudioBuffer) : void
      {
         if(param1.get_src() != null)
         {
            param1.get_src().close();
         }
      }
   }
}

