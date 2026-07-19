package motion.easing
{
   import motion.easing._Elastic.ElasticEaseIn;
   import motion.easing._Elastic.ElasticEaseInOut;
   import motion.easing._Elastic.ElasticEaseOut;
   
   public class Elastic
   {
      
      public static var init__:Boolean;
      
      public static var easeIn:IEasing;
      
      public static var easeInOut:IEasing;
      
      public static var easeOut:IEasing;
      
      public function Elastic()
      {
      }
      
      public static function easeInWith(param1:Number, param2:Number) : IEasing
      {
         return new ElasticEaseIn(param1,param2);
      }
      
      public static function easeInOutWith(param1:Number, param2:Number) : IEasing
      {
         return new ElasticEaseInOut(param1,param2);
      }
      
      public static function easeOutWith(param1:Number, param2:Number) : IEasing
      {
         return new ElasticEaseOut(param1,param2);
      }
   }
}

