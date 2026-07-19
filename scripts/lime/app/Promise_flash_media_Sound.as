package lime.app
{
   import flash.media.Sound;
   
   public class Promise_flash_media_Sound
   {
      
      public var future:Future = new Future();
      
      public function Promise_flash_media_Sound()
      {
      }
      
      public function progress(param1:int, param2:int) : Promise_flash_media_Sound
      {
         var _loc3_:int = 0;
         var _loc4_:* = null as Array;
         var _loc5_:* = null as Function;
         if(!future.isError && !future.isComplete)
         {
            if(future.__progressListeners != null)
            {
               _loc3_ = 0;
               _loc4_ = future.__progressListeners;
               while(_loc3_ < int(_loc4_.length))
               {
                  _loc5_ = _loc4_[_loc3_];
                  _loc3_++;
                  _loc5_(param1,param2);
               }
            }
         }
         return this;
      }
      
      public function get_isError() : Boolean
      {
         return future.isError;
      }
      
      public function get_isComplete() : Boolean
      {
         return future.isComplete;
      }
      
      public function error(param1:*) : Promise_flash_media_Sound
      {
         var _loc2_:int = 0;
         var _loc3_:* = null as Array;
         var _loc4_:* = null as Function;
         if(!future.isComplete)
         {
            future.isError = true;
            future.error = param1;
            if(future.__errorListeners != null)
            {
               _loc2_ = 0;
               _loc3_ = future.__errorListeners;
               while(_loc2_ < int(_loc3_.length))
               {
                  _loc4_ = _loc3_[_loc2_];
                  _loc2_++;
                  _loc4_(param1);
               }
               future.__errorListeners = null;
            }
         }
         return this;
      }
      
      public function completeWith(param1:Future) : Promise_flash_media_Sound
      {
         param1.onComplete(complete);
         param1.onError(error);
         param1.onProgress(progress);
         return this;
      }
      
      public function complete(param1:Sound) : Promise_flash_media_Sound
      {
         var _loc2_:int = 0;
         var _loc3_:* = null as Array;
         var _loc4_:* = null as Function;
         if(!future.isError)
         {
            future.isComplete = true;
            future.value = param1;
            if(future.__completeListeners != null)
            {
               _loc2_ = 0;
               _loc3_ = future.__completeListeners;
               while(_loc2_ < int(_loc3_.length))
               {
                  _loc4_ = _loc3_[_loc2_];
                  _loc2_++;
                  _loc4_(param1);
               }
               future.__completeListeners = null;
            }
         }
         return this;
      }
   }
}

