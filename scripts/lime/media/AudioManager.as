package lime.media
{
   public class AudioManager
   {
      
      public static var context:AudioContext;
      
      public function AudioManager()
      {
      }
      
      public static function init(param1:AudioContext = undefined) : void
      {
         var _loc2_:* = null as OpenALAudioContext;
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(AudioManager.context == null)
         {
            if(param1 == null)
            {
               AudioManager.context = new AudioContext();
               param1 = AudioManager.context;
               if(param1.type == "openal")
               {
                  _loc2_ = param1.openal;
                  _loc3_ = _loc2_.openDevice();
                  if(_loc3_ != null)
                  {
                     _loc4_ = _loc2_.createContext(_loc3_);
                     _loc2_.makeContextCurrent(_loc4_);
                     _loc2_.processContext(_loc4_);
                  }
               }
            }
            AudioManager.context = param1;
         }
      }
      
      public static function resume() : void
      {
         var _loc1_:* = null as OpenALAudioContext;
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(AudioManager.context != null && AudioManager.context.type == "openal")
         {
            _loc1_ = AudioManager.context.openal;
            _loc2_ = _loc1_.getCurrentContext();
            if(_loc2_ != null)
            {
               _loc3_ = _loc1_.getContextsDevice(_loc2_);
               _loc1_.resumeDevice(_loc3_);
               _loc1_.processContext(_loc2_);
            }
         }
      }
      
      public static function shutdown() : void
      {
         var _loc1_:* = null as OpenALAudioContext;
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(AudioManager.context != null && AudioManager.context.type == "openal")
         {
            _loc1_ = AudioManager.context.openal;
            _loc2_ = _loc1_.getCurrentContext();
            if(_loc2_ != null)
            {
               _loc3_ = _loc1_.getContextsDevice(_loc2_);
               _loc1_.makeContextCurrent(null);
               _loc1_.destroyContext(_loc2_);
               if(_loc3_ != null)
               {
                  _loc1_.closeDevice(_loc3_);
               }
            }
         }
         AudioManager.context = null;
      }
      
      public static function suspend() : void
      {
         var _loc1_:* = null as OpenALAudioContext;
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(AudioManager.context != null && AudioManager.context.type == "openal")
         {
            _loc1_ = AudioManager.context.openal;
            _loc2_ = _loc1_.getCurrentContext();
            if(_loc2_ != null)
            {
               _loc1_.suspendContext(_loc2_);
               _loc3_ = _loc1_.getContextsDevice(_loc2_);
               if(_loc3_ != null)
               {
                  _loc1_.pauseDevice(_loc3_);
               }
            }
         }
      }
   }
}

