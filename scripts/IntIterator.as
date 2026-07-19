package
{
   import flash.Boot;
   
   public class IntIterator
   {
      
      public var min:int;
      
      public var max:int;
      
      public function IntIterator(param1:int = 0, param2:int = 0)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         min = param1;
         max = param2;
      }
   }
}

