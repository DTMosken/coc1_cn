package motion.easing._Elastic
{
   import flash.Boot;
   import motion.easing.IEasing;
   
   public class ElasticEaseInOut implements IEasing
   {
      
      public var p:Number;
      
      public var a:Number;
      
      public function ElasticEaseInOut(param1:Number = 0, param2:Number = 0)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         a = param1;
         p = param2;
      }
      
      public function ease(param1:Number, param2:Number, param3:Number, param4:Number) : Number
      {
         var _loc5_:Number = NaN;
         if(param1 == 0)
         {
            return param2;
         }
         param1 /= param4 / 2;
         if(param1 == 2)
         {
            return param2 + param3;
         }
         if(a < Math.abs(param3))
         {
            a = param3;
            _loc5_ = p / 4;
         }
         else
         {
            _loc5_ = p / (2 * Math.PI) * Math.asin(param3 / a);
         }
         if(param1 < 1)
         {
            return -0.5 * (a * Math.exp(6.931471805599453 * --param1) * Math.sin((param1 * param4 - _loc5_) * (2 * Math.PI) / p)) + param2;
         }
         return a * Math.exp(-6.931471805599453 * --param1) * Math.sin((param1 * param4 - _loc5_) * (2 * Math.PI) / p) * 0.5 + param3 + param2;
      }
      
      public function calculate(param1:Number) : Number
      {
         if(param1 == 0)
         {
            return 0;
         }
         param1 /= 0.5;
         if(param1 == 2)
         {
            return 1;
         }
         var _loc2_:Number = 0.44999999999999996;
         var _loc3_:Number = 1;
         var _loc4_:Number = _loc2_ / 4;
         if(param1 < 1)
         {
            return -0.5 * (Math.exp(6.931471805599453 * --param1) * Math.sin((param1 - _loc4_) * (2 * Math.PI) / _loc2_));
         }
         return Math.exp(-6.931471805599453 * --param1) * Math.sin((param1 - _loc4_) * (2 * Math.PI) / _loc2_) * 0.5 + 1;
      }
   }
}

