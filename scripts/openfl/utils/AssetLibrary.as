package openfl.utils
{
   import flash.Boot;
   import flash.display.MovieClip;
   import flash.utils.ByteArray;
   import haxe.io.Bytes;
   import lime.app.Future;
   import lime.graphics.Image;
   import lime.media.AudioBuffer;
   import lime.text.Font;
   import lime.utils.AssetBundle;
   import lime.utils.AssetLibrary;
   import lime.utils.AssetManifest;
   import openfl.utils._ByteArray.ByteArray_Impl_;
   
   public class AssetLibrary extends lime.utils.AssetLibrary
   {
      
      public var __proxy:lime.utils.AssetLibrary;
      
      public function AssetLibrary()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
      }
      
      public static function fromBundle(param1:AssetBundle) : openfl.utils.AssetLibrary
      {
         var _loc3_:* = null as openfl.utils.AssetLibrary;
         var _loc2_:lime.utils.AssetLibrary = lime.utils.AssetLibrary.fromBundle(param1);
         if(_loc2_ != null)
         {
            if(_loc2_ is openfl.utils.AssetLibrary)
            {
               return _loc2_;
            }
            _loc3_ = new openfl.utils.AssetLibrary();
            _loc3_.__proxy = _loc2_;
            return _loc3_;
         }
         return null;
      }
      
      public static function fromBytes(param1:ByteArray, param2:String = undefined) : openfl.utils.AssetLibrary
      {
         return openfl.utils.AssetLibrary.fromManifest(AssetManifest.fromBytes(ByteArray_Impl_.toLimeBytes(param1),param2));
      }
      
      public static function fromFile(param1:String, param2:String = undefined) : openfl.utils.AssetLibrary
      {
         return openfl.utils.AssetLibrary.fromManifest(AssetManifest.fromFile(param1,param2));
      }
      
      public static function fromManifest(param1:AssetManifest) : openfl.utils.AssetLibrary
      {
         var _loc3_:* = null as openfl.utils.AssetLibrary;
         var _loc2_:lime.utils.AssetLibrary = lime.utils.AssetLibrary.fromManifest(param1);
         if(_loc2_ != null)
         {
            if(_loc2_ is openfl.utils.AssetLibrary)
            {
               return _loc2_;
            }
            _loc3_ = new openfl.utils.AssetLibrary();
            _loc3_.__proxy = _loc2_;
            return _loc3_;
         }
         return null;
      }
      
      public static function loadFromBytes(param1:ByteArray, param2:String = undefined) : Future
      {
         return AssetManifest.loadFromBytes(ByteArray_Impl_.toLimeBytes(param1),param2).then(function(param1:AssetManifest):Future
         {
            return openfl.utils.AssetLibrary.loadFromManifest(param1);
         });
      }
      
      public static function loadFromFile(param1:String, param2:String = undefined) : Future
      {
         return AssetManifest.loadFromFile(param1,param2).then(function(param1:AssetManifest):Future
         {
            return openfl.utils.AssetLibrary.loadFromManifest(param1);
         });
      }
      
      public static function loadFromManifest(param1:AssetManifest) : Future
      {
         var _loc2_:openfl.utils.AssetLibrary = openfl.utils.AssetLibrary.fromManifest(param1);
         if(_loc2_ != null)
         {
            return _loc2_.load().then(function(param1:lime.utils.AssetLibrary):Future
            {
               return Future.withValue(param1);
            });
         }
         return Future.withError("Could not load asset manifest");
      }
      
      override public function unload() : void
      {
         if(__proxy != null)
         {
            __proxy.unload();
            return;
         }
         super.unload();
      }
      
      override public function loadText(param1:String) : Future
      {
         if(__proxy != null)
         {
            return __proxy.loadText(param1);
         }
         return super.loadText(param1);
      }
      
      public function loadMovieClip(param1:String) : Future
      {
         return Future.withValue(getMovieClip(param1));
      }
      
      override public function loadImage(param1:String) : Future
      {
         if(__proxy != null)
         {
            return __proxy.loadImage(param1);
         }
         return super.loadImage(param1);
      }
      
      override public function loadFont(param1:String) : Future
      {
         if(__proxy != null)
         {
            return __proxy.loadFont(param1);
         }
         return super.loadFont(param1);
      }
      
      override public function loadBytes(param1:String) : Future
      {
         if(__proxy != null)
         {
            return __proxy.loadBytes(param1);
         }
         return super.loadBytes(param1);
      }
      
      override public function loadAudioBuffer(param1:String) : Future
      {
         if(__proxy != null)
         {
            return __proxy.loadAudioBuffer(param1);
         }
         return super.loadAudioBuffer(param1);
      }
      
      override public function loadAsset(param1:String, param2:String) : Future
      {
         if(__proxy != null)
         {
            return __proxy.loadAsset(param1,param2);
         }
         return super.loadAsset(param1,param2);
      }
      
      override public function load() : Future
      {
         if(__proxy != null)
         {
            return __proxy.load();
         }
         return super.load();
      }
      
      override public function list(param1:String) : Array
      {
         if(__proxy != null)
         {
            return __proxy.list(param1);
         }
         return super.list(param1);
      }
      
      override public function isLocal(param1:String, param2:String) : Boolean
      {
         if(__proxy != null)
         {
            return __proxy.isLocal(param1,param2);
         }
         return Boolean(super.isLocal(param1,param2));
      }
      
      override public function getText(param1:String) : String
      {
         if(__proxy != null)
         {
            return __proxy.getText(param1);
         }
         return super.getText(param1);
      }
      
      override public function getPath(param1:String) : String
      {
         if(__proxy != null)
         {
            return __proxy.getPath(param1);
         }
         return super.getPath(param1);
      }
      
      public function getMovieClip(param1:String) : MovieClip
      {
         return null;
      }
      
      override public function getImage(param1:String) : Image
      {
         if(__proxy != null)
         {
            return __proxy.getImage(param1);
         }
         return super.getImage(param1);
      }
      
      override public function getFont(param1:String) : Font
      {
         if(__proxy != null)
         {
            return __proxy.getFont(param1);
         }
         return super.getFont(param1);
      }
      
      override public function getBytes(param1:String) : Bytes
      {
         if(__proxy != null)
         {
            return __proxy.getBytes(param1);
         }
         return super.getBytes(param1);
      }
      
      override public function getAudioBuffer(param1:String) : AudioBuffer
      {
         if(__proxy != null)
         {
            return __proxy.getAudioBuffer(param1);
         }
         return super.getAudioBuffer(param1);
      }
      
      override public function getAsset(param1:String, param2:String) : *
      {
         if(__proxy != null)
         {
            return __proxy.getAsset(param1,param2);
         }
         return super.getAsset(param1,param2);
      }
      
      override public function exists(param1:String, param2:String) : Boolean
      {
         if(__proxy != null)
         {
            return __proxy.exists(param1,param2);
         }
         return Boolean(super.exists(param1,param2));
      }
      
      public function bind(param1:String, param2:* = undefined) : Boolean
      {
         return false;
      }
   }
}

