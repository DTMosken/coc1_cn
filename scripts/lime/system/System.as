package lime.system
{
   import flash.Lib;
   import flash.net.URLRequest;
   import flash.system.Capabilities;
   import flash.utils.getTimer;
   import haxe.IMap;
   import haxe.ds.StringMap;
   import lime.app.Application;
   import lime.math.Rectangle;
   
   public class System
   {
      
      public static var init__:Boolean;
      
      public static var disableCFFI:Boolean;
      
      public static var __applicationDirectory:String;
      
      public static var __applicationEntryPoint:IMap;
      
      public static var __applicationStorageDirectory:String;
      
      public static var __desktopDirectory:String;
      
      public static var __deviceModel:String;
      
      public static var __deviceVendor:String;
      
      public static var __directories:IMap;
      
      public static var __documentsDirectory:String;
      
      public static var __endianness:Endian;
      
      public static var __fontsDirectory:String;
      
      public static var __platformLabel:String;
      
      public static var __platformName:String;
      
      public static var __platformVersion:String;
      
      public static var __userDirectory:String;
      
      public function System()
      {
      }
      
      public static function exit(param1:int) : void
      {
         var _loc2_:Application = Application.current;
      }
      
      public static function getDisplay(param1:int) : Display
      {
         var _loc2_:* = null as Display;
         if(param1 == 0)
         {
            _loc2_ = new Display();
            _loc2_.id = 0;
            _loc2_.name = "Generic Display";
            _loc2_.dpi = Capabilities.screenDPI;
            _loc2_.currentMode = new DisplayMode(int(Capabilities.screenResolutionX),int(Capabilities.screenResolutionY),60,1);
            _loc2_.orientation = 0;
            _loc2_.supportedModes = [_loc2_.currentMode];
            _loc2_.bounds = new Rectangle(0,0,_loc2_.currentMode.width,_loc2_.currentMode.height);
            _loc2_.safeArea = new Rectangle(0,0,_loc2_.currentMode.width,_loc2_.currentMode.height);
            return _loc2_;
         }
         return null;
      }
      
      public static function getTimer() : int
      {
         return getTimer();
      }
      
      public static function load(param1:String, param2:String, param3:int = 0, param4:Boolean = false) : *
      {
         return CFFI.load(param1,param2,param3,param4);
      }
      
      public static function openFile(param1:String) : void
      {
         if(param1 != null)
         {
            Lib.getURL(new URLRequest(param1),"_blank");
         }
      }
      
      public static function openURL(param1:String, param2:String = undefined) : void
      {
         if(param2 == null)
         {
            param2 = "_blank";
         }
         if(param1 != null)
         {
            Lib.getURL(new URLRequest(param1),param2);
         }
      }
      
      public static function __copyMissingFields(param1:*, param2:*) : void
      {
         var _loc5_:* = null as String;
         if(param2 == null || param1 == null)
         {
            return;
         }
         var _loc3_:int = 0;
         var _loc4_:Array = Reflect.fields(param2);
         while(_loc3_ < int(_loc4_.length))
         {
            _loc5_ = _loc4_[_loc3_];
            _loc3_++;
            if(!Reflect.hasField(param1,_loc5_))
            {
               param1[_loc5_] = Reflect.field(param2,_loc5_);
            }
         }
      }
      
      public static function __getDirectory(param1:int) : String
      {
         var _loc2_:* = null as String;
         if(param1 != 4 && Capabilities.playerType == "Desktop")
         {
            switch(param1)
            {
               case 0:
                  _loc2_ = "applicationDirectory";
                  break;
               case 1:
                  _loc2_ = "applicationStorageDirectory";
                  break;
               case 2:
                  _loc2_ = "desktopDirectory";
                  break;
               case 3:
                  _loc2_ = "documentsDirectory";
                  break;
               default:
                  _loc2_ = "userDirectory";
            }
            return Reflect.getProperty(Type.resolveClass("flash.filesystem.File"),_loc2_).nativePath;
         }
         return null;
      }
      
      public static function __parseBool(param1:String) : Boolean
      {
         return param1 == "true";
      }
      
      public static function __registerEntryPoint(param1:String, param2:*) : void
      {
         if(System.__applicationEntryPoint == null)
         {
            System.__applicationEntryPoint = new StringMap();
         }
         var _loc3_:StringMap = System.__applicationEntryPoint;
         if(param1 in StringMap.reserved)
         {
            _loc3_.setReserved(param1,param2);
         }
         else
         {
            _loc3_.h[param1] = param2;
         }
      }
      
      public static function __runProcess(param1:String, param2:Array = undefined) : String
      {
         return null;
      }
      
      public static function get_allowScreenTimeout() : Boolean
      {
         return true;
      }
      
      public static function set_allowScreenTimeout(param1:Boolean) : Boolean
      {
         return true;
      }
      
      public static function get_applicationDirectory() : String
      {
         if(System.__applicationDirectory == null)
         {
            System.__applicationDirectory = System.__getDirectory(0);
         }
         return System.__applicationDirectory;
      }
      
      public static function get_applicationStorageDirectory() : String
      {
         if(System.__applicationStorageDirectory == null)
         {
            System.__applicationStorageDirectory = System.__getDirectory(1);
         }
         return System.__applicationStorageDirectory;
      }
      
      public static function get_deviceModel() : String
      {
         var _loc1_:Boolean = System.__deviceModel == null;
         return System.__deviceModel;
      }
      
      public static function get_deviceVendor() : String
      {
         var _loc1_:Boolean = System.__deviceVendor == null;
         return System.__deviceVendor;
      }
      
      public static function get_desktopDirectory() : String
      {
         if(System.__desktopDirectory == null)
         {
            System.__desktopDirectory = System.__getDirectory(2);
         }
         return System.__desktopDirectory;
      }
      
      public static function get_documentsDirectory() : String
      {
         if(System.__documentsDirectory == null)
         {
            System.__documentsDirectory = System.__getDirectory(3);
         }
         return System.__documentsDirectory;
      }
      
      public static function get_endianness() : Endian
      {
         if(System.__endianness == null)
         {
            System.__endianness = Endian.BIG_ENDIAN;
         }
         return System.__endianness;
      }
      
      public static function get_fontsDirectory() : String
      {
         if(System.__fontsDirectory == null)
         {
            System.__fontsDirectory = System.__getDirectory(4);
         }
         return System.__fontsDirectory;
      }
      
      public static function get_numDisplays() : int
      {
         return 1;
      }
      
      public static function get_platformLabel() : String
      {
         var _loc1_:* = null as String;
         var _loc2_:* = null as String;
         if(System.__platformLabel == null)
         {
            _loc1_ = System.get_platformName();
            _loc2_ = System.get_platformVersion();
            if(_loc1_ != null && _loc2_ != null)
            {
               System.__platformLabel = _loc1_ + " " + _loc2_;
            }
            else if(_loc1_ != null)
            {
               System.__platformLabel = _loc1_;
            }
         }
         return System.__platformLabel;
      }
      
      public static function get_platformName() : String
      {
         if(System.__platformName == null)
         {
            System.__platformName = "Flash Player";
         }
         return System.__platformName;
      }
      
      public static function get_platformVersion() : String
      {
         if(System.__platformVersion == null)
         {
            System.__platformVersion = Capabilities.version;
         }
         return System.__platformVersion;
      }
      
      public static function get_userDirectory() : String
      {
         if(System.__userDirectory == null)
         {
            System.__userDirectory = System.__getDirectory(5);
         }
         return System.__userDirectory;
      }
   }
}

