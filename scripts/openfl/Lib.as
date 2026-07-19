package openfl
{
   import flash.Lib;
   import flash.display.MovieClip;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   import flash.net.getClassByAlias;
   import flash.net.registerClassAlias;
   import flash.utils.Dictionary;
   import flash.utils.getTimer;
   import haxe.IMap;
   import haxe.Log;
   import haxe.Timer;
   import haxe.ds.IntMap;
   import haxe.ds.StringMap;
   import lime.utils.Log;
   import openfl.display.Application;
   import openfl.utils._internal.Lib;
   
   public class Lib
   {
      
      public static var init__:Boolean;
      
      public static var __sentWarnings:IMap;
      
      public static var __timers:IMap;
      
      public static var __registeredClassAliases:IMap;
      
      public static var __registeredClasses:Dictionary;
      
      public static var __lastTimerID:uint = 0;
      
      public function Lib()
      {
      }
      
      public static function §as§(param1:*, param2:Class) : Object
      {
         return param1 as param2;
      }
      
      public static function attach(param1:String) : MovieClip
      {
         return flash.Lib.attach(param1);
      }
      
      public static function clearInterval(param1:uint) : void
      {
         var _loc3_:* = null as Timer;
         var _loc2_:IMap = openfl.Lib.__timers;
         if(int(param1) in _loc2_.h)
         {
            _loc3_ = openfl.Lib.__timers.h[int(param1)];
            _loc3_.stop();
            openfl.Lib.__timers.remove(int(param1));
         }
      }
      
      public static function clearTimeout(param1:uint) : void
      {
         var _loc3_:* = null as Timer;
         var _loc2_:IMap = openfl.Lib.__timers;
         if(int(param1) in _loc2_.h)
         {
            _loc3_ = openfl.Lib.__timers.h[int(param1)];
            _loc3_.stop();
            openfl.Lib.__timers.remove(int(param1));
         }
      }
      
      public static function eval(param1:String) : *
      {
         return flash.Lib.eval(param1);
      }
      
      public static function fscommand(param1:String, param2:String = undefined) : void
      {
         flash.Lib.fscommand(param1,param2);
      }
      
      public static function getDefinitionByName(param1:String) : Class
      {
         var _loc2_:* = null as Class;
         if(param1 == null)
         {
            return null;
         }
         param1 = StringTools.replace(param1,"::",".");
         if(StringTools.startsWith(param1,"openfl."))
         {
            _loc2_ = Type.resolveClass(param1);
            if(_loc2_ == null)
            {
               _loc2_ = Type.resolveClass(StringTools.replace(param1,"openfl.","flash."));
            }
            return _loc2_;
         }
         return Type.resolveClass(param1);
      }
      
      public static function getQualifiedClassName(param1:*) : String
      {
         if(param1 == null)
         {
            return null;
         }
         var _loc2_:Class = Std.isOfType(param1,Class) ? param1 : Type.getClass(param1);
         if(_loc2_ == null)
         {
            if(Std.isOfType(param1,Boolean) || param1 == Boolean)
            {
               return "Bool";
            }
            if(Std.isOfType(param1,int) || param1 == int)
            {
               return "Int";
            }
            if(Std.isOfType(param1,Number) || param1 == Number)
            {
               return "Float";
            }
            return null;
         }
         return Type.getClassName(_loc2_);
      }
      
      public static function getQualifiedSuperclassName(param1:*) : String
      {
         if(param1 == null)
         {
            return null;
         }
         var _loc2_:Class = Std.isOfType(param1,Class) ? param1 : Type.getClass(param1);
         if(_loc2_ == null)
         {
            return null;
         }
         var _loc3_:Class = Type.getSuperClass(_loc2_);
         if(_loc3_ == null)
         {
            return null;
         }
         return Type.getClassName(_loc3_);
      }
      
      public static function getTimer() : int
      {
         return getTimer();
      }
      
      public static function describeType(param1:*) : Xml
      {
         return Xml.parse(flash.Lib.describeType(param1).toString());
      }
      
      public static function getURL(param1:URLRequest, param2:String = undefined) : void
      {
         openfl.Lib.navigateToURL(param1,param2);
      }
      
      public static function navigateToURL(param1:URLRequest, param2:String = undefined) : void
      {
         if(param2 == null)
         {
            param2 = "_blank";
         }
         flash.Lib.getURL(param1,param2);
      }
      
      public static function encodeURIComponent(param1:String) : String
      {
         return encodeURIComponent(param1);
      }
      
      public static function decodeURIComponent(param1:String) : String
      {
         return decodeURIComponent(param1.split("+").join(" "));
      }
      
      public static function notImplemented(param1:Object = undefined) : void
      {
         var _loc4_:* = null as StringMap;
         var _loc2_:String = param1.className + "." + param1.methodName;
         var _loc3_:StringMap = openfl.Lib.__sentWarnings;
         if(!(_loc2_ in StringMap.reserved ? _loc3_.existsReserved(_loc2_) : _loc2_ in _loc3_.h))
         {
            _loc4_ = openfl.Lib.__sentWarnings;
            if(_loc2_ in StringMap.reserved)
            {
               _loc4_.setReserved(_loc2_,true);
            }
            else
            {
               _loc4_.h[_loc2_] = true;
            }
            lime.utils.Log.warn(param1.methodName + " is not implemented",param1);
         }
      }
      
      public static function preventDefaultTouchMove() : void
      {
      }
      
      public static function redirectTraces() : void
      {
         flash.Lib.redirectTraces();
      }
      
      public static function sendToURL(param1:URLRequest) : void
      {
         var _loc2_:URLLoader = new URLLoader();
         _loc2_.load(param1);
      }
      
      public static function setInterval(param1:*, param2:int, param3:Array = undefined) : uint
      {
         var closure:* = param1;
         var args:Array = param3;
         var _temp_1:* = openfl.Lib;
         var _loc4_:uint = _temp_1.__lastTimerID = uint(_temp_1.__lastTimerID + 1);
         var _loc6_:Timer = new Timer(param2);
         openfl.Lib.__timers.h[int(_loc4_)] = _loc6_;
         _loc6_.run = function():void
         {
            closure.apply(closure,args == null ? [] : args);
         };
         return _loc4_;
      }
      
      public static function setTimeout(param1:*, param2:int, param3:Array = undefined) : uint
      {
         var id:uint;
         var closure:* = param1;
         var args:Array = param3;
         var _temp_3:* = §§newactivation();
         var _temp_1:* = openfl.Lib;
         id = _temp_1.__lastTimerID = uint(_temp_1.__lastTimerID + 1);
         var _loc5_:IMap = openfl.Lib.__timers;
         var _loc6_:Timer = Timer.delay(function():void
         {
            openfl.Lib.__timers.remove(int(id));
            closure.apply(closure,args == null ? [] : args);
         },param2);
         _loc5_.h[int(id)] = _loc6_;
         return id;
      }
      
      public static function trace(param1:*) : void
      {
         haxe.Log.trace(param1,{
            "fileName":"openfl/Lib.hx",
            "lineNumber":672,
            "className":"openfl.Lib",
            "methodName":"trace"
         });
      }
      
      public static function isXMLName(param1:String) : Boolean
      {
         return isXMLName(param1);
      }
      
      public static function getClassByAlias(param1:String) : Class
      {
         return getClassByAlias(param1);
      }
      
      public static function registerClassAlias(param1:String, param2:Class) : void
      {
         registerClassAlias(param1,param2);
      }
      
      public static function get_application() : Application
      {
         return openfl.utils._internal.Lib.application;
      }
      
      public static function get_current() : MovieClip
      {
         return flash.Lib.current;
      }
   }
}

