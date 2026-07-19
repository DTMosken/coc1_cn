package lime.utils
{
   import flash.Boot;
   import flash.display.BitmapData;
   import flash.media.Sound;
   import flash.utils.ByteArray;
   import haxe.Exception;
   import haxe.IMap;
   import haxe.ds.StringMap;
   import haxe.io.Bytes;
   import lime.app.Future;
   import lime.app.Promise_lime_utils_AssetLibrary;
   import lime.app._Event_Void_Void;
   import lime.graphics.Image;
   import lime.media.AudioBuffer;
   import lime.net._HTTPRequest_String;
   import lime.text.Font;
   import lime.utils._Bytes.Bytes_Impl_;
   
   public class AssetLibrary
   {
      
      public var types:IMap;
      
      public var sizes:IMap;
      
      public var promise:Promise_lime_utils_AssetLibrary;
      
      public var preload:IMap;
      
      public var paths:IMap;
      
      public var pathGroups:IMap;
      
      public var onChange:_Event_Void_Void;
      
      public var loaded:Boolean;
      
      public var classTypes:IMap;
      
      public var cachedText:IMap;
      
      public var cachedImages:IMap;
      
      public var cachedFonts:IMap;
      
      public var cachedBytes:IMap;
      
      public var cachedAudioBuffers:IMap;
      
      public var bytesTotal:int;
      
      public var bytesLoadedCache:IMap;
      
      public var bytesLoaded:int;
      
      public var assetsTotal:int;
      
      public var assetsLoaded:int;
      
      public function AssetLibrary()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         types = new StringMap();
         sizes = new StringMap();
         preload = new StringMap();
         paths = new StringMap();
         pathGroups = new StringMap();
         classTypes = new StringMap();
         cachedText = new StringMap();
         cachedImages = new StringMap();
         cachedFonts = new StringMap();
         cachedBytes = new StringMap();
         cachedAudioBuffers = new StringMap();
         onChange = new _Event_Void_Void();
         bytesLoaded = 0;
         bytesTotal = 0;
      }
      
      public static function fromBytes(param1:Bytes, param2:String = undefined) : AssetLibrary
      {
         return AssetLibrary.fromManifest(AssetManifest.fromBytes(param1,param2));
      }
      
      public static function fromFile(param1:String, param2:String = undefined) : AssetLibrary
      {
         return AssetLibrary.fromManifest(AssetManifest.fromFile(param1,param2));
      }
      
      public static function fromBundle(param1:AssetBundle) : AssetLibrary
      {
         var _loc3_:* = null as StringMap;
         var _loc4_:* = null as AssetManifest;
         var _loc5_:* = null as AssetLibrary;
         var _loc6_:* = null as Class;
         var _loc2_:StringMap = param1.data;
         if("library.json" in StringMap.reserved ? _loc2_.existsReserved("library.json") : "library.json" in _loc2_.h)
         {
            _loc3_ = param1.data;
            _loc4_ = AssetManifest.fromBytes("library.json" in StringMap.reserved ? _loc3_.getReserved("library.json") : _loc3_.h["library.json"]);
            if(_loc4_ != null)
            {
               _loc5_ = null;
               if(_loc4_.libraryType == null)
               {
                  _loc5_ = new AssetLibrary();
               }
               else
               {
                  _loc6_ = Type.resolveClass(_loc4_.libraryType);
                  if(_loc6_ == null)
                  {
                     Log.warn("Could not find library type: " + _loc4_.libraryType,{
                        "fileName":"lime/utils/AssetLibrary.hx",
                        "lineNumber":122,
                        "className":"lime.utils.AssetLibrary",
                        "methodName":"fromBundle"
                     });
                     return null;
                  }
                  _loc5_ = Type.createInstance(_loc6_,_loc4_.libraryArgs);
               }
               _loc5_.__fromBundle(param1,_loc4_);
               return _loc5_;
            }
            return null;
         }
         _loc5_ = new AssetLibrary();
         _loc5_.__fromBundle(param1);
         return _loc5_;
      }
      
      public static function fromManifest(param1:AssetManifest) : AssetLibrary
      {
         var _loc3_:* = null as Class;
         if(param1 == null)
         {
            return null;
         }
         var _loc2_:AssetLibrary = null;
         if(param1.libraryType == null)
         {
            _loc2_ = new AssetLibrary();
         }
         else
         {
            _loc3_ = Type.resolveClass(param1.libraryType);
            if(_loc3_ == null)
            {
               Log.warn("Could not find library type: " + param1.libraryType,{
                  "fileName":"lime/utils/AssetLibrary.hx",
                  "lineNumber":160,
                  "className":"lime.utils.AssetLibrary",
                  "methodName":"fromManifest"
               });
               return null;
            }
            _loc2_ = Type.createInstance(_loc3_,param1.libraryArgs);
         }
         _loc2_.__fromManifest(param1);
         return _loc2_;
      }
      
      public static function loadFromBytes(param1:Bytes, param2:String = undefined) : Future
      {
         return AssetManifest.loadFromBytes(param1,param2).then(function(param1:AssetManifest):Future
         {
            return AssetLibrary.loadFromManifest(param1);
         });
      }
      
      public static function loadFromFile(param1:String, param2:String = undefined) : Future
      {
         return AssetManifest.loadFromFile(param1,param2).then(function(param1:AssetManifest):Future
         {
            return AssetLibrary.loadFromManifest(param1);
         });
      }
      
      public static function loadFromManifest(param1:AssetManifest) : Future
      {
         var _loc2_:AssetLibrary = AssetLibrary.fromManifest(param1);
         if(_loc2_ != null)
         {
            return _loc2_.load();
         }
         return Future.withError("Could not load asset manifest");
      }
      
      public function unload() : void
      {
         var _loc1_:StringMap = cachedBytes;
         _loc1_.h = {};
         _loc1_.rh = null;
         _loc1_ = cachedFonts;
         _loc1_.h = {};
         _loc1_.rh = null;
         _loc1_ = cachedImages;
         _loc1_.h = {};
         _loc1_.rh = null;
         _loc1_ = cachedAudioBuffers;
         _loc1_.h = {};
         _loc1_.rh = null;
         _loc1_ = cachedText;
         _loc1_.h = {};
         _loc1_.rh = null;
      }
      
      public function load_onProgress(param1:String, param2:int, param3:int) : void
      {
         var _loc4_:* = null as StringMap;
         var _loc5_:* = null as Object;
         var _loc6_:Number = NaN;
         var _loc7_:* = null as StringMap;
         var _loc8_:* = null as StringMap;
         var _loc9_:* = null as Object;
         if(param2 > 0)
         {
            _loc4_ = sizes;
            _loc5_ = param1 in StringMap.reserved ? _loc4_.getReserved(param1) : _loc4_.h[param1];
            if(param3 > 0)
            {
               _loc6_ = param2 / param3;
               if(_loc6_ > 1)
               {
                  _loc6_ = 1;
               }
               param2 = int(Math.floor(_loc6_ * _loc5_));
            }
            else if(param2 > _loc5_)
            {
               param2 = _loc5_;
            }
            _loc7_ = bytesLoadedCache;
            if(param1 in StringMap.reserved ? _loc7_.existsReserved(param1) : param1 in _loc7_.h)
            {
               _loc8_ = bytesLoadedCache;
               _loc9_ = param1 in StringMap.reserved ? _loc8_.getReserved(param1) : _loc8_.h[param1];
               if(param2 != _loc9_)
               {
                  bytesLoaded += param2 - _loc9_;
               }
            }
            else
            {
               bytesLoaded += param2;
            }
            _loc8_ = bytesLoadedCache;
            if(param1 in StringMap.reserved)
            {
               _loc8_.setReserved(param1,param2);
            }
            else
            {
               _loc8_.h[param1] = param2;
            }
            promise.progress(bytesLoaded,bytesTotal);
         }
      }
      
      public function load_onError(param1:String, param2:*) : void
      {
         if(param2 != null && param2 != "")
         {
            promise.error("Error loading asset \"" + param1 + "\": " + Std.string(param2));
         }
         else
         {
            promise.error("Error loading asset \"" + param1 + "\"");
         }
      }
      
      public function loadText_onComplete(param1:String, param2:String) : void
      {
         var _loc3_:StringMap = cachedText;
         if(param1 in StringMap.reserved)
         {
            _loc3_.setReserved(param1,param2);
         }
         else
         {
            _loc3_.h[param1] = param2;
         }
         __assetLoaded(param1);
      }
      
      public function loadText(param1:String) : Future
      {
         var _loc3_:* = null as StringMap;
         var _loc4_:Boolean = false;
         var _loc5_:* = null as StringMap;
         var _loc6_:* = null as Bytes;
         var _loc7_:* = null as String;
         var _loc8_:* = null as _HTTPRequest_String;
         var _loc2_:StringMap = cachedText;
         if(param1 in StringMap.reserved ? _loc2_.existsReserved(param1) : param1 in _loc2_.h)
         {
            _loc3_ = cachedText;
            return Future.withValue(param1 in StringMap.reserved ? _loc3_.getReserved(param1) : _loc3_.h[param1]);
         }
         _loc3_ = cachedBytes;
         if(!(param1 in StringMap.reserved ? _loc3_.existsReserved(param1) : param1 in _loc3_.h))
         {
            _loc5_ = classTypes;
            _loc4_ = param1 in StringMap.reserved ? _loc5_.existsReserved(param1) : param1 in _loc5_.h;
         }
         else
         {
            _loc4_ = true;
         }
         if(_loc4_)
         {
            _loc6_ = getBytes(param1);
            if(_loc6_ == null)
            {
               return Future.withValue(null);
            }
            _loc7_ = _loc6_.getString(0,_loc6_.length);
            _loc5_ = cachedText;
            if(param1 in StringMap.reserved)
            {
               _loc5_.setReserved(param1,_loc7_);
            }
            else
            {
               _loc5_.h[param1] = _loc7_;
            }
            return Future.withValue(_loc7_);
         }
         _loc8_ = new _HTTPRequest_String();
         return _loc8_.load(getPath(param1));
      }
      
      public function loadImage_onComplete(param1:String, param2:Image) : void
      {
         var _loc3_:StringMap = cachedImages;
         if(param1 in StringMap.reserved)
         {
            _loc3_.setReserved(param1,param2);
         }
         else
         {
            _loc3_.h[param1] = param2;
         }
         __assetLoaded(param1);
      }
      
      public function loadImage(param1:String) : Future
      {
         var _gthis:AssetLibrary;
         var id:String;
         var _loc3_:* = null as StringMap;
         var _loc4_:* = null as StringMap;
         var _loc5_:* = null as StringMap;
         id = param1;
         _gthis = this;
         var _loc2_:StringMap = cachedImages;
         if(id in StringMap.reserved ? _loc2_.existsReserved(id) : id in _loc2_.h)
         {
            _loc3_ = cachedImages;
            return Future.withValue(id in StringMap.reserved ? _loc3_.getReserved(id) : _loc3_.h[id]);
         }
         _loc3_ = classTypes;
         if(id in StringMap.reserved ? _loc3_.existsReserved(id) : id in _loc3_.h)
         {
            _loc4_ = classTypes;
            return Future.withValue(Type.createInstance(id in StringMap.reserved ? _loc4_.getReserved(id) : _loc4_.h[id],[]));
         }
         _loc4_ = cachedBytes;
         if(id in StringMap.reserved ? _loc4_.existsReserved(id) : id in _loc4_.h)
         {
            _loc5_ = cachedBytes;
            return Image.loadFromBytes(id in StringMap.reserved ? _loc5_.getReserved(id) : _loc5_.h[id]).then(function(param1:Image):Future
            {
               _gthis.cachedBytes.remove(id);
               var _loc2_:StringMap = _gthis.cachedImages;
               if(id in StringMap.reserved)
               {
                  _loc2_.setReserved(id,param1);
               }
               else
               {
                  _loc2_.h[id] = param1;
               }
               return Future.withValue(param1);
            });
         }
         return Image.loadFromFile(getPath(id));
      }
      
      public function loadFont_onComplete(param1:String, param2:Font) : void
      {
         var _loc3_:StringMap = cachedFonts;
         if(param1 in StringMap.reserved)
         {
            _loc3_.setReserved(param1,param2);
         }
         else
         {
            _loc3_.h[param1] = param2;
         }
         __assetLoaded(param1);
      }
      
      public function loadFont(param1:String) : Future
      {
         var _loc3_:* = null as StringMap;
         var _loc4_:* = null as StringMap;
         var _loc5_:* = null as Font;
         var _loc2_:StringMap = cachedFonts;
         if(param1 in StringMap.reserved ? _loc2_.existsReserved(param1) : param1 in _loc2_.h)
         {
            _loc3_ = cachedFonts;
            return Future.withValue(param1 in StringMap.reserved ? _loc3_.getReserved(param1) : _loc3_.h[param1]);
         }
         _loc3_ = classTypes;
         if(param1 in StringMap.reserved ? _loc3_.existsReserved(param1) : param1 in _loc3_.h)
         {
            _loc4_ = classTypes;
            _loc5_ = Type.createInstance(param1 in StringMap.reserved ? _loc4_.getReserved(param1) : _loc4_.h[param1],[]);
            return Future.withValue(_loc5_);
         }
         return Font.loadFromFile(getPath(param1));
      }
      
      public function loadBytes_onComplete(param1:String, param2:Bytes) : void
      {
         var _loc3_:StringMap = cachedBytes;
         if(param1 in StringMap.reserved)
         {
            _loc3_.setReserved(param1,param2);
         }
         else
         {
            _loc3_.h[param1] = param2;
         }
         __assetLoaded(param1);
      }
      
      public function loadBytes(param1:String) : Future
      {
         var _loc3_:* = null as StringMap;
         var _loc4_:* = null as StringMap;
         var _loc2_:StringMap = cachedBytes;
         if(param1 in StringMap.reserved ? _loc2_.existsReserved(param1) : param1 in _loc2_.h)
         {
            _loc3_ = cachedBytes;
            return Future.withValue(param1 in StringMap.reserved ? _loc3_.getReserved(param1) : _loc3_.h[param1]);
         }
         _loc3_ = classTypes;
         if(param1 in StringMap.reserved ? _loc3_.existsReserved(param1) : param1 in _loc3_.h)
         {
            _loc4_ = classTypes;
            return Future.withValue(Bytes_Impl_.ofData(Type.createInstance(param1 in StringMap.reserved ? _loc4_.getReserved(param1) : _loc4_.h[param1],[])));
         }
         return Bytes_Impl_.loadFromFile(getPath(param1));
      }
      
      public function loadAudioBuffer_onError(param1:String, param2:*) : void
      {
         load_onError(param1,param2);
      }
      
      public function loadAudioBuffer_onComplete(param1:String, param2:AudioBuffer) : void
      {
         var _loc4_:* = null as StringMap;
         var _loc5_:* = null as Array;
         var _loc6_:* = null as StringMap;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:int = 0;
         var _loc10_:Boolean = false;
         var _loc11_:* = null;
         var _loc12_:int = 0;
         var _loc13_:Boolean = false;
         var _loc14_:int = 0;
         var _loc15_:* = null;
         var _loc16_:int = 0;
         var _loc17_:Boolean = false;
         var _loc18_:* = null as String;
         var _loc19_:* = null as String;
         var _loc20_:int = 0;
         var _loc21_:* = null as String;
         var _loc22_:* = null as StringMap;
         var _loc23_:* = null as StringMap;
         var _loc3_:StringMap = cachedAudioBuffers;
         if(param1 in StringMap.reserved)
         {
            _loc3_.setReserved(param1,param2);
         }
         else
         {
            _loc3_.h[param1] = param2;
         }
         _loc3_ = pathGroups;
         if(param1 in StringMap.reserved ? _loc3_.existsReserved(param1) : param1 in _loc3_.h)
         {
            _loc4_ = pathGroups;
            _loc5_ = param1 in StringMap.reserved ? _loc4_.getReserved(param1) : _loc4_.h[param1];
            _loc6_ = pathGroups;
            _loc7_ = _loc6_.h;
            _loc8_ = _loc6_.rh;
            _loc9_ = 0;
            _loc10_ = false;
            _loc11_ = _loc7_;
            _loc12_ = _loc9_;
            _loc13_ = §§hasnext(_loc11_,_loc12_);
            if(!_loc13_ && _loc8_ != null)
            {
               _loc7_ = _loc8_;
               _loc11_ = _loc7_;
               _loc9_ = 0;
               _loc12_ = _loc9_;
               _loc8_ = null;
               _loc10_ = true;
               _loc13_ = §§hasnext(_loc11_,_loc12_);
            }
            _loc14_ = _loc12_;
            while(true)
            {
               _loc15_ = _loc7_;
               _loc16_ = _loc9_;
               _loc17_ = §§hasnext(_loc15_,_loc16_);
               if(!_loc17_ && _loc8_ != null)
               {
                  _loc7_ = _loc8_;
                  _loc15_ = _loc7_;
                  _loc9_ = 0;
                  _loc16_ = _loc9_;
                  _loc8_ = null;
                  _loc10_ = true;
                  _loc17_ = §§hasnext(_loc15_,_loc16_);
               }
               _loc14_ = _loc16_;
               if(!_loc17_)
               {
                  break;
               }
               _loc18_ = §§nextname(_loc14_,_loc7_);
               _loc9_ = _loc14_;
               if(_loc10_)
               {
                  _loc18_ = _loc18_.substr(1);
               }
               _loc19_ = _loc18_;
               if(_loc19_ != param1)
               {
                  _loc20_ = 0;
                  while(_loc20_ < int(_loc5_.length))
                  {
                     _loc21_ = _loc5_[_loc20_];
                     _loc20_++;
                     _loc22_ = pathGroups;
                     if((_loc19_ in StringMap.reserved ? _loc22_.getReserved(_loc19_) : _loc22_.h[_loc19_]).indexOf(_loc21_) > -1)
                     {
                        _loc23_ = cachedAudioBuffers;
                        if(_loc19_ in StringMap.reserved)
                        {
                           _loc23_.setReserved(_loc19_,param2);
                        }
                        else
                        {
                           _loc23_.h[_loc19_] = param2;
                        }
                        break;
                     }
                  }
               }
            }
         }
         __assetLoaded(param1);
      }
      
      public function loadAudioBuffer(param1:String) : Future
      {
         var _loc3_:* = null as StringMap;
         var _loc4_:* = null as StringMap;
         var _loc5_:* = null as StringMap;
         var _loc2_:StringMap = cachedAudioBuffers;
         if(param1 in StringMap.reserved ? _loc2_.existsReserved(param1) : param1 in _loc2_.h)
         {
            _loc3_ = cachedAudioBuffers;
            return Future.withValue(param1 in StringMap.reserved ? _loc3_.getReserved(param1) : _loc3_.h[param1]);
         }
         _loc3_ = classTypes;
         if(param1 in StringMap.reserved ? _loc3_.existsReserved(param1) : param1 in _loc3_.h)
         {
            _loc4_ = classTypes;
            return Future.withValue(AudioBuffer.fromBytes(Type.createInstance(param1 in StringMap.reserved ? _loc4_.getReserved(param1) : _loc4_.h[param1],[])));
         }
         _loc4_ = pathGroups;
         if(param1 in StringMap.reserved ? _loc4_.existsReserved(param1) : param1 in _loc4_.h)
         {
            _loc5_ = pathGroups;
            return AudioBuffer.loadFromFiles(param1 in StringMap.reserved ? _loc5_.getReserved(param1) : _loc5_.h[param1]);
         }
         _loc5_ = paths;
         return AudioBuffer.loadFromFile(param1 in StringMap.reserved ? _loc5_.getReserved(param1) : _loc5_.h[param1]);
      }
      
      public function loadAsset(param1:String, param2:String) : Future
      {
         var _loc3_:String = param2;
         if(_loc3_ == "BINARY")
         {
            return loadBytes(param1);
         }
         if(_loc3_ == "FONT")
         {
            return loadFont(param1);
         }
         if(_loc3_ == "IMAGE")
         {
            return loadImage(param1);
         }
         if(_loc3_ != "MUSIC")
         {
            if(_loc3_ != "SOUND")
            {
               if(_loc3_ == "TEMPLATE")
               {
                  throw Exception.thrown("Not sure how to load template: " + param1);
               }
               if(_loc3_ == "TEXT")
               {
                  return loadText(param1);
               }
               throw Exception.thrown("Unknown asset type: " + param2);
            }
         }
         return loadAudioBuffer(param1);
      }
      
      public function load() : Future
      {
         var _loc1_:* = null as StringMap;
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:int = 0;
         var _loc5_:Boolean = false;
         var _loc6_:* = null;
         var _loc7_:int = 0;
         var _loc8_:Boolean = false;
         var _loc9_:int = 0;
         var _loc10_:* = null;
         var _loc11_:int = 0;
         var _loc12_:Boolean = false;
         var _loc13_:* = null as String;
         var _loc14_:* = null as String;
         var _loc15_:* = null as StringMap;
         var _loc16_:* = null as StringMap;
         var _loc17_:* = null as StringMap;
         var _loc18_:* = null as String;
         var _loc19_:* = null as String;
         var _loc20_:* = null as Future;
         if(loaded)
         {
            return Future.withValue(this);
         }
         if(promise == null)
         {
            promise = new Promise_lime_utils_AssetLibrary();
            bytesLoadedCache = new StringMap();
            assetsLoaded = 0;
            assetsTotal = 1;
            _loc1_ = preload;
            _loc2_ = _loc1_.h;
            _loc3_ = _loc1_.rh;
            _loc4_ = 0;
            _loc5_ = false;
            _loc6_ = _loc2_;
            _loc7_ = _loc4_;
            _loc8_ = §§hasnext(_loc6_,_loc7_);
            if(!_loc8_ && _loc3_ != null)
            {
               _loc2_ = _loc3_;
               _loc6_ = _loc2_;
               _loc4_ = 0;
               _loc7_ = _loc4_;
               _loc3_ = null;
               _loc5_ = true;
               _loc8_ = §§hasnext(_loc6_,_loc7_);
            }
            _loc9_ = _loc7_;
            while(true)
            {
               _loc10_ = _loc2_;
               _loc11_ = _loc4_;
               _loc12_ = §§hasnext(_loc10_,_loc11_);
               if(!_loc12_ && _loc3_ != null)
               {
                  _loc2_ = _loc3_;
                  _loc10_ = _loc2_;
                  _loc4_ = 0;
                  _loc11_ = _loc4_;
                  _loc3_ = null;
                  _loc5_ = true;
                  _loc12_ = §§hasnext(_loc10_,_loc11_);
               }
               _loc9_ = _loc11_;
               if(!_loc12_)
               {
                  break;
               }
               _loc13_ = §§nextname(_loc9_,_loc2_);
               _loc4_ = _loc9_;
               if(_loc5_)
               {
                  _loc13_ = _loc13_.substr(1);
               }
               _loc14_ = _loc13_;
               _loc15_ = preload;
               if(_loc14_ in StringMap.reserved ? _loc15_.getReserved(_loc14_) : _loc15_.h[_loc14_])
               {
                  _loc16_ = types;
                  Log.verbose("Preloading asset: " + _loc14_ + " [" + (_loc14_ in StringMap.reserved ? _loc16_.getReserved(_loc14_) : _loc16_.h[_loc14_]) + "]",{
                     "fileName":"lime/utils/AssetLibrary.hx",
                     "lineNumber":408,
                     "className":"lime.utils.AssetLibrary",
                     "methodName":"load"
                  });
                  _loc17_ = types;
                  _loc18_ = _loc14_ in StringMap.reserved ? _loc17_.getReserved(_loc14_) : _loc17_.h[_loc14_];
                  if(_loc18_ != null)
                  {
                     _loc19_ = _loc18_;
                     if(_loc19_ == "BINARY")
                     {
                        ++assetsTotal;
                        _loc20_ = loadBytes(_loc14_);
                        _loc20_.onProgress((function(param1:Array, param2:Array):Function
                        {
                           var id:Array = param1;
                           var _g:Array = param2;
                           return function(param1:int, param2:int):void
                           {
                              _g[0].load_onProgress(id[0],param1,param2);
                           };
                        })([_loc14_],[this]));
                        _loc20_.onError((function(param1:Array, param2:Array):Function
                        {
                           var id:Array = param1;
                           var _g:Array = param2;
                           return function(param1:*):void
                           {
                              _g[0].load_onError(id[0],param1);
                           };
                        })([_loc14_],[this]));
                        _loc20_.onComplete((function(param1:Array, param2:Array):Function
                        {
                           var id:Array = param1;
                           var _g:Array = param2;
                           return function(param1:Bytes):void
                           {
                              _g[0].loadBytes_onComplete(id[0],param1);
                           };
                        })([_loc14_],[this]));
                     }
                     else if(_loc19_ == "FONT")
                     {
                        ++assetsTotal;
                        _loc20_ = loadFont(_loc14_);
                        _loc20_.onProgress((function(param1:Array, param2:Array):Function
                        {
                           var id:Array = param1;
                           var _g:Array = param2;
                           return function(param1:int, param2:int):void
                           {
                              _g[0].load_onProgress(id[0],param1,param2);
                           };
                        })([_loc14_],[this]));
                        _loc20_.onError((function(param1:Array, param2:Array):Function
                        {
                           var id:Array = param1;
                           var _g:Array = param2;
                           return function(param1:*):void
                           {
                              _g[0].load_onError(id[0],param1);
                           };
                        })([_loc14_],[this]));
                        _loc20_.onComplete((function(param1:Array, param2:Array):Function
                        {
                           var id:Array = param1;
                           var _g:Array = param2;
                           return function(param1:Font):void
                           {
                              _g[0].loadFont_onComplete(id[0],param1);
                           };
                        })([_loc14_],[this]));
                     }
                     else if(_loc19_ == "IMAGE")
                     {
                        ++assetsTotal;
                        _loc20_ = loadImage(_loc14_);
                        _loc20_.onProgress((function(param1:Array, param2:Array):Function
                        {
                           var id:Array = param1;
                           var _g:Array = param2;
                           return function(param1:int, param2:int):void
                           {
                              _g[0].load_onProgress(id[0],param1,param2);
                           };
                        })([_loc14_],[this]));
                        _loc20_.onError((function(param1:Array, param2:Array):Function
                        {
                           var id:Array = param1;
                           var _g:Array = param2;
                           return function(param1:*):void
                           {
                              _g[0].load_onError(id[0],param1);
                           };
                        })([_loc14_],[this]));
                        _loc20_.onComplete((function(param1:Array, param2:Array):Function
                        {
                           var id:Array = param1;
                           var _g:Array = param2;
                           return function(param1:Image):void
                           {
                              _g[0].loadImage_onComplete(id[0],param1);
                           };
                        })([_loc14_],[this]));
                     }
                     else
                     {
                        if(_loc19_ != "MUSIC")
                        {
                           if(_loc19_ != "SOUND")
                           {
                              if(_loc19_ == "TEXT")
                              {
                                 ++assetsTotal;
                                 _loc20_ = loadText(_loc14_);
                                 _loc20_.onProgress((function(param1:Array, param2:Array):Function
                                 {
                                    var id:Array = param1;
                                    var _g:Array = param2;
                                    return function(param1:int, param2:int):void
                                    {
                                       _g[0].load_onProgress(id[0],param1,param2);
                                    };
                                 })([_loc14_],[this]));
                                 _loc20_.onError((function(param1:Array, param2:Array):Function
                                 {
                                    var id:Array = param1;
                                    var _g:Array = param2;
                                    return function(param1:*):void
                                    {
                                       _g[0].load_onError(id[0],param1);
                                    };
                                 })([_loc14_],[this]));
                                 _loc20_.onComplete((function(param1:Array, param2:Array):Function
                                 {
                                    var id:Array = param1;
                                    var _g:Array = param2;
                                    return function(param1:String):void
                                    {
                                       _g[0].loadText_onComplete(id[0],param1);
                                    };
                                 })([_loc14_],[this]));
                              }
                              continue;
                           }
                        }
                        ++assetsTotal;
                        _loc20_ = loadAudioBuffer(_loc14_);
                        _loc20_.onProgress((function(param1:Array, param2:Array):Function
                        {
                           var id:Array = param1;
                           var _g:Array = param2;
                           return function(param1:int, param2:int):void
                           {
                              _g[0].load_onProgress(id[0],param1,param2);
                           };
                        })([_loc14_],[this]));
                        _loc20_.onError((function(param1:Array, param2:Array):Function
                        {
                           var id:Array = param1;
                           var _g:Array = param2;
                           return function(param1:*):void
                           {
                              _g[0].loadAudioBuffer_onError(id[0],param1);
                           };
                        })([_loc14_],[this]));
                        _loc20_.onComplete((function(param1:Array, param2:Array):Function
                        {
                           var id:Array = param1;
                           var _g:Array = param2;
                           return function(param1:AudioBuffer):void
                           {
                              _g[0].loadAudioBuffer_onComplete(id[0],param1);
                           };
                        })([_loc14_],[this]));
                     }
                  }
               }
            }
            __assetLoaded(null);
         }
         return promise.future;
      }
      
      public function list(param1:String) : Array
      {
         var _loc13_:* = null;
         var _loc14_:int = 0;
         var _loc15_:Boolean = false;
         var _loc16_:* = null as String;
         var _loc17_:* = null as String;
         if(param1 != null)
         {
            var _temp_1:* = param1;
            §§push(_temp_1);
            if(!(_temp_1 is String))
            {
               throw "Class cast error";
            }
            §§push(§§pop());
         }
         else
         {
            §§push(null);
         }
         var _loc2_:String = §§pop();
         var _loc3_:Array = [];
         var _loc4_:StringMap = types;
         var _loc5_:* = _loc4_.h;
         var _loc6_:* = _loc4_.rh;
         var _loc7_:int = 0;
         var _loc8_:Boolean = false;
         var _loc9_:* = _loc5_;
         var _loc10_:int = _loc7_;
         var _loc11_:Boolean = §§hasnext(_loc9_,_loc10_);
         if(!_loc11_ && _loc6_ != null)
         {
            _loc5_ = _loc6_;
            _loc9_ = _loc5_;
            _loc7_ = 0;
            _loc10_ = _loc7_;
            _loc6_ = null;
            _loc8_ = true;
            _loc11_ = §§hasnext(_loc9_,_loc10_);
         }
         var _loc12_:int = _loc10_;
         while(true)
         {
            _loc13_ = _loc5_;
            _loc14_ = _loc7_;
            _loc15_ = §§hasnext(_loc13_,_loc14_);
            if(!_loc15_ && _loc6_ != null)
            {
               _loc5_ = _loc6_;
               _loc13_ = _loc5_;
               _loc7_ = 0;
               _loc14_ = _loc7_;
               _loc6_ = null;
               _loc8_ = true;
               _loc15_ = §§hasnext(_loc13_,_loc14_);
            }
            _loc12_ = _loc14_;
            if(!_loc15_)
            {
               break;
            }
            _loc16_ = §§nextname(_loc12_,_loc5_);
            _loc7_ = _loc12_;
            if(_loc8_)
            {
               _loc16_ = _loc16_.substr(1);
            }
            _loc17_ = _loc16_;
            if(_loc2_ == null || exists(_loc17_,param1))
            {
               _loc3_.push(_loc17_);
            }
         }
         return _loc3_;
      }
      
      public function isLocal(param1:String, param2:String) : Boolean
      {
         var _loc5_:Boolean = false;
         var _loc6_:Boolean = false;
         var _loc7_:Boolean = false;
         var _loc8_:* = null as StringMap;
         var _loc9_:* = null as StringMap;
         var _loc10_:* = null as String;
         var _loc3_:StringMap = classTypes;
         if(param1 in StringMap.reserved ? _loc3_.existsReserved(param1) : param1 in _loc3_.h)
         {
            return true;
         }
         var _temp_1:* = param2;
         §§push(_temp_1);
         if(!(_temp_1 is String))
         {
            throw "Class cast error";
         }
         var _loc4_:String = §§pop();
         if(_loc4_ == null)
         {
            _loc8_ = cachedBytes;
            if(!(param1 in StringMap.reserved ? _loc8_.existsReserved(param1) : param1 in _loc8_.h))
            {
               _loc9_ = cachedText;
               _loc7_ = param1 in StringMap.reserved ? _loc9_.existsReserved(param1) : param1 in _loc9_.h;
            }
            else
            {
               _loc7_ = true;
            }
            if(!_loc7_)
            {
               _loc9_ = cachedImages;
               _loc6_ = param1 in StringMap.reserved ? _loc9_.existsReserved(param1) : param1 in _loc9_.h;
            }
            else
            {
               _loc6_ = true;
            }
            if(!_loc6_)
            {
               _loc9_ = cachedAudioBuffers;
               _loc5_ = param1 in StringMap.reserved ? _loc9_.existsReserved(param1) : param1 in _loc9_.h;
            }
            else
            {
               _loc5_ = true;
            }
            if(!_loc5_)
            {
               _loc9_ = cachedFonts;
               if(param1 in StringMap.reserved)
               {
                  return _loc9_.existsReserved(param1);
               }
               return param1 in _loc9_.h;
            }
            return true;
         }
         _loc10_ = _loc4_;
         if(_loc10_ == "FONT")
         {
            _loc8_ = cachedFonts;
            if(param1 in StringMap.reserved)
            {
               return _loc8_.existsReserved(param1);
            }
            return param1 in _loc8_.h;
         }
         if(_loc10_ == "IMAGE")
         {
            _loc8_ = cachedImages;
            if(param1 in StringMap.reserved)
            {
               return _loc8_.existsReserved(param1);
            }
            return param1 in _loc8_.h;
         }
         if(_loc10_ != "MUSIC")
         {
            if(_loc10_ != "SOUND")
            {
               _loc8_ = cachedBytes;
               if(!(param1 in StringMap.reserved ? _loc8_.existsReserved(param1) : param1 in _loc8_.h))
               {
                  _loc9_ = cachedText;
                  if(param1 in StringMap.reserved)
                  {
                     return _loc9_.existsReserved(param1);
                  }
                  return param1 in _loc9_.h;
               }
               return true;
            }
         }
         _loc8_ = cachedAudioBuffers;
         if(param1 in StringMap.reserved)
         {
            return _loc8_.existsReserved(param1);
         }
         return param1 in _loc8_.h;
      }
      
      public function getText(param1:String) : String
      {
         var _loc3_:* = null as StringMap;
         var _loc4_:* = null as Bytes;
         var _loc2_:StringMap = cachedText;
         if(param1 in StringMap.reserved ? _loc2_.existsReserved(param1) : param1 in _loc2_.h)
         {
            _loc3_ = cachedText;
            if(param1 in StringMap.reserved)
            {
               return _loc3_.getReserved(param1);
            }
            return _loc3_.h[param1];
         }
         _loc4_ = getBytes(param1);
         if(_loc4_ == null)
         {
            return null;
         }
         return _loc4_.getString(0,_loc4_.length);
      }
      
      public function getPath(param1:String) : String
      {
         var _loc3_:* = null as StringMap;
         var _loc4_:* = null as StringMap;
         var _loc2_:StringMap = paths;
         if(param1 in StringMap.reserved ? _loc2_.existsReserved(param1) : param1 in _loc2_.h)
         {
            _loc3_ = paths;
            if(param1 in StringMap.reserved)
            {
               return _loc3_.getReserved(param1);
            }
            return _loc3_.h[param1];
         }
         _loc3_ = pathGroups;
         if(param1 in StringMap.reserved ? _loc3_.existsReserved(param1) : param1 in _loc3_.h)
         {
            _loc4_ = pathGroups;
            return (param1 in StringMap.reserved ? _loc4_.getReserved(param1) : _loc4_.h[param1])[0];
         }
         return null;
      }
      
      public function getImage(param1:String) : Image
      {
         var _loc3_:* = null as StringMap;
         var _loc4_:* = null as StringMap;
         var _loc2_:StringMap = cachedImages;
         if(param1 in StringMap.reserved ? _loc2_.existsReserved(param1) : param1 in _loc2_.h)
         {
            _loc3_ = cachedImages;
            if(param1 in StringMap.reserved)
            {
               return _loc3_.getReserved(param1);
            }
            return _loc3_.h[param1];
         }
         _loc3_ = classTypes;
         if(param1 in StringMap.reserved ? _loc3_.existsReserved(param1) : param1 in _loc3_.h)
         {
            _loc4_ = classTypes;
            return Image.fromBitmapData(Type.createInstance(param1 in StringMap.reserved ? _loc4_.getReserved(param1) : _loc4_.h[param1],[]));
         }
         return Image.fromFile(getPath(param1));
      }
      
      public function getFont(param1:String) : Font
      {
         var _loc3_:* = null as StringMap;
         var _loc4_:* = null as StringMap;
         var _loc5_:* = null;
         var _loc6_:* = null as Font;
         var _loc2_:StringMap = cachedFonts;
         if(param1 in StringMap.reserved ? _loc2_.existsReserved(param1) : param1 in _loc2_.h)
         {
            _loc3_ = cachedFonts;
            if(param1 in StringMap.reserved)
            {
               return _loc3_.getReserved(param1);
            }
            return _loc3_.h[param1];
         }
         _loc3_ = classTypes;
         if(param1 in StringMap.reserved ? _loc3_.existsReserved(param1) : param1 in _loc3_.h)
         {
            _loc4_ = classTypes;
            _loc5_ = Type.createInstance(param1 in StringMap.reserved ? _loc4_.getReserved(param1) : _loc4_.h[param1],[]);
            _loc6_ = new Font(_loc5_.fontName);
            _loc6_.src = _loc5_;
            return _loc6_;
         }
         return Font.fromFile(getPath(param1));
      }
      
      public function getBytes(param1:String) : Bytes
      {
         var _loc3_:* = null as StringMap;
         var _loc4_:* = null as StringMap;
         var _loc5_:* = null as Bytes;
         var _loc6_:* = null as StringMap;
         var _loc7_:* = null;
         var _loc8_:* = null as StringMap;
         var _loc9_:* = null as String;
         var _loc10_:* = null as String;
         var _loc11_:* = null as StringMap;
         var _loc12_:* = null as BitmapData;
         var _loc2_:StringMap = cachedBytes;
         if(param1 in StringMap.reserved ? _loc2_.existsReserved(param1) : param1 in _loc2_.h)
         {
            _loc3_ = cachedBytes;
            if(param1 in StringMap.reserved)
            {
               return _loc3_.getReserved(param1);
            }
            return _loc3_.h[param1];
         }
         _loc3_ = cachedText;
         if(param1 in StringMap.reserved ? _loc3_.existsReserved(param1) : param1 in _loc3_.h)
         {
            _loc4_ = cachedText;
            _loc5_ = Bytes_Impl_.ofString(param1 in StringMap.reserved ? _loc4_.getReserved(param1) : _loc4_.h[param1]);
            _loc6_ = cachedBytes;
            if(param1 in StringMap.reserved)
            {
               _loc6_.setReserved(param1,_loc5_);
            }
            else
            {
               _loc6_.h[param1] = _loc5_;
            }
            return _loc5_;
         }
         _loc4_ = classTypes;
         if(param1 in StringMap.reserved ? _loc4_.existsReserved(param1) : param1 in _loc4_.h)
         {
            _loc6_ = classTypes;
            _loc7_ = Type.createInstance(param1 in StringMap.reserved ? _loc6_.getReserved(param1) : _loc6_.h[param1],[]);
            _loc8_ = types;
            _loc9_ = param1 in StringMap.reserved ? _loc8_.getReserved(param1) : _loc8_.h[param1];
            if(_loc9_ == null)
            {
               return null;
            }
            _loc10_ = _loc9_;
            if(_loc10_ != "BINARY")
            {
               if(_loc10_ != "TEXT")
               {
                  if(_loc10_ == "IMAGE")
                  {
                     _loc11_ = classTypes;
                     _loc12_ = Type.createInstance(param1 in StringMap.reserved ? _loc11_.getReserved(param1) : _loc11_.h[param1],[]);
                     return Bytes_Impl_.ofData(_loc12_.getPixels(_loc12_.rect));
                  }
                  return null;
               }
            }
            _loc11_ = classTypes;
            return Bytes_Impl_.ofData(Type.createInstance(param1 in StringMap.reserved ? _loc11_.getReserved(param1) : _loc11_.h[param1],[]));
         }
         return Bytes_Impl_.fromFile(getPath(param1));
      }
      
      public function getAudioBuffer(param1:String) : AudioBuffer
      {
         var _loc3_:* = null as StringMap;
         var _loc4_:* = null as AudioBuffer;
         var _loc5_:* = null as StringMap;
         var _loc2_:StringMap = cachedAudioBuffers;
         if(param1 in StringMap.reserved ? _loc2_.existsReserved(param1) : param1 in _loc2_.h)
         {
            _loc3_ = cachedAudioBuffers;
            if(param1 in StringMap.reserved)
            {
               return _loc3_.getReserved(param1);
            }
            return _loc3_.h[param1];
         }
         _loc3_ = classTypes;
         if(param1 in StringMap.reserved ? _loc3_.existsReserved(param1) : param1 in _loc3_.h)
         {
            _loc4_ = new AudioBuffer();
            _loc5_ = classTypes;
            _loc4_.set_src(Type.createInstance(param1 in StringMap.reserved ? _loc5_.getReserved(param1) : _loc5_.h[param1],[]));
            return _loc4_;
         }
         return AudioBuffer.fromFile(getPath(param1));
      }
      
      public function getAsset(param1:String, param2:String) : *
      {
         var _loc3_:String = param2;
         if(_loc3_ == "BINARY")
         {
            return getBytes(param1);
         }
         if(_loc3_ == "FONT")
         {
            return getFont(param1);
         }
         if(_loc3_ == "IMAGE")
         {
            return getImage(param1);
         }
         if(_loc3_ != "MUSIC")
         {
            if(_loc3_ != "SOUND")
            {
               if(_loc3_ == "TEMPLATE")
               {
                  throw Exception.thrown("Not sure how to get template: " + param1);
               }
               if(_loc3_ == "TEXT")
               {
                  return getText(param1);
               }
               throw Exception.thrown("Unknown asset type: " + param2);
            }
         }
         return getAudioBuffer(param1);
      }
      
      public function exists(param1:String, param2:String) : Boolean
      {
         var _loc6_:Boolean = false;
         var _loc7_:* = null as StringMap;
         if(param2 != null)
         {
            var _temp_1:* = param2;
            §§push(_temp_1);
            if(!(_temp_1 is String))
            {
               throw "Class cast error";
            }
            §§push(§§pop());
         }
         else
         {
            §§push(null);
         }
         var _loc3_:String = §§pop();
         var _loc4_:StringMap = types;
         var _loc5_:String = param1 in StringMap.reserved ? _loc4_.getReserved(param1) : _loc4_.h[param1];
         if(_loc5_ != null)
         {
            if(_loc5_ == _loc3_ || (_loc3_ == "SOUND" || _loc3_ == "MUSIC") && (_loc5_ == "MUSIC" || _loc5_ == "SOUND"))
            {
               return true;
            }
            if(_loc3_ == "BINARY" && (_loc5_ == "BINARY" || _loc5_ == "TEXT" || _loc5_ == "IMAGE"))
            {
               return true;
            }
            if(_loc3_ == "TEXT" && _loc5_ == "BINARY")
            {
               return true;
            }
            if(_loc3_ != null)
            {
               _loc7_ = paths;
               _loc6_ = param1 in StringMap.reserved ? _loc7_.existsReserved(param1) : param1 in _loc7_.h;
            }
            else
            {
               _loc6_ = true;
            }
            if(_loc6_)
            {
               return true;
            }
         }
         return false;
      }
      
      public function __resolvePath(param1:String) : String
      {
         var _loc3_:int = 0;
         var _loc4_:* = null as String;
         var _loc5_:* = null as Array;
         var _loc6_:* = null as Array;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         param1 = StringTools.replace(param1,"\\","/");
         var _loc2_:int = param1.indexOf(":");
         if(StringTools.startsWith(param1,"http") && _loc2_ > 0)
         {
            _loc3_ = _loc2_ + 3;
            _loc4_ = param1.substr(0,_loc3_);
            param1 = _loc4_ + StringTools.replace(param1.substr(_loc3_),"//","/");
         }
         else
         {
            param1 = StringTools.replace(param1,"//","/");
         }
         if(param1.indexOf("./") > -1)
         {
            _loc5_ = param1.split("/");
            _loc6_ = [];
            _loc3_ = 0;
            _loc7_ = int(_loc5_.length);
            while(_loc3_ < _loc7_)
            {
               _loc8_ = _loc3_++;
               if(_loc5_[_loc8_] == "..")
               {
                  if(_loc8_ == 0 || _loc6_[_loc8_ - 1] == "..")
                  {
                     _loc6_.push("..");
                  }
                  else
                  {
                     _loc6_.pop();
                  }
               }
               else if(_loc5_[_loc8_] == ".")
               {
                  if(_loc8_ == 0)
                  {
                     _loc6_.push(".");
                  }
               }
               else
               {
                  _loc6_.push(_loc5_[_loc8_]);
               }
            }
            param1 = _loc6_.join("/");
         }
         return param1;
      }
      
      public function __fromManifest(param1:AssetManifest) : void
      {
         var _loc3_:int = 0;
         var _loc4_:* = null as String;
         var _loc5_:* = null as Array;
         var _loc6_:* = null as Class;
         var _loc10_:* = null;
         var _loc11_:* = null as IMap;
         var _loc12_:* = null as String;
         var _loc13_:* = null as StringMap;
         var _loc14_:int = 0;
         var _loc15_:int = 0;
         var _loc16_:int = 0;
         var _loc17_:Boolean = false;
         var _loc18_:Boolean = false;
         var _loc19_:* = null as StringMap;
         var _loc2_:Boolean = param1.version >= 2;
         var _loc7_:String = param1.rootPath;
         if(_loc7_ == null)
         {
            _loc7_ = "";
         }
         if(_loc7_ != "")
         {
            _loc7_ += "/";
         }
         var _loc8_:int = 0;
         var _loc9_:Array = param1.assets;
         while(_loc8_ < int(_loc9_.length))
         {
            _loc10_ = _loc9_[_loc8_];
            _loc8_++;
            _loc3_ = _loc2_ && Reflect.hasField(_loc10_,"size") ? int(_loc10_.size) : 100;
            _loc4_ = Reflect.hasField(_loc10_,"id") ? _loc10_.id : _loc10_.path;
            if(Reflect.hasField(_loc10_,"path"))
            {
               _loc11_ = paths;
               _loc12_ = __cacheBreak(__resolvePath(_loc7_ + Std.string(Reflect.field(_loc10_,"path"))));
               _loc13_ = _loc11_;
               if(_loc4_ in StringMap.reserved)
               {
                  _loc13_.setReserved(_loc4_,_loc12_);
               }
               else
               {
                  _loc13_.h[_loc4_] = _loc12_;
               }
            }
            if(Reflect.hasField(_loc10_,"pathGroup"))
            {
               _loc5_ = Reflect.field(_loc10_,"pathGroup");
               _loc14_ = 0;
               _loc15_ = int(_loc5_.length);
               while(_loc14_ < _loc15_)
               {
                  _loc16_ = _loc14_++;
                  _loc5_[_loc16_] = __cacheBreak(__resolvePath(_loc7_ + _loc5_[_loc16_]));
               }
               _loc13_ = pathGroups;
               if(_loc4_ in StringMap.reserved)
               {
                  _loc13_.setReserved(_loc4_,_loc5_);
               }
               else
               {
                  _loc13_.h[_loc4_] = _loc5_;
               }
            }
            _loc13_ = sizes;
            if(_loc4_ in StringMap.reserved)
            {
               _loc13_.setReserved(_loc4_,_loc3_);
            }
            else
            {
               _loc13_.h[_loc4_] = _loc3_;
            }
            _loc12_ = _loc10_.type;
            _loc13_ = types;
            if(_loc4_ in StringMap.reserved)
            {
               _loc13_.setReserved(_loc4_,_loc12_);
            }
            else
            {
               _loc13_.h[_loc4_] = _loc12_;
            }
            if(Reflect.hasField(_loc10_,"preload"))
            {
               _loc11_ = preload;
               _loc17_ = Boolean(Reflect.field(_loc10_,"preload"));
               _loc13_ = _loc11_;
               if(_loc4_ in StringMap.reserved)
               {
                  _loc13_.setReserved(_loc4_,_loc17_);
               }
               else
               {
                  _loc13_.h[_loc4_] = _loc17_;
               }
            }
            if(Reflect.hasField(_loc10_,"className"))
            {
               _loc6_ = Type.resolveClass(Reflect.field(_loc10_,"className"));
               _loc13_ = classTypes;
               if(_loc4_ in StringMap.reserved)
               {
                  _loc13_.setReserved(_loc4_,_loc6_);
               }
               else
               {
                  _loc13_.h[_loc4_] = _loc6_;
               }
            }
         }
         bytesTotal = 0;
         _loc8_ = 0;
         _loc9_ = param1.assets;
         while(_loc8_ < int(_loc9_.length))
         {
            _loc10_ = _loc9_[_loc8_];
            _loc8_++;
            _loc4_ = Reflect.hasField(_loc10_,"id") ? _loc10_.id : _loc10_.path;
            _loc13_ = preload;
            if(_loc4_ in StringMap.reserved ? _loc13_.existsReserved(_loc4_) : _loc4_ in _loc13_.h)
            {
               _loc19_ = preload;
               _loc18_ = Boolean(_loc4_ in StringMap.reserved ? _loc19_.getReserved(_loc4_) : _loc19_.h[_loc4_]);
            }
            else
            {
               _loc18_ = false;
            }
            if(_loc18_)
            {
               _loc19_ = sizes;
               _loc17_ = _loc4_ in StringMap.reserved ? _loc19_.existsReserved(_loc4_) : _loc4_ in _loc19_.h;
            }
            else
            {
               _loc17_ = false;
            }
            if(_loc17_)
            {
               _loc19_ = sizes;
               bytesTotal += _loc4_ in StringMap.reserved ? _loc19_.getReserved(_loc4_) : _loc19_.h[_loc4_];
            }
         }
      }
      
      public function __fromBundle(param1:AssetBundle, param2:AssetManifest = undefined) : void
      {
         var _loc3_:* = null as String;
         var _loc4_:* = null as Bytes;
         var _loc5_:* = null as String;
         var _loc6_:int = 0;
         var _loc7_:* = null as Array;
         var _loc8_:* = null;
         var _loc9_:* = null as String;
         var _loc10_:* = null as StringMap;
         var _loc11_:* = null as IMap;
         var _loc12_:* = null as String;
         var _loc13_:* = null as StringMap;
         var _loc14_:* = null as Bytes;
         if(param2 != null)
         {
            _loc6_ = 0;
            _loc7_ = param2.assets;
            while(_loc6_ < int(_loc7_.length))
            {
               _loc8_ = _loc7_[_loc6_];
               _loc6_++;
               _loc3_ = Reflect.hasField(_loc8_,"id") ? _loc8_.id : _loc8_.path;
               _loc9_ = _loc8_.path;
               _loc10_ = param1.data;
               _loc4_ = _loc9_ in StringMap.reserved ? _loc10_.getReserved(_loc9_) : _loc10_.h[_loc9_];
               if(Reflect.hasField(_loc8_,"type"))
               {
                  _loc5_ = _loc8_.type;
                  if(_loc5_ == "TEXT")
                  {
                     _loc11_ = cachedText;
                     _loc12_ = _loc4_ != null ? Std.string(_loc4_) : null;
                     _loc13_ = _loc11_;
                     if(_loc3_ in StringMap.reserved)
                     {
                        _loc13_.setReserved(_loc3_,_loc12_);
                     }
                     else
                     {
                        _loc13_.h[_loc3_] = _loc12_;
                     }
                  }
                  else
                  {
                     _loc13_ = cachedBytes;
                     _loc14_ = _loc4_;
                     if(_loc3_ in StringMap.reserved)
                     {
                        _loc13_.setReserved(_loc3_,_loc14_);
                     }
                     else
                     {
                        _loc13_.h[_loc3_] = _loc14_;
                     }
                  }
                  _loc12_ = _loc8_.type;
                  _loc13_ = types;
                  if(_loc3_ in StringMap.reserved)
                  {
                     _loc13_.setReserved(_loc3_,_loc12_);
                  }
                  else
                  {
                     _loc13_.h[_loc3_] = _loc12_;
                  }
               }
               else
               {
                  _loc13_ = cachedBytes;
                  _loc14_ = _loc4_;
                  if(_loc3_ in StringMap.reserved)
                  {
                     _loc13_.setReserved(_loc3_,_loc14_);
                  }
                  else
                  {
                     _loc13_.h[_loc3_] = _loc14_;
                  }
                  _loc13_ = types;
                  _loc12_ = "BINARY";
                  if(_loc3_ in StringMap.reserved)
                  {
                     _loc13_.setReserved(_loc3_,_loc12_);
                  }
                  else
                  {
                     _loc13_.h[_loc3_] = _loc12_;
                  }
               }
            }
         }
         else
         {
            _loc6_ = 0;
            _loc7_ = param1.paths;
            while(_loc6_ < int(_loc7_.length))
            {
               _loc3_ = _loc7_[_loc6_];
               _loc6_++;
               _loc11_ = cachedBytes;
               _loc10_ = param1.data;
               _loc4_ = _loc3_ in StringMap.reserved ? _loc10_.getReserved(_loc3_) : _loc10_.h[_loc3_];
               _loc13_ = _loc11_;
               if(_loc3_ in StringMap.reserved)
               {
                  _loc13_.setReserved(_loc3_,_loc4_);
               }
               else
               {
                  _loc13_.h[_loc3_] = _loc4_;
               }
               _loc10_ = types;
               _loc5_ = "BINARY";
               if(_loc3_ in StringMap.reserved)
               {
                  _loc10_.setReserved(_loc3_,_loc5_);
               }
               else
               {
                  _loc10_.h[_loc3_] = _loc5_;
               }
            }
         }
      }
      
      public function __cacheBreak(param1:String) : String
      {
         return Assets.__cacheBreak(param1);
      }
      
      public function __assetLoaded(param1:String) : void
      {
         var _loc2_:* = null as StringMap;
         var _loc3_:* = null as Object;
         var _loc4_:* = null as StringMap;
         var _loc5_:* = null as StringMap;
         var _loc6_:* = null as Object;
         ++assetsLoaded;
         if(param1 != null)
         {
            _loc2_ = types;
            Log.verbose("Loaded asset: " + param1 + " [" + (param1 in StringMap.reserved ? _loc2_.getReserved(param1) : _loc2_.h[param1]) + "] (" + (assetsLoaded - 1) + "/" + (assetsTotal - 1) + ")",{
               "fileName":"lime/utils/AssetLibrary.hx",
               "lineNumber":637,
               "className":"lime.utils.AssetLibrary",
               "methodName":"__assetLoaded"
            });
         }
         if(param1 != null)
         {
            _loc2_ = sizes;
            if(param1 in StringMap.reserved ? _loc2_.existsReserved(param1) : param1 in _loc2_.h)
            {
               _loc4_ = sizes;
               _loc3_ = param1 in StringMap.reserved ? _loc4_.getReserved(param1) : _loc4_.h[param1];
            }
            else
            {
               _loc3_ = 0;
            }
            _loc4_ = bytesLoadedCache;
            if(!(param1 in StringMap.reserved ? _loc4_.existsReserved(param1) : param1 in _loc4_.h))
            {
               bytesLoaded += _loc3_;
            }
            else
            {
               _loc5_ = bytesLoadedCache;
               _loc6_ = param1 in StringMap.reserved ? _loc5_.getReserved(param1) : _loc5_.h[param1];
               if(_loc6_ < _loc3_)
               {
                  bytesLoaded += _loc3_ - _loc6_;
               }
            }
            _loc5_ = bytesLoadedCache;
            if(param1 in StringMap.reserved)
            {
               _loc5_.setReserved(param1,_loc3_);
            }
            else
            {
               _loc5_.h[param1] = _loc3_;
            }
         }
         if(assetsLoaded < assetsTotal)
         {
            promise.progress(bytesLoaded,bytesTotal);
         }
         else
         {
            loaded = true;
            promise.progress(bytesTotal,bytesTotal);
            promise.complete(this);
         }
      }
   }
}

