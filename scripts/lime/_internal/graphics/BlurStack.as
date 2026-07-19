package lime._internal.graphics
{
   import flash.Boot;
   
   public class BlurStack
   {
      
      public var r:int;
      
      public var n:BlurStack;
      
      public var g:int;
      
      public var b:int;
      
      public var a:int;
      
      public function BlurStack()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         r = 0;
         g = 0;
         b = 0;
         a = 0;
         n = null;
      }
   }
}

