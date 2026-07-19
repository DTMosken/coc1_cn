package lime.utils._BytePointer
{
   import flash.utils.ByteArray;
   import haxe.Exception;
   import haxe.io.Bytes;
   import lime.utils.ArrayBufferView;
   import lime.utils.BytePointerData;
   import lime.utils.TAError;
   import lime.utils._Bytes.Bytes_Impl_;
   
   public final class BytePointer_Impl_
   {
      
      public function BytePointer_Impl_()
      {
      }
      
      public static function _new(param1:Bytes = undefined, param2:int = 0) : BytePointerData
      {
         return new BytePointerData(param1,param2);
      }
      
      public static function set(param1:BytePointerData, param2:Bytes = undefined, param3:ArrayBufferView = undefined, param4:Bytes = undefined, param5:Object = undefined) : void
      {
         if(param4 != null)
         {
            param2 = param4;
         }
         if(param2 != null || param3 == null)
         {
            param1.bytes = param2;
            param1.offset = param5 != null ? int(param5) : 0;
         }
         else
         {
            param1.bytes = param3.buffer;
            param1.offset = param5 != null ? int(param3.byteOffset + param5) : param3.byteOffset;
         }
      }
      
      public static function __arrayGet(param1:BytePointerData, param2:int) : int
      {
         if(param1.bytes != null)
         {
            return int(param1.bytes.b[param2 + param1.offset]);
         }
         return 0;
      }
      
      public static function __arraySet(param1:BytePointerData, param2:int, param3:int) : int
      {
         if(param1.bytes == null)
         {
            param1.bytes.b[param2 + param1.offset] = param3;
         }
         return param3;
      }
      
      public static function fromArrayBufferView(param1:ArrayBufferView) : BytePointerData
      {
         if(param1 == null)
         {
            return null;
         }
         return new BytePointerData(param1.buffer,param1.byteOffset);
      }
      
      public static function fromArrayBuffer(param1:Bytes) : BytePointerData
      {
         if(param1 == null)
         {
            return null;
         }
         return new BytePointerData(param1,0);
      }
      
      public static function fromBytes(param1:Bytes) : BytePointerData
      {
         return new BytePointerData(param1,0);
      }
      
      public static function fromBytesData(param1:ByteArray) : BytePointerData
      {
         if(param1 == null)
         {
            return new BytePointerData(null,0);
         }
         return new BytePointerData(Bytes.ofData(param1),0);
      }
      
      public static function fromFile(param1:String) : BytePointerData
      {
         return new BytePointerData(Bytes_Impl_.fromFile(param1),0);
      }
      
      public static function fromLimeBytes(param1:Bytes) : BytePointerData
      {
         return new BytePointerData(param1,0);
      }
      
      public static function toUInt8Array(param1:BytePointerData) : ArrayBufferView
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
         var _loc2_:Object = null;
         var _loc3_:Bytes = param1.bytes;
         var _loc4_:Array = null;
         var _loc5_:Vector.<int> = null;
         var _loc6_:ArrayBufferView = null;
         var _loc7_:Object = int(param1.offset / 8);
         var _loc8_:Object = null;
         if(_loc7_ == null)
         {
            _loc7_ = 0;
         }
         if(_loc2_ != null)
         {
            _loc9_ = new ArrayBufferView(_loc2_,4);
         }
         else if(_loc4_ != null)
         {
            _loc10_ = new ArrayBufferView(0,4);
            _loc10_.byteOffset = 0;
            _loc10_.length = int(_loc4_.length);
            _loc10_.byteLength = _loc10_.length * _loc10_.bytesPerElement;
            _loc10_.buffer = Bytes.alloc(_loc10_.byteLength);
            _loc10_.copyFromArray(_loc4_);
            _loc9_ = _loc10_;
         }
         else if(_loc5_ != null)
         {
            _loc10_ = new ArrayBufferView(0,4);
            _loc11_ = _loc5_.__array;
            _loc10_.byteOffset = 0;
            _loc10_.length = int(_loc11_.length);
            _loc10_.byteLength = _loc10_.length * _loc10_.bytesPerElement;
            _loc10_.buffer = Bytes.alloc(_loc10_.byteLength);
            _loc10_.copyFromArray(_loc11_);
            _loc9_ = _loc10_;
         }
         else if(_loc6_ != null)
         {
            _loc10_ = new ArrayBufferView(0,4);
            _loc12_ = _loc6_.buffer;
            _loc13_ = _loc6_.length;
            _loc14_ = _loc6_.byteOffset;
            _loc15_ = _loc6_.bytesPerElement;
            _loc16_ = _loc10_.bytesPerElement;
            if(_loc6_.type != _loc10_.type)
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
            if(_loc3_ == null)
            {
               throw Exception.thrown("Invalid constructor arguments for UInt8Array");
            }
            _loc10_ = new ArrayBufferView(0,4);
            _loc13_ = int(_loc7_);
            if(_loc13_ < 0)
            {
               throw Exception.thrown(TAError.RangeError);
            }
            if(int(_loc13_ % _loc10_.bytesPerElement) != 0)
            {
               throw Exception.thrown(TAError.RangeError);
            }
            _loc14_ = _loc3_.length;
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
            _loc10_.buffer = _loc3_;
            _loc10_.byteOffset = _loc13_;
            _loc10_.byteLength = _loc16_;
            _loc10_.length = int(_loc16_ / _loc10_.bytesPerElement);
            _loc9_ = _loc10_;
         }
         return _loc9_;
      }
      
      public static function toUInt8ClampedArray(param1:BytePointerData) : ArrayBufferView
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
         if(param1 == null || param1.bytes == null)
         {
            return null;
         }
         var _loc2_:Object = null;
         var _loc3_:Bytes = param1.bytes;
         var _loc4_:Array = null;
         var _loc5_:Vector.<int> = null;
         var _loc6_:ArrayBufferView = null;
         var _loc7_:Object = int(param1.offset / 8);
         var _loc8_:Object = null;
         if(_loc7_ == null)
         {
            _loc7_ = 0;
         }
         if(_loc2_ != null)
         {
            _loc9_ = new ArrayBufferView(_loc2_,5);
         }
         else if(_loc4_ != null)
         {
            _loc10_ = new ArrayBufferView(0,5);
            _loc10_.byteOffset = 0;
            _loc10_.length = int(_loc4_.length);
            _loc10_.byteLength = _loc10_.length * _loc10_.bytesPerElement;
            _loc10_.buffer = Bytes.alloc(_loc10_.byteLength);
            _loc10_.copyFromArray(_loc4_);
            _loc9_ = _loc10_;
         }
         else if(_loc5_ != null)
         {
            _loc10_ = new ArrayBufferView(0,5);
            _loc11_ = _loc5_.__array;
            _loc10_.byteOffset = 0;
            _loc10_.length = int(_loc11_.length);
            _loc10_.byteLength = _loc10_.length * _loc10_.bytesPerElement;
            _loc10_.buffer = Bytes.alloc(_loc10_.byteLength);
            _loc10_.copyFromArray(_loc11_);
            _loc9_ = _loc10_;
         }
         else if(_loc6_ != null)
         {
            _loc10_ = new ArrayBufferView(0,5);
            _loc12_ = _loc6_.buffer;
            _loc13_ = _loc6_.length;
            _loc14_ = _loc6_.byteOffset;
            _loc15_ = _loc6_.bytesPerElement;
            _loc16_ = _loc10_.bytesPerElement;
            if(_loc6_.type != _loc10_.type)
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
            if(_loc3_ == null)
            {
               throw Exception.thrown("Invalid constructor arguments for UInt8ClampedArray");
            }
            _loc10_ = new ArrayBufferView(0,5);
            _loc13_ = int(_loc7_);
            if(_loc13_ < 0)
            {
               throw Exception.thrown(TAError.RangeError);
            }
            if(int(_loc13_ % _loc10_.bytesPerElement) != 0)
            {
               throw Exception.thrown(TAError.RangeError);
            }
            _loc14_ = _loc3_.length;
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
            _loc10_.buffer = _loc3_;
            _loc10_.byteOffset = _loc13_;
            _loc10_.byteLength = _loc16_;
            _loc10_.length = int(_loc16_ / _loc10_.bytesPerElement);
            _loc9_ = _loc10_;
         }
         return _loc9_;
      }
      
      public static function toInt8Array(param1:BytePointerData) : ArrayBufferView
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
         if(param1 == null || param1.bytes == null)
         {
            return null;
         }
         var _loc2_:Object = null;
         var _loc3_:Bytes = param1.bytes;
         var _loc4_:Array = null;
         var _loc5_:Vector.<int> = null;
         var _loc6_:ArrayBufferView = null;
         var _loc7_:Object = int(param1.offset / 8);
         var _loc8_:Object = null;
         if(_loc7_ == null)
         {
            _loc7_ = 0;
         }
         if(_loc2_ != null)
         {
            _loc9_ = new ArrayBufferView(_loc2_,1);
         }
         else if(_loc4_ != null)
         {
            _loc10_ = new ArrayBufferView(0,1);
            _loc10_.byteOffset = 0;
            _loc10_.length = int(_loc4_.length);
            _loc10_.byteLength = _loc10_.length * _loc10_.bytesPerElement;
            _loc10_.buffer = Bytes.alloc(_loc10_.byteLength);
            _loc10_.copyFromArray(_loc4_);
            _loc9_ = _loc10_;
         }
         else if(_loc5_ != null)
         {
            _loc10_ = new ArrayBufferView(0,1);
            _loc11_ = _loc5_.__array;
            _loc10_.byteOffset = 0;
            _loc10_.length = int(_loc11_.length);
            _loc10_.byteLength = _loc10_.length * _loc10_.bytesPerElement;
            _loc10_.buffer = Bytes.alloc(_loc10_.byteLength);
            _loc10_.copyFromArray(_loc11_);
            _loc9_ = _loc10_;
         }
         else if(_loc6_ != null)
         {
            _loc10_ = new ArrayBufferView(0,1);
            _loc12_ = _loc6_.buffer;
            _loc13_ = _loc6_.length;
            _loc14_ = _loc6_.byteOffset;
            _loc15_ = _loc6_.bytesPerElement;
            _loc16_ = _loc10_.bytesPerElement;
            if(_loc6_.type != _loc10_.type)
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
            if(_loc3_ == null)
            {
               throw Exception.thrown("Invalid constructor arguments for Int8Array");
            }
            _loc10_ = new ArrayBufferView(0,1);
            _loc13_ = int(_loc7_);
            if(_loc13_ < 0)
            {
               throw Exception.thrown(TAError.RangeError);
            }
            if(int(_loc13_ % _loc10_.bytesPerElement) != 0)
            {
               throw Exception.thrown(TAError.RangeError);
            }
            _loc14_ = _loc3_.length;
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
            _loc10_.buffer = _loc3_;
            _loc10_.byteOffset = _loc13_;
            _loc10_.byteLength = _loc16_;
            _loc10_.length = int(_loc16_ / _loc10_.bytesPerElement);
            _loc9_ = _loc10_;
         }
         return _loc9_;
      }
      
      public static function toUInt16Array(param1:BytePointerData) : ArrayBufferView
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
         if(param1 == null || param1.bytes == null)
         {
            return null;
         }
         var _loc2_:Object = null;
         var _loc3_:Bytes = param1.bytes;
         var _loc4_:Array = null;
         var _loc5_:Vector.<int> = null;
         var _loc6_:ArrayBufferView = null;
         var _loc7_:Object = int(param1.offset / 16);
         var _loc8_:Object = null;
         if(_loc7_ == null)
         {
            _loc7_ = 0;
         }
         if(_loc2_ != null)
         {
            _loc9_ = new ArrayBufferView(_loc2_,6);
         }
         else if(_loc4_ != null)
         {
            _loc10_ = new ArrayBufferView(0,6);
            _loc10_.byteOffset = 0;
            _loc10_.length = int(_loc4_.length);
            _loc10_.byteLength = _loc10_.length * _loc10_.bytesPerElement;
            _loc10_.buffer = Bytes.alloc(_loc10_.byteLength);
            _loc10_.copyFromArray(_loc4_);
            _loc9_ = _loc10_;
         }
         else if(_loc5_ != null)
         {
            _loc10_ = new ArrayBufferView(0,6);
            _loc11_ = _loc5_.__array;
            _loc10_.byteOffset = 0;
            _loc10_.length = int(_loc11_.length);
            _loc10_.byteLength = _loc10_.length * _loc10_.bytesPerElement;
            _loc10_.buffer = Bytes.alloc(_loc10_.byteLength);
            _loc10_.copyFromArray(_loc11_);
            _loc9_ = _loc10_;
         }
         else if(_loc6_ != null)
         {
            _loc10_ = new ArrayBufferView(0,6);
            _loc12_ = _loc6_.buffer;
            _loc13_ = _loc6_.length;
            _loc14_ = _loc6_.byteOffset;
            _loc15_ = _loc6_.bytesPerElement;
            _loc16_ = _loc10_.bytesPerElement;
            if(_loc6_.type != _loc10_.type)
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
            if(_loc3_ == null)
            {
               throw Exception.thrown("Invalid constructor arguments for UInt16Array");
            }
            _loc10_ = new ArrayBufferView(0,6);
            _loc13_ = int(_loc7_);
            if(_loc13_ < 0)
            {
               throw Exception.thrown(TAError.RangeError);
            }
            if(int(_loc13_ % _loc10_.bytesPerElement) != 0)
            {
               throw Exception.thrown(TAError.RangeError);
            }
            _loc14_ = _loc3_.length;
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
            _loc10_.buffer = _loc3_;
            _loc10_.byteOffset = _loc13_;
            _loc10_.byteLength = _loc16_;
            _loc10_.length = int(_loc16_ / _loc10_.bytesPerElement);
            _loc9_ = _loc10_;
         }
         return _loc9_;
      }
      
      public static function toInt16Array(param1:BytePointerData) : ArrayBufferView
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
         if(param1 == null || param1.bytes == null)
         {
            return null;
         }
         var _loc2_:Object = null;
         var _loc3_:Bytes = param1.bytes;
         var _loc4_:Array = null;
         var _loc5_:Vector.<int> = null;
         var _loc6_:ArrayBufferView = null;
         var _loc7_:Object = int(param1.offset / 16);
         var _loc8_:Object = null;
         if(_loc7_ == null)
         {
            _loc7_ = 0;
         }
         if(_loc2_ != null)
         {
            _loc9_ = new ArrayBufferView(_loc2_,2);
         }
         else if(_loc4_ != null)
         {
            _loc10_ = new ArrayBufferView(0,2);
            _loc10_.byteOffset = 0;
            _loc10_.length = int(_loc4_.length);
            _loc10_.byteLength = _loc10_.length * _loc10_.bytesPerElement;
            _loc10_.buffer = Bytes.alloc(_loc10_.byteLength);
            _loc10_.copyFromArray(_loc4_);
            _loc9_ = _loc10_;
         }
         else if(_loc5_ != null)
         {
            _loc10_ = new ArrayBufferView(0,2);
            _loc11_ = _loc5_.__array;
            _loc10_.byteOffset = 0;
            _loc10_.length = int(_loc11_.length);
            _loc10_.byteLength = _loc10_.length * _loc10_.bytesPerElement;
            _loc10_.buffer = Bytes.alloc(_loc10_.byteLength);
            _loc10_.copyFromArray(_loc11_);
            _loc9_ = _loc10_;
         }
         else if(_loc6_ != null)
         {
            _loc10_ = new ArrayBufferView(0,2);
            _loc12_ = _loc6_.buffer;
            _loc13_ = _loc6_.length;
            _loc14_ = _loc6_.byteOffset;
            _loc15_ = _loc6_.bytesPerElement;
            _loc16_ = _loc10_.bytesPerElement;
            if(_loc6_.type != _loc10_.type)
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
            if(_loc3_ == null)
            {
               throw Exception.thrown("Invalid constructor arguments for Int16Array");
            }
            _loc10_ = new ArrayBufferView(0,2);
            _loc13_ = int(_loc7_);
            if(_loc13_ < 0)
            {
               throw Exception.thrown(TAError.RangeError);
            }
            if(int(_loc13_ % _loc10_.bytesPerElement) != 0)
            {
               throw Exception.thrown(TAError.RangeError);
            }
            _loc14_ = _loc3_.length;
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
            _loc10_.buffer = _loc3_;
            _loc10_.byteOffset = _loc13_;
            _loc10_.byteLength = _loc16_;
            _loc10_.length = int(_loc16_ / _loc10_.bytesPerElement);
            _loc9_ = _loc10_;
         }
         return _loc9_;
      }
      
      public static function toUInt32Array(param1:BytePointerData) : ArrayBufferView
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
         if(param1 == null || param1.bytes == null)
         {
            return null;
         }
         var _loc2_:Object = null;
         var _loc3_:Bytes = param1.bytes;
         var _loc4_:Array = null;
         var _loc5_:Vector.<int> = null;
         var _loc6_:ArrayBufferView = null;
         var _loc7_:Object = int(param1.offset / 32);
         var _loc8_:Object = null;
         if(_loc7_ == null)
         {
            _loc7_ = 0;
         }
         if(_loc2_ != null)
         {
            _loc9_ = new ArrayBufferView(_loc2_,7);
         }
         else if(_loc4_ != null)
         {
            _loc10_ = new ArrayBufferView(0,7);
            _loc10_.byteOffset = 0;
            _loc10_.length = int(_loc4_.length);
            _loc10_.byteLength = _loc10_.length * _loc10_.bytesPerElement;
            _loc10_.buffer = Bytes.alloc(_loc10_.byteLength);
            _loc10_.copyFromArray(_loc4_);
            _loc9_ = _loc10_;
         }
         else if(_loc5_ != null)
         {
            _loc10_ = new ArrayBufferView(0,7);
            _loc11_ = _loc5_.__array;
            _loc10_.byteOffset = 0;
            _loc10_.length = int(_loc11_.length);
            _loc10_.byteLength = _loc10_.length * _loc10_.bytesPerElement;
            _loc10_.buffer = Bytes.alloc(_loc10_.byteLength);
            _loc10_.copyFromArray(_loc11_);
            _loc9_ = _loc10_;
         }
         else if(_loc6_ != null)
         {
            _loc10_ = new ArrayBufferView(0,7);
            _loc12_ = _loc6_.buffer;
            _loc13_ = _loc6_.length;
            _loc14_ = _loc6_.byteOffset;
            _loc15_ = _loc6_.bytesPerElement;
            _loc16_ = _loc10_.bytesPerElement;
            if(_loc6_.type != _loc10_.type)
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
            if(_loc3_ == null)
            {
               throw Exception.thrown("Invalid constructor arguments for UInt32Array");
            }
            _loc10_ = new ArrayBufferView(0,7);
            _loc13_ = int(_loc7_);
            if(_loc13_ < 0)
            {
               throw Exception.thrown(TAError.RangeError);
            }
            if(int(_loc13_ % _loc10_.bytesPerElement) != 0)
            {
               throw Exception.thrown(TAError.RangeError);
            }
            _loc14_ = _loc3_.length;
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
            _loc10_.buffer = _loc3_;
            _loc10_.byteOffset = _loc13_;
            _loc10_.byteLength = _loc16_;
            _loc10_.length = int(_loc16_ / _loc10_.bytesPerElement);
            _loc9_ = _loc10_;
         }
         return _loc9_;
      }
      
      public static function toInt32Array(param1:BytePointerData) : ArrayBufferView
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
         if(param1 == null || param1.bytes == null)
         {
            return null;
         }
         var _loc2_:Object = null;
         var _loc3_:Bytes = param1.bytes;
         var _loc4_:Array = null;
         var _loc5_:Vector.<int> = null;
         var _loc6_:ArrayBufferView = null;
         var _loc7_:Object = int(param1.offset / 32);
         var _loc8_:Object = null;
         if(_loc7_ == null)
         {
            _loc7_ = 0;
         }
         if(_loc2_ != null)
         {
            _loc9_ = new ArrayBufferView(_loc2_,3);
         }
         else if(_loc4_ != null)
         {
            _loc10_ = new ArrayBufferView(0,3);
            _loc10_.byteOffset = 0;
            _loc10_.length = int(_loc4_.length);
            _loc10_.byteLength = _loc10_.length * _loc10_.bytesPerElement;
            _loc10_.buffer = Bytes.alloc(_loc10_.byteLength);
            _loc10_.copyFromArray(_loc4_);
            _loc9_ = _loc10_;
         }
         else if(_loc5_ != null)
         {
            _loc10_ = new ArrayBufferView(0,3);
            _loc11_ = _loc5_.__array;
            _loc10_.byteOffset = 0;
            _loc10_.length = int(_loc11_.length);
            _loc10_.byteLength = _loc10_.length * _loc10_.bytesPerElement;
            _loc10_.buffer = Bytes.alloc(_loc10_.byteLength);
            _loc10_.copyFromArray(_loc11_);
            _loc9_ = _loc10_;
         }
         else if(_loc6_ != null)
         {
            _loc10_ = new ArrayBufferView(0,3);
            _loc12_ = _loc6_.buffer;
            _loc13_ = _loc6_.length;
            _loc14_ = _loc6_.byteOffset;
            _loc15_ = _loc6_.bytesPerElement;
            _loc16_ = _loc10_.bytesPerElement;
            if(_loc6_.type != _loc10_.type)
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
            if(_loc3_ == null)
            {
               throw Exception.thrown("Invalid constructor arguments for Int32Array");
            }
            _loc10_ = new ArrayBufferView(0,3);
            _loc13_ = int(_loc7_);
            if(_loc13_ < 0)
            {
               throw Exception.thrown(TAError.RangeError);
            }
            if(int(_loc13_ % _loc10_.bytesPerElement) != 0)
            {
               throw Exception.thrown(TAError.RangeError);
            }
            _loc14_ = _loc3_.length;
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
            _loc10_.buffer = _loc3_;
            _loc10_.byteOffset = _loc13_;
            _loc10_.byteLength = _loc16_;
            _loc10_.length = int(_loc16_ / _loc10_.bytesPerElement);
            _loc9_ = _loc10_;
         }
         return _loc9_;
      }
      
      public static function toFloat32Array(param1:BytePointerData) : ArrayBufferView
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
         if(param1 == null || param1.bytes == null)
         {
            return null;
         }
         var _loc2_:Object = null;
         var _loc3_:Bytes = param1.bytes;
         var _loc4_:Array = null;
         var _loc5_:Vector.<Number> = null;
         var _loc6_:ArrayBufferView = null;
         var _loc7_:Object = int(param1.offset / 32);
         var _loc8_:Object = null;
         if(_loc7_ == null)
         {
            _loc7_ = 0;
         }
         if(_loc2_ != null)
         {
            _loc9_ = new ArrayBufferView(_loc2_,8);
         }
         else if(_loc4_ != null)
         {
            _loc10_ = new ArrayBufferView(0,8);
            _loc10_.byteOffset = 0;
            _loc10_.length = int(_loc4_.length);
            _loc10_.byteLength = _loc10_.length * _loc10_.bytesPerElement;
            _loc10_.buffer = Bytes.alloc(_loc10_.byteLength);
            _loc10_.copyFromArray(_loc4_);
            _loc9_ = _loc10_;
         }
         else if(_loc5_ != null)
         {
            _loc10_ = new ArrayBufferView(0,8);
            _loc11_ = _loc5_.__array;
            _loc10_.byteOffset = 0;
            _loc10_.length = int(_loc11_.length);
            _loc10_.byteLength = _loc10_.length * _loc10_.bytesPerElement;
            _loc10_.buffer = Bytes.alloc(_loc10_.byteLength);
            _loc10_.copyFromArray(_loc11_);
            _loc9_ = _loc10_;
         }
         else if(_loc6_ != null)
         {
            _loc10_ = new ArrayBufferView(0,8);
            _loc12_ = _loc6_.buffer;
            _loc13_ = _loc6_.length;
            _loc14_ = _loc6_.byteOffset;
            _loc15_ = _loc6_.bytesPerElement;
            _loc16_ = _loc10_.bytesPerElement;
            if(_loc6_.type != _loc10_.type)
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
            if(_loc3_ == null)
            {
               throw Exception.thrown("Invalid constructor arguments for Float32Array");
            }
            _loc10_ = new ArrayBufferView(0,8);
            _loc13_ = int(_loc7_);
            if(_loc13_ < 0)
            {
               throw Exception.thrown(TAError.RangeError);
            }
            if(int(_loc13_ % _loc10_.bytesPerElement) != 0)
            {
               throw Exception.thrown(TAError.RangeError);
            }
            _loc14_ = _loc3_.length;
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
            _loc10_.buffer = _loc3_;
            _loc10_.byteOffset = _loc13_;
            _loc10_.byteLength = _loc16_;
            _loc10_.length = int(_loc16_ / _loc10_.bytesPerElement);
            _loc9_ = _loc10_;
         }
         return _loc9_;
      }
      
      public static function toFloat64Array(param1:BytePointerData) : ArrayBufferView
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
         if(param1 == null || param1.bytes == null)
         {
            return null;
         }
         var _loc2_:Object = null;
         var _loc3_:Bytes = param1.bytes;
         var _loc4_:Array = null;
         var _loc5_:Vector.<Number> = null;
         var _loc6_:ArrayBufferView = null;
         var _loc7_:Object = int(param1.offset / 64);
         var _loc8_:Object = null;
         if(_loc7_ == null)
         {
            _loc7_ = 0;
         }
         if(_loc2_ != null)
         {
            _loc9_ = new ArrayBufferView(_loc2_,9);
         }
         else if(_loc4_ != null)
         {
            _loc10_ = new ArrayBufferView(0,9);
            _loc10_.byteOffset = 0;
            _loc10_.length = int(_loc4_.length);
            _loc10_.byteLength = _loc10_.length * _loc10_.bytesPerElement;
            _loc10_.buffer = Bytes.alloc(_loc10_.byteLength);
            _loc10_.copyFromArray(_loc4_);
            _loc9_ = _loc10_;
         }
         else if(_loc5_ != null)
         {
            _loc10_ = new ArrayBufferView(0,9);
            _loc11_ = _loc5_.__array;
            _loc10_.byteOffset = 0;
            _loc10_.length = int(_loc11_.length);
            _loc10_.byteLength = _loc10_.length * _loc10_.bytesPerElement;
            _loc10_.buffer = Bytes.alloc(_loc10_.byteLength);
            _loc10_.copyFromArray(_loc11_);
            _loc9_ = _loc10_;
         }
         else if(_loc6_ != null)
         {
            _loc10_ = new ArrayBufferView(0,9);
            _loc12_ = _loc6_.buffer;
            _loc13_ = _loc6_.length;
            _loc14_ = _loc6_.byteOffset;
            _loc15_ = _loc6_.bytesPerElement;
            _loc16_ = _loc10_.bytesPerElement;
            if(_loc6_.type != _loc10_.type)
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
            if(_loc3_ == null)
            {
               throw Exception.thrown("Invalid constructor arguments for Float64Array");
            }
            _loc10_ = new ArrayBufferView(0,9);
            _loc13_ = int(_loc7_);
            if(_loc13_ < 0)
            {
               throw Exception.thrown(TAError.RangeError);
            }
            if(int(_loc13_ % _loc10_.bytesPerElement) != 0)
            {
               throw Exception.thrown(TAError.RangeError);
            }
            _loc14_ = _loc3_.length;
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
            _loc10_.buffer = _loc3_;
            _loc10_.byteOffset = _loc13_;
            _loc10_.byteLength = _loc16_;
            _loc10_.length = int(_loc16_ / _loc10_.bytesPerElement);
            _loc9_ = _loc10_;
         }
         return _loc9_;
      }
   }
}

