package flash.display._LineScaleMode
{
   public final class LineScaleMode_Impl_
   {
      
      public static var init__:Boolean;
      
      public static var HORIZONTAL:String;
      
      public static var NONE:String;
      
      public static var NORMAL:String;
      
      public static var VERTICAL:String;
      
      public function LineScaleMode_Impl_()
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
            return "horizontal";
         }
         if(_loc2_ == 1)
         {
            return "none";
         }
         if(_loc2_ == 2)
         {
            return "normal";
         }
         if(_loc2_ == 3)
         {
            return "vertical";
         }
         return null;
      }
   }
}

