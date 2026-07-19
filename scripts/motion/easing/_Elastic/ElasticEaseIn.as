package motion.easing._Elastic
{
   import flash.Boot;
   import motion.easing.IEasing;
   
   public class ElasticEaseIn implements IEasing
   {
      
      public var p:Number;
      
      public var a:Number;
      
      public function ElasticEaseIn(param1:Number = 0, param2:Number = 0)
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
         param1 /= param4;
         if(param1 == 1)
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
         return -(a * Math.exp(6.931471805599453 * --param1) * Math.sin((param1 * param4 - _loc5_) * (2 * Math.PI) / p)) + param2;
      }
      
      public function calculate(param1:Number) : Number
      {
         var _loc2_:Number = NaN;
         if(param1 == 0)
         {
            return 0;
         }
         if(param1 == 1)
         {
            return 1;
         }
         if(a < 1)
         {
            a = 1;
            _loc2_ = p / 4;
         }
         else
         {
            _loc2_ = p / (2 * Math.PI) * Math.asin(1 / a);
         }
         return -(a * Math.exp(6.931471805599453 * --param1) * Math.sin((param1 - _loc2_) * (2 * Math.PI) / p));
      }
   }
}

