package flash.display._GradientType
{
   public final class GradientType_Impl_
   {
      
      public static var init__:Boolean;
      
      public static var LINEAR:String;
      
      public static var RADIAL:String;
      
      public function GradientType_Impl_()
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
            return "linear";
         }
         if(_loc2_ == 1)
         {
            return "radial";
         }
         return null;
      }
   }
}

