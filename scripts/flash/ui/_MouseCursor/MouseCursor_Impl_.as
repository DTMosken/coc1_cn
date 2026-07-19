package flash.ui._MouseCursor
{
   import lime.ui.MouseCursor;
   
   public final class MouseCursor_Impl_
   {
      
      public static var init__:Boolean;
      
      public static var ARROW:String;
      
      public static var AUTO:String;
      
      public static var BUTTON:String;
      
      public static var HAND:String;
      
      public static var IBEAM:String;
      
      public function MouseCursor_Impl_()
      {
      }
      
      public static function fromLimeCursor(param1:MouseCursor) : String
      {
         switch(param1.index)
         {
            case 0:
               return "arrow";
            case 2:
               return "auto";
            case 3:
               return "hand";
            case 4:
               return "button";
            case 9:
               return "ibeam";
            default:
               return "auto";
         }
      }
   }
}

