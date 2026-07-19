package classes.saves
{
   import classes.BaseContent;
   import classes.CoC;
   import classes.Player;
   import classes.SettingsGlobalMisc;
   import flash.Boot;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.net.FileReference;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   import flash.utils.ByteArray;
   import format.amf3.Reader;
   import format.amf3.Value;
   import haxe.Exception;
   import haxe.IMap;
   import haxe.Log;
   import haxe.Unserializer;
   import haxe.ValueException;
   import haxe.ds.IntMap;
   import haxe.ds.ObjectMap;
   import haxe.ds.StringMap;
   import haxe.io.Bytes;
   import haxe.io.BytesInput;
   
   public class FileSaverStandalone extends BaseContent implements FileSaver
   {
      
      public var loadFun:Function;
      
      public var file:FileReference;
      
      public var back:Function;
      
      public function FileSaverStandalone()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         super();
      }
      
      public function unwrapAMF3(param1:Value) : *
      {
         var _loc2_:Boolean = false;
         var _loc3_:int = 0;
         var _loc4_:Number = NaN;
         var _loc5_:* = null as String;
         var _loc6_:* = null as Date;
         var _loc7_:* = null as Object;
         var _loc8_:* = null as IMap;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:* = null;
         var _loc13_:int = 0;
         var _loc14_:Boolean = false;
         var _loc15_:int = 0;
         var _loc16_:* = null;
         var _loc17_:int = 0;
         var _loc18_:Boolean = false;
         var _loc19_:* = null as String;
         var _loc20_:* = null as String;
         var _loc21_:* = null as Array;
         var _loc22_:* = null as Array;
         var _loc23_:* = null as Function;
         var _loc24_:* = null as Array;
         var _loc25_:* = null as Array;
         var _loc26_:* = null as Value;
         var _loc27_:* = null as IMap;
         var _loc28_:Boolean = false;
         var _loc29_:* = null as Vector.<Value>;
         var _loc30_:* = null as Vector.<Object>;
         var _loc31_:int = 0;
         var _loc32_:* = null as Xml;
         var _loc33_:* = null as Bytes;
         switch(param1.index)
         {
            case 0:
               return null;
            case 1:
               return null;
            case 2:
               return Boolean(param1.params[0]);
            case 3:
               return int(param1.params[0]);
            case 4:
               return Number(param1.params[0]);
            case 5:
               return param1.params[0];
            case 6:
               return param1.params[0];
            case 7:
               _loc7_ = param1.params[1];
               _loc5_ = param1.params[2];
               _loc8_ = param1.params[0];
               _loc9_ = {};
               _loc10_ = _loc8_.h;
               _loc11_ = _loc8_.rh;
               _loc3_ = 0;
               _loc2_ = false;
               _loc12_ = _loc10_;
               _loc13_ = _loc3_;
               _loc14_ = §§hasnext(_loc12_,_loc13_);
               if(!_loc14_ && _loc11_ != null)
               {
                  _loc10_ = _loc11_;
                  _loc12_ = _loc10_;
                  _loc3_ = 0;
                  _loc13_ = _loc3_;
                  _loc11_ = null;
                  _loc2_ = true;
                  _loc14_ = §§hasnext(_loc12_,_loc13_);
               }
               _loc15_ = _loc13_;
               while(true)
               {
                  _loc16_ = _loc10_;
                  _loc17_ = _loc3_;
                  _loc18_ = §§hasnext(_loc16_,_loc17_);
                  if(!_loc18_ && _loc11_ != null)
                  {
                     _loc10_ = _loc11_;
                     _loc16_ = _loc10_;
                     _loc3_ = 0;
                     _loc17_ = _loc3_;
                     _loc11_ = null;
                     _loc2_ = true;
                     _loc18_ = §§hasnext(_loc16_,_loc17_);
                  }
                  _loc15_ = _loc17_;
                  if(!_loc18_)
                  {
                     break;
                  }
                  _loc19_ = §§nextname(_loc15_,_loc10_);
                  _loc3_ = _loc15_;
                  if(_loc2_)
                  {
                     _loc19_ = _loc19_.substr(1);
                  }
                  _loc20_ = _loc19_;
                  _loc9_[_loc20_] = unwrapAMF3(_loc20_ in StringMap.reserved ? _loc8_.getReserved(_loc20_) : _loc8_.h[_loc20_]);
               }
               return _loc9_;
            case 8:
               _loc21_ = param1.params[0];
               _loc8_ = param1.params[1];
               if(_loc8_ == null)
               {
                  _loc22_ = _loc21_;
                  _loc23_ = unwrapAMF3;
                  _loc24_ = [];
                  _loc3_ = 0;
                  _loc25_ = _loc22_;
                  while(_loc3_ < int(_loc25_.length))
                  {
                     _loc26_ = _loc25_[_loc3_];
                     _loc3_++;
                     _loc24_.push(_loc23_(_loc26_));
                  }
                  return _loc24_;
               }
               _loc27_ = _loc8_;
               _loc22_ = _loc21_;
               if(int(_loc22_.length) != 0)
               {
                  _loc9_ = _loc27_.h;
                  _loc10_ = _loc27_.rh;
                  _loc3_ = 0;
                  _loc14_ = false;
                  _loc11_ = _loc9_;
                  _loc13_ = _loc3_;
                  _loc18_ = §§hasnext(_loc11_,_loc13_);
                  if(!_loc18_ && _loc10_ != null)
                  {
                     _loc9_ = _loc10_;
                     _loc11_ = _loc9_;
                     _loc3_ = 0;
                     _loc13_ = _loc3_;
                     _loc10_ = null;
                     _loc14_ = true;
                     _loc18_ = §§hasnext(_loc11_,_loc13_);
                  }
                  _loc15_ = _loc13_;
                  _loc12_ = _loc9_;
                  _loc17_ = _loc3_;
                  _loc28_ = §§hasnext(_loc12_,_loc17_);
                  if(!_loc28_ && _loc10_ != null)
                  {
                     _loc9_ = _loc10_;
                     _loc12_ = _loc9_;
                     _loc3_ = 0;
                     _loc17_ = _loc3_;
                     _loc10_ = null;
                     _loc14_ = true;
                     _loc28_ = §§hasnext(_loc12_,_loc17_);
                  }
                  _loc15_ = _loc17_;
                  _loc2_ = _loc28_;
               }
               else
               {
                  _loc2_ = true;
               }
               if(_loc2_)
               {
                  return unwrapAMF3(Value.AObject(_loc27_));
               }
               _loc23_ = unwrapAMF3;
               _loc24_ = [];
               _loc3_ = 0;
               _loc25_ = _loc22_;
               while(_loc3_ < int(_loc25_.length))
               {
                  _loc26_ = _loc25_[_loc3_];
                  _loc3_++;
                  _loc24_.push(_loc23_(_loc26_));
               }
               return _loc24_;
               break;
            case 9:
               _loc5_ = param1.params[1];
               _loc29_ = param1.params[0];
               _loc23_ = unwrapAMF3;
               _loc3_ = int(_loc29_.length);
               _loc30_ = new Vector.<Object>(_loc3_,true);
               _loc13_ = _loc3_;
               _loc15_ = 0;
               _loc17_ = _loc13_;
               while(_loc15_ < _loc17_)
               {
                  _loc31_ = _loc15_++;
                  _loc9_ = _loc23_(_loc29_[_loc31_]);
                  _loc30_[_loc31_] = _loc9_;
               }
               return _loc30_;
            case 10:
               return param1.params[0];
            case 11:
               _loc33_ = param1.params[0];
               return _loc33_.b;
            case 12:
               _loc8_ = param1.params[0];
               _loc27_ = null;
               _loc9_ = _loc8_.keys();
               for(; Boolean(_loc9_.hasNext()); _loc27_.set(unwrapAMF3(_loc26_),unwrapAMF3(_loc8_.get(_loc26_))))
               {
                  _loc26_ = _loc9_.next();
                  if(_loc27_ != null)
                  {
                     continue;
                  }
                  switch(_loc26_.index)
                  {
                     case 3:
                        _loc3_ = int(_loc26_.params[0]);
                        _loc27_ = new IntMap();
                        break;
                     case 5:
                        _loc5_ = _loc26_.params[0];
                        _loc27_ = new StringMap();
                        break;
                     default:
                        _loc27_ = new ObjectMap();
                  }
               }
               if(_loc27_ == null)
               {
                  _loc27_ = new StringMap();
               }
               return _loc27_;
            default:
               return;
         }
      }
      
      public function save(param1:ByteArray, param2:Function) : Boolean
      {
         var _loc3_:ByteArray = param1;
         clearOutput();
         outputText("尝试保存到文件。");
         var _loc4_:String = "" + get_player().get_short() + ".coc";
         file = new FileReference();
         file.save(_loc3_,_loc4_);
         file.addEventListener(Event.COMPLETE,onFileSaved);
         return false;
      }
      
      public function onFileSelected(param1:Event) : void
      {
         var _loc2_:FileReference = param1.target;
         _loc2_.addEventListener(Event.COMPLETE,onFileLoaded);
         _loc2_.addEventListener(IOErrorEvent.IO_ERROR,ioErrorHandler);
         _loc2_.load();
      }
      
      public function onFileSaved(param1:Event) : void
      {
         get_game().get_miscSettings().lastFileSaveName = param1.target.name;
         get_game().saves.savePermObject();
      }
      
      public function onFileLoaded(param1:Event) : void
      {
         var _loc2_:Function = Log.trace;
         var _loc3_:Object = param1.target;
         _loc2_("File target = ",{
            "fileName":"src/classes/saves/FileSaverStandalone.hx",
            "lineNumber":74,
            "className":"classes.saves.FileSaverStandalone",
            "methodName":"onFileLoaded",
            "customParams":[_loc3_ == null ? "null" : (_loc3_ == null ? null : Std.string(_loc3_))]
         });
         var _loc4_:FileReference = param1.target;
         loadData(_loc4_.data);
      }
      
      public function onAutoLoadFail(param1:Array, param2:Event) : void
      {
         if(int(param1.length) > 0)
         {
            autoLoad(param1,loadFun,back);
         }
         else
         {
            load(loadFun,back);
         }
      }
      
      public function onAutoLoad(param1:Array, param2:Event) : void
      {
         var _loc4_:* = null as URLLoader;
         var _loc5_:* = null;
         var _loc6_:* = null as Error;
         try
         {
            _loc4_ = param2.target;
            _loc5_ = _loc4_.data.readObject();
            if(Number(_loc5_.data.saveTime) == get_game().get_miscSettings().lastFileSaveTime)
            {
               get_game().saves.latestSaveFile = _loc5_;
               get_game().saves.latestSaveTime = Number(_loc5_.data.saveTime);
               loadFun("File",true);
            }
            else
            {
               onAutoLoadFail(param1,param2);
            }
         }
         catch(_loc_e_:Error)
         {
            _loc6_ = _loc_e_;
            onAutoLoadFail(param1,param2);
         }
      }
      
      public function loadHXSF(param1:ByteArray) : void
      {
         var _loc3_:* = null as String;
         var _loc4_:* = null;
         try
         {
            param1.position = 0;
            param1.endian = "littleEndian";
            _loc3_ = param1.readUTF();
            get_game().saves.latestSaveFile = Unserializer.run(_loc3_);
            loadFun("File",false);
            statScreenRefresh();
         }
         catch(_loc_e_:*)
         {
            return;
         }
      }
      
      public function loadData(param1:ByteArray) : void
      {
         var _loc3_:* = null as ValueException;
         var _loc4_:* = null as RangeError;
         var _loc5_:* = null;
         showStats();
         statScreenRefresh();
         clearOutput();
         outputText("正在加载存档...");
         try
         {
            get_game().saves.latestSaveFile = param1.readObject();
            loadFun("File",false);
            statScreenRefresh();
         }
         catch(_loc_e_:ValueException)
         {
            _loc3_ = _loc_e_;
            loadAMF3(param1);
         }
         catch(_loc_e_:RangeError)
         {
            _loc4_ = _loc_e_;
            loadHXSF(param1);
         }
         catch(_loc_e_:*)
         {
            return;
         }
      }
      
      public function loadAMF3(param1:ByteArray) : void
      {
         var _loc3_:* = null as BytesInput;
         var _loc4_:* = null as Reader;
         var _loc5_:* = null as Value;
         var _loc6_:* = null;
         var _loc7_:* = null as Exception;
         try
         {
            param1.objectEncoding = 3;
            param1.position = 0;
            _loc3_ = new BytesInput(Bytes.ofData(param1),param1.position);
            _loc4_ = new Reader(_loc3_);
            _loc5_ = _loc4_.read();
            get_game().saves.latestSaveFile = unwrapAMF3(_loc5_);
            loadFun("File",false);
            statScreenRefresh();
         }
         catch(_loc_e_:*)
         {
            return;
         }
      }
      
      public function load(param1:Function, param2:Function) : void
      {
         loadFun = param1;
         back = param2;
         chooseFile();
      }
      
      public function ioErrorHandler(param1:IOErrorEvent) : void
      {
         clearOutput();
         outputText("<b>!</b> 未找到存档文件。");
         outputText("[pg]如果你正试图在浏览器中玩这个游戏，请不要这么做。");
         doNext(back);
      }
      
      public function chooseFile() : void
      {
         file = new FileReference();
         file.addEventListener(Event.SELECT,onFileSelected);
         file.addEventListener(IOErrorEvent.IO_ERROR,ioErrorHandler);
         file.browse();
      }
      
      public function autoLoad(param1:Array, param2:Function, param3:Function) : void
      {
         var loadList2:Array;
         var _g1:FileSaverStandalone;
         var loadList1:Array;
         var _g:FileSaverStandalone;
         loadFun = param2;
         back = param3;
         var _loc4_:String = param1.splice(0,1)[0];
         var _loc5_:URLLoader = new URLLoader();
         _loc5_.dataFormat = "binary";
         _g = this;
         loadList1 = param1;
         _loc5_.addEventListener(Event.COMPLETE,function(param1:Event):void
         {
            _g.onAutoLoad(loadList1,param1);
         });
         _g1 = this;
         loadList2 = param1;
         _loc5_.addEventListener(IOErrorEvent.IO_ERROR,function(param1:Event):void
         {
            _g1.onAutoLoadFail(loadList2,param1);
         });
         _loc5_.load(new URLRequest(_loc4_));
      }
   }
}

