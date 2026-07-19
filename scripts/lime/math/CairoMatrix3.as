package lime.math
{
   import flash.Boot;
   
   public class CairoMatrix3
   {
      
      public var ty:Number;
      
      public var tx:Number;
      
      public var d:Number;
      
      public var c:Number;
      
      public var b:Number;
      
      public var a:Number;
      
      public function CairoMatrix3(param1:Number = 1, param2:Number = 0, param3:Number = 0, param4:Number = 1, param5:Number = 0, param6:Number = 0)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         a = param1;
         b = param2;
         c = param3;
         d = param4;
         tx = param5;
         ty = param6;
      }
   }
}

