package lime.system._CFFIPointer
{
   public final class CFFIPointer_Impl_
   {
      
      public function CFFIPointer_Impl_()
      {
      }
      
      public static function _new(param1:*) : *
      {
         return param1;
      }
      
      public static function get(param1:*) : Number
      {
         var _loc2_:Boolean = param1 != null;
         return 0;
      }
      
      public static function equals(param1:*, param2:int) : Boolean
      {
         return CFFIPointer_Impl_.get(param1) == param2;
      }
      
      public static function equalsPointer(param1:*, param2:*) : Boolean
      {
         return CFFIPointer_Impl_.get(param1) == CFFIPointer_Impl_.get(param2);
      }
      
      public static function greaterThan(param1:*, param2:int) : Boolean
      {
         return CFFIPointer_Impl_.get(param1) > param2;
      }
      
      public static function greaterThanPointer(param1:*, param2:*) : Boolean
      {
         return CFFIPointer_Impl_.get(param1) > CFFIPointer_Impl_.get(param2);
      }
      
      public static function greaterThanOrEqual(param1:*, param2:int) : Boolean
      {
         return CFFIPointer_Impl_.get(param1) >= param2;
      }
      
      public static function greaterThanOrEqualPointer(param1:*, param2:*) : Boolean
      {
         return CFFIPointer_Impl_.get(param1) >= CFFIPointer_Impl_.get(param2);
      }
      
      public static function lessThan(param1:*, param2:int) : Boolean
      {
         return CFFIPointer_Impl_.get(param1) < param2;
      }
      
      public static function lessThanPointer(param1:*, param2:*) : Boolean
      {
         return CFFIPointer_Impl_.get(param1) < CFFIPointer_Impl_.get(param2);
      }
      
      public static function lessThanOrEqual(param1:*, param2:int) : Boolean
      {
         return CFFIPointer_Impl_.get(param1) <= param2;
      }
      
      public static function lessThanOrEqualPointer(param1:*, param2:*) : Boolean
      {
         return CFFIPointer_Impl_.get(param1) <= CFFIPointer_Impl_.get(param2);
      }
      
      public static function notEquals(param1:*, param2:int) : Boolean
      {
         return CFFIPointer_Impl_.get(param1) != param2;
      }
      
      public static function notEqualsPointer(param1:*, param2:*) : Boolean
      {
         return CFFIPointer_Impl_.get(param1) != CFFIPointer_Impl_.get(param2);
      }
   }
}

