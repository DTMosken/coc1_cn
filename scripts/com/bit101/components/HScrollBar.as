package com.bit101.components
{
   import flash.Boot;
   import flash.display.DisplayObjectContainer;
   
   public class HScrollBar extends ScrollBar
   {
      
      public function HScrollBar(param1:DisplayObjectContainer = undefined, param2:Number = 0, param3:Number = 0, param4:Object = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super("horizontal",param1,param2,param3,param4);
      }
   }
}

