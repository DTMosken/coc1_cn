package lime.ui._JoystickHatPosition
{
   public final class JoystickHatPosition_Impl_
   {
      
      public static var init__:Boolean;
      
      public static var CENTER:int;
      
      public static var DOWN:int;
      
      public static var LEFT:int;
      
      public static var RIGHT:int;
      
      public static var UP:int;
      
      public static var DOWN_LEFT:int;
      
      public static var DOWN_RIGHT:int;
      
      public static var UP_LEFT:int;
      
      public static var UP_RIGHT:int;
      
      public function JoystickHatPosition_Impl_()
      {
      }
      
      public static function _new(param1:int) : int
      {
         return param1;
      }
      
      public static function get_center(param1:int) : Boolean
      {
         return param1 == 0;
      }
      
      public static function set_center(param1:int, param2:Boolean) : Boolean
      {
         if(param2)
         {
            param1 = 0;
         }
         return param2;
      }
      
      public static function get_down(param1:int) : Boolean
      {
         return (param1 & 4) > 0;
      }
      
      public static function set_down(param1:int, param2:Boolean) : Boolean
      {
         if(param2)
         {
            param1 |= 4;
         }
         else
         {
            param1 &= 268435455 - 4;
         }
         return param2;
      }
      
      public static function get_left(param1:int) : Boolean
      {
         return (param1 & 8) > 0;
      }
      
      public static function set_left(param1:int, param2:Boolean) : Boolean
      {
         if(param2)
         {
            param1 |= 8;
         }
         else
         {
            param1 &= 268435455 - 8;
         }
         return param2;
      }
      
      public static function get_right(param1:int) : Boolean
      {
         return (param1 & 2) > 0;
      }
      
      public static function set_right(param1:int, param2:Boolean) : Boolean
      {
         if(param2)
         {
            param1 |= 2;
         }
         else
         {
            param1 &= 268435455 - 2;
         }
         return param2;
      }
      
      public static function get_up(param1:int) : Boolean
      {
         return (param1 & 1) > 0;
      }
      
      public static function set_up(param1:int, param2:Boolean) : Boolean
      {
         if(param2)
         {
            param1 |= 1;
         }
         else
         {
            param1 &= 268435455 - 1;
         }
         return param2;
      }
   }
}

