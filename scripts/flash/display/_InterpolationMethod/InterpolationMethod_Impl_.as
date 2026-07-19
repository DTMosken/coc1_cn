package flash.display._InterpolationMethod
{
   public final class InterpolationMethod_Impl_
   {
      
      public static var init__:Boolean;
      
      public static var LINEAR_RGB:String;
      
      public static var RGB:String;
      
      public function InterpolationMethod_Impl_()
      {
      }
      
      public static function fromInt(param1:Object) : String
      {
         var _loc2_:* = null as Object;
         if(param1 == null)
         {
            return null;
         }
         _loc2_ = param1;
         if(_loc2_ == 0)
         {
            return "linearRGB";
         }
         if(_loc2_ == 1)
         {
            return "rgb";
         }
         return null;
      }
   }
}

