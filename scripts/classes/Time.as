package classes
{
   import flash.Boot;
   
   public class Time
   {
      
      public var minutes:int;
      
      public var hours:int;
      
      public var days:int;
      
      public function Time()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         minutes = 0;
         hours = 0;
         days = 0;
      }
      
      public function isTimeBetween(param1:Number, param2:Number) : Boolean
      {
         var _loc3_:Number = hours + minutes / 60;
         if(param2 > param1)
         {
            if(_loc3_ >= param1)
            {
               return _loc3_ <= param2;
            }
            return false;
         }
         if(_loc3_ < param1)
         {
            return _loc3_ <= param2;
         }
         return true;
      }
      
      public function isNight() : Boolean
      {
         if(hours >= 6)
         {
            return hours > 20;
         }
         return true;
      }
      
      public function isDay() : Boolean
      {
         if(hours > 5)
         {
            return hours < 21;
         }
         return false;
      }
      
      public function get_totalTime() : Number
      {
         return days * 24 + hours;
      }
   }
}

