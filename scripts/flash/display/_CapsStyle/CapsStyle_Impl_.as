package flash.display._CapsStyle
{
   public final class CapsStyle_Impl_
   {
      
      public static var init__:Boolean;
      
      public static var NONE:String;
      
      public static var ROUND:String;
      
      public static var SQUARE:String;
      
      public function CapsStyle_Impl_()
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
            return "none";
         }
         if(_loc2_ == 1)
         {
            return "round";
         }
         if(_loc2_ == 2)
         {
            return "square";
         }
         return null;
      }
   }
}

