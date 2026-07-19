package motion._Actuate
{
   import flash.Boot;
   
   public class TweenTimer
   {
      
      public var progress:Number;
      
      public function TweenTimer(param1:Number = 0)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         progress = param1;
      }
   }
}

