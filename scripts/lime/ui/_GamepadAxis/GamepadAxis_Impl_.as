package lime.ui._GamepadAxis
{
   public final class GamepadAxis_Impl_
   {
      
      public static var init__:Boolean;
      
      public static var LEFT_X:int;
      
      public static var LEFT_Y:int;
      
      public static var RIGHT_X:int;
      
      public static var RIGHT_Y:int;
      
      public static var TRIGGER_LEFT:int;
      
      public static var TRIGGER_RIGHT:int;
      
      public function GamepadAxis_Impl_()
      {
      }
      
      public static function toString(param1:int) : String
      {
         switch(param1)
         {
            case 0:
               return "LEFT_X";
            case 1:
               return "LEFT_Y";
            case 2:
               return "RIGHT_X";
            case 3:
               return "RIGHT_Y";
            case 4:
               return "TRIGGER_LEFT";
            case 5:
               return "TRIGGER_RIGHT";
            default:
               return "UNKNOWN (" + param1 + ")";
         }
      }
   }
}

