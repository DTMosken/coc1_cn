package classes.internals._ValueFunc
{
   public final class ValueFunc_Impl_
   {
      
      public function ValueFunc_Impl_()
      {
      }
      
      public static function _new(param1:Function) : Function
      {
         return param1;
      }
      
      public static function fromT(param1:Object) : Function
      {
         var value:Object = param1;
         return ValueFunc_Impl_._new(function():Object
         {
            return value;
         });
      }
      
      public static function resolve(param1:Function) : Object
      {
         return param1();
      }
   }
}

