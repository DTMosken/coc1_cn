package openfl.utils
{
   import flash.display.BitmapData;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.media.Sound;
   import flash.text.Font;
   import flash.utils.ByteArray;
   import haxe.IMap;
   import haxe.ds.StringMap;
   import haxe.io.Bytes;
   import lime.app.Future;
   import lime.app.Promise_openfl_display_BitmapData;
   import lime.app.Promise_openfl_display_MovieClip;
   import lime.app.Promise_openfl_media_Sound;
   import lime.app.Promise_openfl_text_Font;
   import lime.app.Promise_openfl_utils_ByteArray;
   import lime.graphics.Image;
   import lime.media.AudioBuffer;
   import lime.text.Font;
   import lime.utils.AssetLibrary;
   import lime.utils.Assets;
   import lime.utils.Log;
   import openfl.utils._ByteArray.ByteArray_Impl_;
   
   public class Assets
   {
      
      public static var init__:Boolean;
      
      public static var cache:IAssetCache;
      
      public static var dispatcher:EventDispatcher;
      
      public static var libraryBindings:IMap;
      
      public function Assets()
      {
      }
      
      public static function addEventListener(param1:String, param2:*, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         if(!lime.utils.Assets.onChange.has(openfl.utils.Assets.LimeAssets_onChange))
         {
            lime.utils.Assets.onChange.add(openfl.utils.Assets.LimeAssets_onChange);
         }
         openfl.utils.Assets.dispatcher.addEventListener(param1,param2,param3,param4,param5);
      }
      
      public static function dispatchEvent(param1:Event) : Boolean
      {
         return openfl.utils.Assets.dispatcher.dispatchEvent(param1);
      }
      
      public static function exists(param1:String, param2:String = undefined) : Boolean
      {
         return lime.utils.Assets.exists(param1,param2);
      }
      
      public static function getBitmapData(param1:String, param2:Boolean = true) : BitmapData
      {
         var _loc3_:* = null as BitmapData;
         if(param2 && openfl.utils.Assets.cache.get_enabled() && openfl.utils.Assets.cache.hasBitmapData(param1))
         {
            _loc3_ = openfl.utils.Assets.cache.getBitmapData(param1);
            if(openfl.utils.Assets.isValidBitmapData(_loc3_))
            {
               return _loc3_;
            }
         }
         var _loc4_:Image = lime.utils.Assets.getImage(param1,false);
         if(_loc4_ != null)
         {
            _loc3_ = _loc4_.get_src();
            if(param2 && openfl.utils.Assets.cache.get_enabled())
            {
               openfl.utils.Assets.cache.setBitmapData(param1,_loc3_);
            }
            return _loc3_;
         }
         return null;
      }
      
      public static function getBytes(param1:String) : ByteArray
      {
         return ByteArray_Impl_.fromLimeBytes(lime.utils.Assets.getBytes(param1));
      }
      
      public static function getFont(param1:String, param2:Boolean = true) : flash.text.Font
      {
         var _loc4_:* = null as flash.text.Font;
         if(param2 && openfl.utils.Assets.cache.get_enabled() && openfl.utils.Assets.cache.hasFont(param1))
         {
            return openfl.utils.Assets.cache.getFont(param1);
         }
         var _loc3_:lime.text.Font = lime.utils.Assets.getFont(param1,false);
         if(_loc3_ != null)
         {
            _loc4_ = _loc3_.src;
            if(param2 && openfl.utils.Assets.cache.get_enabled())
            {
               openfl.utils.Assets.cache.setFont(param1,_loc4_);
            }
            return _loc4_;
         }
         return new flash.text.Font();
      }
      
      public static function getLibrary(param1:String) : lime.utils.AssetLibrary
      {
         return lime.utils.Assets.getLibrary(param1);
      }
      
      public static function getMovieClip(param1:String) : MovieClip
      {
         var _loc5_:* = null as openfl.utils.AssetLibrary;
         var _loc2_:String = param1.substring(0,param1.indexOf(":"));
         var _loc3_:String = param1.substr(param1.indexOf(":") + 1);
         var _loc4_:lime.utils.AssetLibrary = openfl.utils.Assets.getLibrary(_loc2_);
         if(_loc4_ != null)
         {
            if(_loc4_ is openfl.utils.AssetLibrary)
            {
               _loc5_ = _loc4_;
               if(_loc5_.exists(_loc3_,"MOVIE_CLIP"))
               {
                  if(_loc5_.isLocal(_loc3_,"MOVIE_CLIP"))
                  {
                     return _loc5_.getMovieClip(_loc3_);
                  }
                  Log.error("MovieClip asset \"" + param1 + "\" exists, but only asynchronously",{
                     "fileName":"openfl/utils/Assets.hx",
                     "lineNumber":261,
                     "className":"openfl.utils.Assets",
                     "methodName":"getMovieClip"
                  });
                  return null;
               }
            }
            Log.error("There is no MovieClip asset with an ID of \"" + param1 + "\"",{
               "fileName":"openfl/utils/Assets.hx",
               "lineNumber":267,
               "className":"openfl.utils.Assets",
               "methodName":"getMovieClip"
            });
         }
         else
         {
            Log.error("There is no asset library named \"" + _loc2_ + "\"",{
               "fileName":"openfl/utils/Assets.hx",
               "lineNumber":271,
               "className":"openfl.utils.Assets",
               "methodName":"getMovieClip"
            });
         }
         return null;
      }
      
      public static function getMusic(param1:String, param2:Boolean = true) : Sound
      {
         return openfl.utils.Assets.getSound(param1,param2);
      }
      
      public static function getPath(param1:String) : String
      {
         return lime.utils.Assets.getPath(param1);
      }
      
      public static function getSound(param1:String, param2:Boolean = true) : Sound
      {
         var _loc3_:* = null as Sound;
         if(param2 && openfl.utils.Assets.cache.get_enabled() && openfl.utils.Assets.cache.hasSound(param1))
         {
            _loc3_ = openfl.utils.Assets.cache.getSound(param1);
            if(openfl.utils.Assets.isValidSound(_loc3_))
            {
               return _loc3_;
            }
         }
         var _loc4_:AudioBuffer = lime.utils.Assets.getAudioBuffer(param1,false);
         if(_loc4_ != null)
         {
            _loc3_ = _loc4_.get_src();
            if(param2 && openfl.utils.Assets.cache.get_enabled())
            {
               openfl.utils.Assets.cache.setSound(param1,_loc3_);
            }
            return _loc3_;
         }
         return null;
      }
      
      public static function getText(param1:String) : String
      {
         return lime.utils.Assets.getText(param1);
      }
      
      public static function hasEventListener(param1:String) : Boolean
      {
         return openfl.utils.Assets.dispatcher.hasEventListener(param1);
      }
      
      public static function hasLibrary(param1:String) : Boolean
      {
         return lime.utils.Assets.hasLibrary(param1);
      }
      
      public static function initBinding(param1:String, param2:* = undefined) : void
      {
         var _loc4_:* = null as StringMap;
         var _loc5_:* = null as openfl.utils.AssetLibrary;
         var _loc3_:StringMap = openfl.utils.Assets.libraryBindings;
         if(param1 in StringMap.reserved ? _loc3_.existsReserved(param1) : param1 in _loc3_.h)
         {
            _loc4_ = openfl.utils.Assets.libraryBindings;
            _loc5_ = param1 in StringMap.reserved ? _loc4_.getReserved(param1) : _loc4_.h[param1];
            _loc5_.bind(param1);
         }
         else
         {
            Log.warn("No asset is registered as \"" + param1 + "\"",{
               "fileName":"openfl/utils/Assets.hx",
               "lineNumber":434,
               "className":"openfl.utils.Assets",
               "methodName":"initBinding"
            });
         }
      }
      
      public static function isLocal(param1:String, param2:String = undefined, param3:Boolean = true) : Boolean
      {
         if(param3 && openfl.utils.Assets.cache.get_enabled())
         {
            if(param2 == "IMAGE" || param2 == null)
            {
               if(openfl.utils.Assets.cache.hasBitmapData(param1))
               {
                  return true;
               }
            }
            if(param2 == "FONT" || param2 == null)
            {
               if(openfl.utils.Assets.cache.hasFont(param1))
               {
                  return true;
               }
            }
            if(param2 == "SOUND" || param2 == "MUSIC" || param2 == null)
            {
               if(openfl.utils.Assets.cache.hasSound(param1))
               {
                  return true;
               }
            }
         }
         var _loc4_:String = param1.substring(0,param1.indexOf(":"));
         var _loc5_:String = param1.substr(param1.indexOf(":") + 1);
         var _loc6_:lime.utils.AssetLibrary = openfl.utils.Assets.getLibrary(_loc4_);
         if(_loc6_ != null)
         {
            return _loc6_.isLocal(_loc5_,param2);
         }
         return false;
      }
      
      public static function isValidBitmapData(param1:BitmapData) : Boolean
      {
         var _loc3_:* = null;
         try
         {
            param1.width;
            return true;
         }
         catch(_loc_e_:*)
         {
            throw _loc3_;
         }
      }
      
      public static function isValidSound(param1:Sound) : Boolean
      {
         return true;
      }
      
      public static function list(param1:String = undefined) : Array
      {
         return lime.utils.Assets.list(param1);
      }
      
      public static function loadBitmapData(param1:String, param2:Object = undefined) : Future
      {
         var promise:Promise_openfl_display_BitmapData;
         var useCache:Object;
         var id:String;
         var _loc3_:* = null as BitmapData;
         id = param1;
         §§push(§§newactivation());
         if(param2 == null)
         {
            param2 = true;
         }
         §§pop().§§slot[2] = param2;
         if(useCache == null)
         {
            useCache = true;
         }
         promise = new Promise_openfl_display_BitmapData();
         if(!!useCache && openfl.utils.Assets.cache.get_enabled() && openfl.utils.Assets.cache.hasBitmapData(id))
         {
            _loc3_ = openfl.utils.Assets.cache.getBitmapData(id);
            if(openfl.utils.Assets.isValidBitmapData(_loc3_))
            {
               promise.complete(_loc3_);
               return promise.future;
            }
         }
         lime.utils.Assets.loadImage(id,false).onComplete(function(param1:Image):void
         {
            var _loc2_:* = null as BitmapData;
            if(param1 != null)
            {
               _loc2_ = param1.get_src();
               if(!!useCache && openfl.utils.Assets.cache.get_enabled())
               {
                  openfl.utils.Assets.cache.setBitmapData(id,_loc2_);
               }
               promise.complete(_loc2_);
            }
            else
            {
               promise.error("[Assets] Could not load Image \"" + id + "\"");
            }
         }).onError(promise.error).onProgress(promise.progress);
         return promise.future;
      }
      
      public static function loadBytes(param1:String) : Future
      {
         var promise:Promise_openfl_utils_ByteArray = new Promise_openfl_utils_ByteArray();
         var _loc2_:Future = lime.utils.Assets.loadBytes(param1);
         _loc2_.onComplete(function(param1:Bytes):void
         {
            promise.complete(ByteArray_Impl_.fromLimeBytes(param1));
         });
         _loc2_.onProgress(function(param1:int, param2:int):void
         {
            promise.progress(param1,param2);
         });
         _loc2_.onError(function(param1:*):void
         {
            promise.error(param1);
         });
         return promise.future;
      }
      
      public static function loadFont(param1:String, param2:Object = undefined) : Future
      {
         var promise:Promise_openfl_text_Font;
         var useCache:Object;
         var id:String = param1;
         §§push(§§newactivation());
         if(param2 == null)
         {
            param2 = true;
         }
         §§pop().§§slot[2] = param2;
         if(useCache == null)
         {
            useCache = true;
         }
         promise = new Promise_openfl_text_Font();
         if(!!useCache && openfl.utils.Assets.cache.get_enabled() && openfl.utils.Assets.cache.hasFont(id))
         {
            promise.complete(openfl.utils.Assets.cache.getFont(id));
            return promise.future;
         }
         lime.utils.Assets.loadFont(id).onComplete(function(param1:lime.text.Font):void
         {
            var _loc2_:flash.text.Font = param1.src;
            if(!!useCache && openfl.utils.Assets.cache.get_enabled())
            {
               openfl.utils.Assets.cache.setFont(id,_loc2_);
            }
            promise.complete(_loc2_);
         }).onError(promise.error).onProgress(promise.progress);
         return promise.future;
      }
      
      public static function loadLibrary(param1:String) : Future
      {
         var name:String = param1;
         return lime.utils.Assets.loadLibrary(name).then(function(param1:lime.utils.AssetLibrary):Future
         {
            var _loc2_:openfl.utils.AssetLibrary = null;
            if(param1 != null)
            {
               if(param1 is openfl.utils.AssetLibrary)
               {
                  _loc2_ = param1;
               }
               else
               {
                  lime.utils.Assets.libraries.remove(name);
                  _loc2_ = new openfl.utils.AssetLibrary();
                  _loc2_.__proxy = param1;
                  lime.utils.Assets.registerLibrary(name,_loc2_);
               }
            }
            return Future.withValue(_loc2_);
         });
      }
      
      public static function loadMusic(param1:String, param2:Object = undefined) : Future
      {
         var promise:Promise_openfl_media_Sound;
         var useCache:Object;
         var id:String = param1;
         §§push(§§newactivation());
         if(param2 == null)
         {
            param2 = true;
         }
         §§pop().§§slot[2] = param2;
         if(useCache == null)
         {
            useCache = true;
         }
         promise = new Promise_openfl_media_Sound();
         lime.utils.Assets.loadAudioBuffer(id,useCache).onComplete(function(param1:AudioBuffer):void
         {
            var _loc2_:* = null as Sound;
            if(param1 != null)
            {
               _loc2_ = param1.get_src();
               if(!!useCache && openfl.utils.Assets.cache.get_enabled())
               {
                  openfl.utils.Assets.cache.setSound(id,_loc2_);
               }
               promise.complete(_loc2_);
            }
            else
            {
               promise.error("[Assets] Could not load Sound \"" + id + "\"");
            }
         }).onError(promise.error).onProgress(promise.progress);
         return promise.future;
      }
      
      public static function loadMovieClip(param1:String) : Future
      {
         var _loc6_:* = null as openfl.utils.AssetLibrary;
         var _loc2_:Promise_openfl_display_MovieClip = new Promise_openfl_display_MovieClip();
         var _loc3_:String = param1.substring(0,param1.indexOf(":"));
         var _loc4_:String = param1.substr(param1.indexOf(":") + 1);
         var _loc5_:lime.utils.AssetLibrary = openfl.utils.Assets.getLibrary(_loc3_);
         if(_loc5_ != null)
         {
            if(_loc5_ is openfl.utils.AssetLibrary)
            {
               _loc6_ = _loc5_;
               if(_loc6_.exists(_loc4_,"MOVIE_CLIP"))
               {
                  _loc2_.completeWith(_loc6_.loadMovieClip(_loc4_));
                  return _loc2_.future;
               }
            }
            _loc2_.error("[Assets] There is no MovieClip asset with an ID of \"" + param1 + "\"");
         }
         else
         {
            _loc2_.error("[Assets] There is no asset library named \"" + _loc3_ + "\"");
         }
         return _loc2_.future;
      }
      
      public static function loadSound(param1:String, param2:Object = undefined) : Future
      {
         var promise:Promise_openfl_media_Sound;
         var useCache:Object;
         var id:String = param1;
         §§push(§§newactivation());
         if(param2 == null)
         {
            param2 = true;
         }
         §§pop().§§slot[2] = param2;
         if(useCache == null)
         {
            useCache = true;
         }
         promise = new Promise_openfl_media_Sound();
         lime.utils.Assets.loadAudioBuffer(id,useCache).onComplete(function(param1:AudioBuffer):void
         {
            var _loc2_:* = null as Sound;
            if(param1 != null)
            {
               _loc2_ = param1.get_src();
               if(!!useCache && openfl.utils.Assets.cache.get_enabled())
               {
                  openfl.utils.Assets.cache.setSound(id,_loc2_);
               }
               promise.complete(_loc2_);
            }
            else
            {
               promise.error("[Assets] Could not load Sound \"" + id + "\"");
            }
         }).onError(promise.error).onProgress(promise.progress);
         return promise.future;
      }
      
      public static function loadText(param1:String) : Future
      {
         return lime.utils.Assets.loadText(param1);
      }
      
      public static function registerBinding(param1:String, param2:openfl.utils.AssetLibrary) : void
      {
         var _loc3_:StringMap = openfl.utils.Assets.libraryBindings;
         if(param1 in StringMap.reserved)
         {
            _loc3_.setReserved(param1,param2);
         }
         else
         {
            _loc3_.h[param1] = param2;
         }
      }
      
      public static function registerLibrary(param1:String, param2:openfl.utils.AssetLibrary) : void
      {
         lime.utils.Assets.registerLibrary(param1,param2);
      }
      
      public static function removeEventListener(param1:String, param2:*, param3:Boolean = false) : void
      {
         openfl.utils.Assets.dispatcher.removeEventListener(param1,param2,param3);
      }
      
      public static function resolveClass(param1:String) : Class
      {
         return Type.resolveClass(param1);
      }
      
      public static function resolveEnum(param1:String) : Class
      {
         var _loc2_:Class = Type.resolveEnum(param1);
         if(_loc2_ == null)
         {
            return Type.resolveClass(param1);
         }
         return _loc2_;
      }
      
      public static function unloadLibrary(param1:String) : void
      {
         lime.utils.Assets.unloadLibrary(param1);
      }
      
      public static function unregisterBinding(param1:String, param2:openfl.utils.AssetLibrary) : void
      {
         var _loc3_:Boolean = false;
         var _loc5_:* = null as StringMap;
         var _loc4_:StringMap = openfl.utils.Assets.libraryBindings;
         if(param1 in StringMap.reserved ? _loc4_.existsReserved(param1) : param1 in _loc4_.h)
         {
            _loc5_ = openfl.utils.Assets.libraryBindings;
            _loc3_ = (param1 in StringMap.reserved ? _loc5_.getReserved(param1) : _loc5_.h[param1]) == param2;
         }
         else
         {
            _loc3_ = false;
         }
         if(_loc3_)
         {
            openfl.utils.Assets.libraryBindings.remove(param1);
         }
      }
      
      public static function LimeAssets_onChange() : void
      {
         openfl.utils.Assets.dispatchEvent(new Event(Event.CHANGE));
      }
   }
}

