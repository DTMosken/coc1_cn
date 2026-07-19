package lime._internal.graphics._ImageDataUtil
{
   import flash.Boot;
   import lime.graphics.Image;
   import lime.math.Rectangle;
   
   public class ImageDataView
   {
      
      public var y:int;
      
      public var x:int;
      
      public var width:int;
      
      public var tempRect:Rectangle;
      
      public var stride:int;
      
      public var rect:Rectangle;
      
      public var image:Image;
      
      public var height:int;
      
      public var byteOffset:int;
      
      public function ImageDataView(param1:Image = undefined, param2:Rectangle = undefined)
      {
         if(Boot.skip_constructor)
         {
            return;
         }
         image = param1;
         if(param2 == null)
         {
            rect = param1.get_rect();
         }
         else
         {
            if(param2.x < 0)
            {
               param2.x = 0;
            }
            if(param2.y < 0)
            {
               param2.y = 0;
            }
            if(param2.x + param2.width > param1.width)
            {
               param2.width = param1.width - param2.x;
            }
            if(param2.y + param2.height > param1.height)
            {
               param2.height = param1.height - param2.y;
            }
            if(param2.width < 0)
            {
               param2.width = 0;
            }
            if(param2.height < 0)
            {
               param2.height = 0;
            }
            rect = param2;
         }
         stride = param1.buffer.get_stride();
         __update();
      }
      
      public function row(param1:int) : int
      {
         return byteOffset + stride * param1;
      }
      
      public function offset(param1:int, param2:int) : void
      {
         if(param1 < 0)
         {
            _temp_1.x += param1;
            if(rect.x < 0)
            {
               rect.x = 0;
            }
         }
         else
         {
            _temp_2.x += param1;
            _temp_3.width -= param1;
         }
         if(param2 < 0)
         {
            _temp_4.y += param2;
            if(rect.y < 0)
            {
               rect.y = 0;
            }
         }
         else
         {
            _temp_5.y += param2;
            _temp_6.height -= param2;
         }
         __update();
      }
      
      public function hasRow(param1:int) : Boolean
      {
         if(param1 >= 0)
         {
            return param1 < height;
         }
         return false;
      }
      
      public function clip(param1:int, param2:int, param3:int, param4:int) : void
      {
         if(tempRect == null)
         {
            tempRect = new Rectangle();
         }
         tempRect.setTo(param1,param2,param3,param4);
         rect.intersection(tempRect,rect);
         __update();
      }
      
      public function __update() : void
      {
         x = int(Math.ceil(rect.x));
         y = int(Math.ceil(rect.y));
         width = int(Math.floor(rect.width));
         height = int(Math.floor(rect.height));
         byteOffset = stride * (y + image.offsetY) + (x + image.offsetX) * 4;
      }
   }
}

