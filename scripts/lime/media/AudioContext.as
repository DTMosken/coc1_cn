package lime.media
{
   import flash.Boot;
   
   public class AudioContext
   {
      
      public var web:WebAudioContext;
      
      public var type:String;
      
      public var openal:OpenALAudioContext;
      
      public var html5:HTML5AudioContext;
      
      public var flash:FlashAudioContext;
      
      public var custom:*;
      
      public function AudioContext(param1:String = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         if(param1 != "custom")
         {
            flash = new FlashAudioContext();
            type = "flash";
         }
         else
         {
            type = "custom";
         }
      }
   }
}

