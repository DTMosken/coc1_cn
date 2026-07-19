package lime.math._ColorMatrix
{
   import flash.geom.ColorTransform;
   import haxe.Exception;
   import haxe.io.Bytes;
   import lime.utils.ArrayBufferView;
   import lime.utils.TAError;
   
   public final class ColorMatrix_Impl_
   {
      
      public static var __alphaTable:ArrayBufferView;
      
      public static var __blueTable:ArrayBufferView;
      
      public static var __greenTable:ArrayBufferView;
      
      public static var __redTable:ArrayBufferView;
      
      public static var __identity:Array = [1,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,1,0];
      
      public function ColorMatrix_Impl_()
      {
      }
      
      public static function _new(param1:ArrayBufferView = undefined) : ArrayBufferView
      {
         var _loc2_:* = null as ArrayBufferView;
         var _loc3_:* = null as Object;
         var _loc4_:* = null as Bytes;
         var _loc5_:* = null as Array;
         var _loc6_:* = null as Vector.<Number>;
         var _loc7_:* = null as ArrayBufferView;
         var _loc8_:* = null as Object;
         var _loc9_:* = null as ArrayBufferView;
         var _loc10_:* = null as ArrayBufferView;
         var _loc11_:* = null as Array;
         var _loc12_:* = null as Bytes;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc15_:int = 0;
         var _loc16_:int = 0;
         var _loc17_:int = 0;
         var _loc18_:int = 0;
         if(param1 != null && param1.length == 20)
         {
            _loc2_ = param1;
         }
         else
         {
            _loc3_ = null;
            _loc4_ = null;
            _loc5_ = ColorMatrix_Impl_.__identity;
            _loc6_ = null;
            _loc7_ = null;
            _loc8_ = null;
            if(_loc3_ != null)
            {
               _loc9_ = new ArrayBufferView(_loc3_,8);
            }
            else if(_loc5_ != null)
            {
               _loc10_ = new ArrayBufferView(0,8);
               _loc10_.byteOffset = 0;
               _loc10_.length = int(_loc5_.length);
               _loc10_.byteLength = _loc10_.length * _loc10_.bytesPerElement;
               _loc10_.buffer = Bytes.alloc(_loc10_.byteLength);
               _loc10_.copyFromArray(_loc5_);
               _loc9_ = _loc10_;
            }
            else if(_loc6_ != null)
            {
               _loc10_ = new ArrayBufferView(0,8);
               _loc11_ = _loc6_.__array;
               _loc10_.byteOffset = 0;
               _loc10_.length = int(_loc11_.length);
               _loc10_.byteLength = _loc10_.length * _loc10_.bytesPerElement;
               _loc10_.buffer = Bytes.alloc(_loc10_.byteLength);
               _loc10_.copyFromArray(_loc11_);
               _loc9_ = _loc10_;
            }
            else if(_loc7_ != null)
            {
               _loc10_ = new ArrayBufferView(0,8);
               _loc12_ = _loc7_.buffer;
               _loc13_ = _loc7_.length;
               _loc14_ = _loc7_.byteOffset;
               _loc15_ = _loc7_.bytesPerElement;
               _loc16_ = _loc10_.bytesPerElement;
               if(_loc7_.type != _loc10_.type)
               {
                  throw Exception.thrown("unimplemented");
               }
               _loc17_ = _loc12_.length;
               _loc18_ = _loc17_ - _loc14_;
               _loc10_.buffer = Bytes.alloc(_loc18_);
               _loc10_.buffer.blit(0,_loc12_,_loc14_,_loc18_);
               _loc10_.byteLength = _loc10_.bytesPerElement * _loc13_;
               _loc10_.byteOffset = 0;
               _loc10_.length = _loc13_;
               _loc9_ = _loc10_;
            }
            else
            {
               if(_loc4_ == null)
               {
                  throw Exception.thrown("Invalid constructor arguments for Float32Array");
               }
               _loc10_ = new ArrayBufferView(0,8);
               _loc13_ = 0;
               if(_loc13_ < 0)
               {
                  throw Exception.thrown(TAError.RangeError);
               }
               if(int(_loc13_ % _loc10_.bytesPerElement) != 0)
               {
                  throw Exception.thrown(TAError.RangeError);
               }
               _loc14_ = _loc4_.length;
               _loc15_ = _loc10_.bytesPerElement;
               _loc16_ = _loc14_;
               if(_loc8_ == null)
               {
                  _loc16_ = _loc14_ - _loc13_;
                  if(int(_loc14_ % _loc10_.bytesPerElement) != 0)
                  {
                     throw Exception.thrown(TAError.RangeError);
                  }
                  if(_loc16_ < 0)
                  {
                     throw Exception.thrown(TAError.RangeError);
                  }
               }
               else
               {
                  _loc16_ = _loc8_ * _loc10_.bytesPerElement;
                  _loc17_ = _loc13_ + _loc16_;
                  if(_loc17_ > _loc14_)
                  {
                     throw Exception.thrown(TAError.RangeError);
                  }
               }
               _loc10_.buffer = _loc4_;
               _loc10_.byteOffset = _loc13_;
               _loc10_.byteLength = _loc16_;
               _loc10_.length = int(_loc16_ / _loc10_.bytesPerElement);
               _loc9_ = _loc10_;
            }
            _loc2_ = _loc9_;
         }
         return _loc2_;
      }
      
      public static function clone(param1:ArrayBufferView) : ArrayBufferView
      {
         var _loc7_:* = null as ArrayBufferView;
         var _loc8_:* = null as ArrayBufferView;
         var _loc9_:* = null as Array;
         var _loc10_:* = null as Bytes;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc15_:int = 0;
         var _loc16_:int = 0;
         var _loc2_:Object = null;
         var _loc3_:Bytes = null;
         var _loc4_:Array = null;
         var _loc5_:Vector.<Number> = null;
         var _loc6_:Object = null;
         if(_loc2_ != null)
         {
            _loc7_ = new ArrayBufferView(_loc2_,8);
         }
         else if(_loc4_ != null)
         {
            _loc8_ = new ArrayBufferView(0,8);
            _loc8_.byteOffset = 0;
            _loc8_.length = int(_loc4_.length);
            _loc8_.byteLength = _loc8_.length * _loc8_.bytesPerElement;
            _loc8_.buffer = Bytes.alloc(_loc8_.byteLength);
            _loc8_.copyFromArray(_loc4_);
            _loc7_ = _loc8_;
         }
         else if(_loc5_ != null)
         {
            _loc8_ = new ArrayBufferView(0,8);
            _loc9_ = _loc5_.__array;
            _loc8_.byteOffset = 0;
            _loc8_.length = int(_loc9_.length);
            _loc8_.byteLength = _loc8_.length * _loc8_.bytesPerElement;
            _loc8_.buffer = Bytes.alloc(_loc8_.byteLength);
            _loc8_.copyFromArray(_loc9_);
            _loc7_ = _loc8_;
         }
         else if(param1 != null)
         {
            _loc8_ = new ArrayBufferView(0,8);
            _loc10_ = param1.buffer;
            _loc11_ = param1.length;
            _loc12_ = param1.byteOffset;
            _loc13_ = param1.bytesPerElement;
            _loc14_ = _loc8_.bytesPerElement;
            if(param1.type != _loc8_.type)
            {
               throw Exception.thrown("unimplemented");
            }
            _loc15_ = _loc10_.length;
            _loc16_ = _loc15_ - _loc12_;
            _loc8_.buffer = Bytes.alloc(_loc16_);
            _loc8_.buffer.blit(0,_loc10_,_loc12_,_loc16_);
            _loc8_.byteLength = _loc8_.bytesPerElement * _loc11_;
            _loc8_.byteOffset = 0;
            _loc8_.length = _loc11_;
            _loc7_ = _loc8_;
         }
         else
         {
            if(_loc3_ == null)
            {
               throw Exception.thrown("Invalid constructor arguments for Float32Array");
            }
            _loc8_ = new ArrayBufferView(0,8);
            _loc11_ = 0;
            if(_loc11_ < 0)
            {
               throw Exception.thrown(TAError.RangeError);
            }
            if(int(_loc11_ % _loc8_.bytesPerElement) != 0)
            {
               throw Exception.thrown(TAError.RangeError);
            }
            _loc12_ = _loc3_.length;
            _loc13_ = _loc8_.bytesPerElement;
            _loc14_ = _loc12_;
            if(_loc6_ == null)
            {
               _loc14_ = _loc12_ - _loc11_;
               if(int(_loc12_ % _loc8_.bytesPerElement) != 0)
               {
                  throw Exception.thrown(TAError.RangeError);
               }
               if(_loc14_ < 0)
               {
                  throw Exception.thrown(TAError.RangeError);
               }
            }
            else
            {
               _loc14_ = _loc6_ * _loc8_.bytesPerElement;
               _loc15_ = _loc11_ + _loc14_;
               if(_loc15_ > _loc12_)
               {
                  throw Exception.thrown(TAError.RangeError);
               }
            }
            _loc8_.buffer = _loc3_;
            _loc8_.byteOffset = _loc11_;
            _loc8_.byteLength = _loc14_;
            _loc8_.length = int(_loc14_ / _loc8_.bytesPerElement);
            _loc7_ = _loc8_;
         }
         return ColorMatrix_Impl_._new(_loc7_);
      }
      
      public static function concat(param1:ArrayBufferView, param2:ArrayBufferView) : void
      {
         var _loc3_:Bytes = param1.buffer;
         _loc3_.b.position = param1.byteOffset;
         var _loc4_:Number = _loc3_.b.readFloat();
         var _loc5_:Bytes = param2.buffer;
         _loc5_.b.position = param2.byteOffset;
         var _loc6_:Number = _loc4_ + _loc5_.b.readFloat();
         var _loc7_:Bytes = param1.buffer;
         _loc7_.b.position = param1.byteOffset;
         _loc7_.b.writeFloat(_loc6_);
         _loc3_ = param1.buffer;
         _loc3_.b.position = param1.byteOffset + 24;
         _loc4_ = _loc3_.b.readFloat();
         _loc5_ = param2.buffer;
         _loc5_.b.position = param2.byteOffset + 24;
         _loc6_ = _loc4_ + _loc5_.b.readFloat();
         _loc7_ = param1.buffer;
         _loc7_.b.position = param1.byteOffset + 24;
         _loc7_.b.writeFloat(_loc6_);
         _loc3_ = param1.buffer;
         _loc3_.b.position = param1.byteOffset + 48;
         _loc4_ = _loc3_.b.readFloat();
         _loc5_ = param2.buffer;
         _loc5_.b.position = param2.byteOffset + 48;
         _loc6_ = _loc4_ + _loc5_.b.readFloat();
         _loc7_ = param1.buffer;
         _loc7_.b.position = param1.byteOffset + 48;
         _loc7_.b.writeFloat(_loc6_);
         _loc3_ = param1.buffer;
         _loc3_.b.position = param1.byteOffset + 72;
         _loc4_ = _loc3_.b.readFloat();
         _loc5_ = param2.buffer;
         _loc5_.b.position = param2.byteOffset + 72;
         _loc6_ = _loc4_ + _loc5_.b.readFloat();
         _loc7_ = param1.buffer;
         _loc7_.b.position = param1.byteOffset + 72;
         _loc7_.b.writeFloat(_loc6_);
      }
      
      public static function copyFrom(param1:ArrayBufferView, param2:ArrayBufferView) : void
      {
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc3_:ArrayBufferView = param1;
         var _loc4_:ArrayBufferView = param2;
         var _loc5_:Array = null;
         var _loc6_:int = 0;
         if(_loc4_ != null && _loc5_ == null)
         {
            if(_loc6_ + _loc4_.length > _loc3_.length)
            {
               throw Exception.thrown(TAError.RangeError);
            }
            if(_loc3_.bytesPerElement == _loc4_.bytesPerElement)
            {
               _loc3_.buffer.blit(_loc6_ * _loc3_.bytesPerElement,_loc4_.buffer,_loc4_.byteOffset,_loc4_.byteLength);
            }
            else
            {
               _loc7_ = 0;
               _loc8_ = _loc4_.length;
               while(_loc7_ < _loc8_)
               {
                  _loc9_ = _loc7_++;
                  ArrayBufferView.transferElement(_loc4_,_loc9_,_loc3_,_loc6_ + _loc9_);
               }
            }
         }
         else
         {
            if(!(_loc5_ != null && _loc4_ == null))
            {
               throw Exception.thrown("Invalid .set call. either view, or array must be not-null.");
            }
            _loc3_.copyFromArray(_loc5_,_loc6_);
         }
      }
      
      public static function identity(param1:ArrayBufferView) : void
      {
         var _loc2_:Bytes = param1.buffer;
         _loc2_.b.position = param1.byteOffset;
         _loc2_.b.writeFloat(1);
         _loc2_ = param1.buffer;
         _loc2_.b.position = param1.byteOffset + 4;
         _loc2_.b.writeFloat(0);
         _loc2_ = param1.buffer;
         _loc2_.b.position = param1.byteOffset + 8;
         _loc2_.b.writeFloat(0);
         _loc2_ = param1.buffer;
         _loc2_.b.position = param1.byteOffset + 12;
         _loc2_.b.writeFloat(0);
         _loc2_ = param1.buffer;
         _loc2_.b.position = param1.byteOffset + 16;
         _loc2_.b.writeFloat(0);
         _loc2_ = param1.buffer;
         _loc2_.b.position = param1.byteOffset + 20;
         _loc2_.b.writeFloat(0);
         _loc2_ = param1.buffer;
         _loc2_.b.position = param1.byteOffset + 24;
         _loc2_.b.writeFloat(1);
         _loc2_ = param1.buffer;
         _loc2_.b.position = param1.byteOffset + 28;
         _loc2_.b.writeFloat(0);
         _loc2_ = param1.buffer;
         _loc2_.b.position = param1.byteOffset + 32;
         _loc2_.b.writeFloat(0);
         _loc2_ = param1.buffer;
         _loc2_.b.position = param1.byteOffset + 36;
         _loc2_.b.writeFloat(0);
         _loc2_ = param1.buffer;
         _loc2_.b.position = param1.byteOffset + 40;
         _loc2_.b.writeFloat(0);
         _loc2_ = param1.buffer;
         _loc2_.b.position = param1.byteOffset + 44;
         _loc2_.b.writeFloat(0);
         _loc2_ = param1.buffer;
         _loc2_.b.position = param1.byteOffset + 48;
         _loc2_.b.writeFloat(1);
         _loc2_ = param1.buffer;
         _loc2_.b.position = param1.byteOffset + 52;
         _loc2_.b.writeFloat(0);
         _loc2_ = param1.buffer;
         _loc2_.b.position = param1.byteOffset + 56;
         _loc2_.b.writeFloat(0);
         _loc2_ = param1.buffer;
         _loc2_.b.position = param1.byteOffset + 60;
         _loc2_.b.writeFloat(0);
         _loc2_ = param1.buffer;
         _loc2_.b.position = param1.byteOffset + 64;
         _loc2_.b.writeFloat(0);
         _loc2_ = param1.buffer;
         _loc2_.b.position = param1.byteOffset + 68;
         _loc2_.b.writeFloat(0);
         _loc2_ = param1.buffer;
         _loc2_.b.position = param1.byteOffset + 72;
         _loc2_.b.writeFloat(1);
         _loc2_ = param1.buffer;
         _loc2_.b.position = param1.byteOffset + 76;
         _loc2_.b.writeFloat(0);
      }
      
      public static function getAlphaTable(param1:ArrayBufferView) : ArrayBufferView
      {
         var _loc2_:* = null as Bytes;
         var _loc3_:* = null as Array;
         var _loc4_:* = null as Vector.<int>;
         var _loc5_:* = null as ArrayBufferView;
         var _loc6_:* = null as Object;
         var _loc7_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:Number = NaN;
         var _loc11_:* = null as Bytes;
         if(ColorMatrix_Impl_.__alphaTable == null)
         {
            _loc2_ = null;
            _loc3_ = null;
            _loc4_ = null;
            _loc5_ = null;
            _loc6_ = null;
            ColorMatrix_Impl_.__alphaTable = new ArrayBufferView(256,4);
         }
         _loc5_ = ColorMatrix_Impl_.__alphaTable;
         _loc5_.buffer.b[_loc5_.byteOffset] = 0;
         var _loc8_:int = 1;
         while(_loc8_ < 256)
         {
            _loc9_ = _loc8_++;
            _loc2_ = param1.buffer;
            _loc2_.b.position = param1.byteOffset + 72;
            _loc10_ = _loc9_ * _loc2_.b.readFloat();
            _loc11_ = param1.buffer;
            _loc11_.b.position = param1.byteOffset + 76;
            _loc7_ = int(Math.floor(_loc10_ + _loc11_.b.readFloat() * 255));
            if(_loc7_ > 255)
            {
               _loc7_ = 255;
            }
            if(_loc7_ < 0)
            {
               _loc7_ = 0;
            }
            _loc5_ = ColorMatrix_Impl_.__alphaTable;
            _loc5_.buffer.b[_loc5_.byteOffset + _loc9_] = _loc7_;
         }
         return ColorMatrix_Impl_.__alphaTable;
      }
      
      public static function getBlueTable(param1:ArrayBufferView) : ArrayBufferView
      {
         var _loc2_:* = null as Bytes;
         var _loc3_:* = null as Array;
         var _loc4_:* = null as Vector.<int>;
         var _loc5_:* = null as ArrayBufferView;
         var _loc6_:* = null as Object;
         var _loc7_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:Number = NaN;
         var _loc11_:* = null as Bytes;
         if(ColorMatrix_Impl_.__blueTable == null)
         {
            _loc2_ = null;
            _loc3_ = null;
            _loc4_ = null;
            _loc5_ = null;
            _loc6_ = null;
            ColorMatrix_Impl_.__blueTable = new ArrayBufferView(256,4);
         }
         var _loc8_:int = 0;
         while(_loc8_ < 256)
         {
            _loc9_ = _loc8_++;
            _loc2_ = param1.buffer;
            _loc2_.b.position = param1.byteOffset + 48;
            _loc10_ = _loc9_ * _loc2_.b.readFloat();
            _loc11_ = param1.buffer;
            _loc11_.b.position = param1.byteOffset + 56;
            _loc7_ = int(Math.floor(_loc10_ + _loc11_.b.readFloat() * 255));
            if(_loc7_ > 255)
            {
               _loc7_ = 255;
            }
            if(_loc7_ < 0)
            {
               _loc7_ = 0;
            }
            _loc5_ = ColorMatrix_Impl_.__blueTable;
            _loc5_.buffer.b[_loc5_.byteOffset + _loc9_] = _loc7_;
         }
         return ColorMatrix_Impl_.__blueTable;
      }
      
      public static function getGreenTable(param1:ArrayBufferView) : ArrayBufferView
      {
         var _loc2_:* = null as Bytes;
         var _loc3_:* = null as Array;
         var _loc4_:* = null as Vector.<int>;
         var _loc5_:* = null as ArrayBufferView;
         var _loc6_:* = null as Object;
         var _loc7_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:Number = NaN;
         var _loc11_:* = null as Bytes;
         if(ColorMatrix_Impl_.__greenTable == null)
         {
            _loc2_ = null;
            _loc3_ = null;
            _loc4_ = null;
            _loc5_ = null;
            _loc6_ = null;
            ColorMatrix_Impl_.__greenTable = new ArrayBufferView(256,4);
         }
         var _loc8_:int = 0;
         while(_loc8_ < 256)
         {
            _loc9_ = _loc8_++;
            _loc2_ = param1.buffer;
            _loc2_.b.position = param1.byteOffset + 24;
            _loc10_ = _loc9_ * _loc2_.b.readFloat();
            _loc11_ = param1.buffer;
            _loc11_.b.position = param1.byteOffset + 36;
            _loc7_ = int(Math.floor(_loc10_ + _loc11_.b.readFloat() * 255));
            if(_loc7_ > 255)
            {
               _loc7_ = 255;
            }
            if(_loc7_ < 0)
            {
               _loc7_ = 0;
            }
            _loc5_ = ColorMatrix_Impl_.__greenTable;
            _loc5_.buffer.b[_loc5_.byteOffset + _loc9_] = _loc7_;
         }
         return ColorMatrix_Impl_.__greenTable;
      }
      
      public static function getRedTable(param1:ArrayBufferView) : ArrayBufferView
      {
         var _loc2_:* = null as Bytes;
         var _loc3_:* = null as Array;
         var _loc4_:* = null as Vector.<int>;
         var _loc5_:* = null as ArrayBufferView;
         var _loc6_:* = null as Object;
         var _loc7_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:Number = NaN;
         var _loc11_:* = null as Bytes;
         if(ColorMatrix_Impl_.__redTable == null)
         {
            _loc2_ = null;
            _loc3_ = null;
            _loc4_ = null;
            _loc5_ = null;
            _loc6_ = null;
            ColorMatrix_Impl_.__redTable = new ArrayBufferView(256,4);
         }
         var _loc8_:int = 0;
         while(_loc8_ < 256)
         {
            _loc9_ = _loc8_++;
            _loc2_ = param1.buffer;
            _loc2_.b.position = param1.byteOffset;
            _loc10_ = _loc9_ * _loc2_.b.readFloat();
            _loc11_ = param1.buffer;
            _loc11_.b.position = param1.byteOffset + 16;
            _loc7_ = int(Math.floor(_loc10_ + _loc11_.b.readFloat() * 255));
            if(_loc7_ > 255)
            {
               _loc7_ = 255;
            }
            if(_loc7_ < 0)
            {
               _loc7_ = 0;
            }
            _loc5_ = ColorMatrix_Impl_.__redTable;
            _loc5_.buffer.b[_loc5_.byteOffset + _loc9_] = _loc7_;
         }
         return ColorMatrix_Impl_.__redTable;
      }
      
      public static function __toFlashColorTransform(param1:ArrayBufferView) : ColorTransform
      {
         var _loc2_:Bytes = param1.buffer;
         _loc2_.b.position = param1.byteOffset;
         var _loc3_:Number = _loc2_.b.readFloat();
         var _loc4_:Bytes = param1.buffer;
         _loc4_.b.position = param1.byteOffset + 24;
         var _loc5_:Number = _loc4_.b.readFloat();
         var _loc6_:Bytes = param1.buffer;
         _loc6_.b.position = param1.byteOffset + 48;
         var _loc7_:Number = _loc6_.b.readFloat();
         var _loc8_:Bytes = param1.buffer;
         _loc8_.b.position = param1.byteOffset + 72;
         var _loc9_:Number = _loc8_.b.readFloat();
         var _loc10_:Bytes = param1.buffer;
         _loc10_.b.position = param1.byteOffset + 16;
         var _loc11_:Number = _loc10_.b.readFloat() * 255;
         var _loc12_:Bytes = param1.buffer;
         _loc12_.b.position = param1.byteOffset + 36;
         var _loc13_:Number = _loc12_.b.readFloat() * 255;
         var _loc14_:Bytes = param1.buffer;
         _loc14_.b.position = param1.byteOffset + 56;
         var _loc15_:Number = _loc14_.b.readFloat() * 255;
         var _loc16_:Bytes = param1.buffer;
         _loc16_.b.position = param1.byteOffset + 76;
         return new ColorTransform(_loc3_,_loc5_,_loc7_,_loc9_,_loc11_,_loc13_,_loc15_,_loc16_.b.readFloat() * 255);
      }
      
      public static function get_alphaMultiplier(param1:ArrayBufferView) : Number
      {
         var _loc2_:Bytes = param1.buffer;
         _loc2_.b.position = param1.byteOffset + 72;
         return _loc2_.b.readFloat();
      }
      
      public static function set_alphaMultiplier(param1:ArrayBufferView, param2:Number) : Number
      {
         var _loc3_:Bytes = param1.buffer;
         _loc3_.b.position = param1.byteOffset + 72;
         _loc3_.b.writeFloat(param2);
         return param2;
      }
      
      public static function get_alphaOffset(param1:ArrayBufferView) : Number
      {
         var _loc2_:Bytes = param1.buffer;
         _loc2_.b.position = param1.byteOffset + 76;
         return _loc2_.b.readFloat() * 255;
      }
      
      public static function set_alphaOffset(param1:ArrayBufferView, param2:Number) : Number
      {
         var _loc3_:Number = param2 / 255;
         var _loc4_:Bytes = param1.buffer;
         _loc4_.b.position = param1.byteOffset + 76;
         _loc4_.b.writeFloat(_loc3_);
         return _loc3_;
      }
      
      public static function get_blueMultiplier(param1:ArrayBufferView) : Number
      {
         var _loc2_:Bytes = param1.buffer;
         _loc2_.b.position = param1.byteOffset + 48;
         return _loc2_.b.readFloat();
      }
      
      public static function set_blueMultiplier(param1:ArrayBufferView, param2:Number) : Number
      {
         var _loc3_:Bytes = param1.buffer;
         _loc3_.b.position = param1.byteOffset + 48;
         _loc3_.b.writeFloat(param2);
         return param2;
      }
      
      public static function get_blueOffset(param1:ArrayBufferView) : Number
      {
         var _loc2_:Bytes = param1.buffer;
         _loc2_.b.position = param1.byteOffset + 56;
         return _loc2_.b.readFloat() * 255;
      }
      
      public static function set_blueOffset(param1:ArrayBufferView, param2:Number) : Number
      {
         var _loc3_:Number = param2 / 255;
         var _loc4_:Bytes = param1.buffer;
         _loc4_.b.position = param1.byteOffset + 56;
         _loc4_.b.writeFloat(_loc3_);
         return _loc3_;
      }
      
      public static function get_color(param1:ArrayBufferView) : int
      {
         var _loc2_:Bytes = param1.buffer;
         _loc2_.b.position = param1.byteOffset + 16;
         var _loc3_:int = int(_loc2_.b.readFloat() * 255) << 16;
         var _loc4_:Bytes = param1.buffer;
         _loc4_.b.position = param1.byteOffset + 36;
         var _loc5_:int = _loc3_ | int(_loc4_.b.readFloat() * 255) << 8;
         var _loc6_:Bytes = param1.buffer;
         _loc6_.b.position = param1.byteOffset + 56;
         return _loc5_ | int(_loc6_.b.readFloat() * 255);
      }
      
      public static function set_color(param1:ArrayBufferView, param2:int) : int
      {
         var _loc3_:Number = (param2 >> 16 & 0xFF) / 255;
         var _loc4_:Bytes = param1.buffer;
         _loc4_.b.position = param1.byteOffset + 16;
         _loc4_.b.writeFloat(_loc3_);
         _loc3_ = (param2 >> 8 & 0xFF) / 255;
         _loc4_ = param1.buffer;
         _loc4_.b.position = param1.byteOffset + 36;
         _loc4_.b.writeFloat(_loc3_);
         _loc3_ = (param2 & 0xFF) / 255;
         _loc4_ = param1.buffer;
         _loc4_.b.position = param1.byteOffset + 56;
         _loc4_.b.writeFloat(_loc3_);
         _loc4_ = param1.buffer;
         _loc4_.b.position = param1.byteOffset;
         _loc4_.b.writeFloat(0);
         _loc4_ = param1.buffer;
         _loc4_.b.position = param1.byteOffset + 24;
         _loc4_.b.writeFloat(0);
         _loc4_ = param1.buffer;
         _loc4_.b.position = param1.byteOffset + 48;
         _loc4_.b.writeFloat(0);
         return ColorMatrix_Impl_.get_color(param1);
      }
      
      public static function get_greenMultiplier(param1:ArrayBufferView) : Number
      {
         var _loc2_:Bytes = param1.buffer;
         _loc2_.b.position = param1.byteOffset + 24;
         return _loc2_.b.readFloat();
      }
      
      public static function set_greenMultiplier(param1:ArrayBufferView, param2:Number) : Number
      {
         var _loc3_:Bytes = param1.buffer;
         _loc3_.b.position = param1.byteOffset + 24;
         _loc3_.b.writeFloat(param2);
         return param2;
      }
      
      public static function get_greenOffset(param1:ArrayBufferView) : Number
      {
         var _loc2_:Bytes = param1.buffer;
         _loc2_.b.position = param1.byteOffset + 36;
         return _loc2_.b.readFloat() * 255;
      }
      
      public static function set_greenOffset(param1:ArrayBufferView, param2:Number) : Number
      {
         var _loc3_:Number = param2 / 255;
         var _loc4_:Bytes = param1.buffer;
         _loc4_.b.position = param1.byteOffset + 36;
         _loc4_.b.writeFloat(_loc3_);
         return _loc3_;
      }
      
      public static function get_redMultiplier(param1:ArrayBufferView) : Number
      {
         var _loc2_:Bytes = param1.buffer;
         _loc2_.b.position = param1.byteOffset;
         return _loc2_.b.readFloat();
      }
      
      public static function set_redMultiplier(param1:ArrayBufferView, param2:Number) : Number
      {
         var _loc3_:Bytes = param1.buffer;
         _loc3_.b.position = param1.byteOffset;
         _loc3_.b.writeFloat(param2);
         return param2;
      }
      
      public static function get_redOffset(param1:ArrayBufferView) : Number
      {
         var _loc2_:Bytes = param1.buffer;
         _loc2_.b.position = param1.byteOffset + 16;
         return _loc2_.b.readFloat() * 255;
      }
      
      public static function set_redOffset(param1:ArrayBufferView, param2:Number) : Number
      {
         var _loc3_:Number = param2 / 255;
         var _loc4_:Bytes = param1.buffer;
         _loc4_.b.position = param1.byteOffset + 16;
         _loc4_.b.writeFloat(_loc3_);
         return _loc3_;
      }
      
      public static function get(param1:ArrayBufferView, param2:int) : Number
      {
         var _loc3_:Bytes = param1.buffer;
         _loc3_.b.position = param1.byteOffset + param2 * 4;
         return _loc3_.b.readFloat();
      }
      
      public static function set(param1:ArrayBufferView, param2:int, param3:Number) : Number
      {
         var _loc4_:Bytes = param1.buffer;
         _loc4_.b.position = param1.byteOffset + param2 * 4;
         _loc4_.b.writeFloat(param3);
         return param3;
      }
   }
}

