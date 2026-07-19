package flash.display._SpreadMethod
{
   public final class SpreadMethod_Impl_
   {
      
      public static var init__:Boolean;
      
      public static var PAD:String;
      
      public static var REFLECT:String;
      
      public static var REPEAT:String;
      
      public function SpreadMethod_Impl_()
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
            return "pad";
         }
         if(_loc2_ == 1)
         {
            return "reflect";
         }
         if(_loc2_ == 2)
         {
            return "repeat";
         }
         return null;
      }
   }
}

