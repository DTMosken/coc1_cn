package lime._internal.graphics
{
   import haxe.io.Bytes;
   import lime.graphics.Image;
   import lime.graphics.ImageBuffer;
   import lime.graphics.ImageChannel;
   import lime.graphics.ImageType;
   import lime.math.Rectangle;
   import lime.math.Vector2;
   import lime.system.Endian;
   import lime.utils.ArrayBufferView;
   import lime.utils.BytePointerData;
   
   public class ImageCanvasUtil
   {
      
      public function ImageCanvasUtil()
      {
      }
      
      public static function colorTransform(param1:Image, param2:Rectangle, param3:ArrayBufferView) : void
      {
         ImageCanvasUtil.convertToData(param1);
         ImageDataUtil.colorTransform(param1,param2,param3);
      }
      
      public static function convertToCanvas(param1:Image, param2:Boolean = false) : void
      {
         param1.type = ImageType.CANVAS;
      }
      
      public static function convertToData(param1:Image, param2:Boolean = false) : void
      {
         var _loc3_:ImageBuffer = param1.buffer;
         param1.type = ImageType.DATA;
      }
      
      public static function copyChannel(param1:Image, param2:Image, param3:Rectangle, param4:Vector2, param5:ImageChannel, param6:ImageChannel) : void
      {
         ImageCanvasUtil.convertToData(param2);
         ImageCanvasUtil.convertToData(param1);
         ImageDataUtil.copyChannel(param1,param2,param3,param4,param5,param6);
      }
      
      public static function copyPixels(param1:Image, param2:Image, param3:Rectangle, param4:Vector2, param5:Image = undefined, param6:Vector2 = undefined, param7:Boolean = false) : void
      {
         var _loc8_:* = null as Image;
         if(param4 == null || param4.x >= param1.width || param4.y >= param1.height || param3 == null || param3.width < 1 || param3.height < 1)
         {
            return;
         }
         if(param5 != null && param5.get_transparent())
         {
            if(param6 == null)
            {
               param6 = new Vector2();
            }
            _loc8_ = param2.clone();
            _loc8_.copyChannel(param5,new Rectangle(param3.x + param6.x,param3.y + param6.y,param3.width,param3.height),new Vector2(param3.x,param3.y),ImageChannel.ALPHA,ImageChannel.ALPHA);
            param2 = _loc8_;
         }
         ImageCanvasUtil.convertToCanvas(param1,true);
         if(!param7)
         {
            if(param1.get_transparent() && param2.get_transparent())
            {
               param1.buffer.__srcContext.clearRect(param4.x + param1.offsetX,param4.y + param1.offsetY,param3.width + param1.offsetX,param3.height + param1.offsetY);
            }
         }
         ImageCanvasUtil.convertToCanvas(param2);
         if(param2.buffer.get_src() != null)
         {
            param1.buffer.__srcContext.globalCompositeOperation = "source-over";
            param1.buffer.__srcContext.drawImage(param2.buffer.get_src(),int(param3.x + param2.offsetX),int(param3.y + param2.offsetY),int(param3.width),int(param3.height),int(param4.x + param1.offsetX),int(param4.y + param1.offsetY),int(param3.width),int(param3.height));
         }
         param1.dirty = true;
         ++param1.version;
      }
      
      public static function createCanvas(param1:Image, param2:int, param3:int) : void
      {
      }
      
      public static function createImageData(param1:Image) : void
      {
      }
      
      public static function fillRect(param1:Image, param2:Rectangle, param3:int, param4:int) : void
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         ImageCanvasUtil.convertToCanvas(param1);
         if(param4 == 1)
         {
            _loc5_ = param3 >> 16 & 0xFF;
            _loc6_ = param3 >> 8 & 0xFF;
            _loc7_ = param3 & 0xFF;
            _loc8_ = param1.get_transparent() ? param3 >> 24 & 0xFF : 255;
         }
         else
         {
            _loc5_ = param3 >> 24 & 0xFF;
            _loc6_ = param3 >> 16 & 0xFF;
            _loc7_ = param3 >> 8 & 0xFF;
            _loc8_ = param1.get_transparent() ? param3 & 0xFF : 255;
         }
         if(param2.x == 0 && param2.y == 0 && param2.width == param1.width && param2.height == param1.height)
         {
            if(param1.get_transparent() && _loc8_ == 0)
            {
               param1.buffer.__srcCanvas.width = param1.buffer.width;
               return;
            }
         }
         if(_loc8_ < 255)
         {
            param1.buffer.__srcContext.clearRect(param2.x + param1.offsetX,param2.y + param1.offsetY,param2.width + param1.offsetX,param2.height + param1.offsetY);
         }
         if(_loc8_ > 0)
         {
            param1.buffer.__srcContext.fillStyle = "rgba(" + _loc5_ + ", " + _loc6_ + ", " + _loc7_ + ", " + _loc8_ / 255 + ")";
            param1.buffer.__srcContext.fillRect(param2.x + param1.offsetX,param2.y + param1.offsetY,param2.width + param1.offsetX,param2.height + param1.offsetY);
         }
         param1.dirty = true;
         ++param1.version;
      }
      
      public static function floodFill(param1:Image, param2:int, param3:int, param4:int, param5:int) : void
      {
         ImageCanvasUtil.convertToData(param1);
         ImageDataUtil.floodFill(param1,param2,param3,param4,param5);
      }
      
      public static function getPixel(param1:Image, param2:int, param3:int, param4:int) : int
      {
         ImageCanvasUtil.convertToData(param1);
         return ImageDataUtil.getPixel(param1,param2,param3,param4);
      }
      
      public static function getPixel32(param1:Image, param2:int, param3:int, param4:int) : int
      {
         ImageCanvasUtil.convertToData(param1);
         return ImageDataUtil.getPixel32(param1,param2,param3,param4);
      }
      
      public static function getPixels(param1:Image, param2:Rectangle, param3:int) : Bytes
      {
         ImageCanvasUtil.convertToData(param1);
         return ImageDataUtil.getPixels(param1,param2,param3);
      }
      
      public static function merge(param1:Image, param2:Image, param3:Rectangle, param4:Vector2, param5:int, param6:int, param7:int, param8:int) : void
      {
         ImageCanvasUtil.convertToData(param2);
         ImageCanvasUtil.convertToData(param1);
         ImageDataUtil.merge(param1,param2,param3,param4,param5,param6,param7,param8);
      }
      
      public static function resize(param1:Image, param2:int, param3:int) : void
      {
         var _loc5_:* = null;
         var _loc4_:ImageBuffer = param1.buffer;
         if(_loc4_.__srcCanvas == null)
         {
            ImageCanvasUtil.createCanvas(param1,param2,param3);
            _loc4_.__srcContext.drawImage(_loc4_.get_src(),0,0,param2,param3);
         }
         else
         {
            ImageCanvasUtil.convertToCanvas(param1,true);
            _loc5_ = _loc4_.__srcCanvas;
            _loc4_.__srcCanvas = null;
            ImageCanvasUtil.createCanvas(param1,param2,param3);
            _loc4_.__srcContext.drawImage(_loc5_,0,0,param2,param3);
         }
         _loc4_.__srcImageData = null;
         _loc4_.data = null;
         param1.dirty = true;
         ++param1.version;
      }
      
      public static function scroll(param1:Image, param2:int, param3:int) : void
      {
         if(int(param2 % param1.width) == 0 && int(param3 % param1.height) == 0)
         {
            return;
         }
         var _loc4_:Image = param1.clone();
         ImageCanvasUtil.convertToCanvas(param1,true);
         param1.buffer.__srcContext.clearRect(param2,param3,param1.width,param1.height);
         param1.buffer.__srcContext.drawImage(_loc4_.get_src(),param2,param3);
         param1.dirty = true;
         ++param1.version;
      }
      
      public static function setPixel(param1:Image, param2:int, param3:int, param4:int, param5:int) : void
      {
         ImageCanvasUtil.convertToData(param1);
         ImageDataUtil.setPixel(param1,param2,param3,param4,param5);
      }
      
      public static function setPixel32(param1:Image, param2:int, param3:int, param4:int, param5:int) : void
      {
         ImageCanvasUtil.convertToData(param1);
         ImageDataUtil.setPixel32(param1,param2,param3,param4,param5);
      }
      
      public static function setPixels(param1:Image, param2:Rectangle, param3:BytePointerData, param4:int, param5:Endian) : void
      {
         ImageCanvasUtil.convertToData(param1);
         ImageDataUtil.setPixels(param1,param2,param3,param4,param5);
      }
      
      public static function sync(param1:Image, param2:Boolean) : void
      {
         if(param1 == null)
         {
            return;
         }
      }
   }
}

