package openfl.utils._internal
{
   import flash.display.MovieClip;
   import haxe.IMap;
   import haxe.ds.StringMap;
   import lime.utils.Log;
   import openfl.display.Application;
   
   public class Lib
   {
      
      public static var init__:Boolean;
      
      public static var application:Application;
      
      public static var current:MovieClip;
      
      public static var __sentWarnings:IMap;
      
      public static var __meta__:* = {
         "obj":{"SuppressWarnings":["checkstyle:FieldDocComment"]},
         "statics":{"notImplemented":{"SuppressWarnings":["checkstyle:NullableParameter"]}}
      };
      
      public function Lib()
      {
      }
      
      public static function notImplemented(param1:Object = undefined) : void
      {
         var _loc4_:* = null as StringMap;
         var _loc2_:String = param1.className + "." + param1.methodName;
         var _loc3_:StringMap = Lib.__sentWarnings;
         if(!(_loc2_ in StringMap.reserved ? _loc3_.existsReserved(_loc2_) : _loc2_ in _loc3_.h))
         {
            _loc4_ = Lib.__sentWarnings;
            if(_loc2_ in StringMap.reserved)
            {
               _loc4_.setReserved(_loc2_,true);
            }
            else
            {
               _loc4_.h[_loc2_] = true;
            }
            Log.warn(param1.methodName + " is not implemented",param1);
         }
      }
   }
}

