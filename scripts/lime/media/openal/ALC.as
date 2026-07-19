package lime.media.openal
{
   public class ALC
   {
      
      public static var FALSE:int = 0;
      
      public static var TRUE:int = 1;
      
      public static var FREQUENCY:int = 4103;
      
      public static var REFRESH:int = 4104;
      
      public static var SYNC:int = 4105;
      
      public static var MONO_SOURCES:int = 4112;
      
      public static var STEREO_SOURCES:int = 4113;
      
      public static var NO_ERROR:int = 0;
      
      public static var INVALID_DEVICE:int = 40961;
      
      public static var INVALID_CONTEXT:int = 40962;
      
      public static var INVALID_ENUM:int = 40963;
      
      public static var INVALID_VALUE:int = 40964;
      
      public static var OUT_OF_MEMORY:int = 40965;
      
      public static var ATTRIBUTES_SIZE:int = 4098;
      
      public static var ALL_ATTRIBUTES:int = 4099;
      
      public static var DEFAULT_DEVICE_SPECIFIER:int = 4100;
      
      public static var DEVICE_SPECIFIER:int = 4101;
      
      public static var EXTENSIONS:int = 4102;
      
      public static var ENUMERATE_ALL_EXT:int = 1;
      
      public static var DEFAULT_ALL_DEVICES_SPECIFIER:int = 4114;
      
      public static var ALL_DEVICES_SPECIFIER:int = 4115;
      
      public function ALC()
      {
      }
      
      public static function closeDevice(param1:*) : Boolean
      {
         return false;
      }
      
      public static function createContext(param1:*, param2:Array = undefined) : *
      {
         return null;
      }
      
      public static function destroyContext(param1:*) : void
      {
      }
      
      public static function getContextsDevice(param1:*) : *
      {
         return null;
      }
      
      public static function getCurrentContext() : *
      {
         return null;
      }
      
      public static function getError(param1:*) : int
      {
         return 0;
      }
      
      public static function getErrorString(param1:*) : String
      {
         var _loc2_:int = ALC.getError(param1);
         if(_loc2_ == 40961)
         {
            return "INVALID_DEVICE: Invalid device (or no device?)";
         }
         if(_loc2_ == 40962)
         {
            return "INVALID_CONTEXT: Invalid context (or no context?)";
         }
         if(_loc2_ == 40963)
         {
            return "INVALID_ENUM: Invalid enum value";
         }
         if(_loc2_ == 40964)
         {
            return "INVALID_VALUE: Invalid param value";
         }
         if(_loc2_ == 40965)
         {
            return "OUT_OF_MEMORY: OpenAL has run out of memory";
         }
         return "";
      }
      
      public static function getIntegerv(param1:*, param2:int, param3:int) : Array
      {
         return null;
      }
      
      public static function getString(param1:*, param2:int) : String
      {
         return null;
      }
      
      public static function makeContextCurrent(param1:*) : Boolean
      {
         return false;
      }
      
      public static function openDevice(param1:String = undefined) : *
      {
         return null;
      }
      
      public static function pauseDevice(param1:*) : void
      {
      }
      
      public static function processContext(param1:*) : void
      {
      }
      
      public static function resumeDevice(param1:*) : void
      {
      }
      
      public static function suspendContext(param1:*) : void
      {
      }
   }
}

