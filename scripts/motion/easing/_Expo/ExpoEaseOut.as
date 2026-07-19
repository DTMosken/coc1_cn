package motion.easing._Expo
{
   import motion.easing.IEasing;
   
   public class ExpoEaseOut implements IEasing
   {
      
      public function ExpoEaseOut()
      {
      }
      
      public function ease(param1:Number, param2:Number, param3:Number, param4:Number) : Number
      {
         if(param1 == param4)
         {
            return param2 + param3;
         }
         return param3 * (1 - Math.exp(-6.931471805599453 * param1 / param4)) + param2;
      }
      
      public function calculate(param1:Number) : Number
      {
         if(param1 == 1)
         {
            return 1;
         }
         return 1 - Math.exp(-6.931471805599453 * param1);
      }
   }
}

