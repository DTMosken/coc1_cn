package coc.view
{
   import _Xml.XmlType_Impl_;
   import classes.globalFlags.KGAMECLASS;
   import flash.Boot;
   import flash.display.Bitmap;
   import flash.display.Loader;
   import flash.display.LoaderInfo;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.net.FileFilter;
   import flash.net.FileReference;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   import flash.utils.ByteArray;
   import haxe.Exception;
   import haxe.Log;
   
   public class ThemeLoader
   {
      
      public static var THEMEDIR:String = "./Themes/";
      
      public static var AUTOLOAD_URL:String = "./Themes/AutoLoad.xml";
      
      public var data:*;
      
      public var _xmlLoader:URLLoader;
      
      public var _postAutoloadFn:Function;
      
      public var _loadersRequired:int;
      
      public var _loadersComplete:int;
      
      public var _backFn:Function;
      
      public var _autoApply:Boolean;
      
      public function ThemeLoader(param1:Function = undefined, param2:Boolean = false)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         _loadersRequired = 0;
         _loadersComplete = 0;
         _postAutoloadFn = null;
         _autoApply = false;
         _backFn = param1;
         _autoApply = param2;
      }
      
      public static function onOpenJSON(param1:Event) : void
      {
         Log.trace("JSON Opened",{
            "fileName":"src/coc/view/ThemeLoader.hx",
            "lineNumber":125,
            "className":"coc.view.ThemeLoader",
            "methodName":"onOpenJSON"
         });
      }
      
      public static function onProgressJSON(param1:ProgressEvent) : void
      {
         Log.trace("Loaded " + Math.round(param1.bytesLoaded / param1.bytesTotal * 100) + "% of JSON",{
            "fileName":"src/coc/view/ThemeLoader.hx",
            "lineNumber":129,
            "className":"coc.view.ThemeLoader",
            "methodName":"onProgressJSON"
         });
      }
      
      public function onSelect(param1:Event) : void
      {
         var _loc2_:FileReference = param1.target;
         _loc2_.addEventListener(Event.COMPLETE,onLoadJSON);
         _loc2_.addEventListener(Event.OPEN,ThemeLoader.onOpenJSON);
         _loc2_.addEventListener(ProgressEvent.PROGRESS,ThemeLoader.onProgressJSON);
         _loc2_.addEventListener(IOErrorEvent.IO_ERROR,onIO_Error);
         _loc2_.load();
         Log.trace("Selected",{
            "fileName":"src/coc/view/ThemeLoader.hx",
            "lineNumber":121,
            "className":"coc.view.ThemeLoader",
            "methodName":"onSelect"
         });
      }
      
      public function onLoadJSON(param1:Event) : void
      {
         var _loc6_:* = null as Error;
         Log.trace("loaded",{
            "fileName":"src/coc/view/ThemeLoader.hx",
            "lineNumber":137,
            "className":"coc.view.ThemeLoader",
            "methodName":"onLoadJSON"
         });
         var _loc3_:FileReference = param1.target;
         Log.trace(_loc3_.name,{
            "fileName":"src/coc/view/ThemeLoader.hx",
            "lineNumber":139,
            "className":"coc.view.ThemeLoader",
            "methodName":"onLoadJSON"
         });
         var _loc4_:Function = Log.trace;
         var _loc5_:ByteArray = _loc3_.data;
         _loc4_(_loc5_ == null ? "null" : _loc5_.toString(),{
            "fileName":"src/coc/view/ThemeLoader.hx",
            "lineNumber":140,
            "className":"coc.view.ThemeLoader",
            "methodName":"onLoadJSON"
         });
         try
         {
            data = JSON.parse(_loc3_.data.toString());
         }
         catch(_loc_e_:Error)
         {
            _loc6_ = _loc_e_;
            Log.trace(_loc6_,{
               "fileName":"src/coc/view/ThemeLoader.hx",
               "lineNumber":144,
               "className":"coc.view.ThemeLoader",
               "methodName":"onLoadJSON"
            });
            _backFn();
            return;
         }
         finalLoadJSON();
      }
      
      public function onImageLoaded(param1:String, param2:int, param3:Event) : void
      {
         var _loc5_:* = null as Bitmap;
         var _loc6_:* = null as EReg;
         var _loc7_:Boolean = false;
         var _loc8_:* = null as Error;
         var _loc9_:* = null;
         try
         {
            _loc5_ = param3.target.content;
            if(new EReg("button","").match(param1))
            {
               _loc6_ = new EReg("(north|south|east|west)","");
               _loc7_ = param1.indexOf("med") >= 0;
               if(_loc6_.match(param1))
               {
                  Reflect.field(data,"navButtons")[_loc6_.matched(0)] = _loc5_;
               }
               else if(_loc7_)
               {
                  Reflect.field(data,"medButtons")[param2] = _loc5_;
               }
               else
               {
                  Reflect.field(data,"buttonBgs")[param2] = _loc5_;
               }
            }
            else
            {
               data[param1] = _loc5_;
            }
         }
         catch(_loc_e_:Error)
         {
            _loc8_ = _loc_e_;
            _loc9_ = null;
            data[param1] = _loc9_;
         }
         _loadersComplete += 1;
         if(_loadersComplete == _loadersRequired)
         {
            buildTheme();
         }
      }
      
      public function onIO_Error(param1:IOErrorEvent) : void
      {
         Log.trace("IOERROR!" + param1.toString(),{
            "fileName":"src/coc/view/ThemeLoader.hx",
            "lineNumber":189,
            "className":"coc.view.ThemeLoader",
            "methodName":"onIO_Error"
         });
         _loadersComplete += 1;
         if(_loadersComplete == _loadersRequired)
         {
            KGAMECLASS.kGAMECLASS.output.clear();
            KGAMECLASS.kGAMECLASS.outputText("主题加载失败。请确保Themes文件夹与游戏swf文件在同一文件夹中");
            KGAMECLASS.kGAMECLASS.output.doNext(_backFn);
         }
      }
      
      public function onCancel(param1:Event) : void
      {
         _backFn();
      }
      
      public function onAutoloadJSON(param1:Event) : void
      {
         if(Reflect.hasField(param1.target,"data"))
         {
            data = JSON.parse(Std.string(Reflect.getProperty(param1.target,"data")));
         }
         finalLoadJSON();
      }
      
      public function onAutoloadError(param1:Event) : void
      {
         Log.trace("Autoload error " + Std.string(param1),{
            "fileName":"src/coc/view/ThemeLoader.hx",
            "lineNumber":215,
            "className":"coc.view.ThemeLoader",
            "methodName":"onAutoloadError"
         });
      }
      
      public function noAutoload(param1:Event) : void
      {
      }
      
      public function loadImage(param1:String, param2:String, param3:int = 0) : void
      {
         var arrayIndex1:int;
         var nameInData1:String;
         var _g:ThemeLoader;
         var _loc4_:URLRequest = new URLRequest("./Themes/" + Std.string(Reflect.field(data,"name")) + "/" + param1);
         var _loc5_:Loader = new Loader();
         _g = this;
         nameInData1 = param2;
         arrayIndex1 = param3;
         var _loc6_:Function = function(param1:Event):void
         {
            _g.onImageLoaded(nameInData1,arrayIndex1,param1);
         };
         _loc5_.contentLoaderInfo.addEventListener(Event.COMPLETE,_loc6_);
         _loc5_.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,onIO_Error);
         _loc5_.load(_loc4_);
      }
      
      public function load() : void
      {
         var _loc1_:FileFilter = new FileFilter("Themes","*.json");
         var _loc2_:FileReference = new FileReference();
         _loc2_.addEventListener(Event.SELECT,onSelect);
         _loc2_.addEventListener(Event.CANCEL,onCancel);
         _loc2_.browse([_loc1_]);
      }
      
      public function finalLoadJSON() : void
      {
         var loadButtons:Function;
         var toLoad:Array;
         var _loc2_:* = null;
         var _loc6_:* = null as String;
         var _loc7_:* = null;
         var _loc8_:* = null as String;
         var _loc9_:* = null as String;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:* = null;
         var _loc13_:* = null;
         var _loc14_:* = null as Array;
         var _loc15_:int = 0;
         var _loc16_:* = null as String;
         toLoad = [];
         loadButtons = function(param1:Array):void
         {
            var _loc4_:int = 0;
            var _loc5_:* = null as String;
            var _loc2_:int = 0;
            var _loc3_:int = int(param1.length);
            while(_loc2_ < _loc3_)
            {
               _loc4_ = _loc2_++;
               _loc5_ = param1[_loc4_];
               toLoad.push({
                  "name":_loc5_,
                  "nameInData":_loc5_,
                  "index":_loc4_
               });
            }
         };
         var _loc1_:* = Reflect.field(data,"images");
         _loc2_ = _loc1_;
         var _loc3_:* = _loc2_;
         var _loc4_:Array = Reflect.fields(_loc2_);
         var _loc5_:int = 0;
         while(_loc5_ < int(_loc4_.length))
         {
            _loc6_ = _loc4_[_loc5_++];
            _loc7_ = Reflect.field(_loc3_,_loc6_);
            _loc8_ = _loc6_;
            _loc9_ = _loc8_;
            _loc10_ = _loc7_;
            if(new EReg("buttons","").match(_loc9_))
            {
               _loc11_ = [];
               data["buttonBgs"] = _loc11_;
               loadButtons(_loc10_);
            }
            else if(new EReg("medButtons","").match(_loc9_))
            {
               _loc11_ = [];
               data["medButtons"] = _loc11_;
               loadButtons(_loc10_);
            }
            else if(new EReg("navButtons","").match(_loc9_))
            {
               _loc11_ = {};
               data["navButtons"] = _loc11_;
               _loc11_ = _loc10_;
               _loc12_ = _loc11_;
               _loc13_ = _loc12_;
               _loc14_ = Reflect.fields(_loc12_);
               _loc15_ = 0;
               while(_loc15_ < int(_loc14_.length))
               {
                  _loc16_ = Reflect.field(_loc13_,_loc14_[_loc15_++]);
                  toLoad.push({
                     "name":_loc16_,
                     "nameInData":_loc16_,
                     "index":0
                  });
               }
            }
            else
            {
               toLoad.push({
                  "name":_loc10_,
                  "nameInData":_loc9_,
                  "index":0
               });
            }
         }
         if(int(toLoad.length) == 0)
         {
            _backFn();
         }
         _loadersRequired += int(toLoad.length);
         _loc5_ = 0;
         while(_loc5_ < int(toLoad.length))
         {
            _loc2_ = toLoad[_loc5_];
            _loc5_++;
            loadImage(_loc2_.name,_loc2_.nameInData,int(_loc2_.index));
         }
      }
      
      public function doNothing() : void
      {
      }
      
      public function doAutoload(param1:Event) : void
      {
         var _loc4_:* = null as Xml;
         var _loc5_:* = null;
         var _loc6_:* = null as Xml;
         var _loc7_:* = null as Xml;
         var _loc8_:* = null as String;
         _xmlLoader.removeEventListener(Event.COMPLETE,doAutoload);
         _xmlLoader.removeEventListener(IOErrorEvent.IO_ERROR,noAutoload);
         var _loc2_:Xml = Xml.parse(_xmlLoader.data);
         var _loc3_:* = _loc2_.elementsNamed("Themes");
         while(Boolean(_loc3_.hasNext()))
         {
            _loc4_ = _loc3_.next();
            _loc5_ = _loc4_.elementsNamed("Theme");
            while(Boolean(_loc5_.hasNext()))
            {
               _loc6_ = _loc5_.next();
               if(_loc6_.nodeType != Xml.Document && _loc6_.nodeType != Xml.Element)
               {
                  throw Exception.thrown("Bad node type, expected Element or Document but found " + XmlType_Impl_.toString(_loc6_.nodeType));
               }
               _loc7_ = _loc6_.children[0];
               if(_loc7_.nodeType == Xml.Document || _loc7_.nodeType == Xml.Element)
               {
                  throw Exception.thrown("Bad node type, unexpected " + XmlType_Impl_.toString(_loc7_.nodeType));
               }
               _loc8_ = _loc7_.nodeValue;
               Log.trace("Autoloading theme " + _loc8_,{
                  "fileName":"src/coc/view/ThemeLoader.hx",
                  "lineNumber":50,
                  "className":"coc.view.ThemeLoader",
                  "methodName":"doAutoload"
               });
               new ThemeLoader(_postAutoloadFn).autoloadJSON(_loc8_);
            }
         }
      }
      
      public function buildTheme() : void
      {
         var _loc1_:String = Reflect.field(data,"parent");
         var _loc2_:Theme = Theme.getTheme(_loc1_ != null ? _loc1_ : "Default");
         Reflect.deleteField(data,"images");
         var _loc3_:Theme = new Theme(Reflect.field(data,"name"),data,_loc2_);
         if(_autoApply)
         {
            Theme.set_current(_loc3_);
            KGAMECLASS.kGAMECLASS.mainViewManager.applyTheme();
         }
         if(_postAutoloadFn != null)
         {
            _postAutoloadFn();
         }
         else
         {
            _backFn();
         }
      }
      
      public function autoloadJSON(param1:String) : void
      {
         _postAutoloadFn = _backFn;
         _backFn = doNothing;
         var _loc2_:URLLoader = new URLLoader();
         _loc2_.addEventListener(Event.COMPLETE,onAutoloadJSON);
         _loc2_.addEventListener(IOErrorEvent.IO_ERROR,onAutoloadError);
         _loc2_.load(new URLRequest(param1));
      }
      
      public function autoload() : void
      {
         _postAutoloadFn = _backFn;
         _backFn = doNothing;
         _xmlLoader = new URLLoader();
         _xmlLoader.addEventListener(Event.COMPLETE,doAutoload);
         _xmlLoader.addEventListener(IOErrorEvent.IO_ERROR,noAutoload);
         _xmlLoader.load(new URLRequest("./Themes/AutoLoad.xml"));
      }
   }
}

