package classes.internals._ValueFunc
{
   public final class NumberFunc_Impl_
   {
      
      public function NumberFunc_Impl_()
      {
      }
      
      public static function _new(param1:Function) : Function
      {
         return param1;
      }
      
      public static function resolve(param1:Function) : Number
      {
         return Number(param1());
      }
      
      public static function fromFloat(param1:Number) : Function
      {
         var value:Number = param1;
         return NumberFunc_Impl_._new(function():Number
         {
            return value;
         });
      }
      
      public static function fromInt(param1:int) : Function
      {
         var value:int = param1;
         return NumberFunc_Impl_._new(function():Number
         {
            return value;
         });
      }
      
      public static function fromFloatFun(param1:Function) : Function
      {
         return NumberFunc_Impl_._new(param1);
      }
      
      public static function fromIntFun(param1:Function) : Function
      {
         return NumberFunc_Impl_._new(param1);
      }
   }
}

