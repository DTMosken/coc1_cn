package format.jpg._Writer
{
   import flash.Boot;
   
   public class BitString
   {
      
      public var val:int;
      
      public var len:int;
      
      public function BitString(param1:int = 0, param2:int = 0)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         len = param1;
         val = param2;
      }
   }
}

