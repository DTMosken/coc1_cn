package motion.easing._Expo
{
   import motion.easing.IEasing;
   
   public class ExpoEaseIn implements IEasing
   {
      
      public function ExpoEaseIn()
      {
      }
      
      public function ease(param1:Number, param2:Number, param3:Number, param4:Number) : Number
      {
         if(param1 == 0)
         {
            return param2;
         }
         return param3 * Math.exp(6.931471805599453 * (param1 / param4 - 1)) + param2;
      }
      
      public function calculate(param1:Number) : Number
      {
         if(param1 == 0)
         {
            return 0;
         }
         return Math.exp(6.931471805599453 * (param1 - 1));
      }
   }
}

