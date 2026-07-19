package lime.graphics.cairo
{
   import flash.Boot;
   
   public class CairoGlyph
   {
      
      public var y:Number;
      
      public var x:Number;
      
      public var index:int;
      
      public function CairoGlyph(param1:int = 0, param2:Number = 0, param3:Number = 0)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         index = param1;
         x = param2;
         y = param3;
      }
   }
}

