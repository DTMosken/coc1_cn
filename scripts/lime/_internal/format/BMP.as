package lime._internal.format
{
   import haxe.io.Bytes;
   import lime.graphics.Image;
   import lime.math.Rectangle;
   
   public class BMP
   {
      
      public function BMP()
      {
      }
      
      public static function encode(param1:Image, param2:BMPType = undefined) : Bytes
      {
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc15_:int = 0;
         var _loc16_:int = 0;
         var _loc17_:int = 0;
         var _loc18_:int = 0;
         var _loc19_:int = 0;
         var _loc20_:* = null as Bytes;
         var _loc21_:int = 0;
         if(param1.get_premultiplied() || param1.get_format() != 0)
         {
            param1 = param1.clone();
            param1.set_premultiplied(false);
            param1.set_format(0);
         }
         if(param2 == null)
         {
            param2 = BMPType.RGB;
         }
         var _loc3_:int = 14;
         var _loc4_:int = 40;
         var _loc5_:int = param1.width * param1.height * 4;
         if(param2 != null)
         {
            switch(param2.index)
            {
               case 0:
                  _loc5_ = (param1.width * 3 + int(param1.width * 3 % 4)) * param1.height;
                  break;
               case 1:
                  _loc4_ = 108;
                  break;
               case 2:
                  _loc3_ = 0;
                  _loc5_ += param1.width * param1.height;
            }
         }
         var _loc6_:Bytes = Bytes.alloc(_loc3_ + _loc4_ + _loc5_);
         var _loc7_:int = 0;
         if(_loc3_ > 0)
         {
            _loc6_.b[_loc7_++] = 66;
            _loc6_.b[_loc7_++] = 77;
            _loc8_ = _loc6_.length;
            _loc6_.b[_loc7_] = _loc8_;
            _loc6_.b[_loc7_ + 1] = _loc8_ >> 8;
            _loc6_.b[_loc7_ + 2] = _loc8_ >> 16;
            _loc6_.b[_loc7_ + 3] = _loc8_ >>> 24;
            _loc7_ += 4;
            _loc6_.b[_loc7_] = 0;
            _loc6_.b[_loc7_ + 1] = 0;
            _loc7_ += 2;
            _loc6_.b[_loc7_] = 0;
            _loc6_.b[_loc7_ + 1] = 0;
            _loc7_ += 2;
            _loc8_ = _loc3_ + _loc4_;
            _loc6_.b[_loc7_] = _loc8_;
            _loc6_.b[_loc7_ + 1] = _loc8_ >> 8;
            _loc6_.b[_loc7_ + 2] = _loc8_ >> 16;
            _loc6_.b[_loc7_ + 3] = _loc8_ >>> 24;
            _loc7_ += 4;
         }
         _loc6_.b[_loc7_] = _loc4_;
         _loc6_.b[_loc7_ + 1] = _loc4_ >> 8;
         _loc6_.b[_loc7_ + 2] = _loc4_ >> 16;
         _loc6_.b[_loc7_ + 3] = _loc4_ >>> 24;
         _loc7_ += 4;
         _loc8_ = param1.width;
         _loc6_.b[_loc7_] = _loc8_;
         _loc6_.b[_loc7_ + 1] = _loc8_ >> 8;
         _loc6_.b[_loc7_ + 2] = _loc8_ >> 16;
         _loc6_.b[_loc7_ + 3] = _loc8_ >>> 24;
         _loc7_ += 4;
         _loc8_ = param2 == BMPType.ICO ? param1.height * 2 : param1.height;
         _loc6_.b[_loc7_] = _loc8_;
         _loc6_.b[_loc7_ + 1] = _loc8_ >> 8;
         _loc6_.b[_loc7_ + 2] = _loc8_ >> 16;
         _loc6_.b[_loc7_ + 3] = _loc8_ >>> 24;
         _loc7_ += 4;
         _loc6_.b[_loc7_] = 1;
         _loc6_.b[_loc7_ + 1] = 0;
         _loc7_ += 2;
         _loc8_ = param2 == BMPType.RGB ? 24 : 32;
         _loc6_.b[_loc7_] = _loc8_;
         _loc6_.b[_loc7_ + 1] = _loc8_ >> 8;
         _loc7_ += 2;
         _loc8_ = param2 == BMPType.BITFIELD ? 3 : 0;
         _loc6_.b[_loc7_] = _loc8_;
         _loc6_.b[_loc7_ + 1] = _loc8_ >> 8;
         _loc6_.b[_loc7_ + 2] = _loc8_ >> 16;
         _loc6_.b[_loc7_ + 3] = _loc8_ >>> 24;
         _loc7_ += 4;
         _loc6_.b[_loc7_] = _loc5_;
         _loc6_.b[_loc7_ + 1] = _loc5_ >> 8;
         _loc6_.b[_loc7_ + 2] = _loc5_ >> 16;
         _loc6_.b[_loc7_ + 3] = _loc5_ >>> 24;
         _loc7_ += 4;
         _loc6_.b[_loc7_] = 11824;
         _loc6_.b[_loc7_ + 1] = 46;
         _loc6_.b[_loc7_ + 2] = 0;
         _loc6_.b[_loc7_ + 3] = 0;
         _loc7_ += 4;
         _loc6_.b[_loc7_] = 11824;
         _loc6_.b[_loc7_ + 1] = 46;
         _loc6_.b[_loc7_ + 2] = 0;
         _loc6_.b[_loc7_ + 3] = 0;
         _loc7_ += 4;
         _loc6_.b[_loc7_] = 0;
         _loc6_.b[_loc7_ + 1] = 0;
         _loc6_.b[_loc7_ + 2] = 0;
         _loc6_.b[_loc7_ + 3] = 0;
         _loc7_ += 4;
         _loc6_.b[_loc7_] = 0;
         _loc6_.b[_loc7_ + 1] = 0;
         _loc6_.b[_loc7_ + 2] = 0;
         _loc6_.b[_loc7_ + 3] = 0;
         _loc7_ += 4;
         if(param2 == BMPType.BITFIELD)
         {
            _loc6_.b[_loc7_] = 16711680;
            _loc6_.b[_loc7_ + 1] = 65280;
            _loc6_.b[_loc7_ + 2] = 255;
            _loc6_.b[_loc7_ + 3] = 0;
            _loc7_ += 4;
            _loc6_.b[_loc7_] = 65280;
            _loc6_.b[_loc7_ + 1] = 255;
            _loc6_.b[_loc7_ + 2] = 0;
            _loc6_.b[_loc7_ + 3] = 0;
            _loc7_ += 4;
            _loc6_.b[_loc7_] = 255;
            _loc6_.b[_loc7_ + 1] = 0;
            _loc6_.b[_loc7_ + 2] = 0;
            _loc6_.b[_loc7_ + 3] = 0;
            _loc7_ += 4;
            _loc6_.b[_loc7_] = -16777216;
            _loc6_.b[_loc7_ + 1] = -65536;
            _loc6_.b[_loc7_ + 2] = -256;
            _loc6_.b[_loc7_ + 3] = 255;
            _loc7_ += 4;
            _loc6_.b[_loc7_++] = 32;
            _loc6_.b[_loc7_++] = 110;
            _loc6_.b[_loc7_++] = 105;
            _loc6_.b[_loc7_++] = 87;
            _loc8_ = 0;
            while(_loc8_ < 48)
            {
               _loc9_ = _loc8_++;
               _loc6_.b[_loc7_++] = 0;
            }
         }
         var _loc10_:Bytes = param1.getPixels(new Rectangle(0,0,param1.width,param1.height),1);
         _loc8_ = 0;
         if(param2 != null)
         {
            switch(param2.index)
            {
               case 0:
                  _loc14_ = 0;
                  _loc15_ = param1.height;
                  while(_loc14_ < _loc15_)
                  {
                     _loc16_ = _loc14_++;
                     _loc8_ = (param1.height - 1 - _loc16_) * 4 * param1.width;
                     _loc17_ = 0;
                     _loc18_ = param1.width;
                     while(_loc17_ < _loc18_)
                     {
                        _loc19_ = _loc17_++;
                        _loc9_ = int(_loc10_.b[_loc8_++]);
                        _loc11_ = int(_loc10_.b[_loc8_++]);
                        _loc12_ = int(_loc10_.b[_loc8_++]);
                        _loc13_ = int(_loc10_.b[_loc8_++]);
                        _loc6_.b[_loc7_++] = _loc13_;
                        _loc6_.b[_loc7_++] = _loc12_;
                        _loc6_.b[_loc7_++] = _loc11_;
                     }
                     _loc17_ = 0;
                     _loc18_ = int(param1.width * 3 % 4);
                     while(_loc17_ < _loc18_)
                     {
                        _loc19_ = _loc17_++;
                        _loc6_.b[_loc7_++] = 0;
                     }
                  }
                  break;
               case 1:
                  _loc14_ = 0;
                  _loc15_ = param1.height;
                  while(_loc14_ < _loc15_)
                  {
                     _loc16_ = _loc14_++;
                     _loc8_ = (param1.height - 1 - _loc16_) * 4 * param1.width;
                     _loc17_ = 0;
                     _loc18_ = param1.width;
                     while(_loc17_ < _loc18_)
                     {
                        _loc19_ = _loc17_++;
                        _loc9_ = int(_loc10_.b[_loc8_++]);
                        _loc11_ = int(_loc10_.b[_loc8_++]);
                        _loc12_ = int(_loc10_.b[_loc8_++]);
                        _loc13_ = int(_loc10_.b[_loc8_++]);
                        _loc6_.b[_loc7_++] = _loc13_;
                        _loc6_.b[_loc7_++] = _loc12_;
                        _loc6_.b[_loc7_++] = _loc11_;
                        _loc6_.b[_loc7_++] = _loc9_;
                     }
                  }
                  break;
               case 2:
                  _loc20_ = Bytes.alloc(param1.width * param1.height);
                  _loc14_ = 0;
                  _loc15_ = 0;
                  _loc16_ = param1.height;
                  while(_loc15_ < _loc16_)
                  {
                     _loc17_ = _loc15_++;
                     _loc8_ = (param1.height - 1 - _loc17_) * 4 * param1.width;
                     _loc18_ = 0;
                     _loc19_ = param1.width;
                     while(_loc18_ < _loc19_)
                     {
                        _loc21_ = _loc18_++;
                        _loc9_ = int(_loc10_.b[_loc8_++]);
                        _loc11_ = int(_loc10_.b[_loc8_++]);
                        _loc12_ = int(_loc10_.b[_loc8_++]);
                        _loc13_ = int(_loc10_.b[_loc8_++]);
                        _loc6_.b[_loc7_++] = _loc13_;
                        _loc6_.b[_loc7_++] = _loc12_;
                        _loc6_.b[_loc7_++] = _loc11_;
                        _loc6_.b[_loc7_++] = _loc9_;
                        _loc20_.b[_loc14_++] = 0;
                     }
                  }
                  _loc6_.blit(_loc7_,_loc20_,0,param1.width * param1.height);
            }
         }
         return _loc6_;
      }
   }
}

