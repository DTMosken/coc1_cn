package flash
{
   import flash.display.MovieClip;
   import flash.external.ExternalInterface;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   import flash.system.fscommand;
   import flash.utils.describeType;
   import flash.utils.getDefinitionByName;
   import haxe.Log;
   
   public class Lib
   {
      
      public static var current:MovieClip;
      
      public function Lib()
      {
      }
      
      public static function eval(param1:String) : *
      {
         var _loc6_:* = null;
         var _loc8_:* = null as String;
         var _loc3_:Array = param1.split(".");
         var _loc4_:Array = [];
         var _loc5_:* = null;
         while(int(_loc3_.length) > 0)
         {
            try
            {
               _loc5_ = getDefinitionByName(_loc3_.join("."));
            }
            catch(_loc_e_:*)
            {
            }
            if(_loc5_ != null)
            {
               break;
            }
         }
         var _loc7_:int = 0;
         while(_loc7_ < int(_loc4_.length))
         {
            _loc8_ = _loc4_[_loc7_];
            _loc7_++;
            if(_loc5_ == null)
            {
               return null;
            }
            _loc5_ = _loc5_[_loc8_];
         }
         return _loc5_;
      }
      
      public static function getURL(param1:URLRequest, param2:String = undefined) : void
      {
         var _loc3_:Function = navigateToURL;
         if(param2 == null)
         {
            _loc3_(param1);
         }
         else
         {
            _loc3_(param1,param2);
         }
      }
      
      public static function fscommand(param1:String, param2:String = undefined) : void
      {
         fscommand(param1,param2 == null ? "" : param2);
      }
      
      public static function describeType(param1:*) : XML
      {
         return describeType(param1);
      }
      
      public static function attach(param1:String) : MovieClip
      {
         var _loc2_:* = getDefinitionByName(param1) as Class;
         return new _loc2_();
      }
      
      public static function redirectTraces() : void
      {
         if(ExternalInterface.available)
         {
            Log.trace = Lib.traceToConsole;
         }
      }
      
      public static function traceToConsole(param1:*, param2:Object = undefined) : void
      {
         var _loc6_:* = null;
         var _loc4_:String = param2 != null && param2.customParams != null ? param2.customParams[0] : null;
         if(_loc4_ != "warn" && _loc4_ != "info" && _loc4_ != "debug" && _loc4_ != "error")
         {
            _loc4_ = param2 == null ? "error" : "log";
         }
         var _loc5_:String = param2 == null ? "" : param2.fileName + ":" + int(param2.lineNumber) + " : ";
         try
         {
            _loc5_ += Std.string(param1);
         }
         catch(_loc_e_:*)
         {
            _loc5_ = _loc5_.split("\\").join("\\\\");
            ExternalInterface.call("console." + _loc4_,_loc5_);
            return;
         }
      }
   }
}

