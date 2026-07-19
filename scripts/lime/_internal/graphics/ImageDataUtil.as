package lime._internal.graphics
{
   import haxe.Exception;
   import haxe.io.Bytes;
   import lime._internal.graphics._ImageDataUtil.ImageDataView;
   import lime.graphics.Image;
   import lime.graphics.ImageBuffer;
   import lime.graphics.ImageChannel;
   import lime.math.Rectangle;
   import lime.math.Vector2;
   import lime.math.Vector4;
   import lime.math._ColorMatrix.ColorMatrix_Impl_;
   import lime.math._RGBA.RGBA_Impl_;
   import lime.system.Endian;
   import lime.utils.ArrayBufferView;
   import lime.utils.BytePointerData;
   import lime.utils.TAError;
   
   public class ImageDataUtil
   {
      
      public function ImageDataUtil()
      {
      }
      
      public static function displaceMap(param1:Image, param2:Image, param3:Image, param4:Vector2, param5:Vector4, param6:Vector4, param7:Boolean) : void
      {
         var _loc19_:int = 0;
         var _loc20_:int = 0;
         var _loc24_:Number = NaN;
         var _loc25_:Number = NaN;
         var _loc26_:Number = NaN;
         var _loc31_:int = 0;
         var _loc32_:int = 0;
         var _loc33_:int = 0;
         var _loc34_:int = 0;
         var _loc35_:Number = NaN;
         var _loc36_:Number = NaN;
         var _loc39_:int = 0;
         var _loc40_:int = 0;
         var _loc41_:int = 0;
         var _loc42_:int = 0;
         var _loc43_:int = 0;
         var _loc44_:* = null as ArrayBufferView;
         var _loc45_:* = null as ArrayBufferView;
         var _loc46_:* = null as ArrayBufferView;
         var _loc47_:* = null as Bytes;
         var _loc48_:int = 0;
         var _loc49_:int = 0;
         var _loc50_:int = 0;
         var _loc51_:int = 0;
         var _loc52_:uint = 0;
         var _loc8_:ArrayBufferView = param1.buffer.data;
         var _loc9_:ArrayBufferView = param2.buffer.data;
         var _loc10_:ArrayBufferView = param3.buffer.data;
         var _loc11_:int = param1.buffer.format;
         var _loc12_:int = param2.buffer.format;
         var _loc13_:int = param3.buffer.format;
         var _loc14_:Boolean = param1.get_premultiplied();
         var _loc15_:Boolean = param2.get_premultiplied();
         var _loc16_:Boolean = param3.get_premultiplied();
         var _loc17_:ImageDataView = new ImageDataView(param2);
         var _loc18_:ImageDataView = new ImageDataView(param3);
         var _loc21_:int = 0;
         var _loc22_:int = 0;
         var _loc23_:int = 0;
         var _loc27_:int = 0;
         var _loc28_:int = 0;
         var _loc29_:int = 0;
         var _loc30_:int = 0;
         var _loc37_:int = 0;
         var _loc38_:int = _loc17_.height;
         while(_loc37_ < _loc38_)
         {
            _loc39_ = _loc37_++;
            _loc19_ = _loc17_.byteOffset + _loc17_.stride * _loc39_;
            _loc40_ = 0;
            _loc41_ = _loc17_.width;
            while(_loc40_ < _loc41_)
            {
               _loc42_ = _loc40_++;
               _loc20_ = _loc19_ + _loc42_ * 4;
               _loc31_ = int(param4.x);
               _loc32_ = int(param4.y);
               if(param7)
               {
                  _loc43_ = _loc17_.byteOffset + _loc17_.stride * (_loc39_ - _loc32_ + 1) + (_loc42_ - _loc31_) * 4;
                  switch(_loc13_)
                  {
                     case 0:
                        _loc27_ = (int(int(_loc10_.buffer.b[_loc10_.byteOffset + _loc43_])) & 0xFF) << 24 | (int(int(_loc10_.buffer.b[_loc10_.byteOffset + (_loc43_ + 1)])) & 0xFF) << 16 | (int(int(_loc10_.buffer.b[_loc10_.byteOffset + (_loc43_ + 2)])) & 0xFF) << 8 | int(int(_loc10_.buffer.b[_loc10_.byteOffset + (_loc43_ + 3)])) & 0xFF;
                        break;
                     case 1:
                        _loc27_ = (int(int(_loc10_.buffer.b[_loc10_.byteOffset + (_loc43_ + 1)])) & 0xFF) << 24 | (int(int(_loc10_.buffer.b[_loc10_.byteOffset + (_loc43_ + 2)])) & 0xFF) << 16 | (int(int(_loc10_.buffer.b[_loc10_.byteOffset + (_loc43_ + 3)])) & 0xFF) << 8 | int(int(_loc10_.buffer.b[_loc10_.byteOffset + _loc43_])) & 0xFF;
                        break;
                     case 2:
                        _loc27_ = (int(int(_loc10_.buffer.b[_loc10_.byteOffset + (_loc43_ + 2)])) & 0xFF) << 24 | (int(int(_loc10_.buffer.b[_loc10_.byteOffset + (_loc43_ + 1)])) & 0xFF) << 16 | (int(int(_loc10_.buffer.b[_loc10_.byteOffset + _loc43_])) & 0xFF) << 8 | int(int(_loc10_.buffer.b[_loc10_.byteOffset + (_loc43_ + 3)])) & 0xFF;
                  }
                  if(_loc16_)
                  {
                     if((_loc27_ & 0xFF) != 0 && (_loc27_ & 0xFF) != 255)
                     {
                        RGBA_Impl_.unmult = 255 / (_loc27_ & 0xFF);
                        _loc44_ = RGBA_Impl_.__clamp;
                        _loc45_ = RGBA_Impl_.__clamp;
                        _loc46_ = RGBA_Impl_.__clamp;
                        _loc27_ = (int(int(_loc44_.buffer.b[_loc44_.byteOffset + int(Math.round((_loc27_ >> 24 & 0xFF) * RGBA_Impl_.unmult))])) & 0xFF) << 24 | (int(int(_loc45_.buffer.b[_loc45_.byteOffset + int(Math.round((_loc27_ >> 16 & 0xFF) * RGBA_Impl_.unmult))])) & 0xFF) << 16 | (int(int(_loc46_.buffer.b[_loc46_.byteOffset + int(Math.round((_loc27_ >> 8 & 0xFF) * RGBA_Impl_.unmult))])) & 0xFF) << 8 | _loc27_ & 0xFF & 0xFF;
                     }
                  }
                  _loc43_ = _loc17_.byteOffset + _loc17_.stride * (_loc39_ - _loc32_) + (_loc42_ - _loc31_ + 1) * 4;
                  switch(_loc13_)
                  {
                     case 0:
                        _loc28_ = (int(int(_loc10_.buffer.b[_loc10_.byteOffset + _loc43_])) & 0xFF) << 24 | (int(int(_loc10_.buffer.b[_loc10_.byteOffset + (_loc43_ + 1)])) & 0xFF) << 16 | (int(int(_loc10_.buffer.b[_loc10_.byteOffset + (_loc43_ + 2)])) & 0xFF) << 8 | int(int(_loc10_.buffer.b[_loc10_.byteOffset + (_loc43_ + 3)])) & 0xFF;
                        break;
                     case 1:
                        _loc28_ = (int(int(_loc10_.buffer.b[_loc10_.byteOffset + (_loc43_ + 1)])) & 0xFF) << 24 | (int(int(_loc10_.buffer.b[_loc10_.byteOffset + (_loc43_ + 2)])) & 0xFF) << 16 | (int(int(_loc10_.buffer.b[_loc10_.byteOffset + (_loc43_ + 3)])) & 0xFF) << 8 | int(int(_loc10_.buffer.b[_loc10_.byteOffset + _loc43_])) & 0xFF;
                        break;
                     case 2:
                        _loc28_ = (int(int(_loc10_.buffer.b[_loc10_.byteOffset + (_loc43_ + 2)])) & 0xFF) << 24 | (int(int(_loc10_.buffer.b[_loc10_.byteOffset + (_loc43_ + 1)])) & 0xFF) << 16 | (int(int(_loc10_.buffer.b[_loc10_.byteOffset + _loc43_])) & 0xFF) << 8 | int(int(_loc10_.buffer.b[_loc10_.byteOffset + (_loc43_ + 3)])) & 0xFF;
                  }
                  if(_loc16_)
                  {
                     if((_loc28_ & 0xFF) != 0 && (_loc28_ & 0xFF) != 255)
                     {
                        RGBA_Impl_.unmult = 255 / (_loc28_ & 0xFF);
                        _loc44_ = RGBA_Impl_.__clamp;
                        _loc45_ = RGBA_Impl_.__clamp;
                        _loc46_ = RGBA_Impl_.__clamp;
                        _loc28_ = (int(int(_loc44_.buffer.b[_loc44_.byteOffset + int(Math.round((_loc28_ >> 24 & 0xFF) * RGBA_Impl_.unmult))])) & 0xFF) << 24 | (int(int(_loc45_.buffer.b[_loc45_.byteOffset + int(Math.round((_loc28_ >> 16 & 0xFF) * RGBA_Impl_.unmult))])) & 0xFF) << 16 | (int(int(_loc46_.buffer.b[_loc46_.byteOffset + int(Math.round((_loc28_ >> 8 & 0xFF) * RGBA_Impl_.unmult))])) & 0xFF) << 8 | _loc28_ & 0xFF & 0xFF;
                     }
                  }
                  _loc43_ = _loc17_.byteOffset + _loc17_.stride * (_loc39_ - _loc32_ + 1) + (_loc42_ - _loc31_ + 1) * 4;
                  switch(_loc13_)
                  {
                     case 0:
                        _loc29_ = (int(int(_loc10_.buffer.b[_loc10_.byteOffset + _loc43_])) & 0xFF) << 24 | (int(int(_loc10_.buffer.b[_loc10_.byteOffset + (_loc43_ + 1)])) & 0xFF) << 16 | (int(int(_loc10_.buffer.b[_loc10_.byteOffset + (_loc43_ + 2)])) & 0xFF) << 8 | int(int(_loc10_.buffer.b[_loc10_.byteOffset + (_loc43_ + 3)])) & 0xFF;
                        break;
                     case 1:
                        _loc29_ = (int(int(_loc10_.buffer.b[_loc10_.byteOffset + (_loc43_ + 1)])) & 0xFF) << 24 | (int(int(_loc10_.buffer.b[_loc10_.byteOffset + (_loc43_ + 2)])) & 0xFF) << 16 | (int(int(_loc10_.buffer.b[_loc10_.byteOffset + (_loc43_ + 3)])) & 0xFF) << 8 | int(int(_loc10_.buffer.b[_loc10_.byteOffset + _loc43_])) & 0xFF;
                        break;
                     case 2:
                        _loc29_ = (int(int(_loc10_.buffer.b[_loc10_.byteOffset + (_loc43_ + 2)])) & 0xFF) << 24 | (int(int(_loc10_.buffer.b[_loc10_.byteOffset + (_loc43_ + 1)])) & 0xFF) << 16 | (int(int(_loc10_.buffer.b[_loc10_.byteOffset + _loc43_])) & 0xFF) << 8 | int(int(_loc10_.buffer.b[_loc10_.byteOffset + (_loc43_ + 3)])) & 0xFF;
                  }
                  if(_loc16_)
                  {
                     if((_loc29_ & 0xFF) != 0 && (_loc29_ & 0xFF) != 255)
                     {
                        RGBA_Impl_.unmult = 255 / (_loc29_ & 0xFF);
                        _loc44_ = RGBA_Impl_.__clamp;
                        _loc45_ = RGBA_Impl_.__clamp;
                        _loc46_ = RGBA_Impl_.__clamp;
                        _loc29_ = (int(int(_loc44_.buffer.b[_loc44_.byteOffset + int(Math.round((_loc29_ >> 24 & 0xFF) * RGBA_Impl_.unmult))])) & 0xFF) << 24 | (int(int(_loc45_.buffer.b[_loc45_.byteOffset + int(Math.round((_loc29_ >> 16 & 0xFF) * RGBA_Impl_.unmult))])) & 0xFF) << 16 | (int(int(_loc46_.buffer.b[_loc46_.byteOffset + int(Math.round((_loc29_ >> 8 & 0xFF) * RGBA_Impl_.unmult))])) & 0xFF) << 8 | _loc29_ & 0xFF & 0xFF;
                     }
                  }
                  _loc43_ = _loc17_.byteOffset + _loc17_.stride * (_loc39_ - _loc32_) + (_loc42_ - _loc31_) * 4;
                  switch(_loc13_)
                  {
                     case 0:
                        _loc30_ = (int(int(_loc10_.buffer.b[_loc10_.byteOffset + _loc43_])) & 0xFF) << 24 | (int(int(_loc10_.buffer.b[_loc10_.byteOffset + (_loc43_ + 1)])) & 0xFF) << 16 | (int(int(_loc10_.buffer.b[_loc10_.byteOffset + (_loc43_ + 2)])) & 0xFF) << 8 | int(int(_loc10_.buffer.b[_loc10_.byteOffset + (_loc43_ + 3)])) & 0xFF;
                        break;
                     case 1:
                        _loc30_ = (int(int(_loc10_.buffer.b[_loc10_.byteOffset + (_loc43_ + 1)])) & 0xFF) << 24 | (int(int(_loc10_.buffer.b[_loc10_.byteOffset + (_loc43_ + 2)])) & 0xFF) << 16 | (int(int(_loc10_.buffer.b[_loc10_.byteOffset + (_loc43_ + 3)])) & 0xFF) << 8 | int(int(_loc10_.buffer.b[_loc10_.byteOffset + _loc43_])) & 0xFF;
                        break;
                     case 2:
                        _loc30_ = (int(int(_loc10_.buffer.b[_loc10_.byteOffset + (_loc43_ + 2)])) & 0xFF) << 24 | (int(int(_loc10_.buffer.b[_loc10_.byteOffset + (_loc43_ + 1)])) & 0xFF) << 16 | (int(int(_loc10_.buffer.b[_loc10_.byteOffset + _loc43_])) & 0xFF) << 8 | int(int(_loc10_.buffer.b[_loc10_.byteOffset + (_loc43_ + 3)])) & 0xFF;
                  }
                  if(_loc16_)
                  {
                     if((_loc30_ & 0xFF) != 0 && (_loc30_ & 0xFF) != 255)
                     {
                        RGBA_Impl_.unmult = 255 / (_loc30_ & 0xFF);
                        _loc44_ = RGBA_Impl_.__clamp;
                        _loc45_ = RGBA_Impl_.__clamp;
                        _loc46_ = RGBA_Impl_.__clamp;
                        _loc30_ = (int(int(_loc44_.buffer.b[_loc44_.byteOffset + int(Math.round((_loc30_ >> 24 & 0xFF) * RGBA_Impl_.unmult))])) & 0xFF) << 24 | (int(int(_loc45_.buffer.b[_loc45_.byteOffset + int(Math.round((_loc30_ >> 16 & 0xFF) * RGBA_Impl_.unmult))])) & 0xFF) << 16 | (int(int(_loc46_.buffer.b[_loc46_.byteOffset + int(Math.round((_loc30_ >> 8 & 0xFF) * RGBA_Impl_.unmult))])) & 0xFF) << 8 | _loc30_ & 0xFF & 0xFF;
                     }
                  }
                  _loc22_ = ImageDataUtil.bilinear(_loc27_,_loc28_,_loc29_,_loc30_,param4.x - _loc31_,param4.y - _loc32_);
               }
               else
               {
                  _loc43_ = _loc18_.byteOffset + _loc18_.stride * (_loc39_ - _loc32_) + (_loc42_ - _loc31_) * 4;
                  switch(_loc13_)
                  {
                     case 0:
                        _loc22_ = (int(int(_loc10_.buffer.b[_loc10_.byteOffset + _loc43_])) & 0xFF) << 24 | (int(int(_loc10_.buffer.b[_loc10_.byteOffset + (_loc43_ + 1)])) & 0xFF) << 16 | (int(int(_loc10_.buffer.b[_loc10_.byteOffset + (_loc43_ + 2)])) & 0xFF) << 8 | int(int(_loc10_.buffer.b[_loc10_.byteOffset + (_loc43_ + 3)])) & 0xFF;
                        break;
                     case 1:
                        _loc22_ = (int(int(_loc10_.buffer.b[_loc10_.byteOffset + (_loc43_ + 1)])) & 0xFF) << 24 | (int(int(_loc10_.buffer.b[_loc10_.byteOffset + (_loc43_ + 2)])) & 0xFF) << 16 | (int(int(_loc10_.buffer.b[_loc10_.byteOffset + (_loc43_ + 3)])) & 0xFF) << 8 | int(int(_loc10_.buffer.b[_loc10_.byteOffset + _loc43_])) & 0xFF;
                        break;
                     case 2:
                        _loc22_ = (int(int(_loc10_.buffer.b[_loc10_.byteOffset + (_loc43_ + 2)])) & 0xFF) << 24 | (int(int(_loc10_.buffer.b[_loc10_.byteOffset + (_loc43_ + 1)])) & 0xFF) << 16 | (int(int(_loc10_.buffer.b[_loc10_.byteOffset + _loc43_])) & 0xFF) << 8 | int(int(_loc10_.buffer.b[_loc10_.byteOffset + (_loc43_ + 3)])) & 0xFF;
                  }
                  if(_loc16_)
                  {
                     if((_loc22_ & 0xFF) != 0 && (_loc22_ & 0xFF) != 255)
                     {
                        RGBA_Impl_.unmult = 255 / (_loc22_ & 0xFF);
                        _loc44_ = RGBA_Impl_.__clamp;
                        _loc45_ = RGBA_Impl_.__clamp;
                        _loc46_ = RGBA_Impl_.__clamp;
                        _loc22_ = (int(int(_loc44_.buffer.b[_loc44_.byteOffset + int(Math.round((_loc22_ >> 24 & 0xFF) * RGBA_Impl_.unmult))])) & 0xFF) << 24 | (int(int(_loc45_.buffer.b[_loc45_.byteOffset + int(Math.round((_loc22_ >> 16 & 0xFF) * RGBA_Impl_.unmult))])) & 0xFF) << 16 | (int(int(_loc46_.buffer.b[_loc46_.byteOffset + int(Math.round((_loc22_ >> 8 & 0xFF) * RGBA_Impl_.unmult))])) & 0xFF) << 8 | _loc22_ & 0xFF & 0xFF;
                     }
                  }
               }
               _loc26_ = (_loc22_ & 0xFF) / 255;
               _loc24_ = ((_loc22_ >> 24 & 0xFF) - 128) / 255 * _loc26_;
               _loc25_ = ((_loc22_ >> 16 & 0xFF) - 128) / 255 * _loc26_;
               _loc35_ = _loc24_ * param5.x + _loc25_ * param6.x;
               _loc36_ = _loc24_ * param5.y + _loc25_ * param6.y;
               _loc33_ = int(Math.floor(_loc35_ * _loc17_.width));
               _loc34_ = int(Math.floor(_loc36_ * _loc17_.height));
               if(param7)
               {
                  _loc43_ = _loc17_.byteOffset + _loc17_.stride * (_loc39_ + _loc34_ + 1) + (_loc42_ + _loc33_) * 4;
                  switch(_loc12_)
                  {
                     case 0:
                        _loc27_ = (int(int(_loc9_.buffer.b[_loc9_.byteOffset + _loc43_])) & 0xFF) << 24 | (int(int(_loc9_.buffer.b[_loc9_.byteOffset + (_loc43_ + 1)])) & 0xFF) << 16 | (int(int(_loc9_.buffer.b[_loc9_.byteOffset + (_loc43_ + 2)])) & 0xFF) << 8 | int(int(_loc9_.buffer.b[_loc9_.byteOffset + (_loc43_ + 3)])) & 0xFF;
                        break;
                     case 1:
                        _loc27_ = (int(int(_loc9_.buffer.b[_loc9_.byteOffset + (_loc43_ + 1)])) & 0xFF) << 24 | (int(int(_loc9_.buffer.b[_loc9_.byteOffset + (_loc43_ + 2)])) & 0xFF) << 16 | (int(int(_loc9_.buffer.b[_loc9_.byteOffset + (_loc43_ + 3)])) & 0xFF) << 8 | int(int(_loc9_.buffer.b[_loc9_.byteOffset + _loc43_])) & 0xFF;
                        break;
                     case 2:
                        _loc27_ = (int(int(_loc9_.buffer.b[_loc9_.byteOffset + (_loc43_ + 2)])) & 0xFF) << 24 | (int(int(_loc9_.buffer.b[_loc9_.byteOffset + (_loc43_ + 1)])) & 0xFF) << 16 | (int(int(_loc9_.buffer.b[_loc9_.byteOffset + _loc43_])) & 0xFF) << 8 | int(int(_loc9_.buffer.b[_loc9_.byteOffset + (_loc43_ + 3)])) & 0xFF;
                  }
                  if(_loc15_)
                  {
                     if((_loc27_ & 0xFF) != 0 && (_loc27_ & 0xFF) != 255)
                     {
                        RGBA_Impl_.unmult = 255 / (_loc27_ & 0xFF);
                        _loc44_ = RGBA_Impl_.__clamp;
                        _loc45_ = RGBA_Impl_.__clamp;
                        _loc46_ = RGBA_Impl_.__clamp;
                        _loc27_ = (int(int(_loc44_.buffer.b[_loc44_.byteOffset + int(Math.round((_loc27_ >> 24 & 0xFF) * RGBA_Impl_.unmult))])) & 0xFF) << 24 | (int(int(_loc45_.buffer.b[_loc45_.byteOffset + int(Math.round((_loc27_ >> 16 & 0xFF) * RGBA_Impl_.unmult))])) & 0xFF) << 16 | (int(int(_loc46_.buffer.b[_loc46_.byteOffset + int(Math.round((_loc27_ >> 8 & 0xFF) * RGBA_Impl_.unmult))])) & 0xFF) << 8 | _loc27_ & 0xFF & 0xFF;
                     }
                  }
                  _loc43_ = _loc17_.byteOffset + _loc17_.stride * (_loc39_ + _loc34_) + (_loc42_ + _loc33_ + 1) * 4;
                  switch(_loc12_)
                  {
                     case 0:
                        _loc28_ = (int(int(_loc9_.buffer.b[_loc9_.byteOffset + _loc43_])) & 0xFF) << 24 | (int(int(_loc9_.buffer.b[_loc9_.byteOffset + (_loc43_ + 1)])) & 0xFF) << 16 | (int(int(_loc9_.buffer.b[_loc9_.byteOffset + (_loc43_ + 2)])) & 0xFF) << 8 | int(int(_loc9_.buffer.b[_loc9_.byteOffset + (_loc43_ + 3)])) & 0xFF;
                        break;
                     case 1:
                        _loc28_ = (int(int(_loc9_.buffer.b[_loc9_.byteOffset + (_loc43_ + 1)])) & 0xFF) << 24 | (int(int(_loc9_.buffer.b[_loc9_.byteOffset + (_loc43_ + 2)])) & 0xFF) << 16 | (int(int(_loc9_.buffer.b[_loc9_.byteOffset + (_loc43_ + 3)])) & 0xFF) << 8 | int(int(_loc9_.buffer.b[_loc9_.byteOffset + _loc43_])) & 0xFF;
                        break;
                     case 2:
                        _loc28_ = (int(int(_loc9_.buffer.b[_loc9_.byteOffset + (_loc43_ + 2)])) & 0xFF) << 24 | (int(int(_loc9_.buffer.b[_loc9_.byteOffset + (_loc43_ + 1)])) & 0xFF) << 16 | (int(int(_loc9_.buffer.b[_loc9_.byteOffset + _loc43_])) & 0xFF) << 8 | int(int(_loc9_.buffer.b[_loc9_.byteOffset + (_loc43_ + 3)])) & 0xFF;
                  }
                  if(_loc15_)
                  {
                     if((_loc28_ & 0xFF) != 0 && (_loc28_ & 0xFF) != 255)
                     {
                        RGBA_Impl_.unmult = 255 / (_loc28_ & 0xFF);
                        _loc44_ = RGBA_Impl_.__clamp;
                        _loc45_ = RGBA_Impl_.__clamp;
                        _loc46_ = RGBA_Impl_.__clamp;
                        _loc28_ = (int(int(_loc44_.buffer.b[_loc44_.byteOffset + int(Math.round((_loc28_ >> 24 & 0xFF) * RGBA_Impl_.unmult))])) & 0xFF) << 24 | (int(int(_loc45_.buffer.b[_loc45_.byteOffset + int(Math.round((_loc28_ >> 16 & 0xFF) * RGBA_Impl_.unmult))])) & 0xFF) << 16 | (int(int(_loc46_.buffer.b[_loc46_.byteOffset + int(Math.round((_loc28_ >> 8 & 0xFF) * RGBA_Impl_.unmult))])) & 0xFF) << 8 | _loc28_ & 0xFF & 0xFF;
                     }
                  }
                  _loc43_ = _loc17_.byteOffset + _loc17_.stride * (_loc39_ + _loc34_ + 1) + (_loc42_ + _loc33_ + 1) * 4;
                  switch(_loc12_)
                  {
                     case 0:
                        _loc29_ = (int(int(_loc9_.buffer.b[_loc9_.byteOffset + _loc43_])) & 0xFF) << 24 | (int(int(_loc9_.buffer.b[_loc9_.byteOffset + (_loc43_ + 1)])) & 0xFF) << 16 | (int(int(_loc9_.buffer.b[_loc9_.byteOffset + (_loc43_ + 2)])) & 0xFF) << 8 | int(int(_loc9_.buffer.b[_loc9_.byteOffset + (_loc43_ + 3)])) & 0xFF;
                        break;
                     case 1:
                        _loc29_ = (int(int(_loc9_.buffer.b[_loc9_.byteOffset + (_loc43_ + 1)])) & 0xFF) << 24 | (int(int(_loc9_.buffer.b[_loc9_.byteOffset + (_loc43_ + 2)])) & 0xFF) << 16 | (int(int(_loc9_.buffer.b[_loc9_.byteOffset + (_loc43_ + 3)])) & 0xFF) << 8 | int(int(_loc9_.buffer.b[_loc9_.byteOffset + _loc43_])) & 0xFF;
                        break;
                     case 2:
                        _loc29_ = (int(int(_loc9_.buffer.b[_loc9_.byteOffset + (_loc43_ + 2)])) & 0xFF) << 24 | (int(int(_loc9_.buffer.b[_loc9_.byteOffset + (_loc43_ + 1)])) & 0xFF) << 16 | (int(int(_loc9_.buffer.b[_loc9_.byteOffset + _loc43_])) & 0xFF) << 8 | int(int(_loc9_.buffer.b[_loc9_.byteOffset + (_loc43_ + 3)])) & 0xFF;
                  }
                  if(_loc15_)
                  {
                     if((_loc29_ & 0xFF) != 0 && (_loc29_ & 0xFF) != 255)
                     {
                        RGBA_Impl_.unmult = 255 / (_loc29_ & 0xFF);
                        _loc44_ = RGBA_Impl_.__clamp;
                        _loc45_ = RGBA_Impl_.__clamp;
                        _loc46_ = RGBA_Impl_.__clamp;
                        _loc29_ = (int(int(_loc44_.buffer.b[_loc44_.byteOffset + int(Math.round((_loc29_ >> 24 & 0xFF) * RGBA_Impl_.unmult))])) & 0xFF) << 24 | (int(int(_loc45_.buffer.b[_loc45_.byteOffset + int(Math.round((_loc29_ >> 16 & 0xFF) * RGBA_Impl_.unmult))])) & 0xFF) << 16 | (int(int(_loc46_.buffer.b[_loc46_.byteOffset + int(Math.round((_loc29_ >> 8 & 0xFF) * RGBA_Impl_.unmult))])) & 0xFF) << 8 | _loc29_ & 0xFF & 0xFF;
                     }
                  }
                  _loc43_ = _loc17_.byteOffset + _loc17_.stride * (_loc39_ + _loc34_) + (_loc42_ + _loc33_) * 4;
                  switch(_loc12_)
                  {
                     case 0:
                        _loc30_ = (int(int(_loc9_.buffer.b[_loc9_.byteOffset + _loc43_])) & 0xFF) << 24 | (int(int(_loc9_.buffer.b[_loc9_.byteOffset + (_loc43_ + 1)])) & 0xFF) << 16 | (int(int(_loc9_.buffer.b[_loc9_.byteOffset + (_loc43_ + 2)])) & 0xFF) << 8 | int(int(_loc9_.buffer.b[_loc9_.byteOffset + (_loc43_ + 3)])) & 0xFF;
                        break;
                     case 1:
                        _loc30_ = (int(int(_loc9_.buffer.b[_loc9_.byteOffset + (_loc43_ + 1)])) & 0xFF) << 24 | (int(int(_loc9_.buffer.b[_loc9_.byteOffset + (_loc43_ + 2)])) & 0xFF) << 16 | (int(int(_loc9_.buffer.b[_loc9_.byteOffset + (_loc43_ + 3)])) & 0xFF) << 8 | int(int(_loc9_.buffer.b[_loc9_.byteOffset + _loc43_])) & 0xFF;
                        break;
                     case 2:
                        _loc30_ = (int(int(_loc9_.buffer.b[_loc9_.byteOffset + (_loc43_ + 2)])) & 0xFF) << 24 | (int(int(_loc9_.buffer.b[_loc9_.byteOffset + (_loc43_ + 1)])) & 0xFF) << 16 | (int(int(_loc9_.buffer.b[_loc9_.byteOffset + _loc43_])) & 0xFF) << 8 | int(int(_loc9_.buffer.b[_loc9_.byteOffset + (_loc43_ + 3)])) & 0xFF;
                  }
                  if(_loc15_)
                  {
                     if((_loc30_ & 0xFF) != 0 && (_loc30_ & 0xFF) != 255)
                     {
                        RGBA_Impl_.unmult = 255 / (_loc30_ & 0xFF);
                        _loc44_ = RGBA_Impl_.__clamp;
                        _loc45_ = RGBA_Impl_.__clamp;
                        _loc46_ = RGBA_Impl_.__clamp;
                        _loc30_ = (int(int(_loc44_.buffer.b[_loc44_.byteOffset + int(Math.round((_loc30_ >> 24 & 0xFF) * RGBA_Impl_.unmult))])) & 0xFF) << 24 | (int(int(_loc45_.buffer.b[_loc45_.byteOffset + int(Math.round((_loc30_ >> 16 & 0xFF) * RGBA_Impl_.unmult))])) & 0xFF) << 16 | (int(int(_loc46_.buffer.b[_loc46_.byteOffset + int(Math.round((_loc30_ >> 8 & 0xFF) * RGBA_Impl_.unmult))])) & 0xFF) << 8 | _loc30_ & 0xFF & 0xFF;
                     }
                  }
                  _loc21_ = ImageDataUtil.bilinear(_loc27_,_loc28_,_loc29_,_loc30_,_loc35_ * _loc17_.width - _loc33_,_loc36_ * _loc17_.height - _loc34_);
               }
               else
               {
                  _loc43_ = _loc17_.byteOffset + _loc17_.stride * (_loc39_ + _loc34_) + (_loc42_ + _loc33_) * 4;
                  switch(_loc12_)
                  {
                     case 0:
                        _loc21_ = (int(int(_loc9_.buffer.b[_loc9_.byteOffset + _loc43_])) & 0xFF) << 24 | (int(int(_loc9_.buffer.b[_loc9_.byteOffset + (_loc43_ + 1)])) & 0xFF) << 16 | (int(int(_loc9_.buffer.b[_loc9_.byteOffset + (_loc43_ + 2)])) & 0xFF) << 8 | int(int(_loc9_.buffer.b[_loc9_.byteOffset + (_loc43_ + 3)])) & 0xFF;
                        break;
                     case 1:
                        _loc21_ = (int(int(_loc9_.buffer.b[_loc9_.byteOffset + (_loc43_ + 1)])) & 0xFF) << 24 | (int(int(_loc9_.buffer.b[_loc9_.byteOffset + (_loc43_ + 2)])) & 0xFF) << 16 | (int(int(_loc9_.buffer.b[_loc9_.byteOffset + (_loc43_ + 3)])) & 0xFF) << 8 | int(int(_loc9_.buffer.b[_loc9_.byteOffset + _loc43_])) & 0xFF;
                        break;
                     case 2:
                        _loc21_ = (int(int(_loc9_.buffer.b[_loc9_.byteOffset + (_loc43_ + 2)])) & 0xFF) << 24 | (int(int(_loc9_.buffer.b[_loc9_.byteOffset + (_loc43_ + 1)])) & 0xFF) << 16 | (int(int(_loc9_.buffer.b[_loc9_.byteOffset + _loc43_])) & 0xFF) << 8 | int(int(_loc9_.buffer.b[_loc9_.byteOffset + (_loc43_ + 3)])) & 0xFF;
                  }
                  if(_loc15_)
                  {
                     if((_loc21_ & 0xFF) != 0 && (_loc21_ & 0xFF) != 255)
                     {
                        RGBA_Impl_.unmult = 255 / (_loc21_ & 0xFF);
                        _loc44_ = RGBA_Impl_.__clamp;
                        _loc45_ = RGBA_Impl_.__clamp;
                        _loc46_ = RGBA_Impl_.__clamp;
                        _loc21_ = (int(int(_loc44_.buffer.b[_loc44_.byteOffset + int(Math.round((_loc21_ >> 24 & 0xFF) * RGBA_Impl_.unmult))])) & 0xFF) << 24 | (int(int(_loc45_.buffer.b[_loc45_.byteOffset + int(Math.round((_loc21_ >> 16 & 0xFF) * RGBA_Impl_.unmult))])) & 0xFF) << 16 | (int(int(_loc46_.buffer.b[_loc46_.byteOffset + int(Math.round((_loc21_ >> 8 & 0xFF) * RGBA_Impl_.unmult))])) & 0xFF) << 8 | _loc21_ & 0xFF & 0xFF;
                     }
                  }
               }
               if(_loc14_)
               {
                  if((_loc21_ & 0xFF) == 0)
                  {
                     if(_loc21_ != 0)
                     {
                        _loc21_ = 0;
                     }
                  }
                  else if((_loc21_ & 0xFF) != 255)
                  {
                     _loc44_ = RGBA_Impl_.__alpha16;
                     _loc47_ = _loc44_.buffer;
                     _loc43_ = _loc44_.byteOffset + (_loc21_ & 0xFF) * 4;
                     _loc48_ = int(_loc47_.b[_loc43_]);
                     _loc49_ = int(_loc47_.b[_loc43_ + 1]);
                     _loc50_ = int(_loc47_.b[_loc43_ + 2]);
                     _loc51_ = int(_loc47_.b[_loc43_ + 3]);
                     RGBA_Impl_.a16 = _loc48_ | _loc49_ << 8 | _loc50_ << 16 | _loc51_ << 24;
                     _loc21_ = ((_loc21_ >> 24 & 0xFF) * RGBA_Impl_.a16 >> 16 & 0xFF) << 24 | ((_loc21_ >> 16 & 0xFF) * RGBA_Impl_.a16 >> 16 & 0xFF) << 16 | ((_loc21_ >> 8 & 0xFF) * RGBA_Impl_.a16 >> 16 & 0xFF) << 8 | _loc21_ & 0xFF & 0xFF;
                  }
               }
               switch(_loc11_)
               {
                  case 0:
                     _loc52_ = uint(_loc21_ >> 24 & 0xFF);
                     _loc8_.buffer.b[_loc8_.byteOffset + _loc20_] = _loc52_;
                     _loc52_ = uint(_loc21_ >> 16 & 0xFF);
                     _loc8_.buffer.b[_loc8_.byteOffset + (_loc20_ + 1)] = _loc52_;
                     _loc52_ = uint(_loc21_ >> 8 & 0xFF);
                     _loc8_.buffer.b[_loc8_.byteOffset + (_loc20_ + 2)] = _loc52_;
                     _loc52_ = uint(_loc21_ & 0xFF);
                     _loc8_.buffer.b[_loc8_.byteOffset + (_loc20_ + 3)] = _loc52_;
                     break;
                  case 1:
                     _loc52_ = uint(_loc21_ & 0xFF);
                     _loc8_.buffer.b[_loc8_.byteOffset + _loc20_] = _loc52_;
                     _loc52_ = uint(_loc21_ >> 24 & 0xFF);
                     _loc8_.buffer.b[_loc8_.byteOffset + (_loc20_ + 1)] = _loc52_;
                     _loc52_ = uint(_loc21_ >> 16 & 0xFF);
                     _loc8_.buffer.b[_loc8_.byteOffset + (_loc20_ + 2)] = _loc52_;
                     _loc52_ = uint(_loc21_ >> 8 & 0xFF);
                     _loc8_.buffer.b[_loc8_.byteOffset + (_loc20_ + 3)] = _loc52_;
                     break;
                  case 2:
                     _loc52_ = uint(_loc21_ >> 8 & 0xFF);
                     _loc8_.buffer.b[_loc8_.byteOffset + _loc20_] = _loc52_;
                     _loc52_ = uint(_loc21_ >> 16 & 0xFF);
                     _loc8_.buffer.b[_loc8_.byteOffset + (_loc20_ + 1)] = _loc52_;
                     _loc52_ = uint(_loc21_ >> 24 & 0xFF);
                     _loc8_.buffer.b[_loc8_.byteOffset + (_loc20_ + 2)] = _loc52_;
                     _loc52_ = uint(_loc21_ & 0xFF);
                     _loc8_.buffer.b[_loc8_.byteOffset + (_loc20_ + 3)] = _loc52_;
               }
            }
         }
         param1.dirty = true;
         ++param1.version;
      }
      
      public static function bilinear(param1:int, param2:int, param3:int, param4:int, param5:Number, param6:Number) : int
      {
         return ImageDataUtil.lerpRGBA(ImageDataUtil.lerpRGBA(param4,param2,param5),ImageDataUtil.lerpRGBA(param1,param3,param5),param6);
      }
      
      public static function lerpRGBA(param1:int, param2:int, param3:Number) : int
      {
         var _loc4_:int = 0;
         var _loc5_:int = int(Math.floor(ImageDataUtil.lerp(param1 >> 24 & 0xFF,param2 >> 24 & 0xFF,param3)));
         _loc4_ = (_loc5_ & 0xFF) << 24 | (_loc4_ >> 16 & 0xFF & 0xFF) << 16 | (_loc4_ >> 8 & 0xFF & 0xFF) << 8 | _loc4_ & 0xFF & 0xFF;
         _loc5_ = int(Math.floor(ImageDataUtil.lerp(param1 >> 16 & 0xFF,param2 >> 16 & 0xFF,param3)));
         _loc4_ = (_loc4_ >> 24 & 0xFF & 0xFF) << 24 | (_loc5_ & 0xFF) << 16 | (_loc4_ >> 8 & 0xFF & 0xFF) << 8 | _loc4_ & 0xFF & 0xFF;
         _loc5_ = int(Math.floor(ImageDataUtil.lerp(param1 >> 8 & 0xFF,param2 >> 8 & 0xFF,param3)));
         _loc4_ = (_loc4_ >> 24 & 0xFF & 0xFF) << 24 | (_loc4_ >> 16 & 0xFF & 0xFF) << 16 | (_loc5_ & 0xFF) << 8 | _loc4_ & 0xFF & 0xFF;
         _loc5_ = int(Math.floor(ImageDataUtil.lerp(param1 & 0xFF,param2 & 0xFF,param3)));
         return (_loc4_ >> 24 & 0xFF & 0xFF) << 24 | (_loc4_ >> 16 & 0xFF & 0xFF) << 16 | (_loc4_ >> 8 & 0xFF & 0xFF) << 8 | _loc5_ & 0xFF;
      }
      
      public static function lerp4f(param1:Vector4, param2:Vector4, param3:Number) : Vector4
      {
         return new Vector4(ImageDataUtil.lerp(param1.x,param2.x,param3),ImageDataUtil.lerp(param1.y,param2.y,param3),ImageDataUtil.lerp(param1.z,param2.z,param3),ImageDataUtil.lerp(param1.w,param2.w,param3));
      }
      
      public static function lerp(param1:Number, param2:Number, param3:Number) : Number
      {
         return (1 - param3) * param1 + param3 * param2;
      }
      
      public static function colorTransform(param1:Image, param2:Rectangle, param3:ArrayBufferView) : void
      {
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc17_:int = 0;
         var _loc18_:int = 0;
         var _loc19_:int = 0;
         var _loc20_:int = 0;
         var _loc21_:* = null as ArrayBufferView;
         var _loc22_:* = null as ArrayBufferView;
         var _loc23_:* = null as ArrayBufferView;
         var _loc24_:* = null as Bytes;
         var _loc25_:int = 0;
         var _loc26_:int = 0;
         var _loc27_:int = 0;
         var _loc28_:int = 0;
         var _loc29_:int = 0;
         var _loc30_:uint = 0;
         var _loc4_:ArrayBufferView = param1.buffer.data;
         if(_loc4_ == null)
         {
            return;
         }
         var _loc5_:int = param1.buffer.format;
         var _loc6_:Boolean = param1.buffer.premultiplied;
         var _loc7_:ImageDataView = new ImageDataView(param1,param2);
         var _loc8_:ArrayBufferView = ColorMatrix_Impl_.getAlphaTable(param3);
         var _loc9_:ArrayBufferView = ColorMatrix_Impl_.getRedTable(param3);
         var _loc10_:ArrayBufferView = ColorMatrix_Impl_.getGreenTable(param3);
         var _loc11_:ArrayBufferView = ColorMatrix_Impl_.getBlueTable(param3);
         var _loc14_:int = 0;
         var _loc15_:int = 0;
         var _loc16_:int = _loc7_.height;
         while(_loc15_ < _loc16_)
         {
            _loc17_ = _loc15_++;
            _loc12_ = _loc7_.byteOffset + _loc7_.stride * _loc17_;
            _loc18_ = 0;
            _loc19_ = _loc7_.width;
            while(_loc18_ < _loc19_)
            {
               _loc20_ = _loc18_++;
               _loc13_ = _loc12_ + _loc20_ * 4;
               switch(_loc5_)
               {
                  case 0:
                     _loc14_ = (int(int(_loc4_.buffer.b[_loc4_.byteOffset + _loc13_])) & 0xFF) << 24 | (int(int(_loc4_.buffer.b[_loc4_.byteOffset + (_loc13_ + 1)])) & 0xFF) << 16 | (int(int(_loc4_.buffer.b[_loc4_.byteOffset + (_loc13_ + 2)])) & 0xFF) << 8 | int(int(_loc4_.buffer.b[_loc4_.byteOffset + (_loc13_ + 3)])) & 0xFF;
                     break;
                  case 1:
                     _loc14_ = (int(int(_loc4_.buffer.b[_loc4_.byteOffset + (_loc13_ + 1)])) & 0xFF) << 24 | (int(int(_loc4_.buffer.b[_loc4_.byteOffset + (_loc13_ + 2)])) & 0xFF) << 16 | (int(int(_loc4_.buffer.b[_loc4_.byteOffset + (_loc13_ + 3)])) & 0xFF) << 8 | int(int(_loc4_.buffer.b[_loc4_.byteOffset + _loc13_])) & 0xFF;
                     break;
                  case 2:
                     _loc14_ = (int(int(_loc4_.buffer.b[_loc4_.byteOffset + (_loc13_ + 2)])) & 0xFF) << 24 | (int(int(_loc4_.buffer.b[_loc4_.byteOffset + (_loc13_ + 1)])) & 0xFF) << 16 | (int(int(_loc4_.buffer.b[_loc4_.byteOffset + _loc13_])) & 0xFF) << 8 | int(int(_loc4_.buffer.b[_loc4_.byteOffset + (_loc13_ + 3)])) & 0xFF;
               }
               if(_loc6_)
               {
                  if((_loc14_ & 0xFF) != 0 && (_loc14_ & 0xFF) != 255)
                  {
                     RGBA_Impl_.unmult = 255 / (_loc14_ & 0xFF);
                     _loc21_ = RGBA_Impl_.__clamp;
                     _loc22_ = RGBA_Impl_.__clamp;
                     _loc23_ = RGBA_Impl_.__clamp;
                     _loc14_ = (int(int(_loc21_.buffer.b[_loc21_.byteOffset + int(Math.round((_loc14_ >> 24 & 0xFF) * RGBA_Impl_.unmult))])) & 0xFF) << 24 | (int(int(_loc22_.buffer.b[_loc22_.byteOffset + int(Math.round((_loc14_ >> 16 & 0xFF) * RGBA_Impl_.unmult))])) & 0xFF) << 16 | (int(int(_loc23_.buffer.b[_loc23_.byteOffset + int(Math.round((_loc14_ >> 8 & 0xFF) * RGBA_Impl_.unmult))])) & 0xFF) << 8 | _loc14_ & 0xFF & 0xFF;
                  }
               }
               _loc14_ = (int(int(_loc9_.buffer.b[_loc9_.byteOffset + (_loc14_ >> 24 & 0xFF)])) & 0xFF) << 24 | (int(int(_loc10_.buffer.b[_loc10_.byteOffset + (_loc14_ >> 16 & 0xFF)])) & 0xFF) << 16 | (int(int(_loc11_.buffer.b[_loc11_.byteOffset + (_loc14_ >> 8 & 0xFF)])) & 0xFF) << 8 | int(int(_loc8_.buffer.b[_loc8_.byteOffset + (_loc14_ & 0xFF)])) & 0xFF;
               if(_loc6_)
               {
                  if((_loc14_ & 0xFF) == 0)
                  {
                     if(_loc14_ != 0)
                     {
                        _loc14_ = 0;
                     }
                  }
                  else if((_loc14_ & 0xFF) != 255)
                  {
                     _loc21_ = RGBA_Impl_.__alpha16;
                     _loc24_ = _loc21_.buffer;
                     _loc25_ = _loc21_.byteOffset + (_loc14_ & 0xFF) * 4;
                     _loc26_ = int(_loc24_.b[_loc25_]);
                     _loc27_ = int(_loc24_.b[_loc25_ + 1]);
                     _loc28_ = int(_loc24_.b[_loc25_ + 2]);
                     _loc29_ = int(_loc24_.b[_loc25_ + 3]);
                     RGBA_Impl_.a16 = _loc26_ | _loc27_ << 8 | _loc28_ << 16 | _loc29_ << 24;
                     _loc14_ = ((_loc14_ >> 24 & 0xFF) * RGBA_Impl_.a16 >> 16 & 0xFF) << 24 | ((_loc14_ >> 16 & 0xFF) * RGBA_Impl_.a16 >> 16 & 0xFF) << 16 | ((_loc14_ >> 8 & 0xFF) * RGBA_Impl_.a16 >> 16 & 0xFF) << 8 | _loc14_ & 0xFF & 0xFF;
                  }
               }
               switch(_loc5_)
               {
                  case 0:
                     _loc30_ = uint(_loc14_ >> 24 & 0xFF);
                     _loc4_.buffer.b[_loc4_.byteOffset + _loc13_] = _loc30_;
                     _loc30_ = uint(_loc14_ >> 16 & 0xFF);
                     _loc4_.buffer.b[_loc4_.byteOffset + (_loc13_ + 1)] = _loc30_;
                     _loc30_ = uint(_loc14_ >> 8 & 0xFF);
                     _loc4_.buffer.b[_loc4_.byteOffset + (_loc13_ + 2)] = _loc30_;
                     _loc30_ = uint(_loc14_ & 0xFF);
                     _loc4_.buffer.b[_loc4_.byteOffset + (_loc13_ + 3)] = _loc30_;
                     break;
                  case 1:
                     _loc30_ = uint(_loc14_ & 0xFF);
                     _loc4_.buffer.b[_loc4_.byteOffset + _loc13_] = _loc30_;
                     _loc30_ = uint(_loc14_ >> 24 & 0xFF);
                     _loc4_.buffer.b[_loc4_.byteOffset + (_loc13_ + 1)] = _loc30_;
                     _loc30_ = uint(_loc14_ >> 16 & 0xFF);
                     _loc4_.buffer.b[_loc4_.byteOffset + (_loc13_ + 2)] = _loc30_;
                     _loc30_ = uint(_loc14_ >> 8 & 0xFF);
                     _loc4_.buffer.b[_loc4_.byteOffset + (_loc13_ + 3)] = _loc30_;
                     break;
                  case 2:
                     _loc30_ = uint(_loc14_ >> 8 & 0xFF);
                     _loc4_.buffer.b[_loc4_.byteOffset + _loc13_] = _loc30_;
                     _loc30_ = uint(_loc14_ >> 16 & 0xFF);
                     _loc4_.buffer.b[_loc4_.byteOffset + (_loc13_ + 1)] = _loc30_;
                     _loc30_ = uint(_loc14_ >> 24 & 0xFF);
                     _loc4_.buffer.b[_loc4_.byteOffset + (_loc13_ + 2)] = _loc30_;
                     _loc30_ = uint(_loc14_ & 0xFF);
                     _loc4_.buffer.b[_loc4_.byteOffset + (_loc13_ + 3)] = _loc30_;
               }
            }
         }
         param1.dirty = true;
         ++param1.version;
      }
      
      public static function copyChannel(param1:Image, param2:Image, param3:Rectangle, param4:Vector2, param5:ImageChannel, param6:ImageChannel) : void
      {
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc17_:int = 0;
         var _loc18_:int = 0;
         var _loc24_:int = 0;
         var _loc25_:int = 0;
         var _loc26_:int = 0;
         var _loc27_:int = 0;
         var _loc28_:* = null as ArrayBufferView;
         var _loc29_:* = null as ArrayBufferView;
         var _loc30_:* = null as ArrayBufferView;
         var _loc31_:* = null as Bytes;
         var _loc32_:int = 0;
         var _loc33_:int = 0;
         var _loc34_:int = 0;
         var _loc35_:int = 0;
         var _loc36_:int = 0;
         var _loc37_:uint = 0;
         switch(param6.index)
         {
            case 0:
               _loc7_ = 0;
               break;
            case 1:
               _loc7_ = 1;
               break;
            case 2:
               _loc7_ = 2;
               break;
            case 3:
               _loc7_ = 3;
         }
         switch(param5.index)
         {
            case 0:
               _loc8_ = 0;
               break;
            case 1:
               _loc8_ = 1;
               break;
            case 2:
               _loc8_ = 2;
               break;
            case 3:
               _loc8_ = 3;
         }
         var _loc9_:ArrayBufferView = param2.buffer.data;
         var _loc10_:ArrayBufferView = param1.buffer.data;
         if(_loc9_ == null || _loc10_ == null)
         {
            return;
         }
         var _loc11_:ImageDataView = new ImageDataView(param2,param3);
         var _loc12_:ImageDataView = new ImageDataView(param1,new Rectangle(param4.x,param4.y,_loc11_.width,_loc11_.height));
         var _loc13_:int = param2.buffer.format;
         var _loc14_:int = param1.buffer.format;
         var _loc15_:Boolean = param2.buffer.premultiplied;
         var _loc16_:Boolean = param1.buffer.premultiplied;
         var _loc19_:int = 0;
         var _loc20_:int = 0;
         var _loc21_:int = 0;
         var _loc22_:int = 0;
         var _loc23_:int = _loc12_.height;
         while(_loc22_ < _loc23_)
         {
            _loc24_ = _loc22_++;
            _loc17_ = _loc11_.byteOffset + _loc11_.stride * _loc24_;
            _loc18_ = _loc12_.byteOffset + _loc12_.stride * _loc24_;
            _loc25_ = 0;
            _loc26_ = _loc12_.width;
            while(_loc25_ < _loc26_)
            {
               _loc27_ = _loc25_++;
               switch(_loc13_)
               {
                  case 0:
                     _loc19_ = (int(int(_loc9_.buffer.b[_loc9_.byteOffset + _loc17_])) & 0xFF) << 24 | (int(int(_loc9_.buffer.b[_loc9_.byteOffset + (_loc17_ + 1)])) & 0xFF) << 16 | (int(int(_loc9_.buffer.b[_loc9_.byteOffset + (_loc17_ + 2)])) & 0xFF) << 8 | int(int(_loc9_.buffer.b[_loc9_.byteOffset + (_loc17_ + 3)])) & 0xFF;
                     break;
                  case 1:
                     _loc19_ = (int(int(_loc9_.buffer.b[_loc9_.byteOffset + (_loc17_ + 1)])) & 0xFF) << 24 | (int(int(_loc9_.buffer.b[_loc9_.byteOffset + (_loc17_ + 2)])) & 0xFF) << 16 | (int(int(_loc9_.buffer.b[_loc9_.byteOffset + (_loc17_ + 3)])) & 0xFF) << 8 | int(int(_loc9_.buffer.b[_loc9_.byteOffset + _loc17_])) & 0xFF;
                     break;
                  case 2:
                     _loc19_ = (int(int(_loc9_.buffer.b[_loc9_.byteOffset + (_loc17_ + 2)])) & 0xFF) << 24 | (int(int(_loc9_.buffer.b[_loc9_.byteOffset + (_loc17_ + 1)])) & 0xFF) << 16 | (int(int(_loc9_.buffer.b[_loc9_.byteOffset + _loc17_])) & 0xFF) << 8 | int(int(_loc9_.buffer.b[_loc9_.byteOffset + (_loc17_ + 3)])) & 0xFF;
               }
               if(_loc15_)
               {
                  if((_loc19_ & 0xFF) != 0 && (_loc19_ & 0xFF) != 255)
                  {
                     RGBA_Impl_.unmult = 255 / (_loc19_ & 0xFF);
                     _loc28_ = RGBA_Impl_.__clamp;
                     _loc29_ = RGBA_Impl_.__clamp;
                     _loc30_ = RGBA_Impl_.__clamp;
                     _loc19_ = (int(int(_loc28_.buffer.b[_loc28_.byteOffset + int(Math.round((_loc19_ >> 24 & 0xFF) * RGBA_Impl_.unmult))])) & 0xFF) << 24 | (int(int(_loc29_.buffer.b[_loc29_.byteOffset + int(Math.round((_loc19_ >> 16 & 0xFF) * RGBA_Impl_.unmult))])) & 0xFF) << 16 | (int(int(_loc30_.buffer.b[_loc30_.byteOffset + int(Math.round((_loc19_ >> 8 & 0xFF) * RGBA_Impl_.unmult))])) & 0xFF) << 8 | _loc19_ & 0xFF & 0xFF;
                  }
               }
               switch(_loc14_)
               {
                  case 0:
                     _loc20_ = (int(int(_loc10_.buffer.b[_loc10_.byteOffset + _loc18_])) & 0xFF) << 24 | (int(int(_loc10_.buffer.b[_loc10_.byteOffset + (_loc18_ + 1)])) & 0xFF) << 16 | (int(int(_loc10_.buffer.b[_loc10_.byteOffset + (_loc18_ + 2)])) & 0xFF) << 8 | int(int(_loc10_.buffer.b[_loc10_.byteOffset + (_loc18_ + 3)])) & 0xFF;
                     break;
                  case 1:
                     _loc20_ = (int(int(_loc10_.buffer.b[_loc10_.byteOffset + (_loc18_ + 1)])) & 0xFF) << 24 | (int(int(_loc10_.buffer.b[_loc10_.byteOffset + (_loc18_ + 2)])) & 0xFF) << 16 | (int(int(_loc10_.buffer.b[_loc10_.byteOffset + (_loc18_ + 3)])) & 0xFF) << 8 | int(int(_loc10_.buffer.b[_loc10_.byteOffset + _loc18_])) & 0xFF;
                     break;
                  case 2:
                     _loc20_ = (int(int(_loc10_.buffer.b[_loc10_.byteOffset + (_loc18_ + 2)])) & 0xFF) << 24 | (int(int(_loc10_.buffer.b[_loc10_.byteOffset + (_loc18_ + 1)])) & 0xFF) << 16 | (int(int(_loc10_.buffer.b[_loc10_.byteOffset + _loc18_])) & 0xFF) << 8 | int(int(_loc10_.buffer.b[_loc10_.byteOffset + (_loc18_ + 3)])) & 0xFF;
               }
               if(_loc16_)
               {
                  if((_loc20_ & 0xFF) != 0 && (_loc20_ & 0xFF) != 255)
                  {
                     RGBA_Impl_.unmult = 255 / (_loc20_ & 0xFF);
                     _loc28_ = RGBA_Impl_.__clamp;
                     _loc29_ = RGBA_Impl_.__clamp;
                     _loc30_ = RGBA_Impl_.__clamp;
                     _loc20_ = (int(int(_loc28_.buffer.b[_loc28_.byteOffset + int(Math.round((_loc20_ >> 24 & 0xFF) * RGBA_Impl_.unmult))])) & 0xFF) << 24 | (int(int(_loc29_.buffer.b[_loc29_.byteOffset + int(Math.round((_loc20_ >> 16 & 0xFF) * RGBA_Impl_.unmult))])) & 0xFF) << 16 | (int(int(_loc30_.buffer.b[_loc30_.byteOffset + int(Math.round((_loc20_ >> 8 & 0xFF) * RGBA_Impl_.unmult))])) & 0xFF) << 8 | _loc20_ & 0xFF & 0xFF;
                  }
               }
               switch(_loc8_)
               {
                  case 0:
                     _loc21_ = _loc19_ >> 24 & 0xFF;
                     break;
                  case 1:
                     _loc21_ = _loc19_ >> 16 & 0xFF;
                     break;
                  case 2:
                     _loc21_ = _loc19_ >> 8 & 0xFF;
                     break;
                  case 3:
                     _loc21_ = _loc19_ & 0xFF;
               }
               switch(_loc7_)
               {
                  case 0:
                     _loc20_ = (_loc21_ & 0xFF) << 24 | (_loc20_ >> 16 & 0xFF & 0xFF) << 16 | (_loc20_ >> 8 & 0xFF & 0xFF) << 8 | _loc20_ & 0xFF & 0xFF;
                     break;
                  case 1:
                     _loc20_ = (_loc20_ >> 24 & 0xFF & 0xFF) << 24 | (_loc21_ & 0xFF) << 16 | (_loc20_ >> 8 & 0xFF & 0xFF) << 8 | _loc20_ & 0xFF & 0xFF;
                     break;
                  case 2:
                     _loc20_ = (_loc20_ >> 24 & 0xFF & 0xFF) << 24 | (_loc20_ >> 16 & 0xFF & 0xFF) << 16 | (_loc21_ & 0xFF) << 8 | _loc20_ & 0xFF & 0xFF;
                     break;
                  case 3:
                     _loc20_ = (_loc20_ >> 24 & 0xFF & 0xFF) << 24 | (_loc20_ >> 16 & 0xFF & 0xFF) << 16 | (_loc20_ >> 8 & 0xFF & 0xFF) << 8 | _loc21_ & 0xFF;
               }
               if(_loc16_)
               {
                  if((_loc20_ & 0xFF) == 0)
                  {
                     if(_loc20_ != 0)
                     {
                        _loc20_ = 0;
                     }
                  }
                  else if((_loc20_ & 0xFF) != 255)
                  {
                     _loc28_ = RGBA_Impl_.__alpha16;
                     _loc31_ = _loc28_.buffer;
                     _loc32_ = _loc28_.byteOffset + (_loc20_ & 0xFF) * 4;
                     _loc33_ = int(_loc31_.b[_loc32_]);
                     _loc34_ = int(_loc31_.b[_loc32_ + 1]);
                     _loc35_ = int(_loc31_.b[_loc32_ + 2]);
                     _loc36_ = int(_loc31_.b[_loc32_ + 3]);
                     RGBA_Impl_.a16 = _loc33_ | _loc34_ << 8 | _loc35_ << 16 | _loc36_ << 24;
                     _loc20_ = ((_loc20_ >> 24 & 0xFF) * RGBA_Impl_.a16 >> 16 & 0xFF) << 24 | ((_loc20_ >> 16 & 0xFF) * RGBA_Impl_.a16 >> 16 & 0xFF) << 16 | ((_loc20_ >> 8 & 0xFF) * RGBA_Impl_.a16 >> 16 & 0xFF) << 8 | _loc20_ & 0xFF & 0xFF;
                  }
               }
               switch(_loc14_)
               {
                  case 0:
                     _loc37_ = uint(_loc20_ >> 24 & 0xFF);
                     _loc10_.buffer.b[_loc10_.byteOffset + _loc18_] = _loc37_;
                     _loc37_ = uint(_loc20_ >> 16 & 0xFF);
                     _loc10_.buffer.b[_loc10_.byteOffset + (_loc18_ + 1)] = _loc37_;
                     _loc37_ = uint(_loc20_ >> 8 & 0xFF);
                     _loc10_.buffer.b[_loc10_.byteOffset + (_loc18_ + 2)] = _loc37_;
                     _loc37_ = uint(_loc20_ & 0xFF);
                     _loc10_.buffer.b[_loc10_.byteOffset + (_loc18_ + 3)] = _loc37_;
                     break;
                  case 1:
                     _loc37_ = uint(_loc20_ & 0xFF);
                     _loc10_.buffer.b[_loc10_.byteOffset + _loc18_] = _loc37_;
                     _loc37_ = uint(_loc20_ >> 24 & 0xFF);
                     _loc10_.buffer.b[_loc10_.byteOffset + (_loc18_ + 1)] = _loc37_;
                     _loc37_ = uint(_loc20_ >> 16 & 0xFF);
                     _loc10_.buffer.b[_loc10_.byteOffset + (_loc18_ + 2)] = _loc37_;
                     _loc37_ = uint(_loc20_ >> 8 & 0xFF);
                     _loc10_.buffer.b[_loc10_.byteOffset + (_loc18_ + 3)] = _loc37_;
                     break;
                  case 2:
                     _loc37_ = uint(_loc20_ >> 8 & 0xFF);
                     _loc10_.buffer.b[_loc10_.byteOffset + _loc18_] = _loc37_;
                     _loc37_ = uint(_loc20_ >> 16 & 0xFF);
                     _loc10_.buffer.b[_loc10_.byteOffset + (_loc18_ + 1)] = _loc37_;
                     _loc37_ = uint(_loc20_ >> 24 & 0xFF);
                     _loc10_.buffer.b[_loc10_.byteOffset + (_loc18_ + 2)] = _loc37_;
                     _loc37_ = uint(_loc20_ & 0xFF);
                     _loc10_.buffer.b[_loc10_.byteOffset + (_loc18_ + 3)] = _loc37_;
               }
               _loc17_ += 4;
               _loc18_ += 4;
            }
         }
         param1.dirty = true;
         ++param1.version;
      }
      
      public static function copyPixels(param1:Image, param2:Image, param3:Rectangle, param4:Vector2, param5:Image = undefined, param6:Vector2 = undefined, param7:Boolean = false) : void
      {
         var _loc8_:* = null as ArrayBufferView;
         var _loc9_:* = null as ArrayBufferView;
         var _loc10_:* = null as Array;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc15_:* = null as ImageDataView;
         var _loc16_:* = null as Rectangle;
         var _loc17_:* = null as ImageDataView;
         var _loc18_:Number = NaN;
         var _loc19_:Number = NaN;
         var _loc20_:Number = NaN;
         var _loc21_:Number = NaN;
         var _loc22_:int = 0;
         var _loc23_:int = 0;
         var _loc24_:Boolean = false;
         var _loc25_:Boolean = false;
         var _loc26_:int = 0;
         var _loc27_:int = 0;
         var _loc28_:Boolean = false;
         var _loc29_:Boolean = false;
         var _loc30_:int = 0;
         var _loc31_:int = 0;
         var _loc32_:int = 0;
         var _loc33_:int = 0;
         var _loc34_:int = 0;
         var _loc35_:int = 0;
         var _loc36_:* = null as ArrayBufferView;
         var _loc37_:* = null as ArrayBufferView;
         var _loc38_:* = null as ArrayBufferView;
         var _loc39_:int = 0;
         var _loc40_:* = null as Bytes;
         var _loc41_:int = 0;
         var _loc42_:int = 0;
         var _loc43_:int = 0;
         var _loc44_:int = 0;
         var _loc45_:uint = 0;
         var _loc46_:* = null as ImageDataView;
         var _loc47_:* = null as ArrayBufferView;
         var _loc48_:int = 0;
         var _loc49_:int = 0;
         var _loc50_:int = 0;
         if(param1.width == param2.width && param1.height == param2.height && param3.width == param2.width && param3.height == param2.height && param3.x == 0 && param3.y == 0 && param4.x == 0 && param4.y == 0 && param5 == null && param6 == null && param7 == false && param1.get_format() == param2.get_format())
         {
            _loc8_ = param1.buffer.data;
            _loc9_ = param2.buffer.data;
            _loc10_ = null;
            _loc11_ = 0;
            if(_loc9_ != null && _loc10_ == null)
            {
               if(_loc11_ + _loc9_.length > _loc8_.length)
               {
                  throw Exception.thrown(TAError.RangeError);
               }
               if(_loc8_.bytesPerElement == _loc9_.bytesPerElement)
               {
                  _loc8_.buffer.blit(_loc11_ * _loc8_.bytesPerElement,_loc9_.buffer,_loc9_.byteOffset,_loc9_.byteLength);
               }
               else
               {
                  _loc12_ = 0;
                  _loc13_ = _loc9_.length;
                  while(_loc12_ < _loc13_)
                  {
                     _loc14_ = _loc12_++;
                     ArrayBufferView.transferElement(_loc9_,_loc14_,_loc8_,_loc11_ + _loc14_);
                  }
               }
            }
            else
            {
               if(!(_loc10_ != null && _loc9_ == null))
               {
                  throw Exception.thrown("Invalid .set call. either view, or array must be not-null.");
               }
               _loc8_.copyFromArray(_loc10_,_loc11_);
            }
         }
         else
         {
            _loc8_ = param2.buffer.data;
            _loc9_ = param1.buffer.data;
            if(_loc8_ == null || _loc9_ == null)
            {
               return;
            }
            _loc15_ = new ImageDataView(param2,param3);
            _loc16_ = new Rectangle(param4.x,param4.y,_loc15_.width,_loc15_.height);
            _loc17_ = new ImageDataView(param1,_loc16_);
            _loc11_ = param2.buffer.format;
            _loc12_ = param1.buffer.format;
            _loc22_ = 0;
            _loc23_ = 0;
            _loc24_ = param2.buffer.premultiplied;
            _loc25_ = param1.buffer.premultiplied;
            _loc26_ = int(param2.buffer.bitsPerPixel / 8);
            _loc27_ = int(param1.buffer.bitsPerPixel / 8);
            _loc28_ = param5 != null && param5.get_transparent();
            _loc29_ = param7 || _loc28_ && !param1.get_transparent() || !param7 && !param1.get_transparent() && param2.get_transparent();
            if(!_loc28_)
            {
               if(_loc29_)
               {
                  _loc30_ = 0;
                  _loc31_ = _loc17_.height;
                  while(_loc30_ < _loc31_)
                  {
                     _loc32_ = _loc30_++;
                     _loc13_ = _loc15_.byteOffset + _loc15_.stride * _loc32_;
                     _loc14_ = _loc17_.byteOffset + _loc17_.stride * _loc32_;
                     _loc33_ = 0;
                     _loc34_ = _loc17_.width;
                     while(_loc33_ < _loc34_)
                     {
                        _loc35_ = _loc33_++;
                        switch(_loc11_)
                        {
                           case 0:
                              _loc22_ = (int(int(_loc8_.buffer.b[_loc8_.byteOffset + _loc13_])) & 0xFF) << 24 | (int(int(_loc8_.buffer.b[_loc8_.byteOffset + (_loc13_ + 1)])) & 0xFF) << 16 | (int(int(_loc8_.buffer.b[_loc8_.byteOffset + (_loc13_ + 2)])) & 0xFF) << 8 | int(int(_loc8_.buffer.b[_loc8_.byteOffset + (_loc13_ + 3)])) & 0xFF;
                              break;
                           case 1:
                              _loc22_ = (int(int(_loc8_.buffer.b[_loc8_.byteOffset + (_loc13_ + 1)])) & 0xFF) << 24 | (int(int(_loc8_.buffer.b[_loc8_.byteOffset + (_loc13_ + 2)])) & 0xFF) << 16 | (int(int(_loc8_.buffer.b[_loc8_.byteOffset + (_loc13_ + 3)])) & 0xFF) << 8 | int(int(_loc8_.buffer.b[_loc8_.byteOffset + _loc13_])) & 0xFF;
                              break;
                           case 2:
                              _loc22_ = (int(int(_loc8_.buffer.b[_loc8_.byteOffset + (_loc13_ + 2)])) & 0xFF) << 24 | (int(int(_loc8_.buffer.b[_loc8_.byteOffset + (_loc13_ + 1)])) & 0xFF) << 16 | (int(int(_loc8_.buffer.b[_loc8_.byteOffset + _loc13_])) & 0xFF) << 8 | int(int(_loc8_.buffer.b[_loc8_.byteOffset + (_loc13_ + 3)])) & 0xFF;
                        }
                        if(_loc24_)
                        {
                           if((_loc22_ & 0xFF) != 0 && (_loc22_ & 0xFF) != 255)
                           {
                              RGBA_Impl_.unmult = 255 / (_loc22_ & 0xFF);
                              _loc36_ = RGBA_Impl_.__clamp;
                              _loc37_ = RGBA_Impl_.__clamp;
                              _loc38_ = RGBA_Impl_.__clamp;
                              _loc22_ = (int(int(_loc36_.buffer.b[_loc36_.byteOffset + int(Math.round((_loc22_ >> 24 & 0xFF) * RGBA_Impl_.unmult))])) & 0xFF) << 24 | (int(int(_loc37_.buffer.b[_loc37_.byteOffset + int(Math.round((_loc22_ >> 16 & 0xFF) * RGBA_Impl_.unmult))])) & 0xFF) << 16 | (int(int(_loc38_.buffer.b[_loc38_.byteOffset + int(Math.round((_loc22_ >> 8 & 0xFF) * RGBA_Impl_.unmult))])) & 0xFF) << 8 | _loc22_ & 0xFF & 0xFF;
                           }
                        }
                        switch(_loc12_)
                        {
                           case 0:
                              _loc23_ = (int(int(_loc9_.buffer.b[_loc9_.byteOffset + _loc14_])) & 0xFF) << 24 | (int(int(_loc9_.buffer.b[_loc9_.byteOffset + (_loc14_ + 1)])) & 0xFF) << 16 | (int(int(_loc9_.buffer.b[_loc9_.byteOffset + (_loc14_ + 2)])) & 0xFF) << 8 | int(int(_loc9_.buffer.b[_loc9_.byteOffset + (_loc14_ + 3)])) & 0xFF;
                              break;
                           case 1:
                              _loc23_ = (int(int(_loc9_.buffer.b[_loc9_.byteOffset + (_loc14_ + 1)])) & 0xFF) << 24 | (int(int(_loc9_.buffer.b[_loc9_.byteOffset + (_loc14_ + 2)])) & 0xFF) << 16 | (int(int(_loc9_.buffer.b[_loc9_.byteOffset + (_loc14_ + 3)])) & 0xFF) << 8 | int(int(_loc9_.buffer.b[_loc9_.byteOffset + _loc14_])) & 0xFF;
                              break;
                           case 2:
                              _loc23_ = (int(int(_loc9_.buffer.b[_loc9_.byteOffset + (_loc14_ + 2)])) & 0xFF) << 24 | (int(int(_loc9_.buffer.b[_loc9_.byteOffset + (_loc14_ + 1)])) & 0xFF) << 16 | (int(int(_loc9_.buffer.b[_loc9_.byteOffset + _loc14_])) & 0xFF) << 8 | int(int(_loc9_.buffer.b[_loc9_.byteOffset + (_loc14_ + 3)])) & 0xFF;
                        }
                        if(_loc25_)
                        {
                           if((_loc23_ & 0xFF) != 0 && (_loc23_ & 0xFF) != 255)
                           {
                              RGBA_Impl_.unmult = 255 / (_loc23_ & 0xFF);
                              _loc36_ = RGBA_Impl_.__clamp;
                              _loc37_ = RGBA_Impl_.__clamp;
                              _loc38_ = RGBA_Impl_.__clamp;
                              _loc23_ = (int(int(_loc36_.buffer.b[_loc36_.byteOffset + int(Math.round((_loc23_ >> 24 & 0xFF) * RGBA_Impl_.unmult))])) & 0xFF) << 24 | (int(int(_loc37_.buffer.b[_loc37_.byteOffset + int(Math.round((_loc23_ >> 16 & 0xFF) * RGBA_Impl_.unmult))])) & 0xFF) << 16 | (int(int(_loc38_.buffer.b[_loc38_.byteOffset + int(Math.round((_loc23_ >> 8 & 0xFF) * RGBA_Impl_.unmult))])) & 0xFF) << 8 | _loc23_ & 0xFF & 0xFF;
                           }
                        }
                        _loc18_ = (_loc22_ & 0xFF) / 255;
                        _loc19_ = (_loc23_ & 0xFF) / 255;
                        _loc20_ = 1 - _loc18_;
                        _loc21_ = _loc18_ + _loc19_ * _loc20_;
                        if(_loc21_ == 0)
                        {
                           _loc23_ = 0;
                        }
                        else
                        {
                           _loc36_ = RGBA_Impl_.__clamp;
                           _loc39_ = int(int(_loc36_.buffer.b[_loc36_.byteOffset + int(Math.round(((_loc22_ >> 24 & 0xFF) * _loc18_ + (_loc23_ >> 24 & 0xFF) * _loc19_ * _loc20_) / _loc21_))]));
                           _loc23_ = (_loc39_ & 0xFF) << 24 | (_loc23_ >> 16 & 0xFF & 0xFF) << 16 | (_loc23_ >> 8 & 0xFF & 0xFF) << 8 | _loc23_ & 0xFF & 0xFF;
                           _loc36_ = RGBA_Impl_.__clamp;
                           _loc39_ = int(int(_loc36_.buffer.b[_loc36_.byteOffset + int(Math.round(((_loc22_ >> 16 & 0xFF) * _loc18_ + (_loc23_ >> 16 & 0xFF) * _loc19_ * _loc20_) / _loc21_))]));
                           _loc23_ = (_loc23_ >> 24 & 0xFF & 0xFF) << 24 | (_loc39_ & 0xFF) << 16 | (_loc23_ >> 8 & 0xFF & 0xFF) << 8 | _loc23_ & 0xFF & 0xFF;
                           _loc36_ = RGBA_Impl_.__clamp;
                           _loc39_ = int(int(_loc36_.buffer.b[_loc36_.byteOffset + int(Math.round(((_loc22_ >> 8 & 0xFF) * _loc18_ + (_loc23_ >> 8 & 0xFF) * _loc19_ * _loc20_) / _loc21_))]));
                           _loc23_ = (_loc23_ >> 24 & 0xFF & 0xFF) << 24 | (_loc23_ >> 16 & 0xFF & 0xFF) << 16 | (_loc39_ & 0xFF) << 8 | _loc23_ & 0xFF & 0xFF;
                           _loc36_ = RGBA_Impl_.__clamp;
                           _loc39_ = int(int(_loc36_.buffer.b[_loc36_.byteOffset + int(Math.round(_loc21_ * 255))]));
                           _loc23_ = (_loc23_ >> 24 & 0xFF & 0xFF) << 24 | (_loc23_ >> 16 & 0xFF & 0xFF) << 16 | (_loc23_ >> 8 & 0xFF & 0xFF) << 8 | _loc39_ & 0xFF;
                        }
                        if(_loc25_)
                        {
                           if((_loc23_ & 0xFF) == 0)
                           {
                              if(_loc23_ != 0)
                              {
                                 _loc23_ = 0;
                              }
                           }
                           else if((_loc23_ & 0xFF) != 255)
                           {
                              _loc36_ = RGBA_Impl_.__alpha16;
                              _loc40_ = _loc36_.buffer;
                              _loc39_ = _loc36_.byteOffset + (_loc23_ & 0xFF) * 4;
                              _loc41_ = int(_loc40_.b[_loc39_]);
                              _loc42_ = int(_loc40_.b[_loc39_ + 1]);
                              _loc43_ = int(_loc40_.b[_loc39_ + 2]);
                              _loc44_ = int(_loc40_.b[_loc39_ + 3]);
                              RGBA_Impl_.a16 = _loc41_ | _loc42_ << 8 | _loc43_ << 16 | _loc44_ << 24;
                              _loc23_ = ((_loc23_ >> 24 & 0xFF) * RGBA_Impl_.a16 >> 16 & 0xFF) << 24 | ((_loc23_ >> 16 & 0xFF) * RGBA_Impl_.a16 >> 16 & 0xFF) << 16 | ((_loc23_ >> 8 & 0xFF) * RGBA_Impl_.a16 >> 16 & 0xFF) << 8 | _loc23_ & 0xFF & 0xFF;
                           }
                        }
                        switch(_loc12_)
                        {
                           case 0:
                              _loc45_ = uint(_loc23_ >> 24 & 0xFF);
                              _loc9_.buffer.b[_loc9_.byteOffset + _loc14_] = _loc45_;
                              _loc45_ = uint(_loc23_ >> 16 & 0xFF);
                              _loc9_.buffer.b[_loc9_.byteOffset + (_loc14_ + 1)] = _loc45_;
                              _loc45_ = uint(_loc23_ >> 8 & 0xFF);
                              _loc9_.buffer.b[_loc9_.byteOffset + (_loc14_ + 2)] = _loc45_;
                              _loc45_ = uint(_loc23_ & 0xFF);
                              _loc9_.buffer.b[_loc9_.byteOffset + (_loc14_ + 3)] = _loc45_;
                              break;
                           case 1:
                              _loc45_ = uint(_loc23_ & 0xFF);
                              _loc9_.buffer.b[_loc9_.byteOffset + _loc14_] = _loc45_;
                              _loc45_ = uint(_loc23_ >> 24 & 0xFF);
                              _loc9_.buffer.b[_loc9_.byteOffset + (_loc14_ + 1)] = _loc45_;
                              _loc45_ = uint(_loc23_ >> 16 & 0xFF);
                              _loc9_.buffer.b[_loc9_.byteOffset + (_loc14_ + 2)] = _loc45_;
                              _loc45_ = uint(_loc23_ >> 8 & 0xFF);
                              _loc9_.buffer.b[_loc9_.byteOffset + (_loc14_ + 3)] = _loc45_;
                              break;
                           case 2:
                              _loc45_ = uint(_loc23_ >> 8 & 0xFF);
                              _loc9_.buffer.b[_loc9_.byteOffset + _loc14_] = _loc45_;
                              _loc45_ = uint(_loc23_ >> 16 & 0xFF);
                              _loc9_.buffer.b[_loc9_.byteOffset + (_loc14_ + 1)] = _loc45_;
                              _loc45_ = uint(_loc23_ >> 24 & 0xFF);
                              _loc9_.buffer.b[_loc9_.byteOffset + (_loc14_ + 2)] = _loc45_;
                              _loc45_ = uint(_loc23_ & 0xFF);
                              _loc9_.buffer.b[_loc9_.byteOffset + (_loc14_ + 3)] = _loc45_;
                        }
                        _loc13_ += 4;
                        _loc14_ += 4;
                     }
                  }
               }
               else if(_loc11_ == _loc12_ && _loc24_ == _loc25_ && _loc26_ == _loc27_)
               {
                  _loc30_ = 0;
                  _loc31_ = _loc17_.height;
                  while(_loc30_ < _loc31_)
                  {
                     _loc32_ = _loc30_++;
                     _loc13_ = _loc15_.byteOffset + _loc15_.stride * _loc32_;
                     _loc14_ = _loc17_.byteOffset + _loc17_.stride * _loc32_;
                     _loc9_.buffer.blit(_loc14_,_loc8_.buffer,_loc13_,_loc17_.width * _loc27_);
                  }
               }
               else
               {
                  _loc30_ = 0;
                  _loc31_ = _loc17_.height;
                  while(_loc30_ < _loc31_)
                  {
                     _loc32_ = _loc30_++;
                     _loc13_ = _loc15_.byteOffset + _loc15_.stride * _loc32_;
                     _loc14_ = _loc17_.byteOffset + _loc17_.stride * _loc32_;
                     _loc33_ = 0;
                     _loc34_ = _loc17_.width;
                     while(_loc33_ < _loc34_)
                     {
                        _loc35_ = _loc33_++;
                        switch(_loc11_)
                        {
                           case 0:
                              _loc22_ = (int(int(_loc8_.buffer.b[_loc8_.byteOffset + _loc13_])) & 0xFF) << 24 | (int(int(_loc8_.buffer.b[_loc8_.byteOffset + (_loc13_ + 1)])) & 0xFF) << 16 | (int(int(_loc8_.buffer.b[_loc8_.byteOffset + (_loc13_ + 2)])) & 0xFF) << 8 | int(int(_loc8_.buffer.b[_loc8_.byteOffset + (_loc13_ + 3)])) & 0xFF;
                              break;
                           case 1:
                              _loc22_ = (int(int(_loc8_.buffer.b[_loc8_.byteOffset + (_loc13_ + 1)])) & 0xFF) << 24 | (int(int(_loc8_.buffer.b[_loc8_.byteOffset + (_loc13_ + 2)])) & 0xFF) << 16 | (int(int(_loc8_.buffer.b[_loc8_.byteOffset + (_loc13_ + 3)])) & 0xFF) << 8 | int(int(_loc8_.buffer.b[_loc8_.byteOffset + _loc13_])) & 0xFF;
                              break;
                           case 2:
                              _loc22_ = (int(int(_loc8_.buffer.b[_loc8_.byteOffset + (_loc13_ + 2)])) & 0xFF) << 24 | (int(int(_loc8_.buffer.b[_loc8_.byteOffset + (_loc13_ + 1)])) & 0xFF) << 16 | (int(int(_loc8_.buffer.b[_loc8_.byteOffset + _loc13_])) & 0xFF) << 8 | int(int(_loc8_.buffer.b[_loc8_.byteOffset + (_loc13_ + 3)])) & 0xFF;
                        }
                        if(_loc24_)
                        {
                           if((_loc22_ & 0xFF) != 0 && (_loc22_ & 0xFF) != 255)
                           {
                              RGBA_Impl_.unmult = 255 / (_loc22_ & 0xFF);
                              _loc36_ = RGBA_Impl_.__clamp;
                              _loc37_ = RGBA_Impl_.__clamp;
                              _loc38_ = RGBA_Impl_.__clamp;
                              _loc22_ = (int(int(_loc36_.buffer.b[_loc36_.byteOffset + int(Math.round((_loc22_ >> 24 & 0xFF) * RGBA_Impl_.unmult))])) & 0xFF) << 24 | (int(int(_loc37_.buffer.b[_loc37_.byteOffset + int(Math.round((_loc22_ >> 16 & 0xFF) * RGBA_Impl_.unmult))])) & 0xFF) << 16 | (int(int(_loc38_.buffer.b[_loc38_.byteOffset + int(Math.round((_loc22_ >> 8 & 0xFF) * RGBA_Impl_.unmult))])) & 0xFF) << 8 | _loc22_ & 0xFF & 0xFF;
                           }
                        }
                        if(_loc25_)
                        {
                           if((_loc22_ & 0xFF) == 0)
                           {
                              if(_loc22_ != 0)
                              {
                                 _loc22_ = 0;
                              }
                           }
                           else if((_loc22_ & 0xFF) != 255)
                           {
                              _loc36_ = RGBA_Impl_.__alpha16;
                              _loc40_ = _loc36_.buffer;
                              _loc39_ = _loc36_.byteOffset + (_loc22_ & 0xFF) * 4;
                              _loc41_ = int(_loc40_.b[_loc39_]);
                              _loc42_ = int(_loc40_.b[_loc39_ + 1]);
                              _loc43_ = int(_loc40_.b[_loc39_ + 2]);
                              _loc44_ = int(_loc40_.b[_loc39_ + 3]);
                              RGBA_Impl_.a16 = _loc41_ | _loc42_ << 8 | _loc43_ << 16 | _loc44_ << 24;
                              _loc22_ = ((_loc22_ >> 24 & 0xFF) * RGBA_Impl_.a16 >> 16 & 0xFF) << 24 | ((_loc22_ >> 16 & 0xFF) * RGBA_Impl_.a16 >> 16 & 0xFF) << 16 | ((_loc22_ >> 8 & 0xFF) * RGBA_Impl_.a16 >> 16 & 0xFF) << 8 | _loc22_ & 0xFF & 0xFF;
                           }
                        }
                        switch(_loc12_)
                        {
                           case 0:
                              _loc45_ = uint(_loc22_ >> 24 & 0xFF);
                              _loc9_.buffer.b[_loc9_.byteOffset + _loc14_] = _loc45_;
                              _loc45_ = uint(_loc22_ >> 16 & 0xFF);
                              _loc9_.buffer.b[_loc9_.byteOffset + (_loc14_ + 1)] = _loc45_;
                              _loc45_ = uint(_loc22_ >> 8 & 0xFF);
                              _loc9_.buffer.b[_loc9_.byteOffset + (_loc14_ + 2)] = _loc45_;
                              _loc45_ = uint(_loc22_ & 0xFF);
                              _loc9_.buffer.b[_loc9_.byteOffset + (_loc14_ + 3)] = _loc45_;
                              break;
                           case 1:
                              _loc45_ = uint(_loc22_ & 0xFF);
                              _loc9_.buffer.b[_loc9_.byteOffset + _loc14_] = _loc45_;
                              _loc45_ = uint(_loc22_ >> 24 & 0xFF);
                              _loc9_.buffer.b[_loc9_.byteOffset + (_loc14_ + 1)] = _loc45_;
                              _loc45_ = uint(_loc22_ >> 16 & 0xFF);
                              _loc9_.buffer.b[_loc9_.byteOffset + (_loc14_ + 2)] = _loc45_;
                              _loc45_ = uint(_loc22_ >> 8 & 0xFF);
                              _loc9_.buffer.b[_loc9_.byteOffset + (_loc14_ + 3)] = _loc45_;
                              break;
                           case 2:
                              _loc45_ = uint(_loc22_ >> 8 & 0xFF);
                              _loc9_.buffer.b[_loc9_.byteOffset + _loc14_] = _loc45_;
                              _loc45_ = uint(_loc22_ >> 16 & 0xFF);
                              _loc9_.buffer.b[_loc9_.byteOffset + (_loc14_ + 1)] = _loc45_;
                              _loc45_ = uint(_loc22_ >> 24 & 0xFF);
                              _loc9_.buffer.b[_loc9_.byteOffset + (_loc14_ + 2)] = _loc45_;
                              _loc45_ = uint(_loc22_ & 0xFF);
                              _loc9_.buffer.b[_loc9_.byteOffset + (_loc14_ + 3)] = _loc45_;
                        }
                        _loc13_ += 4;
                        _loc14_ += 4;
                     }
                  }
               }
            }
            else
            {
               _loc36_ = param5.buffer.data;
               _loc30_ = param5.buffer.format;
               _loc32_ = 0;
               _loc46_ = new ImageDataView(param5,new Rectangle(_loc15_.x + (param6 == null ? 0 : param6.x),_loc15_.y + (param6 == null ? 0 : param6.y),_loc15_.width,_loc15_.height));
               _loc17_.clip(int(param4.x),int(param4.y),_loc46_.width,_loc46_.height);
               if(_loc29_)
               {
                  _loc33_ = 0;
                  _loc34_ = _loc17_.height;
                  while(_loc33_ < _loc34_)
                  {
                     _loc35_ = _loc33_++;
                     _loc13_ = _loc15_.byteOffset + _loc15_.stride * _loc35_;
                     _loc14_ = _loc17_.byteOffset + _loc17_.stride * _loc35_;
                     _loc31_ = _loc46_.byteOffset + _loc46_.stride * _loc35_;
                     _loc39_ = 0;
                     _loc41_ = _loc17_.width;
                     for(; _loc39_ < _loc41_; _loc13_ += 4,_loc14_ += 4,_loc31_ += 4)
                     {
                        _loc42_ = _loc39_++;
                        switch(_loc11_)
                        {
                           case 0:
                              _loc22_ = (int(int(_loc8_.buffer.b[_loc8_.byteOffset + _loc13_])) & 0xFF) << 24 | (int(int(_loc8_.buffer.b[_loc8_.byteOffset + (_loc13_ + 1)])) & 0xFF) << 16 | (int(int(_loc8_.buffer.b[_loc8_.byteOffset + (_loc13_ + 2)])) & 0xFF) << 8 | int(int(_loc8_.buffer.b[_loc8_.byteOffset + (_loc13_ + 3)])) & 0xFF;
                              break;
                           case 1:
                              _loc22_ = (int(int(_loc8_.buffer.b[_loc8_.byteOffset + (_loc13_ + 1)])) & 0xFF) << 24 | (int(int(_loc8_.buffer.b[_loc8_.byteOffset + (_loc13_ + 2)])) & 0xFF) << 16 | (int(int(_loc8_.buffer.b[_loc8_.byteOffset + (_loc13_ + 3)])) & 0xFF) << 8 | int(int(_loc8_.buffer.b[_loc8_.byteOffset + _loc13_])) & 0xFF;
                              break;
                           case 2:
                              _loc22_ = (int(int(_loc8_.buffer.b[_loc8_.byteOffset + (_loc13_ + 2)])) & 0xFF) << 24 | (int(int(_loc8_.buffer.b[_loc8_.byteOffset + (_loc13_ + 1)])) & 0xFF) << 16 | (int(int(_loc8_.buffer.b[_loc8_.byteOffset + _loc13_])) & 0xFF) << 8 | int(int(_loc8_.buffer.b[_loc8_.byteOffset + (_loc13_ + 3)])) & 0xFF;
                        }
                        if(_loc24_)
                        {
                           if((_loc22_ & 0xFF) != 0 && (_loc22_ & 0xFF) != 255)
                           {
                              RGBA_Impl_.unmult = 255 / (_loc22_ & 0xFF);
                              _loc37_ = RGBA_Impl_.__clamp;
                              _loc38_ = RGBA_Impl_.__clamp;
                              _loc47_ = RGBA_Impl_.__clamp;
                              _loc22_ = (int(int(_loc37_.buffer.b[_loc37_.byteOffset + int(Math.round((_loc22_ >> 24 & 0xFF) * RGBA_Impl_.unmult))])) & 0xFF) << 24 | (int(int(_loc38_.buffer.b[_loc38_.byteOffset + int(Math.round((_loc22_ >> 16 & 0xFF) * RGBA_Impl_.unmult))])) & 0xFF) << 16 | (int(int(_loc47_.buffer.b[_loc47_.byteOffset + int(Math.round((_loc22_ >> 8 & 0xFF) * RGBA_Impl_.unmult))])) & 0xFF) << 8 | _loc22_ & 0xFF & 0xFF;
                           }
                        }
                        switch(_loc12_)
                        {
                           case 0:
                              _loc23_ = (int(int(_loc9_.buffer.b[_loc9_.byteOffset + _loc14_])) & 0xFF) << 24 | (int(int(_loc9_.buffer.b[_loc9_.byteOffset + (_loc14_ + 1)])) & 0xFF) << 16 | (int(int(_loc9_.buffer.b[_loc9_.byteOffset + (_loc14_ + 2)])) & 0xFF) << 8 | int(int(_loc9_.buffer.b[_loc9_.byteOffset + (_loc14_ + 3)])) & 0xFF;
                              break;
                           case 1:
                              _loc23_ = (int(int(_loc9_.buffer.b[_loc9_.byteOffset + (_loc14_ + 1)])) & 0xFF) << 24 | (int(int(_loc9_.buffer.b[_loc9_.byteOffset + (_loc14_ + 2)])) & 0xFF) << 16 | (int(int(_loc9_.buffer.b[_loc9_.byteOffset + (_loc14_ + 3)])) & 0xFF) << 8 | int(int(_loc9_.buffer.b[_loc9_.byteOffset + _loc14_])) & 0xFF;
                              break;
                           case 2:
                              _loc23_ = (int(int(_loc9_.buffer.b[_loc9_.byteOffset + (_loc14_ + 2)])) & 0xFF) << 24 | (int(int(_loc9_.buffer.b[_loc9_.byteOffset + (_loc14_ + 1)])) & 0xFF) << 16 | (int(int(_loc9_.buffer.b[_loc9_.byteOffset + _loc14_])) & 0xFF) << 8 | int(int(_loc9_.buffer.b[_loc9_.byteOffset + (_loc14_ + 3)])) & 0xFF;
                        }
                        if(_loc25_)
                        {
                           if((_loc23_ & 0xFF) != 0 && (_loc23_ & 0xFF) != 255)
                           {
                              RGBA_Impl_.unmult = 255 / (_loc23_ & 0xFF);
                              _loc37_ = RGBA_Impl_.__clamp;
                              _loc38_ = RGBA_Impl_.__clamp;
                              _loc47_ = RGBA_Impl_.__clamp;
                              _loc23_ = (int(int(_loc37_.buffer.b[_loc37_.byteOffset + int(Math.round((_loc23_ >> 24 & 0xFF) * RGBA_Impl_.unmult))])) & 0xFF) << 24 | (int(int(_loc38_.buffer.b[_loc38_.byteOffset + int(Math.round((_loc23_ >> 16 & 0xFF) * RGBA_Impl_.unmult))])) & 0xFF) << 16 | (int(int(_loc47_.buffer.b[_loc47_.byteOffset + int(Math.round((_loc23_ >> 8 & 0xFF) * RGBA_Impl_.unmult))])) & 0xFF) << 8 | _loc23_ & 0xFF & 0xFF;
                           }
                        }
                        switch(_loc30_)
                        {
                           case 0:
                              _loc32_ = (int(int(_loc36_.buffer.b[_loc36_.byteOffset + _loc31_])) & 0xFF) << 24 | (int(int(_loc36_.buffer.b[_loc36_.byteOffset + (_loc31_ + 1)])) & 0xFF) << 16 | (int(int(_loc36_.buffer.b[_loc36_.byteOffset + (_loc31_ + 2)])) & 0xFF) << 8 | int(int(_loc36_.buffer.b[_loc36_.byteOffset + (_loc31_ + 3)])) & 0xFF;
                              break;
                           case 1:
                              _loc32_ = (int(int(_loc36_.buffer.b[_loc36_.byteOffset + (_loc31_ + 1)])) & 0xFF) << 24 | (int(int(_loc36_.buffer.b[_loc36_.byteOffset + (_loc31_ + 2)])) & 0xFF) << 16 | (int(int(_loc36_.buffer.b[_loc36_.byteOffset + (_loc31_ + 3)])) & 0xFF) << 8 | int(int(_loc36_.buffer.b[_loc36_.byteOffset + _loc31_])) & 0xFF;
                              break;
                           case 2:
                              _loc32_ = (int(int(_loc36_.buffer.b[_loc36_.byteOffset + (_loc31_ + 2)])) & 0xFF) << 24 | (int(int(_loc36_.buffer.b[_loc36_.byteOffset + (_loc31_ + 1)])) & 0xFF) << 16 | (int(int(_loc36_.buffer.b[_loc36_.byteOffset + _loc31_])) & 0xFF) << 8 | int(int(_loc36_.buffer.b[_loc36_.byteOffset + (_loc31_ + 3)])) & 0xFF;
                        }
                        _loc18_ = (_loc32_ & 0xFF) / 255 * ((_loc22_ & 0xFF) / 255);
                        if(_loc18_ <= 0)
                        {
                           continue;
                        }
                        _loc19_ = (_loc23_ & 0xFF) / 255;
                        _loc20_ = 1 - _loc18_;
                        _loc21_ = _loc18_ + _loc19_ * _loc20_;
                        _loc37_ = RGBA_Impl_.__clamp;
                        _loc43_ = int(int(_loc37_.buffer.b[_loc37_.byteOffset + int(Math.round(((_loc22_ >> 24 & 0xFF) * _loc18_ + (_loc23_ >> 24 & 0xFF) * _loc19_ * _loc20_) / _loc21_))]));
                        _loc23_ = (_loc43_ & 0xFF) << 24 | (_loc23_ >> 16 & 0xFF & 0xFF) << 16 | (_loc23_ >> 8 & 0xFF & 0xFF) << 8 | _loc23_ & 0xFF & 0xFF;
                        _loc37_ = RGBA_Impl_.__clamp;
                        _loc43_ = int(int(_loc37_.buffer.b[_loc37_.byteOffset + int(Math.round(((_loc22_ >> 16 & 0xFF) * _loc18_ + (_loc23_ >> 16 & 0xFF) * _loc19_ * _loc20_) / _loc21_))]));
                        _loc23_ = (_loc23_ >> 24 & 0xFF & 0xFF) << 24 | (_loc43_ & 0xFF) << 16 | (_loc23_ >> 8 & 0xFF & 0xFF) << 8 | _loc23_ & 0xFF & 0xFF;
                        _loc37_ = RGBA_Impl_.__clamp;
                        _loc43_ = int(int(_loc37_.buffer.b[_loc37_.byteOffset + int(Math.round(((_loc22_ >> 8 & 0xFF) * _loc18_ + (_loc23_ >> 8 & 0xFF) * _loc19_ * _loc20_) / _loc21_))]));
                        _loc23_ = (_loc23_ >> 24 & 0xFF & 0xFF) << 24 | (_loc23_ >> 16 & 0xFF & 0xFF) << 16 | (_loc43_ & 0xFF) << 8 | _loc23_ & 0xFF & 0xFF;
                        _loc37_ = RGBA_Impl_.__clamp;
                        _loc43_ = int(int(_loc37_.buffer.b[_loc37_.byteOffset + int(Math.round(_loc21_ * 255))]));
                        _loc23_ = (_loc23_ >> 24 & 0xFF & 0xFF) << 24 | (_loc23_ >> 16 & 0xFF & 0xFF) << 16 | (_loc23_ >> 8 & 0xFF & 0xFF) << 8 | _loc43_ & 0xFF;
                        if(_loc25_)
                        {
                           if((_loc23_ & 0xFF) == 0)
                           {
                              if(_loc23_ != 0)
                              {
                                 _loc23_ = 0;
                              }
                           }
                           else if((_loc23_ & 0xFF) != 255)
                           {
                              _loc37_ = RGBA_Impl_.__alpha16;
                              _loc40_ = _loc37_.buffer;
                              _loc43_ = _loc37_.byteOffset + (_loc23_ & 0xFF) * 4;
                              _loc44_ = int(_loc40_.b[_loc43_]);
                              _loc48_ = int(_loc40_.b[_loc43_ + 1]);
                              _loc49_ = int(_loc40_.b[_loc43_ + 2]);
                              _loc50_ = int(_loc40_.b[_loc43_ + 3]);
                              RGBA_Impl_.a16 = _loc44_ | _loc48_ << 8 | _loc49_ << 16 | _loc50_ << 24;
                              _loc23_ = ((_loc23_ >> 24 & 0xFF) * RGBA_Impl_.a16 >> 16 & 0xFF) << 24 | ((_loc23_ >> 16 & 0xFF) * RGBA_Impl_.a16 >> 16 & 0xFF) << 16 | ((_loc23_ >> 8 & 0xFF) * RGBA_Impl_.a16 >> 16 & 0xFF) << 8 | _loc23_ & 0xFF & 0xFF;
                           }
                        }
                        switch(_loc12_)
                        {
                           case 0:
                              _loc45_ = uint(_loc23_ >> 24 & 0xFF);
                              _loc9_.buffer.b[_loc9_.byteOffset + _loc14_] = _loc45_;
                              _loc45_ = uint(_loc23_ >> 16 & 0xFF);
                              _loc9_.buffer.b[_loc9_.byteOffset + (_loc14_ + 1)] = _loc45_;
                              _loc45_ = uint(_loc23_ >> 8 & 0xFF);
                              _loc9_.buffer.b[_loc9_.byteOffset + (_loc14_ + 2)] = _loc45_;
                              _loc45_ = uint(_loc23_ & 0xFF);
                              _loc9_.buffer.b[_loc9_.byteOffset + (_loc14_ + 3)] = _loc45_;
                              break;
                           case 1:
                              _loc45_ = uint(_loc23_ & 0xFF);
                              _loc9_.buffer.b[_loc9_.byteOffset + _loc14_] = _loc45_;
                              _loc45_ = uint(_loc23_ >> 24 & 0xFF);
                              _loc9_.buffer.b[_loc9_.byteOffset + (_loc14_ + 1)] = _loc45_;
                              _loc45_ = uint(_loc23_ >> 16 & 0xFF);
                              _loc9_.buffer.b[_loc9_.byteOffset + (_loc14_ + 2)] = _loc45_;
                              _loc45_ = uint(_loc23_ >> 8 & 0xFF);
                              _loc9_.buffer.b[_loc9_.byteOffset + (_loc14_ + 3)] = _loc45_;
                              break;
                           case 2:
                              _loc45_ = uint(_loc23_ >> 8 & 0xFF);
                              _loc9_.buffer.b[_loc9_.byteOffset + _loc14_] = _loc45_;
                              _loc45_ = uint(_loc23_ >> 16 & 0xFF);
                              _loc9_.buffer.b[_loc9_.byteOffset + (_loc14_ + 1)] = _loc45_;
                              _loc45_ = uint(_loc23_ >> 24 & 0xFF);
                              _loc9_.buffer.b[_loc9_.byteOffset + (_loc14_ + 2)] = _loc45_;
                              _loc45_ = uint(_loc23_ & 0xFF);
                              _loc9_.buffer.b[_loc9_.byteOffset + (_loc14_ + 3)] = _loc45_;
                        }
                     }
                  }
               }
               else
               {
                  _loc33_ = 0;
                  _loc34_ = _loc17_.height;
                  while(_loc33_ < _loc34_)
                  {
                     _loc35_ = _loc33_++;
                     _loc13_ = _loc15_.byteOffset + _loc15_.stride * _loc35_;
                     _loc14_ = _loc17_.byteOffset + _loc17_.stride * _loc35_;
                     _loc31_ = _loc46_.byteOffset + _loc46_.stride * _loc35_;
                     _loc39_ = 0;
                     _loc41_ = _loc17_.width;
                     while(_loc39_ < _loc41_)
                     {
                        _loc42_ = _loc39_++;
                        switch(_loc11_)
                        {
                           case 0:
                              _loc22_ = (int(int(_loc8_.buffer.b[_loc8_.byteOffset + _loc13_])) & 0xFF) << 24 | (int(int(_loc8_.buffer.b[_loc8_.byteOffset + (_loc13_ + 1)])) & 0xFF) << 16 | (int(int(_loc8_.buffer.b[_loc8_.byteOffset + (_loc13_ + 2)])) & 0xFF) << 8 | int(int(_loc8_.buffer.b[_loc8_.byteOffset + (_loc13_ + 3)])) & 0xFF;
                              break;
                           case 1:
                              _loc22_ = (int(int(_loc8_.buffer.b[_loc8_.byteOffset + (_loc13_ + 1)])) & 0xFF) << 24 | (int(int(_loc8_.buffer.b[_loc8_.byteOffset + (_loc13_ + 2)])) & 0xFF) << 16 | (int(int(_loc8_.buffer.b[_loc8_.byteOffset + (_loc13_ + 3)])) & 0xFF) << 8 | int(int(_loc8_.buffer.b[_loc8_.byteOffset + _loc13_])) & 0xFF;
                              break;
                           case 2:
                              _loc22_ = (int(int(_loc8_.buffer.b[_loc8_.byteOffset + (_loc13_ + 2)])) & 0xFF) << 24 | (int(int(_loc8_.buffer.b[_loc8_.byteOffset + (_loc13_ + 1)])) & 0xFF) << 16 | (int(int(_loc8_.buffer.b[_loc8_.byteOffset + _loc13_])) & 0xFF) << 8 | int(int(_loc8_.buffer.b[_loc8_.byteOffset + (_loc13_ + 3)])) & 0xFF;
                        }
                        if(_loc24_)
                        {
                           if((_loc22_ & 0xFF) != 0 && (_loc22_ & 0xFF) != 255)
                           {
                              RGBA_Impl_.unmult = 255 / (_loc22_ & 0xFF);
                              _loc37_ = RGBA_Impl_.__clamp;
                              _loc38_ = RGBA_Impl_.__clamp;
                              _loc47_ = RGBA_Impl_.__clamp;
                              _loc22_ = (int(int(_loc37_.buffer.b[_loc37_.byteOffset + int(Math.round((_loc22_ >> 24 & 0xFF) * RGBA_Impl_.unmult))])) & 0xFF) << 24 | (int(int(_loc38_.buffer.b[_loc38_.byteOffset + int(Math.round((_loc22_ >> 16 & 0xFF) * RGBA_Impl_.unmult))])) & 0xFF) << 16 | (int(int(_loc47_.buffer.b[_loc47_.byteOffset + int(Math.round((_loc22_ >> 8 & 0xFF) * RGBA_Impl_.unmult))])) & 0xFF) << 8 | _loc22_ & 0xFF & 0xFF;
                           }
                        }
                        switch(_loc30_)
                        {
                           case 0:
                              _loc32_ = (int(int(_loc36_.buffer.b[_loc36_.byteOffset + _loc31_])) & 0xFF) << 24 | (int(int(_loc36_.buffer.b[_loc36_.byteOffset + (_loc31_ + 1)])) & 0xFF) << 16 | (int(int(_loc36_.buffer.b[_loc36_.byteOffset + (_loc31_ + 2)])) & 0xFF) << 8 | int(int(_loc36_.buffer.b[_loc36_.byteOffset + (_loc31_ + 3)])) & 0xFF;
                              break;
                           case 1:
                              _loc32_ = (int(int(_loc36_.buffer.b[_loc36_.byteOffset + (_loc31_ + 1)])) & 0xFF) << 24 | (int(int(_loc36_.buffer.b[_loc36_.byteOffset + (_loc31_ + 2)])) & 0xFF) << 16 | (int(int(_loc36_.buffer.b[_loc36_.byteOffset + (_loc31_ + 3)])) & 0xFF) << 8 | int(int(_loc36_.buffer.b[_loc36_.byteOffset + _loc31_])) & 0xFF;
                              break;
                           case 2:
                              _loc32_ = (int(int(_loc36_.buffer.b[_loc36_.byteOffset + (_loc31_ + 2)])) & 0xFF) << 24 | (int(int(_loc36_.buffer.b[_loc36_.byteOffset + (_loc31_ + 1)])) & 0xFF) << 16 | (int(int(_loc36_.buffer.b[_loc36_.byteOffset + _loc31_])) & 0xFF) << 8 | int(int(_loc36_.buffer.b[_loc36_.byteOffset + (_loc31_ + 3)])) & 0xFF;
                        }
                        _loc43_ = int(Math.round((_loc22_ & 0xFF) * ((_loc32_ & 0xFF) / 255)));
                        _loc22_ = (_loc22_ >> 24 & 0xFF & 0xFF) << 24 | (_loc22_ >> 16 & 0xFF & 0xFF) << 16 | (_loc22_ >> 8 & 0xFF & 0xFF) << 8 | _loc43_ & 0xFF;
                        if(_loc25_)
                        {
                           if((_loc22_ & 0xFF) == 0)
                           {
                              if(_loc22_ != 0)
                              {
                                 _loc22_ = 0;
                              }
                           }
                           else if((_loc22_ & 0xFF) != 255)
                           {
                              _loc37_ = RGBA_Impl_.__alpha16;
                              _loc40_ = _loc37_.buffer;
                              _loc43_ = _loc37_.byteOffset + (_loc22_ & 0xFF) * 4;
                              _loc44_ = int(_loc40_.b[_loc43_]);
                              _loc48_ = int(_loc40_.b[_loc43_ + 1]);
                              _loc49_ = int(_loc40_.b[_loc43_ + 2]);
                              _loc50_ = int(_loc40_.b[_loc43_ + 3]);
                              RGBA_Impl_.a16 = _loc44_ | _loc48_ << 8 | _loc49_ << 16 | _loc50_ << 24;
                              _loc22_ = ((_loc22_ >> 24 & 0xFF) * RGBA_Impl_.a16 >> 16 & 0xFF) << 24 | ((_loc22_ >> 16 & 0xFF) * RGBA_Impl_.a16 >> 16 & 0xFF) << 16 | ((_loc22_ >> 8 & 0xFF) * RGBA_Impl_.a16 >> 16 & 0xFF) << 8 | _loc22_ & 0xFF & 0xFF;
                           }
                        }
                        switch(_loc12_)
                        {
                           case 0:
                              _loc45_ = uint(_loc22_ >> 24 & 0xFF);
                              _loc9_.buffer.b[_loc9_.byteOffset + _loc14_] = _loc45_;
                              _loc45_ = uint(_loc22_ >> 16 & 0xFF);
                              _loc9_.buffer.b[_loc9_.byteOffset + (_loc14_ + 1)] = _loc45_;
                              _loc45_ = uint(_loc22_ >> 8 & 0xFF);
                              _loc9_.buffer.b[_loc9_.byteOffset + (_loc14_ + 2)] = _loc45_;
                              _loc45_ = uint(_loc22_ & 0xFF);
                              _loc9_.buffer.b[_loc9_.byteOffset + (_loc14_ + 3)] = _loc45_;
                              break;
                           case 1:
                              _loc45_ = uint(_loc22_ & 0xFF);
                              _loc9_.buffer.b[_loc9_.byteOffset + _loc14_] = _loc45_;
                              _loc45_ = uint(_loc22_ >> 24 & 0xFF);
                              _loc9_.buffer.b[_loc9_.byteOffset + (_loc14_ + 1)] = _loc45_;
                              _loc45_ = uint(_loc22_ >> 16 & 0xFF);
                              _loc9_.buffer.b[_loc9_.byteOffset + (_loc14_ + 2)] = _loc45_;
                              _loc45_ = uint(_loc22_ >> 8 & 0xFF);
                              _loc9_.buffer.b[_loc9_.byteOffset + (_loc14_ + 3)] = _loc45_;
                              break;
                           case 2:
                              _loc45_ = uint(_loc22_ >> 8 & 0xFF);
                              _loc9_.buffer.b[_loc9_.byteOffset + _loc14_] = _loc45_;
                              _loc45_ = uint(_loc22_ >> 16 & 0xFF);
                              _loc9_.buffer.b[_loc9_.byteOffset + (_loc14_ + 1)] = _loc45_;
                              _loc45_ = uint(_loc22_ >> 24 & 0xFF);
                              _loc9_.buffer.b[_loc9_.byteOffset + (_loc14_ + 2)] = _loc45_;
                              _loc45_ = uint(_loc22_ & 0xFF);
                              _loc9_.buffer.b[_loc9_.byteOffset + (_loc14_ + 3)] = _loc45_;
                        }
                        _loc13_ += 4;
                        _loc14_ += 4;
                        _loc31_ += 4;
                     }
                  }
               }
            }
         }
         param1.dirty = true;
         ++param1.version;
      }
      
      public static function fillRect(param1:Image, param2:Rectangle, param3:int, param4:int) : void
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc10_:* = null as ArrayBufferView;
         var _loc11_:* = null as Bytes;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc15_:int = 0;
         var _loc17_:int = 0;
         var _loc18_:int = 0;
         var _loc19_:int = 0;
         var _loc20_:uint = 0;
         switch(param4)
         {
            case 1:
               _loc6_ = param3;
               _loc7_ = 0;
               _loc7_ = (_loc6_ >> 16 & 0xFF & 0xFF) << 24 | (_loc6_ >> 8 & 0xFF & 0xFF) << 16 | (_loc6_ & 0xFF & 0xFF) << 8 | _loc6_ >> 24 & 0xFF & 0xFF;
               _loc5_ = _loc7_;
               break;
            case 2:
               _loc6_ = param3;
               _loc7_ = 0;
               _loc7_ = (_loc6_ >> 8 & 0xFF & 0xFF) << 24 | (_loc6_ >> 16 & 0xFF & 0xFF) << 16 | (_loc6_ >> 24 & 0xFF & 0xFF) << 8 | _loc6_ & 0xFF & 0xFF;
               _loc5_ = _loc7_;
               break;
            default:
               _loc5_ = param3;
         }
         if(!param1.get_transparent())
         {
            _loc5_ = (_loc5_ >> 24 & 0xFF & 0xFF) << 24 | (_loc5_ >> 16 & 0xFF & 0xFF) << 16 | (_loc5_ >> 8 & 0xFF & 0xFF) << 8 | 0xFF;
         }
         var _loc8_:ArrayBufferView = param1.buffer.data;
         if(_loc8_ == null)
         {
            return;
         }
         _loc6_ = param1.buffer.format;
         var _loc9_:Boolean = param1.buffer.premultiplied;
         if(_loc9_)
         {
            if((_loc5_ & 0xFF) == 0)
            {
               if(_loc5_ != 0)
               {
                  _loc5_ = 0;
               }
            }
            else if((_loc5_ & 0xFF) != 255)
            {
               _loc10_ = RGBA_Impl_.__alpha16;
               _loc11_ = _loc10_.buffer;
               _loc7_ = _loc10_.byteOffset + (_loc5_ & 0xFF) * 4;
               _loc12_ = int(_loc11_.b[_loc7_]);
               _loc13_ = int(_loc11_.b[_loc7_ + 1]);
               _loc14_ = int(_loc11_.b[_loc7_ + 2]);
               _loc15_ = int(_loc11_.b[_loc7_ + 3]);
               RGBA_Impl_.a16 = _loc12_ | _loc13_ << 8 | _loc14_ << 16 | _loc15_ << 24;
               _loc5_ = ((_loc5_ >> 24 & 0xFF) * RGBA_Impl_.a16 >> 16 & 0xFF) << 24 | ((_loc5_ >> 16 & 0xFF) * RGBA_Impl_.a16 >> 16 & 0xFF) << 16 | ((_loc5_ >> 8 & 0xFF) * RGBA_Impl_.a16 >> 16 & 0xFF) << 8 | _loc5_ & 0xFF & 0xFF;
            }
         }
         var _loc16_:ImageDataView = new ImageDataView(param1,param2);
         _loc12_ = 0;
         _loc13_ = _loc16_.height;
         while(_loc12_ < _loc13_)
         {
            _loc14_ = _loc12_++;
            _loc7_ = _loc16_.byteOffset + _loc16_.stride * _loc14_;
            _loc15_ = 0;
            _loc17_ = _loc16_.width;
            while(_loc15_ < _loc17_)
            {
               _loc18_ = _loc15_++;
               _loc19_ = _loc7_ + _loc18_ * 4;
               switch(_loc6_)
               {
                  case 0:
                     _loc20_ = uint(_loc5_ >> 24 & 0xFF);
                     _loc8_.buffer.b[_loc8_.byteOffset + _loc19_] = _loc20_;
                     _loc20_ = uint(_loc5_ >> 16 & 0xFF);
                     _loc8_.buffer.b[_loc8_.byteOffset + (_loc19_ + 1)] = _loc20_;
                     _loc20_ = uint(_loc5_ >> 8 & 0xFF);
                     _loc8_.buffer.b[_loc8_.byteOffset + (_loc19_ + 2)] = _loc20_;
                     _loc20_ = uint(_loc5_ & 0xFF);
                     _loc8_.buffer.b[_loc8_.byteOffset + (_loc19_ + 3)] = _loc20_;
                     break;
                  case 1:
                     _loc20_ = uint(_loc5_ & 0xFF);
                     _loc8_.buffer.b[_loc8_.byteOffset + _loc19_] = _loc20_;
                     _loc20_ = uint(_loc5_ >> 24 & 0xFF);
                     _loc8_.buffer.b[_loc8_.byteOffset + (_loc19_ + 1)] = _loc20_;
                     _loc20_ = uint(_loc5_ >> 16 & 0xFF);
                     _loc8_.buffer.b[_loc8_.byteOffset + (_loc19_ + 2)] = _loc20_;
                     _loc20_ = uint(_loc5_ >> 8 & 0xFF);
                     _loc8_.buffer.b[_loc8_.byteOffset + (_loc19_ + 3)] = _loc20_;
                     break;
                  case 2:
                     _loc20_ = uint(_loc5_ >> 8 & 0xFF);
                     _loc8_.buffer.b[_loc8_.byteOffset + _loc19_] = _loc20_;
                     _loc20_ = uint(_loc5_ >> 16 & 0xFF);
                     _loc8_.buffer.b[_loc8_.byteOffset + (_loc19_ + 1)] = _loc20_;
                     _loc20_ = uint(_loc5_ >> 24 & 0xFF);
                     _loc8_.buffer.b[_loc8_.byteOffset + (_loc19_ + 2)] = _loc20_;
                     _loc20_ = uint(_loc5_ & 0xFF);
                     _loc8_.buffer.b[_loc8_.byteOffset + (_loc19_ + 3)] = _loc20_;
               }
            }
         }
         param1.dirty = true;
         ++param1.version;
      }
      
      public static function floodFill(param1:Image, param2:int, param3:int, param4:int, param5:int) : void
      {
         var _loc11_:int = 0;
         var _loc12_:* = null as ArrayBufferView;
         var _loc13_:* = null as ArrayBufferView;
         var _loc14_:* = null as ArrayBufferView;
         var _loc15_:* = null as Bytes;
         var _loc16_:int = 0;
         var _loc17_:int = 0;
         var _loc18_:int = 0;
         var _loc19_:int = 0;
         var _loc23_:* = null as Object;
         var _loc24_:* = null as Object;
         var _loc25_:int = 0;
         var _loc26_:int = 0;
         var _loc28_:int = 0;
         var _loc29_:int = 0;
         var _loc30_:uint = 0;
         var _loc6_:ArrayBufferView = param1.buffer.data;
         if(_loc6_ == null)
         {
            return;
         }
         if(param5 == 1)
         {
            param4 = (param4 & 0xFFFFFF) << 8 | param4 >> 24 & 0xFF;
         }
         var _loc7_:int = param1.buffer.format;
         var _loc8_:Boolean = param1.buffer.premultiplied;
         var _loc9_:int = param4;
         var _loc10_:int = 0;
         _loc11_ = (param3 + param1.offsetY) * (param1.buffer.width * 4) + (param2 + param1.offsetX) * 4;
         switch(_loc7_)
         {
            case 0:
               _loc10_ = (int(int(_loc6_.buffer.b[_loc6_.byteOffset + _loc11_])) & 0xFF) << 24 | (int(int(_loc6_.buffer.b[_loc6_.byteOffset + (_loc11_ + 1)])) & 0xFF) << 16 | (int(int(_loc6_.buffer.b[_loc6_.byteOffset + (_loc11_ + 2)])) & 0xFF) << 8 | int(int(_loc6_.buffer.b[_loc6_.byteOffset + (_loc11_ + 3)])) & 0xFF;
               break;
            case 1:
               _loc10_ = (int(int(_loc6_.buffer.b[_loc6_.byteOffset + (_loc11_ + 1)])) & 0xFF) << 24 | (int(int(_loc6_.buffer.b[_loc6_.byteOffset + (_loc11_ + 2)])) & 0xFF) << 16 | (int(int(_loc6_.buffer.b[_loc6_.byteOffset + (_loc11_ + 3)])) & 0xFF) << 8 | int(int(_loc6_.buffer.b[_loc6_.byteOffset + _loc11_])) & 0xFF;
               break;
            case 2:
               _loc10_ = (int(int(_loc6_.buffer.b[_loc6_.byteOffset + (_loc11_ + 2)])) & 0xFF) << 24 | (int(int(_loc6_.buffer.b[_loc6_.byteOffset + (_loc11_ + 1)])) & 0xFF) << 16 | (int(int(_loc6_.buffer.b[_loc6_.byteOffset + _loc11_])) & 0xFF) << 8 | int(int(_loc6_.buffer.b[_loc6_.byteOffset + (_loc11_ + 3)])) & 0xFF;
         }
         if(_loc8_)
         {
            if((_loc10_ & 0xFF) != 0 && (_loc10_ & 0xFF) != 255)
            {
               RGBA_Impl_.unmult = 255 / (_loc10_ & 0xFF);
               _loc12_ = RGBA_Impl_.__clamp;
               _loc13_ = RGBA_Impl_.__clamp;
               _loc14_ = RGBA_Impl_.__clamp;
               _loc10_ = (int(int(_loc12_.buffer.b[_loc12_.byteOffset + int(Math.round((_loc10_ >> 24 & 0xFF) * RGBA_Impl_.unmult))])) & 0xFF) << 24 | (int(int(_loc13_.buffer.b[_loc13_.byteOffset + int(Math.round((_loc10_ >> 16 & 0xFF) * RGBA_Impl_.unmult))])) & 0xFF) << 16 | (int(int(_loc14_.buffer.b[_loc14_.byteOffset + int(Math.round((_loc10_ >> 8 & 0xFF) * RGBA_Impl_.unmult))])) & 0xFF) << 8 | _loc10_ & 0xFF & 0xFF;
            }
         }
         if(!param1.get_transparent())
         {
            _loc9_ = (_loc9_ >> 24 & 0xFF & 0xFF) << 24 | (_loc9_ >> 16 & 0xFF & 0xFF) << 16 | (_loc9_ >> 8 & 0xFF & 0xFF) << 8 | 0xFF;
            _loc10_ = (_loc10_ >> 24 & 0xFF & 0xFF) << 24 | (_loc10_ >> 16 & 0xFF & 0xFF) << 16 | (_loc10_ >> 8 & 0xFF & 0xFF) << 8 | 0xFF;
         }
         if(_loc9_ == _loc10_)
         {
            return;
         }
         if(_loc8_)
         {
            if((_loc9_ & 0xFF) == 0)
            {
               if(_loc9_ != 0)
               {
                  _loc9_ = 0;
               }
            }
            else if((_loc9_ & 0xFF) != 255)
            {
               _loc12_ = RGBA_Impl_.__alpha16;
               _loc15_ = _loc12_.buffer;
               _loc11_ = _loc12_.byteOffset + (_loc9_ & 0xFF) * 4;
               _loc16_ = int(_loc15_.b[_loc11_]);
               _loc17_ = int(_loc15_.b[_loc11_ + 1]);
               _loc18_ = int(_loc15_.b[_loc11_ + 2]);
               _loc19_ = int(_loc15_.b[_loc11_ + 3]);
               RGBA_Impl_.a16 = _loc16_ | _loc17_ << 8 | _loc18_ << 16 | _loc19_ << 24;
               _loc9_ = ((_loc9_ >> 24 & 0xFF) * RGBA_Impl_.a16 >> 16 & 0xFF) << 24 | ((_loc9_ >> 16 & 0xFF) * RGBA_Impl_.a16 >> 16 & 0xFF) << 16 | ((_loc9_ >> 8 & 0xFF) * RGBA_Impl_.a16 >> 16 & 0xFF) << 8 | _loc9_ & 0xFF & 0xFF;
            }
         }
         var _loc20_:Array = [0,-1,1,0];
         var _loc21_:Array = [-1,0,0,1];
         _loc11_ = -param1.offsetX;
         _loc16_ = -param1.offsetY;
         _loc17_ = _loc11_ + param1.width;
         _loc18_ = _loc16_ + param1.height;
         var _loc22_:Array = [];
         _loc22_.push(param2);
         _loc22_.push(param3);
         var _loc27_:int = 0;
         while(int(_loc22_.length) > 0)
         {
            _loc24_ = _loc22_.pop();
            _loc23_ = _loc22_.pop();
            _loc28_ = 0;
            while(_loc28_ < 4)
            {
               _loc29_ = _loc28_++;
               _loc19_ = int(_loc23_ + int(_loc20_[_loc29_]));
               _loc25_ = int(_loc24_ + int(_loc21_[_loc29_]));
               if(!(_loc19_ < _loc11_ || _loc25_ < _loc16_ || _loc19_ >= _loc17_ || _loc25_ >= _loc18_))
               {
                  _loc26_ = (_loc25_ * param1.width + _loc19_) * 4;
                  switch(_loc7_)
                  {
                     case 0:
                        _loc27_ = (int(int(_loc6_.buffer.b[_loc6_.byteOffset + _loc26_])) & 0xFF) << 24 | (int(int(_loc6_.buffer.b[_loc6_.byteOffset + (_loc26_ + 1)])) & 0xFF) << 16 | (int(int(_loc6_.buffer.b[_loc6_.byteOffset + (_loc26_ + 2)])) & 0xFF) << 8 | int(int(_loc6_.buffer.b[_loc6_.byteOffset + (_loc26_ + 3)])) & 0xFF;
                        break;
                     case 1:
                        _loc27_ = (int(int(_loc6_.buffer.b[_loc6_.byteOffset + (_loc26_ + 1)])) & 0xFF) << 24 | (int(int(_loc6_.buffer.b[_loc6_.byteOffset + (_loc26_ + 2)])) & 0xFF) << 16 | (int(int(_loc6_.buffer.b[_loc6_.byteOffset + (_loc26_ + 3)])) & 0xFF) << 8 | int(int(_loc6_.buffer.b[_loc6_.byteOffset + _loc26_])) & 0xFF;
                        break;
                     case 2:
                        _loc27_ = (int(int(_loc6_.buffer.b[_loc6_.byteOffset + (_loc26_ + 2)])) & 0xFF) << 24 | (int(int(_loc6_.buffer.b[_loc6_.byteOffset + (_loc26_ + 1)])) & 0xFF) << 16 | (int(int(_loc6_.buffer.b[_loc6_.byteOffset + _loc26_])) & 0xFF) << 8 | int(int(_loc6_.buffer.b[_loc6_.byteOffset + (_loc26_ + 3)])) & 0xFF;
                  }
                  if(_loc8_)
                  {
                     if((_loc27_ & 0xFF) != 0 && (_loc27_ & 0xFF) != 255)
                     {
                        RGBA_Impl_.unmult = 255 / (_loc27_ & 0xFF);
                        _loc12_ = RGBA_Impl_.__clamp;
                        _loc13_ = RGBA_Impl_.__clamp;
                        _loc14_ = RGBA_Impl_.__clamp;
                        _loc27_ = (int(int(_loc12_.buffer.b[_loc12_.byteOffset + int(Math.round((_loc27_ >> 24 & 0xFF) * RGBA_Impl_.unmult))])) & 0xFF) << 24 | (int(int(_loc13_.buffer.b[_loc13_.byteOffset + int(Math.round((_loc27_ >> 16 & 0xFF) * RGBA_Impl_.unmult))])) & 0xFF) << 16 | (int(int(_loc14_.buffer.b[_loc14_.byteOffset + int(Math.round((_loc27_ >> 8 & 0xFF) * RGBA_Impl_.unmult))])) & 0xFF) << 8 | _loc27_ & 0xFF & 0xFF;
                     }
                  }
                  if(_loc27_ == _loc10_)
                  {
                     switch(_loc7_)
                     {
                        case 0:
                           _loc30_ = uint(_loc9_ >> 24 & 0xFF);
                           _loc6_.buffer.b[_loc6_.byteOffset + _loc26_] = _loc30_;
                           _loc30_ = uint(_loc9_ >> 16 & 0xFF);
                           _loc6_.buffer.b[_loc6_.byteOffset + (_loc26_ + 1)] = _loc30_;
                           _loc30_ = uint(_loc9_ >> 8 & 0xFF);
                           _loc6_.buffer.b[_loc6_.byteOffset + (_loc26_ + 2)] = _loc30_;
                           _loc30_ = uint(_loc9_ & 0xFF);
                           _loc6_.buffer.b[_loc6_.byteOffset + (_loc26_ + 3)] = _loc30_;
                           break;
                        case 1:
                           _loc30_ = uint(_loc9_ & 0xFF);
                           _loc6_.buffer.b[_loc6_.byteOffset + _loc26_] = _loc30_;
                           _loc30_ = uint(_loc9_ >> 24 & 0xFF);
                           _loc6_.buffer.b[_loc6_.byteOffset + (_loc26_ + 1)] = _loc30_;
                           _loc30_ = uint(_loc9_ >> 16 & 0xFF);
                           _loc6_.buffer.b[_loc6_.byteOffset + (_loc26_ + 2)] = _loc30_;
                           _loc30_ = uint(_loc9_ >> 8 & 0xFF);
                           _loc6_.buffer.b[_loc6_.byteOffset + (_loc26_ + 3)] = _loc30_;
                           break;
                        case 2:
                           _loc30_ = uint(_loc9_ >> 8 & 0xFF);
                           _loc6_.buffer.b[_loc6_.byteOffset + _loc26_] = _loc30_;
                           _loc30_ = uint(_loc9_ >> 16 & 0xFF);
                           _loc6_.buffer.b[_loc6_.byteOffset + (_loc26_ + 1)] = _loc30_;
                           _loc30_ = uint(_loc9_ >> 24 & 0xFF);
                           _loc6_.buffer.b[_loc6_.byteOffset + (_loc26_ + 2)] = _loc30_;
                           _loc30_ = uint(_loc9_ & 0xFF);
                           _loc6_.buffer.b[_loc6_.byteOffset + (_loc26_ + 3)] = _loc30_;
                     }
                     _loc22_.push(_loc19_);
                     _loc22_.push(_loc25_);
                  }
               }
            }
         }
         param1.dirty = true;
         ++param1.version;
      }
      
      public static function gaussianBlur(param1:Image, param2:Image, param3:Rectangle, param4:Vector2, param5:Number = 4, param6:Number = 4, param7:int = 1, param8:Number = 1, param9:Object = undefined) : Image
      {
         var _loc10_:Boolean = param1.get_premultiplied();
         if(_loc10_)
         {
            param1.set_premultiplied(false);
         }
         StackBlur.blur(param1,param2,param3,param4,param5,param6,param7);
         param1.dirty = true;
         ++param1.version;
         if(_loc10_)
         {
            param1.set_premultiplied(true);
         }
         return param1;
      }
      
      public static function getColorBoundsRect(param1:Image, param2:int, param3:int, param4:Boolean, param5:int) : Rectangle
      {
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc15_:int = 0;
         var _loc16_:Boolean = false;
         var _loc17_:int = 0;
         var _loc18_:int = 0;
         var _loc19_:int = 0;
         var _loc20_:int = 0;
         var _loc21_:int = 0;
         var _loc6_:int = param1.width + 1;
         var _loc7_:int = 0;
         var _loc8_:int = param1.height + 1;
         var _loc9_:int = 0;
         switch(param5)
         {
            case 1:
               _loc12_ = param3;
               _loc13_ = 0;
               _loc13_ = (_loc12_ >> 16 & 0xFF & 0xFF) << 24 | (_loc12_ >> 8 & 0xFF & 0xFF) << 16 | (_loc12_ & 0xFF & 0xFF) << 8 | _loc12_ >> 24 & 0xFF & 0xFF;
               _loc10_ = _loc13_;
               _loc14_ = param2;
               _loc15_ = 0;
               _loc15_ = (_loc14_ >> 16 & 0xFF & 0xFF) << 24 | (_loc14_ >> 8 & 0xFF & 0xFF) << 16 | (_loc14_ & 0xFF & 0xFF) << 8 | _loc14_ >> 24 & 0xFF & 0xFF;
               _loc11_ = _loc15_;
               break;
            case 2:
               _loc12_ = param3;
               _loc13_ = 0;
               _loc13_ = (_loc12_ >> 8 & 0xFF & 0xFF) << 24 | (_loc12_ >> 16 & 0xFF & 0xFF) << 16 | (_loc12_ >> 24 & 0xFF & 0xFF) << 8 | _loc12_ & 0xFF & 0xFF;
               _loc10_ = _loc13_;
               _loc14_ = param2;
               _loc15_ = 0;
               _loc15_ = (_loc14_ >> 8 & 0xFF & 0xFF) << 24 | (_loc14_ >> 16 & 0xFF & 0xFF) << 16 | (_loc14_ >> 24 & 0xFF & 0xFF) << 8 | _loc14_ & 0xFF & 0xFF;
               _loc11_ = _loc15_;
               break;
            default:
               _loc10_ = param3;
               _loc11_ = param2;
         }
         if(!param1.get_transparent())
         {
            _loc10_ = (_loc10_ >> 24 & 0xFF & 0xFF) << 24 | (_loc10_ >> 16 & 0xFF & 0xFF) << 16 | (_loc10_ >> 8 & 0xFF & 0xFF) << 8 | 0xFF;
            _loc11_ = (_loc11_ >> 24 & 0xFF & 0xFF) << 24 | (_loc11_ >> 16 & 0xFF & 0xFF) << 16 | (_loc11_ >> 8 & 0xFF & 0xFF) << 8 | 0xFF;
         }
         _loc13_ = 0;
         _loc14_ = param1.width;
         while(_loc13_ < _loc14_)
         {
            _loc15_ = _loc13_++;
            _loc16_ = false;
            _loc17_ = 0;
            _loc18_ = param1.height;
            while(_loc17_ < _loc18_)
            {
               _loc19_ = _loc17_++;
               _loc12_ = param1.getPixel32(_loc15_,_loc19_,0);
               _loc16_ = param4 ? (_loc12_ & _loc11_) == _loc10_ : (_loc12_ & _loc11_) != _loc10_;
               if(_loc16_)
               {
                  if(_loc15_ < _loc6_)
                  {
                     _loc6_ = _loc15_;
                  }
                  break;
               }
            }
            if(_loc16_)
            {
               break;
            }
         }
         _loc14_ = 0;
         _loc15_ = param1.width;
         while(_loc14_ < _loc15_)
         {
            _loc17_ = _loc14_++;
            _loc13_ = param1.width - 1 - _loc17_;
            _loc16_ = false;
            _loc18_ = 0;
            _loc19_ = param1.height;
            while(_loc18_ < _loc19_)
            {
               _loc20_ = _loc18_++;
               _loc12_ = param1.getPixel32(_loc13_,_loc20_,0);
               _loc16_ = param4 ? (_loc12_ & _loc11_) == _loc10_ : (_loc12_ & _loc11_) != _loc10_;
               if(_loc16_)
               {
                  if(_loc13_ > _loc7_)
                  {
                     _loc7_ = _loc13_;
                  }
                  break;
               }
            }
            if(_loc16_)
            {
               break;
            }
         }
         _loc14_ = 0;
         _loc15_ = param1.height;
         while(_loc14_ < _loc15_)
         {
            _loc17_ = _loc14_++;
            _loc16_ = false;
            _loc18_ = 0;
            _loc19_ = param1.width;
            while(_loc18_ < _loc19_)
            {
               _loc20_ = _loc18_++;
               _loc12_ = param1.getPixel32(_loc20_,_loc17_,0);
               _loc16_ = param4 ? (_loc12_ & _loc11_) == _loc10_ : (_loc12_ & _loc11_) != _loc10_;
               if(_loc16_)
               {
                  if(_loc17_ < _loc8_)
                  {
                     _loc8_ = _loc17_;
                  }
                  break;
               }
            }
            if(_loc16_)
            {
               break;
            }
         }
         _loc15_ = 0;
         _loc17_ = param1.height;
         while(_loc15_ < _loc17_)
         {
            _loc18_ = _loc15_++;
            _loc14_ = param1.height - 1 - _loc18_;
            _loc16_ = false;
            _loc19_ = 0;
            _loc20_ = param1.width;
            while(_loc19_ < _loc20_)
            {
               _loc21_ = _loc19_++;
               _loc12_ = param1.getPixel32(_loc21_,_loc14_,0);
               _loc16_ = param4 ? (_loc12_ & _loc11_) == _loc10_ : (_loc12_ & _loc11_) != _loc10_;
               if(_loc16_)
               {
                  if(_loc14_ > _loc9_)
                  {
                     _loc9_ = _loc14_;
                  }
                  break;
               }
            }
            if(_loc16_)
            {
               break;
            }
         }
         _loc15_ = _loc7_ - _loc6_;
         _loc17_ = _loc9_ - _loc8_;
         if(_loc15_ > 0)
         {
            _loc15_++;
         }
         if(_loc17_ > 0)
         {
            _loc17_++;
         }
         if(_loc15_ < 0)
         {
            _loc15_ = 0;
         }
         if(_loc17_ < 0)
         {
            _loc17_ = 0;
         }
         if(_loc6_ == _loc7_)
         {
            _loc15_ = 1;
         }
         if(_loc8_ == _loc9_)
         {
            _loc17_ = 1;
         }
         if(_loc6_ > param1.width)
         {
            _loc6_ = 0;
         }
         if(_loc8_ > param1.height)
         {
            _loc8_ = 0;
         }
         return new Rectangle(_loc6_,_loc8_,_loc15_,_loc17_);
      }
      
      public static function getPixel(param1:Image, param2:int, param3:int, param4:int) : int
      {
         var _loc7_:int = 0;
         var _loc9_:* = null as ArrayBufferView;
         var _loc10_:* = null as ArrayBufferView;
         var _loc11_:* = null as ArrayBufferView;
         var _loc5_:int = 0;
         var _loc6_:ArrayBufferView = param1.buffer.data;
         _loc7_ = 4 * (param3 + param1.offsetY) * param1.buffer.width + (param2 + param1.offsetX) * 4;
         var _loc8_:Boolean = param1.buffer.premultiplied;
         switch(param1.buffer.format)
         {
            case 0:
               _loc5_ = (int(int(_loc6_.buffer.b[_loc6_.byteOffset + _loc7_])) & 0xFF) << 24 | (int(int(_loc6_.buffer.b[_loc6_.byteOffset + (_loc7_ + 1)])) & 0xFF) << 16 | (int(int(_loc6_.buffer.b[_loc6_.byteOffset + (_loc7_ + 2)])) & 0xFF) << 8 | int(int(_loc6_.buffer.b[_loc6_.byteOffset + (_loc7_ + 3)])) & 0xFF;
               break;
            case 1:
               _loc5_ = (int(int(_loc6_.buffer.b[_loc6_.byteOffset + (_loc7_ + 1)])) & 0xFF) << 24 | (int(int(_loc6_.buffer.b[_loc6_.byteOffset + (_loc7_ + 2)])) & 0xFF) << 16 | (int(int(_loc6_.buffer.b[_loc6_.byteOffset + (_loc7_ + 3)])) & 0xFF) << 8 | int(int(_loc6_.buffer.b[_loc6_.byteOffset + _loc7_])) & 0xFF;
               break;
            case 2:
               _loc5_ = (int(int(_loc6_.buffer.b[_loc6_.byteOffset + (_loc7_ + 2)])) & 0xFF) << 24 | (int(int(_loc6_.buffer.b[_loc6_.byteOffset + (_loc7_ + 1)])) & 0xFF) << 16 | (int(int(_loc6_.buffer.b[_loc6_.byteOffset + _loc7_])) & 0xFF) << 8 | int(int(_loc6_.buffer.b[_loc6_.byteOffset + (_loc7_ + 3)])) & 0xFF;
         }
         if(_loc8_)
         {
            if((_loc5_ & 0xFF) != 0 && (_loc5_ & 0xFF) != 255)
            {
               RGBA_Impl_.unmult = 255 / (_loc5_ & 0xFF);
               _loc9_ = RGBA_Impl_.__clamp;
               _loc10_ = RGBA_Impl_.__clamp;
               _loc11_ = RGBA_Impl_.__clamp;
               _loc5_ = (int(int(_loc9_.buffer.b[_loc9_.byteOffset + int(Math.round((_loc5_ >> 24 & 0xFF) * RGBA_Impl_.unmult))])) & 0xFF) << 24 | (int(int(_loc10_.buffer.b[_loc10_.byteOffset + int(Math.round((_loc5_ >> 16 & 0xFF) * RGBA_Impl_.unmult))])) & 0xFF) << 16 | (int(int(_loc11_.buffer.b[_loc11_.byteOffset + int(Math.round((_loc5_ >> 8 & 0xFF) * RGBA_Impl_.unmult))])) & 0xFF) << 8 | _loc5_ & 0xFF & 0xFF;
            }
         }
         _loc5_ = (_loc5_ >> 24 & 0xFF & 0xFF) << 24 | (_loc5_ >> 16 & 0xFF & 0xFF) << 16 | (_loc5_ >> 8 & 0xFF & 0xFF) << 8 | 0;
         switch(param4)
         {
            case 1:
               _loc7_ = 0;
               return (_loc5_ & 0xFF & 0xFF) << 24 | (_loc5_ >> 24 & 0xFF & 0xFF) << 16 | (_loc5_ >> 16 & 0xFF & 0xFF) << 8 | _loc5_ >> 8 & 0xFF & 0xFF;
            case 2:
               _loc7_ = 0;
               return (_loc5_ >> 8 & 0xFF & 0xFF) << 24 | (_loc5_ >> 16 & 0xFF & 0xFF) << 16 | (_loc5_ >> 24 & 0xFF & 0xFF) << 8 | _loc5_ & 0xFF & 0xFF;
            default:
               return _loc5_;
         }
      }
      
      public static function getPixel32(param1:Image, param2:int, param3:int, param4:int) : int
      {
         var _loc7_:int = 0;
         var _loc9_:* = null as ArrayBufferView;
         var _loc10_:* = null as ArrayBufferView;
         var _loc11_:* = null as ArrayBufferView;
         var _loc5_:int = 0;
         var _loc6_:ArrayBufferView = param1.buffer.data;
         _loc7_ = 4 * (param3 + param1.offsetY) * param1.buffer.width + (param2 + param1.offsetX) * 4;
         var _loc8_:Boolean = param1.buffer.premultiplied;
         switch(param1.buffer.format)
         {
            case 0:
               _loc5_ = (int(int(_loc6_.buffer.b[_loc6_.byteOffset + _loc7_])) & 0xFF) << 24 | (int(int(_loc6_.buffer.b[_loc6_.byteOffset + (_loc7_ + 1)])) & 0xFF) << 16 | (int(int(_loc6_.buffer.b[_loc6_.byteOffset + (_loc7_ + 2)])) & 0xFF) << 8 | int(int(_loc6_.buffer.b[_loc6_.byteOffset + (_loc7_ + 3)])) & 0xFF;
               break;
            case 1:
               _loc5_ = (int(int(_loc6_.buffer.b[_loc6_.byteOffset + (_loc7_ + 1)])) & 0xFF) << 24 | (int(int(_loc6_.buffer.b[_loc6_.byteOffset + (_loc7_ + 2)])) & 0xFF) << 16 | (int(int(_loc6_.buffer.b[_loc6_.byteOffset + (_loc7_ + 3)])) & 0xFF) << 8 | int(int(_loc6_.buffer.b[_loc6_.byteOffset + _loc7_])) & 0xFF;
               break;
            case 2:
               _loc5_ = (int(int(_loc6_.buffer.b[_loc6_.byteOffset + (_loc7_ + 2)])) & 0xFF) << 24 | (int(int(_loc6_.buffer.b[_loc6_.byteOffset + (_loc7_ + 1)])) & 0xFF) << 16 | (int(int(_loc6_.buffer.b[_loc6_.byteOffset + _loc7_])) & 0xFF) << 8 | int(int(_loc6_.buffer.b[_loc6_.byteOffset + (_loc7_ + 3)])) & 0xFF;
         }
         if(_loc8_)
         {
            if((_loc5_ & 0xFF) != 0 && (_loc5_ & 0xFF) != 255)
            {
               RGBA_Impl_.unmult = 255 / (_loc5_ & 0xFF);
               _loc9_ = RGBA_Impl_.__clamp;
               _loc10_ = RGBA_Impl_.__clamp;
               _loc11_ = RGBA_Impl_.__clamp;
               _loc5_ = (int(int(_loc9_.buffer.b[_loc9_.byteOffset + int(Math.round((_loc5_ >> 24 & 0xFF) * RGBA_Impl_.unmult))])) & 0xFF) << 24 | (int(int(_loc10_.buffer.b[_loc10_.byteOffset + int(Math.round((_loc5_ >> 16 & 0xFF) * RGBA_Impl_.unmult))])) & 0xFF) << 16 | (int(int(_loc11_.buffer.b[_loc11_.byteOffset + int(Math.round((_loc5_ >> 8 & 0xFF) * RGBA_Impl_.unmult))])) & 0xFF) << 8 | _loc5_ & 0xFF & 0xFF;
            }
         }
         switch(param4)
         {
            case 1:
               _loc7_ = 0;
               return (_loc5_ & 0xFF & 0xFF) << 24 | (_loc5_ >> 24 & 0xFF & 0xFF) << 16 | (_loc5_ >> 16 & 0xFF & 0xFF) << 8 | _loc5_ >> 8 & 0xFF & 0xFF;
            case 2:
               _loc7_ = 0;
               return (_loc5_ >> 8 & 0xFF & 0xFF) << 24 | (_loc5_ >> 16 & 0xFF & 0xFF) << 16 | (_loc5_ >> 24 & 0xFF & 0xFF) << 8 | _loc5_ & 0xFF & 0xFF;
            default:
               return _loc5_;
         }
      }
      
      public static function getPixels(param1:Image, param2:Rectangle, param3:int) : Bytes
      {
         var _loc10_:int = 0;
         var _loc17_:int = 0;
         var _loc18_:int = 0;
         var _loc19_:int = 0;
         var _loc20_:int = 0;
         var _loc21_:* = null as ArrayBufferView;
         var _loc22_:* = null as ArrayBufferView;
         var _loc23_:* = null as ArrayBufferView;
         var _loc24_:int = 0;
         if(param1.buffer.data == null)
         {
            return null;
         }
         var _loc4_:int = int(param2.width * param2.height);
         var _loc5_:Bytes = Bytes.alloc(_loc4_ * 4);
         var _loc6_:ArrayBufferView = param1.buffer.data;
         var _loc7_:int = param1.buffer.format;
         var _loc8_:Boolean = param1.buffer.premultiplied;
         var _loc9_:ImageDataView = new ImageDataView(param1,param2);
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc15_:int = 0;
         var _loc16_:int = _loc9_.height;
         while(_loc15_ < _loc16_)
         {
            _loc17_ = _loc15_++;
            _loc10_ = _loc9_.byteOffset + _loc9_.stride * _loc17_;
            _loc18_ = 0;
            _loc19_ = _loc9_.width;
            while(_loc18_ < _loc19_)
            {
               _loc20_ = _loc18_++;
               switch(_loc7_)
               {
                  case 0:
                     _loc13_ = (int(int(_loc6_.buffer.b[_loc6_.byteOffset + _loc10_])) & 0xFF) << 24 | (int(int(_loc6_.buffer.b[_loc6_.byteOffset + (_loc10_ + 1)])) & 0xFF) << 16 | (int(int(_loc6_.buffer.b[_loc6_.byteOffset + (_loc10_ + 2)])) & 0xFF) << 8 | int(int(_loc6_.buffer.b[_loc6_.byteOffset + (_loc10_ + 3)])) & 0xFF;
                     break;
                  case 1:
                     _loc13_ = (int(int(_loc6_.buffer.b[_loc6_.byteOffset + (_loc10_ + 1)])) & 0xFF) << 24 | (int(int(_loc6_.buffer.b[_loc6_.byteOffset + (_loc10_ + 2)])) & 0xFF) << 16 | (int(int(_loc6_.buffer.b[_loc6_.byteOffset + (_loc10_ + 3)])) & 0xFF) << 8 | int(int(_loc6_.buffer.b[_loc6_.byteOffset + _loc10_])) & 0xFF;
                     break;
                  case 2:
                     _loc13_ = (int(int(_loc6_.buffer.b[_loc6_.byteOffset + (_loc10_ + 2)])) & 0xFF) << 24 | (int(int(_loc6_.buffer.b[_loc6_.byteOffset + (_loc10_ + 1)])) & 0xFF) << 16 | (int(int(_loc6_.buffer.b[_loc6_.byteOffset + _loc10_])) & 0xFF) << 8 | int(int(_loc6_.buffer.b[_loc6_.byteOffset + (_loc10_ + 3)])) & 0xFF;
               }
               if(_loc8_)
               {
                  if((_loc13_ & 0xFF) != 0 && (_loc13_ & 0xFF) != 255)
                  {
                     RGBA_Impl_.unmult = 255 / (_loc13_ & 0xFF);
                     _loc21_ = RGBA_Impl_.__clamp;
                     _loc22_ = RGBA_Impl_.__clamp;
                     _loc23_ = RGBA_Impl_.__clamp;
                     _loc13_ = (int(int(_loc21_.buffer.b[_loc21_.byteOffset + int(Math.round((_loc13_ >> 24 & 0xFF) * RGBA_Impl_.unmult))])) & 0xFF) << 24 | (int(int(_loc22_.buffer.b[_loc22_.byteOffset + int(Math.round((_loc13_ >> 16 & 0xFF) * RGBA_Impl_.unmult))])) & 0xFF) << 16 | (int(int(_loc23_.buffer.b[_loc23_.byteOffset + int(Math.round((_loc13_ >> 8 & 0xFF) * RGBA_Impl_.unmult))])) & 0xFF) << 8 | _loc13_ & 0xFF & 0xFF;
                  }
               }
               switch(param3)
               {
                  case 1:
                     _loc24_ = 0;
                     _loc24_ = (_loc13_ & 0xFF & 0xFF) << 24 | (_loc13_ >> 24 & 0xFF & 0xFF) << 16 | (_loc13_ >> 16 & 0xFF & 0xFF) << 8 | _loc13_ >> 8 & 0xFF & 0xFF;
                     _loc11_ = _loc24_;
                     _loc13_ = _loc11_;
                     break;
                  case 2:
                     _loc24_ = 0;
                     _loc24_ = (_loc13_ >> 8 & 0xFF & 0xFF) << 24 | (_loc13_ >> 16 & 0xFF & 0xFF) << 16 | (_loc13_ >> 24 & 0xFF & 0xFF) << 8 | _loc13_ & 0xFF & 0xFF;
                     _loc12_ = _loc24_;
                     _loc13_ = _loc12_;
               }
               _loc5_.b[_loc14_++] = _loc13_ >> 24 & 0xFF;
               _loc5_.b[_loc14_++] = _loc13_ >> 16 & 0xFF;
               _loc5_.b[_loc14_++] = _loc13_ >> 8 & 0xFF;
               _loc5_.b[_loc14_++] = _loc13_ & 0xFF;
               _loc10_ += 4;
            }
         }
         return _loc5_;
      }
      
      public static function merge(param1:Image, param2:Image, param3:Rectangle, param4:Vector2, param5:int, param6:int, param7:int, param8:int) : void
      {
         var _loc17_:int = 0;
         var _loc18_:int = 0;
         var _loc23_:int = 0;
         var _loc24_:int = 0;
         var _loc25_:int = 0;
         var _loc26_:int = 0;
         var _loc27_:* = null as ArrayBufferView;
         var _loc28_:* = null as ArrayBufferView;
         var _loc29_:* = null as ArrayBufferView;
         var _loc30_:int = 0;
         var _loc31_:* = null as Bytes;
         var _loc32_:int = 0;
         var _loc33_:int = 0;
         var _loc34_:int = 0;
         var _loc35_:int = 0;
         var _loc36_:uint = 0;
         if(param1.buffer.data == null || param2.buffer.data == null)
         {
            return;
         }
         var _loc9_:ImageDataView = new ImageDataView(param2,param3);
         var _loc10_:ImageDataView = new ImageDataView(param1,new Rectangle(param4.x,param4.y,_loc9_.width,_loc9_.height));
         var _loc11_:ArrayBufferView = param2.buffer.data;
         var _loc12_:ArrayBufferView = param1.buffer.data;
         var _loc13_:int = param2.buffer.format;
         var _loc14_:int = param1.buffer.format;
         var _loc15_:Boolean = param2.buffer.premultiplied;
         var _loc16_:Boolean = param1.buffer.premultiplied;
         var _loc19_:int = 0;
         var _loc20_:int = 0;
         var _loc21_:int = 0;
         var _loc22_:int = _loc10_.height;
         while(_loc21_ < _loc22_)
         {
            _loc23_ = _loc21_++;
            _loc17_ = _loc9_.byteOffset + _loc9_.stride * _loc23_;
            _loc18_ = _loc10_.byteOffset + _loc10_.stride * _loc23_;
            _loc24_ = 0;
            _loc25_ = _loc10_.width;
            while(_loc24_ < _loc25_)
            {
               _loc26_ = _loc24_++;
               switch(_loc13_)
               {
                  case 0:
                     _loc19_ = (int(int(_loc11_.buffer.b[_loc11_.byteOffset + _loc17_])) & 0xFF) << 24 | (int(int(_loc11_.buffer.b[_loc11_.byteOffset + (_loc17_ + 1)])) & 0xFF) << 16 | (int(int(_loc11_.buffer.b[_loc11_.byteOffset + (_loc17_ + 2)])) & 0xFF) << 8 | int(int(_loc11_.buffer.b[_loc11_.byteOffset + (_loc17_ + 3)])) & 0xFF;
                     break;
                  case 1:
                     _loc19_ = (int(int(_loc11_.buffer.b[_loc11_.byteOffset + (_loc17_ + 1)])) & 0xFF) << 24 | (int(int(_loc11_.buffer.b[_loc11_.byteOffset + (_loc17_ + 2)])) & 0xFF) << 16 | (int(int(_loc11_.buffer.b[_loc11_.byteOffset + (_loc17_ + 3)])) & 0xFF) << 8 | int(int(_loc11_.buffer.b[_loc11_.byteOffset + _loc17_])) & 0xFF;
                     break;
                  case 2:
                     _loc19_ = (int(int(_loc11_.buffer.b[_loc11_.byteOffset + (_loc17_ + 2)])) & 0xFF) << 24 | (int(int(_loc11_.buffer.b[_loc11_.byteOffset + (_loc17_ + 1)])) & 0xFF) << 16 | (int(int(_loc11_.buffer.b[_loc11_.byteOffset + _loc17_])) & 0xFF) << 8 | int(int(_loc11_.buffer.b[_loc11_.byteOffset + (_loc17_ + 3)])) & 0xFF;
               }
               if(_loc15_)
               {
                  if((_loc19_ & 0xFF) != 0 && (_loc19_ & 0xFF) != 255)
                  {
                     RGBA_Impl_.unmult = 255 / (_loc19_ & 0xFF);
                     _loc27_ = RGBA_Impl_.__clamp;
                     _loc28_ = RGBA_Impl_.__clamp;
                     _loc29_ = RGBA_Impl_.__clamp;
                     _loc19_ = (int(int(_loc27_.buffer.b[_loc27_.byteOffset + int(Math.round((_loc19_ >> 24 & 0xFF) * RGBA_Impl_.unmult))])) & 0xFF) << 24 | (int(int(_loc28_.buffer.b[_loc28_.byteOffset + int(Math.round((_loc19_ >> 16 & 0xFF) * RGBA_Impl_.unmult))])) & 0xFF) << 16 | (int(int(_loc29_.buffer.b[_loc29_.byteOffset + int(Math.round((_loc19_ >> 8 & 0xFF) * RGBA_Impl_.unmult))])) & 0xFF) << 8 | _loc19_ & 0xFF & 0xFF;
                  }
               }
               switch(_loc14_)
               {
                  case 0:
                     _loc20_ = (int(int(_loc12_.buffer.b[_loc12_.byteOffset + _loc18_])) & 0xFF) << 24 | (int(int(_loc12_.buffer.b[_loc12_.byteOffset + (_loc18_ + 1)])) & 0xFF) << 16 | (int(int(_loc12_.buffer.b[_loc12_.byteOffset + (_loc18_ + 2)])) & 0xFF) << 8 | int(int(_loc12_.buffer.b[_loc12_.byteOffset + (_loc18_ + 3)])) & 0xFF;
                     break;
                  case 1:
                     _loc20_ = (int(int(_loc12_.buffer.b[_loc12_.byteOffset + (_loc18_ + 1)])) & 0xFF) << 24 | (int(int(_loc12_.buffer.b[_loc12_.byteOffset + (_loc18_ + 2)])) & 0xFF) << 16 | (int(int(_loc12_.buffer.b[_loc12_.byteOffset + (_loc18_ + 3)])) & 0xFF) << 8 | int(int(_loc12_.buffer.b[_loc12_.byteOffset + _loc18_])) & 0xFF;
                     break;
                  case 2:
                     _loc20_ = (int(int(_loc12_.buffer.b[_loc12_.byteOffset + (_loc18_ + 2)])) & 0xFF) << 24 | (int(int(_loc12_.buffer.b[_loc12_.byteOffset + (_loc18_ + 1)])) & 0xFF) << 16 | (int(int(_loc12_.buffer.b[_loc12_.byteOffset + _loc18_])) & 0xFF) << 8 | int(int(_loc12_.buffer.b[_loc12_.byteOffset + (_loc18_ + 3)])) & 0xFF;
               }
               if(_loc16_)
               {
                  if((_loc20_ & 0xFF) != 0 && (_loc20_ & 0xFF) != 255)
                  {
                     RGBA_Impl_.unmult = 255 / (_loc20_ & 0xFF);
                     _loc27_ = RGBA_Impl_.__clamp;
                     _loc28_ = RGBA_Impl_.__clamp;
                     _loc29_ = RGBA_Impl_.__clamp;
                     _loc20_ = (int(int(_loc27_.buffer.b[_loc27_.byteOffset + int(Math.round((_loc20_ >> 24 & 0xFF) * RGBA_Impl_.unmult))])) & 0xFF) << 24 | (int(int(_loc28_.buffer.b[_loc28_.byteOffset + int(Math.round((_loc20_ >> 16 & 0xFF) * RGBA_Impl_.unmult))])) & 0xFF) << 16 | (int(int(_loc29_.buffer.b[_loc29_.byteOffset + int(Math.round((_loc20_ >> 8 & 0xFF) * RGBA_Impl_.unmult))])) & 0xFF) << 8 | _loc20_ & 0xFF & 0xFF;
                  }
               }
               _loc30_ = int(((_loc19_ >> 24 & 0xFF) * param5 + (_loc20_ >> 24 & 0xFF) * (256 - param5)) / 256);
               _loc20_ = (_loc30_ & 0xFF) << 24 | (_loc20_ >> 16 & 0xFF & 0xFF) << 16 | (_loc20_ >> 8 & 0xFF & 0xFF) << 8 | _loc20_ & 0xFF & 0xFF;
               _loc30_ = int(((_loc19_ >> 16 & 0xFF) * param6 + (_loc20_ >> 16 & 0xFF) * (256 - param6)) / 256);
               _loc20_ = (_loc20_ >> 24 & 0xFF & 0xFF) << 24 | (_loc30_ & 0xFF) << 16 | (_loc20_ >> 8 & 0xFF & 0xFF) << 8 | _loc20_ & 0xFF & 0xFF;
               _loc30_ = int(((_loc19_ >> 8 & 0xFF) * param7 + (_loc20_ >> 8 & 0xFF) * (256 - param7)) / 256);
               _loc20_ = (_loc20_ >> 24 & 0xFF & 0xFF) << 24 | (_loc20_ >> 16 & 0xFF & 0xFF) << 16 | (_loc30_ & 0xFF) << 8 | _loc20_ & 0xFF & 0xFF;
               _loc30_ = int(((_loc19_ & 0xFF) * param8 + (_loc20_ & 0xFF) * (256 - param8)) / 256);
               _loc20_ = (_loc20_ >> 24 & 0xFF & 0xFF) << 24 | (_loc20_ >> 16 & 0xFF & 0xFF) << 16 | (_loc20_ >> 8 & 0xFF & 0xFF) << 8 | _loc30_ & 0xFF;
               if(_loc16_)
               {
                  if((_loc20_ & 0xFF) == 0)
                  {
                     if(_loc20_ != 0)
                     {
                        _loc20_ = 0;
                     }
                  }
                  else if((_loc20_ & 0xFF) != 255)
                  {
                     _loc27_ = RGBA_Impl_.__alpha16;
                     _loc31_ = _loc27_.buffer;
                     _loc30_ = _loc27_.byteOffset + (_loc20_ & 0xFF) * 4;
                     _loc32_ = int(_loc31_.b[_loc30_]);
                     _loc33_ = int(_loc31_.b[_loc30_ + 1]);
                     _loc34_ = int(_loc31_.b[_loc30_ + 2]);
                     _loc35_ = int(_loc31_.b[_loc30_ + 3]);
                     RGBA_Impl_.a16 = _loc32_ | _loc33_ << 8 | _loc34_ << 16 | _loc35_ << 24;
                     _loc20_ = ((_loc20_ >> 24 & 0xFF) * RGBA_Impl_.a16 >> 16 & 0xFF) << 24 | ((_loc20_ >> 16 & 0xFF) * RGBA_Impl_.a16 >> 16 & 0xFF) << 16 | ((_loc20_ >> 8 & 0xFF) * RGBA_Impl_.a16 >> 16 & 0xFF) << 8 | _loc20_ & 0xFF & 0xFF;
                  }
               }
               switch(_loc14_)
               {
                  case 0:
                     _loc36_ = uint(_loc20_ >> 24 & 0xFF);
                     _loc12_.buffer.b[_loc12_.byteOffset + _loc18_] = _loc36_;
                     _loc36_ = uint(_loc20_ >> 16 & 0xFF);
                     _loc12_.buffer.b[_loc12_.byteOffset + (_loc18_ + 1)] = _loc36_;
                     _loc36_ = uint(_loc20_ >> 8 & 0xFF);
                     _loc12_.buffer.b[_loc12_.byteOffset + (_loc18_ + 2)] = _loc36_;
                     _loc36_ = uint(_loc20_ & 0xFF);
                     _loc12_.buffer.b[_loc12_.byteOffset + (_loc18_ + 3)] = _loc36_;
                     break;
                  case 1:
                     _loc36_ = uint(_loc20_ & 0xFF);
                     _loc12_.buffer.b[_loc12_.byteOffset + _loc18_] = _loc36_;
                     _loc36_ = uint(_loc20_ >> 24 & 0xFF);
                     _loc12_.buffer.b[_loc12_.byteOffset + (_loc18_ + 1)] = _loc36_;
                     _loc36_ = uint(_loc20_ >> 16 & 0xFF);
                     _loc12_.buffer.b[_loc12_.byteOffset + (_loc18_ + 2)] = _loc36_;
                     _loc36_ = uint(_loc20_ >> 8 & 0xFF);
                     _loc12_.buffer.b[_loc12_.byteOffset + (_loc18_ + 3)] = _loc36_;
                     break;
                  case 2:
                     _loc36_ = uint(_loc20_ >> 8 & 0xFF);
                     _loc12_.buffer.b[_loc12_.byteOffset + _loc18_] = _loc36_;
                     _loc36_ = uint(_loc20_ >> 16 & 0xFF);
                     _loc12_.buffer.b[_loc12_.byteOffset + (_loc18_ + 1)] = _loc36_;
                     _loc36_ = uint(_loc20_ >> 24 & 0xFF);
                     _loc12_.buffer.b[_loc12_.byteOffset + (_loc18_ + 2)] = _loc36_;
                     _loc36_ = uint(_loc20_ & 0xFF);
                     _loc12_.buffer.b[_loc12_.byteOffset + (_loc18_ + 3)] = _loc36_;
               }
               _loc17_ += 4;
               _loc18_ += 4;
            }
         }
         param1.dirty = true;
         ++param1.version;
      }
      
      public static function multiplyAlpha(param1:Image) : void
      {
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:* = null as ArrayBufferView;
         var _loc11_:* = null as Bytes;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc15_:int = 0;
         var _loc16_:int = 0;
         var _loc17_:uint = 0;
         var _loc2_:ArrayBufferView = param1.buffer.data;
         if(_loc2_ == null || !param1.buffer.transparent)
         {
            return;
         }
         var _loc3_:int = param1.buffer.format;
         var _loc4_:int = int(_loc2_.length / 4);
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = _loc4_;
         while(_loc6_ < _loc7_)
         {
            _loc8_ = _loc6_++;
            _loc9_ = _loc8_ * 4;
            switch(_loc3_)
            {
               case 0:
                  _loc5_ = (int(int(_loc2_.buffer.b[_loc2_.byteOffset + _loc9_])) & 0xFF) << 24 | (int(int(_loc2_.buffer.b[_loc2_.byteOffset + (_loc9_ + 1)])) & 0xFF) << 16 | (int(int(_loc2_.buffer.b[_loc2_.byteOffset + (_loc9_ + 2)])) & 0xFF) << 8 | int(int(_loc2_.buffer.b[_loc2_.byteOffset + (_loc9_ + 3)])) & 0xFF;
                  break;
               case 1:
                  _loc5_ = (int(int(_loc2_.buffer.b[_loc2_.byteOffset + (_loc9_ + 1)])) & 0xFF) << 24 | (int(int(_loc2_.buffer.b[_loc2_.byteOffset + (_loc9_ + 2)])) & 0xFF) << 16 | (int(int(_loc2_.buffer.b[_loc2_.byteOffset + (_loc9_ + 3)])) & 0xFF) << 8 | int(int(_loc2_.buffer.b[_loc2_.byteOffset + _loc9_])) & 0xFF;
                  break;
               case 2:
                  _loc5_ = (int(int(_loc2_.buffer.b[_loc2_.byteOffset + (_loc9_ + 2)])) & 0xFF) << 24 | (int(int(_loc2_.buffer.b[_loc2_.byteOffset + (_loc9_ + 1)])) & 0xFF) << 16 | (int(int(_loc2_.buffer.b[_loc2_.byteOffset + _loc9_])) & 0xFF) << 8 | int(int(_loc2_.buffer.b[_loc2_.byteOffset + (_loc9_ + 3)])) & 0xFF;
            }
            _loc9_ = _loc8_ * 4;
            if((_loc5_ & 0xFF) == 0)
            {
               if(_loc5_ != 0)
               {
                  _loc5_ = 0;
               }
            }
            else if((_loc5_ & 0xFF) != 255)
            {
               _loc10_ = RGBA_Impl_.__alpha16;
               _loc11_ = _loc10_.buffer;
               _loc12_ = _loc10_.byteOffset + (_loc5_ & 0xFF) * 4;
               _loc13_ = int(_loc11_.b[_loc12_]);
               _loc14_ = int(_loc11_.b[_loc12_ + 1]);
               _loc15_ = int(_loc11_.b[_loc12_ + 2]);
               _loc16_ = int(_loc11_.b[_loc12_ + 3]);
               RGBA_Impl_.a16 = _loc13_ | _loc14_ << 8 | _loc15_ << 16 | _loc16_ << 24;
               _loc5_ = ((_loc5_ >> 24 & 0xFF) * RGBA_Impl_.a16 >> 16 & 0xFF) << 24 | ((_loc5_ >> 16 & 0xFF) * RGBA_Impl_.a16 >> 16 & 0xFF) << 16 | ((_loc5_ >> 8 & 0xFF) * RGBA_Impl_.a16 >> 16 & 0xFF) << 8 | _loc5_ & 0xFF & 0xFF;
            }
            switch(_loc3_)
            {
               case 0:
                  _loc17_ = uint(_loc5_ >> 24 & 0xFF);
                  _loc2_.buffer.b[_loc2_.byteOffset + _loc9_] = _loc17_;
                  _loc17_ = uint(_loc5_ >> 16 & 0xFF);
                  _loc2_.buffer.b[_loc2_.byteOffset + (_loc9_ + 1)] = _loc17_;
                  _loc17_ = uint(_loc5_ >> 8 & 0xFF);
                  _loc2_.buffer.b[_loc2_.byteOffset + (_loc9_ + 2)] = _loc17_;
                  _loc17_ = uint(_loc5_ & 0xFF);
                  _loc2_.buffer.b[_loc2_.byteOffset + (_loc9_ + 3)] = _loc17_;
                  break;
               case 1:
                  _loc17_ = uint(_loc5_ & 0xFF);
                  _loc2_.buffer.b[_loc2_.byteOffset + _loc9_] = _loc17_;
                  _loc17_ = uint(_loc5_ >> 24 & 0xFF);
                  _loc2_.buffer.b[_loc2_.byteOffset + (_loc9_ + 1)] = _loc17_;
                  _loc17_ = uint(_loc5_ >> 16 & 0xFF);
                  _loc2_.buffer.b[_loc2_.byteOffset + (_loc9_ + 2)] = _loc17_;
                  _loc17_ = uint(_loc5_ >> 8 & 0xFF);
                  _loc2_.buffer.b[_loc2_.byteOffset + (_loc9_ + 3)] = _loc17_;
                  break;
               case 2:
                  _loc17_ = uint(_loc5_ >> 8 & 0xFF);
                  _loc2_.buffer.b[_loc2_.byteOffset + _loc9_] = _loc17_;
                  _loc17_ = uint(_loc5_ >> 16 & 0xFF);
                  _loc2_.buffer.b[_loc2_.byteOffset + (_loc9_ + 1)] = _loc17_;
                  _loc17_ = uint(_loc5_ >> 24 & 0xFF);
                  _loc2_.buffer.b[_loc2_.byteOffset + (_loc9_ + 2)] = _loc17_;
                  _loc17_ = uint(_loc5_ & 0xFF);
                  _loc2_.buffer.b[_loc2_.byteOffset + (_loc9_ + 3)] = _loc17_;
            }
         }
         param1.buffer.premultiplied = true;
         param1.dirty = true;
         ++param1.version;
      }
      
      public static function resize(param1:Image, param2:int, param3:int) : void
      {
         var _loc11_:* = null as ArrayBufferView;
         var _loc12_:* = null as ArrayBufferView;
         var _loc13_:* = null as Array;
         var _loc14_:* = null as Bytes;
         var _loc15_:int = 0;
         var _loc16_:int = 0;
         var _loc17_:int = 0;
         var _loc18_:int = 0;
         var _loc19_:int = 0;
         var _loc20_:int = 0;
         var _loc23_:int = 0;
         var _loc24_:int = 0;
         var _loc25_:int = 0;
         var _loc26_:Number = NaN;
         var _loc27_:Number = NaN;
         var _loc28_:Number = NaN;
         var _loc29_:Number = NaN;
         var _loc30_:Number = NaN;
         var _loc31_:Number = NaN;
         var _loc34_:int = 0;
         var _loc35_:int = 0;
         var _loc36_:int = 0;
         var _loc37_:int = 0;
         var _loc38_:uint = 0;
         var _loc4_:ImageBuffer = param1.buffer;
         if(_loc4_.width == param2 && _loc4_.height == param3)
         {
            return;
         }
         var _loc5_:Object = param2 * param3 * 4;
         var _loc6_:Bytes = null;
         var _loc7_:Array = null;
         var _loc8_:Vector.<int> = null;
         var _loc9_:ArrayBufferView = null;
         var _loc10_:Object = null;
         if(_loc5_ != null)
         {
            _loc11_ = new ArrayBufferView(_loc5_,4);
         }
         else if(_loc7_ != null)
         {
            _loc12_ = new ArrayBufferView(0,4);
            _loc12_.byteOffset = 0;
            _loc12_.length = int(_loc7_.length);
            _loc12_.byteLength = _loc12_.length * _loc12_.bytesPerElement;
            _loc12_.buffer = Bytes.alloc(_loc12_.byteLength);
            _loc12_.copyFromArray(_loc7_);
            _loc11_ = _loc12_;
         }
         else if(_loc8_ != null)
         {
            _loc12_ = new ArrayBufferView(0,4);
            _loc13_ = _loc8_.__array;
            _loc12_.byteOffset = 0;
            _loc12_.length = int(_loc13_.length);
            _loc12_.byteLength = _loc12_.length * _loc12_.bytesPerElement;
            _loc12_.buffer = Bytes.alloc(_loc12_.byteLength);
            _loc12_.copyFromArray(_loc13_);
            _loc11_ = _loc12_;
         }
         else if(_loc9_ != null)
         {
            _loc12_ = new ArrayBufferView(0,4);
            _loc14_ = _loc9_.buffer;
            _loc15_ = _loc9_.length;
            _loc16_ = _loc9_.byteOffset;
            _loc17_ = _loc9_.bytesPerElement;
            _loc18_ = _loc12_.bytesPerElement;
            if(_loc9_.type != _loc12_.type)
            {
               throw Exception.thrown("unimplemented");
            }
            _loc19_ = _loc14_.length;
            _loc20_ = _loc19_ - _loc16_;
            _loc12_.buffer = Bytes.alloc(_loc20_);
            _loc12_.buffer.blit(0,_loc14_,_loc16_,_loc20_);
            _loc12_.byteLength = _loc12_.bytesPerElement * _loc15_;
            _loc12_.byteOffset = 0;
            _loc12_.length = _loc15_;
            _loc11_ = _loc12_;
         }
         else
         {
            if(_loc6_ == null)
            {
               throw Exception.thrown("Invalid constructor arguments for UInt8Array");
            }
            _loc12_ = new ArrayBufferView(0,4);
            _loc15_ = 0;
            if(_loc15_ < 0)
            {
               throw Exception.thrown(TAError.RangeError);
            }
            if(int(_loc15_ % _loc12_.bytesPerElement) != 0)
            {
               throw Exception.thrown(TAError.RangeError);
            }
            _loc16_ = _loc6_.length;
            _loc17_ = _loc12_.bytesPerElement;
            _loc18_ = _loc16_;
            if(_loc10_ == null)
            {
               _loc18_ = _loc16_ - _loc15_;
               if(int(_loc16_ % _loc12_.bytesPerElement) != 0)
               {
                  throw Exception.thrown(TAError.RangeError);
               }
               if(_loc18_ < 0)
               {
                  throw Exception.thrown(TAError.RangeError);
               }
            }
            else
            {
               _loc18_ = _loc10_ * _loc12_.bytesPerElement;
               _loc19_ = _loc15_ + _loc18_;
               if(_loc19_ > _loc16_)
               {
                  throw Exception.thrown(TAError.RangeError);
               }
            }
            _loc12_.buffer = _loc6_;
            _loc12_.byteOffset = _loc15_;
            _loc12_.byteLength = _loc18_;
            _loc12_.length = int(_loc18_ / _loc12_.bytesPerElement);
            _loc11_ = _loc12_;
         }
         var _loc21_:ImageBuffer = new ImageBuffer(_loc11_,param2,param3);
         _loc15_ = param1.width;
         _loc16_ = param1.height;
         _loc12_ = param1.get_data();
         var _loc22_:ArrayBufferView = _loc21_.data;
         var _loc32_:int = 0;
         var _loc33_:int = param3;
         while(_loc32_ < _loc33_)
         {
            _loc34_ = _loc32_++;
            _loc35_ = 0;
            _loc36_ = param2;
            while(_loc35_ < _loc36_)
            {
               _loc37_ = _loc35_++;
               _loc26_ = (_loc37_ + 0.5) / param2 * _loc15_ - 0.5;
               _loc27_ = (_loc34_ + 0.5) / param3 * _loc16_ - 0.5;
               _loc24_ = int(_loc26_);
               _loc25_ = int(_loc27_);
               _loc17_ = (_loc25_ * _loc15_ + _loc24_) * 4;
               _loc18_ = _loc24_ < _loc15_ - 1 ? _loc17_ + 4 : _loc17_;
               _loc19_ = _loc25_ < _loc16_ - 1 ? _loc17_ + _loc15_ * 4 : _loc17_;
               _loc20_ = _loc18_ != _loc17_ ? _loc19_ + 4 : _loc19_;
               _loc23_ = (_loc34_ * param2 + _loc37_) * 4;
               _loc28_ = _loc26_ - _loc24_;
               _loc29_ = _loc27_ - _loc25_;
               _loc30_ = 1 - _loc28_;
               _loc31_ = 1 - _loc29_;
               _loc38_ = uint(int((int(_loc12_.buffer.b[_loc12_.byteOffset + _loc17_]) * _loc30_ + int(_loc12_.buffer.b[_loc12_.byteOffset + _loc18_]) * _loc28_) * _loc31_ + (int(_loc12_.buffer.b[_loc12_.byteOffset + _loc19_]) * _loc30_ + int(_loc12_.buffer.b[_loc12_.byteOffset + _loc20_]) * _loc28_) * _loc29_));
               _loc22_.buffer.b[_loc22_.byteOffset + _loc23_] = _loc38_;
               _loc38_ = uint(int((int(_loc12_.buffer.b[_loc12_.byteOffset + (_loc17_ + 1)]) * _loc30_ + int(_loc12_.buffer.b[_loc12_.byteOffset + (_loc18_ + 1)]) * _loc28_) * _loc31_ + (int(_loc12_.buffer.b[_loc12_.byteOffset + (_loc19_ + 1)]) * _loc30_ + int(_loc12_.buffer.b[_loc12_.byteOffset + (_loc20_ + 1)]) * _loc28_) * _loc29_));
               _loc22_.buffer.b[_loc22_.byteOffset + (_loc23_ + 1)] = _loc38_;
               _loc38_ = uint(int((int(_loc12_.buffer.b[_loc12_.byteOffset + (_loc17_ + 2)]) * _loc30_ + int(_loc12_.buffer.b[_loc12_.byteOffset + (_loc18_ + 2)]) * _loc28_) * _loc31_ + (int(_loc12_.buffer.b[_loc12_.byteOffset + (_loc19_ + 2)]) * _loc30_ + int(_loc12_.buffer.b[_loc12_.byteOffset + (_loc20_ + 2)]) * _loc28_) * _loc29_));
               _loc22_.buffer.b[_loc22_.byteOffset + (_loc23_ + 2)] = _loc38_;
               if(int(_loc12_.buffer.b[_loc12_.byteOffset + (_loc18_ + 3)]) == 0 || int(_loc12_.buffer.b[_loc12_.byteOffset + (_loc19_ + 3)]) == 0 || int(_loc12_.buffer.b[_loc12_.byteOffset + (_loc20_ + 3)]) == 0)
               {
                  _loc22_.buffer.b[_loc22_.byteOffset + (_loc23_ + 3)] = 0;
               }
               else
               {
                  _loc38_ = uint(int(_loc12_.buffer.b[_loc12_.byteOffset + (_loc17_ + 3)]));
                  _loc22_.buffer.b[_loc22_.byteOffset + (_loc23_ + 3)] = _loc38_;
               }
            }
         }
         _loc4_.data = _loc21_.data;
         _loc4_.width = param2;
         _loc4_.height = param3;
         param1.dirty = true;
         ++param1.version;
      }
      
      public static function resizeBuffer(param1:Image, param2:int, param3:int) : void
      {
         var _loc12_:* = null as ArrayBufferView;
         var _loc13_:* = null as ArrayBufferView;
         var _loc14_:* = null as Array;
         var _loc15_:* = null as Bytes;
         var _loc16_:int = 0;
         var _loc17_:int = 0;
         var _loc18_:int = 0;
         var _loc19_:int = 0;
         var _loc20_:int = 0;
         var _loc21_:int = 0;
         var _loc22_:int = 0;
         var _loc23_:int = 0;
         var _loc24_:uint = 0;
         var _loc4_:ImageBuffer = param1.buffer;
         var _loc5_:ArrayBufferView = param1.get_data();
         var _loc6_:Object = param2 * param3 * 4;
         var _loc7_:Bytes = null;
         var _loc8_:Array = null;
         var _loc9_:Vector.<int> = null;
         var _loc10_:ArrayBufferView = null;
         var _loc11_:Object = null;
         if(_loc6_ != null)
         {
            _loc12_ = new ArrayBufferView(_loc6_,4);
         }
         else if(_loc8_ != null)
         {
            _loc13_ = new ArrayBufferView(0,4);
            _loc13_.byteOffset = 0;
            _loc13_.length = int(_loc8_.length);
            _loc13_.byteLength = _loc13_.length * _loc13_.bytesPerElement;
            _loc13_.buffer = Bytes.alloc(_loc13_.byteLength);
            _loc13_.copyFromArray(_loc8_);
            _loc12_ = _loc13_;
         }
         else if(_loc9_ != null)
         {
            _loc13_ = new ArrayBufferView(0,4);
            _loc14_ = _loc9_.__array;
            _loc13_.byteOffset = 0;
            _loc13_.length = int(_loc14_.length);
            _loc13_.byteLength = _loc13_.length * _loc13_.bytesPerElement;
            _loc13_.buffer = Bytes.alloc(_loc13_.byteLength);
            _loc13_.copyFromArray(_loc14_);
            _loc12_ = _loc13_;
         }
         else if(_loc10_ != null)
         {
            _loc13_ = new ArrayBufferView(0,4);
            _loc15_ = _loc10_.buffer;
            _loc16_ = _loc10_.length;
            _loc17_ = _loc10_.byteOffset;
            _loc18_ = _loc10_.bytesPerElement;
            _loc19_ = _loc13_.bytesPerElement;
            if(_loc10_.type != _loc13_.type)
            {
               throw Exception.thrown("unimplemented");
            }
            _loc20_ = _loc15_.length;
            _loc21_ = _loc20_ - _loc17_;
            _loc13_.buffer = Bytes.alloc(_loc21_);
            _loc13_.buffer.blit(0,_loc15_,_loc17_,_loc21_);
            _loc13_.byteLength = _loc13_.bytesPerElement * _loc16_;
            _loc13_.byteOffset = 0;
            _loc13_.length = _loc16_;
            _loc12_ = _loc13_;
         }
         else
         {
            if(_loc7_ == null)
            {
               throw Exception.thrown("Invalid constructor arguments for UInt8Array");
            }
            _loc13_ = new ArrayBufferView(0,4);
            _loc16_ = 0;
            if(_loc16_ < 0)
            {
               throw Exception.thrown(TAError.RangeError);
            }
            if(int(_loc16_ % _loc13_.bytesPerElement) != 0)
            {
               throw Exception.thrown(TAError.RangeError);
            }
            _loc17_ = _loc7_.length;
            _loc18_ = _loc13_.bytesPerElement;
            _loc19_ = _loc17_;
            if(_loc11_ == null)
            {
               _loc19_ = _loc17_ - _loc16_;
               if(int(_loc17_ % _loc13_.bytesPerElement) != 0)
               {
                  throw Exception.thrown(TAError.RangeError);
               }
               if(_loc19_ < 0)
               {
                  throw Exception.thrown(TAError.RangeError);
               }
            }
            else
            {
               _loc19_ = _loc11_ * _loc13_.bytesPerElement;
               _loc20_ = _loc16_ + _loc19_;
               if(_loc20_ > _loc17_)
               {
                  throw Exception.thrown(TAError.RangeError);
               }
            }
            _loc13_.buffer = _loc7_;
            _loc13_.byteOffset = _loc16_;
            _loc13_.byteLength = _loc19_;
            _loc13_.length = int(_loc19_ / _loc13_.bytesPerElement);
            _loc12_ = _loc13_;
         }
         _loc13_ = _loc12_;
         _loc18_ = 0;
         _loc19_ = _loc4_.height;
         while(_loc18_ < _loc19_)
         {
            _loc20_ = _loc18_++;
            _loc21_ = 0;
            _loc22_ = _loc4_.width;
            while(_loc21_ < _loc22_)
            {
               _loc23_ = _loc21_++;
               _loc16_ = (_loc20_ * _loc4_.width + _loc23_) * 4;
               _loc17_ = (_loc20_ * param2 + _loc23_) * 4;
               _loc24_ = uint(int(_loc5_.buffer.b[_loc5_.byteOffset + _loc16_]));
               _loc13_.buffer.b[_loc13_.byteOffset + _loc17_] = _loc24_;
               _loc24_ = uint(int(_loc5_.buffer.b[_loc5_.byteOffset + (_loc16_ + 1)]));
               _loc13_.buffer.b[_loc13_.byteOffset + (_loc17_ + 1)] = _loc24_;
               _loc24_ = uint(int(_loc5_.buffer.b[_loc5_.byteOffset + (_loc16_ + 2)]));
               _loc13_.buffer.b[_loc13_.byteOffset + (_loc17_ + 2)] = _loc24_;
               _loc24_ = uint(int(_loc5_.buffer.b[_loc5_.byteOffset + (_loc16_ + 3)]));
               _loc13_.buffer.b[_loc13_.byteOffset + (_loc17_ + 3)] = _loc24_;
            }
         }
         _loc4_.data = _loc13_;
         _loc4_.width = param2;
         _loc4_.height = param3;
         param1.dirty = true;
         ++param1.version;
      }
      
      public static function setFormat(param1:Image, param2:int) : void
      {
         var _loc4_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc15_:int = 0;
         var _loc16_:int = 0;
         var _loc17_:int = 0;
         var _loc20_:int = 0;
         var _loc3_:ArrayBufferView = param1.buffer.data;
         if(_loc3_ == null)
         {
            return;
         }
         var _loc5_:int = int(_loc3_.length / 4);
         switch(param1.get_format())
         {
            case 0:
               _loc6_ = 0;
               _loc7_ = 1;
               _loc8_ = 2;
               _loc9_ = 3;
               break;
            case 1:
               _loc6_ = 1;
               _loc7_ = 2;
               _loc8_ = 3;
               _loc9_ = 0;
               break;
            case 2:
               _loc6_ = 2;
               _loc7_ = 1;
               _loc8_ = 0;
               _loc9_ = 3;
         }
         switch(param2)
         {
            case 0:
               _loc10_ = 0;
               _loc11_ = 1;
               _loc12_ = 2;
               _loc13_ = 3;
               break;
            case 1:
               _loc10_ = 1;
               _loc11_ = 2;
               _loc12_ = 3;
               _loc13_ = 0;
               break;
            case 2:
               _loc10_ = 2;
               _loc11_ = 1;
               _loc12_ = 0;
               _loc13_ = 3;
         }
         var _loc18_:int = 0;
         var _loc19_:int = _loc5_;
         while(_loc18_ < _loc19_)
         {
            _loc20_ = _loc18_++;
            _loc4_ = _loc20_ * 4;
            _loc14_ = int(int(_loc3_.buffer.b[_loc3_.byteOffset + (_loc4_ + _loc6_)]));
            _loc15_ = int(int(_loc3_.buffer.b[_loc3_.byteOffset + (_loc4_ + _loc7_)]));
            _loc16_ = int(int(_loc3_.buffer.b[_loc3_.byteOffset + (_loc4_ + _loc8_)]));
            _loc17_ = int(int(_loc3_.buffer.b[_loc3_.byteOffset + (_loc4_ + _loc9_)]));
            _loc3_.buffer.b[_loc3_.byteOffset + (_loc4_ + _loc10_)] = _loc14_;
            _loc3_.buffer.b[_loc3_.byteOffset + (_loc4_ + _loc11_)] = _loc15_;
            _loc3_.buffer.b[_loc3_.byteOffset + (_loc4_ + _loc12_)] = _loc16_;
            _loc3_.buffer.b[_loc3_.byteOffset + (_loc4_ + _loc13_)] = _loc17_;
         }
         param1.buffer.format = param2;
         param1.dirty = true;
         ++param1.version;
      }
      
      public static function setPixel(param1:Image, param2:int, param3:int, param4:int, param5:int) : void
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc11_:* = null as ArrayBufferView;
         var _loc12_:* = null as ArrayBufferView;
         var _loc13_:* = null as ArrayBufferView;
         var _loc14_:* = null as Bytes;
         var _loc15_:int = 0;
         var _loc16_:int = 0;
         var _loc17_:int = 0;
         var _loc18_:int = 0;
         var _loc19_:int = 0;
         var _loc20_:uint = 0;
         switch(param5)
         {
            case 1:
               _loc7_ = param4;
               _loc8_ = 0;
               _loc8_ = (_loc7_ >> 16 & 0xFF & 0xFF) << 24 | (_loc7_ >> 8 & 0xFF & 0xFF) << 16 | (_loc7_ & 0xFF & 0xFF) << 8 | _loc7_ >> 24 & 0xFF & 0xFF;
               _loc6_ = _loc8_;
               break;
            case 2:
               _loc7_ = param4;
               _loc8_ = 0;
               _loc8_ = (_loc7_ >> 8 & 0xFF & 0xFF) << 24 | (_loc7_ >> 16 & 0xFF & 0xFF) << 16 | (_loc7_ >> 24 & 0xFF & 0xFF) << 8 | _loc7_ & 0xFF & 0xFF;
               _loc6_ = _loc8_;
               break;
            default:
               _loc6_ = param4;
         }
         _loc7_ = 0;
         var _loc9_:ArrayBufferView = param1.buffer.data;
         _loc8_ = 4 * (param3 + param1.offsetY) * param1.buffer.width + (param2 + param1.offsetX) * 4;
         var _loc10_:Boolean = param1.buffer.premultiplied;
         switch(param1.buffer.format)
         {
            case 0:
               _loc7_ = (int(int(_loc9_.buffer.b[_loc9_.byteOffset + _loc8_])) & 0xFF) << 24 | (int(int(_loc9_.buffer.b[_loc9_.byteOffset + (_loc8_ + 1)])) & 0xFF) << 16 | (int(int(_loc9_.buffer.b[_loc9_.byteOffset + (_loc8_ + 2)])) & 0xFF) << 8 | int(int(_loc9_.buffer.b[_loc9_.byteOffset + (_loc8_ + 3)])) & 0xFF;
               break;
            case 1:
               _loc7_ = (int(int(_loc9_.buffer.b[_loc9_.byteOffset + (_loc8_ + 1)])) & 0xFF) << 24 | (int(int(_loc9_.buffer.b[_loc9_.byteOffset + (_loc8_ + 2)])) & 0xFF) << 16 | (int(int(_loc9_.buffer.b[_loc9_.byteOffset + (_loc8_ + 3)])) & 0xFF) << 8 | int(int(_loc9_.buffer.b[_loc9_.byteOffset + _loc8_])) & 0xFF;
               break;
            case 2:
               _loc7_ = (int(int(_loc9_.buffer.b[_loc9_.byteOffset + (_loc8_ + 2)])) & 0xFF) << 24 | (int(int(_loc9_.buffer.b[_loc9_.byteOffset + (_loc8_ + 1)])) & 0xFF) << 16 | (int(int(_loc9_.buffer.b[_loc9_.byteOffset + _loc8_])) & 0xFF) << 8 | int(int(_loc9_.buffer.b[_loc9_.byteOffset + (_loc8_ + 3)])) & 0xFF;
         }
         if(_loc10_)
         {
            if((_loc7_ & 0xFF) != 0 && (_loc7_ & 0xFF) != 255)
            {
               RGBA_Impl_.unmult = 255 / (_loc7_ & 0xFF);
               _loc11_ = RGBA_Impl_.__clamp;
               _loc12_ = RGBA_Impl_.__clamp;
               _loc13_ = RGBA_Impl_.__clamp;
               _loc7_ = (int(int(_loc11_.buffer.b[_loc11_.byteOffset + int(Math.round((_loc7_ >> 24 & 0xFF) * RGBA_Impl_.unmult))])) & 0xFF) << 24 | (int(int(_loc12_.buffer.b[_loc12_.byteOffset + int(Math.round((_loc7_ >> 16 & 0xFF) * RGBA_Impl_.unmult))])) & 0xFF) << 16 | (int(int(_loc13_.buffer.b[_loc13_.byteOffset + int(Math.round((_loc7_ >> 8 & 0xFF) * RGBA_Impl_.unmult))])) & 0xFF) << 8 | _loc7_ & 0xFF & 0xFF;
            }
         }
         _loc8_ = _loc7_ & 0xFF;
         _loc6_ = (_loc6_ >> 24 & 0xFF & 0xFF) << 24 | (_loc6_ >> 16 & 0xFF & 0xFF) << 16 | (_loc6_ >> 8 & 0xFF & 0xFF) << 8 | _loc8_ & 0xFF;
         _loc9_ = param1.buffer.data;
         _loc8_ = 4 * (param3 + param1.offsetY) * param1.buffer.width + (param2 + param1.offsetX) * 4;
         if(param1.buffer.premultiplied)
         {
            if((_loc6_ & 0xFF) == 0)
            {
               if(_loc6_ != 0)
               {
                  _loc6_ = 0;
               }
            }
            else if((_loc6_ & 0xFF) != 255)
            {
               _loc11_ = RGBA_Impl_.__alpha16;
               _loc14_ = _loc11_.buffer;
               _loc15_ = _loc11_.byteOffset + (_loc6_ & 0xFF) * 4;
               _loc16_ = int(_loc14_.b[_loc15_]);
               _loc17_ = int(_loc14_.b[_loc15_ + 1]);
               _loc18_ = int(_loc14_.b[_loc15_ + 2]);
               _loc19_ = int(_loc14_.b[_loc15_ + 3]);
               RGBA_Impl_.a16 = _loc16_ | _loc17_ << 8 | _loc18_ << 16 | _loc19_ << 24;
               _loc6_ = ((_loc6_ >> 24 & 0xFF) * RGBA_Impl_.a16 >> 16 & 0xFF) << 24 | ((_loc6_ >> 16 & 0xFF) * RGBA_Impl_.a16 >> 16 & 0xFF) << 16 | ((_loc6_ >> 8 & 0xFF) * RGBA_Impl_.a16 >> 16 & 0xFF) << 8 | _loc6_ & 0xFF & 0xFF;
            }
         }
         switch(param1.buffer.format)
         {
            case 0:
               _loc20_ = uint(_loc6_ >> 24 & 0xFF);
               _loc9_.buffer.b[_loc9_.byteOffset + _loc8_] = _loc20_;
               _loc20_ = uint(_loc6_ >> 16 & 0xFF);
               _loc9_.buffer.b[_loc9_.byteOffset + (_loc8_ + 1)] = _loc20_;
               _loc20_ = uint(_loc6_ >> 8 & 0xFF);
               _loc9_.buffer.b[_loc9_.byteOffset + (_loc8_ + 2)] = _loc20_;
               _loc20_ = uint(_loc6_ & 0xFF);
               _loc9_.buffer.b[_loc9_.byteOffset + (_loc8_ + 3)] = _loc20_;
               break;
            case 1:
               _loc20_ = uint(_loc6_ & 0xFF);
               _loc9_.buffer.b[_loc9_.byteOffset + _loc8_] = _loc20_;
               _loc20_ = uint(_loc6_ >> 24 & 0xFF);
               _loc9_.buffer.b[_loc9_.byteOffset + (_loc8_ + 1)] = _loc20_;
               _loc20_ = uint(_loc6_ >> 16 & 0xFF);
               _loc9_.buffer.b[_loc9_.byteOffset + (_loc8_ + 2)] = _loc20_;
               _loc20_ = uint(_loc6_ >> 8 & 0xFF);
               _loc9_.buffer.b[_loc9_.byteOffset + (_loc8_ + 3)] = _loc20_;
               break;
            case 2:
               _loc20_ = uint(_loc6_ >> 8 & 0xFF);
               _loc9_.buffer.b[_loc9_.byteOffset + _loc8_] = _loc20_;
               _loc20_ = uint(_loc6_ >> 16 & 0xFF);
               _loc9_.buffer.b[_loc9_.byteOffset + (_loc8_ + 1)] = _loc20_;
               _loc20_ = uint(_loc6_ >> 24 & 0xFF);
               _loc9_.buffer.b[_loc9_.byteOffset + (_loc8_ + 2)] = _loc20_;
               _loc20_ = uint(_loc6_ & 0xFF);
               _loc9_.buffer.b[_loc9_.byteOffset + (_loc8_ + 3)] = _loc20_;
         }
         param1.dirty = true;
         ++param1.version;
      }
      
      public static function setPixel32(param1:Image, param2:int, param3:int, param4:int, param5:int) : void
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc10_:* = null as ArrayBufferView;
         var _loc11_:* = null as Bytes;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc15_:int = 0;
         var _loc16_:uint = 0;
         switch(param5)
         {
            case 1:
               _loc7_ = param4;
               _loc8_ = 0;
               _loc8_ = (_loc7_ >> 16 & 0xFF & 0xFF) << 24 | (_loc7_ >> 8 & 0xFF & 0xFF) << 16 | (_loc7_ & 0xFF & 0xFF) << 8 | _loc7_ >> 24 & 0xFF & 0xFF;
               _loc6_ = _loc8_;
               break;
            case 2:
               _loc7_ = param4;
               _loc8_ = 0;
               _loc8_ = (_loc7_ >> 8 & 0xFF & 0xFF) << 24 | (_loc7_ >> 16 & 0xFF & 0xFF) << 16 | (_loc7_ >> 24 & 0xFF & 0xFF) << 8 | _loc7_ & 0xFF & 0xFF;
               _loc6_ = _loc8_;
               break;
            default:
               _loc6_ = param4;
         }
         if(!param1.get_transparent())
         {
            _loc6_ = (_loc6_ >> 24 & 0xFF & 0xFF) << 24 | (_loc6_ >> 16 & 0xFF & 0xFF) << 16 | (_loc6_ >> 8 & 0xFF & 0xFF) << 8 | 0xFF;
         }
         var _loc9_:ArrayBufferView = param1.buffer.data;
         _loc7_ = 4 * (param3 + param1.offsetY) * param1.buffer.width + (param2 + param1.offsetX) * 4;
         if(param1.buffer.premultiplied)
         {
            if((_loc6_ & 0xFF) == 0)
            {
               if(_loc6_ != 0)
               {
                  _loc6_ = 0;
               }
            }
            else if((_loc6_ & 0xFF) != 255)
            {
               _loc10_ = RGBA_Impl_.__alpha16;
               _loc11_ = _loc10_.buffer;
               _loc8_ = _loc10_.byteOffset + (_loc6_ & 0xFF) * 4;
               _loc12_ = int(_loc11_.b[_loc8_]);
               _loc13_ = int(_loc11_.b[_loc8_ + 1]);
               _loc14_ = int(_loc11_.b[_loc8_ + 2]);
               _loc15_ = int(_loc11_.b[_loc8_ + 3]);
               RGBA_Impl_.a16 = _loc12_ | _loc13_ << 8 | _loc14_ << 16 | _loc15_ << 24;
               _loc6_ = ((_loc6_ >> 24 & 0xFF) * RGBA_Impl_.a16 >> 16 & 0xFF) << 24 | ((_loc6_ >> 16 & 0xFF) * RGBA_Impl_.a16 >> 16 & 0xFF) << 16 | ((_loc6_ >> 8 & 0xFF) * RGBA_Impl_.a16 >> 16 & 0xFF) << 8 | _loc6_ & 0xFF & 0xFF;
            }
         }
         switch(param1.buffer.format)
         {
            case 0:
               _loc16_ = uint(_loc6_ >> 24 & 0xFF);
               _loc9_.buffer.b[_loc9_.byteOffset + _loc7_] = _loc16_;
               _loc16_ = uint(_loc6_ >> 16 & 0xFF);
               _loc9_.buffer.b[_loc9_.byteOffset + (_loc7_ + 1)] = _loc16_;
               _loc16_ = uint(_loc6_ >> 8 & 0xFF);
               _loc9_.buffer.b[_loc9_.byteOffset + (_loc7_ + 2)] = _loc16_;
               _loc16_ = uint(_loc6_ & 0xFF);
               _loc9_.buffer.b[_loc9_.byteOffset + (_loc7_ + 3)] = _loc16_;
               break;
            case 1:
               _loc16_ = uint(_loc6_ & 0xFF);
               _loc9_.buffer.b[_loc9_.byteOffset + _loc7_] = _loc16_;
               _loc16_ = uint(_loc6_ >> 24 & 0xFF);
               _loc9_.buffer.b[_loc9_.byteOffset + (_loc7_ + 1)] = _loc16_;
               _loc16_ = uint(_loc6_ >> 16 & 0xFF);
               _loc9_.buffer.b[_loc9_.byteOffset + (_loc7_ + 2)] = _loc16_;
               _loc16_ = uint(_loc6_ >> 8 & 0xFF);
               _loc9_.buffer.b[_loc9_.byteOffset + (_loc7_ + 3)] = _loc16_;
               break;
            case 2:
               _loc16_ = uint(_loc6_ >> 8 & 0xFF);
               _loc9_.buffer.b[_loc9_.byteOffset + _loc7_] = _loc16_;
               _loc16_ = uint(_loc6_ >> 16 & 0xFF);
               _loc9_.buffer.b[_loc9_.byteOffset + (_loc7_ + 1)] = _loc16_;
               _loc16_ = uint(_loc6_ >> 24 & 0xFF);
               _loc9_.buffer.b[_loc9_.byteOffset + (_loc7_ + 2)] = _loc16_;
               _loc16_ = uint(_loc6_ & 0xFF);
               _loc9_.buffer.b[_loc9_.byteOffset + (_loc7_ + 3)] = _loc16_;
         }
         param1.dirty = true;
         ++param1.version;
      }
      
      public static function setPixels(param1:Image, param2:Rectangle, param3:BytePointerData, param4:int, param5:Endian) : void
      {
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc19_:int = 0;
         var _loc20_:int = 0;
         var _loc21_:int = 0;
         var _loc22_:int = 0;
         var _loc23_:int = 0;
         var _loc24_:int = 0;
         var _loc25_:* = null as ArrayBufferView;
         var _loc26_:* = null as Bytes;
         var _loc27_:int = 0;
         var _loc28_:int = 0;
         var _loc29_:int = 0;
         var _loc30_:int = 0;
         var _loc31_:uint = 0;
         if(param1.buffer.data == null)
         {
            return;
         }
         var _loc6_:ArrayBufferView = param1.buffer.data;
         var _loc7_:int = param1.buffer.format;
         var _loc8_:Boolean = param1.buffer.premultiplied;
         var _loc9_:ImageDataView = new ImageDataView(param1,param2);
         var _loc13_:Boolean = param1.get_transparent();
         var _loc14_:Bytes = param3.bytes;
         var _loc15_:int = param3.offset;
         var _loc16_:Boolean = param5 != Endian.BIG_ENDIAN;
         var _loc17_:int = 0;
         var _loc18_:int = _loc9_.height;
         while(_loc17_ < _loc18_)
         {
            _loc19_ = _loc17_++;
            _loc10_ = _loc9_.byteOffset + _loc9_.stride * _loc19_;
            _loc20_ = 0;
            _loc21_ = _loc9_.width;
            while(_loc20_ < _loc21_)
            {
               _loc22_ = _loc20_++;
               if(_loc16_)
               {
                  _loc11_ = int(_loc14_.b[_loc15_]) | int(_loc14_.b[_loc15_ + 1]) << 8 | int(_loc14_.b[_loc15_ + 2]) << 16 | int(_loc14_.b[_loc15_ + 3]) << 24;
               }
               else
               {
                  _loc11_ = int(_loc14_.b[_loc15_ + 3]) | int(_loc14_.b[_loc15_ + 2]) << 8 | int(_loc14_.b[_loc15_ + 1]) << 16 | int(_loc14_.b[_loc15_]) << 24;
               }
               _loc15_ += 4;
               switch(param4)
               {
                  case 1:
                     _loc23_ = _loc11_;
                     _loc24_ = 0;
                     _loc24_ = (_loc23_ >> 16 & 0xFF & 0xFF) << 24 | (_loc23_ >> 8 & 0xFF & 0xFF) << 16 | (_loc23_ & 0xFF & 0xFF) << 8 | _loc23_ >> 24 & 0xFF & 0xFF;
                     _loc12_ = _loc24_;
                     break;
                  case 2:
                     _loc23_ = _loc11_;
                     _loc24_ = 0;
                     _loc24_ = (_loc23_ >> 8 & 0xFF & 0xFF) << 24 | (_loc23_ >> 16 & 0xFF & 0xFF) << 16 | (_loc23_ >> 24 & 0xFF & 0xFF) << 8 | _loc23_ & 0xFF & 0xFF;
                     _loc12_ = _loc24_;
                     break;
                  default:
                     _loc12_ = _loc11_;
               }
               if(!_loc13_)
               {
                  _loc12_ = (_loc12_ >> 24 & 0xFF & 0xFF) << 24 | (_loc12_ >> 16 & 0xFF & 0xFF) << 16 | (_loc12_ >> 8 & 0xFF & 0xFF) << 8 | 0xFF;
               }
               _loc23_ = _loc10_ + _loc22_ * 4;
               if(_loc8_)
               {
                  if((_loc12_ & 0xFF) == 0)
                  {
                     if(_loc12_ != 0)
                     {
                        _loc12_ = 0;
                     }
                  }
                  else if((_loc12_ & 0xFF) != 255)
                  {
                     _loc25_ = RGBA_Impl_.__alpha16;
                     _loc26_ = _loc25_.buffer;
                     _loc24_ = _loc25_.byteOffset + (_loc12_ & 0xFF) * 4;
                     _loc27_ = int(_loc26_.b[_loc24_]);
                     _loc28_ = int(_loc26_.b[_loc24_ + 1]);
                     _loc29_ = int(_loc26_.b[_loc24_ + 2]);
                     _loc30_ = int(_loc26_.b[_loc24_ + 3]);
                     RGBA_Impl_.a16 = _loc27_ | _loc28_ << 8 | _loc29_ << 16 | _loc30_ << 24;
                     _loc12_ = ((_loc12_ >> 24 & 0xFF) * RGBA_Impl_.a16 >> 16 & 0xFF) << 24 | ((_loc12_ >> 16 & 0xFF) * RGBA_Impl_.a16 >> 16 & 0xFF) << 16 | ((_loc12_ >> 8 & 0xFF) * RGBA_Impl_.a16 >> 16 & 0xFF) << 8 | _loc12_ & 0xFF & 0xFF;
                  }
               }
               switch(_loc7_)
               {
                  case 0:
                     _loc31_ = uint(_loc12_ >> 24 & 0xFF);
                     _loc6_.buffer.b[_loc6_.byteOffset + _loc23_] = _loc31_;
                     _loc31_ = uint(_loc12_ >> 16 & 0xFF);
                     _loc6_.buffer.b[_loc6_.byteOffset + (_loc23_ + 1)] = _loc31_;
                     _loc31_ = uint(_loc12_ >> 8 & 0xFF);
                     _loc6_.buffer.b[_loc6_.byteOffset + (_loc23_ + 2)] = _loc31_;
                     _loc31_ = uint(_loc12_ & 0xFF);
                     _loc6_.buffer.b[_loc6_.byteOffset + (_loc23_ + 3)] = _loc31_;
                     break;
                  case 1:
                     _loc31_ = uint(_loc12_ & 0xFF);
                     _loc6_.buffer.b[_loc6_.byteOffset + _loc23_] = _loc31_;
                     _loc31_ = uint(_loc12_ >> 24 & 0xFF);
                     _loc6_.buffer.b[_loc6_.byteOffset + (_loc23_ + 1)] = _loc31_;
                     _loc31_ = uint(_loc12_ >> 16 & 0xFF);
                     _loc6_.buffer.b[_loc6_.byteOffset + (_loc23_ + 2)] = _loc31_;
                     _loc31_ = uint(_loc12_ >> 8 & 0xFF);
                     _loc6_.buffer.b[_loc6_.byteOffset + (_loc23_ + 3)] = _loc31_;
                     break;
                  case 2:
                     _loc31_ = uint(_loc12_ >> 8 & 0xFF);
                     _loc6_.buffer.b[_loc6_.byteOffset + _loc23_] = _loc31_;
                     _loc31_ = uint(_loc12_ >> 16 & 0xFF);
                     _loc6_.buffer.b[_loc6_.byteOffset + (_loc23_ + 1)] = _loc31_;
                     _loc31_ = uint(_loc12_ >> 24 & 0xFF);
                     _loc6_.buffer.b[_loc6_.byteOffset + (_loc23_ + 2)] = _loc31_;
                     _loc31_ = uint(_loc12_ & 0xFF);
                     _loc6_.buffer.b[_loc6_.byteOffset + (_loc23_ + 3)] = _loc31_;
               }
            }
         }
         param1.dirty = true;
         ++param1.version;
      }
      
      public static function threshold(param1:Image, param2:Image, param3:Rectangle, param4:Vector2, param5:String, param6:int, param7:int, param8:int, param9:Boolean, param10:int) : int
      {
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc15_:int = 0;
         var _loc16_:int = 0;
         var _loc17_:int = 0;
         var _loc18_:int = 0;
         var _loc19_:int = 0;
         var _loc29_:uint = 0;
         var _loc30_:Boolean = false;
         var _loc31_:int = 0;
         var _loc34_:int = 0;
         var _loc35_:int = 0;
         var _loc36_:int = 0;
         var _loc37_:int = 0;
         var _loc38_:* = null as ArrayBufferView;
         var _loc39_:* = null as ArrayBufferView;
         var _loc40_:* = null as ArrayBufferView;
         var _loc41_:uint = 0;
         var _loc42_:uint = 0;
         var _loc43_:* = null as Bytes;
         var _loc44_:int = 0;
         var _loc45_:int = 0;
         var _loc46_:int = 0;
         var _loc47_:int = 0;
         var _loc48_:int = 0;
         var _loc49_:uint = 0;
         switch(param10)
         {
            case 1:
               _loc14_ = param7;
               _loc15_ = 0;
               _loc15_ = (_loc14_ >> 16 & 0xFF & 0xFF) << 24 | (_loc14_ >> 8 & 0xFF & 0xFF) << 16 | (_loc14_ & 0xFF & 0xFF) << 8 | _loc14_ >> 24 & 0xFF & 0xFF;
               _loc11_ = _loc15_;
               _loc16_ = param8;
               _loc17_ = 0;
               _loc17_ = (_loc16_ >> 16 & 0xFF & 0xFF) << 24 | (_loc16_ >> 8 & 0xFF & 0xFF) << 16 | (_loc16_ & 0xFF & 0xFF) << 8 | _loc16_ >> 24 & 0xFF & 0xFF;
               _loc12_ = _loc17_;
               _loc18_ = param6;
               _loc19_ = 0;
               _loc19_ = (_loc18_ >> 16 & 0xFF & 0xFF) << 24 | (_loc18_ >> 8 & 0xFF & 0xFF) << 16 | (_loc18_ & 0xFF & 0xFF) << 8 | _loc18_ >> 24 & 0xFF & 0xFF;
               _loc13_ = _loc19_;
               break;
            case 2:
               _loc14_ = param7;
               _loc15_ = 0;
               _loc15_ = (_loc14_ >> 8 & 0xFF & 0xFF) << 24 | (_loc14_ >> 16 & 0xFF & 0xFF) << 16 | (_loc14_ >> 24 & 0xFF & 0xFF) << 8 | _loc14_ & 0xFF & 0xFF;
               _loc11_ = _loc15_;
               _loc16_ = param8;
               _loc17_ = 0;
               _loc17_ = (_loc16_ >> 8 & 0xFF & 0xFF) << 24 | (_loc16_ >> 16 & 0xFF & 0xFF) << 16 | (_loc16_ >> 24 & 0xFF & 0xFF) << 8 | _loc16_ & 0xFF & 0xFF;
               _loc12_ = _loc17_;
               _loc18_ = param6;
               _loc19_ = 0;
               _loc19_ = (_loc18_ >> 8 & 0xFF & 0xFF) << 24 | (_loc18_ >> 16 & 0xFF & 0xFF) << 16 | (_loc18_ >> 24 & 0xFF & 0xFF) << 8 | _loc18_ & 0xFF & 0xFF;
               _loc13_ = _loc19_;
               break;
            default:
               _loc11_ = param7;
               _loc12_ = param8;
               _loc13_ = param6;
         }
         var _loc20_:String = param5;
         if(_loc20_ == "!=")
         {
            _loc14_ = 0;
         }
         else if(_loc20_ == "<")
         {
            _loc14_ = 2;
         }
         else if(_loc20_ == "<=")
         {
            _loc14_ = 3;
         }
         else if(_loc20_ == "==")
         {
            _loc14_ = 1;
         }
         else if(_loc20_ == ">")
         {
            _loc14_ = 4;
         }
         else if(_loc20_ == ">=")
         {
            _loc14_ = 5;
         }
         else
         {
            _loc14_ = -1;
         }
         if(_loc14_ == -1)
         {
            return 0;
         }
         var _loc21_:ArrayBufferView = param2.buffer.data;
         var _loc22_:ArrayBufferView = param1.buffer.data;
         if(_loc21_ == null || _loc22_ == null)
         {
            return 0;
         }
         _loc15_ = 0;
         var _loc23_:ImageDataView = new ImageDataView(param2,param3);
         var _loc24_:ImageDataView = new ImageDataView(param1,new Rectangle(param4.x,param4.y,_loc23_.width,_loc23_.height));
         _loc16_ = param2.buffer.format;
         _loc17_ = param1.buffer.format;
         var _loc25_:Boolean = param2.buffer.premultiplied;
         var _loc26_:Boolean = param1.buffer.premultiplied;
         var _loc27_:int = 0;
         var _loc28_:int = 0;
         var _loc32_:int = 0;
         var _loc33_:int = _loc24_.height;
         while(_loc32_ < _loc33_)
         {
            _loc34_ = _loc32_++;
            _loc18_ = _loc23_.byteOffset + _loc23_.stride * _loc34_;
            _loc19_ = _loc24_.byteOffset + _loc24_.stride * _loc34_;
            _loc35_ = 0;
            _loc36_ = _loc24_.width;
            for(; _loc35_ < _loc36_; _loc18_ += 4,_loc19_ += 4)
            {
               _loc37_ = _loc35_++;
               switch(_loc16_)
               {
                  case 0:
                     _loc27_ = (int(int(_loc21_.buffer.b[_loc21_.byteOffset + _loc18_])) & 0xFF) << 24 | (int(int(_loc21_.buffer.b[_loc21_.byteOffset + (_loc18_ + 1)])) & 0xFF) << 16 | (int(int(_loc21_.buffer.b[_loc21_.byteOffset + (_loc18_ + 2)])) & 0xFF) << 8 | int(int(_loc21_.buffer.b[_loc21_.byteOffset + (_loc18_ + 3)])) & 0xFF;
                     break;
                  case 1:
                     _loc27_ = (int(int(_loc21_.buffer.b[_loc21_.byteOffset + (_loc18_ + 1)])) & 0xFF) << 24 | (int(int(_loc21_.buffer.b[_loc21_.byteOffset + (_loc18_ + 2)])) & 0xFF) << 16 | (int(int(_loc21_.buffer.b[_loc21_.byteOffset + (_loc18_ + 3)])) & 0xFF) << 8 | int(int(_loc21_.buffer.b[_loc21_.byteOffset + _loc18_])) & 0xFF;
                     break;
                  case 2:
                     _loc27_ = (int(int(_loc21_.buffer.b[_loc21_.byteOffset + (_loc18_ + 2)])) & 0xFF) << 24 | (int(int(_loc21_.buffer.b[_loc21_.byteOffset + (_loc18_ + 1)])) & 0xFF) << 16 | (int(int(_loc21_.buffer.b[_loc21_.byteOffset + _loc18_])) & 0xFF) << 8 | int(int(_loc21_.buffer.b[_loc21_.byteOffset + (_loc18_ + 3)])) & 0xFF;
               }
               if(_loc25_)
               {
                  if((_loc27_ & 0xFF) != 0 && (_loc27_ & 0xFF) != 255)
                  {
                     RGBA_Impl_.unmult = 255 / (_loc27_ & 0xFF);
                     _loc38_ = RGBA_Impl_.__clamp;
                     _loc39_ = RGBA_Impl_.__clamp;
                     _loc40_ = RGBA_Impl_.__clamp;
                     _loc27_ = (int(int(_loc38_.buffer.b[_loc38_.byteOffset + int(Math.round((_loc27_ >> 24 & 0xFF) * RGBA_Impl_.unmult))])) & 0xFF) << 24 | (int(int(_loc39_.buffer.b[_loc39_.byteOffset + int(Math.round((_loc27_ >> 16 & 0xFF) * RGBA_Impl_.unmult))])) & 0xFF) << 16 | (int(int(_loc40_.buffer.b[_loc40_.byteOffset + int(Math.round((_loc27_ >> 8 & 0xFF) * RGBA_Impl_.unmult))])) & 0xFF) << 8 | _loc27_ & 0xFF & 0xFF;
                  }
               }
               _loc29_ = uint(_loc27_ & _loc12_);
               _loc41_ = uint(uint(_loc29_ >>> 24) & 0xFF);
               _loc42_ = uint(_loc13_ >>> 24 & 0xFF);
               if(_loc41_ != _loc42_)
               {
                  _loc31_ = _loc41_ > _loc42_ ? 1 : -1;
               }
               else
               {
                  _loc41_ = uint(uint(_loc29_ >>> 16) & 0xFF);
                  _loc42_ = uint(_loc13_ >>> 16 & 0xFF);
                  if(_loc41_ != _loc42_)
                  {
                     _loc31_ = _loc41_ > _loc42_ ? 1 : -1;
                  }
                  else
                  {
                     _loc41_ = uint(uint(_loc29_ >>> 8) & 0xFF);
                     _loc42_ = uint(_loc13_ >>> 8 & 0xFF);
                     if(_loc41_ != _loc42_)
                     {
                        _loc31_ = _loc41_ > _loc42_ ? 1 : -1;
                     }
                     else
                     {
                        _loc41_ = uint(_loc29_ & 0xFF);
                        _loc42_ = uint(_loc13_ & 0xFF);
                        _loc31_ = _loc41_ != _loc42_ ? (_loc41_ > _loc42_ ? 1 : -1) : 0;
                     }
                  }
               }
               switch(_loc14_)
               {
                  case 0:
                     _loc30_ = _loc31_ != 0;
                     break;
                  case 1:
                     _loc30_ = _loc31_ == 0;
                     break;
                  case 2:
                     _loc30_ = _loc31_ == -1;
                     break;
                  case 3:
                     _loc30_ = _loc31_ == 0 || _loc31_ == -1;
                     break;
                  case 4:
                     _loc30_ = _loc31_ == 1;
                     break;
                  case 5:
                     _loc30_ = _loc31_ == 0 || _loc31_ == 1;
                     break;
                  default:
                     _loc30_ = false;
               }
               if(_loc30_)
               {
                  if(_loc26_)
                  {
                     if((_loc11_ & 0xFF) == 0)
                     {
                        if(_loc11_ != 0)
                        {
                           _loc11_ = 0;
                        }
                     }
                     else if((_loc11_ & 0xFF) != 255)
                     {
                        _loc38_ = RGBA_Impl_.__alpha16;
                        _loc43_ = _loc38_.buffer;
                        _loc44_ = _loc38_.byteOffset + (_loc11_ & 0xFF) * 4;
                        _loc45_ = int(_loc43_.b[_loc44_]);
                        _loc46_ = int(_loc43_.b[_loc44_ + 1]);
                        _loc47_ = int(_loc43_.b[_loc44_ + 2]);
                        _loc48_ = int(_loc43_.b[_loc44_ + 3]);
                        RGBA_Impl_.a16 = _loc45_ | _loc46_ << 8 | _loc47_ << 16 | _loc48_ << 24;
                        _loc11_ = ((_loc11_ >> 24 & 0xFF) * RGBA_Impl_.a16 >> 16 & 0xFF) << 24 | ((_loc11_ >> 16 & 0xFF) * RGBA_Impl_.a16 >> 16 & 0xFF) << 16 | ((_loc11_ >> 8 & 0xFF) * RGBA_Impl_.a16 >> 16 & 0xFF) << 8 | _loc11_ & 0xFF & 0xFF;
                     }
                  }
                  switch(_loc17_)
                  {
                     case 0:
                        _loc49_ = uint(_loc11_ >> 24 & 0xFF);
                        _loc22_.buffer.b[_loc22_.byteOffset + _loc19_] = _loc49_;
                        _loc49_ = uint(_loc11_ >> 16 & 0xFF);
                        _loc22_.buffer.b[_loc22_.byteOffset + (_loc19_ + 1)] = _loc49_;
                        _loc49_ = uint(_loc11_ >> 8 & 0xFF);
                        _loc22_.buffer.b[_loc22_.byteOffset + (_loc19_ + 2)] = _loc49_;
                        _loc49_ = uint(_loc11_ & 0xFF);
                        _loc22_.buffer.b[_loc22_.byteOffset + (_loc19_ + 3)] = _loc49_;
                        break;
                     case 1:
                        _loc49_ = uint(_loc11_ & 0xFF);
                        _loc22_.buffer.b[_loc22_.byteOffset + _loc19_] = _loc49_;
                        _loc49_ = uint(_loc11_ >> 24 & 0xFF);
                        _loc22_.buffer.b[_loc22_.byteOffset + (_loc19_ + 1)] = _loc49_;
                        _loc49_ = uint(_loc11_ >> 16 & 0xFF);
                        _loc22_.buffer.b[_loc22_.byteOffset + (_loc19_ + 2)] = _loc49_;
                        _loc49_ = uint(_loc11_ >> 8 & 0xFF);
                        _loc22_.buffer.b[_loc22_.byteOffset + (_loc19_ + 3)] = _loc49_;
                        break;
                     case 2:
                        _loc49_ = uint(_loc11_ >> 8 & 0xFF);
                        _loc22_.buffer.b[_loc22_.byteOffset + _loc19_] = _loc49_;
                        _loc49_ = uint(_loc11_ >> 16 & 0xFF);
                        _loc22_.buffer.b[_loc22_.byteOffset + (_loc19_ + 1)] = _loc49_;
                        _loc49_ = uint(_loc11_ >> 24 & 0xFF);
                        _loc22_.buffer.b[_loc22_.byteOffset + (_loc19_ + 2)] = _loc49_;
                        _loc49_ = uint(_loc11_ & 0xFF);
                        _loc22_.buffer.b[_loc22_.byteOffset + (_loc19_ + 3)] = _loc49_;
                  }
                  _loc15_++;
                  continue;
               }
               if(!param9)
               {
                  continue;
               }
               if(_loc26_)
               {
                  if((_loc27_ & 0xFF) == 0)
                  {
                     if(_loc27_ != 0)
                     {
                        _loc27_ = 0;
                     }
                  }
                  else if((_loc27_ & 0xFF) != 255)
                  {
                     _loc38_ = RGBA_Impl_.__alpha16;
                     _loc43_ = _loc38_.buffer;
                     _loc44_ = _loc38_.byteOffset + (_loc27_ & 0xFF) * 4;
                     _loc45_ = int(_loc43_.b[_loc44_]);
                     _loc46_ = int(_loc43_.b[_loc44_ + 1]);
                     _loc47_ = int(_loc43_.b[_loc44_ + 2]);
                     _loc48_ = int(_loc43_.b[_loc44_ + 3]);
                     RGBA_Impl_.a16 = _loc45_ | _loc46_ << 8 | _loc47_ << 16 | _loc48_ << 24;
                     _loc27_ = ((_loc27_ >> 24 & 0xFF) * RGBA_Impl_.a16 >> 16 & 0xFF) << 24 | ((_loc27_ >> 16 & 0xFF) * RGBA_Impl_.a16 >> 16 & 0xFF) << 16 | ((_loc27_ >> 8 & 0xFF) * RGBA_Impl_.a16 >> 16 & 0xFF) << 8 | _loc27_ & 0xFF & 0xFF;
                  }
               }
               switch(_loc17_)
               {
                  case 0:
                     _loc49_ = uint(_loc27_ >> 24 & 0xFF);
                     _loc22_.buffer.b[_loc22_.byteOffset + _loc19_] = _loc49_;
                     _loc49_ = uint(_loc27_ >> 16 & 0xFF);
                     _loc22_.buffer.b[_loc22_.byteOffset + (_loc19_ + 1)] = _loc49_;
                     _loc49_ = uint(_loc27_ >> 8 & 0xFF);
                     _loc22_.buffer.b[_loc22_.byteOffset + (_loc19_ + 2)] = _loc49_;
                     _loc49_ = uint(_loc27_ & 0xFF);
                     _loc22_.buffer.b[_loc22_.byteOffset + (_loc19_ + 3)] = _loc49_;
                     break;
                  case 1:
                     _loc49_ = uint(_loc27_ & 0xFF);
                     _loc22_.buffer.b[_loc22_.byteOffset + _loc19_] = _loc49_;
                     _loc49_ = uint(_loc27_ >> 24 & 0xFF);
                     _loc22_.buffer.b[_loc22_.byteOffset + (_loc19_ + 1)] = _loc49_;
                     _loc49_ = uint(_loc27_ >> 16 & 0xFF);
                     _loc22_.buffer.b[_loc22_.byteOffset + (_loc19_ + 2)] = _loc49_;
                     _loc49_ = uint(_loc27_ >> 8 & 0xFF);
                     _loc22_.buffer.b[_loc22_.byteOffset + (_loc19_ + 3)] = _loc49_;
                     break;
                  case 2:
                     _loc49_ = uint(_loc27_ >> 8 & 0xFF);
                     _loc22_.buffer.b[_loc22_.byteOffset + _loc19_] = _loc49_;
                     _loc49_ = uint(_loc27_ >> 16 & 0xFF);
                     _loc22_.buffer.b[_loc22_.byteOffset + (_loc19_ + 1)] = _loc49_;
                     _loc49_ = uint(_loc27_ >> 24 & 0xFF);
                     _loc22_.buffer.b[_loc22_.byteOffset + (_loc19_ + 2)] = _loc49_;
                     _loc49_ = uint(_loc27_ & 0xFF);
                     _loc22_.buffer.b[_loc22_.byteOffset + (_loc19_ + 3)] = _loc49_;
               }
            }
         }
         if(_loc15_ > 0)
         {
            param1.dirty = true;
            ++param1.version;
         }
         return _loc15_;
      }
      
      public static function unmultiplyAlpha(param1:Image) : void
      {
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:* = null as ArrayBufferView;
         var _loc11_:* = null as ArrayBufferView;
         var _loc12_:* = null as ArrayBufferView;
         var _loc13_:uint = 0;
         var _loc2_:ArrayBufferView = param1.buffer.data;
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:int = param1.buffer.format;
         var _loc4_:int = int(_loc2_.length / 4);
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = _loc4_;
         while(_loc6_ < _loc7_)
         {
            _loc8_ = _loc6_++;
            _loc9_ = _loc8_ * 4;
            switch(_loc3_)
            {
               case 0:
                  _loc5_ = (int(int(_loc2_.buffer.b[_loc2_.byteOffset + _loc9_])) & 0xFF) << 24 | (int(int(_loc2_.buffer.b[_loc2_.byteOffset + (_loc9_ + 1)])) & 0xFF) << 16 | (int(int(_loc2_.buffer.b[_loc2_.byteOffset + (_loc9_ + 2)])) & 0xFF) << 8 | int(int(_loc2_.buffer.b[_loc2_.byteOffset + (_loc9_ + 3)])) & 0xFF;
                  break;
               case 1:
                  _loc5_ = (int(int(_loc2_.buffer.b[_loc2_.byteOffset + (_loc9_ + 1)])) & 0xFF) << 24 | (int(int(_loc2_.buffer.b[_loc2_.byteOffset + (_loc9_ + 2)])) & 0xFF) << 16 | (int(int(_loc2_.buffer.b[_loc2_.byteOffset + (_loc9_ + 3)])) & 0xFF) << 8 | int(int(_loc2_.buffer.b[_loc2_.byteOffset + _loc9_])) & 0xFF;
                  break;
               case 2:
                  _loc5_ = (int(int(_loc2_.buffer.b[_loc2_.byteOffset + (_loc9_ + 2)])) & 0xFF) << 24 | (int(int(_loc2_.buffer.b[_loc2_.byteOffset + (_loc9_ + 1)])) & 0xFF) << 16 | (int(int(_loc2_.buffer.b[_loc2_.byteOffset + _loc9_])) & 0xFF) << 8 | int(int(_loc2_.buffer.b[_loc2_.byteOffset + (_loc9_ + 3)])) & 0xFF;
            }
            if((_loc5_ & 0xFF) != 0 && (_loc5_ & 0xFF) != 255)
            {
               RGBA_Impl_.unmult = 255 / (_loc5_ & 0xFF);
               _loc10_ = RGBA_Impl_.__clamp;
               _loc11_ = RGBA_Impl_.__clamp;
               _loc12_ = RGBA_Impl_.__clamp;
               _loc5_ = (int(int(_loc10_.buffer.b[_loc10_.byteOffset + int(Math.round((_loc5_ >> 24 & 0xFF) * RGBA_Impl_.unmult))])) & 0xFF) << 24 | (int(int(_loc11_.buffer.b[_loc11_.byteOffset + int(Math.round((_loc5_ >> 16 & 0xFF) * RGBA_Impl_.unmult))])) & 0xFF) << 16 | (int(int(_loc12_.buffer.b[_loc12_.byteOffset + int(Math.round((_loc5_ >> 8 & 0xFF) * RGBA_Impl_.unmult))])) & 0xFF) << 8 | _loc5_ & 0xFF & 0xFF;
            }
            _loc9_ = _loc8_ * 4;
            switch(_loc3_)
            {
               case 0:
                  _loc13_ = uint(_loc5_ >> 24 & 0xFF);
                  _loc2_.buffer.b[_loc2_.byteOffset + _loc9_] = _loc13_;
                  _loc13_ = uint(_loc5_ >> 16 & 0xFF);
                  _loc2_.buffer.b[_loc2_.byteOffset + (_loc9_ + 1)] = _loc13_;
                  _loc13_ = uint(_loc5_ >> 8 & 0xFF);
                  _loc2_.buffer.b[_loc2_.byteOffset + (_loc9_ + 2)] = _loc13_;
                  _loc13_ = uint(_loc5_ & 0xFF);
                  _loc2_.buffer.b[_loc2_.byteOffset + (_loc9_ + 3)] = _loc13_;
                  break;
               case 1:
                  _loc13_ = uint(_loc5_ & 0xFF);
                  _loc2_.buffer.b[_loc2_.byteOffset + _loc9_] = _loc13_;
                  _loc13_ = uint(_loc5_ >> 24 & 0xFF);
                  _loc2_.buffer.b[_loc2_.byteOffset + (_loc9_ + 1)] = _loc13_;
                  _loc13_ = uint(_loc5_ >> 16 & 0xFF);
                  _loc2_.buffer.b[_loc2_.byteOffset + (_loc9_ + 2)] = _loc13_;
                  _loc13_ = uint(_loc5_ >> 8 & 0xFF);
                  _loc2_.buffer.b[_loc2_.byteOffset + (_loc9_ + 3)] = _loc13_;
                  break;
               case 2:
                  _loc13_ = uint(_loc5_ >> 8 & 0xFF);
                  _loc2_.buffer.b[_loc2_.byteOffset + _loc9_] = _loc13_;
                  _loc13_ = uint(_loc5_ >> 16 & 0xFF);
                  _loc2_.buffer.b[_loc2_.byteOffset + (_loc9_ + 1)] = _loc13_;
                  _loc13_ = uint(_loc5_ >> 24 & 0xFF);
                  _loc2_.buffer.b[_loc2_.byteOffset + (_loc9_ + 2)] = _loc13_;
                  _loc13_ = uint(_loc5_ & 0xFF);
                  _loc2_.buffer.b[_loc2_.byteOffset + (_loc9_ + 3)] = _loc13_;
            }
         }
         param1.buffer.premultiplied = false;
         param1.dirty = true;
         ++param1.version;
      }
      
      public static function __boxBlur(param1:ArrayBufferView, param2:ArrayBufferView, param3:int, param4:int, param5:Number, param6:Number) : void
      {
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc14_:int = 0;
         var _loc15_:int = 0;
         var _loc16_:int = 0;
         var _loc17_:int = 0;
         var _loc18_:int = 0;
         var _loc21_:int = 0;
         var _loc22_:int = 0;
         var _loc23_:int = 0;
         var _loc24_:int = 0;
         var _loc25_:uint = 0;
         var _loc7_:ArrayBufferView = param2;
         var _loc8_:Array = null;
         var _loc9_:int = 0;
         if(param1 != null && _loc8_ == null)
         {
            if(_loc9_ + param1.length > _loc7_.length)
            {
               throw Exception.thrown(TAError.RangeError);
            }
            if(_loc7_.bytesPerElement == param1.bytesPerElement)
            {
               _loc7_.buffer.blit(_loc9_ * _loc7_.bytesPerElement,param1.buffer,param1.byteOffset,param1.byteLength);
            }
            else
            {
               _loc10_ = 0;
               _loc11_ = param1.length;
               while(_loc10_ < _loc11_)
               {
                  _loc12_ = _loc10_++;
                  ArrayBufferView.transferElement(param1,_loc12_,_loc7_,_loc9_ + _loc12_);
               }
            }
         }
         else
         {
            if(!(_loc8_ != null && param1 == null))
            {
               throw Exception.thrown("Invalid .set call. either view, or array must be not-null.");
            }
            _loc7_.copyFromArray(_loc8_,_loc9_);
         }
         _loc9_ = int(param5);
         _loc10_ = int(param6);
         ImageDataUtil.__boxBlurH(param2,param1,param3,param4,_loc9_,0);
         ImageDataUtil.__boxBlurH(param2,param1,param3,param4,_loc9_,1);
         ImageDataUtil.__boxBlurH(param2,param1,param3,param4,_loc9_,2);
         ImageDataUtil.__boxBlurH(param2,param1,param3,param4,_loc9_,3);
         var _loc13_:Number = 1 / (_loc10_ + _loc10_ + 1);
         _loc11_ = param3 * 4;
         var _loc19_:int = 0;
         var _loc20_:int = param3;
         while(_loc19_ < _loc20_)
         {
            _loc21_ = _loc19_++;
            _loc12_ = _loc21_ * 4;
            _loc14_ = _loc12_;
            _loc15_ = _loc12_ + _loc10_ * _loc11_;
            _loc16_ = int(int(param1.buffer.b[param1.byteOffset + _loc12_]));
            _loc17_ = int(int(param1.buffer.b[param1.byteOffset + (_loc12_ + _loc11_ * (param4 - 1))]));
            _loc18_ = (_loc10_ + 1) * _loc16_;
            _loc22_ = 0;
            _loc23_ = _loc10_;
            while(_loc22_ < _loc23_)
            {
               _loc24_ = _loc22_++;
               _loc18_ = int(uint(int(param1.buffer.b[param1.byteOffset + (_loc12_ + _loc24_ * _loc11_)]) + _loc18_));
            }
            _loc22_ = 0;
            _loc23_ = _loc10_ + 1;
            while(_loc22_ < _loc23_)
            {
               _loc24_ = _loc22_++;
               _loc18_ = int(uint(int(param1.buffer.b[param1.byteOffset + _loc15_]) - _loc16_ + _loc18_));
               _loc25_ = uint(int(Math.round(_loc18_ * _loc13_)));
               param2.buffer.b[param2.byteOffset + _loc12_] = _loc25_;
               _loc15_ += _loc11_;
               _loc12_ += _loc11_;
            }
            _loc22_ = _loc10_ + 1;
            _loc23_ = param4 - _loc10_;
            while(_loc22_ < _loc23_)
            {
               _loc24_ = _loc22_++;
               _loc18_ = int(uint(int(param1.buffer.b[param1.byteOffset + _loc15_]) - int(param1.buffer.b[param1.byteOffset + _loc14_]) + _loc18_));
               _loc25_ = uint(int(Math.round(_loc18_ * _loc13_)));
               param2.buffer.b[param2.byteOffset + _loc12_] = _loc25_;
               _loc14_ += _loc11_;
               _loc15_ += _loc11_;
               _loc12_ += _loc11_;
            }
            _loc22_ = param4 - _loc10_;
            _loc23_ = param4;
            while(_loc22_ < _loc23_)
            {
               _loc24_ = _loc22_++;
               _loc18_ = int(uint(_loc17_ - int(param1.buffer.b[param1.byteOffset + _loc14_]) + _loc18_));
               _loc25_ = uint(int(Math.round(_loc18_ * _loc13_)));
               param2.buffer.b[param2.byteOffset + _loc12_] = _loc25_;
               _loc14_ += _loc11_;
               _loc12_ += _loc11_;
            }
         }
         _loc13_ = 1 / (_loc10_ + _loc10_ + 1);
         _loc11_ = param3 * 4;
         _loc19_ = 0;
         _loc20_ = param3;
         while(_loc19_ < _loc20_)
         {
            _loc21_ = _loc19_++;
            _loc12_ = _loc21_ * 4 + 1;
            _loc14_ = _loc12_;
            _loc15_ = _loc12_ + _loc10_ * _loc11_;
            _loc16_ = int(int(param1.buffer.b[param1.byteOffset + _loc12_]));
            _loc17_ = int(int(param1.buffer.b[param1.byteOffset + (_loc12_ + _loc11_ * (param4 - 1))]));
            _loc18_ = (_loc10_ + 1) * _loc16_;
            _loc22_ = 0;
            _loc23_ = _loc10_;
            while(_loc22_ < _loc23_)
            {
               _loc24_ = _loc22_++;
               _loc18_ = int(uint(int(param1.buffer.b[param1.byteOffset + (_loc12_ + _loc24_ * _loc11_)]) + _loc18_));
            }
            _loc22_ = 0;
            _loc23_ = _loc10_ + 1;
            while(_loc22_ < _loc23_)
            {
               _loc24_ = _loc22_++;
               _loc18_ = int(uint(int(param1.buffer.b[param1.byteOffset + _loc15_]) - _loc16_ + _loc18_));
               _loc25_ = uint(int(Math.round(_loc18_ * _loc13_)));
               param2.buffer.b[param2.byteOffset + _loc12_] = _loc25_;
               _loc15_ += _loc11_;
               _loc12_ += _loc11_;
            }
            _loc22_ = _loc10_ + 1;
            _loc23_ = param4 - _loc10_;
            while(_loc22_ < _loc23_)
            {
               _loc24_ = _loc22_++;
               _loc18_ = int(uint(int(param1.buffer.b[param1.byteOffset + _loc15_]) - int(param1.buffer.b[param1.byteOffset + _loc14_]) + _loc18_));
               _loc25_ = uint(int(Math.round(_loc18_ * _loc13_)));
               param2.buffer.b[param2.byteOffset + _loc12_] = _loc25_;
               _loc14_ += _loc11_;
               _loc15_ += _loc11_;
               _loc12_ += _loc11_;
            }
            _loc22_ = param4 - _loc10_;
            _loc23_ = param4;
            while(_loc22_ < _loc23_)
            {
               _loc24_ = _loc22_++;
               _loc18_ = int(uint(_loc17_ - int(param1.buffer.b[param1.byteOffset + _loc14_]) + _loc18_));
               _loc25_ = uint(int(Math.round(_loc18_ * _loc13_)));
               param2.buffer.b[param2.byteOffset + _loc12_] = _loc25_;
               _loc14_ += _loc11_;
               _loc12_ += _loc11_;
            }
         }
         _loc13_ = 1 / (_loc10_ + _loc10_ + 1);
         _loc11_ = param3 * 4;
         _loc19_ = 0;
         _loc20_ = param3;
         while(_loc19_ < _loc20_)
         {
            _loc21_ = _loc19_++;
            _loc12_ = _loc21_ * 4 + 2;
            _loc14_ = _loc12_;
            _loc15_ = _loc12_ + _loc10_ * _loc11_;
            _loc16_ = int(int(param1.buffer.b[param1.byteOffset + _loc12_]));
            _loc17_ = int(int(param1.buffer.b[param1.byteOffset + (_loc12_ + _loc11_ * (param4 - 1))]));
            _loc18_ = (_loc10_ + 1) * _loc16_;
            _loc22_ = 0;
            _loc23_ = _loc10_;
            while(_loc22_ < _loc23_)
            {
               _loc24_ = _loc22_++;
               _loc18_ = int(uint(int(param1.buffer.b[param1.byteOffset + (_loc12_ + _loc24_ * _loc11_)]) + _loc18_));
            }
            _loc22_ = 0;
            _loc23_ = _loc10_ + 1;
            while(_loc22_ < _loc23_)
            {
               _loc24_ = _loc22_++;
               _loc18_ = int(uint(int(param1.buffer.b[param1.byteOffset + _loc15_]) - _loc16_ + _loc18_));
               _loc25_ = uint(int(Math.round(_loc18_ * _loc13_)));
               param2.buffer.b[param2.byteOffset + _loc12_] = _loc25_;
               _loc15_ += _loc11_;
               _loc12_ += _loc11_;
            }
            _loc22_ = _loc10_ + 1;
            _loc23_ = param4 - _loc10_;
            while(_loc22_ < _loc23_)
            {
               _loc24_ = _loc22_++;
               _loc18_ = int(uint(int(param1.buffer.b[param1.byteOffset + _loc15_]) - int(param1.buffer.b[param1.byteOffset + _loc14_]) + _loc18_));
               _loc25_ = uint(int(Math.round(_loc18_ * _loc13_)));
               param2.buffer.b[param2.byteOffset + _loc12_] = _loc25_;
               _loc14_ += _loc11_;
               _loc15_ += _loc11_;
               _loc12_ += _loc11_;
            }
            _loc22_ = param4 - _loc10_;
            _loc23_ = param4;
            while(_loc22_ < _loc23_)
            {
               _loc24_ = _loc22_++;
               _loc18_ = int(uint(_loc17_ - int(param1.buffer.b[param1.byteOffset + _loc14_]) + _loc18_));
               _loc25_ = uint(int(Math.round(_loc18_ * _loc13_)));
               param2.buffer.b[param2.byteOffset + _loc12_] = _loc25_;
               _loc14_ += _loc11_;
               _loc12_ += _loc11_;
            }
         }
         _loc13_ = 1 / (_loc10_ + _loc10_ + 1);
         _loc11_ = param3 * 4;
         _loc19_ = 0;
         _loc20_ = param3;
         while(_loc19_ < _loc20_)
         {
            _loc21_ = _loc19_++;
            _loc12_ = _loc21_ * 4 + 3;
            _loc14_ = _loc12_;
            _loc15_ = _loc12_ + _loc10_ * _loc11_;
            _loc16_ = int(int(param1.buffer.b[param1.byteOffset + _loc12_]));
            _loc17_ = int(int(param1.buffer.b[param1.byteOffset + (_loc12_ + _loc11_ * (param4 - 1))]));
            _loc18_ = (_loc10_ + 1) * _loc16_;
            _loc22_ = 0;
            _loc23_ = _loc10_;
            while(_loc22_ < _loc23_)
            {
               _loc24_ = _loc22_++;
               _loc18_ = int(uint(int(param1.buffer.b[param1.byteOffset + (_loc12_ + _loc24_ * _loc11_)]) + _loc18_));
            }
            _loc22_ = 0;
            _loc23_ = _loc10_ + 1;
            while(_loc22_ < _loc23_)
            {
               _loc24_ = _loc22_++;
               _loc18_ = int(uint(int(param1.buffer.b[param1.byteOffset + _loc15_]) - _loc16_ + _loc18_));
               _loc25_ = uint(int(Math.round(_loc18_ * _loc13_)));
               param2.buffer.b[param2.byteOffset + _loc12_] = _loc25_;
               _loc15_ += _loc11_;
               _loc12_ += _loc11_;
            }
            _loc22_ = _loc10_ + 1;
            _loc23_ = param4 - _loc10_;
            while(_loc22_ < _loc23_)
            {
               _loc24_ = _loc22_++;
               _loc18_ = int(uint(int(param1.buffer.b[param1.byteOffset + _loc15_]) - int(param1.buffer.b[param1.byteOffset + _loc14_]) + _loc18_));
               _loc25_ = uint(int(Math.round(_loc18_ * _loc13_)));
               param2.buffer.b[param2.byteOffset + _loc12_] = _loc25_;
               _loc14_ += _loc11_;
               _loc15_ += _loc11_;
               _loc12_ += _loc11_;
            }
            _loc22_ = param4 - _loc10_;
            _loc23_ = param4;
            while(_loc22_ < _loc23_)
            {
               _loc24_ = _loc22_++;
               _loc18_ = int(uint(_loc17_ - int(param1.buffer.b[param1.byteOffset + _loc14_]) + _loc18_));
               _loc25_ = uint(int(Math.round(_loc18_ * _loc13_)));
               param2.buffer.b[param2.byteOffset + _loc12_] = _loc25_;
               _loc14_ += _loc11_;
               _loc12_ += _loc11_;
            }
         }
      }
      
      public static function __boxBlurH(param1:ArrayBufferView, param2:ArrayBufferView, param3:int, param4:int, param5:int, param6:int) : void
      {
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc16_:int = 0;
         var _loc17_:int = 0;
         var _loc18_:int = 0;
         var _loc19_:int = 0;
         var _loc20_:uint = 0;
         var _loc7_:Number = 1 / (param5 + param5 + 1);
         var _loc14_:int = 0;
         var _loc15_:int = param4;
         while(_loc14_ < _loc15_)
         {
            _loc16_ = _loc14_++;
            _loc8_ = _loc16_ * param3;
            _loc9_ = _loc8_;
            _loc10_ = _loc8_ + param5;
            _loc11_ = int(int(param1.buffer.b[param1.byteOffset + (_loc8_ * 4 + param6)]));
            _loc12_ = int(int(param1.buffer.b[param1.byteOffset + ((_loc8_ + param3 - 1) * 4 + param6)]));
            _loc13_ = (param5 + 1) * _loc11_;
            _loc17_ = 0;
            _loc18_ = param5;
            while(_loc17_ < _loc18_)
            {
               _loc19_ = _loc17_++;
               _loc13_ = int(uint(int(param1.buffer.b[param1.byteOffset + ((_loc8_ + _loc19_) * 4 + param6)]) + _loc13_));
            }
            _loc17_ = 0;
            _loc18_ = param5 + 1;
            while(_loc17_ < _loc18_)
            {
               _loc19_ = _loc17_++;
               _loc13_ = int(uint(int(param1.buffer.b[param1.byteOffset + (_loc10_ * 4 + param6)]) - _loc11_ + _loc13_));
               _loc20_ = uint(int(Math.round(_loc13_ * _loc7_)));
               param2.buffer.b[param2.byteOffset + (_loc8_ * 4 + param6)] = _loc20_;
               _loc10_++;
               _loc8_++;
            }
            _loc17_ = param5 + 1;
            _loc18_ = param3 - param5;
            while(_loc17_ < _loc18_)
            {
               _loc19_ = _loc17_++;
               _loc13_ = int(uint(int(param1.buffer.b[param1.byteOffset + (_loc10_ * 4 + param6)]) - int(param1.buffer.b[param1.byteOffset + (_loc9_ * 4 + param6)]) + _loc13_));
               _loc20_ = uint(int(Math.round(_loc13_ * _loc7_)));
               param2.buffer.b[param2.byteOffset + (_loc8_ * 4 + param6)] = _loc20_;
               _loc10_++;
               _loc9_++;
               _loc8_++;
            }
            _loc17_ = param3 - param5;
            _loc18_ = param3;
            while(_loc17_ < _loc18_)
            {
               _loc19_ = _loc17_++;
               _loc13_ = int(uint(_loc12_ - int(param1.buffer.b[param1.byteOffset + (_loc9_ * 4 + param6)]) + _loc13_));
               _loc20_ = uint(int(Math.round(_loc13_ * _loc7_)));
               param2.buffer.b[param2.byteOffset + (_loc8_ * 4 + param6)] = _loc20_;
               _loc9_++;
               _loc8_++;
            }
         }
      }
      
      public static function __boxBlurT(param1:ArrayBufferView, param2:ArrayBufferView, param3:int, param4:int, param5:int, param6:int) : void
      {
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc17_:int = 0;
         var _loc18_:int = 0;
         var _loc19_:int = 0;
         var _loc20_:int = 0;
         var _loc21_:uint = 0;
         var _loc7_:Number = 1 / (param5 + param5 + 1);
         var _loc8_:int = param3 * 4;
         var _loc15_:int = 0;
         var _loc16_:int = param3;
         while(_loc15_ < _loc16_)
         {
            _loc17_ = _loc15_++;
            _loc9_ = _loc17_ * 4 + param6;
            _loc10_ = _loc9_;
            _loc11_ = _loc9_ + param5 * _loc8_;
            _loc12_ = int(int(param1.buffer.b[param1.byteOffset + _loc9_]));
            _loc13_ = int(int(param1.buffer.b[param1.byteOffset + (_loc9_ + _loc8_ * (param4 - 1))]));
            _loc14_ = (param5 + 1) * _loc12_;
            _loc18_ = 0;
            _loc19_ = param5;
            while(_loc18_ < _loc19_)
            {
               _loc20_ = _loc18_++;
               _loc14_ = int(uint(int(param1.buffer.b[param1.byteOffset + (_loc9_ + _loc20_ * _loc8_)]) + _loc14_));
            }
            _loc18_ = 0;
            _loc19_ = param5 + 1;
            while(_loc18_ < _loc19_)
            {
               _loc20_ = _loc18_++;
               _loc14_ = int(uint(int(param1.buffer.b[param1.byteOffset + _loc11_]) - _loc12_ + _loc14_));
               _loc21_ = uint(int(Math.round(_loc14_ * _loc7_)));
               param2.buffer.b[param2.byteOffset + _loc9_] = _loc21_;
               _loc11_ += _loc8_;
               _loc9_ += _loc8_;
            }
            _loc18_ = param5 + 1;
            _loc19_ = param4 - param5;
            while(_loc18_ < _loc19_)
            {
               _loc20_ = _loc18_++;
               _loc14_ = int(uint(int(param1.buffer.b[param1.byteOffset + _loc11_]) - int(param1.buffer.b[param1.byteOffset + _loc10_]) + _loc14_));
               _loc21_ = uint(int(Math.round(_loc14_ * _loc7_)));
               param2.buffer.b[param2.byteOffset + _loc9_] = _loc21_;
               _loc10_ += _loc8_;
               _loc11_ += _loc8_;
               _loc9_ += _loc8_;
            }
            _loc18_ = param4 - param5;
            _loc19_ = param4;
            while(_loc18_ < _loc19_)
            {
               _loc20_ = _loc18_++;
               _loc14_ = int(uint(_loc13_ - int(param1.buffer.b[param1.byteOffset + _loc10_]) + _loc14_));
               _loc21_ = uint(int(Math.round(_loc14_ * _loc7_)));
               param2.buffer.b[param2.byteOffset + _loc9_] = _loc21_;
               _loc10_ += _loc8_;
               _loc9_ += _loc8_;
            }
         }
      }
      
      public static function __calculateSourceOffset(param1:Rectangle, param2:Vector2, param3:int, param4:int) : int
      {
         var _loc5_:int = param3 - int(param2.x);
         var _loc6_:int = param4 - int(param2.y);
         var _loc7_:int = 0;
         if(_loc5_ < 0 || _loc6_ < 0 || _loc5_ >= param1.width || _loc6_ >= param1.height)
         {
            _loc7_ = -1;
         }
         else
         {
            _loc7_ = 4 * (_loc6_ * int(param1.width) + _loc5_);
         }
         return _loc7_;
      }
      
      public static function __getBoxesForGaussianBlur(param1:Number, param2:int) : Array
      {
         var _loc11_:int = 0;
         var _loc3_:Number = Math.sqrt(12 * param1 * param1 / param2 + 1);
         var _loc4_:int = int(Math.floor(_loc3_));
         if(int(_loc4_ % 2) == 0)
         {
            _loc4_--;
         }
         var _loc5_:int = _loc4_ + 2;
         var _loc6_:Number = (12 * param1 * param1 - param2 * _loc4_ * _loc4_ - 4 * param2 * _loc4_ - 3 * param2) / (-4 * _loc4_ - 4);
         var _loc7_:int = int(Math.round(_loc6_));
         var _loc8_:Array = [];
         var _loc9_:int = 0;
         var _loc10_:int = param2;
         while(_loc9_ < _loc10_)
         {
            _loc11_ = _loc9_++;
            _loc8_.push(_loc11_ < _loc7_ ? _loc4_ : _loc5_);
         }
         return _loc8_;
      }
      
      public static function __pixelCompare(param1:uint, param2:uint) : int
      {
         var _loc3_:uint = uint(uint(param1 >>> 24) & 0xFF);
         var _loc4_:uint = uint(uint(param2 >>> 24) & 0xFF);
         if(_loc3_ != _loc4_)
         {
            if(_loc3_ > _loc4_)
            {
               return 1;
            }
            return -1;
         }
         _loc3_ = uint(uint(param1 >>> 16) & 0xFF);
         _loc4_ = uint(uint(param2 >>> 16) & 0xFF);
         if(_loc3_ != _loc4_)
         {
            if(_loc3_ > _loc4_)
            {
               return 1;
            }
            return -1;
         }
         _loc3_ = uint(uint(param1 >>> 8) & 0xFF);
         _loc4_ = uint(uint(param2 >>> 8) & 0xFF);
         if(_loc3_ != _loc4_)
         {
            if(_loc3_ > _loc4_)
            {
               return 1;
            }
            return -1;
         }
         _loc3_ = uint(param1 & 0xFF);
         _loc4_ = uint(param2 & 0xFF);
         if(_loc3_ != _loc4_)
         {
            if(_loc3_ > _loc4_)
            {
               return 1;
            }
            return -1;
         }
         return 0;
      }
      
      public static function __translatePixel(param1:ArrayBufferView, param2:Rectangle, param3:Rectangle, param4:Vector2, param5:int, param6:int, param7:Number) : void
      {
         var _loc10_:uint = 0;
         var _loc11_:uint = 0;
         var _loc12_:uint = 0;
         var _loc13_:int = 0;
         var _loc8_:int = 4 * (param6 * int(param3.width) + param5);
         var _loc9_:int = ImageDataUtil.__calculateSourceOffset(param2,param4,param5,param6);
         if(_loc9_ < 0)
         {
            param1.buffer.b[param1.byteOffset + (_loc8_ + 3)] = 0;
            _loc10_ = 0;
            param1.buffer.b[param1.byteOffset + (_loc8_ + 2)] = _loc10_;
            _loc11_ = _loc10_;
            param1.buffer.b[param1.byteOffset + (_loc8_ + 1)] = _loc11_;
            _loc12_ = _loc11_;
            param1.buffer.b[param1.byteOffset + _loc8_] = _loc12_;
         }
         else
         {
            _loc10_ = uint(int(param1.buffer.b[param1.byteOffset + _loc9_]));
            param1.buffer.b[param1.byteOffset + _loc8_] = _loc10_;
            _loc10_ = uint(int(param1.buffer.b[param1.byteOffset + (_loc9_ + 1)]));
            param1.buffer.b[param1.byteOffset + (_loc8_ + 1)] = _loc10_;
            _loc10_ = uint(int(param1.buffer.b[param1.byteOffset + (_loc9_ + 2)]));
            param1.buffer.b[param1.byteOffset + (_loc8_ + 2)] = _loc10_;
            _loc13_ = int(int(param1.buffer.b[param1.byteOffset + (_loc9_ + 3)]) * param7);
            _loc10_ = uint(_loc13_ < 0 ? 0 : (_loc13_ > 255 ? 255 : _loc13_));
            param1.buffer.b[param1.byteOffset + (_loc8_ + 3)] = _loc10_;
         }
      }
   }
}

