package lime.utils
{
   import flash.Boot;
   import flash.Lib;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.ProgressEvent;
   import haxe.IMap;
   import haxe.ds.ObjectMap;
   import haxe.ds.StringMap;
   import lime.app.Future;
   import lime.app._Event_Int_Int_Void;
   import lime.app._Event_Void_Void;
   
   public class Preloader extends Sprite
   {
      
      public var simulateProgress:Boolean;
      
      public var preloadStarted:Boolean;
      
      public var preloadComplete:Boolean;
      
      public var onProgress:_Event_Int_Int_Void;
      
      public var onComplete:_Event_Void_Void;
      
      public var loadedStage:Boolean;
      
      public var loadedLibraries:int;
      
      public var libraryNames:Array;
      
      public var libraries:Array;
      
      public var initLibraryNames:Boolean;
      
      public var complete:Boolean;
      
      public var bytesTotalCache:IMap;
      
      public var bytesTotal:int;
      
      public var bytesLoadedCache2:IMap;
      
      public var bytesLoadedCache:ObjectMap;
      
      public var bytesLoaded:int;
      
      public function Preloader()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         bytesTotalCache = new StringMap();
         bytesLoadedCache2 = new StringMap();
         bytesLoadedCache = new ObjectMap();
         onProgress = new _Event_Int_Int_Void();
         onComplete = new _Event_Void_Void();
         super();
         bytesLoaded = 0;
         bytesTotal = 0;
         libraries = [];
         libraryNames = [];
         onProgress.add(update);
         Lib.current.addChild(this);
         Lib.current.loaderInfo.addEventListener(Event.COMPLETE,loaderInfo_onComplete);
         Lib.current.loaderInfo.addEventListener(Event.INIT,loaderInfo_onInit);
         Lib.current.loaderInfo.addEventListener(ProgressEvent.PROGRESS,loaderInfo_onProgress);
         Lib.current.addEventListener(Event.ENTER_FRAME,current_onEnter);
      }
      
      public function updateProgress() : void
      {
         var name1:Array;
         var _gthis:Preloader;
         var _loc1_:int = 0;
         var _loc2_:* = null as Array;
         _gthis = this;
         if(!simulateProgress)
         {
            onProgress.dispatch(bytesLoaded,bytesTotal);
         }
         if(loadedStage && loadedLibraries == int(libraries.length) && !initLibraryNames)
         {
            initLibraryNames = true;
            _loc1_ = 0;
            _loc2_ = libraryNames;
            while(_loc1_ < int(_loc2_.length))
            {
               name1 = [_loc2_[_loc1_]];
               _loc1_++;
               Log.verbose("Preloading asset library: " + name1[0],{
                  "fileName":"lime/utils/Preloader.hx",
                  "lineNumber":239,
                  "className":"lime.utils.Preloader",
                  "methodName":"updateProgress"
               });
               Assets.loadLibrary(name1[0]).onProgress((function(param1:Array):Function
               {
                  var name1:Array = param1;
                  return function(param1:int, param2:int):void
                  {
                     var _loc3_:* = null as StringMap;
                     var _loc4_:* = null as StringMap;
                     var _loc5_:* = null as StringMap;
                     if(param2 > 0)
                     {
                        _loc3_ = _gthis.bytesTotalCache;
                        if(!(name1[0] in StringMap.reserved ? _loc3_.existsReserved(name1[0]) : name1[0] in _loc3_.h))
                        {
                           _loc4_ = _gthis.bytesTotalCache;
                           if(name1[0] in StringMap.reserved)
                           {
                              _loc4_.setReserved(name1[0],param2);
                           }
                           else
                           {
                              _loc4_.h[name1[0]] = param2;
                           }
                           _gthis.bytesTotal += param2 - 200;
                        }
                        if(param1 > param2)
                        {
                           param1 = param2;
                        }
                        _loc4_ = _gthis.bytesLoadedCache2;
                        if(!(name1[0] in StringMap.reserved ? _loc4_.existsReserved(name1[0]) : name1[0] in _loc4_.h))
                        {
                           _gthis.bytesLoaded += param1;
                        }
                        else
                        {
                           _loc5_ = _gthis.bytesLoadedCache2;
                           _gthis.bytesLoaded += param1 - (name1[0] in StringMap.reserved ? _loc5_.getReserved(name1[0]) : _loc5_.h[name1[0]]);
                        }
                        _loc5_ = _gthis.bytesLoadedCache2;
                        if(name1[0] in StringMap.reserved)
                        {
                           _loc5_.setReserved(name1[0],param1);
                        }
                        else
                        {
                           _loc5_.h[name1[0]] = param1;
                        }
                        if(!_gthis.simulateProgress)
                        {
                           _gthis.onProgress.dispatch(_gthis.bytesLoaded,_gthis.bytesTotal);
                        }
                     }
                  };
               })(name1)).onComplete((function(param1:Array):Function
               {
                  var name1:Array = param1;
                  return function(param1:AssetLibrary):void
                  {
                     var _loc4_:* = null as StringMap;
                     var _loc5_:* = null as StringMap;
                     var _loc2_:int = 200;
                     var _loc3_:StringMap = _gthis.bytesTotalCache;
                     if(name1[0] in StringMap.reserved ? _loc3_.existsReserved(name1[0]) : name1[0] in _loc3_.h)
                     {
                        _loc4_ = _gthis.bytesTotalCache;
                        _loc2_ = int(name1[0] in StringMap.reserved ? _loc4_.getReserved(name1[0]) : _loc4_.h[name1[0]]);
                     }
                     _loc4_ = _gthis.bytesLoadedCache2;
                     if(!(name1[0] in StringMap.reserved ? _loc4_.existsReserved(name1[0]) : name1[0] in _loc4_.h))
                     {
                        _gthis.bytesLoaded += _loc2_;
                     }
                     else
                     {
                        _loc5_ = _gthis.bytesLoadedCache2;
                        _gthis.bytesLoaded += _loc2_ - (name1[0] in StringMap.reserved ? _loc5_.getReserved(name1[0]) : _loc5_.h[name1[0]]);
                     }
                     _gthis.loadedAssetLibrary(name1[0]);
                  };
               })(name1)).onError((function():Function
               {
                  return function(param1:*):void
                  {
                     Log.error(param1,{
                        "fileName":"lime/utils/Preloader.hx",
                        "lineNumber":293,
                        "className":"lime.utils.Preloader",
                        "methodName":"updateProgress"
                     });
                  };
               })());
            }
         }
         if(!simulateProgress && loadedStage && loadedLibraries == int(libraries.length) + int(libraryNames.length))
         {
            if(!preloadComplete)
            {
               preloadComplete = true;
               Log.verbose("Preload complete",{
                  "fileName":"lime/utils/Preloader.hx",
                  "lineNumber":306,
                  "className":"lime.utils.Preloader",
                  "methodName":"updateProgress"
               });
            }
            start();
         }
      }
      
      public function update(param1:int, param2:int) : void
      {
      }
      
      public function start() : void
      {
         if(complete || simulateProgress || !preloadComplete)
         {
            return;
         }
         complete = true;
         if(Lib.current.contains(this))
         {
            Lib.current.removeChild(this);
         }
         onComplete.dispatch();
      }
      
      public function loaderInfo_onProgress(param1:ProgressEvent) : void
      {
         var _loc3_:uint = 0;
         var _loc4_:int = 0;
         var _loc5_:* = null as StringMap;
         var _loc6_:* = null as StringMap;
         var _loc7_:int = 0;
         var _loc2_:StringMap = bytesTotalCache;
         if(("_root" in StringMap.reserved ? _loc2_.getReserved("_root") : _loc2_.h["_root"]) > 0)
         {
            _loc3_ = Lib.current.loaderInfo.bytesLoaded;
            _loc4_ = bytesLoaded;
            _loc5_ = bytesLoadedCache2;
            bytesLoaded = uint(_loc3_ - ("_root" in StringMap.reserved ? _loc5_.getReserved("_root") : _loc5_.h["_root"]) + _loc4_);
            _loc6_ = bytesLoadedCache2;
            _loc7_ = int(_loc3_);
            if("_root" in StringMap.reserved)
            {
               _loc6_.setReserved("_root",_loc7_);
            }
            else
            {
               _loc6_.h["_root"] = _loc7_;
            }
            updateProgress();
         }
      }
      
      public function loaderInfo_onInit(param1:Event) : void
      {
         var _loc4_:int = 0;
         var _loc6_:uint = 0;
         var _loc7_:* = null as StringMap;
         var _loc2_:int = bytesTotal;
         bytesTotal = uint(Lib.current.loaderInfo.bytesTotal + _loc2_);
         var _loc3_:IMap = bytesTotalCache;
         _loc4_ = int(Lib.current.loaderInfo.bytesTotal);
         var _loc5_:StringMap = _loc3_;
         if("_root" in StringMap.reserved)
         {
            _loc5_.setReserved("_root",_loc4_);
         }
         else
         {
            _loc5_.h["_root"] = _loc4_;
         }
         _loc5_ = bytesTotalCache;
         if(("_root" in StringMap.reserved ? _loc5_.getReserved("_root") : _loc5_.h["_root"]) > 0)
         {
            _loc6_ = Lib.current.loaderInfo.bytesLoaded;
            bytesLoaded = uint(_loc6_ + bytesLoaded);
            _loc7_ = bytesLoadedCache2;
            _loc4_ = int(_loc6_);
            if("_root" in StringMap.reserved)
            {
               _loc7_.setReserved("_root",_loc4_);
            }
            else
            {
               _loc7_.h["_root"] = _loc4_;
            }
            updateProgress();
         }
      }
      
      public function loaderInfo_onComplete(param1:Event) : void
      {
         var _loc3_:uint = 0;
         var _loc4_:int = 0;
         var _loc5_:* = null as StringMap;
         var _loc6_:* = null as StringMap;
         var _loc7_:int = 0;
         var _loc2_:StringMap = bytesTotalCache;
         if(("_root" in StringMap.reserved ? _loc2_.getReserved("_root") : _loc2_.h["_root"]) > 0)
         {
            _loc3_ = Lib.current.loaderInfo.bytesLoaded;
            _loc4_ = bytesLoaded;
            _loc5_ = bytesLoadedCache2;
            bytesLoaded = uint(_loc3_ - ("_root" in StringMap.reserved ? _loc5_.getReserved("_root") : _loc5_.h["_root"]) + _loc4_);
            _loc6_ = bytesLoadedCache2;
            _loc7_ = int(_loc3_);
            if("_root" in StringMap.reserved)
            {
               _loc6_.setReserved("_root",_loc7_);
            }
            else
            {
               _loc6_.h["_root"] = _loc7_;
            }
            updateProgress();
         }
      }
      
      public function loadedAssetLibrary(param1:String = undefined) : void
      {
         ++loadedLibraries;
         var _loc2_:int = loadedLibraries;
         if(!preloadStarted)
         {
            _loc2_++;
         }
         var _loc3_:int = int(libraries.length) + int(libraryNames.length);
         if(param1 != null)
         {
            Log.verbose("Loaded asset library: " + param1 + " [" + _loc2_ + "/" + _loc3_ + "]",{
               "fileName":"lime/utils/Preloader.hx",
               "lineNumber":197,
               "className":"lime.utils.Preloader",
               "methodName":"loadedAssetLibrary"
            });
         }
         else
         {
            Log.verbose("Loaded asset library [" + _loc2_ + "/" + _loc3_ + "]",{
               "fileName":"lime/utils/Preloader.hx",
               "lineNumber":201,
               "className":"lime.utils.Preloader",
               "methodName":"loadedAssetLibrary"
            });
         }
         updateProgress();
      }
      
      public function load() : void
      {
         var library:Array;
         var _gthis:Preloader;
         var _loc3_:* = null as AssetLibrary;
         var _loc4_:* = null as String;
         _gthis = this;
         var _loc1_:int = 0;
         var _loc2_:Array = libraries;
         while(_loc1_ < int(_loc2_.length))
         {
            _loc3_ = _loc2_[_loc1_];
            _loc1_++;
            bytesTotal += _loc3_.bytesTotal;
         }
         loadedLibraries = -1;
         preloadStarted = false;
         _loc1_ = 0;
         _loc2_ = libraries;
         while(_loc1_ < int(_loc2_.length))
         {
            library = [_loc2_[_loc1_]];
            _loc1_++;
            Log.verbose("Preloading asset library",{
               "fileName":"lime/utils/Preloader.hx",
               "lineNumber":134,
               "className":"lime.utils.Preloader",
               "methodName":"load"
            });
            library[0].load().onProgress((function(param1:Array):Function
            {
               var library:Array = param1;
               return function(param1:int, param2:int):void
               {
                  if(_gthis.bytesLoadedCache[library[0]] == null)
                  {
                     _gthis.bytesLoaded += param1;
                  }
                  else
                  {
                     _gthis.bytesLoaded += param1 - _gthis.bytesLoadedCache[library[0]];
                  }
                  _gthis.bytesLoadedCache[library[0]] = param1;
                  if(!_gthis.simulateProgress)
                  {
                     _gthis.onProgress.dispatch(_gthis.bytesLoaded,_gthis.bytesTotal);
                  }
               };
            })(library)).onComplete((function(param1:Array):Function
            {
               var library:Array = param1;
               return function(param1:AssetLibrary):void
               {
                  if(_gthis.bytesLoadedCache[library[0]] == null)
                  {
                     _gthis.bytesLoaded += library[0].bytesTotal;
                  }
                  else
                  {
                     _gthis.bytesLoaded += int(library[0].bytesTotal) - _gthis.bytesLoadedCache[library[0]];
                  }
                  _gthis.loadedAssetLibrary();
               };
            })(library)).onError((function():Function
            {
               return function(param1:*):void
               {
                  Log.error(param1,{
                     "fileName":"lime/utils/Preloader.hx",
                     "lineNumber":170,
                     "className":"lime.utils.Preloader",
                     "methodName":"load"
                  });
               };
            })());
         }
         _loc1_ = 0;
         _loc2_ = libraryNames;
         while(_loc1_ < int(_loc2_.length))
         {
            _loc4_ = _loc2_[_loc1_];
            _loc1_++;
            bytesTotal += 200;
         }
         ++loadedLibraries;
         preloadStarted = true;
         updateProgress();
      }
      
      public function current_onEnter(param1:Event) : void
      {
         var _loc2_:* = null as StringMap;
         var _loc3_:uint = 0;
         var _loc4_:int = 0;
         var _loc5_:* = null as StringMap;
         var _loc6_:* = null as StringMap;
         var _loc7_:int = 0;
         if(!loadedStage && Lib.current.loaderInfo.bytesLoaded == Lib.current.loaderInfo.bytesTotal)
         {
            loadedStage = true;
            _loc2_ = bytesTotalCache;
            if(("_root" in StringMap.reserved ? _loc2_.getReserved("_root") : _loc2_.h["_root"]) > 0)
            {
               _loc3_ = Lib.current.loaderInfo.bytesLoaded;
               _loc4_ = bytesLoaded;
               _loc5_ = bytesLoadedCache2;
               bytesLoaded = uint(_loc3_ - ("_root" in StringMap.reserved ? _loc5_.getReserved("_root") : _loc5_.h["_root"]) + _loc4_);
               _loc6_ = bytesLoadedCache2;
               _loc7_ = int(_loc3_);
               if("_root" in StringMap.reserved)
               {
                  _loc6_.setReserved("_root",_loc7_);
               }
               else
               {
                  _loc6_.h["_root"] = _loc7_;
               }
               updateProgress();
            }
         }
         if(loadedStage)
         {
            Lib.current.removeEventListener(Event.ENTER_FRAME,current_onEnter);
            Lib.current.loaderInfo.removeEventListener(Event.COMPLETE,loaderInfo_onComplete);
            Lib.current.loaderInfo.removeEventListener(Event.INIT,loaderInfo_onInit);
            Lib.current.loaderInfo.removeEventListener(ProgressEvent.PROGRESS,loaderInfo_onProgress);
            updateProgress();
         }
      }
      
      public function addLibraryName(param1:String) : void
      {
         if(libraryNames.indexOf(param1) == -1)
         {
            libraryNames.push(param1);
         }
      }
      
      public function addLibrary(param1:AssetLibrary) : void
      {
         libraries.push(param1);
      }
   }
}

