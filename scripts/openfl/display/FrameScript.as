package openfl.display
{
   import flash.Boot;
   
   public final class FrameScript
   {
      
      public var script:Function;
      
      public var frame:int;
      
      public function FrameScript(param1:Function = undefined, param2:int = 0)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         script = param1;
         frame = param2;
      }
   }
}

