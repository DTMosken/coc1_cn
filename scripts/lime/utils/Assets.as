package lime.utils
{
   import haxe.Exception;
   import haxe.IMap;
   import haxe.ds.StringMap;
   import haxe.io.Bytes;
   import haxe.io.Path;
   import lime.app.Application;
   import lime.app.Future;
   import lime.app.Promise_lime_utils_AssetLibrary;
   import lime.app._Event_Void_Void;
   import lime.graphics.Image;
   import lime.graphics.ImageBuffer;
   import lime.media.AudioBuffer;
   import lime.text.Font;
   
   public class Assets
   {
      
      public static var init__:Boolean;
      
      public static var cache:AssetCache;
      
      public static var onChange:_Event_Void_Void;
      
      public static var bundlePaths:IMap;
      
      public static var libraries:IMap;
      
      public static var libraryPaths:IMap;
      
      public function Assets()
      {
      }
      
      public static function exists(param1:String, param2:String = undefined) : Boolean
      {
         if(param2 == null)
         {
            param2 = "BINARY";
         }
         var _loc3_:String = param1;
         var _loc4_:int = _loc3_.indexOf(":");
         var _loc5_:String = _loc3_.substring(0,_loc4_);
         var _loc6_:String = _loc3_.substring(_loc4_ + 1);
         var _loc7_:AssetLibrary = Assets.getLibrary(_loc5_);
         if(_loc7_ != null)
         {
            return _loc7_.exists(_loc6_,param2);
         }
         return false;
      }
      
      public static function getAsset(param1:String, param2:String, param3:Boolean) : *
      {
         var _loc4_:* = null as String;
         var _loc5_:* = null as StringMap;
         var _loc6_:* = null;
         var _loc7_:* = null as Image;
         var _loc8_:* = null as AudioBuffer;
         if(param3 && Assets.cache.enabled)
         {
            _loc4_ = param2;
            if(_loc4_ == "FONT")
            {
               _loc5_ = Assets.cache.font;
               _loc6_ = param1 in StringMap.reserved ? _loc5_.getReserved(param1) : _loc5_.h[param1];
               if(_loc6_ != null)
               {
                  return _loc6_;
               }
            }
            else if(_loc4_ == "IMAGE")
            {
               _loc5_ = Assets.cache.image;
               _loc7_ = param1 in StringMap.reserved ? _loc5_.getReserved(param1) : _loc5_.h[param1];
               if(Assets.isValidImage(_loc7_))
               {
                  return _loc7_;
               }
            }
            else
            {
               while(true)
               {
                  if(_loc4_ != "MUSIC")
                  {
                     if(_loc4_ != "SOUND")
                     {
                        if(_loc4_ == "TEMPLATE")
                        {
                           throw Exception.thrown("Not sure how to get template: " + param1);
                        }
                        if(_loc4_ != "BINARY")
                        {
                           if(_loc4_ != "TEXT")
                           {
                              return null;
                           }
                        }
                        param3 = false;
                        break;
                     }
                  }
                  _loc5_ = Assets.cache.audio;
                  _loc8_ = param1 in StringMap.reserved ? _loc5_.getReserved(param1) : _loc5_.h[param1];
                  if(Assets.isValidAudio(_loc8_))
                  {
                     return _loc8_;
                  }
                  break;
               }
            }
         }
         _loc4_ = param1;
         var _loc9_:int = _loc4_.indexOf(":");
         var _loc10_:String = _loc4_.substring(0,_loc9_);
         var _loc11_:String = _loc4_.substring(_loc9_ + 1);
         var _loc12_:AssetLibrary = Assets.getLibrary(_loc10_);
         if(_loc12_ != null)
         {
            if(_loc12_.exists(_loc11_,param2))
            {
               if(_loc12_.isLocal(_loc11_,param2))
               {
                  _loc6_ = _loc12_.getAsset(_loc11_,param2);
                  if(param3 && Assets.cache.enabled)
                  {
                     Assets.cache.set(param1,param2,_loc6_);
                  }
                  return _loc6_;
               }
               Log.error(param2 + " asset \"" + param1 + "\" exists, but only asynchronously",{
                  "fileName":"lime/utils/Assets.hx",
                  "lineNumber":133,
                  "className":"lime.utils.Assets",
                  "methodName":"getAsset"
               });
            }
            else
            {
               Log.error("There is no " + param2 + " asset with an ID of \"" + param1 + "\"",{
                  "fileName":"lime/utils/Assets.hx",
                  "lineNumber":138,
                  "className":"lime.utils.Assets",
                  "methodName":"getAsset"
               });
            }
         }
         else
         {
            Log.error(Assets.__libraryNotFound(_loc10_),{
               "fileName":"lime/utils/Assets.hx",
               "lineNumber":143,
               "className":"lime.utils.Assets",
               "methodName":"getAsset"
            });
         }
         return null;
      }
      
      public static function getAudioBuffer(param1:String, param2:Boolean = true) : AudioBuffer
      {
         return Assets.getAsset(param1,"SOUND",param2);
      }
      
      public static function getBytes(param1:String) : Bytes
      {
         return Assets.getAsset(param1,"BINARY",false);
      }
      
      public static function getFont(param1:String, param2:Boolean = true) : Font
      {
         return Assets.getAsset(param1,"FONT",param2);
      }
      
      public static function getImage(param1:String, param2:Boolean = true) : Image
      {
         return Assets.getAsset(param1,"IMAGE",param2);
      }
      
      public static function getLibrary(param1:String) : AssetLibrary
      {
         if(param1 == null || param1 == "")
         {
            param1 = "default";
         }
         var _loc2_:StringMap = Assets.libraries;
         if(param1 in StringMap.reserved)
         {
            return _loc2_.getReserved(param1);
         }
         return _loc2_.h[param1];
      }
      
      public static function getPath(param1:String) : String
      {
         var _loc7_:* = null as String;
         var _loc2_:String = param1;
         var _loc3_:int = _loc2_.indexOf(":");
         var _loc4_:String = _loc2_.substring(0,_loc3_);
         var _loc5_:String = _loc2_.substring(_loc3_ + 1);
         var _loc6_:AssetLibrary = Assets.getLibrary(_loc4_);
         if(_loc6_ != null)
         {
            _loc7_ = null;
            if(_loc6_.exists(_loc5_,_loc7_))
            {
               return _loc6_.getPath(_loc5_);
            }
            Log.error("There is no asset with an ID of \"" + param1 + "\"",{
               "fileName":"lime/utils/Assets.hx",
               "lineNumber":240,
               "className":"lime.utils.Assets",
               "methodName":"getPath"
            });
         }
         else
         {
            Log.error(Assets.__libraryNotFound(_loc4_),{
               "fileName":"lime/utils/Assets.hx",
               "lineNumber":245,
               "className":"lime.utils.Assets",
               "methodName":"getPath"
            });
         }
         return null;
      }
      
      public static function getText(param1:String) : String
      {
         return Assets.getAsset(param1,"TEXT",false);
      }
      
      public static function hasLibrary(param1:String) : Boolean
      {
         if(param1 == null || param1 == "")
         {
            param1 = "default";
         }
         var _loc2_:StringMap = Assets.libraries;
         if(param1 in StringMap.reserved)
         {
            return _loc2_.existsReserved(param1);
         }
         return param1 in _loc2_.h;
      }
      
      public static function isLocal(param1:String, param2:String = undefined, param3:Boolean = true) : Boolean
      {
         if(param3 && Assets.cache.enabled)
         {
            if(Assets.cache.exists(param1,param2))
            {
               return true;
            }
         }
         var _loc4_:String = param1;
         var _loc5_:int = _loc4_.indexOf(":");
         var _loc6_:String = _loc4_.substring(0,_loc5_);
         var _loc7_:String = _loc4_.substring(_loc5_ + 1);
         var _loc8_:AssetLibrary = Assets.getLibrary(_loc6_);
         if(_loc8_ != null)
         {
            return _loc8_.isLocal(_loc7_,param2);
         }
         return false;
      }
      
      public static function isValidAudio(param1:AudioBuffer) : Boolean
      {
         return param1 != null;
      }
      
      public static function isValidImage(param1:Image) : Boolean
      {
         if(param1 != null)
         {
            return param1.buffer != null;
         }
         return false;
      }
      
      public static function list(param1:String = undefined) : Array
      {
         var _loc11_:* = null;
         var _loc12_:int = 0;
         var _loc13_:Boolean = false;
         var _loc14_:* = null as AssetLibrary;
         var _loc15_:* = null as AssetLibrary;
         var _loc16_:* = null as Array;
         var _loc2_:Array = [];
         var _loc3_:StringMap = Assets.libraries;
         var _loc4_:* = _loc3_.h;
         var _loc5_:* = _loc3_.rh;
         var _loc6_:int = 0;
         var _loc7_:* = _loc4_;
         var _loc8_:int = _loc6_;
         var _loc9_:Boolean = §§hasnext(_loc7_,_loc8_);
         if(!_loc9_ && _loc5_ != null)
         {
            _loc4_ = _loc5_;
            _loc7_ = _loc4_;
            _loc6_ = 0;
            _loc8_ = _loc6_;
            _loc5_ = null;
            _loc9_ = §§hasnext(_loc7_,_loc8_);
         }
         var _loc10_:int = _loc8_;
         while(true)
         {
            _loc11_ = _loc4_;
            _loc12_ = _loc6_;
            _loc13_ = §§hasnext(_loc11_,_loc12_);
            if(!_loc13_ && _loc5_ != null)
            {
               _loc4_ = _loc5_;
               _loc11_ = _loc4_;
               _loc6_ = 0;
               _loc12_ = _loc6_;
               _loc5_ = null;
               _loc13_ = §§hasnext(_loc11_,_loc12_);
            }
            _loc10_ = _loc12_;
            if(!_loc13_)
            {
               break;
            }
            _loc14_ = §§nextvalue(_loc10_,_loc4_);
            _loc6_ = _loc10_;
            _loc15_ = _loc14_;
            _loc16_ = _loc15_.list(param1);
            if(_loc16_ != null)
            {
               _loc2_ = _loc2_.concat(_loc16_);
            }
         }
         return _loc2_;
      }
      
      public static function loadAsset(param1:String, param2:String, param3:Boolean) : Future
      {
         var type:String;
         var id:String;
         var _loc4_:* = null as String;
         var _loc5_:* = null as StringMap;
         var _loc6_:* = null;
         var _loc7_:* = null as Image;
         var _loc8_:* = null as AudioBuffer;
         var _loc13_:* = null as Future;
         id = param1;
         type = param2;
         if(param3 && Assets.cache.enabled)
         {
            _loc4_ = type;
            if(_loc4_ == "FONT")
            {
               _loc5_ = Assets.cache.font;
               _loc6_ = id in StringMap.reserved ? _loc5_.getReserved(id) : _loc5_.h[id];
               if(_loc6_ != null)
               {
                  return Future.withValue(_loc6_);
               }
            }
            else if(_loc4_ == "IMAGE")
            {
               _loc5_ = Assets.cache.image;
               _loc7_ = id in StringMap.reserved ? _loc5_.getReserved(id) : _loc5_.h[id];
               if(Assets.isValidImage(_loc7_))
               {
                  return Future.withValue(_loc7_);
               }
            }
            else
            {
               while(true)
               {
                  if(_loc4_ != "MUSIC")
                  {
                     if(_loc4_ != "SOUND")
                     {
                        if(_loc4_ == "TEMPLATE")
                        {
                           throw Exception.thrown("Not sure how to get template: " + id);
                        }
                        if(_loc4_ != "BINARY")
                        {
                           if(_loc4_ != "TEXT")
                           {
                              return null;
                           }
                        }
                        param3 = false;
                        break;
                     }
                  }
                  _loc5_ = Assets.cache.audio;
                  _loc8_ = id in StringMap.reserved ? _loc5_.getReserved(id) : _loc5_.h[id];
                  if(Assets.isValidAudio(_loc8_))
                  {
                     return Future.withValue(_loc8_);
                  }
                  break;
               }
            }
         }
         _loc4_ = id;
         var _loc9_:int = _loc4_.indexOf(":");
         var _loc10_:String = _loc4_.substring(0,_loc9_);
         var _loc11_:String = _loc4_.substring(_loc9_ + 1);
         var _loc12_:AssetLibrary = Assets.getLibrary(_loc10_);
         if(_loc12_ != null)
         {
            if(_loc12_.exists(_loc11_,type))
            {
               _loc13_ = _loc12_.loadAsset(_loc11_,type);
               if(param3 && Assets.cache.enabled)
               {
                  _loc13_.onComplete(function(param1:*):void
                  {
                     Assets.cache.set(id,type,param1);
                  });
               }
               return _loc13_;
            }
            return Future.withError("There is no " + type + " asset with an ID of \"" + id + "\"");
         }
         return Future.withError(Assets.__libraryNotFound(_loc10_));
      }
      
      public static function loadAudioBuffer(param1:String, param2:Boolean = true) : Future
      {
         return Assets.loadAsset(param1,"SOUND",param2);
      }
      
      public static function loadBytes(param1:String) : Future
      {
         return Assets.loadAsset(param1,"BINARY",false);
      }
      
      public static function loadFont(param1:String, param2:Boolean = true) : Future
      {
         return Assets.loadAsset(param1,"FONT",param2);
      }
      
      public static function loadImage(param1:String, param2:Boolean = true) : Future
      {
         return Assets.loadAsset(param1,"IMAGE",param2);
      }
      
      public static function loadLibrary(param1:String) : Future
      {
         var promise:Promise_lime_utils_AssetLibrary;
         var id:String;
         var _loc6_:* = null as StringMap;
         var _loc7_:* = null as StringMap;
         id = param1;
         promise = new Promise_lime_utils_AssetLibrary();
         var _loc2_:AssetLibrary = Assets.getLibrary(id);
         if(_loc2_ != null)
         {
            return _loc2_.load();
         }
         var _loc3_:String = id;
         var _loc4_:String = null;
         var _loc5_:StringMap = Assets.bundlePaths;
         if(id in StringMap.reserved ? _loc5_.existsReserved(id) : id in _loc5_.h)
         {
            _loc6_ = Assets.bundlePaths;
            AssetBundle.loadFromFile(id in StringMap.reserved ? _loc6_.getReserved(id) : _loc6_.h[id]).onComplete(function(param1:AssetBundle):void
            {
               var _loc3_:* = null as StringMap;
               if(param1 == null)
               {
                  promise.error("Cannot load bundle for library \"" + id + "\"");
                  return;
               }
               var _loc2_:AssetLibrary = AssetLibrary.fromBundle(param1);
               if(_loc2_ == null)
               {
                  promise.error("Cannot open library \"" + id + "\"");
               }
               else
               {
                  _loc3_ = Assets.libraries;
                  if(id in StringMap.reserved)
                  {
                     _loc3_.setReserved(id,_loc2_);
                  }
                  else
                  {
                     _loc3_.h[id] = _loc2_;
                  }
                  _loc2_.onChange.add(Assets.onChange.dispatch);
                  promise.completeWith(_loc2_.load());
               }
            }).onError(function(param1:*):void
            {
               promise.error("There is no asset library with an ID of \"" + id + "\"");
            });
         }
         else
         {
            _loc6_ = Assets.libraryPaths;
            if(id in StringMap.reserved ? _loc6_.existsReserved(id) : id in _loc6_.h)
            {
               _loc7_ = Assets.libraryPaths;
               _loc3_ = id in StringMap.reserved ? _loc7_.getReserved(id) : _loc7_.h[id];
               _loc4_ = Path.directory(_loc3_);
            }
            else
            {
               if(StringTools.endsWith(_loc3_,".bundle"))
               {
                  _loc4_ = _loc3_;
                  _loc3_ += "/library.json";
               }
               else
               {
                  _loc4_ = Path.directory(_loc3_);
               }
               _loc3_ = Assets.__cacheBreak(_loc3_);
            }
            AssetManifest.loadFromFile(_loc3_,_loc4_).onComplete(function(param1:AssetManifest):void
            {
               var _loc3_:* = null as StringMap;
               if(param1 == null)
               {
                  promise.error("Cannot parse asset manifest for library \"" + id + "\"");
                  return;
               }
               var _loc2_:AssetLibrary = AssetLibrary.fromManifest(param1);
               if(_loc2_ == null)
               {
                  promise.error("Cannot open library \"" + id + "\"");
               }
               else
               {
                  _loc3_ = Assets.libraries;
                  if(id in StringMap.reserved)
                  {
                     _loc3_.setReserved(id,_loc2_);
                  }
                  else
                  {
                     _loc3_.h[id] = _loc2_;
                  }
                  _loc2_.onChange.add(Assets.onChange.dispatch);
                  promise.completeWith(_loc2_.load());
               }
            }).onError(function(param1:*):void
            {
               promise.error("There is no asset library with an ID of \"" + id + "\"");
            });
         }
         return promise.future;
      }
      
      public static function loadText(param1:String) : Future
      {
         return Assets.loadAsset(param1,"TEXT",false);
      }
      
      public static function registerLibrary(param1:String, param2:AssetLibrary) : void
      {
         var _loc4_:* = null as StringMap;
         if(param1 == null || param1 == "")
         {
            param1 = "default";
         }
         var _loc3_:StringMap = Assets.libraries;
         if(param1 in StringMap.reserved ? _loc3_.existsReserved(param1) : param1 in _loc3_.h)
         {
            _loc4_ = Assets.libraries;
            if((param1 in StringMap.reserved ? _loc4_.getReserved(param1) : _loc4_.h[param1]) == param2)
            {
               return;
            }
            Assets.unloadLibrary(param1);
         }
         if(param2 != null)
         {
            param2.onChange.add(Assets.library_onChange);
         }
         _loc4_ = Assets.libraries;
         if(param1 in StringMap.reserved)
         {
            _loc4_.setReserved(param1,param2);
         }
         else
         {
            _loc4_.h[param1] = param2;
         }
      }
      
      public static function unloadLibrary(param1:String) : void
      {
         Assets.removeLibrary(param1,true);
      }
      
      public static function removeLibrary(param1:String, param2:Boolean = true) : void
      {
         if(param1 == null || param1 == "")
         {
            param1 = "default";
         }
         var _loc3_:StringMap = Assets.libraries;
         var _loc4_:AssetLibrary = param1 in StringMap.reserved ? _loc3_.getReserved(param1) : _loc3_.h[param1];
         if(_loc4_ != null)
         {
            Assets.cache.clear(param1 + ":");
            _loc4_.onChange.remove(Assets.library_onChange);
            if(param2)
            {
               _loc4_.unload();
            }
         }
         Assets.libraries.remove(param1);
      }
      
      public static function __cacheBreak(param1:String) : String
      {
         if(Assets.cache.version > 0)
         {
            if(param1.indexOf("?") > -1)
            {
               param1 += "&" + Assets.cache.version;
            }
            else
            {
               param1 += "?" + Assets.cache.version;
            }
         }
         return param1;
      }
      
      public static function __libraryNotFound(param1:String) : String
      {
         if(param1 == null || param1 == "")
         {
            param1 = "default";
         }
         if(Application.current != null && Application.current.__preloader != null && !Application.current.__preloader.complete)
         {
            return "There is no asset library named \"" + param1 + "\", or it is not yet preloaded";
         }
         return "There is no asset library named \"" + param1 + "\"";
      }
      
      public static function library_onChange() : void
      {
         Assets.cache.clear();
         Assets.onChange.dispatch();
      }
   }
}

