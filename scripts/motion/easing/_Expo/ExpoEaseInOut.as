package motion.easing._Expo
{
   import motion.easing.IEasing;
   
   public class ExpoEaseInOut implements IEasing
   {
      
      public function ExpoEaseInOut()
      {
      }
      
      public function ease(param1:Number, param2:Number, param3:Number, param4:Number) : Number
      {
         if(param1 == 0)
         {
            return param2;
         }
         if(param1 == param4)
         {
            return param2 + param3;
         }
         param1 /= param4 / 2;
         if(param1 < 1)
         {
            return param3 / 2 * Math.exp(6.931471805599453 * (param1 - 1)) + param2;
         }
         return param3 / 2 * (2 - Math.exp(-6.931471805599453 * --param1)) + param2;
      }
      
      public function calculate(param1:Number) : Number
      {
         if(param1 == 0)
         {
            return 0;
         }
         if(param1 == 1)
         {
            return 1;
         }
         param1 /= 0.5;
         if(param1 < 1)
         {
            return 0.5 * Math.exp(6.931471805599453 * (param1 - 1));
         }
         return 0.5 * (2 - Math.exp(-6.931471805599453 * --param1));
      }
   }
}

