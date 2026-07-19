package coc.view._Color
{
   import flash.Boot;
   
   public class HSLColor
   {
      
      public var s:Number;
      
      public var l:Number;
      
      public var h:Number;
      
      public var a:Object;
      
      public function HSLColor(param1:Number = 0, param2:Number = 0, param3:Number = 0, param4:Object = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         h = param1;
         s = param2;
         l = param3;
         a = param4;
      }
   }
}

