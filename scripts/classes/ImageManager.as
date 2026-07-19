package classes
{
   import classes.globalFlags.KGAMECLASS;
   import classes.internals.GuiOutput;
   import classes.internals.Utils;
   import flash.Boot;
   import flash.display.Loader;
   import flash.display.LoaderInfo;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.net.URLRequest;
   import haxe.IMap;
   import haxe.ds.StringMap;
   
   public final class ImageManager
   {
      
      public static var init__:Boolean;
      
      public static var _imageMap:IMap;
      
      public static var _fqPathMap:IMap;
      
      public static var MAXSIZE:int = 400;
      
      public var _waitID:String;
      
      public var _processing:Array;
      
      public var _extensions:Array;
      
      public function ImageManager()
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         _extensions = ["png","jpg","jpeg","gif"];
         _processing = [];
         _waitID = "";
      }
      
      public function showImage(param1:String, param2:String = undefined) : void
      {
         var _loc4_:* = null as StringMap;
         var _loc5_:* = null as Array;
         var _loc6_:int = 0;
         var _loc7_:* = null as String;
         if(param2 == null)
         {
            param2 = "left";
         }
         if(!KGAMECLASS.kGAMECLASS.get_displaySettings().images)
         {
            return;
         }
         var _loc3_:StringMap = ImageManager._imageMap;
         if(!(param1 in StringMap.reserved ? _loc3_.existsReserved(param1) : param1 in _loc3_.h))
         {
            _waitID = param1;
            _loc4_ = ImageManager._imageMap;
            _loc5_ = [];
            if(param1 in StringMap.reserved)
            {
               _loc4_.setReserved(param1,_loc5_);
            }
            else
            {
               _loc4_.h[param1] = _loc5_;
            }
            _loc6_ = 0;
            _loc5_ = _extensions;
            while(_loc6_ < int(_loc5_.length))
            {
               _loc7_ = _loc5_[_loc6_];
               _loc6_++;
               loadImageAtPath("./img/" + param1 + "." + _loc7_,param1);
               loadImageAtPath("./img/" + param1 + "_1." + _loc7_,param1);
            }
            return;
         }
         _loc4_ = ImageManager._imageMap;
         if(int((param1 in StringMap.reserved ? _loc4_.getReserved(param1) : _loc4_.h[param1]).length) <= 0)
         {
            return;
         }
         var _loc8_:StringMap = ImageManager._imageMap;
         _loc5_ = param1 in StringMap.reserved ? _loc8_.getReserved(param1) : _loc8_.h[param1];
         var _loc9_:* = _loc5_[Utils.rand(int(_loc5_.length))];
         _loc6_ = 400;
         var _loc10_:int = 400;
         if(int(_loc9_.width) >= int(_loc9_.height))
         {
            _loc10_ = int(Math.ceil(int(_loc9_.height) * (400 / int(_loc9_.width))));
         }
         else
         {
            _loc6_ = int(Math.ceil(int(_loc9_.width) * (400 / int(_loc9_.height))));
         }
         _loc7_ = "<img src=\'" + _loc9_.url + "\' width=\'" + _loc6_ + "\' height=\'" + _loc10_ + "\' align=\'left\' id=\'img\'/>";
         KGAMECLASS.kGAMECLASS.output.addImage(_loc7_).flush();
      }
      
      public function process(param1:String) : void
      {
         if(Boolean(_processing.contains(param1)))
         {
            _processing.remove(param1);
         }
         if(!Boolean(_processing.contains(param1)))
         {
            showImage(_waitID);
            _waitID = "";
         }
      }
      
      public function loadImageAtPath(param1:String, param2:String) : void
      {
         var imId2:String;
         var _g1:ImageManager;
         var imId1:String;
         var imPath1:String;
         var _g:ImageManager;
         var _loc3_:Loader = new Loader();
         _processing.push(param2);
         _g = this;
         imPath1 = param1;
         imId1 = param2;
         var _loc4_:Function = function(param1:Event):void
         {
            _g.fileLoaded(param1,imPath1,imId1);
         };
         _loc3_.contentLoaderInfo.addEventListener(Event.COMPLETE,_loc4_);
         _g1 = this;
         imId2 = param2;
         var _loc5_:Function = function(param1:IOErrorEvent):void
         {
            _g1.fileNotFound(param1,imId2);
         };
         _loc3_.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,_loc5_);
         _loc3_.load(new URLRequest(param1));
      }
      
      public function fileNotFound(param1:IOErrorEvent, param2:String) : void
      {
         process(param2);
      }
      
      public function fileLoaded(param1:Event, param2:String, param3:String) : void
      {
         var _loc7_:* = null as String;
         var _loc10_:int = 0;
         var _loc11_:* = null as String;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:* = null as Array;
         var _loc15_:* = null as String;
         var _loc16_:* = null as String;
         var _loc4_:LoaderInfo = param1.target;
         var _loc5_:* = {
            "id":param3,
            "url":param2,
            "width":_loc4_.width,
            "height":_loc4_.height
         };
         var _loc6_:IMap = ImageManager._fqPathMap;
         _loc7_ = _loc4_.url;
         var _loc8_:StringMap = _loc6_;
         if(_loc7_ in StringMap.reserved)
         {
            _loc8_.setReserved(_loc7_,_loc5_);
         }
         else
         {
            _loc8_.h[_loc7_] = _loc5_;
         }
         _loc8_ = ImageManager._imageMap;
         (param3 in StringMap.reserved ? _loc8_.getReserved(param3) : _loc8_.h[param3]).push(_loc5_);
         var _loc9_:int = param2.lastIndexOf("_");
         if(_loc9_ != -1)
         {
            _loc10_ = param2.lastIndexOf(".");
            _loc7_ = param2.substring(0,_loc9_ + 1);
            _loc11_ = param2.substring(_loc9_ + 1,_loc10_);
            _loc12_ = int(Std.parseInt(_loc11_) + 1);
            _loc13_ = 0;
            _loc14_ = _extensions;
            while(_loc13_ < int(_loc14_.length))
            {
               _loc15_ = _loc14_[_loc13_];
               _loc13_++;
               _loc16_ = _loc7_ + _loc12_ + "." + _loc15_;
               loadImageAtPath(_loc16_,param3);
            }
         }
         process(param3);
      }
   }
}

