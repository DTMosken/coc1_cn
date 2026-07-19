package classes.internals._OneOf
{
   import haxe.ds.Either;
   
   public final class OneOf_Impl_
   {
      
      public function OneOf_Impl_()
      {
      }
      
      public static function _new(param1:Either) : Either
      {
         return param1;
      }
      
      public static function fromA(param1:Object) : Either
      {
         return Either.Left(param1);
      }
      
      public static function fromB(param1:Object) : Either
      {
         return Either.Right(param1);
      }
   }
}

