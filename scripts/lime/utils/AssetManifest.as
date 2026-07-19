package lime.utils
{
   import flash.Boot;
   import haxe.Serializer;
   import haxe.Unserializer;
   import haxe.io.Bytes;
   import haxe.io.Path;
   import lime.app.Future;
   import lime.utils._Bytes.Bytes_Impl_;
   
   public class AssetManifest
   {
      
      public var version:int;
      
      public var rootPath:String;
      
      public var name:String;
      
      public var libraryType:String;
      
      public var libraryArgs:Array;
      
      public var assets:Array;
      
      public function AssetManifest()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         assets = [];
         libraryArgs = [];
         version = 2;
      }
      
      public static function fromBytes(param1:Bytes, param2:String = undefined) : AssetManifest
      {
         if(param1 != null)
         {
            return AssetManifest.parse(param1.getString(0,param1.length),param2);
         }
         return null;
      }
      
      public static function fromFile(param1:String, param2:String = undefined) : AssetManifest
      {
         param1 = AssetManifest.__resolvePath(param1);
         param2 = AssetManifest.__resolveRootPath(param2,param1);
         if(param1 == null)
         {
            return null;
         }
         return AssetManifest.fromBytes(Bytes_Impl_.fromFile(param1),param2);
      }
      
      public static function loadFromBytes(param1:Bytes, param2:String = undefined) : Future
      {
         return Future.withValue(AssetManifest.fromBytes(param1,param2));
      }
      
      public static function loadFromFile(param1:String, param2:String = undefined) : Future
      {
         var rootPath1:String = param2;
         param1 = AssetManifest.__resolvePath(param1);
         rootPath1 = AssetManifest.__resolveRootPath(rootPath1,param1);
         if(param1 == null)
         {
            return null;
         }
         return Bytes_Impl_.loadFromFile(param1).then(function(param1:Bytes):Future
         {
            return Future.withValue(AssetManifest.fromBytes(param1,rootPath1));
         });
      }
      
      public static function parse(param1:String, param2:String = undefined) : AssetManifest
      {
         var _loc5_:* = null;
         if(param1 == null || param1 == "")
         {
            return null;
         }
         var _loc3_:* = JSON.parse(param1);
         var _loc4_:AssetManifest = new AssetManifest();
         if(Reflect.hasField(_loc3_,"name"))
         {
            _loc4_.name = _loc3_.name;
         }
         if(Reflect.hasField(_loc3_,"libraryType"))
         {
            _loc4_.libraryType = _loc3_.libraryType;
         }
         if(Reflect.hasField(_loc3_,"libraryArgs"))
         {
            _loc4_.libraryArgs = _loc3_.libraryArgs;
         }
         if(Reflect.hasField(_loc3_,"assets"))
         {
            _loc5_ = _loc3_.assets;
            if(Reflect.hasField(_loc3_,"version") && int(_loc3_.version) <= 2)
            {
               _loc4_.assets = Unserializer.run(_loc5_);
            }
            else
            {
               _loc4_.assets = _loc5_;
            }
         }
         if(Reflect.hasField(_loc3_,"rootPath"))
         {
            _loc4_.rootPath = _loc3_.rootPath;
         }
         if(param2 != null && param2 != "")
         {
            if(_loc4_.rootPath == null || _loc4_.rootPath == "")
            {
               _loc4_.rootPath = param2;
            }
            else
            {
               _loc4_.rootPath = param2 + "/" + _loc4_.rootPath;
            }
         }
         return _loc4_;
      }
      
      public static function __resolvePath(param1:String) : String
      {
         var _loc3_:* = null as String;
         if(param1 == null)
         {
            return null;
         }
         var _loc2_:int = param1.indexOf("?");
         if(_loc2_ > -1)
         {
            _loc3_ = param1.substr(0,_loc2_);
         }
         else
         {
            _loc3_ = param1;
         }
         _loc3_ = StringTools.replace(_loc3_,"\\","/");
         while(StringTools.endsWith(_loc3_,"/"))
         {
            _loc3_ = _loc3_.substr(0,_loc3_.length - 1);
         }
         if(StringTools.endsWith(_loc3_,".bundle"))
         {
            if(_loc2_ > -1)
            {
               return _loc3_ + "/library.json" + param1.substr(_loc2_);
            }
            return _loc3_ + "/library.json";
         }
         return param1;
      }
      
      public static function __resolveRootPath(param1:String, param2:String) : String
      {
         if(param1 != null)
         {
            return param1;
         }
         var _loc3_:int = param2.indexOf("?");
         if(_loc3_ > -1)
         {
            param1 = param2.substr(0,_loc3_);
         }
         else
         {
            param1 = param2;
         }
         param1 = StringTools.replace(param1,"\\","/");
         while(StringTools.endsWith(param1,"/"))
         {
            if(param1 == "/")
            {
               return param1;
            }
            param1 = param1.substr(0,param1.length - 1);
         }
         if(StringTools.endsWith(param1,".bundle"))
         {
            return param1;
         }
         return Path.directory(param1);
      }
      
      public function serialize() : String
      {
         var _loc1_:* = {};
         _loc1_.version = version;
         _loc1_.libraryType = libraryType;
         _loc1_.libraryArgs = libraryArgs;
         _loc1_.name = name;
         _loc1_.assets = Serializer.run(assets);
         _loc1_.rootPath = rootPath;
         return JSON.stringify(_loc1_);
      }
   }
}

