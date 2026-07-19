package lime.graphics
{
   import flash.Boot;
   import flash.display.BitmapData;
   import lime.utils.ArrayBufferView;
   
   public class ImageBuffer
   {
      
      public var width:int;
      
      public var transparent:Boolean;
      
      public var premultiplied:Boolean;
      
      public var height:int;
      
      public var format:int;
      
      public var data:ArrayBufferView;
      
      public var bitsPerPixel:int;
      
      public var __srcImageData:*;
      
      public var __srcImage:*;
      
      public var __srcCustom:*;
      
      public var __srcContext:*;
      
      public var __srcCanvas:*;
      
      public var __srcBitmapData:BitmapData;
      
      public function ImageBuffer(param1:ArrayBufferView = undefined, param2:int = 0, param3:int = 0, param4:int = 32, param5:Object = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         data = param1;
         width = param2;
         height = param3;
         bitsPerPixel = param4;
         format = param5 == null ? 0 : int(param5);
         premultiplied = false;
         transparent = true;
      }
      
      public function set_src(param1:*) : *
      {
         __srcBitmapData = param1;
         return param1;
      }
      
      public function get_stride() : int
      {
         return width * (int(bitsPerPixel / 8));
      }
      
      public function get_src() : *
      {
         return __srcBitmapData;
      }
      
      public function clone() : ImageBuffer
      {
         var _loc1_:ImageBuffer = new ImageBuffer(data,width,height,bitsPerPixel);
         if(__srcBitmapData != null)
         {
            _loc1_.__srcBitmapData = __srcBitmapData.clone();
         }
         _loc1_.bitsPerPixel = bitsPerPixel;
         _loc1_.format = format;
         _loc1_.premultiplied = premultiplied;
         _loc1_.transparent = transparent;
         return _loc1_;
      }
   }
}

