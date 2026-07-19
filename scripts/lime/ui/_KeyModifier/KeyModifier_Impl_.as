package lime.ui._KeyModifier
{
   public final class KeyModifier_Impl_
   {
      
      public static var init__:Boolean;
      
      public static var NONE:int;
      
      public static var LEFT_SHIFT:int;
      
      public static var RIGHT_SHIFT:int;
      
      public static var LEFT_CTRL:int;
      
      public static var RIGHT_CTRL:int;
      
      public static var LEFT_ALT:int;
      
      public static var RIGHT_ALT:int;
      
      public static var LEFT_META:int;
      
      public static var RIGHT_META:int;
      
      public static var NUM_LOCK:int;
      
      public static var CAPS_LOCK:int;
      
      public static var MODE:int;
      
      public static var CTRL:int;
      
      public static var SHIFT:int;
      
      public static var ALT:int;
      
      public static var META:int;
      
      public function KeyModifier_Impl_()
      {
      }
      
      public static function get_altKey(param1:int) : Boolean
      {
         if((param1 & 0x0100) <= 0)
         {
            return (param1 & 0x0200) > 0;
         }
         return true;
      }
      
      public static function set_altKey(param1:int, param2:Boolean) : Boolean
      {
         if(param2)
         {
            param1 |= 768;
         }
         else
         {
            param1 &= 268435455 - 768;
         }
         return param2;
      }
      
      public static function get_capsLock(param1:int) : Boolean
      {
         if((param1 & 0x2000) <= 0)
         {
            return (param1 & 0x2000) > 0;
         }
         return true;
      }
      
      public static function set_capsLock(param1:int, param2:Boolean) : Boolean
      {
         if(param2)
         {
            param1 |= 8192;
         }
         else
         {
            param1 &= 268435455 - 8192;
         }
         return param2;
      }
      
      public static function get_ctrlKey(param1:int) : Boolean
      {
         if((param1 & 0x40) <= 0)
         {
            return (param1 & 0x80) > 0;
         }
         return true;
      }
      
      public static function set_ctrlKey(param1:int, param2:Boolean) : Boolean
      {
         if(param2)
         {
            param1 |= 192;
         }
         else
         {
            param1 &= 268435455 - 192;
         }
         return param2;
      }
      
      public static function get_metaKey(param1:int) : Boolean
      {
         if((param1 & 0x0400) <= 0)
         {
            return (param1 & 0x0800) > 0;
         }
         return true;
      }
      
      public static function set_metaKey(param1:int, param2:Boolean) : Boolean
      {
         if(param2)
         {
            param1 |= 3072;
         }
         else
         {
            param1 &= 268435455 - 3072;
         }
         return param2;
      }
      
      public static function get_numLock(param1:int) : Boolean
      {
         if((param1 & 0x1000) <= 0)
         {
            return (param1 & 0x1000) > 0;
         }
         return true;
      }
      
      public static function set_numLock(param1:int, param2:Boolean) : Boolean
      {
         if(param2)
         {
            param1 |= 4096;
         }
         else
         {
            param1 &= 268435455 - 4096;
         }
         return param2;
      }
      
      public static function get_shiftKey(param1:int) : Boolean
      {
         if((param1 & 1) <= 0)
         {
            return (param1 & 2) > 0;
         }
         return true;
      }
      
      public static function set_shiftKey(param1:int, param2:Boolean) : Boolean
      {
         if(param2)
         {
            param1 |= 3;
         }
         else
         {
            param1 &= 268435455 - 3;
         }
         return param2;
      }
   }
}

