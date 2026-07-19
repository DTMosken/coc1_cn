package lime.utils
{
   import flash.Boot;
   import haxe.Exception;
   import haxe.io.Bytes;
   
   public class ArrayBufferView
   {
      
      public var type:int;
      
      public var length:int;
      
      public var bytesPerElement:int;
      
      public var byteOffset:int;
      
      public var byteLength:int;
      
      public var buffer:Bytes;
      
      public function ArrayBufferView(param1:Object = undefined, param2:int = 0)
      {
         var _loc3_:int = 0;
         if(Boot.skip_constructor)
         {
            return;
         }
         bytesPerElement = 0;
         type = 0;
         type = param2;
         switch(type)
         {
            case 1:
               _loc3_ = 1;
               break;
            case 2:
               _loc3_ = 2;
               break;
            case 3:
               _loc3_ = 4;
               break;
            case 4:
               _loc3_ = 1;
               break;
            case 5:
               _loc3_ = 1;
               break;
            case 6:
               _loc3_ = 2;
               break;
            case 7:
               _loc3_ = 4;
               break;
            case 8:
               _loc3_ = 4;
               break;
            case 9:
               _loc3_ = 8;
               break;
            default:
               _loc3_ = 1;
         }
         bytesPerElement = _loc3_;
         if(param1 != null && param1 != 0)
         {
            if(param1 < 0)
            {
               param1 = 0;
            }
            byteOffset = 0;
            byteLength = int(param1) * bytesPerElement;
            buffer = Bytes.alloc(byteLength);
            length = param1;
         }
      }
      
      public static function transferElement(param1:ArrayBufferView, param2:int, param3:ArrayBufferView, param4:int) : void
      {
         var _loc7_:int = 0;
         var _loc8_:* = null as Bytes;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:uint = 0;
         var _loc5_:* = null;
         var _loc6_:int = param1.byteOffset + param2 * param1.bytesPerElement;
         switch(param1.type)
         {
            case 0:
               throw Exception.thrown("transferElement on a base type ArrayBuffer");
            case 1:
               _loc7_ = int(param1.buffer.b[_loc6_]);
               _loc5_ = (_loc7_ & 0x80) != 0 ? _loc7_ - 256 : _loc7_;
               break;
            case 2:
               _loc5_ = ArrayBufferIO.getInt16(param1.buffer,_loc6_);
               break;
            case 3:
               _loc8_ = param1.buffer;
               _loc5_ = int(_loc8_.b[_loc6_]) | int(_loc8_.b[_loc6_ + 1]) << 8 | int(_loc8_.b[_loc6_ + 2]) << 16 | int(_loc8_.b[_loc6_ + 3]) << 24;
               break;
            case 4:
               _loc5_ = int(param1.buffer.b[_loc6_]);
               break;
            case 5:
               _loc5_ = int(param1.buffer.b[_loc6_]);
               break;
            case 6:
               _loc8_ = param1.buffer;
               _loc7_ = int(_loc8_.b[_loc6_]);
               _loc9_ = int(_loc8_.b[_loc6_ + 1]);
               _loc5_ = _loc9_ << 8 | _loc7_;
               break;
            case 7:
               _loc8_ = param1.buffer;
               _loc7_ = int(_loc8_.b[_loc6_]);
               _loc9_ = int(_loc8_.b[_loc6_ + 1]);
               _loc10_ = int(_loc8_.b[_loc6_ + 2]);
               _loc11_ = int(_loc8_.b[_loc6_ + 3]);
               _loc5_ = _loc7_ | _loc9_ << 8 | _loc10_ << 16 | _loc11_ << 24;
               break;
            case 8:
               _loc8_ = param1.buffer;
               _loc8_.b.position = _loc6_;
               _loc5_ = _loc8_.b.readFloat();
               break;
            case 9:
               _loc8_ = param1.buffer;
               _loc8_.b.position = _loc6_;
               _loc5_ = _loc8_.b.readDouble();
         }
         _loc7_ = param3.byteOffset + param4 * param3.bytesPerElement;
         switch(param3.type)
         {
            case 0:
               throw Exception.thrown("transferElement on a base type ArrayBuffer");
            case 1:
               param3.buffer.b[_loc7_] = int(_loc5_);
               break;
            case 2:
               ArrayBufferIO.setInt16(param3.buffer,_loc7_,_loc5_);
               break;
            case 3:
               _loc9_ = int(_loc5_);
               _loc8_ = param3.buffer;
               _loc8_.b[_loc7_] = _loc9_;
               _loc8_.b[_loc7_ + 1] = _loc9_ >> 8;
               _loc8_.b[_loc7_ + 2] = _loc9_ >> 16;
               _loc8_.b[_loc7_ + 3] = _loc9_ >>> 24;
               break;
            case 4:
               param3.buffer.b[_loc7_] = uint(_loc5_);
               break;
            case 5:
               _loc8_ = param3.buffer;
               _loc9_ = int(uint(_loc5_));
               if(_loc9_ > 255)
               {
                  _loc9_ = 255;
               }
               _loc8_.b[_loc7_] = uint(_loc9_ < 0 ? 0 : _loc9_);
               break;
            case 6:
               ArrayBufferIO.setInt16(param3.buffer,_loc7_,uint(_loc5_));
               break;
            case 7:
               _loc12_ = uint(_loc5_);
               _loc8_ = param3.buffer;
               _loc8_.b[_loc7_] = _loc12_;
               _loc8_.b[_loc7_ + 1] = uint(_loc12_ >> 8);
               _loc8_.b[_loc7_ + 2] = uint(_loc12_ >> 16);
               _loc8_.b[_loc7_ + 3] = uint(_loc12_ >>> 24);
               break;
            case 8:
               _loc8_ = param3.buffer;
               _loc8_.b.position = _loc7_;
               _loc8_.b.writeFloat(Number(_loc5_));
               break;
            case 9:
               _loc8_ = param3.buffer;
               _loc8_.b.position = _loc7_;
               _loc8_.b.writeDouble(Number(_loc5_));
         }
      }
      
      public function toString() : String
      {
         var _loc1_:* = null as String;
         switch(type)
         {
            case 1:
               _loc1_ = "Int8Array";
               break;
            case 2:
               _loc1_ = "Int16Array";
               break;
            case 3:
               _loc1_ = "Int32Array";
               break;
            case 4:
               _loc1_ = "UInt8Array";
               break;
            case 5:
               _loc1_ = "UInt8ClampedArray";
               break;
            case 6:
               _loc1_ = "UInt16Array";
               break;
            case 7:
               _loc1_ = "UInt32Array";
               break;
            case 8:
               _loc1_ = "Float32Array";
               break;
            case 9:
               _loc1_ = "Float64Array";
               break;
            default:
               _loc1_ = "ArrayBufferView";
         }
         return _loc1_ + (" [byteLength:" + byteLength + ", length:" + length + "]");
      }
      
      public function toByteLength(param1:int) : int
      {
         return param1 * bytesPerElement;
      }
      
      public function subarray_lime_utils_UInt8ClampedArray(param1:int, param2:Object = undefined) : ArrayBufferView
      {
         var _loc5_:* = null as ArrayBufferView;
         var _loc6_:* = null as Object;
         var _loc7_:* = null as Bytes;
         var _loc8_:* = null as Array;
         var _loc9_:* = null as Vector.<int>;
         var _loc10_:* = null as ArrayBufferView;
         var _loc11_:* = null as Object;
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
         var _loc22_:* = null as Vector.<Number>;
         if(param2 == null)
         {
            param2 = length;
         }
         var _loc3_:int = param2 - param1;
         if(_loc3_ < 0)
         {
            _loc3_ = 0;
         }
         if(_loc3_ > length)
         {
            _loc3_ = length;
         }
         var _loc4_:int = param1 * bytesPerElement + byteOffset;
         switch(type)
         {
            case 0:
               throw Exception.thrown("subarray on a blank ArrayBufferView");
            case 1:
               _loc6_ = null;
               _loc7_ = buffer;
               _loc8_ = null;
               _loc9_ = null;
               _loc10_ = null;
               _loc11_ = _loc4_;
               if(_loc11_ == null)
               {
                  _loc11_ = 0;
               }
               if(_loc6_ != null)
               {
                  _loc12_ = new ArrayBufferView(_loc6_,1);
               }
               else if(_loc8_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,1);
                  _loc13_.byteOffset = 0;
                  _loc13_.length = int(_loc8_.length);
                  _loc13_.byteLength = _loc13_.length * _loc13_.bytesPerElement;
                  _loc13_.buffer = Bytes.alloc(_loc13_.byteLength);
                  _loc13_.copyFromArray(_loc8_);
                  _loc12_ = _loc13_;
               }
               else if(_loc9_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,1);
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
                  _loc13_ = new ArrayBufferView(0,1);
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
                     throw Exception.thrown("Invalid constructor arguments for Int8Array");
                  }
                  _loc13_ = new ArrayBufferView(0,1);
                  _loc16_ = _loc11_;
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
                  if(_loc3_ == null)
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
                     _loc19_ = _loc3_ * _loc13_.bytesPerElement;
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
               _loc5_ = _loc12_;
               break;
            case 2:
               _loc6_ = null;
               _loc7_ = buffer;
               _loc8_ = null;
               _loc9_ = null;
               _loc10_ = null;
               _loc11_ = _loc4_;
               if(_loc11_ == null)
               {
                  _loc11_ = 0;
               }
               if(_loc6_ != null)
               {
                  _loc12_ = new ArrayBufferView(_loc6_,2);
               }
               else if(_loc8_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,2);
                  _loc13_.byteOffset = 0;
                  _loc13_.length = int(_loc8_.length);
                  _loc13_.byteLength = _loc13_.length * _loc13_.bytesPerElement;
                  _loc13_.buffer = Bytes.alloc(_loc13_.byteLength);
                  _loc13_.copyFromArray(_loc8_);
                  _loc12_ = _loc13_;
               }
               else if(_loc9_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,2);
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
                  _loc13_ = new ArrayBufferView(0,2);
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
                     throw Exception.thrown("Invalid constructor arguments for Int16Array");
                  }
                  _loc13_ = new ArrayBufferView(0,2);
                  _loc16_ = _loc11_;
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
                  if(_loc3_ == null)
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
                     _loc19_ = _loc3_ * _loc13_.bytesPerElement;
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
               _loc5_ = _loc12_;
               break;
            case 3:
               _loc6_ = null;
               _loc7_ = buffer;
               _loc8_ = null;
               _loc9_ = null;
               _loc10_ = null;
               _loc11_ = _loc4_;
               if(_loc11_ == null)
               {
                  _loc11_ = 0;
               }
               if(_loc6_ != null)
               {
                  _loc12_ = new ArrayBufferView(_loc6_,3);
               }
               else if(_loc8_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,3);
                  _loc13_.byteOffset = 0;
                  _loc13_.length = int(_loc8_.length);
                  _loc13_.byteLength = _loc13_.length * _loc13_.bytesPerElement;
                  _loc13_.buffer = Bytes.alloc(_loc13_.byteLength);
                  _loc13_.copyFromArray(_loc8_);
                  _loc12_ = _loc13_;
               }
               else if(_loc9_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,3);
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
                  _loc13_ = new ArrayBufferView(0,3);
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
                     throw Exception.thrown("Invalid constructor arguments for Int32Array");
                  }
                  _loc13_ = new ArrayBufferView(0,3);
                  _loc16_ = _loc11_;
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
                  if(_loc3_ == null)
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
                     _loc19_ = _loc3_ * _loc13_.bytesPerElement;
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
               _loc5_ = _loc12_;
               break;
            case 4:
               _loc6_ = null;
               _loc7_ = buffer;
               _loc8_ = null;
               _loc9_ = null;
               _loc10_ = null;
               _loc11_ = _loc4_;
               if(_loc11_ == null)
               {
                  _loc11_ = 0;
               }
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
                  _loc16_ = _loc11_;
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
                  if(_loc3_ == null)
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
                     _loc19_ = _loc3_ * _loc13_.bytesPerElement;
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
               _loc5_ = _loc12_;
               break;
            case 5:
               _loc6_ = null;
               _loc7_ = buffer;
               _loc8_ = null;
               _loc9_ = null;
               _loc10_ = null;
               _loc11_ = _loc4_;
               if(_loc11_ == null)
               {
                  _loc11_ = 0;
               }
               if(_loc6_ != null)
               {
                  _loc12_ = new ArrayBufferView(_loc6_,5);
               }
               else if(_loc8_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,5);
                  _loc13_.byteOffset = 0;
                  _loc13_.length = int(_loc8_.length);
                  _loc13_.byteLength = _loc13_.length * _loc13_.bytesPerElement;
                  _loc13_.buffer = Bytes.alloc(_loc13_.byteLength);
                  _loc13_.copyFromArray(_loc8_);
                  _loc12_ = _loc13_;
               }
               else if(_loc9_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,5);
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
                  _loc13_ = new ArrayBufferView(0,5);
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
                     throw Exception.thrown("Invalid constructor arguments for UInt8ClampedArray");
                  }
                  _loc13_ = new ArrayBufferView(0,5);
                  _loc16_ = _loc11_;
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
                  if(_loc3_ == null)
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
                     _loc19_ = _loc3_ * _loc13_.bytesPerElement;
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
               _loc5_ = _loc12_;
               break;
            case 6:
               _loc6_ = null;
               _loc7_ = buffer;
               _loc8_ = null;
               _loc9_ = null;
               _loc10_ = null;
               _loc11_ = _loc4_;
               if(_loc11_ == null)
               {
                  _loc11_ = 0;
               }
               if(_loc6_ != null)
               {
                  _loc12_ = new ArrayBufferView(_loc6_,6);
               }
               else if(_loc8_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,6);
                  _loc13_.byteOffset = 0;
                  _loc13_.length = int(_loc8_.length);
                  _loc13_.byteLength = _loc13_.length * _loc13_.bytesPerElement;
                  _loc13_.buffer = Bytes.alloc(_loc13_.byteLength);
                  _loc13_.copyFromArray(_loc8_);
                  _loc12_ = _loc13_;
               }
               else if(_loc9_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,6);
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
                  _loc13_ = new ArrayBufferView(0,6);
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
                     throw Exception.thrown("Invalid constructor arguments for UInt16Array");
                  }
                  _loc13_ = new ArrayBufferView(0,6);
                  _loc16_ = _loc11_;
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
                  if(_loc3_ == null)
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
                     _loc19_ = _loc3_ * _loc13_.bytesPerElement;
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
               _loc5_ = _loc12_;
               break;
            case 7:
               _loc6_ = null;
               _loc7_ = buffer;
               _loc8_ = null;
               _loc9_ = null;
               _loc10_ = null;
               _loc11_ = _loc4_;
               if(_loc11_ == null)
               {
                  _loc11_ = 0;
               }
               if(_loc6_ != null)
               {
                  _loc12_ = new ArrayBufferView(_loc6_,7);
               }
               else if(_loc8_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,7);
                  _loc13_.byteOffset = 0;
                  _loc13_.length = int(_loc8_.length);
                  _loc13_.byteLength = _loc13_.length * _loc13_.bytesPerElement;
                  _loc13_.buffer = Bytes.alloc(_loc13_.byteLength);
                  _loc13_.copyFromArray(_loc8_);
                  _loc12_ = _loc13_;
               }
               else if(_loc9_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,7);
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
                  _loc13_ = new ArrayBufferView(0,7);
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
                     throw Exception.thrown("Invalid constructor arguments for UInt32Array");
                  }
                  _loc13_ = new ArrayBufferView(0,7);
                  _loc16_ = _loc11_;
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
                  if(_loc3_ == null)
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
                     _loc19_ = _loc3_ * _loc13_.bytesPerElement;
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
               _loc5_ = _loc12_;
               break;
            case 8:
               _loc6_ = null;
               _loc7_ = buffer;
               _loc8_ = null;
               _loc22_ = null;
               _loc10_ = null;
               _loc11_ = _loc4_;
               if(_loc11_ == null)
               {
                  _loc11_ = 0;
               }
               if(_loc6_ != null)
               {
                  _loc12_ = new ArrayBufferView(_loc6_,8);
               }
               else if(_loc8_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,8);
                  _loc13_.byteOffset = 0;
                  _loc13_.length = int(_loc8_.length);
                  _loc13_.byteLength = _loc13_.length * _loc13_.bytesPerElement;
                  _loc13_.buffer = Bytes.alloc(_loc13_.byteLength);
                  _loc13_.copyFromArray(_loc8_);
                  _loc12_ = _loc13_;
               }
               else if(_loc22_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,8);
                  _loc14_ = _loc22_.__array;
                  _loc13_.byteOffset = 0;
                  _loc13_.length = int(_loc14_.length);
                  _loc13_.byteLength = _loc13_.length * _loc13_.bytesPerElement;
                  _loc13_.buffer = Bytes.alloc(_loc13_.byteLength);
                  _loc13_.copyFromArray(_loc14_);
                  _loc12_ = _loc13_;
               }
               else if(_loc10_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,8);
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
                     throw Exception.thrown("Invalid constructor arguments for Float32Array");
                  }
                  _loc13_ = new ArrayBufferView(0,8);
                  _loc16_ = _loc11_;
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
                  if(_loc3_ == null)
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
                     _loc19_ = _loc3_ * _loc13_.bytesPerElement;
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
               _loc5_ = _loc12_;
               break;
            case 9:
               _loc6_ = null;
               _loc7_ = buffer;
               _loc8_ = null;
               _loc22_ = null;
               _loc10_ = null;
               _loc11_ = _loc4_;
               if(_loc11_ == null)
               {
                  _loc11_ = 0;
               }
               if(_loc6_ != null)
               {
                  _loc12_ = new ArrayBufferView(_loc6_,9);
               }
               else if(_loc8_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,9);
                  _loc13_.byteOffset = 0;
                  _loc13_.length = int(_loc8_.length);
                  _loc13_.byteLength = _loc13_.length * _loc13_.bytesPerElement;
                  _loc13_.buffer = Bytes.alloc(_loc13_.byteLength);
                  _loc13_.copyFromArray(_loc8_);
                  _loc12_ = _loc13_;
               }
               else if(_loc22_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,9);
                  _loc14_ = _loc22_.__array;
                  _loc13_.byteOffset = 0;
                  _loc13_.length = int(_loc14_.length);
                  _loc13_.byteLength = _loc13_.length * _loc13_.bytesPerElement;
                  _loc13_.buffer = Bytes.alloc(_loc13_.byteLength);
                  _loc13_.copyFromArray(_loc14_);
                  _loc12_ = _loc13_;
               }
               else if(_loc10_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,9);
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
                     throw Exception.thrown("Invalid constructor arguments for Float64Array");
                  }
                  _loc13_ = new ArrayBufferView(0,9);
                  _loc16_ = _loc11_;
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
                  if(_loc3_ == null)
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
                     _loc19_ = _loc3_ * _loc13_.bytesPerElement;
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
               _loc5_ = _loc12_;
         }
         return _loc5_;
      }
      
      public function subarray_lime_utils_UInt8Array(param1:int, param2:Object = undefined) : ArrayBufferView
      {
         var _loc5_:* = null as ArrayBufferView;
         var _loc6_:* = null as Object;
         var _loc7_:* = null as Bytes;
         var _loc8_:* = null as Array;
         var _loc9_:* = null as Vector.<int>;
         var _loc10_:* = null as ArrayBufferView;
         var _loc11_:* = null as Object;
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
         var _loc22_:* = null as Vector.<Number>;
         if(param2 == null)
         {
            param2 = length;
         }
         var _loc3_:int = param2 - param1;
         if(_loc3_ < 0)
         {
            _loc3_ = 0;
         }
         if(_loc3_ > length)
         {
            _loc3_ = length;
         }
         var _loc4_:int = param1 * bytesPerElement + byteOffset;
         switch(type)
         {
            case 0:
               throw Exception.thrown("subarray on a blank ArrayBufferView");
            case 1:
               _loc6_ = null;
               _loc7_ = buffer;
               _loc8_ = null;
               _loc9_ = null;
               _loc10_ = null;
               _loc11_ = _loc4_;
               if(_loc11_ == null)
               {
                  _loc11_ = 0;
               }
               if(_loc6_ != null)
               {
                  _loc12_ = new ArrayBufferView(_loc6_,1);
               }
               else if(_loc8_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,1);
                  _loc13_.byteOffset = 0;
                  _loc13_.length = int(_loc8_.length);
                  _loc13_.byteLength = _loc13_.length * _loc13_.bytesPerElement;
                  _loc13_.buffer = Bytes.alloc(_loc13_.byteLength);
                  _loc13_.copyFromArray(_loc8_);
                  _loc12_ = _loc13_;
               }
               else if(_loc9_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,1);
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
                  _loc13_ = new ArrayBufferView(0,1);
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
                     throw Exception.thrown("Invalid constructor arguments for Int8Array");
                  }
                  _loc13_ = new ArrayBufferView(0,1);
                  _loc16_ = _loc11_;
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
                  if(_loc3_ == null)
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
                     _loc19_ = _loc3_ * _loc13_.bytesPerElement;
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
               _loc5_ = _loc12_;
               break;
            case 2:
               _loc6_ = null;
               _loc7_ = buffer;
               _loc8_ = null;
               _loc9_ = null;
               _loc10_ = null;
               _loc11_ = _loc4_;
               if(_loc11_ == null)
               {
                  _loc11_ = 0;
               }
               if(_loc6_ != null)
               {
                  _loc12_ = new ArrayBufferView(_loc6_,2);
               }
               else if(_loc8_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,2);
                  _loc13_.byteOffset = 0;
                  _loc13_.length = int(_loc8_.length);
                  _loc13_.byteLength = _loc13_.length * _loc13_.bytesPerElement;
                  _loc13_.buffer = Bytes.alloc(_loc13_.byteLength);
                  _loc13_.copyFromArray(_loc8_);
                  _loc12_ = _loc13_;
               }
               else if(_loc9_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,2);
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
                  _loc13_ = new ArrayBufferView(0,2);
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
                     throw Exception.thrown("Invalid constructor arguments for Int16Array");
                  }
                  _loc13_ = new ArrayBufferView(0,2);
                  _loc16_ = _loc11_;
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
                  if(_loc3_ == null)
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
                     _loc19_ = _loc3_ * _loc13_.bytesPerElement;
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
               _loc5_ = _loc12_;
               break;
            case 3:
               _loc6_ = null;
               _loc7_ = buffer;
               _loc8_ = null;
               _loc9_ = null;
               _loc10_ = null;
               _loc11_ = _loc4_;
               if(_loc11_ == null)
               {
                  _loc11_ = 0;
               }
               if(_loc6_ != null)
               {
                  _loc12_ = new ArrayBufferView(_loc6_,3);
               }
               else if(_loc8_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,3);
                  _loc13_.byteOffset = 0;
                  _loc13_.length = int(_loc8_.length);
                  _loc13_.byteLength = _loc13_.length * _loc13_.bytesPerElement;
                  _loc13_.buffer = Bytes.alloc(_loc13_.byteLength);
                  _loc13_.copyFromArray(_loc8_);
                  _loc12_ = _loc13_;
               }
               else if(_loc9_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,3);
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
                  _loc13_ = new ArrayBufferView(0,3);
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
                     throw Exception.thrown("Invalid constructor arguments for Int32Array");
                  }
                  _loc13_ = new ArrayBufferView(0,3);
                  _loc16_ = _loc11_;
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
                  if(_loc3_ == null)
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
                     _loc19_ = _loc3_ * _loc13_.bytesPerElement;
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
               _loc5_ = _loc12_;
               break;
            case 4:
               _loc6_ = null;
               _loc7_ = buffer;
               _loc8_ = null;
               _loc9_ = null;
               _loc10_ = null;
               _loc11_ = _loc4_;
               if(_loc11_ == null)
               {
                  _loc11_ = 0;
               }
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
                  _loc16_ = _loc11_;
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
                  if(_loc3_ == null)
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
                     _loc19_ = _loc3_ * _loc13_.bytesPerElement;
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
               _loc5_ = _loc12_;
               break;
            case 5:
               _loc6_ = null;
               _loc7_ = buffer;
               _loc8_ = null;
               _loc9_ = null;
               _loc10_ = null;
               _loc11_ = _loc4_;
               if(_loc11_ == null)
               {
                  _loc11_ = 0;
               }
               if(_loc6_ != null)
               {
                  _loc12_ = new ArrayBufferView(_loc6_,5);
               }
               else if(_loc8_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,5);
                  _loc13_.byteOffset = 0;
                  _loc13_.length = int(_loc8_.length);
                  _loc13_.byteLength = _loc13_.length * _loc13_.bytesPerElement;
                  _loc13_.buffer = Bytes.alloc(_loc13_.byteLength);
                  _loc13_.copyFromArray(_loc8_);
                  _loc12_ = _loc13_;
               }
               else if(_loc9_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,5);
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
                  _loc13_ = new ArrayBufferView(0,5);
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
                     throw Exception.thrown("Invalid constructor arguments for UInt8ClampedArray");
                  }
                  _loc13_ = new ArrayBufferView(0,5);
                  _loc16_ = _loc11_;
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
                  if(_loc3_ == null)
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
                     _loc19_ = _loc3_ * _loc13_.bytesPerElement;
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
               _loc5_ = _loc12_;
               break;
            case 6:
               _loc6_ = null;
               _loc7_ = buffer;
               _loc8_ = null;
               _loc9_ = null;
               _loc10_ = null;
               _loc11_ = _loc4_;
               if(_loc11_ == null)
               {
                  _loc11_ = 0;
               }
               if(_loc6_ != null)
               {
                  _loc12_ = new ArrayBufferView(_loc6_,6);
               }
               else if(_loc8_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,6);
                  _loc13_.byteOffset = 0;
                  _loc13_.length = int(_loc8_.length);
                  _loc13_.byteLength = _loc13_.length * _loc13_.bytesPerElement;
                  _loc13_.buffer = Bytes.alloc(_loc13_.byteLength);
                  _loc13_.copyFromArray(_loc8_);
                  _loc12_ = _loc13_;
               }
               else if(_loc9_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,6);
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
                  _loc13_ = new ArrayBufferView(0,6);
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
                     throw Exception.thrown("Invalid constructor arguments for UInt16Array");
                  }
                  _loc13_ = new ArrayBufferView(0,6);
                  _loc16_ = _loc11_;
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
                  if(_loc3_ == null)
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
                     _loc19_ = _loc3_ * _loc13_.bytesPerElement;
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
               _loc5_ = _loc12_;
               break;
            case 7:
               _loc6_ = null;
               _loc7_ = buffer;
               _loc8_ = null;
               _loc9_ = null;
               _loc10_ = null;
               _loc11_ = _loc4_;
               if(_loc11_ == null)
               {
                  _loc11_ = 0;
               }
               if(_loc6_ != null)
               {
                  _loc12_ = new ArrayBufferView(_loc6_,7);
               }
               else if(_loc8_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,7);
                  _loc13_.byteOffset = 0;
                  _loc13_.length = int(_loc8_.length);
                  _loc13_.byteLength = _loc13_.length * _loc13_.bytesPerElement;
                  _loc13_.buffer = Bytes.alloc(_loc13_.byteLength);
                  _loc13_.copyFromArray(_loc8_);
                  _loc12_ = _loc13_;
               }
               else if(_loc9_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,7);
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
                  _loc13_ = new ArrayBufferView(0,7);
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
                     throw Exception.thrown("Invalid constructor arguments for UInt32Array");
                  }
                  _loc13_ = new ArrayBufferView(0,7);
                  _loc16_ = _loc11_;
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
                  if(_loc3_ == null)
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
                     _loc19_ = _loc3_ * _loc13_.bytesPerElement;
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
               _loc5_ = _loc12_;
               break;
            case 8:
               _loc6_ = null;
               _loc7_ = buffer;
               _loc8_ = null;
               _loc22_ = null;
               _loc10_ = null;
               _loc11_ = _loc4_;
               if(_loc11_ == null)
               {
                  _loc11_ = 0;
               }
               if(_loc6_ != null)
               {
                  _loc12_ = new ArrayBufferView(_loc6_,8);
               }
               else if(_loc8_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,8);
                  _loc13_.byteOffset = 0;
                  _loc13_.length = int(_loc8_.length);
                  _loc13_.byteLength = _loc13_.length * _loc13_.bytesPerElement;
                  _loc13_.buffer = Bytes.alloc(_loc13_.byteLength);
                  _loc13_.copyFromArray(_loc8_);
                  _loc12_ = _loc13_;
               }
               else if(_loc22_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,8);
                  _loc14_ = _loc22_.__array;
                  _loc13_.byteOffset = 0;
                  _loc13_.length = int(_loc14_.length);
                  _loc13_.byteLength = _loc13_.length * _loc13_.bytesPerElement;
                  _loc13_.buffer = Bytes.alloc(_loc13_.byteLength);
                  _loc13_.copyFromArray(_loc14_);
                  _loc12_ = _loc13_;
               }
               else if(_loc10_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,8);
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
                     throw Exception.thrown("Invalid constructor arguments for Float32Array");
                  }
                  _loc13_ = new ArrayBufferView(0,8);
                  _loc16_ = _loc11_;
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
                  if(_loc3_ == null)
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
                     _loc19_ = _loc3_ * _loc13_.bytesPerElement;
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
               _loc5_ = _loc12_;
               break;
            case 9:
               _loc6_ = null;
               _loc7_ = buffer;
               _loc8_ = null;
               _loc22_ = null;
               _loc10_ = null;
               _loc11_ = _loc4_;
               if(_loc11_ == null)
               {
                  _loc11_ = 0;
               }
               if(_loc6_ != null)
               {
                  _loc12_ = new ArrayBufferView(_loc6_,9);
               }
               else if(_loc8_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,9);
                  _loc13_.byteOffset = 0;
                  _loc13_.length = int(_loc8_.length);
                  _loc13_.byteLength = _loc13_.length * _loc13_.bytesPerElement;
                  _loc13_.buffer = Bytes.alloc(_loc13_.byteLength);
                  _loc13_.copyFromArray(_loc8_);
                  _loc12_ = _loc13_;
               }
               else if(_loc22_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,9);
                  _loc14_ = _loc22_.__array;
                  _loc13_.byteOffset = 0;
                  _loc13_.length = int(_loc14_.length);
                  _loc13_.byteLength = _loc13_.length * _loc13_.bytesPerElement;
                  _loc13_.buffer = Bytes.alloc(_loc13_.byteLength);
                  _loc13_.copyFromArray(_loc14_);
                  _loc12_ = _loc13_;
               }
               else if(_loc10_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,9);
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
                     throw Exception.thrown("Invalid constructor arguments for Float64Array");
                  }
                  _loc13_ = new ArrayBufferView(0,9);
                  _loc16_ = _loc11_;
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
                  if(_loc3_ == null)
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
                     _loc19_ = _loc3_ * _loc13_.bytesPerElement;
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
               _loc5_ = _loc12_;
         }
         return _loc5_;
      }
      
      public function subarray_lime_utils_UInt32Array(param1:int, param2:Object = undefined) : ArrayBufferView
      {
         var _loc5_:* = null as ArrayBufferView;
         var _loc6_:* = null as Object;
         var _loc7_:* = null as Bytes;
         var _loc8_:* = null as Array;
         var _loc9_:* = null as Vector.<int>;
         var _loc10_:* = null as ArrayBufferView;
         var _loc11_:* = null as Object;
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
         var _loc22_:* = null as Vector.<Number>;
         if(param2 == null)
         {
            param2 = length;
         }
         var _loc3_:int = param2 - param1;
         if(_loc3_ < 0)
         {
            _loc3_ = 0;
         }
         if(_loc3_ > length)
         {
            _loc3_ = length;
         }
         var _loc4_:int = param1 * bytesPerElement + byteOffset;
         switch(type)
         {
            case 0:
               throw Exception.thrown("subarray on a blank ArrayBufferView");
            case 1:
               _loc6_ = null;
               _loc7_ = buffer;
               _loc8_ = null;
               _loc9_ = null;
               _loc10_ = null;
               _loc11_ = _loc4_;
               if(_loc11_ == null)
               {
                  _loc11_ = 0;
               }
               if(_loc6_ != null)
               {
                  _loc12_ = new ArrayBufferView(_loc6_,1);
               }
               else if(_loc8_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,1);
                  _loc13_.byteOffset = 0;
                  _loc13_.length = int(_loc8_.length);
                  _loc13_.byteLength = _loc13_.length * _loc13_.bytesPerElement;
                  _loc13_.buffer = Bytes.alloc(_loc13_.byteLength);
                  _loc13_.copyFromArray(_loc8_);
                  _loc12_ = _loc13_;
               }
               else if(_loc9_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,1);
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
                  _loc13_ = new ArrayBufferView(0,1);
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
                     throw Exception.thrown("Invalid constructor arguments for Int8Array");
                  }
                  _loc13_ = new ArrayBufferView(0,1);
                  _loc16_ = _loc11_;
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
                  if(_loc3_ == null)
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
                     _loc19_ = _loc3_ * _loc13_.bytesPerElement;
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
               _loc5_ = _loc12_;
               break;
            case 2:
               _loc6_ = null;
               _loc7_ = buffer;
               _loc8_ = null;
               _loc9_ = null;
               _loc10_ = null;
               _loc11_ = _loc4_;
               if(_loc11_ == null)
               {
                  _loc11_ = 0;
               }
               if(_loc6_ != null)
               {
                  _loc12_ = new ArrayBufferView(_loc6_,2);
               }
               else if(_loc8_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,2);
                  _loc13_.byteOffset = 0;
                  _loc13_.length = int(_loc8_.length);
                  _loc13_.byteLength = _loc13_.length * _loc13_.bytesPerElement;
                  _loc13_.buffer = Bytes.alloc(_loc13_.byteLength);
                  _loc13_.copyFromArray(_loc8_);
                  _loc12_ = _loc13_;
               }
               else if(_loc9_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,2);
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
                  _loc13_ = new ArrayBufferView(0,2);
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
                     throw Exception.thrown("Invalid constructor arguments for Int16Array");
                  }
                  _loc13_ = new ArrayBufferView(0,2);
                  _loc16_ = _loc11_;
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
                  if(_loc3_ == null)
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
                     _loc19_ = _loc3_ * _loc13_.bytesPerElement;
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
               _loc5_ = _loc12_;
               break;
            case 3:
               _loc6_ = null;
               _loc7_ = buffer;
               _loc8_ = null;
               _loc9_ = null;
               _loc10_ = null;
               _loc11_ = _loc4_;
               if(_loc11_ == null)
               {
                  _loc11_ = 0;
               }
               if(_loc6_ != null)
               {
                  _loc12_ = new ArrayBufferView(_loc6_,3);
               }
               else if(_loc8_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,3);
                  _loc13_.byteOffset = 0;
                  _loc13_.length = int(_loc8_.length);
                  _loc13_.byteLength = _loc13_.length * _loc13_.bytesPerElement;
                  _loc13_.buffer = Bytes.alloc(_loc13_.byteLength);
                  _loc13_.copyFromArray(_loc8_);
                  _loc12_ = _loc13_;
               }
               else if(_loc9_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,3);
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
                  _loc13_ = new ArrayBufferView(0,3);
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
                     throw Exception.thrown("Invalid constructor arguments for Int32Array");
                  }
                  _loc13_ = new ArrayBufferView(0,3);
                  _loc16_ = _loc11_;
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
                  if(_loc3_ == null)
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
                     _loc19_ = _loc3_ * _loc13_.bytesPerElement;
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
               _loc5_ = _loc12_;
               break;
            case 4:
               _loc6_ = null;
               _loc7_ = buffer;
               _loc8_ = null;
               _loc9_ = null;
               _loc10_ = null;
               _loc11_ = _loc4_;
               if(_loc11_ == null)
               {
                  _loc11_ = 0;
               }
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
                  _loc16_ = _loc11_;
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
                  if(_loc3_ == null)
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
                     _loc19_ = _loc3_ * _loc13_.bytesPerElement;
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
               _loc5_ = _loc12_;
               break;
            case 5:
               _loc6_ = null;
               _loc7_ = buffer;
               _loc8_ = null;
               _loc9_ = null;
               _loc10_ = null;
               _loc11_ = _loc4_;
               if(_loc11_ == null)
               {
                  _loc11_ = 0;
               }
               if(_loc6_ != null)
               {
                  _loc12_ = new ArrayBufferView(_loc6_,5);
               }
               else if(_loc8_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,5);
                  _loc13_.byteOffset = 0;
                  _loc13_.length = int(_loc8_.length);
                  _loc13_.byteLength = _loc13_.length * _loc13_.bytesPerElement;
                  _loc13_.buffer = Bytes.alloc(_loc13_.byteLength);
                  _loc13_.copyFromArray(_loc8_);
                  _loc12_ = _loc13_;
               }
               else if(_loc9_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,5);
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
                  _loc13_ = new ArrayBufferView(0,5);
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
                     throw Exception.thrown("Invalid constructor arguments for UInt8ClampedArray");
                  }
                  _loc13_ = new ArrayBufferView(0,5);
                  _loc16_ = _loc11_;
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
                  if(_loc3_ == null)
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
                     _loc19_ = _loc3_ * _loc13_.bytesPerElement;
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
               _loc5_ = _loc12_;
               break;
            case 6:
               _loc6_ = null;
               _loc7_ = buffer;
               _loc8_ = null;
               _loc9_ = null;
               _loc10_ = null;
               _loc11_ = _loc4_;
               if(_loc11_ == null)
               {
                  _loc11_ = 0;
               }
               if(_loc6_ != null)
               {
                  _loc12_ = new ArrayBufferView(_loc6_,6);
               }
               else if(_loc8_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,6);
                  _loc13_.byteOffset = 0;
                  _loc13_.length = int(_loc8_.length);
                  _loc13_.byteLength = _loc13_.length * _loc13_.bytesPerElement;
                  _loc13_.buffer = Bytes.alloc(_loc13_.byteLength);
                  _loc13_.copyFromArray(_loc8_);
                  _loc12_ = _loc13_;
               }
               else if(_loc9_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,6);
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
                  _loc13_ = new ArrayBufferView(0,6);
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
                     throw Exception.thrown("Invalid constructor arguments for UInt16Array");
                  }
                  _loc13_ = new ArrayBufferView(0,6);
                  _loc16_ = _loc11_;
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
                  if(_loc3_ == null)
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
                     _loc19_ = _loc3_ * _loc13_.bytesPerElement;
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
               _loc5_ = _loc12_;
               break;
            case 7:
               _loc6_ = null;
               _loc7_ = buffer;
               _loc8_ = null;
               _loc9_ = null;
               _loc10_ = null;
               _loc11_ = _loc4_;
               if(_loc11_ == null)
               {
                  _loc11_ = 0;
               }
               if(_loc6_ != null)
               {
                  _loc12_ = new ArrayBufferView(_loc6_,7);
               }
               else if(_loc8_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,7);
                  _loc13_.byteOffset = 0;
                  _loc13_.length = int(_loc8_.length);
                  _loc13_.byteLength = _loc13_.length * _loc13_.bytesPerElement;
                  _loc13_.buffer = Bytes.alloc(_loc13_.byteLength);
                  _loc13_.copyFromArray(_loc8_);
                  _loc12_ = _loc13_;
               }
               else if(_loc9_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,7);
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
                  _loc13_ = new ArrayBufferView(0,7);
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
                     throw Exception.thrown("Invalid constructor arguments for UInt32Array");
                  }
                  _loc13_ = new ArrayBufferView(0,7);
                  _loc16_ = _loc11_;
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
                  if(_loc3_ == null)
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
                     _loc19_ = _loc3_ * _loc13_.bytesPerElement;
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
               _loc5_ = _loc12_;
               break;
            case 8:
               _loc6_ = null;
               _loc7_ = buffer;
               _loc8_ = null;
               _loc22_ = null;
               _loc10_ = null;
               _loc11_ = _loc4_;
               if(_loc11_ == null)
               {
                  _loc11_ = 0;
               }
               if(_loc6_ != null)
               {
                  _loc12_ = new ArrayBufferView(_loc6_,8);
               }
               else if(_loc8_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,8);
                  _loc13_.byteOffset = 0;
                  _loc13_.length = int(_loc8_.length);
                  _loc13_.byteLength = _loc13_.length * _loc13_.bytesPerElement;
                  _loc13_.buffer = Bytes.alloc(_loc13_.byteLength);
                  _loc13_.copyFromArray(_loc8_);
                  _loc12_ = _loc13_;
               }
               else if(_loc22_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,8);
                  _loc14_ = _loc22_.__array;
                  _loc13_.byteOffset = 0;
                  _loc13_.length = int(_loc14_.length);
                  _loc13_.byteLength = _loc13_.length * _loc13_.bytesPerElement;
                  _loc13_.buffer = Bytes.alloc(_loc13_.byteLength);
                  _loc13_.copyFromArray(_loc14_);
                  _loc12_ = _loc13_;
               }
               else if(_loc10_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,8);
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
                     throw Exception.thrown("Invalid constructor arguments for Float32Array");
                  }
                  _loc13_ = new ArrayBufferView(0,8);
                  _loc16_ = _loc11_;
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
                  if(_loc3_ == null)
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
                     _loc19_ = _loc3_ * _loc13_.bytesPerElement;
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
               _loc5_ = _loc12_;
               break;
            case 9:
               _loc6_ = null;
               _loc7_ = buffer;
               _loc8_ = null;
               _loc22_ = null;
               _loc10_ = null;
               _loc11_ = _loc4_;
               if(_loc11_ == null)
               {
                  _loc11_ = 0;
               }
               if(_loc6_ != null)
               {
                  _loc12_ = new ArrayBufferView(_loc6_,9);
               }
               else if(_loc8_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,9);
                  _loc13_.byteOffset = 0;
                  _loc13_.length = int(_loc8_.length);
                  _loc13_.byteLength = _loc13_.length * _loc13_.bytesPerElement;
                  _loc13_.buffer = Bytes.alloc(_loc13_.byteLength);
                  _loc13_.copyFromArray(_loc8_);
                  _loc12_ = _loc13_;
               }
               else if(_loc22_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,9);
                  _loc14_ = _loc22_.__array;
                  _loc13_.byteOffset = 0;
                  _loc13_.length = int(_loc14_.length);
                  _loc13_.byteLength = _loc13_.length * _loc13_.bytesPerElement;
                  _loc13_.buffer = Bytes.alloc(_loc13_.byteLength);
                  _loc13_.copyFromArray(_loc14_);
                  _loc12_ = _loc13_;
               }
               else if(_loc10_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,9);
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
                     throw Exception.thrown("Invalid constructor arguments for Float64Array");
                  }
                  _loc13_ = new ArrayBufferView(0,9);
                  _loc16_ = _loc11_;
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
                  if(_loc3_ == null)
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
                     _loc19_ = _loc3_ * _loc13_.bytesPerElement;
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
               _loc5_ = _loc12_;
         }
         return _loc5_;
      }
      
      public function subarray_lime_utils_UInt16Array(param1:int, param2:Object = undefined) : ArrayBufferView
      {
         var _loc5_:* = null as ArrayBufferView;
         var _loc6_:* = null as Object;
         var _loc7_:* = null as Bytes;
         var _loc8_:* = null as Array;
         var _loc9_:* = null as Vector.<int>;
         var _loc10_:* = null as ArrayBufferView;
         var _loc11_:* = null as Object;
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
         var _loc22_:* = null as Vector.<Number>;
         if(param2 == null)
         {
            param2 = length;
         }
         var _loc3_:int = param2 - param1;
         if(_loc3_ < 0)
         {
            _loc3_ = 0;
         }
         if(_loc3_ > length)
         {
            _loc3_ = length;
         }
         var _loc4_:int = param1 * bytesPerElement + byteOffset;
         switch(type)
         {
            case 0:
               throw Exception.thrown("subarray on a blank ArrayBufferView");
            case 1:
               _loc6_ = null;
               _loc7_ = buffer;
               _loc8_ = null;
               _loc9_ = null;
               _loc10_ = null;
               _loc11_ = _loc4_;
               if(_loc11_ == null)
               {
                  _loc11_ = 0;
               }
               if(_loc6_ != null)
               {
                  _loc12_ = new ArrayBufferView(_loc6_,1);
               }
               else if(_loc8_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,1);
                  _loc13_.byteOffset = 0;
                  _loc13_.length = int(_loc8_.length);
                  _loc13_.byteLength = _loc13_.length * _loc13_.bytesPerElement;
                  _loc13_.buffer = Bytes.alloc(_loc13_.byteLength);
                  _loc13_.copyFromArray(_loc8_);
                  _loc12_ = _loc13_;
               }
               else if(_loc9_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,1);
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
                  _loc13_ = new ArrayBufferView(0,1);
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
                     throw Exception.thrown("Invalid constructor arguments for Int8Array");
                  }
                  _loc13_ = new ArrayBufferView(0,1);
                  _loc16_ = _loc11_;
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
                  if(_loc3_ == null)
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
                     _loc19_ = _loc3_ * _loc13_.bytesPerElement;
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
               _loc5_ = _loc12_;
               break;
            case 2:
               _loc6_ = null;
               _loc7_ = buffer;
               _loc8_ = null;
               _loc9_ = null;
               _loc10_ = null;
               _loc11_ = _loc4_;
               if(_loc11_ == null)
               {
                  _loc11_ = 0;
               }
               if(_loc6_ != null)
               {
                  _loc12_ = new ArrayBufferView(_loc6_,2);
               }
               else if(_loc8_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,2);
                  _loc13_.byteOffset = 0;
                  _loc13_.length = int(_loc8_.length);
                  _loc13_.byteLength = _loc13_.length * _loc13_.bytesPerElement;
                  _loc13_.buffer = Bytes.alloc(_loc13_.byteLength);
                  _loc13_.copyFromArray(_loc8_);
                  _loc12_ = _loc13_;
               }
               else if(_loc9_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,2);
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
                  _loc13_ = new ArrayBufferView(0,2);
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
                     throw Exception.thrown("Invalid constructor arguments for Int16Array");
                  }
                  _loc13_ = new ArrayBufferView(0,2);
                  _loc16_ = _loc11_;
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
                  if(_loc3_ == null)
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
                     _loc19_ = _loc3_ * _loc13_.bytesPerElement;
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
               _loc5_ = _loc12_;
               break;
            case 3:
               _loc6_ = null;
               _loc7_ = buffer;
               _loc8_ = null;
               _loc9_ = null;
               _loc10_ = null;
               _loc11_ = _loc4_;
               if(_loc11_ == null)
               {
                  _loc11_ = 0;
               }
               if(_loc6_ != null)
               {
                  _loc12_ = new ArrayBufferView(_loc6_,3);
               }
               else if(_loc8_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,3);
                  _loc13_.byteOffset = 0;
                  _loc13_.length = int(_loc8_.length);
                  _loc13_.byteLength = _loc13_.length * _loc13_.bytesPerElement;
                  _loc13_.buffer = Bytes.alloc(_loc13_.byteLength);
                  _loc13_.copyFromArray(_loc8_);
                  _loc12_ = _loc13_;
               }
               else if(_loc9_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,3);
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
                  _loc13_ = new ArrayBufferView(0,3);
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
                     throw Exception.thrown("Invalid constructor arguments for Int32Array");
                  }
                  _loc13_ = new ArrayBufferView(0,3);
                  _loc16_ = _loc11_;
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
                  if(_loc3_ == null)
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
                     _loc19_ = _loc3_ * _loc13_.bytesPerElement;
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
               _loc5_ = _loc12_;
               break;
            case 4:
               _loc6_ = null;
               _loc7_ = buffer;
               _loc8_ = null;
               _loc9_ = null;
               _loc10_ = null;
               _loc11_ = _loc4_;
               if(_loc11_ == null)
               {
                  _loc11_ = 0;
               }
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
                  _loc16_ = _loc11_;
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
                  if(_loc3_ == null)
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
                     _loc19_ = _loc3_ * _loc13_.bytesPerElement;
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
               _loc5_ = _loc12_;
               break;
            case 5:
               _loc6_ = null;
               _loc7_ = buffer;
               _loc8_ = null;
               _loc9_ = null;
               _loc10_ = null;
               _loc11_ = _loc4_;
               if(_loc11_ == null)
               {
                  _loc11_ = 0;
               }
               if(_loc6_ != null)
               {
                  _loc12_ = new ArrayBufferView(_loc6_,5);
               }
               else if(_loc8_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,5);
                  _loc13_.byteOffset = 0;
                  _loc13_.length = int(_loc8_.length);
                  _loc13_.byteLength = _loc13_.length * _loc13_.bytesPerElement;
                  _loc13_.buffer = Bytes.alloc(_loc13_.byteLength);
                  _loc13_.copyFromArray(_loc8_);
                  _loc12_ = _loc13_;
               }
               else if(_loc9_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,5);
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
                  _loc13_ = new ArrayBufferView(0,5);
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
                     throw Exception.thrown("Invalid constructor arguments for UInt8ClampedArray");
                  }
                  _loc13_ = new ArrayBufferView(0,5);
                  _loc16_ = _loc11_;
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
                  if(_loc3_ == null)
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
                     _loc19_ = _loc3_ * _loc13_.bytesPerElement;
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
               _loc5_ = _loc12_;
               break;
            case 6:
               _loc6_ = null;
               _loc7_ = buffer;
               _loc8_ = null;
               _loc9_ = null;
               _loc10_ = null;
               _loc11_ = _loc4_;
               if(_loc11_ == null)
               {
                  _loc11_ = 0;
               }
               if(_loc6_ != null)
               {
                  _loc12_ = new ArrayBufferView(_loc6_,6);
               }
               else if(_loc8_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,6);
                  _loc13_.byteOffset = 0;
                  _loc13_.length = int(_loc8_.length);
                  _loc13_.byteLength = _loc13_.length * _loc13_.bytesPerElement;
                  _loc13_.buffer = Bytes.alloc(_loc13_.byteLength);
                  _loc13_.copyFromArray(_loc8_);
                  _loc12_ = _loc13_;
               }
               else if(_loc9_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,6);
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
                  _loc13_ = new ArrayBufferView(0,6);
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
                     throw Exception.thrown("Invalid constructor arguments for UInt16Array");
                  }
                  _loc13_ = new ArrayBufferView(0,6);
                  _loc16_ = _loc11_;
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
                  if(_loc3_ == null)
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
                     _loc19_ = _loc3_ * _loc13_.bytesPerElement;
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
               _loc5_ = _loc12_;
               break;
            case 7:
               _loc6_ = null;
               _loc7_ = buffer;
               _loc8_ = null;
               _loc9_ = null;
               _loc10_ = null;
               _loc11_ = _loc4_;
               if(_loc11_ == null)
               {
                  _loc11_ = 0;
               }
               if(_loc6_ != null)
               {
                  _loc12_ = new ArrayBufferView(_loc6_,7);
               }
               else if(_loc8_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,7);
                  _loc13_.byteOffset = 0;
                  _loc13_.length = int(_loc8_.length);
                  _loc13_.byteLength = _loc13_.length * _loc13_.bytesPerElement;
                  _loc13_.buffer = Bytes.alloc(_loc13_.byteLength);
                  _loc13_.copyFromArray(_loc8_);
                  _loc12_ = _loc13_;
               }
               else if(_loc9_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,7);
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
                  _loc13_ = new ArrayBufferView(0,7);
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
                     throw Exception.thrown("Invalid constructor arguments for UInt32Array");
                  }
                  _loc13_ = new ArrayBufferView(0,7);
                  _loc16_ = _loc11_;
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
                  if(_loc3_ == null)
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
                     _loc19_ = _loc3_ * _loc13_.bytesPerElement;
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
               _loc5_ = _loc12_;
               break;
            case 8:
               _loc6_ = null;
               _loc7_ = buffer;
               _loc8_ = null;
               _loc22_ = null;
               _loc10_ = null;
               _loc11_ = _loc4_;
               if(_loc11_ == null)
               {
                  _loc11_ = 0;
               }
               if(_loc6_ != null)
               {
                  _loc12_ = new ArrayBufferView(_loc6_,8);
               }
               else if(_loc8_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,8);
                  _loc13_.byteOffset = 0;
                  _loc13_.length = int(_loc8_.length);
                  _loc13_.byteLength = _loc13_.length * _loc13_.bytesPerElement;
                  _loc13_.buffer = Bytes.alloc(_loc13_.byteLength);
                  _loc13_.copyFromArray(_loc8_);
                  _loc12_ = _loc13_;
               }
               else if(_loc22_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,8);
                  _loc14_ = _loc22_.__array;
                  _loc13_.byteOffset = 0;
                  _loc13_.length = int(_loc14_.length);
                  _loc13_.byteLength = _loc13_.length * _loc13_.bytesPerElement;
                  _loc13_.buffer = Bytes.alloc(_loc13_.byteLength);
                  _loc13_.copyFromArray(_loc14_);
                  _loc12_ = _loc13_;
               }
               else if(_loc10_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,8);
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
                     throw Exception.thrown("Invalid constructor arguments for Float32Array");
                  }
                  _loc13_ = new ArrayBufferView(0,8);
                  _loc16_ = _loc11_;
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
                  if(_loc3_ == null)
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
                     _loc19_ = _loc3_ * _loc13_.bytesPerElement;
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
               _loc5_ = _loc12_;
               break;
            case 9:
               _loc6_ = null;
               _loc7_ = buffer;
               _loc8_ = null;
               _loc22_ = null;
               _loc10_ = null;
               _loc11_ = _loc4_;
               if(_loc11_ == null)
               {
                  _loc11_ = 0;
               }
               if(_loc6_ != null)
               {
                  _loc12_ = new ArrayBufferView(_loc6_,9);
               }
               else if(_loc8_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,9);
                  _loc13_.byteOffset = 0;
                  _loc13_.length = int(_loc8_.length);
                  _loc13_.byteLength = _loc13_.length * _loc13_.bytesPerElement;
                  _loc13_.buffer = Bytes.alloc(_loc13_.byteLength);
                  _loc13_.copyFromArray(_loc8_);
                  _loc12_ = _loc13_;
               }
               else if(_loc22_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,9);
                  _loc14_ = _loc22_.__array;
                  _loc13_.byteOffset = 0;
                  _loc13_.length = int(_loc14_.length);
                  _loc13_.byteLength = _loc13_.length * _loc13_.bytesPerElement;
                  _loc13_.buffer = Bytes.alloc(_loc13_.byteLength);
                  _loc13_.copyFromArray(_loc14_);
                  _loc12_ = _loc13_;
               }
               else if(_loc10_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,9);
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
                     throw Exception.thrown("Invalid constructor arguments for Float64Array");
                  }
                  _loc13_ = new ArrayBufferView(0,9);
                  _loc16_ = _loc11_;
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
                  if(_loc3_ == null)
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
                     _loc19_ = _loc3_ * _loc13_.bytesPerElement;
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
               _loc5_ = _loc12_;
         }
         return _loc5_;
      }
      
      public function subarray_lime_utils_Int8Array(param1:int, param2:Object = undefined) : ArrayBufferView
      {
         var _loc5_:* = null as ArrayBufferView;
         var _loc6_:* = null as Object;
         var _loc7_:* = null as Bytes;
         var _loc8_:* = null as Array;
         var _loc9_:* = null as Vector.<int>;
         var _loc10_:* = null as ArrayBufferView;
         var _loc11_:* = null as Object;
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
         var _loc22_:* = null as Vector.<Number>;
         if(param2 == null)
         {
            param2 = length;
         }
         var _loc3_:int = param2 - param1;
         if(_loc3_ < 0)
         {
            _loc3_ = 0;
         }
         if(_loc3_ > length)
         {
            _loc3_ = length;
         }
         var _loc4_:int = param1 * bytesPerElement + byteOffset;
         switch(type)
         {
            case 0:
               throw Exception.thrown("subarray on a blank ArrayBufferView");
            case 1:
               _loc6_ = null;
               _loc7_ = buffer;
               _loc8_ = null;
               _loc9_ = null;
               _loc10_ = null;
               _loc11_ = _loc4_;
               if(_loc11_ == null)
               {
                  _loc11_ = 0;
               }
               if(_loc6_ != null)
               {
                  _loc12_ = new ArrayBufferView(_loc6_,1);
               }
               else if(_loc8_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,1);
                  _loc13_.byteOffset = 0;
                  _loc13_.length = int(_loc8_.length);
                  _loc13_.byteLength = _loc13_.length * _loc13_.bytesPerElement;
                  _loc13_.buffer = Bytes.alloc(_loc13_.byteLength);
                  _loc13_.copyFromArray(_loc8_);
                  _loc12_ = _loc13_;
               }
               else if(_loc9_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,1);
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
                  _loc13_ = new ArrayBufferView(0,1);
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
                     throw Exception.thrown("Invalid constructor arguments for Int8Array");
                  }
                  _loc13_ = new ArrayBufferView(0,1);
                  _loc16_ = _loc11_;
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
                  if(_loc3_ == null)
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
                     _loc19_ = _loc3_ * _loc13_.bytesPerElement;
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
               _loc5_ = _loc12_;
               break;
            case 2:
               _loc6_ = null;
               _loc7_ = buffer;
               _loc8_ = null;
               _loc9_ = null;
               _loc10_ = null;
               _loc11_ = _loc4_;
               if(_loc11_ == null)
               {
                  _loc11_ = 0;
               }
               if(_loc6_ != null)
               {
                  _loc12_ = new ArrayBufferView(_loc6_,2);
               }
               else if(_loc8_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,2);
                  _loc13_.byteOffset = 0;
                  _loc13_.length = int(_loc8_.length);
                  _loc13_.byteLength = _loc13_.length * _loc13_.bytesPerElement;
                  _loc13_.buffer = Bytes.alloc(_loc13_.byteLength);
                  _loc13_.copyFromArray(_loc8_);
                  _loc12_ = _loc13_;
               }
               else if(_loc9_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,2);
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
                  _loc13_ = new ArrayBufferView(0,2);
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
                     throw Exception.thrown("Invalid constructor arguments for Int16Array");
                  }
                  _loc13_ = new ArrayBufferView(0,2);
                  _loc16_ = _loc11_;
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
                  if(_loc3_ == null)
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
                     _loc19_ = _loc3_ * _loc13_.bytesPerElement;
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
               _loc5_ = _loc12_;
               break;
            case 3:
               _loc6_ = null;
               _loc7_ = buffer;
               _loc8_ = null;
               _loc9_ = null;
               _loc10_ = null;
               _loc11_ = _loc4_;
               if(_loc11_ == null)
               {
                  _loc11_ = 0;
               }
               if(_loc6_ != null)
               {
                  _loc12_ = new ArrayBufferView(_loc6_,3);
               }
               else if(_loc8_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,3);
                  _loc13_.byteOffset = 0;
                  _loc13_.length = int(_loc8_.length);
                  _loc13_.byteLength = _loc13_.length * _loc13_.bytesPerElement;
                  _loc13_.buffer = Bytes.alloc(_loc13_.byteLength);
                  _loc13_.copyFromArray(_loc8_);
                  _loc12_ = _loc13_;
               }
               else if(_loc9_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,3);
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
                  _loc13_ = new ArrayBufferView(0,3);
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
                     throw Exception.thrown("Invalid constructor arguments for Int32Array");
                  }
                  _loc13_ = new ArrayBufferView(0,3);
                  _loc16_ = _loc11_;
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
                  if(_loc3_ == null)
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
                     _loc19_ = _loc3_ * _loc13_.bytesPerElement;
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
               _loc5_ = _loc12_;
               break;
            case 4:
               _loc6_ = null;
               _loc7_ = buffer;
               _loc8_ = null;
               _loc9_ = null;
               _loc10_ = null;
               _loc11_ = _loc4_;
               if(_loc11_ == null)
               {
                  _loc11_ = 0;
               }
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
                  _loc16_ = _loc11_;
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
                  if(_loc3_ == null)
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
                     _loc19_ = _loc3_ * _loc13_.bytesPerElement;
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
               _loc5_ = _loc12_;
               break;
            case 5:
               _loc6_ = null;
               _loc7_ = buffer;
               _loc8_ = null;
               _loc9_ = null;
               _loc10_ = null;
               _loc11_ = _loc4_;
               if(_loc11_ == null)
               {
                  _loc11_ = 0;
               }
               if(_loc6_ != null)
               {
                  _loc12_ = new ArrayBufferView(_loc6_,5);
               }
               else if(_loc8_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,5);
                  _loc13_.byteOffset = 0;
                  _loc13_.length = int(_loc8_.length);
                  _loc13_.byteLength = _loc13_.length * _loc13_.bytesPerElement;
                  _loc13_.buffer = Bytes.alloc(_loc13_.byteLength);
                  _loc13_.copyFromArray(_loc8_);
                  _loc12_ = _loc13_;
               }
               else if(_loc9_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,5);
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
                  _loc13_ = new ArrayBufferView(0,5);
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
                     throw Exception.thrown("Invalid constructor arguments for UInt8ClampedArray");
                  }
                  _loc13_ = new ArrayBufferView(0,5);
                  _loc16_ = _loc11_;
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
                  if(_loc3_ == null)
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
                     _loc19_ = _loc3_ * _loc13_.bytesPerElement;
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
               _loc5_ = _loc12_;
               break;
            case 6:
               _loc6_ = null;
               _loc7_ = buffer;
               _loc8_ = null;
               _loc9_ = null;
               _loc10_ = null;
               _loc11_ = _loc4_;
               if(_loc11_ == null)
               {
                  _loc11_ = 0;
               }
               if(_loc6_ != null)
               {
                  _loc12_ = new ArrayBufferView(_loc6_,6);
               }
               else if(_loc8_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,6);
                  _loc13_.byteOffset = 0;
                  _loc13_.length = int(_loc8_.length);
                  _loc13_.byteLength = _loc13_.length * _loc13_.bytesPerElement;
                  _loc13_.buffer = Bytes.alloc(_loc13_.byteLength);
                  _loc13_.copyFromArray(_loc8_);
                  _loc12_ = _loc13_;
               }
               else if(_loc9_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,6);
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
                  _loc13_ = new ArrayBufferView(0,6);
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
                     throw Exception.thrown("Invalid constructor arguments for UInt16Array");
                  }
                  _loc13_ = new ArrayBufferView(0,6);
                  _loc16_ = _loc11_;
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
                  if(_loc3_ == null)
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
                     _loc19_ = _loc3_ * _loc13_.bytesPerElement;
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
               _loc5_ = _loc12_;
               break;
            case 7:
               _loc6_ = null;
               _loc7_ = buffer;
               _loc8_ = null;
               _loc9_ = null;
               _loc10_ = null;
               _loc11_ = _loc4_;
               if(_loc11_ == null)
               {
                  _loc11_ = 0;
               }
               if(_loc6_ != null)
               {
                  _loc12_ = new ArrayBufferView(_loc6_,7);
               }
               else if(_loc8_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,7);
                  _loc13_.byteOffset = 0;
                  _loc13_.length = int(_loc8_.length);
                  _loc13_.byteLength = _loc13_.length * _loc13_.bytesPerElement;
                  _loc13_.buffer = Bytes.alloc(_loc13_.byteLength);
                  _loc13_.copyFromArray(_loc8_);
                  _loc12_ = _loc13_;
               }
               else if(_loc9_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,7);
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
                  _loc13_ = new ArrayBufferView(0,7);
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
                     throw Exception.thrown("Invalid constructor arguments for UInt32Array");
                  }
                  _loc13_ = new ArrayBufferView(0,7);
                  _loc16_ = _loc11_;
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
                  if(_loc3_ == null)
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
                     _loc19_ = _loc3_ * _loc13_.bytesPerElement;
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
               _loc5_ = _loc12_;
               break;
            case 8:
               _loc6_ = null;
               _loc7_ = buffer;
               _loc8_ = null;
               _loc22_ = null;
               _loc10_ = null;
               _loc11_ = _loc4_;
               if(_loc11_ == null)
               {
                  _loc11_ = 0;
               }
               if(_loc6_ != null)
               {
                  _loc12_ = new ArrayBufferView(_loc6_,8);
               }
               else if(_loc8_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,8);
                  _loc13_.byteOffset = 0;
                  _loc13_.length = int(_loc8_.length);
                  _loc13_.byteLength = _loc13_.length * _loc13_.bytesPerElement;
                  _loc13_.buffer = Bytes.alloc(_loc13_.byteLength);
                  _loc13_.copyFromArray(_loc8_);
                  _loc12_ = _loc13_;
               }
               else if(_loc22_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,8);
                  _loc14_ = _loc22_.__array;
                  _loc13_.byteOffset = 0;
                  _loc13_.length = int(_loc14_.length);
                  _loc13_.byteLength = _loc13_.length * _loc13_.bytesPerElement;
                  _loc13_.buffer = Bytes.alloc(_loc13_.byteLength);
                  _loc13_.copyFromArray(_loc14_);
                  _loc12_ = _loc13_;
               }
               else if(_loc10_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,8);
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
                     throw Exception.thrown("Invalid constructor arguments for Float32Array");
                  }
                  _loc13_ = new ArrayBufferView(0,8);
                  _loc16_ = _loc11_;
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
                  if(_loc3_ == null)
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
                     _loc19_ = _loc3_ * _loc13_.bytesPerElement;
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
               _loc5_ = _loc12_;
               break;
            case 9:
               _loc6_ = null;
               _loc7_ = buffer;
               _loc8_ = null;
               _loc22_ = null;
               _loc10_ = null;
               _loc11_ = _loc4_;
               if(_loc11_ == null)
               {
                  _loc11_ = 0;
               }
               if(_loc6_ != null)
               {
                  _loc12_ = new ArrayBufferView(_loc6_,9);
               }
               else if(_loc8_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,9);
                  _loc13_.byteOffset = 0;
                  _loc13_.length = int(_loc8_.length);
                  _loc13_.byteLength = _loc13_.length * _loc13_.bytesPerElement;
                  _loc13_.buffer = Bytes.alloc(_loc13_.byteLength);
                  _loc13_.copyFromArray(_loc8_);
                  _loc12_ = _loc13_;
               }
               else if(_loc22_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,9);
                  _loc14_ = _loc22_.__array;
                  _loc13_.byteOffset = 0;
                  _loc13_.length = int(_loc14_.length);
                  _loc13_.byteLength = _loc13_.length * _loc13_.bytesPerElement;
                  _loc13_.buffer = Bytes.alloc(_loc13_.byteLength);
                  _loc13_.copyFromArray(_loc14_);
                  _loc12_ = _loc13_;
               }
               else if(_loc10_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,9);
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
                     throw Exception.thrown("Invalid constructor arguments for Float64Array");
                  }
                  _loc13_ = new ArrayBufferView(0,9);
                  _loc16_ = _loc11_;
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
                  if(_loc3_ == null)
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
                     _loc19_ = _loc3_ * _loc13_.bytesPerElement;
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
               _loc5_ = _loc12_;
         }
         return _loc5_;
      }
      
      public function subarray_lime_utils_Int32Array(param1:int, param2:Object = undefined) : ArrayBufferView
      {
         var _loc5_:* = null as ArrayBufferView;
         var _loc6_:* = null as Object;
         var _loc7_:* = null as Bytes;
         var _loc8_:* = null as Array;
         var _loc9_:* = null as Vector.<int>;
         var _loc10_:* = null as ArrayBufferView;
         var _loc11_:* = null as Object;
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
         var _loc22_:* = null as Vector.<Number>;
         if(param2 == null)
         {
            param2 = length;
         }
         var _loc3_:int = param2 - param1;
         if(_loc3_ < 0)
         {
            _loc3_ = 0;
         }
         if(_loc3_ > length)
         {
            _loc3_ = length;
         }
         var _loc4_:int = param1 * bytesPerElement + byteOffset;
         switch(type)
         {
            case 0:
               throw Exception.thrown("subarray on a blank ArrayBufferView");
            case 1:
               _loc6_ = null;
               _loc7_ = buffer;
               _loc8_ = null;
               _loc9_ = null;
               _loc10_ = null;
               _loc11_ = _loc4_;
               if(_loc11_ == null)
               {
                  _loc11_ = 0;
               }
               if(_loc6_ != null)
               {
                  _loc12_ = new ArrayBufferView(_loc6_,1);
               }
               else if(_loc8_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,1);
                  _loc13_.byteOffset = 0;
                  _loc13_.length = int(_loc8_.length);
                  _loc13_.byteLength = _loc13_.length * _loc13_.bytesPerElement;
                  _loc13_.buffer = Bytes.alloc(_loc13_.byteLength);
                  _loc13_.copyFromArray(_loc8_);
                  _loc12_ = _loc13_;
               }
               else if(_loc9_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,1);
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
                  _loc13_ = new ArrayBufferView(0,1);
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
                     throw Exception.thrown("Invalid constructor arguments for Int8Array");
                  }
                  _loc13_ = new ArrayBufferView(0,1);
                  _loc16_ = _loc11_;
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
                  if(_loc3_ == null)
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
                     _loc19_ = _loc3_ * _loc13_.bytesPerElement;
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
               _loc5_ = _loc12_;
               break;
            case 2:
               _loc6_ = null;
               _loc7_ = buffer;
               _loc8_ = null;
               _loc9_ = null;
               _loc10_ = null;
               _loc11_ = _loc4_;
               if(_loc11_ == null)
               {
                  _loc11_ = 0;
               }
               if(_loc6_ != null)
               {
                  _loc12_ = new ArrayBufferView(_loc6_,2);
               }
               else if(_loc8_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,2);
                  _loc13_.byteOffset = 0;
                  _loc13_.length = int(_loc8_.length);
                  _loc13_.byteLength = _loc13_.length * _loc13_.bytesPerElement;
                  _loc13_.buffer = Bytes.alloc(_loc13_.byteLength);
                  _loc13_.copyFromArray(_loc8_);
                  _loc12_ = _loc13_;
               }
               else if(_loc9_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,2);
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
                  _loc13_ = new ArrayBufferView(0,2);
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
                     throw Exception.thrown("Invalid constructor arguments for Int16Array");
                  }
                  _loc13_ = new ArrayBufferView(0,2);
                  _loc16_ = _loc11_;
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
                  if(_loc3_ == null)
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
                     _loc19_ = _loc3_ * _loc13_.bytesPerElement;
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
               _loc5_ = _loc12_;
               break;
            case 3:
               _loc6_ = null;
               _loc7_ = buffer;
               _loc8_ = null;
               _loc9_ = null;
               _loc10_ = null;
               _loc11_ = _loc4_;
               if(_loc11_ == null)
               {
                  _loc11_ = 0;
               }
               if(_loc6_ != null)
               {
                  _loc12_ = new ArrayBufferView(_loc6_,3);
               }
               else if(_loc8_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,3);
                  _loc13_.byteOffset = 0;
                  _loc13_.length = int(_loc8_.length);
                  _loc13_.byteLength = _loc13_.length * _loc13_.bytesPerElement;
                  _loc13_.buffer = Bytes.alloc(_loc13_.byteLength);
                  _loc13_.copyFromArray(_loc8_);
                  _loc12_ = _loc13_;
               }
               else if(_loc9_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,3);
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
                  _loc13_ = new ArrayBufferView(0,3);
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
                     throw Exception.thrown("Invalid constructor arguments for Int32Array");
                  }
                  _loc13_ = new ArrayBufferView(0,3);
                  _loc16_ = _loc11_;
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
                  if(_loc3_ == null)
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
                     _loc19_ = _loc3_ * _loc13_.bytesPerElement;
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
               _loc5_ = _loc12_;
               break;
            case 4:
               _loc6_ = null;
               _loc7_ = buffer;
               _loc8_ = null;
               _loc9_ = null;
               _loc10_ = null;
               _loc11_ = _loc4_;
               if(_loc11_ == null)
               {
                  _loc11_ = 0;
               }
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
                  _loc16_ = _loc11_;
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
                  if(_loc3_ == null)
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
                     _loc19_ = _loc3_ * _loc13_.bytesPerElement;
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
               _loc5_ = _loc12_;
               break;
            case 5:
               _loc6_ = null;
               _loc7_ = buffer;
               _loc8_ = null;
               _loc9_ = null;
               _loc10_ = null;
               _loc11_ = _loc4_;
               if(_loc11_ == null)
               {
                  _loc11_ = 0;
               }
               if(_loc6_ != null)
               {
                  _loc12_ = new ArrayBufferView(_loc6_,5);
               }
               else if(_loc8_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,5);
                  _loc13_.byteOffset = 0;
                  _loc13_.length = int(_loc8_.length);
                  _loc13_.byteLength = _loc13_.length * _loc13_.bytesPerElement;
                  _loc13_.buffer = Bytes.alloc(_loc13_.byteLength);
                  _loc13_.copyFromArray(_loc8_);
                  _loc12_ = _loc13_;
               }
               else if(_loc9_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,5);
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
                  _loc13_ = new ArrayBufferView(0,5);
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
                     throw Exception.thrown("Invalid constructor arguments for UInt8ClampedArray");
                  }
                  _loc13_ = new ArrayBufferView(0,5);
                  _loc16_ = _loc11_;
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
                  if(_loc3_ == null)
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
                     _loc19_ = _loc3_ * _loc13_.bytesPerElement;
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
               _loc5_ = _loc12_;
               break;
            case 6:
               _loc6_ = null;
               _loc7_ = buffer;
               _loc8_ = null;
               _loc9_ = null;
               _loc10_ = null;
               _loc11_ = _loc4_;
               if(_loc11_ == null)
               {
                  _loc11_ = 0;
               }
               if(_loc6_ != null)
               {
                  _loc12_ = new ArrayBufferView(_loc6_,6);
               }
               else if(_loc8_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,6);
                  _loc13_.byteOffset = 0;
                  _loc13_.length = int(_loc8_.length);
                  _loc13_.byteLength = _loc13_.length * _loc13_.bytesPerElement;
                  _loc13_.buffer = Bytes.alloc(_loc13_.byteLength);
                  _loc13_.copyFromArray(_loc8_);
                  _loc12_ = _loc13_;
               }
               else if(_loc9_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,6);
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
                  _loc13_ = new ArrayBufferView(0,6);
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
                     throw Exception.thrown("Invalid constructor arguments for UInt16Array");
                  }
                  _loc13_ = new ArrayBufferView(0,6);
                  _loc16_ = _loc11_;
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
                  if(_loc3_ == null)
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
                     _loc19_ = _loc3_ * _loc13_.bytesPerElement;
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
               _loc5_ = _loc12_;
               break;
            case 7:
               _loc6_ = null;
               _loc7_ = buffer;
               _loc8_ = null;
               _loc9_ = null;
               _loc10_ = null;
               _loc11_ = _loc4_;
               if(_loc11_ == null)
               {
                  _loc11_ = 0;
               }
               if(_loc6_ != null)
               {
                  _loc12_ = new ArrayBufferView(_loc6_,7);
               }
               else if(_loc8_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,7);
                  _loc13_.byteOffset = 0;
                  _loc13_.length = int(_loc8_.length);
                  _loc13_.byteLength = _loc13_.length * _loc13_.bytesPerElement;
                  _loc13_.buffer = Bytes.alloc(_loc13_.byteLength);
                  _loc13_.copyFromArray(_loc8_);
                  _loc12_ = _loc13_;
               }
               else if(_loc9_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,7);
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
                  _loc13_ = new ArrayBufferView(0,7);
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
                     throw Exception.thrown("Invalid constructor arguments for UInt32Array");
                  }
                  _loc13_ = new ArrayBufferView(0,7);
                  _loc16_ = _loc11_;
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
                  if(_loc3_ == null)
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
                     _loc19_ = _loc3_ * _loc13_.bytesPerElement;
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
               _loc5_ = _loc12_;
               break;
            case 8:
               _loc6_ = null;
               _loc7_ = buffer;
               _loc8_ = null;
               _loc22_ = null;
               _loc10_ = null;
               _loc11_ = _loc4_;
               if(_loc11_ == null)
               {
                  _loc11_ = 0;
               }
               if(_loc6_ != null)
               {
                  _loc12_ = new ArrayBufferView(_loc6_,8);
               }
               else if(_loc8_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,8);
                  _loc13_.byteOffset = 0;
                  _loc13_.length = int(_loc8_.length);
                  _loc13_.byteLength = _loc13_.length * _loc13_.bytesPerElement;
                  _loc13_.buffer = Bytes.alloc(_loc13_.byteLength);
                  _loc13_.copyFromArray(_loc8_);
                  _loc12_ = _loc13_;
               }
               else if(_loc22_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,8);
                  _loc14_ = _loc22_.__array;
                  _loc13_.byteOffset = 0;
                  _loc13_.length = int(_loc14_.length);
                  _loc13_.byteLength = _loc13_.length * _loc13_.bytesPerElement;
                  _loc13_.buffer = Bytes.alloc(_loc13_.byteLength);
                  _loc13_.copyFromArray(_loc14_);
                  _loc12_ = _loc13_;
               }
               else if(_loc10_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,8);
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
                     throw Exception.thrown("Invalid constructor arguments for Float32Array");
                  }
                  _loc13_ = new ArrayBufferView(0,8);
                  _loc16_ = _loc11_;
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
                  if(_loc3_ == null)
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
                     _loc19_ = _loc3_ * _loc13_.bytesPerElement;
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
               _loc5_ = _loc12_;
               break;
            case 9:
               _loc6_ = null;
               _loc7_ = buffer;
               _loc8_ = null;
               _loc22_ = null;
               _loc10_ = null;
               _loc11_ = _loc4_;
               if(_loc11_ == null)
               {
                  _loc11_ = 0;
               }
               if(_loc6_ != null)
               {
                  _loc12_ = new ArrayBufferView(_loc6_,9);
               }
               else if(_loc8_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,9);
                  _loc13_.byteOffset = 0;
                  _loc13_.length = int(_loc8_.length);
                  _loc13_.byteLength = _loc13_.length * _loc13_.bytesPerElement;
                  _loc13_.buffer = Bytes.alloc(_loc13_.byteLength);
                  _loc13_.copyFromArray(_loc8_);
                  _loc12_ = _loc13_;
               }
               else if(_loc22_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,9);
                  _loc14_ = _loc22_.__array;
                  _loc13_.byteOffset = 0;
                  _loc13_.length = int(_loc14_.length);
                  _loc13_.byteLength = _loc13_.length * _loc13_.bytesPerElement;
                  _loc13_.buffer = Bytes.alloc(_loc13_.byteLength);
                  _loc13_.copyFromArray(_loc14_);
                  _loc12_ = _loc13_;
               }
               else if(_loc10_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,9);
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
                     throw Exception.thrown("Invalid constructor arguments for Float64Array");
                  }
                  _loc13_ = new ArrayBufferView(0,9);
                  _loc16_ = _loc11_;
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
                  if(_loc3_ == null)
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
                     _loc19_ = _loc3_ * _loc13_.bytesPerElement;
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
               _loc5_ = _loc12_;
         }
         return _loc5_;
      }
      
      public function subarray_lime_utils_Int16Array(param1:int, param2:Object = undefined) : ArrayBufferView
      {
         var _loc5_:* = null as ArrayBufferView;
         var _loc6_:* = null as Object;
         var _loc7_:* = null as Bytes;
         var _loc8_:* = null as Array;
         var _loc9_:* = null as Vector.<int>;
         var _loc10_:* = null as ArrayBufferView;
         var _loc11_:* = null as Object;
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
         var _loc22_:* = null as Vector.<Number>;
         if(param2 == null)
         {
            param2 = length;
         }
         var _loc3_:int = param2 - param1;
         if(_loc3_ < 0)
         {
            _loc3_ = 0;
         }
         if(_loc3_ > length)
         {
            _loc3_ = length;
         }
         var _loc4_:int = param1 * bytesPerElement + byteOffset;
         switch(type)
         {
            case 0:
               throw Exception.thrown("subarray on a blank ArrayBufferView");
            case 1:
               _loc6_ = null;
               _loc7_ = buffer;
               _loc8_ = null;
               _loc9_ = null;
               _loc10_ = null;
               _loc11_ = _loc4_;
               if(_loc11_ == null)
               {
                  _loc11_ = 0;
               }
               if(_loc6_ != null)
               {
                  _loc12_ = new ArrayBufferView(_loc6_,1);
               }
               else if(_loc8_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,1);
                  _loc13_.byteOffset = 0;
                  _loc13_.length = int(_loc8_.length);
                  _loc13_.byteLength = _loc13_.length * _loc13_.bytesPerElement;
                  _loc13_.buffer = Bytes.alloc(_loc13_.byteLength);
                  _loc13_.copyFromArray(_loc8_);
                  _loc12_ = _loc13_;
               }
               else if(_loc9_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,1);
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
                  _loc13_ = new ArrayBufferView(0,1);
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
                     throw Exception.thrown("Invalid constructor arguments for Int8Array");
                  }
                  _loc13_ = new ArrayBufferView(0,1);
                  _loc16_ = _loc11_;
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
                  if(_loc3_ == null)
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
                     _loc19_ = _loc3_ * _loc13_.bytesPerElement;
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
               _loc5_ = _loc12_;
               break;
            case 2:
               _loc6_ = null;
               _loc7_ = buffer;
               _loc8_ = null;
               _loc9_ = null;
               _loc10_ = null;
               _loc11_ = _loc4_;
               if(_loc11_ == null)
               {
                  _loc11_ = 0;
               }
               if(_loc6_ != null)
               {
                  _loc12_ = new ArrayBufferView(_loc6_,2);
               }
               else if(_loc8_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,2);
                  _loc13_.byteOffset = 0;
                  _loc13_.length = int(_loc8_.length);
                  _loc13_.byteLength = _loc13_.length * _loc13_.bytesPerElement;
                  _loc13_.buffer = Bytes.alloc(_loc13_.byteLength);
                  _loc13_.copyFromArray(_loc8_);
                  _loc12_ = _loc13_;
               }
               else if(_loc9_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,2);
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
                  _loc13_ = new ArrayBufferView(0,2);
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
                     throw Exception.thrown("Invalid constructor arguments for Int16Array");
                  }
                  _loc13_ = new ArrayBufferView(0,2);
                  _loc16_ = _loc11_;
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
                  if(_loc3_ == null)
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
                     _loc19_ = _loc3_ * _loc13_.bytesPerElement;
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
               _loc5_ = _loc12_;
               break;
            case 3:
               _loc6_ = null;
               _loc7_ = buffer;
               _loc8_ = null;
               _loc9_ = null;
               _loc10_ = null;
               _loc11_ = _loc4_;
               if(_loc11_ == null)
               {
                  _loc11_ = 0;
               }
               if(_loc6_ != null)
               {
                  _loc12_ = new ArrayBufferView(_loc6_,3);
               }
               else if(_loc8_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,3);
                  _loc13_.byteOffset = 0;
                  _loc13_.length = int(_loc8_.length);
                  _loc13_.byteLength = _loc13_.length * _loc13_.bytesPerElement;
                  _loc13_.buffer = Bytes.alloc(_loc13_.byteLength);
                  _loc13_.copyFromArray(_loc8_);
                  _loc12_ = _loc13_;
               }
               else if(_loc9_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,3);
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
                  _loc13_ = new ArrayBufferView(0,3);
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
                     throw Exception.thrown("Invalid constructor arguments for Int32Array");
                  }
                  _loc13_ = new ArrayBufferView(0,3);
                  _loc16_ = _loc11_;
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
                  if(_loc3_ == null)
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
                     _loc19_ = _loc3_ * _loc13_.bytesPerElement;
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
               _loc5_ = _loc12_;
               break;
            case 4:
               _loc6_ = null;
               _loc7_ = buffer;
               _loc8_ = null;
               _loc9_ = null;
               _loc10_ = null;
               _loc11_ = _loc4_;
               if(_loc11_ == null)
               {
                  _loc11_ = 0;
               }
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
                  _loc16_ = _loc11_;
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
                  if(_loc3_ == null)
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
                     _loc19_ = _loc3_ * _loc13_.bytesPerElement;
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
               _loc5_ = _loc12_;
               break;
            case 5:
               _loc6_ = null;
               _loc7_ = buffer;
               _loc8_ = null;
               _loc9_ = null;
               _loc10_ = null;
               _loc11_ = _loc4_;
               if(_loc11_ == null)
               {
                  _loc11_ = 0;
               }
               if(_loc6_ != null)
               {
                  _loc12_ = new ArrayBufferView(_loc6_,5);
               }
               else if(_loc8_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,5);
                  _loc13_.byteOffset = 0;
                  _loc13_.length = int(_loc8_.length);
                  _loc13_.byteLength = _loc13_.length * _loc13_.bytesPerElement;
                  _loc13_.buffer = Bytes.alloc(_loc13_.byteLength);
                  _loc13_.copyFromArray(_loc8_);
                  _loc12_ = _loc13_;
               }
               else if(_loc9_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,5);
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
                  _loc13_ = new ArrayBufferView(0,5);
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
                     throw Exception.thrown("Invalid constructor arguments for UInt8ClampedArray");
                  }
                  _loc13_ = new ArrayBufferView(0,5);
                  _loc16_ = _loc11_;
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
                  if(_loc3_ == null)
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
                     _loc19_ = _loc3_ * _loc13_.bytesPerElement;
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
               _loc5_ = _loc12_;
               break;
            case 6:
               _loc6_ = null;
               _loc7_ = buffer;
               _loc8_ = null;
               _loc9_ = null;
               _loc10_ = null;
               _loc11_ = _loc4_;
               if(_loc11_ == null)
               {
                  _loc11_ = 0;
               }
               if(_loc6_ != null)
               {
                  _loc12_ = new ArrayBufferView(_loc6_,6);
               }
               else if(_loc8_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,6);
                  _loc13_.byteOffset = 0;
                  _loc13_.length = int(_loc8_.length);
                  _loc13_.byteLength = _loc13_.length * _loc13_.bytesPerElement;
                  _loc13_.buffer = Bytes.alloc(_loc13_.byteLength);
                  _loc13_.copyFromArray(_loc8_);
                  _loc12_ = _loc13_;
               }
               else if(_loc9_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,6);
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
                  _loc13_ = new ArrayBufferView(0,6);
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
                     throw Exception.thrown("Invalid constructor arguments for UInt16Array");
                  }
                  _loc13_ = new ArrayBufferView(0,6);
                  _loc16_ = _loc11_;
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
                  if(_loc3_ == null)
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
                     _loc19_ = _loc3_ * _loc13_.bytesPerElement;
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
               _loc5_ = _loc12_;
               break;
            case 7:
               _loc6_ = null;
               _loc7_ = buffer;
               _loc8_ = null;
               _loc9_ = null;
               _loc10_ = null;
               _loc11_ = _loc4_;
               if(_loc11_ == null)
               {
                  _loc11_ = 0;
               }
               if(_loc6_ != null)
               {
                  _loc12_ = new ArrayBufferView(_loc6_,7);
               }
               else if(_loc8_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,7);
                  _loc13_.byteOffset = 0;
                  _loc13_.length = int(_loc8_.length);
                  _loc13_.byteLength = _loc13_.length * _loc13_.bytesPerElement;
                  _loc13_.buffer = Bytes.alloc(_loc13_.byteLength);
                  _loc13_.copyFromArray(_loc8_);
                  _loc12_ = _loc13_;
               }
               else if(_loc9_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,7);
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
                  _loc13_ = new ArrayBufferView(0,7);
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
                     throw Exception.thrown("Invalid constructor arguments for UInt32Array");
                  }
                  _loc13_ = new ArrayBufferView(0,7);
                  _loc16_ = _loc11_;
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
                  if(_loc3_ == null)
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
                     _loc19_ = _loc3_ * _loc13_.bytesPerElement;
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
               _loc5_ = _loc12_;
               break;
            case 8:
               _loc6_ = null;
               _loc7_ = buffer;
               _loc8_ = null;
               _loc22_ = null;
               _loc10_ = null;
               _loc11_ = _loc4_;
               if(_loc11_ == null)
               {
                  _loc11_ = 0;
               }
               if(_loc6_ != null)
               {
                  _loc12_ = new ArrayBufferView(_loc6_,8);
               }
               else if(_loc8_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,8);
                  _loc13_.byteOffset = 0;
                  _loc13_.length = int(_loc8_.length);
                  _loc13_.byteLength = _loc13_.length * _loc13_.bytesPerElement;
                  _loc13_.buffer = Bytes.alloc(_loc13_.byteLength);
                  _loc13_.copyFromArray(_loc8_);
                  _loc12_ = _loc13_;
               }
               else if(_loc22_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,8);
                  _loc14_ = _loc22_.__array;
                  _loc13_.byteOffset = 0;
                  _loc13_.length = int(_loc14_.length);
                  _loc13_.byteLength = _loc13_.length * _loc13_.bytesPerElement;
                  _loc13_.buffer = Bytes.alloc(_loc13_.byteLength);
                  _loc13_.copyFromArray(_loc14_);
                  _loc12_ = _loc13_;
               }
               else if(_loc10_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,8);
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
                     throw Exception.thrown("Invalid constructor arguments for Float32Array");
                  }
                  _loc13_ = new ArrayBufferView(0,8);
                  _loc16_ = _loc11_;
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
                  if(_loc3_ == null)
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
                     _loc19_ = _loc3_ * _loc13_.bytesPerElement;
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
               _loc5_ = _loc12_;
               break;
            case 9:
               _loc6_ = null;
               _loc7_ = buffer;
               _loc8_ = null;
               _loc22_ = null;
               _loc10_ = null;
               _loc11_ = _loc4_;
               if(_loc11_ == null)
               {
                  _loc11_ = 0;
               }
               if(_loc6_ != null)
               {
                  _loc12_ = new ArrayBufferView(_loc6_,9);
               }
               else if(_loc8_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,9);
                  _loc13_.byteOffset = 0;
                  _loc13_.length = int(_loc8_.length);
                  _loc13_.byteLength = _loc13_.length * _loc13_.bytesPerElement;
                  _loc13_.buffer = Bytes.alloc(_loc13_.byteLength);
                  _loc13_.copyFromArray(_loc8_);
                  _loc12_ = _loc13_;
               }
               else if(_loc22_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,9);
                  _loc14_ = _loc22_.__array;
                  _loc13_.byteOffset = 0;
                  _loc13_.length = int(_loc14_.length);
                  _loc13_.byteLength = _loc13_.length * _loc13_.bytesPerElement;
                  _loc13_.buffer = Bytes.alloc(_loc13_.byteLength);
                  _loc13_.copyFromArray(_loc14_);
                  _loc12_ = _loc13_;
               }
               else if(_loc10_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,9);
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
                     throw Exception.thrown("Invalid constructor arguments for Float64Array");
                  }
                  _loc13_ = new ArrayBufferView(0,9);
                  _loc16_ = _loc11_;
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
                  if(_loc3_ == null)
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
                     _loc19_ = _loc3_ * _loc13_.bytesPerElement;
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
               _loc5_ = _loc12_;
         }
         return _loc5_;
      }
      
      public function subarray_lime_utils_Float64Array(param1:int, param2:Object = undefined) : ArrayBufferView
      {
         var _loc5_:* = null as ArrayBufferView;
         var _loc6_:* = null as Object;
         var _loc7_:* = null as Bytes;
         var _loc8_:* = null as Array;
         var _loc9_:* = null as Vector.<int>;
         var _loc10_:* = null as ArrayBufferView;
         var _loc11_:* = null as Object;
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
         var _loc22_:* = null as Vector.<Number>;
         if(param2 == null)
         {
            param2 = length;
         }
         var _loc3_:int = param2 - param1;
         if(_loc3_ < 0)
         {
            _loc3_ = 0;
         }
         if(_loc3_ > length)
         {
            _loc3_ = length;
         }
         var _loc4_:int = param1 * bytesPerElement + byteOffset;
         switch(type)
         {
            case 0:
               throw Exception.thrown("subarray on a blank ArrayBufferView");
            case 1:
               _loc6_ = null;
               _loc7_ = buffer;
               _loc8_ = null;
               _loc9_ = null;
               _loc10_ = null;
               _loc11_ = _loc4_;
               if(_loc11_ == null)
               {
                  _loc11_ = 0;
               }
               if(_loc6_ != null)
               {
                  _loc12_ = new ArrayBufferView(_loc6_,1);
               }
               else if(_loc8_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,1);
                  _loc13_.byteOffset = 0;
                  _loc13_.length = int(_loc8_.length);
                  _loc13_.byteLength = _loc13_.length * _loc13_.bytesPerElement;
                  _loc13_.buffer = Bytes.alloc(_loc13_.byteLength);
                  _loc13_.copyFromArray(_loc8_);
                  _loc12_ = _loc13_;
               }
               else if(_loc9_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,1);
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
                  _loc13_ = new ArrayBufferView(0,1);
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
                     throw Exception.thrown("Invalid constructor arguments for Int8Array");
                  }
                  _loc13_ = new ArrayBufferView(0,1);
                  _loc16_ = _loc11_;
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
                  if(_loc3_ == null)
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
                     _loc19_ = _loc3_ * _loc13_.bytesPerElement;
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
               _loc5_ = _loc12_;
               break;
            case 2:
               _loc6_ = null;
               _loc7_ = buffer;
               _loc8_ = null;
               _loc9_ = null;
               _loc10_ = null;
               _loc11_ = _loc4_;
               if(_loc11_ == null)
               {
                  _loc11_ = 0;
               }
               if(_loc6_ != null)
               {
                  _loc12_ = new ArrayBufferView(_loc6_,2);
               }
               else if(_loc8_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,2);
                  _loc13_.byteOffset = 0;
                  _loc13_.length = int(_loc8_.length);
                  _loc13_.byteLength = _loc13_.length * _loc13_.bytesPerElement;
                  _loc13_.buffer = Bytes.alloc(_loc13_.byteLength);
                  _loc13_.copyFromArray(_loc8_);
                  _loc12_ = _loc13_;
               }
               else if(_loc9_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,2);
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
                  _loc13_ = new ArrayBufferView(0,2);
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
                     throw Exception.thrown("Invalid constructor arguments for Int16Array");
                  }
                  _loc13_ = new ArrayBufferView(0,2);
                  _loc16_ = _loc11_;
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
                  if(_loc3_ == null)
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
                     _loc19_ = _loc3_ * _loc13_.bytesPerElement;
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
               _loc5_ = _loc12_;
               break;
            case 3:
               _loc6_ = null;
               _loc7_ = buffer;
               _loc8_ = null;
               _loc9_ = null;
               _loc10_ = null;
               _loc11_ = _loc4_;
               if(_loc11_ == null)
               {
                  _loc11_ = 0;
               }
               if(_loc6_ != null)
               {
                  _loc12_ = new ArrayBufferView(_loc6_,3);
               }
               else if(_loc8_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,3);
                  _loc13_.byteOffset = 0;
                  _loc13_.length = int(_loc8_.length);
                  _loc13_.byteLength = _loc13_.length * _loc13_.bytesPerElement;
                  _loc13_.buffer = Bytes.alloc(_loc13_.byteLength);
                  _loc13_.copyFromArray(_loc8_);
                  _loc12_ = _loc13_;
               }
               else if(_loc9_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,3);
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
                  _loc13_ = new ArrayBufferView(0,3);
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
                     throw Exception.thrown("Invalid constructor arguments for Int32Array");
                  }
                  _loc13_ = new ArrayBufferView(0,3);
                  _loc16_ = _loc11_;
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
                  if(_loc3_ == null)
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
                     _loc19_ = _loc3_ * _loc13_.bytesPerElement;
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
               _loc5_ = _loc12_;
               break;
            case 4:
               _loc6_ = null;
               _loc7_ = buffer;
               _loc8_ = null;
               _loc9_ = null;
               _loc10_ = null;
               _loc11_ = _loc4_;
               if(_loc11_ == null)
               {
                  _loc11_ = 0;
               }
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
                  _loc16_ = _loc11_;
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
                  if(_loc3_ == null)
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
                     _loc19_ = _loc3_ * _loc13_.bytesPerElement;
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
               _loc5_ = _loc12_;
               break;
            case 5:
               _loc6_ = null;
               _loc7_ = buffer;
               _loc8_ = null;
               _loc9_ = null;
               _loc10_ = null;
               _loc11_ = _loc4_;
               if(_loc11_ == null)
               {
                  _loc11_ = 0;
               }
               if(_loc6_ != null)
               {
                  _loc12_ = new ArrayBufferView(_loc6_,5);
               }
               else if(_loc8_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,5);
                  _loc13_.byteOffset = 0;
                  _loc13_.length = int(_loc8_.length);
                  _loc13_.byteLength = _loc13_.length * _loc13_.bytesPerElement;
                  _loc13_.buffer = Bytes.alloc(_loc13_.byteLength);
                  _loc13_.copyFromArray(_loc8_);
                  _loc12_ = _loc13_;
               }
               else if(_loc9_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,5);
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
                  _loc13_ = new ArrayBufferView(0,5);
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
                     throw Exception.thrown("Invalid constructor arguments for UInt8ClampedArray");
                  }
                  _loc13_ = new ArrayBufferView(0,5);
                  _loc16_ = _loc11_;
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
                  if(_loc3_ == null)
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
                     _loc19_ = _loc3_ * _loc13_.bytesPerElement;
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
               _loc5_ = _loc12_;
               break;
            case 6:
               _loc6_ = null;
               _loc7_ = buffer;
               _loc8_ = null;
               _loc9_ = null;
               _loc10_ = null;
               _loc11_ = _loc4_;
               if(_loc11_ == null)
               {
                  _loc11_ = 0;
               }
               if(_loc6_ != null)
               {
                  _loc12_ = new ArrayBufferView(_loc6_,6);
               }
               else if(_loc8_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,6);
                  _loc13_.byteOffset = 0;
                  _loc13_.length = int(_loc8_.length);
                  _loc13_.byteLength = _loc13_.length * _loc13_.bytesPerElement;
                  _loc13_.buffer = Bytes.alloc(_loc13_.byteLength);
                  _loc13_.copyFromArray(_loc8_);
                  _loc12_ = _loc13_;
               }
               else if(_loc9_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,6);
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
                  _loc13_ = new ArrayBufferView(0,6);
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
                     throw Exception.thrown("Invalid constructor arguments for UInt16Array");
                  }
                  _loc13_ = new ArrayBufferView(0,6);
                  _loc16_ = _loc11_;
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
                  if(_loc3_ == null)
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
                     _loc19_ = _loc3_ * _loc13_.bytesPerElement;
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
               _loc5_ = _loc12_;
               break;
            case 7:
               _loc6_ = null;
               _loc7_ = buffer;
               _loc8_ = null;
               _loc9_ = null;
               _loc10_ = null;
               _loc11_ = _loc4_;
               if(_loc11_ == null)
               {
                  _loc11_ = 0;
               }
               if(_loc6_ != null)
               {
                  _loc12_ = new ArrayBufferView(_loc6_,7);
               }
               else if(_loc8_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,7);
                  _loc13_.byteOffset = 0;
                  _loc13_.length = int(_loc8_.length);
                  _loc13_.byteLength = _loc13_.length * _loc13_.bytesPerElement;
                  _loc13_.buffer = Bytes.alloc(_loc13_.byteLength);
                  _loc13_.copyFromArray(_loc8_);
                  _loc12_ = _loc13_;
               }
               else if(_loc9_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,7);
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
                  _loc13_ = new ArrayBufferView(0,7);
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
                     throw Exception.thrown("Invalid constructor arguments for UInt32Array");
                  }
                  _loc13_ = new ArrayBufferView(0,7);
                  _loc16_ = _loc11_;
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
                  if(_loc3_ == null)
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
                     _loc19_ = _loc3_ * _loc13_.bytesPerElement;
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
               _loc5_ = _loc12_;
               break;
            case 8:
               _loc6_ = null;
               _loc7_ = buffer;
               _loc8_ = null;
               _loc22_ = null;
               _loc10_ = null;
               _loc11_ = _loc4_;
               if(_loc11_ == null)
               {
                  _loc11_ = 0;
               }
               if(_loc6_ != null)
               {
                  _loc12_ = new ArrayBufferView(_loc6_,8);
               }
               else if(_loc8_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,8);
                  _loc13_.byteOffset = 0;
                  _loc13_.length = int(_loc8_.length);
                  _loc13_.byteLength = _loc13_.length * _loc13_.bytesPerElement;
                  _loc13_.buffer = Bytes.alloc(_loc13_.byteLength);
                  _loc13_.copyFromArray(_loc8_);
                  _loc12_ = _loc13_;
               }
               else if(_loc22_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,8);
                  _loc14_ = _loc22_.__array;
                  _loc13_.byteOffset = 0;
                  _loc13_.length = int(_loc14_.length);
                  _loc13_.byteLength = _loc13_.length * _loc13_.bytesPerElement;
                  _loc13_.buffer = Bytes.alloc(_loc13_.byteLength);
                  _loc13_.copyFromArray(_loc14_);
                  _loc12_ = _loc13_;
               }
               else if(_loc10_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,8);
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
                     throw Exception.thrown("Invalid constructor arguments for Float32Array");
                  }
                  _loc13_ = new ArrayBufferView(0,8);
                  _loc16_ = _loc11_;
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
                  if(_loc3_ == null)
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
                     _loc19_ = _loc3_ * _loc13_.bytesPerElement;
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
               _loc5_ = _loc12_;
               break;
            case 9:
               _loc6_ = null;
               _loc7_ = buffer;
               _loc8_ = null;
               _loc22_ = null;
               _loc10_ = null;
               _loc11_ = _loc4_;
               if(_loc11_ == null)
               {
                  _loc11_ = 0;
               }
               if(_loc6_ != null)
               {
                  _loc12_ = new ArrayBufferView(_loc6_,9);
               }
               else if(_loc8_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,9);
                  _loc13_.byteOffset = 0;
                  _loc13_.length = int(_loc8_.length);
                  _loc13_.byteLength = _loc13_.length * _loc13_.bytesPerElement;
                  _loc13_.buffer = Bytes.alloc(_loc13_.byteLength);
                  _loc13_.copyFromArray(_loc8_);
                  _loc12_ = _loc13_;
               }
               else if(_loc22_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,9);
                  _loc14_ = _loc22_.__array;
                  _loc13_.byteOffset = 0;
                  _loc13_.length = int(_loc14_.length);
                  _loc13_.byteLength = _loc13_.length * _loc13_.bytesPerElement;
                  _loc13_.buffer = Bytes.alloc(_loc13_.byteLength);
                  _loc13_.copyFromArray(_loc14_);
                  _loc12_ = _loc13_;
               }
               else if(_loc10_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,9);
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
                     throw Exception.thrown("Invalid constructor arguments for Float64Array");
                  }
                  _loc13_ = new ArrayBufferView(0,9);
                  _loc16_ = _loc11_;
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
                  if(_loc3_ == null)
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
                     _loc19_ = _loc3_ * _loc13_.bytesPerElement;
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
               _loc5_ = _loc12_;
         }
         return _loc5_;
      }
      
      public function subarray_lime_utils_Float32Array(param1:int, param2:Object = undefined) : ArrayBufferView
      {
         var _loc5_:* = null as ArrayBufferView;
         var _loc6_:* = null as Object;
         var _loc7_:* = null as Bytes;
         var _loc8_:* = null as Array;
         var _loc9_:* = null as Vector.<int>;
         var _loc10_:* = null as ArrayBufferView;
         var _loc11_:* = null as Object;
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
         var _loc22_:* = null as Vector.<Number>;
         if(param2 == null)
         {
            param2 = length;
         }
         var _loc3_:int = param2 - param1;
         if(_loc3_ < 0)
         {
            _loc3_ = 0;
         }
         if(_loc3_ > length)
         {
            _loc3_ = length;
         }
         var _loc4_:int = param1 * bytesPerElement + byteOffset;
         switch(type)
         {
            case 0:
               throw Exception.thrown("subarray on a blank ArrayBufferView");
            case 1:
               _loc6_ = null;
               _loc7_ = buffer;
               _loc8_ = null;
               _loc9_ = null;
               _loc10_ = null;
               _loc11_ = _loc4_;
               if(_loc11_ == null)
               {
                  _loc11_ = 0;
               }
               if(_loc6_ != null)
               {
                  _loc12_ = new ArrayBufferView(_loc6_,1);
               }
               else if(_loc8_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,1);
                  _loc13_.byteOffset = 0;
                  _loc13_.length = int(_loc8_.length);
                  _loc13_.byteLength = _loc13_.length * _loc13_.bytesPerElement;
                  _loc13_.buffer = Bytes.alloc(_loc13_.byteLength);
                  _loc13_.copyFromArray(_loc8_);
                  _loc12_ = _loc13_;
               }
               else if(_loc9_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,1);
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
                  _loc13_ = new ArrayBufferView(0,1);
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
                     throw Exception.thrown("Invalid constructor arguments for Int8Array");
                  }
                  _loc13_ = new ArrayBufferView(0,1);
                  _loc16_ = _loc11_;
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
                  if(_loc3_ == null)
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
                     _loc19_ = _loc3_ * _loc13_.bytesPerElement;
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
               _loc5_ = _loc12_;
               break;
            case 2:
               _loc6_ = null;
               _loc7_ = buffer;
               _loc8_ = null;
               _loc9_ = null;
               _loc10_ = null;
               _loc11_ = _loc4_;
               if(_loc11_ == null)
               {
                  _loc11_ = 0;
               }
               if(_loc6_ != null)
               {
                  _loc12_ = new ArrayBufferView(_loc6_,2);
               }
               else if(_loc8_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,2);
                  _loc13_.byteOffset = 0;
                  _loc13_.length = int(_loc8_.length);
                  _loc13_.byteLength = _loc13_.length * _loc13_.bytesPerElement;
                  _loc13_.buffer = Bytes.alloc(_loc13_.byteLength);
                  _loc13_.copyFromArray(_loc8_);
                  _loc12_ = _loc13_;
               }
               else if(_loc9_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,2);
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
                  _loc13_ = new ArrayBufferView(0,2);
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
                     throw Exception.thrown("Invalid constructor arguments for Int16Array");
                  }
                  _loc13_ = new ArrayBufferView(0,2);
                  _loc16_ = _loc11_;
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
                  if(_loc3_ == null)
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
                     _loc19_ = _loc3_ * _loc13_.bytesPerElement;
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
               _loc5_ = _loc12_;
               break;
            case 3:
               _loc6_ = null;
               _loc7_ = buffer;
               _loc8_ = null;
               _loc9_ = null;
               _loc10_ = null;
               _loc11_ = _loc4_;
               if(_loc11_ == null)
               {
                  _loc11_ = 0;
               }
               if(_loc6_ != null)
               {
                  _loc12_ = new ArrayBufferView(_loc6_,3);
               }
               else if(_loc8_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,3);
                  _loc13_.byteOffset = 0;
                  _loc13_.length = int(_loc8_.length);
                  _loc13_.byteLength = _loc13_.length * _loc13_.bytesPerElement;
                  _loc13_.buffer = Bytes.alloc(_loc13_.byteLength);
                  _loc13_.copyFromArray(_loc8_);
                  _loc12_ = _loc13_;
               }
               else if(_loc9_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,3);
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
                  _loc13_ = new ArrayBufferView(0,3);
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
                     throw Exception.thrown("Invalid constructor arguments for Int32Array");
                  }
                  _loc13_ = new ArrayBufferView(0,3);
                  _loc16_ = _loc11_;
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
                  if(_loc3_ == null)
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
                     _loc19_ = _loc3_ * _loc13_.bytesPerElement;
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
               _loc5_ = _loc12_;
               break;
            case 4:
               _loc6_ = null;
               _loc7_ = buffer;
               _loc8_ = null;
               _loc9_ = null;
               _loc10_ = null;
               _loc11_ = _loc4_;
               if(_loc11_ == null)
               {
                  _loc11_ = 0;
               }
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
                  _loc16_ = _loc11_;
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
                  if(_loc3_ == null)
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
                     _loc19_ = _loc3_ * _loc13_.bytesPerElement;
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
               _loc5_ = _loc12_;
               break;
            case 5:
               _loc6_ = null;
               _loc7_ = buffer;
               _loc8_ = null;
               _loc9_ = null;
               _loc10_ = null;
               _loc11_ = _loc4_;
               if(_loc11_ == null)
               {
                  _loc11_ = 0;
               }
               if(_loc6_ != null)
               {
                  _loc12_ = new ArrayBufferView(_loc6_,5);
               }
               else if(_loc8_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,5);
                  _loc13_.byteOffset = 0;
                  _loc13_.length = int(_loc8_.length);
                  _loc13_.byteLength = _loc13_.length * _loc13_.bytesPerElement;
                  _loc13_.buffer = Bytes.alloc(_loc13_.byteLength);
                  _loc13_.copyFromArray(_loc8_);
                  _loc12_ = _loc13_;
               }
               else if(_loc9_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,5);
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
                  _loc13_ = new ArrayBufferView(0,5);
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
                     throw Exception.thrown("Invalid constructor arguments for UInt8ClampedArray");
                  }
                  _loc13_ = new ArrayBufferView(0,5);
                  _loc16_ = _loc11_;
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
                  if(_loc3_ == null)
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
                     _loc19_ = _loc3_ * _loc13_.bytesPerElement;
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
               _loc5_ = _loc12_;
               break;
            case 6:
               _loc6_ = null;
               _loc7_ = buffer;
               _loc8_ = null;
               _loc9_ = null;
               _loc10_ = null;
               _loc11_ = _loc4_;
               if(_loc11_ == null)
               {
                  _loc11_ = 0;
               }
               if(_loc6_ != null)
               {
                  _loc12_ = new ArrayBufferView(_loc6_,6);
               }
               else if(_loc8_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,6);
                  _loc13_.byteOffset = 0;
                  _loc13_.length = int(_loc8_.length);
                  _loc13_.byteLength = _loc13_.length * _loc13_.bytesPerElement;
                  _loc13_.buffer = Bytes.alloc(_loc13_.byteLength);
                  _loc13_.copyFromArray(_loc8_);
                  _loc12_ = _loc13_;
               }
               else if(_loc9_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,6);
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
                  _loc13_ = new ArrayBufferView(0,6);
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
                     throw Exception.thrown("Invalid constructor arguments for UInt16Array");
                  }
                  _loc13_ = new ArrayBufferView(0,6);
                  _loc16_ = _loc11_;
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
                  if(_loc3_ == null)
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
                     _loc19_ = _loc3_ * _loc13_.bytesPerElement;
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
               _loc5_ = _loc12_;
               break;
            case 7:
               _loc6_ = null;
               _loc7_ = buffer;
               _loc8_ = null;
               _loc9_ = null;
               _loc10_ = null;
               _loc11_ = _loc4_;
               if(_loc11_ == null)
               {
                  _loc11_ = 0;
               }
               if(_loc6_ != null)
               {
                  _loc12_ = new ArrayBufferView(_loc6_,7);
               }
               else if(_loc8_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,7);
                  _loc13_.byteOffset = 0;
                  _loc13_.length = int(_loc8_.length);
                  _loc13_.byteLength = _loc13_.length * _loc13_.bytesPerElement;
                  _loc13_.buffer = Bytes.alloc(_loc13_.byteLength);
                  _loc13_.copyFromArray(_loc8_);
                  _loc12_ = _loc13_;
               }
               else if(_loc9_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,7);
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
                  _loc13_ = new ArrayBufferView(0,7);
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
                     throw Exception.thrown("Invalid constructor arguments for UInt32Array");
                  }
                  _loc13_ = new ArrayBufferView(0,7);
                  _loc16_ = _loc11_;
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
                  if(_loc3_ == null)
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
                     _loc19_ = _loc3_ * _loc13_.bytesPerElement;
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
               _loc5_ = _loc12_;
               break;
            case 8:
               _loc6_ = null;
               _loc7_ = buffer;
               _loc8_ = null;
               _loc22_ = null;
               _loc10_ = null;
               _loc11_ = _loc4_;
               if(_loc11_ == null)
               {
                  _loc11_ = 0;
               }
               if(_loc6_ != null)
               {
                  _loc12_ = new ArrayBufferView(_loc6_,8);
               }
               else if(_loc8_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,8);
                  _loc13_.byteOffset = 0;
                  _loc13_.length = int(_loc8_.length);
                  _loc13_.byteLength = _loc13_.length * _loc13_.bytesPerElement;
                  _loc13_.buffer = Bytes.alloc(_loc13_.byteLength);
                  _loc13_.copyFromArray(_loc8_);
                  _loc12_ = _loc13_;
               }
               else if(_loc22_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,8);
                  _loc14_ = _loc22_.__array;
                  _loc13_.byteOffset = 0;
                  _loc13_.length = int(_loc14_.length);
                  _loc13_.byteLength = _loc13_.length * _loc13_.bytesPerElement;
                  _loc13_.buffer = Bytes.alloc(_loc13_.byteLength);
                  _loc13_.copyFromArray(_loc14_);
                  _loc12_ = _loc13_;
               }
               else if(_loc10_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,8);
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
                     throw Exception.thrown("Invalid constructor arguments for Float32Array");
                  }
                  _loc13_ = new ArrayBufferView(0,8);
                  _loc16_ = _loc11_;
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
                  if(_loc3_ == null)
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
                     _loc19_ = _loc3_ * _loc13_.bytesPerElement;
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
               _loc5_ = _loc12_;
               break;
            case 9:
               _loc6_ = null;
               _loc7_ = buffer;
               _loc8_ = null;
               _loc22_ = null;
               _loc10_ = null;
               _loc11_ = _loc4_;
               if(_loc11_ == null)
               {
                  _loc11_ = 0;
               }
               if(_loc6_ != null)
               {
                  _loc12_ = new ArrayBufferView(_loc6_,9);
               }
               else if(_loc8_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,9);
                  _loc13_.byteOffset = 0;
                  _loc13_.length = int(_loc8_.length);
                  _loc13_.byteLength = _loc13_.length * _loc13_.bytesPerElement;
                  _loc13_.buffer = Bytes.alloc(_loc13_.byteLength);
                  _loc13_.copyFromArray(_loc8_);
                  _loc12_ = _loc13_;
               }
               else if(_loc22_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,9);
                  _loc14_ = _loc22_.__array;
                  _loc13_.byteOffset = 0;
                  _loc13_.length = int(_loc14_.length);
                  _loc13_.byteLength = _loc13_.length * _loc13_.bytesPerElement;
                  _loc13_.buffer = Bytes.alloc(_loc13_.byteLength);
                  _loc13_.copyFromArray(_loc14_);
                  _loc12_ = _loc13_;
               }
               else if(_loc10_ != null)
               {
                  _loc13_ = new ArrayBufferView(0,9);
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
                     throw Exception.thrown("Invalid constructor arguments for Float64Array");
                  }
                  _loc13_ = new ArrayBufferView(0,9);
                  _loc16_ = _loc11_;
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
                  if(_loc3_ == null)
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
                     _loc19_ = _loc3_ * _loc13_.bytesPerElement;
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
               _loc5_ = _loc12_;
         }
         return _loc5_;
      }
      
      public function set(param1:ArrayBufferView = undefined, param2:Array = undefined, param3:int = 0) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         if(param1 != null && param2 == null)
         {
            if(param3 + param1.length > length)
            {
               throw Exception.thrown(TAError.RangeError);
            }
            if(bytesPerElement == param1.bytesPerElement)
            {
               buffer.blit(param3 * bytesPerElement,param1.buffer,param1.byteOffset,param1.byteLength);
            }
            else
            {
               _loc4_ = 0;
               _loc5_ = param1.length;
               while(_loc4_ < _loc5_)
               {
                  _loc6_ = _loc4_++;
                  ArrayBufferView.transferElement(param1,_loc6_,this,param3 + _loc6_);
               }
            }
         }
         else
         {
            if(!(param2 != null && param1 == null))
            {
               throw Exception.thrown("Invalid .set call. either view, or array must be not-null.");
            }
            copyFromArray(param2,param3);
         }
      }
      
      public function initTypedArray(param1:ArrayBufferView) : ArrayBufferView
      {
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc2_:Bytes = param1.buffer;
         var _loc3_:int = param1.length;
         var _loc4_:int = param1.byteOffset;
         var _loc5_:int = param1.bytesPerElement;
         var _loc6_:int = bytesPerElement;
         if(param1.type == type)
         {
            _loc7_ = _loc2_.length;
            _loc8_ = _loc7_ - _loc4_;
            buffer = Bytes.alloc(_loc8_);
            buffer.blit(0,_loc2_,_loc4_,_loc8_);
            byteLength = bytesPerElement * _loc3_;
            byteOffset = 0;
            length = _loc3_;
            return this;
         }
         throw Exception.thrown("unimplemented");
      }
      
      public function initBuffer(param1:Bytes, param2:int = 0, param3:Object = undefined) : ArrayBufferView
      {
         var _loc7_:int = 0;
         if(param2 < 0)
         {
            throw Exception.thrown(TAError.RangeError);
         }
         if(int(param2 % bytesPerElement) != 0)
         {
            throw Exception.thrown(TAError.RangeError);
         }
         var _loc4_:int = param1.length;
         var _loc5_:int = bytesPerElement;
         var _loc6_:int = _loc4_;
         if(param3 == null)
         {
            _loc6_ = _loc4_ - param2;
            if(int(_loc4_ % bytesPerElement) != 0)
            {
               throw Exception.thrown(TAError.RangeError);
            }
            if(_loc6_ < 0)
            {
               throw Exception.thrown(TAError.RangeError);
            }
         }
         else
         {
            _loc6_ = param3 * bytesPerElement;
            _loc7_ = param2 + _loc6_;
            if(_loc7_ > _loc4_)
            {
               throw Exception.thrown(TAError.RangeError);
            }
         }
         buffer = param1;
         byteOffset = param2;
         byteLength = _loc6_;
         length = int(_loc6_ / bytesPerElement);
         return this;
      }
      
      public function initArray(param1:Array) : ArrayBufferView
      {
         byteOffset = 0;
         length = int(param1.length);
         byteLength = length * bytesPerElement;
         buffer = Bytes.alloc(byteLength);
         copyFromArray(param1);
         return this;
      }
      
      public function copyFromArray(param1:Array, param2:int = 0) : void
      {
         var _loc5_:int = 0;
         var _loc6_:* = null as Bytes;
         var _loc7_:int = 0;
         var _loc8_:* = null as Bytes;
         var _loc9_:uint = 0;
         var _loc3_:int = 0;
         var _loc4_:int = int(param1.length);
         if(param2 + _loc4_ > length)
         {
            throw Exception.thrown(TAError.RangeError);
         }
         switch(type)
         {
            case 0:
               throw Exception.thrown("copyFromArray on a base type ArrayBuffer");
            case 1:
               while(_loc3_ < _loc4_)
               {
                  _loc5_ = (param2 + _loc3_) * bytesPerElement;
                  _loc6_ = buffer;
                  _loc7_ = int(Number(param1[_loc3_]));
                  _loc6_.b[_loc5_] = _loc7_;
                  _loc3_++;
               }
               break;
            case 2:
               while(_loc3_ < _loc4_)
               {
                  _loc5_ = (param2 + _loc3_) * bytesPerElement;
                  ArrayBufferIO.setInt16(buffer,_loc5_,int(Number(param1[_loc3_])));
                  _loc3_++;
               }
               break;
            case 3:
               while(_loc3_ < _loc4_)
               {
                  _loc5_ = (param2 + _loc3_) * bytesPerElement;
                  _loc6_ = buffer;
                  _loc7_ = int(Number(param1[_loc3_]));
                  _loc8_ = _loc6_;
                  _loc8_.b[_loc5_] = _loc7_;
                  _loc8_.b[_loc5_ + 1] = _loc7_ >> 8;
                  _loc8_.b[_loc5_ + 2] = _loc7_ >> 16;
                  _loc8_.b[_loc5_ + 3] = _loc7_ >>> 24;
                  _loc3_++;
               }
               break;
            case 4:
               while(_loc3_ < _loc4_)
               {
                  _loc5_ = (param2 + _loc3_) * bytesPerElement;
                  _loc6_ = buffer;
                  _loc9_ = uint(int(Number(param1[_loc3_])));
                  _loc6_.b[_loc5_] = _loc9_;
                  _loc3_++;
               }
               break;
            case 5:
               while(_loc3_ < _loc4_)
               {
                  _loc5_ = (param2 + _loc3_) * bytesPerElement;
                  _loc6_ = buffer;
                  _loc7_ = int(uint(int(Number(param1[_loc3_]))));
                  if(_loc7_ > 255)
                  {
                     _loc7_ = 255;
                  }
                  _loc6_.b[_loc5_] = uint(_loc7_ < 0 ? 0 : _loc7_);
                  _loc3_++;
               }
               break;
            case 6:
               while(_loc3_ < _loc4_)
               {
                  _loc5_ = (param2 + _loc3_) * bytesPerElement;
                  ArrayBufferIO.setInt16(buffer,_loc5_,uint(int(Number(param1[_loc3_]))));
                  _loc3_++;
               }
               break;
            case 7:
               while(_loc3_ < _loc4_)
               {
                  _loc5_ = (param2 + _loc3_) * bytesPerElement;
                  _loc6_ = buffer;
                  _loc9_ = uint(int(Number(param1[_loc3_])));
                  _loc8_ = _loc6_;
                  _loc8_.b[_loc5_] = _loc9_;
                  _loc8_.b[_loc5_ + 1] = uint(_loc9_ >> 8);
                  _loc8_.b[_loc5_ + 2] = uint(_loc9_ >> 16);
                  _loc8_.b[_loc5_ + 3] = uint(_loc9_ >>> 24);
                  _loc3_++;
               }
               break;
            case 8:
               while(_loc3_ < _loc4_)
               {
                  _loc5_ = (param2 + _loc3_) * bytesPerElement;
                  _loc6_ = buffer;
                  _loc6_.b.position = _loc5_;
                  _loc6_.b.writeFloat(Number(param1[_loc3_]));
                  _loc3_++;
               }
               break;
            case 9:
               while(_loc3_ < _loc4_)
               {
                  _loc5_ = (param2 + _loc3_) * bytesPerElement;
                  _loc6_ = buffer;
                  _loc6_.b.position = _loc5_;
                  _loc6_.b.writeDouble(Number(param1[_loc3_]));
                  _loc3_++;
               }
         }
      }
      
      public function cloneBuffer(param1:Bytes, param2:int = 0) : void
      {
         var _loc3_:int = param1.length;
         var _loc4_:int = _loc3_ - param2;
         buffer = Bytes.alloc(_loc4_);
         buffer.blit(0,param1,param2,_loc4_);
      }
      
      public function bytesForType(param1:int) : int
      {
         switch(param1)
         {
            case 1:
               return 1;
            case 2:
               return 2;
            case 3:
               return 4;
            case 4:
               return 1;
            case 5:
               return 1;
            case 6:
               return 2;
            case 7:
               return 4;
            case 8:
               return 4;
            case 9:
               return 8;
            default:
               return 1;
         }
      }
   }
}

