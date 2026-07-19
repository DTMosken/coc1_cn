package lime.system
{
   import flash.Boot;
   
   public class DisplayMode
   {
      
      public var width:int;
      
      public var refreshRate:int;
      
      public var pixelFormat:int;
      
      public var height:int;
      
      public function DisplayMode(param1:int = 0, param2:int = 0, param3:int = 0, param4:int = 0)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         width = param1;
         height = param2;
         refreshRate = param3;
         pixelFormat = param4;
      }
   }
}

