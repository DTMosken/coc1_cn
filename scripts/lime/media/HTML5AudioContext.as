package lime.media
{
   import flash.Boot;
   
   public class HTML5AudioContext
   {
      
      public var NETWORK_NO_SOURCE:int;
      
      public var NETWORK_LOADING:int;
      
      public var NETWORK_IDLE:int;
      
      public var NETWORK_EMPTY:int;
      
      public var HAVE_NOTHING:int;
      
      public var HAVE_METADATA:int;
      
      public var HAVE_FUTURE_DATA:int;
      
      public var HAVE_ENOUGH_DATA:int;
      
      public var HAVE_CURRENT_DATA:int;
      
      public function HTML5AudioContext()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         NETWORK_NO_SOURCE = 3;
         NETWORK_LOADING = 2;
         NETWORK_IDLE = 1;
         NETWORK_EMPTY = 0;
         HAVE_NOTHING = 0;
         HAVE_METADATA = 1;
         HAVE_FUTURE_DATA = 3;
         HAVE_ENOUGH_DATA = 4;
         HAVE_CURRENT_DATA = 2;
      }
      
      public function setVolume(param1:AudioBuffer, param2:Number) : void
      {
      }
      
      public function setSrc(param1:AudioBuffer, param2:String) : void
      {
      }
      
      public function setPreload(param1:AudioBuffer, param2:String) : void
      {
      }
      
      public function setPlaybackRate(param1:AudioBuffer, param2:Number) : void
      {
      }
      
      public function setMuted(param1:AudioBuffer, param2:Boolean) : void
      {
      }
      
      public function setLoop(param1:AudioBuffer, param2:Boolean) : void
      {
      }
      
      public function setDefaultPlaybackRate(param1:AudioBuffer, param2:Number) : void
      {
      }
      
      public function setCurrentTime(param1:AudioBuffer, param2:Number) : void
      {
      }
      
      public function setAutoplay(param1:AudioBuffer, param2:Boolean) : void
      {
      }
      
      public function play(param1:AudioBuffer) : void
      {
      }
      
      public function pause(param1:AudioBuffer) : void
      {
      }
      
      public function load(param1:AudioBuffer) : void
      {
      }
      
      public function getVolume(param1:AudioBuffer) : Number
      {
         return 1;
      }
      
      public function getStartTime(param1:AudioBuffer) : Number
      {
         return 0;
      }
      
      public function getSrc(param1:AudioBuffer) : String
      {
         return null;
      }
      
      public function getSeeking(param1:AudioBuffer) : Boolean
      {
         return false;
      }
      
      public function getSeekable(param1:AudioBuffer) : *
      {
         return null;
      }
      
      public function getReadyState(param1:AudioBuffer) : int
      {
         return 0;
      }
      
      public function getPreload(param1:AudioBuffer) : String
      {
         return null;
      }
      
      public function getPlayed(param1:AudioBuffer) : *
      {
         return null;
      }
      
      public function getPlaybackRate(param1:AudioBuffer) : Number
      {
         return 1;
      }
      
      public function getPaused(param1:AudioBuffer) : Boolean
      {
         return false;
      }
      
      public function getNetworkState(param1:AudioBuffer) : int
      {
         return 0;
      }
      
      public function getMuted(param1:AudioBuffer) : Boolean
      {
         return false;
      }
      
      public function getLoop(param1:AudioBuffer) : Boolean
      {
         return false;
      }
      
      public function getError(param1:AudioBuffer) : *
      {
         return null;
      }
      
      public function getEnded(param1:AudioBuffer) : Boolean
      {
         return false;
      }
      
      public function getDuration(param1:AudioBuffer) : Number
      {
         return 0;
      }
      
      public function getDefaultPlaybackRate(param1:AudioBuffer) : Number
      {
         return 1;
      }
      
      public function getCurrentTime(param1:AudioBuffer) : Number
      {
         return 0;
      }
      
      public function getCurrentSrc(param1:AudioBuffer) : String
      {
         return null;
      }
      
      public function getBuffered(param1:AudioBuffer) : *
      {
         return null;
      }
      
      public function getAutoplay(param1:AudioBuffer) : Boolean
      {
         return false;
      }
      
      public function createBuffer(param1:String = undefined) : AudioBuffer
      {
         return null;
      }
      
      public function canPlayType(param1:AudioBuffer, param2:String) : String
      {
         return null;
      }
   }
}

