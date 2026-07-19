package lime.system
{
   import haxe.IMap;
   
   public class CFFI
   {
      
      public static var available:Boolean = false;
      
      public static var enabled:Boolean = false;
      
      public static var __moduleNames:IMap = null;
      
      public function CFFI()
      {
      }
      
      public static function load(param1:String, param2:String, param3:int = 0, param4:Boolean = false) : *
      {
         if(!CFFI.enabled)
         {
            return Reflect.makeVarArgs(function(param1:Array):Object
            {
               return {};
            });
         }
         return null;
      }
      
      public static function stringValue(param1:String) : String
      {
         return param1;
      }
      
      public static function __findNDLLFolder() : String
      {
         return "";
      }
      
      public static function __loaderTrace(param1:String) : void
      {
      }
      
      public static function __sysName() : String
      {
         return null;
      }
      
      public static function __tryLoad(param1:String, param2:String, param3:String, param4:int) : *
      {
         return null;
      }
   }
}

import haxe.IMap;

