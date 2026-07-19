package flash.display._JointStyle
{
   public final class JointStyle_Impl_
   {
      
      public static var init__:Boolean;
      
      public static var MITER:String;
      
      public static var ROUND:String;
      
      public static var BEVEL:String;
      
      public function JointStyle_Impl_()
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
            return "bevel";
         }
         if(_loc2_ == 1)
         {
            return "miter";
         }
         if(_loc2_ == 2)
         {
            return "round";
         }
         return null;
      }
   }
}

