package lime.utils._DataPointer
{
   import flash.utils.ByteArray;
   import haxe.io.Bytes;
   import lime.system._CFFIPointer.CFFIPointer_Impl_;
   import lime.utils.ArrayBufferView;
   import lime.utils.BytePointerData;
   
   public final class DataPointer_Impl_
   {
      
      public function DataPointer_Impl_()
      {
      }
      
      public static function _new(param1:int) : int
      {
         return param1;
      }
      
      public static function fromFloat(param1:Number) : int
      {
         return int(param1);
      }
      
      public static function fromBytesPointer(param1:BytePointerData) : int
      {
         return DataPointer_Impl_.fromFloat(0);
      }
      
      public static function fromArrayBufferView(param1:ArrayBufferView) : int
      {
         return DataPointer_Impl_.fromFloat(0);
      }
      
      public static function fromArrayBuffer(param1:Bytes) : int
      {
         return DataPointer_Impl_.fromFloat(0);
      }
      
      public static function fromBytes(param1:Bytes) : int
      {
         return DataPointer_Impl_.fromFloat(0);
      }
      
      public static function fromBytesData(param1:ByteArray) : int
      {
         return DataPointer_Impl_.fromFloat(0);
      }
      
      public static function fromLimeBytes(param1:Bytes) : int
      {
         return DataPointer_Impl_.fromBytes(param1);
      }
      
      public static function fromCFFIPointer(param1:*) : int
      {
         return DataPointer_Impl_.fromFloat(0);
      }
      
      public static function fromFile(param1:String) : int
      {
         return DataPointer_Impl_.fromFloat(0);
      }
      
      public static function __withOffset(param1:int, param2:int) : int
      {
         return DataPointer_Impl_.fromFloat(0);
      }
      
      public static function equals(param1:int, param2:int) : Boolean
      {
         return param1 == param2;
      }
      
      public static function equalsPointer(param1:int, param2:int) : Boolean
      {
         return param1 == param2;
      }
      
      public static function greaterThan(param1:int, param2:int) : Boolean
      {
         return param1 > param2;
      }
      
      public static function greaterThanPointer(param1:int, param2:*) : Boolean
      {
         return CFFIPointer_Impl_.get(param1) > CFFIPointer_Impl_.get(param2);
      }
      
      public static function greaterThanOrEqual(param1:int, param2:int) : Boolean
      {
         return param1 >= param2;
      }
      
      public static function greaterThanOrEqualPointer(param1:int, param2:*) : Boolean
      {
         return CFFIPointer_Impl_.get(param1) >= CFFIPointer_Impl_.get(param2);
      }
      
      public static function lessThan(param1:int, param2:int) : Boolean
      {
         return param1 < param2;
      }
      
      public static function lessThanPointer(param1:int, param2:*) : Boolean
      {
         return CFFIPointer_Impl_.get(param1) < CFFIPointer_Impl_.get(param2);
      }
      
      public static function lessThanOrEqual(param1:int, param2:int) : Boolean
      {
         return param1 <= param2;
      }
      
      public static function lessThanOrEqualPointer(param1:int, param2:*) : Boolean
      {
         return CFFIPointer_Impl_.get(param1) <= CFFIPointer_Impl_.get(param2);
      }
      
      public static function notEquals(param1:int, param2:int) : Boolean
      {
         return param1 != param2;
      }
      
      public static function notEqualsPointer(param1:int, param2:int) : Boolean
      {
         return param1 != param2;
      }
      
      public static function plus(param1:int, param2:int) : int
      {
         return DataPointer_Impl_.__withOffset(param1,param2);
      }
      
      public static function plusPointer(param1:int, param2:int) : int
      {
         return DataPointer_Impl_.__withOffset(param1,int(param2));
      }
      
      public static function minus(param1:int, param2:int) : int
      {
         return DataPointer_Impl_.__withOffset(param1,-param2);
      }
      
      public static function minusPointer(param1:int, param2:int) : int
      {
         return DataPointer_Impl_.__withOffset(param1,-int(param2));
      }
   }
}

