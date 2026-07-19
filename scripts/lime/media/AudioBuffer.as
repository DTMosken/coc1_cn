package lime.media
{
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.media.Sound;
   import flash.net.URLRequest;
   import haxe.io.Bytes;
   import haxe.io.Path;
   import lime.app.Future;
   import lime.app.Promise_lime_media_AudioBuffer;
   import lime.utils.ArrayBufferView;
   import lime.utils.Log;
   
   public class AudioBuffer
   {
      
      public var sampleRate:int;
      
      public var data:ArrayBufferView;
      
      public var channels:int;
      
      public var bitsPerSample:int;
      
      public var __srcVorbisFile:*;
      
      public var __srcSound:Sound;
      
      public var __srcHowl:*;
      
      public var __srcCustom:*;
      
      public var __srcBuffer:*;
      
      public var __srcAudio:*;
      
      public function AudioBuffer()
      {
      }
      
      public static function fromBase64(param1:String) : AudioBuffer
      {
         if(param1 == null)
         {
            return null;
         }
         return null;
      }
      
      public static function fromBytes(param1:Bytes) : AudioBuffer
      {
         if(param1 == null)
         {
            return null;
         }
         return null;
      }
      
      public static function fromFile(param1:String) : AudioBuffer
      {
         if(param1 == null)
         {
            return null;
         }
         var _loc2_:String = Path.extension(param1);
         if(_loc2_ != "ogg")
         {
            if(_loc2_ != "wav")
            {
               var _loc3_:AudioBuffer = new AudioBuffer();
               _loc3_.__srcSound = new Sound(new URLRequest(param1));
               return _loc3_;
            }
         }
         return null;
      }
      
      public static function fromFiles(param1:Array) : AudioBuffer
      {
         var _loc4_:* = null as String;
         var _loc2_:AudioBuffer = null;
         var _loc3_:int = 0;
         while(_loc3_ < int(param1.length))
         {
            _loc4_ = param1[_loc3_];
            _loc3_++;
            _loc2_ = AudioBuffer.fromFile(_loc4_);
            if(_loc2_ != null)
            {
               break;
            }
         }
         return _loc2_;
      }
      
      public static function fromVorbisFile(param1:*) : AudioBuffer
      {
         return null;
      }
      
      public static function loadFromFile(param1:String) : Future
      {
         var promise:Promise_lime_media_AudioBuffer = new Promise_lime_media_AudioBuffer();
         var audioBuffer:AudioBuffer = AudioBuffer.fromFile(param1);
         if(audioBuffer != null)
         {
            audioBuffer.__srcSound.addEventListener(Event.COMPLETE,function(param1:*):void
            {
               promise.complete(audioBuffer);
            });
            audioBuffer.__srcSound.addEventListener(ProgressEvent.PROGRESS,function(param1:ProgressEvent):void
            {
               promise.progress(int(param1.bytesLoaded),int(param1.bytesTotal));
            });
            audioBuffer.__srcSound.addEventListener(IOErrorEvent.IO_ERROR,promise.error);
         }
         else
         {
            promise.error(null);
         }
         return promise.future;
      }
      
      public static function loadFromFiles(param1:Array) : Future
      {
         var paths1:Array = param1;
         return new Future(function():AudioBuffer
         {
            return AudioBuffer.fromFiles(paths1);
         },true);
      }
      
      public static function __getCodec(param1:Bytes) : String
      {
         var _loc4_:* = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc3_:String = null;
         try
         {
            _loc3_ = param1.getString(0,4);
         }
         catch(_loc_e_:*)
         {
            var _loc5_:String = _loc3_;
            if(_loc5_ == "OggS")
            {
               return "audio/ogg";
            }
            if(_loc5_ == "RIFF")
            {
               if(param1.getString(8,4) == "WAVE")
               {
                  return "audio/wav";
               }
               _loc6_ = int(param1.b[1]);
               _loc7_ = int(param1.b[2]);
               switch(int(param1.b[0]))
               {
                  case 73:
                     if(_loc6_ == 68)
                     {
                        if(_loc7_ == 51)
                        {
                           return "audio/mp3";
                        }
                     }
                     break;
                  case 255:
                     switch(_loc6_)
                     {
                        case 243:
                        case 250:
                        case 251:
                           return "audio/mp3";
                     }
               }
            }
            else
            {
               if(_loc5_ == "fLaC")
               {
                  return "audio/flac";
               }
               _loc6_ = int(param1.b[1]);
               _loc7_ = int(param1.b[2]);
               switch(int(param1.b[0]))
               {
                  case 73:
                     if(_loc6_ == 68)
                     {
                        if(_loc7_ == 51)
                        {
                           return "audio/mp3";
                        }
                     }
                     break;
                  case 255:
                     switch(_loc6_)
                     {
                        case 243:
                        case 250:
                        case 251:
                           return "audio/mp3";
                     }
               }
            }
            Log.error("Unsupported sound format",{
               "fileName":"lime/media/AudioBuffer.hx",
               "lineNumber":450,
               "className":"lime.media.AudioBuffer",
               "methodName":"__getCodec"
            });
            return null;
         }
      }
      
      public function set_src(param1:*) : *
      {
         return __srcSound = param1;
      }
      
      public function get_src() : *
      {
         return __srcSound;
      }
      
      public function dispose() : void
      {
      }
   }
}

