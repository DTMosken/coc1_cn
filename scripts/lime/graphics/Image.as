package lime.graphics
{
   import flash.Boot;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Loader;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.geom.ColorTransform;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.net.URLRequest;
   import flash.system.LoaderContext;
   import flash.utils.ByteArray;
   import haxe.Exception;
   import haxe.io.Bytes;
   import lime._internal.format.BMP;
   import lime._internal.format.Base64;
   import lime._internal.format.JPEG;
   import lime._internal.format.PNG;
   import lime._internal.graphics.ImageCanvasUtil;
   import lime._internal.graphics.ImageDataUtil;
   import lime.app.Future;
   import lime.app.Promise_lime_graphics_Image;
   import lime.math.Rectangle;
   import lime.math.Vector2;
   import lime.math._ColorMatrix.ColorMatrix_Impl_;
   import lime.system.Endian;
   import lime.utils.ArrayBufferView;
   import lime.utils.BytePointerData;
   import lime.utils.Log;
   import lime.utils.TAError;
   
   public class Image
   {
      
      public var y:Number;
      
      public var x:Number;
      
      public var width:int;
      
      public var version:int;
      
      public var type:ImageType;
      
      public var rect:lime.math.Rectangle;
      
      public var offsetY:int;
      
      public var offsetX:int;
      
      public var height:int;
      
      public var dirty:Boolean;
      
      public var buffer:ImageBuffer;
      
      public function Image(param1:ImageBuffer = undefined, param2:int = 0, param3:int = 0, param4:int = -1, param5:int = -1, param6:Object = undefined, param7:ImageType = undefined)
      {
         var _loc8_:* = null as Object;
         var _loc9_:* = null as Bytes;
         var _loc10_:* = null as Array;
         var _loc11_:* = null as Vector.<int>;
         var _loc12_:* = null as ArrayBufferView;
         var _loc13_:* = null as Object;
         var _loc14_:* = null as ArrayBufferView;
         var _loc15_:* = null as ArrayBufferView;
         var _loc16_:* = null as Array;
         var _loc17_:* = null as Bytes;
         var _loc18_:int = 0;
         var _loc19_:int = 0;
         var _loc20_:int = 0;
         var _loc21_:int = 0;
         var _loc22_:int = 0;
         var _loc23_:int = 0;
         if(Boot.skip_constructor)
         {
            return;
         }
         offsetX = param2;
         offsetY = param3;
         width = param4;
         height = param5;
         version = 0;
         if(param7 == null)
         {
            param7 = ImageType.FLASH;
         }
         type = param7;
         if(param1 == null)
         {
            if(param4 > 0 && param5 > 0)
            {
               switch(type.index)
               {
                  case 0:
                     buffer = new ImageBuffer(null,param4,param5);
                     ImageCanvasUtil.createCanvas(this,param4,param5);
                     if(param6 != null && param6 != 0)
                     {
                        fillRect(new lime.math.Rectangle(0,0,param4,param5),param6);
                     }
                     break;
                  case 1:
                     _loc8_ = param4 * param5 * 4;
                     _loc9_ = null;
                     _loc10_ = null;
                     _loc11_ = null;
                     _loc12_ = null;
                     _loc13_ = null;
                     if(_loc8_ != null)
                     {
                        _loc14_ = new ArrayBufferView(_loc8_,4);
                     }
                     else if(_loc10_ != null)
                     {
                        _loc15_ = new ArrayBufferView(0,4);
                        _loc15_.byteOffset = 0;
                        _loc15_.length = int(_loc10_.length);
                        _loc15_.byteLength = _loc15_.length * _loc15_.bytesPerElement;
                        _loc15_.buffer = Bytes.alloc(_loc15_.byteLength);
                        _loc15_.copyFromArray(_loc10_);
                        _loc14_ = _loc15_;
                     }
                     else if(_loc11_ != null)
                     {
                        _loc15_ = new ArrayBufferView(0,4);
                        _loc16_ = _loc11_.__array;
                        _loc15_.byteOffset = 0;
                        _loc15_.length = int(_loc16_.length);
                        _loc15_.byteLength = _loc15_.length * _loc15_.bytesPerElement;
                        _loc15_.buffer = Bytes.alloc(_loc15_.byteLength);
                        _loc15_.copyFromArray(_loc16_);
                        _loc14_ = _loc15_;
                     }
                     else if(_loc12_ != null)
                     {
                        _loc15_ = new ArrayBufferView(0,4);
                        _loc17_ = _loc12_.buffer;
                        _loc18_ = _loc12_.length;
                        _loc19_ = _loc12_.byteOffset;
                        _loc20_ = _loc12_.bytesPerElement;
                        _loc21_ = _loc15_.bytesPerElement;
                        if(_loc12_.type != _loc15_.type)
                        {
                           throw Exception.thrown("unimplemented");
                        }
                        _loc22_ = _loc17_.length;
                        _loc23_ = _loc22_ - _loc19_;
                        _loc15_.buffer = Bytes.alloc(_loc23_);
                        _loc15_.buffer.blit(0,_loc17_,_loc19_,_loc23_);
                        _loc15_.byteLength = _loc15_.bytesPerElement * _loc18_;
                        _loc15_.byteOffset = 0;
                        _loc15_.length = _loc18_;
                        _loc14_ = _loc15_;
                     }
                     else
                     {
                        if(_loc9_ == null)
                        {
                           throw Exception.thrown("Invalid constructor arguments for UInt8Array");
                        }
                        _loc15_ = new ArrayBufferView(0,4);
                        _loc18_ = 0;
                        if(_loc18_ < 0)
                        {
                           throw Exception.thrown(TAError.RangeError);
                        }
                        if(int(_loc18_ % _loc15_.bytesPerElement) != 0)
                        {
                           throw Exception.thrown(TAError.RangeError);
                        }
                        _loc19_ = _loc9_.length;
                        _loc20_ = _loc15_.bytesPerElement;
                        _loc21_ = _loc19_;
                        if(_loc13_ == null)
                        {
                           _loc21_ = _loc19_ - _loc18_;
                           if(int(_loc19_ % _loc15_.bytesPerElement) != 0)
                           {
                              throw Exception.thrown(TAError.RangeError);
                           }
                           if(_loc21_ < 0)
                           {
                              throw Exception.thrown(TAError.RangeError);
                           }
                        }
                        else
                        {
                           _loc21_ = _loc13_ * _loc15_.bytesPerElement;
                           _loc22_ = _loc18_ + _loc21_;
                           if(_loc22_ > _loc19_)
                           {
                              throw Exception.thrown(TAError.RangeError);
                           }
                        }
                        _loc15_.buffer = _loc9_;
                        _loc15_.byteOffset = _loc18_;
                        _loc15_.byteLength = _loc21_;
                        _loc15_.length = int(_loc21_ / _loc15_.bytesPerElement);
                        _loc14_ = _loc15_;
                     }
                     buffer = new ImageBuffer(_loc14_,param4,param5);
                     if(param6 != null && param6 != 0)
                     {
                        fillRect(new lime.math.Rectangle(0,0,param4,param5),param6);
                     }
                     break;
                  case 2:
                     buffer = new ImageBuffer(null,param4,param5);
                     buffer.set_src(new BitmapData(param4,param5,true,(param6 & 0xFF) << 24 | param6 >> 8));
               }
            }
         }
         else
         {
            __fromImageBuffer(param1);
         }
      }
      
      public static function fromBase64(param1:String, param2:String) : Image
      {
         if(param1 == null)
         {
            return null;
         }
         var _loc3_:Image = new Image();
         _loc3_.__fromBase64(param1,param2);
         return _loc3_;
      }
      
      public static function fromBitmapData(param1:BitmapData) : Image
      {
         if(param1 == null)
         {
            return null;
         }
         var _loc2_:ImageBuffer = new ImageBuffer(null,param1.width,param1.height);
         _loc2_.__srcBitmapData = param1;
         _loc2_.transparent = param1.transparent;
         return new Image(_loc2_);
      }
      
      public static function fromBytes(param1:Bytes) : Image
      {
         if(param1 == null)
         {
            return null;
         }
         var _loc2_:Image = new Image();
         if(_loc2_.__fromBytes(param1))
         {
            return _loc2_;
         }
         return null;
      }
      
      public static function fromCanvas(param1:*) : Image
      {
         if(param1 == null)
         {
            return null;
         }
         var _loc2_:ImageBuffer = new ImageBuffer(null,param1.width,param1.height);
         _loc2_.set_src(param1);
         var _loc3_:Image = new Image(_loc2_);
         _loc3_.type = ImageType.CANVAS;
         return _loc3_;
      }
      
      public static function fromFile(param1:String) : Image
      {
         if(param1 == null)
         {
            return null;
         }
         var _loc2_:Image = new Image();
         if(_loc2_.__fromFile(param1))
         {
            return _loc2_;
         }
         return null;
      }
      
      public static function fromImageElement(param1:*) : Image
      {
         if(param1 == null)
         {
            return null;
         }
         var _loc2_:ImageBuffer = new ImageBuffer(null,param1.width,param1.height);
         _loc2_.set_src(param1);
         var _loc3_:Image = new Image(_loc2_);
         _loc3_.type = ImageType.CANVAS;
         return _loc3_;
      }
      
      public static function loadFromBase64(param1:String, param2:String) : Future
      {
         if(param1 == null || param2 == null)
         {
            return Future.withValue(null);
         }
         if(param1 != null)
         {
            return Image.loadFromBytes(Base64.decode(param1));
         }
         return Future.withError("");
      }
      
      public static function loadFromBytes(param1:Bytes) : Future
      {
         var loader:Loader;
         var promise:Promise_lime_graphics_Image;
         if(param1 == null)
         {
            return Future.withValue(null);
         }
         promise = new Promise_lime_graphics_Image();
         loader = new Loader();
         loader.contentLoaderInfo.addEventListener(Event.COMPLETE,function(param1:*):void
         {
            promise.complete(Image.fromBitmapData(loader.content.bitmapData));
         });
         loader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS,function(param1:ProgressEvent):void
         {
            promise.progress(int(param1.bytesLoaded),int(param1.bytesTotal));
         });
         loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,function(param1:IOErrorEvent):void
         {
            promise.error(param1.errorID);
         });
         loader.loadBytes(param1.b);
         return promise.future;
      }
      
      public static function loadFromFile(param1:String) : Future
      {
         var loader:Loader;
         var promise:Promise_lime_graphics_Image;
         if(param1 == null)
         {
            return Future.withValue(null);
         }
         promise = new Promise_lime_graphics_Image();
         loader = new Loader();
         loader.contentLoaderInfo.addEventListener(Event.COMPLETE,function(param1:*):void
         {
            promise.complete(Image.fromBitmapData(loader.content.bitmapData));
         });
         loader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS,function(param1:ProgressEvent):void
         {
            promise.progress(int(param1.bytesLoaded),int(param1.bytesTotal));
         });
         loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,function(param1:IOErrorEvent):void
         {
            promise.error(param1.errorID);
         });
         loader.load(new URLRequest(param1),new LoaderContext(true));
         return promise.future;
      }
      
      public static function __isGIF(param1:Bytes) : Boolean
      {
         if(param1 == null || param1.length < 6)
         {
            return false;
         }
         var _loc2_:String = param1.getString(0,6);
         if(_loc2_ != "GIF87a")
         {
            return _loc2_ == "GIF89a";
         }
         return true;
      }
      
      public static function __isJPG(param1:Bytes) : Boolean
      {
         if(param1 == null || param1.length < 4)
         {
            return false;
         }
         if(int(param1.b[0]) == 255 && int(param1.b[1]) == 216 && int(param1.b[param1.length - 2]) == 255)
         {
            return int(param1.b[param1.length - 1]) == 217;
         }
         return false;
      }
      
      public static function __isPNG(param1:Bytes) : Boolean
      {
         if(param1 == null || param1.length < 8)
         {
            return false;
         }
         if(int(param1.b[0]) == 137 && int(param1.b[1]) == 80 && int(param1.b[2]) == 78 && int(param1.b[3]) == 71 && int(param1.b[4]) == 13 && int(param1.b[5]) == 10 && int(param1.b[6]) == 26)
         {
            return int(param1.b[7]) == 10;
         }
         return false;
      }
      
      public static function __isWebP(param1:Bytes) : Boolean
      {
         if(param1 == null || param1.length < 16)
         {
            return false;
         }
         if(param1.getString(0,4) == "RIFF")
         {
            return param1.getString(8,4) == "WEBP";
         }
         return false;
      }
      
      public function threshold(param1:Image, param2:lime.math.Rectangle, param3:Vector2, param4:String, param5:int, param6:int = 0, param7:int = -1, param8:Boolean = false, param9:Object = undefined) : int
      {
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:* = null as Object;
         var _loc14_:int = 0;
         if(buffer == null || param1 == null || param2 == null)
         {
            return 0;
         }
         switch(type.index)
         {
            case 0:
            case 1:
               return ImageDataUtil.threshold(this,param1,param2,param3,param4,param5,param6,param7,param8,param9);
            case 2:
               if(param9 == null)
               {
                  _loc11_ = param6;
                  _loc12_ = 0;
                  _loc12_ = (_loc11_ & 0xFF & 0xFF) << 24 | (_loc11_ >> 24 & 0xFF & 0xFF) << 16 | (_loc11_ >> 16 & 0xFF & 0xFF) << 8 | _loc11_ >> 8 & 0xFF & 0xFF;
                  _loc10_ = _loc12_;
               }
               else
               {
                  _loc13_ = param9;
                  if(_loc13_ == 1)
                  {
                     _loc10_ = param6;
                  }
                  else if(_loc13_ == 2)
                  {
                     _loc11_ = param6;
                     _loc12_ = 0;
                     _loc12_ = (_loc11_ & 0xFF & 0xFF) << 24 | (_loc11_ >> 8 & 0xFF & 0xFF) << 16 | (_loc11_ >> 16 & 0xFF & 0xFF) << 8 | _loc11_ >> 24 & 0xFF & 0xFF;
                     _loc10_ = _loc12_;
                  }
                  else
                  {
                     _loc11_ = param6;
                     _loc12_ = 0;
                     _loc12_ = (_loc11_ & 0xFF & 0xFF) << 24 | (_loc11_ >> 24 & 0xFF & 0xFF) << 16 | (_loc11_ >> 16 & 0xFF & 0xFF) << 8 | _loc11_ >> 8 & 0xFF & 0xFF;
                     _loc10_ = _loc12_;
                  }
               }
               if(param9 == null)
               {
                  _loc12_ = param7;
                  _loc14_ = 0;
                  _loc14_ = (_loc12_ & 0xFF & 0xFF) << 24 | (_loc12_ >> 24 & 0xFF & 0xFF) << 16 | (_loc12_ >> 16 & 0xFF & 0xFF) << 8 | _loc12_ >> 8 & 0xFF & 0xFF;
                  _loc11_ = _loc14_;
               }
               else
               {
                  _loc13_ = param9;
                  if(_loc13_ == 1)
                  {
                     _loc11_ = param7;
                  }
                  else if(_loc13_ == 2)
                  {
                     _loc12_ = param7;
                     _loc14_ = 0;
                     _loc14_ = (_loc12_ & 0xFF & 0xFF) << 24 | (_loc12_ >> 8 & 0xFF & 0xFF) << 16 | (_loc12_ >> 16 & 0xFF & 0xFF) << 8 | _loc12_ >> 24 & 0xFF & 0xFF;
                     _loc11_ = _loc14_;
                  }
                  else
                  {
                     _loc12_ = param7;
                     _loc14_ = 0;
                     _loc14_ = (_loc12_ & 0xFF & 0xFF) << 24 | (_loc12_ >> 24 & 0xFF & 0xFF) << 16 | (_loc12_ >> 16 & 0xFF & 0xFF) << 8 | _loc12_ >> 8 & 0xFF & 0xFF;
                     _loc11_ = _loc14_;
                  }
               }
               param2.offset(param1.offsetX,param1.offsetY);
               param3.offset(offsetX,offsetY);
               return int(buffer.__srcBitmapData.threshold(param1.buffer.get_src(),param2.__toFlashRectangle(),param3.__toFlashPoint(),param4,param5,_loc10_,_loc11_,param8));
            default:
               return 0;
         }
      }
      
      public function set_transparent(param1:Boolean) : Boolean
      {
         if(buffer == null)
         {
            return false;
         }
         return buffer.transparent = param1;
      }
      
      public function set_src(param1:*) : *
      {
         return buffer.set_src(param1);
      }
      
      public function set_premultiplied(param1:Boolean) : Boolean
      {
         if(param1 && !buffer.premultiplied)
         {
            switch(type.index)
            {
               case 0:
               case 1:
                  ImageDataUtil.multiplyAlpha(this);
            }
         }
         else if(!param1 && buffer.premultiplied)
         {
            if(type.index == 1)
            {
               ImageDataUtil.unmultiplyAlpha(this);
            }
         }
         return param1;
      }
      
      public function set_powerOfTwo(param1:Boolean) : Boolean
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:* = null as BitmapData;
         if(param1 != get_powerOfTwo())
         {
            _loc2_ = 1;
            _loc3_ = 1;
            while(_loc2_ < buffer.width)
            {
               _loc2_ <<= 1;
            }
            while(_loc3_ < buffer.height)
            {
               _loc3_ <<= 1;
            }
            if(_loc2_ == buffer.width && _loc3_ == buffer.height)
            {
               return param1;
            }
            switch(type.index)
            {
               case 0:
                  ImageDataUtil.resizeBuffer(this,_loc2_,_loc3_);
                  break;
               case 1:
                  ImageDataUtil.resizeBuffer(this,_loc2_,_loc3_);
                  break;
               case 2:
                  _loc4_ = new BitmapData(_loc2_,_loc3_,true,0);
                  _loc4_.draw(buffer.get_src(),null,null,null,null,true);
                  buffer.set_src(_loc4_);
                  buffer.width = _loc2_;
                  buffer.height = _loc3_;
            }
         }
         return param1;
      }
      
      public function set_format(param1:int) : int
      {
         if(buffer.format != param1)
         {
            if(type.index == 1)
            {
               ImageDataUtil.setFormat(this,param1);
            }
         }
         return buffer.format = param1;
      }
      
      public function set_data(param1:ArrayBufferView) : ArrayBufferView
      {
         return buffer.data = param1;
      }
      
      public function setPixels(param1:lime.math.Rectangle, param2:BytePointerData, param3:Object = undefined, param4:Endian = undefined) : void
      {
         var _loc5_:* = null as ByteArray;
         var _loc6_:* = null as ByteArray;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:* = null as Object;
         param1 = __clipRect(param1);
         if(buffer == null || param1 == null)
         {
            return;
         }
         if(param4 == null)
         {
            param4 = Endian.BIG_ENDIAN;
         }
         switch(type.index)
         {
            case 0:
               ImageCanvasUtil.setPixels(this,param1,param2,param3,param4);
               break;
            case 1:
               ImageDataUtil.setPixels(this,param1,param2,param3,param4);
               break;
            case 2:
               param1.offset(offsetX,offsetY);
               _loc5_ = new ByteArray();
               if(param3 == null)
               {
                  _loc6_ = param2.bytes.b;
                  _loc5_ = new ByteArray();
                  _loc5_.position = param2.offset;
                  _loc5_.length = _loc6_.length;
                  _loc8_ = int(_loc5_.length / 4);
                  _loc9_ = 0;
                  _loc10_ = _loc8_;
                  while(_loc9_ < _loc10_)
                  {
                     _loc11_ = _loc9_++;
                     _loc7_ = int(_loc6_.readUnsignedInt());
                     §§push(_loc5_);
                     var _temp_1:* = _loc7_;
                     §§push(_temp_1);
                     if(!(_temp_1 is Number))
                     {
                        throw "Class cast error";
                     }
                     §§pop().writeUnsignedInt(int(§§pop()));
                  }
                  _loc6_.position = 0;
                  _loc5_.position = 0;
               }
               else
               {
                  _loc12_ = param3;
                  if(_loc12_ != 1)
                  {
                     if(_loc12_ == 2)
                     {
                        _loc6_ = param2.bytes.b;
                        _loc5_ = new ByteArray();
                        _loc5_.position = param2.offset;
                        _loc5_.length = _loc6_.length;
                        _loc8_ = int(_loc5_.length / 4);
                        _loc9_ = 0;
                        _loc10_ = _loc8_;
                        while(_loc9_ < _loc10_)
                        {
                           _loc11_ = _loc9_++;
                           _loc7_ = int(_loc6_.readUnsignedInt());
                           §§push(_loc5_);
                           var _temp_2:* = _loc7_;
                           §§push(_temp_2);
                           if(!(_temp_2 is Number))
                           {
                              throw "Class cast error";
                           }
                           §§pop().writeUnsignedInt(int(§§pop()));
                        }
                        _loc6_.position = 0;
                        _loc5_.position = 0;
                     }
                     else
                     {
                        _loc6_ = param2.bytes.b;
                        _loc5_ = new ByteArray();
                        _loc5_.position = param2.offset;
                        _loc5_.length = _loc6_.length;
                        _loc8_ = int(_loc5_.length / 4);
                        _loc9_ = 0;
                        _loc10_ = _loc8_;
                        while(_loc9_ < _loc10_)
                        {
                           _loc11_ = _loc9_++;
                           _loc7_ = int(_loc6_.readUnsignedInt());
                           §§push(_loc5_);
                           var _temp_3:* = _loc7_;
                           §§push(_temp_3);
                           if(!(_temp_3 is Number))
                           {
                              throw "Class cast error";
                           }
                           §§pop().writeUnsignedInt(int(§§pop()));
                        }
                        _loc6_.position = 0;
                        _loc5_.position = 0;
                     }
                  }
               }
               buffer.__srcBitmapData.setPixels(param1.__toFlashRectangle(),_loc5_);
         }
      }
      
      public function setPixel32(param1:int, param2:int, param3:int, param4:Object = undefined) : void
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:* = null as Object;
         if(buffer == null || param1 < 0 || param2 < 0 || param1 >= width || param2 >= height)
         {
            return;
         }
         switch(type.index)
         {
            case 0:
               ImageCanvasUtil.setPixel32(this,param1,param2,param3,param4);
               break;
            case 1:
               ImageDataUtil.setPixel32(this,param1,param2,param3,param4);
               break;
            case 2:
               if(param4 == null)
               {
                  _loc6_ = param3;
                  _loc7_ = 0;
                  _loc7_ = (_loc6_ & 0xFF & 0xFF) << 24 | (_loc6_ >> 24 & 0xFF & 0xFF) << 16 | (_loc6_ >> 16 & 0xFF & 0xFF) << 8 | _loc6_ >> 8 & 0xFF & 0xFF;
                  _loc5_ = _loc7_;
               }
               else
               {
                  _loc8_ = param4;
                  if(_loc8_ == 1)
                  {
                     _loc5_ = param3;
                  }
                  else if(_loc8_ == 2)
                  {
                     _loc6_ = param3;
                     _loc7_ = 0;
                     _loc7_ = (_loc6_ & 0xFF & 0xFF) << 24 | (_loc6_ >> 8 & 0xFF & 0xFF) << 16 | (_loc6_ >> 16 & 0xFF & 0xFF) << 8 | _loc6_ >> 24 & 0xFF & 0xFF;
                     _loc5_ = _loc7_;
                  }
                  else
                  {
                     _loc6_ = param3;
                     _loc7_ = 0;
                     _loc7_ = (_loc6_ & 0xFF & 0xFF) << 24 | (_loc6_ >> 24 & 0xFF & 0xFF) << 16 | (_loc6_ >> 16 & 0xFF & 0xFF) << 8 | _loc6_ >> 8 & 0xFF & 0xFF;
                     _loc5_ = _loc7_;
                  }
               }
               buffer.__srcBitmapData.setPixel32(param1 + offsetX,param2 + offsetY,_loc5_);
         }
      }
      
      public function setPixel(param1:int, param2:int, param3:int, param4:Object = undefined) : void
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:* = null as Object;
         if(buffer == null || param1 < 0 || param2 < 0 || param1 >= width || param2 >= height)
         {
            return;
         }
         switch(type.index)
         {
            case 0:
               ImageCanvasUtil.setPixel(this,param1,param2,param3,param4);
               break;
            case 1:
               ImageDataUtil.setPixel(this,param1,param2,param3,param4);
               break;
            case 2:
               if(param4 == null)
               {
                  _loc6_ = param3;
                  _loc7_ = 0;
                  _loc7_ = (_loc6_ & 0xFF & 0xFF) << 24 | (_loc6_ >> 24 & 0xFF & 0xFF) << 16 | (_loc6_ >> 16 & 0xFF & 0xFF) << 8 | _loc6_ >> 8 & 0xFF & 0xFF;
                  _loc5_ = _loc7_;
               }
               else
               {
                  _loc8_ = param4;
                  if(_loc8_ == 1)
                  {
                     _loc5_ = param3;
                  }
                  else if(_loc8_ == 2)
                  {
                     _loc6_ = param3;
                     _loc7_ = 0;
                     _loc7_ = (_loc6_ & 0xFF & 0xFF) << 24 | (_loc6_ >> 8 & 0xFF & 0xFF) << 16 | (_loc6_ >> 16 & 0xFF & 0xFF) << 8 | _loc6_ >> 24 & 0xFF & 0xFF;
                     _loc5_ = _loc7_;
                  }
                  else
                  {
                     _loc6_ = param3;
                     _loc7_ = 0;
                     _loc7_ = (_loc6_ & 0xFF & 0xFF) << 24 | (_loc6_ >> 24 & 0xFF & 0xFF) << 16 | (_loc6_ >> 16 & 0xFF & 0xFF) << 8 | _loc6_ >> 8 & 0xFF & 0xFF;
                     _loc5_ = _loc7_;
                  }
               }
               buffer.__srcBitmapData.setPixel(param1 + offsetX,param2 + offsetX,_loc5_);
         }
      }
      
      public function scroll(param1:int, param2:int) : void
      {
         if(buffer == null)
         {
            return;
         }
         switch(type.index)
         {
            case 0:
               ImageCanvasUtil.scroll(this,param1,param2);
               break;
            case 1:
               copyPixels(this,get_rect(),new Vector2(param1,param2));
               break;
            case 2:
               buffer.__srcBitmapData.scroll(param1 + offsetX,param2 + offsetX);
         }
      }
      
      public function resize(param1:int, param2:int) : void
      {
         var _loc3_:* = null as Matrix;
         var _loc4_:* = null as BitmapData;
         switch(type.index)
         {
            case 0:
               ImageCanvasUtil.resize(this,param1,param2);
               break;
            case 1:
               ImageDataUtil.resize(this,param1,param2);
               break;
            case 2:
               _loc3_ = new Matrix();
               _loc3_.scale(param1 / buffer.__srcBitmapData.width,param2 / buffer.__srcBitmapData.height);
               _loc4_ = new BitmapData(param1,param2,true,16777215);
               _loc4_.draw(buffer.__srcBitmapData,_loc3_,null,null,null,true);
               buffer.__srcBitmapData = _loc4_;
         }
         buffer.width = param1;
         buffer.height = param2;
         offsetX = 0;
         offsetY = 0;
         width = param1;
         height = param2;
      }
      
      public function merge(param1:Image, param2:lime.math.Rectangle, param3:Vector2, param4:int, param5:int, param6:int, param7:int) : void
      {
         if(buffer == null || param1 == null)
         {
            return;
         }
         switch(type.index)
         {
            case 0:
               ImageCanvasUtil.convertToCanvas(this);
               ImageCanvasUtil.merge(this,param1,param2,param3,param4,param5,param6,param7);
               break;
            case 1:
               ImageDataUtil.merge(this,param1,param2,param3,param4,param5,param6,param7);
               break;
            case 2:
               param2.offset(offsetX,offsetY);
               buffer.__srcBitmapData.merge(param1.buffer.__srcBitmapData,param2.__toFlashRectangle(),param3.__toFlashPoint(),param4,param5,param6,param7);
               break;
            default:
               return;
         }
      }
      
      public function get_transparent() : Boolean
      {
         if(buffer == null)
         {
            return false;
         }
         return buffer.transparent;
      }
      
      public function get_src() : *
      {
         return buffer.get_src();
      }
      
      public function get_rect() : lime.math.Rectangle
      {
         return new lime.math.Rectangle(0,0,width,height);
      }
      
      public function get_premultiplied() : Boolean
      {
         return buffer.premultiplied;
      }
      
      public function get_powerOfTwo() : Boolean
      {
         if(buffer.width != 0 && (buffer.width & ~buffer.width + 1) == buffer.width)
         {
            if(buffer.height != 0)
            {
               return (buffer.height & ~buffer.height + 1) == buffer.height;
            }
            return false;
         }
         return false;
      }
      
      public function get_format() : int
      {
         return buffer.format;
      }
      
      public function get_data() : ArrayBufferView
      {
         var _loc1_:* = null as ByteArray;
         var _loc2_:* = null as Object;
         var _loc3_:* = null as Bytes;
         var _loc4_:* = null as Array;
         var _loc5_:* = null as Vector.<int>;
         var _loc6_:* = null as ArrayBufferView;
         var _loc7_:* = null as Object;
         var _loc8_:* = null as ArrayBufferView;
         var _loc9_:* = null as ArrayBufferView;
         var _loc10_:* = null as Array;
         var _loc11_:* = null as Bytes;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc15_:int = 0;
         var _loc16_:int = 0;
         var _loc17_:int = 0;
         if(buffer.data == null && buffer.width > 0 && buffer.height > 0)
         {
            _loc1_ = buffer.__srcBitmapData.getPixels(buffer.__srcBitmapData.rect);
            _loc2_ = null;
            _loc3_ = Bytes.ofData(_loc1_);
            _loc4_ = null;
            _loc5_ = null;
            _loc6_ = null;
            _loc7_ = null;
            if(_loc2_ != null)
            {
               _loc8_ = new ArrayBufferView(_loc2_,4);
            }
            else if(_loc4_ != null)
            {
               _loc9_ = new ArrayBufferView(0,4);
               _loc9_.byteOffset = 0;
               _loc9_.length = int(_loc4_.length);
               _loc9_.byteLength = _loc9_.length * _loc9_.bytesPerElement;
               _loc9_.buffer = Bytes.alloc(_loc9_.byteLength);
               _loc9_.copyFromArray(_loc4_);
               _loc8_ = _loc9_;
            }
            else if(_loc5_ != null)
            {
               _loc9_ = new ArrayBufferView(0,4);
               _loc10_ = _loc5_.__array;
               _loc9_.byteOffset = 0;
               _loc9_.length = int(_loc10_.length);
               _loc9_.byteLength = _loc9_.length * _loc9_.bytesPerElement;
               _loc9_.buffer = Bytes.alloc(_loc9_.byteLength);
               _loc9_.copyFromArray(_loc10_);
               _loc8_ = _loc9_;
            }
            else if(_loc6_ != null)
            {
               _loc9_ = new ArrayBufferView(0,4);
               _loc11_ = _loc6_.buffer;
               _loc12_ = _loc6_.length;
               _loc13_ = _loc6_.byteOffset;
               _loc14_ = _loc6_.bytesPerElement;
               _loc15_ = _loc9_.bytesPerElement;
               if(_loc6_.type != _loc9_.type)
               {
                  throw Exception.thrown("unimplemented");
               }
               _loc16_ = _loc11_.length;
               _loc17_ = _loc16_ - _loc13_;
               _loc9_.buffer = Bytes.alloc(_loc17_);
               _loc9_.buffer.blit(0,_loc11_,_loc13_,_loc17_);
               _loc9_.byteLength = _loc9_.bytesPerElement * _loc12_;
               _loc9_.byteOffset = 0;
               _loc9_.length = _loc12_;
               _loc8_ = _loc9_;
            }
            else
            {
               if(_loc3_ == null)
               {
                  throw Exception.thrown("Invalid constructor arguments for UInt8Array");
               }
               _loc9_ = new ArrayBufferView(0,4);
               _loc12_ = 0;
               if(_loc12_ < 0)
               {
                  throw Exception.thrown(TAError.RangeError);
               }
               if(int(_loc12_ % _loc9_.bytesPerElement) != 0)
               {
                  throw Exception.thrown(TAError.RangeError);
               }
               _loc13_ = _loc3_.length;
               _loc14_ = _loc9_.bytesPerElement;
               _loc15_ = _loc13_;
               if(_loc7_ == null)
               {
                  _loc15_ = _loc13_ - _loc12_;
                  if(int(_loc13_ % _loc9_.bytesPerElement) != 0)
                  {
                     throw Exception.thrown(TAError.RangeError);
                  }
                  if(_loc15_ < 0)
                  {
                     throw Exception.thrown(TAError.RangeError);
                  }
               }
               else
               {
                  _loc15_ = _loc7_ * _loc9_.bytesPerElement;
                  _loc16_ = _loc12_ + _loc15_;
                  if(_loc16_ > _loc13_)
                  {
                     throw Exception.thrown(TAError.RangeError);
                  }
               }
               _loc9_.buffer = _loc3_;
               _loc9_.byteOffset = _loc12_;
               _loc9_.byteLength = _loc15_;
               _loc9_.length = int(_loc15_ / _loc9_.bytesPerElement);
               _loc8_ = _loc9_;
            }
            buffer.data = _loc8_;
         }
         return buffer.data;
      }
      
      public function getPixels(param1:lime.math.Rectangle, param2:Object = undefined) : Bytes
      {
         var _loc3_:* = null as ByteArray;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:* = null as Object;
         if(buffer == null)
         {
            return null;
         }
         switch(type.index)
         {
            case 0:
               return ImageCanvasUtil.getPixels(this,param1,param2);
            case 1:
               return ImageDataUtil.getPixels(this,param1,param2);
            case 2:
               param1.offset(offsetX,offsetY);
               _loc3_ = buffer.__srcBitmapData.getPixels(param1.__toFlashRectangle());
               if(param2 == null)
               {
                  _loc5_ = int(_loc3_.length / 4);
                  _loc6_ = 0;
                  _loc7_ = _loc5_;
                  while(_loc6_ < _loc7_)
                  {
                     _loc8_ = _loc6_++;
                     _loc9_ = int(_loc3_.readUnsignedInt());
                     _loc10_ = 0;
                     _loc10_ = (_loc9_ >> 16 & 0xFF & 0xFF) << 24 | (_loc9_ >> 8 & 0xFF & 0xFF) << 16 | (_loc9_ & 0xFF & 0xFF) << 8 | _loc9_ >> 24 & 0xFF & 0xFF;
                     _loc4_ = _loc10_;
                     _loc3_.position -= 4;
                     _loc3_.writeUnsignedInt(_loc4_);
                  }
                  _loc3_.position = 0;
               }
               else
               {
                  _loc11_ = param2;
                  if(_loc11_ != 1)
                  {
                     if(_loc11_ == 2)
                     {
                        _loc5_ = int(_loc3_.length / 4);
                        _loc6_ = 0;
                        _loc7_ = _loc5_;
                        while(_loc6_ < _loc7_)
                        {
                           _loc8_ = _loc6_++;
                           _loc9_ = int(_loc3_.readUnsignedInt());
                           _loc10_ = 0;
                           _loc10_ = (_loc9_ & 0xFF & 0xFF) << 24 | (_loc9_ >> 8 & 0xFF & 0xFF) << 16 | (_loc9_ >> 16 & 0xFF & 0xFF) << 8 | _loc9_ >> 24 & 0xFF & 0xFF;
                           _loc4_ = _loc10_;
                           _loc3_.position -= 4;
                           _loc3_.writeUnsignedInt(_loc4_);
                        }
                        _loc3_.position = 0;
                     }
                     else
                     {
                        _loc5_ = int(_loc3_.length / 4);
                        _loc6_ = 0;
                        _loc7_ = _loc5_;
                        while(_loc6_ < _loc7_)
                        {
                           _loc8_ = _loc6_++;
                           _loc9_ = int(_loc3_.readUnsignedInt());
                           _loc10_ = 0;
                           _loc10_ = (_loc9_ >> 16 & 0xFF & 0xFF) << 24 | (_loc9_ >> 8 & 0xFF & 0xFF) << 16 | (_loc9_ & 0xFF & 0xFF) << 8 | _loc9_ >> 24 & 0xFF & 0xFF;
                           _loc4_ = _loc10_;
                           _loc3_.position -= 4;
                           _loc3_.writeUnsignedInt(_loc4_);
                        }
                        _loc3_.position = 0;
                     }
                  }
               }
               return Bytes.ofData(_loc3_);
            default:
               return null;
         }
      }
      
      public function getPixel32(param1:int, param2:int, param3:Object = undefined) : int
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:* = null as Object;
         if(buffer == null || param1 < 0 || param2 < 0 || param1 >= width || param2 >= height)
         {
            return 0;
         }
         switch(type.index)
         {
            case 0:
               return ImageCanvasUtil.getPixel32(this,param1,param2,param3);
            case 1:
               return ImageDataUtil.getPixel32(this,param1,param2,param3);
            case 2:
               _loc4_ = int(buffer.__srcBitmapData.getPixel32(param1 + offsetX,param2 + offsetY));
               if(param3 == null)
               {
                  _loc5_ = 0;
                  _loc5_ = (_loc4_ >> 16 & 0xFF & 0xFF) << 24 | (_loc4_ >> 8 & 0xFF & 0xFF) << 16 | (_loc4_ & 0xFF & 0xFF) << 8 | _loc4_ >> 24 & 0xFF & 0xFF;
                  return _loc5_;
               }
               _loc7_ = param3;
               if(_loc7_ == 1)
               {
                  return _loc4_;
               }
               if(_loc7_ == 2)
               {
                  _loc5_ = 0;
                  _loc5_ = (_loc4_ & 0xFF & 0xFF) << 24 | (_loc4_ >> 8 & 0xFF & 0xFF) << 16 | (_loc4_ >> 16 & 0xFF & 0xFF) << 8 | _loc4_ >> 24 & 0xFF & 0xFF;
                  return _loc5_;
               }
               _loc5_ = 0;
               _loc5_ = (_loc4_ >> 16 & 0xFF & 0xFF) << 24 | (_loc4_ >> 8 & 0xFF & 0xFF) << 16 | (_loc4_ & 0xFF & 0xFF) << 8 | _loc4_ >> 24 & 0xFF & 0xFF;
               return _loc5_;
               break;
            default:
               return 0;
         }
      }
      
      public function getPixel(param1:int, param2:int, param3:Object = undefined) : int
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:* = null as Object;
         if(buffer == null || param1 < 0 || param2 < 0 || param1 >= width || param2 >= height)
         {
            return 0;
         }
         switch(type.index)
         {
            case 0:
               return ImageCanvasUtil.getPixel(this,param1,param2,param3);
            case 1:
               return ImageDataUtil.getPixel(this,param1,param2,param3);
            case 2:
               _loc4_ = int(buffer.__srcBitmapData.getPixel(param1 + offsetX,param2 + offsetY));
               if(param3 == null)
               {
                  _loc5_ = 0;
                  _loc5_ = (_loc4_ >> 16 & 0xFF & 0xFF) << 24 | (_loc4_ >> 8 & 0xFF & 0xFF) << 16 | (_loc4_ & 0xFF & 0xFF) << 8 | _loc4_ >> 24 & 0xFF & 0xFF;
                  return _loc5_;
               }
               _loc7_ = param3;
               if(_loc7_ == 1)
               {
                  return _loc4_;
               }
               if(_loc7_ == 2)
               {
                  _loc5_ = 0;
                  _loc5_ = (_loc4_ & 0xFF & 0xFF) << 24 | (_loc4_ >> 8 & 0xFF & 0xFF) << 16 | (_loc4_ >> 16 & 0xFF & 0xFF) << 8 | _loc4_ >> 24 & 0xFF & 0xFF;
                  return _loc5_;
               }
               _loc5_ = 0;
               _loc5_ = (_loc4_ >> 16 & 0xFF & 0xFF) << 24 | (_loc4_ >> 8 & 0xFF & 0xFF) << 16 | (_loc4_ & 0xFF & 0xFF) << 8 | _loc4_ >> 24 & 0xFF & 0xFF;
               return _loc5_;
               break;
            default:
               return 0;
         }
      }
      
      public function getColorBoundsRect(param1:int, param2:int, param3:Boolean = true, param4:Object = undefined) : lime.math.Rectangle
      {
         var _loc5_:* = null as flash.geom.Rectangle;
         if(buffer == null)
         {
            return null;
         }
         switch(type.index)
         {
            case 0:
               return ImageDataUtil.getColorBoundsRect(this,param1,param2,param3,param4);
            case 1:
               return ImageDataUtil.getColorBoundsRect(this,param1,param2,param3,param4);
            case 2:
               _loc5_ = buffer.__srcBitmapData.getColorBoundsRect(param1,param2,param3);
               return new lime.math.Rectangle(_loc5_.x,_loc5_.y,_loc5_.width,_loc5_.height);
            default:
               return null;
         }
      }
      
      public function floodFill(param1:int, param2:int, param3:int, param4:Object = undefined) : void
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:* = null as Object;
         if(buffer == null)
         {
            return;
         }
         switch(type.index)
         {
            case 0:
               ImageCanvasUtil.floodFill(this,param1,param2,param3,param4);
               break;
            case 1:
               ImageDataUtil.floodFill(this,param1,param2,param3,param4);
               break;
            case 2:
               if(param4 == null)
               {
                  _loc6_ = param3;
                  _loc7_ = 0;
                  _loc7_ = (_loc6_ & 0xFF & 0xFF) << 24 | (_loc6_ >> 24 & 0xFF & 0xFF) << 16 | (_loc6_ >> 16 & 0xFF & 0xFF) << 8 | _loc6_ >> 8 & 0xFF & 0xFF;
                  _loc5_ = _loc7_;
               }
               else
               {
                  _loc8_ = param4;
                  if(_loc8_ == 1)
                  {
                     _loc5_ = param3;
                  }
                  else if(_loc8_ == 2)
                  {
                     _loc6_ = param3;
                     _loc7_ = 0;
                     _loc7_ = (_loc6_ & 0xFF & 0xFF) << 24 | (_loc6_ >> 8 & 0xFF & 0xFF) << 16 | (_loc6_ >> 16 & 0xFF & 0xFF) << 8 | _loc6_ >> 24 & 0xFF & 0xFF;
                     _loc5_ = _loc7_;
                  }
                  else
                  {
                     _loc6_ = param3;
                     _loc7_ = 0;
                     _loc7_ = (_loc6_ & 0xFF & 0xFF) << 24 | (_loc6_ >> 24 & 0xFF & 0xFF) << 16 | (_loc6_ >> 16 & 0xFF & 0xFF) << 8 | _loc6_ >> 8 & 0xFF & 0xFF;
                     _loc5_ = _loc7_;
                  }
               }
               buffer.__srcBitmapData.floodFill(param1 + offsetX,param2 + offsetY,_loc5_);
         }
      }
      
      public function fillRect(param1:lime.math.Rectangle, param2:int, param3:Object = undefined) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:* = null as Object;
         param1 = __clipRect(param1);
         if(buffer == null || param1 == null)
         {
            return;
         }
         switch(type.index)
         {
            case 0:
               ImageCanvasUtil.fillRect(this,param1,param2,param3);
               break;
            case 1:
               if(buffer.data.length == 0)
               {
                  return;
               }
               ImageDataUtil.fillRect(this,param1,param2,param3);
               break;
            case 2:
               param1.offset(offsetX,offsetY);
               if(param3 == null)
               {
                  _loc5_ = param2;
                  _loc6_ = 0;
                  _loc6_ = (_loc5_ & 0xFF & 0xFF) << 24 | (_loc5_ >> 24 & 0xFF & 0xFF) << 16 | (_loc5_ >> 16 & 0xFF & 0xFF) << 8 | _loc5_ >> 8 & 0xFF & 0xFF;
                  _loc4_ = _loc6_;
               }
               else
               {
                  _loc7_ = param3;
                  if(_loc7_ == 1)
                  {
                     _loc4_ = param2;
                  }
                  else if(_loc7_ == 2)
                  {
                     _loc5_ = param2;
                     _loc6_ = 0;
                     _loc6_ = (_loc5_ & 0xFF & 0xFF) << 24 | (_loc5_ >> 8 & 0xFF & 0xFF) << 16 | (_loc5_ >> 16 & 0xFF & 0xFF) << 8 | _loc5_ >> 24 & 0xFF & 0xFF;
                     _loc4_ = _loc6_;
                  }
                  else
                  {
                     _loc5_ = param2;
                     _loc6_ = 0;
                     _loc6_ = (_loc5_ & 0xFF & 0xFF) << 24 | (_loc5_ >> 24 & 0xFF & 0xFF) << 16 | (_loc5_ >> 16 & 0xFF & 0xFF) << 8 | _loc5_ >> 8 & 0xFF & 0xFF;
                     _loc4_ = _loc6_;
                  }
               }
               buffer.__srcBitmapData.fillRect(param1.__toFlashRectangle(),_loc4_);
         }
      }
      
      public function encode(param1:ImageFileFormat = undefined, param2:int = 90) : Bytes
      {
         if(param1 == null)
         {
            return PNG.encode(this);
         }
         switch(param1.index)
         {
            case 0:
               return BMP.encode(this);
            case 1:
               return JPEG.encode(this,param2);
            case 2:
               return PNG.encode(this);
            default:
               return;
         }
      }
      
      public function copyPixels(param1:Image, param2:lime.math.Rectangle, param3:Vector2, param4:Image = undefined, param5:Vector2 = undefined, param6:Boolean = false) : void
      {
         if(buffer == null || param1 == null)
         {
            return;
         }
         if(param2.width <= 0 || param2.height <= 0)
         {
            return;
         }
         if(width <= 0 || height <= 0)
         {
            return;
         }
         if(param2.x + param2.width > param1.width)
         {
            param2.width = param1.width - param2.x;
         }
         if(param2.y + param2.height > param1.height)
         {
            param2.height = param1.height - param2.y;
         }
         if(param2.x < 0)
         {
            param2.width += param2.x;
            param2.x = 0;
         }
         if(param2.y < 0)
         {
            param2.height += param2.y;
            param2.y = 0;
         }
         if(param3.x + param2.width > width)
         {
            param2.width = width - param3.x;
         }
         if(param3.y + param2.height > height)
         {
            param2.height = height - param3.y;
         }
         if(param3.x < 0)
         {
            param2.width += param3.x;
            param2.x -= param3.x;
            param3.x = 0;
         }
         if(param3.y < 0)
         {
            param2.height += param3.y;
            param2.y -= param3.y;
            param3.y = 0;
         }
         if(param1 == this && param3.x < param2.get_right() && param3.y < param2.get_bottom())
         {
            param1 = clone();
         }
         if(param4 == param1 && (param5 == null || param5.x == 0 && param5.y == 0))
         {
            param4 = null;
            param5 = null;
         }
         switch(type.index)
         {
            case 0:
               if(param4 != null)
               {
                  ImageCanvasUtil.convertToData(this);
                  ImageCanvasUtil.convertToData(param1);
                  if(param4 != null)
                  {
                     ImageCanvasUtil.convertToData(param4);
                  }
                  ImageDataUtil.copyPixels(this,param1,param2,param3,param4,param5,param6);
               }
               else
               {
                  ImageCanvasUtil.convertToCanvas(this);
                  ImageCanvasUtil.convertToCanvas(param1);
                  ImageCanvasUtil.copyPixels(this,param1,param2,param3,param4,param5,param6);
               }
               break;
            case 1:
               ImageDataUtil.copyPixels(this,param1,param2,param3,param4,param5,param6);
               break;
            case 2:
               param2.offset(param1.offsetX,param1.offsetY);
               param3.offset(offsetX,offsetY);
               if(param4 != null && param5 != null)
               {
                  param5.offset(param4.offsetX,param4.offsetY);
               }
               buffer.__srcBitmapData.copyPixels(param1.buffer.__srcBitmapData,param2.__toFlashRectangle(),param3.__toFlashPoint(),param4 != null ? param4.buffer.get_src() : null,param5 != null ? param5.__toFlashPoint() : null,param6);
         }
      }
      
      public function copyChannel(param1:Image, param2:lime.math.Rectangle, param3:Vector2, param4:ImageChannel, param5:ImageChannel) : void
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         param2 = __clipRect(param2);
         if(buffer == null || param2 == null)
         {
            return;
         }
         if(param5 == ImageChannel.ALPHA && !get_transparent())
         {
            return;
         }
         if(param2.width <= 0 || param2.height <= 0)
         {
            return;
         }
         if(param2.x + param2.width > param1.width)
         {
            param2.width = param1.width - param2.x;
         }
         if(param2.y + param2.height > param1.height)
         {
            param2.height = param1.height - param2.y;
         }
         switch(type.index)
         {
            case 0:
               ImageCanvasUtil.copyChannel(this,param1,param2,param3,param4,param5);
               break;
            case 1:
               ImageDataUtil.copyChannel(this,param1,param2,param3,param4,param5);
               break;
            case 2:
               switch(param4.index)
               {
                  case 0:
                     _loc6_ = 1;
                     break;
                  case 1:
                     _loc6_ = 2;
                     break;
                  case 2:
                     _loc6_ = 4;
                     break;
                  case 3:
                     _loc6_ = 8;
               }
               switch(param5.index)
               {
                  case 0:
                     _loc7_ = 1;
                     break;
                  case 1:
                     _loc7_ = 2;
                     break;
                  case 2:
                     _loc7_ = 4;
                     break;
                  case 3:
                     _loc7_ = 8;
               }
               param2.offset(param1.offsetX,param1.offsetY);
               param3.offset(offsetX,offsetY);
               buffer.__srcBitmapData.copyChannel(param1.buffer.get_src(),param2.__toFlashRectangle(),param3.__toFlashPoint(),_loc6_,_loc7_);
         }
      }
      
      public function colorTransform(param1:lime.math.Rectangle, param2:ArrayBufferView) : void
      {
         param1 = __clipRect(param1);
         if(buffer == null || param1 == null)
         {
            return;
         }
         switch(type.index)
         {
            case 0:
               ImageCanvasUtil.colorTransform(this,param1,param2);
               break;
            case 1:
               ImageDataUtil.colorTransform(this,param1,param2);
               break;
            case 2:
               param1.offset(offsetX,offsetY);
               buffer.__srcBitmapData.colorTransform(param1.__toFlashRectangle(),ColorMatrix_Impl_.__toFlashColorTransform(param2));
         }
      }
      
      public function clone() : Image
      {
         var _loc1_:* = null as Image;
         if(buffer != null)
         {
            _loc1_ = new Image(buffer.clone(),offsetX,offsetY,width,height,null,type);
            _loc1_.version = version;
            return _loc1_;
         }
         return new Image(null,offsetX,offsetY,width,height,null,type);
      }
      
      public function __fromImageBuffer(param1:ImageBuffer) : void
      {
         buffer = param1;
         if(param1 != null)
         {
            if(width == -1)
            {
               width = param1.width;
            }
            if(height == -1)
            {
               height = param1.height;
            }
         }
      }
      
      public function __fromFile(param1:String, param2:Object = undefined, param3:Object = undefined) : Boolean
      {
         Log.warn("Image.fromFile not supported on this target",{
            "fileName":"lime/graphics/Image.hx",
            "lineNumber":1629,
            "className":"lime.graphics.Image",
            "methodName":"__fromFile"
         });
         return false;
      }
      
      public function __fromBytes(param1:Bytes, param2:Object = undefined) : Boolean
      {
         Log.warn("Image.fromBytes not supported on this target",{
            "fileName":"lime/graphics/Image.hx",
            "lineNumber":1516,
            "className":"lime.graphics.Image",
            "methodName":"__fromBytes"
         });
         return false;
      }
      
      public function __fromBase64(param1:String, param2:String, param3:Object = undefined) : void
      {
         if(param1 != null)
         {
            __fromBytes(Base64.decode(param1));
         }
      }
      
      public function __clipRect(param1:lime.math.Rectangle) : lime.math.Rectangle
      {
         if(param1 == null)
         {
            return null;
         }
         if(param1.x < 0)
         {
            param1.width -= -param1.x;
            param1.x = 0;
            if(param1.x + param1.width <= 0)
            {
               return null;
            }
         }
         if(param1.y < 0)
         {
            param1.height -= -param1.y;
            param1.y = 0;
            if(param1.y + param1.height <= 0)
            {
               return null;
            }
         }
         if(param1.x + param1.width >= width)
         {
            param1.width -= param1.x + param1.width - width;
            if(param1.width <= 0)
            {
               return null;
            }
         }
         if(param1.y + param1.height >= height)
         {
            param1.height -= param1.y + param1.height - height;
            if(param1.height <= 0)
            {
               return null;
            }
         }
         return param1;
      }
   }
}

