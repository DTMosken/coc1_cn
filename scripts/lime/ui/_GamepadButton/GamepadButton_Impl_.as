package lime.ui._GamepadButton
{
   public final class GamepadButton_Impl_
   {
      
      public static var init__:Boolean;
      
      public static var A:int;
      
      public static var B:int;
      
      public static var X:int;
      
      public static var Y:int;
      
      public static var BACK:int;
      
      public static var GUIDE:int;
      
      public static var START:int;
      
      public static var LEFT_STICK:int;
      
      public static var RIGHT_STICK:int;
      
      public static var LEFT_SHOULDER:int;
      
      public static var RIGHT_SHOULDER:int;
      
      public static var DPAD_UP:int;
      
      public static var DPAD_DOWN:int;
      
      public static var DPAD_LEFT:int;
      
      public static var DPAD_RIGHT:int;
      
      public function GamepadButton_Impl_()
      {
      }
      
      public static function toString(param1:int) : String
      {
         switch(param1)
         {
            case 0:
               return "A";
            case 1:
               return "B";
            case 2:
               return "X";
            case 3:
               return "Y";
            case 4:
               return "BACK";
            case 5:
               return "GUIDE";
            case 6:
               return "START";
            case 7:
               return "LEFT_STICK";
            case 8:
               return "RIGHT_STICK";
            case 9:
               return "LEFT_SHOULDER";
            case 10:
               return "RIGHT_SHOULDER";
            case 11:
               return "DPAD_UP";
            case 12:
               return "DPAD_DOWN";
            case 13:
               return "DPAD_LEFT";
            case 14:
               return "DPAD_RIGHT";
            default:
               return "UNKNOWN (" + param1 + ")";
         }
      }
   }
}

