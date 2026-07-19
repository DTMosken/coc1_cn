package lime.utils._Float64Array
{
   import haxe.Exception;
   import haxe.io.Bytes;
   import lime.utils.ArrayBufferView;
   import lime.utils.TAError;
   
   public final class Float64Array_Impl_
   {
      
      public static var BYTES_PER_ELEMENT:int = 8;
      
      public function Float64Array_Impl_()
      {
      }
      
      public static function _new(param1:Object = undefined, param2:Bytes = undefined, param3:Array = undefined, param4:Vector.<Number> = undefined, param5:ArrayBufferView = undefined, param6:Object = undefined, param7:Object = undefined) : ArrayBufferView
      {
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
         if(param6 == null)
         {
            param6 = 0;
         }
         if(param1 != null)
         {
            _loc8_ = new ArrayBufferView(param1,9);
         }
         else if(param3 != null)
         {
            _loc9_ = new ArrayBufferView(0,9);
            _loc9_.byteOffset = 0;
            _loc9_.length = int(param3.length);
            _loc9_.byteLength = _loc9_.length * _loc9_.bytesPerElement;
            _loc9_.buffer = Bytes.alloc(_loc9_.byteLength);
            _loc9_.copyFromArray(param3);
            _loc8_ = _loc9_;
         }
         else if(param4 != null)
         {
            _loc9_ = new ArrayBufferView(0,9);
            _loc10_ = param4.__array;
            _loc9_.byteOffset = 0;
            _loc9_.length = int(_loc10_.length);
            _loc9_.byteLength = _loc9_.length * _loc9_.bytesPerElement;
            _loc9_.buffer = Bytes.alloc(_loc9_.byteLength);
            _loc9_.copyFromArray(_loc10_);
            _loc8_ = _loc9_;
         }
         else if(param5 != null)
         {
            _loc9_ = new ArrayBufferView(0,9);
            _loc11_ = param5.buffer;
            _loc12_ = param5.length;
            _loc13_ = param5.byteOffset;
            _loc14_ = param5.bytesPerElement;
            _loc15_ = _loc9_.bytesPerElement;
            if(param5.type != _loc9_.type)
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
            if(param2 == null)
            {
               throw Exception.thrown("Invalid constructor arguments for Float64Array");
            }
            _loc9_ = new ArrayBufferView(0,9);
            _loc12_ = int(param6);
            if(_loc12_ < 0)
            {
               throw Exception.thrown(TAError.RangeError);
            }
            if(int(_loc12_ % _loc9_.bytesPerElement) != 0)
            {
               throw Exception.thrown(TAError.RangeError);
            }
            _loc13_ = param2.length;
            _loc14_ = _loc9_.bytesPerElement;
            _loc15_ = _loc13_;
            if(param7 == null)
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
               _loc15_ = param7 * _loc9_.bytesPerElement;
               _loc16_ = _loc12_ + _loc15_;
               if(_loc16_ > _loc13_)
               {
                  throw Exception.thrown(TAError.RangeError);
               }
            }
            _loc9_.buffer = param2;
            _loc9_.byteOffset = _loc12_;
            _loc9_.byteLength = _loc15_;
            _loc9_.length = int(_loc15_ / _loc9_.bytesPerElement);
            _loc8_ = _loc9_;
         }
         return _loc8_;
      }
      
      public static function subarray(param1:ArrayBufferView, param2:int, param3:Object = undefined) : ArrayBufferView
      {
         var _loc7_:* = null as ArrayBufferView;
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
         var _loc24_:* = null as Vector.<Number>;
         var _loc4_:Object = param3;
         if(_loc4_ == null)
         {
            _loc4_ = param1.length;
         }
         var _loc5_:int = _loc4_ - param2;
         if(_loc5_ < 0)
         {
            _loc5_ = 0;
         }
         if(_loc5_ > param1.length)
         {
            _loc5_ = param1.length;
         }
         var _loc6_:int = param2 * param1.bytesPerElement + param1.byteOffset;
         switch(param1.type)
         {
            case 0:
               throw Exception.thrown("subarray on a blank ArrayBufferView");
            case 1:
               _loc8_ = null;
               _loc9_ = param1.buffer;
               _loc10_ = null;
               _loc11_ = null;
               _loc12_ = null;
               _loc13_ = _loc6_;
               if(_loc13_ == null)
               {
                  _loc13_ = 0;
               }
               if(_loc8_ != null)
               {
                  _loc14_ = new ArrayBufferView(_loc8_,1);
               }
               else if(_loc10_ != null)
               {
                  _loc15_ = new ArrayBufferView(0,1);
                  _loc15_.byteOffset = 0;
                  _loc15_.length = int(_loc10_.length);
                  _loc15_.byteLength = _loc15_.length * _loc15_.bytesPerElement;
                  _loc15_.buffer = Bytes.alloc(_loc15_.byteLength);
                  _loc15_.copyFromArray(_loc10_);
                  _loc14_ = _loc15_;
               }
               else if(_loc11_ != null)
               {
                  _loc15_ = new ArrayBufferView(0,1);
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
                  _loc15_ = new ArrayBufferView(0,1);
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
                     throw Exception.thrown("Invalid constructor arguments for Int8Array");
                  }
                  _loc15_ = new ArrayBufferView(0,1);
                  _loc18_ = _loc13_;
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
                  if(_loc5_ == null)
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
                     _loc21_ = _loc5_ * _loc15_.bytesPerElement;
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
               _loc7_ = _loc14_;
               break;
            case 2:
               _loc8_ = null;
               _loc9_ = param1.buffer;
               _loc10_ = null;
               _loc11_ = null;
               _loc12_ = null;
               _loc13_ = _loc6_;
               if(_loc13_ == null)
               {
                  _loc13_ = 0;
               }
               if(_loc8_ != null)
               {
                  _loc14_ = new ArrayBufferView(_loc8_,2);
               }
               else if(_loc10_ != null)
               {
                  _loc15_ = new ArrayBufferView(0,2);
                  _loc15_.byteOffset = 0;
                  _loc15_.length = int(_loc10_.length);
                  _loc15_.byteLength = _loc15_.length * _loc15_.bytesPerElement;
                  _loc15_.buffer = Bytes.alloc(_loc15_.byteLength);
                  _loc15_.copyFromArray(_loc10_);
                  _loc14_ = _loc15_;
               }
               else if(_loc11_ != null)
               {
                  _loc15_ = new ArrayBufferView(0,2);
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
                  _loc15_ = new ArrayBufferView(0,2);
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
                     throw Exception.thrown("Invalid constructor arguments for Int16Array");
                  }
                  _loc15_ = new ArrayBufferView(0,2);
                  _loc18_ = _loc13_;
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
                  if(_loc5_ == null)
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
                     _loc21_ = _loc5_ * _loc15_.bytesPerElement;
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
               _loc7_ = _loc14_;
               break;
            case 3:
               _loc8_ = null;
               _loc9_ = param1.buffer;
               _loc10_ = null;
               _loc11_ = null;
               _loc12_ = null;
               _loc13_ = _loc6_;
               if(_loc13_ == null)
               {
                  _loc13_ = 0;
               }
               if(_loc8_ != null)
               {
                  _loc14_ = new ArrayBufferView(_loc8_,3);
               }
               else if(_loc10_ != null)
               {
                  _loc15_ = new ArrayBufferView(0,3);
                  _loc15_.byteOffset = 0;
                  _loc15_.length = int(_loc10_.length);
                  _loc15_.byteLength = _loc15_.length * _loc15_.bytesPerElement;
                  _loc15_.buffer = Bytes.alloc(_loc15_.byteLength);
                  _loc15_.copyFromArray(_loc10_);
                  _loc14_ = _loc15_;
               }
               else if(_loc11_ != null)
               {
                  _loc15_ = new ArrayBufferView(0,3);
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
                  _loc15_ = new ArrayBufferView(0,3);
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
                     throw Exception.thrown("Invalid constructor arguments for Int32Array");
                  }
                  _loc15_ = new ArrayBufferView(0,3);
                  _loc18_ = _loc13_;
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
                  if(_loc5_ == null)
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
                     _loc21_ = _loc5_ * _loc15_.bytesPerElement;
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
               _loc7_ = _loc14_;
               break;
            case 4:
               _loc8_ = null;
               _loc9_ = param1.buffer;
               _loc10_ = null;
               _loc11_ = null;
               _loc12_ = null;
               _loc13_ = _loc6_;
               if(_loc13_ == null)
               {
                  _loc13_ = 0;
               }
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
                  _loc18_ = _loc13_;
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
                  if(_loc5_ == null)
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
                     _loc21_ = _loc5_ * _loc15_.bytesPerElement;
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
               _loc7_ = _loc14_;
               break;
            case 5:
               _loc8_ = null;
               _loc9_ = param1.buffer;
               _loc10_ = null;
               _loc11_ = null;
               _loc12_ = null;
               _loc13_ = _loc6_;
               if(_loc13_ == null)
               {
                  _loc13_ = 0;
               }
               if(_loc8_ != null)
               {
                  _loc14_ = new ArrayBufferView(_loc8_,5);
               }
               else if(_loc10_ != null)
               {
                  _loc15_ = new ArrayBufferView(0,5);
                  _loc15_.byteOffset = 0;
                  _loc15_.length = int(_loc10_.length);
                  _loc15_.byteLength = _loc15_.length * _loc15_.bytesPerElement;
                  _loc15_.buffer = Bytes.alloc(_loc15_.byteLength);
                  _loc15_.copyFromArray(_loc10_);
                  _loc14_ = _loc15_;
               }
               else if(_loc11_ != null)
               {
                  _loc15_ = new ArrayBufferView(0,5);
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
                  _loc15_ = new ArrayBufferView(0,5);
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
                     throw Exception.thrown("Invalid constructor arguments for UInt8ClampedArray");
                  }
                  _loc15_ = new ArrayBufferView(0,5);
                  _loc18_ = _loc13_;
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
                  if(_loc5_ == null)
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
                     _loc21_ = _loc5_ * _loc15_.bytesPerElement;
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
               _loc7_ = _loc14_;
               break;
            case 6:
               _loc8_ = null;
               _loc9_ = param1.buffer;
               _loc10_ = null;
               _loc11_ = null;
               _loc12_ = null;
               _loc13_ = _loc6_;
               if(_loc13_ == null)
               {
                  _loc13_ = 0;
               }
               if(_loc8_ != null)
               {
                  _loc14_ = new ArrayBufferView(_loc8_,6);
               }
               else if(_loc10_ != null)
               {
                  _loc15_ = new ArrayBufferView(0,6);
                  _loc15_.byteOffset = 0;
                  _loc15_.length = int(_loc10_.length);
                  _loc15_.byteLength = _loc15_.length * _loc15_.bytesPerElement;
                  _loc15_.buffer = Bytes.alloc(_loc15_.byteLength);
                  _loc15_.copyFromArray(_loc10_);
                  _loc14_ = _loc15_;
               }
               else if(_loc11_ != null)
               {
                  _loc15_ = new ArrayBufferView(0,6);
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
                  _loc15_ = new ArrayBufferView(0,6);
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
                     throw Exception.thrown("Invalid constructor arguments for UInt16Array");
                  }
                  _loc15_ = new ArrayBufferView(0,6);
                  _loc18_ = _loc13_;
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
                  if(_loc5_ == null)
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
                     _loc21_ = _loc5_ * _loc15_.bytesPerElement;
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
               _loc7_ = _loc14_;
               break;
            case 7:
               _loc8_ = null;
               _loc9_ = param1.buffer;
               _loc10_ = null;
               _loc11_ = null;
               _loc12_ = null;
               _loc13_ = _loc6_;
               if(_loc13_ == null)
               {
                  _loc13_ = 0;
               }
               if(_loc8_ != null)
               {
                  _loc14_ = new ArrayBufferView(_loc8_,7);
               }
               else if(_loc10_ != null)
               {
                  _loc15_ = new ArrayBufferView(0,7);
                  _loc15_.byteOffset = 0;
                  _loc15_.length = int(_loc10_.length);
                  _loc15_.byteLength = _loc15_.length * _loc15_.bytesPerElement;
                  _loc15_.buffer = Bytes.alloc(_loc15_.byteLength);
                  _loc15_.copyFromArray(_loc10_);
                  _loc14_ = _loc15_;
               }
               else if(_loc11_ != null)
               {
                  _loc15_ = new ArrayBufferView(0,7);
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
                  _loc15_ = new ArrayBufferView(0,7);
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
                     throw Exception.thrown("Invalid constructor arguments for UInt32Array");
                  }
                  _loc15_ = new ArrayBufferView(0,7);
                  _loc18_ = _loc13_;
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
                  if(_loc5_ == null)
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
                     _loc21_ = _loc5_ * _loc15_.bytesPerElement;
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
               _loc7_ = _loc14_;
               break;
            case 8:
               _loc8_ = null;
               _loc9_ = param1.buffer;
               _loc10_ = null;
               _loc24_ = null;
               _loc12_ = null;
               _loc13_ = _loc6_;
               if(_loc13_ == null)
               {
                  _loc13_ = 0;
               }
               if(_loc8_ != null)
               {
                  _loc14_ = new ArrayBufferView(_loc8_,8);
               }
               else if(_loc10_ != null)
               {
                  _loc15_ = new ArrayBufferView(0,8);
                  _loc15_.byteOffset = 0;
                  _loc15_.length = int(_loc10_.length);
                  _loc15_.byteLength = _loc15_.length * _loc15_.bytesPerElement;
                  _loc15_.buffer = Bytes.alloc(_loc15_.byteLength);
                  _loc15_.copyFromArray(_loc10_);
                  _loc14_ = _loc15_;
               }
               else if(_loc24_ != null)
               {
                  _loc15_ = new ArrayBufferView(0,8);
                  _loc16_ = _loc24_.__array;
                  _loc15_.byteOffset = 0;
                  _loc15_.length = int(_loc16_.length);
                  _loc15_.byteLength = _loc15_.length * _loc15_.bytesPerElement;
                  _loc15_.buffer = Bytes.alloc(_loc15_.byteLength);
                  _loc15_.copyFromArray(_loc16_);
                  _loc14_ = _loc15_;
               }
               else if(_loc12_ != null)
               {
                  _loc15_ = new ArrayBufferView(0,8);
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
                     throw Exception.thrown("Invalid constructor arguments for Float32Array");
                  }
                  _loc15_ = new ArrayBufferView(0,8);
                  _loc18_ = _loc13_;
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
                  if(_loc5_ == null)
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
                     _loc21_ = _loc5_ * _loc15_.bytesPerElement;
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
               _loc7_ = _loc14_;
               break;
            case 9:
               _loc8_ = null;
               _loc9_ = param1.buffer;
               _loc10_ = null;
               _loc24_ = null;
               _loc12_ = null;
               _loc13_ = _loc6_;
               if(_loc13_ == null)
               {
                  _loc13_ = 0;
               }
               if(_loc8_ != null)
               {
                  _loc14_ = new ArrayBufferView(_loc8_,9);
               }
               else if(_loc10_ != null)
               {
                  _loc15_ = new ArrayBufferView(0,9);
                  _loc15_.byteOffset = 0;
                  _loc15_.length = int(_loc10_.length);
                  _loc15_.byteLength = _loc15_.length * _loc15_.bytesPerElement;
                  _loc15_.buffer = Bytes.alloc(_loc15_.byteLength);
                  _loc15_.copyFromArray(_loc10_);
                  _loc14_ = _loc15_;
               }
               else if(_loc24_ != null)
               {
                  _loc15_ = new ArrayBufferView(0,9);
                  _loc16_ = _loc24_.__array;
                  _loc15_.byteOffset = 0;
                  _loc15_.length = int(_loc16_.length);
                  _loc15_.byteLength = _loc15_.length * _loc15_.bytesPerElement;
                  _loc15_.buffer = Bytes.alloc(_loc15_.byteLength);
                  _loc15_.copyFromArray(_loc16_);
                  _loc14_ = _loc15_;
               }
               else if(_loc12_ != null)
               {
                  _loc15_ = new ArrayBufferView(0,9);
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
                     throw Exception.thrown("Invalid constructor arguments for Float64Array");
                  }
                  _loc15_ = new ArrayBufferView(0,9);
                  _loc18_ = _loc13_;
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
                  if(_loc5_ == null)
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
                     _loc21_ = _loc5_ * _loc15_.bytesPerElement;
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
               _loc7_ = _loc14_;
         }
         return _loc7_;
      }
      
      public static function fromBytes(param1:Bytes, param2:Object = undefined, param3:Object = undefined) : ArrayBufferView
      {
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
         if(param2 == null)
         {
            param2 = 0;
         }
         var _loc4_:Object = null;
         var _loc5_:Array = null;
         var _loc6_:Vector.<Number> = null;
         var _loc7_:ArrayBufferView = null;
         var _loc8_:Object = param2;
         if(_loc8_ == null)
         {
            _loc8_ = 0;
         }
         if(_loc4_ != null)
         {
            _loc9_ = new ArrayBufferView(_loc4_,9);
         }
         else if(_loc5_ != null)
         {
            _loc10_ = new ArrayBufferView(0,9);
            _loc10_.byteOffset = 0;
            _loc10_.length = int(_loc5_.length);
            _loc10_.byteLength = _loc10_.length * _loc10_.bytesPerElement;
            _loc10_.buffer = Bytes.alloc(_loc10_.byteLength);
            _loc10_.copyFromArray(_loc5_);
            _loc9_ = _loc10_;
         }
         else if(_loc6_ != null)
         {
            _loc10_ = new ArrayBufferView(0,9);
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
            _loc10_ = new ArrayBufferView(0,9);
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
            if(param1 == null)
            {
               throw Exception.thrown("Invalid constructor arguments for Float64Array");
            }
            _loc10_ = new ArrayBufferView(0,9);
            _loc13_ = int(_loc8_);
            if(_loc13_ < 0)
            {
               throw Exception.thrown(TAError.RangeError);
            }
            if(int(_loc13_ % _loc10_.bytesPerElement) != 0)
            {
               throw Exception.thrown(TAError.RangeError);
            }
            _loc14_ = param1.length;
            _loc15_ = _loc10_.bytesPerElement;
            _loc16_ = _loc14_;
            if(param3 == null)
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
               _loc16_ = param3 * _loc10_.bytesPerElement;
               _loc17_ = _loc13_ + _loc16_;
               if(_loc17_ > _loc14_)
               {
                  throw Exception.thrown(TAError.RangeError);
               }
            }
            _loc10_.buffer = param1;
            _loc10_.byteOffset = _loc13_;
            _loc10_.byteLength = _loc16_;
            _loc10_.length = int(_loc16_ / _loc10_.bytesPerElement);
            _loc9_ = _loc10_;
         }
         return _loc9_;
      }
      
      public static function toBytes(param1:ArrayBufferView) : Bytes
      {
         return param1.buffer;
      }
      
      public static function get_length(param1:ArrayBufferView) : int
      {
         return param1.length;
      }
      
      public static function toString(param1:ArrayBufferView) : String
      {
         if(param1 != null)
         {
            return "Float64Array [byteLength:" + param1.byteLength + ", length:" + param1.length + "]";
         }
         return null;
      }
   }
}

