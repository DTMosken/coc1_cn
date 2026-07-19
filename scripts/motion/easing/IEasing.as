package motion.easing
{
   public interface IEasing
   {
      
      function ease(param1:Number, param2:Number, param3:Number, param4:Number) : Number;
      
      function calculate(param1:Number) : Number;
   }
}

